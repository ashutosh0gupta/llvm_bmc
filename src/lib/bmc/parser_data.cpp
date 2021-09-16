#include "include/parser_data.h"

#include <fstream>
#include <ctype.h>

unsigned new_line_count = 1;

#define AT_L " at line " << std::to_string( new_line_count ) << "!"


parser_data::parser_data(solver_context& sol_ctx_)
  : solver_ctx(sol_ctx_)
{}

parser_data::~parser_data() {}
    
bool parser_data::peek_space( std::istream& in ) {
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


bool parser_data::peek_alpha_numeric_or_underscore( std::istream& in ) {
   char c  = in.peek();
   return std::isalnum( c ) || c == '_' || c == '-' || c == '@';
}


void parser_data::consume_spaces( std::istream& in ) {
   while( peek_space( in ) ) {
     in.get();
   }
}


bool parser_data::read_or_check_open_parentheses( std::istream& in ) {
   consume_spaces( in );
   char c = in.peek();
   if( c == '(' ) {in.get(); return true; }
   return false;
}


bool parser_data::check_close_parentheses( std::istream& in ) {
   consume_spaces( in );
   char c = in.peek();
   if( c == ')' ) return true;
   return false;
}


bool parser_data::read_close_parentheses( std::istream& in ) {
   consume_spaces( in );
   char c = in.get();
   if( c != ')' ) {
     llvm_bmc_error( "Spec_parse",
                      "syntax error, expecting closed parentheses" << AT_L );
   }
   return false;
}


std::string parser_data::read_symbol( std::istream& in ) {
   consume_spaces( in );
   std::string word;
   while( !peek_space(in) && peek_alpha_numeric_or_underscore(in) && 
!in.eof() || (in.peek() == '@') )
     {
       word = word.append( 1, in.get() );
     }
   return word;
}


unsigned parser_data::read_unsigned( std::istream& in ) {
   consume_spaces( in );
   unsigned i;
   in >> i;
   return i;
}


unsigned parser_data::read_float( std::istream& in ) {
   consume_spaces( in );
   float i;
   in >> i;
   return i;
}


std::string parser_data::read_command( std::istream& in ) {
   consume_spaces( in );
   if( read_or_check_open_parentheses( in ) ) {
     return read_symbol( in );
   }else if( in.eof() ) {
     return "eof";
   }else{
     llvm_bmc_error( "Spec_parse", "syntax error" << AT_L );
   }
}



std::string parser_data::read_formula( std::istream& in ) {
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


void parser_data::read_variable( std::istream& in ) {

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
		declarations.push_back(solver_ctx.int_const(var_name.c_str()));
		var_name = var_name + ".";
		names.push_back(var_name);
		declarations.push_back(solver_ctx.int_const(var_name.c_str())); }

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
		sort s = solver_ctx.array_sort( solver_ctx.int_sort(), z_te );
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


void parser_data::read_thread( std::istream& in ) {
   std::string symb1 = read_symbol( in );
   std::string symb2 = read_symbol( in );
   auto pair = std::make_pair( symb1, symb2);
   list_threads.push_back(pair);
   thread_num++;
   auto pair1 = std::make_pair( symb2, thread_num);
   std::cout << "Entry fn is " << symb2 << " thread_num is " << thread_num << "\n";
   //assert(bmc_ds_ptr);
   fn_thread_map.insert( pair1 );
}


//void parser_data::read_precond( std::istream& in ) {
//   std::string symb1 = read_symbol( in );
//   std::string symb2 = read_symbol( in );
//   const char* symb3 = symb2.c_str();
//   expr e = smt2_parse_string( solver_ctx, symb3);
//   auto pair = std::make_pair( symb1, e);
//   list_precond.push_back(pair);
//}


void parser_data::read_postcond( std::istream& in ) {
   std::string symb1 = read_symbol( in );   
   std::string symb2 = read_formula( in );
   
   if (symb2 == "CallSequence") {
	std::string symb3 = read_symbol( in );   	
	std::string symb4 = read_symbol( in );
   	
	auto pair1 = std::make_pair( symb3, symb4 );
	auto pair2 = std::make_pair( pair1, symb1 );        
	callseq_map.insert( pair2 );
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
	//std::cout << "Symb3 is " << symb3 << "\n";
	//smt_assert = true;
	//read_close_parentheses(in);
	//expr e = smt2_parse_string( solver_ctx, symb4);
	
	expr e = parseFormula(solver_ctx, symb4, names, declarations);
	   //auto pair = std::make_pair( symb1, e);
	   //list_postcond.push_back(pair);
   }
}


//void parser_data::read_envinv( std::istream& in ) {
//   std::string symb = read_symbol( in );
//   list_envinv.push_back(symb);
//}


//sugar_t_ptr read_sugar_ref( std::string s_name, sugar_t_map sugar_map ) {
//   if( sugar_map.find(s_name) != sugar_map.end() ) {
//     return sugar_map[s_name];
//     // return sugar_mol::make( sugar_map[s_name] );
//   }else{
//     bio_synth_error( "sugar_parse",
//                      "undeclared sugar " << s_name << " found" << AT_L );
//   }
//}


//sugar_mol_ptr read_mol( std::istream& in, const sugar_t_map& sugar_map ) {
//   std::string s_name;
//   if( read_or_check_open_parentheses(in) ) {
//     std::string s_name = read_symbol( in );
//     auto sugar = read_sugar_ref( s_name, sugar_map );
//     sugar_mol_vec mols;
//     assert( sugar );
//     for( unsigned i = 0; i < sugar->get_children_num(); i++ ) {
//       auto mol_i = read_mol( in, sugar_map );
//       mols.push_back( mol_i );
//     }
//     read_close_parentheses(in);
//     return sugar_mol::make( sugar, mols );
//   }else if( check_close_parentheses(in) ) {
//     bio_synth_error( "sugar_parse", "unexpected close parentheses" <<
//AT_L );
//   }else{
//     std::string s_name = read_symbol( in );
//     if( s_name == "_" ) return nullptr;
//     auto sugar = read_sugar_ref( s_name, sugar_map );
//     return sugar_mol::make( sugar );
//   }
//}


void parser_data::read_file( std::istream& in ) {
    for(;;){
    std::string cmd = read_command( in );
    if( cmd == "eof" ) {
      return;
    }else if( cmd == "declare-var" ) {
      read_variable( in ); 
    }else if( cmd == "declare-thread" ) {
      read_thread( in );
//    }else if( cmd == "pre-condition" ) {
//      read_precond( in );
    }else if( cmd == "post-condition" ) {
      read_postcond( in ); 
//    }else if( cmd == "env-invariant" ) {
//      read_envinv( in );
    }else{
      llvm_bmc_error( "Spec_parse", "unknown command " << cmd << " !");
    }
    read_close_parentheses(in);
    /* if (!smt_assert) read_close_parentheses(in);
    else smt_assert = false; */
  }
 }
