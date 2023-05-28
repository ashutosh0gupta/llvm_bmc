/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[3]; 
volatile int v_1_X0_1; 
volatile int v_3_X2_0; 

void *t0(void *arg){
label_1:;
  FENCE();
  vars[0] = 1;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = vars[0];
  FENCE();
  vars[1] = 1;
  int v16 = (v3_W0 == 1);
  v_1_X0_1 = v16;
  return NULL;
}

void *t2(void *arg){
label_3:;
  vars[1] = 2;
  FENCE();
  vars[2] = 1;
  return NULL;
}

void *t3(void *arg){
label_4:;
  FENCE();
  vars[2] = 2;
  FENCE();
  int v6_W2 = vars[0];
  int v17 = (v6_W2 == 0);
  v_3_X2_0 = v17;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 
  pthread_t thr3; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;
  v_3_X2_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);
  pthread_create(&thr3, NULL, t3, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);

  int v7 = vars[1];
  int v8 = (v7 == 2);
  int v9 = vars[2];
  int v10 = (v9 == 2);
  int v11 = v_1_X0_1;
  int v12 = v_3_X2_0;
  int v13_conj = v11 & v12;
  int v14_conj = v10 & v13_conj;
  int v15_conj = v8 & v14_conj;
  if (v15_conj == 1) assert(0);
  return 0;
}
