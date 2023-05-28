/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[4]; 
volatile int v_1_X0_1; 
volatile int v_1_X9_1; 

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
  int v12_W7 = v11_W7 + 1;
  vars[0] = v12_W7;
  int v15_W9 = vars[0];
  int v25 = (v3_W0 == 1);
  v_1_X0_1 = v25;
  int v26 = (v15_W9 == 1);
  v_1_X9_1 = v26;
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
  v_1_X9_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v16 = vars[0];
  int v17 = (v16 == 2);
  int v18 = vars[1];
  int v19 = (v18 == 1);
  int v20 = v_1_X0_1;
  int v21 = v_1_X9_1;
  int v22_conj = v20 & v21;
  int v23_conj = v19 & v22_conj;
  int v24_conj = v17 & v23_conj;
  if (v24_conj == 1) assert(0);
  return 0;
}
