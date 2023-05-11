void assert( bool );

int a;
int b;
int c[10];

int main() {
	int a[5], d[4];
    d[0] = 1, d[1] = 0;
	a[0] = 0; a[1] = 1;
    assert(d[1] == 0);
	for(int i=0;i < 2;i++) {
		// int a[i+2];
		a[0] = 1;
		a[1] = 2;
        d[1] += 3;
		a[2] = 3;
	}
    assert(d[1] == 6);
}
// int a[10], b[20];

// int main() {
// 	a[0] = 1;
// 	b[1] = 3;
// 	a[0] += 2;
// 	for(int i = 0; i < 1; i++)
// 	// {
// 	// 	a[i] += 2;
// 	// 	b[i] += 3;
// 	// }
// 	assert(b[1] == 2);
// }