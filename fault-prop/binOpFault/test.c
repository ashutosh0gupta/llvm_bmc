#include <stdbool.h>
bool assert(bool);
int test(int b, int c) {
  int a = b * c;
  int out = a;
  assert(out == b);
  return out;
}

int solve() {
  int a = 2, b = 2;
  int res = test(a, b);
  return res;
}