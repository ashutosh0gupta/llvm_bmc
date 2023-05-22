/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[4]; 
volatile int v_0_X0_1; 
volatile int v_1_X2_1; 
volatile int v_1_X0_1; 
volatile int v_0_X3_1; 

void *t0(void *arg){
label_1:;
  int v3_W0 = vars[3];
  FENCE();
  FENCE();
  vars[2] = 1;
  FENCE();
  FENCE();
  int v6_W3 = vars[1];
  FENCE();
  vars[0] = 1;
  int v20 = (v3_W0 == 1);
  v_0_X0_1 = v20;
  int v23 = (v6_W3 == 1);
  v_0_X3_1 = v23;
  return NULL;
}

void *t1(void *arg){
label_2:;
  FENCE();
  int v9_W0 = vars[2];
  int v12_W2 = vars[0];
  vars[3] = 1;
  FENCE();
  vars[1] = 1;
  int v21 = (v12_W2 == 1);
  v_1_X2_1 = v21;
  int v22 = (v9_W0 == 1);
  v_1_X0_1 = v22;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[3] = 0;
  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_0_X0_1 = 0;
  v_1_X2_1 = 0;
  v_1_X0_1 = 0;
  v_0_X3_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v13 = v_0_X0_1;
  int v14 = v_1_X2_1;
  int v15 = v_1_X0_1;
  int v16 = v_0_X3_1;
  int v17_disj = v15 | v16;
  int v18_conj = v14 & v17_disj;
  int v19_conj = v13 & v18_conj;
  if (v19_conj == 1) assert(0);
  return 0;
}
