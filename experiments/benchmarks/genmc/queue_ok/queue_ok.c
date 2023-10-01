

#ifndef N
#define N 3
#endif

#define SIZE	(6)
#define EMPTY	(-1)
#define FULL	(-2)
#define FALSE	(0)
#define TRUE	(1)
#define NUM_ENQUEUE_THREADS N
#define NUM_DEQUEUE_THREADS N

atomic_int element[SIZE];
atomic_int head;
atomic_int tail;
atomic_int amount;
pthread_mutex_t  lock;
atomic_int stored_elements[SIZE];
atomic_int enqueue_flag, dequeue_flag;

void init(void)
{
  	atomic_init(&head, 0);
  	atomic_init(&tail, 0);
  	atomic_init(&amount, 0);
  	for (int i=0; i<SIZE; i++) {
    	atomic_init(&element[i], 0);
  	}
}

int empty(void)
{
  	int _head, _tail, _amount;
  	_head = atomic_load_explicit(&head, memory_order_relaxed);
  	_tail = atomic_load_explicit(&tail, memory_order_relaxed);
  	_amount = atomic_load_explicit(&amount, memory_order_relaxed);

  	if (_head == _tail && _amount==0) {
    	return EMPTY;
  	} else
    	return 0;
}

int full(void)
{
  	int _amount;
  	_amount = atomic_load_explicit(&amount, memory_order_relaxed);
  	if (_amount == SIZE) {
    	return FULL;
  	} else
    	return 0;
}

int enqueue(int x)
{
  	int _tail, _amount;

	_tail = atomic_load_explicit(&tail, memory_order_relaxed);
  	atomic_store_explicit(&element[_tail], x, memory_order_relaxed);

  	_amount = atomic_load_explicit(&amount, memory_order_relaxed);
  	atomic_store_explicit(&amount, _amount+1, memory_order_relaxed);

  	_tail = atomic_load_explicit(&tail, memory_order_acquire);
  	if (_tail == SIZE-1) {
    	atomic_store_explicit(&tail, 0, memory_order_relaxed);
  	} else {
   		_tail = atomic_load_explicit(&tail, memory_order_relaxed);
   		atomic_store_explicit(&tail, _tail+1, memory_order_relaxed);
 	}

 	return 0;
}

int dequeue()
{
  	int x, _head, _amount;

  	_head = atomic_load_explicit(&head, memory_order_relaxed);
  	x = atomic_load_explicit(&element[_head], memory_order_relaxed);

  	_amount = atomic_load_explicit(&amount, memory_order_relaxed);
 	atomic_store_explicit(&amount, _amount-1, memory_order_relaxed);

  	_head = atomic_load_explicit(&head, memory_order_acquire);
  	if (_head == SIZE-1) {
    	atomic_store_explicit(&head, 0, memory_order_relaxed);
  	} else {
  		_head = atomic_load_explicit(&head, memory_order_relaxed);
    	atomic_store_explicit(&head, _head+1, memory_order_relaxed);
  	}

  	return x;
}

void *enqueuethread(void *arg)
{
	int value, i, _enqueue_flag;
  	int enqueue_number = 0;
  	value = *((int *)arg);

    pthread_mutex_lock(&lock);
  	_enqueue_flag = atomic_load_explicit(&enqueue_flag, memory_order_relaxed);

	if (_enqueue_flag)
  	{
    	for(i=0; i<SIZE; i++)
    	{
      		if (full() != FULL) {
        		value += enqueue_number;
        		enqueue_number++;
        		enqueue(value);
        		atomic_store_explicit(&stored_elements[i], value, memory_order_relaxed);
        		if (empty()) assert(0);
      		}
    	}
    	atomic_store_explicit(&enqueue_flag, FALSE, memory_order_relaxed);
    	atomic_store_explicit(&dequeue_flag, TRUE, memory_order_relaxed);
  	}

    pthread_mutex_unlock(&lock);

  	return NULL;
}

void *dequeuethread(void *arg)
{
  	int i, _dequeue_flag, _stored_elements_i;

    pthread_mutex_lock(&lock);
  	_dequeue_flag = atomic_load_explicit(&dequeue_flag, memory_order_relaxed);

  	if (_dequeue_flag)
  	{
    	for(i=0; i<SIZE; i++)
    	{
      		if (empty()!=EMPTY) {
        		_stored_elements_i = atomic_load_explicit(&stored_elements[i], memory_order_relaxed);
        		if (!(dequeue() == _stored_elements_i)) {
          			assert(0);
        		}
      		}
    	}

    	atomic_store_explicit(&dequeue_flag, FALSE, memory_order_relaxed);
    	atomic_store_explicit(&enqueue_flag, TRUE, memory_order_relaxed);
  	}

    pthread_mutex_unlock(&lock);

  	return NULL;
}


