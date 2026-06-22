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
define dso_local fastcc void @mayo_generic_m_calculate_SPS(ptr noundef nonnull %PS, ptr noundef nonnull %S, i32 noundef %m, i32 noundef %k, i32 noundef %n, ptr noundef nonnull %SPS) unnamed_addr #0 {
entry:
  %accumulator = alloca [8000 x i64], align 8
  br label %for.body.i

for.cond.preheader:                               ; preds = %for.body.i
  br label %for.cond1.preheader

for.body.i:                                       ; preds = %entry, %for.body.i
  %i.0.i7 = phi i32 [ 0, %entry ], [ %inc.i, %for.body.i ]
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %accumulator, i32 %i.0.i7
  store i8 0, ptr %arrayidx.i, align 1
  %inc.i = add nuw nsw i32 %i.0.i7, 1
  %exitcond.i.not = icmp eq i32 %inc.i, 64000
  br i1 %exitcond.i.not, label %for.cond.preheader, label %for.body.i, !llvm.loop !7

for.cond1.preheader:                              ; preds = %for.cond.preheader, %for.inc20
  %row.011 = phi i32 [ 0, %for.cond.preheader ], [ %inc21, %for.inc20 ]
  br label %for.cond4.preheader

while.cond.preheader:                             ; preds = %for.inc20
  br label %while.body

for.cond4.preheader:                              ; preds = %for.cond1.preheader, %for.inc18
  %j.010 = phi i32 [ 0, %for.cond1.preheader ], [ %inc, %for.inc18 ]
  br label %for.body6

for.body6:                                        ; preds = %for.cond4.preheader, %m_vec_add.exit
  %col.09 = phi i32 [ 0, %for.cond4.preheader ], [ %add17, %m_vec_add.exit ]
  %mul = mul nuw nsw i32 %j.010, 10
  %add7 = add nuw nsw i32 %mul, %col.09
  %add.ptr.idx = mul nuw nsw i32 %add7, 40
  %add.ptr = getelementptr inbounds nuw i8, ptr %PS, i32 %add.ptr.idx
  %mul9 = mul nuw nsw i32 %row.011, 10
  %add10 = add nuw nsw i32 %mul9, %col.09
  %mul11 = shl nuw nsw i32 %add10, 4
  %mul12 = mul nuw nsw i32 %row.011, 86
  %0 = getelementptr i8, ptr %S, i32 %mul12
  %arrayidx = getelementptr i8, ptr %0, i32 %j.010
  %1 = load i8, ptr %arrayidx, align 1
  %conv = zext i8 %1 to i32
  %add14 = add nuw nsw i32 %mul11, %conv
  %add.ptr16.idx = mul nuw nsw i32 %add14, 40
  %add.ptr16 = getelementptr inbounds nuw i8, ptr %accumulator, i32 %add.ptr16.idx
  br label %for.body.i4

for.body.i4:                                      ; preds = %for.body6, %for.body.i4
  %i.0.i28 = phi i32 [ 0, %for.body6 ], [ %inc.i6, %for.body.i4 ]
  %arrayidx.i5 = getelementptr inbounds nuw i64, ptr %add.ptr, i32 %i.0.i28
  %2 = load i64, ptr %arrayidx.i5, align 8
  %arrayidx1.i = getelementptr inbounds nuw i64, ptr %add.ptr16, i32 %i.0.i28
  %3 = load i64, ptr %arrayidx1.i, align 8
  %xor.i = xor i64 %3, %2
  store i64 %xor.i, ptr %arrayidx1.i, align 8
  %inc.i6 = add nuw nsw i32 %i.0.i28, 1
  %exitcond.i3.not = icmp eq i32 %inc.i6, 5
  br i1 %exitcond.i3.not, label %m_vec_add.exit, label %for.body.i4, !llvm.loop !8

m_vec_add.exit:                                   ; preds = %for.body.i4
  %add17 = add nuw nsw i32 %col.09, 1
  %exitcond.not = icmp eq i32 %add17, 10
  br i1 %exitcond.not, label %for.inc18, label %for.body6, !llvm.loop !9

for.inc18:                                        ; preds = %m_vec_add.exit
  %inc = add nuw nsw i32 %j.010, 1
  %exitcond1.not = icmp eq i32 %inc, 86
  br i1 %exitcond1.not, label %for.inc20, label %for.cond4.preheader, !llvm.loop !10

for.inc20:                                        ; preds = %for.inc18
  %inc21 = add nuw nsw i32 %row.011, 1
  %exitcond2.not = icmp eq i32 %inc21, 10
  br i1 %exitcond2.not, label %while.cond.preheader, label %for.cond1.preheader, !llvm.loop !11

while.body:                                       ; preds = %while.cond.preheader, %m_vec_multiply_bins.exit
  %i.027 = phi i32 [ 0, %while.cond.preheader ], [ %inc32, %m_vec_multiply_bins.exit ]
  %add.ptr29.idx = mul nuw nsw i32 %i.027, 640
  %add.ptr29 = getelementptr inbounds nuw i8, ptr %accumulator, i32 %add.ptr29.idx
  %add.ptr31.idx = mul nuw nsw i32 %i.027, 40
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %add.ptr29, i32 200
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %add.ptr29, i32 400
  br label %for.body.i66.i

for.body.i66.i:                                   ; preds = %while.body, %for.body.i66.i
  %i.0.i64.i12 = phi i32 [ 0, %while.body ], [ %inc.i75.i, %for.body.i66.i ]
  %arrayidx.i67.i = getelementptr inbounds nuw i64, ptr %add.ptr.i, i32 %i.0.i64.i12
  %4 = load i64, ptr %arrayidx.i67.i, align 8
  %and.i68.i = and i64 %4, 1229782938247303441
  %xor.i69.i = lshr i64 %4, 1
  %shr.i70.i = and i64 %xor.i69.i, 8608480567731124087
  %mul.i71.i = mul nuw i64 %and.i68.i, 9
  %xor2.i72.i = xor i64 %shr.i70.i, %mul.i71.i
  %arrayidx3.i73.i = getelementptr inbounds nuw i64, ptr %add.ptr1.i, i32 %i.0.i64.i12
  %5 = load i64, ptr %arrayidx3.i73.i, align 8
  %xor4.i74.i = xor i64 %5, %xor2.i72.i
  store i64 %xor4.i74.i, ptr %arrayidx3.i73.i, align 8
  %inc.i75.i = add nuw nsw i32 %i.0.i64.i12, 1
  %exitcond.i65.i.not = icmp eq i32 %inc.i75.i, 5
  br i1 %exitcond.i65.i.not, label %m_vec_mul_add_x_inv.exit76.i, label %for.body.i66.i, !llvm.loop !12

m_vec_mul_add_x_inv.exit76.i:                     ; preds = %for.body.i66.i
  %add.ptr2.i = getelementptr inbounds nuw i8, ptr %add.ptr29, i32 440
  %add.ptr3.i = getelementptr inbounds nuw i8, ptr %add.ptr29, i32 480
  br label %for.body.i152.i

for.body.i152.i:                                  ; preds = %m_vec_mul_add_x_inv.exit76.i, %for.body.i152.i
  %i.0.i150.i13 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit76.i ], [ %inc.i162.i, %for.body.i152.i ]
  %arrayidx.i153.i = getelementptr inbounds nuw i64, ptr %add.ptr2.i, i32 %i.0.i150.i13
  %6 = load i64, ptr %arrayidx.i153.i, align 8
  %xor.i154.i = shl i64 %6, 1
  %shl.i155.i = and i64 %xor.i154.i, -1229782938247303442
  %and.i156.i = lshr i64 %6, 3
  %shr.i157.i = and i64 %and.i156.i, 1229782938247303441
  %mul.i158.i = mul nuw nsw i64 %shr.i157.i, 3
  %xor2.i159.i = xor i64 %shl.i155.i, %mul.i158.i
  %arrayidx3.i160.i = getelementptr inbounds nuw i64, ptr %add.ptr3.i, i32 %i.0.i150.i13
  %7 = load i64, ptr %arrayidx3.i160.i, align 8
  %xor4.i161.i = xor i64 %7, %xor2.i159.i
  store i64 %xor4.i161.i, ptr %arrayidx3.i160.i, align 8
  %inc.i162.i = add nuw nsw i32 %i.0.i150.i13, 1
  %exitcond.i151.i.not = icmp eq i32 %inc.i162.i, 5
  br i1 %exitcond.i151.i.not, label %m_vec_mul_add_x.exit163.i, label %for.body.i152.i, !llvm.loop !13

m_vec_mul_add_x.exit163.i:                        ; preds = %for.body.i152.i
  %add.ptr4.i = getelementptr inbounds nuw i8, ptr %add.ptr29, i32 400
  %add.ptr5.i = getelementptr inbounds nuw i8, ptr %add.ptr29, i32 280
  br label %for.body.i10.i

for.body.i10.i:                                   ; preds = %m_vec_mul_add_x.exit163.i, %for.body.i10.i
  %i.0.i8.i14 = phi i32 [ 0, %m_vec_mul_add_x.exit163.i ], [ %inc.i19.i, %for.body.i10.i ]
  %arrayidx.i11.i = getelementptr inbounds nuw i64, ptr %add.ptr4.i, i32 %i.0.i8.i14
  %8 = load i64, ptr %arrayidx.i11.i, align 8
  %and.i12.i = and i64 %8, 1229782938247303441
  %xor.i13.i = lshr i64 %8, 1
  %shr.i14.i = and i64 %xor.i13.i, 8608480567731124087
  %mul.i15.i = mul nuw i64 %and.i12.i, 9
  %xor2.i16.i = xor i64 %shr.i14.i, %mul.i15.i
  %arrayidx3.i17.i = getelementptr inbounds nuw i64, ptr %add.ptr5.i, i32 %i.0.i8.i14
  %9 = load i64, ptr %arrayidx3.i17.i, align 8
  %xor4.i18.i = xor i64 %9, %xor2.i16.i
  store i64 %xor4.i18.i, ptr %arrayidx3.i17.i, align 8
  %inc.i19.i = add nuw nsw i32 %i.0.i8.i14, 1
  %exitcond.i9.i.not = icmp eq i32 %inc.i19.i, 5
  br i1 %exitcond.i9.i.not, label %m_vec_mul_add_x_inv.exit20.i, label %for.body.i10.i, !llvm.loop !14

m_vec_mul_add_x_inv.exit20.i:                     ; preds = %for.body.i10.i
  %add.ptr6.i = getelementptr inbounds nuw i8, ptr %add.ptr29, i32 480
  %add.ptr7.i = getelementptr inbounds nuw i8, ptr %add.ptr29, i32 240
  br label %for.body.i107.i

for.body.i107.i:                                  ; preds = %m_vec_mul_add_x_inv.exit20.i, %for.body.i107.i
  %i.0.i105.i15 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit20.i ], [ %inc.i117.i, %for.body.i107.i ]
  %arrayidx.i108.i = getelementptr inbounds nuw i64, ptr %add.ptr6.i, i32 %i.0.i105.i15
  %10 = load i64, ptr %arrayidx.i108.i, align 8
  %xor.i109.i = shl i64 %10, 1
  %shl.i110.i = and i64 %xor.i109.i, -1229782938247303442
  %and.i111.i = lshr i64 %10, 3
  %shr.i112.i = and i64 %and.i111.i, 1229782938247303441
  %mul.i113.i = mul nuw nsw i64 %shr.i112.i, 3
  %xor2.i114.i = xor i64 %shl.i110.i, %mul.i113.i
  %arrayidx3.i115.i = getelementptr inbounds nuw i64, ptr %add.ptr7.i, i32 %i.0.i105.i15
  %11 = load i64, ptr %arrayidx3.i115.i, align 8
  %xor4.i116.i = xor i64 %11, %xor2.i114.i
  store i64 %xor4.i116.i, ptr %arrayidx3.i115.i, align 8
  %inc.i117.i = add nuw nsw i32 %i.0.i105.i15, 1
  %exitcond.i106.i.not = icmp eq i32 %inc.i117.i, 5
  br i1 %exitcond.i106.i.not, label %m_vec_mul_add_x.exit118.i, label %for.body.i107.i, !llvm.loop !15

m_vec_mul_add_x.exit118.i:                        ; preds = %for.body.i107.i
  %add.ptr8.i = getelementptr inbounds nuw i8, ptr %add.ptr29, i32 280
  %add.ptr9.i = getelementptr inbounds nuw i8, ptr %add.ptr29, i32 560
  br label %for.body.i80.i

for.body.i80.i:                                   ; preds = %m_vec_mul_add_x.exit118.i, %for.body.i80.i
  %i.0.i78.i16 = phi i32 [ 0, %m_vec_mul_add_x.exit118.i ], [ %inc.i89.i, %for.body.i80.i ]
  %arrayidx.i81.i = getelementptr inbounds nuw i64, ptr %add.ptr8.i, i32 %i.0.i78.i16
  %12 = load i64, ptr %arrayidx.i81.i, align 8
  %and.i82.i = and i64 %12, 1229782938247303441
  %xor.i83.i = lshr i64 %12, 1
  %shr.i84.i = and i64 %xor.i83.i, 8608480567731124087
  %mul.i85.i = mul nuw i64 %and.i82.i, 9
  %xor2.i86.i = xor i64 %shr.i84.i, %mul.i85.i
  %arrayidx3.i87.i = getelementptr inbounds nuw i64, ptr %add.ptr9.i, i32 %i.0.i78.i16
  %13 = load i64, ptr %arrayidx3.i87.i, align 8
  %xor4.i88.i = xor i64 %13, %xor2.i86.i
  store i64 %xor4.i88.i, ptr %arrayidx3.i87.i, align 8
  %inc.i89.i = add nuw nsw i32 %i.0.i78.i16, 1
  %exitcond.i79.i.not = icmp eq i32 %inc.i89.i, 5
  br i1 %exitcond.i79.i.not, label %m_vec_mul_add_x_inv.exit90.i, label %for.body.i80.i, !llvm.loop !16

m_vec_mul_add_x_inv.exit90.i:                     ; preds = %for.body.i80.i
  %add.ptr10.i = getelementptr inbounds nuw i8, ptr %add.ptr29, i32 240
  %add.ptr11.i = getelementptr inbounds nuw i8, ptr %add.ptr29, i32 120
  br label %for.body.i137.i

for.body.i137.i:                                  ; preds = %m_vec_mul_add_x_inv.exit90.i, %for.body.i137.i
  %i.0.i135.i17 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit90.i ], [ %inc.i147.i, %for.body.i137.i ]
  %arrayidx.i138.i = getelementptr inbounds nuw i64, ptr %add.ptr10.i, i32 %i.0.i135.i17
  %14 = load i64, ptr %arrayidx.i138.i, align 8
  %xor.i139.i = shl i64 %14, 1
  %shl.i140.i = and i64 %xor.i139.i, -1229782938247303442
  %and.i141.i = lshr i64 %14, 3
  %shr.i142.i = and i64 %and.i141.i, 1229782938247303441
  %mul.i143.i = mul nuw nsw i64 %shr.i142.i, 3
  %xor2.i144.i = xor i64 %shl.i140.i, %mul.i143.i
  %arrayidx3.i145.i = getelementptr inbounds nuw i64, ptr %add.ptr11.i, i32 %i.0.i135.i17
  %15 = load i64, ptr %arrayidx3.i145.i, align 8
  %xor4.i146.i = xor i64 %15, %xor2.i144.i
  store i64 %xor4.i146.i, ptr %arrayidx3.i145.i, align 8
  %inc.i147.i = add nuw nsw i32 %i.0.i135.i17, 1
  %exitcond.i136.i.not = icmp eq i32 %inc.i147.i, 5
  br i1 %exitcond.i136.i.not, label %m_vec_mul_add_x.exit148.i, label %for.body.i137.i, !llvm.loop !17

m_vec_mul_add_x.exit148.i:                        ; preds = %for.body.i137.i
  %add.ptr12.i = getelementptr inbounds nuw i8, ptr %add.ptr29, i32 560
  %add.ptr13.i = getelementptr inbounds nuw i8, ptr %add.ptr29, i32 600
  br label %for.body.i52.i

for.body.i52.i:                                   ; preds = %m_vec_mul_add_x.exit148.i, %for.body.i52.i
  %i.0.i50.i18 = phi i32 [ 0, %m_vec_mul_add_x.exit148.i ], [ %inc.i61.i, %for.body.i52.i ]
  %arrayidx.i53.i = getelementptr inbounds nuw i64, ptr %add.ptr12.i, i32 %i.0.i50.i18
  %16 = load i64, ptr %arrayidx.i53.i, align 8
  %and.i54.i = and i64 %16, 1229782938247303441
  %xor.i55.i = lshr i64 %16, 1
  %shr.i56.i = and i64 %xor.i55.i, 8608480567731124087
  %mul.i57.i = mul nuw i64 %and.i54.i, 9
  %xor2.i58.i = xor i64 %shr.i56.i, %mul.i57.i
  %arrayidx3.i59.i = getelementptr inbounds nuw i64, ptr %add.ptr13.i, i32 %i.0.i50.i18
  %17 = load i64, ptr %arrayidx3.i59.i, align 8
  %xor4.i60.i = xor i64 %17, %xor2.i58.i
  store i64 %xor4.i60.i, ptr %arrayidx3.i59.i, align 8
  %inc.i61.i = add nuw nsw i32 %i.0.i50.i18, 1
  %exitcond.i51.i.not = icmp eq i32 %inc.i61.i, 5
  br i1 %exitcond.i51.i.not, label %m_vec_mul_add_x_inv.exit62.i, label %for.body.i52.i, !llvm.loop !18

m_vec_mul_add_x_inv.exit62.i:                     ; preds = %for.body.i52.i
  %add.ptr14.i = getelementptr inbounds nuw i8, ptr %add.ptr29, i32 120
  %add.ptr15.i = getelementptr inbounds nuw i8, ptr %add.ptr29, i32 320
  br label %for.body.i167.i

for.body.i167.i:                                  ; preds = %m_vec_mul_add_x_inv.exit62.i, %for.body.i167.i
  %i.0.i165.i19 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit62.i ], [ %inc.i177.i, %for.body.i167.i ]
  %arrayidx.i168.i = getelementptr inbounds nuw i64, ptr %add.ptr14.i, i32 %i.0.i165.i19
  %18 = load i64, ptr %arrayidx.i168.i, align 8
  %xor.i169.i = shl i64 %18, 1
  %shl.i170.i = and i64 %xor.i169.i, -1229782938247303442
  %and.i171.i = lshr i64 %18, 3
  %shr.i172.i = and i64 %and.i171.i, 1229782938247303441
  %mul.i173.i = mul nuw nsw i64 %shr.i172.i, 3
  %xor2.i174.i = xor i64 %shl.i170.i, %mul.i173.i
  %arrayidx3.i175.i = getelementptr inbounds nuw i64, ptr %add.ptr15.i, i32 %i.0.i165.i19
  %19 = load i64, ptr %arrayidx3.i175.i, align 8
  %xor4.i176.i = xor i64 %19, %xor2.i174.i
  store i64 %xor4.i176.i, ptr %arrayidx3.i175.i, align 8
  %inc.i177.i = add nuw nsw i32 %i.0.i165.i19, 1
  %exitcond.i166.i.not = icmp eq i32 %inc.i177.i, 5
  br i1 %exitcond.i166.i.not, label %m_vec_mul_add_x.exit178.i, label %for.body.i167.i, !llvm.loop !19

m_vec_mul_add_x.exit178.i:                        ; preds = %for.body.i167.i
  %add.ptr16.i = getelementptr inbounds nuw i8, ptr %add.ptr29, i32 600
  %add.ptr17.i = getelementptr inbounds nuw i8, ptr %add.ptr29, i32 520
  br label %for.body.i4.i

for.body.i4.i:                                    ; preds = %m_vec_mul_add_x.exit178.i, %for.body.i4.i
  %i.0.i2.i20 = phi i32 [ 0, %m_vec_mul_add_x.exit178.i ], [ %inc.i6.i, %for.body.i4.i ]
  %arrayidx.i5.i = getelementptr inbounds nuw i64, ptr %add.ptr16.i, i32 %i.0.i2.i20
  %20 = load i64, ptr %arrayidx.i5.i, align 8
  %and.i.i = and i64 %20, 1229782938247303441
  %xor.i.i = lshr i64 %20, 1
  %shr.i.i = and i64 %xor.i.i, 8608480567731124087
  %mul.i.i = mul nuw i64 %and.i.i, 9
  %xor2.i.i = xor i64 %shr.i.i, %mul.i.i
  %arrayidx3.i.i = getelementptr inbounds nuw i64, ptr %add.ptr17.i, i32 %i.0.i2.i20
  %21 = load i64, ptr %arrayidx3.i.i, align 8
  %xor4.i.i = xor i64 %21, %xor2.i.i
  store i64 %xor4.i.i, ptr %arrayidx3.i.i, align 8
  %inc.i6.i = add nuw nsw i32 %i.0.i2.i20, 1
  %exitcond.i3.i.not = icmp eq i32 %inc.i6.i, 5
  br i1 %exitcond.i3.i.not, label %m_vec_mul_add_x_inv.exit.i, label %for.body.i4.i, !llvm.loop !20

m_vec_mul_add_x_inv.exit.i:                       ; preds = %for.body.i4.i
  %add.ptr18.i = getelementptr inbounds nuw i8, ptr %add.ptr29, i32 320
  %add.ptr19.i = getelementptr inbounds nuw i8, ptr %add.ptr29, i32 160
  br label %for.body.i94.i

for.body.i94.i:                                   ; preds = %m_vec_mul_add_x_inv.exit.i, %for.body.i94.i
  %i.0.i92.i21 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit.i ], [ %inc.i103.i, %for.body.i94.i ]
  %arrayidx.i95.i = getelementptr inbounds nuw i64, ptr %add.ptr18.i, i32 %i.0.i92.i21
  %22 = load i64, ptr %arrayidx.i95.i, align 8
  %xor.i96.i = shl i64 %22, 1
  %shl.i.i = and i64 %xor.i96.i, -1229782938247303442
  %and.i97.i = lshr i64 %22, 3
  %shr.i98.i = and i64 %and.i97.i, 1229782938247303441
  %mul.i99.i = mul nuw nsw i64 %shr.i98.i, 3
  %xor2.i100.i = xor i64 %shl.i.i, %mul.i99.i
  %arrayidx3.i101.i = getelementptr inbounds nuw i64, ptr %add.ptr19.i, i32 %i.0.i92.i21
  %23 = load i64, ptr %arrayidx3.i101.i, align 8
  %xor4.i102.i = xor i64 %23, %xor2.i100.i
  store i64 %xor4.i102.i, ptr %arrayidx3.i101.i, align 8
  %inc.i103.i = add nuw nsw i32 %i.0.i92.i21, 1
  %exitcond.i93.i.not = icmp eq i32 %inc.i103.i, 5
  br i1 %exitcond.i93.i.not, label %m_vec_mul_add_x.exit.i, label %for.body.i94.i, !llvm.loop !21

m_vec_mul_add_x.exit.i:                           ; preds = %for.body.i94.i
  %add.ptr20.i = getelementptr inbounds nuw i8, ptr %add.ptr29, i32 520
  %add.ptr21.i = getelementptr inbounds nuw i8, ptr %add.ptr29, i32 360
  br label %for.body.i24.i

for.body.i24.i:                                   ; preds = %m_vec_mul_add_x.exit.i, %for.body.i24.i
  %i.0.i22.i22 = phi i32 [ 0, %m_vec_mul_add_x.exit.i ], [ %inc.i33.i, %for.body.i24.i ]
  %arrayidx.i25.i = getelementptr inbounds nuw i64, ptr %add.ptr20.i, i32 %i.0.i22.i22
  %24 = load i64, ptr %arrayidx.i25.i, align 8
  %and.i26.i = and i64 %24, 1229782938247303441
  %xor.i27.i = lshr i64 %24, 1
  %shr.i28.i = and i64 %xor.i27.i, 8608480567731124087
  %mul.i29.i = mul nuw i64 %and.i26.i, 9
  %xor2.i30.i = xor i64 %shr.i28.i, %mul.i29.i
  %arrayidx3.i31.i = getelementptr inbounds nuw i64, ptr %add.ptr21.i, i32 %i.0.i22.i22
  %25 = load i64, ptr %arrayidx3.i31.i, align 8
  %xor4.i32.i = xor i64 %25, %xor2.i30.i
  store i64 %xor4.i32.i, ptr %arrayidx3.i31.i, align 8
  %inc.i33.i = add nuw nsw i32 %i.0.i22.i22, 1
  %exitcond.i23.i.not = icmp eq i32 %inc.i33.i, 5
  br i1 %exitcond.i23.i.not, label %m_vec_mul_add_x_inv.exit34.i, label %for.body.i24.i, !llvm.loop !22

m_vec_mul_add_x_inv.exit34.i:                     ; preds = %for.body.i24.i
  %add.ptr22.i = getelementptr inbounds nuw i8, ptr %add.ptr29, i32 160
  %add.ptr23.i = getelementptr inbounds nuw i8, ptr %add.ptr29, i32 80
  br label %for.body.i182.i

for.body.i182.i:                                  ; preds = %m_vec_mul_add_x_inv.exit34.i, %for.body.i182.i
  %i.0.i180.i23 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit34.i ], [ %inc.i192.i, %for.body.i182.i ]
  %arrayidx.i183.i = getelementptr inbounds nuw i64, ptr %add.ptr22.i, i32 %i.0.i180.i23
  %26 = load i64, ptr %arrayidx.i183.i, align 8
  %xor.i184.i = shl i64 %26, 1
  %shl.i185.i = and i64 %xor.i184.i, -1229782938247303442
  %and.i186.i = lshr i64 %26, 3
  %shr.i187.i = and i64 %and.i186.i, 1229782938247303441
  %mul.i188.i = mul nuw nsw i64 %shr.i187.i, 3
  %xor2.i189.i = xor i64 %shl.i185.i, %mul.i188.i
  %arrayidx3.i190.i = getelementptr inbounds nuw i64, ptr %add.ptr23.i, i32 %i.0.i180.i23
  %27 = load i64, ptr %arrayidx3.i190.i, align 8
  %xor4.i191.i = xor i64 %27, %xor2.i189.i
  store i64 %xor4.i191.i, ptr %arrayidx3.i190.i, align 8
  %inc.i192.i = add nuw nsw i32 %i.0.i180.i23, 1
  %exitcond.i181.i.not = icmp eq i32 %inc.i192.i, 5
  br i1 %exitcond.i181.i.not, label %m_vec_mul_add_x.exit193.i, label %for.body.i182.i, !llvm.loop !23

m_vec_mul_add_x.exit193.i:                        ; preds = %for.body.i182.i
  %add.ptr24.i = getelementptr inbounds nuw i8, ptr %add.ptr29, i32 360
  %add.ptr25.i = getelementptr inbounds nuw i8, ptr %add.ptr29, i32 40
  br label %for.body.i38.i

for.body.i38.i:                                   ; preds = %m_vec_mul_add_x.exit193.i, %for.body.i38.i
  %i.0.i36.i24 = phi i32 [ 0, %m_vec_mul_add_x.exit193.i ], [ %inc.i47.i, %for.body.i38.i ]
  %arrayidx.i39.i = getelementptr inbounds nuw i64, ptr %add.ptr24.i, i32 %i.0.i36.i24
  %28 = load i64, ptr %arrayidx.i39.i, align 8
  %and.i40.i = and i64 %28, 1229782938247303441
  %xor.i41.i = lshr i64 %28, 1
  %shr.i42.i = and i64 %xor.i41.i, 8608480567731124087
  %mul.i43.i = mul nuw i64 %and.i40.i, 9
  %xor2.i44.i = xor i64 %shr.i42.i, %mul.i43.i
  %arrayidx3.i45.i = getelementptr inbounds nuw i64, ptr %add.ptr25.i, i32 %i.0.i36.i24
  %29 = load i64, ptr %arrayidx3.i45.i, align 8
  %xor4.i46.i = xor i64 %29, %xor2.i44.i
  store i64 %xor4.i46.i, ptr %arrayidx3.i45.i, align 8
  %inc.i47.i = add nuw nsw i32 %i.0.i36.i24, 1
  %exitcond.i37.i.not = icmp eq i32 %inc.i47.i, 5
  br i1 %exitcond.i37.i.not, label %m_vec_mul_add_x_inv.exit48.i, label %for.body.i38.i, !llvm.loop !24

m_vec_mul_add_x_inv.exit48.i:                     ; preds = %for.body.i38.i
  %add.ptr26.i = getelementptr inbounds nuw i8, ptr %add.ptr29, i32 80
  %add.ptr27.i = getelementptr inbounds nuw i8, ptr %add.ptr29, i32 40
  br label %for.body.i122.i

for.body.i122.i:                                  ; preds = %m_vec_mul_add_x_inv.exit48.i, %for.body.i122.i
  %i.0.i120.i25 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit48.i ], [ %inc.i132.i, %for.body.i122.i ]
  %arrayidx.i123.i = getelementptr inbounds nuw i64, ptr %add.ptr26.i, i32 %i.0.i120.i25
  %30 = load i64, ptr %arrayidx.i123.i, align 8
  %xor.i124.i = shl i64 %30, 1
  %shl.i125.i = and i64 %xor.i124.i, -1229782938247303442
  %and.i126.i = lshr i64 %30, 3
  %shr.i127.i = and i64 %and.i126.i, 1229782938247303441
  %mul.i128.i = mul nuw nsw i64 %shr.i127.i, 3
  %xor2.i129.i = xor i64 %shl.i125.i, %mul.i128.i
  %arrayidx3.i130.i = getelementptr inbounds nuw i64, ptr %add.ptr27.i, i32 %i.0.i120.i25
  %31 = load i64, ptr %arrayidx3.i130.i, align 8
  %xor4.i131.i = xor i64 %31, %xor2.i129.i
  store i64 %xor4.i131.i, ptr %arrayidx3.i130.i, align 8
  %inc.i132.i = add nuw nsw i32 %i.0.i120.i25, 1
  %exitcond.i121.i.not = icmp eq i32 %inc.i132.i, 5
  br i1 %exitcond.i121.i.not, label %m_vec_mul_add_x.exit133.i, label %for.body.i122.i, !llvm.loop !25

m_vec_mul_add_x.exit133.i:                        ; preds = %for.body.i122.i
  %add.ptr31 = getelementptr inbounds nuw i8, ptr %SPS, i32 %add.ptr31.idx
  %add.ptr28.i = getelementptr inbounds nuw i8, ptr %add.ptr29, i32 40
  br label %for.body.i.i

for.body.i.i:                                     ; preds = %m_vec_mul_add_x.exit133.i, %for.body.i.i
  %i.0.i.i26 = phi i32 [ 0, %m_vec_mul_add_x.exit133.i ], [ %inc.i.i, %for.body.i.i ]
  %arrayidx.i.i = getelementptr inbounds nuw i64, ptr %add.ptr28.i, i32 %i.0.i.i26
  %32 = load i64, ptr %arrayidx.i.i, align 8
  %arrayidx1.i.i = getelementptr inbounds nuw i64, ptr %add.ptr31, i32 %i.0.i.i26
  store i64 %32, ptr %arrayidx1.i.i, align 8
  %inc.i.i = add nuw nsw i32 %i.0.i.i26, 1
  %exitcond.i.i.not = icmp eq i32 %inc.i.i, 5
  br i1 %exitcond.i.i.not, label %m_vec_multiply_bins.exit, label %for.body.i.i, !llvm.loop !26

m_vec_multiply_bins.exit:                         ; preds = %for.body.i.i
  %inc32 = add nuw nsw i32 %i.027, 1
  %exitcond3.not = icmp eq i32 %inc32, 100
  br i1 %exitcond3.not, label %while.end, label %while.body, !llvm.loop !27

while.end:                                        ; preds = %m_vec_multiply_bins.exit
  ret void
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #1 {
entry:
  %PS = alloca [4300 x i64], align 16
  call void @mayo_memset(ptr %PS, i8 0, i32 34400)
  %s = alloca [860 x i8], align 16
  call void @mayo_memset(ptr %s, i8 0, i32 860)
  %SPS = alloca [500 x i64], align 16
  call void @mayo_memset(ptr %SPS, i8 0, i32 4000)
  call fastcc void @mayo_generic_m_calculate_SPS(ptr %PS, ptr %s, i32 78, i32 10, i32 86, ptr %SPS)
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
  br label %for.cond, !llvm.loop !28

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
!21 = distinct !{!21, !6}
!22 = distinct !{!22, !6}
!23 = distinct !{!23, !6}
!24 = distinct !{!24, !6}
!25 = distinct !{!25, !6}
!26 = distinct !{!26, !6}
!27 = distinct !{!27, !6}
!28 = distinct !{!28, !6}
