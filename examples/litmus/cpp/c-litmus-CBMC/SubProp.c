/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[4]; 
volatile int v_1_X5_1; 
volatile int v_2_X4_2; 
volatile int v_2_X5_1; 
volatile int v_2_X6_0; 

void *t0(void *arg){
label_1:;
  vars[0] = 0;
  FENCE();
  vars[1] = 0;
  FENCE();
  vars[2] = 0;
  return NULL;
}

void *t1(void *arg){
label_2:;
  FENCE();
  vars[1] = 0;
  int v3_W5 = vars[2];
  int v4_W7 = v3_W5 ^ v3_W5;
  vars[3+v4_W7] = 0;
  int v26 = (v3_W5 == 1);
  v_1_X5_1 = v26;
  return NULL;
}

void *t2(void *arg){
label_3:;
  int v7_W4 = vars[1];
  int v8_W7 = v7_W4 ^ v7_W4;
  int v11_W5 = vars[3+v8_W7];
  int v12_W8 = v11_W5 ^ v11_W5;
  int v15_W6 = vars[0+v12_W8];
  int v27 = (v7_W4 == 2);
  v_2_X4_2 = v27;
  int v28 = (v11_W5 == 1);
  v_2_X5_1 = v28;
  int v29 = (v15_W6 == 0);
  v_2_X6_0 = v29;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  vars[3] = 0;
  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X5_1 = 0;
  v_2_X4_2 = 0;
  v_2_X5_1 = 0;
  v_2_X6_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v16 = vars[1];
  int v17 = (v16 == 2);
  int v18 = v_1_X5_1;
  int v19 = v_2_X4_2;
  int v20 = v_2_X5_1;
  int v21 = v_2_X6_0;
  int v22_conj = v20 & v21;
  int v23_conj = v19 & v22_conj;
  int v24_conj = v18 & v23_conj;
  int v25_conj = v17 & v24_conj;
  if (v25_conj == 1) assert(0);
  return 0;
}
