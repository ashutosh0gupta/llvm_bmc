bool assert(bool);

int main() {
	int a = 3;
	int b = 2;
	int c = a+b;
	assert(c != 5);
}