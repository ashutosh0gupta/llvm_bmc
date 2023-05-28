/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[2]; 
volatile int v_1_X0_1; 
volatile int v_1_X2_1; 
volatile int v_1_X3_2; 
volatile int v_1_X7_1; 

void *t0(void *arg){
label_1:;
  vars[0] = 2;
  FENCE();
  vars[1] = 1;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = vars[1];
  int v6_W2 = vars[1];
  int v9_W3 = vars[1];
  int v10_W4 = v9_W3 ^ v9_W3;
  vars[0+v10_W4] = 1;
  int v13_W7 = vars[0];
  int v27 = (v3_W0 == 1);
  v_1_X0_1 = v27;
  int v28 = (v6_W2 == 1);
  v_1_X2_1 = v28;
  int v29 = (v9_W3 == 2);
  v_1_X3_2 = v29;
  int v30 = (v13_W7 == 1);
  v_1_X7_1 = v30;
  return NULL;
}

void *t2(void *arg){
label_3:;
  vars[1] = 2;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;
  v_1_X2_1 = 0;
  v_1_X3_2 = 0;
  v_1_X7_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v14 = vars[0];
  int v15 = (v14 == 2);
  int v16 = vars[1];
  int v17 = (v16 == 2);
  int v18 = v_1_X0_1;
  int v19 = v_1_X2_1;
  int v20 = v_1_X3_2;
  int v21 = v_1_X7_1;
  int v22_conj = v20 & v21;
  int v23_conj = v19 & v22_conj;
  int v24_conj = v18 & v23_conj;
  int v25_conj = v17 & v24_conj;
  int v26_conj = v15 & v25_conj;
  if (v26_conj == 1) assert(0);
  return 0;
}
