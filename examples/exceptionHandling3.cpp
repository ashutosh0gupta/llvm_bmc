// #include<iostream>
bool assert( bool );

int main() {
    int x = -2;
    int y = 2;
    while (true) {
        if (x == -1) {
            break;
        }
        x = x / x;
        x = -x;
    }
    int z = x * 2 + y;
    y = x / z;
    y++;
    assert(y < 1);
    return 0;
}

