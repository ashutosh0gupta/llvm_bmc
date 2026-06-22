; ModuleID = '../mayo_IR/mayo1.ll'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

; Function Attrs: inlinehint nounwind
define dso_local fastcc void @decode(ptr noundef %m, ptr noundef %mdec, i32 noundef range(i32 -2147483567, -2147483648) %mdeclen) unnamed_addr #0 {
entry:
  %div = sdiv i32 %mdeclen, 2
  %cmp1 = icmp slt i32 0, %div
  br i1 %cmp1, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %i.03 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %mdec.addr.02 = phi ptr [ %mdec, %for.body.lr.ph ], [ %incdec.ptr5, %for.body ]
  %arrayidx = getelementptr inbounds nuw i8, ptr %m, i32 %i.03
  %0 = load i8, ptr %arrayidx, align 1
  %1 = and i8 %0, 15
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %mdec.addr.02, i32 1
  store i8 %1, ptr %mdec.addr.02, align 1
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %m, i32 %i.03
  %2 = load i8, ptr %arrayidx2, align 1
  %3 = lshr i8 %2, 4
  store i8 %3, ptr %incdec.ptr, align 1
  %incdec.ptr5 = getelementptr inbounds nuw i8, ptr %mdec.addr.02, i32 2
  %inc = add nuw nsw i32 %i.03, 1
  %exitcond = icmp ne i32 %inc, %div
  br i1 %exitcond, label %for.body, label %for.cond.for.end_crit_edge, !llvm.loop !5

for.cond.for.end_crit_edge:                       ; preds = %for.body
  %split = phi ptr [ %incdec.ptr5, %for.body ]
  br label %for.end

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %entry
  %mdec.addr.0.lcssa = phi ptr [ %split, %for.cond.for.end_crit_edge ], [ %mdec, %entry ]
  %i.0.lcssa = phi i32 [ %div, %for.cond.for.end_crit_edge ], [ 0, %entry ]
  %4 = and i32 %mdeclen, -2147483647
  %cmp6 = icmp eq i32 %4, 1
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %m, i32 %i.0.lcssa
  %5 = load i8, ptr %arrayidx8, align 1
  %6 = and i8 %5, 15
  store i8 %6, ptr %mdec.addr.0.lcssa, align 1
  br label %if.end

if.end:                                           ; preds = %if.then, %for.end
  ret void
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #1 {
entry:
  %m_buf = alloca [128 x i8], align 16
  call void @mayo_memset(ptr %m_buf, i8 0, i32 128)
  %s = alloca [860 x i8], align 16
  call void @mayo_memset(ptr %s, i8 0, i32 860)
  call fastcc void @decode(ptr nonnull %m_buf, ptr nonnull %s, i32 860)
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
