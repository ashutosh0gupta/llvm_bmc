bool assert(bool);
bool assume(bool);

//#include <cstdio>

int main() {
  int x;
  int y = x;
  assume( 0 == x );
  assert( y == 0);
  // if( y == x)
  //   printf("I am here");
  // if( (y != 0) )
  //   assert(0);
  return 0;
}
