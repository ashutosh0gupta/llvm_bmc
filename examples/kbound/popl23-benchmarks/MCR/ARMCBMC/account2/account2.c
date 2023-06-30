/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Get inspiration from the Account example in Tables 1 and 2 in the PLDI 2015 paper:
 https://dl.acm.org/citation.cfm?id=2737975
 */

/* This benchmark is buggy in the sense that it is missing synchronization */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

#ifndef N
#  define N 2
#endif

#define INIT_MONEY 1000
#define ONE_DEPOSIT  100
#define ONE_WITHDRAW 10
#define N_DEPOSIT N
#define N_WITHDRAW 1

// shared variables
long amount;    	// A workaround

void * deposit(void *arg)
{
  int tmp = atomic_load_explicit(&amount, memory_order_relaxed);
  tmp = tmp + ONE_DEPOSIT;
  atomic_store_explicit(&amount, tmp, memory_order_relaxed);

  return NULL;
}

void * withdraw(void *arg)
{
  int tmp = atomic_load_explicit(&amount, memory_order_relaxed);
  tmp = tmp - ONE_WITHDRAW;
  atomic_store_explicit(&amount, tmp, memory_order_relaxed);

  return NULL;
}



int main(int argc, char *argv[])
{
  pthread_t deposits[N_DEPOSIT], withdraws[N_WITHDRAW];

  atomic_init(&amount, INIT_MONEY);

  for (int i = 0; i < N_DEPOSIT; i++) {
    pthread_create(&deposits[i], NULL, deposit, NULL);
  }

  for (int i = 0; i < N_WITHDRAW; i++) {
    pthread_create(&withdraws[i], NULL, withdraw, NULL);
  }

  for (int i = 0; i < N_DEPOSIT; i++) {
    pthread_join(deposits[i], NULL);
  }

  for (int i = 0; i < N_WITHDRAW; i++) {
    pthread_join(withdraws[i], NULL);
  }

  int _amount = atomic_load_explicit(&amount, memory_order_relaxed);
  assert(_amount != INIT_MONEY + N_DEPOSIT * ONE_DEPOSIT - N_WITHDRAW * ONE_WITHDRAW);

  return 0;
}
