#include<stdio.h>
#include<iostream>
#include<fstream>
#include<string>
#include<list>
#include "z3_utils.h"

void expr_set_to_exprs( expr_set& s, exprs& v) {
  for( auto e : s ) {
    v.push_back( e );
  }
}

std::string to_string(z3::sort e) {
  std::stringstream ss;
  ss << e;
  return ss.str();
}

std::string to_string(z3::expr e) {
  std::stringstream ss;
  ss << e;
  return ss.str();
}

std::string to_string( exprs es) {
  std::stringstream ss;
  for( auto& e : es )
    ss << e << ",";
  return ss.str();
}

void print_exprs( std::ostream& o, exprs& es) {
  for( auto& e : es )
    o << e << "\n";
}

void print_expr_vec( std::ostream& o, z3::expr_vector& es) {
  for( unsigned i = 0; i < es.size(); i++ ) {
    o << es[i] << "\n";
  }
}

void print_expr_set( std::ostream& o, expr_set& es) {
  for( auto& e : es )
    o << e << "\n";
}

void print_expr( std::ostream& o, z3::expr e) {
    o << e << "\n";
}

void dump( z3::expr e ) {
  print_expr( std::cerr, e );
}

void dump( exprs es ) {
  print_exprs( std::cerr, es );
}

void dump( expr_set es ) {
  print_expr_set( std::cerr, es );
}

void dump( z3::expr_vector es ) {
  print_expr_vec( std::cerr, es );
}

std::string display(z3::expr e) {
  if(e.is_numeral()) {
    int64_t num, den;
    if (Z3_get_numeral_small(e.ctx(), e, &num, &den)) {
	    return std::to_string(num);
    }
  } else if (e.is_var()) {
    return e.decl().name().str();
  } else if (e.is_app()) {
    return display_app(e);
  } else if (e.is_quantifier()) {
    // Ideally quantifier should not occur.
    return "";
  }
}

std::string display_app(z3::expr e) {
  std::list<std::string> argStrList;

  unsigned args = e.num_args();
  for (unsigned i = 0; i<args; i++) 
  {
    z3::expr arg = e.arg(i);
    argStrList.push_back(display(arg));
  }

  Z3_decl_kind dk = e.decl().decl_kind();
  std::list<std::string>::const_iterator argListIt;
  argListIt = argStrList.begin(); 

  if (dk == Z3_OP_NOT) {
    return "( ! " + *argListIt + ")";
  } else if (dk == Z3_OP_UMINUS) {
    return "( - " + *argListIt + ")";
  } else if (dk == Z3_OP_LE) {
    std::string e1 = *argListIt;
    argListIt++;
    std::string e2 = *argListIt;
    return "(" + e1 + " <= " + e2 + ")";
  } else if (dk == Z3_OP_GE) {
    std::string e1 = *argListIt;
    argListIt++;
    std::string e2 = *argListIt;
    return "(" + e1 + " >= " + e2 + ")";
  } else if (dk == Z3_OP_LT) {
    std::string e1 = *argListIt;
    argListIt++;
    std::string e2 = *argListIt;
    return "(" + e1 + " < " + e2 + ")";
  } else if (dk == Z3_OP_GT) {
    std::string e1 = *argListIt;
    argListIt++;
    std::string e2 = *argListIt;
    return "(" + e1 + " > " + e2 + ")";
  } else if (dk == Z3_OP_IMPLIES) {
    std::string e1 = *argListIt;
    argListIt++;
    std::string e2 = *argListIt;
    return "( ( !" + e1 + ")" + " || " + e2 + ")";
  } else if (dk == Z3_OP_EQ) {
    std::string e1 = *argListIt;
    argListIt++;
    std::string e2 = *argListIt;
    return "(" + e1 + " == " + e2 + ")";
  } else if (dk == Z3_OP_DIV) {
    std::string res = "(" + *argListIt;
    argListIt++;
    for(;argListIt != argStrList.end(); argListIt++)
    {
      res = res + " / " + *argListIt;
    }
    return res + ")";
  } else if (dk == Z3_OP_MUL) {
    std::string res = "(" + *argListIt;
    argListIt++;
    for(;argListIt != argStrList.end(); argListIt++)
    {
      res = res + " * " + *argListIt;
    }
    return res + ")";
  } else if (dk == Z3_OP_ADD) {
    std::string res = "(" + *argListIt;
    argListIt++;
    for(;argListIt != argStrList.end(); argListIt++)
    {
      res = res + " + " + *argListIt;
    }
    return res + ")";
  } else if (dk == Z3_OP_SUB) {
    std::string res = "(" + *argListIt;
    argListIt++;
    for(;argListIt != argStrList.end(); argListIt++)
    {
      res = res + " - " + *argListIt;
    }
    return res + ")";
  } else if (dk == Z3_OP_AND) {
    std::string res = "(" + *argListIt;
    argListIt++;
    for(;argListIt != argStrList.end(); argListIt++)
    {
      res = res + " && " + *argListIt;
    }
    return res + ")";
  } else if (dk == Z3_OP_OR) {
    std::string res = "(" + *argListIt;
    argListIt++;
    for(;argListIt != argStrList.end(); argListIt++)
    {
      res = res + " || " + *argListIt;
    }
    return res + ")";
  } else {
    return e.decl().name().str();
  }
}


bool reportErrNThrow(std::string s, bool th)
{
  if(th) {
    std::cout << s;
    throw "unsupported";
  }
}

bool has_quantified_formula(exprs es)
{
  for(auto e : es) {
    if(isQuant(e) == true)
      return true;
  }
  return false;
}

bool isQuant(z3::expr e, std::string s, bool th)
{
  if (!e.is_quantifier()) {
    reportErrNThrow(s, th);
    return false;
  }
  return true;
}

bool isForall(z3::expr e, std::string s, bool th)
{
  if(!Z3_is_quantifier_forall(e.ctx(), e)) {
    reportErrNThrow(s, th);
    return false;
  }
  return true;
}

bool isSelect(z3::expr e, std::string s, bool th)
{
  if( !isApp( e, s , th ) ) return false;
  Z3_decl_kind dk = e.decl().decl_kind();
  if (dk != Z3_OP_SELECT) {
    reportErrNThrow(s,th);
    return false;
  }
  return true;
}

bool isStore(z3::expr e, std::string s, bool th)
{
  if( !isApp( e, s , th ) ) return false;
  Z3_decl_kind dk = e.decl().decl_kind();
  if (dk != Z3_OP_STORE) {
    reportErrNThrow(s,th);
    return false;
  }
  return true;
}

bool isApp(z3::expr e, std::string s, bool th)
{
  if (!e.is_app()) {
    reportErrNThrow(s,th);
    return false;
  }
  return true;
}

bool isImplies(z3::expr e, std::string s, bool th)
{
  if( !isApp( e, s , th ) ) return false;
  Z3_decl_kind dk = e.decl().decl_kind();
  if (dk != Z3_OP_IMPLIES) {
    reportErrNThrow(s,th);
    return false;
  }
  return true;
}

bool isAnd(z3::expr e, std::string s, bool th)
{
  if( !isApp( e, s , th ) ) return false;
  Z3_decl_kind dk = e.decl().decl_kind();
  if (dk != Z3_OP_AND) {
    reportErrNThrow(s,th);
    return false;
  }
  return true;
}

bool isLE(z3::expr e, std::string s, bool th)
{
  if( !isApp( e, s , th ) ) return false;
  Z3_decl_kind dk = e.decl().decl_kind();
  if (dk != Z3_OP_LE) {
    reportErrNThrow(s,th);
    return false;
  }
  return true;
}

bool isLT(z3::expr e, std::string s, bool th)
{
  if( !isApp( e, s , th ) ) return false;
  Z3_decl_kind dk = e.decl().decl_kind();
  if (dk != Z3_OP_LT) {
    reportErrNThrow(s,th);
    return false;
  }
  return true;
}

bool isGE(z3::expr e, std::string s, bool th)
{
  if( !isApp( e, s , th ) ) return false;
  Z3_decl_kind dk = e.decl().decl_kind();
  if (dk != Z3_OP_GE) {
    reportErrNThrow(s,th);
    return false;
  }
  return true;
}

bool isGT(z3::expr e, std::string s, bool th)
{
  if( !isApp( e, s , th ) ) return false;
  Z3_decl_kind dk = e.decl().decl_kind();
  if (dk != Z3_OP_GT) {
    reportErrNThrow(s,th);
    return false;
  }
  return true;
}

bool isEQ(z3::expr e, std::string s, bool th)
{
  if( !isApp( e, s , th ) ) return false;
  Z3_decl_kind dk = e.decl().decl_kind();
  if (dk != Z3_OP_EQ) {
    reportErrNThrow(s,th);
    return false;
  }
  return true;
}

bool isNot(z3::expr e, std::string s, bool th)
{
  if( !isApp( e, s , th ) ) return false;
  Z3_decl_kind dk = e.decl().decl_kind();
  if (dk != Z3_OP_NOT) {
    reportErrNThrow(s,th);
    return false;
  }
  return true;
}

bool isAdd(z3::expr e, std::string s, bool th)
{
  if( !isApp( e, s , th ) ) return false;
  Z3_decl_kind dk = e.decl().decl_kind();
  if (dk != Z3_OP_ADD) {
    reportErrNThrow(s,th);
    return false;
  }
  return true;
}

bool isSub(z3::expr e, std::string s, bool th)
{
  if( !isApp( e, s , th ) ) return false;
  Z3_decl_kind dk = e.decl().decl_kind();
  if (dk != Z3_OP_SUB) {
    reportErrNThrow(s,th);
    return false;
  }
  return true;
}

bool isUMinus(z3::expr e, std::string s, bool th)
{
  if( !isApp( e, s , th ) ) return false;
  Z3_decl_kind dk = e.decl().decl_kind();
  if (dk != Z3_OP_UMINUS) {
    reportErrNThrow(s,th);
    return false;
  }
  return true;
}

bool isMul(z3::expr e, std::string s, bool th)
{
  if( !isApp( e, s , th ) ) return false;
  Z3_decl_kind dk = e.decl().decl_kind();
  if (dk != Z3_OP_MUL) {
    reportErrNThrow(s,th);
    return false;
  }
  return true;
}

bool isRel(z3::expr e, std::string s, bool th)
{
  return isGE(e,s,th) || isGT(e,s,th) || isLE(e,s,th) || isLT(e,s,th) || isEQ(e,s,th) || isNot(e,s,th) ;
}

bool is_const( z3::expr &b ) {
  if( b.kind() == Z3_NUMERAL_AST ) return true;
  return false;
}

bool is_false( z3::expr f ) {
  return z3::eq( f, f.ctx().bool_val(false) );
}

bool is_true( z3::expr f ) {
  return z3::eq( f, f.ctx().bool_val(true) );
}

z3::expr get_fresh_bool( z3::context& c, std::string suff )
{
  static unsigned count = 0;
  std::stringstream b_name;
  b_name << "b_" << count << "_"<< suff;
  z3::expr b = c.bool_const(b_name.str().c_str());
  count++;
  return b;
}

z3::expr get_fresh_int( z3::context& c, std::string suff )
{
  static unsigned count = 0;
  count++;
  std::string loc_name = "i_" + std::to_string(count) + "_" + suff;
  z3::expr loc_expr = c.int_const(loc_name.c_str());
  return loc_expr;
}

// creates fresh FOL constants of any sort
z3::expr get_fresh_const( z3::context& c, z3::sort sort, std::string suff )
{
  static unsigned count = 0;
  count++;
  std::string loc_name = "c_" + std::to_string(count) + "_" + suff;
  z3::expr loc_expr = c.constant( loc_name.c_str(), sort );
  return loc_expr;
}

// we need this or, since the default or in c++ interface is over z3::expr_vector
// and if vec is empty we do not have the z3 context
z3::expr _or( std::vector<z3::expr> &vec, z3::context& z3_ctx ) {
  z3::expr_vector z3_vec(z3_ctx);
  to_z3_vec(vec, z3_vec);
  return z3::mk_or(z3_vec);
}

// we need this or, since the default or in c++ interface is over z3::expr_vector
z3::expr _or( std::vector<z3::expr> &vec ) {
  assert(!vec.empty());
  return _or( vec, vec.at(0).ctx());
}

// we need this and, since the default and in c++ interface is over z3::expr_vector
// and if vec is empty we do not have the z3 context
z3::expr _and( std::vector<z3::expr> &vec, z3::context& z3_ctx ) {
  z3::expr_vector z3_vec(z3_ctx);
  to_z3_vec(vec, z3_vec);
  return z3::mk_and(z3_vec);
}

// we need this and, since the default and in c++ interface is over z3::expr_vector
z3::expr _and( std::vector<z3::expr> &vec ) {
  assert(!vec.empty());
  return _and( vec, vec.at(0).ctx());
}

// we need this xor, since the default xor in c++ interface is for bvxor
z3::expr _xor( z3::expr const &a, z3::expr const &b ) {
  z3::check_context(a, b);
  Z3_ast r = Z3_mk_xor(a.ctx(), a, b);
  return z3::expr(a.ctx(), r);
}

z3::expr neg_and( std::vector<z3::expr> &vec, z3::context& z3_ctx ) {
  z3::expr_vector z3_vec(z3_ctx);
  for(auto e : vec) {
    z3_vec.push_back(!e);
  }
  return z3::mk_and(z3_vec);
}

z3::expr neg_and( std::vector<z3::expr> &vec ) {
  assert(!vec.empty());
  return neg_and( vec, vec.at(0).ctx());
}

z3::expr _forall( z3::expr_vector& vec, z3::expr& e ) {
  z3::expr_vector new_vec(vec.ctx());
  for(unsigned i = 0; i <  vec.size(); i++ ) {
    z3::expr v = vec[i];
    if( v.is_var() ) {
      z3::expr new_v = get_fresh_const( e.ctx(), v.get_sort(), "");
      new_vec.push_back( new_v );
      inplace_substitute( e, v, new_v );
    }else{
      new_vec.push_back( v );
    }
  }
  return forall( new_vec, e );
}

bool matched_sort( const z3::expr& l, const z3::expr& r ) {
  return z3::eq(l.get_sort(),r.get_sort());
}

z3::expr switch_sort( z3::expr& b, z3::sort& s ) {
  z3::sort bs = b.get_sort();
  if( bs.is_bool() && s.is_int() ) {
    if( is_false( b) ) {
      return b.ctx().int_val(0);
    }else if( is_true(b) ) {
      return b.ctx().int_val(1);
    }
  }else if( bs.is_int() && s.is_bool() ) {
    int v = get_numeral_int(b);
    if( v == 1 ) {
      return s.ctx().bool_val(true);
    }else if ( v  == 0 ) {
      return s.ctx().bool_val(false);
    }
  }
  llvm_bmc_error("z3Utils", "failed to change sort!" );
}

int get_numeral_int(const z3::expr& i) {
  int val;
  if(Z3_get_numeral_int( i.ctx(), i, &val) ) {
    return val;
  }else{
    llvm_bmc_error("z3Utils", "too large int found!!" );
  }
}


void to_std_vec( z3::expr_vector& vec, std::vector<z3::expr>& o_vec ) {
  o_vec.clear();
  for( unsigned i = 0; i < vec.size(); i++ ) {
    o_vec.push_back( vec[i] );
  }
}

void to_z3_vec( std::vector<z3::expr>& vec, z3::expr_vector& o_vec ) {
  o_vec.resize(0);
  for( unsigned i = 0; i < vec.size(); i++ ) {
    o_vec.push_back( vec[i] );
  }
}

void to_z3_vec( expr_set& vec, z3::expr_vector& o_vec ) {
  o_vec.resize(0);
  for( z3::expr v : vec ) {
    o_vec.push_back( v );
  }
}

bool is_true( z3::expr e,  z3::model m ) {
  z3::expr v = m.eval( e );
  return ( Z3_get_bool_value( v.ctx(), v)  == Z3_L_TRUE );
}

inline bool is_false( z3::expr e,  z3::model m ) {
  z3::expr v = m.eval( e );
  return ( Z3_get_bool_value( v.ctx(), v)  == Z3_L_FALSE );
}

//NOTE: this function does not collect quantified variables
// todo: enable quantied variable counting if the call is not
// started from the outermost quantifier
void get_variables( exprs& es, expr_set& vars ) {
  for( auto& e : es ) get_variables( e, vars);
}
void get_variables( z3::expr& expr, expr_set& vars ) {
  switch(expr.kind()) {
  case Z3_APP_AST: {
    z3::func_decl d = expr.decl();
    Z3_decl_kind dk = d.decl_kind();
    switch(dk) {
    case Z3_OP_UNINTERPRETED : {
      vars.insert(expr);
    } break;
    default: {
      } break;
    }
    unsigned args = expr.num_args();
    for(unsigned i = 0; i<args; i++) {
      z3::expr arg = expr.arg(i);
      get_variables(arg, vars);
    }
  } break;
  case Z3_VAR_AST: break; // does not collect quantified variables
  case Z3_NUMERAL_AST: break;
  case Z3_QUANTIFIER_AST: {
    // unsigned idx = Z3_get_index_value(expr.ctx(), expr);
    // Z3_symbol sym = Z3_get_quantifier_bound_name(expr.ctx(), expr, idx);
    // vars.insert(z3::expr(expr.ctx(), Z3_mk_const(expr.ctx(), sym, Z3_mk_int_sort(expr.ctx()))));
    z3::expr body = expr.body();
    get_variables( body, vars);
  } break;
  default: throw "unsupported"; break;
  }
}

// does not expect any quantified subformulas
void get_annon_variables( z3::expr& expr, expr_set& vars ) {
  switch(expr.kind()) {
  case Z3_APP_AST: {
    unsigned args = expr.num_args();
    for(unsigned i = 0; i<args; i++) {
      z3::expr arg = expr.arg(i);
      get_annon_variables(arg, vars);
    }
  } break;
  case Z3_VAR_AST:
    vars.insert(expr);
    break; // does not collect quantified variables
  case Z3_NUMERAL_AST:break;
  case Z3_QUANTIFIER_AST: { assert( false ); } break;
  default: throw "unsupported"; break;
  }
}


// z3::expr_vector
// get_quantified_variables( z3::expr h ) {
// }

z3::expr get_forall_lhs( z3::expr h ) {
  if( isForall(h) ) {
    auto b = h.body();
    if( isImplies(b) )
      return b.arg(0);
  }
  z3::expr dummy(h.ctx());
  return dummy;
}

z3::expr get_forall_rhs( z3::expr h ) {
  if( isForall(h) ) {
    auto b = h.body();
    if( isImplies(b) )
      return b.arg(1);
  }
  z3::expr dummy(h.ctx());
  return dummy;
}


bool check_sat(z3::context& z3_ctx, z3::expr e) {
  z3::solver s(z3_ctx);
  s.add(e);
  if (s.check() == z3::sat) {
    return true;
  } else {
    return false;
  }
}

void inplace_substitute( z3::expr& v, z3::expr& outgoing, z3::expr& incoming ) {
  z3::expr_vector outs(v.ctx()), ins(v.ctx());
  outs.push_back( outgoing );
  ins.push_back( incoming );
  v = v.substitute( outs, ins );
}

void inplace_substitute( z3::expr& v, z3::expr_vector& outgoing,
                         z3::expr_vector& incoming ) {
  v = v.substitute( outgoing, incoming );
}

void inplace_substitute( exprs& vec, z3::expr_vector& outgoing,
                         z3::expr_vector& incoming ) {
  for( z3::expr& v : vec ) {
    v = v.substitute( outgoing, incoming );
  }
}

void inplace_substitute( exprs& vec, z3::expr& outgoing,
                         z3::expr& incoming ) {
  z3::context& z3_ctx = outgoing.ctx();
  z3::expr_vector out_vec(z3_ctx);
  z3::expr_vector in_vec(z3_ctx);
  out_vec.push_back( outgoing );
  in_vec.push_back( incoming );
  inplace_substitute( vec, out_vec, in_vec );
}


inline bool all_zero( std::vector<int>& l ) {
  for( unsigned i=0; i < l.size(); i++ ) {
    if( l[i] != 0) return false;
  }
  return true;
}

// turns a term into liner coeffcients over given variables
// other terms are lumped into constants
z3::expr
expr_to_linear_term( z3::expr term, exprs& vs, std::vector<int>& l ) {
  if( isAdd( term ) ) {
    z3::expr c1 = expr_to_linear_term( term.arg(0), vs, l );
    for( unsigned j = 1; j < term.num_args(); j++ ) {
      std::vector<int> u;
      z3::expr c2 = expr_to_linear_term( term.arg(j), vs, u );
      for( unsigned i=0; i < l.size(); i++ ) {
        l[i] = l[i]+u[i];
      }
      c1 = c1+c2;
    }
    return c1.simplify();
  }else if( isSub( term ) ) {
    assert( term.num_args() == 2 );
    auto c1 = expr_to_linear_term( term.arg(0), vs, l );
    std::vector<int> u;
    auto c2= expr_to_linear_term( term.arg(1), vs, u );
    for( unsigned i=0; i < l.size(); i++ ) {
      l[i] = l[i]-u[i];
    }
    return (c1-c2).simplify();
  }else if( isUMinus( term ) ) {
    auto c1 = expr_to_linear_term( term.arg(0), vs, l );
    for( unsigned i=0; i < l.size(); i++ ) {
      l[i] = -l[i];
    }
    return (-c1).simplify();
  }else if( isMul(term) ) {
    auto c1 = expr_to_linear_term( term.arg(0), vs, l );
    bool l_zero = all_zero( l );
    for( unsigned j = 1; j < term.num_args(); j++ ) {
      std::vector<int> u;
      z3::expr c2 = expr_to_linear_term( term.arg(j), vs, u );
      if( !all_zero(u) ) {
        if( !l_zero || !c1.is_numeral() ) throw;
        int c = c1.get_numeral_int();
        for( unsigned i=0; i < l.size(); i++ ) l[i] = c*u[i];
        l_zero = true;
      }else{
        if( !l_zero ) {
          if(!c2.is_numeral() ) throw;
          int c = c2.get_numeral_int();
          for( unsigned i=0; i < l.size(); i++ ) l[i] = c*l[i];
        }
      }
      c1 = (c1*c2);
    }
    return c1.simplify();
  }else{
    bool found = false;
    for( unsigned i =0; i < vs.size(); i++ ) {
      if( z3::eq(vs[i],term) ) {
        l.push_back(1);
        found = true;
      }else{
        l.push_back(0);
      }
    }
    if( !found ) {
      return term;
    }else{
      return term.ctx().int_val(0);
    }
  }
}

// term  => 0
z3::expr
pred_to_linear_term( z3::expr pred, exprs& vs, std::vector<int>& l ) {
  if( isGE(pred) ) { // >= a b   ---> (>= a-b 0)
    return expr_to_linear_term( pred.arg(0)-pred.arg(1), vs, l ).simplify();
  }else  if( isGT(pred) ) { // > a b   ---> (>= a-b-1 0)
    return expr_to_linear_term( pred.arg(0)-pred.arg(1)-1, vs, l ).simplify();
  }else  if( isLE(pred) ) { // =< a b   ---> (>= b-a 0)
    return expr_to_linear_term( pred.arg(1)-pred.arg(0), vs, l ).simplify();
  }else  if( isLT(pred) ) { // < a b  -- > b a ---> (>= b-a-1 0)
    return expr_to_linear_term( pred.arg(1)-pred.arg(0)-1, vs, l ).simplify();
  }else  if( isEQ(pred) ) {
    assert(false);
    return expr_to_linear_term( pred.arg(0)-pred.arg(1), vs, l ).simplify();
  }else  if( isNot(pred) ) { // not t >= 0    -> (>= -t-1 0)
    z3::expr c1 = pred_to_linear_term( pred.arg(0), vs, l );
    for( unsigned i=0; i < l.size(); i++ ) l[i] = -l[i];
    return (-c1-1).simplify();
  }else{
    llvm_bmc_error("","linear term generation failed");
  }
}

z3::expr
turn_to_equality( z3::expr pred ) {
  if( isGE(pred) ) {
    return pred.arg(0) == pred.arg(1);
  }else  if( isGT(pred) ) { // > a b   ---> (>= a-b-1 0)
    return pred.arg(0) == pred.arg(1)+1;
  }else  if( isLE(pred) ) { // =< a b   ---> (>= b-a 0)
    return pred.arg(1) == pred.arg(0);
  }else  if( isLT(pred) ) { // < a b  -- > b a ---> (>= b-a-1 0)
    return pred.arg(1) == pred.arg(0) +1;
  }else  if( isEQ(pred) ) {
    return pred;
  }else  if( isNot(pred) ) { // not a <= b  -> b = a -> b + 1 = a
    z3::expr c1 = turn_to_equality( pred.arg(0) );
    return c1.arg(0) == c1.arg(1) - 1;
  }else{
    llvm_bmc_error("","linear term generation failed");
  }
}


void simple_polyhedron_substraction( exprs& dims,
                                     exprs& xs, // gets modified
                                     exprs& ys ) {
  std::vector< std::vector<int> > coeffs;
  exprs x_bounds;
  unsigned i =0;
  for( z3::expr x : xs  ) {
    std::vector<int> coeff;
    z3::expr bound = pred_to_linear_term( x, dims, coeff );
    coeffs.push_back(coeff);
    x_bounds.push_back( bound );
    i++;
  }
  // if(true) {
  //   for( unsigned i = 0 ; i < coeffs.size(); i++ ) {
  //     std::cerr << x_bounds[i];
  //     for( unsigned j = 0; j < dims.size(); j++ ) {
  //       std::cerr << " + " << coeffs[i][j] << " " << dims[j];
  //     }
  //     std::cerr << "\n";
  //   }
  // }
  bool diff_found;
  for( z3::expr& y : ys ) {
    std::vector<int> coeff;
    z3::expr bound = pred_to_linear_term( y, dims, coeff );
    unsigned i = 0;
    bool found = false;
    for( auto& x_coeff : coeffs) {
      if( x_coeff == coeff) {
        found = true;
        break;
      }
      i++;
    }
    if( found ) {
      z3::expr x_bound = x_bounds.at(i);
      if( !z3::eq(x_bound,bound) ) {
        assert( !diff_found );
        diff_found = true;
        z3::expr gap = (x_bound-bound).simplify();
        if( gap.is_numeral() ) {
          int c = gap.get_numeral_int();
          if( c == 1 ) {
            xs[i] = turn_to_equality(xs[i]);
          }
        }
      }
    }else{
      assert(false);// case not handelled yet
    }
  }
}

z3::expr
subtract_polyhedran( exprs& dims, z3::expr x, z3::expr y ) {
  // exprs dims;
  // expr_set_to_exprs( dims_set, dims);
  exprs xs,ys;
  x = x.simplify();
  if( x.is_and() ) {
    for( unsigned i =0; i < x.num_args(); i++ ) {
      xs.push_back( x.arg(i) );
    }
  }else{
    xs.push_back( x );
  }
  y = y.simplify();
  if( y.is_and() ) {
    for( unsigned i =0; i < y.num_args(); i++ ) {
      ys.push_back( y.arg(i) );
    }
  }else{
    ys.push_back( y );
  }
  simple_polyhedron_substraction( dims, xs, ys );
  return _and(xs,x.ctx());
}

z3::expr
subtract_polyhedran( expr_set& dims, z3::expr x, z3::expr y ) {
  exprs dims_vec;
  expr_set_to_exprs( dims, dims_vec );
  return subtract_polyhedran( dims_vec, x, y );
}

void propogate_store_eq(exprs& list, z3::context& z3_ctx) {
  bool change = true;
  while(change) {
    unsigned size = list.size();
    bool incr_flag = true;
    z3::expr_vector outs(z3_ctx);
    z3::expr_vector ins(z3_ctx);
    auto it = list.begin();
    while( it !=list.end() ) {
      incr_flag = true;
      z3::expr e = *it;
      if(isEQ(e)) {
        if(e.arg(0).is_array() && isStore(e.arg(1)) && !isStore(e.arg(0)) ) {
          outs.push_back(e.arg(0));
          ins.push_back(e.arg(1));
          list.erase(it);
          incr_flag = false;
        } else if(e.arg(1).is_array() && isStore(e.arg(0)) && !isStore(e.arg(1)) ) {
          outs.push_back(e.arg(1));
          ins.push_back(e.arg(0));
          list.erase(it);
          incr_flag = false;
        } else {}
      } else {}
      if(incr_flag) it++;
    }
    inplace_substitute( list, outs, ins );
    if(size == list.size()) change = false;
  }
}

void propogate_select_eq(exprs& list, z3::context& z3_ctx) {
  bool incr_flag = true;
  z3::expr_vector outs(z3_ctx);
  z3::expr_vector ins(z3_ctx);
  auto it = list.begin();
  while( it !=list.end() ) {
    incr_flag = true;
    z3::expr e = *it;
    if(isEQ(e)) {
      z3::expr sel(z3_ctx);
      if(isSelect(e.arg(0)) && !isSelect(e.arg(1))) {
        outs.push_back(e.arg(0));
        ins.push_back(e.arg(1));
        list.erase(it);
        incr_flag = false;
      } else if (isSelect(e.arg(1)) && !isSelect(e.arg(0))) {
        outs.push_back(e.arg(1));
        ins.push_back(e.arg(0));
        list.erase(it);
        incr_flag = false;
      } else {}
    } else {}
    if(incr_flag) it++;
  }
  inplace_substitute( list, outs, ins );
}

void simplify_select_store_nest(exprs& list, z3::context& z3_ctx) {
  exprs new_list;
  bool incr_flag = true;
  auto it = list.begin();
  while( it !=list.end() ) {
    incr_flag = true;
    z3::expr e = *it;
    if(isEQ(e)) {
      z3::expr sel(z3_ctx);
      if(isSelect(e.arg(0))) {
        sel = e.arg(0);
      } else if (isSelect(e.arg(1))) {
        sel = e.arg(1);
      } else {
        it++;
        continue;
      }
      if(isStore(sel.arg(0))) {
        z3::expr stor = sel.arg(0);
        if(z3::eq(sel.arg(1).simplify(), stor.arg(1).simplify())) {
          z3::expr new_eq = e.arg(1) == stor.arg(2);
          new_list.push_back(new_eq.simplify());
          list.erase(it);
          incr_flag=false;
        } else {}
      } else {}
    }
    if(incr_flag) it++;
  }
  list.insert(list.end(), new_list.begin(), new_list.end());
}

// TODO : Improve the select eq functionality
// Currently only handles
// (+ (select ...) (e1) ) =  (e2) --> (select ...) = (e2) - (e1)
// (+ (e1) (select ...) ) =  (e2) --> (select ...) = (e2) - (e1)
// (e2) = (+ (select ...) (e1) ) --> (select ...) = (e2) - (e1)
// (e2) = (+ (e1) (select ...) ) --> (select ...) = (e2) - (e1)
void simplify_select_eq(exprs& list, z3::context& z3_ctx) {
  exprs new_list;
  bool incr_flag = true;
  bool replace = false;
  z3::expr replace_eq(z3_ctx);
  auto it = list.begin();
  while( it !=list.end() ) {
    incr_flag = true;
    replace = false;
    z3::expr e = *it;
    if(isEQ(e)) {
      if(!replace) {
        if(isAdd(e.arg(0)) && !isSelect(e.arg(1))) {
          z3::expr rhs_expr = e.arg(1);
          z3::expr add_expr = e.arg(0);
          z3::expr lhs_expr(z3_ctx);
          bool sel_found = false;
          unsigned args = add_expr.num_args();
          for (unsigned i = 0; i<args; i++) {
            if(isSelect(add_expr.arg(i))) {
              lhs_expr = add_expr.arg(i);
              sel_found = true;
            } else {
              rhs_expr = rhs_expr - add_expr.arg(i);
            }
          }
          if(sel_found) {
            replace_eq = (lhs_expr == rhs_expr);
            replace = true;
          } else {}
        } else {}
      }
      if(!replace) {
        if (isAdd(e.arg(1)) && !isSelect(e.arg(0))) {
          z3::expr rhs_expr = e.arg(0);
          z3::expr add_expr = e.arg(1);
          z3::expr lhs_expr(z3_ctx);
          bool sel_found = false;
          unsigned args = add_expr.num_args();
          for (unsigned i = 0; i<args; i++) {
            if(isSelect(add_expr.arg(i))) {
              lhs_expr = add_expr.arg(i);
              sel_found = true;
            } else {
              rhs_expr = rhs_expr - add_expr.arg(i);
            }
          }
          if(sel_found) {
            replace_eq = (lhs_expr == rhs_expr);
            replace = true;
          } else {}
        } else {}
      }
      //  TODO : Other case where top level is -, *, /
    } else {}
    if(replace) {
      new_list.push_back(replace_eq.simplify());
      list.erase(it);
      incr_flag=false;
    }
    if(incr_flag) it++;
  }
  list.insert(list.end(), new_list.begin(), new_list.end());
}
