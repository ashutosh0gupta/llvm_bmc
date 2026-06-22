; ModuleID = '../mayo_IR/mayo1.ll'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

; Function Attrs: inlinehint nounwind
define dso_local fastcc void @compute_P3(ptr noundef %p, ptr noundef nonnull %P1, ptr noundef nonnull %P2, ptr noundef nonnull %O, ptr noundef nonnull %P3) unnamed_addr #0 {
entry:
  br label %for.cond1.preheader.i4

for.cond.i.preheader:                             ; preds = %for.inc17.i8
  br label %for.cond1.i.preheader

for.cond1.preheader.i4:                           ; preds = %entry, %for.inc17.i8
  %r.0.i276 = phi i32 [ 0, %entry ], [ %inc18.i9, %for.inc17.i8 ]
  %bs_mat_entries_used.0.i75 = phi i32 [ 0, %entry ], [ %split, %for.inc17.i8 ]
  %indvars.iv.i74 = phi i32 [ 78, %entry ], [ %indvars.iv.next.i, %for.inc17.i8 ]
  %0 = add i32 %bs_mat_entries_used.0.i75, %indvars.iv.i74
  br label %for.cond4.i11.preheader.lr.ph

for.cond4.i11.preheader.lr.ph:                    ; preds = %for.cond1.preheader.i4
  br label %for.cond4.i11.preheader

for.cond4.i11.preheader:                          ; preds = %for.cond4.i11.preheader.lr.ph, %for.inc15.i14
  %c.0.i673 = phi i32 [ %r.0.i276, %for.cond4.i11.preheader.lr.ph ], [ %inc.i16, %for.inc15.i14 ]
  %bs_mat_entries_used.1.i72 = phi i32 [ %bs_mat_entries_used.0.i75, %for.cond4.i11.preheader.lr.ph ], [ %add14.i15, %for.inc15.i14 ]
  br label %for.body6.i17

for.body6.i17:                                    ; preds = %for.cond4.i11.preheader, %m_vec_mul_add.exit
  %k.0.i1270 = phi i32 [ 0, %for.cond4.i11.preheader ], [ %add13.i, %m_vec_mul_add.exit ]
  %add.ptr.idx.i18 = mul nsw i32 %bs_mat_entries_used.1.i72, 40
  %add.ptr.i19 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i18
  %mul8.i20 = shl nuw nsw i32 %c.0.i673, 3
  %1 = getelementptr i8, ptr %O, i32 %mul8.i20
  %arrayidx.i21 = getelementptr i8, ptr %1, i32 %k.0.i1270
  %2 = load i8, ptr %arrayidx.i21, align 1
  %mul9.i = shl nuw nsw i32 %r.0.i276, 3
  %add10.i = or disjoint i32 %mul9.i, %k.0.i1270
  %add.ptr12.idx.i = mul nuw nsw i32 %add10.i, 40
  %add.ptr12.i = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr12.idx.i
  %conv.i.i = zext i8 %2 to i32
  %mul.i.i = mul i32 %conv.i.i, 134480385
  %and.i.i = and i32 %mul.i.i, -252645136
  %shr.i.i = lshr exact i32 %and.i.i, 4
  %shr1.i.i = lshr exact i32 %and.i.i, 3
  %3 = xor i32 %shr.i.i, %shr1.i.i
  %xor2.i.i = xor i32 %3, %mul.i.i
  br label %for.body.i

for.body.i:                                       ; preds = %for.body6.i17, %for.body.i
  %i.0.i69 = phi i32 [ 0, %for.body6.i17 ], [ %inc.i26, %for.body.i ]
  %arrayidx.i24 = getelementptr inbounds nuw i64, ptr %add.ptr.i19, i32 %i.0.i69
  %4 = load i64, ptr %arrayidx.i24, align 8
  %and.i = and i64 %4, 1229782938247303441
  %and1.i = and i32 %xor2.i.i, 255
  %conv.i = zext nneg i32 %and1.i to i64
  %mul.i25 = mul i64 %and.i, %conv.i
  %shr.i = lshr i64 %4, 1
  %and3.i = and i64 %shr.i, 1229782938247303441
  %shr4.i = lshr i32 %xor2.i.i, 8
  %and5.i = and i32 %shr4.i, 15
  %conv6.i = zext nneg i32 %and5.i to i64
  %mul7.i = mul nuw i64 %and3.i, %conv6.i
  %xor.i = xor i64 %mul.i25, %mul7.i
  %arrayidx8.i = getelementptr inbounds nuw i64, ptr %add.ptr.i19, i32 %i.0.i69
  %5 = load i64, ptr %arrayidx8.i, align 8
  %shr9.i = lshr i64 %5, 2
  %and10.i = and i64 %shr9.i, 1229782938247303441
  %shr11.i = lshr i32 %xor2.i.i, 16
  %and12.i = and i32 %shr11.i, 15
  %conv13.i = zext nneg i32 %and12.i to i64
  %mul14.i = mul nuw i64 %and10.i, %conv13.i
  %xor15.i = xor i64 %xor.i, %mul14.i
  %arrayidx16.i = getelementptr inbounds nuw i64, ptr %add.ptr.i19, i32 %i.0.i69
  %6 = load i64, ptr %arrayidx16.i, align 8
  %shr17.i = lshr i64 %6, 3
  %and18.i = and i64 %shr17.i, 1229782938247303441
  %shr19.i = lshr i32 %xor2.i.i, 24
  %and20.i = and i32 %shr19.i, 15
  %conv21.i = zext nneg i32 %and20.i to i64
  %mul22.i = mul nuw i64 %and18.i, %conv21.i
  %xor23.i = xor i64 %xor15.i, %mul22.i
  %arrayidx24.i = getelementptr inbounds nuw i64, ptr %add.ptr12.i, i32 %i.0.i69
  %7 = load i64, ptr %arrayidx24.i, align 8
  %xor25.i = xor i64 %7, %xor23.i
  store i64 %xor25.i, ptr %arrayidx24.i, align 8
  %inc.i26 = add nuw nsw i32 %i.0.i69, 1
  %exitcond.i23.not = icmp eq i32 %inc.i26, 5
  br i1 %exitcond.i23.not, label %m_vec_mul_add.exit, label %for.body.i, !llvm.loop !5

m_vec_mul_add.exit:                               ; preds = %for.body.i
  %add13.i = add nuw nsw i32 %k.0.i1270, 1
  %exitcond.i13.not = icmp eq i32 %add13.i, 8
  br i1 %exitcond.i13.not, label %for.inc15.i14, label %for.body6.i17, !llvm.loop !7

for.inc15.i14:                                    ; preds = %m_vec_mul_add.exit
  %add14.i15 = add i32 %bs_mat_entries_used.1.i72, 1
  %inc.i16 = add nuw nsw i32 %c.0.i673, 1
  %exitcond1.i7.not = icmp eq i32 %add14.i15, %0
  br i1 %exitcond1.i7.not, label %for.cond1.i5.for.inc17.i8_crit_edge, label %for.cond4.i11.preheader, !llvm.loop !8

for.cond1.i5.for.inc17.i8_crit_edge:              ; preds = %for.inc15.i14
  %split = phi i32 [ %add14.i15, %for.inc15.i14 ]
  br label %for.inc17.i8

for.inc17.i8:                                     ; preds = %for.cond1.i5.for.inc17.i8_crit_edge
  %inc18.i9 = add nuw nsw i32 %r.0.i276, 1
  %indvars.iv.next.i = add nsw i32 %indvars.iv.i74, -1
  %exitcond2.i3.not = icmp eq i32 %inc18.i9, 78
  br i1 %exitcond2.i3.not, label %for.cond.i.preheader, label %for.cond1.preheader.i4, !llvm.loop !9

for.cond1.i.preheader:                            ; preds = %for.cond.i.preheader, %for.inc17.i
  %r.0.i80 = phi i32 [ 0, %for.cond.i.preheader ], [ %inc18.i, %for.inc17.i ]
  br label %for.cond4.i.preheader

for.cond4.i.preheader:                            ; preds = %for.cond1.i.preheader, %for.inc15.i
  %c.0.i79 = phi i32 [ 0, %for.cond1.i.preheader ], [ %inc.i, %for.inc15.i ]
  br label %for.body6.i

for.body6.i:                                      ; preds = %for.cond4.i.preheader, %m_vec_mul_add.exit68
  %k.0.i78 = phi i32 [ 0, %for.cond4.i.preheader ], [ %add14.i, %m_vec_mul_add.exit68 ]
  %mul.i = shl nuw nsw i32 %c.0.i79, 3
  %add.i = or disjoint i32 %mul.i, %k.0.i78
  %add.ptr.idx.i = mul nuw nsw i32 %add.i, 40
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr.idx.i
  %mul8.i = shl nuw nsw i32 %c.0.i79, 3
  %8 = getelementptr i8, ptr %O, i32 %mul8.i
  %arrayidx.i = getelementptr i8, ptr %8, i32 %r.0.i80
  %9 = load i8, ptr %arrayidx.i, align 1
  %mul10.i = shl nuw nsw i32 %r.0.i80, 3
  %add11.i = or disjoint i32 %mul10.i, %k.0.i78
  %add.ptr13.idx.i = mul nuw nsw i32 %add11.i, 40
  %add.ptr13.i = getelementptr inbounds nuw i8, ptr %P3, i32 %add.ptr13.idx.i
  %conv.i.i27 = zext i8 %9 to i32
  %mul.i.i28 = mul i32 %conv.i.i27, 134480385
  %and.i.i29 = and i32 %mul.i.i28, -252645136
  %shr.i.i30 = lshr exact i32 %and.i.i29, 4
  %shr1.i.i31 = lshr exact i32 %and.i.i29, 3
  %10 = xor i32 %shr.i.i30, %shr1.i.i31
  %xor2.i.i32 = xor i32 %10, %mul.i.i28
  br label %for.body.i36

for.body.i36:                                     ; preds = %for.body6.i, %for.body.i36
  %i.0.i3477 = phi i32 [ 0, %for.body6.i ], [ %inc.i67, %for.body.i36 ]
  %arrayidx.i37 = getelementptr inbounds nuw i64, ptr %add.ptr.i, i32 %i.0.i3477
  %11 = load i64, ptr %arrayidx.i37, align 8
  %and.i38 = and i64 %11, 1229782938247303441
  %and1.i39 = and i32 %xor2.i.i32, 255
  %conv.i40 = zext nneg i32 %and1.i39 to i64
  %mul.i41 = mul i64 %and.i38, %conv.i40
  %shr.i42 = lshr i64 %11, 1
  %and3.i43 = and i64 %shr.i42, 1229782938247303441
  %shr4.i44 = lshr i32 %xor2.i.i32, 8
  %and5.i45 = and i32 %shr4.i44, 15
  %conv6.i46 = zext nneg i32 %and5.i45 to i64
  %mul7.i47 = mul nuw i64 %and3.i43, %conv6.i46
  %xor.i48 = xor i64 %mul.i41, %mul7.i47
  %arrayidx8.i49 = getelementptr inbounds nuw i64, ptr %add.ptr.i, i32 %i.0.i3477
  %12 = load i64, ptr %arrayidx8.i49, align 8
  %shr9.i50 = lshr i64 %12, 2
  %and10.i51 = and i64 %shr9.i50, 1229782938247303441
  %shr11.i52 = lshr i32 %xor2.i.i32, 16
  %and12.i53 = and i32 %shr11.i52, 15
  %conv13.i54 = zext nneg i32 %and12.i53 to i64
  %mul14.i55 = mul nuw i64 %and10.i51, %conv13.i54
  %xor15.i56 = xor i64 %xor.i48, %mul14.i55
  %arrayidx16.i57 = getelementptr inbounds nuw i64, ptr %add.ptr.i, i32 %i.0.i3477
  %13 = load i64, ptr %arrayidx16.i57, align 8
  %shr17.i58 = lshr i64 %13, 3
  %and18.i59 = and i64 %shr17.i58, 1229782938247303441
  %shr19.i60 = lshr i32 %xor2.i.i32, 24
  %and20.i61 = and i32 %shr19.i60, 15
  %conv21.i62 = zext nneg i32 %and20.i61 to i64
  %mul22.i63 = mul nuw i64 %and18.i59, %conv21.i62
  %xor23.i64 = xor i64 %xor15.i56, %mul22.i63
  %arrayidx24.i65 = getelementptr inbounds nuw i64, ptr %add.ptr13.i, i32 %i.0.i3477
  %14 = load i64, ptr %arrayidx24.i65, align 8
  %xor25.i66 = xor i64 %14, %xor23.i64
  store i64 %xor25.i66, ptr %arrayidx24.i65, align 8
  %inc.i67 = add nuw nsw i32 %i.0.i3477, 1
  %exitcond.i35.not = icmp eq i32 %inc.i67, 5
  br i1 %exitcond.i35.not, label %m_vec_mul_add.exit68, label %for.body.i36, !llvm.loop !10

m_vec_mul_add.exit68:                             ; preds = %for.body.i36
  %add14.i = add nuw nsw i32 %k.0.i78, 1
  %exitcond.i.not = icmp eq i32 %add14.i, 8
  br i1 %exitcond.i.not, label %for.inc15.i, label %for.body6.i, !llvm.loop !11

for.inc15.i:                                      ; preds = %m_vec_mul_add.exit68
  %inc.i = add nuw nsw i32 %c.0.i79, 1
  %exitcond1.i.not = icmp eq i32 %inc.i, 78
  br i1 %exitcond1.i.not, label %for.inc17.i, label %for.cond4.i.preheader, !llvm.loop !12

for.inc17.i:                                      ; preds = %for.inc15.i
  %inc18.i = add nuw nsw i32 %r.0.i80, 1
  %exitcond2.i.not = icmp eq i32 %inc18.i, 8
  br i1 %exitcond2.i.not, label %mul_add_mat_trans_x_m_mat.exit, label %for.cond1.i.preheader, !llvm.loop !13

mul_add_mat_trans_x_m_mat.exit:                   ; preds = %for.inc17.i
  ret void
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #1 {
entry:
  %p_buf = alloca [128 x i8], align 16
  call void @mayo_memset(ptr %p_buf, i8 0, i32 128)
  %P = alloca [18525 x i64], align 16
  call void @mayo_memset(ptr %P, i8 0, i32 148200)
  %P1 = alloca [18525 x i64], align 16
  call void @mayo_memset(ptr %P1, i8 0, i32 148200)
  %O = alloca [624 x i8], align 16
  call void @mayo_memset(ptr %O, i8 0, i32 624)
  %P3 = alloca [320 x i64], align 16
  call void @mayo_memset(ptr %P3, i8 0, i32 2560)
  call fastcc void @compute_P3(ptr nonnull %p_buf, ptr %P, ptr %P1, ptr %O, ptr %P3)
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
  br label %for.cond, !llvm.loop !14

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
  br label %for.cond, !llvm.loop !15

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
!13 = distinct !{!13, !6}
!14 = distinct !{!14, !6}
!15 = distinct !{!15, !6}
