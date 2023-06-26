// Global variabls:
// 0:vars:3
// 3:atom_1_X0_2:1
// Local global variabls:
// 0:thr0:1
// 1:thr1:1
// 2:thr2:1
// 3:thr3:1
#define ADDRSIZE 4
#define LOCALADDRSIZE 4
#define NTHREAD 5
#define NCONTEXT 10

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
  local_mem[3+0] = 0;
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
  cl[3] = 0;
  cdy[3] = 0;
  cds[3] = 0;
  cdl[3] = 0;
  cisb[3] = 0;
  caddr[3] = 0;
  cctrl[3] = 0;
  cstart[3] = get_rng(0,NCONTEXT-1);
  creturn[3] = get_rng(0,NCONTEXT-1);
  buff(4,0) = 0;
  pw(4,0) = 0;
  cr(4,0) = 0;
  iw(4,0) = 0;
  cw(4,0) = 0;
  cx(4,0) = 0;
  is(4,0) = 0;
  cs(4,0) = 0;
  crmax(4,0) = 0;
  buff(4,1) = 0;
  pw(4,1) = 0;
  cr(4,1) = 0;
  iw(4,1) = 0;
  cw(4,1) = 0;
  cx(4,1) = 0;
  is(4,1) = 0;
  cs(4,1) = 0;
  crmax(4,1) = 0;
  buff(4,2) = 0;
  pw(4,2) = 0;
  cr(4,2) = 0;
  iw(4,2) = 0;
  cw(4,2) = 0;
  cx(4,2) = 0;
  is(4,2) = 0;
  cs(4,2) = 0;
  crmax(4,2) = 0;
  buff(4,3) = 0;
  pw(4,3) = 0;
  cr(4,3) = 0;
  iw(4,3) = 0;
  cw(4,3) = 0;
  cx(4,3) = 0;
  is(4,3) = 0;
  cs(4,3) = 0;
  crmax(4,3) = 0;
  cl[4] = 0;
  cdy[4] = 0;
  cds[4] = 0;
  cdl[4] = 0;
  cisb[4] = 0;
  caddr[4] = 0;
  cctrl[4] = 0;
  cstart[4] = get_rng(0,NCONTEXT-1);
  creturn[4] = get_rng(0,NCONTEXT-1);
  // Dumping initializations
  mem(0+0,0) = 0;
  mem(0+1,0) = 0;
  mem(0+2,0) = 0;
  mem(3+0,0) = 0;
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
  mem(0,5) = meminit(0,5);
  co(0,5) = coinit(0,5);
  delta(0,5) = deltainit(0,5);
  mem(0,6) = meminit(0,6);
  co(0,6) = coinit(0,6);
  delta(0,6) = deltainit(0,6);
  mem(0,7) = meminit(0,7);
  co(0,7) = coinit(0,7);
  delta(0,7) = deltainit(0,7);
  mem(0,8) = meminit(0,8);
  co(0,8) = coinit(0,8);
  delta(0,8) = deltainit(0,8);
  mem(0,9) = meminit(0,9);
  co(0,9) = coinit(0,9);
  delta(0,9) = deltainit(0,9);
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
  mem(1,5) = meminit(1,5);
  co(1,5) = coinit(1,5);
  delta(1,5) = deltainit(1,5);
  mem(1,6) = meminit(1,6);
  co(1,6) = coinit(1,6);
  delta(1,6) = deltainit(1,6);
  mem(1,7) = meminit(1,7);
  co(1,7) = coinit(1,7);
  delta(1,7) = deltainit(1,7);
  mem(1,8) = meminit(1,8);
  co(1,8) = coinit(1,8);
  delta(1,8) = deltainit(1,8);
  mem(1,9) = meminit(1,9);
  co(1,9) = coinit(1,9);
  delta(1,9) = deltainit(1,9);
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
  mem(2,5) = meminit(2,5);
  co(2,5) = coinit(2,5);
  delta(2,5) = deltainit(2,5);
  mem(2,6) = meminit(2,6);
  co(2,6) = coinit(2,6);
  delta(2,6) = deltainit(2,6);
  mem(2,7) = meminit(2,7);
  co(2,7) = coinit(2,7);
  delta(2,7) = deltainit(2,7);
  mem(2,8) = meminit(2,8);
  co(2,8) = coinit(2,8);
  delta(2,8) = deltainit(2,8);
  mem(2,9) = meminit(2,9);
  co(2,9) = coinit(2,9);
  delta(2,9) = deltainit(2,9);
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
  mem(3,5) = meminit(3,5);
  co(3,5) = coinit(3,5);
  delta(3,5) = deltainit(3,5);
  mem(3,6) = meminit(3,6);
  co(3,6) = coinit(3,6);
  delta(3,6) = deltainit(3,6);
  mem(3,7) = meminit(3,7);
  co(3,7) = coinit(3,7);
  delta(3,7) = deltainit(3,7);
  mem(3,8) = meminit(3,8);
  co(3,8) = coinit(3,8);
  delta(3,8) = deltainit(3,8);
  mem(3,9) = meminit(3,9);
  co(3,9) = coinit(3,9);
  delta(3,9) = deltainit(3,9);
  // Dumping thread 1
  int ret_thread_1 = 0;
  cdy[1] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[1] >= cstart[1]);
T1BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !34, metadata !DIExpression()), !dbg !40

  //   br label %label_1, !dbg !41
  goto T1BLOCK1;

T1BLOCK1:
  //   call void @llvm.dbg.label(metadata !39), !dbg !42

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([3 x i64], [3 x i64]* @vars, i64 0, i64 0), metadata !35, metadata !DIExpression()), !dbg !43

  //   call void @llvm.dbg.value(metadata i64 2, metadata !38, metadata !DIExpression()), !dbg !43

  //   store atomic i64 2, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @vars, i64 0, i64 0) release, align 8, !dbg !44
  // ST: Guess
  //   : Release
  iw(1,0) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW _l19_c3
  old_cw = cw(1,0);
  cw(1,0) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM _l19_c3
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
  ASSUME(cw(1,0) >= cr(1,0+0));
  ASSUME(cw(1,0) >= cr(1,0+1));
  ASSUME(cw(1,0) >= cr(1,0+2));
  ASSUME(cw(1,0) >= cr(1,3+0));
  ASSUME(cw(1,0) >= cw(1,0+0));
  ASSUME(cw(1,0) >= cw(1,0+1));
  ASSUME(cw(1,0) >= cw(1,0+2));
  ASSUME(cw(1,0) >= cw(1,3+0));
  // Update
  caddr[1] = max(caddr[1],0);
  buff(1,0) = 2;
  mem(0,cw(1,0)) = 2;
  co(0,cw(1,0))+=1;
  delta(0,cw(1,0)) = -1;
  is(1,0) = iw(1,0);
  cs(1,0) = cw(1,0);
  ASSUME(creturn[1] >= cw(1,0));

  //   ret i8* null, !dbg !45
  ret_thread_1 = (- 1);
  goto T1BLOCK_END;

T1BLOCK_END:

  // Dumping thread 2
  int ret_thread_2 = 0;
  cdy[2] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[2] >= cstart[2]);
T2BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !48, metadata !DIExpression()), !dbg !58

  //   br label %label_2, !dbg !46
  goto T2BLOCK1;

T2BLOCK1:
  //   call void @llvm.dbg.label(metadata !57), !dbg !60

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([3 x i64], [3 x i64]* @vars, i64 0, i64 0), metadata !50, metadata !DIExpression()), !dbg !61

  //   %0 = load atomic i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @vars, i64 0, i64 0) acquire, align 8, !dbg !49
  // LD: Guess
  //   : Acquire
  old_cr = cr(2,0);
  cr(2,0) = get_rng(0,NCONTEXT-1);// 2 ASSIGN LDCOM _l25_c15
  // Check
  ASSUME(active[cr(2,0)] == 2);
  ASSUME(cr(2,0) >= iw(2,0));
  ASSUME(cr(2,0) >= 0);
  ASSUME(cr(2,0) >= cdy[2]);
  ASSUME(cr(2,0) >= cisb[2]);
  ASSUME(cr(2,0) >= cdl[2]);
  ASSUME(cr(2,0) >= cl[2]);
  ASSUME(cr(2,0) >= cx(2,0));
  ASSUME(cr(2,0) >= cs(2,0+0));
  ASSUME(cr(2,0) >= cs(2,0+1));
  ASSUME(cr(2,0) >= cs(2,0+2));
  ASSUME(cr(2,0) >= cs(2,3+0));
  // Update
  creg_r0 = cr(2,0);
  crmax(2,0) = max(crmax(2,0),cr(2,0));
  caddr[2] = max(caddr[2],0);
  if(cr(2,0) < cw(2,0)) {
    r0 = buff(2,0);
    ASSUME((!(( (cw(2,0) < 1) && (1 < crmax(2,0)) )))||(sforbid(0,1)> 0));
    ASSUME((!(( (cw(2,0) < 2) && (2 < crmax(2,0)) )))||(sforbid(0,2)> 0));
    ASSUME((!(( (cw(2,0) < 3) && (3 < crmax(2,0)) )))||(sforbid(0,3)> 0));
    ASSUME((!(( (cw(2,0) < 4) && (4 < crmax(2,0)) )))||(sforbid(0,4)> 0));
    ASSUME((!(( (cw(2,0) < 5) && (5 < crmax(2,0)) )))||(sforbid(0,5)> 0));
    ASSUME((!(( (cw(2,0) < 6) && (6 < crmax(2,0)) )))||(sforbid(0,6)> 0));
    ASSUME((!(( (cw(2,0) < 7) && (7 < crmax(2,0)) )))||(sforbid(0,7)> 0));
    ASSUME((!(( (cw(2,0) < 8) && (8 < crmax(2,0)) )))||(sforbid(0,8)> 0));
    ASSUME((!(( (cw(2,0) < 9) && (9 < crmax(2,0)) )))||(sforbid(0,9)> 0));
  } else {
    if(pw(2,0) != co(0,cr(2,0))) {
      ASSUME(cr(2,0) >= old_cr);
    }
    pw(2,0) = co(0,cr(2,0));
    r0 = mem(0,cr(2,0));
  }
  cl[2] = max(cl[2],cr(2,0));
  ASSUME(creturn[2] >= cr(2,0));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !52, metadata !DIExpression()), !dbg !61

  //   %conv = trunc i64 %0 to i32, !dbg !50

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !49, metadata !DIExpression()), !dbg !58

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([3 x i64], [3 x i64]* @vars, i64 0, i64 1), metadata !53, metadata !DIExpression()), !dbg !64

  //   call void @llvm.dbg.value(metadata i64 1, metadata !55, metadata !DIExpression()), !dbg !64

  //   store atomic i64 1, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @vars, i64 0, i64 1) release, align 8, !dbg !52
  // ST: Guess
  //   : Release
  iw(2,0+1*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW _l26_c3
  old_cw = cw(2,0+1*1);
  cw(2,0+1*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM _l26_c3
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
  ASSUME(cw(2,0+1*1) >= cr(2,0+0));
  ASSUME(cw(2,0+1*1) >= cr(2,0+1));
  ASSUME(cw(2,0+1*1) >= cr(2,0+2));
  ASSUME(cw(2,0+1*1) >= cr(2,3+0));
  ASSUME(cw(2,0+1*1) >= cw(2,0+0));
  ASSUME(cw(2,0+1*1) >= cw(2,0+1));
  ASSUME(cw(2,0+1*1) >= cw(2,0+2));
  ASSUME(cw(2,0+1*1) >= cw(2,3+0));
  // Update
  caddr[2] = max(caddr[2],0);
  buff(2,0+1*1) = 1;
  mem(0+1*1,cw(2,0+1*1)) = 1;
  co(0+1*1,cw(2,0+1*1))+=1;
  delta(0+1*1,cw(2,0+1*1)) = -1;
  is(2,0+1*1) = iw(2,0+1*1);
  cs(2,0+1*1) = cw(2,0+1*1);
  ASSUME(creturn[2] >= cw(2,0+1*1));

  //   %cmp = icmp eq i32 %conv, 2, !dbg !53
  creg__r0__2_ = max(0,creg_r0);

  //   %conv1 = zext i1 %cmp to i32, !dbg !53

  //   call void @llvm.dbg.value(metadata i32 %conv1, metadata !56, metadata !DIExpression()), !dbg !58

  //   store i32 %conv1, i32* @atom_1_X0_2, align 4, !dbg !54, !tbaa !55
  // ST: Guess
  iw(2,3) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW _l28_c15
  old_cw = cw(2,3);
  cw(2,3) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM _l28_c15
  // Check
  ASSUME(active[iw(2,3)] == 2);
  ASSUME(active[cw(2,3)] == 2);
  ASSUME(sforbid(3,cw(2,3))== 0);
  ASSUME(iw(2,3) >= creg__r0__2_);
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
  buff(2,3) = (r0==2);
  mem(3,cw(2,3)) = (r0==2);
  co(3,cw(2,3))+=1;
  delta(3,cw(2,3)) = -1;
  ASSUME(creturn[2] >= cw(2,3));

  //   ret i8* null, !dbg !59
  ret_thread_2 = (- 1);
  goto T2BLOCK_END;

T2BLOCK_END:

  // Dumping thread 3
  int ret_thread_3 = 0;
  cdy[3] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[3] >= cstart[3]);
T3BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !75, metadata !DIExpression()), !dbg !83

  //   br label %label_3, !dbg !44
  goto T3BLOCK1;

T3BLOCK1:
  //   call void @llvm.dbg.label(metadata !82), !dbg !85

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([3 x i64], [3 x i64]* @vars, i64 0, i64 1), metadata !76, metadata !DIExpression()), !dbg !86

  //   call void @llvm.dbg.value(metadata i64 2, metadata !78, metadata !DIExpression()), !dbg !86

  //   store atomic i64 2, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @vars, i64 0, i64 1) release, align 8, !dbg !47
  // ST: Guess
  //   : Release
  iw(3,0+1*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STIW _l34_c3
  old_cw = cw(3,0+1*1);
  cw(3,0+1*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STCOM _l34_c3
  // Check
  ASSUME(active[iw(3,0+1*1)] == 3);
  ASSUME(active[cw(3,0+1*1)] == 3);
  ASSUME(sforbid(0+1*1,cw(3,0+1*1))== 0);
  ASSUME(iw(3,0+1*1) >= 0);
  ASSUME(iw(3,0+1*1) >= 0);
  ASSUME(cw(3,0+1*1) >= iw(3,0+1*1));
  ASSUME(cw(3,0+1*1) >= old_cw);
  ASSUME(cw(3,0+1*1) >= cr(3,0+1*1));
  ASSUME(cw(3,0+1*1) >= cl[3]);
  ASSUME(cw(3,0+1*1) >= cisb[3]);
  ASSUME(cw(3,0+1*1) >= cdy[3]);
  ASSUME(cw(3,0+1*1) >= cdl[3]);
  ASSUME(cw(3,0+1*1) >= cds[3]);
  ASSUME(cw(3,0+1*1) >= cctrl[3]);
  ASSUME(cw(3,0+1*1) >= caddr[3]);
  ASSUME(cw(3,0+1*1) >= cr(3,0+0));
  ASSUME(cw(3,0+1*1) >= cr(3,0+1));
  ASSUME(cw(3,0+1*1) >= cr(3,0+2));
  ASSUME(cw(3,0+1*1) >= cr(3,3+0));
  ASSUME(cw(3,0+1*1) >= cw(3,0+0));
  ASSUME(cw(3,0+1*1) >= cw(3,0+1));
  ASSUME(cw(3,0+1*1) >= cw(3,0+2));
  ASSUME(cw(3,0+1*1) >= cw(3,3+0));
  // Update
  caddr[3] = max(caddr[3],0);
  buff(3,0+1*1) = 2;
  mem(0+1*1,cw(3,0+1*1)) = 2;
  co(0+1*1,cw(3,0+1*1))+=1;
  delta(0+1*1,cw(3,0+1*1)) = -1;
  is(3,0+1*1) = iw(3,0+1*1);
  cs(3,0+1*1) = cw(3,0+1*1);
  ASSUME(creturn[3] >= cw(3,0+1*1));

  //   call void (...) @dmbsy(), !dbg !48
  // dumbsy: Guess
  old_cdy = cdy[3];
  cdy[3] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[3] >= old_cdy);
  ASSUME(cdy[3] >= cisb[3]);
  ASSUME(cdy[3] >= cdl[3]);
  ASSUME(cdy[3] >= cds[3]);
  ASSUME(cdy[3] >= cctrl[3]);
  ASSUME(cdy[3] >= cw(3,0+0));
  ASSUME(cdy[3] >= cw(3,0+1));
  ASSUME(cdy[3] >= cw(3,0+2));
  ASSUME(cdy[3] >= cw(3,3+0));
  ASSUME(cdy[3] >= cr(3,0+0));
  ASSUME(cdy[3] >= cr(3,0+1));
  ASSUME(cdy[3] >= cr(3,0+2));
  ASSUME(cdy[3] >= cr(3,3+0));
  ASSUME(creturn[3] >= cdy[3]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([3 x i64], [3 x i64]* @vars, i64 0, i64 2), metadata !79, metadata !DIExpression()), !dbg !89

  //   call void @llvm.dbg.value(metadata i64 1, metadata !81, metadata !DIExpression()), !dbg !89

  //   store atomic i64 1, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @vars, i64 0, i64 2) monotonic, align 8, !dbg !50
  // ST: Guess
  iw(3,0+2*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STIW _l36_c3
  old_cw = cw(3,0+2*1);
  cw(3,0+2*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STCOM _l36_c3
  // Check
  ASSUME(active[iw(3,0+2*1)] == 3);
  ASSUME(active[cw(3,0+2*1)] == 3);
  ASSUME(sforbid(0+2*1,cw(3,0+2*1))== 0);
  ASSUME(iw(3,0+2*1) >= 0);
  ASSUME(iw(3,0+2*1) >= 0);
  ASSUME(cw(3,0+2*1) >= iw(3,0+2*1));
  ASSUME(cw(3,0+2*1) >= old_cw);
  ASSUME(cw(3,0+2*1) >= cr(3,0+2*1));
  ASSUME(cw(3,0+2*1) >= cl[3]);
  ASSUME(cw(3,0+2*1) >= cisb[3]);
  ASSUME(cw(3,0+2*1) >= cdy[3]);
  ASSUME(cw(3,0+2*1) >= cdl[3]);
  ASSUME(cw(3,0+2*1) >= cds[3]);
  ASSUME(cw(3,0+2*1) >= cctrl[3]);
  ASSUME(cw(3,0+2*1) >= caddr[3]);
  // Update
  caddr[3] = max(caddr[3],0);
  buff(3,0+2*1) = 1;
  mem(0+2*1,cw(3,0+2*1)) = 1;
  co(0+2*1,cw(3,0+2*1))+=1;
  delta(0+2*1,cw(3,0+2*1)) = -1;
  ASSUME(creturn[3] >= cw(3,0+2*1));

  //   ret i8* null, !dbg !51
  ret_thread_3 = (- 1);
  goto T3BLOCK_END;

T3BLOCK_END:

  // Dumping thread 4
  int ret_thread_4 = 0;
  cdy[4] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[4] >= cstart[4]);
T4BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !94, metadata !DIExpression()), !dbg !102

  //   br label %label_4, !dbg !44
  goto T4BLOCK1;

T4BLOCK1:
  //   call void @llvm.dbg.label(metadata !101), !dbg !104

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([3 x i64], [3 x i64]* @vars, i64 0, i64 2), metadata !95, metadata !DIExpression()), !dbg !105

  //   call void @llvm.dbg.value(metadata i64 2, metadata !97, metadata !DIExpression()), !dbg !105

  //   store atomic i64 2, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @vars, i64 0, i64 2) monotonic, align 8, !dbg !47
  // ST: Guess
  iw(4,0+2*1) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STIW _l42_c3
  old_cw = cw(4,0+2*1);
  cw(4,0+2*1) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STCOM _l42_c3
  // Check
  ASSUME(active[iw(4,0+2*1)] == 4);
  ASSUME(active[cw(4,0+2*1)] == 4);
  ASSUME(sforbid(0+2*1,cw(4,0+2*1))== 0);
  ASSUME(iw(4,0+2*1) >= 0);
  ASSUME(iw(4,0+2*1) >= 0);
  ASSUME(cw(4,0+2*1) >= iw(4,0+2*1));
  ASSUME(cw(4,0+2*1) >= old_cw);
  ASSUME(cw(4,0+2*1) >= cr(4,0+2*1));
  ASSUME(cw(4,0+2*1) >= cl[4]);
  ASSUME(cw(4,0+2*1) >= cisb[4]);
  ASSUME(cw(4,0+2*1) >= cdy[4]);
  ASSUME(cw(4,0+2*1) >= cdl[4]);
  ASSUME(cw(4,0+2*1) >= cds[4]);
  ASSUME(cw(4,0+2*1) >= cctrl[4]);
  ASSUME(cw(4,0+2*1) >= caddr[4]);
  // Update
  caddr[4] = max(caddr[4],0);
  buff(4,0+2*1) = 2;
  mem(0+2*1,cw(4,0+2*1)) = 2;
  co(0+2*1,cw(4,0+2*1))+=1;
  delta(0+2*1,cw(4,0+2*1)) = -1;
  ASSUME(creturn[4] >= cw(4,0+2*1));

  //   call void (...) @dmbsy(), !dbg !48
  // dumbsy: Guess
  old_cdy = cdy[4];
  cdy[4] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[4] >= old_cdy);
  ASSUME(cdy[4] >= cisb[4]);
  ASSUME(cdy[4] >= cdl[4]);
  ASSUME(cdy[4] >= cds[4]);
  ASSUME(cdy[4] >= cctrl[4]);
  ASSUME(cdy[4] >= cw(4,0+0));
  ASSUME(cdy[4] >= cw(4,0+1));
  ASSUME(cdy[4] >= cw(4,0+2));
  ASSUME(cdy[4] >= cw(4,3+0));
  ASSUME(cdy[4] >= cr(4,0+0));
  ASSUME(cdy[4] >= cr(4,0+1));
  ASSUME(cdy[4] >= cr(4,0+2));
  ASSUME(cdy[4] >= cr(4,3+0));
  ASSUME(creturn[4] >= cdy[4]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([3 x i64], [3 x i64]* @vars, i64 0, i64 0), metadata !98, metadata !DIExpression()), !dbg !108

  //   call void @llvm.dbg.value(metadata i64 1, metadata !100, metadata !DIExpression()), !dbg !108

  //   store atomic i64 1, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !50
  // ST: Guess
  iw(4,0) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STIW _l44_c3
  old_cw = cw(4,0);
  cw(4,0) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STCOM _l44_c3
  // Check
  ASSUME(active[iw(4,0)] == 4);
  ASSUME(active[cw(4,0)] == 4);
  ASSUME(sforbid(0,cw(4,0))== 0);
  ASSUME(iw(4,0) >= 0);
  ASSUME(iw(4,0) >= 0);
  ASSUME(cw(4,0) >= iw(4,0));
  ASSUME(cw(4,0) >= old_cw);
  ASSUME(cw(4,0) >= cr(4,0));
  ASSUME(cw(4,0) >= cl[4]);
  ASSUME(cw(4,0) >= cisb[4]);
  ASSUME(cw(4,0) >= cdy[4]);
  ASSUME(cw(4,0) >= cdl[4]);
  ASSUME(cw(4,0) >= cds[4]);
  ASSUME(cw(4,0) >= cctrl[4]);
  ASSUME(cw(4,0) >= caddr[4]);
  // Update
  caddr[4] = max(caddr[4],0);
  buff(4,0) = 1;
  mem(0,cw(4,0)) = 1;
  co(0,cw(4,0))+=1;
  delta(0,cw(4,0)) = -1;
  ASSUME(creturn[4] >= cw(4,0));

  //   ret i8* null, !dbg !51
  ret_thread_4 = (- 1);
  goto T4BLOCK_END;

T4BLOCK_END:

  // Dumping thread 0
  int ret_thread_0 = 0;
  cdy[0] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[0] >= cstart[0]);
T0BLOCK0:
  //   %thr0 = alloca i64, align 8

  //   %thr1 = alloca i64, align 8

  //   %thr2 = alloca i64, align 8

  //   %thr3 = alloca i64, align 8

  //   call void @llvm.dbg.value(metadata i32 %argc, metadata !118, metadata !DIExpression()), !dbg !159

  //   call void @llvm.dbg.value(metadata i8** %argv, metadata !119, metadata !DIExpression()), !dbg !159

  //   %0 = bitcast i64* %thr0 to i8*, !dbg !80

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #7, !dbg !80

  //   call void @llvm.dbg.declare(metadata i64* %thr0, metadata !120, metadata !DIExpression()), !dbg !161

  //   %1 = bitcast i64* %thr1 to i8*, !dbg !82

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #7, !dbg !82

  //   call void @llvm.dbg.declare(metadata i64* %thr1, metadata !124, metadata !DIExpression()), !dbg !163

  //   %2 = bitcast i64* %thr2 to i8*, !dbg !84

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #7, !dbg !84

  //   call void @llvm.dbg.declare(metadata i64* %thr2, metadata !125, metadata !DIExpression()), !dbg !165

  //   %3 = bitcast i64* %thr3 to i8*, !dbg !86

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #7, !dbg !86

  //   call void @llvm.dbg.declare(metadata i64* %thr3, metadata !126, metadata !DIExpression()), !dbg !167

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([3 x i64], [3 x i64]* @vars, i64 0, i64 2), metadata !127, metadata !DIExpression()), !dbg !168

  //   call void @llvm.dbg.value(metadata i64 0, metadata !129, metadata !DIExpression()), !dbg !168

  //   store atomic i64 0, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @vars, i64 0, i64 2) monotonic, align 8, !dbg !89
  // ST: Guess
  iw(0,0+2*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l54_c3
  old_cw = cw(0,0+2*1);
  cw(0,0+2*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l54_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([3 x i64], [3 x i64]* @vars, i64 0, i64 1), metadata !130, metadata !DIExpression()), !dbg !170

  //   call void @llvm.dbg.value(metadata i64 0, metadata !132, metadata !DIExpression()), !dbg !170

  //   store atomic i64 0, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !91
  // ST: Guess
  iw(0,0+1*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l55_c3
  old_cw = cw(0,0+1*1);
  cw(0,0+1*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l55_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([3 x i64], [3 x i64]* @vars, i64 0, i64 0), metadata !133, metadata !DIExpression()), !dbg !172

  //   call void @llvm.dbg.value(metadata i64 0, metadata !135, metadata !DIExpression()), !dbg !172

  //   store atomic i64 0, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !93
  // ST: Guess
  iw(0,0) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l56_c3
  old_cw = cw(0,0);
  cw(0,0) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l56_c3
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

  //   call void @llvm.dbg.value(metadata i32* @atom_1_X0_2, metadata !136, metadata !DIExpression()), !dbg !174

  //   call void @llvm.dbg.value(metadata i32 0, metadata !139, metadata !DIExpression()), !dbg !174

  //   store atomic i32 0, i32* @atom_1_X0_2 monotonic, align 4, !dbg !95
  // ST: Guess
  iw(0,3) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l57_c3
  old_cw = cw(0,3);
  cw(0,3) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l57_c3
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
  ASSUME(cdy[0] >= cw(0,0+2));
  ASSUME(cdy[0] >= cw(0,3+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,3+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[1] >= cdy[0]);

  //   %call7 = call i32 @pthread_create(i64* noundef %thr1, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t1, i8* noundef null) #7, !dbg !97
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
  ASSUME(cdy[0] >= cw(0,3+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,3+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[2] >= cdy[0]);

  //   %call8 = call i32 @pthread_create(i64* noundef %thr2, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t2, i8* noundef null) #7, !dbg !98
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
  ASSUME(cdy[0] >= cw(0,3+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,3+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[3] >= cdy[0]);

  //   %call9 = call i32 @pthread_create(i64* noundef %thr3, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t3, i8* noundef null) #7, !dbg !99
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
  ASSUME(cdy[0] >= cw(0,3+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,3+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[4] >= cdy[0]);

  //   %4 = load i64, i64* %thr0, align 8, !dbg !100, !tbaa !101
  r2 = local_mem[0];

  //   %call10 = call i32 @pthread_join(i64 noundef %4, i8** noundef null), !dbg !105
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
  ASSUME(cdy[0] >= cw(0,3+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,3+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[1]);

  //   %5 = load i64, i64* %thr1, align 8, !dbg !106, !tbaa !101
  r3 = local_mem[1];

  //   %call11 = call i32 @pthread_join(i64 noundef %5, i8** noundef null), !dbg !107
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
  ASSUME(cdy[0] >= cw(0,3+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,3+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[2]);

  //   %6 = load i64, i64* %thr2, align 8, !dbg !108, !tbaa !101
  r4 = local_mem[2];

  //   %call12 = call i32 @pthread_join(i64 noundef %6, i8** noundef null), !dbg !109
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
  ASSUME(cdy[0] >= cw(0,3+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,3+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[3]);

  //   %7 = load i64, i64* %thr3, align 8, !dbg !110, !tbaa !101
  r5 = local_mem[3];

  //   %call13 = call i32 @pthread_join(i64 noundef %7, i8** noundef null), !dbg !111
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
  ASSUME(cdy[0] >= cw(0,3+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,3+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[4]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([3 x i64], [3 x i64]* @vars, i64 0, i64 0), metadata !141, metadata !DIExpression()), !dbg !190

  //   %8 = load atomic i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !113
  // LD: Guess
  old_cr = cr(0,0);
  cr(0,0) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l69_c12
  // Check
  ASSUME(active[cr(0,0)] == 0);
  ASSUME(cr(0,0) >= iw(0,0));
  ASSUME(cr(0,0) >= 0);
  ASSUME(cr(0,0) >= cdy[0]);
  ASSUME(cr(0,0) >= cisb[0]);
  ASSUME(cr(0,0) >= cdl[0]);
  ASSUME(cr(0,0) >= cl[0]);
  // Update
  creg_r6 = cr(0,0);
  crmax(0,0) = max(crmax(0,0),cr(0,0));
  caddr[0] = max(caddr[0],0);
  if(cr(0,0) < cw(0,0)) {
    r6 = buff(0,0);
    ASSUME((!(( (cw(0,0) < 1) && (1 < crmax(0,0)) )))||(sforbid(0,1)> 0));
    ASSUME((!(( (cw(0,0) < 2) && (2 < crmax(0,0)) )))||(sforbid(0,2)> 0));
    ASSUME((!(( (cw(0,0) < 3) && (3 < crmax(0,0)) )))||(sforbid(0,3)> 0));
    ASSUME((!(( (cw(0,0) < 4) && (4 < crmax(0,0)) )))||(sforbid(0,4)> 0));
    ASSUME((!(( (cw(0,0) < 5) && (5 < crmax(0,0)) )))||(sforbid(0,5)> 0));
    ASSUME((!(( (cw(0,0) < 6) && (6 < crmax(0,0)) )))||(sforbid(0,6)> 0));
    ASSUME((!(( (cw(0,0) < 7) && (7 < crmax(0,0)) )))||(sforbid(0,7)> 0));
    ASSUME((!(( (cw(0,0) < 8) && (8 < crmax(0,0)) )))||(sforbid(0,8)> 0));
    ASSUME((!(( (cw(0,0) < 9) && (9 < crmax(0,0)) )))||(sforbid(0,9)> 0));
  } else {
    if(pw(0,0) != co(0,cr(0,0))) {
      ASSUME(cr(0,0) >= old_cr);
    }
    pw(0,0) = co(0,cr(0,0));
    r6 = mem(0,cr(0,0));
  }
  ASSUME(creturn[0] >= cr(0,0));

  //   call void @llvm.dbg.value(metadata i64 %8, metadata !143, metadata !DIExpression()), !dbg !190

  //   %conv = trunc i64 %8 to i32, !dbg !114

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !140, metadata !DIExpression()), !dbg !159

  //   %cmp = icmp eq i32 %conv, 2, !dbg !115
  creg__r6__2_ = max(0,creg_r6);

  //   %conv14 = zext i1 %cmp to i32, !dbg !115

  //   call void @llvm.dbg.value(metadata i32 %conv14, metadata !144, metadata !DIExpression()), !dbg !159

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([3 x i64], [3 x i64]* @vars, i64 0, i64 1), metadata !146, metadata !DIExpression()), !dbg !194

  //   %9 = load atomic i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !117
  // LD: Guess
  old_cr = cr(0,0+1*1);
  cr(0,0+1*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l71_c12
  // Check
  ASSUME(active[cr(0,0+1*1)] == 0);
  ASSUME(cr(0,0+1*1) >= iw(0,0+1*1));
  ASSUME(cr(0,0+1*1) >= 0);
  ASSUME(cr(0,0+1*1) >= cdy[0]);
  ASSUME(cr(0,0+1*1) >= cisb[0]);
  ASSUME(cr(0,0+1*1) >= cdl[0]);
  ASSUME(cr(0,0+1*1) >= cl[0]);
  // Update
  creg_r7 = cr(0,0+1*1);
  crmax(0,0+1*1) = max(crmax(0,0+1*1),cr(0,0+1*1));
  caddr[0] = max(caddr[0],0);
  if(cr(0,0+1*1) < cw(0,0+1*1)) {
    r7 = buff(0,0+1*1);
    ASSUME((!(( (cw(0,0+1*1) < 1) && (1 < crmax(0,0+1*1)) )))||(sforbid(0+1*1,1)> 0));
    ASSUME((!(( (cw(0,0+1*1) < 2) && (2 < crmax(0,0+1*1)) )))||(sforbid(0+1*1,2)> 0));
    ASSUME((!(( (cw(0,0+1*1) < 3) && (3 < crmax(0,0+1*1)) )))||(sforbid(0+1*1,3)> 0));
    ASSUME((!(( (cw(0,0+1*1) < 4) && (4 < crmax(0,0+1*1)) )))||(sforbid(0+1*1,4)> 0));
    ASSUME((!(( (cw(0,0+1*1) < 5) && (5 < crmax(0,0+1*1)) )))||(sforbid(0+1*1,5)> 0));
    ASSUME((!(( (cw(0,0+1*1) < 6) && (6 < crmax(0,0+1*1)) )))||(sforbid(0+1*1,6)> 0));
    ASSUME((!(( (cw(0,0+1*1) < 7) && (7 < crmax(0,0+1*1)) )))||(sforbid(0+1*1,7)> 0));
    ASSUME((!(( (cw(0,0+1*1) < 8) && (8 < crmax(0,0+1*1)) )))||(sforbid(0+1*1,8)> 0));
    ASSUME((!(( (cw(0,0+1*1) < 9) && (9 < crmax(0,0+1*1)) )))||(sforbid(0+1*1,9)> 0));
  } else {
    if(pw(0,0+1*1) != co(0+1*1,cr(0,0+1*1))) {
      ASSUME(cr(0,0+1*1) >= old_cr);
    }
    pw(0,0+1*1) = co(0+1*1,cr(0,0+1*1));
    r7 = mem(0+1*1,cr(0,0+1*1));
  }
  ASSUME(creturn[0] >= cr(0,0+1*1));

  //   call void @llvm.dbg.value(metadata i64 %9, metadata !148, metadata !DIExpression()), !dbg !194

  //   %conv18 = trunc i64 %9 to i32, !dbg !118

  //   call void @llvm.dbg.value(metadata i32 %conv18, metadata !145, metadata !DIExpression()), !dbg !159

  //   %cmp19 = icmp eq i32 %conv18, 2, !dbg !119
  creg__r7__2_ = max(0,creg_r7);

  //   %conv20 = zext i1 %cmp19 to i32, !dbg !119

  //   call void @llvm.dbg.value(metadata i32 %conv20, metadata !149, metadata !DIExpression()), !dbg !159

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([3 x i64], [3 x i64]* @vars, i64 0, i64 2), metadata !151, metadata !DIExpression()), !dbg !198

  //   %10 = load atomic i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @vars, i64 0, i64 2) monotonic, align 8, !dbg !121
  // LD: Guess
  old_cr = cr(0,0+2*1);
  cr(0,0+2*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l73_c12
  // Check
  ASSUME(active[cr(0,0+2*1)] == 0);
  ASSUME(cr(0,0+2*1) >= iw(0,0+2*1));
  ASSUME(cr(0,0+2*1) >= 0);
  ASSUME(cr(0,0+2*1) >= cdy[0]);
  ASSUME(cr(0,0+2*1) >= cisb[0]);
  ASSUME(cr(0,0+2*1) >= cdl[0]);
  ASSUME(cr(0,0+2*1) >= cl[0]);
  // Update
  creg_r8 = cr(0,0+2*1);
  crmax(0,0+2*1) = max(crmax(0,0+2*1),cr(0,0+2*1));
  caddr[0] = max(caddr[0],0);
  if(cr(0,0+2*1) < cw(0,0+2*1)) {
    r8 = buff(0,0+2*1);
    ASSUME((!(( (cw(0,0+2*1) < 1) && (1 < crmax(0,0+2*1)) )))||(sforbid(0+2*1,1)> 0));
    ASSUME((!(( (cw(0,0+2*1) < 2) && (2 < crmax(0,0+2*1)) )))||(sforbid(0+2*1,2)> 0));
    ASSUME((!(( (cw(0,0+2*1) < 3) && (3 < crmax(0,0+2*1)) )))||(sforbid(0+2*1,3)> 0));
    ASSUME((!(( (cw(0,0+2*1) < 4) && (4 < crmax(0,0+2*1)) )))||(sforbid(0+2*1,4)> 0));
    ASSUME((!(( (cw(0,0+2*1) < 5) && (5 < crmax(0,0+2*1)) )))||(sforbid(0+2*1,5)> 0));
    ASSUME((!(( (cw(0,0+2*1) < 6) && (6 < crmax(0,0+2*1)) )))||(sforbid(0+2*1,6)> 0));
    ASSUME((!(( (cw(0,0+2*1) < 7) && (7 < crmax(0,0+2*1)) )))||(sforbid(0+2*1,7)> 0));
    ASSUME((!(( (cw(0,0+2*1) < 8) && (8 < crmax(0,0+2*1)) )))||(sforbid(0+2*1,8)> 0));
    ASSUME((!(( (cw(0,0+2*1) < 9) && (9 < crmax(0,0+2*1)) )))||(sforbid(0+2*1,9)> 0));
  } else {
    if(pw(0,0+2*1) != co(0+2*1,cr(0,0+2*1))) {
      ASSUME(cr(0,0+2*1) >= old_cr);
    }
    pw(0,0+2*1) = co(0+2*1,cr(0,0+2*1));
    r8 = mem(0+2*1,cr(0,0+2*1));
  }
  ASSUME(creturn[0] >= cr(0,0+2*1));

  //   call void @llvm.dbg.value(metadata i64 %10, metadata !153, metadata !DIExpression()), !dbg !198

  //   %conv24 = trunc i64 %10 to i32, !dbg !122

  //   call void @llvm.dbg.value(metadata i32 %conv24, metadata !150, metadata !DIExpression()), !dbg !159

  //   %cmp25 = icmp eq i32 %conv24, 2, !dbg !123
  creg__r8__2_ = max(0,creg_r8);

  //   %conv26 = zext i1 %cmp25 to i32, !dbg !123

  //   call void @llvm.dbg.value(metadata i32 %conv26, metadata !154, metadata !DIExpression()), !dbg !159

  //   %11 = load i32, i32* @atom_1_X0_2, align 4, !dbg !124, !tbaa !125
  // LD: Guess
  old_cr = cr(0,3);
  cr(0,3) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l75_c13
  // Check
  ASSUME(active[cr(0,3)] == 0);
  ASSUME(cr(0,3) >= iw(0,3));
  ASSUME(cr(0,3) >= 0);
  ASSUME(cr(0,3) >= cdy[0]);
  ASSUME(cr(0,3) >= cisb[0]);
  ASSUME(cr(0,3) >= cdl[0]);
  ASSUME(cr(0,3) >= cl[0]);
  // Update
  creg_r9 = cr(0,3);
  crmax(0,3) = max(crmax(0,3),cr(0,3));
  caddr[0] = max(caddr[0],0);
  if(cr(0,3) < cw(0,3)) {
    r9 = buff(0,3);
    ASSUME((!(( (cw(0,3) < 1) && (1 < crmax(0,3)) )))||(sforbid(3,1)> 0));
    ASSUME((!(( (cw(0,3) < 2) && (2 < crmax(0,3)) )))||(sforbid(3,2)> 0));
    ASSUME((!(( (cw(0,3) < 3) && (3 < crmax(0,3)) )))||(sforbid(3,3)> 0));
    ASSUME((!(( (cw(0,3) < 4) && (4 < crmax(0,3)) )))||(sforbid(3,4)> 0));
    ASSUME((!(( (cw(0,3) < 5) && (5 < crmax(0,3)) )))||(sforbid(3,5)> 0));
    ASSUME((!(( (cw(0,3) < 6) && (6 < crmax(0,3)) )))||(sforbid(3,6)> 0));
    ASSUME((!(( (cw(0,3) < 7) && (7 < crmax(0,3)) )))||(sforbid(3,7)> 0));
    ASSUME((!(( (cw(0,3) < 8) && (8 < crmax(0,3)) )))||(sforbid(3,8)> 0));
    ASSUME((!(( (cw(0,3) < 9) && (9 < crmax(0,3)) )))||(sforbid(3,9)> 0));
  } else {
    if(pw(0,3) != co(3,cr(0,3))) {
      ASSUME(cr(0,3) >= old_cr);
    }
    pw(0,3) = co(3,cr(0,3));
    r9 = mem(3,cr(0,3));
  }
  ASSUME(creturn[0] >= cr(0,3));

  //   call void @llvm.dbg.value(metadata i32 %11, metadata !155, metadata !DIExpression()), !dbg !159

  //   %and = and i32 %conv26, %11, !dbg !127
  creg_r10 = max(creg__r8__2_,creg_r9);
  r10 = (r8==2) & r9;

  //   call void @llvm.dbg.value(metadata i32 %and, metadata !156, metadata !DIExpression()), !dbg !159

  //   %and27 = and i32 %conv20, %and, !dbg !128
  creg_r11 = max(creg__r7__2_,creg_r10);
  r11 = (r7==2) & r10;

  //   call void @llvm.dbg.value(metadata i32 %and27, metadata !157, metadata !DIExpression()), !dbg !159

  //   %and28 = and i32 %conv14, %and27, !dbg !129
  creg_r12 = max(creg__r6__2_,creg_r11);
  r12 = (r6==2) & r11;

  //   call void @llvm.dbg.value(metadata i32 %and28, metadata !158, metadata !DIExpression()), !dbg !159

  //   %cmp29 = icmp eq i32 %and28, 1, !dbg !130
  creg__r12__1_ = max(0,creg_r12);

  //   br i1 %cmp29, label %if.then, label %if.end, !dbg !132
  old_cctrl = cctrl[0];
  cctrl[0] = get_rng(0,NCONTEXT-1);
  ASSUME(cctrl[0] >= old_cctrl);
  ASSUME(cctrl[0] >= creg__r12__1_);
  if((r12==1)) {
    goto T0BLOCK1;
  } else {
    goto T0BLOCK2;
  }

T0BLOCK1:
  //   call void @__assert_fail(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([118 x i8], [118 x i8]* @.str.1, i64 0, i64 0), i32 noundef 79, i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #8, !dbg !133

  //   unreachable, !dbg !133
  r13 = 1;
  goto T0BLOCK_END;

T0BLOCK2:
  //   %12 = bitcast i64* %thr3 to i8*, !dbg !136

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %12) #7, !dbg !136

  //   %13 = bitcast i64* %thr2 to i8*, !dbg !136

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %13) #7, !dbg !136

  //   %14 = bitcast i64* %thr1 to i8*, !dbg !136

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %14) #7, !dbg !136

  //   %15 = bitcast i64* %thr0 to i8*, !dbg !136

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %15) #7, !dbg !136

  //   ret i32 0, !dbg !137
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
  ASSUME(meminit(0,5) == mem(0,4));
  ASSUME(coinit(0,5) == co(0,4));
  ASSUME(deltainit(0,5) == delta(0,4));
  ASSUME(meminit(0,6) == mem(0,5));
  ASSUME(coinit(0,6) == co(0,5));
  ASSUME(deltainit(0,6) == delta(0,5));
  ASSUME(meminit(0,7) == mem(0,6));
  ASSUME(coinit(0,7) == co(0,6));
  ASSUME(deltainit(0,7) == delta(0,6));
  ASSUME(meminit(0,8) == mem(0,7));
  ASSUME(coinit(0,8) == co(0,7));
  ASSUME(deltainit(0,8) == delta(0,7));
  ASSUME(meminit(0,9) == mem(0,8));
  ASSUME(coinit(0,9) == co(0,8));
  ASSUME(deltainit(0,9) == delta(0,8));
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
  ASSUME(meminit(1,5) == mem(1,4));
  ASSUME(coinit(1,5) == co(1,4));
  ASSUME(deltainit(1,5) == delta(1,4));
  ASSUME(meminit(1,6) == mem(1,5));
  ASSUME(coinit(1,6) == co(1,5));
  ASSUME(deltainit(1,6) == delta(1,5));
  ASSUME(meminit(1,7) == mem(1,6));
  ASSUME(coinit(1,7) == co(1,6));
  ASSUME(deltainit(1,7) == delta(1,6));
  ASSUME(meminit(1,8) == mem(1,7));
  ASSUME(coinit(1,8) == co(1,7));
  ASSUME(deltainit(1,8) == delta(1,7));
  ASSUME(meminit(1,9) == mem(1,8));
  ASSUME(coinit(1,9) == co(1,8));
  ASSUME(deltainit(1,9) == delta(1,8));
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
  ASSUME(meminit(2,5) == mem(2,4));
  ASSUME(coinit(2,5) == co(2,4));
  ASSUME(deltainit(2,5) == delta(2,4));
  ASSUME(meminit(2,6) == mem(2,5));
  ASSUME(coinit(2,6) == co(2,5));
  ASSUME(deltainit(2,6) == delta(2,5));
  ASSUME(meminit(2,7) == mem(2,6));
  ASSUME(coinit(2,7) == co(2,6));
  ASSUME(deltainit(2,7) == delta(2,6));
  ASSUME(meminit(2,8) == mem(2,7));
  ASSUME(coinit(2,8) == co(2,7));
  ASSUME(deltainit(2,8) == delta(2,7));
  ASSUME(meminit(2,9) == mem(2,8));
  ASSUME(coinit(2,9) == co(2,8));
  ASSUME(deltainit(2,9) == delta(2,8));
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
  ASSUME(meminit(3,5) == mem(3,4));
  ASSUME(coinit(3,5) == co(3,4));
  ASSUME(deltainit(3,5) == delta(3,4));
  ASSUME(meminit(3,6) == mem(3,5));
  ASSUME(coinit(3,6) == co(3,5));
  ASSUME(deltainit(3,6) == delta(3,5));
  ASSUME(meminit(3,7) == mem(3,6));
  ASSUME(coinit(3,7) == co(3,6));
  ASSUME(deltainit(3,7) == delta(3,6));
  ASSUME(meminit(3,8) == mem(3,7));
  ASSUME(coinit(3,8) == co(3,7));
  ASSUME(deltainit(3,8) == delta(3,7));
  ASSUME(meminit(3,9) == mem(3,8));
  ASSUME(coinit(3,9) == co(3,8));
  ASSUME(deltainit(3,9) == delta(3,8));

  ASSERT(r13== 0);

}
