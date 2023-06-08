// 0:vars:8
// 8:atom_0_X0_1:1
// 13:atom_0_X3_1:1
// 16:atom_1_X2_1:1
// 15:atom_0_X5_1:1
// 9:atom_1_X4_1:1
// 14:atom_3_X0_1:1
// 12:atom_1_X0_1:1
// 18:atom_3_X2_1:1
// 20:thr0:1
// 21:thr1:1
// 22:thr2:1
// 23:thr3:1
// 10:atom_2_X0_1:1
// 17:atom_2_X3_1:1
// 19:atom_2_X5_1:1
// 11:atom_3_X4_1:1
#define ADDRSIZE 24
#define NPROC 5
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
  buff(0,20) = 0;
  pw(0,20) = 0;
  cr(0,20) = 0;
  iw(0,20) = 0;
  cw(0,20) = 0;
  cx(0,20) = 0;
  is(0,20) = 0;
  cs(0,20) = 0;
  crmax(0,20) = 0;
  buff(0,21) = 0;
  pw(0,21) = 0;
  cr(0,21) = 0;
  iw(0,21) = 0;
  cw(0,21) = 0;
  cx(0,21) = 0;
  is(0,21) = 0;
  cs(0,21) = 0;
  crmax(0,21) = 0;
  buff(0,22) = 0;
  pw(0,22) = 0;
  cr(0,22) = 0;
  iw(0,22) = 0;
  cw(0,22) = 0;
  cx(0,22) = 0;
  is(0,22) = 0;
  cs(0,22) = 0;
  crmax(0,22) = 0;
  buff(0,23) = 0;
  pw(0,23) = 0;
  cr(0,23) = 0;
  iw(0,23) = 0;
  cw(0,23) = 0;
  cx(0,23) = 0;
  is(0,23) = 0;
  cs(0,23) = 0;
  crmax(0,23) = 0;
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
  buff(1,20) = 0;
  pw(1,20) = 0;
  cr(1,20) = 0;
  iw(1,20) = 0;
  cw(1,20) = 0;
  cx(1,20) = 0;
  is(1,20) = 0;
  cs(1,20) = 0;
  crmax(1,20) = 0;
  buff(1,21) = 0;
  pw(1,21) = 0;
  cr(1,21) = 0;
  iw(1,21) = 0;
  cw(1,21) = 0;
  cx(1,21) = 0;
  is(1,21) = 0;
  cs(1,21) = 0;
  crmax(1,21) = 0;
  buff(1,22) = 0;
  pw(1,22) = 0;
  cr(1,22) = 0;
  iw(1,22) = 0;
  cw(1,22) = 0;
  cx(1,22) = 0;
  is(1,22) = 0;
  cs(1,22) = 0;
  crmax(1,22) = 0;
  buff(1,23) = 0;
  pw(1,23) = 0;
  cr(1,23) = 0;
  iw(1,23) = 0;
  cw(1,23) = 0;
  cx(1,23) = 0;
  is(1,23) = 0;
  cs(1,23) = 0;
  crmax(1,23) = 0;
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
  buff(2,20) = 0;
  pw(2,20) = 0;
  cr(2,20) = 0;
  iw(2,20) = 0;
  cw(2,20) = 0;
  cx(2,20) = 0;
  is(2,20) = 0;
  cs(2,20) = 0;
  crmax(2,20) = 0;
  buff(2,21) = 0;
  pw(2,21) = 0;
  cr(2,21) = 0;
  iw(2,21) = 0;
  cw(2,21) = 0;
  cx(2,21) = 0;
  is(2,21) = 0;
  cs(2,21) = 0;
  crmax(2,21) = 0;
  buff(2,22) = 0;
  pw(2,22) = 0;
  cr(2,22) = 0;
  iw(2,22) = 0;
  cw(2,22) = 0;
  cx(2,22) = 0;
  is(2,22) = 0;
  cs(2,22) = 0;
  crmax(2,22) = 0;
  buff(2,23) = 0;
  pw(2,23) = 0;
  cr(2,23) = 0;
  iw(2,23) = 0;
  cw(2,23) = 0;
  cx(2,23) = 0;
  is(2,23) = 0;
  cs(2,23) = 0;
  crmax(2,23) = 0;
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
  buff(3,20) = 0;
  pw(3,20) = 0;
  cr(3,20) = 0;
  iw(3,20) = 0;
  cw(3,20) = 0;
  cx(3,20) = 0;
  is(3,20) = 0;
  cs(3,20) = 0;
  crmax(3,20) = 0;
  buff(3,21) = 0;
  pw(3,21) = 0;
  cr(3,21) = 0;
  iw(3,21) = 0;
  cw(3,21) = 0;
  cx(3,21) = 0;
  is(3,21) = 0;
  cs(3,21) = 0;
  crmax(3,21) = 0;
  buff(3,22) = 0;
  pw(3,22) = 0;
  cr(3,22) = 0;
  iw(3,22) = 0;
  cw(3,22) = 0;
  cx(3,22) = 0;
  is(3,22) = 0;
  cs(3,22) = 0;
  crmax(3,22) = 0;
  buff(3,23) = 0;
  pw(3,23) = 0;
  cr(3,23) = 0;
  iw(3,23) = 0;
  cw(3,23) = 0;
  cx(3,23) = 0;
  is(3,23) = 0;
  cs(3,23) = 0;
  crmax(3,23) = 0;
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
  buff(4,20) = 0;
  pw(4,20) = 0;
  cr(4,20) = 0;
  iw(4,20) = 0;
  cw(4,20) = 0;
  cx(4,20) = 0;
  is(4,20) = 0;
  cs(4,20) = 0;
  crmax(4,20) = 0;
  buff(4,21) = 0;
  pw(4,21) = 0;
  cr(4,21) = 0;
  iw(4,21) = 0;
  cw(4,21) = 0;
  cx(4,21) = 0;
  is(4,21) = 0;
  cs(4,21) = 0;
  crmax(4,21) = 0;
  buff(4,22) = 0;
  pw(4,22) = 0;
  cr(4,22) = 0;
  iw(4,22) = 0;
  cw(4,22) = 0;
  cx(4,22) = 0;
  is(4,22) = 0;
  cs(4,22) = 0;
  crmax(4,22) = 0;
  buff(4,23) = 0;
  pw(4,23) = 0;
  cr(4,23) = 0;
  iw(4,23) = 0;
  cw(4,23) = 0;
  cx(4,23) = 0;
  is(4,23) = 0;
  cs(4,23) = 0;
  crmax(4,23) = 0;
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
  mem(0+3,0) = 0;
  mem(0+4,0) = 0;
  mem(0+5,0) = 0;
  mem(0+6,0) = 0;
  mem(0+7,0) = 0;
  mem(8+0,0) = 0;
  mem(13+0,0) = 0;
  mem(16+0,0) = 0;
  mem(15+0,0) = 0;
  mem(9+0,0) = 0;
  mem(14+0,0) = 0;
  mem(12+0,0) = 0;
  mem(18+0,0) = 0;
  mem(20+0,0) = 0;
  mem(21+0,0) = 0;
  mem(22+0,0) = 0;
  mem(23+0,0) = 0;
  mem(10+0,0) = 0;
  mem(17+0,0) = 0;
  mem(19+0,0) = 0;
  mem(11+0,0) = 0;
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
  co(11,0) = 0;
  delta(11,0) = -1;
  co(12,0) = 0;
  delta(12,0) = -1;
  co(13,0) = 0;
  delta(13,0) = -1;
  co(14,0) = 0;
  delta(14,0) = -1;
  co(15,0) = 0;
  delta(15,0) = -1;
  co(16,0) = 0;
  delta(16,0) = -1;
  co(17,0) = 0;
  delta(17,0) = -1;
  co(18,0) = 0;
  delta(18,0) = -1;
  co(19,0) = 0;
  delta(19,0) = -1;
  co(20,0) = 0;
  delta(20,0) = -1;
  co(21,0) = 0;
  delta(21,0) = -1;
  co(22,0) = 0;
  delta(22,0) = -1;
  co(23,0) = 0;
  delta(23,0) = -1;
  // Dumping thread 1
  int ret_thread_1 = 0;
  cdy[1] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[1] >= cstart[1]);
T1BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !55, metadata !DIExpression()), !dbg !89

  //   br label %label_1, !dbg !90
  goto T1BLOCK1;

T1BLOCK1:
  //   call void @llvm.dbg.label(metadata !88), !dbg !91

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 4), metadata !58, metadata !DIExpression()), !dbg !92

  //   %0 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 4) monotonic, align 8, !dbg !93
  // LD: Guess
  old_cr = cr(1,0+4*1);
  cr(1,0+4*1) = get_rng(0,NCONTEXT-1);// 1 ASSIGN LDCOM 
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
  } else {
    if(pw(1,0+4*1) != co(0+4*1,cr(1,0+4*1))) {
      ASSUME(cr(1,0+4*1) >= old_cr);
    }
    pw(1,0+4*1) = co(0+4*1,cr(1,0+4*1));
    r0 = mem(0+4*1,cr(1,0+4*1));
  }
  ASSUME(creturn[1] >= cr(1,0+4*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !61, metadata !DIExpression()), !dbg !92

  //   %conv = trunc i64 %0 to i32, !dbg !94

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !56, metadata !DIExpression()), !dbg !89

  //   call void (...) @dmbsy(), !dbg !95
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
  ASSUME(cdy[1] >= cw(1,0+4));
  ASSUME(cdy[1] >= cw(1,0+5));
  ASSUME(cdy[1] >= cw(1,0+6));
  ASSUME(cdy[1] >= cw(1,0+7));
  ASSUME(cdy[1] >= cw(1,8+0));
  ASSUME(cdy[1] >= cw(1,13+0));
  ASSUME(cdy[1] >= cw(1,16+0));
  ASSUME(cdy[1] >= cw(1,15+0));
  ASSUME(cdy[1] >= cw(1,9+0));
  ASSUME(cdy[1] >= cw(1,14+0));
  ASSUME(cdy[1] >= cw(1,12+0));
  ASSUME(cdy[1] >= cw(1,18+0));
  ASSUME(cdy[1] >= cw(1,20+0));
  ASSUME(cdy[1] >= cw(1,21+0));
  ASSUME(cdy[1] >= cw(1,22+0));
  ASSUME(cdy[1] >= cw(1,23+0));
  ASSUME(cdy[1] >= cw(1,10+0));
  ASSUME(cdy[1] >= cw(1,17+0));
  ASSUME(cdy[1] >= cw(1,19+0));
  ASSUME(cdy[1] >= cw(1,11+0));
  ASSUME(cdy[1] >= cr(1,0+0));
  ASSUME(cdy[1] >= cr(1,0+1));
  ASSUME(cdy[1] >= cr(1,0+2));
  ASSUME(cdy[1] >= cr(1,0+3));
  ASSUME(cdy[1] >= cr(1,0+4));
  ASSUME(cdy[1] >= cr(1,0+5));
  ASSUME(cdy[1] >= cr(1,0+6));
  ASSUME(cdy[1] >= cr(1,0+7));
  ASSUME(cdy[1] >= cr(1,8+0));
  ASSUME(cdy[1] >= cr(1,13+0));
  ASSUME(cdy[1] >= cr(1,16+0));
  ASSUME(cdy[1] >= cr(1,15+0));
  ASSUME(cdy[1] >= cr(1,9+0));
  ASSUME(cdy[1] >= cr(1,14+0));
  ASSUME(cdy[1] >= cr(1,12+0));
  ASSUME(cdy[1] >= cr(1,18+0));
  ASSUME(cdy[1] >= cr(1,20+0));
  ASSUME(cdy[1] >= cr(1,21+0));
  ASSUME(cdy[1] >= cr(1,22+0));
  ASSUME(cdy[1] >= cr(1,23+0));
  ASSUME(cdy[1] >= cr(1,10+0));
  ASSUME(cdy[1] >= cr(1,17+0));
  ASSUME(cdy[1] >= cr(1,19+0));
  ASSUME(cdy[1] >= cr(1,11+0));
  ASSUME(creturn[1] >= cdy[1]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 3), metadata !62, metadata !DIExpression()), !dbg !96

  //   call void @llvm.dbg.value(metadata i64 1, metadata !64, metadata !DIExpression()), !dbg !96

  //   store atomic i64 1, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 3) release, align 8, !dbg !97
  // ST: Guess
  //   : Release
  iw(1,0+3*1) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW 
  old_cw = cw(1,0+3*1);
  cw(1,0+3*1) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM 
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
  ASSUME(cw(1,0+3*1) >= cr(1,0+0));
  ASSUME(cw(1,0+3*1) >= cr(1,0+1));
  ASSUME(cw(1,0+3*1) >= cr(1,0+2));
  ASSUME(cw(1,0+3*1) >= cr(1,0+3));
  ASSUME(cw(1,0+3*1) >= cr(1,0+4));
  ASSUME(cw(1,0+3*1) >= cr(1,0+5));
  ASSUME(cw(1,0+3*1) >= cr(1,0+6));
  ASSUME(cw(1,0+3*1) >= cr(1,0+7));
  ASSUME(cw(1,0+3*1) >= cr(1,8+0));
  ASSUME(cw(1,0+3*1) >= cr(1,13+0));
  ASSUME(cw(1,0+3*1) >= cr(1,16+0));
  ASSUME(cw(1,0+3*1) >= cr(1,15+0));
  ASSUME(cw(1,0+3*1) >= cr(1,9+0));
  ASSUME(cw(1,0+3*1) >= cr(1,14+0));
  ASSUME(cw(1,0+3*1) >= cr(1,12+0));
  ASSUME(cw(1,0+3*1) >= cr(1,18+0));
  ASSUME(cw(1,0+3*1) >= cr(1,20+0));
  ASSUME(cw(1,0+3*1) >= cr(1,21+0));
  ASSUME(cw(1,0+3*1) >= cr(1,22+0));
  ASSUME(cw(1,0+3*1) >= cr(1,23+0));
  ASSUME(cw(1,0+3*1) >= cr(1,10+0));
  ASSUME(cw(1,0+3*1) >= cr(1,17+0));
  ASSUME(cw(1,0+3*1) >= cr(1,19+0));
  ASSUME(cw(1,0+3*1) >= cr(1,11+0));
  ASSUME(cw(1,0+3*1) >= cw(1,0+0));
  ASSUME(cw(1,0+3*1) >= cw(1,0+1));
  ASSUME(cw(1,0+3*1) >= cw(1,0+2));
  ASSUME(cw(1,0+3*1) >= cw(1,0+3));
  ASSUME(cw(1,0+3*1) >= cw(1,0+4));
  ASSUME(cw(1,0+3*1) >= cw(1,0+5));
  ASSUME(cw(1,0+3*1) >= cw(1,0+6));
  ASSUME(cw(1,0+3*1) >= cw(1,0+7));
  ASSUME(cw(1,0+3*1) >= cw(1,8+0));
  ASSUME(cw(1,0+3*1) >= cw(1,13+0));
  ASSUME(cw(1,0+3*1) >= cw(1,16+0));
  ASSUME(cw(1,0+3*1) >= cw(1,15+0));
  ASSUME(cw(1,0+3*1) >= cw(1,9+0));
  ASSUME(cw(1,0+3*1) >= cw(1,14+0));
  ASSUME(cw(1,0+3*1) >= cw(1,12+0));
  ASSUME(cw(1,0+3*1) >= cw(1,18+0));
  ASSUME(cw(1,0+3*1) >= cw(1,20+0));
  ASSUME(cw(1,0+3*1) >= cw(1,21+0));
  ASSUME(cw(1,0+3*1) >= cw(1,22+0));
  ASSUME(cw(1,0+3*1) >= cw(1,23+0));
  ASSUME(cw(1,0+3*1) >= cw(1,10+0));
  ASSUME(cw(1,0+3*1) >= cw(1,17+0));
  ASSUME(cw(1,0+3*1) >= cw(1,19+0));
  ASSUME(cw(1,0+3*1) >= cw(1,11+0));
  // Update
  caddr[1] = max(caddr[1],0);
  buff(1,0+3*1) = 1;
  mem(0+3*1,cw(1,0+3*1)) = 1;
  co(0+3*1,cw(1,0+3*1))+=1;
  delta(0+3*1,cw(1,0+3*1)) = -1;
  is(1,0+3*1) = iw(1,0+3*1);
  cs(1,0+3*1) = cw(1,0+3*1);
  ASSUME(creturn[1] >= cw(1,0+3*1));

  //   call void (...) @dmbsy(), !dbg !98
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
  ASSUME(cdy[1] >= cw(1,0+4));
  ASSUME(cdy[1] >= cw(1,0+5));
  ASSUME(cdy[1] >= cw(1,0+6));
  ASSUME(cdy[1] >= cw(1,0+7));
  ASSUME(cdy[1] >= cw(1,8+0));
  ASSUME(cdy[1] >= cw(1,13+0));
  ASSUME(cdy[1] >= cw(1,16+0));
  ASSUME(cdy[1] >= cw(1,15+0));
  ASSUME(cdy[1] >= cw(1,9+0));
  ASSUME(cdy[1] >= cw(1,14+0));
  ASSUME(cdy[1] >= cw(1,12+0));
  ASSUME(cdy[1] >= cw(1,18+0));
  ASSUME(cdy[1] >= cw(1,20+0));
  ASSUME(cdy[1] >= cw(1,21+0));
  ASSUME(cdy[1] >= cw(1,22+0));
  ASSUME(cdy[1] >= cw(1,23+0));
  ASSUME(cdy[1] >= cw(1,10+0));
  ASSUME(cdy[1] >= cw(1,17+0));
  ASSUME(cdy[1] >= cw(1,19+0));
  ASSUME(cdy[1] >= cw(1,11+0));
  ASSUME(cdy[1] >= cr(1,0+0));
  ASSUME(cdy[1] >= cr(1,0+1));
  ASSUME(cdy[1] >= cr(1,0+2));
  ASSUME(cdy[1] >= cr(1,0+3));
  ASSUME(cdy[1] >= cr(1,0+4));
  ASSUME(cdy[1] >= cr(1,0+5));
  ASSUME(cdy[1] >= cr(1,0+6));
  ASSUME(cdy[1] >= cr(1,0+7));
  ASSUME(cdy[1] >= cr(1,8+0));
  ASSUME(cdy[1] >= cr(1,13+0));
  ASSUME(cdy[1] >= cr(1,16+0));
  ASSUME(cdy[1] >= cr(1,15+0));
  ASSUME(cdy[1] >= cr(1,9+0));
  ASSUME(cdy[1] >= cr(1,14+0));
  ASSUME(cdy[1] >= cr(1,12+0));
  ASSUME(cdy[1] >= cr(1,18+0));
  ASSUME(cdy[1] >= cr(1,20+0));
  ASSUME(cdy[1] >= cr(1,21+0));
  ASSUME(cdy[1] >= cr(1,22+0));
  ASSUME(cdy[1] >= cr(1,23+0));
  ASSUME(cdy[1] >= cr(1,10+0));
  ASSUME(cdy[1] >= cr(1,17+0));
  ASSUME(cdy[1] >= cr(1,19+0));
  ASSUME(cdy[1] >= cr(1,11+0));
  ASSUME(creturn[1] >= cdy[1]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 2), metadata !66, metadata !DIExpression()), !dbg !99

  //   %1 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 2) acquire, align 8, !dbg !100
  // LD: Guess
  //   : Acquire
  old_cr = cr(1,0+2*1);
  cr(1,0+2*1) = get_rng(0,NCONTEXT-1);// 1 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(1,0+2*1)] == 1);
  ASSUME(cr(1,0+2*1) >= iw(1,0+2*1));
  ASSUME(cr(1,0+2*1) >= 0);
  ASSUME(cr(1,0+2*1) >= cdy[1]);
  ASSUME(cr(1,0+2*1) >= cisb[1]);
  ASSUME(cr(1,0+2*1) >= cdl[1]);
  ASSUME(cr(1,0+2*1) >= cl[1]);
  ASSUME(cr(1,0+2*1) >= cx(1,0+2*1));
  ASSUME(cr(1,0+2*1) >= cs(1,0+0));
  ASSUME(cr(1,0+2*1) >= cs(1,0+1));
  ASSUME(cr(1,0+2*1) >= cs(1,0+2));
  ASSUME(cr(1,0+2*1) >= cs(1,0+3));
  ASSUME(cr(1,0+2*1) >= cs(1,0+4));
  ASSUME(cr(1,0+2*1) >= cs(1,0+5));
  ASSUME(cr(1,0+2*1) >= cs(1,0+6));
  ASSUME(cr(1,0+2*1) >= cs(1,0+7));
  ASSUME(cr(1,0+2*1) >= cs(1,8+0));
  ASSUME(cr(1,0+2*1) >= cs(1,13+0));
  ASSUME(cr(1,0+2*1) >= cs(1,16+0));
  ASSUME(cr(1,0+2*1) >= cs(1,15+0));
  ASSUME(cr(1,0+2*1) >= cs(1,9+0));
  ASSUME(cr(1,0+2*1) >= cs(1,14+0));
  ASSUME(cr(1,0+2*1) >= cs(1,12+0));
  ASSUME(cr(1,0+2*1) >= cs(1,18+0));
  ASSUME(cr(1,0+2*1) >= cs(1,20+0));
  ASSUME(cr(1,0+2*1) >= cs(1,21+0));
  ASSUME(cr(1,0+2*1) >= cs(1,22+0));
  ASSUME(cr(1,0+2*1) >= cs(1,23+0));
  ASSUME(cr(1,0+2*1) >= cs(1,10+0));
  ASSUME(cr(1,0+2*1) >= cs(1,17+0));
  ASSUME(cr(1,0+2*1) >= cs(1,19+0));
  ASSUME(cr(1,0+2*1) >= cs(1,11+0));
  // Update
  creg_r1 = cr(1,0+2*1);
  crmax(1,0+2*1) = max(crmax(1,0+2*1),cr(1,0+2*1));
  caddr[1] = max(caddr[1],0);
  if(cr(1,0+2*1) < cw(1,0+2*1)) {
    r1 = buff(1,0+2*1);
  } else {
    if(pw(1,0+2*1) != co(0+2*1,cr(1,0+2*1))) {
      ASSUME(cr(1,0+2*1) >= old_cr);
    }
    pw(1,0+2*1) = co(0+2*1,cr(1,0+2*1));
    r1 = mem(0+2*1,cr(1,0+2*1));
  }
  cl[1] = max(cl[1],cr(1,0+2*1));
  ASSUME(creturn[1] >= cr(1,0+2*1));

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !68, metadata !DIExpression()), !dbg !99

  //   %conv4 = trunc i64 %1 to i32, !dbg !101

  //   call void @llvm.dbg.value(metadata i32 %conv4, metadata !65, metadata !DIExpression()), !dbg !89

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 1), metadata !70, metadata !DIExpression()), !dbg !102

  //   %2 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 1) acquire, align 8, !dbg !103
  // LD: Guess
  //   : Acquire
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
  ASSUME(cr(1,0+1*1) >= cx(1,0+1*1));
  ASSUME(cr(1,0+1*1) >= cs(1,0+0));
  ASSUME(cr(1,0+1*1) >= cs(1,0+1));
  ASSUME(cr(1,0+1*1) >= cs(1,0+2));
  ASSUME(cr(1,0+1*1) >= cs(1,0+3));
  ASSUME(cr(1,0+1*1) >= cs(1,0+4));
  ASSUME(cr(1,0+1*1) >= cs(1,0+5));
  ASSUME(cr(1,0+1*1) >= cs(1,0+6));
  ASSUME(cr(1,0+1*1) >= cs(1,0+7));
  ASSUME(cr(1,0+1*1) >= cs(1,8+0));
  ASSUME(cr(1,0+1*1) >= cs(1,13+0));
  ASSUME(cr(1,0+1*1) >= cs(1,16+0));
  ASSUME(cr(1,0+1*1) >= cs(1,15+0));
  ASSUME(cr(1,0+1*1) >= cs(1,9+0));
  ASSUME(cr(1,0+1*1) >= cs(1,14+0));
  ASSUME(cr(1,0+1*1) >= cs(1,12+0));
  ASSUME(cr(1,0+1*1) >= cs(1,18+0));
  ASSUME(cr(1,0+1*1) >= cs(1,20+0));
  ASSUME(cr(1,0+1*1) >= cs(1,21+0));
  ASSUME(cr(1,0+1*1) >= cs(1,22+0));
  ASSUME(cr(1,0+1*1) >= cs(1,23+0));
  ASSUME(cr(1,0+1*1) >= cs(1,10+0));
  ASSUME(cr(1,0+1*1) >= cs(1,17+0));
  ASSUME(cr(1,0+1*1) >= cs(1,19+0));
  ASSUME(cr(1,0+1*1) >= cs(1,11+0));
  // Update
  creg_r2 = cr(1,0+1*1);
  crmax(1,0+1*1) = max(crmax(1,0+1*1),cr(1,0+1*1));
  caddr[1] = max(caddr[1],0);
  if(cr(1,0+1*1) < cw(1,0+1*1)) {
    r2 = buff(1,0+1*1);
  } else {
    if(pw(1,0+1*1) != co(0+1*1,cr(1,0+1*1))) {
      ASSUME(cr(1,0+1*1) >= old_cr);
    }
    pw(1,0+1*1) = co(0+1*1,cr(1,0+1*1));
    r2 = mem(0+1*1,cr(1,0+1*1));
  }
  cl[1] = max(cl[1],cr(1,0+1*1));
  ASSUME(creturn[1] >= cr(1,0+1*1));

  //   call void @llvm.dbg.value(metadata i64 %2, metadata !72, metadata !DIExpression()), !dbg !102

  //   %conv8 = trunc i64 %2 to i32, !dbg !104

  //   call void @llvm.dbg.value(metadata i32 %conv8, metadata !69, metadata !DIExpression()), !dbg !89

  //   call void (...) @dmbsy(), !dbg !105
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
  ASSUME(cdy[1] >= cw(1,0+4));
  ASSUME(cdy[1] >= cw(1,0+5));
  ASSUME(cdy[1] >= cw(1,0+6));
  ASSUME(cdy[1] >= cw(1,0+7));
  ASSUME(cdy[1] >= cw(1,8+0));
  ASSUME(cdy[1] >= cw(1,13+0));
  ASSUME(cdy[1] >= cw(1,16+0));
  ASSUME(cdy[1] >= cw(1,15+0));
  ASSUME(cdy[1] >= cw(1,9+0));
  ASSUME(cdy[1] >= cw(1,14+0));
  ASSUME(cdy[1] >= cw(1,12+0));
  ASSUME(cdy[1] >= cw(1,18+0));
  ASSUME(cdy[1] >= cw(1,20+0));
  ASSUME(cdy[1] >= cw(1,21+0));
  ASSUME(cdy[1] >= cw(1,22+0));
  ASSUME(cdy[1] >= cw(1,23+0));
  ASSUME(cdy[1] >= cw(1,10+0));
  ASSUME(cdy[1] >= cw(1,17+0));
  ASSUME(cdy[1] >= cw(1,19+0));
  ASSUME(cdy[1] >= cw(1,11+0));
  ASSUME(cdy[1] >= cr(1,0+0));
  ASSUME(cdy[1] >= cr(1,0+1));
  ASSUME(cdy[1] >= cr(1,0+2));
  ASSUME(cdy[1] >= cr(1,0+3));
  ASSUME(cdy[1] >= cr(1,0+4));
  ASSUME(cdy[1] >= cr(1,0+5));
  ASSUME(cdy[1] >= cr(1,0+6));
  ASSUME(cdy[1] >= cr(1,0+7));
  ASSUME(cdy[1] >= cr(1,8+0));
  ASSUME(cdy[1] >= cr(1,13+0));
  ASSUME(cdy[1] >= cr(1,16+0));
  ASSUME(cdy[1] >= cr(1,15+0));
  ASSUME(cdy[1] >= cr(1,9+0));
  ASSUME(cdy[1] >= cr(1,14+0));
  ASSUME(cdy[1] >= cr(1,12+0));
  ASSUME(cdy[1] >= cr(1,18+0));
  ASSUME(cdy[1] >= cr(1,20+0));
  ASSUME(cdy[1] >= cr(1,21+0));
  ASSUME(cdy[1] >= cr(1,22+0));
  ASSUME(cdy[1] >= cr(1,23+0));
  ASSUME(cdy[1] >= cr(1,10+0));
  ASSUME(cdy[1] >= cr(1,17+0));
  ASSUME(cdy[1] >= cr(1,19+0));
  ASSUME(cdy[1] >= cr(1,11+0));
  ASSUME(creturn[1] >= cdy[1]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 0), metadata !73, metadata !DIExpression()), !dbg !106

  //   call void @llvm.dbg.value(metadata i64 1, metadata !75, metadata !DIExpression()), !dbg !106

  //   store atomic i64 1, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !107
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

  //   %cmp = icmp eq i32 %conv, 1, !dbg !108

  //   %conv11 = zext i1 %cmp to i32, !dbg !108

  //   call void @llvm.dbg.value(metadata i32 %conv11, metadata !76, metadata !DIExpression()), !dbg !89

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X0_1, metadata !77, metadata !DIExpression()), !dbg !109

  //   %3 = zext i32 %conv11 to i64

  //   call void @llvm.dbg.value(metadata i64 %3, metadata !79, metadata !DIExpression()), !dbg !109

  //   store atomic i64 %3, i64* @atom_0_X0_1 seq_cst, align 8, !dbg !110
  // ST: Guess
  iw(1,8) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW 
  old_cw = cw(1,8);
  cw(1,8) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(1,8)] == 1);
  ASSUME(active[cw(1,8)] == 1);
  ASSUME(sforbid(8,cw(1,8))== 0);
  ASSUME(iw(1,8) >= max(creg_r0,0));
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

  //   %cmp15 = icmp eq i32 %conv4, 1, !dbg !111

  //   %conv16 = zext i1 %cmp15 to i32, !dbg !111

  //   call void @llvm.dbg.value(metadata i32 %conv16, metadata !80, metadata !DIExpression()), !dbg !89

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X3_1, metadata !81, metadata !DIExpression()), !dbg !112

  //   %4 = zext i32 %conv16 to i64

  //   call void @llvm.dbg.value(metadata i64 %4, metadata !83, metadata !DIExpression()), !dbg !112

  //   store atomic i64 %4, i64* @atom_0_X3_1 seq_cst, align 8, !dbg !113
  // ST: Guess
  iw(1,13) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW 
  old_cw = cw(1,13);
  cw(1,13) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(1,13)] == 1);
  ASSUME(active[cw(1,13)] == 1);
  ASSUME(sforbid(13,cw(1,13))== 0);
  ASSUME(iw(1,13) >= max(creg_r1,0));
  ASSUME(iw(1,13) >= 0);
  ASSUME(cw(1,13) >= iw(1,13));
  ASSUME(cw(1,13) >= old_cw);
  ASSUME(cw(1,13) >= cr(1,13));
  ASSUME(cw(1,13) >= cl[1]);
  ASSUME(cw(1,13) >= cisb[1]);
  ASSUME(cw(1,13) >= cdy[1]);
  ASSUME(cw(1,13) >= cdl[1]);
  ASSUME(cw(1,13) >= cds[1]);
  ASSUME(cw(1,13) >= cctrl[1]);
  ASSUME(cw(1,13) >= caddr[1]);
  // Update
  caddr[1] = max(caddr[1],0);
  buff(1,13) = (r1==1);
  mem(13,cw(1,13)) = (r1==1);
  co(13,cw(1,13))+=1;
  delta(13,cw(1,13)) = -1;
  ASSUME(creturn[1] >= cw(1,13));

  //   %cmp20 = icmp eq i32 %conv8, 1, !dbg !114

  //   %conv21 = zext i1 %cmp20 to i32, !dbg !114

  //   call void @llvm.dbg.value(metadata i32 %conv21, metadata !84, metadata !DIExpression()), !dbg !89

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X5_1, metadata !85, metadata !DIExpression()), !dbg !115

  //   %5 = zext i32 %conv21 to i64

  //   call void @llvm.dbg.value(metadata i64 %5, metadata !87, metadata !DIExpression()), !dbg !115

  //   store atomic i64 %5, i64* @atom_0_X5_1 seq_cst, align 8, !dbg !116
  // ST: Guess
  iw(1,15) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW 
  old_cw = cw(1,15);
  cw(1,15) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(1,15)] == 1);
  ASSUME(active[cw(1,15)] == 1);
  ASSUME(sforbid(15,cw(1,15))== 0);
  ASSUME(iw(1,15) >= max(creg_r2,0));
  ASSUME(iw(1,15) >= 0);
  ASSUME(cw(1,15) >= iw(1,15));
  ASSUME(cw(1,15) >= old_cw);
  ASSUME(cw(1,15) >= cr(1,15));
  ASSUME(cw(1,15) >= cl[1]);
  ASSUME(cw(1,15) >= cisb[1]);
  ASSUME(cw(1,15) >= cdy[1]);
  ASSUME(cw(1,15) >= cdl[1]);
  ASSUME(cw(1,15) >= cds[1]);
  ASSUME(cw(1,15) >= cctrl[1]);
  ASSUME(cw(1,15) >= caddr[1]);
  // Update
  caddr[1] = max(caddr[1],0);
  buff(1,15) = (r2==1);
  mem(15,cw(1,15)) = (r2==1);
  co(15,cw(1,15))+=1;
  delta(15,cw(1,15)) = -1;
  ASSUME(creturn[1] >= cw(1,15));

  //   ret i8* null, !dbg !117
  ret_thread_1 = (- 1);


  // Dumping thread 2
  int ret_thread_2 = 0;
  cdy[2] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[2] >= cstart[2]);
T2BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !120, metadata !DIExpression()), !dbg !152

  //   br label %label_2, !dbg !90
  goto T2BLOCK1;

T2BLOCK1:
  //   call void @llvm.dbg.label(metadata !151), !dbg !154

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 3), metadata !122, metadata !DIExpression()), !dbg !155

  //   %0 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 3) acquire, align 8, !dbg !93
  // LD: Guess
  //   : Acquire
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
  ASSUME(cr(2,0+3*1) >= cx(2,0+3*1));
  ASSUME(cr(2,0+3*1) >= cs(2,0+0));
  ASSUME(cr(2,0+3*1) >= cs(2,0+1));
  ASSUME(cr(2,0+3*1) >= cs(2,0+2));
  ASSUME(cr(2,0+3*1) >= cs(2,0+3));
  ASSUME(cr(2,0+3*1) >= cs(2,0+4));
  ASSUME(cr(2,0+3*1) >= cs(2,0+5));
  ASSUME(cr(2,0+3*1) >= cs(2,0+6));
  ASSUME(cr(2,0+3*1) >= cs(2,0+7));
  ASSUME(cr(2,0+3*1) >= cs(2,8+0));
  ASSUME(cr(2,0+3*1) >= cs(2,13+0));
  ASSUME(cr(2,0+3*1) >= cs(2,16+0));
  ASSUME(cr(2,0+3*1) >= cs(2,15+0));
  ASSUME(cr(2,0+3*1) >= cs(2,9+0));
  ASSUME(cr(2,0+3*1) >= cs(2,14+0));
  ASSUME(cr(2,0+3*1) >= cs(2,12+0));
  ASSUME(cr(2,0+3*1) >= cs(2,18+0));
  ASSUME(cr(2,0+3*1) >= cs(2,20+0));
  ASSUME(cr(2,0+3*1) >= cs(2,21+0));
  ASSUME(cr(2,0+3*1) >= cs(2,22+0));
  ASSUME(cr(2,0+3*1) >= cs(2,23+0));
  ASSUME(cr(2,0+3*1) >= cs(2,10+0));
  ASSUME(cr(2,0+3*1) >= cs(2,17+0));
  ASSUME(cr(2,0+3*1) >= cs(2,19+0));
  ASSUME(cr(2,0+3*1) >= cs(2,11+0));
  // Update
  creg_r3 = cr(2,0+3*1);
  crmax(2,0+3*1) = max(crmax(2,0+3*1),cr(2,0+3*1));
  caddr[2] = max(caddr[2],0);
  if(cr(2,0+3*1) < cw(2,0+3*1)) {
    r3 = buff(2,0+3*1);
  } else {
    if(pw(2,0+3*1) != co(0+3*1,cr(2,0+3*1))) {
      ASSUME(cr(2,0+3*1) >= old_cr);
    }
    pw(2,0+3*1) = co(0+3*1,cr(2,0+3*1));
    r3 = mem(0+3*1,cr(2,0+3*1));
  }
  cl[2] = max(cl[2],cr(2,0+3*1));
  ASSUME(creturn[2] >= cr(2,0+3*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !124, metadata !DIExpression()), !dbg !155

  //   %conv = trunc i64 %0 to i32, !dbg !94

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !121, metadata !DIExpression()), !dbg !152

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 6), metadata !126, metadata !DIExpression()), !dbg !158

  //   %1 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 6) acquire, align 8, !dbg !96
  // LD: Guess
  //   : Acquire
  old_cr = cr(2,0+6*1);
  cr(2,0+6*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(2,0+6*1)] == 2);
  ASSUME(cr(2,0+6*1) >= iw(2,0+6*1));
  ASSUME(cr(2,0+6*1) >= 0);
  ASSUME(cr(2,0+6*1) >= cdy[2]);
  ASSUME(cr(2,0+6*1) >= cisb[2]);
  ASSUME(cr(2,0+6*1) >= cdl[2]);
  ASSUME(cr(2,0+6*1) >= cl[2]);
  ASSUME(cr(2,0+6*1) >= cx(2,0+6*1));
  ASSUME(cr(2,0+6*1) >= cs(2,0+0));
  ASSUME(cr(2,0+6*1) >= cs(2,0+1));
  ASSUME(cr(2,0+6*1) >= cs(2,0+2));
  ASSUME(cr(2,0+6*1) >= cs(2,0+3));
  ASSUME(cr(2,0+6*1) >= cs(2,0+4));
  ASSUME(cr(2,0+6*1) >= cs(2,0+5));
  ASSUME(cr(2,0+6*1) >= cs(2,0+6));
  ASSUME(cr(2,0+6*1) >= cs(2,0+7));
  ASSUME(cr(2,0+6*1) >= cs(2,8+0));
  ASSUME(cr(2,0+6*1) >= cs(2,13+0));
  ASSUME(cr(2,0+6*1) >= cs(2,16+0));
  ASSUME(cr(2,0+6*1) >= cs(2,15+0));
  ASSUME(cr(2,0+6*1) >= cs(2,9+0));
  ASSUME(cr(2,0+6*1) >= cs(2,14+0));
  ASSUME(cr(2,0+6*1) >= cs(2,12+0));
  ASSUME(cr(2,0+6*1) >= cs(2,18+0));
  ASSUME(cr(2,0+6*1) >= cs(2,20+0));
  ASSUME(cr(2,0+6*1) >= cs(2,21+0));
  ASSUME(cr(2,0+6*1) >= cs(2,22+0));
  ASSUME(cr(2,0+6*1) >= cs(2,23+0));
  ASSUME(cr(2,0+6*1) >= cs(2,10+0));
  ASSUME(cr(2,0+6*1) >= cs(2,17+0));
  ASSUME(cr(2,0+6*1) >= cs(2,19+0));
  ASSUME(cr(2,0+6*1) >= cs(2,11+0));
  // Update
  creg_r4 = cr(2,0+6*1);
  crmax(2,0+6*1) = max(crmax(2,0+6*1),cr(2,0+6*1));
  caddr[2] = max(caddr[2],0);
  if(cr(2,0+6*1) < cw(2,0+6*1)) {
    r4 = buff(2,0+6*1);
  } else {
    if(pw(2,0+6*1) != co(0+6*1,cr(2,0+6*1))) {
      ASSUME(cr(2,0+6*1) >= old_cr);
    }
    pw(2,0+6*1) = co(0+6*1,cr(2,0+6*1));
    r4 = mem(0+6*1,cr(2,0+6*1));
  }
  cl[2] = max(cl[2],cr(2,0+6*1));
  ASSUME(creturn[2] >= cr(2,0+6*1));

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !128, metadata !DIExpression()), !dbg !158

  //   %conv4 = trunc i64 %1 to i32, !dbg !97

  //   call void @llvm.dbg.value(metadata i32 %conv4, metadata !125, metadata !DIExpression()), !dbg !152

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 0), metadata !130, metadata !DIExpression()), !dbg !161

  //   %2 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !99
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
  creg_r5 = cr(2,0);
  crmax(2,0) = max(crmax(2,0),cr(2,0));
  caddr[2] = max(caddr[2],0);
  if(cr(2,0) < cw(2,0)) {
    r5 = buff(2,0);
  } else {
    if(pw(2,0) != co(0,cr(2,0))) {
      ASSUME(cr(2,0) >= old_cr);
    }
    pw(2,0) = co(0,cr(2,0));
    r5 = mem(0,cr(2,0));
  }
  ASSUME(creturn[2] >= cr(2,0));

  //   call void @llvm.dbg.value(metadata i64 %2, metadata !132, metadata !DIExpression()), !dbg !161

  //   %conv8 = trunc i64 %2 to i32, !dbg !100

  //   call void @llvm.dbg.value(metadata i32 %conv8, metadata !129, metadata !DIExpression()), !dbg !152

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 5), metadata !133, metadata !DIExpression()), !dbg !164

  //   call void @llvm.dbg.value(metadata i64 1, metadata !135, metadata !DIExpression()), !dbg !164

  //   store atomic i64 1, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 5) monotonic, align 8, !dbg !102
  // ST: Guess
  iw(2,0+5*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW 
  old_cw = cw(2,0+5*1);
  cw(2,0+5*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM 
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 2), metadata !136, metadata !DIExpression()), !dbg !166

  //   call void @llvm.dbg.value(metadata i64 1, metadata !138, metadata !DIExpression()), !dbg !166

  //   store atomic i64 1, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 2) release, align 8, !dbg !104
  // ST: Guess
  //   : Release
  iw(2,0+2*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW 
  old_cw = cw(2,0+2*1);
  cw(2,0+2*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM 
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
  ASSUME(cw(2,0+2*1) >= cr(2,0+0));
  ASSUME(cw(2,0+2*1) >= cr(2,0+1));
  ASSUME(cw(2,0+2*1) >= cr(2,0+2));
  ASSUME(cw(2,0+2*1) >= cr(2,0+3));
  ASSUME(cw(2,0+2*1) >= cr(2,0+4));
  ASSUME(cw(2,0+2*1) >= cr(2,0+5));
  ASSUME(cw(2,0+2*1) >= cr(2,0+6));
  ASSUME(cw(2,0+2*1) >= cr(2,0+7));
  ASSUME(cw(2,0+2*1) >= cr(2,8+0));
  ASSUME(cw(2,0+2*1) >= cr(2,13+0));
  ASSUME(cw(2,0+2*1) >= cr(2,16+0));
  ASSUME(cw(2,0+2*1) >= cr(2,15+0));
  ASSUME(cw(2,0+2*1) >= cr(2,9+0));
  ASSUME(cw(2,0+2*1) >= cr(2,14+0));
  ASSUME(cw(2,0+2*1) >= cr(2,12+0));
  ASSUME(cw(2,0+2*1) >= cr(2,18+0));
  ASSUME(cw(2,0+2*1) >= cr(2,20+0));
  ASSUME(cw(2,0+2*1) >= cr(2,21+0));
  ASSUME(cw(2,0+2*1) >= cr(2,22+0));
  ASSUME(cw(2,0+2*1) >= cr(2,23+0));
  ASSUME(cw(2,0+2*1) >= cr(2,10+0));
  ASSUME(cw(2,0+2*1) >= cr(2,17+0));
  ASSUME(cw(2,0+2*1) >= cr(2,19+0));
  ASSUME(cw(2,0+2*1) >= cr(2,11+0));
  ASSUME(cw(2,0+2*1) >= cw(2,0+0));
  ASSUME(cw(2,0+2*1) >= cw(2,0+1));
  ASSUME(cw(2,0+2*1) >= cw(2,0+2));
  ASSUME(cw(2,0+2*1) >= cw(2,0+3));
  ASSUME(cw(2,0+2*1) >= cw(2,0+4));
  ASSUME(cw(2,0+2*1) >= cw(2,0+5));
  ASSUME(cw(2,0+2*1) >= cw(2,0+6));
  ASSUME(cw(2,0+2*1) >= cw(2,0+7));
  ASSUME(cw(2,0+2*1) >= cw(2,8+0));
  ASSUME(cw(2,0+2*1) >= cw(2,13+0));
  ASSUME(cw(2,0+2*1) >= cw(2,16+0));
  ASSUME(cw(2,0+2*1) >= cw(2,15+0));
  ASSUME(cw(2,0+2*1) >= cw(2,9+0));
  ASSUME(cw(2,0+2*1) >= cw(2,14+0));
  ASSUME(cw(2,0+2*1) >= cw(2,12+0));
  ASSUME(cw(2,0+2*1) >= cw(2,18+0));
  ASSUME(cw(2,0+2*1) >= cw(2,20+0));
  ASSUME(cw(2,0+2*1) >= cw(2,21+0));
  ASSUME(cw(2,0+2*1) >= cw(2,22+0));
  ASSUME(cw(2,0+2*1) >= cw(2,23+0));
  ASSUME(cw(2,0+2*1) >= cw(2,10+0));
  ASSUME(cw(2,0+2*1) >= cw(2,17+0));
  ASSUME(cw(2,0+2*1) >= cw(2,19+0));
  ASSUME(cw(2,0+2*1) >= cw(2,11+0));
  // Update
  caddr[2] = max(caddr[2],0);
  buff(2,0+2*1) = 1;
  mem(0+2*1,cw(2,0+2*1)) = 1;
  co(0+2*1,cw(2,0+2*1))+=1;
  delta(0+2*1,cw(2,0+2*1)) = -1;
  is(2,0+2*1) = iw(2,0+2*1);
  cs(2,0+2*1) = cw(2,0+2*1);
  ASSUME(creturn[2] >= cw(2,0+2*1));

  //   %cmp = icmp eq i32 %conv8, 1, !dbg !105

  //   %conv11 = zext i1 %cmp to i32, !dbg !105

  //   call void @llvm.dbg.value(metadata i32 %conv11, metadata !139, metadata !DIExpression()), !dbg !152

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X4_1, metadata !140, metadata !DIExpression()), !dbg !169

  //   %3 = zext i32 %conv11 to i64

  //   call void @llvm.dbg.value(metadata i64 %3, metadata !142, metadata !DIExpression()), !dbg !169

  //   store atomic i64 %3, i64* @atom_1_X4_1 seq_cst, align 8, !dbg !107
  // ST: Guess
  iw(2,9) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW 
  old_cw = cw(2,9);
  cw(2,9) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(2,9)] == 2);
  ASSUME(active[cw(2,9)] == 2);
  ASSUME(sforbid(9,cw(2,9))== 0);
  ASSUME(iw(2,9) >= max(creg_r5,0));
  ASSUME(iw(2,9) >= 0);
  ASSUME(cw(2,9) >= iw(2,9));
  ASSUME(cw(2,9) >= old_cw);
  ASSUME(cw(2,9) >= cr(2,9));
  ASSUME(cw(2,9) >= cl[2]);
  ASSUME(cw(2,9) >= cisb[2]);
  ASSUME(cw(2,9) >= cdy[2]);
  ASSUME(cw(2,9) >= cdl[2]);
  ASSUME(cw(2,9) >= cds[2]);
  ASSUME(cw(2,9) >= cctrl[2]);
  ASSUME(cw(2,9) >= caddr[2]);
  // Update
  caddr[2] = max(caddr[2],0);
  buff(2,9) = (r5==1);
  mem(9,cw(2,9)) = (r5==1);
  co(9,cw(2,9))+=1;
  delta(9,cw(2,9)) = -1;
  ASSUME(creturn[2] >= cw(2,9));

  //   %cmp15 = icmp eq i32 %conv, 1, !dbg !108

  //   %conv16 = zext i1 %cmp15 to i32, !dbg !108

  //   call void @llvm.dbg.value(metadata i32 %conv16, metadata !143, metadata !DIExpression()), !dbg !152

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X0_1, metadata !144, metadata !DIExpression()), !dbg !172

  //   %4 = zext i32 %conv16 to i64

  //   call void @llvm.dbg.value(metadata i64 %4, metadata !146, metadata !DIExpression()), !dbg !172

  //   store atomic i64 %4, i64* @atom_1_X0_1 seq_cst, align 8, !dbg !110
  // ST: Guess
  iw(2,12) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW 
  old_cw = cw(2,12);
  cw(2,12) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(2,12)] == 2);
  ASSUME(active[cw(2,12)] == 2);
  ASSUME(sforbid(12,cw(2,12))== 0);
  ASSUME(iw(2,12) >= max(creg_r3,0));
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

  //   %cmp20 = icmp eq i32 %conv4, 1, !dbg !111

  //   %conv21 = zext i1 %cmp20 to i32, !dbg !111

  //   call void @llvm.dbg.value(metadata i32 %conv21, metadata !147, metadata !DIExpression()), !dbg !152

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X2_1, metadata !148, metadata !DIExpression()), !dbg !175

  //   %5 = zext i32 %conv21 to i64

  //   call void @llvm.dbg.value(metadata i64 %5, metadata !150, metadata !DIExpression()), !dbg !175

  //   store atomic i64 %5, i64* @atom_1_X2_1 seq_cst, align 8, !dbg !113
  // ST: Guess
  iw(2,16) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW 
  old_cw = cw(2,16);
  cw(2,16) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(2,16)] == 2);
  ASSUME(active[cw(2,16)] == 2);
  ASSUME(sforbid(16,cw(2,16))== 0);
  ASSUME(iw(2,16) >= max(creg_r4,0));
  ASSUME(iw(2,16) >= 0);
  ASSUME(cw(2,16) >= iw(2,16));
  ASSUME(cw(2,16) >= old_cw);
  ASSUME(cw(2,16) >= cr(2,16));
  ASSUME(cw(2,16) >= cl[2]);
  ASSUME(cw(2,16) >= cisb[2]);
  ASSUME(cw(2,16) >= cdy[2]);
  ASSUME(cw(2,16) >= cdl[2]);
  ASSUME(cw(2,16) >= cds[2]);
  ASSUME(cw(2,16) >= cctrl[2]);
  ASSUME(cw(2,16) >= caddr[2]);
  // Update
  caddr[2] = max(caddr[2],0);
  buff(2,16) = (r4==1);
  mem(16,cw(2,16)) = (r4==1);
  co(16,cw(2,16))+=1;
  delta(16,cw(2,16)) = -1;
  ASSUME(creturn[2] >= cw(2,16));

  //   ret i8* null, !dbg !114
  ret_thread_2 = (- 1);


  // Dumping thread 3
  int ret_thread_3 = 0;
  cdy[3] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[3] >= cstart[3]);
T3BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !180, metadata !DIExpression()), !dbg !212

  //   br label %label_3, !dbg !90
  goto T3BLOCK1;

T3BLOCK1:
  //   call void @llvm.dbg.label(metadata !211), !dbg !214

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 5), metadata !182, metadata !DIExpression()), !dbg !215

  //   %0 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 5) monotonic, align 8, !dbg !93
  // LD: Guess
  old_cr = cr(3,0+5*1);
  cr(3,0+5*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN LDCOM 
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
  } else {
    if(pw(3,0+5*1) != co(0+5*1,cr(3,0+5*1))) {
      ASSUME(cr(3,0+5*1) >= old_cr);
    }
    pw(3,0+5*1) = co(0+5*1,cr(3,0+5*1));
    r6 = mem(0+5*1,cr(3,0+5*1));
  }
  ASSUME(creturn[3] >= cr(3,0+5*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !184, metadata !DIExpression()), !dbg !215

  //   %conv = trunc i64 %0 to i32, !dbg !94

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !181, metadata !DIExpression()), !dbg !212

  //   call void (...) @dmbsy(), !dbg !95
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
  ASSUME(cdy[3] >= cw(3,0+3));
  ASSUME(cdy[3] >= cw(3,0+4));
  ASSUME(cdy[3] >= cw(3,0+5));
  ASSUME(cdy[3] >= cw(3,0+6));
  ASSUME(cdy[3] >= cw(3,0+7));
  ASSUME(cdy[3] >= cw(3,8+0));
  ASSUME(cdy[3] >= cw(3,13+0));
  ASSUME(cdy[3] >= cw(3,16+0));
  ASSUME(cdy[3] >= cw(3,15+0));
  ASSUME(cdy[3] >= cw(3,9+0));
  ASSUME(cdy[3] >= cw(3,14+0));
  ASSUME(cdy[3] >= cw(3,12+0));
  ASSUME(cdy[3] >= cw(3,18+0));
  ASSUME(cdy[3] >= cw(3,20+0));
  ASSUME(cdy[3] >= cw(3,21+0));
  ASSUME(cdy[3] >= cw(3,22+0));
  ASSUME(cdy[3] >= cw(3,23+0));
  ASSUME(cdy[3] >= cw(3,10+0));
  ASSUME(cdy[3] >= cw(3,17+0));
  ASSUME(cdy[3] >= cw(3,19+0));
  ASSUME(cdy[3] >= cw(3,11+0));
  ASSUME(cdy[3] >= cr(3,0+0));
  ASSUME(cdy[3] >= cr(3,0+1));
  ASSUME(cdy[3] >= cr(3,0+2));
  ASSUME(cdy[3] >= cr(3,0+3));
  ASSUME(cdy[3] >= cr(3,0+4));
  ASSUME(cdy[3] >= cr(3,0+5));
  ASSUME(cdy[3] >= cr(3,0+6));
  ASSUME(cdy[3] >= cr(3,0+7));
  ASSUME(cdy[3] >= cr(3,8+0));
  ASSUME(cdy[3] >= cr(3,13+0));
  ASSUME(cdy[3] >= cr(3,16+0));
  ASSUME(cdy[3] >= cr(3,15+0));
  ASSUME(cdy[3] >= cr(3,9+0));
  ASSUME(cdy[3] >= cr(3,14+0));
  ASSUME(cdy[3] >= cr(3,12+0));
  ASSUME(cdy[3] >= cr(3,18+0));
  ASSUME(cdy[3] >= cr(3,20+0));
  ASSUME(cdy[3] >= cr(3,21+0));
  ASSUME(cdy[3] >= cr(3,22+0));
  ASSUME(cdy[3] >= cr(3,23+0));
  ASSUME(cdy[3] >= cr(3,10+0));
  ASSUME(cdy[3] >= cr(3,17+0));
  ASSUME(cdy[3] >= cr(3,19+0));
  ASSUME(cdy[3] >= cr(3,11+0));
  ASSUME(creturn[3] >= cdy[3]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 6), metadata !185, metadata !DIExpression()), !dbg !219

  //   call void @llvm.dbg.value(metadata i64 1, metadata !187, metadata !DIExpression()), !dbg !219

  //   store atomic i64 1, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 6) release, align 8, !dbg !97
  // ST: Guess
  //   : Release
  iw(3,0+6*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STIW 
  old_cw = cw(3,0+6*1);
  cw(3,0+6*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STCOM 
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
  ASSUME(cw(3,0+6*1) >= cr(3,0+0));
  ASSUME(cw(3,0+6*1) >= cr(3,0+1));
  ASSUME(cw(3,0+6*1) >= cr(3,0+2));
  ASSUME(cw(3,0+6*1) >= cr(3,0+3));
  ASSUME(cw(3,0+6*1) >= cr(3,0+4));
  ASSUME(cw(3,0+6*1) >= cr(3,0+5));
  ASSUME(cw(3,0+6*1) >= cr(3,0+6));
  ASSUME(cw(3,0+6*1) >= cr(3,0+7));
  ASSUME(cw(3,0+6*1) >= cr(3,8+0));
  ASSUME(cw(3,0+6*1) >= cr(3,13+0));
  ASSUME(cw(3,0+6*1) >= cr(3,16+0));
  ASSUME(cw(3,0+6*1) >= cr(3,15+0));
  ASSUME(cw(3,0+6*1) >= cr(3,9+0));
  ASSUME(cw(3,0+6*1) >= cr(3,14+0));
  ASSUME(cw(3,0+6*1) >= cr(3,12+0));
  ASSUME(cw(3,0+6*1) >= cr(3,18+0));
  ASSUME(cw(3,0+6*1) >= cr(3,20+0));
  ASSUME(cw(3,0+6*1) >= cr(3,21+0));
  ASSUME(cw(3,0+6*1) >= cr(3,22+0));
  ASSUME(cw(3,0+6*1) >= cr(3,23+0));
  ASSUME(cw(3,0+6*1) >= cr(3,10+0));
  ASSUME(cw(3,0+6*1) >= cr(3,17+0));
  ASSUME(cw(3,0+6*1) >= cr(3,19+0));
  ASSUME(cw(3,0+6*1) >= cr(3,11+0));
  ASSUME(cw(3,0+6*1) >= cw(3,0+0));
  ASSUME(cw(3,0+6*1) >= cw(3,0+1));
  ASSUME(cw(3,0+6*1) >= cw(3,0+2));
  ASSUME(cw(3,0+6*1) >= cw(3,0+3));
  ASSUME(cw(3,0+6*1) >= cw(3,0+4));
  ASSUME(cw(3,0+6*1) >= cw(3,0+5));
  ASSUME(cw(3,0+6*1) >= cw(3,0+6));
  ASSUME(cw(3,0+6*1) >= cw(3,0+7));
  ASSUME(cw(3,0+6*1) >= cw(3,8+0));
  ASSUME(cw(3,0+6*1) >= cw(3,13+0));
  ASSUME(cw(3,0+6*1) >= cw(3,16+0));
  ASSUME(cw(3,0+6*1) >= cw(3,15+0));
  ASSUME(cw(3,0+6*1) >= cw(3,9+0));
  ASSUME(cw(3,0+6*1) >= cw(3,14+0));
  ASSUME(cw(3,0+6*1) >= cw(3,12+0));
  ASSUME(cw(3,0+6*1) >= cw(3,18+0));
  ASSUME(cw(3,0+6*1) >= cw(3,20+0));
  ASSUME(cw(3,0+6*1) >= cw(3,21+0));
  ASSUME(cw(3,0+6*1) >= cw(3,22+0));
  ASSUME(cw(3,0+6*1) >= cw(3,23+0));
  ASSUME(cw(3,0+6*1) >= cw(3,10+0));
  ASSUME(cw(3,0+6*1) >= cw(3,17+0));
  ASSUME(cw(3,0+6*1) >= cw(3,19+0));
  ASSUME(cw(3,0+6*1) >= cw(3,11+0));
  // Update
  caddr[3] = max(caddr[3],0);
  buff(3,0+6*1) = 1;
  mem(0+6*1,cw(3,0+6*1)) = 1;
  co(0+6*1,cw(3,0+6*1))+=1;
  delta(0+6*1,cw(3,0+6*1)) = -1;
  is(3,0+6*1) = iw(3,0+6*1);
  cs(3,0+6*1) = cw(3,0+6*1);
  ASSUME(creturn[3] >= cw(3,0+6*1));

  //   call void (...) @dmbsy(), !dbg !98
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
  ASSUME(cdy[3] >= cw(3,0+3));
  ASSUME(cdy[3] >= cw(3,0+4));
  ASSUME(cdy[3] >= cw(3,0+5));
  ASSUME(cdy[3] >= cw(3,0+6));
  ASSUME(cdy[3] >= cw(3,0+7));
  ASSUME(cdy[3] >= cw(3,8+0));
  ASSUME(cdy[3] >= cw(3,13+0));
  ASSUME(cdy[3] >= cw(3,16+0));
  ASSUME(cdy[3] >= cw(3,15+0));
  ASSUME(cdy[3] >= cw(3,9+0));
  ASSUME(cdy[3] >= cw(3,14+0));
  ASSUME(cdy[3] >= cw(3,12+0));
  ASSUME(cdy[3] >= cw(3,18+0));
  ASSUME(cdy[3] >= cw(3,20+0));
  ASSUME(cdy[3] >= cw(3,21+0));
  ASSUME(cdy[3] >= cw(3,22+0));
  ASSUME(cdy[3] >= cw(3,23+0));
  ASSUME(cdy[3] >= cw(3,10+0));
  ASSUME(cdy[3] >= cw(3,17+0));
  ASSUME(cdy[3] >= cw(3,19+0));
  ASSUME(cdy[3] >= cw(3,11+0));
  ASSUME(cdy[3] >= cr(3,0+0));
  ASSUME(cdy[3] >= cr(3,0+1));
  ASSUME(cdy[3] >= cr(3,0+2));
  ASSUME(cdy[3] >= cr(3,0+3));
  ASSUME(cdy[3] >= cr(3,0+4));
  ASSUME(cdy[3] >= cr(3,0+5));
  ASSUME(cdy[3] >= cr(3,0+6));
  ASSUME(cdy[3] >= cr(3,0+7));
  ASSUME(cdy[3] >= cr(3,8+0));
  ASSUME(cdy[3] >= cr(3,13+0));
  ASSUME(cdy[3] >= cr(3,16+0));
  ASSUME(cdy[3] >= cr(3,15+0));
  ASSUME(cdy[3] >= cr(3,9+0));
  ASSUME(cdy[3] >= cr(3,14+0));
  ASSUME(cdy[3] >= cr(3,12+0));
  ASSUME(cdy[3] >= cr(3,18+0));
  ASSUME(cdy[3] >= cr(3,20+0));
  ASSUME(cdy[3] >= cr(3,21+0));
  ASSUME(cdy[3] >= cr(3,22+0));
  ASSUME(cdy[3] >= cr(3,23+0));
  ASSUME(cdy[3] >= cr(3,10+0));
  ASSUME(cdy[3] >= cr(3,17+0));
  ASSUME(cdy[3] >= cr(3,19+0));
  ASSUME(cdy[3] >= cr(3,11+0));
  ASSUME(creturn[3] >= cdy[3]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 2), metadata !189, metadata !DIExpression()), !dbg !222

  //   %1 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 2) acquire, align 8, !dbg !100
  // LD: Guess
  //   : Acquire
  old_cr = cr(3,0+2*1);
  cr(3,0+2*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(3,0+2*1)] == 3);
  ASSUME(cr(3,0+2*1) >= iw(3,0+2*1));
  ASSUME(cr(3,0+2*1) >= 0);
  ASSUME(cr(3,0+2*1) >= cdy[3]);
  ASSUME(cr(3,0+2*1) >= cisb[3]);
  ASSUME(cr(3,0+2*1) >= cdl[3]);
  ASSUME(cr(3,0+2*1) >= cl[3]);
  ASSUME(cr(3,0+2*1) >= cx(3,0+2*1));
  ASSUME(cr(3,0+2*1) >= cs(3,0+0));
  ASSUME(cr(3,0+2*1) >= cs(3,0+1));
  ASSUME(cr(3,0+2*1) >= cs(3,0+2));
  ASSUME(cr(3,0+2*1) >= cs(3,0+3));
  ASSUME(cr(3,0+2*1) >= cs(3,0+4));
  ASSUME(cr(3,0+2*1) >= cs(3,0+5));
  ASSUME(cr(3,0+2*1) >= cs(3,0+6));
  ASSUME(cr(3,0+2*1) >= cs(3,0+7));
  ASSUME(cr(3,0+2*1) >= cs(3,8+0));
  ASSUME(cr(3,0+2*1) >= cs(3,13+0));
  ASSUME(cr(3,0+2*1) >= cs(3,16+0));
  ASSUME(cr(3,0+2*1) >= cs(3,15+0));
  ASSUME(cr(3,0+2*1) >= cs(3,9+0));
  ASSUME(cr(3,0+2*1) >= cs(3,14+0));
  ASSUME(cr(3,0+2*1) >= cs(3,12+0));
  ASSUME(cr(3,0+2*1) >= cs(3,18+0));
  ASSUME(cr(3,0+2*1) >= cs(3,20+0));
  ASSUME(cr(3,0+2*1) >= cs(3,21+0));
  ASSUME(cr(3,0+2*1) >= cs(3,22+0));
  ASSUME(cr(3,0+2*1) >= cs(3,23+0));
  ASSUME(cr(3,0+2*1) >= cs(3,10+0));
  ASSUME(cr(3,0+2*1) >= cs(3,17+0));
  ASSUME(cr(3,0+2*1) >= cs(3,19+0));
  ASSUME(cr(3,0+2*1) >= cs(3,11+0));
  // Update
  creg_r7 = cr(3,0+2*1);
  crmax(3,0+2*1) = max(crmax(3,0+2*1),cr(3,0+2*1));
  caddr[3] = max(caddr[3],0);
  if(cr(3,0+2*1) < cw(3,0+2*1)) {
    r7 = buff(3,0+2*1);
  } else {
    if(pw(3,0+2*1) != co(0+2*1,cr(3,0+2*1))) {
      ASSUME(cr(3,0+2*1) >= old_cr);
    }
    pw(3,0+2*1) = co(0+2*1,cr(3,0+2*1));
    r7 = mem(0+2*1,cr(3,0+2*1));
  }
  cl[3] = max(cl[3],cr(3,0+2*1));
  ASSUME(creturn[3] >= cr(3,0+2*1));

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !191, metadata !DIExpression()), !dbg !222

  //   %conv4 = trunc i64 %1 to i32, !dbg !101

  //   call void @llvm.dbg.value(metadata i32 %conv4, metadata !188, metadata !DIExpression()), !dbg !212

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 1), metadata !193, metadata !DIExpression()), !dbg !225

  //   %2 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 1) acquire, align 8, !dbg !103
  // LD: Guess
  //   : Acquire
  old_cr = cr(3,0+1*1);
  cr(3,0+1*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(3,0+1*1)] == 3);
  ASSUME(cr(3,0+1*1) >= iw(3,0+1*1));
  ASSUME(cr(3,0+1*1) >= 0);
  ASSUME(cr(3,0+1*1) >= cdy[3]);
  ASSUME(cr(3,0+1*1) >= cisb[3]);
  ASSUME(cr(3,0+1*1) >= cdl[3]);
  ASSUME(cr(3,0+1*1) >= cl[3]);
  ASSUME(cr(3,0+1*1) >= cx(3,0+1*1));
  ASSUME(cr(3,0+1*1) >= cs(3,0+0));
  ASSUME(cr(3,0+1*1) >= cs(3,0+1));
  ASSUME(cr(3,0+1*1) >= cs(3,0+2));
  ASSUME(cr(3,0+1*1) >= cs(3,0+3));
  ASSUME(cr(3,0+1*1) >= cs(3,0+4));
  ASSUME(cr(3,0+1*1) >= cs(3,0+5));
  ASSUME(cr(3,0+1*1) >= cs(3,0+6));
  ASSUME(cr(3,0+1*1) >= cs(3,0+7));
  ASSUME(cr(3,0+1*1) >= cs(3,8+0));
  ASSUME(cr(3,0+1*1) >= cs(3,13+0));
  ASSUME(cr(3,0+1*1) >= cs(3,16+0));
  ASSUME(cr(3,0+1*1) >= cs(3,15+0));
  ASSUME(cr(3,0+1*1) >= cs(3,9+0));
  ASSUME(cr(3,0+1*1) >= cs(3,14+0));
  ASSUME(cr(3,0+1*1) >= cs(3,12+0));
  ASSUME(cr(3,0+1*1) >= cs(3,18+0));
  ASSUME(cr(3,0+1*1) >= cs(3,20+0));
  ASSUME(cr(3,0+1*1) >= cs(3,21+0));
  ASSUME(cr(3,0+1*1) >= cs(3,22+0));
  ASSUME(cr(3,0+1*1) >= cs(3,23+0));
  ASSUME(cr(3,0+1*1) >= cs(3,10+0));
  ASSUME(cr(3,0+1*1) >= cs(3,17+0));
  ASSUME(cr(3,0+1*1) >= cs(3,19+0));
  ASSUME(cr(3,0+1*1) >= cs(3,11+0));
  // Update
  creg_r8 = cr(3,0+1*1);
  crmax(3,0+1*1) = max(crmax(3,0+1*1),cr(3,0+1*1));
  caddr[3] = max(caddr[3],0);
  if(cr(3,0+1*1) < cw(3,0+1*1)) {
    r8 = buff(3,0+1*1);
  } else {
    if(pw(3,0+1*1) != co(0+1*1,cr(3,0+1*1))) {
      ASSUME(cr(3,0+1*1) >= old_cr);
    }
    pw(3,0+1*1) = co(0+1*1,cr(3,0+1*1));
    r8 = mem(0+1*1,cr(3,0+1*1));
  }
  cl[3] = max(cl[3],cr(3,0+1*1));
  ASSUME(creturn[3] >= cr(3,0+1*1));

  //   call void @llvm.dbg.value(metadata i64 %2, metadata !195, metadata !DIExpression()), !dbg !225

  //   %conv8 = trunc i64 %2 to i32, !dbg !104

  //   call void @llvm.dbg.value(metadata i32 %conv8, metadata !192, metadata !DIExpression()), !dbg !212

  //   call void (...) @dmbsy(), !dbg !105
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
  ASSUME(cdy[3] >= cw(3,0+3));
  ASSUME(cdy[3] >= cw(3,0+4));
  ASSUME(cdy[3] >= cw(3,0+5));
  ASSUME(cdy[3] >= cw(3,0+6));
  ASSUME(cdy[3] >= cw(3,0+7));
  ASSUME(cdy[3] >= cw(3,8+0));
  ASSUME(cdy[3] >= cw(3,13+0));
  ASSUME(cdy[3] >= cw(3,16+0));
  ASSUME(cdy[3] >= cw(3,15+0));
  ASSUME(cdy[3] >= cw(3,9+0));
  ASSUME(cdy[3] >= cw(3,14+0));
  ASSUME(cdy[3] >= cw(3,12+0));
  ASSUME(cdy[3] >= cw(3,18+0));
  ASSUME(cdy[3] >= cw(3,20+0));
  ASSUME(cdy[3] >= cw(3,21+0));
  ASSUME(cdy[3] >= cw(3,22+0));
  ASSUME(cdy[3] >= cw(3,23+0));
  ASSUME(cdy[3] >= cw(3,10+0));
  ASSUME(cdy[3] >= cw(3,17+0));
  ASSUME(cdy[3] >= cw(3,19+0));
  ASSUME(cdy[3] >= cw(3,11+0));
  ASSUME(cdy[3] >= cr(3,0+0));
  ASSUME(cdy[3] >= cr(3,0+1));
  ASSUME(cdy[3] >= cr(3,0+2));
  ASSUME(cdy[3] >= cr(3,0+3));
  ASSUME(cdy[3] >= cr(3,0+4));
  ASSUME(cdy[3] >= cr(3,0+5));
  ASSUME(cdy[3] >= cr(3,0+6));
  ASSUME(cdy[3] >= cr(3,0+7));
  ASSUME(cdy[3] >= cr(3,8+0));
  ASSUME(cdy[3] >= cr(3,13+0));
  ASSUME(cdy[3] >= cr(3,16+0));
  ASSUME(cdy[3] >= cr(3,15+0));
  ASSUME(cdy[3] >= cr(3,9+0));
  ASSUME(cdy[3] >= cr(3,14+0));
  ASSUME(cdy[3] >= cr(3,12+0));
  ASSUME(cdy[3] >= cr(3,18+0));
  ASSUME(cdy[3] >= cr(3,20+0));
  ASSUME(cdy[3] >= cr(3,21+0));
  ASSUME(cdy[3] >= cr(3,22+0));
  ASSUME(cdy[3] >= cr(3,23+0));
  ASSUME(cdy[3] >= cr(3,10+0));
  ASSUME(cdy[3] >= cr(3,17+0));
  ASSUME(cdy[3] >= cr(3,19+0));
  ASSUME(cdy[3] >= cr(3,11+0));
  ASSUME(creturn[3] >= cdy[3]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 7), metadata !196, metadata !DIExpression()), !dbg !229

  //   call void @llvm.dbg.value(metadata i64 1, metadata !198, metadata !DIExpression()), !dbg !229

  //   store atomic i64 1, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 7) monotonic, align 8, !dbg !107
  // ST: Guess
  iw(3,0+7*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STIW 
  old_cw = cw(3,0+7*1);
  cw(3,0+7*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STCOM 
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

  //   %cmp = icmp eq i32 %conv, 1, !dbg !108

  //   %conv11 = zext i1 %cmp to i32, !dbg !108

  //   call void @llvm.dbg.value(metadata i32 %conv11, metadata !199, metadata !DIExpression()), !dbg !212

  //   call void @llvm.dbg.value(metadata i64* @atom_2_X0_1, metadata !200, metadata !DIExpression()), !dbg !232

  //   %3 = zext i32 %conv11 to i64

  //   call void @llvm.dbg.value(metadata i64 %3, metadata !202, metadata !DIExpression()), !dbg !232

  //   store atomic i64 %3, i64* @atom_2_X0_1 seq_cst, align 8, !dbg !110
  // ST: Guess
  iw(3,10) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STIW 
  old_cw = cw(3,10);
  cw(3,10) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(3,10)] == 3);
  ASSUME(active[cw(3,10)] == 3);
  ASSUME(sforbid(10,cw(3,10))== 0);
  ASSUME(iw(3,10) >= max(creg_r6,0));
  ASSUME(iw(3,10) >= 0);
  ASSUME(cw(3,10) >= iw(3,10));
  ASSUME(cw(3,10) >= old_cw);
  ASSUME(cw(3,10) >= cr(3,10));
  ASSUME(cw(3,10) >= cl[3]);
  ASSUME(cw(3,10) >= cisb[3]);
  ASSUME(cw(3,10) >= cdy[3]);
  ASSUME(cw(3,10) >= cdl[3]);
  ASSUME(cw(3,10) >= cds[3]);
  ASSUME(cw(3,10) >= cctrl[3]);
  ASSUME(cw(3,10) >= caddr[3]);
  // Update
  caddr[3] = max(caddr[3],0);
  buff(3,10) = (r6==1);
  mem(10,cw(3,10)) = (r6==1);
  co(10,cw(3,10))+=1;
  delta(10,cw(3,10)) = -1;
  ASSUME(creturn[3] >= cw(3,10));

  //   %cmp15 = icmp eq i32 %conv4, 1, !dbg !111

  //   %conv16 = zext i1 %cmp15 to i32, !dbg !111

  //   call void @llvm.dbg.value(metadata i32 %conv16, metadata !203, metadata !DIExpression()), !dbg !212

  //   call void @llvm.dbg.value(metadata i64* @atom_2_X3_1, metadata !204, metadata !DIExpression()), !dbg !235

  //   %4 = zext i32 %conv16 to i64

  //   call void @llvm.dbg.value(metadata i64 %4, metadata !206, metadata !DIExpression()), !dbg !235

  //   store atomic i64 %4, i64* @atom_2_X3_1 seq_cst, align 8, !dbg !113
  // ST: Guess
  iw(3,17) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STIW 
  old_cw = cw(3,17);
  cw(3,17) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(3,17)] == 3);
  ASSUME(active[cw(3,17)] == 3);
  ASSUME(sforbid(17,cw(3,17))== 0);
  ASSUME(iw(3,17) >= max(creg_r7,0));
  ASSUME(iw(3,17) >= 0);
  ASSUME(cw(3,17) >= iw(3,17));
  ASSUME(cw(3,17) >= old_cw);
  ASSUME(cw(3,17) >= cr(3,17));
  ASSUME(cw(3,17) >= cl[3]);
  ASSUME(cw(3,17) >= cisb[3]);
  ASSUME(cw(3,17) >= cdy[3]);
  ASSUME(cw(3,17) >= cdl[3]);
  ASSUME(cw(3,17) >= cds[3]);
  ASSUME(cw(3,17) >= cctrl[3]);
  ASSUME(cw(3,17) >= caddr[3]);
  // Update
  caddr[3] = max(caddr[3],0);
  buff(3,17) = (r7==1);
  mem(17,cw(3,17)) = (r7==1);
  co(17,cw(3,17))+=1;
  delta(17,cw(3,17)) = -1;
  ASSUME(creturn[3] >= cw(3,17));

  //   %cmp20 = icmp eq i32 %conv8, 1, !dbg !114

  //   %conv21 = zext i1 %cmp20 to i32, !dbg !114

  //   call void @llvm.dbg.value(metadata i32 %conv21, metadata !207, metadata !DIExpression()), !dbg !212

  //   call void @llvm.dbg.value(metadata i64* @atom_2_X5_1, metadata !208, metadata !DIExpression()), !dbg !238

  //   %5 = zext i32 %conv21 to i64

  //   call void @llvm.dbg.value(metadata i64 %5, metadata !210, metadata !DIExpression()), !dbg !238

  //   store atomic i64 %5, i64* @atom_2_X5_1 seq_cst, align 8, !dbg !116
  // ST: Guess
  iw(3,19) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STIW 
  old_cw = cw(3,19);
  cw(3,19) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(3,19)] == 3);
  ASSUME(active[cw(3,19)] == 3);
  ASSUME(sforbid(19,cw(3,19))== 0);
  ASSUME(iw(3,19) >= max(creg_r8,0));
  ASSUME(iw(3,19) >= 0);
  ASSUME(cw(3,19) >= iw(3,19));
  ASSUME(cw(3,19) >= old_cw);
  ASSUME(cw(3,19) >= cr(3,19));
  ASSUME(cw(3,19) >= cl[3]);
  ASSUME(cw(3,19) >= cisb[3]);
  ASSUME(cw(3,19) >= cdy[3]);
  ASSUME(cw(3,19) >= cdl[3]);
  ASSUME(cw(3,19) >= cds[3]);
  ASSUME(cw(3,19) >= cctrl[3]);
  ASSUME(cw(3,19) >= caddr[3]);
  // Update
  caddr[3] = max(caddr[3],0);
  buff(3,19) = (r8==1);
  mem(19,cw(3,19)) = (r8==1);
  co(19,cw(3,19))+=1;
  delta(19,cw(3,19)) = -1;
  ASSUME(creturn[3] >= cw(3,19));

  //   ret i8* null, !dbg !117
  ret_thread_3 = (- 1);


  // Dumping thread 4
  int ret_thread_4 = 0;
  cdy[4] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[4] >= cstart[4]);
T4BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !243, metadata !DIExpression()), !dbg !275

  //   br label %label_4, !dbg !90
  goto T4BLOCK1;

T4BLOCK1:
  //   call void @llvm.dbg.label(metadata !274), !dbg !277

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 3), metadata !245, metadata !DIExpression()), !dbg !278

  //   %0 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 3) acquire, align 8, !dbg !93
  // LD: Guess
  //   : Acquire
  old_cr = cr(4,0+3*1);
  cr(4,0+3*1) = get_rng(0,NCONTEXT-1);// 4 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(4,0+3*1)] == 4);
  ASSUME(cr(4,0+3*1) >= iw(4,0+3*1));
  ASSUME(cr(4,0+3*1) >= 0);
  ASSUME(cr(4,0+3*1) >= cdy[4]);
  ASSUME(cr(4,0+3*1) >= cisb[4]);
  ASSUME(cr(4,0+3*1) >= cdl[4]);
  ASSUME(cr(4,0+3*1) >= cl[4]);
  ASSUME(cr(4,0+3*1) >= cx(4,0+3*1));
  ASSUME(cr(4,0+3*1) >= cs(4,0+0));
  ASSUME(cr(4,0+3*1) >= cs(4,0+1));
  ASSUME(cr(4,0+3*1) >= cs(4,0+2));
  ASSUME(cr(4,0+3*1) >= cs(4,0+3));
  ASSUME(cr(4,0+3*1) >= cs(4,0+4));
  ASSUME(cr(4,0+3*1) >= cs(4,0+5));
  ASSUME(cr(4,0+3*1) >= cs(4,0+6));
  ASSUME(cr(4,0+3*1) >= cs(4,0+7));
  ASSUME(cr(4,0+3*1) >= cs(4,8+0));
  ASSUME(cr(4,0+3*1) >= cs(4,13+0));
  ASSUME(cr(4,0+3*1) >= cs(4,16+0));
  ASSUME(cr(4,0+3*1) >= cs(4,15+0));
  ASSUME(cr(4,0+3*1) >= cs(4,9+0));
  ASSUME(cr(4,0+3*1) >= cs(4,14+0));
  ASSUME(cr(4,0+3*1) >= cs(4,12+0));
  ASSUME(cr(4,0+3*1) >= cs(4,18+0));
  ASSUME(cr(4,0+3*1) >= cs(4,20+0));
  ASSUME(cr(4,0+3*1) >= cs(4,21+0));
  ASSUME(cr(4,0+3*1) >= cs(4,22+0));
  ASSUME(cr(4,0+3*1) >= cs(4,23+0));
  ASSUME(cr(4,0+3*1) >= cs(4,10+0));
  ASSUME(cr(4,0+3*1) >= cs(4,17+0));
  ASSUME(cr(4,0+3*1) >= cs(4,19+0));
  ASSUME(cr(4,0+3*1) >= cs(4,11+0));
  // Update
  creg_r9 = cr(4,0+3*1);
  crmax(4,0+3*1) = max(crmax(4,0+3*1),cr(4,0+3*1));
  caddr[4] = max(caddr[4],0);
  if(cr(4,0+3*1) < cw(4,0+3*1)) {
    r9 = buff(4,0+3*1);
  } else {
    if(pw(4,0+3*1) != co(0+3*1,cr(4,0+3*1))) {
      ASSUME(cr(4,0+3*1) >= old_cr);
    }
    pw(4,0+3*1) = co(0+3*1,cr(4,0+3*1));
    r9 = mem(0+3*1,cr(4,0+3*1));
  }
  cl[4] = max(cl[4],cr(4,0+3*1));
  ASSUME(creturn[4] >= cr(4,0+3*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !247, metadata !DIExpression()), !dbg !278

  //   %conv = trunc i64 %0 to i32, !dbg !94

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !244, metadata !DIExpression()), !dbg !275

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 6), metadata !249, metadata !DIExpression()), !dbg !281

  //   %1 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 6) acquire, align 8, !dbg !96
  // LD: Guess
  //   : Acquire
  old_cr = cr(4,0+6*1);
  cr(4,0+6*1) = get_rng(0,NCONTEXT-1);// 4 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(4,0+6*1)] == 4);
  ASSUME(cr(4,0+6*1) >= iw(4,0+6*1));
  ASSUME(cr(4,0+6*1) >= 0);
  ASSUME(cr(4,0+6*1) >= cdy[4]);
  ASSUME(cr(4,0+6*1) >= cisb[4]);
  ASSUME(cr(4,0+6*1) >= cdl[4]);
  ASSUME(cr(4,0+6*1) >= cl[4]);
  ASSUME(cr(4,0+6*1) >= cx(4,0+6*1));
  ASSUME(cr(4,0+6*1) >= cs(4,0+0));
  ASSUME(cr(4,0+6*1) >= cs(4,0+1));
  ASSUME(cr(4,0+6*1) >= cs(4,0+2));
  ASSUME(cr(4,0+6*1) >= cs(4,0+3));
  ASSUME(cr(4,0+6*1) >= cs(4,0+4));
  ASSUME(cr(4,0+6*1) >= cs(4,0+5));
  ASSUME(cr(4,0+6*1) >= cs(4,0+6));
  ASSUME(cr(4,0+6*1) >= cs(4,0+7));
  ASSUME(cr(4,0+6*1) >= cs(4,8+0));
  ASSUME(cr(4,0+6*1) >= cs(4,13+0));
  ASSUME(cr(4,0+6*1) >= cs(4,16+0));
  ASSUME(cr(4,0+6*1) >= cs(4,15+0));
  ASSUME(cr(4,0+6*1) >= cs(4,9+0));
  ASSUME(cr(4,0+6*1) >= cs(4,14+0));
  ASSUME(cr(4,0+6*1) >= cs(4,12+0));
  ASSUME(cr(4,0+6*1) >= cs(4,18+0));
  ASSUME(cr(4,0+6*1) >= cs(4,20+0));
  ASSUME(cr(4,0+6*1) >= cs(4,21+0));
  ASSUME(cr(4,0+6*1) >= cs(4,22+0));
  ASSUME(cr(4,0+6*1) >= cs(4,23+0));
  ASSUME(cr(4,0+6*1) >= cs(4,10+0));
  ASSUME(cr(4,0+6*1) >= cs(4,17+0));
  ASSUME(cr(4,0+6*1) >= cs(4,19+0));
  ASSUME(cr(4,0+6*1) >= cs(4,11+0));
  // Update
  creg_r10 = cr(4,0+6*1);
  crmax(4,0+6*1) = max(crmax(4,0+6*1),cr(4,0+6*1));
  caddr[4] = max(caddr[4],0);
  if(cr(4,0+6*1) < cw(4,0+6*1)) {
    r10 = buff(4,0+6*1);
  } else {
    if(pw(4,0+6*1) != co(0+6*1,cr(4,0+6*1))) {
      ASSUME(cr(4,0+6*1) >= old_cr);
    }
    pw(4,0+6*1) = co(0+6*1,cr(4,0+6*1));
    r10 = mem(0+6*1,cr(4,0+6*1));
  }
  cl[4] = max(cl[4],cr(4,0+6*1));
  ASSUME(creturn[4] >= cr(4,0+6*1));

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !251, metadata !DIExpression()), !dbg !281

  //   %conv4 = trunc i64 %1 to i32, !dbg !97

  //   call void @llvm.dbg.value(metadata i32 %conv4, metadata !248, metadata !DIExpression()), !dbg !275

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 7), metadata !253, metadata !DIExpression()), !dbg !284

  //   %2 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 7) monotonic, align 8, !dbg !99
  // LD: Guess
  old_cr = cr(4,0+7*1);
  cr(4,0+7*1) = get_rng(0,NCONTEXT-1);// 4 ASSIGN LDCOM 
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
  } else {
    if(pw(4,0+7*1) != co(0+7*1,cr(4,0+7*1))) {
      ASSUME(cr(4,0+7*1) >= old_cr);
    }
    pw(4,0+7*1) = co(0+7*1,cr(4,0+7*1));
    r11 = mem(0+7*1,cr(4,0+7*1));
  }
  ASSUME(creturn[4] >= cr(4,0+7*1));

  //   call void @llvm.dbg.value(metadata i64 %2, metadata !255, metadata !DIExpression()), !dbg !284

  //   %conv8 = trunc i64 %2 to i32, !dbg !100

  //   call void @llvm.dbg.value(metadata i32 %conv8, metadata !252, metadata !DIExpression()), !dbg !275

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 4), metadata !256, metadata !DIExpression()), !dbg !287

  //   call void @llvm.dbg.value(metadata i64 1, metadata !258, metadata !DIExpression()), !dbg !287

  //   store atomic i64 1, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 4) monotonic, align 8, !dbg !102
  // ST: Guess
  iw(4,0+4*1) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STIW 
  old_cw = cw(4,0+4*1);
  cw(4,0+4*1) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STCOM 
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 1), metadata !259, metadata !DIExpression()), !dbg !289

  //   call void @llvm.dbg.value(metadata i64 1, metadata !261, metadata !DIExpression()), !dbg !289

  //   store atomic i64 1, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 1) release, align 8, !dbg !104
  // ST: Guess
  //   : Release
  iw(4,0+1*1) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STIW 
  old_cw = cw(4,0+1*1);
  cw(4,0+1*1) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STCOM 
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
  ASSUME(cw(4,0+1*1) >= cr(4,0+0));
  ASSUME(cw(4,0+1*1) >= cr(4,0+1));
  ASSUME(cw(4,0+1*1) >= cr(4,0+2));
  ASSUME(cw(4,0+1*1) >= cr(4,0+3));
  ASSUME(cw(4,0+1*1) >= cr(4,0+4));
  ASSUME(cw(4,0+1*1) >= cr(4,0+5));
  ASSUME(cw(4,0+1*1) >= cr(4,0+6));
  ASSUME(cw(4,0+1*1) >= cr(4,0+7));
  ASSUME(cw(4,0+1*1) >= cr(4,8+0));
  ASSUME(cw(4,0+1*1) >= cr(4,13+0));
  ASSUME(cw(4,0+1*1) >= cr(4,16+0));
  ASSUME(cw(4,0+1*1) >= cr(4,15+0));
  ASSUME(cw(4,0+1*1) >= cr(4,9+0));
  ASSUME(cw(4,0+1*1) >= cr(4,14+0));
  ASSUME(cw(4,0+1*1) >= cr(4,12+0));
  ASSUME(cw(4,0+1*1) >= cr(4,18+0));
  ASSUME(cw(4,0+1*1) >= cr(4,20+0));
  ASSUME(cw(4,0+1*1) >= cr(4,21+0));
  ASSUME(cw(4,0+1*1) >= cr(4,22+0));
  ASSUME(cw(4,0+1*1) >= cr(4,23+0));
  ASSUME(cw(4,0+1*1) >= cr(4,10+0));
  ASSUME(cw(4,0+1*1) >= cr(4,17+0));
  ASSUME(cw(4,0+1*1) >= cr(4,19+0));
  ASSUME(cw(4,0+1*1) >= cr(4,11+0));
  ASSUME(cw(4,0+1*1) >= cw(4,0+0));
  ASSUME(cw(4,0+1*1) >= cw(4,0+1));
  ASSUME(cw(4,0+1*1) >= cw(4,0+2));
  ASSUME(cw(4,0+1*1) >= cw(4,0+3));
  ASSUME(cw(4,0+1*1) >= cw(4,0+4));
  ASSUME(cw(4,0+1*1) >= cw(4,0+5));
  ASSUME(cw(4,0+1*1) >= cw(4,0+6));
  ASSUME(cw(4,0+1*1) >= cw(4,0+7));
  ASSUME(cw(4,0+1*1) >= cw(4,8+0));
  ASSUME(cw(4,0+1*1) >= cw(4,13+0));
  ASSUME(cw(4,0+1*1) >= cw(4,16+0));
  ASSUME(cw(4,0+1*1) >= cw(4,15+0));
  ASSUME(cw(4,0+1*1) >= cw(4,9+0));
  ASSUME(cw(4,0+1*1) >= cw(4,14+0));
  ASSUME(cw(4,0+1*1) >= cw(4,12+0));
  ASSUME(cw(4,0+1*1) >= cw(4,18+0));
  ASSUME(cw(4,0+1*1) >= cw(4,20+0));
  ASSUME(cw(4,0+1*1) >= cw(4,21+0));
  ASSUME(cw(4,0+1*1) >= cw(4,22+0));
  ASSUME(cw(4,0+1*1) >= cw(4,23+0));
  ASSUME(cw(4,0+1*1) >= cw(4,10+0));
  ASSUME(cw(4,0+1*1) >= cw(4,17+0));
  ASSUME(cw(4,0+1*1) >= cw(4,19+0));
  ASSUME(cw(4,0+1*1) >= cw(4,11+0));
  // Update
  caddr[4] = max(caddr[4],0);
  buff(4,0+1*1) = 1;
  mem(0+1*1,cw(4,0+1*1)) = 1;
  co(0+1*1,cw(4,0+1*1))+=1;
  delta(0+1*1,cw(4,0+1*1)) = -1;
  is(4,0+1*1) = iw(4,0+1*1);
  cs(4,0+1*1) = cw(4,0+1*1);
  ASSUME(creturn[4] >= cw(4,0+1*1));

  //   %cmp = icmp eq i32 %conv8, 1, !dbg !105

  //   %conv11 = zext i1 %cmp to i32, !dbg !105

  //   call void @llvm.dbg.value(metadata i32 %conv11, metadata !262, metadata !DIExpression()), !dbg !275

  //   call void @llvm.dbg.value(metadata i64* @atom_3_X4_1, metadata !263, metadata !DIExpression()), !dbg !292

  //   %3 = zext i32 %conv11 to i64

  //   call void @llvm.dbg.value(metadata i64 %3, metadata !265, metadata !DIExpression()), !dbg !292

  //   store atomic i64 %3, i64* @atom_3_X4_1 seq_cst, align 8, !dbg !107
  // ST: Guess
  iw(4,11) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STIW 
  old_cw = cw(4,11);
  cw(4,11) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(4,11)] == 4);
  ASSUME(active[cw(4,11)] == 4);
  ASSUME(sforbid(11,cw(4,11))== 0);
  ASSUME(iw(4,11) >= max(creg_r11,0));
  ASSUME(iw(4,11) >= 0);
  ASSUME(cw(4,11) >= iw(4,11));
  ASSUME(cw(4,11) >= old_cw);
  ASSUME(cw(4,11) >= cr(4,11));
  ASSUME(cw(4,11) >= cl[4]);
  ASSUME(cw(4,11) >= cisb[4]);
  ASSUME(cw(4,11) >= cdy[4]);
  ASSUME(cw(4,11) >= cdl[4]);
  ASSUME(cw(4,11) >= cds[4]);
  ASSUME(cw(4,11) >= cctrl[4]);
  ASSUME(cw(4,11) >= caddr[4]);
  // Update
  caddr[4] = max(caddr[4],0);
  buff(4,11) = (r11==1);
  mem(11,cw(4,11)) = (r11==1);
  co(11,cw(4,11))+=1;
  delta(11,cw(4,11)) = -1;
  ASSUME(creturn[4] >= cw(4,11));

  //   %cmp15 = icmp eq i32 %conv, 1, !dbg !108

  //   %conv16 = zext i1 %cmp15 to i32, !dbg !108

  //   call void @llvm.dbg.value(metadata i32 %conv16, metadata !266, metadata !DIExpression()), !dbg !275

  //   call void @llvm.dbg.value(metadata i64* @atom_3_X0_1, metadata !267, metadata !DIExpression()), !dbg !295

  //   %4 = zext i32 %conv16 to i64

  //   call void @llvm.dbg.value(metadata i64 %4, metadata !269, metadata !DIExpression()), !dbg !295

  //   store atomic i64 %4, i64* @atom_3_X0_1 seq_cst, align 8, !dbg !110
  // ST: Guess
  iw(4,14) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STIW 
  old_cw = cw(4,14);
  cw(4,14) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(4,14)] == 4);
  ASSUME(active[cw(4,14)] == 4);
  ASSUME(sforbid(14,cw(4,14))== 0);
  ASSUME(iw(4,14) >= max(creg_r9,0));
  ASSUME(iw(4,14) >= 0);
  ASSUME(cw(4,14) >= iw(4,14));
  ASSUME(cw(4,14) >= old_cw);
  ASSUME(cw(4,14) >= cr(4,14));
  ASSUME(cw(4,14) >= cl[4]);
  ASSUME(cw(4,14) >= cisb[4]);
  ASSUME(cw(4,14) >= cdy[4]);
  ASSUME(cw(4,14) >= cdl[4]);
  ASSUME(cw(4,14) >= cds[4]);
  ASSUME(cw(4,14) >= cctrl[4]);
  ASSUME(cw(4,14) >= caddr[4]);
  // Update
  caddr[4] = max(caddr[4],0);
  buff(4,14) = (r9==1);
  mem(14,cw(4,14)) = (r9==1);
  co(14,cw(4,14))+=1;
  delta(14,cw(4,14)) = -1;
  ASSUME(creturn[4] >= cw(4,14));

  //   %cmp20 = icmp eq i32 %conv4, 1, !dbg !111

  //   %conv21 = zext i1 %cmp20 to i32, !dbg !111

  //   call void @llvm.dbg.value(metadata i32 %conv21, metadata !270, metadata !DIExpression()), !dbg !275

  //   call void @llvm.dbg.value(metadata i64* @atom_3_X2_1, metadata !271, metadata !DIExpression()), !dbg !298

  //   %5 = zext i32 %conv21 to i64

  //   call void @llvm.dbg.value(metadata i64 %5, metadata !273, metadata !DIExpression()), !dbg !298

  //   store atomic i64 %5, i64* @atom_3_X2_1 seq_cst, align 8, !dbg !113
  // ST: Guess
  iw(4,18) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STIW 
  old_cw = cw(4,18);
  cw(4,18) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(4,18)] == 4);
  ASSUME(active[cw(4,18)] == 4);
  ASSUME(sforbid(18,cw(4,18))== 0);
  ASSUME(iw(4,18) >= max(creg_r10,0));
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
  buff(4,18) = (r10==1);
  mem(18,cw(4,18)) = (r10==1);
  co(18,cw(4,18))+=1;
  delta(18,cw(4,18)) = -1;
  ASSUME(creturn[4] >= cw(4,18));

  //   ret i8* null, !dbg !114
  ret_thread_4 = (- 1);


  // Dumping thread 0
  int ret_thread_0 = 0;
  cdy[0] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[0] >= cstart[0]);
T0BLOCK0:
  //   %thr0 = alloca i64, align 8

  //   %thr1 = alloca i64, align 8

  //   %thr2 = alloca i64, align 8

  //   %thr3 = alloca i64, align 8

  //   call void @llvm.dbg.value(metadata i32 %argc, metadata !308, metadata !DIExpression()), !dbg !436

  //   call void @llvm.dbg.value(metadata i8** %argv, metadata !309, metadata !DIExpression()), !dbg !436

  //   %0 = bitcast i64* %thr0 to i8*, !dbg !189

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #7, !dbg !189

  //   call void @llvm.dbg.declare(metadata i64* %thr0, metadata !310, metadata !DIExpression()), !dbg !438

  //   %1 = bitcast i64* %thr1 to i8*, !dbg !191

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #7, !dbg !191

  //   call void @llvm.dbg.declare(metadata i64* %thr1, metadata !314, metadata !DIExpression()), !dbg !440

  //   %2 = bitcast i64* %thr2 to i8*, !dbg !193

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #7, !dbg !193

  //   call void @llvm.dbg.declare(metadata i64* %thr2, metadata !315, metadata !DIExpression()), !dbg !442

  //   %3 = bitcast i64* %thr3 to i8*, !dbg !195

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #7, !dbg !195

  //   call void @llvm.dbg.declare(metadata i64* %thr3, metadata !316, metadata !DIExpression()), !dbg !444

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 7), metadata !317, metadata !DIExpression()), !dbg !445

  //   call void @llvm.dbg.value(metadata i64 0, metadata !319, metadata !DIExpression()), !dbg !445

  //   store atomic i64 0, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 7) monotonic, align 8, !dbg !198
  // ST: Guess
  iw(0,0+7*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW 
  old_cw = cw(0,0+7*1);
  cw(0,0+7*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM 
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 6), metadata !320, metadata !DIExpression()), !dbg !447

  //   call void @llvm.dbg.value(metadata i64 0, metadata !322, metadata !DIExpression()), !dbg !447

  //   store atomic i64 0, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 6) monotonic, align 8, !dbg !200
  // ST: Guess
  iw(0,0+6*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW 
  old_cw = cw(0,0+6*1);
  cw(0,0+6*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM 
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 5), metadata !323, metadata !DIExpression()), !dbg !449

  //   call void @llvm.dbg.value(metadata i64 0, metadata !325, metadata !DIExpression()), !dbg !449

  //   store atomic i64 0, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 5) monotonic, align 8, !dbg !202
  // ST: Guess
  iw(0,0+5*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW 
  old_cw = cw(0,0+5*1);
  cw(0,0+5*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM 
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 4), metadata !326, metadata !DIExpression()), !dbg !451

  //   call void @llvm.dbg.value(metadata i64 0, metadata !328, metadata !DIExpression()), !dbg !451

  //   store atomic i64 0, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 4) monotonic, align 8, !dbg !204
  // ST: Guess
  iw(0,0+4*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW 
  old_cw = cw(0,0+4*1);
  cw(0,0+4*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM 
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 3), metadata !329, metadata !DIExpression()), !dbg !453

  //   call void @llvm.dbg.value(metadata i64 0, metadata !331, metadata !DIExpression()), !dbg !453

  //   store atomic i64 0, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !206
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 2), metadata !332, metadata !DIExpression()), !dbg !455

  //   call void @llvm.dbg.value(metadata i64 0, metadata !334, metadata !DIExpression()), !dbg !455

  //   store atomic i64 0, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 2) monotonic, align 8, !dbg !208
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 1), metadata !335, metadata !DIExpression()), !dbg !457

  //   call void @llvm.dbg.value(metadata i64 0, metadata !337, metadata !DIExpression()), !dbg !457

  //   store atomic i64 0, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !210
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 0), metadata !338, metadata !DIExpression()), !dbg !459

  //   call void @llvm.dbg.value(metadata i64 0, metadata !340, metadata !DIExpression()), !dbg !459

  //   store atomic i64 0, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !212
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

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X0_1, metadata !341, metadata !DIExpression()), !dbg !461

  //   call void @llvm.dbg.value(metadata i64 0, metadata !343, metadata !DIExpression()), !dbg !461

  //   store atomic i64 0, i64* @atom_0_X0_1 monotonic, align 8, !dbg !214
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

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X4_1, metadata !344, metadata !DIExpression()), !dbg !463

  //   call void @llvm.dbg.value(metadata i64 0, metadata !346, metadata !DIExpression()), !dbg !463

  //   store atomic i64 0, i64* @atom_1_X4_1 monotonic, align 8, !dbg !216
  // ST: Guess
  iw(0,9) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW 
  old_cw = cw(0,9);
  cw(0,9) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM 
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

  //   call void @llvm.dbg.value(metadata i64* @atom_2_X0_1, metadata !347, metadata !DIExpression()), !dbg !465

  //   call void @llvm.dbg.value(metadata i64 0, metadata !349, metadata !DIExpression()), !dbg !465

  //   store atomic i64 0, i64* @atom_2_X0_1 monotonic, align 8, !dbg !218
  // ST: Guess
  iw(0,10) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW 
  old_cw = cw(0,10);
  cw(0,10) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM 
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

  //   call void @llvm.dbg.value(metadata i64* @atom_3_X4_1, metadata !350, metadata !DIExpression()), !dbg !467

  //   call void @llvm.dbg.value(metadata i64 0, metadata !352, metadata !DIExpression()), !dbg !467

  //   store atomic i64 0, i64* @atom_3_X4_1 monotonic, align 8, !dbg !220
  // ST: Guess
  iw(0,11) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW 
  old_cw = cw(0,11);
  cw(0,11) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM 
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

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X0_1, metadata !353, metadata !DIExpression()), !dbg !469

  //   call void @llvm.dbg.value(metadata i64 0, metadata !355, metadata !DIExpression()), !dbg !469

  //   store atomic i64 0, i64* @atom_1_X0_1 monotonic, align 8, !dbg !222
  // ST: Guess
  iw(0,12) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW 
  old_cw = cw(0,12);
  cw(0,12) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM 
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

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X3_1, metadata !356, metadata !DIExpression()), !dbg !471

  //   call void @llvm.dbg.value(metadata i64 0, metadata !358, metadata !DIExpression()), !dbg !471

  //   store atomic i64 0, i64* @atom_0_X3_1 monotonic, align 8, !dbg !224
  // ST: Guess
  iw(0,13) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW 
  old_cw = cw(0,13);
  cw(0,13) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM 
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

  //   call void @llvm.dbg.value(metadata i64* @atom_3_X0_1, metadata !359, metadata !DIExpression()), !dbg !473

  //   call void @llvm.dbg.value(metadata i64 0, metadata !361, metadata !DIExpression()), !dbg !473

  //   store atomic i64 0, i64* @atom_3_X0_1 monotonic, align 8, !dbg !226
  // ST: Guess
  iw(0,14) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW 
  old_cw = cw(0,14);
  cw(0,14) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM 
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

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X5_1, metadata !362, metadata !DIExpression()), !dbg !475

  //   call void @llvm.dbg.value(metadata i64 0, metadata !364, metadata !DIExpression()), !dbg !475

  //   store atomic i64 0, i64* @atom_0_X5_1 monotonic, align 8, !dbg !228
  // ST: Guess
  iw(0,15) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW 
  old_cw = cw(0,15);
  cw(0,15) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM 
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

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X2_1, metadata !365, metadata !DIExpression()), !dbg !477

  //   call void @llvm.dbg.value(metadata i64 0, metadata !367, metadata !DIExpression()), !dbg !477

  //   store atomic i64 0, i64* @atom_1_X2_1 monotonic, align 8, !dbg !230
  // ST: Guess
  iw(0,16) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW 
  old_cw = cw(0,16);
  cw(0,16) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM 
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

  //   call void @llvm.dbg.value(metadata i64* @atom_2_X3_1, metadata !368, metadata !DIExpression()), !dbg !479

  //   call void @llvm.dbg.value(metadata i64 0, metadata !370, metadata !DIExpression()), !dbg !479

  //   store atomic i64 0, i64* @atom_2_X3_1 monotonic, align 8, !dbg !232
  // ST: Guess
  iw(0,17) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW 
  old_cw = cw(0,17);
  cw(0,17) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM 
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

  //   call void @llvm.dbg.value(metadata i64* @atom_3_X2_1, metadata !371, metadata !DIExpression()), !dbg !481

  //   call void @llvm.dbg.value(metadata i64 0, metadata !373, metadata !DIExpression()), !dbg !481

  //   store atomic i64 0, i64* @atom_3_X2_1 monotonic, align 8, !dbg !234
  // ST: Guess
  iw(0,18) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW 
  old_cw = cw(0,18);
  cw(0,18) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM 
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

  //   call void @llvm.dbg.value(metadata i64* @atom_2_X5_1, metadata !374, metadata !DIExpression()), !dbg !483

  //   call void @llvm.dbg.value(metadata i64 0, metadata !376, metadata !DIExpression()), !dbg !483

  //   store atomic i64 0, i64* @atom_2_X5_1 monotonic, align 8, !dbg !236
  // ST: Guess
  iw(0,19) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW 
  old_cw = cw(0,19);
  cw(0,19) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM 
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

  //   %call = call i32 @pthread_create(i64* noundef %thr0, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t0, i8* noundef null) #7, !dbg !237
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
  ASSUME(cdy[0] >= cw(0,0+4));
  ASSUME(cdy[0] >= cw(0,0+5));
  ASSUME(cdy[0] >= cw(0,0+6));
  ASSUME(cdy[0] >= cw(0,0+7));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,18+0));
  ASSUME(cdy[0] >= cw(0,20+0));
  ASSUME(cdy[0] >= cw(0,21+0));
  ASSUME(cdy[0] >= cw(0,22+0));
  ASSUME(cdy[0] >= cw(0,23+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cw(0,19+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,0+6));
  ASSUME(cdy[0] >= cr(0,0+7));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,18+0));
  ASSUME(cdy[0] >= cr(0,20+0));
  ASSUME(cdy[0] >= cr(0,21+0));
  ASSUME(cdy[0] >= cr(0,22+0));
  ASSUME(cdy[0] >= cr(0,23+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(cdy[0] >= cr(0,19+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[1] >= cdy[0]);

  //   %call39 = call i32 @pthread_create(i64* noundef %thr1, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t1, i8* noundef null) #7, !dbg !238
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
  ASSUME(cdy[0] >= cw(0,0+4));
  ASSUME(cdy[0] >= cw(0,0+5));
  ASSUME(cdy[0] >= cw(0,0+6));
  ASSUME(cdy[0] >= cw(0,0+7));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,18+0));
  ASSUME(cdy[0] >= cw(0,20+0));
  ASSUME(cdy[0] >= cw(0,21+0));
  ASSUME(cdy[0] >= cw(0,22+0));
  ASSUME(cdy[0] >= cw(0,23+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cw(0,19+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,0+6));
  ASSUME(cdy[0] >= cr(0,0+7));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,18+0));
  ASSUME(cdy[0] >= cr(0,20+0));
  ASSUME(cdy[0] >= cr(0,21+0));
  ASSUME(cdy[0] >= cr(0,22+0));
  ASSUME(cdy[0] >= cr(0,23+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(cdy[0] >= cr(0,19+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[2] >= cdy[0]);

  //   %call40 = call i32 @pthread_create(i64* noundef %thr2, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t2, i8* noundef null) #7, !dbg !239
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
  ASSUME(cdy[0] >= cw(0,0+4));
  ASSUME(cdy[0] >= cw(0,0+5));
  ASSUME(cdy[0] >= cw(0,0+6));
  ASSUME(cdy[0] >= cw(0,0+7));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,18+0));
  ASSUME(cdy[0] >= cw(0,20+0));
  ASSUME(cdy[0] >= cw(0,21+0));
  ASSUME(cdy[0] >= cw(0,22+0));
  ASSUME(cdy[0] >= cw(0,23+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cw(0,19+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,0+6));
  ASSUME(cdy[0] >= cr(0,0+7));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,18+0));
  ASSUME(cdy[0] >= cr(0,20+0));
  ASSUME(cdy[0] >= cr(0,21+0));
  ASSUME(cdy[0] >= cr(0,22+0));
  ASSUME(cdy[0] >= cr(0,23+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(cdy[0] >= cr(0,19+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[3] >= cdy[0]);

  //   %call41 = call i32 @pthread_create(i64* noundef %thr3, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t3, i8* noundef null) #7, !dbg !240
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
  ASSUME(cdy[0] >= cw(0,0+4));
  ASSUME(cdy[0] >= cw(0,0+5));
  ASSUME(cdy[0] >= cw(0,0+6));
  ASSUME(cdy[0] >= cw(0,0+7));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,18+0));
  ASSUME(cdy[0] >= cw(0,20+0));
  ASSUME(cdy[0] >= cw(0,21+0));
  ASSUME(cdy[0] >= cw(0,22+0));
  ASSUME(cdy[0] >= cw(0,23+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cw(0,19+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,0+6));
  ASSUME(cdy[0] >= cr(0,0+7));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,18+0));
  ASSUME(cdy[0] >= cr(0,20+0));
  ASSUME(cdy[0] >= cr(0,21+0));
  ASSUME(cdy[0] >= cr(0,22+0));
  ASSUME(cdy[0] >= cr(0,23+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(cdy[0] >= cr(0,19+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[4] >= cdy[0]);

  //   %4 = load i64, i64* %thr0, align 8, !dbg !241, !tbaa !242
  // LD: Guess
  old_cr = cr(0,20);
  cr(0,20) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(0,20)] == 0);
  ASSUME(cr(0,20) >= iw(0,20));
  ASSUME(cr(0,20) >= 0);
  ASSUME(cr(0,20) >= cdy[0]);
  ASSUME(cr(0,20) >= cisb[0]);
  ASSUME(cr(0,20) >= cdl[0]);
  ASSUME(cr(0,20) >= cl[0]);
  // Update
  creg_r13 = cr(0,20);
  crmax(0,20) = max(crmax(0,20),cr(0,20));
  caddr[0] = max(caddr[0],0);
  if(cr(0,20) < cw(0,20)) {
    r13 = buff(0,20);
  } else {
    if(pw(0,20) != co(20,cr(0,20))) {
      ASSUME(cr(0,20) >= old_cr);
    }
    pw(0,20) = co(20,cr(0,20));
    r13 = mem(20,cr(0,20));
  }
  ASSUME(creturn[0] >= cr(0,20));

  //   %call42 = call i32 @pthread_join(i64 noundef %4, i8** noundef null), !dbg !246
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
  ASSUME(cdy[0] >= cw(0,0+4));
  ASSUME(cdy[0] >= cw(0,0+5));
  ASSUME(cdy[0] >= cw(0,0+6));
  ASSUME(cdy[0] >= cw(0,0+7));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,18+0));
  ASSUME(cdy[0] >= cw(0,20+0));
  ASSUME(cdy[0] >= cw(0,21+0));
  ASSUME(cdy[0] >= cw(0,22+0));
  ASSUME(cdy[0] >= cw(0,23+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cw(0,19+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,0+6));
  ASSUME(cdy[0] >= cr(0,0+7));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,18+0));
  ASSUME(cdy[0] >= cr(0,20+0));
  ASSUME(cdy[0] >= cr(0,21+0));
  ASSUME(cdy[0] >= cr(0,22+0));
  ASSUME(cdy[0] >= cr(0,23+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(cdy[0] >= cr(0,19+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[1]);

  //   %5 = load i64, i64* %thr1, align 8, !dbg !247, !tbaa !242
  // LD: Guess
  old_cr = cr(0,21);
  cr(0,21) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(0,21)] == 0);
  ASSUME(cr(0,21) >= iw(0,21));
  ASSUME(cr(0,21) >= 0);
  ASSUME(cr(0,21) >= cdy[0]);
  ASSUME(cr(0,21) >= cisb[0]);
  ASSUME(cr(0,21) >= cdl[0]);
  ASSUME(cr(0,21) >= cl[0]);
  // Update
  creg_r14 = cr(0,21);
  crmax(0,21) = max(crmax(0,21),cr(0,21));
  caddr[0] = max(caddr[0],0);
  if(cr(0,21) < cw(0,21)) {
    r14 = buff(0,21);
  } else {
    if(pw(0,21) != co(21,cr(0,21))) {
      ASSUME(cr(0,21) >= old_cr);
    }
    pw(0,21) = co(21,cr(0,21));
    r14 = mem(21,cr(0,21));
  }
  ASSUME(creturn[0] >= cr(0,21));

  //   %call43 = call i32 @pthread_join(i64 noundef %5, i8** noundef null), !dbg !248
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
  ASSUME(cdy[0] >= cw(0,0+4));
  ASSUME(cdy[0] >= cw(0,0+5));
  ASSUME(cdy[0] >= cw(0,0+6));
  ASSUME(cdy[0] >= cw(0,0+7));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,18+0));
  ASSUME(cdy[0] >= cw(0,20+0));
  ASSUME(cdy[0] >= cw(0,21+0));
  ASSUME(cdy[0] >= cw(0,22+0));
  ASSUME(cdy[0] >= cw(0,23+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cw(0,19+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,0+6));
  ASSUME(cdy[0] >= cr(0,0+7));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,18+0));
  ASSUME(cdy[0] >= cr(0,20+0));
  ASSUME(cdy[0] >= cr(0,21+0));
  ASSUME(cdy[0] >= cr(0,22+0));
  ASSUME(cdy[0] >= cr(0,23+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(cdy[0] >= cr(0,19+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[2]);

  //   %6 = load i64, i64* %thr2, align 8, !dbg !249, !tbaa !242
  // LD: Guess
  old_cr = cr(0,22);
  cr(0,22) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(0,22)] == 0);
  ASSUME(cr(0,22) >= iw(0,22));
  ASSUME(cr(0,22) >= 0);
  ASSUME(cr(0,22) >= cdy[0]);
  ASSUME(cr(0,22) >= cisb[0]);
  ASSUME(cr(0,22) >= cdl[0]);
  ASSUME(cr(0,22) >= cl[0]);
  // Update
  creg_r15 = cr(0,22);
  crmax(0,22) = max(crmax(0,22),cr(0,22));
  caddr[0] = max(caddr[0],0);
  if(cr(0,22) < cw(0,22)) {
    r15 = buff(0,22);
  } else {
    if(pw(0,22) != co(22,cr(0,22))) {
      ASSUME(cr(0,22) >= old_cr);
    }
    pw(0,22) = co(22,cr(0,22));
    r15 = mem(22,cr(0,22));
  }
  ASSUME(creturn[0] >= cr(0,22));

  //   %call44 = call i32 @pthread_join(i64 noundef %6, i8** noundef null), !dbg !250
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
  ASSUME(cdy[0] >= cw(0,0+4));
  ASSUME(cdy[0] >= cw(0,0+5));
  ASSUME(cdy[0] >= cw(0,0+6));
  ASSUME(cdy[0] >= cw(0,0+7));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,18+0));
  ASSUME(cdy[0] >= cw(0,20+0));
  ASSUME(cdy[0] >= cw(0,21+0));
  ASSUME(cdy[0] >= cw(0,22+0));
  ASSUME(cdy[0] >= cw(0,23+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cw(0,19+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,0+6));
  ASSUME(cdy[0] >= cr(0,0+7));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,18+0));
  ASSUME(cdy[0] >= cr(0,20+0));
  ASSUME(cdy[0] >= cr(0,21+0));
  ASSUME(cdy[0] >= cr(0,22+0));
  ASSUME(cdy[0] >= cr(0,23+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(cdy[0] >= cr(0,19+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[3]);

  //   %7 = load i64, i64* %thr3, align 8, !dbg !251, !tbaa !242
  // LD: Guess
  old_cr = cr(0,23);
  cr(0,23) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(0,23)] == 0);
  ASSUME(cr(0,23) >= iw(0,23));
  ASSUME(cr(0,23) >= 0);
  ASSUME(cr(0,23) >= cdy[0]);
  ASSUME(cr(0,23) >= cisb[0]);
  ASSUME(cr(0,23) >= cdl[0]);
  ASSUME(cr(0,23) >= cl[0]);
  // Update
  creg_r16 = cr(0,23);
  crmax(0,23) = max(crmax(0,23),cr(0,23));
  caddr[0] = max(caddr[0],0);
  if(cr(0,23) < cw(0,23)) {
    r16 = buff(0,23);
  } else {
    if(pw(0,23) != co(23,cr(0,23))) {
      ASSUME(cr(0,23) >= old_cr);
    }
    pw(0,23) = co(23,cr(0,23));
    r16 = mem(23,cr(0,23));
  }
  ASSUME(creturn[0] >= cr(0,23));

  //   %call45 = call i32 @pthread_join(i64 noundef %7, i8** noundef null), !dbg !252
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
  ASSUME(cdy[0] >= cw(0,0+4));
  ASSUME(cdy[0] >= cw(0,0+5));
  ASSUME(cdy[0] >= cw(0,0+6));
  ASSUME(cdy[0] >= cw(0,0+7));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,18+0));
  ASSUME(cdy[0] >= cw(0,20+0));
  ASSUME(cdy[0] >= cw(0,21+0));
  ASSUME(cdy[0] >= cw(0,22+0));
  ASSUME(cdy[0] >= cw(0,23+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cw(0,19+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,0+6));
  ASSUME(cdy[0] >= cr(0,0+7));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,18+0));
  ASSUME(cdy[0] >= cr(0,20+0));
  ASSUME(cdy[0] >= cr(0,21+0));
  ASSUME(cdy[0] >= cr(0,22+0));
  ASSUME(cdy[0] >= cr(0,23+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(cdy[0] >= cr(0,19+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[4]);

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X0_1, metadata !378, metadata !DIExpression()), !dbg !501

  //   %8 = load atomic i64, i64* @atom_0_X0_1 seq_cst, align 8, !dbg !254
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
  creg_r17 = cr(0,8);
  crmax(0,8) = max(crmax(0,8),cr(0,8));
  caddr[0] = max(caddr[0],0);
  if(cr(0,8) < cw(0,8)) {
    r17 = buff(0,8);
  } else {
    if(pw(0,8) != co(8,cr(0,8))) {
      ASSUME(cr(0,8) >= old_cr);
    }
    pw(0,8) = co(8,cr(0,8));
    r17 = mem(8,cr(0,8));
  }
  ASSUME(creturn[0] >= cr(0,8));

  //   call void @llvm.dbg.value(metadata i64 %8, metadata !380, metadata !DIExpression()), !dbg !501

  //   %conv = trunc i64 %8 to i32, !dbg !255

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !377, metadata !DIExpression()), !dbg !436

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X4_1, metadata !382, metadata !DIExpression()), !dbg !504

  //   %9 = load atomic i64, i64* @atom_1_X4_1 seq_cst, align 8, !dbg !257
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
  creg_r18 = cr(0,9);
  crmax(0,9) = max(crmax(0,9),cr(0,9));
  caddr[0] = max(caddr[0],0);
  if(cr(0,9) < cw(0,9)) {
    r18 = buff(0,9);
  } else {
    if(pw(0,9) != co(9,cr(0,9))) {
      ASSUME(cr(0,9) >= old_cr);
    }
    pw(0,9) = co(9,cr(0,9));
    r18 = mem(9,cr(0,9));
  }
  ASSUME(creturn[0] >= cr(0,9));

  //   call void @llvm.dbg.value(metadata i64 %9, metadata !384, metadata !DIExpression()), !dbg !504

  //   %conv49 = trunc i64 %9 to i32, !dbg !258

  //   call void @llvm.dbg.value(metadata i32 %conv49, metadata !381, metadata !DIExpression()), !dbg !436

  //   call void @llvm.dbg.value(metadata i64* @atom_2_X0_1, metadata !386, metadata !DIExpression()), !dbg !507

  //   %10 = load atomic i64, i64* @atom_2_X0_1 seq_cst, align 8, !dbg !260
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
  creg_r19 = cr(0,10);
  crmax(0,10) = max(crmax(0,10),cr(0,10));
  caddr[0] = max(caddr[0],0);
  if(cr(0,10) < cw(0,10)) {
    r19 = buff(0,10);
  } else {
    if(pw(0,10) != co(10,cr(0,10))) {
      ASSUME(cr(0,10) >= old_cr);
    }
    pw(0,10) = co(10,cr(0,10));
    r19 = mem(10,cr(0,10));
  }
  ASSUME(creturn[0] >= cr(0,10));

  //   call void @llvm.dbg.value(metadata i64 %10, metadata !388, metadata !DIExpression()), !dbg !507

  //   %conv53 = trunc i64 %10 to i32, !dbg !261

  //   call void @llvm.dbg.value(metadata i32 %conv53, metadata !385, metadata !DIExpression()), !dbg !436

  //   call void @llvm.dbg.value(metadata i64* @atom_3_X4_1, metadata !390, metadata !DIExpression()), !dbg !510

  //   %11 = load atomic i64, i64* @atom_3_X4_1 seq_cst, align 8, !dbg !263
  // LD: Guess
  old_cr = cr(0,11);
  cr(0,11) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(0,11)] == 0);
  ASSUME(cr(0,11) >= iw(0,11));
  ASSUME(cr(0,11) >= 0);
  ASSUME(cr(0,11) >= cdy[0]);
  ASSUME(cr(0,11) >= cisb[0]);
  ASSUME(cr(0,11) >= cdl[0]);
  ASSUME(cr(0,11) >= cl[0]);
  // Update
  creg_r20 = cr(0,11);
  crmax(0,11) = max(crmax(0,11),cr(0,11));
  caddr[0] = max(caddr[0],0);
  if(cr(0,11) < cw(0,11)) {
    r20 = buff(0,11);
  } else {
    if(pw(0,11) != co(11,cr(0,11))) {
      ASSUME(cr(0,11) >= old_cr);
    }
    pw(0,11) = co(11,cr(0,11));
    r20 = mem(11,cr(0,11));
  }
  ASSUME(creturn[0] >= cr(0,11));

  //   call void @llvm.dbg.value(metadata i64 %11, metadata !392, metadata !DIExpression()), !dbg !510

  //   %conv57 = trunc i64 %11 to i32, !dbg !264

  //   call void @llvm.dbg.value(metadata i32 %conv57, metadata !389, metadata !DIExpression()), !dbg !436

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X0_1, metadata !394, metadata !DIExpression()), !dbg !513

  //   %12 = load atomic i64, i64* @atom_1_X0_1 seq_cst, align 8, !dbg !266
  // LD: Guess
  old_cr = cr(0,12);
  cr(0,12) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM 
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
  } else {
    if(pw(0,12) != co(12,cr(0,12))) {
      ASSUME(cr(0,12) >= old_cr);
    }
    pw(0,12) = co(12,cr(0,12));
    r21 = mem(12,cr(0,12));
  }
  ASSUME(creturn[0] >= cr(0,12));

  //   call void @llvm.dbg.value(metadata i64 %12, metadata !396, metadata !DIExpression()), !dbg !513

  //   %conv61 = trunc i64 %12 to i32, !dbg !267

  //   call void @llvm.dbg.value(metadata i32 %conv61, metadata !393, metadata !DIExpression()), !dbg !436

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X3_1, metadata !398, metadata !DIExpression()), !dbg !516

  //   %13 = load atomic i64, i64* @atom_0_X3_1 seq_cst, align 8, !dbg !269
  // LD: Guess
  old_cr = cr(0,13);
  cr(0,13) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(0,13)] == 0);
  ASSUME(cr(0,13) >= iw(0,13));
  ASSUME(cr(0,13) >= 0);
  ASSUME(cr(0,13) >= cdy[0]);
  ASSUME(cr(0,13) >= cisb[0]);
  ASSUME(cr(0,13) >= cdl[0]);
  ASSUME(cr(0,13) >= cl[0]);
  // Update
  creg_r22 = cr(0,13);
  crmax(0,13) = max(crmax(0,13),cr(0,13));
  caddr[0] = max(caddr[0],0);
  if(cr(0,13) < cw(0,13)) {
    r22 = buff(0,13);
  } else {
    if(pw(0,13) != co(13,cr(0,13))) {
      ASSUME(cr(0,13) >= old_cr);
    }
    pw(0,13) = co(13,cr(0,13));
    r22 = mem(13,cr(0,13));
  }
  ASSUME(creturn[0] >= cr(0,13));

  //   call void @llvm.dbg.value(metadata i64 %13, metadata !400, metadata !DIExpression()), !dbg !516

  //   %conv65 = trunc i64 %13 to i32, !dbg !270

  //   call void @llvm.dbg.value(metadata i32 %conv65, metadata !397, metadata !DIExpression()), !dbg !436

  //   %or = or i32 %conv61, %conv65, !dbg !271
  creg_r23 = max(creg_r21,creg_r22);
  ASSUME(active[creg_r23] == 0);
  r23 = r21 | r22;

  //   call void @llvm.dbg.value(metadata i32 %or, metadata !401, metadata !DIExpression()), !dbg !436

  //   call void @llvm.dbg.value(metadata i64* @atom_3_X0_1, metadata !403, metadata !DIExpression()), !dbg !520

  //   %14 = load atomic i64, i64* @atom_3_X0_1 seq_cst, align 8, !dbg !273
  // LD: Guess
  old_cr = cr(0,14);
  cr(0,14) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(0,14)] == 0);
  ASSUME(cr(0,14) >= iw(0,14));
  ASSUME(cr(0,14) >= 0);
  ASSUME(cr(0,14) >= cdy[0]);
  ASSUME(cr(0,14) >= cisb[0]);
  ASSUME(cr(0,14) >= cdl[0]);
  ASSUME(cr(0,14) >= cl[0]);
  // Update
  creg_r24 = cr(0,14);
  crmax(0,14) = max(crmax(0,14),cr(0,14));
  caddr[0] = max(caddr[0],0);
  if(cr(0,14) < cw(0,14)) {
    r24 = buff(0,14);
  } else {
    if(pw(0,14) != co(14,cr(0,14))) {
      ASSUME(cr(0,14) >= old_cr);
    }
    pw(0,14) = co(14,cr(0,14));
    r24 = mem(14,cr(0,14));
  }
  ASSUME(creturn[0] >= cr(0,14));

  //   call void @llvm.dbg.value(metadata i64 %14, metadata !405, metadata !DIExpression()), !dbg !520

  //   %conv69 = trunc i64 %14 to i32, !dbg !274

  //   call void @llvm.dbg.value(metadata i32 %conv69, metadata !402, metadata !DIExpression()), !dbg !436

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X5_1, metadata !407, metadata !DIExpression()), !dbg !523

  //   %15 = load atomic i64, i64* @atom_0_X5_1 seq_cst, align 8, !dbg !276
  // LD: Guess
  old_cr = cr(0,15);
  cr(0,15) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(0,15)] == 0);
  ASSUME(cr(0,15) >= iw(0,15));
  ASSUME(cr(0,15) >= 0);
  ASSUME(cr(0,15) >= cdy[0]);
  ASSUME(cr(0,15) >= cisb[0]);
  ASSUME(cr(0,15) >= cdl[0]);
  ASSUME(cr(0,15) >= cl[0]);
  // Update
  creg_r25 = cr(0,15);
  crmax(0,15) = max(crmax(0,15),cr(0,15));
  caddr[0] = max(caddr[0],0);
  if(cr(0,15) < cw(0,15)) {
    r25 = buff(0,15);
  } else {
    if(pw(0,15) != co(15,cr(0,15))) {
      ASSUME(cr(0,15) >= old_cr);
    }
    pw(0,15) = co(15,cr(0,15));
    r25 = mem(15,cr(0,15));
  }
  ASSUME(creturn[0] >= cr(0,15));

  //   call void @llvm.dbg.value(metadata i64 %15, metadata !409, metadata !DIExpression()), !dbg !523

  //   %conv73 = trunc i64 %15 to i32, !dbg !277

  //   call void @llvm.dbg.value(metadata i32 %conv73, metadata !406, metadata !DIExpression()), !dbg !436

  //   %or74 = or i32 %conv69, %conv73, !dbg !278
  creg_r26 = max(creg_r24,creg_r25);
  ASSUME(active[creg_r26] == 0);
  r26 = r24 | r25;

  //   call void @llvm.dbg.value(metadata i32 %or74, metadata !410, metadata !DIExpression()), !dbg !436

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X2_1, metadata !412, metadata !DIExpression()), !dbg !527

  //   %16 = load atomic i64, i64* @atom_1_X2_1 seq_cst, align 8, !dbg !280
  // LD: Guess
  old_cr = cr(0,16);
  cr(0,16) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(0,16)] == 0);
  ASSUME(cr(0,16) >= iw(0,16));
  ASSUME(cr(0,16) >= 0);
  ASSUME(cr(0,16) >= cdy[0]);
  ASSUME(cr(0,16) >= cisb[0]);
  ASSUME(cr(0,16) >= cdl[0]);
  ASSUME(cr(0,16) >= cl[0]);
  // Update
  creg_r27 = cr(0,16);
  crmax(0,16) = max(crmax(0,16),cr(0,16));
  caddr[0] = max(caddr[0],0);
  if(cr(0,16) < cw(0,16)) {
    r27 = buff(0,16);
  } else {
    if(pw(0,16) != co(16,cr(0,16))) {
      ASSUME(cr(0,16) >= old_cr);
    }
    pw(0,16) = co(16,cr(0,16));
    r27 = mem(16,cr(0,16));
  }
  ASSUME(creturn[0] >= cr(0,16));

  //   call void @llvm.dbg.value(metadata i64 %16, metadata !414, metadata !DIExpression()), !dbg !527

  //   %conv78 = trunc i64 %16 to i32, !dbg !281

  //   call void @llvm.dbg.value(metadata i32 %conv78, metadata !411, metadata !DIExpression()), !dbg !436

  //   call void @llvm.dbg.value(metadata i64* @atom_2_X3_1, metadata !416, metadata !DIExpression()), !dbg !530

  //   %17 = load atomic i64, i64* @atom_2_X3_1 seq_cst, align 8, !dbg !283
  // LD: Guess
  old_cr = cr(0,17);
  cr(0,17) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(0,17)] == 0);
  ASSUME(cr(0,17) >= iw(0,17));
  ASSUME(cr(0,17) >= 0);
  ASSUME(cr(0,17) >= cdy[0]);
  ASSUME(cr(0,17) >= cisb[0]);
  ASSUME(cr(0,17) >= cdl[0]);
  ASSUME(cr(0,17) >= cl[0]);
  // Update
  creg_r28 = cr(0,17);
  crmax(0,17) = max(crmax(0,17),cr(0,17));
  caddr[0] = max(caddr[0],0);
  if(cr(0,17) < cw(0,17)) {
    r28 = buff(0,17);
  } else {
    if(pw(0,17) != co(17,cr(0,17))) {
      ASSUME(cr(0,17) >= old_cr);
    }
    pw(0,17) = co(17,cr(0,17));
    r28 = mem(17,cr(0,17));
  }
  ASSUME(creturn[0] >= cr(0,17));

  //   call void @llvm.dbg.value(metadata i64 %17, metadata !418, metadata !DIExpression()), !dbg !530

  //   %conv82 = trunc i64 %17 to i32, !dbg !284

  //   call void @llvm.dbg.value(metadata i32 %conv82, metadata !415, metadata !DIExpression()), !dbg !436

  //   %or83 = or i32 %conv78, %conv82, !dbg !285
  creg_r29 = max(creg_r27,creg_r28);
  ASSUME(active[creg_r29] == 0);
  r29 = r27 | r28;

  //   call void @llvm.dbg.value(metadata i32 %or83, metadata !419, metadata !DIExpression()), !dbg !436

  //   call void @llvm.dbg.value(metadata i64* @atom_3_X2_1, metadata !421, metadata !DIExpression()), !dbg !534

  //   %18 = load atomic i64, i64* @atom_3_X2_1 seq_cst, align 8, !dbg !287
  // LD: Guess
  old_cr = cr(0,18);
  cr(0,18) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(0,18)] == 0);
  ASSUME(cr(0,18) >= iw(0,18));
  ASSUME(cr(0,18) >= 0);
  ASSUME(cr(0,18) >= cdy[0]);
  ASSUME(cr(0,18) >= cisb[0]);
  ASSUME(cr(0,18) >= cdl[0]);
  ASSUME(cr(0,18) >= cl[0]);
  // Update
  creg_r30 = cr(0,18);
  crmax(0,18) = max(crmax(0,18),cr(0,18));
  caddr[0] = max(caddr[0],0);
  if(cr(0,18) < cw(0,18)) {
    r30 = buff(0,18);
  } else {
    if(pw(0,18) != co(18,cr(0,18))) {
      ASSUME(cr(0,18) >= old_cr);
    }
    pw(0,18) = co(18,cr(0,18));
    r30 = mem(18,cr(0,18));
  }
  ASSUME(creturn[0] >= cr(0,18));

  //   call void @llvm.dbg.value(metadata i64 %18, metadata !423, metadata !DIExpression()), !dbg !534

  //   %conv87 = trunc i64 %18 to i32, !dbg !288

  //   call void @llvm.dbg.value(metadata i32 %conv87, metadata !420, metadata !DIExpression()), !dbg !436

  //   call void @llvm.dbg.value(metadata i64* @atom_2_X5_1, metadata !425, metadata !DIExpression()), !dbg !537

  //   %19 = load atomic i64, i64* @atom_2_X5_1 seq_cst, align 8, !dbg !290
  // LD: Guess
  old_cr = cr(0,19);
  cr(0,19) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(0,19)] == 0);
  ASSUME(cr(0,19) >= iw(0,19));
  ASSUME(cr(0,19) >= 0);
  ASSUME(cr(0,19) >= cdy[0]);
  ASSUME(cr(0,19) >= cisb[0]);
  ASSUME(cr(0,19) >= cdl[0]);
  ASSUME(cr(0,19) >= cl[0]);
  // Update
  creg_r31 = cr(0,19);
  crmax(0,19) = max(crmax(0,19),cr(0,19));
  caddr[0] = max(caddr[0],0);
  if(cr(0,19) < cw(0,19)) {
    r31 = buff(0,19);
  } else {
    if(pw(0,19) != co(19,cr(0,19))) {
      ASSUME(cr(0,19) >= old_cr);
    }
    pw(0,19) = co(19,cr(0,19));
    r31 = mem(19,cr(0,19));
  }
  ASSUME(creturn[0] >= cr(0,19));

  //   call void @llvm.dbg.value(metadata i64 %19, metadata !427, metadata !DIExpression()), !dbg !537

  //   %conv91 = trunc i64 %19 to i32, !dbg !291

  //   call void @llvm.dbg.value(metadata i32 %conv91, metadata !424, metadata !DIExpression()), !dbg !436

  //   %or92 = or i32 %conv87, %conv91, !dbg !292
  creg_r32 = max(creg_r30,creg_r31);
  ASSUME(active[creg_r32] == 0);
  r32 = r30 | r31;

  //   call void @llvm.dbg.value(metadata i32 %or92, metadata !428, metadata !DIExpression()), !dbg !436

  //   %and = and i32 %or83, %or92, !dbg !293
  creg_r33 = max(creg_r29,creg_r32);
  ASSUME(active[creg_r33] == 0);
  r33 = r29 & r32;

  //   call void @llvm.dbg.value(metadata i32 %and, metadata !429, metadata !DIExpression()), !dbg !436

  //   %and93 = and i32 %or74, %and, !dbg !294
  creg_r34 = max(creg_r26,creg_r33);
  ASSUME(active[creg_r34] == 0);
  r34 = r26 & r33;

  //   call void @llvm.dbg.value(metadata i32 %and93, metadata !430, metadata !DIExpression()), !dbg !436

  //   %and94 = and i32 %or, %and93, !dbg !295
  creg_r35 = max(creg_r23,creg_r34);
  ASSUME(active[creg_r35] == 0);
  r35 = r23 & r34;

  //   call void @llvm.dbg.value(metadata i32 %and94, metadata !431, metadata !DIExpression()), !dbg !436

  //   %and95 = and i32 %conv57, %and94, !dbg !296
  creg_r36 = max(creg_r20,creg_r35);
  ASSUME(active[creg_r36] == 0);
  r36 = r20 & r35;

  //   call void @llvm.dbg.value(metadata i32 %and95, metadata !432, metadata !DIExpression()), !dbg !436

  //   %and96 = and i32 %conv53, %and95, !dbg !297
  creg_r37 = max(creg_r19,creg_r36);
  ASSUME(active[creg_r37] == 0);
  r37 = r19 & r36;

  //   call void @llvm.dbg.value(metadata i32 %and96, metadata !433, metadata !DIExpression()), !dbg !436

  //   %and97 = and i32 %conv49, %and96, !dbg !298
  creg_r38 = max(creg_r18,creg_r37);
  ASSUME(active[creg_r38] == 0);
  r38 = r18 & r37;

  //   call void @llvm.dbg.value(metadata i32 %and97, metadata !434, metadata !DIExpression()), !dbg !436

  //   %and98 = and i32 %conv, %and97, !dbg !299
  creg_r39 = max(creg_r17,creg_r38);
  ASSUME(active[creg_r39] == 0);
  r39 = r17 & r38;

  //   call void @llvm.dbg.value(metadata i32 %and98, metadata !435, metadata !DIExpression()), !dbg !436

  //   %cmp = icmp eq i32 %and98, 1, !dbg !300

  //   br i1 %cmp, label %if.then, label %if.end, !dbg !302
  old_cctrl = cctrl[0];
  cctrl[0] = get_rng(0,NCONTEXT-1);
  ASSUME(cctrl[0] >= old_cctrl);
  ASSUME(cctrl[0] >= creg_r39);
  ASSUME(cctrl[0] >= 0);
  if((r39==1)) {
    goto T0BLOCK1;
  } else {
    goto T0BLOCK2;
  }

T0BLOCK1:
  //   call void @__assert_fail(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([111 x i8], [111 x i8]* @.str.1, i64 0, i64 0), i32 noundef 158, i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #8, !dbg !303

  //   unreachable, !dbg !303
  r40 = 1;

T0BLOCK2:
  //   %20 = bitcast i64* %thr3 to i8*, !dbg !306

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %20) #7, !dbg !306

  //   %21 = bitcast i64* %thr2 to i8*, !dbg !306

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %21) #7, !dbg !306

  //   %22 = bitcast i64* %thr1 to i8*, !dbg !306

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %22) #7, !dbg !306

  //   %23 = bitcast i64* %thr0 to i8*, !dbg !306

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %23) #7, !dbg !306

  //   ret i32 0, !dbg !307
  ret_thread_0 = 0;



  ASSERT(r40== 0);

}
