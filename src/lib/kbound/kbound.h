#ifndef BMC_KBOUND_H
#define BMC_KBOUND_H

#include <fstream>

#include "include/options.h"
#include "include/spec.h"
#include "lib/bmc/bmc_pass.h"

class bmc;       // forward declaration of the bmc class

struct names {
  std::map<std::string,names> nmap;
  std::string name;
};

typedef std::vector<std::string> svec;

class kbound : public bmc_pass, public llvm::FunctionPass{

private:
  static char ID;
  std::unique_ptr<llvm::Module>& module;
  std::ofstream ofcpp;
  unsigned thread_id = 0;
  std::string tid;
  unsigned current_indent;
  unsigned ncontext = 10;
  unsigned active_lax = 0;
  std::string thread_name, EntryFn;

  svec reg_vals,reg_list;
  svec val_init_list, val_list;
  svec time_list, proc_list, ctx_list;
  svec var_list;

  unsigned num_globals = 0;
  std::map<const void*, unsigned> global_position;
  std::map<const void*, unsigned> global_size;
  std::map<const void*, std::string> global_name;

  unsigned num_local_globals = 0; // Number of variables that are locally used
  std::map<const void*, unsigned   > local_global_position;
  std::map<const void*, unsigned   > local_global_size;
  std::map<const void*, std::string> local_global_name;

  unsigned ssa_count = 0;
  std::map<const void*, std::string> ssa_name;
  std::map<const void*, names> ssa_name_full;
  std::map<const void*, svec> ctrl_dep_ord;
  // std::map<const llvm::Value*, std::string> ssa_name;
  // std::map<const llvm::Value*, svec> ctrl_dep_ord;
  std::vector<std::string> unmapped_names;
  // std::map<const llvm::BasicBlock*, std::string> path_name;
  svec in_code_spec;

  std::string time_name( std::string name );
  std::string fresh_name();
  void        add_reg_map   ( const void*, std::string );
  void        add_reg_map   ( const void*, svec&, std::string);
  std::string add_reg_map   ( const void*, svec& );
  std::string add_reg_map   ( const void* );
  std::string get_reg       ( const void* );
  std::string get_reg       ( const void* v, svec& idxs );
  std::string get_reg_time  ( const void* );
  std::string get_reg_time  ( const void*, svec& idxs );
  std::string get_global_idx( const void* );
  std::string get_global_idx( const void*, std::string );
  
  bool is_concurrent( const void* v);
  
  std::string read_const  ( const llvm::Value* );
  std::string add_reg_map ( const llvm::Value* );
  std::string get_reg     ( const llvm::Value* );
  std::string get_reg     ( const llvm::Value* , svec& idxs );
  std::string get_reg_time( const llvm::Value* );
  std::string get_reg_time( const llvm::Value* , svec& idxs );

  std::string block_name(unsigned bidx);
  void dump_Params(llvm::Function &f);

  // dump to kbound
  void dump_Newline();
  void dump_String (std::string s);
  void dump_Label  (std::string s);
  void dump_Goto(std::string s);
  void dump_Comment(std::string s);
  void dump_Assume (std::string s);
  void dump_Assert (std::string s);
  void dump_Assume_eq ( std::string s1, std::string s2 );
  void dump_Assume_geq( std::string s1, std::string s2 );
  void dump_Assume_geq_max(std::string s1,std::string s2,std::string s3);
  void dump_Assign (std::string r, std::string term);
  void dump_Decl_assign(std::string r, std::string term);
  void dump_Assign_rand(std::string r, std::string term);
  void dump_Assign_rand_ctx(std::string r);
  void dump_Assign_max(std::string, std::string,std::string);
  void dump_Assign_max(std::string, std::string);

  void dump_Indent();
  void dump_Define     (std::string name, std::string val);
  void dump_Decl_scalar(std::string name, std::string type);
  void dump_Decl_array (std::string, std::string, std::string);
  void dump_Decl_fun   (std::string, std::string, std::string);
  void dump_For        (std::string, std::string, std::string);
  void dump_For(std::string, std::string, std::string, std::string);
  void dump_If(std::string);
  void dump_ElseIf(std::string);
  void dump_Else();
  void dump_Close_scope();
  void dump_locals();

  void dump_Macors(std::string name, std::string val);

  void dump_Arrays( std::string type,
                    std::vector<std::string> arys,
                    std::string dim1, std::string dim2 );

  void dump_ld( std::string, std::string, std::string, std::string,bool,bool);
  void dump_st( std::string, std::string, std::string, std::string,bool,bool);

  //---------------------------------------------------------------------

  bool is_acquire( llvm::AtomicOrdering ord );
  bool is_release( llvm::AtomicOrdering ord );

  std::string get_GEPOperator(const llvm::GEPOperator* gep);

  void dump_AllocaInst( const llvm::AllocaInst* alloc );
  void dump_BinOp( unsigned bidx, const llvm::BinaryOperator* bop);
  void dump_CmpInst    ( unsigned bidx, const llvm::CmpInst* cmp);
  void dump_SelectInst( const llvm::SelectInst *sel );
  
  void dump_CallInst( unsigned bidx, const llvm::CallInst* call);

  void dump_Active( std::string ctx);
  void dump_CallAssume ( unsigned bidx, const llvm::CallInst* cmp);
  void dump_CallAssert ( unsigned bidx, const llvm::CallInst* cmp);
  void dump_CallNondet ( unsigned bidx, const llvm::CallInst* cmp);
  void dump_IntrinsicInst( unsigned bidx, const llvm::IntrinsicInst* I);

  void dump_UnaryInst( unsigned bidx, const llvm::UnaryInstruction* I );
  void dump_CastInst ( unsigned bidx, const llvm::CastInst* I );
  void dump_LoadInst ( unsigned bidx, const llvm::LoadInst* load );
  void dump_StoreInst( unsigned bidx, const llvm::StoreInst* store );
  void dump_GetElementPtrInst(const llvm::GetElementPtrInst* gep, bool&);
  void dump_GetElementPtrInst(const llvm::GetElementPtrInst* gep);
  void dump_AtomicRMWInst( const llvm::AtomicRMWInst* rmw );
  void dump_AtomicCmpXchgInst( const llvm::AtomicCmpXchgInst* xng );
  void dump_FenceInst( const llvm::FenceInst* fence );
  void dump_ExtractValue( const llvm::ExtractValueInst* eval);
  void dump_geq_globals( std::string c, std::string prop );
  void dump_dmbsy();
  void dump_dmbld();
  void dump_dmbst();
  void dump_isb();

  void addr_name( const llvm::Value* addr, std::string& , std::string&,
                  bool& isLocalUse );

  void addr_name( const llvm::Value* addr, std::string& , std::string&);

  void addr_local_name( const llvm::Value* addr,
                        std::string& gid, std::string& caddr);

  void dump_ST_(unsigned bidx, const llvm::CallInst* cmp,bool,bool);
  void dump_LD_(unsigned bidx, const llvm::CallInst* cmp,bool,bool);

  void dump_PhiNodes( const bb* b, const bb* prev_b );
  void dump_PhiNode( unsigned bidx, const llvm::PHINode* phi );
  void dump_RetInst(const llvm::ReturnInst *ret );
  void dump_Branch( unsigned bidx, const llvm::BranchInst* br );
  void dump_SwitchInst( unsigned bidx, const llvm::SwitchInst* br );
  void dump_UnreachableInst( unsigned, const llvm::UnreachableInst *I);

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
