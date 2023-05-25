/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[4]; 
volatile int v_1_X0_1; 
volatile int v_1_X2_1; 
volatile int v_1_X6_0; 
volatile int v_1_X8_1; 
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
  int v6_W2 = vars[1];
  int v7_W3 = v6_W2 ^ v6_W2;
  int v10_W4 = vars[2+v7_W3];
  if (v10_W4) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v13_W6 = vars[3];
  int v16_W8 = vars[3];
  int v17_W9 = v16_W8 ^ v16_W8;
  int v20_W10 = vars[0+v17_W9];
  int v39 = (v3_W0 == 1);
  v_1_X0_1 = v39;
  int v40 = (v6_W2 == 1);
  v_1_X2_1 = v40;
  int v41 = (v13_W6 == 0);
  v_1_X6_0 = v41;
  int v42 = (v16_W8 == 1);
  v_1_X8_1 = v42;
  int v43 = (v20_W10 == 0);
  v_1_X10_0 = v43;
  return NULL;
}

void *t2(void *arg){
label_3:;
  vars[3] = 1;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  vars[3] = 0;
  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;
  v_1_X2_1 = 0;
  v_1_X6_0 = 0;
  v_1_X8_1 = 0;
  v_1_X10_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v21 = vars[3];
  int v22 = (v21 == 1);
  int v23 = vars[0];
  int v24 = (v23 == 1);
  int v25 = vars[1];
  int v26 = (v25 == 1);
  int v27 = v_1_X0_1;
  int v28 = v_1_X2_1;
  int v29 = v_1_X6_0;
  int v30 = v_1_X8_1;
  int v31 = v_1_X10_0;
  int v32_conj = v30 & v31;
  int v33_conj = v29 & v32_conj;
  int v34_conj = v28 & v33_conj;
  int v35_conj = v27 & v34_conj;
  int v36_conj = v26 & v35_conj;
  int v37_conj = v24 & v36_conj;
  int v38_conj = v22 & v37_conj;
  if (v38_conj == 1) assert(0);
  return 0;
}
