#include "include/solver.h"
#include "lib/utils/solver_utils.h"
#include <string.h>
#include<iostream>
#include<algorithm>
#include <boost/algorithm/string.hpp>
#include <boost/filesystem.hpp>
#include <boost/filesystem/fstream.hpp>     

class parser_data {

public:
     solver_context& solver_ctx;
     //bmc_ds* bmc_ds_ptr;
     bool smt_assert = false;

     std::vector <expr> list_readvar;
     std::vector <std::string> names;
     std::vector <expr> declarations;

     std::map <unsigned, expr> array_map;    
   
     typedef std::pair<std::string, std::string> thread_details;
     typedef std::pair<std::string, expr> condition;

     std::vector <thread_details> list_threads;
     std::vector <condition> list_precond;
     std::vector <condition> list_postcond;
     std::vector <std::string> list_envinv;

     std::map <std::pair <std::string, std::string>, std::string> callseq_map; 
     std::map< std::string, unsigned > fn_thread_map;
     unsigned thread_num = 0;

     std::map <std::pair <std::string, uint16_t>, uint16_t> thread_exec_map;

public:
     
     parser_data(solver_context&);
    ~parser_data();

     bool peek_space( std::istream& in );
     bool peek_alpha_numeric_or_underscore( std::istream& in );
     void consume_spaces( std::istream& in );
     bool read_or_check_open_parentheses( std::istream& in );
     bool check_close_parentheses( std::istream& in );
     bool read_close_parentheses( std::istream& in );
     std::string read_symbol( std::istream& in );
     std::string read_formula( std::istream& in );
     unsigned read_unsigned( std::istream& in );
     unsigned read_float( std::istream& in );
     std::string read_command( std::istream& in );
     void read_variable( std::istream& in );
     void read_thread( std::istream& in );
     void read_invokeparam( std::istream& in ); 
     void read_precond( std::istream& in );
     void read_postcond( std::istream& in );
     void read_envinv( std::istream& in );
     void read_file( std::istream& in );
};


