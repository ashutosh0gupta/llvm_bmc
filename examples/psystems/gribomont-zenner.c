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
    int id = * (int *) pid;
    L0:
    flags[id] = 0;
    L1:
    flags[id] = 1;
    L2:
    flags[id] = 2;
    for(int i = 0; i < NUM_THREADS; ++i)
    {
        if(i == id) continue;
        if(flags[i] != 0 && flags[i] != 1 && flags[i] != 2 && flags[i] != 3 && flags[i] != 6 && flags[i] != 7) goto L2;
    }
    L3:
    flags[id] = 3;
    L4:
    flags[id] = 4;
    for(int i = 0; i < NUM_THREADS; ++i)
    {
        if(i == id) continue;
        if(flags[i] == 2 || flags[i] == 3 || flags[i] == 9 || flags[i] == 10 || flags[i] == 11 || flags[i] == 12)
        {
            L5:
            flags[id] = 5;
            L6:
            flags[id] = 6;
            for(int j = 0; j < NUM_THREADS; ++j)
            {
                if(j == id) continue;
                if(flags[j] == 9 || flags[j] == 10 || flags[j] == 11 || flags[j] == 12) goto L7;
            }
            L7:
            flags[id] = 7;
            goto L8;
        }
    }
    L8:
    flags[id] = 8;
    L9:
    flags[id] = 9;
    for(int i = 0; i < NUM_THREADS; ++i)
    {
        if(i == id) continue;
        if(flags[i] != 0 && flags[i] != 1 && flags[i] != 2 && flags[i] != 3 && flags[i] != 9 && flags[i] != 10 && flags[i] != 11 && flags[i] != 12) goto L9;
    }
    L10:
    flags[id] = 10;
    for(int i = 0; i < id; ++i)
    {
        if(flags[i] != 0 && flags[i] != 1 && flags[i] != 2 && flags[i] != 3 && flags[i] != 6 && flags[i] != 7) goto L10;
    }
    L11:
    flags[id] = 11;
    critical(id);
    L12:
    flags[id] = 12;
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