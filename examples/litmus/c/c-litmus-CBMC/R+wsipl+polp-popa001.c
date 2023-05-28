/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[2]; 
volatile int v_0_X3_3; 
volatile int v_1_X4_0; 

void *t0(void *arg){
label_1:;
  vars[0] = 1;
  FENCE();
  vars[0] = 2;
  int v3_W3 = vars[0];
  int v16 = (v3_W3 == 3);
  v_0_X3_3 = v16;
  return NULL;
}

void *t1(void *arg){
label_2:;
  FENCE();
  vars[0] = 3;
  int v6_W2 = vars[1];
  FENCE();
  int v9_W4 = vars[0];
  int v17 = (v9_W4 == 0);
  v_1_X4_0 = v17;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[1] = 0;
  vars[0] = 0;
  v_0_X3_3 = 0;
  v_1_X4_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v10 = vars[0];
  int v11 = (v10 == 3);
  int v12 = v_0_X3_3;
  int v13 = v_1_X4_0;
  int v14_conj = v12 & v13;
  int v15_conj = v11 & v14_conj;
  if (v15_conj == 1) assert(0);
  return 0;
}
