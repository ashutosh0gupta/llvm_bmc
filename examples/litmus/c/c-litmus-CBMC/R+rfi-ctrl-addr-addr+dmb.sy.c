/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[4]; 
volatile int v_0_X2_1; 
volatile int v_1_X2_0; 

void *t0(void *arg){
label_1:;
  vars[0] = 1;
  int v3_W2 = vars[0];
  if (v3_W2) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v6_W3 = vars[1];
  int v7_W5 = v6_W3 ^ v6_W3;
  int v10_W6 = vars[2+v7_W5];
  int v11_W8 = v10_W6 ^ v10_W6;
  vars[3+v11_W8] = 1;
  int v24 = (v3_W2 == 1);
  v_0_X2_1 = v24;
  return NULL;
}

void *t1(void *arg){
label_2:;
  vars[3] = 2;
  FENCE();
  int v14_W2 = vars[0];
  int v25 = (v14_W2 == 0);
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
  v_0_X2_1 = 0;
  v_1_X2_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v15 = vars[3];
  int v16 = (v15 == 2);
  int v17 = vars[0];
  int v18 = (v17 == 1);
  int v19 = v_0_X2_1;
  int v20 = v_1_X2_0;
  int v21_conj = v19 & v20;
  int v22_conj = v18 & v21_conj;
  int v23_conj = v16 & v22_conj;
  if (v23_conj == 1) assert(0);
  return 0;
}
