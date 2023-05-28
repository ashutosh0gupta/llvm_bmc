/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[2]; 
volatile int v_1_X0_2; 
volatile int v_1_X2_0; 
volatile int v_3_X0_2; 
volatile int v_3_X2_0; 

void *t0(void *arg){
label_1:;
  FENCE();
  vars[0] = 1;
  vars[0] = 2;
  return NULL;
}

void *t1(void *arg){
label_2:;
  FENCE();
  int v3_W0 = vars[0];
  FENCE();
  int v6_W2 = vars[1];
  int v26 = (v3_W0 == 2);
  v_1_X0_2 = v26;
  int v27 = (v6_W2 == 0);
  v_1_X2_0 = v27;
  return NULL;
}

void *t2(void *arg){
label_3:;
  FENCE();
  vars[1] = 1;
  vars[1] = 2;
  return NULL;
}

void *t3(void *arg){
label_4:;
  FENCE();
  int v9_W0 = vars[1];
  FENCE();
  int v12_W2 = vars[0];
  int v28 = (v9_W0 == 2);
  v_3_X0_2 = v28;
  int v29 = (v12_W2 == 0);
  v_3_X2_0 = v29;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 
  pthread_t thr3; 

  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_2 = 0;
  v_1_X2_0 = 0;
  v_3_X0_2 = 0;
  v_3_X2_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);
  pthread_create(&thr3, NULL, t3, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);

  int v13 = vars[0];
  int v14 = (v13 == 2);
  int v15 = vars[1];
  int v16 = (v15 == 2);
  int v17 = v_1_X0_2;
  int v18 = v_1_X2_0;
  int v19 = v_3_X0_2;
  int v20 = v_3_X2_0;
  int v21_conj = v19 & v20;
  int v22_conj = v18 & v21_conj;
  int v23_conj = v17 & v22_conj;
  int v24_conj = v16 & v23_conj;
  int v25_conj = v14 & v24_conj;
  if (v25_conj == 1) assert(0);
  return 0;
}
