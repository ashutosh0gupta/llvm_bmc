#include "lib/utils/verify_prop_pass.h"
#include "lib/utils/utils.h"


char verify_prop_pass::ID = 0;

verify_prop_pass::verify_prop_pass(llvm::Module &m, options& o)
  : llvm::ModulePass(ID)
{
    const std::string specFileName = o.get_spec_file();

    if ( !boost::filesystem::exists( specFileName ) ) {
    	llvm_bmc_error( "Verification", "failed to find file " << specFileName );
    }

    boost::filesystem::path sf( o.specFilePath);
    boost::filesystem::ifstream ifs{ sf };
    std::string keyword, FnName;
    ifs >> keyword >> FnName;
    if (keyword == "invoke") {
	insert_monitor(m,FnName);
    }
}

verify_prop_pass::~verify_prop_pass() {}


void verify_prop_pass::insert_monitor(llvm::Module &m, std::string FnName)
{
    fname = FnName;
    llvm::LLVMContext& ctx = m.getContext();

    std::string monitor_var_name = "invoked_functionFoo";
    llvm::Type *i32_type = llvm::IntegerType::getInt32Ty(ctx);

    llvm::GlobalVariable *monitor_var = NULL;

    //Create a new global variable named invoked_functionFoo of I32 type and initialise it to 0 
    monitor_var = new llvm::GlobalVariable(m, i32_type, false, llvm::GlobalValue::InternalLinkage, llvm::ConstantInt::get(i32_type, 0), monitor_var_name);
	
    invokedFn_Val = m.getOrInsertGlobal(monitor_var_name, i32_type); 
    invokedFn_Val->print( llvm::outs() );
}


bool verify_prop_pass::runOnModule(llvm::Module &m)
{
    
    for (auto mit = m.begin(); mit != m.end(); mit++) { //Iterate over functions in module
        bool modified = runOnFunction(*mit);
    }

    return true;
}


bool verify_prop_pass::runOnFunction( llvm::Function &f ) {
  
  for (auto bbit = f.begin(); bbit != f.end(); bbit++) { //Iterate over basic blocks in function       
		       
	auto bb = &(*bbit);
	for( auto it = bb->begin(), e = bb->end(); it != e; ++it) {
			      auto I = &(*it);

				if( auto call = llvm::dyn_cast<llvm::CallInst>(I) ) {
					llvm::Function *fun = call->getCalledFunction();
					std::string FuncName = fun->getName();

					if (fname == fun->getName()) {
						llvm::Value *i32_val = llvm::ConstantInt::get(llvm::IntegerType::getInt32Ty(f.getContext()), 1, true);  //Create an i32 constant with value 1
						llvm::Value* storeVal = new llvm::StoreInst(i32_val, invokedFn_Val, I); // Store 1 to global variable invoked_functionFoo before call instruction
						storeVal->print( llvm::outs() );
						break;	
					}	
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
