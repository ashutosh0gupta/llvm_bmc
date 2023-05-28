/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[2]; 
volatile int v_0_X0_1; 
volatile int v_0_X2_2; 
volatile int v_1_X2_2; 

void *t0(void *arg){
label_1:;
  int v3_W0 = vars[0];
  int v4_W2 = v3_W0 + 0;
  vars[1] = 1;
  int v20 = (1 == 1);
  v_0_X0_1 = v20;
  int v21 = (v4_W2 == 2);
  v_0_X2_2 = v21;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v7_W0 = vars[1];
  int v8_W2 = v7_W0 + 1;
  vars[0] = v8_W2;
  int v22 = (v8_W2 == 2);
  v_1_X2_2 = v22;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[1] = 0;
  vars[0] = 0;
  v_0_X0_1 = 0;
  v_0_X2_2 = 0;
  v_1_X2_2 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v9 = v_0_X0_1;
  int v10 = v_0_X2_2;
  int v11 = v_1_X2_2;
  int v12 = vars[1];
  int v13 = (v12 == 1);
  int v14 = vars[0];
  int v15 = (v14 == 2);
  int v16_conj = v13 & v15;
  int v17_conj = v11 & v16_conj;
  int v18_conj = v10 & v17_conj;
  int v19_conj = v9 & v18_conj;
  if (v19_conj == 1) assert(0);
  return 0;
}
