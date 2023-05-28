/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[4]; 
volatile int v_1_X0_1; 
volatile int v_2_X0_1; 

void *t0(void *arg){
label_1:;
  FENCE();
  vars[0] = 1;
  return NULL;
}

void *t1(void *arg){
label_2:;
  FENCE();
  int v3_W0 = vars[0];
  FENCE();
  vars[1] = 1;
  int v19 = (v3_W0 == 1);
  v_1_X0_1 = v19;
  return NULL;
}

void *t2(void *arg){
label_3:;
  FENCE();
  int v6_W0 = vars[1];
  vars[2] = 1;
  int v20 = (v6_W0 == 1);
  v_2_X0_1 = v20;
  return NULL;
}

void *t3(void *arg){
label_4:;
  vars[2] = 2;
  FENCE();
  vars[3] = 1;
  return NULL;
}

void *t4(void *arg){
label_5:;
  vars[3] = 2;
  FENCE();
  vars[0] = 2;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 
  pthread_t thr3; 
  pthread_t thr4; 

  vars[3] = 0;
  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;
  v_2_X0_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);
  pthread_create(&thr3, NULL, t3, NULL);
  pthread_create(&thr4, NULL, t4, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);
  pthread_join(thr4, NULL);

  int v7 = v_1_X0_1;
  int v8 = v_2_X0_1;
  int v9 = vars[2];
  int v10 = (v9 == 2);
  int v11 = vars[3];
  int v12 = (v11 == 2);
  int v13 = vars[0];
  int v14 = (v13 == 1);
  int v15_conj = v12 & v14;
  int v16_conj = v10 & v15_conj;
  int v17_conj = v8 & v16_conj;
  int v18_conj = v7 & v17_conj;
  if (v18_conj == 1) assert(0);
  return 0;
}
