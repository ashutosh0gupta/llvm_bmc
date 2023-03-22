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

@obclib_E = unnamed_addr global i16 0
@main__errorflag = global i16 0
@main_E = unnamed_addr global i16 0
@thr1__var21c = unnamed_addr global i16 undef
@thr1__var21 = unnamed_addr global i16 undef
@thr1_E = unnamed_addr global i16 0
@thr2__var12c = global i16 undef
@thr2__var12 = global i16 undef
@thr2_E = unnamed_addr global i16 0

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
define i32 @obclib__lbit_xor(i32 %value1, i32 %value2) unnamed_addr #0 align 2 {
entry:
  %0 = xor i32 %value1, %value2
  ret i32 %0
}

; Function Attrs: uwtable
define zeroext i16 @obclib__bit_not(i16 zeroext %value) unnamed_addr #0 align 2 {
entry:
  %not = xor i16 %value, -1
  ret i16 %not
}

; Function Attrs: uwtable
define zeroext i16 @obclib__ushift_left(i16 zeroext %value, i16 zeroext %amount) unnamed_addr #0 align 2 {
entry:
  %0 = icmp ule i16 %amount, 15
  %1 = zext i16 %amount to i32
  %2 = shl i16 %value, %amount
  %3 = select i1 %0, i16 %2, i16 0
  ret i16 %3
}

; Function Attrs: uwtable
define zeroext i16 @obclib__ushift_right(i16 zeroext %value, i16 zeroext %amount) unnamed_addr #0 align 2 {
entry:
  %0 = icmp ule i16 %amount, 15
  %1 = zext i16 %amount to i32
  %2 = lshr i16 %value, %amount
  %3 = select i1 %0, i16 %2, i16 0
  ret i16 %3
}

; Function Attrs: uwtable
define void @main__thr1_driver() unnamed_addr #0 align 2 {
entry:
  call void @thr1__thr1proc()
  ret void
}

; Function Attrs: uwtable
define void @main__thr2_driver() unnamed_addr #0 align 2 {
entry:
  call void @thr2__thr2proc()
  ret void
}

; Function Attrs: uwtable
define void @thr1__thr1proc() #0 align 2 {
entry:
  store i16 17476, i16* @thr2__var12, align 2
  store i16 -17477, i16* @thr2__var12c, align 2
  ret void
}

; Function Attrs: uwtable
define void @thr2__thr2proc() #0 align 2 {
entry:
  %0 = load i16, i16* @thr2__var12, align 2
  %1 = load i16, i16* @thr2__var12c, align 2
  %2 = add i16 %0, %1
  %3 = icmp ne i16 %2, -1
  br i1 %3, label %"3", label %return

"3":                                              ; preds = %entry
  store i16 1, i16* @main__errorflag, align 2
  br label %return

return:                                           ; preds = %"3", %entry
  ret void
}

attributes #0 = { uwtable "no-frame-pointer-elim-non-leaf"="true" }

!llvm.module.flags = !{!0}

!0 = !{i32 7, !"PIE Level", i32 2}
