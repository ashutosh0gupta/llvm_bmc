#include<iostream>

bool assert( bool );

int* foo(int *a, int *b, int *c){
    *b = 10;
    *a = 5;
    return b;
}

int main(){
    int a1 = 1;
    int b1 = 2;
    int c1 = 3;
    int *ptr = foo(&a1, &b1, &c1);
    assert(b1 == 10);
    return 0;
}

