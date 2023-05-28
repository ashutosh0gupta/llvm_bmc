/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[5]; 
volatile int v_1_X0_1; 
volatile int v_1_X5_0; 
volatile int v_1_X7_1; 
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
  if (v3_W0) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v6_W2 = vars[2];
  int v7_W4 = v6_W2 ^ v6_W2;
  int v10_W5 = vars[3+v7_W4];
  int v13_W7 = vars[3];
  if (v13_W7) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  int v16_W8 = vars[4];
  int v17_W10 = v16_W8 ^ v16_W8;
  int v20_W11 = vars[0+v17_W10];
  int v37 = (v3_W0 == 1);
  v_1_X0_1 = v37;
  int v38 = (v10_W5 == 0);
  v_1_X5_0 = v38;
  int v39 = (v13_W7 == 1);
  v_1_X7_1 = v39;
  int v40 = (v20_W11 == 0);
  v_1_X11_0 = v40;
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

  vars[4] = 0;
  vars[3] = 0;
  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;
  v_1_X5_0 = 0;
  v_1_X7_1 = 0;
  v_1_X11_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v21 = vars[3];
  int v22 = (v21 == 1);
  int v23 = vars[0];
  int v24 = (v23 == 1);
  int v25 = vars[1];
  int v26 = (v25 == 1);
  int v27 = v_1_X0_1;
  int v28 = v_1_X5_0;
  int v29 = v_1_X7_1;
  int v30 = v_1_X11_0;
  int v31_conj = v29 & v30;
  int v32_conj = v28 & v31_conj;
  int v33_conj = v27 & v32_conj;
  int v34_conj = v26 & v33_conj;
  int v35_conj = v24 & v34_conj;
  int v36_conj = v22 & v35_conj;
  if (v36_conj == 1) assert(0);
  return 0;
}
