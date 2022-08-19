bool assert( bool );

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

// #include <iostream>
// using namespace std;
 
// int main()
// {
//    int x = -1;
 
//    // Some code
//    cout << "Before try \n";
//    try {
//       cout << "Inside try \n";
//       if (x < 0)
//       {
//          throw x;
//          cout << "After throw (Never executed) \n";
//       }
//    }
//    catch (int x ) {
//       cout << "Exception Caught \n";
//    }
 
//    cout << "After catch (Will be executed) \n";
//    return 0;
// }
