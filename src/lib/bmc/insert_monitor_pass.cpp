#include "insert_monitor_pass.h"
#include "lib/utils/utils.h"
#include "lib/utils/llvm_utils.h"
#include "include/bmc_ds.h"

#include "llvm/Transforms/Utils/Cloning.h"


char insert_monitor_pass::ID = 0;

insert_monitor_pass::insert_monitor_pass(llvm::Module &m, options& o, bmc& b)
  : llvm::FunctionPass(ID)
{
  init_parse(m,o,b);
}

insert_monitor_pass::~insert_monitor_pass() {}

void insert_monitor_pass::
init_parse(llvm::Module &m, options& o, bmc& b)
{

  /* b.fn_to_thread = pd.fn_thread_map;
  b.thread_list = pd.list_threads;
  b.precond = pd.list_precond;
  b.prop = pd.list_postcond; */

//  if (!pd.list_postcond.empty()) {
//    for (auto j = pd.list_postcond.begin(); j != pd.list_postcond.end(); j++) {
//      b.prop.push_back(j->second);
//     }
//   }

//  if (!pd.list_precond.empty()) {
//    for (auto j = pd.list_precond.begin(); j != pd.list_precond.end(); j++) {
//      b.precond.push_back(j->second);
//     }
//   }

  for (unsigned j = 0; j < b.threads.size(); j++) { 
  if (!b.threads.at(j).call_seqs.empty()) {
  callseq_num = -1;
  //for (auto i = pd.callseq_map.begin(); i != pd.callseq_map.end(); i++) {
    callseq_num++;
    ThName = b.threads.at(j).name;
    EntryFnName = b.threads.at(j).entry_function;
    Th_num1 = b.threads.at(j).thread_num;
    auto CallSeqs = b.threads.at(j).call_seqs;

    auto size_cs = b.threads.at(j).call_seqs.size();
    for (unsigned k = 0; k < size_cs; k++) {
	auto CallSeqpair = b.threads.at(j).call_seqs.at(k);
    /* for (auto j = pd.list_threads.begin(); j != pd.list_threads.end(); j++) {
      if (ThName == j->first) EntryFnName = j->second;
    }

    for (auto k = pd.fn_thread_map.begin(); k != pd.fn_thread_map.end(); k++) {
	if (EntryFnName == k->first)
   		Th_num1 = k->second;
    }

    auto CallSeqpair = i->first; */
    std::string FnName1 = CallSeqpair.first;
    std::string FnName2 = CallSeqpair.second;

    //std::cout << "Fn1 is " << FnName1 << " Fn2 is " << FnName2 << " Thread is " << i->second << "\n";

    insert_monitor(m,FnName1,FnName2);

    for (auto mit = m.begin(); mit != m.end(); mit++) { //Iterate over functions in module

      std::string Str1 = mit->getName().str();
      if (Str1 == EntryFnName) {
        //std::cout << "Str1 is " << Str1 <<"\n";
        InlineInsertInst(m, *mit, b); 
        insert_assert_call(m, *mit);
      }
     }
    }
  }
 }


  /* if (b.threads.call_seqs.empty()) {
    for (auto j = b.threads.begin(); j != b.threads.end(); j++) {
      ThName = b.threads.at(j).name;
      EntryFnName = b.threads.at(j).entry_function;
      //std::cout << "Entry Fn is " << EntryFnName << " Thread is " << ThName << "\n";
      for (auto mit = m.begin(); mit != m.end(); mit++) { //Iterate over functions in module

      std::string Str1 = mit->getName().str();
      if (Str1 == EntryFnName) {
	//for (auto i = pd.fn_thread_map.begin(); i != pd.fn_thread_map.end(); i++) {
      		//if (Str1 == i->first) {
      		unsigned Th_num = b.threads.at(j).thread_num;
		//std::cout << "Fn is " << EntryFnName << " Thread is " << ThName << "\n";
        	CollectThreadInfo(*mit, Th_num, b);
	    //}
      //}
     }
    }
  }
 } */

 
  for (auto mit = m.begin(); mit != m.end(); mit++) { //Iterate over functions in module
        //bool Modified =
    runOnFunction(*mit);
  }
}



void insert_monitor_pass::insert_monitor(llvm::Module &m, std::string Fn1, std::string Fn2)
{

  //auto ModName = m.getModuleIdentifier();
  //std::cout << "Module name is " << ModName << "\n";

  fname1 = Fn1;
  fname2 = Fn2;
  llvm::LLVMContext& ctx = m.getContext();

  llvm::Type *i32_type = llvm::IntegerType::getInt32Ty(ctx);

  //Create a new global variable named invoked_functionFoo of I32 type and initialise it to 0
  monitor_var[callseq_num] = new llvm::GlobalVariable(m, i32_type, false, llvm::GlobalValue::InternalLinkage, llvm::ConstantInt::get(i32_type, 0), monitor_var_name[callseq_num]);

  invokedFn_Val[callseq_num] = m.getOrInsertGlobal(monitor_var_name[callseq_num], i32_type);
  //invokedFn_Val[callseq_num]->print( llvm::outs() );     std::cout << "\n";

}


void insert_monitor_pass::InlineInsertInst( llvm::Module &m, llvm::Function &f, bmc& b ) {
  for (auto bbit = f.begin(); bbit != f.end(); bbit++) { //Iterate over basic blocks in function

    auto bb = &(*bbit);
    for( auto it = bb->begin(), e = bb->end(); it != e; ++it) {
      auto I = &(*it);
      //I->print( llvm::outs() );     std::cout << "\n";
  	auto call = llvm::dyn_cast<llvm::CallInst>(I);
	auto invoke = llvm::dyn_cast<llvm::InvokeInst>(I);

      if ((call) || (invoke)) {
       // I->print( llvm::outs() );     std::cout << "\n";
	std::string FuncName;	
	llvm::Function *fun;
        if (call) {
		fun = call->getCalledFunction();
		FuncName = fun->getName(); }

	else if (invoke) {
		fun = invoke->getCalledFunction();
		FuncName = fun->getName();
	}
        
	//auto pair = std::make_pair( FuncName, Th_num1 );
	//b.fn_to_thread.insert( pair );
	//std::cout << "Called fn is " << FuncName << "\n";

	llvm::LLVMContext& ctx = m.getContext();
        llvm::Type *i32_type = llvm::IntegerType::getInt32Ty(ctx);

        if (fname1 == FuncName) {

          //icmp->print( llvm::outs() );     std::cout << "\n";
          llvm::Value *const_val2 = llvm::ConstantInt::get(llvm::IntegerType::getInt32Ty(f.getContext()), 2, true);
          llvm::Value *const_val1 = llvm::ConstantInt::get(llvm::IntegerType::getInt32Ty(f.getContext()), 1, true);  //Create an i32 constant with value 1

	  llvm::Instruction *load = new llvm::LoadInst(i32_type, invokedFn_Val[callseq_num], "test", false, I); //Load the global monitor var

	  //llvm::Instruction *icmp = new llvm::ICmpInst(I,llvm::ICmpInst::ICMP_ULT, invokedFn_Val[callseq_num], const_val2); // cmp_res_name);
	  llvm::Instruction *icmp = new llvm::ICmpInst(I, llvm::ICmpInst::ICMP_ULT, load, const_val2);

          llvm::SelectInst *select =
          llvm::SelectInst::Create (icmp, const_val1, const_val2, monitor_var_name[callseq_num], I);
          //select->print( llvm::outs() );     std::cout << "\n";
	  // llvm::Instruction *store =
            new llvm::StoreInst(select,invokedFn_Val[callseq_num], I); //Store the global monitor var
          //break;
        }

        if (fname2 == FuncName) {

          //icmp->print( llvm::outs() );     std::cout << "\n";
          llvm::Value *const_val1 = llvm::ConstantInt::get(llvm::IntegerType::getInt32Ty(f.getContext()), 1, true);
          llvm::Value *const_val2 = llvm::ConstantInt::get(llvm::IntegerType::getInt32Ty(f.getContext()), 2, true);  //Create an i32 constant with value 1
	  llvm::Instruction *load = new llvm::LoadInst(i32_type, invokedFn_Val[callseq_num], "test", false, I); //Load the global monitor var
          llvm::Instruction *icmp = new llvm::ICmpInst(I,llvm::ICmpInst::ICMP_EQ, load, const_val1); // cmp_res_name);

          llvm::SelectInst *select =
          llvm::SelectInst::Create (icmp, const_val1, const_val2, monitor_var_name[callseq_num], I);
          //select->print( llvm::outs() );     std::cout << "\n";
	  //llvm::Instruction *store =
            new llvm::StoreInst(select,invokedFn_Val[callseq_num], I); //Store the global monitor var
        }
	InlineInsertInst(m, *fun, b);
      }
    }
  }
}



void insert_monitor_pass::insert_assert_call( llvm::Module &m, llvm::Function &f ) {

//      for(auto fit = module->begin(), endit = module->end(); fit != endit; ++fit) {
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
    for (auto bbit = f.begin(); bbit != f.end(); bbit++) { //Iterate over basic blocks in function

    auto bb = &(*bbit);
    for( auto it = bb->begin(), e = bb->end(); it != e; ++it) {
      auto I = &(*it);
      auto ret = llvm::dyn_cast<llvm::ReturnInst>(I);
	if (ret) {

//The icmp and call instructions should be inserted at the end of the entry function, just before return
    llvm::LLVMContext& ctx = m.getContext();
    llvm::Type *i32_type = llvm::IntegerType::getInt32Ty(ctx);
    llvm::Value *const_val1 = llvm::ConstantInt::get(llvm::IntegerType::getInt32Ty(f.getContext()), 1, true);
    llvm::Instruction *load = new llvm::LoadInst(i32_type, invokedFn_Val[callseq_num], "test1", false, I); //Load the global monitor var
    //llvm::Instruction *icmp1 = new llvm::ICmpInst(llvm::ICmpInst::ICMP_EQ, invokedFn_Val[callseq_num], i32_val1, cmp_res_name[callseq_num]);
    llvm::Instruction *icmp1 = new llvm::ICmpInst(I, llvm::ICmpInst::ICMP_EQ, load, const_val1);
//    //icmp1->print( llvm::outs() );     std::cout << "\n";

    llvm::Type *i1_type = llvm::IntegerType::getInt1Ty(ctx);

    auto ret_type = llvm::Type::getVoidTy(ctx);
    auto assert_type = llvm::FunctionType::get(ret_type , i1_type, false );

    auto attr_list = llvm::AttributeList().addAttributeAtIndex(m.getContext(), 1U, llvm::Attribute::NoAlias);

    auto assertfunc = m.getOrInsertFunction("__VERIFIER_assert_CallSeqCheck", assert_type, attr_list);
  //llvm::CallInst *call = 
   llvm::CallInst::Create(assertfunc, icmp1, "assertfunc", I);
   //call->print( llvm::outs() );     std::cout << "\n";
   //auto assertfunc = m.getOrInsertFunction("__VERIFIER_assert_CallSeqCheck", i1_type);
	}
    }
   }
} 



/* void parse_spec_pass::CollectThreadInfo( llvm::Function &f, unsigned ThreadNumber, bmc& b ) {
  for (auto bbit = f.begin(); bbit != f.end(); bbit++) { //Iterate over basic blocks in function

    auto bb = &(*bbit);
    for( auto it = bb->begin(), e = bb->end(); it != e; ++it) {
      auto I = &(*it);
      //I->print( llvm::outs() );     std::cout << "\n";
      auto call = llvm::dyn_cast<llvm::CallInst>(I);
      auto invoke = llvm::dyn_cast<llvm::InvokeInst>(I);
      if ((call) || (invoke)) {
       // I->print( llvm::outs() );     std::cout << "\n";
	std::string FuncName;	
	llvm::Function *fun;
        if (call) {
		fun = call->getCalledFunction();
		FuncName = fun->getName(); }

	else if (invoke) {
		fun = invoke->getCalledFunction();
		FuncName = fun->getName();
	}
	//std::cout << "Called fn is " << FuncName << "\n";
	auto pair = std::make_pair( FuncName, ThreadNumber );
  	b.fn_to_thread.insert( pair );

	CollectThreadInfo(*fun, ThreadNumber, b);
      }
    }
  }
} */


bool insert_monitor_pass::runOnFunction( llvm::Function &f ) {
	std::string FuncName = f.getName().str();
	return true;
}


llvm::StringRef insert_monitor_pass::getPassName() const {
  return "Verifies specified properties - Inserts monitor variable";
}

void insert_monitor_pass::getAnalysisUsage(llvm::AnalysisUsage &au) const {
  au.setPreservesAll();
  au.addRequired<llvm::LoopInfoWrapperPass>();
}



void import_spec_file( std::unique_ptr<llvm::Module>& module,
                       options& o, bmc& b) {
  if (o.check_spec) {
    spec_parser sp(o.solver_ctx);
    sp.read_file( o.get_spec_file(), b);
    // const std::string Specfilename = o.get_spec_file();
    // if ( !boost::filesystem::exists( Specfilename ) ) {
    //   llvm_bmc_error( "SPEC_PARSING", "failed to find file " << Specfilename );
    // }
    // std::ifstream file(Specfilename);
    // sp.read_file( file, b);

    llvm::legacy::PassManager passMan;
    passMan.add( new insert_monitor_pass(*module.get(), o, b));
    passMan.run( *module.get() );
  }

//  for (auto i = b.fn_to_thread.begin(); i != b.fn_to_thread.end(); i++) {
//	std::cout << "Fn. name is " << i->first << " Thread num is " << i->second << "\n";
//  }
 }
