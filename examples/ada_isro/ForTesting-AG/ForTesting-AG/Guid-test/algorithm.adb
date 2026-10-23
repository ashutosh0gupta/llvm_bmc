with main;
with library;

package body Algorithm is

Procedure CompAngleR (GuidVel : in Math.F32Array1by3;
                        RadialDist, EffectiveGravity, TA, T   : in float32;
                        AngleR : out float32) is
                        
   DefPos, DefVel, SteerCoeffA, SteerCoeffB : float32;

      begin
        
        -- Calculation of deficiency
      
        DefPos   := -RD_Target + RadialDist + 0.5 * EffectiveGravity * (TA + T) * (TA - T) + GuidVel(3) * T - VelocityRadial * TA;
        DefVel   := GuidVel(3) - VelocityRadial + EffectiveGravity * (TA - T);
        
        -- Matrix elements
        
        Matrix22 := GuidVel(1) - HV_Target * RD_Target/ RadialDist;
        Matrix11 := (0.5 * (TA + T) + TimeConst) * ExhaustVel * (TA - T);
        Matrix11 := Matrix11 + TimeConst * TimeConst * Matrix22;         
        Matrix12 := ExhaustVel * (TA - T) + TimeConst * Matrix22;
        
        -- Steering coefficients
        
	SteerCoeffB  := (Matrix12 * DefPos - Matrix11 * DefVel) /(Matrix12 * Matrix12 - Matrix22 * Matrix11);
        SteerCoeffA  := (DefPos - Matrix12 * SteerCoeffB) / Matrix11;
        
        AngleR 		 := Library.TanInverse(SteerCoeffA * T + SteerCoeffB);
		
        Main.DefPos  := DefPos;
        Main.DefVel  := DefVel;
        
        Main.Matrix11 := Matrix11;
        Main.Matrix12 := Matrix12;
        Main.Matrix22 := Matrix22;
        
        Main.SteerCoeffA := SteerCoeffA;
        Main.SteerCoeffB := SteerCoeffB;

end CompAngleR;
	  
	  
Procedure CompAngleY (DistVelAxis, V, T : in float32; AngleY :out float32) is

    PosDefOutofPlane, SteerCoeffD, SteerCoeffC : float32;
    AngleY_Tan    : float32;

    begin
        
		PosDefOutofPlane := DistVelAxis + V * T;
		
		-- Steering coefficients
        
        SteerCoeffD  := (Matrix12 * PosDefOutofPlane - Matrix11 * V) / (Matrix12 * Matrix12 - Matrix22 * Matrix11);
        SteerCoeffC  := (PosDefOutofPlane - Matrix12 * SteerCoeffD)/Matrix11;
            
	AngleY_Tan := SteerCoeffC * T + SteerCoeffD;
        AngleY := Library.TanInverse(AngleY_Tan);
        
        Main.SteerCoeffC	:= SteerCoeffC;
        Main.SteerCoeffD	:= SteerCoeffD;
         
        Main.PosDefOutofPlane	:= PosDefOutofPlane;
		 
end CompAngleY;	  

end Algorithm;
