// Global variabls:
// 0:vars:5
// 7:atom_1_X11_0:1
// 5:atom_1_X0_1:1
// 6:atom_1_X7_1:1
// Local global variabls:
// 0:thr0:1
// 1:thr1:1
#define ADDRSIZE 8
#define LOCALADDRSIZE 2
#define NTHREAD 3
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
  mem(0+4,0) = 0;
  mem(7+0,0) = 0;
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
  // Dumping thread 1
  int ret_thread_1 = 0;
  cdy[1] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[1] >= cstart[1]);
T1BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !38, metadata !DIExpression()), !dbg !47

  //   br label %label_1, !dbg !48
  goto T1BLOCK1;

T1BLOCK1:
  //   call void @llvm.dbg.label(metadata !46), !dbg !49

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 0), metadata !39, metadata !DIExpression()), !dbg !50

  //   call void @llvm.dbg.value(metadata i64 1, metadata !42, metadata !DIExpression()), !dbg !50

  //   store atomic i64 1, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !51
  // ST: Guess
  iw(1,0) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW _l21_c3
  old_cw = cw(1,0);
  cw(1,0) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM _l21_c3
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

  //   call void (...) @dmbsy(), !dbg !52
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
  ASSUME(cdy[1] >= cw(1,7+0));
  ASSUME(cdy[1] >= cw(1,5+0));
  ASSUME(cdy[1] >= cw(1,6+0));
  ASSUME(cdy[1] >= cr(1,0+0));
  ASSUME(cdy[1] >= cr(1,0+1));
  ASSUME(cdy[1] >= cr(1,0+2));
  ASSUME(cdy[1] >= cr(1,0+3));
  ASSUME(cdy[1] >= cr(1,0+4));
  ASSUME(cdy[1] >= cr(1,7+0));
  ASSUME(cdy[1] >= cr(1,5+0));
  ASSUME(cdy[1] >= cr(1,6+0));
  ASSUME(creturn[1] >= cdy[1]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 1), metadata !43, metadata !DIExpression()), !dbg !53

  //   call void @llvm.dbg.value(metadata i64 1, metadata !45, metadata !DIExpression()), !dbg !53

  //   store atomic i64 1, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !54
  // ST: Guess
  iw(1,0+1*1) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW _l23_c3
  old_cw = cw(1,0+1*1);
  cw(1,0+1*1) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM _l23_c3
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

  //   ret i8* null, !dbg !55
  ret_thread_1 = (- 1);
  goto T1BLOCK_END;

T1BLOCK_END:

  // Dumping thread 2
  int ret_thread_2 = 0;
  cdy[2] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[2] >= cstart[2]);
T2BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !58, metadata !DIExpression()), !dbg !90

  //   br label %label_2, !dbg !72
  goto T2BLOCK1;

T2BLOCK1:
  //   call void @llvm.dbg.label(metadata !87), !dbg !92

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 1), metadata !60, metadata !DIExpression()), !dbg !93

  //   %0 = load atomic i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !75
  // LD: Guess
  old_cr = cr(2,0+1*1);
  cr(2,0+1*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN LDCOM _l29_c15
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

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !62, metadata !DIExpression()), !dbg !93

  //   %conv = trunc i64 %0 to i32, !dbg !76

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !59, metadata !DIExpression()), !dbg !90

  //   %tobool = icmp ne i32 %conv, 0, !dbg !77
  creg__r0__0_ = max(0,creg_r0);

  //   br i1 %tobool, label %if.then, label %if.else, !dbg !79
  old_cctrl = cctrl[2];
  cctrl[2] = get_rng(0,NCONTEXT-1);
  ASSUME(cctrl[2] >= old_cctrl);
  ASSUME(cctrl[2] >= creg__r0__0_);
  if((r0!=0)) {
    goto T2BLOCK2;
  } else {
    goto T2BLOCK3;
  }

T2BLOCK2:
  //   br label %lbl_LC00, !dbg !80
  goto T2BLOCK4;

T2BLOCK3:
  //   br label %lbl_LC00, !dbg !81
  goto T2BLOCK4;

T2BLOCK4:
  //   call void @llvm.dbg.label(metadata !88), !dbg !101

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 2), metadata !64, metadata !DIExpression()), !dbg !102

  //   %1 = load atomic i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 2) monotonic, align 8, !dbg !84
  // LD: Guess
  old_cr = cr(2,0+2*1);
  cr(2,0+2*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN LDCOM _l32_c15
  // Check
  ASSUME(active[cr(2,0+2*1)] == 2);
  ASSUME(cr(2,0+2*1) >= iw(2,0+2*1));
  ASSUME(cr(2,0+2*1) >= 0);
  ASSUME(cr(2,0+2*1) >= cdy[2]);
  ASSUME(cr(2,0+2*1) >= cisb[2]);
  ASSUME(cr(2,0+2*1) >= cdl[2]);
  ASSUME(cr(2,0+2*1) >= cl[2]);
  // Update
  creg_r1 = cr(2,0+2*1);
  crmax(2,0+2*1) = max(crmax(2,0+2*1),cr(2,0+2*1));
  caddr[2] = max(caddr[2],0);
  if(cr(2,0+2*1) < cw(2,0+2*1)) {
    r1 = buff(2,0+2*1);
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
    r1 = mem(0+2*1,cr(2,0+2*1));
  }
  ASSUME(creturn[2] >= cr(2,0+2*1));

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !66, metadata !DIExpression()), !dbg !102

  //   %conv4 = trunc i64 %1 to i32, !dbg !85

  //   call void @llvm.dbg.value(metadata i32 %conv4, metadata !63, metadata !DIExpression()), !dbg !90

  //   %xor = xor i32 %conv4, %conv4, !dbg !86
  creg_r2 = creg_r1;
  r2 = r1 ^ r1;

  //   call void @llvm.dbg.value(metadata i32 %xor, metadata !67, metadata !DIExpression()), !dbg !90

  //   %add = add nsw i32 3, %xor, !dbg !87
  creg_r3 = max(0,creg_r2);
  r3 = 3 + r2;

  //   %idxprom = sext i32 %add to i64, !dbg !87

  //   %arrayidx = getelementptr inbounds [5 x i64], [5 x i64]* @vars, i64 0, i64 %idxprom, !dbg !87
  r4 = 0+r3*1;
  creg_r4 = creg_r3;

  //   call void @llvm.dbg.value(metadata i64* %arrayidx, metadata !68, metadata !DIExpression()), !dbg !107

  //   call void @llvm.dbg.value(metadata i64 1, metadata !70, metadata !DIExpression()), !dbg !107

  //   store atomic i64 1, i64* %arrayidx monotonic, align 8, !dbg !87
  // ST: Guess
  iw(2,r4) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW _l34_c3
  old_cw = cw(2,r4);
  cw(2,r4) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM _l34_c3
  // Check
  ASSUME(active[iw(2,r4)] == 2);
  ASSUME(active[cw(2,r4)] == 2);
  ASSUME(sforbid(r4,cw(2,r4))== 0);
  ASSUME(iw(2,r4) >= 0);
  ASSUME(iw(2,r4) >= creg_r4);
  ASSUME(cw(2,r4) >= iw(2,r4));
  ASSUME(cw(2,r4) >= old_cw);
  ASSUME(cw(2,r4) >= cr(2,r4));
  ASSUME(cw(2,r4) >= cl[2]);
  ASSUME(cw(2,r4) >= cisb[2]);
  ASSUME(cw(2,r4) >= cdy[2]);
  ASSUME(cw(2,r4) >= cdl[2]);
  ASSUME(cw(2,r4) >= cds[2]);
  ASSUME(cw(2,r4) >= cctrl[2]);
  ASSUME(cw(2,r4) >= caddr[2]);
  // Update
  caddr[2] = max(caddr[2],creg_r4);
  buff(2,r4) = 1;
  mem(r4,cw(2,r4)) = 1;
  co(r4,cw(2,r4))+=1;
  delta(r4,cw(2,r4)) = -1;
  ASSUME(creturn[2] >= cw(2,r4));

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 3), metadata !72, metadata !DIExpression()), !dbg !108

  //   %2 = load atomic i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !90
  // LD: Guess
  old_cr = cr(2,0+3*1);
  cr(2,0+3*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN LDCOM _l35_c16
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
    r5 = mem(0+3*1,cr(2,0+3*1));
  }
  ASSUME(creturn[2] >= cr(2,0+3*1));

  //   call void @llvm.dbg.value(metadata i64 %2, metadata !74, metadata !DIExpression()), !dbg !108

  //   %conv8 = trunc i64 %2 to i32, !dbg !91

  //   call void @llvm.dbg.value(metadata i32 %conv8, metadata !71, metadata !DIExpression()), !dbg !90

  //   %xor9 = xor i32 %conv8, %conv8, !dbg !92
  creg_r6 = creg_r5;
  r6 = r5 ^ r5;

  //   call void @llvm.dbg.value(metadata i32 %xor9, metadata !75, metadata !DIExpression()), !dbg !90

  //   %add11 = add nsw i32 4, %xor9, !dbg !93
  creg_r7 = max(0,creg_r6);
  r7 = 4 + r6;

  //   %idxprom12 = sext i32 %add11 to i64, !dbg !93

  //   %arrayidx13 = getelementptr inbounds [5 x i64], [5 x i64]* @vars, i64 0, i64 %idxprom12, !dbg !93
  r8 = 0+r7*1;
  creg_r8 = creg_r7;

  //   call void @llvm.dbg.value(metadata i64* %arrayidx13, metadata !77, metadata !DIExpression()), !dbg !113

  //   %3 = load atomic i64, i64* %arrayidx13 monotonic, align 8, !dbg !93
  // LD: Guess
  old_cr = cr(2,r8);
  cr(2,r8) = get_rng(0,NCONTEXT-1);// 2 ASSIGN LDCOM _l37_c16
  // Check
  ASSUME(active[cr(2,r8)] == 2);
  ASSUME(cr(2,r8) >= iw(2,r8));
  ASSUME(cr(2,r8) >= creg_r8);
  ASSUME(cr(2,r8) >= cdy[2]);
  ASSUME(cr(2,r8) >= cisb[2]);
  ASSUME(cr(2,r8) >= cdl[2]);
  ASSUME(cr(2,r8) >= cl[2]);
  // Update
  creg_r9 = cr(2,r8);
  crmax(2,r8) = max(crmax(2,r8),cr(2,r8));
  caddr[2] = max(caddr[2],creg_r8);
  if(cr(2,r8) < cw(2,r8)) {
    r9 = buff(2,r8);
    ASSUME((!(( (cw(2,r8) < 1) && (1 < crmax(2,r8)) )))||(sforbid(r8,1)> 0));
    ASSUME((!(( (cw(2,r8) < 2) && (2 < crmax(2,r8)) )))||(sforbid(r8,2)> 0));
    ASSUME((!(( (cw(2,r8) < 3) && (3 < crmax(2,r8)) )))||(sforbid(r8,3)> 0));
    ASSUME((!(( (cw(2,r8) < 4) && (4 < crmax(2,r8)) )))||(sforbid(r8,4)> 0));
    ASSUME((!(( (cw(2,r8) < 5) && (5 < crmax(2,r8)) )))||(sforbid(r8,5)> 0));
    ASSUME((!(( (cw(2,r8) < 6) && (6 < crmax(2,r8)) )))||(sforbid(r8,6)> 0));
    ASSUME((!(( (cw(2,r8) < 7) && (7 < crmax(2,r8)) )))||(sforbid(r8,7)> 0));
    ASSUME((!(( (cw(2,r8) < 8) && (8 < crmax(2,r8)) )))||(sforbid(r8,8)> 0));
    ASSUME((!(( (cw(2,r8) < 9) && (9 < crmax(2,r8)) )))||(sforbid(r8,9)> 0));
  } else {
    if(pw(2,r8) != co(r8,cr(2,r8))) {
      ASSUME(cr(2,r8) >= old_cr);
    }
    pw(2,r8) = co(r8,cr(2,r8));
    r9 = mem(r8,cr(2,r8));
  }
  ASSUME(creturn[2] >= cr(2,r8));

  //   call void @llvm.dbg.value(metadata i64 %3, metadata !79, metadata !DIExpression()), !dbg !113

  //   %conv16 = trunc i64 %3 to i32, !dbg !95

  //   call void @llvm.dbg.value(metadata i32 %conv16, metadata !76, metadata !DIExpression()), !dbg !90

  //   %tobool17 = icmp ne i32 %conv16, 0, !dbg !96
  creg__r9__0_ = max(0,creg_r9);

  //   br i1 %tobool17, label %if.then18, label %if.else19, !dbg !98
  old_cctrl = cctrl[2];
  cctrl[2] = get_rng(0,NCONTEXT-1);
  ASSUME(cctrl[2] >= old_cctrl);
  ASSUME(cctrl[2] >= creg__r9__0_);
  if((r9!=0)) {
    goto T2BLOCK5;
  } else {
    goto T2BLOCK6;
  }

T2BLOCK5:
  //   br label %lbl_LC01, !dbg !99
  goto T2BLOCK7;

T2BLOCK6:
  //   br label %lbl_LC01, !dbg !100
  goto T2BLOCK7;

T2BLOCK7:
  //   call void @llvm.dbg.label(metadata !89), !dbg !120

  //   call void (...) @isb(), !dbg !102
  // isb: Guess
  cisb[2] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cisb[2] >= cdy[2]);
  ASSUME(cisb[2] >= cctrl[2]);
  ASSUME(cisb[2] >= caddr[2]);
  ASSUME(creturn[2] >= cisb[2]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 0), metadata !81, metadata !DIExpression()), !dbg !122

  //   %4 = load atomic i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !104
  // LD: Guess
  old_cr = cr(2,0);
  cr(2,0) = get_rng(0,NCONTEXT-1);// 2 ASSIGN LDCOM _l41_c17
  // Check
  ASSUME(active[cr(2,0)] == 2);
  ASSUME(cr(2,0) >= iw(2,0));
  ASSUME(cr(2,0) >= 0);
  ASSUME(cr(2,0) >= cdy[2]);
  ASSUME(cr(2,0) >= cisb[2]);
  ASSUME(cr(2,0) >= cdl[2]);
  ASSUME(cr(2,0) >= cl[2]);
  // Update
  creg_r10 = cr(2,0);
  crmax(2,0) = max(crmax(2,0),cr(2,0));
  caddr[2] = max(caddr[2],0);
  if(cr(2,0) < cw(2,0)) {
    r10 = buff(2,0);
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
    r10 = mem(0,cr(2,0));
  }
  ASSUME(creturn[2] >= cr(2,0));

  //   call void @llvm.dbg.value(metadata i64 %4, metadata !83, metadata !DIExpression()), !dbg !122

  //   %conv23 = trunc i64 %4 to i32, !dbg !105

  //   call void @llvm.dbg.value(metadata i32 %conv23, metadata !80, metadata !DIExpression()), !dbg !90

  //   %cmp = icmp eq i32 %conv, 1, !dbg !106
  creg__r0__1_ = max(0,creg_r0);

  //   %conv24 = zext i1 %cmp to i32, !dbg !106

  //   call void @llvm.dbg.value(metadata i32 %conv24, metadata !84, metadata !DIExpression()), !dbg !90

  //   store i32 %conv24, i32* @atom_1_X0_1, align 4, !dbg !107, !tbaa !108
  // ST: Guess
  iw(2,5) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW _l43_c15
  old_cw = cw(2,5);
  cw(2,5) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM _l43_c15
  // Check
  ASSUME(active[iw(2,5)] == 2);
  ASSUME(active[cw(2,5)] == 2);
  ASSUME(sforbid(5,cw(2,5))== 0);
  ASSUME(iw(2,5) >= creg__r0__1_);
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
  buff(2,5) = (r0==1);
  mem(5,cw(2,5)) = (r0==1);
  co(5,cw(2,5))+=1;
  delta(5,cw(2,5)) = -1;
  ASSUME(creturn[2] >= cw(2,5));

  //   %cmp25 = icmp eq i32 %conv8, 1, !dbg !112
  creg__r5__1_ = max(0,creg_r5);

  //   %conv26 = zext i1 %cmp25 to i32, !dbg !112

  //   call void @llvm.dbg.value(metadata i32 %conv26, metadata !85, metadata !DIExpression()), !dbg !90

  //   store i32 %conv26, i32* @atom_1_X7_1, align 4, !dbg !113, !tbaa !108
  // ST: Guess
  iw(2,6) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW _l45_c15
  old_cw = cw(2,6);
  cw(2,6) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM _l45_c15
  // Check
  ASSUME(active[iw(2,6)] == 2);
  ASSUME(active[cw(2,6)] == 2);
  ASSUME(sforbid(6,cw(2,6))== 0);
  ASSUME(iw(2,6) >= creg__r5__1_);
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
  buff(2,6) = (r5==1);
  mem(6,cw(2,6)) = (r5==1);
  co(6,cw(2,6))+=1;
  delta(6,cw(2,6)) = -1;
  ASSUME(creturn[2] >= cw(2,6));

  //   %cmp27 = icmp eq i32 %conv23, 0, !dbg !114
  creg__r10__0_ = max(0,creg_r10);

  //   %conv28 = zext i1 %cmp27 to i32, !dbg !114

  //   call void @llvm.dbg.value(metadata i32 %conv28, metadata !86, metadata !DIExpression()), !dbg !90

  //   store i32 %conv28, i32* @atom_1_X11_0, align 4, !dbg !115, !tbaa !108
  // ST: Guess
  iw(2,7) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW _l47_c16
  old_cw = cw(2,7);
  cw(2,7) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM _l47_c16
  // Check
  ASSUME(active[iw(2,7)] == 2);
  ASSUME(active[cw(2,7)] == 2);
  ASSUME(sforbid(7,cw(2,7))== 0);
  ASSUME(iw(2,7) >= creg__r10__0_);
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
  buff(2,7) = (r10==0);
  mem(7,cw(2,7)) = (r10==0);
  co(7,cw(2,7))+=1;
  delta(7,cw(2,7)) = -1;
  ASSUME(creturn[2] >= cw(2,7));

  //   ret i8* null, !dbg !116
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

  //   call void @llvm.dbg.value(metadata i32 %argc, metadata !143, metadata !DIExpression()), !dbg !198

  //   call void @llvm.dbg.value(metadata i8** %argv, metadata !144, metadata !DIExpression()), !dbg !198

  //   %0 = bitcast i64* %thr0 to i8*, !dbg !98

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #6, !dbg !98

  //   call void @llvm.dbg.declare(metadata i64* %thr0, metadata !145, metadata !DIExpression()), !dbg !200

  //   %1 = bitcast i64* %thr1 to i8*, !dbg !100

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #6, !dbg !100

  //   call void @llvm.dbg.declare(metadata i64* %thr1, metadata !149, metadata !DIExpression()), !dbg !202

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 4), metadata !150, metadata !DIExpression()), !dbg !203

  //   call void @llvm.dbg.value(metadata i64 0, metadata !152, metadata !DIExpression()), !dbg !203

  //   store atomic i64 0, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 4) monotonic, align 8, !dbg !103
  // ST: Guess
  iw(0,0+4*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l55_c3
  old_cw = cw(0,0+4*1);
  cw(0,0+4*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l55_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 3), metadata !153, metadata !DIExpression()), !dbg !205

  //   call void @llvm.dbg.value(metadata i64 0, metadata !155, metadata !DIExpression()), !dbg !205

  //   store atomic i64 0, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !105
  // ST: Guess
  iw(0,0+3*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l56_c3
  old_cw = cw(0,0+3*1);
  cw(0,0+3*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l56_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 2), metadata !156, metadata !DIExpression()), !dbg !207

  //   call void @llvm.dbg.value(metadata i64 0, metadata !158, metadata !DIExpression()), !dbg !207

  //   store atomic i64 0, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 2) monotonic, align 8, !dbg !107
  // ST: Guess
  iw(0,0+2*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l57_c3
  old_cw = cw(0,0+2*1);
  cw(0,0+2*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l57_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 1), metadata !159, metadata !DIExpression()), !dbg !209

  //   call void @llvm.dbg.value(metadata i64 0, metadata !161, metadata !DIExpression()), !dbg !209

  //   store atomic i64 0, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !109
  // ST: Guess
  iw(0,0+1*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l58_c3
  old_cw = cw(0,0+1*1);
  cw(0,0+1*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l58_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 0), metadata !162, metadata !DIExpression()), !dbg !211

  //   call void @llvm.dbg.value(metadata i64 0, metadata !164, metadata !DIExpression()), !dbg !211

  //   store atomic i64 0, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !111
  // ST: Guess
  iw(0,0) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l59_c3
  old_cw = cw(0,0);
  cw(0,0) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l59_c3
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

  //   call void @llvm.dbg.value(metadata i32* @atom_1_X0_1, metadata !165, metadata !DIExpression()), !dbg !213

  //   call void @llvm.dbg.value(metadata i32 0, metadata !168, metadata !DIExpression()), !dbg !213

  //   store atomic i32 0, i32* @atom_1_X0_1 monotonic, align 4, !dbg !113
  // ST: Guess
  iw(0,5) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l60_c3
  old_cw = cw(0,5);
  cw(0,5) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l60_c3
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

  //   call void @llvm.dbg.value(metadata i32* @atom_1_X7_1, metadata !169, metadata !DIExpression()), !dbg !215

  //   call void @llvm.dbg.value(metadata i32 0, metadata !171, metadata !DIExpression()), !dbg !215

  //   store atomic i32 0, i32* @atom_1_X7_1 monotonic, align 4, !dbg !115
  // ST: Guess
  iw(0,6) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l61_c3
  old_cw = cw(0,6);
  cw(0,6) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l61_c3
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

  //   call void @llvm.dbg.value(metadata i32* @atom_1_X11_0, metadata !172, metadata !DIExpression()), !dbg !217

  //   call void @llvm.dbg.value(metadata i32 0, metadata !174, metadata !DIExpression()), !dbg !217

  //   store atomic i32 0, i32* @atom_1_X11_0 monotonic, align 4, !dbg !117
  // ST: Guess
  iw(0,7) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l62_c3
  old_cw = cw(0,7);
  cw(0,7) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l62_c3
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

  //   %call = call i32 @pthread_create(i64* noundef %thr0, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t0, i8* noundef null) #6, !dbg !118
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
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[1] >= cdy[0]);

  //   %call15 = call i32 @pthread_create(i64* noundef %thr1, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t1, i8* noundef null) #6, !dbg !119
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
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[2] >= cdy[0]);

  //   %2 = load i64, i64* %thr0, align 8, !dbg !120, !tbaa !121
  r12 = local_mem[0];

  //   %call16 = call i32 @pthread_join(i64 noundef %2, i8** noundef null), !dbg !125
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
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[1]);

  //   %3 = load i64, i64* %thr1, align 8, !dbg !126, !tbaa !121
  r13 = local_mem[1];

  //   %call17 = call i32 @pthread_join(i64 noundef %3, i8** noundef null), !dbg !127
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
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[2]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 3), metadata !176, metadata !DIExpression()), !dbg !227

  //   %4 = load atomic i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !129
  // LD: Guess
  old_cr = cr(0,0+3*1);
  cr(0,0+3*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l70_c13
  // Check
  ASSUME(active[cr(0,0+3*1)] == 0);
  ASSUME(cr(0,0+3*1) >= iw(0,0+3*1));
  ASSUME(cr(0,0+3*1) >= 0);
  ASSUME(cr(0,0+3*1) >= cdy[0]);
  ASSUME(cr(0,0+3*1) >= cisb[0]);
  ASSUME(cr(0,0+3*1) >= cdl[0]);
  ASSUME(cr(0,0+3*1) >= cl[0]);
  // Update
  creg_r14 = cr(0,0+3*1);
  crmax(0,0+3*1) = max(crmax(0,0+3*1),cr(0,0+3*1));
  caddr[0] = max(caddr[0],0);
  if(cr(0,0+3*1) < cw(0,0+3*1)) {
    r14 = buff(0,0+3*1);
    ASSUME((!(( (cw(0,0+3*1) < 1) && (1 < crmax(0,0+3*1)) )))||(sforbid(0+3*1,1)> 0));
    ASSUME((!(( (cw(0,0+3*1) < 2) && (2 < crmax(0,0+3*1)) )))||(sforbid(0+3*1,2)> 0));
    ASSUME((!(( (cw(0,0+3*1) < 3) && (3 < crmax(0,0+3*1)) )))||(sforbid(0+3*1,3)> 0));
    ASSUME((!(( (cw(0,0+3*1) < 4) && (4 < crmax(0,0+3*1)) )))||(sforbid(0+3*1,4)> 0));
    ASSUME((!(( (cw(0,0+3*1) < 5) && (5 < crmax(0,0+3*1)) )))||(sforbid(0+3*1,5)> 0));
    ASSUME((!(( (cw(0,0+3*1) < 6) && (6 < crmax(0,0+3*1)) )))||(sforbid(0+3*1,6)> 0));
    ASSUME((!(( (cw(0,0+3*1) < 7) && (7 < crmax(0,0+3*1)) )))||(sforbid(0+3*1,7)> 0));
    ASSUME((!(( (cw(0,0+3*1) < 8) && (8 < crmax(0,0+3*1)) )))||(sforbid(0+3*1,8)> 0));
    ASSUME((!(( (cw(0,0+3*1) < 9) && (9 < crmax(0,0+3*1)) )))||(sforbid(0+3*1,9)> 0));
  } else {
    if(pw(0,0+3*1) != co(0+3*1,cr(0,0+3*1))) {
      ASSUME(cr(0,0+3*1) >= old_cr);
    }
    pw(0,0+3*1) = co(0+3*1,cr(0,0+3*1));
    r14 = mem(0+3*1,cr(0,0+3*1));
  }
  ASSUME(creturn[0] >= cr(0,0+3*1));

  //   call void @llvm.dbg.value(metadata i64 %4, metadata !178, metadata !DIExpression()), !dbg !227

  //   %conv = trunc i64 %4 to i32, !dbg !130

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !175, metadata !DIExpression()), !dbg !198

  //   %cmp = icmp eq i32 %conv, 1, !dbg !131
  creg__r14__1_ = max(0,creg_r14);

  //   %conv18 = zext i1 %cmp to i32, !dbg !131

  //   call void @llvm.dbg.value(metadata i32 %conv18, metadata !179, metadata !DIExpression()), !dbg !198

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 0), metadata !181, metadata !DIExpression()), !dbg !231

  //   %5 = load atomic i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !133
  // LD: Guess
  old_cr = cr(0,0);
  cr(0,0) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l72_c13
  // Check
  ASSUME(active[cr(0,0)] == 0);
  ASSUME(cr(0,0) >= iw(0,0));
  ASSUME(cr(0,0) >= 0);
  ASSUME(cr(0,0) >= cdy[0]);
  ASSUME(cr(0,0) >= cisb[0]);
  ASSUME(cr(0,0) >= cdl[0]);
  ASSUME(cr(0,0) >= cl[0]);
  // Update
  creg_r15 = cr(0,0);
  crmax(0,0) = max(crmax(0,0),cr(0,0));
  caddr[0] = max(caddr[0],0);
  if(cr(0,0) < cw(0,0)) {
    r15 = buff(0,0);
    ASSUME((!(( (cw(0,0) < 1) && (1 < crmax(0,0)) )))||(sforbid(0,1)> 0));
    ASSUME((!(( (cw(0,0) < 2) && (2 < crmax(0,0)) )))||(sforbid(0,2)> 0));
    ASSUME((!(( (cw(0,0) < 3) && (3 < crmax(0,0)) )))||(sforbid(0,3)> 0));
    ASSUME((!(( (cw(0,0) < 4) && (4 < crmax(0,0)) )))||(sforbid(0,4)> 0));
    ASSUME((!(( (cw(0,0) < 5) && (5 < crmax(0,0)) )))||(sforbid(0,5)> 0));
    ASSUME((!(( (cw(0,0) < 6) && (6 < crmax(0,0)) )))||(sforbid(0,6)> 0));
    ASSUME((!(( (cw(0,0) < 7) && (7 < crmax(0,0)) )))||(sforbid(0,7)> 0));
    ASSUME((!(( (cw(0,0) < 8) && (8 < crmax(0,0)) )))||(sforbid(0,8)> 0));
    ASSUME((!(( (cw(0,0) < 9) && (9 < crmax(0,0)) )))||(sforbid(0,9)> 0));
  } else {
    if(pw(0,0) != co(0,cr(0,0))) {
      ASSUME(cr(0,0) >= old_cr);
    }
    pw(0,0) = co(0,cr(0,0));
    r15 = mem(0,cr(0,0));
  }
  ASSUME(creturn[0] >= cr(0,0));

  //   call void @llvm.dbg.value(metadata i64 %5, metadata !183, metadata !DIExpression()), !dbg !231

  //   %conv22 = trunc i64 %5 to i32, !dbg !134

  //   call void @llvm.dbg.value(metadata i32 %conv22, metadata !180, metadata !DIExpression()), !dbg !198

  //   %cmp23 = icmp eq i32 %conv22, 1, !dbg !135
  creg__r15__1_ = max(0,creg_r15);

  //   %conv24 = zext i1 %cmp23 to i32, !dbg !135

  //   call void @llvm.dbg.value(metadata i32 %conv24, metadata !184, metadata !DIExpression()), !dbg !198

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 1), metadata !186, metadata !DIExpression()), !dbg !235

  //   %6 = load atomic i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !137
  // LD: Guess
  old_cr = cr(0,0+1*1);
  cr(0,0+1*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l74_c13
  // Check
  ASSUME(active[cr(0,0+1*1)] == 0);
  ASSUME(cr(0,0+1*1) >= iw(0,0+1*1));
  ASSUME(cr(0,0+1*1) >= 0);
  ASSUME(cr(0,0+1*1) >= cdy[0]);
  ASSUME(cr(0,0+1*1) >= cisb[0]);
  ASSUME(cr(0,0+1*1) >= cdl[0]);
  ASSUME(cr(0,0+1*1) >= cl[0]);
  // Update
  creg_r16 = cr(0,0+1*1);
  crmax(0,0+1*1) = max(crmax(0,0+1*1),cr(0,0+1*1));
  caddr[0] = max(caddr[0],0);
  if(cr(0,0+1*1) < cw(0,0+1*1)) {
    r16 = buff(0,0+1*1);
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
    r16 = mem(0+1*1,cr(0,0+1*1));
  }
  ASSUME(creturn[0] >= cr(0,0+1*1));

  //   call void @llvm.dbg.value(metadata i64 %6, metadata !188, metadata !DIExpression()), !dbg !235

  //   %conv28 = trunc i64 %6 to i32, !dbg !138

  //   call void @llvm.dbg.value(metadata i32 %conv28, metadata !185, metadata !DIExpression()), !dbg !198

  //   %cmp29 = icmp eq i32 %conv28, 1, !dbg !139
  creg__r16__1_ = max(0,creg_r16);

  //   %conv30 = zext i1 %cmp29 to i32, !dbg !139

  //   call void @llvm.dbg.value(metadata i32 %conv30, metadata !189, metadata !DIExpression()), !dbg !198

  //   %7 = load i32, i32* @atom_1_X0_1, align 4, !dbg !140, !tbaa !141
  // LD: Guess
  old_cr = cr(0,5);
  cr(0,5) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l76_c13
  // Check
  ASSUME(active[cr(0,5)] == 0);
  ASSUME(cr(0,5) >= iw(0,5));
  ASSUME(cr(0,5) >= 0);
  ASSUME(cr(0,5) >= cdy[0]);
  ASSUME(cr(0,5) >= cisb[0]);
  ASSUME(cr(0,5) >= cdl[0]);
  ASSUME(cr(0,5) >= cl[0]);
  // Update
  creg_r17 = cr(0,5);
  crmax(0,5) = max(crmax(0,5),cr(0,5));
  caddr[0] = max(caddr[0],0);
  if(cr(0,5) < cw(0,5)) {
    r17 = buff(0,5);
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
    r17 = mem(5,cr(0,5));
  }
  ASSUME(creturn[0] >= cr(0,5));

  //   call void @llvm.dbg.value(metadata i32 %7, metadata !190, metadata !DIExpression()), !dbg !198

  //   %8 = load i32, i32* @atom_1_X7_1, align 4, !dbg !143, !tbaa !141
  // LD: Guess
  old_cr = cr(0,6);
  cr(0,6) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l77_c13
  // Check
  ASSUME(active[cr(0,6)] == 0);
  ASSUME(cr(0,6) >= iw(0,6));
  ASSUME(cr(0,6) >= 0);
  ASSUME(cr(0,6) >= cdy[0]);
  ASSUME(cr(0,6) >= cisb[0]);
  ASSUME(cr(0,6) >= cdl[0]);
  ASSUME(cr(0,6) >= cl[0]);
  // Update
  creg_r18 = cr(0,6);
  crmax(0,6) = max(crmax(0,6),cr(0,6));
  caddr[0] = max(caddr[0],0);
  if(cr(0,6) < cw(0,6)) {
    r18 = buff(0,6);
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
    r18 = mem(6,cr(0,6));
  }
  ASSUME(creturn[0] >= cr(0,6));

  //   call void @llvm.dbg.value(metadata i32 %8, metadata !191, metadata !DIExpression()), !dbg !198

  //   %9 = load i32, i32* @atom_1_X11_0, align 4, !dbg !144, !tbaa !141
  // LD: Guess
  old_cr = cr(0,7);
  cr(0,7) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l78_c13
  // Check
  ASSUME(active[cr(0,7)] == 0);
  ASSUME(cr(0,7) >= iw(0,7));
  ASSUME(cr(0,7) >= 0);
  ASSUME(cr(0,7) >= cdy[0]);
  ASSUME(cr(0,7) >= cisb[0]);
  ASSUME(cr(0,7) >= cdl[0]);
  ASSUME(cr(0,7) >= cl[0]);
  // Update
  creg_r19 = cr(0,7);
  crmax(0,7) = max(crmax(0,7),cr(0,7));
  caddr[0] = max(caddr[0],0);
  if(cr(0,7) < cw(0,7)) {
    r19 = buff(0,7);
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
    r19 = mem(7,cr(0,7));
  }
  ASSUME(creturn[0] >= cr(0,7));

  //   call void @llvm.dbg.value(metadata i32 %9, metadata !192, metadata !DIExpression()), !dbg !198

  //   %and = and i32 %8, %9, !dbg !145
  creg_r20 = max(creg_r18,creg_r19);
  r20 = r18 & r19;

  //   call void @llvm.dbg.value(metadata i32 %and, metadata !193, metadata !DIExpression()), !dbg !198

  //   %and31 = and i32 %7, %and, !dbg !146
  creg_r21 = max(creg_r17,creg_r20);
  r21 = r17 & r20;

  //   call void @llvm.dbg.value(metadata i32 %and31, metadata !194, metadata !DIExpression()), !dbg !198

  //   %and32 = and i32 %conv30, %and31, !dbg !147
  creg_r22 = max(creg__r16__1_,creg_r21);
  r22 = (r16==1) & r21;

  //   call void @llvm.dbg.value(metadata i32 %and32, metadata !195, metadata !DIExpression()), !dbg !198

  //   %and33 = and i32 %conv24, %and32, !dbg !148
  creg_r23 = max(creg__r15__1_,creg_r22);
  r23 = (r15==1) & r22;

  //   call void @llvm.dbg.value(metadata i32 %and33, metadata !196, metadata !DIExpression()), !dbg !198

  //   %and34 = and i32 %conv18, %and33, !dbg !149
  creg_r24 = max(creg__r14__1_,creg_r23);
  r24 = (r14==1) & r23;

  //   call void @llvm.dbg.value(metadata i32 %and34, metadata !197, metadata !DIExpression()), !dbg !198

  //   %cmp35 = icmp eq i32 %and34, 1, !dbg !150
  creg__r24__1_ = max(0,creg_r24);

  //   br i1 %cmp35, label %if.then, label %if.end, !dbg !152
  old_cctrl = cctrl[0];
  cctrl[0] = get_rng(0,NCONTEXT-1);
  ASSUME(cctrl[0] >= old_cctrl);
  ASSUME(cctrl[0] >= creg__r24__1_);
  if((r24==1)) {
    goto T0BLOCK1;
  } else {
    goto T0BLOCK2;
  }

T0BLOCK1:
  //   call void @__assert_fail(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([121 x i8], [121 x i8]* @.str.1, i64 0, i64 0), i32 noundef 84, i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #7, !dbg !153

  //   unreachable, !dbg !153
  r25 = 1;
  goto T0BLOCK_END;

T0BLOCK2:
  //   %10 = bitcast i64* %thr1 to i8*, !dbg !156

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %10) #6, !dbg !156

  //   %11 = bitcast i64* %thr0 to i8*, !dbg !156

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %11) #6, !dbg !156

  //   ret i32 0, !dbg !157
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

  ASSERT(r25== 0);

}