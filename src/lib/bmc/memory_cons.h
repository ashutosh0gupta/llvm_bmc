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
  // class integer;

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
  operator z3::expr () const;
  as(tstamp_ptr loc1, tstamp_ptr loc2, z3::expr expr);
  uint32_t signature(); // a unique integer indentifying the as
  
  bool operator==(const as &other) const;
  bool operator!=(const as &other) const;
  
  friend std::ostream& operator<< (std::ostream& stream, const as& hb);
private:
  z3::expr expr;
  uint32_t _signature = 0;
};

class memory_cons
{
public:
  memory_cons(solver_context& solver_ctx);
  // encoding(z3::context& ctx);
  virtual ~memory_cons();
  
  virtual void record_event( se_ptr& ) = 0;
  void record_rf_map( std::set< std::tuple<std::string, se_ptr, se_ptr> >& );

  virtual void make_tstamp( tstamp_var_ptr ) = 0;
  virtual void add_time_stamps(std::vector< tstamp_var_ptr > ) = 0;
  virtual tstamp_ptr get_tstamp(const std::string& name) const; // make one tstamp from a name
  virtual hb make_hb(tstamp_ptr loc1, tstamp_ptr loc2) const = 0;
  virtual hb make_hb_po(tstamp_ptr loc1, tstamp_ptr loc2) const = 0;
  virtual hb make_hb_po_ao(tstamp_ptr loc1, tstamp_ptr loc2) const = 0;
//--------------------------------------------------------------------------
//start of wmm support
//--------------------------------------------------------------------------

  //generic hbs
  hb mk_hb_thin(const se_ptr&, const se_ptr& );
  hb mk_hbs(const se_ptr& loc1, const se_ptr& loc2);
  z3::expr mk_hbs(const se_set& loc1, const se_ptr& loc2);
  z3::expr mk_hbs(const se_ptr& loc1, const se_set& loc2);
  z3::expr mk_hbs(const se_set& loc1, const se_set& loc2);
  z3::expr mk_ghbs( const se_ptr& before, const se_ptr& after );
  z3::expr mk_ghbs( const se_ptr& before, const se_set& after );
  z3::expr mk_ghbs( const se_set& before, const se_ptr& after );
  z3::expr mk_ghb_thin( const se_ptr& before, const se_ptr& after );

  //calls related c11 model
  hb mk_hb_c11_hb(const se_ptr& before, const se_ptr& after);
  hb mk_hb_c11_hb_ao(const se_ptr& before, const se_ptr& after);
  hb mk_hb_c11_sc(const se_ptr& before, const se_ptr& after);
  hb mk_hb_c11_mo(const se_ptr& before, const se_ptr& after);
  z3::expr mk_ghbs_c11_hb( const se_set& before, const se_ptr& after );
  z3::expr mk_ghb_c11_hb( const se_ptr& before, const se_ptr& after );
  z3::expr mk_ghb_c11_mo( const se_ptr& before, const se_ptr& after );
  z3::expr mk_ghb_c11_sc( const se_ptr& before, const se_ptr& after );

  //calls related power model
  hb mk_hb_power_hb(const se_ptr& before, const se_ptr& after);
  hb mk_hb_power_obs (const se_ptr& before, const se_ptr& after);
  z3::expr mk_ghb_power_hb( const se_ptr& before, const se_ptr& after );
  z3::expr mk_ghb_power_obs ( const se_ptr& before, const se_ptr& after );
  //todo: do we need mo for power
  hb mk_hb_power_prop  (const se_ptr& before, const se_ptr& after);
  z3::expr mk_ghb_power_prop  ( const se_ptr& before, const se_ptr& after );

  z3::expr mk_guarded_forbid_expr( const hb_vec& );
  z3::expr mk_expr( const hb_vec& );

  bool eval_hb( const z3::model& m, const se_ptr& before, const se_ptr& after ) const;

// protected:
  std::set< std::tuple<std::string, se_ptr, se_ptr> > rf_map;
  std::map< std::string, hb_ptr > current_rf_map;
  z3::expr get_rf_bit( const se_ptr&, const se_ptr& ) const;
  z3::expr get_rf_bit( const variable&, const se_ptr&, const se_ptr& ) const;
public:
//--------------------------------------------------------------------------
//end of wmm support
//--------------------------------------------------------------------------
  virtual as make_as(tstamp_ptr loc1, tstamp_ptr loc2) const = 0;
  virtual bool eval_hb(const z3::model& model, tstamp_ptr loc1, tstamp_ptr loc2) const = 0;
  virtual hb_ptr get_hb(const z3::expr& hb, bool allow_equal = false) const = 0;
  virtual std::vector<tstamp_ptr> get_trace(const z3::model& m) const = 0;
  // std::list<z3::expr> get_hbs( z3::model& m ) const;
  std::vector<hb_ptr> get_hbs( z3::model& m );
  solver_context& solver_ctx;
  // z3::context& ctx;
protected:
  std::unordered_map<std::string, tstamp_ptr> tstamp_map;
  void save_tstamps(const std::vector<tstamp_var_ptr>& );
};
// }}

#endif // MEMORY_CONS_H
