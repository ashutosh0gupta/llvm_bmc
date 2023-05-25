/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[2]; 
volatile int v_1_X0_2; 
volatile int v_1_X2_0; 
volatile int v_3_X0_1; 

void *t0(void *arg){
label_1:;
  FENCE();
  vars[0] = 2;
  return NULL;
}

void *t1(void *arg){
label_2:;
  FENCE();
  int v3_W0 = vars[0];
  int v6_W2 = vars[1];
  int v19 = (v3_W0 == 2);
  v_1_X0_2 = v19;
  int v20 = (v6_W2 == 0);
  v_1_X2_0 = v20;
  return NULL;
}

void *t2(void *arg){
label_3:;
  FENCE();
  vars[1] = 1;
  return NULL;
}

void *t3(void *arg){
label_4:;
  int v9_W0 = vars[1];
  int v10_cmpeq = (v9_W0 == 0);
  if (v10_cmpeq)  goto lbl_label123; else goto lbl_label123;
lbl_label123:;
  vars[0] = 1;
  int v21 = (v9_W0 == 1);
  v_3_X0_1 = v21;
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
  v_3_X0_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);
  pthread_create(&thr3, NULL, t3, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);

  int v11 = vars[0];
  int v12 = (v11 == 2);
  int v13 = v_1_X0_2;
  int v14 = v_1_X2_0;
  int v15 = v_3_X0_1;
  int v16_conj = v14 & v15;
  int v17_conj = v13 & v16_conj;
  int v18_conj = v12 & v17_conj;
  if (v18_conj == 1) assert(0);
  return 0;
}
