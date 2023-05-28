/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[5]; 
volatile int v_0_X0_1; 
volatile int v_4_X2_0; 
volatile int v_1_X0_1; 
volatile int v_2_X0_1; 
volatile int v_3_X0_1; 
volatile int v_4_X0_1; 

void *t0(void *arg){
label_1:;
  int v3_W0 = vars[1];
  FENCE();
  vars[0] = 1;
  int v30 = (v3_W0 == 1);
  v_0_X0_1 = v30;
  return NULL;
}

void *t1(void *arg){
label_2:;
  FENCE();
  int v6_W0 = vars[0];
  FENCE();
  vars[2] = 1;
  int v32 = (v6_W0 == 1);
  v_1_X0_1 = v32;
  return NULL;
}

void *t2(void *arg){
label_3:;
  FENCE();
  int v9_W0 = vars[2];
  FENCE();
  vars[3] = 1;
  int v33 = (v9_W0 == 1);
  v_2_X0_1 = v33;
  return NULL;
}

void *t3(void *arg){
label_4:;
  FENCE();
  int v12_W0 = vars[3];
  FENCE();
  vars[4] = 1;
  int v34 = (v12_W0 == 1);
  v_3_X0_1 = v34;
  return NULL;
}

void *t4(void *arg){
label_5:;
  FENCE();
  int v15_W0 = vars[4];
  int v18_W2 = vars[1];
  int v31 = (v18_W2 == 0);
  v_4_X2_0 = v31;
  int v35 = (v15_W0 == 1);
  v_4_X0_1 = v35;
  return NULL;
}

void *t5(void *arg){
label_6:;
  vars[1] = 1;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 
  pthread_t thr3; 
  pthread_t thr4; 
  pthread_t thr5; 

  vars[4] = 0;
  vars[3] = 0;
  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_0_X0_1 = 0;
  v_4_X2_0 = 0;
  v_1_X0_1 = 0;
  v_2_X0_1 = 0;
  v_3_X0_1 = 0;
  v_4_X0_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);
  pthread_create(&thr3, NULL, t3, NULL);
  pthread_create(&thr4, NULL, t4, NULL);
  pthread_create(&thr5, NULL, t5, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);
  pthread_join(thr4, NULL);
  pthread_join(thr5, NULL);

  int v19 = v_0_X0_1;
  int v20 = v_4_X2_0;
  int v21 = v_1_X0_1;
  int v22 = v_2_X0_1;
  int v23 = v_3_X0_1;
  int v24 = v_4_X0_1;
  int v25_conj = v23 & v24;
  int v26_conj = v22 & v25_conj;
  int v27_conj = v21 & v26_conj;
  int v28_conj = v20 & v27_conj;
  int v29_conj = v19 & v28_conj;
  if (v29_conj == 1) assert(0);
  return 0;
}
