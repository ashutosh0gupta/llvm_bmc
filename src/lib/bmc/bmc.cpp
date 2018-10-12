#include "include/bmc.h"
#include "lib/bmc/bmc_fun_pass.h"
#include "lib/bmc/bmc_loop_pass.h"
#include "lib/utils/build_name_map.h"
#include "lib/utils/collect_loopdata.h"
#include "lib/utils/llvm_utils.h"
// #include "lib/bmc/bmc_loop_pass.h"
#include "bmc_utils.h"
#include "witness.h"

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunused-parameter"
// pragam'ed to aviod warnings due to llvm included files
#include "llvm/Transforms/IPO/AlwaysInliner.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Analysis/CFGPrinter.h"
#pragma GCC diagnostic pop


bmc::bmc( std::unique_ptr<llvm::Module>& m_,
          std::map<const bb*, comments >& bb_comment_map_,
          options& o_)
    : o(o_)
    // , solver_ctx(o_.solver_ctx)
    , def_map(o_)
    , module(m_)
    , bb_comment_map( bb_comment_map_ )
    , m_model(o_.solver_ctx)
{}

bmc::~bmc() {
  for( auto& it: func_formula_map ) {
    delete it.second;
  }
  for( auto& it: loop_formula_map ) {
    delete it.second;
  }
  for( auto& it: ld_map ) {
    delete it.second;
  }
}

void bmc::run_bmc_pass() {
  llvm::legacy::PassManager passMan;
  passMan.add( new build_name_map( localNameMap, revStartLocalNameMap,
                                   revEndLocalNameMap ) );
  passMan.add( new collect_loopdata(o, ld_map, localNameMap, module) );

  if(o.loop_aggr) {
    passMan.add( new bmc_loop_pass(o,o.solver_ctx, def_map, *this));
  } else {
    passMan.add( new bmc_fun_pass(o, o.solver_ctx,*this));
  }
  passMan.run( *module.get() );
}


std::map< const llvm::Function*, bmc_fun*>& bmc::get_func_formula_map() {
  return func_formula_map;
}

std::map< const llvm::Loop*, bmc_loop*>& bmc::get_loop_formula_map() {
  return loop_formula_map;
}


void bmc::init() {
  memory_state mem_st = populate_mem_state();

  for (auto fit=module->begin(), endit=module->end(); fit!=endit; ++fit) {
    std::string fname = demangle(fit->getName().str());
    if(fname == o.funcName) {
      // TODO : Is 0 the correct block number?
      m_model.store_state_map[0] = mem_st;
    }else{
      // all non entry functions are already inlined
    }
  }
}

memory_state bmc::populate_mem_state() {
  memory_state mem_st;
  // TODO : Add setter and getters
  auto& vec = mem_st.mem_state_vec;

  int glbCntr = 0;
  for( auto iter_glb= module->global_begin(),end_glb = module->global_end();
       iter_glb != end_glb; ++iter_glb ) {

    llvm::GlobalVariable* glb = &*iter_glb; //3.8
    llvm::Type* ty = glb->getType();
    //const std::string gvar = (std::string)(glb->getName());

    if( auto pty = llvm::dyn_cast<llvm::PointerType>(ty) ) {
      assert(pty);
      auto el_ty = pty->getElementType();
      assert(el_ty);

      if(el_ty->isArrayTy()) continue;

      m_model.ind_in_mem_state[glb] = glbCntr;

      sort z_sort = llvm_to_sort( o, el_ty);

      auto new_glb = m_model.get_fresh_name(z_sort, glb->getName());

      datatype ty(z_sort);
      state_obj tem_state_obj(new_glb,ty);
      vec.push_back(tem_state_obj);

      if( glb->hasUniqueInitializer() ) {
        auto c = glb->getInitializer();
        // auto val = get_term( solver_ctx, c, m );
        auto val = read_const( o, c );
        glb_bmc_vec.push_back(new_glb == val);
      } else {} // do nothing
    } else {
      llvm_bmc_error("bmc", (std::string)(glb->getName()) << " not a global pointer!");
    }
    glbCntr++;
  }
  return mem_st;
}

// void bmc::eliminate_vars(bmc_ds* bmc_ds_ptr) {
//   expr bmc_f = _and(bmc_ds_ptr->bmc_vec);
//   eliminate_vars( bmc_f, bmc_ds_ptr->quant_elim_vars, bmc_ds_ptr->bmc_vec );
// }

void bmc::check_all_spec( bmc_ds* bmc_ds_ptr ) {
  std::ostream& os = std::cout;
  for(spec s : bmc_ds_ptr->spec_vec) {
    expr prop = s.get_formula();
    if( run_solver( prop, bmc_ds_ptr) ) {
      os << "\nSpecification that failed the check : \n";
      s.print( os );
      os << "\n\nLLVM_BMC_VERIFICATION_FAILED\n\n";
      return;
    } else { } // contine with other specifications
  }
  os << "\n\nLLVM_BMC_VERIFICATION_SUCCESSFUL\n\n";
}

bool bmc::run_solver(expr &spec, bmc_ds* bmc_ds_ptr) {
  z3::solver s(o.solver_ctx);
  for(expr e : bmc_ds_ptr->bmc_vec) {
    s.add(e);
  }
  s.add(!spec);
  if (s.check() == z3::sat) {
    model m = s.get_model();
    produce_witness(m, bmc_ds_ptr);
    return true;
  } else {
    return false;
  }
}


std::string
bmc::get_val_for_instruction( const llvm::Instruction* I, model& mdl,
                              std::map<std::string,std::string>& state,
                              bmc_ds* bmc_ds_ptr, unsigned call_count ) {
  assert(bmc_ds_ptr);
  std::string v;
  unsigned copy_count = 0;
  auto val = bmc_ds_ptr->m.read_term( I, copy_count );
  if( val ) {
    // auto it = bmc_ds_ptr->m.find( {I,copy_count} );
    // if( it != bmc_ds_ptr->m.end() ) {
    //   auto val = mdl.eval( it->second );
    // std::cout << val << "\n";
    v = to_string( val );
    auto it_d = bmc_ds_ptr->dbg_name_map.find( I );
    if( it_d != bmc_ds_ptr->dbg_name_map.end() ) {
      std::string vname = it_d->second;
      state[vname] = v;
      v = vname + " = " + v;
    }
  }
  return v;
}

std::string state_to_string( std::map<std::string,std::string>& state ) {
  std::string s = "["; bool first = true;
  for( auto& pair : state ) {
    if( first ) {
      first = false;
    }else{
      s = s + ", ";
    }
    s = s + "\"" + pair.first + " = " + pair.second  + "\"";
  }
  return s+"]";
}

void bmc::produce_witness_call( model mdl, const llvm::CallInst* call ) {
  assert(call);
  if( ignore_special_functions( call ) ) return;
  if( llvm::cast<llvm::IntrinsicInst>(call) ) {
    // ignore
  }else if( ignore_special_functions( call ) ) {
    // ignore
  }else{
    llvm::Function* fp = call->getCalledFunction();
    if( fp != NULL ) {
      bmc_fun* called_fun = func_formula_map[call->getCalledFunction()];
      assert(called_fun && "Called function is null in produce witness");
      unsigned call_count = called_fun->get_call_count( call );
      produce_witness( mdl, called_fun, call_count );
    }else{
      llvm_bmc_error( "bmc", "unknown function called" );
    }
  }
}

void bmc::produce_witness( model mdl, bmc_ds* bmc_ds_ptr,
                           unsigned call_count ) {
  assert( bmc_ds_ptr );

  witness w(o);
  std::map<std::string,std::string> state;
  unsigned bidx =0;
  for( auto b : bmc_ds_ptr->bb_vec ) {
    expr path_bit = bmc_ds_ptr->get_path_bit(bidx);
    // expr path_bit = bmc_ds_ptr->block_to_path_bit.at(b);
    if( is_true( path_bit, mdl ) ) {
      if( o.verbosity > 6 ) {
        std::cout << "-------------------------------------------\n";
        std::cout << "dumping block:" << getLocRange( b ) << "\n";
      }
      for( const llvm::Instruction& Iobj : b->getInstList() ) {
        const llvm::Instruction* I = &(Iobj);
        if( auto call = llvm::dyn_cast<llvm::CallInst>(I) ) {
          produce_witness_call( mdl, call );
        }
        // if( bmc_ds_ptr->m.find({I,0}) == bmc_ds_ptr->m.end() ) continue;
        if( bmc_ds_ptr->m.read_term( I, 0 ) ) {} else continue;
        auto val = get_val_for_instruction( I, mdl, state, bmc_ds_ptr, call_count );
        std::string s = state_to_string( state );
        auto loc = getLoc(I);
        w.add( loc, val, s, bidx, 0 );
        if( o.verbosity > 6 ) {
          I->print( llvm::outs() );
          if( val != "" ) std::cout << "~~~~~~>" << val << "|";
          loc.print( std::cout );
          std::cout << "\n";
        }
      }
      // b->print( llvm::outs() );
    }
    bidx++;
  }
  // w.show_path();
  w.generate_html();
}
