/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[2]; 
volatile int v_1_X0_1; 

void *t0(void *arg){
label_1:;
  FENCE();
  vars[0] = 2;
  vars[1] = 1;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = vars[1];
  vars[0] = 1;
  int v8 = (v3_W0 == 1);
  v_1_X0_1 = v8;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v4 = vars[0];
  int v5 = (v4 == 2);
  int v6 = v_1_X0_1;
  int v7_conj = v5 & v6;
  if (v7_conj == 1) assert(0);
  return 0;
}
