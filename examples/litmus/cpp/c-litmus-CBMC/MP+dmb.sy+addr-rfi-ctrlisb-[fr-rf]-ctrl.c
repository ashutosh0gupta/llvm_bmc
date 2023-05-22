/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[4]; 
volatile int v_1_X0_1; 
volatile int v_1_X5_1; 
volatile int v_1_X6_0; 
volatile int v_1_X8_1; 
volatile int v_1_X9_0; 

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
  vars[2+v4_W2] = 1;
  int v7_W5 = vars[2];
  if (v7_W5) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  FENCE();
  int v10_W6 = vars[3];
  int v13_W8 = vars[3];
  if (v13_W8) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  int v16_W9 = vars[0];
  int v38 = (v3_W0 == 1);
  v_1_X0_1 = v38;
  int v39 = (v7_W5 == 1);
  v_1_X5_1 = v39;
  int v40 = (v10_W6 == 0);
  v_1_X6_0 = v40;
  int v41 = (v13_W8 == 1);
  v_1_X8_1 = v41;
  int v42 = (v16_W9 == 0);
  v_1_X9_0 = v42;
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
  v_1_X5_1 = 0;
  v_1_X6_0 = 0;
  v_1_X8_1 = 0;
  v_1_X9_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v17 = vars[3];
  int v18 = (v17 == 1);
  int v19 = vars[0];
  int v20 = (v19 == 1);
  int v21 = vars[1];
  int v22 = (v21 == 1);
  int v23 = vars[2];
  int v24 = (v23 == 1);
  int v25 = v_1_X0_1;
  int v26 = v_1_X5_1;
  int v27 = v_1_X6_0;
  int v28 = v_1_X8_1;
  int v29 = v_1_X9_0;
  int v30_conj = v28 & v29;
  int v31_conj = v27 & v30_conj;
  int v32_conj = v26 & v31_conj;
  int v33_conj = v25 & v32_conj;
  int v34_conj = v24 & v33_conj;
  int v35_conj = v22 & v34_conj;
  int v36_conj = v20 & v35_conj;
  int v37_conj = v18 & v36_conj;
  if (v37_conj == 1) assert(0);
  return 0;
}
