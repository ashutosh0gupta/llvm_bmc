#include <stdlib.h>
#include <stdatomic.h>
#include <pthread.h>
#include <stdbool.h>
#include <assert.h>


/*
 * Treiber stack -- adapted from [Pulte et al. 2019]
 */

/***********************************************************
 * Memory-allocation infrastructure -- implemented by client
 ***********************************************************/

int get_thread_num();
struct stack_node *new_node();


/***********************************************************
 * Stack implementation (utilizes malloc infrastructure)
 ***********************************************************/

struct stack_node {
	atomic_int data;
	_Atomic(struct stack_node *) next;
};

struct stack {
	_Atomic(struct stack_node *) head;
};

#define __STACK_INITIALIZER() { .head = ATOMIC_VAR_INIT(NULL) }
#define DEFINE_STACK(name)			\
	struct stack name = __STACK_INITIALIZER();

void stack_init(struct stack *s)
{
	atomic_store_explicit(&s->head, NULL, memory_order_seq_cst);
}

/* Returns -2 if lost, -3 if OOM */
int stack_try_push(struct stack *s, int data)
{
	struct stack_node *node = new_node();

	if (node == NULL)
		return -3; /* OOM */

	atomic_store_explicit(&node->data, data, memory_order_relaxed);
	struct stack_node *head = atomic_load_explicit(&s->head, memory_order_relaxed);
	atomic_store_explicit(&node->next, head, memory_order_relaxed);

	bool success = atomic_compare_exchange_strong_explicit(&s->head, &head, node,
							       memory_order_release,
							       memory_order_release);
	return (success ? 0 : -2); /* CAVEAT: memory leak if unsuccessful*/
}

/* Returns -1 if empty, -2 if lost */
int stack_try_pop(struct stack *s, int *ret_data)
{
	struct stack_node *head = atomic_load_explicit(&s->head, memory_order_acquire);

	if (head == NULL)
		return -1; /* empty */

	*ret_data = atomic_load_explicit(&head->data, memory_order_relaxed);
	struct stack_node *next = atomic_load_explicit(&head->next, memory_order_relaxed);
	bool success = atomic_compare_exchange_strong_explicit(&s->head, &head, next,
							       memory_order_release,
							       memory_order_release);
	return (success ? 0 : -2); /* CAVEAT: memory leak if successful */
}

/***********************************************************
 * Client infrastructure
 ***********************************************************/

#ifndef MAX_THREADS
# define MAX_THREADS 32
#endif
#ifndef MAX_FREELIST
# define MAX_FREELIST 32 /* Each thread can own up to MAX_FREELIST free nodes */
#endif

int __thread tid; /* Needs to be set before each thread starts executing */

int get_thread_num()
{
	return tid;
}

unsigned int idx[MAX_THREADS + 1];
struct stack_node free_lists[MAX_THREADS + 1][MAX_FREELIST];
unsigned int free_index[MAX_THREADS + 1];

struct stack_node *new_node()
{
	int t = get_thread_num();

	assert(free_index[t] < MAX_FREELIST);
	return &free_lists[t][free_index[t]++];
}

#ifndef PUSH_T1_BEFORE
# define PUSH_T1_BEFORE 2
#endif
#ifndef POP_T1
# define POP_T1 1
#endif
#ifndef PUSH_T1_AFTER
# define PUSH_T1_AFTER 0
#endif

#ifndef PUSH_T2_BEFORE
# define PUSH_T2_BEFORE 0
#endif
#ifndef POP_T2
# define POP_T2 1
#endif
#ifndef PUSH_T2_AFTER
# define PUSH_T2_AFTER 1
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

DEFINE_STACK(mystack);

void *thread_1(void *arg)
{
	int count = 0; // Adapted to write correctness specifications
	int data, res;
	int result1, result2, result3;

	/* set TID */
	tid = *((int *) arg);

	/* push some items */
	res = 0;
	for (int i = 0; i < PUSH_T1_BEFORE; i++) {
		if (stack_try_push(&mystack, count) >= 0) {
			res += count;
			count += 3; // Adapted to write correctness specifications
		}
	}
	result1 = res;

	/* pop some items */
	res = 0;
	for (int i = 0; i < POP_T1; i++) {
		if (stack_try_pop(&mystack, &data) >= 0) {
			res += data;
		}
	}
	result2 = res;

	/* push some items */
	res = 0;
	for (int i = 0; i < PUSH_T1_AFTER; i++) {
		if (stack_try_push(&mystack, count) >= 0) {
			res += count;
			count += 3; // Adapted to write correctness specifications
		}
	}
	result3 = res;

	return NULL;
}

void *thread_2(void *arg)
{
	int count = 1; // Adapted to write correctness specifications
	int data, res;
	int result1, result2, result3;

	/* set TID */
	tid = *((int *) arg);

	/* push some items */
	res = 0;
	for (int i = 0; i < PUSH_T2_BEFORE; i++) {
		if (stack_try_push(&mystack, count) >= 0) {
			res += count;
			count += 3; // Adapted to write correctness specifications
		}
	}
	result1 = res;

	/* pop some items */
	res = 0;
	for (int i = 0; i < POP_T2; i++) {
		if (stack_try_pop(&mystack, &data) >= 0) {
			res += data;
		}
	}
	result2 = res;

	/* push some items */
	res = 0;
	for (int i = 0; i < PUSH_T2_AFTER; i++) {
		if (stack_try_push(&mystack, count) >= 0) {
			res += count;
			count += 3; // Adapted to write correctness specifications
		}
	}
	result3 = res;

	return NULL;
}

void *thread_3(void *arg)
{
	int count = 2; // Adapted to write correctness specifications
	int data, res;
	int result1, result2, result3;

	/* set TID */
	tid = *((int *) arg);

	/* push some items */
	res = 0;
	for (int i = 0; i < PUSH_T3_BEFORE; i++) {
		if (stack_try_push(&mystack, count) >= 0) {
			res += count;
			count += 3; // Adapted to write correctness specifications
		}
	}
	result1 = res;

	/* pop some items */
	res = 0;
	for (int i = 0; i < POP_T3; i++) {
		if (stack_try_pop(&mystack, &data) >= 0) {
			res += data;
		}
	}
	result2 = res;

	/* push some items */
	res = 0;
	for (int i = 0; i < PUSH_T3_AFTER; i++) {
		if (stack_try_push(&mystack, count) >= 0) {
			res += count;
			count += 3; // Adapted to write correctness specifications
		}
	}
	result3 = res;

	return NULL;
}

int main()
{
	pthread_t t1, t2, t3;
	
	for (int i = 0u; i <= 3; i++)
		idx[i] = i;
		
	pthread_create(&t1, NULL, thread_1, &idx[1]);
	pthread_create(&t2, NULL, thread_2, &idx[2]);
	pthread_create(&t3, NULL, thread_3, &idx[3]);
	
	pthread_join(t1, NULL);
	pthread_join(t2, NULL);
	pthread_join(t3, NULL);
	
	// Check some properties
	int data1, data2;
	if (stack_try_pop(&mystack, &data1) >= 0) {
		if (stack_try_pop(&mystack, &data2) >= 0) {
			// Are they from the same thread?
			if ((data2 - data1) % 3 == 0) {
			        // LIFO: Last in first out
				assert(data2 < data1);
			}	
		}
	}
		
	return 0;
}
