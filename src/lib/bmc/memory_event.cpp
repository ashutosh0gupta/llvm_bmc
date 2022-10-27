#include "include/memory_event.h"

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunused-parameter"
// pragam'ed to aviod warnings due to llvm included files
#include "llvm/Transforms/IPO/AlwaysInliner.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Analysis/CFGPrinter.h"
#include "llvm/Analysis/InlineCost.h"
#pragma GCC diagnostic pop

using namespace std;


/*************************
 * tstamp
 *************************/

tstamp::tstamp( solver_context& ctx, string name, bool special)
  : e(z3::expr(ctx))
  , name(name)
  , special(special) {}

bool tstamp::operator==(const tstamp &other) const {
  // if expr is empty fall back to name
  if ((Z3_ast)this->e==0)
    return this->name == other.name;
  else
    return (Z3_ast)this->e == (Z3_ast)other.e;
}

bool tstamp::operator!=(const tstamp &other) const {
  return !(*this == other);
}

tstamp::operator expr () const {
  return e;
}

uint16_t tstamp::serial() const
{
  return _serial;
}

string to_string(const tstamp& loc) {
  string res = loc.name;
  return res;
}


ostream& operator<< (ostream& stream, const tstamp& loc) {
  stream << to_string(loc);
  return stream;
}

ostream& operator<< (ostream& stream, const tstamp_ptr& loc) {
  stream << *loc;
  return stream;
}

string operator+ (const string& lhs, const tstamp_ptr& rhs) {
  return lhs + to_string(*rhs);
}

ostream& operator<< ( ostream& stream,
                                    const tstamp_pair& loc_pair)
{
  stream << loc_pair.first << "-" << loc_pair.second;
  return stream;
}

void tstamp::debug_print(std::ostream& stream ) {  stream << *this << "\n"; }


//----------------------------------------------------------------------------
// utilities for symbolic events

std::string event_t_name( event_t et ) {
    switch( et) {
    case event_t::pre   : return "pre"  ; break;
    case event_t::r     : return "R"    ; break;
    case event_t::w     : return "W"    ; break;
    case event_t::u     : return "U"    ; break;
    case event_t::barr  : return "barr" ; break;
    case event_t::barr_b: return "barr_b" ; break;
    case event_t::barr_a: return "barr_a" ; break;
    case event_t::block : return "block"; break;
    case event_t::post  : return "post" ; break;
    case event_t::create: return "create"; break;
    case event_t::join  : return "join" ; break;
    default: llvm_bmc_error( "mem_event", "name of the event type is not implemented yet!" );
    }
}

// std::string src_loc::position_name() {
//   if( line == 0 && col == 0 )
//     // return pretty_name;
//     return NULL;
//   else
//     return "_l" + std::to_string(line) + "_c" + std::to_string(col);
// }

// std::string src_loc::gen_name() {
//   static std::map< std::pair<unsigned, unsigned>, unsigned > seen_before;
//   auto l_name = position_name();
//   if( line == 0 && col == 0 && l_name != "" ) {
//     return l_name;
//   }else{
//     auto line_col = std::make_pair(line, col);
//     if( exists( seen_before, line_col ) ) {
//       return l_name + "_u" + std::to_string( seen_before[line_col]++ );
//     }else{
//       seen_before[line_col] = 0;
//     }
//     return l_name;
//   }
// }

tstamp_var_ptr
memory_event::create_internal_event( solver_context& sol_ctx,
                                       std::string e_name, unsigned tid,
                                       unsigned instr_no, bool special )
{
  auto e_v = make_shared<tstamp>( sol_ctx, e_name, special );
  e_v->thread = tid;
  e_v->instr_no = instr_no; // not used in post POPL15

  return e_v;
}

std::string memory_event::name() const {
  return e_v->name;
}

std::string memory_event::get_position_name() const {
  return position_name;
}

unsigned memory_event::get_instr_no() const {
  return e_v->instr_no;
}

expr memory_event::get_solver_symbol() const {
  return *e_v;
}

expr memory_event::get_thin_solver_symbol() const {
  return *thin_v;
}

expr memory_event::get_c11_hb_solver_symbol() const {
  return *get_c11_hb_stamp();
}

expr memory_event::get_c11_mo_solver_symbol() const {
  return *get_c11_mo_stamp();
}

expr memory_event::get_c11_sc_solver_symbol() const {
  return *get_c11_sc_stamp();
}


expr memory_event::get_power_hb_solver_symbol() const {
  return *get_power_hb_stamp();
}

expr memory_event::get_power_prop_solver_symbol() const {
  return *get_power_prop_stamp();
}

expr memory_event::get_power_obs_solver_symbol() const {
  return *get_power_obs_stamp();
}

expr memory_event::get_power_mo_solver_symbol() const {
  return *get_power_obs_stamp();
}


void memory_event::update_topological_order() {
  unsigned max = 0;
  for( const me_ptr& e : prev_events)
    if( max < e->get_topological_order() ) max = e->get_topological_order();
  topological_order = max + 1;
  // o_tag = o_tag_t::na;
}


//Old constructors:
// Move the ctrc calls to the new constructors

// memory_event::memory_event( solver_context& sol_ctx, unsigned _tid,
//                                 me_set& _prev_events, unsigned instr_no,
//                                 const variable& _v,
//                                 const llvm::GlobalVariable* _prog_v,
//                                 std::string _loc, event_t _et )
//   : tid(_tid)
//   , v(_v)
//   , v_copy(_v)
//   , prog_v( _prog_v )
//   , loc_name(_loc)
//   , et( _et )
//   , prev_events( _prev_events )
//   , guard(sol_ctx)
// {
//   if( et != event_t::r &&  et != event_t::w &&  et != event_t::u ) {
//     llvm_bmc_error("mem_event", "symboic event with wrong parameters!");
//   }
//   if( et == event_t::u ) {
//     v_copy = v + "#update_wr";
//   }
//   std::string e_name = event_t_name( et ) + "#" + v.name;
//   e_v = create_internal_event(   sol_ctx,           e_name,tid,instr_no,false);
//   thin_v = create_internal_event(sol_ctx,"__thin__"+e_name,tid,instr_no,false);
//   c11_hb_v=create_internal_event(sol_ctx,"__hb__"  +e_name,tid,instr_no,false);
//   update_topological_order();
//   o_tag = o_tag_t::na;
// }


// // barrier events
// memory_event::memory_event( solver_context& sol_ctx, unsigned _tid,
//                                 me_set& _prev_events, unsigned instr_no,
//                                 std::string _loc, event_t _et )
//   : tid(_tid)
//   , v("dummy",sol_ctx)
//   , v_copy("dummy",sol_ctx)
//   , prog_v( NULL )
//   , loc_name(_loc)
//   , et( _et )
//   , prev_events( _prev_events )
//   , guard(sol_ctx)
// {
//   std::string e_name = event_t_name( et ) + "#" + loc_name;
//   e_v = create_internal_event    (sol_ctx,            e_name,tid,instr_no,true);
//   thin_v = create_internal_event (sol_ctx, "__thin__"+e_name,tid,instr_no,true);
//   c11_hb_v =create_internal_event(sol_ctx, "__hb__"  +e_name,tid,instr_no,true);
//   update_topological_order();
//   o_tag = o_tag_t::na;
// }


// new constructor
memory_event::memory_event( solver_context& sol_ctx, unsigned _tid,
                                me_set& _prev_events,
                                const variable& _prog_v,
                                expr& path_cond,
                                std::vector<expr>& _history,
                                src_loc& _loc, event_t _et,
                                o_tag_t _o_tag )
  : tid(_tid)
  , v(sol_ctx)      // temp init
  , v_copy(sol_ctx) // temp init
  , prog_v( _prog_v )
  , loc(_loc)
  , et( _et )
  , o_tag( _o_tag )
  , prev_events( _prev_events )
  , guard(path_cond)
  , history( _history )
{

  if( et != event_t::r &&  et != event_t::w &&  et != event_t::u ) {
    llvm_bmc_error("mem_event", "symboic event with wrong parameters!");
  }

  loc_name = loc.gen_name();
  std::string e_t_name = event_t_name( et );

  //position_name = e_t_name + "#" + (std::string) (prog_v -> getName()) + "#" + loc.position_name();
  //position_name = e_t_name + "#" + loc.position_name();  //To be modified later
  position_name = e_t_name + "#" + prog_v.name + "#" + loc.position_name();

  //v = v + (std::string)(prog_v->getName()) + "#" + (std::string)(loc_name);
  v = prog_v + "#" + loc_name;

  v_copy = (et != event_t::u) ? v : v + "#update_wr";

  std::string e_name = e_t_name + "#" + v.name;
  e_v    = create_internal_event( sol_ctx,            e_name,tid, 0, false);
  thin_v = create_internal_event(sol_ctx,"__thin__" +e_name,tid, 0, false);
  c11_hb_v=create_internal_event(sol_ctx,"__hb__"   +e_name,tid, 0, false);
  update_topological_order();
}

memory_event::memory_event( solver_context& sol_ctx, unsigned _tid,
                                me_set& _prev_events,
                                expr& path_cond,
                                std::vector<expr>& _history,
                                src_loc& _loc, event_t _et,
                                o_tag_t _o_tag )
  : tid(_tid)
  , v("dummy",sol_ctx)
  , v_copy("dummy",sol_ctx)
  , prog_v("dummy",sol_ctx)
  , loc(_loc)
  , et( _et )
  , o_tag( _o_tag )
  , prev_events( _prev_events )
  , guard(path_cond)
  , history( _history )
{
  std::string e_t_name = event_t_name( et );

  if( et == event_t::block ) {
    src_loc loc_d;
    loc_name = "block__" + std::to_string(tid) + "__"+ loc_d.gen_name();
  }else{
    loc_name = loc.gen_name();
  }

  position_name = e_t_name + "#" + loc.position_name();

  std::string e_name = e_t_name + "#" + loc_name;
  e_v = create_internal_event    (sol_ctx,            e_name,tid,0,true);
  thin_v = create_internal_event (sol_ctx, "__thin__"+e_name,tid,0,true);
  c11_hb_v =create_internal_event(sol_ctx, "__hb__"  +e_name,tid,0,true);

  update_topological_order();
}

expr memory_event::get_rd_expr( const variable& g ) {
  assert( et == event_t::r   || et == event_t::u || et == event_t::post );
  if( et == event_t::r || et == event_t::u ) {
    expr v_expr = (expr)(v);
    return v_expr;
  }
  variable tmp_v = g+"#post";
  return (expr)(tmp_v);
}

expr memory_event::get_wr_expr( const variable& g ) {
  assert( et == event_t::u   || et == event_t::w || et == event_t::pre );
  if( et == event_t::w || et == event_t::u ) {
    expr v_expr = (expr)(v_copy);
    return v_expr;
  }
  variable tmp_v(g.s.ctx());
  switch( et ) {
  // case event_t::barr: { tmp_v = g+"#barr";  break; }
  case event_t::pre : { tmp_v = g+"#pre" ;  break; }
  case event_t::post: { tmp_v = g+"#post";  break; }
  default: llvm_bmc_error( "memory_event", "unreachable code!!");
  }
  return (expr)(tmp_v);
}


void memory_event::set_pre_events( me_set& prev_events_) {
  prev_events = prev_events_;
}

void memory_event::add_post_events( me_ptr& e, expr cond ) {
  post_events.insert( depends( e, cond) );
}

//todo : make the following function efficient
expr memory_event::get_post_cond( const me_ptr& e_post ) const {
  for( const auto& dep : post_events ) {
    if( dep.e == e_post ) return dep.cond;
  }
  assert( false ); // called with wrong parameters
  return guard.ctx().bool_val(false); //dummy code
}


void memory_event::set_data_dependency( const depends_set& deps ) {
  data_dependency.clear();
  data_dependency.insert( deps.begin(), deps.end() );
}

void memory_event::set_ctrl_dependency( const depends_set& deps ) {
  ctrl_dependency.clear();
  ctrl_dependency.insert( deps.begin(), deps.end() );
}

void memory_event::set_ctrl_isync_dep( const depends_set& deps ) {
  ctrl_isync_dep.clear();
  ctrl_isync_dep.insert( deps.begin(), deps.end() );
}

void memory_event::set_addr_dependency( const depends_set& deps ) {
  addr_dependency.clear();
  addr_dependency.insert( deps.begin(), deps.end() );
}

//todo: add addr dependency field
void memory_event::set_dependencies( const depends_set& data,
                                       const depends_set& ctrl ) {
  set_data_dependency( data );
  set_ctrl_dependency( ctrl );
}

expr memory_event::get_data_dependency_cond( const me_ptr& e2 ) {
  for( auto& dep : data_dependency ) {
    if( dep.e == e2 ) {
       return dep.cond;
      break;
    }
  }
  return expr( guard.ctx() );
}

expr memory_event::get_ctrl_dependency_cond( const me_ptr& e2 ) {
  for( auto& dep : ctrl_dependency ) {
    if( dep.e == e2 ) {
       return dep.cond;
      break;
    }
  }
  return expr( guard.ctx() );
}

expr memory_event::get_addr_dependency_cond( const me_ptr& e2 ) {
  for( auto& dep : addr_dependency ) {
    if( dep.e == e2 ) {
       return dep.cond;
      break;
    }
  }
  return expr( guard.ctx() );
}

void
pointwise_and( const depends_set& dep_in,
                     expr cond,
                     depends_set& dep_out ) {
  dep_out.clear();
  for( const depends& d : dep_in ) {
    expr c = d.cond && cond;
    c = c.simplify();
    dep_out.insert( depends( d.e, c ));
  }
}


void
join_depends_set( const std::vector<depends_set>& dep,
                          const std::vector<expr>& conds,
                          depends_set& result ) {
  result.clear();
  unsigned num = dep.size();
  if( num >= 1 ) pointwise_and( dep.at(0), conds.at(0), result );
  for( unsigned i = 1 ; i < num ; i++ ) {
    depends_set tmp;
    pointwise_and( dep.at(i), conds.at(i), tmp );
    join_depends_set( tmp, result );
  }
}

void
join_depends_set( const std::vector<depends_set>& dep,
                          depends_set& result ) {
  result.clear();
  unsigned num = dep.size();
  if ( num == 1 )
    result = dep.at(0);
  else if ( num == 2 )
    join_depends_set( dep.at(0), dep.at( 1 ), result );
  else if ( num > 2 ) {
    for ( unsigned i = 0 ; i < num ; i++ ) {
      join_depends_set( dep.at( i ), result );
    }
  }
}

//todo : make depends set efficient
//       make it a well implemented class

void join_depends_set( const me_ptr& e1, const expr cond1,
                               depends_set& set ) {
  expr cond = cond1;
  for( auto it1 = set.begin(); it1 != set.end(); it1++) {
    const depends& dep2 = *it1;
    me_ptr e2 = dep2.e;
    if( e1 == e2 ) {
      cond = ( cond || dep2.cond );
      cond = cond.simplify();
      set.erase(it1);
      break;
    }
  }
  set.insert( depends( e1, cond ) );

}

void join_depends_set( const depends& dep,
                             depends_set& set ) {
  join_depends_set( dep.e, dep.cond, set );
}

void join_depends_set( const depends_set& dep0,
                             depends_set& dep1 ) {
  for( auto element0 : dep0 )
    join_depends_set( element0, dep1 );
  // tara::debug_print( std::cout, dep1 );
}


void join_depends_set( const depends_set& dep0,
                               const depends_set& dep1,
                               depends_set& set ) {
  set = dep1;
  join_depends_set( dep0, set );
}


void meet_depends_set( const me_ptr& e1, const expr cond1,
                               depends_set& set ) {
  expr cond = cond1;
  for( auto it1 = set.begin(); it1 != set.end(); it1++) {
    const depends& dep2 = *it1;
    me_ptr e2 = dep2.e;
    if( e1 == e2 ) {
      cond = ( cond && dep2.cond );
      cond = cond.simplify();
      set.erase(it1);
      break;
    }
  }
  set.insert( depends( e1, cond ) );
}

void meet_depends_set( const depends& dep,
                               depends_set& set ) {
  meet_depends_set( dep.e, dep.cond, set );
}

void meet_depends_set( const depends_set& dep0,
                             depends_set& dep1 ) {
  for( auto element0 : dep0 )
    meet_depends_set( element0, dep1 );
}

void meet_depends_set( const depends_set& dep0,
                               const depends_set& dep1,
                               depends_set& set ) {
  set = dep1;
  meet_depends_set( dep0, set );
}


void meet_depends_set( const std::vector<depends_set>& dep,
                               depends_set& result ) {
  result.clear();
  unsigned num = dep.size();
  if( num >= 1 ) result =  dep.at(0);
  for( unsigned i = 1 ; i < num ; i++ )
    meet_depends_set( dep.at(i), result );
  // return data_dep_ses;
}

void memory_event::debug_print( std::ostream& stream ) {
  stream << *this << "\n";
  if( et == event_t::r || et == event_t::w ) {
    std::string s = et == event_t::r ? "Read" : "Write";
    stream << s << " var: " << v << ", orig_var : " <<prog_v
           << ", loc :" << loc_name << "\n";
    stream << "guard: " << guard << "\n";
  }
}

//----------------------
// todo: enable memoization
//----------------------
bool is_po_new( const me_ptr& x, const me_ptr& y ) {
  if( x == y )
    return true;
  if( x->is_pre() || y->is_post() ) return true;
  if( x->is_post() || y->is_pre() ) return false;
  if( x->tid != y->tid ) return false;
  if( x->get_topological_order() >= y->get_topological_order() ) return false;
  me_set visited, pending = y->prev_events;
  while( !pending.empty() ) {
    me_ptr yp = *pending.begin();
    pending.erase( yp );
    visited.insert( yp );
    if( x == yp ) return true;
    if( x->get_topological_order() >= yp->get_topological_order() ) continue;
    for( auto& ypp : yp->prev_events ) {
      if( visited.find( ypp ) == visited.end() ) pending.insert( ypp );
    }
  }
  return false;
}



//------------------------------------------------------------------------

void debug_print( std::ostream& out, const me_vec& set ) {
  for (auto c : set) {
    out << *c << " ";
  }
  out << std::endl;
}

void debug_print( std::ostream& out, const me_set& set ) {
  for (auto c : set) {
    out << *c << " ";
  }
  out << std::endl;
}

void debug_print( std::ostream& out, const me_to_ses_map& map ) {
  for (auto it : map) {
    me_ptr e = it.first;
    me_set set  = it.second;
    out << *e << "->";
    debug_print( out, set );
    out << "\n";
  }
  out << std::endl;
}

void debug_print( std::ostream& out, const depends& dep ) {
  out << "("<< *(dep.e) << ",";
  print_expr( out, dep.cond );
  out << ")";
}

void debug_print( std::ostream& out, const depends_set& set ) {
  for (auto dep : set) {
    debug_print( out, dep );
  }
  out << std::endl;
}

void memory_cons::save_tstamps(const vector< tstamp_var_ptr >& tstamps)
{
  tstamp_map.clear();
  for (auto loc: tstamps) {
    tstamp_map.insert(make_pair(loc->name, loc));
  }
}


void memory_cons::record_event( me_ptr& e ) {
  make_tstamp( e->e_v );
  make_tstamp( e->thin_v );
  make_po_tstamp( e->c11_hb_v );
  event_lookup.insert( make_pair( e->get_solver_symbol(), e ) );
  event_lookup.insert( make_pair( e->get_thin_solver_symbol(), e ) );
  event_lookup.insert( make_pair( e->get_c11_hb_solver_symbol(), e ) );
}


void memory_cons::make_tstamp( tstamp_var_ptr loc )
{
  std::vector< tstamp_var_ptr > tstamps;
  tstamps.push_back( loc );
  add_time_stamps(tstamps);
}

void memory_cons::add_time_stamps(std::vector< tstamp_var_ptr > tstamps)
{
  for (unsigned i=0; i<tstamps.size(); i++) {
    counter++;
    tstamps[i]->_serial = counter;

    //std::cout << tstamps[i]->name.c_str() << "\n";

    expr loc_expr = solver_ctx.int_const(tstamps[i]->name.c_str());
    tstamps[i]->e = loc_expr;
    tstamp_lookup.insert(make_pair(loc_expr, tstamps[i]));
  }
  save_tstamps(tstamps);
}

void memory_cons::make_po_tstamp( tstamp_var_ptr loc )
{
  counter++;
  loc->_serial = counter;
  auto hb_sort = solver_ctx.uninterpreted_sort("HB");
  expr loc_expr = solver_ctx.constant( loc->name.c_str(), hb_sort );
  loc->e = loc_expr;
  tstamp_lookup.insert(make_pair(loc_expr, loc));
}


expr memory_cons::get_rf_bit( const variable& v1,
                 const se_ptr& wr,
                 const se_ptr& rd ) const {
    assert( ( wr->is_pre() || wr->is_wr() ) &&
            ( rd->is_rd() || rd->is_post() ) );
    assert( !wr->is_wr() || v1 == wr->prog_v ); //Confirm v is OK instead of prog_v
    assert( !rd->is_rd() || v1 == rd->prog_v );

    std::string bname = v1+"-"+wr->name()+"-"+rd->name();
    return solver_ctx.bool_const(  bname.c_str() );
  }

expr memory_cons::get_rf_bit( const se_ptr& wr,
                 const se_ptr& rd ) const {
    assert( wr->is_wr() && rd->is_rd() );
    assert( wr->v == rd->v );
    const variable& v1 = wr->v;
    return get_rf_bit( v1, wr, rd );
    // std::string bname = v1+"-"+wr->name()+"-"+rd->name();
    // return z3.c.bool_const(  bname.c_str() );
  }


hb memory_cons::mk_hbs(const se_ptr& before, const se_ptr& after) {
  return make_hb( before->e_v, after->e_v );
}

expr memory_cons::mk_hbs( const se_set& before, const se_ptr& after) {
  expr hbs = solver_ctx.bool_val(true);
  for( auto& bf : before ) {
      hbs = hbs && mk_hbs( bf, after );
  }
  return hbs;
}

expr memory_cons::mk_hbs(const se_ptr& before, const se_set& after) {
  expr hbs = solver_ctx.bool_val(true);
  for( auto& af : after ) {
      hbs = hbs && mk_hbs( before, af );
  }
  return hbs;
}


expr memory_cons::mk_hbs(const se_set& before, const se_set& after) {
  expr hbs = solver_ctx.bool_val(true);
  for( auto& bf : before ) {
    for( auto& af : after ) {
      hbs = hbs && mk_hbs( bf, af );
    }
  }
  return hbs;
}

hb memory_cons::mk_hb_thin(const se_ptr& before, const se_ptr& after) {
  return make_hb( before->thin_v, after->thin_v );
}



expr memory_cons::mk_ghbs( const se_ptr& before, const se_ptr& after ) {
  expr cond = before->guard && after->guard;
  cond = cond.simplify();
  return implies( cond, mk_hbs( before, after ) );
}

expr memory_cons::mk_ghbs( const se_ptr& before, const se_set& after ) {
  expr hbs = solver_ctx.bool_val(true);
  for( auto& af : after ) hbs = hbs && mk_ghbs( before, af );
  return hbs;
}

expr memory_cons::mk_ghbs( const se_set& before, const se_ptr& after ) {
  expr hbs = solver_ctx.bool_val(true);
  for( auto& bf : before ) hbs = hbs && mk_ghbs( bf, after );
  return hbs;
}


memory_cons::memory_cons(solver_context& solver_ctx_) :
  solver_ctx(solver_ctx_) {
}


/*************************
 * hb
 *************************/

hb::operator expr () const {
  return e;
}

expr hb::get_guarded_forbid_expr() {
    return implies( e1->guard && e2->guard, !e );
}

void hb::update_signature() {
    _signature = loc1->serial();
    _signature <<= 16;
    _signature |= loc2->serial();
  }

hb::hb(tstamp_ptr loc1_, tstamp_ptr loc2_, expr e_):
  loc1(loc1_), loc2(loc2_), e(e_)
{
  update_signature();
}

  //the following allocator is not in use
hb::hb(se_ptr e1_, se_ptr e2_, expr e_):
  e1( e1_), e2( e2_), loc1(e1->e_v), loc2(e2->e_v),
  is_neg( false ), is_partial( false ), type( hb_t::hb ),
  e(e_)
{
  update_signature();
}

hb::hb( se_ptr e1_, tstamp_ptr l1_,
        se_ptr e2_, tstamp_ptr l2_, expr e_,
        bool is_neg ):
  e1( e1_), e2( e2_), loc1(l1_), loc2(l2_),
  is_neg( is_neg ), is_partial( false ), type( hb_t::hb ),
  e(e_)
{
 if( loc1->name.find( "__thin__" ) == 0 ) { type = hb_t::thin;
  }
  update_signature();
}

  // todo: this call should be removed
hb::hb( se_ptr e1_, tstamp_ptr l1_,
        se_ptr e2_, tstamp_ptr l2_, expr e_,
        bool is_neg, bool is_partial ):
  e1( e1_), e2( e2_), loc1(l1_), loc2(l2_),
  is_neg(is_neg) , is_partial( is_partial ), type( hb_t::hb ),
  e(e_)
{
  if( is_partial ) { type = hb_t::phb;
  }else if( loc1->name.find( "__thin__" ) == 0 ) { type = hb_t::thin;
  }
  update_signature();
}

hb::hb( se_ptr e1_, se_ptr e2_, expr e_,
        bool is_neg, hb_t type_ ):
  e1( e1_), e2( e2_),loc1( ), loc2( ),
  is_neg(is_neg) , is_partial( false ), type( type_ ),
  e(e_)
{
  if( type == hb_t::phb ) is_partial = false;
  // update_signature();
}

uint32_t hb::signature()
{
  return _signature;
}

bool hb::operator==(const hb& other) const
{
  return _signature == other._signature;
}

bool hb::operator!=(const hb &other) const {
  return !(*this == other);
}

bool operator< (const hb& hb1, const hb& hb2)
{
  if( hb1.loc1 != nullptr && hb1.loc2 != nullptr &&
      hb2.loc1 != nullptr && hb2.loc2 != nullptr )
    return COMPARE_OBJ2( hb1, hb2, loc1->name, loc2->name );
  return COMPARE_OBJ2( hb1, hb2, e1->name(), e2->name() );
}

ostream& operator<< (std::ostream& stream, const hb& hb) {
  if( hb.type == hb_t::rf ) {
    stream << "rf(" << hb.e1->name() << "," << hb.e2->name() << ")";
  }else if( hb.type == hb_t::thin ) {
    stream << "hb_ar(" << hb.e1->name() << "," << hb.e2->name() << ")";
  }else{
    if( hb.is_partial && hb.is_neg )
      stream << "!hb(" << hb.e2->name() << "," << hb.e1->name() << ")";
    else if( hb.is_partial && !hb.is_neg )
      stream << "hb(" << hb.e1->name() << "," << hb.e2->name() << ")";
    else
      stream << "hb(" << hb.loc1 << "," << hb.loc2 << ")";
      // stream << "(" << hb.loc1 << " < " << hb.loc2 << ")";
  }
  return stream;
}

void hb::debug_print(std::ostream& stream ) {  stream << *this << "\n"; }

hb hb::negate() const
{
  return hb(loc2, loc1, !e);
}


hb memory_cons::make_hb(tstamp_ptr loc1, tstamp_ptr loc2) {
  return hb(loc1, loc2, loc1->e < loc2->e);
}

//hb memory_cons::make_hb_po( tstamp_ptr loc1,
//                        tstamp_ptr loc2 ) {
//  return hb(loc1, loc2, sr_po(loc1->e,loc2->e) );
//}

//hb memory_cons::make_hb_po_ao( tstamp_ptr loc1,
//                           tstamp_ptr loc2 ) {
//  return hb(loc1, loc2, sr_po_ao( loc1->e,loc2->e ) );
//}


/*as memory_cons::make_as(tstamp_ptr loc1, tstamp_ptr loc2)
{
  assert (loc1->thread == loc2->thread);
  return as(loc1, loc2, loc1->e + (loc2->instr_no-loc1->instr_no)  == loc2->e);
}

bool memory_cons::eval_hb(const z3::model& model, tstamp_ptr loc1, tstamp_ptr loc2)
{
  return model.eval(make_hb(loc1, loc2)).get_bool();
}

hb_ptr memory_cons::get_hb(const expr& hb, bool allow_equal)
{
  bool possibly_equal = false;
  bool is_partial = false;
  expr hb_p = hb;
  if( solver_ctx.is_implies( hb ) ) {
    hb_p = hb.arg(1);
  }
  if( solver_ctx.is_bool_const( hb_p ) ) {
    auto it = current_rf_map.find( solver_ctx.get_top_func_name( hb_p ) );
    if( it != current_rf_map.end() ) {
      return it->second;
    }
  }

  auto p = get_locs(hb, possibly_equal, is_partial);
  mapit loc1 = p.first, loc2 = p.second, end = tstamp_lookup.end();
  if( (!possibly_equal || allow_equal || is_partial) && loc1!=end && loc2!=end){
    tstamp_ptr l1 = get<1>(*loc1);
    tstamp_ptr l2 = get<1>(*loc2);
    se_ptr e1;
    if( event_lookup.find( l1->expr ) != event_lookup.end() )
      e1 = event_lookup.at( l1->expr );
    se_ptr e2;
    if( event_lookup.find( l2->expr ) != event_lookup.end() )
      e2 = event_lookup.at( l2->expr );
    if( is_partial ){
      return shared_ptr<hb>(new hb( e1, l1, e2, l2, hb,
                                                    possibly_equal,is_partial));
    }else{
      return shared_ptr<hb>(new hb(e1, l1, e2, l2, hb,
                                                   possibly_equal));
    }
  } else
    return shared_ptr<hb>();
}

// unused function set for deprecation
// interesting code - it has annonymous function
std::vector< tstamp_ptr > memory_cons::get_trace(const z3::model& m)
{
  std::vector<tstamp_ptr> result;
  for (auto l : tstamp_map)
    result.push_back(get<1>(l));
  sort(result.begin(), result.end(), [&](const tstamp_ptr & a, const tstamp_ptr & b) -> bool
  { 
    return m.eval(((expr)(*a)) > *b).get_bool(); 
  });
  return result;
} */


void 
full_initialize_se( memory_cons& mem_enc, me_ptr e, me_set& prev_es,
                    std::map<const me_ptr, expr>& branch_conds) {
  mem_enc.record_event( e );
  return; //todo: to avoid memory leaks
  for(me_ptr ep  : prev_es) {
    ep->add_post_events( e, branch_conds.at(ep) );
  }

}
