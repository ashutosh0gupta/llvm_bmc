#ifndef BUILD_NAME_MAP_H
#define BUILD_NAME_MAP_H

#include "lib/utils/llvm_utils.h"

class build_name_map : public llvm::FunctionPass
{
public:
  static char ID;


  build_name_map(
                 // value_expr_map&,
                 name_map&,
                 std::map<const bb*, rev_name_map >&,
                 std::map<const bb*, rev_name_map >&
                 );
  ~build_name_map();

  std::map< const bb*, rev_name_map >& revStartLocalNameMap;//todo: likely useless
  std::map< const bb*, rev_name_map >& revEndLocalNameMap;
  name_map& localNameMap;
  //  std::map<std::string, llvm::Value*> nameValMap;
  // value_expr_map& def_map;

  void buildRevNameMap( llvm::Function &f );
  void buildParamExpr( llvm::Function &f );

  virtual bool runOnFunction(llvm::Function &f);
  llvm::StringRef getPassName() const;
  void getAnalysisUsage(llvm::AnalysisUsage &au) const;
};

#endif // BUILD_NAME_MAP_H
