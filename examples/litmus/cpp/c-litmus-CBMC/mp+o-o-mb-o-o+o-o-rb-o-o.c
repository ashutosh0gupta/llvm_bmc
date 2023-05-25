/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[4]; 
volatile int v_1_X0_3; 
volatile int v_1_X4_0; 
volatile int v_1_X6_0; 
volatile int v_1_X2_4; 

void *t0(void *arg){
label_1:;
  vars[3] = 1;
  vars[2] = 2;
  FENCE();
  vars[1] = 3;
  vars[0] = 4;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = vars[1];
  int v6_W2 = vars[0];
  FENCE();
  int v9_W4 = vars[3];
  int v12_W6 = vars[2];
  int v28 = (v3_W0 == 3);
  v_1_X0_3 = v28;
  int v29 = (v9_W4 == 0);
  v_1_X4_0 = v29;
  int v30 = (v12_W6 == 0);
  v_1_X6_0 = v30;
  int v31 = (v6_W2 == 4);
  v_1_X2_4 = v31;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[0] = 0;
  vars[1] = 0;
  vars[2] = 0;
  vars[3] = 0;
  v_1_X0_3 = 0;
  v_1_X4_0 = 0;
  v_1_X6_0 = 0;
  v_1_X2_4 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v13 = v_1_X0_3;
  int v14 = v_1_X4_0;
  int v15 = v_1_X0_3;
  int v16 = v_1_X6_0;
  int v17 = v_1_X2_4;
  int v18 = v_1_X4_0;
  int v19 = v_1_X2_4;
  int v20 = v_1_X6_0;
  int v21_conj = v19 & v20;
  int v22_disj = v18 | v21_conj;
  int v23_conj = v17 & v22_disj;
  int v24_disj = v16 | v23_conj;
  int v25_conj = v15 & v24_disj;
  int v26_disj = v14 | v25_conj;
  int v27_conj = v13 & v26_disj;
  if (v27_conj == 1) assert(0);
  return 0;
}
