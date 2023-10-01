#include <stdlib.h>
#include <pthread.h>
#include <stdatomic.h>
#include <stdbool.h>
#include <assert.h>

/***********************************************************
 * Queue implementation (utilizes malloc infrastructure)
 ***********************************************************/

#ifndef LEN
# define LEN 10
#endif

struct deque {
	long bottom;       // A workaround
	long top; // A workaround
	int buffer[LEN]; // in fact, it should be marked as atomic
	//due to the race between push and
	// steal.
};

int deque_try_push(struct deque *deq, int data)
{
	int b = atomic_load_explicit(&deq->bottom, memory_order_relaxed);
	int t = atomic_load_explicit(&deq->top, memory_order_relaxed);

	int len = (int) (b - t);
	if (len >= LEN) {
		return -1; // full
	}

	deq->buffer[b % LEN] = data;
	atomic_store_explicit(&deq->bottom, b + 1, memory_order_release);
	return 0;
}

int deque_try_pop(struct deque *deq, int *data)
{
	int b = atomic_load_explicit(&deq->bottom, memory_order_relaxed);
	atomic_store_explicit(&deq->bottom, b - 1, memory_order_relaxed);

	atomic_thread_fence(memory_order_seq_cst);

	int t = atomic_load_explicit(&deq->top, memory_order_relaxed);
	int len = (int) (b - t);

	if (len <= 0) {
		atomic_store_explicit(&deq->bottom, b, memory_order_relaxed);
		return -1; // empty
	}

	*data = deq->buffer[(b - 1) % LEN];

	if (len > 1) {
		return 0;
	}

	// len = 1.
	bool is_successful = atomic_compare_exchange_strong_explicit(&deq->top, &t, t + 1,
							    memory_order_release,
							    memory_order_release);
	atomic_store_explicit(&deq->bottom, b, memory_order_relaxed);
	return (is_successful ? 0 : -2); // success or lost
}

int deque_try_steal(struct deque *deq, int * data)
{
	int t = atomic_load_explicit(&deq->top, memory_order_relaxed);

	atomic_thread_fence(memory_order_seq_cst);

	int b = atomic_load_explicit(&deq->bottom, memory_order_acquire);
	int len = (int) (b - t);

	if (len <= 0) {
		return -1; // empty
	}

	*data = deq->buffer[t % LEN];

	bool is_successful = atomic_compare_exchange_strong_explicit(&deq->top, &t, t + 1,
							    memory_order_release,
							    memory_order_release);
	return (is_successful ? 0 : -2); // success or lost
}

/***********************************************************
 * Client infrastructure
 ***********************************************************/

#ifndef PUSH_T1_BEFORE
# define PUSH_T1_BEFORE 2
#endif
#ifndef POP_T1
# define POP_T1 1
#endif
#ifndef PUSH_T1_AFTER
# define PUSH_T1_AFTER 1
#endif
#ifndef STEAL_T1
# define STEAL_T1 0
#endif

#ifndef PUSH_T2_BEFORE
# define PUSH_T2_BEFORE 0
#endif
#ifndef POP_T2
# define POP_T2 0
#endif
#ifndef PUSH_T2_AFTER
# define PUSH_T2_AFTER 0
#endif
#ifndef STEAL_T2
# define STEAL_T2 2
#endif

#ifndef PUSH_T3_BEFORE
# define PUSH_T3_BEFORE 0
#endif
#ifndef POP_T3
# define POP_T3 0
#endif
#ifndef PUSH_T3_AFTER
# define PUSH_T3_AFTER 0
#endif
#ifndef STEAL_T3
# define STEAL_T3 1
#endif

struct deque mydeque;

void *thread_1(void *arg)
{
	int count = 0; // Adapted to write correctness specifications
	int data, res;
        int result1, result2, result3, result4;

	/* push some items */
	res = 0;
	for (int i = 0; i < PUSH_T1_BEFORE; i++) {
		if (deque_try_push(&mydeque, count) >= 0) {
			res += count;
			count += 3; // Adapted to write correctness specifications
		}
	}
	result1 = res;

	/* pop some items */
	res = 0;
	for (int i = 0; i < POP_T1; i++) {
		if (deque_try_pop(&mydeque, &data) >= 0) {
			res += data;
		}
	}
	result2 = res;

	/* push some items */
	res = 0;
	for (int i = 0; i < PUSH_T1_AFTER; i++) {
		if (deque_try_push(&mydeque, count) >= 0) {
			res += count;
			count += 3; // Adapted to write correctness specifications
		}
	}
	result3 = res;

	/* steal some items */
	res = 0;
	for (int i = 0; i < STEAL_T1; i++) {
		if (deque_try_steal(&mydeque, &data) >= 0) {
			res += data;
		}
	}
	result4 = res;

	return NULL;
}

void *thread_2(void *arg)
{
	int count = 1;
	int data, res;
	int result1, result2, result3, result4;

	/* push some items */
	res = 0;
	for (int i = 0; i < PUSH_T2_BEFORE; i++) {
		if (deque_try_push(&mydeque, count) >= 0) {
			res += count;
			count += 3; // Adapted to write correctness specifications
		}
	}
	result1 = res;

	/* pop some items */
	res = 0;
	for (int i = 0; i < POP_T2; i++) {
		if (deque_try_pop(&mydeque, &data) >= 0) {
			res += data;
		}
	}
	result2 = res;

	/* push some items */
	res = 0;
	for (int i = 0; i < PUSH_T2_AFTER; i++) {
		if (deque_try_push(&mydeque, count) >= 0) {
			res += count;
			count += 3; // Adapted to write correctness specifications
		}
	}
	result3 = res;

	/* steal some items */
	res = 0;
	for (int i = 0; i < STEAL_T2; i++) {
		if (deque_try_steal(&mydeque, &data) >= 0) {
			res += data;
		}
	}
	result4 = res;

	return NULL;
}

void *thread_3(void *arg)
{
	int count = 2; // Adapted to write correctness specifications
	int data, res;
	int result1, result2, result3, result4;

	/* push some items */
	res = 0;
	for (int i = 0; i < PUSH_T3_BEFORE; i++) {
		if (deque_try_push(&mydeque, count) >= 0) {
			res += count;
			count += 3; // Adapted to write correctness specifications
		}
	}
	result1 = res;

	/* pop some items */
	res = 0;
	for (int i = 0; i < POP_T3; i++) {
		if (deque_try_pop(&mydeque, &data) >= 0) {
			res += data;
		}
	}
	result2 = res;

	/* push some items */
	res = 0;
	for (int i = 0; i < PUSH_T3_AFTER; i++) {
		if (deque_try_push(&mydeque, count) >= 0) {
			res += count;
			count += 3; // Adapted to write correctness specifications
		}
	}
	result3 = res;

	/* steal some items */
	res = 0;
	for (int i = 0; i < STEAL_T3; i++) {
		if (deque_try_steal(&mydeque, &data) >= 0) {
			res += data;
		}
	}
	result4 = res;

	return NULL;
}


int main()
{
	pthread_t t1, t2, t3;

	pthread_create(&t1, NULL, thread_1, NULL);
	pthread_create(&t2, NULL, thread_2, NULL);
	pthread_create(&t3, NULL, thread_3, NULL);
	
	pthread_join(t1, NULL);
	pthread_join(t2, NULL);
	pthread_join(t3, NULL);
	
	// Check some properties
	int b = atomic_load_explicit(&mydeque.bottom, memory_order_relaxed);
	int t = atomic_load_explicit(&mydeque.top, memory_order_relaxed);
	int len = (int) (b - t);
	assert(len <= LEN); // upper bound limitation
	assert(0 <= len); // lower bound limitation
	
	int data1, data2;
	if (deque_try_pop(&mydeque, &data1) >= 0) {
		if (deque_try_pop(&mydeque, &data2) >= 0) {
			// Are they from the same thread?
			if ((data2 - data1) % 3 == 0) {
			        // FIFO: First in first out
				assert(data1 < data2);
			}	
		}
	}

	return 0;
}
