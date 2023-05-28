/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[2]; 
volatile int v_0_X4_2; 
volatile int v_1_X6_2; 
volatile int v_1_X4_1; 
volatile int v_1_X5_1; 

void *t0(void *arg){
label_1:;
  vars[0] = 2;
  FENCE();
  vars[1] = 1;
  int v3_W4 = vars[1];
  int v26 = (v3_W4 == 2);
  v_0_X4_2 = v26;
  return NULL;
}

void *t1(void *arg){
label_2:;
  FENCE();
  vars[1] = 2;
  vars[0] = 1;
  int v6_W4 = vars[0];
  FENCE();
  int v9_W5 = vars[0];
  int v12_W6 = vars[0];
  int v27 = (v12_W6 == 2);
  v_1_X6_2 = v27;
  int v28 = (v6_W4 == 1);
  v_1_X4_1 = v28;
  int v29 = (v9_W5 == 1);
  v_1_X5_1 = v29;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[1] = 0;
  vars[0] = 0;
  v_0_X4_2 = 0;
  v_1_X6_2 = 0;
  v_1_X4_1 = 0;
  v_1_X5_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v13 = vars[0];
  int v14 = (v13 == 2);
  int v15 = vars[1];
  int v16 = (v15 == 2);
  int v17 = v_0_X4_2;
  int v18 = v_1_X6_2;
  int v19 = v_1_X4_1;
  int v20 = v_1_X5_1;
  int v21_conj = v19 & v20;
  int v22_conj = v18 & v21_conj;
  int v23_conj = v17 & v22_conj;
  int v24_conj = v16 & v23_conj;
  int v25_conj = v14 & v24_conj;
  if (v25_conj == 1) assert(0);
  return 0;
}
