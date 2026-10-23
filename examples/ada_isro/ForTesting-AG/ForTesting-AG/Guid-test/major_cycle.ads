with library;
use library;

with math;

package Major_Cycle is

      Event4                     			: Unsigned_16;
      MinorFlag_Stage2, MinorFlag_Stage3	: Unsigned_16;
      VelFlag                    			: Unsigned_16;
      EnterStage2, EnterStage3              : Unsigned_16;

      VelocityCoeff, VelocityIncrMn, VelocityIncrMj  : Float32;
      InstVelocity, InstVelocityPrev                 : Float32;
      Stage_Time, TTG					             : Float32;
      EffectiveGravity, TempP, TempA, TempT          : Float32;
	  Total_Time_Stage2, Total_Time_Stage3			 : Float32;
      AngleR, AngleY					             : Float32;
      VelSqr, TempL, DistVelAxis	                 : Float32;

      Temp1, MajorPrev_Q, DotQ               : Math.Quaternion;

      Q_Minor                   			 : Math.F32Array25by4;
      Position, DirCos, Variable_TA          : Math.F32Array1by3;
      
      DirCos_U, DirCos_V, GuidVel, Velocity  : Math.F32Array1by3;

      BRate, TempRes                  : Math.F32Array1by3;

      TA, CorrFactor2, TTG_Prev       : Float32;

      DesiredQ                    : Math.Quaternion;
      Duration	                  : Float32;
      
      TimeConst_Stage3            : Float32;
      

      procedure Stage2_Major;
            procedure Stage3_Major;
      procedure AngleToCover;

      procedure PropagateQ(PrevQ : in out Math.Quaternion;
                     Brate : in Math.F32Array1by3);
      procedure Stage2_Initialise;
      procedure Stage3_Initialise;
      procedure Computation1(Pos,TargetDirCos : in Math.F32Array1by3);

    --  procedure ConstantQ(PrevQ : in Math.Quaternion);
     
      procedure Manoeuvre;

end Major_Cycle;
