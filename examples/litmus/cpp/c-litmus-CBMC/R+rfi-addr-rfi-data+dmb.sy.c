/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[3]; 
volatile int v_0_X2_1; 
volatile int v_0_X6_1; 
volatile int v_1_X2_0; 

void *t0(void *arg){
label_1:;
  vars[0] = 1;
  int v3_W2 = vars[0];
  int v4_W3 = v3_W2 ^ v3_W2;
  vars[1+v4_W3] = 1;
  int v7_W6 = vars[1];
  int v8_W7 = v7_W6 ^ v7_W6;
  int v9_W7 = v8_W7 + 1;
  vars[2] = v9_W7;
  int v27 = (v3_W2 == 1);
  v_0_X2_1 = v27;
  int v28 = (v7_W6 == 1);
  v_0_X6_1 = v28;
  return NULL;
}

void *t1(void *arg){
label_2:;
  vars[2] = 2;
  FENCE();
  int v12_W2 = vars[0];
  int v29 = (v12_W2 == 0);
  v_1_X2_0 = v29;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_0_X2_1 = 0;
  v_0_X6_1 = 0;
  v_1_X2_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v13 = vars[0];
  int v14 = (v13 == 1);
  int v15 = vars[1];
  int v16 = (v15 == 1);
  int v17 = vars[2];
  int v18 = (v17 == 2);
  int v19 = v_0_X2_1;
  int v20 = v_0_X6_1;
  int v21 = v_1_X2_0;
  int v22_conj = v20 & v21;
  int v23_conj = v19 & v22_conj;
  int v24_conj = v18 & v23_conj;
  int v25_conj = v16 & v24_conj;
  int v26_conj = v14 & v25_conj;
  if (v26_conj == 1) assert(0);
  return 0;
}
