/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[3]; 
volatile int v_0_X0_1; 
volatile int v_1_X0_1; 
volatile int v_1_X4_1; 

void *t0(void *arg){
label_1:;
  int v3_W0 = vars[0];
  FENCE();
  vars[1] = 1;
  int v16 = (v3_W0 == 1);
  v_0_X0_1 = v16;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v6_W0 = vars[1];
  if (v6_W0) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  vars[2] = 1;
  int v9_W4 = vars[2];
  int v10_W5 = v9_W4 ^ v9_W4;
  vars[0+v10_W5] = 1;
  int v17 = (v6_W0 == 1);
  v_1_X0_1 = v17;
  int v18 = (v9_W4 == 1);
  v_1_X4_1 = v18;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_0_X0_1 = 0;
  v_1_X0_1 = 0;
  v_1_X4_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v11 = v_0_X0_1;
  int v12 = v_1_X0_1;
  int v13 = v_1_X4_1;
  int v14_conj = v12 & v13;
  int v15_conj = v11 & v14_conj;
  if (v15_conj == 1) assert(0);
  return 0;
}
