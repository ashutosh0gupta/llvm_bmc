// Global variabls:
// 3:atom_0_X2_3:1
// 0:vars:2
// 2:atom_0_X7_2:1
// 4:atom_1_X3_3:1
// 5:atom_1_X2_2:1
// Local global variabls:
// 0:thr0:1
// 1:thr1:1
#define ADDRSIZE 6
#define LOCALADDRSIZE 2
#define NTHREAD 3
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
  // Dumping initializations
  mem(3+0,0) = 0;
  mem(0+0,0) = 0;
  mem(0+1,0) = 0;
  mem(2+0,0) = 0;
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
  mem(4,5) = meminit(4,5);
  co(4,5) = coinit(4,5);
  delta(4,5) = deltainit(4,5);
  mem(4,6) = meminit(4,6);
  co(4,6) = coinit(4,6);
  delta(4,6) = deltainit(4,6);
  mem(4,7) = meminit(4,7);
  co(4,7) = coinit(4,7);
  delta(4,7) = deltainit(4,7);
  mem(4,8) = meminit(4,8);
  co(4,8) = coinit(4,8);
  delta(4,8) = deltainit(4,8);
  mem(4,9) = meminit(4,9);
  co(4,9) = coinit(4,9);
  delta(4,9) = deltainit(4,9);
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
  mem(5,5) = meminit(5,5);
  co(5,5) = coinit(5,5);
  delta(5,5) = deltainit(5,5);
  mem(5,6) = meminit(5,6);
  co(5,6) = coinit(5,6);
  delta(5,6) = deltainit(5,6);
  mem(5,7) = meminit(5,7);
  co(5,7) = coinit(5,7);
  delta(5,7) = deltainit(5,7);
  mem(5,8) = meminit(5,8);
  co(5,8) = coinit(5,8);
  delta(5,8) = deltainit(5,8);
  mem(5,9) = meminit(5,9);
  co(5,9) = coinit(5,9);
  delta(5,9) = deltainit(5,9);
  // Dumping thread 1
  int ret_thread_1 = 0;
  cdy[1] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[1] >= cstart[1]);
T1BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !40, metadata !DIExpression()), !dbg !65

  //   br label %label_1, !dbg !66
  goto T1BLOCK1;

T1BLOCK1:
  //   call void @llvm.dbg.label(metadata !63), !dbg !67

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0), metadata !41, metadata !DIExpression()), !dbg !68

  //   call void @llvm.dbg.value(metadata i64 3, metadata !44, metadata !DIExpression()), !dbg !68

  //   store atomic i64 3, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !69
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
  buff(1,0) = 3;
  mem(0,cw(1,0)) = 3;
  co(0,cw(1,0))+=1;
  delta(0,cw(1,0)) = -1;
  ASSUME(creturn[1] >= cw(1,0));

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0), metadata !46, metadata !DIExpression()), !dbg !70

  //   %0 = load atomic i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !71
  // LD: Guess
  old_cr = cr(1,0);
  cr(1,0) = get_rng(0,NCONTEXT-1);// 1 ASSIGN LDCOM _l23_c15
  // Check
  ASSUME(active[cr(1,0)] == 1);
  ASSUME(cr(1,0) >= iw(1,0));
  ASSUME(cr(1,0) >= 0);
  ASSUME(cr(1,0) >= cdy[1]);
  ASSUME(cr(1,0) >= cisb[1]);
  ASSUME(cr(1,0) >= cdl[1]);
  ASSUME(cr(1,0) >= cl[1]);
  // Update
  creg_r0 = cr(1,0);
  crmax(1,0) = max(crmax(1,0),cr(1,0));
  caddr[1] = max(caddr[1],0);
  if(cr(1,0) < cw(1,0)) {
    r0 = buff(1,0);
    ASSUME((!(( (cw(1,0) < 1) && (1 < crmax(1,0)) )))||(sforbid(0,1)> 0));
    ASSUME((!(( (cw(1,0) < 2) && (2 < crmax(1,0)) )))||(sforbid(0,2)> 0));
    ASSUME((!(( (cw(1,0) < 3) && (3 < crmax(1,0)) )))||(sforbid(0,3)> 0));
    ASSUME((!(( (cw(1,0) < 4) && (4 < crmax(1,0)) )))||(sforbid(0,4)> 0));
    ASSUME((!(( (cw(1,0) < 5) && (5 < crmax(1,0)) )))||(sforbid(0,5)> 0));
    ASSUME((!(( (cw(1,0) < 6) && (6 < crmax(1,0)) )))||(sforbid(0,6)> 0));
    ASSUME((!(( (cw(1,0) < 7) && (7 < crmax(1,0)) )))||(sforbid(0,7)> 0));
    ASSUME((!(( (cw(1,0) < 8) && (8 < crmax(1,0)) )))||(sforbid(0,8)> 0));
    ASSUME((!(( (cw(1,0) < 9) && (9 < crmax(1,0)) )))||(sforbid(0,9)> 0));
  } else {
    if(pw(1,0) != co(0,cr(1,0))) {
      ASSUME(cr(1,0) >= old_cr);
    }
    pw(1,0) = co(0,cr(1,0));
    r0 = mem(0,cr(1,0));
  }
  ASSUME(creturn[1] >= cr(1,0));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !48, metadata !DIExpression()), !dbg !70

  //   %conv = trunc i64 %0 to i32, !dbg !72

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !45, metadata !DIExpression()), !dbg !65

  //   %xor = xor i32 %conv, %conv, !dbg !73
  creg_r1 = creg_r0;
  r1 = r0 ^ r0;

  //   call void @llvm.dbg.value(metadata i32 %xor, metadata !49, metadata !DIExpression()), !dbg !65

  //   %add = add nsw i32 1, %xor, !dbg !74
  creg_r2 = max(0,creg_r1);
  r2 = 1 + r1;

  //   %idxprom = sext i32 %add to i64, !dbg !74

  //   %arrayidx = getelementptr inbounds [2 x i64], [2 x i64]* @vars, i64 0, i64 %idxprom, !dbg !74
  r3 = 0+r2*1;
  creg_r3 = creg_r2;

  //   call void @llvm.dbg.value(metadata i64* %arrayidx, metadata !51, metadata !DIExpression()), !dbg !75

  //   %1 = load atomic i64, i64* %arrayidx monotonic, align 8, !dbg !74
  // LD: Guess
  old_cr = cr(1,r3);
  cr(1,r3) = get_rng(0,NCONTEXT-1);// 1 ASSIGN LDCOM _l25_c15
  // Check
  ASSUME(active[cr(1,r3)] == 1);
  ASSUME(cr(1,r3) >= iw(1,r3));
  ASSUME(cr(1,r3) >= creg_r3);
  ASSUME(cr(1,r3) >= cdy[1]);
  ASSUME(cr(1,r3) >= cisb[1]);
  ASSUME(cr(1,r3) >= cdl[1]);
  ASSUME(cr(1,r3) >= cl[1]);
  // Update
  creg_r4 = cr(1,r3);
  crmax(1,r3) = max(crmax(1,r3),cr(1,r3));
  caddr[1] = max(caddr[1],creg_r3);
  if(cr(1,r3) < cw(1,r3)) {
    r4 = buff(1,r3);
    ASSUME((!(( (cw(1,r3) < 1) && (1 < crmax(1,r3)) )))||(sforbid(r3,1)> 0));
    ASSUME((!(( (cw(1,r3) < 2) && (2 < crmax(1,r3)) )))||(sforbid(r3,2)> 0));
    ASSUME((!(( (cw(1,r3) < 3) && (3 < crmax(1,r3)) )))||(sforbid(r3,3)> 0));
    ASSUME((!(( (cw(1,r3) < 4) && (4 < crmax(1,r3)) )))||(sforbid(r3,4)> 0));
    ASSUME((!(( (cw(1,r3) < 5) && (5 < crmax(1,r3)) )))||(sforbid(r3,5)> 0));
    ASSUME((!(( (cw(1,r3) < 6) && (6 < crmax(1,r3)) )))||(sforbid(r3,6)> 0));
    ASSUME((!(( (cw(1,r3) < 7) && (7 < crmax(1,r3)) )))||(sforbid(r3,7)> 0));
    ASSUME((!(( (cw(1,r3) < 8) && (8 < crmax(1,r3)) )))||(sforbid(r3,8)> 0));
    ASSUME((!(( (cw(1,r3) < 9) && (9 < crmax(1,r3)) )))||(sforbid(r3,9)> 0));
  } else {
    if(pw(1,r3) != co(r3,cr(1,r3))) {
      ASSUME(cr(1,r3) >= old_cr);
    }
    pw(1,r3) = co(r3,cr(1,r3));
    r4 = mem(r3,cr(1,r3));
  }
  ASSUME(creturn[1] >= cr(1,r3));

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !53, metadata !DIExpression()), !dbg !75

  //   %conv4 = trunc i64 %1 to i32, !dbg !76

  //   call void @llvm.dbg.value(metadata i32 %conv4, metadata !50, metadata !DIExpression()), !dbg !65

  //   %tobool = icmp ne i32 %conv4, 0, !dbg !77
  creg__r4__0_ = max(0,creg_r4);

  //   br i1 %tobool, label %if.then, label %if.else, !dbg !79
  old_cctrl = cctrl[1];
  cctrl[1] = get_rng(0,NCONTEXT-1);
  ASSUME(cctrl[1] >= old_cctrl);
  ASSUME(cctrl[1] >= creg__r4__0_);
  if((r4!=0)) {
    goto T1BLOCK2;
  } else {
    goto T1BLOCK3;
  }

T1BLOCK2:
  //   br label %lbl_LC00, !dbg !80
  goto T1BLOCK4;

T1BLOCK3:
  //   br label %lbl_LC00, !dbg !81
  goto T1BLOCK4;

T1BLOCK4:
  //   call void @llvm.dbg.label(metadata !64), !dbg !82

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0), metadata !54, metadata !DIExpression()), !dbg !83

  //   call void @llvm.dbg.value(metadata i64 1, metadata !56, metadata !DIExpression()), !dbg !83

  //   store atomic i64 1, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0) release, align 8, !dbg !84
  // ST: Guess
  //   : Release
  iw(1,0) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW _l28_c3
  old_cw = cw(1,0);
  cw(1,0) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM _l28_c3
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
  ASSUME(cw(1,0) >= cr(1,3+0));
  ASSUME(cw(1,0) >= cr(1,0+0));
  ASSUME(cw(1,0) >= cr(1,0+1));
  ASSUME(cw(1,0) >= cr(1,2+0));
  ASSUME(cw(1,0) >= cr(1,4+0));
  ASSUME(cw(1,0) >= cr(1,5+0));
  ASSUME(cw(1,0) >= cw(1,3+0));
  ASSUME(cw(1,0) >= cw(1,0+0));
  ASSUME(cw(1,0) >= cw(1,0+1));
  ASSUME(cw(1,0) >= cw(1,2+0));
  ASSUME(cw(1,0) >= cw(1,4+0));
  ASSUME(cw(1,0) >= cw(1,5+0));
  // Update
  caddr[1] = max(caddr[1],0);
  buff(1,0) = 1;
  mem(0,cw(1,0)) = 1;
  co(0,cw(1,0))+=1;
  delta(0,cw(1,0)) = -1;
  is(1,0) = iw(1,0);
  cs(1,0) = cw(1,0);
  ASSUME(creturn[1] >= cw(1,0));

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0), metadata !58, metadata !DIExpression()), !dbg !85

  //   %2 = load atomic i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !86
  // LD: Guess
  old_cr = cr(1,0);
  cr(1,0) = get_rng(0,NCONTEXT-1);// 1 ASSIGN LDCOM _l29_c16
  // Check
  ASSUME(active[cr(1,0)] == 1);
  ASSUME(cr(1,0) >= iw(1,0));
  ASSUME(cr(1,0) >= 0);
  ASSUME(cr(1,0) >= cdy[1]);
  ASSUME(cr(1,0) >= cisb[1]);
  ASSUME(cr(1,0) >= cdl[1]);
  ASSUME(cr(1,0) >= cl[1]);
  // Update
  creg_r5 = cr(1,0);
  crmax(1,0) = max(crmax(1,0),cr(1,0));
  caddr[1] = max(caddr[1],0);
  if(cr(1,0) < cw(1,0)) {
    r5 = buff(1,0);
    ASSUME((!(( (cw(1,0) < 1) && (1 < crmax(1,0)) )))||(sforbid(0,1)> 0));
    ASSUME((!(( (cw(1,0) < 2) && (2 < crmax(1,0)) )))||(sforbid(0,2)> 0));
    ASSUME((!(( (cw(1,0) < 3) && (3 < crmax(1,0)) )))||(sforbid(0,3)> 0));
    ASSUME((!(( (cw(1,0) < 4) && (4 < crmax(1,0)) )))||(sforbid(0,4)> 0));
    ASSUME((!(( (cw(1,0) < 5) && (5 < crmax(1,0)) )))||(sforbid(0,5)> 0));
    ASSUME((!(( (cw(1,0) < 6) && (6 < crmax(1,0)) )))||(sforbid(0,6)> 0));
    ASSUME((!(( (cw(1,0) < 7) && (7 < crmax(1,0)) )))||(sforbid(0,7)> 0));
    ASSUME((!(( (cw(1,0) < 8) && (8 < crmax(1,0)) )))||(sforbid(0,8)> 0));
    ASSUME((!(( (cw(1,0) < 9) && (9 < crmax(1,0)) )))||(sforbid(0,9)> 0));
  } else {
    if(pw(1,0) != co(0,cr(1,0))) {
      ASSUME(cr(1,0) >= old_cr);
    }
    pw(1,0) = co(0,cr(1,0));
    r5 = mem(0,cr(1,0));
  }
  ASSUME(creturn[1] >= cr(1,0));

  //   call void @llvm.dbg.value(metadata i64 %2, metadata !60, metadata !DIExpression()), !dbg !85

  //   %conv10 = trunc i64 %2 to i32, !dbg !87

  //   call void @llvm.dbg.value(metadata i32 %conv10, metadata !57, metadata !DIExpression()), !dbg !65

  //   %cmp = icmp eq i32 %conv10, 2, !dbg !88
  creg__r5__2_ = max(0,creg_r5);

  //   %conv11 = zext i1 %cmp to i32, !dbg !88

  //   call void @llvm.dbg.value(metadata i32 %conv11, metadata !61, metadata !DIExpression()), !dbg !65

  //   store i32 %conv11, i32* @atom_0_X7_2, align 4, !dbg !89, !tbaa !90
  // ST: Guess
  iw(1,2) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW _l31_c15
  old_cw = cw(1,2);
  cw(1,2) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM _l31_c15
  // Check
  ASSUME(active[iw(1,2)] == 1);
  ASSUME(active[cw(1,2)] == 1);
  ASSUME(sforbid(2,cw(1,2))== 0);
  ASSUME(iw(1,2) >= creg__r5__2_);
  ASSUME(iw(1,2) >= 0);
  ASSUME(cw(1,2) >= iw(1,2));
  ASSUME(cw(1,2) >= old_cw);
  ASSUME(cw(1,2) >= cr(1,2));
  ASSUME(cw(1,2) >= cl[1]);
  ASSUME(cw(1,2) >= cisb[1]);
  ASSUME(cw(1,2) >= cdy[1]);
  ASSUME(cw(1,2) >= cdl[1]);
  ASSUME(cw(1,2) >= cds[1]);
  ASSUME(cw(1,2) >= cctrl[1]);
  ASSUME(cw(1,2) >= caddr[1]);
  // Update
  caddr[1] = max(caddr[1],0);
  buff(1,2) = (r5==2);
  mem(2,cw(1,2)) = (r5==2);
  co(2,cw(1,2))+=1;
  delta(2,cw(1,2)) = -1;
  ASSUME(creturn[1] >= cw(1,2));

  //   %cmp12 = icmp eq i32 %conv, 3, !dbg !94
  creg__r0__3_ = max(0,creg_r0);

  //   %conv13 = zext i1 %cmp12 to i32, !dbg !94

  //   call void @llvm.dbg.value(metadata i32 %conv13, metadata !62, metadata !DIExpression()), !dbg !65

  //   store i32 %conv13, i32* @atom_0_X2_3, align 4, !dbg !95, !tbaa !90
  // ST: Guess
  iw(1,3) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW _l33_c15
  old_cw = cw(1,3);
  cw(1,3) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM _l33_c15
  // Check
  ASSUME(active[iw(1,3)] == 1);
  ASSUME(active[cw(1,3)] == 1);
  ASSUME(sforbid(3,cw(1,3))== 0);
  ASSUME(iw(1,3) >= creg__r0__3_);
  ASSUME(iw(1,3) >= 0);
  ASSUME(cw(1,3) >= iw(1,3));
  ASSUME(cw(1,3) >= old_cw);
  ASSUME(cw(1,3) >= cr(1,3));
  ASSUME(cw(1,3) >= cl[1]);
  ASSUME(cw(1,3) >= cisb[1]);
  ASSUME(cw(1,3) >= cdy[1]);
  ASSUME(cw(1,3) >= cdl[1]);
  ASSUME(cw(1,3) >= cds[1]);
  ASSUME(cw(1,3) >= cctrl[1]);
  ASSUME(cw(1,3) >= caddr[1]);
  // Update
  caddr[1] = max(caddr[1],0);
  buff(1,3) = (r0==3);
  mem(3,cw(1,3)) = (r0==3);
  co(3,cw(1,3))+=1;
  delta(3,cw(1,3)) = -1;
  ASSUME(creturn[1] >= cw(1,3));

  //   ret i8* null, !dbg !96
  ret_thread_1 = (- 1);
  goto T1BLOCK_END;

T1BLOCK_END:

  // Dumping thread 2
  int ret_thread_2 = 0;
  cdy[2] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[2] >= cstart[2]);
T2BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !99, metadata !DIExpression()), !dbg !114

  //   br label %label_2, !dbg !57
  goto T2BLOCK1;

T2BLOCK1:
  //   call void @llvm.dbg.label(metadata !113), !dbg !116

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0), metadata !100, metadata !DIExpression()), !dbg !117

  //   call void @llvm.dbg.value(metadata i64 2, metadata !102, metadata !DIExpression()), !dbg !117

  //   store atomic i64 2, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0) release, align 8, !dbg !60
  // ST: Guess
  //   : Release
  iw(2,0) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW _l39_c3
  old_cw = cw(2,0);
  cw(2,0) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM _l39_c3
  // Check
  ASSUME(active[iw(2,0)] == 2);
  ASSUME(active[cw(2,0)] == 2);
  ASSUME(sforbid(0,cw(2,0))== 0);
  ASSUME(iw(2,0) >= 0);
  ASSUME(iw(2,0) >= 0);
  ASSUME(cw(2,0) >= iw(2,0));
  ASSUME(cw(2,0) >= old_cw);
  ASSUME(cw(2,0) >= cr(2,0));
  ASSUME(cw(2,0) >= cl[2]);
  ASSUME(cw(2,0) >= cisb[2]);
  ASSUME(cw(2,0) >= cdy[2]);
  ASSUME(cw(2,0) >= cdl[2]);
  ASSUME(cw(2,0) >= cds[2]);
  ASSUME(cw(2,0) >= cctrl[2]);
  ASSUME(cw(2,0) >= caddr[2]);
  ASSUME(cw(2,0) >= cr(2,3+0));
  ASSUME(cw(2,0) >= cr(2,0+0));
  ASSUME(cw(2,0) >= cr(2,0+1));
  ASSUME(cw(2,0) >= cr(2,2+0));
  ASSUME(cw(2,0) >= cr(2,4+0));
  ASSUME(cw(2,0) >= cr(2,5+0));
  ASSUME(cw(2,0) >= cw(2,3+0));
  ASSUME(cw(2,0) >= cw(2,0+0));
  ASSUME(cw(2,0) >= cw(2,0+1));
  ASSUME(cw(2,0) >= cw(2,2+0));
  ASSUME(cw(2,0) >= cw(2,4+0));
  ASSUME(cw(2,0) >= cw(2,5+0));
  // Update
  caddr[2] = max(caddr[2],0);
  buff(2,0) = 2;
  mem(0,cw(2,0)) = 2;
  co(0,cw(2,0))+=1;
  delta(0,cw(2,0)) = -1;
  is(2,0) = iw(2,0);
  cs(2,0) = cw(2,0);
  ASSUME(creturn[2] >= cw(2,0));

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0), metadata !104, metadata !DIExpression()), !dbg !119

  //   %0 = load atomic i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0) acquire, align 8, !dbg !62
  // LD: Guess
  //   : Acquire
  old_cr = cr(2,0);
  cr(2,0) = get_rng(0,NCONTEXT-1);// 2 ASSIGN LDCOM _l40_c16
  // Check
  ASSUME(active[cr(2,0)] == 2);
  ASSUME(cr(2,0) >= iw(2,0));
  ASSUME(cr(2,0) >= 0);
  ASSUME(cr(2,0) >= cdy[2]);
  ASSUME(cr(2,0) >= cisb[2]);
  ASSUME(cr(2,0) >= cdl[2]);
  ASSUME(cr(2,0) >= cl[2]);
  ASSUME(cr(2,0) >= cx(2,0));
  ASSUME(cr(2,0) >= cs(2,3+0));
  ASSUME(cr(2,0) >= cs(2,0+0));
  ASSUME(cr(2,0) >= cs(2,0+1));
  ASSUME(cr(2,0) >= cs(2,2+0));
  ASSUME(cr(2,0) >= cs(2,4+0));
  ASSUME(cr(2,0) >= cs(2,5+0));
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
    r6 = mem(0,cr(2,0));
  }
  cl[2] = max(cl[2],cr(2,0));
  ASSUME(creturn[2] >= cr(2,0));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !106, metadata !DIExpression()), !dbg !119

  //   %conv = trunc i64 %0 to i32, !dbg !63

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !103, metadata !DIExpression()), !dbg !114

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0), metadata !108, metadata !DIExpression()), !dbg !122

  //   %1 = load atomic i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !65
  // LD: Guess
  old_cr = cr(2,0);
  cr(2,0) = get_rng(0,NCONTEXT-1);// 2 ASSIGN LDCOM _l41_c16
  // Check
  ASSUME(active[cr(2,0)] == 2);
  ASSUME(cr(2,0) >= iw(2,0));
  ASSUME(cr(2,0) >= 0);
  ASSUME(cr(2,0) >= cdy[2]);
  ASSUME(cr(2,0) >= cisb[2]);
  ASSUME(cr(2,0) >= cdl[2]);
  ASSUME(cr(2,0) >= cl[2]);
  // Update
  creg_r7 = cr(2,0);
  crmax(2,0) = max(crmax(2,0),cr(2,0));
  caddr[2] = max(caddr[2],0);
  if(cr(2,0) < cw(2,0)) {
    r7 = buff(2,0);
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
    r7 = mem(0,cr(2,0));
  }
  ASSUME(creturn[2] >= cr(2,0));

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !110, metadata !DIExpression()), !dbg !122

  //   %conv4 = trunc i64 %1 to i32, !dbg !66

  //   call void @llvm.dbg.value(metadata i32 %conv4, metadata !107, metadata !DIExpression()), !dbg !114

  //   %cmp = icmp eq i32 %conv4, 3, !dbg !67
  creg__r7__3_ = max(0,creg_r7);

  //   %conv5 = zext i1 %cmp to i32, !dbg !67

  //   call void @llvm.dbg.value(metadata i32 %conv5, metadata !111, metadata !DIExpression()), !dbg !114

  //   store i32 %conv5, i32* @atom_1_X3_3, align 4, !dbg !68, !tbaa !69
  // ST: Guess
  iw(2,4) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW _l43_c15
  old_cw = cw(2,4);
  cw(2,4) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM _l43_c15
  // Check
  ASSUME(active[iw(2,4)] == 2);
  ASSUME(active[cw(2,4)] == 2);
  ASSUME(sforbid(4,cw(2,4))== 0);
  ASSUME(iw(2,4) >= creg__r7__3_);
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
  buff(2,4) = (r7==3);
  mem(4,cw(2,4)) = (r7==3);
  co(4,cw(2,4))+=1;
  delta(4,cw(2,4)) = -1;
  ASSUME(creturn[2] >= cw(2,4));

  //   %cmp6 = icmp eq i32 %conv, 2, !dbg !73
  creg__r6__2_ = max(0,creg_r6);

  //   %conv7 = zext i1 %cmp6 to i32, !dbg !73

  //   call void @llvm.dbg.value(metadata i32 %conv7, metadata !112, metadata !DIExpression()), !dbg !114

  //   store i32 %conv7, i32* @atom_1_X2_2, align 4, !dbg !74, !tbaa !69
  // ST: Guess
  iw(2,5) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW _l45_c15
  old_cw = cw(2,5);
  cw(2,5) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM _l45_c15
  // Check
  ASSUME(active[iw(2,5)] == 2);
  ASSUME(active[cw(2,5)] == 2);
  ASSUME(sforbid(5,cw(2,5))== 0);
  ASSUME(iw(2,5) >= creg__r6__2_);
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
  buff(2,5) = (r6==2);
  mem(5,cw(2,5)) = (r6==2);
  co(5,cw(2,5))+=1;
  delta(5,cw(2,5)) = -1;
  ASSUME(creturn[2] >= cw(2,5));

  //   ret i8* null, !dbg !75
  ret_thread_2 = (- 1);
  goto T2BLOCK_END;

T2BLOCK_END:

  // Dumping thread 0
  int ret_thread_0 = 0;
  cdy[0] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[0] >= cstart[0]);
T0BLOCK0:
  //   %thr0 = alloca i64, align 8

  //   %thr1 = alloca i64, align 8

  //   call void @llvm.dbg.value(metadata i32 %argc, metadata !137, metadata !DIExpression()), !dbg !176

  //   call void @llvm.dbg.value(metadata i8** %argv, metadata !138, metadata !DIExpression()), !dbg !176

  //   %0 = bitcast i64* %thr0 to i8*, !dbg !84

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #7, !dbg !84

  //   call void @llvm.dbg.declare(metadata i64* %thr0, metadata !139, metadata !DIExpression()), !dbg !178

  //   %1 = bitcast i64* %thr1 to i8*, !dbg !86

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #7, !dbg !86

  //   call void @llvm.dbg.declare(metadata i64* %thr1, metadata !143, metadata !DIExpression()), !dbg !180

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 1), metadata !144, metadata !DIExpression()), !dbg !181

  //   call void @llvm.dbg.value(metadata i64 0, metadata !146, metadata !DIExpression()), !dbg !181

  //   store atomic i64 0, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !89
  // ST: Guess
  iw(0,0+1*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l53_c3
  old_cw = cw(0,0+1*1);
  cw(0,0+1*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l53_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0), metadata !147, metadata !DIExpression()), !dbg !183

  //   call void @llvm.dbg.value(metadata i64 0, metadata !149, metadata !DIExpression()), !dbg !183

  //   store atomic i64 0, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !91
  // ST: Guess
  iw(0,0) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l54_c3
  old_cw = cw(0,0);
  cw(0,0) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l54_c3
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

  //   call void @llvm.dbg.value(metadata i32* @atom_0_X7_2, metadata !150, metadata !DIExpression()), !dbg !185

  //   call void @llvm.dbg.value(metadata i32 0, metadata !153, metadata !DIExpression()), !dbg !185

  //   store atomic i32 0, i32* @atom_0_X7_2 monotonic, align 4, !dbg !93
  // ST: Guess
  iw(0,2) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l55_c3
  old_cw = cw(0,2);
  cw(0,2) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l55_c3
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

  //   call void @llvm.dbg.value(metadata i32* @atom_0_X2_3, metadata !154, metadata !DIExpression()), !dbg !187

  //   call void @llvm.dbg.value(metadata i32 0, metadata !156, metadata !DIExpression()), !dbg !187

  //   store atomic i32 0, i32* @atom_0_X2_3 monotonic, align 4, !dbg !95
  // ST: Guess
  iw(0,3) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l56_c3
  old_cw = cw(0,3);
  cw(0,3) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l56_c3
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

  //   call void @llvm.dbg.value(metadata i32* @atom_1_X3_3, metadata !157, metadata !DIExpression()), !dbg !189

  //   call void @llvm.dbg.value(metadata i32 0, metadata !159, metadata !DIExpression()), !dbg !189

  //   store atomic i32 0, i32* @atom_1_X3_3 monotonic, align 4, !dbg !97
  // ST: Guess
  iw(0,4) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l57_c3
  old_cw = cw(0,4);
  cw(0,4) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l57_c3
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

  //   call void @llvm.dbg.value(metadata i32* @atom_1_X2_2, metadata !160, metadata !DIExpression()), !dbg !191

  //   call void @llvm.dbg.value(metadata i32 0, metadata !162, metadata !DIExpression()), !dbg !191

  //   store atomic i32 0, i32* @atom_1_X2_2 monotonic, align 4, !dbg !99
  // ST: Guess
  iw(0,5) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l58_c3
  old_cw = cw(0,5);
  cw(0,5) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l58_c3
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

  //   %call = call i32 @pthread_create(i64* noundef %thr0, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t0, i8* noundef null) #7, !dbg !100
  // dumbsy: Guess
  old_cdy = cdy[0];
  cdy[0] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[0] >= old_cdy);
  ASSUME(cdy[0] >= cisb[0]);
  ASSUME(cdy[0] >= cdl[0]);
  ASSUME(cdy[0] >= cds[0]);
  ASSUME(cdy[0] >= cctrl[0]);
  ASSUME(cdy[0] >= cw(0,3+0));
  ASSUME(cdy[0] >= cw(0,0+0));
  ASSUME(cdy[0] >= cw(0,0+1));
  ASSUME(cdy[0] >= cw(0,2+0));
  ASSUME(cdy[0] >= cw(0,4+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cr(0,3+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,2+0));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[1] >= cdy[0]);

  //   %call11 = call i32 @pthread_create(i64* noundef %thr1, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t1, i8* noundef null) #7, !dbg !101
  // dumbsy: Guess
  old_cdy = cdy[0];
  cdy[0] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[0] >= old_cdy);
  ASSUME(cdy[0] >= cisb[0]);
  ASSUME(cdy[0] >= cdl[0]);
  ASSUME(cdy[0] >= cds[0]);
  ASSUME(cdy[0] >= cctrl[0]);
  ASSUME(cdy[0] >= cw(0,3+0));
  ASSUME(cdy[0] >= cw(0,0+0));
  ASSUME(cdy[0] >= cw(0,0+1));
  ASSUME(cdy[0] >= cw(0,2+0));
  ASSUME(cdy[0] >= cw(0,4+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cr(0,3+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,2+0));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[2] >= cdy[0]);

  //   %2 = load i64, i64* %thr0, align 8, !dbg !102, !tbaa !103
  r9 = local_mem[0];

  //   %call12 = call i32 @pthread_join(i64 noundef %2, i8** noundef null), !dbg !107
  // dumbsy: Guess
  old_cdy = cdy[0];
  cdy[0] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[0] >= old_cdy);
  ASSUME(cdy[0] >= cisb[0]);
  ASSUME(cdy[0] >= cdl[0]);
  ASSUME(cdy[0] >= cds[0]);
  ASSUME(cdy[0] >= cctrl[0]);
  ASSUME(cdy[0] >= cw(0,3+0));
  ASSUME(cdy[0] >= cw(0,0+0));
  ASSUME(cdy[0] >= cw(0,0+1));
  ASSUME(cdy[0] >= cw(0,2+0));
  ASSUME(cdy[0] >= cw(0,4+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cr(0,3+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,2+0));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[1]);

  //   %3 = load i64, i64* %thr1, align 8, !dbg !108, !tbaa !103
  r10 = local_mem[1];

  //   %call13 = call i32 @pthread_join(i64 noundef %3, i8** noundef null), !dbg !109
  // dumbsy: Guess
  old_cdy = cdy[0];
  cdy[0] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[0] >= old_cdy);
  ASSUME(cdy[0] >= cisb[0]);
  ASSUME(cdy[0] >= cdl[0]);
  ASSUME(cdy[0] >= cds[0]);
  ASSUME(cdy[0] >= cctrl[0]);
  ASSUME(cdy[0] >= cw(0,3+0));
  ASSUME(cdy[0] >= cw(0,0+0));
  ASSUME(cdy[0] >= cw(0,0+1));
  ASSUME(cdy[0] >= cw(0,2+0));
  ASSUME(cdy[0] >= cw(0,4+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cr(0,3+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,2+0));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[2]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0), metadata !164, metadata !DIExpression()), !dbg !201

  //   %4 = load atomic i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !111
  // LD: Guess
  old_cr = cr(0,0);
  cr(0,0) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l66_c13
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
    r11 = mem(0,cr(0,0));
  }
  ASSUME(creturn[0] >= cr(0,0));

  //   call void @llvm.dbg.value(metadata i64 %4, metadata !166, metadata !DIExpression()), !dbg !201

  //   %conv = trunc i64 %4 to i32, !dbg !112

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !163, metadata !DIExpression()), !dbg !176

  //   %cmp = icmp eq i32 %conv, 3, !dbg !113
  creg__r11__3_ = max(0,creg_r11);

  //   %conv14 = zext i1 %cmp to i32, !dbg !113

  //   call void @llvm.dbg.value(metadata i32 %conv14, metadata !167, metadata !DIExpression()), !dbg !176

  //   %5 = load i32, i32* @atom_0_X7_2, align 4, !dbg !114, !tbaa !115
  // LD: Guess
  old_cr = cr(0,2);
  cr(0,2) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l68_c13
  // Check
  ASSUME(active[cr(0,2)] == 0);
  ASSUME(cr(0,2) >= iw(0,2));
  ASSUME(cr(0,2) >= 0);
  ASSUME(cr(0,2) >= cdy[0]);
  ASSUME(cr(0,2) >= cisb[0]);
  ASSUME(cr(0,2) >= cdl[0]);
  ASSUME(cr(0,2) >= cl[0]);
  // Update
  creg_r12 = cr(0,2);
  crmax(0,2) = max(crmax(0,2),cr(0,2));
  caddr[0] = max(caddr[0],0);
  if(cr(0,2) < cw(0,2)) {
    r12 = buff(0,2);
    ASSUME((!(( (cw(0,2) < 1) && (1 < crmax(0,2)) )))||(sforbid(2,1)> 0));
    ASSUME((!(( (cw(0,2) < 2) && (2 < crmax(0,2)) )))||(sforbid(2,2)> 0));
    ASSUME((!(( (cw(0,2) < 3) && (3 < crmax(0,2)) )))||(sforbid(2,3)> 0));
    ASSUME((!(( (cw(0,2) < 4) && (4 < crmax(0,2)) )))||(sforbid(2,4)> 0));
    ASSUME((!(( (cw(0,2) < 5) && (5 < crmax(0,2)) )))||(sforbid(2,5)> 0));
    ASSUME((!(( (cw(0,2) < 6) && (6 < crmax(0,2)) )))||(sforbid(2,6)> 0));
    ASSUME((!(( (cw(0,2) < 7) && (7 < crmax(0,2)) )))||(sforbid(2,7)> 0));
    ASSUME((!(( (cw(0,2) < 8) && (8 < crmax(0,2)) )))||(sforbid(2,8)> 0));
    ASSUME((!(( (cw(0,2) < 9) && (9 < crmax(0,2)) )))||(sforbid(2,9)> 0));
  } else {
    if(pw(0,2) != co(2,cr(0,2))) {
      ASSUME(cr(0,2) >= old_cr);
    }
    pw(0,2) = co(2,cr(0,2));
    r12 = mem(2,cr(0,2));
  }
  ASSUME(creturn[0] >= cr(0,2));

  //   call void @llvm.dbg.value(metadata i32 %5, metadata !168, metadata !DIExpression()), !dbg !176

  //   %6 = load i32, i32* @atom_0_X2_3, align 4, !dbg !117, !tbaa !115
  // LD: Guess
  old_cr = cr(0,3);
  cr(0,3) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l69_c13
  // Check
  ASSUME(active[cr(0,3)] == 0);
  ASSUME(cr(0,3) >= iw(0,3));
  ASSUME(cr(0,3) >= 0);
  ASSUME(cr(0,3) >= cdy[0]);
  ASSUME(cr(0,3) >= cisb[0]);
  ASSUME(cr(0,3) >= cdl[0]);
  ASSUME(cr(0,3) >= cl[0]);
  // Update
  creg_r13 = cr(0,3);
  crmax(0,3) = max(crmax(0,3),cr(0,3));
  caddr[0] = max(caddr[0],0);
  if(cr(0,3) < cw(0,3)) {
    r13 = buff(0,3);
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
    r13 = mem(3,cr(0,3));
  }
  ASSUME(creturn[0] >= cr(0,3));

  //   call void @llvm.dbg.value(metadata i32 %6, metadata !169, metadata !DIExpression()), !dbg !176

  //   %7 = load i32, i32* @atom_1_X3_3, align 4, !dbg !118, !tbaa !115
  // LD: Guess
  old_cr = cr(0,4);
  cr(0,4) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l70_c13
  // Check
  ASSUME(active[cr(0,4)] == 0);
  ASSUME(cr(0,4) >= iw(0,4));
  ASSUME(cr(0,4) >= 0);
  ASSUME(cr(0,4) >= cdy[0]);
  ASSUME(cr(0,4) >= cisb[0]);
  ASSUME(cr(0,4) >= cdl[0]);
  ASSUME(cr(0,4) >= cl[0]);
  // Update
  creg_r14 = cr(0,4);
  crmax(0,4) = max(crmax(0,4),cr(0,4));
  caddr[0] = max(caddr[0],0);
  if(cr(0,4) < cw(0,4)) {
    r14 = buff(0,4);
    ASSUME((!(( (cw(0,4) < 1) && (1 < crmax(0,4)) )))||(sforbid(4,1)> 0));
    ASSUME((!(( (cw(0,4) < 2) && (2 < crmax(0,4)) )))||(sforbid(4,2)> 0));
    ASSUME((!(( (cw(0,4) < 3) && (3 < crmax(0,4)) )))||(sforbid(4,3)> 0));
    ASSUME((!(( (cw(0,4) < 4) && (4 < crmax(0,4)) )))||(sforbid(4,4)> 0));
    ASSUME((!(( (cw(0,4) < 5) && (5 < crmax(0,4)) )))||(sforbid(4,5)> 0));
    ASSUME((!(( (cw(0,4) < 6) && (6 < crmax(0,4)) )))||(sforbid(4,6)> 0));
    ASSUME((!(( (cw(0,4) < 7) && (7 < crmax(0,4)) )))||(sforbid(4,7)> 0));
    ASSUME((!(( (cw(0,4) < 8) && (8 < crmax(0,4)) )))||(sforbid(4,8)> 0));
    ASSUME((!(( (cw(0,4) < 9) && (9 < crmax(0,4)) )))||(sforbid(4,9)> 0));
  } else {
    if(pw(0,4) != co(4,cr(0,4))) {
      ASSUME(cr(0,4) >= old_cr);
    }
    pw(0,4) = co(4,cr(0,4));
    r14 = mem(4,cr(0,4));
  }
  ASSUME(creturn[0] >= cr(0,4));

  //   call void @llvm.dbg.value(metadata i32 %7, metadata !170, metadata !DIExpression()), !dbg !176

  //   %8 = load i32, i32* @atom_1_X2_2, align 4, !dbg !119, !tbaa !115
  // LD: Guess
  old_cr = cr(0,5);
  cr(0,5) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l71_c13
  // Check
  ASSUME(active[cr(0,5)] == 0);
  ASSUME(cr(0,5) >= iw(0,5));
  ASSUME(cr(0,5) >= 0);
  ASSUME(cr(0,5) >= cdy[0]);
  ASSUME(cr(0,5) >= cisb[0]);
  ASSUME(cr(0,5) >= cdl[0]);
  ASSUME(cr(0,5) >= cl[0]);
  // Update
  creg_r15 = cr(0,5);
  crmax(0,5) = max(crmax(0,5),cr(0,5));
  caddr[0] = max(caddr[0],0);
  if(cr(0,5) < cw(0,5)) {
    r15 = buff(0,5);
    ASSUME((!(( (cw(0,5) < 1) && (1 < crmax(0,5)) )))||(sforbid(5,1)> 0));
    ASSUME((!(( (cw(0,5) < 2) && (2 < crmax(0,5)) )))||(sforbid(5,2)> 0));
    ASSUME((!(( (cw(0,5) < 3) && (3 < crmax(0,5)) )))||(sforbid(5,3)> 0));
    ASSUME((!(( (cw(0,5) < 4) && (4 < crmax(0,5)) )))||(sforbid(5,4)> 0));
    ASSUME((!(( (cw(0,5) < 5) && (5 < crmax(0,5)) )))||(sforbid(5,5)> 0));
    ASSUME((!(( (cw(0,5) < 6) && (6 < crmax(0,5)) )))||(sforbid(5,6)> 0));
    ASSUME((!(( (cw(0,5) < 7) && (7 < crmax(0,5)) )))||(sforbid(5,7)> 0));
    ASSUME((!(( (cw(0,5) < 8) && (8 < crmax(0,5)) )))||(sforbid(5,8)> 0));
    ASSUME((!(( (cw(0,5) < 9) && (9 < crmax(0,5)) )))||(sforbid(5,9)> 0));
  } else {
    if(pw(0,5) != co(5,cr(0,5))) {
      ASSUME(cr(0,5) >= old_cr);
    }
    pw(0,5) = co(5,cr(0,5));
    r15 = mem(5,cr(0,5));
  }
  ASSUME(creturn[0] >= cr(0,5));

  //   call void @llvm.dbg.value(metadata i32 %8, metadata !171, metadata !DIExpression()), !dbg !176

  //   %and = and i32 %7, %8, !dbg !120
  creg_r16 = max(creg_r14,creg_r15);
  r16 = r14 & r15;

  //   call void @llvm.dbg.value(metadata i32 %and, metadata !172, metadata !DIExpression()), !dbg !176

  //   %and15 = and i32 %6, %and, !dbg !121
  creg_r17 = max(creg_r13,creg_r16);
  r17 = r13 & r16;

  //   call void @llvm.dbg.value(metadata i32 %and15, metadata !173, metadata !DIExpression()), !dbg !176

  //   %and16 = and i32 %5, %and15, !dbg !122
  creg_r18 = max(creg_r12,creg_r17);
  r18 = r12 & r17;

  //   call void @llvm.dbg.value(metadata i32 %and16, metadata !174, metadata !DIExpression()), !dbg !176

  //   %and17 = and i32 %conv14, %and16, !dbg !123
  creg_r19 = max(creg__r11__3_,creg_r18);
  r19 = (r11==3) & r18;

  //   call void @llvm.dbg.value(metadata i32 %and17, metadata !175, metadata !DIExpression()), !dbg !176

  //   %cmp18 = icmp eq i32 %and17, 1, !dbg !124
  creg__r19__1_ = max(0,creg_r19);

  //   br i1 %cmp18, label %if.then, label %if.end, !dbg !126
  old_cctrl = cctrl[0];
  cctrl[0] = get_rng(0,NCONTEXT-1);
  ASSUME(cctrl[0] >= old_cctrl);
  ASSUME(cctrl[0] >= creg__r19__1_);
  if((r19==1)) {
    goto T0BLOCK1;
  } else {
    goto T0BLOCK2;
  }

T0BLOCK1:
  //   call void @__assert_fail(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([108 x i8], [108 x i8]* @.str.1, i64 0, i64 0), i32 noundef 76, i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #8, !dbg !127

  //   unreachable, !dbg !127
  r20 = 1;
  goto T0BLOCK_END;

T0BLOCK2:
  //   %9 = bitcast i64* %thr1 to i8*, !dbg !130

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %9) #7, !dbg !130

  //   %10 = bitcast i64* %thr0 to i8*, !dbg !130

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %10) #7, !dbg !130

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
  ASSUME(meminit(4,5) == mem(4,4));
  ASSUME(coinit(4,5) == co(4,4));
  ASSUME(deltainit(4,5) == delta(4,4));
  ASSUME(meminit(4,6) == mem(4,5));
  ASSUME(coinit(4,6) == co(4,5));
  ASSUME(deltainit(4,6) == delta(4,5));
  ASSUME(meminit(4,7) == mem(4,6));
  ASSUME(coinit(4,7) == co(4,6));
  ASSUME(deltainit(4,7) == delta(4,6));
  ASSUME(meminit(4,8) == mem(4,7));
  ASSUME(coinit(4,8) == co(4,7));
  ASSUME(deltainit(4,8) == delta(4,7));
  ASSUME(meminit(4,9) == mem(4,8));
  ASSUME(coinit(4,9) == co(4,8));
  ASSUME(deltainit(4,9) == delta(4,8));
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
  ASSUME(meminit(5,5) == mem(5,4));
  ASSUME(coinit(5,5) == co(5,4));
  ASSUME(deltainit(5,5) == delta(5,4));
  ASSUME(meminit(5,6) == mem(5,5));
  ASSUME(coinit(5,6) == co(5,5));
  ASSUME(deltainit(5,6) == delta(5,5));
  ASSUME(meminit(5,7) == mem(5,6));
  ASSUME(coinit(5,7) == co(5,6));
  ASSUME(deltainit(5,7) == delta(5,6));
  ASSUME(meminit(5,8) == mem(5,7));
  ASSUME(coinit(5,8) == co(5,7));
  ASSUME(deltainit(5,8) == delta(5,7));
  ASSUME(meminit(5,9) == mem(5,8));
  ASSUME(coinit(5,9) == co(5,8));
  ASSUME(deltainit(5,9) == delta(5,8));

  ASSERT(r20== 0);

}
