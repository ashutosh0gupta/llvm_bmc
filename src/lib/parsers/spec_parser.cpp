#include "lib/parsers/spec_parser.h"

#include <fstream>
#include <ctype.h>

unsigned new_line_count = 1;

#define AT_L " at line " << std::to_string( new_line_count ) << "!"


spec_parser::spec_parser(solver_context& sol_ctx_)
  : solver_ctx(sol_ctx_)
{}

spec_parser::~spec_parser() {}

bool spec_parser::peek_space( std::istream& in ) {
  char c = in.peek();
  if( c == '\n' || c == '\t' || c == '\r' || c == ' ' ){
    if( c == '\n' ) new_line_count ++;
    return true;
  }
  if( c == ';' ) {
    do{
      in.get();
      c = in.peek();
      if( c == '\n') {
        new_line_count ++;
        return true;
      }
    } while( !in.eof() );
    return true;
  }
  return false;
}


bool spec_parser::peek_alpha_numeric_or_underscore( std::istream& in ) {
  char c  = in.peek();
  return std::isalnum( c ) || c == '_' || c == '-' || c == '@';
}


void spec_parser::consume_spaces( std::istream& in ) {
  while( peek_space( in ) ) {
    in.get();
  }
}


bool spec_parser::read_or_check_open_parentheses( std::istream& in ) {
  consume_spaces( in );
  char c = in.peek();
  if( c == '(' ) {in.get(); return true; }
  return false;
}


bool spec_parser::check_close_parentheses( std::istream& in ) {
  consume_spaces( in );
  char c = in.peek();
  if( c == ')' ) return true;
  return false;
}


bool spec_parser::read_close_parentheses( std::istream& in ) {
  consume_spaces( in );
  char c = in.get();
  if( c != ')' ) {
    llvm_bmc_error( "Spec_parse",
                    "syntax error, expecting closed parentheses" << AT_L );
  }
  return false;
}


std::string spec_parser::read_symbol( std::istream& in ) {
  consume_spaces( in );
  std::string word;
  while( ((!peek_space(in)) && (peek_alpha_numeric_or_underscore(in)) &&
          (!in.eof())) || (in.peek() == '@') )
    {
      word = word.append( 1, in.get() );
    }
  return word;
}


unsigned spec_parser::read_unsigned( std::istream& in ) {
  consume_spaces( in );
  unsigned i;
  in >> i;
  return i;
}


unsigned spec_parser::read_float( std::istream& in ) {
  consume_spaces( in );
  float i;
  in >> i;
  return i;
}


std::string spec_parser::read_command( std::istream& in ) {
  consume_spaces( in );
  if( read_or_check_open_parentheses( in ) ) {
    return read_symbol( in );
  }else if( in.eof() ) {
    return "eof";
  }else{
    llvm_bmc_error( "Spec_parse", "syntax error" << AT_L );
  }
}



std::string spec_parser::read_formula( std::istream& in ) {
  consume_spaces( in );
  if( read_or_check_open_parentheses( in ) ) {
    std::string word;
    while( peek_alpha_numeric_or_underscore(in)  &&
           !in.eof() && in.peek() != ')' )
      {
        word = word.append( 1, in.get() );
      }
    return word; }
}


void spec_parser::read_variable( std::istream& in ) {

  consume_spaces( in );
  std::string var_name = read_symbol( in );
  std::string var_type = read_symbol( in );

  if (in.peek() == ')')
    {
      if (var_type == "float32") {
        expr e = solver_ctx.fpa_const(var_name.c_str(),8,24);
        list_readvar.push_back(e);

        names.push_back(var_name);
        declarations.push_back(solver_ctx.fpa_const(var_name.c_str(),8,24));
        var_name = var_name + ".";
        names.push_back(var_name);
        declarations.push_back(solver_ctx.fpa_const(var_name.c_str(),8,24)); }

      if ((var_type == "i16") || (var_type == "i32")) {
        expr e = solver_ctx.int_const(var_name.c_str());
        list_readvar.push_back(e);
        names.push_back(var_name);
        //declarations.push_back(solver_ctx.int_const(var_name.c_str()));
        declarations.push_back(solver_ctx.bv_const(var_name.c_str(),16));
        var_name = var_name + ".";
        names.push_back(var_name);
        //declarations.push_back(solver_ctx.int_const(var_name.c_str()));
        declarations.push_back(solver_ctx.bv_const(var_name.c_str(),16)); }

      if (var_type == "flag") {
        expr e = solver_ctx.bv_const(var_name.c_str(), 16);
        list_readvar.push_back(e);
        names.push_back(var_name);
        declarations.push_back(solver_ctx.bv_const(var_name.c_str(),16));
        var_name = var_name + ".";
        names.push_back(var_name);
        declarations.push_back(solver_ctx.bv_const(var_name.c_str(),16)); }

    }
  else
    {
      std::string if_array = read_symbol( in );
      if (if_array == "array")
	{
          sort z_te = solver_ctx.int_sort();
          if (var_type == "float32") z_te = solver_ctx.fpa_sort<32>();
          if (var_type == "float64") z_te = solver_ctx.fpa_sort<64>();
          sort s = solver_ctx.array_sort( solver_ctx.bv_sort(64), z_te );
          expr e = solver_ctx.constant( var_name.c_str(), s );

          names.push_back(var_name);
          declarations.push_back(solver_ctx.constant( var_name.c_str(), s ));
          var_name = var_name + ".";
          names.push_back(var_name);
          declarations.push_back(solver_ctx.constant( var_name.c_str(), s ));

          auto array_size  = read_unsigned(in);
          auto pair = std::make_pair( array_size, e );
          array_map.insert( pair );
	}
    }

}


void spec_parser::read_thread( std::istream& in ) {
  std::string symb1 = read_symbol( in );
  std::string symb2 = read_symbol( in );
  //auto pair = std::make_pair( symb1, symb2);
  //list_threads.push_back(pair);
  thread_num++;
  //auto pair1 = std::make_pair( symb2, thread_num);
  //std::cout << "Entry fn is " << symb2 << " thread_num is " << thread_num << "\n";
  //assert(bmc_ds_ptr);
  thread_obj.name = symb1;
  thread_obj.entry_function = symb2;
  thread_obj.thread_num = thread_num;
  //fn_thread_map.insert( pair1 );
}



void spec_parser::read_invokeparam( std::istream& in ) {
  std::string symb1 = read_symbol( in );
  std::string symb2 = read_symbol( in );
  
  if (symb2 == "repeated") {
  	auto periodicity  = read_unsigned(in);
	//auto pair1 = std::make_pair( symb1, periodicity );
        thread_obj.period = periodicity;
	std::string symb3 = read_symbol( in );
	if (symb3 == "priority") {
		auto priority  = read_unsigned(in);
		thread_obj.priority = priority;
		//auto pair2 = std::make_pair( pair1, priority );
		//thread_exec_map.insert( pair2 );
    		//read_close_parentheses(in);
		//std::cout << "Thread name is " << symb1 << " Periodicity is " << periodicity << " Priority is " << priority << "\n";
	}
  }
}


void spec_parser::read_precond( std::istream& in, bmc& b ) {
  std::string symb1 = read_symbol( in );
  std::string symb2 = read_formula( in );

  if (symb2 == "assert") {
    consume_spaces( in );
    std::string symb3;
    while( !in.eof() && ( in.peek() != '\n') && (in.peek() != '\r') )
      {
        symb3 = symb3.append( 1, in.get() );
      }
    in.unget();

    symb3.erase(symb3.end()-1);
    symb3.erase(symb3.end()-1);
    const char* symb4 = symb3.c_str();

    expr e = parseFormula(solver_ctx, symb4, names, declarations);
    //auto pair = std::make_pair( symb1, e);
    //list_precond.push_back(pair);

    if (symb1 == "all") 
	b.sys_spec.pres.push_back(e);
    else
        thread_obj.pres.push_back(e);
  }
}


void spec_parser::read_postcond( std::istream& in, bmc& b ) {
  std::string symb1 = read_symbol( in );
  std::string symb2 = read_formula( in );

  if (symb2 == "CallSequence") {
    std::string symb3 = read_symbol( in );
    std::string symb4 = read_symbol( in );

    auto pair1 = std::make_pair( symb3, symb4 );
    thread_obj.call_seqs.push_back( pair1 );
    read_close_parentheses(in);
  }

  if (symb2 == "assert") {
    consume_spaces( in );
    std::string symb3;
    while( !in.eof() && ( in.peek() != '\n') && (in.peek() != '\r') )
      {
        symb3 = symb3.append( 1, in.get() );
      }
    in.unget();

    //symb3 = "(assert" + symb3;
    symb3.erase(symb3.end()-1);
    symb3.erase(symb3.end()-1);
    const char* symb4 = symb3.c_str();
    //std::cout << "Symb4 is " << symb4 << "\n";
    //smt_assert = true;
    //read_close_parentheses(in);
    //expr e = smt2_parse_string( solver_ctx, symb4);

    expr e = parseFormula(solver_ctx, symb4, names, declarations);
    //auto pair = std::make_pair( symb1, e);
  
    if (symb1 == "all") 
	b.sys_spec.posts.push_back(e);
    else
	thread_obj.posts.push_back(e);
  }
}


//void spec_parser::read_envinv( std::istream& in ) {
//   std::string symb = read_symbol( in );
//   list_envinv.push_back(symb);
//}


void spec_parser::clear_threadobj( std::istream& in, bmc& b ) {
   std::string symb1 = read_symbol( in );
   b.sys_spec.threads.push_back(thread_obj);

   th_ev_obj.name = thread_obj.name;
   th_ev_obj.events = {};
   //th_ev_obj.start_event, final_event;

   b.edata.ev_threads.push_back(th_ev_obj); 
   thread_obj.name = " ";
   thread_obj.entry_function = " ";
   thread_obj.pres.clear();
   thread_obj.posts.clear();
   thread_obj.call_seqs.clear();
   thread_obj.period = 0;
   thread_obj.priority = 0;
}


void spec_parser::read_file( std::istream& in, bmc& b ) {
  for(;;){
    std::string cmd = read_command( in );
    if( cmd == "eof" ) {
      return;
    }else if( cmd == "declare-var" ) {
      read_variable( in );
    }else if( cmd == "declare-thread" ) {
      read_thread( in );
    }else if( cmd == "invoke-parameters" ) {
      read_invokeparam( in );
    }else if( cmd == "pre-condition" ) {
      read_precond( in, b );
    }else if( cmd == "post-condition" ) {
      read_postcond( in, b );
    }else if( cmd == "end-thread" ) {
      clear_threadobj(in, b);
    }else{
      llvm_bmc_error( "Spec_parse", "unknown command " << cmd << " !");
    }
    read_close_parentheses(in);
    /* if (!smt_assert) read_close_parentheses(in);
       else smt_assert = false; */
  }
}

void spec_parser::read_file( const std::string& spec_file, bmc& b ) {
  if ( !boost::filesystem::exists( spec_file ) ) {
    llvm_bmc_error( "SPEC_PARSING", "failed to find file " << spec_file );
  }
  std::ifstream file(spec_file);
  read_file( file, b);
}
