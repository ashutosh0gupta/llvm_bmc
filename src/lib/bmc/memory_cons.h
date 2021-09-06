#ifndef MEMORY_CONS_H
#define MEMORY_CONS_H

#include <vector>
#include <memory>
#include <unordered_map>
#include <set>
#include "lib/utils/solver_utils.h"

// #include <z3++.h>
// #include "../helpers/helpers.h"
// #include "helpers/z3interf.h"

// namespace tara {
// namespace hb_enc {
  class integer;

  class memory_event;
  class variable;
  class tstamp;
  class hb;

  typedef std::shared_ptr<memory_event> se_ptr;
  typedef std::set<se_ptr> se_set;
  typedef std::shared_ptr<hb> hb_ptr;
  typedef std::vector<hb_ptr> hb_vec;
  typedef std::shared_ptr<tstamp const> tstamp_ptr;
  typedef std::shared_ptr<tstamp> tstamp_var_ptr;

std::string to_string (const tstamp& loc);

std::string operator+ (const std::string& lhs, const tstamp_ptr& rhs);
typedef std::pair<tstamp_ptr,tstamp_ptr> tstamp_pair;
std::ostream& operator<< (std::ostream& stream, const tstamp_pair& loc_pair);



struct as {
public:
  tstamp_ptr loc1;
  tstamp_ptr loc2;
  operator expr () const;
  as(tstamp_ptr loc1, tstamp_ptr loc2, expr e);
  uint32_t signature(); // a unique integer indentifying the as

  bool operator==(const as &other) const;
  bool operator!=(const as &other) const;

  friend std::ostream& operator<< (std::ostream& stream, const as& hb);
private:
  expr e;
  uint32_t _signature = 0;
};


  // In memory model, there may be several kind of timing constraints
  enum class hb_t {
     hb   // timing ordering                  // sc in c11
   , rf   // rf ordering
   , phb  // partial ordered hb introduced in // base in c11
   , thin // thin air hb                      // mo in c11
       };

struct hb {
public:
  se_ptr e1;
  se_ptr e2;
  tstamp_ptr loc1; //todo : to be removed; type should contain all the needed info
  tstamp_ptr loc2; //todo : to be removed
  bool is_neg;
  bool is_partial;
  hb_t type;
  operator expr () const;
  expr get_guarded_forbid_expr();
  hb(se_ptr loc1, se_ptr loc2, expr);
  hb(tstamp_ptr loc1, tstamp_ptr loc2, expr e);
  hb( se_ptr e1, tstamp_ptr loc1,
      se_ptr e2, tstamp_ptr loc2, expr e, bool is_neg );
  hb( se_ptr e1, tstamp_ptr loc1,
      se_ptr e2, tstamp_ptr loc2,
      expr e, bool is_neg, bool is_partial );
  hb( se_ptr e1_, se_ptr e2_, expr e, bool is_neg, hb_t type_ );
  uint32_t signature(); // a unique integer indentifying the hb

  bool operator==(const hb &other) const;
  bool operator!=(const hb &other) const;

  friend std::ostream& operator<< (std::ostream& stream, const hb& hb);
  void debug_print(std::ostream& stream );

  hb negate() const;

  bool is_hb()   const { return type == hb_t::hb; };
  bool is_rf()   const { return type == hb_t::rf; };
  bool is_partial_ord_hb() const { return type == hb_t::phb; };
  bool is_thin() const { return type == hb_t::thin; };

  friend bool operator< (const hb& hb1, const hb& hb2);
private:
  expr e;
  uint32_t _signature = 0;
  void update_signature();
};


class memory_cons
{
public:
  memory_cons(solver_context& solver_ctx);
  // encoding(context& ctx);
  virtual ~memory_cons();
  
  void record_event( se_ptr& );
  void record_rf_map( std::set< std::tuple<std::string, se_ptr, se_ptr> >& );

  //void save_tstamps(const std::vector< tstamp_var_ptr >& tstamps);
  void make_tstamp( tstamp_var_ptr );
  void add_time_stamps(std::vector< tstamp_var_ptr > );
  tstamp_ptr get_tstamp(const std::string& name); // make one tstamp from a name
  void make_po_tstamp( tstamp_var_ptr loc );
  //hb make_hb(tstamp_ptr loc1, tstamp_ptr loc2);
  //hb make_hb_po(tstamp_ptr loc1, tstamp_ptr loc2);
  //hb make_hb_po_ao(tstamp_ptr loc1, tstamp_ptr loc2);
//--------------------------------------------------------------------------
//start of wmm support
//--------------------------------------------------------------------------

  //generic hbs
  hb mk_hb_thin(const se_ptr&, const se_ptr& );
  hb mk_hbs(const se_ptr& loc1, const se_ptr& loc2);
  expr mk_hbs(const se_set& loc1, const se_ptr& loc2);
  expr mk_hbs(const se_ptr& loc1, const se_set& loc2);
  expr mk_hbs(const se_set& loc1, const se_set& loc2);
  expr mk_ghbs( const se_ptr& before, const se_ptr& after );
  expr mk_ghbs( const se_ptr& before, const se_set& after );
  expr mk_ghbs( const se_set& before, const se_ptr& after );
  expr mk_ghb_thin( const se_ptr& before, const se_ptr& after );

  //calls related c11 model
  hb mk_hb_c11_hb(const se_ptr& before, const se_ptr& after);
  hb mk_hb_c11_hb_ao(const se_ptr& before, const se_ptr& after);
  hb mk_hb_c11_sc(const se_ptr& before, const se_ptr& after);
  hb mk_hb_c11_mo(const se_ptr& before, const se_ptr& after);
  expr mk_ghbs_c11_hb( const se_set& before, const se_ptr& after );
  expr mk_ghb_c11_hb( const se_ptr& before, const se_ptr& after );
  expr mk_ghb_c11_mo( const se_ptr& before, const se_ptr& after );
  expr mk_ghb_c11_sc( const se_ptr& before, const se_ptr& after );

  //calls related power model
  hb mk_hb_power_hb(const se_ptr& before, const se_ptr& after);
  hb mk_hb_power_obs (const se_ptr& before, const se_ptr& after);
  expr mk_ghb_power_hb( const se_ptr& before, const se_ptr& after );
  expr mk_ghb_power_obs ( const se_ptr& before, const se_ptr& after );
  //todo: do we need mo for power
  hb mk_hb_power_prop  (const se_ptr& before, const se_ptr& after);
  expr mk_ghb_power_prop  ( const se_ptr& before, const se_ptr& after );

  expr mk_guarded_forbid_expr( const hb_vec& );
  expr mk_expr( const hb_vec& );

  bool eval_hb( const model& m, const se_ptr& before, const se_ptr& after ) const;

// protected:
  std::set< std::tuple<std::string, se_ptr, se_ptr> > rf_map;
  std::map< std::string, hb_ptr > current_rf_map;
  expr get_rf_bit( const se_ptr&, const se_ptr& ) const;
  expr get_rf_bit( const variable&, const se_ptr&, const se_ptr& ) const;
public:
//--------------------------------------------------------------------------
//end of wmm support
//--------------------------------------------------------------------------
  virtual as make_as(tstamp_ptr loc1, tstamp_ptr loc2) const = 0;
  virtual bool eval_hb(const model& model, tstamp_ptr loc1, tstamp_ptr loc2) const = 0;
  virtual hb_ptr get_hb(const expr& hb, bool allow_equal = false) const = 0;
  virtual std::vector<tstamp_ptr> get_trace(const model& m) const = 0;
  // std::list<expr> get_hbs( model& m ) const;
  std::vector<hb_ptr> get_hbs( model& m );
  solver_context& solver_ctx;
  // context& ctx;
  uint16_t counter = 0;
  std::unordered_map< expr, tstamp_var_ptr, expr_hash, expr_equal > tstamp_lookup;
  std::unordered_map< expr, se_ptr, expr_hash, expr_equal > event_lookup;
protected:
  std::unordered_map<std::string, tstamp_ptr> tstamp_map;
  void save_tstamps(const std::vector<tstamp_var_ptr>& );

};
// }}

#endif // MEMORY_CONS_H
