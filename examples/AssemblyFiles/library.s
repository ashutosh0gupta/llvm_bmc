; ModuleID = '../Test/Examples/library.adb'
source_filename = "../Test/Examples/library.adb"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64--linux-gnu"

module asm "\09.ident\09\22GCC: (Ubuntu 8.3.0-26ubuntu1~18.04) 8.3.0 LLVM: 6.0.0\22"

@library_E = unnamed_addr global i16 0

; Function Attrs: uwtable
define float @library__absolute(float %x) unnamed_addr #0 align 2 {
entry:
  %0 = fcmp olt float %x, 0.000000e+00
  %1 = fsub float -0.000000e+00, %x
  %2 = select i1 %0, float %1, float %x
  ret float %2
}

; Function Attrs: uwtable
define float @library__cosine(float %x1) unnamed_addr #0 align 2 {
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

"21":                                             ; preds = %"17", %"14", %"15", %"20", %"19"
  %47 = phi float [ %46, %"20" ], [ %41, %"19" ], [ %29, %"15" ], [ %24, %"14" ], [ 1.000000e+00, %"17" ]
  %48 = icmp ne i8 %12, 0
  %49 = fsub float -0.000000e+00, %47
  %spec.select = select i1 %48, float %49, float %47
  ret float %spec.select
}

; Function Attrs: uwtable
define float @library__sine(float %x1) unnamed_addr #0 align 2 {
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

"21":                                             ; preds = %"16", %"17", %"14", %"20", %"19"
  %47 = phi float [ %46, %"20" ], [ %41, %"19" ], [ %33, %"17" ], [ %28, %"16" ], [ 1.000000e+00, %"14" ]
  %48 = icmp ne i8 %8, 0
  %49 = fsub float -0.000000e+00, %47
  %spec.select = select i1 %48, float %49, float %47
  ret float %spec.select
}

; Function Attrs: uwtable
define float @library__exponent(float %x1) unnamed_addr #0 align 2 {
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

"13":                                             ; preds = %"8", %"11", %entry, %"4", %"6"
  %23 = phi float [ %22, %"11" ], [ %21, %"8" ], [ 1.000000e+00, %entry ], [ 0x4005BF0AA0000000, %"4" ], [ 0x3FD78B5460000000, %"6" ]
  ret float %23
}

; Function Attrs: uwtable
define float @library__squareroot(float %x1) local_unnamed_addr #0 align 2 {
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

"14":                                             ; preds = %entry, %"4", %"7"
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
define float @library__sininverse(float %x1) unnamed_addr #0 align 2 {
entry:
  %0 = fcmp oeq float %x1, 0.000000e+00
  br i1 %0, label %"16", label %"4"

"4":                                              ; preds = %entry
  %1 = call float @fabsf(float %x1) #1
  %2 = fcmp ogt float %1, 1.000000e+00
  br i1 %2, label %"16", label %"6"

"6":                                              ; preds = %"4"
  %3 = fcmp oeq float %x1, 1.000000e+00
  br i1 %3, label %"16", label %"8"

"8":                                              ; preds = %"6"
  %4 = fcmp oeq float %x1, -1.000000e+00
  br i1 %4, label %"16", label %"10"

"10":                                             ; preds = %"8"
  %5 = fcmp olt float %x1, 0.000000e+00
  %6 = fsub float -0.000000e+00, %x1
  %7 = select i1 %5, i8 1, i8 0
  %8 = select i1 %5, float %6, float %x1
  %9 = fcmp oge float %8, 5.000000e-01
  br i1 %9, label %"13", label %"14"

"13":                                             ; preds = %"10"
  %10 = fsub float 1.000000e+00, %8
  %11 = fdiv float %10, 2.000000e+00
  %12 = call float @library__squareroot(float %11) #0
  br label %"14"

"14":                                             ; preds = %"13", %"10"
  %13 = phi i8 [ 1, %"13" ], [ 0, %"10" ]
  %14 = phi float [ %12, %"13" ], [ %8, %"10" ]
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
  br i1 %90, label %"15", label %"16"

"15":                                             ; preds = %"14"
  %91 = fmul float %89, 2.000000e+00
  %92 = fsub float 0x3FF921FB00000000, %91
  br label %"16"

"16":                                             ; preds = %"8", %"6", %"4", %entry, %"15", %"14"
  %93 = phi i8 [ %7, %"15" ], [ %7, %"14" ], [ undef, %entry ], [ undef, %"4" ], [ undef, %"6" ], [ undef, %"8" ]
  %94 = phi float [ %92, %"15" ], [ %89, %"14" ], [ 0.000000e+00, %entry ], [ 0.000000e+00, %"4" ], [ 0x3FF921FB00000000, %"6" ], [ 0xBFF921FB00000000, %"8" ]
  %95 = icmp ne i8 %93, 0
  %96 = fsub float -0.000000e+00, %94
  %spec.select = select i1 %95, float %96, float %94
  ret float %spec.select
}

declare float @fabsf(float)

; Function Attrs: uwtable
define float @library__taninverse(float %x1) unnamed_addr #0 align 2 {
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

"11":                                             ; preds = %entry, %"10", %"9", %"7"
  %30 = phi i8 [ %3, %"10" ], [ %3, %"9" ], [ %3, %"7" ], [ 0, %entry ]
  %31 = phi float [ %29, %"10" ], [ %21, %"9" ], [ %12, %"7" ], [ 0.000000e+00, %entry ]
  %32 = icmp ne i8 %30, 0
  %33 = fsub float -0.000000e+00, %31
  %spec.select = select i1 %32, float %33, float %31
  ret float %spec.select
}

attributes #0 = { uwtable "no-frame-pointer-elim-non-leaf"="true" }
attributes #1 = { nounwind readnone }

!llvm.module.flags = !{!0}

!0 = !{i32 7, !"PIE Level", i32 2}
