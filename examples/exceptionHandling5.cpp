int rand(int num) {
    return num % 2;
}
int store(int a, int b) {
    if (b == 10) return 100;
    return 10;
}

int fun(int b) {
    int a = 100;
    try {
        int x = rand(a);
        if (x == 0) {
            throw true;
        } else if (x == 2) {
            throw 123;
        }
    } catch (bool e) {
        a = 100;
    } catch (int e) {
        a = 10;
    }
    if (a == 100) {
        a = store(a, 10);
    } else {
        a = store(a, 100);
    }
    
    return 0;
}
int bal;
int main() {
    int x = 0;
    bal = fun(x);
    store(bal, fun(x));
    return 0;
}

/*
int balance;
int debit(int x) {
    if (x > balance) {
        balance = x - balance;
        balance = balance * 2;
    } else {
        balance = balance - x;
        balance = balance - 30;
    }
    
    return balance;
}

int main() {
    int a = 11, b = 6, c = 0;
    balance = 100;
    try {
        c = debit(a);
        balance = c;
    } catch (int message) {
        try {
            if (message > 2 * balance) throw message;
            message = message * 10;
        } catch (int x) {
            balance = -x;
        }
        balance += 30;
    }
    balance += 20;
    return 0;
}*/