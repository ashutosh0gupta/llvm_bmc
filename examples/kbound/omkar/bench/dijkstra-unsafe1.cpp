
int flag[2] = {0,0};
int turn = 0;
int var = 0;

void thread0(){
      begin:
            
            flag[0] = 1;
            
            if ( turn == 0) goto endloop;
            ide_loop:
                  
                  if( flag[1] != 0) goto ide_loop;
            turn = 0;
            endloop:
                  
                  flag[0] = 2;
                  
                  if(flag[1] == 2) goto begin;
      //CS
      
      var = var + 1;
      //unlock
      
      flag[0] = 0;

}
void thread1(){
      begin:
            
            flag[1] = 1;
            
            if ( turn != 0) goto endloop;
            ide_loop:
                  
                  if( flag[0] != 0) goto ide_loop;
            turn = 1;
            endloop:
                  
                  flag[1] = 2;
                  
                  if(flag[0] == 2) goto begin;
      //CS
      
      var = var + 1;
      //unlock
      
      flag[1] = 0;

}