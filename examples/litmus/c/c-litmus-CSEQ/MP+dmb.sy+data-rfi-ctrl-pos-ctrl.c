/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[4]; 
volatile int v_1_X0_1; 
volatile int v_1_X4_1; 
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
  int v4_W2 = v3_W0 ^ v3_W0;
  int v5_W2 = v4_W2 + 1;
  vars[2] = v5_W2;
  int v8_W4 = vars[2];
  if (v8_W4) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v11_W5 = vars[3];
  int v14_W7 = vars[3];
  if (v14_W7) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  int v17_W8 = vars[0];
  int v32 = (v3_W0 == 1);
  v_1_X0_1 = v32;
  int v33 = (v8_W4 == 1);
  v_1_X4_1 = v33;
  int v34 = (v17_W8 == 0);
  v_1_X8_0 = v34;
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
  v_1_X4_1 = 0;
  v_1_X8_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v18 = vars[0];
  int v19 = (v18 == 1);
  int v20 = vars[1];
  int v21 = (v20 == 1);
  int v22 = vars[2];
  int v23 = (v22 == 1);
  int v24 = v_1_X0_1;
  int v25 = v_1_X4_1;
  int v26 = v_1_X8_0;
  int v27_conj = v25 & v26;
  int v28_conj = v24 & v27_conj;
  int v29_conj = v23 & v28_conj;
  int v30_conj = v21 & v29_conj;
  int v31_conj = v19 & v30_conj;
  if (v31_conj == 1) assert(0);
  return 0;
}
