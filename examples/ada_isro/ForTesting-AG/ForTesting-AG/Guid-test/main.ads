with library;
use library;

with math;

package Main is

   BRate : Math.F32Array1by3;

-- Output Commands  
   QC       : Math.Quaternion := (0.3601, -0.1903, 0.6051, 0.7012);

--  Interfaces   
   AltitudeInfo : float32;
   
   StageFlg, StageFlgC, GuidOutFlag, GuidOutFlagC : Unsigned_16; 
   OutFlag1, OutFlag2, OutFlag3, OutFlag4 : Unsigned_16;
   
   CombinedErrorFlag   : Unsigned_16;
   
   Time, Major_Time, Liftoff : float32;
   
   PosX, PosY, PosZ         : float32;
   VelU, VelV, VelW         : float32;
   RadialDist, Apogee       : float32;

   Stage2_Start, Stage3_Start  : float32;

   Step2, Step4, Step5, Step6, Step7, Step8, Step10, Step11, Step12, Step13, Step14      : Unsigned_16;

   OffStage2, OffStage3   : Unsigned_16;

   MinorInMajor      : Unsigned_16;
   OutFlag           : Unsigned_16;
   CycleCount        : Unsigned_32;

   MinorFlag_Stage2, MinorFlag_Stage3 : Unsigned_16;
   Event4 : Unsigned_16;

   TTG : float32;
   GuidVel_U, GuidVel_V, GuidVel_W  : float32;

   EffectiveGravity    : float32 ;
   Stage_Time          : float32 ;
   AngleR, AngleY      : float32 ;

   DefPos, DefVel, Matrix11, Matrix12, Matrix22   : float32;
   SteerCoeffA, SteerCoeffB, SteerCoeffC, SteerCoeffD, PosDefOutofPlane     : float32;

   procedure StageFlags;
   procedure OutputFlags_Minor;
   procedure Guid_Minor;
   procedure Guid_Major;
   procedure FirstInit;

end Main;
