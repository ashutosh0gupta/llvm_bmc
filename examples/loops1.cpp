bool assert(bool);

int main() {
  int i = 0,k = 0;
  int n;
  #pragma clang loop unroll_count(8)
  for(;i<n;) {
    k=k+1;
    i=i+1;
  }
  assert(i != k);
  return 0;
}
