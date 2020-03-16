; ModuleID = '../Test/Examples/obclib.adb'
source_filename = "../Test/Examples/obclib.adb"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64--linux-gnu"

module asm "\09.ident\09\22GCC: (Ubuntu 8.3.0-26ubuntu1~18.04) 8.3.0 LLVM: 6.0.0\22"

@obclib_E = unnamed_addr global i16 0

; Function Attrs: uwtable
define zeroext i16 @obclib__bit_and(i16 zeroext %value1, i16 zeroext %value2) unnamed_addr #0 align 2 {
entry:
  %0 = and i16 %value1, %value2
  ret i16 %0
}

; Function Attrs: uwtable
define zeroext i16 @obclib__bit_or(i16 zeroext %value1, i16 zeroext %value2) unnamed_addr #0 align 2 {
entry:
  %0 = or i16 %value1, %value2
  ret i16 %0
}

; Function Attrs: uwtable
define zeroext i16 @obclib__bit_xor(i16 zeroext %value1, i16 zeroext %value2) unnamed_addr #0 align 2 {
entry:
  %0 = xor i16 %value1, %value2
  ret i16 %0
}

; Function Attrs: uwtable
define zeroext i16 @obclib__bit_not(i16 zeroext %value) unnamed_addr #0 align 2 {
entry:
  %not = xor i16 %value, -1
  ret i16 %not
}

attributes #0 = { uwtable "no-frame-pointer-elim-non-leaf"="true" }

!llvm.module.flags = !{!0}

!0 = !{i32 7, !"PIE Level", i32 2}
