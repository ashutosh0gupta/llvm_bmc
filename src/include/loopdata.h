#ifndef LOOPDATA_H
#define LOOPDATA_H

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunused-parameter"
#include "llvm/IR/Instructions.h"
#include "llvm/Analysis/LoopPass.h"
#pragma GCC diagnostic pop

class collect_loopdata;

class loopdata {

  llvm::Loop* loop = NULL;     // pointer to the loop

  loopdata* parent = NULL;     // for travering the loop graph
  std::vector<loopdata*> childHeads;
  std::vector<loopdata*> next; // in case of "if" there can be multiple nexts
  std::vector<const llvm::BasicBlock*> to_inner;
  std::vector<const llvm::BasicBlock*> blocks;

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
  inline void addBlock(const llvm::BasicBlock* b) { blocks.push_back(b); }
  // inline void setStepCnt(int step) { stepCnt = step; }

  void setHeadPhiName( llvm::PHINode *, std::string );


  //getters
  inline llvm::Loop* getLoop() { return loop; }
  inline const std::vector<loopdata*>& getSubLoops() { return childHeads; }
  inline unsigned getSubLoopsNum() { return childHeads.size(); }
  inline const std::map<llvm::Value*, std::list<llvm::Value*>>&
  getArrWrites() { return arrWrite; }
  inline const std::map<llvm::Value*, std::list<llvm::Value*>>&
  getGlbWrites() { return glbWrite; }
  //return a list of blocks that only includes block from the current folder
  const std::vector<const llvm::BasicBlock*>& getCurrentBlocks() { return blocks; }

  const llvm::BasicBlock* getLoopPredecessor();
  void getLoopPredecessor(std::vector<const llvm::BasicBlock*>& return_blocks);

  void getExitingBlocks( std::vector<std::pair<const llvm::BasicBlock*, unsigned> >& return_blocks);
  void getLoopLatches( std::vector<const llvm::BasicBlock*>& return_blocks );

  void print(std::ostream& o);
  void dump();
  friend collect_loopdata;
};

#endif
