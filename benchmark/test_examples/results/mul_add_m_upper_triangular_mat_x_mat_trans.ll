; ModuleID = '../mayo_IR/mayo1.ll'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

; Function Attrs: inlinehint nounwind
define dso_local fastcc void @mul_add_m_upper_triangular_mat_x_mat_trans(i32 noundef %m_vec_limbs, ptr noundef nonnull %bs_mat, ptr noundef nonnull %mat, ptr noundef nonnull %acc, i32 noundef %bs_mat_rows, i32 noundef %bs_mat_cols, i32 noundef %mat_rows, i32 noundef %triangular) unnamed_addr #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.inc17
  %r.08 = phi i32 [ 0, %entry ], [ %inc18, %for.inc17 ]
  %bs_mat_entries_used.07 = phi i32 [ 0, %entry ], [ %split, %for.inc17 ]
  %indvars.iv6 = phi i32 [ 78, %entry ], [ %indvars.iv.next, %for.inc17 ]
  %0 = add i32 %bs_mat_entries_used.07, %indvars.iv6
  br label %for.cond4.preheader.lr.ph

for.cond4.preheader.lr.ph:                        ; preds = %for.cond1.preheader
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.cond4.preheader.lr.ph, %for.inc15
  %c.05 = phi i32 [ %r.08, %for.cond4.preheader.lr.ph ], [ %inc, %for.inc15 ]
  %bs_mat_entries_used.14 = phi i32 [ %bs_mat_entries_used.07, %for.cond4.preheader.lr.ph ], [ %add14, %for.inc15 ]
  br label %for.body6

for.body6:                                        ; preds = %for.cond4.preheader, %m_vec_mul_add.exit
  %k.02 = phi i32 [ 0, %for.cond4.preheader ], [ %add13, %m_vec_mul_add.exit ]
  %add.ptr.idx = mul nsw i32 %bs_mat_entries_used.14, 40
  %add.ptr = getelementptr inbounds i8, ptr %bs_mat, i32 %add.ptr.idx
  %mul8 = mul nuw nsw i32 %k.02, 78
  %1 = getelementptr i8, ptr %mat, i32 %mul8
  %arrayidx = getelementptr i8, ptr %1, i32 %c.05
  %2 = load i8, ptr %arrayidx, align 1
  %mul9 = mul nuw nsw i32 %r.08, 10
  %add10 = add nuw nsw i32 %mul9, %k.02
  %add.ptr12.idx = mul nuw nsw i32 %add10, 40
  %add.ptr12 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx
  %conv.i.i = zext i8 %2 to i32
  %mul.i.i = mul i32 %conv.i.i, 134480385
  %and.i.i = and i32 %mul.i.i, -252645136
  %shr.i.i = lshr exact i32 %and.i.i, 4
  %shr1.i.i = lshr exact i32 %and.i.i, 3
  %3 = xor i32 %shr.i.i, %shr1.i.i
  %xor2.i.i = xor i32 %3, %mul.i.i
  br label %for.body.i

for.body.i:                                       ; preds = %for.body6, %for.body.i
  %i.0.i1 = phi i32 [ 0, %for.body6 ], [ %inc.i, %for.body.i ]
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %add.ptr, i32 %i.0.i1
  %4 = load i64, ptr %arrayidx.i, align 8
  %and.i = and i64 %4, 1229782938247303441
  %and1.i = and i32 %xor2.i.i, 255
  %conv.i = zext nneg i32 %and1.i to i64
  %mul.i = mul i64 %and.i, %conv.i
  %shr.i = lshr i64 %4, 1
  %and3.i = and i64 %shr.i, 1229782938247303441
  %shr4.i = lshr i32 %xor2.i.i, 8
  %and5.i = and i32 %shr4.i, 15
  %conv6.i = zext nneg i32 %and5.i to i64
  %mul7.i = mul nuw i64 %and3.i, %conv6.i
  %xor.i = xor i64 %mul.i, %mul7.i
  %arrayidx8.i = getelementptr inbounds nuw i64, ptr %add.ptr, i32 %i.0.i1
  %5 = load i64, ptr %arrayidx8.i, align 8
  %shr9.i = lshr i64 %5, 2
  %and10.i = and i64 %shr9.i, 1229782938247303441
  %shr11.i = lshr i32 %xor2.i.i, 16
  %and12.i = and i32 %shr11.i, 15
  %conv13.i = zext nneg i32 %and12.i to i64
  %mul14.i = mul nuw i64 %and10.i, %conv13.i
  %xor15.i = xor i64 %xor.i, %mul14.i
  %arrayidx16.i = getelementptr inbounds nuw i64, ptr %add.ptr, i32 %i.0.i1
  %6 = load i64, ptr %arrayidx16.i, align 8
  %shr17.i = lshr i64 %6, 3
  %and18.i = and i64 %shr17.i, 1229782938247303441
  %shr19.i = lshr i32 %xor2.i.i, 24
  %and20.i = and i32 %shr19.i, 15
  %conv21.i = zext nneg i32 %and20.i to i64
  %mul22.i = mul nuw i64 %and18.i, %conv21.i
  %xor23.i = xor i64 %xor15.i, %mul22.i
  %arrayidx24.i = getelementptr inbounds nuw i64, ptr %add.ptr12, i32 %i.0.i1
  %7 = load i64, ptr %arrayidx24.i, align 8
  %xor25.i = xor i64 %7, %xor23.i
  store i64 %xor25.i, ptr %arrayidx24.i, align 8
  %inc.i = add nuw nsw i32 %i.0.i1, 1
  %exitcond.i.not = icmp eq i32 %inc.i, 5
  br i1 %exitcond.i.not, label %m_vec_mul_add.exit, label %for.body.i, !llvm.loop !5

m_vec_mul_add.exit:                               ; preds = %for.body.i
  %add13 = add nuw nsw i32 %k.02, 1
  %exitcond.not = icmp eq i32 %add13, 10
  br i1 %exitcond.not, label %for.inc15, label %for.body6, !llvm.loop !7

for.inc15:                                        ; preds = %m_vec_mul_add.exit
  %add14 = add i32 %bs_mat_entries_used.14, 1
  %inc = add nuw nsw i32 %c.05, 1
  %exitcond1.not = icmp eq i32 %add14, %0
  br i1 %exitcond1.not, label %for.cond1.for.inc17_crit_edge, label %for.cond4.preheader, !llvm.loop !8

for.cond1.for.inc17_crit_edge:                    ; preds = %for.inc15
  %split = phi i32 [ %add14, %for.inc15 ]
  br label %for.inc17

for.inc17:                                        ; preds = %for.cond1.for.inc17_crit_edge
  %inc18 = add nuw nsw i32 %r.08, 1
  %indvars.iv.next = add nsw i32 %indvars.iv6, -1
  %exitcond2.not = icmp eq i32 %inc18, 78
  br i1 %exitcond2.not, label %for.end19, label %for.cond1.preheader, !llvm.loop !9

for.end19:                                        ; preds = %for.inc17
  ret void
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #1 {
entry:
  %sk = alloca [18603 x i64], align 16
  call void @mayo_memset(ptr %sk, i8 0, i32 148824)
  %Vdec = alloca [780 x i8], align 16
  call void @mayo_memset(ptr %Vdec, i8 0, i32 780)
  %Pv = alloca [3900 x i64], align 16
  call void @mayo_memset(ptr %Pv, i8 0, i32 31200)
  call fastcc void @mul_add_m_upper_triangular_mat_x_mat_trans(i32 5, ptr %sk, ptr %Vdec, ptr %Pv, i32 78, i32 78, i32 10, i32 1)
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
