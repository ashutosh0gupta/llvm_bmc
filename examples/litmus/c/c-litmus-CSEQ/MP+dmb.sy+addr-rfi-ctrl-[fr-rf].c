/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[3]; 
volatile int v_1_X0_1; 
volatile int v_1_X5_1; 
volatile int v_1_X6_0; 
volatile int v_1_X8_1; 

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
  vars[2+v4_W2] = 1;
  int v7_W5 = vars[2];
  if (v7_W5) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v10_W6 = vars[0];
  int v13_W8 = vars[0];
  int v30 = (v3_W0 == 1);
  v_1_X0_1 = v30;
  int v31 = (v7_W5 == 1);
  v_1_X5_1 = v31;
  int v32 = (v10_W6 == 0);
  v_1_X6_0 = v32;
  int v33 = (v13_W8 == 1);
  v_1_X8_1 = v33;
  return NULL;
}

void *t2(void *arg){
label_3:;
  vars[0] = 1;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;
  v_1_X5_1 = 0;
  v_1_X6_0 = 0;
  v_1_X8_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v14 = vars[0];
  int v15 = (v14 == 2);
  int v16 = vars[1];
  int v17 = (v16 == 1);
  int v18 = vars[2];
  int v19 = (v18 == 1);
  int v20 = v_1_X0_1;
  int v21 = v_1_X5_1;
  int v22 = v_1_X6_0;
  int v23 = v_1_X8_1;
  int v24_conj = v22 & v23;
  int v25_conj = v21 & v24_conj;
  int v26_conj = v20 & v25_conj;
  int v27_conj = v19 & v26_conj;
  int v28_conj = v17 & v27_conj;
  int v29_conj = v15 & v28_conj;
  if (v29_conj == 1) assert(0);
  return 0;
}
