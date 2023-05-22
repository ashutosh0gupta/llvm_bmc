#ifndef LLVMBMC_SPEC_H
#define LLVMBMC_SPEC_H

#include "include/options.h"
// #include "include/memory_event.h"

class bmc;

enum weak_memory_model {
  SC,
  ARM,
  WMM_UNKNOWN
};

//
// specification of a thread
//
class spec_thread {
public:

  std::string name;
  std::string entry_function;
  std::vector <expr> pres;
  std::vector <expr> envs;
  std::vector <expr> posts;
  std::vector < std::pair <std::string, std::string> > call_seqs;

  // me_vec events;
  // me_ptr start_event, final_event;
  unsigned period; // in ms
  unsigned priority;
  unsigned thread_num;

  //
  // A thread can be launched from another thread
  // such threads need not be specified by the specfile
  // we auto regconize such thread creations
  //
  void * launch_function    = NULL; // NULL: From spec or main main function
  void * launch_instruction = NULL; // todo: make it context senstive
  void * join_instruction   = NULL;   //          '' '' ''

  // if analyzer wants to treat a thread differently
  weak_memory_model wmm = WMM_UNKNOWN;
};

//
// specification of the entire system
//
class spec_system {
  public:
  std::vector<spec_thread> threads;
  std::vector <expr> pres;
  std::vector <expr> posts;
  weak_memory_model wmm = WMM_UNKNOWN;
};

void import_spec_file( std::unique_ptr<llvm::Module>& module,
                       options& o, bmc& b);
unsigned gcd(unsigned a, unsigned b);
void findlcm(bmc& b);

#endif // LLVMBMC_SPEC_H
