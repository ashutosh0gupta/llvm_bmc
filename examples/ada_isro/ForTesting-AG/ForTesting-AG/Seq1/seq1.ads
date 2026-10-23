with library;
use library;

package seq1 is

   Err_Flag: Unsigned_16 := 16#0000#;

   Evntnumother,Evntnumotherc : Unsigned_16;
   Input_Event, Input_EventC : Unsigned_16;
   OtherMMCPillBoxSts, OtherMMCPillBoxStsC :  Unsigned_16;

   Setflag      : constant := 16#AAAA#;
   Notsetflag   : constant := 16#5555#;

   procedure proc1;
   procedure seq1_driver;

end seq1;
