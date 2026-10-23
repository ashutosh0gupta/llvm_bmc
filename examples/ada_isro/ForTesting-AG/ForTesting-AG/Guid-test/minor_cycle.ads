with library;
use library;

with math;

package Minor_Cycle is

-- for computations
      OffStage2, OffStage3           		: Unsigned_16;
      MinorFlag_Stage2, MinorFlag_Stage3 	: Unsigned_16;
      FirstCycle_Stage1, FirstCycle_Stage2, FirstCycle_Stage3 : Unsigned_16;

      VelocityCoeff                  : Float32;
      VelocityIncrMn                 : Float32;
      Q_Minor                        : Math.F32Array25by4;
      
-- for manoeuvres
      FirstCycle_Mnvre               : Unsigned_16;
      
      procedure Manoeuvre;

      procedure Stage1_Minor;
      procedure Stage2_Minor;
      procedure Stage3_Minor;
      
      Procedure Post_Output;
      
end Minor_Cycle;
