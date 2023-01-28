 

#include <pthread.h>
//#define assert(e) if (!(e)) ERROR: goto ERROR;

bool assume(bool);
bool assert(bool);

volatile int level0 = 0, level1 = 0, level2 = 0;
volatile int waiting0 = 0, waiting1 = 0;
int _cc_x;


void thread0()
{

  int rwaiting = -1, rlevel1 = -1, rlevel2 = -1, rx = -1;
  for(int i=0 ; i < 2; i++) {
    level0 = 0;
    waiting0 = 0;
    rwaiting = waiting0;
    rlevel1 = level1;
    rlevel2 = level2;
    //assume(rwaiting != 0 || (rlevel1 < 0 && rlevel2 < 0));
    level0 = 1;
    waiting1 = 0;

    rwaiting = waiting1;
    rlevel1 = level1;
    rlevel2 = level2;
    //assume(rwaiting != 0 || (rlevel1 < 1 && rlevel2 < 1));
    _cc_x = 0;
    rx = _cc_x;
    assert(rx==0);
    level0 = 0;
  }
}

void thread1()
{
  int rwaiting = -1, rlevel0 = -1, rlevel2 = -1, rx = -1;
  for(int i=0 ; i < 2; i++) {
    level1 = 0;
    waiting0 = 1;

    rwaiting = waiting0;
    rlevel2 = level2;
    rlevel0 = level0;
    //assume(rwaiting != 1 || (rlevel2 < 0 && rlevel0 < 0));
    level1 = 1;
    waiting1 = 1;

    rwaiting = waiting1;
    rlevel2 = level2;
    rlevel0 = level0;
    //assume(rwaiting != 1 || (rlevel2 < 1 && rlevel0 < 1));
    _cc_x = 1;
    rx = _cc_x;
    assert(rx==1);
    level1 = 0;
  }
}


void thread2()
{
  int rwaiting = -1, rlevel0 = -1, rlevel1 = -1, rx = -1;
  for(int i=0 ; i < 2; i++) {
    level2 = 0;
    waiting0 = 2;

    rwaiting = waiting0;
    rlevel1 = level1;
    rlevel0 = level0;
    //assume(rwaiting != 2 || (rlevel1 < 0 && rlevel0 < 0));
    level2 = 1;
    waiting1 = 2;

    rwaiting = waiting1;
    rlevel1 = level1;
    rlevel0 = level0;
    //assume(rwaiting != 2 || (rlevel1 < 1 && rlevel0 < 1));
    _cc_x = 2;
    rx = _cc_x;
    assert(rx==2);
    level2 = 0;
  }
}
