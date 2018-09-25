void assert( bool );

int main() {
	int a[5];
	a[0] = 0; a[1] = 1;
	for(int i=0;i < 2;i++) {
		int a[i+2];
		a[0] = 1;
		a[1] = 2;
		a[2] = 3;
	}
}