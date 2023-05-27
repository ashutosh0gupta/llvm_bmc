/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[4]; 
volatile int v_1_X0_1; 
volatile int v_1_X3_0; 
volatile int v_1_X5_1; 
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
  int v7_W3 = vars[2+v4_W2];
  int v10_W5 = vars[2];
  int v11_W6 = v10_W5 ^ v10_W5;
  int v14_W7 = vars[3+v11_W6];
  int v17_W9 = vars[3];
  int v18_W10 = v17_W9 ^ v17_W9;
  int v21_W11 = vars[0+v18_W10];
  int v38 = (v3_W0 == 1);
  v_1_X0_1 = v38;
  int v39 = (v7_W3 == 0);
  v_1_X3_0 = v39;
  int v40 = (v10_W5 == 1);
  v_1_X5_1 = v40;
  int v41 = (v21_W11 == 0);
  v_1_X11_0 = v41;
  return NULL;
}

void *t2(void *arg){
label_3:;
  vars[2] = 1;
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
  v_1_X3_0 = 0;
  v_1_X5_1 = 0;
  v_1_X11_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v22 = vars[0];
  int v23 = (v22 == 1);
  int v24 = vars[1];
  int v25 = (v24 == 1);
  int v26 = vars[2];
  int v27 = (v26 == 1);
  int v28 = v_1_X0_1;
  int v29 = v_1_X3_0;
  int v30 = v_1_X5_1;
  int v31 = v_1_X11_0;
  int v32_conj = v30 & v31;
  int v33_conj = v29 & v32_conj;
  int v34_conj = v28 & v33_conj;
  int v35_conj = v27 & v34_conj;
  int v36_conj = v25 & v35_conj;
  int v37_conj = v23 & v36_conj;
  if (v37_conj == 1) assert(0);
  return 0;
}
