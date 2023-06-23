#include <pthread.h>

// #include <stdio.h>
// #include <unistd.h>
void critical(int/*id*/);
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
    const int id = * (int *) pid;
    L0:
    flags[id] = 0;
    L1:
    flags[id] = 1;
    for(int i = 0; i < NUM_THREADS; ++i)
    {
        if(i == id) continue;
        if(flags[i] != 0 && flags[i] != 1 && flags[i] != 2 && flags[i] != 5 && flags[i] != 6)
        {
            goto L1;
        }
    }
    L2:
    flags[id] = 2;
    L3:
    flags[id] = 3;
    for(int i = 0; i < NUM_THREADS; ++i)
    {
        if(i == id) continue;
        if(flags[i] == 1 || flags[i] == 2)
        {
            L4:
            flags[id] = 4;
            L5:
            flags[id] = 5;
            for(int j = 0; j < NUM_THREADS; ++j)
            {
                if(j == id) continue;
                if(flags[j] == 8 || flags[j] == 9 || flags[j] == 10) goto L6;
            }
            goto L5;
            L6:
            flags[id] = 6;
            goto L8;
        }
    }
    L7:
    flags[id] = 7;
    L8:
    flags[id] = 8;
    for(int i = 0; i < id; ++i)
    {
        if(flags[i] != 0 && flags[i] != 1 && flags[i] != 2) goto L8;
    }
    L9:
    flags[id] = 9;
    critical(id);
    L10:
    flags[id] = 10;
    for(int i = 0; i < id; ++i)
    {
        if(flags[i] != 0 && flags[i] != 1 && flags[i] != 2 && flags[i] != 8 && flags[i] != 9 && flags[i] != 10 && flags[i] != 11) goto L10;
    }
    L11:
    flags[id] = 11;
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
