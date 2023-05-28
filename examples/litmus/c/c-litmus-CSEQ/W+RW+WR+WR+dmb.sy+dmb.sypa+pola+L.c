/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[3]; 
volatile int v_1_X0_1; 
volatile int v_2_X2_0; 
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
  int v18 = (v3_W0 == 1);
  v_1_X0_1 = v18;
  return NULL;
}

void *t2(void *arg){
label_3:;
  vars[1] = 2;
  FENCE();
  FENCE();
  int v6_W2 = vars[2];
  int v19 = (v6_W2 == 0);
  v_2_X2_0 = v19;
  return NULL;
}

void *t3(void *arg){
label_4:;
  FENCE();
  vars[2] = 1;
  FENCE();
  int v9_W2 = vars[0];
  int v20 = (v9_W2 == 0);
  v_3_X2_0 = v20;
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
  v_2_X2_0 = 0;
  v_3_X2_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);
  pthread_create(&thr3, NULL, t3, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);

  int v10 = vars[1];
  int v11 = (v10 == 2);
  int v12 = v_1_X0_1;
  int v13 = v_2_X2_0;
  int v14 = v_3_X2_0;
  int v15_conj = v13 & v14;
  int v16_conj = v12 & v15_conj;
  int v17_conj = v11 & v16_conj;
  if (v17_conj == 1) assert(0);
  return 0;
}
