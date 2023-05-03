bool assert( bool flag) {
    return false;
}

int main() {
    try {
        int age = 15;
        if (age >= 18) {
            //do something
        } else {
        throw (age);
        }
    }
    catch (int myNum) {
      assert( myNum < 18 );
        // myNum = 18;
    }
    return 0;
}
