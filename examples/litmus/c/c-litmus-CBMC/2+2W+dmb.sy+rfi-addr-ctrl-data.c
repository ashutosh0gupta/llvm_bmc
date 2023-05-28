/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[4]; 
volatile int v_1_X2_2; 

void *t0(void *arg){
label_1:;
  vars[0] = 2;
  FENCE();
  vars[1] = 1;
  return NULL;
}

void *t1(void *arg){
label_2:;
  vars[1] = 2;
  int v3_W2 = vars[1];
  int v4_W3 = v3_W2 ^ v3_W2;
  int v7_W4 = vars[2+v4_W3];
  if (v7_W4) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v10_W6 = vars[3];
  int v11_W8 = v10_W6 ^ v10_W6;
  int v12_W8 = v11_W8 + 1;
  vars[0] = v12_W8;
  int v20 = (v3_W2 == 2);
  v_1_X2_2 = v20;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[3] = 0;
  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X2_2 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v13 = vars[0];
  int v14 = (v13 == 2);
  int v15 = vars[1];
  int v16 = (v15 == 2);
  int v17 = v_1_X2_2;
  int v18_conj = v16 & v17;
  int v19_conj = v14 & v18_conj;
  if (v19_conj == 1) assert(0);
  return 0;
}
