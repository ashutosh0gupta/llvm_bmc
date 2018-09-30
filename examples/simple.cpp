#include<stdio.h>

void assert( bool );

int main() {
  int i = 0;
  i = i + 2;
  if( i > 1 ) {
    assert( i > 15 );
  }
}
