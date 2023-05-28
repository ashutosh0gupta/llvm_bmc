/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[2]; 
volatile int v_0_X3_3; 
volatile int v_1_X2_3; 
volatile int v_1_X5_0; 

void *t0(void *arg){
label_1:;
  vars[0] = 1;
  FENCE();
  vars[0] = 2;
  int v3_W3 = vars[0];
  int v23 = (v3_W3 == 3);
  v_0_X3_3 = v23;
  return NULL;
}

void *t1(void *arg){
label_2:;
  FENCE();
  vars[0] = 3;
  int v6_W2 = vars[0];
  int v7_W3 = v6_W2 ^ v6_W2;
  int v8_W3 = v7_W3 + 1;
  vars[1] = v8_W3;
  FENCE();
  int v11_W5 = vars[0];
  int v24 = (v6_W2 == 3);
  v_1_X2_3 = v24;
  int v25 = (v11_W5 == 0);
  v_1_X5_0 = v25;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[1] = 0;
  vars[0] = 0;
  v_0_X3_3 = 0;
  v_1_X2_3 = 0;
  v_1_X5_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v12 = vars[0];
  int v13 = (v12 == 3);
  int v14 = vars[1];
  int v15 = (v14 == 1);
  int v16 = v_0_X3_3;
  int v17 = v_1_X2_3;
  int v18 = v_1_X5_0;
  int v19_conj = v17 & v18;
  int v20_conj = v16 & v19_conj;
  int v21_conj = v15 & v20_conj;
  int v22_conj = v13 & v21_conj;
  if (v22_conj == 1) assert(0);
  return 0;
}
