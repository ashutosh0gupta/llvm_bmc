; ModuleID = './Examples/test/test-iriw/iriw.adb'
source_filename = "./Examples/test/test-iriw/iriw.adb"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64--linux-gnu"

module asm "\09.ident\09\22GCC: (Ubuntu 8.4.0-1ubuntu1~18.04) 8.4.0 LLVM: 6.0.0\22"

@iriw__y = unnamed_addr global i16 undef
@iriw__x = unnamed_addr global i16 undef
@iriw_E = unnamed_addr global i16 0
@iriw__r = internal unnamed_addr global i16 undef
@iriw__s = internal unnamed_addr global i16 undef
@iriw__t = internal unnamed_addr global i16 undef
@iriw__u = internal unnamed_addr global i16 undef

; Function Attrs: uwtable
define void @iriw__thread_p0() unnamed_addr #0 align 2 {
entry:
  store i16 1, i16* @iriw__x, align 2
  ret void
}

; Function Attrs: uwtable
define void @iriw__thread_p1() unnamed_addr #0 align 2 {
entry:
  store i16 1, i16* @iriw__y, align 2
  ret void
}

; Function Attrs: uwtable
define void @iriw__thread_p2() unnamed_addr #0 align 2 {
entry:
  %0 = load i16, i16* @iriw__y, align 2
  store i16 %0, i16* @iriw__r, align 2
  %1 = load i16, i16* @iriw__x, align 2
  store i16 %1, i16* @iriw__s, align 2
  ret void
}

; Function Attrs: uwtable
define void @iriw__thread_p3() unnamed_addr #0 align 2 {
entry:
  %0 = load i16, i16* @iriw__y, align 2
  store i16 %0, i16* @iriw__t, align 2
  %1 = load i16, i16* @iriw__x, align 2
  store i16 %1, i16* @iriw__u, align 2
  ret void
}

attributes #0 = { uwtable "no-frame-pointer-elim-non-leaf"="true" }

!llvm.module.flags = !{!0}

!0 = !{i32 7, !"PIE Level", i32 2}
