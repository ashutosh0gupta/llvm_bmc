// Global variabls:
// 0:vars:1
// 1:atom_0_X0_2:1
// Local global variabls:
// 0:thr0:1
// 1:thr1:1
#define ADDRSIZE 2
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
  mem(1+0,0) = 0;
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
  // Dumping thread 1
  int ret_thread_1 = 0;
  cdy[1] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[1] >= cstart[1]);
T1BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !34, metadata !DIExpression()), !dbg !45

  //   br label %label_1, !dbg !46
  goto T1BLOCK1;

T1BLOCK1:
  //   call void @llvm.dbg.label(metadata !44), !dbg !47

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([1 x i64], [1 x i64]* @vars, i64 0, i64 0), metadata !36, metadata !DIExpression()), !dbg !48

  //   %0 = load atomic i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !49
  // LD: Guess
  old_cr = cr(1,0);
  cr(1,0) = get_rng(0,NCONTEXT-1);// 1 ASSIGN LDCOM _l19_c15
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

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !39, metadata !DIExpression()), !dbg !48

  //   %conv = trunc i64 %0 to i32, !dbg !50

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !35, metadata !DIExpression()), !dbg !45

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([1 x i64], [1 x i64]* @vars, i64 0, i64 0), metadata !40, metadata !DIExpression()), !dbg !51

  //   call void @llvm.dbg.value(metadata i64 1, metadata !42, metadata !DIExpression()), !dbg !51

  //   store atomic i64 1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !52
  // ST: Guess
  iw(1,0) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW _l20_c3
  old_cw = cw(1,0);
  cw(1,0) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM _l20_c3
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

  //   %cmp = icmp eq i32 %conv, 2, !dbg !53
  creg__r0__2_ = max(0,creg_r0);

  //   %conv1 = zext i1 %cmp to i32, !dbg !53

  //   call void @llvm.dbg.value(metadata i32 %conv1, metadata !43, metadata !DIExpression()), !dbg !45

  //   store i32 %conv1, i32* @atom_0_X0_2, align 4, !dbg !54, !tbaa !55
  // ST: Guess
  iw(1,1) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW _l22_c15
  old_cw = cw(1,1);
  cw(1,1) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM _l22_c15
  // Check
  ASSUME(active[iw(1,1)] == 1);
  ASSUME(active[cw(1,1)] == 1);
  ASSUME(sforbid(1,cw(1,1))== 0);
  ASSUME(iw(1,1) >= creg__r0__2_);
  ASSUME(iw(1,1) >= 0);
  ASSUME(cw(1,1) >= iw(1,1));
  ASSUME(cw(1,1) >= old_cw);
  ASSUME(cw(1,1) >= cr(1,1));
  ASSUME(cw(1,1) >= cl[1]);
  ASSUME(cw(1,1) >= cisb[1]);
  ASSUME(cw(1,1) >= cdy[1]);
  ASSUME(cw(1,1) >= cdl[1]);
  ASSUME(cw(1,1) >= cds[1]);
  ASSUME(cw(1,1) >= cctrl[1]);
  ASSUME(cw(1,1) >= caddr[1]);
  // Update
  caddr[1] = max(caddr[1],0);
  buff(1,1) = (r0==2);
  mem(1,cw(1,1)) = (r0==2);
  co(1,cw(1,1))+=1;
  delta(1,cw(1,1)) = -1;
  ASSUME(creturn[1] >= cw(1,1));

  //   ret i8* null, !dbg !59
  ret_thread_1 = (- 1);
  goto T1BLOCK_END;

T1BLOCK_END:

  // Dumping thread 2
  int ret_thread_2 = 0;
  cdy[2] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[2] >= cstart[2]);
T2BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !62, metadata !DIExpression()), !dbg !67

  //   br label %label_2, !dbg !41
  goto T2BLOCK1;

T2BLOCK1:
  //   call void @llvm.dbg.label(metadata !66), !dbg !69

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([1 x i64], [1 x i64]* @vars, i64 0, i64 0), metadata !63, metadata !DIExpression()), !dbg !70

  //   call void @llvm.dbg.value(metadata i64 2, metadata !65, metadata !DIExpression()), !dbg !70

  //   store atomic i64 2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !44
  // ST: Guess
  iw(2,0) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW _l28_c3
  old_cw = cw(2,0);
  cw(2,0) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM _l28_c3
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

  //   ret i8* null, !dbg !45
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

  //   call void @llvm.dbg.value(metadata i32 %argc, metadata !80, metadata !DIExpression()), !dbg !101

  //   call void @llvm.dbg.value(metadata i8** %argv, metadata !81, metadata !DIExpression()), !dbg !101

  //   %0 = bitcast i64* %thr0 to i8*, !dbg !60

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #7, !dbg !60

  //   call void @llvm.dbg.declare(metadata i64* %thr0, metadata !82, metadata !DIExpression()), !dbg !103

  //   %1 = bitcast i64* %thr1 to i8*, !dbg !62

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #7, !dbg !62

  //   call void @llvm.dbg.declare(metadata i64* %thr1, metadata !86, metadata !DIExpression()), !dbg !105

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([1 x i64], [1 x i64]* @vars, i64 0, i64 0), metadata !87, metadata !DIExpression()), !dbg !106

  //   call void @llvm.dbg.value(metadata i64 0, metadata !89, metadata !DIExpression()), !dbg !106

  //   store atomic i64 0, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !65
  // ST: Guess
  iw(0,0) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l36_c3
  old_cw = cw(0,0);
  cw(0,0) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l36_c3
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

  //   call void @llvm.dbg.value(metadata i32* @atom_0_X0_2, metadata !90, metadata !DIExpression()), !dbg !108

  //   call void @llvm.dbg.value(metadata i32 0, metadata !93, metadata !DIExpression()), !dbg !108

  //   store atomic i32 0, i32* @atom_0_X0_2 monotonic, align 4, !dbg !67
  // ST: Guess
  iw(0,1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l37_c3
  old_cw = cw(0,1);
  cw(0,1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l37_c3
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

  //   %call = call i32 @pthread_create(i64* noundef %thr0, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t0, i8* noundef null) #7, !dbg !68
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
  ASSUME(cdy[0] >= cw(0,1+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,1+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[1] >= cdy[0]);

  //   %call3 = call i32 @pthread_create(i64* noundef %thr1, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t1, i8* noundef null) #7, !dbg !69
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
  ASSUME(cdy[0] >= cw(0,1+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,1+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[2] >= cdy[0]);

  //   %2 = load i64, i64* %thr0, align 8, !dbg !70, !tbaa !71
  r2 = local_mem[0];

  //   %call4 = call i32 @pthread_join(i64 noundef %2, i8** noundef null), !dbg !75
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
  ASSUME(cdy[0] >= cw(0,1+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,1+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[1]);

  //   %3 = load i64, i64* %thr1, align 8, !dbg !76, !tbaa !71
  r3 = local_mem[1];

  //   %call5 = call i32 @pthread_join(i64 noundef %3, i8** noundef null), !dbg !77
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
  ASSUME(cdy[0] >= cw(0,1+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,1+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[2]);

  //   %4 = load i32, i32* @atom_0_X0_2, align 4, !dbg !78, !tbaa !79
  // LD: Guess
  old_cr = cr(0,1);
  cr(0,1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l45_c12
  // Check
  ASSUME(active[cr(0,1)] == 0);
  ASSUME(cr(0,1) >= iw(0,1));
  ASSUME(cr(0,1) >= 0);
  ASSUME(cr(0,1) >= cdy[0]);
  ASSUME(cr(0,1) >= cisb[0]);
  ASSUME(cr(0,1) >= cdl[0]);
  ASSUME(cr(0,1) >= cl[0]);
  // Update
  creg_r4 = cr(0,1);
  crmax(0,1) = max(crmax(0,1),cr(0,1));
  caddr[0] = max(caddr[0],0);
  if(cr(0,1) < cw(0,1)) {
    r4 = buff(0,1);
    ASSUME((!(( (cw(0,1) < 1) && (1 < crmax(0,1)) )))||(sforbid(1,1)> 0));
    ASSUME((!(( (cw(0,1) < 2) && (2 < crmax(0,1)) )))||(sforbid(1,2)> 0));
    ASSUME((!(( (cw(0,1) < 3) && (3 < crmax(0,1)) )))||(sforbid(1,3)> 0));
    ASSUME((!(( (cw(0,1) < 4) && (4 < crmax(0,1)) )))||(sforbid(1,4)> 0));
    ASSUME((!(( (cw(0,1) < 5) && (5 < crmax(0,1)) )))||(sforbid(1,5)> 0));
    ASSUME((!(( (cw(0,1) < 6) && (6 < crmax(0,1)) )))||(sforbid(1,6)> 0));
    ASSUME((!(( (cw(0,1) < 7) && (7 < crmax(0,1)) )))||(sforbid(1,7)> 0));
    ASSUME((!(( (cw(0,1) < 8) && (8 < crmax(0,1)) )))||(sforbid(1,8)> 0));
    ASSUME((!(( (cw(0,1) < 9) && (9 < crmax(0,1)) )))||(sforbid(1,9)> 0));
  } else {
    if(pw(0,1) != co(1,cr(0,1))) {
      ASSUME(cr(0,1) >= old_cr);
    }
    pw(0,1) = co(1,cr(0,1));
    r4 = mem(1,cr(0,1));
  }
  ASSUME(creturn[0] >= cr(0,1));

  //   call void @llvm.dbg.value(metadata i32 %4, metadata !94, metadata !DIExpression()), !dbg !101

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([1 x i64], [1 x i64]* @vars, i64 0, i64 0), metadata !96, metadata !DIExpression()), !dbg !119

  //   %5 = load atomic i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !82
  // LD: Guess
  old_cr = cr(0,0);
  cr(0,0) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l46_c12
  // Check
  ASSUME(active[cr(0,0)] == 0);
  ASSUME(cr(0,0) >= iw(0,0));
  ASSUME(cr(0,0) >= 0);
  ASSUME(cr(0,0) >= cdy[0]);
  ASSUME(cr(0,0) >= cisb[0]);
  ASSUME(cr(0,0) >= cdl[0]);
  ASSUME(cr(0,0) >= cl[0]);
  // Update
  creg_r5 = cr(0,0);
  crmax(0,0) = max(crmax(0,0),cr(0,0));
  caddr[0] = max(caddr[0],0);
  if(cr(0,0) < cw(0,0)) {
    r5 = buff(0,0);
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
    r5 = mem(0,cr(0,0));
  }
  ASSUME(creturn[0] >= cr(0,0));

  //   call void @llvm.dbg.value(metadata i64 %5, metadata !98, metadata !DIExpression()), !dbg !119

  //   %conv = trunc i64 %5 to i32, !dbg !83

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !95, metadata !DIExpression()), !dbg !101

  //   %cmp = icmp eq i32 %conv, 2, !dbg !84
  creg__r5__2_ = max(0,creg_r5);

  //   %conv6 = zext i1 %cmp to i32, !dbg !84

  //   call void @llvm.dbg.value(metadata i32 %conv6, metadata !99, metadata !DIExpression()), !dbg !101

  //   %and = and i32 %4, %conv6, !dbg !85
  creg_r6 = max(creg__r5__2_,creg_r4);
  r6 = r4 & (r5==2);

  //   call void @llvm.dbg.value(metadata i32 %and, metadata !100, metadata !DIExpression()), !dbg !101

  //   %cmp7 = icmp eq i32 %and, 1, !dbg !86
  creg__r6__1_ = max(0,creg_r6);

  //   br i1 %cmp7, label %if.then, label %if.end, !dbg !88
  old_cctrl = cctrl[0];
  cctrl[0] = get_rng(0,NCONTEXT-1);
  ASSUME(cctrl[0] >= old_cctrl);
  ASSUME(cctrl[0] >= creg__r6__1_);
  if((r6==1)) {
    goto T0BLOCK1;
  } else {
    goto T0BLOCK2;
  }

T0BLOCK1:
  //   call void @__assert_fail(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([94 x i8], [94 x i8]* @.str.1, i64 0, i64 0), i32 noundef 49, i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #8, !dbg !89

  //   unreachable, !dbg !89
  r7 = 1;
  goto T0BLOCK_END;

T0BLOCK2:
  //   %6 = bitcast i64* %thr1 to i8*, !dbg !92

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %6) #7, !dbg !92

  //   %7 = bitcast i64* %thr0 to i8*, !dbg !92

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %7) #7, !dbg !92

  //   ret i32 0, !dbg !93
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

  ASSERT(r7== 0);

}
