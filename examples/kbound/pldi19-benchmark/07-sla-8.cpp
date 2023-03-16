void dmbsy();
#define X 8
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
      for(int i=0 ; i < X ; i++){
            t1 = lock;
            t4 = (t1 >> 16)|(t1 << (64 - 16));
            t2 = t1 ^ t4;
            if(t2 == 0) goto free;
            t2 = t ^ (t1 << 16);
            if(t2 == 0) continue;
            goto outu;
      }            
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
      for(int i=0 ; i < X ; i++){
            t1 = lock;
            t2 = 16;
            t2 = t1 + (t2 << 12);
            lock = t2;
      }          
      enqed:
          t3 = (t1 >> 16)|(t1 << (64 - 16));
          t2 = t1 ^ t3;
          if(t2 == 0) goto outl;
      for(int i=0 ; i < X-1 ; i++){
            t3 = lock;
            t = 0;
            for(int i=0 ; i < 16 ; i++){
                  mask = 1 << i;
                  b = t3 & mask;
                  if (b == 1) t = ( (1 << i) | t);
            //if ( b == 0) n = make0(n,i);
            }
            t3 = t;
            t2 = t3 ^ (t1 << 16);
            if(t2 == 0) goto outl;
      }
      t3 = lock;
      t = 0;
      for(int i=0 ; i < 16 ; i++){
            mask = 1 << i;
            b = t3 & mask;
            if (b == 1) t = ( (1 << i) | t);
            //if ( b == 0) n = make0(n,i);
      }
      t3 = t;
      t2 = t3 ^ (t1 << 16);
      if(t2 != 0) goto end;
      outl:
            p = ptr;
            if(p == 0) goto end;
            result = obj;
      end:
            return;
}