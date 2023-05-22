/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[2]; 
volatile int v_0_X3_4; 
volatile int v_1_X6_2; 
volatile int v_1_X5_1; 

void *t0(void *arg){
label_1:;
  vars[0] = 2;
  FENCE();
  vars[0] = 3;
  int v3_W3 = vars[0];
  int v23 = (v3_W3 == 4);
  v_0_X3_4 = v23;
  return NULL;
}

void *t1(void *arg){
label_2:;
  FENCE();
  vars[0] = 4;
  int v6_W2 = vars[1];
  int v7_W4 = v6_W2 ^ v6_W2;
  int v8_W4 = v7_W4 + 1;
  vars[0] = v8_W4;
  FENCE();
  int v11_W5 = vars[0];
  int v14_W6 = vars[0];
  int v24 = (v14_W6 == 2);
  v_1_X6_2 = v24;
  int v25 = (v11_W5 == 1);
  v_1_X5_1 = v25;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[1] = 0;
  vars[0] = 0;
  v_0_X3_4 = 0;
  v_1_X6_2 = 0;
  v_1_X5_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v15 = vars[0];
  int v16 = (v15 == 4);
  int v17 = v_0_X3_4;
  int v18 = v_1_X6_2;
  int v19 = v_1_X5_1;
  int v20_conj = v18 & v19;
  int v21_conj = v17 & v20_conj;
  int v22_conj = v16 & v21_conj;
  if (v22_conj == 1) assert(0);
  return 0;
}
