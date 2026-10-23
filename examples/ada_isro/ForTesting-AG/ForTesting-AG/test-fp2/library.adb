with interfaces;
use interfaces;
with Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Elementary_Functions;

package body library is

   Function SQRT_SF(arg: in float32) return float32 is

      Result : float32;
      temp : float;

      begin

        Temp := float(arg);
        Result := float32(sqrt(Temp));
        return Result;

   end SQRT_SF;
   Function ASIN_SF(arg: in float32) return float32 is

      Result : float32;
      temp : float;

      begin

        Temp := float(arg);
        Result := float32(Arcsin(Temp));
        return Result;

   end ASIN_SF;

   Function acos_SF(arg: in float32) return float32 is

      Result : float32;
      temp : float;

      begin

        Temp := float(arg);
        Result := float32(Arccos(Temp));
        return Result;

   end acos_SF;

   Function FLTLIMIT(value,limit: in float32) return float32 is

      Result : float32;

      begin

	Result := value ;

         If( abs(Value) > limit ) then

            If( Value < 0.0 ) then

               Result := -limit;

            else

               Result := limit;

            end if;

         end if;

         return Result;

   end FLTLIMIT;

   Function EXP_SF(arg: in float32) return float32 is

      Result : float32;
      Temp : float;

      begin

            Temp := float(arg);
            Result := float32(EXP(Temp));
            return Result;

   end EXP_SF;

   Function SIN_Sf(arg: in float32) return float32 is

      Result : float32;
      Temp : float;

      begin

         Temp := float(arg);
         Result := float32(Sin(Temp));
--         Result := float32(Fsin(Temp));
         return Result;

   end SIN_SF;

   Function COS_Sf(arg: in float32) return float32 is

      Result : float32;
      Temp : float;

      begin

         Temp := float(arg);
        Result := float32(Cos(Temp));
--         Result := float32(Fcos(Temp));
         return Result;

   end COS_SF;

   Function ATAN2_SF(Sx,Sy: in float32) return float32 is

      Result : float32;
      Temp1,Temp2,Cycle: float;
      Pi : Constant float := 3.14159265358;

      begin

         Cycle := 2.0 * Pi;
         Temp1 := float(Sx);
         Temp2 := float(Sy);
         Result := float32(arctan(Temp1,Temp2,Cycle));
         return Result;

   end ATAN2_SF;

      Function ATAN_SF(Arg: in float32) return float32 is

      Result : float32;
      Temp   : float;

      begin

         Temp := float(Arg);
         Result := float32(arctan(Temp));
         return Result;

   end ATAN_SF;

     function Bit_AND (value1, value2 : Unsigned_16) return Unsigned_16 is
  begin
   return(value1 and value2 );
  end Bit_AND;

   function Bit_OR (value1, value2 : Unsigned_16) return Unsigned_16 is
   begin
     return(value1 or value2 );
   end Bit_OR;

   function Bit_XOR (value1, value2 : Unsigned_16) return Unsigned_16 is
   begin
     return(value1 xor value2 );
   end Bit_XOR;

  function LBit_XOR (value1, value2 : Unsigned_32) return Unsigned_32 is
   begin
     return(value1 xor value2 );
   end LBit_XOR;

   function Bit_NOT (value: Unsigned_16) return Unsigned_16 is
   begin
      return(not value );
   end Bit_NOT;

  function Ushift_Left(value :Unsigned_16; amount:Unsigned_16) return  Unsigned_16 is
  begin
       return library.unsigned_16(Shift_Left(interfaces.unsigned_16(value), natural(amount)));
  end Ushift_Left;

  function Ushift_Right(value :Unsigned_16; amount:Unsigned_16) return  Unsigned_16 is
  begin
      return library.unsigned_16(Shift_Right(interfaces.unsigned_16(value), natural(amount)));
  end Ushift_Right;

  Function Log_SF(arg: in float32) return float32 is

      Result : float32;
      Temp : float;

      begin

            Temp := float(arg);
            Result := float32(log(Temp));
            return Result;

   end log_SF;


function Median_Sf(x,y,z :float32) return float32 is
          t,tt:float32;
          m1,m2,m3:float32;
   begin
 	if(x<=y) then
           m1:=x;
   	   m2:=y;
	else
	   m1:=y;
	   m2:=x;
	end if;

	if(m1<=z) then
           	if (m2<=z) then
	            m3:=z;
		else
	           t:=m2;
		   m2:=z;
		   m3:=t;
		end if;
	end if;

	if(m1>z) then
           t:=m1;
	   tt:=m2;
	   m1:=z;
	   m2:=t;
	   m3:=tt;
	end if;
   return(m2);
end Median_Sf;

function F32TOS16 (Value:float32) return short_integer is
   Temp : short_integer;
 begin
   if (value > 32767.0) then
      Temp :=  32767;

   elsif (value <-32768.0) then
       Temp :=  -32768;

   else
       Temp:= short_integer(value);
   end if;
   return (Temp);
 end F32TOS16;


function F32TOU16 (Value:float32) return Unsigned_16 is
  Temp : Unsigned_16;
 begin
   if (value > 65535.0) then
       Temp :=  65535;

   elsif (value <0.0) then
       Temp :=  0;
 
   else
       Temp:= Unsigned_16(value);
   end if;
   return (Temp);

 end F32TOU16;


function U16TOS16 (Value:Unsigned_16) return short_integer is
   Temp:short_integer;
begin
   if (value >32767) then
      Temp :=32767;

   else
       Temp:= short_integer(value);
   end if;
   return (Temp);
end U16TOS16;


end library;
