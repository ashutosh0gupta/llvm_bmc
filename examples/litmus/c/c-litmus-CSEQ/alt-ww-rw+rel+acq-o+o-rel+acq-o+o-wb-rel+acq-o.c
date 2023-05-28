/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[5]; 
volatile int v_1_X0_1; 
volatile int v_3_X0_1; 
volatile int v_5_X0_1; 

void *t0(void *arg){
label_1:;
  FENCE();
  vars[0] = 1;
  return NULL;
}

void *t1(void *arg){
label_2:;
  FENCE();
  int v3_W0 = vars[0];
  vars[1] = 1;
  int v24 = (v3_W0 == 1);
  v_1_X0_1 = v24;
  return NULL;
}

void *t2(void *arg){
label_3:;
  vars[1] = 2;
  FENCE();
  vars[2] = 1;
  return NULL;
}

void *t3(void *arg){
label_4:;
  FENCE();
  int v6_W0 = vars[2];
  vars[3] = 1;
  int v25 = (v6_W0 == 1);
  v_3_X0_1 = v25;
  return NULL;
}

void *t4(void *arg){
label_5:;
  vars[3] = 2;
  FENCE();
  FENCE();
  vars[4] = 1;
  return NULL;
}

void *t5(void *arg){
label_6:;
  FENCE();
  int v9_W0 = vars[4];
  vars[0] = 2;
  int v26 = (v9_W0 == 1);
  v_5_X0_1 = v26;
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
  v_1_X0_1 = 0;
  v_3_X0_1 = 0;
  v_5_X0_1 = 0;

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

  int v10 = v_1_X0_1;
  int v11 = vars[1];
  int v12 = (v11 == 2);
  int v13 = v_3_X0_1;
  int v14 = vars[3];
  int v15 = (v14 == 2);
  int v16 = v_5_X0_1;
  int v17 = vars[0];
  int v18 = (v17 == 1);
  int v19_conj = v16 & v18;
  int v20_conj = v15 & v19_conj;
  int v21_conj = v13 & v20_conj;
  int v22_conj = v12 & v21_conj;
  int v23_conj = v10 & v22_conj;
  if (v23_conj == 1) assert(0);
  return 0;
}
