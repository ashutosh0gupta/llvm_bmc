// 0:vars:4
// 6:atom_1_X9_0:1
// 4:atom_1_X0_1:1
// 5:atom_1_X2_1:1
// 7:thr0:1
// 8:thr1:1
#define ADDRSIZE 9
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


  int r0= 0;
  char creg_r0;
  int r1= 0;
  char creg_r1;
  int r2= 0;
  char creg_r2;
  int r3= 0;
  char creg_r3;
  int r4= 0;
  char creg_r4;
  int r5= 0;
  char creg_r5;
  int r6= 0;
  char creg_r6;
  int r7= 0;
  char creg_r7;
  int r8= 0;
  char creg_r8;
  int r9= 0;
  char creg_r9;
  int r10= 0;
  char creg_r10;
  int r11= 0;
  char creg_r11;
  int r12= 0;
  char creg_r12;
  int r13= 0;
  char creg_r13;
  int r14= 0;
  char creg_r14;
  int r15= 0;
  char creg_r15;
  int r16= 0;
  char creg_r16;
  int r17= 0;
  char creg_r17;
  int r18= 0;
  char creg_r18;
  int r19= 0;
  char creg_r19;
  int r20= 0;
  char creg_r20;
  int r21= 0;
  char creg_r21;
  int r22= 0;
  char creg_r22;
  int r23= 0;
  char creg_r23;
  char old_cctrl= 0;
  char old_cr= 0;
  char old_cdy= 0;
  char old_cw= 0;
  char new_creg= 0;
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
  mem(6+0,0) = 0;
  mem(4+0,0) = 0;
  mem(5+0,0) = 0;
  mem(7+0,0) = 0;
  mem(8+0,0) = 0;
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
  // Dumping thread 1
  int ret_thread_1 = 0;
  cdy[1] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[1] >= cstart[1]);
T1BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !37, metadata !DIExpression()), !dbg !46

  //   br label %label_1, !dbg !47
  goto T1BLOCK1;

T1BLOCK1:
  //   call void @llvm.dbg.label(metadata !45), !dbg !48

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 0), metadata !38, metadata !DIExpression()), !dbg !49

  //   call void @llvm.dbg.value(metadata i64 1, metadata !41, metadata !DIExpression()), !dbg !49

  //   store atomic i64 1, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !50
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

  //   call void (...) @dmbsy(), !dbg !51
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
  ASSUME(cdy[1] >= cw(1,6+0));
  ASSUME(cdy[1] >= cw(1,4+0));
  ASSUME(cdy[1] >= cw(1,5+0));
  ASSUME(cdy[1] >= cw(1,7+0));
  ASSUME(cdy[1] >= cw(1,8+0));
  ASSUME(cdy[1] >= cr(1,0+0));
  ASSUME(cdy[1] >= cr(1,0+1));
  ASSUME(cdy[1] >= cr(1,0+2));
  ASSUME(cdy[1] >= cr(1,0+3));
  ASSUME(cdy[1] >= cr(1,6+0));
  ASSUME(cdy[1] >= cr(1,4+0));
  ASSUME(cdy[1] >= cr(1,5+0));
  ASSUME(cdy[1] >= cr(1,7+0));
  ASSUME(cdy[1] >= cr(1,8+0));
  ASSUME(creturn[1] >= cdy[1]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 1), metadata !42, metadata !DIExpression()), !dbg !52

  //   call void @llvm.dbg.value(metadata i64 1, metadata !44, metadata !DIExpression()), !dbg !52

  //   store atomic i64 1, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !53
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

  //   ret i8* null, !dbg !54
  ret_thread_1 = (- 1);


  // Dumping thread 2
  int ret_thread_2 = 0;
  cdy[2] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[2] >= cstart[2]);
T2BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !57, metadata !DIExpression()), !dbg !95

  //   br label %label_2, !dbg !77
  goto T2BLOCK1;

T2BLOCK1:
  //   call void @llvm.dbg.label(metadata !93), !dbg !97

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 1), metadata !60, metadata !DIExpression()), !dbg !98

  //   %0 = load atomic i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !80
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

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !62, metadata !DIExpression()), !dbg !98

  //   %conv = trunc i64 %0 to i32, !dbg !81

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !58, metadata !DIExpression()), !dbg !95

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 1), metadata !64, metadata !DIExpression()), !dbg !101

  //   %1 = load atomic i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !83
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
  creg_r1 = cr(2,0+1*1);
  crmax(2,0+1*1) = max(crmax(2,0+1*1),cr(2,0+1*1));
  caddr[2] = max(caddr[2],0);
  if(cr(2,0+1*1) < cw(2,0+1*1)) {
    r1 = buff(2,0+1*1);
    ASSUME((!(( (cw(2,0+1*1) < 1) && (1 < crmax(2,0+1*1)) )))||(sforbid(0+1*1,1)> 0));
    ASSUME((!(( (cw(2,0+1*1) < 2) && (2 < crmax(2,0+1*1)) )))||(sforbid(0+1*1,2)> 0));
    ASSUME((!(( (cw(2,0+1*1) < 3) && (3 < crmax(2,0+1*1)) )))||(sforbid(0+1*1,3)> 0));
    ASSUME((!(( (cw(2,0+1*1) < 4) && (4 < crmax(2,0+1*1)) )))||(sforbid(0+1*1,4)> 0));
  } else {
    if(pw(2,0+1*1) != co(0+1*1,cr(2,0+1*1))) {
      ASSUME(cr(2,0+1*1) >= old_cr);
    }
    pw(2,0+1*1) = co(0+1*1,cr(2,0+1*1));
    r1 = mem(0+1*1,cr(2,0+1*1));
  }
  ASSUME(creturn[2] >= cr(2,0+1*1));

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !66, metadata !DIExpression()), !dbg !101

  //   %conv4 = trunc i64 %1 to i32, !dbg !84

  //   call void @llvm.dbg.value(metadata i32 %conv4, metadata !63, metadata !DIExpression()), !dbg !95

  //   %xor = xor i32 %conv4, %conv4, !dbg !85
  creg_r2 = max(creg_r1,creg_r1);
  ASSUME(active[creg_r2] == 2);
  r2 = r1 ^ r1;

  //   call void @llvm.dbg.value(metadata i32 %xor, metadata !67, metadata !DIExpression()), !dbg !95

  //   %add = add nsw i32 2, %xor, !dbg !86
  creg_r3 = max(0,creg_r2);
  ASSUME(active[creg_r3] == 2);
  r3 = 2 + r2;

  //   %idxprom = sext i32 %add to i64, !dbg !86

  //   %arrayidx = getelementptr inbounds [4 x i64], [4 x i64]* @vars, i64 0, i64 %idxprom, !dbg !86
  r4 = 0+r3*1;
  ASSUME(creg_r4 >= 0);
  ASSUME(creg_r4 >= creg_r3);
  ASSUME(active[creg_r4] == 2);

  //   call void @llvm.dbg.value(metadata i64* %arrayidx, metadata !69, metadata !DIExpression()), !dbg !106

  //   %2 = load atomic i64, i64* %arrayidx monotonic, align 8, !dbg !86
  // LD: Guess
  old_cr = cr(2,r4);
  cr(2,r4) = get_rng(0,NCONTEXT-1);// 2 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(2,r4)] == 2);
  ASSUME(cr(2,r4) >= iw(2,r4));
  ASSUME(cr(2,r4) >= creg_r4);
  ASSUME(cr(2,r4) >= cdy[2]);
  ASSUME(cr(2,r4) >= cisb[2]);
  ASSUME(cr(2,r4) >= cdl[2]);
  ASSUME(cr(2,r4) >= cl[2]);
  // Update
  creg_r5 = cr(2,r4);
  crmax(2,r4) = max(crmax(2,r4),cr(2,r4));
  caddr[2] = max(caddr[2],creg_r4);
  if(cr(2,r4) < cw(2,r4)) {
    r5 = buff(2,r4);
    ASSUME((!(( (cw(2,r4) < 1) && (1 < crmax(2,r4)) )))||(sforbid(r4,1)> 0));
    ASSUME((!(( (cw(2,r4) < 2) && (2 < crmax(2,r4)) )))||(sforbid(r4,2)> 0));
    ASSUME((!(( (cw(2,r4) < 3) && (3 < crmax(2,r4)) )))||(sforbid(r4,3)> 0));
    ASSUME((!(( (cw(2,r4) < 4) && (4 < crmax(2,r4)) )))||(sforbid(r4,4)> 0));
  } else {
    if(pw(2,r4) != co(r4,cr(2,r4))) {
      ASSUME(cr(2,r4) >= old_cr);
    }
    pw(2,r4) = co(r4,cr(2,r4));
    r5 = mem(r4,cr(2,r4));
  }
  ASSUME(creturn[2] >= cr(2,r4));

  //   call void @llvm.dbg.value(metadata i64 %2, metadata !71, metadata !DIExpression()), !dbg !106

  //   %conv8 = trunc i64 %2 to i32, !dbg !88

  //   call void @llvm.dbg.value(metadata i32 %conv8, metadata !68, metadata !DIExpression()), !dbg !95

  //   %tobool = icmp ne i32 %conv8, 0, !dbg !89

  //   br i1 %tobool, label %if.then, label %if.else, !dbg !91
  old_cctrl = cctrl[2];
  cctrl[2] = get_rng(0,NCONTEXT-1);
  ASSUME(cctrl[2] >= old_cctrl);
  ASSUME(cctrl[2] >= creg_r5);
  ASSUME(cctrl[2] >= 0);
  if((r5!=0)) {
    goto T2BLOCK2;
  } else {
    goto T2BLOCK3;
  }

T2BLOCK2:
  //   br label %lbl_LC00, !dbg !92
  goto T2BLOCK4;

T2BLOCK3:
  //   br label %lbl_LC00, !dbg !93
  goto T2BLOCK4;

T2BLOCK4:
  //   call void @llvm.dbg.label(metadata !94), !dbg !113

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 3), metadata !73, metadata !DIExpression()), !dbg !114

  //   %3 = load atomic i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !96
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
  creg_r6 = cr(2,0+3*1);
  crmax(2,0+3*1) = max(crmax(2,0+3*1),cr(2,0+3*1));
  caddr[2] = max(caddr[2],0);
  if(cr(2,0+3*1) < cw(2,0+3*1)) {
    r6 = buff(2,0+3*1);
    ASSUME((!(( (cw(2,0+3*1) < 1) && (1 < crmax(2,0+3*1)) )))||(sforbid(0+3*1,1)> 0));
    ASSUME((!(( (cw(2,0+3*1) < 2) && (2 < crmax(2,0+3*1)) )))||(sforbid(0+3*1,2)> 0));
    ASSUME((!(( (cw(2,0+3*1) < 3) && (3 < crmax(2,0+3*1)) )))||(sforbid(0+3*1,3)> 0));
    ASSUME((!(( (cw(2,0+3*1) < 4) && (4 < crmax(2,0+3*1)) )))||(sforbid(0+3*1,4)> 0));
  } else {
    if(pw(2,0+3*1) != co(0+3*1,cr(2,0+3*1))) {
      ASSUME(cr(2,0+3*1) >= old_cr);
    }
    pw(2,0+3*1) = co(0+3*1,cr(2,0+3*1));
    r6 = mem(0+3*1,cr(2,0+3*1));
  }
  ASSUME(creturn[2] >= cr(2,0+3*1));

  //   call void @llvm.dbg.value(metadata i64 %3, metadata !75, metadata !DIExpression()), !dbg !114

  //   %conv12 = trunc i64 %3 to i32, !dbg !97

  //   call void @llvm.dbg.value(metadata i32 %conv12, metadata !72, metadata !DIExpression()), !dbg !95

  //   %xor13 = xor i32 %conv12, %conv12, !dbg !98
  creg_r7 = max(creg_r6,creg_r6);
  ASSUME(active[creg_r7] == 2);
  r7 = r6 ^ r6;

  //   call void @llvm.dbg.value(metadata i32 %xor13, metadata !76, metadata !DIExpression()), !dbg !95

  //   %add15 = add nsw i32 0, %xor13, !dbg !99
  creg_r8 = max(0,creg_r7);
  ASSUME(active[creg_r8] == 2);
  r8 = 0 + r7;

  //   %idxprom16 = sext i32 %add15 to i64, !dbg !99

  //   %arrayidx17 = getelementptr inbounds [4 x i64], [4 x i64]* @vars, i64 0, i64 %idxprom16, !dbg !99
  r9 = 0+r8*1;
  ASSUME(creg_r9 >= 0);
  ASSUME(creg_r9 >= creg_r8);
  ASSUME(active[creg_r9] == 2);

  //   call void @llvm.dbg.value(metadata i64* %arrayidx17, metadata !78, metadata !DIExpression()), !dbg !119

  //   %4 = load atomic i64, i64* %arrayidx17 monotonic, align 8, !dbg !99
  // LD: Guess
  old_cr = cr(2,r9);
  cr(2,r9) = get_rng(0,NCONTEXT-1);// 2 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(2,r9)] == 2);
  ASSUME(cr(2,r9) >= iw(2,r9));
  ASSUME(cr(2,r9) >= creg_r9);
  ASSUME(cr(2,r9) >= cdy[2]);
  ASSUME(cr(2,r9) >= cisb[2]);
  ASSUME(cr(2,r9) >= cdl[2]);
  ASSUME(cr(2,r9) >= cl[2]);
  // Update
  creg_r10 = cr(2,r9);
  crmax(2,r9) = max(crmax(2,r9),cr(2,r9));
  caddr[2] = max(caddr[2],creg_r9);
  if(cr(2,r9) < cw(2,r9)) {
    r10 = buff(2,r9);
    ASSUME((!(( (cw(2,r9) < 1) && (1 < crmax(2,r9)) )))||(sforbid(r9,1)> 0));
    ASSUME((!(( (cw(2,r9) < 2) && (2 < crmax(2,r9)) )))||(sforbid(r9,2)> 0));
    ASSUME((!(( (cw(2,r9) < 3) && (3 < crmax(2,r9)) )))||(sforbid(r9,3)> 0));
    ASSUME((!(( (cw(2,r9) < 4) && (4 < crmax(2,r9)) )))||(sforbid(r9,4)> 0));
  } else {
    if(pw(2,r9) != co(r9,cr(2,r9))) {
      ASSUME(cr(2,r9) >= old_cr);
    }
    pw(2,r9) = co(r9,cr(2,r9));
    r10 = mem(r9,cr(2,r9));
  }
  ASSUME(creturn[2] >= cr(2,r9));

  //   call void @llvm.dbg.value(metadata i64 %4, metadata !80, metadata !DIExpression()), !dbg !119

  //   %conv20 = trunc i64 %4 to i32, !dbg !101

  //   call void @llvm.dbg.value(metadata i32 %conv20, metadata !77, metadata !DIExpression()), !dbg !95

  //   %cmp = icmp eq i32 %conv, 1, !dbg !102

  //   %conv21 = zext i1 %cmp to i32, !dbg !102

  //   call void @llvm.dbg.value(metadata i32 %conv21, metadata !81, metadata !DIExpression()), !dbg !95

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X0_1, metadata !82, metadata !DIExpression()), !dbg !122

  //   %5 = zext i32 %conv21 to i64

  //   call void @llvm.dbg.value(metadata i64 %5, metadata !84, metadata !DIExpression()), !dbg !122

  //   store atomic i64 %5, i64* @atom_1_X0_1 seq_cst, align 8, !dbg !104
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

  //   %cmp23 = icmp eq i32 %conv4, 1, !dbg !105

  //   %conv24 = zext i1 %cmp23 to i32, !dbg !105

  //   call void @llvm.dbg.value(metadata i32 %conv24, metadata !85, metadata !DIExpression()), !dbg !95

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X2_1, metadata !86, metadata !DIExpression()), !dbg !125

  //   %6 = zext i32 %conv24 to i64

  //   call void @llvm.dbg.value(metadata i64 %6, metadata !88, metadata !DIExpression()), !dbg !125

  //   store atomic i64 %6, i64* @atom_1_X2_1 seq_cst, align 8, !dbg !107
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

  //   %cmp28 = icmp eq i32 %conv20, 0, !dbg !108

  //   %conv29 = zext i1 %cmp28 to i32, !dbg !108

  //   call void @llvm.dbg.value(metadata i32 %conv29, metadata !89, metadata !DIExpression()), !dbg !95

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X9_0, metadata !90, metadata !DIExpression()), !dbg !128

  //   %7 = zext i32 %conv29 to i64

  //   call void @llvm.dbg.value(metadata i64 %7, metadata !92, metadata !DIExpression()), !dbg !128

  //   store atomic i64 %7, i64* @atom_1_X9_0 seq_cst, align 8, !dbg !110
  // ST: Guess
  iw(2,6) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW 
  old_cw = cw(2,6);
  cw(2,6) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(2,6)] == 2);
  ASSUME(active[cw(2,6)] == 2);
  ASSUME(sforbid(6,cw(2,6))== 0);
  ASSUME(iw(2,6) >= max(creg_r10,0));
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
  buff(2,6) = (r10==0);
  mem(6,cw(2,6)) = (r10==0);
  co(6,cw(2,6))+=1;
  delta(6,cw(2,6)) = -1;
  ASSUME(creturn[2] >= cw(2,6));

  //   ret i8* null, !dbg !111
  ret_thread_2 = (- 1);


  // Dumping thread 0
  int ret_thread_0 = 0;
  cdy[0] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[0] >= cstart[0]);
T0BLOCK0:
  //   %thr0 = alloca i64, align 8

  //   %thr1 = alloca i64, align 8

  //   call void @llvm.dbg.value(metadata i32 %argc, metadata !138, metadata !DIExpression()), !dbg !192

  //   call void @llvm.dbg.value(metadata i8** %argv, metadata !139, metadata !DIExpression()), !dbg !192

  //   %0 = bitcast i64* %thr0 to i8*, !dbg !97

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #7, !dbg !97

  //   call void @llvm.dbg.declare(metadata i64* %thr0, metadata !140, metadata !DIExpression()), !dbg !194

  //   %1 = bitcast i64* %thr1 to i8*, !dbg !99

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #7, !dbg !99

  //   call void @llvm.dbg.declare(metadata i64* %thr1, metadata !144, metadata !DIExpression()), !dbg !196

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 3), metadata !145, metadata !DIExpression()), !dbg !197

  //   call void @llvm.dbg.value(metadata i64 0, metadata !147, metadata !DIExpression()), !dbg !197

  //   store atomic i64 0, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !102
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 2), metadata !148, metadata !DIExpression()), !dbg !199

  //   call void @llvm.dbg.value(metadata i64 0, metadata !150, metadata !DIExpression()), !dbg !199

  //   store atomic i64 0, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 2) monotonic, align 8, !dbg !104
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 1), metadata !151, metadata !DIExpression()), !dbg !201

  //   call void @llvm.dbg.value(metadata i64 0, metadata !153, metadata !DIExpression()), !dbg !201

  //   store atomic i64 0, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !106
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 0), metadata !154, metadata !DIExpression()), !dbg !203

  //   call void @llvm.dbg.value(metadata i64 0, metadata !156, metadata !DIExpression()), !dbg !203

  //   store atomic i64 0, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !108
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

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X0_1, metadata !157, metadata !DIExpression()), !dbg !205

  //   call void @llvm.dbg.value(metadata i64 0, metadata !159, metadata !DIExpression()), !dbg !205

  //   store atomic i64 0, i64* @atom_1_X0_1 monotonic, align 8, !dbg !110
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

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X2_1, metadata !160, metadata !DIExpression()), !dbg !207

  //   call void @llvm.dbg.value(metadata i64 0, metadata !162, metadata !DIExpression()), !dbg !207

  //   store atomic i64 0, i64* @atom_1_X2_1 monotonic, align 8, !dbg !112
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

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X9_0, metadata !163, metadata !DIExpression()), !dbg !209

  //   call void @llvm.dbg.value(metadata i64 0, metadata !165, metadata !DIExpression()), !dbg !209

  //   store atomic i64 0, i64* @atom_1_X9_0 monotonic, align 8, !dbg !114
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

  //   %call = call i32 @pthread_create(i64* noundef %thr0, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t0, i8* noundef null) #7, !dbg !115
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
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,4+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[1] >= cdy[0]);

  //   %call13 = call i32 @pthread_create(i64* noundef %thr1, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t1, i8* noundef null) #7, !dbg !116
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
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,4+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[2] >= cdy[0]);

  //   %2 = load i64, i64* %thr0, align 8, !dbg !117, !tbaa !118
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
  creg_r12 = cr(0,7);
  crmax(0,7) = max(crmax(0,7),cr(0,7));
  caddr[0] = max(caddr[0],0);
  if(cr(0,7) < cw(0,7)) {
    r12 = buff(0,7);
    ASSUME((!(( (cw(0,7) < 1) && (1 < crmax(0,7)) )))||(sforbid(7,1)> 0));
    ASSUME((!(( (cw(0,7) < 2) && (2 < crmax(0,7)) )))||(sforbid(7,2)> 0));
    ASSUME((!(( (cw(0,7) < 3) && (3 < crmax(0,7)) )))||(sforbid(7,3)> 0));
    ASSUME((!(( (cw(0,7) < 4) && (4 < crmax(0,7)) )))||(sforbid(7,4)> 0));
  } else {
    if(pw(0,7) != co(7,cr(0,7))) {
      ASSUME(cr(0,7) >= old_cr);
    }
    pw(0,7) = co(7,cr(0,7));
    r12 = mem(7,cr(0,7));
  }
  ASSUME(creturn[0] >= cr(0,7));

  //   %call14 = call i32 @pthread_join(i64 noundef %2, i8** noundef null), !dbg !122
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
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,4+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[1]);

  //   %3 = load i64, i64* %thr1, align 8, !dbg !123, !tbaa !118
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
  creg_r13 = cr(0,8);
  crmax(0,8) = max(crmax(0,8),cr(0,8));
  caddr[0] = max(caddr[0],0);
  if(cr(0,8) < cw(0,8)) {
    r13 = buff(0,8);
    ASSUME((!(( (cw(0,8) < 1) && (1 < crmax(0,8)) )))||(sforbid(8,1)> 0));
    ASSUME((!(( (cw(0,8) < 2) && (2 < crmax(0,8)) )))||(sforbid(8,2)> 0));
    ASSUME((!(( (cw(0,8) < 3) && (3 < crmax(0,8)) )))||(sforbid(8,3)> 0));
    ASSUME((!(( (cw(0,8) < 4) && (4 < crmax(0,8)) )))||(sforbid(8,4)> 0));
  } else {
    if(pw(0,8) != co(8,cr(0,8))) {
      ASSUME(cr(0,8) >= old_cr);
    }
    pw(0,8) = co(8,cr(0,8));
    r13 = mem(8,cr(0,8));
  }
  ASSUME(creturn[0] >= cr(0,8));

  //   %call15 = call i32 @pthread_join(i64 noundef %3, i8** noundef null), !dbg !124
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
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,4+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[2]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 0), metadata !167, metadata !DIExpression()), !dbg !221

  //   %4 = load atomic i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 0) seq_cst, align 8, !dbg !126
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
  creg_r14 = cr(0,0);
  crmax(0,0) = max(crmax(0,0),cr(0,0));
  caddr[0] = max(caddr[0],0);
  if(cr(0,0) < cw(0,0)) {
    r14 = buff(0,0);
    ASSUME((!(( (cw(0,0) < 1) && (1 < crmax(0,0)) )))||(sforbid(0,1)> 0));
    ASSUME((!(( (cw(0,0) < 2) && (2 < crmax(0,0)) )))||(sforbid(0,2)> 0));
    ASSUME((!(( (cw(0,0) < 3) && (3 < crmax(0,0)) )))||(sforbid(0,3)> 0));
    ASSUME((!(( (cw(0,0) < 4) && (4 < crmax(0,0)) )))||(sforbid(0,4)> 0));
  } else {
    if(pw(0,0) != co(0,cr(0,0))) {
      ASSUME(cr(0,0) >= old_cr);
    }
    pw(0,0) = co(0,cr(0,0));
    r14 = mem(0,cr(0,0));
  }
  ASSUME(creturn[0] >= cr(0,0));

  //   call void @llvm.dbg.value(metadata i64 %4, metadata !169, metadata !DIExpression()), !dbg !221

  //   %conv = trunc i64 %4 to i32, !dbg !127

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !166, metadata !DIExpression()), !dbg !192

  //   %cmp = icmp eq i32 %conv, 1, !dbg !128

  //   %conv16 = zext i1 %cmp to i32, !dbg !128

  //   call void @llvm.dbg.value(metadata i32 %conv16, metadata !170, metadata !DIExpression()), !dbg !192

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 1), metadata !172, metadata !DIExpression()), !dbg !225

  //   %5 = load atomic i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 1) seq_cst, align 8, !dbg !130
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
  creg_r15 = cr(0,0+1*1);
  crmax(0,0+1*1) = max(crmax(0,0+1*1),cr(0,0+1*1));
  caddr[0] = max(caddr[0],0);
  if(cr(0,0+1*1) < cw(0,0+1*1)) {
    r15 = buff(0,0+1*1);
    ASSUME((!(( (cw(0,0+1*1) < 1) && (1 < crmax(0,0+1*1)) )))||(sforbid(0+1*1,1)> 0));
    ASSUME((!(( (cw(0,0+1*1) < 2) && (2 < crmax(0,0+1*1)) )))||(sforbid(0+1*1,2)> 0));
    ASSUME((!(( (cw(0,0+1*1) < 3) && (3 < crmax(0,0+1*1)) )))||(sforbid(0+1*1,3)> 0));
    ASSUME((!(( (cw(0,0+1*1) < 4) && (4 < crmax(0,0+1*1)) )))||(sforbid(0+1*1,4)> 0));
  } else {
    if(pw(0,0+1*1) != co(0+1*1,cr(0,0+1*1))) {
      ASSUME(cr(0,0+1*1) >= old_cr);
    }
    pw(0,0+1*1) = co(0+1*1,cr(0,0+1*1));
    r15 = mem(0+1*1,cr(0,0+1*1));
  }
  ASSUME(creturn[0] >= cr(0,0+1*1));

  //   call void @llvm.dbg.value(metadata i64 %5, metadata !174, metadata !DIExpression()), !dbg !225

  //   %conv20 = trunc i64 %5 to i32, !dbg !131

  //   call void @llvm.dbg.value(metadata i32 %conv20, metadata !171, metadata !DIExpression()), !dbg !192

  //   %cmp21 = icmp eq i32 %conv20, 1, !dbg !132

  //   %conv22 = zext i1 %cmp21 to i32, !dbg !132

  //   call void @llvm.dbg.value(metadata i32 %conv22, metadata !175, metadata !DIExpression()), !dbg !192

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X0_1, metadata !177, metadata !DIExpression()), !dbg !229

  //   %6 = load atomic i64, i64* @atom_1_X0_1 seq_cst, align 8, !dbg !134
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
  creg_r16 = cr(0,4);
  crmax(0,4) = max(crmax(0,4),cr(0,4));
  caddr[0] = max(caddr[0],0);
  if(cr(0,4) < cw(0,4)) {
    r16 = buff(0,4);
    ASSUME((!(( (cw(0,4) < 1) && (1 < crmax(0,4)) )))||(sforbid(4,1)> 0));
    ASSUME((!(( (cw(0,4) < 2) && (2 < crmax(0,4)) )))||(sforbid(4,2)> 0));
    ASSUME((!(( (cw(0,4) < 3) && (3 < crmax(0,4)) )))||(sforbid(4,3)> 0));
    ASSUME((!(( (cw(0,4) < 4) && (4 < crmax(0,4)) )))||(sforbid(4,4)> 0));
  } else {
    if(pw(0,4) != co(4,cr(0,4))) {
      ASSUME(cr(0,4) >= old_cr);
    }
    pw(0,4) = co(4,cr(0,4));
    r16 = mem(4,cr(0,4));
  }
  ASSUME(creturn[0] >= cr(0,4));

  //   call void @llvm.dbg.value(metadata i64 %6, metadata !179, metadata !DIExpression()), !dbg !229

  //   %conv26 = trunc i64 %6 to i32, !dbg !135

  //   call void @llvm.dbg.value(metadata i32 %conv26, metadata !176, metadata !DIExpression()), !dbg !192

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X2_1, metadata !181, metadata !DIExpression()), !dbg !232

  //   %7 = load atomic i64, i64* @atom_1_X2_1 seq_cst, align 8, !dbg !137
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
  creg_r17 = cr(0,5);
  crmax(0,5) = max(crmax(0,5),cr(0,5));
  caddr[0] = max(caddr[0],0);
  if(cr(0,5) < cw(0,5)) {
    r17 = buff(0,5);
    ASSUME((!(( (cw(0,5) < 1) && (1 < crmax(0,5)) )))||(sforbid(5,1)> 0));
    ASSUME((!(( (cw(0,5) < 2) && (2 < crmax(0,5)) )))||(sforbid(5,2)> 0));
    ASSUME((!(( (cw(0,5) < 3) && (3 < crmax(0,5)) )))||(sforbid(5,3)> 0));
    ASSUME((!(( (cw(0,5) < 4) && (4 < crmax(0,5)) )))||(sforbid(5,4)> 0));
  } else {
    if(pw(0,5) != co(5,cr(0,5))) {
      ASSUME(cr(0,5) >= old_cr);
    }
    pw(0,5) = co(5,cr(0,5));
    r17 = mem(5,cr(0,5));
  }
  ASSUME(creturn[0] >= cr(0,5));

  //   call void @llvm.dbg.value(metadata i64 %7, metadata !183, metadata !DIExpression()), !dbg !232

  //   %conv30 = trunc i64 %7 to i32, !dbg !138

  //   call void @llvm.dbg.value(metadata i32 %conv30, metadata !180, metadata !DIExpression()), !dbg !192

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X9_0, metadata !185, metadata !DIExpression()), !dbg !235

  //   %8 = load atomic i64, i64* @atom_1_X9_0 seq_cst, align 8, !dbg !140
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
  creg_r18 = cr(0,6);
  crmax(0,6) = max(crmax(0,6),cr(0,6));
  caddr[0] = max(caddr[0],0);
  if(cr(0,6) < cw(0,6)) {
    r18 = buff(0,6);
    ASSUME((!(( (cw(0,6) < 1) && (1 < crmax(0,6)) )))||(sforbid(6,1)> 0));
    ASSUME((!(( (cw(0,6) < 2) && (2 < crmax(0,6)) )))||(sforbid(6,2)> 0));
    ASSUME((!(( (cw(0,6) < 3) && (3 < crmax(0,6)) )))||(sforbid(6,3)> 0));
    ASSUME((!(( (cw(0,6) < 4) && (4 < crmax(0,6)) )))||(sforbid(6,4)> 0));
  } else {
    if(pw(0,6) != co(6,cr(0,6))) {
      ASSUME(cr(0,6) >= old_cr);
    }
    pw(0,6) = co(6,cr(0,6));
    r18 = mem(6,cr(0,6));
  }
  ASSUME(creturn[0] >= cr(0,6));

  //   call void @llvm.dbg.value(metadata i64 %8, metadata !187, metadata !DIExpression()), !dbg !235

  //   %conv34 = trunc i64 %8 to i32, !dbg !141

  //   call void @llvm.dbg.value(metadata i32 %conv34, metadata !184, metadata !DIExpression()), !dbg !192

  //   %and = and i32 %conv30, %conv34, !dbg !142
  creg_r19 = max(creg_r17,creg_r18);
  ASSUME(active[creg_r19] == 0);
  r19 = r17 & r18;

  //   call void @llvm.dbg.value(metadata i32 %and, metadata !188, metadata !DIExpression()), !dbg !192

  //   %and35 = and i32 %conv26, %and, !dbg !143
  creg_r20 = max(creg_r16,creg_r19);
  ASSUME(active[creg_r20] == 0);
  r20 = r16 & r19;

  //   call void @llvm.dbg.value(metadata i32 %and35, metadata !189, metadata !DIExpression()), !dbg !192

  //   %and36 = and i32 %conv22, %and35, !dbg !144
  creg_r21 = max(max(creg_r15,0),creg_r20);
  ASSUME(active[creg_r21] == 0);
  r21 = (r15==1) & r20;

  //   call void @llvm.dbg.value(metadata i32 %and36, metadata !190, metadata !DIExpression()), !dbg !192

  //   %and37 = and i32 %conv16, %and36, !dbg !145
  creg_r22 = max(max(creg_r14,0),creg_r21);
  ASSUME(active[creg_r22] == 0);
  r22 = (r14==1) & r21;

  //   call void @llvm.dbg.value(metadata i32 %and37, metadata !191, metadata !DIExpression()), !dbg !192

  //   %cmp38 = icmp eq i32 %and37, 1, !dbg !146

  //   br i1 %cmp38, label %if.then, label %if.end, !dbg !148
  old_cctrl = cctrl[0];
  cctrl[0] = get_rng(0,NCONTEXT-1);
  ASSUME(cctrl[0] >= old_cctrl);
  ASSUME(cctrl[0] >= creg_r22);
  ASSUME(cctrl[0] >= 0);
  if((r22==1)) {
    goto T0BLOCK1;
  } else {
    goto T0BLOCK2;
  }

T0BLOCK1:
  //   call void @__assert_fail(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([113 x i8], [113 x i8]* @.str.1, i64 0, i64 0), i32 noundef 76, i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #8, !dbg !149

  //   unreachable, !dbg !149
  r23 = 1;

T0BLOCK2:
  //   %9 = bitcast i64* %thr1 to i8*, !dbg !152

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %9) #7, !dbg !152

  //   %10 = bitcast i64* %thr0 to i8*, !dbg !152

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %10) #7, !dbg !152

  //   ret i32 0, !dbg !153
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

  ASSERT(r23== 0);

}
