#include<iostream>
#include <chrono>
#include<thread>

using namespace std::this_thread;     // sleep_for, sleep_until
using namespace std::chrono_literals; // ns, us, ms, s, h, etc.

int glb = 0;

void fun1()  {
  glb = 1;
  sleep_for(10ms);
  glb = 3;
  sleep_for(10ms);
  int x = glb;
  
  std::cout << "x = " << x << std::endl;
}

void fun2()  {
  int y = glb;
  sleep_for(10ms);
  glb = 2;
  
  std::cout << "y = " << y << std::endl;
}

int main() {
  std::thread t1(fun1);
  std::thread t2(fun2);
  t1.join();
  t2.join();
  return 0;
}