/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[3]; 
volatile int v_1_X0_1; 
volatile int v_1_X3_0; 

void *t0(void *arg){
label_1:;
  vars[1] = 1;
  FENCE();
  vars[0] = 1;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = vars[0];
  FENCE();
  vars[2] = 1;
  FENCE();
  int v6_W3 = vars[2];
  int v9_W3 = vars[1];
  int v13 = (v3_W0 == 1);
  v_1_X0_1 = v13;
  int v14 = (v9_W3 == 0);
  v_1_X3_0 = v14;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;
  v_1_X3_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v10 = v_1_X0_1;
  int v11 = v_1_X3_0;
  int v12_conj = v10 & v11;
  if (v12_conj == 1) assert(0);
  return 0;
}
