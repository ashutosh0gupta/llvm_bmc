// Global variabls:
// 0:vars:2
// 2:atom_1_X2_2:1
// 3:atom_1_X4_0:1
// 4:atom_1_X6_1:1
// 5:atom_1_X7_1:1
// Local global variabls:
// 0:thr0:1
// 1:thr1:1
// 2:thr2:1
#define ADDRSIZE 6
#define LOCALADDRSIZE 3
#define NTHREAD 4
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
  // Declare arrays for intial value version in contexts
  int local_mem[LOCALADDRSIZE];
  // Dumping initializations
  local_mem[0+0] = 0;
  local_mem[1+0] = 0;
  local_mem[2+0] = 0;
  int cstart[NTHREAD];
  int creturn[NTHREAD];

  // declare arrays for contexts activity
  int active[NCONTEXT];
  int ctx_used[NCONTEXT];

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
  int buff_[NTHREAD*ADDRSIZE];
  #define buff(x,k) buff_[(x)*ADDRSIZE+k]
  int pw_[NTHREAD*ADDRSIZE];
  #define pw(x,k) pw_[(x)*ADDRSIZE+k]

  // declare arrays for context stamps
  char cr_[NTHREAD*ADDRSIZE];
  #define cr(x,k) cr_[(x)*ADDRSIZE+k]
  char iw_[NTHREAD*ADDRSIZE];
  #define iw(x,k) iw_[(x)*ADDRSIZE+k]
  char cw_[NTHREAD*ADDRSIZE];
  #define cw(x,k) cw_[(x)*ADDRSIZE+k]
  char cx_[NTHREAD*ADDRSIZE];
  #define cx(x,k) cx_[(x)*ADDRSIZE+k]
  char is_[NTHREAD*ADDRSIZE];
  #define is(x,k) is_[(x)*ADDRSIZE+k]
  char cs_[NTHREAD*ADDRSIZE];
  #define cs(x,k) cs_[(x)*ADDRSIZE+k]
  char crmax_[NTHREAD*ADDRSIZE];
  #define crmax(x,k) crmax_[(x)*ADDRSIZE+k]

  char sforbid_[ADDRSIZE*NCONTEXT];
  #define sforbid(x,k) sforbid_[(x)*NCONTEXT+k]

  // declare arrays for synchronizations
  int cl[NTHREAD];
  int cdy[NTHREAD];
  int cds[NTHREAD];
  int cdl[NTHREAD];
  int cisb[NTHREAD];
  int caddr[NTHREAD];
  int cctrl[NTHREAD];

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
  char creg__r0__2_;
  char creg__r4__0_;
  char creg__r5__1_;
  char creg__r6__1_;
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
  char creg__r11__2_;
  int r12= 0;
  char creg_r12;
  char creg__r12__2_;
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
  char creg__r21__1_;
  int r22= 0;
  char creg_r22;
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
  cl[2] = 0;
  cdy[2] = 0;
  cds[2] = 0;
  cdl[2] = 0;
  cisb[2] = 0;
  caddr[2] = 0;
  cctrl[2] = 0;
  cstart[2] = get_rng(0,NCONTEXT-1);
  creturn[2] = get_rng(0,NCONTEXT-1);
  buff(3,0) = 0;
  pw(3,0) = 0;
  cr(3,0) = 0;
  iw(3,0) = 0;
  cw(3,0) = 0;
  cx(3,0) = 0;
  is(3,0) = 0;
  cs(3,0) = 0;
  crmax(3,0) = 0;
  buff(3,1) = 0;
  pw(3,1) = 0;
  cr(3,1) = 0;
  iw(3,1) = 0;
  cw(3,1) = 0;
  cx(3,1) = 0;
  is(3,1) = 0;
  cs(3,1) = 0;
  crmax(3,1) = 0;
  buff(3,2) = 0;
  pw(3,2) = 0;
  cr(3,2) = 0;
  iw(3,2) = 0;
  cw(3,2) = 0;
  cx(3,2) = 0;
  is(3,2) = 0;
  cs(3,2) = 0;
  crmax(3,2) = 0;
  buff(3,3) = 0;
  pw(3,3) = 0;
  cr(3,3) = 0;
  iw(3,3) = 0;
  cw(3,3) = 0;
  cx(3,3) = 0;
  is(3,3) = 0;
  cs(3,3) = 0;
  crmax(3,3) = 0;
  buff(3,4) = 0;
  pw(3,4) = 0;
  cr(3,4) = 0;
  iw(3,4) = 0;
  cw(3,4) = 0;
  cx(3,4) = 0;
  is(3,4) = 0;
  cs(3,4) = 0;
  crmax(3,4) = 0;
  buff(3,5) = 0;
  pw(3,5) = 0;
  cr(3,5) = 0;
  iw(3,5) = 0;
  cw(3,5) = 0;
  cx(3,5) = 0;
  is(3,5) = 0;
  cs(3,5) = 0;
  crmax(3,5) = 0;
  cl[3] = 0;
  cdy[3] = 0;
  cds[3] = 0;
  cdl[3] = 0;
  cisb[3] = 0;
  caddr[3] = 0;
  cctrl[3] = 0;
  cstart[3] = get_rng(0,NCONTEXT-1);
  creturn[3] = get_rng(0,NCONTEXT-1);
  // Dumping initializations
  mem(0+0,0) = 0;
  mem(0+1,0) = 0;
  mem(2+0,0) = 0;
  mem(3+0,0) = 0;
  mem(4+0,0) = 0;
  mem(5+0,0) = 0;
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
  // Dumping thread 1
  int ret_thread_1 = 0;
  cdy[1] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[1] >= cstart[1]);
T1BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !40, metadata !DIExpression()), !dbg !49

  //   br label %label_1, !dbg !50
  goto T1BLOCK1;

T1BLOCK1:
  //   call void @llvm.dbg.label(metadata !48), !dbg !51

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0), metadata !41, metadata !DIExpression()), !dbg !52

  //   call void @llvm.dbg.value(metadata i64 2, metadata !44, metadata !DIExpression()), !dbg !52

  //   store atomic i64 2, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !53
  // ST: Guess
  iw(1,0) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW _l22_c3
  old_cw = cw(1,0);
  cw(1,0) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM _l22_c3
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
  buff(1,0) = 2;
  mem(0,cw(1,0)) = 2;
  co(0,cw(1,0))+=1;
  delta(0,cw(1,0)) = -1;
  ASSUME(creturn[1] >= cw(1,0));

  //   call void (...) @dmbst(), !dbg !54
  // dumbst: Guess
  cds[1] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cds[1] >= cdy[1]);
  ASSUME(cds[1] >= cw(1,0+0));
  ASSUME(cds[1] >= cw(1,0+1));
  ASSUME(cds[1] >= cw(1,2+0));
  ASSUME(cds[1] >= cw(1,3+0));
  ASSUME(cds[1] >= cw(1,4+0));
  ASSUME(cds[1] >= cw(1,5+0));
  ASSUME(creturn[1] >= cds[1]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 1), metadata !45, metadata !DIExpression()), !dbg !55

  //   call void @llvm.dbg.value(metadata i64 1, metadata !47, metadata !DIExpression()), !dbg !55

  //   store atomic i64 1, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !56
  // ST: Guess
  iw(1,0+1*1) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW _l24_c3
  old_cw = cw(1,0+1*1);
  cw(1,0+1*1) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM _l24_c3
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

  //   ret i8* null, !dbg !57
  ret_thread_1 = (- 1);
  goto T1BLOCK_END;

T1BLOCK_END:

  // Dumping thread 2
  int ret_thread_2 = 0;
  cdy[2] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[2] >= cstart[2]);
T2BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !60, metadata !DIExpression()), !dbg !86

  //   br label %label_2, !dbg !68
  goto T2BLOCK1;

T2BLOCK1:
  //   call void @llvm.dbg.label(metadata !85), !dbg !88

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 1), metadata !61, metadata !DIExpression()), !dbg !89

  //   call void @llvm.dbg.value(metadata i64 2, metadata !63, metadata !DIExpression()), !dbg !89

  //   store atomic i64 2, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !71
  // ST: Guess
  iw(2,0+1*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW _l30_c3
  old_cw = cw(2,0+1*1);
  cw(2,0+1*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM _l30_c3
  // Check
  ASSUME(active[iw(2,0+1*1)] == 2);
  ASSUME(active[cw(2,0+1*1)] == 2);
  ASSUME(sforbid(0+1*1,cw(2,0+1*1))== 0);
  ASSUME(iw(2,0+1*1) >= 0);
  ASSUME(iw(2,0+1*1) >= 0);
  ASSUME(cw(2,0+1*1) >= iw(2,0+1*1));
  ASSUME(cw(2,0+1*1) >= old_cw);
  ASSUME(cw(2,0+1*1) >= cr(2,0+1*1));
  ASSUME(cw(2,0+1*1) >= cl[2]);
  ASSUME(cw(2,0+1*1) >= cisb[2]);
  ASSUME(cw(2,0+1*1) >= cdy[2]);
  ASSUME(cw(2,0+1*1) >= cdl[2]);
  ASSUME(cw(2,0+1*1) >= cds[2]);
  ASSUME(cw(2,0+1*1) >= cctrl[2]);
  ASSUME(cw(2,0+1*1) >= caddr[2]);
  // Update
  caddr[2] = max(caddr[2],0);
  buff(2,0+1*1) = 2;
  mem(0+1*1,cw(2,0+1*1)) = 2;
  co(0+1*1,cw(2,0+1*1))+=1;
  delta(0+1*1,cw(2,0+1*1)) = -1;
  ASSUME(creturn[2] >= cw(2,0+1*1));

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 1), metadata !65, metadata !DIExpression()), !dbg !91

  //   %0 = load atomic i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !73
  // LD: Guess
  old_cr = cr(2,0+1*1);
  cr(2,0+1*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN LDCOM _l31_c15
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

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !67, metadata !DIExpression()), !dbg !91

  //   %conv = trunc i64 %0 to i32, !dbg !74

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !64, metadata !DIExpression()), !dbg !86

  //   %xor = xor i32 %conv, %conv, !dbg !75
  creg_r1 = creg_r0;
  r1 = r0 ^ r0;

  //   call void @llvm.dbg.value(metadata i32 %xor, metadata !68, metadata !DIExpression()), !dbg !86

  //   %add = add nsw i32 0, %xor, !dbg !76
  creg_r2 = max(0,creg_r1);
  r2 = 0 + r1;

  //   %idxprom = sext i32 %add to i64, !dbg !76

  //   %arrayidx = getelementptr inbounds [2 x i64], [2 x i64]* @vars, i64 0, i64 %idxprom, !dbg !76
  r3 = 0+r2*1;
  creg_r3 = creg_r2;

  //   call void @llvm.dbg.value(metadata i64* %arrayidx, metadata !70, metadata !DIExpression()), !dbg !96

  //   %1 = load atomic i64, i64* %arrayidx monotonic, align 8, !dbg !76
  // LD: Guess
  old_cr = cr(2,r3);
  cr(2,r3) = get_rng(0,NCONTEXT-1);// 2 ASSIGN LDCOM _l33_c15
  // Check
  ASSUME(active[cr(2,r3)] == 2);
  ASSUME(cr(2,r3) >= iw(2,r3));
  ASSUME(cr(2,r3) >= creg_r3);
  ASSUME(cr(2,r3) >= cdy[2]);
  ASSUME(cr(2,r3) >= cisb[2]);
  ASSUME(cr(2,r3) >= cdl[2]);
  ASSUME(cr(2,r3) >= cl[2]);
  // Update
  creg_r4 = cr(2,r3);
  crmax(2,r3) = max(crmax(2,r3),cr(2,r3));
  caddr[2] = max(caddr[2],creg_r3);
  if(cr(2,r3) < cw(2,r3)) {
    r4 = buff(2,r3);
    ASSUME((!(( (cw(2,r3) < 1) && (1 < crmax(2,r3)) )))||(sforbid(r3,1)> 0));
    ASSUME((!(( (cw(2,r3) < 2) && (2 < crmax(2,r3)) )))||(sforbid(r3,2)> 0));
    ASSUME((!(( (cw(2,r3) < 3) && (3 < crmax(2,r3)) )))||(sforbid(r3,3)> 0));
    ASSUME((!(( (cw(2,r3) < 4) && (4 < crmax(2,r3)) )))||(sforbid(r3,4)> 0));
  } else {
    if(pw(2,r3) != co(r3,cr(2,r3))) {
      ASSUME(cr(2,r3) >= old_cr);
    }
    pw(2,r3) = co(r3,cr(2,r3));
    r4 = mem(r3,cr(2,r3));
  }
  ASSUME(creturn[2] >= cr(2,r3));

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !72, metadata !DIExpression()), !dbg !96

  //   %conv4 = trunc i64 %1 to i32, !dbg !78

  //   call void @llvm.dbg.value(metadata i32 %conv4, metadata !69, metadata !DIExpression()), !dbg !86

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0), metadata !74, metadata !DIExpression()), !dbg !98

  //   %2 = load atomic i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !80
  // LD: Guess
  old_cr = cr(2,0);
  cr(2,0) = get_rng(0,NCONTEXT-1);// 2 ASSIGN LDCOM _l34_c16
  // Check
  ASSUME(active[cr(2,0)] == 2);
  ASSUME(cr(2,0) >= iw(2,0));
  ASSUME(cr(2,0) >= 0);
  ASSUME(cr(2,0) >= cdy[2]);
  ASSUME(cr(2,0) >= cisb[2]);
  ASSUME(cr(2,0) >= cdl[2]);
  ASSUME(cr(2,0) >= cl[2]);
  // Update
  creg_r5 = cr(2,0);
  crmax(2,0) = max(crmax(2,0),cr(2,0));
  caddr[2] = max(caddr[2],0);
  if(cr(2,0) < cw(2,0)) {
    r5 = buff(2,0);
    ASSUME((!(( (cw(2,0) < 1) && (1 < crmax(2,0)) )))||(sforbid(0,1)> 0));
    ASSUME((!(( (cw(2,0) < 2) && (2 < crmax(2,0)) )))||(sforbid(0,2)> 0));
    ASSUME((!(( (cw(2,0) < 3) && (3 < crmax(2,0)) )))||(sforbid(0,3)> 0));
    ASSUME((!(( (cw(2,0) < 4) && (4 < crmax(2,0)) )))||(sforbid(0,4)> 0));
  } else {
    if(pw(2,0) != co(0,cr(2,0))) {
      ASSUME(cr(2,0) >= old_cr);
    }
    pw(2,0) = co(0,cr(2,0));
    r5 = mem(0,cr(2,0));
  }
  ASSUME(creturn[2] >= cr(2,0));

  //   call void @llvm.dbg.value(metadata i64 %2, metadata !76, metadata !DIExpression()), !dbg !98

  //   %conv8 = trunc i64 %2 to i32, !dbg !81

  //   call void @llvm.dbg.value(metadata i32 %conv8, metadata !73, metadata !DIExpression()), !dbg !86

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0), metadata !78, metadata !DIExpression()), !dbg !101

  //   %3 = load atomic i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !83
  // LD: Guess
  old_cr = cr(2,0);
  cr(2,0) = get_rng(0,NCONTEXT-1);// 2 ASSIGN LDCOM _l35_c16
  // Check
  ASSUME(active[cr(2,0)] == 2);
  ASSUME(cr(2,0) >= iw(2,0));
  ASSUME(cr(2,0) >= 0);
  ASSUME(cr(2,0) >= cdy[2]);
  ASSUME(cr(2,0) >= cisb[2]);
  ASSUME(cr(2,0) >= cdl[2]);
  ASSUME(cr(2,0) >= cl[2]);
  // Update
  creg_r6 = cr(2,0);
  crmax(2,0) = max(crmax(2,0),cr(2,0));
  caddr[2] = max(caddr[2],0);
  if(cr(2,0) < cw(2,0)) {
    r6 = buff(2,0);
    ASSUME((!(( (cw(2,0) < 1) && (1 < crmax(2,0)) )))||(sforbid(0,1)> 0));
    ASSUME((!(( (cw(2,0) < 2) && (2 < crmax(2,0)) )))||(sforbid(0,2)> 0));
    ASSUME((!(( (cw(2,0) < 3) && (3 < crmax(2,0)) )))||(sforbid(0,3)> 0));
    ASSUME((!(( (cw(2,0) < 4) && (4 < crmax(2,0)) )))||(sforbid(0,4)> 0));
  } else {
    if(pw(2,0) != co(0,cr(2,0))) {
      ASSUME(cr(2,0) >= old_cr);
    }
    pw(2,0) = co(0,cr(2,0));
    r6 = mem(0,cr(2,0));
  }
  ASSUME(creturn[2] >= cr(2,0));

  //   call void @llvm.dbg.value(metadata i64 %3, metadata !80, metadata !DIExpression()), !dbg !101

  //   %conv12 = trunc i64 %3 to i32, !dbg !84

  //   call void @llvm.dbg.value(metadata i32 %conv12, metadata !77, metadata !DIExpression()), !dbg !86

  //   %cmp = icmp eq i32 %conv, 2, !dbg !85
  creg__r0__2_ = max(0,creg_r0);

  //   %conv13 = zext i1 %cmp to i32, !dbg !85

  //   call void @llvm.dbg.value(metadata i32 %conv13, metadata !81, metadata !DIExpression()), !dbg !86

  //   store i32 %conv13, i32* @atom_1_X2_2, align 4, !dbg !86, !tbaa !87
  // ST: Guess
  iw(2,2) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW _l37_c15
  old_cw = cw(2,2);
  cw(2,2) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM _l37_c15
  // Check
  ASSUME(active[iw(2,2)] == 2);
  ASSUME(active[cw(2,2)] == 2);
  ASSUME(sforbid(2,cw(2,2))== 0);
  ASSUME(iw(2,2) >= creg__r0__2_);
  ASSUME(iw(2,2) >= 0);
  ASSUME(cw(2,2) >= iw(2,2));
  ASSUME(cw(2,2) >= old_cw);
  ASSUME(cw(2,2) >= cr(2,2));
  ASSUME(cw(2,2) >= cl[2]);
  ASSUME(cw(2,2) >= cisb[2]);
  ASSUME(cw(2,2) >= cdy[2]);
  ASSUME(cw(2,2) >= cdl[2]);
  ASSUME(cw(2,2) >= cds[2]);
  ASSUME(cw(2,2) >= cctrl[2]);
  ASSUME(cw(2,2) >= caddr[2]);
  // Update
  caddr[2] = max(caddr[2],0);
  buff(2,2) = (r0==2);
  mem(2,cw(2,2)) = (r0==2);
  co(2,cw(2,2))+=1;
  delta(2,cw(2,2)) = -1;
  ASSUME(creturn[2] >= cw(2,2));

  //   %cmp14 = icmp eq i32 %conv4, 0, !dbg !91
  creg__r4__0_ = max(0,creg_r4);

  //   %conv15 = zext i1 %cmp14 to i32, !dbg !91

  //   call void @llvm.dbg.value(metadata i32 %conv15, metadata !82, metadata !DIExpression()), !dbg !86

  //   store i32 %conv15, i32* @atom_1_X4_0, align 4, !dbg !92, !tbaa !87
  // ST: Guess
  iw(2,3) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW _l39_c15
  old_cw = cw(2,3);
  cw(2,3) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM _l39_c15
  // Check
  ASSUME(active[iw(2,3)] == 2);
  ASSUME(active[cw(2,3)] == 2);
  ASSUME(sforbid(3,cw(2,3))== 0);
  ASSUME(iw(2,3) >= creg__r4__0_);
  ASSUME(iw(2,3) >= 0);
  ASSUME(cw(2,3) >= iw(2,3));
  ASSUME(cw(2,3) >= old_cw);
  ASSUME(cw(2,3) >= cr(2,3));
  ASSUME(cw(2,3) >= cl[2]);
  ASSUME(cw(2,3) >= cisb[2]);
  ASSUME(cw(2,3) >= cdy[2]);
  ASSUME(cw(2,3) >= cdl[2]);
  ASSUME(cw(2,3) >= cds[2]);
  ASSUME(cw(2,3) >= cctrl[2]);
  ASSUME(cw(2,3) >= caddr[2]);
  // Update
  caddr[2] = max(caddr[2],0);
  buff(2,3) = (r4==0);
  mem(3,cw(2,3)) = (r4==0);
  co(3,cw(2,3))+=1;
  delta(3,cw(2,3)) = -1;
  ASSUME(creturn[2] >= cw(2,3));

  //   %cmp16 = icmp eq i32 %conv8, 1, !dbg !93
  creg__r5__1_ = max(0,creg_r5);

  //   %conv17 = zext i1 %cmp16 to i32, !dbg !93

  //   call void @llvm.dbg.value(metadata i32 %conv17, metadata !83, metadata !DIExpression()), !dbg !86

  //   store i32 %conv17, i32* @atom_1_X6_1, align 4, !dbg !94, !tbaa !87
  // ST: Guess
  iw(2,4) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW _l41_c15
  old_cw = cw(2,4);
  cw(2,4) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM _l41_c15
  // Check
  ASSUME(active[iw(2,4)] == 2);
  ASSUME(active[cw(2,4)] == 2);
  ASSUME(sforbid(4,cw(2,4))== 0);
  ASSUME(iw(2,4) >= creg__r5__1_);
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
  buff(2,4) = (r5==1);
  mem(4,cw(2,4)) = (r5==1);
  co(4,cw(2,4))+=1;
  delta(4,cw(2,4)) = -1;
  ASSUME(creturn[2] >= cw(2,4));

  //   %cmp18 = icmp eq i32 %conv12, 1, !dbg !95
  creg__r6__1_ = max(0,creg_r6);

  //   %conv19 = zext i1 %cmp18 to i32, !dbg !95

  //   call void @llvm.dbg.value(metadata i32 %conv19, metadata !84, metadata !DIExpression()), !dbg !86

  //   store i32 %conv19, i32* @atom_1_X7_1, align 4, !dbg !96, !tbaa !87
  // ST: Guess
  iw(2,5) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW _l43_c15
  old_cw = cw(2,5);
  cw(2,5) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM _l43_c15
  // Check
  ASSUME(active[iw(2,5)] == 2);
  ASSUME(active[cw(2,5)] == 2);
  ASSUME(sforbid(5,cw(2,5))== 0);
  ASSUME(iw(2,5) >= creg__r6__1_);
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
  buff(2,5) = (r6==1);
  mem(5,cw(2,5)) = (r6==1);
  co(5,cw(2,5))+=1;
  delta(5,cw(2,5)) = -1;
  ASSUME(creturn[2] >= cw(2,5));

  //   ret i8* null, !dbg !97
  ret_thread_2 = (- 1);
  goto T2BLOCK_END;

T2BLOCK_END:

  // Dumping thread 3
  int ret_thread_3 = 0;
  cdy[3] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[3] >= cstart[3]);
T3BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !119, metadata !DIExpression()), !dbg !124

  //   br label %label_3, !dbg !47
  goto T3BLOCK1;

T3BLOCK1:
  //   call void @llvm.dbg.label(metadata !123), !dbg !126

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0), metadata !120, metadata !DIExpression()), !dbg !127

  //   call void @llvm.dbg.value(metadata i64 1, metadata !122, metadata !DIExpression()), !dbg !127

  //   store atomic i64 1, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !50
  // ST: Guess
  iw(3,0) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STIW _l49_c3
  old_cw = cw(3,0);
  cw(3,0) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STCOM _l49_c3
  // Check
  ASSUME(active[iw(3,0)] == 3);
  ASSUME(active[cw(3,0)] == 3);
  ASSUME(sforbid(0,cw(3,0))== 0);
  ASSUME(iw(3,0) >= 0);
  ASSUME(iw(3,0) >= 0);
  ASSUME(cw(3,0) >= iw(3,0));
  ASSUME(cw(3,0) >= old_cw);
  ASSUME(cw(3,0) >= cr(3,0));
  ASSUME(cw(3,0) >= cl[3]);
  ASSUME(cw(3,0) >= cisb[3]);
  ASSUME(cw(3,0) >= cdy[3]);
  ASSUME(cw(3,0) >= cdl[3]);
  ASSUME(cw(3,0) >= cds[3]);
  ASSUME(cw(3,0) >= cctrl[3]);
  ASSUME(cw(3,0) >= caddr[3]);
  // Update
  caddr[3] = max(caddr[3],0);
  buff(3,0) = 1;
  mem(0,cw(3,0)) = 1;
  co(0,cw(3,0))+=1;
  delta(0,cw(3,0)) = -1;
  ASSUME(creturn[3] >= cw(3,0));

  //   ret i8* null, !dbg !51
  ret_thread_3 = (- 1);
  goto T3BLOCK_END;

T3BLOCK_END:

  // Dumping thread 0
  int ret_thread_0 = 0;
  cdy[0] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[0] >= cstart[0]);
T0BLOCK0:
  //   %thr0 = alloca i64, align 8

  //   %thr1 = alloca i64, align 8

  //   %thr2 = alloca i64, align 8

  //   call void @llvm.dbg.value(metadata i32 %argc, metadata !137, metadata !DIExpression()), !dbg !170

  //   call void @llvm.dbg.value(metadata i8** %argv, metadata !138, metadata !DIExpression()), !dbg !170

  //   %0 = bitcast i64* %thr0 to i8*, !dbg !78

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #7, !dbg !78

  //   call void @llvm.dbg.declare(metadata i64* %thr0, metadata !139, metadata !DIExpression()), !dbg !172

  //   %1 = bitcast i64* %thr1 to i8*, !dbg !80

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #7, !dbg !80

  //   call void @llvm.dbg.declare(metadata i64* %thr1, metadata !143, metadata !DIExpression()), !dbg !174

  //   %2 = bitcast i64* %thr2 to i8*, !dbg !82

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #7, !dbg !82

  //   call void @llvm.dbg.declare(metadata i64* %thr2, metadata !144, metadata !DIExpression()), !dbg !176

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 1), metadata !145, metadata !DIExpression()), !dbg !177

  //   call void @llvm.dbg.value(metadata i64 0, metadata !147, metadata !DIExpression()), !dbg !177

  //   store atomic i64 0, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !85
  // ST: Guess
  iw(0,0+1*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l58_c3
  old_cw = cw(0,0+1*1);
  cw(0,0+1*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l58_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0), metadata !148, metadata !DIExpression()), !dbg !179

  //   call void @llvm.dbg.value(metadata i64 0, metadata !150, metadata !DIExpression()), !dbg !179

  //   store atomic i64 0, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !87
  // ST: Guess
  iw(0,0) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l59_c3
  old_cw = cw(0,0);
  cw(0,0) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l59_c3
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

  //   store i32 0, i32* @atom_1_X2_2, align 4, !dbg !88, !tbaa !89
  // ST: Guess
  iw(0,2) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l60_c15
  old_cw = cw(0,2);
  cw(0,2) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l60_c15
  // Check
  ASSUME(active[iw(0,2)] == 0);
  ASSUME(active[cw(0,2)] == 0);
  ASSUME(sforbid(2,cw(0,2))== 0);
  ASSUME(iw(0,2) >= 0);
  ASSUME(iw(0,2) >= 0);
  ASSUME(cw(0,2) >= iw(0,2));
  ASSUME(cw(0,2) >= old_cw);
  ASSUME(cw(0,2) >= cr(0,2));
  ASSUME(cw(0,2) >= cl[0]);
  ASSUME(cw(0,2) >= cisb[0]);
  ASSUME(cw(0,2) >= cdy[0]);
  ASSUME(cw(0,2) >= cdl[0]);
  ASSUME(cw(0,2) >= cds[0]);
  ASSUME(cw(0,2) >= cctrl[0]);
  ASSUME(cw(0,2) >= caddr[0]);
  // Update
  caddr[0] = max(caddr[0],0);
  buff(0,2) = 0;
  mem(2,cw(0,2)) = 0;
  co(2,cw(0,2))+=1;
  delta(2,cw(0,2)) = -1;
  ASSUME(creturn[0] >= cw(0,2));

  //   store i32 0, i32* @atom_1_X4_0, align 4, !dbg !93, !tbaa !89
  // ST: Guess
  iw(0,3) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l61_c15
  old_cw = cw(0,3);
  cw(0,3) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l61_c15
  // Check
  ASSUME(active[iw(0,3)] == 0);
  ASSUME(active[cw(0,3)] == 0);
  ASSUME(sforbid(3,cw(0,3))== 0);
  ASSUME(iw(0,3) >= 0);
  ASSUME(iw(0,3) >= 0);
  ASSUME(cw(0,3) >= iw(0,3));
  ASSUME(cw(0,3) >= old_cw);
  ASSUME(cw(0,3) >= cr(0,3));
  ASSUME(cw(0,3) >= cl[0]);
  ASSUME(cw(0,3) >= cisb[0]);
  ASSUME(cw(0,3) >= cdy[0]);
  ASSUME(cw(0,3) >= cdl[0]);
  ASSUME(cw(0,3) >= cds[0]);
  ASSUME(cw(0,3) >= cctrl[0]);
  ASSUME(cw(0,3) >= caddr[0]);
  // Update
  caddr[0] = max(caddr[0],0);
  buff(0,3) = 0;
  mem(3,cw(0,3)) = 0;
  co(3,cw(0,3))+=1;
  delta(3,cw(0,3)) = -1;
  ASSUME(creturn[0] >= cw(0,3));

  //   store i32 0, i32* @atom_1_X6_1, align 4, !dbg !94, !tbaa !89
  // ST: Guess
  iw(0,4) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l62_c15
  old_cw = cw(0,4);
  cw(0,4) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l62_c15
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

  //   store i32 0, i32* @atom_1_X7_1, align 4, !dbg !95, !tbaa !89
  // ST: Guess
  iw(0,5) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l63_c15
  old_cw = cw(0,5);
  cw(0,5) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l63_c15
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

  //   %call = call i32 @pthread_create(i64* noundef %thr0, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t0, i8* noundef null) #7, !dbg !96
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
  ASSUME(cdy[0] >= cw(0,2+0));
  ASSUME(cdy[0] >= cw(0,3+0));
  ASSUME(cdy[0] >= cw(0,4+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,2+0));
  ASSUME(cdy[0] >= cr(0,3+0));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[1] >= cdy[0]);

  //   %call3 = call i32 @pthread_create(i64* noundef %thr1, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t1, i8* noundef null) #7, !dbg !97
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
  ASSUME(cdy[0] >= cw(0,2+0));
  ASSUME(cdy[0] >= cw(0,3+0));
  ASSUME(cdy[0] >= cw(0,4+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,2+0));
  ASSUME(cdy[0] >= cr(0,3+0));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[2] >= cdy[0]);

  //   %call4 = call i32 @pthread_create(i64* noundef %thr2, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t2, i8* noundef null) #7, !dbg !98
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
  ASSUME(cdy[0] >= cw(0,2+0));
  ASSUME(cdy[0] >= cw(0,3+0));
  ASSUME(cdy[0] >= cw(0,4+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,2+0));
  ASSUME(cdy[0] >= cr(0,3+0));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[3] >= cdy[0]);

  //   %3 = load i64, i64* %thr0, align 8, !dbg !99, !tbaa !100
  r8 = local_mem[0];

  //   %call5 = call i32 @pthread_join(i64 noundef %3, i8** noundef null), !dbg !102
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
  ASSUME(cdy[0] >= cw(0,2+0));
  ASSUME(cdy[0] >= cw(0,3+0));
  ASSUME(cdy[0] >= cw(0,4+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,2+0));
  ASSUME(cdy[0] >= cr(0,3+0));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[1]);

  //   %4 = load i64, i64* %thr1, align 8, !dbg !103, !tbaa !100
  r9 = local_mem[1];

  //   %call6 = call i32 @pthread_join(i64 noundef %4, i8** noundef null), !dbg !104
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
  ASSUME(cdy[0] >= cw(0,2+0));
  ASSUME(cdy[0] >= cw(0,3+0));
  ASSUME(cdy[0] >= cw(0,4+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,2+0));
  ASSUME(cdy[0] >= cr(0,3+0));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[2]);

  //   %5 = load i64, i64* %thr2, align 8, !dbg !105, !tbaa !100
  r10 = local_mem[2];

  //   %call7 = call i32 @pthread_join(i64 noundef %5, i8** noundef null), !dbg !106
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
  ASSUME(cdy[0] >= cw(0,2+0));
  ASSUME(cdy[0] >= cw(0,3+0));
  ASSUME(cdy[0] >= cw(0,4+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,2+0));
  ASSUME(cdy[0] >= cr(0,3+0));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[3]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0), metadata !152, metadata !DIExpression()), !dbg !196

  //   %6 = load atomic i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !108
  // LD: Guess
  old_cr = cr(0,0);
  cr(0,0) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l73_c13
  // Check
  ASSUME(active[cr(0,0)] == 0);
  ASSUME(cr(0,0) >= iw(0,0));
  ASSUME(cr(0,0) >= 0);
  ASSUME(cr(0,0) >= cdy[0]);
  ASSUME(cr(0,0) >= cisb[0]);
  ASSUME(cr(0,0) >= cdl[0]);
  ASSUME(cr(0,0) >= cl[0]);
  // Update
  creg_r11 = cr(0,0);
  crmax(0,0) = max(crmax(0,0),cr(0,0));
  caddr[0] = max(caddr[0],0);
  if(cr(0,0) < cw(0,0)) {
    r11 = buff(0,0);
    ASSUME((!(( (cw(0,0) < 1) && (1 < crmax(0,0)) )))||(sforbid(0,1)> 0));
    ASSUME((!(( (cw(0,0) < 2) && (2 < crmax(0,0)) )))||(sforbid(0,2)> 0));
    ASSUME((!(( (cw(0,0) < 3) && (3 < crmax(0,0)) )))||(sforbid(0,3)> 0));
    ASSUME((!(( (cw(0,0) < 4) && (4 < crmax(0,0)) )))||(sforbid(0,4)> 0));
  } else {
    if(pw(0,0) != co(0,cr(0,0))) {
      ASSUME(cr(0,0) >= old_cr);
    }
    pw(0,0) = co(0,cr(0,0));
    r11 = mem(0,cr(0,0));
  }
  ASSUME(creturn[0] >= cr(0,0));

  //   call void @llvm.dbg.value(metadata i64 %6, metadata !154, metadata !DIExpression()), !dbg !196

  //   %conv = trunc i64 %6 to i32, !dbg !109

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !151, metadata !DIExpression()), !dbg !170

  //   %cmp = icmp eq i32 %conv, 2, !dbg !110
  creg__r11__2_ = max(0,creg_r11);

  //   %conv8 = zext i1 %cmp to i32, !dbg !110

  //   call void @llvm.dbg.value(metadata i32 %conv8, metadata !155, metadata !DIExpression()), !dbg !170

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 1), metadata !157, metadata !DIExpression()), !dbg !200

  //   %7 = load atomic i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !112
  // LD: Guess
  old_cr = cr(0,0+1*1);
  cr(0,0+1*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l75_c13
  // Check
  ASSUME(active[cr(0,0+1*1)] == 0);
  ASSUME(cr(0,0+1*1) >= iw(0,0+1*1));
  ASSUME(cr(0,0+1*1) >= 0);
  ASSUME(cr(0,0+1*1) >= cdy[0]);
  ASSUME(cr(0,0+1*1) >= cisb[0]);
  ASSUME(cr(0,0+1*1) >= cdl[0]);
  ASSUME(cr(0,0+1*1) >= cl[0]);
  // Update
  creg_r12 = cr(0,0+1*1);
  crmax(0,0+1*1) = max(crmax(0,0+1*1),cr(0,0+1*1));
  caddr[0] = max(caddr[0],0);
  if(cr(0,0+1*1) < cw(0,0+1*1)) {
    r12 = buff(0,0+1*1);
    ASSUME((!(( (cw(0,0+1*1) < 1) && (1 < crmax(0,0+1*1)) )))||(sforbid(0+1*1,1)> 0));
    ASSUME((!(( (cw(0,0+1*1) < 2) && (2 < crmax(0,0+1*1)) )))||(sforbid(0+1*1,2)> 0));
    ASSUME((!(( (cw(0,0+1*1) < 3) && (3 < crmax(0,0+1*1)) )))||(sforbid(0+1*1,3)> 0));
    ASSUME((!(( (cw(0,0+1*1) < 4) && (4 < crmax(0,0+1*1)) )))||(sforbid(0+1*1,4)> 0));
  } else {
    if(pw(0,0+1*1) != co(0+1*1,cr(0,0+1*1))) {
      ASSUME(cr(0,0+1*1) >= old_cr);
    }
    pw(0,0+1*1) = co(0+1*1,cr(0,0+1*1));
    r12 = mem(0+1*1,cr(0,0+1*1));
  }
  ASSUME(creturn[0] >= cr(0,0+1*1));

  //   call void @llvm.dbg.value(metadata i64 %7, metadata !159, metadata !DIExpression()), !dbg !200

  //   %conv12 = trunc i64 %7 to i32, !dbg !113

  //   call void @llvm.dbg.value(metadata i32 %conv12, metadata !156, metadata !DIExpression()), !dbg !170

  //   %cmp13 = icmp eq i32 %conv12, 2, !dbg !114
  creg__r12__2_ = max(0,creg_r12);

  //   %conv14 = zext i1 %cmp13 to i32, !dbg !114

  //   call void @llvm.dbg.value(metadata i32 %conv14, metadata !160, metadata !DIExpression()), !dbg !170

  //   %8 = load i32, i32* @atom_1_X2_2, align 4, !dbg !115, !tbaa !89
  // LD: Guess
  old_cr = cr(0,2);
  cr(0,2) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l77_c13
  // Check
  ASSUME(active[cr(0,2)] == 0);
  ASSUME(cr(0,2) >= iw(0,2));
  ASSUME(cr(0,2) >= 0);
  ASSUME(cr(0,2) >= cdy[0]);
  ASSUME(cr(0,2) >= cisb[0]);
  ASSUME(cr(0,2) >= cdl[0]);
  ASSUME(cr(0,2) >= cl[0]);
  // Update
  creg_r13 = cr(0,2);
  crmax(0,2) = max(crmax(0,2),cr(0,2));
  caddr[0] = max(caddr[0],0);
  if(cr(0,2) < cw(0,2)) {
    r13 = buff(0,2);
    ASSUME((!(( (cw(0,2) < 1) && (1 < crmax(0,2)) )))||(sforbid(2,1)> 0));
    ASSUME((!(( (cw(0,2) < 2) && (2 < crmax(0,2)) )))||(sforbid(2,2)> 0));
    ASSUME((!(( (cw(0,2) < 3) && (3 < crmax(0,2)) )))||(sforbid(2,3)> 0));
    ASSUME((!(( (cw(0,2) < 4) && (4 < crmax(0,2)) )))||(sforbid(2,4)> 0));
  } else {
    if(pw(0,2) != co(2,cr(0,2))) {
      ASSUME(cr(0,2) >= old_cr);
    }
    pw(0,2) = co(2,cr(0,2));
    r13 = mem(2,cr(0,2));
  }
  ASSUME(creturn[0] >= cr(0,2));

  //   call void @llvm.dbg.value(metadata i32 %8, metadata !161, metadata !DIExpression()), !dbg !170

  //   %9 = load i32, i32* @atom_1_X4_0, align 4, !dbg !116, !tbaa !89
  // LD: Guess
  old_cr = cr(0,3);
  cr(0,3) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l78_c13
  // Check
  ASSUME(active[cr(0,3)] == 0);
  ASSUME(cr(0,3) >= iw(0,3));
  ASSUME(cr(0,3) >= 0);
  ASSUME(cr(0,3) >= cdy[0]);
  ASSUME(cr(0,3) >= cisb[0]);
  ASSUME(cr(0,3) >= cdl[0]);
  ASSUME(cr(0,3) >= cl[0]);
  // Update
  creg_r14 = cr(0,3);
  crmax(0,3) = max(crmax(0,3),cr(0,3));
  caddr[0] = max(caddr[0],0);
  if(cr(0,3) < cw(0,3)) {
    r14 = buff(0,3);
    ASSUME((!(( (cw(0,3) < 1) && (1 < crmax(0,3)) )))||(sforbid(3,1)> 0));
    ASSUME((!(( (cw(0,3) < 2) && (2 < crmax(0,3)) )))||(sforbid(3,2)> 0));
    ASSUME((!(( (cw(0,3) < 3) && (3 < crmax(0,3)) )))||(sforbid(3,3)> 0));
    ASSUME((!(( (cw(0,3) < 4) && (4 < crmax(0,3)) )))||(sforbid(3,4)> 0));
  } else {
    if(pw(0,3) != co(3,cr(0,3))) {
      ASSUME(cr(0,3) >= old_cr);
    }
    pw(0,3) = co(3,cr(0,3));
    r14 = mem(3,cr(0,3));
  }
  ASSUME(creturn[0] >= cr(0,3));

  //   call void @llvm.dbg.value(metadata i32 %9, metadata !162, metadata !DIExpression()), !dbg !170

  //   %10 = load i32, i32* @atom_1_X6_1, align 4, !dbg !117, !tbaa !89
  // LD: Guess
  old_cr = cr(0,4);
  cr(0,4) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l79_c13
  // Check
  ASSUME(active[cr(0,4)] == 0);
  ASSUME(cr(0,4) >= iw(0,4));
  ASSUME(cr(0,4) >= 0);
  ASSUME(cr(0,4) >= cdy[0]);
  ASSUME(cr(0,4) >= cisb[0]);
  ASSUME(cr(0,4) >= cdl[0]);
  ASSUME(cr(0,4) >= cl[0]);
  // Update
  creg_r15 = cr(0,4);
  crmax(0,4) = max(crmax(0,4),cr(0,4));
  caddr[0] = max(caddr[0],0);
  if(cr(0,4) < cw(0,4)) {
    r15 = buff(0,4);
    ASSUME((!(( (cw(0,4) < 1) && (1 < crmax(0,4)) )))||(sforbid(4,1)> 0));
    ASSUME((!(( (cw(0,4) < 2) && (2 < crmax(0,4)) )))||(sforbid(4,2)> 0));
    ASSUME((!(( (cw(0,4) < 3) && (3 < crmax(0,4)) )))||(sforbid(4,3)> 0));
    ASSUME((!(( (cw(0,4) < 4) && (4 < crmax(0,4)) )))||(sforbid(4,4)> 0));
  } else {
    if(pw(0,4) != co(4,cr(0,4))) {
      ASSUME(cr(0,4) >= old_cr);
    }
    pw(0,4) = co(4,cr(0,4));
    r15 = mem(4,cr(0,4));
  }
  ASSUME(creturn[0] >= cr(0,4));

  //   call void @llvm.dbg.value(metadata i32 %10, metadata !163, metadata !DIExpression()), !dbg !170

  //   %11 = load i32, i32* @atom_1_X7_1, align 4, !dbg !118, !tbaa !89
  // LD: Guess
  old_cr = cr(0,5);
  cr(0,5) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l80_c13
  // Check
  ASSUME(active[cr(0,5)] == 0);
  ASSUME(cr(0,5) >= iw(0,5));
  ASSUME(cr(0,5) >= 0);
  ASSUME(cr(0,5) >= cdy[0]);
  ASSUME(cr(0,5) >= cisb[0]);
  ASSUME(cr(0,5) >= cdl[0]);
  ASSUME(cr(0,5) >= cl[0]);
  // Update
  creg_r16 = cr(0,5);
  crmax(0,5) = max(crmax(0,5),cr(0,5));
  caddr[0] = max(caddr[0],0);
  if(cr(0,5) < cw(0,5)) {
    r16 = buff(0,5);
    ASSUME((!(( (cw(0,5) < 1) && (1 < crmax(0,5)) )))||(sforbid(5,1)> 0));
    ASSUME((!(( (cw(0,5) < 2) && (2 < crmax(0,5)) )))||(sforbid(5,2)> 0));
    ASSUME((!(( (cw(0,5) < 3) && (3 < crmax(0,5)) )))||(sforbid(5,3)> 0));
    ASSUME((!(( (cw(0,5) < 4) && (4 < crmax(0,5)) )))||(sforbid(5,4)> 0));
  } else {
    if(pw(0,5) != co(5,cr(0,5))) {
      ASSUME(cr(0,5) >= old_cr);
    }
    pw(0,5) = co(5,cr(0,5));
    r16 = mem(5,cr(0,5));
  }
  ASSUME(creturn[0] >= cr(0,5));

  //   call void @llvm.dbg.value(metadata i32 %11, metadata !164, metadata !DIExpression()), !dbg !170

  //   %and = and i32 %10, %11, !dbg !119
  creg_r17 = max(creg_r15,creg_r16);
  r17 = r15 & r16;

  //   call void @llvm.dbg.value(metadata i32 %and, metadata !165, metadata !DIExpression()), !dbg !170

  //   %and15 = and i32 %9, %and, !dbg !120
  creg_r18 = max(creg_r14,creg_r17);
  r18 = r14 & r17;

  //   call void @llvm.dbg.value(metadata i32 %and15, metadata !166, metadata !DIExpression()), !dbg !170

  //   %and16 = and i32 %8, %and15, !dbg !121
  creg_r19 = max(creg_r13,creg_r18);
  r19 = r13 & r18;

  //   call void @llvm.dbg.value(metadata i32 %and16, metadata !167, metadata !DIExpression()), !dbg !170

  //   %and17 = and i32 %conv14, %and16, !dbg !122
  creg_r20 = max(creg__r12__2_,creg_r19);
  r20 = (r12==2) & r19;

  //   call void @llvm.dbg.value(metadata i32 %and17, metadata !168, metadata !DIExpression()), !dbg !170

  //   %and18 = and i32 %conv8, %and17, !dbg !123
  creg_r21 = max(creg__r11__2_,creg_r20);
  r21 = (r11==2) & r20;

  //   call void @llvm.dbg.value(metadata i32 %and18, metadata !169, metadata !DIExpression()), !dbg !170

  //   %cmp19 = icmp eq i32 %and18, 1, !dbg !124
  creg__r21__1_ = max(0,creg_r21);

  //   br i1 %cmp19, label %if.then, label %if.end, !dbg !126
  old_cctrl = cctrl[0];
  cctrl[0] = get_rng(0,NCONTEXT-1);
  ASSUME(cctrl[0] >= old_cctrl);
  ASSUME(cctrl[0] >= creg__r21__1_);
  if((r21==1)) {
    goto T0BLOCK1;
  } else {
    goto T0BLOCK2;
  }

T0BLOCK1:
  //   call void @__assert_fail(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([114 x i8], [114 x i8]* @.str.1, i64 0, i64 0), i32 noundef 86, i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #8, !dbg !127

  //   unreachable, !dbg !127
  r22 = 1;
  goto T0BLOCK_END;

T0BLOCK2:
  //   %12 = bitcast i64* %thr2 to i8*, !dbg !130

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %12) #7, !dbg !130

  //   %13 = bitcast i64* %thr1 to i8*, !dbg !130

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %13) #7, !dbg !130

  //   %14 = bitcast i64* %thr0 to i8*, !dbg !130

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %14) #7, !dbg !130

  //   ret i32 0, !dbg !131
  ret_thread_0 = 0;
  goto T0BLOCK_END;

T0BLOCK_END:

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

  ASSERT(r22== 0);

}
