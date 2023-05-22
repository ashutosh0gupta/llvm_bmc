/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[3]; 
volatile int v_1_X0_1; 
volatile int v_1_X4_2; 
volatile int v_1_X7_1; 

void *t0(void *arg){
label_1:;
  vars[0] = 2;
  FENCE();
  vars[1] = 1;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = vars[1];
  int v4_W2 = v3_W0 ^ v3_W0;
  int v5_W2 = v4_W2 + 1;
  vars[2] = v5_W2;
  int v8_W4 = vars[2];
  if (v8_W4) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  vars[0] = 1;
  int v11_W7 = vars[0];
  int v26 = (v3_W0 == 1);
  v_1_X0_1 = v26;
  int v27 = (v8_W4 == 2);
  v_1_X4_2 = v27;
  int v28 = (v11_W7 == 1);
  v_1_X7_1 = v28;
  return NULL;
}

void *t2(void *arg){
label_3:;
  vars[2] = 2;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;
  v_1_X4_2 = 0;
  v_1_X7_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v12 = vars[0];
  int v13 = (v12 == 2);
  int v14 = vars[1];
  int v15 = (v14 == 1);
  int v16 = vars[2];
  int v17 = (v16 == 2);
  int v18 = v_1_X0_1;
  int v19 = v_1_X4_2;
  int v20 = v_1_X7_1;
  int v21_conj = v19 & v20;
  int v22_conj = v18 & v21_conj;
  int v23_conj = v17 & v22_conj;
  int v24_conj = v15 & v23_conj;
  int v25_conj = v13 & v24_conj;
  if (v25_conj == 1) assert(0);
  return 0;
}
