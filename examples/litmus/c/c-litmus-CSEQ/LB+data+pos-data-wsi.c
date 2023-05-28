/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[2]; 
volatile int v_0_X0_2; 
volatile int v_1_X0_1; 
volatile int v_1_X2_1; 

void *t0(void *arg){
label_1:;
  int v3_W0 = vars[0];
  int v4_W2 = v3_W0 ^ v3_W0;
  int v5_W2 = v4_W2 + 1;
  vars[1] = v5_W2;
  int v25 = (v3_W0 == 2);
  v_0_X0_2 = v25;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v8_W0 = vars[1];
  int v11_W2 = vars[1];
  int v12_W3 = v11_W2 ^ v11_W2;
  int v13_W3 = v12_W3 + 1;
  vars[0] = v13_W3;
  vars[0] = 2;
  int v26 = (v8_W0 == 1);
  v_1_X0_1 = v26;
  int v27 = (v11_W2 == 1);
  v_1_X2_1 = v27;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[1] = 0;
  vars[0] = 0;
  v_0_X0_2 = 0;
  v_1_X0_1 = 0;
  v_1_X2_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v14 = vars[0];
  int v15 = (v14 == 2);
  int v16 = vars[1];
  int v17 = (v16 == 1);
  int v18 = v_0_X0_2;
  int v19 = v_1_X0_1;
  int v20 = v_1_X2_1;
  int v21_conj = v19 & v20;
  int v22_conj = v18 & v21_conj;
  int v23_conj = v17 & v22_conj;
  int v24_conj = v15 & v23_conj;
  if (v24_conj == 1) assert(0);
  return 0;
}
