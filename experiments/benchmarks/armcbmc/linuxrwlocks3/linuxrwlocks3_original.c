#include <stdlib.h>
#include <pthread.h>
#include <stdatomic.h>

#ifdef MAKE_ACCESSES_SC
# define mo_relaxed memory_order_seq_cst
# define mo_acquire memory_order_seq_cst
# define mo_release memory_order_seq_cst
#else
# define mo_relaxed memory_order_relaxed
# define mo_acquire memory_order_acquire
# define mo_release memory_order_release
#endif

#define MAXREADERS 3
#define MAXWRITERS 3
#define MAXRDWR 3

#ifdef CONFIG_RWLOCK_READERS
#define DEFAULT_READERS (CONFIG_RWLOCK_READERS)
#else
#define DEFAULT_READERS 1
#endif

#ifdef CONFIG_RWLOCK_WRITERS
#define DEFAULT_WRITERS (CONFIG_RWLOCK_WRITERS)
#else
#define DEFAULT_WRITERS 1
#endif

#ifdef CONFIG_RWLOCK_RDWR
#define DEFAULT_RDWR (CONFIG_RWLOCK_RDWR)
#else
#define DEFAULT_RDWR 0
#endif

int readers = DEFAULT_READERS, writers = DEFAULT_WRITERS, rdwr = DEFAULT_RDWR;


#define RW_LOCK_BIAS            0x00100000
#define WRITE_LOCK_CMP          RW_LOCK_BIAS

/** Example implementation of linux rw lock along with 2 thread test
 *  driver... */

typedef union {
	atomic_int lock;
} rwlock_t;

static inline int read_can_lock(rwlock_t *lock)
{
	return atomic_load_explicit(&lock->lock, mo_relaxed) > 0;
}

static inline int write_can_lock(rwlock_t *lock)
{
	return atomic_load_explicit(&lock->lock, mo_relaxed) == RW_LOCK_BIAS;
}

static inline void read_lock(rwlock_t *rw)
{
	int priorvalue = atomic_fetch_sub_explicit(&rw->lock, 1, mo_acquire);
	while (priorvalue <= 0) {
		atomic_fetch_add_explicit(&rw->lock, 1, mo_relaxed);
		while (atomic_load_explicit(&rw->lock, mo_relaxed) <= 0)
			; //thrd_yield();
		priorvalue = atomic_fetch_sub_explicit(&rw->lock, 1, mo_acquire);
	}
}

static inline void write_lock(rwlock_t *rw)
{
	int priorvalue = atomic_fetch_sub_explicit(&rw->lock, RW_LOCK_BIAS, mo_acquire);
	while (priorvalue != RW_LOCK_BIAS) {
		atomic_fetch_add_explicit(&rw->lock, RW_LOCK_BIAS, mo_relaxed);
		while (atomic_load_explicit(&rw->lock, mo_relaxed) != RW_LOCK_BIAS)
			; //thrd_yield();
		priorvalue = atomic_fetch_sub_explicit(&rw->lock, RW_LOCK_BIAS, mo_acquire);
	}
}

static inline int read_trylock(rwlock_t *rw)
{
	int priorvalue = atomic_fetch_sub_explicit(&rw->lock, 1, mo_acquire);
	if (priorvalue > 0)
		return 1;

	atomic_fetch_add_explicit(&rw->lock, 1, mo_relaxed);
	return 0;
}

static inline int write_trylock(rwlock_t *rw)
{
	int priorvalue = atomic_fetch_sub_explicit(&rw->lock, RW_LOCK_BIAS, mo_acquire);
	if (priorvalue == RW_LOCK_BIAS)
		return 1;

	atomic_fetch_add_explicit(&rw->lock, RW_LOCK_BIAS, mo_relaxed);
	return 0;
}

static inline void read_unlock(rwlock_t *rw)
{
	atomic_fetch_add_explicit(&rw->lock, 1, mo_release);
}

static inline void write_unlock(rwlock_t *rw)
{
	atomic_fetch_add_explicit(&rw->lock, RW_LOCK_BIAS, mo_release);
}

rwlock_t mylock;
int shareddata;

void *threadR(void *arg)
{
	read_lock(&mylock);
	int r = shareddata;
	read_unlock(&mylock);
	return NULL;
}

void *threadW(void *arg)
{
	write_lock(&mylock);
	shareddata = 42;
	write_unlock(&mylock);
	return NULL;
}

void *threadRW(void *arg)
{
	for (int i = 0; i < 2; i++) {
		if ((i % 2) == 0) {
			read_lock(&mylock);
			int r = shareddata;
			read_unlock(&mylock);
		} else {
			write_lock(&mylock);
			shareddata = i;
			write_unlock(&mylock);
		}
	}
	return NULL;
}

int main()
{
	pthread_t tr, tw, trw;

	atomic_init(&mylock.lock, RW_LOCK_BIAS);
	pthread_create(&tr, NULL, threadR, NULL);
	pthread_create(&tw, NULL, threadW, NULL);
	pthread_create(&trw, NULL, threadRW, NULL);

	pthread_join(tr, NULL);
	pthread_join(tw, NULL);
	pthread_join(trw, NULL);


	return 0;
}
