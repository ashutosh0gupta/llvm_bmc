// Global variabls:
// 0:vars:8
// 8:atom_0_X0_1:1
// 9:atom_1_X0_1:1
// 13:atom_5_X0_1:1
// 10:atom_2_X0_1:1
// 15:atom_7_X0_1:1
// 11:atom_3_X0_1:1
// 12:atom_4_X0_1:1
// 14:atom_6_X0_1:1
// Local global variabls:
// 0:thr0:1
// 1:thr1:1
// 2:thr2:1
// 3:thr3:1
// 4:thr4:1
// 5:thr5:1
// 6:thr6:1
// 7:thr7:1
#define ADDRSIZE 16
#define LOCALADDRSIZE 8
#define NTHREAD 9
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
  local_mem[6+0] = 0;
  local_mem[7+0] = 0;
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
  char creg__r0__1_;
  int r1= 0;
  char creg_r1;
  char creg__r1__1_;
  int r2= 0;
  char creg_r2;
  char creg__r2__1_;
  int r3= 0;
  char creg_r3;
  char creg__r3__1_;
  int r4= 0;
  char creg_r4;
  char creg__r4__1_;
  int r5= 0;
  char creg_r5;
  char creg__r5__1_;
  int r6= 0;
  char creg_r6;
  char creg__r6__1_;
  int r7= 0;
  char creg_r7;
  char creg__r7__1_;
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
  char creg__r31__1_;
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
  mem(13+0,0) = 0;
  mem(10+0,0) = 0;
  mem(15+0,0) = 0;
  mem(11+0,0) = 0;
  mem(12+0,0) = 0;
  mem(14+0,0) = 0;
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
  co(12,0) = 0;
  delta(12,0) = -1;
  mem(12,1) = meminit(12,1);
  co(12,1) = coinit(12,1);
  delta(12,1) = deltainit(12,1);
  mem(12,2) = meminit(12,2);
  co(12,2) = coinit(12,2);
  delta(12,2) = deltainit(12,2);
  mem(12,3) = meminit(12,3);
  co(12,3) = coinit(12,3);
  delta(12,3) = deltainit(12,3);
  mem(12,4) = meminit(12,4);
  co(12,4) = coinit(12,4);
  delta(12,4) = deltainit(12,4);
  mem(12,5) = meminit(12,5);
  co(12,5) = coinit(12,5);
  delta(12,5) = deltainit(12,5);
  mem(12,6) = meminit(12,6);
  co(12,6) = coinit(12,6);
  delta(12,6) = deltainit(12,6);
  mem(12,7) = meminit(12,7);
  co(12,7) = coinit(12,7);
  delta(12,7) = deltainit(12,7);
  mem(12,8) = meminit(12,8);
  co(12,8) = coinit(12,8);
  delta(12,8) = deltainit(12,8);
  mem(12,9) = meminit(12,9);
  co(12,9) = coinit(12,9);
  delta(12,9) = deltainit(12,9);
  co(13,0) = 0;
  delta(13,0) = -1;
  mem(13,1) = meminit(13,1);
  co(13,1) = coinit(13,1);
  delta(13,1) = deltainit(13,1);
  mem(13,2) = meminit(13,2);
  co(13,2) = coinit(13,2);
  delta(13,2) = deltainit(13,2);
  mem(13,3) = meminit(13,3);
  co(13,3) = coinit(13,3);
  delta(13,3) = deltainit(13,3);
  mem(13,4) = meminit(13,4);
  co(13,4) = coinit(13,4);
  delta(13,4) = deltainit(13,4);
  mem(13,5) = meminit(13,5);
  co(13,5) = coinit(13,5);
  delta(13,5) = deltainit(13,5);
  mem(13,6) = meminit(13,6);
  co(13,6) = coinit(13,6);
  delta(13,6) = deltainit(13,6);
  mem(13,7) = meminit(13,7);
  co(13,7) = coinit(13,7);
  delta(13,7) = deltainit(13,7);
  mem(13,8) = meminit(13,8);
  co(13,8) = coinit(13,8);
  delta(13,8) = deltainit(13,8);
  mem(13,9) = meminit(13,9);
  co(13,9) = coinit(13,9);
  delta(13,9) = deltainit(13,9);
  co(14,0) = 0;
  delta(14,0) = -1;
  mem(14,1) = meminit(14,1);
  co(14,1) = coinit(14,1);
  delta(14,1) = deltainit(14,1);
  mem(14,2) = meminit(14,2);
  co(14,2) = coinit(14,2);
  delta(14,2) = deltainit(14,2);
  mem(14,3) = meminit(14,3);
  co(14,3) = coinit(14,3);
  delta(14,3) = deltainit(14,3);
  mem(14,4) = meminit(14,4);
  co(14,4) = coinit(14,4);
  delta(14,4) = deltainit(14,4);
  mem(14,5) = meminit(14,5);
  co(14,5) = coinit(14,5);
  delta(14,5) = deltainit(14,5);
  mem(14,6) = meminit(14,6);
  co(14,6) = coinit(14,6);
  delta(14,6) = deltainit(14,6);
  mem(14,7) = meminit(14,7);
  co(14,7) = coinit(14,7);
  delta(14,7) = deltainit(14,7);
  mem(14,8) = meminit(14,8);
  co(14,8) = coinit(14,8);
  delta(14,8) = deltainit(14,8);
  mem(14,9) = meminit(14,9);
  co(14,9) = coinit(14,9);
  delta(14,9) = deltainit(14,9);
  co(15,0) = 0;
  delta(15,0) = -1;
  mem(15,1) = meminit(15,1);
  co(15,1) = coinit(15,1);
  delta(15,1) = deltainit(15,1);
  mem(15,2) = meminit(15,2);
  co(15,2) = coinit(15,2);
  delta(15,2) = deltainit(15,2);
  mem(15,3) = meminit(15,3);
  co(15,3) = coinit(15,3);
  delta(15,3) = deltainit(15,3);
  mem(15,4) = meminit(15,4);
  co(15,4) = coinit(15,4);
  delta(15,4) = deltainit(15,4);
  mem(15,5) = meminit(15,5);
  co(15,5) = coinit(15,5);
  delta(15,5) = deltainit(15,5);
  mem(15,6) = meminit(15,6);
  co(15,6) = coinit(15,6);
  delta(15,6) = deltainit(15,6);
  mem(15,7) = meminit(15,7);
  co(15,7) = coinit(15,7);
  delta(15,7) = deltainit(15,7);
  mem(15,8) = meminit(15,8);
  co(15,8) = coinit(15,8);
  delta(15,8) = deltainit(15,8);
  mem(15,9) = meminit(15,9);
  co(15,9) = coinit(15,9);
  delta(15,9) = deltainit(15,9);
  // Dumping thread 1
  int ret_thread_1 = 0;
  cdy[1] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[1] >= cstart[1]);
T1BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !48, metadata !DIExpression()), !dbg !59

  //   br label %label_1, !dbg !60
  goto T1BLOCK1;

T1BLOCK1:
  //   call void @llvm.dbg.label(metadata !58), !dbg !61

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 1), metadata !50, metadata !DIExpression()), !dbg !62

  //   %0 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !63
  // LD: Guess
  old_cr = cr(1,0+1*1);
  cr(1,0+1*1) = get_rng(0,NCONTEXT-1);// 1 ASSIGN LDCOM _l26_c15
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
    ASSUME((!(( (cw(1,0+1*1) < 1) && (1 < crmax(1,0+1*1)) )))||(sforbid(0+1*1,1)> 0));
    ASSUME((!(( (cw(1,0+1*1) < 2) && (2 < crmax(1,0+1*1)) )))||(sforbid(0+1*1,2)> 0));
    ASSUME((!(( (cw(1,0+1*1) < 3) && (3 < crmax(1,0+1*1)) )))||(sforbid(0+1*1,3)> 0));
    ASSUME((!(( (cw(1,0+1*1) < 4) && (4 < crmax(1,0+1*1)) )))||(sforbid(0+1*1,4)> 0));
    ASSUME((!(( (cw(1,0+1*1) < 5) && (5 < crmax(1,0+1*1)) )))||(sforbid(0+1*1,5)> 0));
    ASSUME((!(( (cw(1,0+1*1) < 6) && (6 < crmax(1,0+1*1)) )))||(sforbid(0+1*1,6)> 0));
    ASSUME((!(( (cw(1,0+1*1) < 7) && (7 < crmax(1,0+1*1)) )))||(sforbid(0+1*1,7)> 0));
    ASSUME((!(( (cw(1,0+1*1) < 8) && (8 < crmax(1,0+1*1)) )))||(sforbid(0+1*1,8)> 0));
    ASSUME((!(( (cw(1,0+1*1) < 9) && (9 < crmax(1,0+1*1)) )))||(sforbid(0+1*1,9)> 0));
  } else {
    if(pw(1,0+1*1) != co(0+1*1,cr(1,0+1*1))) {
      ASSUME(cr(1,0+1*1) >= old_cr);
    }
    pw(1,0+1*1) = co(0+1*1,cr(1,0+1*1));
    r0 = mem(0+1*1,cr(1,0+1*1));
  }
  ASSUME(creturn[1] >= cr(1,0+1*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !53, metadata !DIExpression()), !dbg !62

  //   %conv = trunc i64 %0 to i32, !dbg !64

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !49, metadata !DIExpression()), !dbg !59

  //   call void (...) @dmbsy(), !dbg !65
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
  ASSUME(cdy[1] >= cw(1,0+5));
  ASSUME(cdy[1] >= cw(1,0+6));
  ASSUME(cdy[1] >= cw(1,0+7));
  ASSUME(cdy[1] >= cw(1,8+0));
  ASSUME(cdy[1] >= cw(1,9+0));
  ASSUME(cdy[1] >= cw(1,13+0));
  ASSUME(cdy[1] >= cw(1,10+0));
  ASSUME(cdy[1] >= cw(1,15+0));
  ASSUME(cdy[1] >= cw(1,11+0));
  ASSUME(cdy[1] >= cw(1,12+0));
  ASSUME(cdy[1] >= cw(1,14+0));
  ASSUME(cdy[1] >= cr(1,0+0));
  ASSUME(cdy[1] >= cr(1,0+1));
  ASSUME(cdy[1] >= cr(1,0+2));
  ASSUME(cdy[1] >= cr(1,0+3));
  ASSUME(cdy[1] >= cr(1,0+4));
  ASSUME(cdy[1] >= cr(1,0+5));
  ASSUME(cdy[1] >= cr(1,0+6));
  ASSUME(cdy[1] >= cr(1,0+7));
  ASSUME(cdy[1] >= cr(1,8+0));
  ASSUME(cdy[1] >= cr(1,9+0));
  ASSUME(cdy[1] >= cr(1,13+0));
  ASSUME(cdy[1] >= cr(1,10+0));
  ASSUME(cdy[1] >= cr(1,15+0));
  ASSUME(cdy[1] >= cr(1,11+0));
  ASSUME(cdy[1] >= cr(1,12+0));
  ASSUME(cdy[1] >= cr(1,14+0));
  ASSUME(creturn[1] >= cdy[1]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 0), metadata !54, metadata !DIExpression()), !dbg !66

  //   call void @llvm.dbg.value(metadata i64 1, metadata !56, metadata !DIExpression()), !dbg !66

  //   store atomic i64 1, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !67
  // ST: Guess
  iw(1,0) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW _l28_c3
  old_cw = cw(1,0);
  cw(1,0) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM _l28_c3
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

  //   %cmp = icmp eq i32 %conv, 1, !dbg !68
  creg__r0__1_ = max(0,creg_r0);

  //   %conv1 = zext i1 %cmp to i32, !dbg !68

  //   call void @llvm.dbg.value(metadata i32 %conv1, metadata !57, metadata !DIExpression()), !dbg !59

  //   store i32 %conv1, i32* @atom_0_X0_1, align 4, !dbg !69, !tbaa !70
  // ST: Guess
  iw(1,8) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STIW _l30_c15
  old_cw = cw(1,8);
  cw(1,8) = get_rng(0,NCONTEXT-1);// 1 ASSIGN STCOM _l30_c15
  // Check
  ASSUME(active[iw(1,8)] == 1);
  ASSUME(active[cw(1,8)] == 1);
  ASSUME(sforbid(8,cw(1,8))== 0);
  ASSUME(iw(1,8) >= creg__r0__1_);
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

  //   ret i8* null, !dbg !74
  ret_thread_1 = (- 1);
  goto T1BLOCK_END;

T1BLOCK_END:

  // Dumping thread 2
  int ret_thread_2 = 0;
  cdy[2] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[2] >= cstart[2]);
T2BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !77, metadata !DIExpression()), !dbg !87

  //   br label %label_2, !dbg !60
  goto T2BLOCK1;

T2BLOCK1:
  //   call void @llvm.dbg.label(metadata !86), !dbg !89

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 0), metadata !79, metadata !DIExpression()), !dbg !90

  //   %0 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !63
  // LD: Guess
  old_cr = cr(2,0);
  cr(2,0) = get_rng(0,NCONTEXT-1);// 2 ASSIGN LDCOM _l36_c15
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

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !81, metadata !DIExpression()), !dbg !90

  //   %conv = trunc i64 %0 to i32, !dbg !64

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !78, metadata !DIExpression()), !dbg !87

  //   call void (...) @dmbsy(), !dbg !65
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
  ASSUME(cdy[2] >= cw(2,0+6));
  ASSUME(cdy[2] >= cw(2,0+7));
  ASSUME(cdy[2] >= cw(2,8+0));
  ASSUME(cdy[2] >= cw(2,9+0));
  ASSUME(cdy[2] >= cw(2,13+0));
  ASSUME(cdy[2] >= cw(2,10+0));
  ASSUME(cdy[2] >= cw(2,15+0));
  ASSUME(cdy[2] >= cw(2,11+0));
  ASSUME(cdy[2] >= cw(2,12+0));
  ASSUME(cdy[2] >= cw(2,14+0));
  ASSUME(cdy[2] >= cr(2,0+0));
  ASSUME(cdy[2] >= cr(2,0+1));
  ASSUME(cdy[2] >= cr(2,0+2));
  ASSUME(cdy[2] >= cr(2,0+3));
  ASSUME(cdy[2] >= cr(2,0+4));
  ASSUME(cdy[2] >= cr(2,0+5));
  ASSUME(cdy[2] >= cr(2,0+6));
  ASSUME(cdy[2] >= cr(2,0+7));
  ASSUME(cdy[2] >= cr(2,8+0));
  ASSUME(cdy[2] >= cr(2,9+0));
  ASSUME(cdy[2] >= cr(2,13+0));
  ASSUME(cdy[2] >= cr(2,10+0));
  ASSUME(cdy[2] >= cr(2,15+0));
  ASSUME(cdy[2] >= cr(2,11+0));
  ASSUME(cdy[2] >= cr(2,12+0));
  ASSUME(cdy[2] >= cr(2,14+0));
  ASSUME(creturn[2] >= cdy[2]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 2), metadata !82, metadata !DIExpression()), !dbg !94

  //   call void @llvm.dbg.value(metadata i64 1, metadata !84, metadata !DIExpression()), !dbg !94

  //   store atomic i64 1, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 2) monotonic, align 8, !dbg !67
  // ST: Guess
  iw(2,0+2*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW _l38_c3
  old_cw = cw(2,0+2*1);
  cw(2,0+2*1) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM _l38_c3
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

  //   %cmp = icmp eq i32 %conv, 1, !dbg !68
  creg__r1__1_ = max(0,creg_r1);

  //   %conv1 = zext i1 %cmp to i32, !dbg !68

  //   call void @llvm.dbg.value(metadata i32 %conv1, metadata !85, metadata !DIExpression()), !dbg !87

  //   store i32 %conv1, i32* @atom_1_X0_1, align 4, !dbg !69, !tbaa !70
  // ST: Guess
  iw(2,9) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STIW _l40_c15
  old_cw = cw(2,9);
  cw(2,9) = get_rng(0,NCONTEXT-1);// 2 ASSIGN STCOM _l40_c15
  // Check
  ASSUME(active[iw(2,9)] == 2);
  ASSUME(active[cw(2,9)] == 2);
  ASSUME(sforbid(9,cw(2,9))== 0);
  ASSUME(iw(2,9) >= creg__r1__1_);
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

  //   ret i8* null, !dbg !74
  ret_thread_2 = (- 1);
  goto T2BLOCK_END;

T2BLOCK_END:

  // Dumping thread 3
  int ret_thread_3 = 0;
  cdy[3] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[3] >= cstart[3]);
T3BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !101, metadata !DIExpression()), !dbg !111

  //   br label %label_3, !dbg !60
  goto T3BLOCK1;

T3BLOCK1:
  //   call void @llvm.dbg.label(metadata !110), !dbg !113

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 2), metadata !103, metadata !DIExpression()), !dbg !114

  //   %0 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 2) monotonic, align 8, !dbg !63
  // LD: Guess
  old_cr = cr(3,0+2*1);
  cr(3,0+2*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN LDCOM _l46_c15
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
    r2 = mem(0+2*1,cr(3,0+2*1));
  }
  ASSUME(creturn[3] >= cr(3,0+2*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !105, metadata !DIExpression()), !dbg !114

  //   %conv = trunc i64 %0 to i32, !dbg !64

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !102, metadata !DIExpression()), !dbg !111

  //   call void (...) @dmbsy(), !dbg !65
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
  ASSUME(cdy[3] >= cw(3,13+0));
  ASSUME(cdy[3] >= cw(3,10+0));
  ASSUME(cdy[3] >= cw(3,15+0));
  ASSUME(cdy[3] >= cw(3,11+0));
  ASSUME(cdy[3] >= cw(3,12+0));
  ASSUME(cdy[3] >= cw(3,14+0));
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
  ASSUME(cdy[3] >= cr(3,13+0));
  ASSUME(cdy[3] >= cr(3,10+0));
  ASSUME(cdy[3] >= cr(3,15+0));
  ASSUME(cdy[3] >= cr(3,11+0));
  ASSUME(cdy[3] >= cr(3,12+0));
  ASSUME(cdy[3] >= cr(3,14+0));
  ASSUME(creturn[3] >= cdy[3]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 3), metadata !106, metadata !DIExpression()), !dbg !118

  //   call void @llvm.dbg.value(metadata i64 1, metadata !108, metadata !DIExpression()), !dbg !118

  //   store atomic i64 1, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !67
  // ST: Guess
  iw(3,0+3*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STIW _l48_c3
  old_cw = cw(3,0+3*1);
  cw(3,0+3*1) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STCOM _l48_c3
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

  //   %cmp = icmp eq i32 %conv, 1, !dbg !68
  creg__r2__1_ = max(0,creg_r2);

  //   %conv1 = zext i1 %cmp to i32, !dbg !68

  //   call void @llvm.dbg.value(metadata i32 %conv1, metadata !109, metadata !DIExpression()), !dbg !111

  //   store i32 %conv1, i32* @atom_2_X0_1, align 4, !dbg !69, !tbaa !70
  // ST: Guess
  iw(3,10) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STIW _l50_c15
  old_cw = cw(3,10);
  cw(3,10) = get_rng(0,NCONTEXT-1);// 3 ASSIGN STCOM _l50_c15
  // Check
  ASSUME(active[iw(3,10)] == 3);
  ASSUME(active[cw(3,10)] == 3);
  ASSUME(sforbid(10,cw(3,10))== 0);
  ASSUME(iw(3,10) >= creg__r2__1_);
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
  goto T3BLOCK_END;

T3BLOCK_END:

  // Dumping thread 4
  int ret_thread_4 = 0;
  cdy[4] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[4] >= cstart[4]);
T4BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !125, metadata !DIExpression()), !dbg !135

  //   br label %label_4, !dbg !60
  goto T4BLOCK1;

T4BLOCK1:
  //   call void @llvm.dbg.label(metadata !134), !dbg !137

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 3), metadata !127, metadata !DIExpression()), !dbg !138

  //   %0 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !63
  // LD: Guess
  old_cr = cr(4,0+3*1);
  cr(4,0+3*1) = get_rng(0,NCONTEXT-1);// 4 ASSIGN LDCOM _l56_c16
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
    r3 = mem(0+3*1,cr(4,0+3*1));
  }
  ASSUME(creturn[4] >= cr(4,0+3*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !129, metadata !DIExpression()), !dbg !138

  //   %conv = trunc i64 %0 to i32, !dbg !64

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !126, metadata !DIExpression()), !dbg !135

  //   call void (...) @dmbsy(), !dbg !65
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
  ASSUME(cdy[4] >= cw(4,13+0));
  ASSUME(cdy[4] >= cw(4,10+0));
  ASSUME(cdy[4] >= cw(4,15+0));
  ASSUME(cdy[4] >= cw(4,11+0));
  ASSUME(cdy[4] >= cw(4,12+0));
  ASSUME(cdy[4] >= cw(4,14+0));
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
  ASSUME(cdy[4] >= cr(4,13+0));
  ASSUME(cdy[4] >= cr(4,10+0));
  ASSUME(cdy[4] >= cr(4,15+0));
  ASSUME(cdy[4] >= cr(4,11+0));
  ASSUME(cdy[4] >= cr(4,12+0));
  ASSUME(cdy[4] >= cr(4,14+0));
  ASSUME(creturn[4] >= cdy[4]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 4), metadata !130, metadata !DIExpression()), !dbg !142

  //   call void @llvm.dbg.value(metadata i64 1, metadata !132, metadata !DIExpression()), !dbg !142

  //   store atomic i64 1, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 4) monotonic, align 8, !dbg !67
  // ST: Guess
  iw(4,0+4*1) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STIW _l58_c3
  old_cw = cw(4,0+4*1);
  cw(4,0+4*1) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STCOM _l58_c3
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

  //   %cmp = icmp eq i32 %conv, 1, !dbg !68
  creg__r3__1_ = max(0,creg_r3);

  //   %conv1 = zext i1 %cmp to i32, !dbg !68

  //   call void @llvm.dbg.value(metadata i32 %conv1, metadata !133, metadata !DIExpression()), !dbg !135

  //   store i32 %conv1, i32* @atom_3_X0_1, align 4, !dbg !69, !tbaa !70
  // ST: Guess
  iw(4,11) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STIW _l60_c15
  old_cw = cw(4,11);
  cw(4,11) = get_rng(0,NCONTEXT-1);// 4 ASSIGN STCOM _l60_c15
  // Check
  ASSUME(active[iw(4,11)] == 4);
  ASSUME(active[cw(4,11)] == 4);
  ASSUME(sforbid(11,cw(4,11))== 0);
  ASSUME(iw(4,11) >= creg__r3__1_);
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
  goto T4BLOCK_END;

T4BLOCK_END:

  // Dumping thread 5
  int ret_thread_5 = 0;
  cdy[5] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[5] >= cstart[5]);
T5BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !149, metadata !DIExpression()), !dbg !159

  //   br label %label_5, !dbg !60
  goto T5BLOCK1;

T5BLOCK1:
  //   call void @llvm.dbg.label(metadata !158), !dbg !161

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 4), metadata !151, metadata !DIExpression()), !dbg !162

  //   %0 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 4) monotonic, align 8, !dbg !63
  // LD: Guess
  old_cr = cr(5,0+4*1);
  cr(5,0+4*1) = get_rng(0,NCONTEXT-1);// 5 ASSIGN LDCOM _l66_c16
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
    r4 = mem(0+4*1,cr(5,0+4*1));
  }
  ASSUME(creturn[5] >= cr(5,0+4*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !153, metadata !DIExpression()), !dbg !162

  //   %conv = trunc i64 %0 to i32, !dbg !64

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !150, metadata !DIExpression()), !dbg !159

  //   call void (...) @dmbsy(), !dbg !65
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
  ASSUME(cdy[5] >= cw(5,13+0));
  ASSUME(cdy[5] >= cw(5,10+0));
  ASSUME(cdy[5] >= cw(5,15+0));
  ASSUME(cdy[5] >= cw(5,11+0));
  ASSUME(cdy[5] >= cw(5,12+0));
  ASSUME(cdy[5] >= cw(5,14+0));
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
  ASSUME(cdy[5] >= cr(5,13+0));
  ASSUME(cdy[5] >= cr(5,10+0));
  ASSUME(cdy[5] >= cr(5,15+0));
  ASSUME(cdy[5] >= cr(5,11+0));
  ASSUME(cdy[5] >= cr(5,12+0));
  ASSUME(cdy[5] >= cr(5,14+0));
  ASSUME(creturn[5] >= cdy[5]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 5), metadata !154, metadata !DIExpression()), !dbg !166

  //   call void @llvm.dbg.value(metadata i64 1, metadata !156, metadata !DIExpression()), !dbg !166

  //   store atomic i64 1, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 5) monotonic, align 8, !dbg !67
  // ST: Guess
  iw(5,0+5*1) = get_rng(0,NCONTEXT-1);// 5 ASSIGN STIW _l68_c3
  old_cw = cw(5,0+5*1);
  cw(5,0+5*1) = get_rng(0,NCONTEXT-1);// 5 ASSIGN STCOM _l68_c3
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

  //   %cmp = icmp eq i32 %conv, 1, !dbg !68
  creg__r4__1_ = max(0,creg_r4);

  //   %conv1 = zext i1 %cmp to i32, !dbg !68

  //   call void @llvm.dbg.value(metadata i32 %conv1, metadata !157, metadata !DIExpression()), !dbg !159

  //   store i32 %conv1, i32* @atom_4_X0_1, align 4, !dbg !69, !tbaa !70
  // ST: Guess
  iw(5,12) = get_rng(0,NCONTEXT-1);// 5 ASSIGN STIW _l70_c15
  old_cw = cw(5,12);
  cw(5,12) = get_rng(0,NCONTEXT-1);// 5 ASSIGN STCOM _l70_c15
  // Check
  ASSUME(active[iw(5,12)] == 5);
  ASSUME(active[cw(5,12)] == 5);
  ASSUME(sforbid(12,cw(5,12))== 0);
  ASSUME(iw(5,12) >= creg__r4__1_);
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
  goto T5BLOCK_END;

T5BLOCK_END:

  // Dumping thread 6
  int ret_thread_6 = 0;
  cdy[6] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[6] >= cstart[6]);
T6BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !173, metadata !DIExpression()), !dbg !183

  //   br label %label_6, !dbg !60
  goto T6BLOCK1;

T6BLOCK1:
  //   call void @llvm.dbg.label(metadata !182), !dbg !185

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 5), metadata !175, metadata !DIExpression()), !dbg !186

  //   %0 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 5) monotonic, align 8, !dbg !63
  // LD: Guess
  old_cr = cr(6,0+5*1);
  cr(6,0+5*1) = get_rng(0,NCONTEXT-1);// 6 ASSIGN LDCOM _l76_c16
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
    ASSUME((!(( (cw(6,0+5*1) < 1) && (1 < crmax(6,0+5*1)) )))||(sforbid(0+5*1,1)> 0));
    ASSUME((!(( (cw(6,0+5*1) < 2) && (2 < crmax(6,0+5*1)) )))||(sforbid(0+5*1,2)> 0));
    ASSUME((!(( (cw(6,0+5*1) < 3) && (3 < crmax(6,0+5*1)) )))||(sforbid(0+5*1,3)> 0));
    ASSUME((!(( (cw(6,0+5*1) < 4) && (4 < crmax(6,0+5*1)) )))||(sforbid(0+5*1,4)> 0));
    ASSUME((!(( (cw(6,0+5*1) < 5) && (5 < crmax(6,0+5*1)) )))||(sforbid(0+5*1,5)> 0));
    ASSUME((!(( (cw(6,0+5*1) < 6) && (6 < crmax(6,0+5*1)) )))||(sforbid(0+5*1,6)> 0));
    ASSUME((!(( (cw(6,0+5*1) < 7) && (7 < crmax(6,0+5*1)) )))||(sforbid(0+5*1,7)> 0));
    ASSUME((!(( (cw(6,0+5*1) < 8) && (8 < crmax(6,0+5*1)) )))||(sforbid(0+5*1,8)> 0));
    ASSUME((!(( (cw(6,0+5*1) < 9) && (9 < crmax(6,0+5*1)) )))||(sforbid(0+5*1,9)> 0));
  } else {
    if(pw(6,0+5*1) != co(0+5*1,cr(6,0+5*1))) {
      ASSUME(cr(6,0+5*1) >= old_cr);
    }
    pw(6,0+5*1) = co(0+5*1,cr(6,0+5*1));
    r5 = mem(0+5*1,cr(6,0+5*1));
  }
  ASSUME(creturn[6] >= cr(6,0+5*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !177, metadata !DIExpression()), !dbg !186

  //   %conv = trunc i64 %0 to i32, !dbg !64

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !174, metadata !DIExpression()), !dbg !183

  //   call void (...) @dmbsy(), !dbg !65
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
  ASSUME(cdy[6] >= cw(6,13+0));
  ASSUME(cdy[6] >= cw(6,10+0));
  ASSUME(cdy[6] >= cw(6,15+0));
  ASSUME(cdy[6] >= cw(6,11+0));
  ASSUME(cdy[6] >= cw(6,12+0));
  ASSUME(cdy[6] >= cw(6,14+0));
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
  ASSUME(cdy[6] >= cr(6,13+0));
  ASSUME(cdy[6] >= cr(6,10+0));
  ASSUME(cdy[6] >= cr(6,15+0));
  ASSUME(cdy[6] >= cr(6,11+0));
  ASSUME(cdy[6] >= cr(6,12+0));
  ASSUME(cdy[6] >= cr(6,14+0));
  ASSUME(creturn[6] >= cdy[6]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 6), metadata !178, metadata !DIExpression()), !dbg !190

  //   call void @llvm.dbg.value(metadata i64 1, metadata !180, metadata !DIExpression()), !dbg !190

  //   store atomic i64 1, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 6) monotonic, align 8, !dbg !67
  // ST: Guess
  iw(6,0+6*1) = get_rng(0,NCONTEXT-1);// 6 ASSIGN STIW _l78_c3
  old_cw = cw(6,0+6*1);
  cw(6,0+6*1) = get_rng(0,NCONTEXT-1);// 6 ASSIGN STCOM _l78_c3
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

  //   %cmp = icmp eq i32 %conv, 1, !dbg !68
  creg__r5__1_ = max(0,creg_r5);

  //   %conv1 = zext i1 %cmp to i32, !dbg !68

  //   call void @llvm.dbg.value(metadata i32 %conv1, metadata !181, metadata !DIExpression()), !dbg !183

  //   store i32 %conv1, i32* @atom_5_X0_1, align 4, !dbg !69, !tbaa !70
  // ST: Guess
  iw(6,13) = get_rng(0,NCONTEXT-1);// 6 ASSIGN STIW _l80_c15
  old_cw = cw(6,13);
  cw(6,13) = get_rng(0,NCONTEXT-1);// 6 ASSIGN STCOM _l80_c15
  // Check
  ASSUME(active[iw(6,13)] == 6);
  ASSUME(active[cw(6,13)] == 6);
  ASSUME(sforbid(13,cw(6,13))== 0);
  ASSUME(iw(6,13) >= creg__r5__1_);
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
  goto T6BLOCK_END;

T6BLOCK_END:

  // Dumping thread 7
  int ret_thread_7 = 0;
  cdy[7] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[7] >= cstart[7]);
T7BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !197, metadata !DIExpression()), !dbg !207

  //   br label %label_7, !dbg !60
  goto T7BLOCK1;

T7BLOCK1:
  //   call void @llvm.dbg.label(metadata !206), !dbg !209

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 6), metadata !199, metadata !DIExpression()), !dbg !210

  //   %0 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 6) monotonic, align 8, !dbg !63
  // LD: Guess
  old_cr = cr(7,0+6*1);
  cr(7,0+6*1) = get_rng(0,NCONTEXT-1);// 7 ASSIGN LDCOM _l86_c16
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
    ASSUME((!(( (cw(7,0+6*1) < 1) && (1 < crmax(7,0+6*1)) )))||(sforbid(0+6*1,1)> 0));
    ASSUME((!(( (cw(7,0+6*1) < 2) && (2 < crmax(7,0+6*1)) )))||(sforbid(0+6*1,2)> 0));
    ASSUME((!(( (cw(7,0+6*1) < 3) && (3 < crmax(7,0+6*1)) )))||(sforbid(0+6*1,3)> 0));
    ASSUME((!(( (cw(7,0+6*1) < 4) && (4 < crmax(7,0+6*1)) )))||(sforbid(0+6*1,4)> 0));
    ASSUME((!(( (cw(7,0+6*1) < 5) && (5 < crmax(7,0+6*1)) )))||(sforbid(0+6*1,5)> 0));
    ASSUME((!(( (cw(7,0+6*1) < 6) && (6 < crmax(7,0+6*1)) )))||(sforbid(0+6*1,6)> 0));
    ASSUME((!(( (cw(7,0+6*1) < 7) && (7 < crmax(7,0+6*1)) )))||(sforbid(0+6*1,7)> 0));
    ASSUME((!(( (cw(7,0+6*1) < 8) && (8 < crmax(7,0+6*1)) )))||(sforbid(0+6*1,8)> 0));
    ASSUME((!(( (cw(7,0+6*1) < 9) && (9 < crmax(7,0+6*1)) )))||(sforbid(0+6*1,9)> 0));
  } else {
    if(pw(7,0+6*1) != co(0+6*1,cr(7,0+6*1))) {
      ASSUME(cr(7,0+6*1) >= old_cr);
    }
    pw(7,0+6*1) = co(0+6*1,cr(7,0+6*1));
    r6 = mem(0+6*1,cr(7,0+6*1));
  }
  ASSUME(creturn[7] >= cr(7,0+6*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !201, metadata !DIExpression()), !dbg !210

  //   %conv = trunc i64 %0 to i32, !dbg !64

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !198, metadata !DIExpression()), !dbg !207

  //   call void (...) @dmbsy(), !dbg !65
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
  ASSUME(cdy[7] >= cw(7,13+0));
  ASSUME(cdy[7] >= cw(7,10+0));
  ASSUME(cdy[7] >= cw(7,15+0));
  ASSUME(cdy[7] >= cw(7,11+0));
  ASSUME(cdy[7] >= cw(7,12+0));
  ASSUME(cdy[7] >= cw(7,14+0));
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
  ASSUME(cdy[7] >= cr(7,13+0));
  ASSUME(cdy[7] >= cr(7,10+0));
  ASSUME(cdy[7] >= cr(7,15+0));
  ASSUME(cdy[7] >= cr(7,11+0));
  ASSUME(cdy[7] >= cr(7,12+0));
  ASSUME(cdy[7] >= cr(7,14+0));
  ASSUME(creturn[7] >= cdy[7]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 7), metadata !202, metadata !DIExpression()), !dbg !214

  //   call void @llvm.dbg.value(metadata i64 1, metadata !204, metadata !DIExpression()), !dbg !214

  //   store atomic i64 1, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 7) monotonic, align 8, !dbg !67
  // ST: Guess
  iw(7,0+7*1) = get_rng(0,NCONTEXT-1);// 7 ASSIGN STIW _l88_c3
  old_cw = cw(7,0+7*1);
  cw(7,0+7*1) = get_rng(0,NCONTEXT-1);// 7 ASSIGN STCOM _l88_c3
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

  //   %cmp = icmp eq i32 %conv, 1, !dbg !68
  creg__r6__1_ = max(0,creg_r6);

  //   %conv1 = zext i1 %cmp to i32, !dbg !68

  //   call void @llvm.dbg.value(metadata i32 %conv1, metadata !205, metadata !DIExpression()), !dbg !207

  //   store i32 %conv1, i32* @atom_6_X0_1, align 4, !dbg !69, !tbaa !70
  // ST: Guess
  iw(7,14) = get_rng(0,NCONTEXT-1);// 7 ASSIGN STIW _l90_c15
  old_cw = cw(7,14);
  cw(7,14) = get_rng(0,NCONTEXT-1);// 7 ASSIGN STCOM _l90_c15
  // Check
  ASSUME(active[iw(7,14)] == 7);
  ASSUME(active[cw(7,14)] == 7);
  ASSUME(sforbid(14,cw(7,14))== 0);
  ASSUME(iw(7,14) >= creg__r6__1_);
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
  goto T7BLOCK_END;

T7BLOCK_END:

  // Dumping thread 8
  int ret_thread_8 = 0;
  cdy[8] = get_rng(0,NCONTEXT-1);
  ASSUME(cdy[8] >= cstart[8]);
T8BLOCK0:
  //   call void @llvm.dbg.value(metadata i8* %arg, metadata !221, metadata !DIExpression()), !dbg !231

  //   br label %label_8, !dbg !60
  goto T8BLOCK1;

T8BLOCK1:
  //   call void @llvm.dbg.label(metadata !230), !dbg !233

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 7), metadata !223, metadata !DIExpression()), !dbg !234

  //   %0 = load atomic i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 7) monotonic, align 8, !dbg !63
  // LD: Guess
  old_cr = cr(8,0+7*1);
  cr(8,0+7*1) = get_rng(0,NCONTEXT-1);// 8 ASSIGN LDCOM _l96_c16
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
    ASSUME((!(( (cw(8,0+7*1) < 1) && (1 < crmax(8,0+7*1)) )))||(sforbid(0+7*1,1)> 0));
    ASSUME((!(( (cw(8,0+7*1) < 2) && (2 < crmax(8,0+7*1)) )))||(sforbid(0+7*1,2)> 0));
    ASSUME((!(( (cw(8,0+7*1) < 3) && (3 < crmax(8,0+7*1)) )))||(sforbid(0+7*1,3)> 0));
    ASSUME((!(( (cw(8,0+7*1) < 4) && (4 < crmax(8,0+7*1)) )))||(sforbid(0+7*1,4)> 0));
    ASSUME((!(( (cw(8,0+7*1) < 5) && (5 < crmax(8,0+7*1)) )))||(sforbid(0+7*1,5)> 0));
    ASSUME((!(( (cw(8,0+7*1) < 6) && (6 < crmax(8,0+7*1)) )))||(sforbid(0+7*1,6)> 0));
    ASSUME((!(( (cw(8,0+7*1) < 7) && (7 < crmax(8,0+7*1)) )))||(sforbid(0+7*1,7)> 0));
    ASSUME((!(( (cw(8,0+7*1) < 8) && (8 < crmax(8,0+7*1)) )))||(sforbid(0+7*1,8)> 0));
    ASSUME((!(( (cw(8,0+7*1) < 9) && (9 < crmax(8,0+7*1)) )))||(sforbid(0+7*1,9)> 0));
  } else {
    if(pw(8,0+7*1) != co(0+7*1,cr(8,0+7*1))) {
      ASSUME(cr(8,0+7*1) >= old_cr);
    }
    pw(8,0+7*1) = co(0+7*1,cr(8,0+7*1));
    r7 = mem(0+7*1,cr(8,0+7*1));
  }
  ASSUME(creturn[8] >= cr(8,0+7*1));

  //   call void @llvm.dbg.value(metadata i64 %0, metadata !225, metadata !DIExpression()), !dbg !234

  //   %conv = trunc i64 %0 to i32, !dbg !64

  //   call void @llvm.dbg.value(metadata i32 %conv, metadata !222, metadata !DIExpression()), !dbg !231

  //   call void (...) @dmbsy(), !dbg !65
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
  ASSUME(cdy[8] >= cw(8,13+0));
  ASSUME(cdy[8] >= cw(8,10+0));
  ASSUME(cdy[8] >= cw(8,15+0));
  ASSUME(cdy[8] >= cw(8,11+0));
  ASSUME(cdy[8] >= cw(8,12+0));
  ASSUME(cdy[8] >= cw(8,14+0));
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
  ASSUME(cdy[8] >= cr(8,13+0));
  ASSUME(cdy[8] >= cr(8,10+0));
  ASSUME(cdy[8] >= cr(8,15+0));
  ASSUME(cdy[8] >= cr(8,11+0));
  ASSUME(cdy[8] >= cr(8,12+0));
  ASSUME(cdy[8] >= cr(8,14+0));
  ASSUME(creturn[8] >= cdy[8]);

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 1), metadata !226, metadata !DIExpression()), !dbg !238

  //   call void @llvm.dbg.value(metadata i64 1, metadata !228, metadata !DIExpression()), !dbg !238

  //   store atomic i64 1, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !67
  // ST: Guess
  iw(8,0+1*1) = get_rng(0,NCONTEXT-1);// 8 ASSIGN STIW _l98_c3
  old_cw = cw(8,0+1*1);
  cw(8,0+1*1) = get_rng(0,NCONTEXT-1);// 8 ASSIGN STCOM _l98_c3
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

  //   %cmp = icmp eq i32 %conv, 1, !dbg !68
  creg__r7__1_ = max(0,creg_r7);

  //   %conv1 = zext i1 %cmp to i32, !dbg !68

  //   call void @llvm.dbg.value(metadata i32 %conv1, metadata !229, metadata !DIExpression()), !dbg !231

  //   store i32 %conv1, i32* @atom_7_X0_1, align 4, !dbg !69, !tbaa !70
  // ST: Guess
  iw(8,15) = get_rng(0,NCONTEXT-1);// 8 ASSIGN STIW _l100_c15
  old_cw = cw(8,15);
  cw(8,15) = get_rng(0,NCONTEXT-1);// 8 ASSIGN STCOM _l100_c15
  // Check
  ASSUME(active[iw(8,15)] == 8);
  ASSUME(active[cw(8,15)] == 8);
  ASSUME(sforbid(15,cw(8,15))== 0);
  ASSUME(iw(8,15) >= creg__r7__1_);
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
  goto T8BLOCK_END;

T8BLOCK_END:

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

  //   call void @llvm.dbg.value(metadata i32 %argc, metadata !250, metadata !DIExpression()), !dbg !327

  //   call void @llvm.dbg.value(metadata i8** %argv, metadata !251, metadata !DIExpression()), !dbg !327

  //   %0 = bitcast i64* %thr0 to i8*, !dbg !130

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %0) #6, !dbg !130

  //   call void @llvm.dbg.declare(metadata i64* %thr0, metadata !252, metadata !DIExpression()), !dbg !329

  //   %1 = bitcast i64* %thr1 to i8*, !dbg !132

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %1) #6, !dbg !132

  //   call void @llvm.dbg.declare(metadata i64* %thr1, metadata !256, metadata !DIExpression()), !dbg !331

  //   %2 = bitcast i64* %thr2 to i8*, !dbg !134

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %2) #6, !dbg !134

  //   call void @llvm.dbg.declare(metadata i64* %thr2, metadata !257, metadata !DIExpression()), !dbg !333

  //   %3 = bitcast i64* %thr3 to i8*, !dbg !136

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %3) #6, !dbg !136

  //   call void @llvm.dbg.declare(metadata i64* %thr3, metadata !258, metadata !DIExpression()), !dbg !335

  //   %4 = bitcast i64* %thr4 to i8*, !dbg !138

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %4) #6, !dbg !138

  //   call void @llvm.dbg.declare(metadata i64* %thr4, metadata !259, metadata !DIExpression()), !dbg !337

  //   %5 = bitcast i64* %thr5 to i8*, !dbg !140

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %5) #6, !dbg !140

  //   call void @llvm.dbg.declare(metadata i64* %thr5, metadata !260, metadata !DIExpression()), !dbg !339

  //   %6 = bitcast i64* %thr6 to i8*, !dbg !142

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %6) #6, !dbg !142

  //   call void @llvm.dbg.declare(metadata i64* %thr6, metadata !261, metadata !DIExpression()), !dbg !341

  //   %7 = bitcast i64* %thr7 to i8*, !dbg !144

  //   call void @llvm.lifetime.start.p0i8(i64 8, i8* %7) #6, !dbg !144

  //   call void @llvm.dbg.declare(metadata i64* %thr7, metadata !262, metadata !DIExpression()), !dbg !343

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 7), metadata !263, metadata !DIExpression()), !dbg !344

  //   call void @llvm.dbg.value(metadata i64 0, metadata !265, metadata !DIExpression()), !dbg !344

  //   store atomic i64 0, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 7) monotonic, align 8, !dbg !147
  // ST: Guess
  iw(0,0+7*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l114_c3
  old_cw = cw(0,0+7*1);
  cw(0,0+7*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l114_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 6), metadata !266, metadata !DIExpression()), !dbg !346

  //   call void @llvm.dbg.value(metadata i64 0, metadata !268, metadata !DIExpression()), !dbg !346

  //   store atomic i64 0, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 6) monotonic, align 8, !dbg !149
  // ST: Guess
  iw(0,0+6*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l115_c3
  old_cw = cw(0,0+6*1);
  cw(0,0+6*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l115_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 5), metadata !269, metadata !DIExpression()), !dbg !348

  //   call void @llvm.dbg.value(metadata i64 0, metadata !271, metadata !DIExpression()), !dbg !348

  //   store atomic i64 0, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 5) monotonic, align 8, !dbg !151
  // ST: Guess
  iw(0,0+5*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l116_c3
  old_cw = cw(0,0+5*1);
  cw(0,0+5*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l116_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 4), metadata !272, metadata !DIExpression()), !dbg !350

  //   call void @llvm.dbg.value(metadata i64 0, metadata !274, metadata !DIExpression()), !dbg !350

  //   store atomic i64 0, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 4) monotonic, align 8, !dbg !153
  // ST: Guess
  iw(0,0+4*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l117_c3
  old_cw = cw(0,0+4*1);
  cw(0,0+4*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l117_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 3), metadata !275, metadata !DIExpression()), !dbg !352

  //   call void @llvm.dbg.value(metadata i64 0, metadata !277, metadata !DIExpression()), !dbg !352

  //   store atomic i64 0, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 3) monotonic, align 8, !dbg !155
  // ST: Guess
  iw(0,0+3*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l118_c3
  old_cw = cw(0,0+3*1);
  cw(0,0+3*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l118_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 2), metadata !278, metadata !DIExpression()), !dbg !354

  //   call void @llvm.dbg.value(metadata i64 0, metadata !280, metadata !DIExpression()), !dbg !354

  //   store atomic i64 0, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 2) monotonic, align 8, !dbg !157
  // ST: Guess
  iw(0,0+2*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l119_c3
  old_cw = cw(0,0+2*1);
  cw(0,0+2*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l119_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 1), metadata !281, metadata !DIExpression()), !dbg !356

  //   call void @llvm.dbg.value(metadata i64 0, metadata !283, metadata !DIExpression()), !dbg !356

  //   store atomic i64 0, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 1) monotonic, align 8, !dbg !159
  // ST: Guess
  iw(0,0+1*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l120_c3
  old_cw = cw(0,0+1*1);
  cw(0,0+1*1) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l120_c3
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

  //   call void @llvm.dbg.value(metadata i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 0), metadata !284, metadata !DIExpression()), !dbg !358

  //   call void @llvm.dbg.value(metadata i64 0, metadata !286, metadata !DIExpression()), !dbg !358

  //   store atomic i64 0, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @vars, i64 0, i64 0) monotonic, align 8, !dbg !161
  // ST: Guess
  iw(0,0) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l121_c3
  old_cw = cw(0,0);
  cw(0,0) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l121_c3
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

  //   call void @llvm.dbg.value(metadata i32* @atom_0_X0_1, metadata !287, metadata !DIExpression()), !dbg !360

  //   call void @llvm.dbg.value(metadata i32 0, metadata !290, metadata !DIExpression()), !dbg !360

  //   store atomic i32 0, i32* @atom_0_X0_1 monotonic, align 4, !dbg !163
  // ST: Guess
  iw(0,8) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l122_c3
  old_cw = cw(0,8);
  cw(0,8) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l122_c3
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

  //   call void @llvm.dbg.value(metadata i32* @atom_1_X0_1, metadata !291, metadata !DIExpression()), !dbg !362

  //   call void @llvm.dbg.value(metadata i32 0, metadata !293, metadata !DIExpression()), !dbg !362

  //   store atomic i32 0, i32* @atom_1_X0_1 monotonic, align 4, !dbg !165
  // ST: Guess
  iw(0,9) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l123_c3
  old_cw = cw(0,9);
  cw(0,9) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l123_c3
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

  //   call void @llvm.dbg.value(metadata i32* @atom_2_X0_1, metadata !294, metadata !DIExpression()), !dbg !364

  //   call void @llvm.dbg.value(metadata i32 0, metadata !296, metadata !DIExpression()), !dbg !364

  //   store atomic i32 0, i32* @atom_2_X0_1 monotonic, align 4, !dbg !167
  // ST: Guess
  iw(0,10) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l124_c3
  old_cw = cw(0,10);
  cw(0,10) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l124_c3
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

  //   call void @llvm.dbg.value(metadata i32* @atom_3_X0_1, metadata !297, metadata !DIExpression()), !dbg !366

  //   call void @llvm.dbg.value(metadata i32 0, metadata !299, metadata !DIExpression()), !dbg !366

  //   store atomic i32 0, i32* @atom_3_X0_1 monotonic, align 4, !dbg !169
  // ST: Guess
  iw(0,11) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l125_c3
  old_cw = cw(0,11);
  cw(0,11) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l125_c3
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

  //   call void @llvm.dbg.value(metadata i32* @atom_4_X0_1, metadata !300, metadata !DIExpression()), !dbg !368

  //   call void @llvm.dbg.value(metadata i32 0, metadata !302, metadata !DIExpression()), !dbg !368

  //   store atomic i32 0, i32* @atom_4_X0_1 monotonic, align 4, !dbg !171
  // ST: Guess
  iw(0,12) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l126_c3
  old_cw = cw(0,12);
  cw(0,12) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l126_c3
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

  //   call void @llvm.dbg.value(metadata i32* @atom_5_X0_1, metadata !303, metadata !DIExpression()), !dbg !370

  //   call void @llvm.dbg.value(metadata i32 0, metadata !305, metadata !DIExpression()), !dbg !370

  //   store atomic i32 0, i32* @atom_5_X0_1 monotonic, align 4, !dbg !173
  // ST: Guess
  iw(0,13) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l127_c3
  old_cw = cw(0,13);
  cw(0,13) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l127_c3
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

  //   call void @llvm.dbg.value(metadata i32* @atom_6_X0_1, metadata !306, metadata !DIExpression()), !dbg !372

  //   call void @llvm.dbg.value(metadata i32 0, metadata !308, metadata !DIExpression()), !dbg !372

  //   store atomic i32 0, i32* @atom_6_X0_1 monotonic, align 4, !dbg !175
  // ST: Guess
  iw(0,14) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l128_c3
  old_cw = cw(0,14);
  cw(0,14) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l128_c3
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

  //   call void @llvm.dbg.value(metadata i32* @atom_7_X0_1, metadata !309, metadata !DIExpression()), !dbg !374

  //   call void @llvm.dbg.value(metadata i32 0, metadata !311, metadata !DIExpression()), !dbg !374

  //   store atomic i32 0, i32* @atom_7_X0_1 monotonic, align 4, !dbg !177
  // ST: Guess
  iw(0,15) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STIW _l129_c3
  old_cw = cw(0,15);
  cw(0,15) = get_rng(0,NCONTEXT-1);// 0 ASSIGN STCOM _l129_c3
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

  //   %call = call i32 @pthread_create(i64* noundef %thr0, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t0, i8* noundef null) #6, !dbg !178
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
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,14+0));
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
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[1] >= cdy[0]);

  //   %call31 = call i32 @pthread_create(i64* noundef %thr1, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t1, i8* noundef null) #6, !dbg !179
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
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,14+0));
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
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[2] >= cdy[0]);

  //   %call32 = call i32 @pthread_create(i64* noundef %thr2, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t2, i8* noundef null) #6, !dbg !180
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
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,14+0));
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
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[3] >= cdy[0]);

  //   %call33 = call i32 @pthread_create(i64* noundef %thr3, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t3, i8* noundef null) #6, !dbg !181
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
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,14+0));
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
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[4] >= cdy[0]);

  //   %call34 = call i32 @pthread_create(i64* noundef %thr4, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t4, i8* noundef null) #6, !dbg !182
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
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,14+0));
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
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[5] >= cdy[0]);

  //   %call35 = call i32 @pthread_create(i64* noundef %thr5, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t5, i8* noundef null) #6, !dbg !183
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
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,14+0));
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
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[6] >= cdy[0]);

  //   %call36 = call i32 @pthread_create(i64* noundef %thr6, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t6, i8* noundef null) #6, !dbg !184
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
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,14+0));
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
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[7] >= cdy[0]);

  //   %call37 = call i32 @pthread_create(i64* noundef %thr7, %union.pthread_attr_t* noundef null, i8* (i8*)* noundef @t7, i8* noundef null) #6, !dbg !185
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
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,14+0));
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
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cstart[8] >= cdy[0]);

  //   %8 = load i64, i64* %thr0, align 8, !dbg !186, !tbaa !187
  r9 = local_mem[0];

  //   %call38 = call i32 @pthread_join(i64 noundef %8, i8** noundef null), !dbg !191
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
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,14+0));
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
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[1]);

  //   %9 = load i64, i64* %thr1, align 8, !dbg !192, !tbaa !187
  r10 = local_mem[1];

  //   %call39 = call i32 @pthread_join(i64 noundef %9, i8** noundef null), !dbg !193
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
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,14+0));
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
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[2]);

  //   %10 = load i64, i64* %thr2, align 8, !dbg !194, !tbaa !187
  r11 = local_mem[2];

  //   %call40 = call i32 @pthread_join(i64 noundef %10, i8** noundef null), !dbg !195
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
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,14+0));
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
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[3]);

  //   %11 = load i64, i64* %thr3, align 8, !dbg !196, !tbaa !187
  r12 = local_mem[3];

  //   %call41 = call i32 @pthread_join(i64 noundef %11, i8** noundef null), !dbg !197
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
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,14+0));
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
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[4]);

  //   %12 = load i64, i64* %thr4, align 8, !dbg !198, !tbaa !187
  r13 = local_mem[4];

  //   %call42 = call i32 @pthread_join(i64 noundef %12, i8** noundef null), !dbg !199
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
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,14+0));
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
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[5]);

  //   %13 = load i64, i64* %thr5, align 8, !dbg !200, !tbaa !187
  r14 = local_mem[5];

  //   %call43 = call i32 @pthread_join(i64 noundef %13, i8** noundef null), !dbg !201
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
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,14+0));
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
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[6]);

  //   %14 = load i64, i64* %thr6, align 8, !dbg !202, !tbaa !187
  r15 = local_mem[6];

  //   %call44 = call i32 @pthread_join(i64 noundef %14, i8** noundef null), !dbg !203
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
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,14+0));
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
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[7]);

  //   %15 = load i64, i64* %thr7, align 8, !dbg !204, !tbaa !187
  r16 = local_mem[7];

  //   %call45 = call i32 @pthread_join(i64 noundef %15, i8** noundef null), !dbg !205
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
  ASSUME(cdy[0] >= cw(0,13+0));
  ASSUME(cdy[0] >= cw(0,10+0));
  ASSUME(cdy[0] >= cw(0,15+0));
  ASSUME(cdy[0] >= cw(0,11+0));
  ASSUME(cdy[0] >= cw(0,12+0));
  ASSUME(cdy[0] >= cw(0,14+0));
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
  ASSUME(cdy[0] >= cr(0,13+0));
  ASSUME(cdy[0] >= cr(0,10+0));
  ASSUME(cdy[0] >= cr(0,15+0));
  ASSUME(cdy[0] >= cr(0,11+0));
  ASSUME(cdy[0] >= cr(0,12+0));
  ASSUME(cdy[0] >= cr(0,14+0));
  ASSUME(creturn[0] >= cdy[0]);
  ASSUME(cdy[0] >= creturn[8]);

  //   %16 = load i32, i32* @atom_0_X0_1, align 4, !dbg !206, !tbaa !207
  // LD: Guess
  old_cr = cr(0,8);
  cr(0,8) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l149_c13
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

  //   call void @llvm.dbg.value(metadata i32 %16, metadata !312, metadata !DIExpression()), !dbg !327

  //   %17 = load i32, i32* @atom_1_X0_1, align 4, !dbg !209, !tbaa !207
  // LD: Guess
  old_cr = cr(0,9);
  cr(0,9) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l150_c13
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
    r18 = mem(9,cr(0,9));
  }
  ASSUME(creturn[0] >= cr(0,9));

  //   call void @llvm.dbg.value(metadata i32 %17, metadata !313, metadata !DIExpression()), !dbg !327

  //   %18 = load i32, i32* @atom_2_X0_1, align 4, !dbg !210, !tbaa !207
  // LD: Guess
  old_cr = cr(0,10);
  cr(0,10) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l151_c13
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
    r19 = mem(10,cr(0,10));
  }
  ASSUME(creturn[0] >= cr(0,10));

  //   call void @llvm.dbg.value(metadata i32 %18, metadata !314, metadata !DIExpression()), !dbg !327

  //   %19 = load i32, i32* @atom_3_X0_1, align 4, !dbg !211, !tbaa !207
  // LD: Guess
  old_cr = cr(0,11);
  cr(0,11) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l152_c13
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
    r20 = mem(11,cr(0,11));
  }
  ASSUME(creturn[0] >= cr(0,11));

  //   call void @llvm.dbg.value(metadata i32 %19, metadata !315, metadata !DIExpression()), !dbg !327

  //   %20 = load i32, i32* @atom_4_X0_1, align 4, !dbg !212, !tbaa !207
  // LD: Guess
  old_cr = cr(0,12);
  cr(0,12) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l153_c13
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
    ASSUME((!(( (cw(0,12) < 1) && (1 < crmax(0,12)) )))||(sforbid(12,1)> 0));
    ASSUME((!(( (cw(0,12) < 2) && (2 < crmax(0,12)) )))||(sforbid(12,2)> 0));
    ASSUME((!(( (cw(0,12) < 3) && (3 < crmax(0,12)) )))||(sforbid(12,3)> 0));
    ASSUME((!(( (cw(0,12) < 4) && (4 < crmax(0,12)) )))||(sforbid(12,4)> 0));
    ASSUME((!(( (cw(0,12) < 5) && (5 < crmax(0,12)) )))||(sforbid(12,5)> 0));
    ASSUME((!(( (cw(0,12) < 6) && (6 < crmax(0,12)) )))||(sforbid(12,6)> 0));
    ASSUME((!(( (cw(0,12) < 7) && (7 < crmax(0,12)) )))||(sforbid(12,7)> 0));
    ASSUME((!(( (cw(0,12) < 8) && (8 < crmax(0,12)) )))||(sforbid(12,8)> 0));
    ASSUME((!(( (cw(0,12) < 9) && (9 < crmax(0,12)) )))||(sforbid(12,9)> 0));
  } else {
    if(pw(0,12) != co(12,cr(0,12))) {
      ASSUME(cr(0,12) >= old_cr);
    }
    pw(0,12) = co(12,cr(0,12));
    r21 = mem(12,cr(0,12));
  }
  ASSUME(creturn[0] >= cr(0,12));

  //   call void @llvm.dbg.value(metadata i32 %20, metadata !316, metadata !DIExpression()), !dbg !327

  //   %21 = load i32, i32* @atom_5_X0_1, align 4, !dbg !213, !tbaa !207
  // LD: Guess
  old_cr = cr(0,13);
  cr(0,13) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l154_c13
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
    ASSUME((!(( (cw(0,13) < 1) && (1 < crmax(0,13)) )))||(sforbid(13,1)> 0));
    ASSUME((!(( (cw(0,13) < 2) && (2 < crmax(0,13)) )))||(sforbid(13,2)> 0));
    ASSUME((!(( (cw(0,13) < 3) && (3 < crmax(0,13)) )))||(sforbid(13,3)> 0));
    ASSUME((!(( (cw(0,13) < 4) && (4 < crmax(0,13)) )))||(sforbid(13,4)> 0));
    ASSUME((!(( (cw(0,13) < 5) && (5 < crmax(0,13)) )))||(sforbid(13,5)> 0));
    ASSUME((!(( (cw(0,13) < 6) && (6 < crmax(0,13)) )))||(sforbid(13,6)> 0));
    ASSUME((!(( (cw(0,13) < 7) && (7 < crmax(0,13)) )))||(sforbid(13,7)> 0));
    ASSUME((!(( (cw(0,13) < 8) && (8 < crmax(0,13)) )))||(sforbid(13,8)> 0));
    ASSUME((!(( (cw(0,13) < 9) && (9 < crmax(0,13)) )))||(sforbid(13,9)> 0));
  } else {
    if(pw(0,13) != co(13,cr(0,13))) {
      ASSUME(cr(0,13) >= old_cr);
    }
    pw(0,13) = co(13,cr(0,13));
    r22 = mem(13,cr(0,13));
  }
  ASSUME(creturn[0] >= cr(0,13));

  //   call void @llvm.dbg.value(metadata i32 %21, metadata !317, metadata !DIExpression()), !dbg !327

  //   %22 = load i32, i32* @atom_6_X0_1, align 4, !dbg !214, !tbaa !207
  // LD: Guess
  old_cr = cr(0,14);
  cr(0,14) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l155_c13
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
    ASSUME((!(( (cw(0,14) < 1) && (1 < crmax(0,14)) )))||(sforbid(14,1)> 0));
    ASSUME((!(( (cw(0,14) < 2) && (2 < crmax(0,14)) )))||(sforbid(14,2)> 0));
    ASSUME((!(( (cw(0,14) < 3) && (3 < crmax(0,14)) )))||(sforbid(14,3)> 0));
    ASSUME((!(( (cw(0,14) < 4) && (4 < crmax(0,14)) )))||(sforbid(14,4)> 0));
    ASSUME((!(( (cw(0,14) < 5) && (5 < crmax(0,14)) )))||(sforbid(14,5)> 0));
    ASSUME((!(( (cw(0,14) < 6) && (6 < crmax(0,14)) )))||(sforbid(14,6)> 0));
    ASSUME((!(( (cw(0,14) < 7) && (7 < crmax(0,14)) )))||(sforbid(14,7)> 0));
    ASSUME((!(( (cw(0,14) < 8) && (8 < crmax(0,14)) )))||(sforbid(14,8)> 0));
    ASSUME((!(( (cw(0,14) < 9) && (9 < crmax(0,14)) )))||(sforbid(14,9)> 0));
  } else {
    if(pw(0,14) != co(14,cr(0,14))) {
      ASSUME(cr(0,14) >= old_cr);
    }
    pw(0,14) = co(14,cr(0,14));
    r23 = mem(14,cr(0,14));
  }
  ASSUME(creturn[0] >= cr(0,14));

  //   call void @llvm.dbg.value(metadata i32 %22, metadata !318, metadata !DIExpression()), !dbg !327

  //   %23 = load i32, i32* @atom_7_X0_1, align 4, !dbg !215, !tbaa !207
  // LD: Guess
  old_cr = cr(0,15);
  cr(0,15) = get_rng(0,NCONTEXT-1);// 0 ASSIGN LDCOM _l156_c13
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
    ASSUME((!(( (cw(0,15) < 1) && (1 < crmax(0,15)) )))||(sforbid(15,1)> 0));
    ASSUME((!(( (cw(0,15) < 2) && (2 < crmax(0,15)) )))||(sforbid(15,2)> 0));
    ASSUME((!(( (cw(0,15) < 3) && (3 < crmax(0,15)) )))||(sforbid(15,3)> 0));
    ASSUME((!(( (cw(0,15) < 4) && (4 < crmax(0,15)) )))||(sforbid(15,4)> 0));
    ASSUME((!(( (cw(0,15) < 5) && (5 < crmax(0,15)) )))||(sforbid(15,5)> 0));
    ASSUME((!(( (cw(0,15) < 6) && (6 < crmax(0,15)) )))||(sforbid(15,6)> 0));
    ASSUME((!(( (cw(0,15) < 7) && (7 < crmax(0,15)) )))||(sforbid(15,7)> 0));
    ASSUME((!(( (cw(0,15) < 8) && (8 < crmax(0,15)) )))||(sforbid(15,8)> 0));
    ASSUME((!(( (cw(0,15) < 9) && (9 < crmax(0,15)) )))||(sforbid(15,9)> 0));
  } else {
    if(pw(0,15) != co(15,cr(0,15))) {
      ASSUME(cr(0,15) >= old_cr);
    }
    pw(0,15) = co(15,cr(0,15));
    r24 = mem(15,cr(0,15));
  }
  ASSUME(creturn[0] >= cr(0,15));

  //   call void @llvm.dbg.value(metadata i32 %23, metadata !319, metadata !DIExpression()), !dbg !327

  //   %and = and i32 %22, %23, !dbg !216
  creg_r25 = max(creg_r23,creg_r24);
  r25 = r23 & r24;

  //   call void @llvm.dbg.value(metadata i32 %and, metadata !320, metadata !DIExpression()), !dbg !327

  //   %and46 = and i32 %21, %and, !dbg !217
  creg_r26 = max(creg_r22,creg_r25);
  r26 = r22 & r25;

  //   call void @llvm.dbg.value(metadata i32 %and46, metadata !321, metadata !DIExpression()), !dbg !327

  //   %and47 = and i32 %20, %and46, !dbg !218
  creg_r27 = max(creg_r21,creg_r26);
  r27 = r21 & r26;

  //   call void @llvm.dbg.value(metadata i32 %and47, metadata !322, metadata !DIExpression()), !dbg !327

  //   %and48 = and i32 %19, %and47, !dbg !219
  creg_r28 = max(creg_r20,creg_r27);
  r28 = r20 & r27;

  //   call void @llvm.dbg.value(metadata i32 %and48, metadata !323, metadata !DIExpression()), !dbg !327

  //   %and49 = and i32 %18, %and48, !dbg !220
  creg_r29 = max(creg_r19,creg_r28);
  r29 = r19 & r28;

  //   call void @llvm.dbg.value(metadata i32 %and49, metadata !324, metadata !DIExpression()), !dbg !327

  //   %and50 = and i32 %17, %and49, !dbg !221
  creg_r30 = max(creg_r18,creg_r29);
  r30 = r18 & r29;

  //   call void @llvm.dbg.value(metadata i32 %and50, metadata !325, metadata !DIExpression()), !dbg !327

  //   %and51 = and i32 %16, %and50, !dbg !222
  creg_r31 = max(creg_r17,creg_r30);
  r31 = r17 & r30;

  //   call void @llvm.dbg.value(metadata i32 %and51, metadata !326, metadata !DIExpression()), !dbg !327

  //   %cmp = icmp eq i32 %and51, 1, !dbg !223
  creg__r31__1_ = max(0,creg_r31);

  //   br i1 %cmp, label %if.then, label %if.end, !dbg !225
  old_cctrl = cctrl[0];
  cctrl[0] = get_rng(0,NCONTEXT-1);
  ASSUME(cctrl[0] >= old_cctrl);
  ASSUME(cctrl[0] >= creg__r31__1_);
  if((r31==1)) {
    goto T0BLOCK1;
  } else {
    goto T0BLOCK2;
  }

T0BLOCK1:
  //   call void @__assert_fail(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([124 x i8], [124 x i8]* @.str.1, i64 0, i64 0), i32 noundef 164, i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #7, !dbg !226

  //   unreachable, !dbg !226
  r32 = 1;
  goto T0BLOCK_END;

T0BLOCK2:
  //   %24 = bitcast i64* %thr7 to i8*, !dbg !229

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %24) #6, !dbg !229

  //   %25 = bitcast i64* %thr6 to i8*, !dbg !229

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %25) #6, !dbg !229

  //   %26 = bitcast i64* %thr5 to i8*, !dbg !229

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %26) #6, !dbg !229

  //   %27 = bitcast i64* %thr4 to i8*, !dbg !229

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %27) #6, !dbg !229

  //   %28 = bitcast i64* %thr3 to i8*, !dbg !229

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %28) #6, !dbg !229

  //   %29 = bitcast i64* %thr2 to i8*, !dbg !229

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %29) #6, !dbg !229

  //   %30 = bitcast i64* %thr1 to i8*, !dbg !229

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %30) #6, !dbg !229

  //   %31 = bitcast i64* %thr0 to i8*, !dbg !229

  //   call void @llvm.lifetime.end.p0i8(i64 8, i8* %31) #6, !dbg !229

  //   ret i32 0, !dbg !230
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
  ASSUME(meminit(12,1) == mem(12,0));
  ASSUME(coinit(12,1) == co(12,0));
  ASSUME(deltainit(12,1) == delta(12,0));
  ASSUME(meminit(12,2) == mem(12,1));
  ASSUME(coinit(12,2) == co(12,1));
  ASSUME(deltainit(12,2) == delta(12,1));
  ASSUME(meminit(12,3) == mem(12,2));
  ASSUME(coinit(12,3) == co(12,2));
  ASSUME(deltainit(12,3) == delta(12,2));
  ASSUME(meminit(12,4) == mem(12,3));
  ASSUME(coinit(12,4) == co(12,3));
  ASSUME(deltainit(12,4) == delta(12,3));
  ASSUME(meminit(12,5) == mem(12,4));
  ASSUME(coinit(12,5) == co(12,4));
  ASSUME(deltainit(12,5) == delta(12,4));
  ASSUME(meminit(12,6) == mem(12,5));
  ASSUME(coinit(12,6) == co(12,5));
  ASSUME(deltainit(12,6) == delta(12,5));
  ASSUME(meminit(12,7) == mem(12,6));
  ASSUME(coinit(12,7) == co(12,6));
  ASSUME(deltainit(12,7) == delta(12,6));
  ASSUME(meminit(12,8) == mem(12,7));
  ASSUME(coinit(12,8) == co(12,7));
  ASSUME(deltainit(12,8) == delta(12,7));
  ASSUME(meminit(12,9) == mem(12,8));
  ASSUME(coinit(12,9) == co(12,8));
  ASSUME(deltainit(12,9) == delta(12,8));
  ASSUME(meminit(13,1) == mem(13,0));
  ASSUME(coinit(13,1) == co(13,0));
  ASSUME(deltainit(13,1) == delta(13,0));
  ASSUME(meminit(13,2) == mem(13,1));
  ASSUME(coinit(13,2) == co(13,1));
  ASSUME(deltainit(13,2) == delta(13,1));
  ASSUME(meminit(13,3) == mem(13,2));
  ASSUME(coinit(13,3) == co(13,2));
  ASSUME(deltainit(13,3) == delta(13,2));
  ASSUME(meminit(13,4) == mem(13,3));
  ASSUME(coinit(13,4) == co(13,3));
  ASSUME(deltainit(13,4) == delta(13,3));
  ASSUME(meminit(13,5) == mem(13,4));
  ASSUME(coinit(13,5) == co(13,4));
  ASSUME(deltainit(13,5) == delta(13,4));
  ASSUME(meminit(13,6) == mem(13,5));
  ASSUME(coinit(13,6) == co(13,5));
  ASSUME(deltainit(13,6) == delta(13,5));
  ASSUME(meminit(13,7) == mem(13,6));
  ASSUME(coinit(13,7) == co(13,6));
  ASSUME(deltainit(13,7) == delta(13,6));
  ASSUME(meminit(13,8) == mem(13,7));
  ASSUME(coinit(13,8) == co(13,7));
  ASSUME(deltainit(13,8) == delta(13,7));
  ASSUME(meminit(13,9) == mem(13,8));
  ASSUME(coinit(13,9) == co(13,8));
  ASSUME(deltainit(13,9) == delta(13,8));
  ASSUME(meminit(14,1) == mem(14,0));
  ASSUME(coinit(14,1) == co(14,0));
  ASSUME(deltainit(14,1) == delta(14,0));
  ASSUME(meminit(14,2) == mem(14,1));
  ASSUME(coinit(14,2) == co(14,1));
  ASSUME(deltainit(14,2) == delta(14,1));
  ASSUME(meminit(14,3) == mem(14,2));
  ASSUME(coinit(14,3) == co(14,2));
  ASSUME(deltainit(14,3) == delta(14,2));
  ASSUME(meminit(14,4) == mem(14,3));
  ASSUME(coinit(14,4) == co(14,3));
  ASSUME(deltainit(14,4) == delta(14,3));
  ASSUME(meminit(14,5) == mem(14,4));
  ASSUME(coinit(14,5) == co(14,4));
  ASSUME(deltainit(14,5) == delta(14,4));
  ASSUME(meminit(14,6) == mem(14,5));
  ASSUME(coinit(14,6) == co(14,5));
  ASSUME(deltainit(14,6) == delta(14,5));
  ASSUME(meminit(14,7) == mem(14,6));
  ASSUME(coinit(14,7) == co(14,6));
  ASSUME(deltainit(14,7) == delta(14,6));
  ASSUME(meminit(14,8) == mem(14,7));
  ASSUME(coinit(14,8) == co(14,7));
  ASSUME(deltainit(14,8) == delta(14,7));
  ASSUME(meminit(14,9) == mem(14,8));
  ASSUME(coinit(14,9) == co(14,8));
  ASSUME(deltainit(14,9) == delta(14,8));
  ASSUME(meminit(15,1) == mem(15,0));
  ASSUME(coinit(15,1) == co(15,0));
  ASSUME(deltainit(15,1) == delta(15,0));
  ASSUME(meminit(15,2) == mem(15,1));
  ASSUME(coinit(15,2) == co(15,1));
  ASSUME(deltainit(15,2) == delta(15,1));
  ASSUME(meminit(15,3) == mem(15,2));
  ASSUME(coinit(15,3) == co(15,2));
  ASSUME(deltainit(15,3) == delta(15,2));
  ASSUME(meminit(15,4) == mem(15,3));
  ASSUME(coinit(15,4) == co(15,3));
  ASSUME(deltainit(15,4) == delta(15,3));
  ASSUME(meminit(15,5) == mem(15,4));
  ASSUME(coinit(15,5) == co(15,4));
  ASSUME(deltainit(15,5) == delta(15,4));
  ASSUME(meminit(15,6) == mem(15,5));
  ASSUME(coinit(15,6) == co(15,5));
  ASSUME(deltainit(15,6) == delta(15,5));
  ASSUME(meminit(15,7) == mem(15,6));
  ASSUME(coinit(15,7) == co(15,6));
  ASSUME(deltainit(15,7) == delta(15,6));
  ASSUME(meminit(15,8) == mem(15,7));
  ASSUME(coinit(15,8) == co(15,7));
  ASSUME(deltainit(15,8) == delta(15,7));
  ASSUME(meminit(15,9) == mem(15,8));
  ASSUME(coinit(15,9) == co(15,8));
  ASSUME(deltainit(15,9) == delta(15,8));

  ASSERT(r32== 0);

}
