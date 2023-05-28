/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[5]; 
volatile int v_0_X0_1; 
volatile int v_0_X2_1; 
volatile int v_0_X4_0; 
volatile int v_1_X2_1; 
volatile int v_2_X0_1; 

void *t0(void *arg){
label_1:;
  int v3_W0 = vars[0];
  vars[1] = v3_W0;
  FENCE();
  int v6_W2 = vars[2];
  int v9_W4 = vars[3];
  int v25 = (v3_W0 == 1);
  v_0_X0_1 = v25;
  int v26 = (v6_W2 == 1);
  v_0_X2_1 = v26;
  int v27 = (v9_W4 == 0);
  v_0_X4_0 = v27;
  return NULL;
}

void *t1(void *arg){
label_2:;
  vars[3] = 1;
  FENCE();
  vars[0] = 1;
  int v12_W2 = vars[1];
  vars[4] = v12_W2;
  int v28 = (v12_W2 == 1);
  v_1_X2_1 = v28;
  return NULL;
}

void *t2(void *arg){
label_3:;
  int v15_W0 = vars[4];
  FENCE();
  vars[2] = 1;
  int v29 = (v15_W0 == 1);
  v_2_X0_1 = v29;
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
  v_0_X0_1 = 0;
  v_0_X2_1 = 0;
  v_0_X4_0 = 0;
  v_1_X2_1 = 0;
  v_2_X0_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v16 = v_0_X0_1;
  int v17 = v_0_X2_1;
  int v18 = v_0_X4_0;
  int v19 = v_1_X2_1;
  int v20 = v_2_X0_1;
  int v21_conj = v19 & v20;
  int v22_conj = v18 & v21_conj;
  int v23_conj = v17 & v22_conj;
  int v24_conj = v16 & v23_conj;
  if (v24_conj == 1) assert(0);
  return 0;
}
