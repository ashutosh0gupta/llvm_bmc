#include<iostream>
using namespace std;

bool assert( bool );

int main()
{
  int variable = 169;
  int* pointer1;
  int** pointer2;
  int ***pointer3;
  pointer1 = &variable;
  pointer2 = &pointer1;
  pointer3 = &pointer2;
  *pointer1 = 100;

  // assert(variable== 100);
  // assert(*pointer1 == 100);
  // assert(**pointer2 == 100);
  assert(variable == 100 && ***pointer3 == 100);
  return 0;
}