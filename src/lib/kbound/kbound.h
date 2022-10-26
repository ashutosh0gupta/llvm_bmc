#ifndef BMC_KBOUND_H
#define BMC_KBOUND_H

#include <fstream>

#include "include/options.h"
#include "include/spec.h"
#include "lib/bmc/bmc_pass.h"

class bmc;       // forward declaration of the bmc class

typedef std::vector<std::string> svec;

class kbound : public bmc_pass, public llvm::FunctionPass{

private:
  static char ID;
  std::unique_ptr<llvm::Module>& module;
  std::ofstream ofcpp;
  unsigned thread_id = 0;
  unsigned current_indent;
  std::string thread_name, EntryFn;

  svec reg_vals,reg_list;
  svec val_init_list, val_list;
  svec time_list, proc_list, ctx_list;
  svec var_list;

  unsigned ssa_count = 0;
  std::map<const llvm::Value*, std::string> ssa_name;
  void add_reg_map( const llvm::Value*, std::string );
  std::string add_reg_map( const llvm::Value* );
  std::string get_reg( const llvm::Value* );

  void dump_Params(llvm::Function &f);

  // dump to kbound
  void dump_Newline();
  void dump_String (std::string s);
  void dump_Label  (std::string s);
  void dump_Comment(std::string s);
  void dump_Assume (std::string s);
  void dump_Assign (std::string r, std::string term);
  void dump_Decl_assign(std::string r, std::string term);
  void dump_Assign_rand(std::string r, std::string term);
  void dump_Assign_rand_ctx(std::string r);

  void dump_Indent();
  void dump_Define     (std::string name, std::string val);
  void dump_Decl_scalar(std::string name, std::string type);
  void dump_Decl_array (std::string, std::string, std::string);
  void dump_Decl_fun   (std::string, std::string, std::string);
  void dump_For        (std::string, std::string, std::string);
  void dump_For(std::string, std::string, std::string, std::string);
  void dump_Close_scope();

  void dump_Macors(std::string name, std::string val);

  void dump_Arrays( std::string type,
                    std::vector<std::string> arys,
                    std::string dim1, std::string dim2 );
 
  void dump_BinOp( unsigned bidx, const llvm::BinaryOperator* bop);
  void dump_CmpInst    ( unsigned bidx, const llvm::CmpInst* cmp);

  void dump_CallInst( unsigned bidx, const llvm::CallInst* call);
  void dump_CallAssume ( unsigned bidx, const llvm::CallInst* cmp);
  void dump_CallAssert ( unsigned bidx, const llvm::CallInst* cmp);
  void dump_CallNondet ( unsigned bidx, const llvm::CallInst* cmp);
  void dump_IntrinsicInst( unsigned bidx, const llvm::IntrinsicInst* I);

  void dump_RetInst(const llvm::ReturnInst *ret );
  
  void dump_Thread();
  void dump_Block( unsigned bidx, const bb* b );

  void prefix_seq();
  void postfix_seq();
public:
  kbound(options& o_,
         std::unique_ptr<llvm::Module>& m_,
         bmc& bmc
          // std::vector<spec_thread>& threads,
         );
  ~kbound();
  bool runOnFunction( llvm::Function &f );
  
  void getAnalysisUsage(llvm::AnalysisUsage &au) const;
  llvm::StringRef getPassName() const;
 
  // bool verify_prop();


 
};

#endif // BMC_KBOUND_H