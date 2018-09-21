void assert( bool );

int main() {
	int d = 1,e = 1;
	{
		int d = 2,e = 2;
		int f = d+e;
		assert(f != 2);
	}
	int f = d + e;
	assert(f != 2);
}