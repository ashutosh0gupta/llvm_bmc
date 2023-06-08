// 0:vars:1
// 5:atom_0_X2_1:1
// 3:atom_0_X3_2:1
// 4:atom_0_X2_2:1
// 9:thr0:1
// 10:thr1:1
// 6:atom_0_X3_1:1
// 7:atom_1_X3_1:1
// 1:atom_1_X3_2:1
// 2:atom_1_X2_2:1
// 8:atom_1_X2_1:1
#define ADDRSIZE 11
#define NPROC 3
#define NCONTEXT 1

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
  buff(0,10) = 0;
  pw(0,10) = 0;
  cr(0,10) = 0;
  iw(0,10) = 0;
  cw(0,10) = 0;
  cx(0,10) = 0;
  is(0,10) = 0;
  cs(0,10) = 0;
  crmax(0,10) = 0;
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
  buff(1,10) = 0;
  pw(1,10) = 0;
  cr(1,10) = 0;
  iw(1,10) = 0;
  cw(1,10) = 0;
  cx(1,10) = 0;
  is(1,10) = 0;
  cs(1,10) = 0;
  crmax(1,10) = 0;
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
  buff(2,10) = 0;
  pw(2,10) = 0;
  cr(2,10) = 0;
  iw(2,10) = 0;
  cw(2,10) = 0;
  cx(2,10) = 0;
  is(2,10) = 0;
  cs(2,10) = 0;
  crmax(2,10) = 0;
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
  mem(5+0,0) = 0;
  mem(3+0,0) = 0;
  mem(4+0,0) = 0;
  mem(9+0,0) = 0;
  mem(10+0,0) = 0;
  mem(6+0,0) = 0;
  mem(7+0,0) = 0;
  mem(1+0,0) = 0;
  mem(2+0,0) = 0;
  mem(8+0,0) = 0;
  // Dumping context matching equalities
  co(0,0) = 0;
  delta(0,0) = -1;
  co(1,0) = 0;
  delta(1,0) = -1;
  co(2,0) = 0;
  delta(2,0) = -1;
  co(3,0) = 0;
  delta(3,0) = -1;
  co(4,0) = 0;
  delta(4,0) = -1;
  co(5,0) = 0;
  delta(5,0) = -1;
  co(6,0) = 0;
  delta(6,0) = -1;
  co(7,0) = 0;
  delta(7,0) = -1;
  co(8,0) = 0;
  delta(8,0) = -1;
  co(9,0) = 0;
  delta(9,0) = -1;
  co(10,0) = 0;
  delta(10,0) = -1;
  // Dumping thread 1
  int ret_thread_1 = 0;
  cdy[1] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[1] >= cstart[1]);
T1BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !47, metadata !DIExpression()), !dbg !78

  //   br label %label_1, !dbg !79
  goto T1BLOCK1;

T1BLOCK1:
  //   call void @llvm.dbg.label(metadata !77), !dbg !80

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([1 x i64], [1 x i64]* @vars, i64 0, i64 0), metadata !48, metadata !DIExpression()), !dbg !81

  //   call void @llvm.dbg.value(metadata i64 1, metadata !51, metadata !DIExpression()), !dbg !81

  //   store atomic i64 1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !82
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([1 x i64], [1 x i64]* @vars, i64 0, i64 0), metadata !54, metadata !DIExpression()), !dbg !83

  //   %0 = load atomic i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !84
  // LD: Guess
  old_cr = cr(1,0);
  cr(1,0) = get_rng(0,NCONTEXT-1);// 1 ASSIGN LDCOM 
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
  } else {
    if(pw(1,0) != co(0,cr(1,0))) {
      ASSUME(cr(1,0) >= old_cr);
    }
    pw(1,0) = co(0,cr(1,0));
    r0 = mem(0,cr(1,0));
  }
  ASSUME(creturn[1] >= cr(1,0));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !56, metadata !DIExpression()), !dbg !83

  //   %conv = trunc i64 %0 to i32, !dbg !85

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !52, metadata !DIExpression()), !dbg !78

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([1 x i64], [1 x i64]* @vars, i64 0, i64 0), metadata !58, metadata !DIExpression()), !dbg !86

  //   %1 = load atomic i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !87
  // LD: Guess
  old_cr = cr(1,0);
  cr(1,0) = get_rng(0,NCONTEXT-1);// 1 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(1,0)] == 1);
  ASSUME(cr(1,0) >= iw(1,0));
  ASSUME(cr(1,0) >= 0);
  ASSUME(cr(1,0) >= cdy[1]);
  ASSUME(cr(1,0) >= cisb[1]);
  ASSUME(cr(1,0) >= cdl[1]);
  ASSUME(cr(1,0) >= cl[1]);
  // Update
  creg_r1 = cr(1,0);
  crmax(1,0) = max(crmax(1,0),cr(1,0));
  caddr[1] = max(caddr[1],0);
  if(cr(1,0) < cw(1,0)) {
    r1 = buff(1,0);
  } else {
    if(pw(1,0) != co(0,cr(1,0))) {
      ASSUME(cr(1,0) >= old_cr);
    }
    pw(1,0) = co(0,cr(1,0));
    r1 = mem(0,cr(1,0));
  }
  ASSUME(creturn[1] >= cr(1,0));

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !60, metadata !DIExpression()), !dbg !86

  //   %conv4 = trunc i64 %1 to i32, !dbg !88

  //   call void @llvm.dbg.value(metadata i32 %conv4, metadata !57, metadata !DIExpression()), !dbg !78

  //   %cmp = icmp eq i32 %conv4, 2, !dbg !89

  //   %conv5 = zext i1 %cmp to i32, !dbg !89

  //   call void @llvm.dbg.value(metadata i32 %conv5, metadata !61, metadata !DIExpression()), !dbg !78

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X3_2, metadata !62, metadata !DIExpression()), !dbg !90

  //   %2 = zext i32 %conv5 to i64

  //   call void @llvm.dbg.value(metadata i64 %2, metadata !64, metadata !DIExpression()), !dbg !90

  //   store atomic i64 %2, i64* @atom_0_X3_2 seq_cst, align 8, !dbg !91
  // ST: Guess
  iw(1,3) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW 
  old_cw = cw(1,3);
  cw(1,3) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(1,3)] == 1);
  ASSUME(active[cw(1,3)] == 1);
  ASSUME(sforbid(3,cw(1,3))== 0);
  ASSUME(iw(1,3) >= max(creg_r1,0));
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
  buff(1,3) = (r1==2);
  mem(3,cw(1,3)) = (r1==2);
  co(3,cw(1,3))+=1;
  delta(3,cw(1,3)) = -1;
  ASSUME(creturn[1] >= cw(1,3));

  //   %cmp9 = icmp eq i32 %conv, 2, !dbg !92

  //   %conv10 = zext i1 %cmp9 to i32, !dbg !92

  //   call void @llvm.dbg.value(metadata i32 %conv10, metadata !65, metadata !DIExpression()), !dbg !78

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X2_2, metadata !66, metadata !DIExpression()), !dbg !93

  //   %3 = zext i32 %conv10 to i64

  //   call void @llvm.dbg.value(metadata i64 %3, metadata !68, metadata !DIExpression()), !dbg !93

  //   store atomic i64 %3, i64* @atom_0_X2_2 seq_cst, align 8, !dbg !94
  // ST: Guess
  iw(1,4) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW 
  old_cw = cw(1,4);
  cw(1,4) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(1,4)] == 1);
  ASSUME(active[cw(1,4)] == 1);
  ASSUME(sforbid(4,cw(1,4))== 0);
  ASSUME(iw(1,4) >= max(creg_r0,0));
  ASSUME(iw(1,4) >= 0);
  ASSUME(cw(1,4) >= iw(1,4));
  ASSUME(cw(1,4) >= old_cw);
  ASSUME(cw(1,4) >= cr(1,4));
  ASSUME(cw(1,4) >= cl[1]);
  ASSUME(cw(1,4) >= cisb[1]);
  ASSUME(cw(1,4) >= cdy[1]);
  ASSUME(cw(1,4) >= cdl[1]);
  ASSUME(cw(1,4) >= cds[1]);
  ASSUME(cw(1,4) >= cctrl[1]);
  ASSUME(cw(1,4) >= caddr[1]);
  // Update
  caddr[1] = max(caddr[1],0);
  buff(1,4) = (r0==2);
  mem(4,cw(1,4)) = (r0==2);
  co(4,cw(1,4))+=1;
  delta(4,cw(1,4)) = -1;
  ASSUME(creturn[1] >= cw(1,4));

  //   %cmp14 = icmp eq i32 %conv, 1, !dbg !95

  //   %conv15 = zext i1 %cmp14 to i32, !dbg !95

  //   call void @llvm.dbg.value(metadata i32 %conv15, metadata !69, metadata !DIExpression()), !dbg !78

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X2_1, metadata !70, metadata !DIExpression()), !dbg !96

  //   %4 = zext i32 %conv15 to i64

  //   call void @llvm.dbg.value(metadata i64 %4, metadata !72, metadata !DIExpression()), !dbg !96

  //   store atomic i64 %4, i64* @atom_0_X2_1 seq_cst, align 8, !dbg !97
  // ST: Guess
  iw(1,5) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW 
  old_cw = cw(1,5);
  cw(1,5) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(1,5)] == 1);
  ASSUME(active[cw(1,5)] == 1);
  ASSUME(sforbid(5,cw(1,5))== 0);
  ASSUME(iw(1,5) >= max(creg_r0,0));
  ASSUME(iw(1,5) >= 0);
  ASSUME(cw(1,5) >= iw(1,5));
  ASSUME(cw(1,5) >= old_cw);
  ASSUME(cw(1,5) >= cr(1,5));
  ASSUME(cw(1,5) >= cl[1]);
  ASSUME(cw(1,5) >= cisb[1]);
  ASSUME(cw(1,5) >= cdy[1]);
  ASSUME(cw(1,5) >= cdl[1]);
  ASSUME(cw(1,5) >= cds[1]);
  ASSUME(cw(1,5) >= cctrl[1]);
  ASSUME(cw(1,5) >= caddr[1]);
  // Update
  caddr[1] = max(caddr[1],0);
  buff(1,5) = (r0==1);
  mem(5,cw(1,5)) = (r0==1);
  co(5,cw(1,5))+=1;
  delta(5,cw(1,5)) = -1;
  ASSUME(creturn[1] >= cw(1,5));

  //   %cmp19 = icmp eq i32 %conv4, 1, !dbg !98

  //   %conv20 = zext i1 %cmp19 to i32, !dbg !98

  //   call void @llvm.dbg.value(metadata i32 %conv20, metadata !73, metadata !DIExpression()), !dbg !78

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X3_1, metadata !74, metadata !DIExpression()), !dbg !99

  //   %5 = zext i32 %conv20 to i64

  //   call void @llvm.dbg.value(metadata i64 %5, metadata !76, metadata !DIExpression()), !dbg !99

  //   store atomic i64 %5, i64* @atom_0_X3_1 seq_cst, align 8, !dbg !100
  // ST: Guess
  iw(1,6) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW 
  old_cw = cw(1,6);
  cw(1,6) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(1,6)] == 1);
  ASSUME(active[cw(1,6)] == 1);
  ASSUME(sforbid(6,cw(1,6))== 0);
  ASSUME(iw(1,6) >= max(creg_r1,0));
  ASSUME(iw(1,6) >= 0);
  ASSUME(cw(1,6) >= iw(1,6));
  ASSUME(cw(1,6) >= old_cw);
  ASSUME(cw(1,6) >= cr(1,6));
  ASSUME(cw(1,6) >= cl[1]);
  ASSUME(cw(1,6) >= cisb[1]);
  ASSUME(cw(1,6) >= cdy[1]);
  ASSUME(cw(1,6) >= cdl[1]);
  ASSUME(cw(1,6) >= cds[1]);
  ASSUME(cw(1,6) >= cctrl[1]);
  ASSUME(cw(1,6) >= caddr[1]);
  // Update
  caddr[1] = max(caddr[1],0);
  buff(1,6) = (r1==1);
  mem(6,cw(1,6)) = (r1==1);
  co(6,cw(1,6))+=1;
  delta(6,cw(1,6)) = -1;
  ASSUME(creturn[1] >= cw(1,6));

  //   ret i8* null, !dbg !101
  ret_thread_1 = (- 1);


  // Dumping thread 2
  int ret_thread_2 = 0;
  cdy[2] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[2] >= cstart[2]);
T2BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !104, metadata !DIExpression()), !dbg !133

  //   br label %label_2, !dbg !79
  goto T2BLOCK1;

T2BLOCK1:
  //   call void @llvm.dbg.label(metadata !132), !dbg !135

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([1 x i64], [1 x i64]* @vars, i64 0, i64 0), metadata !105, metadata !DIExpression()), !dbg !136

  //   call void @llvm.dbg.value(metadata i64 2, metadata !107, metadata !DIExpression()), !dbg !136

  //   store atomic i64 2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !82
  // ST: Guess
  iw(2,0) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW 
  old_cw = cw(2,0);
  cw(2,0) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM 
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
  // Update
  caddr[2] = max(caddr[2],0);
  buff(2,0) = 2;
  mem(0,cw(2,0)) = 2;
  co(0,cw(2,0))+=1;
  delta(0,cw(2,0)) = -1;
  ASSUME(creturn[2] >= cw(2,0));

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([1 x i64], [1 x i64]* @vars, i64 0, i64 0), metadata !109, metadata !DIExpression()), !dbg !138

  //   %0 = load atomic i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !84
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
  creg_r2 = cr(2,0);
  crmax(2,0) = max(crmax(2,0),cr(2,0));
  caddr[2] = max(caddr[2],0);
  if(cr(2,0) < cw(2,0)) {
    r2 = buff(2,0);
  } else {
    if(pw(2,0) != co(0,cr(2,0))) {
      ASSUME(cr(2,0) >= old_cr);
    }
    pw(2,0) = co(0,cr(2,0));
    r2 = mem(0,cr(2,0));
  }
  ASSUME(creturn[2] >= cr(2,0));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !111, metadata !DIExpression()), !dbg !138

  //   %conv = trunc i64 %0 to i32, !dbg !85

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !108, metadata !DIExpression()), !dbg !133

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([1 x i64], [1 x i64]* @vars, i64 0, i64 0), metadata !113, metadata !DIExpression()), !dbg !141

  //   %1 = load atomic i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !87
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
  } else {
    if(pw(2,0) != co(0,cr(2,0))) {
      ASSUME(cr(2,0) >= old_cr);
    }
    pw(2,0) = co(0,cr(2,0));
    r3 = mem(0,cr(2,0));
  }
  ASSUME(creturn[2] >= cr(2,0));

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !115, metadata !DIExpression()), !dbg !141

  //   %conv4 = trunc i64 %1 to i32, !dbg !88

  //   call void @llvm.dbg.value(metadata i32 %conv4, metadata !112, metadata !DIExpression()), !dbg !133

  //   %cmp = icmp eq i32 %conv4, 2, !dbg !89

  //   %conv5 = zext i1 %cmp to i32, !dbg !89

  //   call void @llvm.dbg.value(metadata i32 %conv5, metadata !116, metadata !DIExpression()), !dbg !133

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X3_2, metadata !117, metadata !DIExpression()), !dbg !145

  //   %2 = zext i32 %conv5 to i64

  //   call void @llvm.dbg.value(metadata i64 %2, metadata !119, metadata !DIExpression()), !dbg !145

  //   store atomic i64 %2, i64* @atom_1_X3_2 seq_cst, align 8, !dbg !91
  // ST: Guess
  iw(2,1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW 
  old_cw = cw(2,1);
  cw(2,1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(2,1)] == 2);
  ASSUME(active[cw(2,1)] == 2);
  ASSUME(sforbid(1,cw(2,1))== 0);
  ASSUME(iw(2,1) >= max(creg_r3,0));
  ASSUME(iw(2,1) >= 0);
  ASSUME(cw(2,1) >= iw(2,1));
  ASSUME(cw(2,1) >= old_cw);
  ASSUME(cw(2,1) >= cr(2,1));
  ASSUME(cw(2,1) >= cl[2]);
  ASSUME(cw(2,1) >= cisb[2]);
  ASSUME(cw(2,1) >= cdy[2]);
  ASSUME(cw(2,1) >= cdl[2]);
  ASSUME(cw(2,1) >= cds[2]);
  ASSUME(cw(2,1) >= cctrl[2]);
  ASSUME(cw(2,1) >= caddr[2]);
  // Update
  caddr[2] = max(caddr[2],0);
  buff(2,1) = (r3==2);
  mem(1,cw(2,1)) = (r3==2);
  co(1,cw(2,1))+=1;
  delta(1,cw(2,1)) = -1;
  ASSUME(creturn[2] >= cw(2,1));

  //   %cmp9 = icmp eq i32 %conv, 2, !dbg !92

  //   %conv10 = zext i1 %cmp9 to i32, !dbg !92

  //   call void @llvm.dbg.value(metadata i32 %conv10, metadata !120, metadata !DIExpression()), !dbg !133

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X2_2, metadata !121, metadata !DIExpression()), !dbg !148

  //   %3 = zext i32 %conv10 to i64

  //   call void @llvm.dbg.value(metadata i64 %3, metadata !123, metadata !DIExpression()), !dbg !148

  //   store atomic i64 %3, i64* @atom_1_X2_2 seq_cst, align 8, !dbg !94
  // ST: Guess
  iw(2,2) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW 
  old_cw = cw(2,2);
  cw(2,2) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(2,2)] == 2);
  ASSUME(active[cw(2,2)] == 2);
  ASSUME(sforbid(2,cw(2,2))== 0);
  ASSUME(iw(2,2) >= max(creg_r2,0));
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
  buff(2,2) = (r2==2);
  mem(2,cw(2,2)) = (r2==2);
  co(2,cw(2,2))+=1;
  delta(2,cw(2,2)) = -1;
  ASSUME(creturn[2] >= cw(2,2));

  //   %cmp14 = icmp eq i32 %conv4, 1, !dbg !95

  //   %conv15 = zext i1 %cmp14 to i32, !dbg !95

  //   call void @llvm.dbg.value(metadata i32 %conv15, metadata !124, metadata !DIExpression()), !dbg !133

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X3_1, metadata !125, metadata !DIExpression()), !dbg !151

  //   %4 = zext i32 %conv15 to i64

  //   call void @llvm.dbg.value(metadata i64 %4, metadata !127, metadata !DIExpression()), !dbg !151

  //   store atomic i64 %4, i64* @atom_1_X3_1 seq_cst, align 8, !dbg !97
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
  buff(2,7) = (r3==1);
  mem(7,cw(2,7)) = (r3==1);
  co(7,cw(2,7))+=1;
  delta(7,cw(2,7)) = -1;
  ASSUME(creturn[2] >= cw(2,7));

  //   %cmp19 = icmp eq i32 %conv, 1, !dbg !98

  //   %conv20 = zext i1 %cmp19 to i32, !dbg !98

  //   call void @llvm.dbg.value(metadata i32 %conv20, metadata !128, metadata !DIExpression()), !dbg !133

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X2_1, metadata !129, metadata !DIExpression()), !dbg !154

  //   %5 = zext i32 %conv20 to i64

  //   call void @llvm.dbg.value(metadata i64 %5, metadata !131, metadata !DIExpression()), !dbg !154

  //   store atomic i64 %5, i64* @atom_1_X2_1 seq_cst, align 8, !dbg !100
  // ST: Guess
  iw(2,8) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW 
  old_cw = cw(2,8);
  cw(2,8) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(2,8)] == 2);
  ASSUME(active[cw(2,8)] == 2);
  ASSUME(sforbid(8,cw(2,8))== 0);
  ASSUME(iw(2,8) >= max(creg_r2,0));
  ASSUME(iw(2,8) >= 0);
  ASSUME(cw(2,8) >= iw(2,8));
  ASSUME(cw(2,8) >= old_cw);
  ASSUME(cw(2,8) >= cr(2,8));
  ASSUME(cw(2,8) >= cl[2]);
  ASSUME(cw(2,8) >= cisb[2]);
  ASSUME(cw(2,8) >= cdy[2]);
  ASSUME(cw(2,8) >= cdl[2]);
  ASSUME(cw(2,8) >= cds[2]);
  ASSUME(cw(2,8) >= cctrl[2]);
  ASSUME(cw(2,8) >= caddr[2]);
  // Update
  caddr[2] = max(caddr[2],0);
  buff(2,8) = (r2==1);
  mem(8,cw(2,8)) = (r2==1);
  co(8,cw(2,8))+=1;
  delta(8,cw(2,8)) = -1;
  ASSUME(creturn[2] >= cw(2,8));

  //   ret i8* null, !dbg !101
  ret_thread_2 = (- 1);


  // Dumping thread 0
  int ret_thread_0 = 0;
  cdy[0] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[0] >= cstart[0]);
T0BLOCK0:
  //   %thr0 = alloca i64, align 8

  //   %thr1 = alloca i64, align 8

  //   call void @llvm.dbg.value(metadata i32 %argc, metadata !164, metadata !DIExpression()), !dbg !279

  //   call void @llvm.dbg.value(metadata i8** %argv, metadata !165, metadata !DIExpression()), !dbg !279

  //   %0 = bitcast i64* %thr0 to i8*, !dbg !168

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #7, !dbg !168

  //   call void @llvm.dbg.declare(metadata i64* %thr0, metadata !166, metadata !DIExpression()), !dbg !281

  //   %1 = bitcast i64* %thr1 to i8*, !dbg !170

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #7, !dbg !170

  //   call void @llvm.dbg.declare(metadata i64* %thr1, metadata !170, metadata !DIExpression()), !dbg !283

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([1 x i64], [1 x i64]* @vars, i64 0, i64 0), metadata !171, metadata !DIExpression()), !dbg !284

  //   call void @llvm.dbg.value(metadata i64 0, metadata !173, metadata !DIExpression()), !dbg !284

  //   store atomic i64 0, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !173
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

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X3_2, metadata !174, metadata !DIExpression()), !dbg !286

  //   call void @llvm.dbg.value(metadata i64 0, metadata !176, metadata !DIExpression()), !dbg !286

  //   store atomic i64 0, i64* @atom_1_X3_2 monotonic, align 8, !dbg !175
  // ST: Guess
  iw(0,1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW 
  old_cw = cw(0,1);
  cw(0,1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(0,1)] == 0);
  ASSUME(active[cw(0,1)] == 0);
  ASSUME(sforbid(1,cw(0,1))== 0);
  ASSUME(iw(0,1) >= 0);
  ASSUME(iw(0,1) >= 0);
  ASSUME(cw(0,1) >= iw(0,1));
  ASSUME(cw(0,1) >= old_cw);
  ASSUME(cw(0,1) >= cr(0,1));
  ASSUME(cw(0,1) >= cl[0]);
  ASSUME(cw(0,1) >= cisb[0]);
  ASSUME(cw(0,1) >= cdy[0]);
  ASSUME(cw(0,1) >= cdl[0]);
  ASSUME(cw(0,1) >= cds[0]);
  ASSUME(cw(0,1) >= cctrl[0]);
  ASSUME(cw(0,1) >= caddr[0]);
  // Update
  caddr[0] = max(caddr[0],0);
  buff(0,1) = 0;
  mem(1,cw(0,1)) = 0;
  co(1,cw(0,1))+=1;
  delta(1,cw(0,1)) = -1;
  ASSUME(creturn[0] >= cw(0,1));

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X2_2, metadata !177, metadata !DIExpression()), !dbg !288

  //   call void @llvm.dbg.value(metadata i64 0, metadata !179, metadata !DIExpression()), !dbg !288

  //   store atomic i64 0, i64* @atom_1_X2_2 monotonic, align 8, !dbg !177
  // ST: Guess
  iw(0,2) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW 
  old_cw = cw(0,2);
  cw(0,2) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM 
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

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X3_2, metadata !180, metadata !DIExpression()), !dbg !290

  //   call void @llvm.dbg.value(metadata i64 0, metadata !182, metadata !DIExpression()), !dbg !290

  //   store atomic i64 0, i64* @atom_0_X3_2 monotonic, align 8, !dbg !179
  // ST: Guess
  iw(0,3) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW 
  old_cw = cw(0,3);
  cw(0,3) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM 
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

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X2_2, metadata !183, metadata !DIExpression()), !dbg !292

  //   call void @llvm.dbg.value(metadata i64 0, metadata !185, metadata !DIExpression()), !dbg !292

  //   store atomic i64 0, i64* @atom_0_X2_2 monotonic, align 8, !dbg !181
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

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X2_1, metadata !186, metadata !DIExpression()), !dbg !294

  //   call void @llvm.dbg.value(metadata i64 0, metadata !188, metadata !DIExpression()), !dbg !294

  //   store atomic i64 0, i64* @atom_0_X2_1 monotonic, align 8, !dbg !183
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

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X3_1, metadata !189, metadata !DIExpression()), !dbg !296

  //   call void @llvm.dbg.value(metadata i64 0, metadata !191, metadata !DIExpression()), !dbg !296

  //   store atomic i64 0, i64* @atom_0_X3_1 monotonic, align 8, !dbg !185
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

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X3_1, metadata !192, metadata !DIExpression()), !dbg !298

  //   call void @llvm.dbg.value(metadata i64 0, metadata !194, metadata !DIExpression()), !dbg !298

  //   store atomic i64 0, i64* @atom_1_X3_1 monotonic, align 8, !dbg !187
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

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X2_1, metadata !195, metadata !DIExpression()), !dbg !300

  //   call void @llvm.dbg.value(metadata i64 0, metadata !197, metadata !DIExpression()), !dbg !300

  //   store atomic i64 0, i64* @atom_1_X2_1 monotonic, align 8, !dbg !189
  // ST: Guess
  iw(0,8) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW 
  old_cw = cw(0,8);
  cw(0,8) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(0,8)] == 0);
  ASSUME(active[cw(0,8)] == 0);
  ASSUME(sforbid(8,cw(0,8))== 0);
  ASSUME(iw(0,8) >= 0);
  ASSUME(iw(0,8) >= 0);
  ASSUME(cw(0,8) >= iw(0,8));
  ASSUME(cw(0,8) >= old_cw);
  ASSUME(cw(0,8) >= cr(0,8));
  ASSUME(cw(0,8) >= cl[0]);
  ASSUME(cw(0,8) >= cisb[0]);
  ASSUME(cw(0,8) >= cdy[0]);
  ASSUME(cw(0,8) >= cdl[0]);
  ASSUME(cw(0,8) >= cds[0]);
  ASSUME(cw(0,8) >= cctrl[0]);
  ASSUME(cw(0,8) >= caddr[0]);
  // Update
  caddr[0] = max(caddr[0],0);
  buff(0,8) = 0;
  mem(8,cw(0,8)) = 0;
  co(8,cw(0,8))+=1;
  delta(8,cw(0,8)) = -1;
  ASSUME(creturn[0] >= cw(0,8));

  //   %call = call i32 @pthread_create(i64* noundef %thr0, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t0, i8* noundef null) #7, !dbg !190
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
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,3+0));
  ASSUME(cdy[0] >= cw(0,4+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,1+0));
  ASSUME(cdy[0] >= cw(0,2+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,3+0));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,1+0));
  ASSUME(cdy[0] >= cr(0,2+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[1] >= cdy[0]);

  //   %call17 = call i32 @pthread_create(i64* noundef %thr1, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t1, i8* noundef null) #7, !dbg !191
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
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,3+0));
  ASSUME(cdy[0] >= cw(0,4+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,1+0));
  ASSUME(cdy[0] >= cw(0,2+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,3+0));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,1+0));
  ASSUME(cdy[0] >= cr(0,2+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[2] >= cdy[0]);

  //   %2 = load i64, i64* %thr0, align 8, !dbg !192, !tbaa !193
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
  creg_r5 = cr(0,9);
  crmax(0,9) = max(crmax(0,9),cr(0,9));
  caddr[0] = max(caddr[0],0);
  if(cr(0,9) < cw(0,9)) {
    r5 = buff(0,9);
  } else {
    if(pw(0,9) != co(9,cr(0,9))) {
      ASSUME(cr(0,9) >= old_cr);
    }
    pw(0,9) = co(9,cr(0,9));
    r5 = mem(9,cr(0,9));
  }
  ASSUME(creturn[0] >= cr(0,9));

  //   %call18 = call i32 @pthread_join(i64 noundef %2, i8** noundef null), !dbg !197
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
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,3+0));
  ASSUME(cdy[0] >= cw(0,4+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,1+0));
  ASSUME(cdy[0] >= cw(0,2+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,3+0));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,1+0));
  ASSUME(cdy[0] >= cr(0,2+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[1]);

  //   %3 = load i64, i64* %thr1, align 8, !dbg !198, !tbaa !193
  // LD: Guess
  old_cr = cr(0,10);
  cr(0,10) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(0,10)] == 0);
  ASSUME(cr(0,10) >= iw(0,10));
  ASSUME(cr(0,10) >= 0);
  ASSUME(cr(0,10) >= cdy[0]);
  ASSUME(cr(0,10) >= cisb[0]);
  ASSUME(cr(0,10) >= cdl[0]);
  ASSUME(cr(0,10) >= cl[0]);
  // Update
  creg_r6 = cr(0,10);
  crmax(0,10) = max(crmax(0,10),cr(0,10));
  caddr[0] = max(caddr[0],0);
  if(cr(0,10) < cw(0,10)) {
    r6 = buff(0,10);
  } else {
    if(pw(0,10) != co(10,cr(0,10))) {
      ASSUME(cr(0,10) >= old_cr);
    }
    pw(0,10) = co(10,cr(0,10));
    r6 = mem(10,cr(0,10));
  }
  ASSUME(creturn[0] >= cr(0,10));

  //   %call19 = call i32 @pthread_join(i64 noundef %3, i8** noundef null), !dbg !199
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
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,3+0));
  ASSUME(cdy[0] >= cw(0,4+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,1+0));
  ASSUME(cdy[0] >= cw(0,2+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,3+0));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,1+0));
  ASSUME(cdy[0] >= cr(0,2+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[2]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([1 x i64], [1 x i64]* @vars, i64 0, i64 0), metadata !199, metadata !DIExpression()), !dbg !312

  //   %4 = load atomic i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @vars, i64 0, i64 0) seq_cst, align 8, !dbg !201
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
  creg_r7 = cr(0,0);
  crmax(0,0) = max(crmax(0,0),cr(0,0));
  caddr[0] = max(caddr[0],0);
  if(cr(0,0) < cw(0,0)) {
    r7 = buff(0,0);
  } else {
    if(pw(0,0) != co(0,cr(0,0))) {
      ASSUME(cr(0,0) >= old_cr);
    }
    pw(0,0) = co(0,cr(0,0));
    r7 = mem(0,cr(0,0));
  }
  ASSUME(creturn[0] >= cr(0,0));

  //   call void @llvm.dbg.value(metadata i64 %4, metadata !201, metadata !DIExpression()), !dbg !312

  //   %conv = trunc i64 %4 to i32, !dbg !202

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !198, metadata !DIExpression()), !dbg !279

  //   %cmp = icmp eq i32 %conv, 2, !dbg !203

  //   %conv20 = zext i1 %cmp to i32, !dbg !203

  //   call void @llvm.dbg.value(metadata i32 %conv20, metadata !202, metadata !DIExpression()), !dbg !279

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X3_2, metadata !204, metadata !DIExpression()), !dbg !316

  //   %5 = load atomic i64, i64* @atom_1_X3_2 seq_cst, align 8, !dbg !205
  // LD: Guess
  old_cr = cr(0,1);
  cr(0,1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(0,1)] == 0);
  ASSUME(cr(0,1) >= iw(0,1));
  ASSUME(cr(0,1) >= 0);
  ASSUME(cr(0,1) >= cdy[0]);
  ASSUME(cr(0,1) >= cisb[0]);
  ASSUME(cr(0,1) >= cdl[0]);
  ASSUME(cr(0,1) >= cl[0]);
  // Update
  creg_r8 = cr(0,1);
  crmax(0,1) = max(crmax(0,1),cr(0,1));
  caddr[0] = max(caddr[0],0);
  if(cr(0,1) < cw(0,1)) {
    r8 = buff(0,1);
  } else {
    if(pw(0,1) != co(1,cr(0,1))) {
      ASSUME(cr(0,1) >= old_cr);
    }
    pw(0,1) = co(1,cr(0,1));
    r8 = mem(1,cr(0,1));
  }
  ASSUME(creturn[0] >= cr(0,1));

  //   call void @llvm.dbg.value(metadata i64 %5, metadata !206, metadata !DIExpression()), !dbg !316

  //   %conv24 = trunc i64 %5 to i32, !dbg !206

  //   call void @llvm.dbg.value(metadata i32 %conv24, metadata !203, metadata !DIExpression()), !dbg !279

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X2_2, metadata !208, metadata !DIExpression()), !dbg !319

  //   %6 = load atomic i64, i64* @atom_1_X2_2 seq_cst, align 8, !dbg !208
  // LD: Guess
  old_cr = cr(0,2);
  cr(0,2) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(0,2)] == 0);
  ASSUME(cr(0,2) >= iw(0,2));
  ASSUME(cr(0,2) >= 0);
  ASSUME(cr(0,2) >= cdy[0]);
  ASSUME(cr(0,2) >= cisb[0]);
  ASSUME(cr(0,2) >= cdl[0]);
  ASSUME(cr(0,2) >= cl[0]);
  // Update
  creg_r9 = cr(0,2);
  crmax(0,2) = max(crmax(0,2),cr(0,2));
  caddr[0] = max(caddr[0],0);
  if(cr(0,2) < cw(0,2)) {
    r9 = buff(0,2);
  } else {
    if(pw(0,2) != co(2,cr(0,2))) {
      ASSUME(cr(0,2) >= old_cr);
    }
    pw(0,2) = co(2,cr(0,2));
    r9 = mem(2,cr(0,2));
  }
  ASSUME(creturn[0] >= cr(0,2));

  //   call void @llvm.dbg.value(metadata i64 %6, metadata !210, metadata !DIExpression()), !dbg !319

  //   %conv28 = trunc i64 %6 to i32, !dbg !209

  //   call void @llvm.dbg.value(metadata i32 %conv28, metadata !207, metadata !DIExpression()), !dbg !279

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X3_2, metadata !212, metadata !DIExpression()), !dbg !322

  //   %7 = load atomic i64, i64* @atom_0_X3_2 seq_cst, align 8, !dbg !211
  // LD: Guess
  old_cr = cr(0,3);
  cr(0,3) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(0,3)] == 0);
  ASSUME(cr(0,3) >= iw(0,3));
  ASSUME(cr(0,3) >= 0);
  ASSUME(cr(0,3) >= cdy[0]);
  ASSUME(cr(0,3) >= cisb[0]);
  ASSUME(cr(0,3) >= cdl[0]);
  ASSUME(cr(0,3) >= cl[0]);
  // Update
  creg_r10 = cr(0,3);
  crmax(0,3) = max(crmax(0,3),cr(0,3));
  caddr[0] = max(caddr[0],0);
  if(cr(0,3) < cw(0,3)) {
    r10 = buff(0,3);
  } else {
    if(pw(0,3) != co(3,cr(0,3))) {
      ASSUME(cr(0,3) >= old_cr);
    }
    pw(0,3) = co(3,cr(0,3));
    r10 = mem(3,cr(0,3));
  }
  ASSUME(creturn[0] >= cr(0,3));

  //   call void @llvm.dbg.value(metadata i64 %7, metadata !214, metadata !DIExpression()), !dbg !322

  //   %conv32 = trunc i64 %7 to i32, !dbg !212

  //   call void @llvm.dbg.value(metadata i32 %conv32, metadata !211, metadata !DIExpression()), !dbg !279

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X2_2, metadata !216, metadata !DIExpression()), !dbg !325

  //   %8 = load atomic i64, i64* @atom_0_X2_2 seq_cst, align 8, !dbg !214
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
  } else {
    if(pw(0,4) != co(4,cr(0,4))) {
      ASSUME(cr(0,4) >= old_cr);
    }
    pw(0,4) = co(4,cr(0,4));
    r11 = mem(4,cr(0,4));
  }
  ASSUME(creturn[0] >= cr(0,4));

  //   call void @llvm.dbg.value(metadata i64 %8, metadata !218, metadata !DIExpression()), !dbg !325

  //   %conv36 = trunc i64 %8 to i32, !dbg !215

  //   call void @llvm.dbg.value(metadata i32 %conv36, metadata !215, metadata !DIExpression()), !dbg !279

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X2_1, metadata !220, metadata !DIExpression()), !dbg !328

  //   %9 = load atomic i64, i64* @atom_0_X2_1 seq_cst, align 8, !dbg !217
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
  } else {
    if(pw(0,5) != co(5,cr(0,5))) {
      ASSUME(cr(0,5) >= old_cr);
    }
    pw(0,5) = co(5,cr(0,5));
    r12 = mem(5,cr(0,5));
  }
  ASSUME(creturn[0] >= cr(0,5));

  //   call void @llvm.dbg.value(metadata i64 %9, metadata !222, metadata !DIExpression()), !dbg !328

  //   %conv40 = trunc i64 %9 to i32, !dbg !218

  //   call void @llvm.dbg.value(metadata i32 %conv40, metadata !219, metadata !DIExpression()), !dbg !279

  //   %or = or i32 %conv36, %conv40, !dbg !219
  creg_r13 = max(creg_r11,creg_r12);
  ASSUME(active[creg_r13] == 0);
  r13 = r11 | r12;

  //   call void @llvm.dbg.value(metadata i32 %or, metadata !223, metadata !DIExpression()), !dbg !279

  //   %and = and i32 %conv32, %or, !dbg !220
  creg_r14 = max(creg_r10,creg_r13);
  ASSUME(active[creg_r14] == 0);
  r14 = r10 & r13;

  //   call void @llvm.dbg.value(metadata i32 %and, metadata !224, metadata !DIExpression()), !dbg !279

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X3_1, metadata !226, metadata !DIExpression()), !dbg !333

  //   %10 = load atomic i64, i64* @atom_0_X3_1 seq_cst, align 8, !dbg !222
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
  creg_r15 = cr(0,6);
  crmax(0,6) = max(crmax(0,6),cr(0,6));
  caddr[0] = max(caddr[0],0);
  if(cr(0,6) < cw(0,6)) {
    r15 = buff(0,6);
  } else {
    if(pw(0,6) != co(6,cr(0,6))) {
      ASSUME(cr(0,6) >= old_cr);
    }
    pw(0,6) = co(6,cr(0,6));
    r15 = mem(6,cr(0,6));
  }
  ASSUME(creturn[0] >= cr(0,6));

  //   call void @llvm.dbg.value(metadata i64 %10, metadata !228, metadata !DIExpression()), !dbg !333

  //   %conv44 = trunc i64 %10 to i32, !dbg !223

  //   call void @llvm.dbg.value(metadata i32 %conv44, metadata !225, metadata !DIExpression()), !dbg !279

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X2_1, metadata !230, metadata !DIExpression()), !dbg !336

  //   %11 = load atomic i64, i64* @atom_0_X2_1 seq_cst, align 8, !dbg !225
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
  creg_r16 = cr(0,5);
  crmax(0,5) = max(crmax(0,5),cr(0,5));
  caddr[0] = max(caddr[0],0);
  if(cr(0,5) < cw(0,5)) {
    r16 = buff(0,5);
  } else {
    if(pw(0,5) != co(5,cr(0,5))) {
      ASSUME(cr(0,5) >= old_cr);
    }
    pw(0,5) = co(5,cr(0,5));
    r16 = mem(5,cr(0,5));
  }
  ASSUME(creturn[0] >= cr(0,5));

  //   call void @llvm.dbg.value(metadata i64 %11, metadata !232, metadata !DIExpression()), !dbg !336

  //   %conv48 = trunc i64 %11 to i32, !dbg !226

  //   call void @llvm.dbg.value(metadata i32 %conv48, metadata !229, metadata !DIExpression()), !dbg !279

  //   %and49 = and i32 %conv44, %conv48, !dbg !227
  creg_r17 = max(creg_r15,creg_r16);
  ASSUME(active[creg_r17] == 0);
  r17 = r15 & r16;

  //   call void @llvm.dbg.value(metadata i32 %and49, metadata !233, metadata !DIExpression()), !dbg !279

  //   %or50 = or i32 %and, %and49, !dbg !228
  creg_r18 = max(creg_r14,creg_r17);
  ASSUME(active[creg_r18] == 0);
  r18 = r14 | r17;

  //   call void @llvm.dbg.value(metadata i32 %or50, metadata !234, metadata !DIExpression()), !dbg !279

  //   %and51 = and i32 %conv28, %or50, !dbg !229
  creg_r19 = max(creg_r9,creg_r18);
  ASSUME(active[creg_r19] == 0);
  r19 = r9 & r18;

  //   call void @llvm.dbg.value(metadata i32 %and51, metadata !235, metadata !DIExpression()), !dbg !279

  //   %and52 = and i32 %conv24, %and51, !dbg !230
  creg_r20 = max(creg_r8,creg_r19);
  ASSUME(active[creg_r20] == 0);
  r20 = r8 & r19;

  //   call void @llvm.dbg.value(metadata i32 %and52, metadata !236, metadata !DIExpression()), !dbg !279

  //   %and53 = and i32 %conv20, %and52, !dbg !231
  creg_r21 = max(max(creg_r7,0),creg_r20);
  ASSUME(active[creg_r21] == 0);
  r21 = (r7==2) & r20;

  //   call void @llvm.dbg.value(metadata i32 %and53, metadata !237, metadata !DIExpression()), !dbg !279

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([1 x i64], [1 x i64]* @vars, i64 0, i64 0), metadata !239, metadata !DIExpression()), !dbg !344

  //   %12 = load atomic i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @vars, i64 0, i64 0) seq_cst, align 8, !dbg !233
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
  creg_r22 = cr(0,0);
  crmax(0,0) = max(crmax(0,0),cr(0,0));
  caddr[0] = max(caddr[0],0);
  if(cr(0,0) < cw(0,0)) {
    r22 = buff(0,0);
  } else {
    if(pw(0,0) != co(0,cr(0,0))) {
      ASSUME(cr(0,0) >= old_cr);
    }
    pw(0,0) = co(0,cr(0,0));
    r22 = mem(0,cr(0,0));
  }
  ASSUME(creturn[0] >= cr(0,0));

  //   call void @llvm.dbg.value(metadata i64 %12, metadata !241, metadata !DIExpression()), !dbg !344

  //   %conv57 = trunc i64 %12 to i32, !dbg !234

  //   call void @llvm.dbg.value(metadata i32 %conv57, metadata !238, metadata !DIExpression()), !dbg !279

  //   %cmp58 = icmp eq i32 %conv57, 1, !dbg !235

  //   %conv59 = zext i1 %cmp58 to i32, !dbg !235

  //   call void @llvm.dbg.value(metadata i32 %conv59, metadata !242, metadata !DIExpression()), !dbg !279

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X3_1, metadata !244, metadata !DIExpression()), !dbg !348

  //   %13 = load atomic i64, i64* @atom_0_X3_1 seq_cst, align 8, !dbg !237
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
  creg_r23 = cr(0,6);
  crmax(0,6) = max(crmax(0,6),cr(0,6));
  caddr[0] = max(caddr[0],0);
  if(cr(0,6) < cw(0,6)) {
    r23 = buff(0,6);
  } else {
    if(pw(0,6) != co(6,cr(0,6))) {
      ASSUME(cr(0,6) >= old_cr);
    }
    pw(0,6) = co(6,cr(0,6));
    r23 = mem(6,cr(0,6));
  }
  ASSUME(creturn[0] >= cr(0,6));

  //   call void @llvm.dbg.value(metadata i64 %13, metadata !246, metadata !DIExpression()), !dbg !348

  //   %conv63 = trunc i64 %13 to i32, !dbg !238

  //   call void @llvm.dbg.value(metadata i32 %conv63, metadata !243, metadata !DIExpression()), !dbg !279

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X2_1, metadata !248, metadata !DIExpression()), !dbg !351

  //   %14 = load atomic i64, i64* @atom_0_X2_1 seq_cst, align 8, !dbg !240
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
  creg_r24 = cr(0,5);
  crmax(0,5) = max(crmax(0,5),cr(0,5));
  caddr[0] = max(caddr[0],0);
  if(cr(0,5) < cw(0,5)) {
    r24 = buff(0,5);
  } else {
    if(pw(0,5) != co(5,cr(0,5))) {
      ASSUME(cr(0,5) >= old_cr);
    }
    pw(0,5) = co(5,cr(0,5));
    r24 = mem(5,cr(0,5));
  }
  ASSUME(creturn[0] >= cr(0,5));

  //   call void @llvm.dbg.value(metadata i64 %14, metadata !250, metadata !DIExpression()), !dbg !351

  //   %conv67 = trunc i64 %14 to i32, !dbg !241

  //   call void @llvm.dbg.value(metadata i32 %conv67, metadata !247, metadata !DIExpression()), !dbg !279

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X3_2, metadata !252, metadata !DIExpression()), !dbg !354

  //   %15 = load atomic i64, i64* @atom_1_X3_2 seq_cst, align 8, !dbg !243
  // LD: Guess
  old_cr = cr(0,1);
  cr(0,1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(0,1)] == 0);
  ASSUME(cr(0,1) >= iw(0,1));
  ASSUME(cr(0,1) >= 0);
  ASSUME(cr(0,1) >= cdy[0]);
  ASSUME(cr(0,1) >= cisb[0]);
  ASSUME(cr(0,1) >= cdl[0]);
  ASSUME(cr(0,1) >= cl[0]);
  // Update
  creg_r25 = cr(0,1);
  crmax(0,1) = max(crmax(0,1),cr(0,1));
  caddr[0] = max(caddr[0],0);
  if(cr(0,1) < cw(0,1)) {
    r25 = buff(0,1);
  } else {
    if(pw(0,1) != co(1,cr(0,1))) {
      ASSUME(cr(0,1) >= old_cr);
    }
    pw(0,1) = co(1,cr(0,1));
    r25 = mem(1,cr(0,1));
  }
  ASSUME(creturn[0] >= cr(0,1));

  //   call void @llvm.dbg.value(metadata i64 %15, metadata !254, metadata !DIExpression()), !dbg !354

  //   %conv71 = trunc i64 %15 to i32, !dbg !244

  //   call void @llvm.dbg.value(metadata i32 %conv71, metadata !251, metadata !DIExpression()), !dbg !279

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X2_2, metadata !256, metadata !DIExpression()), !dbg !357

  //   %16 = load atomic i64, i64* @atom_1_X2_2 seq_cst, align 8, !dbg !246
  // LD: Guess
  old_cr = cr(0,2);
  cr(0,2) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(0,2)] == 0);
  ASSUME(cr(0,2) >= iw(0,2));
  ASSUME(cr(0,2) >= 0);
  ASSUME(cr(0,2) >= cdy[0]);
  ASSUME(cr(0,2) >= cisb[0]);
  ASSUME(cr(0,2) >= cdl[0]);
  ASSUME(cr(0,2) >= cl[0]);
  // Update
  creg_r26 = cr(0,2);
  crmax(0,2) = max(crmax(0,2),cr(0,2));
  caddr[0] = max(caddr[0],0);
  if(cr(0,2) < cw(0,2)) {
    r26 = buff(0,2);
  } else {
    if(pw(0,2) != co(2,cr(0,2))) {
      ASSUME(cr(0,2) >= old_cr);
    }
    pw(0,2) = co(2,cr(0,2));
    r26 = mem(2,cr(0,2));
  }
  ASSUME(creturn[0] >= cr(0,2));

  //   call void @llvm.dbg.value(metadata i64 %16, metadata !258, metadata !DIExpression()), !dbg !357

  //   %conv75 = trunc i64 %16 to i32, !dbg !247

  //   call void @llvm.dbg.value(metadata i32 %conv75, metadata !255, metadata !DIExpression()), !dbg !279

  //   %and76 = and i32 %conv71, %conv75, !dbg !248
  creg_r27 = max(creg_r25,creg_r26);
  ASSUME(active[creg_r27] == 0);
  r27 = r25 & r26;

  //   call void @llvm.dbg.value(metadata i32 %and76, metadata !259, metadata !DIExpression()), !dbg !279

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X3_1, metadata !261, metadata !DIExpression()), !dbg !361

  //   %17 = load atomic i64, i64* @atom_1_X3_1 seq_cst, align 8, !dbg !250
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
  creg_r28 = cr(0,7);
  crmax(0,7) = max(crmax(0,7),cr(0,7));
  caddr[0] = max(caddr[0],0);
  if(cr(0,7) < cw(0,7)) {
    r28 = buff(0,7);
  } else {
    if(pw(0,7) != co(7,cr(0,7))) {
      ASSUME(cr(0,7) >= old_cr);
    }
    pw(0,7) = co(7,cr(0,7));
    r28 = mem(7,cr(0,7));
  }
  ASSUME(creturn[0] >= cr(0,7));

  //   call void @llvm.dbg.value(metadata i64 %17, metadata !263, metadata !DIExpression()), !dbg !361

  //   %conv80 = trunc i64 %17 to i32, !dbg !251

  //   call void @llvm.dbg.value(metadata i32 %conv80, metadata !260, metadata !DIExpression()), !dbg !279

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X2_2, metadata !265, metadata !DIExpression()), !dbg !364

  //   %18 = load atomic i64, i64* @atom_1_X2_2 seq_cst, align 8, !dbg !253
  // LD: Guess
  old_cr = cr(0,2);
  cr(0,2) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(0,2)] == 0);
  ASSUME(cr(0,2) >= iw(0,2));
  ASSUME(cr(0,2) >= 0);
  ASSUME(cr(0,2) >= cdy[0]);
  ASSUME(cr(0,2) >= cisb[0]);
  ASSUME(cr(0,2) >= cdl[0]);
  ASSUME(cr(0,2) >= cl[0]);
  // Update
  creg_r29 = cr(0,2);
  crmax(0,2) = max(crmax(0,2),cr(0,2));
  caddr[0] = max(caddr[0],0);
  if(cr(0,2) < cw(0,2)) {
    r29 = buff(0,2);
  } else {
    if(pw(0,2) != co(2,cr(0,2))) {
      ASSUME(cr(0,2) >= old_cr);
    }
    pw(0,2) = co(2,cr(0,2));
    r29 = mem(2,cr(0,2));
  }
  ASSUME(creturn[0] >= cr(0,2));

  //   call void @llvm.dbg.value(metadata i64 %18, metadata !267, metadata !DIExpression()), !dbg !364

  //   %conv84 = trunc i64 %18 to i32, !dbg !254

  //   call void @llvm.dbg.value(metadata i32 %conv84, metadata !264, metadata !DIExpression()), !dbg !279

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X2_1, metadata !269, metadata !DIExpression()), !dbg !367

  //   %19 = load atomic i64, i64* @atom_1_X2_1 seq_cst, align 8, !dbg !256
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
  creg_r30 = cr(0,8);
  crmax(0,8) = max(crmax(0,8),cr(0,8));
  caddr[0] = max(caddr[0],0);
  if(cr(0,8) < cw(0,8)) {
    r30 = buff(0,8);
  } else {
    if(pw(0,8) != co(8,cr(0,8))) {
      ASSUME(cr(0,8) >= old_cr);
    }
    pw(0,8) = co(8,cr(0,8));
    r30 = mem(8,cr(0,8));
  }
  ASSUME(creturn[0] >= cr(0,8));

  //   call void @llvm.dbg.value(metadata i64 %19, metadata !271, metadata !DIExpression()), !dbg !367

  //   %conv88 = trunc i64 %19 to i32, !dbg !257

  //   call void @llvm.dbg.value(metadata i32 %conv88, metadata !268, metadata !DIExpression()), !dbg !279

  //   %or89 = or i32 %conv84, %conv88, !dbg !258
  creg_r31 = max(creg_r29,creg_r30);
  ASSUME(active[creg_r31] == 0);
  r31 = r29 | r30;

  //   call void @llvm.dbg.value(metadata i32 %or89, metadata !272, metadata !DIExpression()), !dbg !279

  //   %and90 = and i32 %conv80, %or89, !dbg !259
  creg_r32 = max(creg_r28,creg_r31);
  ASSUME(active[creg_r32] == 0);
  r32 = r28 & r31;

  //   call void @llvm.dbg.value(metadata i32 %and90, metadata !273, metadata !DIExpression()), !dbg !279

  //   %or91 = or i32 %and76, %and90, !dbg !260
  creg_r33 = max(creg_r27,creg_r32);
  ASSUME(active[creg_r33] == 0);
  r33 = r27 | r32;

  //   call void @llvm.dbg.value(metadata i32 %or91, metadata !274, metadata !DIExpression()), !dbg !279

  //   %and92 = and i32 %conv67, %or91, !dbg !261
  creg_r34 = max(creg_r24,creg_r33);
  ASSUME(active[creg_r34] == 0);
  r34 = r24 & r33;

  //   call void @llvm.dbg.value(metadata i32 %and92, metadata !275, metadata !DIExpression()), !dbg !279

  //   %and93 = and i32 %conv63, %and92, !dbg !262
  creg_r35 = max(creg_r23,creg_r34);
  ASSUME(active[creg_r35] == 0);
  r35 = r23 & r34;

  //   call void @llvm.dbg.value(metadata i32 %and93, metadata !276, metadata !DIExpression()), !dbg !279

  //   %and94 = and i32 %conv59, %and93, !dbg !263
  creg_r36 = max(max(creg_r22,0),creg_r35);
  ASSUME(active[creg_r36] == 0);
  r36 = (r22==1) & r35;

  //   call void @llvm.dbg.value(metadata i32 %and94, metadata !277, metadata !DIExpression()), !dbg !279

  //   %or95 = or i32 %and53, %and94, !dbg !264
  creg_r37 = max(creg_r21,creg_r36);
  ASSUME(active[creg_r37] == 0);
  r37 = r21 | r36;

  //   call void @llvm.dbg.value(metadata i32 %or95, metadata !278, metadata !DIExpression()), !dbg !279

  //   %cmp96 = icmp eq i32 %or95, 0, !dbg !265

  //   br i1 %cmp96, label %if.then, label %if.end, !dbg !267
  old_cctrl = cctrl[0];
  cctrl[0] = get_rng(0,NCONTEXT-1);
  ASSUME(cctrl[0] >= old_cctrl);
  ASSUME(cctrl[0] >= creg_r37);
  ASSUME(cctrl[0] >= 0);
  if((r37==0)) {
    goto T0BLOCK1;
  } else {
    goto T0BLOCK2;
  }

T0BLOCK1:
  //   call void @__assert_fail(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([91 x i8], [91 x i8]* @.str.1, i64 0, i64 0), i32 noundef 109, i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #8, !dbg !268

  //   unreachable, !dbg !268
  r38 = 1;

T0BLOCK2:
  //   %20 = bitcast i64* %thr1 to i8*, !dbg !271

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %20) #7, !dbg !271

  //   %21 = bitcast i64* %thr0 to i8*, !dbg !271

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %21) #7, !dbg !271

  //   ret i32 0, !dbg !272
  ret_thread_0 = 0;



  ASSERT(r38== 0);

}
