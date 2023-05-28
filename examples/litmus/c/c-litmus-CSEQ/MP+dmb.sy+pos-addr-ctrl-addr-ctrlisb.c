/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[5]; 
volatile int v_1_X0_1; 
volatile int v_1_X2_1; 
volatile int v_1_X11_0; 

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
  int v7_W3 = v6_W2 ^ v6_W2;
  int v10_W4 = vars[2+v7_W3];
  if (v10_W4) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v13_W6 = vars[3];
  int v14_W8 = v13_W6 ^ v13_W6;
  int v17_W9 = vars[4+v14_W8];
  if (v17_W9) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  FENCE();
  int v20_W11 = vars[0];
  int v32 = (v3_W0 == 1);
  v_1_X0_1 = v32;
  int v33 = (v6_W2 == 1);
  v_1_X2_1 = v33;
  int v34 = (v20_W11 == 0);
  v_1_X11_0 = v34;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[4] = 0;
  vars[3] = 0;
  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;
  v_1_X2_1 = 0;
  v_1_X11_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v21 = vars[0];
  int v22 = (v21 == 1);
  int v23 = vars[1];
  int v24 = (v23 == 1);
  int v25 = v_1_X0_1;
  int v26 = v_1_X2_1;
  int v27 = v_1_X11_0;
  int v28_conj = v26 & v27;
  int v29_conj = v25 & v28_conj;
  int v30_conj = v24 & v29_conj;
  int v31_conj = v22 & v30_conj;
  if (v31_conj == 1) assert(0);
  return 0;
}
