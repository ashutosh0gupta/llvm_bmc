/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[4]; 
volatile int v_1_X0_1; 
volatile int v_1_X4_1; 
volatile int v_1_X5_0; 
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
  if (v3_W0) goto lbl_LC00; else goto lbl_LC00;
lbl_LC00:;
  vars[2] = 1;
  int v6_W4 = vars[2];
  if (v6_W4) goto lbl_LC01; else goto lbl_LC01;
lbl_LC01:;
  int v9_W5 = vars[3];
  int v12_W7 = vars[3];
  if (v12_W7) goto lbl_LC02; else goto lbl_LC02;
lbl_LC02:;
  int v15_W8 = vars[0];
  int v37 = (v3_W0 == 1);
  v_1_X0_1 = v37;
  int v38 = (v6_W4 == 1);
  v_1_X4_1 = v38;
  int v39 = (v9_W5 == 0);
  v_1_X5_0 = v39;
  int v40 = (v12_W7 == 1);
  v_1_X7_1 = v40;
  int v41 = (v15_W8 == 0);
  v_1_X8_0 = v41;
  return NULL;
}

void *t2(void *arg){
label_3:;
  vars[3] = 1;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  vars[3] = 0;
  vars[2] = 0;
  vars[1] = 0;
  vars[0] = 0;
  v_1_X0_1 = 0;
  v_1_X4_1 = 0;
  v_1_X5_0 = 0;
  v_1_X7_1 = 0;
  v_1_X8_0 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);
  pthread_create(&thr2, NULL, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v16 = vars[3];
  int v17 = (v16 == 1);
  int v18 = vars[0];
  int v19 = (v18 == 1);
  int v20 = vars[1];
  int v21 = (v20 == 1);
  int v22 = vars[2];
  int v23 = (v22 == 1);
  int v24 = v_1_X0_1;
  int v25 = v_1_X4_1;
  int v26 = v_1_X5_0;
  int v27 = v_1_X7_1;
  int v28 = v_1_X8_0;
  int v29_conj = v27 & v28;
  int v30_conj = v26 & v29_conj;
  int v31_conj = v25 & v30_conj;
  int v32_conj = v24 & v31_conj;
  int v33_conj = v23 & v32_conj;
  int v34_conj = v21 & v33_conj;
  int v35_conj = v19 & v34_conj;
  int v36_conj = v17 & v35_conj;
  if (v36_conj == 1) assert(0);
  return 0;
}
