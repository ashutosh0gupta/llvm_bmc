/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[2]; 
volatile int v_0_X2_0; 
volatile int v_1_X2_1; 
volatile int v_1_X3_1; 
volatile int v_1_X6_1; 

void *t0(void *arg){
label_1:;
  vars[0] = 2;
  FENCE();
  int v3_W2 = vars[1];
  int v28 = (v3_W2 == 0);
  v_0_X2_0 = v28;
  return NULL;
}

void *t1(void *arg){
label_2:;
  vars[1] = 1;
  int v6_W2 = vars[1];
  int v9_W3 = vars[1];
  int v10_W4 = v9_W3 ^ v9_W3;
  int v11_W4 = v10_W4 + 1;
  vars[0] = v11_W4;
  int v14_W6 = vars[0];
  int v29 = (v6_W2 == 1);
  v_1_X2_1 = v29;
  int v30 = (v9_W3 == 1);
  v_1_X3_1 = v30;
  int v31 = (v14_W6 == 1);
  v_1_X6_1 = v31;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[1] = 0;
  vars[0] = 0;
  v_0_X2_0 = 0;
  v_1_X2_1 = 0;
  v_1_X3_1 = 0;
  v_1_X6_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v15 = vars[0];
  int v16 = (v15 == 2);
  int v17 = vars[1];
  int v18 = (v17 == 1);
  int v19 = v_0_X2_0;
  int v20 = v_1_X2_1;
  int v21 = v_1_X3_1;
  int v22 = v_1_X6_1;
  int v23_conj = v21 & v22;
  int v24_conj = v20 & v23_conj;
  int v25_conj = v19 & v24_conj;
  int v26_conj = v18 & v25_conj;
  int v27_conj = v16 & v26_conj;
  if (v27_conj == 1) assert(0);
  return 0;
}
