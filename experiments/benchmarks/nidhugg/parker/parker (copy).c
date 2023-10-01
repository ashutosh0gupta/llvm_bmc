/* A recreation of the bug
 * http://bugs.sun.com/view_bug.do?bug_id=6822370
 *
 * based on the description in
 * https://blogs.oracle.com/dave/entry/a_race_in_locksupport_park
 */

#ifdef MAKE_ASSUME_FUNCTION
void __VERIFIER_assume(int);
#else
# define __VERIFIER_assume(cond) \
 do {			        \
         if (!(cond))		\
		 goto exit;	\
 } while (0)
#endif

/* Testing */
atomic_int global_cond; /* global condition variable which the parker will wait for */
atomic_int unparker_finished; /* Flag indicating that the unparker thread has finished */

/* Small low-level mutex implementation */
atomic_int x, y;

#define lock(id)				\
({					        \
        if (id) {							\
		asm volatile ("lwsync" ::: "memory");			\
		atomic_store_explicit(&x, 1, memory_order_release);      \
		__VERIFIER_assume(atomic_load_explicit(&y, memory_order_acquire) == 0); \
		asm volatile ("isync" ::: "memory");			\
	} else {							\
		asm volatile ("lwsync" ::: "memory");			\
		atomic_store_explicit(&y, 1, memory_order_release);     \
		__VERIFIER_assume(atomic_load_explicit(&x, memory_order_acquire) == 0); \
		asm volatile ("isync" ::: "memory");			\
	}								\
})

#define unlock(id) \
({	       \
	if (id) {							\
		asm volatile ("lwsync" ::: "memory");			\
		atomic_store_explicit(&x, 0, memory_order_release);	\
	} else {							\
		asm volatile ("lwsync" ::: "memory");			\
		atomic_store_explicit(&y, 0, memory_order_release);	\
	}								\
})

/* Returns 0 on success, nonzero on failure. */
#define trylock(id)				\
({					\
        int __ret = 1;				\
	if (id) { \
	        asm volatile ("lwsync" ::: "memory");			    \
		atomic_store_explicit(&x, 1, memory_order_release); \
		if (atomic_load_explicit(&y, memory_order_acquire) == 0) { \
			asm volatile ("isync" ::: "memory");		\
			goto return0;					\
		} else {						\
			asm volatile ("lwsync" ::: "memory");		\
			atomic_store_explicit(&x, 0, memory_order_release); \
			goto return1;					\
		}							\
	} else {							\
		asm volatile ("lwsync" ::: "memory");			\
		atomic_store_explicit(&y, 1, memory_order_release); \
		if (atomic_load_explicit(&x, memory_order_acquire) == 0) { \
			asm volatile ("isync" ::: "memory");		\
			goto return0;					\
		} else {						\
			asm volatile ("lwsync" ::: "memory");		\
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
	asm volatile ("lwsync" ::: "memory");				\
	atomic_store_explicit(&parker_cond, 0, memory_order_release);	\
})

#define parker_cond_wait(id)					\
({								\
        asm volatile ("lwsync" ::: "memory");				\
	atomic_store_explicit(&parker_cond, 1, memory_order_release);	\
	unlock(id);							\
	/* assert(!atomic_load_explicit(&unparker_finished, memory_order_acquire) || */	\
	/*        !atomic_load_explicit(&parker_cond, memory_order_acquire)); // Otherwise wait forever */ \
	__VERIFIER_assume(atomic_load_explicit(&parker_cond, memory_order_acquire) == 0); \
	asm volatile ("isync" ::: "memory");				\
	lock(id);							\
})

#define parker_unpark()				\
({					\
        lock(0);							\
	int s = atomic_load_explicit(&parker_counter, memory_order_acquire); \
	asm volatile ("isync" ::: "memory");				\
	asm volatile ("lwsync" ::: "memory");				\
	atomic_store_explicit(&parker_counter, 1, memory_order_release); \
	unlock(0);							\
									\
	if (s < 1) {							\
		parker_cond_signal();					\
	}								\
})

#define parker_park()						\
({								\
	if (atomic_load_explicit(&parker_counter, memory_order_acquire) > 0) {   \
         	asm volatile ("isync" ::: "memory");			\
		asm volatile ("lwsync" ::: "memory");			\
		atomic_store_explicit(&parker_counter, 0, memory_order_release); \
		goto returnl;						\
	}								\
	if (trylock(1) != 0) {						\
		goto returnl;						\
	}								\
	if (atomic_load_explicit(&parker_counter, memory_order_acquire) > 0) { \
		asm volatile ("isync" ::: "memory");			\
		asm volatile ("lwsync" ::: "memory");			\
		atomic_store_explicit(&parker_counter, 0, memory_order_release);\
		unlock(1);						\
		goto returnl;						\
	}								\
	parker_cond_wait(1);						\
	asm volatile ("lwsync" ::: "memory");				\
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
		asm volatile ("isync" ::: "memory");
		parker_park();
	}

exit:
	return NULL;
}

void *thread_unparker(void *_arg)
{
	parker_unpark();
	asm volatile ("lwsync" ::: "memory");
	atomic_store_explicit(&global_cond, 1, memory_order_release);
	parker_unpark();

	// Done
	asm volatile ("lwsync" ::: "memory");
	atomic_store_explicit(&unparker_finished, 1, memory_order_release);

exit:
	return NULL;
}
