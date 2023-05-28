/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[3]; 
volatile int v_1_X0_2; 

void *t0(void *arg){
label_1:;
  FENCE();
  vars[0] = 2;
  return NULL;
}

void *t1(void *arg){
label_2:;
  FENCE();
  int v3_W0 = vars[0];
  FENCE();
  vars[1] = 1;
  int v14 = (v3_W0 == 2);
  v_1_X0_2 = v14;
  return NULL;
}

void *t2(void *arg){
label_3:;
  FENCE();
  vars[1] = 2;
  FENCE();
  vars[2] = 1;
  return NULL;
}

void *t3(void *arg){
label_4:;
  vars[2] = 2;
  FENCE();
  vars[0] = 1;
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
  v_1_X0_2 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);
  pthread_create(&thr3, NULL, t3, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);

  int v4 = vars[0];
  int v5 = (v4 == 2);
  int v6 = vars[1];
  int v7 = (v6 == 2);
  int v8 = vars[2];
  int v9 = (v8 == 2);
  int v10 = v_1_X0_2;
  int v11_conj = v9 & v10;
  int v12_conj = v7 & v11_conj;
  int v13_conj = v5 & v12_conj;
  if (v13_conj == 1) assert(0);
  return 0;
}
