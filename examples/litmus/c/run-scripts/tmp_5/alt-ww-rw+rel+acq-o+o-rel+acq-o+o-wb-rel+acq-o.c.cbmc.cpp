// Global variabls:
// 0:vars:5
// 5:atom_1_X0_1:1
// 6:atom_3_X0_1:1
// 7:atom_5_X0_1:1
// Local global variabls:
// 0:thr0:1
// 1:thr1:1
// 2:thr2:1
// 3:thr3:1
// 4:thr4:1
// 5:thr5:1
#define ADDRSIZE 8
#define LOCALADDRSIZE 6
#define NTHREAD 7
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
  mem(5+0,0) = 0;
  mem(6+0,0) = 0;
  mem(7+0,0) = 0;
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
  // Dumping thread 1
  int ret_thread_1 = 0;
  cdy[1] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[1] >= cstart[1]);
T1BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !38, metadata !DIExpression()), !dbg !44

  //   br label %label_1, !dbg !45
  goto T1BLOCK1;

T1BLOCK1:
  //   call void @llvm.dbg.label(metadata !43), !dbg !46

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 0), metadata !39, metadata !DIExpression()), !dbg !47

  //   call void @llvm.dbg.value(metadata i64 1, metadata !42, metadata !DIExpression()), !dbg !47

  //   store atomic i64 1, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 0) release, align 8, !dbg !48
  // ST: Guess
  //   : Release
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
  ASSUME(cw(1,0) >= cr(1,0+0));
  ASSUME(cw(1,0) >= cr(1,0+1));
  ASSUME(cw(1,0) >= cr(1,0+2));
  ASSUME(cw(1,0) >= cr(1,0+3));
  ASSUME(cw(1,0) >= cr(1,0+4));
  ASSUME(cw(1,0) >= cr(1,5+0));
  ASSUME(cw(1,0) >= cr(1,6+0));
  ASSUME(cw(1,0) >= cr(1,7+0));
  ASSUME(cw(1,0) >= cw(1,0+0));
  ASSUME(cw(1,0) >= cw(1,0+1));
  ASSUME(cw(1,0) >= cw(1,0+2));
  ASSUME(cw(1,0) >= cw(1,0+3));
  ASSUME(cw(1,0) >= cw(1,0+4));
  ASSUME(cw(1,0) >= cw(1,5+0));
  ASSUME(cw(1,0) >= cw(1,6+0));
  ASSUME(cw(1,0) >= cw(1,7+0));
  // Update
  caddr[1] = max(caddr[1],0);
  buff(1,0) = 1;
  mem(0,cw(1,0)) = 1;
  co(0,cw(1,0))+=1;
  delta(0,cw(1,0)) = -1;
  is(1,0) = iw(1,0);
  cs(1,0) = cw(1,0);
  ASSUME(creturn[1] >= cw(1,0));

  //   ret i8* null, !dbg !49
  ret_thread_1 = (- 1);
  goto T1BLOCK_END;

T1BLOCK_END:

  // Dumping thread 2
  int ret_thread_2 = 0;
  cdy[2] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[2] >= cstart[2]);
T2BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !52, metadata !DIExpression()), !dbg !62

  //   br label %label_2, !dbg !50
  goto T2BLOCK1;

T2BLOCK1:
  //   call void @llvm.dbg.label(metadata !61), !dbg !64

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 0), metadata !54, metadata !DIExpression()), !dbg !65

  //   %0 = load atomic i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 0) acquire, align 8, !dbg !53
  // LD: Guess
  //   : Acquire
  old_cr = cr(2,0);
  cr(2,0) = get_rng(0,NCONTEXT-1);// 2 ASSIGN LDCOM _l27_c15
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
  ASSUME(cr(2,0) >= cs(2,5+0));
  ASSUME(cr(2,0) >= cs(2,6+0));
  ASSUME(cr(2,0) >= cs(2,7+0));
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
  } else {
    if(pw(2,0) != co(0,cr(2,0))) {
      ASSUME(cr(2,0) >= old_cr);
    }
    pw(2,0) = co(0,cr(2,0));
    r0 = mem(0,cr(2,0));
  }
  cl[2] = max(cl[2],cr(2,0));
  ASSUME(creturn[2] >= cr(2,0));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !56, metadata !DIExpression()), !dbg !65

  //   %conv = trunc i64 %0 to i32, !dbg !54

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !53, metadata !DIExpression()), !dbg !62

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 1), metadata !57, metadata !DIExpression()), !dbg !68

  //   call void @llvm.dbg.value(metadata i64 1, metadata !59, metadata !DIExpression()), !dbg !68

  //   store atomic i64 1, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !56
  // ST: Guess
  iw(2,0+1*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW _l28_c3
  old_cw = cw(2,0+1*1);
  cw(2,0+1*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM _l28_c3
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

  //   %cmp = icmp eq i32 %conv, 1, !dbg !57
  creg__r0__1_ = max(0,creg_r0);

  //   %conv1 = zext i1 %cmp to i32, !dbg !57

  //   call void @llvm.dbg.value(metadata i32 %conv1, metadata !60, metadata !DIExpression()), !dbg !62

  //   store i32 %conv1, i32* @atom_1_X0_1, align 4, !dbg !58, !tbaa !59
  // ST: Guess
  iw(2,5) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW _l30_c15
  old_cw = cw(2,5);
  cw(2,5) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM _l30_c15
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

  //   ret i8* null, !dbg !63
  ret_thread_2 = (- 1);
  goto T2BLOCK_END;

T2BLOCK_END:

  // Dumping thread 3
  int ret_thread_3 = 0;
  cdy[3] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[3] >= cstart[3]);
T3BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !79, metadata !DIExpression()), !dbg !87

  //   br label %label_3, !dbg !48
  goto T3BLOCK1;

T3BLOCK1:
  //   call void @llvm.dbg.label(metadata !86), !dbg !89

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 1), metadata !80, metadata !DIExpression()), !dbg !90

  //   call void @llvm.dbg.value(metadata i64 2, metadata !82, metadata !DIExpression()), !dbg !90

  //   store atomic i64 2, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !51
  // ST: Guess
  iw(3,0+1*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STIW _l36_c3
  old_cw = cw(3,0+1*1);
  cw(3,0+1*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STCOM _l36_c3
  // Check
  ASSUME(active[iw(3,0+1*1)] == 3);
  ASSUME(active[cw(3,0+1*1)] == 3);
  ASSUME(sforbid(0+1*1,cw(3,0+1*1))== 0);
  ASSUME(iw(3,0+1*1) >= 0);
  ASSUME(iw(3,0+1*1) >= 0);
  ASSUME(cw(3,0+1*1) >= iw(3,0+1*1));
  ASSUME(cw(3,0+1*1) >= old_cw);
  ASSUME(cw(3,0+1*1) >= cr(3,0+1*1));
  ASSUME(cw(3,0+1*1) >= cl[3]);
  ASSUME(cw(3,0+1*1) >= cisb[3]);
  ASSUME(cw(3,0+1*1) >= cdy[3]);
  ASSUME(cw(3,0+1*1) >= cdl[3]);
  ASSUME(cw(3,0+1*1) >= cds[3]);
  ASSUME(cw(3,0+1*1) >= cctrl[3]);
  ASSUME(cw(3,0+1*1) >= caddr[3]);
  // Update
  caddr[3] = max(caddr[3],0);
  buff(3,0+1*1) = 2;
  mem(0+1*1,cw(3,0+1*1)) = 2;
  co(0+1*1,cw(3,0+1*1))+=1;
  delta(0+1*1,cw(3,0+1*1)) = -1;
  ASSUME(creturn[3] >= cw(3,0+1*1));

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 2), metadata !83, metadata !DIExpression()), !dbg !92

  //   call void @llvm.dbg.value(metadata i64 1, metadata !85, metadata !DIExpression()), !dbg !92

  //   store atomic i64 1, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 2) release, align 8, !dbg !53
  // ST: Guess
  //   : Release
  iw(3,0+2*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STIW _l37_c3
  old_cw = cw(3,0+2*1);
  cw(3,0+2*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STCOM _l37_c3
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
  ASSUME(cw(3,0+2*1) >= cr(3,0+0));
  ASSUME(cw(3,0+2*1) >= cr(3,0+1));
  ASSUME(cw(3,0+2*1) >= cr(3,0+2));
  ASSUME(cw(3,0+2*1) >= cr(3,0+3));
  ASSUME(cw(3,0+2*1) >= cr(3,0+4));
  ASSUME(cw(3,0+2*1) >= cr(3,5+0));
  ASSUME(cw(3,0+2*1) >= cr(3,6+0));
  ASSUME(cw(3,0+2*1) >= cr(3,7+0));
  ASSUME(cw(3,0+2*1) >= cw(3,0+0));
  ASSUME(cw(3,0+2*1) >= cw(3,0+1));
  ASSUME(cw(3,0+2*1) >= cw(3,0+2));
  ASSUME(cw(3,0+2*1) >= cw(3,0+3));
  ASSUME(cw(3,0+2*1) >= cw(3,0+4));
  ASSUME(cw(3,0+2*1) >= cw(3,5+0));
  ASSUME(cw(3,0+2*1) >= cw(3,6+0));
  ASSUME(cw(3,0+2*1) >= cw(3,7+0));
  // Update
  caddr[3] = max(caddr[3],0);
  buff(3,0+2*1) = 1;
  mem(0+2*1,cw(3,0+2*1)) = 1;
  co(0+2*1,cw(3,0+2*1))+=1;
  delta(0+2*1,cw(3,0+2*1)) = -1;
  is(3,0+2*1) = iw(3,0+2*1);
  cs(3,0+2*1) = cw(3,0+2*1);
  ASSUME(creturn[3] >= cw(3,0+2*1));

  //   ret i8* null, !dbg !54
  ret_thread_3 = (- 1);
  goto T3BLOCK_END;

T3BLOCK_END:

  // Dumping thread 4
  int ret_thread_4 = 0;
  cdy[4] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[4] >= cstart[4]);
T4BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !97, metadata !DIExpression()), !dbg !107

  //   br label %label_4, !dbg !50
  goto T4BLOCK1;

T4BLOCK1:
  //   call void @llvm.dbg.label(metadata !106), !dbg !109

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 2), metadata !99, metadata !DIExpression()), !dbg !110

  //   %0 = load atomic i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 2) acquire, align 8, !dbg !53
  // LD: Guess
  //   : Acquire
  old_cr = cr(4,0+2*1);
  cr(4,0+2*1) = get_rng(0,NCONTEXT-1);// 4 ASSIGN LDCOM _l43_c15
  // Check
  ASSUME(active[cr(4,0+2*1)] == 4);
  ASSUME(cr(4,0+2*1) >= iw(4,0+2*1));
  ASSUME(cr(4,0+2*1) >= 0);
  ASSUME(cr(4,0+2*1) >= cdy[4]);
  ASSUME(cr(4,0+2*1) >= cisb[4]);
  ASSUME(cr(4,0+2*1) >= cdl[4]);
  ASSUME(cr(4,0+2*1) >= cl[4]);
  ASSUME(cr(4,0+2*1) >= cx(4,0+2*1));
  ASSUME(cr(4,0+2*1) >= cs(4,0+0));
  ASSUME(cr(4,0+2*1) >= cs(4,0+1));
  ASSUME(cr(4,0+2*1) >= cs(4,0+2));
  ASSUME(cr(4,0+2*1) >= cs(4,0+3));
  ASSUME(cr(4,0+2*1) >= cs(4,0+4));
  ASSUME(cr(4,0+2*1) >= cs(4,5+0));
  ASSUME(cr(4,0+2*1) >= cs(4,6+0));
  ASSUME(cr(4,0+2*1) >= cs(4,7+0));
  // Update
  creg_r1 = cr(4,0+2*1);
  crmax(4,0+2*1) = max(crmax(4,0+2*1),cr(4,0+2*1));
  caddr[4] = max(caddr[4],0);
  if(cr(4,0+2*1) < cw(4,0+2*1)) {
    r1 = buff(4,0+2*1);
    ASSUME((!(( (cw(4,0+2*1) < 1) && (1 < crmax(4,0+2*1)) )))||(sforbid(0+2*1,1)> 0));
    ASSUME((!(( (cw(4,0+2*1) < 2) && (2 < crmax(4,0+2*1)) )))||(sforbid(0+2*1,2)> 0));
    ASSUME((!(( (cw(4,0+2*1) < 3) && (3 < crmax(4,0+2*1)) )))||(sforbid(0+2*1,3)> 0));
    ASSUME((!(( (cw(4,0+2*1) < 4) && (4 < crmax(4,0+2*1)) )))||(sforbid(0+2*1,4)> 0));
  } else {
    if(pw(4,0+2*1) != co(0+2*1,cr(4,0+2*1))) {
      ASSUME(cr(4,0+2*1) >= old_cr);
    }
    pw(4,0+2*1) = co(0+2*1,cr(4,0+2*1));
    r1 = mem(0+2*1,cr(4,0+2*1));
  }
  cl[4] = max(cl[4],cr(4,0+2*1));
  ASSUME(creturn[4] >= cr(4,0+2*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !101, metadata !DIExpression()), !dbg !110

  //   %conv = trunc i64 %0 to i32, !dbg !54

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !98, metadata !DIExpression()), !dbg !107

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 3), metadata !102, metadata !DIExpression()), !dbg !113

  //   call void @llvm.dbg.value(metadata i64 1, metadata !104, metadata !DIExpression()), !dbg !113

  //   store atomic i64 1, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !56
  // ST: Guess
  iw(4,0+3*1) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STIW _l44_c3
  old_cw = cw(4,0+3*1);
  cw(4,0+3*1) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STCOM _l44_c3
  // Check
  ASSUME(active[iw(4,0+3*1)] == 4);
  ASSUME(active[cw(4,0+3*1)] == 4);
  ASSUME(sforbid(0+3*1,cw(4,0+3*1))== 0);
  ASSUME(iw(4,0+3*1) >= 0);
  ASSUME(iw(4,0+3*1) >= 0);
  ASSUME(cw(4,0+3*1) >= iw(4,0+3*1));
  ASSUME(cw(4,0+3*1) >= old_cw);
  ASSUME(cw(4,0+3*1) >= cr(4,0+3*1));
  ASSUME(cw(4,0+3*1) >= cl[4]);
  ASSUME(cw(4,0+3*1) >= cisb[4]);
  ASSUME(cw(4,0+3*1) >= cdy[4]);
  ASSUME(cw(4,0+3*1) >= cdl[4]);
  ASSUME(cw(4,0+3*1) >= cds[4]);
  ASSUME(cw(4,0+3*1) >= cctrl[4]);
  ASSUME(cw(4,0+3*1) >= caddr[4]);
  // Update
  caddr[4] = max(caddr[4],0);
  buff(4,0+3*1) = 1;
  mem(0+3*1,cw(4,0+3*1)) = 1;
  co(0+3*1,cw(4,0+3*1))+=1;
  delta(0+3*1,cw(4,0+3*1)) = -1;
  ASSUME(creturn[4] >= cw(4,0+3*1));

  //   %cmp = icmp eq i32 %conv, 1, !dbg !57
  creg__r1__1_ = max(0,creg_r1);

  //   %conv1 = zext i1 %cmp to i32, !dbg !57

  //   call void @llvm.dbg.value(metadata i32 %conv1, metadata !105, metadata !DIExpression()), !dbg !107

  //   store i32 %conv1, i32* @atom_3_X0_1, align 4, !dbg !58, !tbaa !59
  // ST: Guess
  iw(4,6) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STIW _l46_c15
  old_cw = cw(4,6);
  cw(4,6) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STCOM _l46_c15
  // Check
  ASSUME(active[iw(4,6)] == 4);
  ASSUME(active[cw(4,6)] == 4);
  ASSUME(sforbid(6,cw(4,6))== 0);
  ASSUME(iw(4,6) >= creg__r1__1_);
  ASSUME(iw(4,6) >= 0);
  ASSUME(cw(4,6) >= iw(4,6));
  ASSUME(cw(4,6) >= old_cw);
  ASSUME(cw(4,6) >= cr(4,6));
  ASSUME(cw(4,6) >= cl[4]);
  ASSUME(cw(4,6) >= cisb[4]);
  ASSUME(cw(4,6) >= cdy[4]);
  ASSUME(cw(4,6) >= cdl[4]);
  ASSUME(cw(4,6) >= cds[4]);
  ASSUME(cw(4,6) >= cctrl[4]);
  ASSUME(cw(4,6) >= caddr[4]);
  // Update
  caddr[4] = max(caddr[4],0);
  buff(4,6) = (r1==1);
  mem(6,cw(4,6)) = (r1==1);
  co(6,cw(4,6))+=1;
  delta(6,cw(4,6)) = -1;
  ASSUME(creturn[4] >= cw(4,6));

  //   ret i8* null, !dbg !63
  ret_thread_4 = (- 1);
  goto T4BLOCK_END;

T4BLOCK_END:

  // Dumping thread 5
  int ret_thread_5 = 0;
  cdy[5] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[5] >= cstart[5]);
T5BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !120, metadata !DIExpression()), !dbg !128

  //   br label %label_5, !dbg !48
  goto T5BLOCK1;

T5BLOCK1:
  //   call void @llvm.dbg.label(metadata !127), !dbg !130

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 3), metadata !121, metadata !DIExpression()), !dbg !131

  //   call void @llvm.dbg.value(metadata i64 2, metadata !123, metadata !DIExpression()), !dbg !131

  //   store atomic i64 2, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !51
  // ST: Guess
  iw(5,0+3*1) = get_rng(0,NCONTEXT-1);// 5 ASSIGN STIW _l52_c3
  old_cw = cw(5,0+3*1);
  cw(5,0+3*1) = get_rng(0,NCONTEXT-1);// 5 ASSIGN STCOM _l52_c3
  // Check
  ASSUME(active[iw(5,0+3*1)] == 5);
  ASSUME(active[cw(5,0+3*1)] == 5);
  ASSUME(sforbid(0+3*1,cw(5,0+3*1))== 0);
  ASSUME(iw(5,0+3*1) >= 0);
  ASSUME(iw(5,0+3*1) >= 0);
  ASSUME(cw(5,0+3*1) >= iw(5,0+3*1));
  ASSUME(cw(5,0+3*1) >= old_cw);
  ASSUME(cw(5,0+3*1) >= cr(5,0+3*1));
  ASSUME(cw(5,0+3*1) >= cl[5]);
  ASSUME(cw(5,0+3*1) >= cisb[5]);
  ASSUME(cw(5,0+3*1) >= cdy[5]);
  ASSUME(cw(5,0+3*1) >= cdl[5]);
  ASSUME(cw(5,0+3*1) >= cds[5]);
  ASSUME(cw(5,0+3*1) >= cctrl[5]);
  ASSUME(cw(5,0+3*1) >= caddr[5]);
  // Update
  caddr[5] = max(caddr[5],0);
  buff(5,0+3*1) = 2;
  mem(0+3*1,cw(5,0+3*1)) = 2;
  co(0+3*1,cw(5,0+3*1))+=1;
  delta(0+3*1,cw(5,0+3*1)) = -1;
  ASSUME(creturn[5] >= cw(5,0+3*1));

  //   call void (...) @dmbst(), !dbg !52
  // dumbst: Guess
  cds[5] = get_rng(0,NCONTEXT-1);
  // Check
  ASSUME(cds[5] >= cdy[5]);
  ASSUME(cds[5] >= cw(5,0+0));
  ASSUME(cds[5] >= cw(5,0+1));
  ASSUME(cds[5] >= cw(5,0+2));
  ASSUME(cds[5] >= cw(5,0+3));
  ASSUME(cds[5] >= cw(5,0+4));
  ASSUME(cds[5] >= cw(5,5+0));
  ASSUME(cds[5] >= cw(5,6+0));
  ASSUME(cds[5] >= cw(5,7+0));
  ASSUME(creturn[5] >= cds[5]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 4), metadata !124, metadata !DIExpression()), !dbg !134

  //   call void @llvm.dbg.value(metadata i64 1, metadata !126, metadata !DIExpression()), !dbg !134

  //   store atomic i64 1, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 4) release, align 8, !dbg !54
  // ST: Guess
  //   : Release
  iw(5,0+4*1) = get_rng(0,NCONTEXT-1);// 5 ASSIGN STIW _l54_c3
  old_cw = cw(5,0+4*1);
  cw(5,0+4*1) = get_rng(0,NCONTEXT-1);// 5 ASSIGN STCOM _l54_c3
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
  ASSUME(cw(5,0+4*1) >= cr(5,0+0));
  ASSUME(cw(5,0+4*1) >= cr(5,0+1));
  ASSUME(cw(5,0+4*1) >= cr(5,0+2));
  ASSUME(cw(5,0+4*1) >= cr(5,0+3));
  ASSUME(cw(5,0+4*1) >= cr(5,0+4));
  ASSUME(cw(5,0+4*1) >= cr(5,5+0));
  ASSUME(cw(5,0+4*1) >= cr(5,6+0));
  ASSUME(cw(5,0+4*1) >= cr(5,7+0));
  ASSUME(cw(5,0+4*1) >= cw(5,0+0));
  ASSUME(cw(5,0+4*1) >= cw(5,0+1));
  ASSUME(cw(5,0+4*1) >= cw(5,0+2));
  ASSUME(cw(5,0+4*1) >= cw(5,0+3));
  ASSUME(cw(5,0+4*1) >= cw(5,0+4));
  ASSUME(cw(5,0+4*1) >= cw(5,5+0));
  ASSUME(cw(5,0+4*1) >= cw(5,6+0));
  ASSUME(cw(5,0+4*1) >= cw(5,7+0));
  // Update
  caddr[5] = max(caddr[5],0);
  buff(5,0+4*1) = 1;
  mem(0+4*1,cw(5,0+4*1)) = 1;
  co(0+4*1,cw(5,0+4*1))+=1;
  delta(0+4*1,cw(5,0+4*1)) = -1;
  is(5,0+4*1) = iw(5,0+4*1);
  cs(5,0+4*1) = cw(5,0+4*1);
  ASSUME(creturn[5] >= cw(5,0+4*1));

  //   ret i8* null, !dbg !55
  ret_thread_5 = (- 1);
  goto T5BLOCK_END;

T5BLOCK_END:

  // Dumping thread 6
  int ret_thread_6 = 0;
  cdy[6] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[6] >= cstart[6]);
T6BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !139, metadata !DIExpression()), !dbg !149

  //   br label %label_6, !dbg !50
  goto T6BLOCK1;

T6BLOCK1:
  //   call void @llvm.dbg.label(metadata !148), !dbg !151

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 4), metadata !141, metadata !DIExpression()), !dbg !152

  //   %0 = load atomic i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 4) acquire, align 8, !dbg !53
  // LD: Guess
  //   : Acquire
  old_cr = cr(6,0+4*1);
  cr(6,0+4*1) = get_rng(0,NCONTEXT-1);// 6 ASSIGN LDCOM _l60_c15
  // Check
  ASSUME(active[cr(6,0+4*1)] == 6);
  ASSUME(cr(6,0+4*1) >= iw(6,0+4*1));
  ASSUME(cr(6,0+4*1) >= 0);
  ASSUME(cr(6,0+4*1) >= cdy[6]);
  ASSUME(cr(6,0+4*1) >= cisb[6]);
  ASSUME(cr(6,0+4*1) >= cdl[6]);
  ASSUME(cr(6,0+4*1) >= cl[6]);
  ASSUME(cr(6,0+4*1) >= cx(6,0+4*1));
  ASSUME(cr(6,0+4*1) >= cs(6,0+0));
  ASSUME(cr(6,0+4*1) >= cs(6,0+1));
  ASSUME(cr(6,0+4*1) >= cs(6,0+2));
  ASSUME(cr(6,0+4*1) >= cs(6,0+3));
  ASSUME(cr(6,0+4*1) >= cs(6,0+4));
  ASSUME(cr(6,0+4*1) >= cs(6,5+0));
  ASSUME(cr(6,0+4*1) >= cs(6,6+0));
  ASSUME(cr(6,0+4*1) >= cs(6,7+0));
  // Update
  creg_r2 = cr(6,0+4*1);
  crmax(6,0+4*1) = max(crmax(6,0+4*1),cr(6,0+4*1));
  caddr[6] = max(caddr[6],0);
  if(cr(6,0+4*1) < cw(6,0+4*1)) {
    r2 = buff(6,0+4*1);
    ASSUME((!(( (cw(6,0+4*1) < 1) && (1 < crmax(6,0+4*1)) )))||(sforbid(0+4*1,1)> 0));
    ASSUME((!(( (cw(6,0+4*1) < 2) && (2 < crmax(6,0+4*1)) )))||(sforbid(0+4*1,2)> 0));
    ASSUME((!(( (cw(6,0+4*1) < 3) && (3 < crmax(6,0+4*1)) )))||(sforbid(0+4*1,3)> 0));
    ASSUME((!(( (cw(6,0+4*1) < 4) && (4 < crmax(6,0+4*1)) )))||(sforbid(0+4*1,4)> 0));
  } else {
    if(pw(6,0+4*1) != co(0+4*1,cr(6,0+4*1))) {
      ASSUME(cr(6,0+4*1) >= old_cr);
    }
    pw(6,0+4*1) = co(0+4*1,cr(6,0+4*1));
    r2 = mem(0+4*1,cr(6,0+4*1));
  }
  cl[6] = max(cl[6],cr(6,0+4*1));
  ASSUME(creturn[6] >= cr(6,0+4*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !143, metadata !DIExpression()), !dbg !152

  //   %conv = trunc i64 %0 to i32, !dbg !54

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !140, metadata !DIExpression()), !dbg !149

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 0), metadata !144, metadata !DIExpression()), !dbg !155

  //   call void @llvm.dbg.value(metadata i64 2, metadata !146, metadata !DIExpression()), !dbg !155

  //   store atomic i64 2, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !56
  // ST: Guess
  iw(6,0) = get_rng(0,NCONTEXT-1);// 6 ASSIGN STIW _l61_c3
  old_cw = cw(6,0);
  cw(6,0) = get_rng(0,NCONTEXT-1);// 6 ASSIGN STCOM _l61_c3
  // Check
  ASSUME(active[iw(6,0)] == 6);
  ASSUME(active[cw(6,0)] == 6);
  ASSUME(sforbid(0,cw(6,0))== 0);
  ASSUME(iw(6,0) >= 0);
  ASSUME(iw(6,0) >= 0);
  ASSUME(cw(6,0) >= iw(6,0));
  ASSUME(cw(6,0) >= old_cw);
  ASSUME(cw(6,0) >= cr(6,0));
  ASSUME(cw(6,0) >= cl[6]);
  ASSUME(cw(6,0) >= cisb[6]);
  ASSUME(cw(6,0) >= cdy[6]);
  ASSUME(cw(6,0) >= cdl[6]);
  ASSUME(cw(6,0) >= cds[6]);
  ASSUME(cw(6,0) >= cctrl[6]);
  ASSUME(cw(6,0) >= caddr[6]);
  // Update
  caddr[6] = max(caddr[6],0);
  buff(6,0) = 2;
  mem(0,cw(6,0)) = 2;
  co(0,cw(6,0))+=1;
  delta(0,cw(6,0)) = -1;
  ASSUME(creturn[6] >= cw(6,0));

  //   %cmp = icmp eq i32 %conv, 1, !dbg !57
  creg__r2__1_ = max(0,creg_r2);

  //   %conv1 = zext i1 %cmp to i32, !dbg !57

  //   call void @llvm.dbg.value(metadata i32 %conv1, metadata !147, metadata !DIExpression()), !dbg !149

  //   store i32 %conv1, i32* @atom_5_X0_1, align 4, !dbg !58, !tbaa !59
  // ST: Guess
  iw(6,7) = get_rng(0,NCONTEXT-1);// 6 ASSIGN STIW _l63_c15
  old_cw = cw(6,7);
  cw(6,7) = get_rng(0,NCONTEXT-1);// 6 ASSIGN STCOM _l63_c15
  // Check
  ASSUME(active[iw(6,7)] == 6);
  ASSUME(active[cw(6,7)] == 6);
  ASSUME(sforbid(7,cw(6,7))== 0);
  ASSUME(iw(6,7) >= creg__r2__1_);
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
  buff(6,7) = (r2==1);
  mem(7,cw(6,7)) = (r2==1);
  co(7,cw(6,7))+=1;
  delta(7,cw(6,7)) = -1;
  ASSUME(creturn[6] >= cw(6,7));

  //   ret i8* null, !dbg !63
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

  //   call void @llvm.dbg.value(metadata i32 %argc, metadata !167, metadata !DIExpression()), !dbg !216

  //   call void @llvm.dbg.value(metadata i8** %argv, metadata !168, metadata !DIExpression()), !dbg !216

  //   %0 = bitcast i64* %thr0 to i8*, !dbg !92

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #7, !dbg !92

  //   call void @llvm.dbg.declare(metadata i64* %thr0, metadata !169, metadata !DIExpression()), !dbg !218

  //   %1 = bitcast i64* %thr1 to i8*, !dbg !94

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #7, !dbg !94

  //   call void @llvm.dbg.declare(metadata i64* %thr1, metadata !173, metadata !DIExpression()), !dbg !220

  //   %2 = bitcast i64* %thr2 to i8*, !dbg !96

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #7, !dbg !96

  //   call void @llvm.dbg.declare(metadata i64* %thr2, metadata !174, metadata !DIExpression()), !dbg !222

  //   %3 = bitcast i64* %thr3 to i8*, !dbg !98

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #7, !dbg !98

  //   call void @llvm.dbg.declare(metadata i64* %thr3, metadata !175, metadata !DIExpression()), !dbg !224

  //   %4 = bitcast i64* %thr4 to i8*, !dbg !100

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #7, !dbg !100

  //   call void @llvm.dbg.declare(metadata i64* %thr4, metadata !176, metadata !DIExpression()), !dbg !226

  //   %5 = bitcast i64* %thr5 to i8*, !dbg !102

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %5) #7, !dbg !102

  //   call void @llvm.dbg.declare(metadata i64* %thr5, metadata !177, metadata !DIExpression()), !dbg !228

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 4), metadata !178, metadata !DIExpression()), !dbg !229

  //   call void @llvm.dbg.value(metadata i64 0, metadata !180, metadata !DIExpression()), !dbg !229

  //   store atomic i64 0, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 4) monotonic, align 8, !dbg !105
  // ST: Guess
  iw(0,0+4*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l75_c3
  old_cw = cw(0,0+4*1);
  cw(0,0+4*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l75_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 3), metadata !181, metadata !DIExpression()), !dbg !231

  //   call void @llvm.dbg.value(metadata i64 0, metadata !183, metadata !DIExpression()), !dbg !231

  //   store atomic i64 0, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !107
  // ST: Guess
  iw(0,0+3*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l76_c3
  old_cw = cw(0,0+3*1);
  cw(0,0+3*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l76_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 2), metadata !184, metadata !DIExpression()), !dbg !233

  //   call void @llvm.dbg.value(metadata i64 0, metadata !186, metadata !DIExpression()), !dbg !233

  //   store atomic i64 0, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 2) monotonic, align 8, !dbg !109
  // ST: Guess
  iw(0,0+2*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l77_c3
  old_cw = cw(0,0+2*1);
  cw(0,0+2*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l77_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 1), metadata !187, metadata !DIExpression()), !dbg !235

  //   call void @llvm.dbg.value(metadata i64 0, metadata !189, metadata !DIExpression()), !dbg !235

  //   store atomic i64 0, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !111
  // ST: Guess
  iw(0,0+1*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l78_c3
  old_cw = cw(0,0+1*1);
  cw(0,0+1*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l78_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 0), metadata !190, metadata !DIExpression()), !dbg !237

  //   call void @llvm.dbg.value(metadata i64 0, metadata !192, metadata !DIExpression()), !dbg !237

  //   store atomic i64 0, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !113
  // ST: Guess
  iw(0,0) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l79_c3
  old_cw = cw(0,0);
  cw(0,0) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l79_c3
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

  //   store i32 0, i32* @atom_1_X0_1, align 4, !dbg !114, !tbaa !115
  // ST: Guess
  iw(0,5) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l80_c15
  old_cw = cw(0,5);
  cw(0,5) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l80_c15
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

  //   store i32 0, i32* @atom_3_X0_1, align 4, !dbg !119, !tbaa !115
  // ST: Guess
  iw(0,6) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l81_c15
  old_cw = cw(0,6);
  cw(0,6) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l81_c15
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

  //   store i32 0, i32* @atom_5_X0_1, align 4, !dbg !120, !tbaa !115
  // ST: Guess
  iw(0,7) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l82_c15
  old_cw = cw(0,7);
  cw(0,7) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l82_c15
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

  //   %call = call i32 @pthread_create(i64* noundef %thr0, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t0, i8* noundef null) #7, !dbg !121
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
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[1] >= cdy[0]);

  //   %call9 = call i32 @pthread_create(i64* noundef %thr1, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t1, i8* noundef null) #7, !dbg !122
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
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[2] >= cdy[0]);

  //   %call10 = call i32 @pthread_create(i64* noundef %thr2, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t2, i8* noundef null) #7, !dbg !123
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
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[3] >= cdy[0]);

  //   %call11 = call i32 @pthread_create(i64* noundef %thr3, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t3, i8* noundef null) #7, !dbg !124
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
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[4] >= cdy[0]);

  //   %call12 = call i32 @pthread_create(i64* noundef %thr4, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t4, i8* noundef null) #7, !dbg !125
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
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[5] >= cdy[0]);

  //   %call13 = call i32 @pthread_create(i64* noundef %thr5, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t5, i8* noundef null) #7, !dbg !126
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
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[6] >= cdy[0]);

  //   %6 = load i64, i64* %thr0, align 8, !dbg !127, !tbaa !128
  r4 = local_mem[0];

  //   %call14 = call i32 @pthread_join(i64 noundef %6, i8** noundef null), !dbg !130
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
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[1]);

  //   %7 = load i64, i64* %thr1, align 8, !dbg !131, !tbaa !128
  r5 = local_mem[1];

  //   %call15 = call i32 @pthread_join(i64 noundef %7, i8** noundef null), !dbg !132
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
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[2]);

  //   %8 = load i64, i64* %thr2, align 8, !dbg !133, !tbaa !128
  r6 = local_mem[2];

  //   %call16 = call i32 @pthread_join(i64 noundef %8, i8** noundef null), !dbg !134
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
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[3]);

  //   %9 = load i64, i64* %thr3, align 8, !dbg !135, !tbaa !128
  r7 = local_mem[3];

  //   %call17 = call i32 @pthread_join(i64 noundef %9, i8** noundef null), !dbg !136
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
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[4]);

  //   %10 = load i64, i64* %thr4, align 8, !dbg !137, !tbaa !128
  r8 = local_mem[4];

  //   %call18 = call i32 @pthread_join(i64 noundef %10, i8** noundef null), !dbg !138
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
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[5]);

  //   %11 = load i64, i64* %thr5, align 8, !dbg !139, !tbaa !128
  r9 = local_mem[5];

  //   %call19 = call i32 @pthread_join(i64 noundef %11, i8** noundef null), !dbg !140
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
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,7+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[6]);

  //   %12 = load i32, i32* @atom_1_X0_1, align 4, !dbg !141, !tbaa !115
  // LD: Guess
  old_cr = cr(0,5);
  cr(0,5) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l98_c13
  // Check
  ASSUME(active[cr(0,5)] == 0);
  ASSUME(cr(0,5) >= iw(0,5));
  ASSUME(cr(0,5) >= 0);
  ASSUME(cr(0,5) >= cdy[0]);
  ASSUME(cr(0,5) >= cisb[0]);
  ASSUME(cr(0,5) >= cdl[0]);
  ASSUME(cr(0,5) >= cl[0]);
  // Update
  creg_r10 = cr(0,5);
  crmax(0,5) = max(crmax(0,5),cr(0,5));
  caddr[0] = max(caddr[0],0);
  if(cr(0,5) < cw(0,5)) {
    r10 = buff(0,5);
    ASSUME((!(( (cw(0,5) < 1) && (1 < crmax(0,5)) )))||(sforbid(5,1)> 0));
    ASSUME((!(( (cw(0,5) < 2) && (2 < crmax(0,5)) )))||(sforbid(5,2)> 0));
    ASSUME((!(( (cw(0,5) < 3) && (3 < crmax(0,5)) )))||(sforbid(5,3)> 0));
    ASSUME((!(( (cw(0,5) < 4) && (4 < crmax(0,5)) )))||(sforbid(5,4)> 0));
  } else {
    if(pw(0,5) != co(5,cr(0,5))) {
      ASSUME(cr(0,5) >= old_cr);
    }
    pw(0,5) = co(5,cr(0,5));
    r10 = mem(5,cr(0,5));
  }
  ASSUME(creturn[0] >= cr(0,5));

  //   call void @llvm.dbg.value(metadata i32 %12, metadata !193, metadata !DIExpression()), !dbg !216

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 1), metadata !195, metadata !DIExpression()), !dbg !263

  //   %13 = load atomic i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !143
  // LD: Guess
  old_cr = cr(0,0+1*1);
  cr(0,0+1*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l99_c13
  // Check
  ASSUME(active[cr(0,0+1*1)] == 0);
  ASSUME(cr(0,0+1*1) >= iw(0,0+1*1));
  ASSUME(cr(0,0+1*1) >= 0);
  ASSUME(cr(0,0+1*1) >= cdy[0]);
  ASSUME(cr(0,0+1*1) >= cisb[0]);
  ASSUME(cr(0,0+1*1) >= cdl[0]);
  ASSUME(cr(0,0+1*1) >= cl[0]);
  // Update
  creg_r11 = cr(0,0+1*1);
  crmax(0,0+1*1) = max(crmax(0,0+1*1),cr(0,0+1*1));
  caddr[0] = max(caddr[0],0);
  if(cr(0,0+1*1) < cw(0,0+1*1)) {
    r11 = buff(0,0+1*1);
    ASSUME((!(( (cw(0,0+1*1) < 1) && (1 < crmax(0,0+1*1)) )))||(sforbid(0+1*1,1)> 0));
    ASSUME((!(( (cw(0,0+1*1) < 2) && (2 < crmax(0,0+1*1)) )))||(sforbid(0+1*1,2)> 0));
    ASSUME((!(( (cw(0,0+1*1) < 3) && (3 < crmax(0,0+1*1)) )))||(sforbid(0+1*1,3)> 0));
    ASSUME((!(( (cw(0,0+1*1) < 4) && (4 < crmax(0,0+1*1)) )))||(sforbid(0+1*1,4)> 0));
  } else {
    if(pw(0,0+1*1) != co(0+1*1,cr(0,0+1*1))) {
      ASSUME(cr(0,0+1*1) >= old_cr);
    }
    pw(0,0+1*1) = co(0+1*1,cr(0,0+1*1));
    r11 = mem(0+1*1,cr(0,0+1*1));
  }
  ASSUME(creturn[0] >= cr(0,0+1*1));

  //   call void @llvm.dbg.value(metadata i64 %13, metadata !197, metadata !DIExpression()), !dbg !263

  //   %conv = trunc i64 %13 to i32, !dbg !144

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !194, metadata !DIExpression()), !dbg !216

  //   %cmp = icmp eq i32 %conv, 2, !dbg !145
  creg__r11__2_ = max(0,creg_r11);

  //   %conv20 = zext i1 %cmp to i32, !dbg !145

  //   call void @llvm.dbg.value(metadata i32 %conv20, metadata !198, metadata !DIExpression()), !dbg !216

  //   %14 = load i32, i32* @atom_3_X0_1, align 4, !dbg !146, !tbaa !115
  // LD: Guess
  old_cr = cr(0,6);
  cr(0,6) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l101_c13
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
    ASSUME((!(( (cw(0,6) < 1) && (1 < crmax(0,6)) )))||(sforbid(6,1)> 0));
    ASSUME((!(( (cw(0,6) < 2) && (2 < crmax(0,6)) )))||(sforbid(6,2)> 0));
    ASSUME((!(( (cw(0,6) < 3) && (3 < crmax(0,6)) )))||(sforbid(6,3)> 0));
    ASSUME((!(( (cw(0,6) < 4) && (4 < crmax(0,6)) )))||(sforbid(6,4)> 0));
  } else {
    if(pw(0,6) != co(6,cr(0,6))) {
      ASSUME(cr(0,6) >= old_cr);
    }
    pw(0,6) = co(6,cr(0,6));
    r12 = mem(6,cr(0,6));
  }
  ASSUME(creturn[0] >= cr(0,6));

  //   call void @llvm.dbg.value(metadata i32 %14, metadata !199, metadata !DIExpression()), !dbg !216

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 3), metadata !201, metadata !DIExpression()), !dbg !268

  //   %15 = load atomic i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !148
  // LD: Guess
  old_cr = cr(0,0+3*1);
  cr(0,0+3*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l102_c13
  // Check
  ASSUME(active[cr(0,0+3*1)] == 0);
  ASSUME(cr(0,0+3*1) >= iw(0,0+3*1));
  ASSUME(cr(0,0+3*1) >= 0);
  ASSUME(cr(0,0+3*1) >= cdy[0]);
  ASSUME(cr(0,0+3*1) >= cisb[0]);
  ASSUME(cr(0,0+3*1) >= cdl[0]);
  ASSUME(cr(0,0+3*1) >= cl[0]);
  // Update
  creg_r13 = cr(0,0+3*1);
  crmax(0,0+3*1) = max(crmax(0,0+3*1),cr(0,0+3*1));
  caddr[0] = max(caddr[0],0);
  if(cr(0,0+3*1) < cw(0,0+3*1)) {
    r13 = buff(0,0+3*1);
    ASSUME((!(( (cw(0,0+3*1) < 1) && (1 < crmax(0,0+3*1)) )))||(sforbid(0+3*1,1)> 0));
    ASSUME((!(( (cw(0,0+3*1) < 2) && (2 < crmax(0,0+3*1)) )))||(sforbid(0+3*1,2)> 0));
    ASSUME((!(( (cw(0,0+3*1) < 3) && (3 < crmax(0,0+3*1)) )))||(sforbid(0+3*1,3)> 0));
    ASSUME((!(( (cw(0,0+3*1) < 4) && (4 < crmax(0,0+3*1)) )))||(sforbid(0+3*1,4)> 0));
  } else {
    if(pw(0,0+3*1) != co(0+3*1,cr(0,0+3*1))) {
      ASSUME(cr(0,0+3*1) >= old_cr);
    }
    pw(0,0+3*1) = co(0+3*1,cr(0,0+3*1));
    r13 = mem(0+3*1,cr(0,0+3*1));
  }
  ASSUME(creturn[0] >= cr(0,0+3*1));

  //   call void @llvm.dbg.value(metadata i64 %15, metadata !203, metadata !DIExpression()), !dbg !268

  //   %conv24 = trunc i64 %15 to i32, !dbg !149

  //   call void @llvm.dbg.value(metadata i32 %conv24, metadata !200, metadata !DIExpression()), !dbg !216

  //   %cmp25 = icmp eq i32 %conv24, 2, !dbg !150
  creg__r13__2_ = max(0,creg_r13);

  //   %conv26 = zext i1 %cmp25 to i32, !dbg !150

  //   call void @llvm.dbg.value(metadata i32 %conv26, metadata !204, metadata !DIExpression()), !dbg !216

  //   %16 = load i32, i32* @atom_5_X0_1, align 4, !dbg !151, !tbaa !115
  // LD: Guess
  old_cr = cr(0,7);
  cr(0,7) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l104_c13
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
    ASSUME((!(( (cw(0,7) < 1) && (1 < crmax(0,7)) )))||(sforbid(7,1)> 0));
    ASSUME((!(( (cw(0,7) < 2) && (2 < crmax(0,7)) )))||(sforbid(7,2)> 0));
    ASSUME((!(( (cw(0,7) < 3) && (3 < crmax(0,7)) )))||(sforbid(7,3)> 0));
    ASSUME((!(( (cw(0,7) < 4) && (4 < crmax(0,7)) )))||(sforbid(7,4)> 0));
  } else {
    if(pw(0,7) != co(7,cr(0,7))) {
      ASSUME(cr(0,7) >= old_cr);
    }
    pw(0,7) = co(7,cr(0,7));
    r14 = mem(7,cr(0,7));
  }
  ASSUME(creturn[0] >= cr(0,7));

  //   call void @llvm.dbg.value(metadata i32 %16, metadata !205, metadata !DIExpression()), !dbg !216

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 0), metadata !207, metadata !DIExpression()), !dbg !273

  //   %17 = load atomic i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !153
  // LD: Guess
  old_cr = cr(0,0);
  cr(0,0) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l105_c13
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
  } else {
    if(pw(0,0) != co(0,cr(0,0))) {
      ASSUME(cr(0,0) >= old_cr);
    }
    pw(0,0) = co(0,cr(0,0));
    r15 = mem(0,cr(0,0));
  }
  ASSUME(creturn[0] >= cr(0,0));

  //   call void @llvm.dbg.value(metadata i64 %17, metadata !209, metadata !DIExpression()), !dbg !273

  //   %conv30 = trunc i64 %17 to i32, !dbg !154

  //   call void @llvm.dbg.value(metadata i32 %conv30, metadata !206, metadata !DIExpression()), !dbg !216

  //   %cmp31 = icmp eq i32 %conv30, 1, !dbg !155
  creg__r15__1_ = max(0,creg_r15);

  //   %conv32 = zext i1 %cmp31 to i32, !dbg !155

  //   call void @llvm.dbg.value(metadata i32 %conv32, metadata !210, metadata !DIExpression()), !dbg !216

  //   %and = and i32 %16, %conv32, !dbg !156
  creg_r16 = max(creg__r15__1_,creg_r14);
  r16 = r14 & (r15==1);

  //   call void @llvm.dbg.value(metadata i32 %and, metadata !211, metadata !DIExpression()), !dbg !216

  //   %and33 = and i32 %conv26, %and, !dbg !157
  creg_r17 = max(creg__r13__2_,creg_r16);
  r17 = (r13==2) & r16;

  //   call void @llvm.dbg.value(metadata i32 %and33, metadata !212, metadata !DIExpression()), !dbg !216

  //   %and34 = and i32 %14, %and33, !dbg !158
  creg_r18 = max(creg_r12,creg_r17);
  r18 = r12 & r17;

  //   call void @llvm.dbg.value(metadata i32 %and34, metadata !213, metadata !DIExpression()), !dbg !216

  //   %and35 = and i32 %conv20, %and34, !dbg !159
  creg_r19 = max(creg__r11__2_,creg_r18);
  r19 = (r11==2) & r18;

  //   call void @llvm.dbg.value(metadata i32 %and35, metadata !214, metadata !DIExpression()), !dbg !216

  //   %and36 = and i32 %12, %and35, !dbg !160
  creg_r20 = max(creg_r10,creg_r19);
  r20 = r10 & r19;

  //   call void @llvm.dbg.value(metadata i32 %and36, metadata !215, metadata !DIExpression()), !dbg !216

  //   %cmp37 = icmp eq i32 %and36, 1, !dbg !161
  creg__r20__1_ = max(0,creg_r20);

  //   br i1 %cmp37, label %if.then, label %if.end, !dbg !163
  old_cctrl = cctrl[0];
  cctrl[0] = get_rng(0,NCONTEXT-1);
  ASSUME(cctrl[0] >= old_cctrl);
  ASSUME(cctrl[0] >= creg__r20__1_);
  if((r20==1)) {
    goto T0BLOCK1;
  } else {
    goto T0BLOCK2;
  }

T0BLOCK1:
  //   call void @__assert_fail(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([131 x i8], [131 x i8]* @.str.1, i64 0, i64 0), i32 noundef 112, i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #8, !dbg !164

  //   unreachable, !dbg !164
  r21 = 1;
  goto T0BLOCK_END;

T0BLOCK2:
  //   %18 = bitcast i64* %thr5 to i8*, !dbg !167

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %18) #7, !dbg !167

  //   %19 = bitcast i64* %thr4 to i8*, !dbg !167

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %19) #7, !dbg !167

  //   %20 = bitcast i64* %thr3 to i8*, !dbg !167

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %20) #7, !dbg !167

  //   %21 = bitcast i64* %thr2 to i8*, !dbg !167

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %21) #7, !dbg !167

  //   %22 = bitcast i64* %thr1 to i8*, !dbg !167

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %22) #7, !dbg !167

  //   %23 = bitcast i64* %thr0 to i8*, !dbg !167

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %23) #7, !dbg !167

  //   ret i32 0, !dbg !168
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

  ASSERT(r21== 0);

}
