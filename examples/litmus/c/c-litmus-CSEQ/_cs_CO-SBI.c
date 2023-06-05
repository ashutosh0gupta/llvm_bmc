/*
 *  generated by CSeq [ 0000 / 0000 ]
 * 
 *  instance version    {}
 *
 *  2023-06-04 11:46:54
 *
 *  params:
 *    -i /home/osboxes/llvm_bmc/llvm_bmc/examples/litmus/c/run-scripts/../c-litmus-CSEQ/CO-SBI.c, 
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
                                        unsigned __CPROVER_bitvector[5] __cs_pc[3];
                                        unsigned __CPROVER_bitvector[6] __cs_pc_cs[3];
                                        unsigned __CPROVER_bitvector[2] __cs_last_thread;
                                        unsigned __CPROVER_bitvector[5] __cs_thread_lines[3] = {20, 8, 8};
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
                                        int vars[1];
                                        int v_1_X3_2;
                                        int v_1_X2_2;
                                        int v_0_X3_2;
                                        int v_0_X2_2;
                                        int v_0_X2_1;
                                        int v_0_X3_1;
                                        int v_1_X3_1;
                                        int v_1_X2_1;
                                        void *t0_0(void *__cs_param_t0_arg)
                                        {
                                        label_1_t0_0:
                                                __CPROVER_assume(__cs_pc_cs[1] >= 1);
IF(1,0,tt0_0_1)
                                        ;
                                                ;
tt0_0_1: IF(1,1,tt0_0_2)
                                        vars[0] = 1;
                                        static int __cs_local_t0_v3_W2;
tt0_0_2: IF(1,2,tt0_0_3)
                                        __cs_local_t0_v3_W2 = vars[0];
                                        static int __cs_local_t0_v6_W3;
tt0_0_3: IF(1,3,tt0_0_4)
                                        __cs_local_t0_v6_W3 = vars[0];
                                        static int __cs_local_t0_v48;
                                        __cs_local_t0_v48 = __cs_local_t0_v6_W3 == 2;
tt0_0_4: IF(1,4,tt0_0_5)
                                        v_0_X3_2 = __cs_local_t0_v48;
                                        static int __cs_local_t0_v49;
                                        __cs_local_t0_v49 = __cs_local_t0_v3_W2 == 2;
tt0_0_5: IF(1,5,tt0_0_6)
                                        v_0_X2_2 = __cs_local_t0_v49;
                                        static int __cs_local_t0_v50;
                                        __cs_local_t0_v50 = __cs_local_t0_v3_W2 == 1;
tt0_0_6: IF(1,6,tt0_0_7)
                                        v_0_X2_1 = __cs_local_t0_v50;
                                        static int __cs_local_t0_v51;
                                        __cs_local_t0_v51 = __cs_local_t0_v6_W3 == 1;
tt0_0_7: IF(1,7,tt0_0_8)
                                        v_0_X3_1 = __cs_local_t0_v51;
                                        goto __exit_t0;
                                                ;
                                        __exit_t0:
                                                __CPROVER_assume(__cs_pc_cs[1] >= 8);
                                        ;
                                                ;
tt0_0_8: 
                                        __cs_exit(0, 1);
                                        }
                                        void *t1_0(void *__cs_param_t1_arg)
                                        {
                                        label_2_t1_0:
                                                __CPROVER_assume(__cs_pc_cs[2] >= 1);
IF(2,0,tt1_0_1)
                                        ;
                                                ;
tt1_0_1: IF(2,1,tt1_0_2)
                                        vars[0] = 2;
                                        static int __cs_local_t1_v9_W2;
tt1_0_2: IF(2,2,tt1_0_3)
                                        __cs_local_t1_v9_W2 = vars[0];
                                        static int __cs_local_t1_v12_W3;
tt1_0_3: IF(2,3,tt1_0_4)
                                        __cs_local_t1_v12_W3 = vars[0];
                                        static int __cs_local_t1_v46;
                                        __cs_local_t1_v46 = __cs_local_t1_v12_W3 == 2;
tt1_0_4: IF(2,4,tt1_0_5)
                                        v_1_X3_2 = __cs_local_t1_v46;
                                        static int __cs_local_t1_v47;
                                        __cs_local_t1_v47 = __cs_local_t1_v9_W2 == 2;
tt1_0_5: IF(2,5,tt1_0_6)
                                        v_1_X2_2 = __cs_local_t1_v47;
                                        static int __cs_local_t1_v52;
                                        __cs_local_t1_v52 = __cs_local_t1_v12_W3 == 1;
tt1_0_6: IF(2,6,tt1_0_7)
                                        v_1_X3_1 = __cs_local_t1_v52;
                                        static int __cs_local_t1_v53;
                                        __cs_local_t1_v53 = __cs_local_t1_v9_W2 == 1;
tt1_0_7: IF(2,7,tt1_0_8)
                                        v_1_X2_1 = __cs_local_t1_v53;
                                        goto __exit_t1;
                                                ;
                                        __exit_t1:
                                                __CPROVER_assume(__cs_pc_cs[2] >= 8);
                                        ;
                                                ;
tt1_0_8: 
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
                                        vars[0] = 0;
                                        v_1_X3_2 = 0;
                                        v_1_X2_2 = 0;
                                        v_0_X3_2 = 0;
                                        v_0_X2_2 = 0;
                                        v_0_X2_1 = 0;
                                        v_0_X3_1 = 0;
                                        v_1_X3_1 = 0;
                                        v_1_X2_1 = 0;
                                        __cs_create(&__cs_local_main_thr0, 0, t0_0, 0, 1);
tmain_1: IF(0,1,tmain_2)
                                        __cs_create(&__cs_local_main_thr1, 0, t1_0, 0, 2);
tmain_2: IF(0,2,tmain_3)
                                        __cs_join(__cs_local_main_thr0, 0);
tmain_3: IF(0,3,tmain_4)
                                        __cs_join(__cs_local_main_thr1, 0);
                                        static int __cs_local_main_v13;
tmain_4: IF(0,4,tmain_5)
                                        __cs_local_main_v13 = vars[0];
                                        static int __cs_local_main_v14;
                                        __cs_local_main_v14 = __cs_local_main_v13 == 2;
                                        static int __cs_local_main_v15;
tmain_5: IF(0,5,tmain_6)
                                        __cs_local_main_v15 = v_1_X3_2;
                                        static int __cs_local_main_v16;
tmain_6: IF(0,6,tmain_7)
                                        __cs_local_main_v16 = v_1_X2_2;
                                        static int __cs_local_main_v17;
tmain_7: IF(0,7,tmain_8)
                                        __cs_local_main_v17 = v_0_X3_2;
                                        static int __cs_local_main_v18;
tmain_8: IF(0,8,tmain_9)
                                        __cs_local_main_v18 = v_0_X2_2;
                                        static int __cs_local_main_v19;
tmain_9: IF(0,9,tmain_10)
                                        __cs_local_main_v19 = v_0_X2_1;
                                        static int __cs_local_main_v20_disj;
                                        __cs_local_main_v20_disj = __cs_local_main_v18 | __cs_local_main_v19;
                                        static int __cs_local_main_v21_conj;
                                        __cs_local_main_v21_conj = __cs_local_main_v17 & __cs_local_main_v20_disj;
                                        static int __cs_local_main_v22;
tmain_10: IF(0,10,tmain_11)
                                        __cs_local_main_v22 = v_0_X3_1;
                                        static int __cs_local_main_v23;
tmain_11: IF(0,11,tmain_12)
                                        __cs_local_main_v23 = v_0_X2_1;
                                        static int __cs_local_main_v24_conj;
                                        __cs_local_main_v24_conj = __cs_local_main_v22 & __cs_local_main_v23;
                                        static int __cs_local_main_v25_disj;
                                        __cs_local_main_v25_disj = __cs_local_main_v21_conj | __cs_local_main_v24_conj;
                                        static int __cs_local_main_v26_conj;
                                        __cs_local_main_v26_conj = __cs_local_main_v16 & __cs_local_main_v25_disj;
                                        static int __cs_local_main_v27_conj;
                                        __cs_local_main_v27_conj = __cs_local_main_v15 & __cs_local_main_v26_conj;
                                        static int __cs_local_main_v28_conj;
                                        __cs_local_main_v28_conj = __cs_local_main_v14 & __cs_local_main_v27_conj;
                                        static int __cs_local_main_v29;
tmain_12: IF(0,12,tmain_13)
                                        __cs_local_main_v29 = vars[0];
                                        static int __cs_local_main_v30;
                                        __cs_local_main_v30 = __cs_local_main_v29 == 1;
                                        static int __cs_local_main_v31;
tmain_13: IF(0,13,tmain_14)
                                        __cs_local_main_v31 = v_0_X3_1;
                                        static int __cs_local_main_v32;
tmain_14: IF(0,14,tmain_15)
                                        __cs_local_main_v32 = v_0_X2_1;
                                        static int __cs_local_main_v33;
tmain_15: IF(0,15,tmain_16)
                                        __cs_local_main_v33 = v_1_X3_2;
                                        static int __cs_local_main_v34;
tmain_16: IF(0,16,tmain_17)
                                        __cs_local_main_v34 = v_1_X2_2;
                                        static int __cs_local_main_v35_conj;
                                        __cs_local_main_v35_conj = __cs_local_main_v33 & __cs_local_main_v34;
                                        static int __cs_local_main_v36;
tmain_17: IF(0,17,tmain_18)
                                        __cs_local_main_v36 = v_1_X3_1;
                                        static int __cs_local_main_v37;
tmain_18: IF(0,18,tmain_19)
                                        __cs_local_main_v37 = v_1_X2_2;
                                        static int __cs_local_main_v38;
tmain_19: IF(0,19,tmain_20)
                                        __cs_local_main_v38 = v_1_X2_1;
                                        static int __cs_local_main_v39_disj;
                                        __cs_local_main_v39_disj = __cs_local_main_v37 | __cs_local_main_v38;
                                        static int __cs_local_main_v40_conj;
                                        __cs_local_main_v40_conj = __cs_local_main_v36 & __cs_local_main_v39_disj;
                                        static int __cs_local_main_v41_disj;
                                        __cs_local_main_v41_disj = __cs_local_main_v35_conj | __cs_local_main_v40_conj;
                                        static int __cs_local_main_v42_conj;
                                        __cs_local_main_v42_conj = __cs_local_main_v32 & __cs_local_main_v41_disj;
                                        static int __cs_local_main_v43_conj;
                                        __cs_local_main_v43_conj = __cs_local_main_v31 & __cs_local_main_v42_conj;
                                        static int __cs_local_main_v44_conj;
                                        __cs_local_main_v44_conj = __cs_local_main_v30 & __cs_local_main_v43_conj;
                                        static int __cs_local_main_v45_disj;
                                        __cs_local_main_v45_disj = __cs_local_main_v28_conj | __cs_local_main_v44_conj;
                                        ;
                                                ;
                                        static _Bool __cs_local_main___cs_tmp_if_cond_0;
                                        __cs_local_main___cs_tmp_if_cond_0 = __cs_local_main_v45_disj == 0;
                                        if (__cs_local_main___cs_tmp_if_cond_0)
                                                {
                                        assert(0);
                                                }
                                        ;
                                        goto __exit_main;
                                                ;
                                        __exit_main:
                                                __CPROVER_assume(__cs_pc_cs[0] >= 20);
                                        ;
                                                ;
tmain_20: 
                                        __cs_exit(0, 0);
                                        }
                                        int main(void)
                                        {
/* round  0 */
/* main */
                                        unsigned __CPROVER_bitvector[5] __cs_tmp_t0_r0;
                                        __cs_pc_cs[0] = __cs_tmp_t0_r0;
                                        __CPROVER_assume(__cs_pc_cs[0] > 0);
                                        __CPROVER_assume(__cs_pc_cs[0] <= 20);
                                        main_thread();
                                        __cs_pc[0] = __cs_pc_cs[0];
/* t0_0 */
                                        unsigned __CPROVER_bitvector[4] __cs_tmp_t1_r0;
                                        if (__cs_active_thread[1])
                                                {
                                        __cs_pc_cs[1] = __cs_tmp_t1_r0;
                                        __CPROVER_assume(__cs_pc_cs[1] <= 8);
                                        t0_0(__cs_threadargs[1]);
                                        __cs_pc[1] = __cs_pc_cs[1];
                                                }
/* t1_0 */
                                        unsigned __CPROVER_bitvector[4] __cs_tmp_t2_r0;
                                        if (__cs_active_thread[2])
                                                {
                                        __cs_pc_cs[2] = __cs_tmp_t2_r0;
                                        __CPROVER_assume(__cs_pc_cs[2] <= 8);
                                        t1_0(__cs_threadargs[2]);
                                        __cs_pc[2] = __cs_pc_cs[2];
                                                }
                                        unsigned __CPROVER_bitvector[5] __cs_tmp_t0_r1;
                                        if (__cs_active_thread[0] == 1)
                                                {
                                        __cs_pc_cs[0] = __cs_pc[0] + __cs_tmp_t0_r1;
                                        __CPROVER_assume(__cs_pc_cs[0] >= __cs_pc[0]);
                                        __CPROVER_assume(__cs_pc_cs[0] <= 20);
                                        main_thread();
                                                }
                                        return 0;
                                        }
                                        
