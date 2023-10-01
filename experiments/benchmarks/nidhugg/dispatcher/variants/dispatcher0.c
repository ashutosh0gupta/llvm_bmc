/* Copyright (C) 2023
 * This benchmark is part of ARMCBMC
 */

/* Adapted from the benchmark with the same name in
 the CAV'18 paper https://link.springer.com/chapter/10.1007/978-3-319-96142-2_22
 */

#include <assert.h>
#include <pthread.h>
#include <stdatomic.h>

#include "../dispatcher.c"

int main()
{
  pthread_t idw[SNUM];
  int picked_servers[RNUM];

  atomic_init(&sid, 0);
  // spawn SNUM servers
  pthread_mutex_init(&k, NULL);
  int x;
  for (x = 0; x < SNUM; x++)
  {
    atomic_init(&in_channel[x], 0);
    atomic_init(&out_channel[x], 0);
    pthread_mutex_init(&servers[x], NULL);
    pthread_create(&idw[x], 0, server, (void*) (long) x);
  }

  // process requests
  int r;
  for (r = 0; r < RNUM; r++){
    if (r == 0)
      picked_servers[r] = process_request(r, SNUM);
    else
      picked_servers[r] = process_request(r,picked_servers[r-1]);
  }

  pthread_exit (0);


  // wait for servers to join
  for (x = 0; x < SNUM; x++)
    pthread_join(idw[x],NULL);

  // process results:
  // - counts the number of requests that failed
  // - assert that the picked server was good
  // - assert that a server could only be
  int missed_req = 0;

  for (r = 0; r < RNUM; r++)
  {
    int s = picked_servers[r];
    // bound check
    if (SNUM > 0)
      assert(s >= 0 && s < SNUM);
    // value in the out_channel
    //if (SNUM > RNUM)
    //  assert(out_channel[s] <= RNUM/2 + 1);
    //else
    //  assert(out_channel[s] <= RNUM);
    // if the value is 0 it means it was a miss
    if (atomic_load_explicit(&out_channel[s], memory_order_relaxed))
      atomic_store_explicit(&out_channel[s], atomic_load_explicit(&out_channel[s], memory_order_relaxed)-1, memory_order_relaxed);
    else
      missed_req++;
  }

  return 0;
}
