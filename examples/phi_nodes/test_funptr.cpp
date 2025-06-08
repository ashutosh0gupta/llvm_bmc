#include <iostream>

bool assert(bool);

int add(int x, int y) {
    return x + y;
}

int mul(int x, int y) {
    return x * y;
}

int (*fun(int (*f1)(int, int), int (*f2)(int, int), int cond))(int, int) {
    int (*selected)(int, int) = nullptr;

    if (cond > 0) {
        selected = f1;
    } else {
        selected = f2;
    }

    assert(selected != f2);

    return selected;
}

int main() {
    int cond;
    std::cin >> cond;

    int result = (*fun(add, mul, cond))(3, 4);

    return 0;
}
