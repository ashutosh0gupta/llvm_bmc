// 0:vars:4
// 5:atom_1_X4_0:1
// 4:atom_1_X0_3:1
// 6:atom_1_X6_0:1
// 7:atom_1_X2_4:1
// 8:thr0:1
// 9:thr1:1
#define ADDRSIZE 10
#define NPROC 3
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
  mem(5+0,0) = 0;
  mem(4+0,0) = 0;
  mem(6+0,0) = 0;
  mem(7+0,0) = 0;
  mem(8+0,0) = 0;
  mem(9+0,0) = 0;
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
  mem(2,5) = meminit(2,5);
  co(2,5) = coinit(2,5);
  delta(2,5) = deltainit(2,5);
  mem(2,6) = meminit(2,6);
  co(2,6) = coinit(2,6);
  delta(2,6) = deltainit(2,6);
  mem(2,7) = meminit(2,7);
  co(2,7) = coinit(2,7);
  delta(2,7) = deltainit(2,7);
  mem(2,8) = meminit(2,8);
  co(2,8) = coinit(2,8);
  delta(2,8) = deltainit(2,8);
  mem(2,9) = meminit(2,9);
  co(2,9) = coinit(2,9);
  delta(2,9) = deltainit(2,9);
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
  mem(3,5) = meminit(3,5);
  co(3,5) = coinit(3,5);
  delta(3,5) = deltainit(3,5);
  mem(3,6) = meminit(3,6);
  co(3,6) = coinit(3,6);
  delta(3,6) = deltainit(3,6);
  mem(3,7) = meminit(3,7);
  co(3,7) = coinit(3,7);
  delta(3,7) = deltainit(3,7);
  mem(3,8) = meminit(3,8);
  co(3,8) = coinit(3,8);
  delta(3,8) = deltainit(3,8);
  mem(3,9) = meminit(3,9);
  co(3,9) = coinit(3,9);
  delta(3,9) = deltainit(3,9);
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
  mem(4,5) = meminit(4,5);
  co(4,5) = coinit(4,5);
  delta(4,5) = deltainit(4,5);
  mem(4,6) = meminit(4,6);
  co(4,6) = coinit(4,6);
  delta(4,6) = deltainit(4,6);
  mem(4,7) = meminit(4,7);
  co(4,7) = coinit(4,7);
  delta(4,7) = deltainit(4,7);
  mem(4,8) = meminit(4,8);
  co(4,8) = coinit(4,8);
  delta(4,8) = deltainit(4,8);
  mem(4,9) = meminit(4,9);
  co(4,9) = coinit(4,9);
  delta(4,9) = deltainit(4,9);
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
  mem(5,5) = meminit(5,5);
  co(5,5) = coinit(5,5);
  delta(5,5) = deltainit(5,5);
  mem(5,6) = meminit(5,6);
  co(5,6) = coinit(5,6);
  delta(5,6) = deltainit(5,6);
  mem(5,7) = meminit(5,7);
  co(5,7) = coinit(5,7);
  delta(5,7) = deltainit(5,7);
  mem(5,8) = meminit(5,8);
  co(5,8) = coinit(5,8);
  delta(5,8) = deltainit(5,8);
  mem(5,9) = meminit(5,9);
  co(5,9) = coinit(5,9);
  delta(5,9) = deltainit(5,9);
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
  mem(6,5) = meminit(6,5);
  co(6,5) = coinit(6,5);
  delta(6,5) = deltainit(6,5);
  mem(6,6) = meminit(6,6);
  co(6,6) = coinit(6,6);
  delta(6,6) = deltainit(6,6);
  mem(6,7) = meminit(6,7);
  co(6,7) = coinit(6,7);
  delta(6,7) = deltainit(6,7);
  mem(6,8) = meminit(6,8);
  co(6,8) = coinit(6,8);
  delta(6,8) = deltainit(6,8);
  mem(6,9) = meminit(6,9);
  co(6,9) = coinit(6,9);
  delta(6,9) = deltainit(6,9);
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
  mem(7,5) = meminit(7,5);
  co(7,5) = coinit(7,5);
  delta(7,5) = deltainit(7,5);
  mem(7,6) = meminit(7,6);
  co(7,6) = coinit(7,6);
  delta(7,6) = deltainit(7,6);
  mem(7,7) = meminit(7,7);
  co(7,7) = coinit(7,7);
  delta(7,7) = deltainit(7,7);
  mem(7,8) = meminit(7,8);
  co(7,8) = coinit(7,8);
  delta(7,8) = deltainit(7,8);
  mem(7,9) = meminit(7,9);
  co(7,9) = coinit(7,9);
  delta(7,9) = deltainit(7,9);
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
  mem(8,5) = meminit(8,5);
  co(8,5) = coinit(8,5);
  delta(8,5) = deltainit(8,5);
  mem(8,6) = meminit(8,6);
  co(8,6) = coinit(8,6);
  delta(8,6) = deltainit(8,6);
  mem(8,7) = meminit(8,7);
  co(8,7) = coinit(8,7);
  delta(8,7) = deltainit(8,7);
  mem(8,8) = meminit(8,8);
  co(8,8) = coinit(8,8);
  delta(8,8) = deltainit(8,8);
  mem(8,9) = meminit(8,9);
  co(8,9) = coinit(8,9);
  delta(8,9) = deltainit(8,9);
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
  mem(9,5) = meminit(9,5);
  co(9,5) = coinit(9,5);
  delta(9,5) = deltainit(9,5);
  mem(9,6) = meminit(9,6);
  co(9,6) = coinit(9,6);
  delta(9,6) = deltainit(9,6);
  mem(9,7) = meminit(9,7);
  co(9,7) = coinit(9,7);
  delta(9,7) = deltainit(9,7);
  mem(9,8) = meminit(9,8);
  co(9,8) = coinit(9,8);
  delta(9,8) = deltainit(9,8);
  mem(9,9) = meminit(9,9);
  co(9,9) = coinit(9,9);
  delta(9,9) = deltainit(9,9);
  // Dumping thread 1
  int ret_thread_1 = 0;
  cdy[1] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[1] >= cstart[1]);
T1BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !39, metadata !DIExpression()), !dbg !54

  //   br label %label_1, !dbg !55
  goto T1BLOCK1;

T1BLOCK1:
  //   call void @llvm.dbg.label(metadata !53), !dbg !56

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 3), metadata !40, metadata !DIExpression()), !dbg !57

  //   call void @llvm.dbg.value(metadata i64 1, metadata !43, metadata !DIExpression()), !dbg !57

  //   store atomic i64 1, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !58
  // ST: Guess
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
  // Update
  caddr[1] = max(caddr[1],0);
  buff(1,0+3*1) = 1;
  mem(0+3*1,cw(1,0+3*1)) = 1;
  co(0+3*1,cw(1,0+3*1))+=1;
  delta(0+3*1,cw(1,0+3*1)) = -1;
  ASSUME(creturn[1] >= cw(1,0+3*1));

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 2), metadata !44, metadata !DIExpression()), !dbg !59

  //   call void @llvm.dbg.value(metadata i64 2, metadata !46, metadata !DIExpression()), !dbg !59

  //   store atomic i64 2, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 2) monotonic, align 8, !dbg !60
  // ST: Guess
  iw(1,0+2*1) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW 
  old_cw = cw(1,0+2*1);
  cw(1,0+2*1) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(1,0+2*1)] == 1);
  ASSUME(active[cw(1,0+2*1)] == 1);
  ASSUME(sforbid(0+2*1,cw(1,0+2*1))== 0);
  ASSUME(iw(1,0+2*1) >= 0);
  ASSUME(iw(1,0+2*1) >= 0);
  ASSUME(cw(1,0+2*1) >= iw(1,0+2*1));
  ASSUME(cw(1,0+2*1) >= old_cw);
  ASSUME(cw(1,0+2*1) >= cr(1,0+2*1));
  ASSUME(cw(1,0+2*1) >= cl[1]);
  ASSUME(cw(1,0+2*1) >= cisb[1]);
  ASSUME(cw(1,0+2*1) >= cdy[1]);
  ASSUME(cw(1,0+2*1) >= cdl[1]);
  ASSUME(cw(1,0+2*1) >= cds[1]);
  ASSUME(cw(1,0+2*1) >= cctrl[1]);
  ASSUME(cw(1,0+2*1) >= caddr[1]);
  // Update
  caddr[1] = max(caddr[1],0);
  buff(1,0+2*1) = 2;
  mem(0+2*1,cw(1,0+2*1)) = 2;
  co(0+2*1,cw(1,0+2*1))+=1;
  delta(0+2*1,cw(1,0+2*1)) = -1;
  ASSUME(creturn[1] >= cw(1,0+2*1));

  //   call void (...) @dmbst(), !dbg !61
  // dumbst: Guess
  cds[1] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cds[1] >= cdy[1]);
  ASSUME(cds[1] >= cw(1,0+0));
  ASSUME(cds[1] >= cw(1,0+1));
  ASSUME(cds[1] >= cw(1,0+2));
  ASSUME(cds[1] >= cw(1,0+3));
  ASSUME(cds[1] >= cw(1,5+0));
  ASSUME(cds[1] >= cw(1,4+0));
  ASSUME(cds[1] >= cw(1,6+0));
  ASSUME(cds[1] >= cw(1,7+0));
  ASSUME(cds[1] >= cw(1,8+0));
  ASSUME(cds[1] >= cw(1,9+0));
  ASSUME(creturn[1] >= cds[1]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 1), metadata !47, metadata !DIExpression()), !dbg !62

  //   call void @llvm.dbg.value(metadata i64 3, metadata !49, metadata !DIExpression()), !dbg !62

  //   store atomic i64 3, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !63
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 0), metadata !50, metadata !DIExpression()), !dbg !64

  //   call void @llvm.dbg.value(metadata i64 4, metadata !52, metadata !DIExpression()), !dbg !64

  //   store atomic i64 4, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !65
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
  buff(1,0) = 4;
  mem(0,cw(1,0)) = 4;
  co(0,cw(1,0))+=1;
  delta(0,cw(1,0)) = -1;
  ASSUME(creturn[1] >= cw(1,0));

  //   ret i8* null, !dbg !66
  ret_thread_1 = (- 1);


  // Dumping thread 2
  int ret_thread_2 = 0;
  cdy[2] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[2] >= cstart[2]);
T2BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !69, metadata !DIExpression()), !dbg !104

  //   br label %label_2, !dbg !76
  goto T2BLOCK1;

T2BLOCK1:
  //   call void @llvm.dbg.label(metadata !103), !dbg !106

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 1), metadata !72, metadata !DIExpression()), !dbg !107

  //   %0 = load atomic i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !79
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
    ASSUME((!(( (cw(2,0+1*1) < 5) && (5 < crmax(2,0+1*1)) )))||(sforbid(0+1*1,5)> 0));
    ASSUME((!(( (cw(2,0+1*1) < 6) && (6 < crmax(2,0+1*1)) )))||(sforbid(0+1*1,6)> 0));
    ASSUME((!(( (cw(2,0+1*1) < 7) && (7 < crmax(2,0+1*1)) )))||(sforbid(0+1*1,7)> 0));
    ASSUME((!(( (cw(2,0+1*1) < 8) && (8 < crmax(2,0+1*1)) )))||(sforbid(0+1*1,8)> 0));
    ASSUME((!(( (cw(2,0+1*1) < 9) && (9 < crmax(2,0+1*1)) )))||(sforbid(0+1*1,9)> 0));
  } else {
    if(pw(2,0+1*1) != co(0+1*1,cr(2,0+1*1))) {
      ASSUME(cr(2,0+1*1) >= old_cr);
    }
    pw(2,0+1*1) = co(0+1*1,cr(2,0+1*1));
    r0 = mem(0+1*1,cr(2,0+1*1));
  }
  ASSUME(creturn[2] >= cr(2,0+1*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !74, metadata !DIExpression()), !dbg !107

  //   %conv = trunc i64 %0 to i32, !dbg !80

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !70, metadata !DIExpression()), !dbg !104

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 0), metadata !76, metadata !DIExpression()), !dbg !110

  //   %1 = load atomic i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !82
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
  creg_r1 = cr(2,0);
  crmax(2,0) = max(crmax(2,0),cr(2,0));
  caddr[2] = max(caddr[2],0);
  if(cr(2,0) < cw(2,0)) {
    r1 = buff(2,0);
    ASSUME((!(( (cw(2,0) < 1) && (1 < crmax(2,0)) )))||(sforbid(0,1)> 0));
    ASSUME((!(( (cw(2,0) < 2) && (2 < crmax(2,0)) )))||(sforbid(0,2)> 0));
    ASSUME((!(( (cw(2,0) < 3) && (3 < crmax(2,0)) )))||(sforbid(0,3)> 0));
    ASSUME((!(( (cw(2,0) < 4) && (4 < crmax(2,0)) )))||(sforbid(0,4)> 0));
    ASSUME((!(( (cw(2,0) < 5) && (5 < crmax(2,0)) )))||(sforbid(0,5)> 0));
    ASSUME((!(( (cw(2,0) < 6) && (6 < crmax(2,0)) )))||(sforbid(0,6)> 0));
    ASSUME((!(( (cw(2,0) < 7) && (7 < crmax(2,0)) )))||(sforbid(0,7)> 0));
    ASSUME((!(( (cw(2,0) < 8) && (8 < crmax(2,0)) )))||(sforbid(0,8)> 0));
    ASSUME((!(( (cw(2,0) < 9) && (9 < crmax(2,0)) )))||(sforbid(0,9)> 0));
  } else {
    if(pw(2,0) != co(0,cr(2,0))) {
      ASSUME(cr(2,0) >= old_cr);
    }
    pw(2,0) = co(0,cr(2,0));
    r1 = mem(0,cr(2,0));
  }
  ASSUME(creturn[2] >= cr(2,0));

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !78, metadata !DIExpression()), !dbg !110

  //   %conv4 = trunc i64 %1 to i32, !dbg !83

  //   call void @llvm.dbg.value(metadata i32 %conv4, metadata !75, metadata !DIExpression()), !dbg !104

  //   call void (...) @dmbld(), !dbg !84
  // dumbld: Guess
  cdl[2] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdl[2] >= cdy[2]);
  ASSUME(cdl[2] >= cr(2,0+0));
  ASSUME(cdl[2] >= cr(2,0+1));
  ASSUME(cdl[2] >= cr(2,0+2));
  ASSUME(cdl[2] >= cr(2,0+3));
  ASSUME(cdl[2] >= cr(2,5+0));
  ASSUME(cdl[2] >= cr(2,4+0));
  ASSUME(cdl[2] >= cr(2,6+0));
  ASSUME(cdl[2] >= cr(2,7+0));
  ASSUME(cdl[2] >= cr(2,8+0));
  ASSUME(cdl[2] >= cr(2,9+0));
  ASSUME(creturn[2] >= cdl[2]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 3), metadata !80, metadata !DIExpression()), !dbg !114

  //   %2 = load atomic i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !86
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
  creg_r2 = cr(2,0+3*1);
  crmax(2,0+3*1) = max(crmax(2,0+3*1),cr(2,0+3*1));
  caddr[2] = max(caddr[2],0);
  if(cr(2,0+3*1) < cw(2,0+3*1)) {
    r2 = buff(2,0+3*1);
    ASSUME((!(( (cw(2,0+3*1) < 1) && (1 < crmax(2,0+3*1)) )))||(sforbid(0+3*1,1)> 0));
    ASSUME((!(( (cw(2,0+3*1) < 2) && (2 < crmax(2,0+3*1)) )))||(sforbid(0+3*1,2)> 0));
    ASSUME((!(( (cw(2,0+3*1) < 3) && (3 < crmax(2,0+3*1)) )))||(sforbid(0+3*1,3)> 0));
    ASSUME((!(( (cw(2,0+3*1) < 4) && (4 < crmax(2,0+3*1)) )))||(sforbid(0+3*1,4)> 0));
    ASSUME((!(( (cw(2,0+3*1) < 5) && (5 < crmax(2,0+3*1)) )))||(sforbid(0+3*1,5)> 0));
    ASSUME((!(( (cw(2,0+3*1) < 6) && (6 < crmax(2,0+3*1)) )))||(sforbid(0+3*1,6)> 0));
    ASSUME((!(( (cw(2,0+3*1) < 7) && (7 < crmax(2,0+3*1)) )))||(sforbid(0+3*1,7)> 0));
    ASSUME((!(( (cw(2,0+3*1) < 8) && (8 < crmax(2,0+3*1)) )))||(sforbid(0+3*1,8)> 0));
    ASSUME((!(( (cw(2,0+3*1) < 9) && (9 < crmax(2,0+3*1)) )))||(sforbid(0+3*1,9)> 0));
  } else {
    if(pw(2,0+3*1) != co(0+3*1,cr(2,0+3*1))) {
      ASSUME(cr(2,0+3*1) >= old_cr);
    }
    pw(2,0+3*1) = co(0+3*1,cr(2,0+3*1));
    r2 = mem(0+3*1,cr(2,0+3*1));
  }
  ASSUME(creturn[2] >= cr(2,0+3*1));

  //   call void @llvm.dbg.value(metadata i64 %2, metadata !82, metadata !DIExpression()), !dbg !114

  //   %conv8 = trunc i64 %2 to i32, !dbg !87

  //   call void @llvm.dbg.value(metadata i32 %conv8, metadata !79, metadata !DIExpression()), !dbg !104

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 2), metadata !84, metadata !DIExpression()), !dbg !117

  //   %3 = load atomic i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 2) monotonic, align 8, !dbg !89
  // LD: Guess
  old_cr = cr(2,0+2*1);
  cr(2,0+2*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN LDCOM 
  // Check
  ASSUME(active[cr(2,0+2*1)] == 2);
  ASSUME(cr(2,0+2*1) >= iw(2,0+2*1));
  ASSUME(cr(2,0+2*1) >= 0);
  ASSUME(cr(2,0+2*1) >= cdy[2]);
  ASSUME(cr(2,0+2*1) >= cisb[2]);
  ASSUME(cr(2,0+2*1) >= cdl[2]);
  ASSUME(cr(2,0+2*1) >= cl[2]);
  // Update
  creg_r3 = cr(2,0+2*1);
  crmax(2,0+2*1) = max(crmax(2,0+2*1),cr(2,0+2*1));
  caddr[2] = max(caddr[2],0);
  if(cr(2,0+2*1) < cw(2,0+2*1)) {
    r3 = buff(2,0+2*1);
    ASSUME((!(( (cw(2,0+2*1) < 1) && (1 < crmax(2,0+2*1)) )))||(sforbid(0+2*1,1)> 0));
    ASSUME((!(( (cw(2,0+2*1) < 2) && (2 < crmax(2,0+2*1)) )))||(sforbid(0+2*1,2)> 0));
    ASSUME((!(( (cw(2,0+2*1) < 3) && (3 < crmax(2,0+2*1)) )))||(sforbid(0+2*1,3)> 0));
    ASSUME((!(( (cw(2,0+2*1) < 4) && (4 < crmax(2,0+2*1)) )))||(sforbid(0+2*1,4)> 0));
    ASSUME((!(( (cw(2,0+2*1) < 5) && (5 < crmax(2,0+2*1)) )))||(sforbid(0+2*1,5)> 0));
    ASSUME((!(( (cw(2,0+2*1) < 6) && (6 < crmax(2,0+2*1)) )))||(sforbid(0+2*1,6)> 0));
    ASSUME((!(( (cw(2,0+2*1) < 7) && (7 < crmax(2,0+2*1)) )))||(sforbid(0+2*1,7)> 0));
    ASSUME((!(( (cw(2,0+2*1) < 8) && (8 < crmax(2,0+2*1)) )))||(sforbid(0+2*1,8)> 0));
    ASSUME((!(( (cw(2,0+2*1) < 9) && (9 < crmax(2,0+2*1)) )))||(sforbid(0+2*1,9)> 0));
  } else {
    if(pw(2,0+2*1) != co(0+2*1,cr(2,0+2*1))) {
      ASSUME(cr(2,0+2*1) >= old_cr);
    }
    pw(2,0+2*1) = co(0+2*1,cr(2,0+2*1));
    r3 = mem(0+2*1,cr(2,0+2*1));
  }
  ASSUME(creturn[2] >= cr(2,0+2*1));

  //   call void @llvm.dbg.value(metadata i64 %3, metadata !86, metadata !DIExpression()), !dbg !117

  //   %conv12 = trunc i64 %3 to i32, !dbg !90

  //   call void @llvm.dbg.value(metadata i32 %conv12, metadata !83, metadata !DIExpression()), !dbg !104

  //   %cmp = icmp eq i32 %conv, 3, !dbg !91

  //   %conv13 = zext i1 %cmp to i32, !dbg !91

  //   call void @llvm.dbg.value(metadata i32 %conv13, metadata !87, metadata !DIExpression()), !dbg !104

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X0_3, metadata !88, metadata !DIExpression()), !dbg !121

  //   %4 = zext i32 %conv13 to i64

  //   call void @llvm.dbg.value(metadata i64 %4, metadata !90, metadata !DIExpression()), !dbg !121

  //   store atomic i64 %4, i64* @atom_1_X0_3 seq_cst, align 8, !dbg !93
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
  buff(2,4) = (r0==3);
  mem(4,cw(2,4)) = (r0==3);
  co(4,cw(2,4))+=1;
  delta(4,cw(2,4)) = -1;
  ASSUME(creturn[2] >= cw(2,4));

  //   %cmp15 = icmp eq i32 %conv8, 0, !dbg !94

  //   %conv16 = zext i1 %cmp15 to i32, !dbg !94

  //   call void @llvm.dbg.value(metadata i32 %conv16, metadata !91, metadata !DIExpression()), !dbg !104

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X4_0, metadata !92, metadata !DIExpression()), !dbg !124

  //   %5 = zext i32 %conv16 to i64

  //   call void @llvm.dbg.value(metadata i64 %5, metadata !94, metadata !DIExpression()), !dbg !124

  //   store atomic i64 %5, i64* @atom_1_X4_0 seq_cst, align 8, !dbg !96
  // ST: Guess
  iw(2,5) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW 
  old_cw = cw(2,5);
  cw(2,5) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(2,5)] == 2);
  ASSUME(active[cw(2,5)] == 2);
  ASSUME(sforbid(5,cw(2,5))== 0);
  ASSUME(iw(2,5) >= max(creg_r2,0));
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
  buff(2,5) = (r2==0);
  mem(5,cw(2,5)) = (r2==0);
  co(5,cw(2,5))+=1;
  delta(5,cw(2,5)) = -1;
  ASSUME(creturn[2] >= cw(2,5));

  //   %cmp20 = icmp eq i32 %conv12, 0, !dbg !97

  //   %conv21 = zext i1 %cmp20 to i32, !dbg !97

  //   call void @llvm.dbg.value(metadata i32 %conv21, metadata !95, metadata !DIExpression()), !dbg !104

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X6_0, metadata !96, metadata !DIExpression()), !dbg !127

  //   %6 = zext i32 %conv21 to i64

  //   call void @llvm.dbg.value(metadata i64 %6, metadata !98, metadata !DIExpression()), !dbg !127

  //   store atomic i64 %6, i64* @atom_1_X6_0 seq_cst, align 8, !dbg !99
  // ST: Guess
  iw(2,6) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW 
  old_cw = cw(2,6);
  cw(2,6) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(2,6)] == 2);
  ASSUME(active[cw(2,6)] == 2);
  ASSUME(sforbid(6,cw(2,6))== 0);
  ASSUME(iw(2,6) >= max(creg_r3,0));
  ASSUME(iw(2,6) >= 0);
  ASSUME(cw(2,6) >= iw(2,6));
  ASSUME(cw(2,6) >= old_cw);
  ASSUME(cw(2,6) >= cr(2,6));
  ASSUME(cw(2,6) >= cl[2]);
  ASSUME(cw(2,6) >= cisb[2]);
  ASSUME(cw(2,6) >= cdy[2]);
  ASSUME(cw(2,6) >= cdl[2]);
  ASSUME(cw(2,6) >= cds[2]);
  ASSUME(cw(2,6) >= cctrl[2]);
  ASSUME(cw(2,6) >= caddr[2]);
  // Update
  caddr[2] = max(caddr[2],0);
  buff(2,6) = (r3==0);
  mem(6,cw(2,6)) = (r3==0);
  co(6,cw(2,6))+=1;
  delta(6,cw(2,6)) = -1;
  ASSUME(creturn[2] >= cw(2,6));

  //   %cmp25 = icmp eq i32 %conv4, 4, !dbg !100

  //   %conv26 = zext i1 %cmp25 to i32, !dbg !100

  //   call void @llvm.dbg.value(metadata i32 %conv26, metadata !99, metadata !DIExpression()), !dbg !104

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X2_4, metadata !100, metadata !DIExpression()), !dbg !130

  //   %7 = zext i32 %conv26 to i64

  //   call void @llvm.dbg.value(metadata i64 %7, metadata !102, metadata !DIExpression()), !dbg !130

  //   store atomic i64 %7, i64* @atom_1_X2_4 seq_cst, align 8, !dbg !102
  // ST: Guess
  iw(2,7) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW 
  old_cw = cw(2,7);
  cw(2,7) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM 
  // Check
  ASSUME(active[iw(2,7)] == 2);
  ASSUME(active[cw(2,7)] == 2);
  ASSUME(sforbid(7,cw(2,7))== 0);
  ASSUME(iw(2,7) >= max(creg_r1,0));
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
  buff(2,7) = (r1==4);
  mem(7,cw(2,7)) = (r1==4);
  co(7,cw(2,7))+=1;
  delta(7,cw(2,7)) = -1;
  ASSUME(creturn[2] >= cw(2,7));

  //   ret i8* null, !dbg !103
  ret_thread_2 = (- 1);


  // Dumping thread 0
  int ret_thread_0 = 0;
  cdy[0] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[0] >= cstart[0]);
T0BLOCK0:
  //   %thr0 = alloca i64, align 8

  //   %thr1 = alloca i64, align 8

  //   call void @llvm.dbg.value(metadata i32 %argc, metadata !140, metadata !DIExpression()), !dbg !210

  //   call void @llvm.dbg.value(metadata i8** %argv, metadata !141, metadata !DIExpression()), !dbg !210

  //   %0 = bitcast i64* %thr0 to i8*, !dbg !115

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #6, !dbg !115

  //   call void @llvm.dbg.declare(metadata i64* %thr0, metadata !142, metadata !DIExpression()), !dbg !212

  //   %1 = bitcast i64* %thr1 to i8*, !dbg !117

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #6, !dbg !117

  //   call void @llvm.dbg.declare(metadata i64* %thr1, metadata !146, metadata !DIExpression()), !dbg !214

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 0), metadata !147, metadata !DIExpression()), !dbg !215

  //   call void @llvm.dbg.value(metadata i64 0, metadata !149, metadata !DIExpression()), !dbg !215

  //   store atomic i64 0, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !120
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 1), metadata !150, metadata !DIExpression()), !dbg !217

  //   call void @llvm.dbg.value(metadata i64 0, metadata !152, metadata !DIExpression()), !dbg !217

  //   store atomic i64 0, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !122
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 2), metadata !153, metadata !DIExpression()), !dbg !219

  //   call void @llvm.dbg.value(metadata i64 0, metadata !155, metadata !DIExpression()), !dbg !219

  //   store atomic i64 0, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 2) monotonic, align 8, !dbg !124
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 3), metadata !156, metadata !DIExpression()), !dbg !221

  //   call void @llvm.dbg.value(metadata i64 0, metadata !158, metadata !DIExpression()), !dbg !221

  //   store atomic i64 0, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !126
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

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X0_3, metadata !159, metadata !DIExpression()), !dbg !223

  //   call void @llvm.dbg.value(metadata i64 0, metadata !161, metadata !DIExpression()), !dbg !223

  //   store atomic i64 0, i64* @atom_1_X0_3 monotonic, align 8, !dbg !128
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

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X4_0, metadata !162, metadata !DIExpression()), !dbg !225

  //   call void @llvm.dbg.value(metadata i64 0, metadata !164, metadata !DIExpression()), !dbg !225

  //   store atomic i64 0, i64* @atom_1_X4_0 monotonic, align 8, !dbg !130
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

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X6_0, metadata !165, metadata !DIExpression()), !dbg !227

  //   call void @llvm.dbg.value(metadata i64 0, metadata !167, metadata !DIExpression()), !dbg !227

  //   store atomic i64 0, i64* @atom_1_X6_0 monotonic, align 8, !dbg !132
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

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X2_4, metadata !168, metadata !DIExpression()), !dbg !229

  //   call void @llvm.dbg.value(metadata i64 0, metadata !170, metadata !DIExpression()), !dbg !229

  //   store atomic i64 0, i64* @atom_1_X2_4 monotonic, align 8, !dbg !134
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

  //   %call = call i32 @pthread_create(i64* noundef %thr0, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t0, i8* noundef null) #6, !dbg !135
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
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,4+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[1] >= cdy[0]);

  //   %call15 = call i32 @pthread_create(i64* noundef %thr1, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t1, i8* noundef null) #6, !dbg !136
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
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,4+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[2] >= cdy[0]);

  //   %2 = load i64, i64* %thr0, align 8, !dbg !137, !tbaa !138
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
  creg_r5 = cr(0,8);
  crmax(0,8) = max(crmax(0,8),cr(0,8));
  caddr[0] = max(caddr[0],0);
  if(cr(0,8) < cw(0,8)) {
    r5 = buff(0,8);
    ASSUME((!(( (cw(0,8) < 1) && (1 < crmax(0,8)) )))||(sforbid(8,1)> 0));
    ASSUME((!(( (cw(0,8) < 2) && (2 < crmax(0,8)) )))||(sforbid(8,2)> 0));
    ASSUME((!(( (cw(0,8) < 3) && (3 < crmax(0,8)) )))||(sforbid(8,3)> 0));
    ASSUME((!(( (cw(0,8) < 4) && (4 < crmax(0,8)) )))||(sforbid(8,4)> 0));
    ASSUME((!(( (cw(0,8) < 5) && (5 < crmax(0,8)) )))||(sforbid(8,5)> 0));
    ASSUME((!(( (cw(0,8) < 6) && (6 < crmax(0,8)) )))||(sforbid(8,6)> 0));
    ASSUME((!(( (cw(0,8) < 7) && (7 < crmax(0,8)) )))||(sforbid(8,7)> 0));
    ASSUME((!(( (cw(0,8) < 8) && (8 < crmax(0,8)) )))||(sforbid(8,8)> 0));
    ASSUME((!(( (cw(0,8) < 9) && (9 < crmax(0,8)) )))||(sforbid(8,9)> 0));
  } else {
    if(pw(0,8) != co(8,cr(0,8))) {
      ASSUME(cr(0,8) >= old_cr);
    }
    pw(0,8) = co(8,cr(0,8));
    r5 = mem(8,cr(0,8));
  }
  ASSUME(creturn[0] >= cr(0,8));

  //   %call16 = call i32 @pthread_join(i64 noundef %2, i8** noundef null), !dbg !142
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
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,4+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[1]);

  //   %3 = load i64, i64* %thr1, align 8, !dbg !143, !tbaa !138
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
  creg_r6 = cr(0,9);
  crmax(0,9) = max(crmax(0,9),cr(0,9));
  caddr[0] = max(caddr[0],0);
  if(cr(0,9) < cw(0,9)) {
    r6 = buff(0,9);
    ASSUME((!(( (cw(0,9) < 1) && (1 < crmax(0,9)) )))||(sforbid(9,1)> 0));
    ASSUME((!(( (cw(0,9) < 2) && (2 < crmax(0,9)) )))||(sforbid(9,2)> 0));
    ASSUME((!(( (cw(0,9) < 3) && (3 < crmax(0,9)) )))||(sforbid(9,3)> 0));
    ASSUME((!(( (cw(0,9) < 4) && (4 < crmax(0,9)) )))||(sforbid(9,4)> 0));
    ASSUME((!(( (cw(0,9) < 5) && (5 < crmax(0,9)) )))||(sforbid(9,5)> 0));
    ASSUME((!(( (cw(0,9) < 6) && (6 < crmax(0,9)) )))||(sforbid(9,6)> 0));
    ASSUME((!(( (cw(0,9) < 7) && (7 < crmax(0,9)) )))||(sforbid(9,7)> 0));
    ASSUME((!(( (cw(0,9) < 8) && (8 < crmax(0,9)) )))||(sforbid(9,8)> 0));
    ASSUME((!(( (cw(0,9) < 9) && (9 < crmax(0,9)) )))||(sforbid(9,9)> 0));
  } else {
    if(pw(0,9) != co(9,cr(0,9))) {
      ASSUME(cr(0,9) >= old_cr);
    }
    pw(0,9) = co(9,cr(0,9));
    r6 = mem(9,cr(0,9));
  }
  ASSUME(creturn[0] >= cr(0,9));

  //   %call17 = call i32 @pthread_join(i64 noundef %3, i8** noundef null), !dbg !144
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
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,4+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,4+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[2]);

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X0_3, metadata !172, metadata !DIExpression()), !dbg !241

  //   %4 = load atomic i64, i64* @atom_1_X0_3 seq_cst, align 8, !dbg !146
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
  creg_r7 = cr(0,4);
  crmax(0,4) = max(crmax(0,4),cr(0,4));
  caddr[0] = max(caddr[0],0);
  if(cr(0,4) < cw(0,4)) {
    r7 = buff(0,4);
    ASSUME((!(( (cw(0,4) < 1) && (1 < crmax(0,4)) )))||(sforbid(4,1)> 0));
    ASSUME((!(( (cw(0,4) < 2) && (2 < crmax(0,4)) )))||(sforbid(4,2)> 0));
    ASSUME((!(( (cw(0,4) < 3) && (3 < crmax(0,4)) )))||(sforbid(4,3)> 0));
    ASSUME((!(( (cw(0,4) < 4) && (4 < crmax(0,4)) )))||(sforbid(4,4)> 0));
    ASSUME((!(( (cw(0,4) < 5) && (5 < crmax(0,4)) )))||(sforbid(4,5)> 0));
    ASSUME((!(( (cw(0,4) < 6) && (6 < crmax(0,4)) )))||(sforbid(4,6)> 0));
    ASSUME((!(( (cw(0,4) < 7) && (7 < crmax(0,4)) )))||(sforbid(4,7)> 0));
    ASSUME((!(( (cw(0,4) < 8) && (8 < crmax(0,4)) )))||(sforbid(4,8)> 0));
    ASSUME((!(( (cw(0,4) < 9) && (9 < crmax(0,4)) )))||(sforbid(4,9)> 0));
  } else {
    if(pw(0,4) != co(4,cr(0,4))) {
      ASSUME(cr(0,4) >= old_cr);
    }
    pw(0,4) = co(4,cr(0,4));
    r7 = mem(4,cr(0,4));
  }
  ASSUME(creturn[0] >= cr(0,4));

  //   call void @llvm.dbg.value(metadata i64 %4, metadata !174, metadata !DIExpression()), !dbg !241

  //   %conv = trunc i64 %4 to i32, !dbg !147

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !171, metadata !DIExpression()), !dbg !210

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X4_0, metadata !176, metadata !DIExpression()), !dbg !244

  //   %5 = load atomic i64, i64* @atom_1_X4_0 seq_cst, align 8, !dbg !149
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
  creg_r8 = cr(0,5);
  crmax(0,5) = max(crmax(0,5),cr(0,5));
  caddr[0] = max(caddr[0],0);
  if(cr(0,5) < cw(0,5)) {
    r8 = buff(0,5);
    ASSUME((!(( (cw(0,5) < 1) && (1 < crmax(0,5)) )))||(sforbid(5,1)> 0));
    ASSUME((!(( (cw(0,5) < 2) && (2 < crmax(0,5)) )))||(sforbid(5,2)> 0));
    ASSUME((!(( (cw(0,5) < 3) && (3 < crmax(0,5)) )))||(sforbid(5,3)> 0));
    ASSUME((!(( (cw(0,5) < 4) && (4 < crmax(0,5)) )))||(sforbid(5,4)> 0));
    ASSUME((!(( (cw(0,5) < 5) && (5 < crmax(0,5)) )))||(sforbid(5,5)> 0));
    ASSUME((!(( (cw(0,5) < 6) && (6 < crmax(0,5)) )))||(sforbid(5,6)> 0));
    ASSUME((!(( (cw(0,5) < 7) && (7 < crmax(0,5)) )))||(sforbid(5,7)> 0));
    ASSUME((!(( (cw(0,5) < 8) && (8 < crmax(0,5)) )))||(sforbid(5,8)> 0));
    ASSUME((!(( (cw(0,5) < 9) && (9 < crmax(0,5)) )))||(sforbid(5,9)> 0));
  } else {
    if(pw(0,5) != co(5,cr(0,5))) {
      ASSUME(cr(0,5) >= old_cr);
    }
    pw(0,5) = co(5,cr(0,5));
    r8 = mem(5,cr(0,5));
  }
  ASSUME(creturn[0] >= cr(0,5));

  //   call void @llvm.dbg.value(metadata i64 %5, metadata !178, metadata !DIExpression()), !dbg !244

  //   %conv21 = trunc i64 %5 to i32, !dbg !150

  //   call void @llvm.dbg.value(metadata i32 %conv21, metadata !175, metadata !DIExpression()), !dbg !210

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X0_3, metadata !180, metadata !DIExpression()), !dbg !247

  //   %6 = load atomic i64, i64* @atom_1_X0_3 seq_cst, align 8, !dbg !152
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
  creg_r9 = cr(0,4);
  crmax(0,4) = max(crmax(0,4),cr(0,4));
  caddr[0] = max(caddr[0],0);
  if(cr(0,4) < cw(0,4)) {
    r9 = buff(0,4);
    ASSUME((!(( (cw(0,4) < 1) && (1 < crmax(0,4)) )))||(sforbid(4,1)> 0));
    ASSUME((!(( (cw(0,4) < 2) && (2 < crmax(0,4)) )))||(sforbid(4,2)> 0));
    ASSUME((!(( (cw(0,4) < 3) && (3 < crmax(0,4)) )))||(sforbid(4,3)> 0));
    ASSUME((!(( (cw(0,4) < 4) && (4 < crmax(0,4)) )))||(sforbid(4,4)> 0));
    ASSUME((!(( (cw(0,4) < 5) && (5 < crmax(0,4)) )))||(sforbid(4,5)> 0));
    ASSUME((!(( (cw(0,4) < 6) && (6 < crmax(0,4)) )))||(sforbid(4,6)> 0));
    ASSUME((!(( (cw(0,4) < 7) && (7 < crmax(0,4)) )))||(sforbid(4,7)> 0));
    ASSUME((!(( (cw(0,4) < 8) && (8 < crmax(0,4)) )))||(sforbid(4,8)> 0));
    ASSUME((!(( (cw(0,4) < 9) && (9 < crmax(0,4)) )))||(sforbid(4,9)> 0));
  } else {
    if(pw(0,4) != co(4,cr(0,4))) {
      ASSUME(cr(0,4) >= old_cr);
    }
    pw(0,4) = co(4,cr(0,4));
    r9 = mem(4,cr(0,4));
  }
  ASSUME(creturn[0] >= cr(0,4));

  //   call void @llvm.dbg.value(metadata i64 %6, metadata !182, metadata !DIExpression()), !dbg !247

  //   %conv25 = trunc i64 %6 to i32, !dbg !153

  //   call void @llvm.dbg.value(metadata i32 %conv25, metadata !179, metadata !DIExpression()), !dbg !210

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X6_0, metadata !184, metadata !DIExpression()), !dbg !250

  //   %7 = load atomic i64, i64* @atom_1_X6_0 seq_cst, align 8, !dbg !155
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
  creg_r10 = cr(0,6);
  crmax(0,6) = max(crmax(0,6),cr(0,6));
  caddr[0] = max(caddr[0],0);
  if(cr(0,6) < cw(0,6)) {
    r10 = buff(0,6);
    ASSUME((!(( (cw(0,6) < 1) && (1 < crmax(0,6)) )))||(sforbid(6,1)> 0));
    ASSUME((!(( (cw(0,6) < 2) && (2 < crmax(0,6)) )))||(sforbid(6,2)> 0));
    ASSUME((!(( (cw(0,6) < 3) && (3 < crmax(0,6)) )))||(sforbid(6,3)> 0));
    ASSUME((!(( (cw(0,6) < 4) && (4 < crmax(0,6)) )))||(sforbid(6,4)> 0));
    ASSUME((!(( (cw(0,6) < 5) && (5 < crmax(0,6)) )))||(sforbid(6,5)> 0));
    ASSUME((!(( (cw(0,6) < 6) && (6 < crmax(0,6)) )))||(sforbid(6,6)> 0));
    ASSUME((!(( (cw(0,6) < 7) && (7 < crmax(0,6)) )))||(sforbid(6,7)> 0));
    ASSUME((!(( (cw(0,6) < 8) && (8 < crmax(0,6)) )))||(sforbid(6,8)> 0));
    ASSUME((!(( (cw(0,6) < 9) && (9 < crmax(0,6)) )))||(sforbid(6,9)> 0));
  } else {
    if(pw(0,6) != co(6,cr(0,6))) {
      ASSUME(cr(0,6) >= old_cr);
    }
    pw(0,6) = co(6,cr(0,6));
    r10 = mem(6,cr(0,6));
  }
  ASSUME(creturn[0] >= cr(0,6));

  //   call void @llvm.dbg.value(metadata i64 %7, metadata !186, metadata !DIExpression()), !dbg !250

  //   %conv29 = trunc i64 %7 to i32, !dbg !156

  //   call void @llvm.dbg.value(metadata i32 %conv29, metadata !183, metadata !DIExpression()), !dbg !210

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X2_4, metadata !188, metadata !DIExpression()), !dbg !253

  //   %8 = load atomic i64, i64* @atom_1_X2_4 seq_cst, align 8, !dbg !158
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
  creg_r11 = cr(0,7);
  crmax(0,7) = max(crmax(0,7),cr(0,7));
  caddr[0] = max(caddr[0],0);
  if(cr(0,7) < cw(0,7)) {
    r11 = buff(0,7);
    ASSUME((!(( (cw(0,7) < 1) && (1 < crmax(0,7)) )))||(sforbid(7,1)> 0));
    ASSUME((!(( (cw(0,7) < 2) && (2 < crmax(0,7)) )))||(sforbid(7,2)> 0));
    ASSUME((!(( (cw(0,7) < 3) && (3 < crmax(0,7)) )))||(sforbid(7,3)> 0));
    ASSUME((!(( (cw(0,7) < 4) && (4 < crmax(0,7)) )))||(sforbid(7,4)> 0));
    ASSUME((!(( (cw(0,7) < 5) && (5 < crmax(0,7)) )))||(sforbid(7,5)> 0));
    ASSUME((!(( (cw(0,7) < 6) && (6 < crmax(0,7)) )))||(sforbid(7,6)> 0));
    ASSUME((!(( (cw(0,7) < 7) && (7 < crmax(0,7)) )))||(sforbid(7,7)> 0));
    ASSUME((!(( (cw(0,7) < 8) && (8 < crmax(0,7)) )))||(sforbid(7,8)> 0));
    ASSUME((!(( (cw(0,7) < 9) && (9 < crmax(0,7)) )))||(sforbid(7,9)> 0));
  } else {
    if(pw(0,7) != co(7,cr(0,7))) {
      ASSUME(cr(0,7) >= old_cr);
    }
    pw(0,7) = co(7,cr(0,7));
    r11 = mem(7,cr(0,7));
  }
  ASSUME(creturn[0] >= cr(0,7));

  //   call void @llvm.dbg.value(metadata i64 %8, metadata !190, metadata !DIExpression()), !dbg !253

  //   %conv33 = trunc i64 %8 to i32, !dbg !159

  //   call void @llvm.dbg.value(metadata i32 %conv33, metadata !187, metadata !DIExpression()), !dbg !210

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X4_0, metadata !192, metadata !DIExpression()), !dbg !256

  //   %9 = load atomic i64, i64* @atom_1_X4_0 seq_cst, align 8, !dbg !161
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
    ASSUME((!(( (cw(0,5) < 1) && (1 < crmax(0,5)) )))||(sforbid(5,1)> 0));
    ASSUME((!(( (cw(0,5) < 2) && (2 < crmax(0,5)) )))||(sforbid(5,2)> 0));
    ASSUME((!(( (cw(0,5) < 3) && (3 < crmax(0,5)) )))||(sforbid(5,3)> 0));
    ASSUME((!(( (cw(0,5) < 4) && (4 < crmax(0,5)) )))||(sforbid(5,4)> 0));
    ASSUME((!(( (cw(0,5) < 5) && (5 < crmax(0,5)) )))||(sforbid(5,5)> 0));
    ASSUME((!(( (cw(0,5) < 6) && (6 < crmax(0,5)) )))||(sforbid(5,6)> 0));
    ASSUME((!(( (cw(0,5) < 7) && (7 < crmax(0,5)) )))||(sforbid(5,7)> 0));
    ASSUME((!(( (cw(0,5) < 8) && (8 < crmax(0,5)) )))||(sforbid(5,8)> 0));
    ASSUME((!(( (cw(0,5) < 9) && (9 < crmax(0,5)) )))||(sforbid(5,9)> 0));
  } else {
    if(pw(0,5) != co(5,cr(0,5))) {
      ASSUME(cr(0,5) >= old_cr);
    }
    pw(0,5) = co(5,cr(0,5));
    r12 = mem(5,cr(0,5));
  }
  ASSUME(creturn[0] >= cr(0,5));

  //   call void @llvm.dbg.value(metadata i64 %9, metadata !194, metadata !DIExpression()), !dbg !256

  //   %conv37 = trunc i64 %9 to i32, !dbg !162

  //   call void @llvm.dbg.value(metadata i32 %conv37, metadata !191, metadata !DIExpression()), !dbg !210

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X2_4, metadata !196, metadata !DIExpression()), !dbg !259

  //   %10 = load atomic i64, i64* @atom_1_X2_4 seq_cst, align 8, !dbg !164
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
    ASSUME((!(( (cw(0,7) < 1) && (1 < crmax(0,7)) )))||(sforbid(7,1)> 0));
    ASSUME((!(( (cw(0,7) < 2) && (2 < crmax(0,7)) )))||(sforbid(7,2)> 0));
    ASSUME((!(( (cw(0,7) < 3) && (3 < crmax(0,7)) )))||(sforbid(7,3)> 0));
    ASSUME((!(( (cw(0,7) < 4) && (4 < crmax(0,7)) )))||(sforbid(7,4)> 0));
    ASSUME((!(( (cw(0,7) < 5) && (5 < crmax(0,7)) )))||(sforbid(7,5)> 0));
    ASSUME((!(( (cw(0,7) < 6) && (6 < crmax(0,7)) )))||(sforbid(7,6)> 0));
    ASSUME((!(( (cw(0,7) < 7) && (7 < crmax(0,7)) )))||(sforbid(7,7)> 0));
    ASSUME((!(( (cw(0,7) < 8) && (8 < crmax(0,7)) )))||(sforbid(7,8)> 0));
    ASSUME((!(( (cw(0,7) < 9) && (9 < crmax(0,7)) )))||(sforbid(7,9)> 0));
  } else {
    if(pw(0,7) != co(7,cr(0,7))) {
      ASSUME(cr(0,7) >= old_cr);
    }
    pw(0,7) = co(7,cr(0,7));
    r13 = mem(7,cr(0,7));
  }
  ASSUME(creturn[0] >= cr(0,7));

  //   call void @llvm.dbg.value(metadata i64 %10, metadata !198, metadata !DIExpression()), !dbg !259

  //   %conv41 = trunc i64 %10 to i32, !dbg !165

  //   call void @llvm.dbg.value(metadata i32 %conv41, metadata !195, metadata !DIExpression()), !dbg !210

  //   call void @llvm.dbg.value(metadata i64* @atom_1_X6_0, metadata !200, metadata !DIExpression()), !dbg !262

  //   %11 = load atomic i64, i64* @atom_1_X6_0 seq_cst, align 8, !dbg !167
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
  creg_r14 = cr(0,6);
  crmax(0,6) = max(crmax(0,6),cr(0,6));
  caddr[0] = max(caddr[0],0);
  if(cr(0,6) < cw(0,6)) {
    r14 = buff(0,6);
    ASSUME((!(( (cw(0,6) < 1) && (1 < crmax(0,6)) )))||(sforbid(6,1)> 0));
    ASSUME((!(( (cw(0,6) < 2) && (2 < crmax(0,6)) )))||(sforbid(6,2)> 0));
    ASSUME((!(( (cw(0,6) < 3) && (3 < crmax(0,6)) )))||(sforbid(6,3)> 0));
    ASSUME((!(( (cw(0,6) < 4) && (4 < crmax(0,6)) )))||(sforbid(6,4)> 0));
    ASSUME((!(( (cw(0,6) < 5) && (5 < crmax(0,6)) )))||(sforbid(6,5)> 0));
    ASSUME((!(( (cw(0,6) < 6) && (6 < crmax(0,6)) )))||(sforbid(6,6)> 0));
    ASSUME((!(( (cw(0,6) < 7) && (7 < crmax(0,6)) )))||(sforbid(6,7)> 0));
    ASSUME((!(( (cw(0,6) < 8) && (8 < crmax(0,6)) )))||(sforbid(6,8)> 0));
    ASSUME((!(( (cw(0,6) < 9) && (9 < crmax(0,6)) )))||(sforbid(6,9)> 0));
  } else {
    if(pw(0,6) != co(6,cr(0,6))) {
      ASSUME(cr(0,6) >= old_cr);
    }
    pw(0,6) = co(6,cr(0,6));
    r14 = mem(6,cr(0,6));
  }
  ASSUME(creturn[0] >= cr(0,6));

  //   call void @llvm.dbg.value(metadata i64 %11, metadata !202, metadata !DIExpression()), !dbg !262

  //   %conv45 = trunc i64 %11 to i32, !dbg !168

  //   call void @llvm.dbg.value(metadata i32 %conv45, metadata !199, metadata !DIExpression()), !dbg !210

  //   %and = and i32 %conv41, %conv45, !dbg !169
  creg_r15 = max(creg_r13,creg_r14);
  ASSUME(active[creg_r15] == 0);
  r15 = r13 & r14;

  //   call void @llvm.dbg.value(metadata i32 %and, metadata !203, metadata !DIExpression()), !dbg !210

  //   %or = or i32 %conv37, %and, !dbg !170
  creg_r16 = max(creg_r12,creg_r15);
  ASSUME(active[creg_r16] == 0);
  r16 = r12 | r15;

  //   call void @llvm.dbg.value(metadata i32 %or, metadata !204, metadata !DIExpression()), !dbg !210

  //   %and46 = and i32 %conv33, %or, !dbg !171
  creg_r17 = max(creg_r11,creg_r16);
  ASSUME(active[creg_r17] == 0);
  r17 = r11 & r16;

  //   call void @llvm.dbg.value(metadata i32 %and46, metadata !205, metadata !DIExpression()), !dbg !210

  //   %or47 = or i32 %conv29, %and46, !dbg !172
  creg_r18 = max(creg_r10,creg_r17);
  ASSUME(active[creg_r18] == 0);
  r18 = r10 | r17;

  //   call void @llvm.dbg.value(metadata i32 %or47, metadata !206, metadata !DIExpression()), !dbg !210

  //   %and48 = and i32 %conv25, %or47, !dbg !173
  creg_r19 = max(creg_r9,creg_r18);
  ASSUME(active[creg_r19] == 0);
  r19 = r9 & r18;

  //   call void @llvm.dbg.value(metadata i32 %and48, metadata !207, metadata !DIExpression()), !dbg !210

  //   %or49 = or i32 %conv21, %and48, !dbg !174
  creg_r20 = max(creg_r8,creg_r19);
  ASSUME(active[creg_r20] == 0);
  r20 = r8 | r19;

  //   call void @llvm.dbg.value(metadata i32 %or49, metadata !208, metadata !DIExpression()), !dbg !210

  //   %and50 = and i32 %conv, %or49, !dbg !175
  creg_r21 = max(creg_r7,creg_r20);
  ASSUME(active[creg_r21] == 0);
  r21 = r7 & r20;

  //   call void @llvm.dbg.value(metadata i32 %and50, metadata !209, metadata !DIExpression()), !dbg !210

  //   %cmp = icmp eq i32 %and50, 1, !dbg !176

  //   br i1 %cmp, label %if.then, label %if.end, !dbg !178
  old_cctrl = cctrl[0];
  cctrl[0] = get_rng(0,NCONTEXT-1);
  ASSUME(cctrl[0] >= old_cctrl);
  ASSUME(cctrl[0] >= creg_r21);
  ASSUME(cctrl[0] >= 0);
  if((r21==1)) {
    goto T0BLOCK1;
  } else {
    goto T0BLOCK2;
  }

T0BLOCK1:
  //   call void @__assert_fail(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([109 x i8], [109 x i8]* @.str.1, i64 0, i64 0), i32 noundef 82, i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #7, !dbg !179

  //   unreachable, !dbg !179
  r22 = 1;

T0BLOCK2:
  //   %12 = bitcast i64* %thr1 to i8*, !dbg !182

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %12) #6, !dbg !182

  //   %13 = bitcast i64* %thr0 to i8*, !dbg !182

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %13) #6, !dbg !182

  //   ret i32 0, !dbg !183
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
  ASSUME(meminit(2,5) == mem(2,4));
  ASSUME(coinit(2,5) == co(2,4));
  ASSUME(deltainit(2,5) == delta(2,4));
  ASSUME(meminit(2,6) == mem(2,5));
  ASSUME(coinit(2,6) == co(2,5));
  ASSUME(deltainit(2,6) == delta(2,5));
  ASSUME(meminit(2,7) == mem(2,6));
  ASSUME(coinit(2,7) == co(2,6));
  ASSUME(deltainit(2,7) == delta(2,6));
  ASSUME(meminit(2,8) == mem(2,7));
  ASSUME(coinit(2,8) == co(2,7));
  ASSUME(deltainit(2,8) == delta(2,7));
  ASSUME(meminit(2,9) == mem(2,8));
  ASSUME(coinit(2,9) == co(2,8));
  ASSUME(deltainit(2,9) == delta(2,8));
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
  ASSUME(meminit(3,5) == mem(3,4));
  ASSUME(coinit(3,5) == co(3,4));
  ASSUME(deltainit(3,5) == delta(3,4));
  ASSUME(meminit(3,6) == mem(3,5));
  ASSUME(coinit(3,6) == co(3,5));
  ASSUME(deltainit(3,6) == delta(3,5));
  ASSUME(meminit(3,7) == mem(3,6));
  ASSUME(coinit(3,7) == co(3,6));
  ASSUME(deltainit(3,7) == delta(3,6));
  ASSUME(meminit(3,8) == mem(3,7));
  ASSUME(coinit(3,8) == co(3,7));
  ASSUME(deltainit(3,8) == delta(3,7));
  ASSUME(meminit(3,9) == mem(3,8));
  ASSUME(coinit(3,9) == co(3,8));
  ASSUME(deltainit(3,9) == delta(3,8));
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
  ASSUME(meminit(4,5) == mem(4,4));
  ASSUME(coinit(4,5) == co(4,4));
  ASSUME(deltainit(4,5) == delta(4,4));
  ASSUME(meminit(4,6) == mem(4,5));
  ASSUME(coinit(4,6) == co(4,5));
  ASSUME(deltainit(4,6) == delta(4,5));
  ASSUME(meminit(4,7) == mem(4,6));
  ASSUME(coinit(4,7) == co(4,6));
  ASSUME(deltainit(4,7) == delta(4,6));
  ASSUME(meminit(4,8) == mem(4,7));
  ASSUME(coinit(4,8) == co(4,7));
  ASSUME(deltainit(4,8) == delta(4,7));
  ASSUME(meminit(4,9) == mem(4,8));
  ASSUME(coinit(4,9) == co(4,8));
  ASSUME(deltainit(4,9) == delta(4,8));
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
  ASSUME(meminit(5,5) == mem(5,4));
  ASSUME(coinit(5,5) == co(5,4));
  ASSUME(deltainit(5,5) == delta(5,4));
  ASSUME(meminit(5,6) == mem(5,5));
  ASSUME(coinit(5,6) == co(5,5));
  ASSUME(deltainit(5,6) == delta(5,5));
  ASSUME(meminit(5,7) == mem(5,6));
  ASSUME(coinit(5,7) == co(5,6));
  ASSUME(deltainit(5,7) == delta(5,6));
  ASSUME(meminit(5,8) == mem(5,7));
  ASSUME(coinit(5,8) == co(5,7));
  ASSUME(deltainit(5,8) == delta(5,7));
  ASSUME(meminit(5,9) == mem(5,8));
  ASSUME(coinit(5,9) == co(5,8));
  ASSUME(deltainit(5,9) == delta(5,8));
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
  ASSUME(meminit(6,5) == mem(6,4));
  ASSUME(coinit(6,5) == co(6,4));
  ASSUME(deltainit(6,5) == delta(6,4));
  ASSUME(meminit(6,6) == mem(6,5));
  ASSUME(coinit(6,6) == co(6,5));
  ASSUME(deltainit(6,6) == delta(6,5));
  ASSUME(meminit(6,7) == mem(6,6));
  ASSUME(coinit(6,7) == co(6,6));
  ASSUME(deltainit(6,7) == delta(6,6));
  ASSUME(meminit(6,8) == mem(6,7));
  ASSUME(coinit(6,8) == co(6,7));
  ASSUME(deltainit(6,8) == delta(6,7));
  ASSUME(meminit(6,9) == mem(6,8));
  ASSUME(coinit(6,9) == co(6,8));
  ASSUME(deltainit(6,9) == delta(6,8));
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
  ASSUME(meminit(7,5) == mem(7,4));
  ASSUME(coinit(7,5) == co(7,4));
  ASSUME(deltainit(7,5) == delta(7,4));
  ASSUME(meminit(7,6) == mem(7,5));
  ASSUME(coinit(7,6) == co(7,5));
  ASSUME(deltainit(7,6) == delta(7,5));
  ASSUME(meminit(7,7) == mem(7,6));
  ASSUME(coinit(7,7) == co(7,6));
  ASSUME(deltainit(7,7) == delta(7,6));
  ASSUME(meminit(7,8) == mem(7,7));
  ASSUME(coinit(7,8) == co(7,7));
  ASSUME(deltainit(7,8) == delta(7,7));
  ASSUME(meminit(7,9) == mem(7,8));
  ASSUME(coinit(7,9) == co(7,8));
  ASSUME(deltainit(7,9) == delta(7,8));
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
  ASSUME(meminit(8,5) == mem(8,4));
  ASSUME(coinit(8,5) == co(8,4));
  ASSUME(deltainit(8,5) == delta(8,4));
  ASSUME(meminit(8,6) == mem(8,5));
  ASSUME(coinit(8,6) == co(8,5));
  ASSUME(deltainit(8,6) == delta(8,5));
  ASSUME(meminit(8,7) == mem(8,6));
  ASSUME(coinit(8,7) == co(8,6));
  ASSUME(deltainit(8,7) == delta(8,6));
  ASSUME(meminit(8,8) == mem(8,7));
  ASSUME(coinit(8,8) == co(8,7));
  ASSUME(deltainit(8,8) == delta(8,7));
  ASSUME(meminit(8,9) == mem(8,8));
  ASSUME(coinit(8,9) == co(8,8));
  ASSUME(deltainit(8,9) == delta(8,8));
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
  ASSUME(meminit(9,5) == mem(9,4));
  ASSUME(coinit(9,5) == co(9,4));
  ASSUME(deltainit(9,5) == delta(9,4));
  ASSUME(meminit(9,6) == mem(9,5));
  ASSUME(coinit(9,6) == co(9,5));
  ASSUME(deltainit(9,6) == delta(9,5));
  ASSUME(meminit(9,7) == mem(9,6));
  ASSUME(coinit(9,7) == co(9,6));
  ASSUME(deltainit(9,7) == delta(9,6));
  ASSUME(meminit(9,8) == mem(9,7));
  ASSUME(coinit(9,8) == co(9,7));
  ASSUME(deltainit(9,8) == delta(9,7));
  ASSUME(meminit(9,9) == mem(9,8));
  ASSUME(coinit(9,9) == co(9,8));
  ASSUME(deltainit(9,9) == delta(9,8));

  ASSERT(r22== 0);

}
