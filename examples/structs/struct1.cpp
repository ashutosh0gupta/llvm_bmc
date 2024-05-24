#include<iostream>

bool assert( bool );

struct A{
    int a;
    int b;
    int c;
    int d;
    int e;
};

int main(){
    A first;
    A second;
    // A third;

    // first.c = 10;
    // first.b = 20;
    // // first.c = 30;

    // second.d = 20;
    // // second.b = 200;

    // assert(first.b == second.d);

    first.a = 10;
    first.b = 20;
    first.c = 30;
    first.d = 40;
    first.e = 50;
    
    second.a = 100;
    second.b = 200;
    second.c = 300;
    second.d = 400;

    // third.a == 1000;

    assert(first.a == 20);
}