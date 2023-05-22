/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[5]; 
volatile int v_1_X0_1; 
volatile int v_1_X7_2; 
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
  int v8_W5 = v7_W3 ^ v7_W3;
  int v9_W5 = v8_W5 + 1;
  vars[3] = v9_W5;
  int v12_W7 = vars[3];
  int v13_W8 = v12_W7 ^ v12_W7;
  int v16_W9 = vars[4+v13_W8];
  if (v16_W9) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v19_W11 = vars[0];
  int v34 = (v3_W0 == 1);
  v_1_X0_1 = v34;
  int v35 = (v12_W7 == 2);
  v_1_X7_2 = v35;
  int v36 = (v19_W11 == 0);
  v_1_X11_0 = v36;
  return NULL;
}

void *t2(void *arg){
label_3:;
  vars[3] = 2;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  vars[4] = 0;
  vars[3] = 0;
  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;
  v_1_X7_2 = 0;
  v_1_X11_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v20 = vars[3];
  int v21 = (v20 == 2);
  int v22 = vars[0];
  int v23 = (v22 == 1);
  int v24 = vars[1];
  int v25 = (v24 == 1);
  int v26 = v_1_X0_1;
  int v27 = v_1_X7_2;
  int v28 = v_1_X11_0;
  int v29_conj = v27 & v28;
  int v30_conj = v26 & v29_conj;
  int v31_conj = v25 & v30_conj;
  int v32_conj = v23 & v31_conj;
  int v33_conj = v21 & v32_conj;
  if (v33_conj == 1) assert(0);
  return 0;
}
