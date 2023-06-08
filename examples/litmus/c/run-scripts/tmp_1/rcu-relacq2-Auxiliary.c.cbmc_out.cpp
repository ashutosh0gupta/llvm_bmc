// 0:vars:6
// 6:atom_0_X0_1:1
// 7:atom_0_X5_0:1
// 8:atom_0_X7_1:1
// 9:atom_0_X3_1:1
// 10:atom_1_X2_1:1
// 11:thr0:1
// 12:thr1:1
// 13:thr2:1
#define ADDRSIZE 14
#define NPROC 4
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
  cl[3] = 0;
  cdy[3] = 0;
  cds[3] = 0;
  cdl[3] = 0;
  cisb[3] = 0;
  caddr[3] = 0;
  cctrl[3] = 0;
  cstart[3] = get_rng(0,NCONTEXT-1);
  creturn[3] = get_rng(0,NCONTEXT-1);
  // Dumping initializations
  mem(0+0,0) = 0;
  mem(0+1,0) = 0;
  mem(0+2,0) = 0;
  mem(0+3,0) = 0;
  mem(0+4,0) = 0;
  mem(0+5,0) = 0;
  mem(6+0,0) = 0;
  mem(7+0,0) = 0;
  mem(8+0,0) = 0;
  mem(9+0,0) = 0;
  mem(10+0,0) = 0;
  mem(11+0,0) = 0;
  mem(12+0,0) = 0;
  mem(13+0,0) = 0;
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
  // Dumping thread 1
  int ret_thread_1 = 0;
  cdy[1] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[1] >= cstart[1]);
T1BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !41, metadata !DIExpression()), !dbg !83

  //   br label %label_1, !dbg !84
  goto T1BLOCK1;

T1BLOCK1:
  //   call void @llvm.dbg.label(metadata !82), !dbg !85

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 5), metadata !44, metadata !DIExpression()), !dbg !86

  //   %0 = load atomic i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 5) monotonic, align 8, !dbg !87
  // LD: Guess
  old_cr = cr(1,0+5*1);
  cr(1,0+5*1) = get_rng(0,NCONTEXT-1);// 1 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(1,0+5*1)] == 1);
  ASSUME(cr(1,0+5*1) >= iw(1,0+5*1));
  ASSUME(cr(1,0+5*1) >= 0);
  ASSUME(cr(1,0+5*1) >= cdy[1]);
  ASSUME(cr(1,0+5*1) >= cisb[1]);
  ASSUME(cr(1,0+5*1) >= cdl[1]);
  ASSUME(cr(1,0+5*1) >= cl[1]);
  // Update
  creg_r0 = cr(1,0+5*1);
  crmax(1,0+5*1) = max(crmax(1,0+5*1),cr(1,0+5*1));
  caddr[1] = max(caddr[1],0);
  if(cr(1,0+5*1) < cw(1,0+5*1)) {
    r0 = buff(1,0+5*1);
  } else {
    if(pw(1,0+5*1) != co(0+5*1,cr(1,0+5*1))) {
      ASSUME(cr(1,0+5*1) >= old_cr);
    }
    pw(1,0+5*1) = co(0+5*1,cr(1,0+5*1));
    r0 = mem(0+5*1,cr(1,0+5*1));
  }
  ASSUME(creturn[1] >= cr(1,0+5*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !47, metadata !DIExpression()), !dbg !86

  //   %conv = trunc i64 %0 to i32, !dbg !88

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !42, metadata !DIExpression()), !dbg !83

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 4), metadata !48, metadata !DIExpression()), !dbg !89

  //   %conv1 = sext i32 %conv to i64, !dbg !90

  //   call void @llvm.dbg.value(metadata i64 %conv1, metadata !50, metadata !DIExpression()), !dbg !89

  //   store atomic i64 %conv1, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 4) monotonic, align 8, !dbg !90
  // ST: Guess
  iw(1,0+4*1) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW 
  old_cw = cw(1,0+4*1);
  cw(1,0+4*1) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(1,0+4*1)] == 1);
  ASSUME(active[cw(1,0+4*1)] == 1);
  ASSUME(sforbid(0+4*1,cw(1,0+4*1))== 0);
  ASSUME(iw(1,0+4*1) >= creg_r0);
  ASSUME(iw(1,0+4*1) >= 0);
  ASSUME(cw(1,0+4*1) >= iw(1,0+4*1));
  ASSUME(cw(1,0+4*1) >= old_cw);
  ASSUME(cw(1,0+4*1) >= cr(1,0+4*1));
  ASSUME(cw(1,0+4*1) >= cl[1]);
  ASSUME(cw(1,0+4*1) >= cisb[1]);
  ASSUME(cw(1,0+4*1) >= cdy[1]);
  ASSUME(cw(1,0+4*1) >= cdl[1]);
  ASSUME(cw(1,0+4*1) >= cds[1]);
  ASSUME(cw(1,0+4*1) >= cctrl[1]);
  ASSUME(cw(1,0+4*1) >= caddr[1]);
  // Update
  caddr[1] = max(caddr[1],0);
  buff(1,0+4*1) = r0;
  mem(0+4*1,cw(1,0+4*1)) = r0;
  co(0+4*1,cw(1,0+4*1))+=1;
  delta(0+4*1,cw(1,0+4*1)) = -1;
  ASSUME(creturn[1] >= cw(1,0+4*1));

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 3), metadata !52, metadata !DIExpression()), !dbg !91

  //   %1 = load atomic i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 3) acquire, align 8, !dbg !92
  // LD: Guess
  //   : Acquire
  old_cr = cr(1,0+3*1);
  cr(1,0+3*1) = get_rng(0,NCONTEXT-1);// 1 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(1,0+3*1)] == 1);
  ASSUME(cr(1,0+3*1) >= iw(1,0+3*1));
  ASSUME(cr(1,0+3*1) >= 0);
  ASSUME(cr(1,0+3*1) >= cdy[1]);
  ASSUME(cr(1,0+3*1) >= cisb[1]);
  ASSUME(cr(1,0+3*1) >= cdl[1]);
  ASSUME(cr(1,0+3*1) >= cl[1]);
  ASSUME(cr(1,0+3*1) >= cx(1,0+3*1));
  ASSUME(cr(1,0+3*1) >= cs(1,0+0));
  ASSUME(cr(1,0+3*1) >= cs(1,0+1));
  ASSUME(cr(1,0+3*1) >= cs(1,0+2));
  ASSUME(cr(1,0+3*1) >= cs(1,0+3));
  ASSUME(cr(1,0+3*1) >= cs(1,0+4));
  ASSUME(cr(1,0+3*1) >= cs(1,0+5));
  ASSUME(cr(1,0+3*1) >= cs(1,6+0));
  ASSUME(cr(1,0+3*1) >= cs(1,7+0));
  ASSUME(cr(1,0+3*1) >= cs(1,8+0));
  ASSUME(cr(1,0+3*1) >= cs(1,9+0));
  ASSUME(cr(1,0+3*1) >= cs(1,10+0));
  ASSUME(cr(1,0+3*1) >= cs(1,11+0));
  ASSUME(cr(1,0+3*1) >= cs(1,12+0));
  ASSUME(cr(1,0+3*1) >= cs(1,13+0));
  // Update
  creg_r1 = cr(1,0+3*1);
  crmax(1,0+3*1) = max(crmax(1,0+3*1),cr(1,0+3*1));
  caddr[1] = max(caddr[1],0);
  if(cr(1,0+3*1) < cw(1,0+3*1)) {
    r1 = buff(1,0+3*1);
  } else {
    if(pw(1,0+3*1) != co(0+3*1,cr(1,0+3*1))) {
      ASSUME(cr(1,0+3*1) >= old_cr);
    }
    pw(1,0+3*1) = co(0+3*1,cr(1,0+3*1));
    r1 = mem(0+3*1,cr(1,0+3*1));
  }
  cl[1] = max(cl[1],cr(1,0+3*1));
  ASSUME(creturn[1] >= cr(1,0+3*1));

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !54, metadata !DIExpression()), !dbg !91

  //   %conv5 = trunc i64 %1 to i32, !dbg !93

  //   call void @llvm.dbg.value(metadata i32 %conv5, metadata !51, metadata !DIExpression()), !dbg !83

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 2), metadata !56, metadata !DIExpression()), !dbg !94

  //   %2 = load atomic i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 2) monotonic, align 8, !dbg !95
  // LD: Guess
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
  // Update
  creg_r2 = cr(1,0+2*1);
  crmax(1,0+2*1) = max(crmax(1,0+2*1),cr(1,0+2*1));
  caddr[1] = max(caddr[1],0);
  if(cr(1,0+2*1) < cw(1,0+2*1)) {
    r2 = buff(1,0+2*1);
  } else {
    if(pw(1,0+2*1) != co(0+2*1,cr(1,0+2*1))) {
      ASSUME(cr(1,0+2*1) >= old_cr);
    }
    pw(1,0+2*1) = co(0+2*1,cr(1,0+2*1));
    r2 = mem(0+2*1,cr(1,0+2*1));
  }
  ASSUME(creturn[1] >= cr(1,0+2*1));

  //   call void @llvm.dbg.value(metadata i64 %2, metadata !58, metadata !DIExpression()), !dbg !94

  //   %conv9 = trunc i64 %2 to i32, !dbg !96

  //   call void @llvm.dbg.value(metadata i32 %conv9, metadata !55, metadata !DIExpression()), !dbg !83

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 1), metadata !60, metadata !DIExpression()), !dbg !97

  //   %3 = load atomic i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !98
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
  creg_r3 = cr(1,0+1*1);
  crmax(1,0+1*1) = max(crmax(1,0+1*1),cr(1,0+1*1));
  caddr[1] = max(caddr[1],0);
  if(cr(1,0+1*1) < cw(1,0+1*1)) {
    r3 = buff(1,0+1*1);
  } else {
    if(pw(1,0+1*1) != co(0+1*1,cr(1,0+1*1))) {
      ASSUME(cr(1,0+1*1) >= old_cr);
    }
    pw(1,0+1*1) = co(0+1*1,cr(1,0+1*1));
    r3 = mem(0+1*1,cr(1,0+1*1));
  }
  ASSUME(creturn[1] >= cr(1,0+1*1));

  //   call void @llvm.dbg.value(metadata i64 %3, metadata !62, metadata !DIExpression()), !dbg !97

  //   %conv13 = trunc i64 %3 to i32, !dbg !99

  //   call void @llvm.dbg.value(metadata i32 %conv13, metadata !59, metadata !DIExpression()), !dbg !83

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 0), metadata !63, metadata !DIExpression()), !dbg !100

  //   call void @llvm.dbg.value(metadata i64 1, metadata !65, metadata !DIExpression()), !dbg !100

  //   store atomic i64 1, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 0) release, align 8, !dbg !101
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
  ASSUME(cw(1,0) >= cr(1,6+0));
  ASSUME(cw(1,0) >= cr(1,7+0));
  ASSUME(cw(1,0) >= cr(1,8+0));
  ASSUME(cw(1,0) >= cr(1,9+0));
  ASSUME(cw(1,0) >= cr(1,10+0));
  ASSUME(cw(1,0) >= cr(1,11+0));
  ASSUME(cw(1,0) >= cr(1,12+0));
  ASSUME(cw(1,0) >= cr(1,13+0));
  ASSUME(cw(1,0) >= cw(1,0+0));
  ASSUME(cw(1,0) >= cw(1,0+1));
  ASSUME(cw(1,0) >= cw(1,0+2));
  ASSUME(cw(1,0) >= cw(1,0+3));
  ASSUME(cw(1,0) >= cw(1,0+4));
  ASSUME(cw(1,0) >= cw(1,0+5));
  ASSUME(cw(1,0) >= cw(1,6+0));
  ASSUME(cw(1,0) >= cw(1,7+0));
  ASSUME(cw(1,0) >= cw(1,8+0));
  ASSUME(cw(1,0) >= cw(1,9+0));
  ASSUME(cw(1,0) >= cw(1,10+0));
  ASSUME(cw(1,0) >= cw(1,11+0));
  ASSUME(cw(1,0) >= cw(1,12+0));
  ASSUME(cw(1,0) >= cw(1,13+0));
  // Update
  caddr[1] = max(caddr[1],0);
  buff(1,0) = 1;
  mem(0,cw(1,0)) = 1;
  co(0,cw(1,0))+=1;
  delta(0,cw(1,0)) = -1;
  is(1,0) = iw(1,0);
  cs(1,0) = cw(1,0);
  ASSUME(creturn[1] >= cw(1,0));

  //   %cmp = icmp eq i32 %conv, 1, !dbg !102

  //   %conv16 = zext i1 %cmp to i32, !dbg !102

  //   call void @llvm.dbg.value(metadata i32 %conv16, metadata !66, metadata !DIExpression()), !dbg !83

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X0_1, metadata !67, metadata !DIExpression()), !dbg !103

  //   %4 = zext i32 %conv16 to i64

  //   call void @llvm.dbg.value(metadata i64 %4, metadata !69, metadata !DIExpression()), !dbg !103

  //   store atomic i64 %4, i64* @atom_0_X0_1 seq_cst, align 8, !dbg !104
  // ST: Guess
  iw(1,6) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW 
  old_cw = cw(1,6);
  cw(1,6) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(1,6)] == 1);
  ASSUME(active[cw(1,6)] == 1);
  ASSUME(sforbid(6,cw(1,6))== 0);
  ASSUME(iw(1,6) >= max(creg_r0,0));
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
  buff(1,6) = (r0==1);
  mem(6,cw(1,6)) = (r0==1);
  co(6,cw(1,6))+=1;
  delta(6,cw(1,6)) = -1;
  ASSUME(creturn[1] >= cw(1,6));

  //   %cmp20 = icmp eq i32 %conv9, 0, !dbg !105

  //   %conv21 = zext i1 %cmp20 to i32, !dbg !105

  //   call void @llvm.dbg.value(metadata i32 %conv21, metadata !70, metadata !DIExpression()), !dbg !83

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X5_0, metadata !71, metadata !DIExpression()), !dbg !106

  //   %5 = zext i32 %conv21 to i64

  //   call void @llvm.dbg.value(metadata i64 %5, metadata !73, metadata !DIExpression()), !dbg !106

  //   store atomic i64 %5, i64* @atom_0_X5_0 seq_cst, align 8, !dbg !107
  // ST: Guess
  iw(1,7) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW 
  old_cw = cw(1,7);
  cw(1,7) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(1,7)] == 1);
  ASSUME(active[cw(1,7)] == 1);
  ASSUME(sforbid(7,cw(1,7))== 0);
  ASSUME(iw(1,7) >= max(creg_r2,0));
  ASSUME(iw(1,7) >= 0);
  ASSUME(cw(1,7) >= iw(1,7));
  ASSUME(cw(1,7) >= old_cw);
  ASSUME(cw(1,7) >= cr(1,7));
  ASSUME(cw(1,7) >= cl[1]);
  ASSUME(cw(1,7) >= cisb[1]);
  ASSUME(cw(1,7) >= cdy[1]);
  ASSUME(cw(1,7) >= cdl[1]);
  ASSUME(cw(1,7) >= cds[1]);
  ASSUME(cw(1,7) >= cctrl[1]);
  ASSUME(cw(1,7) >= caddr[1]);
  // Update
  caddr[1] = max(caddr[1],0);
  buff(1,7) = (r2==0);
  mem(7,cw(1,7)) = (r2==0);
  co(7,cw(1,7))+=1;
  delta(7,cw(1,7)) = -1;
  ASSUME(creturn[1] >= cw(1,7));

  //   %cmp25 = icmp eq i32 %conv13, 1, !dbg !108

  //   %conv26 = zext i1 %cmp25 to i32, !dbg !108

  //   call void @llvm.dbg.value(metadata i32 %conv26, metadata !74, metadata !DIExpression()), !dbg !83

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X7_1, metadata !75, metadata !DIExpression()), !dbg !109

  //   %6 = zext i32 %conv26 to i64

  //   call void @llvm.dbg.value(metadata i64 %6, metadata !77, metadata !DIExpression()), !dbg !109

  //   store atomic i64 %6, i64* @atom_0_X7_1 seq_cst, align 8, !dbg !110
  // ST: Guess
  iw(1,8) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW 
  old_cw = cw(1,8);
  cw(1,8) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(1,8)] == 1);
  ASSUME(active[cw(1,8)] == 1);
  ASSUME(sforbid(8,cw(1,8))== 0);
  ASSUME(iw(1,8) >= max(creg_r3,0));
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
  buff(1,8) = (r3==1);
  mem(8,cw(1,8)) = (r3==1);
  co(8,cw(1,8))+=1;
  delta(8,cw(1,8)) = -1;
  ASSUME(creturn[1] >= cw(1,8));

  //   %cmp30 = icmp eq i32 %conv5, 1, !dbg !111

  //   %conv31 = zext i1 %cmp30 to i32, !dbg !111

  //   call void @llvm.dbg.value(metadata i32 %conv31, metadata !78, metadata !DIExpression()), !dbg !83

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X3_1, metadata !79, metadata !DIExpression()), !dbg !112

  //   %7 = zext i32 %conv31 to i64

  //   call void @llvm.dbg.value(metadata i64 %7, metadata !81, metadata !DIExpression()), !dbg !112

  //   store atomic i64 %7, i64* @atom_0_X3_1 seq_cst, align 8, !dbg !113
  // ST: Guess
  iw(1,9) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW 
  old_cw = cw(1,9);
  cw(1,9) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(1,9)] == 1);
  ASSUME(active[cw(1,9)] == 1);
  ASSUME(sforbid(9,cw(1,9))== 0);
  ASSUME(iw(1,9) >= max(creg_r1,0));
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

  //   ret i8* null, !dbg !114
  ret_thread_1 = (- 1);


  // Dumping thread 2
  int ret_thread_2 = 0;
  cdy[2] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[2] >= cstart[2]);
T2BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !117, metadata !DIExpression()), !dbg !136

  //   br label %label_2, !dbg !63
  goto T2BLOCK1;

T2BLOCK1:
  //   call void @llvm.dbg.label(metadata !135), !dbg !138

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 4), metadata !118, metadata !DIExpression()), !dbg !139

  //   call void @llvm.dbg.value(metadata i64 2, metadata !120, metadata !DIExpression()), !dbg !139

  //   store atomic i64 2, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 4) monotonic, align 8, !dbg !66
  // ST: Guess
  iw(2,0+4*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW 
  old_cw = cw(2,0+4*1);
  cw(2,0+4*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(2,0+4*1)] == 2);
  ASSUME(active[cw(2,0+4*1)] == 2);
  ASSUME(sforbid(0+4*1,cw(2,0+4*1))== 0);
  ASSUME(iw(2,0+4*1) >= 0);
  ASSUME(iw(2,0+4*1) >= 0);
  ASSUME(cw(2,0+4*1) >= iw(2,0+4*1));
  ASSUME(cw(2,0+4*1) >= old_cw);
  ASSUME(cw(2,0+4*1) >= cr(2,0+4*1));
  ASSUME(cw(2,0+4*1) >= cl[2]);
  ASSUME(cw(2,0+4*1) >= cisb[2]);
  ASSUME(cw(2,0+4*1) >= cdy[2]);
  ASSUME(cw(2,0+4*1) >= cdl[2]);
  ASSUME(cw(2,0+4*1) >= cds[2]);
  ASSUME(cw(2,0+4*1) >= cctrl[2]);
  ASSUME(cw(2,0+4*1) >= caddr[2]);
  // Update
  caddr[2] = max(caddr[2],0);
  buff(2,0+4*1) = 2;
  mem(0+4*1,cw(2,0+4*1)) = 2;
  co(0+4*1,cw(2,0+4*1))+=1;
  delta(0+4*1,cw(2,0+4*1)) = -1;
  ASSUME(creturn[2] >= cw(2,0+4*1));

  //   call void (...) @dmbsy(), !dbg !67
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
  ASSUME(cdy[2] >= cw(2,0+4));
  ASSUME(cdy[2] >= cw(2,0+5));
  ASSUME(cdy[2] >= cw(2,6+0));
  ASSUME(cdy[2] >= cw(2,7+0));
  ASSUME(cdy[2] >= cw(2,8+0));
  ASSUME(cdy[2] >= cw(2,9+0));
  ASSUME(cdy[2] >= cw(2,10+0));
  ASSUME(cdy[2] >= cw(2,11+0));
  ASSUME(cdy[2] >= cw(2,12+0));
  ASSUME(cdy[2] >= cw(2,13+0));
  ASSUME(cdy[2] >= cr(2,0+0));
  ASSUME(cdy[2] >= cr(2,0+1));
  ASSUME(cdy[2] >= cr(2,0+2));
  ASSUME(cdy[2] >= cr(2,0+3));
  ASSUME(cdy[2] >= cr(2,0+4));
  ASSUME(cdy[2] >= cr(2,0+5));
  ASSUME(cdy[2] >= cr(2,6+0));
  ASSUME(cdy[2] >= cr(2,7+0));
  ASSUME(cdy[2] >= cr(2,8+0));
  ASSUME(cdy[2] >= cr(2,9+0));
  ASSUME(cdy[2] >= cr(2,10+0));
  ASSUME(cdy[2] >= cr(2,11+0));
  ASSUME(cdy[2] >= cr(2,12+0));
  ASSUME(cdy[2] >= cr(2,13+0));
  ASSUME(creturn[2] >= cdy[2]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 3), metadata !121, metadata !DIExpression()), !dbg !142

  //   call void @llvm.dbg.value(metadata i64 1, metadata !123, metadata !DIExpression()), !dbg !142

  //   store atomic i64 1, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 3) release, align 8, !dbg !69
  // ST: Guess
  //   : Release
  iw(2,0+3*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW 
  old_cw = cw(2,0+3*1);
  cw(2,0+3*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM 
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
  ASSUME(cw(2,0+3*1) >= cr(2,0+0));
  ASSUME(cw(2,0+3*1) >= cr(2,0+1));
  ASSUME(cw(2,0+3*1) >= cr(2,0+2));
  ASSUME(cw(2,0+3*1) >= cr(2,0+3));
  ASSUME(cw(2,0+3*1) >= cr(2,0+4));
  ASSUME(cw(2,0+3*1) >= cr(2,0+5));
  ASSUME(cw(2,0+3*1) >= cr(2,6+0));
  ASSUME(cw(2,0+3*1) >= cr(2,7+0));
  ASSUME(cw(2,0+3*1) >= cr(2,8+0));
  ASSUME(cw(2,0+3*1) >= cr(2,9+0));
  ASSUME(cw(2,0+3*1) >= cr(2,10+0));
  ASSUME(cw(2,0+3*1) >= cr(2,11+0));
  ASSUME(cw(2,0+3*1) >= cr(2,12+0));
  ASSUME(cw(2,0+3*1) >= cr(2,13+0));
  ASSUME(cw(2,0+3*1) >= cw(2,0+0));
  ASSUME(cw(2,0+3*1) >= cw(2,0+1));
  ASSUME(cw(2,0+3*1) >= cw(2,0+2));
  ASSUME(cw(2,0+3*1) >= cw(2,0+3));
  ASSUME(cw(2,0+3*1) >= cw(2,0+4));
  ASSUME(cw(2,0+3*1) >= cw(2,0+5));
  ASSUME(cw(2,0+3*1) >= cw(2,6+0));
  ASSUME(cw(2,0+3*1) >= cw(2,7+0));
  ASSUME(cw(2,0+3*1) >= cw(2,8+0));
  ASSUME(cw(2,0+3*1) >= cw(2,9+0));
  ASSUME(cw(2,0+3*1) >= cw(2,10+0));
  ASSUME(cw(2,0+3*1) >= cw(2,11+0));
  ASSUME(cw(2,0+3*1) >= cw(2,12+0));
  ASSUME(cw(2,0+3*1) >= cw(2,13+0));
  // Update
  caddr[2] = max(caddr[2],0);
  buff(2,0+3*1) = 1;
  mem(0+3*1,cw(2,0+3*1)) = 1;
  co(0+3*1,cw(2,0+3*1))+=1;
  delta(0+3*1,cw(2,0+3*1)) = -1;
  is(2,0+3*1) = iw(2,0+3*1);
  cs(2,0+3*1) = cw(2,0+3*1);
  ASSUME(creturn[2] >= cw(2,0+3*1));

  //   call void (...) @dmbsy(), !dbg !70
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
  ASSUME(cdy[2] >= cw(2,0+4));
  ASSUME(cdy[2] >= cw(2,0+5));
  ASSUME(cdy[2] >= cw(2,6+0));
  ASSUME(cdy[2] >= cw(2,7+0));
  ASSUME(cdy[2] >= cw(2,8+0));
  ASSUME(cdy[2] >= cw(2,9+0));
  ASSUME(cdy[2] >= cw(2,10+0));
  ASSUME(cdy[2] >= cw(2,11+0));
  ASSUME(cdy[2] >= cw(2,12+0));
  ASSUME(cdy[2] >= cw(2,13+0));
  ASSUME(cdy[2] >= cr(2,0+0));
  ASSUME(cdy[2] >= cr(2,0+1));
  ASSUME(cdy[2] >= cr(2,0+2));
  ASSUME(cdy[2] >= cr(2,0+3));
  ASSUME(cdy[2] >= cr(2,0+4));
  ASSUME(cdy[2] >= cr(2,0+5));
  ASSUME(cdy[2] >= cr(2,6+0));
  ASSUME(cdy[2] >= cr(2,7+0));
  ASSUME(cdy[2] >= cr(2,8+0));
  ASSUME(cdy[2] >= cr(2,9+0));
  ASSUME(cdy[2] >= cr(2,10+0));
  ASSUME(cdy[2] >= cr(2,11+0));
  ASSUME(cdy[2] >= cr(2,12+0));
  ASSUME(cdy[2] >= cr(2,13+0));
  ASSUME(creturn[2] >= cdy[2]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 0), metadata !125, metadata !DIExpression()), !dbg !145

  //   %0 = load atomic i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 0) acquire, align 8, !dbg !72
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
  ASSUME(cr(2,0) >= cs(2,6+0));
  ASSUME(cr(2,0) >= cs(2,7+0));
  ASSUME(cr(2,0) >= cs(2,8+0));
  ASSUME(cr(2,0) >= cs(2,9+0));
  ASSUME(cr(2,0) >= cs(2,10+0));
  ASSUME(cr(2,0) >= cs(2,11+0));
  ASSUME(cr(2,0) >= cs(2,12+0));
  ASSUME(cr(2,0) >= cs(2,13+0));
  // Update
  creg_r4 = cr(2,0);
  crmax(2,0) = max(crmax(2,0),cr(2,0));
  caddr[2] = max(caddr[2],0);
  if(cr(2,0) < cw(2,0)) {
    r4 = buff(2,0);
  } else {
    if(pw(2,0) != co(0,cr(2,0))) {
      ASSUME(cr(2,0) >= old_cr);
    }
    pw(2,0) = co(0,cr(2,0));
    r4 = mem(0,cr(2,0));
  }
  cl[2] = max(cl[2],cr(2,0));
  ASSUME(creturn[2] >= cr(2,0));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !127, metadata !DIExpression()), !dbg !145

  //   %conv = trunc i64 %0 to i32, !dbg !73

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !124, metadata !DIExpression()), !dbg !136

  //   call void (...) @dmbsy(), !dbg !74
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
  ASSUME(cdy[2] >= cw(2,0+4));
  ASSUME(cdy[2] >= cw(2,0+5));
  ASSUME(cdy[2] >= cw(2,6+0));
  ASSUME(cdy[2] >= cw(2,7+0));
  ASSUME(cdy[2] >= cw(2,8+0));
  ASSUME(cdy[2] >= cw(2,9+0));
  ASSUME(cdy[2] >= cw(2,10+0));
  ASSUME(cdy[2] >= cw(2,11+0));
  ASSUME(cdy[2] >= cw(2,12+0));
  ASSUME(cdy[2] >= cw(2,13+0));
  ASSUME(cdy[2] >= cr(2,0+0));
  ASSUME(cdy[2] >= cr(2,0+1));
  ASSUME(cdy[2] >= cr(2,0+2));
  ASSUME(cdy[2] >= cr(2,0+3));
  ASSUME(cdy[2] >= cr(2,0+4));
  ASSUME(cdy[2] >= cr(2,0+5));
  ASSUME(cdy[2] >= cr(2,6+0));
  ASSUME(cdy[2] >= cr(2,7+0));
  ASSUME(cdy[2] >= cr(2,8+0));
  ASSUME(cdy[2] >= cr(2,9+0));
  ASSUME(cdy[2] >= cr(2,10+0));
  ASSUME(cdy[2] >= cr(2,11+0));
  ASSUME(cdy[2] >= cr(2,12+0));
  ASSUME(cdy[2] >= cr(2,13+0));
  ASSUME(creturn[2] >= cdy[2]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 1), metadata !128, metadata !DIExpression()), !dbg !149

  //   call void @llvm.dbg.value(metadata i64 1, metadata !130, metadata !DIExpression()), !dbg !149

  //   store atomic i64 1, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !76
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
  buff(2,0+1*1) = 1;
  mem(0+1*1,cw(2,0+1*1)) = 1;
  co(0+1*1,cw(2,0+1*1))+=1;
  delta(0+1*1,cw(2,0+1*1)) = -1;
  ASSUME(creturn[2] >= cw(2,0+1*1));

  //   %cmp = icmp eq i32 %conv, 1, !dbg !77

  //   %conv5 = zext i1 %cmp to i32, !dbg !77

  //   call void @llvm.dbg.value(metadata i32 %conv5, metadata !131, metadata !DIExpression()), !dbg !136

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X2_1, metadata !132, metadata !DIExpression()), !dbg !152

  //   %1 = zext i32 %conv5 to i64

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !134, metadata !DIExpression()), !dbg !152

  //   store atomic i64 %1, i64* @atom_1_X2_1 seq_cst, align 8, !dbg !79
  // ST: Guess
  iw(2,10) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW 
  old_cw = cw(2,10);
  cw(2,10) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(2,10)] == 2);
  ASSUME(active[cw(2,10)] == 2);
  ASSUME(sforbid(10,cw(2,10))== 0);
  ASSUME(iw(2,10) >= max(creg_r4,0));
  ASSUME(iw(2,10) >= 0);
  ASSUME(cw(2,10) >= iw(2,10));
  ASSUME(cw(2,10) >= old_cw);
  ASSUME(cw(2,10) >= cr(2,10));
  ASSUME(cw(2,10) >= cl[2]);
  ASSUME(cw(2,10) >= cisb[2]);
  ASSUME(cw(2,10) >= cdy[2]);
  ASSUME(cw(2,10) >= cdl[2]);
  ASSUME(cw(2,10) >= cds[2]);
  ASSUME(cw(2,10) >= cctrl[2]);
  ASSUME(cw(2,10) >= caddr[2]);
  // Update
  caddr[2] = max(caddr[2],0);
  buff(2,10) = (r4==1);
  mem(10,cw(2,10)) = (r4==1);
  co(10,cw(2,10))+=1;
  delta(10,cw(2,10)) = -1;
  ASSUME(creturn[2] >= cw(2,10));

  //   ret i8* null, !dbg !80
  ret_thread_2 = (- 1);


  // Dumping thread 3
  int ret_thread_3 = 0;
  cdy[3] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[3] >= cstart[3]);
T3BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !157, metadata !DIExpression()), !dbg !165

  //   br label %label_3, !dbg !51
  goto T3BLOCK1;

T3BLOCK1:
  //   call void @llvm.dbg.label(metadata !164), !dbg !167

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 2), metadata !158, metadata !DIExpression()), !dbg !168

  //   call void @llvm.dbg.value(metadata i64 1, metadata !160, metadata !DIExpression()), !dbg !168

  //   store atomic i64 1, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 2) monotonic, align 8, !dbg !54
  // ST: Guess
  iw(3,0+2*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STIW 
  old_cw = cw(3,0+2*1);
  cw(3,0+2*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(3,0+2*1)] == 3);
  ASSUME(active[cw(3,0+2*1)] == 3);
  ASSUME(sforbid(0+2*1,cw(3,0+2*1))== 0);
  ASSUME(iw(3,0+2*1) >= 0);
  ASSUME(iw(3,0+2*1) >= 0);
  ASSUME(cw(3,0+2*1) >= iw(3,0+2*1));
  ASSUME(cw(3,0+2*1) >= old_cw);
  ASSUME(cw(3,0+2*1) >= cr(3,0+2*1));
  ASSUME(cw(3,0+2*1) >= cl[3]);
  ASSUME(cw(3,0+2*1) >= cisb[3]);
  ASSUME(cw(3,0+2*1) >= cdy[3]);
  ASSUME(cw(3,0+2*1) >= cdl[3]);
  ASSUME(cw(3,0+2*1) >= cds[3]);
  ASSUME(cw(3,0+2*1) >= cctrl[3]);
  ASSUME(cw(3,0+2*1) >= caddr[3]);
  // Update
  caddr[3] = max(caddr[3],0);
  buff(3,0+2*1) = 1;
  mem(0+2*1,cw(3,0+2*1)) = 1;
  co(0+2*1,cw(3,0+2*1))+=1;
  delta(0+2*1,cw(3,0+2*1)) = -1;
  ASSUME(creturn[3] >= cw(3,0+2*1));

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 5), metadata !161, metadata !DIExpression()), !dbg !170

  //   call void @llvm.dbg.value(metadata i64 1, metadata !163, metadata !DIExpression()), !dbg !170

  //   store atomic i64 1, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 5) release, align 8, !dbg !56
  // ST: Guess
  //   : Release
  iw(3,0+5*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STIW 
  old_cw = cw(3,0+5*1);
  cw(3,0+5*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(3,0+5*1)] == 3);
  ASSUME(active[cw(3,0+5*1)] == 3);
  ASSUME(sforbid(0+5*1,cw(3,0+5*1))== 0);
  ASSUME(iw(3,0+5*1) >= 0);
  ASSUME(iw(3,0+5*1) >= 0);
  ASSUME(cw(3,0+5*1) >= iw(3,0+5*1));
  ASSUME(cw(3,0+5*1) >= old_cw);
  ASSUME(cw(3,0+5*1) >= cr(3,0+5*1));
  ASSUME(cw(3,0+5*1) >= cl[3]);
  ASSUME(cw(3,0+5*1) >= cisb[3]);
  ASSUME(cw(3,0+5*1) >= cdy[3]);
  ASSUME(cw(3,0+5*1) >= cdl[3]);
  ASSUME(cw(3,0+5*1) >= cds[3]);
  ASSUME(cw(3,0+5*1) >= cctrl[3]);
  ASSUME(cw(3,0+5*1) >= caddr[3]);
  ASSUME(cw(3,0+5*1) >= cr(3,0+0));
  ASSUME(cw(3,0+5*1) >= cr(3,0+1));
  ASSUME(cw(3,0+5*1) >= cr(3,0+2));
  ASSUME(cw(3,0+5*1) >= cr(3,0+3));
  ASSUME(cw(3,0+5*1) >= cr(3,0+4));
  ASSUME(cw(3,0+5*1) >= cr(3,0+5));
  ASSUME(cw(3,0+5*1) >= cr(3,6+0));
  ASSUME(cw(3,0+5*1) >= cr(3,7+0));
  ASSUME(cw(3,0+5*1) >= cr(3,8+0));
  ASSUME(cw(3,0+5*1) >= cr(3,9+0));
  ASSUME(cw(3,0+5*1) >= cr(3,10+0));
  ASSUME(cw(3,0+5*1) >= cr(3,11+0));
  ASSUME(cw(3,0+5*1) >= cr(3,12+0));
  ASSUME(cw(3,0+5*1) >= cr(3,13+0));
  ASSUME(cw(3,0+5*1) >= cw(3,0+0));
  ASSUME(cw(3,0+5*1) >= cw(3,0+1));
  ASSUME(cw(3,0+5*1) >= cw(3,0+2));
  ASSUME(cw(3,0+5*1) >= cw(3,0+3));
  ASSUME(cw(3,0+5*1) >= cw(3,0+4));
  ASSUME(cw(3,0+5*1) >= cw(3,0+5));
  ASSUME(cw(3,0+5*1) >= cw(3,6+0));
  ASSUME(cw(3,0+5*1) >= cw(3,7+0));
  ASSUME(cw(3,0+5*1) >= cw(3,8+0));
  ASSUME(cw(3,0+5*1) >= cw(3,9+0));
  ASSUME(cw(3,0+5*1) >= cw(3,10+0));
  ASSUME(cw(3,0+5*1) >= cw(3,11+0));
  ASSUME(cw(3,0+5*1) >= cw(3,12+0));
  ASSUME(cw(3,0+5*1) >= cw(3,13+0));
  // Update
  caddr[3] = max(caddr[3],0);
  buff(3,0+5*1) = 1;
  mem(0+5*1,cw(3,0+5*1)) = 1;
  co(0+5*1,cw(3,0+5*1))+=1;
  delta(0+5*1,cw(3,0+5*1)) = -1;
  is(3,0+5*1) = iw(3,0+5*1);
  cs(3,0+5*1) = cw(3,0+5*1);
  ASSUME(creturn[3] >= cw(3,0+5*1));

  //   ret i8* null, !dbg !57
  ret_thread_3 = (- 1);


  // Dumping thread 0
  int ret_thread_0 = 0;
  cdy[0] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[0] >= cstart[0]);
T0BLOCK0:
  //   %thr0 = alloca i64, align 8

  //   %thr1 = alloca i64, align 8

  //   %thr2 = alloca i64, align 8

  //   call void @llvm.dbg.value(metadata i32 %argc, metadata !180, metadata !DIExpression()), !dbg !251

  //   call void @llvm.dbg.value(metadata i8** %argv, metadata !181, metadata !DIExpression()), !dbg !251

  //   %0 = bitcast i64* %thr0 to i8*, !dbg !118

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #7, !dbg !118

  //   call void @llvm.dbg.declare(metadata i64* %thr0, metadata !182, metadata !DIExpression()), !dbg !253

  //   %1 = bitcast i64* %thr1 to i8*, !dbg !120

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #7, !dbg !120

  //   call void @llvm.dbg.declare(metadata i64* %thr1, metadata !186, metadata !DIExpression()), !dbg !255

  //   %2 = bitcast i64* %thr2 to i8*, !dbg !122

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #7, !dbg !122

  //   call void @llvm.dbg.declare(metadata i64* %thr2, metadata !187, metadata !DIExpression()), !dbg !257

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 5), metadata !188, metadata !DIExpression()), !dbg !258

  //   call void @llvm.dbg.value(metadata i64 0, metadata !190, metadata !DIExpression()), !dbg !258

  //   store atomic i64 0, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 5) monotonic, align 8, !dbg !125
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 4), metadata !191, metadata !DIExpression()), !dbg !260

  //   call void @llvm.dbg.value(metadata i64 0, metadata !193, metadata !DIExpression()), !dbg !260

  //   store atomic i64 0, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 4) monotonic, align 8, !dbg !127
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 3), metadata !194, metadata !DIExpression()), !dbg !262

  //   call void @llvm.dbg.value(metadata i64 0, metadata !196, metadata !DIExpression()), !dbg !262

  //   store atomic i64 0, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !129
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 2), metadata !197, metadata !DIExpression()), !dbg !264

  //   call void @llvm.dbg.value(metadata i64 0, metadata !199, metadata !DIExpression()), !dbg !264

  //   store atomic i64 0, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 2) monotonic, align 8, !dbg !131
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 1), metadata !200, metadata !DIExpression()), !dbg !266

  //   call void @llvm.dbg.value(metadata i64 0, metadata !202, metadata !DIExpression()), !dbg !266

  //   store atomic i64 0, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !133
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 0), metadata !203, metadata !DIExpression()), !dbg !268

  //   call void @llvm.dbg.value(metadata i64 0, metadata !205, metadata !DIExpression()), !dbg !268

  //   store atomic i64 0, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !135
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

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X0_1, metadata !206, metadata !DIExpression()), !dbg !270

  //   call void @llvm.dbg.value(metadata i64 0, metadata !208, metadata !DIExpression()), !dbg !270

  //   store atomic i64 0, i64* @atom_0_X0_1 monotonic, align 8, !dbg !137
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

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X5_0, metadata !209, metadata !DIExpression()), !dbg !272

  //   call void @llvm.dbg.value(metadata i64 0, metadata !211, metadata !DIExpression()), !dbg !272

  //   store atomic i64 0, i64* @atom_0_X5_0 monotonic, align 8, !dbg !139
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

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X7_1, metadata !212, metadata !DIExpression()), !dbg !274

  //   call void @llvm.dbg.value(metadata i64 0, metadata !214, metadata !DIExpression()), !dbg !274

  //   store atomic i64 0, i64* @atom_0_X7_1 monotonic, align 8, !dbg !141
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

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X3_1, metadata !215, metadata !DIExpression()), !dbg !276

  //   call void @llvm.dbg.value(metadata i64 0, metadata !217, metadata !DIExpression()), !dbg !276

  //   store atomic i64 0, i64* @atom_0_X3_1 monotonic, align 8, !dbg !143
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

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X2_1, metadata !218, metadata !DIExpression()), !dbg !278

  //   call void @llvm.dbg.value(metadata i64 0, metadata !220, metadata !DIExpression()), !dbg !278

  //   store atomic i64 0, i64* @atom_1_X2_1 monotonic, align 8, !dbg !145
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

  //   %call = call i32 @pthread_create(i64* noundef %thr0, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t0, i8* noundef null) #7, !dbg !146
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
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[1] >= cdy[0]);

  //   %call21 = call i32 @pthread_create(i64* noundef %thr1, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t1, i8* noundef null) #7, !dbg !147
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
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[2] >= cdy[0]);

  //   %call22 = call i32 @pthread_create(i64* noundef %thr2, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t2, i8* noundef null) #7, !dbg !148
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
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[3] >= cdy[0]);

  //   %3 = load i64, i64* %thr0, align 8, !dbg !149, !tbaa !150
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
  creg_r6 = cr(0,11);
  crmax(0,11) = max(crmax(0,11),cr(0,11));
  caddr[0] = max(caddr[0],0);
  if(cr(0,11) < cw(0,11)) {
    r6 = buff(0,11);
  } else {
    if(pw(0,11) != co(11,cr(0,11))) {
      ASSUME(cr(0,11) >= old_cr);
    }
    pw(0,11) = co(11,cr(0,11));
    r6 = mem(11,cr(0,11));
  }
  ASSUME(creturn[0] >= cr(0,11));

  //   %call23 = call i32 @pthread_join(i64 noundef %3, i8** noundef null), !dbg !154
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
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[1]);

  //   %4 = load i64, i64* %thr1, align 8, !dbg !155, !tbaa !150
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

  //   %call24 = call i32 @pthread_join(i64 noundef %4, i8** noundef null), !dbg !156
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
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[2]);

  //   %5 = load i64, i64* %thr2, align 8, !dbg !157, !tbaa !150
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

  //   %call25 = call i32 @pthread_join(i64 noundef %5, i8** noundef null), !dbg !158
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
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[3]);

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X0_1, metadata !222, metadata !DIExpression()), !dbg !293

  //   %6 = load atomic i64, i64* @atom_0_X0_1 seq_cst, align 8, !dbg !160
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
  creg_r9 = cr(0,6);
  crmax(0,6) = max(crmax(0,6),cr(0,6));
  caddr[0] = max(caddr[0],0);
  if(cr(0,6) < cw(0,6)) {
    r9 = buff(0,6);
  } else {
    if(pw(0,6) != co(6,cr(0,6))) {
      ASSUME(cr(0,6) >= old_cr);
    }
    pw(0,6) = co(6,cr(0,6));
    r9 = mem(6,cr(0,6));
  }
  ASSUME(creturn[0] >= cr(0,6));

  //   call void @llvm.dbg.value(metadata i64 %6, metadata !224, metadata !DIExpression()), !dbg !293

  //   %conv = trunc i64 %6 to i32, !dbg !161

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !221, metadata !DIExpression()), !dbg !251

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X5_0, metadata !226, metadata !DIExpression()), !dbg !296

  //   %7 = load atomic i64, i64* @atom_0_X5_0 seq_cst, align 8, !dbg !163
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
  creg_r10 = cr(0,7);
  crmax(0,7) = max(crmax(0,7),cr(0,7));
  caddr[0] = max(caddr[0],0);
  if(cr(0,7) < cw(0,7)) {
    r10 = buff(0,7);
  } else {
    if(pw(0,7) != co(7,cr(0,7))) {
      ASSUME(cr(0,7) >= old_cr);
    }
    pw(0,7) = co(7,cr(0,7));
    r10 = mem(7,cr(0,7));
  }
  ASSUME(creturn[0] >= cr(0,7));

  //   call void @llvm.dbg.value(metadata i64 %7, metadata !228, metadata !DIExpression()), !dbg !296

  //   %conv29 = trunc i64 %7 to i32, !dbg !164

  //   call void @llvm.dbg.value(metadata i32 %conv29, metadata !225, metadata !DIExpression()), !dbg !251

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X7_1, metadata !230, metadata !DIExpression()), !dbg !299

  //   %8 = load atomic i64, i64* @atom_0_X7_1 seq_cst, align 8, !dbg !166
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
  creg_r11 = cr(0,8);
  crmax(0,8) = max(crmax(0,8),cr(0,8));
  caddr[0] = max(caddr[0],0);
  if(cr(0,8) < cw(0,8)) {
    r11 = buff(0,8);
  } else {
    if(pw(0,8) != co(8,cr(0,8))) {
      ASSUME(cr(0,8) >= old_cr);
    }
    pw(0,8) = co(8,cr(0,8));
    r11 = mem(8,cr(0,8));
  }
  ASSUME(creturn[0] >= cr(0,8));

  //   call void @llvm.dbg.value(metadata i64 %8, metadata !232, metadata !DIExpression()), !dbg !299

  //   %conv33 = trunc i64 %8 to i32, !dbg !167

  //   call void @llvm.dbg.value(metadata i32 %conv33, metadata !229, metadata !DIExpression()), !dbg !251

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 4), metadata !234, metadata !DIExpression()), !dbg !302

  //   %9 = load atomic i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 4) seq_cst, align 8, !dbg !169
  // LD: Guess
  old_cr = cr(0,0+4*1);
  cr(0,0+4*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(0,0+4*1)] == 0);
  ASSUME(cr(0,0+4*1) >= iw(0,0+4*1));
  ASSUME(cr(0,0+4*1) >= 0);
  ASSUME(cr(0,0+4*1) >= cdy[0]);
  ASSUME(cr(0,0+4*1) >= cisb[0]);
  ASSUME(cr(0,0+4*1) >= cdl[0]);
  ASSUME(cr(0,0+4*1) >= cl[0]);
  // Update
  creg_r12 = cr(0,0+4*1);
  crmax(0,0+4*1) = max(crmax(0,0+4*1),cr(0,0+4*1));
  caddr[0] = max(caddr[0],0);
  if(cr(0,0+4*1) < cw(0,0+4*1)) {
    r12 = buff(0,0+4*1);
  } else {
    if(pw(0,0+4*1) != co(0+4*1,cr(0,0+4*1))) {
      ASSUME(cr(0,0+4*1) >= old_cr);
    }
    pw(0,0+4*1) = co(0+4*1,cr(0,0+4*1));
    r12 = mem(0+4*1,cr(0,0+4*1));
  }
  ASSUME(creturn[0] >= cr(0,0+4*1));

  //   call void @llvm.dbg.value(metadata i64 %9, metadata !236, metadata !DIExpression()), !dbg !302

  //   %conv37 = trunc i64 %9 to i32, !dbg !170

  //   call void @llvm.dbg.value(metadata i32 %conv37, metadata !233, metadata !DIExpression()), !dbg !251

  //   %cmp = icmp eq i32 %conv37, 2, !dbg !171

  //   %conv38 = zext i1 %cmp to i32, !dbg !171

  //   call void @llvm.dbg.value(metadata i32 %conv38, metadata !237, metadata !DIExpression()), !dbg !251

  //   call void @llvm.dbg.value(metadata i64* @atom_0_X3_1, metadata !239, metadata !DIExpression()), !dbg !306

  //   %10 = load atomic i64, i64* @atom_0_X3_1 seq_cst, align 8, !dbg !173
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
  creg_r13 = cr(0,9);
  crmax(0,9) = max(crmax(0,9),cr(0,9));
  caddr[0] = max(caddr[0],0);
  if(cr(0,9) < cw(0,9)) {
    r13 = buff(0,9);
  } else {
    if(pw(0,9) != co(9,cr(0,9))) {
      ASSUME(cr(0,9) >= old_cr);
    }
    pw(0,9) = co(9,cr(0,9));
    r13 = mem(9,cr(0,9));
  }
  ASSUME(creturn[0] >= cr(0,9));

  //   call void @llvm.dbg.value(metadata i64 %10, metadata !241, metadata !DIExpression()), !dbg !306

  //   %conv42 = trunc i64 %10 to i32, !dbg !174

  //   call void @llvm.dbg.value(metadata i32 %conv42, metadata !238, metadata !DIExpression()), !dbg !251

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X2_1, metadata !243, metadata !DIExpression()), !dbg !309

  //   %11 = load atomic i64, i64* @atom_1_X2_1 seq_cst, align 8, !dbg !176
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
  creg_r14 = cr(0,10);
  crmax(0,10) = max(crmax(0,10),cr(0,10));
  caddr[0] = max(caddr[0],0);
  if(cr(0,10) < cw(0,10)) {
    r14 = buff(0,10);
  } else {
    if(pw(0,10) != co(10,cr(0,10))) {
      ASSUME(cr(0,10) >= old_cr);
    }
    pw(0,10) = co(10,cr(0,10));
    r14 = mem(10,cr(0,10));
  }
  ASSUME(creturn[0] >= cr(0,10));

  //   call void @llvm.dbg.value(metadata i64 %11, metadata !245, metadata !DIExpression()), !dbg !309

  //   %conv46 = trunc i64 %11 to i32, !dbg !177

  //   call void @llvm.dbg.value(metadata i32 %conv46, metadata !242, metadata !DIExpression()), !dbg !251

  //   %or = or i32 %conv42, %conv46, !dbg !178
  creg_r15 = max(creg_r13,creg_r14);
  ASSUME(active[creg_r15] == 0);
  r15 = r13 | r14;

  //   call void @llvm.dbg.value(metadata i32 %or, metadata !246, metadata !DIExpression()), !dbg !251

  //   %and = and i32 %conv38, %or, !dbg !179
  creg_r16 = max(max(creg_r12,0),creg_r15);
  ASSUME(active[creg_r16] == 0);
  r16 = (r12==2) & r15;

  //   call void @llvm.dbg.value(metadata i32 %and, metadata !247, metadata !DIExpression()), !dbg !251

  //   %and47 = and i32 %conv33, %and, !dbg !180
  creg_r17 = max(creg_r11,creg_r16);
  ASSUME(active[creg_r17] == 0);
  r17 = r11 & r16;

  //   call void @llvm.dbg.value(metadata i32 %and47, metadata !248, metadata !DIExpression()), !dbg !251

  //   %and48 = and i32 %conv29, %and47, !dbg !181
  creg_r18 = max(creg_r10,creg_r17);
  ASSUME(active[creg_r18] == 0);
  r18 = r10 & r17;

  //   call void @llvm.dbg.value(metadata i32 %and48, metadata !249, metadata !DIExpression()), !dbg !251

  //   %and49 = and i32 %conv, %and48, !dbg !182
  creg_r19 = max(creg_r9,creg_r18);
  ASSUME(active[creg_r19] == 0);
  r19 = r9 & r18;

  //   call void @llvm.dbg.value(metadata i32 %and49, metadata !250, metadata !DIExpression()), !dbg !251

  //   %cmp50 = icmp eq i32 %and49, 1, !dbg !183

  //   br i1 %cmp50, label %if.then, label %if.end, !dbg !185
  old_cctrl = cctrl[0];
  cctrl[0] = get_rng(0,NCONTEXT-1);
  ASSUME(cctrl[0] >= old_cctrl);
  ASSUME(cctrl[0] >= creg_r19);
  ASSUME(cctrl[0] >= 0);
  if((r19==1)) {
    goto T0BLOCK1;
  } else {
    goto T0BLOCK2;
  }

T0BLOCK1:
  //   call void @__assert_fail(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([106 x i8], [106 x i8]* @.str.1, i64 0, i64 0), i32 noundef 98, i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #8, !dbg !186

  //   unreachable, !dbg !186
  r20 = 1;

T0BLOCK2:
  //   %12 = bitcast i64* %thr2 to i8*, !dbg !189

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %12) #7, !dbg !189

  //   %13 = bitcast i64* %thr1 to i8*, !dbg !189

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %13) #7, !dbg !189

  //   %14 = bitcast i64* %thr0 to i8*, !dbg !189

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %14) #7, !dbg !189

  //   ret i32 0, !dbg !190
  ret_thread_0 = 0;



  ASSERT(r20== 0);

}
