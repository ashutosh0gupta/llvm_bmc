/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[3]; 
volatile int v_1_X0_1; 
volatile int v_1_X2_1; 
volatile int v_1_X4_2; 
volatile int v_1_X8_0; 

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
  int v10_W5 = v9_W4 ^ v9_W4;
  int v13_W6 = vars[2+v10_W5];
  if (v13_W6) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v16_W8 = vars[0];
  int v30 = (v3_W0 == 1);
  v_1_X0_1 = v30;
  int v31 = (v6_W2 == 1);
  v_1_X2_1 = v31;
  int v32 = (v9_W4 == 2);
  v_1_X4_2 = v32;
  int v33 = (v16_W8 == 0);
  v_1_X8_0 = v33;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;
  v_1_X2_1 = 0;
  v_1_X4_2 = 0;
  v_1_X8_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v17 = vars[0];
  int v18 = (v17 == 1);
  int v19 = vars[1];
  int v20 = (v19 == 2);
  int v21 = v_1_X0_1;
  int v22 = v_1_X2_1;
  int v23 = v_1_X4_2;
  int v24 = v_1_X8_0;
  int v25_conj = v23 & v24;
  int v26_conj = v22 & v25_conj;
  int v27_conj = v21 & v26_conj;
  int v28_conj = v20 & v27_conj;
  int v29_conj = v18 & v28_conj;
  if (v29_conj == 1) assert(0);
  return 0;
}
