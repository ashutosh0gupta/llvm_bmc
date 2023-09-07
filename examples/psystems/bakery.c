#include <pthread.h>

// #include <stdio.h>
// #include <unistd.h>
void critical(int/* id*/);
// {
//     for(int i = 0; i < 10; ++i)
//     {
//         printf("Hello from thread %d: %d\n", id, i);
//     }
// }

#define NUM_THREADS 10
int flags[NUM_THREADS];

// #include <signal.h>
// static void handler(int)
// {
//     puts("");
//     for(int i = 0; i < NUM_THREADS; ++i) printf("%d ", flags[i]);
//     puts("");
//     sleep(5);
// }

void *function(void *pid)
{
    const int id = * (const int *) pid;
    L0:
    flags[id] = 0;
    for(int i = 0; i < id; ++i)
    {
        if(flags[i] != 0) goto L0;
    }
    L1:
    flags[id] = 1;
    for(int i = id + 1; i < NUM_THREADS; ++i)
    {
        if(flags[i] != 0) goto L1;
    }
    L2:
    flags[id] = 2;
    critical(id);
    goto L0;
}

int main()
{
    // signal(SIGINT, handler);
    pthread_t t[NUM_THREADS];
    int ids[NUM_THREADS];
    for(int i = 0; i < NUM_THREADS; ++i)
    {
        ids[i] = i;
        pthread_create(t + i, NULL, function, ids + i);
    }
    for(int i = 0; i < NUM_THREADS; ++i) pthread_join(t[i], NULL);
}