; ModuleID = '../mayo_IR/mayo1.ll'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

@pqmayo_MAYO_1_ref_unsigned_char_blocker = dso_local global i8 0, align 1

; Function Attrs: inlinehint nounwind
define dso_local fastcc zeroext range(i8 0, 16) i8 @lincomb(ptr noundef nonnull %a, ptr noundef nonnull %b, i32 noundef %n, i32 noundef %m) unnamed_addr #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %i.04 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %b.addr.03 = phi ptr [ %b, %entry ], [ %add.ptr, %for.body ]
  %ret.02 = phi i8 [ 0, %entry ], [ %xor1.i, %for.body ]
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %i.04
  %0 = load i8, ptr %arrayidx, align 1
  %1 = load i8, ptr %b.addr.03, align 1
  %2 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1
  %xor1.i1 = xor i8 %0, %2
  %3 = trunc i8 %xor1.i1 to i1
  %4 = and i8 %xor1.i1, 2
  %mul9.i = mul i8 %4, %1
  %conv10.i = select i1 %3, i8 %1, i8 0
  %xor11.i = xor i8 %conv10.i, %mul9.i
  %5 = and i8 %xor1.i1, 4
  %mul16.i = mul i8 %5, %1
  %xor18.i = xor i8 %mul16.i, %xor11.i
  %6 = and i8 %xor1.i1, 8
  %mul23.i = mul i8 %6, %1
  %xor25.i = xor i8 %mul23.i, %xor18.i
  %7 = lshr i8 %xor25.i, 4
  %8 = lshr i8 %xor25.i, 3
  %9 = and i8 %8, 14
  %10 = xor i8 %7, %9
  %xor25.masked.i = and i8 %xor25.i, 15
  %11 = xor i8 %10, %xor25.masked.i
  %xor1.i = xor i8 %11, %ret.02
  %inc = add nuw nsw i32 %i.04, 1
  %add.ptr = getelementptr inbounds nuw i8, ptr %b.addr.03, i32 1
  %exitcond.not = icmp eq i32 %inc, 8
  br i1 %exitcond.not, label %for.end, label %for.body, !llvm.loop !5

for.end:                                          ; preds = %for.body
  %ret.0.lcssa = phi i8 [ %xor1.i, %for.body ]
  ret i8 %ret.0.lcssa
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #1 {
entry:
  %a_buf = alloca [128 x i8], align 16
  call void @mayo_memset(ptr %a_buf, i8 0, i32 128)
  %x = alloca [860 x i8], align 16
  call void @mayo_memset(ptr %x, i8 0, i32 860)
  %0 = call fastcc i8 @lincomb(ptr %a_buf, ptr %x, i32 8, i32 1)
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
  br label %for.cond, !llvm.loop !7

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
  br label %for.cond, !llvm.loop !8

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
