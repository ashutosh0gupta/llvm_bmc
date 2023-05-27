/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[3]; 
volatile int v_0_X3_3; 
volatile int v_1_X7_0; 

void *t0(void *arg){
label_1:;
  vars[0] = 1;
  FENCE();
  vars[0] = 2;
  int v3_W3 = vars[0];
  int v20 = (v3_W3 == 3);
  v_0_X3_3 = v20;
  return NULL;
}

void *t1(void *arg){
label_2:;
  FENCE();
  vars[0] = 3;
  int v6_W2 = vars[1];
  int v7_W4 = v6_W2 ^ v6_W2;
  int v10_W5 = vars[2+v7_W4];
  if (v10_W5) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  FENCE();
  FENCE();
  int v13_W7 = vars[0];
  int v21 = (v13_W7 == 0);
  v_1_X7_0 = v21;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_0_X3_3 = 0;
  v_1_X7_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v14 = vars[0];
  int v15 = (v14 == 3);
  int v16 = v_0_X3_3;
  int v17 = v_1_X7_0;
  int v18_conj = v16 & v17;
  int v19_conj = v15 & v18_conj;
  if (v19_conj == 1) assert(0);
  return 0;
}
