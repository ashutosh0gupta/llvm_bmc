

#ifndef N
#  define N 3
#endif

#define NumOfExtra  (((N / 10) == 0) ? 1 : (N / 10))
#define MaximumCapacity (N - NumOfExtra)

// shared variables
atomic_int numberOfSeatsSold;
atomic_int stopSales;
atomic_int numOfTickets;

void * salethread(void *arg)
{
  if (!atomic_load_explicit(&stopSales, memory_order_seq_cst)) {
    int _numberOfSeatsSold = atomic_load_explicit(&numberOfSeatsSold, memory_order_seq_cst);
    if (_numberOfSeatsSold >= MaximumCapacity) {
      atomic_store_explicit(&stopSales, 1, memory_order_seq_cst);
    } else {
      atomic_store_explicit(&numberOfSeatsSold, _numberOfSeatsSold+1, memory_order_seq_cst);
    }
  }
  
  return NULL;
}


