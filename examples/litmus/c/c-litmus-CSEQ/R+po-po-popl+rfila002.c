/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[3]; 
volatile int v_0_X7_2; 
volatile int v_1_X3_3; 
volatile int v_1_X2_2; 

void *t0(void *arg){
label_1:;
  vars[0] = 3;
  int v3_W2 = vars[1];
  int v6_W4 = vars[2];
  FENCE();
  vars[0] = 1;
  int v9_W7 = vars[0];
  int v24 = (v9_W7 == 2);
  v_0_X7_2 = v24;
  return NULL;
}

void *t1(void *arg){
label_2:;
  FENCE();
  vars[0] = 2;
  FENCE();
  int v12_W2 = vars[0];
  int v15_W3 = vars[0];
  int v25 = (v15_W3 == 3);
  v_1_X3_3 = v25;
  int v26 = (v12_W2 == 2);
  v_1_X2_2 = v26;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_0_X7_2 = 0;
  v_1_X3_3 = 0;
  v_1_X2_2 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v16 = vars[0];
  int v17 = (v16 == 3);
  int v18 = v_0_X7_2;
  int v19 = v_1_X3_3;
  int v20 = v_1_X2_2;
  int v21_conj = v19 & v20;
  int v22_conj = v18 & v21_conj;
  int v23_conj = v17 & v22_conj;
  if (v23_conj == 1) assert(0);
  return 0;
}
