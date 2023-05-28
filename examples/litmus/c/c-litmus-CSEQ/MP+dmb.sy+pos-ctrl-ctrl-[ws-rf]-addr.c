/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[4]; 
volatile int v_1_X0_1; 
volatile int v_1_X2_1; 
volatile int v_1_X7_2; 
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
  int v9_W3 = vars[2];
  if (v9_W3) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  vars[3] = 1;
  int v12_W7 = vars[3];
  int v13_W8 = v12_W7 ^ v12_W7;
  int v16_W9 = vars[0+v13_W8];
  int v33 = (v3_W0 == 1);
  v_1_X0_1 = v33;
  int v34 = (v6_W2 == 1);
  v_1_X2_1 = v34;
  int v35 = (v12_W7 == 2);
  v_1_X7_2 = v35;
  int v36 = (v16_W9 == 0);
  v_1_X9_0 = v36;
  return NULL;
}

void *t2(void *arg){
label_3:;
  vars[3] = 2;
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
  v_1_X7_2 = 0;
  v_1_X9_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v17 = vars[3];
  int v18 = (v17 == 2);
  int v19 = vars[0];
  int v20 = (v19 == 1);
  int v21 = vars[1];
  int v22 = (v21 == 1);
  int v23 = v_1_X0_1;
  int v24 = v_1_X2_1;
  int v25 = v_1_X7_2;
  int v26 = v_1_X9_0;
  int v27_conj = v25 & v26;
  int v28_conj = v24 & v27_conj;
  int v29_conj = v23 & v28_conj;
  int v30_conj = v22 & v29_conj;
  int v31_conj = v20 & v30_conj;
  int v32_conj = v18 & v31_conj;
  if (v32_conj == 1) assert(0);
  return 0;
}
