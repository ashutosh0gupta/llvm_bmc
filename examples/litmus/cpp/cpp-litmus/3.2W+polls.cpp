/* Copyright (C) 2023 ARM-CBMC
* This benchmark is part of ARM-CBMC */

#include <pthread.h>
#include <stdatomic.h>
#include <assert.h>

// Memory barriers
void dmbsy();
void dmbst();
void dmbld();
void isb();

atomic_int vars[3]; 

void *t0(void *arg){
label_1:;
  atomic_store_explicit(&vars[0], 2, memory_order_release);
  atomic_store_explicit(&vars[1], 1, memory_order_release);

}

void *t1(void *arg){
label_2:;
  atomic_store_explicit(&vars[1], 2, memory_order_release);
  atomic_store_explicit(&vars[2], 1, memory_order_release);

}

void *t2(void *arg){
label_3:;
  atomic_store_explicit(&vars[2], 2, memory_order_release);
  atomic_store_explicit(&vars[0], 1, memory_order_release);

}

int main(int argc, char *argv[]){
  pthread_t thr0; 
  pthread_t thr1; 
  pthread_t thr2; 

  atomic_init(&vars[2], 0);
  atomic_init(&vars[1], 0);
  atomic_init(&vars[0], 0);

  pthread_create(&thr0, t0, NULL);
  pthread_create(&thr1, t1, NULL);
  pthread_create(&thr2, t2, NULL);

  pthread_join(thr0, NULL);
  pthread_join(thr1, NULL);
  pthread_join(thr2, NULL);

  int v1 = atomic_load_explicit(&vars[0], memory_order_seq_cst);
  int v2 = (v1 == 2);
  int v3 = atomic_load_explicit(&vars[1], memory_order_seq_cst);
  int v4 = (v3 == 2);
  int v5 = atomic_load_explicit(&vars[2], memory_order_seq_cst);
  int v6 = (v5 == 2);
  int v7_conj = v4 & v6;
  int v8_conj = v2 & v7_conj;
  if (v8_conj == 1) assert(0);
  return 0;
}
