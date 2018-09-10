#include "loopdata.h"


void loopdata::
getWrittenArrays(std::vector<const llvm::AllocaInst*>& arrays_updated) {
  for(auto iter = arrWrite.begin(); iter != arrWrite.end(); ++iter) {
    if( auto g = llvm::dyn_cast<const llvm::AllocaInst>( iter->first )) {
      arrays_updated.push_back(g);
    } else {
      llvm_bmc_error("bmc loop pass", "Unsupported value in array write list");       }
  }
}

void loopdata::
getWrittenGlbs(std::vector<const llvm::GlobalVariable*>& glbs_updated) {
  for(auto iter = glbWrite.begin(); iter != glbWrite.end(); ++iter) {
    if( auto g = llvm::dyn_cast<const llvm::GlobalVariable>( iter->first )) {
      glbs_updated.push_back(g);
    } else {
      llvm_bmc_error("bmc loop pass", "Unsupported value in glbvar write list");      }
  }
}

void loopdata::setPureReadHeap() {
  bool is_written = false;
  for(auto r_iter = arrRead.begin(); r_iter != arrRead.end(); ++r_iter) {
    is_written = false;
    if( auto ar = llvm::dyn_cast<const llvm::AllocaInst>( r_iter->first )) {
      for(auto w_it = arrWrite.begin(); w_it != arrWrite.end(); ++w_it) {
        if( auto aw = llvm::dyn_cast<const llvm::AllocaInst>( w_it->first )){
          if(aw == ar && !w_it->second.empty()) {
            is_written = true;
            break;
          } else {} // do nothing
        } else {
          llvm_bmc_error("bmc loop pass", "Unsupported value in array writes");           }
      }
      if(!is_written) {
        arrPureRead.push_back(ar);
      } else {} // do nothing
    } else {
      llvm_bmc_error("bmc loop pass", "Unsupported value in array reads");
    }
  }

  is_written = false;
  for(auto r_iter = glbRead.begin(); r_iter != glbRead.end(); ++r_iter) {
    is_written = false;
    if( auto gr = llvm::dyn_cast<const llvm::GlobalVariable>( r_iter->first)){
      for(auto w_it = glbWrite.begin(); w_it != glbWrite.end(); ++w_it) {
        if( auto gw = llvm::dyn_cast<const llvm::GlobalVariable>(w_it->first)){
          if(gw == gr && !w_it->second.empty()) {
            is_written = true;
            break;
          } else {} // do nothing
        } else {
          llvm_bmc_error("bmc loop pass", "Unsupported value in glbvar writes");          }
      }
      if(!is_written) {
        glbPureRead.push_back(gr);
      } else {} // do nothing
    } else {
      llvm_bmc_error("bmc loop pass", "Unsupported value in glbvar reads");
    }
  }
}


// std::string loopdata::getHeadPhiName( llvm::PHINode * phi ) {
//   return headPhiNameMap.at(phi);
// }

// void loopdata::setHeadPhiName( llvm::PHINode * phi, std::string name ) {
//   headPhiNameMap[ phi ] = name;
// }



void loopdata::print(std::ostream& o) {
  o << "\nLoopdata pointer is : " << this << "\n";
  o << "Loop pointer is : " << loop << "\n";
  // o << "Loop counter is : " << ctrZ3Expr << "\n";
  // o << "Loop init bound is : " << initBound << "\n";
  // o << "Loop exit bound is : " << exitBound << "\n";
  // o << "Loop step count is : " << stepCnt << "\n";
  o << "Loop parent is : " << parent << "\n\n";

  // o << "Printing read index exprs\n";
  // for(auto bit=arrReadExpr.begin(); bit!=arrReadExpr.end(); bit++) {
  //   o << "\nArray pointer : " << bit->first <<"\n";
  //   for(z3::expr e : bit->second) {
  //     o << e << "\n";
  //   }
  // }
  // o << "\nPrinting written index exprs\n";
  // for(auto bit=arrWriteExpr.begin(); bit!=arrWriteExpr.end(); bit++) {
  //   o << "\nArray pointer : " << bit->first <<"\n";
  //   for(z3::expr e : bit->second) {
  //     o << e << "\n";
  //   }
  // }
  // o << "\nPrinting written index min max exprs\n";
  // for(auto bit=writeMinMax.begin(); bit!=writeMinMax.end(); bit++) {
  //   o << "\nArray pointer : " << bit->first <<"\n";
  //   for(z3::expr e : bit->second) {
  //     o << e << "\n";
  //   }
  // }

  o << "\nFinished printing of loop data object\n\n";
}

void loopdata::dump() {
  print( std::cerr );
}
