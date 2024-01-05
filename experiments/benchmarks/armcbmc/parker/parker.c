#include <stdlib.h>
#include <pthread.h>
#include <stdatomic.h>
#include <assert.h>


/* A recreation of the bug
 * http://bugs.sun.com/view_bug.do?bug_id=6822370
 *
 * based on the description in
 * https://blogs.oracle.com/dave/entry/a_race_in_locksupport_park
 */


# define __VERIFIER_assume(cond) \
 do {			        \
         if (!(cond))		\
		 goto exit;	\
 } while (0)

/* Testing */
long global_cond; /* global condition variable which the parker will wait for */
long unparker_finished; /* Flag indicating that the unparker thread has finished */

/* Small low-level mutex implementation */
long x, y;

#define lock(id)				\
({					        \
        if (id) {							\
		atomic_store_explicit(&x, 1, memory_order_release);      \
		__VERIFIER_assume(atomic_load_explicit(&y, memory_order_acquire) == 0); \
	} else {							\
		atomic_store_explicit(&y, 1, memory_order_release);     \
		__VERIFIER_assume(atomic_load_explicit(&x, memory_order_acquire) == 0); \
	}								\
})

#define unlock(id) \
({	       \
	if (id) {							\
		atomic_store_explicit(&x, 0, memory_order_release);	\
	} else {							\
		atomic_store_explicit(&y, 0, memory_order_release);	\
	}								\
})

/* Returns 0 on success, nonzero on failure. */
#define trylock(id)				\
({					\
        int __ret = 1;				\
	if (id) { \
		atomic_store_explicit(&x, 1, memory_order_release); \
		if (atomic_load_explicit(&y, memory_order_acquire) == 0) { \
			goto return0;					\
		} else {						\
			atomic_store_explicit(&x, 0, memory_order_release); \
			goto return1;					\
		}							\
	} else {							\
		atomic_store_explicit(&y, 1, memory_order_release); \
		if (atomic_load_explicit(&x, memory_order_acquire) == 0) { \
			goto return0;					\
		} else {						\
			atomic_store_explicit(&y, 0, memory_order_release); \
			goto return1;					\
		}							\
	}								\
return0:								\
	__ret = 0;							\
return1:								\
	__ret;								\
})

/* The parker */
atomic_int parker_counter;
atomic_int parker_cond;

#define parker_cond_signal()			\
({								\
	atomic_store_explicit(&parker_cond, 0, memory_order_release);\
})

#define parker_cond_wait(id) \
({								\
	atomic_store_explicit(&parker_cond, 1, memory_order_release);	\
	unlock(id);							\
	/* assert(!atomic_load_explicit(&unparker_finished, memory_order_acquire) || */	\
	/*        !atomic_load_explicit(&parker_cond, memory_order_acquire)); // Otherwise wait forever */ \
	__VERIFIER_assume(atomic_load_explicit(&parker_cond, memory_order_acquire) == 0); \
	lock(id);							\
})

#define parker_unpark()				\
({					\
        lock(0);								\
	int s = atomic_load_explicit(&parker_counter, memory_order_acquire); \
	atomic_store_explicit(&parker_counter, 1, memory_order_release); \
	unlock(0);							\
									\
	if (s < 1) {							\
		parker_cond_signal();					\
	}								\
})

#define parker_park()				\
({								\
	if (atomic_load_explicit(&parker_counter, memory_order_acquire) > 0) {   \
		atomic_store_explicit(&parker_counter, 0, memory_order_release); \
		goto returnl;						\
	}								\
	if (trylock(1) != 0) {						\
		goto returnl;						\
	}								\
	if (atomic_load_explicit(&parker_counter, memory_order_acquire) > 0) { \
		atomic_store_explicit(&parker_counter, 0, memory_order_release);\
		unlock(1);						\
		goto returnl;						\
	}								\
	parker_cond_wait(1);						\
	atomic_store_explicit(&parker_counter, 0, memory_order_release); \
	unlock(1);							\
	int __ret;							\
returnl:								\
	__ret;								\
})

/* Testing */

void *thread_parker(void *_arg)
{
	while (!atomic_load_explicit(&global_cond, memory_order_acquire)) {
		parker_park();
	}

exit:
	return NULL;
}

void *thread_unparker(void *_arg)
{
	parker_unpark();
	atomic_store_explicit(&global_cond, 1, memory_order_release);
	parker_unpark();

	// Done
	atomic_store_explicit(&unparker_finished, 1, memory_order_release);

exit:
	return NULL;
}


int main()
{
	pthread_t t1, t2;

	if (pthread_create(&t1, NULL, thread_parker, NULL))
		abort();
	if (pthread_create(&t2, NULL, thread_unparker, NULL))
		abort();

	return 0;
}

