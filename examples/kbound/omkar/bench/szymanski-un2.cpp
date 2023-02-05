long int flag[2];
long int var;

void thread0(){
      for (int i = 0; i < 2; i++)
      {
            flag[0] = 1;
      
            if(flag[1] >= 3) return;
            
            flag[0] = 3;
            
            if(flag[1] == 1){
                  
                  flag[0] = 2;
                  
                  if(flag[1] != 4) return;
            }
            
            flag[0] = 4;
            
            if(flag[1] >= 2) return;
            //CS
            
            var = var + 1;
            //unlock
            
            if(flag[1] != 3 && flag[1] != 2) return;
            
            flag[0] = 0;
      }
      
}
void thread1(){
      for (int i = 0; i < 2; i++)
      {
           flag[1] = 1;
      
            if(flag[0] >= 3) return;
            
            flag[1] = 3;
            
            if(flag[0] == 1){
                  
                  flag[1] = 2;
                  
                  if(flag[0] != 4) return;
            }
            
            flag[1] = 4;
            
            if(flag[0] >= 2) return;
            //CS
            
            var = var + 1;
            //unlock
            
            if(flag[0] != 3 && flag[0] != 2) return;
            
            flag[1] = 0;
      }
      
}