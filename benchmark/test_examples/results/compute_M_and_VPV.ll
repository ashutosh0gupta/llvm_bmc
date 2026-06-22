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

; Function Attrs: inlinehint nounwind
define dso_local fastcc void @compute_M_and_VPV(ptr noundef %p, ptr noundef nonnull %Vdec, ptr noundef nonnull %L, ptr noundef nonnull %P1, ptr noundef nonnull %VL, ptr noundef nonnull %VP1V) unnamed_addr #0 {
entry:
  %Pv = alloca [3900 x i64], align 8
  br label %for.cond1.i.preheader

for.cond1.i.preheader:                            ; preds = %entry, %for.inc17.i
  %r.0.i148 = phi i32 [ 0, %entry ], [ %inc18.i, %for.inc17.i ]
  br label %for.cond4.i.preheader

for.cond.i.preheader:                             ; preds = %for.inc17.i
  br label %for.body.i

for.cond4.i.preheader:                            ; preds = %for.cond1.i.preheader, %for.inc15.i
  %c.0.i147 = phi i32 [ 0, %for.cond1.i.preheader ], [ %inc.i3, %for.inc15.i ]
  br label %for.body6.i

for.body6.i:                                      ; preds = %for.cond4.i.preheader, %m_vec_mul_add.exit102
  %k.0.i146 = phi i32 [ 0, %for.cond4.i.preheader ], [ %add14.i, %m_vec_mul_add.exit102 ]
  %mul.i = shl nuw nsw i32 %c.0.i147, 3
  %add.i = add nuw nsw i32 %mul.i, %k.0.i146
  %add.ptr.idx.i = mul nuw nsw i32 %add.i, 40
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %L, i32 %add.ptr.idx.i
  %mul8.i = mul nuw nsw i32 %r.0.i148, 78
  %0 = getelementptr i8, ptr %Vdec, i32 %mul8.i
  %arrayidx.i4 = getelementptr i8, ptr %0, i32 %c.0.i147
  %1 = load i8, ptr %arrayidx.i4, align 1
  %mul10.i = shl nuw nsw i32 %r.0.i148, 3
  %add11.i = add nuw nsw i32 %mul10.i, %k.0.i146
  %add.ptr13.idx.i = mul nuw nsw i32 %add11.i, 40
  %add.ptr13.i = getelementptr inbounds nuw i8, ptr %VL, i32 %add.ptr13.idx.i
  %conv.i.i61 = zext i8 %1 to i32
  %mul.i.i62 = mul i32 %conv.i.i61, 134480385
  %and.i.i63 = and i32 %mul.i.i62, -252645136
  %shr.i.i64 = lshr exact i32 %and.i.i63, 4
  %shr1.i.i65 = lshr exact i32 %and.i.i63, 3
  %2 = xor i32 %shr.i.i64, %shr1.i.i65
  %xor2.i.i66 = xor i32 %2, %mul.i.i62
  br label %for.body.i70

for.body.i70:                                     ; preds = %for.body6.i, %for.body.i70
  %i.0.i68145 = phi i32 [ 0, %for.body6.i ], [ %inc.i101, %for.body.i70 ]
  %arrayidx.i71 = getelementptr inbounds nuw i64, ptr %add.ptr.i, i32 %i.0.i68145
  %3 = load i64, ptr %arrayidx.i71, align 8
  %and.i72 = and i64 %3, 1229782938247303441
  %and1.i73 = and i32 %xor2.i.i66, 255
  %conv.i74 = zext nneg i32 %and1.i73 to i64
  %mul.i75 = mul i64 %and.i72, %conv.i74
  %shr.i76 = lshr i64 %3, 1
  %and3.i77 = and i64 %shr.i76, 1229782938247303441
  %shr4.i78 = lshr i32 %xor2.i.i66, 8
  %and5.i79 = and i32 %shr4.i78, 15
  %conv6.i80 = zext nneg i32 %and5.i79 to i64
  %mul7.i81 = mul nuw i64 %and3.i77, %conv6.i80
  %xor.i82 = xor i64 %mul.i75, %mul7.i81
  %arrayidx8.i83 = getelementptr inbounds nuw i64, ptr %add.ptr.i, i32 %i.0.i68145
  %4 = load i64, ptr %arrayidx8.i83, align 8
  %shr9.i84 = lshr i64 %4, 2
  %and10.i85 = and i64 %shr9.i84, 1229782938247303441
  %shr11.i86 = lshr i32 %xor2.i.i66, 16
  %and12.i87 = and i32 %shr11.i86, 15
  %conv13.i88 = zext nneg i32 %and12.i87 to i64
  %mul14.i89 = mul nuw i64 %and10.i85, %conv13.i88
  %xor15.i90 = xor i64 %xor.i82, %mul14.i89
  %arrayidx16.i91 = getelementptr inbounds nuw i64, ptr %add.ptr.i, i32 %i.0.i68145
  %5 = load i64, ptr %arrayidx16.i91, align 8
  %shr17.i92 = lshr i64 %5, 3
  %and18.i93 = and i64 %shr17.i92, 1229782938247303441
  %shr19.i94 = lshr i32 %xor2.i.i66, 24
  %and20.i95 = and i32 %shr19.i94, 15
  %conv21.i96 = zext nneg i32 %and20.i95 to i64
  %mul22.i97 = mul nuw i64 %and18.i93, %conv21.i96
  %xor23.i98 = xor i64 %xor15.i90, %mul22.i97
  %arrayidx24.i99 = getelementptr inbounds nuw i64, ptr %add.ptr13.i, i32 %i.0.i68145
  %6 = load i64, ptr %arrayidx24.i99, align 8
  %xor25.i100 = xor i64 %6, %xor23.i98
  store i64 %xor25.i100, ptr %arrayidx24.i99, align 8
  %inc.i101 = add nuw nsw i32 %i.0.i68145, 1
  %exitcond.i69.not = icmp eq i32 %inc.i101, 5
  br i1 %exitcond.i69.not, label %m_vec_mul_add.exit102, label %for.body.i70, !llvm.loop !7

m_vec_mul_add.exit102:                            ; preds = %for.body.i70
  %add14.i = add nuw nsw i32 %k.0.i146, 1
  %exitcond.i2.not = icmp eq i32 %add14.i, 8
  br i1 %exitcond.i2.not, label %for.inc15.i, label %for.body6.i, !llvm.loop !8

for.inc15.i:                                      ; preds = %m_vec_mul_add.exit102
  %inc.i3 = add nuw nsw i32 %c.0.i147, 1
  %exitcond1.i.not = icmp eq i32 %inc.i3, 78
  br i1 %exitcond1.i.not, label %for.inc17.i, label %for.cond4.i.preheader, !llvm.loop !9

for.inc17.i:                                      ; preds = %for.inc15.i
  %inc18.i = add nuw nsw i32 %r.0.i148, 1
  %exitcond2.i.not = icmp eq i32 %inc18.i, 10
  br i1 %exitcond2.i.not, label %for.cond.i.preheader, label %for.cond1.i.preheader, !llvm.loop !10

for.cond.i33.preheader:                           ; preds = %for.body.i
  br label %for.cond1.preheader.i36

for.body.i:                                       ; preds = %for.cond.i.preheader, %for.body.i
  %i.0.i149 = phi i32 [ 0, %for.cond.i.preheader ], [ %inc.i, %for.body.i ]
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %Pv, i32 %i.0.i149
  store i8 0, ptr %arrayidx.i, align 1
  %inc.i = add nuw nsw i32 %i.0.i149, 1
  %exitcond.i.not = icmp eq i32 %inc.i, 31200
  br i1 %exitcond.i.not, label %for.cond.i33.preheader, label %for.body.i, !llvm.loop !11

for.cond.i5.preheader:                            ; preds = %for.inc17.i40
  br label %for.cond1.i9.preheader

for.cond1.preheader.i36:                          ; preds = %for.cond.i33.preheader, %for.inc17.i40
  %r.0.i34157 = phi i32 [ 0, %for.cond.i33.preheader ], [ %inc18.i41, %for.inc17.i40 ]
  %bs_mat_entries_used.0.i156 = phi i32 [ 0, %for.cond.i33.preheader ], [ %split, %for.inc17.i40 ]
  %indvars.iv.i155 = phi i32 [ 78, %for.cond.i33.preheader ], [ %indvars.iv.next.i, %for.inc17.i40 ]
  %7 = add i32 %bs_mat_entries_used.0.i156, %indvars.iv.i155
  br label %for.cond4.i43.preheader.lr.ph

for.cond4.i43.preheader.lr.ph:                    ; preds = %for.cond1.preheader.i36
  br label %for.cond4.i43.preheader

for.cond4.i43.preheader:                          ; preds = %for.cond4.i43.preheader.lr.ph, %for.inc15.i46
  %c.0.i38154 = phi i32 [ %r.0.i34157, %for.cond4.i43.preheader.lr.ph ], [ %inc.i48, %for.inc15.i46 ]
  %bs_mat_entries_used.1.i153 = phi i32 [ %bs_mat_entries_used.0.i156, %for.cond4.i43.preheader.lr.ph ], [ %add14.i47, %for.inc15.i46 ]
  br label %for.body6.i49

for.body6.i49:                                    ; preds = %for.cond4.i43.preheader, %m_vec_mul_add.exit
  %k.0.i44151 = phi i32 [ 0, %for.cond4.i43.preheader ], [ %add13.i, %m_vec_mul_add.exit ]
  %add.ptr.idx.i50 = mul nsw i32 %bs_mat_entries_used.1.i153, 40
  %add.ptr.i51 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i50
  %mul8.i52 = mul nuw nsw i32 %k.0.i44151, 78
  %8 = getelementptr i8, ptr %Vdec, i32 %mul8.i52
  %arrayidx.i53 = getelementptr i8, ptr %8, i32 %c.0.i38154
  %9 = load i8, ptr %arrayidx.i53, align 1
  %mul9.i = mul nuw nsw i32 %r.0.i34157, 10
  %add10.i = add nuw nsw i32 %mul9.i, %k.0.i44151
  %add.ptr12.idx.i = mul nuw nsw i32 %add10.i, 40
  %add.ptr12.i = getelementptr inbounds nuw i8, ptr %Pv, i32 %add.ptr12.idx.i
  %conv.i.i = zext i8 %9 to i32
  %mul.i.i = mul i32 %conv.i.i, 134480385
  %and.i.i = and i32 %mul.i.i, -252645136
  %shr.i.i = lshr exact i32 %and.i.i, 4
  %shr1.i.i = lshr exact i32 %and.i.i, 3
  %10 = xor i32 %shr.i.i, %shr1.i.i
  %xor2.i.i = xor i32 %10, %mul.i.i
  br label %for.body.i57

for.body.i57:                                     ; preds = %for.body6.i49, %for.body.i57
  %i.0.i55150 = phi i32 [ 0, %for.body6.i49 ], [ %inc.i60, %for.body.i57 ]
  %arrayidx.i58 = getelementptr inbounds nuw i64, ptr %add.ptr.i51, i32 %i.0.i55150
  %11 = load i64, ptr %arrayidx.i58, align 8
  %and.i = and i64 %11, 1229782938247303441
  %and1.i = and i32 %xor2.i.i, 255
  %conv.i = zext nneg i32 %and1.i to i64
  %mul.i59 = mul i64 %and.i, %conv.i
  %shr.i = lshr i64 %11, 1
  %and3.i = and i64 %shr.i, 1229782938247303441
  %shr4.i = lshr i32 %xor2.i.i, 8
  %and5.i = and i32 %shr4.i, 15
  %conv6.i = zext nneg i32 %and5.i to i64
  %mul7.i = mul nuw i64 %and3.i, %conv6.i
  %xor.i = xor i64 %mul.i59, %mul7.i
  %arrayidx8.i = getelementptr inbounds nuw i64, ptr %add.ptr.i51, i32 %i.0.i55150
  %12 = load i64, ptr %arrayidx8.i, align 8
  %shr9.i = lshr i64 %12, 2
  %and10.i = and i64 %shr9.i, 1229782938247303441
  %shr11.i = lshr i32 %xor2.i.i, 16
  %and12.i = and i32 %shr11.i, 15
  %conv13.i = zext nneg i32 %and12.i to i64
  %mul14.i = mul nuw i64 %and10.i, %conv13.i
  %xor15.i = xor i64 %xor.i, %mul14.i
  %arrayidx16.i = getelementptr inbounds nuw i64, ptr %add.ptr.i51, i32 %i.0.i55150
  %13 = load i64, ptr %arrayidx16.i, align 8
  %shr17.i = lshr i64 %13, 3
  %and18.i = and i64 %shr17.i, 1229782938247303441
  %shr19.i = lshr i32 %xor2.i.i, 24
  %and20.i = and i32 %shr19.i, 15
  %conv21.i = zext nneg i32 %and20.i to i64
  %mul22.i = mul nuw i64 %and18.i, %conv21.i
  %xor23.i = xor i64 %xor15.i, %mul22.i
  %arrayidx24.i = getelementptr inbounds nuw i64, ptr %add.ptr12.i, i32 %i.0.i55150
  %14 = load i64, ptr %arrayidx24.i, align 8
  %xor25.i = xor i64 %14, %xor23.i
  store i64 %xor25.i, ptr %arrayidx24.i, align 8
  %inc.i60 = add nuw nsw i32 %i.0.i55150, 1
  %exitcond.i56.not = icmp eq i32 %inc.i60, 5
  br i1 %exitcond.i56.not, label %m_vec_mul_add.exit, label %for.body.i57, !llvm.loop !12

m_vec_mul_add.exit:                               ; preds = %for.body.i57
  %add13.i = add nuw nsw i32 %k.0.i44151, 1
  %exitcond.i45.not = icmp eq i32 %add13.i, 10
  br i1 %exitcond.i45.not, label %for.inc15.i46, label %for.body6.i49, !llvm.loop !13

for.inc15.i46:                                    ; preds = %m_vec_mul_add.exit
  %add14.i47 = add i32 %bs_mat_entries_used.1.i153, 1
  %inc.i48 = add nuw nsw i32 %c.0.i38154, 1
  %exitcond1.i39.not = icmp eq i32 %add14.i47, %7
  br i1 %exitcond1.i39.not, label %for.cond1.i37.for.inc17.i40_crit_edge, label %for.cond4.i43.preheader, !llvm.loop !14

for.cond1.i37.for.inc17.i40_crit_edge:            ; preds = %for.inc15.i46
  %split = phi i32 [ %add14.i47, %for.inc15.i46 ]
  br label %for.inc17.i40

for.inc17.i40:                                    ; preds = %for.cond1.i37.for.inc17.i40_crit_edge
  %inc18.i41 = add nuw nsw i32 %r.0.i34157, 1
  %indvars.iv.next.i = add nsw i32 %indvars.iv.i155, -1
  %exitcond2.i35.not = icmp eq i32 %inc18.i41, 78
  br i1 %exitcond2.i35.not, label %for.cond.i5.preheader, label %for.cond1.preheader.i36, !llvm.loop !15

for.cond1.i9.preheader:                           ; preds = %for.cond.i5.preheader, %for.inc17.i12
  %r.0.i6161 = phi i32 [ 0, %for.cond.i5.preheader ], [ %inc18.i13, %for.inc17.i12 ]
  br label %for.cond4.i15.preheader

for.cond4.i15.preheader:                          ; preds = %for.cond1.i9.preheader, %for.inc15.i18
  %c.0.i10160 = phi i32 [ 0, %for.cond1.i9.preheader ], [ %inc.i19, %for.inc15.i18 ]
  br label %for.body6.i20

for.body6.i20:                                    ; preds = %for.cond4.i15.preheader, %m_vec_mul_add.exit144
  %k.0.i16159 = phi i32 [ 0, %for.cond4.i15.preheader ], [ %add14.i31, %m_vec_mul_add.exit144 ]
  %mul.i21 = mul nuw nsw i32 %c.0.i10160, 10
  %add.i22 = add nuw nsw i32 %mul.i21, %k.0.i16159
  %add.ptr.idx.i23 = mul nuw nsw i32 %add.i22, 40
  %add.ptr.i24 = getelementptr inbounds nuw i8, ptr %Pv, i32 %add.ptr.idx.i23
  %mul8.i25 = mul nuw nsw i32 %r.0.i6161, 78
  %15 = getelementptr i8, ptr %Vdec, i32 %mul8.i25
  %arrayidx.i26 = getelementptr i8, ptr %15, i32 %c.0.i10160
  %16 = load i8, ptr %arrayidx.i26, align 1
  %mul10.i27 = mul nuw nsw i32 %r.0.i6161, 10
  %add11.i28 = add nuw nsw i32 %mul10.i27, %k.0.i16159
  %add.ptr13.idx.i29 = mul nuw nsw i32 %add11.i28, 40
  %add.ptr13.i30 = getelementptr inbounds nuw i8, ptr %VP1V, i32 %add.ptr13.idx.i29
  %conv.i.i103 = zext i8 %16 to i32
  %mul.i.i104 = mul i32 %conv.i.i103, 134480385
  %and.i.i105 = and i32 %mul.i.i104, -252645136
  %shr.i.i106 = lshr exact i32 %and.i.i105, 4
  %shr1.i.i107 = lshr exact i32 %and.i.i105, 3
  %17 = xor i32 %shr.i.i106, %shr1.i.i107
  %xor2.i.i108 = xor i32 %17, %mul.i.i104
  br label %for.body.i112

for.body.i112:                                    ; preds = %for.body6.i20, %for.body.i112
  %i.0.i110158 = phi i32 [ 0, %for.body6.i20 ], [ %inc.i143, %for.body.i112 ]
  %arrayidx.i113 = getelementptr inbounds nuw i64, ptr %add.ptr.i24, i32 %i.0.i110158
  %18 = load i64, ptr %arrayidx.i113, align 8
  %and.i114 = and i64 %18, 1229782938247303441
  %and1.i115 = and i32 %xor2.i.i108, 255
  %conv.i116 = zext nneg i32 %and1.i115 to i64
  %mul.i117 = mul i64 %and.i114, %conv.i116
  %shr.i118 = lshr i64 %18, 1
  %and3.i119 = and i64 %shr.i118, 1229782938247303441
  %shr4.i120 = lshr i32 %xor2.i.i108, 8
  %and5.i121 = and i32 %shr4.i120, 15
  %conv6.i122 = zext nneg i32 %and5.i121 to i64
  %mul7.i123 = mul nuw i64 %and3.i119, %conv6.i122
  %xor.i124 = xor i64 %mul.i117, %mul7.i123
  %arrayidx8.i125 = getelementptr inbounds nuw i64, ptr %add.ptr.i24, i32 %i.0.i110158
  %19 = load i64, ptr %arrayidx8.i125, align 8
  %shr9.i126 = lshr i64 %19, 2
  %and10.i127 = and i64 %shr9.i126, 1229782938247303441
  %shr11.i128 = lshr i32 %xor2.i.i108, 16
  %and12.i129 = and i32 %shr11.i128, 15
  %conv13.i130 = zext nneg i32 %and12.i129 to i64
  %mul14.i131 = mul nuw i64 %and10.i127, %conv13.i130
  %xor15.i132 = xor i64 %xor.i124, %mul14.i131
  %arrayidx16.i133 = getelementptr inbounds nuw i64, ptr %add.ptr.i24, i32 %i.0.i110158
  %20 = load i64, ptr %arrayidx16.i133, align 8
  %shr17.i134 = lshr i64 %20, 3
  %and18.i135 = and i64 %shr17.i134, 1229782938247303441
  %shr19.i136 = lshr i32 %xor2.i.i108, 24
  %and20.i137 = and i32 %shr19.i136, 15
  %conv21.i138 = zext nneg i32 %and20.i137 to i64
  %mul22.i139 = mul nuw i64 %and18.i135, %conv21.i138
  %xor23.i140 = xor i64 %xor15.i132, %mul22.i139
  %arrayidx24.i141 = getelementptr inbounds nuw i64, ptr %add.ptr13.i30, i32 %i.0.i110158
  %21 = load i64, ptr %arrayidx24.i141, align 8
  %xor25.i142 = xor i64 %21, %xor23.i140
  store i64 %xor25.i142, ptr %arrayidx24.i141, align 8
  %inc.i143 = add nuw nsw i32 %i.0.i110158, 1
  %exitcond.i111.not = icmp eq i32 %inc.i143, 5
  br i1 %exitcond.i111.not, label %m_vec_mul_add.exit144, label %for.body.i112, !llvm.loop !16

m_vec_mul_add.exit144:                            ; preds = %for.body.i112
  %add14.i31 = add nuw nsw i32 %k.0.i16159, 1
  %exitcond.i17.not = icmp eq i32 %add14.i31, 10
  br i1 %exitcond.i17.not, label %for.inc15.i18, label %for.body6.i20, !llvm.loop !17

for.inc15.i18:                                    ; preds = %m_vec_mul_add.exit144
  %inc.i19 = add nuw nsw i32 %c.0.i10160, 1
  %exitcond1.i11.not = icmp eq i32 %inc.i19, 78
  br i1 %exitcond1.i11.not, label %for.inc17.i12, label %for.cond4.i15.preheader, !llvm.loop !18

for.inc17.i12:                                    ; preds = %for.inc15.i18
  %inc18.i13 = add nuw nsw i32 %r.0.i6161, 1
  %exitcond2.i7.not = icmp eq i32 %inc18.i13, 10
  br i1 %exitcond2.i7.not, label %mul_add_mat_x_m_mat.exit32, label %for.cond1.i9.preheader, !llvm.loop !19

mul_add_mat_x_m_mat.exit32:                       ; preds = %for.inc17.i12
  ret void
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #1 {
entry:
  %p_buf = alloca [128 x i8], align 16
  call void @mayo_memset(ptr %p_buf, i8 0, i32 128)
  %Vdec = alloca [780 x i8], align 16
  call void @mayo_memset(ptr %Vdec, i8 0, i32 780)
  %sk = alloca [18603 x i64], align 16
  call void @mayo_memset(ptr %sk, i8 0, i32 148824)
  %sk1 = alloca [18603 x i64], align 16
  call void @mayo_memset(ptr %sk1, i8 0, i32 148824)
  %Mtmp = alloca [400 x i64], align 16
  call void @mayo_memset(ptr %Mtmp, i8 0, i32 3200)
  %A = alloca [6480 x i8], align 16
  call void @mayo_memset(ptr %A, i8 0, i32 6480)
  call fastcc void @compute_M_and_VPV(ptr nonnull %p_buf, ptr %Vdec, ptr %sk, ptr %sk1, ptr %Mtmp, ptr %A)
  ret i32 0
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
  br label %for.cond, !llvm.loop !20

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
!16 = distinct !{!16, !6}
!17 = distinct !{!17, !6}
!18 = distinct !{!18, !6}
!19 = distinct !{!19, !6}
!20 = distinct !{!20, !6}
