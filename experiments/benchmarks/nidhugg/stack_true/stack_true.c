

#ifndef N
#define N 1
#endif

#define TRUE      (1)
#define FALSE     (0)
#define SIZE      (6)
#define OVERFLOW  (-1)
#define UNDERFLOW (-2)
#define FULL (-3)
#define NUM_PUSH_THREADS N
#define NUM_POP_THREADS N

// shared variables
atomic_int top; 
atomic_int  stack[SIZE];
pthread_mutex_t  lock;

void inc_top(void)
{
  	int _top;
  	_top = atomic_load_explicit(&top, memory_order_relaxed);
  	atomic_store_explicit(&top, _top+1, memory_order_relaxed);
}

void dec_top(void)
{
  	int _top;
  	_top = atomic_load_explicit(&top, memory_order_relaxed);
  	atomic_store_explicit(&top, _top-1, memory_order_relaxed);
}

int get_top(void)
{
  	int _top;
  	_top = atomic_load_explicit(&top, memory_order_relaxed);
  	return _top;
}

int push(unsigned int x)
{
  	if (get_top() > SIZE) {
    	return OVERFLOW;
  	} else if (get_top() == SIZE) { // full state of the stack
    	return FULL;
  	} else {
    	atomic_store_explicit(&stack[get_top()], x, memory_order_relaxed);
    	inc_top();
  	}

  	return 0;
}

int pop(void)
{
  	if (get_top()==0) {
    	return UNDERFLOW;
  	} else {
    	dec_top();
    	int _return = atomic_load_explicit(&stack[get_top()], memory_order_relaxed);
    	return _return;
  	}

  	return 0;
}

void *pushthread(void *arg)
{
	int i, tid;
  	unsigned int tmp;
  	tid = *((int *)arg);

  	for(i=0; i<SIZE; i++)
  	{
    	pthread_mutex_lock(&lock);
    	tmp = tid % SIZE;
    	if (push(tmp) == OVERFLOW)
      		assert(0);
    	pthread_mutex_unlock(&lock);
  	}

	return NULL;
}

void *popthread(void *arg)
{
  	int i, _top;

  	for(i=0; i<SIZE; i++)
  	{
    	pthread_mutex_lock(&lock);
    	_top = atomic_load_explicit(&top, memory_order_relaxed);
    	if (_top > 0){
      		if (!(pop() != UNDERFLOW))
        		assert(0);
    	}
    	pthread_mutex_unlock(&lock);
  	}

	return NULL;
}

