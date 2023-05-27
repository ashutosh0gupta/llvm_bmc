/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[3]; 
volatile int v_1_X0_1; 
volatile int v_1_X4_2; 
volatile int v_1_X6_0; 

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
  int v8_W4 = vars[2];
  int v9_W5 = v8_W4 & 128;
  int v12_W6 = vars[1+v9_W5];
  int v21 = (v3_W0 == 1);
  v_1_X0_1 = v21;
  int v22 = (v8_W4 == 2);
  v_1_X4_2 = v22;
  int v23 = (v12_W6 == 0);
  v_1_X6_0 = v23;
  return NULL;
}

void *t2(void *arg){
label_3:;
  vars[2] = 2;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;
  v_1_X4_2 = 0;
  v_1_X6_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v13 = vars[2];
  int v14 = (v13 == 2);
  int v15 = v_1_X0_1;
  int v16 = v_1_X4_2;
  int v17 = v_1_X6_0;
  int v18_conj = v16 & v17;
  int v19_conj = v15 & v18_conj;
  int v20_conj = v14 & v19_conj;
  if (v20_conj == 1) assert(0);
  return 0;
}
