/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[4]; 
volatile int v_1_X0_1; 
volatile int v_1_X7_1; 
volatile int v_1_X8_0; 
volatile int v_1_X10_0; 

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
  int v7_W4 = v6_W2 ^ v6_W2;
  vars[3+v7_W4] = 1;
  int v10_W7 = vars[3];
  if (v10_W7) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  int v13_W8 = vars[0];
  int v16_W10 = vars[0];
  int v33 = (v3_W0 == 1);
  v_1_X0_1 = v33;
  int v34 = (v10_W7 == 1);
  v_1_X7_1 = v34;
  int v35 = (v13_W8 == 0);
  v_1_X8_0 = v35;
  int v36 = (v16_W10 == 0);
  v_1_X10_0 = v36;
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
  v_1_X7_1 = 0;
  v_1_X8_0 = 0;
  v_1_X10_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v17 = vars[3];
  int v18 = (v17 == 1);
  int v19 = vars[0];
  int v20 = (v19 == 1);
  int v21 = vars[1];
  int v22 = (v21 == 1);
  int v23 = v_1_X0_1;
  int v24 = v_1_X7_1;
  int v25 = v_1_X8_0;
  int v26 = v_1_X10_0;
  int v27_conj = v25 & v26;
  int v28_conj = v24 & v27_conj;
  int v29_conj = v23 & v28_conj;
  int v30_conj = v22 & v29_conj;
  int v31_conj = v20 & v30_conj;
  int v32_conj = v18 & v31_conj;
  if (v32_conj == 1) assert(0);
  return 0;
}
