bool assert(bool);

int a = 3;
int b = 2;

int main() {	
	int c = a+b;
	assert(c != 5);
}