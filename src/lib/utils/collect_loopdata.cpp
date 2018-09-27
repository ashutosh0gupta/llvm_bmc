#include "collect_loopdata.h"

char collect_loopdata::ID = 0;

collect_loopdata::collect_loopdata( options& o_,
                                    std::map<llvm::Loop*, loopdata*>& ldm,
                                    name_map& lMap,
                                    std::unique_ptr<llvm::Module>& m)
  : llvm::LoopPass(ID)
  , o(o_)
  , ld_map(ldm)
  , localNameMap(lMap)
  , module(m)
{}

collect_loopdata::~collect_loopdata() {}

bool collect_loopdata::doInitialization(llvm::Loop *L, llvm::LPPassManager &LPM) {
  return false; // did not modify the loop
}

bool collect_loopdata::runOnLoop(llvm::Loop *L, llvm::LPPassManager &LPM) {
  static bool called = false;
  if(!called) {
    collect_nonloop_blocks();
    called = true;
  }
  SE = &getAnalysis<llvm::ScalarEvolutionWrapperPass>().getSE();
  loopdata* ld = NULL;
  if( ld_map.find(L) == ld_map.end() ) {
    ld = new loopdata(L);
    ld->setLoop(L);
    auto pair = std::make_pair(L, ld);
    ld_map.insert(pair);
  }else{
    ld = ld_map.at(L);
  }
  // ir2e->setLoop(L);
  update_children_parent(L, ld);
  collect_blocks(L, ld);

  // populate_ctr_data(L, ld);
  // collect_overlap(L, ld);
  // collect_arr_n_glb_read_write(L, ld);
  collect_const_vars(L, ld->const_val);
  // collect_tiles(L,ld);
  // compute_peel_direction(L, ld);

  if(is_assert_loop(L)) {
    ld->is_assert_loop = true;
  }
  if(o.verbosity>2)
    ld->print(std::cerr);

  return false; // did not modify the loop
}

// The following function is from llvm LoopInterchange class.
// PHINode must be of integer type.
llvm::PHINode* collect_loopdata::
getInductionVariable(llvm::Loop *L, llvm::ScalarEvolution *SE) {
  llvm::PHINode* InnerIndexVar = L->getCanonicalInductionVariable();
  if (InnerIndexVar)
    return InnerIndexVar;
  if (L->getLoopLatch() == nullptr || L->getLoopPredecessor() == nullptr)
    return nullptr;
  for (llvm::BasicBlock::iterator I = L->getHeader()->begin();
       llvm::isa<llvm::PHINode>(I); ++I) {
    llvm::PHINode *PhiVar = llvm::cast<llvm::PHINode>(I);
    llvm::Type *PhiTy = PhiVar->getType();
    if (!PhiTy->isIntegerTy())
      return nullptr;
    const llvm::SCEVAddRecExpr *AddRec =
      llvm::dyn_cast<llvm::SCEVAddRecExpr>(SE->getSCEV(PhiVar));
    if (!AddRec || !AddRec->isAffine())
      continue;
    const llvm::SCEV *Step = AddRec->getStepRecurrence(*SE);
    if (!llvm::isa<llvm::SCEVConstant>(Step))
      continue;
    // Found the induction variable.
    // FIXME: Handle loops with more than one induction variable. Note that,
    // currently, legality makes sure we have only one induction variable.
    return PhiVar;
  }
  return nullptr;
}

bool collect_loopdata::hasPhiNode(llvm::Value* v) {
  assert(v);
  if (llvm::isa<llvm::PHINode>(v)) {
    return true;
  } else if(llvm::isa<llvm::BinaryOperator>(v)) {
    llvm::BinaryOperator* bop = llvm::dyn_cast<llvm::BinaryOperator>(v);
    auto op0 = bop->getOperand( 0 );
    auto op1 = bop->getOperand( 1 );
    if(hasPhiNode(op0)) { return true; }
    if(hasPhiNode(op1)) { return true; }
    return false;
  } else {
    return false;
  }
}


void collect_loopdata::collect_const_vars(llvm::Loop *L, std::vector<llvm::Value*>& const_val) {
  for( auto b: L->getBlocks()) {
    for( llvm::Instruction& Iobj : b->getInstList() ) {
      llvm::Instruction* I = &(Iobj);
      if( llvm::PHINode* phi = llvm::dyn_cast<llvm::PHINode>(I) ) {
        unsigned num = phi->getNumIncomingValues();
        for ( unsigned i = 0 ; i < num ; i++ ) {
          llvm::Value *v = phi->getIncomingValue(i);
          check_inst_add(L, v, const_val);
        }
      } else if( auto bop = llvm::dyn_cast<llvm::BinaryOperator>(I) ) {
        llvm::Value* op0 = bop->getOperand( 0 );
        llvm::Value* op1 = bop->getOperand( 1 );
        check_inst_add(L, op0, const_val);
        check_inst_add(L, op1, const_val);
      } else if( auto cmp = llvm::dyn_cast<llvm::CmpInst>(I) ) {
        llvm::Value* lhs = cmp->getOperand( 0 );
        llvm::Value* rhs = cmp->getOperand( 1 );
        check_inst_add(L, lhs, const_val);
        check_inst_add(L, rhs, const_val);
      } else if( auto br = llvm::dyn_cast<llvm::BranchInst>(I) ) {
        if( !br->isUnconditional() ) {
          check_inst_add(L, br->getCondition(), const_val);
        } else {} // no error
      } else if( auto ret = llvm::dyn_cast<llvm::ReturnInst>(I) ) {
        check_inst_add(L, ret->getReturnValue(), const_val);
      } else {} // no error
    }
  }
}

void collect_loopdata::check_inst_add(llvm::Loop* L, llvm::Value* v,
                                      std::vector<llvm::Value*>& const_val) {
  if(llvm::Instruction *I = llvm::dyn_cast<llvm::Instruction>(v)) {
    if(!L->contains(I->getParent())) {
      const_val.push_back(I);
    } else {} // no error
  } else {} // no error
}


void collect_loopdata::update_children_parent(llvm::Loop *L, loopdata* ld) {
  for(llvm::Loop* cl : L->getSubLoops()) {
    loopdata *chld = ld_map.at(cl);
    assert(chld);
    ld->addChildHead(chld);
    const llvm::BasicBlock* predecessor = cl->getLoopPredecessor();
    assert(predecessor);
    ld->to_inner.push_back(predecessor);
    chld->setParent(ld);
  }
}

void collect_loopdata::collect_blocks(llvm::Loop *L, loopdata *ld) {
  bool next_null=false;
  bool is_in_subloop=false;

  for(const bb* b: L->getBlocks()) {
    if(next_null==true) {
      next_null=false;
      ld->addBlock(NULL);
      continue;
    }
    for(llvm::Loop* cl : L->getSubLoops()) {
      loopdata *chld = ld_map.at(cl);
      assert(chld);
      if(find(chld->blocks.begin(), chld->blocks.end(), b) != chld->blocks.end()) {
        is_in_subloop = true;
        break;
      }
    }
    if(is_in_subloop == true) {
      is_in_subloop = false;
      continue;
    }
    if(find(ld->to_inner.begin(), ld->to_inner.end(), b) != ld->to_inner.end()) {
      next_null=true;
    }
    ld->addBlock(b);
  }
}

void collect_loopdata::
collect_allloop_blocks(loopdata* ld, std::vector<llvm::BasicBlock*>& l) {
  auto &LIWP = getAnalysis<llvm::LoopInfoWrapperPass>();
  auto LI = &LIWP.getLoopInfo();

  for (auto I = LI->rbegin(), E = LI->rend(); I != E; ++I) {
    llvm::Loop *L = *I;
    assert(L);
    for(bb* b: L->getBlocks()) {
      l.push_back(b);
    }
    loopdata* chld = NULL;
    if( ld_map.find(L) == ld_map.end() ) {
      chld = new loopdata(L);
      auto pair = std::make_pair(L, chld);
      ld_map.insert(pair);
    }else{
      chld = ld_map.at(L);
    }
    assert(chld);
    ld->addChildHead(chld);
  }
}

void collect_loopdata::collect_nonloop_blocks() {

  loopdata* ld = new loopdata(NULL);
  ld->setLoop(NULL);
  ld_map[NULL] = ld;

  std::vector<llvm::BasicBlock*> all_blocks;
  collect_allloop_blocks( ld, all_blocks );

  for (auto fit=module->begin(), endit=module->end(); fit!=endit; ++fit) {
    std::string fname = demangle(fit->getName().str());
    if(fname != o.funcName) {
      continue;
    } else {
      bool next_null=false;
      bool is_in_loop=false;
      for( auto bbit = fit->begin(), end = fit->end(); bbit != end; bbit++ ) {
        llvm::BasicBlock* b = &(*bbit);
        if(next_null==true) {
          next_null=false;
          ld->addBlock(NULL);
        }
        if(find(all_blocks.begin(), all_blocks.end(), b) != all_blocks.end()) {
          if(is_in_loop == false) {
            next_null=true;
          }
          is_in_loop = true;
          continue;
        } else {
          is_in_loop = false;
        }

        ld->addBlock(b);
      }
    }
  }
}

bool collect_loopdata::doFinalization() {
  return false; // did not modify the loop
}

llvm::StringRef collect_loopdata::getPassName() const {
  return "Collect necessary information about all loops in the program";
}

void collect_loopdata::getAnalysisUsage(llvm::AnalysisUsage &au) const {
  au.setPreservesAll();
  au.addRequired<llvm::LoopInfoWrapperPass>();
  au.addRequired<llvm::ScalarEvolutionWrapperPass>();
}
