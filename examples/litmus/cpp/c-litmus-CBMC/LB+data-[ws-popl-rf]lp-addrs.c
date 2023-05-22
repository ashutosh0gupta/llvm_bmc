/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[6]; 
volatile int v_0_X0_1; 
volatile int v_0_X4_1; 
volatile int v_2_X0_1; 
volatile int v_2_X4_1; 

void *t0(void *arg){
label_1:;
  int v3_W0 = vars[0];
  int v4_W2 = v3_W0 ^ v3_W0;
  int v5_W2 = v4_W2 + 1;
  vars[1] = v5_W2;
  int v8_W4 = vars[2];
  int v9_W6 = v8_W4 ^ v8_W4;
  vars[3+v9_W6] = 1;
  int v32 = (v3_W0 == 1);
  v_0_X0_1 = v32;
  int v33 = (v8_W4 == 1);
  v_0_X4_1 = v33;
  return NULL;
}

void *t1(void *arg){
label_2:;
  vars[1] = 2;
  FENCE();
  vars[2] = 1;
  return NULL;
}

void *t2(void *arg){
label_3:;
  int v12_W0 = vars[3];
  int v13_W2 = v12_W0 ^ v12_W0;
  int v14_W2 = v13_W2 + 1;
  vars[4] = v14_W2;
  int v17_W4 = vars[5];
  int v18_W6 = v17_W4 ^ v17_W4;
  vars[0+v18_W6] = 1;
  int v34 = (v12_W0 == 1);
  v_2_X0_1 = v34;
  int v35 = (v17_W4 == 1);
  v_2_X4_1 = v35;
  return NULL;
}

void *t3(void *arg){
label_4:;
  vars[4] = 2;
  FENCE();
  vars[5] = 1;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 
  pthread_t thr3; 

  vars[5] = 0;
  vars[4] = 0;
  vars[3] = 0;
  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_0_X0_1 = 0;
  v_0_X4_1 = 0;
  v_2_X0_1 = 0;
  v_2_X4_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);
  pthread_create(&thr3, NULL, t3, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);

  int v19 = vars[4];
  int v20 = (v19 == 2);
  int v21 = vars[1];
  int v22 = (v21 == 2);
  int v23 = v_0_X0_1;
  int v24 = v_0_X4_1;
  int v25 = v_2_X0_1;
  int v26 = v_2_X4_1;
  int v27_conj = v25 & v26;
  int v28_conj = v24 & v27_conj;
  int v29_conj = v23 & v28_conj;
  int v30_conj = v22 & v29_conj;
  int v31_conj = v20 & v30_conj;
  if (v31_conj == 1) assert(0);
  return 0;
}
