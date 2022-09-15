; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64--linux-gnu"

module asm "\09.ident\09\22GCC: (Ubuntu 8.4.0-1ubuntu1~18.04) 8.4.0 LLVM: 6.0.0\22"
module asm ""
module asm "\09.ident\09\22GCC: (Ubuntu 8.4.0-1ubuntu1~18.04) 8.4.0 LLVM: 6.0.0\22"
module asm ""
module asm "\09.ident\09\22GCC: (Ubuntu 8.4.0-1ubuntu1~18.04) 8.4.0 LLVM: 6.0.0\22"

@main__step1 = global i16 1
@main__posz = global float undef
@main__posy = global float undef
@main__posx = global float undef
@main__time = unnamed_addr global float undef
@main__combinederrorflag = unnamed_addr global i16 0
@main__cyclecount = unnamed_addr global i32 1
@main__stageflgc = unnamed_addr global i16 -1
@main__stageflg = unnamed_addr global i16 0
@main_E = unnamed_addr global i16 0
@.cst = private local_unnamed_addr constant [9 x i8] c"main.adb\00", align 8
@major_cycle__test_maj = global i16 0
@major_cycle__position = unnamed_addr global [5 x float] undef, align 16
@major_cycle_E = unnamed_addr global i16 0
@minor_cycle__test_min = unnamed_addr global i16 1
@minor_cycle__offstage3 = global i16 0
@minor_cycle_E = unnamed_addr global i16 0

; Function Attrs: uwtable
define void @main__stageflags() local_unnamed_addr #0 align 2 {
entry:
  %0 = load i16, i16* @main__stageflg, align 2
  %1 = load i16, i16* @main__stageflgc, align 2
  %2 = add i16 %0, %1
  %3 = icmp eq i16 %2, -1
  br i1 %3, label %"3", label %"7"

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
  store i16 0, i16* @main__step1, align 2
  br label %return

"7":                                              ; preds = %entry
  store i16 1, i16* @main__combinederrorflag, align 2
  br label %return

return:                                           ; preds = %"7", %"6"
  ret void
}

; Function Attrs: noreturn
declare void @__gnat_rcheck_CE_Range_Check(i8*, i32) #1

; Function Attrs: uwtable
define void @main__guid_minor() unnamed_addr #0 align 2 {
entry:
  call void @main__stageflags() #0
  %0 = load i16, i16* @main__step1, align 2
  %1 = icmp eq i16 %0, 1
  br i1 %1, label %return, label %"5"

"5":                                              ; preds = %entry
  call void @minor_cycle__stage3_minor()
  br label %return

return:                                           ; preds = %"5", %entry
  ret void
}

; Function Attrs: uwtable
define void @main__guid_major() unnamed_addr #0 align 2 {
entry:
  %0 = load i16, i16* @main__step1, align 2
  %1 = icmp eq i16 %0, 1
  br i1 %1, label %return, label %"5"

"5":                                              ; preds = %entry
  call void @major_cycle__stage3_major()
  br label %return

return:                                           ; preds = %"5", %entry
  ret void
}

; Function Attrs: inlinehint uwtable
define void @major_cycle__Tf32array1by3BIP(i64 %_init.0, i64 %_init.1) unnamed_addr #2 align 2 {
entry:
  ret void
}

; Function Attrs: uwtable
define void @major_cycle__stage3_major() #0 align 2 {
entry:
  %0 = load i16, i16* @main__step1, align 2
  %1 = icmp eq i16 %0, 0
  br i1 %1, label %"3", label %"4"

"3":                                              ; preds = %entry
  %2 = load float, float* @main__posx, align 4
  store float %2, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__position, i64 0, i64 0), align 4
  %3 = load float, float* @main__posy, align 4
  store float %3, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__position, i64 0, i64 1), align 4
  %4 = load float, float* @main__posz, align 4
  store float %4, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__position, i64 0, i64 2), align 4
  br label %"4"

"4":                                              ; preds = %"3", %entry
  %5 = load i16, i16* @minor_cycle__offstage3, align 2
  %6 = icmp eq i16 %5, 1
  br i1 %6, label %"5", label %return

"5":                                              ; preds = %"4"
  store i16 1, i16* @major_cycle__test_maj, align 2
  br label %return

return:                                           ; preds = %"5", %"4"
  ret void
}

; Function Attrs: uwtable
define void @minor_cycle__stage3_minor() #0 align 2 {
entry:
  %0 = load i16, i16* @main__step1, align 2
  %1 = icmp eq i16 %0, 0
  br i1 %1, label %"3", label %"4"

"3":                                              ; preds = %entry
  store i16 1, i16* @minor_cycle__offstage3, align 2
  br label %"4"

"4":                                              ; preds = %"3", %entry
  %2 = load i16, i16* @major_cycle__test_maj, align 2
  %3 = icmp eq i16 %2, 1
  br i1 %3, label %"5", label %return

"5":                                              ; preds = %"4"
  store i16 20, i16* @minor_cycle__test_min, align 2
  br label %return

return:                                           ; preds = %"5", %"4"
  ret void
}

attributes #0 = { uwtable "no-frame-pointer-elim-non-leaf"="true" }
attributes #1 = { noreturn }
attributes #2 = { inlinehint uwtable "no-frame-pointer-elim-non-leaf"="true" }

!llvm.module.flags = !{!0}

!0 = !{i32 7, !"PIE Level", i32 2}
