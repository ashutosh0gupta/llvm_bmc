void assert(bool);

struct Point {
    int x;
    int y;
};

int main() {
    struct Point p;
    p.x = 3;
    p.y = 4;

    assert(p.x == 3);
    assert(p.y == 4);
    assert(p.x + p.y == 7);

    return 0;
}