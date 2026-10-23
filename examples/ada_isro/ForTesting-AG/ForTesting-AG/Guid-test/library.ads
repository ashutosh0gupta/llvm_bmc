
package library is


     type Unsigned_16 is mod 2**16;
     type Unsigned_32 is mod 2**32; 
     type Unsigned_64 is mod 2**64;

     type float32 is digits 6;
     type float64 is digits 15;

     function Bit_AND (value1, value2 : Unsigned_16) return Unsigned_16;
     function Bit_OR (value1, value2 : Unsigned_16) return Unsigned_16;
     function Bit_XOR (value1, value2 : Unsigned_16) return Unsigned_16;
     function LBit_XOR (value1, value2 : Unsigned_32) return Unsigned_32;
     function Bit_NOT (value: Unsigned_16) return Unsigned_16;
     function Ushift_Left(value :Unsigned_16; amount:Unsigned_16) return  Unsigned_16;
     function Ushift_Right(value :Unsigned_16; amount:Unsigned_16) return  Unsigned_16;

     function Sine(value :float32) return float32;
     function Cosine(value :float32) return float32;
     function tan_Sf(value :float32) return float32;
     Function SinInverse(value: float32) return float32;
     Function CosInverse(value: float32) return float32;
     function TanInverse(value1:float32;value2 :float32:=1.0) return float32;
     function SquareRoot(value: float32) return float32;
     function Median_Sf(x,y,z :float32) return float32;     
     function Sin_f(value :float64) return float64;
     function Cos_f(value :float64) return float64;
     function tan_f(value :float64) return float64;
     function atan2_f(value1:float64;value2 :float64:=1.0) return float64;
     function sqrt_f(value: float64) return float64;

     Function Exponent(arg: in float32) return float32;
     Function log(arg: in float32) return float32;

     function FltLimit(value1, value2 :float32) return float32;
     function Mod180_F(value :float64) return float64;

     function F32TOU16 (Value:float32) return Unsigned_16; -- used by Cryo
     function U16TOS16 (Value:Unsigned_16) return short_integer;
     function F32TOS16 (Value:float32) return short_integer;



end library;
