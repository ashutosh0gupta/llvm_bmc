with library;
use library;

with math;

package Algorithm is

    RD_Target, HV_Target : float32;
    VelocityRadial, ExhaustVel : float32;
    TimeConst : float32;
 
    Matrix11, Matrix12, Matrix22 : float32;

Procedure CompAngleR (GuidVel : in Math.F32Array1by3;
                        RadialDist,EffectiveGravity,TA,T   : in float32;
                        AngleR : out float32);
                        
Procedure CompAngleY (DistVelAxis,V,T : in float32; AngleY :out float32);

                        
end Algorithm;
