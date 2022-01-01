bool assert(bool);
bool assume(bool);

int main() {
  unsigned i = 0,k = 0;
  int n = 3;
  unsigned p = -2;
  n = n + p;
  assume( n > 2 );
  for(;i<n;) {
    k=k+1;
    i=i+1;
  }
  assert(i != k);
  return 0;
}
