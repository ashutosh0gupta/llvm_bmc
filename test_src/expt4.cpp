void assert(bool);

struct Student {
    int marks[3];
};

int main() {
    struct Student s;
    s.marks[0] = 10;
    s.marks[1] = 20;
    s.marks[2] = 30;

    int total = 0;
    for (int i = 0; i < 3; i++) {
        total += s.marks[i];
    }

    assert(total == 60);
    return 0;
}