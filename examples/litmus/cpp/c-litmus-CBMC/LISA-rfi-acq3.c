/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[3]; 
volatile int v_1_X0_1; 
volatile int v_1_X4_1; 
volatile int v_1_X5_0; 

void *t0(void *arg){
label_1:;
  vars[1] = 1;
  FENCE();
  vars[0] = 1;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = vars[0];
  int v4_W2 = v3_W0 & 128;
  int v5_W2 = v4_W2 + 1;
  vars[2] = v5_W2;
  FENCE();
  int v8_W4 = vars[2];
  int v11_W5 = vars[1];
  int v17 = (v3_W0 == 1);
  v_1_X0_1 = v17;
  int v18 = (v8_W4 == 1);
  v_1_X4_1 = v18;
  int v19 = (v11_W5 == 0);
  v_1_X5_0 = v19;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;
  v_1_X4_1 = 0;
  v_1_X5_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v12 = v_1_X0_1;
  int v13 = v_1_X4_1;
  int v14 = v_1_X5_0;
  int v15_conj = v13 & v14;
  int v16_conj = v12 & v15_conj;
  if (v16_conj == 1) assert(0);
  return 0;
}
