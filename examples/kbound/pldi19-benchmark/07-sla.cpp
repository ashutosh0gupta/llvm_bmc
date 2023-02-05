void dmbsy();

long int lock=0;
long int obj=0;
long int ptr= 0;
long int result=0;

void thread0(){
      long int n = lock;
      long int t1,t2,t3,t4;
      long int mask,b,t=0;
      ptr = 0;
      dmbsy();
      for(int i=0 ; i < 16 ; i++){
            mask = 1 << i;
            b = n & mask;
            if (b == 1) t = ( (1 << i) | t);
            //if ( b == 0) t = make0(t,i);
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
      long int t1,t2,t3,t4;
      long int mask,b,t=0;
      long int p;
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
            t2 = t3 ^ (t1 << 16);
            if(t2 != 0) goto end;
      outl:
            p = ptr;
            if(p == 0) goto end;
            result = obj;
      end:
            return;
}