/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[4]; 
volatile int v_1_X0_1; 
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
  int v9_W4 = vars[2];
  if (v9_W4) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  int v12_W5 = vars[3];
  int v15_W7 = vars[3];
  if (v15_W7) goto lbl_LC02; else goto lbl_LC02;
lbl_LC02:;
  FENCE();
  int v18_W8 = vars[0];
  int v28 = (v3_W0 == 1);
  v_1_X0_1 = v28;
  int v29 = (v18_W8 == 0);
  v_1_X8_0 = v29;
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
  v_1_X8_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v19 = vars[0];
  int v20 = (v19 == 1);
  int v21 = vars[1];
  int v22 = (v21 == 1);
  int v23 = v_1_X0_1;
  int v24 = v_1_X8_0;
  int v25_conj = v23 & v24;
  int v26_conj = v22 & v25_conj;
  int v27_conj = v20 & v26_conj;
  if (v27_conj == 1) assert(0);
  return 0;
}
