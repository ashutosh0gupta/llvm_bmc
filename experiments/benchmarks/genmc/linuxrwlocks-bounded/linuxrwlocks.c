#define OUTER_LB 2
#define INNER_LB 2
#define LB (OUTER_LB * INNER_LB)

#define RW_LOCK_BIAS            0x00100000
#define WRITE_LOCK_CMP          RW_LOCK_BIAS

/** Example implementation of linux rw lock along with 2 thread test
 *  driver... */

typedef union {
	atomic_int lock;
} rwlock_t;

static inline int read_can_lock(rwlock_t *lock)
{
	return atomic_load_explicit(&lock->lock, memory_order_relaxed) > 0;
}

static inline int write_can_lock(rwlock_t *lock)
{
	return atomic_load_explicit(&lock->lock, memory_order_relaxed) == RW_LOCK_BIAS;
}

static inline void read_lock(rwlock_t *rw)
{
	int priorvalue = atomic_fetch_sub_explicit(&rw->lock, 1, memory_order_acquire);
	for (int i = 0u; i <= OUTER_LB; i++) {
		if (i == OUTER_LB)
			return;
		if (priorvalue > 0)
			break;
		atomic_fetch_add_explicit(&rw->lock, 1, memory_order_relaxed);
		for (int j = 0u; j <= INNER_LB; j++) {
			if (j == INNER_LB)
				return;
			if (atomic_load_explicit(&rw->lock, memory_order_relaxed) <= 0)
				; //thrd_yield();
			else
				break;
		}
		priorvalue = atomic_fetch_sub_explicit(&rw->lock, 1, memory_order_acquire);
	}
}

static inline void write_lock(rwlock_t *rw)
{
	int priorvalue = atomic_fetch_sub_explicit(&rw->lock, RW_LOCK_BIAS, memory_order_acquire);
	for (int i = 0u; i <= OUTER_LB; i++) {
		if (i == OUTER_LB)
			return;
		if (priorvalue == RW_LOCK_BIAS)
			break;
		atomic_fetch_add_explicit(&rw->lock, RW_LOCK_BIAS, memory_order_relaxed);
		for (int j = 0u; j <= INNER_LB; j++) {
			if (j == INNER_LB)
				return;
			if (atomic_load_explicit(&rw->lock, memory_order_relaxed) != RW_LOCK_BIAS)
				; //thrd_yield();
			else
				break;
		}
		priorvalue = atomic_fetch_sub_explicit(&rw->lock, RW_LOCK_BIAS, memory_order_acquire);
	}
}

static inline int read_trylock(rwlock_t *rw)
{
	int priorvalue = atomic_fetch_sub_explicit(&rw->lock, 1, memory_order_acquire);
	if (priorvalue > 0)
		return 1;

	atomic_fetch_add_explicit(&rw->lock, 1, memory_order_relaxed);
	return 0;
}

static inline int write_trylock(rwlock_t *rw)
{
	int priorvalue = atomic_fetch_sub_explicit(&rw->lock, RW_LOCK_BIAS, memory_order_acquire);
	if (priorvalue == RW_LOCK_BIAS)
		return 1;

	atomic_fetch_add_explicit(&rw->lock, RW_LOCK_BIAS, memory_order_relaxed);
	return 0;
}

static inline void read_unlock(rwlock_t *rw)
{
	atomic_fetch_add_explicit(&rw->lock, 1, memory_order_release);
}

static inline void write_unlock(rwlock_t *rw)
{
	atomic_fetch_add_explicit(&rw->lock, RW_LOCK_BIAS, memory_order_release);
}

rwlock_t mylock;
int shareddata;

void *a(void *obj)
{
	int i;
	for(i = 0; i < 2; i++) {
		if ((i % 2) == 0) {
			read_lock(&mylock);
			/* load_32(&shareddata); */
			read_unlock(&mylock);
		} else {
			write_lock(&mylock);
			/* store_32(&shareddata,(unsigned int)i); */
			write_unlock(&mylock);
		}
	}
	return NULL;
}

void *b(void *obj)
{
	read_lock(&mylock);
	/* load_32(&shareddata); */
	read_unlock(&mylock);
	return NULL;
}

void *c(void *obj)
{
	write_lock(&mylock);
	/* store_32(&shareddata, 42); */
	write_unlock(&mylock);
	return NULL;
}
