; ModuleID = '../mayo_IR/mayo1.ll'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

; Function Attrs: inlinehint nounwind
define dso_local fastcc void @P1_times_Vt(ptr noundef %p, ptr noundef nonnull %P1, ptr noundef nonnull %V, ptr noundef nonnull %acc) unnamed_addr #0 {
entry:
  br label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %entry, %for.inc17.i
  %r.0.i12 = phi i32 [ 0, %entry ], [ %inc18.i, %for.inc17.i ]
  %bs_mat_entries_used.0.i11 = phi i32 [ 0, %entry ], [ %split, %for.inc17.i ]
  %indvars.iv.i10 = phi i32 [ 78, %entry ], [ %indvars.iv.next.i, %for.inc17.i ]
  %0 = add i32 %bs_mat_entries_used.0.i11, %indvars.iv.i10
  br label %for.cond4.i.preheader.lr.ph

for.cond4.i.preheader.lr.ph:                      ; preds = %for.cond1.preheader.i
  br label %for.cond4.i.preheader

for.cond4.i.preheader:                            ; preds = %for.cond4.i.preheader.lr.ph, %for.inc15.i
  %c.0.i9 = phi i32 [ %r.0.i12, %for.cond4.i.preheader.lr.ph ], [ %inc.i, %for.inc15.i ]
  %bs_mat_entries_used.1.i8 = phi i32 [ %bs_mat_entries_used.0.i11, %for.cond4.i.preheader.lr.ph ], [ %add14.i, %for.inc15.i ]
  br label %for.body6.i

for.body6.i:                                      ; preds = %for.cond4.i.preheader, %m_vec_mul_add.exit
  %k.0.i6 = phi i32 [ 0, %for.cond4.i.preheader ], [ %add13.i, %m_vec_mul_add.exit ]
  %add.ptr.idx.i = mul nsw i32 %bs_mat_entries_used.1.i8, 40
  %add.ptr.i = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i
  %mul8.i = mul nuw nsw i32 %k.0.i6, 78
  %1 = getelementptr i8, ptr %V, i32 %mul8.i
  %arrayidx.i = getelementptr i8, ptr %1, i32 %c.0.i9
  %2 = load i8, ptr %arrayidx.i, align 1
  %mul9.i = mul nuw nsw i32 %r.0.i12, 10
  %add10.i = add nuw nsw i32 %mul9.i, %k.0.i6
  %add.ptr12.idx.i = mul nuw nsw i32 %add10.i, 40
  %add.ptr12.i = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr12.idx.i
  %conv.i.i = zext i8 %2 to i32
  %mul.i.i = mul i32 %conv.i.i, 134480385
  %and.i.i = and i32 %mul.i.i, -252645136
  %shr.i.i = lshr exact i32 %and.i.i, 4
  %shr1.i.i = lshr exact i32 %and.i.i, 3
  %3 = xor i32 %shr.i.i, %shr1.i.i
  %xor2.i.i = xor i32 %3, %mul.i.i
  br label %for.body.i

for.body.i:                                       ; preds = %for.body6.i, %for.body.i
  %i.0.i5 = phi i32 [ 0, %for.body6.i ], [ %inc.i4, %for.body.i ]
  %arrayidx.i3 = getelementptr inbounds nuw i64, ptr %add.ptr.i, i32 %i.0.i5
  %4 = load i64, ptr %arrayidx.i3, align 8
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
  %arrayidx8.i = getelementptr inbounds nuw i64, ptr %add.ptr.i, i32 %i.0.i5
  %5 = load i64, ptr %arrayidx8.i, align 8
  %shr9.i = lshr i64 %5, 2
  %and10.i = and i64 %shr9.i, 1229782938247303441
  %shr11.i = lshr i32 %xor2.i.i, 16
  %and12.i = and i32 %shr11.i, 15
  %conv13.i = zext nneg i32 %and12.i to i64
  %mul14.i = mul nuw i64 %and10.i, %conv13.i
  %xor15.i = xor i64 %xor.i, %mul14.i
  %arrayidx16.i = getelementptr inbounds nuw i64, ptr %add.ptr.i, i32 %i.0.i5
  %6 = load i64, ptr %arrayidx16.i, align 8
  %shr17.i = lshr i64 %6, 3
  %and18.i = and i64 %shr17.i, 1229782938247303441
  %shr19.i = lshr i32 %xor2.i.i, 24
  %and20.i = and i32 %shr19.i, 15
  %conv21.i = zext nneg i32 %and20.i to i64
  %mul22.i = mul nuw i64 %and18.i, %conv21.i
  %xor23.i = xor i64 %xor15.i, %mul22.i
  %arrayidx24.i = getelementptr inbounds nuw i64, ptr %add.ptr12.i, i32 %i.0.i5
  %7 = load i64, ptr %arrayidx24.i, align 8
  %xor25.i = xor i64 %7, %xor23.i
  store i64 %xor25.i, ptr %arrayidx24.i, align 8
  %inc.i4 = add nuw nsw i32 %i.0.i5, 1
  %exitcond.i2.not = icmp eq i32 %inc.i4, 5
  br i1 %exitcond.i2.not, label %m_vec_mul_add.exit, label %for.body.i, !llvm.loop !5

m_vec_mul_add.exit:                               ; preds = %for.body.i
  %add13.i = add nuw nsw i32 %k.0.i6, 1
  %exitcond.i.not = icmp eq i32 %add13.i, 10
  br i1 %exitcond.i.not, label %for.inc15.i, label %for.body6.i, !llvm.loop !7

for.inc15.i:                                      ; preds = %m_vec_mul_add.exit
  %add14.i = add i32 %bs_mat_entries_used.1.i8, 1
  %inc.i = add nuw nsw i32 %c.0.i9, 1
  %exitcond1.i.not = icmp eq i32 %add14.i, %0
  br i1 %exitcond1.i.not, label %for.cond1.i.for.inc17.i_crit_edge, label %for.cond4.i.preheader, !llvm.loop !8

for.cond1.i.for.inc17.i_crit_edge:                ; preds = %for.inc15.i
  %split = phi i32 [ %add14.i, %for.inc15.i ]
  br label %for.inc17.i

for.inc17.i:                                      ; preds = %for.cond1.i.for.inc17.i_crit_edge
  %inc18.i = add nuw nsw i32 %r.0.i12, 1
  %indvars.iv.next.i = add nsw i32 %indvars.iv.i10, -1
  %exitcond2.i.not = icmp eq i32 %inc18.i, 78
  br i1 %exitcond2.i.not, label %mul_add_m_upper_triangular_mat_x_mat_trans.exit, label %for.cond1.preheader.i, !llvm.loop !9

mul_add_m_upper_triangular_mat_x_mat_trans.exit:  ; preds = %for.inc17.i
  ret void
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #1 {
entry:
  %p_buf = alloca [128 x i8], align 16
  call void @mayo_memset(ptr %p_buf, i8 0, i32 128)
  %sk = alloca [18603 x i64], align 16
  call void @mayo_memset(ptr %sk, i8 0, i32 148824)
  %Vdec = alloca [780 x i8], align 16
  call void @mayo_memset(ptr %Vdec, i8 0, i32 780)
  %Pv = alloca [3900 x i64], align 16
  call void @mayo_memset(ptr %Pv, i8 0, i32 31200)
  call fastcc void @P1_times_Vt(ptr nonnull %p_buf, ptr %sk, ptr %Vdec, ptr %Pv)
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
