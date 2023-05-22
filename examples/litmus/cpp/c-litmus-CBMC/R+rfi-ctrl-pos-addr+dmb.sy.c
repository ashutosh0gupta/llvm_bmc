/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[3]; 
volatile int v_0_X2_1; 
volatile int v_1_X2_0; 

void *t0(void *arg){
label_1:;
  vars[0] = 1;
  int v3_W2 = vars[0];
  if (v3_W2) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v6_W3 = vars[1];
  int v9_W5 = vars[1];
  int v10_W6 = v9_W5 ^ v9_W5;
  vars[2+v10_W6] = 1;
  int v23 = (v3_W2 == 1);
  v_0_X2_1 = v23;
  return NULL;
}

void *t1(void *arg){
label_2:;
  vars[2] = 2;
  FENCE();
  int v13_W2 = vars[0];
  int v24 = (v13_W2 == 0);
  v_1_X2_0 = v24;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_0_X2_1 = 0;
  v_1_X2_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v14 = vars[0];
  int v15 = (v14 == 1);
  int v16 = vars[2];
  int v17 = (v16 == 2);
  int v18 = v_0_X2_1;
  int v19 = v_1_X2_0;
  int v20_conj = v18 & v19;
  int v21_conj = v17 & v20_conj;
  int v22_conj = v15 & v21_conj;
  if (v22_conj == 1) assert(0);
  return 0;
}
