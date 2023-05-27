/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[2]; 
volatile int v_0_X5_2; 
volatile int v_1_X4_3; 
volatile int v_1_X2_2; 
volatile int v_1_X3_2; 

void *t0(void *arg){
label_1:;
  vars[0] = 3;
  int v3_W2 = vars[1];
  int v4_W4 = v3_W2 ^ v3_W2;
  int v5_W4 = v4_W4 + 1;
  FENCE();
  vars[0] = v5_W4;
  int v8_W5 = vars[0];
  int v28 = (v8_W5 == 2);
  v_0_X5_2 = v28;
  return NULL;
}

void *t1(void *arg){
label_2:;
  FENCE();
  vars[0] = 2;
  int v11_W2 = vars[0];
  FENCE();
  int v14_W3 = vars[0];
  int v17_W4 = vars[0];
  int v29 = (v17_W4 == 3);
  v_1_X4_3 = v29;
  int v30 = (v11_W2 == 2);
  v_1_X2_2 = v30;
  int v31 = (v14_W3 == 2);
  v_1_X3_2 = v31;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[1] = 0;
  vars[0] = 0;
  v_0_X5_2 = 0;
  v_1_X4_3 = 0;
  v_1_X2_2 = 0;
  v_1_X3_2 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v18 = vars[0];
  int v19 = (v18 == 3);
  int v20 = v_0_X5_2;
  int v21 = v_1_X4_3;
  int v22 = v_1_X2_2;
  int v23 = v_1_X3_2;
  int v24_conj = v22 & v23;
  int v25_conj = v21 & v24_conj;
  int v26_conj = v20 & v25_conj;
  int v27_conj = v19 & v26_conj;
  if (v27_conj == 1) assert(0);
  return 0;
}
