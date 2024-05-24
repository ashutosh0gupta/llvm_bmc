#include<iostream>

bool assert( bool );

int main(){
    int a = 1;
    int b = 2;
    int* ptr = &a;
    *ptr = 10;
    assert(a == 10);
    return 0;
}


