// Global variabls:
// 0:vars:4
// 4:atom_0_X2_1:1
// 5:atom_1_X2_0:1
// Local global variabls:
// 0:thr0:1
// 1:thr1:1
#define ADDRSIZE 6
#define LOCALADDRSIZE 2
#define NTHREAD 3
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
  char creg__r0__0_;
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
  char creg__r0__1_;
  int r9= 0;
  char creg_r9;
  char creg__r9__0_;
  int r10= 0;
  char creg_r10;
  int r11= 0;
  char creg_r11;
  int r12= 0;
  char creg_r12;
  int r13= 0;
  char creg_r13;
  char creg__r13__2_;
  int r14= 0;
  char creg_r14;
  char creg__r14__1_;
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
  char creg__r19__1_;
  int r20= 0;
  char creg_r20;
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
  // Dumping initializations
  mem(0+0,0) = 0;
  mem(0+1,0) = 0;
  mem(0+2,0) = 0;
  mem(0+3,0) = 0;
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
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !36, metadata !DIExpression()), !dbg !61

  //   br label %label_1, !dbg !62
  goto T1BLOCK1;

T1BLOCK1:
  //   call void @llvm.dbg.label(metadata !59), !dbg !63

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 0), metadata !37, metadata !DIExpression()), !dbg !64

  //   call void @llvm.dbg.value(metadata i64 1, metadata !40, metadata !DIExpression()), !dbg !64

  //   store atomic i64 1, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !65
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 0), metadata !42, metadata !DIExpression()), !dbg !66

  //   %0 = load atomic i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !67
  // LD: Guess
  old_cr = cr(1,0);
  cr(1,0) = get_rng(0,NCONTEXT-1);// 1 ASSIGN LDCOM _l21_c15
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
  } else {
    if(pw(1,0) != co(0,cr(1,0))) {
      ASSUME(cr(1,0) >= old_cr);
    }
    pw(1,0) = co(0,cr(1,0));
    r0 = mem(0,cr(1,0));
  }
  ASSUME(creturn[1] >= cr(1,0));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !44, metadata !DIExpression()), !dbg !66

  //   %conv = trunc i64 %0 to i32, !dbg !68

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !41, metadata !DIExpression()), !dbg !61

  //   %tobool = icmp ne i32 %conv, 0, !dbg !69
  creg__r0__0_ = max(0,creg_r0);

  //   br i1 %tobool, label %if.then, label %if.else, !dbg !71
  old_cctrl = cctrl[1];
  cctrl[1] = get_rng(0,NCONTEXT-1);
  ASSUME(cctrl[1] >= old_cctrl);
  ASSUME(cctrl[1] >= creg__r0__0_);
  if((r0!=0)) {
    goto T1BLOCK2;
  } else {
    goto T1BLOCK3;
  }

T1BLOCK2:
  //   br label %lbl_LC00, !dbg !72
  goto T1BLOCK4;

T1BLOCK3:
  //   br label %lbl_LC00, !dbg !73
  goto T1BLOCK4;

T1BLOCK4:
  //   call void @llvm.dbg.label(metadata !60), !dbg !74

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 1), metadata !46, metadata !DIExpression()), !dbg !75

  //   %1 = load atomic i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !76
  // LD: Guess
  old_cr = cr(1,0+1*1);
  cr(1,0+1*1) = get_rng(0,NCONTEXT-1);// 1 ASSIGN LDCOM _l24_c15
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
    ASSUME((!(( (cw(1,0+1*1) < 1) && (1 < crmax(1,0+1*1)) )))||(sforbid(0+1*1,1)> 0));
    ASSUME((!(( (cw(1,0+1*1) < 2) && (2 < crmax(1,0+1*1)) )))||(sforbid(0+1*1,2)> 0));
    ASSUME((!(( (cw(1,0+1*1) < 3) && (3 < crmax(1,0+1*1)) )))||(sforbid(0+1*1,3)> 0));
    ASSUME((!(( (cw(1,0+1*1) < 4) && (4 < crmax(1,0+1*1)) )))||(sforbid(0+1*1,4)> 0));
  } else {
    if(pw(1,0+1*1) != co(0+1*1,cr(1,0+1*1))) {
      ASSUME(cr(1,0+1*1) >= old_cr);
    }
    pw(1,0+1*1) = co(0+1*1,cr(1,0+1*1));
    r1 = mem(0+1*1,cr(1,0+1*1));
  }
  ASSUME(creturn[1] >= cr(1,0+1*1));

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !48, metadata !DIExpression()), !dbg !75

  //   %conv4 = trunc i64 %1 to i32, !dbg !77

  //   call void @llvm.dbg.value(metadata i32 %conv4, metadata !45, metadata !DIExpression()), !dbg !61

  //   %xor = xor i32 %conv4, %conv4, !dbg !78
  creg_r2 = creg_r1;
  r2 = r1 ^ r1;

  //   call void @llvm.dbg.value(metadata i32 %xor, metadata !49, metadata !DIExpression()), !dbg !61

  //   %add = add nsw i32 2, %xor, !dbg !79
  creg_r3 = max(0,creg_r2);
  r3 = 2 + r2;

  //   %idxprom = sext i32 %add to i64, !dbg !79

  //   %arrayidx = getelementptr inbounds [4 x i64], [4 x i64]* @vars, i64 0, i64 %idxprom, !dbg !79
  r4 = 0+r3*1;
  creg_r4 = creg_r3;

  //   call void @llvm.dbg.value(metadata i64* %arrayidx, metadata !51, metadata !DIExpression()), !dbg !80

  //   %2 = load atomic i64, i64* %arrayidx monotonic, align 8, !dbg !79
  // LD: Guess
  old_cr = cr(1,r4);
  cr(1,r4) = get_rng(0,NCONTEXT-1);// 1 ASSIGN LDCOM _l26_c16
  // Check
  ASSUME(active[cr(1,r4)] == 1);
  ASSUME(cr(1,r4) >= iw(1,r4));
  ASSUME(cr(1,r4) >= creg_r4);
  ASSUME(cr(1,r4) >= cdy[1]);
  ASSUME(cr(1,r4) >= cisb[1]);
  ASSUME(cr(1,r4) >= cdl[1]);
  ASSUME(cr(1,r4) >= cl[1]);
  // Update
  creg_r5 = cr(1,r4);
  crmax(1,r4) = max(crmax(1,r4),cr(1,r4));
  caddr[1] = max(caddr[1],creg_r4);
  if(cr(1,r4) < cw(1,r4)) {
    r5 = buff(1,r4);
    ASSUME((!(( (cw(1,r4) < 1) && (1 < crmax(1,r4)) )))||(sforbid(r4,1)> 0));
    ASSUME((!(( (cw(1,r4) < 2) && (2 < crmax(1,r4)) )))||(sforbid(r4,2)> 0));
    ASSUME((!(( (cw(1,r4) < 3) && (3 < crmax(1,r4)) )))||(sforbid(r4,3)> 0));
    ASSUME((!(( (cw(1,r4) < 4) && (4 < crmax(1,r4)) )))||(sforbid(r4,4)> 0));
  } else {
    if(pw(1,r4) != co(r4,cr(1,r4))) {
      ASSUME(cr(1,r4) >= old_cr);
    }
    pw(1,r4) = co(r4,cr(1,r4));
    r5 = mem(r4,cr(1,r4));
  }
  ASSUME(creturn[1] >= cr(1,r4));

  //   call void @llvm.dbg.value(metadata i64 %2, metadata !53, metadata !DIExpression()), !dbg !80

  //   %conv8 = trunc i64 %2 to i32, !dbg !81

  //   call void @llvm.dbg.value(metadata i32 %conv8, metadata !50, metadata !DIExpression()), !dbg !61

  //   %xor9 = xor i32 %conv8, %conv8, !dbg !82
  creg_r6 = creg_r5;
  r6 = r5 ^ r5;

  //   call void @llvm.dbg.value(metadata i32 %xor9, metadata !54, metadata !DIExpression()), !dbg !61

  //   %add11 = add nsw i32 3, %xor9, !dbg !83
  creg_r7 = max(0,creg_r6);
  r7 = 3 + r6;

  //   %idxprom12 = sext i32 %add11 to i64, !dbg !83

  //   %arrayidx13 = getelementptr inbounds [4 x i64], [4 x i64]* @vars, i64 0, i64 %idxprom12, !dbg !83
  r8 = 0+r7*1;
  creg_r8 = creg_r7;

  //   call void @llvm.dbg.value(metadata i64* %arrayidx13, metadata !55, metadata !DIExpression()), !dbg !84

  //   call void @llvm.dbg.value(metadata i64 1, metadata !57, metadata !DIExpression()), !dbg !84

  //   store atomic i64 1, i64* %arrayidx13 monotonic, align 8, !dbg !83
  // ST: Guess
  iw(1,r8) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW _l28_c3
  old_cw = cw(1,r8);
  cw(1,r8) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM _l28_c3
  // Check
  ASSUME(active[iw(1,r8)] == 1);
  ASSUME(active[cw(1,r8)] == 1);
  ASSUME(sforbid(r8,cw(1,r8))== 0);
  ASSUME(iw(1,r8) >= 0);
  ASSUME(iw(1,r8) >= creg_r8);
  ASSUME(cw(1,r8) >= iw(1,r8));
  ASSUME(cw(1,r8) >= old_cw);
  ASSUME(cw(1,r8) >= cr(1,r8));
  ASSUME(cw(1,r8) >= cl[1]);
  ASSUME(cw(1,r8) >= cisb[1]);
  ASSUME(cw(1,r8) >= cdy[1]);
  ASSUME(cw(1,r8) >= cdl[1]);
  ASSUME(cw(1,r8) >= cds[1]);
  ASSUME(cw(1,r8) >= cctrl[1]);
  ASSUME(cw(1,r8) >= caddr[1]);
  // Update
  caddr[1] = max(caddr[1],creg_r8);
  buff(1,r8) = 1;
  mem(r8,cw(1,r8)) = 1;
  co(r8,cw(1,r8))+=1;
  delta(r8,cw(1,r8)) = -1;
  ASSUME(creturn[1] >= cw(1,r8));

  //   %cmp = icmp eq i32 %conv, 1, !dbg !85
  creg__r0__1_ = max(0,creg_r0);

  //   %conv15 = zext i1 %cmp to i32, !dbg !85

  //   call void @llvm.dbg.value(metadata i32 %conv15, metadata !58, metadata !DIExpression()), !dbg !61

  //   store i32 %conv15, i32* @atom_0_X2_1, align 4, !dbg !86, !tbaa !87
  // ST: Guess
  iw(1,4) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW _l30_c15
  old_cw = cw(1,4);
  cw(1,4) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM _l30_c15
  // Check
  ASSUME(active[iw(1,4)] == 1);
  ASSUME(active[cw(1,4)] == 1);
  ASSUME(sforbid(4,cw(1,4))== 0);
  ASSUME(iw(1,4) >= creg__r0__1_);
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
  buff(1,4) = (r0==1);
  mem(4,cw(1,4)) = (r0==1);
  co(4,cw(1,4))+=1;
  delta(4,cw(1,4)) = -1;
  ASSUME(creturn[1] >= cw(1,4));

  //   ret i8* null, !dbg !91
  ret_thread_1 = (- 1);
  goto T1BLOCK_END;

T1BLOCK_END:

  // Dumping thread 2
  int ret_thread_2 = 0;
  cdy[2] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[2] >= cstart[2]);
T2BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !94, metadata !DIExpression()), !dbg !104

  //   br label %label_2, !dbg !48
  goto T2BLOCK1;

T2BLOCK1:
  //   call void @llvm.dbg.label(metadata !103), !dbg !106

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 3), metadata !95, metadata !DIExpression()), !dbg !107

  //   call void @llvm.dbg.value(metadata i64 2, metadata !97, metadata !DIExpression()), !dbg !107

  //   store atomic i64 2, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !51
  // ST: Guess
  iw(2,0+3*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW _l36_c3
  old_cw = cw(2,0+3*1);
  cw(2,0+3*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM _l36_c3
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
  buff(2,0+3*1) = 2;
  mem(0+3*1,cw(2,0+3*1)) = 2;
  co(0+3*1,cw(2,0+3*1))+=1;
  delta(0+3*1,cw(2,0+3*1)) = -1;
  ASSUME(creturn[2] >= cw(2,0+3*1));

  //   call void (...) @dmbsy(), !dbg !52
  // dumbsy: Guess
  old_cdy = cdy[2];
  cdy[2] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[2] >= old_cdy);
  ASSUME(cdy[2] >= cisb[2]);
  ASSUME(cdy[2] >= cdl[2]);
  ASSUME(cdy[2] >= cds[2]);
  ASSUME(cdy[2] >= cctrl[2]);
  ASSUME(cdy[2] >= cw(2,0+0));
  ASSUME(cdy[2] >= cw(2,0+1));
  ASSUME(cdy[2] >= cw(2,0+2));
  ASSUME(cdy[2] >= cw(2,0+3));
  ASSUME(cdy[2] >= cw(2,4+0));
  ASSUME(cdy[2] >= cw(2,5+0));
  ASSUME(cdy[2] >= cr(2,0+0));
  ASSUME(cdy[2] >= cr(2,0+1));
  ASSUME(cdy[2] >= cr(2,0+2));
  ASSUME(cdy[2] >= cr(2,0+3));
  ASSUME(cdy[2] >= cr(2,4+0));
  ASSUME(cdy[2] >= cr(2,5+0));
  ASSUME(creturn[2] >= cdy[2]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 0), metadata !99, metadata !DIExpression()), !dbg !110

  //   %0 = load atomic i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !54
  // LD: Guess
  old_cr = cr(2,0);
  cr(2,0) = get_rng(0,NCONTEXT-1);// 2 ASSIGN LDCOM _l38_c16
  // Check
  ASSUME(active[cr(2,0)] == 2);
  ASSUME(cr(2,0) >= iw(2,0));
  ASSUME(cr(2,0) >= 0);
  ASSUME(cr(2,0) >= cdy[2]);
  ASSUME(cr(2,0) >= cisb[2]);
  ASSUME(cr(2,0) >= cdl[2]);
  ASSUME(cr(2,0) >= cl[2]);
  // Update
  creg_r9 = cr(2,0);
  crmax(2,0) = max(crmax(2,0),cr(2,0));
  caddr[2] = max(caddr[2],0);
  if(cr(2,0) < cw(2,0)) {
    r9 = buff(2,0);
    ASSUME((!(( (cw(2,0) < 1) && (1 < crmax(2,0)) )))||(sforbid(0,1)> 0));
    ASSUME((!(( (cw(2,0) < 2) && (2 < crmax(2,0)) )))||(sforbid(0,2)> 0));
    ASSUME((!(( (cw(2,0) < 3) && (3 < crmax(2,0)) )))||(sforbid(0,3)> 0));
    ASSUME((!(( (cw(2,0) < 4) && (4 < crmax(2,0)) )))||(sforbid(0,4)> 0));
  } else {
    if(pw(2,0) != co(0,cr(2,0))) {
      ASSUME(cr(2,0) >= old_cr);
    }
    pw(2,0) = co(0,cr(2,0));
    r9 = mem(0,cr(2,0));
  }
  ASSUME(creturn[2] >= cr(2,0));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !101, metadata !DIExpression()), !dbg !110

  //   %conv = trunc i64 %0 to i32, !dbg !55

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !98, metadata !DIExpression()), !dbg !104

  //   %cmp = icmp eq i32 %conv, 0, !dbg !56
  creg__r9__0_ = max(0,creg_r9);

  //   %conv1 = zext i1 %cmp to i32, !dbg !56

  //   call void @llvm.dbg.value(metadata i32 %conv1, metadata !102, metadata !DIExpression()), !dbg !104

  //   store i32 %conv1, i32* @atom_1_X2_0, align 4, !dbg !57, !tbaa !58
  // ST: Guess
  iw(2,5) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW _l40_c15
  old_cw = cw(2,5);
  cw(2,5) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM _l40_c15
  // Check
  ASSUME(active[iw(2,5)] == 2);
  ASSUME(active[cw(2,5)] == 2);
  ASSUME(sforbid(5,cw(2,5))== 0);
  ASSUME(iw(2,5) >= creg__r9__0_);
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
  buff(2,5) = (r9==0);
  mem(5,cw(2,5)) = (r9==0);
  co(5,cw(2,5))+=1;
  delta(5,cw(2,5)) = -1;
  ASSUME(creturn[2] >= cw(2,5));

  //   ret i8* null, !dbg !62
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

  //   call void @llvm.dbg.value(metadata i32 %argc, metadata !123, metadata !DIExpression()), !dbg !157

  //   call void @llvm.dbg.value(metadata i8** %argv, metadata !124, metadata !DIExpression()), !dbg !157

  //   %0 = bitcast i64* %thr0 to i8*, !dbg !75

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #7, !dbg !75

  //   call void @llvm.dbg.declare(metadata i64* %thr0, metadata !125, metadata !DIExpression()), !dbg !159

  //   %1 = bitcast i64* %thr1 to i8*, !dbg !77

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #7, !dbg !77

  //   call void @llvm.dbg.declare(metadata i64* %thr1, metadata !129, metadata !DIExpression()), !dbg !161

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 3), metadata !130, metadata !DIExpression()), !dbg !162

  //   call void @llvm.dbg.value(metadata i64 0, metadata !132, metadata !DIExpression()), !dbg !162

  //   store atomic i64 0, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !80
  // ST: Guess
  iw(0,0+3*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l48_c3
  old_cw = cw(0,0+3*1);
  cw(0,0+3*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l48_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 2), metadata !133, metadata !DIExpression()), !dbg !164

  //   call void @llvm.dbg.value(metadata i64 0, metadata !135, metadata !DIExpression()), !dbg !164

  //   store atomic i64 0, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 2) monotonic, align 8, !dbg !82
  // ST: Guess
  iw(0,0+2*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l49_c3
  old_cw = cw(0,0+2*1);
  cw(0,0+2*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l49_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 1), metadata !136, metadata !DIExpression()), !dbg !166

  //   call void @llvm.dbg.value(metadata i64 0, metadata !138, metadata !DIExpression()), !dbg !166

  //   store atomic i64 0, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !84
  // ST: Guess
  iw(0,0+1*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l50_c3
  old_cw = cw(0,0+1*1);
  cw(0,0+1*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l50_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 0), metadata !139, metadata !DIExpression()), !dbg !168

  //   call void @llvm.dbg.value(metadata i64 0, metadata !141, metadata !DIExpression()), !dbg !168

  //   store atomic i64 0, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !86
  // ST: Guess
  iw(0,0) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l51_c3
  old_cw = cw(0,0);
  cw(0,0) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l51_c3
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

  //   store i32 0, i32* @atom_0_X2_1, align 4, !dbg !87, !tbaa !88
  // ST: Guess
  iw(0,4) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l52_c15
  old_cw = cw(0,4);
  cw(0,4) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l52_c15
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

  //   store i32 0, i32* @atom_1_X2_0, align 4, !dbg !92, !tbaa !88
  // ST: Guess
  iw(0,5) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l53_c15
  old_cw = cw(0,5);
  cw(0,5) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l53_c15
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

  //   %call = call i32 @pthread_create(i64* noundef %thr0, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t0, i8* noundef null) #7, !dbg !93
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
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[1] >= cdy[0]);

  //   %call7 = call i32 @pthread_create(i64* noundef %thr1, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t1, i8* noundef null) #7, !dbg !94
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
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[2] >= cdy[0]);

  //   %2 = load i64, i64* %thr0, align 8, !dbg !95, !tbaa !96
  r11 = local_mem[0];

  //   %call8 = call i32 @pthread_join(i64 noundef %2, i8** noundef null), !dbg !98
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
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[1]);

  //   %3 = load i64, i64* %thr1, align 8, !dbg !99, !tbaa !96
  r12 = local_mem[1];

  //   %call9 = call i32 @pthread_join(i64 noundef %3, i8** noundef null), !dbg !100
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
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[2]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 3), metadata !143, metadata !DIExpression()), !dbg !180

  //   %4 = load atomic i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !102
  // LD: Guess
  old_cr = cr(0,0+3*1);
  cr(0,0+3*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l61_c13
  // Check
  ASSUME(active[cr(0,0+3*1)] == 0);
  ASSUME(cr(0,0+3*1) >= iw(0,0+3*1));
  ASSUME(cr(0,0+3*1) >= 0);
  ASSUME(cr(0,0+3*1) >= cdy[0]);
  ASSUME(cr(0,0+3*1) >= cisb[0]);
  ASSUME(cr(0,0+3*1) >= cdl[0]);
  ASSUME(cr(0,0+3*1) >= cl[0]);
  // Update
  creg_r13 = cr(0,0+3*1);
  crmax(0,0+3*1) = max(crmax(0,0+3*1),cr(0,0+3*1));
  caddr[0] = max(caddr[0],0);
  if(cr(0,0+3*1) < cw(0,0+3*1)) {
    r13 = buff(0,0+3*1);
    ASSUME((!(( (cw(0,0+3*1) < 1) && (1 < crmax(0,0+3*1)) )))||(sforbid(0+3*1,1)> 0));
    ASSUME((!(( (cw(0,0+3*1) < 2) && (2 < crmax(0,0+3*1)) )))||(sforbid(0+3*1,2)> 0));
    ASSUME((!(( (cw(0,0+3*1) < 3) && (3 < crmax(0,0+3*1)) )))||(sforbid(0+3*1,3)> 0));
    ASSUME((!(( (cw(0,0+3*1) < 4) && (4 < crmax(0,0+3*1)) )))||(sforbid(0+3*1,4)> 0));
  } else {
    if(pw(0,0+3*1) != co(0+3*1,cr(0,0+3*1))) {
      ASSUME(cr(0,0+3*1) >= old_cr);
    }
    pw(0,0+3*1) = co(0+3*1,cr(0,0+3*1));
    r13 = mem(0+3*1,cr(0,0+3*1));
  }
  ASSUME(creturn[0] >= cr(0,0+3*1));

  //   call void @llvm.dbg.value(metadata i64 %4, metadata !145, metadata !DIExpression()), !dbg !180

  //   %conv = trunc i64 %4 to i32, !dbg !103

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !142, metadata !DIExpression()), !dbg !157

  //   %cmp = icmp eq i32 %conv, 2, !dbg !104
  creg__r13__2_ = max(0,creg_r13);

  //   %conv10 = zext i1 %cmp to i32, !dbg !104

  //   call void @llvm.dbg.value(metadata i32 %conv10, metadata !146, metadata !DIExpression()), !dbg !157

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 0), metadata !148, metadata !DIExpression()), !dbg !184

  //   %5 = load atomic i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !106
  // LD: Guess
  old_cr = cr(0,0);
  cr(0,0) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l63_c13
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

  //   call void @llvm.dbg.value(metadata i64 %5, metadata !150, metadata !DIExpression()), !dbg !184

  //   %conv14 = trunc i64 %5 to i32, !dbg !107

  //   call void @llvm.dbg.value(metadata i32 %conv14, metadata !147, metadata !DIExpression()), !dbg !157

  //   %cmp15 = icmp eq i32 %conv14, 1, !dbg !108
  creg__r14__1_ = max(0,creg_r14);

  //   %conv16 = zext i1 %cmp15 to i32, !dbg !108

  //   call void @llvm.dbg.value(metadata i32 %conv16, metadata !151, metadata !DIExpression()), !dbg !157

  //   %6 = load i32, i32* @atom_0_X2_1, align 4, !dbg !109, !tbaa !88
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

  //   call void @llvm.dbg.value(metadata i32 %6, metadata !152, metadata !DIExpression()), !dbg !157

  //   %7 = load i32, i32* @atom_1_X2_0, align 4, !dbg !110, !tbaa !88
  // LD: Guess
  old_cr = cr(0,5);
  cr(0,5) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l66_c13
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

  //   call void @llvm.dbg.value(metadata i32 %7, metadata !153, metadata !DIExpression()), !dbg !157

  //   %and = and i32 %6, %7, !dbg !111
  creg_r17 = max(creg_r15,creg_r16);
  r17 = r15 & r16;

  //   call void @llvm.dbg.value(metadata i32 %and, metadata !154, metadata !DIExpression()), !dbg !157

  //   %and17 = and i32 %conv16, %and, !dbg !112
  creg_r18 = max(creg__r14__1_,creg_r17);
  r18 = (r14==1) & r17;

  //   call void @llvm.dbg.value(metadata i32 %and17, metadata !155, metadata !DIExpression()), !dbg !157

  //   %and18 = and i32 %conv10, %and17, !dbg !113
  creg_r19 = max(creg__r13__2_,creg_r18);
  r19 = (r13==2) & r18;

  //   call void @llvm.dbg.value(metadata i32 %and18, metadata !156, metadata !DIExpression()), !dbg !157

  //   %cmp19 = icmp eq i32 %and18, 1, !dbg !114
  creg__r19__1_ = max(0,creg_r19);

  //   br i1 %cmp19, label %if.then, label %if.end, !dbg !116
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
  //   call void @__assert_fail(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([112 x i8], [112 x i8]* @.str.1, i64 0, i64 0), i32 noundef 70, i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #8, !dbg !117

  //   unreachable, !dbg !117
  r20 = 1;
  goto T0BLOCK_END;

T0BLOCK2:
  //   %8 = bitcast i64* %thr1 to i8*, !dbg !120

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %8) #7, !dbg !120

  //   %9 = bitcast i64* %thr0 to i8*, !dbg !120

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %9) #7, !dbg !120

  //   ret i32 0, !dbg !121
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

  ASSERT(r20== 0);

}
