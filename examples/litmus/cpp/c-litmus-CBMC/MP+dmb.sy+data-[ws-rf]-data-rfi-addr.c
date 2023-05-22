/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[4]; 
volatile int v_1_X0_1; 
volatile int v_1_X4_2; 
volatile int v_1_X7_1; 
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
  int v5_W2 = v4_W2 + 1;
  vars[2] = v5_W2;
  int v8_W4 = vars[2];
  int v9_W5 = v8_W4 ^ v8_W4;
  int v10_W5 = v9_W5 + 1;
  vars[3] = v10_W5;
  int v13_W7 = vars[3];
  int v14_W8 = v13_W7 ^ v13_W7;
  int v17_W9 = vars[0+v14_W8];
  int v37 = (v3_W0 == 1);
  v_1_X0_1 = v37;
  int v38 = (v8_W4 == 2);
  v_1_X4_2 = v38;
  int v39 = (v13_W7 == 1);
  v_1_X7_1 = v39;
  int v40 = (v17_W9 == 0);
  v_1_X9_0 = v40;
  return NULL;
}

void *t2(void *arg){
label_3:;
  vars[2] = 2;
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
  v_1_X4_2 = 0;
  v_1_X7_1 = 0;
  v_1_X9_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v18 = vars[3];
  int v19 = (v18 == 1);
  int v20 = vars[0];
  int v21 = (v20 == 1);
  int v22 = vars[1];
  int v23 = (v22 == 1);
  int v24 = vars[2];
  int v25 = (v24 == 2);
  int v26 = v_1_X0_1;
  int v27 = v_1_X4_2;
  int v28 = v_1_X7_1;
  int v29 = v_1_X9_0;
  int v30_conj = v28 & v29;
  int v31_conj = v27 & v30_conj;
  int v32_conj = v26 & v31_conj;
  int v33_conj = v25 & v32_conj;
  int v34_conj = v23 & v33_conj;
  int v35_conj = v21 & v34_conj;
  int v36_conj = v19 & v35_conj;
  if (v36_conj == 1) assert(0);
  return 0;
}
