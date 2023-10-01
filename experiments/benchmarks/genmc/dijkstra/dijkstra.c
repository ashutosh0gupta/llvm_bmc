
#ifndef N
  #define N 2
#endif

// shared variables
atomic_int interested[N];
atomic_int passed[N];
atomic_int k;
atomic_int x;

void *t(void *arg)
{
	int ok = 0;
	int done, _k;
 	int tid = *((int *)arg);
  	atomic_store_explicit(&interested[tid], 1, memory_order_relaxed);
  	done = 0;
  	while (1) {
  		while (1) {
  			_k = atomic_load_explicit(&k, memory_order_relaxed);
	    	if (_k==tid) {
	    		break;
	    	}
	    	if (atomic_load_explicit(&interested[_k], memory_order_relaxed)==0)
	    		atomic_store_explicit(&k, tid, memory_order_relaxed);
	    }
	  	atomic_store_explicit(&passed[tid], 1, memory_order_relaxed);
	  	done = 1;
	  	for (int j=0; j<N; j++) {
	  		if (j==tid) continue;
	  		if (atomic_load_explicit(&passed[j], memory_order_relaxed)==1) {
	  			atomic_store_explicit(&passed[tid], 0, memory_order_relaxed);
	  			done = 0;
	  		}
	  	}
	  	if (done==1) {
	  		break;
	  	}
  	}
  	// critical section
	atomic_store_explicit(&x, tid, memory_order_relaxed);
	assert(atomic_load_explicit(&x, memory_order_relaxed) == tid);
  	atomic_store_explicit(&passed[tid], 0, memory_order_relaxed);
  	atomic_store_explicit(&interested[tid], 0, memory_order_relaxed);
	return NULL;
}
