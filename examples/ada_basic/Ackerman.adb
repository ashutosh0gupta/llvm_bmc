
procedure ACKERMAN is


   AP1 : constant  := 1;
   AP2 : constant := 2;
   X : short_integer := 0;
   function AF(FP1,FP2 : short_integer) return short_integer is
      RETVAL : short_integer;
   begin
      if FP1 = 0 then
         RETVAL := FP2 + 1;
      elsif FP2 = 0 then
         RETVAL := AF(FP1-1,1);
      else
         RETVAL := AF(FP1-1,AF(FP1,FP2-1));
      end if;
      return(RETVAL);
   end AF;
begin
   X := AF(AP1,AP2);
   PUT("The value returned by Ackerman function is :");
   PUT(X);
end ACKERMAN;
