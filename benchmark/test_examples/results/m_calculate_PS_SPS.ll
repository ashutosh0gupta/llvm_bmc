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
define dso_local fastcc void @m_calculate_PS_SPS(ptr noundef %p, ptr noundef nonnull %P1, ptr noundef nonnull %P2, ptr noundef nonnull %P3, ptr noundef nonnull %s, ptr noundef nonnull %SPS) unnamed_addr #0 {
entry:
  %accumulator.i6 = alloca [68800 x i64], align 8
  %accumulator.i = alloca [8000 x i64], align 8
  %PS = alloca [4300 x i64], align 8
  br label %for.body.i

for.body.i:                                       ; preds = %entry, %for.body.i
  %i.0.i304 = phi i32 [ 0, %entry ], [ %inc.i, %for.body.i ]
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %PS, i32 %i.0.i304
  store i8 0, ptr %arrayidx.i, align 1
  %inc.i = add nuw nsw i32 %i.0.i304, 1
  %exitcond.i.not = icmp eq i32 %inc.i, 34400
  br i1 %exitcond.i.not, label %mayo_memset.exit, label %for.body.i, !llvm.loop !7

mayo_memset.exit:                                 ; preds = %for.body.i
  call void @llvm.lifetime.start.p0(i64 550400, ptr nonnull %accumulator.i6)
  br label %for.body.i.i38

for.cond.i11.preheader:                           ; preds = %for.body.i.i38
  br label %for.cond2.preheader.i

for.body.i.i38:                                   ; preds = %mayo_memset.exit, %for.body.i.i38
  %i.0.i.i8305 = phi i32 [ 0, %mayo_memset.exit ], [ %inc.i.i40, %for.body.i.i38 ]
  %arrayidx.i.i39 = getelementptr inbounds nuw i8, ptr %accumulator.i6, i32 %i.0.i.i8305
  store i8 0, ptr %arrayidx.i.i39, align 1
  %inc.i.i40 = add nuw nsw i32 %i.0.i.i8305, 1
  %exitcond.i.i9.not = icmp eq i32 %inc.i.i40, 550400
  br i1 %exitcond.i.i9.not, label %for.cond.i11.preheader, label %for.body.i.i38, !llvm.loop !8

for.cond56.i.preheader:                           ; preds = %for.inc52.i
  br label %for.cond61.preheader.i

for.cond2.preheader.i:                            ; preds = %for.cond.i11.preheader, %for.inc52.i
  %row.0.i12316 = phi i32 [ 0, %for.cond.i11.preheader ], [ %inc53.i, %for.inc52.i ]
  %P1_used.0.i315 = phi i32 [ 0, %for.cond.i11.preheader ], [ %split, %for.inc52.i ]
  %indvars.iv.i314 = phi i32 [ 78, %for.cond.i11.preheader ], [ %indvars.iv.next.i, %for.inc52.i ]
  %0 = add i32 %P1_used.0.i315, %indvars.iv.i314
  br label %for.cond5.i.preheader.lr.ph

for.cond5.i.preheader.lr.ph:                      ; preds = %for.cond2.preheader.i
  br label %for.cond5.i.preheader

for.cond2.i.for.cond21.i.preheader_crit_edge:     ; preds = %for.inc17.i
  %split = phi i32 [ %inc16.i, %for.inc17.i ]
  br label %for.cond21.i.preheader

for.cond21.i.preheader:                           ; preds = %for.cond2.i.for.cond21.i.preheader_crit_edge
  br label %for.cond26.i.preheader

for.cond5.i.preheader:                            ; preds = %for.cond5.i.preheader.lr.ph, %for.inc17.i
  %j.0.i17310 = phi i32 [ %row.0.i12316, %for.cond5.i.preheader.lr.ph ], [ %inc18.i, %for.inc17.i ]
  %P1_used.1.i309 = phi i32 [ %P1_used.0.i315, %for.cond5.i.preheader.lr.ph ], [ %inc16.i, %for.inc17.i ]
  br label %for.body7.i

for.body7.i:                                      ; preds = %for.cond5.i.preheader, %m_vec_add.exit24.i
  %col.0.i30307 = phi i32 [ 0, %for.cond5.i.preheader ], [ %inc.i37, %m_vec_add.exit24.i ]
  %add.ptr.idx.i32 = mul nsw i32 %P1_used.1.i309, 40
  %add.ptr.i33 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i32
  %mul8.i = mul nuw nsw i32 %row.0.i12316, 10
  %add9.i = add nuw nsw i32 %mul8.i, %col.0.i30307
  %mul10.i = shl nuw nsw i32 %add9.i, 4
  %mul11.i34 = mul nuw nsw i32 %col.0.i30307, 86
  %1 = getelementptr i8, ptr %s, i32 %mul11.i34
  %arrayidx.i35 = getelementptr i8, ptr %1, i32 %j.0.i17310
  %2 = load i8, ptr %arrayidx.i35, align 1
  %conv.i36 = zext i8 %2 to i32
  %add13.i = add nuw nsw i32 %mul10.i, %conv.i36
  %add.ptr15.idx.i = mul nuw nsw i32 %add13.i, 40
  %add.ptr15.i = getelementptr inbounds nuw i8, ptr %accumulator.i6, i32 %add.ptr15.idx.i
  br label %for.body.i19.i

for.body.i19.i:                                   ; preds = %for.body7.i, %for.body.i19.i
  %i.0.i17.i306 = phi i32 [ 0, %for.body7.i ], [ %inc.i23.i, %for.body.i19.i ]
  %arrayidx.i20.i = getelementptr inbounds nuw i64, ptr %add.ptr.i33, i32 %i.0.i17.i306
  %3 = load i64, ptr %arrayidx.i20.i, align 8
  %arrayidx1.i21.i = getelementptr inbounds nuw i64, ptr %add.ptr15.i, i32 %i.0.i17.i306
  %4 = load i64, ptr %arrayidx1.i21.i, align 8
  %xor.i22.i = xor i64 %4, %3
  store i64 %xor.i22.i, ptr %arrayidx1.i21.i, align 8
  %inc.i23.i = add nuw nsw i32 %i.0.i17.i306, 1
  %exitcond.i18.i.not = icmp eq i32 %inc.i23.i, 5
  br i1 %exitcond.i18.i.not, label %m_vec_add.exit24.i, label %for.body.i19.i, !llvm.loop !9

m_vec_add.exit24.i:                               ; preds = %for.body.i19.i
  %inc.i37 = add nuw nsw i32 %col.0.i30307, 1
  %exitcond.i31.not = icmp eq i32 %inc.i37, 10
  br i1 %exitcond.i31.not, label %for.inc17.i, label %for.body7.i, !llvm.loop !10

for.inc17.i:                                      ; preds = %m_vec_add.exit24.i
  %inc16.i = add i32 %P1_used.1.i309, 1
  %inc18.i = add nuw nsw i32 %j.0.i17310, 1
  %exitcond1.i18.not = icmp eq i32 %inc16.i, %0
  br i1 %exitcond1.i18.not, label %for.cond2.i.for.cond21.i.preheader_crit_edge, label %for.cond5.i.preheader, !llvm.loop !11

for.cond26.i.preheader:                           ; preds = %for.cond21.i.preheader, %for.inc49.i
  %j20.0.i313 = phi i32 [ 0, %for.cond21.i.preheader ], [ %inc50.i, %for.inc49.i ]
  br label %for.body29.i

for.body29.i:                                     ; preds = %for.cond26.i.preheader, %m_vec_add.exit.i24
  %col25.0.i312 = phi i32 [ 0, %for.cond26.i.preheader ], [ %inc47.i, %m_vec_add.exit.i24 ]
  %mul30.i = shl nuw nsw i32 %row.0.i12316, 3
  %add31.i = or disjoint i32 %mul30.i, %j20.0.i313
  %add.ptr33.idx.i = mul nuw nsw i32 %add31.i, 40
  %add.ptr33.i = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr33.idx.i
  %mul35.i = mul nuw nsw i32 %row.0.i12316, 10
  %add36.i = add nuw nsw i32 %mul35.i, %col25.0.i312
  %mul37.i = shl nuw nsw i32 %add36.i, 4
  %mul38.i = mul nuw nsw i32 %col25.0.i312, 86
  %5 = getelementptr i8, ptr %s, i32 %mul38.i
  %6 = getelementptr i8, ptr %5, i32 %j20.0.i313
  %arrayidx41.i = getelementptr i8, ptr %6, i32 78
  %7 = load i8, ptr %arrayidx41.i, align 1
  %conv42.i = zext i8 %7 to i32
  %add43.i = add nuw nsw i32 %mul37.i, %conv42.i
  %add.ptr45.idx.i = mul nuw nsw i32 %add43.i, 40
  %add.ptr45.i = getelementptr inbounds nuw i8, ptr %accumulator.i6, i32 %add.ptr45.idx.i
  br label %for.body.i4.i25

for.body.i4.i25:                                  ; preds = %for.body29.i, %for.body.i4.i25
  %i.0.i2.i22311 = phi i32 [ 0, %for.body29.i ], [ %inc.i6.i29, %for.body.i4.i25 ]
  %arrayidx.i5.i26 = getelementptr inbounds nuw i64, ptr %add.ptr33.i, i32 %i.0.i2.i22311
  %8 = load i64, ptr %arrayidx.i5.i26, align 8
  %arrayidx1.i.i27 = getelementptr inbounds nuw i64, ptr %add.ptr45.i, i32 %i.0.i2.i22311
  %9 = load i64, ptr %arrayidx1.i.i27, align 8
  %xor.i.i28 = xor i64 %9, %8
  store i64 %xor.i.i28, ptr %arrayidx1.i.i27, align 8
  %inc.i6.i29 = add nuw nsw i32 %i.0.i2.i22311, 1
  %exitcond.i3.i23.not = icmp eq i32 %inc.i6.i29, 5
  br i1 %exitcond.i3.i23.not, label %m_vec_add.exit.i24, label %for.body.i4.i25, !llvm.loop !12

m_vec_add.exit.i24:                               ; preds = %for.body.i4.i25
  %inc47.i = add nuw nsw i32 %col25.0.i312, 1
  %exitcond2.i20.not = icmp eq i32 %inc47.i, 10
  br i1 %exitcond2.i20.not, label %for.inc49.i, label %for.body29.i, !llvm.loop !13

for.inc49.i:                                      ; preds = %m_vec_add.exit.i24
  %inc50.i = add nuw nsw i32 %j20.0.i313, 1
  %exitcond3.i19.not = icmp eq i32 %inc50.i, 8
  br i1 %exitcond3.i19.not, label %for.inc52.i, label %for.cond26.i.preheader, !llvm.loop !14

for.inc52.i:                                      ; preds = %for.inc49.i
  %inc53.i = add nuw nsw i32 %row.0.i12316, 1
  %indvars.iv.next.i = add nsw i32 %indvars.iv.i314, -1
  %exitcond4.i.not = icmp eq i32 %inc53.i, 78
  br i1 %exitcond4.i.not, label %for.cond56.i.preheader, label %for.cond2.preheader.i, !llvm.loop !15

while.cond.i14.preheader:                         ; preds = %for.inc90.i
  br label %while.body.i16

for.cond61.preheader.i:                           ; preds = %for.cond56.i.preheader, %for.inc90.i
  %row55.0.i325 = phi i32 [ 78, %for.cond56.i.preheader ], [ %inc91.i, %for.inc90.i ]
  %P3_used.0.i324 = phi i32 [ 0, %for.cond56.i.preheader ], [ %split322, %for.inc90.i ]
  %indvars.iv6.i323 = phi i32 [ 8, %for.cond56.i.preheader ], [ %indvars.iv.next7.i, %for.inc90.i ]
  %10 = add i32 %P3_used.0.i324, %indvars.iv6.i323
  br label %for.cond66.i.preheader.lr.ph

for.cond66.i.preheader.lr.ph:                     ; preds = %for.cond61.preheader.i
  br label %for.cond66.i.preheader

for.cond66.i.preheader:                           ; preds = %for.cond66.i.preheader.lr.ph, %for.inc87.i
  %j60.0.i321 = phi i32 [ %row55.0.i325, %for.cond66.i.preheader.lr.ph ], [ %inc88.i, %for.inc87.i ]
  %P3_used.1.i320 = phi i32 [ %P3_used.0.i324, %for.cond66.i.preheader.lr.ph ], [ %inc86.i, %for.inc87.i ]
  br label %for.body69.i

for.body69.i:                                     ; preds = %for.cond66.i.preheader, %m_vec_add.exit15.i
  %col65.0.i318 = phi i32 [ 0, %for.cond66.i.preheader ], [ %inc84.i, %m_vec_add.exit15.i ]
  %add.ptr71.idx.i = mul nsw i32 %P3_used.1.i320, 40
  %add.ptr71.i = getelementptr inbounds i8, ptr %P3, i32 %add.ptr71.idx.i
  %mul73.i = mul nuw nsw i32 %row55.0.i325, 10
  %add74.i = add nuw nsw i32 %mul73.i, %col65.0.i318
  %mul75.i = shl nuw nsw i32 %add74.i, 4
  %mul76.i = mul nuw nsw i32 %col65.0.i318, 86
  %11 = getelementptr i8, ptr %s, i32 %mul76.i
  %arrayidx78.i = getelementptr i8, ptr %11, i32 %j60.0.i321
  %12 = load i8, ptr %arrayidx78.i, align 1
  %conv79.i = zext i8 %12 to i32
  %add80.i = add nuw nsw i32 %mul75.i, %conv79.i
  %add.ptr82.idx.i = mul nuw nsw i32 %add80.i, 40
  %add.ptr82.i = getelementptr inbounds nuw i8, ptr %accumulator.i6, i32 %add.ptr82.idx.i
  br label %for.body.i10.i

for.body.i10.i:                                   ; preds = %for.body69.i, %for.body.i10.i
  %i.0.i8.i317 = phi i32 [ 0, %for.body69.i ], [ %inc.i14.i, %for.body.i10.i ]
  %arrayidx.i11.i = getelementptr inbounds nuw i64, ptr %add.ptr71.i, i32 %i.0.i8.i317
  %13 = load i64, ptr %arrayidx.i11.i, align 8
  %arrayidx1.i12.i = getelementptr inbounds nuw i64, ptr %add.ptr82.i, i32 %i.0.i8.i317
  %14 = load i64, ptr %arrayidx1.i12.i, align 8
  %xor.i13.i = xor i64 %14, %13
  store i64 %xor.i13.i, ptr %arrayidx1.i12.i, align 8
  %inc.i14.i = add nuw nsw i32 %i.0.i8.i317, 1
  %exitcond.i9.i.not = icmp eq i32 %inc.i14.i, 5
  br i1 %exitcond.i9.i.not, label %m_vec_add.exit15.i, label %for.body.i10.i, !llvm.loop !16

m_vec_add.exit15.i:                               ; preds = %for.body.i10.i
  %inc84.i = add nuw nsw i32 %col65.0.i318, 1
  %exitcond5.i.not = icmp eq i32 %inc84.i, 10
  br i1 %exitcond5.i.not, label %for.inc87.i, label %for.body69.i, !llvm.loop !17

for.inc87.i:                                      ; preds = %m_vec_add.exit15.i
  %inc86.i = add i32 %P3_used.1.i320, 1
  %inc88.i = add nuw nsw i32 %j60.0.i321, 1
  %exitcond8.i.not = icmp eq i32 %inc86.i, %10
  br i1 %exitcond8.i.not, label %for.cond61.i.for.inc90.i_crit_edge, label %for.cond66.i.preheader, !llvm.loop !18

for.cond61.i.for.inc90.i_crit_edge:               ; preds = %for.inc87.i
  %split322 = phi i32 [ %inc86.i, %for.inc87.i ]
  br label %for.inc90.i

for.inc90.i:                                      ; preds = %for.cond61.i.for.inc90.i_crit_edge
  %inc91.i = add nuw nsw i32 %row55.0.i325, 1
  %indvars.iv.next7.i = add nsw i32 %indvars.iv6.i323, -1
  %exitcond9.i.not = icmp eq i32 %inc91.i, 86
  br i1 %exitcond9.i.not, label %while.cond.i14.preheader, label %for.cond61.preheader.i, !llvm.loop !19

while.body.i16:                                   ; preds = %while.cond.i14.preheader, %m_vec_multiply_bins.exit
  %i.0.i15341 = phi i32 [ 0, %while.cond.i14.preheader ], [ %inc102.i, %m_vec_multiply_bins.exit ]
  %add.ptr99.idx.i = mul nuw nsw i32 %i.0.i15341, 640
  %add.ptr99.i = getelementptr inbounds nuw i8, ptr %accumulator.i6, i32 %add.ptr99.idx.i
  %add.ptr101.idx.i = mul nuw nsw i32 %i.0.i15341, 40
  %add.ptr.i41 = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 200
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 400
  br label %for.body.i4.i60

for.body.i4.i60:                                  ; preds = %while.body.i16, %for.body.i4.i60
  %i.0.i2.i43326 = phi i32 [ 0, %while.body.i16 ], [ %inc.i6.i63, %for.body.i4.i60 ]
  %arrayidx.i5.i61 = getelementptr inbounds nuw i64, ptr %add.ptr.i41, i32 %i.0.i2.i43326
  %15 = load i64, ptr %arrayidx.i5.i61, align 8
  %and.i.i = and i64 %15, 1229782938247303441
  %xor.i.i62 = lshr i64 %15, 1
  %shr.i.i = and i64 %xor.i.i62, 8608480567731124087
  %mul.i.i = mul nuw i64 %and.i.i, 9
  %xor2.i.i = xor i64 %shr.i.i, %mul.i.i
  %arrayidx3.i.i = getelementptr inbounds nuw i64, ptr %add.ptr1.i, i32 %i.0.i2.i43326
  %16 = load i64, ptr %arrayidx3.i.i, align 8
  %xor4.i.i = xor i64 %16, %xor2.i.i
  store i64 %xor4.i.i, ptr %arrayidx3.i.i, align 8
  %inc.i6.i63 = add nuw nsw i32 %i.0.i2.i43326, 1
  %exitcond.i3.i44.not = icmp eq i32 %inc.i6.i63, 5
  br i1 %exitcond.i3.i44.not, label %m_vec_mul_add_x_inv.exit.i, label %for.body.i4.i60, !llvm.loop !20

m_vec_mul_add_x_inv.exit.i:                       ; preds = %for.body.i4.i60
  %add.ptr2.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 440
  %add.ptr3.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 480
  br label %for.body.i182.i

for.body.i182.i:                                  ; preds = %m_vec_mul_add_x_inv.exit.i, %for.body.i182.i
  %i.0.i180.i327 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit.i ], [ %inc.i192.i, %for.body.i182.i ]
  %arrayidx.i183.i = getelementptr inbounds nuw i64, ptr %add.ptr2.i, i32 %i.0.i180.i327
  %17 = load i64, ptr %arrayidx.i183.i, align 8
  %xor.i184.i = shl i64 %17, 1
  %shl.i185.i = and i64 %xor.i184.i, -1229782938247303442
  %and.i186.i = lshr i64 %17, 3
  %shr.i187.i = and i64 %and.i186.i, 1229782938247303441
  %mul.i188.i = mul nuw nsw i64 %shr.i187.i, 3
  %xor2.i189.i = xor i64 %shl.i185.i, %mul.i188.i
  %arrayidx3.i190.i = getelementptr inbounds nuw i64, ptr %add.ptr3.i, i32 %i.0.i180.i327
  %18 = load i64, ptr %arrayidx3.i190.i, align 8
  %xor4.i191.i = xor i64 %18, %xor2.i189.i
  store i64 %xor4.i191.i, ptr %arrayidx3.i190.i, align 8
  %inc.i192.i = add nuw nsw i32 %i.0.i180.i327, 1
  %exitcond.i181.i.not = icmp eq i32 %inc.i192.i, 5
  br i1 %exitcond.i181.i.not, label %m_vec_mul_add_x.exit193.i, label %for.body.i182.i, !llvm.loop !21

m_vec_mul_add_x.exit193.i:                        ; preds = %for.body.i182.i
  %add.ptr4.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 400
  %add.ptr5.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 280
  br label %for.body.i24.i

for.body.i24.i:                                   ; preds = %m_vec_mul_add_x.exit193.i, %for.body.i24.i
  %i.0.i22.i328 = phi i32 [ 0, %m_vec_mul_add_x.exit193.i ], [ %inc.i33.i, %for.body.i24.i ]
  %arrayidx.i25.i = getelementptr inbounds nuw i64, ptr %add.ptr4.i, i32 %i.0.i22.i328
  %19 = load i64, ptr %arrayidx.i25.i, align 8
  %and.i26.i = and i64 %19, 1229782938247303441
  %xor.i27.i = lshr i64 %19, 1
  %shr.i28.i = and i64 %xor.i27.i, 8608480567731124087
  %mul.i29.i = mul nuw i64 %and.i26.i, 9
  %xor2.i30.i = xor i64 %shr.i28.i, %mul.i29.i
  %arrayidx3.i31.i = getelementptr inbounds nuw i64, ptr %add.ptr5.i, i32 %i.0.i22.i328
  %20 = load i64, ptr %arrayidx3.i31.i, align 8
  %xor4.i32.i = xor i64 %20, %xor2.i30.i
  store i64 %xor4.i32.i, ptr %arrayidx3.i31.i, align 8
  %inc.i33.i = add nuw nsw i32 %i.0.i22.i328, 1
  %exitcond.i23.i.not = icmp eq i32 %inc.i33.i, 5
  br i1 %exitcond.i23.i.not, label %m_vec_mul_add_x_inv.exit34.i, label %for.body.i24.i, !llvm.loop !22

m_vec_mul_add_x_inv.exit34.i:                     ; preds = %for.body.i24.i
  %add.ptr6.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 480
  %add.ptr7.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 240
  br label %for.body.i122.i

for.body.i122.i:                                  ; preds = %m_vec_mul_add_x_inv.exit34.i, %for.body.i122.i
  %i.0.i120.i329 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit34.i ], [ %inc.i132.i, %for.body.i122.i ]
  %arrayidx.i123.i = getelementptr inbounds nuw i64, ptr %add.ptr6.i, i32 %i.0.i120.i329
  %21 = load i64, ptr %arrayidx.i123.i, align 8
  %xor.i124.i = shl i64 %21, 1
  %shl.i125.i = and i64 %xor.i124.i, -1229782938247303442
  %and.i126.i = lshr i64 %21, 3
  %shr.i127.i = and i64 %and.i126.i, 1229782938247303441
  %mul.i128.i = mul nuw nsw i64 %shr.i127.i, 3
  %xor2.i129.i = xor i64 %shl.i125.i, %mul.i128.i
  %arrayidx3.i130.i = getelementptr inbounds nuw i64, ptr %add.ptr7.i, i32 %i.0.i120.i329
  %22 = load i64, ptr %arrayidx3.i130.i, align 8
  %xor4.i131.i = xor i64 %22, %xor2.i129.i
  store i64 %xor4.i131.i, ptr %arrayidx3.i130.i, align 8
  %inc.i132.i = add nuw nsw i32 %i.0.i120.i329, 1
  %exitcond.i121.i.not = icmp eq i32 %inc.i132.i, 5
  br i1 %exitcond.i121.i.not, label %m_vec_mul_add_x.exit133.i, label %for.body.i122.i, !llvm.loop !23

m_vec_mul_add_x.exit133.i:                        ; preds = %for.body.i122.i
  %add.ptr8.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 280
  %add.ptr9.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 560
  br label %for.body.i80.i

for.body.i80.i:                                   ; preds = %m_vec_mul_add_x.exit133.i, %for.body.i80.i
  %i.0.i78.i330 = phi i32 [ 0, %m_vec_mul_add_x.exit133.i ], [ %inc.i89.i, %for.body.i80.i ]
  %arrayidx.i81.i = getelementptr inbounds nuw i64, ptr %add.ptr8.i, i32 %i.0.i78.i330
  %23 = load i64, ptr %arrayidx.i81.i, align 8
  %and.i82.i = and i64 %23, 1229782938247303441
  %xor.i83.i = lshr i64 %23, 1
  %shr.i84.i = and i64 %xor.i83.i, 8608480567731124087
  %mul.i85.i = mul nuw i64 %and.i82.i, 9
  %xor2.i86.i = xor i64 %shr.i84.i, %mul.i85.i
  %arrayidx3.i87.i = getelementptr inbounds nuw i64, ptr %add.ptr9.i, i32 %i.0.i78.i330
  %24 = load i64, ptr %arrayidx3.i87.i, align 8
  %xor4.i88.i = xor i64 %24, %xor2.i86.i
  store i64 %xor4.i88.i, ptr %arrayidx3.i87.i, align 8
  %inc.i89.i = add nuw nsw i32 %i.0.i78.i330, 1
  %exitcond.i79.i.not = icmp eq i32 %inc.i89.i, 5
  br i1 %exitcond.i79.i.not, label %m_vec_mul_add_x_inv.exit90.i, label %for.body.i80.i, !llvm.loop !24

m_vec_mul_add_x_inv.exit90.i:                     ; preds = %for.body.i80.i
  %add.ptr10.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 240
  %add.ptr11.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 120
  br label %for.body.i107.i

for.body.i107.i:                                  ; preds = %m_vec_mul_add_x_inv.exit90.i, %for.body.i107.i
  %i.0.i105.i331 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit90.i ], [ %inc.i117.i, %for.body.i107.i ]
  %arrayidx.i108.i = getelementptr inbounds nuw i64, ptr %add.ptr10.i, i32 %i.0.i105.i331
  %25 = load i64, ptr %arrayidx.i108.i, align 8
  %xor.i109.i = shl i64 %25, 1
  %shl.i110.i = and i64 %xor.i109.i, -1229782938247303442
  %and.i111.i = lshr i64 %25, 3
  %shr.i112.i = and i64 %and.i111.i, 1229782938247303441
  %mul.i113.i = mul nuw nsw i64 %shr.i112.i, 3
  %xor2.i114.i = xor i64 %shl.i110.i, %mul.i113.i
  %arrayidx3.i115.i = getelementptr inbounds nuw i64, ptr %add.ptr11.i, i32 %i.0.i105.i331
  %26 = load i64, ptr %arrayidx3.i115.i, align 8
  %xor4.i116.i = xor i64 %26, %xor2.i114.i
  store i64 %xor4.i116.i, ptr %arrayidx3.i115.i, align 8
  %inc.i117.i = add nuw nsw i32 %i.0.i105.i331, 1
  %exitcond.i106.i.not = icmp eq i32 %inc.i117.i, 5
  br i1 %exitcond.i106.i.not, label %m_vec_mul_add_x.exit118.i, label %for.body.i107.i, !llvm.loop !25

m_vec_mul_add_x.exit118.i:                        ; preds = %for.body.i107.i
  %add.ptr12.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 560
  %add.ptr13.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 600
  br label %for.body.i66.i

for.body.i66.i:                                   ; preds = %m_vec_mul_add_x.exit118.i, %for.body.i66.i
  %i.0.i64.i332 = phi i32 [ 0, %m_vec_mul_add_x.exit118.i ], [ %inc.i75.i, %for.body.i66.i ]
  %arrayidx.i67.i = getelementptr inbounds nuw i64, ptr %add.ptr12.i, i32 %i.0.i64.i332
  %27 = load i64, ptr %arrayidx.i67.i, align 8
  %and.i68.i = and i64 %27, 1229782938247303441
  %xor.i69.i = lshr i64 %27, 1
  %shr.i70.i = and i64 %xor.i69.i, 8608480567731124087
  %mul.i71.i = mul nuw i64 %and.i68.i, 9
  %xor2.i72.i = xor i64 %shr.i70.i, %mul.i71.i
  %arrayidx3.i73.i = getelementptr inbounds nuw i64, ptr %add.ptr13.i, i32 %i.0.i64.i332
  %28 = load i64, ptr %arrayidx3.i73.i, align 8
  %xor4.i74.i = xor i64 %28, %xor2.i72.i
  store i64 %xor4.i74.i, ptr %arrayidx3.i73.i, align 8
  %inc.i75.i = add nuw nsw i32 %i.0.i64.i332, 1
  %exitcond.i65.i.not = icmp eq i32 %inc.i75.i, 5
  br i1 %exitcond.i65.i.not, label %m_vec_mul_add_x_inv.exit76.i, label %for.body.i66.i, !llvm.loop !26

m_vec_mul_add_x_inv.exit76.i:                     ; preds = %for.body.i66.i
  %add.ptr14.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 120
  %add.ptr15.i45 = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 320
  br label %for.body.i94.i

for.body.i94.i:                                   ; preds = %m_vec_mul_add_x_inv.exit76.i, %for.body.i94.i
  %i.0.i92.i333 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit76.i ], [ %inc.i103.i, %for.body.i94.i ]
  %arrayidx.i95.i = getelementptr inbounds nuw i64, ptr %add.ptr14.i, i32 %i.0.i92.i333
  %29 = load i64, ptr %arrayidx.i95.i, align 8
  %xor.i96.i = shl i64 %29, 1
  %shl.i.i = and i64 %xor.i96.i, -1229782938247303442
  %and.i97.i = lshr i64 %29, 3
  %shr.i98.i = and i64 %and.i97.i, 1229782938247303441
  %mul.i99.i = mul nuw nsw i64 %shr.i98.i, 3
  %xor2.i100.i = xor i64 %shl.i.i, %mul.i99.i
  %arrayidx3.i101.i = getelementptr inbounds nuw i64, ptr %add.ptr15.i45, i32 %i.0.i92.i333
  %30 = load i64, ptr %arrayidx3.i101.i, align 8
  %xor4.i102.i = xor i64 %30, %xor2.i100.i
  store i64 %xor4.i102.i, ptr %arrayidx3.i101.i, align 8
  %inc.i103.i = add nuw nsw i32 %i.0.i92.i333, 1
  %exitcond.i93.i.not = icmp eq i32 %inc.i103.i, 5
  br i1 %exitcond.i93.i.not, label %m_vec_mul_add_x.exit.i, label %for.body.i94.i, !llvm.loop !27

m_vec_mul_add_x.exit.i:                           ; preds = %for.body.i94.i
  %add.ptr16.i46 = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 600
  %add.ptr17.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 520
  br label %for.body.i38.i

for.body.i38.i:                                   ; preds = %m_vec_mul_add_x.exit.i, %for.body.i38.i
  %i.0.i36.i334 = phi i32 [ 0, %m_vec_mul_add_x.exit.i ], [ %inc.i47.i, %for.body.i38.i ]
  %arrayidx.i39.i = getelementptr inbounds nuw i64, ptr %add.ptr16.i46, i32 %i.0.i36.i334
  %31 = load i64, ptr %arrayidx.i39.i, align 8
  %and.i40.i = and i64 %31, 1229782938247303441
  %xor.i41.i = lshr i64 %31, 1
  %shr.i42.i = and i64 %xor.i41.i, 8608480567731124087
  %mul.i43.i = mul nuw i64 %and.i40.i, 9
  %xor2.i44.i = xor i64 %shr.i42.i, %mul.i43.i
  %arrayidx3.i45.i = getelementptr inbounds nuw i64, ptr %add.ptr17.i, i32 %i.0.i36.i334
  %32 = load i64, ptr %arrayidx3.i45.i, align 8
  %xor4.i46.i = xor i64 %32, %xor2.i44.i
  store i64 %xor4.i46.i, ptr %arrayidx3.i45.i, align 8
  %inc.i47.i = add nuw nsw i32 %i.0.i36.i334, 1
  %exitcond.i37.i.not = icmp eq i32 %inc.i47.i, 5
  br i1 %exitcond.i37.i.not, label %m_vec_mul_add_x_inv.exit48.i, label %for.body.i38.i, !llvm.loop !28

m_vec_mul_add_x_inv.exit48.i:                     ; preds = %for.body.i38.i
  %add.ptr18.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 320
  %add.ptr19.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 160
  br label %for.body.i167.i

for.body.i167.i:                                  ; preds = %m_vec_mul_add_x_inv.exit48.i, %for.body.i167.i
  %i.0.i165.i335 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit48.i ], [ %inc.i177.i, %for.body.i167.i ]
  %arrayidx.i168.i = getelementptr inbounds nuw i64, ptr %add.ptr18.i, i32 %i.0.i165.i335
  %33 = load i64, ptr %arrayidx.i168.i, align 8
  %xor.i169.i = shl i64 %33, 1
  %shl.i170.i = and i64 %xor.i169.i, -1229782938247303442
  %and.i171.i = lshr i64 %33, 3
  %shr.i172.i = and i64 %and.i171.i, 1229782938247303441
  %mul.i173.i = mul nuw nsw i64 %shr.i172.i, 3
  %xor2.i174.i = xor i64 %shl.i170.i, %mul.i173.i
  %arrayidx3.i175.i = getelementptr inbounds nuw i64, ptr %add.ptr19.i, i32 %i.0.i165.i335
  %34 = load i64, ptr %arrayidx3.i175.i, align 8
  %xor4.i176.i = xor i64 %34, %xor2.i174.i
  store i64 %xor4.i176.i, ptr %arrayidx3.i175.i, align 8
  %inc.i177.i = add nuw nsw i32 %i.0.i165.i335, 1
  %exitcond.i166.i.not = icmp eq i32 %inc.i177.i, 5
  br i1 %exitcond.i166.i.not, label %m_vec_mul_add_x.exit178.i, label %for.body.i167.i, !llvm.loop !29

m_vec_mul_add_x.exit178.i:                        ; preds = %for.body.i167.i
  %add.ptr20.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 520
  %add.ptr21.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 360
  br label %for.body.i52.i

for.body.i52.i:                                   ; preds = %m_vec_mul_add_x.exit178.i, %for.body.i52.i
  %i.0.i50.i336 = phi i32 [ 0, %m_vec_mul_add_x.exit178.i ], [ %inc.i61.i, %for.body.i52.i ]
  %arrayidx.i53.i = getelementptr inbounds nuw i64, ptr %add.ptr20.i, i32 %i.0.i50.i336
  %35 = load i64, ptr %arrayidx.i53.i, align 8
  %and.i54.i = and i64 %35, 1229782938247303441
  %xor.i55.i = lshr i64 %35, 1
  %shr.i56.i = and i64 %xor.i55.i, 8608480567731124087
  %mul.i57.i = mul nuw i64 %and.i54.i, 9
  %xor2.i58.i = xor i64 %shr.i56.i, %mul.i57.i
  %arrayidx3.i59.i = getelementptr inbounds nuw i64, ptr %add.ptr21.i, i32 %i.0.i50.i336
  %36 = load i64, ptr %arrayidx3.i59.i, align 8
  %xor4.i60.i = xor i64 %36, %xor2.i58.i
  store i64 %xor4.i60.i, ptr %arrayidx3.i59.i, align 8
  %inc.i61.i = add nuw nsw i32 %i.0.i50.i336, 1
  %exitcond.i51.i.not = icmp eq i32 %inc.i61.i, 5
  br i1 %exitcond.i51.i.not, label %m_vec_mul_add_x_inv.exit62.i, label %for.body.i52.i, !llvm.loop !30

m_vec_mul_add_x_inv.exit62.i:                     ; preds = %for.body.i52.i
  %add.ptr22.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 160
  %add.ptr23.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 80
  br label %for.body.i137.i

for.body.i137.i:                                  ; preds = %m_vec_mul_add_x_inv.exit62.i, %for.body.i137.i
  %i.0.i135.i337 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit62.i ], [ %inc.i147.i, %for.body.i137.i ]
  %arrayidx.i138.i = getelementptr inbounds nuw i64, ptr %add.ptr22.i, i32 %i.0.i135.i337
  %37 = load i64, ptr %arrayidx.i138.i, align 8
  %xor.i139.i = shl i64 %37, 1
  %shl.i140.i = and i64 %xor.i139.i, -1229782938247303442
  %and.i141.i = lshr i64 %37, 3
  %shr.i142.i = and i64 %and.i141.i, 1229782938247303441
  %mul.i143.i = mul nuw nsw i64 %shr.i142.i, 3
  %xor2.i144.i = xor i64 %shl.i140.i, %mul.i143.i
  %arrayidx3.i145.i = getelementptr inbounds nuw i64, ptr %add.ptr23.i, i32 %i.0.i135.i337
  %38 = load i64, ptr %arrayidx3.i145.i, align 8
  %xor4.i146.i = xor i64 %38, %xor2.i144.i
  store i64 %xor4.i146.i, ptr %arrayidx3.i145.i, align 8
  %inc.i147.i = add nuw nsw i32 %i.0.i135.i337, 1
  %exitcond.i136.i.not = icmp eq i32 %inc.i147.i, 5
  br i1 %exitcond.i136.i.not, label %m_vec_mul_add_x.exit148.i, label %for.body.i137.i, !llvm.loop !31

m_vec_mul_add_x.exit148.i:                        ; preds = %for.body.i137.i
  %add.ptr24.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 360
  %add.ptr25.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 40
  br label %for.body.i10.i57

for.body.i10.i57:                                 ; preds = %m_vec_mul_add_x.exit148.i, %for.body.i10.i57
  %i.0.i8.i48338 = phi i32 [ 0, %m_vec_mul_add_x.exit148.i ], [ %inc.i19.i, %for.body.i10.i57 ]
  %arrayidx.i11.i58 = getelementptr inbounds nuw i64, ptr %add.ptr24.i, i32 %i.0.i8.i48338
  %39 = load i64, ptr %arrayidx.i11.i58, align 8
  %and.i12.i = and i64 %39, 1229782938247303441
  %xor.i13.i59 = lshr i64 %39, 1
  %shr.i14.i = and i64 %xor.i13.i59, 8608480567731124087
  %mul.i15.i = mul nuw i64 %and.i12.i, 9
  %xor2.i16.i = xor i64 %shr.i14.i, %mul.i15.i
  %arrayidx3.i17.i = getelementptr inbounds nuw i64, ptr %add.ptr25.i, i32 %i.0.i8.i48338
  %40 = load i64, ptr %arrayidx3.i17.i, align 8
  %xor4.i18.i = xor i64 %40, %xor2.i16.i
  store i64 %xor4.i18.i, ptr %arrayidx3.i17.i, align 8
  %inc.i19.i = add nuw nsw i32 %i.0.i8.i48338, 1
  %exitcond.i9.i49.not = icmp eq i32 %inc.i19.i, 5
  br i1 %exitcond.i9.i49.not, label %m_vec_mul_add_x_inv.exit20.i, label %for.body.i10.i57, !llvm.loop !32

m_vec_mul_add_x_inv.exit20.i:                     ; preds = %for.body.i10.i57
  %add.ptr26.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 80
  %add.ptr27.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 40
  br label %for.body.i152.i

for.body.i152.i:                                  ; preds = %m_vec_mul_add_x_inv.exit20.i, %for.body.i152.i
  %i.0.i150.i339 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit20.i ], [ %inc.i162.i, %for.body.i152.i ]
  %arrayidx.i153.i = getelementptr inbounds nuw i64, ptr %add.ptr26.i, i32 %i.0.i150.i339
  %41 = load i64, ptr %arrayidx.i153.i, align 8
  %xor.i154.i = shl i64 %41, 1
  %shl.i155.i = and i64 %xor.i154.i, -1229782938247303442
  %and.i156.i = lshr i64 %41, 3
  %shr.i157.i = and i64 %and.i156.i, 1229782938247303441
  %mul.i158.i = mul nuw nsw i64 %shr.i157.i, 3
  %xor2.i159.i = xor i64 %shl.i155.i, %mul.i158.i
  %arrayidx3.i160.i = getelementptr inbounds nuw i64, ptr %add.ptr27.i, i32 %i.0.i150.i339
  %42 = load i64, ptr %arrayidx3.i160.i, align 8
  %xor4.i161.i = xor i64 %42, %xor2.i159.i
  store i64 %xor4.i161.i, ptr %arrayidx3.i160.i, align 8
  %inc.i162.i = add nuw nsw i32 %i.0.i150.i339, 1
  %exitcond.i151.i.not = icmp eq i32 %inc.i162.i, 5
  br i1 %exitcond.i151.i.not, label %m_vec_mul_add_x.exit163.i, label %for.body.i152.i, !llvm.loop !33

m_vec_mul_add_x.exit163.i:                        ; preds = %for.body.i152.i
  %add.ptr101.i = getelementptr inbounds nuw i8, ptr %PS, i32 %add.ptr101.idx.i
  %add.ptr28.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 40
  br label %for.body.i.i53

for.body.i.i53:                                   ; preds = %m_vec_mul_add_x.exit163.i, %for.body.i.i53
  %i.0.i.i51340 = phi i32 [ 0, %m_vec_mul_add_x.exit163.i ], [ %inc.i.i56, %for.body.i.i53 ]
  %arrayidx.i.i54 = getelementptr inbounds nuw i64, ptr %add.ptr28.i, i32 %i.0.i.i51340
  %43 = load i64, ptr %arrayidx.i.i54, align 8
  %arrayidx1.i.i55 = getelementptr inbounds nuw i64, ptr %add.ptr101.i, i32 %i.0.i.i51340
  store i64 %43, ptr %arrayidx1.i.i55, align 8
  %inc.i.i56 = add nuw nsw i32 %i.0.i.i51340, 1
  %exitcond.i.i52.not = icmp eq i32 %inc.i.i56, 5
  br i1 %exitcond.i.i52.not, label %m_vec_multiply_bins.exit, label %for.body.i.i53, !llvm.loop !34

m_vec_multiply_bins.exit:                         ; preds = %for.body.i.i53
  %inc102.i = add nuw nsw i32 %i.0.i15341, 1
  %exitcond10.i.not = icmp eq i32 %inc102.i, 860
  br i1 %exitcond10.i.not, label %mayo_generic_m_calculate_PS.exit, label %while.body.i16, !llvm.loop !35

mayo_generic_m_calculate_PS.exit:                 ; preds = %m_vec_multiply_bins.exit
  call void @llvm.lifetime.end.p0(i64 550400, ptr nonnull %accumulator.i6)
  call void @llvm.lifetime.start.p0(i64 64000, ptr nonnull %accumulator.i)
  br label %for.body.i.i

for.cond.i1.preheader:                            ; preds = %for.body.i.i
  br label %for.cond1.i.preheader

for.body.i.i:                                     ; preds = %mayo_generic_m_calculate_PS.exit, %for.body.i.i
  %i.0.i.i342 = phi i32 [ 0, %mayo_generic_m_calculate_PS.exit ], [ %inc.i.i, %for.body.i.i ]
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %accumulator.i, i32 %i.0.i.i342
  store i8 0, ptr %arrayidx.i.i, align 1
  %inc.i.i = add nuw nsw i32 %i.0.i.i342, 1
  %exitcond.i.i.not = icmp eq i32 %inc.i.i, 64000
  br i1 %exitcond.i.i.not, label %for.cond.i1.preheader, label %for.body.i.i, !llvm.loop !36

for.cond1.i.preheader:                            ; preds = %for.cond.i1.preheader, %for.inc20.i
  %row.0.i346 = phi i32 [ 0, %for.cond.i1.preheader ], [ %inc21.i, %for.inc20.i ]
  br label %for.cond4.i.preheader

while.cond.i.preheader:                           ; preds = %for.inc20.i
  br label %while.body.i

for.cond4.i.preheader:                            ; preds = %for.cond1.i.preheader, %for.inc18.i
  %j.0.i345 = phi i32 [ 0, %for.cond1.i.preheader ], [ %inc.i4, %for.inc18.i ]
  br label %for.body6.i

for.body6.i:                                      ; preds = %for.cond4.i.preheader, %m_vec_add.exit.i
  %col.0.i344 = phi i32 [ 0, %for.cond4.i.preheader ], [ %add17.i, %m_vec_add.exit.i ]
  %mul.i = mul nuw nsw i32 %j.0.i345, 10
  %add7.i = add nuw nsw i32 %mul.i, %col.0.i344
  %add.ptr.idx.i = mul nuw nsw i32 %add7.i, 40
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %PS, i32 %add.ptr.idx.i
  %mul9.i = mul nuw nsw i32 %row.0.i346, 10
  %add10.i = add nuw nsw i32 %mul9.i, %col.0.i344
  %mul11.i = shl nuw nsw i32 %add10.i, 4
  %mul12.i = mul nuw nsw i32 %row.0.i346, 86
  %44 = getelementptr i8, ptr %s, i32 %mul12.i
  %arrayidx.i5 = getelementptr i8, ptr %44, i32 %j.0.i345
  %45 = load i8, ptr %arrayidx.i5, align 1
  %conv.i = zext i8 %45 to i32
  %add14.i = add nuw nsw i32 %mul11.i, %conv.i
  %add.ptr16.idx.i = mul nuw nsw i32 %add14.i, 40
  %add.ptr16.i = getelementptr inbounds nuw i8, ptr %accumulator.i, i32 %add.ptr16.idx.i
  br label %for.body.i4.i

for.body.i4.i:                                    ; preds = %for.body6.i, %for.body.i4.i
  %i.0.i2.i343 = phi i32 [ 0, %for.body6.i ], [ %inc.i6.i, %for.body.i4.i ]
  %arrayidx.i5.i = getelementptr inbounds nuw i64, ptr %add.ptr.i, i32 %i.0.i2.i343
  %46 = load i64, ptr %arrayidx.i5.i, align 8
  %arrayidx1.i.i = getelementptr inbounds nuw i64, ptr %add.ptr16.i, i32 %i.0.i2.i343
  %47 = load i64, ptr %arrayidx1.i.i, align 8
  %xor.i.i = xor i64 %47, %46
  store i64 %xor.i.i, ptr %arrayidx1.i.i, align 8
  %inc.i6.i = add nuw nsw i32 %i.0.i2.i343, 1
  %exitcond.i3.i.not = icmp eq i32 %inc.i6.i, 5
  br i1 %exitcond.i3.i.not, label %m_vec_add.exit.i, label %for.body.i4.i, !llvm.loop !37

m_vec_add.exit.i:                                 ; preds = %for.body.i4.i
  %add17.i = add nuw nsw i32 %col.0.i344, 1
  %exitcond.i3.not = icmp eq i32 %add17.i, 10
  br i1 %exitcond.i3.not, label %for.inc18.i, label %for.body6.i, !llvm.loop !38

for.inc18.i:                                      ; preds = %m_vec_add.exit.i
  %inc.i4 = add nuw nsw i32 %j.0.i345, 1
  %exitcond1.i.not = icmp eq i32 %inc.i4, 86
  br i1 %exitcond1.i.not, label %for.inc20.i, label %for.cond4.i.preheader, !llvm.loop !39

for.inc20.i:                                      ; preds = %for.inc18.i
  %inc21.i = add nuw nsw i32 %row.0.i346, 1
  %exitcond2.i.not = icmp eq i32 %inc21.i, 10
  br i1 %exitcond2.i.not, label %while.cond.i.preheader, label %for.cond1.i.preheader, !llvm.loop !40

while.body.i:                                     ; preds = %while.cond.i.preheader, %m_vec_multiply_bins.exit303
  %i.0.i2362 = phi i32 [ 0, %while.cond.i.preheader ], [ %inc32.i, %m_vec_multiply_bins.exit303 ]
  %add.ptr29.idx.i = mul nuw nsw i32 %i.0.i2362, 640
  %add.ptr29.i = getelementptr inbounds nuw i8, ptr %accumulator.i, i32 %add.ptr29.idx.i
  %add.ptr31.idx.i = mul nuw nsw i32 %i.0.i2362, 40
  %add.ptr.i64 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 200
  %add.ptr1.i65 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 400
  br label %for.body.i4.i293

for.body.i4.i293:                                 ; preds = %while.body.i, %for.body.i4.i293
  %i.0.i2.i67347 = phi i32 [ 0, %while.body.i ], [ %inc.i6.i302, %for.body.i4.i293 ]
  %arrayidx.i5.i294 = getelementptr inbounds nuw i64, ptr %add.ptr.i64, i32 %i.0.i2.i67347
  %48 = load i64, ptr %arrayidx.i5.i294, align 8
  %and.i.i295 = and i64 %48, 1229782938247303441
  %xor.i.i296 = lshr i64 %48, 1
  %shr.i.i297 = and i64 %xor.i.i296, 8608480567731124087
  %mul.i.i298 = mul nuw i64 %and.i.i295, 9
  %xor2.i.i299 = xor i64 %shr.i.i297, %mul.i.i298
  %arrayidx3.i.i300 = getelementptr inbounds nuw i64, ptr %add.ptr1.i65, i32 %i.0.i2.i67347
  %49 = load i64, ptr %arrayidx3.i.i300, align 8
  %xor4.i.i301 = xor i64 %49, %xor2.i.i299
  store i64 %xor4.i.i301, ptr %arrayidx3.i.i300, align 8
  %inc.i6.i302 = add nuw nsw i32 %i.0.i2.i67347, 1
  %exitcond.i3.i68.not = icmp eq i32 %inc.i6.i302, 5
  br i1 %exitcond.i3.i68.not, label %m_vec_mul_add_x_inv.exit.i69, label %for.body.i4.i293, !llvm.loop !41

m_vec_mul_add_x_inv.exit.i69:                     ; preds = %for.body.i4.i293
  %add.ptr2.i70 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 440
  %add.ptr3.i71 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 480
  br label %for.body.i182.i282

for.body.i182.i282:                               ; preds = %m_vec_mul_add_x_inv.exit.i69, %for.body.i182.i282
  %i.0.i180.i73348 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit.i69 ], [ %inc.i192.i292, %for.body.i182.i282 ]
  %arrayidx.i183.i283 = getelementptr inbounds nuw i64, ptr %add.ptr2.i70, i32 %i.0.i180.i73348
  %50 = load i64, ptr %arrayidx.i183.i283, align 8
  %xor.i184.i284 = shl i64 %50, 1
  %shl.i185.i285 = and i64 %xor.i184.i284, -1229782938247303442
  %and.i186.i286 = lshr i64 %50, 3
  %shr.i187.i287 = and i64 %and.i186.i286, 1229782938247303441
  %mul.i188.i288 = mul nuw nsw i64 %shr.i187.i287, 3
  %xor2.i189.i289 = xor i64 %shl.i185.i285, %mul.i188.i288
  %arrayidx3.i190.i290 = getelementptr inbounds nuw i64, ptr %add.ptr3.i71, i32 %i.0.i180.i73348
  %51 = load i64, ptr %arrayidx3.i190.i290, align 8
  %xor4.i191.i291 = xor i64 %51, %xor2.i189.i289
  store i64 %xor4.i191.i291, ptr %arrayidx3.i190.i290, align 8
  %inc.i192.i292 = add nuw nsw i32 %i.0.i180.i73348, 1
  %exitcond.i181.i74.not = icmp eq i32 %inc.i192.i292, 5
  br i1 %exitcond.i181.i74.not, label %m_vec_mul_add_x.exit193.i75, label %for.body.i182.i282, !llvm.loop !42

m_vec_mul_add_x.exit193.i75:                      ; preds = %for.body.i182.i282
  %add.ptr4.i76 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 400
  %add.ptr5.i77 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 280
  br label %for.body.i24.i272

for.body.i24.i272:                                ; preds = %m_vec_mul_add_x.exit193.i75, %for.body.i24.i272
  %i.0.i22.i79349 = phi i32 [ 0, %m_vec_mul_add_x.exit193.i75 ], [ %inc.i33.i281, %for.body.i24.i272 ]
  %arrayidx.i25.i273 = getelementptr inbounds nuw i64, ptr %add.ptr4.i76, i32 %i.0.i22.i79349
  %52 = load i64, ptr %arrayidx.i25.i273, align 8
  %and.i26.i274 = and i64 %52, 1229782938247303441
  %xor.i27.i275 = lshr i64 %52, 1
  %shr.i28.i276 = and i64 %xor.i27.i275, 8608480567731124087
  %mul.i29.i277 = mul nuw i64 %and.i26.i274, 9
  %xor2.i30.i278 = xor i64 %shr.i28.i276, %mul.i29.i277
  %arrayidx3.i31.i279 = getelementptr inbounds nuw i64, ptr %add.ptr5.i77, i32 %i.0.i22.i79349
  %53 = load i64, ptr %arrayidx3.i31.i279, align 8
  %xor4.i32.i280 = xor i64 %53, %xor2.i30.i278
  store i64 %xor4.i32.i280, ptr %arrayidx3.i31.i279, align 8
  %inc.i33.i281 = add nuw nsw i32 %i.0.i22.i79349, 1
  %exitcond.i23.i80.not = icmp eq i32 %inc.i33.i281, 5
  br i1 %exitcond.i23.i80.not, label %m_vec_mul_add_x_inv.exit34.i81, label %for.body.i24.i272, !llvm.loop !43

m_vec_mul_add_x_inv.exit34.i81:                   ; preds = %for.body.i24.i272
  %add.ptr6.i82 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 480
  %add.ptr7.i83 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 240
  br label %for.body.i122.i261

for.body.i122.i261:                               ; preds = %m_vec_mul_add_x_inv.exit34.i81, %for.body.i122.i261
  %i.0.i120.i85350 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit34.i81 ], [ %inc.i132.i271, %for.body.i122.i261 ]
  %arrayidx.i123.i262 = getelementptr inbounds nuw i64, ptr %add.ptr6.i82, i32 %i.0.i120.i85350
  %54 = load i64, ptr %arrayidx.i123.i262, align 8
  %xor.i124.i263 = shl i64 %54, 1
  %shl.i125.i264 = and i64 %xor.i124.i263, -1229782938247303442
  %and.i126.i265 = lshr i64 %54, 3
  %shr.i127.i266 = and i64 %and.i126.i265, 1229782938247303441
  %mul.i128.i267 = mul nuw nsw i64 %shr.i127.i266, 3
  %xor2.i129.i268 = xor i64 %shl.i125.i264, %mul.i128.i267
  %arrayidx3.i130.i269 = getelementptr inbounds nuw i64, ptr %add.ptr7.i83, i32 %i.0.i120.i85350
  %55 = load i64, ptr %arrayidx3.i130.i269, align 8
  %xor4.i131.i270 = xor i64 %55, %xor2.i129.i268
  store i64 %xor4.i131.i270, ptr %arrayidx3.i130.i269, align 8
  %inc.i132.i271 = add nuw nsw i32 %i.0.i120.i85350, 1
  %exitcond.i121.i86.not = icmp eq i32 %inc.i132.i271, 5
  br i1 %exitcond.i121.i86.not, label %m_vec_mul_add_x.exit133.i87, label %for.body.i122.i261, !llvm.loop !44

m_vec_mul_add_x.exit133.i87:                      ; preds = %for.body.i122.i261
  %add.ptr8.i88 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 280
  %add.ptr9.i89 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 560
  br label %for.body.i80.i251

for.body.i80.i251:                                ; preds = %m_vec_mul_add_x.exit133.i87, %for.body.i80.i251
  %i.0.i78.i91351 = phi i32 [ 0, %m_vec_mul_add_x.exit133.i87 ], [ %inc.i89.i260, %for.body.i80.i251 ]
  %arrayidx.i81.i252 = getelementptr inbounds nuw i64, ptr %add.ptr8.i88, i32 %i.0.i78.i91351
  %56 = load i64, ptr %arrayidx.i81.i252, align 8
  %and.i82.i253 = and i64 %56, 1229782938247303441
  %xor.i83.i254 = lshr i64 %56, 1
  %shr.i84.i255 = and i64 %xor.i83.i254, 8608480567731124087
  %mul.i85.i256 = mul nuw i64 %and.i82.i253, 9
  %xor2.i86.i257 = xor i64 %shr.i84.i255, %mul.i85.i256
  %arrayidx3.i87.i258 = getelementptr inbounds nuw i64, ptr %add.ptr9.i89, i32 %i.0.i78.i91351
  %57 = load i64, ptr %arrayidx3.i87.i258, align 8
  %xor4.i88.i259 = xor i64 %57, %xor2.i86.i257
  store i64 %xor4.i88.i259, ptr %arrayidx3.i87.i258, align 8
  %inc.i89.i260 = add nuw nsw i32 %i.0.i78.i91351, 1
  %exitcond.i79.i92.not = icmp eq i32 %inc.i89.i260, 5
  br i1 %exitcond.i79.i92.not, label %m_vec_mul_add_x_inv.exit90.i93, label %for.body.i80.i251, !llvm.loop !45

m_vec_mul_add_x_inv.exit90.i93:                   ; preds = %for.body.i80.i251
  %add.ptr10.i94 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 240
  %add.ptr11.i95 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 120
  br label %for.body.i107.i240

for.body.i107.i240:                               ; preds = %m_vec_mul_add_x_inv.exit90.i93, %for.body.i107.i240
  %i.0.i105.i97352 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit90.i93 ], [ %inc.i117.i250, %for.body.i107.i240 ]
  %arrayidx.i108.i241 = getelementptr inbounds nuw i64, ptr %add.ptr10.i94, i32 %i.0.i105.i97352
  %58 = load i64, ptr %arrayidx.i108.i241, align 8
  %xor.i109.i242 = shl i64 %58, 1
  %shl.i110.i243 = and i64 %xor.i109.i242, -1229782938247303442
  %and.i111.i244 = lshr i64 %58, 3
  %shr.i112.i245 = and i64 %and.i111.i244, 1229782938247303441
  %mul.i113.i246 = mul nuw nsw i64 %shr.i112.i245, 3
  %xor2.i114.i247 = xor i64 %shl.i110.i243, %mul.i113.i246
  %arrayidx3.i115.i248 = getelementptr inbounds nuw i64, ptr %add.ptr11.i95, i32 %i.0.i105.i97352
  %59 = load i64, ptr %arrayidx3.i115.i248, align 8
  %xor4.i116.i249 = xor i64 %59, %xor2.i114.i247
  store i64 %xor4.i116.i249, ptr %arrayidx3.i115.i248, align 8
  %inc.i117.i250 = add nuw nsw i32 %i.0.i105.i97352, 1
  %exitcond.i106.i98.not = icmp eq i32 %inc.i117.i250, 5
  br i1 %exitcond.i106.i98.not, label %m_vec_mul_add_x.exit118.i99, label %for.body.i107.i240, !llvm.loop !46

m_vec_mul_add_x.exit118.i99:                      ; preds = %for.body.i107.i240
  %add.ptr12.i100 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 560
  %add.ptr13.i101 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 600
  br label %for.body.i66.i230

for.body.i66.i230:                                ; preds = %m_vec_mul_add_x.exit118.i99, %for.body.i66.i230
  %i.0.i64.i103353 = phi i32 [ 0, %m_vec_mul_add_x.exit118.i99 ], [ %inc.i75.i239, %for.body.i66.i230 ]
  %arrayidx.i67.i231 = getelementptr inbounds nuw i64, ptr %add.ptr12.i100, i32 %i.0.i64.i103353
  %60 = load i64, ptr %arrayidx.i67.i231, align 8
  %and.i68.i232 = and i64 %60, 1229782938247303441
  %xor.i69.i233 = lshr i64 %60, 1
  %shr.i70.i234 = and i64 %xor.i69.i233, 8608480567731124087
  %mul.i71.i235 = mul nuw i64 %and.i68.i232, 9
  %xor2.i72.i236 = xor i64 %shr.i70.i234, %mul.i71.i235
  %arrayidx3.i73.i237 = getelementptr inbounds nuw i64, ptr %add.ptr13.i101, i32 %i.0.i64.i103353
  %61 = load i64, ptr %arrayidx3.i73.i237, align 8
  %xor4.i74.i238 = xor i64 %61, %xor2.i72.i236
  store i64 %xor4.i74.i238, ptr %arrayidx3.i73.i237, align 8
  %inc.i75.i239 = add nuw nsw i32 %i.0.i64.i103353, 1
  %exitcond.i65.i104.not = icmp eq i32 %inc.i75.i239, 5
  br i1 %exitcond.i65.i104.not, label %m_vec_mul_add_x_inv.exit76.i105, label %for.body.i66.i230, !llvm.loop !47

m_vec_mul_add_x_inv.exit76.i105:                  ; preds = %for.body.i66.i230
  %add.ptr14.i106 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 120
  %add.ptr15.i107 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 320
  br label %for.body.i94.i219

for.body.i94.i219:                                ; preds = %m_vec_mul_add_x_inv.exit76.i105, %for.body.i94.i219
  %i.0.i92.i109354 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit76.i105 ], [ %inc.i103.i229, %for.body.i94.i219 ]
  %arrayidx.i95.i220 = getelementptr inbounds nuw i64, ptr %add.ptr14.i106, i32 %i.0.i92.i109354
  %62 = load i64, ptr %arrayidx.i95.i220, align 8
  %xor.i96.i221 = shl i64 %62, 1
  %shl.i.i222 = and i64 %xor.i96.i221, -1229782938247303442
  %and.i97.i223 = lshr i64 %62, 3
  %shr.i98.i224 = and i64 %and.i97.i223, 1229782938247303441
  %mul.i99.i225 = mul nuw nsw i64 %shr.i98.i224, 3
  %xor2.i100.i226 = xor i64 %shl.i.i222, %mul.i99.i225
  %arrayidx3.i101.i227 = getelementptr inbounds nuw i64, ptr %add.ptr15.i107, i32 %i.0.i92.i109354
  %63 = load i64, ptr %arrayidx3.i101.i227, align 8
  %xor4.i102.i228 = xor i64 %63, %xor2.i100.i226
  store i64 %xor4.i102.i228, ptr %arrayidx3.i101.i227, align 8
  %inc.i103.i229 = add nuw nsw i32 %i.0.i92.i109354, 1
  %exitcond.i93.i110.not = icmp eq i32 %inc.i103.i229, 5
  br i1 %exitcond.i93.i110.not, label %m_vec_mul_add_x.exit.i111, label %for.body.i94.i219, !llvm.loop !48

m_vec_mul_add_x.exit.i111:                        ; preds = %for.body.i94.i219
  %add.ptr16.i112 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 600
  %add.ptr17.i113 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 520
  br label %for.body.i38.i209

for.body.i38.i209:                                ; preds = %m_vec_mul_add_x.exit.i111, %for.body.i38.i209
  %i.0.i36.i115355 = phi i32 [ 0, %m_vec_mul_add_x.exit.i111 ], [ %inc.i47.i218, %for.body.i38.i209 ]
  %arrayidx.i39.i210 = getelementptr inbounds nuw i64, ptr %add.ptr16.i112, i32 %i.0.i36.i115355
  %64 = load i64, ptr %arrayidx.i39.i210, align 8
  %and.i40.i211 = and i64 %64, 1229782938247303441
  %xor.i41.i212 = lshr i64 %64, 1
  %shr.i42.i213 = and i64 %xor.i41.i212, 8608480567731124087
  %mul.i43.i214 = mul nuw i64 %and.i40.i211, 9
  %xor2.i44.i215 = xor i64 %shr.i42.i213, %mul.i43.i214
  %arrayidx3.i45.i216 = getelementptr inbounds nuw i64, ptr %add.ptr17.i113, i32 %i.0.i36.i115355
  %65 = load i64, ptr %arrayidx3.i45.i216, align 8
  %xor4.i46.i217 = xor i64 %65, %xor2.i44.i215
  store i64 %xor4.i46.i217, ptr %arrayidx3.i45.i216, align 8
  %inc.i47.i218 = add nuw nsw i32 %i.0.i36.i115355, 1
  %exitcond.i37.i116.not = icmp eq i32 %inc.i47.i218, 5
  br i1 %exitcond.i37.i116.not, label %m_vec_mul_add_x_inv.exit48.i117, label %for.body.i38.i209, !llvm.loop !49

m_vec_mul_add_x_inv.exit48.i117:                  ; preds = %for.body.i38.i209
  %add.ptr18.i118 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 320
  %add.ptr19.i119 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 160
  br label %for.body.i167.i198

for.body.i167.i198:                               ; preds = %m_vec_mul_add_x_inv.exit48.i117, %for.body.i167.i198
  %i.0.i165.i121356 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit48.i117 ], [ %inc.i177.i208, %for.body.i167.i198 ]
  %arrayidx.i168.i199 = getelementptr inbounds nuw i64, ptr %add.ptr18.i118, i32 %i.0.i165.i121356
  %66 = load i64, ptr %arrayidx.i168.i199, align 8
  %xor.i169.i200 = shl i64 %66, 1
  %shl.i170.i201 = and i64 %xor.i169.i200, -1229782938247303442
  %and.i171.i202 = lshr i64 %66, 3
  %shr.i172.i203 = and i64 %and.i171.i202, 1229782938247303441
  %mul.i173.i204 = mul nuw nsw i64 %shr.i172.i203, 3
  %xor2.i174.i205 = xor i64 %shl.i170.i201, %mul.i173.i204
  %arrayidx3.i175.i206 = getelementptr inbounds nuw i64, ptr %add.ptr19.i119, i32 %i.0.i165.i121356
  %67 = load i64, ptr %arrayidx3.i175.i206, align 8
  %xor4.i176.i207 = xor i64 %67, %xor2.i174.i205
  store i64 %xor4.i176.i207, ptr %arrayidx3.i175.i206, align 8
  %inc.i177.i208 = add nuw nsw i32 %i.0.i165.i121356, 1
  %exitcond.i166.i122.not = icmp eq i32 %inc.i177.i208, 5
  br i1 %exitcond.i166.i122.not, label %m_vec_mul_add_x.exit178.i123, label %for.body.i167.i198, !llvm.loop !50

m_vec_mul_add_x.exit178.i123:                     ; preds = %for.body.i167.i198
  %add.ptr20.i124 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 520
  %add.ptr21.i125 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 360
  br label %for.body.i52.i188

for.body.i52.i188:                                ; preds = %m_vec_mul_add_x.exit178.i123, %for.body.i52.i188
  %i.0.i50.i127357 = phi i32 [ 0, %m_vec_mul_add_x.exit178.i123 ], [ %inc.i61.i197, %for.body.i52.i188 ]
  %arrayidx.i53.i189 = getelementptr inbounds nuw i64, ptr %add.ptr20.i124, i32 %i.0.i50.i127357
  %68 = load i64, ptr %arrayidx.i53.i189, align 8
  %and.i54.i190 = and i64 %68, 1229782938247303441
  %xor.i55.i191 = lshr i64 %68, 1
  %shr.i56.i192 = and i64 %xor.i55.i191, 8608480567731124087
  %mul.i57.i193 = mul nuw i64 %and.i54.i190, 9
  %xor2.i58.i194 = xor i64 %shr.i56.i192, %mul.i57.i193
  %arrayidx3.i59.i195 = getelementptr inbounds nuw i64, ptr %add.ptr21.i125, i32 %i.0.i50.i127357
  %69 = load i64, ptr %arrayidx3.i59.i195, align 8
  %xor4.i60.i196 = xor i64 %69, %xor2.i58.i194
  store i64 %xor4.i60.i196, ptr %arrayidx3.i59.i195, align 8
  %inc.i61.i197 = add nuw nsw i32 %i.0.i50.i127357, 1
  %exitcond.i51.i128.not = icmp eq i32 %inc.i61.i197, 5
  br i1 %exitcond.i51.i128.not, label %m_vec_mul_add_x_inv.exit62.i129, label %for.body.i52.i188, !llvm.loop !51

m_vec_mul_add_x_inv.exit62.i129:                  ; preds = %for.body.i52.i188
  %add.ptr22.i130 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 160
  %add.ptr23.i131 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 80
  br label %for.body.i137.i177

for.body.i137.i177:                               ; preds = %m_vec_mul_add_x_inv.exit62.i129, %for.body.i137.i177
  %i.0.i135.i133358 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit62.i129 ], [ %inc.i147.i187, %for.body.i137.i177 ]
  %arrayidx.i138.i178 = getelementptr inbounds nuw i64, ptr %add.ptr22.i130, i32 %i.0.i135.i133358
  %70 = load i64, ptr %arrayidx.i138.i178, align 8
  %xor.i139.i179 = shl i64 %70, 1
  %shl.i140.i180 = and i64 %xor.i139.i179, -1229782938247303442
  %and.i141.i181 = lshr i64 %70, 3
  %shr.i142.i182 = and i64 %and.i141.i181, 1229782938247303441
  %mul.i143.i183 = mul nuw nsw i64 %shr.i142.i182, 3
  %xor2.i144.i184 = xor i64 %shl.i140.i180, %mul.i143.i183
  %arrayidx3.i145.i185 = getelementptr inbounds nuw i64, ptr %add.ptr23.i131, i32 %i.0.i135.i133358
  %71 = load i64, ptr %arrayidx3.i145.i185, align 8
  %xor4.i146.i186 = xor i64 %71, %xor2.i144.i184
  store i64 %xor4.i146.i186, ptr %arrayidx3.i145.i185, align 8
  %inc.i147.i187 = add nuw nsw i32 %i.0.i135.i133358, 1
  %exitcond.i136.i134.not = icmp eq i32 %inc.i147.i187, 5
  br i1 %exitcond.i136.i134.not, label %m_vec_mul_add_x.exit148.i135, label %for.body.i137.i177, !llvm.loop !52

m_vec_mul_add_x.exit148.i135:                     ; preds = %for.body.i137.i177
  %add.ptr24.i136 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 360
  %add.ptr25.i137 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 40
  br label %for.body.i10.i167

for.body.i10.i167:                                ; preds = %m_vec_mul_add_x.exit148.i135, %for.body.i10.i167
  %i.0.i8.i139359 = phi i32 [ 0, %m_vec_mul_add_x.exit148.i135 ], [ %inc.i19.i176, %for.body.i10.i167 ]
  %arrayidx.i11.i168 = getelementptr inbounds nuw i64, ptr %add.ptr24.i136, i32 %i.0.i8.i139359
  %72 = load i64, ptr %arrayidx.i11.i168, align 8
  %and.i12.i169 = and i64 %72, 1229782938247303441
  %xor.i13.i170 = lshr i64 %72, 1
  %shr.i14.i171 = and i64 %xor.i13.i170, 8608480567731124087
  %mul.i15.i172 = mul nuw i64 %and.i12.i169, 9
  %xor2.i16.i173 = xor i64 %shr.i14.i171, %mul.i15.i172
  %arrayidx3.i17.i174 = getelementptr inbounds nuw i64, ptr %add.ptr25.i137, i32 %i.0.i8.i139359
  %73 = load i64, ptr %arrayidx3.i17.i174, align 8
  %xor4.i18.i175 = xor i64 %73, %xor2.i16.i173
  store i64 %xor4.i18.i175, ptr %arrayidx3.i17.i174, align 8
  %inc.i19.i176 = add nuw nsw i32 %i.0.i8.i139359, 1
  %exitcond.i9.i140.not = icmp eq i32 %inc.i19.i176, 5
  br i1 %exitcond.i9.i140.not, label %m_vec_mul_add_x_inv.exit20.i141, label %for.body.i10.i167, !llvm.loop !53

m_vec_mul_add_x_inv.exit20.i141:                  ; preds = %for.body.i10.i167
  %add.ptr26.i142 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 80
  %add.ptr27.i143 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 40
  br label %for.body.i152.i156

for.body.i152.i156:                               ; preds = %m_vec_mul_add_x_inv.exit20.i141, %for.body.i152.i156
  %i.0.i150.i145360 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit20.i141 ], [ %inc.i162.i166, %for.body.i152.i156 ]
  %arrayidx.i153.i157 = getelementptr inbounds nuw i64, ptr %add.ptr26.i142, i32 %i.0.i150.i145360
  %74 = load i64, ptr %arrayidx.i153.i157, align 8
  %xor.i154.i158 = shl i64 %74, 1
  %shl.i155.i159 = and i64 %xor.i154.i158, -1229782938247303442
  %and.i156.i160 = lshr i64 %74, 3
  %shr.i157.i161 = and i64 %and.i156.i160, 1229782938247303441
  %mul.i158.i162 = mul nuw nsw i64 %shr.i157.i161, 3
  %xor2.i159.i163 = xor i64 %shl.i155.i159, %mul.i158.i162
  %arrayidx3.i160.i164 = getelementptr inbounds nuw i64, ptr %add.ptr27.i143, i32 %i.0.i150.i145360
  %75 = load i64, ptr %arrayidx3.i160.i164, align 8
  %xor4.i161.i165 = xor i64 %75, %xor2.i159.i163
  store i64 %xor4.i161.i165, ptr %arrayidx3.i160.i164, align 8
  %inc.i162.i166 = add nuw nsw i32 %i.0.i150.i145360, 1
  %exitcond.i151.i146.not = icmp eq i32 %inc.i162.i166, 5
  br i1 %exitcond.i151.i146.not, label %m_vec_mul_add_x.exit163.i147, label %for.body.i152.i156, !llvm.loop !54

m_vec_mul_add_x.exit163.i147:                     ; preds = %for.body.i152.i156
  %add.ptr31.i = getelementptr inbounds nuw i8, ptr %SPS, i32 %add.ptr31.idx.i
  %add.ptr28.i148 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 40
  br label %for.body.i.i152

for.body.i.i152:                                  ; preds = %m_vec_mul_add_x.exit163.i147, %for.body.i.i152
  %i.0.i.i150361 = phi i32 [ 0, %m_vec_mul_add_x.exit163.i147 ], [ %inc.i.i155, %for.body.i.i152 ]
  %arrayidx.i.i153 = getelementptr inbounds nuw i64, ptr %add.ptr28.i148, i32 %i.0.i.i150361
  %76 = load i64, ptr %arrayidx.i.i153, align 8
  %arrayidx1.i.i154 = getelementptr inbounds nuw i64, ptr %add.ptr31.i, i32 %i.0.i.i150361
  store i64 %76, ptr %arrayidx1.i.i154, align 8
  %inc.i.i155 = add nuw nsw i32 %i.0.i.i150361, 1
  %exitcond.i.i151.not = icmp eq i32 %inc.i.i155, 5
  br i1 %exitcond.i.i151.not, label %m_vec_multiply_bins.exit303, label %for.body.i.i152, !llvm.loop !55

m_vec_multiply_bins.exit303:                      ; preds = %for.body.i.i152
  %inc32.i = add nuw nsw i32 %i.0.i2362, 1
  %exitcond3.i.not = icmp eq i32 %inc32.i, 100
  br i1 %exitcond3.i.not, label %mayo_generic_m_calculate_SPS.exit, label %while.body.i, !llvm.loop !56

mayo_generic_m_calculate_SPS.exit:                ; preds = %m_vec_multiply_bins.exit303
  call void @llvm.lifetime.end.p0(i64 64000, ptr nonnull %accumulator.i)
  ret void
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #1 {
entry:
  %p_buf = alloca [128 x i8], align 16
  call void @mayo_memset(ptr %p_buf, i8 0, i32 128)
  %pk = alloca [18705 x i64], align 16
  call void @mayo_memset(ptr %pk, i8 0, i32 149640)
  %pk1 = alloca [18705 x i64], align 16
  call void @mayo_memset(ptr %pk1, i8 0, i32 149640)
  %pk2 = alloca [18705 x i64], align 16
  call void @mayo_memset(ptr %pk2, i8 0, i32 149640)
  %s = alloca [860 x i8], align 16
  call void @mayo_memset(ptr %s, i8 0, i32 860)
  %SPS = alloca [500 x i64], align 16
  call void @mayo_memset(ptr %SPS, i8 0, i32 4000)
  call fastcc void @m_calculate_PS_SPS(ptr nonnull %p_buf, ptr %pk, ptr %pk1, ptr %pk2, ptr %s, ptr %SPS)
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #2

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
  br label %for.cond, !llvm.loop !57

for.end:                                          ; preds = %for.cond
  ret void
}

attributes #0 = { inlinehint nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #1 = { inlinehint }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
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
!12 = distinct !{!12, !6}
!13 = distinct !{!13, !6}
!14 = distinct !{!14, !6}
!15 = distinct !{!15, !6}
!16 = distinct !{!16, !6}
!17 = distinct !{!17, !6}
!18 = distinct !{!18, !6}
!19 = distinct !{!19, !6}
!20 = distinct !{!20, !6}
!21 = distinct !{!21, !6}
!22 = distinct !{!22, !6}
!23 = distinct !{!23, !6}
!24 = distinct !{!24, !6}
!25 = distinct !{!25, !6}
!26 = distinct !{!26, !6}
!27 = distinct !{!27, !6}
!28 = distinct !{!28, !6}
!29 = distinct !{!29, !6}
!30 = distinct !{!30, !6}
!31 = distinct !{!31, !6}
!32 = distinct !{!32, !6}
!33 = distinct !{!33, !6}
!34 = distinct !{!34, !6}
!35 = distinct !{!35, !6}
!36 = distinct !{!36, !6}
!37 = distinct !{!37, !6}
!38 = distinct !{!38, !6}
!39 = distinct !{!39, !6}
!40 = distinct !{!40, !6}
!41 = distinct !{!41, !6}
!42 = distinct !{!42, !6}
!43 = distinct !{!43, !6}
!44 = distinct !{!44, !6}
!45 = distinct !{!45, !6}
!46 = distinct !{!46, !6}
!47 = distinct !{!47, !6}
!48 = distinct !{!48, !6}
!49 = distinct !{!49, !6}
!50 = distinct !{!50, !6}
!51 = distinct !{!51, !6}
!52 = distinct !{!52, !6}
!53 = distinct !{!53, !6}
!54 = distinct !{!54, !6}
!55 = distinct !{!55, !6}
!56 = distinct !{!56, !6}
!57 = distinct !{!57, !6}
