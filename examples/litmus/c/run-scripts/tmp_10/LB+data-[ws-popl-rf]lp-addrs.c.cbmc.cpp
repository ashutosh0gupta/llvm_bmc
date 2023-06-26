// Global variabls:
// 0:vars:6
// 7:atom_0_X4_1:1
// 6:atom_0_X0_1:1
// 9:atom_2_X4_1:1
// 8:atom_2_X0_1:1
// Local global variabls:
// 0:thr0:1
// 1:thr1:1
// 2:thr2:1
// 3:thr3:1
#define ADDRSIZE 10
#define LOCALADDRSIZE 4
#define NTHREAD 5
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
  mem(7+0,0) = 0;
  mem(6+0,0) = 0;
  mem(9+0,0) = 0;
  mem(8+0,0) = 0;
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
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !40, metadata !DIExpression()), !dbg !62

  //   br label %label_1, !dbg !63
  goto T1BLOCK1;

T1BLOCK1:
  //   call void @llvm.dbg.label(metadata !61), !dbg !64

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 0), metadata !42, metadata !DIExpression()), !dbg !65

  //   %0 = load atomic i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !66
  // LD: Guess
  old_cr = cr(1,0);
  cr(1,0) = get_rng(0,NCONTEXT-1);// 1 ASSIGN LDCOM _l22_c15
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

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !45, metadata !DIExpression()), !dbg !65

  //   %conv = trunc i64 %0 to i32, !dbg !67

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !41, metadata !DIExpression()), !dbg !62

  //   %xor = xor i32 %conv, %conv, !dbg !68
  creg_r1 = creg_r0;
  r1 = r0 ^ r0;

  //   call void @llvm.dbg.value(metadata i32 %xor, metadata !46, metadata !DIExpression()), !dbg !62

  //   %add = add nsw i32 %xor, 1, !dbg !69
  creg_r2 = max(0,creg_r1);
  r2 = r1 + 1;

  //   call void @llvm.dbg.value(metadata i32 %add, metadata !47, metadata !DIExpression()), !dbg !62

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 1), metadata !48, metadata !DIExpression()), !dbg !70

  //   %conv1 = sext i32 %add to i64, !dbg !71

  //   call void @llvm.dbg.value(metadata i64 %conv1, metadata !50, metadata !DIExpression()), !dbg !70

  //   store atomic i64 %conv1, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !71
  // ST: Guess
  iw(1,0+1*1) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW _l25_c3
  old_cw = cw(1,0+1*1);
  cw(1,0+1*1) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM _l25_c3
  // Check
  ASSUME(active[iw(1,0+1*1)] == 1);
  ASSUME(active[cw(1,0+1*1)] == 1);
  ASSUME(sforbid(0+1*1,cw(1,0+1*1))== 0);
  ASSUME(iw(1,0+1*1) >= creg_r2);
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
  buff(1,0+1*1) = r2;
  mem(0+1*1,cw(1,0+1*1)) = r2;
  co(0+1*1,cw(1,0+1*1))+=1;
  delta(0+1*1,cw(1,0+1*1)) = -1;
  ASSUME(creturn[1] >= cw(1,0+1*1));

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 2), metadata !52, metadata !DIExpression()), !dbg !72

  //   %1 = load atomic i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 2) monotonic, align 8, !dbg !73
  // LD: Guess
  old_cr = cr(1,0+2*1);
  cr(1,0+2*1) = get_rng(0,NCONTEXT-1);// 1 ASSIGN LDCOM _l26_c15
  // Check
  ASSUME(active[cr(1,0+2*1)] == 1);
  ASSUME(cr(1,0+2*1) >= iw(1,0+2*1));
  ASSUME(cr(1,0+2*1) >= 0);
  ASSUME(cr(1,0+2*1) >= cdy[1]);
  ASSUME(cr(1,0+2*1) >= cisb[1]);
  ASSUME(cr(1,0+2*1) >= cdl[1]);
  ASSUME(cr(1,0+2*1) >= cl[1]);
  // Update
  creg_r3 = cr(1,0+2*1);
  crmax(1,0+2*1) = max(crmax(1,0+2*1),cr(1,0+2*1));
  caddr[1] = max(caddr[1],0);
  if(cr(1,0+2*1) < cw(1,0+2*1)) {
    r3 = buff(1,0+2*1);
    ASSUME((!(( (cw(1,0+2*1) < 1) && (1 < crmax(1,0+2*1)) )))||(sforbid(0+2*1,1)> 0));
    ASSUME((!(( (cw(1,0+2*1) < 2) && (2 < crmax(1,0+2*1)) )))||(sforbid(0+2*1,2)> 0));
    ASSUME((!(( (cw(1,0+2*1) < 3) && (3 < crmax(1,0+2*1)) )))||(sforbid(0+2*1,3)> 0));
    ASSUME((!(( (cw(1,0+2*1) < 4) && (4 < crmax(1,0+2*1)) )))||(sforbid(0+2*1,4)> 0));
    ASSUME((!(( (cw(1,0+2*1) < 5) && (5 < crmax(1,0+2*1)) )))||(sforbid(0+2*1,5)> 0));
    ASSUME((!(( (cw(1,0+2*1) < 6) && (6 < crmax(1,0+2*1)) )))||(sforbid(0+2*1,6)> 0));
    ASSUME((!(( (cw(1,0+2*1) < 7) && (7 < crmax(1,0+2*1)) )))||(sforbid(0+2*1,7)> 0));
    ASSUME((!(( (cw(1,0+2*1) < 8) && (8 < crmax(1,0+2*1)) )))||(sforbid(0+2*1,8)> 0));
    ASSUME((!(( (cw(1,0+2*1) < 9) && (9 < crmax(1,0+2*1)) )))||(sforbid(0+2*1,9)> 0));
  } else {
    if(pw(1,0+2*1) != co(0+2*1,cr(1,0+2*1))) {
      ASSUME(cr(1,0+2*1) >= old_cr);
    }
    pw(1,0+2*1) = co(0+2*1,cr(1,0+2*1));
    r3 = mem(0+2*1,cr(1,0+2*1));
  }
  ASSUME(creturn[1] >= cr(1,0+2*1));

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !54, metadata !DIExpression()), !dbg !72

  //   %conv5 = trunc i64 %1 to i32, !dbg !74

  //   call void @llvm.dbg.value(metadata i32 %conv5, metadata !51, metadata !DIExpression()), !dbg !62

  //   %xor6 = xor i32 %conv5, %conv5, !dbg !75
  creg_r4 = creg_r3;
  r4 = r3 ^ r3;

  //   call void @llvm.dbg.value(metadata i32 %xor6, metadata !55, metadata !DIExpression()), !dbg !62

  //   %add8 = add nsw i32 3, %xor6, !dbg !76
  creg_r5 = max(0,creg_r4);
  r5 = 3 + r4;

  //   %idxprom = sext i32 %add8 to i64, !dbg !76

  //   %arrayidx = getelementptr inbounds [6 x i64], [6 x i64]* @vars, i64 0, i64 %idxprom, !dbg !76
  r6 = 0+r5*1;
  creg_r6 = creg_r5;

  //   call void @llvm.dbg.value(metadata i64* %arrayidx, metadata !56, metadata !DIExpression()), !dbg !77

  //   call void @llvm.dbg.value(metadata i64 1, metadata !58, metadata !DIExpression()), !dbg !77

  //   store atomic i64 1, i64* %arrayidx monotonic, align 8, !dbg !76
  // ST: Guess
  iw(1,r6) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW _l28_c3
  old_cw = cw(1,r6);
  cw(1,r6) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM _l28_c3
  // Check
  ASSUME(active[iw(1,r6)] == 1);
  ASSUME(active[cw(1,r6)] == 1);
  ASSUME(sforbid(r6,cw(1,r6))== 0);
  ASSUME(iw(1,r6) >= 0);
  ASSUME(iw(1,r6) >= creg_r6);
  ASSUME(cw(1,r6) >= iw(1,r6));
  ASSUME(cw(1,r6) >= old_cw);
  ASSUME(cw(1,r6) >= cr(1,r6));
  ASSUME(cw(1,r6) >= cl[1]);
  ASSUME(cw(1,r6) >= cisb[1]);
  ASSUME(cw(1,r6) >= cdy[1]);
  ASSUME(cw(1,r6) >= cdl[1]);
  ASSUME(cw(1,r6) >= cds[1]);
  ASSUME(cw(1,r6) >= cctrl[1]);
  ASSUME(cw(1,r6) >= caddr[1]);
  // Update
  caddr[1] = max(caddr[1],creg_r6);
  buff(1,r6) = 1;
  mem(r6,cw(1,r6)) = 1;
  co(r6,cw(1,r6))+=1;
  delta(r6,cw(1,r6)) = -1;
  ASSUME(creturn[1] >= cw(1,r6));

  //   %cmp = icmp eq i32 %conv, 1, !dbg !78
  creg__r0__1_ = max(0,creg_r0);

  //   %conv10 = zext i1 %cmp to i32, !dbg !78

  //   call void @llvm.dbg.value(metadata i32 %conv10, metadata !59, metadata !DIExpression()), !dbg !62

  //   store i32 %conv10, i32* @atom_0_X0_1, align 4, !dbg !79, !tbaa !80
  // ST: Guess
  iw(1,6) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW _l30_c15
  old_cw = cw(1,6);
  cw(1,6) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM _l30_c15
  // Check
  ASSUME(active[iw(1,6)] == 1);
  ASSUME(active[cw(1,6)] == 1);
  ASSUME(sforbid(6,cw(1,6))== 0);
  ASSUME(iw(1,6) >= creg__r0__1_);
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

  //   %cmp11 = icmp eq i32 %conv5, 1, !dbg !84
  creg__r3__1_ = max(0,creg_r3);

  //   %conv12 = zext i1 %cmp11 to i32, !dbg !84

  //   call void @llvm.dbg.value(metadata i32 %conv12, metadata !60, metadata !DIExpression()), !dbg !62

  //   store i32 %conv12, i32* @atom_0_X4_1, align 4, !dbg !85, !tbaa !80
  // ST: Guess
  iw(1,7) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW _l32_c15
  old_cw = cw(1,7);
  cw(1,7) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM _l32_c15
  // Check
  ASSUME(active[iw(1,7)] == 1);
  ASSUME(active[cw(1,7)] == 1);
  ASSUME(sforbid(7,cw(1,7))== 0);
  ASSUME(iw(1,7) >= creg__r3__1_);
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
  buff(1,7) = (r3==1);
  mem(7,cw(1,7)) = (r3==1);
  co(7,cw(1,7))+=1;
  delta(7,cw(1,7)) = -1;
  ASSUME(creturn[1] >= cw(1,7));

  //   ret i8* null, !dbg !86
  ret_thread_1 = (- 1);
  goto T1BLOCK_END;

T1BLOCK_END:

  // Dumping thread 2
  int ret_thread_2 = 0;
  cdy[2] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[2] >= cstart[2]);
T2BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !89, metadata !DIExpression()), !dbg !97

  //   br label %label_2, !dbg !50
  goto T2BLOCK1;

T2BLOCK1:
  //   call void @llvm.dbg.label(metadata !96), !dbg !99

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 1), metadata !90, metadata !DIExpression()), !dbg !100

  //   call void @llvm.dbg.value(metadata i64 2, metadata !92, metadata !DIExpression()), !dbg !100

  //   store atomic i64 2, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !53
  // ST: Guess
  iw(2,0+1*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW _l38_c3
  old_cw = cw(2,0+1*1);
  cw(2,0+1*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM _l38_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 2), metadata !93, metadata !DIExpression()), !dbg !102

  //   call void @llvm.dbg.value(metadata i64 1, metadata !95, metadata !DIExpression()), !dbg !102

  //   store atomic i64 1, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 2) release, align 8, !dbg !55
  // ST: Guess
  //   : Release
  iw(2,0+2*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW _l39_c3
  old_cw = cw(2,0+2*1);
  cw(2,0+2*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM _l39_c3
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
  ASSUME(cw(2,0+2*1) >= cr(2,7+0));
  ASSUME(cw(2,0+2*1) >= cr(2,6+0));
  ASSUME(cw(2,0+2*1) >= cr(2,9+0));
  ASSUME(cw(2,0+2*1) >= cr(2,8+0));
  ASSUME(cw(2,0+2*1) >= cw(2,0+0));
  ASSUME(cw(2,0+2*1) >= cw(2,0+1));
  ASSUME(cw(2,0+2*1) >= cw(2,0+2));
  ASSUME(cw(2,0+2*1) >= cw(2,0+3));
  ASSUME(cw(2,0+2*1) >= cw(2,0+4));
  ASSUME(cw(2,0+2*1) >= cw(2,0+5));
  ASSUME(cw(2,0+2*1) >= cw(2,7+0));
  ASSUME(cw(2,0+2*1) >= cw(2,6+0));
  ASSUME(cw(2,0+2*1) >= cw(2,9+0));
  ASSUME(cw(2,0+2*1) >= cw(2,8+0));
  // Update
  caddr[2] = max(caddr[2],0);
  buff(2,0+2*1) = 1;
  mem(0+2*1,cw(2,0+2*1)) = 1;
  co(0+2*1,cw(2,0+2*1))+=1;
  delta(0+2*1,cw(2,0+2*1)) = -1;
  is(2,0+2*1) = iw(2,0+2*1);
  cs(2,0+2*1) = cw(2,0+2*1);
  ASSUME(creturn[2] >= cw(2,0+2*1));

  //   ret i8* null, !dbg !56
  ret_thread_2 = (- 1);
  goto T2BLOCK_END;

T2BLOCK_END:

  // Dumping thread 3
  int ret_thread_3 = 0;
  cdy[3] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[3] >= cstart[3]);
T3BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !107, metadata !DIExpression()), !dbg !128

  //   br label %label_3, !dbg !63
  goto T3BLOCK1;

T3BLOCK1:
  //   call void @llvm.dbg.label(metadata !127), !dbg !130

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 3), metadata !109, metadata !DIExpression()), !dbg !131

  //   %0 = load atomic i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !66
  // LD: Guess
  old_cr = cr(3,0+3*1);
  cr(3,0+3*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN LDCOM _l45_c16
  // Check
  ASSUME(active[cr(3,0+3*1)] == 3);
  ASSUME(cr(3,0+3*1) >= iw(3,0+3*1));
  ASSUME(cr(3,0+3*1) >= 0);
  ASSUME(cr(3,0+3*1) >= cdy[3]);
  ASSUME(cr(3,0+3*1) >= cisb[3]);
  ASSUME(cr(3,0+3*1) >= cdl[3]);
  ASSUME(cr(3,0+3*1) >= cl[3]);
  // Update
  creg_r7 = cr(3,0+3*1);
  crmax(3,0+3*1) = max(crmax(3,0+3*1),cr(3,0+3*1));
  caddr[3] = max(caddr[3],0);
  if(cr(3,0+3*1) < cw(3,0+3*1)) {
    r7 = buff(3,0+3*1);
    ASSUME((!(( (cw(3,0+3*1) < 1) && (1 < crmax(3,0+3*1)) )))||(sforbid(0+3*1,1)> 0));
    ASSUME((!(( (cw(3,0+3*1) < 2) && (2 < crmax(3,0+3*1)) )))||(sforbid(0+3*1,2)> 0));
    ASSUME((!(( (cw(3,0+3*1) < 3) && (3 < crmax(3,0+3*1)) )))||(sforbid(0+3*1,3)> 0));
    ASSUME((!(( (cw(3,0+3*1) < 4) && (4 < crmax(3,0+3*1)) )))||(sforbid(0+3*1,4)> 0));
    ASSUME((!(( (cw(3,0+3*1) < 5) && (5 < crmax(3,0+3*1)) )))||(sforbid(0+3*1,5)> 0));
    ASSUME((!(( (cw(3,0+3*1) < 6) && (6 < crmax(3,0+3*1)) )))||(sforbid(0+3*1,6)> 0));
    ASSUME((!(( (cw(3,0+3*1) < 7) && (7 < crmax(3,0+3*1)) )))||(sforbid(0+3*1,7)> 0));
    ASSUME((!(( (cw(3,0+3*1) < 8) && (8 < crmax(3,0+3*1)) )))||(sforbid(0+3*1,8)> 0));
    ASSUME((!(( (cw(3,0+3*1) < 9) && (9 < crmax(3,0+3*1)) )))||(sforbid(0+3*1,9)> 0));
  } else {
    if(pw(3,0+3*1) != co(0+3*1,cr(3,0+3*1))) {
      ASSUME(cr(3,0+3*1) >= old_cr);
    }
    pw(3,0+3*1) = co(0+3*1,cr(3,0+3*1));
    r7 = mem(0+3*1,cr(3,0+3*1));
  }
  ASSUME(creturn[3] >= cr(3,0+3*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !111, metadata !DIExpression()), !dbg !131

  //   %conv = trunc i64 %0 to i32, !dbg !67

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !108, metadata !DIExpression()), !dbg !128

  //   %xor = xor i32 %conv, %conv, !dbg !68
  creg_r8 = creg_r7;
  r8 = r7 ^ r7;

  //   call void @llvm.dbg.value(metadata i32 %xor, metadata !112, metadata !DIExpression()), !dbg !128

  //   %add = add nsw i32 %xor, 1, !dbg !69
  creg_r9 = max(0,creg_r8);
  r9 = r8 + 1;

  //   call void @llvm.dbg.value(metadata i32 %add, metadata !113, metadata !DIExpression()), !dbg !128

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 4), metadata !114, metadata !DIExpression()), !dbg !136

  //   %conv1 = sext i32 %add to i64, !dbg !71

  //   call void @llvm.dbg.value(metadata i64 %conv1, metadata !116, metadata !DIExpression()), !dbg !136

  //   store atomic i64 %conv1, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 4) monotonic, align 8, !dbg !71
  // ST: Guess
  iw(3,0+4*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STIW _l48_c3
  old_cw = cw(3,0+4*1);
  cw(3,0+4*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STCOM _l48_c3
  // Check
  ASSUME(active[iw(3,0+4*1)] == 3);
  ASSUME(active[cw(3,0+4*1)] == 3);
  ASSUME(sforbid(0+4*1,cw(3,0+4*1))== 0);
  ASSUME(iw(3,0+4*1) >= creg_r9);
  ASSUME(iw(3,0+4*1) >= 0);
  ASSUME(cw(3,0+4*1) >= iw(3,0+4*1));
  ASSUME(cw(3,0+4*1) >= old_cw);
  ASSUME(cw(3,0+4*1) >= cr(3,0+4*1));
  ASSUME(cw(3,0+4*1) >= cl[3]);
  ASSUME(cw(3,0+4*1) >= cisb[3]);
  ASSUME(cw(3,0+4*1) >= cdy[3]);
  ASSUME(cw(3,0+4*1) >= cdl[3]);
  ASSUME(cw(3,0+4*1) >= cds[3]);
  ASSUME(cw(3,0+4*1) >= cctrl[3]);
  ASSUME(cw(3,0+4*1) >= caddr[3]);
  // Update
  caddr[3] = max(caddr[3],0);
  buff(3,0+4*1) = r9;
  mem(0+4*1,cw(3,0+4*1)) = r9;
  co(0+4*1,cw(3,0+4*1))+=1;
  delta(0+4*1,cw(3,0+4*1)) = -1;
  ASSUME(creturn[3] >= cw(3,0+4*1));

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 5), metadata !118, metadata !DIExpression()), !dbg !138

  //   %1 = load atomic i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 5) monotonic, align 8, !dbg !73
  // LD: Guess
  old_cr = cr(3,0+5*1);
  cr(3,0+5*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN LDCOM _l49_c16
  // Check
  ASSUME(active[cr(3,0+5*1)] == 3);
  ASSUME(cr(3,0+5*1) >= iw(3,0+5*1));
  ASSUME(cr(3,0+5*1) >= 0);
  ASSUME(cr(3,0+5*1) >= cdy[3]);
  ASSUME(cr(3,0+5*1) >= cisb[3]);
  ASSUME(cr(3,0+5*1) >= cdl[3]);
  ASSUME(cr(3,0+5*1) >= cl[3]);
  // Update
  creg_r10 = cr(3,0+5*1);
  crmax(3,0+5*1) = max(crmax(3,0+5*1),cr(3,0+5*1));
  caddr[3] = max(caddr[3],0);
  if(cr(3,0+5*1) < cw(3,0+5*1)) {
    r10 = buff(3,0+5*1);
    ASSUME((!(( (cw(3,0+5*1) < 1) && (1 < crmax(3,0+5*1)) )))||(sforbid(0+5*1,1)> 0));
    ASSUME((!(( (cw(3,0+5*1) < 2) && (2 < crmax(3,0+5*1)) )))||(sforbid(0+5*1,2)> 0));
    ASSUME((!(( (cw(3,0+5*1) < 3) && (3 < crmax(3,0+5*1)) )))||(sforbid(0+5*1,3)> 0));
    ASSUME((!(( (cw(3,0+5*1) < 4) && (4 < crmax(3,0+5*1)) )))||(sforbid(0+5*1,4)> 0));
    ASSUME((!(( (cw(3,0+5*1) < 5) && (5 < crmax(3,0+5*1)) )))||(sforbid(0+5*1,5)> 0));
    ASSUME((!(( (cw(3,0+5*1) < 6) && (6 < crmax(3,0+5*1)) )))||(sforbid(0+5*1,6)> 0));
    ASSUME((!(( (cw(3,0+5*1) < 7) && (7 < crmax(3,0+5*1)) )))||(sforbid(0+5*1,7)> 0));
    ASSUME((!(( (cw(3,0+5*1) < 8) && (8 < crmax(3,0+5*1)) )))||(sforbid(0+5*1,8)> 0));
    ASSUME((!(( (cw(3,0+5*1) < 9) && (9 < crmax(3,0+5*1)) )))||(sforbid(0+5*1,9)> 0));
  } else {
    if(pw(3,0+5*1) != co(0+5*1,cr(3,0+5*1))) {
      ASSUME(cr(3,0+5*1) >= old_cr);
    }
    pw(3,0+5*1) = co(0+5*1,cr(3,0+5*1));
    r10 = mem(0+5*1,cr(3,0+5*1));
  }
  ASSUME(creturn[3] >= cr(3,0+5*1));

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !120, metadata !DIExpression()), !dbg !138

  //   %conv5 = trunc i64 %1 to i32, !dbg !74

  //   call void @llvm.dbg.value(metadata i32 %conv5, metadata !117, metadata !DIExpression()), !dbg !128

  //   %xor6 = xor i32 %conv5, %conv5, !dbg !75
  creg_r11 = creg_r10;
  r11 = r10 ^ r10;

  //   call void @llvm.dbg.value(metadata i32 %xor6, metadata !121, metadata !DIExpression()), !dbg !128

  //   %add8 = add nsw i32 0, %xor6, !dbg !76
  creg_r12 = max(0,creg_r11);
  r12 = 0 + r11;

  //   %idxprom = sext i32 %add8 to i64, !dbg !76

  //   %arrayidx = getelementptr inbounds [6 x i64], [6 x i64]* @vars, i64 0, i64 %idxprom, !dbg !76
  r13 = 0+r12*1;
  creg_r13 = creg_r12;

  //   call void @llvm.dbg.value(metadata i64* %arrayidx, metadata !122, metadata !DIExpression()), !dbg !143

  //   call void @llvm.dbg.value(metadata i64 1, metadata !124, metadata !DIExpression()), !dbg !143

  //   store atomic i64 1, i64* %arrayidx monotonic, align 8, !dbg !76
  // ST: Guess
  iw(3,r13) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STIW _l51_c3
  old_cw = cw(3,r13);
  cw(3,r13) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STCOM _l51_c3
  // Check
  ASSUME(active[iw(3,r13)] == 3);
  ASSUME(active[cw(3,r13)] == 3);
  ASSUME(sforbid(r13,cw(3,r13))== 0);
  ASSUME(iw(3,r13) >= 0);
  ASSUME(iw(3,r13) >= creg_r13);
  ASSUME(cw(3,r13) >= iw(3,r13));
  ASSUME(cw(3,r13) >= old_cw);
  ASSUME(cw(3,r13) >= cr(3,r13));
  ASSUME(cw(3,r13) >= cl[3]);
  ASSUME(cw(3,r13) >= cisb[3]);
  ASSUME(cw(3,r13) >= cdy[3]);
  ASSUME(cw(3,r13) >= cdl[3]);
  ASSUME(cw(3,r13) >= cds[3]);
  ASSUME(cw(3,r13) >= cctrl[3]);
  ASSUME(cw(3,r13) >= caddr[3]);
  // Update
  caddr[3] = max(caddr[3],creg_r13);
  buff(3,r13) = 1;
  mem(r13,cw(3,r13)) = 1;
  co(r13,cw(3,r13))+=1;
  delta(r13,cw(3,r13)) = -1;
  ASSUME(creturn[3] >= cw(3,r13));

  //   %cmp = icmp eq i32 %conv, 1, !dbg !78
  creg__r7__1_ = max(0,creg_r7);

  //   %conv10 = zext i1 %cmp to i32, !dbg !78

  //   call void @llvm.dbg.value(metadata i32 %conv10, metadata !125, metadata !DIExpression()), !dbg !128

  //   store i32 %conv10, i32* @atom_2_X0_1, align 4, !dbg !79, !tbaa !80
  // ST: Guess
  iw(3,8) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STIW _l53_c15
  old_cw = cw(3,8);
  cw(3,8) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STCOM _l53_c15
  // Check
  ASSUME(active[iw(3,8)] == 3);
  ASSUME(active[cw(3,8)] == 3);
  ASSUME(sforbid(8,cw(3,8))== 0);
  ASSUME(iw(3,8) >= creg__r7__1_);
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
  buff(3,8) = (r7==1);
  mem(8,cw(3,8)) = (r7==1);
  co(8,cw(3,8))+=1;
  delta(8,cw(3,8)) = -1;
  ASSUME(creturn[3] >= cw(3,8));

  //   %cmp11 = icmp eq i32 %conv5, 1, !dbg !84
  creg__r10__1_ = max(0,creg_r10);

  //   %conv12 = zext i1 %cmp11 to i32, !dbg !84

  //   call void @llvm.dbg.value(metadata i32 %conv12, metadata !126, metadata !DIExpression()), !dbg !128

  //   store i32 %conv12, i32* @atom_2_X4_1, align 4, !dbg !85, !tbaa !80
  // ST: Guess
  iw(3,9) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STIW _l55_c15
  old_cw = cw(3,9);
  cw(3,9) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STCOM _l55_c15
  // Check
  ASSUME(active[iw(3,9)] == 3);
  ASSUME(active[cw(3,9)] == 3);
  ASSUME(sforbid(9,cw(3,9))== 0);
  ASSUME(iw(3,9) >= creg__r10__1_);
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
  buff(3,9) = (r10==1);
  mem(9,cw(3,9)) = (r10==1);
  co(9,cw(3,9))+=1;
  delta(9,cw(3,9)) = -1;
  ASSUME(creturn[3] >= cw(3,9));

  //   ret i8* null, !dbg !86
  ret_thread_3 = (- 1);
  goto T3BLOCK_END;

T3BLOCK_END:

  // Dumping thread 4
  int ret_thread_4 = 0;
  cdy[4] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[4] >= cstart[4]);
T4BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !151, metadata !DIExpression()), !dbg !159

  //   br label %label_4, !dbg !50
  goto T4BLOCK1;

T4BLOCK1:
  //   call void @llvm.dbg.label(metadata !158), !dbg !161

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 4), metadata !152, metadata !DIExpression()), !dbg !162

  //   call void @llvm.dbg.value(metadata i64 2, metadata !154, metadata !DIExpression()), !dbg !162

  //   store atomic i64 2, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 4) monotonic, align 8, !dbg !53
  // ST: Guess
  iw(4,0+4*1) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STIW _l61_c3
  old_cw = cw(4,0+4*1);
  cw(4,0+4*1) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STCOM _l61_c3
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
  buff(4,0+4*1) = 2;
  mem(0+4*1,cw(4,0+4*1)) = 2;
  co(0+4*1,cw(4,0+4*1))+=1;
  delta(0+4*1,cw(4,0+4*1)) = -1;
  ASSUME(creturn[4] >= cw(4,0+4*1));

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 5), metadata !155, metadata !DIExpression()), !dbg !164

  //   call void @llvm.dbg.value(metadata i64 1, metadata !157, metadata !DIExpression()), !dbg !164

  //   store atomic i64 1, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 5) release, align 8, !dbg !55
  // ST: Guess
  //   : Release
  iw(4,0+5*1) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STIW _l62_c3
  old_cw = cw(4,0+5*1);
  cw(4,0+5*1) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STCOM _l62_c3
  // Check
  ASSUME(active[iw(4,0+5*1)] == 4);
  ASSUME(active[cw(4,0+5*1)] == 4);
  ASSUME(sforbid(0+5*1,cw(4,0+5*1))== 0);
  ASSUME(iw(4,0+5*1) >= 0);
  ASSUME(iw(4,0+5*1) >= 0);
  ASSUME(cw(4,0+5*1) >= iw(4,0+5*1));
  ASSUME(cw(4,0+5*1) >= old_cw);
  ASSUME(cw(4,0+5*1) >= cr(4,0+5*1));
  ASSUME(cw(4,0+5*1) >= cl[4]);
  ASSUME(cw(4,0+5*1) >= cisb[4]);
  ASSUME(cw(4,0+5*1) >= cdy[4]);
  ASSUME(cw(4,0+5*1) >= cdl[4]);
  ASSUME(cw(4,0+5*1) >= cds[4]);
  ASSUME(cw(4,0+5*1) >= cctrl[4]);
  ASSUME(cw(4,0+5*1) >= caddr[4]);
  ASSUME(cw(4,0+5*1) >= cr(4,0+0));
  ASSUME(cw(4,0+5*1) >= cr(4,0+1));
  ASSUME(cw(4,0+5*1) >= cr(4,0+2));
  ASSUME(cw(4,0+5*1) >= cr(4,0+3));
  ASSUME(cw(4,0+5*1) >= cr(4,0+4));
  ASSUME(cw(4,0+5*1) >= cr(4,0+5));
  ASSUME(cw(4,0+5*1) >= cr(4,7+0));
  ASSUME(cw(4,0+5*1) >= cr(4,6+0));
  ASSUME(cw(4,0+5*1) >= cr(4,9+0));
  ASSUME(cw(4,0+5*1) >= cr(4,8+0));
  ASSUME(cw(4,0+5*1) >= cw(4,0+0));
  ASSUME(cw(4,0+5*1) >= cw(4,0+1));
  ASSUME(cw(4,0+5*1) >= cw(4,0+2));
  ASSUME(cw(4,0+5*1) >= cw(4,0+3));
  ASSUME(cw(4,0+5*1) >= cw(4,0+4));
  ASSUME(cw(4,0+5*1) >= cw(4,0+5));
  ASSUME(cw(4,0+5*1) >= cw(4,7+0));
  ASSUME(cw(4,0+5*1) >= cw(4,6+0));
  ASSUME(cw(4,0+5*1) >= cw(4,9+0));
  ASSUME(cw(4,0+5*1) >= cw(4,8+0));
  // Update
  caddr[4] = max(caddr[4],0);
  buff(4,0+5*1) = 1;
  mem(0+5*1,cw(4,0+5*1)) = 1;
  co(0+5*1,cw(4,0+5*1))+=1;
  delta(0+5*1,cw(4,0+5*1)) = -1;
  is(4,0+5*1) = iw(4,0+5*1);
  cs(4,0+5*1) = cw(4,0+5*1);
  ASSUME(creturn[4] >= cw(4,0+5*1));

  //   ret i8* null, !dbg !56
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

  //   call void @llvm.dbg.value(metadata i32 %argc, metadata !174, metadata !DIExpression()), !dbg !233

  //   call void @llvm.dbg.value(metadata i8** %argv, metadata !175, metadata !DIExpression()), !dbg !233

  //   %0 = bitcast i64* %thr0 to i8*, !dbg !104

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #7, !dbg !104

  //   call void @llvm.dbg.declare(metadata i64* %thr0, metadata !176, metadata !DIExpression()), !dbg !235

  //   %1 = bitcast i64* %thr1 to i8*, !dbg !106

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #7, !dbg !106

  //   call void @llvm.dbg.declare(metadata i64* %thr1, metadata !180, metadata !DIExpression()), !dbg !237

  //   %2 = bitcast i64* %thr2 to i8*, !dbg !108

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #7, !dbg !108

  //   call void @llvm.dbg.declare(metadata i64* %thr2, metadata !181, metadata !DIExpression()), !dbg !239

  //   %3 = bitcast i64* %thr3 to i8*, !dbg !110

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #7, !dbg !110

  //   call void @llvm.dbg.declare(metadata i64* %thr3, metadata !182, metadata !DIExpression()), !dbg !241

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 5), metadata !183, metadata !DIExpression()), !dbg !242

  //   call void @llvm.dbg.value(metadata i64 0, metadata !185, metadata !DIExpression()), !dbg !242

  //   store atomic i64 0, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 5) monotonic, align 8, !dbg !113
  // ST: Guess
  iw(0,0+5*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l72_c3
  old_cw = cw(0,0+5*1);
  cw(0,0+5*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l72_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 4), metadata !186, metadata !DIExpression()), !dbg !244

  //   call void @llvm.dbg.value(metadata i64 0, metadata !188, metadata !DIExpression()), !dbg !244

  //   store atomic i64 0, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 4) monotonic, align 8, !dbg !115
  // ST: Guess
  iw(0,0+4*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l73_c3
  old_cw = cw(0,0+4*1);
  cw(0,0+4*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l73_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 3), metadata !189, metadata !DIExpression()), !dbg !246

  //   call void @llvm.dbg.value(metadata i64 0, metadata !191, metadata !DIExpression()), !dbg !246

  //   store atomic i64 0, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !117
  // ST: Guess
  iw(0,0+3*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l74_c3
  old_cw = cw(0,0+3*1);
  cw(0,0+3*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l74_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 2), metadata !192, metadata !DIExpression()), !dbg !248

  //   call void @llvm.dbg.value(metadata i64 0, metadata !194, metadata !DIExpression()), !dbg !248

  //   store atomic i64 0, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 2) monotonic, align 8, !dbg !119
  // ST: Guess
  iw(0,0+2*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l75_c3
  old_cw = cw(0,0+2*1);
  cw(0,0+2*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l75_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 1), metadata !195, metadata !DIExpression()), !dbg !250

  //   call void @llvm.dbg.value(metadata i64 0, metadata !197, metadata !DIExpression()), !dbg !250

  //   store atomic i64 0, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !121
  // ST: Guess
  iw(0,0+1*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l76_c3
  old_cw = cw(0,0+1*1);
  cw(0,0+1*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l76_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 0), metadata !198, metadata !DIExpression()), !dbg !252

  //   call void @llvm.dbg.value(metadata i64 0, metadata !200, metadata !DIExpression()), !dbg !252

  //   store atomic i64 0, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !123
  // ST: Guess
  iw(0,0) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l77_c3
  old_cw = cw(0,0);
  cw(0,0) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l77_c3
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

  //   call void @llvm.dbg.value(metadata i32* @atom_0_X0_1, metadata !201, metadata !DIExpression()), !dbg !254

  //   call void @llvm.dbg.value(metadata i32 0, metadata !204, metadata !DIExpression()), !dbg !254

  //   store atomic i32 0, i32* @atom_0_X0_1 monotonic, align 4, !dbg !125
  // ST: Guess
  iw(0,6) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l78_c3
  old_cw = cw(0,6);
  cw(0,6) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l78_c3
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

  //   call void @llvm.dbg.value(metadata i32* @atom_0_X4_1, metadata !205, metadata !DIExpression()), !dbg !256

  //   call void @llvm.dbg.value(metadata i32 0, metadata !207, metadata !DIExpression()), !dbg !256

  //   store atomic i32 0, i32* @atom_0_X4_1 monotonic, align 4, !dbg !127
  // ST: Guess
  iw(0,7) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l79_c3
  old_cw = cw(0,7);
  cw(0,7) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l79_c3
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

  //   call void @llvm.dbg.value(metadata i32* @atom_2_X0_1, metadata !208, metadata !DIExpression()), !dbg !258

  //   call void @llvm.dbg.value(metadata i32 0, metadata !210, metadata !DIExpression()), !dbg !258

  //   store atomic i32 0, i32* @atom_2_X0_1 monotonic, align 4, !dbg !129
  // ST: Guess
  iw(0,8) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l80_c3
  old_cw = cw(0,8);
  cw(0,8) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l80_c3
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

  //   call void @llvm.dbg.value(metadata i32* @atom_2_X4_1, metadata !211, metadata !DIExpression()), !dbg !260

  //   call void @llvm.dbg.value(metadata i32 0, metadata !213, metadata !DIExpression()), !dbg !260

  //   store atomic i32 0, i32* @atom_2_X4_1 monotonic, align 4, !dbg !131
  // ST: Guess
  iw(0,9) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l81_c3
  old_cw = cw(0,9);
  cw(0,9) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l81_c3
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

  //   %call = call i32 @pthread_create(i64* noundef %thr0, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t0, i8* noundef null) #7, !dbg !132
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
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[1] >= cdy[0]);

  //   %call19 = call i32 @pthread_create(i64* noundef %thr1, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t1, i8* noundef null) #7, !dbg !133
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
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[2] >= cdy[0]);

  //   %call20 = call i32 @pthread_create(i64* noundef %thr2, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t2, i8* noundef null) #7, !dbg !134
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
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[3] >= cdy[0]);

  //   %call21 = call i32 @pthread_create(i64* noundef %thr3, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t3, i8* noundef null) #7, !dbg !135
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
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[4] >= cdy[0]);

  //   %4 = load i64, i64* %thr0, align 8, !dbg !136, !tbaa !137
  r15 = local_mem[0];

  //   %call22 = call i32 @pthread_join(i64 noundef %4, i8** noundef null), !dbg !141
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
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[1]);

  //   %5 = load i64, i64* %thr1, align 8, !dbg !142, !tbaa !137
  r16 = local_mem[1];

  //   %call23 = call i32 @pthread_join(i64 noundef %5, i8** noundef null), !dbg !143
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
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[2]);

  //   %6 = load i64, i64* %thr2, align 8, !dbg !144, !tbaa !137
  r17 = local_mem[2];

  //   %call24 = call i32 @pthread_join(i64 noundef %6, i8** noundef null), !dbg !145
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
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[3]);

  //   %7 = load i64, i64* %thr3, align 8, !dbg !146, !tbaa !137
  r18 = local_mem[3];

  //   %call25 = call i32 @pthread_join(i64 noundef %7, i8** noundef null), !dbg !147
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
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[4]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 4), metadata !215, metadata !DIExpression()), !dbg !276

  //   %8 = load atomic i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 4) monotonic, align 8, !dbg !149
  // LD: Guess
  old_cr = cr(0,0+4*1);
  cr(0,0+4*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l93_c13
  // Check
  ASSUME(active[cr(0,0+4*1)] == 0);
  ASSUME(cr(0,0+4*1) >= iw(0,0+4*1));
  ASSUME(cr(0,0+4*1) >= 0);
  ASSUME(cr(0,0+4*1) >= cdy[0]);
  ASSUME(cr(0,0+4*1) >= cisb[0]);
  ASSUME(cr(0,0+4*1) >= cdl[0]);
  ASSUME(cr(0,0+4*1) >= cl[0]);
  // Update
  creg_r19 = cr(0,0+4*1);
  crmax(0,0+4*1) = max(crmax(0,0+4*1),cr(0,0+4*1));
  caddr[0] = max(caddr[0],0);
  if(cr(0,0+4*1) < cw(0,0+4*1)) {
    r19 = buff(0,0+4*1);
    ASSUME((!(( (cw(0,0+4*1) < 1) && (1 < crmax(0,0+4*1)) )))||(sforbid(0+4*1,1)> 0));
    ASSUME((!(( (cw(0,0+4*1) < 2) && (2 < crmax(0,0+4*1)) )))||(sforbid(0+4*1,2)> 0));
    ASSUME((!(( (cw(0,0+4*1) < 3) && (3 < crmax(0,0+4*1)) )))||(sforbid(0+4*1,3)> 0));
    ASSUME((!(( (cw(0,0+4*1) < 4) && (4 < crmax(0,0+4*1)) )))||(sforbid(0+4*1,4)> 0));
    ASSUME((!(( (cw(0,0+4*1) < 5) && (5 < crmax(0,0+4*1)) )))||(sforbid(0+4*1,5)> 0));
    ASSUME((!(( (cw(0,0+4*1) < 6) && (6 < crmax(0,0+4*1)) )))||(sforbid(0+4*1,6)> 0));
    ASSUME((!(( (cw(0,0+4*1) < 7) && (7 < crmax(0,0+4*1)) )))||(sforbid(0+4*1,7)> 0));
    ASSUME((!(( (cw(0,0+4*1) < 8) && (8 < crmax(0,0+4*1)) )))||(sforbid(0+4*1,8)> 0));
    ASSUME((!(( (cw(0,0+4*1) < 9) && (9 < crmax(0,0+4*1)) )))||(sforbid(0+4*1,9)> 0));
  } else {
    if(pw(0,0+4*1) != co(0+4*1,cr(0,0+4*1))) {
      ASSUME(cr(0,0+4*1) >= old_cr);
    }
    pw(0,0+4*1) = co(0+4*1,cr(0,0+4*1));
    r19 = mem(0+4*1,cr(0,0+4*1));
  }
  ASSUME(creturn[0] >= cr(0,0+4*1));

  //   call void @llvm.dbg.value(metadata i64 %8, metadata !217, metadata !DIExpression()), !dbg !276

  //   %conv = trunc i64 %8 to i32, !dbg !150

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !214, metadata !DIExpression()), !dbg !233

  //   %cmp = icmp eq i32 %conv, 2, !dbg !151
  creg__r19__2_ = max(0,creg_r19);

  //   %conv26 = zext i1 %cmp to i32, !dbg !151

  //   call void @llvm.dbg.value(metadata i32 %conv26, metadata !218, metadata !DIExpression()), !dbg !233

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 1), metadata !220, metadata !DIExpression()), !dbg !280

  //   %9 = load atomic i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !153
  // LD: Guess
  old_cr = cr(0,0+1*1);
  cr(0,0+1*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l95_c13
  // Check
  ASSUME(active[cr(0,0+1*1)] == 0);
  ASSUME(cr(0,0+1*1) >= iw(0,0+1*1));
  ASSUME(cr(0,0+1*1) >= 0);
  ASSUME(cr(0,0+1*1) >= cdy[0]);
  ASSUME(cr(0,0+1*1) >= cisb[0]);
  ASSUME(cr(0,0+1*1) >= cdl[0]);
  ASSUME(cr(0,0+1*1) >= cl[0]);
  // Update
  creg_r20 = cr(0,0+1*1);
  crmax(0,0+1*1) = max(crmax(0,0+1*1),cr(0,0+1*1));
  caddr[0] = max(caddr[0],0);
  if(cr(0,0+1*1) < cw(0,0+1*1)) {
    r20 = buff(0,0+1*1);
    ASSUME((!(( (cw(0,0+1*1) < 1) && (1 < crmax(0,0+1*1)) )))||(sforbid(0+1*1,1)> 0));
    ASSUME((!(( (cw(0,0+1*1) < 2) && (2 < crmax(0,0+1*1)) )))||(sforbid(0+1*1,2)> 0));
    ASSUME((!(( (cw(0,0+1*1) < 3) && (3 < crmax(0,0+1*1)) )))||(sforbid(0+1*1,3)> 0));
    ASSUME((!(( (cw(0,0+1*1) < 4) && (4 < crmax(0,0+1*1)) )))||(sforbid(0+1*1,4)> 0));
    ASSUME((!(( (cw(0,0+1*1) < 5) && (5 < crmax(0,0+1*1)) )))||(sforbid(0+1*1,5)> 0));
    ASSUME((!(( (cw(0,0+1*1) < 6) && (6 < crmax(0,0+1*1)) )))||(sforbid(0+1*1,6)> 0));
    ASSUME((!(( (cw(0,0+1*1) < 7) && (7 < crmax(0,0+1*1)) )))||(sforbid(0+1*1,7)> 0));
    ASSUME((!(( (cw(0,0+1*1) < 8) && (8 < crmax(0,0+1*1)) )))||(sforbid(0+1*1,8)> 0));
    ASSUME((!(( (cw(0,0+1*1) < 9) && (9 < crmax(0,0+1*1)) )))||(sforbid(0+1*1,9)> 0));
  } else {
    if(pw(0,0+1*1) != co(0+1*1,cr(0,0+1*1))) {
      ASSUME(cr(0,0+1*1) >= old_cr);
    }
    pw(0,0+1*1) = co(0+1*1,cr(0,0+1*1));
    r20 = mem(0+1*1,cr(0,0+1*1));
  }
  ASSUME(creturn[0] >= cr(0,0+1*1));

  //   call void @llvm.dbg.value(metadata i64 %9, metadata !222, metadata !DIExpression()), !dbg !280

  //   %conv30 = trunc i64 %9 to i32, !dbg !154

  //   call void @llvm.dbg.value(metadata i32 %conv30, metadata !219, metadata !DIExpression()), !dbg !233

  //   %cmp31 = icmp eq i32 %conv30, 2, !dbg !155
  creg__r20__2_ = max(0,creg_r20);

  //   %conv32 = zext i1 %cmp31 to i32, !dbg !155

  //   call void @llvm.dbg.value(metadata i32 %conv32, metadata !223, metadata !DIExpression()), !dbg !233

  //   %10 = load i32, i32* @atom_0_X0_1, align 4, !dbg !156, !tbaa !157
  // LD: Guess
  old_cr = cr(0,6);
  cr(0,6) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l97_c13
  // Check
  ASSUME(active[cr(0,6)] == 0);
  ASSUME(cr(0,6) >= iw(0,6));
  ASSUME(cr(0,6) >= 0);
  ASSUME(cr(0,6) >= cdy[0]);
  ASSUME(cr(0,6) >= cisb[0]);
  ASSUME(cr(0,6) >= cdl[0]);
  ASSUME(cr(0,6) >= cl[0]);
  // Update
  creg_r21 = cr(0,6);
  crmax(0,6) = max(crmax(0,6),cr(0,6));
  caddr[0] = max(caddr[0],0);
  if(cr(0,6) < cw(0,6)) {
    r21 = buff(0,6);
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
    r21 = mem(6,cr(0,6));
  }
  ASSUME(creturn[0] >= cr(0,6));

  //   call void @llvm.dbg.value(metadata i32 %10, metadata !224, metadata !DIExpression()), !dbg !233

  //   %11 = load i32, i32* @atom_0_X4_1, align 4, !dbg !159, !tbaa !157
  // LD: Guess
  old_cr = cr(0,7);
  cr(0,7) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l98_c13
  // Check
  ASSUME(active[cr(0,7)] == 0);
  ASSUME(cr(0,7) >= iw(0,7));
  ASSUME(cr(0,7) >= 0);
  ASSUME(cr(0,7) >= cdy[0]);
  ASSUME(cr(0,7) >= cisb[0]);
  ASSUME(cr(0,7) >= cdl[0]);
  ASSUME(cr(0,7) >= cl[0]);
  // Update
  creg_r22 = cr(0,7);
  crmax(0,7) = max(crmax(0,7),cr(0,7));
  caddr[0] = max(caddr[0],0);
  if(cr(0,7) < cw(0,7)) {
    r22 = buff(0,7);
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
    r22 = mem(7,cr(0,7));
  }
  ASSUME(creturn[0] >= cr(0,7));

  //   call void @llvm.dbg.value(metadata i32 %11, metadata !225, metadata !DIExpression()), !dbg !233

  //   %12 = load i32, i32* @atom_2_X0_1, align 4, !dbg !160, !tbaa !157
  // LD: Guess
  old_cr = cr(0,8);
  cr(0,8) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l99_c13
  // Check
  ASSUME(active[cr(0,8)] == 0);
  ASSUME(cr(0,8) >= iw(0,8));
  ASSUME(cr(0,8) >= 0);
  ASSUME(cr(0,8) >= cdy[0]);
  ASSUME(cr(0,8) >= cisb[0]);
  ASSUME(cr(0,8) >= cdl[0]);
  ASSUME(cr(0,8) >= cl[0]);
  // Update
  creg_r23 = cr(0,8);
  crmax(0,8) = max(crmax(0,8),cr(0,8));
  caddr[0] = max(caddr[0],0);
  if(cr(0,8) < cw(0,8)) {
    r23 = buff(0,8);
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
    r23 = mem(8,cr(0,8));
  }
  ASSUME(creturn[0] >= cr(0,8));

  //   call void @llvm.dbg.value(metadata i32 %12, metadata !226, metadata !DIExpression()), !dbg !233

  //   %13 = load i32, i32* @atom_2_X4_1, align 4, !dbg !161, !tbaa !157
  // LD: Guess
  old_cr = cr(0,9);
  cr(0,9) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l100_c13
  // Check
  ASSUME(active[cr(0,9)] == 0);
  ASSUME(cr(0,9) >= iw(0,9));
  ASSUME(cr(0,9) >= 0);
  ASSUME(cr(0,9) >= cdy[0]);
  ASSUME(cr(0,9) >= cisb[0]);
  ASSUME(cr(0,9) >= cdl[0]);
  ASSUME(cr(0,9) >= cl[0]);
  // Update
  creg_r24 = cr(0,9);
  crmax(0,9) = max(crmax(0,9),cr(0,9));
  caddr[0] = max(caddr[0],0);
  if(cr(0,9) < cw(0,9)) {
    r24 = buff(0,9);
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
    r24 = mem(9,cr(0,9));
  }
  ASSUME(creturn[0] >= cr(0,9));

  //   call void @llvm.dbg.value(metadata i32 %13, metadata !227, metadata !DIExpression()), !dbg !233

  //   %and = and i32 %12, %13, !dbg !162
  creg_r25 = max(creg_r23,creg_r24);
  r25 = r23 & r24;

  //   call void @llvm.dbg.value(metadata i32 %and, metadata !228, metadata !DIExpression()), !dbg !233

  //   %and33 = and i32 %11, %and, !dbg !163
  creg_r26 = max(creg_r22,creg_r25);
  r26 = r22 & r25;

  //   call void @llvm.dbg.value(metadata i32 %and33, metadata !229, metadata !DIExpression()), !dbg !233

  //   %and34 = and i32 %10, %and33, !dbg !164
  creg_r27 = max(creg_r21,creg_r26);
  r27 = r21 & r26;

  //   call void @llvm.dbg.value(metadata i32 %and34, metadata !230, metadata !DIExpression()), !dbg !233

  //   %and35 = and i32 %conv32, %and34, !dbg !165
  creg_r28 = max(creg__r20__2_,creg_r27);
  r28 = (r20==2) & r27;

  //   call void @llvm.dbg.value(metadata i32 %and35, metadata !231, metadata !DIExpression()), !dbg !233

  //   %and36 = and i32 %conv26, %and35, !dbg !166
  creg_r29 = max(creg__r19__2_,creg_r28);
  r29 = (r19==2) & r28;

  //   call void @llvm.dbg.value(metadata i32 %and36, metadata !232, metadata !DIExpression()), !dbg !233

  //   %cmp37 = icmp eq i32 %and36, 1, !dbg !167
  creg__r29__1_ = max(0,creg_r29);

  //   br i1 %cmp37, label %if.then, label %if.end, !dbg !169
  old_cctrl = cctrl[0];
  cctrl[0] = get_rng(0,NCONTEXT-1);
  ASSUME(cctrl[0] >= old_cctrl);
  ASSUME(cctrl[0] >= creg__r29__1_);
  if((r29==1)) {
    goto T0BLOCK1;
  } else {
    goto T0BLOCK2;
  }

T0BLOCK1:
  //   call void @__assert_fail(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([113 x i8], [113 x i8]* @.str.1, i64 0, i64 0), i32 noundef 106, i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #8, !dbg !170

  //   unreachable, !dbg !170
  r30 = 1;
  goto T0BLOCK_END;

T0BLOCK2:
  //   %14 = bitcast i64* %thr3 to i8*, !dbg !173

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %14) #7, !dbg !173

  //   %15 = bitcast i64* %thr2 to i8*, !dbg !173

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %15) #7, !dbg !173

  //   %16 = bitcast i64* %thr1 to i8*, !dbg !173

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %16) #7, !dbg !173

  //   %17 = bitcast i64* %thr0 to i8*, !dbg !173

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %17) #7, !dbg !173

  //   ret i32 0, !dbg !174
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

  ASSERT(r30== 0);

}
