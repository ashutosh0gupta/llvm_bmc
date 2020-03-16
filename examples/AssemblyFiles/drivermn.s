; ModuleID = '../Test/Examples/drivermn.adb'
source_filename = "../Test/Examples/drivermn.adb"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64--linux-gnu"

module asm "\09.ident\09\22GCC: (Ubuntu 8.3.0-26ubuntu1~18.04) 8.3.0 LLVM: 6.0.0\22"

@main__minorinmajor = external global i16
@main__stageflg = external global i16
@main__stageflgc = external global i16
@main__cyclecount = external global i32
@main__altitudeinfo = external global float
@main__apogee = external global float
@lookup__distance_incr = external global float

; Function Attrs: uwtable
define void @_ada_mnguidancedriver() unnamed_addr #0 align 2 {
entry:
  store i16 1, i16* @main__minorinmajor, align 2
  store i16 0, i16* @main__stageflg, align 2
  store i16 -1, i16* @main__stageflgc, align 2
  store i32 1, i32* @main__cyclecount, align 4
  store float 2.800000e+03, float* @main__altitudeinfo, align 4
  store float 7.156000e+04, float* @main__apogee, align 4
  store float 1.200000e+02, float* @lookup__distance_incr, align 4
  call void @main__guid_minor()
  ret void
}

declare void @main__guid_minor()

attributes #0 = { uwtable "no-frame-pointer-elim-non-leaf"="true" }

!llvm.module.flags = !{!0}

!0 = !{i32 7, !"PIE Level", i32 2}
