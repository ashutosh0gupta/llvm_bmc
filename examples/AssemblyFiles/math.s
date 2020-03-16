; ModuleID = '../Test/Examples/math.adb'
source_filename = "../Test/Examples/math.adb"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64--linux-gnu"

module asm "\09.ident\09\22GCC: (Ubuntu 8.3.0-26ubuntu1~18.04) 8.3.0 LLVM: 6.0.0\22"

@math_E = unnamed_addr global i16 0

; Function Attrs: inlinehint uwtable
define void @math__Tf32array25by4BIP(i64 %_init.0, i64 %_init.1) unnamed_addr #0 align 2 {
entry:
  ret void
}

; Function Attrs: inlinehint uwtable
define void @math__Tf32array1by3BIP(i64 %_init.0, i64 %_init.1) unnamed_addr #0 align 2 {
entry:
  ret void
}

; Function Attrs: inlinehint uwtable
define void @math__Tarray3by3BIP(i64 %_init.0, i64 %_init.1) unnamed_addr #0 align 2 {
entry:
  ret void
}

; Function Attrs: inlinehint uwtable
define void @math__TquaternionBIP(i64 %_init.0, i64 %_init.1) unnamed_addr #0 align 2 {
entry:
  ret void
}

; Function Attrs: uwtable
define float @math__dotproduct([5 x float]* %vec1, [5 x float]* %vec2) unnamed_addr #1 align 2 {
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
define void @math__crossproduct([5 x float]* %vec1, [5 x float]* %vec2, [5 x float]* %vec3) unnamed_addr #1 align 2 {
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
define void @math__normalise([5 x float]* %q) unnamed_addr #1 align 2 {
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

declare float @library__squareroot(float)

; Function Attrs: uwtable
define void @math__dircosine([5 x float]* %vecin, [5 x float]* %dcout) unnamed_addr #1 align 2 {
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
define void @math__multiply([5 x float]* %q1, [5 x float]* %q2, [5 x float]* %q3) unnamed_addr #1 align 2 {
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
define void @math__inverse([5 x float]* %q, [5 x float]* %qinv) unnamed_addr #1 align 2 {
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
define void @math__negate([5 x float]* %q) unnamed_addr #1 align 2 {
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
define void @math__guidecitransform([5 x float]* %dircosvar1, [5 x float]* %dircosvar2, [5 x float]* %dircosvar3, float %angr, float %angy, [5 x float]* %transformout) unnamed_addr #1 align 2 {
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

declare float @library__cosine(float)

declare float @library__sine(float)

; Function Attrs: uwtable
define void @math__genrates([5 x float]* %acclnvec, [5 x float]* %qp, [5 x float]* %cmdbrate) unnamed_addr #1 align 2 personality i8* bitcast (void ([5 x float]*, [5 x float]*, [5 x float]*)* @math__genrates to i8*) {
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

declare float @library__sininverse(float)

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #2

attributes #0 = { inlinehint uwtable "no-frame-pointer-elim-non-leaf"="true" }
attributes #1 = { uwtable "no-frame-pointer-elim-non-leaf"="true" }
attributes #2 = { argmemonly nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 7, !"PIE Level", i32 2}
