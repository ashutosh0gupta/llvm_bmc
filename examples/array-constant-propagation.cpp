// #include<stdio.h>

void assert( bool );

int a[10];

int main() {
  int i;
  i = i + 2;
  a[i+1] = 10;
  assert( a[i+1] != 10 );
  // if( i > 1 ) {
  //   assert( i > 15 );
  // }
}
