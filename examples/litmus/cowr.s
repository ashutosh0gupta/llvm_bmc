; ModuleID = './Examples/test/test-cowr/cowr.adb'
source_filename = "./Examples/test/test-cowr/cowr.adb"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64--linux-gnu"

module asm "\09.ident\09\22GCC: (Ubuntu 8.4.0-1ubuntu1~18.04) 8.4.0 LLVM: 6.0.0\22"

@cowr__x = unnamed_addr global i16 undef
@cowr_E = unnamed_addr global i16 0
@cowr__r = internal unnamed_addr global i16 undef

; Function Attrs: uwtable
define void @cowr__thread_p0() unnamed_addr #0 align 2 {
entry:
  store i16 1, i16* @cowr__x, align 2
  store i16 1, i16* @cowr__r, align 2
  ret void
}

; Function Attrs: uwtable
define void @cowr__thread_p1() unnamed_addr #0 align 2 {
entry:
  store i16 2, i16* @cowr__x, align 2
  ret void
}

attributes #0 = { uwtable "no-frame-pointer-elim-non-leaf"="true" }

!llvm.module.flags = !{!0}

!0 = !{i32 7, !"PIE Level", i32 2}
