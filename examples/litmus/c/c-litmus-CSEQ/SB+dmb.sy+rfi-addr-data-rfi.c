/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[3]; 
volatile int v_0_X2_0; 
volatile int v_1_X2_1; 
volatile int v_1_X8_1; 

void *t0(void *arg){
label_1:;
  vars[0] = 2;
  FENCE();
  int v3_W2 = vars[1];
  int v27 = (v3_W2 == 0);
  v_0_X2_0 = v27;
  return NULL;
}

void *t1(void *arg){
label_2:;
  vars[1] = 1;
  int v6_W2 = vars[1];
  int v7_W3 = v6_W2 ^ v6_W2;
  int v10_W4 = vars[2+v7_W3];
  int v11_W6 = v10_W4 ^ v10_W4;
  int v12_W6 = v11_W6 + 1;
  vars[0] = v12_W6;
  int v15_W8 = vars[0];
  int v28 = (v6_W2 == 1);
  v_1_X2_1 = v28;
  int v29 = (v15_W8 == 1);
  v_1_X8_1 = v29;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_0_X2_0 = 0;
  v_1_X2_1 = 0;
  v_1_X8_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v16 = vars[0];
  int v17 = (v16 == 2);
  int v18 = vars[1];
  int v19 = (v18 == 1);
  int v20 = v_0_X2_0;
  int v21 = v_1_X2_1;
  int v22 = v_1_X8_1;
  int v23_conj = v21 & v22;
  int v24_conj = v20 & v23_conj;
  int v25_conj = v19 & v24_conj;
  int v26_conj = v17 & v25_conj;
  if (v26_conj == 1) assert(0);
  return 0;
}
