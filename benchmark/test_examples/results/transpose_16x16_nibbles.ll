; ModuleID = '../mayo_IR/mayo1.ll'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

; Function Attrs: inlinehint nounwind
define dso_local fastcc void @transpose_16x16_nibbles(ptr noundef nonnull %M) unnamed_addr #0 {
entry:
  br label %for.body

for.cond9.preheader:                              ; preds = %for.body
  br label %for.body11

for.body:                                         ; preds = %entry, %for.body
  %i.01 = phi i32 [ 0, %entry ], [ %add7, %for.body ]
  %arrayidx = getelementptr inbounds nuw i64, ptr %M, i32 %i.01
  %0 = load i64, ptr %arrayidx, align 8
  %shr = lshr i64 %0, 4
  %add = or disjoint i32 %i.01, 1
  %arrayidx1 = getelementptr inbounds nuw i64, ptr %M, i32 %add
  %1 = load i64, ptr %arrayidx1, align 8
  %xor = xor i64 %shr, %1
  %and = and i64 %xor, 1085102592571150095
  %shl = shl nuw i64 %and, 4
  %arrayidx2 = getelementptr inbounds nuw i64, ptr %M, i32 %i.01
  %2 = load i64, ptr %arrayidx2, align 8
  %xor3 = xor i64 %2, %shl
  store i64 %xor3, ptr %arrayidx2, align 8
  %add4 = or disjoint i32 %i.01, 1
  %arrayidx5 = getelementptr inbounds nuw i64, ptr %M, i32 %add4
  %3 = load i64, ptr %arrayidx5, align 8
  %xor6 = xor i64 %3, %and
  store i64 %xor6, ptr %arrayidx5, align 8
  %add7 = add nuw nsw i32 %i.01, 2
  %cmp = icmp samesign ult i32 %add7, 16
  br i1 %cmp, label %for.body, label %for.cond9.preheader, !llvm.loop !5

for.cond42.preheader:                             ; preds = %for.body11
  br label %for.body44

for.body11:                                       ; preds = %for.cond9.preheader, %for.body11
  %i8.02 = phi i32 [ 0, %for.cond9.preheader ], [ %add39, %for.body11 ]
  %arrayidx12 = getelementptr inbounds nuw i64, ptr %M, i32 %i8.02
  %4 = load i64, ptr %arrayidx12, align 8
  %shr13 = lshr i64 %4, 8
  %add14 = or disjoint i32 %i8.02, 2
  %arrayidx15 = getelementptr inbounds nuw i64, ptr %M, i32 %add14
  %5 = load i64, ptr %arrayidx15, align 8
  %xor16 = xor i64 %shr13, %5
  %and17 = and i64 %xor16, 71777214294589695
  %add18 = or disjoint i32 %i8.02, 1
  %arrayidx19 = getelementptr inbounds nuw i64, ptr %M, i32 %add18
  %6 = load i64, ptr %arrayidx19, align 8
  %shr20 = lshr i64 %6, 8
  %add21 = or disjoint i32 %i8.02, 3
  %arrayidx22 = getelementptr inbounds nuw i64, ptr %M, i32 %add21
  %7 = load i64, ptr %arrayidx22, align 8
  %xor23 = xor i64 %shr20, %7
  %and24 = and i64 %xor23, 71777214294589695
  %shl25 = shl nuw i64 %and17, 8
  %arrayidx26 = getelementptr inbounds nuw i64, ptr %M, i32 %i8.02
  %8 = load i64, ptr %arrayidx26, align 8
  %xor27 = xor i64 %8, %shl25
  store i64 %xor27, ptr %arrayidx26, align 8
  %shl28 = shl nuw i64 %and24, 8
  %add29 = or disjoint i32 %i8.02, 1
  %arrayidx30 = getelementptr inbounds nuw i64, ptr %M, i32 %add29
  %9 = load i64, ptr %arrayidx30, align 8
  %xor31 = xor i64 %9, %shl28
  store i64 %xor31, ptr %arrayidx30, align 8
  %add32 = or disjoint i32 %i8.02, 2
  %arrayidx33 = getelementptr inbounds nuw i64, ptr %M, i32 %add32
  %10 = load i64, ptr %arrayidx33, align 8
  %xor34 = xor i64 %10, %and17
  store i64 %xor34, ptr %arrayidx33, align 8
  %add35 = or disjoint i32 %i8.02, 3
  %arrayidx36 = getelementptr inbounds nuw i64, ptr %M, i32 %add35
  %11 = load i64, ptr %arrayidx36, align 8
  %xor37 = xor i64 %11, %and24
  store i64 %xor37, ptr %arrayidx36, align 8
  %add39 = add nuw nsw i32 %i8.02, 4
  %cmp10 = icmp samesign ult i32 %add39, 16
  br i1 %cmp10, label %for.body11, label %for.cond42.preheader, !llvm.loop !7

for.cond76.preheader:                             ; preds = %for.body44
  br label %for.body78

for.body44:                                       ; preds = %for.cond42.preheader, %for.body44
  %i41.03 = phi i32 [ 0, %for.cond42.preheader ], [ %inc, %for.body44 ]
  %arrayidx46 = getelementptr inbounds nuw i64, ptr %M, i32 %i41.03
  %12 = load i64, ptr %arrayidx46, align 8
  %shr47 = lshr i64 %12, 16
  %add48 = or disjoint i32 %i41.03, 4
  %arrayidx49 = getelementptr inbounds nuw i64, ptr %M, i32 %add48
  %13 = load i64, ptr %arrayidx49, align 8
  %xor50 = xor i64 %shr47, %13
  %and51 = and i64 %xor50, 281470681808895
  %add53 = or disjoint i32 %i41.03, 8
  %arrayidx54 = getelementptr inbounds nuw i64, ptr %M, i32 %add53
  %14 = load i64, ptr %arrayidx54, align 8
  %shr55 = lshr i64 %14, 16
  %add56 = or disjoint i32 %i41.03, 12
  %arrayidx57 = getelementptr inbounds nuw i64, ptr %M, i32 %add56
  %15 = load i64, ptr %arrayidx57, align 8
  %xor58 = xor i64 %shr55, %15
  %and59 = and i64 %xor58, 281470681808895
  %shl60 = shl nuw i64 %and51, 16
  %arrayidx61 = getelementptr inbounds nuw i64, ptr %M, i32 %i41.03
  %16 = load i64, ptr %arrayidx61, align 8
  %xor62 = xor i64 %16, %shl60
  store i64 %xor62, ptr %arrayidx61, align 8
  %shl63 = shl nuw i64 %and59, 16
  %add64 = or disjoint i32 %i41.03, 8
  %arrayidx65 = getelementptr inbounds nuw i64, ptr %M, i32 %add64
  %17 = load i64, ptr %arrayidx65, align 8
  %xor66 = xor i64 %17, %shl63
  store i64 %xor66, ptr %arrayidx65, align 8
  %add67 = or disjoint i32 %i41.03, 4
  %arrayidx68 = getelementptr inbounds nuw i64, ptr %M, i32 %add67
  %18 = load i64, ptr %arrayidx68, align 8
  %xor69 = xor i64 %18, %and51
  store i64 %xor69, ptr %arrayidx68, align 8
  %add70 = or disjoint i32 %i41.03, 12
  %arrayidx71 = getelementptr inbounds nuw i64, ptr %M, i32 %add70
  %19 = load i64, ptr %arrayidx71, align 8
  %xor72 = xor i64 %19, %and59
  store i64 %xor72, ptr %arrayidx71, align 8
  %inc = add nuw nsw i32 %i41.03, 1
  %exitcond.not = icmp eq i32 %inc, 4
  br i1 %exitcond.not, label %for.cond76.preheader, label %for.body44, !llvm.loop !8

for.body78:                                       ; preds = %for.cond76.preheader, %for.body78
  %i75.04 = phi i32 [ 0, %for.cond76.preheader ], [ %inc93, %for.body78 ]
  %arrayidx80 = getelementptr inbounds nuw i64, ptr %M, i32 %i75.04
  %20 = load i64, ptr %arrayidx80, align 8
  %shr81 = lshr i64 %20, 32
  %add82 = or disjoint i32 %i75.04, 8
  %arrayidx83 = getelementptr inbounds nuw i64, ptr %M, i32 %add82
  %21 = load i64, ptr %arrayidx83, align 8
  %.masked = and i64 %21, 4294967295
  %and85 = xor i64 %shr81, %.masked
  %shl86 = shl nuw i64 %and85, 32
  %arrayidx87 = getelementptr inbounds nuw i64, ptr %M, i32 %i75.04
  %22 = load i64, ptr %arrayidx87, align 8
  %xor88 = xor i64 %22, %shl86
  store i64 %xor88, ptr %arrayidx87, align 8
  %add89 = or disjoint i32 %i75.04, 8
  %arrayidx90 = getelementptr inbounds nuw i64, ptr %M, i32 %add89
  %23 = load i64, ptr %arrayidx90, align 8
  %xor91 = xor i64 %23, %and85
  store i64 %xor91, ptr %arrayidx90, align 8
  %inc93 = add nuw nsw i32 %i75.04, 1
  %exitcond1.not = icmp eq i32 %inc93, 8
  br i1 %exitcond1.not, label %for.end94, label %for.body78, !llvm.loop !9

for.end94:                                        ; preds = %for.body78
  ret void
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #1 {
entry:
  %A = alloca [800 x i64], align 16
  call void @mayo_memset(ptr %A, i8 0, i32 6400)
  call fastcc void @transpose_16x16_nibbles(ptr %A)
  ret i32 0
}

; Function Attrs: nounwind
define dso_local void @mayo_memset(ptr noundef %dst, i8 noundef zeroext %val, i32 noundef %len) local_unnamed_addr #2 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %exitcond = icmp ne i32 %i.0, %len
  br i1 %exitcond, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0
  store i8 %val, ptr %arrayidx, align 1
  %inc = add i32 %i.0, 1
  br label %for.cond, !llvm.loop !10

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind
define dso_local void @mayo_memcpy(ptr noundef %dst, ptr noundef %src, i32 noundef %len) local_unnamed_addr #2 {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %exitcond = icmp ne i32 %i.0, %len
  br i1 %exitcond, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %src, i32 %i.0
  %0 = load i8, ptr %arrayidx, align 1
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0
  store i8 %0, ptr %arrayidx1, align 1
  %inc = add i32 %i.0, 1
  br label %for.cond, !llvm.loop !11

for.end:                                          ; preds = %for.cond
  ret void
}

attributes #0 = { inlinehint nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #1 = { inlinehint }
attributes #2 = { nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }

!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3, !4}

!0 = !{!"Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)"}
!1 = !{i32 2, !"Debug Info Version", i32 3}
!2 = !{i32 1, !"wchar_size", i32 4}
!3 = !{i32 1, !"min_enum_size", i32 4}
!4 = !{i32 1, !"Code Model", i32 1}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
!7 = distinct !{!7, !6}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !6}
!10 = distinct !{!10, !6}
!11 = distinct !{!11, !6}
