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


// void collect_loopdata::populate_head_phi_names(llvm::Loop *L, loopdata* ld) {
//   for (llvm::BasicBlock::iterator I = L->getHeader()->begin();
//        llvm::isa<llvm::PHINode>(I); ++I) {
//     llvm::PHINode *phi = llvm::cast<llvm::PHINode>(I);
//     unsigned num = phi->getNumIncomingValues();
//     bool found = false;
//     for ( unsigned i = 0 ; i < num ; i++ ) {
//       llvm::Value *v = phi->getIncomingValue(i);
//       if(llvm::Instruction *I = llvm::dyn_cast<llvm::Instruction>(v)) {
//         if(isInLatch(I, L)) {
//           std::string instName = localNameMap.at(I);
//           ld->setHeadPhiName( phi, instName );
//           found = true;
//         }
//       }
//     }
//     if( !found ) {
//       // If this function fails, investigate to find the (correct) name
//       llvm_bmc_error("collect_loopdata::","name of a phi node not found!!");
//     }
//   }
// }

// void collect_loopdata::populate_ctr_data(llvm::Loop *L, loopdata* ld) {
//   auto PhiVar = getInductionVariable(L, SE);
//   if(PhiVar) {
//     unsigned num = PhiVar->getNumIncomingValues();
//     for ( unsigned i = 0 ; i < num ; i++ ) {
//       llvm::Value *v = PhiVar->getIncomingValue(i);
//       if(llvm::Instruction *I = llvm::dyn_cast<llvm::Instruction>(v)) {
//         if(isInLatch(I, L)) {
//           ld->setCtr(PhiVar);
//           ld->ctr_out = v;
//           std::string instName = localNameMap.at(PhiVar);
//           ld->setCtrName(instName);
//           // z3::expr var = z3_ctx.int_const(instName.c_str());
//           std::list<z3::expr> le = ir2e->getZ3Expr(PhiVar);
//           assert(le.size()!=0);
//           ld->setCtrZ3Expr(le.front());
//           populate_step_count(PhiVar, ld);
//         } else {
//           populate_init_bound(v, ld);
//         }
//       } else if( llvm::dyn_cast<llvm::ConstantInt>(v) ) {
//         populate_init_bound(v, ld);
//       } else {
//         llvm_bmc_error("collect_loopdata::","unsupported structure in phi node");
//       }
//     }
//     populate_exit_bound(L, ld);
//   } else {
//     llvm_bmc_error("transform::","Failed to identify the counter for the loop!");
//   }
// }

// void collect_loopdata::populate_step_count( llvm::PHINode *PhiVar, loopdata* ld) {
//   //Get the step count value
//   const llvm::SCEVAddRecExpr *AddRec =
//     llvm::dyn_cast<llvm::SCEVAddRecExpr>(SE->getSCEV(PhiVar));
//   const llvm::SCEV *Step = AddRec->getStepRecurrence(*SE);
//   if (const llvm::SCEVConstant *SC =
//       llvm::dyn_cast<llvm::SCEVConstant>(Step)) {
//     if( const llvm::ConstantInt* c =
//         llvm::dyn_cast<llvm::ConstantInt>(SC->getValue()) ) {
//       if (c->isOne() || c->isMinusOne()) {
//         unsigned bw = c->getBitWidth();
//         if( bw == 32 || bw == 64 ) {
//           int i = *(c->getUniqueInteger().getRawData());
//           ld->setStepCnt(i);
//           // z3::expr step = z3context.int_val(i);
//         }
//       } else {
//         // llvm_bmc_error("collect_loopdata::",
//         std::cout << "Loop counter in not incremented or decremented by one!\n";
//         ld->setStepCnt(0);
//       }
//     }
//   }
// }

// void collect_loopdata::populate_init_bound(llvm::Value *v, loopdata* ld) {
//   std::list<z3::expr> initList = ir2e->getZ3Expr(v);
//   if(!initList.empty()) {
//     ld->setInitBound(initList.front().simplify());
//   } else {
//     std::cout << "\nUnknown cntr init value\n";
//   }
// }

// void collect_loopdata::populate_exit_bound(llvm::Loop *L, loopdata* ld) {
//   bool isStrict = false;
//   std::list<z3::expr> exitList;
//   llvm::SmallVector<bb *, 10> LoopLatches;

//   L->getLoopLatches(LoopLatches);
//   for (bb *b : LoopLatches) {
//     assert(L->contains(b));
//     compute_exit_list(ld->ctr_out, b, exitList, isStrict, true);
//   }

//   if(exitList.empty()) {
//     auto b = L->getHeader();
//     compute_exit_list(ld->ctr_out, b, exitList, isStrict, false);
//   }

//   if(!exitList.empty()) {
//     if(isStrict){
//       ld->setExitBound((exitList.front()-ld->stepCnt).simplify());
//     } else {
//       ld->setExitBound(exitList.front().simplify());
//     }
//   } else {
//     std::cout << "\nUnknown loop counter exit bound\n";
//   }
// }

// void collect_loopdata::compute_exit_list(llvm::Value* ctr, bb* b, std::list<z3::expr>& exitList,
//                                          bool& isStrict, bool inLatch) {
//   assert(ctr); assert(b);
//   auto term_inst = b->getTerminator();
//   if (llvm::BranchInst *bi = llvm::dyn_cast<llvm::BranchInst>(term_inst)) {
//     if(!bi->isConditional()) return;
//     llvm::Value *loopCond = bi->getCondition();
//     if( llvm::ICmpInst* icmp = llvm::dyn_cast<llvm::ICmpInst>(loopCond) ) {
//       if(icmp->isEquality())
//         llvm_bmc_error("collect_loopdata::", "Loop condition must be relational");
//       isStrict = icmp->isFalseWhenEqual();
//       auto op0 = icmp->getOperand(0);
//       auto op1 = icmp->getOperand(1);
//       if( hasPhiNode(op0) && !hasPhiNode(op1) ) {
//         exitList = ir2e->getZ3Expr(op1);
//       } else if( hasPhiNode(op1) && !hasPhiNode(op0) ) {
//         exitList = ir2e->getZ3Expr(op0);
//       } else if( hasPhiNode(op1) && hasPhiNode(op0) ) {
//         if(ctr == op0 && ctr != op1) {
//           exitList = ir2e->getZ3Expr(op1);
//         } else if(ctr == op1 && ctr != op0) {
//           exitList = ir2e->getZ3Expr(op0);
//         } else {
//           llvm_bmc_error("collect_loopdata::", "Loop condition of unsupported format");
//         }
//       } else {
//         if(!inLatch) llvm_bmc_error("collect_loopdata::",
//                                  "Loop condition of unsupported format");
//       }
//     } else {
//       if(!inLatch) llvm_bmc_error("collect_loopdata::",
//                                "Unsupported comparision in loop condition");
//     }
//   } else {
//     llvm_bmc_error("collect_loopdata::", "Terminator not a branch instrunction!");
//   }
// }

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

// void collect_loopdata::collect_overlap(llvm::Loop *L, loopdata* ld) {
//   for( auto b: L->getBlocks() ) {
//     //    if(find(ld->blocks.begin(), ld->blocks.end(), b) == ld->blocks.end())
//     //      continue;
//     for( llvm::Instruction& Iobj : b->getInstList() ) {
//       llvm::Instruction* I = &(Iobj);
//       if( llvm::PHINode* phi = llvm::dyn_cast<llvm::PHINode>(I) ) {
//         if(phi == ld->ctr) continue;
//         if(!isInHeader(llvm::dyn_cast<llvm::Instruction>(phi), L)) {
//           if(!isInLatch(llvm::dyn_cast<llvm::Instruction>(phi), L)) {
//             ld->quant_elim_val.push_back(phi);
//           } else { } // no error
//         } else {
//           ld->ov_inp.push_back(phi);
//           //std::cout << "\nFound an input\n";
//           //phi->print( llvm::outs() );
//           unsigned num = phi->getNumIncomingValues();
//           for ( unsigned i = 0 ; i < num ; i++ ) {
//             llvm::Value *v = phi->getIncomingValue(i);
//             if(llvm::isa<llvm::Instruction>(v)) {
//               ld->ov_out.push_back(v);
//               //std::cout << "\nFound an output\n";
//               //v->print( llvm::outs() );
//             } else if( llvm::isa<llvm::Constant>(v) ) {
//               continue; // Constants values are not inputs
//             } else {} // no error
//           }
//         }
//       } else {} // no error
//     }
//   }
// }

// void collect_loopdata::collect_arr_n_glb_read_write(llvm::Loop *L, loopdata* ld) {
//   for( auto b: L->getBlocks() ) {
//     //    if(find(ld->blocks.begin(), ld->blocks.end(), b) == ld->blocks.end())
//     //      continue;
//     for( llvm::Instruction& Iobj : b->getInstList() ) {
//       llvm::Instruction* I = &(Iobj);
//       if( auto load = llvm::dyn_cast<llvm::LoadInst>(I) ) {
//         auto addr = load->getOperand(0);
//         if(auto elemPtr = llvm::dyn_cast<llvm::GetElementPtrInst>(addr) ) {
//           auto idx = elemPtr->getOperand(1);
//           if(elemPtr->getNumIndices() == 2) idx = elemPtr->getOperand(2);
//           std::list<z3::expr> le = ir2e->getZ3Expr(idx);
//           assert(le.size()!=0);
//           ld->arrReadExpr[elemPtr->getPointerOperand()].push_back(le.front());
//           ld->arrRead[elemPtr->getPointerOperand()].push_back(load);
//           ld->ov_inp.push_back(load);
//         } else if(llvm::isa<const llvm::GlobalVariable>(addr)) {
//           ld->glbRead[load->getPointerOperand()].push_back(load);
//           ld->ov_inp.push_back(load);
//         } else {
//           llvm_bmc_error("collect_loopdata", "Only array and global write/read supported!");
//         }
//       } else if( auto store = llvm::dyn_cast<llvm::StoreInst>(I) ) {
//         auto addr = store->getOperand(1);
//         if(auto elemPtr = llvm::dyn_cast<llvm::GetElementPtrInst>(addr) ) {
//           auto idx = elemPtr->getOperand(1);
//           if(elemPtr->getNumIndices() == 2) idx = elemPtr->getOperand(2);
//           std::list<z3::expr> le = ir2e->getZ3Expr(idx);
//           assert(le.size()!=0);
//           ld->arrWriteExpr[elemPtr->getPointerOperand()].push_back(le.front());
//           ld->arrWrite[elemPtr->getPointerOperand()].push_back(store);
//           ld->ov_out.push_back(store);
//           if(!llvm::isa<llvm::Constant>(store->getValueOperand())) {
//             ld->aggr_arr.push_back(store->getValueOperand());
//           } else {} // not an aggregator
//         } else if(llvm::isa<const llvm::GlobalVariable>(addr)) {
//           ld->glbWrite[store->getPointerOperand()].push_back(store);
//           ld->ov_out.push_back(store);
//           // TODO
//           //          if(!llvm::isa<llvm::Constant>(store->getValueOperand())) {
//           //            ld->aggr_glb.push_back(store->getValueOperand());
//           //          } else {} // not an aggregator
//         } else {
//           llvm_bmc_error("collect_loopdata", "Only array and global write/read supported!");
//         }
//       } else { }  // no error here
//     }
//   }
//   ld->setPureReadArrays();
//   ld->setPureReadGlbs();
// }

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

// void collect_loopdata::collect_tiles(llvm::Loop *L, loopdata *ld) {
//   std::map<llvm::Value*,std::list<llvm::Value*>>::iterator bit = ld->arrWrite.begin();
//   std::map<llvm::Value*,std::list<llvm::Value*>>::iterator eit = ld->arrWrite.end();

//   z3::expr_vector src(z3_ctx);
//   src.push_back(ld->ctrZ3Expr);

//   for (; bit!=eit; bit++) {
//     std::list<llvm::Value*> vl = bit->second;
//     std::list<z3::expr>& el = ld->arrWriteExpr[bit->first];
//     el.sort(z3::eq);
//     el.unique(z3::eq);
//     std::list<z3::expr>& mm_el = ld->writeMinMax[bit->first];

//     for(z3::expr e : el) {
//       z3::expr_vector dst(z3_ctx);
//       dst.push_back(ld->initBound);
//       mm_el.push_back(e.substitute(src, dst));
//       z3::expr_vector dst2(z3_ctx);
//       dst2.push_back(ld->exitBound);
//       mm_el.push_back(e.substitute(src, dst2));
//     }

//     z3::expr e = getTileExprFromList(L, el);
//     auto pair = std::make_pair(bit->first, e);
//     ld->writeTile.insert(pair);
//     bool overlap = checkOverlap(e, ld->ctrZ3Expr, ld->stepCnt);
//     ld->isWriteOverlapping[bit->first] = overlap;

//     std::list<z3::expr> diff_el;
//     for(z3::expr e : el) {
//       bool flag = false;
//       for(loopdata* ch : ld->childHeads) {
//         for ( z3::expr sub_e : ch->arrWriteExpr[bit->first]) {
//           if(z3::eq(e,sub_e)) flag = true;
//         }
//       }
//       if(flag == false) diff_el.push_back(e);
//     }
//     if(diff_el.size() == 0) {
//       ld->numUpdInd[bit->first] = 1;
//     } else {
//       ld->numUpdInd[bit->first] = diff_el.size();
//     }

//     if(!overlap) {
//       ld->writeTileSize[bit->first] = el.size();
//     } else {
//       // TODO reduce the size by considering the size of the refined tile expr
//       ld->writeTileSize[bit->first] = el.size() - 1;
//     }
//   }

//   for(loopdata* ch : ld->childHeads) {
//     for (bit = ch->arrWrite.begin(); bit!=ch->arrWrite.end(); bit++) {
//       std::list<z3::expr>& mm_el = ld->writeMinMax[bit->first];
//       std::list<z3::expr>& ch_mm_el = ch->writeMinMax[bit->first];
//       for(z3::expr e : ch_mm_el) {
//         z3::expr_vector dst(z3_ctx);
//         dst.push_back(ld->initBound);
//         mm_el.push_back(e.substitute(src, dst));
//         z3::expr_vector dst2(z3_ctx);
//         dst2.push_back(ld->exitBound);
//         mm_el.push_back(e.substitute(src, dst2));
//       }
//       mm_el.sort(z3::eq);
//       mm_el.unique(z3::eq);
//     }
//   }

// }

// void collect_loopdata::compute_peel_direction(llvm::Loop *L, loopdata *ld) {
//   if(ld->stepCnt > 0) {
//     ld->peel_direction_first = false;
//   } else {
//      ld->peel_direction_first = true;
//   }

//   bool is_cntr_neg_in_tile = false;
//   std::vector<int> l;
//   exprs vs;
//   vs.push_back(ld->ctrZ3Expr);
//   std::map<llvm::Value*,std::list<z3::expr>>::iterator bit;
//   for (bit = ld->arrWriteExpr.begin(); bit!=ld->arrWriteExpr.end(); bit++) {
//     std::list<z3::expr>& mm_el = bit->second;
//     for(z3::expr e : mm_el) {
//       expr_to_linear_term(e, vs, l);
//       if(l[0] < 0) {
//         is_cntr_neg_in_tile = true;
//       }
//     }
//   }
//   if(is_cntr_neg_in_tile) {
//     ld->peel_direction_first = !ld->peel_direction_first;
//   }
//   if(ld->childHeads.size()>0) {
//     ld->peel_direction_first = !ld->peel_direction_first;
//     for(loopdata* ch : ld->childHeads) {
//       ch->peel_direction_first = !ch->peel_direction_first;
//     }
//   }
// }

// z3::expr collect_loopdata::getTileExprFromList(llvm::Loop *L, std::list<z3::expr> l) {
//   std::string lbName = "__lb";
//   std::string ubName = "__ub";
//   std::string jpName = "loopind_p";
//   z3::expr lbVar = z3_ctx.int_const(lbName.c_str());
//   z3::expr ubVar = z3_ctx.int_const(ubName.c_str());
//   z3::expr jpVar = z3_ctx.int_const(jpName.c_str());

//   z3::expr lbandexp(z3_ctx);
//   z3::expr ubandexp(z3_ctx);
//   z3::expr lborexp(z3_ctx);
//   z3::expr uborexp(z3_ctx);
//   int cnt = 0;
//   for(auto e = l.begin(); e!=l.end(); e++) {
//     if(cnt == 0) {
//       lbandexp = (lbVar <= *e);
//       ubandexp = (ubVar >= *e);
//       lborexp = (lbVar >= *e);
//       uborexp = (ubVar <= *e);
//     } else {
//       lbandexp = lbandexp && (lbVar <= *e);
//       ubandexp = ubandexp && (ubVar >= *e);
//       lborexp = lborexp || (lbVar >= *e);
//       uborexp = uborexp || (ubVar <= *e);
//     }
//     cnt++;
//   }

//   if(cnt !=0 ) {
//     z3::expr lbexp(z3_ctx);
//     z3::expr ubexp(z3_ctx);
//     lbexp = lbandexp && lborexp;
//     ubexp = ubandexp && uborexp;
//     z3::expr e = lbexp && ubexp;
//     e = e && (lbVar <= jpVar) && (ubVar >= jpVar);
//     return e;
//   } else {
//     //    std::cout << "No index expressions for tile generation";
//     return (lbVar <= jpVar) && (ubVar >= jpVar);
//   }
// }

// bool collect_loopdata::checkOverlap(z3::expr e, z3::expr i, int stepcnt) {
//   z3::expr_vector ipsrc(z3_ctx);
//   z3::expr_vector ipdst(z3_ctx);

//   std::string lbName = "__lb";
//   std::string ubName = "__ub";
//   z3::expr lb = z3_ctx.int_const(lbName.c_str());
//   z3::expr ub = z3_ctx.int_const(ubName.c_str());

//   std::string lbpName = lbName+"_p";
//   std::string ubpName = ubName+"_p";
//   z3::expr lbp = z3_ctx.int_const(lbpName.c_str());
//   z3::expr ubp = z3_ctx.int_const(ubpName.c_str());

//   ipsrc.push_back(ub);
//   ipsrc.push_back(lb);
//   ipdst.push_back(ubp);
//   ipdst.push_back(lbp);

//   std::string ipStr = "__T_i";
//   z3::expr ip = z3_ctx.int_const(ipStr.c_str());

//   ipsrc.push_back(i);
//   ipdst.push_back(ip);
//   z3::expr ineqip = (ip >= i + stepcnt || i >= ip + stepcnt);

//   z3::expr sub_e = e.substitute(ipsrc, ipdst);

//   z3::solver s(z3_ctx);
//   s.add(e);
//   s.add(sub_e);
//   s.add(ineqip);
//   if (s.check() == z3::sat) {
//     // std::cout << "\n\n Collect Loop Data : Overlap \n\n";
//     // std::cout << "\nSolver contents of overlapping tile\n" << s << "\n";
//     return true;
//   } else {
//     // std::cout << "\n\n Collect Loop Data : No overlap \n\n";
//     return false;
//   }
// }

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
    llvm::StringRef fname = fit->getName();
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
