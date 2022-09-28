#ifndef LLVMBMC_SPEC_H
#define LLVMBMC_SPEC_H

#include "include/options.h"

class bmc;

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
  unsigned period; // in ms
  unsigned priority;
  unsigned thread_num;
};

//
// specification of the entire system
//
class spec_system {
  public:
  std::vector<spec_thread> threads;
  std::vector <expr> pres;
  std::vector <expr> posts;
};

void import_spec_file( std::unique_ptr<llvm::Module>& module,
                       options& o, bmc& b);
unsigned gcd(unsigned a, unsigned b);
void findlcm(bmc& b);

#endif // LLVMBMC_SPEC_H
