bool assert(bool);
void dmbsy();

void str (int *, int);
void stl (int *, int);
void stx (int *, int);
void stlx(int *, int);

int ldr (int *);
int lda (int *);
int ldx (int *);
int ldax(int *);

int m = 0;
int s = 0;

void fun1(int x)  {
  int f = m;
  m = 1;
  int *p = &s;
  if( x> 0 ) {
    p = &m;
  }
  //dmbsy();
  stl(p,1);

  // stl( &m, 1 );
  // stx( &m, 1 );
  stlx( &m, 1 );
  // int p = lda ( &m);
  // int k = ldx ( &m );
  int z = ldax( &m );

  // x = x + x;
  // dmbsy();
  // // if( x > 2 ) {
  //   // assert( x > 0 );
  // // }
  // return x;
  // glb = 1;
  // // sleep_for(10ms);
  // glb = 3;
  // // sleep_for(10ms);
  // int x = glb;
  
  // assert(x == 2);
  // // assert(x == 3);
}

void fun2()  {
  int s1 = ldr(&s); //s;
  int m1 = m;
  // sleep_for(10ms);
  // glb = 2;
  assert(s1 != 1 || m1 == 1);
  // assert(s1 != 1 || m1 == 0);
  // assert(y == 0);
}

// int main() {
//   std::thread t1(fun1);
//   std::thread t2(fun2);
//   t1.join();
//   t2.join();
//   return 0;
// }

// ===================================

// // #include<iostream>
// #include<chrono>
// #include<thread>

// using namespace std::this_thread;     // sleep_for, sleep_until
// using namespace std::chrono_literals; // ns, us, ms, s, h, etc.

// bool assert(bool);

// int glb = 0;

// void fun1()  {
//   glb = 1;
//   sleep_for(10ms);
//   glb = 3;
//   sleep_for(10ms);
//   int x = glb;
  
//   assert(x == 2);
//   // assert(x == 3);

//   // std::cout << "x = " << x << std::endl;
// }

// void fun2()  {
//   int y = glb;
//   sleep_for(10ms);
//   glb = 2;
  
//   assert(y == 1);
//   // assert(y == 0);
//   // std::cout << "y = " << y << std::endl;
// }

// int main() {
//   std::thread t1(fun1);
//   std::thread t2(fun2);
//   t1.join();
//   t2.join();
//   return 0;
// }
