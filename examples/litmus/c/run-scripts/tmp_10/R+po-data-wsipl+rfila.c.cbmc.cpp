// Global variabls:
// 0:vars:2
// 2:atom_0_X6_3:1
// 3:atom_1_X3_4:1
// 4:atom_1_X2_3:1
// Local global variabls:
// 0:thr0:1
// 1:thr1:1
#define ADDRSIZE 5
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
  mem(2+0,0) = 0;
  mem(3+0,0) = 0;
  mem(4+0,0) = 0;
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
  // Dumping thread 1
  int ret_thread_1 = 0;
  cdy[1] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[1] >= cstart[1]);
T1BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !38, metadata !DIExpression()), !dbg !61

  //   br label %label_1, !dbg !62
  goto T1BLOCK1;

T1BLOCK1:
  //   call void @llvm.dbg.label(metadata !60), !dbg !63

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0), metadata !39, metadata !DIExpression()), !dbg !64

  //   call void @llvm.dbg.value(metadata i64 4, metadata !42, metadata !DIExpression()), !dbg !64

  //   store atomic i64 4, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !65
  // ST: Guess
  iw(1,0) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW _l21_c3
  old_cw = cw(1,0);
  cw(1,0) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM _l21_c3
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
  buff(1,0) = 4;
  mem(0,cw(1,0)) = 4;
  co(0,cw(1,0))+=1;
  delta(0,cw(1,0)) = -1;
  ASSUME(creturn[1] >= cw(1,0));

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 1), metadata !44, metadata !DIExpression()), !dbg !66

  //   %0 = load atomic i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !67
  // LD: Guess
  old_cr = cr(1,0+1*1);
  cr(1,0+1*1) = get_rng(0,NCONTEXT-1);// 1 ASSIGN LDCOM _l22_c15
  // Check
  ASSUME(active[cr(1,0+1*1)] == 1);
  ASSUME(cr(1,0+1*1) >= iw(1,0+1*1));
  ASSUME(cr(1,0+1*1) >= 0);
  ASSUME(cr(1,0+1*1) >= cdy[1]);
  ASSUME(cr(1,0+1*1) >= cisb[1]);
  ASSUME(cr(1,0+1*1) >= cdl[1]);
  ASSUME(cr(1,0+1*1) >= cl[1]);
  // Update
  creg_r0 = cr(1,0+1*1);
  crmax(1,0+1*1) = max(crmax(1,0+1*1),cr(1,0+1*1));
  caddr[1] = max(caddr[1],0);
  if(cr(1,0+1*1) < cw(1,0+1*1)) {
    r0 = buff(1,0+1*1);
    ASSUME((!(( (cw(1,0+1*1) < 1) && (1 < crmax(1,0+1*1)) )))||(sforbid(0+1*1,1)> 0));
    ASSUME((!(( (cw(1,0+1*1) < 2) && (2 < crmax(1,0+1*1)) )))||(sforbid(0+1*1,2)> 0));
    ASSUME((!(( (cw(1,0+1*1) < 3) && (3 < crmax(1,0+1*1)) )))||(sforbid(0+1*1,3)> 0));
    ASSUME((!(( (cw(1,0+1*1) < 4) && (4 < crmax(1,0+1*1)) )))||(sforbid(0+1*1,4)> 0));
    ASSUME((!(( (cw(1,0+1*1) < 5) && (5 < crmax(1,0+1*1)) )))||(sforbid(0+1*1,5)> 0));
    ASSUME((!(( (cw(1,0+1*1) < 6) && (6 < crmax(1,0+1*1)) )))||(sforbid(0+1*1,6)> 0));
    ASSUME((!(( (cw(1,0+1*1) < 7) && (7 < crmax(1,0+1*1)) )))||(sforbid(0+1*1,7)> 0));
    ASSUME((!(( (cw(1,0+1*1) < 8) && (8 < crmax(1,0+1*1)) )))||(sforbid(0+1*1,8)> 0));
    ASSUME((!(( (cw(1,0+1*1) < 9) && (9 < crmax(1,0+1*1)) )))||(sforbid(0+1*1,9)> 0));
  } else {
    if(pw(1,0+1*1) != co(0+1*1,cr(1,0+1*1))) {
      ASSUME(cr(1,0+1*1) >= old_cr);
    }
    pw(1,0+1*1) = co(0+1*1,cr(1,0+1*1));
    r0 = mem(0+1*1,cr(1,0+1*1));
  }
  ASSUME(creturn[1] >= cr(1,0+1*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !46, metadata !DIExpression()), !dbg !66

  //   %conv = trunc i64 %0 to i32, !dbg !68

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !43, metadata !DIExpression()), !dbg !61

  //   %xor = xor i32 %conv, %conv, !dbg !69
  creg_r1 = creg_r0;
  r1 = r0 ^ r0;

  //   call void @llvm.dbg.value(metadata i32 %xor, metadata !47, metadata !DIExpression()), !dbg !61

  //   %add = add nsw i32 %xor, 1, !dbg !70
  creg_r2 = max(0,creg_r1);
  r2 = r1 + 1;

  //   call void @llvm.dbg.value(metadata i32 %add, metadata !48, metadata !DIExpression()), !dbg !61

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0), metadata !49, metadata !DIExpression()), !dbg !71

  //   %conv3 = sext i32 %add to i64, !dbg !72

  //   call void @llvm.dbg.value(metadata i64 %conv3, metadata !51, metadata !DIExpression()), !dbg !71

  //   store atomic i64 %conv3, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !72
  // ST: Guess
  iw(1,0) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW _l25_c3
  old_cw = cw(1,0);
  cw(1,0) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM _l25_c3
  // Check
  ASSUME(active[iw(1,0)] == 1);
  ASSUME(active[cw(1,0)] == 1);
  ASSUME(sforbid(0,cw(1,0))== 0);
  ASSUME(iw(1,0) >= creg_r2);
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
  buff(1,0) = r2;
  mem(0,cw(1,0)) = r2;
  co(0,cw(1,0))+=1;
  delta(0,cw(1,0)) = -1;
  ASSUME(creturn[1] >= cw(1,0));

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0), metadata !52, metadata !DIExpression()), !dbg !73

  //   call void @llvm.dbg.value(metadata i64 2, metadata !54, metadata !DIExpression()), !dbg !73

  //   store atomic i64 2, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0) release, align 8, !dbg !74
  // ST: Guess
  //   : Release
  iw(1,0) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW _l26_c3
  old_cw = cw(1,0);
  cw(1,0) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM _l26_c3
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
  ASSUME(cw(1,0) >= cr(1,2+0));
  ASSUME(cw(1,0) >= cr(1,3+0));
  ASSUME(cw(1,0) >= cr(1,4+0));
  ASSUME(cw(1,0) >= cw(1,0+0));
  ASSUME(cw(1,0) >= cw(1,0+1));
  ASSUME(cw(1,0) >= cw(1,2+0));
  ASSUME(cw(1,0) >= cw(1,3+0));
  ASSUME(cw(1,0) >= cw(1,4+0));
  // Update
  caddr[1] = max(caddr[1],0);
  buff(1,0) = 2;
  mem(0,cw(1,0)) = 2;
  co(0,cw(1,0))+=1;
  delta(0,cw(1,0)) = -1;
  is(1,0) = iw(1,0);
  cs(1,0) = cw(1,0);
  ASSUME(creturn[1] >= cw(1,0));

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0), metadata !56, metadata !DIExpression()), !dbg !75

  //   %1 = load atomic i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !76
  // LD: Guess
  old_cr = cr(1,0);
  cr(1,0) = get_rng(0,NCONTEXT-1);// 1 ASSIGN LDCOM _l27_c15
  // Check
  ASSUME(active[cr(1,0)] == 1);
  ASSUME(cr(1,0) >= iw(1,0));
  ASSUME(cr(1,0) >= 0);
  ASSUME(cr(1,0) >= cdy[1]);
  ASSUME(cr(1,0) >= cisb[1]);
  ASSUME(cr(1,0) >= cdl[1]);
  ASSUME(cr(1,0) >= cl[1]);
  // Update
  creg_r3 = cr(1,0);
  crmax(1,0) = max(crmax(1,0),cr(1,0));
  caddr[1] = max(caddr[1],0);
  if(cr(1,0) < cw(1,0)) {
    r3 = buff(1,0);
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
    r3 = mem(0,cr(1,0));
  }
  ASSUME(creturn[1] >= cr(1,0));

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !58, metadata !DIExpression()), !dbg !75

  //   %conv9 = trunc i64 %1 to i32, !dbg !77

  //   call void @llvm.dbg.value(metadata i32 %conv9, metadata !55, metadata !DIExpression()), !dbg !61

  //   %cmp = icmp eq i32 %conv9, 3, !dbg !78
  creg__r3__3_ = max(0,creg_r3);

  //   %conv10 = zext i1 %cmp to i32, !dbg !78

  //   call void @llvm.dbg.value(metadata i32 %conv10, metadata !59, metadata !DIExpression()), !dbg !61

  //   store i32 %conv10, i32* @atom_0_X6_3, align 4, !dbg !79, !tbaa !80
  // ST: Guess
  iw(1,2) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW _l29_c15
  old_cw = cw(1,2);
  cw(1,2) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM _l29_c15
  // Check
  ASSUME(active[iw(1,2)] == 1);
  ASSUME(active[cw(1,2)] == 1);
  ASSUME(sforbid(2,cw(1,2))== 0);
  ASSUME(iw(1,2) >= creg__r3__3_);
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
  buff(1,2) = (r3==3);
  mem(2,cw(1,2)) = (r3==3);
  co(2,cw(1,2))+=1;
  delta(2,cw(1,2)) = -1;
  ASSUME(creturn[1] >= cw(1,2));

  //   ret i8* null, !dbg !84
  ret_thread_1 = (- 1);
  goto T1BLOCK_END;

T1BLOCK_END:

  // Dumping thread 2
  int ret_thread_2 = 0;
  cdy[2] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[2] >= cstart[2]);
T2BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !87, metadata !DIExpression()), !dbg !102

  //   br label %label_2, !dbg !55
  goto T2BLOCK1;

T2BLOCK1:
  //   call void @llvm.dbg.label(metadata !101), !dbg !104

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0), metadata !88, metadata !DIExpression()), !dbg !105

  //   call void @llvm.dbg.value(metadata i64 3, metadata !90, metadata !DIExpression()), !dbg !105

  //   store atomic i64 3, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0) release, align 8, !dbg !58
  // ST: Guess
  //   : Release
  iw(2,0) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW _l35_c3
  old_cw = cw(2,0);
  cw(2,0) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM _l35_c3
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
  ASSUME(cw(2,0) >= cr(2,0+0));
  ASSUME(cw(2,0) >= cr(2,0+1));
  ASSUME(cw(2,0) >= cr(2,2+0));
  ASSUME(cw(2,0) >= cr(2,3+0));
  ASSUME(cw(2,0) >= cr(2,4+0));
  ASSUME(cw(2,0) >= cw(2,0+0));
  ASSUME(cw(2,0) >= cw(2,0+1));
  ASSUME(cw(2,0) >= cw(2,2+0));
  ASSUME(cw(2,0) >= cw(2,3+0));
  ASSUME(cw(2,0) >= cw(2,4+0));
  // Update
  caddr[2] = max(caddr[2],0);
  buff(2,0) = 3;
  mem(0,cw(2,0)) = 3;
  co(0,cw(2,0))+=1;
  delta(0,cw(2,0)) = -1;
  is(2,0) = iw(2,0);
  cs(2,0) = cw(2,0);
  ASSUME(creturn[2] >= cw(2,0));

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0), metadata !92, metadata !DIExpression()), !dbg !107

  //   %0 = load atomic i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0) acquire, align 8, !dbg !60
  // LD: Guess
  //   : Acquire
  old_cr = cr(2,0);
  cr(2,0) = get_rng(0,NCONTEXT-1);// 2 ASSIGN LDCOM _l36_c16
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
  ASSUME(cr(2,0) >= cs(2,2+0));
  ASSUME(cr(2,0) >= cs(2,3+0));
  ASSUME(cr(2,0) >= cs(2,4+0));
  // Update
  creg_r4 = cr(2,0);
  crmax(2,0) = max(crmax(2,0),cr(2,0));
  caddr[2] = max(caddr[2],0);
  if(cr(2,0) < cw(2,0)) {
    r4 = buff(2,0);
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
    r4 = mem(0,cr(2,0));
  }
  cl[2] = max(cl[2],cr(2,0));
  ASSUME(creturn[2] >= cr(2,0));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !94, metadata !DIExpression()), !dbg !107

  //   %conv = trunc i64 %0 to i32, !dbg !61

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !91, metadata !DIExpression()), !dbg !102

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0), metadata !96, metadata !DIExpression()), !dbg !110

  //   %1 = load atomic i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !63
  // LD: Guess
  old_cr = cr(2,0);
  cr(2,0) = get_rng(0,NCONTEXT-1);// 2 ASSIGN LDCOM _l37_c16
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
    r5 = mem(0,cr(2,0));
  }
  ASSUME(creturn[2] >= cr(2,0));

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !98, metadata !DIExpression()), !dbg !110

  //   %conv4 = trunc i64 %1 to i32, !dbg !64

  //   call void @llvm.dbg.value(metadata i32 %conv4, metadata !95, metadata !DIExpression()), !dbg !102

  //   %cmp = icmp eq i32 %conv4, 4, !dbg !65
  creg__r5__4_ = max(0,creg_r5);

  //   %conv5 = zext i1 %cmp to i32, !dbg !65

  //   call void @llvm.dbg.value(metadata i32 %conv5, metadata !99, metadata !DIExpression()), !dbg !102

  //   store i32 %conv5, i32* @atom_1_X3_4, align 4, !dbg !66, !tbaa !67
  // ST: Guess
  iw(2,3) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW _l39_c15
  old_cw = cw(2,3);
  cw(2,3) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM _l39_c15
  // Check
  ASSUME(active[iw(2,3)] == 2);
  ASSUME(active[cw(2,3)] == 2);
  ASSUME(sforbid(3,cw(2,3))== 0);
  ASSUME(iw(2,3) >= creg__r5__4_);
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
  buff(2,3) = (r5==4);
  mem(3,cw(2,3)) = (r5==4);
  co(3,cw(2,3))+=1;
  delta(3,cw(2,3)) = -1;
  ASSUME(creturn[2] >= cw(2,3));

  //   %cmp6 = icmp eq i32 %conv, 3, !dbg !71
  creg__r4__3_ = max(0,creg_r4);

  //   %conv7 = zext i1 %cmp6 to i32, !dbg !71

  //   call void @llvm.dbg.value(metadata i32 %conv7, metadata !100, metadata !DIExpression()), !dbg !102

  //   store i32 %conv7, i32* @atom_1_X2_3, align 4, !dbg !72, !tbaa !67
  // ST: Guess
  iw(2,4) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW _l41_c15
  old_cw = cw(2,4);
  cw(2,4) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM _l41_c15
  // Check
  ASSUME(active[iw(2,4)] == 2);
  ASSUME(active[cw(2,4)] == 2);
  ASSUME(sforbid(4,cw(2,4))== 0);
  ASSUME(iw(2,4) >= creg__r4__3_);
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
  buff(2,4) = (r4==3);
  mem(4,cw(2,4)) = (r4==3);
  co(4,cw(2,4))+=1;
  delta(4,cw(2,4)) = -1;
  ASSUME(creturn[2] >= cw(2,4));

  //   ret i8* null, !dbg !73
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

  //   call void @llvm.dbg.value(metadata i32 %argc, metadata !125, metadata !DIExpression()), !dbg !159

  //   call void @llvm.dbg.value(metadata i8** %argv, metadata !126, metadata !DIExpression()), !dbg !159

  //   %0 = bitcast i64* %thr0 to i8*, !dbg !77

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #7, !dbg !77

  //   call void @llvm.dbg.declare(metadata i64* %thr0, metadata !127, metadata !DIExpression()), !dbg !161

  //   %1 = bitcast i64* %thr1 to i8*, !dbg !79

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #7, !dbg !79

  //   call void @llvm.dbg.declare(metadata i64* %thr1, metadata !131, metadata !DIExpression()), !dbg !163

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 1), metadata !132, metadata !DIExpression()), !dbg !164

  //   call void @llvm.dbg.value(metadata i64 0, metadata !134, metadata !DIExpression()), !dbg !164

  //   store atomic i64 0, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !82
  // ST: Guess
  iw(0,0+1*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l49_c3
  old_cw = cw(0,0+1*1);
  cw(0,0+1*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l49_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0), metadata !135, metadata !DIExpression()), !dbg !166

  //   call void @llvm.dbg.value(metadata i64 0, metadata !137, metadata !DIExpression()), !dbg !166

  //   store atomic i64 0, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !84
  // ST: Guess
  iw(0,0) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l50_c3
  old_cw = cw(0,0);
  cw(0,0) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l50_c3
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

  //   call void @llvm.dbg.value(metadata i32* @atom_0_X6_3, metadata !138, metadata !DIExpression()), !dbg !168

  //   call void @llvm.dbg.value(metadata i32 0, metadata !141, metadata !DIExpression()), !dbg !168

  //   store atomic i32 0, i32* @atom_0_X6_3 monotonic, align 4, !dbg !86
  // ST: Guess
  iw(0,2) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l51_c3
  old_cw = cw(0,2);
  cw(0,2) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l51_c3
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

  //   call void @llvm.dbg.value(metadata i32* @atom_1_X3_4, metadata !142, metadata !DIExpression()), !dbg !170

  //   call void @llvm.dbg.value(metadata i32 0, metadata !144, metadata !DIExpression()), !dbg !170

  //   store atomic i32 0, i32* @atom_1_X3_4 monotonic, align 4, !dbg !88
  // ST: Guess
  iw(0,3) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l52_c3
  old_cw = cw(0,3);
  cw(0,3) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l52_c3
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

  //   call void @llvm.dbg.value(metadata i32* @atom_1_X2_3, metadata !145, metadata !DIExpression()), !dbg !172

  //   call void @llvm.dbg.value(metadata i32 0, metadata !147, metadata !DIExpression()), !dbg !172

  //   store atomic i32 0, i32* @atom_1_X2_3 monotonic, align 4, !dbg !90
  // ST: Guess
  iw(0,4) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l53_c3
  old_cw = cw(0,4);
  cw(0,4) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l53_c3
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

  //   %call = call i32 @pthread_create(i64* noundef %thr0, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t0, i8* noundef null) #7, !dbg !91
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
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,2+0));
  ASSUME(cdy[0] >= cr(0,3+0));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[1] >= cdy[0]);

  //   %call9 = call i32 @pthread_create(i64* noundef %thr1, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t1, i8* noundef null) #7, !dbg !92
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
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,2+0));
  ASSUME(cdy[0] >= cr(0,3+0));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[2] >= cdy[0]);

  //   %2 = load i64, i64* %thr0, align 8, !dbg !93, !tbaa !94
  r7 = local_mem[0];

  //   %call10 = call i32 @pthread_join(i64 noundef %2, i8** noundef null), !dbg !98
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
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,2+0));
  ASSUME(cdy[0] >= cr(0,3+0));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[1]);

  //   %3 = load i64, i64* %thr1, align 8, !dbg !99, !tbaa !94
  r8 = local_mem[1];

  //   %call11 = call i32 @pthread_join(i64 noundef %3, i8** noundef null), !dbg !100
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
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,2+0));
  ASSUME(cdy[0] >= cr(0,3+0));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[2]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0), metadata !149, metadata !DIExpression()), !dbg !182

  //   %4 = load atomic i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !102
  // LD: Guess
  old_cr = cr(0,0);
  cr(0,0) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l61_c13
  // Check
  ASSUME(active[cr(0,0)] == 0);
  ASSUME(cr(0,0) >= iw(0,0));
  ASSUME(cr(0,0) >= 0);
  ASSUME(cr(0,0) >= cdy[0]);
  ASSUME(cr(0,0) >= cisb[0]);
  ASSUME(cr(0,0) >= cdl[0]);
  ASSUME(cr(0,0) >= cl[0]);
  // Update
  creg_r9 = cr(0,0);
  crmax(0,0) = max(crmax(0,0),cr(0,0));
  caddr[0] = max(caddr[0],0);
  if(cr(0,0) < cw(0,0)) {
    r9 = buff(0,0);
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
    r9 = mem(0,cr(0,0));
  }
  ASSUME(creturn[0] >= cr(0,0));

  //   call void @llvm.dbg.value(metadata i64 %4, metadata !151, metadata !DIExpression()), !dbg !182

  //   %conv = trunc i64 %4 to i32, !dbg !103

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !148, metadata !DIExpression()), !dbg !159

  //   %cmp = icmp eq i32 %conv, 4, !dbg !104
  creg__r9__4_ = max(0,creg_r9);

  //   %conv12 = zext i1 %cmp to i32, !dbg !104

  //   call void @llvm.dbg.value(metadata i32 %conv12, metadata !152, metadata !DIExpression()), !dbg !159

  //   %5 = load i32, i32* @atom_0_X6_3, align 4, !dbg !105, !tbaa !106
  // LD: Guess
  old_cr = cr(0,2);
  cr(0,2) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l63_c13
  // Check
  ASSUME(active[cr(0,2)] == 0);
  ASSUME(cr(0,2) >= iw(0,2));
  ASSUME(cr(0,2) >= 0);
  ASSUME(cr(0,2) >= cdy[0]);
  ASSUME(cr(0,2) >= cisb[0]);
  ASSUME(cr(0,2) >= cdl[0]);
  ASSUME(cr(0,2) >= cl[0]);
  // Update
  creg_r10 = cr(0,2);
  crmax(0,2) = max(crmax(0,2),cr(0,2));
  caddr[0] = max(caddr[0],0);
  if(cr(0,2) < cw(0,2)) {
    r10 = buff(0,2);
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
    r10 = mem(2,cr(0,2));
  }
  ASSUME(creturn[0] >= cr(0,2));

  //   call void @llvm.dbg.value(metadata i32 %5, metadata !153, metadata !DIExpression()), !dbg !159

  //   %6 = load i32, i32* @atom_1_X3_4, align 4, !dbg !108, !tbaa !106
  // LD: Guess
  old_cr = cr(0,3);
  cr(0,3) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l64_c13
  // Check
  ASSUME(active[cr(0,3)] == 0);
  ASSUME(cr(0,3) >= iw(0,3));
  ASSUME(cr(0,3) >= 0);
  ASSUME(cr(0,3) >= cdy[0]);
  ASSUME(cr(0,3) >= cisb[0]);
  ASSUME(cr(0,3) >= cdl[0]);
  ASSUME(cr(0,3) >= cl[0]);
  // Update
  creg_r11 = cr(0,3);
  crmax(0,3) = max(crmax(0,3),cr(0,3));
  caddr[0] = max(caddr[0],0);
  if(cr(0,3) < cw(0,3)) {
    r11 = buff(0,3);
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
    r11 = mem(3,cr(0,3));
  }
  ASSUME(creturn[0] >= cr(0,3));

  //   call void @llvm.dbg.value(metadata i32 %6, metadata !154, metadata !DIExpression()), !dbg !159

  //   %7 = load i32, i32* @atom_1_X2_3, align 4, !dbg !109, !tbaa !106
  // LD: Guess
  old_cr = cr(0,4);
  cr(0,4) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l65_c13
  // Check
  ASSUME(active[cr(0,4)] == 0);
  ASSUME(cr(0,4) >= iw(0,4));
  ASSUME(cr(0,4) >= 0);
  ASSUME(cr(0,4) >= cdy[0]);
  ASSUME(cr(0,4) >= cisb[0]);
  ASSUME(cr(0,4) >= cdl[0]);
  ASSUME(cr(0,4) >= cl[0]);
  // Update
  creg_r12 = cr(0,4);
  crmax(0,4) = max(crmax(0,4),cr(0,4));
  caddr[0] = max(caddr[0],0);
  if(cr(0,4) < cw(0,4)) {
    r12 = buff(0,4);
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
    r12 = mem(4,cr(0,4));
  }
  ASSUME(creturn[0] >= cr(0,4));

  //   call void @llvm.dbg.value(metadata i32 %7, metadata !155, metadata !DIExpression()), !dbg !159

  //   %and = and i32 %6, %7, !dbg !110
  creg_r13 = max(creg_r11,creg_r12);
  r13 = r11 & r12;

  //   call void @llvm.dbg.value(metadata i32 %and, metadata !156, metadata !DIExpression()), !dbg !159

  //   %and13 = and i32 %5, %and, !dbg !111
  creg_r14 = max(creg_r10,creg_r13);
  r14 = r10 & r13;

  //   call void @llvm.dbg.value(metadata i32 %and13, metadata !157, metadata !DIExpression()), !dbg !159

  //   %and14 = and i32 %conv12, %and13, !dbg !112
  creg_r15 = max(creg__r9__4_,creg_r14);
  r15 = (r9==4) & r14;

  //   call void @llvm.dbg.value(metadata i32 %and14, metadata !158, metadata !DIExpression()), !dbg !159

  //   %cmp15 = icmp eq i32 %and14, 1, !dbg !113
  creg__r15__1_ = max(0,creg_r15);

  //   br i1 %cmp15, label %if.then, label %if.end, !dbg !115
  old_cctrl = cctrl[0];
  cctrl[0] = get_rng(0,NCONTEXT-1);
  ASSUME(cctrl[0] >= old_cctrl);
  ASSUME(cctrl[0] >= creg__r15__1_);
  if((r15==1)) {
    goto T0BLOCK1;
  } else {
    goto T0BLOCK2;
  }

T0BLOCK1:
  //   call void @__assert_fail(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([106 x i8], [106 x i8]* @.str.1, i64 0, i64 0), i32 noundef 69, i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #8, !dbg !116

  //   unreachable, !dbg !116
  r16 = 1;
  goto T0BLOCK_END;

T0BLOCK2:
  //   %8 = bitcast i64* %thr1 to i8*, !dbg !119

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %8) #7, !dbg !119

  //   %9 = bitcast i64* %thr0 to i8*, !dbg !119

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %9) #7, !dbg !119

  //   ret i32 0, !dbg !120
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

  ASSERT(r16== 0);

}
