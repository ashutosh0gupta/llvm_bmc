with interfaces;
use interfaces;
with Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Elementary_Functions;
with Ada.Numerics.Generic_Elementary_Functions;

package body library is

   Function SQRT_SF(arg: in float32) return float32 is

      Result : float32;
      temp : float;

      begin

        Temp := float(arg);
        Result := float32(sqrt(Temp));
        return Result;

   end SQRT_SF;

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


function Sin_f(value :float64) return float64 is
     
   begin
      return float64(sin(float(value)));
   end   Sin_f;

   function Cos_f(value :float64) return float64 is
       begin
      return float64(cos(float(value)));
   end   Cos_f;

   function atan2_f(value1:float64;value2 :float64:=1.0) return float64 is
       begin
     return float64(Arctan(float(value1),float(value2)));
   end   atan2_f;

   function Sqrt_f(value :float64) return float64 is
        begin
     return float64(sqrt(float(value)));
   end   Sqrt_f;

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
      --setbit (0, src=>AEWord, dst=>AEWord);
   elsif (value <-32768.0) then
       Temp :=  -32768;
       --setbit (0, src=>AEWord, dst=>AEWord);
   else
       Temp:= short_integer(value);
   end if;
   return (Temp);
 end F32TOS16;

end library;
