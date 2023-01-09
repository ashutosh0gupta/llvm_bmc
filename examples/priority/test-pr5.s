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
@main__step1 = unnamed_addr global i16 1
@main__combinederrorflag = unnamed_addr global i16 0
@main__stageflgc = unnamed_addr global i16 -1
@main__stageflg = unnamed_addr global i16 0
@main_E = unnamed_addr global i16 0
@major_cycle__check_var = unnamed_addr global i16 undef
@major_cycle__min2maj = global i16 undef
@major_cycle_E = unnamed_addr global i16 0
@minor_cycle_E = unnamed_addr global i16 0

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
define void @main__stageflags() local_unnamed_addr #0 align 2 {
entry:
  %0 = load i16, i16* @main__stageflg, align 2
  %1 = load i16, i16* @main__stageflgc, align 2
  %2 = add i16 %0, %1
  %3 = icmp eq i16 %2, -1
  br i1 %3, label %"3", label %"4"

"3":                                              ; preds = %entry
  store i16 0, i16* @main__step1, align 2
  br label %return

"4":                                              ; preds = %entry
  store i16 1, i16* @main__combinederrorflag, align 2
  br label %return

return:                                           ; preds = %"4", %"3"
  ret void
}

; Function Attrs: uwtable
define void @main__guid_minor() unnamed_addr #0 align 2 {
entry:
  call void @main__stageflags() #0
  call void @minor_cycle__stage3_minor()
  ret void
}

; Function Attrs: uwtable
define void @main__guid_major() unnamed_addr #0 align 2 {
entry:
  call void @major_cycle__stage3_major()
  ret void
}

; Function Attrs: uwtable
define void @major_cycle__stage3_major() #0 align 2 {
entry:
  %0 = load i16, i16* @major_cycle__min2maj, align 2
  %1 = icmp eq i16 %0, 1
  br i1 %1, label %"3", label %"4"

"3":                                              ; preds = %entry
  store i16 10, i16* @major_cycle__check_var, align 2
  br label %return

"4":                                              ; preds = %entry
  store i16 -10, i16* @major_cycle__check_var, align 2
  br label %return

return:                                           ; preds = %"4", %"3"
  ret void
}

; Function Attrs: uwtable
define void @minor_cycle__stage3_minor() #0 align 2 {
entry:
  store i16 1, i16* @major_cycle__min2maj, align 2
  ret void
}

attributes #0 = { uwtable "no-frame-pointer-elim-non-leaf"="true" }

!llvm.module.flags = !{!0}

!0 = !{i32 7, !"PIE Level", i32 2}
