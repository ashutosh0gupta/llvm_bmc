// Global variabls:
// 7:atom_0_X4_0:1
// 0:vars:5
// 9:atom_2_X0_1:1
// 5:atom_0_X0_1:1
// 6:atom_0_X2_1:1
// 8:atom_1_X2_1:1
// Local global variabls:
// 0:thr0:1
// 1:thr1:1
// 2:thr2:1
#define ADDRSIZE 10
#define LOCALADDRSIZE 3
#define NTHREAD 4
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

  int r0= 0;
  char creg_r0;
  int r1= 0;
  char creg_r1;
  int r2= 0;
  char creg_r2;
  char creg__r0__1_;
  char creg__r1__1_;
  char creg__r2__0_;
  int r3= 0;
  char creg_r3;
  char creg__r3__1_;
  int r4= 0;
  char creg_r4;
  char creg__r4__1_;
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
  char creg__r17__1_;
  int r18= 0;
  char creg_r18;
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
  // Dumping initializations
  mem(7+0,0) = 0;
  mem(0+0,0) = 0;
  mem(0+1,0) = 0;
  mem(0+2,0) = 0;
  mem(0+3,0) = 0;
  mem(0+4,0) = 0;
  mem(9+0,0) = 0;
  mem(5+0,0) = 0;
  mem(6+0,0) = 0;
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
  // Dumping thread 1
  int ret_thread_1 = 0;
  cdy[1] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[1] >= cstart[1]);
T1BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !42, metadata !DIExpression()), !dbg !63

  //   br label %label_1, !dbg !64
  goto T1BLOCK1;

T1BLOCK1:
  //   call void @llvm.dbg.label(metadata !62), !dbg !65

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 0), metadata !44, metadata !DIExpression()), !dbg !66

  //   %0 = load atomic i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !67
  // LD: Guess
  old_cr = cr(1,0);
  cr(1,0) = get_rng(0,NCONTEXT-1);// 1 ASSIGN LDCOM _l23_c15
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
  } else {
    if(pw(1,0) != co(0,cr(1,0))) {
      ASSUME(cr(1,0) >= old_cr);
    }
    pw(1,0) = co(0,cr(1,0));
    r0 = mem(0,cr(1,0));
  }
  ASSUME(creturn[1] >= cr(1,0));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !47, metadata !DIExpression()), !dbg !66

  //   %conv = trunc i64 %0 to i32, !dbg !68

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !43, metadata !DIExpression()), !dbg !63

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 1), metadata !48, metadata !DIExpression()), !dbg !69

  //   %conv1 = sext i32 %conv to i64, !dbg !70

  //   call void @llvm.dbg.value(metadata i64 %conv1, metadata !50, metadata !DIExpression()), !dbg !69

  //   store atomic i64 %conv1, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !70
  // ST: Guess
  iw(1,0+1*1) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW _l24_c3
  old_cw = cw(1,0+1*1);
  cw(1,0+1*1) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM _l24_c3
  // Check
  ASSUME(active[iw(1,0+1*1)] == 1);
  ASSUME(active[cw(1,0+1*1)] == 1);
  ASSUME(sforbid(0+1*1,cw(1,0+1*1))== 0);
  ASSUME(iw(1,0+1*1) >= creg_r0);
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
  buff(1,0+1*1) = r0;
  mem(0+1*1,cw(1,0+1*1)) = r0;
  co(0+1*1,cw(1,0+1*1))+=1;
  delta(0+1*1,cw(1,0+1*1)) = -1;
  ASSUME(creturn[1] >= cw(1,0+1*1));

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 2), metadata !52, metadata !DIExpression()), !dbg !71

  //   %1 = load atomic i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 2) acquire, align 8, !dbg !72
  // LD: Guess
  //   : Acquire
  old_cr = cr(1,0+2*1);
  cr(1,0+2*1) = get_rng(0,NCONTEXT-1);// 1 ASSIGN LDCOM _l25_c15
  // Check
  ASSUME(active[cr(1,0+2*1)] == 1);
  ASSUME(cr(1,0+2*1) >= iw(1,0+2*1));
  ASSUME(cr(1,0+2*1) >= 0);
  ASSUME(cr(1,0+2*1) >= cdy[1]);
  ASSUME(cr(1,0+2*1) >= cisb[1]);
  ASSUME(cr(1,0+2*1) >= cdl[1]);
  ASSUME(cr(1,0+2*1) >= cl[1]);
  ASSUME(cr(1,0+2*1) >= cx(1,0+2*1));
  ASSUME(cr(1,0+2*1) >= cs(1,7+0));
  ASSUME(cr(1,0+2*1) >= cs(1,0+0));
  ASSUME(cr(1,0+2*1) >= cs(1,0+1));
  ASSUME(cr(1,0+2*1) >= cs(1,0+2));
  ASSUME(cr(1,0+2*1) >= cs(1,0+3));
  ASSUME(cr(1,0+2*1) >= cs(1,0+4));
  ASSUME(cr(1,0+2*1) >= cs(1,9+0));
  ASSUME(cr(1,0+2*1) >= cs(1,5+0));
  ASSUME(cr(1,0+2*1) >= cs(1,6+0));
  ASSUME(cr(1,0+2*1) >= cs(1,8+0));
  // Update
  creg_r1 = cr(1,0+2*1);
  crmax(1,0+2*1) = max(crmax(1,0+2*1),cr(1,0+2*1));
  caddr[1] = max(caddr[1],0);
  if(cr(1,0+2*1) < cw(1,0+2*1)) {
    r1 = buff(1,0+2*1);
    ASSUME((!(( (cw(1,0+2*1) < 1) && (1 < crmax(1,0+2*1)) )))||(sforbid(0+2*1,1)> 0));
    ASSUME((!(( (cw(1,0+2*1) < 2) && (2 < crmax(1,0+2*1)) )))||(sforbid(0+2*1,2)> 0));
    ASSUME((!(( (cw(1,0+2*1) < 3) && (3 < crmax(1,0+2*1)) )))||(sforbid(0+2*1,3)> 0));
    ASSUME((!(( (cw(1,0+2*1) < 4) && (4 < crmax(1,0+2*1)) )))||(sforbid(0+2*1,4)> 0));
  } else {
    if(pw(1,0+2*1) != co(0+2*1,cr(1,0+2*1))) {
      ASSUME(cr(1,0+2*1) >= old_cr);
    }
    pw(1,0+2*1) = co(0+2*1,cr(1,0+2*1));
    r1 = mem(0+2*1,cr(1,0+2*1));
  }
  cl[1] = max(cl[1],cr(1,0+2*1));
  ASSUME(creturn[1] >= cr(1,0+2*1));

  //   call void @llvm.dbg.value(metadata i64 %1, metadata !54, metadata !DIExpression()), !dbg !71

  //   %conv5 = trunc i64 %1 to i32, !dbg !73

  //   call void @llvm.dbg.value(metadata i32 %conv5, metadata !51, metadata !DIExpression()), !dbg !63

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 3), metadata !56, metadata !DIExpression()), !dbg !74

  //   %2 = load atomic i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !75
  // LD: Guess
  old_cr = cr(1,0+3*1);
  cr(1,0+3*1) = get_rng(0,NCONTEXT-1);// 1 ASSIGN LDCOM _l26_c15
  // Check
  ASSUME(active[cr(1,0+3*1)] == 1);
  ASSUME(cr(1,0+3*1) >= iw(1,0+3*1));
  ASSUME(cr(1,0+3*1) >= 0);
  ASSUME(cr(1,0+3*1) >= cdy[1]);
  ASSUME(cr(1,0+3*1) >= cisb[1]);
  ASSUME(cr(1,0+3*1) >= cdl[1]);
  ASSUME(cr(1,0+3*1) >= cl[1]);
  // Update
  creg_r2 = cr(1,0+3*1);
  crmax(1,0+3*1) = max(crmax(1,0+3*1),cr(1,0+3*1));
  caddr[1] = max(caddr[1],0);
  if(cr(1,0+3*1) < cw(1,0+3*1)) {
    r2 = buff(1,0+3*1);
    ASSUME((!(( (cw(1,0+3*1) < 1) && (1 < crmax(1,0+3*1)) )))||(sforbid(0+3*1,1)> 0));
    ASSUME((!(( (cw(1,0+3*1) < 2) && (2 < crmax(1,0+3*1)) )))||(sforbid(0+3*1,2)> 0));
    ASSUME((!(( (cw(1,0+3*1) < 3) && (3 < crmax(1,0+3*1)) )))||(sforbid(0+3*1,3)> 0));
    ASSUME((!(( (cw(1,0+3*1) < 4) && (4 < crmax(1,0+3*1)) )))||(sforbid(0+3*1,4)> 0));
  } else {
    if(pw(1,0+3*1) != co(0+3*1,cr(1,0+3*1))) {
      ASSUME(cr(1,0+3*1) >= old_cr);
    }
    pw(1,0+3*1) = co(0+3*1,cr(1,0+3*1));
    r2 = mem(0+3*1,cr(1,0+3*1));
  }
  ASSUME(creturn[1] >= cr(1,0+3*1));

  //   call void @llvm.dbg.value(metadata i64 %2, metadata !58, metadata !DIExpression()), !dbg !74

  //   %conv9 = trunc i64 %2 to i32, !dbg !76

  //   call void @llvm.dbg.value(metadata i32 %conv9, metadata !55, metadata !DIExpression()), !dbg !63

  //   %cmp = icmp eq i32 %conv, 1, !dbg !77
  creg__r0__1_ = max(0,creg_r0);

  //   %conv10 = zext i1 %cmp to i32, !dbg !77

  //   call void @llvm.dbg.value(metadata i32 %conv10, metadata !59, metadata !DIExpression()), !dbg !63

  //   store i32 %conv10, i32* @atom_0_X0_1, align 4, !dbg !78, !tbaa !79
  // ST: Guess
  iw(1,5) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW _l28_c15
  old_cw = cw(1,5);
  cw(1,5) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM _l28_c15
  // Check
  ASSUME(active[iw(1,5)] == 1);
  ASSUME(active[cw(1,5)] == 1);
  ASSUME(sforbid(5,cw(1,5))== 0);
  ASSUME(iw(1,5) >= creg__r0__1_);
  ASSUME(iw(1,5) >= 0);
  ASSUME(cw(1,5) >= iw(1,5));
  ASSUME(cw(1,5) >= old_cw);
  ASSUME(cw(1,5) >= cr(1,5));
  ASSUME(cw(1,5) >= cl[1]);
  ASSUME(cw(1,5) >= cisb[1]);
  ASSUME(cw(1,5) >= cdy[1]);
  ASSUME(cw(1,5) >= cdl[1]);
  ASSUME(cw(1,5) >= cds[1]);
  ASSUME(cw(1,5) >= cctrl[1]);
  ASSUME(cw(1,5) >= caddr[1]);
  // Update
  caddr[1] = max(caddr[1],0);
  buff(1,5) = (r0==1);
  mem(5,cw(1,5)) = (r0==1);
  co(5,cw(1,5))+=1;
  delta(5,cw(1,5)) = -1;
  ASSUME(creturn[1] >= cw(1,5));

  //   %cmp11 = icmp eq i32 %conv5, 1, !dbg !83
  creg__r1__1_ = max(0,creg_r1);

  //   %conv12 = zext i1 %cmp11 to i32, !dbg !83

  //   call void @llvm.dbg.value(metadata i32 %conv12, metadata !60, metadata !DIExpression()), !dbg !63

  //   store i32 %conv12, i32* @atom_0_X2_1, align 4, !dbg !84, !tbaa !79
  // ST: Guess
  iw(1,6) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW _l30_c15
  old_cw = cw(1,6);
  cw(1,6) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM _l30_c15
  // Check
  ASSUME(active[iw(1,6)] == 1);
  ASSUME(active[cw(1,6)] == 1);
  ASSUME(sforbid(6,cw(1,6))== 0);
  ASSUME(iw(1,6) >= creg__r1__1_);
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
  buff(1,6) = (r1==1);
  mem(6,cw(1,6)) = (r1==1);
  co(6,cw(1,6))+=1;
  delta(6,cw(1,6)) = -1;
  ASSUME(creturn[1] >= cw(1,6));

  //   %cmp13 = icmp eq i32 %conv9, 0, !dbg !85
  creg__r2__0_ = max(0,creg_r2);

  //   %conv14 = zext i1 %cmp13 to i32, !dbg !85

  //   call void @llvm.dbg.value(metadata i32 %conv14, metadata !61, metadata !DIExpression()), !dbg !63

  //   store i32 %conv14, i32* @atom_0_X4_0, align 4, !dbg !86, !tbaa !79
  // ST: Guess
  iw(1,7) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW _l32_c15
  old_cw = cw(1,7);
  cw(1,7) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM _l32_c15
  // Check
  ASSUME(active[iw(1,7)] == 1);
  ASSUME(active[cw(1,7)] == 1);
  ASSUME(sforbid(7,cw(1,7))== 0);
  ASSUME(iw(1,7) >= creg__r2__0_);
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

  //   ret i8* null, !dbg !87
  ret_thread_1 = (- 1);
  goto T1BLOCK_END;

T1BLOCK_END:

  // Dumping thread 2
  int ret_thread_2 = 0;
  cdy[2] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[2] >= cstart[2]);
T2BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !90, metadata !DIExpression()), !dbg !106

  //   br label %label_2, !dbg !60
  goto T2BLOCK1;

T2BLOCK1:
  //   call void @llvm.dbg.label(metadata !105), !dbg !108

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 3), metadata !91, metadata !DIExpression()), !dbg !109

  //   call void @llvm.dbg.value(metadata i64 1, metadata !93, metadata !DIExpression()), !dbg !109

  //   store atomic i64 1, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !63
  // ST: Guess
  iw(2,0+3*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW _l38_c3
  old_cw = cw(2,0+3*1);
  cw(2,0+3*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM _l38_c3
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
  // Update
  caddr[2] = max(caddr[2],0);
  buff(2,0+3*1) = 1;
  mem(0+3*1,cw(2,0+3*1)) = 1;
  co(0+3*1,cw(2,0+3*1))+=1;
  delta(0+3*1,cw(2,0+3*1)) = -1;
  ASSUME(creturn[2] >= cw(2,0+3*1));

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 0), metadata !94, metadata !DIExpression()), !dbg !111

  //   call void @llvm.dbg.value(metadata i64 1, metadata !96, metadata !DIExpression()), !dbg !111

  //   store atomic i64 1, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 0) release, align 8, !dbg !65
  // ST: Guess
  //   : Release
  iw(2,0) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW _l39_c3
  old_cw = cw(2,0);
  cw(2,0) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM _l39_c3
  // Check
  ASSUME(active[iw(2,0)] == 2);
  ASSUME(active[cw(2,0)] == 2);
  ASSUME(sforbid(0,cw(2,0))== 0);
  ASSUME(iw(2,0) >= 0);
  ASSUME(iw(2,0) >= 0);
  ASSUME(cw(2,0) >= iw(2,0));
  ASSUME(cw(2,0) >= old_cw);
  ASSUME(cw(2,0) >= cr(2,0));
  ASSUME(cw(2,0) >= cl[2]);
  ASSUME(cw(2,0) >= cisb[2]);
  ASSUME(cw(2,0) >= cdy[2]);
  ASSUME(cw(2,0) >= cdl[2]);
  ASSUME(cw(2,0) >= cds[2]);
  ASSUME(cw(2,0) >= cctrl[2]);
  ASSUME(cw(2,0) >= caddr[2]);
  ASSUME(cw(2,0) >= cr(2,7+0));
  ASSUME(cw(2,0) >= cr(2,0+0));
  ASSUME(cw(2,0) >= cr(2,0+1));
  ASSUME(cw(2,0) >= cr(2,0+2));
  ASSUME(cw(2,0) >= cr(2,0+3));
  ASSUME(cw(2,0) >= cr(2,0+4));
  ASSUME(cw(2,0) >= cr(2,9+0));
  ASSUME(cw(2,0) >= cr(2,5+0));
  ASSUME(cw(2,0) >= cr(2,6+0));
  ASSUME(cw(2,0) >= cr(2,8+0));
  ASSUME(cw(2,0) >= cw(2,7+0));
  ASSUME(cw(2,0) >= cw(2,0+0));
  ASSUME(cw(2,0) >= cw(2,0+1));
  ASSUME(cw(2,0) >= cw(2,0+2));
  ASSUME(cw(2,0) >= cw(2,0+3));
  ASSUME(cw(2,0) >= cw(2,0+4));
  ASSUME(cw(2,0) >= cw(2,9+0));
  ASSUME(cw(2,0) >= cw(2,5+0));
  ASSUME(cw(2,0) >= cw(2,6+0));
  ASSUME(cw(2,0) >= cw(2,8+0));
  // Update
  caddr[2] = max(caddr[2],0);
  buff(2,0) = 1;
  mem(0,cw(2,0)) = 1;
  co(0,cw(2,0))+=1;
  delta(0,cw(2,0)) = -1;
  is(2,0) = iw(2,0);
  cs(2,0) = cw(2,0);
  ASSUME(creturn[2] >= cw(2,0));

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 1), metadata !98, metadata !DIExpression()), !dbg !113

  //   %0 = load atomic i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !67
  // LD: Guess
  old_cr = cr(2,0+1*1);
  cr(2,0+1*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN LDCOM _l40_c16
  // Check
  ASSUME(active[cr(2,0+1*1)] == 2);
  ASSUME(cr(2,0+1*1) >= iw(2,0+1*1));
  ASSUME(cr(2,0+1*1) >= 0);
  ASSUME(cr(2,0+1*1) >= cdy[2]);
  ASSUME(cr(2,0+1*1) >= cisb[2]);
  ASSUME(cr(2,0+1*1) >= cdl[2]);
  ASSUME(cr(2,0+1*1) >= cl[2]);
  // Update
  creg_r3 = cr(2,0+1*1);
  crmax(2,0+1*1) = max(crmax(2,0+1*1),cr(2,0+1*1));
  caddr[2] = max(caddr[2],0);
  if(cr(2,0+1*1) < cw(2,0+1*1)) {
    r3 = buff(2,0+1*1);
    ASSUME((!(( (cw(2,0+1*1) < 1) && (1 < crmax(2,0+1*1)) )))||(sforbid(0+1*1,1)> 0));
    ASSUME((!(( (cw(2,0+1*1) < 2) && (2 < crmax(2,0+1*1)) )))||(sforbid(0+1*1,2)> 0));
    ASSUME((!(( (cw(2,0+1*1) < 3) && (3 < crmax(2,0+1*1)) )))||(sforbid(0+1*1,3)> 0));
    ASSUME((!(( (cw(2,0+1*1) < 4) && (4 < crmax(2,0+1*1)) )))||(sforbid(0+1*1,4)> 0));
  } else {
    if(pw(2,0+1*1) != co(0+1*1,cr(2,0+1*1))) {
      ASSUME(cr(2,0+1*1) >= old_cr);
    }
    pw(2,0+1*1) = co(0+1*1,cr(2,0+1*1));
    r3 = mem(0+1*1,cr(2,0+1*1));
  }
  ASSUME(creturn[2] >= cr(2,0+1*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !100, metadata !DIExpression()), !dbg !113

  //   %conv = trunc i64 %0 to i32, !dbg !68

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !97, metadata !DIExpression()), !dbg !106

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 4), metadata !101, metadata !DIExpression()), !dbg !116

  //   %conv5 = sext i32 %conv to i64, !dbg !70

  //   call void @llvm.dbg.value(metadata i64 %conv5, metadata !103, metadata !DIExpression()), !dbg !116

  //   store atomic i64 %conv5, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 4) monotonic, align 8, !dbg !70
  // ST: Guess
  iw(2,0+4*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW _l41_c3
  old_cw = cw(2,0+4*1);
  cw(2,0+4*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM _l41_c3
  // Check
  ASSUME(active[iw(2,0+4*1)] == 2);
  ASSUME(active[cw(2,0+4*1)] == 2);
  ASSUME(sforbid(0+4*1,cw(2,0+4*1))== 0);
  ASSUME(iw(2,0+4*1) >= creg_r3);
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
  buff(2,0+4*1) = r3;
  mem(0+4*1,cw(2,0+4*1)) = r3;
  co(0+4*1,cw(2,0+4*1))+=1;
  delta(0+4*1,cw(2,0+4*1)) = -1;
  ASSUME(creturn[2] >= cw(2,0+4*1));

  //   %cmp = icmp eq i32 %conv, 1, !dbg !71
  creg__r3__1_ = max(0,creg_r3);

  //   %conv6 = zext i1 %cmp to i32, !dbg !71

  //   call void @llvm.dbg.value(metadata i32 %conv6, metadata !104, metadata !DIExpression()), !dbg !106

  //   store i32 %conv6, i32* @atom_1_X2_1, align 4, !dbg !72, !tbaa !73
  // ST: Guess
  iw(2,8) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW _l43_c15
  old_cw = cw(2,8);
  cw(2,8) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM _l43_c15
  // Check
  ASSUME(active[iw(2,8)] == 2);
  ASSUME(active[cw(2,8)] == 2);
  ASSUME(sforbid(8,cw(2,8))== 0);
  ASSUME(iw(2,8) >= creg__r3__1_);
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
  buff(2,8) = (r3==1);
  mem(8,cw(2,8)) = (r3==1);
  co(8,cw(2,8))+=1;
  delta(8,cw(2,8)) = -1;
  ASSUME(creturn[2] >= cw(2,8));

  //   ret i8* null, !dbg !77
  ret_thread_2 = (- 1);
  goto T2BLOCK_END;

T2BLOCK_END:

  // Dumping thread 3
  int ret_thread_3 = 0;
  cdy[3] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[3] >= cstart[3]);
T3BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !123, metadata !DIExpression()), !dbg !133

  //   br label %label_3, !dbg !54
  goto T3BLOCK1;

T3BLOCK1:
  //   call void @llvm.dbg.label(metadata !132), !dbg !135

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 4), metadata !125, metadata !DIExpression()), !dbg !136

  //   %0 = load atomic i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 4) monotonic, align 8, !dbg !57
  // LD: Guess
  old_cr = cr(3,0+4*1);
  cr(3,0+4*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN LDCOM _l49_c16
  // Check
  ASSUME(active[cr(3,0+4*1)] == 3);
  ASSUME(cr(3,0+4*1) >= iw(3,0+4*1));
  ASSUME(cr(3,0+4*1) >= 0);
  ASSUME(cr(3,0+4*1) >= cdy[3]);
  ASSUME(cr(3,0+4*1) >= cisb[3]);
  ASSUME(cr(3,0+4*1) >= cdl[3]);
  ASSUME(cr(3,0+4*1) >= cl[3]);
  // Update
  creg_r4 = cr(3,0+4*1);
  crmax(3,0+4*1) = max(crmax(3,0+4*1),cr(3,0+4*1));
  caddr[3] = max(caddr[3],0);
  if(cr(3,0+4*1) < cw(3,0+4*1)) {
    r4 = buff(3,0+4*1);
    ASSUME((!(( (cw(3,0+4*1) < 1) && (1 < crmax(3,0+4*1)) )))||(sforbid(0+4*1,1)> 0));
    ASSUME((!(( (cw(3,0+4*1) < 2) && (2 < crmax(3,0+4*1)) )))||(sforbid(0+4*1,2)> 0));
    ASSUME((!(( (cw(3,0+4*1) < 3) && (3 < crmax(3,0+4*1)) )))||(sforbid(0+4*1,3)> 0));
    ASSUME((!(( (cw(3,0+4*1) < 4) && (4 < crmax(3,0+4*1)) )))||(sforbid(0+4*1,4)> 0));
  } else {
    if(pw(3,0+4*1) != co(0+4*1,cr(3,0+4*1))) {
      ASSUME(cr(3,0+4*1) >= old_cr);
    }
    pw(3,0+4*1) = co(0+4*1,cr(3,0+4*1));
    r4 = mem(0+4*1,cr(3,0+4*1));
  }
  ASSUME(creturn[3] >= cr(3,0+4*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !127, metadata !DIExpression()), !dbg !136

  //   %conv = trunc i64 %0 to i32, !dbg !58

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !124, metadata !DIExpression()), !dbg !133

  //   call void (...) @dmbsy(), !dbg !59
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
  ASSUME(cdy[3] >= cw(3,9+0));
  ASSUME(cdy[3] >= cw(3,5+0));
  ASSUME(cdy[3] >= cw(3,6+0));
  ASSUME(cdy[3] >= cw(3,8+0));
  ASSUME(cdy[3] >= cr(3,7+0));
  ASSUME(cdy[3] >= cr(3,0+0));
  ASSUME(cdy[3] >= cr(3,0+1));
  ASSUME(cdy[3] >= cr(3,0+2));
  ASSUME(cdy[3] >= cr(3,0+3));
  ASSUME(cdy[3] >= cr(3,0+4));
  ASSUME(cdy[3] >= cr(3,9+0));
  ASSUME(cdy[3] >= cr(3,5+0));
  ASSUME(cdy[3] >= cr(3,6+0));
  ASSUME(cdy[3] >= cr(3,8+0));
  ASSUME(creturn[3] >= cdy[3]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 2), metadata !128, metadata !DIExpression()), !dbg !140

  //   call void @llvm.dbg.value(metadata i64 1, metadata !130, metadata !DIExpression()), !dbg !140

  //   store atomic i64 1, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 2) monotonic, align 8, !dbg !61
  // ST: Guess
  iw(3,0+2*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STIW _l51_c3
  old_cw = cw(3,0+2*1);
  cw(3,0+2*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STCOM _l51_c3
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

  //   %cmp = icmp eq i32 %conv, 1, !dbg !62
  creg__r4__1_ = max(0,creg_r4);

  //   %conv1 = zext i1 %cmp to i32, !dbg !62

  //   call void @llvm.dbg.value(metadata i32 %conv1, metadata !131, metadata !DIExpression()), !dbg !133

  //   store i32 %conv1, i32* @atom_2_X0_1, align 4, !dbg !63, !tbaa !64
  // ST: Guess
  iw(3,9) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STIW _l53_c15
  old_cw = cw(3,9);
  cw(3,9) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STCOM _l53_c15
  // Check
  ASSUME(active[iw(3,9)] == 3);
  ASSUME(active[cw(3,9)] == 3);
  ASSUME(sforbid(9,cw(3,9))== 0);
  ASSUME(iw(3,9) >= creg__r4__1_);
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
  buff(3,9) = (r4==1);
  mem(9,cw(3,9)) = (r4==1);
  co(9,cw(3,9))+=1;
  delta(9,cw(3,9)) = -1;
  ASSUME(creturn[3] >= cw(3,9));

  //   ret i8* null, !dbg !68
  ret_thread_3 = (- 1);
  goto T3BLOCK_END;

T3BLOCK_END:

  // Dumping thread 0
  int ret_thread_0 = 0;
  cdy[0] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[0] >= cstart[0]);
T0BLOCK0:
  //   %thr0 = alloca i64, align 8

  //   %thr1 = alloca i64, align 8

  //   %thr2 = alloca i64, align 8

  //   call void @llvm.dbg.value(metadata i32 %argc, metadata !152, metadata !DIExpression()), !dbg !184

  //   call void @llvm.dbg.value(metadata i8** %argv, metadata !153, metadata !DIExpression()), !dbg !184

  //   %0 = bitcast i64* %thr0 to i8*, !dbg !79

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #7, !dbg !79

  //   call void @llvm.dbg.declare(metadata i64* %thr0, metadata !154, metadata !DIExpression()), !dbg !186

  //   %1 = bitcast i64* %thr1 to i8*, !dbg !81

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #7, !dbg !81

  //   call void @llvm.dbg.declare(metadata i64* %thr1, metadata !158, metadata !DIExpression()), !dbg !188

  //   %2 = bitcast i64* %thr2 to i8*, !dbg !83

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #7, !dbg !83

  //   call void @llvm.dbg.declare(metadata i64* %thr2, metadata !159, metadata !DIExpression()), !dbg !190

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 4), metadata !160, metadata !DIExpression()), !dbg !191

  //   call void @llvm.dbg.value(metadata i64 0, metadata !162, metadata !DIExpression()), !dbg !191

  //   store atomic i64 0, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 4) monotonic, align 8, !dbg !86
  // ST: Guess
  iw(0,0+4*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l62_c3
  old_cw = cw(0,0+4*1);
  cw(0,0+4*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l62_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 3), metadata !163, metadata !DIExpression()), !dbg !193

  //   call void @llvm.dbg.value(metadata i64 0, metadata !165, metadata !DIExpression()), !dbg !193

  //   store atomic i64 0, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !88
  // ST: Guess
  iw(0,0+3*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l63_c3
  old_cw = cw(0,0+3*1);
  cw(0,0+3*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l63_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 2), metadata !166, metadata !DIExpression()), !dbg !195

  //   call void @llvm.dbg.value(metadata i64 0, metadata !168, metadata !DIExpression()), !dbg !195

  //   store atomic i64 0, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 2) monotonic, align 8, !dbg !90
  // ST: Guess
  iw(0,0+2*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l64_c3
  old_cw = cw(0,0+2*1);
  cw(0,0+2*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l64_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 1), metadata !169, metadata !DIExpression()), !dbg !197

  //   call void @llvm.dbg.value(metadata i64 0, metadata !171, metadata !DIExpression()), !dbg !197

  //   store atomic i64 0, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !92
  // ST: Guess
  iw(0,0+1*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l65_c3
  old_cw = cw(0,0+1*1);
  cw(0,0+1*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l65_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 0), metadata !172, metadata !DIExpression()), !dbg !199

  //   call void @llvm.dbg.value(metadata i64 0, metadata !174, metadata !DIExpression()), !dbg !199

  //   store atomic i64 0, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !94
  // ST: Guess
  iw(0,0) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l66_c3
  old_cw = cw(0,0);
  cw(0,0) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l66_c3
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

  //   store i32 0, i32* @atom_0_X0_1, align 4, !dbg !95, !tbaa !96
  // ST: Guess
  iw(0,5) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l67_c15
  old_cw = cw(0,5);
  cw(0,5) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l67_c15
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

  //   store i32 0, i32* @atom_0_X2_1, align 4, !dbg !100, !tbaa !96
  // ST: Guess
  iw(0,6) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l68_c15
  old_cw = cw(0,6);
  cw(0,6) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l68_c15
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

  //   store i32 0, i32* @atom_0_X4_0, align 4, !dbg !101, !tbaa !96
  // ST: Guess
  iw(0,7) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l69_c15
  old_cw = cw(0,7);
  cw(0,7) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l69_c15
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

  //   store i32 0, i32* @atom_1_X2_1, align 4, !dbg !102, !tbaa !96
  // ST: Guess
  iw(0,8) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l70_c15
  old_cw = cw(0,8);
  cw(0,8) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l70_c15
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

  //   store i32 0, i32* @atom_2_X0_1, align 4, !dbg !103, !tbaa !96
  // ST: Guess
  iw(0,9) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l71_c15
  old_cw = cw(0,9);
  cw(0,9) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l71_c15
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

  //   %call = call i32 @pthread_create(i64* noundef %thr0, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t0, i8* noundef null) #7, !dbg !104
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
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[1] >= cdy[0]);

  //   %call9 = call i32 @pthread_create(i64* noundef %thr1, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t1, i8* noundef null) #7, !dbg !105
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
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[2] >= cdy[0]);

  //   %call10 = call i32 @pthread_create(i64* noundef %thr2, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t2, i8* noundef null) #7, !dbg !106
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
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[3] >= cdy[0]);

  //   %3 = load i64, i64* %thr0, align 8, !dbg !107, !tbaa !108
  r6 = local_mem[0];

  //   %call11 = call i32 @pthread_join(i64 noundef %3, i8** noundef null), !dbg !110
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
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[1]);

  //   %4 = load i64, i64* %thr1, align 8, !dbg !111, !tbaa !108
  r7 = local_mem[1];

  //   %call12 = call i32 @pthread_join(i64 noundef %4, i8** noundef null), !dbg !112
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
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[2]);

  //   %5 = load i64, i64* %thr2, align 8, !dbg !113, !tbaa !108
  r8 = local_mem[2];

  //   %call13 = call i32 @pthread_join(i64 noundef %5, i8** noundef null), !dbg !114
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
  ASSUME(cdy[0] >= cw(0,9+0));
  ASSUME(cdy[0] >= cw(0,5+0));
  ASSUME(cdy[0] >= cw(0,6+0));
  ASSUME(cdy[0] >= cw(0,8+0));
  ASSUME(cdy[0] >= cr(0,7+0));
  ASSUME(cdy[0] >= cr(0,0+0));
  ASSUME(cdy[0] >= cr(0,0+1));
  ASSUME(cdy[0] >= cr(0,0+2));
  ASSUME(cdy[0] >= cr(0,0+3));
  ASSUME(cdy[0] >= cr(0,0+4));
  ASSUME(cdy[0] >= cr(0,9+0));
  ASSUME(cdy[0] >= cr(0,5+0));
  ASSUME(cdy[0] >= cr(0,6+0));
  ASSUME(cdy[0] >= cr(0,8+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[3]);

  //   %6 = load i32, i32* @atom_0_X0_1, align 4, !dbg !115, !tbaa !96
  // LD: Guess
  old_cr = cr(0,5);
  cr(0,5) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l81_c13
  // Check
  ASSUME(active[cr(0,5)] == 0);
  ASSUME(cr(0,5) >= iw(0,5));
  ASSUME(cr(0,5) >= 0);
  ASSUME(cr(0,5) >= cdy[0]);
  ASSUME(cr(0,5) >= cisb[0]);
  ASSUME(cr(0,5) >= cdl[0]);
  ASSUME(cr(0,5) >= cl[0]);
  // Update
  creg_r9 = cr(0,5);
  crmax(0,5) = max(crmax(0,5),cr(0,5));
  caddr[0] = max(caddr[0],0);
  if(cr(0,5) < cw(0,5)) {
    r9 = buff(0,5);
    ASSUME((!(( (cw(0,5) < 1) && (1 < crmax(0,5)) )))||(sforbid(5,1)> 0));
    ASSUME((!(( (cw(0,5) < 2) && (2 < crmax(0,5)) )))||(sforbid(5,2)> 0));
    ASSUME((!(( (cw(0,5) < 3) && (3 < crmax(0,5)) )))||(sforbid(5,3)> 0));
    ASSUME((!(( (cw(0,5) < 4) && (4 < crmax(0,5)) )))||(sforbid(5,4)> 0));
  } else {
    if(pw(0,5) != co(5,cr(0,5))) {
      ASSUME(cr(0,5) >= old_cr);
    }
    pw(0,5) = co(5,cr(0,5));
    r9 = mem(5,cr(0,5));
  }
  ASSUME(creturn[0] >= cr(0,5));

  //   call void @llvm.dbg.value(metadata i32 %6, metadata !175, metadata !DIExpression()), !dbg !184

  //   %7 = load i32, i32* @atom_0_X2_1, align 4, !dbg !116, !tbaa !96
  // LD: Guess
  old_cr = cr(0,6);
  cr(0,6) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l82_c13
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
  } else {
    if(pw(0,6) != co(6,cr(0,6))) {
      ASSUME(cr(0,6) >= old_cr);
    }
    pw(0,6) = co(6,cr(0,6));
    r10 = mem(6,cr(0,6));
  }
  ASSUME(creturn[0] >= cr(0,6));

  //   call void @llvm.dbg.value(metadata i32 %7, metadata !176, metadata !DIExpression()), !dbg !184

  //   %8 = load i32, i32* @atom_0_X4_0, align 4, !dbg !117, !tbaa !96
  // LD: Guess
  old_cr = cr(0,7);
  cr(0,7) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l83_c13
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
  } else {
    if(pw(0,7) != co(7,cr(0,7))) {
      ASSUME(cr(0,7) >= old_cr);
    }
    pw(0,7) = co(7,cr(0,7));
    r11 = mem(7,cr(0,7));
  }
  ASSUME(creturn[0] >= cr(0,7));

  //   call void @llvm.dbg.value(metadata i32 %8, metadata !177, metadata !DIExpression()), !dbg !184

  //   %9 = load i32, i32* @atom_1_X2_1, align 4, !dbg !118, !tbaa !96
  // LD: Guess
  old_cr = cr(0,8);
  cr(0,8) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l84_c13
  // Check
  ASSUME(active[cr(0,8)] == 0);
  ASSUME(cr(0,8) >= iw(0,8));
  ASSUME(cr(0,8) >= 0);
  ASSUME(cr(0,8) >= cdy[0]);
  ASSUME(cr(0,8) >= cisb[0]);
  ASSUME(cr(0,8) >= cdl[0]);
  ASSUME(cr(0,8) >= cl[0]);
  // Update
  creg_r12 = cr(0,8);
  crmax(0,8) = max(crmax(0,8),cr(0,8));
  caddr[0] = max(caddr[0],0);
  if(cr(0,8) < cw(0,8)) {
    r12 = buff(0,8);
    ASSUME((!(( (cw(0,8) < 1) && (1 < crmax(0,8)) )))||(sforbid(8,1)> 0));
    ASSUME((!(( (cw(0,8) < 2) && (2 < crmax(0,8)) )))||(sforbid(8,2)> 0));
    ASSUME((!(( (cw(0,8) < 3) && (3 < crmax(0,8)) )))||(sforbid(8,3)> 0));
    ASSUME((!(( (cw(0,8) < 4) && (4 < crmax(0,8)) )))||(sforbid(8,4)> 0));
  } else {
    if(pw(0,8) != co(8,cr(0,8))) {
      ASSUME(cr(0,8) >= old_cr);
    }
    pw(0,8) = co(8,cr(0,8));
    r12 = mem(8,cr(0,8));
  }
  ASSUME(creturn[0] >= cr(0,8));

  //   call void @llvm.dbg.value(metadata i32 %9, metadata !178, metadata !DIExpression()), !dbg !184

  //   %10 = load i32, i32* @atom_2_X0_1, align 4, !dbg !119, !tbaa !96
  // LD: Guess
  old_cr = cr(0,9);
  cr(0,9) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l85_c13
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
  } else {
    if(pw(0,9) != co(9,cr(0,9))) {
      ASSUME(cr(0,9) >= old_cr);
    }
    pw(0,9) = co(9,cr(0,9));
    r13 = mem(9,cr(0,9));
  }
  ASSUME(creturn[0] >= cr(0,9));

  //   call void @llvm.dbg.value(metadata i32 %10, metadata !179, metadata !DIExpression()), !dbg !184

  //   %and = and i32 %9, %10, !dbg !120
  creg_r14 = max(creg_r12,creg_r13);
  r14 = r12 & r13;

  //   call void @llvm.dbg.value(metadata i32 %and, metadata !180, metadata !DIExpression()), !dbg !184

  //   %and14 = and i32 %8, %and, !dbg !121
  creg_r15 = max(creg_r11,creg_r14);
  r15 = r11 & r14;

  //   call void @llvm.dbg.value(metadata i32 %and14, metadata !181, metadata !DIExpression()), !dbg !184

  //   %and15 = and i32 %7, %and14, !dbg !122
  creg_r16 = max(creg_r10,creg_r15);
  r16 = r10 & r15;

  //   call void @llvm.dbg.value(metadata i32 %and15, metadata !182, metadata !DIExpression()), !dbg !184

  //   %and16 = and i32 %6, %and15, !dbg !123
  creg_r17 = max(creg_r16,creg_r9);
  r17 = r9 & r16;

  //   call void @llvm.dbg.value(metadata i32 %and16, metadata !183, metadata !DIExpression()), !dbg !184

  //   %cmp = icmp eq i32 %and16, 1, !dbg !124
  creg__r17__1_ = max(0,creg_r17);

  //   br i1 %cmp, label %if.then, label %if.end, !dbg !126
  old_cctrl = cctrl[0];
  cctrl[0] = get_rng(0,NCONTEXT-1);
  ASSUME(cctrl[0] >= old_cctrl);
  ASSUME(cctrl[0] >= creg__r17__1_);
  if((r17==1)) {
    goto T0BLOCK1;
  } else {
    goto T0BLOCK2;
  }

T0BLOCK1:
  //   call void @__assert_fail(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([90 x i8], [90 x i8]* @.str.1, i64 0, i64 0), i32 noundef 90, i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #8, !dbg !127

  //   unreachable, !dbg !127
  r18 = 1;
  goto T0BLOCK_END;

T0BLOCK2:
  //   %11 = bitcast i64* %thr2 to i8*, !dbg !130

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %11) #7, !dbg !130

  //   %12 = bitcast i64* %thr1 to i8*, !dbg !130

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %12) #7, !dbg !130

  //   %13 = bitcast i64* %thr0 to i8*, !dbg !130

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %13) #7, !dbg !130

  //   ret i32 0, !dbg !131
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

  ASSERT(r18== 0);

}
