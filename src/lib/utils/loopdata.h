#ifndef LOOPDATA_H
#define LOOPDATA_H

#include "lib/utils/llvm_utils.h"

class loopdata {
  // z3::context& c;

  llvm::Loop* loop = NULL;     // pointer to the loop

  loopdata* parent = NULL;     // for travering the loop graph
  std::vector<loopdata*> childHeads;
  std::vector<loopdata*> next; // in case of "if" there can be multiple nexts
  bb_vec_t to_inner;
  bb_vec_t blocks;

  // counter
  llvm::Value* ctr;     // llvm object for the counter
  llvm::Value* ctr_out; // llvm object for the counter value from latch
  std::string ctrName;  // string for the counter

  // Overlap Variables
  std::vector<llvm::Value*> ov_inp;
  std::vector<llvm::Value*> ov_out;

  std::vector<llvm::Value*> aggr_arr;

  // Constant Variables accessed but not modified in the loop
  std::vector<llvm::Value*> const_val;

  // Eliminate vars
  std::vector<llvm::Value*> quant_elim_val;

  // Array which are read but not written
  std::vector<const llvm::AllocaInst*> arrPureRead;

  // Array reads and writes
  std::map<llvm::Value*, std::list<llvm::Value*>> arrRead;
  std::map<llvm::Value*, std::list<llvm::Value*>> arrWrite;

  // Globals which are read but not written
  std::vector<const llvm::GlobalVariable*> glbPureRead;

  // Global reads and writes
  std::map<llvm::Value*, std::list<llvm::Value*>> glbRead;
  std::map<llvm::Value*, std::list<llvm::Value*>> glbWrite;

  // Assertion
  bool is_assert_loop = false;


public:

  void getWrittenArrays(std::vector<const llvm::AllocaInst*>& );
  void getWrittenGlbs(std::vector<const llvm::GlobalVariable*>& );

  void setPureReadHeap();


  loopdata( llvm::Loop *l) : loop(l) {}

  ~loopdata() {}

  // setters
  inline void setLoop(llvm::Loop *l) { loop = l; }
  inline void setParent(loopdata *p) { parent = p; }
  inline void addChildHead(loopdata *ch) { childHeads.push_back(ch); }
  inline void addNextToVec(loopdata *n) { next.push_back(n); }
  inline void setCtr(llvm::Value *v) { ctr = v; }
  inline void setCtrName(std::string cn) { ctrName = cn; }
  // inline void setStepCnt(int step) { stepCnt = step; }

  void setHeadPhiName( llvm::PHINode *, std::string );

  // void setCtrZ3Expr(z3::expr ce);
  // void setInitBound(z3::expr e);
  // void setExitBound(z3::expr e);

  //getters
  inline llvm::Loop* getLoop() { return loop; }
  //return a list of blocks that only includes block from the current folder
  inline const bb_vec_t& getCurrentBlocks() { return blocks; }

  inline const bb* getLoopPredecessor() {
    if( loop == NULL ) return NULL;
    auto b = loop->getLoopPredecessor();
    assert( b );
    return b;
  }

  inline void getLoopPredecessor( bb_vec_t& return_blocks ) {
    auto b = getLoopPredecessor();
    assert( b );
    return_blocks.clear();
    return_blocks.push_back(b);
  }

  inline
  void getExitingBlocks( std::vector<
                         std::pair<const bb*, unsigned> >& return_blocks) {
    if( loop == NULL ) return;
    llvm::SmallVector< std::pair<const bb*,const bb*>,10> exitEdges;
    loop->getExitEdges( exitEdges );
    for( auto e : exitEdges ) {
      unsigned succ_num = getSuccessorIndex( e.first, e.second );
      return_blocks.push_back( {e.first, succ_num} );
    }
  }

  inline void getLoopLatches( bb_vec_t& return_blocks ) {
    if( loop == NULL ) return;
    llvm::SmallVector<bb*,10> blocks;
    loop->getLoopLatches( blocks);
    for( auto b : blocks ) {
      return_blocks.push_back( b );
    }
  }
  void print(std::ostream& o);
  void dump();
};

#endif
