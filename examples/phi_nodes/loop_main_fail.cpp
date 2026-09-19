#include<iostream>

bool assert(bool);

int main(){
    int p1 = 0;
    int p2 = 1;
    int current;
    int i = 2;
    int limit = 6;
    while (i < 3) {
        if (i % 2 == 0) {
            current = p1;
        } else {
            current = p2;
        }
        i++;
    }
    
    assert(current == p1);
    
    return current;
}
