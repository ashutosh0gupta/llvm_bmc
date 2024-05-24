#include<iostream>

bool assert( bool );

int* foo(int *a, int *b, int *c){
    *b = 10;
    *a = 5;
    return b;
}

int** bar(int **a){
    **a = 201;
    return a;
}

int*** bar1(int ***a){
    ***a = 301;
    return a;
}


int main(){
    int a1 = 1;
    int b1 = 2;
    // int c1 = 3;
    int d1 = 4;
    int e1 = 5;
    int *ptr = &b1;
    ptr = foo(&a1, &b1, &d1); 
    int **ptr1 = bar(&ptr); 
    int ***ptr2 = bar1(&ptr1);
    assert(b1 == 301);
    return 0;
}


