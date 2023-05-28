/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[3]; 
volatile int v_1_X0_1; 
volatile int v_1_X6_0; 
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
  int v4_W2 = v3_W0 ^ v3_W0;
  int v7_W3 = vars[2+v4_W2];
  int v10_W5 = vars[2];
  if (v10_W5) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v13_W6 = vars[0];
  int v16_W8 = vars[0];
  int v28 = (v3_W0 == 1);
  v_1_X0_1 = v28;
  int v29 = (v13_W6 == 0);
  v_1_X6_0 = v29;
  int v30 = (v16_W8 == 0);
  v_1_X8_0 = v30;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;
  v_1_X6_0 = 0;
  v_1_X8_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v17 = vars[0];
  int v18 = (v17 == 1);
  int v19 = vars[1];
  int v20 = (v19 == 1);
  int v21 = v_1_X0_1;
  int v22 = v_1_X6_0;
  int v23 = v_1_X8_0;
  int v24_conj = v22 & v23;
  int v25_conj = v21 & v24_conj;
  int v26_conj = v20 & v25_conj;
  int v27_conj = v18 & v26_conj;
  if (v27_conj == 1) assert(0);
  return 0;
}
