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
    A *third = new A;

    // first.a = 10;
    // first.b = 20;
    // // first.c = 30;

    // second.d = 20;
    // // second.b = 200;

    // assert(first.b == second.d);
    // third->a = 100;
    first.a = 10;
    first.b = 20;
    first.c = 30;
    first.d = 40;
    first.e = 50;
    
    second.a = 100;
    // first.b = 2000;
    second.b = 200;
    second.c = 300;
    second.d = 400;
    second.e = 500;

    third->a = 1000;
    third->b = 2000;
    third->c = 3000;
    third->d = 4000;
    third->e = 5000;

    // // third.a == 1000;

    assert(first.b*100 == third->d/2);
}