void assert(bool);

void xor_loop(unsigned char* M) {
    int i = 0;
    for (int iter = 0; iter < 4; iter++) {
        M[858 + i] = M[i] ^ M[780 + i];
        i++;
    }
}

int main() {
    unsigned char a[1024];
    xor_loop(a);
    return 0;
}