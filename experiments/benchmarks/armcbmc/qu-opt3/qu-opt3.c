#include <stdlib.h>
#include <stdatomic.h>
#include <pthread.h>
#include <stdbool.h>
#include <assert.h>

/*
 * Michael-Scott queue -- adapted from [Pulte et al. 2019]
 */

/***********************************************************
 * Memory-allocation infrastructure -- implemented by client
 ***********************************************************/

int get_thread_num();
struct queue_node *new_node();


/***********************************************************
 * Queue implementation (utilizes malloc infrastructure)
 ***********************************************************/

struct queue_node {
	int data;
	struct queue_node * next;    	// A workaround
};

struct queue {
	struct queue_node init;
	struct queue_node * head;	// A workaround
	struct queue_node * tail;	// A workaround
	bool is_initialized;		// A workaround
};

void queue_init(struct queue *q)
{
	atomic_store_explicit(&q->init.next, NULL, memory_order_release);
	atomic_store_explicit(&q->head, &q->init, memory_order_release);
	atomic_store_explicit(&q->tail, &q->init, memory_order_release);
	atomic_store_explicit(&q->is_initialized, true, memory_order_release);
}

bool queue_is_initialized(struct queue *q)
{
	return atomic_load_explicit(&q->is_initialized, memory_order_acquire);
}

struct queue_node *queue_find_tail(struct queue *q)
{
	struct queue_node *node = atomic_load_explicit(&q->tail, memory_order_relaxed);
	struct queue_node *next = atomic_load_explicit(&node->next, memory_order_relaxed);

	if (next == NULL)
		return node;

	atomic_store_explicit(&q->tail, next, memory_order_relaxed);
	return NULL;
}

int queue_try_enq(struct queue *q, int data)
{
	struct queue_node *node = new_node();

	if (node == NULL) {
		return -3; /* OOM */
	}

	node->data = data;
	atomic_store_explicit(&node->next, NULL, memory_order_relaxed);

	struct queue_node *tail = NULL;
	do {
		tail = queue_find_tail(q);
	} while (tail == NULL);

	struct queue_node *v = NULL;
	if (atomic_compare_exchange_strong_explicit(&tail->next, &v, node,
						    memory_order_release,
						    memory_order_release)) {
		atomic_store_explicit(&q->tail, node, memory_order_relaxed);
		return 0;
	}

	return -2; /* CAVEAT: memory leak */
}

int queue_try_deq(struct queue *q, int *ret_data)
{
	struct queue_node *head = atomic_load_explicit(&q->head, memory_order_relaxed);
	struct queue_node *node = atomic_load_explicit(&head->next, memory_order_relaxed);

	if (node == NULL)
		return -1;

	if (atomic_compare_exchange_strong_explicit(&q->head, &head, node,
						    memory_order_relaxed,
						    memory_order_relaxed)) {
		*ret_data = node->data;
		return 0; /* CAVEAT: memory leak */
	}

	return -2;
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
struct queue_node free_lists[MAX_THREADS + 1][MAX_FREELIST];
unsigned int free_index[MAX_THREADS + 1];

struct queue_node *new_node()
{
	int t = get_thread_num();

	assert(free_index[t] < MAX_FREELIST);
	return &free_lists[t][free_index[t]++];
}

#ifndef ENQ_T1_BEFORE
# define ENQ_T1_BEFORE 1
#endif
#ifndef DEQ_T1
# define DEQ_T1 0
#endif
#ifndef ENQ_T1_AFTER
# define ENQ_T1_AFTER 0
#endif

#ifndef ENQ_T2_BEFORE
# define ENQ_T2_BEFORE 1
#endif
#ifndef DEQ_T2
# define DEQ_T2 0
#endif
#ifndef ENQ_T2_AFTER
# define ENQ_T2_AFTER 0
#endif

#ifndef ENQ_T3_BEFORE
# define ENQ_T3_BEFORE 0
#endif
#ifndef DEQ_T3
# define DEQ_T3 1
#endif
#ifndef ENQ_T3_AFTER
# define ENQ_T3_AFTER 0
#endif

struct queue myqueue;

void *thread_1(void *arg)
{
	int count = 1;
	int data, res;
	int result1, result2, result3;

	/* set TID */
	tid = *((int *) arg);

	/* Initialize queue within thread
	 * following Pulte et al's test case */
	queue_init(&myqueue);

	/* push some items */
	res = 0;
	for (int i = 0; i < ENQ_T1_BEFORE; i++) {
		if (queue_try_enq(&myqueue, count) >= 0) {
			res += count;
			count *= 2;
		}
	}
	result1 = res;

	/* pop some items */
	res = 0;
	for (int i = 0; i < DEQ_T1; i++) {
		if (queue_try_deq(&myqueue, &data) >= 0) {
			res += data;
		}
	}
	result2 = res;

	/* push some items */
	res = 0;
	for (int i = 0; i < ENQ_T1_AFTER; i++) {
		if (queue_try_enq(&myqueue, count) >= 0) {
			res += count;
			count *= 2;
		}
	}
	result3 = res;

	return NULL;
}

void *thread_2(void *arg)
{
	int count = 1;
	int data, res;
	int result1, result2, result3;

	/* set TID */
	tid = *((int *) arg);

	if (!queue_is_initialized(&myqueue))
		return NULL;

	/* push some items */
	res = 0;
	for (int i = 0; i < ENQ_T2_BEFORE; i++) {
		if (queue_try_enq(&myqueue, count) >= 0) {
			res += count;
			count *= 2;
		}
	}
	result1 = res;

	/* pop some items */
	res = 0;
	for (int i = 0; i < DEQ_T2; i++) {
		if (queue_try_deq(&myqueue, &data) >= 0) {
			res += data;
		}
	}
	result2 = res;

	/* push some items */
	res = 0;
	for (int i = 0; i < ENQ_T2_AFTER; i++) {
		if (queue_try_enq(&myqueue, count) >= 0) {
			res += count;
			count *= 2;
		}
	}
	result3 = res;

	return NULL;
}

void *thread_3(void *arg)
{
	int count = 1;
	int data, res;
	int result1, result2, result3;

	/* set TID */
	tid = *((int *) arg);

	if (!queue_is_initialized(&myqueue))
		return NULL;

	/* push some items */
	res = 0;
	for (int i = 0; i < ENQ_T3_BEFORE; i++) {
		if (queue_try_enq(&myqueue, count) >= 0) {
			res += count;
			count *= 2;
		}
	}
	result1 = res;

	/* pop some items */
	res = 0;
	for (int i = 0; i < DEQ_T3; i++) {
		if (queue_try_deq(&myqueue, &data) >= 0) {
			res += data;
		}
	}
	result2 = res;

	/* push some items */
	res = 0;
	for (int i = 0; i < ENQ_T3_AFTER; i++) {
		if (queue_try_enq(&myqueue, count) >= 0) {
			res += count;
			count *= 2;
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
	if (queue_try_deq(&myqueue, &data1) >= 0) {
		if (queue_try_deq(&myqueue, &data2) >= 0) {
			// Are they from the same thread?
			if ((data2 - data1) % 3 == 0) {
			        // FIFO: First in first out
				assert(data1 < data2);
			}	
		}
	}
		
	return 0;
}


