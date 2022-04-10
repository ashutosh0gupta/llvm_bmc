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
@main__outflag = unnamed_addr global i16 undef
@main__minorinmajor = global i16 undef
@main__step2 = unnamed_addr global i16 undef
@main__step1 = unnamed_addr global i16 undef
@main__time = unnamed_addr global float undef
@main__combinederrorflag = unnamed_addr global i16 undef
@main__stageflgc = global i16 undef
@main__stageflg = global i16 undef
@main_E = unnamed_addr global i16 0
@.cst = private local_unnamed_addr constant [9 x i8] c"main.adb\00", align 8
@minor_cycle__firstcycle_mnvre = global i16 undef
@minor_cycle__firstcycle = global i16 undef
@minor_cycle_E = unnamed_addr global i16 0

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
  br i1 %3, label %"3", label %"19"

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
  %9 = load i16, i16* @main__stageflg, align 2
  switch i16 %9, label %return [
    i16 17, label %"8"
    i16 34, label %"12"
  ]

"8":                                              ; preds = %"6"
  %10 = load i16, i16* @main__outflag, align 2
  %11 = icmp eq i16 %10, 17
  %12 = load i16, i16* @main__minorinmajor, align 2
  %13 = icmp eq i16 %12, 1
  %or.cond = and i1 %11, %13
  br i1 %or.cond, label %"10", label %return

"10":                                             ; preds = %"8"
  store i16 1, i16* @main__step1, align 2
  store i16 0, i16* @main__step2, align 2
  store i16 34, i16* @main__outflag, align 2
  br label %return

"12":                                             ; preds = %"6"
  %14 = load i16, i16* @main__outflag, align 2
  %15 = icmp eq i16 %14, 34
  %16 = load i16, i16* @main__minorinmajor, align 2
  %17 = icmp eq i16 %16, 1
  %or.cond3 = and i1 %15, %17
  br i1 %or.cond3, label %"14", label %return

"14":                                             ; preds = %"12"
  store i16 1, i16* @main__step2, align 2
  store i16 0, i16* @main__step1, align 2
  store i16 0, i16* @minor_cycle__firstcycle_mnvre, align 2
  store i16 17, i16* @main__outflag, align 2
  br label %return

"19":                                             ; preds = %entry
  store i16 1, i16* @main__combinederrorflag, align 2
  br label %return

return:                                           ; preds = %"19", %"14", %"12", %"10", %"8", %"6"
  ret void
}

; Function Attrs: noreturn
declare void @__gnat_rcheck_CE_Range_Check(i8*, i32) #1

; Function Attrs: uwtable
define void @main__guid_minor() #0 align 2 {
entry:
  call void @main__stageflags() #0
  %0 = load i16, i16* @main__step2, align 2
  %1 = icmp ne i16 %0, 1
  %2 = load i16, i16* @main__step1, align 2
  %3 = icmp eq i16 %2, 1
  %or.cond = and i1 %1, %3
  br i1 %or.cond, label %"6", label %return

"6":                                              ; preds = %entry
  call void @minor_cycle__manoeuvre()
  br label %return

return:                                           ; preds = %"6", %entry
  ret void
}

; Function Attrs: uwtable
define void @main__firstinit() #0 align 2 {
entry:
  store i16 1, i16* @main__minorinmajor, align 2
  store i16 1, i16* @minor_cycle__firstcycle, align 2
  store i16 17, i16* @main__outflag, align 2
  store i16 0, i16* @main__step1, align 2
  store i16 0, i16* @main__step2, align 2
  store i16 0, i16* @main__combinederrorflag, align 2
  store i16 0, i16* @minor_cycle__firstcycle_mnvre, align 2
  ret void
}

; Function Attrs: uwtable
define void @minor_cycle__manoeuvre() #0 align 2 {
entry:
  %0 = load i16, i16* @minor_cycle__firstcycle, align 2
  %1 = icmp eq i16 %0, 1
  br i1 %1, label %"3", label %"4"

"3":                                              ; preds = %entry
  store i16 0, i16* @minor_cycle__firstcycle, align 2
  call void @main__firstinit()
  br label %"4"

"4":                                              ; preds = %"3", %entry
  %2 = load i16, i16* @minor_cycle__firstcycle_mnvre, align 2
  %3 = icmp eq i16 %2, 0
  %4 = load i16, i16* @main__minorinmajor, align 2
  %5 = icmp eq i16 %4, 25
  %or.cond = and i1 %3, %5
  br i1 %or.cond, label %"6", label %return

"6":                                              ; preds = %"4"
  store i16 1, i16* @minor_cycle__firstcycle_mnvre, align 2
  br label %return

return:                                           ; preds = %"6", %"4"
  ret void
}

attributes #0 = { uwtable "no-frame-pointer-elim-non-leaf"="true" }
attributes #1 = { noreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 7, !"PIE Level", i32 2}
