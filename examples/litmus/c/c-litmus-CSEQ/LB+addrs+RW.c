/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[4]; 
volatile int v_0_X0_1; 
volatile int v_1_X0_1; 

void *t0(void *arg){
label_1:;
  int v3_W0 = vars[0];
  int v4_W2 = v3_W0 ^ v3_W0;
  int v7_W3 = vars[1+v4_W2];
  vars[2] = 1;
  int v18 = (v3_W0 == 1);
  v_0_X0_1 = v18;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v10_W0 = vars[2];
  int v11_W2 = v10_W0 ^ v10_W0;
  int v14_W3 = vars[3+v11_W2];
  vars[0] = 1;
  int v19 = (v10_W0 == 1);
  v_1_X0_1 = v19;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[3] = 0;
  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_0_X0_1 = 0;
  v_1_X0_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v15 = v_0_X0_1;
  int v16 = v_1_X0_1;
  int v17_conj = v15 & v16;
  if (v17_conj == 1) assert(0);
  return 0;
}
