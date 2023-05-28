/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[2]; 
volatile int v_0_X7_2; 
volatile int v_0_X2_3; 
volatile int v_1_X3_3; 
volatile int v_1_X2_2; 

void *t0(void *arg){
label_1:;
  vars[0] = 3;
  int v3_W2 = vars[0];
  int v4_W3 = v3_W2 ^ v3_W2;
  int v7_W4 = vars[1+v4_W3];
  if (v7_W4) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  FENCE();
  vars[0] = 1;
  int v10_W7 = vars[0];
  int v27 = (v10_W7 == 2);
  v_0_X7_2 = v27;
  int v28 = (v3_W2 == 3);
  v_0_X2_3 = v28;
  return NULL;
}

void *t1(void *arg){
label_2:;
  FENCE();
  vars[0] = 2;
  FENCE();
  int v13_W2 = vars[0];
  int v16_W3 = vars[0];
  int v29 = (v16_W3 == 3);
  v_1_X3_3 = v29;
  int v30 = (v13_W2 == 2);
  v_1_X2_2 = v30;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[1] = 0;
  vars[0] = 0;
  v_0_X7_2 = 0;
  v_0_X2_3 = 0;
  v_1_X3_3 = 0;
  v_1_X2_2 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v17 = vars[0];
  int v18 = (v17 == 3);
  int v19 = v_0_X7_2;
  int v20 = v_0_X2_3;
  int v21 = v_1_X3_3;
  int v22 = v_1_X2_2;
  int v23_conj = v21 & v22;
  int v24_conj = v20 & v23_conj;
  int v25_conj = v19 & v24_conj;
  int v26_conj = v18 & v25_conj;
  if (v26_conj == 1) assert(0);
  return 0;
}
