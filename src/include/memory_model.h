#include "include/options.h"
#include "include/solver.h"
#include "include/llvm_decls.h"

class datatype {
public:
	datatype( sort& type_ ) : type(type_) {}
	sort type;
};

class state_obj {
public:
  state_obj( expr& e_,datatype& t_ ) : e(e_), t(t_) {}
  expr e;
  datatype t;
  void print();
};

// TODO : Add proper access to member variables of classes
class memory_state {
public:
  std::vector<state_obj> mem_state_vec;
};

class array_type : public datatype {
public:
	expr length;
};

class me_set1;

class memory_model {
public:
  memory_model( solver_context& solver_ctx_ ) : solver_ctx(solver_ctx_) {}
  expr get_fresh_name( sort, std::string );
  void update_name( unsigned, std::vector<const llvm::GlobalVariable*>& );
  // 
  std::pair<expr,expr> write(unsigned, const llvm::StoreInst*, expr& );
  std::pair<expr,expr> write_con(unsigned, const llvm::StoreInst*, expr&, expr );
  expr read( unsigned, const llvm::LoadInst*);
  expr read_con( unsigned, const llvm::LoadInst*, expr );
  expr join_state( std::vector<expr>&, std::vector<unsigned>&, unsigned );

  solver_context& solver_ctx;
  // TODO : change to a more general thing than GlobalVariable*
  std::map<const llvm::GlobalVariable*,unsigned> ind_in_mem_state;
  std::map<unsigned,memory_state> store_state_map; // block -> global state map

  inline unsigned state_size() { return ind_in_mem_state.size(); }
  //todo: thread name may change to a class reference
  //std::vector<std::string> threads; // thread names
  std::map< std::string, me_set1&> events;
  //std::vector<const llvm::GlobalVariable*> concurrent_vars;

  void print();

  // =================================================
  // - create threads
  // - ability to store events by thread
  // - declare which globals are concurrent variables
  // - add events
  // - modify write and read to add appropriate params

};
