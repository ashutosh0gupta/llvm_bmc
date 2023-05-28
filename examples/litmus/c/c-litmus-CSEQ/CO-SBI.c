/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <assert.h>
#include <pthread.h>

// Memory barriers
#define FENCE()

volatile int vars[1]; 
volatile int v_1_X3_2; 
volatile int v_1_X2_2; 
volatile int v_0_X3_2; 
volatile int v_0_X2_2; 
volatile int v_0_X2_1; 
volatile int v_0_X3_1; 
volatile int v_1_X3_1; 
volatile int v_1_X2_1; 

void *t0(void *arg){
label_1:;
  vars[0] = 1;
  int v3_W2 = vars[0];
  int v6_W3 = vars[0];
  int v48 = (v6_W3 == 2);
  v_0_X3_2 = v48;
  int v49 = (v3_W2 == 2);
  v_0_X2_2 = v49;
  int v50 = (v3_W2 == 1);
  v_0_X2_1 = v50;
  int v51 = (v6_W3 == 1);
  v_0_X3_1 = v51;
  return NULL;
}

void *t1(void *arg){
label_2:;
  vars[0] = 2;
  int v9_W2 = vars[0];
  int v12_W3 = vars[0];
  int v46 = (v12_W3 == 2);
  v_1_X3_2 = v46;
  int v47 = (v9_W2 == 2);
  v_1_X2_2 = v47;
  int v52 = (v12_W3 == 1);
  v_1_X3_1 = v52;
  int v53 = (v9_W2 == 1);
  v_1_X2_1 = v53;
  return NULL;
}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 

  vars[0] = 0;
  v_1_X3_2 = 0;
  v_1_X2_2 = 0;
  v_0_X3_2 = 0;
  v_0_X2_2 = 0;
  v_0_X2_1 = 0;
  v_0_X3_1 = 0;
  v_1_X3_1 = 0;
  v_1_X2_1 = 0;

  pthread_create(&thr0, NULL, t0, NULL);
  pthread_create(&thr1, NULL, t1, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);

  int v13 = vars[0];
  int v14 = (v13 == 2);
  int v15 = v_1_X3_2;
  int v16 = v_1_X2_2;
  int v17 = v_0_X3_2;
  int v18 = v_0_X2_2;
  int v19 = v_0_X2_1;
  int v20_disj = v18 | v19;
  int v21_conj = v17 & v20_disj;
  int v22 = v_0_X3_1;
  int v23 = v_0_X2_1;
  int v24_conj = v22 & v23;
  int v25_disj = v21_conj | v24_conj;
  int v26_conj = v16 & v25_disj;
  int v27_conj = v15 & v26_conj;
  int v28_conj = v14 & v27_conj;
  int v29 = vars[0];
  int v30 = (v29 == 1);
  int v31 = v_0_X3_1;
  int v32 = v_0_X2_1;
  int v33 = v_1_X3_2;
  int v34 = v_1_X2_2;
  int v35_conj = v33 & v34;
  int v36 = v_1_X3_1;
  int v37 = v_1_X2_2;
  int v38 = v_1_X2_1;
  int v39_disj = v37 | v38;
  int v40_conj = v36 & v39_disj;
  int v41_disj = v35_conj | v40_conj;
  int v42_conj = v32 & v41_disj;
  int v43_conj = v31 & v42_conj;
  int v44_conj = v30 & v43_conj;
  int v45_disj = v28_conj | v44_conj;
  if (v45_disj == 0) assert(0);
  return 0;
}
