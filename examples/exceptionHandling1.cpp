// #include<iostream>
void assert( bool );

int main() {
    int x = 1;
    int y = 2;
    int z = 0;
    // if (x < 0)
    //     z = x + y;
    // else 
    //     z = x - y;
    z = x + y; 
    int w = x + z ;
    z = x / w;
    assert(x < 0);
    return 0;
}