/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[4]; 
volatile int v_1_X0_1; 
volatile int v_1_X7_1; 
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
  if (v7_W3) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  vars[3] = 1;
  int v10_W7 = vars[3];
  int v11_W8 = v10_W7 ^ v10_W7;
  vars[0+v11_W8] = 1;
  int v14_W11 = vars[0];
  int v29 = (v3_W0 == 1);
  v_1_X0_1 = v29;
  int v30 = (v10_W7 == 1);
  v_1_X7_1 = v30;
  int v31 = (v14_W11 == 1);
  v_1_X11_1 = v31;
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
  v_1_X11_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v15 = vars[3];
  int v16 = (v15 == 1);
  int v17 = vars[0];
  int v18 = (v17 == 2);
  int v19 = vars[1];
  int v20 = (v19 == 1);
  int v21 = v_1_X0_1;
  int v22 = v_1_X7_1;
  int v23 = v_1_X11_1;
  int v24_conj = v22 & v23;
  int v25_conj = v21 & v24_conj;
  int v26_conj = v20 & v25_conj;
  int v27_conj = v18 & v26_conj;
  int v28_conj = v16 & v27_conj;
  if (v28_conj == 1) assert(0);
  return 0;
}
