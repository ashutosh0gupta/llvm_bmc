#ifndef TILER_GLB_MODEL_H
#define TILER_GLB_MODEL_H

#include "include/options.h"
#include "include/solver.h"

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunused-parameter"
#include "llvm/IR/Instructions.h"
#pragma GCC diagnostic pop

// namespace z3{
//   class context;
//   class expr;
//   class sort;
// }
// typedef z3::context solver_context;
// typedef z3::sort sort;
// typedef z3::expr expr;

class glb_state {
public:
  glb_state() {}
  std::vector<expr>& get_glb_name_vec() { return glb_names; };

private:
  std::vector<expr> glb_names;
};

class glb_model{
public:
  glb_model( solver_context& ctx_ ) : solver_ctx(ctx_) {}
  glb_model( solver_context& ctx_, glb_model& g_m_ ) : solver_ctx(ctx_)
    , glb_sorts( g_m_.get_sorts() )
    , glb_to_id( g_m_.get_glb_to_id() )
  {}

  void update_name(unsigned, std::vector<const llvm::GlobalVariable*>&);
  expr join_glb_state( std::vector<expr>&,
                           std::vector<unsigned>&, unsigned
                          // std::vector<const bb*>&, const bb*
                           );
  void init_state( unsigned );
  void set_state( unsigned, glb_state& );

  expr get_fresh_glb_name( unsigned, std::string );
  expr get_fresh_glb_name( unsigned );

  void insert_glb_sort( sort );
  void insert_glb_to_id( const llvm::GlobalVariable*, unsigned );
  void insert_name_to_glb( std::string, const llvm::GlobalVariable* );

  std::pair<expr,expr> glb_write( unsigned bidx,
                                          const llvm::StoreInst* ,
                                          expr& );
  expr glb_read( unsigned bidx, const llvm::LoadInst* );

  glb_state& get_state( unsigned b ) { return exit_glb_map.at(b); }


  inline void set_glb_to_id( std::map< const llvm::GlobalVariable*, unsigned >& g_id_map) {
    glb_to_id = g_id_map;
  }

  inline void set_name_to_glb( std::map< std::string, const llvm::GlobalVariable* >& name_glb_map) {
    name_to_glb = name_glb_map;
  }

  void refresh_glb_state( unsigned bidx, const llvm::GlobalVariable* g);

  expr get_state_var( unsigned bidx, const llvm::GlobalVariable* g);

  expr get_state_var( unsigned bidx, unsigned i);

  std::map< const llvm::GlobalVariable*, unsigned >& get_glb_to_id() {
    return glb_to_id;
  }

  std::vector< sort >& get_sorts() {
    return glb_sorts;
  }

private:
  solver_context& solver_ctx;
  std::map< unsigned, glb_state > exit_glb_map;
  std::vector< sort > glb_sorts;
  std::map< const llvm::GlobalVariable*, unsigned > glb_to_id;
  std::map< std::string, const llvm::GlobalVariable*> name_to_glb;
};

#endif // TILER_GLB_MODEL_H
