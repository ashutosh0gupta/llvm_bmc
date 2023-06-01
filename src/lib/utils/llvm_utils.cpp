#include <limits>
#include "llvm_utils.h"
#include "lib/utils/graph_utils.h"
// #include "daikon-inst/comments.h" //todo: move to utils
#include <boost/algorithm/string.hpp>
#include <boost/filesystem/fstream.hpp>
#include <boost/filesystem.hpp>
#include <climits>

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wstrict-aliasing"
#pragma GCC diagnostic ignored "-Wcomment"
#pragma GCC diagnostic ignored "-Wdeprecated-enum-enum-conversion"
// pragam'ed to aviod warnings due to llvm included files
#include "llvm/IR/DerivedTypes.h"
// #include "llvm/IR/TypeBuilder.h"
#include "llvm/IR/DIBuilder.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/AsmParser/Parser.h"
#include "llvm/Support/SourceMgr.h"
#include "llvm/Analysis/CFGPrinter.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/IR/Metadata.h"
#include "llvm/MC/TargetRegistry.h"
#include "llvm/Target/TargetMachine.h"
#include "llvm/Support/CodeGen.h"
#include "llvm/Support/Host.h"
#include "llvm/Support/TargetSelect.h"
//clang related code
#include <clang/CodeGen/CodeGenAction.h>
#include <clang/Frontend/CompilerInstance.h>
#include <clang/Frontend/CompilerInvocation.h>
#include <clang/Basic/DiagnosticOptions.h>
#include <clang/Basic/TargetInfo.h>
#pragma GCC diagnostic pop


#define CLANG_VERSION "14"

void dump( const llvm::Value* v) {
  if(v)
    v->print(llvm::outs());
  else
    llvm::outs() << "NULL\n";
}

void dump( const llvm::Type* v) {
  if(v)
    v->print(llvm::outs());
  else
    llvm::outs() << "NULL\n";
}

std::string toString( const llvm::Value* v ) {
  std::string buf;
  llvm::raw_string_ostream os(buf);
  if(v)
    v->print(os);
  else
    os << "NULL\n";
  os.flush();
  return buf;
}

// void dump( const llvm::Module* module) {
//   if(m)
//     m->print(llvm::outs());
//   else
//     llvm::outs() << "NULL\n";
// }


void c2bc( const std::string& fileName, const std::string& outName )
{
  // make a system call
  std::ostringstream cmd;
  cmd << "clang-" << CLANG_VERSION
      << " -emit-llvm -fno-omit-frame-pointer -Xclang -disable-O0-optnone -gdwarf-2 "
      << fileName << " -o " << outName << " -c";
  // std::cout << cmd.str() << "\n";
  if( system( cmd.str().c_str() ) != 0 ) exit(1);
}

// --------------------------------------------------------------------------

void src_loc::print( std::ostream& os ) {
  if( file == "" ) {
    os << "unknown file";
  }else{
    os << file << ":" << line << ":" << col;
    // os << "l" << line << "_c" << col << "_"<< file;
  }
}

void src_loc::print_short( std::ostream& os ) {
  if( file.length() > 15 ) {
    std::string short_file = file.substr( file.length() - 15 );
    os << ".." << short_file << ":" << line << ":" << col;
  }else{
    print(os);
  }
}

std::string src_loc::position_name() {
  if( line == 0 && col == 0 )
    // return pretty_name;
    return file;
    // return NULL;
  else
    return "_l" + std::to_string(line) + "_c" + std::to_string(col);
}

std::string src_loc::gen_name() {
  static std::map< std::pair<unsigned, unsigned>, unsigned > seen_before;
  auto l_name = position_name();
  if( line == 0 && col == 0 && l_name != "" ) {
    return l_name;
  }else{
    auto line_col = std::make_pair(line, col);
    if( exists( seen_before, line_col ) ) {
      return l_name + "_u" + std::to_string( seen_before[line_col]++ );
    }else{
      seen_before[line_col] = 0;
    }
    return l_name;
  }
}
// --------------------------------------------------------------------------

// best guess of location
// class estimate_loc_pass : public llvm::BasicBlockPass {
class estimate_loc_pass : public llvm::FunctionPass {

  src_loc ref;
  src_loc ref_end;
  src_loc low_est;
  src_loc up_est;
  llvm::Instruction* I_low = NULL;
  llvm::Instruction* I_up = NULL;
public:
  static char ID;

  llvm::Instruction* get_I_low() { return I_low; }
  llvm::Instruction* get_I_up() { return I_up; }

  src_loc get_low_estimate() {
    return low_est;
  }

  src_loc get_up_estimate() {
    return up_est;
  }

public:
  estimate_loc_pass( src_loc& loc_, src_loc& ref_end_) :
    llvm::FunctionPass(ID), ref(loc_),ref_end(ref_end_),
    low_est( 0,0, loc_.file),
    up_est( UINT_MAX, UINT_MAX, loc_.file) {
  };
  ~estimate_loc_pass() {};

  // virtual bool runOnBasicBlock( llvm::BasicBlock &bb ) {
  virtual bool runOnFunction( llvm::Function &f ) {
    for( llvm::BasicBlock& bb : f.getBasicBlockList() ) {
    for( llvm::Instruction& I : bb.getInstList() ) {
      const llvm::DebugLoc d = I.getDebugLoc();
      if( d ) {
        unsigned l = d.getLine();
        unsigned c  = d.getCol();
        auto f =llvm::cast<llvm::DIScope>(d.getScope())->getFilename().str();

        src_loc curr(l,c,f);
        if( f != curr.file ) continue;
        if( COMPARE_OBJ2(curr, low_est, line, col) ||
            COMPARE_OBJ2(up_est, curr, line, col) )
          continue;
        if( ref_end == curr ||
            COMPARE_OBJ2(ref_end, curr, line, col)  ) {
          up_est = curr;
          I_up = &I;
        }
        if( ref == curr ||
            COMPARE_OBJ2(curr, ref, line, col)  ) {
          low_est = curr;
          I_low = &I;
        }


        // {
        //   std::cerr << "\n";
        //   dump_triple( low_est );
        //   dump_triple( ref );
        //   dump_triple( up_est );
        //   dump_triple( curr );
        //   std::cerr << "\n";
        // }

        // auto curr = std::make_tuple(l,c,f);
        // if( f != std::get<2>(curr) ) continue;
        // if( COMPARE_TUPLE2(curr, low_est, 0, 1) ||
        //     COMPARE_TUPLE2(up_est, curr, 0, 1) )
        //   continue;
        // if( ref_end == curr ||
        //     COMPARE_TUPLE2(ref_end, curr, 0, 1)  ) {
        //   up_est = curr;
        //   I_up = &I;
        // }
        // if( ref == curr ||
        //     COMPARE_TUPLE2(curr, ref, 0, 1)  ) {
        //   low_est = curr;
        //   I_low = &I;
        // }
      }
    }}

    return false;
  }
  
  virtual void getAnalysisUsage(llvm::AnalysisUsage &au) const {
      au.setPreservesAll();
  }
  virtual llvm::StringRef getPassName() const {
    return "estimate location pass: finds estimate of a source location!!";
  }
};

char estimate_loc_pass::ID = 0;


llvm::Instruction*
estimate_comment_location( std::unique_ptr<llvm::Module>& module,
                        src_loc start, src_loc end) {
  llvm::legacy::PassManager passMan;
  auto estimate_pass = new estimate_loc_pass( start, end );
  passMan.add( estimate_pass );
  passMan.run( *module.get() );
  // {
  //   estimate_pass->get_I_low()->dump();
  //   estimate_pass->get_I_up()->dump();
  //   dump_triple( estimate_pass->get_low_estimate() );
  //   dump_triple( estimate_pass->get_up_estimate() );
  // }
  return estimate_pass->get_I_up();
  // return estimate_pass->get_low_estimate();
}

void
estimate_comment_location(std::unique_ptr<llvm::Module>& module,
                          comments& cmts,
                          std::map< const bb*, comments>&
          // std::pair< std::vector<comment>, std::vector<comment> > >&
          // std::pair< std::vector<std::string>, std::vector<std::string> > >&
                          bb_comment_map ) {
  // collect all the comments that are written at the same program point
  // std::map< llvm::Instruction*, std::vector<std::string> > comment_map;
  std::map< llvm::Instruction*, std::vector<comment> > comment_map;
  std::vector< std::vector< llvm::Instruction* > > Is;
  for( auto& comment : cmts.start_comments ) {
    auto start = comment.start;
    auto end = comment.end;
    llvm::Instruction* I =
      estimate_comment_location( module, start, end );
    if( comment_map.find(I) != comment_map.end() ) {
      auto& c_vec = comment_map.at(I);
      c_vec.push_back(comment);
    }else{
      comment_map[I].push_back(comment);
      // maintain ordered instructions in a same block
      bool done = false;
      for( auto& B_Is : Is ) {
        if( B_Is[0]->getParent() == I->getParent() ) {
          unsigned i = 0;
          for( auto& Io : B_Is[0]->getParent()->getInstList() ) {
            if( i == B_Is.size() || &Io == I ) break;
            if( &Io == B_Is[i] ) i++;
          }
          B_Is.insert( B_Is.begin() + i, I);
          done = true;
        }
      }
      if( !done ) Is.push_back({I});
    }
  }

  for( auto& B_Is : Is ) {
    //intially all instructions in B_Is have same block
    for( llvm::Instruction* I : B_Is ) {
      llvm::BasicBlock* bb = I->getParent();
      auto& pair = bb_comment_map[bb];
      llvm::Instruction* first = &(*(bb->getInstList().begin()));
      if( bb->getTerminator() == I ) {
        pair.end_comments = comment_map[I];
      }else if( first == I ) {
        pair.start_comments = comment_map[I];
      }else{
        pair.end_comments = comment_map[I];
        bb->splitBasicBlock(I);
      }
    }
  }
}


void comment::add_comments( const std::vector<std::string>& cmts ) {
  vec_insert( texts, cmts );
}

//
// clange source to llvm soruce location
// warning: the code is without several guards (check CGDebugInfo.cpp in clang)
src_loc
getLocFromClangSource( const clang::SourceLocation& loc,
                       const clang::SourceManager& sm) {
  unsigned line = sm.getPresumedLoc(loc).getLine();
  unsigned col = sm.getPresumedLoc(loc).getColumn();
  std::string file = sm.getFilename(loc).str();
  return src_loc(line,col,file);
}

//this function is a copy from CompilerInstance::ExecuteActuib
// bool ExecuteAction( clang::CompilerInstance& CI,
//                     clang::FrontendAction &Act,
//                     std::vector< comment >& comments_found) {

//   // FIXME: Take this as an argument, once all the APIs we used have moved to
//   // taking it as an input instead of hard-coding llvm::errs.
//   llvm::raw_ostream &OS = llvm::errs();

//   // Create the target instance.
//   CI.setTarget(clang::TargetInfo::CreateTargetInfo(CI.getDiagnostics(),
//                                             CI.getInvocation().TargetOpts));
//   if (!CI.hasTarget())
//     return false;
//   CI.getTarget().adjust(CI.getLangOpts());
//   CI.getTarget().adjustTargetOptions(CI.getCodeGenOpts(), CI.getTargetOpts());

//   for (const clang::FrontendInputFile &FIF : CI.getFrontendOpts().Inputs) {
//     // Reset the ID tables if we are reusing the SourceManager and parsing
//     // regular files.
//     if (CI.hasSourceManager() && !Act.isModelParsingAction())
//       CI.getSourceManager().clearIDTables();

//     if (Act.BeginSourceFile( CI, FIF)) {
//       Act.Execute();
//       clang::ASTContext& ast_ctx = CI.getASTContext();
//       clang::SourceManager& sm = CI.getSourceManager();
//       auto FID = sm.getMainFileID();
//       clang::RawCommentList& comment_list = ast_ctx.getRawCommentList();
//       const std::map< unsigned, clang::RawComment * > * cmts = comment_list.getCommentsInFile(FID);
//       if( cmts ) {
//       // for( clang::RawComment* cmnt : comment_list.getComments() ) {
//         for( auto& pos_cmt_pair : *cmts ) {
//           clang::RawComment* cmnt = pos_cmt_pair.second;
//           // OS << comment->getRawText( sm ) << "\n";
//           //todo: check prefix of the comment
//           std::string multi_cmt = cmnt->getRawText( sm );

//           std::vector<std::string> cmts;
//           boost::split(cmts, multi_cmt, [](char c){return c == '\n';});
//           for( auto cmt : cmts ) {
//             comment c;
//             boost::algorithm::trim(cmt);
//             if(COMMENT_PREFIX == cmt.substr(0, COMMENT_PREFIX_LEN) ) {
//               auto txt =
//                 cmt.substr(COMMENT_PREFIX_LEN, cmt.size()-COMMENT_PREFIX_LEN );
//               c.texts.push_back( txt );
//               c.start = getLocFromClangSource(cmnt->getSourceRange().getBegin(), sm);
//               c.end = getLocFromClangSource( cmnt->getSourceRange().getEnd(), sm);
//               comments_found.push_back(c);
//             }
//           }
//         }
//       }
//       Act.EndSourceFile();
//     }
//   }

//   // Notify the diagnostic client that all files were processed.
//   CI.getDiagnostics().getClient()->finish();

//   if ( CI.getDiagnosticOpts().ShowCarets) {
//     // We can have multiple diagnostics sharing one diagnostic client.
//     // Get the total number of warnings/errors from the client.
//     unsigned NumWarnings = CI.getDiagnostics().getClient()->getNumWarnings();
//     unsigned NumErrors = CI.getDiagnostics().getClient()->getNumErrors();

//     if (NumWarnings)
//       OS << NumWarnings << " warning" << (NumWarnings == 1 ? "" : "s");
//     if (NumWarnings && NumErrors)
//       OS << " and ";
//     if (NumErrors)
//       OS << NumErrors << " error" << (NumErrors == 1 ? "" : "s");
//   }

//   return !CI.getDiagnostics().getClient()->getNumErrors();
// }

// #define CLANG_INCLUDE "/usr/lib/llvm-"##CLANG_VERSION##"/lib/clang/"##CLANG_VERSION##".0.0/include/"

//Direct translation via API clang
std::unique_ptr<llvm::Module> c2ir( options& o, comments& cmts ) {
  const std::string filename = o.get_input_file();

  if ( !boost::filesystem::exists( filename ) ) {
    llvm_bmc_error( "CLANG_PARSGING", "failed to find file " << filename );
    return nullptr;
  }
  llvm::LLVMContext& llvm_ctx = o.get_llvm_context();

  std::vector<std::string> include_dirs;

  //standard include directories
  include_dirs.push_back("/usr/local/gcc-13.1.0/lib/gcc/x86_64-linux-gnu/13.1.0/include");
  include_dirs.push_back("/usr/local/include");
  include_dirs.push_back("/usr/local/gcc-13.1.0/include");
  include_dirs.push_back("/usr/local/gcc-13.1.0/lib/gcc/x86_64-linux-gnu/13.1.0/include-fixed/x86_64-linux-gnu");
  include_dirs.push_back("/usr/local/gcc-13.1.0/lib/gcc/x86_64-linux-gnu/13.1.0/include-fixed");
  include_dirs.push_back("/usr/include/x86_64-linux-gnu");
  include_dirs.push_back("/usr/include");
  // include_dirs.push_back( "/usr/include/");               // for features.h, locale.h, pthread.h
  // include_dirs.push_back( "/usr/include/linux");          // for stddef.h
  // include_dirs.push_back( "/usr/include/c++/11/");         // for iostream
  // include_dirs.push_back( "/usr/include/x86_64-linux-gnu/");      // for wchar.h
  // include_dirs.push_back( "/usr/include/x86_64-linux-gnu/c++/11/");    // bits/c++config.h
  // include_dirs.push_back( "/usr/include/c++/11/tr1");      // for stdarg.h, wchar.h
  // include_dirs.push_back( "/usr/lib/gcc/x86_64-linux-gnu/11/include/");   // for stdarg.h
  // include_dirs.push_back( "/usr/lib/llvm-" CLANG_VERSION "/lib/clang/" CLANG_VERSION ".0.0/include/");  // for stddef.h

  //added by ashwin ~
  // include_dirs.push_back("/usr/local/gcc-13.1.0/include/c++/13.1.0");
  // include_dirs.push_back("/home/ashwinabraham/gcc-releases-gcc-13.1.0/libstdc++-v3/include/c_compatibility/");
  // include_dirs.push_back("/home/ashwinabraham/gcc-releases-gcc-13.1.0/build/gcc/include/");
  // include_dirs.push_back("/home/ashwinabraham/gcc-releases-gcc-13.1.0/build/stage1-x86_64-linux-gnu/libstdc++-v3/include/x86_64-linux-gnu/");

  // include_dirs.push_back( "/usr/include/c++/11/parallel/");         // for features.h
  // include_dirs.push_back( "/usr/include/x86_64-linux-gnu/bits/");  // for locale.h
  // include_dirs.push_back( "/usr/local/include/");
  
  // additional include directories
  for( auto& dir : o.get_include_dirs() ) {
    include_dirs.push_back( dir );
  }
  // return nullptr;

  // look in clang/include/clang/Driver/CC1Options.td
  // and clang/lib/Frontend/CompilerInvocation.cpp
  // to find right param names
  std::vector<const char *> args;
  args.push_back( "-emit-llvm" );
  args.push_back( "-disable-llvm-passes" );
  args.push_back( "-debug-info-kind=standalone" );
  args.push_back( "-dwarf-version=2" );
  // args.push_back( "-dwarf-column-info" );
  // args.push_back( "-mdisable-fp-elim");
  args.push_back( "-femit-all-decls" );
  args.push_back( "-funroll-loops" );
  args.push_back( "-O1" );
  args.push_back( "-disable-O0-optnone" );
  args.push_back( "-fcxx-exceptions" );
  args.push_back( "-fexceptions");
  args.push_back( "-fgnuc-version=4.2.1" ); // to ensure inclusion of some predefines
  for( std::string& i_dir : include_dirs ) {
    i_dir = "-I" + i_dir;
    args.push_back( i_dir.c_str() );
  }
  args.push_back( filename.c_str() );

  llvm::ArrayRef<const char *> args_arry(args);

  clang::CompilerInstance Clang;
  Clang.createDiagnostics();

  std::shared_ptr<clang::CompilerInvocation> CI(new clang::CompilerInvocation());
  clang::CompilerInvocation::CreateFromArgs( *CI.get(),
                                             args_arry,
                                             // &args[0], &args[0] + args.size(),
                                            Clang.getDiagnostics());
  Clang.setInvocation(CI);
  clang::CodeGenAction *Act = new clang::EmitLLVMOnlyAction(&llvm_ctx);
  try {
    // if (!ExecuteAction(Clang, *Act, cmts.start_comments))
    if (!Clang.ExecuteAction(*Act))
      return nullptr;
  }catch (...) {
    return nullptr;
  }
  std::unique_ptr<llvm::Module> module = Act->takeModule();

  // return std::move(module);
  return module;
  return nullptr;
}


std::unique_ptr<llvm::Module> asm2ir( options& o, comments& cmts ) {
  const std::string filename = o.get_input_file();

  if ( !boost::filesystem::exists( filename ) ) {
    llvm_bmc_error( "ASM_PARSGING", "failed to find file " << filename );
    return nullptr;
  }

  auto& llvm_ctx = o.get_llvm_context();
  llvm::SMDiagnostic err;
  return llvm::parseAssemblyFile( filename, err, llvm_ctx );
}

std::unique_ptr<llvm::Module> c2ir( options& o ) {
  comments comments_found;
  return move( c2ir( o, comments_found ) );
}

void ir2mf( std::unique_ptr<llvm::Module>& module ) {
  // ???
}

void generateAssemblyARM( std::unique_ptr<llvm::Module>& module ) {

  llvm::InitializeAllTargets();
  llvm::InitializeAllTargetMCs();
  llvm::InitializeAllAsmParsers();
  llvm::InitializeAllAsmPrinters();

  // Get the target machine for the ARM64 architecture.
  llvm::Triple triple("aarch64");
  std::string error;
  const llvm::Target* target = llvm::TargetRegistry::lookupTarget(triple.str(), error);
  if( !target ) {
      llvm::outs() << "Error looking up target: " << error << "\n";
      return;
  }

  // Set target-specific options.
  llvm::TargetOptions options;
  llvm::Reloc::Model relocModel = llvm::Reloc::Model::PIC_;
  llvm::CodeModel::Model codeModel = llvm::CodeModel::Small;
  llvm::CodeGenOpt::Level optLevel = llvm::CodeGenOpt::Aggressive;

  // Create a target machine.
  llvm::TargetMachine* targetMachine =
    target->createTargetMachine( triple.str(), "", "", options, relocModel,
                                 codeModel, optLevel );

  // Set up the output stream.
  std::string assembly;
  llvm::raw_string_ostream output(assembly);

  // Generate assembly code.
  llvm::legacy::PassManager passManager;
  targetMachine->addPassesToEmitFile( passManager, llvm::outs(),
                                      nullptr, llvm::CGFT_AssemblyFile );
  passManager.run( *module.get() );
  output.flush();

  // Store the assembly language in the module.
 //  module.setDataLayout(targetMachine->createDataLayout());
 //  module.setTargetTriple(triple.str());
 //  module.setSourceFileName("input.cpp");
 //  module.setModuleInlineAsm(assembly);
 // llvm::outs() << assembly;
}


void setLLVMConfigViaCommandLineOptions( std::string strs ) {
  std::string n = "test";
  const char* array[2];
  array[0] = n.c_str();
  array[1] = strs.c_str();
  llvm::cl::ParseCommandLineOptions( 2, array );
}

// void printSegmentInfo(segment& s) {
//   std::cout << "\nPrinting segment info for segment " << &s;
//   std::cout << "\nPrinting entry blocks\n";
//   printBlockInfo(s.entryCutPoints);
//   std::cout << "\nPrinting exit blocks\n";
//   printBlockInfo(s.exitCutPoints);
//   std::cout << "\nPrinting body blocks\n";
//   printBlockInfo(s.bodyBlocks);
// }


void dump_dot_module( boost::filesystem::path& dump_path,
                      std::unique_ptr<llvm::Module>& module ) {
  std::cerr << "dumping llvm program files in folder:" << dump_path << "\n";
  auto c_path = boost::filesystem::current_path();
  current_path( dump_path );

  // llvm::legacy::PassManager passMan;
  // passMan.add( llvm::createCFGPrinterLegacyPassPass() );
  // passMan.run( *module.get() );
  
  llvm::FunctionPassManager FPM;
  llvm::FunctionAnalysisManager FAM;
  llvm::PassBuilder PB;
  PB.registerFunctionAnalyses(FAM);
  FPM.addPass( llvm::CFGPrinterPass() );
  for(llvm::Function& F : *module ){
    if( !F.empty() )
      FPM.run(F, FAM);
  }
  
  current_path( c_path );
}

void printBlockInfo(std::vector<llvm::BasicBlock*>& blockList) {
  for(const llvm::BasicBlock* b : blockList) {
    b->printAsOperand(llvm::errs(), false);
    std::cout << "\n";
  }
}


std::string getVarName(const llvm::DbgValueInst* dVal ) {
  // auto var = dVal->getValue();
  auto md = dVal->getVariable();
  llvm::DIVariable* diMd = llvm::dyn_cast<llvm::DIVariable>(md);
  return (std::string)( diMd->getName() );
}

std::string getVarName(const llvm::DbgDeclareInst* dDecl ) {
  // auto var = dDecl->getAddress();
  auto md = dDecl->getVariable();
  llvm::DIVariable* diMd = llvm::dyn_cast<llvm::DIVariable>(md);
  auto str = (std::string)( diMd->getName() );
  return str;
}




bool isInHeader(llvm::Instruction *I, llvm::Loop *L) {
//  std::cout << "In isInHeader\n";
  auto h = L->getHeader();
  auto b = I->getParent();
  if(h==b) {
//    std::cout << "In Header\n";
    return true;
  } else {
//    std::cout << "Not in Header\n";
    return false;
  }
}

bool isOutOfLoop(llvm::Instruction *I, llvm::Loop *L) {
//  std::cout << "In isOutOfLoop\n";
  if(L==NULL) {
    return true;
  }
  auto bb = I->getParent();
  for( auto b: L->getBlocks() ) {
    if(b == bb) {
//      std::cout << "Is in the loop\n";
      return false;
    }
  }
//  std::cout << "Is out of the loop\n";
  return true;
}

bool isMyLatch(llvm::BasicBlock *b, llvm::Loop *L) {
//  std::cout << "In isInLatch\n";
  if(L==NULL) {
    return false;
  }
  auto h = L->getLoopLatch();
  return h == b;
}

bool isInLatch(llvm::Instruction *I, llvm::Loop *L) {
  if(L==NULL) {
    return false;
  }
  auto b = I->getParent();
  // return isMyLatch( b, L ); //todo:
  auto h = L->getLoopLatch();
  if(h==b) {
    return true;
  } else {
    return false;
  }
}


// Check whether the loop can be analyzed by us.
bool isSupported(llvm::Loop *L) {
  // Make sure the loop is in simplified form
  if (!L->isLoopSimplifyForm())
    return false;

  // Only support loops that contain a single exit
  if (!L->getExitingBlock() || !L->getUniqueExitBlock())
    return false;

  return true;
}

// Check if the given basic block is in sub loop of the current loop
bool isInSubLoop(llvm::BasicBlock *BB, llvm::Loop *CurLoop, llvm::LoopInfo *LI) {
  if(!CurLoop->contains(BB)) {
    std::cout << "Check is valid only if the basic block is in the current loop or its sub loop";
  }
  return LI->getLoopFor(BB) != CurLoop;
}

// Return the first Basic Block in the Body of the Current Loop
llvm::BasicBlock* getFirstBodyOfLoop(llvm::Loop *CurLoop){
  llvm::BasicBlock* head = CurLoop->getHeader();
  const auto *TInst = head->getTerminator();
  //  unsigned nbSucc = TInst->getNumSuccessors();
  bool found = false;
  unsigned i = 0;
  llvm::BasicBlock *next = TInst->getSuccessor(i);
  while(!found) {
    if(next!=CurLoop->getExitBlock())
      found=true;
    else{
      i++;
      next = TInst->getSuccessor(i);
    }
  }
  std::cout << "First body block in the current loop is :" << next->getName().str() << "\n";
  return next;
}

std::string getFuncNameForDaikon(llvm::Loop *L) {
  std::string fName = "__LLVM_BMC_Loop_";
  auto loc = L->getStartLoc();
  fName = fName + std::to_string(loc->getLine());
  return fName;
}

llvm::Function *printf_prototype( llvm::Module *mod,
                                  llvm::LLVMContext& glbContext ) {

  auto ty_char = llvm::IntegerType::get(glbContext, sizeof(char) * CHAR_BIT);
  llvm::Type *param_types[] = { llvm::PointerType::getUnqual(ty_char) };
  auto ret_type = llvm::IntegerType::get(glbContext, sizeof(int) * CHAR_BIT);
  auto printf_type = llvm::FunctionType::get(ret_type , param_types, true );

  // llvm::FunctionType *printf_type =
  //     llvm::TypeBuilder<int(char *, ...), false>::get(glbContext);

  auto attr_list =  llvm::AttributeList().addAttributeAtIndex(mod->getContext(), 1U, llvm::Attribute::NoAlias);
  auto a = mod->getOrInsertFunction("printf", printf_type, attr_list );
  llvm::Function *func = llvm::cast<llvm::Function>(a.getCallee());

  return func;
}

llvm::Function *assume_prototype(llvm::Module *mod, llvm::LLVMContext& glbContext) {

  auto ty_int = llvm::IntegerType::get(glbContext, sizeof(int) * CHAR_BIT);
  llvm::Type *param_types[] = { ty_int };
  auto ret_type = llvm::Type::getVoidTy(glbContext);
  auto assume_type = llvm::FunctionType::get(ret_type , param_types, false );

  // llvm::FunctionType *assume_type =
  //     llvm::TypeBuilder<void(int), false>::get(glbContext);

  auto attr_list = llvm::AttributeList().addAttributeAtIndex(mod->getContext(), 1U, llvm::Attribute::NoAlias);

  auto callee = mod->getOrInsertFunction("__llbmc_assume", assume_type, attr_list );
    llvm::Function *func = llvm::cast<llvm::Function>(callee.getCallee());

  return func;
}

llvm::Function *assert_prototype(llvm::Module *mod, llvm::LLVMContext& glbContext) {

  auto ty_int = llvm::IntegerType::get(glbContext, sizeof(int) * CHAR_BIT);
  llvm::Type *param_types[] = { ty_int };
  auto ret_type = llvm::Type::getVoidTy(glbContext);
  auto assert_type = llvm::FunctionType::get(ret_type , param_types, false );

  // llvm::FunctionType *assert_type =
  //     llvm::TypeBuilder<void(int), false>::get(glbContext);

  auto attr_list = llvm::AttributeList().addAttributeAtIndex(mod->getContext(), 1U, llvm::Attribute::NoAlias);

  auto callee = mod->getOrInsertFunction("__llbmc_assert", assert_type, attr_list);
  llvm::Function *func = llvm::cast<llvm::Function>(callee.getCallee());

  return func;
}

llvm::Constant* geti8StrVal(llvm::Module& M, char const* str, llvm::Twine const& name, llvm::LLVMContext& ctx) {
  //  llvm::LLVMContext& ctx = llvm::getGlobalContext();
  llvm::Constant* strConstant = llvm::ConstantDataArray::getString(ctx, str);
  llvm::GlobalVariable* GVStr =
      new llvm::GlobalVariable(M, strConstant->getType(), true,
                         llvm::GlobalValue::InternalLinkage, strConstant, name);
  llvm::Constant* zero = llvm::Constant::getNullValue(llvm::IntegerType::getInt32Ty(ctx));
  llvm::Constant* indices[] = {zero, zero};
  llvm::Constant* strVal = llvm::ConstantExpr::getGetElementPtr(strConstant->getType(), GVStr, indices, true);
  return strVal;
}

void assertSingleNesting(llvm::Loop *L) {
  if(!L->getSubLoops().empty()) {
    L = *L->begin();
    auto it = L->begin();
    it++;
    assert(it == L->end());
    assert(L->getSubLoops().empty());
  }
}

void assertNonNesting(llvm::Loop *L) {
  assert(L->getSubLoops().empty());
}

bool isIncrOp(llvm::Value *V) {
  bool isAdd=true;
  if( llvm::Instruction *I = llvm::dyn_cast<llvm::Instruction>(V) ) {
    if( auto bop = llvm::dyn_cast<llvm::BinaryOperator>(I) ) {
      auto op0 = bop->getOperand(0);
      auto op1 = bop->getOperand(1);
      unsigned op = bop->getOpcode();
      switch( op ) {
        case llvm::Instruction::Add :
          isAdd=true;
          break;
        case llvm::Instruction::Sub :
          isAdd=false;
          break;
        default:
          std::cout << "\n\nInvalid operation. Must be + or -\n\n";
          exit(1);
      }
      if( llvm::ConstantInt *C = llvm::dyn_cast<llvm::ConstantInt>(op0) ) {
        if(isAdd && C->isNegative()) {
          return false;
        } else if(!isAdd && C->isNegative()) {
          return true;
        }
      } else if( llvm::ConstantInt *C = llvm::dyn_cast<llvm::ConstantInt>(op1) ) {
        if(isAdd && C->isNegative()) {
          return false;
        } else if(!isAdd && C->isNegative()) {
          return true;
        }
      }
    }
  }
  return true;
}

llvm::Loop* getNextLoop(std::list<llvm::Loop*> lList, llvm::Loop* L) {
  bool flag = false;
  for(llvm::Loop* lo : lList) {
    if(flag) {
      return lo;
    }
    if(lo == L) {
      flag = true;
    }
  }
  return NULL;
}

llvm::Value* getArrValueFromZ3Expr(llvm::Value *V, expr e, llvm::IRBuilder<> &irb, llvm::LLVMContext& c, std::map<std::string, llvm::Value*>& exprValMap, std::set<llvm::Value*>& arrSet) {
  llvm::Value *res = getValueFromZ3Expr(e, irb, c, exprValMap, arrSet);
  if(V != NULL ) {
    res = irb.CreateGEP(V->getType(), V, res);
    res = irb.CreateLoad(V->getType(), res); // todo: which getType needs to be passed.
    res = irb.CreateSExt(res, llvm::IntegerType::getInt64Ty(c));
    assert(res);
  }
  return res;
}

llvm::Value* getValueFromZ3Expr(expr e, llvm::IRBuilder<> &irb, llvm::LLVMContext& c, std::map<std::string, llvm::Value*>& exprValMap, std::set<llvm::Value*>& arrSet) {
  llvm::Value *res = NULL;
  if(e.is_numeral()) {
    int64_t num;
    if (Z3_get_numeral_int64(e.ctx(), e, &num)) {
      res = llvm::ConstantInt::get(llvm::IntegerType::getInt64Ty(c), num);
      assert(res);
    }
  } else if (e.is_var()) {
    std::string varName = e.decl().name().str();
    //    std::cout << "\n Getting Val for Expr: " << varName << "\n";
    res = exprValMap.at(varName);
    assert(res);
    res = irb.CreateSExt(res, llvm::IntegerType::getInt64Ty(c));
    assert(res);
  } else if (e.is_app()) {
    //    std::cout << "\n Getting val for subexpr \n";
    res = getValueFromZ3SubExpr(e, irb, c, exprValMap, arrSet);
    assert(res);
  } else if (e.is_quantifier()) {
    llvm_bmc_error("llvm_utils", "encountered a quantifier");
  }
  return res;
}

llvm::Value* getValueFromZ3SubExpr(expr e, llvm::IRBuilder<> &irb, llvm::LLVMContext& c, std::map<std::string, llvm::Value*>& exprValMap, std::set<llvm::Value*>& arrSet) {
  std::list<llvm::Value*> argValList;

  unsigned args = e.num_args();
  for (unsigned i = 0; i<args; i++)
  {
    expr arg = e.arg(i);
    argValList.push_back(getValueFromZ3Expr(arg, irb, c, exprValMap, arrSet));
  }

  Z3_decl_kind dk = e.decl().decl_kind();
  std::list<llvm::Value*>::const_iterator argListIt;
  argListIt = argValList.begin();

  if (dk == Z3_OP_MUL) {
    llvm::Value* res = *argListIt;
    assert(res);
    argListIt++;
    for(;argListIt != argValList.end(); argListIt++)
    {
      assert(*argListIt);
      res = irb.CreateMul(res, *argListIt);
      assert(res);
    }
    return res;
  } else if (dk == Z3_OP_ADD) {
    llvm::Value* res = *argListIt;
    assert(res);
    argListIt++;
    for(;argListIt != argValList.end(); argListIt++)
    {
      assert(*argListIt);
      res = irb.CreateAdd(res, *argListIt);
      assert(res);
    }
    return res;
  } else if (dk == Z3_OP_SUB) {
    llvm::Value* res = *argListIt;
    assert(res);
    argListIt++;
    for(;argListIt != argValList.end(); argListIt++)
    {
      assert(*argListIt);
      res = irb.CreateSub(res, *argListIt);
      assert(res);
    }
    return res;
  } else if (dk == Z3_OP_DIV) {
    llvm::Value* res = *argListIt;
    assert(res);
    argListIt++;
    for(;argListIt != argValList.end(); argListIt++)
    {
      assert(*argListIt);
      res = irb.CreateSDiv(res, *argListIt);
      assert(res);
    }
    return res;
  } else if (dk == Z3_OP_REM) {
    llvm::Value* res = *argListIt;
    assert(res);
    argListIt++;
    for(;argListIt != argValList.end(); argListIt++)
    {
      assert(*argListIt);
      res = irb.CreateSRem(res, *argListIt);
      assert(res);
    }
    return res;
  } else if (dk == Z3_OP_UMINUS) {
    llvm::Value* res = irb.CreateNeg(*argListIt);
    assert(res);
    return res;
  } else if (dk == Z3_OP_SELECT) {
    //    std::cout << "\n Found a select statement with " << args << " args \n";
    llvm::Value* Arr = *argListIt;
    assert(Arr);
    argListIt++;
    llvm::Value* Ind = *argListIt;
    assert(Ind);
    llvm::Value* res = irb.CreateGEP(Arr->getType(), Arr, Ind);
    assert(res);
    res = irb.CreateLoad(res->getType(), res); //todo: may be we need scalare type
    assert(res);
    res = irb.CreateSExt(res, llvm::IntegerType::getInt64Ty(c));
    assert(res);
    return res;
  } else if (dk == Z3_OP_NOT) {
    llvm::Value* res = irb.CreateNot(*argListIt);
    assert(res);
    return res;
  } else if (dk == Z3_OP_AND) {
    llvm::Value* res = *argListIt;
    assert(res);
    argListIt++;
    for(;argListIt != argValList.end(); argListIt++)
    {
      assert(*argListIt);
      res = irb.CreateAnd(res, *argListIt);
      assert(res);
    }
    res = irb.CreateSExt(res, llvm::IntegerType::getInt32Ty(c));
    assert(res);
    return res;
  } else if (dk == Z3_OP_OR) {
    llvm::Value* res = *argListIt;
    assert(res);
    argListIt++;
    for(;argListIt != argValList.end(); argListIt++)
    {
      assert(*argListIt);
      res = irb.CreateOr(res, *argListIt);
      assert(res);
    }
    res = irb.CreateSExt(res, llvm::IntegerType::getInt32Ty(c));
    assert(res);
    return res;
  } else if (dk == Z3_OP_EQ) {
    llvm::Value* res = *argListIt;
    assert(res);
    argListIt++;
    for(;argListIt != argValList.end(); argListIt++)
    {
      assert(*argListIt);
      res = irb.CreateICmpEQ(res, *argListIt);
      assert(res);
    }
    res = irb.CreateSExt(res, llvm::IntegerType::getInt32Ty(c));
    assert(res);
    return res;
  } else if (dk == Z3_OP_GE) {
    llvm::Value* res = *argListIt;
    assert(res);
    argListIt++;
    for(;argListIt != argValList.end(); argListIt++)
    {
      assert(*argListIt);
      res = irb.CreateICmpSGE(res, *argListIt);
      assert(res);
    }
    res = irb.CreateSExt(res, llvm::IntegerType::getInt32Ty(c));
    assert(res);
    return res;
  } else if (dk == Z3_OP_GT) {
    llvm::Value* res = *argListIt;
    assert(res);
    argListIt++;
    for(;argListIt != argValList.end(); argListIt++)
    {
      assert(*argListIt);
      res = irb.CreateICmpSGT(res, *argListIt);
      assert(res);
    }
    res = irb.CreateSExt(res, llvm::IntegerType::getInt32Ty(c));
    assert(res);
    return res;
  } else if (dk == Z3_OP_LE) {
    llvm::Value* res = *argListIt;
    assert(res);
    argListIt++;
    for(;argListIt != argValList.end(); argListIt++)
    {
      assert(*argListIt);
      res = irb.CreateICmpSLE(res, *argListIt);
      assert(res);
    }
    res = irb.CreateSExt(res, llvm::IntegerType::getInt32Ty(c));
    assert(res);
    return res;
  } else if (dk == Z3_OP_LT) {
    llvm::Value* res = *argListIt;
    assert(res);
    argListIt++;
    for(;argListIt != argValList.end(); argListIt++)
    {
      assert(*argListIt);
      res = irb.CreateICmpSLT(res, *argListIt);
      assert(res);
    }
    res = irb.CreateSExt(res, llvm::IntegerType::getInt32Ty(c));
    assert(res);
    return res;
  } else {
    std::string varName = e.decl().name().str();
    llvm::Value* res = exprValMap.at(varName);
    assert(res);
    if(arrSet.count(res) == 0) {
      res = irb.CreateSExt(res, llvm::IntegerType::getInt64Ty(c));
      assert(res);
    }
    return res;
  }
}

void collectArr( llvm::Function &f, std::set<llvm::Value*>& arrSet) {
  arrSet.clear();
  for( auto bbit = f.begin(), end = f.end(); bbit != end; bbit++ ) {
    llvm::BasicBlock* bb = &(*bbit);
    for( llvm::Instruction& Iobj : bb->getInstList() ) {
      llvm::Instruction* I = &(Iobj);
      if( auto alloc = llvm::dyn_cast<llvm::AllocaInst>(I) ) {
        if( alloc->isArrayAllocation() &&
            !alloc->getType()->getPointerElementType()->isIntegerTy() ) {
          llvm_bmc_error( "llvm_utils", "only pointers to intergers is allowed!" );
        }
        arrSet.insert( alloc );
      }
    }
  }
}

bool is_assert_call(const llvm::CallInst* call ) {
  assert( call );
  llvm::Function* fp = call->getCalledFunction();
  if( fp != NULL &&
      (fp->getName() == "_Z6assertb" || fp->getName() == "assert" ) ) {
    return true;
  } else if (fp == NULL) {
    const llvm::Value * val = call->getCalledOperand();
    if( auto CE = llvm::dyn_cast<llvm::ConstantExpr>(val) ) {
      if(CE->isCast()) {
        if(CE->getOperand(0)->getName() == "assert" ||
           CE->getOperand(0)->getName() == "_Z6assertb") {
          return true;
        }
      }
    }
  }
  return false;
}

bool is_assert_loop( llvm::Loop* L ) {
  bool assert_seen=false;
  for( auto bb: L->getBlocks() ) {
    for( auto it = bb->begin(), e = bb->end(); it != e; ++it) {
      llvm::Instruction *I = &(*it);
      if( auto call = llvm::dyn_cast<llvm::CallInst>(I) ) {
        if(llvm::isa<llvm::DbgValueInst>(I) ||llvm::isa<llvm::DbgDeclareInst>(I)){
          // Ignore debug instructions
        }else{
          assert_seen = assert_seen || is_assert_call(call);
        }
      }
    }
  }
  return assert_seen;
}

bool is_pointer( llvm::Value* v ) {
  return v->getType()->isPointerTy();
}

class bb_succ_iter : public llvm::const_succ_iterator {
public:
  bb_succ_iter( llvm::const_succ_iterator begin_,
                llvm::const_succ_iterator end_,
                std::set<const llvm::BasicBlock*>& back_edges ) :
    llvm::const_succ_iterator( begin_ ), end(end_), b_edges( back_edges ) {
    llvm::const_succ_iterator& it = (llvm::const_succ_iterator&)*this;
    while( it != end && exists( b_edges, (const llvm::BasicBlock*)*it) ) ++it;
  };

  bb_succ_iter( llvm::const_succ_iterator begin_,
                llvm::const_succ_iterator end_ ) :
    llvm::const_succ_iterator( begin_ ), end(end_) {};

  bb_succ_iter( llvm::const_succ_iterator end_ ) :
    llvm::const_succ_iterator( end_ ), end( end_ ) {};

  llvm::const_succ_iterator end;
  std::set<const llvm::BasicBlock*> b_edges;
  bb_succ_iter& operator++() {
    llvm::const_succ_iterator& it = (llvm::const_succ_iterator&)*this;
    do{
      ++it;
    }while( it != end && exists( b_edges, (const llvm::BasicBlock*)*it) );
    return *this;
  }
};

void computeTopologicalOrder( llvm::Function &F,
                              std::map<const llvm::BasicBlock*,std::set<const llvm::BasicBlock*>>& bedges,
                              std::vector<const llvm::BasicBlock*>& bs,
                              std::map< const llvm::BasicBlock*, unsigned >& o_map) {

  auto f = [&bedges](const llvm::BasicBlock* b) {
    if( exists( bedges, b ) ) {
      return bb_succ_iter( llvm::succ_begin(b), llvm::succ_end(b),bedges.at(b));
    }else{
      return bb_succ_iter( llvm::succ_begin(b), llvm::succ_end(b));
    }
  };

  auto e = [](const llvm::BasicBlock* b) { return bb_succ_iter( llvm::succ_end(b) ); };

  const llvm::BasicBlock* h = &F.getEntryBlock();
  bs.clear();
  o_map.clear();
  topological_sort<const llvm::BasicBlock*, bb_succ_iter>( h, f, e, bs, o_map );
}


void collect_loop_backedges(llvm::Loop *L,
                        std::map< const bb*, bb_set_t>& loop_ignore_edge,
                        std::map< const bb*, bb_set_t>& rev_loop_ignore_edge) {
  auto h = L->getHeader();
  llvm::SmallVector<llvm::BasicBlock*,10> LoopLatches;
  L->getLoopLatches( LoopLatches );
  for( llvm::BasicBlock* bb : LoopLatches ) {
    loop_ignore_edge[h].insert( bb );
    rev_loop_ignore_edge[bb].insert(h);
  }
}


void collect_loop_backedges(llvm::Pass *p,
                        std::map< const bb*, bb_set_t>& loop_ignore_edge,
                        std::map< const bb*, bb_set_t>& rev_loop_ignore_edge) {

  //todo: llvm::FindFunctionBackedges could have done the job
  auto &LIWP = p->getAnalysis<llvm::LoopInfoWrapperPass>();
  auto LI = &LIWP.getLoopInfo();
  std::vector<llvm::Loop*> loops, stack;
  for(auto I = LI->rbegin(), E = LI->rend(); I != E; ++I) stack.push_back(*I);
  while( !stack.empty() ) {
    llvm::Loop *L = stack.back();
    stack.pop_back();
    loops.push_back( L );
    for(auto I = L->begin(), E = L->end(); I != E; ++I) stack.push_back(*I);
  }
  loop_ignore_edge.clear();
  rev_loop_ignore_edge.clear();
  for( llvm::Loop *L : loops ) {
    collect_loop_backedges( L, loop_ignore_edge, rev_loop_ignore_edge );
    // auto h = L->getHeader();
    // llvm::SmallVector<llvm::BasicBlock*,10> LoopLatches;
    // L->getLoopLatches( LoopLatches );
    // for( llvm::BasicBlock* bb : LoopLatches ) {
    //   loop_ignore_edge[h].insert( bb );
    //   rev_loop_ignore_edge[bb].insert(h);
    // }
  }
}

void find_cutpoints( llvm::Pass* P, llvm::Function &f,
                     std::vector< llvm::BasicBlock* >& cutPoints ) {
  cutPoints.clear();
  cutPoints.push_back(&f.getEntryBlock());
  std::vector<llvm::Loop*> stack;
  auto &LIWP = P->getAnalysis<llvm::LoopInfoWrapperPass>();
  auto LI = &LIWP.getLoopInfo();
  for(auto I = LI->rbegin(), E = LI->rend(); I != E; ++I) stack.push_back(*I);
  while( !stack.empty() ) {
    llvm::Loop *L = stack.back();
    stack.pop_back();
    cutPoints.push_back( L->getHeader() );
    for(auto I = L->begin(), E = L->end(); I != E; ++I) stack.push_back(*I);
  }
}



//todo : check if we need the following code

// void create_segments(llvm::Function &f,
//                      std::vector< llvm::BasicBlock* >& cutPoints,
//                      std::vector< segment >& segVec) {
//   segVec.clear();
//   std::map< llvm::BasicBlock*, bool > bbVisited;
//   std::vector< llvm::BasicBlock* > stack;

//   for (auto fi = f.begin(), fe = f.end(); fi != fe; ++fi)  bbVisited[&(*fi)] = false;

//   for(llvm::BasicBlock* bb : cutPoints) {
//     for (llvm::succ_iterator sit = succ_begin(bb), set = succ_end(bb); sit != set; ++sit) {
//       llvm::BasicBlock* b = *sit;
//       segment s;
//       s.entryCutPoints.push_back(bb);
//       bbVisited[bb] = true;
//       std::map<std::string, llvm::Value*> nameValueMap;
//       buildBlockMap(bb, nameValueMap);
//       s.assuMapCPs[bb] = nameValueMap;
//       if(exists(cutPoints, b)) {
//         if(!exists(s.exitCutPoints, b)) {
//           s.exitCutPoints.push_back(b);
//         }
//         std::map<std::string, llvm::Value*> nameValueMap;
//         buildBlockMap(b, nameValueMap);
//         s.assertMapCPs[b] = nameValueMap;
//       } else if(!bbVisited.at(b)) {
//         stack.push_back(b);
//         while(!stack.empty()) {
//           llvm::BasicBlock* sbb = stack.back();
//           if(bbVisited.at(sbb)) {
//             stack.pop_back();
//           } else {
//             s.bodyBlocks.push_back(sbb);
//             bbVisited[sbb] = true;
//             stack.pop_back();
//             for (llvm::succ_iterator sit = succ_begin(sbb), set = succ_end(sbb); sit != set; ++sit) {
//               llvm::BasicBlock* b = *sit;
//               if(exists(cutPoints, b)) {
//                 if(!exists(s.exitCutPoints, b)) {
//                   s.exitCutPoints.push_back(b);
//                 }
//                 std::map<std::string, llvm::Value*> nameValueMap;
//                 buildBlockMap(b, nameValueMap);
//                 s.assertMapCPs[b] = nameValueMap;
//               } else if(!bbVisited.at(b)) {
//                 stack.push_back(b);
//               }
//             }
//             for (llvm::pred_iterator pit = pred_begin(sbb), pet = pred_end(sbb); pit != pet; ++pit) {
//               llvm::BasicBlock* b = *pit;
//               if(exists(cutPoints, b)) {
//                 if(!exists(s.entryCutPoints, b)) {
//                   s.entryCutPoints.push_back(b);
//                 }
//                 std::map<std::string, llvm::Value*> nameValueMap;
//                 buildBlockMap(b, nameValueMap);
//                 s.assuMapCPs[b] = nameValueMap;
//               } else if(!bbVisited.at(b)) {
//                 stack.push_back(b);
//               }
//             }
//           }
//         }
//         if(!s.bodyBlocks.empty()) {
//           segVec.push_back(s);
//         }
//       }
//     }
//   }
// }

void buildBlockMap(llvm::BasicBlock* bb, std::map<std::string, llvm::Value*>& nameValueMap) {
  for (llvm::Instruction &II : *bb){
    llvm::Instruction* I = &II;
    llvm::Value* var = NULL;
    llvm::MDNode* md = NULL;
    std::string str;
    if( llvm::DbgDeclareInst* dDecl =
        llvm::dyn_cast<llvm::DbgDeclareInst>(I) ) {
      var = dDecl->getAddress();
      md = dDecl->getVariable();
      llvm::DIVariable* diMd = llvm::dyn_cast<llvm::DIVariable>(md);
      str = (std::string)( diMd->getName() );
    } else if( llvm::DbgValueInst* dVal =
               llvm::dyn_cast<llvm::DbgValueInst>(I)) {
      var = dVal->getValue();
      md = dVal->getVariable();
      llvm::DIVariable* diMd = llvm::dyn_cast<llvm::DIVariable>(md);
      str = (std::string)( diMd->getName() );
    }
    if( var ) {
      nameValueMap[str] = var;
    }
  }
}

int readInt( const llvm::ConstantInt* c ) {
  const llvm::APInt& n = c->getUniqueInteger();
  unsigned len = n.getNumWords();
  if( len > 1 ) llvm_bmc_error("llvm_utils", "long integers not supported!!" );
  const uint64_t *v = n.getRawData();
  return *v;
}

float readFlt( const llvm::ConstantFP* c ) {
  const llvm::APFloat& n = c->getValueAPF();
  const float v = n.convertToFloat();
  return v;
}


double readDbl( const llvm::ConstantFP* c ) {
  const llvm::APFloat& n = c->getValueAPF();
  const double v = n.convertToDouble();
  return v;
}


int readReal( const llvm::ConstantFP* c ) {
  const llvm::APFloat& n = c->getValueAPF();
  auto int_v = n.bitcastToAPInt();
  const uint64_t *v = int_v.getRawData();
  return *v;
}

// Remove a loop
bool deleteLoop(llvm::Loop *L, llvm::DominatorTree &DT, llvm::ScalarEvolution &SE,
                llvm::LoopInfo &LI) {

  llvm::SmallPtrSet<llvm::BasicBlock *, 8> blocks;
  blocks.insert(L->block_begin(), L->block_end());

  llvm::BasicBlock *preheader = L->getLoopPreheader();
  if (!preheader)
    return false;

  llvm::SmallVector<llvm::BasicBlock *, 4> exitingBlocks;
  L->getExitingBlocks(exitingBlocks);

  llvm::SmallVector<llvm::BasicBlock *, 4> exitBlocks;
  L->getUniqueExitBlocks(exitBlocks);
  // Single exit block to branch to
  if (exitBlocks.size() != 1)
    return false;

  // Tell ScalarEvolution that the loop is deleted
  SE.forgetLoop(L);

  // Connect the preheader directly to the exit block
  auto *TI = preheader->getTerminator();
  llvm::BasicBlock *exitBlock = exitBlocks[0];
  TI->replaceUsesOfWith(L->getHeader(), exitBlock);

  // Rewrite phis in the exit block to get their inputs from
  // the preheader instead of the exiting block
  llvm::BasicBlock *exitingBlock = exitingBlocks[0];
  llvm::BasicBlock::iterator BI = exitBlock->begin();
  while (llvm::PHINode *P = llvm::dyn_cast<llvm::PHINode>(BI)) {
    int j = P->getBasicBlockIndex(exitingBlock);
    assert(j >= 0 && "Can't find exiting block in exit block's phi node!");
    P->setIncomingBlock(j, preheader);
    for (unsigned i = 1; i < exitingBlocks.size(); ++i)
      P->removeIncomingValue(exitingBlocks[i]);
    ++BI;
  }
  std::cout << "Updated the Phi nodes of the exit block\n";

  // Update the dominator tree
  // Remove  blocks that will be deleted from the reference counting scheme
  llvm::SmallVector<llvm::DomTreeNode*, 8> ChildNodes;
  for (llvm::Loop::block_iterator LBI = L->block_begin(), LE = L->block_end();
       LBI != LE; ++LBI) {
    // Move all of the block's children to be children of the preheader in DT
    // Remove DT entry for the block
    ChildNodes.insert(ChildNodes.begin(), DT[*LBI]->begin(), DT[*LBI]->end());
    for (llvm::DomTreeNode *ChildNode : ChildNodes) {
      DT.changeImmediateDominator(ChildNode, DT[preheader]);
    }
    ChildNodes.clear();
    DT.eraseNode(*LBI);

    // Remove the block from the reference counting
    (*LBI)->dropAllReferences();
  }

  // std::cout << "Erase the blocks from the loop";
  for (llvm::BasicBlock *BB : blocks)
    BB->eraseFromParent();

  // Remove the blocks from loopinfo
  for (llvm::BasicBlock *BB : blocks)
    LI.removeBlock(BB);

  // Update LoopInfo
// #ifndef LLVM_SVN
//   LI.markAsRemoved(L);
// #endif

  return true;
}

std::string demangle( std::string mangled_name ) {
  std::string mainStr("main");
  if(mangled_name == mainStr) return mainStr;
  int status;
  char * res = abi::__cxa_demangle( mangled_name.c_str(), NULL, NULL, &status );
  //assert(status == 0);
  if(res == NULL) return mangled_name; //todo: handle .s naming convention
  std::string demangled_name(res);
  free(res);
  std::size_t ind = demangled_name.find('(');
  assert(ind != std::string::npos);
  std::string demangled_fn_name = demangled_name.substr(0,ind);
  return demangled_fn_name;
}

//todo: streamline getLoc and getLocation
src_loc
getLoc( const llvm::Instruction* I ) {
  if( auto dbg = llvm::dyn_cast<llvm::DbgInfoIntrinsic>(I) ) {
    if( auto dbgvar = llvm::dyn_cast<llvm::DbgVariableIntrinsic>(dbg) ) {
      auto loc = dbgvar->getVariableLocationOp(0);
      if( auto I_val = llvm::dyn_cast<llvm::Instruction>(loc) ) {
        if( I_val ) I = I_val;
      }else if( llvm::dyn_cast<llvm::Constant>(loc) ) {
        // what to do??
      }
    }else{
      // Now what??
    }
  }
  const llvm::DebugLoc d = I->getDebugLoc();
  if( d ) {
    unsigned l = d.getLine();
    unsigned c  = d.getCol();
    auto f =llvm::cast<llvm::DIScope>(d.getScope())->getFilename().str();
    return src_loc(l,c,f);
  }
  return src_loc();
}

// std::string getLocation(const llvm::Instruction* I ) {
//   const llvm::DebugLoc d = I->getDebugLoc();
//   if( d ) {
//     unsigned line = d.getLine();
//     unsigned col  = d.getCol();
//     auto *Scope = llvm::cast<llvm::DIScope>(d.getScope());
//     std::string fname = Scope->getFilename();
//     std::string l_name =  fname + ":" + std::to_string(line) + ":" + std::to_string(col);
//     return l_name;
//   }else{
//     return "";
//   }
// }

// std::string getLocation(const llvm::BasicBlock* b ) {
//   auto I = b->getFirstNonPHIOrDbg();
//   return getLocation(I);
// }


std::string getLocRange(const llvm::BasicBlock* b ) {
  unsigned minLine = std::numeric_limits<unsigned>::max();
  unsigned minCol  = std::numeric_limits<unsigned>::max();
  unsigned maxLine = 0;
  unsigned maxCol  = 0;
  std::string fname = "";
  for( const llvm::Instruction& Iobj : b->getInstList() ) {
    src_loc loc = getLoc( &(Iobj) );
    if( loc.file != "" ) {
      if( fname.empty() )
        fname = loc.file;
      else {
        if( fname != loc.file ) {
          llvm_bmc_error( "llvm_utils","a block is spanning accross files!!");
        }
      }
      if( loc.line < minLine ) {
        minLine = loc.line;
        minCol = loc.col;
      }else if( loc.line == minLine ) {
        if( loc.col < minCol )
          minCol = loc.col;
      }
      if( loc.line > maxLine ) {
        maxLine = loc.line;
        maxCol = loc.col;
      }else if( loc.line == maxLine ) {
        if( loc.col > maxCol )
          maxCol = loc.col;
      }
    }
  }
  std::string l_name =  fname + ":"
    + std::to_string(minLine) + ":"+  std::to_string(minCol) + "-"
    + std::to_string(maxLine) + ":"+  std::to_string(maxCol);

  return l_name;
}

sort llvm_to_sort( solver_context& c, const llvm::Type* t ) {
  if( t->isIntegerTy() ) {
    if( t->isIntegerTy( 16 ) ) return c.int_sort();
    if( t->isIntegerTy( 32 ) ) return c.int_sort();
    if( t->isIntegerTy( 64 ) ) return c.int_sort();
    if( t->isIntegerTy( 8 ) ) return c.int_sort();
  }
  if( t->isArrayTy() ) {
    llvm::Type* te = t->getArrayElementType();
    sort_vector domains(c);
    domains.push_back( c.int_sort() );
    while( te->isArrayTy() ) {
      domains.push_back( c.int_sort() );
      te = te->getArrayElementType();
    }
    sort z_te = llvm_to_sort(c, te);
    // std::cout << "Sort is " << z_te << "\n";
    return c.array_sort( domains, z_te );
  }
  if( t->isFloatingPointTy() ) {
     //if( t->isFloatTy() ) return c.fpa_sort<32>();
     //if( t->isDoubleTy() ) return c.fpa_sort<64>();
     return c.real_sort();
  }
  if(t->isStructTy()){
    // t->print(llvm::outs()); std::cout << "\n";  // << t->getStructName() << "\n";
    return c.bool_sort();
  }
  if(t->isPointerTy()){
    // t->print(llvm::outs()); std::cout << "\n";  // << t->getPointerElementType() << "\n";
    return c.int_sort();
  }
  // t->print(llvm::outs());
  llvm_bmc_error("llvm_utils", "only int and bool sorts are supported");
  return c.int_sort(); // dummy return
}

bool has_name( llvm::StringRef str, std::vector<std::string>& names) {
  for( auto& s : names ) {
    if(str == s) return true;
  }
  return false;
}

bool match_function_names( const llvm::CallInst* call,
                           std::vector<std::string>& names ) {
  assert( call );

  llvm::Function* fp = call->getCalledFunction();
  if( fp != NULL && has_name( fp->getName(), names ) ) {
    return true;
  } else if (fp == NULL) {
    const llvm::Value * val = call->getCalledOperand();
    if( auto CE = llvm::dyn_cast<llvm::ConstantExpr>(val) ) {
      if(CE->isCast() && has_name( CE->getOperand(0)->getName(), names)) {
          return true;
      }
    }
  }
  return false;
}

bool is_assert( const llvm::CallInst* call ) {
  std::vector<std::string> names = { "_Z6assertb", "assert",
                                     "_Z17__VERIFIER_assertb" };
  return match_function_names( call, names );
}

bool is_assert_fail( const llvm::CallInst* call ) {
  std::vector<std::string> names = { "__assert_fail" };
  return match_function_names( call, names );
}

bool is_nondet( const llvm::CallInst* call ) {
  std::vector<std::string> names = { "_Z22__VERIFIER_nondet_charv",
                                     "_Z21__VERIFIER_nondet_intv",};
  return match_function_names( call, names );
}

bool is_assume( const llvm::CallInst* call ) {
  std::vector<std::string> names = { "_Z6assumeb", "assume", "_Z17__VERIFIER_assumeb" };
  return match_function_names( call, names );
}


bool is_thread_create( const llvm::CallInst* call ) {
  std::vector<std::string> names = { "_Z6pthread_createb", "pthread_create" };
  return match_function_names( call, names );
}

bool is_thread_join( const llvm::CallInst* call ) {
  std::vector<std::string> names = { "_Z6pthread_createb", "pthread_join" };
  return match_function_names( call, names );
}

bool is_error(const llvm::CallInst* call) {
  assert( call );
  std::vector<std::string> names = { "__VERIFIER_error_" };
  return match_function_names( call, names );

  // auto name = get_called_name( call );
  // if( name == "__VERIFIER_error_" ) return true;
  // return false;
}

bool ignore_special_functions( const llvm::CallInst* call ) {
  return is_assert( call ) || is_assume( call ) || is_nondet( call )
    || is_error(call);
}

#define DEFAULT_INDEX_SORT 64

sort llvm_to_bv_sort( solver_context& c, const llvm::Type* t ) {
  if( t->isIntegerTy() ) {
    if( t->isIntegerTy( 16 ) ) return c.bv_sort(16);
    if( t->isIntegerTy( 32 ) ) return c.bv_sort(32);
    if( t->isIntegerTy( 64 ) ) return c.bv_sort(64);
    if( t->isIntegerTy( 8 ) ) return c.bv_sort(8);
    if( t->isIntegerTy( 1 ) ) return c.bv_sort(1);
  }else if( t->isFunctionTy() ) {
    llvm_bmc_error("llvm_utils", "function sorts are not supported");
  }else if( t->isStructTy()   ) {
    llvm_bmc_error("llvm_utils", "struct sorts are not supported");
  }else if( t->isPointerTy()  ) {
    llvm_bmc_error("llvm_utils", "pointer sorts are not supported");
  }else if( t->isArrayTy() || t->isVectorTy() ) {
    llvm::Type* te = t->getArrayElementType();
    sort_vector domains(c);
    domains.push_back( c.bv_sort(DEFAULT_INDEX_SORT) );
    while( te->isArrayTy() ) {
      domains.push_back( c.bv_sort(DEFAULT_INDEX_SORT) );
      te = te->getArrayElementType();
    }
    sort z_te = llvm_to_bv_sort(c, te);
    // sort domain = c.bv_sort(DEFAULT_INDEX_SORT);
    // if( z_te.is_array() ) {
    //   auto domains = z_te.array_domain();
    //   auto range = z_te.array_range();
    //   domains.push_back(domain);
    //   return c.array_sort( domains, range );
    // }
    return c.array_sort( domains, z_te );
  }else if( t->isFloatingPointTy() ) {
     if( t->isFloatTy() ) return c.fpa_sort<32>();
     if( t->isDoubleTy() ) return c.fpa_sort<64>();
    //llvm_bmc_error("llvm_utils", "float sorts are not supported");
  }else if( t->isLabelTy() ) {
    llvm_bmc_error("llvm_utils", "label sorts are not supported");
  }else if( t->isMetadataTy() ) {
    llvm_bmc_error("llvm_utils", "metadata sorts are not supported");
  }else if( t->isTokenTy() ) {
    llvm_bmc_error("llvm_utils", "token sorts are not supported");
  }else if( t->isX86_MMXTy() ) {
    llvm_bmc_error("llvm_utils", "X86_MMX sorts are supported");
  }
  llvm_bmc_error("llvm_utils", "unknown sorts seen!!");
  return c.bv_sort(32); // dummy return
}

sort llvm_to_sort( options& o, const llvm::Type* t) {
  if( o.bit_precise ) {
    return llvm_to_bv_sort( o.solver_ctx, t );
  }else{
    return llvm_to_sort( o.solver_ctx, t );
  }
}

std::string read_const_str( options& o, const llvm::Value* op ) {
  expr e = read_const( o, op );
  if( e ) {
    std::stringstream str_strm;
    str_strm << e;
    return str_strm.str();
  }
  return "";
}

expr read_const( options& o, const llvm::Value* op ) {
// expr read_const( const llvm::Value* op, solver_context& ctx ) {
  solver_context& ctx = o.solver_ctx;
  assert( op );
  if( const llvm::ConstantInt* c = llvm::dyn_cast<llvm::ConstantInt>(op) ) {
    int i = readInt( c );
    unsigned bw = c->getBitWidth();
    if( o.bit_precise ){
      return ctx.bv_val( i, bw );
    }else {
      if( bw == 32 || bw == 64 || bw == 8 || bw == 16 ) {
        return ctx.int_val(i);
      }else if(bw == 1 ) {
        assert( i == 0 || i == 1 );
        if( i == 1 )
          return ctx.bool_val(true);
        else
          return ctx.bool_val(false);
      }else{
        // c->dump();
        llvm_bmc_error("llvm_utils", "unrecognized constant!" );
      }
    }
  }else if( llvm::isa<llvm::ConstantPointerNull>(op) ) {
    // llvm_bmc_error("llvm_utils", "Constant pointer are not implemented!!" );
    // }else if( LLCAST( llvm::ConstantPointerNull, c, op) ) {
    return ctx.int_val(-1);
  }else if( llvm::isa<llvm::UndefValue>(op) ) {
    llvm::Type* ty = op->getType();
    if( auto i_ty = llvm::dyn_cast<llvm::IntegerType>(ty) ) {
      int bw = i_ty->getBitWidth();
      if( o.bit_precise ) {
        // todo: add support for signed an unsigned
        return get_fresh_bv(ctx,bw);
      }else{
        if( bw == 32 || bw == 64 || bw == 16 || bw == 8 ) { return get_fresh_int(ctx);
        }else if( bw == 1  ) { return get_fresh_bool(ctx);
        }
      }
    }else if (ty->isFloatingPointTy() ) {
      if( o.bit_precise ) {
        // todo: add support for signed an unsigned
        if (ty->isFloatTy() ) {return get_fresh_float(ctx);
        } else if (ty->isDoubleTy() ) {return get_fresh_double(ctx);
        }
      }else{
        return get_fresh_real(ctx);
      }
    }
    else if(ty->isStructTy()){
      return get_fresh_bool(ctx);
    }
    llvm_bmc_error("llvm_utils", "unsupported type: "<< ty << "!!");
  }//else if( llvm::isa<llvm::ConstantFP>(op) ) {
   //const llvm::APFloat& n = c->getValueAPF();
  if( const llvm::ConstantFP* c = llvm::dyn_cast<llvm::ConstantFP>(op) ) {
     llvm::Type* ty = op->getType();
     if (ty->isFloatTy() ) {
			    if (o.bit_precise) {
 			     float i = readFlt( c );
			     return ctx.fpa_val(i);
			    }
			    else {
			     int i = readReal( c );
			     return ctx.real_val(i);
			    }
     } else  if (ty->isDoubleTy() ) {
			    if (o.bit_precise) {
 			     double i = readDbl( c );
			     return ctx.fpa_val(i);
			    }
			    else {
			     int i = readReal( c );
			     return ctx.real_val(i);
			    }
     }
    // double v = n.convertToDouble();
    //return ctx.real_val(v);
    //llvm_bmc_error("llvm_utils", "Floating point constant not implemented!!" );
  }else if( llvm::isa<llvm::ConstantAggregateZero>(op) ) {
    // return ctx.int_val(0);// todo: match types in z3
  }else if( llvm::isa<llvm::Instruction>(op) ) {

  }else if( llvm::isa<llvm::ConstantExpr>(op) ) {
    llvm_bmc_error("llvm_utils", "case for constant not implemented!!" );
  }else if( llvm::isa<llvm::ConstantArray>(op) ) {
    // const llvm::ArrayType* n = c->getType();
    // unsigned len = n->getNumElements();
    //return ctx.arraysort();
    llvm_bmc_error("llvm_utils", "case for constant not implemented!!" );
  }else if( llvm::isa<llvm::ConstantStruct>(op) ) {
    // const llvm::StructType* n = c->getType();
    llvm_bmc_error("llvm_utils", "case for constant not implemented!!" );
  }else if( llvm::isa<llvm::ConstantVector>(op) ) {
    // const llvm::VectorType* n = c->getType();
    llvm_bmc_error("llvm_utils", "vector constant not implemented!!" );
  }else if( llvm::isa<llvm::Constant>(op) ) {
    // expr e(ctx);
    // return e; // contains no expression;
    llvm_bmc_error("llvm_utils", "non int constants are not implemented!!" );
    std::cerr << "un recognized constant!";
    //     // int i = readInt(c);
    //     // return eHandler->mkIntVal( i );
  }
  expr e(ctx);
  return e; // contains no expression;
}


expr llvm_min_val( solver_context& ctx, const llvm::Value* v) {
  //todo : find max val
  assert(false);
  return ctx.bool_val(true);
}

expr llvm_max_val( solver_context& ctx, const llvm::Value* v) {
  //todo : find min val
  assert(false);
  return ctx.bool_val(true);
}


char set_unroll_counts::ID = 0;

set_unroll_counts::set_unroll_counts( options& o_ )
  : llvm::LoopPass(ID)
  , o(o_)
{}

set_unroll_counts::~set_unroll_counts() {}

bool set_unroll_counts::doInitialization(  llvm::Loop *L,
                                          llvm::LPPassManager &LPM) {
  return false; // did not modify the loop
}


bool set_unroll_counts::runOnLoop( llvm::Loop *L,
                                   llvm::LPPassManager &LPM ) {
  SE = &getAnalysis<llvm::ScalarEvolutionWrapperPass>().getSE();

  // Computing trip count
  unsigned TripCount = 0;
  // unsigned TripMultiple = 1;
  llvm::BasicBlock *ExitingBlock = L->getLoopLatch();
  auto& Ctx = ExitingBlock->getContext();
  
  if (!ExitingBlock || !L->isLoopExiting(ExitingBlock))
    ExitingBlock = L->getExitingBlock();
  if (ExitingBlock) {
    TripCount = SE->getSmallConstantTripCount(L, ExitingBlock);
    // TripMultiple = SE->getSmallConstantTripMultiple(L, ExitingBlock);
  }

  if( TripCount == 0 ) {
    // We donot know the number of iterations according to the static analysis
    if( !L->getLoopID() ) {
      // L->getLoopID()->print( llvm::outs() );

      llvm::SmallVector<llvm::Metadata *, 4> Args;
      Args.push_back(nullptr);
      llvm::Metadata *Vals[]
        = { llvm::MDString::get(Ctx, "llvm.loop.unroll.count"),
            llvm::ConstantAsMetadata::get(llvm::ConstantInt::get(llvm::Type::getInt32Ty(Ctx), o.loop_unroll_count))};
      Args.push_back( llvm::MDNode::get(Ctx, Vals));
      auto *LoopID = llvm::MDNode::getDistinct(Ctx, Args);
      LoopID->replaceOperandWith(0, LoopID);
      L->setLoopID(LoopID);
      return true;
    }
  }
  return false; // did not modify the loop
}

bool set_unroll_counts::doFinalization() {
  return false; // did not modify the loop
}

llvm::StringRef set_unroll_counts::getPassName() const {
  return "set unroll counts";
}

void set_unroll_counts::getAnalysisUsage(llvm::AnalysisUsage &au) const {
  au.setPreservesAll();
  au.addRequired<llvm::LoopInfoWrapperPass>();
  au.addRequired<llvm::ScalarEvolutionWrapperPass>();
}


void forced_inliner_pass( std::unique_ptr<llvm::Module>& module ) {
  for(auto fit = module->begin(), endit = module->end(); fit != endit; ++fit) {
    // todo: remove dependency on demangle from llvm_utils
    std::string fname = demangle(fit->getName().str());
    if( !fit->isDeclaration() ) {
      // function has a body available
      fit->addFnAttr(llvm::Attribute::AlwaysInline);
      //To ensure all functions are inlined even if the personalities do not match
      llvm::Constant *FnPersonality = nullptr;
      fit->setPersonalityFn(FnPersonality);
    }
  }

  // force inline
  llvm::legacy::PassManager inline_passMan;
  inline_passMan.add( llvm::createAlwaysInlinerLegacyPass() );
  inline_passMan.run( *module.get() );
}

void prepare_module(std::unique_ptr<llvm::Module>& module ) {
  llvm::legacy::PassManager passMan;
  passMan.add( llvm::createPromoteMemoryToRegisterPass() );
  passMan.add( llvm::createLoopRotatePass() ); // some params
  passMan.add( llvm::createSCCPPass() );
  passMan.run( *module.get() );
}


const llvm::Value*
identify_array_in_gep(const llvm::GEPOperator* gep ) {
  auto op_gep_ptr = gep->getPointerOperand();
  //  op_gep_ptr->print( llvm::outs() ); std::cout <<"\n";
  if( auto cast = llvm::dyn_cast<const llvm::BitCastInst>(op_gep_ptr) ) {
    op_gep_ptr = cast->getOperand(0);
  }

  // assuming alloc instruction
  if( auto addr = llvm::dyn_cast<const llvm::AllocaInst>(op_gep_ptr) ) {
    return addr;
  }

  // passed pointer in the function
  if(auto addr = llvm::dyn_cast<const llvm::Argument>(op_gep_ptr)) {
    return addr;
  }

  // accessing global variable
  if(auto glb = llvm::dyn_cast<const llvm::GlobalVariable>(op_gep_ptr)) {
    return glb;
  }
 // if(auto sub_gep = llvm::dyn_cast<const llvm::GetElementPtrInst>(op_gep_ptr)) {
 //   return identify_array_in_gep(sub_gep);
 //   // auto sub_op_gep_ptr = sub_gep->getPointerOperand();
 //    // todo: add conditions that all the positions are 0
 //    // gep( gep( glb , 0), 3 ) === *(glb+3) << Good <<<
 //    //
 //    // gep( gep( glb , 1), 3 ) === *(glb+4) << Bad <<<
 //    //
 //    //assert(false); // remove this assert only if the above condition is added;
 //    //if( false ) {
 // }
 if( auto sub_gep = llvm::dyn_cast<llvm::GEPOperator>(op_gep_ptr) ) {
     // if (sub_gep->hasAllZeroIndices()) {
      return identify_array_in_gep(sub_gep);
    // }
  }
  gep->dump();
  llvm_bmc_error("bmc", "unseen GEP pattern detected!");
}

std::pair<const llvm::Value*, uint64_t> identify_lpad_struct(const llvm::Value* op, int index) {
  auto lpi = llvm::dyn_cast<const llvm::LandingPadInst>(op);
  auto predecessor = lpi->getParent()->getSinglePredecessor();
  auto terminator = predecessor->getTerminator();

  if (auto invoke = llvm::dyn_cast<const llvm::InvokeInst>(terminator)) {
    llvm::Function* fp = invoke->getCalledFunction();
    if (fp != nullptr && fp->getName().startswith("__cxa_throw")) {
      llvm::Value* arg;
      if (index == 0) {
        arg = invoke->getArgOperand(index);
      } else {
        arg = invoke->getArgOperand(index);
        //TODO : add code to convert it into int for future purpose
      }
      
      uint64_t size = 0;
      // Check if the argument is an array and determine its size
    if (auto arrayTy = llvm::dyn_cast<llvm::ArrayType>(op->getType())) {
      size = arrayTy->getNumElements();
      }
      return std::make_pair(arg, size);
    }
  }

  llvm_bmc_warning("bmc","failed to recognize lpad structure");
  op->dump();
  return std::make_pair(nullptr, 0);
}


const std::pair<const llvm::Value*, uint64_t> get_array_info( const llvm::Value* op) {

  while( auto cast = llvm::dyn_cast<const llvm::BitCastInst>(op) ) {
    op = cast->getOperand(0);
  }
  if( auto gep = llvm::dyn_cast<llvm::GetElementPtrInst>(op) ) {
    auto op_gep_ptr = gep->getPointerOperand();
    return get_array_info( op_gep_ptr );
  }
  if(auto gep = llvm::dyn_cast<const llvm::GEPOperator>(op)) {
    return get_array_info(identify_array_in_gep( gep ));
  }else if(auto glb = llvm::dyn_cast<const llvm::GlobalVariable>(op)) {
    // std::string name = glb->getName();
    uint64_t size = 1; // default size for non-array types

    llvm::Type* type = glb->getValueType();
    if (llvm::ArrayType* arrayType = llvm::dyn_cast<llvm::ArrayType>(type)) {
      // llvm::Type* elementType = arrayType->getElementType();
      size = arrayType->getNumElements();
    }
    return std::make_pair(glb, size);
  }else if( llvm::dyn_cast<const llvm::AllocaInst>(op) ) {
    // auto alloc =
    // To handle a[0] when a is dynamic sized array
    auto alloca = llvm::dyn_cast<const llvm::AllocaInst>(op);
    uint64_t size = 0;
    if (auto arrayTy = llvm::dyn_cast<llvm::ArrayType>(alloca->getAllocatedType())) {
      size = arrayTy->getNumElements();
    }

    // llvm::errs() << "Alloca var Name = " << alloca->getName() << " Size = " << size << "\n";
    if(auto addr = llvm::dyn_cast<const llvm::Instruction>(op)) {
      // actual allocation in the code
      return std::make_pair(addr, size);
    }
    
    return std::make_pair(op, size);

  }else if( auto addr = llvm::dyn_cast<const llvm::Argument>(op) ) {
    // passed as an argument
    uint64_t size = 0;
    if (auto arrayTy = llvm::dyn_cast<llvm::ArrayType>(op->getType())) {
      size = arrayTy->getNumElements();
    }
    return std::make_pair(addr, size);
  }else if( auto cnst = llvm::dyn_cast<const llvm::ConstantExpr>(op) ) {
    if( auto gep = llvm::dyn_cast<llvm::GEPOperator>(cnst) ) {
      auto const_ptr = gep->getPointerOperand();
      return get_array_info(const_ptr);
    }
    auto cistr = cnst->getAsInstruction();
    return get_array_info(cistr);
    // cistr->dump();
    // llvm_bmc_error("bmc", "non GEP constant expression!");
  }else if( auto call = llvm::dyn_cast<const llvm::CallInst>(op) ) {
    // llvm::errs() << "\n CALL INSTRUCTION \n";
    llvm::Function* fp = call->getCalledFunction();
    if (fp != NULL && fp->getName().startswith("__cxa_allocate")) {
      // call->print(llvm::outs());std::cout << "RECOGNIZED PATTERN\n";
      return std::make_pair(call, 0);
    } else if (fp != NULL && fp->getName().startswith("__cxa_begin_catch")) {
      return std::make_pair(call, 0);
    }
  } else if (auto ev = llvm::dyn_cast<const llvm::ExtractValueInst>(op)) {
    // std::cout << "\nEXtract value instruction found\n";
    // llvm::errs() << *ev << "\n";
    // llvm::errs() << "Type of EVAL is " << *(ev->getType()) << "\n";
    auto evi_op = ev->getAggregateOperand();
    if( llvm::isa<llvm::PointerType>(ev->getType()) ) {

      return identify_lpad_struct(evi_op, 0);
    } else {
      return identify_lpad_struct(evi_op, 1);
      // llvm::errs() << "NOT POINTER TYPE";
      // return evi_op;
    }
    // return ev;
    // return ev->getAggregateOperand();
  // } else if (auto lpi = llvm::dyn_cast<const llvm::LandingPadInst>(op)) {
  //   auto predecessor = lpi->getParent()->getSinglePredecessor();
  //   auto terminator = predecessor->getTerminator();
  //   // llvm::errs() << "\n\nGOT PREDECESSOR " << *predecessor << "===========";
  //   llvm::errs() << "\n\nGOT TERMINATOR " << *terminator << "\n===========";
  //   if (auto invoke = llvm::dyn_cast<const llvm::InvokeInst>(terminator)) {
  //     // llvm::errs() << "\n\nIN IF";
  //     llvm::Function* fp = invoke->getCalledFunction();
  //     llvm::errs() << "\n called function is " << *fp;
  //     if (fp != nullptr && fp->getName().startswith("__cxa_throw")) {
  //       llvm::Value* arg0;
        
  //       arg0 = invoke->getArgOperand(0);
  //       llvm::errs() << "\nDUmping value ";
  //       arg0->dump();
  //       llvm::errs() << "\n";
  //       return arg0;
  //     }
  //   } else {
  //     llvm::errs() << "\n\nIN ELSE";
  //   }
  }
  else{
    // llvm_bmc_error("bmc", "non array global write/read not supported!");
  }
  llvm_bmc_warning("bmc","failed to recognize heap access");
  op->dump();
  return std::make_pair(nullptr, 0);
}
// TODO: the following and the above functions make
//       pointless distinction between array and global
const llvm::Value* identify_global_in_addr( const llvm::Value* op) {
  if( auto cast = llvm::dyn_cast<const llvm::BitCastInst>(op) ) {
    op = cast->getOperand(0);
  }
  if(auto glb = llvm::dyn_cast<const llvm::GlobalVariable>(op)) {
    return glb;
  }
  return get_array_info( op ).first;
}


