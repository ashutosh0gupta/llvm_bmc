/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[5]; 
volatile int v_1_X0_1; 
volatile int v_1_X6_1; 
volatile int v_1_X9_0; 

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
  if (v3_W0) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v6_W2 = vars[2];
  if (v6_W2) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  vars[3] = 1;
  int v9_W6 = vars[3];
  if (v9_W6) goto lbl_LC02; else goto lbl_LC02;
lbl_LC02:;
  int v12_W7 = vars[4];
  if (v12_W7) goto lbl_LC03; else goto lbl_LC03;
lbl_LC03:;
  FENCE();
  int v15_W9 = vars[0];
  int v30 = (v3_W0 == 1);
  v_1_X0_1 = v30;
  int v31 = (v9_W6 == 1);
  v_1_X6_1 = v31;
  int v32 = (v15_W9 == 0);
  v_1_X9_0 = v32;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[4] = 0;
  vars[3] = 0;
  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;
  v_1_X6_1 = 0;
  v_1_X9_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v16 = vars[3];
  int v17 = (v16 == 1);
  int v18 = vars[0];
  int v19 = (v18 == 1);
  int v20 = vars[1];
  int v21 = (v20 == 1);
  int v22 = v_1_X0_1;
  int v23 = v_1_X6_1;
  int v24 = v_1_X9_0;
  int v25_conj = v23 & v24;
  int v26_conj = v22 & v25_conj;
  int v27_conj = v21 & v26_conj;
  int v28_conj = v19 & v27_conj;
  int v29_conj = v17 & v28_conj;
  if (v29_conj == 1) assert(0);
  return 0;
}
