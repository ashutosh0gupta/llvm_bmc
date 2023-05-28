/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[4]; 
volatile int v_1_X0_1; 
volatile int v_1_X4_1; 
volatile int v_1_X6_0; 
volatile int v_1_X8_1; 
volatile int v_1_X10_0; 

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
  int v9_W5 = v8_W4 ^ v8_W4;
  int v12_W6 = vars[3+v9_W5];
  int v15_W8 = vars[3];
  int v16_W9 = v15_W8 ^ v15_W8;
  int v19_W10 = vars[0+v16_W9];
  int v41 = (v3_W0 == 1);
  v_1_X0_1 = v41;
  int v42 = (v8_W4 == 1);
  v_1_X4_1 = v42;
  int v43 = (v12_W6 == 0);
  v_1_X6_0 = v43;
  int v44 = (v15_W8 == 1);
  v_1_X8_1 = v44;
  int v45 = (v19_W10 == 0);
  v_1_X10_0 = v45;
  return NULL;
}

void *t2(void *arg){
label_3:;
  vars[3] = 1;
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
  v_1_X4_1 = 0;
  v_1_X6_0 = 0;
  v_1_X8_1 = 0;
  v_1_X10_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v20 = vars[3];
  int v21 = (v20 == 1);
  int v22 = vars[0];
  int v23 = (v22 == 1);
  int v24 = vars[1];
  int v25 = (v24 == 1);
  int v26 = vars[2];
  int v27 = (v26 == 1);
  int v28 = v_1_X0_1;
  int v29 = v_1_X4_1;
  int v30 = v_1_X6_0;
  int v31 = v_1_X8_1;
  int v32 = v_1_X10_0;
  int v33_conj = v31 & v32;
  int v34_conj = v30 & v33_conj;
  int v35_conj = v29 & v34_conj;
  int v36_conj = v28 & v35_conj;
  int v37_conj = v27 & v36_conj;
  int v38_conj = v25 & v37_conj;
  int v39_conj = v23 & v38_conj;
  int v40_conj = v21 & v39_conj;
  if (v40_conj == 1) assert(0);
  return 0;
}
