/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[3]; 
volatile int v_0_X2_0; 
volatile int v_1_X2_1; 
volatile int v_1_X3_1; 
volatile int v_1_X6_0; 

void *t0(void *arg){
label_1:;
  vars[0] = 1;
  FENCE();
  int v3_W2 = vars[1];
  int v29 = (v3_W2 == 0);
  v_0_X2_0 = v29;
  return NULL;
}

void *t1(void *arg){
label_2:;
  vars[1] = 1;
  int v6_W2 = vars[1];
  int v9_W3 = vars[1];
  if (v9_W3) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v12_W4 = vars[2];
  if (v12_W4) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  FENCE();
  int v15_W6 = vars[0];
  int v30 = (v6_W2 == 1);
  v_1_X2_1 = v30;
  int v31 = (v9_W3 == 1);
  v_1_X3_1 = v31;
  int v32 = (v15_W6 == 0);
  v_1_X6_0 = v32;
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
  v_1_X3_1 = 0;
  v_1_X6_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v16 = vars[0];
  int v17 = (v16 == 1);
  int v18 = vars[1];
  int v19 = (v18 == 1);
  int v20 = v_0_X2_0;
  int v21 = v_1_X2_1;
  int v22 = v_1_X3_1;
  int v23 = v_1_X6_0;
  int v24_conj = v22 & v23;
  int v25_conj = v21 & v24_conj;
  int v26_conj = v20 & v25_conj;
  int v27_conj = v19 & v26_conj;
  int v28_conj = v17 & v27_conj;
  if (v28_conj == 1) assert(0);
  return 0;
}
