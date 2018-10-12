#include "include/bmc_ds.h"
#include "lib/utils/llvm_utils.h"
#include "lib/utils/solver_utils.h"

void spec::print(std::ostream& os) {
  os << e << " % [";
  switch( reason ) {
  case UNKNOWN : os << "unknown "; break;
  case COMMENT : os << "comment at "; break;
  case ASSERT : os << "assert at "; break;
  case OUT_OF_BOUND : os << "array out of bound at "; break;
  case OUT_OF_RANGE : os << "(under/over)flow at "; break;
  default:
    llvm_bmc_error("spec", "unsupported reason found!!");
  }
  loc.print_short( os );
  os << "]\n";
}

void spec::dump() {
  print( std::cout );
}

void bmc_ds::add_latch( unsigned lidx  ) {
  latches.push_back( lidx );
}

void bmc_ds::add_latch( const bb* latch  ) {
  auto l_idx = find_block_idx( latch );
  add_latch( l_idx );
}

void bmc_ds::add_latches( bb_vec_t latches  ) {
  for( const bb* latch : latches )
    add_latch( latch );
}

void bmc_ds::add_exit( unsigned lidx, unsigned succ_num  ) {
  exits.push_back( {lidx, succ_num} );
}

void bmc_ds::add_exit( const bb* exit, unsigned succ_num  ) {
  auto l_idx = find_block_idx( exit );
  add_exit( l_idx, succ_num );
}

void bmc_ds::add_exits( std::vector< std::pair< const bb*, unsigned > > es ) {
  for( auto& exit : es )
    add_exit( exit.first, exit.second );
}

void bmc_ds::get_exit_block_positions( const bb* prev,
                               std::vector<unsigned>& positions ) {
  for( auto& bidx : exits) {
    if( bb_vec[bidx.first] == prev ) positions.push_back( bidx.first );
  }
}


void bmc_ds::import_expr_map( value_expr_map& m_ ) {
  m_.copy_values( m );
}

expr bmc_ds::get_path_bit( unsigned bidx ) {
  return block_to_path_bit.at(bidx);
}

void bmc_ds::set_path_bit( unsigned bidx, expr b ) {
  auto pair = std::make_pair( bidx, b);
  block_to_path_bit.insert( pair );
}

std::vector< expr >& bmc_ds::get_exit_bits( unsigned bidx ) {
  return block_to_exit_bits.at(bidx);
}

expr bmc_ds::get_exit_bit( unsigned bidx, unsigned succ_num ) {
  auto& vec= get_exit_bits( bidx );
  if( vec.size() == 0 && succ_num == 0 ) {
      return solver_ctx.bool_val(true);
    }if( vec.size() == 0 && succ_num > 0 ) {
      // special case of artificial wiring; for aggregation module
      // aggregation module interferes with generation of exit and path bits
      return solver_ctx.bool_val(true);
    }else{
      assert(  succ_num < vec.size() );
      return vec[succ_num];
    }
}

void bmc_ds::set_exit_bits( unsigned bidx, std::vector<expr>& b ) {
  block_to_exit_bits[bidx] = b;
}

expr bmc_ds::get_exit_branch_path( unsigned bidx, unsigned succ_num) {
  return get_path_bit( bidx ) && get_exit_bit( bidx, succ_num );
}

void bmc_ds::add_bmc_formulas(  std::vector< expr > fs ) {
  bmc_vec.insert( bmc_vec.begin(), fs.begin(), fs.end() );
}

void bmc_ds::add_spec(  expr e, spec_reason_t reason, src_loc& loc ) {
  spec s( e, reason, loc );
  spec_vec.push_back( s );
}

void bmc_ds::add_spec(  expr e, spec_reason_t reason ) {
  src_loc loc;
  add_spec( e, reason, loc );
}

void bmc_ds::add_spec( expr e ) {
  add_spec( e, spec_reason_t::UNKNOWN );
}

expr bmc_ds::get_expr(  const llvm::Value* v ) {
  if( auto alloc = llvm::dyn_cast<llvm::AllocaInst>(v) ) {
    return get_array_state_var( 0, alloc );
  } else if( auto glb = llvm::dyn_cast<llvm::GlobalVariable>(v) ) {
    auto ind = m_model.ind_in_mem_state[glb];
    // TODO : Check block num
    return m_model.store_state_map[0].mem_state_vec[ind].e;
  }else{
    return m.get_term( v );
  }
}

unsigned bmc_ds::find_block_idx( const bb* b) {
  unsigned bidx = 0;
  for( const bb* prev_candidate : bb_vec ) {
    if( prev_candidate == b ) break;
    bidx++;
  }
  return bidx;
}

void bmc_ds::insert_prev_idx( unsigned bidx, unsigned prev_bidx) {
  assert( prev_bidx < bidx ); // check to ensure acyclicity
  pred_idxs[bidx].push_back( prev_bidx );
}

std::vector<unsigned>& bmc_ds::get_prev_idxs( unsigned bidx) {
  return pred_idxs[bidx];
}

// void bmc_ds::setup_prevs_non_repeating() {
//   unsigned bidx = 0;
//   unsigned gap_idx = 0;
//   unsigned start_sub_body = 0;
//   unsigned end_sub_body = 0;
//   if( gaps.size() > 0 ) {
//     start_sub_body = gaps[gap_idx].first;
//     end_sub_body = gaps[gap_idx].second;
//   }
//   for( const bb* src : bb_vec ) {
//     if( gap_idx < gaps.size() ) {
//       if( bidx >= end_sub_body ) {
//         //process the entry header
//         for( const bb* pre_b : sub_loop->entry_edges ) {
//           unsigned pre_b_idx = find_block_idx( pre_b );
//           insert_prev_idx( start_sub_body, pre_b_idx );
//         }
//         gap_idx++;
//         start_sub_body = gaps[gap_idx].first;
//         end_sub_body = gaps[gap_idx].second;
//       }else if( bidx >= start_sub_body ) {
//         for( auto p_idx: sub_loop->get_pred_idxs( bidx-start_sub_body ) ) {
//           insert_prev_idx( bidx, p_idx+start_sub_body );
//         }
//         continue;
//       }
//     }
//     pred_idxs[bidx].empty();
//     for(auto PI = llvm::pred_begin(src),E = llvm::pred_end(src);PI != E;++PI) {
//       const bb* prev = *PI;
//       if( ignore_edge( src, prev ) ) continue;
//       if( loop_bmc_ds* lbds = is_sub_loop_exit_block( prev ) ) {
//         std::vector<unsigned> positions;
//         lbds->get_exit_block_positions( prev, positions);
//         for( auto prev_bdx : positions) {
//           //mulitple copies create issue with phi node issue.
//           insert_prev_idx( bidx, pre_bidx );
//         }
//       }else{
//         unsigned pre_idx = find_block_idx( prev );
//         if( pre_bidx == bb_vec.size() ) continue;
//         assert( pre_bidx < bidx );
//         insert_prev_idx( bidx, pre_bidx );
//       }
//     }
//     bidx++;
//   }
// }


void bmc_ds::setup_prevs_non_repeating() {
  unsigned bidx = 0;
  for( const bb* src : bb_vec ) {
    if( bidx < processed_bidx ) { bidx++; continue; }
    pred_idxs[bidx].empty();
    for(auto PI = llvm::pred_begin(src),E = llvm::pred_end(src);PI != E;++PI) {
      const bb* prev = *PI;
      if( ignore_edge( src, prev ) ) continue;
      unsigned pre_bidx = find_block_idx( prev );
      if( pre_bidx == bb_vec.size() ) continue; // block not found
      assert( pre_bidx < bidx );                // ensure acyclic graph
      pred_idxs[bidx].push_back( pre_bidx );
    }
    bidx++;
  }
}

bool bmc_ds::ignore_edge( const bb* cb, const bb* prev) {
  if( exists( loop_ignore_edges, cb ) )
    return exists( loop_ignore_edges.at( cb ), prev);
  return false;
}

void bmc_ds::
copy_and_stich_segments( unsigned times ) {
  copy_and_stich_segments( bb_vec, pred_idxs, exits, latches, times);
}

void bmc_ds::
copy_and_stich_segments( bb_vec_t& b_vec,
                         std::map< unsigned, std::vector<unsigned> >& prevs,
                         std::vector< std::pair<unsigned,unsigned> >& exits,
                         std::vector< unsigned >& latches,
                         unsigned times ) {
  if( times == 1 ) return;
  assert( times > 1 );
  /// check before processing
#ifndef NDEBUG
  for( unsigned l : latches ) {
    auto t = b_vec[l]->getTerminator();
    unsigned idx_succ =0;
    for(; idx_succ < t->getNumSuccessors();idx_succ++ ) {
      if( b_vec[0] == t->getSuccessor( idx_succ) ) break;
    }
    assert( idx_succ < t->getNumSuccessors());
  }
#endif
  // copy block vectors
  unsigned shift = b_vec.size();
  for( unsigned copy_num = 1; copy_num < times; copy_num++ ) {
    for( unsigned i=0;i < shift; i++ ) {
      b_vec.push_back( b_vec[i] );
    }
  }
  assert( b_vec.size() == times*shift );
  // wiring new blocks
  unsigned old_exits_size = exits.size();
  std::map< unsigned, std::vector<unsigned> > copy;
  for( unsigned copy_num = 1; copy_num < times; copy_num++ ) {
    unsigned local_shift = copy_num*shift;
    // wiring previous blocks for the newly copied blocks
    for( auto it : prevs ) {
      auto& prev = it.second;
      auto& copy_prev = copy[it.first+local_shift];
      for( unsigned i = 0; i < prev.size(); i++ ) {
        copy_prev.push_back( prev[i]+local_shift);
      }
    }
    assert( prevs[local_shift].size() == 0 );
    // Since latches of previous copy are now in the previous blocks
    // of the header of the current copy, wiring header to latches
    for( unsigned l : latches ) {
      prevs[local_shift].push_back(l+local_shift-shift);
    }
    //populating exits
    for( unsigned i = 0; i < old_exits_size; i++ ) {
      exits.push_back( {exits[i].first+local_shift,exits[i].second} );
    }
  }
  for( unsigned i=0; i < latches.size(); i++ ) {
    latches[i] = latches[i]+ (times-1)*shift;
  }
  prevs.insert( copy.begin(), copy.end() );
}

void bmc_ds::print_formulas(unsigned print_from, unsigned print_spec_from ) {
  std::cout << "Printing the bmc formula\n";
  for( unsigned i=print_from; i < bmc_vec.size(); i++ ) {
    std::cout << bmc_vec[i] << "\n";
  }
  std::cout << "Printing the specifications found from the code\n";
  for( unsigned i=print_spec_from; i < spec_vec.size(); i++ ) {
    spec_vec[i].print( std::cout );
    std::cout << "\n";
  }
}

//----------------------------------------------------------------------------
// manage memory model

std::pair<expr,expr>
bmc_ds::write( unsigned bidx, const llvm::StoreInst* I, expr& val ) {
  return m_model.write( bidx, I, val );
}

expr bmc_ds::read( unsigned bidx, const llvm::LoadInst* I ) {
  return m_model.read( bidx, I );
}

expr bmc_ds::join_state( std::vector<expr>& cs,
                                 std::vector<unsigned>& prevs,
                                  unsigned src ) {
  return m_model.join_state(cs, prevs, src );
}

//----------------------------------------------------------------------------
// manage array model

void bmc_ds::init_array_model( array_model_t ar_model_local,
                               array_state& s ) {
  unsigned bidx = 0;
  for( const bb* bb : bb_vec ) {
    if( bb == NULL ) continue;
    if( bidx++ < processed_bidx ) continue; 
    for( auto it = bb->begin(), e = bb->end(); it != e; ++it) {
      auto I = &(*it);
      if( auto load = llvm::dyn_cast<const llvm::LoadInst>(I) ) {
        auto op_ptr = load->getPointerOperand();
        if(auto gep = llvm::dyn_cast<const llvm::GetElementPtrInst>(op_ptr)) {
          auto op_gep_ptr = gep->getPointerOperand();
          if(auto addr = llvm::dyn_cast<const llvm::Instruction>(op_gep_ptr)) {
            ary_access_to_index[load] = ary_to_int.at(addr);
          }
        }else if (auto alloc = llvm::dyn_cast<const llvm::AllocaInst>(op_ptr)) {
          // To handle a[0] when a is dynamic sized array
          if(auto addr = llvm::dyn_cast<const llvm::Instruction>(op_ptr)) {
            ary_access_to_index[load] = ary_to_int.at(addr);
          }
        }else{
          // llvm_bmc_error("bmc", "non array global write/read not supported!");
        }
      }
      if(auto store = llvm::dyn_cast<const llvm::StoreInst>(I)) {
        auto op_ptr = store->getPointerOperand();
        if(auto gep = llvm::dyn_cast<const llvm::GetElementPtrInst>(op_ptr)) {
          auto op_gep_ptr = gep->getPointerOperand();
          if(auto addr = llvm::dyn_cast<const llvm::Instruction>(op_gep_ptr)) {
            ary_access_to_index[store] = ary_to_int.at(addr);
          }
        }else if (auto alloc = llvm::dyn_cast<const llvm::AllocaInst>(op_ptr)) {
          // To handle a[0] when a is dynamic sized array
          if(auto addr = llvm::dyn_cast<const llvm::Instruction>(op_ptr)) {
            ary_access_to_index[store] = ary_to_int.at(addr);
          }
        }else{
          // llvm_bmc_error("bmc", "non array global write/read not supported!");
        }
      }
    }
  }
  unsigned array_num = ary_to_int.size();
  std::map< const llvm::Instruction*, unsigned >& map = ary_access_to_index;
  if(ar_model_local == FULL) {
    // full model using store and select
    init_full_array_model( array_num, map, array_lengths );
    ar_model_full.init_state( 0, s );
    // ar_model_full.init_state( eb );
  } else if ( ar_model_local == FIXED_LEN) { //
    // array has fixed number of 'symbolic' cells
    init_fixed_len_array_model(array_num, map);
  } else if ( ar_model_local == PARTITION) {
    // vaphor like model
    init_partition_array_model(array_num);
  } else {
    llvm_bmc_error("bmc", "array model initialization");
  }
}

void bmc_ds::init_array_model( array_model_t ar_model_local ) {
  array_state s;
  init_array_model( ar_model_local, s );
}
void bmc_ds::init_full_array_model( unsigned array_num,
                                 std::map< const llvm::Instruction*, unsigned >& map,
                                 std::vector< expr >& array_lengths ) {
  if( ar_model_init != NONE )
       llvm_bmc_error( "bmc", "array model is already initialized" );
  ar_model_init = FULL;
  ar_model_full.set_array_num( array_num );
  ar_model_full.set_access_map( map );
  ar_model_full.set_lengths_vec( &array_lengths );
}

void bmc_ds::init_fixed_len_array_model(unsigned part_num,
                                     std::map< const llvm::Instruction*, unsigned >& map) {
  if( ar_model_init != NONE )
      llvm_bmc_error( "bmc", "array model is already initialized" );
  ar_model_init = FIXED_LEN;
  ar_model_fixed.set_partition_len( part_num );
  ar_model_fixed.set_access_map( map );
}


void bmc_ds::init_partition_array_model(unsigned part_num) {
  if( ar_model_init != NONE )
      llvm_bmc_error( "bmc", "array model is already initialized" );
  ar_model_init = PARTITION;
  // ar_model_part.init(part_num);
  llvm_bmc_error( "bmc", "stub!!" );
}


void bmc_ds::refresh_array_state( unsigned bidx,
                                  const llvm::Instruction* I) {
  assert( ar_model_init == FULL );
  ar_model_full.update_name( bidx, ary_to_int[I] );
}

arr_write_expr
bmc_ds::array_write( unsigned bidx, const llvm::StoreInst* I,
                      expr& idx, expr& val ) {
  assert( I );
  switch( ar_model_init ) {
  case FULL     : return ar_model_full.array_write( bidx, I, idx, val ); break;
  case FIXED_LEN: return ar_model_full.array_write( bidx, I, idx, val ); break;
  // case PARTITION: return ar_model_full.array_write( I, val ); break;
  default:
    llvm_bmc_error( "bmc", "incomplete implementation of an array model!!" );
  }
}

arr_read_expr bmc_ds::array_read( unsigned bidx, const llvm::LoadInst* I,
                               expr& idx ) {
  assert( I );
  switch( ar_model_init ) {
  case FULL     : return ar_model_full.array_read( bidx, I, idx ); break;
  case FIXED_LEN: return ar_model_full.array_read( bidx, I, idx ); break;
  // case PARTITION: return ar_model_full.array_read( I, val ); break;
  default:
    llvm_bmc_error( "bmc", "incomplete implementation of an array model!!" );
  }
}

expr bmc_ds::get_array_state_var( unsigned bidx,
                                      const llvm::AllocaInst* alloc ) {
  unsigned ith_ary = ary_to_int.at( alloc );
  return ar_model_full.get_array_state_var( bidx, ith_ary );
}

expr bmc_ds::get_array_state_var( unsigned bidx,
                                      const llvm::Instruction* alloc ) {

  unsigned ith_ary = ary_to_int.at( alloc );
  return ar_model_full.get_array_state_var( bidx, ith_ary );
}

void bmc_ds::set_array_state( unsigned bidx, array_state& s ) {
  assert( ar_model_init == FULL );
  return ar_model_full.set_array_state( bidx , s );
}

array_state& bmc_ds::get_array_state( const bb* b ) {
  unsigned bidx = find_block_idx(b);
  return ar_model_full.get_state( bidx );
}

expr bmc_ds::join_array_state(std::vector<expr>& cs,
                                  std::vector<unsigned>& prevs,
                                  unsigned src ) {
  assert( src );
  assert( cs.size() == prevs.size() );
  switch(ar_model_init) {
  case FIXED_LEN: return ar_model_fixed.join_array_state(cs,prevs, src ); break;
  case FULL:      return ar_model_full.join_array_state(cs, prevs, src ); break;
  // case PARTITION: return ar_model_part.join_array_state(cs, prevs, src);break;
  default:
    llvm_bmc_error( "bmc", "incomplete implementation of an array model!!" );
  }
}

//---------------------------------------------------------------------

unsigned bmc_fun::get_call_count( const llvm::CallInst* call ) {
  unsigned i = 0;
  while( i < call_sites.size() ) {
    if( call_sites[i] == call ) return i;
  }
  llvm_bmc_error( "bmc", "untracked callsite found!!" );
  return 0; // dummy return to avoid warning
}

//---------------------------------------------------------------------

loopdata* bmc_loop::get_loopdata() { return ld; }

