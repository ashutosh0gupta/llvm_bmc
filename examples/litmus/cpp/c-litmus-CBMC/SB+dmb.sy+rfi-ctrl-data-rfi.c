/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[3]; 
volatile int v_0_X2_0; 
volatile int v_1_X2_1; 
volatile int v_1_X7_1; 

void *t0(void *arg){
label_1:;
  vars[0] = 2;
  FENCE();
  int v3_W2 = vars[1];
  int v26 = (v3_W2 == 0);
  v_0_X2_0 = v26;
  return NULL;
}

void *t1(void *arg){
label_2:;
  vars[1] = 1;
  int v6_W2 = vars[1];
  if (v6_W2) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v9_W3 = vars[2];
  int v10_W5 = v9_W3 ^ v9_W3;
  int v11_W5 = v10_W5 + 1;
  vars[0] = v11_W5;
  int v14_W7 = vars[0];
  int v27 = (v6_W2 == 1);
  v_1_X2_1 = v27;
  int v28 = (v14_W7 == 1);
  v_1_X7_1 = v28;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_0_X2_0 = 0;
  v_1_X2_1 = 0;
  v_1_X7_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v15 = vars[0];
  int v16 = (v15 == 2);
  int v17 = vars[1];
  int v18 = (v17 == 1);
  int v19 = v_0_X2_0;
  int v20 = v_1_X2_1;
  int v21 = v_1_X7_1;
  int v22_conj = v20 & v21;
  int v23_conj = v19 & v22_conj;
  int v24_conj = v18 & v23_conj;
  int v25_conj = v16 & v24_conj;
  if (v25_conj == 1) assert(0);
  return 0;
}
