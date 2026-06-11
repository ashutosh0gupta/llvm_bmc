void assert(bool);

struct Box {
    int values[4];
};

struct Pair {
    int a;
    int b;
};

int main() {
    int nums[3] = {2, 4, 6};
    int sum1 = nums[0] + nums[1] + nums[2];
    assert(sum1 == 12);

    struct Pair p;
    p.a = 5;
    p.b = 7;
    assert(p.a + p.b == 12);

    struct Box bx;
    bx.values[0] = 1;
    bx.values[1] = 2;
    bx.values[2] = 3;
    bx.values[3] = 4;

    int sum2 = 0;
    for (int i = 0; i < 4; i++) {
        sum2 += bx.values[i];
    }
    assert(sum2 == 10);

    return 0;
}