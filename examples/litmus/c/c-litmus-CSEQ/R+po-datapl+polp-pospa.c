/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[3]; 
volatile int v_0_X6_2; 
volatile int v_1_X2_0; 
volatile int v_1_X4_0; 

void *t0(void *arg){
label_1:;
  vars[0] = 1;
  int v3_W2 = vars[1];
  int v4_W4 = v3_W2 ^ v3_W2;
  int v5_W4 = v4_W4 + 1;
  FENCE();
  vars[2] = v5_W4;
  int v8_W6 = vars[2];
  int v26 = (v8_W6 == 2);
  v_0_X6_2 = v26;
  return NULL;
}

void *t1(void *arg){
label_2:;
  FENCE();
  vars[2] = 2;
  int v11_W2 = vars[0];
  FENCE();
  int v14_W4 = vars[0];
  int v27 = (v11_W2 == 0);
  v_1_X2_0 = v27;
  int v28 = (v14_W4 == 0);
  v_1_X4_0 = v28;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_0_X6_2 = 0;
  v_1_X2_0 = 0;
  v_1_X4_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v15 = vars[0];
  int v16 = (v15 == 1);
  int v17 = vars[2];
  int v18 = (v17 == 2);
  int v19 = v_0_X6_2;
  int v20 = v_1_X2_0;
  int v21 = v_1_X4_0;
  int v22_conj = v20 & v21;
  int v23_conj = v19 & v22_conj;
  int v24_conj = v18 & v23_conj;
  int v25_conj = v16 & v24_conj;
  if (v25_conj == 1) assert(0);
  return 0;
}
