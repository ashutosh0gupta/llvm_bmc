/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[3]; 
volatile int v_1_X0_1; 
volatile int v_1_X2_1; 
volatile int v_1_X5_1; 
volatile int v_1_X7_0; 
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
  int v7_W3 = v6_W2 ^ v6_W2;
  int v8_W3 = v7_W3 + 1;
  vars[2] = v8_W3;
  int v11_W5 = vars[2];
  int v12_W6 = v11_W5 ^ v11_W5;
  int v15_W7 = vars[0+v12_W6];
  int v18_W9 = vars[0];
  int v37 = (v3_W0 == 1);
  v_1_X0_1 = v37;
  int v38 = (v6_W2 == 1);
  v_1_X2_1 = v38;
  int v39 = (v11_W5 == 1);
  v_1_X5_1 = v39;
  int v40 = (v15_W7 == 0);
  v_1_X7_0 = v40;
  int v41 = (v18_W9 == 0);
  v_1_X9_0 = v41;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;
  v_1_X2_1 = 0;
  v_1_X5_1 = 0;
  v_1_X7_0 = 0;
  v_1_X9_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v19 = vars[0];
  int v20 = (v19 == 1);
  int v21 = vars[1];
  int v22 = (v21 == 1);
  int v23 = vars[2];
  int v24 = (v23 == 1);
  int v25 = v_1_X0_1;
  int v26 = v_1_X2_1;
  int v27 = v_1_X5_1;
  int v28 = v_1_X7_0;
  int v29 = v_1_X9_0;
  int v30_conj = v28 & v29;
  int v31_conj = v27 & v30_conj;
  int v32_conj = v26 & v31_conj;
  int v33_conj = v25 & v32_conj;
  int v34_conj = v24 & v33_conj;
  int v35_conj = v22 & v34_conj;
  int v36_conj = v20 & v35_conj;
  if (v36_conj == 1) assert(0);
  return 0;
}
