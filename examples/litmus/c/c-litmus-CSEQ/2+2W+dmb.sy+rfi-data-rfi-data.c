/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[3]; 
volatile int v_1_X2_2; 
volatile int v_1_X5_1; 

void *t0(void *arg){
label_1:;
  vars[0] = 2;
  FENCE();
  vars[1] = 1;
  return NULL;
}

void *t1(void *arg){
label_2:;
  vars[1] = 2;
  int v3_W2 = vars[1];
  int v4_W3 = v3_W2 ^ v3_W2;
  int v5_W3 = v4_W3 + 1;
  vars[2] = v5_W3;
  int v8_W5 = vars[2];
  int v9_W6 = v8_W5 ^ v8_W5;
  int v10_W6 = v9_W6 + 1;
  vars[0] = v10_W6;
  int v23 = (v3_W2 == 2);
  v_1_X2_2 = v23;
  int v24 = (v8_W5 == 1);
  v_1_X5_1 = v24;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X2_2 = 0;
  v_1_X5_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v11 = vars[0];
  int v12 = (v11 == 2);
  int v13 = vars[1];
  int v14 = (v13 == 2);
  int v15 = vars[2];
  int v16 = (v15 == 1);
  int v17 = v_1_X2_2;
  int v18 = v_1_X5_1;
  int v19_conj = v17 & v18;
  int v20_conj = v16 & v19_conj;
  int v21_conj = v14 & v20_conj;
  int v22_conj = v12 & v21_conj;
  if (v22_conj == 1) assert(0);
  return 0;
}
