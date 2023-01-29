void dmbsy();
long int flag[2];
long int var;

void thread0(){
    if(var == 1) return;
    //lock
    flag[0]=1;
    dmbsy();
    while(flag[1] == 1) {dmbsy();}
    //CS
    dmbsy();
    if(var == 0){
        dmbsy();
        var = var + 1;
    }
    //unlock
    dmbsy();
    flag[0] = 0;
}

void thread1(){
    if(var == 1) return;
    //lock
    while(1){
        flag[1] = 0;
        dmbsy();
        if(flag[0] == 1) continue;
        dmbsy();
        flag[1] = 1;
        dmbsy();
        if(flag[0] == 0) break;
    }
    //CS
    dmbsy();
    if(var == 0){
        dmbsy();
        var = var + 1;
    }
    //unlock
    dmbsy();
    flag[1] = 0;
}