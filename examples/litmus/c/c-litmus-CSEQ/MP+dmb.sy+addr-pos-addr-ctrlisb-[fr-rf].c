/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[4]; 
volatile int v_1_X0_1; 
volatile int v_1_X9_0; 
volatile int v_1_X11_1; 

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
  int v10_W5 = vars[2];
  int v11_W6 = v10_W5 ^ v10_W5;
  int v14_W7 = vars[3+v11_W6];
  if (v14_W7) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  FENCE();
  int v17_W9 = vars[0];
  int v20_W11 = vars[0];
  int v32 = (v3_W0 == 1);
  v_1_X0_1 = v32;
  int v33 = (v17_W9 == 0);
  v_1_X9_0 = v33;
  int v34 = (v20_W11 == 1);
  v_1_X11_1 = v34;
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

  vars[3] = 0;
  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;
  v_1_X9_0 = 0;
  v_1_X11_1 = 0;

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
  int v26 = v_1_X9_0;
  int v27 = v_1_X11_1;
  int v28_conj = v26 & v27;
  int v29_conj = v25 & v28_conj;
  int v30_conj = v24 & v29_conj;
  int v31_conj = v22 & v30_conj;
  if (v31_conj == 1) assert(0);
  return 0;
}
