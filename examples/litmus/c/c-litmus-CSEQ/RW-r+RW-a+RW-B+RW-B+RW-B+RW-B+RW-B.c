/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[7]; 
volatile int v_0_X0_1; 
volatile int v_1_X0_1; 
volatile int v_2_X0_1; 
volatile int v_3_X0_1; 
volatile int v_4_X0_1; 
volatile int v_5_X0_1; 
volatile int v_6_X0_1; 

void *t0(void *arg){
label_1:;
  int v3_W0 = vars[1];
  FENCE();
  vars[0] = 1;
  int v35 = (v3_W0 == 1);
  v_0_X0_1 = v35;
  return NULL;
}

void *t1(void *arg){
label_2:;
  FENCE();
  int v6_W0 = vars[0];
  vars[2] = 1;
  int v36 = (v6_W0 == 1);
  v_1_X0_1 = v36;
  return NULL;
}

void *t2(void *arg){
label_3:;
  int v9_W0 = vars[2];
  FENCE();
  vars[3] = 1;
  int v37 = (v9_W0 == 1);
  v_2_X0_1 = v37;
  return NULL;
}

void *t3(void *arg){
label_4:;
  int v12_W0 = vars[3];
  FENCE();
  vars[4] = 1;
  int v38 = (v12_W0 == 1);
  v_3_X0_1 = v38;
  return NULL;
}

void *t4(void *arg){
label_5:;
  int v15_W0 = vars[4];
  FENCE();
  vars[5] = 1;
  int v39 = (v15_W0 == 1);
  v_4_X0_1 = v39;
  return NULL;
}

void *t5(void *arg){
label_6:;
  int v18_W0 = vars[5];
  FENCE();
  vars[6] = 1;
  int v40 = (v18_W0 == 1);
  v_5_X0_1 = v40;
  return NULL;
}

void *t6(void *arg){
label_7:;
  int v21_W0 = vars[6];
  FENCE();
  vars[1] = 1;
  int v41 = (v21_W0 == 1);
  v_6_X0_1 = v41;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 
  pthread_t thr3; 
  pthread_t thr4; 
  pthread_t thr5; 
  pthread_t thr6; 

  vars[6] = 0;
  vars[5] = 0;
  vars[4] = 0;
  vars[3] = 0;
  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_0_X0_1 = 0;
  v_1_X0_1 = 0;
  v_2_X0_1 = 0;
  v_3_X0_1 = 0;
  v_4_X0_1 = 0;
  v_5_X0_1 = 0;
  v_6_X0_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);
  pthread_create(&thr3, NULL, t3, NULL);
  pthread_create(&thr4, NULL, t4, NULL);
  pthread_create(&thr5, NULL, t5, NULL);
  pthread_create(&thr6, NULL, t6, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);
  pthread_join(thr3, NULL);
  pthread_join(thr4, NULL);
  pthread_join(thr5, NULL);
  pthread_join(thr6, NULL);

  int v22 = v_0_X0_1;
  int v23 = v_1_X0_1;
  int v24 = v_2_X0_1;
  int v25 = v_3_X0_1;
  int v26 = v_4_X0_1;
  int v27 = v_5_X0_1;
  int v28 = v_6_X0_1;
  int v29_conj = v27 & v28;
  int v30_conj = v26 & v29_conj;
  int v31_conj = v25 & v30_conj;
  int v32_conj = v24 & v31_conj;
  int v33_conj = v23 & v32_conj;
  int v34_conj = v22 & v33_conj;
  if (v34_conj == 1) assert(0);
  return 0;
}
