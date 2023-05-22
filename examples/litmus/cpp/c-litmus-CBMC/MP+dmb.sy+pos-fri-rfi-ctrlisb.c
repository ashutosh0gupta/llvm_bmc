/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[2]; 
volatile int v_1_X0_1; 
volatile int v_1_X2_1; 
volatile int v_1_X4_2; 
volatile int v_1_X5_0; 

void *t0(void *arg){
label_1:;
  vars[0] = 1;
  FENCE();
  vars[1] = 1;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = vars[1];
  int v6_W2 = vars[1];
  vars[1] = 2;
  int v9_W4 = vars[1];
  if (v9_W4) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  FENCE();
  int v12_W5 = vars[0];
  int v26 = (v3_W0 == 1);
  v_1_X0_1 = v26;
  int v27 = (v6_W2 == 1);
  v_1_X2_1 = v27;
  int v28 = (v9_W4 == 2);
  v_1_X4_2 = v28;
  int v29 = (v12_W5 == 0);
  v_1_X5_0 = v29;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;
  v_1_X2_1 = 0;
  v_1_X4_2 = 0;
  v_1_X5_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v13 = vars[0];
  int v14 = (v13 == 1);
  int v15 = vars[1];
  int v16 = (v15 == 2);
  int v17 = v_1_X0_1;
  int v18 = v_1_X2_1;
  int v19 = v_1_X4_2;
  int v20 = v_1_X5_0;
  int v21_conj = v19 & v20;
  int v22_conj = v18 & v21_conj;
  int v23_conj = v17 & v22_conj;
  int v24_conj = v16 & v23_conj;
  int v25_conj = v14 & v24_conj;
  if (v25_conj == 1) assert(0);
  return 0;
}
