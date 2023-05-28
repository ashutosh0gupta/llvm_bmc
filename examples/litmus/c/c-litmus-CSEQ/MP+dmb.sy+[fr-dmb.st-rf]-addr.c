/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[3]; 
volatile int v_1_X0_1; 
volatile int v_1_X2_1; 
volatile int v_1_X5_0; 

void *t0(void *arg){
label_1:;
  vars[0] = 1;
  FENCE();
  vars[1] = 1;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = vars[1];
  int v6_W2 = vars[2];
  int v7_W4 = v6_W2 ^ v6_W2;
  int v10_W5 = vars[0+v7_W4];
  int v19 = (v3_W0 == 1);
  v_1_X0_1 = v19;
  int v20 = (v6_W2 == 1);
  v_1_X2_1 = v20;
  int v21 = (v10_W5 == 0);
  v_1_X5_0 = v21;
  return NULL;
}

void *t2(void *arg){
label_3:;
  vars[1] = 2;
  FENCE();
  vars[2] = 1;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;
  v_1_X2_1 = 0;
  v_1_X5_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v11 = vars[1];
  int v12 = (v11 == 2);
  int v13 = v_1_X0_1;
  int v14 = v_1_X2_1;
  int v15 = v_1_X5_0;
  int v16_conj = v14 & v15;
  int v17_conj = v13 & v16_conj;
  int v18_conj = v12 & v17_conj;
  if (v18_conj == 1) assert(0);
  return 0;
}
