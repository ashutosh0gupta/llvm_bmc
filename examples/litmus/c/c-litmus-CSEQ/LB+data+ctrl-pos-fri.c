/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[2]; 
volatile int v_0_X0_1; 
volatile int v_1_X0_1; 
volatile int v_1_X2_0; 
volatile int v_1_X4_0; 

void *t0(void *arg){
label_1:;
  int v3_W0 = vars[0];
  int v4_W2 = v3_W0 ^ v3_W0;
  int v5_W2 = v4_W2 + 1;
  vars[1] = v5_W2;
  int v28 = (v3_W0 == 1);
  v_0_X0_1 = v28;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v8_W0 = vars[1];
  if (v8_W0) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v11_W2 = vars[0];
  int v14_W4 = vars[0];
  vars[0] = 1;
  int v29 = (v8_W0 == 1);
  v_1_X0_1 = v29;
  int v30 = (v11_W2 == 0);
  v_1_X2_0 = v30;
  int v31 = (v14_W4 == 0);
  v_1_X4_0 = v31;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[1] = 0;
  vars[0] = 0;
  v_0_X0_1 = 0;
  v_1_X0_1 = 0;
  v_1_X2_0 = 0;
  v_1_X4_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v15 = vars[0];
  int v16 = (v15 == 1);
  int v17 = vars[1];
  int v18 = (v17 == 1);
  int v19 = v_0_X0_1;
  int v20 = v_1_X0_1;
  int v21 = v_1_X2_0;
  int v22 = v_1_X4_0;
  int v23_conj = v21 & v22;
  int v24_conj = v20 & v23_conj;
  int v25_conj = v19 & v24_conj;
  int v26_conj = v18 & v25_conj;
  int v27_conj = v16 & v26_conj;
  if (v27_conj == 1) assert(0);
  return 0;
}
