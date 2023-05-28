/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[5]; 
volatile int v_1_X0_1; 
volatile int v_1_X4_1; 
volatile int v_1_X10_0; 

void *t0(void *arg){
label_1:;
  vars[0] = 1;
  FENCE();
  vars[1] = 1;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = vars[1];
  if (v3_W0) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  vars[2] = 1;
  int v6_W4 = vars[2];
  int v7_W5 = v6_W4 ^ v6_W4;
  int v10_W6 = vars[3+v7_W5];
  if (v10_W6) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  int v13_W8 = vars[4];
  if (v13_W8) goto lbl_LC02; else goto lbl_LC02;
lbl_LC02:;
  FENCE();
  int v16_W10 = vars[0];
  int v31 = (v3_W0 == 1);
  v_1_X0_1 = v31;
  int v32 = (v6_W4 == 1);
  v_1_X4_1 = v32;
  int v33 = (v16_W10 == 0);
  v_1_X10_0 = v33;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[4] = 0;
  vars[3] = 0;
  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;
  v_1_X4_1 = 0;
  v_1_X10_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v17 = vars[0];
  int v18 = (v17 == 1);
  int v19 = vars[1];
  int v20 = (v19 == 1);
  int v21 = vars[2];
  int v22 = (v21 == 1);
  int v23 = v_1_X0_1;
  int v24 = v_1_X4_1;
  int v25 = v_1_X10_0;
  int v26_conj = v24 & v25;
  int v27_conj = v23 & v26_conj;
  int v28_conj = v22 & v27_conj;
  int v29_conj = v20 & v28_conj;
  int v30_conj = v18 & v29_conj;
  if (v30_conj == 1) assert(0);
  return 0;
}
