/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[3]; 
volatile int v_0_X0_1; 
volatile int v_1_X0_1; 
volatile int v_2_X0_1; 

void *t0(void *arg){
label_1:;
  int v3_W0 = vars[0];
  int v4_W2 = v3_W0 ^ v3_W0;
  vars[1+v4_W2] = 1;
  int v20 = (v3_W0 == 1);
  v_0_X0_1 = v20;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v7_W0 = vars[1];
  int v8_W2 = v7_W0 ^ v7_W0;
  int v9_W2 = v8_W2 + 1;
  vars[2] = v9_W2;
  int v21 = (v7_W0 == 1);
  v_1_X0_1 = v21;
  return NULL;
}

void *t2(void *arg){
label_3:;
  int v12_W0 = vars[2];
  int v13_W2 = v12_W0 ^ v12_W0;
  int v14_W2 = v13_W2 + 1;
  vars[0] = v14_W2;
  int v22 = (v12_W0 == 1);
  v_2_X0_1 = v22;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_0_X0_1 = 0;
  v_1_X0_1 = 0;
  v_2_X0_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v15 = v_0_X0_1;
  int v16 = v_1_X0_1;
  int v17 = v_2_X0_1;
  int v18_conj = v16 & v17;
  int v19_conj = v15 & v18_conj;
  if (v19_conj == 1) assert(0);
  return 0;
}
