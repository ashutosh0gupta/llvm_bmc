
long int flag[2] = {0,0};
long int turn = 0;
long int var = 0;

void thread0(){
      for (int i = 0; i < 2; i++)
      {
            //begin:
            
            flag[0] = 1;
            
            if ( turn == 0) goto endloop;
            //ide_loop:
                  
                  if( flag[1] != 0) return; //goto ide_loop;
            turn = 0;
            endloop:
                  
            flag[0] = 2;
                  
            if(flag[1] == 2) return; //goto begin;
      //CS
      
            var = var + 1;
      //unlock
      
            flag[0] = 0;
      }
      

}
void thread1(){
      //begin:
            
      for (int i = 0; i < 2; i++)
      {
            flag[1] = 1;
            
            if ( turn != 0) goto endloop;
            //ide_loop:
                  
                  if( flag[0] != 0) return; //goto ide_loop;
            turn = 1;
            endloop:
                  
            flag[1] = 2;
                  
            if(flag[0] == 2) return; //goto begin;
      //CS
      
            var = var + 1;
      //unlock
      
            flag[1] = 0;
      }
      

}