bool assert(bool);
bool assume(bool);

int main() {
  int i = 0,k = 0;
  int n = 3;
  assume( n > 2 );
  for(;i<n;) {
    k=k+1;
    i=i+1;
  }
  assert(i != k);
  return 0;
}
