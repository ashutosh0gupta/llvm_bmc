/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[3]; 
volatile int v_1_X2_2; 

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
  if (v3_W2) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v6_W3 = vars[2];
  int v7_W5 = v6_W3 ^ v6_W3;
  int v8_W5 = v7_W5 + 1;
  vars[0] = v8_W5;
  int v16 = (v3_W2 == 2);
  v_1_X2_2 = v16;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X2_2 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v9 = vars[0];
  int v10 = (v9 == 2);
  int v11 = vars[1];
  int v12 = (v11 == 2);
  int v13 = v_1_X2_2;
  int v14_conj = v12 & v13;
  int v15_conj = v10 & v14_conj;
  if (v15_conj == 1) assert(0);
  return 0;
}
