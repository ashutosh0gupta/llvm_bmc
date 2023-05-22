/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[4]; 
volatile int v_1_X0_1; 
volatile int v_1_X3_0; 
volatile int v_1_X5_1; 
volatile int v_1_X8_0; 

void *t0(void *arg){
label_1:;
  vars[0] = 1;
  FENCE();
  vars[1] = 1;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = vars[1];
  int v4_W2 = v3_W0 ^ v3_W0;
  int v7_W3 = vars[2+v4_W2];
  int v10_W5 = vars[3];
  int v11_W7 = v10_W5 ^ v10_W5;
  int v14_W8 = vars[0+v11_W7];
  int v22 = (v3_W0 == 1);
  v_1_X0_1 = v22;
  int v23 = (v7_W3 == 0);
  v_1_X3_0 = v23;
  int v24 = (v10_W5 == 1);
  v_1_X5_1 = v24;
  int v25 = (v14_W8 == 0);
  v_1_X8_0 = v25;
  return NULL;
}

void *t2(void *arg){
label_3:;
  vars[2] = 1;
  FENCE();
  vars[3] = 1;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  vars[3] = 0;
  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;
  v_1_X3_0 = 0;
  v_1_X5_1 = 0;
  v_1_X8_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v15 = v_1_X0_1;
  int v16 = v_1_X3_0;
  int v17 = v_1_X5_1;
  int v18 = v_1_X8_0;
  int v19_conj = v17 & v18;
  int v20_conj = v16 & v19_conj;
  int v21_conj = v15 & v20_conj;
  if (v21_conj == 1) assert(0);
  return 0;
}
