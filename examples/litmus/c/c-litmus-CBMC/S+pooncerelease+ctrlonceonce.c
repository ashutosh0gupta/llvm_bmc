/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[2]; 
volatile int v_1_X0_1; 

void *t0(void *arg){
label_1:;
  vars[1] = 2;
  FENCE();
  vars[0] = 1;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = vars[0];
  int v4_cmpeq = (v3_W0 == 0);
  if (v4_cmpeq)  goto lbl_label230; else goto lbl_label230;
lbl_label230:;
  vars[1] = 1;
  int v9 = (v3_W0 == 1);
  v_1_X0_1 = v9;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v5 = vars[1];
  int v6 = (v5 == 2);
  int v7 = v_1_X0_1;
  int v8_conj = v6 & v7;
  if (v8_conj == 1) assert(0);
  return 0;
}
