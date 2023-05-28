/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[3]; 
volatile int v_0_X2_1; 
volatile int v_1_X0_1; 
volatile int v_2_X0_1; 
volatile int v_2_X3_0; 

void *t0(void *arg){
label_1:;
  vars[0] = 1;
  FENCE();
  int v3_W2 = vars[0];
  vars[1] = 1;
  int v22 = (v3_W2 == 1);
  v_0_X2_1 = v22;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v6_W0 = vars[1];
  int v7_W2 = v6_W0 ^ v6_W0;
  vars[2+v7_W2] = 1;
  int v23 = (v6_W0 == 1);
  v_1_X0_1 = v23;
  return NULL;
}

void *t2(void *arg){
label_3:;
  int v10_W0 = vars[2];
  int v11_W2 = v10_W0 ^ v10_W0;
  int v14_W3 = vars[0+v11_W2];
  int v24 = (v10_W0 == 1);
  v_2_X0_1 = v24;
  int v25 = (v14_W3 == 0);
  v_2_X3_0 = v25;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_0_X2_1 = 0;
  v_1_X0_1 = 0;
  v_2_X0_1 = 0;
  v_2_X3_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v15 = v_0_X2_1;
  int v16 = v_1_X0_1;
  int v17 = v_2_X0_1;
  int v18 = v_2_X3_0;
  int v19_conj = v17 & v18;
  int v20_conj = v16 & v19_conj;
  int v21_conj = v15 & v20_conj;
  if (v21_conj == 1) assert(0);
  return 0;
}
