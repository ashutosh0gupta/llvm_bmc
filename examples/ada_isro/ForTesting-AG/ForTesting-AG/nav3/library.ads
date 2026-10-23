package library is
     type Unsigned_16 is mod 2**16;
     type Unsigned_32 is mod 2**32;
     type float32 is digits 6;
     type float64 is digits 15;

Function SQRT_SF(arg: in float32) return float32;
Function FLTLIMIT(value,limit: in float32) return float32;
function Median_Sf(x,y,z :float32) return float32; 
function Sin_f(value :float64) return float64;
     function Cos_f(value :float64) return float64;
function atan2_f(value1:float64;value2 :float64:=1.0) return float64;
     function sqrt_f(value: float64) return float64;
     
     function Bit_AND (value1, value2 : Unsigned_16) return Unsigned_16;
     function Bit_OR (value1, value2 : Unsigned_16) return Unsigned_16;
     function Bit_XOR (value1, value2 : Unsigned_16) return Unsigned_16;
     function F32TOS16 (Value:float32) return short_integer;

end library;
