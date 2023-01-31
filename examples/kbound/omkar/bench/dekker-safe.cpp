void dmbsy();

long int wants_to_enter[2] = {0,0};
long int turn = 0;
long int var=0;

void thread0(){
      //lock
      loophead:
            wants_to_enter[0] = 1;
            ide_loop:
                  dmbsy();
                  if (wants_to_enter[1] == 0 ) goto endloop;
                  if (turn == 0) goto ide_loop;
                  wants_to_enter[0] = 0;
                  wait:
                        dmbsy();
                        if (turn == 1) goto wait;
                        if (turn == 0) goto loophead;
      endloop:
            //CS
            dmbsy();
            var = var + 1;
            //unlock
            dmbsy();
            turn = 1;
            wants_to_enter[0] = 0;
}
void thread1(){
      //lock
      loophead:
            wants_to_enter[1] = 1;
            ide_loop:
                  dmbsy();
                  if (wants_to_enter[0] == 0 ) goto endloop;
                  if (turn == 1) goto ide_loop;
                  wants_to_enter[1] = 0;
                  wait:
                        dmbsy();
                        if (turn == 0) goto wait;
                        if (turn == 1) goto loophead;
      endloop:
            //CS
            dmbsy();
            var = var + 1;
            //unlock
            dmbsy();
            turn = 0;
            wants_to_enter[1] = 0;
}