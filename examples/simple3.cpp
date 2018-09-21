void assert( bool );

int main() {
	int a[2];
	a[0] = 0; a[1] = 1;
	for(int i=0;i < 2;i++) {
		int a[i];
		a[0] = 0; 
	}
	int temp = a[0] + a[1];
	assert(temp != 2);
}