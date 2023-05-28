/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE() asm volatile ("mfence" ::: "memory")

volatile int vars[5]; 
volatile int v_1_X0_1; 
volatile int v_2_X0_1; 
volatile int v_3_X0_1; 
volatile int v_4_X0_1; 

void *t0(void *arg){
label_1:;
  vars[1] = 3;
  FENCE();
  vars[0] = 1;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = vars[0];
  FENCE();
  vars[2] = 1;
  int v23 = (v3_W0 == 1);
  v_1_X0_1 = v23;
  return NULL;
}

void *t2(void *arg){
label_3:;
  int v6_W0 = vars[2];
  FENCE();
  vars[3] = 1;
  int v24 = (v6_W0 == 1);
  v_2_X0_1 = v24;
  return NULL;
}

void *t3(void *arg){
label_4:;
  int v9_W0 = vars[3];
  FENCE();
  vars[4] = 1;
  int v25 = (v9_W0 == 1);
  v_3_X0_1 = v25;
  return NULL;
}

void *t4(void *arg){
label_5:;
  int v12_W0 = vars[4];
  FENCE();
  vars[1] = 1;
  int v26 = (v12_W0 == 1);
  v_4_X0_1 = v26;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 
  pthread_t thr3; 
  pthread_t thr4; 

  vars[4] = 0;
  vars[3] = 0;
  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;
  v_2_X0_1 = 0;
  v_3_X0_1 = 0;
  v_4_X0_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);
  pthread_create(&thr3, NULL, t3, NULL);
  pthread_create(&thr4, NULL, t4, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);
  pthread_join(thr4, NULL);

  int v13 = vars[1];
  int v14 = (v13 == 3);
  int v15 = v_1_X0_1;
  int v16 = v_2_X0_1;
  int v17 = v_3_X0_1;
  int v18 = v_4_X0_1;
  int v19_conj = v17 & v18;
  int v20_conj = v16 & v19_conj;
  int v21_conj = v15 & v20_conj;
  int v22_conj = v14 & v21_conj;
  if (v22_conj == 1) assert(0);
  return 0;
}
