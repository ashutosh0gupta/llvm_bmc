#ifndef LLVM_UTILS_H
#define LLVM_UTILS_H

#include <set>
#include <list>
#include <map>
#include "include/options.h"
#include "lib/utils/solver_utils.h"
#include "include/llvm_decls.h"

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunused-parameter"
#include "llvm/IR/TypeBuilder.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/LinkAllPasses.h"
#include "llvm/Analysis/CFGPrinter.h"
#pragma GCC diagnostic pop

#include <boost/filesystem.hpp>

typedef llvm::BasicBlock bb;
typedef std::set<const bb*> bb_set_t;
typedef std::vector<const bb*> bb_vec_t;

typedef llvm::Instruction inst;
typedef std::set<const inst*> inst_set_t;
typedef std::vector<const inst*> inst_vec_t;


#ifndef NDEBUG
#define LLVM_DUMP( ObjPtr ) { if(ObjPtr) ObjPtr->dump(); \
                              llvm_bmc_warning("", "^^^^^^^^^^^^^^^^^^^^^^^"); }
#else
#define LLVM_DUMP( ObjPtr ) {}
#endif



#define COMMENT_PREFIX_LEN 3
#define COMMENT_PREFIX "//!"

// Enable test of the first token
// #define COMMENT_FIRST_TOKEN "(assert"


llvm::Instruction*
estimate_comment_location( std::unique_ptr<llvm::Module>&, src_loc, src_loc);

void
estimate_comment_location(std::unique_ptr<llvm::Module>& module,
                          comments&,
                          std::map< const bb*,comments >&
                          // std::pair< std::vector<std::string>,
                          //            std::vector<std::string> >  >&
);


// void printSegmentInfo(segment& s);
void printBlockInfo(std::vector<llvm::BasicBlock*>& blockList);

  // Get original names of ssa variables from DEBUG information
std::string getVarName(const llvm::DbgValueInst* dbgVal );
std::string getVarName(const llvm::DbgDeclareInst* dbgVal );

void buildNameMap( llvm::Function&, name_map&);

bool isInHeader(llvm::Instruction *, llvm::Loop *);
bool isOutOfLoop(llvm::Instruction *, llvm::Loop *);
bool isInLatch(llvm::Instruction *, llvm::Loop *);
bool isMyLatch(llvm::BasicBlock *, llvm::Loop *);
bool isSupported(llvm::Loop *);
bool isInSubLoop(llvm::BasicBlock *, llvm::Loop *, llvm::LoopInfo *);

bool is_assert_call(const llvm::CallInst*);
bool is_assert_loop(llvm::Loop*);

llvm::BasicBlock* getFirstBodyOfLoop(llvm::Loop *);
std::string getFuncNameForDaikon(llvm::Loop *);
llvm::Function* printf_prototype(llvm::Module *mod, llvm::LLVMContext& c);
llvm::Function *assume_prototype(llvm::Module *mod, llvm::LLVMContext& c);
llvm::Function *assert_prototype(llvm::Module *mod, llvm::LLVMContext& c);
llvm::Constant* geti8StrVal(llvm::Module& M,
                            char const* str,
                            llvm::Twine const& name,
                            llvm::LLVMContext& c);
void assertSingleNesting(llvm::Loop *L);
void assertNonNesting(llvm::Loop *L);
bool isIncrOp(llvm::Value *v);

// This function must be called if succ_b is indeed a successor
inline unsigned getSuccessorIndex( const bb* b, const bb* succ_b ) {
  auto t = b->getTerminator();
  unsigned idx_succ =0;
  for(; idx_succ < t->getNumSuccessors();idx_succ++ ) {
    if( succ_b == t->getSuccessor( idx_succ) ) return idx_succ;
  }
  assert( false );
  return idx_succ;
}

llvm::Loop* getNextLoop(std::list<llvm::Loop*> lList, llvm::Loop* L);
llvm::Value* getArrValueFromZ3Expr(llvm::Value*, expr, llvm::IRBuilder<>&, llvm::LLVMContext&,
                                   std::map<std::string, llvm::Value*>&, std::set<llvm::Value*>&);
llvm::Value* getValueFromZ3Expr(expr, llvm::IRBuilder<>&, llvm::LLVMContext&,
                                std::map<std::string, llvm::Value*>&, std::set<llvm::Value*>&);
llvm::Value* getValueFromZ3SubExpr(expr, llvm::IRBuilder<>&, llvm::LLVMContext&,
                                   std::map<std::string, llvm::Value*>&, std::set<llvm::Value*>&);
void collectArr(llvm::Function &f, std::set<llvm::Value*>&);
template< class Key >
bool exists( const std::vector<Key>& v, const Key& k ) {
  return std::find( v.begin(), v.end(), k ) != v.end();
}

template< class Key >
bool exists( std::vector<Key>& v, Key& k ) {
  return std::find( v.begin(), v.end(), k ) != v.end();
}

template< class Key >
bool exists( const std::set<Key>& set1, const Key& k ) {
  return set1.find( k ) !=  set1.end();
}

template< class Key,  class Val>
bool exists( const std::map<Key,Val>& map1, const Key& k ) {
  return map1.find( k ) !=  map1.end();
}

template< class Key,class cmp >
bool exists( const std::set<Key,cmp>& set1, const Key& k ) {
  return set1.find( k ) !=  set1.end();
}

void computeTopologicalOrder(llvm::Function &F,
                             std::map<const llvm::BasicBlock*,
                                      std::set<const llvm::BasicBlock*>>& bedges,
                             std::vector<const llvm::BasicBlock*>& bs,
                              std::map< const llvm::BasicBlock*, unsigned >& o_map);
void collect_loop_backedges(llvm::Pass *p,
                        std::map< const bb*, bb_set_t>& loop_ignore_edge,
                        std::map< const bb*, bb_set_t>& rev_loop_ignore_edge);

void collect_loop_backedges(llvm::Loop *L,
                        std::map< const bb*, bb_set_t>& loop_ignore_edge,
                        std::map< const bb*, bb_set_t>& rev_loop_ignore_edge);

void find_cutpoints(llvm::Pass* P, llvm::Function &f, std::vector< llvm::BasicBlock* >& cutPoints);
// void create_segments(llvm::Function &f,
//                      std::vector< llvm::BasicBlock* >& cutPoints,
//                      std::vector< segment >& segVec);
int readInt( const llvm::ConstantInt* );
void buildBlockMap(llvm::BasicBlock*, std::map<std::string, llvm::Value*>&);
bool deleteLoop(llvm::Loop *, llvm::DominatorTree &, llvm::ScalarEvolution &, llvm::LoopInfo &);

std::string demangle( std::string );

// std::string getLocation(const llvm::BasicBlock* b );
// std::string getLocation(const llvm::Instruction* I );
std::string getLocRange(const llvm::BasicBlock* b );

src_loc getLoc( const llvm::Instruction* I );
sort llvm_to_sort( solver_context& , llvm::Type* );
sort llvm_to_bv_sort( solver_context& , llvm::Type* );
sort llvm_to_sort( options& , llvm::Type* );
// expr read_const( const llvm::Value*, solver_context& );
expr read_const( options&, const llvm::Value*);

#endif
