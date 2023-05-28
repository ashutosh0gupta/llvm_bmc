/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[2]; 
volatile int v_1_X0_2; 
volatile int v_2_X0_1; 

void *t0(void *arg){
label_1:;
  vars[0] = 2;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = vars[0];
  int v4_W2 = v3_W0 ^ v3_W0;
  int v5_W2 = v4_W2 + 1;
  vars[1] = v5_W2;
  int v16 = (v3_W0 == 2);
  v_1_X0_2 = v16;
  return NULL;
}

void *t2(void *arg){
label_3:;
  int v8_W0 = vars[1];
  int v9_W2 = v8_W0 ^ v8_W0;
  vars[0+v9_W2] = 1;
  int v17 = (v8_W0 == 1);
  v_2_X0_1 = v17;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_2 = 0;
  v_2_X0_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v10 = vars[0];
  int v11 = (v10 == 2);
  int v12 = v_1_X0_2;
  int v13 = v_2_X0_1;
  int v14_conj = v12 & v13;
  int v15_conj = v11 & v14_conj;
  if (v15_conj == 1) assert(0);
  return 0;
}
