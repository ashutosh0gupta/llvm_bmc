// 0:vars:4
// 4:atom_1_X2_2:1
// 5:thr0:1
// 6:thr1:1
#define ADDRSIZE 7
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
  // Dumping thread 1
  int ret_thread_1 = 0;
  cdy[1] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[1] >= cstart[1]);
T1BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !33, metadata !DIExpression()), !dbg !42

  //   br label %label_1, !dbg !43
  goto T1BLOCK1;

T1BLOCK1:
  //   call void @llvm.dbg.label(metadata !41), !dbg !44

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 0), metadata !34, metadata !DIExpression()), !dbg !45

  //   call void @llvm.dbg.value(metadata i64 2, metadata !37, metadata !DIExpression()), !dbg !45

  //   store atomic i64 2, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !46
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
  buff(1,0) = 2;
  mem(0,cw(1,0)) = 2;
  co(0,cw(1,0))+=1;
  delta(0,cw(1,0)) = -1;
  ASSUME(creturn[1] >= cw(1,0));

  //   call void (...) @dmbsy(), !dbg !47
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
  ASSUME(cdy[1] >= cr(1,0+0));
  ASSUME(cdy[1] >= cr(1,0+1));
  ASSUME(cdy[1] >= cr(1,0+2));
  ASSUME(cdy[1] >= cr(1,0+3));
  ASSUME(cdy[1] >= cr(1,4+0));
  ASSUME(cdy[1] >= cr(1,5+0));
  ASSUME(cdy[1] >= cr(1,6+0));
  ASSUME(creturn[1] >= cdy[1]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 1), metadata !38, metadata !DIExpression()), !dbg !48

  //   call void @llvm.dbg.value(metadata i64 1, metadata !40, metadata !DIExpression()), !dbg !48

  //   store atomic i64 1, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !49
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

  //   ret i8* null, !dbg !50
  ret_thread_1 = (- 1);


  // Dumping thread 2
  int ret_thread_2 = 0;
  cdy[2] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[2] >= cstart[2]);
T2BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !53, metadata !DIExpression()), !dbg !81

  //   br label %label_2, !dbg !63
  goto T2BLOCK1;

T2BLOCK1:
  //   call void @llvm.dbg.label(metadata !78), !dbg !83

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 1), metadata !54, metadata !DIExpression()), !dbg !84

  //   call void @llvm.dbg.value(metadata i64 2, metadata !56, metadata !DIExpression()), !dbg !84

  //   store atomic i64 2, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !66
  // ST: Guess
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
  // Update
  caddr[2] = max(caddr[2],0);
  buff(2,0+1*1) = 2;
  mem(0+1*1,cw(2,0+1*1)) = 2;
  co(0+1*1,cw(2,0+1*1))+=1;
  delta(0+1*1,cw(2,0+1*1)) = -1;
  ASSUME(creturn[2] >= cw(2,0+1*1));

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 1), metadata !59, metadata !DIExpression()), !dbg !86

  //   %0 = load atomic i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !68
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

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !61, metadata !DIExpression()), !dbg !86

  //   %conv = trunc i64 %0 to i32, !dbg !69

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !57, metadata !DIExpression()), !dbg !81

  //   %xor = xor i32 %conv, %conv, !dbg !70
  creg_r1 = max(creg_r0,creg_r0);
  ASSUME(active[creg_r1] == 2);
  r1 = r0 ^ r0;

  //   call void @llvm.dbg.value(metadata i32 %xor, metadata !62, metadata !DIExpression()), !dbg !81

  //   %add = add nsw i32 2, %xor, !dbg !71
  creg_r2 = max(0,creg_r1);
  ASSUME(active[creg_r2] == 2);
  r2 = 2 + r1;

  //   %idxprom = sext i32 %add to i64, !dbg !71

  //   %arrayidx = getelementptr inbounds [4 x i64], [4 x i64]* @vars, i64 0, i64 %idxprom, !dbg !71
  r3 = 0+r2*1;
  ASSUME(creg_r3 >= 0);
  ASSUME(creg_r3 >= creg_r2);
  ASSUME(active[creg_r3] == 2);

  //   call void @llvm.dbg.value(metadata i64* %arrayidx, metadata !64, metadata !DIExpression()), !dbg !91

  //   %1 = load atomic i64, i64* %arrayidx monotonic, align 8, !dbg !71
  // LD: Guess
  old_cr = cr(2,r3);
  cr(2,r3) = get_rng(0,NCONTEXT-1);// 2 ASSIGN LDCOM 
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

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !66, metadata !DIExpression()), !dbg !91

  //   %conv4 = trunc i64 %1 to i32, !dbg !73

  //   call void @llvm.dbg.value(metadata i32 %conv4, metadata !63, metadata !DIExpression()), !dbg !81

  //   %tobool = icmp ne i32 %conv4, 0, !dbg !74

  //   br i1 %tobool, label %if.then, label %if.else, !dbg !76
  old_cctrl = cctrl[2];
  cctrl[2] = get_rng(0,NCONTEXT-1);
  ASSUME(cctrl[2] >= old_cctrl);
  ASSUME(cctrl[2] >= creg_r4);
  ASSUME(cctrl[2] >= 0);
  if((r4!=0)) {
    goto T2BLOCK2;
  } else {
    goto T2BLOCK3;
  }

T2BLOCK2:
  //   br label %lbl_LC00, !dbg !77
  goto T2BLOCK4;

T2BLOCK3:
  //   br label %lbl_LC00, !dbg !78
  goto T2BLOCK4;

T2BLOCK4:
  //   call void @llvm.dbg.label(metadata !79), !dbg !98

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 3), metadata !68, metadata !DIExpression()), !dbg !99

  //   %2 = load atomic i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !81
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
  creg_r5 = cr(2,0+3*1);
  crmax(2,0+3*1) = max(crmax(2,0+3*1),cr(2,0+3*1));
  caddr[2] = max(caddr[2],0);
  if(cr(2,0+3*1) < cw(2,0+3*1)) {
    r5 = buff(2,0+3*1);
    ASSUME((!(( (cw(2,0+3*1) < 1) && (1 < crmax(2,0+3*1)) )))||(sforbid(0+3*1,1)> 0));
    ASSUME((!(( (cw(2,0+3*1) < 2) && (2 < crmax(2,0+3*1)) )))||(sforbid(0+3*1,2)> 0));
    ASSUME((!(( (cw(2,0+3*1) < 3) && (3 < crmax(2,0+3*1)) )))||(sforbid(0+3*1,3)> 0));
    ASSUME((!(( (cw(2,0+3*1) < 4) && (4 < crmax(2,0+3*1)) )))||(sforbid(0+3*1,4)> 0));
  } else {
    if(pw(2,0+3*1) != co(0+3*1,cr(2,0+3*1))) {
      ASSUME(cr(2,0+3*1) >= old_cr);
    }
    pw(2,0+3*1) = co(0+3*1,cr(2,0+3*1));
    r5 = mem(0+3*1,cr(2,0+3*1));
  }
  ASSUME(creturn[2] >= cr(2,0+3*1));

  //   call void @llvm.dbg.value(metadata i64 %2, metadata !70, metadata !DIExpression()), !dbg !99

  //   %conv8 = trunc i64 %2 to i32, !dbg !82

  //   call void @llvm.dbg.value(metadata i32 %conv8, metadata !67, metadata !DIExpression()), !dbg !81

  //   %tobool9 = icmp ne i32 %conv8, 0, !dbg !83

  //   br i1 %tobool9, label %if.then10, label %if.else11, !dbg !85
  old_cctrl = cctrl[2];
  cctrl[2] = get_rng(0,NCONTEXT-1);
  ASSUME(cctrl[2] >= old_cctrl);
  ASSUME(cctrl[2] >= creg_r5);
  ASSUME(cctrl[2] >= 0);
  if((r5!=0)) {
    goto T2BLOCK5;
  } else {
    goto T2BLOCK6;
  }

T2BLOCK5:
  //   br label %lbl_LC01, !dbg !86
  goto T2BLOCK7;

T2BLOCK6:
  //   br label %lbl_LC01, !dbg !87
  goto T2BLOCK7;

T2BLOCK7:
  //   call void @llvm.dbg.label(metadata !80), !dbg !107

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 0), metadata !71, metadata !DIExpression()), !dbg !108

  //   call void @llvm.dbg.value(metadata i64 1, metadata !73, metadata !DIExpression()), !dbg !108

  //   store atomic i64 1, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !90
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
  buff(2,0) = 1;
  mem(0,cw(2,0)) = 1;
  co(0,cw(2,0))+=1;
  delta(0,cw(2,0)) = -1;
  ASSUME(creturn[2] >= cw(2,0));

  //   %cmp = icmp eq i32 %conv, 2, !dbg !91

  //   %conv14 = zext i1 %cmp to i32, !dbg !91

  //   call void @llvm.dbg.value(metadata i32 %conv14, metadata !74, metadata !DIExpression()), !dbg !81

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X2_2, metadata !75, metadata !DIExpression()), !dbg !111

  //   %3 = zext i32 %conv14 to i64

  //   call void @llvm.dbg.value(metadata i64 %3, metadata !77, metadata !DIExpression()), !dbg !111

  //   store atomic i64 %3, i64* @atom_1_X2_2 seq_cst, align 8, !dbg !93
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
  buff(2,4) = (r0==2);
  mem(4,cw(2,4)) = (r0==2);
  co(4,cw(2,4))+=1;
  delta(4,cw(2,4)) = -1;
  ASSUME(creturn[2] >= cw(2,4));

  //   ret i8* null, !dbg !94
  ret_thread_2 = (- 1);


  // Dumping thread 0
  int ret_thread_0 = 0;
  cdy[0] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[0] >= cstart[0]);
T0BLOCK0:
  //   %thr0 = alloca i64, align 8

  //   %thr1 = alloca i64, align 8

  //   call void @llvm.dbg.value(metadata i32 %argc, metadata !121, metadata !DIExpression()), !dbg !159

  //   call void @llvm.dbg.value(metadata i8** %argv, metadata !122, metadata !DIExpression()), !dbg !159

  //   %0 = bitcast i64* %thr0 to i8*, !dbg !77

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #7, !dbg !77

  //   call void @llvm.dbg.declare(metadata i64* %thr0, metadata !123, metadata !DIExpression()), !dbg !161

  //   %1 = bitcast i64* %thr1 to i8*, !dbg !79

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #7, !dbg !79

  //   call void @llvm.dbg.declare(metadata i64* %thr1, metadata !127, metadata !DIExpression()), !dbg !163

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 3), metadata !128, metadata !DIExpression()), !dbg !164

  //   call void @llvm.dbg.value(metadata i64 0, metadata !130, metadata !DIExpression()), !dbg !164

  //   store atomic i64 0, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !82
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 2), metadata !131, metadata !DIExpression()), !dbg !166

  //   call void @llvm.dbg.value(metadata i64 0, metadata !133, metadata !DIExpression()), !dbg !166

  //   store atomic i64 0, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 2) monotonic, align 8, !dbg !84
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 1), metadata !134, metadata !DIExpression()), !dbg !168

  //   call void @llvm.dbg.value(metadata i64 0, metadata !136, metadata !DIExpression()), !dbg !168

  //   store atomic i64 0, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !86
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 0), metadata !137, metadata !DIExpression()), !dbg !170

  //   call void @llvm.dbg.value(metadata i64 0, metadata !139, metadata !DIExpression()), !dbg !170

  //   store atomic i64 0, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !88
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

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X2_2, metadata !140, metadata !DIExpression()), !dbg !172

  //   call void @llvm.dbg.value(metadata i64 0, metadata !142, metadata !DIExpression()), !dbg !172

  //   store atomic i64 0, i64* @atom_1_X2_2 monotonic, align 8, !dbg !90
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
  ASSUME(cdy[0] >= cw(0,0+2));
  ASSUME(cdy[0] >= cw(0,0+3));
  ASSUME(cdy[0] >= cw(0,4+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,6+0));
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
  ASSUME(cdy[0] >= cw(0,0+2));
  ASSUME(cdy[0] >= cw(0,0+3));
  ASSUME(cdy[0] >= cw(0,4+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[2] >= cdy[0]);

  //   %2 = load i64, i64* %thr0, align 8, !dbg !93, !tbaa !94
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
  creg_r7 = cr(0,5);
  crmax(0,5) = max(crmax(0,5),cr(0,5));
  caddr[0] = max(caddr[0],0);
  if(cr(0,5) < cw(0,5)) {
    r7 = buff(0,5);
    ASSUME((!(( (cw(0,5) < 1) && (1 < crmax(0,5)) )))||(sforbid(5,1)> 0));
    ASSUME((!(( (cw(0,5) < 2) && (2 < crmax(0,5)) )))||(sforbid(5,2)> 0));
    ASSUME((!(( (cw(0,5) < 3) && (3 < crmax(0,5)) )))||(sforbid(5,3)> 0));
    ASSUME((!(( (cw(0,5) < 4) && (4 < crmax(0,5)) )))||(sforbid(5,4)> 0));
  } else {
    if(pw(0,5) != co(5,cr(0,5))) {
      ASSUME(cr(0,5) >= old_cr);
    }
    pw(0,5) = co(5,cr(0,5));
    r7 = mem(5,cr(0,5));
  }
  ASSUME(creturn[0] >= cr(0,5));

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
  ASSUME(cdy[0] >= cw(0,0+2));
  ASSUME(cdy[0] >= cw(0,0+3));
  ASSUME(cdy[0] >= cw(0,4+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[1]);

  //   %3 = load i64, i64* %thr1, align 8, !dbg !99, !tbaa !94
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
  creg_r8 = cr(0,6);
  crmax(0,6) = max(crmax(0,6),cr(0,6));
  caddr[0] = max(caddr[0],0);
  if(cr(0,6) < cw(0,6)) {
    r8 = buff(0,6);
    ASSUME((!(( (cw(0,6) < 1) && (1 < crmax(0,6)) )))||(sforbid(6,1)> 0));
    ASSUME((!(( (cw(0,6) < 2) && (2 < crmax(0,6)) )))||(sforbid(6,2)> 0));
    ASSUME((!(( (cw(0,6) < 3) && (3 < crmax(0,6)) )))||(sforbid(6,3)> 0));
    ASSUME((!(( (cw(0,6) < 4) && (4 < crmax(0,6)) )))||(sforbid(6,4)> 0));
  } else {
    if(pw(0,6) != co(6,cr(0,6))) {
      ASSUME(cr(0,6) >= old_cr);
    }
    pw(0,6) = co(6,cr(0,6));
    r8 = mem(6,cr(0,6));
  }
  ASSUME(creturn[0] >= cr(0,6));

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
  ASSUME(cdy[0] >= cw(0,0+2));
  ASSUME(cdy[0] >= cw(0,0+3));
  ASSUME(cdy[0] >= cw(0,4+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[2]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 0), metadata !144, metadata !DIExpression()), !dbg !184

  //   %4 = load atomic i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 0) seq_cst, align 8, !dbg !102
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
  creg_r9 = cr(0,0);
  crmax(0,0) = max(crmax(0,0),cr(0,0));
  caddr[0] = max(caddr[0],0);
  if(cr(0,0) < cw(0,0)) {
    r9 = buff(0,0);
    ASSUME((!(( (cw(0,0) < 1) && (1 < crmax(0,0)) )))||(sforbid(0,1)> 0));
    ASSUME((!(( (cw(0,0) < 2) && (2 < crmax(0,0)) )))||(sforbid(0,2)> 0));
    ASSUME((!(( (cw(0,0) < 3) && (3 < crmax(0,0)) )))||(sforbid(0,3)> 0));
    ASSUME((!(( (cw(0,0) < 4) && (4 < crmax(0,0)) )))||(sforbid(0,4)> 0));
  } else {
    if(pw(0,0) != co(0,cr(0,0))) {
      ASSUME(cr(0,0) >= old_cr);
    }
    pw(0,0) = co(0,cr(0,0));
    r9 = mem(0,cr(0,0));
  }
  ASSUME(creturn[0] >= cr(0,0));

  //   call void @llvm.dbg.value(metadata i64 %4, metadata !146, metadata !DIExpression()), !dbg !184

  //   %conv = trunc i64 %4 to i32, !dbg !103

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !143, metadata !DIExpression()), !dbg !159

  //   %cmp = icmp eq i32 %conv, 2, !dbg !104

  //   %conv12 = zext i1 %cmp to i32, !dbg !104

  //   call void @llvm.dbg.value(metadata i32 %conv12, metadata !147, metadata !DIExpression()), !dbg !159

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 1), metadata !149, metadata !DIExpression()), !dbg !188

  //   %5 = load atomic i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 1) seq_cst, align 8, !dbg !106
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
  creg_r10 = cr(0,0+1*1);
  crmax(0,0+1*1) = max(crmax(0,0+1*1),cr(0,0+1*1));
  caddr[0] = max(caddr[0],0);
  if(cr(0,0+1*1) < cw(0,0+1*1)) {
    r10 = buff(0,0+1*1);
    ASSUME((!(( (cw(0,0+1*1) < 1) && (1 < crmax(0,0+1*1)) )))||(sforbid(0+1*1,1)> 0));
    ASSUME((!(( (cw(0,0+1*1) < 2) && (2 < crmax(0,0+1*1)) )))||(sforbid(0+1*1,2)> 0));
    ASSUME((!(( (cw(0,0+1*1) < 3) && (3 < crmax(0,0+1*1)) )))||(sforbid(0+1*1,3)> 0));
    ASSUME((!(( (cw(0,0+1*1) < 4) && (4 < crmax(0,0+1*1)) )))||(sforbid(0+1*1,4)> 0));
  } else {
    if(pw(0,0+1*1) != co(0+1*1,cr(0,0+1*1))) {
      ASSUME(cr(0,0+1*1) >= old_cr);
    }
    pw(0,0+1*1) = co(0+1*1,cr(0,0+1*1));
    r10 = mem(0+1*1,cr(0,0+1*1));
  }
  ASSUME(creturn[0] >= cr(0,0+1*1));

  //   call void @llvm.dbg.value(metadata i64 %5, metadata !151, metadata !DIExpression()), !dbg !188

  //   %conv16 = trunc i64 %5 to i32, !dbg !107

  //   call void @llvm.dbg.value(metadata i32 %conv16, metadata !148, metadata !DIExpression()), !dbg !159

  //   %cmp17 = icmp eq i32 %conv16, 2, !dbg !108

  //   %conv18 = zext i1 %cmp17 to i32, !dbg !108

  //   call void @llvm.dbg.value(metadata i32 %conv18, metadata !152, metadata !DIExpression()), !dbg !159

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X2_2, metadata !154, metadata !DIExpression()), !dbg !192

  //   %6 = load atomic i64, i64* @atom_1_X2_2 seq_cst, align 8, !dbg !110
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

  //   call void @llvm.dbg.value(metadata i64 %6, metadata !156, metadata !DIExpression()), !dbg !192

  //   %conv22 = trunc i64 %6 to i32, !dbg !111

  //   call void @llvm.dbg.value(metadata i32 %conv22, metadata !153, metadata !DIExpression()), !dbg !159

  //   %and = and i32 %conv18, %conv22, !dbg !112
  creg_r12 = max(max(creg_r10,0),creg_r11);
  ASSUME(active[creg_r12] == 0);
  r12 = (r10==2) & r11;

  //   call void @llvm.dbg.value(metadata i32 %and, metadata !157, metadata !DIExpression()), !dbg !159

  //   %and23 = and i32 %conv12, %and, !dbg !113
  creg_r13 = max(max(creg_r9,0),creg_r12);
  ASSUME(active[creg_r13] == 0);
  r13 = (r9==2) & r12;

  //   call void @llvm.dbg.value(metadata i32 %and23, metadata !158, metadata !DIExpression()), !dbg !159

  //   %cmp24 = icmp eq i32 %and23, 1, !dbg !114

  //   br i1 %cmp24, label %if.then, label %if.end, !dbg !116
  old_cctrl = cctrl[0];
  cctrl[0] = get_rng(0,NCONTEXT-1);
  ASSUME(cctrl[0] >= old_cctrl);
  ASSUME(cctrl[0] >= creg_r13);
  ASSUME(cctrl[0] >= 0);
  if((r13==1)) {
    goto T0BLOCK1;
  } else {
    goto T0BLOCK2;
  }

T0BLOCK1:
  //   call void @__assert_fail(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([115 x i8], [115 x i8]* @.str.1, i64 0, i64 0), i32 noundef 65, i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #8, !dbg !117

  //   unreachable, !dbg !117
  r14 = 1;

T0BLOCK2:
  //   %7 = bitcast i64* %thr1 to i8*, !dbg !120

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %7) #7, !dbg !120

  //   %8 = bitcast i64* %thr0 to i8*, !dbg !120

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %8) #7, !dbg !120

  //   ret i32 0, !dbg !121
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

  ASSERT(r14== 0);

}
