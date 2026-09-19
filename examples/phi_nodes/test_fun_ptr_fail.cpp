#include <iostream>

bool assert(bool);

int add(int x, int y) {
    return x + y;
}

int mul(int x, int y) {
    return x * y;
}

int (*fun(int (*f1)(int, int), int (*f2)(int, int), int limit))(int, int) {
    int (*selected)(int, int) = nullptr;
    for (int i = 0; i < limit; ++i) {
        if (i%2 == 0) {
            selected = f1;
        } else {
            selected = f2;
        }
    }
    assert(selected == f2);
    return selected;
}

int main() {
    int (*selectedFunc)(int, int) = fun(add, mul, 21);
    int result = selectedFunc(3, 4);
    return 0;
}
