/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[4]; 
volatile int v_1_X0_1; 
volatile int v_1_X2_0; 
volatile int v_1_X5_1; 
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
  if (v3_W0) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v6_W2 = vars[2];
  vars[2] = 1;
  int v9_W5 = vars[2];
  if (v9_W5) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  int v12_W6 = vars[3];
  if (v12_W6) goto lbl_LC02; else goto lbl_LC02;
lbl_LC02:;
  FENCE();
  int v15_W8 = vars[0];
  int v32 = (v3_W0 == 1);
  v_1_X0_1 = v32;
  int v33 = (v6_W2 == 0);
  v_1_X2_0 = v33;
  int v34 = (v9_W5 == 1);
  v_1_X5_1 = v34;
  int v35 = (v15_W8 == 0);
  v_1_X8_0 = v35;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[3] = 0;
  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;
  v_1_X2_0 = 0;
  v_1_X5_1 = 0;
  v_1_X8_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v16 = vars[0];
  int v17 = (v16 == 1);
  int v18 = vars[1];
  int v19 = (v18 == 1);
  int v20 = vars[2];
  int v21 = (v20 == 1);
  int v22 = v_1_X0_1;
  int v23 = v_1_X2_0;
  int v24 = v_1_X5_1;
  int v25 = v_1_X8_0;
  int v26_conj = v24 & v25;
  int v27_conj = v23 & v26_conj;
  int v28_conj = v22 & v27_conj;
  int v29_conj = v21 & v28_conj;
  int v30_conj = v19 & v29_conj;
  int v31_conj = v17 & v30_conj;
  if (v31_conj == 1) assert(0);
  return 0;
}
