#ifndef LLVM_SPEC_H
#define LLVM_SPEC_H

#include "include/solver.h"
#include "lib/utils/solver_utils.h"
#include <string.h>
#include<iostream>
#include<algorithm>
#include <boost/algorithm/string.hpp>
#include <boost/filesystem.hpp>
#include <boost/filesystem/fstream.hpp>     

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


#endif // LLVM_SPEC_H
