/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[1]; 
volatile int v_0_X0_1; 

void *t0(void *arg){
label_1:;
  int v3_W0 = vars[0];
  FENCE();
  vars[0] = 1;
  int v5 = (v3_W0 == 1);
  v_0_X0_1 = v5;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 

  vars[0] = 0;
  v_0_X0_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);

  pthread_join(thr0, NULL);

  int v4 = v_0_X0_1;
  if (v4 == 1) assert(0);
  return 0;
}
