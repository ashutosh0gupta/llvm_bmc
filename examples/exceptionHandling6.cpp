int balance;
int debit(int x) {
    if (x > balance) {
        if (x > 2 * balance) throw x;
        balance = x - balance;
        // balance = balance * 2;
    } else {
        balance = balance - x;
        // balance = balance - 30;
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
        message = message * 10;
    }
    balance += 30;
    return 0;
}