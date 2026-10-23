with library;
use library;

with math;

package Lookup is

 Quaternion_Prev  : Math.Quaternion;
 Distance_Incr  : Float32;
 IterationCount : Short_Integer;

 procedure Output_Lookup (Distance_Current : in float32; Quaternion_Out : out Math.Quaternion);

end Lookup;
