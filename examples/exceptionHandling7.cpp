int balance;
bool debit(int x) {
    if (x > balance) {
        if (x > 2 * balance) throw false;
        balance = x - balance;
        // balance = balance * 2;
    } else {
        balance = balance - x;
        // balance = balance - 30;
    }
    
    return true;
}

int main() {
    int a = 11, b = 6;
    bool c = true;
    balance = 100;
    try {
        c = debit(a);
        balance += 10; // 10 reward points
    } catch (bool message) {
        if (message)
            message = false;
        else
            message = true;
    }
    balance += 30;
    return 0;
}