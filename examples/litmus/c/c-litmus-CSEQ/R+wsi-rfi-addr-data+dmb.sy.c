/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[3]; 
volatile int v_0_X3_2; 
volatile int v_1_X2_0; 

void *t0(void *arg){
label_1:;
  vars[0] = 1;
  vars[0] = 2;
  int v3_W3 = vars[0];
  int v4_W4 = v3_W3 ^ v3_W3;
  int v7_W5 = vars[1+v4_W4];
  int v8_W7 = v7_W5 ^ v7_W5;
  int v9_W7 = v8_W7 + 1;
  vars[2] = v9_W7;
  int v22 = (v3_W3 == 2);
  v_0_X3_2 = v22;
  return NULL;
}

void *t1(void *arg){
label_2:;
  vars[2] = 2;
  FENCE();
  int v12_W2 = vars[0];
  int v23 = (v12_W2 == 0);
  v_1_X2_0 = v23;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_0_X3_2 = 0;
  v_1_X2_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v13 = vars[0];
  int v14 = (v13 == 2);
  int v15 = vars[2];
  int v16 = (v15 == 2);
  int v17 = v_0_X3_2;
  int v18 = v_1_X2_0;
  int v19_conj = v17 & v18;
  int v20_conj = v16 & v19_conj;
  int v21_conj = v14 & v20_conj;
  if (v21_conj == 1) assert(0);
  return 0;
}
