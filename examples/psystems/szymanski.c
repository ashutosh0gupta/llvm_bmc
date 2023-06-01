// #include <stdio.h>
#include <pthread.h>
#include <unistd.h>
// #include <signal.h>

#define NUM_THREADS 10

int flags[NUM_THREADS];

// void interrupt_handler(int signo)
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

void* szymanski(void *pid)
{
    int id = * (int *) pid;
    L0:
    flags[id] = 1;
    L1:
    for(int i = 0; i < NUM_THREADS; ++i)
    {
        if(i != id && flags[i] != 0 && flags[i] != 1 && flags[i] != 2)
        {
            goto L1;
        }
    }
    flags[id] = 3;
    for(int i = 0; i < NUM_THREADS; ++i)
    {
        if(i != id && flags[i] == 1)
        {
            flags[id] = 2;
            while(1)
            {
                for(int j = 0; j < NUM_THREADS; ++j)
                {
                    if(j != id && flags[j] == 4)
                    {
                        goto L2;
                    }
                }
            }
        }
    }
    L2:
    flags[id] = 4;
    L3:
    for(int i = 0; i < id; ++i)
    {
        if(flags[i] != 0 && flags[i] != 1) goto L3;
    }
    /* CRITICAL SECTION */
    for(int i = 0; i < 10; ++i)
    {
        // printf("Hello ");
        // fflush(stdout);
        // usleep((rand() % 1000));
        // printf("from thread ");
        // fflush(stdout);
        // usleep(rand() % 1000);
        // printf("id : %d\n", i);
        // fflush(stdout);
        // usleep(rand() % 1000);
    }
    L4:
    for(int i = id + 1; i < NUM_THREADS; ++i)
    {
        if(flags[i] != 0 && flags[i] != 1 && flags[i] != 4) goto L4;
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
