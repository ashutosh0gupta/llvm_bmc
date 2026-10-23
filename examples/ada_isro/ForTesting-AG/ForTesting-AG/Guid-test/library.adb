with interfaces;
use interfaces;
with Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Elementary_Functions;
with Ada.Numerics.Generic_Elementary_Functions;

package body library is

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

   function Sine(value :float32) return float32 is
     package Float32_Lib is new Ada.Numerics.Generic_Elementary_Functions(float32);
     use Float32_Lib;
   begin
      return sin(value);
   end   Sine;

   function Cosine(value :float32) return float32 is
     package Float32_Lib is new Ada.Numerics.Generic_Elementary_Functions(float32);
     use Float32_Lib;
   begin
      return cos(value);
   end   Cosine;

   function tan_Sf(value :float32) return float32 is
     package Float32_Lib is new Ada.Numerics.Generic_Elementary_Functions(float32);
     use Float32_Lib;
   begin
       return tan(value);
   end   tan_Sf;

   function TanInverse(value1:float32;value2 :float32:=1.0) return float32 is
     package Float32_Lib is new Ada.Numerics.Generic_Elementary_Functions(float32);
     use Float32_Lib;
   begin
       return arctan(value1,value2);
   end   TanInverse;

   function SquareRoot(value :float32) return float32 is
     package Float32_Lib is new Ada.Numerics.Generic_Elementary_Functions(float32);
     use Float32_Lib;
   begin
     return sqrt(value);
   end   SquareRoot;

   function Sin_f(value :float64) return float64 is
     package Float64_Lib is new Ada.Numerics.Generic_Elementary_Functions(float64);
     use Float64_Lib;
   begin
      return sin(value);
   end   Sin_f;

   function Cos_f(value :float64) return float64 is
    package Float64_Lib is new Ada.Numerics.Generic_Elementary_Functions(float64);
    use Float64_Lib;
   begin
      return cos(value);
   end   Cos_f;

   Function SinInverse(value: in float32) return float32 is

      Result : float32;
      temp : float;

      begin

        Temp := float(value);
        Result := float32(Arcsin(Temp));
        return Result;

   end SinInverse;

   Function CosInverse(value: in float32) return float32 is

      Result : float32;
      temp : float;

      begin

        Temp := float(value);
        Result := float32(Arccos(Temp));
        return Result;

   end CosInverse;

   function atan2_f(value1:float64;value2 :float64:=1.0) return float64 is
     package Float64_Lib is new Ada.Numerics.Generic_Elementary_Functions(float64);
     use Float64_Lib;
   begin
     return Arctan(value1,value2);
   end   atan2_f;

   function tan_f(value :float64) return float64 is
     package Float64_Lib is new Ada.Numerics.Generic_Elementary_Functions(float64);
     use Float64_Lib;
   begin
     return tan(value);
   end  tan_f;

   function Sqrt_f(value :float64) return float64 is
     package Float64_Lib is new Ada.Numerics.Generic_Elementary_Functions(float64);
     use Float64_Lib;
   begin
     return sqrt(value);
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


function F32TOU16 (Value:float32) return Unsigned_16 is
  Temp : Unsigned_16;
 begin
   if (value > 65535.0) then
       Temp :=  65535;
--       setbit (1, src=>AEWord, dst=>AEWord);
   elsif (value <0.0) then
       Temp :=  0;
 --      setbit (1, src=>AEWord, dst=>AEWord);
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
  --    setbit (12, src=>AEWord, dst=>AEWord);
   else
       Temp:= short_integer(value);
   end if;
   return (Temp);
end U16TOS16;


Function Exponent(arg: in float32) return float32 is

      Result : float32;
      Temp : float;

      begin

            Temp := float(arg);
            Result := float32(EXP(Temp));
            return Result;

end Exponent;

Function Log(arg: in float32) return float32 is

      Result : float32;
      Temp : float;

      begin

            Temp := float(arg);
            Result := float32(log(Temp));
            return Result;

end log;

function FltLimit(value1, value2 :float32) return float32 is
     package Float32_Lib is new Ada.Numerics.Generic_Elementary_Functions(float32);
     use Float32_Lib;
     Temp : float32;
   begin
     if (value1 > value2) then
      Temp := value2;
   else
      Temp:= value1;
   end if;
   return (Temp);
end  FltLimit;


function Mod180_F(value :float64) return float64 is
     package Float64_Lib is new Ada.Numerics.Generic_Elementary_Functions(float64);
     use Float64_Lib;
   begin
     
   return(value);
end  Mod180_F;

end library;
