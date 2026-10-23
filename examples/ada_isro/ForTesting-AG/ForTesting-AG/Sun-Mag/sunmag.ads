with library;
use library;

package SunMag is

   SunMagComnSts : Unsigned_16;
   minorID : Unsigned_16 := 0;

   procedure rSunMagDataAcq;
   procedure rSunDataProc;
   procedure rMagDataProc;
   procedure rMagFldCmptn;
   procedure rSunVctCmp;
   procedure rSunVctECItoBdy;

   procedure rMnrNav_driver;
   procedure rMjrNav_driver;

end SunMag;
