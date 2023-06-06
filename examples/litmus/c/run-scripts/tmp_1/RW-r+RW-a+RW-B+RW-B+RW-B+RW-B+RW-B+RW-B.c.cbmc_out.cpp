// 0:vars:8
// 8:atom_0_X0_1:1
// 9:atom_1_X0_1:1
// 10:atom_2_X0_1:1
// 23:thr7:1
// 18:thr2:1
// 19:thr3:1
// 11:atom_3_X0_1:1
// 12:atom_4_X0_1:1
// 13:atom_5_X0_1:1
// 14:atom_6_X0_1:1
// 15:atom_7_X0_1:1
// 16:thr0:1
// 17:thr1:1
// 20:thr4:1
// 21:thr5:1
// 22:thr6:1
#define ADDRSIZE 24
#define NPROC 9
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
  buff(5,0) = 0;
  pw(5,0) = 0;
  cr(5,0) = 0;
  iw(5,0) = 0;
  cw(5,0) = 0;
  cx(5,0) = 0;
  is(5,0) = 0;
  cs(5,0) = 0;
  crmax(5,0) = 0;
  buff(5,1) = 0;
  pw(5,1) = 0;
  cr(5,1) = 0;
  iw(5,1) = 0;
  cw(5,1) = 0;
  cx(5,1) = 0;
  is(5,1) = 0;
  cs(5,1) = 0;
  crmax(5,1) = 0;
  buff(5,2) = 0;
  pw(5,2) = 0;
  cr(5,2) = 0;
  iw(5,2) = 0;
  cw(5,2) = 0;
  cx(5,2) = 0;
  is(5,2) = 0;
  cs(5,2) = 0;
  crmax(5,2) = 0;
  buff(5,3) = 0;
  pw(5,3) = 0;
  cr(5,3) = 0;
  iw(5,3) = 0;
  cw(5,3) = 0;
  cx(5,3) = 0;
  is(5,3) = 0;
  cs(5,3) = 0;
  crmax(5,3) = 0;
  buff(5,4) = 0;
  pw(5,4) = 0;
  cr(5,4) = 0;
  iw(5,4) = 0;
  cw(5,4) = 0;
  cx(5,4) = 0;
  is(5,4) = 0;
  cs(5,4) = 0;
  crmax(5,4) = 0;
  buff(5,5) = 0;
  pw(5,5) = 0;
  cr(5,5) = 0;
  iw(5,5) = 0;
  cw(5,5) = 0;
  cx(5,5) = 0;
  is(5,5) = 0;
  cs(5,5) = 0;
  crmax(5,5) = 0;
  buff(5,6) = 0;
  pw(5,6) = 0;
  cr(5,6) = 0;
  iw(5,6) = 0;
  cw(5,6) = 0;
  cx(5,6) = 0;
  is(5,6) = 0;
  cs(5,6) = 0;
  crmax(5,6) = 0;
  buff(5,7) = 0;
  pw(5,7) = 0;
  cr(5,7) = 0;
  iw(5,7) = 0;
  cw(5,7) = 0;
  cx(5,7) = 0;
  is(5,7) = 0;
  cs(5,7) = 0;
  crmax(5,7) = 0;
  buff(5,8) = 0;
  pw(5,8) = 0;
  cr(5,8) = 0;
  iw(5,8) = 0;
  cw(5,8) = 0;
  cx(5,8) = 0;
  is(5,8) = 0;
  cs(5,8) = 0;
  crmax(5,8) = 0;
  buff(5,9) = 0;
  pw(5,9) = 0;
  cr(5,9) = 0;
  iw(5,9) = 0;
  cw(5,9) = 0;
  cx(5,9) = 0;
  is(5,9) = 0;
  cs(5,9) = 0;
  crmax(5,9) = 0;
  buff(5,10) = 0;
  pw(5,10) = 0;
  cr(5,10) = 0;
  iw(5,10) = 0;
  cw(5,10) = 0;
  cx(5,10) = 0;
  is(5,10) = 0;
  cs(5,10) = 0;
  crmax(5,10) = 0;
  buff(5,11) = 0;
  pw(5,11) = 0;
  cr(5,11) = 0;
  iw(5,11) = 0;
  cw(5,11) = 0;
  cx(5,11) = 0;
  is(5,11) = 0;
  cs(5,11) = 0;
  crmax(5,11) = 0;
  buff(5,12) = 0;
  pw(5,12) = 0;
  cr(5,12) = 0;
  iw(5,12) = 0;
  cw(5,12) = 0;
  cx(5,12) = 0;
  is(5,12) = 0;
  cs(5,12) = 0;
  crmax(5,12) = 0;
  buff(5,13) = 0;
  pw(5,13) = 0;
  cr(5,13) = 0;
  iw(5,13) = 0;
  cw(5,13) = 0;
  cx(5,13) = 0;
  is(5,13) = 0;
  cs(5,13) = 0;
  crmax(5,13) = 0;
  buff(5,14) = 0;
  pw(5,14) = 0;
  cr(5,14) = 0;
  iw(5,14) = 0;
  cw(5,14) = 0;
  cx(5,14) = 0;
  is(5,14) = 0;
  cs(5,14) = 0;
  crmax(5,14) = 0;
  buff(5,15) = 0;
  pw(5,15) = 0;
  cr(5,15) = 0;
  iw(5,15) = 0;
  cw(5,15) = 0;
  cx(5,15) = 0;
  is(5,15) = 0;
  cs(5,15) = 0;
  crmax(5,15) = 0;
  buff(5,16) = 0;
  pw(5,16) = 0;
  cr(5,16) = 0;
  iw(5,16) = 0;
  cw(5,16) = 0;
  cx(5,16) = 0;
  is(5,16) = 0;
  cs(5,16) = 0;
  crmax(5,16) = 0;
  buff(5,17) = 0;
  pw(5,17) = 0;
  cr(5,17) = 0;
  iw(5,17) = 0;
  cw(5,17) = 0;
  cx(5,17) = 0;
  is(5,17) = 0;
  cs(5,17) = 0;
  crmax(5,17) = 0;
  buff(5,18) = 0;
  pw(5,18) = 0;
  cr(5,18) = 0;
  iw(5,18) = 0;
  cw(5,18) = 0;
  cx(5,18) = 0;
  is(5,18) = 0;
  cs(5,18) = 0;
  crmax(5,18) = 0;
  buff(5,19) = 0;
  pw(5,19) = 0;
  cr(5,19) = 0;
  iw(5,19) = 0;
  cw(5,19) = 0;
  cx(5,19) = 0;
  is(5,19) = 0;
  cs(5,19) = 0;
  crmax(5,19) = 0;
  buff(5,20) = 0;
  pw(5,20) = 0;
  cr(5,20) = 0;
  iw(5,20) = 0;
  cw(5,20) = 0;
  cx(5,20) = 0;
  is(5,20) = 0;
  cs(5,20) = 0;
  crmax(5,20) = 0;
  buff(5,21) = 0;
  pw(5,21) = 0;
  cr(5,21) = 0;
  iw(5,21) = 0;
  cw(5,21) = 0;
  cx(5,21) = 0;
  is(5,21) = 0;
  cs(5,21) = 0;
  crmax(5,21) = 0;
  buff(5,22) = 0;
  pw(5,22) = 0;
  cr(5,22) = 0;
  iw(5,22) = 0;
  cw(5,22) = 0;
  cx(5,22) = 0;
  is(5,22) = 0;
  cs(5,22) = 0;
  crmax(5,22) = 0;
  buff(5,23) = 0;
  pw(5,23) = 0;
  cr(5,23) = 0;
  iw(5,23) = 0;
  cw(5,23) = 0;
  cx(5,23) = 0;
  is(5,23) = 0;
  cs(5,23) = 0;
  crmax(5,23) = 0;
  cl[5] = 0;
  cdy[5] = 0;
  cds[5] = 0;
  cdl[5] = 0;
  cisb[5] = 0;
  caddr[5] = 0;
  cctrl[5] = 0;
  cstart[5] = get_rng(0,NCONTEXT-1);
  creturn[5] = get_rng(0,NCONTEXT-1);
  buff(6,0) = 0;
  pw(6,0) = 0;
  cr(6,0) = 0;
  iw(6,0) = 0;
  cw(6,0) = 0;
  cx(6,0) = 0;
  is(6,0) = 0;
  cs(6,0) = 0;
  crmax(6,0) = 0;
  buff(6,1) = 0;
  pw(6,1) = 0;
  cr(6,1) = 0;
  iw(6,1) = 0;
  cw(6,1) = 0;
  cx(6,1) = 0;
  is(6,1) = 0;
  cs(6,1) = 0;
  crmax(6,1) = 0;
  buff(6,2) = 0;
  pw(6,2) = 0;
  cr(6,2) = 0;
  iw(6,2) = 0;
  cw(6,2) = 0;
  cx(6,2) = 0;
  is(6,2) = 0;
  cs(6,2) = 0;
  crmax(6,2) = 0;
  buff(6,3) = 0;
  pw(6,3) = 0;
  cr(6,3) = 0;
  iw(6,3) = 0;
  cw(6,3) = 0;
  cx(6,3) = 0;
  is(6,3) = 0;
  cs(6,3) = 0;
  crmax(6,3) = 0;
  buff(6,4) = 0;
  pw(6,4) = 0;
  cr(6,4) = 0;
  iw(6,4) = 0;
  cw(6,4) = 0;
  cx(6,4) = 0;
  is(6,4) = 0;
  cs(6,4) = 0;
  crmax(6,4) = 0;
  buff(6,5) = 0;
  pw(6,5) = 0;
  cr(6,5) = 0;
  iw(6,5) = 0;
  cw(6,5) = 0;
  cx(6,5) = 0;
  is(6,5) = 0;
  cs(6,5) = 0;
  crmax(6,5) = 0;
  buff(6,6) = 0;
  pw(6,6) = 0;
  cr(6,6) = 0;
  iw(6,6) = 0;
  cw(6,6) = 0;
  cx(6,6) = 0;
  is(6,6) = 0;
  cs(6,6) = 0;
  crmax(6,6) = 0;
  buff(6,7) = 0;
  pw(6,7) = 0;
  cr(6,7) = 0;
  iw(6,7) = 0;
  cw(6,7) = 0;
  cx(6,7) = 0;
  is(6,7) = 0;
  cs(6,7) = 0;
  crmax(6,7) = 0;
  buff(6,8) = 0;
  pw(6,8) = 0;
  cr(6,8) = 0;
  iw(6,8) = 0;
  cw(6,8) = 0;
  cx(6,8) = 0;
  is(6,8) = 0;
  cs(6,8) = 0;
  crmax(6,8) = 0;
  buff(6,9) = 0;
  pw(6,9) = 0;
  cr(6,9) = 0;
  iw(6,9) = 0;
  cw(6,9) = 0;
  cx(6,9) = 0;
  is(6,9) = 0;
  cs(6,9) = 0;
  crmax(6,9) = 0;
  buff(6,10) = 0;
  pw(6,10) = 0;
  cr(6,10) = 0;
  iw(6,10) = 0;
  cw(6,10) = 0;
  cx(6,10) = 0;
  is(6,10) = 0;
  cs(6,10) = 0;
  crmax(6,10) = 0;
  buff(6,11) = 0;
  pw(6,11) = 0;
  cr(6,11) = 0;
  iw(6,11) = 0;
  cw(6,11) = 0;
  cx(6,11) = 0;
  is(6,11) = 0;
  cs(6,11) = 0;
  crmax(6,11) = 0;
  buff(6,12) = 0;
  pw(6,12) = 0;
  cr(6,12) = 0;
  iw(6,12) = 0;
  cw(6,12) = 0;
  cx(6,12) = 0;
  is(6,12) = 0;
  cs(6,12) = 0;
  crmax(6,12) = 0;
  buff(6,13) = 0;
  pw(6,13) = 0;
  cr(6,13) = 0;
  iw(6,13) = 0;
  cw(6,13) = 0;
  cx(6,13) = 0;
  is(6,13) = 0;
  cs(6,13) = 0;
  crmax(6,13) = 0;
  buff(6,14) = 0;
  pw(6,14) = 0;
  cr(6,14) = 0;
  iw(6,14) = 0;
  cw(6,14) = 0;
  cx(6,14) = 0;
  is(6,14) = 0;
  cs(6,14) = 0;
  crmax(6,14) = 0;
  buff(6,15) = 0;
  pw(6,15) = 0;
  cr(6,15) = 0;
  iw(6,15) = 0;
  cw(6,15) = 0;
  cx(6,15) = 0;
  is(6,15) = 0;
  cs(6,15) = 0;
  crmax(6,15) = 0;
  buff(6,16) = 0;
  pw(6,16) = 0;
  cr(6,16) = 0;
  iw(6,16) = 0;
  cw(6,16) = 0;
  cx(6,16) = 0;
  is(6,16) = 0;
  cs(6,16) = 0;
  crmax(6,16) = 0;
  buff(6,17) = 0;
  pw(6,17) = 0;
  cr(6,17) = 0;
  iw(6,17) = 0;
  cw(6,17) = 0;
  cx(6,17) = 0;
  is(6,17) = 0;
  cs(6,17) = 0;
  crmax(6,17) = 0;
  buff(6,18) = 0;
  pw(6,18) = 0;
  cr(6,18) = 0;
  iw(6,18) = 0;
  cw(6,18) = 0;
  cx(6,18) = 0;
  is(6,18) = 0;
  cs(6,18) = 0;
  crmax(6,18) = 0;
  buff(6,19) = 0;
  pw(6,19) = 0;
  cr(6,19) = 0;
  iw(6,19) = 0;
  cw(6,19) = 0;
  cx(6,19) = 0;
  is(6,19) = 0;
  cs(6,19) = 0;
  crmax(6,19) = 0;
  buff(6,20) = 0;
  pw(6,20) = 0;
  cr(6,20) = 0;
  iw(6,20) = 0;
  cw(6,20) = 0;
  cx(6,20) = 0;
  is(6,20) = 0;
  cs(6,20) = 0;
  crmax(6,20) = 0;
  buff(6,21) = 0;
  pw(6,21) = 0;
  cr(6,21) = 0;
  iw(6,21) = 0;
  cw(6,21) = 0;
  cx(6,21) = 0;
  is(6,21) = 0;
  cs(6,21) = 0;
  crmax(6,21) = 0;
  buff(6,22) = 0;
  pw(6,22) = 0;
  cr(6,22) = 0;
  iw(6,22) = 0;
  cw(6,22) = 0;
  cx(6,22) = 0;
  is(6,22) = 0;
  cs(6,22) = 0;
  crmax(6,22) = 0;
  buff(6,23) = 0;
  pw(6,23) = 0;
  cr(6,23) = 0;
  iw(6,23) = 0;
  cw(6,23) = 0;
  cx(6,23) = 0;
  is(6,23) = 0;
  cs(6,23) = 0;
  crmax(6,23) = 0;
  cl[6] = 0;
  cdy[6] = 0;
  cds[6] = 0;
  cdl[6] = 0;
  cisb[6] = 0;
  caddr[6] = 0;
  cctrl[6] = 0;
  cstart[6] = get_rng(0,NCONTEXT-1);
  creturn[6] = get_rng(0,NCONTEXT-1);
  buff(7,0) = 0;
  pw(7,0) = 0;
  cr(7,0) = 0;
  iw(7,0) = 0;
  cw(7,0) = 0;
  cx(7,0) = 0;
  is(7,0) = 0;
  cs(7,0) = 0;
  crmax(7,0) = 0;
  buff(7,1) = 0;
  pw(7,1) = 0;
  cr(7,1) = 0;
  iw(7,1) = 0;
  cw(7,1) = 0;
  cx(7,1) = 0;
  is(7,1) = 0;
  cs(7,1) = 0;
  crmax(7,1) = 0;
  buff(7,2) = 0;
  pw(7,2) = 0;
  cr(7,2) = 0;
  iw(7,2) = 0;
  cw(7,2) = 0;
  cx(7,2) = 0;
  is(7,2) = 0;
  cs(7,2) = 0;
  crmax(7,2) = 0;
  buff(7,3) = 0;
  pw(7,3) = 0;
  cr(7,3) = 0;
  iw(7,3) = 0;
  cw(7,3) = 0;
  cx(7,3) = 0;
  is(7,3) = 0;
  cs(7,3) = 0;
  crmax(7,3) = 0;
  buff(7,4) = 0;
  pw(7,4) = 0;
  cr(7,4) = 0;
  iw(7,4) = 0;
  cw(7,4) = 0;
  cx(7,4) = 0;
  is(7,4) = 0;
  cs(7,4) = 0;
  crmax(7,4) = 0;
  buff(7,5) = 0;
  pw(7,5) = 0;
  cr(7,5) = 0;
  iw(7,5) = 0;
  cw(7,5) = 0;
  cx(7,5) = 0;
  is(7,5) = 0;
  cs(7,5) = 0;
  crmax(7,5) = 0;
  buff(7,6) = 0;
  pw(7,6) = 0;
  cr(7,6) = 0;
  iw(7,6) = 0;
  cw(7,6) = 0;
  cx(7,6) = 0;
  is(7,6) = 0;
  cs(7,6) = 0;
  crmax(7,6) = 0;
  buff(7,7) = 0;
  pw(7,7) = 0;
  cr(7,7) = 0;
  iw(7,7) = 0;
  cw(7,7) = 0;
  cx(7,7) = 0;
  is(7,7) = 0;
  cs(7,7) = 0;
  crmax(7,7) = 0;
  buff(7,8) = 0;
  pw(7,8) = 0;
  cr(7,8) = 0;
  iw(7,8) = 0;
  cw(7,8) = 0;
  cx(7,8) = 0;
  is(7,8) = 0;
  cs(7,8) = 0;
  crmax(7,8) = 0;
  buff(7,9) = 0;
  pw(7,9) = 0;
  cr(7,9) = 0;
  iw(7,9) = 0;
  cw(7,9) = 0;
  cx(7,9) = 0;
  is(7,9) = 0;
  cs(7,9) = 0;
  crmax(7,9) = 0;
  buff(7,10) = 0;
  pw(7,10) = 0;
  cr(7,10) = 0;
  iw(7,10) = 0;
  cw(7,10) = 0;
  cx(7,10) = 0;
  is(7,10) = 0;
  cs(7,10) = 0;
  crmax(7,10) = 0;
  buff(7,11) = 0;
  pw(7,11) = 0;
  cr(7,11) = 0;
  iw(7,11) = 0;
  cw(7,11) = 0;
  cx(7,11) = 0;
  is(7,11) = 0;
  cs(7,11) = 0;
  crmax(7,11) = 0;
  buff(7,12) = 0;
  pw(7,12) = 0;
  cr(7,12) = 0;
  iw(7,12) = 0;
  cw(7,12) = 0;
  cx(7,12) = 0;
  is(7,12) = 0;
  cs(7,12) = 0;
  crmax(7,12) = 0;
  buff(7,13) = 0;
  pw(7,13) = 0;
  cr(7,13) = 0;
  iw(7,13) = 0;
  cw(7,13) = 0;
  cx(7,13) = 0;
  is(7,13) = 0;
  cs(7,13) = 0;
  crmax(7,13) = 0;
  buff(7,14) = 0;
  pw(7,14) = 0;
  cr(7,14) = 0;
  iw(7,14) = 0;
  cw(7,14) = 0;
  cx(7,14) = 0;
  is(7,14) = 0;
  cs(7,14) = 0;
  crmax(7,14) = 0;
  buff(7,15) = 0;
  pw(7,15) = 0;
  cr(7,15) = 0;
  iw(7,15) = 0;
  cw(7,15) = 0;
  cx(7,15) = 0;
  is(7,15) = 0;
  cs(7,15) = 0;
  crmax(7,15) = 0;
  buff(7,16) = 0;
  pw(7,16) = 0;
  cr(7,16) = 0;
  iw(7,16) = 0;
  cw(7,16) = 0;
  cx(7,16) = 0;
  is(7,16) = 0;
  cs(7,16) = 0;
  crmax(7,16) = 0;
  buff(7,17) = 0;
  pw(7,17) = 0;
  cr(7,17) = 0;
  iw(7,17) = 0;
  cw(7,17) = 0;
  cx(7,17) = 0;
  is(7,17) = 0;
  cs(7,17) = 0;
  crmax(7,17) = 0;
  buff(7,18) = 0;
  pw(7,18) = 0;
  cr(7,18) = 0;
  iw(7,18) = 0;
  cw(7,18) = 0;
  cx(7,18) = 0;
  is(7,18) = 0;
  cs(7,18) = 0;
  crmax(7,18) = 0;
  buff(7,19) = 0;
  pw(7,19) = 0;
  cr(7,19) = 0;
  iw(7,19) = 0;
  cw(7,19) = 0;
  cx(7,19) = 0;
  is(7,19) = 0;
  cs(7,19) = 0;
  crmax(7,19) = 0;
  buff(7,20) = 0;
  pw(7,20) = 0;
  cr(7,20) = 0;
  iw(7,20) = 0;
  cw(7,20) = 0;
  cx(7,20) = 0;
  is(7,20) = 0;
  cs(7,20) = 0;
  crmax(7,20) = 0;
  buff(7,21) = 0;
  pw(7,21) = 0;
  cr(7,21) = 0;
  iw(7,21) = 0;
  cw(7,21) = 0;
  cx(7,21) = 0;
  is(7,21) = 0;
  cs(7,21) = 0;
  crmax(7,21) = 0;
  buff(7,22) = 0;
  pw(7,22) = 0;
  cr(7,22) = 0;
  iw(7,22) = 0;
  cw(7,22) = 0;
  cx(7,22) = 0;
  is(7,22) = 0;
  cs(7,22) = 0;
  crmax(7,22) = 0;
  buff(7,23) = 0;
  pw(7,23) = 0;
  cr(7,23) = 0;
  iw(7,23) = 0;
  cw(7,23) = 0;
  cx(7,23) = 0;
  is(7,23) = 0;
  cs(7,23) = 0;
  crmax(7,23) = 0;
  cl[7] = 0;
  cdy[7] = 0;
  cds[7] = 0;
  cdl[7] = 0;
  cisb[7] = 0;
  caddr[7] = 0;
  cctrl[7] = 0;
  cstart[7] = get_rng(0,NCONTEXT-1);
  creturn[7] = get_rng(0,NCONTEXT-1);
  buff(8,0) = 0;
  pw(8,0) = 0;
  cr(8,0) = 0;
  iw(8,0) = 0;
  cw(8,0) = 0;
  cx(8,0) = 0;
  is(8,0) = 0;
  cs(8,0) = 0;
  crmax(8,0) = 0;
  buff(8,1) = 0;
  pw(8,1) = 0;
  cr(8,1) = 0;
  iw(8,1) = 0;
  cw(8,1) = 0;
  cx(8,1) = 0;
  is(8,1) = 0;
  cs(8,1) = 0;
  crmax(8,1) = 0;
  buff(8,2) = 0;
  pw(8,2) = 0;
  cr(8,2) = 0;
  iw(8,2) = 0;
  cw(8,2) = 0;
  cx(8,2) = 0;
  is(8,2) = 0;
  cs(8,2) = 0;
  crmax(8,2) = 0;
  buff(8,3) = 0;
  pw(8,3) = 0;
  cr(8,3) = 0;
  iw(8,3) = 0;
  cw(8,3) = 0;
  cx(8,3) = 0;
  is(8,3) = 0;
  cs(8,3) = 0;
  crmax(8,3) = 0;
  buff(8,4) = 0;
  pw(8,4) = 0;
  cr(8,4) = 0;
  iw(8,4) = 0;
  cw(8,4) = 0;
  cx(8,4) = 0;
  is(8,4) = 0;
  cs(8,4) = 0;
  crmax(8,4) = 0;
  buff(8,5) = 0;
  pw(8,5) = 0;
  cr(8,5) = 0;
  iw(8,5) = 0;
  cw(8,5) = 0;
  cx(8,5) = 0;
  is(8,5) = 0;
  cs(8,5) = 0;
  crmax(8,5) = 0;
  buff(8,6) = 0;
  pw(8,6) = 0;
  cr(8,6) = 0;
  iw(8,6) = 0;
  cw(8,6) = 0;
  cx(8,6) = 0;
  is(8,6) = 0;
  cs(8,6) = 0;
  crmax(8,6) = 0;
  buff(8,7) = 0;
  pw(8,7) = 0;
  cr(8,7) = 0;
  iw(8,7) = 0;
  cw(8,7) = 0;
  cx(8,7) = 0;
  is(8,7) = 0;
  cs(8,7) = 0;
  crmax(8,7) = 0;
  buff(8,8) = 0;
  pw(8,8) = 0;
  cr(8,8) = 0;
  iw(8,8) = 0;
  cw(8,8) = 0;
  cx(8,8) = 0;
  is(8,8) = 0;
  cs(8,8) = 0;
  crmax(8,8) = 0;
  buff(8,9) = 0;
  pw(8,9) = 0;
  cr(8,9) = 0;
  iw(8,9) = 0;
  cw(8,9) = 0;
  cx(8,9) = 0;
  is(8,9) = 0;
  cs(8,9) = 0;
  crmax(8,9) = 0;
  buff(8,10) = 0;
  pw(8,10) = 0;
  cr(8,10) = 0;
  iw(8,10) = 0;
  cw(8,10) = 0;
  cx(8,10) = 0;
  is(8,10) = 0;
  cs(8,10) = 0;
  crmax(8,10) = 0;
  buff(8,11) = 0;
  pw(8,11) = 0;
  cr(8,11) = 0;
  iw(8,11) = 0;
  cw(8,11) = 0;
  cx(8,11) = 0;
  is(8,11) = 0;
  cs(8,11) = 0;
  crmax(8,11) = 0;
  buff(8,12) = 0;
  pw(8,12) = 0;
  cr(8,12) = 0;
  iw(8,12) = 0;
  cw(8,12) = 0;
  cx(8,12) = 0;
  is(8,12) = 0;
  cs(8,12) = 0;
  crmax(8,12) = 0;
  buff(8,13) = 0;
  pw(8,13) = 0;
  cr(8,13) = 0;
  iw(8,13) = 0;
  cw(8,13) = 0;
  cx(8,13) = 0;
  is(8,13) = 0;
  cs(8,13) = 0;
  crmax(8,13) = 0;
  buff(8,14) = 0;
  pw(8,14) = 0;
  cr(8,14) = 0;
  iw(8,14) = 0;
  cw(8,14) = 0;
  cx(8,14) = 0;
  is(8,14) = 0;
  cs(8,14) = 0;
  crmax(8,14) = 0;
  buff(8,15) = 0;
  pw(8,15) = 0;
  cr(8,15) = 0;
  iw(8,15) = 0;
  cw(8,15) = 0;
  cx(8,15) = 0;
  is(8,15) = 0;
  cs(8,15) = 0;
  crmax(8,15) = 0;
  buff(8,16) = 0;
  pw(8,16) = 0;
  cr(8,16) = 0;
  iw(8,16) = 0;
  cw(8,16) = 0;
  cx(8,16) = 0;
  is(8,16) = 0;
  cs(8,16) = 0;
  crmax(8,16) = 0;
  buff(8,17) = 0;
  pw(8,17) = 0;
  cr(8,17) = 0;
  iw(8,17) = 0;
  cw(8,17) = 0;
  cx(8,17) = 0;
  is(8,17) = 0;
  cs(8,17) = 0;
  crmax(8,17) = 0;
  buff(8,18) = 0;
  pw(8,18) = 0;
  cr(8,18) = 0;
  iw(8,18) = 0;
  cw(8,18) = 0;
  cx(8,18) = 0;
  is(8,18) = 0;
  cs(8,18) = 0;
  crmax(8,18) = 0;
  buff(8,19) = 0;
  pw(8,19) = 0;
  cr(8,19) = 0;
  iw(8,19) = 0;
  cw(8,19) = 0;
  cx(8,19) = 0;
  is(8,19) = 0;
  cs(8,19) = 0;
  crmax(8,19) = 0;
  buff(8,20) = 0;
  pw(8,20) = 0;
  cr(8,20) = 0;
  iw(8,20) = 0;
  cw(8,20) = 0;
  cx(8,20) = 0;
  is(8,20) = 0;
  cs(8,20) = 0;
  crmax(8,20) = 0;
  buff(8,21) = 0;
  pw(8,21) = 0;
  cr(8,21) = 0;
  iw(8,21) = 0;
  cw(8,21) = 0;
  cx(8,21) = 0;
  is(8,21) = 0;
  cs(8,21) = 0;
  crmax(8,21) = 0;
  buff(8,22) = 0;
  pw(8,22) = 0;
  cr(8,22) = 0;
  iw(8,22) = 0;
  cw(8,22) = 0;
  cx(8,22) = 0;
  is(8,22) = 0;
  cs(8,22) = 0;
  crmax(8,22) = 0;
  buff(8,23) = 0;
  pw(8,23) = 0;
  cr(8,23) = 0;
  iw(8,23) = 0;
  cw(8,23) = 0;
  cx(8,23) = 0;
  is(8,23) = 0;
  cs(8,23) = 0;
  crmax(8,23) = 0;
  cl[8] = 0;
  cdy[8] = 0;
  cds[8] = 0;
  cdl[8] = 0;
  cisb[8] = 0;
  caddr[8] = 0;
  cctrl[8] = 0;
  cstart[8] = get_rng(0,NCONTEXT-1);
  creturn[8] = get_rng(0,NCONTEXT-1);
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
  mem(9+0,0) = 0;
  mem(10+0,0) = 0;
  mem(23+0,0) = 0;
  mem(18+0,0) = 0;
  mem(19+0,0) = 0;
  mem(11+0,0) = 0;
  mem(12+0,0) = 0;
  mem(13+0,0) = 0;
  mem(14+0,0) = 0;
  mem(15+0,0) = 0;
  mem(16+0,0) = 0;
  mem(17+0,0) = 0;
  mem(20+0,0) = 0;
  mem(21+0,0) = 0;
  mem(22+0,0) = 0;
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
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !47, metadata !DIExpression()), !dbg !62

  //   br label %label_1, !dbg !63
  goto T1BLOCK1;

T1BLOCK1:
  //   call void @llvm.dbg.label(metadata !61), !dbg !64

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 1), metadata !50, metadata !DIExpression()), !dbg !65

  //   %0 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !66
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
  creg_r0 = cr(1,0+1*1);
  crmax(1,0+1*1) = max(crmax(1,0+1*1),cr(1,0+1*1));
  caddr[1] = max(caddr[1],0);
  if(cr(1,0+1*1) < cw(1,0+1*1)) {
    r0 = buff(1,0+1*1);
  } else {
    if(pw(1,0+1*1) != co(0+1*1,cr(1,0+1*1))) {
      ASSUME(cr(1,0+1*1) >= old_cr);
    }
    pw(1,0+1*1) = co(0+1*1,cr(1,0+1*1));
    r0 = mem(0+1*1,cr(1,0+1*1));
  }
  ASSUME(creturn[1] >= cr(1,0+1*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !53, metadata !DIExpression()), !dbg !65

  //   %conv = trunc i64 %0 to i32, !dbg !67

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !48, metadata !DIExpression()), !dbg !62

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 0), metadata !54, metadata !DIExpression()), !dbg !68

  //   call void @llvm.dbg.value(metadata i64 1, metadata !56, metadata !DIExpression()), !dbg !68

  //   store atomic i64 1, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 0) release, align 8, !dbg !69
  // ST: Guess
  //   : Release
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
  ASSUME(cw(1,0) >= cr(1,0+0));
  ASSUME(cw(1,0) >= cr(1,0+1));
  ASSUME(cw(1,0) >= cr(1,0+2));
  ASSUME(cw(1,0) >= cr(1,0+3));
  ASSUME(cw(1,0) >= cr(1,0+4));
  ASSUME(cw(1,0) >= cr(1,0+5));
  ASSUME(cw(1,0) >= cr(1,0+6));
  ASSUME(cw(1,0) >= cr(1,0+7));
  ASSUME(cw(1,0) >= cr(1,8+0));
  ASSUME(cw(1,0) >= cr(1,9+0));
  ASSUME(cw(1,0) >= cr(1,10+0));
  ASSUME(cw(1,0) >= cr(1,23+0));
  ASSUME(cw(1,0) >= cr(1,18+0));
  ASSUME(cw(1,0) >= cr(1,19+0));
  ASSUME(cw(1,0) >= cr(1,11+0));
  ASSUME(cw(1,0) >= cr(1,12+0));
  ASSUME(cw(1,0) >= cr(1,13+0));
  ASSUME(cw(1,0) >= cr(1,14+0));
  ASSUME(cw(1,0) >= cr(1,15+0));
  ASSUME(cw(1,0) >= cr(1,16+0));
  ASSUME(cw(1,0) >= cr(1,17+0));
  ASSUME(cw(1,0) >= cr(1,20+0));
  ASSUME(cw(1,0) >= cr(1,21+0));
  ASSUME(cw(1,0) >= cr(1,22+0));
  ASSUME(cw(1,0) >= cw(1,0+0));
  ASSUME(cw(1,0) >= cw(1,0+1));
  ASSUME(cw(1,0) >= cw(1,0+2));
  ASSUME(cw(1,0) >= cw(1,0+3));
  ASSUME(cw(1,0) >= cw(1,0+4));
  ASSUME(cw(1,0) >= cw(1,0+5));
  ASSUME(cw(1,0) >= cw(1,0+6));
  ASSUME(cw(1,0) >= cw(1,0+7));
  ASSUME(cw(1,0) >= cw(1,8+0));
  ASSUME(cw(1,0) >= cw(1,9+0));
  ASSUME(cw(1,0) >= cw(1,10+0));
  ASSUME(cw(1,0) >= cw(1,23+0));
  ASSUME(cw(1,0) >= cw(1,18+0));
  ASSUME(cw(1,0) >= cw(1,19+0));
  ASSUME(cw(1,0) >= cw(1,11+0));
  ASSUME(cw(1,0) >= cw(1,12+0));
  ASSUME(cw(1,0) >= cw(1,13+0));
  ASSUME(cw(1,0) >= cw(1,14+0));
  ASSUME(cw(1,0) >= cw(1,15+0));
  ASSUME(cw(1,0) >= cw(1,16+0));
  ASSUME(cw(1,0) >= cw(1,17+0));
  ASSUME(cw(1,0) >= cw(1,20+0));
  ASSUME(cw(1,0) >= cw(1,21+0));
  ASSUME(cw(1,0) >= cw(1,22+0));
  // Update
  caddr[1] = max(caddr[1],0);
  buff(1,0) = 1;
  mem(0,cw(1,0)) = 1;
  co(0,cw(1,0))+=1;
  delta(0,cw(1,0)) = -1;
  is(1,0) = iw(1,0);
  cs(1,0) = cw(1,0);
  ASSUME(creturn[1] >= cw(1,0));

  //   %cmp = icmp eq i32 %conv, 1, !dbg !70

  //   %conv1 = zext i1 %cmp to i32, !dbg !70

  //   call void @llvm.dbg.value(metadata i32 %conv1, metadata !57, metadata !DIExpression()), !dbg !62

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X0_1, metadata !58, metadata !DIExpression()), !dbg !71

  //   %1 = zext i32 %conv1 to i64

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !60, metadata !DIExpression()), !dbg !71

  //   store atomic i64 %1, i64* @atom_0_X0_1 seq_cst, align 8, !dbg !72
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

  //   ret i8* null, !dbg !73
  ret_thread_1 = (- 1);


  // Dumping thread 2
  int ret_thread_2 = 0;
  cdy[2] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[2] >= cstart[2]);
T2BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !76, metadata !DIExpression()), !dbg !89

  //   br label %label_2, !dbg !63
  goto T2BLOCK1;

T2BLOCK1:
  //   call void @llvm.dbg.label(metadata !88), !dbg !91

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 0), metadata !78, metadata !DIExpression()), !dbg !92

  //   %0 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 0) acquire, align 8, !dbg !66
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
  ASSUME(cr(2,0) >= cs(2,0+2));
  ASSUME(cr(2,0) >= cs(2,0+3));
  ASSUME(cr(2,0) >= cs(2,0+4));
  ASSUME(cr(2,0) >= cs(2,0+5));
  ASSUME(cr(2,0) >= cs(2,0+6));
  ASSUME(cr(2,0) >= cs(2,0+7));
  ASSUME(cr(2,0) >= cs(2,8+0));
  ASSUME(cr(2,0) >= cs(2,9+0));
  ASSUME(cr(2,0) >= cs(2,10+0));
  ASSUME(cr(2,0) >= cs(2,23+0));
  ASSUME(cr(2,0) >= cs(2,18+0));
  ASSUME(cr(2,0) >= cs(2,19+0));
  ASSUME(cr(2,0) >= cs(2,11+0));
  ASSUME(cr(2,0) >= cs(2,12+0));
  ASSUME(cr(2,0) >= cs(2,13+0));
  ASSUME(cr(2,0) >= cs(2,14+0));
  ASSUME(cr(2,0) >= cs(2,15+0));
  ASSUME(cr(2,0) >= cs(2,16+0));
  ASSUME(cr(2,0) >= cs(2,17+0));
  ASSUME(cr(2,0) >= cs(2,20+0));
  ASSUME(cr(2,0) >= cs(2,21+0));
  ASSUME(cr(2,0) >= cs(2,22+0));
  // Update
  creg_r1 = cr(2,0);
  crmax(2,0) = max(crmax(2,0),cr(2,0));
  caddr[2] = max(caddr[2],0);
  if(cr(2,0) < cw(2,0)) {
    r1 = buff(2,0);
  } else {
    if(pw(2,0) != co(0,cr(2,0))) {
      ASSUME(cr(2,0) >= old_cr);
    }
    pw(2,0) = co(0,cr(2,0));
    r1 = mem(0,cr(2,0));
  }
  cl[2] = max(cl[2],cr(2,0));
  ASSUME(creturn[2] >= cr(2,0));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !80, metadata !DIExpression()), !dbg !92

  //   %conv = trunc i64 %0 to i32, !dbg !67

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !77, metadata !DIExpression()), !dbg !89

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 2), metadata !81, metadata !DIExpression()), !dbg !95

  //   call void @llvm.dbg.value(metadata i64 1, metadata !83, metadata !DIExpression()), !dbg !95

  //   store atomic i64 1, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 2) monotonic, align 8, !dbg !69
  // ST: Guess
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
  // Update
  caddr[2] = max(caddr[2],0);
  buff(2,0+2*1) = 1;
  mem(0+2*1,cw(2,0+2*1)) = 1;
  co(0+2*1,cw(2,0+2*1))+=1;
  delta(0+2*1,cw(2,0+2*1)) = -1;
  ASSUME(creturn[2] >= cw(2,0+2*1));

  //   %cmp = icmp eq i32 %conv, 1, !dbg !70

  //   %conv1 = zext i1 %cmp to i32, !dbg !70

  //   call void @llvm.dbg.value(metadata i32 %conv1, metadata !84, metadata !DIExpression()), !dbg !89

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X0_1, metadata !85, metadata !DIExpression()), !dbg !98

  //   %1 = zext i32 %conv1 to i64

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !87, metadata !DIExpression()), !dbg !98

  //   store atomic i64 %1, i64* @atom_1_X0_1 seq_cst, align 8, !dbg !72
  // ST: Guess
  iw(2,9) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW 
  old_cw = cw(2,9);
  cw(2,9) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(2,9)] == 2);
  ASSUME(active[cw(2,9)] == 2);
  ASSUME(sforbid(9,cw(2,9))== 0);
  ASSUME(iw(2,9) >= max(creg_r1,0));
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
  buff(2,9) = (r1==1);
  mem(9,cw(2,9)) = (r1==1);
  co(9,cw(2,9))+=1;
  delta(9,cw(2,9)) = -1;
  ASSUME(creturn[2] >= cw(2,9));

  //   ret i8* null, !dbg !73
  ret_thread_2 = (- 1);


  // Dumping thread 3
  int ret_thread_3 = 0;
  cdy[3] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[3] >= cstart[3]);
T3BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !103, metadata !DIExpression()), !dbg !116

  //   br label %label_3, !dbg !63
  goto T3BLOCK1;

T3BLOCK1:
  //   call void @llvm.dbg.label(metadata !115), !dbg !118

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 2), metadata !105, metadata !DIExpression()), !dbg !119

  //   %0 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 2) monotonic, align 8, !dbg !66
  // LD: Guess
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
  // Update
  creg_r2 = cr(3,0+2*1);
  crmax(3,0+2*1) = max(crmax(3,0+2*1),cr(3,0+2*1));
  caddr[3] = max(caddr[3],0);
  if(cr(3,0+2*1) < cw(3,0+2*1)) {
    r2 = buff(3,0+2*1);
  } else {
    if(pw(3,0+2*1) != co(0+2*1,cr(3,0+2*1))) {
      ASSUME(cr(3,0+2*1) >= old_cr);
    }
    pw(3,0+2*1) = co(0+2*1,cr(3,0+2*1));
    r2 = mem(0+2*1,cr(3,0+2*1));
  }
  ASSUME(creturn[3] >= cr(3,0+2*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !107, metadata !DIExpression()), !dbg !119

  //   %conv = trunc i64 %0 to i32, !dbg !67

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !104, metadata !DIExpression()), !dbg !116

  //   call void (...) @dmbsy(), !dbg !68
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
  ASSUME(cdy[3] >= cw(3,9+0));
  ASSUME(cdy[3] >= cw(3,10+0));
  ASSUME(cdy[3] >= cw(3,23+0));
  ASSUME(cdy[3] >= cw(3,18+0));
  ASSUME(cdy[3] >= cw(3,19+0));
  ASSUME(cdy[3] >= cw(3,11+0));
  ASSUME(cdy[3] >= cw(3,12+0));
  ASSUME(cdy[3] >= cw(3,13+0));
  ASSUME(cdy[3] >= cw(3,14+0));
  ASSUME(cdy[3] >= cw(3,15+0));
  ASSUME(cdy[3] >= cw(3,16+0));
  ASSUME(cdy[3] >= cw(3,17+0));
  ASSUME(cdy[3] >= cw(3,20+0));
  ASSUME(cdy[3] >= cw(3,21+0));
  ASSUME(cdy[3] >= cw(3,22+0));
  ASSUME(cdy[3] >= cr(3,0+0));
  ASSUME(cdy[3] >= cr(3,0+1));
  ASSUME(cdy[3] >= cr(3,0+2));
  ASSUME(cdy[3] >= cr(3,0+3));
  ASSUME(cdy[3] >= cr(3,0+4));
  ASSUME(cdy[3] >= cr(3,0+5));
  ASSUME(cdy[3] >= cr(3,0+6));
  ASSUME(cdy[3] >= cr(3,0+7));
  ASSUME(cdy[3] >= cr(3,8+0));
  ASSUME(cdy[3] >= cr(3,9+0));
  ASSUME(cdy[3] >= cr(3,10+0));
  ASSUME(cdy[3] >= cr(3,23+0));
  ASSUME(cdy[3] >= cr(3,18+0));
  ASSUME(cdy[3] >= cr(3,19+0));
  ASSUME(cdy[3] >= cr(3,11+0));
  ASSUME(cdy[3] >= cr(3,12+0));
  ASSUME(cdy[3] >= cr(3,13+0));
  ASSUME(cdy[3] >= cr(3,14+0));
  ASSUME(cdy[3] >= cr(3,15+0));
  ASSUME(cdy[3] >= cr(3,16+0));
  ASSUME(cdy[3] >= cr(3,17+0));
  ASSUME(cdy[3] >= cr(3,20+0));
  ASSUME(cdy[3] >= cr(3,21+0));
  ASSUME(cdy[3] >= cr(3,22+0));
  ASSUME(creturn[3] >= cdy[3]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 3), metadata !108, metadata !DIExpression()), !dbg !123

  //   call void @llvm.dbg.value(metadata i64 1, metadata !110, metadata !DIExpression()), !dbg !123

  //   store atomic i64 1, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !70
  // ST: Guess
  iw(3,0+3*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STIW 
  old_cw = cw(3,0+3*1);
  cw(3,0+3*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(3,0+3*1)] == 3);
  ASSUME(active[cw(3,0+3*1)] == 3);
  ASSUME(sforbid(0+3*1,cw(3,0+3*1))== 0);
  ASSUME(iw(3,0+3*1) >= 0);
  ASSUME(iw(3,0+3*1) >= 0);
  ASSUME(cw(3,0+3*1) >= iw(3,0+3*1));
  ASSUME(cw(3,0+3*1) >= old_cw);
  ASSUME(cw(3,0+3*1) >= cr(3,0+3*1));
  ASSUME(cw(3,0+3*1) >= cl[3]);
  ASSUME(cw(3,0+3*1) >= cisb[3]);
  ASSUME(cw(3,0+3*1) >= cdy[3]);
  ASSUME(cw(3,0+3*1) >= cdl[3]);
  ASSUME(cw(3,0+3*1) >= cds[3]);
  ASSUME(cw(3,0+3*1) >= cctrl[3]);
  ASSUME(cw(3,0+3*1) >= caddr[3]);
  // Update
  caddr[3] = max(caddr[3],0);
  buff(3,0+3*1) = 1;
  mem(0+3*1,cw(3,0+3*1)) = 1;
  co(0+3*1,cw(3,0+3*1))+=1;
  delta(0+3*1,cw(3,0+3*1)) = -1;
  ASSUME(creturn[3] >= cw(3,0+3*1));

  //   %cmp = icmp eq i32 %conv, 1, !dbg !71

  //   %conv1 = zext i1 %cmp to i32, !dbg !71

  //   call void @llvm.dbg.value(metadata i32 %conv1, metadata !111, metadata !DIExpression()), !dbg !116

  //   call void @llvm.dbg.value(metadata i64* @atom_2_X0_1, metadata !112, metadata !DIExpression()), !dbg !126

  //   %1 = zext i32 %conv1 to i64

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !114, metadata !DIExpression()), !dbg !126

  //   store atomic i64 %1, i64* @atom_2_X0_1 seq_cst, align 8, !dbg !73
  // ST: Guess
  iw(3,10) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STIW 
  old_cw = cw(3,10);
  cw(3,10) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(3,10)] == 3);
  ASSUME(active[cw(3,10)] == 3);
  ASSUME(sforbid(10,cw(3,10))== 0);
  ASSUME(iw(3,10) >= max(creg_r2,0));
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
  buff(3,10) = (r2==1);
  mem(10,cw(3,10)) = (r2==1);
  co(10,cw(3,10))+=1;
  delta(10,cw(3,10)) = -1;
  ASSUME(creturn[3] >= cw(3,10));

  //   ret i8* null, !dbg !74
  ret_thread_3 = (- 1);


  // Dumping thread 4
  int ret_thread_4 = 0;
  cdy[4] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[4] >= cstart[4]);
T4BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !131, metadata !DIExpression()), !dbg !144

  //   br label %label_4, !dbg !63
  goto T4BLOCK1;

T4BLOCK1:
  //   call void @llvm.dbg.label(metadata !143), !dbg !146

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 3), metadata !133, metadata !DIExpression()), !dbg !147

  //   %0 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !66
  // LD: Guess
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
  // Update
  creg_r3 = cr(4,0+3*1);
  crmax(4,0+3*1) = max(crmax(4,0+3*1),cr(4,0+3*1));
  caddr[4] = max(caddr[4],0);
  if(cr(4,0+3*1) < cw(4,0+3*1)) {
    r3 = buff(4,0+3*1);
  } else {
    if(pw(4,0+3*1) != co(0+3*1,cr(4,0+3*1))) {
      ASSUME(cr(4,0+3*1) >= old_cr);
    }
    pw(4,0+3*1) = co(0+3*1,cr(4,0+3*1));
    r3 = mem(0+3*1,cr(4,0+3*1));
  }
  ASSUME(creturn[4] >= cr(4,0+3*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !135, metadata !DIExpression()), !dbg !147

  //   %conv = trunc i64 %0 to i32, !dbg !67

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !132, metadata !DIExpression()), !dbg !144

  //   call void (...) @dmbsy(), !dbg !68
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
  ASSUME(cdy[4] >= cw(4,0+3));
  ASSUME(cdy[4] >= cw(4,0+4));
  ASSUME(cdy[4] >= cw(4,0+5));
  ASSUME(cdy[4] >= cw(4,0+6));
  ASSUME(cdy[4] >= cw(4,0+7));
  ASSUME(cdy[4] >= cw(4,8+0));
  ASSUME(cdy[4] >= cw(4,9+0));
  ASSUME(cdy[4] >= cw(4,10+0));
  ASSUME(cdy[4] >= cw(4,23+0));
  ASSUME(cdy[4] >= cw(4,18+0));
  ASSUME(cdy[4] >= cw(4,19+0));
  ASSUME(cdy[4] >= cw(4,11+0));
  ASSUME(cdy[4] >= cw(4,12+0));
  ASSUME(cdy[4] >= cw(4,13+0));
  ASSUME(cdy[4] >= cw(4,14+0));
  ASSUME(cdy[4] >= cw(4,15+0));
  ASSUME(cdy[4] >= cw(4,16+0));
  ASSUME(cdy[4] >= cw(4,17+0));
  ASSUME(cdy[4] >= cw(4,20+0));
  ASSUME(cdy[4] >= cw(4,21+0));
  ASSUME(cdy[4] >= cw(4,22+0));
  ASSUME(cdy[4] >= cr(4,0+0));
  ASSUME(cdy[4] >= cr(4,0+1));
  ASSUME(cdy[4] >= cr(4,0+2));
  ASSUME(cdy[4] >= cr(4,0+3));
  ASSUME(cdy[4] >= cr(4,0+4));
  ASSUME(cdy[4] >= cr(4,0+5));
  ASSUME(cdy[4] >= cr(4,0+6));
  ASSUME(cdy[4] >= cr(4,0+7));
  ASSUME(cdy[4] >= cr(4,8+0));
  ASSUME(cdy[4] >= cr(4,9+0));
  ASSUME(cdy[4] >= cr(4,10+0));
  ASSUME(cdy[4] >= cr(4,23+0));
  ASSUME(cdy[4] >= cr(4,18+0));
  ASSUME(cdy[4] >= cr(4,19+0));
  ASSUME(cdy[4] >= cr(4,11+0));
  ASSUME(cdy[4] >= cr(4,12+0));
  ASSUME(cdy[4] >= cr(4,13+0));
  ASSUME(cdy[4] >= cr(4,14+0));
  ASSUME(cdy[4] >= cr(4,15+0));
  ASSUME(cdy[4] >= cr(4,16+0));
  ASSUME(cdy[4] >= cr(4,17+0));
  ASSUME(cdy[4] >= cr(4,20+0));
  ASSUME(cdy[4] >= cr(4,21+0));
  ASSUME(cdy[4] >= cr(4,22+0));
  ASSUME(creturn[4] >= cdy[4]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 4), metadata !136, metadata !DIExpression()), !dbg !151

  //   call void @llvm.dbg.value(metadata i64 1, metadata !138, metadata !DIExpression()), !dbg !151

  //   store atomic i64 1, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 4) monotonic, align 8, !dbg !70
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

  //   %cmp = icmp eq i32 %conv, 1, !dbg !71

  //   %conv1 = zext i1 %cmp to i32, !dbg !71

  //   call void @llvm.dbg.value(metadata i32 %conv1, metadata !139, metadata !DIExpression()), !dbg !144

  //   call void @llvm.dbg.value(metadata i64* @atom_3_X0_1, metadata !140, metadata !DIExpression()), !dbg !154

  //   %1 = zext i32 %conv1 to i64

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !142, metadata !DIExpression()), !dbg !154

  //   store atomic i64 %1, i64* @atom_3_X0_1 seq_cst, align 8, !dbg !73
  // ST: Guess
  iw(4,11) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STIW 
  old_cw = cw(4,11);
  cw(4,11) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(4,11)] == 4);
  ASSUME(active[cw(4,11)] == 4);
  ASSUME(sforbid(11,cw(4,11))== 0);
  ASSUME(iw(4,11) >= max(creg_r3,0));
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
  buff(4,11) = (r3==1);
  mem(11,cw(4,11)) = (r3==1);
  co(11,cw(4,11))+=1;
  delta(11,cw(4,11)) = -1;
  ASSUME(creturn[4] >= cw(4,11));

  //   ret i8* null, !dbg !74
  ret_thread_4 = (- 1);


  // Dumping thread 5
  int ret_thread_5 = 0;
  cdy[5] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[5] >= cstart[5]);
T5BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !159, metadata !DIExpression()), !dbg !172

  //   br label %label_5, !dbg !63
  goto T5BLOCK1;

T5BLOCK1:
  //   call void @llvm.dbg.label(metadata !171), !dbg !174

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 4), metadata !161, metadata !DIExpression()), !dbg !175

  //   %0 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 4) monotonic, align 8, !dbg !66
  // LD: Guess
  old_cr = cr(5,0+4*1);
  cr(5,0+4*1) = get_rng(0,NCONTEXT-1);// 5 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(5,0+4*1)] == 5);
  ASSUME(cr(5,0+4*1) >= iw(5,0+4*1));
  ASSUME(cr(5,0+4*1) >= 0);
  ASSUME(cr(5,0+4*1) >= cdy[5]);
  ASSUME(cr(5,0+4*1) >= cisb[5]);
  ASSUME(cr(5,0+4*1) >= cdl[5]);
  ASSUME(cr(5,0+4*1) >= cl[5]);
  // Update
  creg_r4 = cr(5,0+4*1);
  crmax(5,0+4*1) = max(crmax(5,0+4*1),cr(5,0+4*1));
  caddr[5] = max(caddr[5],0);
  if(cr(5,0+4*1) < cw(5,0+4*1)) {
    r4 = buff(5,0+4*1);
  } else {
    if(pw(5,0+4*1) != co(0+4*1,cr(5,0+4*1))) {
      ASSUME(cr(5,0+4*1) >= old_cr);
    }
    pw(5,0+4*1) = co(0+4*1,cr(5,0+4*1));
    r4 = mem(0+4*1,cr(5,0+4*1));
  }
  ASSUME(creturn[5] >= cr(5,0+4*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !163, metadata !DIExpression()), !dbg !175

  //   %conv = trunc i64 %0 to i32, !dbg !67

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !160, metadata !DIExpression()), !dbg !172

  //   call void (...) @dmbsy(), !dbg !68
  // dumbsy: Guess
  old_cdy = cdy[5];
  cdy[5] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[5] >= old_cdy);
  ASSUME(cdy[5] >= cisb[5]);
  ASSUME(cdy[5] >= cdl[5]);
  ASSUME(cdy[5] >= cds[5]);
  ASSUME(cdy[5] >= cctrl[5]);
  ASSUME(cdy[5] >= cw(5,0+0));
  ASSUME(cdy[5] >= cw(5,0+1));
  ASSUME(cdy[5] >= cw(5,0+2));
  ASSUME(cdy[5] >= cw(5,0+3));
  ASSUME(cdy[5] >= cw(5,0+4));
  ASSUME(cdy[5] >= cw(5,0+5));
  ASSUME(cdy[5] >= cw(5,0+6));
  ASSUME(cdy[5] >= cw(5,0+7));
  ASSUME(cdy[5] >= cw(5,8+0));
  ASSUME(cdy[5] >= cw(5,9+0));
  ASSUME(cdy[5] >= cw(5,10+0));
  ASSUME(cdy[5] >= cw(5,23+0));
  ASSUME(cdy[5] >= cw(5,18+0));
  ASSUME(cdy[5] >= cw(5,19+0));
  ASSUME(cdy[5] >= cw(5,11+0));
  ASSUME(cdy[5] >= cw(5,12+0));
  ASSUME(cdy[5] >= cw(5,13+0));
  ASSUME(cdy[5] >= cw(5,14+0));
  ASSUME(cdy[5] >= cw(5,15+0));
  ASSUME(cdy[5] >= cw(5,16+0));
  ASSUME(cdy[5] >= cw(5,17+0));
  ASSUME(cdy[5] >= cw(5,20+0));
  ASSUME(cdy[5] >= cw(5,21+0));
  ASSUME(cdy[5] >= cw(5,22+0));
  ASSUME(cdy[5] >= cr(5,0+0));
  ASSUME(cdy[5] >= cr(5,0+1));
  ASSUME(cdy[5] >= cr(5,0+2));
  ASSUME(cdy[5] >= cr(5,0+3));
  ASSUME(cdy[5] >= cr(5,0+4));
  ASSUME(cdy[5] >= cr(5,0+5));
  ASSUME(cdy[5] >= cr(5,0+6));
  ASSUME(cdy[5] >= cr(5,0+7));
  ASSUME(cdy[5] >= cr(5,8+0));
  ASSUME(cdy[5] >= cr(5,9+0));
  ASSUME(cdy[5] >= cr(5,10+0));
  ASSUME(cdy[5] >= cr(5,23+0));
  ASSUME(cdy[5] >= cr(5,18+0));
  ASSUME(cdy[5] >= cr(5,19+0));
  ASSUME(cdy[5] >= cr(5,11+0));
  ASSUME(cdy[5] >= cr(5,12+0));
  ASSUME(cdy[5] >= cr(5,13+0));
  ASSUME(cdy[5] >= cr(5,14+0));
  ASSUME(cdy[5] >= cr(5,15+0));
  ASSUME(cdy[5] >= cr(5,16+0));
  ASSUME(cdy[5] >= cr(5,17+0));
  ASSUME(cdy[5] >= cr(5,20+0));
  ASSUME(cdy[5] >= cr(5,21+0));
  ASSUME(cdy[5] >= cr(5,22+0));
  ASSUME(creturn[5] >= cdy[5]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 5), metadata !164, metadata !DIExpression()), !dbg !179

  //   call void @llvm.dbg.value(metadata i64 1, metadata !166, metadata !DIExpression()), !dbg !179

  //   store atomic i64 1, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 5) monotonic, align 8, !dbg !70
  // ST: Guess
  iw(5,0+5*1) = get_rng(0,NCONTEXT-1);// 5 ASSIGN STIW 
  old_cw = cw(5,0+5*1);
  cw(5,0+5*1) = get_rng(0,NCONTEXT-1);// 5 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(5,0+5*1)] == 5);
  ASSUME(active[cw(5,0+5*1)] == 5);
  ASSUME(sforbid(0+5*1,cw(5,0+5*1))== 0);
  ASSUME(iw(5,0+5*1) >= 0);
  ASSUME(iw(5,0+5*1) >= 0);
  ASSUME(cw(5,0+5*1) >= iw(5,0+5*1));
  ASSUME(cw(5,0+5*1) >= old_cw);
  ASSUME(cw(5,0+5*1) >= cr(5,0+5*1));
  ASSUME(cw(5,0+5*1) >= cl[5]);
  ASSUME(cw(5,0+5*1) >= cisb[5]);
  ASSUME(cw(5,0+5*1) >= cdy[5]);
  ASSUME(cw(5,0+5*1) >= cdl[5]);
  ASSUME(cw(5,0+5*1) >= cds[5]);
  ASSUME(cw(5,0+5*1) >= cctrl[5]);
  ASSUME(cw(5,0+5*1) >= caddr[5]);
  // Update
  caddr[5] = max(caddr[5],0);
  buff(5,0+5*1) = 1;
  mem(0+5*1,cw(5,0+5*1)) = 1;
  co(0+5*1,cw(5,0+5*1))+=1;
  delta(0+5*1,cw(5,0+5*1)) = -1;
  ASSUME(creturn[5] >= cw(5,0+5*1));

  //   %cmp = icmp eq i32 %conv, 1, !dbg !71

  //   %conv1 = zext i1 %cmp to i32, !dbg !71

  //   call void @llvm.dbg.value(metadata i32 %conv1, metadata !167, metadata !DIExpression()), !dbg !172

  //   call void @llvm.dbg.value(metadata i64* @atom_4_X0_1, metadata !168, metadata !DIExpression()), !dbg !182

  //   %1 = zext i32 %conv1 to i64

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !170, metadata !DIExpression()), !dbg !182

  //   store atomic i64 %1, i64* @atom_4_X0_1 seq_cst, align 8, !dbg !73
  // ST: Guess
  iw(5,12) = get_rng(0,NCONTEXT-1);// 5 ASSIGN STIW 
  old_cw = cw(5,12);
  cw(5,12) = get_rng(0,NCONTEXT-1);// 5 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(5,12)] == 5);
  ASSUME(active[cw(5,12)] == 5);
  ASSUME(sforbid(12,cw(5,12))== 0);
  ASSUME(iw(5,12) >= max(creg_r4,0));
  ASSUME(iw(5,12) >= 0);
  ASSUME(cw(5,12) >= iw(5,12));
  ASSUME(cw(5,12) >= old_cw);
  ASSUME(cw(5,12) >= cr(5,12));
  ASSUME(cw(5,12) >= cl[5]);
  ASSUME(cw(5,12) >= cisb[5]);
  ASSUME(cw(5,12) >= cdy[5]);
  ASSUME(cw(5,12) >= cdl[5]);
  ASSUME(cw(5,12) >= cds[5]);
  ASSUME(cw(5,12) >= cctrl[5]);
  ASSUME(cw(5,12) >= caddr[5]);
  // Update
  caddr[5] = max(caddr[5],0);
  buff(5,12) = (r4==1);
  mem(12,cw(5,12)) = (r4==1);
  co(12,cw(5,12))+=1;
  delta(12,cw(5,12)) = -1;
  ASSUME(creturn[5] >= cw(5,12));

  //   ret i8* null, !dbg !74
  ret_thread_5 = (- 1);


  // Dumping thread 6
  int ret_thread_6 = 0;
  cdy[6] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[6] >= cstart[6]);
T6BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !187, metadata !DIExpression()), !dbg !200

  //   br label %label_6, !dbg !63
  goto T6BLOCK1;

T6BLOCK1:
  //   call void @llvm.dbg.label(metadata !199), !dbg !202

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 5), metadata !189, metadata !DIExpression()), !dbg !203

  //   %0 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 5) monotonic, align 8, !dbg !66
  // LD: Guess
  old_cr = cr(6,0+5*1);
  cr(6,0+5*1) = get_rng(0,NCONTEXT-1);// 6 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(6,0+5*1)] == 6);
  ASSUME(cr(6,0+5*1) >= iw(6,0+5*1));
  ASSUME(cr(6,0+5*1) >= 0);
  ASSUME(cr(6,0+5*1) >= cdy[6]);
  ASSUME(cr(6,0+5*1) >= cisb[6]);
  ASSUME(cr(6,0+5*1) >= cdl[6]);
  ASSUME(cr(6,0+5*1) >= cl[6]);
  // Update
  creg_r5 = cr(6,0+5*1);
  crmax(6,0+5*1) = max(crmax(6,0+5*1),cr(6,0+5*1));
  caddr[6] = max(caddr[6],0);
  if(cr(6,0+5*1) < cw(6,0+5*1)) {
    r5 = buff(6,0+5*1);
  } else {
    if(pw(6,0+5*1) != co(0+5*1,cr(6,0+5*1))) {
      ASSUME(cr(6,0+5*1) >= old_cr);
    }
    pw(6,0+5*1) = co(0+5*1,cr(6,0+5*1));
    r5 = mem(0+5*1,cr(6,0+5*1));
  }
  ASSUME(creturn[6] >= cr(6,0+5*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !191, metadata !DIExpression()), !dbg !203

  //   %conv = trunc i64 %0 to i32, !dbg !67

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !188, metadata !DIExpression()), !dbg !200

  //   call void (...) @dmbsy(), !dbg !68
  // dumbsy: Guess
  old_cdy = cdy[6];
  cdy[6] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[6] >= old_cdy);
  ASSUME(cdy[6] >= cisb[6]);
  ASSUME(cdy[6] >= cdl[6]);
  ASSUME(cdy[6] >= cds[6]);
  ASSUME(cdy[6] >= cctrl[6]);
  ASSUME(cdy[6] >= cw(6,0+0));
  ASSUME(cdy[6] >= cw(6,0+1));
  ASSUME(cdy[6] >= cw(6,0+2));
  ASSUME(cdy[6] >= cw(6,0+3));
  ASSUME(cdy[6] >= cw(6,0+4));
  ASSUME(cdy[6] >= cw(6,0+5));
  ASSUME(cdy[6] >= cw(6,0+6));
  ASSUME(cdy[6] >= cw(6,0+7));
  ASSUME(cdy[6] >= cw(6,8+0));
  ASSUME(cdy[6] >= cw(6,9+0));
  ASSUME(cdy[6] >= cw(6,10+0));
  ASSUME(cdy[6] >= cw(6,23+0));
  ASSUME(cdy[6] >= cw(6,18+0));
  ASSUME(cdy[6] >= cw(6,19+0));
  ASSUME(cdy[6] >= cw(6,11+0));
  ASSUME(cdy[6] >= cw(6,12+0));
  ASSUME(cdy[6] >= cw(6,13+0));
  ASSUME(cdy[6] >= cw(6,14+0));
  ASSUME(cdy[6] >= cw(6,15+0));
  ASSUME(cdy[6] >= cw(6,16+0));
  ASSUME(cdy[6] >= cw(6,17+0));
  ASSUME(cdy[6] >= cw(6,20+0));
  ASSUME(cdy[6] >= cw(6,21+0));
  ASSUME(cdy[6] >= cw(6,22+0));
  ASSUME(cdy[6] >= cr(6,0+0));
  ASSUME(cdy[6] >= cr(6,0+1));
  ASSUME(cdy[6] >= cr(6,0+2));
  ASSUME(cdy[6] >= cr(6,0+3));
  ASSUME(cdy[6] >= cr(6,0+4));
  ASSUME(cdy[6] >= cr(6,0+5));
  ASSUME(cdy[6] >= cr(6,0+6));
  ASSUME(cdy[6] >= cr(6,0+7));
  ASSUME(cdy[6] >= cr(6,8+0));
  ASSUME(cdy[6] >= cr(6,9+0));
  ASSUME(cdy[6] >= cr(6,10+0));
  ASSUME(cdy[6] >= cr(6,23+0));
  ASSUME(cdy[6] >= cr(6,18+0));
  ASSUME(cdy[6] >= cr(6,19+0));
  ASSUME(cdy[6] >= cr(6,11+0));
  ASSUME(cdy[6] >= cr(6,12+0));
  ASSUME(cdy[6] >= cr(6,13+0));
  ASSUME(cdy[6] >= cr(6,14+0));
  ASSUME(cdy[6] >= cr(6,15+0));
  ASSUME(cdy[6] >= cr(6,16+0));
  ASSUME(cdy[6] >= cr(6,17+0));
  ASSUME(cdy[6] >= cr(6,20+0));
  ASSUME(cdy[6] >= cr(6,21+0));
  ASSUME(cdy[6] >= cr(6,22+0));
  ASSUME(creturn[6] >= cdy[6]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 6), metadata !192, metadata !DIExpression()), !dbg !207

  //   call void @llvm.dbg.value(metadata i64 1, metadata !194, metadata !DIExpression()), !dbg !207

  //   store atomic i64 1, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 6) monotonic, align 8, !dbg !70
  // ST: Guess
  iw(6,0+6*1) = get_rng(0,NCONTEXT-1);// 6 ASSIGN STIW 
  old_cw = cw(6,0+6*1);
  cw(6,0+6*1) = get_rng(0,NCONTEXT-1);// 6 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(6,0+6*1)] == 6);
  ASSUME(active[cw(6,0+6*1)] == 6);
  ASSUME(sforbid(0+6*1,cw(6,0+6*1))== 0);
  ASSUME(iw(6,0+6*1) >= 0);
  ASSUME(iw(6,0+6*1) >= 0);
  ASSUME(cw(6,0+6*1) >= iw(6,0+6*1));
  ASSUME(cw(6,0+6*1) >= old_cw);
  ASSUME(cw(6,0+6*1) >= cr(6,0+6*1));
  ASSUME(cw(6,0+6*1) >= cl[6]);
  ASSUME(cw(6,0+6*1) >= cisb[6]);
  ASSUME(cw(6,0+6*1) >= cdy[6]);
  ASSUME(cw(6,0+6*1) >= cdl[6]);
  ASSUME(cw(6,0+6*1) >= cds[6]);
  ASSUME(cw(6,0+6*1) >= cctrl[6]);
  ASSUME(cw(6,0+6*1) >= caddr[6]);
  // Update
  caddr[6] = max(caddr[6],0);
  buff(6,0+6*1) = 1;
  mem(0+6*1,cw(6,0+6*1)) = 1;
  co(0+6*1,cw(6,0+6*1))+=1;
  delta(0+6*1,cw(6,0+6*1)) = -1;
  ASSUME(creturn[6] >= cw(6,0+6*1));

  //   %cmp = icmp eq i32 %conv, 1, !dbg !71

  //   %conv1 = zext i1 %cmp to i32, !dbg !71

  //   call void @llvm.dbg.value(metadata i32 %conv1, metadata !195, metadata !DIExpression()), !dbg !200

  //   call void @llvm.dbg.value(metadata i64* @atom_5_X0_1, metadata !196, metadata !DIExpression()), !dbg !210

  //   %1 = zext i32 %conv1 to i64

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !198, metadata !DIExpression()), !dbg !210

  //   store atomic i64 %1, i64* @atom_5_X0_1 seq_cst, align 8, !dbg !73
  // ST: Guess
  iw(6,13) = get_rng(0,NCONTEXT-1);// 6 ASSIGN STIW 
  old_cw = cw(6,13);
  cw(6,13) = get_rng(0,NCONTEXT-1);// 6 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(6,13)] == 6);
  ASSUME(active[cw(6,13)] == 6);
  ASSUME(sforbid(13,cw(6,13))== 0);
  ASSUME(iw(6,13) >= max(creg_r5,0));
  ASSUME(iw(6,13) >= 0);
  ASSUME(cw(6,13) >= iw(6,13));
  ASSUME(cw(6,13) >= old_cw);
  ASSUME(cw(6,13) >= cr(6,13));
  ASSUME(cw(6,13) >= cl[6]);
  ASSUME(cw(6,13) >= cisb[6]);
  ASSUME(cw(6,13) >= cdy[6]);
  ASSUME(cw(6,13) >= cdl[6]);
  ASSUME(cw(6,13) >= cds[6]);
  ASSUME(cw(6,13) >= cctrl[6]);
  ASSUME(cw(6,13) >= caddr[6]);
  // Update
  caddr[6] = max(caddr[6],0);
  buff(6,13) = (r5==1);
  mem(13,cw(6,13)) = (r5==1);
  co(13,cw(6,13))+=1;
  delta(13,cw(6,13)) = -1;
  ASSUME(creturn[6] >= cw(6,13));

  //   ret i8* null, !dbg !74
  ret_thread_6 = (- 1);


  // Dumping thread 7
  int ret_thread_7 = 0;
  cdy[7] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[7] >= cstart[7]);
T7BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !215, metadata !DIExpression()), !dbg !228

  //   br label %label_7, !dbg !63
  goto T7BLOCK1;

T7BLOCK1:
  //   call void @llvm.dbg.label(metadata !227), !dbg !230

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 6), metadata !217, metadata !DIExpression()), !dbg !231

  //   %0 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 6) monotonic, align 8, !dbg !66
  // LD: Guess
  old_cr = cr(7,0+6*1);
  cr(7,0+6*1) = get_rng(0,NCONTEXT-1);// 7 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(7,0+6*1)] == 7);
  ASSUME(cr(7,0+6*1) >= iw(7,0+6*1));
  ASSUME(cr(7,0+6*1) >= 0);
  ASSUME(cr(7,0+6*1) >= cdy[7]);
  ASSUME(cr(7,0+6*1) >= cisb[7]);
  ASSUME(cr(7,0+6*1) >= cdl[7]);
  ASSUME(cr(7,0+6*1) >= cl[7]);
  // Update
  creg_r6 = cr(7,0+6*1);
  crmax(7,0+6*1) = max(crmax(7,0+6*1),cr(7,0+6*1));
  caddr[7] = max(caddr[7],0);
  if(cr(7,0+6*1) < cw(7,0+6*1)) {
    r6 = buff(7,0+6*1);
  } else {
    if(pw(7,0+6*1) != co(0+6*1,cr(7,0+6*1))) {
      ASSUME(cr(7,0+6*1) >= old_cr);
    }
    pw(7,0+6*1) = co(0+6*1,cr(7,0+6*1));
    r6 = mem(0+6*1,cr(7,0+6*1));
  }
  ASSUME(creturn[7] >= cr(7,0+6*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !219, metadata !DIExpression()), !dbg !231

  //   %conv = trunc i64 %0 to i32, !dbg !67

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !216, metadata !DIExpression()), !dbg !228

  //   call void (...) @dmbsy(), !dbg !68
  // dumbsy: Guess
  old_cdy = cdy[7];
  cdy[7] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[7] >= old_cdy);
  ASSUME(cdy[7] >= cisb[7]);
  ASSUME(cdy[7] >= cdl[7]);
  ASSUME(cdy[7] >= cds[7]);
  ASSUME(cdy[7] >= cctrl[7]);
  ASSUME(cdy[7] >= cw(7,0+0));
  ASSUME(cdy[7] >= cw(7,0+1));
  ASSUME(cdy[7] >= cw(7,0+2));
  ASSUME(cdy[7] >= cw(7,0+3));
  ASSUME(cdy[7] >= cw(7,0+4));
  ASSUME(cdy[7] >= cw(7,0+5));
  ASSUME(cdy[7] >= cw(7,0+6));
  ASSUME(cdy[7] >= cw(7,0+7));
  ASSUME(cdy[7] >= cw(7,8+0));
  ASSUME(cdy[7] >= cw(7,9+0));
  ASSUME(cdy[7] >= cw(7,10+0));
  ASSUME(cdy[7] >= cw(7,23+0));
  ASSUME(cdy[7] >= cw(7,18+0));
  ASSUME(cdy[7] >= cw(7,19+0));
  ASSUME(cdy[7] >= cw(7,11+0));
  ASSUME(cdy[7] >= cw(7,12+0));
  ASSUME(cdy[7] >= cw(7,13+0));
  ASSUME(cdy[7] >= cw(7,14+0));
  ASSUME(cdy[7] >= cw(7,15+0));
  ASSUME(cdy[7] >= cw(7,16+0));
  ASSUME(cdy[7] >= cw(7,17+0));
  ASSUME(cdy[7] >= cw(7,20+0));
  ASSUME(cdy[7] >= cw(7,21+0));
  ASSUME(cdy[7] >= cw(7,22+0));
  ASSUME(cdy[7] >= cr(7,0+0));
  ASSUME(cdy[7] >= cr(7,0+1));
  ASSUME(cdy[7] >= cr(7,0+2));
  ASSUME(cdy[7] >= cr(7,0+3));
  ASSUME(cdy[7] >= cr(7,0+4));
  ASSUME(cdy[7] >= cr(7,0+5));
  ASSUME(cdy[7] >= cr(7,0+6));
  ASSUME(cdy[7] >= cr(7,0+7));
  ASSUME(cdy[7] >= cr(7,8+0));
  ASSUME(cdy[7] >= cr(7,9+0));
  ASSUME(cdy[7] >= cr(7,10+0));
  ASSUME(cdy[7] >= cr(7,23+0));
  ASSUME(cdy[7] >= cr(7,18+0));
  ASSUME(cdy[7] >= cr(7,19+0));
  ASSUME(cdy[7] >= cr(7,11+0));
  ASSUME(cdy[7] >= cr(7,12+0));
  ASSUME(cdy[7] >= cr(7,13+0));
  ASSUME(cdy[7] >= cr(7,14+0));
  ASSUME(cdy[7] >= cr(7,15+0));
  ASSUME(cdy[7] >= cr(7,16+0));
  ASSUME(cdy[7] >= cr(7,17+0));
  ASSUME(cdy[7] >= cr(7,20+0));
  ASSUME(cdy[7] >= cr(7,21+0));
  ASSUME(cdy[7] >= cr(7,22+0));
  ASSUME(creturn[7] >= cdy[7]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 7), metadata !220, metadata !DIExpression()), !dbg !235

  //   call void @llvm.dbg.value(metadata i64 1, metadata !222, metadata !DIExpression()), !dbg !235

  //   store atomic i64 1, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 7) monotonic, align 8, !dbg !70
  // ST: Guess
  iw(7,0+7*1) = get_rng(0,NCONTEXT-1);// 7 ASSIGN STIW 
  old_cw = cw(7,0+7*1);
  cw(7,0+7*1) = get_rng(0,NCONTEXT-1);// 7 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(7,0+7*1)] == 7);
  ASSUME(active[cw(7,0+7*1)] == 7);
  ASSUME(sforbid(0+7*1,cw(7,0+7*1))== 0);
  ASSUME(iw(7,0+7*1) >= 0);
  ASSUME(iw(7,0+7*1) >= 0);
  ASSUME(cw(7,0+7*1) >= iw(7,0+7*1));
  ASSUME(cw(7,0+7*1) >= old_cw);
  ASSUME(cw(7,0+7*1) >= cr(7,0+7*1));
  ASSUME(cw(7,0+7*1) >= cl[7]);
  ASSUME(cw(7,0+7*1) >= cisb[7]);
  ASSUME(cw(7,0+7*1) >= cdy[7]);
  ASSUME(cw(7,0+7*1) >= cdl[7]);
  ASSUME(cw(7,0+7*1) >= cds[7]);
  ASSUME(cw(7,0+7*1) >= cctrl[7]);
  ASSUME(cw(7,0+7*1) >= caddr[7]);
  // Update
  caddr[7] = max(caddr[7],0);
  buff(7,0+7*1) = 1;
  mem(0+7*1,cw(7,0+7*1)) = 1;
  co(0+7*1,cw(7,0+7*1))+=1;
  delta(0+7*1,cw(7,0+7*1)) = -1;
  ASSUME(creturn[7] >= cw(7,0+7*1));

  //   %cmp = icmp eq i32 %conv, 1, !dbg !71

  //   %conv1 = zext i1 %cmp to i32, !dbg !71

  //   call void @llvm.dbg.value(metadata i32 %conv1, metadata !223, metadata !DIExpression()), !dbg !228

  //   call void @llvm.dbg.value(metadata i64* @atom_6_X0_1, metadata !224, metadata !DIExpression()), !dbg !238

  //   %1 = zext i32 %conv1 to i64

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !226, metadata !DIExpression()), !dbg !238

  //   store atomic i64 %1, i64* @atom_6_X0_1 seq_cst, align 8, !dbg !73
  // ST: Guess
  iw(7,14) = get_rng(0,NCONTEXT-1);// 7 ASSIGN STIW 
  old_cw = cw(7,14);
  cw(7,14) = get_rng(0,NCONTEXT-1);// 7 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(7,14)] == 7);
  ASSUME(active[cw(7,14)] == 7);
  ASSUME(sforbid(14,cw(7,14))== 0);
  ASSUME(iw(7,14) >= max(creg_r6,0));
  ASSUME(iw(7,14) >= 0);
  ASSUME(cw(7,14) >= iw(7,14));
  ASSUME(cw(7,14) >= old_cw);
  ASSUME(cw(7,14) >= cr(7,14));
  ASSUME(cw(7,14) >= cl[7]);
  ASSUME(cw(7,14) >= cisb[7]);
  ASSUME(cw(7,14) >= cdy[7]);
  ASSUME(cw(7,14) >= cdl[7]);
  ASSUME(cw(7,14) >= cds[7]);
  ASSUME(cw(7,14) >= cctrl[7]);
  ASSUME(cw(7,14) >= caddr[7]);
  // Update
  caddr[7] = max(caddr[7],0);
  buff(7,14) = (r6==1);
  mem(14,cw(7,14)) = (r6==1);
  co(14,cw(7,14))+=1;
  delta(14,cw(7,14)) = -1;
  ASSUME(creturn[7] >= cw(7,14));

  //   ret i8* null, !dbg !74
  ret_thread_7 = (- 1);


  // Dumping thread 8
  int ret_thread_8 = 0;
  cdy[8] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[8] >= cstart[8]);
T8BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !243, metadata !DIExpression()), !dbg !256

  //   br label %label_8, !dbg !63
  goto T8BLOCK1;

T8BLOCK1:
  //   call void @llvm.dbg.label(metadata !255), !dbg !258

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 7), metadata !245, metadata !DIExpression()), !dbg !259

  //   %0 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 7) monotonic, align 8, !dbg !66
  // LD: Guess
  old_cr = cr(8,0+7*1);
  cr(8,0+7*1) = get_rng(0,NCONTEXT-1);// 8 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(8,0+7*1)] == 8);
  ASSUME(cr(8,0+7*1) >= iw(8,0+7*1));
  ASSUME(cr(8,0+7*1) >= 0);
  ASSUME(cr(8,0+7*1) >= cdy[8]);
  ASSUME(cr(8,0+7*1) >= cisb[8]);
  ASSUME(cr(8,0+7*1) >= cdl[8]);
  ASSUME(cr(8,0+7*1) >= cl[8]);
  // Update
  creg_r7 = cr(8,0+7*1);
  crmax(8,0+7*1) = max(crmax(8,0+7*1),cr(8,0+7*1));
  caddr[8] = max(caddr[8],0);
  if(cr(8,0+7*1) < cw(8,0+7*1)) {
    r7 = buff(8,0+7*1);
  } else {
    if(pw(8,0+7*1) != co(0+7*1,cr(8,0+7*1))) {
      ASSUME(cr(8,0+7*1) >= old_cr);
    }
    pw(8,0+7*1) = co(0+7*1,cr(8,0+7*1));
    r7 = mem(0+7*1,cr(8,0+7*1));
  }
  ASSUME(creturn[8] >= cr(8,0+7*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !247, metadata !DIExpression()), !dbg !259

  //   %conv = trunc i64 %0 to i32, !dbg !67

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !244, metadata !DIExpression()), !dbg !256

  //   call void (...) @dmbsy(), !dbg !68
  // dumbsy: Guess
  old_cdy = cdy[8];
  cdy[8] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[8] >= old_cdy);
  ASSUME(cdy[8] >= cisb[8]);
  ASSUME(cdy[8] >= cdl[8]);
  ASSUME(cdy[8] >= cds[8]);
  ASSUME(cdy[8] >= cctrl[8]);
  ASSUME(cdy[8] >= cw(8,0+0));
  ASSUME(cdy[8] >= cw(8,0+1));
  ASSUME(cdy[8] >= cw(8,0+2));
  ASSUME(cdy[8] >= cw(8,0+3));
  ASSUME(cdy[8] >= cw(8,0+4));
  ASSUME(cdy[8] >= cw(8,0+5));
  ASSUME(cdy[8] >= cw(8,0+6));
  ASSUME(cdy[8] >= cw(8,0+7));
  ASSUME(cdy[8] >= cw(8,8+0));
  ASSUME(cdy[8] >= cw(8,9+0));
  ASSUME(cdy[8] >= cw(8,10+0));
  ASSUME(cdy[8] >= cw(8,23+0));
  ASSUME(cdy[8] >= cw(8,18+0));
  ASSUME(cdy[8] >= cw(8,19+0));
  ASSUME(cdy[8] >= cw(8,11+0));
  ASSUME(cdy[8] >= cw(8,12+0));
  ASSUME(cdy[8] >= cw(8,13+0));
  ASSUME(cdy[8] >= cw(8,14+0));
  ASSUME(cdy[8] >= cw(8,15+0));
  ASSUME(cdy[8] >= cw(8,16+0));
  ASSUME(cdy[8] >= cw(8,17+0));
  ASSUME(cdy[8] >= cw(8,20+0));
  ASSUME(cdy[8] >= cw(8,21+0));
  ASSUME(cdy[8] >= cw(8,22+0));
  ASSUME(cdy[8] >= cr(8,0+0));
  ASSUME(cdy[8] >= cr(8,0+1));
  ASSUME(cdy[8] >= cr(8,0+2));
  ASSUME(cdy[8] >= cr(8,0+3));
  ASSUME(cdy[8] >= cr(8,0+4));
  ASSUME(cdy[8] >= cr(8,0+5));
  ASSUME(cdy[8] >= cr(8,0+6));
  ASSUME(cdy[8] >= cr(8,0+7));
  ASSUME(cdy[8] >= cr(8,8+0));
  ASSUME(cdy[8] >= cr(8,9+0));
  ASSUME(cdy[8] >= cr(8,10+0));
  ASSUME(cdy[8] >= cr(8,23+0));
  ASSUME(cdy[8] >= cr(8,18+0));
  ASSUME(cdy[8] >= cr(8,19+0));
  ASSUME(cdy[8] >= cr(8,11+0));
  ASSUME(cdy[8] >= cr(8,12+0));
  ASSUME(cdy[8] >= cr(8,13+0));
  ASSUME(cdy[8] >= cr(8,14+0));
  ASSUME(cdy[8] >= cr(8,15+0));
  ASSUME(cdy[8] >= cr(8,16+0));
  ASSUME(cdy[8] >= cr(8,17+0));
  ASSUME(cdy[8] >= cr(8,20+0));
  ASSUME(cdy[8] >= cr(8,21+0));
  ASSUME(cdy[8] >= cr(8,22+0));
  ASSUME(creturn[8] >= cdy[8]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 1), metadata !248, metadata !DIExpression()), !dbg !263

  //   call void @llvm.dbg.value(metadata i64 1, metadata !250, metadata !DIExpression()), !dbg !263

  //   store atomic i64 1, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !70
  // ST: Guess
  iw(8,0+1*1) = get_rng(0,NCONTEXT-1);// 8 ASSIGN STIW 
  old_cw = cw(8,0+1*1);
  cw(8,0+1*1) = get_rng(0,NCONTEXT-1);// 8 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(8,0+1*1)] == 8);
  ASSUME(active[cw(8,0+1*1)] == 8);
  ASSUME(sforbid(0+1*1,cw(8,0+1*1))== 0);
  ASSUME(iw(8,0+1*1) >= 0);
  ASSUME(iw(8,0+1*1) >= 0);
  ASSUME(cw(8,0+1*1) >= iw(8,0+1*1));
  ASSUME(cw(8,0+1*1) >= old_cw);
  ASSUME(cw(8,0+1*1) >= cr(8,0+1*1));
  ASSUME(cw(8,0+1*1) >= cl[8]);
  ASSUME(cw(8,0+1*1) >= cisb[8]);
  ASSUME(cw(8,0+1*1) >= cdy[8]);
  ASSUME(cw(8,0+1*1) >= cdl[8]);
  ASSUME(cw(8,0+1*1) >= cds[8]);
  ASSUME(cw(8,0+1*1) >= cctrl[8]);
  ASSUME(cw(8,0+1*1) >= caddr[8]);
  // Update
  caddr[8] = max(caddr[8],0);
  buff(8,0+1*1) = 1;
  mem(0+1*1,cw(8,0+1*1)) = 1;
  co(0+1*1,cw(8,0+1*1))+=1;
  delta(0+1*1,cw(8,0+1*1)) = -1;
  ASSUME(creturn[8] >= cw(8,0+1*1));

  //   %cmp = icmp eq i32 %conv, 1, !dbg !71

  //   %conv1 = zext i1 %cmp to i32, !dbg !71

  //   call void @llvm.dbg.value(metadata i32 %conv1, metadata !251, metadata !DIExpression()), !dbg !256

  //   call void @llvm.dbg.value(metadata i64* @atom_7_X0_1, metadata !252, metadata !DIExpression()), !dbg !266

  //   %1 = zext i32 %conv1 to i64

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !254, metadata !DIExpression()), !dbg !266

  //   store atomic i64 %1, i64* @atom_7_X0_1 seq_cst, align 8, !dbg !73
  // ST: Guess
  iw(8,15) = get_rng(0,NCONTEXT-1);// 8 ASSIGN STIW 
  old_cw = cw(8,15);
  cw(8,15) = get_rng(0,NCONTEXT-1);// 8 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(8,15)] == 8);
  ASSUME(active[cw(8,15)] == 8);
  ASSUME(sforbid(15,cw(8,15))== 0);
  ASSUME(iw(8,15) >= max(creg_r7,0));
  ASSUME(iw(8,15) >= 0);
  ASSUME(cw(8,15) >= iw(8,15));
  ASSUME(cw(8,15) >= old_cw);
  ASSUME(cw(8,15) >= cr(8,15));
  ASSUME(cw(8,15) >= cl[8]);
  ASSUME(cw(8,15) >= cisb[8]);
  ASSUME(cw(8,15) >= cdy[8]);
  ASSUME(cw(8,15) >= cdl[8]);
  ASSUME(cw(8,15) >= cds[8]);
  ASSUME(cw(8,15) >= cctrl[8]);
  ASSUME(cw(8,15) >= caddr[8]);
  // Update
  caddr[8] = max(caddr[8],0);
  buff(8,15) = (r7==1);
  mem(15,cw(8,15)) = (r7==1);
  co(15,cw(8,15))+=1;
  delta(15,cw(8,15)) = -1;
  ASSUME(creturn[8] >= cw(8,15));

  //   ret i8* null, !dbg !74
  ret_thread_8 = (- 1);


  // Dumping thread 0
  int ret_thread_0 = 0;
  cdy[0] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[0] >= cstart[0]);
T0BLOCK0:
  //   %thr0 = alloca i64, align 8

  //   %thr1 = alloca i64, align 8

  //   %thr2 = alloca i64, align 8

  //   %thr3 = alloca i64, align 8

  //   %thr4 = alloca i64, align 8

  //   %thr5 = alloca i64, align 8

  //   %thr6 = alloca i64, align 8

  //   %thr7 = alloca i64, align 8

  //   call void @llvm.dbg.value(metadata i32 %argc, metadata !276, metadata !DIExpression()), !dbg !376

  //   call void @llvm.dbg.value(metadata i8** %argv, metadata !277, metadata !DIExpression()), !dbg !376

  //   %0 = bitcast i64* %thr0 to i8*, !dbg !153

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #7, !dbg !153

  //   call void @llvm.dbg.declare(metadata i64* %thr0, metadata !278, metadata !DIExpression()), !dbg !378

  //   %1 = bitcast i64* %thr1 to i8*, !dbg !155

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #7, !dbg !155

  //   call void @llvm.dbg.declare(metadata i64* %thr1, metadata !282, metadata !DIExpression()), !dbg !380

  //   %2 = bitcast i64* %thr2 to i8*, !dbg !157

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #7, !dbg !157

  //   call void @llvm.dbg.declare(metadata i64* %thr2, metadata !283, metadata !DIExpression()), !dbg !382

  //   %3 = bitcast i64* %thr3 to i8*, !dbg !159

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #7, !dbg !159

  //   call void @llvm.dbg.declare(metadata i64* %thr3, metadata !284, metadata !DIExpression()), !dbg !384

  //   %4 = bitcast i64* %thr4 to i8*, !dbg !161

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #7, !dbg !161

  //   call void @llvm.dbg.declare(metadata i64* %thr4, metadata !285, metadata !DIExpression()), !dbg !386

  //   %5 = bitcast i64* %thr5 to i8*, !dbg !163

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %5) #7, !dbg !163

  //   call void @llvm.dbg.declare(metadata i64* %thr5, metadata !286, metadata !DIExpression()), !dbg !388

  //   %6 = bitcast i64* %thr6 to i8*, !dbg !165

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %6) #7, !dbg !165

  //   call void @llvm.dbg.declare(metadata i64* %thr6, metadata !287, metadata !DIExpression()), !dbg !390

  //   %7 = bitcast i64* %thr7 to i8*, !dbg !167

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %7) #7, !dbg !167

  //   call void @llvm.dbg.declare(metadata i64* %thr7, metadata !288, metadata !DIExpression()), !dbg !392

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 7), metadata !289, metadata !DIExpression()), !dbg !393

  //   call void @llvm.dbg.value(metadata i64 0, metadata !291, metadata !DIExpression()), !dbg !393

  //   store atomic i64 0, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 7) monotonic, align 8, !dbg !170
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 6), metadata !292, metadata !DIExpression()), !dbg !395

  //   call void @llvm.dbg.value(metadata i64 0, metadata !294, metadata !DIExpression()), !dbg !395

  //   store atomic i64 0, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 6) monotonic, align 8, !dbg !172
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 5), metadata !295, metadata !DIExpression()), !dbg !397

  //   call void @llvm.dbg.value(metadata i64 0, metadata !297, metadata !DIExpression()), !dbg !397

  //   store atomic i64 0, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 5) monotonic, align 8, !dbg !174
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 4), metadata !298, metadata !DIExpression()), !dbg !399

  //   call void @llvm.dbg.value(metadata i64 0, metadata !300, metadata !DIExpression()), !dbg !399

  //   store atomic i64 0, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 4) monotonic, align 8, !dbg !176
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 3), metadata !301, metadata !DIExpression()), !dbg !401

  //   call void @llvm.dbg.value(metadata i64 0, metadata !303, metadata !DIExpression()), !dbg !401

  //   store atomic i64 0, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !178
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 2), metadata !304, metadata !DIExpression()), !dbg !403

  //   call void @llvm.dbg.value(metadata i64 0, metadata !306, metadata !DIExpression()), !dbg !403

  //   store atomic i64 0, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 2) monotonic, align 8, !dbg !180
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 1), metadata !307, metadata !DIExpression()), !dbg !405

  //   call void @llvm.dbg.value(metadata i64 0, metadata !309, metadata !DIExpression()), !dbg !405

  //   store atomic i64 0, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !182
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 0), metadata !310, metadata !DIExpression()), !dbg !407

  //   call void @llvm.dbg.value(metadata i64 0, metadata !312, metadata !DIExpression()), !dbg !407

  //   store atomic i64 0, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !184
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

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X0_1, metadata !313, metadata !DIExpression()), !dbg !409

  //   call void @llvm.dbg.value(metadata i64 0, metadata !315, metadata !DIExpression()), !dbg !409

  //   store atomic i64 0, i64* @atom_0_X0_1 monotonic, align 8, !dbg !186
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

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X0_1, metadata !316, metadata !DIExpression()), !dbg !411

  //   call void @llvm.dbg.value(metadata i64 0, metadata !318, metadata !DIExpression()), !dbg !411

  //   store atomic i64 0, i64* @atom_1_X0_1 monotonic, align 8, !dbg !188
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

  //   call void @llvm.dbg.value(metadata i64* @atom_2_X0_1, metadata !319, metadata !DIExpression()), !dbg !413

  //   call void @llvm.dbg.value(metadata i64 0, metadata !321, metadata !DIExpression()), !dbg !413

  //   store atomic i64 0, i64* @atom_2_X0_1 monotonic, align 8, !dbg !190
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

  //   call void @llvm.dbg.value(metadata i64* @atom_3_X0_1, metadata !322, metadata !DIExpression()), !dbg !415

  //   call void @llvm.dbg.value(metadata i64 0, metadata !324, metadata !DIExpression()), !dbg !415

  //   store atomic i64 0, i64* @atom_3_X0_1 monotonic, align 8, !dbg !192
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

  //   call void @llvm.dbg.value(metadata i64* @atom_4_X0_1, metadata !325, metadata !DIExpression()), !dbg !417

  //   call void @llvm.dbg.value(metadata i64 0, metadata !327, metadata !DIExpression()), !dbg !417

  //   store atomic i64 0, i64* @atom_4_X0_1 monotonic, align 8, !dbg !194
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

  //   call void @llvm.dbg.value(metadata i64* @atom_5_X0_1, metadata !328, metadata !DIExpression()), !dbg !419

  //   call void @llvm.dbg.value(metadata i64 0, metadata !330, metadata !DIExpression()), !dbg !419

  //   store atomic i64 0, i64* @atom_5_X0_1 monotonic, align 8, !dbg !196
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

  //   call void @llvm.dbg.value(metadata i64* @atom_6_X0_1, metadata !331, metadata !DIExpression()), !dbg !421

  //   call void @llvm.dbg.value(metadata i64 0, metadata !333, metadata !DIExpression()), !dbg !421

  //   store atomic i64 0, i64* @atom_6_X0_1 monotonic, align 8, !dbg !198
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

  //   call void @llvm.dbg.value(metadata i64* @atom_7_X0_1, metadata !334, metadata !DIExpression()), !dbg !423

  //   call void @llvm.dbg.value(metadata i64 0, metadata !336, metadata !DIExpression()), !dbg !423

  //   store atomic i64 0, i64* @atom_7_X0_1 monotonic, align 8, !dbg !200
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

  //   %call = call i32 @pthread_create(i64* noundef %thr0, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t0, i8* noundef null) #7, !dbg !201
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
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,23+0));
  ASSUME(cdy[0] >= cw(0,18+0));
  ASSUME(cdy[0] >= cw(0,19+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cw(0,20+0));
  ASSUME(cdy[0] >= cw(0,21+0));
  ASSUME(cdy[0] >= cw(0,22+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,0+6));
  ASSUME(cdy[0] >= cr(0,0+7));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,23+0));
  ASSUME(cdy[0] >= cr(0,18+0));
  ASSUME(cdy[0] >= cr(0,19+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(cdy[0] >= cr(0,20+0));
  ASSUME(cdy[0] >= cr(0,21+0));
  ASSUME(cdy[0] >= cr(0,22+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[1] >= cdy[0]);

  //   %call31 = call i32 @pthread_create(i64* noundef %thr1, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t1, i8* noundef null) #7, !dbg !202
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
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,23+0));
  ASSUME(cdy[0] >= cw(0,18+0));
  ASSUME(cdy[0] >= cw(0,19+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cw(0,20+0));
  ASSUME(cdy[0] >= cw(0,21+0));
  ASSUME(cdy[0] >= cw(0,22+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,0+6));
  ASSUME(cdy[0] >= cr(0,0+7));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,23+0));
  ASSUME(cdy[0] >= cr(0,18+0));
  ASSUME(cdy[0] >= cr(0,19+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(cdy[0] >= cr(0,20+0));
  ASSUME(cdy[0] >= cr(0,21+0));
  ASSUME(cdy[0] >= cr(0,22+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[2] >= cdy[0]);

  //   %call32 = call i32 @pthread_create(i64* noundef %thr2, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t2, i8* noundef null) #7, !dbg !203
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
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,23+0));
  ASSUME(cdy[0] >= cw(0,18+0));
  ASSUME(cdy[0] >= cw(0,19+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cw(0,20+0));
  ASSUME(cdy[0] >= cw(0,21+0));
  ASSUME(cdy[0] >= cw(0,22+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,0+6));
  ASSUME(cdy[0] >= cr(0,0+7));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,23+0));
  ASSUME(cdy[0] >= cr(0,18+0));
  ASSUME(cdy[0] >= cr(0,19+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(cdy[0] >= cr(0,20+0));
  ASSUME(cdy[0] >= cr(0,21+0));
  ASSUME(cdy[0] >= cr(0,22+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[3] >= cdy[0]);

  //   %call33 = call i32 @pthread_create(i64* noundef %thr3, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t3, i8* noundef null) #7, !dbg !204
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
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,23+0));
  ASSUME(cdy[0] >= cw(0,18+0));
  ASSUME(cdy[0] >= cw(0,19+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cw(0,20+0));
  ASSUME(cdy[0] >= cw(0,21+0));
  ASSUME(cdy[0] >= cw(0,22+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,0+6));
  ASSUME(cdy[0] >= cr(0,0+7));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,23+0));
  ASSUME(cdy[0] >= cr(0,18+0));
  ASSUME(cdy[0] >= cr(0,19+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(cdy[0] >= cr(0,20+0));
  ASSUME(cdy[0] >= cr(0,21+0));
  ASSUME(cdy[0] >= cr(0,22+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[4] >= cdy[0]);

  //   %call34 = call i32 @pthread_create(i64* noundef %thr4, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t4, i8* noundef null) #7, !dbg !205
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
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,23+0));
  ASSUME(cdy[0] >= cw(0,18+0));
  ASSUME(cdy[0] >= cw(0,19+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cw(0,20+0));
  ASSUME(cdy[0] >= cw(0,21+0));
  ASSUME(cdy[0] >= cw(0,22+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,0+6));
  ASSUME(cdy[0] >= cr(0,0+7));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,23+0));
  ASSUME(cdy[0] >= cr(0,18+0));
  ASSUME(cdy[0] >= cr(0,19+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(cdy[0] >= cr(0,20+0));
  ASSUME(cdy[0] >= cr(0,21+0));
  ASSUME(cdy[0] >= cr(0,22+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[5] >= cdy[0]);

  //   %call35 = call i32 @pthread_create(i64* noundef %thr5, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t5, i8* noundef null) #7, !dbg !206
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
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,23+0));
  ASSUME(cdy[0] >= cw(0,18+0));
  ASSUME(cdy[0] >= cw(0,19+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cw(0,20+0));
  ASSUME(cdy[0] >= cw(0,21+0));
  ASSUME(cdy[0] >= cw(0,22+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,0+6));
  ASSUME(cdy[0] >= cr(0,0+7));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,23+0));
  ASSUME(cdy[0] >= cr(0,18+0));
  ASSUME(cdy[0] >= cr(0,19+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(cdy[0] >= cr(0,20+0));
  ASSUME(cdy[0] >= cr(0,21+0));
  ASSUME(cdy[0] >= cr(0,22+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[6] >= cdy[0]);

  //   %call36 = call i32 @pthread_create(i64* noundef %thr6, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t6, i8* noundef null) #7, !dbg !207
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
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,23+0));
  ASSUME(cdy[0] >= cw(0,18+0));
  ASSUME(cdy[0] >= cw(0,19+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cw(0,20+0));
  ASSUME(cdy[0] >= cw(0,21+0));
  ASSUME(cdy[0] >= cw(0,22+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,0+6));
  ASSUME(cdy[0] >= cr(0,0+7));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,23+0));
  ASSUME(cdy[0] >= cr(0,18+0));
  ASSUME(cdy[0] >= cr(0,19+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(cdy[0] >= cr(0,20+0));
  ASSUME(cdy[0] >= cr(0,21+0));
  ASSUME(cdy[0] >= cr(0,22+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[7] >= cdy[0]);

  //   %call37 = call i32 @pthread_create(i64* noundef %thr7, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t7, i8* noundef null) #7, !dbg !208
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
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,23+0));
  ASSUME(cdy[0] >= cw(0,18+0));
  ASSUME(cdy[0] >= cw(0,19+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cw(0,20+0));
  ASSUME(cdy[0] >= cw(0,21+0));
  ASSUME(cdy[0] >= cw(0,22+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,0+6));
  ASSUME(cdy[0] >= cr(0,0+7));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,23+0));
  ASSUME(cdy[0] >= cr(0,18+0));
  ASSUME(cdy[0] >= cr(0,19+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(cdy[0] >= cr(0,20+0));
  ASSUME(cdy[0] >= cr(0,21+0));
  ASSUME(cdy[0] >= cr(0,22+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[8] >= cdy[0]);

  //   %8 = load i64, i64* %thr0, align 8, !dbg !209, !tbaa !210
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
  creg_r9 = cr(0,16);
  crmax(0,16) = max(crmax(0,16),cr(0,16));
  caddr[0] = max(caddr[0],0);
  if(cr(0,16) < cw(0,16)) {
    r9 = buff(0,16);
  } else {
    if(pw(0,16) != co(16,cr(0,16))) {
      ASSUME(cr(0,16) >= old_cr);
    }
    pw(0,16) = co(16,cr(0,16));
    r9 = mem(16,cr(0,16));
  }
  ASSUME(creturn[0] >= cr(0,16));

  //   %call38 = call i32 @pthread_join(i64 noundef %8, i8** noundef null), !dbg !214
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
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,23+0));
  ASSUME(cdy[0] >= cw(0,18+0));
  ASSUME(cdy[0] >= cw(0,19+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cw(0,20+0));
  ASSUME(cdy[0] >= cw(0,21+0));
  ASSUME(cdy[0] >= cw(0,22+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,0+6));
  ASSUME(cdy[0] >= cr(0,0+7));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,23+0));
  ASSUME(cdy[0] >= cr(0,18+0));
  ASSUME(cdy[0] >= cr(0,19+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(cdy[0] >= cr(0,20+0));
  ASSUME(cdy[0] >= cr(0,21+0));
  ASSUME(cdy[0] >= cr(0,22+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[1]);

  //   %9 = load i64, i64* %thr1, align 8, !dbg !215, !tbaa !210
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
  creg_r10 = cr(0,17);
  crmax(0,17) = max(crmax(0,17),cr(0,17));
  caddr[0] = max(caddr[0],0);
  if(cr(0,17) < cw(0,17)) {
    r10 = buff(0,17);
  } else {
    if(pw(0,17) != co(17,cr(0,17))) {
      ASSUME(cr(0,17) >= old_cr);
    }
    pw(0,17) = co(17,cr(0,17));
    r10 = mem(17,cr(0,17));
  }
  ASSUME(creturn[0] >= cr(0,17));

  //   %call39 = call i32 @pthread_join(i64 noundef %9, i8** noundef null), !dbg !216
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
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,23+0));
  ASSUME(cdy[0] >= cw(0,18+0));
  ASSUME(cdy[0] >= cw(0,19+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cw(0,20+0));
  ASSUME(cdy[0] >= cw(0,21+0));
  ASSUME(cdy[0] >= cw(0,22+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,0+6));
  ASSUME(cdy[0] >= cr(0,0+7));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,23+0));
  ASSUME(cdy[0] >= cr(0,18+0));
  ASSUME(cdy[0] >= cr(0,19+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(cdy[0] >= cr(0,20+0));
  ASSUME(cdy[0] >= cr(0,21+0));
  ASSUME(cdy[0] >= cr(0,22+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[2]);

  //   %10 = load i64, i64* %thr2, align 8, !dbg !217, !tbaa !210
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
  creg_r11 = cr(0,18);
  crmax(0,18) = max(crmax(0,18),cr(0,18));
  caddr[0] = max(caddr[0],0);
  if(cr(0,18) < cw(0,18)) {
    r11 = buff(0,18);
  } else {
    if(pw(0,18) != co(18,cr(0,18))) {
      ASSUME(cr(0,18) >= old_cr);
    }
    pw(0,18) = co(18,cr(0,18));
    r11 = mem(18,cr(0,18));
  }
  ASSUME(creturn[0] >= cr(0,18));

  //   %call40 = call i32 @pthread_join(i64 noundef %10, i8** noundef null), !dbg !218
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
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,23+0));
  ASSUME(cdy[0] >= cw(0,18+0));
  ASSUME(cdy[0] >= cw(0,19+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cw(0,20+0));
  ASSUME(cdy[0] >= cw(0,21+0));
  ASSUME(cdy[0] >= cw(0,22+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,0+6));
  ASSUME(cdy[0] >= cr(0,0+7));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,23+0));
  ASSUME(cdy[0] >= cr(0,18+0));
  ASSUME(cdy[0] >= cr(0,19+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(cdy[0] >= cr(0,20+0));
  ASSUME(cdy[0] >= cr(0,21+0));
  ASSUME(cdy[0] >= cr(0,22+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[3]);

  //   %11 = load i64, i64* %thr3, align 8, !dbg !219, !tbaa !210
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
  creg_r12 = cr(0,19);
  crmax(0,19) = max(crmax(0,19),cr(0,19));
  caddr[0] = max(caddr[0],0);
  if(cr(0,19) < cw(0,19)) {
    r12 = buff(0,19);
  } else {
    if(pw(0,19) != co(19,cr(0,19))) {
      ASSUME(cr(0,19) >= old_cr);
    }
    pw(0,19) = co(19,cr(0,19));
    r12 = mem(19,cr(0,19));
  }
  ASSUME(creturn[0] >= cr(0,19));

  //   %call41 = call i32 @pthread_join(i64 noundef %11, i8** noundef null), !dbg !220
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
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,23+0));
  ASSUME(cdy[0] >= cw(0,18+0));
  ASSUME(cdy[0] >= cw(0,19+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cw(0,20+0));
  ASSUME(cdy[0] >= cw(0,21+0));
  ASSUME(cdy[0] >= cw(0,22+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,0+6));
  ASSUME(cdy[0] >= cr(0,0+7));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,23+0));
  ASSUME(cdy[0] >= cr(0,18+0));
  ASSUME(cdy[0] >= cr(0,19+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(cdy[0] >= cr(0,20+0));
  ASSUME(cdy[0] >= cr(0,21+0));
  ASSUME(cdy[0] >= cr(0,22+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[4]);

  //   %12 = load i64, i64* %thr4, align 8, !dbg !221, !tbaa !210
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

  //   %call42 = call i32 @pthread_join(i64 noundef %12, i8** noundef null), !dbg !222
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
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,23+0));
  ASSUME(cdy[0] >= cw(0,18+0));
  ASSUME(cdy[0] >= cw(0,19+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cw(0,20+0));
  ASSUME(cdy[0] >= cw(0,21+0));
  ASSUME(cdy[0] >= cw(0,22+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,0+6));
  ASSUME(cdy[0] >= cr(0,0+7));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,23+0));
  ASSUME(cdy[0] >= cr(0,18+0));
  ASSUME(cdy[0] >= cr(0,19+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(cdy[0] >= cr(0,20+0));
  ASSUME(cdy[0] >= cr(0,21+0));
  ASSUME(cdy[0] >= cr(0,22+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[5]);

  //   %13 = load i64, i64* %thr5, align 8, !dbg !223, !tbaa !210
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

  //   %call43 = call i32 @pthread_join(i64 noundef %13, i8** noundef null), !dbg !224
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
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,23+0));
  ASSUME(cdy[0] >= cw(0,18+0));
  ASSUME(cdy[0] >= cw(0,19+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cw(0,20+0));
  ASSUME(cdy[0] >= cw(0,21+0));
  ASSUME(cdy[0] >= cw(0,22+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,0+6));
  ASSUME(cdy[0] >= cr(0,0+7));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,23+0));
  ASSUME(cdy[0] >= cr(0,18+0));
  ASSUME(cdy[0] >= cr(0,19+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(cdy[0] >= cr(0,20+0));
  ASSUME(cdy[0] >= cr(0,21+0));
  ASSUME(cdy[0] >= cr(0,22+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[6]);

  //   %14 = load i64, i64* %thr6, align 8, !dbg !225, !tbaa !210
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

  //   %call44 = call i32 @pthread_join(i64 noundef %14, i8** noundef null), !dbg !226
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
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,23+0));
  ASSUME(cdy[0] >= cw(0,18+0));
  ASSUME(cdy[0] >= cw(0,19+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cw(0,20+0));
  ASSUME(cdy[0] >= cw(0,21+0));
  ASSUME(cdy[0] >= cw(0,22+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,0+6));
  ASSUME(cdy[0] >= cr(0,0+7));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,23+0));
  ASSUME(cdy[0] >= cr(0,18+0));
  ASSUME(cdy[0] >= cr(0,19+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(cdy[0] >= cr(0,20+0));
  ASSUME(cdy[0] >= cr(0,21+0));
  ASSUME(cdy[0] >= cr(0,22+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[7]);

  //   %15 = load i64, i64* %thr7, align 8, !dbg !227, !tbaa !210
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

  //   %call45 = call i32 @pthread_join(i64 noundef %15, i8** noundef null), !dbg !228
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
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,23+0));
  ASSUME(cdy[0] >= cw(0,18+0));
  ASSUME(cdy[0] >= cw(0,19+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cw(0,20+0));
  ASSUME(cdy[0] >= cw(0,21+0));
  ASSUME(cdy[0] >= cw(0,22+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,0+6));
  ASSUME(cdy[0] >= cr(0,0+7));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,23+0));
  ASSUME(cdy[0] >= cr(0,18+0));
  ASSUME(cdy[0] >= cr(0,19+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(cdy[0] >= cr(0,20+0));
  ASSUME(cdy[0] >= cr(0,21+0));
  ASSUME(cdy[0] >= cr(0,22+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[8]);

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X0_1, metadata !338, metadata !DIExpression()), !dbg !453

  //   %16 = load atomic i64, i64* @atom_0_X0_1 seq_cst, align 8, !dbg !230
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

  //   call void @llvm.dbg.value(metadata i64 %16, metadata !340, metadata !DIExpression()), !dbg !453

  //   %conv = trunc i64 %16 to i32, !dbg !231

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !337, metadata !DIExpression()), !dbg !376

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X0_1, metadata !342, metadata !DIExpression()), !dbg !456

  //   %17 = load atomic i64, i64* @atom_1_X0_1 seq_cst, align 8, !dbg !233
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

  //   call void @llvm.dbg.value(metadata i64 %17, metadata !344, metadata !DIExpression()), !dbg !456

  //   %conv49 = trunc i64 %17 to i32, !dbg !234

  //   call void @llvm.dbg.value(metadata i32 %conv49, metadata !341, metadata !DIExpression()), !dbg !376

  //   call void @llvm.dbg.value(metadata i64* @atom_2_X0_1, metadata !346, metadata !DIExpression()), !dbg !459

  //   %18 = load atomic i64, i64* @atom_2_X0_1 seq_cst, align 8, !dbg !236
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

  //   call void @llvm.dbg.value(metadata i64 %18, metadata !348, metadata !DIExpression()), !dbg !459

  //   %conv53 = trunc i64 %18 to i32, !dbg !237

  //   call void @llvm.dbg.value(metadata i32 %conv53, metadata !345, metadata !DIExpression()), !dbg !376

  //   call void @llvm.dbg.value(metadata i64* @atom_3_X0_1, metadata !350, metadata !DIExpression()), !dbg !462

  //   %19 = load atomic i64, i64* @atom_3_X0_1 seq_cst, align 8, !dbg !239
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

  //   call void @llvm.dbg.value(metadata i64 %19, metadata !352, metadata !DIExpression()), !dbg !462

  //   %conv57 = trunc i64 %19 to i32, !dbg !240

  //   call void @llvm.dbg.value(metadata i32 %conv57, metadata !349, metadata !DIExpression()), !dbg !376

  //   call void @llvm.dbg.value(metadata i64* @atom_4_X0_1, metadata !354, metadata !DIExpression()), !dbg !465

  //   %20 = load atomic i64, i64* @atom_4_X0_1 seq_cst, align 8, !dbg !242
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

  //   call void @llvm.dbg.value(metadata i64 %20, metadata !356, metadata !DIExpression()), !dbg !465

  //   %conv61 = trunc i64 %20 to i32, !dbg !243

  //   call void @llvm.dbg.value(metadata i32 %conv61, metadata !353, metadata !DIExpression()), !dbg !376

  //   call void @llvm.dbg.value(metadata i64* @atom_5_X0_1, metadata !358, metadata !DIExpression()), !dbg !468

  //   %21 = load atomic i64, i64* @atom_5_X0_1 seq_cst, align 8, !dbg !245
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

  //   call void @llvm.dbg.value(metadata i64 %21, metadata !360, metadata !DIExpression()), !dbg !468

  //   %conv65 = trunc i64 %21 to i32, !dbg !246

  //   call void @llvm.dbg.value(metadata i32 %conv65, metadata !357, metadata !DIExpression()), !dbg !376

  //   call void @llvm.dbg.value(metadata i64* @atom_6_X0_1, metadata !362, metadata !DIExpression()), !dbg !471

  //   %22 = load atomic i64, i64* @atom_6_X0_1 seq_cst, align 8, !dbg !248
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
  creg_r23 = cr(0,14);
  crmax(0,14) = max(crmax(0,14),cr(0,14));
  caddr[0] = max(caddr[0],0);
  if(cr(0,14) < cw(0,14)) {
    r23 = buff(0,14);
  } else {
    if(pw(0,14) != co(14,cr(0,14))) {
      ASSUME(cr(0,14) >= old_cr);
    }
    pw(0,14) = co(14,cr(0,14));
    r23 = mem(14,cr(0,14));
  }
  ASSUME(creturn[0] >= cr(0,14));

  //   call void @llvm.dbg.value(metadata i64 %22, metadata !364, metadata !DIExpression()), !dbg !471

  //   %conv69 = trunc i64 %22 to i32, !dbg !249

  //   call void @llvm.dbg.value(metadata i32 %conv69, metadata !361, metadata !DIExpression()), !dbg !376

  //   call void @llvm.dbg.value(metadata i64* @atom_7_X0_1, metadata !366, metadata !DIExpression()), !dbg !474

  //   %23 = load atomic i64, i64* @atom_7_X0_1 seq_cst, align 8, !dbg !251
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
  creg_r24 = cr(0,15);
  crmax(0,15) = max(crmax(0,15),cr(0,15));
  caddr[0] = max(caddr[0],0);
  if(cr(0,15) < cw(0,15)) {
    r24 = buff(0,15);
  } else {
    if(pw(0,15) != co(15,cr(0,15))) {
      ASSUME(cr(0,15) >= old_cr);
    }
    pw(0,15) = co(15,cr(0,15));
    r24 = mem(15,cr(0,15));
  }
  ASSUME(creturn[0] >= cr(0,15));

  //   call void @llvm.dbg.value(metadata i64 %23, metadata !368, metadata !DIExpression()), !dbg !474

  //   %conv73 = trunc i64 %23 to i32, !dbg !252

  //   call void @llvm.dbg.value(metadata i32 %conv73, metadata !365, metadata !DIExpression()), !dbg !376

  //   %and = and i32 %conv69, %conv73, !dbg !253
  creg_r25 = max(creg_r23,creg_r24);
  ASSUME(active[creg_r25] == 0);
  r25 = r23 & r24;

  //   call void @llvm.dbg.value(metadata i32 %and, metadata !369, metadata !DIExpression()), !dbg !376

  //   %and74 = and i32 %conv65, %and, !dbg !254
  creg_r26 = max(creg_r22,creg_r25);
  ASSUME(active[creg_r26] == 0);
  r26 = r22 & r25;

  //   call void @llvm.dbg.value(metadata i32 %and74, metadata !370, metadata !DIExpression()), !dbg !376

  //   %and75 = and i32 %conv61, %and74, !dbg !255
  creg_r27 = max(creg_r21,creg_r26);
  ASSUME(active[creg_r27] == 0);
  r27 = r21 & r26;

  //   call void @llvm.dbg.value(metadata i32 %and75, metadata !371, metadata !DIExpression()), !dbg !376

  //   %and76 = and i32 %conv57, %and75, !dbg !256
  creg_r28 = max(creg_r20,creg_r27);
  ASSUME(active[creg_r28] == 0);
  r28 = r20 & r27;

  //   call void @llvm.dbg.value(metadata i32 %and76, metadata !372, metadata !DIExpression()), !dbg !376

  //   %and77 = and i32 %conv53, %and76, !dbg !257
  creg_r29 = max(creg_r19,creg_r28);
  ASSUME(active[creg_r29] == 0);
  r29 = r19 & r28;

  //   call void @llvm.dbg.value(metadata i32 %and77, metadata !373, metadata !DIExpression()), !dbg !376

  //   %and78 = and i32 %conv49, %and77, !dbg !258
  creg_r30 = max(creg_r18,creg_r29);
  ASSUME(active[creg_r30] == 0);
  r30 = r18 & r29;

  //   call void @llvm.dbg.value(metadata i32 %and78, metadata !374, metadata !DIExpression()), !dbg !376

  //   %and79 = and i32 %conv, %and78, !dbg !259
  creg_r31 = max(creg_r17,creg_r30);
  ASSUME(active[creg_r31] == 0);
  r31 = r17 & r30;

  //   call void @llvm.dbg.value(metadata i32 %and79, metadata !375, metadata !DIExpression()), !dbg !376

  //   %cmp = icmp eq i32 %and79, 1, !dbg !260

  //   br i1 %cmp, label %if.then, label %if.end, !dbg !262
  old_cctrl = cctrl[0];
  cctrl[0] = get_rng(0,NCONTEXT-1);
  ASSUME(cctrl[0] >= old_cctrl);
  ASSUME(cctrl[0] >= creg_r31);
  ASSUME(cctrl[0] >= 0);
  if((r31==1)) {
    goto T0BLOCK1;
  } else {
    goto T0BLOCK2;
  }

T0BLOCK1:
  //   call void @__assert_fail(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([124 x i8], [124 x i8]* @.str.1, i64 0, i64 0), i32 noundef 162, i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #8, !dbg !263

  //   unreachable, !dbg !263
  r32 = 1;

T0BLOCK2:
  //   %24 = bitcast i64* %thr7 to i8*, !dbg !266

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %24) #7, !dbg !266

  //   %25 = bitcast i64* %thr6 to i8*, !dbg !266

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %25) #7, !dbg !266

  //   %26 = bitcast i64* %thr5 to i8*, !dbg !266

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %26) #7, !dbg !266

  //   %27 = bitcast i64* %thr4 to i8*, !dbg !266

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %27) #7, !dbg !266

  //   %28 = bitcast i64* %thr3 to i8*, !dbg !266

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %28) #7, !dbg !266

  //   %29 = bitcast i64* %thr2 to i8*, !dbg !266

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %29) #7, !dbg !266

  //   %30 = bitcast i64* %thr1 to i8*, !dbg !266

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %30) #7, !dbg !266

  //   %31 = bitcast i64* %thr0 to i8*, !dbg !266

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %31) #7, !dbg !266

  //   ret i32 0, !dbg !267
  ret_thread_0 = 0;



  ASSERT(r32== 0);

}
