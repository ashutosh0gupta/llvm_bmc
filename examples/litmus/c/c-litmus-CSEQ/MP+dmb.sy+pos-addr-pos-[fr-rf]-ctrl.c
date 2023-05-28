/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[3]; 
volatile int v_1_X0_1; 
volatile int v_1_X2_1; 
volatile int v_1_X4_0; 
volatile int v_1_X6_0; 
volatile int v_1_X7_1; 
volatile int v_1_X8_0; 

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
  int v6_W2 = vars[1];
  int v7_W3 = v6_W2 ^ v6_W2;
  int v10_W4 = vars[2+v7_W3];
  int v13_W6 = vars[2];
  int v16_W7 = vars[2];
  if (v16_W7) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v19_W8 = vars[0];
  int v40 = (v3_W0 == 1);
  v_1_X0_1 = v40;
  int v41 = (v6_W2 == 1);
  v_1_X2_1 = v41;
  int v42 = (v10_W4 == 0);
  v_1_X4_0 = v42;
  int v43 = (v13_W6 == 0);
  v_1_X6_0 = v43;
  int v44 = (v16_W7 == 1);
  v_1_X7_1 = v44;
  int v45 = (v19_W8 == 0);
  v_1_X8_0 = v45;
  return NULL;
}

void *t2(void *arg){
label_3:;
  vars[2] = 1;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;
  v_1_X2_1 = 0;
  v_1_X4_0 = 0;
  v_1_X6_0 = 0;
  v_1_X7_1 = 0;
  v_1_X8_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v20 = vars[0];
  int v21 = (v20 == 1);
  int v22 = vars[1];
  int v23 = (v22 == 1);
  int v24 = vars[2];
  int v25 = (v24 == 1);
  int v26 = v_1_X0_1;
  int v27 = v_1_X2_1;
  int v28 = v_1_X4_0;
  int v29 = v_1_X6_0;
  int v30 = v_1_X7_1;
  int v31 = v_1_X8_0;
  int v32_conj = v30 & v31;
  int v33_conj = v29 & v32_conj;
  int v34_conj = v28 & v33_conj;
  int v35_conj = v27 & v34_conj;
  int v36_conj = v26 & v35_conj;
  int v37_conj = v25 & v36_conj;
  int v38_conj = v23 & v37_conj;
  int v39_conj = v21 & v38_conj;
  if (v39_conj == 1) assert(0);
  return 0;
}
