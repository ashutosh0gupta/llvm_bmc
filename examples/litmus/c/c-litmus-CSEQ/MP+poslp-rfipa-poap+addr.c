/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[2]; 
volatile int v_0_X3_2; 
volatile int v_1_X0_1; 
volatile int v_1_X3_0; 

void *t0(void *arg){
label_1:;
  FENCE();
  vars[0] = 1;
  vars[0] = 2;
  FENCE();
  int v3_W3 = vars[0];
  vars[1] = 1;
  int v19 = (v3_W3 == 2);
  v_0_X3_2 = v19;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v6_W0 = vars[1];
  int v7_W2 = v6_W0 ^ v6_W0;
  int v10_W3 = vars[0+v7_W2];
  int v20 = (v6_W0 == 1);
  v_1_X0_1 = v20;
  int v21 = (v10_W3 == 0);
  v_1_X3_0 = v21;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[1] = 0;
  vars[0] = 0;
  v_0_X3_2 = 0;
  v_1_X0_1 = 0;
  v_1_X3_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v11 = vars[0];
  int v12 = (v11 == 2);
  int v13 = v_0_X3_2;
  int v14 = v_1_X0_1;
  int v15 = v_1_X3_0;
  int v16_conj = v14 & v15;
  int v17_conj = v13 & v16_conj;
  int v18_conj = v12 & v17_conj;
  if (v18_conj == 1) assert(0);
  return 0;
}
