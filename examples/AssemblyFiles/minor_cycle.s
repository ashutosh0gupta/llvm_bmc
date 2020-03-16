; ModuleID = '../Test/Examples/minor_cycle.adb'
source_filename = "../Test/Examples/minor_cycle.adb"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64--linux-gnu"

module asm "\09.ident\09\22GCC: (Ubuntu 8.3.0-26ubuntu1~18.04) 8.3.0 LLVM: 6.0.0\22"

@minor_cycle__firstcycle_mnvre = unnamed_addr global i16 undef
@minor_cycle__q_minor = unnamed_addr global [25 x [5 x float]] undef, align 32
@minor_cycle__velocityincrmn = unnamed_addr global float undef
@minor_cycle__velocitycoeff = unnamed_addr global float undef
@minor_cycle__firstcycle_stage3 = unnamed_addr global i16 undef
@minor_cycle__firstcycle_stage2 = unnamed_addr global i16 undef
@minor_cycle__firstcycle_stage1 = unnamed_addr global i16 undef
@minor_cycle__minorflag_stage3 = unnamed_addr global i16 undef
@minor_cycle__minorflag_stage2 = unnamed_addr global i16 undef
@minor_cycle__offstage3 = unnamed_addr global i16 undef
@minor_cycle__offstage2 = unnamed_addr global i16 undef
@minor_cycle_E = unnamed_addr global i16 0
@main__qc = external global [5 x float]
@lookup__quaternion_prev = external global [5 x float]
@main__step2 = external global i16
@main__altitudeinfo = external global float
@main__cyclecount = external global i32
@main__step8 = external global i16
@major_cycle__velflag = external global i16
@major_cycle__velocityincrmn = external global float
@major_cycle__velocitycoeff = external global float
@major_cycle__minorflag_stage2 = external global i16
@major_cycle__q_minor = external global [25 x [5 x float]]
@main__offstage2 = external global i16
@main__step12 = external global i16
@major_cycle__minorflag_stage3 = external global i16
@main__apogee = external global float
@main__offstage3 = external global i16
@.cst = private local_unnamed_addr constant [16 x i8] c"minor_cycle.adb\00", align 8
@minor_cycle__prevcycle_q = internal unnamed_addr global [5 x float] undef, align 16

; Function Attrs: uwtable
define void @minor_cycle__stage1_minor() unnamed_addr #0 align 2 personality i8* bitcast (void ()* @minor_cycle__stage1_minor to i8*) {
entry:
  %localq = alloca [5 x float]
  %0 = bitcast [5 x float]* %localq to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([5 x float]* @main__qc to i8*), i64 20, i32 4, i1 false)
  %1 = load i16, i16* @minor_cycle__firstcycle_stage1, align 2
  %2 = icmp eq i16 %1, 1
  br i1 %2, label %"3", label %"5"

"3":                                              ; preds = %entry
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast ([5 x float]* @lookup__quaternion_prev to i8*), i8* %0, i64 20, i32 4, i1 false)
  store i16 0, i16* @minor_cycle__firstcycle_stage1, align 2
  invoke void @main__firstinit()
          to label %"5" unwind label %"10"

"5":                                              ; preds = %"3", %entry
  %3 = load i16, i16* @main__step2, align 2
  %4 = icmp eq i16 %3, 1
  br i1 %4, label %"6", label %"8"

"6":                                              ; preds = %"5"
  %5 = load float, float* @main__altitudeinfo, align 4
  invoke void @lookup__output_lookup(float %5, [5 x float]* %localq)
          to label %"8" unwind label %"10"

"8":                                              ; preds = %"6", %"5"
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast ([5 x float]* @main__qc to i8*), i8* %0, i64 20, i32 4, i1 false)
  call void @llvm.lifetime.end.p0i8(i64 20, i8* %0)
  ret void

"10":                                             ; preds = %"6", %"3"
  %exc = landingpad { i8*, i32 }
          cleanup
  %exc_ptr1 = extractvalue { i8*, i32 } %exc, 0
  %filter2 = extractvalue { i8*, i32 } %exc, 1
  call void @llvm.lifetime.end.p0i8(i64 20, i8* %0)
  resume { i8*, i32 } %exc
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #1

declare void @main__firstinit()

declare void @lookup__output_lookup(float, [5 x float]*)

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: uwtable
define void @minor_cycle__stage2_minor() unnamed_addr #0 align 2 {
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
  %8 = load i32, i32* @main__cyclecount, align 4
  %9 = icmp eq i32 %8, 1
  br i1 %9, label %"8", label %"11"

"8":                                              ; preds = %"7"
  %10 = load i16, i16* @major_cycle__velflag, align 2
  %11 = icmp eq i16 %10, 1
  br i1 %11, label %"9", label %"10"

"9":                                              ; preds = %"8"
  %12 = load float, float* @major_cycle__velocityincrmn, align 4
  store float %12, float* @minor_cycle__velocityincrmn, align 4
  %13 = load float, float* @major_cycle__velocitycoeff, align 4
  store float %13, float* @minor_cycle__velocitycoeff, align 4
  br label %"10"

"10":                                             ; preds = %"9", %"8"
  %14 = load i16, i16* @major_cycle__minorflag_stage2, align 2
  store i16 %14, i16* @minor_cycle__minorflag_stage2, align 2
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast ([25 x [5 x float]]* @minor_cycle__q_minor to i8*), i8* bitcast ([25 x [5 x float]]* @major_cycle__q_minor to i8*), i64 500, i32 4, i1 false)
  br label %"11"

"11":                                             ; preds = %"10", %"7"
  call void @minor_cycle__post_output()
  %15 = load i16, i16* @minor_cycle__minorflag_stage2, align 2
  %16 = icmp eq i16 %15, 1
  br i1 %16, label %"12", label %return

"12":                                             ; preds = %"11"
  %17 = load i32, i32* @main__cyclecount, align 4
  %18 = icmp ugt i32 %17, 1
  br i1 %18, label %"13", label %"14"

"13":                                             ; preds = %"12"
  %19 = load float, float* @minor_cycle__velocitycoeff, align 4
  %20 = load float, float* @minor_cycle__velocityincrmn, align 4
  %21 = fadd float %19, %20
  store float %21, float* @minor_cycle__velocitycoeff, align 4
  br label %"14"

"14":                                             ; preds = %"13", %"12"
  %22 = load float, float* @minor_cycle__velocitycoeff, align 4
  %23 = fcmp ogt float %22, 5.236000e+03
  br i1 %23, label %"15", label %return

"15":                                             ; preds = %"14"
  store i16 1, i16* @minor_cycle__offstage2, align 2
  store i16 1, i16* @main__offstage2, align 2
  br label %return

return:                                           ; preds = %"15", %"14", %"11", %"5", %"4", %"3"
  ret void
}

; Function Attrs: uwtable
define void @minor_cycle__post_output() local_unnamed_addr #0 align 2 {
entry:
  %0 = load i32, i32* @main__cyclecount, align 4
  %1 = icmp ugt i32 %0, 32767
  br i1 %1, label %"3", label %"4"

"3":                                              ; preds = %entry
  call void @__gnat_rcheck_CE_Range_Check(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.cst, i64 0, i64 0), i32 134) #2
  unreachable

"4":                                              ; preds = %entry
  %2 = trunc i32 %0 to i16
  br label %"5"

"5":                                              ; preds = %"9", %"4"
  %3 = phi i16 [ %16, %"9" ], [ 1, %"4" ]
  %4 = icmp sle i16 %3, 4
  br i1 %4, label %"6", label %"10"

"6":                                              ; preds = %"5"
  %5 = icmp sle i16 %2, 0
  %6 = icmp sgt i16 %2, 25
  %or.cond = or i1 %5, %6
  br i1 %or.cond, label %"8", label %"9"

"8":                                              ; preds = %"6"
  call void @__gnat_rcheck_CE_Index_Check(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.cst, i64 0, i64 0), i32 137) #2
  unreachable

"9":                                              ; preds = %"6"
  %7 = sext i16 %2 to i64
  %8 = sext i16 %3 to i64
  %9 = sub i64 %8, 1
  %10 = sub i64 %7, 1
  %11 = getelementptr inbounds [5 x float], [5 x float]* getelementptr inbounds ([25 x [5 x float]], [25 x [5 x float]]* @minor_cycle__q_minor, i64 0, i64 0), i64 %10
  %12 = bitcast [5 x float]* %11 to float*
  %13 = getelementptr inbounds float, float* %12, i64 %9
  %14 = load float, float* %13, align 4
  %15 = getelementptr inbounds float, float* getelementptr inbounds ([5 x float], [5 x float]* @minor_cycle__prevcycle_q, i64 0, i64 0), i64 %9
  store float %14, float* %15, align 4
  %16 = add nsw i16 %3, 1
  br label %"5"

"10":                                             ; preds = %"5"
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast ([5 x float]* @main__qc to i8*), i8* bitcast ([5 x float]* @minor_cycle__prevcycle_q to i8*), i64 20, i32 4, i1 false)
  ret void
}

; Function Attrs: uwtable
define void @minor_cycle__stage3_minor() unnamed_addr #0 align 2 {
entry:
  %0 = load i16, i16* @minor_cycle__firstcycle_stage3, align 2
  %1 = icmp eq i16 %0, 1
  br i1 %1, label %"3", label %"5"

"3":                                              ; preds = %entry
  %2 = load i32, i32* @main__cyclecount, align 4
  %3 = icmp eq i32 %2, 25
  br i1 %3, label %"4", label %return

"4":                                              ; preds = %"3"
  store i16 0, i16* @minor_cycle__firstcycle_stage3, align 2
  br label %return

"5":                                              ; preds = %entry
  %4 = load i16, i16* @main__step12, align 2
  %5 = icmp eq i16 %4, 0
  %6 = load i16, i16* @minor_cycle__offstage3, align 2
  %7 = icmp eq i16 %6, 0
  %or.cond = and i1 %5, %7
  br i1 %or.cond, label %"7", label %return

"7":                                              ; preds = %"5"
  %8 = load i32, i32* @main__cyclecount, align 4
  %9 = icmp eq i32 %8, 1
  br i1 %9, label %"8", label %"9"

"8":                                              ; preds = %"7"
  %10 = load i16, i16* @major_cycle__minorflag_stage3, align 2
  store i16 %10, i16* @minor_cycle__minorflag_stage3, align 2
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast ([25 x [5 x float]]* @minor_cycle__q_minor to i8*), i8* bitcast ([25 x [5 x float]]* @major_cycle__q_minor to i8*), i64 500, i32 4, i1 false)
  br label %"9"

"9":                                              ; preds = %"8", %"7"
  call void @minor_cycle__post_output()
  %11 = load i16, i16* @minor_cycle__minorflag_stage3, align 2
  %12 = icmp eq i16 %11, 1
  %13 = load float, float* @main__apogee, align 4
  %14 = fcmp ogt float %13, 0x417E102200000000
  %or.cond3 = and i1 %12, %14
  br i1 %or.cond3, label %"11", label %return

"11":                                             ; preds = %"9"
  store i16 1, i16* @minor_cycle__offstage3, align 2
  store i16 1, i16* @main__offstage3, align 2
  br label %return

return:                                           ; preds = %"11", %"9", %"5", %"4", %"3"
  ret void
}

; Function Attrs: uwtable
define void @minor_cycle__manoeuvre() unnamed_addr #0 align 2 {
entry:
  %0 = load i16, i16* @minor_cycle__firstcycle_mnvre, align 2
  %1 = icmp eq i16 %0, 0
  %2 = load i32, i32* @main__cyclecount, align 4
  br i1 %1, label %"3", label %"5"

"3":                                              ; preds = %entry
  %3 = icmp eq i32 %2, 25
  br i1 %3, label %"4", label %return

"4":                                              ; preds = %"3"
  store i16 1, i16* @minor_cycle__firstcycle_mnvre, align 2
  br label %return

"5":                                              ; preds = %entry
  %4 = icmp eq i32 %2, 1
  br i1 %4, label %"6", label %"7"

"6":                                              ; preds = %"5"
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast ([25 x [5 x float]]* @minor_cycle__q_minor to i8*), i8* bitcast ([25 x [5 x float]]* @major_cycle__q_minor to i8*), i64 500, i32 4, i1 false)
  br label %"7"

"7":                                              ; preds = %"6", %"5"
  call void @minor_cycle__post_output()
  br label %return

return:                                           ; preds = %"7", %"4", %"3"
  ret void
}

; Function Attrs: noreturn
declare void @__gnat_rcheck_CE_Range_Check(i8*, i32) #2

; Function Attrs: noreturn
declare void @__gnat_rcheck_CE_Index_Check(i8*, i32) #2

attributes #0 = { uwtable "no-frame-pointer-elim-non-leaf"="true" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { noreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 7, !"PIE Level", i32 2}
