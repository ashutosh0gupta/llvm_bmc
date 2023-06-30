/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* This is program circular_buffer_ok.c from SCTBench
 *   https://github.com/mc-imperial/sctbench
 * It has been modified to be parametric on N from the command line
 * and to compile without warnings.
 */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

#define BUFFER_MAX  10
#ifndef N
#  define N 4
#endif
#define ERROR -1
#define FALSE 0
#define TRUE 1

static long buffer[BUFFER_MAX];   /* BUFFER */				// A workaround

static long first;        /* Variable to point to the input buffer   */	// A workaround
static long next;         /* Variable to point to the output pointer */	// A workaround
static long buffer_size;  /* Max amount of elements in the buffer    */	// A workaround

long send, receive;								// A workaround
long value;									// A workaround

pthread_mutex_t m;

void initLog(int max)
{
  atomic_store_explicit(&buffer_size, max, memory_order_relaxed);
  atomic_store_explicit(&first, 0, memory_order_relaxed);
  atomic_store_explicit(&next, 0, memory_order_relaxed);
}

int removeLogElement(void)
{
  assert(atomic_load_explicit(&first, memory_order_relaxed)>=0);

  if (   atomic_load_explicit(&next, memory_order_relaxed) > 0
      && atomic_load_explicit(&first, memory_order_relaxed) < atomic_load_explicit(&buffer_size, memory_order_relaxed))
  {
    atomic_store_explicit(&first, atomic_load_explicit(&first, memory_order_relaxed)+1, memory_order_relaxed);

    return atomic_load_explicit(&buffer[atomic_load_explicit(&first, memory_order_relaxed)-1], memory_order_relaxed);
  }
  else
  {
    return ERROR;
  }
}

int insertLogElement(int b)
{
  if (atomic_load_explicit(&next, memory_order_relaxed) < atomic_load_explicit(&buffer_size, memory_order_relaxed)
   && atomic_load_explicit(&buffer_size, memory_order_relaxed) > 0)
  {
    atomic_store_explicit(&buffer[atomic_load_explicit(&next, memory_order_relaxed)], b, memory_order_relaxed);
    atomic_store_explicit(&next, (atomic_load_explicit(&next, memory_order_relaxed)+1)%atomic_load_explicit(&buffer_size, memory_order_relaxed), memory_order_relaxed);
    assert(atomic_load_explicit(&next, memory_order_relaxed)<atomic_load_explicit(&buffer_size, memory_order_relaxed));
  }
  else
  {
    return ERROR;
  }

  return b;
}

void *t1(void *arg)
{
  int i;

  for(i=0; i<N; i++)
  {
    pthread_mutex_lock(&m);
    if (atomic_load_explicit(&send, memory_order_relaxed))
    {
      assert(i==insertLogElement(i));
      atomic_store_explicit(&value, i, memory_order_relaxed);
      atomic_store_explicit(&send, FALSE, memory_order_relaxed);
      atomic_store_explicit(&receive, TRUE, memory_order_relaxed);
    }
    pthread_mutex_unlock(&m);
  }
  return NULL;
}

void *t2(void *arg)
{
  int i;
  for(i=0; i<N; i++)
  {
    pthread_mutex_lock(&m);
    if (atomic_load_explicit(&receive, memory_order_relaxed))
    {
      assert(removeLogElement()==atomic_load_explicit(&value, memory_order_relaxed));
      atomic_store_explicit(&receive, FALSE, memory_order_relaxed);
      atomic_store_explicit(&send, TRUE, memory_order_relaxed);
    }
    pthread_mutex_unlock(&m);
  }
  return NULL;
}

int main(int argc, char *argv[]) {

  pthread_t id1, id2;

  pthread_mutex_init(&m, 0);

  initLog(10);
  atomic_init(&send, TRUE);
  atomic_init(&receive,FALSE);

  pthread_create(&id1, NULL, t1, NULL);
  pthread_create(&id2, NULL, t2, NULL);

  pthread_join(id1, NULL);
  pthread_join(id2, NULL);

  return 0;
}
