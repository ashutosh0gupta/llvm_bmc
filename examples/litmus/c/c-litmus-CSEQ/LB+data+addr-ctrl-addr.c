/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[4]; 
volatile int v_0_X0_1; 
volatile int v_1_X0_1; 

void *t0(void *arg){
label_1:;
  int v3_W0 = vars[0];
  int v4_W2 = v3_W0 ^ v3_W0;
  int v5_W2 = v4_W2 + 1;
  vars[1] = v5_W2;
  int v26 = (v3_W0 == 1);
  v_0_X0_1 = v26;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v8_W0 = vars[1];
  int v9_W2 = v8_W0 ^ v8_W0;
  int v12_W3 = vars[2+v9_W2];
  if (v12_W3) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v15_W5 = vars[3];
  int v16_W7 = v15_W5 ^ v15_W5;
  vars[0+v16_W7] = 1;
  int v27 = (v8_W0 == 1);
  v_1_X0_1 = v27;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[3] = 0;
  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_0_X0_1 = 0;
  v_1_X0_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v17 = vars[0];
  int v18 = (v17 == 1);
  int v19 = vars[1];
  int v20 = (v19 == 1);
  int v21 = v_0_X0_1;
  int v22 = v_1_X0_1;
  int v23_conj = v21 & v22;
  int v24_conj = v20 & v23_conj;
  int v25_conj = v18 & v24_conj;
  if (v25_conj == 1) assert(0);
  return 0;
}
