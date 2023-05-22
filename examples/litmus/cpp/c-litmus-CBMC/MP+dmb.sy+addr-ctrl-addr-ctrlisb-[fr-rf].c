/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[5]; 
volatile int v_1_X0_1; 
volatile int v_1_X10_0; 
volatile int v_1_X12_1; 

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
  int v7_W3 = vars[2+v4_W2];
  if (v7_W3) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v10_W5 = vars[3];
  int v11_W7 = v10_W5 ^ v10_W5;
  int v14_W8 = vars[4+v11_W7];
  if (v14_W8) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  FENCE();
  int v17_W10 = vars[0];
  int v20_W12 = vars[0];
  int v32 = (v3_W0 == 1);
  v_1_X0_1 = v32;
  int v33 = (v17_W10 == 0);
  v_1_X10_0 = v33;
  int v34 = (v20_W12 == 1);
  v_1_X12_1 = v34;
  return NULL;
}

void *t2(void *arg){
label_3:;
  vars[0] = 1;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  vars[4] = 0;
  vars[3] = 0;
  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;
  v_1_X10_0 = 0;
  v_1_X12_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v21 = vars[0];
  int v22 = (v21 == 2);
  int v23 = vars[1];
  int v24 = (v23 == 1);
  int v25 = v_1_X0_1;
  int v26 = v_1_X10_0;
  int v27 = v_1_X12_1;
  int v28_conj = v26 & v27;
  int v29_conj = v25 & v28_conj;
  int v30_conj = v24 & v29_conj;
  int v31_conj = v22 & v30_conj;
  if (v31_conj == 1) assert(0);
  return 0;
}
