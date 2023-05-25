/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[2]; 
volatile int v_1_X0_1; 
volatile int v_1_X2_2; 
volatile int v_1_X4_0; 
volatile int v_1_X6_0; 
volatile int v_1_X8_1; 

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
  int v6_W2 = vars[1];
  int v7_W3 = v6_W2 ^ v6_W2;
  int v10_W4 = vars[0+v7_W3];
  int v13_W6 = vars[0];
  vars[0] = 1;
  int v16_W8 = vars[0];
  int v32 = (v3_W0 == 1);
  v_1_X0_1 = v32;
  int v33 = (v6_W2 == 2);
  v_1_X2_2 = v33;
  int v34 = (v10_W4 == 0);
  v_1_X4_0 = v34;
  int v35 = (v13_W6 == 0);
  v_1_X6_0 = v35;
  int v36 = (v16_W8 == 1);
  v_1_X8_1 = v36;
  return NULL;
}

void *t2(void *arg){
label_3:;
  vars[1] = 2;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;
  v_1_X2_2 = 0;
  v_1_X4_0 = 0;
  v_1_X6_0 = 0;
  v_1_X8_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v17 = vars[0];
  int v18 = (v17 == 2);
  int v19 = vars[1];
  int v20 = (v19 == 2);
  int v21 = v_1_X0_1;
  int v22 = v_1_X2_2;
  int v23 = v_1_X4_0;
  int v24 = v_1_X6_0;
  int v25 = v_1_X8_1;
  int v26_conj = v24 & v25;
  int v27_conj = v23 & v26_conj;
  int v28_conj = v22 & v27_conj;
  int v29_conj = v21 & v28_conj;
  int v30_conj = v20 & v29_conj;
  int v31_conj = v18 & v30_conj;
  if (v31_conj == 1) assert(0);
  return 0;
}
