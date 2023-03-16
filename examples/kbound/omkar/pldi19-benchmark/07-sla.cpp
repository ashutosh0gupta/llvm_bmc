void dmbsy();

long int lock;
long int obj;
long int ptr;
long int result;

void thread0(){
      ptr = 0;
      dmbsy();
      long int n = lock;
      long int t1,t2,t3,t4;
      long int mask,b,t=0;
      for(int i=0 ; i < 16 ; i++){
            mask = 1 << i;
            b = n & mask;
            if (b == 1) t = ( (1 << i) | t);
            //if ( b == 0) n = make0(n,i);
      }
      t = t << 16;
      reload:
            t1 = lock;
            t4 = (t1 >> 16)|(t1 << (64 - 16));
            t2 = t1 ^ t4;
            if(t2 == 0) goto free;
            t2 = t ^ (t1 << 16);
            if(t2 == 0) goto end;
            goto outu;
      free:
            lock = t1;
      outu:
            dmbsy();
            obj=1;
      end:
            return;
}

void thread1(){
      enq:
          long int t1,t2,t3,t4;
          t1 = lock;
          t2 = 16;
          t2 = t1 + (t2 << 12);
          lock = t2;
          t2 = t1 ^ (t1 >> 16);
          if(t2 == 0) goto outl;
      spinl:
            t3 = lock;
            t2 = t3 ^ (t1 << 16);
            if(t2 != 0) goto end;
      outl:
            t1 = ptr;
            if(t1 != 0) result = obj;
      end:
            return;
}