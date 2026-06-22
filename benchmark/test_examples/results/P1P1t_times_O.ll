; ModuleID = '../mayo_IR/mayo1.ll'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

; Function Attrs: inlinehint nounwind
define dso_local fastcc void @P1P1t_times_O(ptr noundef %p, ptr noundef %P1, ptr noundef %O, ptr noundef %acc) unnamed_addr #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.inc27
  %r.051 = phi i32 [ 0, %entry ], [ %inc28, %for.inc27 ]
  %bs_mat_entries_used.050 = phi i32 [ 0, %entry ], [ %split, %for.inc27 ]
  %indvars.iv49 = phi i32 [ 78, %entry ], [ %indvars.iv.next, %for.inc27 ]
  %0 = add i32 %bs_mat_entries_used.050, %indvars.iv49
  br label %for.body3.lr.ph

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  br label %for.body3

for.body3:                                        ; preds = %for.body3.lr.ph, %for.inc25
  %c.048 = phi i32 [ %r.051, %for.body3.lr.ph ], [ %inc, %for.inc25 ]
  %bs_mat_entries_used.147 = phi i32 [ %bs_mat_entries_used.050, %for.body3.lr.ph ], [ %bs_mat_entries_used.2, %for.inc25 ]
  %cmp4 = icmp eq i32 %c.048, %r.051
  br i1 %cmp4, label %for.inc25, label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.body3
  br label %for.body7

for.body7:                                        ; preds = %for.cond5.preheader, %m_vec_mul_add.exit42
  %k.045 = phi i32 [ 0, %for.cond5.preheader ], [ %add23, %m_vec_mul_add.exit42 ]
  %add.ptr.idx = mul nsw i32 %bs_mat_entries_used.147, 40
  %add.ptr = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx
  %mul8 = shl nuw nsw i32 %c.048, 3
  %add9 = or disjoint i32 %mul8, %k.045
  %arrayidx = getelementptr inbounds nuw i8, ptr %O, i32 %add9
  %1 = load i8, ptr %arrayidx, align 1
  %mul10 = shl nuw nsw i32 %r.051, 3
  %add11 = or disjoint i32 %mul10, %k.045
  %add.ptr13.idx = mul nuw nsw i32 %add11, 40
  %add.ptr13 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr13.idx
  %conv.i.i = zext i8 %1 to i32
  %mul.i.i = mul i32 %conv.i.i, 134480385
  %and.i.i = and i32 %mul.i.i, -252645136
  %shr.i.i = lshr exact i32 %and.i.i, 4
  %shr1.i.i = lshr exact i32 %and.i.i, 3
  %2 = xor i32 %shr.i.i, %shr1.i.i
  %xor2.i.i = xor i32 %2, %mul.i.i
  br label %for.body.i

for.body.i:                                       ; preds = %for.body7, %for.body.i
  %i.0.i43 = phi i32 [ 0, %for.body7 ], [ %inc.i, %for.body.i ]
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %add.ptr, i32 %i.0.i43
  %3 = load i64, ptr %arrayidx.i, align 8
  %and.i = and i64 %3, 1229782938247303441
  %and1.i = and i32 %xor2.i.i, 255
  %conv.i = zext nneg i32 %and1.i to i64
  %mul.i = mul i64 %and.i, %conv.i
  %shr.i = lshr i64 %3, 1
  %and3.i = and i64 %shr.i, 1229782938247303441
  %shr4.i = lshr i32 %xor2.i.i, 8
  %and5.i = and i32 %shr4.i, 15
  %conv6.i = zext nneg i32 %and5.i to i64
  %mul7.i = mul nuw i64 %and3.i, %conv6.i
  %xor.i = xor i64 %mul.i, %mul7.i
  %arrayidx8.i = getelementptr inbounds nuw i64, ptr %add.ptr, i32 %i.0.i43
  %4 = load i64, ptr %arrayidx8.i, align 8
  %shr9.i = lshr i64 %4, 2
  %and10.i = and i64 %shr9.i, 1229782938247303441
  %shr11.i = lshr i32 %xor2.i.i, 16
  %and12.i = and i32 %shr11.i, 15
  %conv13.i = zext nneg i32 %and12.i to i64
  %mul14.i = mul nuw i64 %and10.i, %conv13.i
  %xor15.i = xor i64 %xor.i, %mul14.i
  %arrayidx16.i = getelementptr inbounds nuw i64, ptr %add.ptr, i32 %i.0.i43
  %5 = load i64, ptr %arrayidx16.i, align 8
  %shr17.i = lshr i64 %5, 3
  %and18.i = and i64 %shr17.i, 1229782938247303441
  %shr19.i = lshr i32 %xor2.i.i, 24
  %and20.i = and i32 %shr19.i, 15
  %conv21.i = zext nneg i32 %and20.i to i64
  %mul22.i = mul nuw i64 %and18.i, %conv21.i
  %xor23.i = xor i64 %xor15.i, %mul22.i
  %arrayidx24.i = getelementptr inbounds nuw i64, ptr %add.ptr13, i32 %i.0.i43
  %6 = load i64, ptr %arrayidx24.i, align 8
  %xor25.i = xor i64 %6, %xor23.i
  store i64 %xor25.i, ptr %arrayidx24.i, align 8
  %inc.i = add nuw nsw i32 %i.0.i43, 1
  %exitcond.i.not = icmp eq i32 %inc.i, 5
  br i1 %exitcond.i.not, label %m_vec_mul_add.exit, label %for.body.i, !llvm.loop !5

m_vec_mul_add.exit:                               ; preds = %for.body.i
  %add.ptr15.idx = mul nsw i32 %bs_mat_entries_used.147, 40
  %add.ptr15 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr15.idx
  %mul16 = shl nuw nsw i32 %r.051, 3
  %add17 = or disjoint i32 %mul16, %k.045
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %O, i32 %add17
  %7 = load i8, ptr %arrayidx18, align 1
  %mul19 = shl nuw nsw i32 %c.048, 3
  %add20 = or disjoint i32 %mul19, %k.045
  %add.ptr22.idx = mul nuw nsw i32 %add20, 40
  %add.ptr22 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr22.idx
  %conv.i.i1 = zext i8 %7 to i32
  %mul.i.i2 = mul i32 %conv.i.i1, 134480385
  %and.i.i3 = and i32 %mul.i.i2, -252645136
  %shr.i.i4 = lshr exact i32 %and.i.i3, 4
  %shr1.i.i5 = lshr exact i32 %and.i.i3, 3
  %8 = xor i32 %shr.i.i4, %shr1.i.i5
  %xor2.i.i6 = xor i32 %8, %mul.i.i2
  br label %for.body.i10

for.body.i10:                                     ; preds = %m_vec_mul_add.exit, %for.body.i10
  %i.0.i844 = phi i32 [ 0, %m_vec_mul_add.exit ], [ %inc.i41, %for.body.i10 ]
  %arrayidx.i11 = getelementptr inbounds nuw i64, ptr %add.ptr15, i32 %i.0.i844
  %9 = load i64, ptr %arrayidx.i11, align 8
  %and.i12 = and i64 %9, 1229782938247303441
  %and1.i13 = and i32 %xor2.i.i6, 255
  %conv.i14 = zext nneg i32 %and1.i13 to i64
  %mul.i15 = mul i64 %and.i12, %conv.i14
  %shr.i16 = lshr i64 %9, 1
  %and3.i17 = and i64 %shr.i16, 1229782938247303441
  %shr4.i18 = lshr i32 %xor2.i.i6, 8
  %and5.i19 = and i32 %shr4.i18, 15
  %conv6.i20 = zext nneg i32 %and5.i19 to i64
  %mul7.i21 = mul nuw i64 %and3.i17, %conv6.i20
  %xor.i22 = xor i64 %mul.i15, %mul7.i21
  %arrayidx8.i23 = getelementptr inbounds nuw i64, ptr %add.ptr15, i32 %i.0.i844
  %10 = load i64, ptr %arrayidx8.i23, align 8
  %shr9.i24 = lshr i64 %10, 2
  %and10.i25 = and i64 %shr9.i24, 1229782938247303441
  %shr11.i26 = lshr i32 %xor2.i.i6, 16
  %and12.i27 = and i32 %shr11.i26, 15
  %conv13.i28 = zext nneg i32 %and12.i27 to i64
  %mul14.i29 = mul nuw i64 %and10.i25, %conv13.i28
  %xor15.i30 = xor i64 %xor.i22, %mul14.i29
  %arrayidx16.i31 = getelementptr inbounds nuw i64, ptr %add.ptr15, i32 %i.0.i844
  %11 = load i64, ptr %arrayidx16.i31, align 8
  %shr17.i32 = lshr i64 %11, 3
  %and18.i33 = and i64 %shr17.i32, 1229782938247303441
  %shr19.i34 = lshr i32 %xor2.i.i6, 24
  %and20.i35 = and i32 %shr19.i34, 15
  %conv21.i36 = zext nneg i32 %and20.i35 to i64
  %mul22.i37 = mul nuw i64 %and18.i33, %conv21.i36
  %xor23.i38 = xor i64 %xor15.i30, %mul22.i37
  %arrayidx24.i39 = getelementptr inbounds nuw i64, ptr %add.ptr22, i32 %i.0.i844
  %12 = load i64, ptr %arrayidx24.i39, align 8
  %xor25.i40 = xor i64 %12, %xor23.i38
  store i64 %xor25.i40, ptr %arrayidx24.i39, align 8
  %inc.i41 = add nuw nsw i32 %i.0.i844, 1
  %exitcond.i9.not = icmp eq i32 %inc.i41, 5
  br i1 %exitcond.i9.not, label %m_vec_mul_add.exit42, label %for.body.i10, !llvm.loop !7

m_vec_mul_add.exit42:                             ; preds = %for.body.i10
  %add23 = add nuw nsw i32 %k.045, 1
  %exitcond.not = icmp eq i32 %add23, 8
  br i1 %exitcond.not, label %for.inc25.loopexit, label %for.body7, !llvm.loop !8

for.inc25.loopexit:                               ; preds = %m_vec_mul_add.exit42
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.body3
  %bs_mat_entries_used.2 = add i32 %bs_mat_entries_used.147, 1
  %inc = add nuw nsw i32 %c.048, 1
  %exitcond1.not = icmp eq i32 %bs_mat_entries_used.2, %0
  br i1 %exitcond1.not, label %for.cond1.for.inc27_crit_edge, label %for.body3, !llvm.loop !9

for.cond1.for.inc27_crit_edge:                    ; preds = %for.inc25
  %split = phi i32 [ %bs_mat_entries_used.2, %for.inc25 ]
  br label %for.inc27

for.inc27:                                        ; preds = %for.cond1.for.inc27_crit_edge
  %inc28 = add nuw nsw i32 %r.051, 1
  %indvars.iv.next = add nsw i32 %indvars.iv49, -1
  %exitcond2.not = icmp eq i32 %inc28, 78
  br i1 %exitcond2.not, label %for.end29, label %for.cond1.preheader, !llvm.loop !10

for.end29:                                        ; preds = %for.inc27
  ret void
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #1 {
entry:
  %p_buf = alloca [128 x i8], align 16
  call void @mayo_memset(ptr %p_buf, i8 0, i32 128)
  %sk = alloca [18603 x i64], align 16
  call void @mayo_memset(ptr %sk, i8 0, i32 148824)
  %sk1 = alloca [18603 x i64], align 16
  call void @mayo_memset(ptr %sk1, i8 0, i32 148824)
  %sk2 = alloca [18603 x i64], align 16
  call void @mayo_memset(ptr %sk2, i8 0, i32 148824)
  call fastcc void @P1P1t_times_O(ptr nonnull %p_buf, ptr nonnull %sk, ptr nonnull %sk1, ptr nonnull %sk2)
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
  br label %for.cond, !llvm.loop !11

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
  br label %for.cond, !llvm.loop !12

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
!12 = distinct !{!12, !6}
