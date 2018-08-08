#ifndef LLVM_BMC_UTILS_H
#define LLVM_BMC_UTILS_H

#include <string>
#include <stdexcept>
#include <cassert>
#include <iostream>
#include <ostream>
#include <sstream>
#include <vector>
#include <map>
#include <unordered_set>

namespace llvm_bmc {
class llvm_bmc_exception : public std::runtime_error
{
public:
  llvm_bmc_exception(const char* what) : runtime_error(what) {}
  llvm_bmc_exception(const std::string what) : runtime_error(what.c_str()) {}
};
}

// everntually remove EXTERNAL_VERSION
// should be NDEBUG == EXTERNAL_VERSION??
// #ifndef NDEBUG
#ifdef EXTERNAL_VERSION
#define triggered_at ""
#else
#define triggered_at " (triggered at " <<  __FILE__ << ", " << __LINE__ << ")"
#endif

#define issue_warning( ss )  { std::cerr << ss.str() << "\n";}

#ifndef NDEBUG
#define issue_error( ss )  { std::cerr << ss.str() << "\n"; assert( false );}
#else
#define issue_error( ss )  { throw llvm_bmc::llvm_bmc_exception( ss.str() ); }
#endif


#define llvm_bmc_error( M, S ) { std::stringstream ss;                   \
    ss << "# llvm_bmc " << M << " Error - " << S                         \
       << triggered_at << std::endl;                                  \
    issue_error( ss ); }


#define llvm_bmc_warning( M, S ) { std::stringstream ss;                   \
    ss << "# llvm_bmc " << M << " Warning - " << S                         \
       << std::endl;                                                    \
    issue_warning( ss );  }



#define COMPARE_TAIL( A, B, Tail ) ( A < B || ( A == B && ( Tail ) ) )
#define COMPARE_LAST( A, B )       ( A < B )

#define COMPARE_TUPLE1( A, B, F1 ) COMPARE_LAST( std::get<F1>(A), std::get<F1>(B) )
#define COMPARE_TUPLE2( A, B, F1, F2 ) COMPARE_TAIL( std::get<F1>(A), std::get<F1>(B), \
        COMPARE_TUPLE1( A, B, F2 ) )
#define COMPARE_TUPLE3( A, B, F1, F2, F3 ) COMPARE_TAIL( std::get<F1>(A), std::get<F1>(B), \
        COMPARE_TUPLE2( A, B, F2, F3 ) )
#define COMPARE_TUPLE4( A, B, F1, F2, F3, F4 ) COMPARE_TAIL( std::get<F1>(A), std::get<F1>(B), \
        COMPARE_TUPLE3( A, B, F2, F3, F4 ) )


#define COMPARE_OBJ1( A, B, F ) COMPARE_LAST( A.F, B.F )
#define COMPARE_OBJ2( A, B, F1, F2 ) COMPARE_TAIL( A.F1, B.F1, \
        COMPARE_OBJ1( A, B, F2 ) )
#define COMPARE_OBJ3( A, B, F1, F2, F3 ) COMPARE_TAIL( A.F1, B.F1, \
        COMPARE_OBJ2( A, B, F2, F3 ) )
#define COMPARE_OBJ4( A, B, F1, F2, F3, F4 ) COMPARE_TAIL( A.F1, B.F1, \
        COMPARE_OBJ3( A, B, F2, F3, F4 ) )


template <class Key, class Hash = std::hash<Key>,
          class Pred = std::equal_to<Key>>
std::unordered_set<Key, Hash, Pred>
set_union( const std::unordered_set<Key, Hash, Pred>& set1,
           const std::unordered_set<Key, Hash, Pred>& set2 ) {
  std::unordered_set<Key, Hash, Pred> res = set1;
  res.insert(set2.begin(), set2.end());
  return res;
}

template< class Key, class Hash = std::hash<Key>, class Pred = std::equal_to<Key>>
void set_insert( const std::unordered_set<Key, Hash, Pred>& src,
                 std::unordered_set<Key, Hash, Pred>& dst ) {
  dst.insert( src.begin(), src.end() );
}

template< class Key >
void vec_insert( std::vector<Key>& vector1, const std::vector<Key>& vector2 ) {
  vector1.insert( vector1.end(), vector2.begin(), vector2.end() );
}

#endif // LLVM_BMC_UTILS_H
