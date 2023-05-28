/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[3]; 
volatile int v_1_X0_1; 
volatile int v_1_X2_1; 
volatile int v_1_X5_1; 
volatile int v_1_X6_0; 
volatile int v_1_X8_1; 

void *t0(void *arg){
label_1:;
  vars[0] = 2;
  FENCE();
  vars[1] = 1;
  return NULL;
}

void *t1(void *arg){
label_2:;
  int v3_W0 = vars[1];
  int v6_W2 = vars[1];
  int v7_W3 = v6_W2 ^ v6_W2;
  int v8_W3 = v7_W3 + 1;
  vars[2] = v8_W3;
  int v11_W5 = vars[2];
  if (v11_W5) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  int v14_W6 = vars[0];
  int v17_W8 = vars[0];
  int v36 = (v3_W0 == 1);
  v_1_X0_1 = v36;
  int v37 = (v6_W2 == 1);
  v_1_X2_1 = v37;
  int v38 = (v11_W5 == 1);
  v_1_X5_1 = v38;
  int v39 = (v14_W6 == 0);
  v_1_X6_0 = v39;
  int v40 = (v17_W8 == 1);
  v_1_X8_1 = v40;
  return NULL;
}

void *t2(void *arg){
label_3:;
  vars[0] = 1;
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
  v_1_X5_1 = 0;
  v_1_X6_0 = 0;
  v_1_X8_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v18 = vars[0];
  int v19 = (v18 == 2);
  int v20 = vars[1];
  int v21 = (v20 == 1);
  int v22 = vars[2];
  int v23 = (v22 == 1);
  int v24 = v_1_X0_1;
  int v25 = v_1_X2_1;
  int v26 = v_1_X5_1;
  int v27 = v_1_X6_0;
  int v28 = v_1_X8_1;
  int v29_conj = v27 & v28;
  int v30_conj = v26 & v29_conj;
  int v31_conj = v25 & v30_conj;
  int v32_conj = v24 & v31_conj;
  int v33_conj = v23 & v32_conj;
  int v34_conj = v21 & v33_conj;
  int v35_conj = v19 & v34_conj;
  if (v35_conj == 1) assert(0);
  return 0;
}
