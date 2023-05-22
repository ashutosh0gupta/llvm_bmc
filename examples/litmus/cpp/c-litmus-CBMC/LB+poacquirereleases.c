/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[2]; 
volatile int v_0_X0_1; 
volatile int v_1_X0_1; 

void *t0(void *arg){
label_1:;
  FENCE();
  int v3_W0 = vars[1];
  FENCE();
  vars[0] = 1;
  int v10 = (v3_W0 == 1);
  v_0_X0_1 = v10;
  return NULL;
}

void *t1(void *arg){
label_2:;
  FENCE();
  int v6_W0 = vars[0];
  FENCE();
  vars[1] = 1;
  int v11 = (v6_W0 == 1);
  v_1_X0_1 = v11;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[1] = 0;
  vars[0] = 0;
  v_0_X0_1 = 0;
  v_1_X0_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v7 = v_0_X0_1;
  int v8 = v_1_X0_1;
  int v9_conj = v7 & v8;
  if (v9_conj == 1) assert(0);
  return 0;
}
