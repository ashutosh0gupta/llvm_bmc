// 0:vars:2
// 3:atom_0_X2_1:1
// 2:atom_0_X5_2:1
// 4:atom_1_X2_2:1
// 5:atom_1_X3_0:1
// 6:thr0:1
// 7:thr1:1
#define ADDRSIZE 8
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
  mem(3+0,0) = 0;
  mem(2+0,0) = 0;
  mem(4+0,0) = 0;
  mem(5+0,0) = 0;
  mem(6+0,0) = 0;
  mem(7+0,0) = 0;
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
  // Dumping thread 1
  int ret_thread_1 = 0;
  cdy[1] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[1] >= cstart[1]);
T1BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !39, metadata !DIExpression()), !dbg !65

  //   br label %label_1, !dbg !66
  goto T1BLOCK1;

T1BLOCK1:
  //   call void @llvm.dbg.label(metadata !64), !dbg !67

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0), metadata !40, metadata !DIExpression()), !dbg !68

  //   call void @llvm.dbg.value(metadata i64 1, metadata !43, metadata !DIExpression()), !dbg !68

  //   store atomic i64 1, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !69
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0), metadata !46, metadata !DIExpression()), !dbg !70

  //   %0 = load atomic i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !71
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

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !48, metadata !DIExpression()), !dbg !70

  //   %conv = trunc i64 %0 to i32, !dbg !72

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !44, metadata !DIExpression()), !dbg !65

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 1), metadata !49, metadata !DIExpression()), !dbg !73

  //   call void @llvm.dbg.value(metadata i64 1, metadata !51, metadata !DIExpression()), !dbg !73

  //   store atomic i64 1, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 1) release, align 8, !dbg !74
  // ST: Guess
  //   : Release
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
  ASSUME(cw(1,0+1*1) >= cr(1,0+0));
  ASSUME(cw(1,0+1*1) >= cr(1,0+1));
  ASSUME(cw(1,0+1*1) >= cr(1,3+0));
  ASSUME(cw(1,0+1*1) >= cr(1,2+0));
  ASSUME(cw(1,0+1*1) >= cr(1,4+0));
  ASSUME(cw(1,0+1*1) >= cr(1,5+0));
  ASSUME(cw(1,0+1*1) >= cr(1,6+0));
  ASSUME(cw(1,0+1*1) >= cr(1,7+0));
  ASSUME(cw(1,0+1*1) >= cw(1,0+0));
  ASSUME(cw(1,0+1*1) >= cw(1,0+1));
  ASSUME(cw(1,0+1*1) >= cw(1,3+0));
  ASSUME(cw(1,0+1*1) >= cw(1,2+0));
  ASSUME(cw(1,0+1*1) >= cw(1,4+0));
  ASSUME(cw(1,0+1*1) >= cw(1,5+0));
  ASSUME(cw(1,0+1*1) >= cw(1,6+0));
  ASSUME(cw(1,0+1*1) >= cw(1,7+0));
  // Update
  caddr[1] = max(caddr[1],0);
  buff(1,0+1*1) = 1;
  mem(0+1*1,cw(1,0+1*1)) = 1;
  co(0+1*1,cw(1,0+1*1))+=1;
  delta(0+1*1,cw(1,0+1*1)) = -1;
  is(1,0+1*1) = iw(1,0+1*1);
  cs(1,0+1*1) = cw(1,0+1*1);
  ASSUME(creturn[1] >= cw(1,0+1*1));

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 1), metadata !53, metadata !DIExpression()), !dbg !75

  //   %1 = load atomic i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !76
  // LD: Guess
  old_cr = cr(1,0+1*1);
  cr(1,0+1*1) = get_rng(0,NCONTEXT-1);// 1 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(1,0+1*1)] == 1);
  ASSUME(cr(1,0+1*1) >= iw(1,0+1*1));
  ASSUME(cr(1,0+1*1) >= 0);
  ASSUME(cr(1,0+1*1) >= cdy[1]);
  ASSUME(cr(1,0+1*1) >= cisb[1]);
  ASSUME(cr(1,0+1*1) >= cdl[1]);
  ASSUME(cr(1,0+1*1) >= cl[1]);
  // Update
  creg_r1 = cr(1,0+1*1);
  crmax(1,0+1*1) = max(crmax(1,0+1*1),cr(1,0+1*1));
  caddr[1] = max(caddr[1],0);
  if(cr(1,0+1*1) < cw(1,0+1*1)) {
    r1 = buff(1,0+1*1);
  } else {
    if(pw(1,0+1*1) != co(0+1*1,cr(1,0+1*1))) {
      ASSUME(cr(1,0+1*1) >= old_cr);
    }
    pw(1,0+1*1) = co(0+1*1,cr(1,0+1*1));
    r1 = mem(0+1*1,cr(1,0+1*1));
  }
  ASSUME(creturn[1] >= cr(1,0+1*1));

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !55, metadata !DIExpression()), !dbg !75

  //   %conv6 = trunc i64 %1 to i32, !dbg !77

  //   call void @llvm.dbg.value(metadata i32 %conv6, metadata !52, metadata !DIExpression()), !dbg !65

  //   %cmp = icmp eq i32 %conv6, 2, !dbg !78

  //   %conv7 = zext i1 %cmp to i32, !dbg !78

  //   call void @llvm.dbg.value(metadata i32 %conv7, metadata !56, metadata !DIExpression()), !dbg !65

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X5_2, metadata !57, metadata !DIExpression()), !dbg !79

  //   %2 = zext i32 %conv7 to i64

  //   call void @llvm.dbg.value(metadata i64 %2, metadata !59, metadata !DIExpression()), !dbg !79

  //   store atomic i64 %2, i64* @atom_0_X5_2 seq_cst, align 8, !dbg !80
  // ST: Guess
  iw(1,2) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW 
  old_cw = cw(1,2);
  cw(1,2) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(1,2)] == 1);
  ASSUME(active[cw(1,2)] == 1);
  ASSUME(sforbid(2,cw(1,2))== 0);
  ASSUME(iw(1,2) >= max(creg_r1,0));
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
  buff(1,2) = (r1==2);
  mem(2,cw(1,2)) = (r1==2);
  co(2,cw(1,2))+=1;
  delta(2,cw(1,2)) = -1;
  ASSUME(creturn[1] >= cw(1,2));

  //   %cmp11 = icmp eq i32 %conv, 1, !dbg !81

  //   %conv12 = zext i1 %cmp11 to i32, !dbg !81

  //   call void @llvm.dbg.value(metadata i32 %conv12, metadata !60, metadata !DIExpression()), !dbg !65

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X2_1, metadata !61, metadata !DIExpression()), !dbg !82

  //   %3 = zext i32 %conv12 to i64

  //   call void @llvm.dbg.value(metadata i64 %3, metadata !63, metadata !DIExpression()), !dbg !82

  //   store atomic i64 %3, i64* @atom_0_X2_1 seq_cst, align 8, !dbg !83
  // ST: Guess
  iw(1,3) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW 
  old_cw = cw(1,3);
  cw(1,3) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(1,3)] == 1);
  ASSUME(active[cw(1,3)] == 1);
  ASSUME(sforbid(3,cw(1,3))== 0);
  ASSUME(iw(1,3) >= max(creg_r0,0));
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
  buff(1,3) = (r0==1);
  mem(3,cw(1,3)) = (r0==1);
  co(3,cw(1,3))+=1;
  delta(3,cw(1,3)) = -1;
  ASSUME(creturn[1] >= cw(1,3));

  //   ret i8* null, !dbg !84
  ret_thread_1 = (- 1);


  // Dumping thread 2
  int ret_thread_2 = 0;
  cdy[2] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[2] >= cstart[2]);
T2BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !87, metadata !DIExpression()), !dbg !109

  //   br label %label_2, !dbg !64
  goto T2BLOCK1;

T2BLOCK1:
  //   call void @llvm.dbg.label(metadata !107), !dbg !111

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 1), metadata !88, metadata !DIExpression()), !dbg !112

  //   call void @llvm.dbg.value(metadata i64 2, metadata !90, metadata !DIExpression()), !dbg !112

  //   store atomic i64 2, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 1) release, align 8, !dbg !67
  // ST: Guess
  //   : Release
  iw(2,0+1*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW 
  old_cw = cw(2,0+1*1);
  cw(2,0+1*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM 
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
  ASSUME(cw(2,0+1*1) >= cr(2,3+0));
  ASSUME(cw(2,0+1*1) >= cr(2,2+0));
  ASSUME(cw(2,0+1*1) >= cr(2,4+0));
  ASSUME(cw(2,0+1*1) >= cr(2,5+0));
  ASSUME(cw(2,0+1*1) >= cr(2,6+0));
  ASSUME(cw(2,0+1*1) >= cr(2,7+0));
  ASSUME(cw(2,0+1*1) >= cw(2,0+0));
  ASSUME(cw(2,0+1*1) >= cw(2,0+1));
  ASSUME(cw(2,0+1*1) >= cw(2,3+0));
  ASSUME(cw(2,0+1*1) >= cw(2,2+0));
  ASSUME(cw(2,0+1*1) >= cw(2,4+0));
  ASSUME(cw(2,0+1*1) >= cw(2,5+0));
  ASSUME(cw(2,0+1*1) >= cw(2,6+0));
  ASSUME(cw(2,0+1*1) >= cw(2,7+0));
  // Update
  caddr[2] = max(caddr[2],0);
  buff(2,0+1*1) = 2;
  mem(0+1*1,cw(2,0+1*1)) = 2;
  co(0+1*1,cw(2,0+1*1))+=1;
  delta(0+1*1,cw(2,0+1*1)) = -1;
  is(2,0+1*1) = iw(2,0+1*1);
  cs(2,0+1*1) = cw(2,0+1*1);
  ASSUME(creturn[2] >= cw(2,0+1*1));

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 1), metadata !92, metadata !DIExpression()), !dbg !114

  //   %0 = load atomic i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !69
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
  creg_r2 = cr(2,0+1*1);
  crmax(2,0+1*1) = max(crmax(2,0+1*1),cr(2,0+1*1));
  caddr[2] = max(caddr[2],0);
  if(cr(2,0+1*1) < cw(2,0+1*1)) {
    r2 = buff(2,0+1*1);
  } else {
    if(pw(2,0+1*1) != co(0+1*1,cr(2,0+1*1))) {
      ASSUME(cr(2,0+1*1) >= old_cr);
    }
    pw(2,0+1*1) = co(0+1*1,cr(2,0+1*1));
    r2 = mem(0+1*1,cr(2,0+1*1));
  }
  ASSUME(creturn[2] >= cr(2,0+1*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !94, metadata !DIExpression()), !dbg !114

  //   %conv = trunc i64 %0 to i32, !dbg !70

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !91, metadata !DIExpression()), !dbg !109

  //   %tobool = icmp ne i32 %conv, 0, !dbg !71

  //   br i1 %tobool, label %if.then, label %if.else, !dbg !73
  old_cctrl = cctrl[2];
  cctrl[2] = get_rng(0,NCONTEXT-1);
  ASSUME(cctrl[2] >= old_cctrl);
  ASSUME(cctrl[2] >= creg_r2);
  ASSUME(cctrl[2] >= 0);
  if((r2!=0)) {
    goto T2BLOCK2;
  } else {
    goto T2BLOCK3;
  }

T2BLOCK2:
  //   br label %lbl_LC00, !dbg !74
  goto T2BLOCK4;

T2BLOCK3:
  //   br label %lbl_LC00, !dbg !75
  goto T2BLOCK4;

T2BLOCK4:
  //   call void @llvm.dbg.label(metadata !108), !dbg !122

  //   call void (...) @isb(), !dbg !77
  // isb: Guess
  cisb[2] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cisb[2] >= cdy[2]);
  ASSUME(cisb[2] >= cctrl[2]);
  ASSUME(cisb[2] >= caddr[2]);
  ASSUME(creturn[2] >= cisb[2]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0), metadata !96, metadata !DIExpression()), !dbg !124

  //   %1 = load atomic i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0) acquire, align 8, !dbg !79
  // LD: Guess
  //   : Acquire
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
  ASSUME(cr(2,0) >= cx(2,0));
  ASSUME(cr(2,0) >= cs(2,0+0));
  ASSUME(cr(2,0) >= cs(2,0+1));
  ASSUME(cr(2,0) >= cs(2,3+0));
  ASSUME(cr(2,0) >= cs(2,2+0));
  ASSUME(cr(2,0) >= cs(2,4+0));
  ASSUME(cr(2,0) >= cs(2,5+0));
  ASSUME(cr(2,0) >= cs(2,6+0));
  ASSUME(cr(2,0) >= cs(2,7+0));
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
  cl[2] = max(cl[2],cr(2,0));
  ASSUME(creturn[2] >= cr(2,0));

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !98, metadata !DIExpression()), !dbg !124

  //   %conv4 = trunc i64 %1 to i32, !dbg !80

  //   call void @llvm.dbg.value(metadata i32 %conv4, metadata !95, metadata !DIExpression()), !dbg !109

  //   %cmp = icmp eq i32 %conv, 2, !dbg !81

  //   %conv5 = zext i1 %cmp to i32, !dbg !81

  //   call void @llvm.dbg.value(metadata i32 %conv5, metadata !99, metadata !DIExpression()), !dbg !109

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X2_2, metadata !100, metadata !DIExpression()), !dbg !128

  //   %2 = zext i32 %conv5 to i64

  //   call void @llvm.dbg.value(metadata i64 %2, metadata !102, metadata !DIExpression()), !dbg !128

  //   store atomic i64 %2, i64* @atom_1_X2_2 seq_cst, align 8, !dbg !83
  // ST: Guess
  iw(2,4) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW 
  old_cw = cw(2,4);
  cw(2,4) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(2,4)] == 2);
  ASSUME(active[cw(2,4)] == 2);
  ASSUME(sforbid(4,cw(2,4))== 0);
  ASSUME(iw(2,4) >= max(creg_r2,0));
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
  buff(2,4) = (r2==2);
  mem(4,cw(2,4)) = (r2==2);
  co(4,cw(2,4))+=1;
  delta(4,cw(2,4)) = -1;
  ASSUME(creturn[2] >= cw(2,4));

  //   %cmp9 = icmp eq i32 %conv4, 0, !dbg !84

  //   %conv10 = zext i1 %cmp9 to i32, !dbg !84

  //   call void @llvm.dbg.value(metadata i32 %conv10, metadata !103, metadata !DIExpression()), !dbg !109

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X3_0, metadata !104, metadata !DIExpression()), !dbg !131

  //   %3 = zext i32 %conv10 to i64

  //   call void @llvm.dbg.value(metadata i64 %3, metadata !106, metadata !DIExpression()), !dbg !131

  //   store atomic i64 %3, i64* @atom_1_X3_0 seq_cst, align 8, !dbg !86
  // ST: Guess
  iw(2,5) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW 
  old_cw = cw(2,5);
  cw(2,5) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(2,5)] == 2);
  ASSUME(active[cw(2,5)] == 2);
  ASSUME(sforbid(5,cw(2,5))== 0);
  ASSUME(iw(2,5) >= max(creg_r3,0));
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
  buff(2,5) = (r3==0);
  mem(5,cw(2,5)) = (r3==0);
  co(5,cw(2,5))+=1;
  delta(5,cw(2,5)) = -1;
  ASSUME(creturn[2] >= cw(2,5));

  //   ret i8* null, !dbg !87
  ret_thread_2 = (- 1);


  // Dumping thread 0
  int ret_thread_0 = 0;
  cdy[0] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[0] >= cstart[0]);
T0BLOCK0:
  //   %thr0 = alloca i64, align 8

  //   %thr1 = alloca i64, align 8

  //   call void @llvm.dbg.value(metadata i32 %argc, metadata !141, metadata !DIExpression()), !dbg !197

  //   call void @llvm.dbg.value(metadata i8** %argv, metadata !142, metadata !DIExpression()), !dbg !197

  //   %0 = bitcast i64* %thr0 to i8*, !dbg !101

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #7, !dbg !101

  //   call void @llvm.dbg.declare(metadata i64* %thr0, metadata !143, metadata !DIExpression()), !dbg !199

  //   %1 = bitcast i64* %thr1 to i8*, !dbg !103

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #7, !dbg !103

  //   call void @llvm.dbg.declare(metadata i64* %thr1, metadata !147, metadata !DIExpression()), !dbg !201

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 1), metadata !148, metadata !DIExpression()), !dbg !202

  //   call void @llvm.dbg.value(metadata i64 0, metadata !150, metadata !DIExpression()), !dbg !202

  //   store atomic i64 0, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !106
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0), metadata !151, metadata !DIExpression()), !dbg !204

  //   call void @llvm.dbg.value(metadata i64 0, metadata !153, metadata !DIExpression()), !dbg !204

  //   store atomic i64 0, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !108
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

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X5_2, metadata !154, metadata !DIExpression()), !dbg !206

  //   call void @llvm.dbg.value(metadata i64 0, metadata !156, metadata !DIExpression()), !dbg !206

  //   store atomic i64 0, i64* @atom_0_X5_2 monotonic, align 8, !dbg !110
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

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X2_1, metadata !157, metadata !DIExpression()), !dbg !208

  //   call void @llvm.dbg.value(metadata i64 0, metadata !159, metadata !DIExpression()), !dbg !208

  //   store atomic i64 0, i64* @atom_0_X2_1 monotonic, align 8, !dbg !112
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

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X2_2, metadata !160, metadata !DIExpression()), !dbg !210

  //   call void @llvm.dbg.value(metadata i64 0, metadata !162, metadata !DIExpression()), !dbg !210

  //   store atomic i64 0, i64* @atom_1_X2_2 monotonic, align 8, !dbg !114
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

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X3_0, metadata !163, metadata !DIExpression()), !dbg !212

  //   call void @llvm.dbg.value(metadata i64 0, metadata !165, metadata !DIExpression()), !dbg !212

  //   store atomic i64 0, i64* @atom_1_X3_0 monotonic, align 8, !dbg !116
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

  //   %call = call i32 @pthread_create(i64* noundef %thr0, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t0, i8* noundef null) #7, !dbg !117
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
  ASSUME(cdy[0] >= cw(0,3+0));
  ASSUME(cdy[0] >= cw(0,2+0));
  ASSUME(cdy[0] >= cw(0,4+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,3+0));
  ASSUME(cdy[0] >= cr(0,2+0));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[1] >= cdy[0]);

  //   %call11 = call i32 @pthread_create(i64* noundef %thr1, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t1, i8* noundef null) #7, !dbg !118
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
  ASSUME(cdy[0] >= cw(0,3+0));
  ASSUME(cdy[0] >= cw(0,2+0));
  ASSUME(cdy[0] >= cw(0,4+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,3+0));
  ASSUME(cdy[0] >= cr(0,2+0));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[2] >= cdy[0]);

  //   %2 = load i64, i64* %thr0, align 8, !dbg !119, !tbaa !120
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
  creg_r5 = cr(0,6);
  crmax(0,6) = max(crmax(0,6),cr(0,6));
  caddr[0] = max(caddr[0],0);
  if(cr(0,6) < cw(0,6)) {
    r5 = buff(0,6);
  } else {
    if(pw(0,6) != co(6,cr(0,6))) {
      ASSUME(cr(0,6) >= old_cr);
    }
    pw(0,6) = co(6,cr(0,6));
    r5 = mem(6,cr(0,6));
  }
  ASSUME(creturn[0] >= cr(0,6));

  //   %call12 = call i32 @pthread_join(i64 noundef %2, i8** noundef null), !dbg !124
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
  ASSUME(cdy[0] >= cw(0,3+0));
  ASSUME(cdy[0] >= cw(0,2+0));
  ASSUME(cdy[0] >= cw(0,4+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,3+0));
  ASSUME(cdy[0] >= cr(0,2+0));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[1]);

  //   %3 = load i64, i64* %thr1, align 8, !dbg !125, !tbaa !120
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
  creg_r6 = cr(0,7);
  crmax(0,7) = max(crmax(0,7),cr(0,7));
  caddr[0] = max(caddr[0],0);
  if(cr(0,7) < cw(0,7)) {
    r6 = buff(0,7);
  } else {
    if(pw(0,7) != co(7,cr(0,7))) {
      ASSUME(cr(0,7) >= old_cr);
    }
    pw(0,7) = co(7,cr(0,7));
    r6 = mem(7,cr(0,7));
  }
  ASSUME(creturn[0] >= cr(0,7));

  //   %call13 = call i32 @pthread_join(i64 noundef %3, i8** noundef null), !dbg !126
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
  ASSUME(cdy[0] >= cw(0,3+0));
  ASSUME(cdy[0] >= cw(0,2+0));
  ASSUME(cdy[0] >= cw(0,4+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,3+0));
  ASSUME(cdy[0] >= cr(0,2+0));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[2]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0), metadata !167, metadata !DIExpression()), !dbg !224

  //   %4 = load atomic i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 0) seq_cst, align 8, !dbg !128
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

  //   call void @llvm.dbg.value(metadata i64 %4, metadata !169, metadata !DIExpression()), !dbg !224

  //   %conv = trunc i64 %4 to i32, !dbg !129

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !166, metadata !DIExpression()), !dbg !197

  //   %cmp = icmp eq i32 %conv, 1, !dbg !130

  //   %conv14 = zext i1 %cmp to i32, !dbg !130

  //   call void @llvm.dbg.value(metadata i32 %conv14, metadata !170, metadata !DIExpression()), !dbg !197

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 1), metadata !172, metadata !DIExpression()), !dbg !228

  //   %5 = load atomic i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @vars, i64 0, i64 1) seq_cst, align 8, !dbg !132
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
  creg_r8 = cr(0,0+1*1);
  crmax(0,0+1*1) = max(crmax(0,0+1*1),cr(0,0+1*1));
  caddr[0] = max(caddr[0],0);
  if(cr(0,0+1*1) < cw(0,0+1*1)) {
    r8 = buff(0,0+1*1);
  } else {
    if(pw(0,0+1*1) != co(0+1*1,cr(0,0+1*1))) {
      ASSUME(cr(0,0+1*1) >= old_cr);
    }
    pw(0,0+1*1) = co(0+1*1,cr(0,0+1*1));
    r8 = mem(0+1*1,cr(0,0+1*1));
  }
  ASSUME(creturn[0] >= cr(0,0+1*1));

  //   call void @llvm.dbg.value(metadata i64 %5, metadata !174, metadata !DIExpression()), !dbg !228

  //   %conv18 = trunc i64 %5 to i32, !dbg !133

  //   call void @llvm.dbg.value(metadata i32 %conv18, metadata !171, metadata !DIExpression()), !dbg !197

  //   %cmp19 = icmp eq i32 %conv18, 2, !dbg !134

  //   %conv20 = zext i1 %cmp19 to i32, !dbg !134

  //   call void @llvm.dbg.value(metadata i32 %conv20, metadata !175, metadata !DIExpression()), !dbg !197

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X5_2, metadata !177, metadata !DIExpression()), !dbg !232

  //   %6 = load atomic i64, i64* @atom_0_X5_2 seq_cst, align 8, !dbg !136
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

  //   call void @llvm.dbg.value(metadata i64 %6, metadata !179, metadata !DIExpression()), !dbg !232

  //   %conv24 = trunc i64 %6 to i32, !dbg !137

  //   call void @llvm.dbg.value(metadata i32 %conv24, metadata !176, metadata !DIExpression()), !dbg !197

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X2_1, metadata !181, metadata !DIExpression()), !dbg !235

  //   %7 = load atomic i64, i64* @atom_0_X2_1 seq_cst, align 8, !dbg !139
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

  //   call void @llvm.dbg.value(metadata i64 %7, metadata !183, metadata !DIExpression()), !dbg !235

  //   %conv28 = trunc i64 %7 to i32, !dbg !140

  //   call void @llvm.dbg.value(metadata i32 %conv28, metadata !180, metadata !DIExpression()), !dbg !197

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X2_2, metadata !185, metadata !DIExpression()), !dbg !238

  //   %8 = load atomic i64, i64* @atom_1_X2_2 seq_cst, align 8, !dbg !142
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

  //   call void @llvm.dbg.value(metadata i64 %8, metadata !187, metadata !DIExpression()), !dbg !238

  //   %conv32 = trunc i64 %8 to i32, !dbg !143

  //   call void @llvm.dbg.value(metadata i32 %conv32, metadata !184, metadata !DIExpression()), !dbg !197

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X3_0, metadata !189, metadata !DIExpression()), !dbg !241

  //   %9 = load atomic i64, i64* @atom_1_X3_0 seq_cst, align 8, !dbg !145
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

  //   call void @llvm.dbg.value(metadata i64 %9, metadata !191, metadata !DIExpression()), !dbg !241

  //   %conv36 = trunc i64 %9 to i32, !dbg !146

  //   call void @llvm.dbg.value(metadata i32 %conv36, metadata !188, metadata !DIExpression()), !dbg !197

  //   %and = and i32 %conv32, %conv36, !dbg !147
  creg_r13 = max(creg_r11,creg_r12);
  ASSUME(active[creg_r13] == 0);
  r13 = r11 & r12;

  //   call void @llvm.dbg.value(metadata i32 %and, metadata !192, metadata !DIExpression()), !dbg !197

  //   %and37 = and i32 %conv28, %and, !dbg !148
  creg_r14 = max(creg_r10,creg_r13);
  ASSUME(active[creg_r14] == 0);
  r14 = r10 & r13;

  //   call void @llvm.dbg.value(metadata i32 %and37, metadata !193, metadata !DIExpression()), !dbg !197

  //   %and38 = and i32 %conv24, %and37, !dbg !149
  creg_r15 = max(creg_r9,creg_r14);
  ASSUME(active[creg_r15] == 0);
  r15 = r9 & r14;

  //   call void @llvm.dbg.value(metadata i32 %and38, metadata !194, metadata !DIExpression()), !dbg !197

  //   %and39 = and i32 %conv20, %and38, !dbg !150
  creg_r16 = max(max(creg_r8,0),creg_r15);
  ASSUME(active[creg_r16] == 0);
  r16 = (r8==2) & r15;

  //   call void @llvm.dbg.value(metadata i32 %and39, metadata !195, metadata !DIExpression()), !dbg !197

  //   %and40 = and i32 %conv14, %and39, !dbg !151
  creg_r17 = max(max(creg_r7,0),creg_r16);
  ASSUME(active[creg_r17] == 0);
  r17 = (r7==1) & r16;

  //   call void @llvm.dbg.value(metadata i32 %and40, metadata !196, metadata !DIExpression()), !dbg !197

  //   %cmp41 = icmp eq i32 %and40, 1, !dbg !152

  //   br i1 %cmp41, label %if.then, label %if.end, !dbg !154
  old_cctrl = cctrl[0];
  cctrl[0] = get_rng(0,NCONTEXT-1);
  ASSUME(cctrl[0] >= old_cctrl);
  ASSUME(cctrl[0] >= creg_r17);
  ASSUME(cctrl[0] >= 0);
  if((r17==1)) {
    goto T0BLOCK1;
  } else {
    goto T0BLOCK2;
  }

T0BLOCK1:
  //   call void @__assert_fail(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([111 x i8], [111 x i8]* @.str.1, i64 0, i64 0), i32 noundef 78, i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #8, !dbg !155

  //   unreachable, !dbg !155
  r18 = 1;

T0BLOCK2:
  //   %10 = bitcast i64* %thr1 to i8*, !dbg !158

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %10) #7, !dbg !158

  //   %11 = bitcast i64* %thr0 to i8*, !dbg !158

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %11) #7, !dbg !158

  //   ret i32 0, !dbg !159
  ret_thread_0 = 0;



  ASSERT(r18== 0);

}
