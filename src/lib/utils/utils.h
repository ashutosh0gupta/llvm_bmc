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
#include <set>
#include <list>
#include <unordered_set>
#include <unordered_map>

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

#define I_AM_HERE std::cerr << "I am here" << triggered_at << std::endl;

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


// template <class Key, class Hash = std::hash<Key>,
//           class Pred = std::equal_to<Key>>
// std::unordered_set<Key, Hash, Pred>
// set_union( const std::unordered_set<Key, Hash, Pred>& set1,
//            const std::unordered_set<Key, Hash, Pred>& set2 ) {
//   std::unordered_set<Key, Hash, Pred> res = set1;
//   res.insert(set2.begin(), set2.end());
//   return res;
// }

// template< class Key, class Hash = std::hash<Key>, class Pred = std::equal_to<Key>>
// void set_insert( const std::unordered_set<Key, Hash, Pred>& src,
//                  std::unordered_set<Key, Hash, Pred>& dst ) {
//   dst.insert( src.begin(), src.end() );
// }

// template< class Key >
// void vec_insert( std::vector<Key>& vector1, const std::vector<Key>& vector2 ) {
//   vector1.insert( vector1.end(), vector2.begin(), vector2.end() );
// }


template< class Key >
bool exists( const std::vector<Key>& v, const Key& k ) {
  return std::find( v.begin(), v.end(), k ) != v.end();
  // return set1.find( k ) !=  set1.end();
}


template< class Key >
bool exists( const std::set<Key>& set1, const Key& k ) {
  return set1.find( k ) !=  set1.end();
}

template< class Key,  class Val>
bool exists( const std::map<Key,Val>& map1, const Key& k ) {
  return map1.find( k ) !=  map1.end();
}

template< class Key,  class Val, class Hash >
bool exists( const std::unordered_set<Key,Val,Hash>& s, const Key& k ) {
  return s.find( k ) !=  s.end();
}

template< class Key,  class Val, class Hash, class Eq >
bool exists( const std::unordered_map<Key,Val,Hash,Eq>& map1, const Key& k ) {
  return map1.find( k ) !=  map1.end();
}

template< class Key,class cmp >
bool exists( const std::set<Key,cmp>& set1, const Key& k ) {
  return set1.find( k ) !=  set1.end();
}

template< class Key >
void set_to_vec( const std::set<Key>& set,
                  std::vector<Key>& v ) {
  for( auto& s : set ) {
    v.push_back( s );
  }
}

  // Insert second set inside the first set
template< class Key >
Key pick( std::set<Key>& doner ) {
    Key x = *doner.begin();
    doner.erase( x );
    return x;
}


template< class Key >
void vec_insert( std::vector<Key>& vector1, const std::vector<Key>& vector2 ) {
  vector1.insert( vector1.end(), vector2.begin(), vector2.end() );
}

template< class Key, class cmp >
Key pick( std::set<Key, cmp>& doner ) {
    Key x = *doner.begin();
    doner.erase( x );
    return x;
}

template< class Key, class cmp >
Key pick_and_move( std::set<Key,cmp>& doner,
                   std::set<Key,cmp>& receiver ) {
  Key x = pick( doner );
  receiver.insert( x );
  return x;
}

template< class Key >
Key pick_and_move( std::set<Key>& doner,
                   std::set<Key>& receiver ) {
  Key x = pick( doner );
  receiver.insert( x );
  return x;
}

template< class Key >
void set_insert( std::set<Key>& set1, const std::set<Key>& set2 ) {
  set1.insert( set2.begin(), set2.end() );
}

template< class Key >
void set_intersection( const std::set<Key>& set_src,
                       std::set<Key>& set ) {
  auto j =  set.begin();
  for (; j!=set.end(); ) {
    if ( exists( set_src, *j ) )
      j++;
    else
      j = set.erase(j);
  }
}

template< class Key >
void set_intersection( const std::vector< std::set<Key> >& vec_set,
                       std::set<Key>& set ) {
  set.clear();
  if( vec_set.empty() ) return;
  set = vec_set[0];
  for( unsigned i = 1; i < vec_set.size(); i++ ) {
    set_intersection( vec_set[i], set );
  }
}

template< class Key, class Hash = std::hash<Key>, class Pred = std::equal_to<Key>>
void set_insert( std::unordered_set<Key, Hash, Pred>& set1,
                 const std::unordered_set<Key, Hash, Pred>& set2 ) {
  set1.insert( set2.begin(), set2.end() );
}

template <class Key, class Hash = std::hash<Key>,
          class Pred = std::equal_to<Key>>
std::unordered_set<Key, Hash, Pred>
set_union( const std::unordered_set<Key, Hash, Pred>& set1,
           const std::unordered_set<Key, Hash, Pred>& set2 ) {
  std::unordered_set<Key, Hash, Pred> res = set1;
  res.insert(set2.begin(), set2.end());
  return res;
}

  template < class Key, class Hash = std::hash<Key>,
             class Pred = std::equal_to<Key>>
  void print_set( std::ostream& out,
                  const std::unordered_set<Key, Hash, Pred>& set1 ) {
    for (Key c : set1) {
      out << c << " ";
    }
    out << std::endl;
  }

template < class Key,
           class Hash = std::hash< Key >,
           class Pred = std::equal_to< Key > >
std::unordered_set<Key, Hash, Pred>
set_intersection( const std::unordered_set<Key, Hash, Pred>& set1,
                  const std::unordered_set<Key, Hash, Pred>& set2 ) {
  std::unordered_set<Key, Hash, Pred> result;
  for (auto& e : set1) {
    if (set2.find(e) != set2.end())
      result.insert(e);
  }
  return result;
}

template < class Key,
           class Hash = std::hash< Key >,
           class Pred = std::equal_to< Key > >
bool
intersection_nonempty( const std::unordered_set<Key, Hash, Pred>& set1,
                       const std::unordered_set<Key, Hash, Pred>& set2 ) {
  for (auto& e : set1) {
    if (set2.find(e) != set2.end())
      return true;
  }
  return false;
}

template <class content>
void print_vector(const std::vector<content>& v, std::ostream& out) {
  for(content c: v)
    out << c << std::endl;
}

template <class content>
void remove_duplicates(std::list<content>& v) {
  for(auto it = v.begin(); it!=v.end(); it++) {
    auto j = it;
    for (j++; j!=v.end(); ) {
      if (*j==*it)
        j = v.erase(j);
      else
        j++;
    }
  }
}

template <class content>
void remove_duplicates(std::vector<content>& v) {
  for(auto it = v.begin(); it!=v.end(); it++) {
    auto j = it;
    for (j++; j!=v.end(); ) {
      if (*j==*it)
        j = v.erase(j);
      else
        j++;
    }
  }
}

template <class content>
void print_list(const std::list<content>& v, std::ostream& out) {
  for(content c: v)
    out << c << std::endl;
}

template <class content>
void print_array(content v[], unsigned length, std::ostream& out) {
  out << "[ ";
  for(unsigned i=0; i<length; i++)
    out << v[i] << " ";
  out << "]" << std::endl;
}

template <class T1>
inline std::pair<T1,T1> swap_pair(std::pair<T1,T1> p) {
  T1 h = p.first;
  p.first = p.second;
  p.second = h;
  return p;
}

template <typename Iterator, class T>
bool last_element(Iterator element, const std::list<T>& list) {
  return ++element == list.end();
}

template <typename Iterator, class Key, class Hash = std::hash<Key>, class Pred = std::equal_to<Key>>
bool last_element(Iterator element, const std::unordered_set<Key, Hash, Pred>& list) {
  return ++element == list.end();
}

template <class content>
bool list_contains(const std::list<content>& v, const content& element) {
  for(content c: v)
    if (c==element) return true;
  return false;
}


#endif // LLVM_BMC_UTILS_H
