void assert( bool );

int a;
float b;
int c[10];

int main() {
	int a[5];
    float d[4];
    b = 3.0;
    d[0] = 1.0, d[1] = 3.0;
	a[0] = 0; a[1] = 1;
    assert(d[1] == 0);
	for(int i=0;i < 2;i++) {
		int a[i+2];
		a[0] = 1;
		a[1] = 2;
        d[1] += 2;
		a[2] = 3;
	}
    assert(b == 3);
    assert(d[1] == 8);
}