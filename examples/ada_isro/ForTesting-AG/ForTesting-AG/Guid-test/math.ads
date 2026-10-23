with library;
use library;

package Math is

Type F32Array25by4 is array (short_integer range 1..25, short_integer range 1..4) of float32;

Type F32Array1by3 is array (short_integer range 1..3) of float32;

Type Array3by3 is array (short_integer range 1..3, short_integer range 1..3) of float32;

Type Quaternion is array (short_integer range 1..4) of float32;

procedure DotProduct (Vec1,Vec2 : in F32Array1by3; DotOut: out float32);

procedure CrossProduct (Vec1, Vec2 : in F32Array1by3; Vec3 : out F32Array1by3);

procedure Normalise (Q : in out Quaternion);

procedure DirCosine (VecIn : in F32Array1by3; DCOut : out F32Array1by3);

procedure Multiply (Q1,Q2 : in Quaternion; Q3 : out Quaternion);

procedure Inverse (Q : in Quaternion; Qinv : out Quaternion);

procedure Negate (Q : in out Quaternion);

procedure GuidECITransform (DirCosVar1, DirCosVar2, DirCosVar3 : in F32Array1by3;
                       AngR,AngY : in Float32;
                       TransformOut : out F32Array1by3);
                       
procedure GenRates (AcclnVec : in F32Array1by3; QP : in Quaternion;
                      CmdBRate : out F32Array1by3);
                      
end Math;
