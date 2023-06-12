/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Get inspiration from the Account example in Tables 1 and 2 in the PLDI 2015 paper:
 https://dl.acm.org/citation.cfm?id=2737975
 */

/* This benchmark is buggy in the sense that it is missing synchronization */

#include <assert.h>
#include <pthread.h>

#ifndef N
#  warning "N was not defined"
#  define N 5
#endif

#define INIT_MONEY 1000
#define ONE_DEPOSIT  100
#define ONE_WITHDRAW 10
#define N_DEPOSIT N
#define N_WITHDRAW 1

// shared variables
int amount;

void * deposit(void *arg)
{
  int tmp = amount;
  tmp = tmp + ONE_DEPOSIT;
  amount = tmp;

  return NULL;
}

void * withdraw(void *arg)
{
  int tmp = amount;
  tmp = tmp - ONE_WITHDRAW;
  amount = tmp;

  return NULL;
}

int main(int argc, char *argv[])
{
  pthread_t deposits[N_DEPOSIT], withdraws[N_WITHDRAW];

  amount = INIT_MONEY;

  int i;
  for (i = 0; i < N_DEPOSIT; i++) {
    pthread_create(&deposits[i], NULL, deposit, NULL);
  }

  for (i = 0; i < N_WITHDRAW; i++) {
    pthread_create(&withdraws[i], NULL, withdraw, NULL);
  }

  for (i = 0; i < N_DEPOSIT; i++) {
    pthread_join(deposits[i], NULL);
  }

  for (i = 0; i < N_WITHDRAW; i++) {
    pthread_join(withdraws[i], NULL);
  }

  int _amount = amount;
  assert(_amount != INIT_MONEY + N_DEPOSIT * ONE_DEPOSIT - N_WITHDRAW * ONE_WITHDRAW);

  return 0;
}
