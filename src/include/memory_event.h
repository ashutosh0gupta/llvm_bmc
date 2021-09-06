#ifndef BMC_MEMORY_EVENT_H
#define BMC_MEMORY_EVENT_H

// #include "lib/utils/utils.h"
// #include "lib/utils/solver_utils.h"
#include "include/memory_cons.h"
#include <boost/concept_check.hpp>

#include "llvm/IR/Constants.h"

  class tstamp;

  // typedef std::shared_ptr<memory_event> me_ptr;
  // typedef std::set<me_ptr> me_set;
  // typedef std::shared_ptr<hb_enc::hb> hb_ptr;
  // typedef std::vector<hb_ptr> hb_vec;
  typedef std::shared_ptr<tstamp const> tstamp_ptr;
  typedef std::shared_ptr<tstamp> tstamp_var_ptr;

  std::string to_string (const tstamp& loc);

  std::string operator+ (const std::string& lhs, const tstamp_ptr& rhs);
  typedef std::pair<tstamp_ptr,tstamp_ptr> tstamp_pair;
  std::ostream& operator<< (std::ostream& stream, const tstamp_pair& loc_pair);
   

  struct variable {
    std::string name;
    sort s;
    operator std::string() const { return name;}
    variable(std::string name, sort s_) : name(name), s(s_) {}
    variable(std::string name, solver_context& ctx) : name(name), s(sort(ctx)) {}
    variable(solver_context& ctx) : s(sort(ctx)) {}
    friend variable operator+ (const variable& v, const std::string& str) {
      return variable(v.name+str, v.s);
    }
    friend variable operator+ (const std::string& str, const variable& v) {
      return variable(str+v.name, v.s);
    }

    operator expr() const {
      return s.ctx().constant(name.c_str(), s);
    }

    friend std::ostream& operator<< (std::ostream& stream, const variable& var) {
      stream << var.name;
      return stream;
    }
    bool operator==(const variable& rhs) const {
      return std::equal_to<std::string>()(this->name, rhs.name);
    }
    bool operator!=(const variable& rhs) const {
      return !(*this==rhs);
    }
    bool operator<( const variable& rhs) const {
      return this->name < rhs.name;
    }

    struct variable_hash {
      size_t operator () (const variable &v) const { return std::hash<std::string>()(v.name); }
    };

    struct variable_equal : std::binary_function <variable,variable,bool> {
      bool operator() (const variable& x, const variable& y) const {
        return std::equal_to<std::string>()(x.name, y.name);
      }
    };

    typedef std::unordered_set<variable, variable_hash, variable_equal> variable_set;
    typedef std::unordered_set<std::string> string_set;

    //--------------------------------------------------------------------------
    //support for gdb
    void debug_print( const variable_set& , std::ostream& out);
    //--------------------------------------------------------------------------

  };


struct tstamp {
  uint16_t _serial;
  expr e;
private:
  //expr e; // ensure this one is not visible from the outside

  //friend class integer;
public:
  tstamp(tstamp& ) = delete;
  tstamp& operator=(tstamp&) = delete;
  tstamp(solver_context& ctx, std::string name ,bool special = false);

  std::string name;
  /**
   * @brief True if this is a special tstamp
   *
   * This means the tstamp is not actualy in the program, but the start symbol and the like
   */
  bool special;  //todo: rename to a meaningful name
  int thread; // number of the thread of this tstamp
  int instr_no; // number of this instruction
  /**
   * @brief The previous tstamp in the same thread
   *
   */
  //std::weak_ptr<hb_enc::tstamp const> prev;
  std::weak_ptr<tstamp const> prev;
  /**
   * @brief The next tstamp in the same thread
   *
   */
  //std::weak_ptr<hb_enc::tstamp const> next;
  std::weak_ptr<tstamp const> next;


  bool operator==(const tstamp &other) const;
  bool operator!=(const tstamp &other) const;
  operator expr () const;
  uint16_t serial() const;

  friend std::ostream& operator<< (std::ostream& stream, const tstamp& loc);
  friend std::ostream& operator<< (std::ostream& stream, const tstamp_ptr& loc);

  void debug_print(std::ostream& stream );
};

  // This object has dual use
  // - identify events originated from specific location
  // - give events pretty names. For example ''the_launcher''
struct source_loc{
  // (0,0,"") is unknown location
  // (0,0,something) is an unknown location with a pretty name!!!
  source_loc() {};
  source_loc( unsigned l, unsigned c, std::string s) :
    line(l), col(c), file(s) {}; // constructor for locations in a file
  source_loc( std::string s) : file(s) {}; // constructor for pretty named locs
  unsigned line = 0;
  unsigned col = 0;
  std::string file;
  std::string& pretty_name = file; // used as unique event name(user ensured)!!
  std::string position_name();
  std::string gen_name();

  source_loc& operator=(const source_loc &n_loc) {
    line = n_loc.line;
    col = n_loc.col;
    file = n_loc.file;
    return *this;  // Return a reference to myself.
  }
};

  //todo: the following two enums must be merged

  // C++ specifies ordering tags
  // this notion is not language independent
  enum class o_tag_t {
      na = 0,
      uo = 1,   //unordered
      mon = 2, // monotonic
      acq = 4, // acquire
      rls = 5, // release
      acqrls = 6, //acquire release
      sc = 7, // sequentially consistent
      };

  //todo: add thread create event and join event
  enum class event_t {
      pre,    // initialization event
      create, // create thread //todo: yet to be used and tested
      join,   // join thread   //todo: yet to be used and tested
      r,      // read events
      w,      // write events
      u,      // update events
      barr,   // three kinds of fences
      barr_a, // " " " " " " interepretted differently in different
      barr_b, // " " " " " " memory models
      block,  // events that indicate the heads of blocks
      post    // final event
      };

  std::string event_t_name( event_t et );

  class memory_event;
  typedef memory_event se;
  typedef std::shared_ptr<memory_event> me_ptr;
  typedef std::set<me_ptr> me_set;
  typedef std::vector<me_ptr> me_vec;
  class depends;
  typedef std::set<depends> depends_set;

//
// memory event
//
  class memory_event
  {
  private:
    tstamp_var_ptr
    create_internal_event(solver_context& sol_ctx, std::string event_name,
                           unsigned tid, unsigned instr_no, bool special);
                           // bool is_read, std::string& prog_v_name );
    void update_topological_order();
  public:
    memory_event( solver_context& sol_ctx,
                    unsigned _tid, me_set& _prev_events, unsigned i,
                    //const tara::variable& _v, const tara::variable& _prog_v,
		    const variable& _v, const llvm::GlobalVariable* _prog_v,
                    std::string loc, event_t _et );

    memory_event(  solver_context& sol_ctx,
                    unsigned _tid, me_set& _prev_events, unsigned instr_no,
                    std::string _loc, event_t _et );


    memory_event( solver_context& sol_ctx, unsigned _tid,
                    me_set& _prev_events, //const tara::variable& _prog_v,
		    const llvm::GlobalVariable* _prog_v,
                    expr& path_cond, std::vector<expr>& history_,
                    source_loc& _loc, event_t _et, o_tag_t ord_tag );

    memory_event(   solver_context& sol_ctx, unsigned _tid,
                    me_set& _prev_events, expr& path_cond,
                    std::vector<expr>& _history,
                    source_loc& _loc, event_t _et, o_tag_t _o_tag );
  public:
    unsigned tid;
    //tara::variable v;
    variable v;            // variable with ssa name
    //tara::variable v_copy;
    variable v_copy;       // variable with ssa name
                                 // v_copy is same as v for normal rd and wr
                                 // only for update instruction v_copy is diff
    //tara::variable prog_v;
    //variable prog_v;       // variable name in the program
    const llvm::GlobalVariable* prog_v;       // variable name in the program
    std::string loc_name;
    //tara::variable rd_v() { return v; }
    variable rd_v() { return v; }
    //tara::variable wr_v() { return v_copy; }
    variable wr_v() { return v_copy; }
    source_loc loc;
    me_ptr rmw_other=NULL;
  private:
    unsigned topological_order;
  public:
    // several time stamps are needed for modelling memory models
    //                       Other memory models     c11     power
    tstamp_var_ptr e_v;      // hb variable         // sc    // hb
    tstamp_var_ptr thin_v;   // thin air variable   // mo    // prop
    tstamp_var_ptr c11_hb_v;                        // hb
    tstamp_var_ptr e2;                                       // obs
    tstamp_var_ptr e3;                                       // mo

    event_t et;    // type of the event
    o_tag_t o_tag; // ordering tag on the event

    me_set prev_events; // in straight line programs it will be singleton
                        // we need to remove access to  pointer
    depends_set post_events;
    expr guard;
    std::vector<expr> history;
    depends_set data_dependency;
    depends_set ctrl_dependency;
    depends_set ctrl_isync_dep;
    depends_set addr_dependency; //todo: unsupported for now

    //in case of loop unrolling. Multiple events have same position name
    std::string position_name;

    std::string name() const;
    std::string get_position_name() const;
    // inline std::string name() const {
    //   return e_v->name;
    // }

    inline bool is_pre()            const { return et == event_t::pre;    }
    inline bool is_rd()             const { return et == event_t::r ||
                                                   et == event_t::u;      }
    inline bool is_wr()             const { return et == event_t::w ||
                                                   et == event_t::u;      }
    inline bool is_update()         const { return et == event_t::u;      }
    inline bool is_fence()          const { return et == event_t::barr;   }
    inline bool is_fence_a()        const { return et == event_t::barr_a; }
    inline bool is_fence_b()        const { return et == event_t::barr_b; }
    inline bool is_fence_any()      const {
      return is_fence() || is_fence_a() || is_fence_b();
    }
    inline bool is_non_mem_op()     const {
      return is_block_head () || is_fence_any() || is_thread_create()
        || is_thread_join();
    }
    //todo: remove references to function barrier
    inline bool is_barrier()        const { return et == event_t::barr;   }
    inline bool is_before_barrier() const { return et == event_t::barr_b; }
    inline bool is_after_barrier () const { return et == event_t::barr_a; }
    inline bool is_barr_type()      const {
      return is_barrier() || is_before_barrier() || is_after_barrier() ||
        is_block_head ();
    }
    //---- above is set for deletion
    inline bool is_thread_create()  const { return et == event_t::create; }
    inline bool is_thread_join()    const { return et == event_t::join;   }
    inline bool is_block_head ()    const { return et == event_t::block;  }
    inline bool is_post()           const { return et == event_t::post;   }
    inline bool is_mem_op()         const { return is_rd() || is_wr();    }


    inline bool is_na()     const { return o_tag == o_tag_t::na;  }
    inline bool is_rlx()    const { return o_tag == o_tag_t::mon; }
    inline bool is_rls()    const { return o_tag == o_tag_t::rls; }
    inline bool is_acq()    const { return o_tag == o_tag_t::acq; }
    inline bool is_rlsacq() const { return o_tag == o_tag_t::acqrls; }
    inline bool is_sc()     const { return o_tag == o_tag_t::sc;  }
    inline bool is_atomic() const { return o_tag != o_tag_t::na;  }


    inline bool is_at_most_rlx() const {
      // assert( is_wr() || is_pre() );
      return is_na() || is_rlx();
    }

    inline bool is_at_least_rls() const {
      // assert( is_wr() || is_pre() );
      return is_rls() || is_rlsacq() || is_sc();
    }

    inline bool is_at_least_acq() const {
      // assert( is_rd() || is_post() );
      return is_acq() || is_rlsacq() || is_sc();
    }

    inline bool is_at_least_rlsacq() const {
      // assert( is_pre() ||
      //         is_wr() || is_rd() || is_post() );
      return is_rlsacq() || is_sc();
    }

    unsigned get_instr_no() const;

    inline unsigned get_topological_order() const {
      return topological_order;
      // return e_v->instr_no;
    }

    inline void set_topological_order( unsigned order ) {
      topological_order = order;
    }

    inline void append_history( expr f ) {
      guard = guard && f;
      history.push_back(f);
    }

    // symbol aliases for generic model
    expr get_solver_symbol() const;
    expr get_thin_solver_symbol() const;

    // symbol aliases for c11 model
    expr get_c11_hb_solver_symbol() const;
    expr get_c11_mo_solver_symbol() const;
    expr get_c11_sc_solver_symbol() const;
    inline tstamp_ptr get_c11_hb_stamp() const { return c11_hb_v; }
    inline tstamp_ptr get_c11_mo_stamp() const { return thin_v; }
    inline tstamp_ptr get_c11_sc_stamp() const { return e_v; }

    // symbol aliases for power model
    expr get_power_hb_solver_symbol() const;
    expr get_power_prop_solver_symbol() const;
    expr get_power_obs_solver_symbol() const;
    expr get_power_mo_solver_symbol() const;
    inline tstamp_ptr get_power_hb_stamp()   const { return e_v; }
    inline tstamp_ptr get_power_thin_stamp() const { return thin_v; }
    inline tstamp_ptr get_power_obs_stamp()  const { return e2; }
    inline tstamp_ptr get_power_prop_stamp()   const { return e3; }

    inline bool access_same_var( const me_ptr& e ) const {
      if( is_pre() || is_post() ) return true;
      //return prog_v.name == e->prog_v.name;
    }

    inline bool access_dominates( const me_ptr& e ) const {
      if( !access_same_var(e) ) return false;
      if( et == e->et) return true;
      if( is_pre() || is_post() ) return true;
      if( is_update() && e->is_mem_op() ) return true;
      return false;
    }


    inline unsigned get_tid() const {
      return tid;
    }

    void set_pre_events( me_set& );
    void add_post_events( me_ptr&, expr );
    expr get_post_cond( const me_ptr& e_post ) const;

    void set_data_dependency( const depends_set& deps );
    void set_ctrl_dependency( const depends_set& deps );
    void set_ctrl_isync_dep( const depends_set& deps );
    void set_addr_dependency( const depends_set& deps );
    void set_dependencies( const depends_set& data,
                           const depends_set& ctrl );
    expr get_ctrl_dependency_cond( const me_ptr& e2 );
    expr get_data_dependency_cond( const me_ptr& e2 );
    expr get_addr_dependency_cond( const me_ptr& e2 );

    friend std::ostream& operator<< ( std::ostream& stream,
                                      const memory_event& var ) {
      stream << var.name();
      return stream;
    }
    void debug_print(std::ostream& stream );
    expr get_rd_expr(const variable&);
    expr get_wr_expr(const variable&);
  };

  typedef std::unordered_map<std::string, me_ptr> name_to_ses_map;

  void full_initialize_se( memory_cons& hb_enc, me_ptr e, me_set& prev_es,
                           std::map<const me_ptr, expr>& branch_conds);


  //--------------------------------------------------------------------------
  // new calls
  // todo: streamline se all tstamps

  inline me_ptr
  mk_me_ptr( memory_cons& mem_enc, unsigned tid, me_set prev_es,
             expr& path_cond, std::vector<expr>& history_,
             const llvm::GlobalVariable* prog_v, source_loc& loc,
             event_t _et, o_tag_t ord_tag ) {
    std::map<const me_ptr, expr > bconds;
    for( auto& ep : prev_es ) {
      bconds.insert( std::make_pair( ep, mem_enc.solver_ctx.bool_val(true) ) );
    }
    me_ptr e = std::make_shared<memory_event>( mem_enc.solver_ctx, tid, prev_es,prog_v,
                                               path_cond, history_, loc, _et,
                                               ord_tag );
    full_initialize_se( mem_enc, e, prev_es, bconds );

    // std::string loc_name = loc.gen_name();
    // variable ssa_v = prog_v + "#" + loc_name;
    // me_ptr e = std::make_shared<memory_event>( mem_enc.solver_ctx, tid, prev_es, 0,
    //                                              ssa_v, prog_v,loc_name,_et);
    // full_initialize_se( mem_enc, e, prev_es, path_cond, history_,loc,ord_tag,bconds);
    return e;
  }

  inline me_ptr
  mk_me_ptr( memory_cons& mem_enc, unsigned tid, me_set prev_es,
             expr& path_cond, std::vector<expr>& history_,
             source_loc& loc, event_t et,
             std::map<const me_ptr, expr>& bconds,
             o_tag_t ord_tag = o_tag_t::na  ) {

    me_ptr e = std::make_shared<memory_event>( mem_enc.solver_ctx, tid, prev_es,
                                                 path_cond, history_, loc, et,
                                                 ord_tag );
    full_initialize_se( mem_enc, e, prev_es, bconds );

    // std::string lname;
    // if( et == event_t::block ) {
    //   source_loc loc_d;
    //   lname = "block__" + std::to_string(tid) + "__"+ loc_d.gen_name();
    // }else{
    //   lname = loc.gen_name();
    // }
    // me_ptr e =
    //   std::make_shared<memory_event>(mem_enc.solver_ctx,tid,prev_es,0,lname,et);
    // full_initialize_se( mem_enc, e, prev_es, path_cond, history_,loc,ord_tag,bconds);
    return e;
  }

  inline me_ptr
  mk_me_ptr( memory_cons& mem_enc, unsigned tid, me_set prev_es,
             expr& path_cond, std::vector<expr>& history_,
             source_loc& loc, //std::string loc,
             event_t et, o_tag_t ord_tag = o_tag_t::na ) {
    std::map<const me_ptr, expr> branch_conds;
    for( auto& ep : prev_es ) {
      branch_conds.insert( std::make_pair( ep, mem_enc.solver_ctx.bool_val(true) ) );
    }
    // std::string loc_name = loc.name();
    me_ptr e = mk_me_ptr( mem_enc, tid, prev_es, path_cond, history_,
                          loc, et, branch_conds, ord_tag );
    e->loc = loc;
    return e;
  }

  //--------------------------------------------------------------------------

  struct me_hash {
    size_t operator () (const me_ptr &v) const {
      // return std::hash<std::string>()(v->e_v->name);
      return std::hash<std::string>()(v->name());
    }
  };

  struct me_equal :
    std::binary_function <memory_event,memory_event,bool> {
    bool operator() (const me_ptr& x, const me_ptr& y) const {
      return std::equal_to<std::string>()(x->name(), y->name());
    }
  };

  struct me_cmp :
    std::binary_function <memory_event,memory_event,bool> {
    bool operator() (const me_ptr& x, const me_ptr& y) const {
      return x->get_topological_order() < y->get_topological_order() ||
        ( x->get_topological_order() == y->get_topological_order() &&
          x < y
          );
    }
  };

  typedef std::set< me_ptr, me_cmp > me_tord_set;
  // typedef std::unordered_set<me_ptr, me_hash, me_equal> me_set;

typedef std::unordered_map<variable, me_ptr, variable::variable_hash, variable::variable_equal> var_to_me_map;

  typedef std::unordered_map<variable, me_set, variable::variable_hash, variable::variable_equal> var_to_ses_map;

  typedef std::unordered_map<variable, me_vec, variable::variable_hash, variable::variable_equal> var_to_me_vec_map;

  typedef std::unordered_map<me_ptr, me_set, me_hash, me_equal> me_to_ses_map;

  class depends{
  public:
    me_ptr e;
    expr cond;
    depends( me_ptr e_, expr cond_ ) : e(e_), cond(cond_) {}
    friend inline bool operator<( const depends& d1, const depends& d2 ) {
      return d1.e < d2.e;
    }
  };

  typedef std::unordered_map<me_ptr, depends_set, me_hash, me_equal> me_to_depends_map;
  typedef std::unordered_map< variable,
                              depends_set,
                              variable::variable_hash,
                              variable::variable_equal> var_to_depends_map;   

  depends pick_maximal_depends_set( depends_set& set );
  void join_depends_set( const me_ptr&, const expr, depends_set& set );
  void join_depends_set( const depends& dep, depends_set& set );
  void join_depends_set( const depends_set& , depends_set& );
  void join_depends_set( const depends_set& , const depends_set&, depends_set&);
  void join_depends_set( const std::vector<depends_set>&, depends_set& );
  void join_depends_set( const std::vector<depends_set>&,
                         const std::vector<expr>& conds,
                         depends_set& result );
  void meet_depends_set( const me_ptr&, const expr, depends_set& set );
  void meet_depends_set( const depends& dep, depends_set& set );
  void meet_depends_set( const depends_set& , depends_set& );
  void meet_depends_set( const depends_set& , const depends_set&, depends_set&);
  void meet_depends_set( const std::vector<depends_set>&, depends_set& );
  void meet_depends_set( const std::vector<depends_set>&,
                         const std::vector<expr>& conds,
                         depends_set& result );
  void pointwime_and( const depends_set&, expr, depends_set& );


  bool is_po_new( const me_ptr& x, const me_ptr& y );
  // must_before: if y occurs then, x must occur in the past
  // bool is_must_before( const me_ptr& x, const me_ptr& y );
  // must_after : if x occurs then, y must occur in the future
  // bool is_must_after ( const me_ptr& x, const me_ptr& y );

//}

  void debug_print(std::ostream& out, const me_vec& set );
  void debug_print(std::ostream& out, const me_set& set );
  void debug_print(std::ostream& out, const me_to_ses_map& dep );
  void debug_print(std::ostream& out, const depends& dep );
  void debug_print(std::ostream& out, const depends_set& set);
//}

#endif // BMC_MEMORY_EVENT_H
