with library;
use library;
package LS_Rates is

   type S16Array1by2 is array(unsigned_16 range 1..2) of Short_Integer;
   type S16Array1by3 is array(unsigned_16 range 1..3) of Short_Integer;
   type U16Array1by2 is array(unsigned_16 range 1..2) of unsigned_16;
   type U16Array1by3 is array(unsigned_16 range 1..3) of unsigned_16;   
   type F32Array1by3 is array(unsigned_16 range 1..3) of Float32;
   type F32Array3by100 is array(unsigned_16 range 1..3 , unsigned_16 range 1..100) of Float32;   

   MessageFail : U16Array1by2;

   Raw_Rate1, Raw_Rate2 : S16Array1by3;
   HealthParameter : S16Array1by2;

   RefRate : F32Array1by3;  

   OutputRate : F32Array1by3; 
   LS_Rates_Fail : Unsigned_16 ; 

   ErrorBoth : U16Array1by3; 
   
   procedure Initialise_LS; 
   procedure LS_Rates_Main;           

end LS_Rates; 
