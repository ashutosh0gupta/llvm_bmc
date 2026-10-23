with library;
use library;

package body test_fp1 is

   R : FLOAT32;

   Area   : FLOAT32;     -- This is 23451.2
   Area1, Area2, Area3, Area4, Area5 : float32 := 0.0;
   Length : FLOAT32; -- := 25.123;
   Factor : FLOAT32;-- := 2.0;
   Cover  : FLOAT64;
   --What   : BOOLEAN;
   Index  : short_INTEGER := 4;

procedure fp1 is


begin
                           -- Arithmetic float operations
   Area1 := Length + Factor;	--46.573
   Area2 := Length - Factor;	--3.673
   Area3 := Length * Factor;   -- 1563.40429
   Area4 := Length / Factor;	--2.825984252
   Area5 := (Area2 - Area)/Area3;

                           -- Arithmetic logical compares
--   What := Length =  Factor;
--   What := Length /= Factor;
--   What := Length >  Factor;
--   What := Length >= Factor;
--   What := Length <  Factor;
--   What := Length <= Factor;

--   Area5 := 0.0031 + (0.0273 * TWO_PI) / (Length);
--   Cover := 27.3 * TWO_PI * float64(Area5);

end fp1;

procedure fp1_driver is
	  	  
   begin
   
      Factor := 4.0;
      Area := 2.34512e4;
   
      fp1;
      
   end fp1_driver;

end test_fp1;
