bool assert(bool);

// int f(int a);

inline int f(int a) {
	return a+1;
}

int main() {
	int x = 0,y;
	y = f(x);
	assert(y == 1);
}
