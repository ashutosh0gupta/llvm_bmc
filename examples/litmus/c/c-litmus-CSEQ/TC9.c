/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[2]; 
volatile int v_0_X0_1; 
volatile int v_1_X0_1; 

void *t0(void *arg){
label_1:;
  int v3_W0 = vars[1];
  int v4_W2 = v3_W0 ^ 0;
  int v5_W2 = v3_W0 ^ v4_W2;
  vars[0] = v5_W2;
  int v12 = (v3_W0 == 1);
  v_0_X0_1 = v12;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v8_W0 = vars[0];
  vars[1] = v8_W0;
  int v13 = (v8_W0 == 1);
  v_1_X0_1 = v13;
  return NULL;
}

void *t2(void *arg){
label_3:;
  vars[1] = 2;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  vars[0] = 0;
  vars[1] = 0;
  v_0_X0_1 = 0;
  v_1_X0_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v9 = v_0_X0_1;
  int v10 = v_1_X0_1;
  int v11_conj = v9 & v10;
  if (v11_conj == 1) assert(0);
  return 0;
}
