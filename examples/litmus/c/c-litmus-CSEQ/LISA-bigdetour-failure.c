/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[4]; 
volatile int v_1_X0_1; 
volatile int v_1_X3_0; 
volatile int v_1_X5_1; 
volatile int v_1_X8_0; 
volatile int v_3_X0_1; 

void *t0(void *arg){
label_1:;
  vars[1] = 1;
  FENCE();
  vars[0] = 1;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = vars[0];
  int v4_W2 = v3_W0 & 8;
  int v7_W3 = vars[3+v4_W2];
  int v10_W5 = vars[2];
  int v11_W7 = v10_W5 & 8;
  int v14_W8 = vars[1+v11_W7];
  int v27 = (v3_W0 == 1);
  v_1_X0_1 = v27;
  int v28 = (v7_W3 == 0);
  v_1_X3_0 = v28;
  int v29 = (v10_W5 == 1);
  v_1_X5_1 = v29;
  int v30 = (v14_W8 == 0);
  v_1_X8_0 = v30;
  return NULL;
}

void *t2(void *arg){
label_3:;
  vars[3] = 1;
  return NULL;
}

void *t3(void *arg){
label_4:;
  int v17_W0 = vars[3];
  FENCE();
  vars[2] = 1;
  int v31 = (v17_W0 == 1);
  v_3_X0_1 = v31;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 
  pthread_t thr3; 

  vars[3] = 0;
  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;
  v_1_X3_0 = 0;
  v_1_X5_1 = 0;
  v_1_X8_0 = 0;
  v_3_X0_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);
  pthread_create(&thr3, NULL, t3, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);

  int v18 = v_1_X0_1;
  int v19 = v_1_X3_0;
  int v20 = v_1_X5_1;
  int v21 = v_1_X8_0;
  int v22 = v_3_X0_1;
  int v23_conj = v21 & v22;
  int v24_conj = v20 & v23_conj;
  int v25_conj = v19 & v24_conj;
  int v26_conj = v18 & v25_conj;
  if (v26_conj == 1) assert(0);
  return 0;
}
