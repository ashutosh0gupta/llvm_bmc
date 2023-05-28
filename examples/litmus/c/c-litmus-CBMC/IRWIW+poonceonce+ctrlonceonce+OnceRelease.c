/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[2]; 
volatile int v_1_X0_2; 
volatile int v_3_X0_2; 

void *t0(void *arg){
label_1:;
  vars[0] = 2;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = vars[0];
  vars[1] = 1;
  int v17 = (v3_W0 == 2);
  v_1_X0_2 = v17;
  return NULL;
}

void *t2(void *arg){
label_3:;
  FENCE();
  vars[1] = 2;
  return NULL;
}

void *t3(void *arg){
label_4:;
  int v6_W0 = vars[1];
  int v7_cmpeq = (v6_W0 == 0);
  if (v7_cmpeq)  goto lbl_label148; else goto lbl_label148;
lbl_label148:;
  vars[0] = 1;
  int v18 = (v6_W0 == 2);
  v_3_X0_2 = v18;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 
  pthread_t thr3; 

  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_2 = 0;
  v_3_X0_2 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);
  pthread_create(&thr3, NULL, t3, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);

  int v8 = vars[0];
  int v9 = (v8 == 2);
  int v10 = vars[1];
  int v11 = (v10 == 2);
  int v12 = v_1_X0_2;
  int v13 = v_3_X0_2;
  int v14_conj = v12 & v13;
  int v15_conj = v11 & v14_conj;
  int v16_conj = v9 & v15_conj;
  if (v16_conj == 1) assert(0);
  return 0;
}
