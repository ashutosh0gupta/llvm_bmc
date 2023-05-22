/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[3]; 
volatile int v_0_X0_1; 
volatile int v_1_X0_1; 
volatile int v_2_X0_1; 

void *t0(void *arg){
label_1:;
  int v3_W0 = vars[0];
  FENCE();
  vars[1] = 1;
  int v17 = (v3_W0 == 1);
  v_0_X0_1 = v17;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v6_W0 = vars[1];
  if (v6_W0) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  FENCE();
  vars[2] = 1;
  int v18 = (v6_W0 == 1);
  v_1_X0_1 = v18;
  return NULL;
}

void *t2(void *arg){
label_3:;
  int v9_W0 = vars[2];
  int v10_W2 = v9_W0 ^ v9_W0;
  int v11_W2 = v10_W2 + 1;
  vars[0] = v11_W2;
  int v19 = (v9_W0 == 1);
  v_2_X0_1 = v19;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_0_X0_1 = 0;
  v_1_X0_1 = 0;
  v_2_X0_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v12 = v_0_X0_1;
  int v13 = v_1_X0_1;
  int v14 = v_2_X0_1;
  int v15_conj = v13 & v14;
  int v16_conj = v12 & v15_conj;
  if (v16_conj == 1) assert(0);
  return 0;
}
