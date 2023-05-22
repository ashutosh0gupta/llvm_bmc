/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[3]; 
volatile int v_1_X0_1; 
volatile int v_1_X3_2; 
volatile int v_1_X8_1; 

void *t0(void *arg){
label_1:;
  vars[0] = 2;
  FENCE();
  vars[1] = 1;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = vars[1];
  vars[1] = 2;
  int v6_W3 = vars[1];
  if (v6_W3) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v9_W4 = vars[2];
  int v10_W6 = v9_W4 ^ v9_W4;
  int v11_W6 = v10_W6 + 1;
  vars[0] = v11_W6;
  int v14_W8 = vars[0];
  int v26 = (v3_W0 == 1);
  v_1_X0_1 = v26;
  int v27 = (v6_W3 == 2);
  v_1_X3_2 = v27;
  int v28 = (v14_W8 == 1);
  v_1_X8_1 = v28;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;
  v_1_X3_2 = 0;
  v_1_X8_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v15 = vars[0];
  int v16 = (v15 == 2);
  int v17 = vars[1];
  int v18 = (v17 == 2);
  int v19 = v_1_X0_1;
  int v20 = v_1_X3_2;
  int v21 = v_1_X8_1;
  int v22_conj = v20 & v21;
  int v23_conj = v19 & v22_conj;
  int v24_conj = v18 & v23_conj;
  int v25_conj = v16 & v24_conj;
  if (v25_conj == 1) assert(0);
  return 0;
}
