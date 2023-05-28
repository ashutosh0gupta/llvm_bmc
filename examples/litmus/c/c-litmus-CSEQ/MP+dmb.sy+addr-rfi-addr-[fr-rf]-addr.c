/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[4]; 
volatile int v_1_X0_1; 
volatile int v_1_X5_1; 
volatile int v_1_X7_0; 
volatile int v_1_X9_1; 
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
  int v4_W2 = v3_W0 ^ v3_W0;
  vars[2+v4_W2] = 1;
  int v7_W5 = vars[2];
  int v8_W6 = v7_W5 ^ v7_W5;
  int v11_W7 = vars[3+v8_W6];
  int v14_W9 = vars[3];
  int v15_W10 = v14_W9 ^ v14_W9;
  int v18_W11 = vars[0+v15_W10];
  int v40 = (v3_W0 == 1);
  v_1_X0_1 = v40;
  int v41 = (v7_W5 == 1);
  v_1_X5_1 = v41;
  int v42 = (v11_W7 == 0);
  v_1_X7_0 = v42;
  int v43 = (v14_W9 == 1);
  v_1_X9_1 = v43;
  int v44 = (v18_W11 == 0);
  v_1_X11_0 = v44;
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
  v_1_X5_1 = 0;
  v_1_X7_0 = 0;
  v_1_X9_1 = 0;
  v_1_X11_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v19 = vars[3];
  int v20 = (v19 == 1);
  int v21 = vars[0];
  int v22 = (v21 == 1);
  int v23 = vars[1];
  int v24 = (v23 == 1);
  int v25 = vars[2];
  int v26 = (v25 == 1);
  int v27 = v_1_X0_1;
  int v28 = v_1_X5_1;
  int v29 = v_1_X7_0;
  int v30 = v_1_X9_1;
  int v31 = v_1_X11_0;
  int v32_conj = v30 & v31;
  int v33_conj = v29 & v32_conj;
  int v34_conj = v28 & v33_conj;
  int v35_conj = v27 & v34_conj;
  int v36_conj = v26 & v35_conj;
  int v37_conj = v24 & v36_conj;
  int v38_conj = v22 & v37_conj;
  int v39_conj = v20 & v38_conj;
  if (v39_conj == 1) assert(0);
  return 0;
}
