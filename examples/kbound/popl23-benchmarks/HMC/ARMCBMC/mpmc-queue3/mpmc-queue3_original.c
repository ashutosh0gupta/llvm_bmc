#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <assert.h>

#include <unistd.h>
#include <inttypes.h>
#include <stdatomic.h>

# define mo_acquire memory_order_acquire
# define mo_release memory_order_release
# define mo_acq_rel memory_order_acq_rel
# define mo_seq_cst memory_order_seq_cst


////////////////////////////////////////////////////////
//      FROM mpmc-queue.h                             //
////////////////////////////////////////////////////////

#define t_size sizeof(int32_t)

typedef int32_t t_element;


struct mpmc_boundq_1_alt
{

	// elements should generally be cache-line-size padded :
	t_element               m_array[t_size];

	// rdwr counts the reads & writes that have started
	atomic_uint    m_rdwr;
	// "read" and "written" count the number completed
	atomic_uint    m_read;
	atomic_uint    m_written;
};
typedef struct mpmc_boundq_1_alt mpmc_boundq_1_alt;

t_element *read_fetch(mpmc_boundq_1_alt *q)
{
	unsigned int rdwr = atomic_load_explicit(&q->m_rdwr, mo_acquire);
	unsigned int rd,wr;

	for(;;) {
		rd = (rdwr >> 16) & 0xFFFF;
		wr = rdwr & 0xFFFF;

		if (wr == rd) // empty
			return NULL;

		if (atomic_compare_exchange_weak_explicit(&q->m_rdwr, &rdwr, rdwr + (1 << 16),
							   mo_acq_rel, mo_acq_rel))
			break;
	}

	while ((atomic_load_explicit(&q->m_written, mo_acquire) & 0xFFFF) != wr)
		; // thrd_yield();

	t_element *p = &(q->m_array[rd % t_size]);
	return p;
}

void read_consume(mpmc_boundq_1_alt *q)
{
	atomic_fetch_add_explicit(&q->m_read, 1, mo_release);
}

t_element *write_prepare(mpmc_boundq_1_alt *q)
{
	unsigned int rdwr = atomic_load_explicit(&q->m_rdwr, mo_acquire);
	unsigned int rd,wr;

	for(;;) {
		rd = (rdwr>>16) & 0xFFFF;
		wr = rdwr & 0xFFFF;

		if (wr == ((rd + t_size) & 0xFFFF)) // full
			return NULL;

		if (atomic_compare_exchange_weak_explicit(&q->m_rdwr, &rdwr, (rd << 16) | ((wr + 1) & 0xFFFF),
							  mo_acq_rel, mo_acq_rel))
			break;
	}

	while ((atomic_load_explicit(&q->m_read, mo_acquire) & 0xFFFF) != rd )
		; // thrd_yield()

	t_element *p = &(q->m_array[wr % t_size]);
	return p;
}

void write_publish(mpmc_boundq_1_alt *q)
{
	atomic_fetch_add_explicit(&q->m_written, 1, mo_release);
}

////////////////////////////////////////////////////////
//      FROM mpmc-queue.c                             //
////////////////////////////////////////////////////////

#define MAXREADERS 3
#define MAXWRITERS 3
#define MAXRDWR 3

#define DEFAULT_READERS 1
#define DEFAULT_WRITERS 1
#define DEFAULT_RDWR 1

int readers = DEFAULT_READERS, writers = DEFAULT_WRITERS, rdwr = DEFAULT_RDWR;

struct mpmc_boundq_1_alt queue;

void *threadW(void *unused)
{
	int32_t *bin = write_prepare(&queue);
	*bin = 1;
	write_publish(&queue);
	return NULL;
}

void *threadR(void *unused)
{
	int32_t *bin;
	while ((bin = read_fetch(&queue)) != NULL) {
		// printf("Read: %d\n", load_32(bin));
		read_consume(&queue);
	}
	return NULL;
}

void *threadRW(void *unused)
{
	int32_t *bin = write_prepare(&queue);
	*bin = 1;
	write_publish(&queue);

	while ((bin = read_fetch(&queue)) != NULL) {
//		printf("Read: %d\n", load_32(bin));
		read_consume(&queue);
	}
	return NULL;
}


int main()
{
	pthread_t W[MAXWRITERS], R[MAXREADERS], RW[MAXRDWR];

//	printf("%d reader(s), %d writer(s)\n", readers, writers);

#ifndef CONFIG_MPMC_NO_INITIAL_ELEMENT
//	printf("Adding initial element\n");
	int32_t *bin = write_prepare(&queue);
//	store_32(bin, 17);
	*bin = 17;
	write_publish(&queue);
#endif

//	printf("Start threads\n");

	for (int i = 0; i < writers; i++)
		pthread_create(&W[i], NULL, threadW, NULL);
	for (int i = 0; i < readers; i++)
		pthread_create(&R[i], NULL, threadR, NULL);
	for (int i = 0; i < rdwr; i++)
		pthread_create(&RW[i], NULL, threadRW, NULL);

	for (int i = 0; i < writers; i++)
		pthread_join(W[i], NULL);
	for (int i = 0; i < readers; i++)
		pthread_join(R[i], NULL);
	for (int i = 0; i < rdwr; i++)
		pthread_join(RW[i], NULL);

	/* printf("Threads ended\n"); */

	return 0;
}

