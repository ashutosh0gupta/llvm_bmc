/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[3]; 
volatile int v_0_X1_0; 
volatile int v_1_X1_0; 
volatile int v_2_X1_0; 

void *t0(void *arg){
label_1:;
  vars[1] = 1;
  FENCE();
  int v3_W1 = vars[0];
  int v15 = (v3_W1 == 0);
  v_0_X1_0 = v15;
  return NULL;
}

void *t1(void *arg){
label_2:;
  FENCE();
  vars[0] = 1;
  int v6_W1 = vars[2];
  int v16 = (v6_W1 == 0);
  v_1_X1_0 = v16;
  return NULL;
}

void *t2(void *arg){
label_3:;
  FENCE();
  vars[2] = 1;
  FENCE();
  int v9_W1 = vars[1];
  int v17 = (v9_W1 == 0);
  v_2_X1_0 = v17;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_0_X1_0 = 0;
  v_1_X1_0 = 0;
  v_2_X1_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v10 = v_0_X1_0;
  int v11 = v_1_X1_0;
  int v12 = v_2_X1_0;
  int v13_conj = v11 & v12;
  int v14_conj = v10 & v13_conj;
  if (v14_conj == 1) assert(0);
  return 0;
}
