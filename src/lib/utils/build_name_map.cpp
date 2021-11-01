#include "lib/utils/build_name_map.h"

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wstrict-aliasing"
// pragam'ed to aviod warnings due to llvm included files
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/DIBuilder.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/AsmParser/Parser.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Analysis/CFGPrinter.h"
#include "llvm/Passes/PassBuilder.h"
#pragma GCC diagnostic pop

char build_name_map::ID = 0;

build_name_map::build_name_map( //value_expr_map& def_map_,
                               options& o_,
                                name_map& lMap,
                       std::map< const bb*, rev_name_map >& revStartLocalNameMap_,
                       std::map< const bb*, rev_name_map >& revEndLocalNameMap_ )
  : llvm::FunctionPass(ID)
  , o(o_)
  , revStartLocalNameMap( revStartLocalNameMap_ )
  , revEndLocalNameMap( revEndLocalNameMap_ )
  , localNameMap(lMap)
  // , def_map(def_map_)
{}

build_name_map::~build_name_map() {}

bool build_name_map::runOnFunction( llvm::Function &f ) {
  buildNameMap(f, localNameMap);
  buildRevNameMap( f );
  // buildParamExpr( f );
  return false;
}

void build_name_map::buildNameMap( llvm::Function& f,
                                   name_map& localNameMap) {
 // std::map<std::string, llvm::Value*>& nameValueMap) {
  //  std::cout << "Inside buildNameMap\n";
  //  localNameMap.clear();
  //  nameValueMap.clear();
  for( llvm::inst_iterator iter(f),end(f,true); iter != end; ++iter ) {
    llvm::Instruction* I = &*iter;
    llvm::Value* var = NULL;
    llvm::MDNode* md = NULL;
    std::string str;
    if( llvm::DbgDeclareInst* dDecl =
        llvm::dyn_cast<llvm::DbgDeclareInst>(I) ) {
      var = dDecl->getAddress();
      md = dDecl->getVariable();
      llvm::DIVariable* diMd = llvm::dyn_cast<llvm::DIVariable>(md);
      str = (std::string)( diMd->getName() );
//      std::cout << "Got the name:" << str << "\n";
    } else if( llvm::DbgValueInst* dVal =
               llvm::dyn_cast<llvm::DbgValueInst>(I)) {
      var = dVal->getValue();
      md = dVal->getVariable();
      llvm::DIVariable* diMd = llvm::dyn_cast<llvm::DIVariable>(md);
      str = (std::string)( diMd->getName() );
      if( llvm::isa<llvm::Constant>(var) ) {
        var = dVal;
      }
//      std::cout << "Got the name:" << str << "\n";
    }
    if( var ) {
      // if var is non-null add the name to the map
      localNameMap[var] = str;
      //      nameValueMap[str] = var;
//to look at the scope field
// check if there has been a declaration with same name with different
// line number
//        auto it = declarationLocationMap.find( str );
//        if( it == declarationLocationMap.end() ) {
//          declarationLocationMap[str] = lineNum;
//          localNameMap[var] = str;
//          nameValueMap[str] = var;
//        }else if( it->second == lineNum ) {
//          localNameMap[var] = str;
//          nameValueMap[str] = var;
//        }else{
//          localNameMap[var] = str + "_at_"+ std::to_string( lineNum );
//          nameValueMap[str] = var;
//        }
    }
  }

  //Extend names to phiNodes
  for( auto& b: f.getBasicBlockList() ) {
    for( llvm::BasicBlock::iterator I = b.begin(); llvm::isa<llvm::PHINode>(I); ++I) {
      llvm::PHINode *phi = llvm::cast<llvm::PHINode>(I);
      if( localNameMap.find(phi) != localNameMap.end() ) continue;
      unsigned num = phi->getNumIncomingValues();
      std::string name;
      bool found = false;
      for ( unsigned i = 0 ; i < num ; i++ ) {
        llvm::Value *v = phi->getIncomingValue(i);
        if(llvm::Instruction *inI = llvm::dyn_cast<llvm::Instruction>(v)) {
          if( localNameMap.find(inI) != localNameMap.end() ) {
            if( found && name != localNameMap.at(inI) ) {
              if( o.verbosity > 8 ) {
                //todo: warning needs to be dropped.
                auto new_name = localNameMap.at(inI);
                auto warning_msg = "phi node has multiple names!!"+name+","+new_name;
                llvm_bmc_warning("build name map::", warning_msg);
              }
            }
            name = localNameMap.at(inI);
            found = true;
          }
        }
      }
      if( !found ) {
        // b.dump();
        // phi->dump();
        // If this function fails, investigate to find the (correct) name
        // llvm_bmc_warning("build name map::","name of a phi node not found!!");
      }else{
        localNameMap[phi] = name;
      }
    }
  }
}


void build_name_map::buildRevNameMap( llvm::Function &f ) {
  bb_vec_t bb_vec;
  std::map< const bb*, unsigned> block_to_id;        // useless
  std::map< const bb*, bb_set_t > loop_ignore_edges; // useless
  std::map< const bb*, bb_set_t > rev_loop_ignore_edges;
  collect_loop_backedges(this, loop_ignore_edges, rev_loop_ignore_edges);
  computeTopologicalOrder(f, rev_loop_ignore_edges, bb_vec, block_to_id);

  for( auto b : bb_vec ) {
    std::map<std::string, const llvm::Value*> start_map;
    std::set< std::string > conflicted_names;
    if( b == &f.getEntryBlock()) {
      auto module = f.getParent();
      for( auto iter_g = module->global_begin(),end_g = module->global_end();
           iter_g != end_g; ++iter_g ) {
        llvm::GlobalVariable* glb = &*iter_g;
        auto name = (std::string)(glb->getName());
        start_map[name] = glb;
      }
      // process input parameters
      for( auto ab = f.arg_begin(), ae = f.arg_end(); ab != ae; ab++) {
        llvm::Value* x = &*ab;
        std::string name = (std::string)(x->getName());
        start_map[name] = x;
      }
    }else{
      for(auto PI = llvm::pred_begin(b),E = llvm::pred_end(b);PI != E;++PI) {
        const llvm::BasicBlock* prev = *PI;
        if( exists( loop_ignore_edges, b ) ) {
          if( exists( loop_ignore_edges.at( b ), prev) ) continue;
        }
        if( revEndLocalNameMap.find(prev) != revEndLocalNameMap.end() ) {
          for( auto& pair: revEndLocalNameMap.at(prev) ) {
            std::string name = pair.first;
            const llvm::Value* v = pair.second;
            if( conflicted_names.find( name ) != conflicted_names.end() )
              continue;
            if( start_map.find( name ) != start_map.end() ) {
              if( v != start_map.at(name) ) {
                conflicted_names.insert( name );
                start_map.erase(name); // not needed really
              }
            }else{
              start_map[name] = v;
            }
          }
        }
      }
      for( auto I = b->begin(); llvm::isa<llvm::PHINode>(I); ++I ) {
        const llvm::PHINode *phi = llvm::cast<llvm::PHINode>(I);
        std::string name = localNameMap[phi];
        conflicted_names.erase(name);
        start_map[name] = phi;
      }
    }

    revStartLocalNameMap[b] = start_map;
    for( auto I = b->begin(); I != b->end(); ++I ) {
      if ( llvm::isa<llvm::PHINode>(I) ) continue;
      auto* Ip = llvm::cast<llvm::Instruction>(I);
      if( localNameMap.find(Ip) != localNameMap.end() ) {
        std::string name = localNameMap[Ip];
        if( auto* dVal = llvm::dyn_cast<llvm::DbgValueInst>(Ip) ) {
          assert( llvm::isa<llvm::Constant>( dVal->getValue() ) );
          start_map[name]  = dVal->getValue();
        }else{
          start_map[name] = Ip;
        }
        conflicted_names.erase(name);
      }
    }
    // assert( conflicted_names.empty() );
    revEndLocalNameMap[b] = start_map;
  }
}

// void build_name_map::buildParamExpr( llvm::Function &f ) {
//   for( auto ab = f.arg_begin(), ae = f.arg_end(); ab != ae; ab++) {
//     def_map.get_term( &(*ab) );
//   }
// }

llvm::StringRef build_name_map::getPassName() const {
  return "Builds the llvm::Value to name string map for all functions";
}

void build_name_map::getAnalysisUsage(llvm::AnalysisUsage &au) const {
  au.setPreservesAll();
  au.addRequired<llvm::LoopInfoWrapperPass>();
}
