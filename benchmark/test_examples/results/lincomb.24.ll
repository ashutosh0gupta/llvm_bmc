; ModuleID = 'mayo_IR/mayo1.ll'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

@pqmayo_MAYO_1_ref_unsigned_char_blocker = dso_local global i8 0, align 1

; Function Attrs: inlinehint nounwind
define dso_local fastcc zeroext range(i8 0, 16) i8 @lincomb.24(ptr noundef %a, ptr noundef %b, i32 noundef range(i32 -2147483647, -2147483648) %n, i32 noundef %m) unnamed_addr #0 {
entry:
  %0 = call i32 @llvm.smax.i32(i32 %n, i32 0)
  %exitcond.not2 = icmp eq i32 0, %0
  br i1 %exitcond.not2, label %for.end, label %for.body.lr.ph

for.body.lr.ph:                                   ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %i.05 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %b.addr.04 = phi ptr [ %b, %for.body.lr.ph ], [ %add.ptr, %for.body ]
  %ret.03 = phi i8 [ 0, %for.body.lr.ph ], [ %xor1.i, %for.body ]
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %i.05
  %1 = load i8, ptr %arrayidx, align 1
  %2 = load i8, ptr %b.addr.04, align 1
  %3 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1
  %xor1.i1 = xor i8 %1, %3
  %4 = trunc i8 %xor1.i1 to i1
  %5 = and i8 %xor1.i1, 2
  %mul9.i = mul i8 %5, %2
  %conv10.i = select i1 %4, i8 %2, i8 0
  %xor11.i = xor i8 %conv10.i, %mul9.i
  %6 = and i8 %xor1.i1, 4
  %mul16.i = mul i8 %6, %2
  %xor18.i = xor i8 %mul16.i, %xor11.i
  %7 = and i8 %xor1.i1, 8
  %mul23.i = mul i8 %7, %2
  %xor25.i = xor i8 %mul23.i, %xor18.i
  %8 = lshr i8 %xor25.i, 4
  %9 = lshr i8 %xor25.i, 3
  %10 = and i8 %9, 14
  %11 = xor i8 %8, %10
  %xor25.masked.i = and i8 %xor25.i, 15
  %12 = xor i8 %11, %xor25.masked.i
  %xor1.i = xor i8 %12, %ret.03
  %inc = add nuw nsw i32 %i.05, 1
  %add.ptr = getelementptr inbounds nuw i8, ptr %b.addr.04, i32 1
  %exitcond.not = icmp eq i32 %inc, %0
  br i1 %exitcond.not, label %for.cond.for.end_crit_edge, label %for.body, !llvm.loop !5

for.cond.for.end_crit_edge:                       ; preds = %for.body
  %split = phi i8 [ %xor1.i, %for.body ]
  br label %for.end

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %entry
  %ret.0.lcssa = phi i8 [ %split, %for.cond.for.end_crit_edge ], [ 0, %entry ]
  ret i8 %ret.0.lcssa
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #1 {
entry:
  %a_buf = alloca [128 x i8], align 16
  call void @mayo_memset(ptr %a_buf, i8 0, i32 128)
  %r = alloca [81 x i8], align 16
  call void @mayo_memset(ptr %r, i8 0, i32 81)
  %0 = call fastcc i8 @lincomb.24(ptr nonnull %a_buf, ptr nonnull %r, i32 81, i32 1)
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #2

; Function Attrs: nounwind
define dso_local void @mayo_memset(ptr noundef %dst, i8 noundef zeroext %val, i32 noundef %len) local_unnamed_addr #3 {
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
  br label %for.cond, !llvm.loop !7

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind
define dso_local void @mayo_memcpy(ptr noundef %dst, ptr noundef %src, i32 noundef %len) local_unnamed_addr #3 {
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
  br label %for.cond, !llvm.loop !8

for.end:                                          ; preds = %for.cond
  ret void
}

attributes #0 = { inlinehint nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #1 = { inlinehint }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }

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
