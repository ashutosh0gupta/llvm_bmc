#ifndef LLVMUTILS_H
#define LLVMUTILS_H

#include <set>
#include <list>
#include <map>
#include "lib/utils/z3_utils.h"
// #include "daikon-inst/segment.h"

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunused-parameter"
#include "llvm/IR/TypeBuilder.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/IntrinsicInst.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/LinkAllPasses.h"
#pragma GCC diagnostic pop


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


typedef std::map<const llvm::Value*, std::string> name_map;
typedef std::map<std::string, const llvm::Value*> rev_name_map;

#define COMMENT_PREFIX_LEN 3
#define COMMENT_PREFIX "//!"

// Enable test of the first token
// #define COMMENT_FIRST_TOKEN "(assert"

class src_loc {
public:
  src_loc( unsigned line_, unsigned col_, std::string file_ ) :
    line(line_), col(col_), file(file_) {};
  src_loc() : line(0), col(0), file("") {};
  unsigned line;
  unsigned col;
  std::string file;

  void dump();
  void print(std::ostream&);

  bool operator==(const src_loc &other) const {
    return other.line == line && other.col == col && other.file == file;
  }
};

class comment{
public:
  // comment( std::string text_, src_loc start_, src_loc end_ ) :
  //   text(text_), start(start_), end(end_) {};
  std::string text;
  src_loc start;
  src_loc end;
  const bb* b = NULL;
  z3::expr to_z3_expr( z3::context z3_ctx, rev_name_map& n_map );

  void dump();
  void print(std::ostream& );
};

class comments{
  std::map< const bb*, std::vector< comment > > start_comments;
  std::map< const bb*, std::vector< comment > > end_comments;
};

std::unique_ptr<llvm::Module>
c2ir( std::string, llvm::LLVMContext&, std::vector< comment >& );

void c2bc( const std::string&, const std::string& );

std::unique_ptr<llvm::Module> c2ir( std::string, llvm::LLVMContext& );


llvm::Instruction*
estimate_comment_location( std::unique_ptr<llvm::Module>&, src_loc, src_loc);

void
estimate_comment_location(std::unique_ptr<llvm::Module>& module,
                          std::vector< comment >& comments,
                          std::map< const bb*,
                          std::pair< std::vector<std::string>,
                                     std::vector<std::string> >  >&
);

void setLLVMConfigViaCommandLineOptions( std::string strs );

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
llvm::Value* getArrValueFromZ3Expr(llvm::Value*, z3::expr, llvm::IRBuilder<>&, llvm::LLVMContext&,
                                   std::map<std::string, llvm::Value*>&, std::set<llvm::Value*>&);
llvm::Value* getValueFromZ3Expr(z3::expr, llvm::IRBuilder<>&, llvm::LLVMContext&,
                                std::map<std::string, llvm::Value*>&, std::set<llvm::Value*>&);
llvm::Value* getValueFromZ3SubExpr(z3::expr, llvm::IRBuilder<>&, llvm::LLVMContext&,
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
                            std::map< const llvm::BasicBlock*,
                                      std::set<const llvm::BasicBlock*>>& loop_ignore_edge,
                            std::map< const llvm::BasicBlock*,
                                      std::set<const llvm::BasicBlock*>>& rev_loop_ignore_edge);

void find_cutpoints(llvm::Pass* P, llvm::Function &f, std::vector< llvm::BasicBlock* >& cutPoints);
// void create_segments(llvm::Function &f,
//                      std::vector< llvm::BasicBlock* >& cutPoints,
//                      std::vector< segment >& segVec);
int readInt( const llvm::ConstantInt* );
void buildBlockMap(llvm::BasicBlock*, std::map<std::string, llvm::Value*>&);
bool deleteLoop(llvm::Loop *, llvm::DominatorTree &, llvm::ScalarEvolution &, llvm::LoopInfo &);

std::string getLocation(const llvm::BasicBlock* b );
std::string getLocation(const llvm::Instruction* I );
std::string getLocRange(const llvm::BasicBlock* b );

src_loc getLoc( const llvm::Instruction* I );
z3::sort llvm_to_z3_sort( z3::context& , llvm::Type* );
z3::expr read_const( const llvm::Value*, z3::context& );

typedef std::map< std::pair<const llvm::Value*,unsigned>,
                  z3::expr > ValueExprMap;

class value_expr_map {
public:
  value_expr_map( z3::context& ctx_ ) : ctx( ctx_ ) {};
  void insert_term_map( const llvm::Value*, unsigned, z3::expr );
  void insert_term_map( const llvm::Value*, z3::expr );
  z3::expr insert_new_def( const llvm::Value* op, unsigned c_count );
  z3::expr insert_new_def( const llvm::Value* );
  z3::expr read_constant( const llvm::Value* );
  z3::expr read_term( const llvm::Value*, unsigned );
  z3::expr get_earlier_term( const llvm::Value*, unsigned );
  z3::expr get_term( const llvm::Value*, unsigned );
  z3::expr get_term( const llvm::Value* op );
  z3::expr get_latest_term( const llvm::Value* );
  z3::expr create_fresh_name( const llvm::Value*  );
  unsigned get_max_version( const llvm::Value*);
  const std::vector<unsigned>& get_versions( const llvm::Value* );
  void copy_values(value_expr_map& m);
  void dump();
  void print( std::ostream& o );
private:
  z3::context& ctx;
  std::map< std::pair<const llvm::Value*,unsigned>, z3::expr > vmap;
  std::map< const llvm::Value*, std::vector<unsigned> > versions;
  std::vector<unsigned> dummy_empty_versions;
};

#endif
