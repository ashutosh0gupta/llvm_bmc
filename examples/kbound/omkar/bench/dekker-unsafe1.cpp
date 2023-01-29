
int wants_to_enter[2] = {0,0};
int turn = 0;
int var=0;

void thread0(){
      //lock
      loophead:
            wants_to_enter[0] = 1;
            ide_loop:
                  
                  if (wants_to_enter[1] == 0 ) goto endloop;
                  if (turn == 0) goto ide_loop;
                  wants_to_enter[0] = 0;
                  wait:
                        
                        if (turn == 1) goto wait;
                        if (turn == 0) goto loophead;
      endloop:
            //CS
            
            var = var + 1;
            //unlock
            
            turn = 1;
            wants_to_enter[0] = 0;
}
void thread1(){
      //lock
      loophead:
            wants_to_enter[1] = 1;
            ide_loop:
                  
                  if (wants_to_enter[0] == 0 ) goto endloop;
                  if (turn == 1) goto ide_loop;
                  wants_to_enter[1] = 0;
                  wait:
                        
                        if (turn == 0) goto wait;
                        if (turn == 1) goto loophead;
      endloop:
            //CS
            
            var = var + 1;
            //unlock
            
            turn = 0;
            wants_to_enter[1] = 0;
}