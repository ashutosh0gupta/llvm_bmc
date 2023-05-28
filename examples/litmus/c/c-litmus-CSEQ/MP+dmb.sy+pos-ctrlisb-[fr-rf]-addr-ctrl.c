/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[4]; 
volatile int v_1_X0_1; 
volatile int v_1_X2_1; 
volatile int v_1_X3_0; 
volatile int v_1_X5_1; 
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
  int v6_W2 = vars[1];
  if (v6_W2) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  FENCE();
  int v9_W3 = vars[2];
  int v12_W5 = vars[2];
  int v13_W6 = v12_W5 ^ v12_W5;
  int v16_W7 = vars[3+v13_W6];
  if (v16_W7) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  int v19_W9 = vars[0];
  int v38 = (v3_W0 == 1);
  v_1_X0_1 = v38;
  int v39 = (v6_W2 == 1);
  v_1_X2_1 = v39;
  int v40 = (v9_W3 == 0);
  v_1_X3_0 = v40;
  int v41 = (v12_W5 == 1);
  v_1_X5_1 = v41;
  int v42 = (v19_W9 == 0);
  v_1_X9_0 = v42;
  return NULL;
}

void *t2(void *arg){
label_3:;
  vars[2] = 1;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  vars[3] = 0;
  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;
  v_1_X2_1 = 0;
  v_1_X3_0 = 0;
  v_1_X5_1 = 0;
  v_1_X9_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v20 = vars[0];
  int v21 = (v20 == 1);
  int v22 = vars[1];
  int v23 = (v22 == 1);
  int v24 = vars[2];
  int v25 = (v24 == 1);
  int v26 = v_1_X0_1;
  int v27 = v_1_X2_1;
  int v28 = v_1_X3_0;
  int v29 = v_1_X5_1;
  int v30 = v_1_X9_0;
  int v31_conj = v29 & v30;
  int v32_conj = v28 & v31_conj;
  int v33_conj = v27 & v32_conj;
  int v34_conj = v26 & v33_conj;
  int v35_conj = v25 & v34_conj;
  int v36_conj = v23 & v35_conj;
  int v37_conj = v21 & v36_conj;
  if (v37_conj == 1) assert(0);
  return 0;
}
