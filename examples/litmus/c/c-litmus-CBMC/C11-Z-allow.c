/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[2]; 
volatile int v_0_X5_1; 
volatile int v_2_X4_3; 
volatile int v_1_X2_4; 
volatile int v_1_X4_1; 

void *t0(void *arg){
label_1:;
  FENCE();
  vars[0] = 2;
  int v3_W5 = vars[0];
  vars[0] = 3;
  vars[0] = 4;
  int v20 = (v3_W5 == 1);
  v_0_X5_1 = v20;
  return NULL;
}

void *t1(void *arg){
label_2:;
  FENCE();
  int v6_W2 = vars[0];
  FENCE();
  int v9_W4 = vars[1];
  int v22 = (v6_W2 == 4);
  v_1_X2_4 = v22;
  int v23 = (v9_W4 == 1);
  v_1_X4_1 = v23;
  return NULL;
}

void *t2(void *arg){
label_3:;
  vars[1] = 1;
  FENCE();
  vars[1] = 2;
  FENCE();
  vars[0] = 1;
  int v12_W4 = vars[0];
  int v21 = (v12_W4 == 3);
  v_2_X4_3 = v21;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  vars[1] = 0;
  vars[0] = 0;
  v_0_X5_1 = 0;
  v_2_X4_3 = 0;
  v_1_X2_4 = 0;
  v_1_X4_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v13 = v_0_X5_1;
  int v14 = v_2_X4_3;
  int v15 = v_1_X2_4;
  int v16 = v_1_X4_1;
  int v17_conj = v15 & v16;
  int v18_conj = v14 & v17_conj;
  int v19_conj = v13 & v18_conj;
  if (v19_conj == 1) assert(0);
  return 0;
}
