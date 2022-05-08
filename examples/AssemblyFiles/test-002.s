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

@math_E = unnamed_addr global i16 0
@library_E = unnamed_addr global i16 0
@algorithm__matrix22 = unnamed_addr global float undef
@algorithm__matrix12 = unnamed_addr global float undef
@algorithm__matrix11 = unnamed_addr global float undef
@algorithm__timeconst = global float undef
@algorithm__exhaustvel = global float undef
@algorithm__velocityradial = global float undef
@algorithm__hv_target = unnamed_addr global float undef
@algorithm__rd_target = unnamed_addr global float undef
@algorithm_E = unnamed_addr global i16 0
@main__posdefoutofplane = global float 0.000000e+00
@main__steercoeffd = global float 0.000000e+00
@main__steercoeffc = global float 0.000000e+00
@main__steercoeffb = global float 0.000000e+00
@main__steercoeffa = global float 0.000000e+00
@main__matrix22 = global float 0.000000e+00
@main__matrix12 = global float 0.000000e+00
@main__matrix11 = global float 0.000000e+00
@main__defvel = global float 0.000000e+00
@main__defpos = global float 0.000000e+00
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
@main__offstage2 = global i16 0
@main__step14 = unnamed_addr global i16 0
@main__step13 = unnamed_addr global i16 0
@main__step12 = unnamed_addr global i16 0
@main__step11 = unnamed_addr global i16 0
@main__step10 = unnamed_addr global i16 0
@main__step8 = global i16 0
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
@major_cycle__desiredq = local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__ttg_prev = unnamed_addr global float undef
@major_cycle__tempres = local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__brate = local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__velocity = local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__guidvel = local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__dircos_v = local_unnamed_addr global [5 x float] undef, align 16
@major_cycle__dircos_u = local_unnamed_addr global [5 x float] undef, align 16
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
@major_cycle__ratesbprev = internal unnamed_addr global [5 x float] undef, align 16

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
define void @math__Tf32array25by4BIP(i64 %_init.0, i64 %_init.1) unnamed_addr #1 align 2 {
entry:
  ret void
}

; Function Attrs: inlinehint uwtable
define void @math__Tf32array1by3BIP(i64 %_init.0, i64 %_init.1) unnamed_addr #1 align 2 {
entry:
  ret void
}

; Function Attrs: inlinehint uwtable
define void @math__Tarray3by3BIP(i64 %_init.0, i64 %_init.1) unnamed_addr #1 align 2 {
entry:
  ret void
}

; Function Attrs: inlinehint uwtable
define void @math__TquaternionBIP(i64 %_init.0, i64 %_init.1) unnamed_addr #1 align 2 {
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
define void @math__normalise([5 x float]* %q) #0 align 2 {
entry:
  %0 = bitcast [5 x float]* %q to float*
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
  %11 = getelementptr inbounds float, float* %0, i64 3
  %12 = load float, float* %11, align 4
  %13 = fmul float %12, %12
  %14 = fadd float %10, %13
  %15 = call float @library__squareroot(float %14)
  %16 = load float, float* %0, align 4
  %17 = fdiv float %16, %15
  store float %17, float* %0, align 4
  %18 = load float, float* %3, align 4
  %19 = fdiv float %18, %15
  store float %19, float* %3, align 4
  %20 = load float, float* %7, align 4
  %21 = fdiv float %20, %15
  store float %21, float* %7, align 4
  %22 = load float, float* %11, align 4
  %23 = fdiv float %22, %15
  store float %23, float* %11, align 4
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
  %11 = call float @library__squareroot(float %10)
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
define void @math__multiply([5 x float]* %q1, [5 x float]* %q2, [5 x float]* %q3) #0 align 2 {
entry:
  %0 = bitcast [5 x float]* %q2 to float*
  %1 = getelementptr inbounds float, float* %0, i64 1
  %2 = load float, float* %1, align 4
  %3 = bitcast [5 x float]* %q1 to float*
  %4 = getelementptr inbounds float, float* %3, i64 1
  %5 = load float, float* %4, align 4
  %6 = fmul float %2, %5
  %7 = fsub float -0.000000e+00, %6
  %8 = getelementptr inbounds float, float* %0, i64 2
  %9 = load float, float* %8, align 4
  %10 = getelementptr inbounds float, float* %3, i64 2
  %11 = load float, float* %10, align 4
  %12 = fmul float %9, %11
  %13 = fsub float %7, %12
  %14 = getelementptr inbounds float, float* %0, i64 3
  %15 = load float, float* %14, align 4
  %16 = getelementptr inbounds float, float* %3, i64 3
  %17 = load float, float* %16, align 4
  %18 = fmul float %15, %17
  %19 = fsub float %13, %18
  %20 = load float, float* %0, align 4
  %21 = load float, float* %3, align 4
  %22 = fmul float %20, %21
  %23 = fadd float %19, %22
  %24 = bitcast [5 x float]* %q3 to float*
  store float %23, float* %24, align 4
  %25 = load float, float* %0, align 4
  %26 = load float, float* %4, align 4
  %27 = fmul float %25, %26
  %28 = load float, float* %14, align 4
  %29 = load float, float* %10, align 4
  %30 = fmul float %28, %29
  %31 = fadd float %27, %30
  %32 = load float, float* %8, align 4
  %33 = load float, float* %16, align 4
  %34 = fmul float %32, %33
  %35 = fsub float %31, %34
  %36 = load float, float* %1, align 4
  %37 = load float, float* %3, align 4
  %38 = fmul float %36, %37
  %39 = fadd float %35, %38
  %40 = getelementptr inbounds float, float* %24, i64 1
  store float %39, float* %40, align 4
  %41 = load float, float* %0, align 4
  %42 = load float, float* %10, align 4
  %43 = fmul float %41, %42
  %44 = load float, float* %14, align 4
  %45 = load float, float* %4, align 4
  %46 = fmul float %44, %45
  %47 = fsub float %43, %46
  %48 = load float, float* %1, align 4
  %49 = load float, float* %16, align 4
  %50 = fmul float %48, %49
  %51 = fadd float %47, %50
  %52 = load float, float* %8, align 4
  %53 = load float, float* %3, align 4
  %54 = fmul float %52, %53
  %55 = fadd float %51, %54
  %56 = getelementptr inbounds float, float* %24, i64 2
  store float %55, float* %56, align 4
  %57 = load float, float* %8, align 4
  %58 = load float, float* %4, align 4
  %59 = fmul float %57, %58
  %60 = load float, float* %1, align 4
  %61 = load float, float* %10, align 4
  %62 = fmul float %60, %61
  %63 = fsub float %59, %62
  %64 = load float, float* %0, align 4
  %65 = load float, float* %16, align 4
  %66 = fmul float %64, %65
  %67 = fadd float %63, %66
  %68 = load float, float* %14, align 4
  %69 = load float, float* %3, align 4
  %70 = fmul float %68, %69
  %71 = fadd float %67, %70
  %72 = getelementptr inbounds float, float* %24, i64 3
  store float %71, float* %72, align 4
  ret void
}

; Function Attrs: uwtable
define void @math__inverse([5 x float]* %q, [5 x float]* %qinv) #0 align 2 {
entry:
  %0 = bitcast [5 x float]* %q to float*
  %1 = load float, float* %0, align 4
  %2 = bitcast [5 x float]* %qinv to float*
  store float %1, float* %2, align 4
  %3 = getelementptr inbounds float, float* %0, i64 1
  %4 = load float, float* %3, align 4
  %5 = fsub float -0.000000e+00, %4
  %6 = getelementptr inbounds float, float* %2, i64 1
  store float %5, float* %6, align 4
  %7 = getelementptr inbounds float, float* %0, i64 2
  %8 = load float, float* %7, align 4
  %9 = fsub float -0.000000e+00, %8
  %10 = getelementptr inbounds float, float* %2, i64 2
  store float %9, float* %10, align 4
  %11 = getelementptr inbounds float, float* %0, i64 3
  %12 = load float, float* %11, align 4
  %13 = fsub float -0.000000e+00, %12
  %14 = getelementptr inbounds float, float* %2, i64 3
  store float %13, float* %14, align 4
  ret void
}

; Function Attrs: uwtable
define void @math__negate([5 x float]* %q) #0 align 2 {
entry:
  %0 = bitcast [5 x float]* %q to float*
  %1 = load float, float* %0, align 4
  %2 = fcmp olt float %1, 0.000000e+00
  br i1 %2, label %"3", label %return

"3":                                              ; preds = %entry
  %3 = fsub float -0.000000e+00, %1
  store float %3, float* %0, align 4
  %4 = getelementptr inbounds float, float* %0, i64 1
  %5 = load float, float* %4, align 4
  %6 = fsub float -0.000000e+00, %5
  store float %6, float* %4, align 4
  %7 = getelementptr inbounds float, float* %0, i64 2
  %8 = load float, float* %7, align 4
  %9 = fsub float -0.000000e+00, %8
  store float %9, float* %7, align 4
  %10 = getelementptr inbounds float, float* %0, i64 3
  %11 = load float, float* %10, align 4
  %12 = fsub float -0.000000e+00, %11
  store float %12, float* %10, align 4
  br label %return

return:                                           ; preds = %"3", %entry
  ret void
}

; Function Attrs: uwtable
define void @math__guidecitransform([5 x float]* %dircosvar1, [5 x float]* %dircosvar2, [5 x float]* %dircosvar3, float %angr, float %angy, [5 x float]* %transformout) #0 align 2 {
entry:
  %0 = call float @library__cosine(float %angr)
  %1 = call float @library__cosine(float %angy)
  %2 = call float @library__sine(float %angr)
  %3 = call float @library__sine(float %angy)
  %4 = bitcast [5 x float]* %dircosvar1 to float*
  %5 = load float, float* %4, align 4
  %6 = fmul float %0, %5
  %7 = fmul float %1, %6
  %8 = bitcast [5 x float]* %dircosvar2 to float*
  %9 = load float, float* %8, align 4
  %10 = fmul float %0, %9
  %11 = fmul float %3, %10
  %12 = fadd float %7, %11
  %13 = bitcast [5 x float]* %dircosvar3 to float*
  %14 = load float, float* %13, align 4
  %15 = fmul float %2, %14
  %16 = fadd float %12, %15
  %17 = bitcast [5 x float]* %transformout to float*
  store float %16, float* %17, align 4
  %18 = getelementptr inbounds float, float* %4, i64 1
  %19 = load float, float* %18, align 4
  %20 = fmul float %0, %19
  %21 = fmul float %1, %20
  %22 = getelementptr inbounds float, float* %8, i64 1
  %23 = load float, float* %22, align 4
  %24 = fmul float %0, %23
  %25 = fmul float %3, %24
  %26 = fadd float %21, %25
  %27 = getelementptr inbounds float, float* %13, i64 1
  %28 = load float, float* %27, align 4
  %29 = fmul float %2, %28
  %30 = fadd float %26, %29
  %31 = getelementptr inbounds float, float* %17, i64 1
  store float %30, float* %31, align 4
  %32 = getelementptr inbounds float, float* %4, i64 2
  %33 = load float, float* %32, align 4
  %34 = fmul float %0, %33
  %35 = fmul float %1, %34
  %36 = getelementptr inbounds float, float* %8, i64 2
  %37 = load float, float* %36, align 4
  %38 = fmul float %0, %37
  %39 = fmul float %3, %38
  %40 = fadd float %35, %39
  %41 = getelementptr inbounds float, float* %13, i64 2
  %42 = load float, float* %41, align 4
  %43 = fmul float %2, %42
  %44 = fadd float %40, %43
  %45 = getelementptr inbounds float, float* %17, i64 2
  store float %44, float* %45, align 4
  ret void
}

; Function Attrs: uwtable
define void @math__genrates([5 x float]* %acclnvec, [5 x float]* %qp, [5 x float]* %cmdbrate) #0 align 2 personality i8* bitcast (void ([5 x float]*, [5 x float]*, [5 x float]*)* @math__genrates to i8*) {
entry:
  %0 = bitcast [5 x float]* %qp to float*
  %1 = getelementptr inbounds float, float* %0, i64 2
  %2 = load float, float* %1, align 4
  %3 = fmul float %2, %2
  %4 = getelementptr inbounds float, float* %0, i64 3
  %5 = load float, float* %4, align 4
  %6 = fmul float %5, %5
  %7 = fadd float %3, %6
  %8 = fmul float %7, 2.000000e+00
  %9 = fsub float 1.000000e+00, %8
  %10 = getelementptr inbounds float, float* %0, i64 1
  %11 = load float, float* %10, align 4
  %12 = fmul float %11, %2
  %13 = load float, float* %0, align 4
  %14 = fmul float %13, %5
  %15 = fsub float %12, %14
  %16 = fmul float %15, 2.000000e+00
  %17 = fmul float %11, %5
  %18 = fmul float %13, %2
  %19 = fadd float %17, %18
  %20 = fadd float %12, %14
  %21 = fmul float %20, 2.000000e+00
  %22 = fmul float %11, %11
  %23 = fadd float %22, %6
  %24 = fmul float %23, 2.000000e+00
  %25 = fsub float 1.000000e+00, %24
  %26 = fmul float %2, %5
  %27 = fmul float %13, %11
  %28 = fsub float %26, %27
  %29 = fsub float %17, %18
  %30 = fmul float %29, 2.000000e+00
  %31 = fadd float %26, %27
  %32 = fmul float %31, 2.000000e+00
  %33 = fadd float %22, %3
  %34 = fmul float %33, 2.000000e+00
  %35 = bitcast [5 x float]* %acclnvec to float*
  %36 = load float, float* %35, align 4
  %37 = fmul float %16, %36
  %38 = getelementptr inbounds float, float* %35, i64 1
  %39 = load float, float* %38, align 4
  %40 = fmul float %25, %39
  %41 = fadd float %37, %40
  %42 = getelementptr inbounds float, float* %35, i64 2
  %43 = load float, float* %42, align 4
  %44 = fmul float %32, %43
  %45 = fadd float %41, %44
  %46 = invoke float @library__sininverse(float %45)
          to label %"3" unwind label %"6"

"3":                                              ; preds = %entry
  %47 = fsub float -0.000000e+00, %46
  %48 = load float, float* %35, align 4
  %49 = fmul float %9, %48
  %50 = load float, float* %38, align 4
  %51 = fmul float %21, %50
  %52 = fadd float %49, %51
  %53 = load float, float* %42, align 4
  %54 = fmul float %30, %53
  %55 = fadd float %52, %54
  %56 = invoke float @library__sininverse(float %55)
          to label %"4" unwind label %"6"

"4":                                              ; preds = %"3"
  %57 = fmul float %47, 2.000000e+00
  %58 = bitcast [5 x float]* %cmdbrate to float*
  store float %57, float* %58, align 4
  %59 = fmul float %56, 2.000000e+00
  %60 = getelementptr inbounds float, float* %58, i64 1
  store float %59, float* %60, align 4
  %61 = getelementptr inbounds float, float* %58, i64 2
  store float 0.000000e+00, float* %61, align 4
  ret void

"6":                                              ; preds = %"3", %entry
  %exc = landingpad { i8*, i32 }
          cleanup
  %exc_ptr1 = extractvalue { i8*, i32 } %exc, 0
  %filter2 = extractvalue { i8*, i32 } %exc, 1
  resume { i8*, i32 } %exc
}

; Function Attrs: uwtable
define float @library__absolute(float %x) unnamed_addr #0 align 2 {
entry:
  %0 = fcmp olt float %x, 0.000000e+00
  %1 = fsub float -0.000000e+00, %x
  %2 = select i1 %0, float %1, float %x
  ret float %2
}

; Function Attrs: uwtable
define float @library__cosine(float %x1) #0 align 2 {
entry:
  %0 = fcmp olt float %x1, 0.000000e+00
  %1 = fsub float -0.000000e+00, %x1
  %2 = select i1 %0, float %1, float %x1
  br label %"5"

"5":                                              ; preds = %"6", %entry
  %3 = phi float [ %5, %"6" ], [ %2, %entry ]
  %4 = fcmp ogt float %3, 0x401921FB40000000
  br i1 %4, label %"6", label %"7"

"6":                                              ; preds = %"5"
  %5 = fsub float %3, 0x401921FB40000000
  br label %"5"

"7":                                              ; preds = %"5"
  %6 = fcmp ogt float %3, 0x400921FB00000000
  %7 = fsub float %3, 0x400921FB00000000
  %8 = select i1 %6, float %7, float %3
  %9 = fcmp ogt float %8, 0x3FF921FB00000000
  %10 = fcmp ole float %8, 0x400921FB00000000
  %or.cond = and i1 %9, %10
  %11 = fsub float 0x400921FB00000000, %8
  %12 = select i1 %or.cond, i8 0, i8 1
  %13 = select i1 %or.cond, float %11, float %8
  %14 = fcmp ogt float %13, 0x3FE921FB00000000
  %15 = fcmp ole float %13, 0x3FF921FB00000000
  %or.cond1 = and i1 %14, %15
  br i1 %or.cond1, label %"14", label %"17"

"14":                                             ; preds = %"7"
  %16 = fsub float 0x3FF921FB00000000, %13
  %17 = fmul float %16, %16
  %18 = fmul float %16, %17
  %19 = fdiv float %18, 6.000000e+00
  %20 = fsub float %16, %19
  %21 = fmul float %16, %18
  %22 = fmul float %16, %21
  %23 = fdiv float %22, 1.200000e+02
  %24 = fadd float %20, %23
  %25 = fcmp oge float %16, 0x3FD3333340000000
  br i1 %25, label %"15", label %"21"

"15":                                             ; preds = %"14"
  %26 = fmul float %16, %22
  %27 = fmul float %16, %26
  %28 = fdiv float %27, 5.040000e+03
  %29 = fsub float %24, %28
  br label %"21"

"17":                                             ; preds = %"7"
  %30 = fcmp ole float %13, 0x3EE4F8B580000000
  br i1 %30, label %"21", label %"19"

"19":                                             ; preds = %"17"
  %31 = fmul float %13, %13
  %32 = fdiv float %31, 2.000000e+00
  %33 = fsub float 1.000000e+00, %32
  %34 = fmul float %13, %31
  %35 = fmul float %13, %34
  %36 = fdiv float %35, 2.400000e+01
  %37 = fadd float %33, %36
  %38 = fmul float %13, %35
  %39 = fmul float %13, %38
  %40 = fdiv float %39, 7.200000e+02
  %41 = fsub float %37, %40
  %42 = fcmp oge float %13, 0x3FD99999A0000000
  br i1 %42, label %"20", label %"21"

"20":                                             ; preds = %"19"
  %43 = fmul float %13, %39
  %44 = fmul float %13, %43
  %45 = fdiv float %44, 4.032000e+04
  %46 = fadd float %41, %45
  br label %"21"

"21":                                             ; preds = %"20", %"19", %"17", %"15", %"14"
  %47 = phi float [ %46, %"20" ], [ %41, %"19" ], [ %29, %"15" ], [ %24, %"14" ], [ 1.000000e+00, %"17" ]
  %48 = icmp ne i8 %12, 0
  %49 = fsub float -0.000000e+00, %47
  %spec.select = select i1 %48, float %49, float %47
  ret float %spec.select
}

; Function Attrs: uwtable
define float @library__sine(float %x1) #0 align 2 {
entry:
  %0 = fcmp olt float %x1, 0.000000e+00
  %1 = fsub float -0.000000e+00, %x1
  %2 = select i1 %0, float %1, float %x1
  br label %"5"

"5":                                              ; preds = %"6", %entry
  %3 = phi float [ %5, %"6" ], [ %2, %entry ]
  %4 = fcmp ogt float %3, 0x401921FB40000000
  br i1 %4, label %"6", label %"7"

"6":                                              ; preds = %"5"
  %5 = fsub float %3, 0x401921FB40000000
  br label %"5"

"7":                                              ; preds = %"5"
  %6 = fcmp ogt float %3, 0x400921FB00000000
  %7 = fsub float %3, 0x400921FB00000000
  %8 = select i1 %6, i8 0, i8 1
  %9 = select i1 %6, float %7, float %3
  %10 = fcmp ogt float %9, 0x3FF921FB00000000
  %11 = fcmp ole float %9, 0x400921FB00000000
  %or.cond = and i1 %10, %11
  %12 = fsub float 0x400921FB00000000, %9
  %13 = select i1 %or.cond, float %12, float %9
  %14 = fcmp ogt float %13, 0x3FE921FB00000000
  %15 = fcmp ole float %13, 0x3FF921FB00000000
  %or.cond1 = and i1 %14, %15
  br i1 %or.cond1, label %"14", label %"19"

"14":                                             ; preds = %"7"
  %16 = fsub float 0x3FF921FB00000000, %13
  %17 = fcmp ole float %16, 0x3EE4F8B580000000
  br i1 %17, label %"21", label %"16"

"16":                                             ; preds = %"14"
  %18 = fmul float %16, %16
  %19 = fdiv float %18, 2.000000e+00
  %20 = fsub float 1.000000e+00, %19
  %21 = fmul float %16, %18
  %22 = fmul float %16, %21
  %23 = fdiv float %22, 2.400000e+01
  %24 = fadd float %20, %23
  %25 = fmul float %16, %22
  %26 = fmul float %16, %25
  %27 = fdiv float %26, 7.200000e+02
  %28 = fsub float %24, %27
  %29 = fcmp oge float %16, 0x3FD99999A0000000
  br i1 %29, label %"17", label %"21"

"17":                                             ; preds = %"16"
  %30 = fmul float %16, %26
  %31 = fmul float %16, %30
  %32 = fdiv float %31, 4.032000e+04
  %33 = fadd float %28, %32
  br label %"21"

"19":                                             ; preds = %"7"
  %34 = fmul float %13, %13
  %35 = fmul float %13, %34
  %36 = fdiv float %35, 6.000000e+00
  %37 = fsub float %13, %36
  %38 = fmul float %13, %35
  %39 = fmul float %13, %38
  %40 = fdiv float %39, 1.200000e+02
  %41 = fadd float %37, %40
  %42 = fcmp oge float %13, 0x3FD3333340000000
  br i1 %42, label %"20", label %"21"

"20":                                             ; preds = %"19"
  %43 = fmul float %13, %39
  %44 = fmul float %13, %43
  %45 = fdiv float %44, 5.040000e+03
  %46 = fsub float %41, %45
  br label %"21"

"21":                                             ; preds = %"20", %"19", %"17", %"16", %"14"
  %47 = phi float [ %46, %"20" ], [ %41, %"19" ], [ %33, %"17" ], [ %28, %"16" ], [ 1.000000e+00, %"14" ]
  %48 = icmp ne i8 %8, 0
  %49 = fsub float -0.000000e+00, %47
  %spec.select = select i1 %48, float %49, float %47
  ret float %spec.select
}

; Function Attrs: uwtable
define float @library__exponent(float %x1) #0 align 2 {
entry:
  %0 = fcmp oeq float %x1, 0.000000e+00
  br i1 %0, label %"13", label %"4"

"4":                                              ; preds = %entry
  %1 = fcmp oeq float %x1, 1.000000e+00
  br i1 %1, label %"13", label %"6"

"6":                                              ; preds = %"4"
  %2 = fcmp oeq float %x1, -1.000000e+00
  br i1 %2, label %"13", label %"8"

"8":                                              ; preds = %"6"
  %3 = fcmp olt float %x1, 0.000000e+00
  %4 = fsub float -0.000000e+00, %x1
  %5 = select i1 %3, float %4, float %x1
  %6 = fadd float %5, 1.000000e+00
  %7 = fmul float %5, %5
  %8 = fdiv float %7, 2.000000e+00
  %9 = fadd float %6, %8
  %10 = fmul float %5, %7
  %11 = fdiv float %10, 6.000000e+00
  %12 = fadd float %9, %11
  %13 = fmul float %5, %10
  %14 = fdiv float %13, 2.400000e+01
  %15 = fadd float %12, %14
  %16 = fmul float %5, %13
  %17 = fdiv float %16, 1.200000e+02
  %18 = fadd float %15, %17
  %19 = fmul float %5, %16
  %20 = fdiv float %19, 7.200000e+02
  %21 = fadd float %18, %20
  br i1 true, label %"11", label %"13"

"11":                                             ; preds = %"8"
  %22 = fdiv float 1.000000e+00, %21
  br label %"13"

"13":                                             ; preds = %"11", %"8", %"6", %"4", %entry
  %23 = phi float [ %22, %"11" ], [ %21, %"8" ], [ 1.000000e+00, %entry ], [ 0x4005BF0AA0000000, %"4" ], [ 0x3FD78B5460000000, %"6" ]
  ret float %23
}

; Function Attrs: uwtable
define float @library__squareroot(float %x1) #0 align 2 {
entry:
  %0 = fcmp ole float %x1, 0.000000e+00
  br i1 %0, label %"14", label %"4"

"4":                                              ; preds = %entry
  %1 = fcmp oeq float %x1, 1.000000e+00
  br i1 %1, label %"14", label %"6"

"6":                                              ; preds = %"4"
  br label %"7"

"7":                                              ; preds = %"8", %"6"
  %2 = phi float [ %., %"8" ], [ 1.000000e+00, %"6" ]
  %3 = phi float [ %.1, %"8" ], [ %x1, %"6" ]
  %4 = fsub float %3, %2
  %5 = fcmp ogt float %4, 0x3EE4F8B580000000
  br i1 %5, label %"8", label %"14"

"8":                                              ; preds = %"7"
  %6 = fdiv float %4, 2.000000e+00
  %7 = fadd float %2, %6
  %8 = fmul float %7, %7
  %9 = fsub float %8, %x1
  %10 = fcmp ogt float %9, 0x3EE4F8B580000000
  %. = select i1 %10, float %2, float %7
  %.1 = select i1 %10, float %7, float %3
  br label %"7"

"14":                                             ; preds = %"7", %"4", %entry
  %11 = phi float [ 0.000000e+00, %entry ], [ 1.000000e+00, %"4" ], [ %2, %"7" ]
  ret float %11
}

; Function Attrs: uwtable
define float @library__log(float %x1) unnamed_addr #0 align 2 {
entry:
  %0 = fcmp ole float %x1, 0.000000e+00
  %1 = fcmp oeq float %x1, 1.000000e+00
  %or.cond = or i1 %0, %1
  br i1 %or.cond, label %"11", label %"6"

"6":                                              ; preds = %entry
  %2 = fadd float %x1, 1.000000e+00
  %3 = fdiv float %2, 2.000000e+00
  %4 = call float @library__squareroot(float %x1) #0
  br label %"7"

"7":                                              ; preds = %"8", %"6"
  %5 = phi float [ %10, %"8" ], [ %3, %"6" ]
  %6 = phi float [ %12, %"8" ], [ %4, %"6" ]
  %7 = fsub float %5, %6
  %8 = fcmp ogt float %7, 0x3EB0C6F7A0000000
  br i1 %8, label %"8", label %"9"

"8":                                              ; preds = %"7"
  %9 = fadd float %5, %6
  %10 = fdiv float %9, 2.000000e+00
  %11 = fmul float %10, %6
  %12 = call float @library__squareroot(float %11) #0
  br label %"7"

"9":                                              ; preds = %"7"
  %13 = fsub float %x1, 1.000000e+00
  %14 = fmul float %13, 2.000000e+00
  %15 = fadd float %5, %6
  %16 = fdiv float %14, %15
  br label %"11"

"11":                                             ; preds = %"9", %entry
  %17 = phi float [ %16, %"9" ], [ 0.000000e+00, %entry ]
  ret float %17
}

; Function Attrs: uwtable
define float @library__sininverse(float %x1) #0 align 2 {
entry:
  %0 = fcmp oeq float %x1, 0.000000e+00
  br i1 %0, label %"17", label %"4"

"4":                                              ; preds = %entry
  %1 = fcmp ogt float %x1, 1.000000e+00
  %2 = fcmp olt float %x1, -1.000000e+00
  %or.cond = or i1 %1, %2
  br i1 %or.cond, label %"17", label %"7"

"7":                                              ; preds = %"4"
  %3 = fcmp oeq float %x1, 1.000000e+00
  br i1 %3, label %"17", label %"9"

"9":                                              ; preds = %"7"
  %4 = fcmp oeq float %x1, -1.000000e+00
  br i1 %4, label %"17", label %"11"

"11":                                             ; preds = %"9"
  %5 = fcmp olt float %x1, 0.000000e+00
  %6 = fsub float -0.000000e+00, %x1
  %7 = select i1 %5, i8 1, i8 0
  %8 = select i1 %5, float %6, float %x1
  %9 = fcmp oge float %8, 5.000000e-01
  br i1 %9, label %"14", label %"15"

"14":                                             ; preds = %"11"
  %10 = fsub float 1.000000e+00, %8
  %11 = fdiv float %10, 2.000000e+00
  %12 = call float @library__squareroot(float %11) #0
  br label %"15"

"15":                                             ; preds = %"14", %"11"
  %13 = phi i8 [ 1, %"14" ], [ 0, %"11" ]
  %14 = phi float [ %12, %"14" ], [ %8, %"11" ]
  %15 = fmul float %14, %14
  %16 = fmul float %14, %15
  %17 = fdiv float %16, 3.000000e+00
  %18 = fmul float %17, 5.000000e-01
  %19 = fadd float %14, %18
  %20 = fmul float %14, %16
  %21 = fmul float %14, %20
  %22 = fdiv float %21, 5.000000e+00
  %23 = fmul float %22, 3.750000e-01
  %24 = fadd float %19, %23
  %25 = fmul float %14, %21
  %26 = fmul float %14, %25
  %27 = fdiv float %26, 7.000000e+00
  %28 = fmul float %27, 3.125000e-01
  %29 = fadd float %24, %28
  %30 = fmul float %14, %26
  %31 = fmul float %14, %30
  %32 = fdiv float %31, 9.000000e+00
  %33 = fmul float %32, 0x3FD1800000000000
  %34 = fadd float %29, %33
  %35 = fmul float %14, %31
  %36 = fmul float %14, %35
  %37 = fdiv float %36, 1.100000e+01
  %38 = fmul float %37, 0x3FCF800000000000
  %39 = fadd float %34, %38
  %40 = fmul float %14, %36
  %41 = fmul float %14, %40
  %42 = fdiv float %41, 1.300000e+01
  %43 = fmul float %42, 0x3FCCE00000000000
  %44 = fadd float %39, %43
  %45 = fmul float %14, %41
  %46 = fmul float %14, %45
  %47 = fdiv float %46, 1.500000e+01
  %48 = fmul float %47, 0x3FCAD00000000000
  %49 = fadd float %44, %48
  %50 = fmul float %14, %46
  %51 = fmul float %14, %50
  %52 = fdiv float %51, 1.700000e+01
  %53 = fmul float %52, 0x3FC9230000000000
  %54 = fadd float %49, %53
  %55 = fmul float %14, %51
  %56 = fmul float %14, %55
  %57 = fdiv float %56, 1.900000e+01
  %58 = fmul float %57, 0x3F92FE0000000000
  %59 = fadd float %54, %58
  %60 = fmul float %14, %56
  %61 = fmul float %14, %60
  %62 = fdiv float %61, 2.100000e+01
  %63 = fmul float %62, 0x3F920AE660000000
  %64 = fadd float %59, %63
  %65 = fmul float %14, %61
  %66 = fmul float %14, %65
  %67 = fdiv float %66, 2.300000e+01
  %68 = fmul float %67, 0x3F9138F340000000
  %69 = fadd float %64, %68
  %70 = fmul float %14, %66
  %71 = fmul float %14, %70
  %72 = fdiv float %71, 2.500000e+01
  %73 = fmul float %72, 0x3F90813E60000000
  %74 = fadd float %69, %73
  %75 = fmul float %14, %71
  %76 = fmul float %14, %75
  %77 = fdiv float %76, 2.700000e+01
  %78 = fmul float %77, 0x3F8FBD7800000000
  %79 = fadd float %74, %78
  %80 = fmul float %14, %76
  %81 = fmul float %14, %80
  %82 = fdiv float %81, 2.900000e+01
  %83 = fmul float %82, 0x3F8E9B4600000000
  %84 = fadd float %79, %83
  %85 = fmul float %14, %81
  %86 = fmul float %14, %85
  %87 = fdiv float %86, 3.100000e+01
  %88 = fmul float %87, 0x3F8D961900000000
  %89 = fadd float %84, %88
  %90 = icmp ne i8 %13, 0
  br i1 %90, label %"16", label %"17"

"16":                                             ; preds = %"15"
  %91 = fmul float %89, 2.000000e+00
  %92 = fsub float 0x3FF921FB00000000, %91
  br label %"17"

"17":                                             ; preds = %"16", %"15", %"9", %"7", %"4", %entry
  %93 = phi i8 [ %7, %"16" ], [ %7, %"15" ], [ undef, %entry ], [ undef, %"4" ], [ undef, %"7" ], [ undef, %"9" ]
  %94 = phi float [ %92, %"16" ], [ %89, %"15" ], [ 0.000000e+00, %entry ], [ 0.000000e+00, %"4" ], [ 0x3FF921FB00000000, %"7" ], [ 0xBFF921FB00000000, %"9" ]
  %95 = icmp ne i8 %93, 0
  %96 = fsub float -0.000000e+00, %94
  %spec.select = select i1 %95, float %96, float %94
  ret float %spec.select
}

; Function Attrs: uwtable
define float @library__taninverse(float %x1) #0 align 2 {
entry:
  %0 = fcmp oeq float %x1, 0.000000e+00
  br i1 %0, label %"11", label %"4"

"4":                                              ; preds = %entry
  %1 = fcmp olt float %x1, 0.000000e+00
  %2 = fsub float -0.000000e+00, %x1
  %3 = select i1 %1, i8 1, i8 0
  %4 = select i1 %1, float %2, float %x1
  %5 = fcmp olt float %4, 0x3FC0D9F900000000
  br i1 %5, label %"7", label %"8"

"7":                                              ; preds = %"4"
  %6 = fmul float %4, 0x3FC90E0A80000000
  %7 = fmul float %4, %6
  %8 = fsub float 0x3FD554BD00000000, %7
  %9 = fmul float %4, %4
  %10 = fmul float %8, %9
  %11 = fsub float 0x3FEFFFFDE0000000, %10
  %12 = fmul float %4, %11
  br label %"11"

"8":                                              ; preds = %"4"
  %13 = fcmp ole float %4, 1.000000e+00
  %14 = fmul float %4, %4
  br i1 %13, label %"9", label %"10"

"9":                                              ; preds = %"8"
  %15 = fadd float %14, 0x3FFCC5A1C0000000
  %16 = fdiv float 0x3FF5093420000000, %15
  %17 = fadd float %14, 0x400F8C5980000000
  %18 = fsub float %17, %16
  %19 = fdiv float 0x40038FC7A0000000, %18
  %20 = fadd float %19, 0x3FCE91C080000000
  %21 = fmul float %4, %20
  br label %"11"

"10":                                             ; preds = %"8"
  %22 = fadd float %14, 0x3FD94D7AE0000000
  %23 = fdiv float 0x3FB044D020000000, %22
  %24 = fadd float %14, 0x3FE327BB20000000
  %25 = fsub float %24, %23
  %26 = fdiv float 0x3FD5549300000000, %25
  %27 = fsub float 0x3FEFFFFDE0000000, %26
  %28 = fdiv float %27, %4
  %29 = fsub float 0x3FF921FB00000000, %28
  br label %"11"

"11":                                             ; preds = %"10", %"9", %"7", %entry
  %30 = phi i8 [ %3, %"10" ], [ %3, %"9" ], [ %3, %"7" ], [ 0, %entry ]
  %31 = phi float [ %29, %"10" ], [ %21, %"9" ], [ %12, %"7" ], [ 0.000000e+00, %entry ]
  %32 = icmp ne i8 %30, 0
  %33 = fsub float -0.000000e+00, %31
  %spec.select = select i1 %32, float %33, float %31
  ret float %spec.select
}

; Function Attrs: uwtable
define float @algorithm__compangler([5 x float]* %guidvel, float %radialdist, float %effectivegravity, float %ta, float %t) #0 align 2 {
entry:
  %0 = load float, float* @algorithm__rd_target, align 4
  %1 = fsub float %radialdist, %0
  %2 = fmul float %effectivegravity, 5.000000e-01
  %3 = fadd float %ta, %t
  %4 = fmul float %2, %3
  %5 = fsub float %ta, %t
  %6 = fmul float %4, %5
  %7 = fadd float %1, %6
  %8 = bitcast [5 x float]* %guidvel to float*
  %9 = getelementptr inbounds float, float* %8, i64 2
  %10 = load float, float* %9, align 4
  %11 = fmul float %t, %10
  %12 = fadd float %7, %11
  %13 = load float, float* @algorithm__velocityradial, align 4
  %14 = fmul float %ta, %13
  %15 = fsub float %12, %14
  %16 = fsub float %10, %13
  %17 = fmul float %effectivegravity, %5
  %18 = fadd float %16, %17
  %19 = load float, float* %8, align 4
  %20 = load float, float* @algorithm__hv_target, align 4
  %21 = fmul float %20, %0
  %22 = fdiv float %21, %radialdist
  %23 = fsub float %19, %22
  store float %23, float* @algorithm__matrix22, align 4
  %24 = fmul float %3, 5.000000e-01
  %25 = load float, float* @algorithm__timeconst, align 4
  %26 = fadd float %24, %25
  %27 = load float, float* @algorithm__exhaustvel, align 4
  %28 = fmul float %26, %27
  %29 = fmul float %28, %5
  store float %29, float* @algorithm__matrix11, align 4
  %30 = load float, float* @algorithm__timeconst, align 4
  %31 = fmul float %30, %30
  %32 = load float, float* @algorithm__matrix22, align 4
  %33 = fmul float %31, %32
  %34 = fadd float %33, %29
  store float %34, float* @algorithm__matrix11, align 4
  %35 = load float, float* @algorithm__exhaustvel, align 4
  %36 = fmul float %5, %35
  %37 = load float, float* @algorithm__timeconst, align 4
  %38 = load float, float* @algorithm__matrix22, align 4
  %39 = fmul float %37, %38
  %40 = fadd float %36, %39
  store float %40, float* @algorithm__matrix12, align 4
  %41 = fmul float %15, %40
  %42 = load float, float* @algorithm__matrix11, align 4
  %43 = fmul float %18, %42
  %44 = fsub float %41, %43
  %45 = fmul float %40, %40
  %46 = load float, float* @algorithm__matrix22, align 4
  %47 = fmul float %46, %42
  %48 = fsub float %45, %47
  %49 = fdiv float %44, %48
  %50 = fmul float %49, %40
  %51 = fsub float %15, %50
  %52 = fdiv float %51, %42
  %53 = fmul float %52, %t
  %54 = fadd float %49, %53
  %55 = call float @library__taninverse(float %54)
  store float %15, float* @main__defpos, align 4
  store float %18, float* @main__defvel, align 4
  %56 = load float, float* @algorithm__matrix11, align 4
  store float %56, float* @main__matrix11, align 4
  %57 = load float, float* @algorithm__matrix12, align 4
  store float %57, float* @main__matrix12, align 4
  %58 = load float, float* @algorithm__matrix22, align 4
  store float %58, float* @main__matrix22, align 4
  store float %52, float* @main__steercoeffa, align 4
  store float %49, float* @main__steercoeffb, align 4
  ret float %55
}

; Function Attrs: uwtable
define float @algorithm__compangley(float %distvelaxis, float %v, float %t) #0 align 2 {
entry:
  %0 = fmul float %v, %t
  %1 = fadd float %distvelaxis, %0
  %2 = load float, float* @algorithm__matrix12, align 4
  %3 = fmul float %1, %2
  %4 = load float, float* @algorithm__matrix11, align 4
  %5 = fmul float %v, %4
  %6 = fsub float %3, %5
  %7 = fmul float %2, %2
  %8 = load float, float* @algorithm__matrix22, align 4
  %9 = fmul float %8, %4
  %10 = fsub float %7, %9
  %11 = fdiv float %6, %10
  %12 = fmul float %11, %2
  %13 = fsub float %1, %12
  %14 = fdiv float %13, %4
  %15 = fmul float %14, %t
  %16 = fadd float %11, %15
  %17 = call float @library__taninverse(float %16)
  store float %14, float* @main__steercoeffc, align 4
  store float %11, float* @main__steercoeffd, align 4
  store float %1, float* @main__posdefoutofplane, align 4
  ret float %17
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
  call void @__gnat_rcheck_CE_Range_Check(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.cst, i64 0, i64 0), i32 10) #2
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
declare void @__gnat_rcheck_CE_Range_Check(i8*, i32) #2

; Function Attrs: uwtable
define void @main__guid_major() #0 align 2 {
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
  call void @major_cycle__manoeuvre()
  br label %return

"7":                                              ; preds = %"5"
  call void @major_cycle__stage2_major()
  br label %return

return:                                           ; preds = %"7", %"6", %entry
  ret void
}

; Function Attrs: uwtable
define void @major_cycle__stage2_major() #0 align 2 {
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
  br label %"9"

"9":                                              ; preds = %"8", %"7"
  %33 = load i16, i16* @major_cycle__minorflag_stage2, align 2
  %34 = icmp eq i16 %33, 1
  br i1 %34, label %"10", label %"11"

"10":                                             ; preds = %"9"
  call void @major_cycle__constantq([5 x float]* @major_cycle__majorprev_q)
  %35 = load float, float* @major_cycle__ttg, align 4
  %36 = fsub float %35, 5.000000e-01
  store float %36, float* @major_cycle__ttg, align 4
  br label %"17"

"11":                                             ; preds = %"9"
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
  %76 = fcmp olt float %75, 1.350000e+01
  %77 = load i16, i16* @major_cycle__event4, align 2
  %78 = icmp eq i16 %77, 0
  %or.cond3 = and i1 %76, %78
  br i1 %or.cond3, label %"13", label %"14"

"13":                                             ; preds = %"11"
  store i16 1, i16* @major_cycle__event4, align 2
  br label %"14"

"14":                                             ; preds = %"13", %"11"
  %79 = load float, float* @major_cycle__angley, align 4
  %80 = load float, float* @major_cycle__angler, align 4
  call void @math__guidecitransform([5 x float]* @major_cycle__dircos_u, [5 x float]* @major_cycle__dircos_v, [5 x float]* @major_cycle__dircos, float %80, float %79, [5 x float]* @major_cycle__tempres)
  call void @math__genrates([5 x float]* @major_cycle__tempres, [5 x float]* @major_cycle__majorprev_q, [5 x float]* @major_cycle__brate)
  %81 = load float, float* @major_cycle__ttg, align 4
  %82 = fcmp olt float %81, 5.000000e+00
  br i1 %82, label %"15", label %"16"

"15":                                             ; preds = %"14"
  store i16 1, i16* @major_cycle__minorflag_stage2, align 2
  br label %"16"

"16":                                             ; preds = %"15", %"14"
  call void @major_cycle__propagateq([5 x float]* @major_cycle__majorprev_q, [5 x float]* @major_cycle__brate)
  br label %"17"

"17":                                             ; preds = %"16", %"10"
  %83 = load float, float* @major_cycle__ttg, align 4
  store float %83, float* @major_cycle__ttg_prev, align 4
  %84 = load i16, i16* @major_cycle__minorflag_stage2, align 2
  store i16 %84, i16* @main__minorflag_stage2, align 2
  %85 = load float, float* @major_cycle__ttg, align 4
  store float %85, float* @main__ttg, align 4
  %86 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 0), align 4
  store float %86, float* @main__guidvel_u, align 4
  %87 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 1), align 4
  store float %87, float* @main__guidvel_v, align 4
  %88 = load float, float* getelementptr inbounds ([5 x float], [5 x float]* @major_cycle__guidvel, i64 0, i64 2), align 4
  store float %88, float* @main__guidvel_w, align 4
  %89 = load float, float* @major_cycle__effectivegravity, align 4
  store float %89, float* @main__effectivegravity, align 4
  %90 = load float, float* @major_cycle__stage_time, align 4
  store float %90, float* @main__stage_time, align 4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast ([5 x float]* @main__brate to i8*), i8* bitcast ([5 x float]* @major_cycle__brate to i8*), i64 20, i32 4, i1 false)
  br label %return

return:                                           ; preds = %"17", %"4"
  ret void
}

; Function Attrs: uwtable
define void @major_cycle__constantq([5 x float]* %prevq) local_unnamed_addr #0 align 2 {
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
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #3

; Function Attrs: uwtable
define void @major_cycle__manoeuvre() #0 align 2 personality i8* bitcast (void ()* @major_cycle__manoeuvre to i8*) {
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

attributes #0 = { uwtable "no-frame-pointer-elim-non-leaf"="true" }
attributes #1 = { inlinehint uwtable "no-frame-pointer-elim-non-leaf"="true" }
attributes #2 = { noreturn }
attributes #3 = { argmemonly nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 7, !"PIE Level", i32 2}


;; options: -f "_ada_mjguidancedriver" -b examples/AssemblyFiles/test-002.s -s examples/AssemblyFiles/test-002-spec.txt
;; output: 
