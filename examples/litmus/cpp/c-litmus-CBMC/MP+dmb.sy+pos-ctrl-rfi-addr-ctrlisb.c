/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[4]; 
volatile int v_1_X0_1; 
volatile int v_1_X2_1; 
volatile int v_1_X5_1; 
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
  int v6_W2 = vars[1];
  if (v6_W2) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  vars[2] = 1;
  int v9_W5 = vars[2];
  int v10_W6 = v9_W5 ^ v9_W5;
  int v13_W7 = vars[3+v10_W6];
  if (v13_W7) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  FENCE();
  int v16_W9 = vars[0];
  int v33 = (v3_W0 == 1);
  v_1_X0_1 = v33;
  int v34 = (v6_W2 == 1);
  v_1_X2_1 = v34;
  int v35 = (v9_W5 == 1);
  v_1_X5_1 = v35;
  int v36 = (v16_W9 == 0);
  v_1_X9_0 = v36;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[3] = 0;
  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;
  v_1_X2_1 = 0;
  v_1_X5_1 = 0;
  v_1_X9_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v17 = vars[0];
  int v18 = (v17 == 1);
  int v19 = vars[1];
  int v20 = (v19 == 1);
  int v21 = vars[2];
  int v22 = (v21 == 1);
  int v23 = v_1_X0_1;
  int v24 = v_1_X2_1;
  int v25 = v_1_X5_1;
  int v26 = v_1_X9_0;
  int v27_conj = v25 & v26;
  int v28_conj = v24 & v27_conj;
  int v29_conj = v23 & v28_conj;
  int v30_conj = v22 & v29_conj;
  int v31_conj = v20 & v30_conj;
  int v32_conj = v18 & v31_conj;
  if (v32_conj == 1) assert(0);
  return 0;
}
