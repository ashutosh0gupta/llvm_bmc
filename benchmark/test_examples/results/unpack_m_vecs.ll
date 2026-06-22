; ModuleID = '../mayo_IR/mayo1.ll'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

; Function Attrs: inlinehint nounwind
define dso_local void @mayo_memset(ptr noundef %dst, i8 noundef zeroext %val, i32 noundef %len) local_unnamed_addr #0 {
entry:
  %exitcond.not1 = icmp eq i32 0, %len
  br i1 %exitcond.not1, label %for.end, label %for.body.lr.ph

for.body.lr.ph:                                   ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %i.02 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %arrayidx = getelementptr inbounds nuw i8, ptr %dst, i32 %i.02
  store i8 %val, ptr %arrayidx, align 1
  %inc = add nuw i32 %i.02, 1
  %exitcond.not = icmp eq i32 %inc, %len
  br i1 %exitcond.not, label %for.cond.for.end_crit_edge, label %for.body, !llvm.loop !5

for.cond.for.end_crit_edge:                       ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %entry
  ret void
}

declare dso_local ptr @memcpy(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: inlinehint nounwind
define dso_local fastcc void @unpack_m_vecs(ptr noundef %in, ptr noundef %out, i32 noundef range(i32 36, 3706) %vecs, i32 noundef %m) unnamed_addr #0 {
entry:
  %tmp = alloca [5 x i64], align 8
  br label %for.body.i

for.cond.preheader:                               ; preds = %for.body.i
  br label %for.body

for.body.i:                                       ; preds = %entry, %for.body.i
  %i.0.i1 = phi i32 [ 0, %entry ], [ %inc.i, %for.body.i ]
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %tmp, i32 %i.0.i1
  store i8 0, ptr %arrayidx.i, align 1
  %inc.i = add nuw nsw i32 %i.0.i1, 1
  %exitcond.i.not = icmp eq i32 %inc.i, 40
  br i1 %exitcond.i.not, label %for.cond.preheader, label %for.body.i, !llvm.loop !7

for.body:                                         ; preds = %for.cond.preheader, %for.body
  %i.0.in2 = phi i32 [ %vecs, %for.cond.preheader ], [ %i.0, %for.body ]
  %i.0 = add nsw i32 %i.0.in2, -1
  %div1 = mul nsw i32 %i.0, 39
  %add.ptr = getelementptr inbounds i8, ptr %in, i32 %div1
  %call = call ptr @memcpy(ptr noundef nonnull %tmp, ptr noundef %add.ptr, i32 noundef 39) #4
  %mul4 = mul nsw i32 %i.0, 40
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %out, i32 %mul4
  %call8 = call ptr @memcpy(ptr noundef %add.ptr5, ptr noundef nonnull %tmp, i32 noundef 40) #4
  %cmp = icmp sgt i32 %i.0, 0
  br i1 %cmp, label %for.body, label %for.end, !llvm.loop !8

for.end:                                          ; preds = %for.body
  ret void
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #2 {
entry:
  %in_buf = alloca [128 x i8], align 16
  call void @mayo_memset(ptr %in_buf, i8 0, i32 128)
  %epk = alloca [18705 x i64], align 16
  call void @mayo_memset(ptr %epk, i8 0, i32 149640)
  call fastcc void @unpack_m_vecs(ptr nonnull %in_buf, ptr nonnull %epk, i32 36, i32 78)
  ret i32 0
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
  br label %for.cond, !llvm.loop !9

for.end:                                          ; preds = %for.cond
  ret void
}

attributes #0 = { inlinehint nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #1 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #2 = { inlinehint }
attributes #3 = { nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #4 = { nobuiltin nounwind "no-builtins" }

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
