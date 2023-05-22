/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[3]; 
volatile int v_1_X2_2; 
volatile int v_1_X7_0; 

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
  int v7_W4 = vars[2+v4_W3];
  int v10_W6 = vars[2];
  if (v10_W6) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v13_W7 = vars[0];
  int v23 = (v3_W2 == 2);
  v_1_X2_2 = v23;
  int v24 = (v13_W7 == 0);
  v_1_X7_0 = v24;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X2_2 = 0;
  v_1_X7_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v14 = vars[0];
  int v15 = (v14 == 1);
  int v16 = vars[1];
  int v17 = (v16 == 2);
  int v18 = v_1_X2_2;
  int v19 = v_1_X7_0;
  int v20_conj = v18 & v19;
  int v21_conj = v17 & v20_conj;
  int v22_conj = v15 & v21_conj;
  if (v22_conj == 1) assert(0);
  return 0;
}
