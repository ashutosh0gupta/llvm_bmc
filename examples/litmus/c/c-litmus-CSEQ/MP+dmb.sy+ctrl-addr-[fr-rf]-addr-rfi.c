/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[4]; 
volatile int v_1_X0_1; 
volatile int v_1_X5_0; 
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
  if (v3_W0) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v6_W2 = vars[2];
  int v7_W4 = v6_W2 ^ v6_W2;
  int v10_W5 = vars[3+v7_W4];
  int v13_W7 = vars[3];
  int v14_W8 = v13_W7 ^ v13_W7;
  vars[0+v14_W8] = 1;
  int v17_W11 = vars[0];
  int v34 = (v3_W0 == 1);
  v_1_X0_1 = v34;
  int v35 = (v10_W5 == 0);
  v_1_X5_0 = v35;
  int v36 = (v13_W7 == 1);
  v_1_X7_1 = v36;
  int v37 = (v17_W11 == 1);
  v_1_X11_1 = v37;
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
  v_1_X5_0 = 0;
  v_1_X7_1 = 0;
  v_1_X11_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v18 = vars[3];
  int v19 = (v18 == 1);
  int v20 = vars[0];
  int v21 = (v20 == 2);
  int v22 = vars[1];
  int v23 = (v22 == 1);
  int v24 = v_1_X0_1;
  int v25 = v_1_X5_0;
  int v26 = v_1_X7_1;
  int v27 = v_1_X11_1;
  int v28_conj = v26 & v27;
  int v29_conj = v25 & v28_conj;
  int v30_conj = v24 & v29_conj;
  int v31_conj = v23 & v30_conj;
  int v32_conj = v21 & v31_conj;
  int v33_conj = v19 & v32_conj;
  if (v33_conj == 1) assert(0);
  return 0;
}
