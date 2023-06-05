/*
 *  generated by CSeq [ 0000 / 0000 ]
 * 
 *  instance version    {}
 *
 *  2023-06-04 11:33:48
 *
 *  params:
 *    -i /home/osboxes/llvm_bmc/llvm_bmc/examples/litmus/c/run-scripts/../c-litmus-CSEQ/MP+dmb.sy+pos-addr-rfi-pos-addr.c, 
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
#define THREADS 2
#define ROUNDS 1
#define STOP_VOID(A) return;
#define STOP_NONVOID(A) return 0;
#define IF(T,A,B) if ((__cs_pc[T] > A) | (A >= __cs_pc_cs[T])) goto B;
                                        unsigned __CPROVER_bitvector[1] __cs_active_thread[3] = {1};
                                        unsigned __CPROVER_bitvector[4] __cs_pc[3];
                                        unsigned __CPROVER_bitvector[5] __cs_pc_cs[3];
                                        unsigned __CPROVER_bitvector[2] __cs_last_thread;
                                        unsigned __CPROVER_bitvector[4] __cs_thread_lines[3] = {12, 3, 12};
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
                                        void *__cs_threadargs[3];
                                        void *__cs_thread_joinargs[3];
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
                                        int __cs_mutex_lock(__cs_mutex_t *__cs_mutex_to_lock, unsigned __CPROVER_bitvector[2] __cs_thread_index)
                                        {
                                        __CPROVER_assert((*__cs_mutex_to_lock) != 0, "attempt to lock an uninitialized mutex");
                                        __CPROVER_assert((*__cs_mutex_to_lock) != (-2), "attempt to lock a destroyed mutex");
                                        __CPROVER_assume((*__cs_mutex_to_lock) == (-1));
                                        *__cs_mutex_to_lock = __cs_thread_index + 1;
                                        __CSEQ_message("lock acquired");
                                        return 0;
                                        }
                                        int __cs_mutex_unlock(__cs_mutex_t *__cs_mutex_to_unlock, unsigned __CPROVER_bitvector[2] __cs_thread_index)
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
                                        int vars[3];
                                        int v_1_X0_1;
                                        int v_1_X2_1;
                                        int v_1_X6_1;
                                        int v_1_X7_1;
                                        int v_1_X9_0;
                                        void *t0_0(void *__cs_param_t0_arg)
                                        {
                                        label_1_t0_0:
                                                __CPROVER_assume(__cs_pc_cs[1] >= 1);
IF(1,0,tt0_0_1)
                                        ;
                                                ;
tt0_0_1: IF(1,1,tt0_0_2)
                                        vars[0] = 1;
                                        ;
                                                ;
tt0_0_2: IF(1,2,tt0_0_3)
                                        vars[1] = 1;
                                        goto __exit_t0;
                                                ;
                                        __exit_t0:
                                                __CPROVER_assume(__cs_pc_cs[1] >= 3);
                                        ;
                                                ;
tt0_0_3: 
                                        __cs_exit(0, 1);
                                        }
                                        void *t1_0(void *__cs_param_t1_arg)
                                        {
                                        label_2_t1_0:
                                                __CPROVER_assume(__cs_pc_cs[2] >= 1);
IF(2,0,tt1_0_1)
                                        ;
                                                ;
                                        static int __cs_local_t1_v3_W0;
tt1_0_1: IF(2,1,tt1_0_2)
                                        __cs_local_t1_v3_W0 = vars[1];
                                        static int __cs_local_t1_v6_W2;
tt1_0_2: IF(2,2,tt1_0_3)
                                        __cs_local_t1_v6_W2 = vars[1];
                                        static int __cs_local_t1_v7_W3;
                                        __cs_local_t1_v7_W3 = __cs_local_t1_v6_W2 ^ __cs_local_t1_v6_W2;
tt1_0_3: IF(2,3,tt1_0_4)
                                        vars[2 + __cs_local_t1_v7_W3] = 1;
                                        static int __cs_local_t1_v10_W6;
tt1_0_4: IF(2,4,tt1_0_5)
                                        __cs_local_t1_v10_W6 = vars[2];
                                        static int __cs_local_t1_v13_W7;
tt1_0_5: IF(2,5,tt1_0_6)
                                        __cs_local_t1_v13_W7 = vars[2];
                                        static int __cs_local_t1_v14_W8;
                                        __cs_local_t1_v14_W8 = __cs_local_t1_v13_W7 ^ __cs_local_t1_v13_W7;
                                        static int __cs_local_t1_v17_W9;
tt1_0_6: IF(2,6,tt1_0_7)
                                        __cs_local_t1_v17_W9 = vars[0 + __cs_local_t1_v14_W8];
                                        static int __cs_local_t1_v36;
                                        __cs_local_t1_v36 = __cs_local_t1_v3_W0 == 1;
tt1_0_7: IF(2,7,tt1_0_8)
                                        v_1_X0_1 = __cs_local_t1_v36;
                                        static int __cs_local_t1_v37;
                                        __cs_local_t1_v37 = __cs_local_t1_v6_W2 == 1;
tt1_0_8: IF(2,8,tt1_0_9)
                                        v_1_X2_1 = __cs_local_t1_v37;
                                        static int __cs_local_t1_v38;
                                        __cs_local_t1_v38 = __cs_local_t1_v10_W6 == 1;
tt1_0_9: IF(2,9,tt1_0_10)
                                        v_1_X6_1 = __cs_local_t1_v38;
                                        static int __cs_local_t1_v39;
                                        __cs_local_t1_v39 = __cs_local_t1_v13_W7 == 1;
tt1_0_10: IF(2,10,tt1_0_11)
                                        v_1_X7_1 = __cs_local_t1_v39;
                                        static int __cs_local_t1_v40;
                                        __cs_local_t1_v40 = __cs_local_t1_v17_W9 == 0;
tt1_0_11: IF(2,11,tt1_0_12)
                                        v_1_X9_0 = __cs_local_t1_v40;
                                        goto __exit_t1;
                                                ;
                                        __exit_t1:
                                                __CPROVER_assume(__cs_pc_cs[2] >= 12);
                                        ;
                                                ;
tt1_0_12: 
                                        __cs_exit(0, 2);
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
                                        vars[2] = 0;
                                        vars[1] = 0;
                                        vars[0] = 0;
                                        v_1_X0_1 = 0;
                                        v_1_X2_1 = 0;
                                        v_1_X6_1 = 0;
                                        v_1_X7_1 = 0;
                                        v_1_X9_0 = 0;
                                        __cs_create(&__cs_local_main_thr0, 0, t0_0, 0, 1);
tmain_1: IF(0,1,tmain_2)
                                        __cs_create(&__cs_local_main_thr1, 0, t1_0, 0, 2);
tmain_2: IF(0,2,tmain_3)
                                        __cs_join(__cs_local_main_thr0, 0);
tmain_3: IF(0,3,tmain_4)
                                        __cs_join(__cs_local_main_thr1, 0);
                                        static int __cs_local_main_v18;
tmain_4: IF(0,4,tmain_5)
                                        __cs_local_main_v18 = vars[0];
                                        static int __cs_local_main_v19;
                                        __cs_local_main_v19 = __cs_local_main_v18 == 1;
                                        static int __cs_local_main_v20;
tmain_5: IF(0,5,tmain_6)
                                        __cs_local_main_v20 = vars[1];
                                        static int __cs_local_main_v21;
                                        __cs_local_main_v21 = __cs_local_main_v20 == 1;
                                        static int __cs_local_main_v22;
tmain_6: IF(0,6,tmain_7)
                                        __cs_local_main_v22 = vars[2];
                                        static int __cs_local_main_v23;
                                        __cs_local_main_v23 = __cs_local_main_v22 == 1;
                                        static int __cs_local_main_v24;
tmain_7: IF(0,7,tmain_8)
                                        __cs_local_main_v24 = v_1_X0_1;
                                        static int __cs_local_main_v25;
tmain_8: IF(0,8,tmain_9)
                                        __cs_local_main_v25 = v_1_X2_1;
                                        static int __cs_local_main_v26;
tmain_9: IF(0,9,tmain_10)
                                        __cs_local_main_v26 = v_1_X6_1;
                                        static int __cs_local_main_v27;
tmain_10: IF(0,10,tmain_11)
                                        __cs_local_main_v27 = v_1_X7_1;
                                        static int __cs_local_main_v28;
tmain_11: IF(0,11,tmain_12)
                                        __cs_local_main_v28 = v_1_X9_0;
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
                                        __cs_local_main_v34_conj = __cs_local_main_v21 & __cs_local_main_v33_conj;
                                        static int __cs_local_main_v35_conj;
                                        __cs_local_main_v35_conj = __cs_local_main_v19 & __cs_local_main_v34_conj;
                                        ;
                                                ;
                                        static _Bool __cs_local_main___cs_tmp_if_cond_0;
                                        __cs_local_main___cs_tmp_if_cond_0 = __cs_local_main_v35_conj == 1;
                                        if (__cs_local_main___cs_tmp_if_cond_0)
                                                {
                                        assert(0);
                                                }
                                        ;
                                        goto __exit_main;
                                                ;
                                        __exit_main:
                                                __CPROVER_assume(__cs_pc_cs[0] >= 12);
                                        ;
                                                ;
tmain_12: 
                                        __cs_exit(0, 0);
                                        }
                                        int main(void)
                                        {
/* round  0 */
/* main */
                                        unsigned __CPROVER_bitvector[4] __cs_tmp_t0_r0;
                                        __cs_pc_cs[0] = __cs_tmp_t0_r0;
                                        __CPROVER_assume(__cs_pc_cs[0] > 0);
                                        __CPROVER_assume(__cs_pc_cs[0] <= 12);
                                        main_thread();
                                        __cs_pc[0] = __cs_pc_cs[0];
/* t0_0 */
                                        unsigned __CPROVER_bitvector[2] __cs_tmp_t1_r0;
                                        if (__cs_active_thread[1])
                                                {
                                        __cs_pc_cs[1] = __cs_tmp_t1_r0;
                                        __CPROVER_assume(__cs_pc_cs[1] <= 3);
                                        t0_0(__cs_threadargs[1]);
                                        __cs_pc[1] = __cs_pc_cs[1];
                                                }
/* t1_0 */
                                        unsigned __CPROVER_bitvector[4] __cs_tmp_t2_r0;
                                        if (__cs_active_thread[2])
                                                {
                                        __cs_pc_cs[2] = __cs_tmp_t2_r0;
                                        __CPROVER_assume(__cs_pc_cs[2] <= 12);
                                        t1_0(__cs_threadargs[2]);
                                        __cs_pc[2] = __cs_pc_cs[2];
                                                }
                                        unsigned __CPROVER_bitvector[4] __cs_tmp_t0_r1;
                                        if (__cs_active_thread[0] == 1)
                                                {
                                        __cs_pc_cs[0] = __cs_pc[0] + __cs_tmp_t0_r1;
                                        __CPROVER_assume(__cs_pc_cs[0] >= __cs_pc[0]);
                                        __CPROVER_assume(__cs_pc_cs[0] <= 12);
                                        main_thread();
                                                }
                                        return 0;
                                        }
                                        
