#ifndef LLVM_DECLS_H
#define LLVM_DECLS_H

#include <map>
#include "llvm/IR/Instructions.h"

#include <boost/filesystem.hpp>

typedef std::map<const llvm::Value*, std::string> name_map;
typedef std::map<std::string, const llvm::Value*> rev_name_map;

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
  void print_short(std::ostream&);

  bool operator==(const src_loc &other) const {
    return other.line == line && other.col == col && other.file == file;
  }
};

class comment{
public:
  // comment( std::string text_, src_loc start_, src_loc end_ ) :
  //   text(text_), start(start_), end(end_) {};
  std::vector<std::string> texts;
  src_loc start;
  src_loc end;
  const llvm::BasicBlock* b = NULL;
  void add_comments( const std::vector<std::string>& cmts );

  expr to_sol_expr( solver_context sol_ctx, rev_name_map& n_map );

  void dump();
  void print(std::ostream& );
};

class comments {
public:
  std::vector< comment > start_comments;
  std::vector< comment > end_comments;
};

std::unique_ptr<llvm::Module> c2ir( options&,  comments& );

void c2bc( const std::string&, const std::string& );

std::unique_ptr<llvm::Module> c2ir( std::string, llvm::LLVMContext& );

void dump_dot_module( boost::filesystem::path& dump_path,
                      std::unique_ptr<llvm::Module>& module );

void
estimate_comment_location(std::unique_ptr<llvm::Module>& module,
                          comments&,
                          std::map< const llvm::BasicBlock*,comments >&);

void setLLVMConfigViaCommandLineOptions( std::string strs );

#endif
