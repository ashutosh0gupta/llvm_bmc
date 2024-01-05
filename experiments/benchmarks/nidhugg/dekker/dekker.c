
// shared variables
atomic_int flag1;
atomic_int flag2;
atomic_int turn;
atomic_int x;

void *p1(void *arg)
{
  	while (1)
  	{
    	atomic_store_explicit(&flag1, 1, memory_order_relaxed);   
    	while (1)
    	{
      		if (atomic_load_explicit(&flag2, memory_order_relaxed)) {
        		if (atomic_load_explicit(&turn, memory_order_relaxed) != 0)
        		{
          			atomic_store_explicit(&flag1, 0, memory_order_relaxed);
          			while (1)
          			{
            			if (atomic_load_explicit(&turn, memory_order_relaxed) == 0) {
              				break;
            			}
          			}
				    atomic_store_explicit(&flag1, 1, memory_order_relaxed);
        		}
      		} else {
        		break;
      		}
    	}
    	// critical section
    	atomic_store_explicit(&x, 1, memory_order_relaxed);
    	assert(atomic_load_explicit(&x, memory_order_relaxed) == 1);
    	atomic_store_explicit(&turn, 1, memory_order_relaxed);
    	atomic_store_explicit(&flag1, 0, memory_order_relaxed);
  	}
	return NULL;
}

void *p2(void *arg)
{  
  	while (1)
  	{
    	atomic_store_explicit(&flag2, 1, memory_order_relaxed);   
    	while (1)
  	    {
      		if (atomic_load_explicit(&flag1, memory_order_relaxed)) {
        		if (atomic_load_explicit(&turn, memory_order_relaxed) != 1)
        		{
          			atomic_store_explicit(&flag2, 0, memory_order_relaxed);
          			while (1)
  	                {
            			if (atomic_load_explicit(&turn, memory_order_relaxed) == 1) {
              				break;
            			}
          			}
          			atomic_store_explicit(&flag2, 1, memory_order_relaxed);
        		}
      		} else {
        		break;
      		}
    	}
    	// critical section
    	atomic_store_explicit(&x, 2, memory_order_relaxed);
    	assert(atomic_load_explicit(&x, memory_order_relaxed) == 2);
    	atomic_store_explicit(&turn, 0, memory_order_relaxed);
    	atomic_store_explicit(&flag2, 0, memory_order_relaxed);
  	}
	return NULL;
}

