/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[2]; 
volatile int v_0_X5_3; 
volatile int v_1_X2_3; 
volatile int v_1_X3_0; 

void *t0(void *arg){
label_1:;
  vars[0] = 1;
  vars[1] = 1;
  FENCE();
  vars[1] = 2;
  int v3_W5 = vars[1];
  int v21 = (v3_W5 == 3);
  v_0_X5_3 = v21;
  return NULL;
}

void *t1(void *arg){
label_2:;
  FENCE();
  vars[1] = 3;
  int v6_W2 = vars[1];
  if (v6_W2) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  FENCE();
  FENCE();
  int v9_W3 = vars[0];
  int v22 = (v6_W2 == 3);
  v_1_X2_3 = v22;
  int v23 = (v9_W3 == 0);
  v_1_X3_0 = v23;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[1] = 0;
  vars[0] = 0;
  v_0_X5_3 = 0;
  v_1_X2_3 = 0;
  v_1_X3_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v10 = vars[0];
  int v11 = (v10 == 1);
  int v12 = vars[1];
  int v13 = (v12 == 3);
  int v14 = v_0_X5_3;
  int v15 = v_1_X2_3;
  int v16 = v_1_X3_0;
  int v17_conj = v15 & v16;
  int v18_conj = v14 & v17_conj;
  int v19_conj = v13 & v18_conj;
  int v20_conj = v11 & v19_conj;
  if (v20_conj == 1) assert(0);
  return 0;
}
