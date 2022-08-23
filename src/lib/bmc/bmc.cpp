#include "include/bmc.h"
#include "lib/bmc/bmc_fun_pass.h"
#include "lib/bmc/bmc_loop_pass.h"
#include "lib/utils/build_name_map.h"
#include "lib/utils/collect_loopdata.h"
#include "lib/utils/llvm_utils.h"
// #include "lib/bmc/bmc_loop_pass.h"
#include "include/collect_globals.h"
#include "bmc_utils.h"
#include "witness.h"

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunused-parameter"
// pragam'ed to aviod warnings due to llvm included files
#include "llvm/Transforms/IPO/AlwaysInliner.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Analysis/CFGPrinter.h"
#include "llvm/Analysis/InlineCost.h"
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

// void forced_inliner_pass() {
//   for(auto fit = module->begin(), endit = module->end(); fit != endit; ++fit) {
//     // todo: remove dependency on demangle from llvm_utils
//     std::string fname = demangle(fit->getName().str());
//     if( !fit->isDeclaration() ) {
//       // function has a body available
//       fit->addFnAttr(llvm::Attribute::AlwaysInline);
//       //To ensure all functions are inlined even if the personalities do not match
//       llvm::Constant *FnPersonality = nullptr;
//       fit->setPersonalityFn(FnPersonality);
//     }
//   }

//   // force inline
//   llvm::legacy::PassManager inline_passMan;
//   inline_passMan.add( llvm::createAlwaysInlinerLegacyPass() );
//   inline_passMan.run( *module.get() );
// }

void bmc::run_bmc_pass() {


  llvm::legacy::PassManager passMan;

  passMan.add( new build_name_map( o, localNameMap, revStartLocalNameMap,
                                   revEndLocalNameMap ) );
  passMan.add( new collect_loopdata(o, ld_map, localNameMap, module) );

  // //if( o.concurrent )
  passMan.add( new collect_globals_pass(*module.get(), o.solver_ctx, o.mem_enc, o, *this) );

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

    if (o.check_spec) {
	for (auto j = thread_list.begin(); j != thread_list.end(); j++) {
	        std::string EntryFn = j->second;
		if (fname == EntryFn) {
	  		m_model.store_state_map[0] = mem_st;
    		}
    	}
    }
    else {
    if(fname == o.funcName) {
      // TODO : Is 0 the correct block number?
      m_model.store_state_map[0] = mem_st;
    }else{
      // all non entry functions are already inlined
    }
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

      auto new_glb = m_model.get_fresh_name(z_sort, glb->getName().str());

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
    if( o.verbosity > 3 ) {
      os << "Solving for specification\n";
      s.print( os );
    }
    // expr prop = s.get_formula();
    if( run_solver( s, bmc_ds_ptr) ) {
      return;
    } else { } // contine with other specifications
  }
  os << "\n\nLLVM_BMC_VERIFICATION_SUCCESSFUL\n\n";
}

bool bmc::run_solver(spec &spec, bmc_ds* bmc_ds_ptr) {
  std::ostream& os = std::cout;

  /* params p(o.solver_ctx);
  //p.set("mul2concat", true);
  tactic t = 
        tactic(o.solver_ctx, "simplify") &
        tactic(o.solver_ctx, "solve-eqs") &
        tactic(o.solver_ctx, "elim-term-ite") &
        tactic(o.solver_ctx, "fpa2bv") &
        tactic(o.solver_ctx, "aig") &
        tactic(o.solver_ctx, "bvarray2uf") &
	tactic(o.solver_ctx, "ctx_simplify") &
        tactic(o.solver_ctx, "psmt"); 
  solver s = t.mk_solver();
  z3::set_param("parallel.enable", true); */

  // setup solver
  solver s(o.solver_ctx);

  // adding pre conditions
  for(auto& pre : bmc_ds_ptr->pre_cond_vec) {
    s.add( pre.get_formula() );
  }

  //add function encoding
  for(expr e : bmc_ds_ptr->bmc_vec) {
    s.add(e);
  }

  //add assertion
  s.add( !spec.get_formula() );

  //
  // todo: optimization other specs can be added as assume
  //

  if( o.dump_solver_query ) {
    dump( o.outDirPath.string(), "test.smt2", s);
    // std::cout << s;
  }
  //

  
  // if( o.use_solver == "z3" ) {
  //   // solving
  //   auto result = s.check();
  //   if( result == z3::sat ) {
  //     model m = s.get_model();
  //     //produce_witness(m, bmc_ds_ptr);
  //     os << "\nSpecification that failed the check : \n";
  //     spec.print( os );
  //     os << "\n\nLLVM_BMC_VERIFICATION_FAILED\n\n";
  //   return true;
  //   } else if( result == z3::unknown ){
  //     os << "\n\nLLVM_BMC_VERIFICATION_INCONCLUSIVE\n\n";
  //     return true;
  //   }else {
  //     return false;
  //   }
  // }else if( o.use_solver == "cvc5" ) {
  //   // dump( o.outDirPath.string(), "test.smt2", s );
  //   check_cvc5(s,o.outDirPath.string(),o.get_model);
  //   // do some thing
  // }else if( o.use_solver == "boolector" ) {
  //   check_boolector(s,o.outDirPath.string(),o.get_model);
  // }else{
  //   llvm_bmc_error( "bmc", "no solver identified!!" );
  //   return false;// dummy return
  // }

  check_result result;
  Z3CompClass z3compObj;
  if( o.use_solver == "z3" ) {
    result = s.check();
  }else if( o.use_solver == "cvc5" ) {
    // dump( o.outDirPath.string(), "test.smt2", s );
    result = z3compObj.check_cvc5( s, o.outDirPath.string(), o.get_solver_model );
    // do some thing
  }else if( o.use_solver == "boolector" ) {
    result = z3compObj.check_boolector( s, o.outDirPath.string(), o.get_solver_model );
  }else{
    llvm_bmc_error( "bmc", "no solver identified!!" );
    return false;// dummy return
  }
  if( result == z3::sat && o.witness == 1 ) {
    model m(o.solver_ctx);
    if( o.use_solver == "z3" ) {
      m = s.get_model();
    }else if( o.use_solver == "cvc5" ) {
      m = z3compObj.get_cvc5_model();
      std::cout<< "\nPrinting cvc5 model with witness\n";
      std::cout << m;
    }else if( o.use_solver == "boolector" ) {
      m = z3compObj.get_boolector_model();
      std::cout<< "\nPrinting boolector model with witness\n";
      std::cout << m;
    }else{
      llvm_bmc_error( "bmc", "no solver identified!!" );
    }
    produce_witness(m, bmc_ds_ptr);
  }

  // report if specification check is failed or not
  if( result == z3::sat ) {
    os << "\nSpecification that failed the check : \n";
    spec.print( os );
    os << "\n\nLLVM_BMC_VERIFICATION_FAILED\n\n";
    return true;
  } else if( result == z3::unknown ){
    os << "\n\nLLVM_BMC_VERIFICATION_INCONCLUSIVE\n\n";
    return true;
  }else {
    return false;
  }

}


bool bmc::is_file_exist(std::string fileName)
{
    std::ifstream infile(fileName);
    return infile.good();
}

// bool bmc::verify_prop() {
//   std::ostream& os = std::cout;
//   z3::solver s(o.solver_ctx);
//   for(expr e : prop) {
//     s.add(!e);
//     auto result = s.check();
//     if ( result == z3::sat || result == z3::unknown ) {
//       os << "\nSpecification that failed the check : \n";
//       os << e;
//       if( result == z3::sat ) {
//         os << "\n\nLLVM_BMC_VERIFICATION_FAILED\n\n";
//       }else{
//         os << "\n\nLLVM_BMC_VERIFICATION_INCONCLUSIVE\n\n";
//       }
//       return false;
//     } else {} // contine with other specifications
//   }
//   os << "\n\nLLVM_BMC_VERIFICATION_SUCCESSFUL\n\n";
//   return true;    
// }


//-----------------------------------------------------------------------------
//
// Witness management
//

std::string
bmc::get_val_for_instruction( const llvm::Instruction* I, model& mdl,
                              std::map<std::string,std::string>& state,
                              bmc_ds* bmc_ds_ptr, unsigned call_count ) {
  assert(bmc_ds_ptr);
  std::string v;
  unsigned copy_count = 0;
  auto val = bmc_ds_ptr->m.read_term( I, copy_count );
  if( val ) {
    val = mdl.eval( val );
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
  if( llvm::isa<llvm::IntrinsicInst>(call) ) {
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
  if( o.verbosity > 6 ) {
    std::cout << "\n\n-------------------------------------------\n";
    std::cout << "Dumping witness"  "\n";
    std::cout << "-------------------------------------------\n\n";
  }
  for( auto b : bmc_ds_ptr->bb_vec ) {
    expr path_bit = bmc_ds_ptr->get_path_bit(bidx);
    // expr path_bit = bmc_ds_ptr->block_to_path_bit.at(b);
    if( is_true( path_bit, mdl ) ) {
      if( o.verbosity > 6 ) {
        std::cout << "-------------------------------------------\n";
        std::cout << "dumping block:" << getLocRange( b ) << "\n";
        std::cout << "Block path bit:" << path_bit << "\n";
        dump(b);
      }
      for( const llvm::Instruction& Iobj : b->getInstList() ) {
        const llvm::Instruction* I = &(Iobj);
        if( auto call = llvm::dyn_cast<llvm::CallInst>(I) ) {
          produce_witness_call( mdl, call );
        }
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
  w.show_path();
  // w.generate_html();
}

//    for (auto bbit = fit->begin(); bbit != fit->end(); bbit++) { //Iterate over basic blocks in function

//    auto bb = &(*bbit);
//    for( auto it = bb->begin(), e = bb->end(); it != e; ++it) {
//      auto I = &(*it);
//      //I->print( llvm::outs() );     std::cout << "\n";
//  	auto call = llvm::dyn_cast<llvm::CallInst>(I);
//	auto invoke = llvm::dyn_cast<llvm::InvokeInst>(I);
//      if ((call) || (invoke)) {
//       // I->print( llvm::outs() );     std::cout << "\n";
//	std::string FuncName;	
//	llvm::Function *fun;
//        if (call) {
//		fun = call->getCalledFunction();
//		FuncName = fun->getName(); }

//	else if (invoke) {
//		fun = invoke->getCalledFunction();
//		FuncName = fun->getName();
//	}

//        // Get the personality function from the callee if it contains a landing pad.
//  Constant *CalledPersonality =
//      CalledFunc->hasPersonalityFn()
//          ? CalledFunc->getPersonalityFn()->stripPointerCasts()
//          : nullptr;

//  // Find the personality function used by the landing pads of the caller. If it
//  // exists, then check to see that it matches the personality function used in
//  // the callee.
//  Constant *CallerPersonality =
//      Caller->hasPersonalityFn()
//          ? Caller->getPersonalityFn()->stripPointerCasts()
//          : nullptr;
//  if (CalledPersonality) {
//    if (!CallerPersonality)
//      Caller->setPersonalityFn(CalledPersonality);
//    // If the personality functions match, then we can perform the
//    // inlining. Otherwise, we can't inline.
//    // TODO: This isn't 100% true. Some personality functions are proper
//    //       supersets of others and can be used in place of the other.
//    else if (CalledPersonality != CallerPersonality)
//      return "incompatible personality";
//  }
// }
// }
//}


//  for(auto fit = module->begin(), endit = module->end(); fit != endit; ++fit) {
//  std::string fname = demangle(fit->getName().str());
//  if ((fname == "_ada_mjguidancedriver") || (fname == "_ada_mnguidancedriver")) {

//    for (auto bbit = fit->begin(); bbit != fit->end(); bbit++) { //Iterate over basic blocks in function       
//		       
//      auto bb = &(*bbit);
//      for( auto it = bb->begin();  it != bb->end(); ++it) {
//        auto I = &(*it);
////	auto call = llvm::dyn_cast<llvm::CallInst>(I);
////      auto invoke = llvm::dyn_cast<llvm::InvokeInst>(I);
////      if ((call) || (invoke)) {
//          I->print( llvm::outs() );     std::cout << "\n";
//	  //}
//	}
//      }
//     }
//    }
