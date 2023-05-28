/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[1]; 
volatile int v_0_X1_2; 

void *t0(void *arg){
label_1:;
  vars[0] = 1;
  int v3_W1 = vars[0];
  int v8 = (v3_W1 == 2);
  v_0_X1_2 = v8;
  return NULL;
}

void *t1(void *arg){
label_2:;
  vars[0] = 2;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[0] = 0;
  v_0_X1_2 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v4 = v_0_X1_2;
  int v5 = vars[0];
  int v6 = (v5 == 1);
  int v7_conj = v4 & v6;
  if (v7_conj == 1) assert(0);
  return 0;
}
