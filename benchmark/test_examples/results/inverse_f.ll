; ModuleID = 'mayo_IR/mayo1.ll'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

@pqmayo_MAYO_1_ref_unsigned_char_blocker = dso_local global i8 0, align 1

; Function Attrs: inlinehint nounwind
define dso_local fastcc zeroext range(i8 0, 16) i8 @inverse_f(i8 noundef zeroext range(i8 0, 16) %a) unnamed_addr #0 {
entry:
  %0 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1
  %xor1.i = xor i8 %a, %0
  %1 = trunc i8 %xor1.i to i1
  %2 = and i8 %xor1.i, 2
  %mul9.i = mul nuw nsw i8 %2, %a
  %conv10.i = select i1 %1, i8 %a, i8 0
  %xor11.i = xor i8 %conv10.i, %mul9.i
  %3 = and i8 %xor1.i, 4
  %mul16.i = mul nuw nsw i8 %3, %a
  %xor18.i = xor i8 %mul16.i, %xor11.i
  %4 = and i8 %xor1.i, 8
  %mul23.i = mul nuw nsw i8 %4, %a
  %xor25.i = xor i8 %mul23.i, %xor18.i
  %5 = lshr i8 %xor25.i, 4
  %6 = lshr i8 %xor25.i, 3
  %7 = and i8 %6, 14
  %8 = xor i8 %5, %7
  %xor25.masked.i = and i8 %xor25.i, 15
  %9 = xor i8 %8, %xor25.masked.i
  %10 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1
  %xor1.i19 = xor i8 %9, %10
  %11 = trunc i8 %xor1.i19 to i1
  %12 = and i8 %xor1.i19, 2
  %mul9.i20 = mul nuw nsw i8 %12, %9
  %conv10.i21 = select i1 %11, i8 %9, i8 0
  %xor11.i22 = xor i8 %conv10.i21, %mul9.i20
  %13 = and i8 %xor1.i19, 4
  %mul16.i23 = mul nuw nsw i8 %13, %9
  %xor18.i24 = xor i8 %mul16.i23, %xor11.i22
  %14 = and i8 %xor1.i19, 8
  %mul23.i25 = mul nuw nsw i8 %14, %9
  %xor25.i26 = xor i8 %mul23.i25, %xor18.i24
  %15 = lshr i8 %xor25.i26, 4
  %16 = lshr i8 %xor25.i26, 3
  %17 = and i8 %16, 14
  %18 = xor i8 %15, %17
  %xor25.masked.i27 = and i8 %xor25.i26, 15
  %19 = xor i8 %18, %xor25.masked.i27
  %20 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1
  %xor1.i1 = xor i8 %19, %20
  %21 = trunc i8 %xor1.i1 to i1
  %22 = and i8 %xor1.i1, 2
  %mul9.i2 = mul nuw nsw i8 %22, %19
  %conv10.i3 = select i1 %21, i8 %19, i8 0
  %xor11.i4 = xor i8 %conv10.i3, %mul9.i2
  %23 = and i8 %xor1.i1, 4
  %mul16.i5 = mul nuw nsw i8 %23, %19
  %xor18.i6 = xor i8 %mul16.i5, %xor11.i4
  %24 = and i8 %xor1.i1, 8
  %mul23.i7 = mul nuw nsw i8 %24, %19
  %xor25.i8 = xor i8 %mul23.i7, %xor18.i6
  %25 = lshr i8 %xor25.i8, 4
  %26 = lshr i8 %xor25.i8, 3
  %27 = and i8 %26, 14
  %28 = xor i8 %25, %27
  %xor25.masked.i9 = and i8 %xor25.i8, 15
  %29 = xor i8 %28, %xor25.masked.i9
  %30 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1
  %xor1.i28 = xor i8 %9, %30
  %31 = trunc i8 %xor1.i28 to i1
  %32 = and i8 %xor1.i28, 2
  %mul9.i29 = mul nuw nsw i8 %32, %19
  %conv10.i30 = select i1 %31, i8 %19, i8 0
  %xor11.i31 = xor i8 %conv10.i30, %mul9.i29
  %33 = and i8 %xor1.i28, 4
  %mul16.i32 = mul nuw nsw i8 %33, %19
  %xor18.i33 = xor i8 %mul16.i32, %xor11.i31
  %34 = and i8 %xor1.i28, 8
  %mul23.i34 = mul nuw nsw i8 %34, %19
  %xor25.i35 = xor i8 %mul23.i34, %xor18.i33
  %35 = lshr i8 %xor25.i35, 4
  %36 = lshr i8 %xor25.i35, 3
  %37 = and i8 %36, 14
  %38 = xor i8 %35, %37
  %xor25.masked.i36 = and i8 %xor25.i35, 15
  %39 = xor i8 %38, %xor25.masked.i36
  %40 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1
  %xor1.i10 = xor i8 %29, %40
  %41 = trunc i8 %xor1.i10 to i1
  %42 = and i8 %xor1.i10, 2
  %mul9.i11 = mul nuw nsw i8 %42, %39
  %conv10.i12 = select i1 %41, i8 %39, i8 0
  %xor11.i13 = xor i8 %conv10.i12, %mul9.i11
  %43 = and i8 %xor1.i10, 4
  %mul16.i14 = mul nuw nsw i8 %43, %39
  %xor18.i15 = xor i8 %mul16.i14, %xor11.i13
  %44 = and i8 %xor1.i10, 8
  %mul23.i16 = mul nuw nsw i8 %44, %39
  %xor25.i17 = xor i8 %mul23.i16, %xor18.i15
  %45 = lshr i8 %xor25.i17, 4
  %46 = lshr i8 %xor25.i17, 3
  %47 = and i8 %46, 14
  %48 = xor i8 %45, %47
  %xor25.masked.i18 = and i8 %xor25.i17, 15
  %49 = xor i8 %48, %xor25.masked.i18
  ret i8 %49
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #1 {
entry:
  %0 = call fastcc i8 @inverse_f(i8 0)
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
  br label %for.cond, !llvm.loop !5

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
  br label %for.cond, !llvm.loop !7

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
