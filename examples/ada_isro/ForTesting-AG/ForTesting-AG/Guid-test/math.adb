with library;

package body Math is
    
    
procedure DotProduct (Vec1, Vec2 : in F32Array1by3; DotOut: out float32) is
  begin
      DotOut := Vec1(1) * Vec2(1) + Vec1(2) * Vec2(2) + Vec1(3) * Vec2(3);
  end DotProduct;
  
  
procedure CrossProduct (Vec1, Vec2 : in F32Array1by3; Vec3 : out F32Array1by3) is
     begin
     
            Vec3(1) := Vec1(2) * Vec2(3) - Vec1(3) * Vec2(2);
            Vec3(2) := Vec1(3) * Vec2(1) - Vec1(1) * Vec2(3);
            Vec3(3) := Vec1(1) * Vec2(2) - Vec1(2) * Vec2(1);

     end CrossProduct; 
     

procedure Normalise (Q : in out Quaternion) is

     TempN : float32;

     begin

       TempN := Library.SquareRoot(Q(1)*Q(1) + Q(2)*Q(2) + Q(3)*Q(3) + Q(4)*Q(4));

       Q(1) := Q(1) / TempN;
       Q(2) := Q(2) / TempN;
       Q(3) := Q(3) / TempN;
       Q(4) := Q(4) / TempN;
       
     end Normalise;           

procedure DirCosine (VecIn : in F32Array1by3; DCOut : out F32Array1by3) is

   TempS : float32;

   begin

       TempS := Library.SquareRoot(VecIn(1) * VecIn(1) + VecIn(2) * VecIn(2) + VecIn(3) * VecIn(3));

       DCOut(1) := VecIn(1) / TempS;
       DCOut(2) := VecIn(2) / TempS;
       DCOut(3) := VecIn(2) / TempS;

   end DirCosine;
     
     
procedure Multiply (Q1,Q2 : in Quaternion; Q3 : out Quaternion) is
     begin

       Q3(1) := -Q2(2) * Q1(2) - Q2(3) * Q1(3) - Q2(4) * Q1(4) + Q2(1) * Q1(1);
       Q3(2) :=  Q2(1) * Q1(2) + Q2(4) * Q1(3) - Q2(3) * Q1(4) + Q2(2) * Q1(1);
       Q3(3) := -Q2(4) * Q1(2) + Q2(1) * Q1(3) + Q2(2) * Q1(4) + Q2(3) * Q1(1);
       Q3(4) :=  Q2(3) * Q1(2) - Q2(2) * Q1(3) + Q2(1) * Q1(4) + Q2(4) * Q1(1);

     end Multiply;
     
     
procedure Inverse (Q : in Quaternion; Qinv : out Quaternion) is
     begin

       Qinv(1) :=  Q(1);
       Qinv(2) := -Q(2);
       Qinv(3) := -Q(3);
       Qinv(4) := -Q(4);

     end Inverse;     
     
          
procedure Negate (Q : in out Quaternion) is
     begin

      if(Q(1) < 0.0 )then
       Q(1) := -Q(1);
       Q(2) := -Q(2);
       Q(3) := -Q(3);
       Q(4) := -Q(4);
      end if;

     end Negate;
     
     
procedure GuidECITransform (DirCosVar1, DirCosVar2, DirCosVar3 : in F32Array1by3;
                       AngR,AngY : in Float32;
                       TransformOut : out F32Array1by3) is
                       
   CosAngR, CosAngY, SinAngR, SinAngY : Float32;

   begin
   
   		 CosAngR :=   Library.Cosine(AngR);
   		 CosAngY :=   Library.Cosine(AngY);
   		 SinAngR :=   Library.Sine(AngR);
   		 SinAngY :=   Library.Sine(AngY);
   
         TransformOut(1)   := DirCosVar1(1) * CosAngR * CosAngY + DirCosVar2(1) * CosAngR * SinAngY + DirCosVar3(1) * SinAngR;
         TransformOut(2)   := DirCosVar1(2) * CosAngR * CosAngY + DirCosVar2(2) * CosAngR * SinAngY + DirCosVar3(2) * SinAngR;
         TransformOut(3)   := DirCosVar1(3) * CosAngR * CosAngY + DirCosVar2(3) * CosAngR * SinAngY + DirCosVar3(3) * SinAngR;

   end GuidECITransform;
   
   
procedure GenRates (AcclnVec : in F32Array1by3; QP : in Quaternion;
                      CmdBRate : out F32Array1by3) is

     CmdThrust               : Array3by3;
     AngleX,AngleY           : float32;
     
     begin

       CmdThrust(1,1) :=  1.0 - 2.0 * (QP(3) * QP(3) + QP(4) * QP(4));
       CmdThrust(1,2) :=        2.0 * (QP(2) * QP(3) - QP(1) * QP(4));
       CmdThrust(1,3) :=        2.0 * (QP(2) * QP(4) + QP(1) * QP(3));

       CmdThrust(2,1) :=        2.0 * (QP(2) * QP(3) + QP(1) * QP(4));
       CmdThrust(2,2) :=  1.0 - 2.0 * (QP(2) * QP(2) + QP(4) * QP(4));
       CmdThrust(2,3) :=        2.0 * (QP(3) * QP(4) - QP(1) * QP(2));

       CmdThrust(3,1) :=        2.0 * (QP(2) * QP(4) - QP(1) * QP(3));
       CmdThrust(3,2) :=        2.0 * (QP(3) * QP(4) + QP(1) * QP(2));
       CmdThrust(3,3) :=  1.0 - 2.0 * (QP(2) * QP(2) + QP(3) * QP(3));

       AngleX  := -Library.SinInverse(CmdThrust(1,2) * AcclnVec(1) + CmdThrust(2,2) * AcclnVec(2) + CmdThrust(3,2) * AcclnVec(3));

       AngleY  := Library.SinInverse(CmdThrust(1,1) * AcclnVec(1) + CmdThrust(2,1) * AcclnVec(2) + CmdThrust(3,1) * AcclnVec(3));

       CmdBRate(1) := 2.0 * AngleX;
       CmdBRate(2) := 2.0 * AngleY;
       CmdBRate(3) := 0.0;

   end GenRates;  
   
end Math;    
