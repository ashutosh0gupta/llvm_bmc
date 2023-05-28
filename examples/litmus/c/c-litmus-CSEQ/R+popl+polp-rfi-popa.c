/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[3]; 
volatile int v_0_X4_2; 
volatile int v_1_X4_1; 
volatile int v_1_X5_0; 

void *t0(void *arg){
label_1:;
  vars[0] = 1;
  FENCE();
  vars[1] = 1;
  int v3_W4 = vars[1];
  int v24 = (v3_W4 == 2);
  v_0_X4_2 = v24;
  return NULL;
}

void *t1(void *arg){
label_2:;
  FENCE();
  vars[1] = 2;
  vars[2] = 1;
  int v6_W4 = vars[2];
  FENCE();
  int v9_W5 = vars[0];
  int v25 = (v6_W4 == 1);
  v_1_X4_1 = v25;
  int v26 = (v9_W5 == 0);
  v_1_X5_0 = v26;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_0_X4_2 = 0;
  v_1_X4_1 = 0;
  v_1_X5_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v10 = vars[0];
  int v11 = (v10 == 1);
  int v12 = vars[1];
  int v13 = (v12 == 2);
  int v14 = vars[2];
  int v15 = (v14 == 1);
  int v16 = v_0_X4_2;
  int v17 = v_1_X4_1;
  int v18 = v_1_X5_0;
  int v19_conj = v17 & v18;
  int v20_conj = v16 & v19_conj;
  int v21_conj = v15 & v20_conj;
  int v22_conj = v13 & v21_conj;
  int v23_conj = v11 & v22_conj;
  if (v23_conj == 1) assert(0);
  return 0;
}
