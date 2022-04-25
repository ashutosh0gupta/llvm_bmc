; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64--linux-gnu"

module asm "\09.ident\09\22GCC: (Ubuntu 8.4.0-1ubuntu1~18.04) 8.4.0 LLVM: 6.0.0\22"
module asm ""
module asm "\09.ident\09\22GCC: (Ubuntu 8.4.0-1ubuntu1~18.04) 8.4.0 LLVM: 6.0.0\22"
module asm ""
module asm "\09.ident\09\22GCC: (Ubuntu 8.4.0-1ubuntu1~18.04) 8.4.0 LLVM: 6.0.0\22"

@main__cyclecount = global i32 undef
@main__outflag = unnamed_addr global i16 17
@main__minorinmajor = global i16 1
@main__offstage2 = global i16 0
@main__step12 = unnamed_addr global i16 0
@main__step11 = unnamed_addr global i16 0
@main__step10 = unnamed_addr global i16 0
@main__step8 = global i16 0
@main__step7 = unnamed_addr global i16 0
@main__step6 = unnamed_addr global i16 0
@main__step5 = unnamed_addr global i16 0
@main__step4 = unnamed_addr global i16 0
@main__step2 = unnamed_addr global i16 0
@main__stage3_start = unnamed_addr global float undef
@main__stage2_start = unnamed_addr global float undef
@main__liftoff = unnamed_addr global float undef
@main__time = unnamed_addr global float undef
@main__combinederrorflag = unnamed_addr global i16 0
@main__outflag2 = unnamed_addr global i16 0
@main__guidoutflagc = unnamed_addr global i16 -1
@main__guidoutflag = unnamed_addr global i16 0
@main__stageflgc = global i16 undef
@main__stageflg = global i16 undef
@main__altitudeinfo = global float undef
@main_E = unnamed_addr global i16 0
@.cst = private local_unnamed_addr constant [9 x i8] c"main.adb\00", align 8
@minor_cycle__firstcycle_stage2 = unnamed_addr global i16 1
@minor_cycle__offstage2 = unnamed_addr global i16 0
@minor_cycle_E = unnamed_addr global i16 0

; Function Attrs: uwtable
define void @_ada_mnguidancedriver() unnamed_addr #0 align 2 {
entry:
  store i16 1, i16* @main__minorinmajor, align 2
  store i16 0, i16* @main__stageflg, align 2
  store i16 -1, i16* @main__stageflgc, align 2
  store i32 1, i32* @main__cyclecount, align 4
  store float 2.800000e+03, float* @main__altitudeinfo, align 4
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
  br i1 %3, label %"3", label %"65"

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
  %9 = load i16, i16* @main__stageflg, align 2
  %10 = icmp eq i16 %9, 102
  br i1 %10, label %"38", label %"7"

"7":                                              ; preds = %"6"
  %11 = icmp ugt i16 %9, 102
  br i1 %11, label %"14", label %"8"

"8":                                              ; preds = %"7"
  %12 = icmp eq i16 %9, 51
  br i1 %12, label %"27", label %"9"

"9":                                              ; preds = %"8"
  %13 = icmp ugt i16 %9, 51
  br i1 %13, label %"12", label %"10"

"10":                                             ; preds = %"9"
  switch i16 %9, label %return [
    i16 17, label %"21"
    i16 34, label %"24"
  ]

"12":                                             ; preds = %"9"
  switch i16 %9, label %return [
    i16 68, label %"30"
    i16 85, label %"34"
  ]

"14":                                             ; preds = %"7"
  %14 = icmp eq i16 %9, 153
  br i1 %14, label %"48", label %"15"

"15":                                             ; preds = %"14"
  %15 = icmp ugt i16 %9, 153
  br i1 %15, label %"18", label %"16"

"16":                                             ; preds = %"15"
  switch i16 %9, label %return [
    i16 119, label %"42"
    i16 136, label %"45"
  ]

"18":                                             ; preds = %"15"
  switch i16 %9, label %return [
    i16 187, label %"55"
    i16 204, label %"59"
    i16 170, label %"51"
  ]

"21":                                             ; preds = %"10"
  %16 = load i16, i16* @main__outflag, align 2
  %17 = icmp eq i16 %16, 17
  br i1 %17, label %"22", label %return

"22":                                             ; preds = %"21"
  store float %8, float* @main__liftoff, align 4
  store i16 34, i16* @main__outflag, align 2
  br label %return

"24":                                             ; preds = %"10"
  %18 = load i16, i16* @main__outflag, align 2
  %19 = icmp eq i16 %18, 34
  br i1 %19, label %"25", label %return

"25":                                             ; preds = %"24"
  store i16 1, i16* @main__step2, align 2
  store i16 51, i16* @main__outflag, align 2
  br label %return

"27":                                             ; preds = %"8"
  %20 = load i16, i16* @main__outflag, align 2
  %21 = icmp eq i16 %20, 51
  br i1 %21, label %"28", label %return

"28":                                             ; preds = %"27"
  store float %8, float* @main__stage2_start, align 4
  store i16 68, i16* @main__outflag, align 2
  br label %return

"30":                                             ; preds = %"12"
  %22 = load i16, i16* @main__outflag, align 2
  %23 = icmp eq i16 %22, 68
  %24 = load i16, i16* @main__minorinmajor, align 2
  %25 = icmp eq i16 %24, 1
  %or.cond = and i1 %23, %25
  br i1 %or.cond, label %"32", label %return

"32":                                             ; preds = %"30"
  store i16 1, i16* @main__step4, align 2
  store i16 85, i16* @main__outflag, align 2
  br label %return

"34":                                             ; preds = %"12"
  %26 = load i16, i16* @main__outflag, align 2
  %27 = icmp eq i16 %26, 85
  %28 = load i16, i16* @main__minorinmajor, align 2
  %29 = icmp eq i16 %28, 1
  %or.cond3 = and i1 %27, %29
  br i1 %or.cond3, label %"36", label %return

"36":                                             ; preds = %"34"
  store i16 1, i16* @main__step5, align 2
  store i16 102, i16* @main__outflag, align 2
  br label %return

"38":                                             ; preds = %"6"
  %30 = load i16, i16* @main__outflag, align 2
  %31 = icmp eq i16 %30, 102
  %32 = load i16, i16* @main__minorinmajor, align 2
  %33 = icmp eq i16 %32, 1
  %or.cond5 = and i1 %31, %33
  br i1 %or.cond5, label %"40", label %return

"40":                                             ; preds = %"38"
  store i16 1, i16* @main__step6, align 2
  store i16 119, i16* @main__outflag, align 2
  br label %return

"42":                                             ; preds = %"16"
  %34 = load i16, i16* @main__outflag, align 2
  %35 = icmp eq i16 %34, 119
  br i1 %35, label %"43", label %return

"43":                                             ; preds = %"42"
  store i16 1, i16* @main__step7, align 2
  store i16 136, i16* @main__outflag, align 2
  br label %return

"45":                                             ; preds = %"16"
  %36 = load i16, i16* @main__outflag, align 2
  %37 = icmp eq i16 %36, 136
  br i1 %37, label %"46", label %return

"46":                                             ; preds = %"45"
  store i16 1, i16* @main__step8, align 2
  store i16 153, i16* @main__outflag, align 2
  br label %return

"48":                                             ; preds = %"14"
  %38 = load i16, i16* @main__outflag, align 2
  %39 = icmp eq i16 %38, 153
  br i1 %39, label %"49", label %return

"49":                                             ; preds = %"48"
  store float %8, float* @main__stage3_start, align 4
  store i16 170, i16* @main__outflag, align 2
  br label %return

"51":                                             ; preds = %"18"
  %40 = load i16, i16* @main__outflag, align 2
  %41 = icmp eq i16 %40, 170
  %42 = load i16, i16* @main__minorinmajor, align 2
  %43 = icmp eq i16 %42, 1
  %or.cond7 = and i1 %41, %43
  br i1 %or.cond7, label %"53", label %return

"53":                                             ; preds = %"51"
  store i16 1, i16* @main__step10, align 2
  store i16 187, i16* @main__outflag, align 2
  br label %return

"55":                                             ; preds = %"18"
  %44 = load i16, i16* @main__outflag, align 2
  %45 = icmp eq i16 %44, 187
  %46 = load i16, i16* @main__minorinmajor, align 2
  %47 = icmp eq i16 %46, 1
  %or.cond9 = and i1 %45, %47
  br i1 %or.cond9, label %"57", label %return

"57":                                             ; preds = %"55"
  store i16 1, i16* @main__step11, align 2
  store i16 204, i16* @main__outflag, align 2
  br label %return

"59":                                             ; preds = %"18"
  %48 = load i16, i16* @main__outflag, align 2
  %49 = icmp eq i16 %48, 204
  br i1 %49, label %"60", label %return

"60":                                             ; preds = %"59"
  store i16 1, i16* @main__step12, align 2
  store i16 221, i16* @main__outflag, align 2
  br label %return

"65":                                             ; preds = %entry
  store i16 1, i16* @main__combinederrorflag, align 2
  br label %return

return:                                           ; preds = %"65", %"60", %"59", %"57", %"55", %"53", %"51", %"49", %"48", %"46", %"45", %"43", %"42", %"40", %"38", %"36", %"34", %"32", %"30", %"28", %"27", %"25", %"24", %"22", %"21", %"18", %"16", %"12", %"10"
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
  %0 = load i16, i16* @main__step2, align 2
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
define void @minor_cycle__stage2_minor() #0 align 2 {
entry:
  %0 = load i16, i16* @minor_cycle__firstcycle_stage2, align 2
  %1 = icmp eq i16 %0, 1
  br i1 %1, label %"3", label %"5"

"3":                                              ; preds = %entry
  %2 = load i32, i32* @main__cyclecount, align 4
  %3 = icmp eq i32 %2, 25
  br i1 %3, label %"4", label %return

"4":                                              ; preds = %"3"
  store i16 0, i16* @minor_cycle__firstcycle_stage2, align 2
  br label %return

"5":                                              ; preds = %entry
  %4 = load i16, i16* @main__step8, align 2
  %5 = icmp eq i16 %4, 0
  %6 = load i16, i16* @minor_cycle__offstage2, align 2
  %7 = icmp eq i16 %6, 0
  %or.cond = and i1 %5, %7
  br i1 %or.cond, label %"7", label %return

"7":                                              ; preds = %"5"
  store i16 1, i16* @minor_cycle__offstage2, align 2
  store i16 1, i16* @main__offstage2, align 2
  br label %return

return:                                           ; preds = %"7", %"5", %"4", %"3"
  ret void
}

attributes #0 = { uwtable "no-frame-pointer-elim-non-leaf"="true" }
attributes #1 = { noreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 7, !"PIE Level", i32 2}
