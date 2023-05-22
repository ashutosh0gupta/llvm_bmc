/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[2]; 
volatile int v_0_X0_1; 
volatile int v_1_X0_1; 
volatile int v_1_X3_0; 
volatile int v_1_X5_0; 

void *t0(void *arg){
label_1:;
  int v3_W0 = vars[0];
  int v4_W2 = v3_W0 ^ v3_W0;
  int v5_W2 = v4_W2 + 1;
  vars[1] = v5_W2;
  int v29 = (v3_W0 == 1);
  v_0_X0_1 = v29;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v8_W0 = vars[1];
  int v9_W2 = v8_W0 ^ v8_W0;
  int v12_W3 = vars[0+v9_W2];
  int v15_W5 = vars[0];
  vars[0] = 1;
  int v30 = (v8_W0 == 1);
  v_1_X0_1 = v30;
  int v31 = (v12_W3 == 0);
  v_1_X3_0 = v31;
  int v32 = (v15_W5 == 0);
  v_1_X5_0 = v32;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[1] = 0;
  vars[0] = 0;
  v_0_X0_1 = 0;
  v_1_X0_1 = 0;
  v_1_X3_0 = 0;
  v_1_X5_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v16 = vars[0];
  int v17 = (v16 == 1);
  int v18 = vars[1];
  int v19 = (v18 == 1);
  int v20 = v_0_X0_1;
  int v21 = v_1_X0_1;
  int v22 = v_1_X3_0;
  int v23 = v_1_X5_0;
  int v24_conj = v22 & v23;
  int v25_conj = v21 & v24_conj;
  int v26_conj = v20 & v25_conj;
  int v27_conj = v19 & v26_conj;
  int v28_conj = v17 & v27_conj;
  if (v28_conj == 1) assert(0);
  return 0;
}
