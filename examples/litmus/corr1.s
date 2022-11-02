; ModuleID = './Examples/test/test-corr1/corr1.adb'
source_filename = "./Examples/test/test-corr1/corr1.adb"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64--linux-gnu"

module asm "\09.ident\09\22GCC: (Ubuntu 8.4.0-1ubuntu1~18.04) 8.4.0 LLVM: 6.0.0\22"

@corr1__x = unnamed_addr global i16 undef
@corr1_E = unnamed_addr global i16 0
@corr1__r = internal unnamed_addr global i16 undef
@corr1__s = internal unnamed_addr global i16 undef

; Function Attrs: uwtable
define void @corr1__thread_p0() unnamed_addr #0 align 2 {
entry:
  store i16 2, i16* @corr1__x, align 2
  ret void
}

; Function Attrs: uwtable
define void @corr1__thread_p1() unnamed_addr #0 align 2 {
entry:
  %0 = load i16, i16* @corr1__x, align 2
  store i16 %0, i16* @corr1__r, align 2
  %1 = load i16, i16* @corr1__x, align 2
  store i16 %1, i16* @corr1__s, align 2
  ret void
}

attributes #0 = { uwtable "no-frame-pointer-elim-non-leaf"="true" }

!llvm.module.flags = !{!0}

!0 = !{i32 7, !"PIE Level", i32 2}
