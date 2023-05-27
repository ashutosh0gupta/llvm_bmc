/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[4]; 
volatile int v_0_X0_1; 
volatile int v_1_X0_1; 

void *t0(void *arg){
label_1:;
  int v3_W0 = vars[0];
  int v4_W2 = v3_W0 ^ v3_W0;
  int v5_W2 = v4_W2 + 1;
  vars[1] = v5_W2;
  int v25 = (v3_W0 == 1);
  v_0_X0_1 = v25;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v8_W0 = vars[1];
  if (v8_W0) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v11_W2 = vars[2];
  int v12_W4 = v11_W2 ^ v11_W2;
  int v15_W5 = vars[3+v12_W4];
  if (v15_W5) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  vars[0] = 1;
  int v26 = (v8_W0 == 1);
  v_1_X0_1 = v26;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[3] = 0;
  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_0_X0_1 = 0;
  v_1_X0_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v16 = vars[0];
  int v17 = (v16 == 1);
  int v18 = vars[1];
  int v19 = (v18 == 1);
  int v20 = v_0_X0_1;
  int v21 = v_1_X0_1;
  int v22_conj = v20 & v21;
  int v23_conj = v19 & v22_conj;
  int v24_conj = v17 & v23_conj;
  if (v24_conj == 1) assert(0);
  return 0;
}
