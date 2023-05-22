/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[4]; 
volatile int v_0_X8_2; 
volatile int v_1_X2_0; 

void *t0(void *arg){
label_1:;
  vars[0] = 1;
  vars[1] = 1;
  int v3_W4 = vars[2];
  int v4_W6 = v3_W4 ^ v3_W4;
  int v5_W6 = v4_W6 + 1;
  FENCE();
  vars[3] = v5_W6;
  int v8_W8 = vars[3];
  int v24 = (v8_W8 == 2);
  v_0_X8_2 = v24;
  return NULL;
}

void *t1(void *arg){
label_2:;
  FENCE();
  vars[3] = 2;
  FENCE();
  int v11_W2 = vars[0];
  int v25 = (v11_W2 == 0);
  v_1_X2_0 = v25;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[3] = 0;
  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_0_X8_2 = 0;
  v_1_X2_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v12 = vars[3];
  int v13 = (v12 == 2);
  int v14 = vars[0];
  int v15 = (v14 == 1);
  int v16 = vars[1];
  int v17 = (v16 == 1);
  int v18 = v_0_X8_2;
  int v19 = v_1_X2_0;
  int v20_conj = v18 & v19;
  int v21_conj = v17 & v20_conj;
  int v22_conj = v15 & v21_conj;
  int v23_conj = v13 & v22_conj;
  if (v23_conj == 1) assert(0);
  return 0;
}
