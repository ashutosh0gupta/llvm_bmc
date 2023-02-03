void dmbsy();

long int lock;
long int obj;
long int ptr;
long int result;

void thread0(){
      long int t1,t2,t3;
      ptr = 0;
      dmbsy();
      chk:
            t1 = lock;
            t2 = t1 + 65535;
            t3= t1 >> 16;
            if(t2 != t3) goto chk;
      
      dmbsy();
      obj=1;
}

void thread1(){
      long int t1,t2=0,t3,t4;
      long int mask,b,t=0;
      enq:
         
          t1 = lock;
          t2 = 16;
          t2 = t1 + (t2 << 12);
          lock = t2;
          t3 = (t1 >> 16)|(t1 << (64 - 16));
          t2 = t1 ^ t3;
          if(t2 == 0) goto outl;
      spinl:
            t3 = lock;
            for(int i=0 ; i < 16 ; i++){
                  mask = 1 << i;
                  b = t3 & mask;
                  if (b == 1) t = ( (1 << i) | t);
            //if ( b == 0) n = make0(n,i);
            }
            t2 = t ^ (t1 >> 16);
            if(t2 != 0) goto spinl;
      outl:
            t1 = ptr;
            if(t1 == 0) goto end;
            result = obj;
      end:
            return;
}