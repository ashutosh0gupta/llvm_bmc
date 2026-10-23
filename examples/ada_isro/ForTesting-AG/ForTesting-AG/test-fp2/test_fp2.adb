with library;
use library;

package body test_fp2 is

   A1, A2, A3, A4, A5, A6, A7, A8 : float32 := 0.0;
   Inp1, Inp2, Inp3, Inp4, Inp5 : FLOAT32;
   Out1 : float32;

procedure fp2 is


begin
                           -- Triginometric/ logarithmic float operations
   A1 := Sqrt_Sf(Inp2);
   A2 := Exp_Sf(A1);
   A3 := Sin_Sf(Inp1);
   A4 := Cos_Sf(Inp1);
   A5 := TWO_PI- (Acos_Sf(A3) + Asin_Sf(A4));
   A6 := A3/A4;
   A7 := Atan_sf(A6);
   A8 := Log_Sf(A2);
   Out1 := Median_Sf(Inp3, Inp4, Inp5);

end fp2;

procedure fp2_driver is
	  	  
   begin
   
      Inp1 := pi/4.0;
      Inp2 := 23451.2;
      Inp3 := 0.24;
      Inp4 := 0.26;
      Inp5 := 0.29;
   
      fp2;
      
   end fp2_driver;

end test_fp2;
