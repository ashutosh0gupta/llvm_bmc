

#ifndef N
#  define N 2
#endif

#define INIT_MONEY 1000
#define ONE_DEPOSIT  100
#define ONE_WITHDRAW 10
#define N_DEPOSIT N
#define N_WITHDRAW 1

// shared variables
atomic_int amount;

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

