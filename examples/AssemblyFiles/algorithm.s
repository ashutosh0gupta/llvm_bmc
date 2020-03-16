; ModuleID = '../Test/Examples/algorithm.adb'
source_filename = "../Test/Examples/algorithm.adb"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64--linux-gnu"

module asm "\09.ident\09\22GCC: (Ubuntu 8.3.0-26ubuntu1~18.04) 8.3.0 LLVM: 6.0.0\22"

@algorithm__matrix22 = unnamed_addr global float undef
@algorithm__matrix12 = unnamed_addr global float undef
@algorithm__matrix11 = unnamed_addr global float undef
@algorithm__timeconst = unnamed_addr global float undef
@algorithm__exhaustvel = unnamed_addr global float undef
@algorithm__velocityradial = unnamed_addr global float undef
@algorithm__hv_target = unnamed_addr global float undef
@algorithm__rd_target = unnamed_addr global float undef
@algorithm_E = unnamed_addr global i16 0
@main__defpos = external global float
@main__defvel = external global float
@main__matrix11 = external global float
@main__matrix12 = external global float
@main__matrix22 = external global float
@main__steercoeffa = external global float
@main__steercoeffb = external global float
@main__steercoeffc = external global float
@main__steercoeffd = external global float
@main__posdefoutofplane = external global float

; Function Attrs: uwtable
define float @algorithm__compangler([5 x float]* %guidvel, float %radialdist, float %effectivegravity, float %ta, float %t) unnamed_addr #0 align 2 {
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

declare float @library__taninverse(float)

; Function Attrs: uwtable
define float @algorithm__compangley(float %distvelaxis, float %v, float %t) unnamed_addr #0 align 2 {
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

attributes #0 = { uwtable "no-frame-pointer-elim-non-leaf"="true" }

!llvm.module.flags = !{!0}

!0 = !{i32 7, !"PIE Level", i32 2}
