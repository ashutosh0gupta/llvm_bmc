; ModuleID = '../mayo_IR/mayo1.ll'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

; Function Attrs: inlinehint nounwind
define dso_local void @pqmayo_MAYO_1_ref_m_upper(ptr noundef %p, ptr noundef %in, ptr noundef %out, i32 noundef %size) local_unnamed_addr #0 {
entry:
  %0 = call i32 @llvm.smax.i32(i32 %size, i32 0)
  %exitcond1.not13 = icmp eq i32 0, %0
  br i1 %exitcond1.not13, label %for.end17, label %for.cond1.preheader.lr.ph

for.cond1.preheader.lr.ph:                        ; preds = %entry
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.lr.ph, %for.inc15
  %r.016 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc16, %for.inc15 ]
  %m_vecs_stored.015 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %m_vecs_stored.1.lcssa, %for.inc15 ]
  %indvars.iv14 = phi i32 [ %size, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next, %for.inc15 ]
  %1 = add i32 %m_vecs_stored.015, %indvars.iv14
  %exitcond.not10 = icmp eq i32 %m_vecs_stored.015, %1
  br i1 %exitcond.not10, label %for.inc15, label %for.body3.lr.ph

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  br label %for.body3

for.body3:                                        ; preds = %for.body3.lr.ph, %for.inc
  %c.012 = phi i32 [ %r.016, %for.body3.lr.ph ], [ %inc14, %for.inc ]
  %m_vecs_stored.111 = phi i32 [ %m_vecs_stored.015, %for.body3.lr.ph ], [ %inc, %for.inc ]
  %mul = mul nsw i32 %r.016, %size
  %add = add nsw i32 %mul, %c.012
  %add.ptr.idx = mul nsw i32 %add, 40
  %add.ptr = getelementptr inbounds i8, ptr %in, i32 %add.ptr.idx
  %add.ptr6.idx = mul nsw i32 %m_vecs_stored.111, 40
  %add.ptr6 = getelementptr inbounds i8, ptr %out, i32 %add.ptr6.idx
  br label %for.body.i

for.body.i:                                       ; preds = %for.body3, %for.body.i
  %i.0.i8 = phi i32 [ 0, %for.body3 ], [ %inc.i, %for.body.i ]
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %add.ptr, i32 %i.0.i8
  %2 = load i64, ptr %arrayidx.i, align 8
  %arrayidx1.i = getelementptr inbounds nuw i64, ptr %add.ptr6, i32 %i.0.i8
  store i64 %2, ptr %arrayidx1.i, align 8
  %inc.i = add nuw nsw i32 %i.0.i8, 1
  %exitcond.i.not = icmp eq i32 %inc.i, 5
  br i1 %exitcond.i.not, label %m_vec_copy.17.exit, label %for.body.i, !llvm.loop !5

m_vec_copy.17.exit:                               ; preds = %for.body.i
  %cmp7.not = icmp eq i32 %r.016, %c.012
  br i1 %cmp7.not, label %for.inc, label %if.then

if.then:                                          ; preds = %m_vec_copy.17.exit
  %mul8 = mul nsw i32 %c.012, %size
  %add9 = add nsw i32 %mul8, %r.016
  %add.ptr11.idx = mul nsw i32 %add9, 40
  %add.ptr11 = getelementptr inbounds i8, ptr %in, i32 %add.ptr11.idx
  %add.ptr13.idx = mul nsw i32 %m_vecs_stored.111, 40
  %add.ptr13 = getelementptr inbounds i8, ptr %out, i32 %add.ptr13.idx
  br label %for.body.i4

for.body.i4:                                      ; preds = %if.then, %for.body.i4
  %i.0.i29 = phi i32 [ 0, %if.then ], [ %inc.i7, %for.body.i4 ]
  %arrayidx.i5 = getelementptr inbounds nuw i64, ptr %add.ptr11, i32 %i.0.i29
  %3 = load i64, ptr %arrayidx.i5, align 8
  %arrayidx1.i6 = getelementptr inbounds nuw i64, ptr %add.ptr13, i32 %i.0.i29
  %4 = load i64, ptr %arrayidx1.i6, align 8
  %xor.i = xor i64 %4, %3
  store i64 %xor.i, ptr %arrayidx1.i6, align 8
  %inc.i7 = add nuw nsw i32 %i.0.i29, 1
  %exitcond.i3.not = icmp eq i32 %inc.i7, 5
  br i1 %exitcond.i3.not, label %for.inc.loopexit, label %for.body.i4, !llvm.loop !7

for.inc.loopexit:                                 ; preds = %for.body.i4
  br label %for.inc

for.inc:                                          ; preds = %for.inc.loopexit, %m_vec_copy.17.exit
  %inc = add i32 %m_vecs_stored.111, 1
  %inc14 = add nuw nsw i32 %c.012, 1
  %exitcond.not = icmp eq i32 %inc, %1
  br i1 %exitcond.not, label %for.cond1.for.inc15_crit_edge, label %for.body3, !llvm.loop !8

for.cond1.for.inc15_crit_edge:                    ; preds = %for.inc
  %split = phi i32 [ %inc, %for.inc ]
  br label %for.inc15

for.inc15:                                        ; preds = %for.cond1.for.inc15_crit_edge, %for.cond1.preheader
  %m_vecs_stored.1.lcssa = phi i32 [ %split, %for.cond1.for.inc15_crit_edge ], [ %m_vecs_stored.015, %for.cond1.preheader ]
  %inc16 = add nuw nsw i32 %r.016, 1
  %indvars.iv.next = add i32 %indvars.iv14, -1
  %exitcond1.not = icmp eq i32 %inc16, %0
  br i1 %exitcond1.not, label %for.cond.for.end17_crit_edge, label %for.cond1.preheader, !llvm.loop !9

for.cond.for.end17_crit_edge:                     ; preds = %for.inc15
  br label %for.end17

for.end17:                                        ; preds = %for.cond.for.end17_crit_edge, %entry
  ret void
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #1 {
entry:
  %p_buf = alloca [128 x i8], align 16
  call void @mayo_memset(ptr %p_buf, i8 0, i32 128)
  %P3 = alloca [320 x i64], align 16
  call void @mayo_memset(ptr %P3, i8 0, i32 2560)
  %P3_upper = alloca [180 x i64], align 16
  call void @mayo_memset(ptr %P3_upper, i8 0, i32 1440)
  call void @pqmayo_MAYO_1_ref_m_upper(ptr nonnull %p_buf, ptr nonnull %P3, ptr nonnull %P3_upper, i32 8)
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
  br label %for.cond, !llvm.loop !10

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
  br label %for.cond, !llvm.loop !11

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
!9 = distinct !{!9, !6}
!10 = distinct !{!10, !6}
!11 = distinct !{!11, !6}
