/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[3]; 
volatile int v_0_X2_0; 
volatile int v_1_X2_1; 
volatile int v_1_X6_1; 
volatile int v_1_X7_0; 

void *t0(void *arg){
label_1:;
  vars[0] = 1;
  FENCE();
  int v3_W2 = vars[1];
  int v30 = (v3_W2 == 0);
  v_0_X2_0 = v30;
  return NULL;
}

void *t1(void *arg){
label_2:;
  vars[1] = 1;
  int v6_W2 = vars[1];
  int v7_W3 = v6_W2 ^ v6_W2;
  vars[2+v7_W3] = 1;
  int v10_W6 = vars[2];
  if (v10_W6) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v13_W7 = vars[0];
  int v31 = (v6_W2 == 1);
  v_1_X2_1 = v31;
  int v32 = (v10_W6 == 1);
  v_1_X6_1 = v32;
  int v33 = (v13_W7 == 0);
  v_1_X7_0 = v33;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_0_X2_0 = 0;
  v_1_X2_1 = 0;
  v_1_X6_1 = 0;
  v_1_X7_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v14 = vars[0];
  int v15 = (v14 == 1);
  int v16 = vars[1];
  int v17 = (v16 == 1);
  int v18 = vars[2];
  int v19 = (v18 == 1);
  int v20 = v_0_X2_0;
  int v21 = v_1_X2_1;
  int v22 = v_1_X6_1;
  int v23 = v_1_X7_0;
  int v24_conj = v22 & v23;
  int v25_conj = v21 & v24_conj;
  int v26_conj = v20 & v25_conj;
  int v27_conj = v19 & v26_conj;
  int v28_conj = v17 & v27_conj;
  int v29_conj = v15 & v28_conj;
  if (v29_conj == 1) assert(0);
  return 0;
}
