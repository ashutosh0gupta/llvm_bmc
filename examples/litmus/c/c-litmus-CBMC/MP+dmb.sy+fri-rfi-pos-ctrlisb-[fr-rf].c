/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[2]; 
volatile int v_1_X0_1; 
volatile int v_1_X3_2; 
volatile int v_1_X4_2; 
volatile int v_1_X5_0; 
volatile int v_1_X7_1; 

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
  int v9_W4 = vars[1];
  if (v9_W4) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  FENCE();
  int v12_W5 = vars[0];
  int v15_W7 = vars[0];
  int v31 = (v3_W0 == 1);
  v_1_X0_1 = v31;
  int v32 = (v6_W3 == 2);
  v_1_X3_2 = v32;
  int v33 = (v9_W4 == 2);
  v_1_X4_2 = v33;
  int v34 = (v12_W5 == 0);
  v_1_X5_0 = v34;
  int v35 = (v15_W7 == 1);
  v_1_X7_1 = v35;
  return NULL;
}

void *t2(void *arg){
label_3:;
  vars[0] = 1;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;
  v_1_X3_2 = 0;
  v_1_X4_2 = 0;
  v_1_X5_0 = 0;
  v_1_X7_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v16 = vars[0];
  int v17 = (v16 == 2);
  int v18 = vars[1];
  int v19 = (v18 == 2);
  int v20 = v_1_X0_1;
  int v21 = v_1_X3_2;
  int v22 = v_1_X4_2;
  int v23 = v_1_X5_0;
  int v24 = v_1_X7_1;
  int v25_conj = v23 & v24;
  int v26_conj = v22 & v25_conj;
  int v27_conj = v21 & v26_conj;
  int v28_conj = v20 & v27_conj;
  int v29_conj = v19 & v28_conj;
  int v30_conj = v17 & v29_conj;
  if (v30_conj == 1) assert(0);
  return 0;
}
