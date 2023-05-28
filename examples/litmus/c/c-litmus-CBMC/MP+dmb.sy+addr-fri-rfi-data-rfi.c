/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[3]; 
volatile int v_1_X0_1; 
volatile int v_1_X3_0; 
volatile int v_1_X6_1; 
volatile int v_1_X9_1; 

void *t0(void *arg){
label_1:;
  vars[0] = 2;
  FENCE();
  vars[1] = 1;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = vars[1];
  int v4_W2 = v3_W0 ^ v3_W0;
  int v7_W3 = vars[2+v4_W2];
  vars[2] = 1;
  int v10_W6 = vars[2];
  int v11_W7 = v10_W6 ^ v10_W6;
  int v12_W7 = v11_W7 + 1;
  vars[0] = v12_W7;
  int v15_W9 = vars[0];
  int v32 = (v3_W0 == 1);
  v_1_X0_1 = v32;
  int v33 = (v7_W3 == 0);
  v_1_X3_0 = v33;
  int v34 = (v10_W6 == 1);
  v_1_X6_1 = v34;
  int v35 = (v15_W9 == 1);
  v_1_X9_1 = v35;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;
  v_1_X3_0 = 0;
  v_1_X6_1 = 0;
  v_1_X9_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v16 = vars[0];
  int v17 = (v16 == 2);
  int v18 = vars[1];
  int v19 = (v18 == 1);
  int v20 = vars[2];
  int v21 = (v20 == 1);
  int v22 = v_1_X0_1;
  int v23 = v_1_X3_0;
  int v24 = v_1_X6_1;
  int v25 = v_1_X9_1;
  int v26_conj = v24 & v25;
  int v27_conj = v23 & v26_conj;
  int v28_conj = v22 & v27_conj;
  int v29_conj = v21 & v28_conj;
  int v30_conj = v19 & v29_conj;
  int v31_conj = v17 & v30_conj;
  if (v31_conj == 1) assert(0);
  return 0;
}
