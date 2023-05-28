/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[2]; 
volatile int v_0_X6_2; 
volatile int v_1_X3_3; 
volatile int v_1_X2_2; 

void *t0(void *arg){
label_1:;
  vars[0] = 3;
  vars[0] = 4;
  int v3_W3 = vars[1];
  if (v3_W3) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  FENCE();
  vars[0] = 1;
  int v6_W6 = vars[0];
  int v21 = (v6_W6 == 2);
  v_0_X6_2 = v21;
  return NULL;
}

void *t1(void *arg){
label_2:;
  FENCE();
  vars[0] = 2;
  FENCE();
  int v9_W2 = vars[0];
  int v12_W3 = vars[0];
  int v22 = (v12_W3 == 3);
  v_1_X3_3 = v22;
  int v23 = (v9_W2 == 2);
  v_1_X2_2 = v23;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[1] = 0;
  vars[0] = 0;
  v_0_X6_2 = 0;
  v_1_X3_3 = 0;
  v_1_X2_2 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v13 = vars[0];
  int v14 = (v13 == 4);
  int v15 = v_0_X6_2;
  int v16 = v_1_X3_3;
  int v17 = v_1_X2_2;
  int v18_conj = v16 & v17;
  int v19_conj = v15 & v18_conj;
  int v20_conj = v14 & v19_conj;
  if (v20_conj == 1) assert(0);
  return 0;
}
