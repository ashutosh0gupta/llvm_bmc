; ModuleID = '../Test/Examples/main.adb'
source_filename = "../Test/Examples/main.adb"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64--linux-gnu"

module asm "\09.ident\09\22GCC: (Ubuntu 8.3.0-26ubuntu1~18.04) 8.3.0 LLVM: 6.0.0\22"

@main__posdefoutofplane = unnamed_addr global float undef
@main__steercoeffd = unnamed_addr global float undef
@main__steercoeffc = unnamed_addr global float undef
@main__steercoeffb = unnamed_addr global float undef
@main__steercoeffa = unnamed_addr global float undef
@main__matrix22 = unnamed_addr global float undef
@main__matrix12 = unnamed_addr global float undef
@main__matrix11 = unnamed_addr global float undef
@main__defvel = unnamed_addr global float undef
@main__defpos = unnamed_addr global float undef
@main__angley = unnamed_addr global float undef
@main__angler = unnamed_addr global float undef
@main__stage_time = unnamed_addr global float undef
@main__effectivegravity = unnamed_addr global float undef
@main__guidvel_w = unnamed_addr global float undef
@main__guidvel_v = unnamed_addr global float undef
@main__guidvel_u = unnamed_addr global float undef
@main__ttg = unnamed_addr global float undef
@main__event4 = unnamed_addr global i16 undef
@main__minorflag_stage3 = unnamed_addr global i16 undef
@main__minorflag_stage2 = unnamed_addr global i16 undef
@main__cyclecount = unnamed_addr global i32 undef
@main__outflag = unnamed_addr global i16 undef
@main__minorinmajor = unnamed_addr global i16 undef
@main__offstage3 = unnamed_addr global i16 undef
@main__offstage2 = unnamed_addr global i16 undef
@main__step14 = unnamed_addr global i16 undef
@main__step13 = unnamed_addr global i16 undef
@main__step12 = unnamed_addr global i16 undef
@main__step11 = unnamed_addr global i16 undef
@main__step10 = unnamed_addr global i16 undef
@main__step8 = unnamed_addr global i16 undef
@main__step7 = unnamed_addr global i16 undef
@main__step6 = unnamed_addr global i16 undef
@main__step5 = unnamed_addr global i16 undef
@main__step4 = unnamed_addr global i16 undef
@main__step2 = unnamed_addr global i16 undef
@main__stage3_start = unnamed_addr global float undef
@main__stage2_start = unnamed_addr global float undef
@main__apogee = unnamed_addr global float undef
@main__radialdist = unnamed_addr global float undef
@main__velw = unnamed_addr global float undef
@main__velv = unnamed_addr global float undef
@main__velu = unnamed_addr global float undef
@main__posz = unnamed_addr global float undef
@main__posy = unnamed_addr global float undef
@main__posx = unnamed_addr global float undef
@main__liftoff = unnamed_addr global float undef
@main__major_time = unnamed_addr global float undef
@main__time = unnamed_addr global float undef
@main__combinederrorflag = unnamed_addr global i16 undef
@main__outflag3 = unnamed_addr global i16 undef
@main__outflag2 = unnamed_addr global i16 undef
@main__outflag1 = unnamed_addr global i16 undef
@main__guidoutflagc = unnamed_addr global i16 undef
@main__guidoutflag = unnamed_addr global i16 undef
@main__stageflgc = unnamed_addr global i16 undef
@main__stageflg = unnamed_addr global i16 undef
@main__altitudeinfo = unnamed_addr global float undef
@main__qc = unnamed_addr global [5 x float] undef, align 16
@main__brate = unnamed_addr global [5 x float] undef, align 16
@main_E = unnamed_addr global i16 0
@.cst = private local_unnamed_addr constant [9 x i8] c"main.adb\00", align 8
@major_cycle__duration = external global float
@major_cycle__desiredq = external global [5 x float]
@main__man_desiredq = internal unnamed_addr global [5 x float] undef, align 16
@minor_cycle__firstcycle_mnvre = external global i16
@lookup__iterationcount = external global i16
@major_cycle__velocityincrmj = external global float
@major_cycle__velocityincrmn = external global float
@major_cycle__minorflag_stage2 = external global i16
@major_cycle__minorflag_stage3 = external global i16
@major_cycle__enterstage2 = external global i16
@major_cycle__event4 = external global i16
@major_cycle__velflag = external global i16
@major_cycle__enterstage3 = external global i16
@minor_cycle__offstage2 = external global i16
@minor_cycle__offstage3 = external global i16
@minor_cycle__firstcycle_stage1 = external global i16
@minor_cycle__firstcycle_stage2 = external global i16
@minor_cycle__firstcycle_stage3 = external global i16
@.cst.1 = private local_unnamed_addr constant [9 x i8] c"main.ads\00", align 8

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
  call void @__gnat_rcheck_CE_Range_Check(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.cst, i64 0, i64 0), i32 14) #1
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
  %44 = load float, float* @main__time, align 4
  store float %44, float* @main__stage3_start, align 4
  store i16 170, i16* @main__outflag, align 2
  br label %return

"55":                                             ; preds = %"19"
  %45 = load i16, i16* @main__outflag, align 2
  %46 = icmp eq i16 %45, 170
  %47 = load i16, i16* @main__minorinmajor, align 2
  %48 = icmp eq i16 %47, 1
  %or.cond7 = and i1 %46, %48
  br i1 %or.cond7, label %"57", label %return

"57":                                             ; preds = %"55"
  store i16 1, i16* @main__step10, align 2
  store i16 187, i16* @main__outflag, align 2
  br label %return

"59":                                             ; preds = %"17"
  %49 = load i16, i16* @main__outflag, align 2
  %50 = icmp eq i16 %49, 187
  %51 = load i16, i16* @main__minorinmajor, align 2
  %52 = icmp eq i16 %51, 1
  %or.cond9 = and i1 %50, %52
  br i1 %or.cond9, label %"61", label %return

"61":                                             ; preds = %"59"
  store i16 1, i16* @main__step11, align 2
  store i16 204, i16* @main__outflag, align 2
  br label %return

"63":                                             ; preds = %"22"
  %53 = load i16, i16* @main__outflag, align 2
  %54 = icmp eq i16 %53, 204
  br i1 %54, label %"64", label %return

"64":                                             ; preds = %"63"
  store i16 1, i16* @main__step12, align 2
  store i16 221, i16* @main__outflag, align 2
  br label %return

"66":                                             ; preds = %"22"
  %55 = load i16, i16* @main__outflag, align 2
  %56 = icmp eq i16 %55, 221
  %57 = load i16, i16* @main__minorinmajor, align 2
  %58 = icmp eq i16 %57, 1
  %or.cond11 = and i1 %56, %58
  br i1 %or.cond11, label %"68", label %return

"68":                                             ; preds = %"66"
  store i16 1, i16* @main__step13, align 2
  store i16 0, i16* @main__step14, align 2
  store float 5.000000e+01, float* @major_cycle__duration, align 4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast ([5 x float]* @major_cycle__desiredq to i8*), i8* bitcast ([5 x float]* @main__man_desiredq to i8*), i64 20, i32 4, i1 false)
  store i16 238, i16* @main__outflag, align 2
  br label %return

"70":                                             ; preds = %"22"
  %59 = load i16, i16* @main__outflag, align 2
  %60 = icmp eq i16 %59, 238
  %61 = load i16, i16* @main__minorinmajor, align 2
  %62 = icmp eq i16 %61, 1
  %or.cond13 = and i1 %60, %62
  br i1 %or.cond13, label %"72", label %return

"72":                                             ; preds = %"70"
  store i16 1, i16* @main__step14, align 2
  store i16 0, i16* @main__step13, align 2
  store i16 0, i16* @minor_cycle__firstcycle_mnvre, align 2
  store i16 221, i16* @main__outflag, align 2
  br label %return

"77":                                             ; preds = %entry
  store i16 1, i16* @main__combinederrorflag, align 2
  br label %return

return:                                           ; preds = %"26", %"25", %"29", %"28", %"32", %"31", %"36", %"34", %"40", %"38", %"44", %"42", %"47", %"46", %"50", %"49", %"53", %"52", %"57", %"55", %"61", %"59", %"64", %"63", %"68", %"66", %"72", %"70", %"12", %"14", %"19", %"22", %"77"
  ret void
}

; Function Attrs: noreturn
declare void @__gnat_rcheck_CE_Range_Check(i8*, i32) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: uwtable
define void @main__outputflags_minor() local_unnamed_addr #0 align 2 {
entry:
  %0 = load i16, i16* @main__event4, align 2
  %1 = icmp eq i16 %0, 1
  %2 = load i16, i16* @main__outflag1, align 2
  %3 = icmp eq i16 %2, 0
  %or.cond = and i1 %1, %3
  br i1 %or.cond, label %"4", label %"5"

"4":                                              ; preds = %entry
  store i16 4369, i16* @main__guidoutflag, align 2
  store i16 -4370, i16* @main__guidoutflagc, align 2
  store i16 1, i16* @main__outflag1, align 2
  br label %"5"

"5":                                              ; preds = %"4", %entry
  %4 = load i16, i16* @main__offstage2, align 2
  %5 = icmp eq i16 %4, 1
  %6 = load i16, i16* @main__step7, align 2
  %7 = icmp eq i16 %6, 1
  %or.cond3 = and i1 %5, %7
  %8 = load i16, i16* @main__outflag2, align 2
  %9 = icmp eq i16 %8, 0
  %or.cond5 = and i1 %or.cond3, %9
  br i1 %or.cond5, label %"8", label %"9"

"8":                                              ; preds = %"5"
  store i16 8738, i16* @main__guidoutflag, align 2
  store i16 -8739, i16* @main__guidoutflagc, align 2
  store i16 1, i16* @main__outflag2, align 2
  br label %"9"

"9":                                              ; preds = %"8", %"5"
  %10 = load i16, i16* @main__offstage2, align 2
  %11 = icmp eq i16 %10, 1
  %12 = load i16, i16* @main__outflag3, align 2
  %13 = icmp eq i16 %12, 0
  %or.cond7 = and i1 %11, %13
  br i1 %or.cond7, label %"11", label %return

"11":                                             ; preds = %"9"
  store i16 13107, i16* @main__guidoutflag, align 2
  store i16 -13108, i16* @main__guidoutflagc, align 2
  store i16 1, i16* @main__outflag3, align 2
  br label %return

return:                                           ; preds = %"11", %"9"
  ret void
}

; Function Attrs: uwtable
define void @main__guid_minor() unnamed_addr #0 align 2 {
entry:
  call void @main__stageflags() #0
  %0 = load i16, i16* @main__step14, align 2
  %1 = icmp eq i16 %0, 1
  br i1 %1, label %return, label %"5"

"5":                                              ; preds = %entry
  %2 = load i16, i16* @main__step13, align 2
  %3 = icmp eq i16 %2, 1
  br i1 %3, label %"6", label %"7"

"6":                                              ; preds = %"5"
  call void @minor_cycle__manoeuvre()
  br label %return

"7":                                              ; preds = %"5"
  %4 = load i16, i16* @main__step10, align 2
  %5 = icmp eq i16 %4, 1
  br i1 %5, label %"8", label %"9"

"8":                                              ; preds = %"7"
  call void @minor_cycle__stage3_minor()
  br label %return

"9":                                              ; preds = %"7"
  %6 = load i16, i16* @main__step4, align 2
  %7 = icmp eq i16 %6, 1
  br i1 %7, label %"10", label %"11"

"10":                                             ; preds = %"9"
  call void @minor_cycle__stage2_minor()
  call void @main__outputflags_minor() #0
  br label %return

"11":                                             ; preds = %"9"
  call void @minor_cycle__stage1_minor()
  br label %return

return:                                           ; preds = %entry, %"11", %"10", %"8", %"6"
  ret void
}

declare void @minor_cycle__manoeuvre()

declare void @minor_cycle__stage3_minor()

declare void @minor_cycle__stage2_minor()

declare void @minor_cycle__stage1_minor()

; Function Attrs: uwtable
define void @main__guid_major() unnamed_addr #0 align 2 {
entry:
  %0 = load i16, i16* @main__step14, align 2
  %1 = icmp eq i16 %0, 1
  br i1 %1, label %return, label %"5"

"5":                                              ; preds = %entry
  %2 = load i16, i16* @main__step13, align 2
  %3 = icmp eq i16 %2, 1
  br i1 %3, label %"6", label %"7"

"6":                                              ; preds = %"5"
  call void @major_cycle__manoeuvre()
  br label %return

"7":                                              ; preds = %"5"
  %4 = load i16, i16* @main__step10, align 2
  %5 = icmp eq i16 %4, 1
  br i1 %5, label %"8", label %"9"

"8":                                              ; preds = %"7"
  call void @major_cycle__stage3_major()
  br label %return

"9":                                              ; preds = %"7"
  call void @major_cycle__stage2_major()
  br label %return

return:                                           ; preds = %entry, %"9", %"8", %"6"
  ret void
}

declare void @major_cycle__manoeuvre()

declare void @major_cycle__stage3_major()

declare void @major_cycle__stage2_major()

; Function Attrs: uwtable
define void @main__firstinit() unnamed_addr #0 align 2 {
entry:
  store i16 1, i16* @lookup__iterationcount, align 2
  store i16 1, i16* @main__minorinmajor, align 2
  store float 0.000000e+00, float* @major_cycle__velocityincrmj, align 4
  store float 0.000000e+00, float* @major_cycle__velocityincrmn, align 4
  store i16 0, i16* @major_cycle__minorflag_stage2, align 2
  store i16 0, i16* @major_cycle__minorflag_stage3, align 2
  store i16 1, i16* @major_cycle__enterstage2, align 2
  store i16 0, i16* @major_cycle__event4, align 2
  store i16 0, i16* @major_cycle__velflag, align 2
  store i16 1, i16* @major_cycle__enterstage3, align 2
  store i16 0, i16* @minor_cycle__offstage2, align 2
  store i16 0, i16* @minor_cycle__offstage3, align 2
  store i16 1, i16* @minor_cycle__firstcycle_stage1, align 2
  store i16 1, i16* @minor_cycle__firstcycle_stage2, align 2
  store i16 1, i16* @minor_cycle__firstcycle_stage3, align 2
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
  store i16 0, i16* @main__event4, align 2
  store i16 0, i16* @main__offstage2, align 2
  store i16 0, i16* @main__offstage3, align 2
  store i16 0, i16* @main__outflag1, align 2
  store i16 0, i16* @main__outflag2, align 2
  store i16 0, i16* @main__outflag3, align 2
  store i16 0, i16* @main__minorflag_stage2, align 2
  store i16 0, i16* @main__minorflag_stage3, align 2
  store i16 0, i16* @main__combinederrorflag, align 2
  store i16 0, i16* @main__guidoutflag, align 2
  store i16 -1, i16* @main__guidoutflagc, align 2
  store float 0.000000e+00, float* getelementptr inbounds ([5 x float], [5 x float]* @main__brate, i64 0, i64 0), align 4
  store float 0.000000e+00, float* getelementptr inbounds ([5 x float], [5 x float]* @main__brate, i64 0, i64 1), align 4
  store float 0.000000e+00, float* getelementptr inbounds ([5 x float], [5 x float]* @main__brate, i64 0, i64 2), align 4
  store float 0.000000e+00, float* @main__stage_time, align 4
  store float 0.000000e+00, float* @main__effectivegravity, align 4
  store float 0.000000e+00, float* @main__angler, align 4
  store float 0.000000e+00, float* @main__angley, align 4
  store float 0.000000e+00, float* @main__guidvel_u, align 4
  store float 0.000000e+00, float* @main__guidvel_v, align 4
  store float 0.000000e+00, float* @main__guidvel_w, align 4
  store float 0.000000e+00, float* @main__steercoeffa, align 4
  store float 0.000000e+00, float* @main__steercoeffb, align 4
  store float 0.000000e+00, float* @main__steercoeffc, align 4
  store float 0.000000e+00, float* @main__steercoeffd, align 4
  store float 0.000000e+00, float* @main__posdefoutofplane, align 4
  store float 0.000000e+00, float* @main__defpos, align 4
  store float 0.000000e+00, float* @main__defvel, align 4
  store float 0.000000e+00, float* @main__matrix11, align 4
  store float 0.000000e+00, float* @main__matrix12, align 4
  store float 0.000000e+00, float* @main__matrix22, align 4
  store float 0.000000e+00, float* @main__ttg, align 4
  store i16 0, i16* @minor_cycle__firstcycle_mnvre, align 2
  ret void
}

; Function Attrs: uwtable
define void @main___elabb() unnamed_addr #0 align 2 {
entry:
  call void @__gnat_rcheck_CE_Range_Check(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.cst, i64 0, i64 0), i32 8) #1
  unreachable
}

; Function Attrs: uwtable
define void @main___elabs() unnamed_addr #0 align 2 {
entry:
  call void @__gnat_rcheck_CE_Range_Check(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.cst.1, i64 0, i64 0), i32 11) #1
  unreachable
}

attributes #0 = { uwtable "no-frame-pointer-elim-non-leaf"="true" }
attributes #1 = { noreturn }
attributes #2 = { argmemonly nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 7, !"PIE Level", i32 2}
