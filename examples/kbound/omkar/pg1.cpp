long int var;
long int result1;

int make0(int n, int k)
{
    if (k <= 0)
        return n;
 
    // Check if the kth bit is set or not
    if (n & (1 << (k))) {
 
        // Toggle the kth bit
        n = (n ^ (1 << (k)));
    }
 
    return n;
}
void thread0(){
      int wr = 1;
      int n = var;
      int mask,b;
      for(int i=0 ; i < 8 ; i++){
            mask = 1 << i;
            b = wr & mask;
            if (b == 1) n = ( (1 << i) | n);
            if ( b == 0) n = make0(n,i);
      }
      var = n;
      result1 = var;
}

void thread1(){
      var = 514;
}