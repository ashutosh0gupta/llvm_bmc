; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64--linux-gnu"

module asm "\09.ident\09\22GCC: (Ubuntu 8.4.0-1ubuntu1~18.04) 8.4.0 LLVM: 6.0.0\22"
module asm ""
module asm "\09.ident\09\22GCC: (Ubuntu 8.4.0-1ubuntu1~18.04) 8.4.0 LLVM: 6.0.0\22"
module asm ""
module asm "\09.ident\09\22GCC: (Ubuntu 8.4.0-1ubuntu1~18.04) 8.4.0 LLVM: 6.0.0\22"
module asm ""
module asm "\09.ident\09\22GCC: (Ubuntu 8.4.0-1ubuntu1~18.04) 8.4.0 LLVM: 6.0.0\22"

@main__cyclecount = unnamed_addr global i32 undef
@main__outflag = unnamed_addr global i16 17
@main__minorinmajor = unnamed_addr global i16 1
@main__step14 = unnamed_addr global i16 1
@main__step13 = unnamed_addr global i16 1
@main__apogee = unnamed_addr global float undef
@main__radialdist = global float undef
@main__velw = global float undef
@main__velv = global float undef
@main__velu = global float undef
@main__posz = global float undef
@main__posy = global float undef
@main__posx = global float undef
@main__liftoff = unnamed_addr global float undef
@main__major_time = unnamed_addr global float undef
@main__time = unnamed_addr global float undef
@main__combinederrorflag = unnamed_addr global i16 0
@main__outflag4 = unnamed_addr global i16 undef
@main__outflag3 = unnamed_addr global i16 undef
@main__outflag2 = unnamed_addr global i16 undef
@main__outflag1 = unnamed_addr global i16 undef
@main__guidoutflagc = unnamed_addr global i16 undef
@main__guidoutflag = unnamed_addr global i16 undef
@main__stageflgc = unnamed_addr global i16 undef
@main__stageflg = unnamed_addr global i16 undef
@main__brate = global [5 x float] undef, align 16
@main_E = unnamed_addr global i16 0
@.cst = private local_unnamed_addr constant [9 x i8] c"main.adb\00", align 8
@.cst.1 = private local_unnamed_addr constant [9 x i8] c"main.ads\00", align 8
@math_E = unnamed_addr global i16 0
@major_cycle__brate = local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__position = local_unnamed_addr global [5 x float] undef, align 16
@major_cycle_E = unnamed_addr global i16 0

; Function Attrs: uwtable
define void @_ada_mjguidancedriver() unnamed_addr #0 align 2 {
entry:
  store float 0x3FBEB851E0000000, float* @main__velu, align 4
  store float 0x3FD6666660000000, float* @main__velv, align 4
  store float 0x400E3D70A0000000, float* @main__velw, align 4
  store float 0x40226B8520000000, float* @main__posx, align 4
  store float 0x4003333340000000, float* @main__posy, align 4
  store float 0x3FFB333340000000, float* @main__posz, align 4
  store float 0x40209999A0000000, float* @main__radialdist, align 4
  call void @main__guid_major()
  ret void
}

; Function Attrs: uwtable
define void @main__stageflags() unnamed_addr #0 align 2 {
entry:
  %0 = load i16, i16* @main__stageflg, align 2
  %1 = load i16, i16* @main__stageflgc, align 2
  %2 = add i16 %0, %1
  %3 = icmp eq i16 %2, -1
  br i1 %3, label %"3", label %"25"

"3":                                              ; preds = %entry
  %4 = load i32, i32* @main__cyclecount, align 4
  %5 = uitofp i32 %4 to float
  %6 = fcmp ult float %5, 0xC7EFFFFFE0000000
  br i1 %6, label %"5", label %"4"

"4":                                              ; preds = %"3"
  %7 = fcmp ugt float %5, 0x47EFFFFFE0000000
  br i1 %7, label %"5", label %"6"

"5":                                              ; preds = %"4", %"3"
  call void @__gnat_rcheck_CE_Range_Check(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.cst, i64 0, i64 0), i32 11) #1
  unreachable

"6":                                              ; preds = %"4"
  %8 = fmul float %5, 0x3F947AE140000000
  store float %8, float* @main__time, align 4
  %9 = load i16, i16* @main__minorinmajor, align 2
  %10 = icmp eq i16 %9, 1
  br i1 %10, label %"7", label %"8"

"7":                                              ; preds = %"6"
  store float %8, float* @main__major_time, align 4
  br label %"8"

"8":                                              ; preds = %"7", %"6"
  %11 = load i16, i16* @main__stageflg, align 2
  switch i16 %11, label %return [
    i16 221, label %"14"
    i16 238, label %"18"
    i16 17, label %"11"
  ]

"11":                                             ; preds = %"8"
  %12 = load i16, i16* @main__outflag, align 2
  %13 = icmp eq i16 %12, 17
  br i1 %13, label %"12", label %return

"12":                                             ; preds = %"11"
  %14 = load float, float* @main__time, align 4
  store float %14, float* @main__liftoff, align 4
  store i16 34, i16* @main__outflag, align 2
  br label %return

"14":                                             ; preds = %"8"
  %15 = load i16, i16* @main__outflag, align 2
  %16 = icmp eq i16 %15, 221
  %17 = load i16, i16* @main__minorinmajor, align 2
  %18 = icmp eq i16 %17, 1
  %or.cond = and i1 %16, %18
  br i1 %or.cond, label %"16", label %return

"16":                                             ; preds = %"14"
  store i16 1, i16* @main__step13, align 2
  store i16 0, i16* @main__step14, align 2
  store i16 238, i16* @main__outflag, align 2
  br label %return

"18":                                             ; preds = %"8"
  %19 = load i16, i16* @main__outflag, align 2
  %20 = icmp eq i16 %19, 238
  %21 = load i16, i16* @main__minorinmajor, align 2
  %22 = icmp eq i16 %21, 1
  %or.cond3 = and i1 %20, %22
  br i1 %or.cond3, label %"20", label %return

"20":                                             ; preds = %"18"
  store i16 1, i16* @main__step14, align 2
  store i16 0, i16* @main__step13, align 2
  store i16 221, i16* @main__outflag, align 2
  br label %return

"25":                                             ; preds = %entry
  store i16 1, i16* @main__combinederrorflag, align 2
  br label %return

return:                                           ; preds = %"25", %"20", %"18", %"16", %"14", %"12", %"11", %"8"
  ret void
}

; Function Attrs: noreturn
declare void @__gnat_rcheck_CE_Range_Check(i8*, i32) #1

; Function Attrs: uwtable
define void @main__guid_major() #0 align 2 {
entry:
  %0 = load i16, i16* @main__step14, align 2
  %1 = icmp eq i16 %0, 1
  br i1 %1, label %return, label %"5"

"5":                                              ; preds = %entry
  call void @major_cycle__stage2_major()
  br label %return

return:                                           ; preds = %"5", %entry
  ret void
}

; Function Attrs: uwtable
define void @main___elabs() unnamed_addr #0 align 2 {
entry:
  call void @__gnat_rcheck_CE_Range_Check(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.cst.1, i64 0, i64 0), i32 8) #1
  unreachable
}

; Function Attrs: inlinehint uwtable
define void @math__Tf32array1by3BIP(i64 %_init.0, i64 %_init.1) unnamed_addr #2 align 2 {
entry:
  ret void
}

; Function Attrs: uwtable
define void @math__genrates([5 x float]* %acclnvec, [5 x float]* %cmdbrate) #0 align 2 {
entry:
  %0 = bitcast [5 x float]* %acclnvec to float*
  %1 = load float, float* %0, align 4
  %2 = fmul float %1, 2.000000e+00
  %3 = bitcast [5 x float]* %cmdbrate to float*
  store float %2, float* %3, align 4
  %4 = getelementptr inbounds float, float* %0, i64 1
  %5 = load float, float* %4, align 4
  %6 = fmul float %5, 2.000000e+00
  %7 = getelementptr inbounds float, float* %3, i64 1
  store float %6, float* %7, align 4
  %8 = getelementptr inbounds float, float* %3, i64 2
  store float 0.000000e+00, float* %8, align 4
  ret void
}

; Function Attrs: uwtable
define void @major_cycle__stage2_major() #0 align 2 {
entry:
  %0 = load float, float* @main__posx, align 4
  store float %0, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__position, i64 0, i64 0), align 4
  %1 = load float, float* @main__posy, align 4
  store float %1, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__position, i64 0, i64 1), align 4
  %2 = load float, float* @main__posz, align 4
  store float %2, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__position, i64 0, i64 2), align 4
  call void @math__genrates([5 x float]* @major_cycle__position, [5 x float]* @major_cycle__brate)
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast ([5 x float]* @main__brate to i8*), i8* bitcast ([5 x float]* @major_cycle__brate to i8*), i64 20, i32 4, i1 false)
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #3

attributes #0 = { uwtable "no-frame-pointer-elim-non-leaf"="true" }
attributes #1 = { noreturn }
attributes #2 = { inlinehint uwtable "no-frame-pointer-elim-non-leaf"="true" }
attributes #3 = { argmemonly nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 7, !"PIE Level", i32 2}
