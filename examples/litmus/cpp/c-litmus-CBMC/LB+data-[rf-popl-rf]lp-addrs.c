/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[6]; 
volatile int v_0_X0_1; 
volatile int v_0_X4_1; 
volatile int v_1_X0_1; 
volatile int v_2_X0_1; 
volatile int v_2_X4_1; 
volatile int v_3_X0_1; 

void *t0(void *arg){
label_1:;
  int v3_W0 = vars[0];
  int v4_W2 = v3_W0 ^ v3_W0;
  int v5_W2 = v4_W2 + 1;
  vars[1] = v5_W2;
  int v8_W4 = vars[2];
  int v9_W6 = v8_W4 ^ v8_W4;
  vars[3+v9_W6] = 1;
  int v36 = (v3_W0 == 1);
  v_0_X0_1 = v36;
  int v37 = (v8_W4 == 1);
  v_0_X4_1 = v37;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v12_W0 = vars[1];
  FENCE();
  vars[2] = 1;
  int v38 = (v12_W0 == 1);
  v_1_X0_1 = v38;
  return NULL;
}

void *t2(void *arg){
label_3:;
  int v15_W0 = vars[3];
  int v16_W2 = v15_W0 ^ v15_W0;
  int v17_W2 = v16_W2 + 1;
  vars[4] = v17_W2;
  int v20_W4 = vars[5];
  int v21_W6 = v20_W4 ^ v20_W4;
  vars[0+v21_W6] = 1;
  int v39 = (v15_W0 == 1);
  v_2_X0_1 = v39;
  int v40 = (v20_W4 == 1);
  v_2_X4_1 = v40;
  return NULL;
}

void *t3(void *arg){
label_4:;
  int v24_W0 = vars[4];
  FENCE();
  vars[5] = 1;
  int v41 = (v24_W0 == 1);
  v_3_X0_1 = v41;
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
  v_1_X0_1 = 0;
  v_2_X0_1 = 0;
  v_2_X4_1 = 0;
  v_3_X0_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);
  pthread_create(&thr3, NULL, t3, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);

  int v25 = v_0_X0_1;
  int v26 = v_0_X4_1;
  int v27 = v_1_X0_1;
  int v28 = v_2_X0_1;
  int v29 = v_2_X4_1;
  int v30 = v_3_X0_1;
  int v31_conj = v29 & v30;
  int v32_conj = v28 & v31_conj;
  int v33_conj = v27 & v32_conj;
  int v34_conj = v26 & v33_conj;
  int v35_conj = v25 & v34_conj;
  if (v35_conj == 1) assert(0);
  return 0;
}
