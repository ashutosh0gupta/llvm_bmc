#include "insert_monitor.h"
// pragam'ed to aviod warnings due to llvm included files
#include "llvm/IR/DerivedTypes.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"


//Combined module ID is llvm-link, should that be passed? Function is the one whose invocation is to be checked, any other parameters needed?
void insert_monitor( llvm::Module& module,
              llvm::Function &f, const bb* b, llvm::LLVMContext& ctx )
{
	std::string monitor_var_name = "invoked_functionFoo";
	llvm::Type *i32_type = llvm::IntegerType::getInt32Ty(ctx);
        //Create a new global variable named invoked_functionFoo of I32 type and initialise it to 0
  	llvm::Value *invokedFn_Val = new llvm::GlobalVariable(module, i32_type, false, llvm::GlobalValue::InternalLinkage, llvm::ConstantInt::get(i32_type, 0), monitor_var_name);
	
	//Value *invokedFn_Val = Module.getGlobalVariable(invoked_functionFoo); 

	llvm::Value *i32_val = llvm::ConstantInt::get(i32_type, 1, true);  //Create an i32 constant with value 1

	for( const llvm::Instruction& Iobj : b->getInstList() ) {
		const llvm::Instruction* I = &(Iobj);
		if( auto call = llvm::dyn_cast<llvm::CallInst>(I) ) {
			llvm::Value* storeVal = new llvm::StoreInst(i32_val, invokedFn_Val, I); // Store 1 to global variable invoked_functionFoo before call instruction
			break;		
		}    
	}


}

