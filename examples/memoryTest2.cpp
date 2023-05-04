void assert( bool );

int func(int a, int b)
{
    if( a >= 0) return a+b;
    else return a-b;
}

int a;
int b;
int c[10];

int main() {
	int a[5], d[4];
    d[0] = 1, d[1] = 0;
	a[0] = 3; a[1] = 1;
    assert(d[1] == 0);
	for(int i=0;i < 2;i++) {
		int a[i+2];
		a[0] = 1;
		a[1] = 2;
        d[1] += 3;
		a[2] = 3;
	}
    assert(a[0] == 3);
    d[1] = func(d[1],a[0]);
    assert(d[1] == 9);
}