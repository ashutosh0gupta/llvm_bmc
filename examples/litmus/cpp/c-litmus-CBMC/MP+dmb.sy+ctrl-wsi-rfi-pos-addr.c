/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[3]; 
volatile int v_1_X0_1; 
volatile int v_1_X5_2; 
volatile int v_1_X6_2; 
volatile int v_1_X8_0; 

void *t0(void *arg){
label_1:;
  vars[0] = 1;
  FENCE();
  vars[1] = 1;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = vars[1];
  if (v3_W0) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  vars[2] = 1;
  vars[2] = 2;
  int v6_W5 = vars[2];
  int v9_W6 = vars[2];
  int v10_W7 = v9_W6 ^ v9_W6;
  int v13_W8 = vars[0+v10_W7];
  int v30 = (v3_W0 == 1);
  v_1_X0_1 = v30;
  int v31 = (v6_W5 == 2);
  v_1_X5_2 = v31;
  int v32 = (v9_W6 == 2);
  v_1_X6_2 = v32;
  int v33 = (v13_W8 == 0);
  v_1_X8_0 = v33;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;
  v_1_X5_2 = 0;
  v_1_X6_2 = 0;
  v_1_X8_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v14 = vars[0];
  int v15 = (v14 == 1);
  int v16 = vars[1];
  int v17 = (v16 == 1);
  int v18 = vars[2];
  int v19 = (v18 == 2);
  int v20 = v_1_X0_1;
  int v21 = v_1_X5_2;
  int v22 = v_1_X6_2;
  int v23 = v_1_X8_0;
  int v24_conj = v22 & v23;
  int v25_conj = v21 & v24_conj;
  int v26_conj = v20 & v25_conj;
  int v27_conj = v19 & v26_conj;
  int v28_conj = v17 & v27_conj;
  int v29_conj = v15 & v28_conj;
  if (v29_conj == 1) assert(0);
  return 0;
}
