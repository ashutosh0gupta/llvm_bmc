// 0:vars:4
// 4:atom_1_X0_1:1
// 5:atom_1_X4_1:1
// 6:atom_1_X7_1:1
// 7:atom_1_X8_0:1
// 8:thr0:1
// 9:thr1:1
#define ADDRSIZE 10
#define NPROC 3
#define NCONTEXT 5

#define ASSUME(stmt) __CPROVER_assume(stmt)
#define ASSERT(stmt) __CPROVER_assert(stmt, "error")

#define max(a,b) (a>b?a:b)

char __get_rng();
char get_rng( char from, char to ) {
   char ret = __get_rng();
   ASSUME(ret >= from && ret <= to);
   return ret;
}

char get_rng_th( char from, char to ) {
   char ret = __get_rng();
   ASSUME(ret >= from && ret <= to);
   return ret;
}

int main(int argc, char **argv) {
  // declare arrays for intial value version in contexts
  int meminit_[ADDRSIZE*NCONTEXT];
  #define meminit(x,k) meminit_[(x)*NCONTEXT+k]
  int coinit_[ADDRSIZE*NCONTEXT];
  #define coinit(x,k) coinit_[(x)*NCONTEXT+k]
  int deltainit_[ADDRSIZE*NCONTEXT];
  #define deltainit(x,k) deltainit_[(x)*NCONTEXT+k]

  // declare arrays for running value version in contexts
  int mem_[ADDRSIZE*NCONTEXT];
  #define mem(x,k) mem_[(x)*NCONTEXT+k]
  int co_[ADDRSIZE*NCONTEXT];
  #define co(x,k) co_[(x)*NCONTEXT+k]
  int delta_[ADDRSIZE*NCONTEXT];
  #define delta(x,k) delta_[(x)*NCONTEXT+k]

  // declare arrays for local buffer and observed writes
  int buff_[NPROC*ADDRSIZE];
  #define buff(x,k) buff_[(x)*ADDRSIZE+k]
  int pw_[NPROC*ADDRSIZE];
  #define pw(x,k) pw_[(x)*ADDRSIZE+k]

  // declare arrays for context stamps
  char cr_[NPROC*ADDRSIZE];
  #define cr(x,k) cr_[(x)*ADDRSIZE+k]
  char iw_[NPROC*ADDRSIZE];
  #define iw(x,k) iw_[(x)*ADDRSIZE+k]
  char cw_[NPROC*ADDRSIZE];
  #define cw(x,k) cw_[(x)*ADDRSIZE+k]
  char cx_[NPROC*ADDRSIZE];
  #define cx(x,k) cx_[(x)*ADDRSIZE+k]
  char is_[NPROC*ADDRSIZE];
  #define is(x,k) is_[(x)*ADDRSIZE+k]
  char cs_[NPROC*ADDRSIZE];
  #define cs(x,k) cs_[(x)*ADDRSIZE+k]
  char crmax_[NPROC*ADDRSIZE];
  #define crmax(x,k) crmax_[(x)*ADDRSIZE+k]

  char sforbid_[ADDRSIZE*NCONTEXT];
  #define sforbid(x,k) sforbid_[(x)*NCONTEXT+k]

  // declare arrays for synchronizations
  int cl[NPROC];
  int cdy[NPROC];
  int cds[NPROC];
  int cdl[NPROC];
  int cisb[NPROC];
  int caddr[NPROC];
  int cctrl[NPROC];
  int cstart[NPROC];
  int creturn[NPROC];

  // declare arrays for contexts activity
  int active[NCONTEXT];
  int ctx_used[NCONTEXT];


  __LOCALS__
  buff(0,0) = 0;
  pw(0,0) = 0;
  cr(0,0) = 0;
  iw(0,0) = 0;
  cw(0,0) = 0;
  cx(0,0) = 0;
  is(0,0) = 0;
  cs(0,0) = 0;
  crmax(0,0) = 0;
  buff(0,1) = 0;
  pw(0,1) = 0;
  cr(0,1) = 0;
  iw(0,1) = 0;
  cw(0,1) = 0;
  cx(0,1) = 0;
  is(0,1) = 0;
  cs(0,1) = 0;
  crmax(0,1) = 0;
  buff(0,2) = 0;
  pw(0,2) = 0;
  cr(0,2) = 0;
  iw(0,2) = 0;
  cw(0,2) = 0;
  cx(0,2) = 0;
  is(0,2) = 0;
  cs(0,2) = 0;
  crmax(0,2) = 0;
  buff(0,3) = 0;
  pw(0,3) = 0;
  cr(0,3) = 0;
  iw(0,3) = 0;
  cw(0,3) = 0;
  cx(0,3) = 0;
  is(0,3) = 0;
  cs(0,3) = 0;
  crmax(0,3) = 0;
  buff(0,4) = 0;
  pw(0,4) = 0;
  cr(0,4) = 0;
  iw(0,4) = 0;
  cw(0,4) = 0;
  cx(0,4) = 0;
  is(0,4) = 0;
  cs(0,4) = 0;
  crmax(0,4) = 0;
  buff(0,5) = 0;
  pw(0,5) = 0;
  cr(0,5) = 0;
  iw(0,5) = 0;
  cw(0,5) = 0;
  cx(0,5) = 0;
  is(0,5) = 0;
  cs(0,5) = 0;
  crmax(0,5) = 0;
  buff(0,6) = 0;
  pw(0,6) = 0;
  cr(0,6) = 0;
  iw(0,6) = 0;
  cw(0,6) = 0;
  cx(0,6) = 0;
  is(0,6) = 0;
  cs(0,6) = 0;
  crmax(0,6) = 0;
  buff(0,7) = 0;
  pw(0,7) = 0;
  cr(0,7) = 0;
  iw(0,7) = 0;
  cw(0,7) = 0;
  cx(0,7) = 0;
  is(0,7) = 0;
  cs(0,7) = 0;
  crmax(0,7) = 0;
  buff(0,8) = 0;
  pw(0,8) = 0;
  cr(0,8) = 0;
  iw(0,8) = 0;
  cw(0,8) = 0;
  cx(0,8) = 0;
  is(0,8) = 0;
  cs(0,8) = 0;
  crmax(0,8) = 0;
  buff(0,9) = 0;
  pw(0,9) = 0;
  cr(0,9) = 0;
  iw(0,9) = 0;
  cw(0,9) = 0;
  cx(0,9) = 0;
  is(0,9) = 0;
  cs(0,9) = 0;
  crmax(0,9) = 0;
  cl[0] = 0;
  cdy[0] = 0;
  cds[0] = 0;
  cdl[0] = 0;
  cisb[0] = 0;
  caddr[0] = 0;
  cctrl[0] = 0;
  cstart[0] = get_rng(0,NCONTEXT-1);
  creturn[0] = get_rng(0,NCONTEXT-1);
  buff(1,0) = 0;
  pw(1,0) = 0;
  cr(1,0) = 0;
  iw(1,0) = 0;
  cw(1,0) = 0;
  cx(1,0) = 0;
  is(1,0) = 0;
  cs(1,0) = 0;
  crmax(1,0) = 0;
  buff(1,1) = 0;
  pw(1,1) = 0;
  cr(1,1) = 0;
  iw(1,1) = 0;
  cw(1,1) = 0;
  cx(1,1) = 0;
  is(1,1) = 0;
  cs(1,1) = 0;
  crmax(1,1) = 0;
  buff(1,2) = 0;
  pw(1,2) = 0;
  cr(1,2) = 0;
  iw(1,2) = 0;
  cw(1,2) = 0;
  cx(1,2) = 0;
  is(1,2) = 0;
  cs(1,2) = 0;
  crmax(1,2) = 0;
  buff(1,3) = 0;
  pw(1,3) = 0;
  cr(1,3) = 0;
  iw(1,3) = 0;
  cw(1,3) = 0;
  cx(1,3) = 0;
  is(1,3) = 0;
  cs(1,3) = 0;
  crmax(1,3) = 0;
  buff(1,4) = 0;
  pw(1,4) = 0;
  cr(1,4) = 0;
  iw(1,4) = 0;
  cw(1,4) = 0;
  cx(1,4) = 0;
  is(1,4) = 0;
  cs(1,4) = 0;
  crmax(1,4) = 0;
  buff(1,5) = 0;
  pw(1,5) = 0;
  cr(1,5) = 0;
  iw(1,5) = 0;
  cw(1,5) = 0;
  cx(1,5) = 0;
  is(1,5) = 0;
  cs(1,5) = 0;
  crmax(1,5) = 0;
  buff(1,6) = 0;
  pw(1,6) = 0;
  cr(1,6) = 0;
  iw(1,6) = 0;
  cw(1,6) = 0;
  cx(1,6) = 0;
  is(1,6) = 0;
  cs(1,6) = 0;
  crmax(1,6) = 0;
  buff(1,7) = 0;
  pw(1,7) = 0;
  cr(1,7) = 0;
  iw(1,7) = 0;
  cw(1,7) = 0;
  cx(1,7) = 0;
  is(1,7) = 0;
  cs(1,7) = 0;
  crmax(1,7) = 0;
  buff(1,8) = 0;
  pw(1,8) = 0;
  cr(1,8) = 0;
  iw(1,8) = 0;
  cw(1,8) = 0;
  cx(1,8) = 0;
  is(1,8) = 0;
  cs(1,8) = 0;
  crmax(1,8) = 0;
  buff(1,9) = 0;
  pw(1,9) = 0;
  cr(1,9) = 0;
  iw(1,9) = 0;
  cw(1,9) = 0;
  cx(1,9) = 0;
  is(1,9) = 0;
  cs(1,9) = 0;
  crmax(1,9) = 0;
  cl[1] = 0;
  cdy[1] = 0;
  cds[1] = 0;
  cdl[1] = 0;
  cisb[1] = 0;
  caddr[1] = 0;
  cctrl[1] = 0;
  cstart[1] = get_rng(0,NCONTEXT-1);
  creturn[1] = get_rng(0,NCONTEXT-1);
  buff(2,0) = 0;
  pw(2,0) = 0;
  cr(2,0) = 0;
  iw(2,0) = 0;
  cw(2,0) = 0;
  cx(2,0) = 0;
  is(2,0) = 0;
  cs(2,0) = 0;
  crmax(2,0) = 0;
  buff(2,1) = 0;
  pw(2,1) = 0;
  cr(2,1) = 0;
  iw(2,1) = 0;
  cw(2,1) = 0;
  cx(2,1) = 0;
  is(2,1) = 0;
  cs(2,1) = 0;
  crmax(2,1) = 0;
  buff(2,2) = 0;
  pw(2,2) = 0;
  cr(2,2) = 0;
  iw(2,2) = 0;
  cw(2,2) = 0;
  cx(2,2) = 0;
  is(2,2) = 0;
  cs(2,2) = 0;
  crmax(2,2) = 0;
  buff(2,3) = 0;
  pw(2,3) = 0;
  cr(2,3) = 0;
  iw(2,3) = 0;
  cw(2,3) = 0;
  cx(2,3) = 0;
  is(2,3) = 0;
  cs(2,3) = 0;
  crmax(2,3) = 0;
  buff(2,4) = 0;
  pw(2,4) = 0;
  cr(2,4) = 0;
  iw(2,4) = 0;
  cw(2,4) = 0;
  cx(2,4) = 0;
  is(2,4) = 0;
  cs(2,4) = 0;
  crmax(2,4) = 0;
  buff(2,5) = 0;
  pw(2,5) = 0;
  cr(2,5) = 0;
  iw(2,5) = 0;
  cw(2,5) = 0;
  cx(2,5) = 0;
  is(2,5) = 0;
  cs(2,5) = 0;
  crmax(2,5) = 0;
  buff(2,6) = 0;
  pw(2,6) = 0;
  cr(2,6) = 0;
  iw(2,6) = 0;
  cw(2,6) = 0;
  cx(2,6) = 0;
  is(2,6) = 0;
  cs(2,6) = 0;
  crmax(2,6) = 0;
  buff(2,7) = 0;
  pw(2,7) = 0;
  cr(2,7) = 0;
  iw(2,7) = 0;
  cw(2,7) = 0;
  cx(2,7) = 0;
  is(2,7) = 0;
  cs(2,7) = 0;
  crmax(2,7) = 0;
  buff(2,8) = 0;
  pw(2,8) = 0;
  cr(2,8) = 0;
  iw(2,8) = 0;
  cw(2,8) = 0;
  cx(2,8) = 0;
  is(2,8) = 0;
  cs(2,8) = 0;
  crmax(2,8) = 0;
  buff(2,9) = 0;
  pw(2,9) = 0;
  cr(2,9) = 0;
  iw(2,9) = 0;
  cw(2,9) = 0;
  cx(2,9) = 0;
  is(2,9) = 0;
  cs(2,9) = 0;
  crmax(2,9) = 0;
  cl[2] = 0;
  cdy[2] = 0;
  cds[2] = 0;
  cdl[2] = 0;
  cisb[2] = 0;
  caddr[2] = 0;
  cctrl[2] = 0;
  cstart[2] = get_rng(0,NCONTEXT-1);
  creturn[2] = get_rng(0,NCONTEXT-1);
  // Dumping initializations
  mem(0+0,0) = 0;
  mem(0+1,0) = 0;
  mem(0+2,0) = 0;
  mem(0+3,0) = 0;
  mem(4+0,0) = 0;
  mem(5+0,0) = 0;
  mem(6+0,0) = 0;
  mem(7+0,0) = 0;
  mem(8+0,0) = 0;
  mem(9+0,0) = 0;
  // Dumping context matching equalities
  co(0,0) = 0;
  delta(0,0) = -1;
  mem(0,1) = meminit(0,1);
  co(0,1) = coinit(0,1);
  delta(0,1) = deltainit(0,1);
  mem(0,2) = meminit(0,2);
  co(0,2) = coinit(0,2);
  delta(0,2) = deltainit(0,2);
  mem(0,3) = meminit(0,3);
  co(0,3) = coinit(0,3);
  delta(0,3) = deltainit(0,3);
  mem(0,4) = meminit(0,4);
  co(0,4) = coinit(0,4);
  delta(0,4) = deltainit(0,4);
  co(1,0) = 0;
  delta(1,0) = -1;
  mem(1,1) = meminit(1,1);
  co(1,1) = coinit(1,1);
  delta(1,1) = deltainit(1,1);
  mem(1,2) = meminit(1,2);
  co(1,2) = coinit(1,2);
  delta(1,2) = deltainit(1,2);
  mem(1,3) = meminit(1,3);
  co(1,3) = coinit(1,3);
  delta(1,3) = deltainit(1,3);
  mem(1,4) = meminit(1,4);
  co(1,4) = coinit(1,4);
  delta(1,4) = deltainit(1,4);
  co(2,0) = 0;
  delta(2,0) = -1;
  mem(2,1) = meminit(2,1);
  co(2,1) = coinit(2,1);
  delta(2,1) = deltainit(2,1);
  mem(2,2) = meminit(2,2);
  co(2,2) = coinit(2,2);
  delta(2,2) = deltainit(2,2);
  mem(2,3) = meminit(2,3);
  co(2,3) = coinit(2,3);
  delta(2,3) = deltainit(2,3);
  mem(2,4) = meminit(2,4);
  co(2,4) = coinit(2,4);
  delta(2,4) = deltainit(2,4);
  co(3,0) = 0;
  delta(3,0) = -1;
  mem(3,1) = meminit(3,1);
  co(3,1) = coinit(3,1);
  delta(3,1) = deltainit(3,1);
  mem(3,2) = meminit(3,2);
  co(3,2) = coinit(3,2);
  delta(3,2) = deltainit(3,2);
  mem(3,3) = meminit(3,3);
  co(3,3) = coinit(3,3);
  delta(3,3) = deltainit(3,3);
  mem(3,4) = meminit(3,4);
  co(3,4) = coinit(3,4);
  delta(3,4) = deltainit(3,4);
  co(4,0) = 0;
  delta(4,0) = -1;
  mem(4,1) = meminit(4,1);
  co(4,1) = coinit(4,1);
  delta(4,1) = deltainit(4,1);
  mem(4,2) = meminit(4,2);
  co(4,2) = coinit(4,2);
  delta(4,2) = deltainit(4,2);
  mem(4,3) = meminit(4,3);
  co(4,3) = coinit(4,3);
  delta(4,3) = deltainit(4,3);
  mem(4,4) = meminit(4,4);
  co(4,4) = coinit(4,4);
  delta(4,4) = deltainit(4,4);
  co(5,0) = 0;
  delta(5,0) = -1;
  mem(5,1) = meminit(5,1);
  co(5,1) = coinit(5,1);
  delta(5,1) = deltainit(5,1);
  mem(5,2) = meminit(5,2);
  co(5,2) = coinit(5,2);
  delta(5,2) = deltainit(5,2);
  mem(5,3) = meminit(5,3);
  co(5,3) = coinit(5,3);
  delta(5,3) = deltainit(5,3);
  mem(5,4) = meminit(5,4);
  co(5,4) = coinit(5,4);
  delta(5,4) = deltainit(5,4);
  co(6,0) = 0;
  delta(6,0) = -1;
  mem(6,1) = meminit(6,1);
  co(6,1) = coinit(6,1);
  delta(6,1) = deltainit(6,1);
  mem(6,2) = meminit(6,2);
  co(6,2) = coinit(6,2);
  delta(6,2) = deltainit(6,2);
  mem(6,3) = meminit(6,3);
  co(6,3) = coinit(6,3);
  delta(6,3) = deltainit(6,3);
  mem(6,4) = meminit(6,4);
  co(6,4) = coinit(6,4);
  delta(6,4) = deltainit(6,4);
  co(7,0) = 0;
  delta(7,0) = -1;
  mem(7,1) = meminit(7,1);
  co(7,1) = coinit(7,1);
  delta(7,1) = deltainit(7,1);
  mem(7,2) = meminit(7,2);
  co(7,2) = coinit(7,2);
  delta(7,2) = deltainit(7,2);
  mem(7,3) = meminit(7,3);
  co(7,3) = coinit(7,3);
  delta(7,3) = deltainit(7,3);
  mem(7,4) = meminit(7,4);
  co(7,4) = coinit(7,4);
  delta(7,4) = deltainit(7,4);
  co(8,0) = 0;
  delta(8,0) = -1;
  mem(8,1) = meminit(8,1);
  co(8,1) = coinit(8,1);
  delta(8,1) = deltainit(8,1);
  mem(8,2) = meminit(8,2);
  co(8,2) = coinit(8,2);
  delta(8,2) = deltainit(8,2);
  mem(8,3) = meminit(8,3);
  co(8,3) = coinit(8,3);
  delta(8,3) = deltainit(8,3);
  mem(8,4) = meminit(8,4);
  co(8,4) = coinit(8,4);
  delta(8,4) = deltainit(8,4);
  co(9,0) = 0;
  delta(9,0) = -1;
  mem(9,1) = meminit(9,1);
  co(9,1) = coinit(9,1);
  delta(9,1) = deltainit(9,1);
  mem(9,2) = meminit(9,2);
  co(9,2) = coinit(9,2);
  delta(9,2) = deltainit(9,2);
  mem(9,3) = meminit(9,3);
  co(9,3) = coinit(9,3);
  delta(9,3) = deltainit(9,3);
  mem(9,4) = meminit(9,4);
  co(9,4) = coinit(9,4);
  delta(9,4) = deltainit(9,4);
  // Dumping thread 1
  int ret_thread_1 = 0;
  cdy[1] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[1] >= cstart[1]);
T1BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !39, metadata !DIExpression()), !dbg !48

  //   br label %label_1, !dbg !49
  goto T1BLOCK1;

T1BLOCK1:
  //   call void @llvm.dbg.label(metadata !47), !dbg !50

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 0), metadata !40, metadata !DIExpression()), !dbg !51

  //   call void @llvm.dbg.value(metadata i64 1, metadata !43, metadata !DIExpression()), !dbg !51

  //   store atomic i64 1, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !52
  // ST: Guess
  iw(1,0) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW 
  old_cw = cw(1,0);
  cw(1,0) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(1,0)] == 1);
  ASSUME(active[cw(1,0)] == 1);
  ASSUME(sforbid(0,cw(1,0))== 0);
  ASSUME(iw(1,0) >= 0);
  ASSUME(iw(1,0) >= 0);
  ASSUME(cw(1,0) >= iw(1,0));
  ASSUME(cw(1,0) >= old_cw);
  ASSUME(cw(1,0) >= cr(1,0));
  ASSUME(cw(1,0) >= cl[1]);
  ASSUME(cw(1,0) >= cisb[1]);
  ASSUME(cw(1,0) >= cdy[1]);
  ASSUME(cw(1,0) >= cdl[1]);
  ASSUME(cw(1,0) >= cds[1]);
  ASSUME(cw(1,0) >= cctrl[1]);
  ASSUME(cw(1,0) >= caddr[1]);
  // Update
  caddr[1] = max(caddr[1],0);
  buff(1,0) = 1;
  mem(0,cw(1,0)) = 1;
  co(0,cw(1,0))+=1;
  delta(0,cw(1,0)) = -1;
  ASSUME(creturn[1] >= cw(1,0));

  //   call void (...) @dmbsy(), !dbg !53
  // dumbsy: Guess
  old_cdy = cdy[1];
  cdy[1] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[1] >= old_cdy);
  ASSUME(cdy[1] >= cisb[1]);
  ASSUME(cdy[1] >= cdl[1]);
  ASSUME(cdy[1] >= cds[1]);
  ASSUME(cdy[1] >= cctrl[1]);
  ASSUME(cdy[1] >= cw(1,0+0));
  ASSUME(cdy[1] >= cw(1,0+1));
  ASSUME(cdy[1] >= cw(1,0+2));
  ASSUME(cdy[1] >= cw(1,0+3));
  ASSUME(cdy[1] >= cw(1,4+0));
  ASSUME(cdy[1] >= cw(1,5+0));
  ASSUME(cdy[1] >= cw(1,6+0));
  ASSUME(cdy[1] >= cw(1,7+0));
  ASSUME(cdy[1] >= cw(1,8+0));
  ASSUME(cdy[1] >= cw(1,9+0));
  ASSUME(cdy[1] >= cr(1,0+0));
  ASSUME(cdy[1] >= cr(1,0+1));
  ASSUME(cdy[1] >= cr(1,0+2));
  ASSUME(cdy[1] >= cr(1,0+3));
  ASSUME(cdy[1] >= cr(1,4+0));
  ASSUME(cdy[1] >= cr(1,5+0));
  ASSUME(cdy[1] >= cr(1,6+0));
  ASSUME(cdy[1] >= cr(1,7+0));
  ASSUME(cdy[1] >= cr(1,8+0));
  ASSUME(cdy[1] >= cr(1,9+0));
  ASSUME(creturn[1] >= cdy[1]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 1), metadata !44, metadata !DIExpression()), !dbg !54

  //   call void @llvm.dbg.value(metadata i64 1, metadata !46, metadata !DIExpression()), !dbg !54

  //   store atomic i64 1, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !55
  // ST: Guess
  iw(1,0+1*1) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW 
  old_cw = cw(1,0+1*1);
  cw(1,0+1*1) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(1,0+1*1)] == 1);
  ASSUME(active[cw(1,0+1*1)] == 1);
  ASSUME(sforbid(0+1*1,cw(1,0+1*1))== 0);
  ASSUME(iw(1,0+1*1) >= 0);
  ASSUME(iw(1,0+1*1) >= 0);
  ASSUME(cw(1,0+1*1) >= iw(1,0+1*1));
  ASSUME(cw(1,0+1*1) >= old_cw);
  ASSUME(cw(1,0+1*1) >= cr(1,0+1*1));
  ASSUME(cw(1,0+1*1) >= cl[1]);
  ASSUME(cw(1,0+1*1) >= cisb[1]);
  ASSUME(cw(1,0+1*1) >= cdy[1]);
  ASSUME(cw(1,0+1*1) >= cdl[1]);
  ASSUME(cw(1,0+1*1) >= cds[1]);
  ASSUME(cw(1,0+1*1) >= cctrl[1]);
  ASSUME(cw(1,0+1*1) >= caddr[1]);
  // Update
  caddr[1] = max(caddr[1],0);
  buff(1,0+1*1) = 1;
  mem(0+1*1,cw(1,0+1*1)) = 1;
  co(0+1*1,cw(1,0+1*1))+=1;
  delta(0+1*1,cw(1,0+1*1)) = -1;
  ASSUME(creturn[1] >= cw(1,0+1*1));

  //   ret i8* null, !dbg !56
  ret_thread_1 = (- 1);


  // Dumping thread 2
  int ret_thread_2 = 0;
  cdy[2] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[2] >= cstart[2]);
T2BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !59, metadata !DIExpression()), !dbg !103

  //   br label %label_2, !dbg !85
  goto T2BLOCK1;

T2BLOCK1:
  //   call void @llvm.dbg.label(metadata !99), !dbg !105

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 1), metadata !62, metadata !DIExpression()), !dbg !106

  //   %0 = load atomic i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !88
  // LD: Guess
  old_cr = cr(2,0+1*1);
  cr(2,0+1*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(2,0+1*1)] == 2);
  ASSUME(cr(2,0+1*1) >= iw(2,0+1*1));
  ASSUME(cr(2,0+1*1) >= 0);
  ASSUME(cr(2,0+1*1) >= cdy[2]);
  ASSUME(cr(2,0+1*1) >= cisb[2]);
  ASSUME(cr(2,0+1*1) >= cdl[2]);
  ASSUME(cr(2,0+1*1) >= cl[2]);
  // Update
  creg_r0 = cr(2,0+1*1);
  crmax(2,0+1*1) = max(crmax(2,0+1*1),cr(2,0+1*1));
  caddr[2] = max(caddr[2],0);
  if(cr(2,0+1*1) < cw(2,0+1*1)) {
    r0 = buff(2,0+1*1);
    ASSUME((!(( (cw(2,0+1*1) < 1) && (1 < crmax(2,0+1*1)) )))||(sforbid(0+1*1,1)> 0));
    ASSUME((!(( (cw(2,0+1*1) < 2) && (2 < crmax(2,0+1*1)) )))||(sforbid(0+1*1,2)> 0));
    ASSUME((!(( (cw(2,0+1*1) < 3) && (3 < crmax(2,0+1*1)) )))||(sforbid(0+1*1,3)> 0));
    ASSUME((!(( (cw(2,0+1*1) < 4) && (4 < crmax(2,0+1*1)) )))||(sforbid(0+1*1,4)> 0));
  } else {
    if(pw(2,0+1*1) != co(0+1*1,cr(2,0+1*1))) {
      ASSUME(cr(2,0+1*1) >= old_cr);
    }
    pw(2,0+1*1) = co(0+1*1,cr(2,0+1*1));
    r0 = mem(0+1*1,cr(2,0+1*1));
  }
  ASSUME(creturn[2] >= cr(2,0+1*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !64, metadata !DIExpression()), !dbg !106

  //   %conv = trunc i64 %0 to i32, !dbg !89

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !60, metadata !DIExpression()), !dbg !103

  //   %tobool = icmp ne i32 %conv, 0, !dbg !90

  //   br i1 %tobool, label %if.then, label %if.else, !dbg !92
  old_cctrl = cctrl[2];
  cctrl[2] = get_rng(0,NCONTEXT-1);
  ASSUME(cctrl[2] >= old_cctrl);
  ASSUME(cctrl[2] >= creg_r0);
  ASSUME(cctrl[2] >= 0);
  if((r0!=0)) {
    goto T2BLOCK2;
  } else {
    goto T2BLOCK3;
  }

T2BLOCK2:
  //   br label %lbl_LC00, !dbg !93
  goto T2BLOCK4;

T2BLOCK3:
  //   br label %lbl_LC00, !dbg !94
  goto T2BLOCK4;

T2BLOCK4:
  //   call void @llvm.dbg.label(metadata !100), !dbg !114

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 2), metadata !65, metadata !DIExpression()), !dbg !115

  //   call void @llvm.dbg.value(metadata i64 1, metadata !67, metadata !DIExpression()), !dbg !115

  //   store atomic i64 1, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 2) monotonic, align 8, !dbg !97
  // ST: Guess
  iw(2,0+2*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW 
  old_cw = cw(2,0+2*1);
  cw(2,0+2*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(2,0+2*1)] == 2);
  ASSUME(active[cw(2,0+2*1)] == 2);
  ASSUME(sforbid(0+2*1,cw(2,0+2*1))== 0);
  ASSUME(iw(2,0+2*1) >= 0);
  ASSUME(iw(2,0+2*1) >= 0);
  ASSUME(cw(2,0+2*1) >= iw(2,0+2*1));
  ASSUME(cw(2,0+2*1) >= old_cw);
  ASSUME(cw(2,0+2*1) >= cr(2,0+2*1));
  ASSUME(cw(2,0+2*1) >= cl[2]);
  ASSUME(cw(2,0+2*1) >= cisb[2]);
  ASSUME(cw(2,0+2*1) >= cdy[2]);
  ASSUME(cw(2,0+2*1) >= cdl[2]);
  ASSUME(cw(2,0+2*1) >= cds[2]);
  ASSUME(cw(2,0+2*1) >= cctrl[2]);
  ASSUME(cw(2,0+2*1) >= caddr[2]);
  // Update
  caddr[2] = max(caddr[2],0);
  buff(2,0+2*1) = 1;
  mem(0+2*1,cw(2,0+2*1)) = 1;
  co(0+2*1,cw(2,0+2*1))+=1;
  delta(0+2*1,cw(2,0+2*1)) = -1;
  ASSUME(creturn[2] >= cw(2,0+2*1));

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 2), metadata !69, metadata !DIExpression()), !dbg !117

  //   %1 = load atomic i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 2) monotonic, align 8, !dbg !99
  // LD: Guess
  old_cr = cr(2,0+2*1);
  cr(2,0+2*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(2,0+2*1)] == 2);
  ASSUME(cr(2,0+2*1) >= iw(2,0+2*1));
  ASSUME(cr(2,0+2*1) >= 0);
  ASSUME(cr(2,0+2*1) >= cdy[2]);
  ASSUME(cr(2,0+2*1) >= cisb[2]);
  ASSUME(cr(2,0+2*1) >= cdl[2]);
  ASSUME(cr(2,0+2*1) >= cl[2]);
  // Update
  creg_r1 = cr(2,0+2*1);
  crmax(2,0+2*1) = max(crmax(2,0+2*1),cr(2,0+2*1));
  caddr[2] = max(caddr[2],0);
  if(cr(2,0+2*1) < cw(2,0+2*1)) {
    r1 = buff(2,0+2*1);
    ASSUME((!(( (cw(2,0+2*1) < 1) && (1 < crmax(2,0+2*1)) )))||(sforbid(0+2*1,1)> 0));
    ASSUME((!(( (cw(2,0+2*1) < 2) && (2 < crmax(2,0+2*1)) )))||(sforbid(0+2*1,2)> 0));
    ASSUME((!(( (cw(2,0+2*1) < 3) && (3 < crmax(2,0+2*1)) )))||(sforbid(0+2*1,3)> 0));
    ASSUME((!(( (cw(2,0+2*1) < 4) && (4 < crmax(2,0+2*1)) )))||(sforbid(0+2*1,4)> 0));
  } else {
    if(pw(2,0+2*1) != co(0+2*1,cr(2,0+2*1))) {
      ASSUME(cr(2,0+2*1) >= old_cr);
    }
    pw(2,0+2*1) = co(0+2*1,cr(2,0+2*1));
    r1 = mem(0+2*1,cr(2,0+2*1));
  }
  ASSUME(creturn[2] >= cr(2,0+2*1));

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !71, metadata !DIExpression()), !dbg !117

  //   %conv4 = trunc i64 %1 to i32, !dbg !100

  //   call void @llvm.dbg.value(metadata i32 %conv4, metadata !68, metadata !DIExpression()), !dbg !103

  //   %tobool5 = icmp ne i32 %conv4, 0, !dbg !101

  //   br i1 %tobool5, label %if.then6, label %if.else7, !dbg !103
  old_cctrl = cctrl[2];
  cctrl[2] = get_rng(0,NCONTEXT-1);
  ASSUME(cctrl[2] >= old_cctrl);
  ASSUME(cctrl[2] >= creg_r1);
  ASSUME(cctrl[2] >= 0);
  if((r1!=0)) {
    goto T2BLOCK5;
  } else {
    goto T2BLOCK6;
  }

T2BLOCK5:
  //   br label %lbl_LC01, !dbg !104
  goto T2BLOCK7;

T2BLOCK6:
  //   br label %lbl_LC01, !dbg !105
  goto T2BLOCK7;

T2BLOCK7:
  //   call void @llvm.dbg.label(metadata !101), !dbg !125

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 3), metadata !72, metadata !DIExpression()), !dbg !126

  //   call void @llvm.dbg.value(metadata i64 1, metadata !74, metadata !DIExpression()), !dbg !126

  //   store atomic i64 1, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !108
  // ST: Guess
  iw(2,0+3*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW 
  old_cw = cw(2,0+3*1);
  cw(2,0+3*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(2,0+3*1)] == 2);
  ASSUME(active[cw(2,0+3*1)] == 2);
  ASSUME(sforbid(0+3*1,cw(2,0+3*1))== 0);
  ASSUME(iw(2,0+3*1) >= 0);
  ASSUME(iw(2,0+3*1) >= 0);
  ASSUME(cw(2,0+3*1) >= iw(2,0+3*1));
  ASSUME(cw(2,0+3*1) >= old_cw);
  ASSUME(cw(2,0+3*1) >= cr(2,0+3*1));
  ASSUME(cw(2,0+3*1) >= cl[2]);
  ASSUME(cw(2,0+3*1) >= cisb[2]);
  ASSUME(cw(2,0+3*1) >= cdy[2]);
  ASSUME(cw(2,0+3*1) >= cdl[2]);
  ASSUME(cw(2,0+3*1) >= cds[2]);
  ASSUME(cw(2,0+3*1) >= cctrl[2]);
  ASSUME(cw(2,0+3*1) >= caddr[2]);
  // Update
  caddr[2] = max(caddr[2],0);
  buff(2,0+3*1) = 1;
  mem(0+3*1,cw(2,0+3*1)) = 1;
  co(0+3*1,cw(2,0+3*1))+=1;
  delta(0+3*1,cw(2,0+3*1)) = -1;
  ASSUME(creturn[2] >= cw(2,0+3*1));

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 3), metadata !76, metadata !DIExpression()), !dbg !128

  //   %2 = load atomic i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !110
  // LD: Guess
  old_cr = cr(2,0+3*1);
  cr(2,0+3*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(2,0+3*1)] == 2);
  ASSUME(cr(2,0+3*1) >= iw(2,0+3*1));
  ASSUME(cr(2,0+3*1) >= 0);
  ASSUME(cr(2,0+3*1) >= cdy[2]);
  ASSUME(cr(2,0+3*1) >= cisb[2]);
  ASSUME(cr(2,0+3*1) >= cdl[2]);
  ASSUME(cr(2,0+3*1) >= cl[2]);
  // Update
  creg_r2 = cr(2,0+3*1);
  crmax(2,0+3*1) = max(crmax(2,0+3*1),cr(2,0+3*1));
  caddr[2] = max(caddr[2],0);
  if(cr(2,0+3*1) < cw(2,0+3*1)) {
    r2 = buff(2,0+3*1);
    ASSUME((!(( (cw(2,0+3*1) < 1) && (1 < crmax(2,0+3*1)) )))||(sforbid(0+3*1,1)> 0));
    ASSUME((!(( (cw(2,0+3*1) < 2) && (2 < crmax(2,0+3*1)) )))||(sforbid(0+3*1,2)> 0));
    ASSUME((!(( (cw(2,0+3*1) < 3) && (3 < crmax(2,0+3*1)) )))||(sforbid(0+3*1,3)> 0));
    ASSUME((!(( (cw(2,0+3*1) < 4) && (4 < crmax(2,0+3*1)) )))||(sforbid(0+3*1,4)> 0));
  } else {
    if(pw(2,0+3*1) != co(0+3*1,cr(2,0+3*1))) {
      ASSUME(cr(2,0+3*1) >= old_cr);
    }
    pw(2,0+3*1) = co(0+3*1,cr(2,0+3*1));
    r2 = mem(0+3*1,cr(2,0+3*1));
  }
  ASSUME(creturn[2] >= cr(2,0+3*1));

  //   call void @llvm.dbg.value(metadata i64 %2, metadata !78, metadata !DIExpression()), !dbg !128

  //   %conv13 = trunc i64 %2 to i32, !dbg !111

  //   call void @llvm.dbg.value(metadata i32 %conv13, metadata !75, metadata !DIExpression()), !dbg !103

  //   %tobool14 = icmp ne i32 %conv13, 0, !dbg !112

  //   br i1 %tobool14, label %if.then15, label %if.else16, !dbg !114
  old_cctrl = cctrl[2];
  cctrl[2] = get_rng(0,NCONTEXT-1);
  ASSUME(cctrl[2] >= old_cctrl);
  ASSUME(cctrl[2] >= creg_r2);
  ASSUME(cctrl[2] >= 0);
  if((r2!=0)) {
    goto T2BLOCK8;
  } else {
    goto T2BLOCK9;
  }

T2BLOCK8:
  //   br label %lbl_LC02, !dbg !115
  goto T2BLOCK10;

T2BLOCK9:
  //   br label %lbl_LC02, !dbg !116
  goto T2BLOCK10;

T2BLOCK10:
  //   call void @llvm.dbg.label(metadata !102), !dbg !136

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 0), metadata !80, metadata !DIExpression()), !dbg !137

  //   %3 = load atomic i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !119
  // LD: Guess
  old_cr = cr(2,0);
  cr(2,0) = get_rng(0,NCONTEXT-1);// 2 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(2,0)] == 2);
  ASSUME(cr(2,0) >= iw(2,0));
  ASSUME(cr(2,0) >= 0);
  ASSUME(cr(2,0) >= cdy[2]);
  ASSUME(cr(2,0) >= cisb[2]);
  ASSUME(cr(2,0) >= cdl[2]);
  ASSUME(cr(2,0) >= cl[2]);
  // Update
  creg_r3 = cr(2,0);
  crmax(2,0) = max(crmax(2,0),cr(2,0));
  caddr[2] = max(caddr[2],0);
  if(cr(2,0) < cw(2,0)) {
    r3 = buff(2,0);
    ASSUME((!(( (cw(2,0) < 1) && (1 < crmax(2,0)) )))||(sforbid(0,1)> 0));
    ASSUME((!(( (cw(2,0) < 2) && (2 < crmax(2,0)) )))||(sforbid(0,2)> 0));
    ASSUME((!(( (cw(2,0) < 3) && (3 < crmax(2,0)) )))||(sforbid(0,3)> 0));
    ASSUME((!(( (cw(2,0) < 4) && (4 < crmax(2,0)) )))||(sforbid(0,4)> 0));
  } else {
    if(pw(2,0) != co(0,cr(2,0))) {
      ASSUME(cr(2,0) >= old_cr);
    }
    pw(2,0) = co(0,cr(2,0));
    r3 = mem(0,cr(2,0));
  }
  ASSUME(creturn[2] >= cr(2,0));

  //   call void @llvm.dbg.value(metadata i64 %3, metadata !82, metadata !DIExpression()), !dbg !137

  //   %conv20 = trunc i64 %3 to i32, !dbg !120

  //   call void @llvm.dbg.value(metadata i32 %conv20, metadata !79, metadata !DIExpression()), !dbg !103

  //   %cmp = icmp eq i32 %conv, 1, !dbg !121

  //   %conv21 = zext i1 %cmp to i32, !dbg !121

  //   call void @llvm.dbg.value(metadata i32 %conv21, metadata !83, metadata !DIExpression()), !dbg !103

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X0_1, metadata !84, metadata !DIExpression()), !dbg !141

  //   %4 = zext i32 %conv21 to i64

  //   call void @llvm.dbg.value(metadata i64 %4, metadata !86, metadata !DIExpression()), !dbg !141

  //   store atomic i64 %4, i64* @atom_1_X0_1 seq_cst, align 8, !dbg !123
  // ST: Guess
  iw(2,4) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW 
  old_cw = cw(2,4);
  cw(2,4) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(2,4)] == 2);
  ASSUME(active[cw(2,4)] == 2);
  ASSUME(sforbid(4,cw(2,4))== 0);
  ASSUME(iw(2,4) >= max(creg_r0,0));
  ASSUME(iw(2,4) >= 0);
  ASSUME(cw(2,4) >= iw(2,4));
  ASSUME(cw(2,4) >= old_cw);
  ASSUME(cw(2,4) >= cr(2,4));
  ASSUME(cw(2,4) >= cl[2]);
  ASSUME(cw(2,4) >= cisb[2]);
  ASSUME(cw(2,4) >= cdy[2]);
  ASSUME(cw(2,4) >= cdl[2]);
  ASSUME(cw(2,4) >= cds[2]);
  ASSUME(cw(2,4) >= cctrl[2]);
  ASSUME(cw(2,4) >= caddr[2]);
  // Update
  caddr[2] = max(caddr[2],0);
  buff(2,4) = (r0==1);
  mem(4,cw(2,4)) = (r0==1);
  co(4,cw(2,4))+=1;
  delta(4,cw(2,4)) = -1;
  ASSUME(creturn[2] >= cw(2,4));

  //   %cmp25 = icmp eq i32 %conv4, 1, !dbg !124

  //   %conv26 = zext i1 %cmp25 to i32, !dbg !124

  //   call void @llvm.dbg.value(metadata i32 %conv26, metadata !87, metadata !DIExpression()), !dbg !103

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X4_1, metadata !88, metadata !DIExpression()), !dbg !144

  //   %5 = zext i32 %conv26 to i64

  //   call void @llvm.dbg.value(metadata i64 %5, metadata !90, metadata !DIExpression()), !dbg !144

  //   store atomic i64 %5, i64* @atom_1_X4_1 seq_cst, align 8, !dbg !126
  // ST: Guess
  iw(2,5) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW 
  old_cw = cw(2,5);
  cw(2,5) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(2,5)] == 2);
  ASSUME(active[cw(2,5)] == 2);
  ASSUME(sforbid(5,cw(2,5))== 0);
  ASSUME(iw(2,5) >= max(creg_r1,0));
  ASSUME(iw(2,5) >= 0);
  ASSUME(cw(2,5) >= iw(2,5));
  ASSUME(cw(2,5) >= old_cw);
  ASSUME(cw(2,5) >= cr(2,5));
  ASSUME(cw(2,5) >= cl[2]);
  ASSUME(cw(2,5) >= cisb[2]);
  ASSUME(cw(2,5) >= cdy[2]);
  ASSUME(cw(2,5) >= cdl[2]);
  ASSUME(cw(2,5) >= cds[2]);
  ASSUME(cw(2,5) >= cctrl[2]);
  ASSUME(cw(2,5) >= caddr[2]);
  // Update
  caddr[2] = max(caddr[2],0);
  buff(2,5) = (r1==1);
  mem(5,cw(2,5)) = (r1==1);
  co(5,cw(2,5))+=1;
  delta(5,cw(2,5)) = -1;
  ASSUME(creturn[2] >= cw(2,5));

  //   %cmp30 = icmp eq i32 %conv13, 1, !dbg !127

  //   %conv31 = zext i1 %cmp30 to i32, !dbg !127

  //   call void @llvm.dbg.value(metadata i32 %conv31, metadata !91, metadata !DIExpression()), !dbg !103

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X7_1, metadata !92, metadata !DIExpression()), !dbg !147

  //   %6 = zext i32 %conv31 to i64

  //   call void @llvm.dbg.value(metadata i64 %6, metadata !94, metadata !DIExpression()), !dbg !147

  //   store atomic i64 %6, i64* @atom_1_X7_1 seq_cst, align 8, !dbg !129
  // ST: Guess
  iw(2,6) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW 
  old_cw = cw(2,6);
  cw(2,6) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(2,6)] == 2);
  ASSUME(active[cw(2,6)] == 2);
  ASSUME(sforbid(6,cw(2,6))== 0);
  ASSUME(iw(2,6) >= max(creg_r2,0));
  ASSUME(iw(2,6) >= 0);
  ASSUME(cw(2,6) >= iw(2,6));
  ASSUME(cw(2,6) >= old_cw);
  ASSUME(cw(2,6) >= cr(2,6));
  ASSUME(cw(2,6) >= cl[2]);
  ASSUME(cw(2,6) >= cisb[2]);
  ASSUME(cw(2,6) >= cdy[2]);
  ASSUME(cw(2,6) >= cdl[2]);
  ASSUME(cw(2,6) >= cds[2]);
  ASSUME(cw(2,6) >= cctrl[2]);
  ASSUME(cw(2,6) >= caddr[2]);
  // Update
  caddr[2] = max(caddr[2],0);
  buff(2,6) = (r2==1);
  mem(6,cw(2,6)) = (r2==1);
  co(6,cw(2,6))+=1;
  delta(6,cw(2,6)) = -1;
  ASSUME(creturn[2] >= cw(2,6));

  //   %cmp35 = icmp eq i32 %conv20, 0, !dbg !130

  //   %conv36 = zext i1 %cmp35 to i32, !dbg !130

  //   call void @llvm.dbg.value(metadata i32 %conv36, metadata !95, metadata !DIExpression()), !dbg !103

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X8_0, metadata !96, metadata !DIExpression()), !dbg !150

  //   %7 = zext i32 %conv36 to i64

  //   call void @llvm.dbg.value(metadata i64 %7, metadata !98, metadata !DIExpression()), !dbg !150

  //   store atomic i64 %7, i64* @atom_1_X8_0 seq_cst, align 8, !dbg !132
  // ST: Guess
  iw(2,7) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW 
  old_cw = cw(2,7);
  cw(2,7) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(2,7)] == 2);
  ASSUME(active[cw(2,7)] == 2);
  ASSUME(sforbid(7,cw(2,7))== 0);
  ASSUME(iw(2,7) >= max(creg_r3,0));
  ASSUME(iw(2,7) >= 0);
  ASSUME(cw(2,7) >= iw(2,7));
  ASSUME(cw(2,7) >= old_cw);
  ASSUME(cw(2,7) >= cr(2,7));
  ASSUME(cw(2,7) >= cl[2]);
  ASSUME(cw(2,7) >= cisb[2]);
  ASSUME(cw(2,7) >= cdy[2]);
  ASSUME(cw(2,7) >= cdl[2]);
  ASSUME(cw(2,7) >= cds[2]);
  ASSUME(cw(2,7) >= cctrl[2]);
  ASSUME(cw(2,7) >= caddr[2]);
  // Update
  caddr[2] = max(caddr[2],0);
  buff(2,7) = (r3==0);
  mem(7,cw(2,7)) = (r3==0);
  co(7,cw(2,7))+=1;
  delta(7,cw(2,7)) = -1;
  ASSUME(creturn[2] >= cw(2,7));

  //   ret i8* null, !dbg !133
  ret_thread_2 = (- 1);


  // Dumping thread 0
  int ret_thread_0 = 0;
  cdy[0] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[0] >= cstart[0]);
T0BLOCK0:
  //   %thr0 = alloca i64, align 8

  //   %thr1 = alloca i64, align 8

  //   call void @llvm.dbg.value(metadata i32 %argc, metadata !160, metadata !DIExpression()), !dbg !234

  //   call void @llvm.dbg.value(metadata i8** %argv, metadata !161, metadata !DIExpression()), !dbg !234

  //   %0 = bitcast i64* %thr0 to i8*, !dbg !119

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #7, !dbg !119

  //   call void @llvm.dbg.declare(metadata i64* %thr0, metadata !162, metadata !DIExpression()), !dbg !236

  //   %1 = bitcast i64* %thr1 to i8*, !dbg !121

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #7, !dbg !121

  //   call void @llvm.dbg.declare(metadata i64* %thr1, metadata !166, metadata !DIExpression()), !dbg !238

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 3), metadata !167, metadata !DIExpression()), !dbg !239

  //   call void @llvm.dbg.value(metadata i64 0, metadata !169, metadata !DIExpression()), !dbg !239

  //   store atomic i64 0, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !124
  // ST: Guess
  iw(0,0+3*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW 
  old_cw = cw(0,0+3*1);
  cw(0,0+3*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(0,0+3*1)] == 0);
  ASSUME(active[cw(0,0+3*1)] == 0);
  ASSUME(sforbid(0+3*1,cw(0,0+3*1))== 0);
  ASSUME(iw(0,0+3*1) >= 0);
  ASSUME(iw(0,0+3*1) >= 0);
  ASSUME(cw(0,0+3*1) >= iw(0,0+3*1));
  ASSUME(cw(0,0+3*1) >= old_cw);
  ASSUME(cw(0,0+3*1) >= cr(0,0+3*1));
  ASSUME(cw(0,0+3*1) >= cl[0]);
  ASSUME(cw(0,0+3*1) >= cisb[0]);
  ASSUME(cw(0,0+3*1) >= cdy[0]);
  ASSUME(cw(0,0+3*1) >= cdl[0]);
  ASSUME(cw(0,0+3*1) >= cds[0]);
  ASSUME(cw(0,0+3*1) >= cctrl[0]);
  ASSUME(cw(0,0+3*1) >= caddr[0]);
  // Update
  caddr[0] = max(caddr[0],0);
  buff(0,0+3*1) = 0;
  mem(0+3*1,cw(0,0+3*1)) = 0;
  co(0+3*1,cw(0,0+3*1))+=1;
  delta(0+3*1,cw(0,0+3*1)) = -1;
  ASSUME(creturn[0] >= cw(0,0+3*1));

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 2), metadata !170, metadata !DIExpression()), !dbg !241

  //   call void @llvm.dbg.value(metadata i64 0, metadata !172, metadata !DIExpression()), !dbg !241

  //   store atomic i64 0, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 2) monotonic, align 8, !dbg !126
  // ST: Guess
  iw(0,0+2*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW 
  old_cw = cw(0,0+2*1);
  cw(0,0+2*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(0,0+2*1)] == 0);
  ASSUME(active[cw(0,0+2*1)] == 0);
  ASSUME(sforbid(0+2*1,cw(0,0+2*1))== 0);
  ASSUME(iw(0,0+2*1) >= 0);
  ASSUME(iw(0,0+2*1) >= 0);
  ASSUME(cw(0,0+2*1) >= iw(0,0+2*1));
  ASSUME(cw(0,0+2*1) >= old_cw);
  ASSUME(cw(0,0+2*1) >= cr(0,0+2*1));
  ASSUME(cw(0,0+2*1) >= cl[0]);
  ASSUME(cw(0,0+2*1) >= cisb[0]);
  ASSUME(cw(0,0+2*1) >= cdy[0]);
  ASSUME(cw(0,0+2*1) >= cdl[0]);
  ASSUME(cw(0,0+2*1) >= cds[0]);
  ASSUME(cw(0,0+2*1) >= cctrl[0]);
  ASSUME(cw(0,0+2*1) >= caddr[0]);
  // Update
  caddr[0] = max(caddr[0],0);
  buff(0,0+2*1) = 0;
  mem(0+2*1,cw(0,0+2*1)) = 0;
  co(0+2*1,cw(0,0+2*1))+=1;
  delta(0+2*1,cw(0,0+2*1)) = -1;
  ASSUME(creturn[0] >= cw(0,0+2*1));

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 1), metadata !173, metadata !DIExpression()), !dbg !243

  //   call void @llvm.dbg.value(metadata i64 0, metadata !175, metadata !DIExpression()), !dbg !243

  //   store atomic i64 0, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !128
  // ST: Guess
  iw(0,0+1*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW 
  old_cw = cw(0,0+1*1);
  cw(0,0+1*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(0,0+1*1)] == 0);
  ASSUME(active[cw(0,0+1*1)] == 0);
  ASSUME(sforbid(0+1*1,cw(0,0+1*1))== 0);
  ASSUME(iw(0,0+1*1) >= 0);
  ASSUME(iw(0,0+1*1) >= 0);
  ASSUME(cw(0,0+1*1) >= iw(0,0+1*1));
  ASSUME(cw(0,0+1*1) >= old_cw);
  ASSUME(cw(0,0+1*1) >= cr(0,0+1*1));
  ASSUME(cw(0,0+1*1) >= cl[0]);
  ASSUME(cw(0,0+1*1) >= cisb[0]);
  ASSUME(cw(0,0+1*1) >= cdy[0]);
  ASSUME(cw(0,0+1*1) >= cdl[0]);
  ASSUME(cw(0,0+1*1) >= cds[0]);
  ASSUME(cw(0,0+1*1) >= cctrl[0]);
  ASSUME(cw(0,0+1*1) >= caddr[0]);
  // Update
  caddr[0] = max(caddr[0],0);
  buff(0,0+1*1) = 0;
  mem(0+1*1,cw(0,0+1*1)) = 0;
  co(0+1*1,cw(0,0+1*1))+=1;
  delta(0+1*1,cw(0,0+1*1)) = -1;
  ASSUME(creturn[0] >= cw(0,0+1*1));

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 0), metadata !176, metadata !DIExpression()), !dbg !245

  //   call void @llvm.dbg.value(metadata i64 0, metadata !178, metadata !DIExpression()), !dbg !245

  //   store atomic i64 0, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !130
  // ST: Guess
  iw(0,0) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW 
  old_cw = cw(0,0);
  cw(0,0) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(0,0)] == 0);
  ASSUME(active[cw(0,0)] == 0);
  ASSUME(sforbid(0,cw(0,0))== 0);
  ASSUME(iw(0,0) >= 0);
  ASSUME(iw(0,0) >= 0);
  ASSUME(cw(0,0) >= iw(0,0));
  ASSUME(cw(0,0) >= old_cw);
  ASSUME(cw(0,0) >= cr(0,0));
  ASSUME(cw(0,0) >= cl[0]);
  ASSUME(cw(0,0) >= cisb[0]);
  ASSUME(cw(0,0) >= cdy[0]);
  ASSUME(cw(0,0) >= cdl[0]);
  ASSUME(cw(0,0) >= cds[0]);
  ASSUME(cw(0,0) >= cctrl[0]);
  ASSUME(cw(0,0) >= caddr[0]);
  // Update
  caddr[0] = max(caddr[0],0);
  buff(0,0) = 0;
  mem(0,cw(0,0)) = 0;
  co(0,cw(0,0))+=1;
  delta(0,cw(0,0)) = -1;
  ASSUME(creturn[0] >= cw(0,0));

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X0_1, metadata !179, metadata !DIExpression()), !dbg !247

  //   call void @llvm.dbg.value(metadata i64 0, metadata !181, metadata !DIExpression()), !dbg !247

  //   store atomic i64 0, i64* @atom_1_X0_1 monotonic, align 8, !dbg !132
  // ST: Guess
  iw(0,4) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW 
  old_cw = cw(0,4);
  cw(0,4) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(0,4)] == 0);
  ASSUME(active[cw(0,4)] == 0);
  ASSUME(sforbid(4,cw(0,4))== 0);
  ASSUME(iw(0,4) >= 0);
  ASSUME(iw(0,4) >= 0);
  ASSUME(cw(0,4) >= iw(0,4));
  ASSUME(cw(0,4) >= old_cw);
  ASSUME(cw(0,4) >= cr(0,4));
  ASSUME(cw(0,4) >= cl[0]);
  ASSUME(cw(0,4) >= cisb[0]);
  ASSUME(cw(0,4) >= cdy[0]);
  ASSUME(cw(0,4) >= cdl[0]);
  ASSUME(cw(0,4) >= cds[0]);
  ASSUME(cw(0,4) >= cctrl[0]);
  ASSUME(cw(0,4) >= caddr[0]);
  // Update
  caddr[0] = max(caddr[0],0);
  buff(0,4) = 0;
  mem(4,cw(0,4)) = 0;
  co(4,cw(0,4))+=1;
  delta(4,cw(0,4)) = -1;
  ASSUME(creturn[0] >= cw(0,4));

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X4_1, metadata !182, metadata !DIExpression()), !dbg !249

  //   call void @llvm.dbg.value(metadata i64 0, metadata !184, metadata !DIExpression()), !dbg !249

  //   store atomic i64 0, i64* @atom_1_X4_1 monotonic, align 8, !dbg !134
  // ST: Guess
  iw(0,5) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW 
  old_cw = cw(0,5);
  cw(0,5) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(0,5)] == 0);
  ASSUME(active[cw(0,5)] == 0);
  ASSUME(sforbid(5,cw(0,5))== 0);
  ASSUME(iw(0,5) >= 0);
  ASSUME(iw(0,5) >= 0);
  ASSUME(cw(0,5) >= iw(0,5));
  ASSUME(cw(0,5) >= old_cw);
  ASSUME(cw(0,5) >= cr(0,5));
  ASSUME(cw(0,5) >= cl[0]);
  ASSUME(cw(0,5) >= cisb[0]);
  ASSUME(cw(0,5) >= cdy[0]);
  ASSUME(cw(0,5) >= cdl[0]);
  ASSUME(cw(0,5) >= cds[0]);
  ASSUME(cw(0,5) >= cctrl[0]);
  ASSUME(cw(0,5) >= caddr[0]);
  // Update
  caddr[0] = max(caddr[0],0);
  buff(0,5) = 0;
  mem(5,cw(0,5)) = 0;
  co(5,cw(0,5))+=1;
  delta(5,cw(0,5)) = -1;
  ASSUME(creturn[0] >= cw(0,5));

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X7_1, metadata !185, metadata !DIExpression()), !dbg !251

  //   call void @llvm.dbg.value(metadata i64 0, metadata !187, metadata !DIExpression()), !dbg !251

  //   store atomic i64 0, i64* @atom_1_X7_1 monotonic, align 8, !dbg !136
  // ST: Guess
  iw(0,6) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW 
  old_cw = cw(0,6);
  cw(0,6) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(0,6)] == 0);
  ASSUME(active[cw(0,6)] == 0);
  ASSUME(sforbid(6,cw(0,6))== 0);
  ASSUME(iw(0,6) >= 0);
  ASSUME(iw(0,6) >= 0);
  ASSUME(cw(0,6) >= iw(0,6));
  ASSUME(cw(0,6) >= old_cw);
  ASSUME(cw(0,6) >= cr(0,6));
  ASSUME(cw(0,6) >= cl[0]);
  ASSUME(cw(0,6) >= cisb[0]);
  ASSUME(cw(0,6) >= cdy[0]);
  ASSUME(cw(0,6) >= cdl[0]);
  ASSUME(cw(0,6) >= cds[0]);
  ASSUME(cw(0,6) >= cctrl[0]);
  ASSUME(cw(0,6) >= caddr[0]);
  // Update
  caddr[0] = max(caddr[0],0);
  buff(0,6) = 0;
  mem(6,cw(0,6)) = 0;
  co(6,cw(0,6))+=1;
  delta(6,cw(0,6)) = -1;
  ASSUME(creturn[0] >= cw(0,6));

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X8_0, metadata !188, metadata !DIExpression()), !dbg !253

  //   call void @llvm.dbg.value(metadata i64 0, metadata !190, metadata !DIExpression()), !dbg !253

  //   store atomic i64 0, i64* @atom_1_X8_0 monotonic, align 8, !dbg !138
  // ST: Guess
  iw(0,7) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW 
  old_cw = cw(0,7);
  cw(0,7) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(0,7)] == 0);
  ASSUME(active[cw(0,7)] == 0);
  ASSUME(sforbid(7,cw(0,7))== 0);
  ASSUME(iw(0,7) >= 0);
  ASSUME(iw(0,7) >= 0);
  ASSUME(cw(0,7) >= iw(0,7));
  ASSUME(cw(0,7) >= old_cw);
  ASSUME(cw(0,7) >= cr(0,7));
  ASSUME(cw(0,7) >= cl[0]);
  ASSUME(cw(0,7) >= cisb[0]);
  ASSUME(cw(0,7) >= cdy[0]);
  ASSUME(cw(0,7) >= cdl[0]);
  ASSUME(cw(0,7) >= cds[0]);
  ASSUME(cw(0,7) >= cctrl[0]);
  ASSUME(cw(0,7) >= caddr[0]);
  // Update
  caddr[0] = max(caddr[0],0);
  buff(0,7) = 0;
  mem(7,cw(0,7)) = 0;
  co(7,cw(0,7))+=1;
  delta(7,cw(0,7)) = -1;
  ASSUME(creturn[0] >= cw(0,7));

  //   %call = call i32 @pthread_create(i64* noundef %thr0, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t0, i8* noundef null) #7, !dbg !139
  // dumbsy: Guess
  old_cdy = cdy[0];
  cdy[0] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[0] >= old_cdy);
  ASSUME(cdy[0] >= cisb[0]);
  ASSUME(cdy[0] >= cdl[0]);
  ASSUME(cdy[0] >= cds[0]);
  ASSUME(cdy[0] >= cctrl[0]);
  ASSUME(cdy[0] >= cw(0,0+0));
  ASSUME(cdy[0] >= cw(0,0+1));
  ASSUME(cdy[0] >= cw(0,0+2));
  ASSUME(cdy[0] >= cw(0,0+3));
  ASSUME(cdy[0] >= cw(0,4+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[1] >= cdy[0]);

  //   %call15 = call i32 @pthread_create(i64* noundef %thr1, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t1, i8* noundef null) #7, !dbg !140
  // dumbsy: Guess
  old_cdy = cdy[0];
  cdy[0] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[0] >= old_cdy);
  ASSUME(cdy[0] >= cisb[0]);
  ASSUME(cdy[0] >= cdl[0]);
  ASSUME(cdy[0] >= cds[0]);
  ASSUME(cdy[0] >= cctrl[0]);
  ASSUME(cdy[0] >= cw(0,0+0));
  ASSUME(cdy[0] >= cw(0,0+1));
  ASSUME(cdy[0] >= cw(0,0+2));
  ASSUME(cdy[0] >= cw(0,0+3));
  ASSUME(cdy[0] >= cw(0,4+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[2] >= cdy[0]);

  //   %2 = load i64, i64* %thr0, align 8, !dbg !141, !tbaa !142
  // LD: Guess
  old_cr = cr(0,8);
  cr(0,8) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(0,8)] == 0);
  ASSUME(cr(0,8) >= iw(0,8));
  ASSUME(cr(0,8) >= 0);
  ASSUME(cr(0,8) >= cdy[0]);
  ASSUME(cr(0,8) >= cisb[0]);
  ASSUME(cr(0,8) >= cdl[0]);
  ASSUME(cr(0,8) >= cl[0]);
  // Update
  creg_r5 = cr(0,8);
  crmax(0,8) = max(crmax(0,8),cr(0,8));
  caddr[0] = max(caddr[0],0);
  if(cr(0,8) < cw(0,8)) {
    r5 = buff(0,8);
    ASSUME((!(( (cw(0,8) < 1) && (1 < crmax(0,8)) )))||(sforbid(8,1)> 0));
    ASSUME((!(( (cw(0,8) < 2) && (2 < crmax(0,8)) )))||(sforbid(8,2)> 0));
    ASSUME((!(( (cw(0,8) < 3) && (3 < crmax(0,8)) )))||(sforbid(8,3)> 0));
    ASSUME((!(( (cw(0,8) < 4) && (4 < crmax(0,8)) )))||(sforbid(8,4)> 0));
  } else {
    if(pw(0,8) != co(8,cr(0,8))) {
      ASSUME(cr(0,8) >= old_cr);
    }
    pw(0,8) = co(8,cr(0,8));
    r5 = mem(8,cr(0,8));
  }
  ASSUME(creturn[0] >= cr(0,8));

  //   %call16 = call i32 @pthread_join(i64 noundef %2, i8** noundef null), !dbg !146
  // dumbsy: Guess
  old_cdy = cdy[0];
  cdy[0] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[0] >= old_cdy);
  ASSUME(cdy[0] >= cisb[0]);
  ASSUME(cdy[0] >= cdl[0]);
  ASSUME(cdy[0] >= cds[0]);
  ASSUME(cdy[0] >= cctrl[0]);
  ASSUME(cdy[0] >= cw(0,0+0));
  ASSUME(cdy[0] >= cw(0,0+1));
  ASSUME(cdy[0] >= cw(0,0+2));
  ASSUME(cdy[0] >= cw(0,0+3));
  ASSUME(cdy[0] >= cw(0,4+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[1]);

  //   %3 = load i64, i64* %thr1, align 8, !dbg !147, !tbaa !142
  // LD: Guess
  old_cr = cr(0,9);
  cr(0,9) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(0,9)] == 0);
  ASSUME(cr(0,9) >= iw(0,9));
  ASSUME(cr(0,9) >= 0);
  ASSUME(cr(0,9) >= cdy[0]);
  ASSUME(cr(0,9) >= cisb[0]);
  ASSUME(cr(0,9) >= cdl[0]);
  ASSUME(cr(0,9) >= cl[0]);
  // Update
  creg_r6 = cr(0,9);
  crmax(0,9) = max(crmax(0,9),cr(0,9));
  caddr[0] = max(caddr[0],0);
  if(cr(0,9) < cw(0,9)) {
    r6 = buff(0,9);
    ASSUME((!(( (cw(0,9) < 1) && (1 < crmax(0,9)) )))||(sforbid(9,1)> 0));
    ASSUME((!(( (cw(0,9) < 2) && (2 < crmax(0,9)) )))||(sforbid(9,2)> 0));
    ASSUME((!(( (cw(0,9) < 3) && (3 < crmax(0,9)) )))||(sforbid(9,3)> 0));
    ASSUME((!(( (cw(0,9) < 4) && (4 < crmax(0,9)) )))||(sforbid(9,4)> 0));
  } else {
    if(pw(0,9) != co(9,cr(0,9))) {
      ASSUME(cr(0,9) >= old_cr);
    }
    pw(0,9) = co(9,cr(0,9));
    r6 = mem(9,cr(0,9));
  }
  ASSUME(creturn[0] >= cr(0,9));

  //   %call17 = call i32 @pthread_join(i64 noundef %3, i8** noundef null), !dbg !148
  // dumbsy: Guess
  old_cdy = cdy[0];
  cdy[0] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[0] >= old_cdy);
  ASSUME(cdy[0] >= cisb[0]);
  ASSUME(cdy[0] >= cdl[0]);
  ASSUME(cdy[0] >= cds[0]);
  ASSUME(cdy[0] >= cctrl[0]);
  ASSUME(cdy[0] >= cw(0,0+0));
  ASSUME(cdy[0] >= cw(0,0+1));
  ASSUME(cdy[0] >= cw(0,0+2));
  ASSUME(cdy[0] >= cw(0,0+3));
  ASSUME(cdy[0] >= cw(0,4+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[2]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 3), metadata !192, metadata !DIExpression()), !dbg !265

  //   %4 = load atomic i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 3) seq_cst, align 8, !dbg !150
  // LD: Guess
  old_cr = cr(0,0+3*1);
  cr(0,0+3*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(0,0+3*1)] == 0);
  ASSUME(cr(0,0+3*1) >= iw(0,0+3*1));
  ASSUME(cr(0,0+3*1) >= 0);
  ASSUME(cr(0,0+3*1) >= cdy[0]);
  ASSUME(cr(0,0+3*1) >= cisb[0]);
  ASSUME(cr(0,0+3*1) >= cdl[0]);
  ASSUME(cr(0,0+3*1) >= cl[0]);
  // Update
  creg_r7 = cr(0,0+3*1);
  crmax(0,0+3*1) = max(crmax(0,0+3*1),cr(0,0+3*1));
  caddr[0] = max(caddr[0],0);
  if(cr(0,0+3*1) < cw(0,0+3*1)) {
    r7 = buff(0,0+3*1);
    ASSUME((!(( (cw(0,0+3*1) < 1) && (1 < crmax(0,0+3*1)) )))||(sforbid(0+3*1,1)> 0));
    ASSUME((!(( (cw(0,0+3*1) < 2) && (2 < crmax(0,0+3*1)) )))||(sforbid(0+3*1,2)> 0));
    ASSUME((!(( (cw(0,0+3*1) < 3) && (3 < crmax(0,0+3*1)) )))||(sforbid(0+3*1,3)> 0));
    ASSUME((!(( (cw(0,0+3*1) < 4) && (4 < crmax(0,0+3*1)) )))||(sforbid(0+3*1,4)> 0));
  } else {
    if(pw(0,0+3*1) != co(0+3*1,cr(0,0+3*1))) {
      ASSUME(cr(0,0+3*1) >= old_cr);
    }
    pw(0,0+3*1) = co(0+3*1,cr(0,0+3*1));
    r7 = mem(0+3*1,cr(0,0+3*1));
  }
  ASSUME(creturn[0] >= cr(0,0+3*1));

  //   call void @llvm.dbg.value(metadata i64 %4, metadata !194, metadata !DIExpression()), !dbg !265

  //   %conv = trunc i64 %4 to i32, !dbg !151

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !191, metadata !DIExpression()), !dbg !234

  //   %cmp = icmp eq i32 %conv, 1, !dbg !152

  //   %conv18 = zext i1 %cmp to i32, !dbg !152

  //   call void @llvm.dbg.value(metadata i32 %conv18, metadata !195, metadata !DIExpression()), !dbg !234

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 0), metadata !197, metadata !DIExpression()), !dbg !269

  //   %5 = load atomic i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 0) seq_cst, align 8, !dbg !154
  // LD: Guess
  old_cr = cr(0,0);
  cr(0,0) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(0,0)] == 0);
  ASSUME(cr(0,0) >= iw(0,0));
  ASSUME(cr(0,0) >= 0);
  ASSUME(cr(0,0) >= cdy[0]);
  ASSUME(cr(0,0) >= cisb[0]);
  ASSUME(cr(0,0) >= cdl[0]);
  ASSUME(cr(0,0) >= cl[0]);
  // Update
  creg_r8 = cr(0,0);
  crmax(0,0) = max(crmax(0,0),cr(0,0));
  caddr[0] = max(caddr[0],0);
  if(cr(0,0) < cw(0,0)) {
    r8 = buff(0,0);
    ASSUME((!(( (cw(0,0) < 1) && (1 < crmax(0,0)) )))||(sforbid(0,1)> 0));
    ASSUME((!(( (cw(0,0) < 2) && (2 < crmax(0,0)) )))||(sforbid(0,2)> 0));
    ASSUME((!(( (cw(0,0) < 3) && (3 < crmax(0,0)) )))||(sforbid(0,3)> 0));
    ASSUME((!(( (cw(0,0) < 4) && (4 < crmax(0,0)) )))||(sforbid(0,4)> 0));
  } else {
    if(pw(0,0) != co(0,cr(0,0))) {
      ASSUME(cr(0,0) >= old_cr);
    }
    pw(0,0) = co(0,cr(0,0));
    r8 = mem(0,cr(0,0));
  }
  ASSUME(creturn[0] >= cr(0,0));

  //   call void @llvm.dbg.value(metadata i64 %5, metadata !199, metadata !DIExpression()), !dbg !269

  //   %conv22 = trunc i64 %5 to i32, !dbg !155

  //   call void @llvm.dbg.value(metadata i32 %conv22, metadata !196, metadata !DIExpression()), !dbg !234

  //   %cmp23 = icmp eq i32 %conv22, 1, !dbg !156

  //   %conv24 = zext i1 %cmp23 to i32, !dbg !156

  //   call void @llvm.dbg.value(metadata i32 %conv24, metadata !200, metadata !DIExpression()), !dbg !234

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 1), metadata !202, metadata !DIExpression()), !dbg !273

  //   %6 = load atomic i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 1) seq_cst, align 8, !dbg !158
  // LD: Guess
  old_cr = cr(0,0+1*1);
  cr(0,0+1*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(0,0+1*1)] == 0);
  ASSUME(cr(0,0+1*1) >= iw(0,0+1*1));
  ASSUME(cr(0,0+1*1) >= 0);
  ASSUME(cr(0,0+1*1) >= cdy[0]);
  ASSUME(cr(0,0+1*1) >= cisb[0]);
  ASSUME(cr(0,0+1*1) >= cdl[0]);
  ASSUME(cr(0,0+1*1) >= cl[0]);
  // Update
  creg_r9 = cr(0,0+1*1);
  crmax(0,0+1*1) = max(crmax(0,0+1*1),cr(0,0+1*1));
  caddr[0] = max(caddr[0],0);
  if(cr(0,0+1*1) < cw(0,0+1*1)) {
    r9 = buff(0,0+1*1);
    ASSUME((!(( (cw(0,0+1*1) < 1) && (1 < crmax(0,0+1*1)) )))||(sforbid(0+1*1,1)> 0));
    ASSUME((!(( (cw(0,0+1*1) < 2) && (2 < crmax(0,0+1*1)) )))||(sforbid(0+1*1,2)> 0));
    ASSUME((!(( (cw(0,0+1*1) < 3) && (3 < crmax(0,0+1*1)) )))||(sforbid(0+1*1,3)> 0));
    ASSUME((!(( (cw(0,0+1*1) < 4) && (4 < crmax(0,0+1*1)) )))||(sforbid(0+1*1,4)> 0));
  } else {
    if(pw(0,0+1*1) != co(0+1*1,cr(0,0+1*1))) {
      ASSUME(cr(0,0+1*1) >= old_cr);
    }
    pw(0,0+1*1) = co(0+1*1,cr(0,0+1*1));
    r9 = mem(0+1*1,cr(0,0+1*1));
  }
  ASSUME(creturn[0] >= cr(0,0+1*1));

  //   call void @llvm.dbg.value(metadata i64 %6, metadata !204, metadata !DIExpression()), !dbg !273

  //   %conv28 = trunc i64 %6 to i32, !dbg !159

  //   call void @llvm.dbg.value(metadata i32 %conv28, metadata !201, metadata !DIExpression()), !dbg !234

  //   %cmp29 = icmp eq i32 %conv28, 1, !dbg !160

  //   %conv30 = zext i1 %cmp29 to i32, !dbg !160

  //   call void @llvm.dbg.value(metadata i32 %conv30, metadata !205, metadata !DIExpression()), !dbg !234

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 2), metadata !207, metadata !DIExpression()), !dbg !277

  //   %7 = load atomic i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 2) seq_cst, align 8, !dbg !162
  // LD: Guess
  old_cr = cr(0,0+2*1);
  cr(0,0+2*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(0,0+2*1)] == 0);
  ASSUME(cr(0,0+2*1) >= iw(0,0+2*1));
  ASSUME(cr(0,0+2*1) >= 0);
  ASSUME(cr(0,0+2*1) >= cdy[0]);
  ASSUME(cr(0,0+2*1) >= cisb[0]);
  ASSUME(cr(0,0+2*1) >= cdl[0]);
  ASSUME(cr(0,0+2*1) >= cl[0]);
  // Update
  creg_r10 = cr(0,0+2*1);
  crmax(0,0+2*1) = max(crmax(0,0+2*1),cr(0,0+2*1));
  caddr[0] = max(caddr[0],0);
  if(cr(0,0+2*1) < cw(0,0+2*1)) {
    r10 = buff(0,0+2*1);
    ASSUME((!(( (cw(0,0+2*1) < 1) && (1 < crmax(0,0+2*1)) )))||(sforbid(0+2*1,1)> 0));
    ASSUME((!(( (cw(0,0+2*1) < 2) && (2 < crmax(0,0+2*1)) )))||(sforbid(0+2*1,2)> 0));
    ASSUME((!(( (cw(0,0+2*1) < 3) && (3 < crmax(0,0+2*1)) )))||(sforbid(0+2*1,3)> 0));
    ASSUME((!(( (cw(0,0+2*1) < 4) && (4 < crmax(0,0+2*1)) )))||(sforbid(0+2*1,4)> 0));
  } else {
    if(pw(0,0+2*1) != co(0+2*1,cr(0,0+2*1))) {
      ASSUME(cr(0,0+2*1) >= old_cr);
    }
    pw(0,0+2*1) = co(0+2*1,cr(0,0+2*1));
    r10 = mem(0+2*1,cr(0,0+2*1));
  }
  ASSUME(creturn[0] >= cr(0,0+2*1));

  //   call void @llvm.dbg.value(metadata i64 %7, metadata !209, metadata !DIExpression()), !dbg !277

  //   %conv34 = trunc i64 %7 to i32, !dbg !163

  //   call void @llvm.dbg.value(metadata i32 %conv34, metadata !206, metadata !DIExpression()), !dbg !234

  //   %cmp35 = icmp eq i32 %conv34, 1, !dbg !164

  //   %conv36 = zext i1 %cmp35 to i32, !dbg !164

  //   call void @llvm.dbg.value(metadata i32 %conv36, metadata !210, metadata !DIExpression()), !dbg !234

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X0_1, metadata !212, metadata !DIExpression()), !dbg !281

  //   %8 = load atomic i64, i64* @atom_1_X0_1 seq_cst, align 8, !dbg !166
  // LD: Guess
  old_cr = cr(0,4);
  cr(0,4) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(0,4)] == 0);
  ASSUME(cr(0,4) >= iw(0,4));
  ASSUME(cr(0,4) >= 0);
  ASSUME(cr(0,4) >= cdy[0]);
  ASSUME(cr(0,4) >= cisb[0]);
  ASSUME(cr(0,4) >= cdl[0]);
  ASSUME(cr(0,4) >= cl[0]);
  // Update
  creg_r11 = cr(0,4);
  crmax(0,4) = max(crmax(0,4),cr(0,4));
  caddr[0] = max(caddr[0],0);
  if(cr(0,4) < cw(0,4)) {
    r11 = buff(0,4);
    ASSUME((!(( (cw(0,4) < 1) && (1 < crmax(0,4)) )))||(sforbid(4,1)> 0));
    ASSUME((!(( (cw(0,4) < 2) && (2 < crmax(0,4)) )))||(sforbid(4,2)> 0));
    ASSUME((!(( (cw(0,4) < 3) && (3 < crmax(0,4)) )))||(sforbid(4,3)> 0));
    ASSUME((!(( (cw(0,4) < 4) && (4 < crmax(0,4)) )))||(sforbid(4,4)> 0));
  } else {
    if(pw(0,4) != co(4,cr(0,4))) {
      ASSUME(cr(0,4) >= old_cr);
    }
    pw(0,4) = co(4,cr(0,4));
    r11 = mem(4,cr(0,4));
  }
  ASSUME(creturn[0] >= cr(0,4));

  //   call void @llvm.dbg.value(metadata i64 %8, metadata !214, metadata !DIExpression()), !dbg !281

  //   %conv40 = trunc i64 %8 to i32, !dbg !167

  //   call void @llvm.dbg.value(metadata i32 %conv40, metadata !211, metadata !DIExpression()), !dbg !234

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X4_1, metadata !216, metadata !DIExpression()), !dbg !284

  //   %9 = load atomic i64, i64* @atom_1_X4_1 seq_cst, align 8, !dbg !169
  // LD: Guess
  old_cr = cr(0,5);
  cr(0,5) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(0,5)] == 0);
  ASSUME(cr(0,5) >= iw(0,5));
  ASSUME(cr(0,5) >= 0);
  ASSUME(cr(0,5) >= cdy[0]);
  ASSUME(cr(0,5) >= cisb[0]);
  ASSUME(cr(0,5) >= cdl[0]);
  ASSUME(cr(0,5) >= cl[0]);
  // Update
  creg_r12 = cr(0,5);
  crmax(0,5) = max(crmax(0,5),cr(0,5));
  caddr[0] = max(caddr[0],0);
  if(cr(0,5) < cw(0,5)) {
    r12 = buff(0,5);
    ASSUME((!(( (cw(0,5) < 1) && (1 < crmax(0,5)) )))||(sforbid(5,1)> 0));
    ASSUME((!(( (cw(0,5) < 2) && (2 < crmax(0,5)) )))||(sforbid(5,2)> 0));
    ASSUME((!(( (cw(0,5) < 3) && (3 < crmax(0,5)) )))||(sforbid(5,3)> 0));
    ASSUME((!(( (cw(0,5) < 4) && (4 < crmax(0,5)) )))||(sforbid(5,4)> 0));
  } else {
    if(pw(0,5) != co(5,cr(0,5))) {
      ASSUME(cr(0,5) >= old_cr);
    }
    pw(0,5) = co(5,cr(0,5));
    r12 = mem(5,cr(0,5));
  }
  ASSUME(creturn[0] >= cr(0,5));

  //   call void @llvm.dbg.value(metadata i64 %9, metadata !218, metadata !DIExpression()), !dbg !284

  //   %conv44 = trunc i64 %9 to i32, !dbg !170

  //   call void @llvm.dbg.value(metadata i32 %conv44, metadata !215, metadata !DIExpression()), !dbg !234

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X7_1, metadata !220, metadata !DIExpression()), !dbg !287

  //   %10 = load atomic i64, i64* @atom_1_X7_1 seq_cst, align 8, !dbg !172
  // LD: Guess
  old_cr = cr(0,6);
  cr(0,6) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(0,6)] == 0);
  ASSUME(cr(0,6) >= iw(0,6));
  ASSUME(cr(0,6) >= 0);
  ASSUME(cr(0,6) >= cdy[0]);
  ASSUME(cr(0,6) >= cisb[0]);
  ASSUME(cr(0,6) >= cdl[0]);
  ASSUME(cr(0,6) >= cl[0]);
  // Update
  creg_r13 = cr(0,6);
  crmax(0,6) = max(crmax(0,6),cr(0,6));
  caddr[0] = max(caddr[0],0);
  if(cr(0,6) < cw(0,6)) {
    r13 = buff(0,6);
    ASSUME((!(( (cw(0,6) < 1) && (1 < crmax(0,6)) )))||(sforbid(6,1)> 0));
    ASSUME((!(( (cw(0,6) < 2) && (2 < crmax(0,6)) )))||(sforbid(6,2)> 0));
    ASSUME((!(( (cw(0,6) < 3) && (3 < crmax(0,6)) )))||(sforbid(6,3)> 0));
    ASSUME((!(( (cw(0,6) < 4) && (4 < crmax(0,6)) )))||(sforbid(6,4)> 0));
  } else {
    if(pw(0,6) != co(6,cr(0,6))) {
      ASSUME(cr(0,6) >= old_cr);
    }
    pw(0,6) = co(6,cr(0,6));
    r13 = mem(6,cr(0,6));
  }
  ASSUME(creturn[0] >= cr(0,6));

  //   call void @llvm.dbg.value(metadata i64 %10, metadata !222, metadata !DIExpression()), !dbg !287

  //   %conv48 = trunc i64 %10 to i32, !dbg !173

  //   call void @llvm.dbg.value(metadata i32 %conv48, metadata !219, metadata !DIExpression()), !dbg !234

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X8_0, metadata !224, metadata !DIExpression()), !dbg !290

  //   %11 = load atomic i64, i64* @atom_1_X8_0 seq_cst, align 8, !dbg !175
  // LD: Guess
  old_cr = cr(0,7);
  cr(0,7) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(0,7)] == 0);
  ASSUME(cr(0,7) >= iw(0,7));
  ASSUME(cr(0,7) >= 0);
  ASSUME(cr(0,7) >= cdy[0]);
  ASSUME(cr(0,7) >= cisb[0]);
  ASSUME(cr(0,7) >= cdl[0]);
  ASSUME(cr(0,7) >= cl[0]);
  // Update
  creg_r14 = cr(0,7);
  crmax(0,7) = max(crmax(0,7),cr(0,7));
  caddr[0] = max(caddr[0],0);
  if(cr(0,7) < cw(0,7)) {
    r14 = buff(0,7);
    ASSUME((!(( (cw(0,7) < 1) && (1 < crmax(0,7)) )))||(sforbid(7,1)> 0));
    ASSUME((!(( (cw(0,7) < 2) && (2 < crmax(0,7)) )))||(sforbid(7,2)> 0));
    ASSUME((!(( (cw(0,7) < 3) && (3 < crmax(0,7)) )))||(sforbid(7,3)> 0));
    ASSUME((!(( (cw(0,7) < 4) && (4 < crmax(0,7)) )))||(sforbid(7,4)> 0));
  } else {
    if(pw(0,7) != co(7,cr(0,7))) {
      ASSUME(cr(0,7) >= old_cr);
    }
    pw(0,7) = co(7,cr(0,7));
    r14 = mem(7,cr(0,7));
  }
  ASSUME(creturn[0] >= cr(0,7));

  //   call void @llvm.dbg.value(metadata i64 %11, metadata !226, metadata !DIExpression()), !dbg !290

  //   %conv52 = trunc i64 %11 to i32, !dbg !176

  //   call void @llvm.dbg.value(metadata i32 %conv52, metadata !223, metadata !DIExpression()), !dbg !234

  //   %and = and i32 %conv48, %conv52, !dbg !177
  creg_r15 = max(creg_r13,creg_r14);
  ASSUME(active[creg_r15] == 0);
  r15 = r13 & r14;

  //   call void @llvm.dbg.value(metadata i32 %and, metadata !227, metadata !DIExpression()), !dbg !234

  //   %and53 = and i32 %conv44, %and, !dbg !178
  creg_r16 = max(creg_r12,creg_r15);
  ASSUME(active[creg_r16] == 0);
  r16 = r12 & r15;

  //   call void @llvm.dbg.value(metadata i32 %and53, metadata !228, metadata !DIExpression()), !dbg !234

  //   %and54 = and i32 %conv40, %and53, !dbg !179
  creg_r17 = max(creg_r11,creg_r16);
  ASSUME(active[creg_r17] == 0);
  r17 = r11 & r16;

  //   call void @llvm.dbg.value(metadata i32 %and54, metadata !229, metadata !DIExpression()), !dbg !234

  //   %and55 = and i32 %conv36, %and54, !dbg !180
  creg_r18 = max(max(creg_r10,0),creg_r17);
  ASSUME(active[creg_r18] == 0);
  r18 = (r10==1) & r17;

  //   call void @llvm.dbg.value(metadata i32 %and55, metadata !230, metadata !DIExpression()), !dbg !234

  //   %and56 = and i32 %conv30, %and55, !dbg !181
  creg_r19 = max(max(creg_r9,0),creg_r18);
  ASSUME(active[creg_r19] == 0);
  r19 = (r9==1) & r18;

  //   call void @llvm.dbg.value(metadata i32 %and56, metadata !231, metadata !DIExpression()), !dbg !234

  //   %and57 = and i32 %conv24, %and56, !dbg !182
  creg_r20 = max(max(creg_r8,0),creg_r19);
  ASSUME(active[creg_r20] == 0);
  r20 = (r8==1) & r19;

  //   call void @llvm.dbg.value(metadata i32 %and57, metadata !232, metadata !DIExpression()), !dbg !234

  //   %and58 = and i32 %conv18, %and57, !dbg !183
  creg_r21 = max(max(creg_r7,0),creg_r20);
  ASSUME(active[creg_r21] == 0);
  r21 = (r7==1) & r20;

  //   call void @llvm.dbg.value(metadata i32 %and58, metadata !233, metadata !DIExpression()), !dbg !234

  //   %cmp59 = icmp eq i32 %and58, 1, !dbg !184

  //   br i1 %cmp59, label %if.then, label %if.end, !dbg !186
  old_cctrl = cctrl[0];
  cctrl[0] = get_rng(0,NCONTEXT-1);
  ASSUME(cctrl[0] >= old_cctrl);
  ASSUME(cctrl[0] >= creg_r21);
  ASSUME(cctrl[0] >= 0);
  if((r21==1)) {
    goto T0BLOCK1;
  } else {
    goto T0BLOCK2;
  }

T0BLOCK1:
  //   call void @__assert_fail(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([117 x i8], [117 x i8]* @.str.1, i64 0, i64 0), i32 noundef 91, i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #8, !dbg !187

  //   unreachable, !dbg !187
  r22 = 1;

T0BLOCK2:
  //   %12 = bitcast i64* %thr1 to i8*, !dbg !190

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %12) #7, !dbg !190

  //   %13 = bitcast i64* %thr0 to i8*, !dbg !190

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %13) #7, !dbg !190

  //   ret i32 0, !dbg !191
  ret_thread_0 = 0;


  ASSUME(meminit(0,1) == mem(0,0));
  ASSUME(coinit(0,1) == co(0,0));
  ASSUME(deltainit(0,1) == delta(0,0));
  ASSUME(meminit(0,2) == mem(0,1));
  ASSUME(coinit(0,2) == co(0,1));
  ASSUME(deltainit(0,2) == delta(0,1));
  ASSUME(meminit(0,3) == mem(0,2));
  ASSUME(coinit(0,3) == co(0,2));
  ASSUME(deltainit(0,3) == delta(0,2));
  ASSUME(meminit(0,4) == mem(0,3));
  ASSUME(coinit(0,4) == co(0,3));
  ASSUME(deltainit(0,4) == delta(0,3));
  ASSUME(meminit(1,1) == mem(1,0));
  ASSUME(coinit(1,1) == co(1,0));
  ASSUME(deltainit(1,1) == delta(1,0));
  ASSUME(meminit(1,2) == mem(1,1));
  ASSUME(coinit(1,2) == co(1,1));
  ASSUME(deltainit(1,2) == delta(1,1));
  ASSUME(meminit(1,3) == mem(1,2));
  ASSUME(coinit(1,3) == co(1,2));
  ASSUME(deltainit(1,3) == delta(1,2));
  ASSUME(meminit(1,4) == mem(1,3));
  ASSUME(coinit(1,4) == co(1,3));
  ASSUME(deltainit(1,4) == delta(1,3));
  ASSUME(meminit(2,1) == mem(2,0));
  ASSUME(coinit(2,1) == co(2,0));
  ASSUME(deltainit(2,1) == delta(2,0));
  ASSUME(meminit(2,2) == mem(2,1));
  ASSUME(coinit(2,2) == co(2,1));
  ASSUME(deltainit(2,2) == delta(2,1));
  ASSUME(meminit(2,3) == mem(2,2));
  ASSUME(coinit(2,3) == co(2,2));
  ASSUME(deltainit(2,3) == delta(2,2));
  ASSUME(meminit(2,4) == mem(2,3));
  ASSUME(coinit(2,4) == co(2,3));
  ASSUME(deltainit(2,4) == delta(2,3));
  ASSUME(meminit(3,1) == mem(3,0));
  ASSUME(coinit(3,1) == co(3,0));
  ASSUME(deltainit(3,1) == delta(3,0));
  ASSUME(meminit(3,2) == mem(3,1));
  ASSUME(coinit(3,2) == co(3,1));
  ASSUME(deltainit(3,2) == delta(3,1));
  ASSUME(meminit(3,3) == mem(3,2));
  ASSUME(coinit(3,3) == co(3,2));
  ASSUME(deltainit(3,3) == delta(3,2));
  ASSUME(meminit(3,4) == mem(3,3));
  ASSUME(coinit(3,4) == co(3,3));
  ASSUME(deltainit(3,4) == delta(3,3));
  ASSUME(meminit(4,1) == mem(4,0));
  ASSUME(coinit(4,1) == co(4,0));
  ASSUME(deltainit(4,1) == delta(4,0));
  ASSUME(meminit(4,2) == mem(4,1));
  ASSUME(coinit(4,2) == co(4,1));
  ASSUME(deltainit(4,2) == delta(4,1));
  ASSUME(meminit(4,3) == mem(4,2));
  ASSUME(coinit(4,3) == co(4,2));
  ASSUME(deltainit(4,3) == delta(4,2));
  ASSUME(meminit(4,4) == mem(4,3));
  ASSUME(coinit(4,4) == co(4,3));
  ASSUME(deltainit(4,4) == delta(4,3));
  ASSUME(meminit(5,1) == mem(5,0));
  ASSUME(coinit(5,1) == co(5,0));
  ASSUME(deltainit(5,1) == delta(5,0));
  ASSUME(meminit(5,2) == mem(5,1));
  ASSUME(coinit(5,2) == co(5,1));
  ASSUME(deltainit(5,2) == delta(5,1));
  ASSUME(meminit(5,3) == mem(5,2));
  ASSUME(coinit(5,3) == co(5,2));
  ASSUME(deltainit(5,3) == delta(5,2));
  ASSUME(meminit(5,4) == mem(5,3));
  ASSUME(coinit(5,4) == co(5,3));
  ASSUME(deltainit(5,4) == delta(5,3));
  ASSUME(meminit(6,1) == mem(6,0));
  ASSUME(coinit(6,1) == co(6,0));
  ASSUME(deltainit(6,1) == delta(6,0));
  ASSUME(meminit(6,2) == mem(6,1));
  ASSUME(coinit(6,2) == co(6,1));
  ASSUME(deltainit(6,2) == delta(6,1));
  ASSUME(meminit(6,3) == mem(6,2));
  ASSUME(coinit(6,3) == co(6,2));
  ASSUME(deltainit(6,3) == delta(6,2));
  ASSUME(meminit(6,4) == mem(6,3));
  ASSUME(coinit(6,4) == co(6,3));
  ASSUME(deltainit(6,4) == delta(6,3));
  ASSUME(meminit(7,1) == mem(7,0));
  ASSUME(coinit(7,1) == co(7,0));
  ASSUME(deltainit(7,1) == delta(7,0));
  ASSUME(meminit(7,2) == mem(7,1));
  ASSUME(coinit(7,2) == co(7,1));
  ASSUME(deltainit(7,2) == delta(7,1));
  ASSUME(meminit(7,3) == mem(7,2));
  ASSUME(coinit(7,3) == co(7,2));
  ASSUME(deltainit(7,3) == delta(7,2));
  ASSUME(meminit(7,4) == mem(7,3));
  ASSUME(coinit(7,4) == co(7,3));
  ASSUME(deltainit(7,4) == delta(7,3));
  ASSUME(meminit(8,1) == mem(8,0));
  ASSUME(coinit(8,1) == co(8,0));
  ASSUME(deltainit(8,1) == delta(8,0));
  ASSUME(meminit(8,2) == mem(8,1));
  ASSUME(coinit(8,2) == co(8,1));
  ASSUME(deltainit(8,2) == delta(8,1));
  ASSUME(meminit(8,3) == mem(8,2));
  ASSUME(coinit(8,3) == co(8,2));
  ASSUME(deltainit(8,3) == delta(8,2));
  ASSUME(meminit(8,4) == mem(8,3));
  ASSUME(coinit(8,4) == co(8,3));
  ASSUME(deltainit(8,4) == delta(8,3));
  ASSUME(meminit(9,1) == mem(9,0));
  ASSUME(coinit(9,1) == co(9,0));
  ASSUME(deltainit(9,1) == delta(9,0));
  ASSUME(meminit(9,2) == mem(9,1));
  ASSUME(coinit(9,2) == co(9,1));
  ASSUME(deltainit(9,2) == delta(9,1));
  ASSUME(meminit(9,3) == mem(9,2));
  ASSUME(coinit(9,3) == co(9,2));
  ASSUME(deltainit(9,3) == delta(9,2));
  ASSUME(meminit(9,4) == mem(9,3));
  ASSUME(coinit(9,4) == co(9,3));
  ASSUME(deltainit(9,4) == delta(9,3));

  ASSERT(r22== 0);

}
