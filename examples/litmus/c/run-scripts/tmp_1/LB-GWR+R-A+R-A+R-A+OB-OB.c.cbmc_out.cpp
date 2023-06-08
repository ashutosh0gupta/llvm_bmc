// 0:vars:6
// 8:atom_1_X0_1:1
// 9:atom_2_X0_1:1
// 10:atom_3_X0_1:1
// 6:atom_4_X2_0:1
// 11:atom_4_X0_1:1
// 7:atom_5_X1_0:1
// 12:thr0:1
// 13:thr1:1
// 14:thr2:1
// 15:thr3:1
// 16:thr4:1
// 17:thr5:1
#define ADDRSIZE 18
#define NPROC 7
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
  cl[6] = 0;
  cdy[6] = 0;
  cds[6] = 0;
  cdl[6] = 0;
  cisb[6] = 0;
  caddr[6] = 0;
  cctrl[6] = 0;
  cstart[6] = get_rng(0,NCONTEXT-1);
  creturn[6] = get_rng(0,NCONTEXT-1);
  // Dumping initializations
  mem(0+0,0) = 0;
  mem(0+1,0) = 0;
  mem(0+2,0) = 0;
  mem(0+3,0) = 0;
  mem(0+4,0) = 0;
  mem(0+5,0) = 0;
  mem(8+0,0) = 0;
  mem(9+0,0) = 0;
  mem(10+0,0) = 0;
  mem(6+0,0) = 0;
  mem(11+0,0) = 0;
  mem(7+0,0) = 0;
  mem(12+0,0) = 0;
  mem(13+0,0) = 0;
  mem(14+0,0) = 0;
  mem(15+0,0) = 0;
  mem(16+0,0) = 0;
  mem(17+0,0) = 0;
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
  // Dumping thread 1
  int ret_thread_1 = 0;
  cdy[1] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[1] >= cstart[1]);
T1BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !43, metadata !DIExpression()), !dbg !52

  //   br label %label_1, !dbg !53
  goto T1BLOCK1;

T1BLOCK1:
  //   call void @llvm.dbg.label(metadata !51), !dbg !54

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 1), metadata !44, metadata !DIExpression()), !dbg !55

  //   call void @llvm.dbg.value(metadata i64 3, metadata !47, metadata !DIExpression()), !dbg !55

  //   store atomic i64 3, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !56
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
  buff(1,0+1*1) = 3;
  mem(0+1*1,cw(1,0+1*1)) = 3;
  co(0+1*1,cw(1,0+1*1))+=1;
  delta(0+1*1,cw(1,0+1*1)) = -1;
  ASSUME(creturn[1] >= cw(1,0+1*1));

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 0), metadata !48, metadata !DIExpression()), !dbg !57

  //   call void @llvm.dbg.value(metadata i64 1, metadata !50, metadata !DIExpression()), !dbg !57

  //   store atomic i64 1, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 0) release, align 8, !dbg !58
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
  ASSUME(cw(1,0) >= cr(1,8+0));
  ASSUME(cw(1,0) >= cr(1,9+0));
  ASSUME(cw(1,0) >= cr(1,10+0));
  ASSUME(cw(1,0) >= cr(1,6+0));
  ASSUME(cw(1,0) >= cr(1,11+0));
  ASSUME(cw(1,0) >= cr(1,7+0));
  ASSUME(cw(1,0) >= cr(1,12+0));
  ASSUME(cw(1,0) >= cr(1,13+0));
  ASSUME(cw(1,0) >= cr(1,14+0));
  ASSUME(cw(1,0) >= cr(1,15+0));
  ASSUME(cw(1,0) >= cr(1,16+0));
  ASSUME(cw(1,0) >= cr(1,17+0));
  ASSUME(cw(1,0) >= cw(1,0+0));
  ASSUME(cw(1,0) >= cw(1,0+1));
  ASSUME(cw(1,0) >= cw(1,0+2));
  ASSUME(cw(1,0) >= cw(1,0+3));
  ASSUME(cw(1,0) >= cw(1,0+4));
  ASSUME(cw(1,0) >= cw(1,0+5));
  ASSUME(cw(1,0) >= cw(1,8+0));
  ASSUME(cw(1,0) >= cw(1,9+0));
  ASSUME(cw(1,0) >= cw(1,10+0));
  ASSUME(cw(1,0) >= cw(1,6+0));
  ASSUME(cw(1,0) >= cw(1,11+0));
  ASSUME(cw(1,0) >= cw(1,7+0));
  ASSUME(cw(1,0) >= cw(1,12+0));
  ASSUME(cw(1,0) >= cw(1,13+0));
  ASSUME(cw(1,0) >= cw(1,14+0));
  ASSUME(cw(1,0) >= cw(1,15+0));
  ASSUME(cw(1,0) >= cw(1,16+0));
  ASSUME(cw(1,0) >= cw(1,17+0));
  // Update
  caddr[1] = max(caddr[1],0);
  buff(1,0) = 1;
  mem(0,cw(1,0)) = 1;
  co(0,cw(1,0))+=1;
  delta(0,cw(1,0)) = -1;
  is(1,0) = iw(1,0);
  cs(1,0) = cw(1,0);
  ASSUME(creturn[1] >= cw(1,0));

  //   ret i8* null, !dbg !59
  ret_thread_1 = (- 1);


  // Dumping thread 2
  int ret_thread_2 = 0;
  cdy[2] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[2] >= cstart[2]);
T2BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !62, metadata !DIExpression()), !dbg !76

  //   br label %label_2, !dbg !59
  goto T2BLOCK1;

T2BLOCK1:
  //   call void @llvm.dbg.label(metadata !75), !dbg !78

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 0), metadata !65, metadata !DIExpression()), !dbg !79

  //   %0 = load atomic i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 0) acquire, align 8, !dbg !62
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
  ASSUME(cr(2,0) >= cs(2,8+0));
  ASSUME(cr(2,0) >= cs(2,9+0));
  ASSUME(cr(2,0) >= cs(2,10+0));
  ASSUME(cr(2,0) >= cs(2,6+0));
  ASSUME(cr(2,0) >= cs(2,11+0));
  ASSUME(cr(2,0) >= cs(2,7+0));
  ASSUME(cr(2,0) >= cs(2,12+0));
  ASSUME(cr(2,0) >= cs(2,13+0));
  ASSUME(cr(2,0) >= cs(2,14+0));
  ASSUME(cr(2,0) >= cs(2,15+0));
  ASSUME(cr(2,0) >= cs(2,16+0));
  ASSUME(cr(2,0) >= cs(2,17+0));
  // Update
  creg_r0 = cr(2,0);
  crmax(2,0) = max(crmax(2,0),cr(2,0));
  caddr[2] = max(caddr[2],0);
  if(cr(2,0) < cw(2,0)) {
    r0 = buff(2,0);
  } else {
    if(pw(2,0) != co(0,cr(2,0))) {
      ASSUME(cr(2,0) >= old_cr);
    }
    pw(2,0) = co(0,cr(2,0));
    r0 = mem(0,cr(2,0));
  }
  cl[2] = max(cl[2],cr(2,0));
  ASSUME(creturn[2] >= cr(2,0));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !67, metadata !DIExpression()), !dbg !79

  //   %conv = trunc i64 %0 to i32, !dbg !63

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !63, metadata !DIExpression()), !dbg !76

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 2), metadata !68, metadata !DIExpression()), !dbg !82

  //   call void @llvm.dbg.value(metadata i64 1, metadata !70, metadata !DIExpression()), !dbg !82

  //   store atomic i64 1, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 2) release, align 8, !dbg !65
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
  ASSUME(cw(2,0+2*1) >= cr(2,8+0));
  ASSUME(cw(2,0+2*1) >= cr(2,9+0));
  ASSUME(cw(2,0+2*1) >= cr(2,10+0));
  ASSUME(cw(2,0+2*1) >= cr(2,6+0));
  ASSUME(cw(2,0+2*1) >= cr(2,11+0));
  ASSUME(cw(2,0+2*1) >= cr(2,7+0));
  ASSUME(cw(2,0+2*1) >= cr(2,12+0));
  ASSUME(cw(2,0+2*1) >= cr(2,13+0));
  ASSUME(cw(2,0+2*1) >= cr(2,14+0));
  ASSUME(cw(2,0+2*1) >= cr(2,15+0));
  ASSUME(cw(2,0+2*1) >= cr(2,16+0));
  ASSUME(cw(2,0+2*1) >= cr(2,17+0));
  ASSUME(cw(2,0+2*1) >= cw(2,0+0));
  ASSUME(cw(2,0+2*1) >= cw(2,0+1));
  ASSUME(cw(2,0+2*1) >= cw(2,0+2));
  ASSUME(cw(2,0+2*1) >= cw(2,0+3));
  ASSUME(cw(2,0+2*1) >= cw(2,0+4));
  ASSUME(cw(2,0+2*1) >= cw(2,0+5));
  ASSUME(cw(2,0+2*1) >= cw(2,8+0));
  ASSUME(cw(2,0+2*1) >= cw(2,9+0));
  ASSUME(cw(2,0+2*1) >= cw(2,10+0));
  ASSUME(cw(2,0+2*1) >= cw(2,6+0));
  ASSUME(cw(2,0+2*1) >= cw(2,11+0));
  ASSUME(cw(2,0+2*1) >= cw(2,7+0));
  ASSUME(cw(2,0+2*1) >= cw(2,12+0));
  ASSUME(cw(2,0+2*1) >= cw(2,13+0));
  ASSUME(cw(2,0+2*1) >= cw(2,14+0));
  ASSUME(cw(2,0+2*1) >= cw(2,15+0));
  ASSUME(cw(2,0+2*1) >= cw(2,16+0));
  ASSUME(cw(2,0+2*1) >= cw(2,17+0));
  // Update
  caddr[2] = max(caddr[2],0);
  buff(2,0+2*1) = 1;
  mem(0+2*1,cw(2,0+2*1)) = 1;
  co(0+2*1,cw(2,0+2*1))+=1;
  delta(0+2*1,cw(2,0+2*1)) = -1;
  is(2,0+2*1) = iw(2,0+2*1);
  cs(2,0+2*1) = cw(2,0+2*1);
  ASSUME(creturn[2] >= cw(2,0+2*1));

  //   %cmp = icmp eq i32 %conv, 1, !dbg !66

  //   %conv1 = zext i1 %cmp to i32, !dbg !66

  //   call void @llvm.dbg.value(metadata i32 %conv1, metadata !71, metadata !DIExpression()), !dbg !76

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X0_1, metadata !72, metadata !DIExpression()), !dbg !85

  //   %1 = zext i32 %conv1 to i64

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !74, metadata !DIExpression()), !dbg !85

  //   store atomic i64 %1, i64* @atom_1_X0_1 seq_cst, align 8, !dbg !68
  // ST: Guess
  iw(2,8) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW 
  old_cw = cw(2,8);
  cw(2,8) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(2,8)] == 2);
  ASSUME(active[cw(2,8)] == 2);
  ASSUME(sforbid(8,cw(2,8))== 0);
  ASSUME(iw(2,8) >= max(creg_r0,0));
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
  buff(2,8) = (r0==1);
  mem(8,cw(2,8)) = (r0==1);
  co(8,cw(2,8))+=1;
  delta(8,cw(2,8)) = -1;
  ASSUME(creturn[2] >= cw(2,8));

  //   ret i8* null, !dbg !69
  ret_thread_2 = (- 1);


  // Dumping thread 3
  int ret_thread_3 = 0;
  cdy[3] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[3] >= cstart[3]);
T3BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !90, metadata !DIExpression()), !dbg !103

  //   br label %label_3, !dbg !59
  goto T3BLOCK1;

T3BLOCK1:
  //   call void @llvm.dbg.label(metadata !102), !dbg !105

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 2), metadata !92, metadata !DIExpression()), !dbg !106

  //   %0 = load atomic i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 2) acquire, align 8, !dbg !62
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
  ASSUME(cr(3,0+2*1) >= cs(3,8+0));
  ASSUME(cr(3,0+2*1) >= cs(3,9+0));
  ASSUME(cr(3,0+2*1) >= cs(3,10+0));
  ASSUME(cr(3,0+2*1) >= cs(3,6+0));
  ASSUME(cr(3,0+2*1) >= cs(3,11+0));
  ASSUME(cr(3,0+2*1) >= cs(3,7+0));
  ASSUME(cr(3,0+2*1) >= cs(3,12+0));
  ASSUME(cr(3,0+2*1) >= cs(3,13+0));
  ASSUME(cr(3,0+2*1) >= cs(3,14+0));
  ASSUME(cr(3,0+2*1) >= cs(3,15+0));
  ASSUME(cr(3,0+2*1) >= cs(3,16+0));
  ASSUME(cr(3,0+2*1) >= cs(3,17+0));
  // Update
  creg_r1 = cr(3,0+2*1);
  crmax(3,0+2*1) = max(crmax(3,0+2*1),cr(3,0+2*1));
  caddr[3] = max(caddr[3],0);
  if(cr(3,0+2*1) < cw(3,0+2*1)) {
    r1 = buff(3,0+2*1);
  } else {
    if(pw(3,0+2*1) != co(0+2*1,cr(3,0+2*1))) {
      ASSUME(cr(3,0+2*1) >= old_cr);
    }
    pw(3,0+2*1) = co(0+2*1,cr(3,0+2*1));
    r1 = mem(0+2*1,cr(3,0+2*1));
  }
  cl[3] = max(cl[3],cr(3,0+2*1));
  ASSUME(creturn[3] >= cr(3,0+2*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !94, metadata !DIExpression()), !dbg !106

  //   %conv = trunc i64 %0 to i32, !dbg !63

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !91, metadata !DIExpression()), !dbg !103

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 3), metadata !95, metadata !DIExpression()), !dbg !109

  //   call void @llvm.dbg.value(metadata i64 1, metadata !97, metadata !DIExpression()), !dbg !109

  //   store atomic i64 1, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 3) release, align 8, !dbg !65
  // ST: Guess
  //   : Release
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
  ASSUME(cw(3,0+3*1) >= cr(3,0+0));
  ASSUME(cw(3,0+3*1) >= cr(3,0+1));
  ASSUME(cw(3,0+3*1) >= cr(3,0+2));
  ASSUME(cw(3,0+3*1) >= cr(3,0+3));
  ASSUME(cw(3,0+3*1) >= cr(3,0+4));
  ASSUME(cw(3,0+3*1) >= cr(3,0+5));
  ASSUME(cw(3,0+3*1) >= cr(3,8+0));
  ASSUME(cw(3,0+3*1) >= cr(3,9+0));
  ASSUME(cw(3,0+3*1) >= cr(3,10+0));
  ASSUME(cw(3,0+3*1) >= cr(3,6+0));
  ASSUME(cw(3,0+3*1) >= cr(3,11+0));
  ASSUME(cw(3,0+3*1) >= cr(3,7+0));
  ASSUME(cw(3,0+3*1) >= cr(3,12+0));
  ASSUME(cw(3,0+3*1) >= cr(3,13+0));
  ASSUME(cw(3,0+3*1) >= cr(3,14+0));
  ASSUME(cw(3,0+3*1) >= cr(3,15+0));
  ASSUME(cw(3,0+3*1) >= cr(3,16+0));
  ASSUME(cw(3,0+3*1) >= cr(3,17+0));
  ASSUME(cw(3,0+3*1) >= cw(3,0+0));
  ASSUME(cw(3,0+3*1) >= cw(3,0+1));
  ASSUME(cw(3,0+3*1) >= cw(3,0+2));
  ASSUME(cw(3,0+3*1) >= cw(3,0+3));
  ASSUME(cw(3,0+3*1) >= cw(3,0+4));
  ASSUME(cw(3,0+3*1) >= cw(3,0+5));
  ASSUME(cw(3,0+3*1) >= cw(3,8+0));
  ASSUME(cw(3,0+3*1) >= cw(3,9+0));
  ASSUME(cw(3,0+3*1) >= cw(3,10+0));
  ASSUME(cw(3,0+3*1) >= cw(3,6+0));
  ASSUME(cw(3,0+3*1) >= cw(3,11+0));
  ASSUME(cw(3,0+3*1) >= cw(3,7+0));
  ASSUME(cw(3,0+3*1) >= cw(3,12+0));
  ASSUME(cw(3,0+3*1) >= cw(3,13+0));
  ASSUME(cw(3,0+3*1) >= cw(3,14+0));
  ASSUME(cw(3,0+3*1) >= cw(3,15+0));
  ASSUME(cw(3,0+3*1) >= cw(3,16+0));
  ASSUME(cw(3,0+3*1) >= cw(3,17+0));
  // Update
  caddr[3] = max(caddr[3],0);
  buff(3,0+3*1) = 1;
  mem(0+3*1,cw(3,0+3*1)) = 1;
  co(0+3*1,cw(3,0+3*1))+=1;
  delta(0+3*1,cw(3,0+3*1)) = -1;
  is(3,0+3*1) = iw(3,0+3*1);
  cs(3,0+3*1) = cw(3,0+3*1);
  ASSUME(creturn[3] >= cw(3,0+3*1));

  //   %cmp = icmp eq i32 %conv, 1, !dbg !66

  //   %conv1 = zext i1 %cmp to i32, !dbg !66

  //   call void @llvm.dbg.value(metadata i32 %conv1, metadata !98, metadata !DIExpression()), !dbg !103

  //   call void @llvm.dbg.value(metadata i64* @atom_2_X0_1, metadata !99, metadata !DIExpression()), !dbg !112

  //   %1 = zext i32 %conv1 to i64

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !101, metadata !DIExpression()), !dbg !112

  //   store atomic i64 %1, i64* @atom_2_X0_1 seq_cst, align 8, !dbg !68
  // ST: Guess
  iw(3,9) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STIW 
  old_cw = cw(3,9);
  cw(3,9) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(3,9)] == 3);
  ASSUME(active[cw(3,9)] == 3);
  ASSUME(sforbid(9,cw(3,9))== 0);
  ASSUME(iw(3,9) >= max(creg_r1,0));
  ASSUME(iw(3,9) >= 0);
  ASSUME(cw(3,9) >= iw(3,9));
  ASSUME(cw(3,9) >= old_cw);
  ASSUME(cw(3,9) >= cr(3,9));
  ASSUME(cw(3,9) >= cl[3]);
  ASSUME(cw(3,9) >= cisb[3]);
  ASSUME(cw(3,9) >= cdy[3]);
  ASSUME(cw(3,9) >= cdl[3]);
  ASSUME(cw(3,9) >= cds[3]);
  ASSUME(cw(3,9) >= cctrl[3]);
  ASSUME(cw(3,9) >= caddr[3]);
  // Update
  caddr[3] = max(caddr[3],0);
  buff(3,9) = (r1==1);
  mem(9,cw(3,9)) = (r1==1);
  co(9,cw(3,9))+=1;
  delta(9,cw(3,9)) = -1;
  ASSUME(creturn[3] >= cw(3,9));

  //   ret i8* null, !dbg !69
  ret_thread_3 = (- 1);


  // Dumping thread 4
  int ret_thread_4 = 0;
  cdy[4] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[4] >= cstart[4]);
T4BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !117, metadata !DIExpression()), !dbg !130

  //   br label %label_4, !dbg !59
  goto T4BLOCK1;

T4BLOCK1:
  //   call void @llvm.dbg.label(metadata !129), !dbg !132

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 3), metadata !119, metadata !DIExpression()), !dbg !133

  //   %0 = load atomic i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 3) acquire, align 8, !dbg !62
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
  ASSUME(cr(4,0+3*1) >= cs(4,8+0));
  ASSUME(cr(4,0+3*1) >= cs(4,9+0));
  ASSUME(cr(4,0+3*1) >= cs(4,10+0));
  ASSUME(cr(4,0+3*1) >= cs(4,6+0));
  ASSUME(cr(4,0+3*1) >= cs(4,11+0));
  ASSUME(cr(4,0+3*1) >= cs(4,7+0));
  ASSUME(cr(4,0+3*1) >= cs(4,12+0));
  ASSUME(cr(4,0+3*1) >= cs(4,13+0));
  ASSUME(cr(4,0+3*1) >= cs(4,14+0));
  ASSUME(cr(4,0+3*1) >= cs(4,15+0));
  ASSUME(cr(4,0+3*1) >= cs(4,16+0));
  ASSUME(cr(4,0+3*1) >= cs(4,17+0));
  // Update
  creg_r2 = cr(4,0+3*1);
  crmax(4,0+3*1) = max(crmax(4,0+3*1),cr(4,0+3*1));
  caddr[4] = max(caddr[4],0);
  if(cr(4,0+3*1) < cw(4,0+3*1)) {
    r2 = buff(4,0+3*1);
  } else {
    if(pw(4,0+3*1) != co(0+3*1,cr(4,0+3*1))) {
      ASSUME(cr(4,0+3*1) >= old_cr);
    }
    pw(4,0+3*1) = co(0+3*1,cr(4,0+3*1));
    r2 = mem(0+3*1,cr(4,0+3*1));
  }
  cl[4] = max(cl[4],cr(4,0+3*1));
  ASSUME(creturn[4] >= cr(4,0+3*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !121, metadata !DIExpression()), !dbg !133

  //   %conv = trunc i64 %0 to i32, !dbg !63

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !118, metadata !DIExpression()), !dbg !130

  //   call void (...) @dmbsy(), !dbg !64
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
  ASSUME(cdy[4] >= cw(4,8+0));
  ASSUME(cdy[4] >= cw(4,9+0));
  ASSUME(cdy[4] >= cw(4,10+0));
  ASSUME(cdy[4] >= cw(4,6+0));
  ASSUME(cdy[4] >= cw(4,11+0));
  ASSUME(cdy[4] >= cw(4,7+0));
  ASSUME(cdy[4] >= cw(4,12+0));
  ASSUME(cdy[4] >= cw(4,13+0));
  ASSUME(cdy[4] >= cw(4,14+0));
  ASSUME(cdy[4] >= cw(4,15+0));
  ASSUME(cdy[4] >= cw(4,16+0));
  ASSUME(cdy[4] >= cw(4,17+0));
  ASSUME(cdy[4] >= cr(4,0+0));
  ASSUME(cdy[4] >= cr(4,0+1));
  ASSUME(cdy[4] >= cr(4,0+2));
  ASSUME(cdy[4] >= cr(4,0+3));
  ASSUME(cdy[4] >= cr(4,0+4));
  ASSUME(cdy[4] >= cr(4,0+5));
  ASSUME(cdy[4] >= cr(4,8+0));
  ASSUME(cdy[4] >= cr(4,9+0));
  ASSUME(cdy[4] >= cr(4,10+0));
  ASSUME(cdy[4] >= cr(4,6+0));
  ASSUME(cdy[4] >= cr(4,11+0));
  ASSUME(cdy[4] >= cr(4,7+0));
  ASSUME(cdy[4] >= cr(4,12+0));
  ASSUME(cdy[4] >= cr(4,13+0));
  ASSUME(cdy[4] >= cr(4,14+0));
  ASSUME(cdy[4] >= cr(4,15+0));
  ASSUME(cdy[4] >= cr(4,16+0));
  ASSUME(cdy[4] >= cr(4,17+0));
  ASSUME(creturn[4] >= cdy[4]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 4), metadata !122, metadata !DIExpression()), !dbg !137

  //   call void @llvm.dbg.value(metadata i64 1, metadata !124, metadata !DIExpression()), !dbg !137

  //   store atomic i64 1, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 4) monotonic, align 8, !dbg !66
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

  //   %cmp = icmp eq i32 %conv, 1, !dbg !67

  //   %conv1 = zext i1 %cmp to i32, !dbg !67

  //   call void @llvm.dbg.value(metadata i32 %conv1, metadata !125, metadata !DIExpression()), !dbg !130

  //   call void @llvm.dbg.value(metadata i64* @atom_3_X0_1, metadata !126, metadata !DIExpression()), !dbg !140

  //   %1 = zext i32 %conv1 to i64

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !128, metadata !DIExpression()), !dbg !140

  //   store atomic i64 %1, i64* @atom_3_X0_1 seq_cst, align 8, !dbg !69
  // ST: Guess
  iw(4,10) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STIW 
  old_cw = cw(4,10);
  cw(4,10) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(4,10)] == 4);
  ASSUME(active[cw(4,10)] == 4);
  ASSUME(sforbid(10,cw(4,10))== 0);
  ASSUME(iw(4,10) >= max(creg_r2,0));
  ASSUME(iw(4,10) >= 0);
  ASSUME(cw(4,10) >= iw(4,10));
  ASSUME(cw(4,10) >= old_cw);
  ASSUME(cw(4,10) >= cr(4,10));
  ASSUME(cw(4,10) >= cl[4]);
  ASSUME(cw(4,10) >= cisb[4]);
  ASSUME(cw(4,10) >= cdy[4]);
  ASSUME(cw(4,10) >= cdl[4]);
  ASSUME(cw(4,10) >= cds[4]);
  ASSUME(cw(4,10) >= cctrl[4]);
  ASSUME(cw(4,10) >= caddr[4]);
  // Update
  caddr[4] = max(caddr[4],0);
  buff(4,10) = (r2==1);
  mem(10,cw(4,10)) = (r2==1);
  co(10,cw(4,10))+=1;
  delta(10,cw(4,10)) = -1;
  ASSUME(creturn[4] >= cw(4,10));

  //   ret i8* null, !dbg !70
  ret_thread_4 = (- 1);


  // Dumping thread 5
  int ret_thread_5 = 0;
  cdy[5] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[5] >= cstart[5]);
T5BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !145, metadata !DIExpression()), !dbg !163

  //   br label %label_5, !dbg !64
  goto T5BLOCK1;

T5BLOCK1:
  //   call void @llvm.dbg.label(metadata !162), !dbg !165

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 4), metadata !147, metadata !DIExpression()), !dbg !166

  //   %0 = load atomic i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 4) monotonic, align 8, !dbg !67
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
  creg_r3 = cr(5,0+4*1);
  crmax(5,0+4*1) = max(crmax(5,0+4*1),cr(5,0+4*1));
  caddr[5] = max(caddr[5],0);
  if(cr(5,0+4*1) < cw(5,0+4*1)) {
    r3 = buff(5,0+4*1);
  } else {
    if(pw(5,0+4*1) != co(0+4*1,cr(5,0+4*1))) {
      ASSUME(cr(5,0+4*1) >= old_cr);
    }
    pw(5,0+4*1) = co(0+4*1,cr(5,0+4*1));
    r3 = mem(0+4*1,cr(5,0+4*1));
  }
  ASSUME(creturn[5] >= cr(5,0+4*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !149, metadata !DIExpression()), !dbg !166

  //   %conv = trunc i64 %0 to i32, !dbg !68

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !146, metadata !DIExpression()), !dbg !163

  //   call void (...) @dmbsy(), !dbg !69
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
  ASSUME(cdy[5] >= cw(5,8+0));
  ASSUME(cdy[5] >= cw(5,9+0));
  ASSUME(cdy[5] >= cw(5,10+0));
  ASSUME(cdy[5] >= cw(5,6+0));
  ASSUME(cdy[5] >= cw(5,11+0));
  ASSUME(cdy[5] >= cw(5,7+0));
  ASSUME(cdy[5] >= cw(5,12+0));
  ASSUME(cdy[5] >= cw(5,13+0));
  ASSUME(cdy[5] >= cw(5,14+0));
  ASSUME(cdy[5] >= cw(5,15+0));
  ASSUME(cdy[5] >= cw(5,16+0));
  ASSUME(cdy[5] >= cw(5,17+0));
  ASSUME(cdy[5] >= cr(5,0+0));
  ASSUME(cdy[5] >= cr(5,0+1));
  ASSUME(cdy[5] >= cr(5,0+2));
  ASSUME(cdy[5] >= cr(5,0+3));
  ASSUME(cdy[5] >= cr(5,0+4));
  ASSUME(cdy[5] >= cr(5,0+5));
  ASSUME(cdy[5] >= cr(5,8+0));
  ASSUME(cdy[5] >= cr(5,9+0));
  ASSUME(cdy[5] >= cr(5,10+0));
  ASSUME(cdy[5] >= cr(5,6+0));
  ASSUME(cdy[5] >= cr(5,11+0));
  ASSUME(cdy[5] >= cr(5,7+0));
  ASSUME(cdy[5] >= cr(5,12+0));
  ASSUME(cdy[5] >= cr(5,13+0));
  ASSUME(cdy[5] >= cr(5,14+0));
  ASSUME(cdy[5] >= cr(5,15+0));
  ASSUME(cdy[5] >= cr(5,16+0));
  ASSUME(cdy[5] >= cr(5,17+0));
  ASSUME(creturn[5] >= cdy[5]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 5), metadata !151, metadata !DIExpression()), !dbg !170

  //   %1 = load atomic i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 5) monotonic, align 8, !dbg !71
  // LD: Guess
  old_cr = cr(5,0+5*1);
  cr(5,0+5*1) = get_rng(0,NCONTEXT-1);// 5 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(5,0+5*1)] == 5);
  ASSUME(cr(5,0+5*1) >= iw(5,0+5*1));
  ASSUME(cr(5,0+5*1) >= 0);
  ASSUME(cr(5,0+5*1) >= cdy[5]);
  ASSUME(cr(5,0+5*1) >= cisb[5]);
  ASSUME(cr(5,0+5*1) >= cdl[5]);
  ASSUME(cr(5,0+5*1) >= cl[5]);
  // Update
  creg_r4 = cr(5,0+5*1);
  crmax(5,0+5*1) = max(crmax(5,0+5*1),cr(5,0+5*1));
  caddr[5] = max(caddr[5],0);
  if(cr(5,0+5*1) < cw(5,0+5*1)) {
    r4 = buff(5,0+5*1);
  } else {
    if(pw(5,0+5*1) != co(0+5*1,cr(5,0+5*1))) {
      ASSUME(cr(5,0+5*1) >= old_cr);
    }
    pw(5,0+5*1) = co(0+5*1,cr(5,0+5*1));
    r4 = mem(0+5*1,cr(5,0+5*1));
  }
  ASSUME(creturn[5] >= cr(5,0+5*1));

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !153, metadata !DIExpression()), !dbg !170

  //   %conv4 = trunc i64 %1 to i32, !dbg !72

  //   call void @llvm.dbg.value(metadata i32 %conv4, metadata !150, metadata !DIExpression()), !dbg !163

  //   %cmp = icmp eq i32 %conv4, 0, !dbg !73

  //   %conv5 = zext i1 %cmp to i32, !dbg !73

  //   call void @llvm.dbg.value(metadata i32 %conv5, metadata !154, metadata !DIExpression()), !dbg !163

  //   call void @llvm.dbg.value(metadata i64* @atom_4_X2_0, metadata !155, metadata !DIExpression()), !dbg !174

  //   %2 = zext i32 %conv5 to i64

  //   call void @llvm.dbg.value(metadata i64 %2, metadata !157, metadata !DIExpression()), !dbg !174

  //   store atomic i64 %2, i64* @atom_4_X2_0 seq_cst, align 8, !dbg !75
  // ST: Guess
  iw(5,6) = get_rng(0,NCONTEXT-1);// 5 ASSIGN STIW 
  old_cw = cw(5,6);
  cw(5,6) = get_rng(0,NCONTEXT-1);// 5 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(5,6)] == 5);
  ASSUME(active[cw(5,6)] == 5);
  ASSUME(sforbid(6,cw(5,6))== 0);
  ASSUME(iw(5,6) >= max(creg_r4,0));
  ASSUME(iw(5,6) >= 0);
  ASSUME(cw(5,6) >= iw(5,6));
  ASSUME(cw(5,6) >= old_cw);
  ASSUME(cw(5,6) >= cr(5,6));
  ASSUME(cw(5,6) >= cl[5]);
  ASSUME(cw(5,6) >= cisb[5]);
  ASSUME(cw(5,6) >= cdy[5]);
  ASSUME(cw(5,6) >= cdl[5]);
  ASSUME(cw(5,6) >= cds[5]);
  ASSUME(cw(5,6) >= cctrl[5]);
  ASSUME(cw(5,6) >= caddr[5]);
  // Update
  caddr[5] = max(caddr[5],0);
  buff(5,6) = (r4==0);
  mem(6,cw(5,6)) = (r4==0);
  co(6,cw(5,6))+=1;
  delta(6,cw(5,6)) = -1;
  ASSUME(creturn[5] >= cw(5,6));

  //   %cmp7 = icmp eq i32 %conv, 1, !dbg !76

  //   %conv8 = zext i1 %cmp7 to i32, !dbg !76

  //   call void @llvm.dbg.value(metadata i32 %conv8, metadata !158, metadata !DIExpression()), !dbg !163

  //   call void @llvm.dbg.value(metadata i64* @atom_4_X0_1, metadata !159, metadata !DIExpression()), !dbg !177

  //   %3 = zext i32 %conv8 to i64

  //   call void @llvm.dbg.value(metadata i64 %3, metadata !161, metadata !DIExpression()), !dbg !177

  //   store atomic i64 %3, i64* @atom_4_X0_1 seq_cst, align 8, !dbg !78
  // ST: Guess
  iw(5,11) = get_rng(0,NCONTEXT-1);// 5 ASSIGN STIW 
  old_cw = cw(5,11);
  cw(5,11) = get_rng(0,NCONTEXT-1);// 5 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(5,11)] == 5);
  ASSUME(active[cw(5,11)] == 5);
  ASSUME(sforbid(11,cw(5,11))== 0);
  ASSUME(iw(5,11) >= max(creg_r3,0));
  ASSUME(iw(5,11) >= 0);
  ASSUME(cw(5,11) >= iw(5,11));
  ASSUME(cw(5,11) >= old_cw);
  ASSUME(cw(5,11) >= cr(5,11));
  ASSUME(cw(5,11) >= cl[5]);
  ASSUME(cw(5,11) >= cisb[5]);
  ASSUME(cw(5,11) >= cdy[5]);
  ASSUME(cw(5,11) >= cdl[5]);
  ASSUME(cw(5,11) >= cds[5]);
  ASSUME(cw(5,11) >= cctrl[5]);
  ASSUME(cw(5,11) >= caddr[5]);
  // Update
  caddr[5] = max(caddr[5],0);
  buff(5,11) = (r3==1);
  mem(11,cw(5,11)) = (r3==1);
  co(11,cw(5,11))+=1;
  delta(11,cw(5,11)) = -1;
  ASSUME(creturn[5] >= cw(5,11));

  //   ret i8* null, !dbg !79
  ret_thread_5 = (- 1);


  // Dumping thread 6
  int ret_thread_6 = 0;
  cdy[6] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[6] >= cstart[6]);
T6BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !182, metadata !DIExpression()), !dbg !195

  //   br label %label_6, !dbg !59
  goto T6BLOCK1;

T6BLOCK1:
  //   call void @llvm.dbg.label(metadata !194), !dbg !197

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 5), metadata !183, metadata !DIExpression()), !dbg !198

  //   call void @llvm.dbg.value(metadata i64 1, metadata !185, metadata !DIExpression()), !dbg !198

  //   store atomic i64 1, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 5) monotonic, align 8, !dbg !62
  // ST: Guess
  iw(6,0+5*1) = get_rng(0,NCONTEXT-1);// 6 ASSIGN STIW 
  old_cw = cw(6,0+5*1);
  cw(6,0+5*1) = get_rng(0,NCONTEXT-1);// 6 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(6,0+5*1)] == 6);
  ASSUME(active[cw(6,0+5*1)] == 6);
  ASSUME(sforbid(0+5*1,cw(6,0+5*1))== 0);
  ASSUME(iw(6,0+5*1) >= 0);
  ASSUME(iw(6,0+5*1) >= 0);
  ASSUME(cw(6,0+5*1) >= iw(6,0+5*1));
  ASSUME(cw(6,0+5*1) >= old_cw);
  ASSUME(cw(6,0+5*1) >= cr(6,0+5*1));
  ASSUME(cw(6,0+5*1) >= cl[6]);
  ASSUME(cw(6,0+5*1) >= cisb[6]);
  ASSUME(cw(6,0+5*1) >= cdy[6]);
  ASSUME(cw(6,0+5*1) >= cdl[6]);
  ASSUME(cw(6,0+5*1) >= cds[6]);
  ASSUME(cw(6,0+5*1) >= cctrl[6]);
  ASSUME(cw(6,0+5*1) >= caddr[6]);
  // Update
  caddr[6] = max(caddr[6],0);
  buff(6,0+5*1) = 1;
  mem(0+5*1,cw(6,0+5*1)) = 1;
  co(0+5*1,cw(6,0+5*1))+=1;
  delta(0+5*1,cw(6,0+5*1)) = -1;
  ASSUME(creturn[6] >= cw(6,0+5*1));

  //   call void (...) @dmbsy(), !dbg !63
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
  ASSUME(cdy[6] >= cw(6,8+0));
  ASSUME(cdy[6] >= cw(6,9+0));
  ASSUME(cdy[6] >= cw(6,10+0));
  ASSUME(cdy[6] >= cw(6,6+0));
  ASSUME(cdy[6] >= cw(6,11+0));
  ASSUME(cdy[6] >= cw(6,7+0));
  ASSUME(cdy[6] >= cw(6,12+0));
  ASSUME(cdy[6] >= cw(6,13+0));
  ASSUME(cdy[6] >= cw(6,14+0));
  ASSUME(cdy[6] >= cw(6,15+0));
  ASSUME(cdy[6] >= cw(6,16+0));
  ASSUME(cdy[6] >= cw(6,17+0));
  ASSUME(cdy[6] >= cr(6,0+0));
  ASSUME(cdy[6] >= cr(6,0+1));
  ASSUME(cdy[6] >= cr(6,0+2));
  ASSUME(cdy[6] >= cr(6,0+3));
  ASSUME(cdy[6] >= cr(6,0+4));
  ASSUME(cdy[6] >= cr(6,0+5));
  ASSUME(cdy[6] >= cr(6,8+0));
  ASSUME(cdy[6] >= cr(6,9+0));
  ASSUME(cdy[6] >= cr(6,10+0));
  ASSUME(cdy[6] >= cr(6,6+0));
  ASSUME(cdy[6] >= cr(6,11+0));
  ASSUME(cdy[6] >= cr(6,7+0));
  ASSUME(cdy[6] >= cr(6,12+0));
  ASSUME(cdy[6] >= cr(6,13+0));
  ASSUME(cdy[6] >= cr(6,14+0));
  ASSUME(cdy[6] >= cr(6,15+0));
  ASSUME(cdy[6] >= cr(6,16+0));
  ASSUME(cdy[6] >= cr(6,17+0));
  ASSUME(creturn[6] >= cdy[6]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 1), metadata !187, metadata !DIExpression()), !dbg !201

  //   %0 = load atomic i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !65
  // LD: Guess
  old_cr = cr(6,0+1*1);
  cr(6,0+1*1) = get_rng(0,NCONTEXT-1);// 6 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(6,0+1*1)] == 6);
  ASSUME(cr(6,0+1*1) >= iw(6,0+1*1));
  ASSUME(cr(6,0+1*1) >= 0);
  ASSUME(cr(6,0+1*1) >= cdy[6]);
  ASSUME(cr(6,0+1*1) >= cisb[6]);
  ASSUME(cr(6,0+1*1) >= cdl[6]);
  ASSUME(cr(6,0+1*1) >= cl[6]);
  // Update
  creg_r5 = cr(6,0+1*1);
  crmax(6,0+1*1) = max(crmax(6,0+1*1),cr(6,0+1*1));
  caddr[6] = max(caddr[6],0);
  if(cr(6,0+1*1) < cw(6,0+1*1)) {
    r5 = buff(6,0+1*1);
  } else {
    if(pw(6,0+1*1) != co(0+1*1,cr(6,0+1*1))) {
      ASSUME(cr(6,0+1*1) >= old_cr);
    }
    pw(6,0+1*1) = co(0+1*1,cr(6,0+1*1));
    r5 = mem(0+1*1,cr(6,0+1*1));
  }
  ASSUME(creturn[6] >= cr(6,0+1*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !189, metadata !DIExpression()), !dbg !201

  //   %conv = trunc i64 %0 to i32, !dbg !66

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !186, metadata !DIExpression()), !dbg !195

  //   %cmp = icmp eq i32 %conv, 0, !dbg !67

  //   %conv1 = zext i1 %cmp to i32, !dbg !67

  //   call void @llvm.dbg.value(metadata i32 %conv1, metadata !190, metadata !DIExpression()), !dbg !195

  //   call void @llvm.dbg.value(metadata i64* @atom_5_X1_0, metadata !191, metadata !DIExpression()), !dbg !205

  //   %1 = zext i32 %conv1 to i64

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !193, metadata !DIExpression()), !dbg !205

  //   store atomic i64 %1, i64* @atom_5_X1_0 seq_cst, align 8, !dbg !69
  // ST: Guess
  iw(6,7) = get_rng(0,NCONTEXT-1);// 6 ASSIGN STIW 
  old_cw = cw(6,7);
  cw(6,7) = get_rng(0,NCONTEXT-1);// 6 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(6,7)] == 6);
  ASSUME(active[cw(6,7)] == 6);
  ASSUME(sforbid(7,cw(6,7))== 0);
  ASSUME(iw(6,7) >= max(creg_r5,0));
  ASSUME(iw(6,7) >= 0);
  ASSUME(cw(6,7) >= iw(6,7));
  ASSUME(cw(6,7) >= old_cw);
  ASSUME(cw(6,7) >= cr(6,7));
  ASSUME(cw(6,7) >= cl[6]);
  ASSUME(cw(6,7) >= cisb[6]);
  ASSUME(cw(6,7) >= cdy[6]);
  ASSUME(cw(6,7) >= cdl[6]);
  ASSUME(cw(6,7) >= cds[6]);
  ASSUME(cw(6,7) >= cctrl[6]);
  ASSUME(cw(6,7) >= caddr[6]);
  // Update
  caddr[6] = max(caddr[6],0);
  buff(6,7) = (r5==0);
  mem(7,cw(6,7)) = (r5==0);
  co(7,cw(6,7))+=1;
  delta(7,cw(6,7)) = -1;
  ASSUME(creturn[6] >= cw(6,7));

  //   ret i8* null, !dbg !70
  ret_thread_6 = (- 1);


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

  //   call void @llvm.dbg.value(metadata i32 %argc, metadata !215, metadata !DIExpression()), !dbg !291

  //   call void @llvm.dbg.value(metadata i8** %argv, metadata !216, metadata !DIExpression()), !dbg !291

  //   %0 = bitcast i64* %thr0 to i8*, !dbg !125

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #7, !dbg !125

  //   call void @llvm.dbg.declare(metadata i64* %thr0, metadata !217, metadata !DIExpression()), !dbg !293

  //   %1 = bitcast i64* %thr1 to i8*, !dbg !127

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #7, !dbg !127

  //   call void @llvm.dbg.declare(metadata i64* %thr1, metadata !221, metadata !DIExpression()), !dbg !295

  //   %2 = bitcast i64* %thr2 to i8*, !dbg !129

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #7, !dbg !129

  //   call void @llvm.dbg.declare(metadata i64* %thr2, metadata !222, metadata !DIExpression()), !dbg !297

  //   %3 = bitcast i64* %thr3 to i8*, !dbg !131

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #7, !dbg !131

  //   call void @llvm.dbg.declare(metadata i64* %thr3, metadata !223, metadata !DIExpression()), !dbg !299

  //   %4 = bitcast i64* %thr4 to i8*, !dbg !133

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #7, !dbg !133

  //   call void @llvm.dbg.declare(metadata i64* %thr4, metadata !224, metadata !DIExpression()), !dbg !301

  //   %5 = bitcast i64* %thr5 to i8*, !dbg !135

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %5) #7, !dbg !135

  //   call void @llvm.dbg.declare(metadata i64* %thr5, metadata !225, metadata !DIExpression()), !dbg !303

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 5), metadata !226, metadata !DIExpression()), !dbg !304

  //   call void @llvm.dbg.value(metadata i64 0, metadata !228, metadata !DIExpression()), !dbg !304

  //   store atomic i64 0, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 5) monotonic, align 8, !dbg !138
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 4), metadata !229, metadata !DIExpression()), !dbg !306

  //   call void @llvm.dbg.value(metadata i64 0, metadata !231, metadata !DIExpression()), !dbg !306

  //   store atomic i64 0, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 4) monotonic, align 8, !dbg !140
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 3), metadata !232, metadata !DIExpression()), !dbg !308

  //   call void @llvm.dbg.value(metadata i64 0, metadata !234, metadata !DIExpression()), !dbg !308

  //   store atomic i64 0, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !142
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 2), metadata !235, metadata !DIExpression()), !dbg !310

  //   call void @llvm.dbg.value(metadata i64 0, metadata !237, metadata !DIExpression()), !dbg !310

  //   store atomic i64 0, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 2) monotonic, align 8, !dbg !144
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 1), metadata !238, metadata !DIExpression()), !dbg !312

  //   call void @llvm.dbg.value(metadata i64 0, metadata !240, metadata !DIExpression()), !dbg !312

  //   store atomic i64 0, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !146
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 0), metadata !241, metadata !DIExpression()), !dbg !314

  //   call void @llvm.dbg.value(metadata i64 0, metadata !243, metadata !DIExpression()), !dbg !314

  //   store atomic i64 0, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !148
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

  //   call void @llvm.dbg.value(metadata i64* @atom_4_X2_0, metadata !244, metadata !DIExpression()), !dbg !316

  //   call void @llvm.dbg.value(metadata i64 0, metadata !246, metadata !DIExpression()), !dbg !316

  //   store atomic i64 0, i64* @atom_4_X2_0 monotonic, align 8, !dbg !150
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

  //   call void @llvm.dbg.value(metadata i64* @atom_5_X1_0, metadata !247, metadata !DIExpression()), !dbg !318

  //   call void @llvm.dbg.value(metadata i64 0, metadata !249, metadata !DIExpression()), !dbg !318

  //   store atomic i64 0, i64* @atom_5_X1_0 monotonic, align 8, !dbg !152
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

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X0_1, metadata !250, metadata !DIExpression()), !dbg !320

  //   call void @llvm.dbg.value(metadata i64 0, metadata !252, metadata !DIExpression()), !dbg !320

  //   store atomic i64 0, i64* @atom_1_X0_1 monotonic, align 8, !dbg !154
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

  //   call void @llvm.dbg.value(metadata i64* @atom_2_X0_1, metadata !253, metadata !DIExpression()), !dbg !322

  //   call void @llvm.dbg.value(metadata i64 0, metadata !255, metadata !DIExpression()), !dbg !322

  //   store atomic i64 0, i64* @atom_2_X0_1 monotonic, align 8, !dbg !156
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

  //   call void @llvm.dbg.value(metadata i64* @atom_3_X0_1, metadata !256, metadata !DIExpression()), !dbg !324

  //   call void @llvm.dbg.value(metadata i64 0, metadata !258, metadata !DIExpression()), !dbg !324

  //   store atomic i64 0, i64* @atom_3_X0_1 monotonic, align 8, !dbg !158
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

  //   call void @llvm.dbg.value(metadata i64* @atom_4_X0_1, metadata !259, metadata !DIExpression()), !dbg !326

  //   call void @llvm.dbg.value(metadata i64 0, metadata !261, metadata !DIExpression()), !dbg !326

  //   store atomic i64 0, i64* @atom_4_X0_1 monotonic, align 8, !dbg !160
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

  //   %call = call i32 @pthread_create(i64* noundef %thr0, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t0, i8* noundef null) #7, !dbg !161
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
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[1] >= cdy[0]);

  //   %call23 = call i32 @pthread_create(i64* noundef %thr1, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t1, i8* noundef null) #7, !dbg !162
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
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[2] >= cdy[0]);

  //   %call24 = call i32 @pthread_create(i64* noundef %thr2, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t2, i8* noundef null) #7, !dbg !163
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
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[3] >= cdy[0]);

  //   %call25 = call i32 @pthread_create(i64* noundef %thr3, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t3, i8* noundef null) #7, !dbg !164
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
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[4] >= cdy[0]);

  //   %call26 = call i32 @pthread_create(i64* noundef %thr4, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t4, i8* noundef null) #7, !dbg !165
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
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[5] >= cdy[0]);

  //   %call27 = call i32 @pthread_create(i64* noundef %thr5, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t5, i8* noundef null) #7, !dbg !166
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
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[6] >= cdy[0]);

  //   %6 = load i64, i64* %thr0, align 8, !dbg !167, !tbaa !168
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
  creg_r7 = cr(0,12);
  crmax(0,12) = max(crmax(0,12),cr(0,12));
  caddr[0] = max(caddr[0],0);
  if(cr(0,12) < cw(0,12)) {
    r7 = buff(0,12);
  } else {
    if(pw(0,12) != co(12,cr(0,12))) {
      ASSUME(cr(0,12) >= old_cr);
    }
    pw(0,12) = co(12,cr(0,12));
    r7 = mem(12,cr(0,12));
  }
  ASSUME(creturn[0] >= cr(0,12));

  //   %call28 = call i32 @pthread_join(i64 noundef %6, i8** noundef null), !dbg !172
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
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[1]);

  //   %7 = load i64, i64* %thr1, align 8, !dbg !173, !tbaa !168
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
  creg_r8 = cr(0,13);
  crmax(0,13) = max(crmax(0,13),cr(0,13));
  caddr[0] = max(caddr[0],0);
  if(cr(0,13) < cw(0,13)) {
    r8 = buff(0,13);
  } else {
    if(pw(0,13) != co(13,cr(0,13))) {
      ASSUME(cr(0,13) >= old_cr);
    }
    pw(0,13) = co(13,cr(0,13));
    r8 = mem(13,cr(0,13));
  }
  ASSUME(creturn[0] >= cr(0,13));

  //   %call29 = call i32 @pthread_join(i64 noundef %7, i8** noundef null), !dbg !174
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
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[2]);

  //   %8 = load i64, i64* %thr2, align 8, !dbg !175, !tbaa !168
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
  creg_r9 = cr(0,14);
  crmax(0,14) = max(crmax(0,14),cr(0,14));
  caddr[0] = max(caddr[0],0);
  if(cr(0,14) < cw(0,14)) {
    r9 = buff(0,14);
  } else {
    if(pw(0,14) != co(14,cr(0,14))) {
      ASSUME(cr(0,14) >= old_cr);
    }
    pw(0,14) = co(14,cr(0,14));
    r9 = mem(14,cr(0,14));
  }
  ASSUME(creturn[0] >= cr(0,14));

  //   %call30 = call i32 @pthread_join(i64 noundef %8, i8** noundef null), !dbg !176
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
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[3]);

  //   %9 = load i64, i64* %thr3, align 8, !dbg !177, !tbaa !168
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
  creg_r10 = cr(0,15);
  crmax(0,15) = max(crmax(0,15),cr(0,15));
  caddr[0] = max(caddr[0],0);
  if(cr(0,15) < cw(0,15)) {
    r10 = buff(0,15);
  } else {
    if(pw(0,15) != co(15,cr(0,15))) {
      ASSUME(cr(0,15) >= old_cr);
    }
    pw(0,15) = co(15,cr(0,15));
    r10 = mem(15,cr(0,15));
  }
  ASSUME(creturn[0] >= cr(0,15));

  //   %call31 = call i32 @pthread_join(i64 noundef %9, i8** noundef null), !dbg !178
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
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[4]);

  //   %10 = load i64, i64* %thr4, align 8, !dbg !179, !tbaa !168
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
  creg_r11 = cr(0,16);
  crmax(0,16) = max(crmax(0,16),cr(0,16));
  caddr[0] = max(caddr[0],0);
  if(cr(0,16) < cw(0,16)) {
    r11 = buff(0,16);
  } else {
    if(pw(0,16) != co(16,cr(0,16))) {
      ASSUME(cr(0,16) >= old_cr);
    }
    pw(0,16) = co(16,cr(0,16));
    r11 = mem(16,cr(0,16));
  }
  ASSUME(creturn[0] >= cr(0,16));

  //   %call32 = call i32 @pthread_join(i64 noundef %10, i8** noundef null), !dbg !180
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
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[5]);

  //   %11 = load i64, i64* %thr5, align 8, !dbg !181, !tbaa !168
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
  creg_r12 = cr(0,17);
  crmax(0,17) = max(crmax(0,17),cr(0,17));
  caddr[0] = max(caddr[0],0);
  if(cr(0,17) < cw(0,17)) {
    r12 = buff(0,17);
  } else {
    if(pw(0,17) != co(17,cr(0,17))) {
      ASSUME(cr(0,17) >= old_cr);
    }
    pw(0,17) = co(17,cr(0,17));
    r12 = mem(17,cr(0,17));
  }
  ASSUME(creturn[0] >= cr(0,17));

  //   %call33 = call i32 @pthread_join(i64 noundef %11, i8** noundef null), !dbg !182
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
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,16+0));
  ASSUME(cdy[0] >= cw(0,17+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,16+0));
  ASSUME(cdy[0] >= cr(0,17+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[6]);

  //   call void @llvm.dbg.value(metadata i64* @atom_4_X2_0, metadata !263, metadata !DIExpression()), !dbg !350

  //   %12 = load atomic i64, i64* @atom_4_X2_0 seq_cst, align 8, !dbg !184
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
  creg_r13 = cr(0,6);
  crmax(0,6) = max(crmax(0,6),cr(0,6));
  caddr[0] = max(caddr[0],0);
  if(cr(0,6) < cw(0,6)) {
    r13 = buff(0,6);
  } else {
    if(pw(0,6) != co(6,cr(0,6))) {
      ASSUME(cr(0,6) >= old_cr);
    }
    pw(0,6) = co(6,cr(0,6));
    r13 = mem(6,cr(0,6));
  }
  ASSUME(creturn[0] >= cr(0,6));

  //   call void @llvm.dbg.value(metadata i64 %12, metadata !265, metadata !DIExpression()), !dbg !350

  //   %conv = trunc i64 %12 to i32, !dbg !185

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !262, metadata !DIExpression()), !dbg !291

  //   call void @llvm.dbg.value(metadata i64* @atom_5_X1_0, metadata !267, metadata !DIExpression()), !dbg !353

  //   %13 = load atomic i64, i64* @atom_5_X1_0 seq_cst, align 8, !dbg !187
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
  creg_r14 = cr(0,7);
  crmax(0,7) = max(crmax(0,7),cr(0,7));
  caddr[0] = max(caddr[0],0);
  if(cr(0,7) < cw(0,7)) {
    r14 = buff(0,7);
  } else {
    if(pw(0,7) != co(7,cr(0,7))) {
      ASSUME(cr(0,7) >= old_cr);
    }
    pw(0,7) = co(7,cr(0,7));
    r14 = mem(7,cr(0,7));
  }
  ASSUME(creturn[0] >= cr(0,7));

  //   call void @llvm.dbg.value(metadata i64 %13, metadata !269, metadata !DIExpression()), !dbg !353

  //   %conv37 = trunc i64 %13 to i32, !dbg !188

  //   call void @llvm.dbg.value(metadata i32 %conv37, metadata !266, metadata !DIExpression()), !dbg !291

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X0_1, metadata !271, metadata !DIExpression()), !dbg !356

  //   %14 = load atomic i64, i64* @atom_1_X0_1 seq_cst, align 8, !dbg !190
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
  creg_r15 = cr(0,8);
  crmax(0,8) = max(crmax(0,8),cr(0,8));
  caddr[0] = max(caddr[0],0);
  if(cr(0,8) < cw(0,8)) {
    r15 = buff(0,8);
  } else {
    if(pw(0,8) != co(8,cr(0,8))) {
      ASSUME(cr(0,8) >= old_cr);
    }
    pw(0,8) = co(8,cr(0,8));
    r15 = mem(8,cr(0,8));
  }
  ASSUME(creturn[0] >= cr(0,8));

  //   call void @llvm.dbg.value(metadata i64 %14, metadata !273, metadata !DIExpression()), !dbg !356

  //   %conv41 = trunc i64 %14 to i32, !dbg !191

  //   call void @llvm.dbg.value(metadata i32 %conv41, metadata !270, metadata !DIExpression()), !dbg !291

  //   call void @llvm.dbg.value(metadata i64* @atom_2_X0_1, metadata !275, metadata !DIExpression()), !dbg !359

  //   %15 = load atomic i64, i64* @atom_2_X0_1 seq_cst, align 8, !dbg !193
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
  creg_r16 = cr(0,9);
  crmax(0,9) = max(crmax(0,9),cr(0,9));
  caddr[0] = max(caddr[0],0);
  if(cr(0,9) < cw(0,9)) {
    r16 = buff(0,9);
  } else {
    if(pw(0,9) != co(9,cr(0,9))) {
      ASSUME(cr(0,9) >= old_cr);
    }
    pw(0,9) = co(9,cr(0,9));
    r16 = mem(9,cr(0,9));
  }
  ASSUME(creturn[0] >= cr(0,9));

  //   call void @llvm.dbg.value(metadata i64 %15, metadata !277, metadata !DIExpression()), !dbg !359

  //   %conv45 = trunc i64 %15 to i32, !dbg !194

  //   call void @llvm.dbg.value(metadata i32 %conv45, metadata !274, metadata !DIExpression()), !dbg !291

  //   call void @llvm.dbg.value(metadata i64* @atom_3_X0_1, metadata !279, metadata !DIExpression()), !dbg !362

  //   %16 = load atomic i64, i64* @atom_3_X0_1 seq_cst, align 8, !dbg !196
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
  creg_r17 = cr(0,10);
  crmax(0,10) = max(crmax(0,10),cr(0,10));
  caddr[0] = max(caddr[0],0);
  if(cr(0,10) < cw(0,10)) {
    r17 = buff(0,10);
  } else {
    if(pw(0,10) != co(10,cr(0,10))) {
      ASSUME(cr(0,10) >= old_cr);
    }
    pw(0,10) = co(10,cr(0,10));
    r17 = mem(10,cr(0,10));
  }
  ASSUME(creturn[0] >= cr(0,10));

  //   call void @llvm.dbg.value(metadata i64 %16, metadata !281, metadata !DIExpression()), !dbg !362

  //   %conv49 = trunc i64 %16 to i32, !dbg !197

  //   call void @llvm.dbg.value(metadata i32 %conv49, metadata !278, metadata !DIExpression()), !dbg !291

  //   call void @llvm.dbg.value(metadata i64* @atom_4_X0_1, metadata !283, metadata !DIExpression()), !dbg !365

  //   %17 = load atomic i64, i64* @atom_4_X0_1 seq_cst, align 8, !dbg !199
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
  creg_r18 = cr(0,11);
  crmax(0,11) = max(crmax(0,11),cr(0,11));
  caddr[0] = max(caddr[0],0);
  if(cr(0,11) < cw(0,11)) {
    r18 = buff(0,11);
  } else {
    if(pw(0,11) != co(11,cr(0,11))) {
      ASSUME(cr(0,11) >= old_cr);
    }
    pw(0,11) = co(11,cr(0,11));
    r18 = mem(11,cr(0,11));
  }
  ASSUME(creturn[0] >= cr(0,11));

  //   call void @llvm.dbg.value(metadata i64 %17, metadata !285, metadata !DIExpression()), !dbg !365

  //   %conv53 = trunc i64 %17 to i32, !dbg !200

  //   call void @llvm.dbg.value(metadata i32 %conv53, metadata !282, metadata !DIExpression()), !dbg !291

  //   %and = and i32 %conv49, %conv53, !dbg !201
  creg_r19 = max(creg_r17,creg_r18);
  ASSUME(active[creg_r19] == 0);
  r19 = r17 & r18;

  //   call void @llvm.dbg.value(metadata i32 %and, metadata !286, metadata !DIExpression()), !dbg !291

  //   %and54 = and i32 %conv45, %and, !dbg !202
  creg_r20 = max(creg_r16,creg_r19);
  ASSUME(active[creg_r20] == 0);
  r20 = r16 & r19;

  //   call void @llvm.dbg.value(metadata i32 %and54, metadata !287, metadata !DIExpression()), !dbg !291

  //   %and55 = and i32 %conv41, %and54, !dbg !203
  creg_r21 = max(creg_r15,creg_r20);
  ASSUME(active[creg_r21] == 0);
  r21 = r15 & r20;

  //   call void @llvm.dbg.value(metadata i32 %and55, metadata !288, metadata !DIExpression()), !dbg !291

  //   %and56 = and i32 %conv37, %and55, !dbg !204
  creg_r22 = max(creg_r14,creg_r21);
  ASSUME(active[creg_r22] == 0);
  r22 = r14 & r21;

  //   call void @llvm.dbg.value(metadata i32 %and56, metadata !289, metadata !DIExpression()), !dbg !291

  //   %and57 = and i32 %conv, %and56, !dbg !205
  creg_r23 = max(creg_r13,creg_r22);
  ASSUME(active[creg_r23] == 0);
  r23 = r13 & r22;

  //   call void @llvm.dbg.value(metadata i32 %and57, metadata !290, metadata !DIExpression()), !dbg !291

  //   %cmp = icmp eq i32 %and57, 1, !dbg !206

  //   br i1 %cmp, label %if.then, label %if.end, !dbg !208
  old_cctrl = cctrl[0];
  cctrl[0] = get_rng(0,NCONTEXT-1);
  ASSUME(cctrl[0] >= old_cctrl);
  ASSUME(cctrl[0] >= creg_r23);
  ASSUME(cctrl[0] >= 0);
  if((r23==1)) {
    goto T0BLOCK1;
  } else {
    goto T0BLOCK2;
  }

T0BLOCK1:
  //   call void @__assert_fail(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([109 x i8], [109 x i8]* @.str.1, i64 0, i64 0), i32 noundef 125, i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #8, !dbg !209

  //   unreachable, !dbg !209
  r24 = 1;

T0BLOCK2:
  //   %18 = bitcast i64* %thr5 to i8*, !dbg !212

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %18) #7, !dbg !212

  //   %19 = bitcast i64* %thr4 to i8*, !dbg !212

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %19) #7, !dbg !212

  //   %20 = bitcast i64* %thr3 to i8*, !dbg !212

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %20) #7, !dbg !212

  //   %21 = bitcast i64* %thr2 to i8*, !dbg !212

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %21) #7, !dbg !212

  //   %22 = bitcast i64* %thr1 to i8*, !dbg !212

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %22) #7, !dbg !212

  //   %23 = bitcast i64* %thr0 to i8*, !dbg !212

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %23) #7, !dbg !212

  //   ret i32 0, !dbg !213
  ret_thread_0 = 0;



  ASSERT(r24== 0);

}
