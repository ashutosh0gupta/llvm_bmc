#include <iostream>
bool assert(bool);


int find_value(int* p1, int* p2, int limit) {
    int* current = p1;
    int i = 0;

    while (i < limit) {
        if (i % 2 == 0) {
            current = p1;
        } else {
            current = p2;
        }
        i++;
    }

    assert(current != p2);

    return *current;
}

int main() {
    int p1 = 0;
    int p2 = 1;

    int result = find_value(&p1, &p2, 6);


    return 0;
}
