/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[3]; 
volatile int v_0_X2_1; 
volatile int v_1_X2_0; 

void *t0(void *arg){
label_1:;
  vars[0] = 1;
  int v3_W2 = vars[0];
  int v4_W3 = v3_W2 ^ v3_W2;
  int v7_W4 = vars[1+v4_W3];
  if (v7_W4) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  vars[2] = 1;
  int v20 = (v3_W2 == 1);
  v_0_X2_1 = v20;
  return NULL;
}

void *t1(void *arg){
label_2:;
  vars[2] = 2;
  FENCE();
  int v10_W2 = vars[0];
  int v21 = (v10_W2 == 0);
  v_1_X2_0 = v21;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_0_X2_1 = 0;
  v_1_X2_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v11 = vars[0];
  int v12 = (v11 == 1);
  int v13 = vars[2];
  int v14 = (v13 == 2);
  int v15 = v_0_X2_1;
  int v16 = v_1_X2_0;
  int v17_conj = v15 & v16;
  int v18_conj = v14 & v17_conj;
  int v19_conj = v12 & v18_conj;
  if (v19_conj == 1) assert(0);
  return 0;
}
