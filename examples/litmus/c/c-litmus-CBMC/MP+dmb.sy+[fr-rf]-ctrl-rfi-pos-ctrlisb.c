/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[3]; 
volatile int v_1_X0_1; 
volatile int v_1_X2_2; 
volatile int v_1_X5_1; 
volatile int v_1_X6_1; 
volatile int v_1_X7_0; 

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
  int v6_W2 = vars[1];
  if (v6_W2) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  vars[2] = 1;
  int v9_W5 = vars[2];
  int v12_W6 = vars[2];
  if (v12_W6) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  FENCE();
  int v15_W7 = vars[0];
  int v34 = (v3_W0 == 1);
  v_1_X0_1 = v34;
  int v35 = (v6_W2 == 2);
  v_1_X2_2 = v35;
  int v36 = (v9_W5 == 1);
  v_1_X5_1 = v36;
  int v37 = (v12_W6 == 1);
  v_1_X6_1 = v37;
  int v38 = (v15_W7 == 0);
  v_1_X7_0 = v38;
  return NULL;
}

void *t2(void *arg){
label_3:;
  vars[1] = 2;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;
  v_1_X2_2 = 0;
  v_1_X5_1 = 0;
  v_1_X6_1 = 0;
  v_1_X7_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v16 = vars[0];
  int v17 = (v16 == 1);
  int v18 = vars[1];
  int v19 = (v18 == 2);
  int v20 = vars[2];
  int v21 = (v20 == 1);
  int v22 = v_1_X0_1;
  int v23 = v_1_X2_2;
  int v24 = v_1_X5_1;
  int v25 = v_1_X6_1;
  int v26 = v_1_X7_0;
  int v27_conj = v25 & v26;
  int v28_conj = v24 & v27_conj;
  int v29_conj = v23 & v28_conj;
  int v30_conj = v22 & v29_conj;
  int v31_conj = v21 & v30_conj;
  int v32_conj = v19 & v31_conj;
  int v33_conj = v17 & v32_conj;
  if (v33_conj == 1) assert(0);
  return 0;
}
