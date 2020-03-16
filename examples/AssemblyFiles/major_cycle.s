; ModuleID = '../Test/Examples/major_cycle.adb'
source_filename = "../Test/Examples/major_cycle.adb"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64--linux-gnu"

module asm "\09.ident\09\22GCC: (Ubuntu 8.3.0-26ubuntu1~18.04) 8.3.0 LLVM: 6.0.0\22"

@major_cycle__duration = unnamed_addr global float undef
@major_cycle__desiredq = local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__ttg_prev = unnamed_addr global float undef
@major_cycle__ta = unnamed_addr global float undef
@major_cycle__tempres = local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__brate = local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__velocity = local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__guidvel = local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__dircos_v = local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__dircos_u = local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__variable_ta = local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__dircos = local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__position = local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__q_minor = unnamed_addr global [25 x [5 x float]] undef, align 32
@major_cycle__dotq = local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__majorprev_q = local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__temp1 = local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__distvelaxis = unnamed_addr global float undef
@major_cycle__templ = unnamed_addr global float undef
@major_cycle__velsqr = unnamed_addr global float undef
@major_cycle__angley = unnamed_addr global float undef
@major_cycle__angler = unnamed_addr global float undef
@major_cycle__total_time_stage3 = unnamed_addr global float undef
@major_cycle__total_time_stage2 = unnamed_addr global float undef
@major_cycle__tempt = unnamed_addr global float undef
@major_cycle__tempa = unnamed_addr global float undef
@major_cycle__tempp = unnamed_addr global float undef
@major_cycle__effectivegravity = unnamed_addr global float undef
@major_cycle__ttg = unnamed_addr global float undef
@major_cycle__stage_time = unnamed_addr global float undef
@major_cycle__instvelocityprev = unnamed_addr global float undef
@major_cycle__instvelocity = unnamed_addr global float undef
@major_cycle__velocityincrmj = unnamed_addr global float undef
@major_cycle__velocityincrmn = unnamed_addr global float undef
@major_cycle__velocitycoeff = unnamed_addr global float undef
@major_cycle__enterstage3 = unnamed_addr global i16 undef
@major_cycle__enterstage2 = unnamed_addr global i16 undef
@major_cycle__velflag = unnamed_addr global i16 undef
@major_cycle__minorflag_stage3 = unnamed_addr global i16 undef
@major_cycle__minorflag_stage2 = unnamed_addr global i16 undef
@major_cycle__event4 = unnamed_addr global i16 undef
@major_cycle_E = unnamed_addr global i16 0
@main__step8 = external global i16
@main__offstage2 = external global i16
@main__posx = external global float
@main__posy = external global float
@main__posz = external global float
@main__velu = external global float
@main__velv = external global float
@main__velw = external global float
@main__major_time = external global float
@main__stage2_start = external global float
@major_cycle__dircos_stage2 = internal local_unnamed_addr global [5 x float] undef, align 16
@main__angler = external global float
@main__angley = external global float
@main__minorflag_stage2 = external global i16
@main__ttg = external global float
@main__guidvel_u = external global float
@main__guidvel_v = external global float
@main__guidvel_w = external global float
@main__effectivegravity = external global float
@main__stage_time = external global float
@main__brate = external global [5 x float]
@main__step12 = external global i16
@main__offstage3 = external global i16
@main__stage3_start = external global float
@major_cycle__dircos_stage3 = internal local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__dircosperigeeline = internal local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__angle_to_cover = internal unnamed_addr global float undef
@major_cycle__hv_target = internal unnamed_addr global float undef
@algorithm__rd_target = external global float
@algorithm__hv_target = external global float
@algorithm__velocityradial = external global float
@main__minorflag_stage3 = external global i16
@algorithm__exhaustvel = external global float
@algorithm__timeconst = external global float
@main__qc = external global [5 x float]
@main__radialdist = external global float
@major_cycle__ratesbprev = internal unnamed_addr global [5 x float] undef, align 16
@.cst = private local_unnamed_addr constant [16 x i8] c"major_cycle.adb\00", align 8

; Function Attrs: uwtable
define void @major_cycle__stage2_major() unnamed_addr #0 align 2 {
entry:
  %0 = load i16, i16* @main__step8, align 2
  %1 = icmp eq i16 %0, 0
  %2 = load i16, i16* @main__offstage2, align 2
  %3 = icmp eq i16 %2, 0
  %or.cond = and i1 %1, %3
  br i1 %or.cond, label %"4", label %"5"

"4":                                              ; preds = %entry
  call void @major_cycle__constantq([5 x float]* @major_cycle__majorprev_q)
  br label %return

"5":                                              ; preds = %entry
  %4 = load i16, i16* @major_cycle__enterstage2, align 2
  %5 = icmp eq i16 %4, 1
  br i1 %5, label %"6", label %"7"

"6":                                              ; preds = %"5"
  call void @major_cycle__stage2_initialise()
  store i16 0, i16* @major_cycle__enterstage2, align 2
  br label %"7"

"7":                                              ; preds = %"6", %"5"
  %6 = load float, float* @main__posx, align 4
  store float %6, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__position, i64 0, i64 0), align 4
  %7 = load float, float* @main__posy, align 4
  store float %7, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__position, i64 0, i64 1), align 4
  %8 = load float, float* @main__posz, align 4
  store float %8, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__position, i64 0, i64 2), align 4
  %9 = load float, float* @main__velu, align 4
  store float %9, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__velocity, i64 0, i64 0), align 4
  %10 = load float, float* @main__velv, align 4
  store float %10, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__velocity, i64 0, i64 1), align 4
  %11 = load float, float* @main__velw, align 4
  store float %11, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__velocity, i64 0, i64 2), align 4
  %12 = load float, float* @main__major_time, align 4
  %13 = load float, float* @main__stage2_start, align 4
  %14 = fsub float %12, %13
  store float %14, float* @major_cycle__stage_time, align 4
  %15 = load i16, i16* @major_cycle__velflag, align 2
  %16 = icmp eq i16 %15, 1
  br i1 %16, label %"8", label %"9"

"8":                                              ; preds = %"7"
  %17 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__velocity, i64 0, i64 0), align 4
  %18 = fmul float %17, %17
  %19 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__velocity, i64 0, i64 1), align 4
  %20 = fmul float %19, %19
  %21 = fadd float %18, %20
  %22 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__velocity, i64 0, i64 2), align 4
  %23 = fmul float %22, %22
  %24 = fadd float %21, %23
  %25 = call float @library__squareroot(float %24)
  store float %25, float* @major_cycle__instvelocity, align 4
  %26 = load float, float* @major_cycle__instvelocityprev, align 4
  %27 = fsub float %25, %26
  store float %27, float* @major_cycle__velocityincrmj, align 4
  %28 = load float, float* @major_cycle__instvelocity, align 4
  %29 = fadd float %28, %27
  store float %29, float* @major_cycle__velocitycoeff, align 4
  %30 = load float, float* @major_cycle__velocityincrmj, align 4
  %31 = fdiv float %30, 2.500000e+01
  store float %31, float* @major_cycle__velocityincrmn, align 4
  %32 = load float, float* @major_cycle__instvelocity, align 4
  store float %32, float* @major_cycle__instvelocityprev, align 4
  br label %"10"

"9":                                              ; preds = %"7"
  store float 0.000000e+00, float* @major_cycle__velocityincrmn, align 4
  store float 0.000000e+00, float* @major_cycle__velocitycoeff, align 4
  br label %"10"

"10":                                             ; preds = %"9", %"8"
  %33 = load i16, i16* @major_cycle__minorflag_stage2, align 2
  %34 = icmp eq i16 %33, 1
  br i1 %34, label %"11", label %"12"

"11":                                             ; preds = %"10"
  call void @major_cycle__constantq([5 x float]* @major_cycle__majorprev_q)
  %35 = load float, float* @major_cycle__ttg, align 4
  %36 = fsub float %35, 5.000000e-01
  store float %36, float* @major_cycle__ttg, align 4
  br label %"21"

"12":                                             ; preds = %"10"
  call void @major_cycle__computation1([5 x float]* @major_cycle__position, [5 x float]* @major_cycle__dircos_stage2)
  %37 = call float @math__dotproduct([5 x float]* @major_cycle__dircos_u, [5 x float]* @major_cycle__velocity)
  store float %37, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 0), align 4
  %38 = call float @math__dotproduct([5 x float]* @major_cycle__dircos_v, [5 x float]* @major_cycle__velocity)
  store float %38, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 1), align 4
  %39 = call float @math__dotproduct([5 x float]* @major_cycle__dircos, [5 x float]* @major_cycle__velocity)
  store float %39, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 2), align 4
  %40 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 0), align 4
  %41 = fmul float %40, %40
  %42 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 1), align 4
  %43 = fmul float %42, %42
  %44 = fadd float %41, %43
  store float %44, float* @major_cycle__velsqr, align 4
  %45 = load float, float* @major_cycle__tempa, align 4
  %46 = fdiv float 0x42F6BCC420000000, %45
  %47 = fsub float %46, %44
  %48 = fdiv float %47, %45
  store float %48, float* @major_cycle__effectivegravity, align 4
  %49 = call float @math__dotproduct([5 x float]* @major_cycle__dircos_v, [5 x float]* @major_cycle__dircos_stage2)
  store float %49, float* @major_cycle__templ, align 4
  %50 = call float @math__dotproduct([5 x float]* @major_cycle__position, [5 x float]* @major_cycle__dircos_stage2)
  %51 = fsub float -0.000000e+00, %50
  store float %51, float* @major_cycle__distvelaxis, align 4
  %52 = load float, float* @major_cycle__templ, align 4
  %53 = fdiv float %51, %52
  store float %53, float* @major_cycle__distvelaxis, align 4
  %54 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 0), align 4
  %55 = load float, float* @major_cycle__tempa, align 4
  %56 = fdiv float 0x421BD4D6E0000000, %55
  %57 = fdiv float %56, 0x40A6D39480000000
  %58 = fsub float %54, %57
  %59 = call float @library__exponent(float %58)
  store float %59, float* @major_cycle__tempp, align 4
  %60 = load float, float* @major_cycle__stage_time, align 4
  %61 = fsub float 0x4072903120000000, %60
  store float %61, float* @major_cycle__tempt, align 4
  %62 = load float, float* @major_cycle__tempp, align 4
  %63 = fsub float 1.000000e+00, %62
  %64 = fmul float %63, %61
  store float %64, float* @major_cycle__ttg, align 4
  %65 = load float, float* @major_cycle__stage_time, align 4
  %66 = fadd float %64, %65
  store float %66, float* @major_cycle__total_time_stage2, align 4
  %67 = load float, float* @major_cycle__stage_time, align 4
  %68 = load float, float* @major_cycle__tempa, align 4
  %69 = load float, float* @major_cycle__effectivegravity, align 4
  %70 = call float @algorithm__compangler([5 x float]* @major_cycle__guidvel, float %69, float %68, float %66, float %67)
  store float %70, float* @major_cycle__angler, align 4
  store float %70, float* @main__angler, align 4
  %71 = load float, float* @major_cycle__stage_time, align 4
  %72 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 1), align 4
  %73 = load float, float* @major_cycle__distvelaxis, align 4
  %74 = call float @algorithm__compangley(float %73, float %72, float %71)
  store float %74, float* @major_cycle__angley, align 4
  store float %74, float* @main__angley, align 4
  %75 = load float, float* @major_cycle__ttg, align 4
  %76 = fcmp olt float %75, 6.000000e+00
  %77 = load i16, i16* @major_cycle__velflag, align 2
  %78 = icmp eq i16 %77, 0
  %or.cond3 = and i1 %76, %78
  br i1 %or.cond3, label %"14", label %"15"

"14":                                             ; preds = %"12"
  %79 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__velocity, i64 0, i64 0), align 4
  %80 = fmul float %79, %79
  %81 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__velocity, i64 0, i64 1), align 4
  %82 = fmul float %81, %81
  %83 = fadd float %80, %82
  %84 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__velocity, i64 0, i64 2), align 4
  %85 = fmul float %84, %84
  %86 = fadd float %83, %85
  %87 = call float @library__squareroot(float %86)
  store float %87, float* @major_cycle__instvelocity, align 4
  store float 0.000000e+00, float* @major_cycle__velocityincrmj, align 4
  store float 0.000000e+00, float* @major_cycle__velocityincrmn, align 4
  %88 = load float, float* @major_cycle__instvelocity, align 4
  store float %88, float* @major_cycle__velocitycoeff, align 4
  %89 = load float, float* @major_cycle__instvelocity, align 4
  store float %89, float* @major_cycle__instvelocityprev, align 4
  store i16 1, i16* @major_cycle__velflag, align 2
  br label %"15"

"15":                                             ; preds = %"14", %"12"
  %90 = load float, float* @major_cycle__ttg, align 4
  %91 = fcmp olt float %90, 1.350000e+01
  %92 = load i16, i16* @major_cycle__event4, align 2
  %93 = icmp eq i16 %92, 0
  %or.cond5 = and i1 %91, %93
  br i1 %or.cond5, label %"17", label %"18"

"17":                                             ; preds = %"15"
  store i16 1, i16* @major_cycle__event4, align 2
  br label %"18"

"18":                                             ; preds = %"17", %"15"
  %94 = load float, float* @major_cycle__angley, align 4
  %95 = load float, float* @major_cycle__angler, align 4
  call void @math__guidecitransform([5 x float]* @major_cycle__dircos_u, [5 x float]* @major_cycle__dircos_v, [5 x float]* @major_cycle__dircos, float %95, float %94, [5 x float]* @major_cycle__tempres)
  call void @math__genrates([5 x float]* @major_cycle__tempres, [5 x float]* @major_cycle__majorprev_q, [5 x float]* @major_cycle__brate)
  %96 = load float, float* @major_cycle__ttg, align 4
  %97 = fcmp olt float %96, 5.000000e+00
  br i1 %97, label %"19", label %"20"

"19":                                             ; preds = %"18"
  store i16 1, i16* @major_cycle__minorflag_stage2, align 2
  br label %"20"

"20":                                             ; preds = %"19", %"18"
  call void @major_cycle__propagateq([5 x float]* @major_cycle__majorprev_q, [5 x float]* @major_cycle__brate)
  br label %"21"

"21":                                             ; preds = %"20", %"11"
  %98 = load float, float* @major_cycle__ttg, align 4
  store float %98, float* @major_cycle__ttg_prev, align 4
  %99 = load i16, i16* @major_cycle__minorflag_stage2, align 2
  store i16 %99, i16* @main__minorflag_stage2, align 2
  %100 = load float, float* @major_cycle__ttg, align 4
  store float %100, float* @main__ttg, align 4
  %101 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 0), align 4
  store float %101, float* @main__guidvel_u, align 4
  %102 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 1), align 4
  store float %102, float* @main__guidvel_v, align 4
  %103 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 2), align 4
  store float %103, float* @main__guidvel_w, align 4
  %104 = load float, float* @major_cycle__effectivegravity, align 4
  store float %104, float* @main__effectivegravity, align 4
  %105 = load float, float* @major_cycle__stage_time, align 4
  store float %105, float* @main__stage_time, align 4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast ([5 x float]* @main__brate to i8*), i8* bitcast ([5 x float]* @major_cycle__brate to i8*), i64 20, i32 4, i1 false)
  br label %return

return:                                           ; preds = %"21", %"4"
  ret void
}

; Function Attrs: uwtable
define internal void @major_cycle__constantq([5 x float]* %prevq) local_unnamed_addr #0 align 2 {
entry:
  br label %"3"

"3":                                              ; preds = %"7", %entry
  %0 = phi i16 [ %15, %"7" ], [ 1, %entry ]
  %1 = icmp sle i16 %0, 25
  br i1 %1, label %"4", label %return

"4":                                              ; preds = %"3"
  br label %"5"

"5":                                              ; preds = %"6", %"4"
  %2 = phi i16 [ %14, %"6" ], [ 1, %"4" ]
  %3 = icmp sle i16 %2, 4
  br i1 %3, label %"6", label %"7"

"6":                                              ; preds = %"5"
  %4 = sext i16 %2 to i64
  %5 = sext i16 %0 to i64
  %6 = sub i64 %4, 1
  %7 = bitcast [5 x float]* %prevq to float*
  %8 = getelementptr inbounds float, float* %7, i64 %6
  %9 = load float, float* %8, align 4
  %10 = sub i64 %5, 1
  %11 = getelementptr inbounds [5 x float], [5 x float]* getelementptr inbounds ([25 x [5 x float]], [25 x [5 x float]]* @major_cycle__q_minor, i64 0, i64 0), i64 %10
  %12 = bitcast [5 x float]* %11 to float*
  %13 = getelementptr inbounds float, float* %12, i64 %6
  store float %9, float* %13, align 4
  %14 = add nsw i16 %2, 1
  br label %"5"

"7":                                              ; preds = %"5"
  %15 = add nsw i16 %0, 1
  br label %"3"

return:                                           ; preds = %"3"
  ret void
}

; Function Attrs: uwtable
define void @major_cycle__stage2_initialise() local_unnamed_addr #0 align 2 {
entry:
  store float 0.000000e+00, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__brate, i64 0, i64 0), align 4
  store float 0.000000e+00, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__brate, i64 0, i64 1), align 4
  store float 0.000000e+00, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__brate, i64 0, i64 2), align 4
  store float 0xC0818A3D80000000, float* @algorithm__velocityradial, align 4
  store float 0x40A6D39480000000, float* @algorithm__exhaustvel, align 4
  store float 0x4072C072C0000000, float* @algorithm__timeconst, align 4
  store float 1.600000e+02, float* @major_cycle__ttg_prev, align 4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast ([5 x float]* @major_cycle__majorprev_q to i8*), i8* bitcast ([5 x float]* @main__qc to i8*), i64 20, i32 4, i1 false)
  ret void
}

declare float @library__squareroot(float)

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

declare float @math__dotproduct([5 x float]*, [5 x float]*)

declare float @library__exponent(float)

declare float @algorithm__compangler([5 x float]*, float, float, float, float)

declare float @algorithm__compangley(float, float, float)

declare void @math__guidecitransform([5 x float]*, [5 x float]*, [5 x float]*, float, float, [5 x float]*)

declare void @math__genrates([5 x float]*, [5 x float]*, [5 x float]*)

; Function Attrs: uwtable
define void @major_cycle__propagateq([5 x float]* %prevq, [5 x float]* %brate) local_unnamed_addr #0 align 2 {
entry:
  store float 0.000000e+00, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__temp1, i64 0, i64 0), align 4
  %0 = bitcast [5 x float]* %brate to float*
  %1 = load float, float* %0, align 4
  %2 = fmul float %1, 0x3F847AE140000000
  store float %2, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__temp1, i64 0, i64 1), align 4
  %3 = getelementptr inbounds float, float* %0, i64 1
  %4 = load float, float* %3, align 4
  %5 = fmul float %4, 0x3F847AE140000000
  store float %5, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__temp1, i64 0, i64 2), align 4
  %6 = getelementptr inbounds float, float* %0, i64 2
  %7 = load float, float* %6, align 4
  %8 = fmul float %7, 0x3F847AE140000000
  store float %8, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__temp1, i64 0, i64 3), align 4
  call void @math__normalise([5 x float]* %prevq)
  br label %"3"

"3":                                              ; preds = %"7", %entry
  %9 = phi i16 [ %27, %"7" ], [ 1, %entry ]
  %10 = icmp sle i16 %9, 25
  br i1 %10, label %"4", label %return

"4":                                              ; preds = %"3"
  call void @math__multiply([5 x float]* %prevq, [5 x float]* @major_cycle__temp1, [5 x float]* @major_cycle__dotq)
  br label %"5"

"5":                                              ; preds = %"6", %"4"
  %11 = phi i16 [ %26, %"6" ], [ 1, %"4" ]
  %12 = icmp sle i16 %11, 4
  br i1 %12, label %"6", label %"7"

"6":                                              ; preds = %"5"
  %13 = sext i16 %11 to i64
  %14 = sub i64 %13, 1
  %15 = bitcast [5 x float]* %prevq to float*
  %16 = getelementptr inbounds float, float* %15, i64 %14
  %17 = load float, float* %16, align 4
  %18 = getelementptr inbounds float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__dotq, i64 0, i64 0), i64 %14
  %19 = load float, float* %18, align 4
  %20 = fadd float %17, %19
  store float %20, float* %16, align 4
  %21 = sext i16 %9 to i64
  %22 = sub i64 %21, 1
  %23 = getelementptr inbounds [5 x float], [5 x float]* getelementptr inbounds ([25 x [5 x float]], [25 x [5 x float]]* @major_cycle__q_minor, i64 0, i64 0), i64 %22
  %24 = bitcast [5 x float]* %23 to float*
  %25 = getelementptr inbounds float, float* %24, i64 %14
  store float %20, float* %25, align 4
  %26 = add nsw i16 %11, 1
  br label %"5"

"7":                                              ; preds = %"5"
  %27 = add nsw i16 %9, 1
  br label %"3"

return:                                           ; preds = %"3"
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: uwtable
define void @major_cycle__stage3_major() unnamed_addr #0 align 2 {
entry:
  %0 = load i16, i16* @main__step12, align 2
  %1 = icmp eq i16 %0, 0
  %2 = load i16, i16* @main__offstage3, align 2
  %3 = icmp eq i16 %2, 0
  %or.cond = and i1 %1, %3
  br i1 %or.cond, label %"4", label %"5"

"4":                                              ; preds = %entry
  call void @major_cycle__constantq([5 x float]* @major_cycle__majorprev_q)
  br label %return

"5":                                              ; preds = %entry
  %4 = load float, float* @main__posx, align 4
  store float %4, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__position, i64 0, i64 0), align 4
  %5 = load float, float* @main__posy, align 4
  store float %5, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__position, i64 0, i64 1), align 4
  %6 = load float, float* @main__posz, align 4
  store float %6, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__position, i64 0, i64 2), align 4
  %7 = load float, float* @main__velu, align 4
  store float %7, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__velocity, i64 0, i64 0), align 4
  %8 = load float, float* @main__velv, align 4
  store float %8, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__velocity, i64 0, i64 1), align 4
  %9 = load float, float* @main__velw, align 4
  store float %9, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__velocity, i64 0, i64 2), align 4
  %10 = load i16, i16* @major_cycle__enterstage3, align 2
  %11 = icmp eq i16 %10, 1
  br i1 %11, label %"6", label %"7"

"6":                                              ; preds = %"5"
  call void @major_cycle__stage3_initialise()
  store i16 0, i16* @major_cycle__enterstage3, align 2
  br label %"7"

"7":                                              ; preds = %"6", %"5"
  %12 = load float, float* @main__major_time, align 4
  %13 = load float, float* @main__stage3_start, align 4
  %14 = fsub float %12, %13
  store float %14, float* @major_cycle__stage_time, align 4
  %15 = load i16, i16* @major_cycle__minorflag_stage3, align 2
  %16 = icmp eq i16 %15, 1
  br i1 %16, label %"8", label %"9"

"8":                                              ; preds = %"7"
  call void @major_cycle__constantq([5 x float]* @major_cycle__majorprev_q)
  %17 = load float, float* @major_cycle__ttg, align 4
  %18 = fsub float %17, 5.000000e-01
  store float %18, float* @major_cycle__ttg, align 4
  br label %"19"

"9":                                              ; preds = %"7"
  call void @major_cycle__computation1([5 x float]* @major_cycle__position, [5 x float]* @major_cycle__dircos_stage3)
  %19 = call float @math__dotproduct([5 x float]* @major_cycle__dircos_u, [5 x float]* @major_cycle__velocity)
  store float %19, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 0), align 4
  %20 = call float @math__dotproduct([5 x float]* @major_cycle__dircos_v, [5 x float]* @major_cycle__velocity)
  store float %20, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 1), align 4
  %21 = call float @math__dotproduct([5 x float]* @major_cycle__dircos, [5 x float]* @major_cycle__velocity)
  store float %21, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 2), align 4
  %22 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 0), align 4
  %23 = fmul float %22, %22
  %24 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 1), align 4
  %25 = fmul float %24, %24
  %26 = fadd float %23, %25
  store float %26, float* @major_cycle__velsqr, align 4
  %27 = call float @math__dotproduct([5 x float]* @major_cycle__dircos_v, [5 x float]* @major_cycle__dircos_stage3)
  store float %27, float* @major_cycle__templ, align 4
  %28 = call float @math__dotproduct([5 x float]* @major_cycle__position, [5 x float]* @major_cycle__dircos_stage3)
  %29 = fsub float -0.000000e+00, %28
  store float %29, float* @major_cycle__distvelaxis, align 4
  %30 = load float, float* @major_cycle__templ, align 4
  %31 = fdiv float %29, %30
  store float %31, float* @major_cycle__distvelaxis, align 4
  call void @major_cycle__angletocover()
  %32 = call float @math__dotproduct([5 x float]* @major_cycle__dircos, [5 x float]* @major_cycle__dircosperigeeline)
  %33 = fsub float -0.000000e+00, %32
  %34 = fcmp olt float %33, 0x3FEFFFAC20000000
  br i1 %34, label %"10", label %"16"

"10":                                             ; preds = %"9"
  %35 = call float @library__sininverse(float %33)
  store float %35, float* @major_cycle__ta, align 4
  call void @math__crossproduct([5 x float]* @major_cycle__dircosperigeeline, [5 x float]* @major_cycle__dircos, [5 x float]* @major_cycle__variable_ta)
  %36 = call float @math__dotproduct([5 x float]* @major_cycle__dircos_stage3, [5 x float]* @major_cycle__variable_ta)
  %37 = fcmp ogt float %36, 0.000000e+00
  %38 = load float, float* @major_cycle__angle_to_cover, align 4
  %39 = load float, float* @major_cycle__ta, align 4
  %40 = fadd float %38, %39
  %41 = fsub float %38, %39
  %42 = select i1 %37, float %41, float %40
  %43 = call float @library__cosine(float %42)
  %44 = fmul float 0x3FE73B6040000000, %43
  %45 = fadd float %44, 1.000000e+00
  %46 = fdiv float 0x416563B640000000, %45
  %47 = fmul float %46, %46
  %48 = fmul float %47, 0x41869D2CC0000000
  %49 = fdiv float 0x460567CD20000000, %48
  %50 = call float @library__squareroot(float %49)
  %51 = fsub float 0x4183840D60000000, %46
  %52 = fmul float %51, 0x4306A864C0000000
  %53 = fsub float %46, 6.497260e+06
  %54 = fmul float %52, %53
  %55 = fdiv float %54, %48
  %56 = call float @library__squareroot(float %55)
  store float %56, float* @major_cycle__hv_target, align 4
  store float %46, float* @algorithm__rd_target, align 4
  %57 = load float, float* @major_cycle__hv_target, align 4
  store float %57, float* @algorithm__hv_target, align 4
  %58 = fcmp ogt float %42, 0.000000e+00
  %59 = fsub float -0.000000e+00, %50
  %60 = select i1 %58, float %59, float %50
  store float %60, float* @algorithm__velocityradial, align 4
  br label %"16"

"16":                                             ; preds = %"10", %"9"
  %61 = phi float [ %46, %"10" ], [ undef, %"9" ]
  %62 = load float, float* @major_cycle__tempa, align 4
  %63 = fdiv float 0x42F6A864C0000000, %62
  %64 = load float, float* @major_cycle__velsqr, align 4
  %65 = fsub float %63, %64
  %66 = fdiv float %65, %62
  %67 = fadd float %66, 1.000000e+00
  %68 = fmul float %66, %67
  store float %68, float* @major_cycle__effectivegravity, align 4
  %69 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 0), align 4
  %70 = load float, float* @major_cycle__hv_target, align 4
  %71 = fmul float %61, %70
  %72 = load float, float* @major_cycle__tempa, align 4
  %73 = fdiv float %71, %72
  %74 = fdiv float %73, 0x40B20DCA40000000
  %75 = fsub float %69, %74
  %76 = call float @library__exponent(float %75)
  store float %76, float* @major_cycle__tempp, align 4
  %77 = load float, float* @major_cycle__stage_time, align 4
  %78 = fsub float 8.200000e+02, %77
  store float %78, float* @major_cycle__tempt, align 4
  %79 = load float, float* @major_cycle__tempp, align 4
  %80 = fsub float 1.000000e+00, %79
  %81 = fmul float %80, %78
  store float %81, float* @major_cycle__ttg, align 4
  %82 = load float, float* @major_cycle__stage_time, align 4
  %83 = fadd float %81, %82
  store float %83, float* @major_cycle__total_time_stage3, align 4
  %84 = load float, float* @major_cycle__stage_time, align 4
  %85 = load float, float* @major_cycle__tempa, align 4
  %86 = load float, float* @major_cycle__effectivegravity, align 4
  %87 = call float @algorithm__compangler([5 x float]* @major_cycle__guidvel, float %86, float %85, float %83, float %84)
  store float %87, float* @major_cycle__angler, align 4
  store float %87, float* @main__angler, align 4
  %88 = load float, float* @major_cycle__stage_time, align 4
  %89 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 1), align 4
  %90 = load float, float* @major_cycle__distvelaxis, align 4
  %91 = call float @algorithm__compangley(float %90, float %89, float %88)
  store float %91, float* @major_cycle__angley, align 4
  store float %91, float* @main__angley, align 4
  %92 = load float, float* @major_cycle__angley, align 4
  %93 = load float, float* @major_cycle__angler, align 4
  call void @math__guidecitransform([5 x float]* @major_cycle__dircos_u, [5 x float]* @major_cycle__dircos_v, [5 x float]* @major_cycle__dircos, float %93, float %92, [5 x float]* @major_cycle__tempres)
  call void @math__genrates([5 x float]* @major_cycle__tempres, [5 x float]* @major_cycle__majorprev_q, [5 x float]* @major_cycle__brate)
  %94 = load float, float* @major_cycle__ttg, align 4
  %95 = fcmp olt float %94, 5.000000e+00
  br i1 %95, label %"17", label %"18"

"17":                                             ; preds = %"16"
  store i16 1, i16* @major_cycle__minorflag_stage3, align 2
  br label %"18"

"18":                                             ; preds = %"17", %"16"
  call void @major_cycle__propagateq([5 x float]* @major_cycle__majorprev_q, [5 x float]* @major_cycle__brate)
  br label %"19"

"19":                                             ; preds = %"18", %"8"
  %96 = load float, float* @major_cycle__ttg, align 4
  store float %96, float* @major_cycle__ttg_prev, align 4
  %97 = load i16, i16* @major_cycle__minorflag_stage3, align 2
  store i16 %97, i16* @main__minorflag_stage3, align 2
  %98 = load float, float* @major_cycle__ttg, align 4
  store float %98, float* @main__ttg, align 4
  %99 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 0), align 4
  store float %99, float* @main__guidvel_u, align 4
  %100 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 1), align 4
  store float %100, float* @main__guidvel_v, align 4
  %101 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 2), align 4
  store float %101, float* @main__guidvel_w, align 4
  %102 = load float, float* @major_cycle__effectivegravity, align 4
  store float %102, float* @main__effectivegravity, align 4
  %103 = load float, float* @major_cycle__stage_time, align 4
  store float %103, float* @main__stage_time, align 4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast ([5 x float]* @main__brate to i8*), i8* bitcast ([5 x float]* @major_cycle__brate to i8*), i64 20, i32 4, i1 false)
  br label %return

return:                                           ; preds = %"19", %"4"
  ret void
}

; Function Attrs: uwtable
define void @major_cycle__stage3_initialise() local_unnamed_addr #0 align 2 {
entry:
  store float 0.000000e+00, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__brate, i64 0, i64 0), align 4
  store float 0.000000e+00, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__brate, i64 0, i64 1), align 4
  store float 0.000000e+00, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__brate, i64 0, i64 2), align 4
  store float 0x40B0C9C7A0000000, float* @algorithm__exhaustvel, align 4
  store float 0x408A21D700000000, float* @algorithm__timeconst, align 4
  store float 0x40838851E0000000, float* @major_cycle__ttg_prev, align 4
  store float 0x4083B18520000000, float* @major_cycle__total_time_stage3, align 4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast ([5 x float]* @major_cycle__majorprev_q to i8*), i8* bitcast ([5 x float]* @main__qc to i8*), i64 20, i32 4, i1 false)
  ret void
}

; Function Attrs: uwtable
define void @major_cycle__angletocover() local_unnamed_addr #0 align 2 {
entry:
  %0 = load float, float* @major_cycle__total_time_stage3, align 4
  %1 = load float, float* @major_cycle__stage_time, align 4
  %2 = fsub float %0, %1
  store float %2, float* @major_cycle__ttg, align 4
  %3 = load float, float* @major_cycle__stage_time, align 4
  %4 = fsub float 8.200000e+02, %3
  %5 = load float, float* @major_cycle__total_time_stage3, align 4
  %6 = fsub float 8.200000e+02, %5
  %7 = call float @library__log(float %4)
  %8 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 0), align 4
  %9 = fmul float %7, 0x40B20DCA40000000
  %10 = fadd float %8, %9
  %11 = load float, float* @major_cycle__ttg, align 4
  %12 = fmul float %10, %11
  %13 = call float @library__log(float %6)
  %14 = fsub float %13, 1.000000e+00
  %15 = fmul float %6, %14
  %16 = fsub float %7, 1.000000e+00
  %17 = fmul float %4, %16
  %18 = fsub float %15, %17
  %19 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 0), align 4
  %20 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 2), align 4
  %21 = fmul float %19, %20
  %22 = load float, float* @major_cycle__tempa, align 4
  %23 = fdiv float %21, %22
  %24 = fmul float %18, 0x40B20DCA40000000
  %25 = fadd float %12, %24
  %26 = fmul float %23, 5.000000e-01
  %27 = load float, float* @major_cycle__ttg, align 4
  %28 = fmul float %26, %27
  %29 = fmul float %28, %27
  %30 = fsub float %25, %29
  %31 = fdiv float %30, %22
  store float %31, float* @major_cycle__angle_to_cover, align 4
  ret void
}

declare float @library__sininverse(float)

declare void @math__crossproduct([5 x float]*, [5 x float]*, [5 x float]*)

declare float @library__cosine(float)

declare float @library__log(float)

declare void @math__normalise([5 x float]*)

declare void @math__multiply([5 x float]*, [5 x float]*, [5 x float]*)

declare void @math__dircosine([5 x float]*, [5 x float]*)

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: uwtable
define void @major_cycle__manoeuvre() unnamed_addr #0 align 2 personality i8* bitcast (void ()* @major_cycle__manoeuvre to i8*) {
entry:
  %inverseq = alloca [5 x float]
  %errorq = alloca [5 x float]
  %ratesb = alloca [5 x float]
  invoke void @math__inverse([5 x float]* @major_cycle__majorprev_q, [5 x float]* %inverseq)
          to label %"3" unwind label %"16"

"3":                                              ; preds = %entry
  invoke void @math__multiply([5 x float]* %inverseq, [5 x float]* @major_cycle__desiredq, [5 x float]* %errorq)
          to label %"4" unwind label %"16"

"4":                                              ; preds = %"3"
  invoke void @math__negate([5 x float]* %errorq)
          to label %"5" unwind label %"16"

"5":                                              ; preds = %"4"
  br label %"6"

"6":                                              ; preds = %"9", %"5"
  %0 = phi i16 [ %2, %"9" ], [ 1, %"5" ]
  %1 = icmp sle i16 %0, 3
  br i1 %1, label %"7", label %"13"

"7":                                              ; preds = %"6"
  %2 = add nsw i16 %0, 1
  %3 = sext i16 %2 to i64
  %4 = sub i64 %3, 1
  %5 = bitcast [5 x float]* %errorq to float*
  %6 = getelementptr inbounds float, float* %5, i64 %4
  %7 = load float, float* %6, align 4
  %8 = invoke float @library__sininverse(float %7)
          to label %"9" unwind label %"16"

"9":                                              ; preds = %"7"
  %9 = fmul float %8, 2.000000e+00
  %10 = load float, float* @major_cycle__duration, align 4
  %11 = sext i16 %0 to i64
  %12 = fdiv float %9, %10
  %13 = sub i64 %11, 1
  %14 = bitcast [5 x float]* %ratesb to float*
  %15 = getelementptr inbounds float, float* %14, i64 %13
  store float %12, float* %15, align 4
  %16 = getelementptr inbounds float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__ratesbprev, i64 0, i64 0), i64 %13
  store float %12, float* %16, align 4
  br label %"6"

"13":                                             ; preds = %"6"
  invoke void @major_cycle__propagateq([5 x float]* @major_cycle__majorprev_q, [5 x float]* %ratesb) #0
          to label %"14" unwind label %"16"

"14":                                             ; preds = %"13"
  %17 = load float, float* @major_cycle__duration, align 4
  %18 = fsub float %17, 5.000000e-01
  store float %18, float* @major_cycle__duration, align 4
  %19 = bitcast [5 x float]* %ratesb to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast ([5 x float]* @main__brate to i8*), i8* %19, i64 20, i32 4, i1 false)
  %20 = bitcast [5 x float]* %inverseq to i8*
  call void @llvm.lifetime.end.p0i8(i64 20, i8* %20)
  %21 = bitcast [5 x float]* %errorq to i8*
  call void @llvm.lifetime.end.p0i8(i64 20, i8* %21)
  call void @llvm.lifetime.end.p0i8(i64 20, i8* %19)
  ret void

"16":                                             ; preds = %"13", %"7", %"4", %"3", %entry
  %exc = landingpad { i8*, i32 }
          cleanup
  %exc_ptr1 = extractvalue { i8*, i32 } %exc, 0
  %filter2 = extractvalue { i8*, i32 } %exc, 1
  %22 = bitcast [5 x float]* %inverseq to i8*
  call void @llvm.lifetime.end.p0i8(i64 20, i8* %22)
  %23 = bitcast [5 x float]* %errorq to i8*
  call void @llvm.lifetime.end.p0i8(i64 20, i8* %23)
  %24 = bitcast [5 x float]* %ratesb to i8*
  call void @llvm.lifetime.end.p0i8(i64 20, i8* %24)
  resume { i8*, i32 } %exc
}

declare void @math__inverse([5 x float]*, [5 x float]*)

declare void @math__negate([5 x float]*)

; Function Attrs: uwtable
define void @major_cycle___elabb() unnamed_addr #0 align 2 {
entry:
  call void @__gnat_rcheck_CE_Range_Check(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.cst, i64 0, i64 0), i32 11) #2
  unreachable
}

; Function Attrs: noreturn
declare void @__gnat_rcheck_CE_Range_Check(i8*, i32) #2

attributes #0 = { uwtable "no-frame-pointer-elim-non-leaf"="true" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { noreturn }

!llvm.module.flags = !{!0}

!0 = !{i32 7, !"PIE Level", i32 2}
