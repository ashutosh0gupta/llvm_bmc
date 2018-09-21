void assert( bool );

int main() {
	int a[2];
	a[0] = 0; a[1] = 1;
	{
		int a[3];
		a[0] = 0; a[1] = 1; a[2] = 2;
		int temp = a[1] + a[2];
		assert(temp != 2);
	}
	int temp = a[0] + a[1];
	assert(temp != 1);
}