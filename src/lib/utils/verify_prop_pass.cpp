#include "lib/utils/verify_prop_pass.h"
#include "lib/utils/utils.h"
#include "lib/utils/llvm_utils.h"
#include "include/bmc_ds.h"

#include "llvm/Transforms/Utils/Cloning.h"


char verify_prop_pass::ID = 0;

verify_prop_pass::verify_prop_pass(llvm::Module &m, options& o, bmc& b_)
  : bmc_pass(o, o.solver_ctx, bmc_obj), bmc_obj(b_), llvm::FunctionPass(ID)
{
    init_parse(m,o);
}

verify_prop_pass::~verify_prop_pass() {}

void verify_prop_pass::init_parse(llvm::Module &m, options& o)
{
    parser_data pd(o.solver_ctx);
    const std::string Specfilename = o.get_spec_file();
        
    if ( !boost::filesystem::exists( Specfilename ) ) {
	    llvm_bmc_error( "SPEC_PARSING", "failed to find file " << Specfilename );
     }
     std::ifstream file(Specfilename);
     pd.read_file( file );

     assert(bmc_ds_ptr);
     bmc_ds_ptr->fn_to_thread = pd.fn_thread_map;
     
     llvm::LLVMContext& ctx = m.getContext();
     llvm::Type *i32_type = llvm::IntegerType::getInt32Ty(ctx);
     //Create a new global variable named val0_var of I32 type and initialise it to 0 
    val0_var = new llvm::GlobalVariable(m, i32_type, false, llvm::GlobalValue::InternalLinkage, llvm::ConstantInt::get(i32_type, 0), var0_name);
	
    i32_val0 = m.getOrInsertGlobal(var0_name, i32_type); 
    //val0_var->print( llvm::outs() );     std::cout << "\n";

    val1_var = new llvm::GlobalVariable(m, i32_type, false, llvm::GlobalValue::InternalLinkage, llvm::ConstantInt::get(i32_type, 1), var1_name);
	
    i32_val1 = m.getOrInsertGlobal(var1_name, i32_type); 
    //val1_var->print( llvm::outs() );     std::cout << "\n";

    val2_var = new llvm::GlobalVariable(m, i32_type, false, llvm::GlobalValue::InternalLinkage, llvm::ConstantInt::get(i32_type, 2), var2_name);
	
    i32_val2 = m.getOrInsertGlobal(var2_name, i32_type); 
    //val2_var->print( llvm::outs() );     std::cout << "\n";

     callseq_num = -1;
     for (auto i = pd.callseq_map.begin(); i != pd.callseq_map.end(); i++) {
	callseq_num++;
        ThName = i->second;

	for (auto j = pd.list_threads.begin(); j != pd.list_threads.end(); j++) {
		if (ThName == j->first) EntryFnName = j->second;
	}

	auto CallSeqpair = i->first;	  
        std::string FnName1 = CallSeqpair.first;
	std::string FnName2 = CallSeqpair.second;
	
	insert_monitor(m,FnName1,FnName2);

	for (auto mit = m.begin(); mit != m.end(); mit++) { //Iterate over functions in module

	std::string Str1 = mit->getName();
	if (Str1 == EntryFnName) {
		//std::cout << "Str1 is " << Str1 <<"\n";
	       bool modified = runOnFunction(*mit);
		}
    	}
	
	//The icmp and call instructions should be inserted at the end of the module
	llvm::Instruction *icmp1 = new llvm::ICmpInst(llvm::ICmpInst::ICMP_EQ, invokedFn_Val[callseq_num], i32_val1, cmp_res_name[callseq_num]); 
	//icmp1->print( llvm::outs() );     std::cout << "\n";

	llvm::LLVMContext& ctx = m.getContext();
	llvm::Type *i1_type = llvm::IntegerType::getInt1Ty(ctx);

	auto assertfunc = m.getOrInsertFunction("__VERIFIER_assert_CallSeqCheck", i1_type);  			 
	llvm::CallInst *call = llvm::CallInst::Create(assertfunc, icmp1, "assertfunc");
	//call->print( llvm::outs() );     std::cout << "\n";

     }
  }



void verify_prop_pass::insert_monitor(llvm::Module &m, std::string Fn1, std::string Fn2)
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


bool verify_prop_pass::runOnFunction( llvm::Function &f ) {
   for (auto bbit = f.begin(); bbit != f.end(); bbit++) { //Iterate over basic blocks in function       
		       
	auto bb = &(*bbit);
	for( auto it = bb->begin(), e = bb->end(); it != e; ++it) {
			      auto I = &(*it);
//I->print( llvm::outs() );     std::cout << "\n";
				if( auto call = llvm::dyn_cast<llvm::CallInst>(I) ) {
					llvm::Function *fun = call->getCalledFunction();  

					std::string FuncName = fun->getName();
//std::cout << "Called fn is " << FuncName << "\n";
					if (fname1 == FuncName) {
											
						llvm::Instruction *icmp = new llvm::ICmpInst(I,llvm::ICmpInst::ICMP_ULT, invokedFn_Val[callseq_num], i32_val2); // cmp_res_name);
						
						//icmp->print( llvm::outs() );     std::cout << "\n";
						llvm::Value *const_val2 = llvm::ConstantInt::get(llvm::IntegerType::getInt32Ty(f.getContext()), 2, true);
						llvm::Value *const_val1 = llvm::ConstantInt::get(llvm::IntegerType::getInt32Ty(f.getContext()), 1, true);  //Create an i32 constant with value 1				       

						llvm::SelectInst *select = llvm::SelectInst::Create (icmp, const_val1, const_val2, monitor_var_name[callseq_num], I);
						//select->print( llvm::outs() );     std::cout << "\n";
						//break;	
					}

					if (fname2 == FuncName) {
						llvm::Instruction *icmp = new llvm::ICmpInst(I,llvm::ICmpInst::ICMP_EQ, invokedFn_Val[callseq_num], i32_val1); // cmp_res_name);
						
						//icmp->print( llvm::outs() );     std::cout << "\n";
						llvm::Value *const_val1 = llvm::ConstantInt::get(llvm::IntegerType::getInt32Ty(f.getContext()), 1, true);
						llvm::Value *const_val2 = llvm::ConstantInt::get(llvm::IntegerType::getInt32Ty(f.getContext()), 2, true);  //Create an i32 constant with value 1				       
						llvm::SelectInst *select = llvm::SelectInst::Create (icmp, const_val1, const_val2, monitor_var_name[callseq_num], I);
						//select->print( llvm::outs() );     std::cout << "\n";	
					}
						
					if( !fun->isDeclaration() ) {
        // function has a body available
        fun->addFnAttr(llvm::Attribute::AlwaysInline);
      }
	bool modified = runOnFunction(*fun);
				}    
			}
			
    		}
	return true;
	}


llvm::StringRef verify_prop_pass::getPassName() const {
  return "Verifies specified properties - Inserts monitor variable";
}

void verify_prop_pass::getAnalysisUsage(llvm::AnalysisUsage &au) const {
  au.setPreservesAll();
  au.addRequired<llvm::LoopInfoWrapperPass>();
}
