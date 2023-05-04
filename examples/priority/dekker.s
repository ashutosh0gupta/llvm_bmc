; ModuleID = './Examples/test/test-dekker/dekker.adb'
source_filename = "./Examples/test/test-dekker/dekker.adb"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64--linux-gnu"

module asm "\09.ident\09\22GCC: (Ubuntu 8.4.0-1ubuntu1~18.04) 8.4.0 LLVM: 6.0.0\22"

@dekker_E = unnamed_addr global i16 0
@dekker__wants_to_enter0 = internal unnamed_addr global i16 0
@dekker__wants_to_enter1 = internal unnamed_addr global i16 0
@dekker__turn = internal unnamed_addr global i16 0
@dekker__var = internal unnamed_addr global i16 0
@.cst = private local_unnamed_addr constant [11 x i8] c"dekker.adb\00", align 8

; Function Attrs: uwtable
define void @dekker__thread0() unnamed_addr #0 align 2 {
entry:
  store i16 1, i16* @dekker__wants_to_enter0, align 2
  br label %"3"

"3":                                              ; preds = %"10", %entry
  %0 = load i16, i16* @dekker__wants_to_enter1, align 2
  %1 = icmp ne i16 %0, 0
  br i1 %1, label %"4", label %"11"

"4":                                              ; preds = %"3"
  %2 = load i16, i16* @dekker__turn, align 2
  %3 = icmp ne i16 %2, 0
  br i1 %3, label %"5", label %"10"

"5":                                              ; preds = %"4"
  store i16 0, i16* @dekker__wants_to_enter0, align 2
  br label %"6"

"6":                                              ; preds = %"8", %"5"
  %4 = load i16, i16* @dekker__turn, align 2
  %5 = icmp ne i16 %4, 0
  br i1 %5, label %"8", label %"9"

"8":                                              ; preds = %"6"
  br label %"6"

"9":                                              ; preds = %"6"
  store i16 1, i16* @dekker__wants_to_enter0, align 2
  br label %"10"

"10":                                             ; preds = %"9", %"4"
  br label %"3"

"11":                                             ; preds = %"3"
  %6 = load i16, i16* @dekker__var, align 2
  %7 = icmp eq i16 %6, 32767
  br i1 %7, label %"12", label %"13"

"12":                                             ; preds = %"11"
  call void @__gnat_rcheck_CE_Overflow_Check(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.cst, i64 0, i64 0), i32 24) #1
  unreachable

"13":                                             ; preds = %"11"
  %8 = add nsw i16 %6, 1
  store i16 %8, i16* @dekker__var, align 2
  store i16 1, i16* @dekker__turn, align 2
  store i16 0, i16* @dekker__wants_to_enter0, align 2
  ret void
}

; Function Attrs: noreturn
declare void @__gnat_rcheck_CE_Overflow_Check(i8*, i32) #1

; Function Attrs: uwtable
define void @dekker__thread1() unnamed_addr #0 align 2 {
entry:
  store i16 1, i16* @dekker__wants_to_enter1, align 2
  br label %"3"

"3":                                              ; preds = %"10", %entry
  %0 = load i16, i16* @dekker__wants_to_enter0, align 2
  %1 = icmp ne i16 %0, 0
  br i1 %1, label %"4", label %"11"

"4":                                              ; preds = %"3"
  %2 = load i16, i16* @dekker__turn, align 2
  %3 = icmp ne i16 %2, 1
  br i1 %3, label %"5", label %"10"

"5":                                              ; preds = %"4"
  store i16 0, i16* @dekker__wants_to_enter1, align 2
  br label %"6"

"6":                                              ; preds = %"8", %"5"
  %4 = load i16, i16* @dekker__turn, align 2
  %5 = icmp ne i16 %4, 1
  br i1 %5, label %"8", label %"9"

"8":                                              ; preds = %"6"
  br label %"6"

"9":                                              ; preds = %"6"
  store i16 1, i16* @dekker__wants_to_enter1, align 2
  br label %"10"

"10":                                             ; preds = %"9", %"4"
  br label %"3"

"11":                                             ; preds = %"3"
  %6 = load i16, i16* @dekker__var, align 2
  %7 = icmp eq i16 %6, 32767
  br i1 %7, label %"12", label %"13"

"12":                                             ; preds = %"11"
  call void @__gnat_rcheck_CE_Overflow_Check(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.cst, i64 0, i64 0), i32 48) #1
  unreachable

"13":                                             ; preds = %"11"
  %8 = add nsw i16 %6, 1
  store i16 %8, i16* @dekker__var, align 2
  store i16 0, i16* @dekker__turn, align 2
  store i16 0, i16* @dekker__wants_to_enter1, align 2
  ret void
}

attributes #0 = { uwtable "no-frame-pointer-elim-non-leaf"="true" }
attributes #1 = { noreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 7, !"PIE Level", i32 2}
