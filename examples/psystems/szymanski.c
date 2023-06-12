#include <stdio.h>
#include <pthread.h>
#include <unistd.h>
#include <stdlib.h>
// #include <signal.h>

#define NUM_THREADS 10

int flags[NUM_THREADS];

// void interrupt_handler(int)
// {
//     printf("Current flags: ");
//     for(int i = 0; i < NUM_THREADS; ++i)
//     {
//         printf("%d ", flags[i]);
//     }
//     printf("\n");
//     fflush(stdout);
//     exit(0);
// }

void *szymanski(void *pid)
{
    int id = * (int *) pid;
    L0: // 0 -> 1 (no check)
    flags[id] = 1;
    L1: // 1 -> 3 (\forall i != id, flags[i] \in {0, 1, 2})
    for(int i = 0; i < NUM_THREADS; ++i)
    {
        if(i != id && flags[i] != 0 && flags[i] != 1 && flags[i] != 2)
        {
            goto L1;
        }
    }
    flags[id] = 3;
    L2: // 3 -> 2 (\exists i != id, flags[i] = 1)
    for(int i = 0; i < NUM_THREADS; ++i)
    {
        if(i != id && flags[i] == 1)
        {
            flags[id] = 2;
            L3: // 2 -> 4 (\exists i != id, flags[i] \in {4, 5})
            for(int j = 0; j < NUM_THREADS; ++j)
            {
                if(j != id && (flags[j] == 4 || flags[j] == 5))
                {
                    goto M0;
                }
            }
            goto L3;
        }
    }
    M0:
    flags[id] = 4;
    L4: // 4 -> 5 (\forall i < id, flags[i] \in {0, 1})
    for(int i = 0; i < id; ++i)
    {
        if(flags[i] != 0 && flags[i] != 1) goto L4;
    }
    flags[id] = 5;
    /* CRITICAL SECTION */
    for(int i = 0; i < 10; ++i)
    {
        printf("Hello ");
        fflush(stdout);
        usleep(rand() % 1000);
        printf("from thread ");
        fflush(stdout);
        usleep(rand() % 1000);
        printf("id : %d, %d\n", id, i);
        fflush(stdout);
        usleep(rand() % 1000);
    }
    L5: // 5 -> 0 (\forall i > id, flags[i] \in {0, 1, 4, 5})
    for(int i = id + 1; i < NUM_THREADS; ++i)
    {
        if(flags[i] != 0 && flags[i] != 1 && flags[i] != 4 && flags[i] != 5) goto L5;
    }
    flags[id] = 0;
    goto L0;
}

int main()
{
    // signal(SIGINT, interrupt_handler);
    pthread_t t[NUM_THREADS];
    int ids[NUM_THREADS];
    for(int i = 0; i < NUM_THREADS; ++i)
    {
        ids[i] = i;
        pthread_create(t + i, NULL, szymanski, ids + i);
    }
    for(int i = 0; i < NUM_THREADS; ++i) pthread_join(t[i], NULL);
}
