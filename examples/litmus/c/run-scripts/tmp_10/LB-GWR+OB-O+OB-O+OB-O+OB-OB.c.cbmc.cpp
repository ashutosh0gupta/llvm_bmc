// Global variabls:
// 7:atom_2_X0_1:1
// 0:vars:6
// 6:atom_1_X0_1:1
// 11:atom_5_X1_0:1
// 8:atom_3_X0_1:1
// 9:atom_4_X2_0:1
// 10:atom_4_X0_1:1
// Local global variabls:
// 0:thr0:1
// 1:thr1:1
// 2:thr2:1
// 3:thr3:1
// 4:thr4:1
// 5:thr5:1
#define ADDRSIZE 12
#define LOCALADDRSIZE 6
#define NTHREAD 7
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
  local_mem[4+0] = 0;
  local_mem[5+0] = 0;
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
  mem(7+0,0) = 0;
  mem(0+0,0) = 0;
  mem(0+1,0) = 0;
  mem(0+2,0) = 0;
  mem(0+3,0) = 0;
  mem(0+4,0) = 0;
  mem(0+5,0) = 0;
  mem(6+0,0) = 0;
  mem(11+0,0) = 0;
  mem(8+0,0) = 0;
  mem(9+0,0) = 0;
  mem(10+0,0) = 0;
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
  mem(10,5) = meminit(10,5);
  co(10,5) = coinit(10,5);
  delta(10,5) = deltainit(10,5);
  mem(10,6) = meminit(10,6);
  co(10,6) = coinit(10,6);
  delta(10,6) = deltainit(10,6);
  mem(10,7) = meminit(10,7);
  co(10,7) = coinit(10,7);
  delta(10,7) = deltainit(10,7);
  mem(10,8) = meminit(10,8);
  co(10,8) = coinit(10,8);
  delta(10,8) = deltainit(10,8);
  mem(10,9) = meminit(10,9);
  co(10,9) = coinit(10,9);
  delta(10,9) = deltainit(10,9);
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
  mem(11,5) = meminit(11,5);
  co(11,5) = coinit(11,5);
  delta(11,5) = deltainit(11,5);
  mem(11,6) = meminit(11,6);
  co(11,6) = coinit(11,6);
  delta(11,6) = deltainit(11,6);
  mem(11,7) = meminit(11,7);
  co(11,7) = coinit(11,7);
  delta(11,7) = deltainit(11,7);
  mem(11,8) = meminit(11,8);
  co(11,8) = coinit(11,8);
  delta(11,8) = deltainit(11,8);
  mem(11,9) = meminit(11,9);
  co(11,9) = coinit(11,9);
  delta(11,9) = deltainit(11,9);
  // Dumping thread 1
  int ret_thread_1 = 0;
  cdy[1] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[1] >= cstart[1]);
T1BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !44, metadata !DIExpression()), !dbg !53

  //   br label %label_1, !dbg !54
  goto T1BLOCK1;

T1BLOCK1:
  //   call void @llvm.dbg.label(metadata !52), !dbg !55

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 1), metadata !45, metadata !DIExpression()), !dbg !56

  //   call void @llvm.dbg.value(metadata i64 3, metadata !48, metadata !DIExpression()), !dbg !56

  //   store atomic i64 3, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !57
  // ST: Guess
  iw(1,0+1*1) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW _l24_c3
  old_cw = cw(1,0+1*1);
  cw(1,0+1*1) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM _l24_c3
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

  //   call void (...) @dmbsy(), !dbg !58
  // dumbsy: Guess
  old_cdy = cdy[1];
  cdy[1] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[1] >= old_cdy);
  ASSUME(cdy[1] >= cisb[1]);
  ASSUME(cdy[1] >= cdl[1]);
  ASSUME(cdy[1] >= cds[1]);
  ASSUME(cdy[1] >= cctrl[1]);
  ASSUME(cdy[1] >= cw(1,7+0));
  ASSUME(cdy[1] >= cw(1,0+0));
  ASSUME(cdy[1] >= cw(1,0+1));
  ASSUME(cdy[1] >= cw(1,0+2));
  ASSUME(cdy[1] >= cw(1,0+3));
  ASSUME(cdy[1] >= cw(1,0+4));
  ASSUME(cdy[1] >= cw(1,0+5));
  ASSUME(cdy[1] >= cw(1,6+0));
  ASSUME(cdy[1] >= cw(1,11+0));
  ASSUME(cdy[1] >= cw(1,8+0));
  ASSUME(cdy[1] >= cw(1,9+0));
  ASSUME(cdy[1] >= cw(1,10+0));
  ASSUME(cdy[1] >= cr(1,7+0));
  ASSUME(cdy[1] >= cr(1,0+0));
  ASSUME(cdy[1] >= cr(1,0+1));
  ASSUME(cdy[1] >= cr(1,0+2));
  ASSUME(cdy[1] >= cr(1,0+3));
  ASSUME(cdy[1] >= cr(1,0+4));
  ASSUME(cdy[1] >= cr(1,0+5));
  ASSUME(cdy[1] >= cr(1,6+0));
  ASSUME(cdy[1] >= cr(1,11+0));
  ASSUME(cdy[1] >= cr(1,8+0));
  ASSUME(cdy[1] >= cr(1,9+0));
  ASSUME(cdy[1] >= cr(1,10+0));
  ASSUME(creturn[1] >= cdy[1]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 0), metadata !49, metadata !DIExpression()), !dbg !59

  //   call void @llvm.dbg.value(metadata i64 1, metadata !51, metadata !DIExpression()), !dbg !59

  //   store atomic i64 1, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !60
  // ST: Guess
  iw(1,0) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW _l26_c3
  old_cw = cw(1,0);
  cw(1,0) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM _l26_c3
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

  //   ret i8* null, !dbg !61
  ret_thread_1 = (- 1);
  goto T1BLOCK_END;

T1BLOCK_END:

  // Dumping thread 2
  int ret_thread_2 = 0;
  cdy[2] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[2] >= cstart[2]);
T2BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !64, metadata !DIExpression()), !dbg !74

  //   br label %label_2, !dbg !56
  goto T2BLOCK1;

T2BLOCK1:
  //   call void @llvm.dbg.label(metadata !73), !dbg !76

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 0), metadata !66, metadata !DIExpression()), !dbg !77

  //   %0 = load atomic i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !59
  // LD: Guess
  old_cr = cr(2,0);
  cr(2,0) = get_rng(0,NCONTEXT-1);// 2 ASSIGN LDCOM _l32_c15
  // Check
  ASSUME(active[cr(2,0)] == 2);
  ASSUME(cr(2,0) >= iw(2,0));
  ASSUME(cr(2,0) >= 0);
  ASSUME(cr(2,0) >= cdy[2]);
  ASSUME(cr(2,0) >= cisb[2]);
  ASSUME(cr(2,0) >= cdl[2]);
  ASSUME(cr(2,0) >= cl[2]);
  // Update
  creg_r0 = cr(2,0);
  crmax(2,0) = max(crmax(2,0),cr(2,0));
  caddr[2] = max(caddr[2],0);
  if(cr(2,0) < cw(2,0)) {
    r0 = buff(2,0);
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
    r0 = mem(0,cr(2,0));
  }
  ASSUME(creturn[2] >= cr(2,0));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !68, metadata !DIExpression()), !dbg !77

  //   %conv = trunc i64 %0 to i32, !dbg !60

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !65, metadata !DIExpression()), !dbg !74

  //   call void (...) @dmbsy(), !dbg !61
  // dumbsy: Guess
  old_cdy = cdy[2];
  cdy[2] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[2] >= old_cdy);
  ASSUME(cdy[2] >= cisb[2]);
  ASSUME(cdy[2] >= cdl[2]);
  ASSUME(cdy[2] >= cds[2]);
  ASSUME(cdy[2] >= cctrl[2]);
  ASSUME(cdy[2] >= cw(2,7+0));
  ASSUME(cdy[2] >= cw(2,0+0));
  ASSUME(cdy[2] >= cw(2,0+1));
  ASSUME(cdy[2] >= cw(2,0+2));
  ASSUME(cdy[2] >= cw(2,0+3));
  ASSUME(cdy[2] >= cw(2,0+4));
  ASSUME(cdy[2] >= cw(2,0+5));
  ASSUME(cdy[2] >= cw(2,6+0));
  ASSUME(cdy[2] >= cw(2,11+0));
  ASSUME(cdy[2] >= cw(2,8+0));
  ASSUME(cdy[2] >= cw(2,9+0));
  ASSUME(cdy[2] >= cw(2,10+0));
  ASSUME(cdy[2] >= cr(2,7+0));
  ASSUME(cdy[2] >= cr(2,0+0));
  ASSUME(cdy[2] >= cr(2,0+1));
  ASSUME(cdy[2] >= cr(2,0+2));
  ASSUME(cdy[2] >= cr(2,0+3));
  ASSUME(cdy[2] >= cr(2,0+4));
  ASSUME(cdy[2] >= cr(2,0+5));
  ASSUME(cdy[2] >= cr(2,6+0));
  ASSUME(cdy[2] >= cr(2,11+0));
  ASSUME(cdy[2] >= cr(2,8+0));
  ASSUME(cdy[2] >= cr(2,9+0));
  ASSUME(cdy[2] >= cr(2,10+0));
  ASSUME(creturn[2] >= cdy[2]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 2), metadata !69, metadata !DIExpression()), !dbg !81

  //   call void @llvm.dbg.value(metadata i64 1, metadata !71, metadata !DIExpression()), !dbg !81

  //   store atomic i64 1, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 2) monotonic, align 8, !dbg !63
  // ST: Guess
  iw(2,0+2*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW _l34_c3
  old_cw = cw(2,0+2*1);
  cw(2,0+2*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM _l34_c3
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

  //   %cmp = icmp eq i32 %conv, 1, !dbg !64
  creg__r0__1_ = max(0,creg_r0);

  //   %conv1 = zext i1 %cmp to i32, !dbg !64

  //   call void @llvm.dbg.value(metadata i32 %conv1, metadata !72, metadata !DIExpression()), !dbg !74

  //   store i32 %conv1, i32* @atom_1_X0_1, align 4, !dbg !65, !tbaa !66
  // ST: Guess
  iw(2,6) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW _l36_c15
  old_cw = cw(2,6);
  cw(2,6) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM _l36_c15
  // Check
  ASSUME(active[iw(2,6)] == 2);
  ASSUME(active[cw(2,6)] == 2);
  ASSUME(sforbid(6,cw(2,6))== 0);
  ASSUME(iw(2,6) >= creg__r0__1_);
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
  buff(2,6) = (r0==1);
  mem(6,cw(2,6)) = (r0==1);
  co(6,cw(2,6))+=1;
  delta(6,cw(2,6)) = -1;
  ASSUME(creturn[2] >= cw(2,6));

  //   ret i8* null, !dbg !70
  ret_thread_2 = (- 1);
  goto T2BLOCK_END;

T2BLOCK_END:

  // Dumping thread 3
  int ret_thread_3 = 0;
  cdy[3] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[3] >= cstart[3]);
T3BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !92, metadata !DIExpression()), !dbg !102

  //   br label %label_3, !dbg !56
  goto T3BLOCK1;

T3BLOCK1:
  //   call void @llvm.dbg.label(metadata !101), !dbg !104

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 2), metadata !94, metadata !DIExpression()), !dbg !105

  //   %0 = load atomic i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 2) monotonic, align 8, !dbg !59
  // LD: Guess
  old_cr = cr(3,0+2*1);
  cr(3,0+2*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN LDCOM _l42_c15
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
    ASSUME((!(( (cw(3,0+2*1) < 1) && (1 < crmax(3,0+2*1)) )))||(sforbid(0+2*1,1)> 0));
    ASSUME((!(( (cw(3,0+2*1) < 2) && (2 < crmax(3,0+2*1)) )))||(sforbid(0+2*1,2)> 0));
    ASSUME((!(( (cw(3,0+2*1) < 3) && (3 < crmax(3,0+2*1)) )))||(sforbid(0+2*1,3)> 0));
    ASSUME((!(( (cw(3,0+2*1) < 4) && (4 < crmax(3,0+2*1)) )))||(sforbid(0+2*1,4)> 0));
    ASSUME((!(( (cw(3,0+2*1) < 5) && (5 < crmax(3,0+2*1)) )))||(sforbid(0+2*1,5)> 0));
    ASSUME((!(( (cw(3,0+2*1) < 6) && (6 < crmax(3,0+2*1)) )))||(sforbid(0+2*1,6)> 0));
    ASSUME((!(( (cw(3,0+2*1) < 7) && (7 < crmax(3,0+2*1)) )))||(sforbid(0+2*1,7)> 0));
    ASSUME((!(( (cw(3,0+2*1) < 8) && (8 < crmax(3,0+2*1)) )))||(sforbid(0+2*1,8)> 0));
    ASSUME((!(( (cw(3,0+2*1) < 9) && (9 < crmax(3,0+2*1)) )))||(sforbid(0+2*1,9)> 0));
  } else {
    if(pw(3,0+2*1) != co(0+2*1,cr(3,0+2*1))) {
      ASSUME(cr(3,0+2*1) >= old_cr);
    }
    pw(3,0+2*1) = co(0+2*1,cr(3,0+2*1));
    r1 = mem(0+2*1,cr(3,0+2*1));
  }
  ASSUME(creturn[3] >= cr(3,0+2*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !96, metadata !DIExpression()), !dbg !105

  //   %conv = trunc i64 %0 to i32, !dbg !60

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !93, metadata !DIExpression()), !dbg !102

  //   call void (...) @dmbsy(), !dbg !61
  // dumbsy: Guess
  old_cdy = cdy[3];
  cdy[3] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[3] >= old_cdy);
  ASSUME(cdy[3] >= cisb[3]);
  ASSUME(cdy[3] >= cdl[3]);
  ASSUME(cdy[3] >= cds[3]);
  ASSUME(cdy[3] >= cctrl[3]);
  ASSUME(cdy[3] >= cw(3,7+0));
  ASSUME(cdy[3] >= cw(3,0+0));
  ASSUME(cdy[3] >= cw(3,0+1));
  ASSUME(cdy[3] >= cw(3,0+2));
  ASSUME(cdy[3] >= cw(3,0+3));
  ASSUME(cdy[3] >= cw(3,0+4));
  ASSUME(cdy[3] >= cw(3,0+5));
  ASSUME(cdy[3] >= cw(3,6+0));
  ASSUME(cdy[3] >= cw(3,11+0));
  ASSUME(cdy[3] >= cw(3,8+0));
  ASSUME(cdy[3] >= cw(3,9+0));
  ASSUME(cdy[3] >= cw(3,10+0));
  ASSUME(cdy[3] >= cr(3,7+0));
  ASSUME(cdy[3] >= cr(3,0+0));
  ASSUME(cdy[3] >= cr(3,0+1));
  ASSUME(cdy[3] >= cr(3,0+2));
  ASSUME(cdy[3] >= cr(3,0+3));
  ASSUME(cdy[3] >= cr(3,0+4));
  ASSUME(cdy[3] >= cr(3,0+5));
  ASSUME(cdy[3] >= cr(3,6+0));
  ASSUME(cdy[3] >= cr(3,11+0));
  ASSUME(cdy[3] >= cr(3,8+0));
  ASSUME(cdy[3] >= cr(3,9+0));
  ASSUME(cdy[3] >= cr(3,10+0));
  ASSUME(creturn[3] >= cdy[3]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 3), metadata !97, metadata !DIExpression()), !dbg !109

  //   call void @llvm.dbg.value(metadata i64 1, metadata !99, metadata !DIExpression()), !dbg !109

  //   store atomic i64 1, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !63
  // ST: Guess
  iw(3,0+3*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STIW _l44_c3
  old_cw = cw(3,0+3*1);
  cw(3,0+3*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STCOM _l44_c3
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

  //   %cmp = icmp eq i32 %conv, 1, !dbg !64
  creg__r1__1_ = max(0,creg_r1);

  //   %conv1 = zext i1 %cmp to i32, !dbg !64

  //   call void @llvm.dbg.value(metadata i32 %conv1, metadata !100, metadata !DIExpression()), !dbg !102

  //   store i32 %conv1, i32* @atom_2_X0_1, align 4, !dbg !65, !tbaa !66
  // ST: Guess
  iw(3,7) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STIW _l46_c15
  old_cw = cw(3,7);
  cw(3,7) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STCOM _l46_c15
  // Check
  ASSUME(active[iw(3,7)] == 3);
  ASSUME(active[cw(3,7)] == 3);
  ASSUME(sforbid(7,cw(3,7))== 0);
  ASSUME(iw(3,7) >= creg__r1__1_);
  ASSUME(iw(3,7) >= 0);
  ASSUME(cw(3,7) >= iw(3,7));
  ASSUME(cw(3,7) >= old_cw);
  ASSUME(cw(3,7) >= cr(3,7));
  ASSUME(cw(3,7) >= cl[3]);
  ASSUME(cw(3,7) >= cisb[3]);
  ASSUME(cw(3,7) >= cdy[3]);
  ASSUME(cw(3,7) >= cdl[3]);
  ASSUME(cw(3,7) >= cds[3]);
  ASSUME(cw(3,7) >= cctrl[3]);
  ASSUME(cw(3,7) >= caddr[3]);
  // Update
  caddr[3] = max(caddr[3],0);
  buff(3,7) = (r1==1);
  mem(7,cw(3,7)) = (r1==1);
  co(7,cw(3,7))+=1;
  delta(7,cw(3,7)) = -1;
  ASSUME(creturn[3] >= cw(3,7));

  //   ret i8* null, !dbg !70
  ret_thread_3 = (- 1);
  goto T3BLOCK_END;

T3BLOCK_END:

  // Dumping thread 4
  int ret_thread_4 = 0;
  cdy[4] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[4] >= cstart[4]);
T4BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !116, metadata !DIExpression()), !dbg !126

  //   br label %label_4, !dbg !56
  goto T4BLOCK1;

T4BLOCK1:
  //   call void @llvm.dbg.label(metadata !125), !dbg !128

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 3), metadata !118, metadata !DIExpression()), !dbg !129

  //   %0 = load atomic i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !59
  // LD: Guess
  old_cr = cr(4,0+3*1);
  cr(4,0+3*1) = get_rng(0,NCONTEXT-1);// 4 ASSIGN LDCOM _l52_c15
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
    ASSUME((!(( (cw(4,0+3*1) < 1) && (1 < crmax(4,0+3*1)) )))||(sforbid(0+3*1,1)> 0));
    ASSUME((!(( (cw(4,0+3*1) < 2) && (2 < crmax(4,0+3*1)) )))||(sforbid(0+3*1,2)> 0));
    ASSUME((!(( (cw(4,0+3*1) < 3) && (3 < crmax(4,0+3*1)) )))||(sforbid(0+3*1,3)> 0));
    ASSUME((!(( (cw(4,0+3*1) < 4) && (4 < crmax(4,0+3*1)) )))||(sforbid(0+3*1,4)> 0));
    ASSUME((!(( (cw(4,0+3*1) < 5) && (5 < crmax(4,0+3*1)) )))||(sforbid(0+3*1,5)> 0));
    ASSUME((!(( (cw(4,0+3*1) < 6) && (6 < crmax(4,0+3*1)) )))||(sforbid(0+3*1,6)> 0));
    ASSUME((!(( (cw(4,0+3*1) < 7) && (7 < crmax(4,0+3*1)) )))||(sforbid(0+3*1,7)> 0));
    ASSUME((!(( (cw(4,0+3*1) < 8) && (8 < crmax(4,0+3*1)) )))||(sforbid(0+3*1,8)> 0));
    ASSUME((!(( (cw(4,0+3*1) < 9) && (9 < crmax(4,0+3*1)) )))||(sforbid(0+3*1,9)> 0));
  } else {
    if(pw(4,0+3*1) != co(0+3*1,cr(4,0+3*1))) {
      ASSUME(cr(4,0+3*1) >= old_cr);
    }
    pw(4,0+3*1) = co(0+3*1,cr(4,0+3*1));
    r2 = mem(0+3*1,cr(4,0+3*1));
  }
  ASSUME(creturn[4] >= cr(4,0+3*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !120, metadata !DIExpression()), !dbg !129

  //   %conv = trunc i64 %0 to i32, !dbg !60

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !117, metadata !DIExpression()), !dbg !126

  //   call void (...) @dmbsy(), !dbg !61
  // dumbsy: Guess
  old_cdy = cdy[4];
  cdy[4] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[4] >= old_cdy);
  ASSUME(cdy[4] >= cisb[4]);
  ASSUME(cdy[4] >= cdl[4]);
  ASSUME(cdy[4] >= cds[4]);
  ASSUME(cdy[4] >= cctrl[4]);
  ASSUME(cdy[4] >= cw(4,7+0));
  ASSUME(cdy[4] >= cw(4,0+0));
  ASSUME(cdy[4] >= cw(4,0+1));
  ASSUME(cdy[4] >= cw(4,0+2));
  ASSUME(cdy[4] >= cw(4,0+3));
  ASSUME(cdy[4] >= cw(4,0+4));
  ASSUME(cdy[4] >= cw(4,0+5));
  ASSUME(cdy[4] >= cw(4,6+0));
  ASSUME(cdy[4] >= cw(4,11+0));
  ASSUME(cdy[4] >= cw(4,8+0));
  ASSUME(cdy[4] >= cw(4,9+0));
  ASSUME(cdy[4] >= cw(4,10+0));
  ASSUME(cdy[4] >= cr(4,7+0));
  ASSUME(cdy[4] >= cr(4,0+0));
  ASSUME(cdy[4] >= cr(4,0+1));
  ASSUME(cdy[4] >= cr(4,0+2));
  ASSUME(cdy[4] >= cr(4,0+3));
  ASSUME(cdy[4] >= cr(4,0+4));
  ASSUME(cdy[4] >= cr(4,0+5));
  ASSUME(cdy[4] >= cr(4,6+0));
  ASSUME(cdy[4] >= cr(4,11+0));
  ASSUME(cdy[4] >= cr(4,8+0));
  ASSUME(cdy[4] >= cr(4,9+0));
  ASSUME(cdy[4] >= cr(4,10+0));
  ASSUME(creturn[4] >= cdy[4]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 4), metadata !121, metadata !DIExpression()), !dbg !133

  //   call void @llvm.dbg.value(metadata i64 1, metadata !123, metadata !DIExpression()), !dbg !133

  //   store atomic i64 1, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 4) monotonic, align 8, !dbg !63
  // ST: Guess
  iw(4,0+4*1) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STIW _l54_c3
  old_cw = cw(4,0+4*1);
  cw(4,0+4*1) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STCOM _l54_c3
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

  //   %cmp = icmp eq i32 %conv, 1, !dbg !64
  creg__r2__1_ = max(0,creg_r2);

  //   %conv1 = zext i1 %cmp to i32, !dbg !64

  //   call void @llvm.dbg.value(metadata i32 %conv1, metadata !124, metadata !DIExpression()), !dbg !126

  //   store i32 %conv1, i32* @atom_3_X0_1, align 4, !dbg !65, !tbaa !66
  // ST: Guess
  iw(4,8) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STIW _l56_c15
  old_cw = cw(4,8);
  cw(4,8) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STCOM _l56_c15
  // Check
  ASSUME(active[iw(4,8)] == 4);
  ASSUME(active[cw(4,8)] == 4);
  ASSUME(sforbid(8,cw(4,8))== 0);
  ASSUME(iw(4,8) >= creg__r2__1_);
  ASSUME(iw(4,8) >= 0);
  ASSUME(cw(4,8) >= iw(4,8));
  ASSUME(cw(4,8) >= old_cw);
  ASSUME(cw(4,8) >= cr(4,8));
  ASSUME(cw(4,8) >= cl[4]);
  ASSUME(cw(4,8) >= cisb[4]);
  ASSUME(cw(4,8) >= cdy[4]);
  ASSUME(cw(4,8) >= cdl[4]);
  ASSUME(cw(4,8) >= cds[4]);
  ASSUME(cw(4,8) >= cctrl[4]);
  ASSUME(cw(4,8) >= caddr[4]);
  // Update
  caddr[4] = max(caddr[4],0);
  buff(4,8) = (r2==1);
  mem(8,cw(4,8)) = (r2==1);
  co(8,cw(4,8))+=1;
  delta(8,cw(4,8)) = -1;
  ASSUME(creturn[4] >= cw(4,8));

  //   ret i8* null, !dbg !70
  ret_thread_4 = (- 1);
  goto T4BLOCK_END;

T4BLOCK_END:

  // Dumping thread 5
  int ret_thread_5 = 0;
  cdy[5] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[5] >= cstart[5]);
T5BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !140, metadata !DIExpression()), !dbg !152

  //   br label %label_5, !dbg !58
  goto T5BLOCK1;

T5BLOCK1:
  //   call void @llvm.dbg.label(metadata !151), !dbg !154

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 4), metadata !142, metadata !DIExpression()), !dbg !155

  //   %0 = load atomic i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 4) monotonic, align 8, !dbg !61
  // LD: Guess
  old_cr = cr(5,0+4*1);
  cr(5,0+4*1) = get_rng(0,NCONTEXT-1);// 5 ASSIGN LDCOM _l62_c16
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
    ASSUME((!(( (cw(5,0+4*1) < 1) && (1 < crmax(5,0+4*1)) )))||(sforbid(0+4*1,1)> 0));
    ASSUME((!(( (cw(5,0+4*1) < 2) && (2 < crmax(5,0+4*1)) )))||(sforbid(0+4*1,2)> 0));
    ASSUME((!(( (cw(5,0+4*1) < 3) && (3 < crmax(5,0+4*1)) )))||(sforbid(0+4*1,3)> 0));
    ASSUME((!(( (cw(5,0+4*1) < 4) && (4 < crmax(5,0+4*1)) )))||(sforbid(0+4*1,4)> 0));
    ASSUME((!(( (cw(5,0+4*1) < 5) && (5 < crmax(5,0+4*1)) )))||(sforbid(0+4*1,5)> 0));
    ASSUME((!(( (cw(5,0+4*1) < 6) && (6 < crmax(5,0+4*1)) )))||(sforbid(0+4*1,6)> 0));
    ASSUME((!(( (cw(5,0+4*1) < 7) && (7 < crmax(5,0+4*1)) )))||(sforbid(0+4*1,7)> 0));
    ASSUME((!(( (cw(5,0+4*1) < 8) && (8 < crmax(5,0+4*1)) )))||(sforbid(0+4*1,8)> 0));
    ASSUME((!(( (cw(5,0+4*1) < 9) && (9 < crmax(5,0+4*1)) )))||(sforbid(0+4*1,9)> 0));
  } else {
    if(pw(5,0+4*1) != co(0+4*1,cr(5,0+4*1))) {
      ASSUME(cr(5,0+4*1) >= old_cr);
    }
    pw(5,0+4*1) = co(0+4*1,cr(5,0+4*1));
    r3 = mem(0+4*1,cr(5,0+4*1));
  }
  ASSUME(creturn[5] >= cr(5,0+4*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !144, metadata !DIExpression()), !dbg !155

  //   %conv = trunc i64 %0 to i32, !dbg !62

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !141, metadata !DIExpression()), !dbg !152

  //   call void (...) @dmbsy(), !dbg !63
  // dumbsy: Guess
  old_cdy = cdy[5];
  cdy[5] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[5] >= old_cdy);
  ASSUME(cdy[5] >= cisb[5]);
  ASSUME(cdy[5] >= cdl[5]);
  ASSUME(cdy[5] >= cds[5]);
  ASSUME(cdy[5] >= cctrl[5]);
  ASSUME(cdy[5] >= cw(5,7+0));
  ASSUME(cdy[5] >= cw(5,0+0));
  ASSUME(cdy[5] >= cw(5,0+1));
  ASSUME(cdy[5] >= cw(5,0+2));
  ASSUME(cdy[5] >= cw(5,0+3));
  ASSUME(cdy[5] >= cw(5,0+4));
  ASSUME(cdy[5] >= cw(5,0+5));
  ASSUME(cdy[5] >= cw(5,6+0));
  ASSUME(cdy[5] >= cw(5,11+0));
  ASSUME(cdy[5] >= cw(5,8+0));
  ASSUME(cdy[5] >= cw(5,9+0));
  ASSUME(cdy[5] >= cw(5,10+0));
  ASSUME(cdy[5] >= cr(5,7+0));
  ASSUME(cdy[5] >= cr(5,0+0));
  ASSUME(cdy[5] >= cr(5,0+1));
  ASSUME(cdy[5] >= cr(5,0+2));
  ASSUME(cdy[5] >= cr(5,0+3));
  ASSUME(cdy[5] >= cr(5,0+4));
  ASSUME(cdy[5] >= cr(5,0+5));
  ASSUME(cdy[5] >= cr(5,6+0));
  ASSUME(cdy[5] >= cr(5,11+0));
  ASSUME(cdy[5] >= cr(5,8+0));
  ASSUME(cdy[5] >= cr(5,9+0));
  ASSUME(cdy[5] >= cr(5,10+0));
  ASSUME(creturn[5] >= cdy[5]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 5), metadata !146, metadata !DIExpression()), !dbg !159

  //   %1 = load atomic i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 5) monotonic, align 8, !dbg !65
  // LD: Guess
  old_cr = cr(5,0+5*1);
  cr(5,0+5*1) = get_rng(0,NCONTEXT-1);// 5 ASSIGN LDCOM _l64_c16
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
    ASSUME((!(( (cw(5,0+5*1) < 1) && (1 < crmax(5,0+5*1)) )))||(sforbid(0+5*1,1)> 0));
    ASSUME((!(( (cw(5,0+5*1) < 2) && (2 < crmax(5,0+5*1)) )))||(sforbid(0+5*1,2)> 0));
    ASSUME((!(( (cw(5,0+5*1) < 3) && (3 < crmax(5,0+5*1)) )))||(sforbid(0+5*1,3)> 0));
    ASSUME((!(( (cw(5,0+5*1) < 4) && (4 < crmax(5,0+5*1)) )))||(sforbid(0+5*1,4)> 0));
    ASSUME((!(( (cw(5,0+5*1) < 5) && (5 < crmax(5,0+5*1)) )))||(sforbid(0+5*1,5)> 0));
    ASSUME((!(( (cw(5,0+5*1) < 6) && (6 < crmax(5,0+5*1)) )))||(sforbid(0+5*1,6)> 0));
    ASSUME((!(( (cw(5,0+5*1) < 7) && (7 < crmax(5,0+5*1)) )))||(sforbid(0+5*1,7)> 0));
    ASSUME((!(( (cw(5,0+5*1) < 8) && (8 < crmax(5,0+5*1)) )))||(sforbid(0+5*1,8)> 0));
    ASSUME((!(( (cw(5,0+5*1) < 9) && (9 < crmax(5,0+5*1)) )))||(sforbid(0+5*1,9)> 0));
  } else {
    if(pw(5,0+5*1) != co(0+5*1,cr(5,0+5*1))) {
      ASSUME(cr(5,0+5*1) >= old_cr);
    }
    pw(5,0+5*1) = co(0+5*1,cr(5,0+5*1));
    r4 = mem(0+5*1,cr(5,0+5*1));
  }
  ASSUME(creturn[5] >= cr(5,0+5*1));

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !148, metadata !DIExpression()), !dbg !159

  //   %conv4 = trunc i64 %1 to i32, !dbg !66

  //   call void @llvm.dbg.value(metadata i32 %conv4, metadata !145, metadata !DIExpression()), !dbg !152

  //   %cmp = icmp eq i32 %conv4, 0, !dbg !67
  creg__r4__0_ = max(0,creg_r4);

  //   %conv5 = zext i1 %cmp to i32, !dbg !67

  //   call void @llvm.dbg.value(metadata i32 %conv5, metadata !149, metadata !DIExpression()), !dbg !152

  //   store i32 %conv5, i32* @atom_4_X2_0, align 4, !dbg !68, !tbaa !69
  // ST: Guess
  iw(5,9) = get_rng(0,NCONTEXT-1);// 5 ASSIGN STIW _l66_c15
  old_cw = cw(5,9);
  cw(5,9) = get_rng(0,NCONTEXT-1);// 5 ASSIGN STCOM _l66_c15
  // Check
  ASSUME(active[iw(5,9)] == 5);
  ASSUME(active[cw(5,9)] == 5);
  ASSUME(sforbid(9,cw(5,9))== 0);
  ASSUME(iw(5,9) >= creg__r4__0_);
  ASSUME(iw(5,9) >= 0);
  ASSUME(cw(5,9) >= iw(5,9));
  ASSUME(cw(5,9) >= old_cw);
  ASSUME(cw(5,9) >= cr(5,9));
  ASSUME(cw(5,9) >= cl[5]);
  ASSUME(cw(5,9) >= cisb[5]);
  ASSUME(cw(5,9) >= cdy[5]);
  ASSUME(cw(5,9) >= cdl[5]);
  ASSUME(cw(5,9) >= cds[5]);
  ASSUME(cw(5,9) >= cctrl[5]);
  ASSUME(cw(5,9) >= caddr[5]);
  // Update
  caddr[5] = max(caddr[5],0);
  buff(5,9) = (r4==0);
  mem(9,cw(5,9)) = (r4==0);
  co(9,cw(5,9))+=1;
  delta(9,cw(5,9)) = -1;
  ASSUME(creturn[5] >= cw(5,9));

  //   %cmp6 = icmp eq i32 %conv, 1, !dbg !73
  creg__r3__1_ = max(0,creg_r3);

  //   %conv7 = zext i1 %cmp6 to i32, !dbg !73

  //   call void @llvm.dbg.value(metadata i32 %conv7, metadata !150, metadata !DIExpression()), !dbg !152

  //   store i32 %conv7, i32* @atom_4_X0_1, align 4, !dbg !74, !tbaa !69
  // ST: Guess
  iw(5,10) = get_rng(0,NCONTEXT-1);// 5 ASSIGN STIW _l68_c15
  old_cw = cw(5,10);
  cw(5,10) = get_rng(0,NCONTEXT-1);// 5 ASSIGN STCOM _l68_c15
  // Check
  ASSUME(active[iw(5,10)] == 5);
  ASSUME(active[cw(5,10)] == 5);
  ASSUME(sforbid(10,cw(5,10))== 0);
  ASSUME(iw(5,10) >= creg__r3__1_);
  ASSUME(iw(5,10) >= 0);
  ASSUME(cw(5,10) >= iw(5,10));
  ASSUME(cw(5,10) >= old_cw);
  ASSUME(cw(5,10) >= cr(5,10));
  ASSUME(cw(5,10) >= cl[5]);
  ASSUME(cw(5,10) >= cisb[5]);
  ASSUME(cw(5,10) >= cdy[5]);
  ASSUME(cw(5,10) >= cdl[5]);
  ASSUME(cw(5,10) >= cds[5]);
  ASSUME(cw(5,10) >= cctrl[5]);
  ASSUME(cw(5,10) >= caddr[5]);
  // Update
  caddr[5] = max(caddr[5],0);
  buff(5,10) = (r3==1);
  mem(10,cw(5,10)) = (r3==1);
  co(10,cw(5,10))+=1;
  delta(10,cw(5,10)) = -1;
  ASSUME(creturn[5] >= cw(5,10));

  //   ret i8* null, !dbg !75
  ret_thread_5 = (- 1);
  goto T5BLOCK_END;

T5BLOCK_END:

  // Dumping thread 6
  int ret_thread_6 = 0;
  cdy[6] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[6] >= cstart[6]);
T6BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !169, metadata !DIExpression()), !dbg !179

  //   br label %label_6, !dbg !56
  goto T6BLOCK1;

T6BLOCK1:
  //   call void @llvm.dbg.label(metadata !178), !dbg !181

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 5), metadata !170, metadata !DIExpression()), !dbg !182

  //   call void @llvm.dbg.value(metadata i64 1, metadata !172, metadata !DIExpression()), !dbg !182

  //   store atomic i64 1, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 5) monotonic, align 8, !dbg !59
  // ST: Guess
  iw(6,0+5*1) = get_rng(0,NCONTEXT-1);// 6 ASSIGN STIW _l74_c3
  old_cw = cw(6,0+5*1);
  cw(6,0+5*1) = get_rng(0,NCONTEXT-1);// 6 ASSIGN STCOM _l74_c3
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

  //   call void (...) @dmbsy(), !dbg !60
  // dumbsy: Guess
  old_cdy = cdy[6];
  cdy[6] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[6] >= old_cdy);
  ASSUME(cdy[6] >= cisb[6]);
  ASSUME(cdy[6] >= cdl[6]);
  ASSUME(cdy[6] >= cds[6]);
  ASSUME(cdy[6] >= cctrl[6]);
  ASSUME(cdy[6] >= cw(6,7+0));
  ASSUME(cdy[6] >= cw(6,0+0));
  ASSUME(cdy[6] >= cw(6,0+1));
  ASSUME(cdy[6] >= cw(6,0+2));
  ASSUME(cdy[6] >= cw(6,0+3));
  ASSUME(cdy[6] >= cw(6,0+4));
  ASSUME(cdy[6] >= cw(6,0+5));
  ASSUME(cdy[6] >= cw(6,6+0));
  ASSUME(cdy[6] >= cw(6,11+0));
  ASSUME(cdy[6] >= cw(6,8+0));
  ASSUME(cdy[6] >= cw(6,9+0));
  ASSUME(cdy[6] >= cw(6,10+0));
  ASSUME(cdy[6] >= cr(6,7+0));
  ASSUME(cdy[6] >= cr(6,0+0));
  ASSUME(cdy[6] >= cr(6,0+1));
  ASSUME(cdy[6] >= cr(6,0+2));
  ASSUME(cdy[6] >= cr(6,0+3));
  ASSUME(cdy[6] >= cr(6,0+4));
  ASSUME(cdy[6] >= cr(6,0+5));
  ASSUME(cdy[6] >= cr(6,6+0));
  ASSUME(cdy[6] >= cr(6,11+0));
  ASSUME(cdy[6] >= cr(6,8+0));
  ASSUME(cdy[6] >= cr(6,9+0));
  ASSUME(cdy[6] >= cr(6,10+0));
  ASSUME(creturn[6] >= cdy[6]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 1), metadata !174, metadata !DIExpression()), !dbg !185

  //   %0 = load atomic i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !62
  // LD: Guess
  old_cr = cr(6,0+1*1);
  cr(6,0+1*1) = get_rng(0,NCONTEXT-1);// 6 ASSIGN LDCOM _l76_c16
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
    ASSUME((!(( (cw(6,0+1*1) < 1) && (1 < crmax(6,0+1*1)) )))||(sforbid(0+1*1,1)> 0));
    ASSUME((!(( (cw(6,0+1*1) < 2) && (2 < crmax(6,0+1*1)) )))||(sforbid(0+1*1,2)> 0));
    ASSUME((!(( (cw(6,0+1*1) < 3) && (3 < crmax(6,0+1*1)) )))||(sforbid(0+1*1,3)> 0));
    ASSUME((!(( (cw(6,0+1*1) < 4) && (4 < crmax(6,0+1*1)) )))||(sforbid(0+1*1,4)> 0));
    ASSUME((!(( (cw(6,0+1*1) < 5) && (5 < crmax(6,0+1*1)) )))||(sforbid(0+1*1,5)> 0));
    ASSUME((!(( (cw(6,0+1*1) < 6) && (6 < crmax(6,0+1*1)) )))||(sforbid(0+1*1,6)> 0));
    ASSUME((!(( (cw(6,0+1*1) < 7) && (7 < crmax(6,0+1*1)) )))||(sforbid(0+1*1,7)> 0));
    ASSUME((!(( (cw(6,0+1*1) < 8) && (8 < crmax(6,0+1*1)) )))||(sforbid(0+1*1,8)> 0));
    ASSUME((!(( (cw(6,0+1*1) < 9) && (9 < crmax(6,0+1*1)) )))||(sforbid(0+1*1,9)> 0));
  } else {
    if(pw(6,0+1*1) != co(0+1*1,cr(6,0+1*1))) {
      ASSUME(cr(6,0+1*1) >= old_cr);
    }
    pw(6,0+1*1) = co(0+1*1,cr(6,0+1*1));
    r5 = mem(0+1*1,cr(6,0+1*1));
  }
  ASSUME(creturn[6] >= cr(6,0+1*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !176, metadata !DIExpression()), !dbg !185

  //   %conv = trunc i64 %0 to i32, !dbg !63

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !173, metadata !DIExpression()), !dbg !179

  //   %cmp = icmp eq i32 %conv, 0, !dbg !64
  creg__r5__0_ = max(0,creg_r5);

  //   %conv1 = zext i1 %cmp to i32, !dbg !64

  //   call void @llvm.dbg.value(metadata i32 %conv1, metadata !177, metadata !DIExpression()), !dbg !179

  //   store i32 %conv1, i32* @atom_5_X1_0, align 4, !dbg !65, !tbaa !66
  // ST: Guess
  iw(6,11) = get_rng(0,NCONTEXT-1);// 6 ASSIGN STIW _l78_c15
  old_cw = cw(6,11);
  cw(6,11) = get_rng(0,NCONTEXT-1);// 6 ASSIGN STCOM _l78_c15
  // Check
  ASSUME(active[iw(6,11)] == 6);
  ASSUME(active[cw(6,11)] == 6);
  ASSUME(sforbid(11,cw(6,11))== 0);
  ASSUME(iw(6,11) >= creg__r5__0_);
  ASSUME(iw(6,11) >= 0);
  ASSUME(cw(6,11) >= iw(6,11));
  ASSUME(cw(6,11) >= old_cw);
  ASSUME(cw(6,11) >= cr(6,11));
  ASSUME(cw(6,11) >= cl[6]);
  ASSUME(cw(6,11) >= cisb[6]);
  ASSUME(cw(6,11) >= cdy[6]);
  ASSUME(cw(6,11) >= cdl[6]);
  ASSUME(cw(6,11) >= cds[6]);
  ASSUME(cw(6,11) >= cctrl[6]);
  ASSUME(cw(6,11) >= caddr[6]);
  // Update
  caddr[6] = max(caddr[6],0);
  buff(6,11) = (r5==0);
  mem(11,cw(6,11)) = (r5==0);
  co(11,cw(6,11))+=1;
  delta(11,cw(6,11)) = -1;
  ASSUME(creturn[6] >= cw(6,11));

  //   ret i8* null, !dbg !70
  ret_thread_6 = (- 1);
  goto T6BLOCK_END;

T6BLOCK_END:

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

  //   call void @llvm.dbg.value(metadata i32 %argc, metadata !198, metadata !DIExpression()), !dbg !257

  //   call void @llvm.dbg.value(metadata i8** %argv, metadata !199, metadata !DIExpression()), !dbg !257

  //   %0 = bitcast i64* %thr0 to i8*, !dbg !108

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #6, !dbg !108

  //   call void @llvm.dbg.declare(metadata i64* %thr0, metadata !200, metadata !DIExpression()), !dbg !259

  //   %1 = bitcast i64* %thr1 to i8*, !dbg !110

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #6, !dbg !110

  //   call void @llvm.dbg.declare(metadata i64* %thr1, metadata !204, metadata !DIExpression()), !dbg !261

  //   %2 = bitcast i64* %thr2 to i8*, !dbg !112

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #6, !dbg !112

  //   call void @llvm.dbg.declare(metadata i64* %thr2, metadata !205, metadata !DIExpression()), !dbg !263

  //   %3 = bitcast i64* %thr3 to i8*, !dbg !114

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #6, !dbg !114

  //   call void @llvm.dbg.declare(metadata i64* %thr3, metadata !206, metadata !DIExpression()), !dbg !265

  //   %4 = bitcast i64* %thr4 to i8*, !dbg !116

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #6, !dbg !116

  //   call void @llvm.dbg.declare(metadata i64* %thr4, metadata !207, metadata !DIExpression()), !dbg !267

  //   %5 = bitcast i64* %thr5 to i8*, !dbg !118

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %5) #6, !dbg !118

  //   call void @llvm.dbg.declare(metadata i64* %thr5, metadata !208, metadata !DIExpression()), !dbg !269

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 5), metadata !209, metadata !DIExpression()), !dbg !270

  //   call void @llvm.dbg.value(metadata i64 0, metadata !211, metadata !DIExpression()), !dbg !270

  //   store atomic i64 0, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 5) monotonic, align 8, !dbg !121
  // ST: Guess
  iw(0,0+5*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l90_c3
  old_cw = cw(0,0+5*1);
  cw(0,0+5*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l90_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 4), metadata !212, metadata !DIExpression()), !dbg !272

  //   call void @llvm.dbg.value(metadata i64 0, metadata !214, metadata !DIExpression()), !dbg !272

  //   store atomic i64 0, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 4) monotonic, align 8, !dbg !123
  // ST: Guess
  iw(0,0+4*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l91_c3
  old_cw = cw(0,0+4*1);
  cw(0,0+4*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l91_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 3), metadata !215, metadata !DIExpression()), !dbg !274

  //   call void @llvm.dbg.value(metadata i64 0, metadata !217, metadata !DIExpression()), !dbg !274

  //   store atomic i64 0, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !125
  // ST: Guess
  iw(0,0+3*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l92_c3
  old_cw = cw(0,0+3*1);
  cw(0,0+3*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l92_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 2), metadata !218, metadata !DIExpression()), !dbg !276

  //   call void @llvm.dbg.value(metadata i64 0, metadata !220, metadata !DIExpression()), !dbg !276

  //   store atomic i64 0, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 2) monotonic, align 8, !dbg !127
  // ST: Guess
  iw(0,0+2*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l93_c3
  old_cw = cw(0,0+2*1);
  cw(0,0+2*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l93_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 1), metadata !221, metadata !DIExpression()), !dbg !278

  //   call void @llvm.dbg.value(metadata i64 0, metadata !223, metadata !DIExpression()), !dbg !278

  //   store atomic i64 0, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !129
  // ST: Guess
  iw(0,0+1*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l94_c3
  old_cw = cw(0,0+1*1);
  cw(0,0+1*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l94_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 0), metadata !224, metadata !DIExpression()), !dbg !280

  //   call void @llvm.dbg.value(metadata i64 0, metadata !226, metadata !DIExpression()), !dbg !280

  //   store atomic i64 0, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !131
  // ST: Guess
  iw(0,0) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l95_c3
  old_cw = cw(0,0);
  cw(0,0) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l95_c3
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

  //   call void @llvm.dbg.value(metadata i32* @atom_4_X2_0, metadata !227, metadata !DIExpression()), !dbg !282

  //   call void @llvm.dbg.value(metadata i32 0, metadata !230, metadata !DIExpression()), !dbg !282

  //   store atomic i32 0, i32* @atom_4_X2_0 monotonic, align 4, !dbg !133
  // ST: Guess
  iw(0,9) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l96_c3
  old_cw = cw(0,9);
  cw(0,9) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l96_c3
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

  //   call void @llvm.dbg.value(metadata i32* @atom_5_X1_0, metadata !231, metadata !DIExpression()), !dbg !284

  //   call void @llvm.dbg.value(metadata i32 0, metadata !233, metadata !DIExpression()), !dbg !284

  //   store atomic i32 0, i32* @atom_5_X1_0 monotonic, align 4, !dbg !135
  // ST: Guess
  iw(0,11) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l97_c3
  old_cw = cw(0,11);
  cw(0,11) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l97_c3
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

  //   call void @llvm.dbg.value(metadata i32* @atom_1_X0_1, metadata !234, metadata !DIExpression()), !dbg !286

  //   call void @llvm.dbg.value(metadata i32 0, metadata !236, metadata !DIExpression()), !dbg !286

  //   store atomic i32 0, i32* @atom_1_X0_1 monotonic, align 4, !dbg !137
  // ST: Guess
  iw(0,6) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l98_c3
  old_cw = cw(0,6);
  cw(0,6) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l98_c3
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

  //   call void @llvm.dbg.value(metadata i32* @atom_2_X0_1, metadata !237, metadata !DIExpression()), !dbg !288

  //   call void @llvm.dbg.value(metadata i32 0, metadata !239, metadata !DIExpression()), !dbg !288

  //   store atomic i32 0, i32* @atom_2_X0_1 monotonic, align 4, !dbg !139
  // ST: Guess
  iw(0,7) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l99_c3
  old_cw = cw(0,7);
  cw(0,7) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l99_c3
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

  //   call void @llvm.dbg.value(metadata i32* @atom_3_X0_1, metadata !240, metadata !DIExpression()), !dbg !290

  //   call void @llvm.dbg.value(metadata i32 0, metadata !242, metadata !DIExpression()), !dbg !290

  //   store atomic i32 0, i32* @atom_3_X0_1 monotonic, align 4, !dbg !141
  // ST: Guess
  iw(0,8) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l100_c3
  old_cw = cw(0,8);
  cw(0,8) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l100_c3
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

  //   call void @llvm.dbg.value(metadata i32* @atom_4_X0_1, metadata !243, metadata !DIExpression()), !dbg !292

  //   call void @llvm.dbg.value(metadata i32 0, metadata !245, metadata !DIExpression()), !dbg !292

  //   store atomic i32 0, i32* @atom_4_X0_1 monotonic, align 4, !dbg !143
  // ST: Guess
  iw(0,10) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l101_c3
  old_cw = cw(0,10);
  cw(0,10) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l101_c3
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

  //   %call = call i32 @pthread_create(i64* noundef %thr0, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t0, i8* noundef null) #6, !dbg !144
  // dumbsy: Guess
  old_cdy = cdy[0];
  cdy[0] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[0] >= old_cdy);
  ASSUME(cdy[0] >= cisb[0]);
  ASSUME(cdy[0] >= cdl[0]);
  ASSUME(cdy[0] >= cds[0]);
  ASSUME(cdy[0] >= cctrl[0]);
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,0+0));
  ASSUME(cdy[0] >= cw(0,0+1));
  ASSUME(cdy[0] >= cw(0,0+2));
  ASSUME(cdy[0] >= cw(0,0+3));
  ASSUME(cdy[0] >= cw(0,0+4));
  ASSUME(cdy[0] >= cw(0,0+5));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[1] >= cdy[0]);

  //   %call23 = call i32 @pthread_create(i64* noundef %thr1, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t1, i8* noundef null) #6, !dbg !145
  // dumbsy: Guess
  old_cdy = cdy[0];
  cdy[0] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[0] >= old_cdy);
  ASSUME(cdy[0] >= cisb[0]);
  ASSUME(cdy[0] >= cdl[0]);
  ASSUME(cdy[0] >= cds[0]);
  ASSUME(cdy[0] >= cctrl[0]);
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,0+0));
  ASSUME(cdy[0] >= cw(0,0+1));
  ASSUME(cdy[0] >= cw(0,0+2));
  ASSUME(cdy[0] >= cw(0,0+3));
  ASSUME(cdy[0] >= cw(0,0+4));
  ASSUME(cdy[0] >= cw(0,0+5));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[2] >= cdy[0]);

  //   %call24 = call i32 @pthread_create(i64* noundef %thr2, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t2, i8* noundef null) #6, !dbg !146
  // dumbsy: Guess
  old_cdy = cdy[0];
  cdy[0] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[0] >= old_cdy);
  ASSUME(cdy[0] >= cisb[0]);
  ASSUME(cdy[0] >= cdl[0]);
  ASSUME(cdy[0] >= cds[0]);
  ASSUME(cdy[0] >= cctrl[0]);
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,0+0));
  ASSUME(cdy[0] >= cw(0,0+1));
  ASSUME(cdy[0] >= cw(0,0+2));
  ASSUME(cdy[0] >= cw(0,0+3));
  ASSUME(cdy[0] >= cw(0,0+4));
  ASSUME(cdy[0] >= cw(0,0+5));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[3] >= cdy[0]);

  //   %call25 = call i32 @pthread_create(i64* noundef %thr3, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t3, i8* noundef null) #6, !dbg !147
  // dumbsy: Guess
  old_cdy = cdy[0];
  cdy[0] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[0] >= old_cdy);
  ASSUME(cdy[0] >= cisb[0]);
  ASSUME(cdy[0] >= cdl[0]);
  ASSUME(cdy[0] >= cds[0]);
  ASSUME(cdy[0] >= cctrl[0]);
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,0+0));
  ASSUME(cdy[0] >= cw(0,0+1));
  ASSUME(cdy[0] >= cw(0,0+2));
  ASSUME(cdy[0] >= cw(0,0+3));
  ASSUME(cdy[0] >= cw(0,0+4));
  ASSUME(cdy[0] >= cw(0,0+5));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[4] >= cdy[0]);

  //   %call26 = call i32 @pthread_create(i64* noundef %thr4, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t4, i8* noundef null) #6, !dbg !148
  // dumbsy: Guess
  old_cdy = cdy[0];
  cdy[0] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[0] >= old_cdy);
  ASSUME(cdy[0] >= cisb[0]);
  ASSUME(cdy[0] >= cdl[0]);
  ASSUME(cdy[0] >= cds[0]);
  ASSUME(cdy[0] >= cctrl[0]);
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,0+0));
  ASSUME(cdy[0] >= cw(0,0+1));
  ASSUME(cdy[0] >= cw(0,0+2));
  ASSUME(cdy[0] >= cw(0,0+3));
  ASSUME(cdy[0] >= cw(0,0+4));
  ASSUME(cdy[0] >= cw(0,0+5));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[5] >= cdy[0]);

  //   %call27 = call i32 @pthread_create(i64* noundef %thr5, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t5, i8* noundef null) #6, !dbg !149
  // dumbsy: Guess
  old_cdy = cdy[0];
  cdy[0] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[0] >= old_cdy);
  ASSUME(cdy[0] >= cisb[0]);
  ASSUME(cdy[0] >= cdl[0]);
  ASSUME(cdy[0] >= cds[0]);
  ASSUME(cdy[0] >= cctrl[0]);
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,0+0));
  ASSUME(cdy[0] >= cw(0,0+1));
  ASSUME(cdy[0] >= cw(0,0+2));
  ASSUME(cdy[0] >= cw(0,0+3));
  ASSUME(cdy[0] >= cw(0,0+4));
  ASSUME(cdy[0] >= cw(0,0+5));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[6] >= cdy[0]);

  //   %6 = load i64, i64* %thr0, align 8, !dbg !150, !tbaa !151
  r7 = local_mem[0];

  //   %call28 = call i32 @pthread_join(i64 noundef %6, i8** noundef null), !dbg !155
  // dumbsy: Guess
  old_cdy = cdy[0];
  cdy[0] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[0] >= old_cdy);
  ASSUME(cdy[0] >= cisb[0]);
  ASSUME(cdy[0] >= cdl[0]);
  ASSUME(cdy[0] >= cds[0]);
  ASSUME(cdy[0] >= cctrl[0]);
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,0+0));
  ASSUME(cdy[0] >= cw(0,0+1));
  ASSUME(cdy[0] >= cw(0,0+2));
  ASSUME(cdy[0] >= cw(0,0+3));
  ASSUME(cdy[0] >= cw(0,0+4));
  ASSUME(cdy[0] >= cw(0,0+5));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[1]);

  //   %7 = load i64, i64* %thr1, align 8, !dbg !156, !tbaa !151
  r8 = local_mem[1];

  //   %call29 = call i32 @pthread_join(i64 noundef %7, i8** noundef null), !dbg !157
  // dumbsy: Guess
  old_cdy = cdy[0];
  cdy[0] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[0] >= old_cdy);
  ASSUME(cdy[0] >= cisb[0]);
  ASSUME(cdy[0] >= cdl[0]);
  ASSUME(cdy[0] >= cds[0]);
  ASSUME(cdy[0] >= cctrl[0]);
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,0+0));
  ASSUME(cdy[0] >= cw(0,0+1));
  ASSUME(cdy[0] >= cw(0,0+2));
  ASSUME(cdy[0] >= cw(0,0+3));
  ASSUME(cdy[0] >= cw(0,0+4));
  ASSUME(cdy[0] >= cw(0,0+5));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[2]);

  //   %8 = load i64, i64* %thr2, align 8, !dbg !158, !tbaa !151
  r9 = local_mem[2];

  //   %call30 = call i32 @pthread_join(i64 noundef %8, i8** noundef null), !dbg !159
  // dumbsy: Guess
  old_cdy = cdy[0];
  cdy[0] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[0] >= old_cdy);
  ASSUME(cdy[0] >= cisb[0]);
  ASSUME(cdy[0] >= cdl[0]);
  ASSUME(cdy[0] >= cds[0]);
  ASSUME(cdy[0] >= cctrl[0]);
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,0+0));
  ASSUME(cdy[0] >= cw(0,0+1));
  ASSUME(cdy[0] >= cw(0,0+2));
  ASSUME(cdy[0] >= cw(0,0+3));
  ASSUME(cdy[0] >= cw(0,0+4));
  ASSUME(cdy[0] >= cw(0,0+5));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[3]);

  //   %9 = load i64, i64* %thr3, align 8, !dbg !160, !tbaa !151
  r10 = local_mem[3];

  //   %call31 = call i32 @pthread_join(i64 noundef %9, i8** noundef null), !dbg !161
  // dumbsy: Guess
  old_cdy = cdy[0];
  cdy[0] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[0] >= old_cdy);
  ASSUME(cdy[0] >= cisb[0]);
  ASSUME(cdy[0] >= cdl[0]);
  ASSUME(cdy[0] >= cds[0]);
  ASSUME(cdy[0] >= cctrl[0]);
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,0+0));
  ASSUME(cdy[0] >= cw(0,0+1));
  ASSUME(cdy[0] >= cw(0,0+2));
  ASSUME(cdy[0] >= cw(0,0+3));
  ASSUME(cdy[0] >= cw(0,0+4));
  ASSUME(cdy[0] >= cw(0,0+5));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[4]);

  //   %10 = load i64, i64* %thr4, align 8, !dbg !162, !tbaa !151
  r11 = local_mem[4];

  //   %call32 = call i32 @pthread_join(i64 noundef %10, i8** noundef null), !dbg !163
  // dumbsy: Guess
  old_cdy = cdy[0];
  cdy[0] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[0] >= old_cdy);
  ASSUME(cdy[0] >= cisb[0]);
  ASSUME(cdy[0] >= cdl[0]);
  ASSUME(cdy[0] >= cds[0]);
  ASSUME(cdy[0] >= cctrl[0]);
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,0+0));
  ASSUME(cdy[0] >= cw(0,0+1));
  ASSUME(cdy[0] >= cw(0,0+2));
  ASSUME(cdy[0] >= cw(0,0+3));
  ASSUME(cdy[0] >= cw(0,0+4));
  ASSUME(cdy[0] >= cw(0,0+5));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[5]);

  //   %11 = load i64, i64* %thr5, align 8, !dbg !164, !tbaa !151
  r12 = local_mem[5];

  //   %call33 = call i32 @pthread_join(i64 noundef %11, i8** noundef null), !dbg !165
  // dumbsy: Guess
  old_cdy = cdy[0];
  cdy[0] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cdy[0] >= old_cdy);
  ASSUME(cdy[0] >= cisb[0]);
  ASSUME(cdy[0] >= cdl[0]);
  ASSUME(cdy[0] >= cds[0]);
  ASSUME(cdy[0] >= cctrl[0]);
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cw(0,0+0));
  ASSUME(cdy[0] >= cw(0,0+1));
  ASSUME(cdy[0] >= cw(0,0+2));
  ASSUME(cdy[0] >= cw(0,0+3));
  ASSUME(cdy[0] >= cw(0,0+4));
  ASSUME(cdy[0] >= cw(0,0+5));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,0+5));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[6]);

  //   %12 = load i32, i32* @atom_4_X2_0, align 4, !dbg !166, !tbaa !167
  // LD: Guess
  old_cr = cr(0,9);
  cr(0,9) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l117_c13
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
    r13 = mem(9,cr(0,9));
  }
  ASSUME(creturn[0] >= cr(0,9));

  //   call void @llvm.dbg.value(metadata i32 %12, metadata !246, metadata !DIExpression()), !dbg !257

  //   %13 = load i32, i32* @atom_5_X1_0, align 4, !dbg !169, !tbaa !167
  // LD: Guess
  old_cr = cr(0,11);
  cr(0,11) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l118_c13
  // Check
  ASSUME(active[cr(0,11)] == 0);
  ASSUME(cr(0,11) >= iw(0,11));
  ASSUME(cr(0,11) >= 0);
  ASSUME(cr(0,11) >= cdy[0]);
  ASSUME(cr(0,11) >= cisb[0]);
  ASSUME(cr(0,11) >= cdl[0]);
  ASSUME(cr(0,11) >= cl[0]);
  // Update
  creg_r14 = cr(0,11);
  crmax(0,11) = max(crmax(0,11),cr(0,11));
  caddr[0] = max(caddr[0],0);
  if(cr(0,11) < cw(0,11)) {
    r14 = buff(0,11);
    ASSUME((!(( (cw(0,11) < 1) && (1 < crmax(0,11)) )))||(sforbid(11,1)> 0));
    ASSUME((!(( (cw(0,11) < 2) && (2 < crmax(0,11)) )))||(sforbid(11,2)> 0));
    ASSUME((!(( (cw(0,11) < 3) && (3 < crmax(0,11)) )))||(sforbid(11,3)> 0));
    ASSUME((!(( (cw(0,11) < 4) && (4 < crmax(0,11)) )))||(sforbid(11,4)> 0));
    ASSUME((!(( (cw(0,11) < 5) && (5 < crmax(0,11)) )))||(sforbid(11,5)> 0));
    ASSUME((!(( (cw(0,11) < 6) && (6 < crmax(0,11)) )))||(sforbid(11,6)> 0));
    ASSUME((!(( (cw(0,11) < 7) && (7 < crmax(0,11)) )))||(sforbid(11,7)> 0));
    ASSUME((!(( (cw(0,11) < 8) && (8 < crmax(0,11)) )))||(sforbid(11,8)> 0));
    ASSUME((!(( (cw(0,11) < 9) && (9 < crmax(0,11)) )))||(sforbid(11,9)> 0));
  } else {
    if(pw(0,11) != co(11,cr(0,11))) {
      ASSUME(cr(0,11) >= old_cr);
    }
    pw(0,11) = co(11,cr(0,11));
    r14 = mem(11,cr(0,11));
  }
  ASSUME(creturn[0] >= cr(0,11));

  //   call void @llvm.dbg.value(metadata i32 %13, metadata !247, metadata !DIExpression()), !dbg !257

  //   %14 = load i32, i32* @atom_1_X0_1, align 4, !dbg !170, !tbaa !167
  // LD: Guess
  old_cr = cr(0,6);
  cr(0,6) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l119_c13
  // Check
  ASSUME(active[cr(0,6)] == 0);
  ASSUME(cr(0,6) >= iw(0,6));
  ASSUME(cr(0,6) >= 0);
  ASSUME(cr(0,6) >= cdy[0]);
  ASSUME(cr(0,6) >= cisb[0]);
  ASSUME(cr(0,6) >= cdl[0]);
  ASSUME(cr(0,6) >= cl[0]);
  // Update
  creg_r15 = cr(0,6);
  crmax(0,6) = max(crmax(0,6),cr(0,6));
  caddr[0] = max(caddr[0],0);
  if(cr(0,6) < cw(0,6)) {
    r15 = buff(0,6);
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
    r15 = mem(6,cr(0,6));
  }
  ASSUME(creturn[0] >= cr(0,6));

  //   call void @llvm.dbg.value(metadata i32 %14, metadata !248, metadata !DIExpression()), !dbg !257

  //   %15 = load i32, i32* @atom_2_X0_1, align 4, !dbg !171, !tbaa !167
  // LD: Guess
  old_cr = cr(0,7);
  cr(0,7) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l120_c13
  // Check
  ASSUME(active[cr(0,7)] == 0);
  ASSUME(cr(0,7) >= iw(0,7));
  ASSUME(cr(0,7) >= 0);
  ASSUME(cr(0,7) >= cdy[0]);
  ASSUME(cr(0,7) >= cisb[0]);
  ASSUME(cr(0,7) >= cdl[0]);
  ASSUME(cr(0,7) >= cl[0]);
  // Update
  creg_r16 = cr(0,7);
  crmax(0,7) = max(crmax(0,7),cr(0,7));
  caddr[0] = max(caddr[0],0);
  if(cr(0,7) < cw(0,7)) {
    r16 = buff(0,7);
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
    r16 = mem(7,cr(0,7));
  }
  ASSUME(creturn[0] >= cr(0,7));

  //   call void @llvm.dbg.value(metadata i32 %15, metadata !249, metadata !DIExpression()), !dbg !257

  //   %16 = load i32, i32* @atom_3_X0_1, align 4, !dbg !172, !tbaa !167
  // LD: Guess
  old_cr = cr(0,8);
  cr(0,8) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l121_c13
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
    r17 = mem(8,cr(0,8));
  }
  ASSUME(creturn[0] >= cr(0,8));

  //   call void @llvm.dbg.value(metadata i32 %16, metadata !250, metadata !DIExpression()), !dbg !257

  //   %17 = load i32, i32* @atom_4_X0_1, align 4, !dbg !173, !tbaa !167
  // LD: Guess
  old_cr = cr(0,10);
  cr(0,10) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l122_c13
  // Check
  ASSUME(active[cr(0,10)] == 0);
  ASSUME(cr(0,10) >= iw(0,10));
  ASSUME(cr(0,10) >= 0);
  ASSUME(cr(0,10) >= cdy[0]);
  ASSUME(cr(0,10) >= cisb[0]);
  ASSUME(cr(0,10) >= cdl[0]);
  ASSUME(cr(0,10) >= cl[0]);
  // Update
  creg_r18 = cr(0,10);
  crmax(0,10) = max(crmax(0,10),cr(0,10));
  caddr[0] = max(caddr[0],0);
  if(cr(0,10) < cw(0,10)) {
    r18 = buff(0,10);
    ASSUME((!(( (cw(0,10) < 1) && (1 < crmax(0,10)) )))||(sforbid(10,1)> 0));
    ASSUME((!(( (cw(0,10) < 2) && (2 < crmax(0,10)) )))||(sforbid(10,2)> 0));
    ASSUME((!(( (cw(0,10) < 3) && (3 < crmax(0,10)) )))||(sforbid(10,3)> 0));
    ASSUME((!(( (cw(0,10) < 4) && (4 < crmax(0,10)) )))||(sforbid(10,4)> 0));
    ASSUME((!(( (cw(0,10) < 5) && (5 < crmax(0,10)) )))||(sforbid(10,5)> 0));
    ASSUME((!(( (cw(0,10) < 6) && (6 < crmax(0,10)) )))||(sforbid(10,6)> 0));
    ASSUME((!(( (cw(0,10) < 7) && (7 < crmax(0,10)) )))||(sforbid(10,7)> 0));
    ASSUME((!(( (cw(0,10) < 8) && (8 < crmax(0,10)) )))||(sforbid(10,8)> 0));
    ASSUME((!(( (cw(0,10) < 9) && (9 < crmax(0,10)) )))||(sforbid(10,9)> 0));
  } else {
    if(pw(0,10) != co(10,cr(0,10))) {
      ASSUME(cr(0,10) >= old_cr);
    }
    pw(0,10) = co(10,cr(0,10));
    r18 = mem(10,cr(0,10));
  }
  ASSUME(creturn[0] >= cr(0,10));

  //   call void @llvm.dbg.value(metadata i32 %17, metadata !251, metadata !DIExpression()), !dbg !257

  //   %and = and i32 %16, %17, !dbg !174
  creg_r19 = max(creg_r17,creg_r18);
  r19 = r17 & r18;

  //   call void @llvm.dbg.value(metadata i32 %and, metadata !252, metadata !DIExpression()), !dbg !257

  //   %and34 = and i32 %15, %and, !dbg !175
  creg_r20 = max(creg_r16,creg_r19);
  r20 = r16 & r19;

  //   call void @llvm.dbg.value(metadata i32 %and34, metadata !253, metadata !DIExpression()), !dbg !257

  //   %and35 = and i32 %14, %and34, !dbg !176
  creg_r21 = max(creg_r15,creg_r20);
  r21 = r15 & r20;

  //   call void @llvm.dbg.value(metadata i32 %and35, metadata !254, metadata !DIExpression()), !dbg !257

  //   %and36 = and i32 %13, %and35, !dbg !177
  creg_r22 = max(creg_r14,creg_r21);
  r22 = r14 & r21;

  //   call void @llvm.dbg.value(metadata i32 %and36, metadata !255, metadata !DIExpression()), !dbg !257

  //   %and37 = and i32 %12, %and36, !dbg !178
  creg_r23 = max(creg_r13,creg_r22);
  r23 = r13 & r22;

  //   call void @llvm.dbg.value(metadata i32 %and37, metadata !256, metadata !DIExpression()), !dbg !257

  //   %cmp = icmp eq i32 %and37, 1, !dbg !179
  creg__r23__1_ = max(0,creg_r23);

  //   br i1 %cmp, label %if.then, label %if.end, !dbg !181
  old_cctrl = cctrl[0];
  cctrl[0] = get_rng(0,NCONTEXT-1);
  ASSUME(cctrl[0] >= old_cctrl);
  ASSUME(cctrl[0] >= creg__r23__1_);
  if((r23==1)) {
    goto T0BLOCK1;
  } else {
    goto T0BLOCK2;
  }

T0BLOCK1:
  //   call void @__assert_fail(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([112 x i8], [112 x i8]* @.str.1, i64 0, i64 0), i32 noundef 128, i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #7, !dbg !182

  //   unreachable, !dbg !182
  r24 = 1;
  goto T0BLOCK_END;

T0BLOCK2:
  //   %18 = bitcast i64* %thr5 to i8*, !dbg !185

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %18) #6, !dbg !185

  //   %19 = bitcast i64* %thr4 to i8*, !dbg !185

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %19) #6, !dbg !185

  //   %20 = bitcast i64* %thr3 to i8*, !dbg !185

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %20) #6, !dbg !185

  //   %21 = bitcast i64* %thr2 to i8*, !dbg !185

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %21) #6, !dbg !185

  //   %22 = bitcast i64* %thr1 to i8*, !dbg !185

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %22) #6, !dbg !185

  //   %23 = bitcast i64* %thr0 to i8*, !dbg !185

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %23) #6, !dbg !185

  //   ret i32 0, !dbg !186
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
  ASSUME(meminit(10,5) == mem(10,4));
  ASSUME(coinit(10,5) == co(10,4));
  ASSUME(deltainit(10,5) == delta(10,4));
  ASSUME(meminit(10,6) == mem(10,5));
  ASSUME(coinit(10,6) == co(10,5));
  ASSUME(deltainit(10,6) == delta(10,5));
  ASSUME(meminit(10,7) == mem(10,6));
  ASSUME(coinit(10,7) == co(10,6));
  ASSUME(deltainit(10,7) == delta(10,6));
  ASSUME(meminit(10,8) == mem(10,7));
  ASSUME(coinit(10,8) == co(10,7));
  ASSUME(deltainit(10,8) == delta(10,7));
  ASSUME(meminit(10,9) == mem(10,8));
  ASSUME(coinit(10,9) == co(10,8));
  ASSUME(deltainit(10,9) == delta(10,8));
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
  ASSUME(meminit(11,5) == mem(11,4));
  ASSUME(coinit(11,5) == co(11,4));
  ASSUME(deltainit(11,5) == delta(11,4));
  ASSUME(meminit(11,6) == mem(11,5));
  ASSUME(coinit(11,6) == co(11,5));
  ASSUME(deltainit(11,6) == delta(11,5));
  ASSUME(meminit(11,7) == mem(11,6));
  ASSUME(coinit(11,7) == co(11,6));
  ASSUME(deltainit(11,7) == delta(11,6));
  ASSUME(meminit(11,8) == mem(11,7));
  ASSUME(coinit(11,8) == co(11,7));
  ASSUME(deltainit(11,8) == delta(11,7));
  ASSUME(meminit(11,9) == mem(11,8));
  ASSUME(coinit(11,9) == co(11,8));
  ASSUME(deltainit(11,9) == delta(11,8));

  ASSERT(r24== 0);

}