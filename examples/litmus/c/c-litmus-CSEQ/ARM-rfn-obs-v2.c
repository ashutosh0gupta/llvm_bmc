/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[2]; 
volatile int v_1_X0_1; 
volatile int v_1_X2_1; 

void *t0(void *arg){
label_1:;
  vars[0] = 0;
  FENCE();
  vars[1] = 0;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = vars[1];
  vars[0] = v3_W0;
  int v6_W2 = vars[0];
  vars[0] = 0;
  int v13 = (v3_W0 == 1);
  v_1_X0_1 = v13;
  int v14 = (v6_W2 == 1);
  v_1_X2_1 = v14;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;
  v_1_X2_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v7 = v_1_X0_1;
  int v8 = v_1_X2_1;
  int v9 = vars[0];
  int v10 = (v9 == 3);
  int v11_conj = v8 & v10;
  int v12_conj = v7 & v11_conj;
  if (v12_conj == 1) assert(0);
  return 0;
}
