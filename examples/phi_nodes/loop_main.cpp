#include<iostream>

bool assert(bool);

int main(){
    int p1 = 0;
    int p2 = 1;
    int *current = &p1;
    int i = 0;
    int limit = 6;
    int a=0;
    while (i < limit) {
        if (i % 2 == 0) {
            current = &p1;
        } else {
            current = &p2;
        }
        i++;
    }
    
    assert(current == &p1);
    
    return *current;
}
