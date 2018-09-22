#ifndef Z3UTILS_H
#define Z3UTILS_H

#include "utils.h"
#include "include/solver.h"

struct expr_hash {
  size_t operator () (const expr& a) const {
    Z3_ast ap = a;
    size_t hash = std::hash<Z3_ast>()(ap);
    return hash;
  }
};

struct expr_equal :
  std::binary_function <expr,expr,bool> {
    bool operator() (const expr& x, const expr& y) const {
      return eq( x, y );
    }
  };

typedef std::unordered_set<expr,  expr_hash, expr_equal> expr_set;
typedef std::vector<expr> exprs;

bool inline is_equal( expr& x, expr& y) {
  return eq( x, y );
}

void expr_set_to_exprs( expr_set&, exprs&);

void inplace_substitute( expr&, expr& src_vs, expr& dst_vs );

void inplace_substitute( expr&, expr_vector& src_vs,
                         expr_vector& dst_vs );

void inplace_substitute( exprs& vec, expr_vector& src_vs,
                         expr_vector& dst_vs );

void inplace_substitute( exprs& vec, expr& src_v, expr& dst_v);

std::string to_string(sort);
std::string to_string(expr e);
std::string to_string( std::vector<expr> es);
std::string display(expr e);
std::string display_app(expr e);
void print_expr_set( std::ostream& o, expr_set& es);
void print_exprs( std::ostream& o, exprs& es);
void print_expr_vec( std::ostream& o, expr_vector& es);
void print_expr( std::ostream& o, expr e);
void dump( expr e );
void dump( expr_set e );
void dump( exprs e );
void dump( expr_vector e );

// other is_.. can be found in z3++.h
bool reportErrNThrow(std::string s, bool th);
bool has_quantified_formula(exprs es);
bool isQuant(expr e, std::string s="", bool th=false);
bool isForall(expr e, std::string s="", bool th=false);
bool isSelect(expr e, std::string s="", bool th=false);
bool isStore(expr e, std::string s="", bool th=false);
bool isApp( expr e, std::string s="", bool th=false);
bool isImplies(expr e, std::string s="", bool th=false);
bool isAnd( expr e, std::string s="", bool th=false);
bool isLE ( expr e, std::string s="", bool th=false);
bool isLT ( expr e, std::string s="", bool th=false);
bool isGE ( expr e, std::string s="", bool th=false);
bool isGT ( expr e, std::string s="", bool th=false);
bool isEQ ( expr e, std::string s="", bool th=false);
bool isNot( expr e, std::string s="", bool th=false);
bool isRel( expr e, std::string s="", bool th=false);
bool isAdd( expr e, std::string s="", bool th=false);
bool isSub( expr e, std::string s="", bool th=false);
bool isUMinus( expr e, std::string s="", bool th=false);
bool isMul( expr e, std::string s="", bool th=false);
bool is_const( expr& b );
bool is_false( expr );
bool is_true( expr );
expr get_expr_const( solver_context&, int num);
expr get_fresh_bool( solver_context&, std::string = "");
expr get_fresh_int( solver_context&, std::string = "");
expr get_fresh_bv( solver_context&, unsigned, std::string = "");
expr get_fresh_const( solver_context&, sort , std::string = "");

expr _or( std::vector<expr>&, solver_context& );
expr _or( std::vector<expr> &);
expr _and( std::vector<expr> &, solver_context& );
expr _and( std::vector<expr> &);
expr _xor( expr const &, expr const &);
expr neg_and( std::vector<expr> &vec, solver_context& sol_ctx );
expr neg_and( std::vector<expr> &vec);
expr _forall( expr_vector&, expr& );
expr implies( expr&, expr& );
expr select( expr&, expr& );
expr store( expr&, expr&, expr& );

bool matched_sort( const expr& l, const expr& r );
expr switch_sort( expr& b, sort& s);
int get_numeral_int(const expr& i);

bool is_true( expr, model );

void to_std_vec( expr_vector& vec, std::vector<expr>& o_vec );
void to_sol_vec( std::vector<expr>& vec, expr_vector& o_vec );
void to_sol_vec( expr_set& set, expr_vector& o_vec );

void get_variables( expr& expr, expr_set& vars );
void get_variables( exprs& expr, expr_set& vars );
void get_annon_variables( expr& expr, expr_set& vars );

bool inline contains( expr e, expr_set s2 ) {
  return s2.find( e ) != s2.end();
}

bool inline are_intersecting( expr_set s1, expr_set s2 ) {
  for( auto& e : s2 ) {
    if( contains( e, s1 ) ) return true;
  }
  return false;
}

// bool run_solver(solver_context sol_ctx, expr e );
bool check_sat(solver_context& sol_ctx, expr e);

expr expr_to_linear_term( expr term, exprs& vs, std::vector<int>& l );

expr subtract_polyhedran( exprs& dims, expr x, expr y );
expr subtract_polyhedran( expr_set& dims, expr x, expr y );

expr get_forall_lhs( expr h );
expr get_forall_rhs( expr h );

void propogate_store_eq(exprs& list, solver_context& sol_ctx);
void propogate_select_eq(exprs& list, solver_context& sol_ctx);
void simplify_select_store_nest(exprs& list, solver_context& sol_ctx);
void simplify_select_eq(exprs& list, solver_context& sol_ctx);

expr substitute( expr,
                     std::vector<expr>&,
                     std::vector<expr>& );

expr smt2_parse_string( solver_context&, const char* );

void eliminate_vars( expr, std::vector<expr>&,
                     std::vector<expr>& );

#endif  // Z3UTILS_H
