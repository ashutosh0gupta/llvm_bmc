
# define mo_acq memory_order_relaxed
# define mo_rel memory_order_relaxed

atomic_bool flag1; /* Boolean flags */
atomic_bool flag2;

atomic_int turn;   /* Atomic integer that holds the ID of the thread whose turn it is */
atomic_bool x;     /* Boolean variable to test mutual exclusion */

void __VERIFIER_assume(int);

void *thread_1(void *arg)
{
	atomic_store_explicit(&flag1, 1, mo_rel);
	atomic_store_explicit(&turn, 1, mo_rel);


	while (atomic_load_explicit(&flag2, mo_acq) == 1 &&
	       atomic_load_explicit(&turn, mo_acq) == 1)
	       ;

	/* critical section beginning */
	atomic_store_explicit(&x, 1, mo_rel);
	assert(atomic_load_explicit(&x, mo_acq) == 1);
	//atomic_load_explicit(&x, mo_acq);
	/* critical section ending */

	atomic_store_explicit(&flag1, 0, mo_rel);
	return NULL;
}

void *thread_2(void *arg)
{
	atomic_store_explicit(&flag2, 1, mo_rel);
	atomic_store_explicit(&turn, 0, mo_rel);

	while (atomic_load_explicit(&flag1, mo_acq) == 1 &&
			  atomic_load_explicit(&turn, mo_acq) == 0)
		;

	/* critical section beginning */
	atomic_store_explicit(&x, 2, mo_rel);
	assert(atomic_load_explicit(&x, mo_acq) == 2);
	//atomic_load_explicit(&x, mo_acq);
	/* critical section ending */

	atomic_store_explicit(&flag2, 0, mo_rel);
	return NULL;
}
