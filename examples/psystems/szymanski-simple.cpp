// #include <iostream>
// #include <vector>
#include <thread>
// #include <unistd.h>
// #include <cstdlib>
// #include <signal.h>

#define NUM_THREADS 10

int flags[NUM_THREADS];

// void interrupt_handler(int signo)
// {
//     std::cout << "Current Flags: ";
//     for(int i = 0; i < NUM_THREADS; ++i)
//     {
//         std::cout << flags[i] << ' ';
//     }
//     std::cout << std::endl;
//     exit(0);
// }

// void szymanski(int id)
// {
//     while(true)
//     {
//         flags[id] = 1;
//         bool to_continue = true;
//         while(to_continue)
//         {
//             to_continue = false;
//             for(int i = 0; i < NUM_THREADS; ++i)
//             {
//                 if(flags[i] >= 3)
//                 {
//                     to_continue = true;
//                     break;
//                 }
//             }
//         }
//         flags[id] = 3;
//         bool break_all = false;
//         for(int i = 0; i < NUM_THREADS; ++i)
//         {
//             if(flags[i] == 1)
//             {
//                 flags[id] = 2;
//                 while(true)
//                 {
//                     for(int j = 0; j < NUM_THREADS; ++j)
//                     {
//                         if(flags[j] == 4)
//                         {
//                             break_all = true;
//                             break;
//                         }
//                     }
//                     if(break_all) break;
//                 }
//                 if(break_all) break;
//             }
//         }
//         flags[id] = 4;
//         to_continue = true;
//         while(to_continue)
//         {
//             to_continue = false;
//             for(int i = 0; i < id; ++i)
//             {
//                 if(flags[i] >= 2)
//                 {
//                     to_continue = true;
//                     break;
//                 }
//             }
//         }

// /* CRITICAL SECTION */
// for(int i = 0; i < 10; ++i)
// {
//     std::cout << "Hello ";
//     std::cout.flush();
//     usleep((rand() % 1000));
//     std::cout << "from thread ";
//     usleep(rand() % 1000);
//     std::cout.flush();
//     usleep(rand() % 1000);
//     std::cout << id << " : " << i << std::endl;
//     usleep(rand() % 1000);
// }

//         to_continue = true;
//         while(to_continue)
//         {
//             to_continue = false;
//             for(int i = id + 1; i < NUM_THREADS; ++i)
//             {
//                 if(flags[i] == 2 || flags[i] == 3)
//                 {
//                     to_continue = true;
//                     break;
//                 }
//             }
//         }
//         flags[id] = 0;
//     }
// }

void szymanski(int id)
{
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
            while(true)
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
        // std::cout << "Hello ";
        // std::cout.flush();
        usleep((rand() % 1000));
        // std::cout << "from thread ";
        usleep(rand() % 1000);
        // std::cout.flush();
        usleep(rand() % 1000);
        // std::cout << id << " : " << i << std::endl;
        usleep(rand() % 1000);
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
    std::thread t[NUM_THREADS];
    // std::vector<std::thread> v;
    for(int i = 0; i < NUM_THREADS; ++i)
    {
        // v.push_back(std::thread(szymanski, i));
        t[i] = std::thread(szymanski, i);
    }
    for(int i = 0; i < NUM_THREADS; ++i) t[i].join();
}
