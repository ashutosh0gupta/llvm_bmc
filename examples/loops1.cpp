bool assert(bool);

int main() {
  int i = 0,k = 0;
  for(;i<10;) {
    k=k+1;
    i=i+1;
  }
  assert(i != k);
  return 0;
}