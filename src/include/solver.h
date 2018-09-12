#ifndef LLVM_BMC_SOLVER_H
#define LLVM_BMC_SOLVER_H

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wreturn-type"
#include <z3.h>
#include <z3++.h>
#pragma GCC diagnostic push

#include <vector>
#include <unordered_set>

typedef z3::context solver_context;
typedef z3::sort sort;
typedef z3::expr expr;
typedef z3::expr_vector expr_vector;
typedef z3::model model;

#endif

