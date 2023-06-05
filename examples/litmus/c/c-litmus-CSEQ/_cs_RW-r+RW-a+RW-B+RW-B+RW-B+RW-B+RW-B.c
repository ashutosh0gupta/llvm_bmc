/*
 *  generated by CSeq [ 0000 / 0000 ]
 * 
 *  instance version    {}
 *
 *  2023-06-04 12:27:58
 *
 *  params:
 *    -i /home/osboxes/llvm_bmc/llvm_bmc/examples/litmus/c/run-scripts/../c-litmus-CSEQ/RW-r+RW-a+RW-B+RW-B+RW-B+RW-B+RW-B.c, 
 *
 */
#define __cs_MUTEX_INITIALIZER -1
#define __cs_COND_INITIALIZER -1
#define __cs_RWLOCK_INITIALIZER -1
#define __cs_BARRIER_SERIAL_THREAD 0
#define __cs_CANCEL_ASYNCHRONOUS 0
#define __cs_CANCEL_ENABLE 0
#define __cs_CANCEL_DEFERRED 0
#define __cs_CANCEL_DISABLE 0
#define __cs_CANCELED 0
#define __cs_CREATE_DETACHED 0
#define __cs_CREATE_JOINABLE 0
#define __cs_EXPLICIT_SCHED 0
#define __cs_INHERIT_SCHED 0
#define __cs_MUTEX_DEFAULT 0
#define __cs_MUTEX_ERRORCHECK 0
#define __cs_MUTEX_NORMAL 0
#define __cs_MUTEX_RECURSIVE 0
#define __cs_MUTEX_ROBUST 0
#define __cs_MUTEX_STALLED 0
#define __cs_ONCE_INIT 0
#define __cs_PRIO_INHERIT 0
#define __cs_PRIO_NONE 0
#define __cs_PRIO_PROTECT 0
#define __cs_PROCESS_SHARED 0
#define __cs_PROCESS_PRIVATE 0
#define __cs_SCOPE_PROCESS 0
#define __cs_SCOPE_SYSTEM 0
#include <assert.h>
int __VERIFIER_nondet_int();
int nondet_int();
unsigned int __VERIFIER_nondet_uint();
unsigned int nondet_uint();
_Bool __VERIFIER_nondet_bool();
_Bool nondet_bool();
char __VERIFIER_nondet_char();
char nondet_char();
unsigned char __VERIFIER_nondet_uchar();
unsigned char nondet_uchar();
#define THREADS 7
#define ROUNDS 1
#define STOP_VOID(A) return;
#define STOP_NONVOID(A) return 0;
#define IF(T,A,B) if ((__cs_pc[T] > A) | (A >= __cs_pc_cs[T])) goto B;
                                        unsigned __CPROVER_bitvector[1] __cs_active_thread[8] = {1};
                                        unsigned __CPROVER_bitvector[5] __cs_pc[8];
                                        unsigned __CPROVER_bitvector[6] __cs_pc_cs[8];
                                        unsigned __CPROVER_bitvector[3] __cs_last_thread;
                                        unsigned __CPROVER_bitvector[5] __cs_thread_lines[8] = {21, 4, 4, 4, 4, 4, 4, 4};
                                        void *__cs_safe_malloc(unsigned int __cs_size)
                                        {
                                        void *__cs_ptr = (malloc(__cs_size));
                                        return __cs_ptr;
                                        }
                                        void __cs_init_scalar(void *__cs_var, unsigned int __cs_size)
                                        {
                                        if (__cs_size == (sizeof(int)))
                                        *((int *) __cs_var) = nondet_int();
                                                else
                                                {
                                        __cs_var = malloc(__cs_size);
                                                }
                                        }
                                        void __CSEQ_message(char *__cs_message)
                                        {
                                                ;
                                        }
                                        typedef int __cs_t;
                                        void *__cs_threadargs[8];
                                        void *__cs_thread_joinargs[8];
                                        int __cs_create(__cs_t *__cs_new_thread_id, void *__cs_attr, void *(*__cs_thread_function)(void *), void *__cs_arg, int __cs_threadID)
                                        {
                                        if (__cs_threadID > THREADS)
                                                        return 0;
                                        *__cs_new_thread_id = __cs_threadID;
                                        __cs_active_thread[__cs_threadID] = 1;
                                        __cs_threadargs[__cs_threadID] = __cs_arg;
                                        __CSEQ_message("thread spawned");
                                        return 0;
                                        }
                                        int __cs_join(__cs_t __cs_id, void **__cs_value_ptr)
                                        {
                                        __CPROVER_assume(__cs_pc[__cs_id] == __cs_thread_lines[__cs_id]);
                                        *__cs_value_ptr = __cs_thread_joinargs[__cs_id];
                                        return 0;
                                        }
                                        int __cs_exit(void *__cs_value_ptr, unsigned int __cs_thread_index)
                                        {
                                        __cs_thread_joinargs[__cs_thread_index] = __cs_value_ptr;
                                        return 0;
                                        }
                                        int __cs_self(void)
                                        {
                                                return 1;
                                        }
                                        typedef int __cs_mutex_t;
                                        int __cs_mutex_init(__cs_mutex_t *__cs_m, int __cs_val)
                                        {
                                        *__cs_m = -1;
                                        return 0;
                                        }
                                        int __cs_mutex_destroy(__cs_mutex_t *__cs_mutex_to_destroy)
                                        {
                                        __CPROVER_assert((*__cs_mutex_to_destroy) != 0, "attempt to destroy an uninitialized mutex");
                                        __CPROVER_assert((*__cs_mutex_to_destroy) != (-2), "attempt to destroy a previously destroyed mutex");
                                        __CPROVER_assert((*__cs_mutex_to_destroy) == (-1), "attempt to destroy a locked mutex");
                                        *__cs_mutex_to_destroy = -2;
                                        __CSEQ_message("lock destroyed");
                                        return 0;
                                        }
                                        int __cs_mutex_lock(__cs_mutex_t *__cs_mutex_to_lock, unsigned __CPROVER_bitvector[3] __cs_thread_index)
                                        {
                                        __CPROVER_assert((*__cs_mutex_to_lock) != 0, "attempt to lock an uninitialized mutex");
                                        __CPROVER_assert((*__cs_mutex_to_lock) != (-2), "attempt to lock a destroyed mutex");
                                        __CPROVER_assume((*__cs_mutex_to_lock) == (-1));
                                        *__cs_mutex_to_lock = __cs_thread_index + 1;
                                        __CSEQ_message("lock acquired");
                                        return 0;
                                        }
                                        int __cs_mutex_unlock(__cs_mutex_t *__cs_mutex_to_unlock, unsigned __CPROVER_bitvector[3] __cs_thread_index)
                                        {
                                        __CPROVER_assert((*__cs_mutex_to_unlock) != 0, "attempt to unlock an uninitialized mutex");
                                        __CPROVER_assert((*__cs_mutex_to_unlock) != (-2), "attempt to unlock a destroyed mutex");
                                        __CPROVER_assume((*__cs_mutex_to_unlock) == (__cs_thread_index + 1));
                                        *__cs_mutex_to_unlock = -1;
                                        __CSEQ_message("lock released");
                                        return 0;
                                        }
                                        typedef int __cs_cond_t;
                                        int __cs_cond_init(__cs_cond_t *__cs_cond_to_init, void *__cs_attr)
                                        {
                                        *__cs_cond_to_init = -1;
                                        return 0;
                                        }
                                        int __cs_cond_destroy(__cs_cond_t *__cs_cond_to_destroy)
                                        {
                                        *__cs_cond_to_destroy = -2;
                                        return 0;
                                        }
                                        int __cs_cond_wait_1(__cs_cond_t *__cs_cond_to_wait_for, __cs_mutex_t *__cs_m, unsigned int __cs_thread_index)
                                        {
                                        __CPROVER_assert((*__cs_cond_to_wait_for) != 0, "attempt to use an uninitialized conditional variable");
                                        __CPROVER_assert((*__cs_cond_to_wait_for) != (-2), "attempt to use a destroyed conditional variable");
                                        __cs_mutex_unlock(__cs_m, __cs_thread_index);
                                        return 0;
                                        }
                                        int __cs_cond_wait_2(__cs_cond_t *__cs_cond_to_wait_for, __cs_mutex_t *__cs_m, unsigned int __cs_thread_index)
                                        {
                                        __CPROVER_assume((*__cs_cond_to_wait_for) == 1);
                                        __cs_mutex_lock(__cs_m, __cs_thread_index);
                                        return 0;
                                        }
                                        int __cs_cond_signal(__cs_cond_t *__cs_cond_to_signal)
                                        {
                                        *__cs_cond_to_signal = 1;
                                        __CSEQ_message("conditional variable signal");
                                        return 0;
                                        }
                                        int __cs_cond_broadcast(__cs_cond_t *__cs_cond_to_broadcast)
                                        {
                                        *__cs_cond_to_broadcast = 1;
                                        __CSEQ_message("conditional variable broadcast");
                                        return 0;
                                        }
                                        typedef struct __cs_barrier_t
                                        {
                                        unsigned int init;
                                        unsigned int current;
                                        } __cs_barrier_t;
                                        int __cs_barrier_init(__cs_barrier_t *__cs_barrier_to_init, void *__cs_attr, unsigned int count)
                                        {
                                        __CPROVER_assert(count > 0, "count must be greater than 0");
                                        __cs_barrier_to_init->current = count;
                                        __cs_barrier_to_init->init = count;
                                        return 0;
                                        }
                                        int __cs_barrier_destroy(__cs_barrier_t *__cs_barrier_to_destroy)
                                        {
                                        __cs_barrier_to_destroy->init = -1;
                                        __cs_barrier_to_destroy->current = -1;
                                        return 0;
                                        }
                                        int __cs_barrier_wait_1(__cs_barrier_t *__cs_barrier_to_wait)
                                        {
                                        __CPROVER_assert(__cs_barrier_to_wait->init > 0, "attempt to use an uninitialized barrier variable");
                                        __cs_barrier_to_wait->current--;
                                        return 0;
                                        }
                                        int __cs_barrier_wait_2(__cs_barrier_t *__cs_barrier_to_wait)
                                        {
                                        __CPROVER_assert(__cs_barrier_to_wait->init > 0, "attempt to use an uninitialized barrier variable");
                                        __CPROVER_assume(__cs_barrier_to_wait->current == 0);
                                        __cs_barrier_to_wait->current = __cs_barrier_to_wait->init;
                                        return 0;
                                        }
                                        typedef int __cs_attr_t;
                                        struct sched_param
                                        {
                                        int sched_priority;
                                        };
                                        int __cs_attr_init(__cs_attr_t *t)
                                        {
                                                return 0;
                                        }
                                        int __cs_attr_destroy(__cs_attr_t *t)
                                        {
                                                return 0;
                                        }
                                        int __cs_attr_getdetachstate(const __cs_attr_t *t, int *s)
                                        {
                                                return 0;
                                        }
                                        int __cs_attr_getguardsize(const __cs_attr_t *t, unsigned int *s)
                                        {
                                                return 0;
                                        }
                                        int __cs_attr_getinheritsched(const __cs_attr_t *t, int *s)
                                        {
                                                return 0;
                                        }
                                        int __cs_attr_getschedparam(const __cs_attr_t *t, struct sched_param *s)
                                        {
                                                return 0;
                                        }
                                        int __cs_attr_getschedpolicy(const __cs_attr_t *t, int *s)
                                        {
                                                return 0;
                                        }
                                        int __cs_attr_getscope(const __cs_attr_t *t, int *s)
                                        {
                                                return 0;
                                        }
                                        int __cs_attr_getstackaddr(const __cs_attr_t *t, void **s)
                                        {
                                                return 0;
                                        }
                                        int __cs_attr_getstacksize(const __cs_attr_t *t, unsigned int *s)
                                        {
                                                return 0;
                                        }
                                        int __cs_attr_setdetachstate(__cs_attr_t *t, int s)
                                        {
                                                return 0;
                                        }
                                        int __cs_attr_setguardsize(__cs_attr_t *t, unsigned int s)
                                        {
                                                return 0;
                                        }
                                        int __cs_attr_setinheritsched(__cs_attr_t *t, int s)
                                        {
                                                return 0;
                                        }
                                        int __cs_attr_setschedparam(__cs_attr_t *t, const struct sched_param *s)
                                        {
                                                return 0;
                                        }
                                        int __cs_attr_setschedpolicy(__cs_attr_t *t, int s)
                                        {
                                                return 0;
                                        }
                                        int __cs_attr_setscope(__cs_attr_t *t, int s)
                                        {
                                                return 0;
                                        }
                                        int __cs_attr_setstackaddr(__cs_attr_t *t, void *s)
                                        {
                                                return 0;
                                        }
                                        int __cs_attr_setstacksize(__cs_attr_t *t, unsigned int s)
                                        {
                                                return 0;
                                        }
                                        int vars[7];
                                        int v_0_X0_1;
                                        int v_1_X0_1;
                                        int v_2_X0_1;
                                        int v_3_X0_1;
                                        int v_4_X0_1;
                                        int v_5_X0_1;
                                        int v_6_X0_1;
                                        void *t0_0(void *__cs_param_t0_arg)
                                        {
                                        label_1_t0_0:
                                                __CPROVER_assume(__cs_pc_cs[1] >= 1);
IF(1,0,tt0_0_1)
                                        ;
                                                ;
                                        static int __cs_local_t0_v3_W0;
tt0_0_1: IF(1,1,tt0_0_2)
                                        __cs_local_t0_v3_W0 = vars[1];
                                        ;
                                                ;
tt0_0_2: IF(1,2,tt0_0_3)
                                        vars[0] = 1;
                                        static int __cs_local_t0_v35;
                                        __cs_local_t0_v35 = __cs_local_t0_v3_W0 == 1;
tt0_0_3: IF(1,3,tt0_0_4)
                                        v_0_X0_1 = __cs_local_t0_v35;
                                        goto __exit_t0;
                                                ;
                                        __exit_t0:
                                                __CPROVER_assume(__cs_pc_cs[1] >= 4);
                                        ;
                                                ;
tt0_0_4: 
                                        __cs_exit(0, 1);
                                        }
                                        void *t1_0(void *__cs_param_t1_arg)
                                        {
                                        label_2_t1_0:
                                                __CPROVER_assume(__cs_pc_cs[2] >= 1);
IF(2,0,tt1_0_1)
                                        ;
                                                ;
                                        ;
                                                ;
                                        static int __cs_local_t1_v6_W0;
tt1_0_1: IF(2,1,tt1_0_2)
                                        __cs_local_t1_v6_W0 = vars[0];
tt1_0_2: IF(2,2,tt1_0_3)
                                        vars[2] = 1;
                                        static int __cs_local_t1_v36;
                                        __cs_local_t1_v36 = __cs_local_t1_v6_W0 == 1;
tt1_0_3: IF(2,3,tt1_0_4)
                                        v_1_X0_1 = __cs_local_t1_v36;
                                        goto __exit_t1;
                                                ;
                                        __exit_t1:
                                                __CPROVER_assume(__cs_pc_cs[2] >= 4);
                                        ;
                                                ;
tt1_0_4: 
                                        __cs_exit(0, 2);
                                        }
                                        void *t2_0(void *__cs_param_t2_arg)
                                        {
                                        label_3_t2_0:
                                                __CPROVER_assume(__cs_pc_cs[3] >= 1);
IF(3,0,tt2_0_1)
                                        ;
                                                ;
                                        static int __cs_local_t2_v9_W0;
tt2_0_1: IF(3,1,tt2_0_2)
                                        __cs_local_t2_v9_W0 = vars[2];
                                        ;
                                                ;
tt2_0_2: IF(3,2,tt2_0_3)
                                        vars[3] = 1;
                                        static int __cs_local_t2_v37;
                                        __cs_local_t2_v37 = __cs_local_t2_v9_W0 == 1;
tt2_0_3: IF(3,3,tt2_0_4)
                                        v_2_X0_1 = __cs_local_t2_v37;
                                        goto __exit_t2;
                                                ;
                                        __exit_t2:
                                                __CPROVER_assume(__cs_pc_cs[3] >= 4);
                                        ;
                                                ;
tt2_0_4: 
                                        __cs_exit(0, 3);
                                        }
                                        void *t3_0(void *__cs_param_t3_arg)
                                        {
                                        label_4_t3_0:
                                                __CPROVER_assume(__cs_pc_cs[4] >= 1);
IF(4,0,tt3_0_1)
                                        ;
                                                ;
                                        static int __cs_local_t3_v12_W0;
tt3_0_1: IF(4,1,tt3_0_2)
                                        __cs_local_t3_v12_W0 = vars[3];
                                        ;
                                                ;
tt3_0_2: IF(4,2,tt3_0_3)
                                        vars[4] = 1;
                                        static int __cs_local_t3_v38;
                                        __cs_local_t3_v38 = __cs_local_t3_v12_W0 == 1;
tt3_0_3: IF(4,3,tt3_0_4)
                                        v_3_X0_1 = __cs_local_t3_v38;
                                        goto __exit_t3;
                                                ;
                                        __exit_t3:
                                                __CPROVER_assume(__cs_pc_cs[4] >= 4);
                                        ;
                                                ;
tt3_0_4: 
                                        __cs_exit(0, 4);
                                        }
                                        void *t4_0(void *__cs_param_t4_arg)
                                        {
                                        label_5_t4_0:
                                                __CPROVER_assume(__cs_pc_cs[5] >= 1);
IF(5,0,tt4_0_1)
                                        ;
                                                ;
                                        static int __cs_local_t4_v15_W0;
tt4_0_1: IF(5,1,tt4_0_2)
                                        __cs_local_t4_v15_W0 = vars[4];
                                        ;
                                                ;
tt4_0_2: IF(5,2,tt4_0_3)
                                        vars[5] = 1;
                                        static int __cs_local_t4_v39;
                                        __cs_local_t4_v39 = __cs_local_t4_v15_W0 == 1;
tt4_0_3: IF(5,3,tt4_0_4)
                                        v_4_X0_1 = __cs_local_t4_v39;
                                        goto __exit_t4;
                                                ;
                                        __exit_t4:
                                                __CPROVER_assume(__cs_pc_cs[5] >= 4);
                                        ;
                                                ;
tt4_0_4: 
                                        __cs_exit(0, 5);
                                        }
                                        void *t5_0(void *__cs_param_t5_arg)
                                        {
                                        label_6_t5_0:
                                                __CPROVER_assume(__cs_pc_cs[6] >= 1);
IF(6,0,tt5_0_1)
                                        ;
                                                ;
                                        static int __cs_local_t5_v18_W0;
tt5_0_1: IF(6,1,tt5_0_2)
                                        __cs_local_t5_v18_W0 = vars[5];
                                        ;
                                                ;
tt5_0_2: IF(6,2,tt5_0_3)
                                        vars[6] = 1;
                                        static int __cs_local_t5_v40;
                                        __cs_local_t5_v40 = __cs_local_t5_v18_W0 == 1;
tt5_0_3: IF(6,3,tt5_0_4)
                                        v_5_X0_1 = __cs_local_t5_v40;
                                        goto __exit_t5;
                                                ;
                                        __exit_t5:
                                                __CPROVER_assume(__cs_pc_cs[6] >= 4);
                                        ;
                                                ;
tt5_0_4: 
                                        __cs_exit(0, 6);
                                        }
                                        void *t6_0(void *__cs_param_t6_arg)
                                        {
                                        label_7_t6_0:
                                                __CPROVER_assume(__cs_pc_cs[7] >= 1);
IF(7,0,tt6_0_1)
                                        ;
                                                ;
                                        static int __cs_local_t6_v21_W0;
tt6_0_1: IF(7,1,tt6_0_2)
                                        __cs_local_t6_v21_W0 = vars[6];
                                        ;
                                                ;
tt6_0_2: IF(7,2,tt6_0_3)
                                        vars[1] = 1;
                                        static int __cs_local_t6_v41;
                                        __cs_local_t6_v41 = __cs_local_t6_v21_W0 == 1;
tt6_0_3: IF(7,3,tt6_0_4)
                                        v_6_X0_1 = __cs_local_t6_v41;
                                        goto __exit_t6;
                                                ;
                                        __exit_t6:
                                                __CPROVER_assume(__cs_pc_cs[7] >= 4);
                                        ;
                                                ;
tt6_0_4: 
                                        __cs_exit(0, 7);
                                        }
                                        int main_thread(void)
                                        {
                                                int __cs_param_main_argc;
                                                char **__cs_param_main_argv;
IF(0,0,tmain_1)
                                        static __cs_t __cs_local_main_thr0;
                                        ;
                                                ;
                                        static __cs_t __cs_local_main_thr1;
                                        ;
                                                ;
                                        static __cs_t __cs_local_main_thr2;
                                        ;
                                                ;
                                        static __cs_t __cs_local_main_thr3;
                                        ;
                                                ;
                                        static __cs_t __cs_local_main_thr4;
                                        ;
                                                ;
                                        static __cs_t __cs_local_main_thr5;
                                        ;
                                                ;
                                        static __cs_t __cs_local_main_thr6;
                                        ;
                                                ;
                                        vars[6] = 0;
                                        vars[5] = 0;
                                        vars[4] = 0;
                                        vars[3] = 0;
                                        vars[2] = 0;
                                        vars[1] = 0;
                                        vars[0] = 0;
                                        v_0_X0_1 = 0;
                                        v_1_X0_1 = 0;
                                        v_2_X0_1 = 0;
                                        v_3_X0_1 = 0;
                                        v_4_X0_1 = 0;
                                        v_5_X0_1 = 0;
                                        v_6_X0_1 = 0;
                                        __cs_create(&__cs_local_main_thr0, 0, t0_0, 0, 1);
tmain_1: IF(0,1,tmain_2)
                                        __cs_create(&__cs_local_main_thr1, 0, t1_0, 0, 2);
tmain_2: IF(0,2,tmain_3)
                                        __cs_create(&__cs_local_main_thr2, 0, t2_0, 0, 3);
tmain_3: IF(0,3,tmain_4)
                                        __cs_create(&__cs_local_main_thr3, 0, t3_0, 0, 4);
tmain_4: IF(0,4,tmain_5)
                                        __cs_create(&__cs_local_main_thr4, 0, t4_0, 0, 5);
tmain_5: IF(0,5,tmain_6)
                                        __cs_create(&__cs_local_main_thr5, 0, t5_0, 0, 6);
tmain_6: IF(0,6,tmain_7)
                                        __cs_create(&__cs_local_main_thr6, 0, t6_0, 0, 7);
tmain_7: IF(0,7,tmain_8)
                                        __cs_join(__cs_local_main_thr0, 0);
tmain_8: IF(0,8,tmain_9)
                                        __cs_join(__cs_local_main_thr1, 0);
tmain_9: IF(0,9,tmain_10)
                                        __cs_join(__cs_local_main_thr2, 0);
tmain_10: IF(0,10,tmain_11)
                                        __cs_join(__cs_local_main_thr3, 0);
tmain_11: IF(0,11,tmain_12)
                                        __cs_join(__cs_local_main_thr4, 0);
tmain_12: IF(0,12,tmain_13)
                                        __cs_join(__cs_local_main_thr5, 0);
tmain_13: IF(0,13,tmain_14)
                                        __cs_join(__cs_local_main_thr6, 0);
                                        static int __cs_local_main_v22;
tmain_14: IF(0,14,tmain_15)
                                        __cs_local_main_v22 = v_0_X0_1;
                                        static int __cs_local_main_v23;
tmain_15: IF(0,15,tmain_16)
                                        __cs_local_main_v23 = v_1_X0_1;
                                        static int __cs_local_main_v24;
tmain_16: IF(0,16,tmain_17)
                                        __cs_local_main_v24 = v_2_X0_1;
                                        static int __cs_local_main_v25;
tmain_17: IF(0,17,tmain_18)
                                        __cs_local_main_v25 = v_3_X0_1;
                                        static int __cs_local_main_v26;
tmain_18: IF(0,18,tmain_19)
                                        __cs_local_main_v26 = v_4_X0_1;
                                        static int __cs_local_main_v27;
tmain_19: IF(0,19,tmain_20)
                                        __cs_local_main_v27 = v_5_X0_1;
                                        static int __cs_local_main_v28;
tmain_20: IF(0,20,tmain_21)
                                        __cs_local_main_v28 = v_6_X0_1;
                                        static int __cs_local_main_v29_conj;
                                        __cs_local_main_v29_conj = __cs_local_main_v27 & __cs_local_main_v28;
                                        static int __cs_local_main_v30_conj;
                                        __cs_local_main_v30_conj = __cs_local_main_v26 & __cs_local_main_v29_conj;
                                        static int __cs_local_main_v31_conj;
                                        __cs_local_main_v31_conj = __cs_local_main_v25 & __cs_local_main_v30_conj;
                                        static int __cs_local_main_v32_conj;
                                        __cs_local_main_v32_conj = __cs_local_main_v24 & __cs_local_main_v31_conj;
                                        static int __cs_local_main_v33_conj;
                                        __cs_local_main_v33_conj = __cs_local_main_v23 & __cs_local_main_v32_conj;
                                        static int __cs_local_main_v34_conj;
                                        __cs_local_main_v34_conj = __cs_local_main_v22 & __cs_local_main_v33_conj;
                                        ;
                                                ;
                                        static _Bool __cs_local_main___cs_tmp_if_cond_0;
                                        __cs_local_main___cs_tmp_if_cond_0 = __cs_local_main_v34_conj == 1;
                                        if (__cs_local_main___cs_tmp_if_cond_0)
                                                {
                                        assert(0);
                                                }
                                        ;
                                        goto __exit_main;
                                                ;
                                        __exit_main:
                                                __CPROVER_assume(__cs_pc_cs[0] >= 21);
                                        ;
                                                ;
tmain_21: 
                                        __cs_exit(0, 0);
                                        }
                                        int main(void)
                                        {
/* round  0 */
/* main */
                                        unsigned __CPROVER_bitvector[5] __cs_tmp_t0_r0;
                                        __cs_pc_cs[0] = __cs_tmp_t0_r0;
                                        __CPROVER_assume(__cs_pc_cs[0] > 0);
                                        __CPROVER_assume(__cs_pc_cs[0] <= 21);
                                        main_thread();
                                        __cs_pc[0] = __cs_pc_cs[0];
/* t0_0 */
                                        unsigned __CPROVER_bitvector[3] __cs_tmp_t1_r0;
                                        if (__cs_active_thread[1])
                                                {
                                        __cs_pc_cs[1] = __cs_tmp_t1_r0;
                                        __CPROVER_assume(__cs_pc_cs[1] <= 4);
                                        t0_0(__cs_threadargs[1]);
                                        __cs_pc[1] = __cs_pc_cs[1];
                                                }
/* t1_0 */
                                        unsigned __CPROVER_bitvector[3] __cs_tmp_t2_r0;
                                        if (__cs_active_thread[2])
                                                {
                                        __cs_pc_cs[2] = __cs_tmp_t2_r0;
                                        __CPROVER_assume(__cs_pc_cs[2] <= 4);
                                        t1_0(__cs_threadargs[2]);
                                        __cs_pc[2] = __cs_pc_cs[2];
                                                }
/* t2_0 */
                                        unsigned __CPROVER_bitvector[3] __cs_tmp_t3_r0;
                                        if (__cs_active_thread[3])
                                                {
                                        __cs_pc_cs[3] = __cs_tmp_t3_r0;
                                        __CPROVER_assume(__cs_pc_cs[3] <= 4);
                                        t2_0(__cs_threadargs[3]);
                                        __cs_pc[3] = __cs_pc_cs[3];
                                                }
/* t3_0 */
                                        unsigned __CPROVER_bitvector[3] __cs_tmp_t4_r0;
                                        if (__cs_active_thread[4])
                                                {
                                        __cs_pc_cs[4] = __cs_tmp_t4_r0;
                                        __CPROVER_assume(__cs_pc_cs[4] <= 4);
                                        t3_0(__cs_threadargs[4]);
                                        __cs_pc[4] = __cs_pc_cs[4];
                                                }
/* t4_0 */
                                        unsigned __CPROVER_bitvector[3] __cs_tmp_t5_r0;
                                        if (__cs_active_thread[5])
                                                {
                                        __cs_pc_cs[5] = __cs_tmp_t5_r0;
                                        __CPROVER_assume(__cs_pc_cs[5] <= 4);
                                        t4_0(__cs_threadargs[5]);
                                        __cs_pc[5] = __cs_pc_cs[5];
                                                }
/* t5_0 */
                                        unsigned __CPROVER_bitvector[3] __cs_tmp_t6_r0;
                                        if (__cs_active_thread[6])
                                                {
                                        __cs_pc_cs[6] = __cs_tmp_t6_r0;
                                        __CPROVER_assume(__cs_pc_cs[6] <= 4);
                                        t5_0(__cs_threadargs[6]);
                                        __cs_pc[6] = __cs_pc_cs[6];
                                                }
/* t6_0 */
                                        unsigned __CPROVER_bitvector[3] __cs_tmp_t7_r0;
                                        if (__cs_active_thread[7])
                                                {
                                        __cs_pc_cs[7] = __cs_tmp_t7_r0;
                                        __CPROVER_assume(__cs_pc_cs[7] <= 4);
                                        t6_0(__cs_threadargs[7]);
                                        __cs_pc[7] = __cs_pc_cs[7];
                                                }
                                        unsigned __CPROVER_bitvector[5] __cs_tmp_t0_r1;
                                        if (__cs_active_thread[0] == 1)
                                                {
                                        __cs_pc_cs[0] = __cs_pc[0] + __cs_tmp_t0_r1;
                                        __CPROVER_assume(__cs_pc_cs[0] >= __cs_pc[0]);
                                        __CPROVER_assume(__cs_pc_cs[0] <= 21);
                                        main_thread();
                                                }
                                        return 0;
                                        }
                                        
