/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[2]; 
volatile int v_0_X7_2; 
volatile int v_0_X2_3; 
volatile int v_1_X3_3; 
volatile int v_1_X2_2; 

void *t0(void *arg){
label_1:;
  vars[0] = 3;
  int v3_W2 = vars[0];
  int v4_W3 = v3_W2 ^ v3_W2;
  int v7_W4 = vars[1+v4_W3];
  int v8_W6 = v7_W4 ^ v7_W4;
  int v9_W6 = v8_W6 + 1;
  FENCE();
  vars[0] = v9_W6;
  int v12_W7 = vars[0];
  int v29 = (v12_W7 == 2);
  v_0_X7_2 = v29;
  int v30 = (v3_W2 == 3);
  v_0_X2_3 = v30;
  return NULL;
}

void *t1(void *arg){
label_2:;
  FENCE();
  vars[0] = 2;
  FENCE();
  int v15_W2 = vars[0];
  int v18_W3 = vars[0];
  int v31 = (v18_W3 == 3);
  v_1_X3_3 = v31;
  int v32 = (v15_W2 == 2);
  v_1_X2_2 = v32;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[1] = 0;
  vars[0] = 0;
  v_0_X7_2 = 0;
  v_0_X2_3 = 0;
  v_1_X3_3 = 0;
  v_1_X2_2 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v19 = vars[0];
  int v20 = (v19 == 3);
  int v21 = v_0_X7_2;
  int v22 = v_0_X2_3;
  int v23 = v_1_X3_3;
  int v24 = v_1_X2_2;
  int v25_conj = v23 & v24;
  int v26_conj = v22 & v25_conj;
  int v27_conj = v21 & v26_conj;
  int v28_conj = v20 & v27_conj;
  if (v28_conj == 1) assert(0);
  return 0;
}
