; ModuleID = '../mayo_IR/mayo1.ll'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

@f_tail = internal unnamed_addr constant [4 x i8] c"\08\01\01\00", align 1
@pqmayo_MAYO_1_ref_unsigned_char_blocker = dso_local global i8 0, align 1

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
define dso_local fastcc void @eval_public_map(ptr noundef %p, ptr noundef nonnull %s, ptr noundef nonnull %P1, ptr noundef nonnull %P2, ptr noundef nonnull %P3, ptr noundef nonnull %eval) unnamed_addr #0 {
entry:
  %temp.i = alloca [5 x i64], align 8
  %accumulator.i20 = alloca [68800 x i64], align 8
  %accumulator.i = alloca [8000 x i64], align 8
  %PS.i = alloca [4300 x i64], align 8
  %SPS = alloca [500 x i64], align 8
  %zero = alloca [78 x i8], align 1
  br label %for.body.i4

for.body.i4:                                      ; preds = %entry, %for.body.i4
  %i.0.i2336 = phi i32 [ 0, %entry ], [ %inc.i6, %for.body.i4 ]
  %arrayidx.i5 = getelementptr inbounds nuw i8, ptr %SPS, i32 %i.0.i2336
  store i8 0, ptr %arrayidx.i5, align 1
  %inc.i6 = add nuw nsw i32 %i.0.i2336, 1
  %exitcond.i3.not = icmp eq i32 %inc.i6, 4000
  br i1 %exitcond.i3.not, label %mayo_memset.exit7, label %for.body.i4, !llvm.loop !7

mayo_memset.exit7:                                ; preds = %for.body.i4
  call void @llvm.lifetime.start.p0(i64 34400, ptr nonnull %PS.i)
  br label %for.body.i11

for.body.i11:                                     ; preds = %mayo_memset.exit7, %for.body.i11
  %i.0.i9337 = phi i32 [ 0, %mayo_memset.exit7 ], [ %inc.i13, %for.body.i11 ]
  %arrayidx.i12 = getelementptr inbounds nuw i8, ptr %PS.i, i32 %i.0.i9337
  store i8 0, ptr %arrayidx.i12, align 1
  %inc.i13 = add nuw nsw i32 %i.0.i9337, 1
  %exitcond.i10.not = icmp eq i32 %inc.i13, 34400
  br i1 %exitcond.i10.not, label %mayo_memset.exit14, label %for.body.i11, !llvm.loop !8

mayo_memset.exit14:                               ; preds = %for.body.i11
  call void @llvm.lifetime.start.p0(i64 550400, ptr nonnull %accumulator.i20)
  br label %for.body.i.i52

for.cond.i25.preheader:                           ; preds = %for.body.i.i52
  br label %for.cond2.preheader.i

for.body.i.i52:                                   ; preds = %mayo_memset.exit14, %for.body.i.i52
  %i.0.i.i22338 = phi i32 [ 0, %mayo_memset.exit14 ], [ %inc.i.i54, %for.body.i.i52 ]
  %arrayidx.i.i53 = getelementptr inbounds nuw i8, ptr %accumulator.i20, i32 %i.0.i.i22338
  store i8 0, ptr %arrayidx.i.i53, align 1
  %inc.i.i54 = add nuw nsw i32 %i.0.i.i22338, 1
  %exitcond.i.i23.not = icmp eq i32 %inc.i.i54, 550400
  br i1 %exitcond.i.i23.not, label %for.cond.i25.preheader, label %for.body.i.i52, !llvm.loop !9

for.cond56.i.preheader:                           ; preds = %for.inc52.i
  br label %for.cond61.preheader.i

for.cond2.preheader.i:                            ; preds = %for.cond.i25.preheader, %for.inc52.i
  %row.0.i26349 = phi i32 [ 0, %for.cond.i25.preheader ], [ %inc53.i, %for.inc52.i ]
  %P1_used.0.i348 = phi i32 [ 0, %for.cond.i25.preheader ], [ %split, %for.inc52.i ]
  %indvars.iv.i347 = phi i32 [ 78, %for.cond.i25.preheader ], [ %indvars.iv.next.i, %for.inc52.i ]
  %0 = add i32 %P1_used.0.i348, %indvars.iv.i347
  br label %for.cond5.i.preheader.lr.ph

for.cond5.i.preheader.lr.ph:                      ; preds = %for.cond2.preheader.i
  br label %for.cond5.i.preheader

for.cond2.i.for.cond21.i.preheader_crit_edge:     ; preds = %for.inc17.i
  %split = phi i32 [ %inc16.i, %for.inc17.i ]
  br label %for.cond21.i.preheader

for.cond21.i.preheader:                           ; preds = %for.cond2.i.for.cond21.i.preheader_crit_edge
  br label %for.cond26.i.preheader

for.cond5.i.preheader:                            ; preds = %for.cond5.i.preheader.lr.ph, %for.inc17.i
  %j.0.i31343 = phi i32 [ %row.0.i26349, %for.cond5.i.preheader.lr.ph ], [ %inc18.i, %for.inc17.i ]
  %P1_used.1.i342 = phi i32 [ %P1_used.0.i348, %for.cond5.i.preheader.lr.ph ], [ %inc16.i, %for.inc17.i ]
  br label %for.body7.i

for.body7.i:                                      ; preds = %for.cond5.i.preheader, %m_vec_add.exit.i45
  %col.0.i35340 = phi i32 [ 0, %for.cond5.i.preheader ], [ %inc.i46, %m_vec_add.exit.i45 ]
  %add.ptr.idx.i37 = mul nsw i32 %P1_used.1.i342, 40
  %add.ptr.i38 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.i37
  %mul8.i = mul nuw nsw i32 %row.0.i26349, 10
  %add9.i = add nuw nsw i32 %mul8.i, %col.0.i35340
  %mul10.i = shl nuw nsw i32 %add9.i, 4
  %mul11.i39 = mul nuw nsw i32 %col.0.i35340, 86
  %1 = getelementptr i8, ptr %s, i32 %mul11.i39
  %arrayidx.i40 = getelementptr i8, ptr %1, i32 %j.0.i31343
  %2 = load i8, ptr %arrayidx.i40, align 1
  %conv.i41 = zext i8 %2 to i32
  %add13.i = add nuw nsw i32 %mul10.i, %conv.i41
  %add.ptr15.idx.i = mul nuw nsw i32 %add13.i, 40
  %add.ptr15.i = getelementptr inbounds nuw i8, ptr %accumulator.i20, i32 %add.ptr15.idx.i
  br label %for.body.i4.i47

for.body.i4.i47:                                  ; preds = %for.body7.i, %for.body.i4.i47
  %i.0.i2.i43339 = phi i32 [ 0, %for.body7.i ], [ %inc.i6.i51, %for.body.i4.i47 ]
  %arrayidx.i5.i48 = getelementptr inbounds nuw i64, ptr %add.ptr.i38, i32 %i.0.i2.i43339
  %3 = load i64, ptr %arrayidx.i5.i48, align 8
  %arrayidx1.i.i49 = getelementptr inbounds nuw i64, ptr %add.ptr15.i, i32 %i.0.i2.i43339
  %4 = load i64, ptr %arrayidx1.i.i49, align 8
  %xor.i.i50 = xor i64 %4, %3
  store i64 %xor.i.i50, ptr %arrayidx1.i.i49, align 8
  %inc.i6.i51 = add nuw nsw i32 %i.0.i2.i43339, 1
  %exitcond.i3.i44.not = icmp eq i32 %inc.i6.i51, 5
  br i1 %exitcond.i3.i44.not, label %m_vec_add.exit.i45, label %for.body.i4.i47, !llvm.loop !10

m_vec_add.exit.i45:                               ; preds = %for.body.i4.i47
  %inc.i46 = add nuw nsw i32 %col.0.i35340, 1
  %exitcond.i36.not = icmp eq i32 %inc.i46, 10
  br i1 %exitcond.i36.not, label %for.inc17.i, label %for.body7.i, !llvm.loop !11

for.inc17.i:                                      ; preds = %m_vec_add.exit.i45
  %inc16.i = add i32 %P1_used.1.i342, 1
  %inc18.i = add nuw nsw i32 %j.0.i31343, 1
  %exitcond1.i32.not = icmp eq i32 %inc16.i, %0
  br i1 %exitcond1.i32.not, label %for.cond2.i.for.cond21.i.preheader_crit_edge, label %for.cond5.i.preheader, !llvm.loop !12

for.cond26.i.preheader:                           ; preds = %for.cond21.i.preheader, %for.inc49.i
  %j20.0.i346 = phi i32 [ 0, %for.cond21.i.preheader ], [ %inc50.i, %for.inc49.i ]
  br label %for.body29.i

for.body29.i:                                     ; preds = %for.cond26.i.preheader, %m_vec_add.exit15.i
  %col25.0.i345 = phi i32 [ 0, %for.cond26.i.preheader ], [ %inc47.i, %m_vec_add.exit15.i ]
  %mul30.i = shl nuw nsw i32 %row.0.i26349, 3
  %add31.i = or disjoint i32 %mul30.i, %j20.0.i346
  %add.ptr33.idx.i = mul nuw nsw i32 %add31.i, 40
  %add.ptr33.i = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr33.idx.i
  %mul35.i = mul nuw nsw i32 %row.0.i26349, 10
  %add36.i = add nuw nsw i32 %mul35.i, %col25.0.i345
  %mul37.i = shl nuw nsw i32 %add36.i, 4
  %mul38.i = mul nuw nsw i32 %col25.0.i345, 86
  %5 = getelementptr i8, ptr %s, i32 %mul38.i
  %6 = getelementptr i8, ptr %5, i32 %j20.0.i346
  %arrayidx41.i = getelementptr i8, ptr %6, i32 78
  %7 = load i8, ptr %arrayidx41.i, align 1
  %conv42.i = zext i8 %7 to i32
  %add43.i = add nuw nsw i32 %mul37.i, %conv42.i
  %add.ptr45.idx.i = mul nuw nsw i32 %add43.i, 40
  %add.ptr45.i = getelementptr inbounds nuw i8, ptr %accumulator.i20, i32 %add.ptr45.idx.i
  br label %for.body.i10.i

for.body.i10.i:                                   ; preds = %for.body29.i, %for.body.i10.i
  %i.0.i8.i344 = phi i32 [ 0, %for.body29.i ], [ %inc.i14.i, %for.body.i10.i ]
  %arrayidx.i11.i = getelementptr inbounds nuw i64, ptr %add.ptr33.i, i32 %i.0.i8.i344
  %8 = load i64, ptr %arrayidx.i11.i, align 8
  %arrayidx1.i12.i = getelementptr inbounds nuw i64, ptr %add.ptr45.i, i32 %i.0.i8.i344
  %9 = load i64, ptr %arrayidx1.i12.i, align 8
  %xor.i13.i = xor i64 %9, %8
  store i64 %xor.i13.i, ptr %arrayidx1.i12.i, align 8
  %inc.i14.i = add nuw nsw i32 %i.0.i8.i344, 1
  %exitcond.i9.i.not = icmp eq i32 %inc.i14.i, 5
  br i1 %exitcond.i9.i.not, label %m_vec_add.exit15.i, label %for.body.i10.i, !llvm.loop !13

m_vec_add.exit15.i:                               ; preds = %for.body.i10.i
  %inc47.i = add nuw nsw i32 %col25.0.i345, 1
  %exitcond2.i34.not = icmp eq i32 %inc47.i, 10
  br i1 %exitcond2.i34.not, label %for.inc49.i, label %for.body29.i, !llvm.loop !14

for.inc49.i:                                      ; preds = %m_vec_add.exit15.i
  %inc50.i = add nuw nsw i32 %j20.0.i346, 1
  %exitcond3.i33.not = icmp eq i32 %inc50.i, 8
  br i1 %exitcond3.i33.not, label %for.inc52.i, label %for.cond26.i.preheader, !llvm.loop !15

for.inc52.i:                                      ; preds = %for.inc49.i
  %inc53.i = add nuw nsw i32 %row.0.i26349, 1
  %indvars.iv.next.i = add nsw i32 %indvars.iv.i347, -1
  %exitcond4.i.not = icmp eq i32 %inc53.i, 78
  br i1 %exitcond4.i.not, label %for.cond56.i.preheader, label %for.cond2.preheader.i, !llvm.loop !16

while.cond.i28.preheader:                         ; preds = %for.inc90.i
  br label %while.body.i30

for.cond61.preheader.i:                           ; preds = %for.cond56.i.preheader, %for.inc90.i
  %row55.0.i358 = phi i32 [ 78, %for.cond56.i.preheader ], [ %inc91.i, %for.inc90.i ]
  %P3_used.0.i357 = phi i32 [ 0, %for.cond56.i.preheader ], [ %split355, %for.inc90.i ]
  %indvars.iv6.i356 = phi i32 [ 8, %for.cond56.i.preheader ], [ %indvars.iv.next7.i, %for.inc90.i ]
  %10 = add i32 %P3_used.0.i357, %indvars.iv6.i356
  br label %for.cond66.i.preheader.lr.ph

for.cond66.i.preheader.lr.ph:                     ; preds = %for.cond61.preheader.i
  br label %for.cond66.i.preheader

for.cond66.i.preheader:                           ; preds = %for.cond66.i.preheader.lr.ph, %for.inc87.i
  %j60.0.i354 = phi i32 [ %row55.0.i358, %for.cond66.i.preheader.lr.ph ], [ %inc88.i, %for.inc87.i ]
  %P3_used.1.i353 = phi i32 [ %P3_used.0.i357, %for.cond66.i.preheader.lr.ph ], [ %inc86.i, %for.inc87.i ]
  br label %for.body69.i

for.body69.i:                                     ; preds = %for.cond66.i.preheader, %m_vec_add.exit24.i
  %col65.0.i351 = phi i32 [ 0, %for.cond66.i.preheader ], [ %inc84.i, %m_vec_add.exit24.i ]
  %add.ptr71.idx.i = mul nsw i32 %P3_used.1.i353, 40
  %add.ptr71.i = getelementptr inbounds i8, ptr %P3, i32 %add.ptr71.idx.i
  %mul73.i = mul nuw nsw i32 %row55.0.i358, 10
  %add74.i = add nuw nsw i32 %mul73.i, %col65.0.i351
  %mul75.i = shl nuw nsw i32 %add74.i, 4
  %mul76.i = mul nuw nsw i32 %col65.0.i351, 86
  %11 = getelementptr i8, ptr %s, i32 %mul76.i
  %arrayidx78.i = getelementptr i8, ptr %11, i32 %j60.0.i354
  %12 = load i8, ptr %arrayidx78.i, align 1
  %conv79.i = zext i8 %12 to i32
  %add80.i = add nuw nsw i32 %mul75.i, %conv79.i
  %add.ptr82.idx.i = mul nuw nsw i32 %add80.i, 40
  %add.ptr82.i = getelementptr inbounds nuw i8, ptr %accumulator.i20, i32 %add.ptr82.idx.i
  br label %for.body.i19.i

for.body.i19.i:                                   ; preds = %for.body69.i, %for.body.i19.i
  %i.0.i17.i350 = phi i32 [ 0, %for.body69.i ], [ %inc.i23.i, %for.body.i19.i ]
  %arrayidx.i20.i = getelementptr inbounds nuw i64, ptr %add.ptr71.i, i32 %i.0.i17.i350
  %13 = load i64, ptr %arrayidx.i20.i, align 8
  %arrayidx1.i21.i = getelementptr inbounds nuw i64, ptr %add.ptr82.i, i32 %i.0.i17.i350
  %14 = load i64, ptr %arrayidx1.i21.i, align 8
  %xor.i22.i = xor i64 %14, %13
  store i64 %xor.i22.i, ptr %arrayidx1.i21.i, align 8
  %inc.i23.i = add nuw nsw i32 %i.0.i17.i350, 1
  %exitcond.i18.i.not = icmp eq i32 %inc.i23.i, 5
  br i1 %exitcond.i18.i.not, label %m_vec_add.exit24.i, label %for.body.i19.i, !llvm.loop !17

m_vec_add.exit24.i:                               ; preds = %for.body.i19.i
  %inc84.i = add nuw nsw i32 %col65.0.i351, 1
  %exitcond5.i.not = icmp eq i32 %inc84.i, 10
  br i1 %exitcond5.i.not, label %for.inc87.i, label %for.body69.i, !llvm.loop !18

for.inc87.i:                                      ; preds = %m_vec_add.exit24.i
  %inc86.i = add i32 %P3_used.1.i353, 1
  %inc88.i = add nuw nsw i32 %j60.0.i354, 1
  %exitcond8.i.not = icmp eq i32 %inc86.i, %10
  br i1 %exitcond8.i.not, label %for.cond61.i.for.inc90.i_crit_edge, label %for.cond66.i.preheader, !llvm.loop !19

for.cond61.i.for.inc90.i_crit_edge:               ; preds = %for.inc87.i
  %split355 = phi i32 [ %inc86.i, %for.inc87.i ]
  br label %for.inc90.i

for.inc90.i:                                      ; preds = %for.cond61.i.for.inc90.i_crit_edge
  %inc91.i = add nuw nsw i32 %row55.0.i358, 1
  %indvars.iv.next7.i = add nsw i32 %indvars.iv6.i356, -1
  %exitcond9.i.not = icmp eq i32 %inc91.i, 86
  br i1 %exitcond9.i.not, label %while.cond.i28.preheader, label %for.cond61.preheader.i, !llvm.loop !20

while.body.i30:                                   ; preds = %while.cond.i28.preheader, %m_vec_multiply_bins.exit
  %i.0.i29374 = phi i32 [ 0, %while.cond.i28.preheader ], [ %inc102.i, %m_vec_multiply_bins.exit ]
  %add.ptr99.idx.i = mul nuw nsw i32 %i.0.i29374, 640
  %add.ptr99.i = getelementptr inbounds nuw i8, ptr %accumulator.i20, i32 %add.ptr99.idx.i
  %add.ptr101.idx.i = mul nuw nsw i32 %i.0.i29374, 40
  %add.ptr.i73 = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 200
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 400
  br label %for.body.i80.i

for.body.i80.i:                                   ; preds = %while.body.i30, %for.body.i80.i
  %i.0.i78.i359 = phi i32 [ 0, %while.body.i30 ], [ %inc.i89.i, %for.body.i80.i ]
  %arrayidx.i81.i = getelementptr inbounds nuw i64, ptr %add.ptr.i73, i32 %i.0.i78.i359
  %15 = load i64, ptr %arrayidx.i81.i, align 8
  %and.i82.i = and i64 %15, 1229782938247303441
  %xor.i83.i = lshr i64 %15, 1
  %shr.i84.i = and i64 %xor.i83.i, 8608480567731124087
  %mul.i85.i = mul nuw i64 %and.i82.i, 9
  %xor2.i86.i = xor i64 %shr.i84.i, %mul.i85.i
  %arrayidx3.i87.i = getelementptr inbounds nuw i64, ptr %add.ptr1.i, i32 %i.0.i78.i359
  %16 = load i64, ptr %arrayidx3.i87.i, align 8
  %xor4.i88.i = xor i64 %16, %xor2.i86.i
  store i64 %xor4.i88.i, ptr %arrayidx3.i87.i, align 8
  %inc.i89.i = add nuw nsw i32 %i.0.i78.i359, 1
  %exitcond.i79.i.not = icmp eq i32 %inc.i89.i, 5
  br i1 %exitcond.i79.i.not, label %m_vec_mul_add_x_inv.exit90.i, label %for.body.i80.i, !llvm.loop !21

m_vec_mul_add_x_inv.exit90.i:                     ; preds = %for.body.i80.i
  %add.ptr2.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 440
  %add.ptr3.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 480
  br label %for.body.i182.i

for.body.i182.i:                                  ; preds = %m_vec_mul_add_x_inv.exit90.i, %for.body.i182.i
  %i.0.i180.i360 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit90.i ], [ %inc.i192.i, %for.body.i182.i ]
  %arrayidx.i183.i = getelementptr inbounds nuw i64, ptr %add.ptr2.i, i32 %i.0.i180.i360
  %17 = load i64, ptr %arrayidx.i183.i, align 8
  %xor.i184.i = shl i64 %17, 1
  %shl.i185.i = and i64 %xor.i184.i, -1229782938247303442
  %and.i186.i = lshr i64 %17, 3
  %shr.i187.i = and i64 %and.i186.i, 1229782938247303441
  %mul.i188.i = mul nuw nsw i64 %shr.i187.i, 3
  %xor2.i189.i = xor i64 %shl.i185.i, %mul.i188.i
  %arrayidx3.i190.i = getelementptr inbounds nuw i64, ptr %add.ptr3.i, i32 %i.0.i180.i360
  %18 = load i64, ptr %arrayidx3.i190.i, align 8
  %xor4.i191.i = xor i64 %18, %xor2.i189.i
  store i64 %xor4.i191.i, ptr %arrayidx3.i190.i, align 8
  %inc.i192.i = add nuw nsw i32 %i.0.i180.i360, 1
  %exitcond.i181.i.not = icmp eq i32 %inc.i192.i, 5
  br i1 %exitcond.i181.i.not, label %m_vec_mul_add_x.exit193.i, label %for.body.i182.i, !llvm.loop !22

m_vec_mul_add_x.exit193.i:                        ; preds = %for.body.i182.i
  %add.ptr4.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 400
  %add.ptr5.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 280
  br label %for.body.i66.i

for.body.i66.i:                                   ; preds = %m_vec_mul_add_x.exit193.i, %for.body.i66.i
  %i.0.i64.i361 = phi i32 [ 0, %m_vec_mul_add_x.exit193.i ], [ %inc.i75.i, %for.body.i66.i ]
  %arrayidx.i67.i = getelementptr inbounds nuw i64, ptr %add.ptr4.i, i32 %i.0.i64.i361
  %19 = load i64, ptr %arrayidx.i67.i, align 8
  %and.i68.i = and i64 %19, 1229782938247303441
  %xor.i69.i = lshr i64 %19, 1
  %shr.i70.i = and i64 %xor.i69.i, 8608480567731124087
  %mul.i71.i = mul nuw i64 %and.i68.i, 9
  %xor2.i72.i = xor i64 %shr.i70.i, %mul.i71.i
  %arrayidx3.i73.i = getelementptr inbounds nuw i64, ptr %add.ptr5.i, i32 %i.0.i64.i361
  %20 = load i64, ptr %arrayidx3.i73.i, align 8
  %xor4.i74.i = xor i64 %20, %xor2.i72.i
  store i64 %xor4.i74.i, ptr %arrayidx3.i73.i, align 8
  %inc.i75.i = add nuw nsw i32 %i.0.i64.i361, 1
  %exitcond.i65.i.not = icmp eq i32 %inc.i75.i, 5
  br i1 %exitcond.i65.i.not, label %m_vec_mul_add_x_inv.exit76.i, label %for.body.i66.i, !llvm.loop !23

m_vec_mul_add_x_inv.exit76.i:                     ; preds = %for.body.i66.i
  %add.ptr6.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 480
  %add.ptr7.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 240
  br label %for.body.i152.i

for.body.i152.i:                                  ; preds = %m_vec_mul_add_x_inv.exit76.i, %for.body.i152.i
  %i.0.i150.i362 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit76.i ], [ %inc.i162.i, %for.body.i152.i ]
  %arrayidx.i153.i = getelementptr inbounds nuw i64, ptr %add.ptr6.i, i32 %i.0.i150.i362
  %21 = load i64, ptr %arrayidx.i153.i, align 8
  %xor.i154.i = shl i64 %21, 1
  %shl.i155.i = and i64 %xor.i154.i, -1229782938247303442
  %and.i156.i = lshr i64 %21, 3
  %shr.i157.i = and i64 %and.i156.i, 1229782938247303441
  %mul.i158.i = mul nuw nsw i64 %shr.i157.i, 3
  %xor2.i159.i = xor i64 %shl.i155.i, %mul.i158.i
  %arrayidx3.i160.i = getelementptr inbounds nuw i64, ptr %add.ptr7.i, i32 %i.0.i150.i362
  %22 = load i64, ptr %arrayidx3.i160.i, align 8
  %xor4.i161.i = xor i64 %22, %xor2.i159.i
  store i64 %xor4.i161.i, ptr %arrayidx3.i160.i, align 8
  %inc.i162.i = add nuw nsw i32 %i.0.i150.i362, 1
  %exitcond.i151.i.not = icmp eq i32 %inc.i162.i, 5
  br i1 %exitcond.i151.i.not, label %m_vec_mul_add_x.exit163.i, label %for.body.i152.i, !llvm.loop !24

m_vec_mul_add_x.exit163.i:                        ; preds = %for.body.i152.i
  %add.ptr8.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 280
  %add.ptr9.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 560
  br label %for.body.i52.i

for.body.i52.i:                                   ; preds = %m_vec_mul_add_x.exit163.i, %for.body.i52.i
  %i.0.i50.i363 = phi i32 [ 0, %m_vec_mul_add_x.exit163.i ], [ %inc.i61.i, %for.body.i52.i ]
  %arrayidx.i53.i = getelementptr inbounds nuw i64, ptr %add.ptr8.i, i32 %i.0.i50.i363
  %23 = load i64, ptr %arrayidx.i53.i, align 8
  %and.i54.i = and i64 %23, 1229782938247303441
  %xor.i55.i = lshr i64 %23, 1
  %shr.i56.i = and i64 %xor.i55.i, 8608480567731124087
  %mul.i57.i = mul nuw i64 %and.i54.i, 9
  %xor2.i58.i = xor i64 %shr.i56.i, %mul.i57.i
  %arrayidx3.i59.i = getelementptr inbounds nuw i64, ptr %add.ptr9.i, i32 %i.0.i50.i363
  %24 = load i64, ptr %arrayidx3.i59.i, align 8
  %xor4.i60.i = xor i64 %24, %xor2.i58.i
  store i64 %xor4.i60.i, ptr %arrayidx3.i59.i, align 8
  %inc.i61.i = add nuw nsw i32 %i.0.i50.i363, 1
  %exitcond.i51.i.not = icmp eq i32 %inc.i61.i, 5
  br i1 %exitcond.i51.i.not, label %m_vec_mul_add_x_inv.exit62.i, label %for.body.i52.i, !llvm.loop !25

m_vec_mul_add_x_inv.exit62.i:                     ; preds = %for.body.i52.i
  %add.ptr10.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 240
  %add.ptr11.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 120
  br label %for.body.i94.i

for.body.i94.i:                                   ; preds = %m_vec_mul_add_x_inv.exit62.i, %for.body.i94.i
  %i.0.i92.i364 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit62.i ], [ %inc.i103.i, %for.body.i94.i ]
  %arrayidx.i95.i = getelementptr inbounds nuw i64, ptr %add.ptr10.i, i32 %i.0.i92.i364
  %25 = load i64, ptr %arrayidx.i95.i, align 8
  %xor.i96.i = shl i64 %25, 1
  %shl.i.i = and i64 %xor.i96.i, -1229782938247303442
  %and.i97.i = lshr i64 %25, 3
  %shr.i98.i = and i64 %and.i97.i, 1229782938247303441
  %mul.i99.i = mul nuw nsw i64 %shr.i98.i, 3
  %xor2.i100.i = xor i64 %shl.i.i, %mul.i99.i
  %arrayidx3.i101.i = getelementptr inbounds nuw i64, ptr %add.ptr11.i, i32 %i.0.i92.i364
  %26 = load i64, ptr %arrayidx3.i101.i, align 8
  %xor4.i102.i = xor i64 %26, %xor2.i100.i
  store i64 %xor4.i102.i, ptr %arrayidx3.i101.i, align 8
  %inc.i103.i = add nuw nsw i32 %i.0.i92.i364, 1
  %exitcond.i93.i.not = icmp eq i32 %inc.i103.i, 5
  br i1 %exitcond.i93.i.not, label %m_vec_mul_add_x.exit.i, label %for.body.i94.i, !llvm.loop !26

m_vec_mul_add_x.exit.i:                           ; preds = %for.body.i94.i
  %add.ptr12.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 560
  %add.ptr13.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 600
  br label %for.body.i38.i

for.body.i38.i:                                   ; preds = %m_vec_mul_add_x.exit.i, %for.body.i38.i
  %i.0.i36.i365 = phi i32 [ 0, %m_vec_mul_add_x.exit.i ], [ %inc.i47.i, %for.body.i38.i ]
  %arrayidx.i39.i = getelementptr inbounds nuw i64, ptr %add.ptr12.i, i32 %i.0.i36.i365
  %27 = load i64, ptr %arrayidx.i39.i, align 8
  %and.i40.i = and i64 %27, 1229782938247303441
  %xor.i41.i = lshr i64 %27, 1
  %shr.i42.i = and i64 %xor.i41.i, 8608480567731124087
  %mul.i43.i = mul nuw i64 %and.i40.i, 9
  %xor2.i44.i = xor i64 %shr.i42.i, %mul.i43.i
  %arrayidx3.i45.i = getelementptr inbounds nuw i64, ptr %add.ptr13.i, i32 %i.0.i36.i365
  %28 = load i64, ptr %arrayidx3.i45.i, align 8
  %xor4.i46.i = xor i64 %28, %xor2.i44.i
  store i64 %xor4.i46.i, ptr %arrayidx3.i45.i, align 8
  %inc.i47.i = add nuw nsw i32 %i.0.i36.i365, 1
  %exitcond.i37.i.not = icmp eq i32 %inc.i47.i, 5
  br i1 %exitcond.i37.i.not, label %m_vec_mul_add_x_inv.exit48.i, label %for.body.i38.i, !llvm.loop !27

m_vec_mul_add_x_inv.exit48.i:                     ; preds = %for.body.i38.i
  %add.ptr14.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 120
  %add.ptr15.i74 = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 320
  br label %for.body.i137.i

for.body.i137.i:                                  ; preds = %m_vec_mul_add_x_inv.exit48.i, %for.body.i137.i
  %i.0.i135.i366 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit48.i ], [ %inc.i147.i, %for.body.i137.i ]
  %arrayidx.i138.i = getelementptr inbounds nuw i64, ptr %add.ptr14.i, i32 %i.0.i135.i366
  %29 = load i64, ptr %arrayidx.i138.i, align 8
  %xor.i139.i = shl i64 %29, 1
  %shl.i140.i = and i64 %xor.i139.i, -1229782938247303442
  %and.i141.i = lshr i64 %29, 3
  %shr.i142.i = and i64 %and.i141.i, 1229782938247303441
  %mul.i143.i = mul nuw nsw i64 %shr.i142.i, 3
  %xor2.i144.i = xor i64 %shl.i140.i, %mul.i143.i
  %arrayidx3.i145.i = getelementptr inbounds nuw i64, ptr %add.ptr15.i74, i32 %i.0.i135.i366
  %30 = load i64, ptr %arrayidx3.i145.i, align 8
  %xor4.i146.i = xor i64 %30, %xor2.i144.i
  store i64 %xor4.i146.i, ptr %arrayidx3.i145.i, align 8
  %inc.i147.i = add nuw nsw i32 %i.0.i135.i366, 1
  %exitcond.i136.i.not = icmp eq i32 %inc.i147.i, 5
  br i1 %exitcond.i136.i.not, label %m_vec_mul_add_x.exit148.i, label %for.body.i137.i, !llvm.loop !28

m_vec_mul_add_x.exit148.i:                        ; preds = %for.body.i137.i
  %add.ptr16.i75 = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 600
  %add.ptr17.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 520
  br label %for.body.i4.i92

for.body.i4.i92:                                  ; preds = %m_vec_mul_add_x.exit148.i, %for.body.i4.i92
  %i.0.i2.i77367 = phi i32 [ 0, %m_vec_mul_add_x.exit148.i ], [ %inc.i6.i95, %for.body.i4.i92 ]
  %arrayidx.i5.i93 = getelementptr inbounds nuw i64, ptr %add.ptr16.i75, i32 %i.0.i2.i77367
  %31 = load i64, ptr %arrayidx.i5.i93, align 8
  %and.i.i = and i64 %31, 1229782938247303441
  %xor.i.i94 = lshr i64 %31, 1
  %shr.i.i = and i64 %xor.i.i94, 8608480567731124087
  %mul.i.i = mul nuw i64 %and.i.i, 9
  %xor2.i.i = xor i64 %shr.i.i, %mul.i.i
  %arrayidx3.i.i = getelementptr inbounds nuw i64, ptr %add.ptr17.i, i32 %i.0.i2.i77367
  %32 = load i64, ptr %arrayidx3.i.i, align 8
  %xor4.i.i = xor i64 %32, %xor2.i.i
  store i64 %xor4.i.i, ptr %arrayidx3.i.i, align 8
  %inc.i6.i95 = add nuw nsw i32 %i.0.i2.i77367, 1
  %exitcond.i3.i78.not = icmp eq i32 %inc.i6.i95, 5
  br i1 %exitcond.i3.i78.not, label %m_vec_mul_add_x_inv.exit.i, label %for.body.i4.i92, !llvm.loop !29

m_vec_mul_add_x_inv.exit.i:                       ; preds = %for.body.i4.i92
  %add.ptr18.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 320
  %add.ptr19.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 160
  br label %for.body.i167.i

for.body.i167.i:                                  ; preds = %m_vec_mul_add_x_inv.exit.i, %for.body.i167.i
  %i.0.i165.i368 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit.i ], [ %inc.i177.i, %for.body.i167.i ]
  %arrayidx.i168.i = getelementptr inbounds nuw i64, ptr %add.ptr18.i, i32 %i.0.i165.i368
  %33 = load i64, ptr %arrayidx.i168.i, align 8
  %xor.i169.i = shl i64 %33, 1
  %shl.i170.i = and i64 %xor.i169.i, -1229782938247303442
  %and.i171.i = lshr i64 %33, 3
  %shr.i172.i = and i64 %and.i171.i, 1229782938247303441
  %mul.i173.i = mul nuw nsw i64 %shr.i172.i, 3
  %xor2.i174.i = xor i64 %shl.i170.i, %mul.i173.i
  %arrayidx3.i175.i = getelementptr inbounds nuw i64, ptr %add.ptr19.i, i32 %i.0.i165.i368
  %34 = load i64, ptr %arrayidx3.i175.i, align 8
  %xor4.i176.i = xor i64 %34, %xor2.i174.i
  store i64 %xor4.i176.i, ptr %arrayidx3.i175.i, align 8
  %inc.i177.i = add nuw nsw i32 %i.0.i165.i368, 1
  %exitcond.i166.i.not = icmp eq i32 %inc.i177.i, 5
  br i1 %exitcond.i166.i.not, label %m_vec_mul_add_x.exit178.i, label %for.body.i167.i, !llvm.loop !30

m_vec_mul_add_x.exit178.i:                        ; preds = %for.body.i167.i
  %add.ptr20.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 520
  %add.ptr21.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 360
  br label %for.body.i10.i89

for.body.i10.i89:                                 ; preds = %m_vec_mul_add_x.exit178.i, %for.body.i10.i89
  %i.0.i8.i80369 = phi i32 [ 0, %m_vec_mul_add_x.exit178.i ], [ %inc.i19.i, %for.body.i10.i89 ]
  %arrayidx.i11.i90 = getelementptr inbounds nuw i64, ptr %add.ptr20.i, i32 %i.0.i8.i80369
  %35 = load i64, ptr %arrayidx.i11.i90, align 8
  %and.i12.i = and i64 %35, 1229782938247303441
  %xor.i13.i91 = lshr i64 %35, 1
  %shr.i14.i = and i64 %xor.i13.i91, 8608480567731124087
  %mul.i15.i = mul nuw i64 %and.i12.i, 9
  %xor2.i16.i = xor i64 %shr.i14.i, %mul.i15.i
  %arrayidx3.i17.i = getelementptr inbounds nuw i64, ptr %add.ptr21.i, i32 %i.0.i8.i80369
  %36 = load i64, ptr %arrayidx3.i17.i, align 8
  %xor4.i18.i = xor i64 %36, %xor2.i16.i
  store i64 %xor4.i18.i, ptr %arrayidx3.i17.i, align 8
  %inc.i19.i = add nuw nsw i32 %i.0.i8.i80369, 1
  %exitcond.i9.i81.not = icmp eq i32 %inc.i19.i, 5
  br i1 %exitcond.i9.i81.not, label %m_vec_mul_add_x_inv.exit20.i, label %for.body.i10.i89, !llvm.loop !31

m_vec_mul_add_x_inv.exit20.i:                     ; preds = %for.body.i10.i89
  %add.ptr22.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 160
  %add.ptr23.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 80
  br label %for.body.i107.i

for.body.i107.i:                                  ; preds = %m_vec_mul_add_x_inv.exit20.i, %for.body.i107.i
  %i.0.i105.i370 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit20.i ], [ %inc.i117.i, %for.body.i107.i ]
  %arrayidx.i108.i = getelementptr inbounds nuw i64, ptr %add.ptr22.i, i32 %i.0.i105.i370
  %37 = load i64, ptr %arrayidx.i108.i, align 8
  %xor.i109.i = shl i64 %37, 1
  %shl.i110.i = and i64 %xor.i109.i, -1229782938247303442
  %and.i111.i = lshr i64 %37, 3
  %shr.i112.i = and i64 %and.i111.i, 1229782938247303441
  %mul.i113.i = mul nuw nsw i64 %shr.i112.i, 3
  %xor2.i114.i = xor i64 %shl.i110.i, %mul.i113.i
  %arrayidx3.i115.i = getelementptr inbounds nuw i64, ptr %add.ptr23.i, i32 %i.0.i105.i370
  %38 = load i64, ptr %arrayidx3.i115.i, align 8
  %xor4.i116.i = xor i64 %38, %xor2.i114.i
  store i64 %xor4.i116.i, ptr %arrayidx3.i115.i, align 8
  %inc.i117.i = add nuw nsw i32 %i.0.i105.i370, 1
  %exitcond.i106.i.not = icmp eq i32 %inc.i117.i, 5
  br i1 %exitcond.i106.i.not, label %m_vec_mul_add_x.exit118.i, label %for.body.i107.i, !llvm.loop !32

m_vec_mul_add_x.exit118.i:                        ; preds = %for.body.i107.i
  %add.ptr24.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 360
  %add.ptr25.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 40
  br label %for.body.i24.i

for.body.i24.i:                                   ; preds = %m_vec_mul_add_x.exit118.i, %for.body.i24.i
  %i.0.i22.i371 = phi i32 [ 0, %m_vec_mul_add_x.exit118.i ], [ %inc.i33.i, %for.body.i24.i ]
  %arrayidx.i25.i = getelementptr inbounds nuw i64, ptr %add.ptr24.i, i32 %i.0.i22.i371
  %39 = load i64, ptr %arrayidx.i25.i, align 8
  %and.i26.i = and i64 %39, 1229782938247303441
  %xor.i27.i = lshr i64 %39, 1
  %shr.i28.i = and i64 %xor.i27.i, 8608480567731124087
  %mul.i29.i = mul nuw i64 %and.i26.i, 9
  %xor2.i30.i = xor i64 %shr.i28.i, %mul.i29.i
  %arrayidx3.i31.i = getelementptr inbounds nuw i64, ptr %add.ptr25.i, i32 %i.0.i22.i371
  %40 = load i64, ptr %arrayidx3.i31.i, align 8
  %xor4.i32.i = xor i64 %40, %xor2.i30.i
  store i64 %xor4.i32.i, ptr %arrayidx3.i31.i, align 8
  %inc.i33.i = add nuw nsw i32 %i.0.i22.i371, 1
  %exitcond.i23.i.not = icmp eq i32 %inc.i33.i, 5
  br i1 %exitcond.i23.i.not, label %m_vec_mul_add_x_inv.exit34.i, label %for.body.i24.i, !llvm.loop !33

m_vec_mul_add_x_inv.exit34.i:                     ; preds = %for.body.i24.i
  %add.ptr26.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 80
  %add.ptr27.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 40
  br label %for.body.i122.i

for.body.i122.i:                                  ; preds = %m_vec_mul_add_x_inv.exit34.i, %for.body.i122.i
  %i.0.i120.i372 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit34.i ], [ %inc.i132.i, %for.body.i122.i ]
  %arrayidx.i123.i = getelementptr inbounds nuw i64, ptr %add.ptr26.i, i32 %i.0.i120.i372
  %41 = load i64, ptr %arrayidx.i123.i, align 8
  %xor.i124.i = shl i64 %41, 1
  %shl.i125.i = and i64 %xor.i124.i, -1229782938247303442
  %and.i126.i = lshr i64 %41, 3
  %shr.i127.i = and i64 %and.i126.i, 1229782938247303441
  %mul.i128.i = mul nuw nsw i64 %shr.i127.i, 3
  %xor2.i129.i = xor i64 %shl.i125.i, %mul.i128.i
  %arrayidx3.i130.i = getelementptr inbounds nuw i64, ptr %add.ptr27.i, i32 %i.0.i120.i372
  %42 = load i64, ptr %arrayidx3.i130.i, align 8
  %xor4.i131.i = xor i64 %42, %xor2.i129.i
  store i64 %xor4.i131.i, ptr %arrayidx3.i130.i, align 8
  %inc.i132.i = add nuw nsw i32 %i.0.i120.i372, 1
  %exitcond.i121.i.not = icmp eq i32 %inc.i132.i, 5
  br i1 %exitcond.i121.i.not, label %m_vec_mul_add_x.exit133.i, label %for.body.i122.i, !llvm.loop !34

m_vec_mul_add_x.exit133.i:                        ; preds = %for.body.i122.i
  %add.ptr101.i = getelementptr inbounds nuw i8, ptr %PS.i, i32 %add.ptr101.idx.i
  %add.ptr28.i = getelementptr inbounds nuw i8, ptr %add.ptr99.i, i32 40
  br label %for.body.i.i85

for.body.i.i85:                                   ; preds = %m_vec_mul_add_x.exit133.i, %for.body.i.i85
  %i.0.i.i83373 = phi i32 [ 0, %m_vec_mul_add_x.exit133.i ], [ %inc.i.i88, %for.body.i.i85 ]
  %arrayidx.i.i86 = getelementptr inbounds nuw i64, ptr %add.ptr28.i, i32 %i.0.i.i83373
  %43 = load i64, ptr %arrayidx.i.i86, align 8
  %arrayidx1.i.i87 = getelementptr inbounds nuw i64, ptr %add.ptr101.i, i32 %i.0.i.i83373
  store i64 %43, ptr %arrayidx1.i.i87, align 8
  %inc.i.i88 = add nuw nsw i32 %i.0.i.i83373, 1
  %exitcond.i.i84.not = icmp eq i32 %inc.i.i88, 5
  br i1 %exitcond.i.i84.not, label %m_vec_multiply_bins.exit, label %for.body.i.i85, !llvm.loop !35

m_vec_multiply_bins.exit:                         ; preds = %for.body.i.i85
  %inc102.i = add nuw nsw i32 %i.0.i29374, 1
  %exitcond10.i.not = icmp eq i32 %inc102.i, 860
  br i1 %exitcond10.i.not, label %mayo_generic_m_calculate_PS.exit, label %while.body.i30, !llvm.loop !36

mayo_generic_m_calculate_PS.exit:                 ; preds = %m_vec_multiply_bins.exit
  call void @llvm.lifetime.end.p0(i64 550400, ptr nonnull %accumulator.i20)
  call void @llvm.lifetime.start.p0(i64 64000, ptr nonnull %accumulator.i)
  br label %for.body.i.i

for.cond.i15.preheader:                           ; preds = %for.body.i.i
  br label %for.cond1.i.preheader

for.body.i.i:                                     ; preds = %mayo_generic_m_calculate_PS.exit, %for.body.i.i
  %i.0.i.i375 = phi i32 [ 0, %mayo_generic_m_calculate_PS.exit ], [ %inc.i.i, %for.body.i.i ]
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %accumulator.i, i32 %i.0.i.i375
  store i8 0, ptr %arrayidx.i.i, align 1
  %inc.i.i = add nuw nsw i32 %i.0.i.i375, 1
  %exitcond.i.i.not = icmp eq i32 %inc.i.i, 64000
  br i1 %exitcond.i.i.not, label %for.cond.i15.preheader, label %for.body.i.i, !llvm.loop !37

for.cond1.i.preheader:                            ; preds = %for.cond.i15.preheader, %for.inc20.i
  %row.0.i379 = phi i32 [ 0, %for.cond.i15.preheader ], [ %inc21.i, %for.inc20.i ]
  br label %for.cond4.i.preheader

while.cond.i.preheader:                           ; preds = %for.inc20.i
  br label %while.body.i

for.cond4.i.preheader:                            ; preds = %for.cond1.i.preheader, %for.inc18.i
  %j.0.i378 = phi i32 [ 0, %for.cond1.i.preheader ], [ %inc.i18, %for.inc18.i ]
  br label %for.body6.i

for.body6.i:                                      ; preds = %for.cond4.i.preheader, %m_vec_add.exit.i
  %col.0.i377 = phi i32 [ 0, %for.cond4.i.preheader ], [ %add17.i, %m_vec_add.exit.i ]
  %mul.i = mul nuw nsw i32 %j.0.i378, 10
  %add7.i = add nuw nsw i32 %mul.i, %col.0.i377
  %add.ptr.idx.i = mul nuw nsw i32 %add7.i, 40
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %PS.i, i32 %add.ptr.idx.i
  %mul9.i = mul nuw nsw i32 %row.0.i379, 10
  %add10.i = add nuw nsw i32 %mul9.i, %col.0.i377
  %mul11.i = shl nuw nsw i32 %add10.i, 4
  %mul12.i = mul nuw nsw i32 %row.0.i379, 86
  %44 = getelementptr i8, ptr %s, i32 %mul12.i
  %arrayidx.i19 = getelementptr i8, ptr %44, i32 %j.0.i378
  %45 = load i8, ptr %arrayidx.i19, align 1
  %conv.i = zext i8 %45 to i32
  %add14.i = add nuw nsw i32 %mul11.i, %conv.i
  %add.ptr16.idx.i = mul nuw nsw i32 %add14.i, 40
  %add.ptr16.i = getelementptr inbounds nuw i8, ptr %accumulator.i, i32 %add.ptr16.idx.i
  br label %for.body.i4.i

for.body.i4.i:                                    ; preds = %for.body6.i, %for.body.i4.i
  %i.0.i2.i376 = phi i32 [ 0, %for.body6.i ], [ %inc.i6.i, %for.body.i4.i ]
  %arrayidx.i5.i = getelementptr inbounds nuw i64, ptr %add.ptr.i, i32 %i.0.i2.i376
  %46 = load i64, ptr %arrayidx.i5.i, align 8
  %arrayidx1.i.i = getelementptr inbounds nuw i64, ptr %add.ptr16.i, i32 %i.0.i2.i376
  %47 = load i64, ptr %arrayidx1.i.i, align 8
  %xor.i.i = xor i64 %47, %46
  store i64 %xor.i.i, ptr %arrayidx1.i.i, align 8
  %inc.i6.i = add nuw nsw i32 %i.0.i2.i376, 1
  %exitcond.i3.i.not = icmp eq i32 %inc.i6.i, 5
  br i1 %exitcond.i3.i.not, label %m_vec_add.exit.i, label %for.body.i4.i, !llvm.loop !38

m_vec_add.exit.i:                                 ; preds = %for.body.i4.i
  %add17.i = add nuw nsw i32 %col.0.i377, 1
  %exitcond.i17.not = icmp eq i32 %add17.i, 10
  br i1 %exitcond.i17.not, label %for.inc18.i, label %for.body6.i, !llvm.loop !39

for.inc18.i:                                      ; preds = %m_vec_add.exit.i
  %inc.i18 = add nuw nsw i32 %j.0.i378, 1
  %exitcond1.i.not = icmp eq i32 %inc.i18, 86
  br i1 %exitcond1.i.not, label %for.inc20.i, label %for.cond4.i.preheader, !llvm.loop !40

for.inc20.i:                                      ; preds = %for.inc18.i
  %inc21.i = add nuw nsw i32 %row.0.i379, 1
  %exitcond2.i.not = icmp eq i32 %inc21.i, 10
  br i1 %exitcond2.i.not, label %while.cond.i.preheader, label %for.cond1.i.preheader, !llvm.loop !41

while.body.i:                                     ; preds = %while.cond.i.preheader, %m_vec_multiply_bins.exit335
  %i.0.i16395 = phi i32 [ 0, %while.cond.i.preheader ], [ %inc32.i, %m_vec_multiply_bins.exit335 ]
  %add.ptr29.idx.i = mul nuw nsw i32 %i.0.i16395, 640
  %add.ptr29.i = getelementptr inbounds nuw i8, ptr %accumulator.i, i32 %add.ptr29.idx.i
  %add.ptr31.idx.i = mul nuw nsw i32 %i.0.i16395, 40
  %add.ptr.i96 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 200
  %add.ptr1.i97 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 400
  br label %for.body.i80.i325

for.body.i80.i325:                                ; preds = %while.body.i, %for.body.i80.i325
  %i.0.i78.i99380 = phi i32 [ 0, %while.body.i ], [ %inc.i89.i334, %for.body.i80.i325 ]
  %arrayidx.i81.i326 = getelementptr inbounds nuw i64, ptr %add.ptr.i96, i32 %i.0.i78.i99380
  %48 = load i64, ptr %arrayidx.i81.i326, align 8
  %and.i82.i327 = and i64 %48, 1229782938247303441
  %xor.i83.i328 = lshr i64 %48, 1
  %shr.i84.i329 = and i64 %xor.i83.i328, 8608480567731124087
  %mul.i85.i330 = mul nuw i64 %and.i82.i327, 9
  %xor2.i86.i331 = xor i64 %shr.i84.i329, %mul.i85.i330
  %arrayidx3.i87.i332 = getelementptr inbounds nuw i64, ptr %add.ptr1.i97, i32 %i.0.i78.i99380
  %49 = load i64, ptr %arrayidx3.i87.i332, align 8
  %xor4.i88.i333 = xor i64 %49, %xor2.i86.i331
  store i64 %xor4.i88.i333, ptr %arrayidx3.i87.i332, align 8
  %inc.i89.i334 = add nuw nsw i32 %i.0.i78.i99380, 1
  %exitcond.i79.i100.not = icmp eq i32 %inc.i89.i334, 5
  br i1 %exitcond.i79.i100.not, label %m_vec_mul_add_x_inv.exit90.i101, label %for.body.i80.i325, !llvm.loop !42

m_vec_mul_add_x_inv.exit90.i101:                  ; preds = %for.body.i80.i325
  %add.ptr2.i102 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 440
  %add.ptr3.i103 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 480
  br label %for.body.i182.i314

for.body.i182.i314:                               ; preds = %m_vec_mul_add_x_inv.exit90.i101, %for.body.i182.i314
  %i.0.i180.i105381 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit90.i101 ], [ %inc.i192.i324, %for.body.i182.i314 ]
  %arrayidx.i183.i315 = getelementptr inbounds nuw i64, ptr %add.ptr2.i102, i32 %i.0.i180.i105381
  %50 = load i64, ptr %arrayidx.i183.i315, align 8
  %xor.i184.i316 = shl i64 %50, 1
  %shl.i185.i317 = and i64 %xor.i184.i316, -1229782938247303442
  %and.i186.i318 = lshr i64 %50, 3
  %shr.i187.i319 = and i64 %and.i186.i318, 1229782938247303441
  %mul.i188.i320 = mul nuw nsw i64 %shr.i187.i319, 3
  %xor2.i189.i321 = xor i64 %shl.i185.i317, %mul.i188.i320
  %arrayidx3.i190.i322 = getelementptr inbounds nuw i64, ptr %add.ptr3.i103, i32 %i.0.i180.i105381
  %51 = load i64, ptr %arrayidx3.i190.i322, align 8
  %xor4.i191.i323 = xor i64 %51, %xor2.i189.i321
  store i64 %xor4.i191.i323, ptr %arrayidx3.i190.i322, align 8
  %inc.i192.i324 = add nuw nsw i32 %i.0.i180.i105381, 1
  %exitcond.i181.i106.not = icmp eq i32 %inc.i192.i324, 5
  br i1 %exitcond.i181.i106.not, label %m_vec_mul_add_x.exit193.i107, label %for.body.i182.i314, !llvm.loop !43

m_vec_mul_add_x.exit193.i107:                     ; preds = %for.body.i182.i314
  %add.ptr4.i108 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 400
  %add.ptr5.i109 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 280
  br label %for.body.i66.i304

for.body.i66.i304:                                ; preds = %m_vec_mul_add_x.exit193.i107, %for.body.i66.i304
  %i.0.i64.i111382 = phi i32 [ 0, %m_vec_mul_add_x.exit193.i107 ], [ %inc.i75.i313, %for.body.i66.i304 ]
  %arrayidx.i67.i305 = getelementptr inbounds nuw i64, ptr %add.ptr4.i108, i32 %i.0.i64.i111382
  %52 = load i64, ptr %arrayidx.i67.i305, align 8
  %and.i68.i306 = and i64 %52, 1229782938247303441
  %xor.i69.i307 = lshr i64 %52, 1
  %shr.i70.i308 = and i64 %xor.i69.i307, 8608480567731124087
  %mul.i71.i309 = mul nuw i64 %and.i68.i306, 9
  %xor2.i72.i310 = xor i64 %shr.i70.i308, %mul.i71.i309
  %arrayidx3.i73.i311 = getelementptr inbounds nuw i64, ptr %add.ptr5.i109, i32 %i.0.i64.i111382
  %53 = load i64, ptr %arrayidx3.i73.i311, align 8
  %xor4.i74.i312 = xor i64 %53, %xor2.i72.i310
  store i64 %xor4.i74.i312, ptr %arrayidx3.i73.i311, align 8
  %inc.i75.i313 = add nuw nsw i32 %i.0.i64.i111382, 1
  %exitcond.i65.i112.not = icmp eq i32 %inc.i75.i313, 5
  br i1 %exitcond.i65.i112.not, label %m_vec_mul_add_x_inv.exit76.i113, label %for.body.i66.i304, !llvm.loop !44

m_vec_mul_add_x_inv.exit76.i113:                  ; preds = %for.body.i66.i304
  %add.ptr6.i114 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 480
  %add.ptr7.i115 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 240
  br label %for.body.i152.i293

for.body.i152.i293:                               ; preds = %m_vec_mul_add_x_inv.exit76.i113, %for.body.i152.i293
  %i.0.i150.i117383 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit76.i113 ], [ %inc.i162.i303, %for.body.i152.i293 ]
  %arrayidx.i153.i294 = getelementptr inbounds nuw i64, ptr %add.ptr6.i114, i32 %i.0.i150.i117383
  %54 = load i64, ptr %arrayidx.i153.i294, align 8
  %xor.i154.i295 = shl i64 %54, 1
  %shl.i155.i296 = and i64 %xor.i154.i295, -1229782938247303442
  %and.i156.i297 = lshr i64 %54, 3
  %shr.i157.i298 = and i64 %and.i156.i297, 1229782938247303441
  %mul.i158.i299 = mul nuw nsw i64 %shr.i157.i298, 3
  %xor2.i159.i300 = xor i64 %shl.i155.i296, %mul.i158.i299
  %arrayidx3.i160.i301 = getelementptr inbounds nuw i64, ptr %add.ptr7.i115, i32 %i.0.i150.i117383
  %55 = load i64, ptr %arrayidx3.i160.i301, align 8
  %xor4.i161.i302 = xor i64 %55, %xor2.i159.i300
  store i64 %xor4.i161.i302, ptr %arrayidx3.i160.i301, align 8
  %inc.i162.i303 = add nuw nsw i32 %i.0.i150.i117383, 1
  %exitcond.i151.i118.not = icmp eq i32 %inc.i162.i303, 5
  br i1 %exitcond.i151.i118.not, label %m_vec_mul_add_x.exit163.i119, label %for.body.i152.i293, !llvm.loop !45

m_vec_mul_add_x.exit163.i119:                     ; preds = %for.body.i152.i293
  %add.ptr8.i120 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 280
  %add.ptr9.i121 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 560
  br label %for.body.i52.i283

for.body.i52.i283:                                ; preds = %m_vec_mul_add_x.exit163.i119, %for.body.i52.i283
  %i.0.i50.i123384 = phi i32 [ 0, %m_vec_mul_add_x.exit163.i119 ], [ %inc.i61.i292, %for.body.i52.i283 ]
  %arrayidx.i53.i284 = getelementptr inbounds nuw i64, ptr %add.ptr8.i120, i32 %i.0.i50.i123384
  %56 = load i64, ptr %arrayidx.i53.i284, align 8
  %and.i54.i285 = and i64 %56, 1229782938247303441
  %xor.i55.i286 = lshr i64 %56, 1
  %shr.i56.i287 = and i64 %xor.i55.i286, 8608480567731124087
  %mul.i57.i288 = mul nuw i64 %and.i54.i285, 9
  %xor2.i58.i289 = xor i64 %shr.i56.i287, %mul.i57.i288
  %arrayidx3.i59.i290 = getelementptr inbounds nuw i64, ptr %add.ptr9.i121, i32 %i.0.i50.i123384
  %57 = load i64, ptr %arrayidx3.i59.i290, align 8
  %xor4.i60.i291 = xor i64 %57, %xor2.i58.i289
  store i64 %xor4.i60.i291, ptr %arrayidx3.i59.i290, align 8
  %inc.i61.i292 = add nuw nsw i32 %i.0.i50.i123384, 1
  %exitcond.i51.i124.not = icmp eq i32 %inc.i61.i292, 5
  br i1 %exitcond.i51.i124.not, label %m_vec_mul_add_x_inv.exit62.i125, label %for.body.i52.i283, !llvm.loop !46

m_vec_mul_add_x_inv.exit62.i125:                  ; preds = %for.body.i52.i283
  %add.ptr10.i126 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 240
  %add.ptr11.i127 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 120
  br label %for.body.i94.i272

for.body.i94.i272:                                ; preds = %m_vec_mul_add_x_inv.exit62.i125, %for.body.i94.i272
  %i.0.i92.i129385 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit62.i125 ], [ %inc.i103.i282, %for.body.i94.i272 ]
  %arrayidx.i95.i273 = getelementptr inbounds nuw i64, ptr %add.ptr10.i126, i32 %i.0.i92.i129385
  %58 = load i64, ptr %arrayidx.i95.i273, align 8
  %xor.i96.i274 = shl i64 %58, 1
  %shl.i.i275 = and i64 %xor.i96.i274, -1229782938247303442
  %and.i97.i276 = lshr i64 %58, 3
  %shr.i98.i277 = and i64 %and.i97.i276, 1229782938247303441
  %mul.i99.i278 = mul nuw nsw i64 %shr.i98.i277, 3
  %xor2.i100.i279 = xor i64 %shl.i.i275, %mul.i99.i278
  %arrayidx3.i101.i280 = getelementptr inbounds nuw i64, ptr %add.ptr11.i127, i32 %i.0.i92.i129385
  %59 = load i64, ptr %arrayidx3.i101.i280, align 8
  %xor4.i102.i281 = xor i64 %59, %xor2.i100.i279
  store i64 %xor4.i102.i281, ptr %arrayidx3.i101.i280, align 8
  %inc.i103.i282 = add nuw nsw i32 %i.0.i92.i129385, 1
  %exitcond.i93.i130.not = icmp eq i32 %inc.i103.i282, 5
  br i1 %exitcond.i93.i130.not, label %m_vec_mul_add_x.exit.i131, label %for.body.i94.i272, !llvm.loop !47

m_vec_mul_add_x.exit.i131:                        ; preds = %for.body.i94.i272
  %add.ptr12.i132 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 560
  %add.ptr13.i133 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 600
  br label %for.body.i38.i262

for.body.i38.i262:                                ; preds = %m_vec_mul_add_x.exit.i131, %for.body.i38.i262
  %i.0.i36.i135386 = phi i32 [ 0, %m_vec_mul_add_x.exit.i131 ], [ %inc.i47.i271, %for.body.i38.i262 ]
  %arrayidx.i39.i263 = getelementptr inbounds nuw i64, ptr %add.ptr12.i132, i32 %i.0.i36.i135386
  %60 = load i64, ptr %arrayidx.i39.i263, align 8
  %and.i40.i264 = and i64 %60, 1229782938247303441
  %xor.i41.i265 = lshr i64 %60, 1
  %shr.i42.i266 = and i64 %xor.i41.i265, 8608480567731124087
  %mul.i43.i267 = mul nuw i64 %and.i40.i264, 9
  %xor2.i44.i268 = xor i64 %shr.i42.i266, %mul.i43.i267
  %arrayidx3.i45.i269 = getelementptr inbounds nuw i64, ptr %add.ptr13.i133, i32 %i.0.i36.i135386
  %61 = load i64, ptr %arrayidx3.i45.i269, align 8
  %xor4.i46.i270 = xor i64 %61, %xor2.i44.i268
  store i64 %xor4.i46.i270, ptr %arrayidx3.i45.i269, align 8
  %inc.i47.i271 = add nuw nsw i32 %i.0.i36.i135386, 1
  %exitcond.i37.i136.not = icmp eq i32 %inc.i47.i271, 5
  br i1 %exitcond.i37.i136.not, label %m_vec_mul_add_x_inv.exit48.i137, label %for.body.i38.i262, !llvm.loop !48

m_vec_mul_add_x_inv.exit48.i137:                  ; preds = %for.body.i38.i262
  %add.ptr14.i138 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 120
  %add.ptr15.i139 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 320
  br label %for.body.i137.i251

for.body.i137.i251:                               ; preds = %m_vec_mul_add_x_inv.exit48.i137, %for.body.i137.i251
  %i.0.i135.i141387 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit48.i137 ], [ %inc.i147.i261, %for.body.i137.i251 ]
  %arrayidx.i138.i252 = getelementptr inbounds nuw i64, ptr %add.ptr14.i138, i32 %i.0.i135.i141387
  %62 = load i64, ptr %arrayidx.i138.i252, align 8
  %xor.i139.i253 = shl i64 %62, 1
  %shl.i140.i254 = and i64 %xor.i139.i253, -1229782938247303442
  %and.i141.i255 = lshr i64 %62, 3
  %shr.i142.i256 = and i64 %and.i141.i255, 1229782938247303441
  %mul.i143.i257 = mul nuw nsw i64 %shr.i142.i256, 3
  %xor2.i144.i258 = xor i64 %shl.i140.i254, %mul.i143.i257
  %arrayidx3.i145.i259 = getelementptr inbounds nuw i64, ptr %add.ptr15.i139, i32 %i.0.i135.i141387
  %63 = load i64, ptr %arrayidx3.i145.i259, align 8
  %xor4.i146.i260 = xor i64 %63, %xor2.i144.i258
  store i64 %xor4.i146.i260, ptr %arrayidx3.i145.i259, align 8
  %inc.i147.i261 = add nuw nsw i32 %i.0.i135.i141387, 1
  %exitcond.i136.i142.not = icmp eq i32 %inc.i147.i261, 5
  br i1 %exitcond.i136.i142.not, label %m_vec_mul_add_x.exit148.i143, label %for.body.i137.i251, !llvm.loop !49

m_vec_mul_add_x.exit148.i143:                     ; preds = %for.body.i137.i251
  %add.ptr16.i144 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 600
  %add.ptr17.i145 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 520
  br label %for.body.i4.i241

for.body.i4.i241:                                 ; preds = %m_vec_mul_add_x.exit148.i143, %for.body.i4.i241
  %i.0.i2.i147388 = phi i32 [ 0, %m_vec_mul_add_x.exit148.i143 ], [ %inc.i6.i250, %for.body.i4.i241 ]
  %arrayidx.i5.i242 = getelementptr inbounds nuw i64, ptr %add.ptr16.i144, i32 %i.0.i2.i147388
  %64 = load i64, ptr %arrayidx.i5.i242, align 8
  %and.i.i243 = and i64 %64, 1229782938247303441
  %xor.i.i244 = lshr i64 %64, 1
  %shr.i.i245 = and i64 %xor.i.i244, 8608480567731124087
  %mul.i.i246 = mul nuw i64 %and.i.i243, 9
  %xor2.i.i247 = xor i64 %shr.i.i245, %mul.i.i246
  %arrayidx3.i.i248 = getelementptr inbounds nuw i64, ptr %add.ptr17.i145, i32 %i.0.i2.i147388
  %65 = load i64, ptr %arrayidx3.i.i248, align 8
  %xor4.i.i249 = xor i64 %65, %xor2.i.i247
  store i64 %xor4.i.i249, ptr %arrayidx3.i.i248, align 8
  %inc.i6.i250 = add nuw nsw i32 %i.0.i2.i147388, 1
  %exitcond.i3.i148.not = icmp eq i32 %inc.i6.i250, 5
  br i1 %exitcond.i3.i148.not, label %m_vec_mul_add_x_inv.exit.i149, label %for.body.i4.i241, !llvm.loop !50

m_vec_mul_add_x_inv.exit.i149:                    ; preds = %for.body.i4.i241
  %add.ptr18.i150 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 320
  %add.ptr19.i151 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 160
  br label %for.body.i167.i230

for.body.i167.i230:                               ; preds = %m_vec_mul_add_x_inv.exit.i149, %for.body.i167.i230
  %i.0.i165.i153389 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit.i149 ], [ %inc.i177.i240, %for.body.i167.i230 ]
  %arrayidx.i168.i231 = getelementptr inbounds nuw i64, ptr %add.ptr18.i150, i32 %i.0.i165.i153389
  %66 = load i64, ptr %arrayidx.i168.i231, align 8
  %xor.i169.i232 = shl i64 %66, 1
  %shl.i170.i233 = and i64 %xor.i169.i232, -1229782938247303442
  %and.i171.i234 = lshr i64 %66, 3
  %shr.i172.i235 = and i64 %and.i171.i234, 1229782938247303441
  %mul.i173.i236 = mul nuw nsw i64 %shr.i172.i235, 3
  %xor2.i174.i237 = xor i64 %shl.i170.i233, %mul.i173.i236
  %arrayidx3.i175.i238 = getelementptr inbounds nuw i64, ptr %add.ptr19.i151, i32 %i.0.i165.i153389
  %67 = load i64, ptr %arrayidx3.i175.i238, align 8
  %xor4.i176.i239 = xor i64 %67, %xor2.i174.i237
  store i64 %xor4.i176.i239, ptr %arrayidx3.i175.i238, align 8
  %inc.i177.i240 = add nuw nsw i32 %i.0.i165.i153389, 1
  %exitcond.i166.i154.not = icmp eq i32 %inc.i177.i240, 5
  br i1 %exitcond.i166.i154.not, label %m_vec_mul_add_x.exit178.i155, label %for.body.i167.i230, !llvm.loop !51

m_vec_mul_add_x.exit178.i155:                     ; preds = %for.body.i167.i230
  %add.ptr20.i156 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 520
  %add.ptr21.i157 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 360
  br label %for.body.i10.i220

for.body.i10.i220:                                ; preds = %m_vec_mul_add_x.exit178.i155, %for.body.i10.i220
  %i.0.i8.i159390 = phi i32 [ 0, %m_vec_mul_add_x.exit178.i155 ], [ %inc.i19.i229, %for.body.i10.i220 ]
  %arrayidx.i11.i221 = getelementptr inbounds nuw i64, ptr %add.ptr20.i156, i32 %i.0.i8.i159390
  %68 = load i64, ptr %arrayidx.i11.i221, align 8
  %and.i12.i222 = and i64 %68, 1229782938247303441
  %xor.i13.i223 = lshr i64 %68, 1
  %shr.i14.i224 = and i64 %xor.i13.i223, 8608480567731124087
  %mul.i15.i225 = mul nuw i64 %and.i12.i222, 9
  %xor2.i16.i226 = xor i64 %shr.i14.i224, %mul.i15.i225
  %arrayidx3.i17.i227 = getelementptr inbounds nuw i64, ptr %add.ptr21.i157, i32 %i.0.i8.i159390
  %69 = load i64, ptr %arrayidx3.i17.i227, align 8
  %xor4.i18.i228 = xor i64 %69, %xor2.i16.i226
  store i64 %xor4.i18.i228, ptr %arrayidx3.i17.i227, align 8
  %inc.i19.i229 = add nuw nsw i32 %i.0.i8.i159390, 1
  %exitcond.i9.i160.not = icmp eq i32 %inc.i19.i229, 5
  br i1 %exitcond.i9.i160.not, label %m_vec_mul_add_x_inv.exit20.i161, label %for.body.i10.i220, !llvm.loop !52

m_vec_mul_add_x_inv.exit20.i161:                  ; preds = %for.body.i10.i220
  %add.ptr22.i162 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 160
  %add.ptr23.i163 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 80
  br label %for.body.i107.i209

for.body.i107.i209:                               ; preds = %m_vec_mul_add_x_inv.exit20.i161, %for.body.i107.i209
  %i.0.i105.i165391 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit20.i161 ], [ %inc.i117.i219, %for.body.i107.i209 ]
  %arrayidx.i108.i210 = getelementptr inbounds nuw i64, ptr %add.ptr22.i162, i32 %i.0.i105.i165391
  %70 = load i64, ptr %arrayidx.i108.i210, align 8
  %xor.i109.i211 = shl i64 %70, 1
  %shl.i110.i212 = and i64 %xor.i109.i211, -1229782938247303442
  %and.i111.i213 = lshr i64 %70, 3
  %shr.i112.i214 = and i64 %and.i111.i213, 1229782938247303441
  %mul.i113.i215 = mul nuw nsw i64 %shr.i112.i214, 3
  %xor2.i114.i216 = xor i64 %shl.i110.i212, %mul.i113.i215
  %arrayidx3.i115.i217 = getelementptr inbounds nuw i64, ptr %add.ptr23.i163, i32 %i.0.i105.i165391
  %71 = load i64, ptr %arrayidx3.i115.i217, align 8
  %xor4.i116.i218 = xor i64 %71, %xor2.i114.i216
  store i64 %xor4.i116.i218, ptr %arrayidx3.i115.i217, align 8
  %inc.i117.i219 = add nuw nsw i32 %i.0.i105.i165391, 1
  %exitcond.i106.i166.not = icmp eq i32 %inc.i117.i219, 5
  br i1 %exitcond.i106.i166.not, label %m_vec_mul_add_x.exit118.i167, label %for.body.i107.i209, !llvm.loop !53

m_vec_mul_add_x.exit118.i167:                     ; preds = %for.body.i107.i209
  %add.ptr24.i168 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 360
  %add.ptr25.i169 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 40
  br label %for.body.i24.i199

for.body.i24.i199:                                ; preds = %m_vec_mul_add_x.exit118.i167, %for.body.i24.i199
  %i.0.i22.i171392 = phi i32 [ 0, %m_vec_mul_add_x.exit118.i167 ], [ %inc.i33.i208, %for.body.i24.i199 ]
  %arrayidx.i25.i200 = getelementptr inbounds nuw i64, ptr %add.ptr24.i168, i32 %i.0.i22.i171392
  %72 = load i64, ptr %arrayidx.i25.i200, align 8
  %and.i26.i201 = and i64 %72, 1229782938247303441
  %xor.i27.i202 = lshr i64 %72, 1
  %shr.i28.i203 = and i64 %xor.i27.i202, 8608480567731124087
  %mul.i29.i204 = mul nuw i64 %and.i26.i201, 9
  %xor2.i30.i205 = xor i64 %shr.i28.i203, %mul.i29.i204
  %arrayidx3.i31.i206 = getelementptr inbounds nuw i64, ptr %add.ptr25.i169, i32 %i.0.i22.i171392
  %73 = load i64, ptr %arrayidx3.i31.i206, align 8
  %xor4.i32.i207 = xor i64 %73, %xor2.i30.i205
  store i64 %xor4.i32.i207, ptr %arrayidx3.i31.i206, align 8
  %inc.i33.i208 = add nuw nsw i32 %i.0.i22.i171392, 1
  %exitcond.i23.i172.not = icmp eq i32 %inc.i33.i208, 5
  br i1 %exitcond.i23.i172.not, label %m_vec_mul_add_x_inv.exit34.i173, label %for.body.i24.i199, !llvm.loop !54

m_vec_mul_add_x_inv.exit34.i173:                  ; preds = %for.body.i24.i199
  %add.ptr26.i174 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 80
  %add.ptr27.i175 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 40
  br label %for.body.i122.i188

for.body.i122.i188:                               ; preds = %m_vec_mul_add_x_inv.exit34.i173, %for.body.i122.i188
  %i.0.i120.i177393 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit34.i173 ], [ %inc.i132.i198, %for.body.i122.i188 ]
  %arrayidx.i123.i189 = getelementptr inbounds nuw i64, ptr %add.ptr26.i174, i32 %i.0.i120.i177393
  %74 = load i64, ptr %arrayidx.i123.i189, align 8
  %xor.i124.i190 = shl i64 %74, 1
  %shl.i125.i191 = and i64 %xor.i124.i190, -1229782938247303442
  %and.i126.i192 = lshr i64 %74, 3
  %shr.i127.i193 = and i64 %and.i126.i192, 1229782938247303441
  %mul.i128.i194 = mul nuw nsw i64 %shr.i127.i193, 3
  %xor2.i129.i195 = xor i64 %shl.i125.i191, %mul.i128.i194
  %arrayidx3.i130.i196 = getelementptr inbounds nuw i64, ptr %add.ptr27.i175, i32 %i.0.i120.i177393
  %75 = load i64, ptr %arrayidx3.i130.i196, align 8
  %xor4.i131.i197 = xor i64 %75, %xor2.i129.i195
  store i64 %xor4.i131.i197, ptr %arrayidx3.i130.i196, align 8
  %inc.i132.i198 = add nuw nsw i32 %i.0.i120.i177393, 1
  %exitcond.i121.i178.not = icmp eq i32 %inc.i132.i198, 5
  br i1 %exitcond.i121.i178.not, label %m_vec_mul_add_x.exit133.i179, label %for.body.i122.i188, !llvm.loop !55

m_vec_mul_add_x.exit133.i179:                     ; preds = %for.body.i122.i188
  %add.ptr31.i = getelementptr inbounds nuw i8, ptr %SPS, i32 %add.ptr31.idx.i
  %add.ptr28.i180 = getelementptr inbounds nuw i8, ptr %add.ptr29.i, i32 40
  br label %for.body.i.i184

for.body.i.i184:                                  ; preds = %m_vec_mul_add_x.exit133.i179, %for.body.i.i184
  %i.0.i.i182394 = phi i32 [ 0, %m_vec_mul_add_x.exit133.i179 ], [ %inc.i.i187, %for.body.i.i184 ]
  %arrayidx.i.i185 = getelementptr inbounds nuw i64, ptr %add.ptr28.i180, i32 %i.0.i.i182394
  %76 = load i64, ptr %arrayidx.i.i185, align 8
  %arrayidx1.i.i186 = getelementptr inbounds nuw i64, ptr %add.ptr31.i, i32 %i.0.i.i182394
  store i64 %76, ptr %arrayidx1.i.i186, align 8
  %inc.i.i187 = add nuw nsw i32 %i.0.i.i182394, 1
  %exitcond.i.i183.not = icmp eq i32 %inc.i.i187, 5
  br i1 %exitcond.i.i183.not, label %m_vec_multiply_bins.exit335, label %for.body.i.i184, !llvm.loop !56

m_vec_multiply_bins.exit335:                      ; preds = %for.body.i.i184
  %inc32.i = add nuw nsw i32 %i.0.i16395, 1
  %exitcond3.i.not = icmp eq i32 %inc32.i, 100
  br i1 %exitcond3.i.not, label %mayo_generic_m_calculate_SPS.exit, label %while.body.i, !llvm.loop !57

mayo_generic_m_calculate_SPS.exit:                ; preds = %m_vec_multiply_bins.exit335
  call void @llvm.lifetime.end.p0(i64 64000, ptr nonnull %accumulator.i)
  call void @llvm.lifetime.end.p0(i64 34400, ptr nonnull %PS.i)
  br label %for.body.i

for.body.i:                                       ; preds = %mayo_generic_m_calculate_SPS.exit, %for.body.i
  %i.0.i396 = phi i32 [ 0, %mayo_generic_m_calculate_SPS.exit ], [ %inc.i, %for.body.i ]
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %zero, i32 %i.0.i396
  store i8 0, ptr %arrayidx.i, align 1
  %inc.i = add nuw nsw i32 %i.0.i396, 1
  %exitcond.i.not = icmp eq i32 %inc.i, 78
  br i1 %exitcond.i.not, label %mayo_memset.exit, label %for.body.i, !llvm.loop !58

mayo_memset.exit:                                 ; preds = %for.body.i
  call void @llvm.lifetime.start.p0(i64 40, ptr nonnull %temp.i)
  br label %for.body.i70

for.cond.i.i58.preheader:                         ; preds = %for.body.i70
  br label %for.body.i.i67

for.body.i70:                                     ; preds = %mayo_memset.exit, %for.body.i70
  %i.0.i56397 = phi i32 [ 0, %mayo_memset.exit ], [ %inc.i72, %for.body.i70 ]
  %.idx7.i = mul nuw nsw i32 %i.0.i56397, 40
  %77 = getelementptr inbounds nuw i8, ptr %SPS, i32 %.idx7.i
  %arrayidx.i71 = getelementptr inbounds nuw i8, ptr %77, i32 32
  %78 = load i64, ptr %arrayidx.i71, align 8
  %and.i = and i64 %78, 72057594037927935
  store i64 %and.i, ptr %arrayidx.i71, align 8
  %inc.i72 = add nuw nsw i32 %i.0.i56397, 1
  %exitcond.i57.not = icmp eq i32 %inc.i72, 100
  br i1 %exitcond.i57.not, label %for.cond.i.i58.preheader, label %for.body.i70, !llvm.loop !59

for.cond3.i.preheader:                            ; preds = %for.body.i.i67
  br label %for.cond6.i.preheader

for.body.i.i67:                                   ; preds = %for.cond.i.i58.preheader, %for.body.i.i67
  %i.0.i.i59398 = phi i32 [ 0, %for.cond.i.i58.preheader ], [ %inc.i.i69, %for.body.i.i67 ]
  %arrayidx.i.i68 = getelementptr inbounds nuw i8, ptr %temp.i, i32 %i.0.i.i59398
  store i8 0, ptr %arrayidx.i.i68, align 1
  %inc.i.i69 = add nuw nsw i32 %i.0.i.i59398, 1
  %exitcond.i.i60.not = icmp eq i32 %inc.i.i69, 40
  br i1 %exitcond.i.i60.not, label %for.cond3.i.preheader, label %for.body.i.i67, !llvm.loop !60

for.cond6.i.preheader:                            ; preds = %for.cond3.i.preheader, %for.inc77.i
  %i2.0.i404 = phi i32 [ 9, %for.cond3.i.preheader ], [ %dec78.i, %for.inc77.i ]
  br label %for.body8.i.lr.ph

for.body8.i.lr.ph:                                ; preds = %for.cond6.i.preheader
  br label %for.body8.i

for.cond81.i.preheader:                           ; preds = %for.inc77.i
  br label %for.body84.i

for.body8.i:                                      ; preds = %for.body8.i.lr.ph, %for.inc74.i
  %j.0.i62403 = phi i32 [ %i2.0.i404, %for.body8.i.lr.ph ], [ %inc75.i, %for.inc74.i ]
  %arrayidx9.i = getelementptr inbounds nuw i8, ptr %temp.i, i32 32
  %79 = load i64, ptr %arrayidx9.i, align 8
  %shr.i = lshr i64 %79, 52
  %arrayidx10.i = getelementptr inbounds nuw i8, ptr %temp.i, i32 32
  %shl11.i = shl i64 %79, 4
  store i64 %shl11.i, ptr %arrayidx10.i, align 8
  br label %for.body15.i

for.cond24.preheader.i:                           ; preds = %for.body15.i
  %rem.lhs.trunc.i = trunc i64 %shr.i to i8
  %rem1.i = and i8 %rem.lhs.trunc.i, 15
  br label %for.body27.i

for.body15.i:                                     ; preds = %for.body8.i, %for.body15.i
  %k.0.i399 = phi i32 [ 3, %for.body8.i ], [ %dec.i, %for.body15.i ]
  %arrayidx16.i = getelementptr inbounds nuw [5 x i64], ptr %temp.i, i32 0, i32 %k.0.i399
  %80 = load i64, ptr %arrayidx16.i, align 8
  %shr17.i = lshr i64 %80, 60
  %add18.i = add nuw nsw i32 %k.0.i399, 1
  %arrayidx19.i = getelementptr inbounds nuw [5 x i64], ptr %temp.i, i32 0, i32 %add18.i
  %81 = load i64, ptr %arrayidx19.i, align 8
  %xor.i = xor i64 %81, %shr17.i
  store i64 %xor.i, ptr %arrayidx19.i, align 8
  %arrayidx20.i = getelementptr inbounds nuw [5 x i64], ptr %temp.i, i32 0, i32 %k.0.i399
  %82 = load i64, ptr %arrayidx20.i, align 8
  %shl21.i = shl i64 %82, 4
  store i64 %shl21.i, ptr %arrayidx20.i, align 8
  %dec.i = add nsw i32 %k.0.i399, -1
  %cmp13.i = icmp sgt i32 %dec.i, -1
  br i1 %cmp13.i, label %for.body15.i, label %for.cond24.preheader.i, !llvm.loop !61

for.cond50.i.preheader:                           ; preds = %for.inc46.i
  br label %for.body53.i

for.body27.i:                                     ; preds = %for.cond24.preheader.i, %for.inc46.i
  %jj.0.i400 = phi i32 [ 0, %for.cond24.preheader.i ], [ %inc47.i66, %for.inc46.i ]
  %rem28.i = and i32 %jj.0.i400, 1
  %cmp29.i = icmp eq i32 %rem28.i, 0
  br i1 %cmp29.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %for.body27.i
  %arrayidx31.i = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %jj.0.i400
  %83 = load i8, ptr %arrayidx31.i, align 1
  %84 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1
  %xor1.i.i = xor i8 %rem1.i, %84
  %85 = trunc i8 %xor1.i.i to i1
  %86 = and i8 %xor1.i.i, 2
  %mul9.i.i = mul i8 %86, %83
  %conv10.i.i = select i1 %85, i8 %83, i8 0
  %xor11.i.i = xor i8 %conv10.i.i, %mul9.i.i
  %87 = and i8 %xor1.i.i, 4
  %mul16.i.i = mul i8 %87, %83
  %xor18.i.i = xor i8 %mul16.i.i, %xor11.i.i
  %88 = and i8 %xor1.i.i, 8
  %mul23.i.i = mul i8 %88, %83
  %xor25.i.i = xor i8 %mul23.i.i, %xor18.i.i
  %89 = lshr i8 %xor25.i.i, 4
  %90 = lshr i8 %xor25.i.i, 3
  %91 = and i8 %90, 14
  %92 = xor i8 %89, %91
  %xor25.masked.i.i = and i8 %xor25.i.i, 15
  %93 = xor i8 %92, %xor25.masked.i.i
  %div.i = lshr exact i32 %jj.0.i400, 1
  %arrayidx33.i = getelementptr inbounds nuw i8, ptr %temp.i, i32 %div.i
  %94 = load i8, ptr %arrayidx33.i, align 1
  %xor356.i = xor i8 %94, %93
  store i8 %xor356.i, ptr %arrayidx33.i, align 1
  br label %for.inc46.i

if.else.i:                                        ; preds = %for.body27.i
  %arrayidx37.i = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %jj.0.i400
  %95 = load i8, ptr %arrayidx37.i, align 1
  %96 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1
  %xor1.i1.i = xor i8 %rem1.i, %96
  %97 = trunc i8 %xor1.i1.i to i1
  %98 = and i8 %xor1.i1.i, 2
  %mul9.i2.i = mul i8 %98, %95
  %conv10.i3.i = select i1 %97, i8 %95, i8 0
  %xor11.i4.i = xor i8 %conv10.i3.i, %mul9.i2.i
  %99 = and i8 %xor1.i1.i, 4
  %mul16.i5.i = mul i8 %99, %95
  %xor18.i6.i = xor i8 %mul16.i5.i, %xor11.i4.i
  %100 = and i8 %xor1.i1.i, 8
  %mul23.i7.i = mul i8 %100, %95
  %xor25.i8.i = xor i8 %mul23.i7.i, %xor18.i6.i
  %101 = lshr i8 %xor25.i8.i, 4
  %102 = lshr i8 %xor25.i8.i, 3
  %103 = and i8 %102, 14
  %104 = xor i8 %101, %103
  %xor25.masked.i9.i = and i8 %xor25.i8.i, 15
  %105 = xor i8 %104, %xor25.masked.i9.i
  %shl40.i = shl nuw i8 %105, 4
  %div415.i = lshr i32 %jj.0.i400, 1
  %arrayidx42.i = getelementptr inbounds nuw i8, ptr %temp.i, i32 %div415.i
  %106 = load i8, ptr %arrayidx42.i, align 1
  %xor44.i = xor i8 %shl40.i, %106
  store i8 %xor44.i, ptr %arrayidx42.i, align 1
  br label %for.inc46.i

for.inc46.i:                                      ; preds = %if.else.i, %if.then.i
  %inc47.i66 = add nuw nsw i32 %jj.0.i400, 1
  %exitcond8.i64.not = icmp eq i32 %inc47.i66, 4
  br i1 %exitcond8.i64.not, label %for.cond50.i.preheader, label %for.body27.i, !llvm.loop !62

for.body53.i:                                     ; preds = %for.cond50.i.preheader, %for.body53.i
  %k49.0.i401 = phi i32 [ 0, %for.cond50.i.preheader ], [ %inc72.i, %for.body53.i ]
  %mul54.i = mul nuw nsw i32 %i2.0.i404, 10
  %add55.i = add nuw nsw i32 %mul54.i, %j.0.i62403
  %.idx.i = mul nuw nsw i32 %add55.i, 40
  %107 = getelementptr i8, ptr %SPS, i32 %.idx.i
  %arrayidx58.i = getelementptr i64, ptr %107, i32 %k49.0.i401
  %108 = load i64, ptr %arrayidx58.i, align 8
  %cmp59.not.i = icmp eq i32 %i2.0.i404, %j.0.i62403
  %mul62.i = mul nuw nsw i32 %j.0.i62403, 10
  %add63.i = add nuw nsw i32 %mul62.i, %i2.0.i404
  %.idx4.i = mul nuw nsw i32 %add63.i, 40
  %109 = getelementptr i8, ptr %SPS, i32 %.idx4.i
  %arrayidx66.i = getelementptr i64, ptr %109, i32 %k49.0.i401
  %110 = load i64, ptr %arrayidx66.i, align 8
  %mul67.i = select i1 %cmp59.not.i, i64 0, i64 %110
  %xor68.i = xor i64 %108, %mul67.i
  %arrayidx69.i = getelementptr inbounds nuw [5 x i64], ptr %temp.i, i32 0, i32 %k49.0.i401
  %111 = load i64, ptr %arrayidx69.i, align 8
  %xor70.i = xor i64 %111, %xor68.i
  store i64 %xor70.i, ptr %arrayidx69.i, align 8
  %inc72.i = add nuw nsw i32 %k49.0.i401, 1
  %exitcond9.i65.not = icmp eq i32 %inc72.i, 5
  br i1 %exitcond9.i65.not, label %for.inc74.i, label %for.body53.i, !llvm.loop !63

for.inc74.i:                                      ; preds = %for.body53.i
  %inc75.i = add nuw nsw i32 %j.0.i62403, 1
  %exitcond10.i63.not = icmp eq i32 %inc75.i, 10
  br i1 %exitcond10.i63.not, label %for.cond6.i.for.inc77.i_crit_edge, label %for.body8.i, !llvm.loop !64

for.cond6.i.for.inc77.i_crit_edge:                ; preds = %for.inc74.i
  br label %for.inc77.i

for.inc77.i:                                      ; preds = %for.cond6.i.for.inc77.i_crit_edge
  %dec78.i = add nsw i32 %i2.0.i404, -1
  %cmp4.i = icmp sgt i32 %dec78.i, -1
  br i1 %cmp4.i, label %for.cond6.i.preheader, label %for.cond81.i.preheader, !llvm.loop !65

for.body84.i:                                     ; preds = %for.cond81.i.preheader, %for.body84.i
  %i80.0.i405 = phi i32 [ 0, %for.cond81.i.preheader ], [ %add106.i, %for.body84.i ]
  %arrayidx85.i = getelementptr inbounds nuw i8, ptr %zero, i32 %i80.0.i405
  %112 = load i8, ptr %arrayidx85.i, align 1
  %div87.i = lshr exact i32 %i80.0.i405, 1
  %arrayidx88.i = getelementptr inbounds nuw i8, ptr %temp.i, i32 %div87.i
  %113 = load i8, ptr %arrayidx88.i, align 1
  %114 = and i8 %113, 15
  %xor912.i = xor i8 %112, %114
  %arrayidx93.i = getelementptr inbounds nuw i8, ptr %eval, i32 %i80.0.i405
  store i8 %xor912.i, ptr %arrayidx93.i, align 1
  %add94.i = or disjoint i32 %i80.0.i405, 1
  %arrayidx95.i = getelementptr inbounds nuw i8, ptr %zero, i32 %add94.i
  %115 = load i8, ptr %arrayidx95.i, align 1
  %div97.i = lshr exact i32 %i80.0.i405, 1
  %arrayidx98.i = getelementptr inbounds nuw i8, ptr %temp.i, i32 %div97.i
  %116 = load i8, ptr %arrayidx98.i, align 1
  %117 = lshr i8 %116, 4
  %xor1013.i = xor i8 %115, %117
  %add103.i = or disjoint i32 %i80.0.i405, 1
  %arrayidx104.i = getelementptr inbounds nuw i8, ptr %eval, i32 %add103.i
  store i8 %xor1013.i, ptr %arrayidx104.i, align 1
  %add106.i = add nuw nsw i32 %i80.0.i405, 2
  %cmp82.i = icmp samesign ult i32 %add106.i, 78
  br i1 %cmp82.i, label %for.body84.i, label %compute_rhs.exit, !llvm.loop !66

compute_rhs.exit:                                 ; preds = %for.body84.i
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %temp.i)
  ret void
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #1 {
entry:
  %p_buf = alloca [128 x i8], align 16
  call void @mayo_memset(ptr %p_buf, i8 0, i32 128)
  %s = alloca [860 x i8], align 16
  call void @mayo_memset(ptr %s, i8 0, i32 860)
  %pk = alloca [18705 x i64], align 16
  call void @mayo_memset(ptr %pk, i8 0, i32 149640)
  %pk1 = alloca [18705 x i64], align 16
  call void @mayo_memset(ptr %pk1, i8 0, i32 149640)
  %pk2 = alloca [18705 x i64], align 16
  call void @mayo_memset(ptr %pk2, i8 0, i32 149640)
  %y = alloca [156 x i8], align 16
  call void @mayo_memset(ptr %y, i8 0, i32 156)
  call fastcc void @eval_public_map(ptr nonnull %p_buf, ptr %s, ptr %pk, ptr %pk1, ptr %pk2, ptr %y)
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
  br label %for.cond, !llvm.loop !67

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
!58 = distinct !{!58, !6}
!59 = distinct !{!59, !6}
!60 = distinct !{!60, !6}
!61 = distinct !{!61, !6}
!62 = distinct !{!62, !6}
!63 = distinct !{!63, !6}
!64 = distinct !{!64, !6}
!65 = distinct !{!65, !6}
!66 = distinct !{!66, !6}
!67 = distinct !{!67, !6}
