/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[3]; 
volatile int v_0_X7_2; 
volatile int v_1_X2_0; 

void *t0(void *arg){
label_1:;
  vars[0] = 1;
  vars[1] = 1;
  vars[1] = 2;
  FENCE();
  vars[2] = 1;
  int v3_W7 = vars[2];
  int v19 = (v3_W7 == 2);
  v_0_X7_2 = v19;
  return NULL;
}

void *t1(void *arg){
label_2:;
  FENCE();
  vars[2] = 2;
  FENCE();
  int v6_W2 = vars[0];
  int v20 = (v6_W2 == 0);
  v_1_X2_0 = v20;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_0_X7_2 = 0;
  v_1_X2_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v7 = vars[0];
  int v8 = (v7 == 1);
  int v9 = vars[1];
  int v10 = (v9 == 2);
  int v11 = vars[2];
  int v12 = (v11 == 2);
  int v13 = v_0_X7_2;
  int v14 = v_1_X2_0;
  int v15_conj = v13 & v14;
  int v16_conj = v12 & v15_conj;
  int v17_conj = v10 & v16_conj;
  int v18_conj = v8 & v17_conj;
  if (v18_conj == 1) assert(0);
  return 0;
}
