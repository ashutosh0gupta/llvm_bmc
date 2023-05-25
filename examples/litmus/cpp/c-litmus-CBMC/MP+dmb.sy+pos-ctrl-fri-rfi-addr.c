/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[3]; 
volatile int v_1_X0_1; 
volatile int v_1_X2_1; 
volatile int v_1_X3_0; 
volatile int v_1_X6_1; 
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
  if (v6_W2) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v9_W3 = vars[2];
  vars[2] = 1;
  int v12_W6 = vars[2];
  int v13_W7 = v12_W6 ^ v12_W6;
  int v16_W8 = vars[0+v13_W7];
  int v35 = (v3_W0 == 1);
  v_1_X0_1 = v35;
  int v36 = (v6_W2 == 1);
  v_1_X2_1 = v36;
  int v37 = (v9_W3 == 0);
  v_1_X3_0 = v37;
  int v38 = (v12_W6 == 1);
  v_1_X6_1 = v38;
  int v39 = (v16_W8 == 0);
  v_1_X8_0 = v39;
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
  v_1_X3_0 = 0;
  v_1_X6_1 = 0;
  v_1_X8_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v17 = vars[0];
  int v18 = (v17 == 1);
  int v19 = vars[1];
  int v20 = (v19 == 1);
  int v21 = vars[2];
  int v22 = (v21 == 1);
  int v23 = v_1_X0_1;
  int v24 = v_1_X2_1;
  int v25 = v_1_X3_0;
  int v26 = v_1_X6_1;
  int v27 = v_1_X8_0;
  int v28_conj = v26 & v27;
  int v29_conj = v25 & v28_conj;
  int v30_conj = v24 & v29_conj;
  int v31_conj = v23 & v30_conj;
  int v32_conj = v22 & v31_conj;
  int v33_conj = v20 & v32_conj;
  int v34_conj = v18 & v33_conj;
  if (v34_conj == 1) assert(0);
  return 0;
}
