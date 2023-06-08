// 0:vars:5
// 7:atom_1_X0_1:1
// 8:atom_2_X0_1:1
// 5:atom_3_X2_0:1
// 9:atom_3_X0_1:1
// 6:atom_4_X1_0:1
// 10:thr0:1
// 11:thr1:1
// 12:thr2:1
// 13:thr3:1
// 14:thr4:1
#define ADDRSIZE 15
#define NPROC 6
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
  cl[5] = 0;
  cdy[5] = 0;
  cds[5] = 0;
  cdl[5] = 0;
  cisb[5] = 0;
  caddr[5] = 0;
  cctrl[5] = 0;
  cstart[5] = get_rng(0,NCONTEXT-1);
  creturn[5] = get_rng(0,NCONTEXT-1);
  // Dumping initializations
  mem(0+0,0) = 0;
  mem(0+1,0) = 0;
  mem(0+2,0) = 0;
  mem(0+3,0) = 0;
  mem(0+4,0) = 0;
  mem(7+0,0) = 0;
  mem(8+0,0) = 0;
  mem(5+0,0) = 0;
  mem(9+0,0) = 0;
  mem(6+0,0) = 0;
  mem(10+0,0) = 0;
  mem(11+0,0) = 0;
  mem(12+0,0) = 0;
  mem(13+0,0) = 0;
  mem(14+0,0) = 0;
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
  // Dumping thread 1
  int ret_thread_1 = 0;
  cdy[1] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[1] >= cstart[1]);
T1BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !41, metadata !DIExpression()), !dbg !50

  //   br label %label_1, !dbg !51
  goto T1BLOCK1;

T1BLOCK1:
  //   call void @llvm.dbg.label(metadata !49), !dbg !52

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 1), metadata !42, metadata !DIExpression()), !dbg !53

  //   call void @llvm.dbg.value(metadata i64 3, metadata !45, metadata !DIExpression()), !dbg !53

  //   store atomic i64 3, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !54
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 0), metadata !46, metadata !DIExpression()), !dbg !55

  //   call void @llvm.dbg.value(metadata i64 1, metadata !48, metadata !DIExpression()), !dbg !55

  //   store atomic i64 1, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 0) release, align 8, !dbg !56
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
  ASSUME(cw(1,0) >= cr(1,7+0));
  ASSUME(cw(1,0) >= cr(1,8+0));
  ASSUME(cw(1,0) >= cr(1,5+0));
  ASSUME(cw(1,0) >= cr(1,9+0));
  ASSUME(cw(1,0) >= cr(1,6+0));
  ASSUME(cw(1,0) >= cr(1,10+0));
  ASSUME(cw(1,0) >= cr(1,11+0));
  ASSUME(cw(1,0) >= cr(1,12+0));
  ASSUME(cw(1,0) >= cr(1,13+0));
  ASSUME(cw(1,0) >= cr(1,14+0));
  ASSUME(cw(1,0) >= cw(1,0+0));
  ASSUME(cw(1,0) >= cw(1,0+1));
  ASSUME(cw(1,0) >= cw(1,0+2));
  ASSUME(cw(1,0) >= cw(1,0+3));
  ASSUME(cw(1,0) >= cw(1,0+4));
  ASSUME(cw(1,0) >= cw(1,7+0));
  ASSUME(cw(1,0) >= cw(1,8+0));
  ASSUME(cw(1,0) >= cw(1,5+0));
  ASSUME(cw(1,0) >= cw(1,9+0));
  ASSUME(cw(1,0) >= cw(1,6+0));
  ASSUME(cw(1,0) >= cw(1,10+0));
  ASSUME(cw(1,0) >= cw(1,11+0));
  ASSUME(cw(1,0) >= cw(1,12+0));
  ASSUME(cw(1,0) >= cw(1,13+0));
  ASSUME(cw(1,0) >= cw(1,14+0));
  // Update
  caddr[1] = max(caddr[1],0);
  buff(1,0) = 1;
  mem(0,cw(1,0)) = 1;
  co(0,cw(1,0))+=1;
  delta(0,cw(1,0)) = -1;
  is(1,0) = iw(1,0);
  cs(1,0) = cw(1,0);
  ASSUME(creturn[1] >= cw(1,0));

  //   ret i8* null, !dbg !57
  ret_thread_1 = (- 1);


  // Dumping thread 2
  int ret_thread_2 = 0;
  cdy[2] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[2] >= cstart[2]);
T2BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !60, metadata !DIExpression()), !dbg !74

  //   br label %label_2, !dbg !57
  goto T2BLOCK1;

T2BLOCK1:
  //   call void @llvm.dbg.label(metadata !73), !dbg !76

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 0), metadata !63, metadata !DIExpression()), !dbg !77

  //   %0 = load atomic i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 0) acquire, align 8, !dbg !60
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
  ASSUME(cr(2,0) >= cs(2,7+0));
  ASSUME(cr(2,0) >= cs(2,8+0));
  ASSUME(cr(2,0) >= cs(2,5+0));
  ASSUME(cr(2,0) >= cs(2,9+0));
  ASSUME(cr(2,0) >= cs(2,6+0));
  ASSUME(cr(2,0) >= cs(2,10+0));
  ASSUME(cr(2,0) >= cs(2,11+0));
  ASSUME(cr(2,0) >= cs(2,12+0));
  ASSUME(cr(2,0) >= cs(2,13+0));
  ASSUME(cr(2,0) >= cs(2,14+0));
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

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !65, metadata !DIExpression()), !dbg !77

  //   %conv = trunc i64 %0 to i32, !dbg !61

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !61, metadata !DIExpression()), !dbg !74

  //   call void (...) @dmbsy(), !dbg !62
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
  ASSUME(cdy[2] >= cw(2,7+0));
  ASSUME(cdy[2] >= cw(2,8+0));
  ASSUME(cdy[2] >= cw(2,5+0));
  ASSUME(cdy[2] >= cw(2,9+0));
  ASSUME(cdy[2] >= cw(2,6+0));
  ASSUME(cdy[2] >= cw(2,10+0));
  ASSUME(cdy[2] >= cw(2,11+0));
  ASSUME(cdy[2] >= cw(2,12+0));
  ASSUME(cdy[2] >= cw(2,13+0));
  ASSUME(cdy[2] >= cw(2,14+0));
  ASSUME(cdy[2] >= cr(2,0+0));
  ASSUME(cdy[2] >= cr(2,0+1));
  ASSUME(cdy[2] >= cr(2,0+2));
  ASSUME(cdy[2] >= cr(2,0+3));
  ASSUME(cdy[2] >= cr(2,0+4));
  ASSUME(cdy[2] >= cr(2,7+0));
  ASSUME(cdy[2] >= cr(2,8+0));
  ASSUME(cdy[2] >= cr(2,5+0));
  ASSUME(cdy[2] >= cr(2,9+0));
  ASSUME(cdy[2] >= cr(2,6+0));
  ASSUME(cdy[2] >= cr(2,10+0));
  ASSUME(cdy[2] >= cr(2,11+0));
  ASSUME(cdy[2] >= cr(2,12+0));
  ASSUME(cdy[2] >= cr(2,13+0));
  ASSUME(cdy[2] >= cr(2,14+0));
  ASSUME(creturn[2] >= cdy[2]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 2), metadata !66, metadata !DIExpression()), !dbg !81

  //   call void @llvm.dbg.value(metadata i64 1, metadata !68, metadata !DIExpression()), !dbg !81

  //   store atomic i64 1, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 2) monotonic, align 8, !dbg !64
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

  //   %cmp = icmp eq i32 %conv, 1, !dbg !65

  //   %conv1 = zext i1 %cmp to i32, !dbg !65

  //   call void @llvm.dbg.value(metadata i32 %conv1, metadata !69, metadata !DIExpression()), !dbg !74

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X0_1, metadata !70, metadata !DIExpression()), !dbg !84

  //   %1 = zext i32 %conv1 to i64

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !72, metadata !DIExpression()), !dbg !84

  //   store atomic i64 %1, i64* @atom_1_X0_1 seq_cst, align 8, !dbg !67
  // ST: Guess
  iw(2,7) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW 
  old_cw = cw(2,7);
  cw(2,7) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(2,7)] == 2);
  ASSUME(active[cw(2,7)] == 2);
  ASSUME(sforbid(7,cw(2,7))== 0);
  ASSUME(iw(2,7) >= max(creg_r0,0));
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
  buff(2,7) = (r0==1);
  mem(7,cw(2,7)) = (r0==1);
  co(7,cw(2,7))+=1;
  delta(7,cw(2,7)) = -1;
  ASSUME(creturn[2] >= cw(2,7));

  //   ret i8* null, !dbg !68
  ret_thread_2 = (- 1);


  // Dumping thread 3
  int ret_thread_3 = 0;
  cdy[3] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[3] >= cstart[3]);
T3BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !89, metadata !DIExpression()), !dbg !102

  //   br label %label_3, !dbg !57
  goto T3BLOCK1;

T3BLOCK1:
  //   call void @llvm.dbg.label(metadata !101), !dbg !104

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 2), metadata !91, metadata !DIExpression()), !dbg !105

  //   %0 = load atomic i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 2) monotonic, align 8, !dbg !60
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
  ASSUME(creturn[3] >= cr(3,0+2*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !93, metadata !DIExpression()), !dbg !105

  //   %conv = trunc i64 %0 to i32, !dbg !61

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !90, metadata !DIExpression()), !dbg !102

  //   call void (...) @dmbsy(), !dbg !62
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
  ASSUME(cdy[3] >= cw(3,7+0));
  ASSUME(cdy[3] >= cw(3,8+0));
  ASSUME(cdy[3] >= cw(3,5+0));
  ASSUME(cdy[3] >= cw(3,9+0));
  ASSUME(cdy[3] >= cw(3,6+0));
  ASSUME(cdy[3] >= cw(3,10+0));
  ASSUME(cdy[3] >= cw(3,11+0));
  ASSUME(cdy[3] >= cw(3,12+0));
  ASSUME(cdy[3] >= cw(3,13+0));
  ASSUME(cdy[3] >= cw(3,14+0));
  ASSUME(cdy[3] >= cr(3,0+0));
  ASSUME(cdy[3] >= cr(3,0+1));
  ASSUME(cdy[3] >= cr(3,0+2));
  ASSUME(cdy[3] >= cr(3,0+3));
  ASSUME(cdy[3] >= cr(3,0+4));
  ASSUME(cdy[3] >= cr(3,7+0));
  ASSUME(cdy[3] >= cr(3,8+0));
  ASSUME(cdy[3] >= cr(3,5+0));
  ASSUME(cdy[3] >= cr(3,9+0));
  ASSUME(cdy[3] >= cr(3,6+0));
  ASSUME(cdy[3] >= cr(3,10+0));
  ASSUME(cdy[3] >= cr(3,11+0));
  ASSUME(cdy[3] >= cr(3,12+0));
  ASSUME(cdy[3] >= cr(3,13+0));
  ASSUME(cdy[3] >= cr(3,14+0));
  ASSUME(creturn[3] >= cdy[3]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 3), metadata !94, metadata !DIExpression()), !dbg !109

  //   call void @llvm.dbg.value(metadata i64 1, metadata !96, metadata !DIExpression()), !dbg !109

  //   store atomic i64 1, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !64
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

  //   %cmp = icmp eq i32 %conv, 1, !dbg !65

  //   %conv1 = zext i1 %cmp to i32, !dbg !65

  //   call void @llvm.dbg.value(metadata i32 %conv1, metadata !97, metadata !DIExpression()), !dbg !102

  //   call void @llvm.dbg.value(metadata i64* @atom_2_X0_1, metadata !98, metadata !DIExpression()), !dbg !112

  //   %1 = zext i32 %conv1 to i64

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !100, metadata !DIExpression()), !dbg !112

  //   store atomic i64 %1, i64* @atom_2_X0_1 seq_cst, align 8, !dbg !67
  // ST: Guess
  iw(3,8) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STIW 
  old_cw = cw(3,8);
  cw(3,8) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(3,8)] == 3);
  ASSUME(active[cw(3,8)] == 3);
  ASSUME(sforbid(8,cw(3,8))== 0);
  ASSUME(iw(3,8) >= max(creg_r1,0));
  ASSUME(iw(3,8) >= 0);
  ASSUME(cw(3,8) >= iw(3,8));
  ASSUME(cw(3,8) >= old_cw);
  ASSUME(cw(3,8) >= cr(3,8));
  ASSUME(cw(3,8) >= cl[3]);
  ASSUME(cw(3,8) >= cisb[3]);
  ASSUME(cw(3,8) >= cdy[3]);
  ASSUME(cw(3,8) >= cdl[3]);
  ASSUME(cw(3,8) >= cds[3]);
  ASSUME(cw(3,8) >= cctrl[3]);
  ASSUME(cw(3,8) >= caddr[3]);
  // Update
  caddr[3] = max(caddr[3],0);
  buff(3,8) = (r1==1);
  mem(8,cw(3,8)) = (r1==1);
  co(8,cw(3,8))+=1;
  delta(8,cw(3,8)) = -1;
  ASSUME(creturn[3] >= cw(3,8));

  //   ret i8* null, !dbg !68
  ret_thread_3 = (- 1);


  // Dumping thread 4
  int ret_thread_4 = 0;
  cdy[4] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[4] >= cstart[4]);
T4BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !117, metadata !DIExpression()), !dbg !135

  //   br label %label_4, !dbg !62
  goto T4BLOCK1;

T4BLOCK1:
  //   call void @llvm.dbg.label(metadata !134), !dbg !137

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 3), metadata !119, metadata !DIExpression()), !dbg !138

  //   %0 = load atomic i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !65
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
  ASSUME(creturn[4] >= cr(4,0+3*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !121, metadata !DIExpression()), !dbg !138

  //   %conv = trunc i64 %0 to i32, !dbg !66

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !118, metadata !DIExpression()), !dbg !135

  //   call void (...) @dmbsy(), !dbg !67
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
  ASSUME(cdy[4] >= cw(4,7+0));
  ASSUME(cdy[4] >= cw(4,8+0));
  ASSUME(cdy[4] >= cw(4,5+0));
  ASSUME(cdy[4] >= cw(4,9+0));
  ASSUME(cdy[4] >= cw(4,6+0));
  ASSUME(cdy[4] >= cw(4,10+0));
  ASSUME(cdy[4] >= cw(4,11+0));
  ASSUME(cdy[4] >= cw(4,12+0));
  ASSUME(cdy[4] >= cw(4,13+0));
  ASSUME(cdy[4] >= cw(4,14+0));
  ASSUME(cdy[4] >= cr(4,0+0));
  ASSUME(cdy[4] >= cr(4,0+1));
  ASSUME(cdy[4] >= cr(4,0+2));
  ASSUME(cdy[4] >= cr(4,0+3));
  ASSUME(cdy[4] >= cr(4,0+4));
  ASSUME(cdy[4] >= cr(4,7+0));
  ASSUME(cdy[4] >= cr(4,8+0));
  ASSUME(cdy[4] >= cr(4,5+0));
  ASSUME(cdy[4] >= cr(4,9+0));
  ASSUME(cdy[4] >= cr(4,6+0));
  ASSUME(cdy[4] >= cr(4,10+0));
  ASSUME(cdy[4] >= cr(4,11+0));
  ASSUME(cdy[4] >= cr(4,12+0));
  ASSUME(cdy[4] >= cr(4,13+0));
  ASSUME(cdy[4] >= cr(4,14+0));
  ASSUME(creturn[4] >= cdy[4]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 4), metadata !123, metadata !DIExpression()), !dbg !142

  //   %1 = load atomic i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 4) monotonic, align 8, !dbg !69
  // LD: Guess
  old_cr = cr(4,0+4*1);
  cr(4,0+4*1) = get_rng(0,NCONTEXT-1);// 4 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(4,0+4*1)] == 4);
  ASSUME(cr(4,0+4*1) >= iw(4,0+4*1));
  ASSUME(cr(4,0+4*1) >= 0);
  ASSUME(cr(4,0+4*1) >= cdy[4]);
  ASSUME(cr(4,0+4*1) >= cisb[4]);
  ASSUME(cr(4,0+4*1) >= cdl[4]);
  ASSUME(cr(4,0+4*1) >= cl[4]);
  // Update
  creg_r3 = cr(4,0+4*1);
  crmax(4,0+4*1) = max(crmax(4,0+4*1),cr(4,0+4*1));
  caddr[4] = max(caddr[4],0);
  if(cr(4,0+4*1) < cw(4,0+4*1)) {
    r3 = buff(4,0+4*1);
  } else {
    if(pw(4,0+4*1) != co(0+4*1,cr(4,0+4*1))) {
      ASSUME(cr(4,0+4*1) >= old_cr);
    }
    pw(4,0+4*1) = co(0+4*1,cr(4,0+4*1));
    r3 = mem(0+4*1,cr(4,0+4*1));
  }
  ASSUME(creturn[4] >= cr(4,0+4*1));

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !125, metadata !DIExpression()), !dbg !142

  //   %conv4 = trunc i64 %1 to i32, !dbg !70

  //   call void @llvm.dbg.value(metadata i32 %conv4, metadata !122, metadata !DIExpression()), !dbg !135

  //   %cmp = icmp eq i32 %conv4, 0, !dbg !71

  //   %conv5 = zext i1 %cmp to i32, !dbg !71

  //   call void @llvm.dbg.value(metadata i32 %conv5, metadata !126, metadata !DIExpression()), !dbg !135

  //   call void @llvm.dbg.value(metadata i64* @atom_3_X2_0, metadata !127, metadata !DIExpression()), !dbg !146

  //   %2 = zext i32 %conv5 to i64

  //   call void @llvm.dbg.value(metadata i64 %2, metadata !129, metadata !DIExpression()), !dbg !146

  //   store atomic i64 %2, i64* @atom_3_X2_0 seq_cst, align 8, !dbg !73
  // ST: Guess
  iw(4,5) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STIW 
  old_cw = cw(4,5);
  cw(4,5) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(4,5)] == 4);
  ASSUME(active[cw(4,5)] == 4);
  ASSUME(sforbid(5,cw(4,5))== 0);
  ASSUME(iw(4,5) >= max(creg_r3,0));
  ASSUME(iw(4,5) >= 0);
  ASSUME(cw(4,5) >= iw(4,5));
  ASSUME(cw(4,5) >= old_cw);
  ASSUME(cw(4,5) >= cr(4,5));
  ASSUME(cw(4,5) >= cl[4]);
  ASSUME(cw(4,5) >= cisb[4]);
  ASSUME(cw(4,5) >= cdy[4]);
  ASSUME(cw(4,5) >= cdl[4]);
  ASSUME(cw(4,5) >= cds[4]);
  ASSUME(cw(4,5) >= cctrl[4]);
  ASSUME(cw(4,5) >= caddr[4]);
  // Update
  caddr[4] = max(caddr[4],0);
  buff(4,5) = (r3==0);
  mem(5,cw(4,5)) = (r3==0);
  co(5,cw(4,5))+=1;
  delta(5,cw(4,5)) = -1;
  ASSUME(creturn[4] >= cw(4,5));

  //   %cmp7 = icmp eq i32 %conv, 1, !dbg !74

  //   %conv8 = zext i1 %cmp7 to i32, !dbg !74

  //   call void @llvm.dbg.value(metadata i32 %conv8, metadata !130, metadata !DIExpression()), !dbg !135

  //   call void @llvm.dbg.value(metadata i64* @atom_3_X0_1, metadata !131, metadata !DIExpression()), !dbg !149

  //   %3 = zext i32 %conv8 to i64

  //   call void @llvm.dbg.value(metadata i64 %3, metadata !133, metadata !DIExpression()), !dbg !149

  //   store atomic i64 %3, i64* @atom_3_X0_1 seq_cst, align 8, !dbg !76
  // ST: Guess
  iw(4,9) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STIW 
  old_cw = cw(4,9);
  cw(4,9) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(4,9)] == 4);
  ASSUME(active[cw(4,9)] == 4);
  ASSUME(sforbid(9,cw(4,9))== 0);
  ASSUME(iw(4,9) >= max(creg_r2,0));
  ASSUME(iw(4,9) >= 0);
  ASSUME(cw(4,9) >= iw(4,9));
  ASSUME(cw(4,9) >= old_cw);
  ASSUME(cw(4,9) >= cr(4,9));
  ASSUME(cw(4,9) >= cl[4]);
  ASSUME(cw(4,9) >= cisb[4]);
  ASSUME(cw(4,9) >= cdy[4]);
  ASSUME(cw(4,9) >= cdl[4]);
  ASSUME(cw(4,9) >= cds[4]);
  ASSUME(cw(4,9) >= cctrl[4]);
  ASSUME(cw(4,9) >= caddr[4]);
  // Update
  caddr[4] = max(caddr[4],0);
  buff(4,9) = (r2==1);
  mem(9,cw(4,9)) = (r2==1);
  co(9,cw(4,9))+=1;
  delta(9,cw(4,9)) = -1;
  ASSUME(creturn[4] >= cw(4,9));

  //   ret i8* null, !dbg !77
  ret_thread_4 = (- 1);


  // Dumping thread 5
  int ret_thread_5 = 0;
  cdy[5] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[5] >= cstart[5]);
T5BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !154, metadata !DIExpression()), !dbg !167

  //   br label %label_5, !dbg !57
  goto T5BLOCK1;

T5BLOCK1:
  //   call void @llvm.dbg.label(metadata !166), !dbg !169

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 4), metadata !155, metadata !DIExpression()), !dbg !170

  //   call void @llvm.dbg.value(metadata i64 1, metadata !157, metadata !DIExpression()), !dbg !170

  //   store atomic i64 1, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 4) monotonic, align 8, !dbg !60
  // ST: Guess
  iw(5,0+4*1) = get_rng(0,NCONTEXT-1);// 5 ASSIGN STIW 
  old_cw = cw(5,0+4*1);
  cw(5,0+4*1) = get_rng(0,NCONTEXT-1);// 5 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(5,0+4*1)] == 5);
  ASSUME(active[cw(5,0+4*1)] == 5);
  ASSUME(sforbid(0+4*1,cw(5,0+4*1))== 0);
  ASSUME(iw(5,0+4*1) >= 0);
  ASSUME(iw(5,0+4*1) >= 0);
  ASSUME(cw(5,0+4*1) >= iw(5,0+4*1));
  ASSUME(cw(5,0+4*1) >= old_cw);
  ASSUME(cw(5,0+4*1) >= cr(5,0+4*1));
  ASSUME(cw(5,0+4*1) >= cl[5]);
  ASSUME(cw(5,0+4*1) >= cisb[5]);
  ASSUME(cw(5,0+4*1) >= cdy[5]);
  ASSUME(cw(5,0+4*1) >= cdl[5]);
  ASSUME(cw(5,0+4*1) >= cds[5]);
  ASSUME(cw(5,0+4*1) >= cctrl[5]);
  ASSUME(cw(5,0+4*1) >= caddr[5]);
  // Update
  caddr[5] = max(caddr[5],0);
  buff(5,0+4*1) = 1;
  mem(0+4*1,cw(5,0+4*1)) = 1;
  co(0+4*1,cw(5,0+4*1))+=1;
  delta(0+4*1,cw(5,0+4*1)) = -1;
  ASSUME(creturn[5] >= cw(5,0+4*1));

  //   call void (...) @dmbsy(), !dbg !61
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
  ASSUME(cdy[5] >= cw(5,7+0));
  ASSUME(cdy[5] >= cw(5,8+0));
  ASSUME(cdy[5] >= cw(5,5+0));
  ASSUME(cdy[5] >= cw(5,9+0));
  ASSUME(cdy[5] >= cw(5,6+0));
  ASSUME(cdy[5] >= cw(5,10+0));
  ASSUME(cdy[5] >= cw(5,11+0));
  ASSUME(cdy[5] >= cw(5,12+0));
  ASSUME(cdy[5] >= cw(5,13+0));
  ASSUME(cdy[5] >= cw(5,14+0));
  ASSUME(cdy[5] >= cr(5,0+0));
  ASSUME(cdy[5] >= cr(5,0+1));
  ASSUME(cdy[5] >= cr(5,0+2));
  ASSUME(cdy[5] >= cr(5,0+3));
  ASSUME(cdy[5] >= cr(5,0+4));
  ASSUME(cdy[5] >= cr(5,7+0));
  ASSUME(cdy[5] >= cr(5,8+0));
  ASSUME(cdy[5] >= cr(5,5+0));
  ASSUME(cdy[5] >= cr(5,9+0));
  ASSUME(cdy[5] >= cr(5,6+0));
  ASSUME(cdy[5] >= cr(5,10+0));
  ASSUME(cdy[5] >= cr(5,11+0));
  ASSUME(cdy[5] >= cr(5,12+0));
  ASSUME(cdy[5] >= cr(5,13+0));
  ASSUME(cdy[5] >= cr(5,14+0));
  ASSUME(creturn[5] >= cdy[5]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 1), metadata !159, metadata !DIExpression()), !dbg !173

  //   %0 = load atomic i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !63
  // LD: Guess
  old_cr = cr(5,0+1*1);
  cr(5,0+1*1) = get_rng(0,NCONTEXT-1);// 5 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(5,0+1*1)] == 5);
  ASSUME(cr(5,0+1*1) >= iw(5,0+1*1));
  ASSUME(cr(5,0+1*1) >= 0);
  ASSUME(cr(5,0+1*1) >= cdy[5]);
  ASSUME(cr(5,0+1*1) >= cisb[5]);
  ASSUME(cr(5,0+1*1) >= cdl[5]);
  ASSUME(cr(5,0+1*1) >= cl[5]);
  // Update
  creg_r4 = cr(5,0+1*1);
  crmax(5,0+1*1) = max(crmax(5,0+1*1),cr(5,0+1*1));
  caddr[5] = max(caddr[5],0);
  if(cr(5,0+1*1) < cw(5,0+1*1)) {
    r4 = buff(5,0+1*1);
  } else {
    if(pw(5,0+1*1) != co(0+1*1,cr(5,0+1*1))) {
      ASSUME(cr(5,0+1*1) >= old_cr);
    }
    pw(5,0+1*1) = co(0+1*1,cr(5,0+1*1));
    r4 = mem(0+1*1,cr(5,0+1*1));
  }
  ASSUME(creturn[5] >= cr(5,0+1*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !161, metadata !DIExpression()), !dbg !173

  //   %conv = trunc i64 %0 to i32, !dbg !64

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !158, metadata !DIExpression()), !dbg !167

  //   %cmp = icmp eq i32 %conv, 0, !dbg !65

  //   %conv1 = zext i1 %cmp to i32, !dbg !65

  //   call void @llvm.dbg.value(metadata i32 %conv1, metadata !162, metadata !DIExpression()), !dbg !167

  //   call void @llvm.dbg.value(metadata i64* @atom_4_X1_0, metadata !163, metadata !DIExpression()), !dbg !177

  //   %1 = zext i32 %conv1 to i64

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !165, metadata !DIExpression()), !dbg !177

  //   store atomic i64 %1, i64* @atom_4_X1_0 seq_cst, align 8, !dbg !67
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

  //   ret i8* null, !dbg !68
  ret_thread_5 = (- 1);


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

  //   call void @llvm.dbg.value(metadata i32 %argc, metadata !187, metadata !DIExpression()), !dbg !251

  //   call void @llvm.dbg.value(metadata i8** %argv, metadata !188, metadata !DIExpression()), !dbg !251

  //   %0 = bitcast i64* %thr0 to i8*, !dbg !111

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #7, !dbg !111

  //   call void @llvm.dbg.declare(metadata i64* %thr0, metadata !189, metadata !DIExpression()), !dbg !253

  //   %1 = bitcast i64* %thr1 to i8*, !dbg !113

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #7, !dbg !113

  //   call void @llvm.dbg.declare(metadata i64* %thr1, metadata !193, metadata !DIExpression()), !dbg !255

  //   %2 = bitcast i64* %thr2 to i8*, !dbg !115

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #7, !dbg !115

  //   call void @llvm.dbg.declare(metadata i64* %thr2, metadata !194, metadata !DIExpression()), !dbg !257

  //   %3 = bitcast i64* %thr3 to i8*, !dbg !117

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #7, !dbg !117

  //   call void @llvm.dbg.declare(metadata i64* %thr3, metadata !195, metadata !DIExpression()), !dbg !259

  //   %4 = bitcast i64* %thr4 to i8*, !dbg !119

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #7, !dbg !119

  //   call void @llvm.dbg.declare(metadata i64* %thr4, metadata !196, metadata !DIExpression()), !dbg !261

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 4), metadata !197, metadata !DIExpression()), !dbg !262

  //   call void @llvm.dbg.value(metadata i64 0, metadata !199, metadata !DIExpression()), !dbg !262

  //   store atomic i64 0, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 4) monotonic, align 8, !dbg !122
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 3), metadata !200, metadata !DIExpression()), !dbg !264

  //   call void @llvm.dbg.value(metadata i64 0, metadata !202, metadata !DIExpression()), !dbg !264

  //   store atomic i64 0, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !124
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 2), metadata !203, metadata !DIExpression()), !dbg !266

  //   call void @llvm.dbg.value(metadata i64 0, metadata !205, metadata !DIExpression()), !dbg !266

  //   store atomic i64 0, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 2) monotonic, align 8, !dbg !126
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 1), metadata !206, metadata !DIExpression()), !dbg !268

  //   call void @llvm.dbg.value(metadata i64 0, metadata !208, metadata !DIExpression()), !dbg !268

  //   store atomic i64 0, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !128
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 0), metadata !209, metadata !DIExpression()), !dbg !270

  //   call void @llvm.dbg.value(metadata i64 0, metadata !211, metadata !DIExpression()), !dbg !270

  //   store atomic i64 0, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !130
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

  //   call void @llvm.dbg.value(metadata i64* @atom_3_X2_0, metadata !212, metadata !DIExpression()), !dbg !272

  //   call void @llvm.dbg.value(metadata i64 0, metadata !214, metadata !DIExpression()), !dbg !272

  //   store atomic i64 0, i64* @atom_3_X2_0 monotonic, align 8, !dbg !132
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

  //   call void @llvm.dbg.value(metadata i64* @atom_4_X1_0, metadata !215, metadata !DIExpression()), !dbg !274

  //   call void @llvm.dbg.value(metadata i64 0, metadata !217, metadata !DIExpression()), !dbg !274

  //   store atomic i64 0, i64* @atom_4_X1_0 monotonic, align 8, !dbg !134
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

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X0_1, metadata !218, metadata !DIExpression()), !dbg !276

  //   call void @llvm.dbg.value(metadata i64 0, metadata !220, metadata !DIExpression()), !dbg !276

  //   store atomic i64 0, i64* @atom_1_X0_1 monotonic, align 8, !dbg !136
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

  //   call void @llvm.dbg.value(metadata i64* @atom_2_X0_1, metadata !221, metadata !DIExpression()), !dbg !278

  //   call void @llvm.dbg.value(metadata i64 0, metadata !223, metadata !DIExpression()), !dbg !278

  //   store atomic i64 0, i64* @atom_2_X0_1 monotonic, align 8, !dbg !138
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

  //   call void @llvm.dbg.value(metadata i64* @atom_3_X0_1, metadata !224, metadata !DIExpression()), !dbg !280

  //   call void @llvm.dbg.value(metadata i64 0, metadata !226, metadata !DIExpression()), !dbg !280

  //   store atomic i64 0, i64* @atom_3_X0_1 monotonic, align 8, !dbg !140
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

  //   %call = call i32 @pthread_create(i64* noundef %thr0, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t0, i8* noundef null) #7, !dbg !141
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
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[1] >= cdy[0]);

  //   %call19 = call i32 @pthread_create(i64* noundef %thr1, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t1, i8* noundef null) #7, !dbg !142
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
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[2] >= cdy[0]);

  //   %call20 = call i32 @pthread_create(i64* noundef %thr2, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t2, i8* noundef null) #7, !dbg !143
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
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[3] >= cdy[0]);

  //   %call21 = call i32 @pthread_create(i64* noundef %thr3, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t3, i8* noundef null) #7, !dbg !144
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
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[4] >= cdy[0]);

  //   %call22 = call i32 @pthread_create(i64* noundef %thr4, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t4, i8* noundef null) #7, !dbg !145
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
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[5] >= cdy[0]);

  //   %5 = load i64, i64* %thr0, align 8, !dbg !146, !tbaa !147
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

  //   %call23 = call i32 @pthread_join(i64 noundef %5, i8** noundef null), !dbg !151
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
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[1]);

  //   %6 = load i64, i64* %thr1, align 8, !dbg !152, !tbaa !147
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
  creg_r7 = cr(0,11);
  crmax(0,11) = max(crmax(0,11),cr(0,11));
  caddr[0] = max(caddr[0],0);
  if(cr(0,11) < cw(0,11)) {
    r7 = buff(0,11);
  } else {
    if(pw(0,11) != co(11,cr(0,11))) {
      ASSUME(cr(0,11) >= old_cr);
    }
    pw(0,11) = co(11,cr(0,11));
    r7 = mem(11,cr(0,11));
  }
  ASSUME(creturn[0] >= cr(0,11));

  //   %call24 = call i32 @pthread_join(i64 noundef %6, i8** noundef null), !dbg !153
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
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[2]);

  //   %7 = load i64, i64* %thr2, align 8, !dbg !154, !tbaa !147
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
  creg_r8 = cr(0,12);
  crmax(0,12) = max(crmax(0,12),cr(0,12));
  caddr[0] = max(caddr[0],0);
  if(cr(0,12) < cw(0,12)) {
    r8 = buff(0,12);
  } else {
    if(pw(0,12) != co(12,cr(0,12))) {
      ASSUME(cr(0,12) >= old_cr);
    }
    pw(0,12) = co(12,cr(0,12));
    r8 = mem(12,cr(0,12));
  }
  ASSUME(creturn[0] >= cr(0,12));

  //   %call25 = call i32 @pthread_join(i64 noundef %7, i8** noundef null), !dbg !155
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
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[3]);

  //   %8 = load i64, i64* %thr3, align 8, !dbg !156, !tbaa !147
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
  creg_r9 = cr(0,13);
  crmax(0,13) = max(crmax(0,13),cr(0,13));
  caddr[0] = max(caddr[0],0);
  if(cr(0,13) < cw(0,13)) {
    r9 = buff(0,13);
  } else {
    if(pw(0,13) != co(13,cr(0,13))) {
      ASSUME(cr(0,13) >= old_cr);
    }
    pw(0,13) = co(13,cr(0,13));
    r9 = mem(13,cr(0,13));
  }
  ASSUME(creturn[0] >= cr(0,13));

  //   %call26 = call i32 @pthread_join(i64 noundef %8, i8** noundef null), !dbg !157
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
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[4]);

  //   %9 = load i64, i64* %thr4, align 8, !dbg !158, !tbaa !147
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
  creg_r10 = cr(0,14);
  crmax(0,14) = max(crmax(0,14),cr(0,14));
  caddr[0] = max(caddr[0],0);
  if(cr(0,14) < cw(0,14)) {
    r10 = buff(0,14);
  } else {
    if(pw(0,14) != co(14,cr(0,14))) {
      ASSUME(cr(0,14) >= old_cr);
    }
    pw(0,14) = co(14,cr(0,14));
    r10 = mem(14,cr(0,14));
  }
  ASSUME(creturn[0] >= cr(0,14));

  //   %call27 = call i32 @pthread_join(i64 noundef %9, i8** noundef null), !dbg !159
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
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,14+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[5]);

  //   call void @llvm.dbg.value(metadata i64* @atom_3_X2_0, metadata !228, metadata !DIExpression()), !dbg !301

  //   %10 = load atomic i64, i64* @atom_3_X2_0 seq_cst, align 8, !dbg !161
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
  creg_r11 = cr(0,5);
  crmax(0,5) = max(crmax(0,5),cr(0,5));
  caddr[0] = max(caddr[0],0);
  if(cr(0,5) < cw(0,5)) {
    r11 = buff(0,5);
  } else {
    if(pw(0,5) != co(5,cr(0,5))) {
      ASSUME(cr(0,5) >= old_cr);
    }
    pw(0,5) = co(5,cr(0,5));
    r11 = mem(5,cr(0,5));
  }
  ASSUME(creturn[0] >= cr(0,5));

  //   call void @llvm.dbg.value(metadata i64 %10, metadata !230, metadata !DIExpression()), !dbg !301

  //   %conv = trunc i64 %10 to i32, !dbg !162

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !227, metadata !DIExpression()), !dbg !251

  //   call void @llvm.dbg.value(metadata i64* @atom_4_X1_0, metadata !232, metadata !DIExpression()), !dbg !304

  //   %11 = load atomic i64, i64* @atom_4_X1_0 seq_cst, align 8, !dbg !164
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
  creg_r12 = cr(0,6);
  crmax(0,6) = max(crmax(0,6),cr(0,6));
  caddr[0] = max(caddr[0],0);
  if(cr(0,6) < cw(0,6)) {
    r12 = buff(0,6);
  } else {
    if(pw(0,6) != co(6,cr(0,6))) {
      ASSUME(cr(0,6) >= old_cr);
    }
    pw(0,6) = co(6,cr(0,6));
    r12 = mem(6,cr(0,6));
  }
  ASSUME(creturn[0] >= cr(0,6));

  //   call void @llvm.dbg.value(metadata i64 %11, metadata !234, metadata !DIExpression()), !dbg !304

  //   %conv31 = trunc i64 %11 to i32, !dbg !165

  //   call void @llvm.dbg.value(metadata i32 %conv31, metadata !231, metadata !DIExpression()), !dbg !251

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X0_1, metadata !236, metadata !DIExpression()), !dbg !307

  //   %12 = load atomic i64, i64* @atom_1_X0_1 seq_cst, align 8, !dbg !167
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
  creg_r13 = cr(0,7);
  crmax(0,7) = max(crmax(0,7),cr(0,7));
  caddr[0] = max(caddr[0],0);
  if(cr(0,7) < cw(0,7)) {
    r13 = buff(0,7);
  } else {
    if(pw(0,7) != co(7,cr(0,7))) {
      ASSUME(cr(0,7) >= old_cr);
    }
    pw(0,7) = co(7,cr(0,7));
    r13 = mem(7,cr(0,7));
  }
  ASSUME(creturn[0] >= cr(0,7));

  //   call void @llvm.dbg.value(metadata i64 %12, metadata !238, metadata !DIExpression()), !dbg !307

  //   %conv35 = trunc i64 %12 to i32, !dbg !168

  //   call void @llvm.dbg.value(metadata i32 %conv35, metadata !235, metadata !DIExpression()), !dbg !251

  //   call void @llvm.dbg.value(metadata i64* @atom_2_X0_1, metadata !240, metadata !DIExpression()), !dbg !310

  //   %13 = load atomic i64, i64* @atom_2_X0_1 seq_cst, align 8, !dbg !170
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
  creg_r14 = cr(0,8);
  crmax(0,8) = max(crmax(0,8),cr(0,8));
  caddr[0] = max(caddr[0],0);
  if(cr(0,8) < cw(0,8)) {
    r14 = buff(0,8);
  } else {
    if(pw(0,8) != co(8,cr(0,8))) {
      ASSUME(cr(0,8) >= old_cr);
    }
    pw(0,8) = co(8,cr(0,8));
    r14 = mem(8,cr(0,8));
  }
  ASSUME(creturn[0] >= cr(0,8));

  //   call void @llvm.dbg.value(metadata i64 %13, metadata !242, metadata !DIExpression()), !dbg !310

  //   %conv39 = trunc i64 %13 to i32, !dbg !171

  //   call void @llvm.dbg.value(metadata i32 %conv39, metadata !239, metadata !DIExpression()), !dbg !251

  //   call void @llvm.dbg.value(metadata i64* @atom_3_X0_1, metadata !244, metadata !DIExpression()), !dbg !313

  //   %14 = load atomic i64, i64* @atom_3_X0_1 seq_cst, align 8, !dbg !173
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
  creg_r15 = cr(0,9);
  crmax(0,9) = max(crmax(0,9),cr(0,9));
  caddr[0] = max(caddr[0],0);
  if(cr(0,9) < cw(0,9)) {
    r15 = buff(0,9);
  } else {
    if(pw(0,9) != co(9,cr(0,9))) {
      ASSUME(cr(0,9) >= old_cr);
    }
    pw(0,9) = co(9,cr(0,9));
    r15 = mem(9,cr(0,9));
  }
  ASSUME(creturn[0] >= cr(0,9));

  //   call void @llvm.dbg.value(metadata i64 %14, metadata !246, metadata !DIExpression()), !dbg !313

  //   %conv43 = trunc i64 %14 to i32, !dbg !174

  //   call void @llvm.dbg.value(metadata i32 %conv43, metadata !243, metadata !DIExpression()), !dbg !251

  //   %and = and i32 %conv39, %conv43, !dbg !175
  creg_r16 = max(creg_r14,creg_r15);
  ASSUME(active[creg_r16] == 0);
  r16 = r14 & r15;

  //   call void @llvm.dbg.value(metadata i32 %and, metadata !247, metadata !DIExpression()), !dbg !251

  //   %and44 = and i32 %conv35, %and, !dbg !176
  creg_r17 = max(creg_r13,creg_r16);
  ASSUME(active[creg_r17] == 0);
  r17 = r13 & r16;

  //   call void @llvm.dbg.value(metadata i32 %and44, metadata !248, metadata !DIExpression()), !dbg !251

  //   %and45 = and i32 %conv31, %and44, !dbg !177
  creg_r18 = max(creg_r12,creg_r17);
  ASSUME(active[creg_r18] == 0);
  r18 = r12 & r17;

  //   call void @llvm.dbg.value(metadata i32 %and45, metadata !249, metadata !DIExpression()), !dbg !251

  //   %and46 = and i32 %conv, %and45, !dbg !178
  creg_r19 = max(creg_r11,creg_r18);
  ASSUME(active[creg_r19] == 0);
  r19 = r11 & r18;

  //   call void @llvm.dbg.value(metadata i32 %and46, metadata !250, metadata !DIExpression()), !dbg !251

  //   %cmp = icmp eq i32 %and46, 1, !dbg !179

  //   br i1 %cmp, label %if.then, label %if.end, !dbg !181
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
  //   call void @__assert_fail(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([106 x i8], [106 x i8]* @.str.1, i64 0, i64 0), i32 noundef 109, i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #8, !dbg !182

  //   unreachable, !dbg !182
  r20 = 1;

T0BLOCK2:
  //   %15 = bitcast i64* %thr4 to i8*, !dbg !185

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %15) #7, !dbg !185

  //   %16 = bitcast i64* %thr3 to i8*, !dbg !185

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %16) #7, !dbg !185

  //   %17 = bitcast i64* %thr2 to i8*, !dbg !185

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %17) #7, !dbg !185

  //   %18 = bitcast i64* %thr1 to i8*, !dbg !185

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %18) #7, !dbg !185

  //   %19 = bitcast i64* %thr0 to i8*, !dbg !185

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %19) #7, !dbg !185

  //   ret i32 0, !dbg !186
  ret_thread_0 = 0;



  ASSERT(r20== 0);

}
