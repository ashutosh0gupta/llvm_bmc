package library is
     type Unsigned_16 is mod 2**16;
     type Unsigned_32 is mod 2**32;
     type float32 is digits 6;
     type float64 is digits 15;
--Type Short_Integer is range -2**8 .. 2**8;

Function SQRT_SF(arg: in float32) return float32;
Function FLTLIMIT(value,limit: in float32) return float32;
Function EXP_SF(arg: in float32) return float32;
Function SIN_Sf(arg: in float32) return float32;
Function COS_SF(arg: in float32) return float32;
Function ASIN_SF(arg: in float32) return float32;
Function Acos_SF(arg: in float32) return float32;
Function ATAN_SF(arg: in float32) return float32;
Function ATAN2_SF(Sx,Sy: in float32) return float32;
Function log_SF(arg: in float32) return float32;
function Median_Sf(x,y,z :float32) return float32; 

     function Bit_AND (value1, value2 : Unsigned_16) return Unsigned_16;
     function Bit_OR (value1, value2 : Unsigned_16) return Unsigned_16;
     function Bit_XOR (value1, value2 : Unsigned_16) return Unsigned_16;
     function LBit_XOR (value1, value2 : Unsigned_32) return Unsigned_32;
     function Bit_NOT (value: Unsigned_16) return Unsigned_16;
     function Ushift_Left(value :Unsigned_16; amount:Unsigned_16) return  Unsigned_16;
     function Ushift_Right(value :Unsigned_16; amount:Unsigned_16) return  Unsigned_16;

function F32TOU16 (Value:float32) return Unsigned_16; -- used by Cryo
     function U16TOS16 (Value:Unsigned_16) return short_integer;
     function F32TOS16 (Value:float32) return short_integer;



end library;
