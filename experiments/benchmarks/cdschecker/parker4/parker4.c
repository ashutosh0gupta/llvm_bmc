/* A recreation of the bug
 * http://bugs.sun.com/view_bug.do?bug_id=6822370
 *
 * based on the description in
 * https://blogs.oracle.com/dave/entry/a_race_in_locksupport_park
 */

#include <stdlib.h>
#include <threads.h>
#include <stdatomic.h>
#include <assert.h>

#ifdef MAKE_ASSUME_FUNCTION
void __VERIFIER_assume(int);
#else
# define __VERIFIER_assume(cond) \
 do {			        \
         if (!(cond))		\
		 goto exit;	\
 } while (0)
#endif

#define BND 4

/* Testing */
atomic_int global_cond; /* global condition variable which the parker will wait for */
atomic_int unparker_finished; /* Flag indicating that the unparker thread has finished */

/* Small low-level mutex implementation */
atomic_int x, y;

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

static void thread_parker(void *_arg)
{
	for (int i = 0u; i <= BND; i++) {
		if (i == BND)
			goto exit;
		if (atomic_load_explicit(&global_cond, memory_order_acquire))
			break;
		parker_park();
	}

exit:
	return;
}

static void thread_unparker(void *_arg)
{
	parker_unpark();
	atomic_store_explicit(&global_cond, 1, memory_order_release);
	parker_unpark();

	// Done
	atomic_store_explicit(&unparker_finished, 1, memory_order_release);

exit:
	return;
}

int user_main(int argc, char **argv)
{
	thrd_t t1, t2;

	atomic_init(&global_cond, 0);
	atomic_init(&unparker_finished, 0);
	atomic_init(&x, 0);
	atomic_init(&y, 0);
	atomic_init(&parker_counter, 0);
	atomic_init(&parker_cond, 0);


	if (thrd_create(&t1, (thrd_start_t) &thread_parker, NULL))
		abort();
	if (thrd_create(&t2, (thrd_start_t) &thread_unparker, NULL))
		abort();

	return 0;
}
