; ModuleID = '../mayo_IR/mayo1.ll'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

; Function Attrs: inlinehint nounwind
define dso_local fastcc void @ef_pack_m_vec(ptr noundef %in, ptr noundef nonnull %out, i32 noundef range(i32 -2147483647, -2147483648) %ncols) unnamed_addr #0 {
entry:
  %cmp1 = icmp slt i32 1, %ncols
  br i1 %cmp1, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %i.02 = phi i32 [ 0, %for.body.lr.ph ], [ %add8, %for.body ]
  %arrayidx = getelementptr inbounds nuw i8, ptr %in, i32 %i.02
  %0 = load i8, ptr %arrayidx, align 1
  %add2 = or disjoint i32 %i.02, 1
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %in, i32 %add2
  %1 = load i8, ptr %arrayidx3, align 1
  %shl5 = shl i8 %1, 4
  %or = or i8 %shl5, %0
  %div = lshr exact i32 %i.02, 1
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %out, i32 %div
  store i8 %or, ptr %arrayidx7, align 1
  %add8 = add nuw nsw i32 %i.02, 2
  %add = or disjoint i32 %add8, 1
  %cmp = icmp slt i32 %add, %ncols
  br i1 %cmp, label %for.body, label %for.cond.for.end_crit_edge, !llvm.loop !5

for.cond.for.end_crit_edge:                       ; preds = %for.body
  %split = phi i32 [ %add8, %for.body ]
  br label %for.end

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %entry
  %i.0.lcssa = phi i32 [ %split, %for.cond.for.end_crit_edge ], [ 0, %entry ]
  %2 = and i32 %ncols, -2147483647
  %cmp9 = icmp eq i32 %2, 1
  br i1 %cmp9, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %in, i32 %i.0.lcssa
  %3 = load i8, ptr %arrayidx12, align 1
  %div16 = lshr exact i32 %i.0.lcssa, 1
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %out, i32 %div16
  store i8 %3, ptr %arrayidx17, align 1
  br label %if.end

if.end:                                           ; preds = %if.then, %for.end
  ret void
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #1 {
entry:
  %A = alloca [6480 x i8], align 16
  call void @mayo_memset(ptr %A, i8 0, i32 6480)
  %packed_A = alloca [468 x i64], align 16
  call void @mayo_memset(ptr %packed_A, i8 0, i32 3744)
  call fastcc void @ef_pack_m_vec(ptr nonnull %A, ptr %packed_A, i32 81)
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
