/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[2]; 
volatile int v_1_X0_2; 
volatile int v_2_X0_1; 

void *t0(void *arg){
label_1:;
  FENCE();
  vars[0] = 2;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = vars[0];
  int v4_cmpeq = (v3_W0 == 0);
  if (v4_cmpeq)  goto lbl_label204; else goto lbl_label204;
lbl_label204:;
  vars[1] = 1;
  int v15 = (v3_W0 == 2);
  v_1_X0_2 = v15;
  return NULL;
}

void *t2(void *arg){
label_3:;
  int v7_W0 = vars[1];
  int v8_cmpeq = (v7_W0 == 0);
  if (v8_cmpeq)  goto lbl_label205; else goto lbl_label205;
lbl_label205:;
  vars[0] = 1;
  int v16 = (v7_W0 == 1);
  v_2_X0_1 = v16;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_2 = 0;
  v_2_X0_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v9 = vars[0];
  int v10 = (v9 == 2);
  int v11 = v_1_X0_2;
  int v12 = v_2_X0_1;
  int v13_conj = v11 & v12;
  int v14_conj = v10 & v13_conj;
  if (v14_conj == 1) assert(0);
  return 0;
}
