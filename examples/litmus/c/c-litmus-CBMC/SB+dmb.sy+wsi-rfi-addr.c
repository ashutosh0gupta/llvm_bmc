/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[2]; 
volatile int v_0_X2_0; 
volatile int v_1_X3_2; 
volatile int v_1_X5_0; 

void *t0(void *arg){
label_1:;
  vars[0] = 1;
  FENCE();
  int v3_W2 = vars[1];
  int v22 = (v3_W2 == 0);
  v_0_X2_0 = v22;
  return NULL;
}

void *t1(void *arg){
label_2:;
  vars[1] = 1;
  vars[1] = 2;
  int v6_W3 = vars[1];
  int v7_W4 = v6_W3 ^ v6_W3;
  int v10_W5 = vars[0+v7_W4];
  int v23 = (v6_W3 == 2);
  v_1_X3_2 = v23;
  int v24 = (v10_W5 == 0);
  v_1_X5_0 = v24;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[1] = 0;
  vars[0] = 0;
  v_0_X2_0 = 0;
  v_1_X3_2 = 0;
  v_1_X5_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v11 = vars[0];
  int v12 = (v11 == 1);
  int v13 = vars[1];
  int v14 = (v13 == 2);
  int v15 = v_0_X2_0;
  int v16 = v_1_X3_2;
  int v17 = v_1_X5_0;
  int v18_conj = v16 & v17;
  int v19_conj = v15 & v18_conj;
  int v20_conj = v14 & v19_conj;
  int v21_conj = v12 & v20_conj;
  if (v21_conj == 1) assert(0);
  return 0;
}
