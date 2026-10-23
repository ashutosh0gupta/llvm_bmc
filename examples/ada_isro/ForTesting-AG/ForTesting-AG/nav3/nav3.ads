with library ;
use  library ;

package nav3 is

   DThetaX_sel,DThetaY_sel, DThetaZ_sel : Float32  ; 

   Wrate_X : Float64 := -1.001835668099e-06;
   Wrate_Y : Float64 := 1.001835668099e-06;
   Wrate_Z : Float64 := 3.459020600969e-07;  

   Q0 : Float64 := 3.617626763081e-01;
   Q1 : Float64 := -1.868962016015e-01;
   Q2 : Float64 := 5.886273092910e-01;
   Q3 : Float64 := 6.983662839901e-01;

   dVxEci,dVyEci,dVzEci : Float64;
   Thr_velinc_mjr : Float32;

   Dvx_sel, Dvy_sel, Dvz_sel : Float32;

   MinorID : Unsigned_16 := 0;

   Velinc_Zavc, Velinc_Zavc_Tm : Short_integer;

   procedure proc1;

   procedure proc2;

   procedure nav3_driver;

end nav3;
