// Global variabls:
// 10:atom_0_X5_1:1
// 0:vars:8
// 9:atom_0_X3_1:1
// 13:atom_1_X2_1:1
// 8:atom_0_X0_1:1
// 12:atom_1_X0_1:1
// 17:atom_3_X4_1:1
// 11:atom_1_X4_1:1
// 15:atom_2_X3_1:1
// 14:atom_2_X0_1:1
// 16:atom_2_X5_1:1
// 18:atom_3_X0_1:1
// 19:atom_3_X2_1:1
// Local global variabls:
// 0:thr0:1
// 1:thr1:1
// 2:thr2:1
// 3:thr3:1
#define ADDRSIZE 20
#define LOCALADDRSIZE 4
#define NTHREAD 5
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

  int r0= 0;
  char creg_r0;
  int r1= 0;
  char creg_r1;
  int r2= 0;
  char creg_r2;
  char creg__r0__1_;
  char creg__r1__1_;
  char creg__r2__1_;
  int r3= 0;
  char creg_r3;
  int r4= 0;
  char creg_r4;
  int r5= 0;
  char creg_r5;
  char creg__r5__1_;
  char creg__r3__1_;
  char creg__r4__1_;
  int r6= 0;
  char creg_r6;
  int r7= 0;
  char creg_r7;
  int r8= 0;
  char creg_r8;
  char creg__r6__1_;
  char creg__r7__1_;
  char creg__r8__1_;
  int r9= 0;
  char creg_r9;
  int r10= 0;
  char creg_r10;
  int r11= 0;
  char creg_r11;
  char creg__r11__1_;
  char creg__r9__1_;
  char creg__r10__1_;
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
  int r24= 0;
  char creg_r24;
  int r25= 0;
  char creg_r25;
  int r26= 0;
  char creg_r26;
  int r27= 0;
  char creg_r27;
  int r28= 0;
  char creg_r28;
  int r29= 0;
  char creg_r29;
  int r30= 0;
  char creg_r30;
  int r31= 0;
  char creg_r31;
  int r32= 0;
  char creg_r32;
  int r33= 0;
  char creg_r33;
  int r34= 0;
  char creg_r34;
  int r35= 0;
  char creg_r35;
  int r36= 0;
  char creg_r36;
  int r37= 0;
  char creg_r37;
  int r38= 0;
  char creg_r38;
  int r39= 0;
  char creg_r39;
  char creg__r39__1_;
  int r40= 0;
  char creg_r40;
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
  buff(0,11) = 0;
  pw(0,11) = 0;
  cr(0,11) = 0;
  iw(0,11) = 0;
  cw(0,11) = 0;
  cx(0,11) = 0;
  is(0,11) = 0;
  cs(0,11) = 0;
  crmax(0,11) = 0;
  buff(0,12) = 0;
  pw(0,12) = 0;
  cr(0,12) = 0;
  iw(0,12) = 0;
  cw(0,12) = 0;
  cx(0,12) = 0;
  is(0,12) = 0;
  cs(0,12) = 0;
  crmax(0,12) = 0;
  buff(0,13) = 0;
  pw(0,13) = 0;
  cr(0,13) = 0;
  iw(0,13) = 0;
  cw(0,13) = 0;
  cx(0,13) = 0;
  is(0,13) = 0;
  cs(0,13) = 0;
  crmax(0,13) = 0;
  buff(0,14) = 0;
  pw(0,14) = 0;
  cr(0,14) = 0;
  iw(0,14) = 0;
  cw(0,14) = 0;
  cx(0,14) = 0;
  is(0,14) = 0;
  cs(0,14) = 0;
  crmax(0,14) = 0;
  buff(0,15) = 0;
  pw(0,15) = 0;
  cr(0,15) = 0;
  iw(0,15) = 0;
  cw(0,15) = 0;
  cx(0,15) = 0;
  is(0,15) = 0;
  cs(0,15) = 0;
  crmax(0,15) = 0;
  buff(0,16) = 0;
  pw(0,16) = 0;
  cr(0,16) = 0;
  iw(0,16) = 0;
  cw(0,16) = 0;
  cx(0,16) = 0;
  is(0,16) = 0;
  cs(0,16) = 0;
  crmax(0,16) = 0;
  buff(0,17) = 0;
  pw(0,17) = 0;
  cr(0,17) = 0;
  iw(0,17) = 0;
  cw(0,17) = 0;
  cx(0,17) = 0;
  is(0,17) = 0;
  cs(0,17) = 0;
  crmax(0,17) = 0;
  buff(0,18) = 0;
  pw(0,18) = 0;
  cr(0,18) = 0;
  iw(0,18) = 0;
  cw(0,18) = 0;
  cx(0,18) = 0;
  is(0,18) = 0;
  cs(0,18) = 0;
  crmax(0,18) = 0;
  buff(0,19) = 0;
  pw(0,19) = 0;
  cr(0,19) = 0;
  iw(0,19) = 0;
  cw(0,19) = 0;
  cx(0,19) = 0;
  is(0,19) = 0;
  cs(0,19) = 0;
  crmax(0,19) = 0;
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
  buff(1,11) = 0;
  pw(1,11) = 0;
  cr(1,11) = 0;
  iw(1,11) = 0;
  cw(1,11) = 0;
  cx(1,11) = 0;
  is(1,11) = 0;
  cs(1,11) = 0;
  crmax(1,11) = 0;
  buff(1,12) = 0;
  pw(1,12) = 0;
  cr(1,12) = 0;
  iw(1,12) = 0;
  cw(1,12) = 0;
  cx(1,12) = 0;
  is(1,12) = 0;
  cs(1,12) = 0;
  crmax(1,12) = 0;
  buff(1,13) = 0;
  pw(1,13) = 0;
  cr(1,13) = 0;
  iw(1,13) = 0;
  cw(1,13) = 0;
  cx(1,13) = 0;
  is(1,13) = 0;
  cs(1,13) = 0;
  crmax(1,13) = 0;
  buff(1,14) = 0;
  pw(1,14) = 0;
  cr(1,14) = 0;
  iw(1,14) = 0;
  cw(1,14) = 0;
  cx(1,14) = 0;
  is(1,14) = 0;
  cs(1,14) = 0;
  crmax(1,14) = 0;
  buff(1,15) = 0;
  pw(1,15) = 0;
  cr(1,15) = 0;
  iw(1,15) = 0;
  cw(1,15) = 0;
  cx(1,15) = 0;
  is(1,15) = 0;
  cs(1,15) = 0;
  crmax(1,15) = 0;
  buff(1,16) = 0;
  pw(1,16) = 0;
  cr(1,16) = 0;
  iw(1,16) = 0;
  cw(1,16) = 0;
  cx(1,16) = 0;
  is(1,16) = 0;
  cs(1,16) = 0;
  crmax(1,16) = 0;
  buff(1,17) = 0;
  pw(1,17) = 0;
  cr(1,17) = 0;
  iw(1,17) = 0;
  cw(1,17) = 0;
  cx(1,17) = 0;
  is(1,17) = 0;
  cs(1,17) = 0;
  crmax(1,17) = 0;
  buff(1,18) = 0;
  pw(1,18) = 0;
  cr(1,18) = 0;
  iw(1,18) = 0;
  cw(1,18) = 0;
  cx(1,18) = 0;
  is(1,18) = 0;
  cs(1,18) = 0;
  crmax(1,18) = 0;
  buff(1,19) = 0;
  pw(1,19) = 0;
  cr(1,19) = 0;
  iw(1,19) = 0;
  cw(1,19) = 0;
  cx(1,19) = 0;
  is(1,19) = 0;
  cs(1,19) = 0;
  crmax(1,19) = 0;
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
  buff(2,11) = 0;
  pw(2,11) = 0;
  cr(2,11) = 0;
  iw(2,11) = 0;
  cw(2,11) = 0;
  cx(2,11) = 0;
  is(2,11) = 0;
  cs(2,11) = 0;
  crmax(2,11) = 0;
  buff(2,12) = 0;
  pw(2,12) = 0;
  cr(2,12) = 0;
  iw(2,12) = 0;
  cw(2,12) = 0;
  cx(2,12) = 0;
  is(2,12) = 0;
  cs(2,12) = 0;
  crmax(2,12) = 0;
  buff(2,13) = 0;
  pw(2,13) = 0;
  cr(2,13) = 0;
  iw(2,13) = 0;
  cw(2,13) = 0;
  cx(2,13) = 0;
  is(2,13) = 0;
  cs(2,13) = 0;
  crmax(2,13) = 0;
  buff(2,14) = 0;
  pw(2,14) = 0;
  cr(2,14) = 0;
  iw(2,14) = 0;
  cw(2,14) = 0;
  cx(2,14) = 0;
  is(2,14) = 0;
  cs(2,14) = 0;
  crmax(2,14) = 0;
  buff(2,15) = 0;
  pw(2,15) = 0;
  cr(2,15) = 0;
  iw(2,15) = 0;
  cw(2,15) = 0;
  cx(2,15) = 0;
  is(2,15) = 0;
  cs(2,15) = 0;
  crmax(2,15) = 0;
  buff(2,16) = 0;
  pw(2,16) = 0;
  cr(2,16) = 0;
  iw(2,16) = 0;
  cw(2,16) = 0;
  cx(2,16) = 0;
  is(2,16) = 0;
  cs(2,16) = 0;
  crmax(2,16) = 0;
  buff(2,17) = 0;
  pw(2,17) = 0;
  cr(2,17) = 0;
  iw(2,17) = 0;
  cw(2,17) = 0;
  cx(2,17) = 0;
  is(2,17) = 0;
  cs(2,17) = 0;
  crmax(2,17) = 0;
  buff(2,18) = 0;
  pw(2,18) = 0;
  cr(2,18) = 0;
  iw(2,18) = 0;
  cw(2,18) = 0;
  cx(2,18) = 0;
  is(2,18) = 0;
  cs(2,18) = 0;
  crmax(2,18) = 0;
  buff(2,19) = 0;
  pw(2,19) = 0;
  cr(2,19) = 0;
  iw(2,19) = 0;
  cw(2,19) = 0;
  cx(2,19) = 0;
  is(2,19) = 0;
  cs(2,19) = 0;
  crmax(2,19) = 0;
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
  buff(3,6) = 0;
  pw(3,6) = 0;
  cr(3,6) = 0;
  iw(3,6) = 0;
  cw(3,6) = 0;
  cx(3,6) = 0;
  is(3,6) = 0;
  cs(3,6) = 0;
  crmax(3,6) = 0;
  buff(3,7) = 0;
  pw(3,7) = 0;
  cr(3,7) = 0;
  iw(3,7) = 0;
  cw(3,7) = 0;
  cx(3,7) = 0;
  is(3,7) = 0;
  cs(3,7) = 0;
  crmax(3,7) = 0;
  buff(3,8) = 0;
  pw(3,8) = 0;
  cr(3,8) = 0;
  iw(3,8) = 0;
  cw(3,8) = 0;
  cx(3,8) = 0;
  is(3,8) = 0;
  cs(3,8) = 0;
  crmax(3,8) = 0;
  buff(3,9) = 0;
  pw(3,9) = 0;
  cr(3,9) = 0;
  iw(3,9) = 0;
  cw(3,9) = 0;
  cx(3,9) = 0;
  is(3,9) = 0;
  cs(3,9) = 0;
  crmax(3,9) = 0;
  buff(3,10) = 0;
  pw(3,10) = 0;
  cr(3,10) = 0;
  iw(3,10) = 0;
  cw(3,10) = 0;
  cx(3,10) = 0;
  is(3,10) = 0;
  cs(3,10) = 0;
  crmax(3,10) = 0;
  buff(3,11) = 0;
  pw(3,11) = 0;
  cr(3,11) = 0;
  iw(3,11) = 0;
  cw(3,11) = 0;
  cx(3,11) = 0;
  is(3,11) = 0;
  cs(3,11) = 0;
  crmax(3,11) = 0;
  buff(3,12) = 0;
  pw(3,12) = 0;
  cr(3,12) = 0;
  iw(3,12) = 0;
  cw(3,12) = 0;
  cx(3,12) = 0;
  is(3,12) = 0;
  cs(3,12) = 0;
  crmax(3,12) = 0;
  buff(3,13) = 0;
  pw(3,13) = 0;
  cr(3,13) = 0;
  iw(3,13) = 0;
  cw(3,13) = 0;
  cx(3,13) = 0;
  is(3,13) = 0;
  cs(3,13) = 0;
  crmax(3,13) = 0;
  buff(3,14) = 0;
  pw(3,14) = 0;
  cr(3,14) = 0;
  iw(3,14) = 0;
  cw(3,14) = 0;
  cx(3,14) = 0;
  is(3,14) = 0;
  cs(3,14) = 0;
  crmax(3,14) = 0;
  buff(3,15) = 0;
  pw(3,15) = 0;
  cr(3,15) = 0;
  iw(3,15) = 0;
  cw(3,15) = 0;
  cx(3,15) = 0;
  is(3,15) = 0;
  cs(3,15) = 0;
  crmax(3,15) = 0;
  buff(3,16) = 0;
  pw(3,16) = 0;
  cr(3,16) = 0;
  iw(3,16) = 0;
  cw(3,16) = 0;
  cx(3,16) = 0;
  is(3,16) = 0;
  cs(3,16) = 0;
  crmax(3,16) = 0;
  buff(3,17) = 0;
  pw(3,17) = 0;
  cr(3,17) = 0;
  iw(3,17) = 0;
  cw(3,17) = 0;
  cx(3,17) = 0;
  is(3,17) = 0;
  cs(3,17) = 0;
  crmax(3,17) = 0;
  buff(3,18) = 0;
  pw(3,18) = 0;
  cr(3,18) = 0;
  iw(3,18) = 0;
  cw(3,18) = 0;
  cx(3,18) = 0;
  is(3,18) = 0;
  cs(3,18) = 0;
  crmax(3,18) = 0;
  buff(3,19) = 0;
  pw(3,19) = 0;
  cr(3,19) = 0;
  iw(3,19) = 0;
  cw(3,19) = 0;
  cx(3,19) = 0;
  is(3,19) = 0;
  cs(3,19) = 0;
  crmax(3,19) = 0;
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
  buff(4,4) = 0;
  pw(4,4) = 0;
  cr(4,4) = 0;
  iw(4,4) = 0;
  cw(4,4) = 0;
  cx(4,4) = 0;
  is(4,4) = 0;
  cs(4,4) = 0;
  crmax(4,4) = 0;
  buff(4,5) = 0;
  pw(4,5) = 0;
  cr(4,5) = 0;
  iw(4,5) = 0;
  cw(4,5) = 0;
  cx(4,5) = 0;
  is(4,5) = 0;
  cs(4,5) = 0;
  crmax(4,5) = 0;
  buff(4,6) = 0;
  pw(4,6) = 0;
  cr(4,6) = 0;
  iw(4,6) = 0;
  cw(4,6) = 0;
  cx(4,6) = 0;
  is(4,6) = 0;
  cs(4,6) = 0;
  crmax(4,6) = 0;
  buff(4,7) = 0;
  pw(4,7) = 0;
  cr(4,7) = 0;
  iw(4,7) = 0;
  cw(4,7) = 0;
  cx(4,7) = 0;
  is(4,7) = 0;
  cs(4,7) = 0;
  crmax(4,7) = 0;
  buff(4,8) = 0;
  pw(4,8) = 0;
  cr(4,8) = 0;
  iw(4,8) = 0;
  cw(4,8) = 0;
  cx(4,8) = 0;
  is(4,8) = 0;
  cs(4,8) = 0;
  crmax(4,8) = 0;
  buff(4,9) = 0;
  pw(4,9) = 0;
  cr(4,9) = 0;
  iw(4,9) = 0;
  cw(4,9) = 0;
  cx(4,9) = 0;
  is(4,9) = 0;
  cs(4,9) = 0;
  crmax(4,9) = 0;
  buff(4,10) = 0;
  pw(4,10) = 0;
  cr(4,10) = 0;
  iw(4,10) = 0;
  cw(4,10) = 0;
  cx(4,10) = 0;
  is(4,10) = 0;
  cs(4,10) = 0;
  crmax(4,10) = 0;
  buff(4,11) = 0;
  pw(4,11) = 0;
  cr(4,11) = 0;
  iw(4,11) = 0;
  cw(4,11) = 0;
  cx(4,11) = 0;
  is(4,11) = 0;
  cs(4,11) = 0;
  crmax(4,11) = 0;
  buff(4,12) = 0;
  pw(4,12) = 0;
  cr(4,12) = 0;
  iw(4,12) = 0;
  cw(4,12) = 0;
  cx(4,12) = 0;
  is(4,12) = 0;
  cs(4,12) = 0;
  crmax(4,12) = 0;
  buff(4,13) = 0;
  pw(4,13) = 0;
  cr(4,13) = 0;
  iw(4,13) = 0;
  cw(4,13) = 0;
  cx(4,13) = 0;
  is(4,13) = 0;
  cs(4,13) = 0;
  crmax(4,13) = 0;
  buff(4,14) = 0;
  pw(4,14) = 0;
  cr(4,14) = 0;
  iw(4,14) = 0;
  cw(4,14) = 0;
  cx(4,14) = 0;
  is(4,14) = 0;
  cs(4,14) = 0;
  crmax(4,14) = 0;
  buff(4,15) = 0;
  pw(4,15) = 0;
  cr(4,15) = 0;
  iw(4,15) = 0;
  cw(4,15) = 0;
  cx(4,15) = 0;
  is(4,15) = 0;
  cs(4,15) = 0;
  crmax(4,15) = 0;
  buff(4,16) = 0;
  pw(4,16) = 0;
  cr(4,16) = 0;
  iw(4,16) = 0;
  cw(4,16) = 0;
  cx(4,16) = 0;
  is(4,16) = 0;
  cs(4,16) = 0;
  crmax(4,16) = 0;
  buff(4,17) = 0;
  pw(4,17) = 0;
  cr(4,17) = 0;
  iw(4,17) = 0;
  cw(4,17) = 0;
  cx(4,17) = 0;
  is(4,17) = 0;
  cs(4,17) = 0;
  crmax(4,17) = 0;
  buff(4,18) = 0;
  pw(4,18) = 0;
  cr(4,18) = 0;
  iw(4,18) = 0;
  cw(4,18) = 0;
  cx(4,18) = 0;
  is(4,18) = 0;
  cs(4,18) = 0;
  crmax(4,18) = 0;
  buff(4,19) = 0;
  pw(4,19) = 0;
  cr(4,19) = 0;
  iw(4,19) = 0;
  cw(4,19) = 0;
  cx(4,19) = 0;
  is(4,19) = 0;
  cs(4,19) = 0;
  crmax(4,19) = 0;
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
  mem(10+0,0) = 0;
  mem(0+0,0) = 0;
  mem(0+1,0) = 0;
  mem(0+2,0) = 0;
  mem(0+3,0) = 0;
  mem(0+4,0) = 0;
  mem(0+5,0) = 0;
  mem(0+6,0) = 0;
  mem(0+7,0) = 0;
  mem(9+0,0) = 0;
  mem(13+0,0) = 0;
  mem(8+0,0) = 0;
  mem(12+0,0) = 0;
  mem(17+0,0) = 0;
  mem(11+0,0) = 0;
  mem(15+0,0) = 0;
  mem(14+0,0) = 0;
  mem(16+0,0) = 0;
  mem(18+0,0) = 0;
  mem(19+0,0) = 0;
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
  co(9,0) = 0;
  delta(9,0) = -1;
  mem(9,1) = meminit(9,1);
  co(9,1) = coinit(9,1);
  delta(9,1) = deltainit(9,1);
  mem(9,2) = meminit(9,2);
  co(9,2) = coinit(9,2);
  delta(9,2) = deltainit(9,2);
  mem(9,3) = meminit(9,3);
  co(9,3) = coinit(9,3);
  delta(9,3) = deltainit(9,3);
  mem(9,4) = meminit(9,4);
  co(9,4) = coinit(9,4);
  delta(9,4) = deltainit(9,4);
  co(10,0) = 0;
  delta(10,0) = -1;
  mem(10,1) = meminit(10,1);
  co(10,1) = coinit(10,1);
  delta(10,1) = deltainit(10,1);
  mem(10,2) = meminit(10,2);
  co(10,2) = coinit(10,2);
  delta(10,2) = deltainit(10,2);
  mem(10,3) = meminit(10,3);
  co(10,3) = coinit(10,3);
  delta(10,3) = deltainit(10,3);
  mem(10,4) = meminit(10,4);
  co(10,4) = coinit(10,4);
  delta(10,4) = deltainit(10,4);
  co(11,0) = 0;
  delta(11,0) = -1;
  mem(11,1) = meminit(11,1);
  co(11,1) = coinit(11,1);
  delta(11,1) = deltainit(11,1);
  mem(11,2) = meminit(11,2);
  co(11,2) = coinit(11,2);
  delta(11,2) = deltainit(11,2);
  mem(11,3) = meminit(11,3);
  co(11,3) = coinit(11,3);
  delta(11,3) = deltainit(11,3);
  mem(11,4) = meminit(11,4);
  co(11,4) = coinit(11,4);
  delta(11,4) = deltainit(11,4);
  co(12,0) = 0;
  delta(12,0) = -1;
  mem(12,1) = meminit(12,1);
  co(12,1) = coinit(12,1);
  delta(12,1) = deltainit(12,1);
  mem(12,2) = meminit(12,2);
  co(12,2) = coinit(12,2);
  delta(12,2) = deltainit(12,2);
  mem(12,3) = meminit(12,3);
  co(12,3) = coinit(12,3);
  delta(12,3) = deltainit(12,3);
  mem(12,4) = meminit(12,4);
  co(12,4) = coinit(12,4);
  delta(12,4) = deltainit(12,4);
  co(13,0) = 0;
  delta(13,0) = -1;
  mem(13,1) = meminit(13,1);
  co(13,1) = coinit(13,1);
  delta(13,1) = deltainit(13,1);
  mem(13,2) = meminit(13,2);
  co(13,2) = coinit(13,2);
  delta(13,2) = deltainit(13,2);
  mem(13,3) = meminit(13,3);
  co(13,3) = coinit(13,3);
  delta(13,3) = deltainit(13,3);
  mem(13,4) = meminit(13,4);
  co(13,4) = coinit(13,4);
  delta(13,4) = deltainit(13,4);
  co(14,0) = 0;
  delta(14,0) = -1;
  mem(14,1) = meminit(14,1);
  co(14,1) = coinit(14,1);
  delta(14,1) = deltainit(14,1);
  mem(14,2) = meminit(14,2);
  co(14,2) = coinit(14,2);
  delta(14,2) = deltainit(14,2);
  mem(14,3) = meminit(14,3);
  co(14,3) = coinit(14,3);
  delta(14,3) = deltainit(14,3);
  mem(14,4) = meminit(14,4);
  co(14,4) = coinit(14,4);
  delta(14,4) = deltainit(14,4);
  co(15,0) = 0;
  delta(15,0) = -1;
  mem(15,1) = meminit(15,1);
  co(15,1) = coinit(15,1);
  delta(15,1) = deltainit(15,1);
  mem(15,2) = meminit(15,2);
  co(15,2) = coinit(15,2);
  delta(15,2) = deltainit(15,2);
  mem(15,3) = meminit(15,3);
  co(15,3) = coinit(15,3);
  delta(15,3) = deltainit(15,3);
  mem(15,4) = meminit(15,4);
  co(15,4) = coinit(15,4);
  delta(15,4) = deltainit(15,4);
  co(16,0) = 0;
  delta(16,0) = -1;
  mem(16,1) = meminit(16,1);
  co(16,1) = coinit(16,1);
  delta(16,1) = deltainit(16,1);
  mem(16,2) = meminit(16,2);
  co(16,2) = coinit(16,2);
  delta(16,2) = deltainit(16,2);
  mem(16,3) = meminit(16,3);
  co(16,3) = coinit(16,3);
  delta(16,3) = deltainit(16,3);
  mem(16,4) = meminit(16,4);
  co(16,4) = coinit(16,4);
  delta(16,4) = deltainit(16,4);
  co(17,0) = 0;
  delta(17,0) = -1;
  mem(17,1) = meminit(17,1);
  co(17,1) = coinit(17,1);
  delta(17,1) = deltainit(17,1);
  mem(17,2) = meminit(17,2);
  co(17,2) = coinit(17,2);
  delta(17,2) = deltainit(17,2);
  mem(17,3) = meminit(17,3);
  co(17,3) = coinit(17,3);
  delta(17,3) = deltainit(17,3);
  mem(17,4) = meminit(17,4);
  co(17,4) = coinit(17,4);
  delta(17,4) = deltainit(17,4);
  co(18,0) = 0;
  delta(18,0) = -1;
  mem(18,1) = meminit(18,1);
  co(18,1) = coinit(18,1);
  delta(18,1) = deltainit(18,1);
  mem(18,2) = meminit(18,2);
  co(18,2) = coinit(18,2);
  delta(18,2) = deltainit(18,2);
  mem(18,3) = meminit(18,3);
  co(18,3) = coinit(18,3);
  delta(18,3) = deltainit(18,3);
  mem(18,4) = meminit(18,4);
  co(18,4) = coinit(18,4);
  delta(18,4) = deltainit(18,4);
  co(19,0) = 0;
  delta(19,0) = -1;
  mem(19,1) = meminit(19,1);
  co(19,1) = coinit(19,1);
  delta(19,1) = deltainit(19,1);
  mem(19,2) = meminit(19,2);
  co(19,2) = coinit(19,2);
  delta(19,2) = deltainit(19,2);
  mem(19,3) = meminit(19,3);
  co(19,3) = coinit(19,3);
  delta(19,3) = deltainit(19,3);
  mem(19,4) = meminit(19,4);
  co(19,4) = coinit(19,4);
  delta(19,4) = deltainit(19,4);
  // Dumping thread 1
  int ret_thread_1 = 0;
  cdy[1] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[1] >= cstart[1]);
T1BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !56, metadata !DIExpression()), !dbg !80

  //   br label %label_1, !dbg !81
  goto T1BLOCK1;

T1BLOCK1:
  //   call void @llvm.dbg.label(metadata !79), !dbg !82

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 4), metadata !58, metadata !DIExpression()), !dbg !83

  //   %0 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 4) monotonic, align 8, !dbg !84
  // LD: Guess
  old_cr = cr(1,0+4*1);
  cr(1,0+4*1) = get_rng(0,NCONTEXT-1);// 1 ASSIGN LDCOM _l30_c15
  // Check
  ASSUME(active[cr(1,0+4*1)] == 1);
  ASSUME(cr(1,0+4*1) >= iw(1,0+4*1));
  ASSUME(cr(1,0+4*1) >= 0);
  ASSUME(cr(1,0+4*1) >= cdy[1]);
  ASSUME(cr(1,0+4*1) >= cisb[1]);
  ASSUME(cr(1,0+4*1) >= cdl[1]);
  ASSUME(cr(1,0+4*1) >= cl[1]);
  // Update
  creg_r0 = cr(1,0+4*1);
  crmax(1,0+4*1) = max(crmax(1,0+4*1),cr(1,0+4*1));
  caddr[1] = max(caddr[1],0);
  if(cr(1,0+4*1) < cw(1,0+4*1)) {
    r0 = buff(1,0+4*1);
    ASSUME((!(( (cw(1,0+4*1) < 1) && (1 < crmax(1,0+4*1)) )))||(sforbid(0+4*1,1)> 0));
    ASSUME((!(( (cw(1,0+4*1) < 2) && (2 < crmax(1,0+4*1)) )))||(sforbid(0+4*1,2)> 0));
    ASSUME((!(( (cw(1,0+4*1) < 3) && (3 < crmax(1,0+4*1)) )))||(sforbid(0+4*1,3)> 0));
    ASSUME((!(( (cw(1,0+4*1) < 4) && (4 < crmax(1,0+4*1)) )))||(sforbid(0+4*1,4)> 0));
  } else {
    if(pw(1,0+4*1) != co(0+4*1,cr(1,0+4*1))) {
      ASSUME(cr(1,0+4*1) >= old_cr);
    }
    pw(1,0+4*1) = co(0+4*1,cr(1,0+4*1));
    r0 = mem(0+4*1,cr(1,0+4*1));
  }
  ASSUME(creturn[1] >= cr(1,0+4*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !61, metadata !DIExpression()), !dbg !83

  //   %conv = trunc i64 %0 to i32, !dbg !85

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !57, metadata !DIExpression()), !dbg !80

  //   call void (...) @dmbsy(), !dbg !86
  // dumbsy: Guess
  old_cdy = cdy[1];
  cdy[1] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[1] >= old_cdy);
  ASSUME(cdy[1] >= cisb[1]);
  ASSUME(cdy[1] >= cdl[1]);
  ASSUME(cdy[1] >= cds[1]);
  ASSUME(cdy[1] >= cctrl[1]);
  ASSUME(cdy[1] >= cw(1,10+0));
  ASSUME(cdy[1] >= cw(1,0+0));
  ASSUME(cdy[1] >= cw(1,0+1));
  ASSUME(cdy[1] >= cw(1,0+2));
  ASSUME(cdy[1] >= cw(1,0+3));
  ASSUME(cdy[1] >= cw(1,0+4));
  ASSUME(cdy[1] >= cw(1,0+5));
  ASSUME(cdy[1] >= cw(1,0+6));
  ASSUME(cdy[1] >= cw(1,0+7));
  ASSUME(cdy[1] >= cw(1,9+0));
  ASSUME(cdy[1] >= cw(1,13+0));
  ASSUME(cdy[1] >= cw(1,8+0));
  ASSUME(cdy[1] >= cw(1,12+0));
  ASSUME(cdy[1] >= cw(1,17+0));
  ASSUME(cdy[1] >= cw(1,11+0));
  ASSUME(cdy[1] >= cw(1,15+0));
  ASSUME(cdy[1] >= cw(1,14+0));
  ASSUME(cdy[1] >= cw(1,16+0));
  ASSUME(cdy[1] >= cw(1,18+0));
  ASSUME(cdy[1] >= cw(1,19+0));
  ASSUME(cdy[1] >= cr(1,10+0));
  ASSUME(cdy[1] >= cr(1,0+0));
  ASSUME(cdy[1] >= cr(1,0+1));
  ASSUME(cdy[1] >= cr(1,0+2));
  ASSUME(cdy[1] >= cr(1,0+3));
  ASSUME(cdy[1] >= cr(1,0+4));
  ASSUME(cdy[1] >= cr(1,0+5));
  ASSUME(cdy[1] >= cr(1,0+6));
  ASSUME(cdy[1] >= cr(1,0+7));
  ASSUME(cdy[1] >= cr(1,9+0));
  ASSUME(cdy[1] >= cr(1,13+0));
  ASSUME(cdy[1] >= cr(1,8+0));
  ASSUME(cdy[1] >= cr(1,12+0));
  ASSUME(cdy[1] >= cr(1,17+0));
  ASSUME(cdy[1] >= cr(1,11+0));
  ASSUME(cdy[1] >= cr(1,15+0));
  ASSUME(cdy[1] >= cr(1,14+0));
  ASSUME(cdy[1] >= cr(1,16+0));
  ASSUME(cdy[1] >= cr(1,18+0));
  ASSUME(cdy[1] >= cr(1,19+0));
  ASSUME(creturn[1] >= cdy[1]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 3), metadata !62, metadata !DIExpression()), !dbg !87

  //   call void @llvm.dbg.value(metadata i64 1, metadata !64, metadata !DIExpression()), !dbg !87

  //   store atomic i64 1, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 3) release, align 8, !dbg !88
  // ST: Guess
  //   : Release
  iw(1,0+3*1) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW _l32_c3
  old_cw = cw(1,0+3*1);
  cw(1,0+3*1) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM _l32_c3
  // Check
  ASSUME(active[iw(1,0+3*1)] == 1);
  ASSUME(active[cw(1,0+3*1)] == 1);
  ASSUME(sforbid(0+3*1,cw(1,0+3*1))== 0);
  ASSUME(iw(1,0+3*1) >= 0);
  ASSUME(iw(1,0+3*1) >= 0);
  ASSUME(cw(1,0+3*1) >= iw(1,0+3*1));
  ASSUME(cw(1,0+3*1) >= old_cw);
  ASSUME(cw(1,0+3*1) >= cr(1,0+3*1));
  ASSUME(cw(1,0+3*1) >= cl[1]);
  ASSUME(cw(1,0+3*1) >= cisb[1]);
  ASSUME(cw(1,0+3*1) >= cdy[1]);
  ASSUME(cw(1,0+3*1) >= cdl[1]);
  ASSUME(cw(1,0+3*1) >= cds[1]);
  ASSUME(cw(1,0+3*1) >= cctrl[1]);
  ASSUME(cw(1,0+3*1) >= caddr[1]);
  ASSUME(cw(1,0+3*1) >= cr(1,10+0));
  ASSUME(cw(1,0+3*1) >= cr(1,0+0));
  ASSUME(cw(1,0+3*1) >= cr(1,0+1));
  ASSUME(cw(1,0+3*1) >= cr(1,0+2));
  ASSUME(cw(1,0+3*1) >= cr(1,0+3));
  ASSUME(cw(1,0+3*1) >= cr(1,0+4));
  ASSUME(cw(1,0+3*1) >= cr(1,0+5));
  ASSUME(cw(1,0+3*1) >= cr(1,0+6));
  ASSUME(cw(1,0+3*1) >= cr(1,0+7));
  ASSUME(cw(1,0+3*1) >= cr(1,9+0));
  ASSUME(cw(1,0+3*1) >= cr(1,13+0));
  ASSUME(cw(1,0+3*1) >= cr(1,8+0));
  ASSUME(cw(1,0+3*1) >= cr(1,12+0));
  ASSUME(cw(1,0+3*1) >= cr(1,17+0));
  ASSUME(cw(1,0+3*1) >= cr(1,11+0));
  ASSUME(cw(1,0+3*1) >= cr(1,15+0));
  ASSUME(cw(1,0+3*1) >= cr(1,14+0));
  ASSUME(cw(1,0+3*1) >= cr(1,16+0));
  ASSUME(cw(1,0+3*1) >= cr(1,18+0));
  ASSUME(cw(1,0+3*1) >= cr(1,19+0));
  ASSUME(cw(1,0+3*1) >= cw(1,10+0));
  ASSUME(cw(1,0+3*1) >= cw(1,0+0));
  ASSUME(cw(1,0+3*1) >= cw(1,0+1));
  ASSUME(cw(1,0+3*1) >= cw(1,0+2));
  ASSUME(cw(1,0+3*1) >= cw(1,0+3));
  ASSUME(cw(1,0+3*1) >= cw(1,0+4));
  ASSUME(cw(1,0+3*1) >= cw(1,0+5));
  ASSUME(cw(1,0+3*1) >= cw(1,0+6));
  ASSUME(cw(1,0+3*1) >= cw(1,0+7));
  ASSUME(cw(1,0+3*1) >= cw(1,9+0));
  ASSUME(cw(1,0+3*1) >= cw(1,13+0));
  ASSUME(cw(1,0+3*1) >= cw(1,8+0));
  ASSUME(cw(1,0+3*1) >= cw(1,12+0));
  ASSUME(cw(1,0+3*1) >= cw(1,17+0));
  ASSUME(cw(1,0+3*1) >= cw(1,11+0));
  ASSUME(cw(1,0+3*1) >= cw(1,15+0));
  ASSUME(cw(1,0+3*1) >= cw(1,14+0));
  ASSUME(cw(1,0+3*1) >= cw(1,16+0));
  ASSUME(cw(1,0+3*1) >= cw(1,18+0));
  ASSUME(cw(1,0+3*1) >= cw(1,19+0));
  // Update
  caddr[1] = max(caddr[1],0);
  buff(1,0+3*1) = 1;
  mem(0+3*1,cw(1,0+3*1)) = 1;
  co(0+3*1,cw(1,0+3*1))+=1;
  delta(0+3*1,cw(1,0+3*1)) = -1;
  is(1,0+3*1) = iw(1,0+3*1);
  cs(1,0+3*1) = cw(1,0+3*1);
  ASSUME(creturn[1] >= cw(1,0+3*1));

  //   call void (...) @dmbsy(), !dbg !89
  // dumbsy: Guess
  old_cdy = cdy[1];
  cdy[1] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[1] >= old_cdy);
  ASSUME(cdy[1] >= cisb[1]);
  ASSUME(cdy[1] >= cdl[1]);
  ASSUME(cdy[1] >= cds[1]);
  ASSUME(cdy[1] >= cctrl[1]);
  ASSUME(cdy[1] >= cw(1,10+0));
  ASSUME(cdy[1] >= cw(1,0+0));
  ASSUME(cdy[1] >= cw(1,0+1));
  ASSUME(cdy[1] >= cw(1,0+2));
  ASSUME(cdy[1] >= cw(1,0+3));
  ASSUME(cdy[1] >= cw(1,0+4));
  ASSUME(cdy[1] >= cw(1,0+5));
  ASSUME(cdy[1] >= cw(1,0+6));
  ASSUME(cdy[1] >= cw(1,0+7));
  ASSUME(cdy[1] >= cw(1,9+0));
  ASSUME(cdy[1] >= cw(1,13+0));
  ASSUME(cdy[1] >= cw(1,8+0));
  ASSUME(cdy[1] >= cw(1,12+0));
  ASSUME(cdy[1] >= cw(1,17+0));
  ASSUME(cdy[1] >= cw(1,11+0));
  ASSUME(cdy[1] >= cw(1,15+0));
  ASSUME(cdy[1] >= cw(1,14+0));
  ASSUME(cdy[1] >= cw(1,16+0));
  ASSUME(cdy[1] >= cw(1,18+0));
  ASSUME(cdy[1] >= cw(1,19+0));
  ASSUME(cdy[1] >= cr(1,10+0));
  ASSUME(cdy[1] >= cr(1,0+0));
  ASSUME(cdy[1] >= cr(1,0+1));
  ASSUME(cdy[1] >= cr(1,0+2));
  ASSUME(cdy[1] >= cr(1,0+3));
  ASSUME(cdy[1] >= cr(1,0+4));
  ASSUME(cdy[1] >= cr(1,0+5));
  ASSUME(cdy[1] >= cr(1,0+6));
  ASSUME(cdy[1] >= cr(1,0+7));
  ASSUME(cdy[1] >= cr(1,9+0));
  ASSUME(cdy[1] >= cr(1,13+0));
  ASSUME(cdy[1] >= cr(1,8+0));
  ASSUME(cdy[1] >= cr(1,12+0));
  ASSUME(cdy[1] >= cr(1,17+0));
  ASSUME(cdy[1] >= cr(1,11+0));
  ASSUME(cdy[1] >= cr(1,15+0));
  ASSUME(cdy[1] >= cr(1,14+0));
  ASSUME(cdy[1] >= cr(1,16+0));
  ASSUME(cdy[1] >= cr(1,18+0));
  ASSUME(cdy[1] >= cr(1,19+0));
  ASSUME(creturn[1] >= cdy[1]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 2), metadata !66, metadata !DIExpression()), !dbg !90

  //   %1 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 2) acquire, align 8, !dbg !91
  // LD: Guess
  //   : Acquire
  old_cr = cr(1,0+2*1);
  cr(1,0+2*1) = get_rng(0,NCONTEXT-1);// 1 ASSIGN LDCOM _l34_c15
  // Check
  ASSUME(active[cr(1,0+2*1)] == 1);
  ASSUME(cr(1,0+2*1) >= iw(1,0+2*1));
  ASSUME(cr(1,0+2*1) >= 0);
  ASSUME(cr(1,0+2*1) >= cdy[1]);
  ASSUME(cr(1,0+2*1) >= cisb[1]);
  ASSUME(cr(1,0+2*1) >= cdl[1]);
  ASSUME(cr(1,0+2*1) >= cl[1]);
  ASSUME(cr(1,0+2*1) >= cx(1,0+2*1));
  ASSUME(cr(1,0+2*1) >= cs(1,10+0));
  ASSUME(cr(1,0+2*1) >= cs(1,0+0));
  ASSUME(cr(1,0+2*1) >= cs(1,0+1));
  ASSUME(cr(1,0+2*1) >= cs(1,0+2));
  ASSUME(cr(1,0+2*1) >= cs(1,0+3));
  ASSUME(cr(1,0+2*1) >= cs(1,0+4));
  ASSUME(cr(1,0+2*1) >= cs(1,0+5));
  ASSUME(cr(1,0+2*1) >= cs(1,0+6));
  ASSUME(cr(1,0+2*1) >= cs(1,0+7));
  ASSUME(cr(1,0+2*1) >= cs(1,9+0));
  ASSUME(cr(1,0+2*1) >= cs(1,13+0));
  ASSUME(cr(1,0+2*1) >= cs(1,8+0));
  ASSUME(cr(1,0+2*1) >= cs(1,12+0));
  ASSUME(cr(1,0+2*1) >= cs(1,17+0));
  ASSUME(cr(1,0+2*1) >= cs(1,11+0));
  ASSUME(cr(1,0+2*1) >= cs(1,15+0));
  ASSUME(cr(1,0+2*1) >= cs(1,14+0));
  ASSUME(cr(1,0+2*1) >= cs(1,16+0));
  ASSUME(cr(1,0+2*1) >= cs(1,18+0));
  ASSUME(cr(1,0+2*1) >= cs(1,19+0));
  // Update
  creg_r1 = cr(1,0+2*1);
  crmax(1,0+2*1) = max(crmax(1,0+2*1),cr(1,0+2*1));
  caddr[1] = max(caddr[1],0);
  if(cr(1,0+2*1) < cw(1,0+2*1)) {
    r1 = buff(1,0+2*1);
    ASSUME((!(( (cw(1,0+2*1) < 1) && (1 < crmax(1,0+2*1)) )))||(sforbid(0+2*1,1)> 0));
    ASSUME((!(( (cw(1,0+2*1) < 2) && (2 < crmax(1,0+2*1)) )))||(sforbid(0+2*1,2)> 0));
    ASSUME((!(( (cw(1,0+2*1) < 3) && (3 < crmax(1,0+2*1)) )))||(sforbid(0+2*1,3)> 0));
    ASSUME((!(( (cw(1,0+2*1) < 4) && (4 < crmax(1,0+2*1)) )))||(sforbid(0+2*1,4)> 0));
  } else {
    if(pw(1,0+2*1) != co(0+2*1,cr(1,0+2*1))) {
      ASSUME(cr(1,0+2*1) >= old_cr);
    }
    pw(1,0+2*1) = co(0+2*1,cr(1,0+2*1));
    r1 = mem(0+2*1,cr(1,0+2*1));
  }
  cl[1] = max(cl[1],cr(1,0+2*1));
  ASSUME(creturn[1] >= cr(1,0+2*1));

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !68, metadata !DIExpression()), !dbg !90

  //   %conv4 = trunc i64 %1 to i32, !dbg !92

  //   call void @llvm.dbg.value(metadata i32 %conv4, metadata !65, metadata !DIExpression()), !dbg !80

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 1), metadata !70, metadata !DIExpression()), !dbg !93

  //   %2 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 1) acquire, align 8, !dbg !94
  // LD: Guess
  //   : Acquire
  old_cr = cr(1,0+1*1);
  cr(1,0+1*1) = get_rng(0,NCONTEXT-1);// 1 ASSIGN LDCOM _l35_c15
  // Check
  ASSUME(active[cr(1,0+1*1)] == 1);
  ASSUME(cr(1,0+1*1) >= iw(1,0+1*1));
  ASSUME(cr(1,0+1*1) >= 0);
  ASSUME(cr(1,0+1*1) >= cdy[1]);
  ASSUME(cr(1,0+1*1) >= cisb[1]);
  ASSUME(cr(1,0+1*1) >= cdl[1]);
  ASSUME(cr(1,0+1*1) >= cl[1]);
  ASSUME(cr(1,0+1*1) >= cx(1,0+1*1));
  ASSUME(cr(1,0+1*1) >= cs(1,10+0));
  ASSUME(cr(1,0+1*1) >= cs(1,0+0));
  ASSUME(cr(1,0+1*1) >= cs(1,0+1));
  ASSUME(cr(1,0+1*1) >= cs(1,0+2));
  ASSUME(cr(1,0+1*1) >= cs(1,0+3));
  ASSUME(cr(1,0+1*1) >= cs(1,0+4));
  ASSUME(cr(1,0+1*1) >= cs(1,0+5));
  ASSUME(cr(1,0+1*1) >= cs(1,0+6));
  ASSUME(cr(1,0+1*1) >= cs(1,0+7));
  ASSUME(cr(1,0+1*1) >= cs(1,9+0));
  ASSUME(cr(1,0+1*1) >= cs(1,13+0));
  ASSUME(cr(1,0+1*1) >= cs(1,8+0));
  ASSUME(cr(1,0+1*1) >= cs(1,12+0));
  ASSUME(cr(1,0+1*1) >= cs(1,17+0));
  ASSUME(cr(1,0+1*1) >= cs(1,11+0));
  ASSUME(cr(1,0+1*1) >= cs(1,15+0));
  ASSUME(cr(1,0+1*1) >= cs(1,14+0));
  ASSUME(cr(1,0+1*1) >= cs(1,16+0));
  ASSUME(cr(1,0+1*1) >= cs(1,18+0));
  ASSUME(cr(1,0+1*1) >= cs(1,19+0));
  // Update
  creg_r2 = cr(1,0+1*1);
  crmax(1,0+1*1) = max(crmax(1,0+1*1),cr(1,0+1*1));
  caddr[1] = max(caddr[1],0);
  if(cr(1,0+1*1) < cw(1,0+1*1)) {
    r2 = buff(1,0+1*1);
    ASSUME((!(( (cw(1,0+1*1) < 1) && (1 < crmax(1,0+1*1)) )))||(sforbid(0+1*1,1)> 0));
    ASSUME((!(( (cw(1,0+1*1) < 2) && (2 < crmax(1,0+1*1)) )))||(sforbid(0+1*1,2)> 0));
    ASSUME((!(( (cw(1,0+1*1) < 3) && (3 < crmax(1,0+1*1)) )))||(sforbid(0+1*1,3)> 0));
    ASSUME((!(( (cw(1,0+1*1) < 4) && (4 < crmax(1,0+1*1)) )))||(sforbid(0+1*1,4)> 0));
  } else {
    if(pw(1,0+1*1) != co(0+1*1,cr(1,0+1*1))) {
      ASSUME(cr(1,0+1*1) >= old_cr);
    }
    pw(1,0+1*1) = co(0+1*1,cr(1,0+1*1));
    r2 = mem(0+1*1,cr(1,0+1*1));
  }
  cl[1] = max(cl[1],cr(1,0+1*1));
  ASSUME(creturn[1] >= cr(1,0+1*1));

  //   call void @llvm.dbg.value(metadata i64 %2, metadata !72, metadata !DIExpression()), !dbg !93

  //   %conv8 = trunc i64 %2 to i32, !dbg !95

  //   call void @llvm.dbg.value(metadata i32 %conv8, metadata !69, metadata !DIExpression()), !dbg !80

  //   call void (...) @dmbsy(), !dbg !96
  // dumbsy: Guess
  old_cdy = cdy[1];
  cdy[1] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[1] >= old_cdy);
  ASSUME(cdy[1] >= cisb[1]);
  ASSUME(cdy[1] >= cdl[1]);
  ASSUME(cdy[1] >= cds[1]);
  ASSUME(cdy[1] >= cctrl[1]);
  ASSUME(cdy[1] >= cw(1,10+0));
  ASSUME(cdy[1] >= cw(1,0+0));
  ASSUME(cdy[1] >= cw(1,0+1));
  ASSUME(cdy[1] >= cw(1,0+2));
  ASSUME(cdy[1] >= cw(1,0+3));
  ASSUME(cdy[1] >= cw(1,0+4));
  ASSUME(cdy[1] >= cw(1,0+5));
  ASSUME(cdy[1] >= cw(1,0+6));
  ASSUME(cdy[1] >= cw(1,0+7));
  ASSUME(cdy[1] >= cw(1,9+0));
  ASSUME(cdy[1] >= cw(1,13+0));
  ASSUME(cdy[1] >= cw(1,8+0));
  ASSUME(cdy[1] >= cw(1,12+0));
  ASSUME(cdy[1] >= cw(1,17+0));
  ASSUME(cdy[1] >= cw(1,11+0));
  ASSUME(cdy[1] >= cw(1,15+0));
  ASSUME(cdy[1] >= cw(1,14+0));
  ASSUME(cdy[1] >= cw(1,16+0));
  ASSUME(cdy[1] >= cw(1,18+0));
  ASSUME(cdy[1] >= cw(1,19+0));
  ASSUME(cdy[1] >= cr(1,10+0));
  ASSUME(cdy[1] >= cr(1,0+0));
  ASSUME(cdy[1] >= cr(1,0+1));
  ASSUME(cdy[1] >= cr(1,0+2));
  ASSUME(cdy[1] >= cr(1,0+3));
  ASSUME(cdy[1] >= cr(1,0+4));
  ASSUME(cdy[1] >= cr(1,0+5));
  ASSUME(cdy[1] >= cr(1,0+6));
  ASSUME(cdy[1] >= cr(1,0+7));
  ASSUME(cdy[1] >= cr(1,9+0));
  ASSUME(cdy[1] >= cr(1,13+0));
  ASSUME(cdy[1] >= cr(1,8+0));
  ASSUME(cdy[1] >= cr(1,12+0));
  ASSUME(cdy[1] >= cr(1,17+0));
  ASSUME(cdy[1] >= cr(1,11+0));
  ASSUME(cdy[1] >= cr(1,15+0));
  ASSUME(cdy[1] >= cr(1,14+0));
  ASSUME(cdy[1] >= cr(1,16+0));
  ASSUME(cdy[1] >= cr(1,18+0));
  ASSUME(cdy[1] >= cr(1,19+0));
  ASSUME(creturn[1] >= cdy[1]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 0), metadata !73, metadata !DIExpression()), !dbg !97

  //   call void @llvm.dbg.value(metadata i64 1, metadata !75, metadata !DIExpression()), !dbg !97

  //   store atomic i64 1, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !98
  // ST: Guess
  iw(1,0) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW _l37_c3
  old_cw = cw(1,0);
  cw(1,0) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM _l37_c3
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

  //   %cmp = icmp eq i32 %conv, 1, !dbg !99
  creg__r0__1_ = max(0,creg_r0);

  //   %conv11 = zext i1 %cmp to i32, !dbg !99

  //   call void @llvm.dbg.value(metadata i32 %conv11, metadata !76, metadata !DIExpression()), !dbg !80

  //   store i32 %conv11, i32* @atom_0_X0_1, align 4, !dbg !100, !tbaa !101
  // ST: Guess
  iw(1,8) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW _l39_c15
  old_cw = cw(1,8);
  cw(1,8) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM _l39_c15
  // Check
  ASSUME(active[iw(1,8)] == 1);
  ASSUME(active[cw(1,8)] == 1);
  ASSUME(sforbid(8,cw(1,8))== 0);
  ASSUME(iw(1,8) >= creg__r0__1_);
  ASSUME(iw(1,8) >= 0);
  ASSUME(cw(1,8) >= iw(1,8));
  ASSUME(cw(1,8) >= old_cw);
  ASSUME(cw(1,8) >= cr(1,8));
  ASSUME(cw(1,8) >= cl[1]);
  ASSUME(cw(1,8) >= cisb[1]);
  ASSUME(cw(1,8) >= cdy[1]);
  ASSUME(cw(1,8) >= cdl[1]);
  ASSUME(cw(1,8) >= cds[1]);
  ASSUME(cw(1,8) >= cctrl[1]);
  ASSUME(cw(1,8) >= caddr[1]);
  // Update
  caddr[1] = max(caddr[1],0);
  buff(1,8) = (r0==1);
  mem(8,cw(1,8)) = (r0==1);
  co(8,cw(1,8))+=1;
  delta(8,cw(1,8)) = -1;
  ASSUME(creturn[1] >= cw(1,8));

  //   %cmp12 = icmp eq i32 %conv4, 1, !dbg !105
  creg__r1__1_ = max(0,creg_r1);

  //   %conv13 = zext i1 %cmp12 to i32, !dbg !105

  //   call void @llvm.dbg.value(metadata i32 %conv13, metadata !77, metadata !DIExpression()), !dbg !80

  //   store i32 %conv13, i32* @atom_0_X3_1, align 4, !dbg !106, !tbaa !101
  // ST: Guess
  iw(1,9) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW _l41_c15
  old_cw = cw(1,9);
  cw(1,9) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM _l41_c15
  // Check
  ASSUME(active[iw(1,9)] == 1);
  ASSUME(active[cw(1,9)] == 1);
  ASSUME(sforbid(9,cw(1,9))== 0);
  ASSUME(iw(1,9) >= creg__r1__1_);
  ASSUME(iw(1,9) >= 0);
  ASSUME(cw(1,9) >= iw(1,9));
  ASSUME(cw(1,9) >= old_cw);
  ASSUME(cw(1,9) >= cr(1,9));
  ASSUME(cw(1,9) >= cl[1]);
  ASSUME(cw(1,9) >= cisb[1]);
  ASSUME(cw(1,9) >= cdy[1]);
  ASSUME(cw(1,9) >= cdl[1]);
  ASSUME(cw(1,9) >= cds[1]);
  ASSUME(cw(1,9) >= cctrl[1]);
  ASSUME(cw(1,9) >= caddr[1]);
  // Update
  caddr[1] = max(caddr[1],0);
  buff(1,9) = (r1==1);
  mem(9,cw(1,9)) = (r1==1);
  co(9,cw(1,9))+=1;
  delta(9,cw(1,9)) = -1;
  ASSUME(creturn[1] >= cw(1,9));

  //   %cmp14 = icmp eq i32 %conv8, 1, !dbg !107
  creg__r2__1_ = max(0,creg_r2);

  //   %conv15 = zext i1 %cmp14 to i32, !dbg !107

  //   call void @llvm.dbg.value(metadata i32 %conv15, metadata !78, metadata !DIExpression()), !dbg !80

  //   store i32 %conv15, i32* @atom_0_X5_1, align 4, !dbg !108, !tbaa !101
  // ST: Guess
  iw(1,10) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW _l43_c15
  old_cw = cw(1,10);
  cw(1,10) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM _l43_c15
  // Check
  ASSUME(active[iw(1,10)] == 1);
  ASSUME(active[cw(1,10)] == 1);
  ASSUME(sforbid(10,cw(1,10))== 0);
  ASSUME(iw(1,10) >= creg__r2__1_);
  ASSUME(iw(1,10) >= 0);
  ASSUME(cw(1,10) >= iw(1,10));
  ASSUME(cw(1,10) >= old_cw);
  ASSUME(cw(1,10) >= cr(1,10));
  ASSUME(cw(1,10) >= cl[1]);
  ASSUME(cw(1,10) >= cisb[1]);
  ASSUME(cw(1,10) >= cdy[1]);
  ASSUME(cw(1,10) >= cdl[1]);
  ASSUME(cw(1,10) >= cds[1]);
  ASSUME(cw(1,10) >= cctrl[1]);
  ASSUME(cw(1,10) >= caddr[1]);
  // Update
  caddr[1] = max(caddr[1],0);
  buff(1,10) = (r2==1);
  mem(10,cw(1,10)) = (r2==1);
  co(10,cw(1,10))+=1;
  delta(10,cw(1,10)) = -1;
  ASSUME(creturn[1] >= cw(1,10));

  //   ret i8* null, !dbg !109
  ret_thread_1 = (- 1);
  goto T1BLOCK_END;

T1BLOCK_END:

  // Dumping thread 2
  int ret_thread_2 = 0;
  cdy[2] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[2] >= cstart[2]);
T2BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !112, metadata !DIExpression()), !dbg !135

  //   br label %label_2, !dbg !81
  goto T2BLOCK1;

T2BLOCK1:
  //   call void @llvm.dbg.label(metadata !134), !dbg !137

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 3), metadata !114, metadata !DIExpression()), !dbg !138

  //   %0 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 3) acquire, align 8, !dbg !84
  // LD: Guess
  //   : Acquire
  old_cr = cr(2,0+3*1);
  cr(2,0+3*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN LDCOM _l49_c16
  // Check
  ASSUME(active[cr(2,0+3*1)] == 2);
  ASSUME(cr(2,0+3*1) >= iw(2,0+3*1));
  ASSUME(cr(2,0+3*1) >= 0);
  ASSUME(cr(2,0+3*1) >= cdy[2]);
  ASSUME(cr(2,0+3*1) >= cisb[2]);
  ASSUME(cr(2,0+3*1) >= cdl[2]);
  ASSUME(cr(2,0+3*1) >= cl[2]);
  ASSUME(cr(2,0+3*1) >= cx(2,0+3*1));
  ASSUME(cr(2,0+3*1) >= cs(2,10+0));
  ASSUME(cr(2,0+3*1) >= cs(2,0+0));
  ASSUME(cr(2,0+3*1) >= cs(2,0+1));
  ASSUME(cr(2,0+3*1) >= cs(2,0+2));
  ASSUME(cr(2,0+3*1) >= cs(2,0+3));
  ASSUME(cr(2,0+3*1) >= cs(2,0+4));
  ASSUME(cr(2,0+3*1) >= cs(2,0+5));
  ASSUME(cr(2,0+3*1) >= cs(2,0+6));
  ASSUME(cr(2,0+3*1) >= cs(2,0+7));
  ASSUME(cr(2,0+3*1) >= cs(2,9+0));
  ASSUME(cr(2,0+3*1) >= cs(2,13+0));
  ASSUME(cr(2,0+3*1) >= cs(2,8+0));
  ASSUME(cr(2,0+3*1) >= cs(2,12+0));
  ASSUME(cr(2,0+3*1) >= cs(2,17+0));
  ASSUME(cr(2,0+3*1) >= cs(2,11+0));
  ASSUME(cr(2,0+3*1) >= cs(2,15+0));
  ASSUME(cr(2,0+3*1) >= cs(2,14+0));
  ASSUME(cr(2,0+3*1) >= cs(2,16+0));
  ASSUME(cr(2,0+3*1) >= cs(2,18+0));
  ASSUME(cr(2,0+3*1) >= cs(2,19+0));
  // Update
  creg_r3 = cr(2,0+3*1);
  crmax(2,0+3*1) = max(crmax(2,0+3*1),cr(2,0+3*1));
  caddr[2] = max(caddr[2],0);
  if(cr(2,0+3*1) < cw(2,0+3*1)) {
    r3 = buff(2,0+3*1);
    ASSUME((!(( (cw(2,0+3*1) < 1) && (1 < crmax(2,0+3*1)) )))||(sforbid(0+3*1,1)> 0));
    ASSUME((!(( (cw(2,0+3*1) < 2) && (2 < crmax(2,0+3*1)) )))||(sforbid(0+3*1,2)> 0));
    ASSUME((!(( (cw(2,0+3*1) < 3) && (3 < crmax(2,0+3*1)) )))||(sforbid(0+3*1,3)> 0));
    ASSUME((!(( (cw(2,0+3*1) < 4) && (4 < crmax(2,0+3*1)) )))||(sforbid(0+3*1,4)> 0));
  } else {
    if(pw(2,0+3*1) != co(0+3*1,cr(2,0+3*1))) {
      ASSUME(cr(2,0+3*1) >= old_cr);
    }
    pw(2,0+3*1) = co(0+3*1,cr(2,0+3*1));
    r3 = mem(0+3*1,cr(2,0+3*1));
  }
  cl[2] = max(cl[2],cr(2,0+3*1));
  ASSUME(creturn[2] >= cr(2,0+3*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !116, metadata !DIExpression()), !dbg !138

  //   %conv = trunc i64 %0 to i32, !dbg !85

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !113, metadata !DIExpression()), !dbg !135

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 6), metadata !118, metadata !DIExpression()), !dbg !141

  //   %1 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 6) acquire, align 8, !dbg !87
  // LD: Guess
  //   : Acquire
  old_cr = cr(2,0+6*1);
  cr(2,0+6*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN LDCOM _l50_c16
  // Check
  ASSUME(active[cr(2,0+6*1)] == 2);
  ASSUME(cr(2,0+6*1) >= iw(2,0+6*1));
  ASSUME(cr(2,0+6*1) >= 0);
  ASSUME(cr(2,0+6*1) >= cdy[2]);
  ASSUME(cr(2,0+6*1) >= cisb[2]);
  ASSUME(cr(2,0+6*1) >= cdl[2]);
  ASSUME(cr(2,0+6*1) >= cl[2]);
  ASSUME(cr(2,0+6*1) >= cx(2,0+6*1));
  ASSUME(cr(2,0+6*1) >= cs(2,10+0));
  ASSUME(cr(2,0+6*1) >= cs(2,0+0));
  ASSUME(cr(2,0+6*1) >= cs(2,0+1));
  ASSUME(cr(2,0+6*1) >= cs(2,0+2));
  ASSUME(cr(2,0+6*1) >= cs(2,0+3));
  ASSUME(cr(2,0+6*1) >= cs(2,0+4));
  ASSUME(cr(2,0+6*1) >= cs(2,0+5));
  ASSUME(cr(2,0+6*1) >= cs(2,0+6));
  ASSUME(cr(2,0+6*1) >= cs(2,0+7));
  ASSUME(cr(2,0+6*1) >= cs(2,9+0));
  ASSUME(cr(2,0+6*1) >= cs(2,13+0));
  ASSUME(cr(2,0+6*1) >= cs(2,8+0));
  ASSUME(cr(2,0+6*1) >= cs(2,12+0));
  ASSUME(cr(2,0+6*1) >= cs(2,17+0));
  ASSUME(cr(2,0+6*1) >= cs(2,11+0));
  ASSUME(cr(2,0+6*1) >= cs(2,15+0));
  ASSUME(cr(2,0+6*1) >= cs(2,14+0));
  ASSUME(cr(2,0+6*1) >= cs(2,16+0));
  ASSUME(cr(2,0+6*1) >= cs(2,18+0));
  ASSUME(cr(2,0+6*1) >= cs(2,19+0));
  // Update
  creg_r4 = cr(2,0+6*1);
  crmax(2,0+6*1) = max(crmax(2,0+6*1),cr(2,0+6*1));
  caddr[2] = max(caddr[2],0);
  if(cr(2,0+6*1) < cw(2,0+6*1)) {
    r4 = buff(2,0+6*1);
    ASSUME((!(( (cw(2,0+6*1) < 1) && (1 < crmax(2,0+6*1)) )))||(sforbid(0+6*1,1)> 0));
    ASSUME((!(( (cw(2,0+6*1) < 2) && (2 < crmax(2,0+6*1)) )))||(sforbid(0+6*1,2)> 0));
    ASSUME((!(( (cw(2,0+6*1) < 3) && (3 < crmax(2,0+6*1)) )))||(sforbid(0+6*1,3)> 0));
    ASSUME((!(( (cw(2,0+6*1) < 4) && (4 < crmax(2,0+6*1)) )))||(sforbid(0+6*1,4)> 0));
  } else {
    if(pw(2,0+6*1) != co(0+6*1,cr(2,0+6*1))) {
      ASSUME(cr(2,0+6*1) >= old_cr);
    }
    pw(2,0+6*1) = co(0+6*1,cr(2,0+6*1));
    r4 = mem(0+6*1,cr(2,0+6*1));
  }
  cl[2] = max(cl[2],cr(2,0+6*1));
  ASSUME(creturn[2] >= cr(2,0+6*1));

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !120, metadata !DIExpression()), !dbg !141

  //   %conv4 = trunc i64 %1 to i32, !dbg !88

  //   call void @llvm.dbg.value(metadata i32 %conv4, metadata !117, metadata !DIExpression()), !dbg !135

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 0), metadata !122, metadata !DIExpression()), !dbg !144

  //   %2 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !90
  // LD: Guess
  old_cr = cr(2,0);
  cr(2,0) = get_rng(0,NCONTEXT-1);// 2 ASSIGN LDCOM _l51_c16
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

  //   call void @llvm.dbg.value(metadata i64 %2, metadata !124, metadata !DIExpression()), !dbg !144

  //   %conv8 = trunc i64 %2 to i32, !dbg !91

  //   call void @llvm.dbg.value(metadata i32 %conv8, metadata !121, metadata !DIExpression()), !dbg !135

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 5), metadata !125, metadata !DIExpression()), !dbg !147

  //   call void @llvm.dbg.value(metadata i64 1, metadata !127, metadata !DIExpression()), !dbg !147

  //   store atomic i64 1, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 5) monotonic, align 8, !dbg !93
  // ST: Guess
  iw(2,0+5*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW _l52_c3
  old_cw = cw(2,0+5*1);
  cw(2,0+5*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM _l52_c3
  // Check
  ASSUME(active[iw(2,0+5*1)] == 2);
  ASSUME(active[cw(2,0+5*1)] == 2);
  ASSUME(sforbid(0+5*1,cw(2,0+5*1))== 0);
  ASSUME(iw(2,0+5*1) >= 0);
  ASSUME(iw(2,0+5*1) >= 0);
  ASSUME(cw(2,0+5*1) >= iw(2,0+5*1));
  ASSUME(cw(2,0+5*1) >= old_cw);
  ASSUME(cw(2,0+5*1) >= cr(2,0+5*1));
  ASSUME(cw(2,0+5*1) >= cl[2]);
  ASSUME(cw(2,0+5*1) >= cisb[2]);
  ASSUME(cw(2,0+5*1) >= cdy[2]);
  ASSUME(cw(2,0+5*1) >= cdl[2]);
  ASSUME(cw(2,0+5*1) >= cds[2]);
  ASSUME(cw(2,0+5*1) >= cctrl[2]);
  ASSUME(cw(2,0+5*1) >= caddr[2]);
  // Update
  caddr[2] = max(caddr[2],0);
  buff(2,0+5*1) = 1;
  mem(0+5*1,cw(2,0+5*1)) = 1;
  co(0+5*1,cw(2,0+5*1))+=1;
  delta(0+5*1,cw(2,0+5*1)) = -1;
  ASSUME(creturn[2] >= cw(2,0+5*1));

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 2), metadata !128, metadata !DIExpression()), !dbg !149

  //   call void @llvm.dbg.value(metadata i64 1, metadata !130, metadata !DIExpression()), !dbg !149

  //   store atomic i64 1, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 2) release, align 8, !dbg !95
  // ST: Guess
  //   : Release
  iw(2,0+2*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW _l53_c3
  old_cw = cw(2,0+2*1);
  cw(2,0+2*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM _l53_c3
  // Check
  ASSUME(active[iw(2,0+2*1)] == 2);
  ASSUME(active[cw(2,0+2*1)] == 2);
  ASSUME(sforbid(0+2*1,cw(2,0+2*1))== 0);
  ASSUME(iw(2,0+2*1) >= 0);
  ASSUME(iw(2,0+2*1) >= 0);
  ASSUME(cw(2,0+2*1) >= iw(2,0+2*1));
  ASSUME(cw(2,0+2*1) >= old_cw);
  ASSUME(cw(2,0+2*1) >= cr(2,0+2*1));
  ASSUME(cw(2,0+2*1) >= cl[2]);
  ASSUME(cw(2,0+2*1) >= cisb[2]);
  ASSUME(cw(2,0+2*1) >= cdy[2]);
  ASSUME(cw(2,0+2*1) >= cdl[2]);
  ASSUME(cw(2,0+2*1) >= cds[2]);
  ASSUME(cw(2,0+2*1) >= cctrl[2]);
  ASSUME(cw(2,0+2*1) >= caddr[2]);
  ASSUME(cw(2,0+2*1) >= cr(2,10+0));
  ASSUME(cw(2,0+2*1) >= cr(2,0+0));
  ASSUME(cw(2,0+2*1) >= cr(2,0+1));
  ASSUME(cw(2,0+2*1) >= cr(2,0+2));
  ASSUME(cw(2,0+2*1) >= cr(2,0+3));
  ASSUME(cw(2,0+2*1) >= cr(2,0+4));
  ASSUME(cw(2,0+2*1) >= cr(2,0+5));
  ASSUME(cw(2,0+2*1) >= cr(2,0+6));
  ASSUME(cw(2,0+2*1) >= cr(2,0+7));
  ASSUME(cw(2,0+2*1) >= cr(2,9+0));
  ASSUME(cw(2,0+2*1) >= cr(2,13+0));
  ASSUME(cw(2,0+2*1) >= cr(2,8+0));
  ASSUME(cw(2,0+2*1) >= cr(2,12+0));
  ASSUME(cw(2,0+2*1) >= cr(2,17+0));
  ASSUME(cw(2,0+2*1) >= cr(2,11+0));
  ASSUME(cw(2,0+2*1) >= cr(2,15+0));
  ASSUME(cw(2,0+2*1) >= cr(2,14+0));
  ASSUME(cw(2,0+2*1) >= cr(2,16+0));
  ASSUME(cw(2,0+2*1) >= cr(2,18+0));
  ASSUME(cw(2,0+2*1) >= cr(2,19+0));
  ASSUME(cw(2,0+2*1) >= cw(2,10+0));
  ASSUME(cw(2,0+2*1) >= cw(2,0+0));
  ASSUME(cw(2,0+2*1) >= cw(2,0+1));
  ASSUME(cw(2,0+2*1) >= cw(2,0+2));
  ASSUME(cw(2,0+2*1) >= cw(2,0+3));
  ASSUME(cw(2,0+2*1) >= cw(2,0+4));
  ASSUME(cw(2,0+2*1) >= cw(2,0+5));
  ASSUME(cw(2,0+2*1) >= cw(2,0+6));
  ASSUME(cw(2,0+2*1) >= cw(2,0+7));
  ASSUME(cw(2,0+2*1) >= cw(2,9+0));
  ASSUME(cw(2,0+2*1) >= cw(2,13+0));
  ASSUME(cw(2,0+2*1) >= cw(2,8+0));
  ASSUME(cw(2,0+2*1) >= cw(2,12+0));
  ASSUME(cw(2,0+2*1) >= cw(2,17+0));
  ASSUME(cw(2,0+2*1) >= cw(2,11+0));
  ASSUME(cw(2,0+2*1) >= cw(2,15+0));
  ASSUME(cw(2,0+2*1) >= cw(2,14+0));
  ASSUME(cw(2,0+2*1) >= cw(2,16+0));
  ASSUME(cw(2,0+2*1) >= cw(2,18+0));
  ASSUME(cw(2,0+2*1) >= cw(2,19+0));
  // Update
  caddr[2] = max(caddr[2],0);
  buff(2,0+2*1) = 1;
  mem(0+2*1,cw(2,0+2*1)) = 1;
  co(0+2*1,cw(2,0+2*1))+=1;
  delta(0+2*1,cw(2,0+2*1)) = -1;
  is(2,0+2*1) = iw(2,0+2*1);
  cs(2,0+2*1) = cw(2,0+2*1);
  ASSUME(creturn[2] >= cw(2,0+2*1));

  //   %cmp = icmp eq i32 %conv8, 1, !dbg !96
  creg__r5__1_ = max(0,creg_r5);

  //   %conv11 = zext i1 %cmp to i32, !dbg !96

  //   call void @llvm.dbg.value(metadata i32 %conv11, metadata !131, metadata !DIExpression()), !dbg !135

  //   store i32 %conv11, i32* @atom_1_X4_1, align 4, !dbg !97, !tbaa !98
  // ST: Guess
  iw(2,11) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW _l55_c15
  old_cw = cw(2,11);
  cw(2,11) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM _l55_c15
  // Check
  ASSUME(active[iw(2,11)] == 2);
  ASSUME(active[cw(2,11)] == 2);
  ASSUME(sforbid(11,cw(2,11))== 0);
  ASSUME(iw(2,11) >= creg__r5__1_);
  ASSUME(iw(2,11) >= 0);
  ASSUME(cw(2,11) >= iw(2,11));
  ASSUME(cw(2,11) >= old_cw);
  ASSUME(cw(2,11) >= cr(2,11));
  ASSUME(cw(2,11) >= cl[2]);
  ASSUME(cw(2,11) >= cisb[2]);
  ASSUME(cw(2,11) >= cdy[2]);
  ASSUME(cw(2,11) >= cdl[2]);
  ASSUME(cw(2,11) >= cds[2]);
  ASSUME(cw(2,11) >= cctrl[2]);
  ASSUME(cw(2,11) >= caddr[2]);
  // Update
  caddr[2] = max(caddr[2],0);
  buff(2,11) = (r5==1);
  mem(11,cw(2,11)) = (r5==1);
  co(11,cw(2,11))+=1;
  delta(11,cw(2,11)) = -1;
  ASSUME(creturn[2] >= cw(2,11));

  //   %cmp12 = icmp eq i32 %conv, 1, !dbg !102
  creg__r3__1_ = max(0,creg_r3);

  //   %conv13 = zext i1 %cmp12 to i32, !dbg !102

  //   call void @llvm.dbg.value(metadata i32 %conv13, metadata !132, metadata !DIExpression()), !dbg !135

  //   store i32 %conv13, i32* @atom_1_X0_1, align 4, !dbg !103, !tbaa !98
  // ST: Guess
  iw(2,12) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW _l57_c15
  old_cw = cw(2,12);
  cw(2,12) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM _l57_c15
  // Check
  ASSUME(active[iw(2,12)] == 2);
  ASSUME(active[cw(2,12)] == 2);
  ASSUME(sforbid(12,cw(2,12))== 0);
  ASSUME(iw(2,12) >= creg__r3__1_);
  ASSUME(iw(2,12) >= 0);
  ASSUME(cw(2,12) >= iw(2,12));
  ASSUME(cw(2,12) >= old_cw);
  ASSUME(cw(2,12) >= cr(2,12));
  ASSUME(cw(2,12) >= cl[2]);
  ASSUME(cw(2,12) >= cisb[2]);
  ASSUME(cw(2,12) >= cdy[2]);
  ASSUME(cw(2,12) >= cdl[2]);
  ASSUME(cw(2,12) >= cds[2]);
  ASSUME(cw(2,12) >= cctrl[2]);
  ASSUME(cw(2,12) >= caddr[2]);
  // Update
  caddr[2] = max(caddr[2],0);
  buff(2,12) = (r3==1);
  mem(12,cw(2,12)) = (r3==1);
  co(12,cw(2,12))+=1;
  delta(12,cw(2,12)) = -1;
  ASSUME(creturn[2] >= cw(2,12));

  //   %cmp14 = icmp eq i32 %conv4, 1, !dbg !104
  creg__r4__1_ = max(0,creg_r4);

  //   %conv15 = zext i1 %cmp14 to i32, !dbg !104

  //   call void @llvm.dbg.value(metadata i32 %conv15, metadata !133, metadata !DIExpression()), !dbg !135

  //   store i32 %conv15, i32* @atom_1_X2_1, align 4, !dbg !105, !tbaa !98
  // ST: Guess
  iw(2,13) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW _l59_c15
  old_cw = cw(2,13);
  cw(2,13) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM _l59_c15
  // Check
  ASSUME(active[iw(2,13)] == 2);
  ASSUME(active[cw(2,13)] == 2);
  ASSUME(sforbid(13,cw(2,13))== 0);
  ASSUME(iw(2,13) >= creg__r4__1_);
  ASSUME(iw(2,13) >= 0);
  ASSUME(cw(2,13) >= iw(2,13));
  ASSUME(cw(2,13) >= old_cw);
  ASSUME(cw(2,13) >= cr(2,13));
  ASSUME(cw(2,13) >= cl[2]);
  ASSUME(cw(2,13) >= cisb[2]);
  ASSUME(cw(2,13) >= cdy[2]);
  ASSUME(cw(2,13) >= cdl[2]);
  ASSUME(cw(2,13) >= cds[2]);
  ASSUME(cw(2,13) >= cctrl[2]);
  ASSUME(cw(2,13) >= caddr[2]);
  // Update
  caddr[2] = max(caddr[2],0);
  buff(2,13) = (r4==1);
  mem(13,cw(2,13)) = (r4==1);
  co(13,cw(2,13))+=1;
  delta(13,cw(2,13)) = -1;
  ASSUME(creturn[2] >= cw(2,13));

  //   ret i8* null, !dbg !106
  ret_thread_2 = (- 1);
  goto T2BLOCK_END;

T2BLOCK_END:

  // Dumping thread 3
  int ret_thread_3 = 0;
  cdy[3] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[3] >= cstart[3]);
T3BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !160, metadata !DIExpression()), !dbg !183

  //   br label %label_3, !dbg !81
  goto T3BLOCK1;

T3BLOCK1:
  //   call void @llvm.dbg.label(metadata !182), !dbg !185

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 5), metadata !162, metadata !DIExpression()), !dbg !186

  //   %0 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 5) monotonic, align 8, !dbg !84
  // LD: Guess
  old_cr = cr(3,0+5*1);
  cr(3,0+5*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN LDCOM _l65_c16
  // Check
  ASSUME(active[cr(3,0+5*1)] == 3);
  ASSUME(cr(3,0+5*1) >= iw(3,0+5*1));
  ASSUME(cr(3,0+5*1) >= 0);
  ASSUME(cr(3,0+5*1) >= cdy[3]);
  ASSUME(cr(3,0+5*1) >= cisb[3]);
  ASSUME(cr(3,0+5*1) >= cdl[3]);
  ASSUME(cr(3,0+5*1) >= cl[3]);
  // Update
  creg_r6 = cr(3,0+5*1);
  crmax(3,0+5*1) = max(crmax(3,0+5*1),cr(3,0+5*1));
  caddr[3] = max(caddr[3],0);
  if(cr(3,0+5*1) < cw(3,0+5*1)) {
    r6 = buff(3,0+5*1);
    ASSUME((!(( (cw(3,0+5*1) < 1) && (1 < crmax(3,0+5*1)) )))||(sforbid(0+5*1,1)> 0));
    ASSUME((!(( (cw(3,0+5*1) < 2) && (2 < crmax(3,0+5*1)) )))||(sforbid(0+5*1,2)> 0));
    ASSUME((!(( (cw(3,0+5*1) < 3) && (3 < crmax(3,0+5*1)) )))||(sforbid(0+5*1,3)> 0));
    ASSUME((!(( (cw(3,0+5*1) < 4) && (4 < crmax(3,0+5*1)) )))||(sforbid(0+5*1,4)> 0));
  } else {
    if(pw(3,0+5*1) != co(0+5*1,cr(3,0+5*1))) {
      ASSUME(cr(3,0+5*1) >= old_cr);
    }
    pw(3,0+5*1) = co(0+5*1,cr(3,0+5*1));
    r6 = mem(0+5*1,cr(3,0+5*1));
  }
  ASSUME(creturn[3] >= cr(3,0+5*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !164, metadata !DIExpression()), !dbg !186

  //   %conv = trunc i64 %0 to i32, !dbg !85

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !161, metadata !DIExpression()), !dbg !183

  //   call void (...) @dmbsy(), !dbg !86
  // dumbsy: Guess
  old_cdy = cdy[3];
  cdy[3] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[3] >= old_cdy);
  ASSUME(cdy[3] >= cisb[3]);
  ASSUME(cdy[3] >= cdl[3]);
  ASSUME(cdy[3] >= cds[3]);
  ASSUME(cdy[3] >= cctrl[3]);
  ASSUME(cdy[3] >= cw(3,10+0));
  ASSUME(cdy[3] >= cw(3,0+0));
  ASSUME(cdy[3] >= cw(3,0+1));
  ASSUME(cdy[3] >= cw(3,0+2));
  ASSUME(cdy[3] >= cw(3,0+3));
  ASSUME(cdy[3] >= cw(3,0+4));
  ASSUME(cdy[3] >= cw(3,0+5));
  ASSUME(cdy[3] >= cw(3,0+6));
  ASSUME(cdy[3] >= cw(3,0+7));
  ASSUME(cdy[3] >= cw(3,9+0));
  ASSUME(cdy[3] >= cw(3,13+0));
  ASSUME(cdy[3] >= cw(3,8+0));
  ASSUME(cdy[3] >= cw(3,12+0));
  ASSUME(cdy[3] >= cw(3,17+0));
  ASSUME(cdy[3] >= cw(3,11+0));
  ASSUME(cdy[3] >= cw(3,15+0));
  ASSUME(cdy[3] >= cw(3,14+0));
  ASSUME(cdy[3] >= cw(3,16+0));
  ASSUME(cdy[3] >= cw(3,18+0));
  ASSUME(cdy[3] >= cw(3,19+0));
  ASSUME(cdy[3] >= cr(3,10+0));
  ASSUME(cdy[3] >= cr(3,0+0));
  ASSUME(cdy[3] >= cr(3,0+1));
  ASSUME(cdy[3] >= cr(3,0+2));
  ASSUME(cdy[3] >= cr(3,0+3));
  ASSUME(cdy[3] >= cr(3,0+4));
  ASSUME(cdy[3] >= cr(3,0+5));
  ASSUME(cdy[3] >= cr(3,0+6));
  ASSUME(cdy[3] >= cr(3,0+7));
  ASSUME(cdy[3] >= cr(3,9+0));
  ASSUME(cdy[3] >= cr(3,13+0));
  ASSUME(cdy[3] >= cr(3,8+0));
  ASSUME(cdy[3] >= cr(3,12+0));
  ASSUME(cdy[3] >= cr(3,17+0));
  ASSUME(cdy[3] >= cr(3,11+0));
  ASSUME(cdy[3] >= cr(3,15+0));
  ASSUME(cdy[3] >= cr(3,14+0));
  ASSUME(cdy[3] >= cr(3,16+0));
  ASSUME(cdy[3] >= cr(3,18+0));
  ASSUME(cdy[3] >= cr(3,19+0));
  ASSUME(creturn[3] >= cdy[3]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 6), metadata !165, metadata !DIExpression()), !dbg !190

  //   call void @llvm.dbg.value(metadata i64 1, metadata !167, metadata !DIExpression()), !dbg !190

  //   store atomic i64 1, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 6) release, align 8, !dbg !88
  // ST: Guess
  //   : Release
  iw(3,0+6*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STIW _l67_c3
  old_cw = cw(3,0+6*1);
  cw(3,0+6*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STCOM _l67_c3
  // Check
  ASSUME(active[iw(3,0+6*1)] == 3);
  ASSUME(active[cw(3,0+6*1)] == 3);
  ASSUME(sforbid(0+6*1,cw(3,0+6*1))== 0);
  ASSUME(iw(3,0+6*1) >= 0);
  ASSUME(iw(3,0+6*1) >= 0);
  ASSUME(cw(3,0+6*1) >= iw(3,0+6*1));
  ASSUME(cw(3,0+6*1) >= old_cw);
  ASSUME(cw(3,0+6*1) >= cr(3,0+6*1));
  ASSUME(cw(3,0+6*1) >= cl[3]);
  ASSUME(cw(3,0+6*1) >= cisb[3]);
  ASSUME(cw(3,0+6*1) >= cdy[3]);
  ASSUME(cw(3,0+6*1) >= cdl[3]);
  ASSUME(cw(3,0+6*1) >= cds[3]);
  ASSUME(cw(3,0+6*1) >= cctrl[3]);
  ASSUME(cw(3,0+6*1) >= caddr[3]);
  ASSUME(cw(3,0+6*1) >= cr(3,10+0));
  ASSUME(cw(3,0+6*1) >= cr(3,0+0));
  ASSUME(cw(3,0+6*1) >= cr(3,0+1));
  ASSUME(cw(3,0+6*1) >= cr(3,0+2));
  ASSUME(cw(3,0+6*1) >= cr(3,0+3));
  ASSUME(cw(3,0+6*1) >= cr(3,0+4));
  ASSUME(cw(3,0+6*1) >= cr(3,0+5));
  ASSUME(cw(3,0+6*1) >= cr(3,0+6));
  ASSUME(cw(3,0+6*1) >= cr(3,0+7));
  ASSUME(cw(3,0+6*1) >= cr(3,9+0));
  ASSUME(cw(3,0+6*1) >= cr(3,13+0));
  ASSUME(cw(3,0+6*1) >= cr(3,8+0));
  ASSUME(cw(3,0+6*1) >= cr(3,12+0));
  ASSUME(cw(3,0+6*1) >= cr(3,17+0));
  ASSUME(cw(3,0+6*1) >= cr(3,11+0));
  ASSUME(cw(3,0+6*1) >= cr(3,15+0));
  ASSUME(cw(3,0+6*1) >= cr(3,14+0));
  ASSUME(cw(3,0+6*1) >= cr(3,16+0));
  ASSUME(cw(3,0+6*1) >= cr(3,18+0));
  ASSUME(cw(3,0+6*1) >= cr(3,19+0));
  ASSUME(cw(3,0+6*1) >= cw(3,10+0));
  ASSUME(cw(3,0+6*1) >= cw(3,0+0));
  ASSUME(cw(3,0+6*1) >= cw(3,0+1));
  ASSUME(cw(3,0+6*1) >= cw(3,0+2));
  ASSUME(cw(3,0+6*1) >= cw(3,0+3));
  ASSUME(cw(3,0+6*1) >= cw(3,0+4));
  ASSUME(cw(3,0+6*1) >= cw(3,0+5));
  ASSUME(cw(3,0+6*1) >= cw(3,0+6));
  ASSUME(cw(3,0+6*1) >= cw(3,0+7));
  ASSUME(cw(3,0+6*1) >= cw(3,9+0));
  ASSUME(cw(3,0+6*1) >= cw(3,13+0));
  ASSUME(cw(3,0+6*1) >= cw(3,8+0));
  ASSUME(cw(3,0+6*1) >= cw(3,12+0));
  ASSUME(cw(3,0+6*1) >= cw(3,17+0));
  ASSUME(cw(3,0+6*1) >= cw(3,11+0));
  ASSUME(cw(3,0+6*1) >= cw(3,15+0));
  ASSUME(cw(3,0+6*1) >= cw(3,14+0));
  ASSUME(cw(3,0+6*1) >= cw(3,16+0));
  ASSUME(cw(3,0+6*1) >= cw(3,18+0));
  ASSUME(cw(3,0+6*1) >= cw(3,19+0));
  // Update
  caddr[3] = max(caddr[3],0);
  buff(3,0+6*1) = 1;
  mem(0+6*1,cw(3,0+6*1)) = 1;
  co(0+6*1,cw(3,0+6*1))+=1;
  delta(0+6*1,cw(3,0+6*1)) = -1;
  is(3,0+6*1) = iw(3,0+6*1);
  cs(3,0+6*1) = cw(3,0+6*1);
  ASSUME(creturn[3] >= cw(3,0+6*1));

  //   call void (...) @dmbsy(), !dbg !89
  // dumbsy: Guess
  old_cdy = cdy[3];
  cdy[3] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[3] >= old_cdy);
  ASSUME(cdy[3] >= cisb[3]);
  ASSUME(cdy[3] >= cdl[3]);
  ASSUME(cdy[3] >= cds[3]);
  ASSUME(cdy[3] >= cctrl[3]);
  ASSUME(cdy[3] >= cw(3,10+0));
  ASSUME(cdy[3] >= cw(3,0+0));
  ASSUME(cdy[3] >= cw(3,0+1));
  ASSUME(cdy[3] >= cw(3,0+2));
  ASSUME(cdy[3] >= cw(3,0+3));
  ASSUME(cdy[3] >= cw(3,0+4));
  ASSUME(cdy[3] >= cw(3,0+5));
  ASSUME(cdy[3] >= cw(3,0+6));
  ASSUME(cdy[3] >= cw(3,0+7));
  ASSUME(cdy[3] >= cw(3,9+0));
  ASSUME(cdy[3] >= cw(3,13+0));
  ASSUME(cdy[3] >= cw(3,8+0));
  ASSUME(cdy[3] >= cw(3,12+0));
  ASSUME(cdy[3] >= cw(3,17+0));
  ASSUME(cdy[3] >= cw(3,11+0));
  ASSUME(cdy[3] >= cw(3,15+0));
  ASSUME(cdy[3] >= cw(3,14+0));
  ASSUME(cdy[3] >= cw(3,16+0));
  ASSUME(cdy[3] >= cw(3,18+0));
  ASSUME(cdy[3] >= cw(3,19+0));
  ASSUME(cdy[3] >= cr(3,10+0));
  ASSUME(cdy[3] >= cr(3,0+0));
  ASSUME(cdy[3] >= cr(3,0+1));
  ASSUME(cdy[3] >= cr(3,0+2));
  ASSUME(cdy[3] >= cr(3,0+3));
  ASSUME(cdy[3] >= cr(3,0+4));
  ASSUME(cdy[3] >= cr(3,0+5));
  ASSUME(cdy[3] >= cr(3,0+6));
  ASSUME(cdy[3] >= cr(3,0+7));
  ASSUME(cdy[3] >= cr(3,9+0));
  ASSUME(cdy[3] >= cr(3,13+0));
  ASSUME(cdy[3] >= cr(3,8+0));
  ASSUME(cdy[3] >= cr(3,12+0));
  ASSUME(cdy[3] >= cr(3,17+0));
  ASSUME(cdy[3] >= cr(3,11+0));
  ASSUME(cdy[3] >= cr(3,15+0));
  ASSUME(cdy[3] >= cr(3,14+0));
  ASSUME(cdy[3] >= cr(3,16+0));
  ASSUME(cdy[3] >= cr(3,18+0));
  ASSUME(cdy[3] >= cr(3,19+0));
  ASSUME(creturn[3] >= cdy[3]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 2), metadata !169, metadata !DIExpression()), !dbg !193

  //   %1 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 2) acquire, align 8, !dbg !91
  // LD: Guess
  //   : Acquire
  old_cr = cr(3,0+2*1);
  cr(3,0+2*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN LDCOM _l69_c16
  // Check
  ASSUME(active[cr(3,0+2*1)] == 3);
  ASSUME(cr(3,0+2*1) >= iw(3,0+2*1));
  ASSUME(cr(3,0+2*1) >= 0);
  ASSUME(cr(3,0+2*1) >= cdy[3]);
  ASSUME(cr(3,0+2*1) >= cisb[3]);
  ASSUME(cr(3,0+2*1) >= cdl[3]);
  ASSUME(cr(3,0+2*1) >= cl[3]);
  ASSUME(cr(3,0+2*1) >= cx(3,0+2*1));
  ASSUME(cr(3,0+2*1) >= cs(3,10+0));
  ASSUME(cr(3,0+2*1) >= cs(3,0+0));
  ASSUME(cr(3,0+2*1) >= cs(3,0+1));
  ASSUME(cr(3,0+2*1) >= cs(3,0+2));
  ASSUME(cr(3,0+2*1) >= cs(3,0+3));
  ASSUME(cr(3,0+2*1) >= cs(3,0+4));
  ASSUME(cr(3,0+2*1) >= cs(3,0+5));
  ASSUME(cr(3,0+2*1) >= cs(3,0+6));
  ASSUME(cr(3,0+2*1) >= cs(3,0+7));
  ASSUME(cr(3,0+2*1) >= cs(3,9+0));
  ASSUME(cr(3,0+2*1) >= cs(3,13+0));
  ASSUME(cr(3,0+2*1) >= cs(3,8+0));
  ASSUME(cr(3,0+2*1) >= cs(3,12+0));
  ASSUME(cr(3,0+2*1) >= cs(3,17+0));
  ASSUME(cr(3,0+2*1) >= cs(3,11+0));
  ASSUME(cr(3,0+2*1) >= cs(3,15+0));
  ASSUME(cr(3,0+2*1) >= cs(3,14+0));
  ASSUME(cr(3,0+2*1) >= cs(3,16+0));
  ASSUME(cr(3,0+2*1) >= cs(3,18+0));
  ASSUME(cr(3,0+2*1) >= cs(3,19+0));
  // Update
  creg_r7 = cr(3,0+2*1);
  crmax(3,0+2*1) = max(crmax(3,0+2*1),cr(3,0+2*1));
  caddr[3] = max(caddr[3],0);
  if(cr(3,0+2*1) < cw(3,0+2*1)) {
    r7 = buff(3,0+2*1);
    ASSUME((!(( (cw(3,0+2*1) < 1) && (1 < crmax(3,0+2*1)) )))||(sforbid(0+2*1,1)> 0));
    ASSUME((!(( (cw(3,0+2*1) < 2) && (2 < crmax(3,0+2*1)) )))||(sforbid(0+2*1,2)> 0));
    ASSUME((!(( (cw(3,0+2*1) < 3) && (3 < crmax(3,0+2*1)) )))||(sforbid(0+2*1,3)> 0));
    ASSUME((!(( (cw(3,0+2*1) < 4) && (4 < crmax(3,0+2*1)) )))||(sforbid(0+2*1,4)> 0));
  } else {
    if(pw(3,0+2*1) != co(0+2*1,cr(3,0+2*1))) {
      ASSUME(cr(3,0+2*1) >= old_cr);
    }
    pw(3,0+2*1) = co(0+2*1,cr(3,0+2*1));
    r7 = mem(0+2*1,cr(3,0+2*1));
  }
  cl[3] = max(cl[3],cr(3,0+2*1));
  ASSUME(creturn[3] >= cr(3,0+2*1));

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !171, metadata !DIExpression()), !dbg !193

  //   %conv4 = trunc i64 %1 to i32, !dbg !92

  //   call void @llvm.dbg.value(metadata i32 %conv4, metadata !168, metadata !DIExpression()), !dbg !183

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 1), metadata !173, metadata !DIExpression()), !dbg !196

  //   %2 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 1) acquire, align 8, !dbg !94
  // LD: Guess
  //   : Acquire
  old_cr = cr(3,0+1*1);
  cr(3,0+1*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN LDCOM _l70_c16
  // Check
  ASSUME(active[cr(3,0+1*1)] == 3);
  ASSUME(cr(3,0+1*1) >= iw(3,0+1*1));
  ASSUME(cr(3,0+1*1) >= 0);
  ASSUME(cr(3,0+1*1) >= cdy[3]);
  ASSUME(cr(3,0+1*1) >= cisb[3]);
  ASSUME(cr(3,0+1*1) >= cdl[3]);
  ASSUME(cr(3,0+1*1) >= cl[3]);
  ASSUME(cr(3,0+1*1) >= cx(3,0+1*1));
  ASSUME(cr(3,0+1*1) >= cs(3,10+0));
  ASSUME(cr(3,0+1*1) >= cs(3,0+0));
  ASSUME(cr(3,0+1*1) >= cs(3,0+1));
  ASSUME(cr(3,0+1*1) >= cs(3,0+2));
  ASSUME(cr(3,0+1*1) >= cs(3,0+3));
  ASSUME(cr(3,0+1*1) >= cs(3,0+4));
  ASSUME(cr(3,0+1*1) >= cs(3,0+5));
  ASSUME(cr(3,0+1*1) >= cs(3,0+6));
  ASSUME(cr(3,0+1*1) >= cs(3,0+7));
  ASSUME(cr(3,0+1*1) >= cs(3,9+0));
  ASSUME(cr(3,0+1*1) >= cs(3,13+0));
  ASSUME(cr(3,0+1*1) >= cs(3,8+0));
  ASSUME(cr(3,0+1*1) >= cs(3,12+0));
  ASSUME(cr(3,0+1*1) >= cs(3,17+0));
  ASSUME(cr(3,0+1*1) >= cs(3,11+0));
  ASSUME(cr(3,0+1*1) >= cs(3,15+0));
  ASSUME(cr(3,0+1*1) >= cs(3,14+0));
  ASSUME(cr(3,0+1*1) >= cs(3,16+0));
  ASSUME(cr(3,0+1*1) >= cs(3,18+0));
  ASSUME(cr(3,0+1*1) >= cs(3,19+0));
  // Update
  creg_r8 = cr(3,0+1*1);
  crmax(3,0+1*1) = max(crmax(3,0+1*1),cr(3,0+1*1));
  caddr[3] = max(caddr[3],0);
  if(cr(3,0+1*1) < cw(3,0+1*1)) {
    r8 = buff(3,0+1*1);
    ASSUME((!(( (cw(3,0+1*1) < 1) && (1 < crmax(3,0+1*1)) )))||(sforbid(0+1*1,1)> 0));
    ASSUME((!(( (cw(3,0+1*1) < 2) && (2 < crmax(3,0+1*1)) )))||(sforbid(0+1*1,2)> 0));
    ASSUME((!(( (cw(3,0+1*1) < 3) && (3 < crmax(3,0+1*1)) )))||(sforbid(0+1*1,3)> 0));
    ASSUME((!(( (cw(3,0+1*1) < 4) && (4 < crmax(3,0+1*1)) )))||(sforbid(0+1*1,4)> 0));
  } else {
    if(pw(3,0+1*1) != co(0+1*1,cr(3,0+1*1))) {
      ASSUME(cr(3,0+1*1) >= old_cr);
    }
    pw(3,0+1*1) = co(0+1*1,cr(3,0+1*1));
    r8 = mem(0+1*1,cr(3,0+1*1));
  }
  cl[3] = max(cl[3],cr(3,0+1*1));
  ASSUME(creturn[3] >= cr(3,0+1*1));

  //   call void @llvm.dbg.value(metadata i64 %2, metadata !175, metadata !DIExpression()), !dbg !196

  //   %conv8 = trunc i64 %2 to i32, !dbg !95

  //   call void @llvm.dbg.value(metadata i32 %conv8, metadata !172, metadata !DIExpression()), !dbg !183

  //   call void (...) @dmbsy(), !dbg !96
  // dumbsy: Guess
  old_cdy = cdy[3];
  cdy[3] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[3] >= old_cdy);
  ASSUME(cdy[3] >= cisb[3]);
  ASSUME(cdy[3] >= cdl[3]);
  ASSUME(cdy[3] >= cds[3]);
  ASSUME(cdy[3] >= cctrl[3]);
  ASSUME(cdy[3] >= cw(3,10+0));
  ASSUME(cdy[3] >= cw(3,0+0));
  ASSUME(cdy[3] >= cw(3,0+1));
  ASSUME(cdy[3] >= cw(3,0+2));
  ASSUME(cdy[3] >= cw(3,0+3));
  ASSUME(cdy[3] >= cw(3,0+4));
  ASSUME(cdy[3] >= cw(3,0+5));
  ASSUME(cdy[3] >= cw(3,0+6));
  ASSUME(cdy[3] >= cw(3,0+7));
  ASSUME(cdy[3] >= cw(3,9+0));
  ASSUME(cdy[3] >= cw(3,13+0));
  ASSUME(cdy[3] >= cw(3,8+0));
  ASSUME(cdy[3] >= cw(3,12+0));
  ASSUME(cdy[3] >= cw(3,17+0));
  ASSUME(cdy[3] >= cw(3,11+0));
  ASSUME(cdy[3] >= cw(3,15+0));
  ASSUME(cdy[3] >= cw(3,14+0));
  ASSUME(cdy[3] >= cw(3,16+0));
  ASSUME(cdy[3] >= cw(3,18+0));
  ASSUME(cdy[3] >= cw(3,19+0));
  ASSUME(cdy[3] >= cr(3,10+0));
  ASSUME(cdy[3] >= cr(3,0+0));
  ASSUME(cdy[3] >= cr(3,0+1));
  ASSUME(cdy[3] >= cr(3,0+2));
  ASSUME(cdy[3] >= cr(3,0+3));
  ASSUME(cdy[3] >= cr(3,0+4));
  ASSUME(cdy[3] >= cr(3,0+5));
  ASSUME(cdy[3] >= cr(3,0+6));
  ASSUME(cdy[3] >= cr(3,0+7));
  ASSUME(cdy[3] >= cr(3,9+0));
  ASSUME(cdy[3] >= cr(3,13+0));
  ASSUME(cdy[3] >= cr(3,8+0));
  ASSUME(cdy[3] >= cr(3,12+0));
  ASSUME(cdy[3] >= cr(3,17+0));
  ASSUME(cdy[3] >= cr(3,11+0));
  ASSUME(cdy[3] >= cr(3,15+0));
  ASSUME(cdy[3] >= cr(3,14+0));
  ASSUME(cdy[3] >= cr(3,16+0));
  ASSUME(cdy[3] >= cr(3,18+0));
  ASSUME(cdy[3] >= cr(3,19+0));
  ASSUME(creturn[3] >= cdy[3]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 7), metadata !176, metadata !DIExpression()), !dbg !200

  //   call void @llvm.dbg.value(metadata i64 1, metadata !178, metadata !DIExpression()), !dbg !200

  //   store atomic i64 1, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 7) monotonic, align 8, !dbg !98
  // ST: Guess
  iw(3,0+7*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STIW _l72_c3
  old_cw = cw(3,0+7*1);
  cw(3,0+7*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STCOM _l72_c3
  // Check
  ASSUME(active[iw(3,0+7*1)] == 3);
  ASSUME(active[cw(3,0+7*1)] == 3);
  ASSUME(sforbid(0+7*1,cw(3,0+7*1))== 0);
  ASSUME(iw(3,0+7*1) >= 0);
  ASSUME(iw(3,0+7*1) >= 0);
  ASSUME(cw(3,0+7*1) >= iw(3,0+7*1));
  ASSUME(cw(3,0+7*1) >= old_cw);
  ASSUME(cw(3,0+7*1) >= cr(3,0+7*1));
  ASSUME(cw(3,0+7*1) >= cl[3]);
  ASSUME(cw(3,0+7*1) >= cisb[3]);
  ASSUME(cw(3,0+7*1) >= cdy[3]);
  ASSUME(cw(3,0+7*1) >= cdl[3]);
  ASSUME(cw(3,0+7*1) >= cds[3]);
  ASSUME(cw(3,0+7*1) >= cctrl[3]);
  ASSUME(cw(3,0+7*1) >= caddr[3]);
  // Update
  caddr[3] = max(caddr[3],0);
  buff(3,0+7*1) = 1;
  mem(0+7*1,cw(3,0+7*1)) = 1;
  co(0+7*1,cw(3,0+7*1))+=1;
  delta(0+7*1,cw(3,0+7*1)) = -1;
  ASSUME(creturn[3] >= cw(3,0+7*1));

  //   %cmp = icmp eq i32 %conv, 1, !dbg !99
  creg__r6__1_ = max(0,creg_r6);

  //   %conv11 = zext i1 %cmp to i32, !dbg !99

  //   call void @llvm.dbg.value(metadata i32 %conv11, metadata !179, metadata !DIExpression()), !dbg !183

  //   store i32 %conv11, i32* @atom_2_X0_1, align 4, !dbg !100, !tbaa !101
  // ST: Guess
  iw(3,14) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STIW _l74_c15
  old_cw = cw(3,14);
  cw(3,14) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STCOM _l74_c15
  // Check
  ASSUME(active[iw(3,14)] == 3);
  ASSUME(active[cw(3,14)] == 3);
  ASSUME(sforbid(14,cw(3,14))== 0);
  ASSUME(iw(3,14) >= creg__r6__1_);
  ASSUME(iw(3,14) >= 0);
  ASSUME(cw(3,14) >= iw(3,14));
  ASSUME(cw(3,14) >= old_cw);
  ASSUME(cw(3,14) >= cr(3,14));
  ASSUME(cw(3,14) >= cl[3]);
  ASSUME(cw(3,14) >= cisb[3]);
  ASSUME(cw(3,14) >= cdy[3]);
  ASSUME(cw(3,14) >= cdl[3]);
  ASSUME(cw(3,14) >= cds[3]);
  ASSUME(cw(3,14) >= cctrl[3]);
  ASSUME(cw(3,14) >= caddr[3]);
  // Update
  caddr[3] = max(caddr[3],0);
  buff(3,14) = (r6==1);
  mem(14,cw(3,14)) = (r6==1);
  co(14,cw(3,14))+=1;
  delta(14,cw(3,14)) = -1;
  ASSUME(creturn[3] >= cw(3,14));

  //   %cmp12 = icmp eq i32 %conv4, 1, !dbg !105
  creg__r7__1_ = max(0,creg_r7);

  //   %conv13 = zext i1 %cmp12 to i32, !dbg !105

  //   call void @llvm.dbg.value(metadata i32 %conv13, metadata !180, metadata !DIExpression()), !dbg !183

  //   store i32 %conv13, i32* @atom_2_X3_1, align 4, !dbg !106, !tbaa !101
  // ST: Guess
  iw(3,15) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STIW _l76_c15
  old_cw = cw(3,15);
  cw(3,15) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STCOM _l76_c15
  // Check
  ASSUME(active[iw(3,15)] == 3);
  ASSUME(active[cw(3,15)] == 3);
  ASSUME(sforbid(15,cw(3,15))== 0);
  ASSUME(iw(3,15) >= creg__r7__1_);
  ASSUME(iw(3,15) >= 0);
  ASSUME(cw(3,15) >= iw(3,15));
  ASSUME(cw(3,15) >= old_cw);
  ASSUME(cw(3,15) >= cr(3,15));
  ASSUME(cw(3,15) >= cl[3]);
  ASSUME(cw(3,15) >= cisb[3]);
  ASSUME(cw(3,15) >= cdy[3]);
  ASSUME(cw(3,15) >= cdl[3]);
  ASSUME(cw(3,15) >= cds[3]);
  ASSUME(cw(3,15) >= cctrl[3]);
  ASSUME(cw(3,15) >= caddr[3]);
  // Update
  caddr[3] = max(caddr[3],0);
  buff(3,15) = (r7==1);
  mem(15,cw(3,15)) = (r7==1);
  co(15,cw(3,15))+=1;
  delta(15,cw(3,15)) = -1;
  ASSUME(creturn[3] >= cw(3,15));

  //   %cmp14 = icmp eq i32 %conv8, 1, !dbg !107
  creg__r8__1_ = max(0,creg_r8);

  //   %conv15 = zext i1 %cmp14 to i32, !dbg !107

  //   call void @llvm.dbg.value(metadata i32 %conv15, metadata !181, metadata !DIExpression()), !dbg !183

  //   store i32 %conv15, i32* @atom_2_X5_1, align 4, !dbg !108, !tbaa !101
  // ST: Guess
  iw(3,16) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STIW _l78_c15
  old_cw = cw(3,16);
  cw(3,16) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STCOM _l78_c15
  // Check
  ASSUME(active[iw(3,16)] == 3);
  ASSUME(active[cw(3,16)] == 3);
  ASSUME(sforbid(16,cw(3,16))== 0);
  ASSUME(iw(3,16) >= creg__r8__1_);
  ASSUME(iw(3,16) >= 0);
  ASSUME(cw(3,16) >= iw(3,16));
  ASSUME(cw(3,16) >= old_cw);
  ASSUME(cw(3,16) >= cr(3,16));
  ASSUME(cw(3,16) >= cl[3]);
  ASSUME(cw(3,16) >= cisb[3]);
  ASSUME(cw(3,16) >= cdy[3]);
  ASSUME(cw(3,16) >= cdl[3]);
  ASSUME(cw(3,16) >= cds[3]);
  ASSUME(cw(3,16) >= cctrl[3]);
  ASSUME(cw(3,16) >= caddr[3]);
  // Update
  caddr[3] = max(caddr[3],0);
  buff(3,16) = (r8==1);
  mem(16,cw(3,16)) = (r8==1);
  co(16,cw(3,16))+=1;
  delta(16,cw(3,16)) = -1;
  ASSUME(creturn[3] >= cw(3,16));

  //   ret i8* null, !dbg !109
  ret_thread_3 = (- 1);
  goto T3BLOCK_END;

T3BLOCK_END:

  // Dumping thread 4
  int ret_thread_4 = 0;
  cdy[4] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[4] >= cstart[4]);
T4BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !211, metadata !DIExpression()), !dbg !234

  //   br label %label_4, !dbg !81
  goto T4BLOCK1;

T4BLOCK1:
  //   call void @llvm.dbg.label(metadata !233), !dbg !236

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 3), metadata !213, metadata !DIExpression()), !dbg !237

  //   %0 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 3) acquire, align 8, !dbg !84
  // LD: Guess
  //   : Acquire
  old_cr = cr(4,0+3*1);
  cr(4,0+3*1) = get_rng(0,NCONTEXT-1);// 4 ASSIGN LDCOM _l84_c16
  // Check
  ASSUME(active[cr(4,0+3*1)] == 4);
  ASSUME(cr(4,0+3*1) >= iw(4,0+3*1));
  ASSUME(cr(4,0+3*1) >= 0);
  ASSUME(cr(4,0+3*1) >= cdy[4]);
  ASSUME(cr(4,0+3*1) >= cisb[4]);
  ASSUME(cr(4,0+3*1) >= cdl[4]);
  ASSUME(cr(4,0+3*1) >= cl[4]);
  ASSUME(cr(4,0+3*1) >= cx(4,0+3*1));
  ASSUME(cr(4,0+3*1) >= cs(4,10+0));
  ASSUME(cr(4,0+3*1) >= cs(4,0+0));
  ASSUME(cr(4,0+3*1) >= cs(4,0+1));
  ASSUME(cr(4,0+3*1) >= cs(4,0+2));
  ASSUME(cr(4,0+3*1) >= cs(4,0+3));
  ASSUME(cr(4,0+3*1) >= cs(4,0+4));
  ASSUME(cr(4,0+3*1) >= cs(4,0+5));
  ASSUME(cr(4,0+3*1) >= cs(4,0+6));
  ASSUME(cr(4,0+3*1) >= cs(4,0+7));
  ASSUME(cr(4,0+3*1) >= cs(4,9+0));
  ASSUME(cr(4,0+3*1) >= cs(4,13+0));
  ASSUME(cr(4,0+3*1) >= cs(4,8+0));
  ASSUME(cr(4,0+3*1) >= cs(4,12+0));
  ASSUME(cr(4,0+3*1) >= cs(4,17+0));
  ASSUME(cr(4,0+3*1) >= cs(4,11+0));
  ASSUME(cr(4,0+3*1) >= cs(4,15+0));
  ASSUME(cr(4,0+3*1) >= cs(4,14+0));
  ASSUME(cr(4,0+3*1) >= cs(4,16+0));
  ASSUME(cr(4,0+3*1) >= cs(4,18+0));
  ASSUME(cr(4,0+3*1) >= cs(4,19+0));
  // Update
  creg_r9 = cr(4,0+3*1);
  crmax(4,0+3*1) = max(crmax(4,0+3*1),cr(4,0+3*1));
  caddr[4] = max(caddr[4],0);
  if(cr(4,0+3*1) < cw(4,0+3*1)) {
    r9 = buff(4,0+3*1);
    ASSUME((!(( (cw(4,0+3*1) < 1) && (1 < crmax(4,0+3*1)) )))||(sforbid(0+3*1,1)> 0));
    ASSUME((!(( (cw(4,0+3*1) < 2) && (2 < crmax(4,0+3*1)) )))||(sforbid(0+3*1,2)> 0));
    ASSUME((!(( (cw(4,0+3*1) < 3) && (3 < crmax(4,0+3*1)) )))||(sforbid(0+3*1,3)> 0));
    ASSUME((!(( (cw(4,0+3*1) < 4) && (4 < crmax(4,0+3*1)) )))||(sforbid(0+3*1,4)> 0));
  } else {
    if(pw(4,0+3*1) != co(0+3*1,cr(4,0+3*1))) {
      ASSUME(cr(4,0+3*1) >= old_cr);
    }
    pw(4,0+3*1) = co(0+3*1,cr(4,0+3*1));
    r9 = mem(0+3*1,cr(4,0+3*1));
  }
  cl[4] = max(cl[4],cr(4,0+3*1));
  ASSUME(creturn[4] >= cr(4,0+3*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !215, metadata !DIExpression()), !dbg !237

  //   %conv = trunc i64 %0 to i32, !dbg !85

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !212, metadata !DIExpression()), !dbg !234

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 6), metadata !217, metadata !DIExpression()), !dbg !240

  //   %1 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 6) acquire, align 8, !dbg !87
  // LD: Guess
  //   : Acquire
  old_cr = cr(4,0+6*1);
  cr(4,0+6*1) = get_rng(0,NCONTEXT-1);// 4 ASSIGN LDCOM _l85_c16
  // Check
  ASSUME(active[cr(4,0+6*1)] == 4);
  ASSUME(cr(4,0+6*1) >= iw(4,0+6*1));
  ASSUME(cr(4,0+6*1) >= 0);
  ASSUME(cr(4,0+6*1) >= cdy[4]);
  ASSUME(cr(4,0+6*1) >= cisb[4]);
  ASSUME(cr(4,0+6*1) >= cdl[4]);
  ASSUME(cr(4,0+6*1) >= cl[4]);
  ASSUME(cr(4,0+6*1) >= cx(4,0+6*1));
  ASSUME(cr(4,0+6*1) >= cs(4,10+0));
  ASSUME(cr(4,0+6*1) >= cs(4,0+0));
  ASSUME(cr(4,0+6*1) >= cs(4,0+1));
  ASSUME(cr(4,0+6*1) >= cs(4,0+2));
  ASSUME(cr(4,0+6*1) >= cs(4,0+3));
  ASSUME(cr(4,0+6*1) >= cs(4,0+4));
  ASSUME(cr(4,0+6*1) >= cs(4,0+5));
  ASSUME(cr(4,0+6*1) >= cs(4,0+6));
  ASSUME(cr(4,0+6*1) >= cs(4,0+7));
  ASSUME(cr(4,0+6*1) >= cs(4,9+0));
  ASSUME(cr(4,0+6*1) >= cs(4,13+0));
  ASSUME(cr(4,0+6*1) >= cs(4,8+0));
  ASSUME(cr(4,0+6*1) >= cs(4,12+0));
  ASSUME(cr(4,0+6*1) >= cs(4,17+0));
  ASSUME(cr(4,0+6*1) >= cs(4,11+0));
  ASSUME(cr(4,0+6*1) >= cs(4,15+0));
  ASSUME(cr(4,0+6*1) >= cs(4,14+0));
  ASSUME(cr(4,0+6*1) >= cs(4,16+0));
  ASSUME(cr(4,0+6*1) >= cs(4,18+0));
  ASSUME(cr(4,0+6*1) >= cs(4,19+0));
  // Update
  creg_r10 = cr(4,0+6*1);
  crmax(4,0+6*1) = max(crmax(4,0+6*1),cr(4,0+6*1));
  caddr[4] = max(caddr[4],0);
  if(cr(4,0+6*1) < cw(4,0+6*1)) {
    r10 = buff(4,0+6*1);
    ASSUME((!(( (cw(4,0+6*1) < 1) && (1 < crmax(4,0+6*1)) )))||(sforbid(0+6*1,1)> 0));
    ASSUME((!(( (cw(4,0+6*1) < 2) && (2 < crmax(4,0+6*1)) )))||(sforbid(0+6*1,2)> 0));
    ASSUME((!(( (cw(4,0+6*1) < 3) && (3 < crmax(4,0+6*1)) )))||(sforbid(0+6*1,3)> 0));
    ASSUME((!(( (cw(4,0+6*1) < 4) && (4 < crmax(4,0+6*1)) )))||(sforbid(0+6*1,4)> 0));
  } else {
    if(pw(4,0+6*1) != co(0+6*1,cr(4,0+6*1))) {
      ASSUME(cr(4,0+6*1) >= old_cr);
    }
    pw(4,0+6*1) = co(0+6*1,cr(4,0+6*1));
    r10 = mem(0+6*1,cr(4,0+6*1));
  }
  cl[4] = max(cl[4],cr(4,0+6*1));
  ASSUME(creturn[4] >= cr(4,0+6*1));

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !219, metadata !DIExpression()), !dbg !240

  //   %conv4 = trunc i64 %1 to i32, !dbg !88

  //   call void @llvm.dbg.value(metadata i32 %conv4, metadata !216, metadata !DIExpression()), !dbg !234

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 7), metadata !221, metadata !DIExpression()), !dbg !243

  //   %2 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 7) monotonic, align 8, !dbg !90
  // LD: Guess
  old_cr = cr(4,0+7*1);
  cr(4,0+7*1) = get_rng(0,NCONTEXT-1);// 4 ASSIGN LDCOM _l86_c16
  // Check
  ASSUME(active[cr(4,0+7*1)] == 4);
  ASSUME(cr(4,0+7*1) >= iw(4,0+7*1));
  ASSUME(cr(4,0+7*1) >= 0);
  ASSUME(cr(4,0+7*1) >= cdy[4]);
  ASSUME(cr(4,0+7*1) >= cisb[4]);
  ASSUME(cr(4,0+7*1) >= cdl[4]);
  ASSUME(cr(4,0+7*1) >= cl[4]);
  // Update
  creg_r11 = cr(4,0+7*1);
  crmax(4,0+7*1) = max(crmax(4,0+7*1),cr(4,0+7*1));
  caddr[4] = max(caddr[4],0);
  if(cr(4,0+7*1) < cw(4,0+7*1)) {
    r11 = buff(4,0+7*1);
    ASSUME((!(( (cw(4,0+7*1) < 1) && (1 < crmax(4,0+7*1)) )))||(sforbid(0+7*1,1)> 0));
    ASSUME((!(( (cw(4,0+7*1) < 2) && (2 < crmax(4,0+7*1)) )))||(sforbid(0+7*1,2)> 0));
    ASSUME((!(( (cw(4,0+7*1) < 3) && (3 < crmax(4,0+7*1)) )))||(sforbid(0+7*1,3)> 0));
    ASSUME((!(( (cw(4,0+7*1) < 4) && (4 < crmax(4,0+7*1)) )))||(sforbid(0+7*1,4)> 0));
  } else {
    if(pw(4,0+7*1) != co(0+7*1,cr(4,0+7*1))) {
      ASSUME(cr(4,0+7*1) >= old_cr);
    }
    pw(4,0+7*1) = co(0+7*1,cr(4,0+7*1));
    r11 = mem(0+7*1,cr(4,0+7*1));
  }
  ASSUME(creturn[4] >= cr(4,0+7*1));

  //   call void @llvm.dbg.value(metadata i64 %2, metadata !223, metadata !DIExpression()), !dbg !243

  //   %conv8 = trunc i64 %2 to i32, !dbg !91

  //   call void @llvm.dbg.value(metadata i32 %conv8, metadata !220, metadata !DIExpression()), !dbg !234

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 4), metadata !224, metadata !DIExpression()), !dbg !246

  //   call void @llvm.dbg.value(metadata i64 1, metadata !226, metadata !DIExpression()), !dbg !246

  //   store atomic i64 1, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 4) monotonic, align 8, !dbg !93
  // ST: Guess
  iw(4,0+4*1) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STIW _l87_c3
  old_cw = cw(4,0+4*1);
  cw(4,0+4*1) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STCOM _l87_c3
  // Check
  ASSUME(active[iw(4,0+4*1)] == 4);
  ASSUME(active[cw(4,0+4*1)] == 4);
  ASSUME(sforbid(0+4*1,cw(4,0+4*1))== 0);
  ASSUME(iw(4,0+4*1) >= 0);
  ASSUME(iw(4,0+4*1) >= 0);
  ASSUME(cw(4,0+4*1) >= iw(4,0+4*1));
  ASSUME(cw(4,0+4*1) >= old_cw);
  ASSUME(cw(4,0+4*1) >= cr(4,0+4*1));
  ASSUME(cw(4,0+4*1) >= cl[4]);
  ASSUME(cw(4,0+4*1) >= cisb[4]);
  ASSUME(cw(4,0+4*1) >= cdy[4]);
  ASSUME(cw(4,0+4*1) >= cdl[4]);
  ASSUME(cw(4,0+4*1) >= cds[4]);
  ASSUME(cw(4,0+4*1) >= cctrl[4]);
  ASSUME(cw(4,0+4*1) >= caddr[4]);
  // Update
  caddr[4] = max(caddr[4],0);
  buff(4,0+4*1) = 1;
  mem(0+4*1,cw(4,0+4*1)) = 1;
  co(0+4*1,cw(4,0+4*1))+=1;
  delta(0+4*1,cw(4,0+4*1)) = -1;
  ASSUME(creturn[4] >= cw(4,0+4*1));

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 1), metadata !227, metadata !DIExpression()), !dbg !248

  //   call void @llvm.dbg.value(metadata i64 1, metadata !229, metadata !DIExpression()), !dbg !248

  //   store atomic i64 1, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 1) release, align 8, !dbg !95
  // ST: Guess
  //   : Release
  iw(4,0+1*1) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STIW _l88_c3
  old_cw = cw(4,0+1*1);
  cw(4,0+1*1) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STCOM _l88_c3
  // Check
  ASSUME(active[iw(4,0+1*1)] == 4);
  ASSUME(active[cw(4,0+1*1)] == 4);
  ASSUME(sforbid(0+1*1,cw(4,0+1*1))== 0);
  ASSUME(iw(4,0+1*1) >= 0);
  ASSUME(iw(4,0+1*1) >= 0);
  ASSUME(cw(4,0+1*1) >= iw(4,0+1*1));
  ASSUME(cw(4,0+1*1) >= old_cw);
  ASSUME(cw(4,0+1*1) >= cr(4,0+1*1));
  ASSUME(cw(4,0+1*1) >= cl[4]);
  ASSUME(cw(4,0+1*1) >= cisb[4]);
  ASSUME(cw(4,0+1*1) >= cdy[4]);
  ASSUME(cw(4,0+1*1) >= cdl[4]);
  ASSUME(cw(4,0+1*1) >= cds[4]);
  ASSUME(cw(4,0+1*1) >= cctrl[4]);
  ASSUME(cw(4,0+1*1) >= caddr[4]);
  ASSUME(cw(4,0+1*1) >= cr(4,10+0));
  ASSUME(cw(4,0+1*1) >= cr(4,0+0));
  ASSUME(cw(4,0+1*1) >= cr(4,0+1));
  ASSUME(cw(4,0+1*1) >= cr(4,0+2));
  ASSUME(cw(4,0+1*1) >= cr(4,0+3));
  ASSUME(cw(4,0+1*1) >= cr(4,0+4));
  ASSUME(cw(4,0+1*1) >= cr(4,0+5));
  ASSUME(cw(4,0+1*1) >= cr(4,0+6));
  ASSUME(cw(4,0+1*1) >= cr(4,0+7));
  ASSUME(cw(4,0+1*1) >= cr(4,9+0));
  ASSUME(cw(4,0+1*1) >= cr(4,13+0));
  ASSUME(cw(4,0+1*1) >= cr(4,8+0));
  ASSUME(cw(4,0+1*1) >= cr(4,12+0));
  ASSUME(cw(4,0+1*1) >= cr(4,17+0));
  ASSUME(cw(4,0+1*1) >= cr(4,11+0));
  ASSUME(cw(4,0+1*1) >= cr(4,15+0));
  ASSUME(cw(4,0+1*1) >= cr(4,14+0));
  ASSUME(cw(4,0+1*1) >= cr(4,16+0));
  ASSUME(cw(4,0+1*1) >= cr(4,18+0));
  ASSUME(cw(4,0+1*1) >= cr(4,19+0));
  ASSUME(cw(4,0+1*1) >= cw(4,10+0));
  ASSUME(cw(4,0+1*1) >= cw(4,0+0));
  ASSUME(cw(4,0+1*1) >= cw(4,0+1));
  ASSUME(cw(4,0+1*1) >= cw(4,0+2));
  ASSUME(cw(4,0+1*1) >= cw(4,0+3));
  ASSUME(cw(4,0+1*1) >= cw(4,0+4));
  ASSUME(cw(4,0+1*1) >= cw(4,0+5));
  ASSUME(cw(4,0+1*1) >= cw(4,0+6));
  ASSUME(cw(4,0+1*1) >= cw(4,0+7));
  ASSUME(cw(4,0+1*1) >= cw(4,9+0));
  ASSUME(cw(4,0+1*1) >= cw(4,13+0));
  ASSUME(cw(4,0+1*1) >= cw(4,8+0));
  ASSUME(cw(4,0+1*1) >= cw(4,12+0));
  ASSUME(cw(4,0+1*1) >= cw(4,17+0));
  ASSUME(cw(4,0+1*1) >= cw(4,11+0));
  ASSUME(cw(4,0+1*1) >= cw(4,15+0));
  ASSUME(cw(4,0+1*1) >= cw(4,14+0));
  ASSUME(cw(4,0+1*1) >= cw(4,16+0));
  ASSUME(cw(4,0+1*1) >= cw(4,18+0));
  ASSUME(cw(4,0+1*1) >= cw(4,19+0));
  // Update
  caddr[4] = max(caddr[4],0);
  buff(4,0+1*1) = 1;
  mem(0+1*1,cw(4,0+1*1)) = 1;
  co(0+1*1,cw(4,0+1*1))+=1;
  delta(0+1*1,cw(4,0+1*1)) = -1;
  is(4,0+1*1) = iw(4,0+1*1);
  cs(4,0+1*1) = cw(4,0+1*1);
  ASSUME(creturn[4] >= cw(4,0+1*1));

  //   %cmp = icmp eq i32 %conv8, 1, !dbg !96
  creg__r11__1_ = max(0,creg_r11);

  //   %conv11 = zext i1 %cmp to i32, !dbg !96

  //   call void @llvm.dbg.value(metadata i32 %conv11, metadata !230, metadata !DIExpression()), !dbg !234

  //   store i32 %conv11, i32* @atom_3_X4_1, align 4, !dbg !97, !tbaa !98
  // ST: Guess
  iw(4,17) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STIW _l90_c15
  old_cw = cw(4,17);
  cw(4,17) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STCOM _l90_c15
  // Check
  ASSUME(active[iw(4,17)] == 4);
  ASSUME(active[cw(4,17)] == 4);
  ASSUME(sforbid(17,cw(4,17))== 0);
  ASSUME(iw(4,17) >= creg__r11__1_);
  ASSUME(iw(4,17) >= 0);
  ASSUME(cw(4,17) >= iw(4,17));
  ASSUME(cw(4,17) >= old_cw);
  ASSUME(cw(4,17) >= cr(4,17));
  ASSUME(cw(4,17) >= cl[4]);
  ASSUME(cw(4,17) >= cisb[4]);
  ASSUME(cw(4,17) >= cdy[4]);
  ASSUME(cw(4,17) >= cdl[4]);
  ASSUME(cw(4,17) >= cds[4]);
  ASSUME(cw(4,17) >= cctrl[4]);
  ASSUME(cw(4,17) >= caddr[4]);
  // Update
  caddr[4] = max(caddr[4],0);
  buff(4,17) = (r11==1);
  mem(17,cw(4,17)) = (r11==1);
  co(17,cw(4,17))+=1;
  delta(17,cw(4,17)) = -1;
  ASSUME(creturn[4] >= cw(4,17));

  //   %cmp12 = icmp eq i32 %conv, 1, !dbg !102
  creg__r9__1_ = max(0,creg_r9);

  //   %conv13 = zext i1 %cmp12 to i32, !dbg !102

  //   call void @llvm.dbg.value(metadata i32 %conv13, metadata !231, metadata !DIExpression()), !dbg !234

  //   store i32 %conv13, i32* @atom_3_X0_1, align 4, !dbg !103, !tbaa !98
  // ST: Guess
  iw(4,18) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STIW _l92_c15
  old_cw = cw(4,18);
  cw(4,18) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STCOM _l92_c15
  // Check
  ASSUME(active[iw(4,18)] == 4);
  ASSUME(active[cw(4,18)] == 4);
  ASSUME(sforbid(18,cw(4,18))== 0);
  ASSUME(iw(4,18) >= creg__r9__1_);
  ASSUME(iw(4,18) >= 0);
  ASSUME(cw(4,18) >= iw(4,18));
  ASSUME(cw(4,18) >= old_cw);
  ASSUME(cw(4,18) >= cr(4,18));
  ASSUME(cw(4,18) >= cl[4]);
  ASSUME(cw(4,18) >= cisb[4]);
  ASSUME(cw(4,18) >= cdy[4]);
  ASSUME(cw(4,18) >= cdl[4]);
  ASSUME(cw(4,18) >= cds[4]);
  ASSUME(cw(4,18) >= cctrl[4]);
  ASSUME(cw(4,18) >= caddr[4]);
  // Update
  caddr[4] = max(caddr[4],0);
  buff(4,18) = (r9==1);
  mem(18,cw(4,18)) = (r9==1);
  co(18,cw(4,18))+=1;
  delta(18,cw(4,18)) = -1;
  ASSUME(creturn[4] >= cw(4,18));

  //   %cmp14 = icmp eq i32 %conv4, 1, !dbg !104
  creg__r10__1_ = max(0,creg_r10);

  //   %conv15 = zext i1 %cmp14 to i32, !dbg !104

  //   call void @llvm.dbg.value(metadata i32 %conv15, metadata !232, metadata !DIExpression()), !dbg !234

  //   store i32 %conv15, i32* @atom_3_X2_1, align 4, !dbg !105, !tbaa !98
  // ST: Guess
  iw(4,19) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STIW _l94_c15
  old_cw = cw(4,19);
  cw(4,19) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STCOM _l94_c15
  // Check
  ASSUME(active[iw(4,19)] == 4);
  ASSUME(active[cw(4,19)] == 4);
  ASSUME(sforbid(19,cw(4,19))== 0);
  ASSUME(iw(4,19) >= creg__r10__1_);
  ASSUME(iw(4,19) >= 0);
  ASSUME(cw(4,19) >= iw(4,19));
  ASSUME(cw(4,19) >= old_cw);
  ASSUME(cw(4,19) >= cr(4,19));
  ASSUME(cw(4,19) >= cl[4]);
  ASSUME(cw(4,19) >= cisb[4]);
  ASSUME(cw(4,19) >= cdy[4]);
  ASSUME(cw(4,19) >= cdl[4]);
  ASSUME(cw(4,19) >= cds[4]);
  ASSUME(cw(4,19) >= cctrl[4]);
  ASSUME(cw(4,19) >= caddr[4]);
  // Update
  caddr[4] = max(caddr[4],0);
  buff(4,19) = (r10==1);
  mem(19,cw(4,19)) = (r10==1);
  co(19,cw(4,19))+=1;
  delta(19,cw(4,19)) = -1;
  ASSUME(creturn[4] >= cw(4,19));

  //   ret i8* null, !dbg !106
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

  //   call void @llvm.dbg.value(metadata i32 %argc, metadata !264, metadata !DIExpression()), !dbg !320

  //   call void @llvm.dbg.value(metadata i8** %argv, metadata !265, metadata !DIExpression()), !dbg !320

  //   %0 = bitcast i64* %thr0 to i8*, !dbg !117

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #7, !dbg !117

  //   call void @llvm.dbg.declare(metadata i64* %thr0, metadata !266, metadata !DIExpression()), !dbg !322

  //   %1 = bitcast i64* %thr1 to i8*, !dbg !119

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #7, !dbg !119

  //   call void @llvm.dbg.declare(metadata i64* %thr1, metadata !270, metadata !DIExpression()), !dbg !324

  //   %2 = bitcast i64* %thr2 to i8*, !dbg !121

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #7, !dbg !121

  //   call void @llvm.dbg.declare(metadata i64* %thr2, metadata !271, metadata !DIExpression()), !dbg !326

  //   %3 = bitcast i64* %thr3 to i8*, !dbg !123

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #7, !dbg !123

  //   call void @llvm.dbg.declare(metadata i64* %thr3, metadata !272, metadata !DIExpression()), !dbg !328

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 7), metadata !273, metadata !DIExpression()), !dbg !329

  //   call void @llvm.dbg.value(metadata i64 0, metadata !275, metadata !DIExpression()), !dbg !329

  //   store atomic i64 0, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 7) monotonic, align 8, !dbg !126
  // ST: Guess
  iw(0,0+7*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l104_c3
  old_cw = cw(0,0+7*1);
  cw(0,0+7*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l104_c3
  // Check
  ASSUME(active[iw(0,0+7*1)] == 0);
  ASSUME(active[cw(0,0+7*1)] == 0);
  ASSUME(sforbid(0+7*1,cw(0,0+7*1))== 0);
  ASSUME(iw(0,0+7*1) >= 0);
  ASSUME(iw(0,0+7*1) >= 0);
  ASSUME(cw(0,0+7*1) >= iw(0,0+7*1));
  ASSUME(cw(0,0+7*1) >= old_cw);
  ASSUME(cw(0,0+7*1) >= cr(0,0+7*1));
  ASSUME(cw(0,0+7*1) >= cl[0]);
  ASSUME(cw(0,0+7*1) >= cisb[0]);
  ASSUME(cw(0,0+7*1) >= cdy[0]);
  ASSUME(cw(0,0+7*1) >= cdl[0]);
  ASSUME(cw(0,0+7*1) >= cds[0]);
  ASSUME(cw(0,0+7*1) >= cctrl[0]);
  ASSUME(cw(0,0+7*1) >= caddr[0]);
  // Update
  caddr[0] = max(caddr[0],0);
  buff(0,0+7*1) = 0;
  mem(0+7*1,cw(0,0+7*1)) = 0;
  co(0+7*1,cw(0,0+7*1))+=1;
  delta(0+7*1,cw(0,0+7*1)) = -1;
  ASSUME(creturn[0] >= cw(0,0+7*1));

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 6), metadata !276, metadata !DIExpression()), !dbg !331

  //   call void @llvm.dbg.value(metadata i64 0, metadata !278, metadata !DIExpression()), !dbg !331

  //   store atomic i64 0, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 6) monotonic, align 8, !dbg !128
  // ST: Guess
  iw(0,0+6*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l105_c3
  old_cw = cw(0,0+6*1);
  cw(0,0+6*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l105_c3
  // Check
  ASSUME(active[iw(0,0+6*1)] == 0);
  ASSUME(active[cw(0,0+6*1)] == 0);
  ASSUME(sforbid(0+6*1,cw(0,0+6*1))== 0);
  ASSUME(iw(0,0+6*1) >= 0);
  ASSUME(iw(0,0+6*1) >= 0);
  ASSUME(cw(0,0+6*1) >= iw(0,0+6*1));
  ASSUME(cw(0,0+6*1) >= old_cw);
  ASSUME(cw(0,0+6*1) >= cr(0,0+6*1));
  ASSUME(cw(0,0+6*1) >= cl[0]);
  ASSUME(cw(0,0+6*1) >= cisb[0]);
  ASSUME(cw(0,0+6*1) >= cdy[0]);
  ASSUME(cw(0,0+6*1) >= cdl[0]);
  ASSUME(cw(0,0+6*1) >= cds[0]);
  ASSUME(cw(0,0+6*1) >= cctrl[0]);
  ASSUME(cw(0,0+6*1) >= caddr[0]);
  // Update
  caddr[0] = max(caddr[0],0);
  buff(0,0+6*1) = 0;
  mem(0+6*1,cw(0,0+6*1)) = 0;
  co(0+6*1,cw(0,0+6*1))+=1;
  delta(0+6*1,cw(0,0+6*1)) = -1;
  ASSUME(creturn[0] >= cw(0,0+6*1));

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 5), metadata !279, metadata !DIExpression()), !dbg !333

  //   call void @llvm.dbg.value(metadata i64 0, metadata !281, metadata !DIExpression()), !dbg !333

  //   store atomic i64 0, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 5) monotonic, align 8, !dbg !130
  // ST: Guess
  iw(0,0+5*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l106_c3
  old_cw = cw(0,0+5*1);
  cw(0,0+5*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l106_c3
  // Check
  ASSUME(active[iw(0,0+5*1)] == 0);
  ASSUME(active[cw(0,0+5*1)] == 0);
  ASSUME(sforbid(0+5*1,cw(0,0+5*1))== 0);
  ASSUME(iw(0,0+5*1) >= 0);
  ASSUME(iw(0,0+5*1) >= 0);
  ASSUME(cw(0,0+5*1) >= iw(0,0+5*1));
  ASSUME(cw(0,0+5*1) >= old_cw);
  ASSUME(cw(0,0+5*1) >= cr(0,0+5*1));
  ASSUME(cw(0,0+5*1) >= cl[0]);
  ASSUME(cw(0,0+5*1) >= cisb[0]);
  ASSUME(cw(0,0+5*1) >= cdy[0]);
  ASSUME(cw(0,0+5*1) >= cdl[0]);
  ASSUME(cw(0,0+5*1) >= cds[0]);
  ASSUME(cw(0,0+5*1) >= cctrl[0]);
  ASSUME(cw(0,0+5*1) >= caddr[0]);
  // Update
  caddr[0] = max(caddr[0],0);
  buff(0,0+5*1) = 0;
  mem(0+5*1,cw(0,0+5*1)) = 0;
  co(0+5*1,cw(0,0+5*1))+=1;
  delta(0+5*1,cw(0,0+5*1)) = -1;
  ASSUME(creturn[0] >= cw(0,0+5*1));

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 4), metadata !282, metadata !DIExpression()), !dbg !335

  //   call void @llvm.dbg.value(metadata i64 0, metadata !284, metadata !DIExpression()), !dbg !335

  //   store atomic i64 0, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 4) monotonic, align 8, !dbg !132
  // ST: Guess
  iw(0,0+4*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l107_c3
  old_cw = cw(0,0+4*1);
  cw(0,0+4*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l107_c3
  // Check
  ASSUME(active[iw(0,0+4*1)] == 0);
  ASSUME(active[cw(0,0+4*1)] == 0);
  ASSUME(sforbid(0+4*1,cw(0,0+4*1))== 0);
  ASSUME(iw(0,0+4*1) >= 0);
  ASSUME(iw(0,0+4*1) >= 0);
  ASSUME(cw(0,0+4*1) >= iw(0,0+4*1));
  ASSUME(cw(0,0+4*1) >= old_cw);
  ASSUME(cw(0,0+4*1) >= cr(0,0+4*1));
  ASSUME(cw(0,0+4*1) >= cl[0]);
  ASSUME(cw(0,0+4*1) >= cisb[0]);
  ASSUME(cw(0,0+4*1) >= cdy[0]);
  ASSUME(cw(0,0+4*1) >= cdl[0]);
  ASSUME(cw(0,0+4*1) >= cds[0]);
  ASSUME(cw(0,0+4*1) >= cctrl[0]);
  ASSUME(cw(0,0+4*1) >= caddr[0]);
  // Update
  caddr[0] = max(caddr[0],0);
  buff(0,0+4*1) = 0;
  mem(0+4*1,cw(0,0+4*1)) = 0;
  co(0+4*1,cw(0,0+4*1))+=1;
  delta(0+4*1,cw(0,0+4*1)) = -1;
  ASSUME(creturn[0] >= cw(0,0+4*1));

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 3), metadata !285, metadata !DIExpression()), !dbg !337

  //   call void @llvm.dbg.value(metadata i64 0, metadata !287, metadata !DIExpression()), !dbg !337

  //   store atomic i64 0, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !134
  // ST: Guess
  iw(0,0+3*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l108_c3
  old_cw = cw(0,0+3*1);
  cw(0,0+3*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l108_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 2), metadata !288, metadata !DIExpression()), !dbg !339

  //   call void @llvm.dbg.value(metadata i64 0, metadata !290, metadata !DIExpression()), !dbg !339

  //   store atomic i64 0, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 2) monotonic, align 8, !dbg !136
  // ST: Guess
  iw(0,0+2*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l109_c3
  old_cw = cw(0,0+2*1);
  cw(0,0+2*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l109_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 1), metadata !291, metadata !DIExpression()), !dbg !341

  //   call void @llvm.dbg.value(metadata i64 0, metadata !293, metadata !DIExpression()), !dbg !341

  //   store atomic i64 0, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !138
  // ST: Guess
  iw(0,0+1*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l110_c3
  old_cw = cw(0,0+1*1);
  cw(0,0+1*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l110_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 0), metadata !294, metadata !DIExpression()), !dbg !343

  //   call void @llvm.dbg.value(metadata i64 0, metadata !296, metadata !DIExpression()), !dbg !343

  //   store atomic i64 0, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !140
  // ST: Guess
  iw(0,0) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l111_c3
  old_cw = cw(0,0);
  cw(0,0) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l111_c3
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

  //   store i32 0, i32* @atom_0_X0_1, align 4, !dbg !141, !tbaa !142
  // ST: Guess
  iw(0,8) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l112_c15
  old_cw = cw(0,8);
  cw(0,8) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l112_c15
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

  //   store i32 0, i32* @atom_1_X4_1, align 4, !dbg !146, !tbaa !142
  // ST: Guess
  iw(0,11) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l113_c15
  old_cw = cw(0,11);
  cw(0,11) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l113_c15
  // Check
  ASSUME(active[iw(0,11)] == 0);
  ASSUME(active[cw(0,11)] == 0);
  ASSUME(sforbid(11,cw(0,11))== 0);
  ASSUME(iw(0,11) >= 0);
  ASSUME(iw(0,11) >= 0);
  ASSUME(cw(0,11) >= iw(0,11));
  ASSUME(cw(0,11) >= old_cw);
  ASSUME(cw(0,11) >= cr(0,11));
  ASSUME(cw(0,11) >= cl[0]);
  ASSUME(cw(0,11) >= cisb[0]);
  ASSUME(cw(0,11) >= cdy[0]);
  ASSUME(cw(0,11) >= cdl[0]);
  ASSUME(cw(0,11) >= cds[0]);
  ASSUME(cw(0,11) >= cctrl[0]);
  ASSUME(cw(0,11) >= caddr[0]);
  // Update
  caddr[0] = max(caddr[0],0);
  buff(0,11) = 0;
  mem(11,cw(0,11)) = 0;
  co(11,cw(0,11))+=1;
  delta(11,cw(0,11)) = -1;
  ASSUME(creturn[0] >= cw(0,11));

  //   store i32 0, i32* @atom_2_X0_1, align 4, !dbg !147, !tbaa !142
  // ST: Guess
  iw(0,14) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l114_c15
  old_cw = cw(0,14);
  cw(0,14) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l114_c15
  // Check
  ASSUME(active[iw(0,14)] == 0);
  ASSUME(active[cw(0,14)] == 0);
  ASSUME(sforbid(14,cw(0,14))== 0);
  ASSUME(iw(0,14) >= 0);
  ASSUME(iw(0,14) >= 0);
  ASSUME(cw(0,14) >= iw(0,14));
  ASSUME(cw(0,14) >= old_cw);
  ASSUME(cw(0,14) >= cr(0,14));
  ASSUME(cw(0,14) >= cl[0]);
  ASSUME(cw(0,14) >= cisb[0]);
  ASSUME(cw(0,14) >= cdy[0]);
  ASSUME(cw(0,14) >= cdl[0]);
  ASSUME(cw(0,14) >= cds[0]);
  ASSUME(cw(0,14) >= cctrl[0]);
  ASSUME(cw(0,14) >= caddr[0]);
  // Update
  caddr[0] = max(caddr[0],0);
  buff(0,14) = 0;
  mem(14,cw(0,14)) = 0;
  co(14,cw(0,14))+=1;
  delta(14,cw(0,14)) = -1;
  ASSUME(creturn[0] >= cw(0,14));

  //   store i32 0, i32* @atom_3_X4_1, align 4, !dbg !148, !tbaa !142
  // ST: Guess
  iw(0,17) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l115_c15
  old_cw = cw(0,17);
  cw(0,17) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l115_c15
  // Check
  ASSUME(active[iw(0,17)] == 0);
  ASSUME(active[cw(0,17)] == 0);
  ASSUME(sforbid(17,cw(0,17))== 0);
  ASSUME(iw(0,17) >= 0);
  ASSUME(iw(0,17) >= 0);
  ASSUME(cw(0,17) >= iw(0,17));
  ASSUME(cw(0,17) >= old_cw);
  ASSUME(cw(0,17) >= cr(0,17));
  ASSUME(cw(0,17) >= cl[0]);
  ASSUME(cw(0,17) >= cisb[0]);
  ASSUME(cw(0,17) >= cdy[0]);
  ASSUME(cw(0,17) >= cdl[0]);
  ASSUME(cw(0,17) >= cds[0]);
  ASSUME(cw(0,17) >= cctrl[0]);
  ASSUME(cw(0,17) >= caddr[0]);
  // Update
  caddr[0] = max(caddr[0],0);
  buff(0,17) = 0;
  mem(17,cw(0,17)) = 0;
  co(17,cw(0,17))+=1;
  delta(17,cw(0,17)) = -1;
  ASSUME(creturn[0] >= cw(0,17));

  //   store i32 0, i32* @atom_1_X0_1, align 4, !dbg !149, !tbaa !142
  // ST: Guess
  iw(0,12) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l116_c15
  old_cw = cw(0,12);
  cw(0,12) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l116_c15
  // Check
  ASSUME(active[iw(0,12)] == 0);
  ASSUME(active[cw(0,12)] == 0);
  ASSUME(sforbid(12,cw(0,12))== 0);
  ASSUME(iw(0,12) >= 0);
  ASSUME(iw(0,12) >= 0);
  ASSUME(cw(0,12) >= iw(0,12));
  ASSUME(cw(0,12) >= old_cw);
  ASSUME(cw(0,12) >= cr(0,12));
  ASSUME(cw(0,12) >= cl[0]);
  ASSUME(cw(0,12) >= cisb[0]);
  ASSUME(cw(0,12) >= cdy[0]);
  ASSUME(cw(0,12) >= cdl[0]);
  ASSUME(cw(0,12) >= cds[0]);
  ASSUME(cw(0,12) >= cctrl[0]);
  ASSUME(cw(0,12) >= caddr[0]);
  // Update
  caddr[0] = max(caddr[0],0);
  buff(0,12) = 0;
  mem(12,cw(0,12)) = 0;
  co(12,cw(0,12))+=1;
  delta(12,cw(0,12)) = -1;
  ASSUME(creturn[0] >= cw(0,12));

  //   store i32 0, i32* @atom_0_X3_1, align 4, !dbg !150, !tbaa !142
  // ST: Guess
  iw(0,9) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l117_c15
  old_cw = cw(0,9);
  cw(0,9) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l117_c15
  // Check
  ASSUME(active[iw(0,9)] == 0);
  ASSUME(active[cw(0,9)] == 0);
  ASSUME(sforbid(9,cw(0,9))== 0);
  ASSUME(iw(0,9) >= 0);
  ASSUME(iw(0,9) >= 0);
  ASSUME(cw(0,9) >= iw(0,9));
  ASSUME(cw(0,9) >= old_cw);
  ASSUME(cw(0,9) >= cr(0,9));
  ASSUME(cw(0,9) >= cl[0]);
  ASSUME(cw(0,9) >= cisb[0]);
  ASSUME(cw(0,9) >= cdy[0]);
  ASSUME(cw(0,9) >= cdl[0]);
  ASSUME(cw(0,9) >= cds[0]);
  ASSUME(cw(0,9) >= cctrl[0]);
  ASSUME(cw(0,9) >= caddr[0]);
  // Update
  caddr[0] = max(caddr[0],0);
  buff(0,9) = 0;
  mem(9,cw(0,9)) = 0;
  co(9,cw(0,9))+=1;
  delta(9,cw(0,9)) = -1;
  ASSUME(creturn[0] >= cw(0,9));

  //   store i32 0, i32* @atom_3_X0_1, align 4, !dbg !151, !tbaa !142
  // ST: Guess
  iw(0,18) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l118_c15
  old_cw = cw(0,18);
  cw(0,18) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l118_c15
  // Check
  ASSUME(active[iw(0,18)] == 0);
  ASSUME(active[cw(0,18)] == 0);
  ASSUME(sforbid(18,cw(0,18))== 0);
  ASSUME(iw(0,18) >= 0);
  ASSUME(iw(0,18) >= 0);
  ASSUME(cw(0,18) >= iw(0,18));
  ASSUME(cw(0,18) >= old_cw);
  ASSUME(cw(0,18) >= cr(0,18));
  ASSUME(cw(0,18) >= cl[0]);
  ASSUME(cw(0,18) >= cisb[0]);
  ASSUME(cw(0,18) >= cdy[0]);
  ASSUME(cw(0,18) >= cdl[0]);
  ASSUME(cw(0,18) >= cds[0]);
  ASSUME(cw(0,18) >= cctrl[0]);
  ASSUME(cw(0,18) >= caddr[0]);
  // Update
  caddr[0] = max(caddr[0],0);
  buff(0,18) = 0;
  mem(18,cw(0,18)) = 0;
  co(18,cw(0,18))+=1;
  delta(18,cw(0,18)) = -1;
  ASSUME(creturn[0] >= cw(0,18));

  //   store i32 0, i32* @atom_0_X5_1, align 4, !dbg !152, !tbaa !142
  // ST: Guess
  iw(0,10) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l119_c15
  old_cw = cw(0,10);
  cw(0,10) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l119_c15
  // Check
  ASSUME(active[iw(0,10)] == 0);
  ASSUME(active[cw(0,10)] == 0);
  ASSUME(sforbid(10,cw(0,10))== 0);
  ASSUME(iw(0,10) >= 0);
  ASSUME(iw(0,10) >= 0);
  ASSUME(cw(0,10) >= iw(0,10));
  ASSUME(cw(0,10) >= old_cw);
  ASSUME(cw(0,10) >= cr(0,10));
  ASSUME(cw(0,10) >= cl[0]);
  ASSUME(cw(0,10) >= cisb[0]);
  ASSUME(cw(0,10) >= cdy[0]);
  ASSUME(cw(0,10) >= cdl[0]);
  ASSUME(cw(0,10) >= cds[0]);
  ASSUME(cw(0,10) >= cctrl[0]);
  ASSUME(cw(0,10) >= caddr[0]);
  // Update
  caddr[0] = max(caddr[0],0);
  buff(0,10) = 0;
  mem(10,cw(0,10)) = 0;
  co(10,cw(0,10))+=1;
  delta(10,cw(0,10)) = -1;
  ASSUME(creturn[0] >= cw(0,10));

  //   store i32 0, i32* @atom_1_X2_1, align 4, !dbg !153, !tbaa !142
  // ST: Guess
  iw(0,13) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l120_c15
  old_cw = cw(0,13);
  cw(0,13) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l120_c15
  // Check
  ASSUME(active[iw(0,13)] == 0);
  ASSUME(active[cw(0,13)] == 0);
  ASSUME(sforbid(13,cw(0,13))== 0);
  ASSUME(iw(0,13) >= 0);
  ASSUME(iw(0,13) >= 0);
  ASSUME(cw(0,13) >= iw(0,13));
  ASSUME(cw(0,13) >= old_cw);
  ASSUME(cw(0,13) >= cr(0,13));
  ASSUME(cw(0,13) >= cl[0]);
  ASSUME(cw(0,13) >= cisb[0]);
  ASSUME(cw(0,13) >= cdy[0]);
  ASSUME(cw(0,13) >= cdl[0]);
  ASSUME(cw(0,13) >= cds[0]);
  ASSUME(cw(0,13) >= cctrl[0]);
  ASSUME(cw(0,13) >= caddr[0]);
  // Update
  caddr[0] = max(caddr[0],0);
  buff(0,13) = 0;
  mem(13,cw(0,13)) = 0;
  co(13,cw(0,13))+=1;
  delta(13,cw(0,13)) = -1;
  ASSUME(creturn[0] >= cw(0,13));

  //   store i32 0, i32* @atom_2_X3_1, align 4, !dbg !154, !tbaa !142
  // ST: Guess
  iw(0,15) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l121_c15
  old_cw = cw(0,15);
  cw(0,15) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l121_c15
  // Check
  ASSUME(active[iw(0,15)] == 0);
  ASSUME(active[cw(0,15)] == 0);
  ASSUME(sforbid(15,cw(0,15))== 0);
  ASSUME(iw(0,15) >= 0);
  ASSUME(iw(0,15) >= 0);
  ASSUME(cw(0,15) >= iw(0,15));
  ASSUME(cw(0,15) >= old_cw);
  ASSUME(cw(0,15) >= cr(0,15));
  ASSUME(cw(0,15) >= cl[0]);
  ASSUME(cw(0,15) >= cisb[0]);
  ASSUME(cw(0,15) >= cdy[0]);
  ASSUME(cw(0,15) >= cdl[0]);
  ASSUME(cw(0,15) >= cds[0]);
  ASSUME(cw(0,15) >= cctrl[0]);
  ASSUME(cw(0,15) >= caddr[0]);
  // Update
  caddr[0] = max(caddr[0],0);
  buff(0,15) = 0;
  mem(15,cw(0,15)) = 0;
  co(15,cw(0,15))+=1;
  delta(15,cw(0,15)) = -1;
  ASSUME(creturn[0] >= cw(0,15));

  //   store i32 0, i32* @atom_3_X2_1, align 4, !dbg !155, !tbaa !142
  // ST: Guess
  iw(0,19) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l122_c15
  old_cw = cw(0,19);
  cw(0,19) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l122_c15
  // Check
  ASSUME(active[iw(0,19)] == 0);
  ASSUME(active[cw(0,19)] == 0);
  ASSUME(sforbid(19,cw(0,19))== 0);
  ASSUME(iw(0,19) >= 0);
  ASSUME(iw(0,19) >= 0);
  ASSUME(cw(0,19) >= iw(0,19));
  ASSUME(cw(0,19) >= old_cw);
  ASSUME(cw(0,19) >= cr(0,19));
  ASSUME(cw(0,19) >= cl[0]);
  ASSUME(cw(0,19) >= cisb[0]);
  ASSUME(cw(0,19) >= cdy[0]);
  ASSUME(cw(0,19) >= cdl[0]);
  ASSUME(cw(0,19) >= cds[0]);
  ASSUME(cw(0,19) >= cctrl[0]);
  ASSUME(cw(0,19) >= caddr[0]);
  // Update
  caddr[0] = max(caddr[0],0);
  buff(0,19) = 0;
  mem(19,cw(0,19)) = 0;
  co(19,cw(0,19))+=1;
  delta(19,cw(0,19)) = -1;
  ASSUME(creturn[0] >= cw(0,19));

  //   store i32 0, i32* @atom_2_X5_1, align 4, !dbg !156, !tbaa !142
  // ST: Guess
  iw(0,16) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l123_c15
  old_cw = cw(0,16);
  cw(0,16) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l123_c15
  // Check
  ASSUME(active[iw(0,16)] == 0);
  ASSUME(active[cw(0,16)] == 0);
  ASSUME(sforbid(16,cw(0,16))== 0);
  ASSUME(iw(0,16) >= 0);
  ASSUME(iw(0,16) >= 0);
  ASSUME(cw(0,16) >= iw(0,16));
  ASSUME(cw(0,16) >= old_cw);
  ASSUME(cw(0,16) >= cr(0,16));
  ASSUME(cw(0,16) >= cl[0]);
  ASSUME(cw(0,16) >= cisb[0]);
  ASSUME(cw(0,16) >= cdy[0]);
  ASSUME(cw(0,16) >= cdl[0]);
  ASSUME(cw(0,16) >= cds[0]);
  ASSUME(cw(0,16) >= cctrl[0]);
  ASSUME(cw(0,16) >= caddr[0]);
  // Update
  caddr[0] = max(caddr[0],0);
  buff(0,16) = 0;
  mem(16,cw(0,16)) = 0;
  co(16,cw(0,16))+=1;
  delta(16,cw(0,16)) = -1;
  ASSUME(creturn[0] >= cw(0,16));

  //   %call = call i32 @pthread_create(i64* noundef %thr0, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t0, i8* noundef null) #7, !dbg !157
  // dumbsy: Guess
  old_cdy = cdy[0];
  cdy[0] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[0] >= old_cdy);
  ASSUME(cdy[0] >= cisb[0]);
  ASSUME(cdy[0] >= cdl[0]);
  ASSUME(cdy[0] >= cds[0]);
  ASSUME(cdy[0] >= cctrl[0]);
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,0+0));
  ASSUME(cdy[0] >= cw(0,0+1));
  ASSUME(cdy[0] >= cw(0,0+2));
  ASSUME(cdy[0] >= cw(0,0+3));
  ASSUME(cdy[0] >= cw(0,0+4));
  ASSUME(cdy[0] >= cw(0,0+5));
  ASSUME(cdy[0] >= cw(0,0+6));
  ASSUME(cdy[0] >= cw(0,0+7));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,18+0));
  ASSUME(cdy[0] >= cw(0,19+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,0+6));
  ASSUME(cdy[0] >= cr(0,0+7));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,18+0));
  ASSUME(cdy[0] >= cr(0,19+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[1] >= cdy[0]);

  //   %call15 = call i32 @pthread_create(i64* noundef %thr1, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t1, i8* noundef null) #7, !dbg !158
  // dumbsy: Guess
  old_cdy = cdy[0];
  cdy[0] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[0] >= old_cdy);
  ASSUME(cdy[0] >= cisb[0]);
  ASSUME(cdy[0] >= cdl[0]);
  ASSUME(cdy[0] >= cds[0]);
  ASSUME(cdy[0] >= cctrl[0]);
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,0+0));
  ASSUME(cdy[0] >= cw(0,0+1));
  ASSUME(cdy[0] >= cw(0,0+2));
  ASSUME(cdy[0] >= cw(0,0+3));
  ASSUME(cdy[0] >= cw(0,0+4));
  ASSUME(cdy[0] >= cw(0,0+5));
  ASSUME(cdy[0] >= cw(0,0+6));
  ASSUME(cdy[0] >= cw(0,0+7));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,18+0));
  ASSUME(cdy[0] >= cw(0,19+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,0+6));
  ASSUME(cdy[0] >= cr(0,0+7));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,18+0));
  ASSUME(cdy[0] >= cr(0,19+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[2] >= cdy[0]);

  //   %call16 = call i32 @pthread_create(i64* noundef %thr2, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t2, i8* noundef null) #7, !dbg !159
  // dumbsy: Guess
  old_cdy = cdy[0];
  cdy[0] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[0] >= old_cdy);
  ASSUME(cdy[0] >= cisb[0]);
  ASSUME(cdy[0] >= cdl[0]);
  ASSUME(cdy[0] >= cds[0]);
  ASSUME(cdy[0] >= cctrl[0]);
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,0+0));
  ASSUME(cdy[0] >= cw(0,0+1));
  ASSUME(cdy[0] >= cw(0,0+2));
  ASSUME(cdy[0] >= cw(0,0+3));
  ASSUME(cdy[0] >= cw(0,0+4));
  ASSUME(cdy[0] >= cw(0,0+5));
  ASSUME(cdy[0] >= cw(0,0+6));
  ASSUME(cdy[0] >= cw(0,0+7));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,18+0));
  ASSUME(cdy[0] >= cw(0,19+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,0+6));
  ASSUME(cdy[0] >= cr(0,0+7));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,18+0));
  ASSUME(cdy[0] >= cr(0,19+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[3] >= cdy[0]);

  //   %call17 = call i32 @pthread_create(i64* noundef %thr3, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t3, i8* noundef null) #7, !dbg !160
  // dumbsy: Guess
  old_cdy = cdy[0];
  cdy[0] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[0] >= old_cdy);
  ASSUME(cdy[0] >= cisb[0]);
  ASSUME(cdy[0] >= cdl[0]);
  ASSUME(cdy[0] >= cds[0]);
  ASSUME(cdy[0] >= cctrl[0]);
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,0+0));
  ASSUME(cdy[0] >= cw(0,0+1));
  ASSUME(cdy[0] >= cw(0,0+2));
  ASSUME(cdy[0] >= cw(0,0+3));
  ASSUME(cdy[0] >= cw(0,0+4));
  ASSUME(cdy[0] >= cw(0,0+5));
  ASSUME(cdy[0] >= cw(0,0+6));
  ASSUME(cdy[0] >= cw(0,0+7));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,18+0));
  ASSUME(cdy[0] >= cw(0,19+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,0+6));
  ASSUME(cdy[0] >= cr(0,0+7));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,18+0));
  ASSUME(cdy[0] >= cr(0,19+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[4] >= cdy[0]);

  //   %4 = load i64, i64* %thr0, align 8, !dbg !161, !tbaa !162
  r13 = local_mem[0];

  //   %call18 = call i32 @pthread_join(i64 noundef %4, i8** noundef null), !dbg !164
  // dumbsy: Guess
  old_cdy = cdy[0];
  cdy[0] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[0] >= old_cdy);
  ASSUME(cdy[0] >= cisb[0]);
  ASSUME(cdy[0] >= cdl[0]);
  ASSUME(cdy[0] >= cds[0]);
  ASSUME(cdy[0] >= cctrl[0]);
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,0+0));
  ASSUME(cdy[0] >= cw(0,0+1));
  ASSUME(cdy[0] >= cw(0,0+2));
  ASSUME(cdy[0] >= cw(0,0+3));
  ASSUME(cdy[0] >= cw(0,0+4));
  ASSUME(cdy[0] >= cw(0,0+5));
  ASSUME(cdy[0] >= cw(0,0+6));
  ASSUME(cdy[0] >= cw(0,0+7));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,18+0));
  ASSUME(cdy[0] >= cw(0,19+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,0+6));
  ASSUME(cdy[0] >= cr(0,0+7));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,18+0));
  ASSUME(cdy[0] >= cr(0,19+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[1]);

  //   %5 = load i64, i64* %thr1, align 8, !dbg !165, !tbaa !162
  r14 = local_mem[1];

  //   %call19 = call i32 @pthread_join(i64 noundef %5, i8** noundef null), !dbg !166
  // dumbsy: Guess
  old_cdy = cdy[0];
  cdy[0] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[0] >= old_cdy);
  ASSUME(cdy[0] >= cisb[0]);
  ASSUME(cdy[0] >= cdl[0]);
  ASSUME(cdy[0] >= cds[0]);
  ASSUME(cdy[0] >= cctrl[0]);
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,0+0));
  ASSUME(cdy[0] >= cw(0,0+1));
  ASSUME(cdy[0] >= cw(0,0+2));
  ASSUME(cdy[0] >= cw(0,0+3));
  ASSUME(cdy[0] >= cw(0,0+4));
  ASSUME(cdy[0] >= cw(0,0+5));
  ASSUME(cdy[0] >= cw(0,0+6));
  ASSUME(cdy[0] >= cw(0,0+7));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,18+0));
  ASSUME(cdy[0] >= cw(0,19+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,0+6));
  ASSUME(cdy[0] >= cr(0,0+7));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,18+0));
  ASSUME(cdy[0] >= cr(0,19+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[2]);

  //   %6 = load i64, i64* %thr2, align 8, !dbg !167, !tbaa !162
  r15 = local_mem[2];

  //   %call20 = call i32 @pthread_join(i64 noundef %6, i8** noundef null), !dbg !168
  // dumbsy: Guess
  old_cdy = cdy[0];
  cdy[0] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[0] >= old_cdy);
  ASSUME(cdy[0] >= cisb[0]);
  ASSUME(cdy[0] >= cdl[0]);
  ASSUME(cdy[0] >= cds[0]);
  ASSUME(cdy[0] >= cctrl[0]);
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,0+0));
  ASSUME(cdy[0] >= cw(0,0+1));
  ASSUME(cdy[0] >= cw(0,0+2));
  ASSUME(cdy[0] >= cw(0,0+3));
  ASSUME(cdy[0] >= cw(0,0+4));
  ASSUME(cdy[0] >= cw(0,0+5));
  ASSUME(cdy[0] >= cw(0,0+6));
  ASSUME(cdy[0] >= cw(0,0+7));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,18+0));
  ASSUME(cdy[0] >= cw(0,19+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,0+6));
  ASSUME(cdy[0] >= cr(0,0+7));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,18+0));
  ASSUME(cdy[0] >= cr(0,19+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[3]);

  //   %7 = load i64, i64* %thr3, align 8, !dbg !169, !tbaa !162
  r16 = local_mem[3];

  //   %call21 = call i32 @pthread_join(i64 noundef %7, i8** noundef null), !dbg !170
  // dumbsy: Guess
  old_cdy = cdy[0];
  cdy[0] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[0] >= old_cdy);
  ASSUME(cdy[0] >= cisb[0]);
  ASSUME(cdy[0] >= cdl[0]);
  ASSUME(cdy[0] >= cds[0]);
  ASSUME(cdy[0] >= cctrl[0]);
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,0+0));
  ASSUME(cdy[0] >= cw(0,0+1));
  ASSUME(cdy[0] >= cw(0,0+2));
  ASSUME(cdy[0] >= cw(0,0+3));
  ASSUME(cdy[0] >= cw(0,0+4));
  ASSUME(cdy[0] >= cw(0,0+5));
  ASSUME(cdy[0] >= cw(0,0+6));
  ASSUME(cdy[0] >= cw(0,0+7));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,18+0));
  ASSUME(cdy[0] >= cw(0,19+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,0+6));
  ASSUME(cdy[0] >= cr(0,0+7));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,18+0));
  ASSUME(cdy[0] >= cr(0,19+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[4]);

  //   %8 = load i32, i32* @atom_0_X0_1, align 4, !dbg !171, !tbaa !142
  // LD: Guess
  old_cr = cr(0,8);
  cr(0,8) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l135_c13
  // Check
  ASSUME(active[cr(0,8)] == 0);
  ASSUME(cr(0,8) >= iw(0,8));
  ASSUME(cr(0,8) >= 0);
  ASSUME(cr(0,8) >= cdy[0]);
  ASSUME(cr(0,8) >= cisb[0]);
  ASSUME(cr(0,8) >= cdl[0]);
  ASSUME(cr(0,8) >= cl[0]);
  // Update
  creg_r17 = cr(0,8);
  crmax(0,8) = max(crmax(0,8),cr(0,8));
  caddr[0] = max(caddr[0],0);
  if(cr(0,8) < cw(0,8)) {
    r17 = buff(0,8);
    ASSUME((!(( (cw(0,8) < 1) && (1 < crmax(0,8)) )))||(sforbid(8,1)> 0));
    ASSUME((!(( (cw(0,8) < 2) && (2 < crmax(0,8)) )))||(sforbid(8,2)> 0));
    ASSUME((!(( (cw(0,8) < 3) && (3 < crmax(0,8)) )))||(sforbid(8,3)> 0));
    ASSUME((!(( (cw(0,8) < 4) && (4 < crmax(0,8)) )))||(sforbid(8,4)> 0));
  } else {
    if(pw(0,8) != co(8,cr(0,8))) {
      ASSUME(cr(0,8) >= old_cr);
    }
    pw(0,8) = co(8,cr(0,8));
    r17 = mem(8,cr(0,8));
  }
  ASSUME(creturn[0] >= cr(0,8));

  //   call void @llvm.dbg.value(metadata i32 %8, metadata !297, metadata !DIExpression()), !dbg !320

  //   %9 = load i32, i32* @atom_1_X4_1, align 4, !dbg !172, !tbaa !142
  // LD: Guess
  old_cr = cr(0,11);
  cr(0,11) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l136_c13
  // Check
  ASSUME(active[cr(0,11)] == 0);
  ASSUME(cr(0,11) >= iw(0,11));
  ASSUME(cr(0,11) >= 0);
  ASSUME(cr(0,11) >= cdy[0]);
  ASSUME(cr(0,11) >= cisb[0]);
  ASSUME(cr(0,11) >= cdl[0]);
  ASSUME(cr(0,11) >= cl[0]);
  // Update
  creg_r18 = cr(0,11);
  crmax(0,11) = max(crmax(0,11),cr(0,11));
  caddr[0] = max(caddr[0],0);
  if(cr(0,11) < cw(0,11)) {
    r18 = buff(0,11);
    ASSUME((!(( (cw(0,11) < 1) && (1 < crmax(0,11)) )))||(sforbid(11,1)> 0));
    ASSUME((!(( (cw(0,11) < 2) && (2 < crmax(0,11)) )))||(sforbid(11,2)> 0));
    ASSUME((!(( (cw(0,11) < 3) && (3 < crmax(0,11)) )))||(sforbid(11,3)> 0));
    ASSUME((!(( (cw(0,11) < 4) && (4 < crmax(0,11)) )))||(sforbid(11,4)> 0));
  } else {
    if(pw(0,11) != co(11,cr(0,11))) {
      ASSUME(cr(0,11) >= old_cr);
    }
    pw(0,11) = co(11,cr(0,11));
    r18 = mem(11,cr(0,11));
  }
  ASSUME(creturn[0] >= cr(0,11));

  //   call void @llvm.dbg.value(metadata i32 %9, metadata !298, metadata !DIExpression()), !dbg !320

  //   %10 = load i32, i32* @atom_2_X0_1, align 4, !dbg !173, !tbaa !142
  // LD: Guess
  old_cr = cr(0,14);
  cr(0,14) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l137_c13
  // Check
  ASSUME(active[cr(0,14)] == 0);
  ASSUME(cr(0,14) >= iw(0,14));
  ASSUME(cr(0,14) >= 0);
  ASSUME(cr(0,14) >= cdy[0]);
  ASSUME(cr(0,14) >= cisb[0]);
  ASSUME(cr(0,14) >= cdl[0]);
  ASSUME(cr(0,14) >= cl[0]);
  // Update
  creg_r19 = cr(0,14);
  crmax(0,14) = max(crmax(0,14),cr(0,14));
  caddr[0] = max(caddr[0],0);
  if(cr(0,14) < cw(0,14)) {
    r19 = buff(0,14);
    ASSUME((!(( (cw(0,14) < 1) && (1 < crmax(0,14)) )))||(sforbid(14,1)> 0));
    ASSUME((!(( (cw(0,14) < 2) && (2 < crmax(0,14)) )))||(sforbid(14,2)> 0));
    ASSUME((!(( (cw(0,14) < 3) && (3 < crmax(0,14)) )))||(sforbid(14,3)> 0));
    ASSUME((!(( (cw(0,14) < 4) && (4 < crmax(0,14)) )))||(sforbid(14,4)> 0));
  } else {
    if(pw(0,14) != co(14,cr(0,14))) {
      ASSUME(cr(0,14) >= old_cr);
    }
    pw(0,14) = co(14,cr(0,14));
    r19 = mem(14,cr(0,14));
  }
  ASSUME(creturn[0] >= cr(0,14));

  //   call void @llvm.dbg.value(metadata i32 %10, metadata !299, metadata !DIExpression()), !dbg !320

  //   %11 = load i32, i32* @atom_3_X4_1, align 4, !dbg !174, !tbaa !142
  // LD: Guess
  old_cr = cr(0,17);
  cr(0,17) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l138_c13
  // Check
  ASSUME(active[cr(0,17)] == 0);
  ASSUME(cr(0,17) >= iw(0,17));
  ASSUME(cr(0,17) >= 0);
  ASSUME(cr(0,17) >= cdy[0]);
  ASSUME(cr(0,17) >= cisb[0]);
  ASSUME(cr(0,17) >= cdl[0]);
  ASSUME(cr(0,17) >= cl[0]);
  // Update
  creg_r20 = cr(0,17);
  crmax(0,17) = max(crmax(0,17),cr(0,17));
  caddr[0] = max(caddr[0],0);
  if(cr(0,17) < cw(0,17)) {
    r20 = buff(0,17);
    ASSUME((!(( (cw(0,17) < 1) && (1 < crmax(0,17)) )))||(sforbid(17,1)> 0));
    ASSUME((!(( (cw(0,17) < 2) && (2 < crmax(0,17)) )))||(sforbid(17,2)> 0));
    ASSUME((!(( (cw(0,17) < 3) && (3 < crmax(0,17)) )))||(sforbid(17,3)> 0));
    ASSUME((!(( (cw(0,17) < 4) && (4 < crmax(0,17)) )))||(sforbid(17,4)> 0));
  } else {
    if(pw(0,17) != co(17,cr(0,17))) {
      ASSUME(cr(0,17) >= old_cr);
    }
    pw(0,17) = co(17,cr(0,17));
    r20 = mem(17,cr(0,17));
  }
  ASSUME(creturn[0] >= cr(0,17));

  //   call void @llvm.dbg.value(metadata i32 %11, metadata !300, metadata !DIExpression()), !dbg !320

  //   %12 = load i32, i32* @atom_1_X0_1, align 4, !dbg !175, !tbaa !142
  // LD: Guess
  old_cr = cr(0,12);
  cr(0,12) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l139_c13
  // Check
  ASSUME(active[cr(0,12)] == 0);
  ASSUME(cr(0,12) >= iw(0,12));
  ASSUME(cr(0,12) >= 0);
  ASSUME(cr(0,12) >= cdy[0]);
  ASSUME(cr(0,12) >= cisb[0]);
  ASSUME(cr(0,12) >= cdl[0]);
  ASSUME(cr(0,12) >= cl[0]);
  // Update
  creg_r21 = cr(0,12);
  crmax(0,12) = max(crmax(0,12),cr(0,12));
  caddr[0] = max(caddr[0],0);
  if(cr(0,12) < cw(0,12)) {
    r21 = buff(0,12);
    ASSUME((!(( (cw(0,12) < 1) && (1 < crmax(0,12)) )))||(sforbid(12,1)> 0));
    ASSUME((!(( (cw(0,12) < 2) && (2 < crmax(0,12)) )))||(sforbid(12,2)> 0));
    ASSUME((!(( (cw(0,12) < 3) && (3 < crmax(0,12)) )))||(sforbid(12,3)> 0));
    ASSUME((!(( (cw(0,12) < 4) && (4 < crmax(0,12)) )))||(sforbid(12,4)> 0));
  } else {
    if(pw(0,12) != co(12,cr(0,12))) {
      ASSUME(cr(0,12) >= old_cr);
    }
    pw(0,12) = co(12,cr(0,12));
    r21 = mem(12,cr(0,12));
  }
  ASSUME(creturn[0] >= cr(0,12));

  //   call void @llvm.dbg.value(metadata i32 %12, metadata !301, metadata !DIExpression()), !dbg !320

  //   %13 = load i32, i32* @atom_0_X3_1, align 4, !dbg !176, !tbaa !142
  // LD: Guess
  old_cr = cr(0,9);
  cr(0,9) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l140_c13
  // Check
  ASSUME(active[cr(0,9)] == 0);
  ASSUME(cr(0,9) >= iw(0,9));
  ASSUME(cr(0,9) >= 0);
  ASSUME(cr(0,9) >= cdy[0]);
  ASSUME(cr(0,9) >= cisb[0]);
  ASSUME(cr(0,9) >= cdl[0]);
  ASSUME(cr(0,9) >= cl[0]);
  // Update
  creg_r22 = cr(0,9);
  crmax(0,9) = max(crmax(0,9),cr(0,9));
  caddr[0] = max(caddr[0],0);
  if(cr(0,9) < cw(0,9)) {
    r22 = buff(0,9);
    ASSUME((!(( (cw(0,9) < 1) && (1 < crmax(0,9)) )))||(sforbid(9,1)> 0));
    ASSUME((!(( (cw(0,9) < 2) && (2 < crmax(0,9)) )))||(sforbid(9,2)> 0));
    ASSUME((!(( (cw(0,9) < 3) && (3 < crmax(0,9)) )))||(sforbid(9,3)> 0));
    ASSUME((!(( (cw(0,9) < 4) && (4 < crmax(0,9)) )))||(sforbid(9,4)> 0));
  } else {
    if(pw(0,9) != co(9,cr(0,9))) {
      ASSUME(cr(0,9) >= old_cr);
    }
    pw(0,9) = co(9,cr(0,9));
    r22 = mem(9,cr(0,9));
  }
  ASSUME(creturn[0] >= cr(0,9));

  //   call void @llvm.dbg.value(metadata i32 %13, metadata !302, metadata !DIExpression()), !dbg !320

  //   %or = or i32 %12, %13, !dbg !177
  creg_r23 = max(creg_r21,creg_r22);
  r23 = r21 | r22;

  //   call void @llvm.dbg.value(metadata i32 %or, metadata !303, metadata !DIExpression()), !dbg !320

  //   %14 = load i32, i32* @atom_3_X0_1, align 4, !dbg !178, !tbaa !142
  // LD: Guess
  old_cr = cr(0,18);
  cr(0,18) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l142_c13
  // Check
  ASSUME(active[cr(0,18)] == 0);
  ASSUME(cr(0,18) >= iw(0,18));
  ASSUME(cr(0,18) >= 0);
  ASSUME(cr(0,18) >= cdy[0]);
  ASSUME(cr(0,18) >= cisb[0]);
  ASSUME(cr(0,18) >= cdl[0]);
  ASSUME(cr(0,18) >= cl[0]);
  // Update
  creg_r24 = cr(0,18);
  crmax(0,18) = max(crmax(0,18),cr(0,18));
  caddr[0] = max(caddr[0],0);
  if(cr(0,18) < cw(0,18)) {
    r24 = buff(0,18);
    ASSUME((!(( (cw(0,18) < 1) && (1 < crmax(0,18)) )))||(sforbid(18,1)> 0));
    ASSUME((!(( (cw(0,18) < 2) && (2 < crmax(0,18)) )))||(sforbid(18,2)> 0));
    ASSUME((!(( (cw(0,18) < 3) && (3 < crmax(0,18)) )))||(sforbid(18,3)> 0));
    ASSUME((!(( (cw(0,18) < 4) && (4 < crmax(0,18)) )))||(sforbid(18,4)> 0));
  } else {
    if(pw(0,18) != co(18,cr(0,18))) {
      ASSUME(cr(0,18) >= old_cr);
    }
    pw(0,18) = co(18,cr(0,18));
    r24 = mem(18,cr(0,18));
  }
  ASSUME(creturn[0] >= cr(0,18));

  //   call void @llvm.dbg.value(metadata i32 %14, metadata !304, metadata !DIExpression()), !dbg !320

  //   %15 = load i32, i32* @atom_0_X5_1, align 4, !dbg !179, !tbaa !142
  // LD: Guess
  old_cr = cr(0,10);
  cr(0,10) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l143_c13
  // Check
  ASSUME(active[cr(0,10)] == 0);
  ASSUME(cr(0,10) >= iw(0,10));
  ASSUME(cr(0,10) >= 0);
  ASSUME(cr(0,10) >= cdy[0]);
  ASSUME(cr(0,10) >= cisb[0]);
  ASSUME(cr(0,10) >= cdl[0]);
  ASSUME(cr(0,10) >= cl[0]);
  // Update
  creg_r25 = cr(0,10);
  crmax(0,10) = max(crmax(0,10),cr(0,10));
  caddr[0] = max(caddr[0],0);
  if(cr(0,10) < cw(0,10)) {
    r25 = buff(0,10);
    ASSUME((!(( (cw(0,10) < 1) && (1 < crmax(0,10)) )))||(sforbid(10,1)> 0));
    ASSUME((!(( (cw(0,10) < 2) && (2 < crmax(0,10)) )))||(sforbid(10,2)> 0));
    ASSUME((!(( (cw(0,10) < 3) && (3 < crmax(0,10)) )))||(sforbid(10,3)> 0));
    ASSUME((!(( (cw(0,10) < 4) && (4 < crmax(0,10)) )))||(sforbid(10,4)> 0));
  } else {
    if(pw(0,10) != co(10,cr(0,10))) {
      ASSUME(cr(0,10) >= old_cr);
    }
    pw(0,10) = co(10,cr(0,10));
    r25 = mem(10,cr(0,10));
  }
  ASSUME(creturn[0] >= cr(0,10));

  //   call void @llvm.dbg.value(metadata i32 %15, metadata !305, metadata !DIExpression()), !dbg !320

  //   %or22 = or i32 %14, %15, !dbg !180
  creg_r26 = max(creg_r24,creg_r25);
  r26 = r24 | r25;

  //   call void @llvm.dbg.value(metadata i32 %or22, metadata !306, metadata !DIExpression()), !dbg !320

  //   %16 = load i32, i32* @atom_1_X2_1, align 4, !dbg !181, !tbaa !142
  // LD: Guess
  old_cr = cr(0,13);
  cr(0,13) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l145_c13
  // Check
  ASSUME(active[cr(0,13)] == 0);
  ASSUME(cr(0,13) >= iw(0,13));
  ASSUME(cr(0,13) >= 0);
  ASSUME(cr(0,13) >= cdy[0]);
  ASSUME(cr(0,13) >= cisb[0]);
  ASSUME(cr(0,13) >= cdl[0]);
  ASSUME(cr(0,13) >= cl[0]);
  // Update
  creg_r27 = cr(0,13);
  crmax(0,13) = max(crmax(0,13),cr(0,13));
  caddr[0] = max(caddr[0],0);
  if(cr(0,13) < cw(0,13)) {
    r27 = buff(0,13);
    ASSUME((!(( (cw(0,13) < 1) && (1 < crmax(0,13)) )))||(sforbid(13,1)> 0));
    ASSUME((!(( (cw(0,13) < 2) && (2 < crmax(0,13)) )))||(sforbid(13,2)> 0));
    ASSUME((!(( (cw(0,13) < 3) && (3 < crmax(0,13)) )))||(sforbid(13,3)> 0));
    ASSUME((!(( (cw(0,13) < 4) && (4 < crmax(0,13)) )))||(sforbid(13,4)> 0));
  } else {
    if(pw(0,13) != co(13,cr(0,13))) {
      ASSUME(cr(0,13) >= old_cr);
    }
    pw(0,13) = co(13,cr(0,13));
    r27 = mem(13,cr(0,13));
  }
  ASSUME(creturn[0] >= cr(0,13));

  //   call void @llvm.dbg.value(metadata i32 %16, metadata !307, metadata !DIExpression()), !dbg !320

  //   %17 = load i32, i32* @atom_2_X3_1, align 4, !dbg !182, !tbaa !142
  // LD: Guess
  old_cr = cr(0,15);
  cr(0,15) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l146_c13
  // Check
  ASSUME(active[cr(0,15)] == 0);
  ASSUME(cr(0,15) >= iw(0,15));
  ASSUME(cr(0,15) >= 0);
  ASSUME(cr(0,15) >= cdy[0]);
  ASSUME(cr(0,15) >= cisb[0]);
  ASSUME(cr(0,15) >= cdl[0]);
  ASSUME(cr(0,15) >= cl[0]);
  // Update
  creg_r28 = cr(0,15);
  crmax(0,15) = max(crmax(0,15),cr(0,15));
  caddr[0] = max(caddr[0],0);
  if(cr(0,15) < cw(0,15)) {
    r28 = buff(0,15);
    ASSUME((!(( (cw(0,15) < 1) && (1 < crmax(0,15)) )))||(sforbid(15,1)> 0));
    ASSUME((!(( (cw(0,15) < 2) && (2 < crmax(0,15)) )))||(sforbid(15,2)> 0));
    ASSUME((!(( (cw(0,15) < 3) && (3 < crmax(0,15)) )))||(sforbid(15,3)> 0));
    ASSUME((!(( (cw(0,15) < 4) && (4 < crmax(0,15)) )))||(sforbid(15,4)> 0));
  } else {
    if(pw(0,15) != co(15,cr(0,15))) {
      ASSUME(cr(0,15) >= old_cr);
    }
    pw(0,15) = co(15,cr(0,15));
    r28 = mem(15,cr(0,15));
  }
  ASSUME(creturn[0] >= cr(0,15));

  //   call void @llvm.dbg.value(metadata i32 %17, metadata !308, metadata !DIExpression()), !dbg !320

  //   %or23 = or i32 %16, %17, !dbg !183
  creg_r29 = max(creg_r27,creg_r28);
  r29 = r27 | r28;

  //   call void @llvm.dbg.value(metadata i32 %or23, metadata !309, metadata !DIExpression()), !dbg !320

  //   %18 = load i32, i32* @atom_3_X2_1, align 4, !dbg !184, !tbaa !142
  // LD: Guess
  old_cr = cr(0,19);
  cr(0,19) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l148_c13
  // Check
  ASSUME(active[cr(0,19)] == 0);
  ASSUME(cr(0,19) >= iw(0,19));
  ASSUME(cr(0,19) >= 0);
  ASSUME(cr(0,19) >= cdy[0]);
  ASSUME(cr(0,19) >= cisb[0]);
  ASSUME(cr(0,19) >= cdl[0]);
  ASSUME(cr(0,19) >= cl[0]);
  // Update
  creg_r30 = cr(0,19);
  crmax(0,19) = max(crmax(0,19),cr(0,19));
  caddr[0] = max(caddr[0],0);
  if(cr(0,19) < cw(0,19)) {
    r30 = buff(0,19);
    ASSUME((!(( (cw(0,19) < 1) && (1 < crmax(0,19)) )))||(sforbid(19,1)> 0));
    ASSUME((!(( (cw(0,19) < 2) && (2 < crmax(0,19)) )))||(sforbid(19,2)> 0));
    ASSUME((!(( (cw(0,19) < 3) && (3 < crmax(0,19)) )))||(sforbid(19,3)> 0));
    ASSUME((!(( (cw(0,19) < 4) && (4 < crmax(0,19)) )))||(sforbid(19,4)> 0));
  } else {
    if(pw(0,19) != co(19,cr(0,19))) {
      ASSUME(cr(0,19) >= old_cr);
    }
    pw(0,19) = co(19,cr(0,19));
    r30 = mem(19,cr(0,19));
  }
  ASSUME(creturn[0] >= cr(0,19));

  //   call void @llvm.dbg.value(metadata i32 %18, metadata !310, metadata !DIExpression()), !dbg !320

  //   %19 = load i32, i32* @atom_2_X5_1, align 4, !dbg !185, !tbaa !142
  // LD: Guess
  old_cr = cr(0,16);
  cr(0,16) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l149_c13
  // Check
  ASSUME(active[cr(0,16)] == 0);
  ASSUME(cr(0,16) >= iw(0,16));
  ASSUME(cr(0,16) >= 0);
  ASSUME(cr(0,16) >= cdy[0]);
  ASSUME(cr(0,16) >= cisb[0]);
  ASSUME(cr(0,16) >= cdl[0]);
  ASSUME(cr(0,16) >= cl[0]);
  // Update
  creg_r31 = cr(0,16);
  crmax(0,16) = max(crmax(0,16),cr(0,16));
  caddr[0] = max(caddr[0],0);
  if(cr(0,16) < cw(0,16)) {
    r31 = buff(0,16);
    ASSUME((!(( (cw(0,16) < 1) && (1 < crmax(0,16)) )))||(sforbid(16,1)> 0));
    ASSUME((!(( (cw(0,16) < 2) && (2 < crmax(0,16)) )))||(sforbid(16,2)> 0));
    ASSUME((!(( (cw(0,16) < 3) && (3 < crmax(0,16)) )))||(sforbid(16,3)> 0));
    ASSUME((!(( (cw(0,16) < 4) && (4 < crmax(0,16)) )))||(sforbid(16,4)> 0));
  } else {
    if(pw(0,16) != co(16,cr(0,16))) {
      ASSUME(cr(0,16) >= old_cr);
    }
    pw(0,16) = co(16,cr(0,16));
    r31 = mem(16,cr(0,16));
  }
  ASSUME(creturn[0] >= cr(0,16));

  //   call void @llvm.dbg.value(metadata i32 %19, metadata !311, metadata !DIExpression()), !dbg !320

  //   %or24 = or i32 %18, %19, !dbg !186
  creg_r32 = max(creg_r30,creg_r31);
  r32 = r30 | r31;

  //   call void @llvm.dbg.value(metadata i32 %or24, metadata !312, metadata !DIExpression()), !dbg !320

  //   %and = and i32 %or23, %or24, !dbg !187
  creg_r33 = max(creg_r29,creg_r32);
  r33 = r29 & r32;

  //   call void @llvm.dbg.value(metadata i32 %and, metadata !313, metadata !DIExpression()), !dbg !320

  //   %and25 = and i32 %or22, %and, !dbg !188
  creg_r34 = max(creg_r26,creg_r33);
  r34 = r26 & r33;

  //   call void @llvm.dbg.value(metadata i32 %and25, metadata !314, metadata !DIExpression()), !dbg !320

  //   %and26 = and i32 %or, %and25, !dbg !189
  creg_r35 = max(creg_r23,creg_r34);
  r35 = r23 & r34;

  //   call void @llvm.dbg.value(metadata i32 %and26, metadata !315, metadata !DIExpression()), !dbg !320

  //   %and27 = and i32 %11, %and26, !dbg !190
  creg_r36 = max(creg_r20,creg_r35);
  r36 = r20 & r35;

  //   call void @llvm.dbg.value(metadata i32 %and27, metadata !316, metadata !DIExpression()), !dbg !320

  //   %and28 = and i32 %10, %and27, !dbg !191
  creg_r37 = max(creg_r19,creg_r36);
  r37 = r19 & r36;

  //   call void @llvm.dbg.value(metadata i32 %and28, metadata !317, metadata !DIExpression()), !dbg !320

  //   %and29 = and i32 %9, %and28, !dbg !192
  creg_r38 = max(creg_r18,creg_r37);
  r38 = r18 & r37;

  //   call void @llvm.dbg.value(metadata i32 %and29, metadata !318, metadata !DIExpression()), !dbg !320

  //   %and30 = and i32 %8, %and29, !dbg !193
  creg_r39 = max(creg_r17,creg_r38);
  r39 = r17 & r38;

  //   call void @llvm.dbg.value(metadata i32 %and30, metadata !319, metadata !DIExpression()), !dbg !320

  //   %cmp = icmp eq i32 %and30, 1, !dbg !194
  creg__r39__1_ = max(0,creg_r39);

  //   br i1 %cmp, label %if.then, label %if.end, !dbg !196
  old_cctrl = cctrl[0];
  cctrl[0] = get_rng(0,NCONTEXT-1);
  ASSUME(cctrl[0] >= old_cctrl);
  ASSUME(cctrl[0] >= creg__r39__1_);
  if((r39==1)) {
    goto T0BLOCK1;
  } else {
    goto T0BLOCK2;
  }

T0BLOCK1:
  //   call void @__assert_fail(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([111 x i8], [111 x i8]* @.str.1, i64 0, i64 0), i32 noundef 158, i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #8, !dbg !197

  //   unreachable, !dbg !197
  r40 = 1;
  goto T0BLOCK_END;

T0BLOCK2:
  //   %20 = bitcast i64* %thr3 to i8*, !dbg !200

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %20) #7, !dbg !200

  //   %21 = bitcast i64* %thr2 to i8*, !dbg !200

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %21) #7, !dbg !200

  //   %22 = bitcast i64* %thr1 to i8*, !dbg !200

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %22) #7, !dbg !200

  //   %23 = bitcast i64* %thr0 to i8*, !dbg !200

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %23) #7, !dbg !200

  //   ret i32 0, !dbg !201
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
  ASSUME(meminit(9,1) == mem(9,0));
  ASSUME(coinit(9,1) == co(9,0));
  ASSUME(deltainit(9,1) == delta(9,0));
  ASSUME(meminit(9,2) == mem(9,1));
  ASSUME(coinit(9,2) == co(9,1));
  ASSUME(deltainit(9,2) == delta(9,1));
  ASSUME(meminit(9,3) == mem(9,2));
  ASSUME(coinit(9,3) == co(9,2));
  ASSUME(deltainit(9,3) == delta(9,2));
  ASSUME(meminit(9,4) == mem(9,3));
  ASSUME(coinit(9,4) == co(9,3));
  ASSUME(deltainit(9,4) == delta(9,3));
  ASSUME(meminit(10,1) == mem(10,0));
  ASSUME(coinit(10,1) == co(10,0));
  ASSUME(deltainit(10,1) == delta(10,0));
  ASSUME(meminit(10,2) == mem(10,1));
  ASSUME(coinit(10,2) == co(10,1));
  ASSUME(deltainit(10,2) == delta(10,1));
  ASSUME(meminit(10,3) == mem(10,2));
  ASSUME(coinit(10,3) == co(10,2));
  ASSUME(deltainit(10,3) == delta(10,2));
  ASSUME(meminit(10,4) == mem(10,3));
  ASSUME(coinit(10,4) == co(10,3));
  ASSUME(deltainit(10,4) == delta(10,3));
  ASSUME(meminit(11,1) == mem(11,0));
  ASSUME(coinit(11,1) == co(11,0));
  ASSUME(deltainit(11,1) == delta(11,0));
  ASSUME(meminit(11,2) == mem(11,1));
  ASSUME(coinit(11,2) == co(11,1));
  ASSUME(deltainit(11,2) == delta(11,1));
  ASSUME(meminit(11,3) == mem(11,2));
  ASSUME(coinit(11,3) == co(11,2));
  ASSUME(deltainit(11,3) == delta(11,2));
  ASSUME(meminit(11,4) == mem(11,3));
  ASSUME(coinit(11,4) == co(11,3));
  ASSUME(deltainit(11,4) == delta(11,3));
  ASSUME(meminit(12,1) == mem(12,0));
  ASSUME(coinit(12,1) == co(12,0));
  ASSUME(deltainit(12,1) == delta(12,0));
  ASSUME(meminit(12,2) == mem(12,1));
  ASSUME(coinit(12,2) == co(12,1));
  ASSUME(deltainit(12,2) == delta(12,1));
  ASSUME(meminit(12,3) == mem(12,2));
  ASSUME(coinit(12,3) == co(12,2));
  ASSUME(deltainit(12,3) == delta(12,2));
  ASSUME(meminit(12,4) == mem(12,3));
  ASSUME(coinit(12,4) == co(12,3));
  ASSUME(deltainit(12,4) == delta(12,3));
  ASSUME(meminit(13,1) == mem(13,0));
  ASSUME(coinit(13,1) == co(13,0));
  ASSUME(deltainit(13,1) == delta(13,0));
  ASSUME(meminit(13,2) == mem(13,1));
  ASSUME(coinit(13,2) == co(13,1));
  ASSUME(deltainit(13,2) == delta(13,1));
  ASSUME(meminit(13,3) == mem(13,2));
  ASSUME(coinit(13,3) == co(13,2));
  ASSUME(deltainit(13,3) == delta(13,2));
  ASSUME(meminit(13,4) == mem(13,3));
  ASSUME(coinit(13,4) == co(13,3));
  ASSUME(deltainit(13,4) == delta(13,3));
  ASSUME(meminit(14,1) == mem(14,0));
  ASSUME(coinit(14,1) == co(14,0));
  ASSUME(deltainit(14,1) == delta(14,0));
  ASSUME(meminit(14,2) == mem(14,1));
  ASSUME(coinit(14,2) == co(14,1));
  ASSUME(deltainit(14,2) == delta(14,1));
  ASSUME(meminit(14,3) == mem(14,2));
  ASSUME(coinit(14,3) == co(14,2));
  ASSUME(deltainit(14,3) == delta(14,2));
  ASSUME(meminit(14,4) == mem(14,3));
  ASSUME(coinit(14,4) == co(14,3));
  ASSUME(deltainit(14,4) == delta(14,3));
  ASSUME(meminit(15,1) == mem(15,0));
  ASSUME(coinit(15,1) == co(15,0));
  ASSUME(deltainit(15,1) == delta(15,0));
  ASSUME(meminit(15,2) == mem(15,1));
  ASSUME(coinit(15,2) == co(15,1));
  ASSUME(deltainit(15,2) == delta(15,1));
  ASSUME(meminit(15,3) == mem(15,2));
  ASSUME(coinit(15,3) == co(15,2));
  ASSUME(deltainit(15,3) == delta(15,2));
  ASSUME(meminit(15,4) == mem(15,3));
  ASSUME(coinit(15,4) == co(15,3));
  ASSUME(deltainit(15,4) == delta(15,3));
  ASSUME(meminit(16,1) == mem(16,0));
  ASSUME(coinit(16,1) == co(16,0));
  ASSUME(deltainit(16,1) == delta(16,0));
  ASSUME(meminit(16,2) == mem(16,1));
  ASSUME(coinit(16,2) == co(16,1));
  ASSUME(deltainit(16,2) == delta(16,1));
  ASSUME(meminit(16,3) == mem(16,2));
  ASSUME(coinit(16,3) == co(16,2));
  ASSUME(deltainit(16,3) == delta(16,2));
  ASSUME(meminit(16,4) == mem(16,3));
  ASSUME(coinit(16,4) == co(16,3));
  ASSUME(deltainit(16,4) == delta(16,3));
  ASSUME(meminit(17,1) == mem(17,0));
  ASSUME(coinit(17,1) == co(17,0));
  ASSUME(deltainit(17,1) == delta(17,0));
  ASSUME(meminit(17,2) == mem(17,1));
  ASSUME(coinit(17,2) == co(17,1));
  ASSUME(deltainit(17,2) == delta(17,1));
  ASSUME(meminit(17,3) == mem(17,2));
  ASSUME(coinit(17,3) == co(17,2));
  ASSUME(deltainit(17,3) == delta(17,2));
  ASSUME(meminit(17,4) == mem(17,3));
  ASSUME(coinit(17,4) == co(17,3));
  ASSUME(deltainit(17,4) == delta(17,3));
  ASSUME(meminit(18,1) == mem(18,0));
  ASSUME(coinit(18,1) == co(18,0));
  ASSUME(deltainit(18,1) == delta(18,0));
  ASSUME(meminit(18,2) == mem(18,1));
  ASSUME(coinit(18,2) == co(18,1));
  ASSUME(deltainit(18,2) == delta(18,1));
  ASSUME(meminit(18,3) == mem(18,2));
  ASSUME(coinit(18,3) == co(18,2));
  ASSUME(deltainit(18,3) == delta(18,2));
  ASSUME(meminit(18,4) == mem(18,3));
  ASSUME(coinit(18,4) == co(18,3));
  ASSUME(deltainit(18,4) == delta(18,3));
  ASSUME(meminit(19,1) == mem(19,0));
  ASSUME(coinit(19,1) == co(19,0));
  ASSUME(deltainit(19,1) == delta(19,0));
  ASSUME(meminit(19,2) == mem(19,1));
  ASSUME(coinit(19,2) == co(19,1));
  ASSUME(deltainit(19,2) == delta(19,1));
  ASSUME(meminit(19,3) == mem(19,2));
  ASSUME(coinit(19,3) == co(19,2));
  ASSUME(deltainit(19,3) == delta(19,2));
  ASSUME(meminit(19,4) == mem(19,3));
  ASSUME(coinit(19,4) == co(19,3));
  ASSUME(deltainit(19,4) == delta(19,3));

  ASSERT(r40== 0);

}
