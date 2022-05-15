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
module asm ""
module asm "\09.ident\09\22GCC: (Ubuntu 8.4.0-1ubuntu1~18.04) 8.4.0 LLVM: 6.0.0\22"
module asm ""
module asm "\09.ident\09\22GCC: (Ubuntu 8.4.0-1ubuntu1~18.04) 8.4.0 LLVM: 6.0.0\22"
module asm ""
module asm "\09.ident\09\22GCC: (Ubuntu 8.4.0-1ubuntu1~18.04) 8.4.0 LLVM: 6.0.0\22"

@main__stage_time = global float undef
@main__effectivegravity = global float undef
@main__guidvel_w = global float undef
@main__guidvel_v = global float undef
@main__guidvel_u = global float undef
@main__ttg = global float undef
@main__minorflag_stage2 = global i16 undef
@main__cyclecount = global i32 undef
@main__outflag = unnamed_addr global i16 undef
@main__minorinmajor = global i16 undef
@main__offstage2 = global i16 undef
@main__step14 = unnamed_addr global i16 undef
@main__step13 = unnamed_addr global i16 undef
@main__step12 = unnamed_addr global i16 undef
@main__step11 = unnamed_addr global i16 undef
@main__step10 = unnamed_addr global i16 undef
@main__step8 = global i16 undef
@main__step7 = unnamed_addr global i16 undef
@main__step6 = unnamed_addr global i16 undef
@main__step5 = unnamed_addr global i16 undef
@main__step4 = unnamed_addr global i16 undef
@main__step2 = unnamed_addr global i16 undef
@main__stage2_start = global float undef
@main__radialdist = global float undef
@main__velw = global float undef
@main__velv = global float undef
@main__velu = global float undef
@main__posz = global float undef
@main__posy = global float undef
@main__posx = global float undef
@main__liftoff = unnamed_addr global float undef
@main__major_time = global float undef
@main__time = unnamed_addr global float undef
@main__combinederrorflag = unnamed_addr global i16 undef
@main__outflag2 = unnamed_addr global i16 undef
@main__guidoutflagc = unnamed_addr global i16 undef
@main__guidoutflag = unnamed_addr global i16 undef
@main__stageflgc = global i16 undef
@main__stageflg = global i16 undef
@main__brate = global [5 x float] undef, align 16
@main_E = unnamed_addr global i16 0
@.cst = private local_unnamed_addr constant [9 x i8] c"main.adb\00", align 8
@minor_cycle__velocitycoeff = global float undef
@minor_cycle__firstcycle_stage2 = global i16 undef
@minor_cycle__minorflag_stage2 = unnamed_addr global i16 undef
@minor_cycle__offstage2 = global i16 undef
@minor_cycle_E = unnamed_addr global i16 0
@math_E = unnamed_addr global i16 0
@major_cycle__ttg_prev = unnamed_addr global float undef
@major_cycle__brate = unnamed_addr global [5 x float] undef, align 16
@major_cycle__velocity = local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__guidvel = unnamed_addr global [5 x float] undef, align 16
@major_cycle__dircos_v = local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__dircos_u = local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__dircos = local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__position = local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__distvelaxis = unnamed_addr global float undef
@major_cycle__templ = unnamed_addr global float undef
@major_cycle__velsqr = unnamed_addr global float undef
@major_cycle__total_time_stage2 = unnamed_addr global float undef
@major_cycle__tempt = unnamed_addr global float undef
@major_cycle__tempa = unnamed_addr global float undef
@major_cycle__tempp = unnamed_addr global float undef
@major_cycle__effectivegravity = unnamed_addr global float undef
@major_cycle__ttg = unnamed_addr global float undef
@major_cycle__stage_time = unnamed_addr global float undef
@major_cycle__instvelocityprev = unnamed_addr global float undef
@major_cycle__instvelocity = unnamed_addr global float undef
@major_cycle__velocityincrmj = global float undef
@major_cycle__velocityincrmn = global float undef
@major_cycle__velocitycoeff = unnamed_addr global float undef
@major_cycle__enterstage2 = global i16 undef
@major_cycle__minorflag_stage2 = global i16 undef
@major_cycle_E = unnamed_addr global i16 0
@major_cycle__dircos_stage2 = internal local_unnamed_addr constant [5 x float] [float 0xBFD0985F00000000, float 0xBFC86594A0000000, float 0x3FEE752540000000, float 0.000000e+00, float 0.000000e+00], align 16
@obclib_E = unnamed_addr global i16 0

; Function Attrs: uwtable
define void @_ada_mnguidancedriver() unnamed_addr #0 align 2 {
entry:
  store i16 1, i16* @main__minorinmajor, align 2
  store i16 0, i16* @main__stageflg, align 2
  store i16 -1, i16* @main__stageflgc, align 2
  store i32 1, i32* @main__cyclecount, align 4
  call void @main__guid_minor()
  ret void
}

; Function Attrs: uwtable
define void @main__stageflags() local_unnamed_addr #0 align 2 {
entry:
  %0 = load i16, i16* @main__stageflg, align 2
  %1 = load i16, i16* @main__stageflgc, align 2
  %2 = add i16 %0, %1
  %3 = icmp eq i16 %2, -1
  br i1 %3, label %"3", label %"77"

"3":                                              ; preds = %entry
  %4 = load i32, i32* @main__cyclecount, align 4
  %5 = uitofp i32 %4 to float
  %6 = fcmp ult float %5, 0xC7EFFFFFE0000000
  br i1 %6, label %"5", label %"4"

"4":                                              ; preds = %"3"
  %7 = fcmp ugt float %5, 0x47EFFFFFE0000000
  br i1 %7, label %"5", label %"6"

"5":                                              ; preds = %"4", %"3"
  call void @__gnat_rcheck_CE_Range_Check(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.cst, i64 0, i64 0), i32 12) #1
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
  %12 = icmp eq i16 %11, 119
  br i1 %12, label %"46", label %"9"

"9":                                              ; preds = %"8"
  %13 = icmp ugt i16 %11, 119
  br i1 %13, label %"17", label %"10"

"10":                                             ; preds = %"9"
  %14 = icmp eq i16 %11, 51
  br i1 %14, label %"31", label %"11"

"11":                                             ; preds = %"10"
  %15 = icmp ugt i16 %11, 51
  br i1 %15, label %"14", label %"12"

"12":                                             ; preds = %"11"
  switch i16 %11, label %return [
    i16 17, label %"25"
    i16 34, label %"28"
  ]

"14":                                             ; preds = %"11"
  switch i16 %11, label %return [
    i16 85, label %"38"
    i16 102, label %"42"
    i16 68, label %"34"
  ]

"17":                                             ; preds = %"9"
  %16 = icmp eq i16 %11, 187
  br i1 %16, label %"59", label %"18"

"18":                                             ; preds = %"17"
  %17 = icmp ugt i16 %11, 187
  br i1 %17, label %"22", label %"19"

"19":                                             ; preds = %"18"
  switch i16 %11, label %return [
    i16 153, label %"52"
    i16 170, label %"55"
    i16 136, label %"49"
  ]

"22":                                             ; preds = %"18"
  switch i16 %11, label %return [
    i16 221, label %"66"
    i16 238, label %"70"
    i16 204, label %"63"
  ]

"25":                                             ; preds = %"12"
  %18 = load i16, i16* @main__outflag, align 2
  %19 = icmp eq i16 %18, 17
  br i1 %19, label %"26", label %return

"26":                                             ; preds = %"25"
  %20 = load float, float* @main__time, align 4
  store float %20, float* @main__liftoff, align 4
  store i16 34, i16* @main__outflag, align 2
  br label %return

"28":                                             ; preds = %"12"
  %21 = load i16, i16* @main__outflag, align 2
  %22 = icmp eq i16 %21, 34
  br i1 %22, label %"29", label %return

"29":                                             ; preds = %"28"
  store i16 1, i16* @main__step2, align 2
  store i16 51, i16* @main__outflag, align 2
  br label %return

"31":                                             ; preds = %"10"
  %23 = load i16, i16* @main__outflag, align 2
  %24 = icmp eq i16 %23, 51
  br i1 %24, label %"32", label %return

"32":                                             ; preds = %"31"
  %25 = load float, float* @main__time, align 4
  store float %25, float* @main__stage2_start, align 4
  store i16 68, i16* @main__outflag, align 2
  br label %return

"34":                                             ; preds = %"14"
  %26 = load i16, i16* @main__outflag, align 2
  %27 = icmp eq i16 %26, 68
  %28 = load i16, i16* @main__minorinmajor, align 2
  %29 = icmp eq i16 %28, 1
  %or.cond = and i1 %27, %29
  br i1 %or.cond, label %"36", label %return

"36":                                             ; preds = %"34"
  store i16 1, i16* @main__step4, align 2
  store i16 85, i16* @main__outflag, align 2
  br label %return

"38":                                             ; preds = %"14"
  %30 = load i16, i16* @main__outflag, align 2
  %31 = icmp eq i16 %30, 85
  %32 = load i16, i16* @main__minorinmajor, align 2
  %33 = icmp eq i16 %32, 1
  %or.cond3 = and i1 %31, %33
  br i1 %or.cond3, label %"40", label %return

"40":                                             ; preds = %"38"
  store i16 1, i16* @main__step5, align 2
  store i16 102, i16* @main__outflag, align 2
  br label %return

"42":                                             ; preds = %"14"
  %34 = load i16, i16* @main__outflag, align 2
  %35 = icmp eq i16 %34, 102
  %36 = load i16, i16* @main__minorinmajor, align 2
  %37 = icmp eq i16 %36, 1
  %or.cond5 = and i1 %35, %37
  br i1 %or.cond5, label %"44", label %return

"44":                                             ; preds = %"42"
  store i16 1, i16* @main__step6, align 2
  store i16 119, i16* @main__outflag, align 2
  br label %return

"46":                                             ; preds = %"8"
  %38 = load i16, i16* @main__outflag, align 2
  %39 = icmp eq i16 %38, 119
  br i1 %39, label %"47", label %return

"47":                                             ; preds = %"46"
  store i16 1, i16* @main__step7, align 2
  store i16 136, i16* @main__outflag, align 2
  br label %return

"49":                                             ; preds = %"19"
  %40 = load i16, i16* @main__outflag, align 2
  %41 = icmp eq i16 %40, 136
  br i1 %41, label %"50", label %return

"50":                                             ; preds = %"49"
  store i16 1, i16* @main__step8, align 2
  store i16 153, i16* @main__outflag, align 2
  br label %return

"52":                                             ; preds = %"19"
  %42 = load i16, i16* @main__outflag, align 2
  %43 = icmp eq i16 %42, 153
  br i1 %43, label %"53", label %return

"53":                                             ; preds = %"52"
  store i16 170, i16* @main__outflag, align 2
  br label %return

"55":                                             ; preds = %"19"
  %44 = load i16, i16* @main__outflag, align 2
  %45 = icmp eq i16 %44, 170
  %46 = load i16, i16* @main__minorinmajor, align 2
  %47 = icmp eq i16 %46, 1
  %or.cond7 = and i1 %45, %47
  br i1 %or.cond7, label %"57", label %return

"57":                                             ; preds = %"55"
  store i16 1, i16* @main__step10, align 2
  store i16 187, i16* @main__outflag, align 2
  br label %return

"59":                                             ; preds = %"17"
  %48 = load i16, i16* @main__outflag, align 2
  %49 = icmp eq i16 %48, 187
  %50 = load i16, i16* @main__minorinmajor, align 2
  %51 = icmp eq i16 %50, 1
  %or.cond9 = and i1 %49, %51
  br i1 %or.cond9, label %"61", label %return

"61":                                             ; preds = %"59"
  store i16 1, i16* @main__step11, align 2
  store i16 204, i16* @main__outflag, align 2
  br label %return

"63":                                             ; preds = %"22"
  %52 = load i16, i16* @main__outflag, align 2
  %53 = icmp eq i16 %52, 204
  br i1 %53, label %"64", label %return

"64":                                             ; preds = %"63"
  store i16 1, i16* @main__step12, align 2
  store i16 221, i16* @main__outflag, align 2
  br label %return

"66":                                             ; preds = %"22"
  %54 = load i16, i16* @main__outflag, align 2
  %55 = icmp eq i16 %54, 221
  %56 = load i16, i16* @main__minorinmajor, align 2
  %57 = icmp eq i16 %56, 1
  %or.cond11 = and i1 %55, %57
  br i1 %or.cond11, label %"68", label %return

"68":                                             ; preds = %"66"
  store i16 1, i16* @main__step13, align 2
  store i16 0, i16* @main__step14, align 2
  store i16 238, i16* @main__outflag, align 2
  br label %return

"70":                                             ; preds = %"22"
  %58 = load i16, i16* @main__outflag, align 2
  %59 = icmp eq i16 %58, 238
  %60 = load i16, i16* @main__minorinmajor, align 2
  %61 = icmp eq i16 %60, 1
  %or.cond13 = and i1 %59, %61
  br i1 %or.cond13, label %"72", label %return

"72":                                             ; preds = %"70"
  store i16 1, i16* @main__step14, align 2
  store i16 0, i16* @main__step13, align 2
  store i16 221, i16* @main__outflag, align 2
  br label %return

"77":                                             ; preds = %entry
  store i16 1, i16* @main__combinederrorflag, align 2
  br label %return

return:                                           ; preds = %"77", %"72", %"70", %"68", %"66", %"64", %"63", %"61", %"59", %"57", %"55", %"53", %"52", %"50", %"49", %"47", %"46", %"44", %"42", %"40", %"38", %"36", %"34", %"32", %"31", %"29", %"28", %"26", %"25", %"22", %"19", %"14", %"12"
  ret void
}

; Function Attrs: noreturn
declare void @__gnat_rcheck_CE_Range_Check(i8*, i32) #1

; Function Attrs: uwtable
define void @main__outputflags_minor() local_unnamed_addr #0 align 2 {
entry:
  %0 = load i16, i16* @main__offstage2, align 2
  %1 = icmp eq i16 %0, 1
  %2 = load i16, i16* @main__step7, align 2
  %3 = icmp eq i16 %2, 1
  %or.cond = and i1 %1, %3
  %4 = load i16, i16* @main__outflag2, align 2
  %5 = icmp eq i16 %4, 0
  %or.cond3 = and i1 %or.cond, %5
  br i1 %or.cond3, label %"5", label %return

"5":                                              ; preds = %entry
  store i16 8738, i16* @main__guidoutflag, align 2
  store i16 -8739, i16* @main__guidoutflagc, align 2
  store i16 1, i16* @main__outflag2, align 2
  br label %return

return:                                           ; preds = %"5", %entry
  ret void
}

; Function Attrs: uwtable
define void @main__guid_minor() #0 align 2 {
entry:
  call void @main__stageflags() #0
  %0 = load i16, i16* @main__step14, align 2
  %1 = icmp ne i16 %0, 1
  %2 = load i16, i16* @main__step4, align 2
  %3 = icmp eq i16 %2, 1
  %or.cond = and i1 %1, %3
  br i1 %or.cond, label %"6", label %return

"6":                                              ; preds = %entry
  call void @minor_cycle__stage2_minor()
  call void @main__outputflags_minor() #0
  br label %return

return:                                           ; preds = %"6", %entry
  ret void
}

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
define void @main__firstinit() #0 align 2 {
entry:
  store i16 1, i16* @main__minorinmajor, align 2
  store float 0.000000e+00, float* @major_cycle__velocityincrmj, align 4
  store float 0.000000e+00, float* @major_cycle__velocityincrmn, align 4
  store i16 0, i16* @major_cycle__minorflag_stage2, align 2
  store i16 1, i16* @major_cycle__enterstage2, align 2
  store i16 0, i16* @minor_cycle__offstage2, align 2
  store i16 1, i16* @minor_cycle__firstcycle_stage2, align 2
  store i16 17, i16* @main__outflag, align 2
  store i16 0, i16* @main__step12, align 2
  store i16 0, i16* @main__step8, align 2
  store i16 0, i16* @main__step7, align 2
  store i16 0, i16* @main__step11, align 2
  store i16 0, i16* @main__step5, align 2
  store i16 0, i16* @main__step6, align 2
  store i16 0, i16* @main__step4, align 2
  store i16 0, i16* @main__step10, align 2
  store i16 0, i16* @main__step13, align 2
  store i16 0, i16* @main__step14, align 2
  store i16 0, i16* @main__step2, align 2
  store i16 0, i16* @main__offstage2, align 2
  store i16 0, i16* @main__outflag2, align 2
  store i16 0, i16* @main__minorflag_stage2, align 2
  store i16 0, i16* @main__combinederrorflag, align 2
  store i16 0, i16* @main__guidoutflag, align 2
  store i16 -1, i16* @main__guidoutflagc, align 2
  store float 0.000000e+00, float* getelementptr inbounds ([5 x float], [5 x float]* @main__brate, i64 0, i64 0), align 4
  store float 0.000000e+00, float* getelementptr inbounds ([5 x float], [5 x float]* @main__brate, i64 0, i64 1), align 4
  store float 0.000000e+00, float* getelementptr inbounds ([5 x float], [5 x float]* @main__brate, i64 0, i64 2), align 4
  store float 0.000000e+00, float* @main__stage_time, align 4
  store float 0.000000e+00, float* @main__effectivegravity, align 4
  store float 0.000000e+00, float* @main__guidvel_u, align 4
  store float 0.000000e+00, float* @main__guidvel_v, align 4
  store float 0.000000e+00, float* @main__guidvel_w, align 4
  store float 0.000000e+00, float* @main__ttg, align 4
  ret void
}

; Function Attrs: uwtable
define void @minor_cycle__stage2_minor() #0 align 2 {
entry:
  %0 = load i16, i16* @minor_cycle__firstcycle_stage2, align 2
  %1 = icmp eq i16 %0, 1
  br i1 %1, label %"3", label %"4"

"3":                                              ; preds = %entry
  store i16 0, i16* @minor_cycle__firstcycle_stage2, align 2
  call void @main__firstinit()
  br label %return

"4":                                              ; preds = %entry
  %2 = load i16, i16* @main__step8, align 2
  %3 = icmp eq i16 %2, 0
  %4 = load i16, i16* @minor_cycle__offstage2, align 2
  %5 = icmp eq i16 %4, 0
  %or.cond = and i1 %3, %5
  br i1 %or.cond, label %"6", label %return

"6":                                              ; preds = %"4"
  %6 = load i32, i32* @main__cyclecount, align 4
  %7 = icmp eq i32 %6, 1
  br i1 %7, label %"7", label %"8"

"7":                                              ; preds = %"6"
  %8 = load i16, i16* @major_cycle__minorflag_stage2, align 2
  store i16 %8, i16* @minor_cycle__minorflag_stage2, align 2
  br label %"8"

"8":                                              ; preds = %"7", %"6"
  %9 = load i16, i16* @minor_cycle__minorflag_stage2, align 2
  %10 = icmp eq i16 %9, 1
  %11 = load float, float* @minor_cycle__velocitycoeff, align 4
  %12 = fcmp ogt float %11, 5.236000e+03
  %or.cond3 = and i1 %10, %12
  br i1 %or.cond3, label %"10", label %return

"10":                                             ; preds = %"8"
  store i16 1, i16* @minor_cycle__offstage2, align 2
  store i16 1, i16* @main__offstage2, align 2
  br label %return

return:                                           ; preds = %"10", %"8", %"4", %"3"
  ret void
}

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

; Function Attrs: inlinehint uwtable
define void @math__Tf32array1by3BIP(i64 %_init.0, i64 %_init.1) unnamed_addr #2 align 2 {
entry:
  ret void
}

; Function Attrs: uwtable
define float @math__dotproduct([5 x float]* %vec1, [5 x float]* %vec2) #0 align 2 {
entry:
  %0 = bitcast [5 x float]* %vec1 to float*
  %1 = load float, float* %0, align 4
  %2 = bitcast [5 x float]* %vec2 to float*
  %3 = load float, float* %2, align 4
  %4 = fmul float %1, %3
  %5 = getelementptr inbounds float, float* %0, i64 1
  %6 = load float, float* %5, align 4
  %7 = getelementptr inbounds float, float* %2, i64 1
  %8 = load float, float* %7, align 4
  %9 = fmul float %6, %8
  %10 = fadd float %4, %9
  %11 = getelementptr inbounds float, float* %0, i64 2
  %12 = load float, float* %11, align 4
  %13 = getelementptr inbounds float, float* %2, i64 2
  %14 = load float, float* %13, align 4
  %15 = fmul float %12, %14
  %16 = fadd float %10, %15
  ret float %16
}

; Function Attrs: uwtable
define void @math__crossproduct([5 x float]* %vec1, [5 x float]* %vec2, [5 x float]* %vec3) #0 align 2 {
entry:
  %0 = bitcast [5 x float]* %vec1 to float*
  %1 = getelementptr inbounds float, float* %0, i64 1
  %2 = load float, float* %1, align 4
  %3 = bitcast [5 x float]* %vec2 to float*
  %4 = getelementptr inbounds float, float* %3, i64 2
  %5 = load float, float* %4, align 4
  %6 = fmul float %2, %5
  %7 = getelementptr inbounds float, float* %0, i64 2
  %8 = load float, float* %7, align 4
  %9 = getelementptr inbounds float, float* %3, i64 1
  %10 = load float, float* %9, align 4
  %11 = fmul float %8, %10
  %12 = fsub float %6, %11
  %13 = bitcast [5 x float]* %vec3 to float*
  store float %12, float* %13, align 4
  %14 = load float, float* %7, align 4
  %15 = load float, float* %3, align 4
  %16 = fmul float %14, %15
  %17 = load float, float* %0, align 4
  %18 = load float, float* %4, align 4
  %19 = fmul float %17, %18
  %20 = fsub float %16, %19
  %21 = getelementptr inbounds float, float* %13, i64 1
  store float %20, float* %21, align 4
  %22 = load float, float* %0, align 4
  %23 = load float, float* %9, align 4
  %24 = fmul float %22, %23
  %25 = load float, float* %1, align 4
  %26 = load float, float* %3, align 4
  %27 = fmul float %25, %26
  %28 = fsub float %24, %27
  %29 = getelementptr inbounds float, float* %13, i64 2
  store float %28, float* %29, align 4
  ret void
}

; Function Attrs: uwtable
define void @math__dircosine([5 x float]* %vecin, [5 x float]* %dcout) #0 align 2 {
entry:
  %0 = bitcast [5 x float]* %vecin to float*
  %1 = load float, float* %0, align 4
  %2 = fmul float %1, %1
  %3 = getelementptr inbounds float, float* %0, i64 1
  %4 = load float, float* %3, align 4
  %5 = fmul float %4, %4
  %6 = fadd float %2, %5
  %7 = getelementptr inbounds float, float* %0, i64 2
  %8 = load float, float* %7, align 4
  %9 = fmul float %8, %8
  %10 = fadd float %6, %9
  %11 = call float @obclib__sqrt_sf(float %10)
  %12 = load float, float* %0, align 4
  %13 = fdiv float %12, %11
  %14 = bitcast [5 x float]* %dcout to float*
  store float %13, float* %14, align 4
  %15 = load float, float* %3, align 4
  %16 = fdiv float %15, %11
  %17 = getelementptr inbounds float, float* %14, i64 1
  store float %16, float* %17, align 4
  %18 = load float, float* %3, align 4
  %19 = fdiv float %18, %11
  %20 = getelementptr inbounds float, float* %14, i64 2
  store float %19, float* %20, align 4
  ret void
}

; Function Attrs: uwtable
define void @major_cycle__stage2_major() #0 align 2 {
entry:
  %0 = load i16, i16* @major_cycle__enterstage2, align 2
  %1 = icmp eq i16 %0, 1
  br i1 %1, label %"3", label %"4"

"3":                                              ; preds = %entry
  call void @major_cycle__stage2_initialise()
  store i16 0, i16* @major_cycle__enterstage2, align 2
  br label %"4"

"4":                                              ; preds = %"3", %entry
  %2 = load float, float* @main__posx, align 4
  store float %2, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__position, i64 0, i64 0), align 4
  %3 = load float, float* @main__posy, align 4
  store float %3, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__position, i64 0, i64 1), align 4
  %4 = load float, float* @main__posz, align 4
  store float %4, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__position, i64 0, i64 2), align 4
  %5 = load float, float* @main__velu, align 4
  store float %5, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__velocity, i64 0, i64 0), align 4
  %6 = load float, float* @main__velv, align 4
  store float %6, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__velocity, i64 0, i64 1), align 4
  %7 = load float, float* @main__velw, align 4
  store float %7, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__velocity, i64 0, i64 2), align 4
  %8 = load float, float* @main__major_time, align 4
  %9 = load float, float* @main__stage2_start, align 4
  %10 = fsub float %8, %9
  store float %10, float* @major_cycle__stage_time, align 4
  %11 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__velocity, i64 0, i64 0), align 4
  %12 = fmul float %11, %11
  %13 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__velocity, i64 0, i64 1), align 4
  %14 = fmul float %13, %13
  %15 = fadd float %12, %14
  %16 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__velocity, i64 0, i64 2), align 4
  %17 = fmul float %16, %16
  %18 = fadd float %15, %17
  %19 = call float @obclib__sqrt_sf(float %18)
  store float %19, float* @major_cycle__instvelocity, align 4
  %20 = load float, float* @major_cycle__instvelocityprev, align 4
  %21 = fsub float %19, %20
  store float %21, float* @major_cycle__velocityincrmj, align 4
  %22 = load float, float* @major_cycle__instvelocity, align 4
  %23 = fadd float %22, %21
  store float %23, float* @major_cycle__velocitycoeff, align 4
  %24 = load float, float* @major_cycle__velocityincrmj, align 4
  %25 = fdiv float %24, 2.500000e+01
  store float %25, float* @major_cycle__velocityincrmn, align 4
  %26 = load float, float* @major_cycle__instvelocity, align 4
  store float %26, float* @major_cycle__instvelocityprev, align 4
  %27 = load i16, i16* @major_cycle__minorflag_stage2, align 2
  %28 = icmp eq i16 %27, 1
  br i1 %28, label %"5", label %"6"

"5":                                              ; preds = %"4"
  %29 = load float, float* @major_cycle__ttg, align 4
  %30 = fsub float %29, 5.000000e-01
  store float %30, float* @major_cycle__ttg, align 4
  br label %"8"

"6":                                              ; preds = %"4"
  call void @major_cycle__computation1([5 x float]* @major_cycle__position, [5 x float]* @major_cycle__dircos_stage2)
  %31 = call float @math__dotproduct([5 x float]* @major_cycle__dircos_u, [5 x float]* @major_cycle__velocity)
  store float %31, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 0), align 4
  %32 = call float @math__dotproduct([5 x float]* @major_cycle__dircos_v, [5 x float]* @major_cycle__velocity)
  store float %32, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 1), align 4
  %33 = call float @math__dotproduct([5 x float]* @major_cycle__dircos, [5 x float]* @major_cycle__velocity)
  store float %33, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 2), align 4
  %34 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 0), align 4
  %35 = fmul float %34, %34
  %36 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 1), align 4
  %37 = fmul float %36, %36
  %38 = fadd float %35, %37
  store float %38, float* @major_cycle__velsqr, align 4
  %39 = load float, float* @major_cycle__tempa, align 4
  %40 = fdiv float 0x42F6BCC420000000, %39
  %41 = fsub float %40, %38
  %42 = fdiv float %41, %39
  store float %42, float* @major_cycle__effectivegravity, align 4
  %43 = call float @math__dotproduct([5 x float]* @major_cycle__dircos_v, [5 x float]* @major_cycle__dircos_stage2)
  store float %43, float* @major_cycle__templ, align 4
  %44 = call float @math__dotproduct([5 x float]* @major_cycle__position, [5 x float]* @major_cycle__dircos_stage2)
  %45 = fsub float -0.000000e+00, %44
  store float %45, float* @major_cycle__distvelaxis, align 4
  %46 = load float, float* @major_cycle__templ, align 4
  %47 = fdiv float %45, %46
  store float %47, float* @major_cycle__distvelaxis, align 4
  %48 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 0), align 4
  %49 = load float, float* @major_cycle__tempa, align 4
  %50 = fdiv float 0x421BD4D6E0000000, %49
  %51 = fdiv float %50, 0x40A6D39480000000
  %52 = fsub float %48, %51
  %53 = call float @obclib__exp_sf(float %52)
  store float %53, float* @major_cycle__tempp, align 4
  %54 = load float, float* @major_cycle__stage_time, align 4
  %55 = fsub float 0x4072903120000000, %54
  store float %55, float* @major_cycle__tempt, align 4
  %56 = load float, float* @major_cycle__tempp, align 4
  %57 = fsub float 1.000000e+00, %56
  %58 = fmul float %57, %55
  store float %58, float* @major_cycle__ttg, align 4
  %59 = load float, float* @major_cycle__stage_time, align 4
  %60 = fadd float %58, %59
  store float %60, float* @major_cycle__total_time_stage2, align 4
  %61 = load float, float* @major_cycle__ttg, align 4
  %62 = fcmp olt float %61, 5.000000e+00
  br i1 %62, label %"7", label %"8"

"7":                                              ; preds = %"6"
  store i16 1, i16* @major_cycle__minorflag_stage2, align 2
  br label %"8"

"8":                                              ; preds = %"7", %"6", %"5"
  %63 = load float, float* @major_cycle__ttg, align 4
  store float %63, float* @major_cycle__ttg_prev, align 4
  %64 = load i16, i16* @major_cycle__minorflag_stage2, align 2
  store i16 %64, i16* @main__minorflag_stage2, align 2
  %65 = load float, float* @major_cycle__ttg, align 4
  store float %65, float* @main__ttg, align 4
  %66 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 0), align 4
  store float %66, float* @main__guidvel_u, align 4
  %67 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 1), align 4
  store float %67, float* @main__guidvel_v, align 4
  %68 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 2), align 4
  store float %68, float* @main__guidvel_w, align 4
  %69 = load float, float* @major_cycle__effectivegravity, align 4
  store float %69, float* @main__effectivegravity, align 4
  %70 = load float, float* @major_cycle__stage_time, align 4
  store float %70, float* @main__stage_time, align 4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast ([5 x float]* @main__brate to i8*), i8* bitcast ([5 x float]* @major_cycle__brate to i8*), i64 20, i32 4, i1 false)
  %71 = load float, float* @major_cycle__velocitycoeff, align 4
  store float %71, float* @minor_cycle__velocitycoeff, align 4
  ret void
}

; Function Attrs: uwtable
define void @major_cycle__stage2_initialise() local_unnamed_addr #0 align 2 {
entry:
  store float 0.000000e+00, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__brate, i64 0, i64 0), align 4
  store float 0.000000e+00, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__brate, i64 0, i64 1), align 4
  store float 0.000000e+00, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__brate, i64 0, i64 2), align 4
  store float 1.600000e+02, float* @major_cycle__ttg_prev, align 4
  ret void
}

; Function Attrs: uwtable
define void @major_cycle__computation1([5 x float]* %pos, [5 x float]* %targetdircos) local_unnamed_addr #0 align 2 personality i8* bitcast (void ([5 x float]*, [5 x float]*)* @major_cycle__computation1 to i8*) {
entry:
  %temp1 = alloca [5 x float]
  %0 = load float, float* @main__radialdist, align 4
  store float %0, float* @major_cycle__tempa, align 4
  %1 = fdiv float 1.000000e+00, %0
  %2 = bitcast [5 x float]* %pos to float*
  %3 = load float, float* %2, align 4
  %4 = fmul float %1, %3
  store float %4, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__dircos, i64 0, i64 0), align 4
  %5 = getelementptr inbounds float, float* %2, i64 1
  %6 = load float, float* %5, align 4
  %7 = fmul float %1, %6
  store float %7, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__dircos, i64 0, i64 1), align 4
  %8 = getelementptr inbounds float, float* %2, i64 2
  %9 = load float, float* %8, align 4
  %10 = fmul float %1, %9
  store float %10, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__dircos, i64 0, i64 2), align 4
  invoke void @math__crossproduct([5 x float]* %targetdircos, [5 x float]* @major_cycle__dircos, [5 x float]* %temp1)
          to label %"3" unwind label %"8"

"3":                                              ; preds = %entry
  invoke void @math__dircosine([5 x float]* %temp1, [5 x float]* @major_cycle__dircos_u)
          to label %"4" unwind label %"8"

"4":                                              ; preds = %"3"
  invoke void @math__crossproduct([5 x float]* @major_cycle__dircos, [5 x float]* @major_cycle__dircos_u, [5 x float]* %temp1)
          to label %"5" unwind label %"8"

"5":                                              ; preds = %"4"
  invoke void @math__dircosine([5 x float]* %temp1, [5 x float]* @major_cycle__dircos_v)
          to label %"6" unwind label %"8"

"6":                                              ; preds = %"5"
  %11 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__dircos, i64 0, i64 0), align 4
  %12 = fsub float -0.000000e+00, %11
  store float %12, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__dircos, i64 0, i64 0), align 4
  %13 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__dircos, i64 0, i64 1), align 4
  %14 = fsub float -0.000000e+00, %13
  store float %14, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__dircos, i64 0, i64 1), align 4
  %15 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__dircos, i64 0, i64 2), align 4
  %16 = fsub float -0.000000e+00, %15
  store float %16, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__dircos, i64 0, i64 2), align 4
  %17 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__dircos_v, i64 0, i64 0), align 4
  %18 = fsub float -0.000000e+00, %17
  store float %18, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__dircos_v, i64 0, i64 0), align 4
  %19 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__dircos_v, i64 0, i64 1), align 4
  %20 = fsub float -0.000000e+00, %19
  store float %20, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__dircos_v, i64 0, i64 1), align 4
  %21 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__dircos_v, i64 0, i64 2), align 4
  %22 = fsub float -0.000000e+00, %21
  store float %22, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__dircos_v, i64 0, i64 2), align 4
  %23 = bitcast [5 x float]* %temp1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 20, i8* %23)
  ret void

"8":                                              ; preds = %"5", %"4", %"3", %entry
  %exc = landingpad { i8*, i32 }
          cleanup
  %exc_ptr1 = extractvalue { i8*, i32 } %exc, 0
  %filter2 = extractvalue { i8*, i32 } %exc, 1
  %24 = bitcast [5 x float]* %temp1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 20, i8* %24)
  resume { i8*, i32 } %exc
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #3

; Function Attrs: uwtable
define float @obclib__sqrt_sf(float %arg) #0 align 2 {
entry:
  %0 = call float @ada__numerics__elementary_functions__sqrt(float %arg) #4
  ret float %0
}

; Function Attrs: readnone
declare float @ada__numerics__elementary_functions__sqrt(float) #4

; Function Attrs: uwtable
define float @obclib__asin_sf(float %arg) unnamed_addr #0 align 2 {
entry:
  %0 = call float @ada__numerics__elementary_functions__arcsin(float %arg) #4
  ret float %0
}

; Function Attrs: readnone
declare float @ada__numerics__elementary_functions__arcsin(float) #4

; Function Attrs: uwtable
define float @obclib__acos_sf(float %arg) unnamed_addr #0 align 2 {
entry:
  %0 = call float @ada__numerics__elementary_functions__arccos(float %arg) #4
  ret float %0
}

; Function Attrs: readnone
declare float @ada__numerics__elementary_functions__arccos(float) #4

; Function Attrs: uwtable
define float @obclib__fltlimit(float %value, float %limit) unnamed_addr #0 align 2 {
entry:
  %0 = call float @fabsf(float %value) #5
  %1 = fcmp olt float %limit, %0
  br i1 %1, label %"3", label %"8"

"3":                                              ; preds = %entry
  %2 = fcmp olt float %value, 0.000000e+00
  %3 = fsub float -0.000000e+00, %limit
  %4 = select i1 %2, float %3, float %limit
  br label %"8"

"8":                                              ; preds = %"3", %entry
  %5 = phi float [ %value, %entry ], [ %4, %"3" ]
  ret float %5
}

declare float @fabsf(float)

; Function Attrs: uwtable
define float @obclib__exp_sf(float %arg) #0 align 2 {
entry:
  %0 = call float @ada__numerics__elementary_functions__exp(float %arg) #4
  ret float %0
}

; Function Attrs: readnone
declare float @ada__numerics__elementary_functions__exp(float) #4

; Function Attrs: uwtable
define float @obclib__sin_sf(float %arg) unnamed_addr #0 align 2 {
entry:
  %0 = call float @ada__numerics__elementary_functions__sin(float %arg) #4
  ret float %0
}

; Function Attrs: readnone
declare float @ada__numerics__elementary_functions__sin(float) #4

; Function Attrs: uwtable
define float @obclib__cos_sf(float %arg) unnamed_addr #0 align 2 {
entry:
  %0 = call float @ada__numerics__elementary_functions__cos(float %arg) #4
  ret float %0
}

; Function Attrs: readnone
declare float @ada__numerics__elementary_functions__cos(float) #4

; Function Attrs: uwtable
define float @obclib__atan2_sf(float %sx, float %sy) unnamed_addr #0 align 2 {
entry:
  %0 = call float @ada__numerics__elementary_functions__arctan__2(float %sx, float %sy, float 0x401921FB60000000) #4
  ret float %0
}

; Function Attrs: readnone
declare float @ada__numerics__elementary_functions__arctan__2(float, float, float) #4

; Function Attrs: uwtable
define float @obclib__atan_sf(float %arg) unnamed_addr #0 align 2 {
entry:
  %0 = call float @ada__numerics__elementary_functions__arctan(float %arg, float 1.000000e+00) #4
  ret float %0
}

; Function Attrs: readnone
declare float @ada__numerics__elementary_functions__arctan(float, float) #4

; Function Attrs: uwtable
define zeroext i16 @obclib__bit_and(i16 zeroext %value1, i16 zeroext %value2) unnamed_addr #0 align 2 {
entry:
  %0 = and i16 %value1, %value2
  ret i16 %0
}

; Function Attrs: uwtable
define zeroext i16 @obclib__bit_or(i16 zeroext %value1, i16 zeroext %value2) unnamed_addr #0 align 2 {
entry:
  %0 = or i16 %value1, %value2
  ret i16 %0
}

; Function Attrs: uwtable
define zeroext i16 @obclib__bit_xor(i16 zeroext %value1, i16 zeroext %value2) unnamed_addr #0 align 2 {
entry:
  %0 = xor i16 %value1, %value2
  ret i16 %0
}

; Function Attrs: uwtable
define i32 @obclib__lbit_xor(i32 %value1, i32 %value2) unnamed_addr #0 align 2 {
entry:
  %0 = xor i32 %value1, %value2
  ret i32 %0
}

; Function Attrs: uwtable
define zeroext i16 @obclib__bit_not(i16 zeroext %value) unnamed_addr #0 align 2 {
entry:
  %not = xor i16 %value, -1
  ret i16 %not
}

; Function Attrs: uwtable
define float @obclib__log_sf(float %arg) unnamed_addr #0 align 2 {
entry:
  %0 = call float @ada__numerics__elementary_functions__log(float %arg) #4
  ret float %0
}

; Function Attrs: readnone
declare float @ada__numerics__elementary_functions__log(float) #4

; Function Attrs: uwtable
define signext i16 @obclib__u16tos16(i16 zeroext %value) unnamed_addr #0 align 2 {
entry:
  %0 = icmp slt i16 %value, 0
  %1 = select i1 %0, i16 32767, i16 %value
  ret i16 %1
}

attributes #0 = { uwtable "no-frame-pointer-elim-non-leaf"="true" }
attributes #1 = { noreturn }
attributes #2 = { inlinehint uwtable "no-frame-pointer-elim-non-leaf"="true" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { readnone }
attributes #5 = { nounwind readnone }

!llvm.module.flags = !{!0}

!0 = !{i32 7, !"PIE Level", i32 2}
