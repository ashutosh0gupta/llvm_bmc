with library;
use library;

package body seq1 is

procedure proc1 is

   Temp1, Temp2 : Unsigned_16;

   begin
     
       Input_Event       :=  Bit_And(Evntnumother, 16#00FF#);
       Input_Eventc      :=  Bit_And(Evntnumotherc, 16#00FF#);
       
       Temp1 := Bit_And(Evntnumother, 16#FF00#);
       
       if (Temp1 = 16#AA00#) then
             OtherMMCPillBoxSts  := Setflag;
             OtherMMCPillBoxStsC := NotSetflag;
       else
             OtherMMCPillBoxSts  := NotSetflag;
             OtherMMCPillBoxStsC := Setflag;
       end if; 

       if (Input_Event + Input_EventC /= 16#FFFF#) then
	      Err_Flag := 16#0001#;
       end if;      
   end proc1;

procedure seq1_driver is

   begin

      Evntnumother  := 16#5511#;
      Evntnumotherc := 16#AAEE#;
      proc1;

end seq1_driver;

end seq1;
