void assert(bool);
long int level0, level1, level2, level3, level4, level5, level6, level7;
long int waiting0, waiting1, waiting2, waiting3, waiting4, waiting5, waiting6;
long int _cc_x;
long int __fence_var;
void thread0(){
		while(1){
				level0 = 0;
		
		waiting0=0;
		
		if(waiting0!=0 || (level1 < 0 && level2 < 0 && level3 < 0 && level4 < 0 && level5 < 0 && level6 < 0 && level7 < 0 && 1)) return;
		level0 = 1;
		
		waiting1=0;
		
		if(waiting1!=0 || (level1 < 1 && level2 < 1 && level3 < 1 && level4 < 1 && level5 < 1 && level6 < 1 && level7 < 1 && 1)) return;
		level0 = 2;
		
		waiting2=0;
		
		if(waiting2!=0 || (level1 < 2 && level2 < 2 && level3 < 2 && level4 < 2 && level5 < 2 && level6 < 2 && level7 < 2 && 1)) return;
		level0 = 3;
		
		waiting3=0;
		
		if(waiting3!=0 || (level1 < 3 && level2 < 3 && level3 < 3 && level4 < 3 && level5 < 3 && level6 < 3 && level7 < 3 && 1)) return;
		level0 = 4;
		
		waiting4=0;
		
		if(waiting4!=0 || (level1 < 4 && level2 < 4 && level3 < 4 && level4 < 4 && level5 < 4 && level6 < 4 && level7 < 4 && 1)) return;
		level0 = 5;
		
		waiting5=0;
		
		if(waiting5!=0 || (level1 < 5 && level2 < 5 && level3 < 5 && level4 < 5 && level5 < 5 && level6 < 5 && level7 < 5 && 1)) return;
		level0 = 6;
		
		waiting6=0;
		
		if(waiting6!=0 || (level1 < 6 && level2 < 6 && level3 < 6 && level4 < 6 && level5 < 6 && level6 < 6 && level7 < 6 && 1)) return;
		_cc_x = 0;
		assert(_cc_x==0);
		
		level0 = 0;
		}
}
void thread1(){
		while(1){
				level1 = 0;
		
		waiting0=1;
		
		if(waiting0!=1 || (level0 < 0 && level2 < 0 && level3 < 0 && level4 < 0 && level5 < 0 && level6 < 0 && level7 < 0 && 1)) return;
		level1 = 1;
		
		waiting1=1;
		
		if(waiting1!=1 || (level0 < 1 && level2 < 1 && level3 < 1 && level4 < 1 && level5 < 1 && level6 < 1 && level7 < 1 && 1)) return;
		level1 = 2;
		
		waiting2=1;
		
		if(waiting2!=1 || (level0 < 2 && level2 < 2 && level3 < 2 && level4 < 2 && level5 < 2 && level6 < 2 && level7 < 2 && 1)) return;
		level1 = 3;
		
		waiting3=1;
		
		if(waiting3!=1 || (level0 < 3 && level2 < 3 && level3 < 3 && level4 < 3 && level5 < 3 && level6 < 3 && level7 < 3 && 1)) return;
		level1 = 4;
		
		waiting4=1;
		
		if(waiting4!=1 || (level0 < 4 && level2 < 4 && level3 < 4 && level4 < 4 && level5 < 4 && level6 < 4 && level7 < 4 && 1)) return;
		level1 = 5;
		
		waiting5=1;
		
		if(waiting5!=1 || (level0 < 5 && level2 < 5 && level3 < 5 && level4 < 5 && level5 < 5 && level6 < 5 && level7 < 5 && 1)) return;
		level1 = 6;
		
		waiting6=1;
		
		if(waiting6!=1 || (level0 < 6 && level2 < 6 && level3 < 6 && level4 < 6 && level5 < 6 && level6 < 6 && level7 < 6 && 1)) return;
		_cc_x = 1;
		assert(_cc_x==1);
		
		level1 = 0;
		}
}
void thread2(){
		while(1){
				level2 = 0;
		
		waiting0=2;
		
		if(waiting0!=2 || (level0 < 0 && level1 < 0 && level3 < 0 && level4 < 0 && level5 < 0 && level6 < 0 && level7 < 0 && 1)) return;
		level2 = 1;
		
		waiting1=2;
		
		if(waiting1!=2 || (level0 < 1 && level1 < 1 && level3 < 1 && level4 < 1 && level5 < 1 && level6 < 1 && level7 < 1 && 1)) return;
		level2 = 2;
		
		waiting2=2;
		
		if(waiting2!=2 || (level0 < 2 && level1 < 2 && level3 < 2 && level4 < 2 && level5 < 2 && level6 < 2 && level7 < 2 && 1)) return;
		level2 = 3;
		
		waiting3=2;
		
		if(waiting3!=2 || (level0 < 3 && level1 < 3 && level3 < 3 && level4 < 3 && level5 < 3 && level6 < 3 && level7 < 3 && 1)) return;
		level2 = 4;
		
		waiting4=2;
		
		if(waiting4!=2 || (level0 < 4 && level1 < 4 && level3 < 4 && level4 < 4 && level5 < 4 && level6 < 4 && level7 < 4 && 1)) return;
		level2 = 5;
		
		waiting5=2;
		
		if(waiting5!=2 || (level0 < 5 && level1 < 5 && level3 < 5 && level4 < 5 && level5 < 5 && level6 < 5 && level7 < 5 && 1)) return;
		level2 = 6;
		
		waiting6=2;
		
		if(waiting6!=2 || (level0 < 6 && level1 < 6 && level3 < 6 && level4 < 6 && level5 < 6 && level6 < 6 && level7 < 6 && 1)) return;
		_cc_x = 2;
		assert(_cc_x==2);
		
		level2 = 0;
		}
}
void thread3(){
		while(1){
				level3 = 0;
		
		waiting0=3;
		
		if(waiting0!=3 || (level0 < 0 && level1 < 0 && level2 < 0 && level4 < 0 && level5 < 0 && level6 < 0 && level7 < 0 && 1)) return;
		level3 = 1;
		
		waiting1=3;
		
		if(waiting1!=3 || (level0 < 1 && level1 < 1 && level2 < 1 && level4 < 1 && level5 < 1 && level6 < 1 && level7 < 1 && 1)) return;
		level3 = 2;
		
		waiting2=3;
		
		if(waiting2!=3 || (level0 < 2 && level1 < 2 && level2 < 2 && level4 < 2 && level5 < 2 && level6 < 2 && level7 < 2 && 1)) return;
		level3 = 3;
		
		waiting3=3;
		
		if(waiting3!=3 || (level0 < 3 && level1 < 3 && level2 < 3 && level4 < 3 && level5 < 3 && level6 < 3 && level7 < 3 && 1)) return;
		level3 = 4;
		
		waiting4=3;
		
		if(waiting4!=3 || (level0 < 4 && level1 < 4 && level2 < 4 && level4 < 4 && level5 < 4 && level6 < 4 && level7 < 4 && 1)) return;
		level3 = 5;
		
		waiting5=3;
		
		if(waiting5!=3 || (level0 < 5 && level1 < 5 && level2 < 5 && level4 < 5 && level5 < 5 && level6 < 5 && level7 < 5 && 1)) return;
		level3 = 6;
		
		waiting6=3;
		
		if(waiting6!=3 || (level0 < 6 && level1 < 6 && level2 < 6 && level4 < 6 && level5 < 6 && level6 < 6 && level7 < 6 && 1)) return;
		_cc_x = 3;
		assert(_cc_x==3);
		
		level3 = 0;
		}
}
void thread4(){
		while(1){
				level4 = 0;
		
		waiting0=4;
		
		if(waiting0!=4 || (level0 < 0 && level1 < 0 && level2 < 0 && level3 < 0 && level5 < 0 && level6 < 0 && level7 < 0 && 1)) return;
		level4 = 1;
		
		waiting1=4;
		
		if(waiting1!=4 || (level0 < 1 && level1 < 1 && level2 < 1 && level3 < 1 && level5 < 1 && level6 < 1 && level7 < 1 && 1)) return;
		level4 = 2;
		
		waiting2=4;
		
		if(waiting2!=4 || (level0 < 2 && level1 < 2 && level2 < 2 && level3 < 2 && level5 < 2 && level6 < 2 && level7 < 2 && 1)) return;
		level4 = 3;
		
		waiting3=4;
		
		if(waiting3!=4 || (level0 < 3 && level1 < 3 && level2 < 3 && level3 < 3 && level5 < 3 && level6 < 3 && level7 < 3 && 1)) return;
		level4 = 4;
		
		waiting4=4;
		
		if(waiting4!=4 || (level0 < 4 && level1 < 4 && level2 < 4 && level3 < 4 && level5 < 4 && level6 < 4 && level7 < 4 && 1)) return;
		level4 = 5;
		
		waiting5=4;
		
		if(waiting5!=4 || (level0 < 5 && level1 < 5 && level2 < 5 && level3 < 5 && level5 < 5 && level6 < 5 && level7 < 5 && 1)) return;
		level4 = 6;
		
		waiting6=4;
		
		if(waiting6!=4 || (level0 < 6 && level1 < 6 && level2 < 6 && level3 < 6 && level5 < 6 && level6 < 6 && level7 < 6 && 1)) return;
		_cc_x = 4;
		assert(_cc_x==4);
		
		level4 = 0;
		}
}
void thread5(){
		while(1){
				level5 = 0;
		
		waiting0=5;
		
		if(waiting0!=5 || (level0 < 0 && level1 < 0 && level2 < 0 && level3 < 0 && level4 < 0 && level6 < 0 && level7 < 0 && 1)) return;
		level5 = 1;
		
		waiting1=5;
		
		if(waiting1!=5 || (level0 < 1 && level1 < 1 && level2 < 1 && level3 < 1 && level4 < 1 && level6 < 1 && level7 < 1 && 1)) return;
		level5 = 2;
		
		waiting2=5;
		
		if(waiting2!=5 || (level0 < 2 && level1 < 2 && level2 < 2 && level3 < 2 && level4 < 2 && level6 < 2 && level7 < 2 && 1)) return;
		level5 = 3;
		
		waiting3=5;
		
		if(waiting3!=5 || (level0 < 3 && level1 < 3 && level2 < 3 && level3 < 3 && level4 < 3 && level6 < 3 && level7 < 3 && 1)) return;
		level5 = 4;
		
		waiting4=5;
		
		if(waiting4!=5 || (level0 < 4 && level1 < 4 && level2 < 4 && level3 < 4 && level4 < 4 && level6 < 4 && level7 < 4 && 1)) return;
		level5 = 5;
		
		waiting5=5;
		
		if(waiting5!=5 || (level0 < 5 && level1 < 5 && level2 < 5 && level3 < 5 && level4 < 5 && level6 < 5 && level7 < 5 && 1)) return;
		level5 = 6;
		
		waiting6=5;
		
		if(waiting6!=5 || (level0 < 6 && level1 < 6 && level2 < 6 && level3 < 6 && level4 < 6 && level6 < 6 && level7 < 6 && 1)) return;
		_cc_x = 5;
		assert(_cc_x==5);
		
		level5 = 0;
		}
}
void thread6(){
		while(1){
				level6 = 0;
		
		waiting0=6;
		
		if(waiting0!=6 || (level0 < 0 && level1 < 0 && level2 < 0 && level3 < 0 && level4 < 0 && level5 < 0 && level7 < 0 && 1)) return;
		level6 = 1;
		
		waiting1=6;
		
		if(waiting1!=6 || (level0 < 1 && level1 < 1 && level2 < 1 && level3 < 1 && level4 < 1 && level5 < 1 && level7 < 1 && 1)) return;
		level6 = 2;
		
		waiting2=6;
		
		if(waiting2!=6 || (level0 < 2 && level1 < 2 && level2 < 2 && level3 < 2 && level4 < 2 && level5 < 2 && level7 < 2 && 1)) return;
		level6 = 3;
		
		waiting3=6;
		
		if(waiting3!=6 || (level0 < 3 && level1 < 3 && level2 < 3 && level3 < 3 && level4 < 3 && level5 < 3 && level7 < 3 && 1)) return;
		level6 = 4;
		
		waiting4=6;
		
		if(waiting4!=6 || (level0 < 4 && level1 < 4 && level2 < 4 && level3 < 4 && level4 < 4 && level5 < 4 && level7 < 4 && 1)) return;
		level6 = 5;
		
		waiting5=6;
		
		if(waiting5!=6 || (level0 < 5 && level1 < 5 && level2 < 5 && level3 < 5 && level4 < 5 && level5 < 5 && level7 < 5 && 1)) return;
		level6 = 6;
		
		waiting6=6;
		
		if(waiting6!=6 || (level0 < 6 && level1 < 6 && level2 < 6 && level3 < 6 && level4 < 6 && level5 < 6 && level7 < 6 && 1)) return;
		_cc_x = 6;
		assert(_cc_x==6);
		
		level6 = 0;
		}
}
void thread7(){
		while(1){
				level7 = 0;
		
		waiting0=7;
		
		if(waiting0!=7 || (level0 < 0 && level1 < 0 && level2 < 0 && level3 < 0 && level4 < 0 && level5 < 0 && level6 < 0 && 1)) return;
		level7 = 1;
		
		waiting1=7;
		
		if(waiting1!=7 || (level0 < 1 && level1 < 1 && level2 < 1 && level3 < 1 && level4 < 1 && level5 < 1 && level6 < 1 && 1)) return;
		level7 = 2;
		
		waiting2=7;
		
		if(waiting2!=7 || (level0 < 2 && level1 < 2 && level2 < 2 && level3 < 2 && level4 < 2 && level5 < 2 && level6 < 2 && 1)) return;
		level7 = 3;
		
		waiting3=7;
		
		if(waiting3!=7 || (level0 < 3 && level1 < 3 && level2 < 3 && level3 < 3 && level4 < 3 && level5 < 3 && level6 < 3 && 1)) return;
		level7 = 4;
		
		waiting4=7;
		
		if(waiting4!=7 || (level0 < 4 && level1 < 4 && level2 < 4 && level3 < 4 && level4 < 4 && level5 < 4 && level6 < 4 && 1)) return;
		level7 = 5;
		
		waiting5=7;
		
		if(waiting5!=7 || (level0 < 5 && level1 < 5 && level2 < 5 && level3 < 5 && level4 < 5 && level5 < 5 && level6 < 5 && 1)) return;
		level7 = 6;
		
		waiting6=7;
		
		if(waiting6!=7 || (level0 < 6 && level1 < 6 && level2 < 6 && level3 < 6 && level4 < 6 && level5 < 6 && level6 < 6 && 1)) return;
		_cc_x = 7;
		assert(_cc_x==7);
		
		level7 = 0;
		}
}
