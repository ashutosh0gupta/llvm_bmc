// #include<iostream>
bool assert( bool );

int main() {
    int x = 1;
    int* ptr = nullptr;
    *ptr = 2;
    assert(*ptr == 2);
    return 0;
}

