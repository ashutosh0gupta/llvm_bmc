/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[3]; 
volatile int v_1_X0_1; 
volatile int v_1_X3_0; 
volatile int v_1_X5_0; 
volatile int v_1_X6_1; 
volatile int v_1_X8_0; 
volatile int v_1_X10_0; 

void *t0(void *arg){
label_1:;
  vars[0] = 1;
  FENCE();
  vars[1] = 1;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = vars[1];
  int v4_W2 = v3_W0 ^ v3_W0;
  int v7_W3 = vars[2+v4_W2];
  int v10_W5 = vars[2];
  int v13_W6 = vars[2];
  int v14_W7 = v13_W6 ^ v13_W6;
  int v17_W8 = vars[0+v14_W7];
  int v20_W10 = vars[0];
  int v41 = (v3_W0 == 1);
  v_1_X0_1 = v41;
  int v42 = (v7_W3 == 0);
  v_1_X3_0 = v42;
  int v43 = (v10_W5 == 0);
  v_1_X5_0 = v43;
  int v44 = (v13_W6 == 1);
  v_1_X6_1 = v44;
  int v45 = (v17_W8 == 0);
  v_1_X8_0 = v45;
  int v46 = (v20_W10 == 0);
  v_1_X10_0 = v46;
  return NULL;
}

void *t2(void *arg){
label_3:;
  vars[2] = 1;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;
  v_1_X3_0 = 0;
  v_1_X5_0 = 0;
  v_1_X6_1 = 0;
  v_1_X8_0 = 0;
  v_1_X10_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v21 = vars[0];
  int v22 = (v21 == 1);
  int v23 = vars[1];
  int v24 = (v23 == 1);
  int v25 = vars[2];
  int v26 = (v25 == 1);
  int v27 = v_1_X0_1;
  int v28 = v_1_X3_0;
  int v29 = v_1_X5_0;
  int v30 = v_1_X6_1;
  int v31 = v_1_X8_0;
  int v32 = v_1_X10_0;
  int v33_conj = v31 & v32;
  int v34_conj = v30 & v33_conj;
  int v35_conj = v29 & v34_conj;
  int v36_conj = v28 & v35_conj;
  int v37_conj = v27 & v36_conj;
  int v38_conj = v26 & v37_conj;
  int v39_conj = v24 & v38_conj;
  int v40_conj = v22 & v39_conj;
  if (v40_conj == 1) assert(0);
  return 0;
}
