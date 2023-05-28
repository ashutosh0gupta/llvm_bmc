/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[8]; 
volatile int v_0_X0_1; 
volatile int v_1_X4_1; 
volatile int v_2_X0_1; 
volatile int v_3_X4_1; 
volatile int v_1_X0_1; 
volatile int v_0_X3_1; 
volatile int v_3_X0_1; 
volatile int v_0_X5_1; 
volatile int v_1_X2_1; 
volatile int v_2_X3_1; 
volatile int v_3_X2_1; 
volatile int v_2_X5_1; 

void *t0(void *arg){
label_1:;
  int v3_W0 = vars[4];
  FENCE();
  FENCE();
  vars[3] = 1;
  FENCE();
  FENCE();
  int v6_W3 = vars[2];
  FENCE();
  int v9_W5 = vars[1];
  FENCE();
  vars[0] = 1;
  int v60 = (v3_W0 == 1);
  v_0_X0_1 = v60;
  int v65 = (v6_W3 == 1);
  v_0_X3_1 = v65;
  int v67 = (v9_W5 == 1);
  v_0_X5_1 = v67;
  return NULL;
}

void *t1(void *arg){
label_2:;
  FENCE();
  int v12_W0 = vars[3];
  FENCE();
  int v15_W2 = vars[6];
  int v18_W4 = vars[0];
  vars[5] = 1;
  FENCE();
  vars[2] = 1;
  int v61 = (v18_W4 == 1);
  v_1_X4_1 = v61;
  int v64 = (v12_W0 == 1);
  v_1_X0_1 = v64;
  int v68 = (v15_W2 == 1);
  v_1_X2_1 = v68;
  return NULL;
}

void *t2(void *arg){
label_3:;
  int v21_W0 = vars[5];
  FENCE();
  FENCE();
  vars[6] = 1;
  FENCE();
  FENCE();
  int v24_W3 = vars[2];
  FENCE();
  int v27_W5 = vars[1];
  FENCE();
  vars[7] = 1;
  int v62 = (v21_W0 == 1);
  v_2_X0_1 = v62;
  int v69 = (v24_W3 == 1);
  v_2_X3_1 = v69;
  int v71 = (v27_W5 == 1);
  v_2_X5_1 = v71;
  return NULL;
}

void *t3(void *arg){
label_4:;
  FENCE();
  int v30_W0 = vars[3];
  FENCE();
  int v33_W2 = vars[6];
  int v36_W4 = vars[7];
  vars[4] = 1;
  FENCE();
  vars[1] = 1;
  int v63 = (v36_W4 == 1);
  v_3_X4_1 = v63;
  int v66 = (v30_W0 == 1);
  v_3_X0_1 = v66;
  int v70 = (v33_W2 == 1);
  v_3_X2_1 = v70;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 
  pthread_t thr3; 

  vars[7] = 0;
  vars[6] = 0;
  vars[5] = 0;
  vars[4] = 0;
  vars[3] = 0;
  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_0_X0_1 = 0;
  v_1_X4_1 = 0;
  v_2_X0_1 = 0;
  v_3_X4_1 = 0;
  v_1_X0_1 = 0;
  v_0_X3_1 = 0;
  v_3_X0_1 = 0;
  v_0_X5_1 = 0;
  v_1_X2_1 = 0;
  v_2_X3_1 = 0;
  v_3_X2_1 = 0;
  v_2_X5_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);
  pthread_create(&thr3, NULL, t3, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);

  int v37 = v_0_X0_1;
  int v38 = v_1_X4_1;
  int v39 = v_2_X0_1;
  int v40 = v_3_X4_1;
  int v41 = v_1_X0_1;
  int v42 = v_0_X3_1;
  int v43_disj = v41 | v42;
  int v44 = v_3_X0_1;
  int v45 = v_0_X5_1;
  int v46_disj = v44 | v45;
  int v47 = v_1_X2_1;
  int v48 = v_2_X3_1;
  int v49_disj = v47 | v48;
  int v50 = v_3_X2_1;
  int v51 = v_2_X5_1;
  int v52_disj = v50 | v51;
  int v53_conj = v49_disj & v52_disj;
  int v54_conj = v46_disj & v53_conj;
  int v55_conj = v43_disj & v54_conj;
  int v56_conj = v40 & v55_conj;
  int v57_conj = v39 & v56_conj;
  int v58_conj = v38 & v57_conj;
  int v59_conj = v37 & v58_conj;
  if (v59_conj == 1) assert(0);
  return 0;
}
