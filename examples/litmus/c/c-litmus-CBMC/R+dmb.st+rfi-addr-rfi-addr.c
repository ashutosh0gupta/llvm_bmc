/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[3]; 
volatile int v_1_X2_2; 
volatile int v_1_X6_1; 
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
  vars[1] = 2;
  int v3_W2 = vars[1];
  int v4_W3 = v3_W2 ^ v3_W2;
  vars[2+v4_W3] = 1;
  int v7_W6 = vars[2];
  int v8_W7 = v7_W6 ^ v7_W6;
  int v11_W8 = vars[0+v8_W7];
  int v26 = (v3_W2 == 2);
  v_1_X2_2 = v26;
  int v27 = (v7_W6 == 1);
  v_1_X6_1 = v27;
  int v28 = (v11_W8 == 0);
  v_1_X8_0 = v28;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X2_2 = 0;
  v_1_X6_1 = 0;
  v_1_X8_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v12 = vars[0];
  int v13 = (v12 == 1);
  int v14 = vars[1];
  int v15 = (v14 == 2);
  int v16 = vars[2];
  int v17 = (v16 == 1);
  int v18 = v_1_X2_2;
  int v19 = v_1_X6_1;
  int v20 = v_1_X8_0;
  int v21_conj = v19 & v20;
  int v22_conj = v18 & v21_conj;
  int v23_conj = v17 & v22_conj;
  int v24_conj = v15 & v23_conj;
  int v25_conj = v13 & v24_conj;
  if (v25_conj == 1) assert(0);
  return 0;
}
