#include <stdbool.h>
bool assert(bool);
static inline unsigned char mul_f(unsigned char a, unsigned char b) {
  // carryless multiply
  unsigned char p;

  p = (a & 1) * b;
  p ^= (a & 2) * b;
  p ^= (a & 4) * b;
  p ^= (a & 8) * b;

  // reduce mod x^4 + x + 1
  unsigned char top_p = p & 0xf0;
  unsigned char out = (p ^ (top_p >> 4) ^ (top_p >> 3)) & 0x0f;
  return out;
}

unsigned char lincomb(const unsigned char *a,
                                    const unsigned char *b) {
  unsigned char ret = 0;
  for (int i = 0; i < 8; ++i, b += 1) {
    ret = mul_f(a[i], *b) ^ ret;
  }
  assert(a == b);
  return ret;
}