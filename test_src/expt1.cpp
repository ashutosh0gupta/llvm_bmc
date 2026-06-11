// #include <stdio.h>
// #include <assert.h>
void assert( bool );

int main() {
    int sum = 0;

    for(int i = 0; i < 5; i++) 
    {
        sum += 1;
    }

    assert(sum == 5);
    
    return 0;
}