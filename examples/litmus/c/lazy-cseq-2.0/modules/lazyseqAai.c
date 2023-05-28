#define THREADS <insert-maxthreads-here>
#define ROUNDS <insert-maxrounds-here>
#define STOP_VOID(A) return;
#define STOP_NONVOID(A) return 0;
#define IF(T,A,B) if ((__cs_pc[T] > A) || (A >= __cs_pc_cs)) goto B;
#ifndef NULL
#define NULL 0
#endif
