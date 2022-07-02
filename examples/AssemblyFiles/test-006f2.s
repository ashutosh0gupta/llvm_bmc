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

@main__posdefoutofplane = unnamed_addr global float 0.000000e+00
@main__steercoeffd = unnamed_addr global float 0.000000e+00
@main__steercoeffc = unnamed_addr global float 0.000000e+00
@main__steercoeffb = unnamed_addr global float 0.000000e+00
@main__steercoeffa = unnamed_addr global float 0.000000e+00
@main__matrix22 = unnamed_addr global float 0.000000e+00
@main__matrix12 = unnamed_addr global float 0.000000e+00
@main__matrix11 = unnamed_addr global float 0.000000e+00
@main__defvel = unnamed_addr global float 0.000000e+00
@main__defpos = unnamed_addr global float 0.000000e+00
@main__angley = global float 0.000000e+00
@main__angler = global float 0.000000e+00
@main__stage_time = global float 0.000000e+00
@main__effectivegravity = global float 0.000000e+00
@main__guidvel_w = global float 0.000000e+00
@main__guidvel_v = global float 0.000000e+00
@main__guidvel_u = global float 0.000000e+00
@main__ttg = global float 0.000000e+00
@main__event4 = unnamed_addr global i16 undef
@main__minorflag_stage2 = global i16 undef
@main__cyclecount = unnamed_addr global i32 undef
@main__outflag = unnamed_addr global i16 17
@main__minorinmajor = unnamed_addr global i16 1
@main__offstage2 = unnamed_addr global i16 0
@main__step14 = unnamed_addr global i16 0
@main__step13 = unnamed_addr global i16 0
@main__step12 = unnamed_addr global i16 0
@main__step11 = unnamed_addr global i16 0
@main__step10 = unnamed_addr global i16 0
@main__step8 = unnamed_addr global i16 0
@main__step7 = unnamed_addr global i16 0
@main__step6 = unnamed_addr global i16 0
@main__step5 = unnamed_addr global i16 0
@main__step4 = unnamed_addr global i16 0
@main__step2 = unnamed_addr global i16 0
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
@main__combinederrorflag = unnamed_addr global i16 0
@main__guidoutflagc = unnamed_addr global i16 undef
@main__guidoutflag = unnamed_addr global i16 undef
@main__stageflgc = unnamed_addr global i16 -1
@main__stageflg = unnamed_addr global i16 0
@main__qc = global [5 x float] [float 0x3FD70BE0E0000000, float 0xBFC85BC020000000, float 0x3FE35CFAA0000000, float 0x3FE6703B00000000, float 0x3FE6703B00000000], align 16
@main__brate = global [5 x float] zeroinitializer, align 16
@main_E = unnamed_addr global i16 0
@.cst = private local_unnamed_addr constant [9 x i8] c"main.adb\00", align 8
@major_cycle__duration = global float undef
@major_cycle__desiredq = unnamed_addr global [5 x float] undef, align 16
@major_cycle__ttg_prev = unnamed_addr global float undef
@major_cycle__tempres = unnamed_addr global [5 x float] undef, align 16
@major_cycle__brate = unnamed_addr global [5 x float] undef, align 16
@major_cycle__velocity = unnamed_addr global [5 x float] undef, align 16
@major_cycle__guidvel = unnamed_addr global [5 x float] undef, align 16
@major_cycle__dircos_v = unnamed_addr global [5 x float] undef, align 16
@major_cycle__dircos_u = unnamed_addr global [5 x float] undef, align 16
@major_cycle__dircos = unnamed_addr global [5 x float] undef, align 16
@major_cycle__position = local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__q_minor = unnamed_addr global [25 x [5 x float]] undef, align 32
@major_cycle__dotq = unnamed_addr global [5 x float] undef, align 16
@major_cycle__majorprev_q = unnamed_addr global [5 x float] undef, align 16
@major_cycle__temp1 = unnamed_addr global [5 x float] undef, align 16
@major_cycle__distvelaxis = unnamed_addr global float undef
@major_cycle__templ = unnamed_addr global float undef
@major_cycle__velsqr = unnamed_addr global float undef
@major_cycle__angley = unnamed_addr global float undef
@major_cycle__angler = unnamed_addr global float undef
@major_cycle__total_time_stage2 = unnamed_addr global float undef
@major_cycle__tempt = unnamed_addr global float undef
@major_cycle__tempa = unnamed_addr global float undef
@major_cycle__tempp = unnamed_addr global float undef
@major_cycle__effectivegravity = unnamed_addr global float undef
@major_cycle__ttg = unnamed_addr global float undef
@major_cycle__stage_time = unnamed_addr global float undef
@major_cycle__instvelocityprev = unnamed_addr global float undef
@major_cycle__instvelocity = unnamed_addr global float undef
@major_cycle__velocityincrmj = unnamed_addr global float 0.000000e+00
@major_cycle__velocityincrmn = unnamed_addr global float 0.000000e+00
@major_cycle__velocitycoeff = unnamed_addr global float undef
@major_cycle__enterstage2 = unnamed_addr global i16 1
@major_cycle__velflag = unnamed_addr global i16 0
@major_cycle__minorflag_stage2 = unnamed_addr global i16 0
@major_cycle__event4 = unnamed_addr global i16 0
@major_cycle_E = unnamed_addr global i16 0
@major_cycle__dircos_stage2 = internal local_unnamed_addr constant [5 x float] [float 0xBFD0985F00000000, float 0xBFC86594A0000000, float 0x3FEE752540000000, float 0xBFD0985F00000000, float 0xBFC86594A0000000], align 16
@math_E = unnamed_addr global i16 0

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
define void @main__stageflags() local_unnamed_addr #0 align 2 {
entry:
  %0 = load i16, i16* @main__stageflg, align 2
  %1 = load i16, i16* @main__stageflgc, align 2
  %2 = add i16 %0, %1
  %3 = icmp eq i16 %2, -1
  br i1 %3, label %"3", label %"73"

"3":                                              ; preds = %entry
  %4 = load i32, i32* @main__cyclecount, align 4
  %5 = uitofp i32 %4 to float
  %6 = fcmp ult float %5, 0xC7EFFFFFE0000000
  br i1 %6, label %"5", label %"4"

"4":                                              ; preds = %"3"
  %7 = fcmp ugt float %5, 0x47EFFFFFE0000000
  br i1 %7, label %"5", label %"6"

"5":                                              ; preds = %"4", %"3"
  call void @__gnat_rcheck_CE_Range_Check(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.cst, i64 0, i64 0), i32 10) #1
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
  br i1 %12, label %"45", label %"9"

"9":                                              ; preds = %"8"
  %13 = icmp ugt i16 %11, 119
  br i1 %13, label %"17", label %"10"

"10":                                             ; preds = %"9"
  %14 = icmp eq i16 %11, 51
  br i1 %14, label %"30", label %"11"

"11":                                             ; preds = %"10"
  %15 = icmp ugt i16 %11, 51
  br i1 %15, label %"14", label %"12"

"12":                                             ; preds = %"11"
  switch i16 %11, label %return [
    i16 17, label %"24"
    i16 34, label %"27"
  ]

"14":                                             ; preds = %"11"
  switch i16 %11, label %return [
    i16 85, label %"37"
    i16 102, label %"41"
    i16 68, label %"33"
  ]

"17":                                             ; preds = %"9"
  %16 = icmp eq i16 %11, 187
  br i1 %16, label %"55", label %"18"

"18":                                             ; preds = %"17"
  %17 = icmp ugt i16 %11, 187
  br i1 %17, label %"21", label %"19"

"19":                                             ; preds = %"18"
  switch i16 %11, label %return [
    i16 136, label %"48"
    i16 170, label %"51"
  ]

"21":                                             ; preds = %"18"
  switch i16 %11, label %return [
    i16 221, label %"62"
    i16 238, label %"66"
    i16 204, label %"59"
  ]

"24":                                             ; preds = %"12"
  %18 = load i16, i16* @main__outflag, align 2
  %19 = icmp eq i16 %18, 17
  br i1 %19, label %"25", label %return

"25":                                             ; preds = %"24"
  %20 = load float, float* @main__time, align 4
  store float %20, float* @main__liftoff, align 4
  store i16 34, i16* @main__outflag, align 2
  br label %return

"27":                                             ; preds = %"12"
  %21 = load i16, i16* @main__outflag, align 2
  %22 = icmp eq i16 %21, 34
  br i1 %22, label %"28", label %return

"28":                                             ; preds = %"27"
  store i16 1, i16* @main__step2, align 2
  store i16 51, i16* @main__outflag, align 2
  br label %return

"30":                                             ; preds = %"10"
  %23 = load i16, i16* @main__outflag, align 2
  %24 = icmp eq i16 %23, 51
  br i1 %24, label %"31", label %return

"31":                                             ; preds = %"30"
  %25 = load float, float* @main__time, align 4
  store float %25, float* @main__stage2_start, align 4
  store i16 68, i16* @main__outflag, align 2
  br label %return

"33":                                             ; preds = %"14"
  %26 = load i16, i16* @main__outflag, align 2
  %27 = icmp eq i16 %26, 68
  %28 = load i16, i16* @main__minorinmajor, align 2
  %29 = icmp eq i16 %28, 1
  %or.cond = and i1 %27, %29
  br i1 %or.cond, label %"35", label %return

"35":                                             ; preds = %"33"
  store i16 1, i16* @main__step4, align 2
  store i16 85, i16* @main__outflag, align 2
  br label %return

"37":                                             ; preds = %"14"
  %30 = load i16, i16* @main__outflag, align 2
  %31 = icmp eq i16 %30, 85
  %32 = load i16, i16* @main__minorinmajor, align 2
  %33 = icmp eq i16 %32, 1
  %or.cond3 = and i1 %31, %33
  br i1 %or.cond3, label %"39", label %return

"39":                                             ; preds = %"37"
  store i16 1, i16* @main__step5, align 2
  store i16 102, i16* @main__outflag, align 2
  br label %return

"41":                                             ; preds = %"14"
  %34 = load i16, i16* @main__outflag, align 2
  %35 = icmp eq i16 %34, 102
  %36 = load i16, i16* @main__minorinmajor, align 2
  %37 = icmp eq i16 %36, 1
  %or.cond5 = and i1 %35, %37
  br i1 %or.cond5, label %"43", label %return

"43":                                             ; preds = %"41"
  store i16 1, i16* @main__step6, align 2
  store i16 119, i16* @main__outflag, align 2
  br label %return

"45":                                             ; preds = %"8"
  %38 = load i16, i16* @main__outflag, align 2
  %39 = icmp eq i16 %38, 119
  br i1 %39, label %"46", label %return

"46":                                             ; preds = %"45"
  store i16 1, i16* @main__step7, align 2
  store i16 136, i16* @main__outflag, align 2
  br label %return

"48":                                             ; preds = %"19"
  %40 = load i16, i16* @main__outflag, align 2
  %41 = icmp eq i16 %40, 136
  br i1 %41, label %"49", label %return

"49":                                             ; preds = %"48"
  store i16 1, i16* @main__step8, align 2
  store i16 153, i16* @main__outflag, align 2
  br label %return

"51":                                             ; preds = %"19"
  %42 = load i16, i16* @main__outflag, align 2
  %43 = icmp eq i16 %42, 170
  %44 = load i16, i16* @main__minorinmajor, align 2
  %45 = icmp eq i16 %44, 1
  %or.cond7 = and i1 %43, %45
  br i1 %or.cond7, label %"53", label %return

"53":                                             ; preds = %"51"
  store i16 1, i16* @main__step10, align 2
  store i16 187, i16* @main__outflag, align 2
  br label %return

"55":                                             ; preds = %"17"
  %46 = load i16, i16* @main__outflag, align 2
  %47 = icmp eq i16 %46, 187
  %48 = load i16, i16* @main__minorinmajor, align 2
  %49 = icmp eq i16 %48, 1
  %or.cond9 = and i1 %47, %49
  br i1 %or.cond9, label %"57", label %return

"57":                                             ; preds = %"55"
  store i16 1, i16* @main__step11, align 2
  store i16 204, i16* @main__outflag, align 2
  br label %return

"59":                                             ; preds = %"21"
  %50 = load i16, i16* @main__outflag, align 2
  %51 = icmp eq i16 %50, 204
  br i1 %51, label %"60", label %return

"60":                                             ; preds = %"59"
  store i16 1, i16* @main__step12, align 2
  store i16 221, i16* @main__outflag, align 2
  br label %return

"62":                                             ; preds = %"21"
  %52 = load i16, i16* @main__outflag, align 2
  %53 = icmp eq i16 %52, 221
  %54 = load i16, i16* @main__minorinmajor, align 2
  %55 = icmp eq i16 %54, 1
  %or.cond11 = and i1 %53, %55
  br i1 %or.cond11, label %"64", label %return

"64":                                             ; preds = %"62"
  store i16 1, i16* @main__step13, align 2
  store i16 0, i16* @main__step14, align 2
  store float 5.000000e+01, float* @major_cycle__duration, align 4
  store i16 238, i16* @main__outflag, align 2
  br label %return

"66":                                             ; preds = %"21"
  %56 = load i16, i16* @main__outflag, align 2
  %57 = icmp eq i16 %56, 238
  %58 = load i16, i16* @main__minorinmajor, align 2
  %59 = icmp eq i16 %58, 1
  %or.cond13 = and i1 %57, %59
  br i1 %or.cond13, label %"68", label %return

"68":                                             ; preds = %"66"
  store i16 1, i16* @main__step14, align 2
  store i16 0, i16* @main__step13, align 2
  store i16 221, i16* @main__outflag, align 2
  br label %return

"73":                                             ; preds = %entry
  store i16 1, i16* @main__combinederrorflag, align 2
  br label %return

return:                                           ; preds = %"73", %"68", %"66", %"64", %"62", %"60", %"59", %"57", %"55", %"53", %"51", %"49", %"48", %"46", %"45", %"43", %"41", %"39", %"37", %"35", %"33", %"31", %"30", %"28", %"27", %"25", %"24", %"21", %"19", %"14", %"12"
  ret void
}

; Function Attrs: noreturn
declare void @__gnat_rcheck_CE_Range_Check(i8*, i32) #1

; Function Attrs: uwtable
define void @main__guid_major() #0 align 2 {
entry:
  call void @main__stageflags() #0
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
  %11 = load i16, i16* @major_cycle__velflag, align 2
  %12 = icmp eq i16 %11, 1
  br i1 %12, label %"5", label %"6"

"5":                                              ; preds = %"4"
  %13 = load float, float* @major_cycle__instvelocity, align 4
  %14 = load float, float* @major_cycle__instvelocityprev, align 4
  %15 = fsub float %13, %14
  store float %15, float* @major_cycle__velocityincrmj, align 4
  %16 = load float, float* @major_cycle__instvelocity, align 4
  %17 = fadd float %16, %15
  store float %17, float* @major_cycle__velocitycoeff, align 4
  %18 = load float, float* @major_cycle__velocityincrmj, align 4
  %19 = fdiv float %18, 2.500000e+01
  store float %19, float* @major_cycle__velocityincrmn, align 4
  %20 = load float, float* @major_cycle__instvelocity, align 4
  store float %20, float* @major_cycle__instvelocityprev, align 4
  br label %"6"

"6":                                              ; preds = %"5", %"4"
  %21 = load i16, i16* @major_cycle__minorflag_stage2, align 2
  %22 = icmp eq i16 %21, 1
  br i1 %22, label %"7", label %"8"

"7":                                              ; preds = %"6"
  %23 = load float, float* @major_cycle__ttg, align 4
  %24 = fsub float %23, 5.000000e-01
  store float %24, float* @major_cycle__ttg, align 4
  br label %"13"

"8":                                              ; preds = %"6"
  call void @major_cycle__computation1([5 x float]* @major_cycle__position, [5 x float]* @major_cycle__dircos_stage2)
  %25 = load float, float* @major_cycle__tempa, align 4
  %26 = fdiv float 0x42F6BCC420000000, %25
  %27 = load float, float* @major_cycle__velsqr, align 4
  %28 = fsub float %26, %27
  %29 = fdiv float %28, %25
  store float %29, float* @major_cycle__effectivegravity, align 4
  %30 = load float, float* @major_cycle__distvelaxis, align 4
  %31 = fsub float -0.000000e+00, %30
  store float %31, float* @major_cycle__distvelaxis, align 4
  %32 = load float, float* @major_cycle__templ, align 4
  %33 = fdiv float %31, %32
  store float %33, float* @major_cycle__distvelaxis, align 4
  %34 = load float, float* @major_cycle__stage_time, align 4
  %35 = fsub float 0x4072903120000000, %34
  store float %35, float* @major_cycle__tempt, align 4
  %36 = load float, float* @major_cycle__tempp, align 4
  %37 = fsub float 1.000000e+00, %36
  %38 = fmul float %37, %35
  store float %38, float* @major_cycle__ttg, align 4
  %39 = load float, float* @major_cycle__stage_time, align 4
  %40 = fadd float %38, %39
  store float %40, float* @major_cycle__total_time_stage2, align 4
  %41 = load float, float* @major_cycle__angler, align 4
  store float %41, float* @main__angler, align 4
  %42 = load float, float* @major_cycle__angley, align 4
  store float %42, float* @main__angley, align 4
  %43 = load float, float* @major_cycle__ttg, align 4
  %44 = fcmp olt float %43, 1.350000e+01
  %45 = load i16, i16* @major_cycle__event4, align 2
  %46 = icmp eq i16 %45, 0
  %or.cond = and i1 %44, %46
  br i1 %or.cond, label %"10", label %"11"

"10":                                             ; preds = %"8"
  store i16 1, i16* @major_cycle__event4, align 2
  br label %"11"

"11":                                             ; preds = %"10", %"8"
  %47 = load float, float* @major_cycle__ttg, align 4
  %48 = fcmp olt float %47, 5.000000e+00
  br i1 %48, label %"12", label %"13"

"12":                                             ; preds = %"11"
  store i16 1, i16* @major_cycle__minorflag_stage2, align 2
  br label %"13"

"13":                                             ; preds = %"12", %"11", %"7"
  %49 = load float, float* @major_cycle__ttg, align 4
  store float %49, float* @major_cycle__ttg_prev, align 4
  %50 = load i16, i16* @major_cycle__minorflag_stage2, align 2
  store i16 %50, i16* @main__minorflag_stage2, align 2
  %51 = load float, float* @major_cycle__ttg, align 4
  store float %51, float* @main__ttg, align 4
  %52 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 0), align 4
  store float %52, float* @main__guidvel_u, align 4
  %53 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 1), align 4
  store float %53, float* @main__guidvel_v, align 4
  %54 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 2), align 4
  store float %54, float* @main__guidvel_w, align 4
  %55 = load float, float* @major_cycle__effectivegravity, align 4
  store float %55, float* @main__effectivegravity, align 4
  %56 = load float, float* @major_cycle__stage_time, align 4
  store float %56, float* @main__stage_time, align 4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast ([5 x float]* @main__brate to i8*), i8* bitcast ([5 x float]* @major_cycle__brate to i8*), i64 20, i32 4, i1 false)
  ret void
}

; Function Attrs: uwtable
define void @major_cycle__stage2_initialise() local_unnamed_addr #0 align 2 {
entry:
  store float 0.000000e+00, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__brate, i64 0, i64 0), align 4
  store float 0.000000e+00, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__brate, i64 0, i64 1), align 4
  store float 0.000000e+00, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__brate, i64 0, i64 2), align 4
  store float 1.600000e+02, float* @major_cycle__ttg_prev, align 4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast ([5 x float]* @major_cycle__majorprev_q to i8*), i8* bitcast ([5 x float]* @main__qc to i8*), i64 20, i32 4, i1 false)
  ret void
}

; Function Attrs: uwtable
define void @major_cycle__computation1([5 x float]* %pos, [5 x float]* %targetdircos) local_unnamed_addr #0 align 2 {
entry:
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
  %11 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__dircos, i64 0, i64 0), align 4
  %12 = fsub float -0.000000e+00, %11
  store float %12, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__dircos, i64 0, i64 0), align 4
  %13 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__dircos, i64 0, i64 1), align 4
  %14 = fsub float -0.000000e+00, %13
  store float %14, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__dircos, i64 0, i64 1), align 4
  %15 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__dircos, i64 0, i64 2), align 4
  %16 = fsub float -0.000000e+00, %15
  store float %16, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__dircos, i64 0, i64 2), align 4
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: inlinehint uwtable
define void @math__Tf32array25by4BIP(i64 %_init.0, i64 %_init.1) unnamed_addr #3 align 2 {
entry:
  ret void
}

; Function Attrs: inlinehint uwtable
define void @math__Tf32array1by3BIP(i64 %_init.0, i64 %_init.1) unnamed_addr #3 align 2 {
entry:
  ret void
}

; Function Attrs: inlinehint uwtable
define void @math__Tarray3by3BIP(i64 %_init.0, i64 %_init.1) unnamed_addr #3 align 2 {
entry:
  ret void
}

; Function Attrs: inlinehint uwtable
define void @math__TquaternionBIP(i64 %_init.0, i64 %_init.1) unnamed_addr #3 align 2 {
entry:
  ret void
}

; Function Attrs: uwtable
define float @math__dotproduct([5 x float]* %vec1, [5 x float]* %vec2) unnamed_addr #0 align 2 {
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

attributes #0 = { uwtable "no-frame-pointer-elim-non-leaf"="true" }
attributes #1 = { noreturn }
attributes #2 = { argmemonly nounwind }
attributes #3 = { inlinehint uwtable "no-frame-pointer-elim-non-leaf"="true" }

!llvm.module.flags = !{!0}

!0 = !{i32 7, !"PIE Level", i32 2}
