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

    assert(selected != f1); // to force phi node in LLVM IR

    return selected;
}

int main() {
    // int cond;
    // std::cin >> cond;

    int (*selectedFunc)(int, int) = fun(add, mul, 3);

    int result = selectedFunc(3, 4); // no printing, just runtime valid

    return 0;
}
