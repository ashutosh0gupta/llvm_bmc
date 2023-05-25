/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[3]; 
volatile int v_0_X6_2; 
volatile int v_1_X3_0; 

void *t0(void *arg){
label_1:;
  vars[0] = 1;
  int v3_W2 = vars[1];
  int v4_W4 = v3_W2 ^ v3_W2;
  int v5_W4 = v4_W4 + 1;
  FENCE();
  vars[2] = v5_W4;
  int v8_W6 = vars[2];
  int v21 = (v8_W6 == 2);
  v_0_X6_2 = v21;
  return NULL;
}

void *t1(void *arg){
label_2:;
  FENCE();
  vars[2] = 2;
  vars[2] = 3;
  FENCE();
  int v11_W3 = vars[0];
  int v22 = (v11_W3 == 0);
  v_1_X3_0 = v22;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_0_X6_2 = 0;
  v_1_X3_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v12 = vars[0];
  int v13 = (v12 == 1);
  int v14 = vars[2];
  int v15 = (v14 == 3);
  int v16 = v_0_X6_2;
  int v17 = v_1_X3_0;
  int v18_conj = v16 & v17;
  int v19_conj = v15 & v18_conj;
  int v20_conj = v13 & v19_conj;
  if (v20_conj == 1) assert(0);
  return 0;
}
