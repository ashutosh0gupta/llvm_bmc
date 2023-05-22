/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[3]; 
volatile int v_0_X6_2; 
volatile int v_1_X5_2; 
volatile int v_1_X4_1; 

void *t0(void *arg){
label_1:;
  vars[0] = 2;
  int v3_W2 = vars[1];
  if (v3_W2) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  FENCE();
  vars[2] = 1;
  int v6_W6 = vars[2];
  int v24 = (v6_W6 == 2);
  v_0_X6_2 = v24;
  return NULL;
}

void *t1(void *arg){
label_2:;
  FENCE();
  vars[2] = 2;
  vars[0] = 1;
  FENCE();
  int v9_W4 = vars[0];
  int v12_W5 = vars[0];
  int v25 = (v12_W5 == 2);
  v_1_X5_2 = v25;
  int v26 = (v9_W4 == 1);
  v_1_X4_1 = v26;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_0_X6_2 = 0;
  v_1_X5_2 = 0;
  v_1_X4_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v13 = vars[0];
  int v14 = (v13 == 2);
  int v15 = vars[2];
  int v16 = (v15 == 2);
  int v17 = v_0_X6_2;
  int v18 = v_1_X5_2;
  int v19 = v_1_X4_1;
  int v20_conj = v18 & v19;
  int v21_conj = v17 & v20_conj;
  int v22_conj = v16 & v21_conj;
  int v23_conj = v14 & v22_conj;
  if (v23_conj == 1) assert(0);
  return 0;
}
