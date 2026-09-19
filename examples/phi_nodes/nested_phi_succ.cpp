// nested.cpp
#include <iostream>

bool assert(bool);

int nested_phi(int *A, int *B, int *C, int limit) {
    int *X = A, *Y = B, *Z = C;
    int i = 0;

    while (i < limit) {
        X = (i%2 == 0)? A : B;
        Y = (i%3 == 0)? B : C;
        Z = ((i/2)%2 == 0)? X : Y;
        ++i;
    }
    assert(Z == B);
    return *Z;
}

int main() {
    int a = 10, b = 20, c = 30;
    return nested_phi(&a, &b, &c, 10);
}
