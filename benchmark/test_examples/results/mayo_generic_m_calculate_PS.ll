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
define dso_local fastcc void @mayo_generic_m_calculate_PS(ptr noundef nonnull %P1, ptr noundef nonnull %P2, ptr noundef nonnull %P3, ptr noundef nonnull %S, i32 noundef %m, i32 noundef %v, i32 noundef %o, i32 noundef %k, ptr noundef nonnull %PS) unnamed_addr #0 {
entry:
  %accumulator = alloca [68800 x i64], align 8
  br label %for.body.i

for.cond.preheader:                               ; preds = %for.body.i
  br label %for.cond2.preheader

for.body.i:                                       ; preds = %entry, %for.body.i
  %i.0.i25 = phi i32 [ 0, %entry ], [ %inc.i, %for.body.i ]
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %accumulator, i32 %i.0.i25
  store i8 0, ptr %arrayidx.i, align 1
  %inc.i = add nuw nsw i32 %i.0.i25, 1
  %exitcond.i.not = icmp eq i32 %inc.i, 550400
  br i1 %exitcond.i.not, label %for.cond.preheader, label %for.body.i, !llvm.loop !7

for.cond56.preheader:                             ; preds = %for.inc52
  br label %for.cond61.preheader

for.cond2.preheader:                              ; preds = %for.cond.preheader, %for.inc52
  %row.036 = phi i32 [ 0, %for.cond.preheader ], [ %inc53, %for.inc52 ]
  %P1_used.035 = phi i32 [ 0, %for.cond.preheader ], [ %split, %for.inc52 ]
  %indvars.iv34 = phi i32 [ 78, %for.cond.preheader ], [ %indvars.iv.next, %for.inc52 ]
  %0 = add i32 %P1_used.035, %indvars.iv34
  br label %for.cond5.preheader.lr.ph

for.cond5.preheader.lr.ph:                        ; preds = %for.cond2.preheader
  br label %for.cond5.preheader

for.cond2.for.cond21.preheader_crit_edge:         ; preds = %for.inc17
  %split = phi i32 [ %inc16, %for.inc17 ]
  br label %for.cond21.preheader

for.cond21.preheader:                             ; preds = %for.cond2.for.cond21.preheader_crit_edge
  br label %for.cond26.preheader

for.cond5.preheader:                              ; preds = %for.cond5.preheader.lr.ph, %for.inc17
  %j.030 = phi i32 [ %row.036, %for.cond5.preheader.lr.ph ], [ %inc18, %for.inc17 ]
  %P1_used.129 = phi i32 [ %P1_used.035, %for.cond5.preheader.lr.ph ], [ %inc16, %for.inc17 ]
  br label %for.body7

for.body7:                                        ; preds = %for.cond5.preheader, %m_vec_add.exit15
  %col.027 = phi i32 [ 0, %for.cond5.preheader ], [ %inc, %m_vec_add.exit15 ]
  %add.ptr.idx = mul nsw i32 %P1_used.129, 40
  %add.ptr = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx
  %mul8 = mul nuw nsw i32 %row.036, 10
  %add9 = add nuw nsw i32 %mul8, %col.027
  %mul10 = shl nuw nsw i32 %add9, 4
  %mul11 = mul nuw nsw i32 %col.027, 86
  %1 = getelementptr i8, ptr %S, i32 %mul11
  %arrayidx = getelementptr i8, ptr %1, i32 %j.030
  %2 = load i8, ptr %arrayidx, align 1
  %conv = zext i8 %2 to i32
  %add13 = add nuw nsw i32 %mul10, %conv
  %add.ptr15.idx = mul nuw nsw i32 %add13, 40
  %add.ptr15 = getelementptr inbounds nuw i8, ptr %accumulator, i32 %add.ptr15.idx
  br label %for.body.i10

for.body.i10:                                     ; preds = %for.body7, %for.body.i10
  %i.0.i826 = phi i32 [ 0, %for.body7 ], [ %inc.i14, %for.body.i10 ]
  %arrayidx.i11 = getelementptr inbounds nuw i64, ptr %add.ptr, i32 %i.0.i826
  %3 = load i64, ptr %arrayidx.i11, align 8
  %arrayidx1.i12 = getelementptr inbounds nuw i64, ptr %add.ptr15, i32 %i.0.i826
  %4 = load i64, ptr %arrayidx1.i12, align 8
  %xor.i13 = xor i64 %4, %3
  store i64 %xor.i13, ptr %arrayidx1.i12, align 8
  %inc.i14 = add nuw nsw i32 %i.0.i826, 1
  %exitcond.i9.not = icmp eq i32 %inc.i14, 5
  br i1 %exitcond.i9.not, label %m_vec_add.exit15, label %for.body.i10, !llvm.loop !8

m_vec_add.exit15:                                 ; preds = %for.body.i10
  %inc = add nuw nsw i32 %col.027, 1
  %exitcond.not = icmp eq i32 %inc, 10
  br i1 %exitcond.not, label %for.inc17, label %for.body7, !llvm.loop !9

for.inc17:                                        ; preds = %m_vec_add.exit15
  %inc16 = add i32 %P1_used.129, 1
  %inc18 = add nuw nsw i32 %j.030, 1
  %exitcond1.not = icmp eq i32 %inc16, %0
  br i1 %exitcond1.not, label %for.cond2.for.cond21.preheader_crit_edge, label %for.cond5.preheader, !llvm.loop !10

for.cond26.preheader:                             ; preds = %for.cond21.preheader, %for.inc49
  %j20.033 = phi i32 [ 0, %for.cond21.preheader ], [ %inc50, %for.inc49 ]
  br label %for.body29

for.body29:                                       ; preds = %for.cond26.preheader, %m_vec_add.exit24
  %col25.032 = phi i32 [ 0, %for.cond26.preheader ], [ %inc47, %m_vec_add.exit24 ]
  %mul30 = shl nuw nsw i32 %row.036, 3
  %add31 = or disjoint i32 %mul30, %j20.033
  %add.ptr33.idx = mul nuw nsw i32 %add31, 40
  %add.ptr33 = getelementptr inbounds nuw i8, ptr %P2, i32 %add.ptr33.idx
  %mul35 = mul nuw nsw i32 %row.036, 10
  %add36 = add nuw nsw i32 %mul35, %col25.032
  %mul37 = shl nuw nsw i32 %add36, 4
  %mul38 = mul nuw nsw i32 %col25.032, 86
  %5 = getelementptr i8, ptr %S, i32 %mul38
  %6 = getelementptr i8, ptr %5, i32 %j20.033
  %arrayidx41 = getelementptr i8, ptr %6, i32 78
  %7 = load i8, ptr %arrayidx41, align 1
  %conv42 = zext i8 %7 to i32
  %add43 = add nuw nsw i32 %mul37, %conv42
  %add.ptr45.idx = mul nuw nsw i32 %add43, 40
  %add.ptr45 = getelementptr inbounds nuw i8, ptr %accumulator, i32 %add.ptr45.idx
  br label %for.body.i19

for.body.i19:                                     ; preds = %for.body29, %for.body.i19
  %i.0.i1731 = phi i32 [ 0, %for.body29 ], [ %inc.i23, %for.body.i19 ]
  %arrayidx.i20 = getelementptr inbounds nuw i64, ptr %add.ptr33, i32 %i.0.i1731
  %8 = load i64, ptr %arrayidx.i20, align 8
  %arrayidx1.i21 = getelementptr inbounds nuw i64, ptr %add.ptr45, i32 %i.0.i1731
  %9 = load i64, ptr %arrayidx1.i21, align 8
  %xor.i22 = xor i64 %9, %8
  store i64 %xor.i22, ptr %arrayidx1.i21, align 8
  %inc.i23 = add nuw nsw i32 %i.0.i1731, 1
  %exitcond.i18.not = icmp eq i32 %inc.i23, 5
  br i1 %exitcond.i18.not, label %m_vec_add.exit24, label %for.body.i19, !llvm.loop !11

m_vec_add.exit24:                                 ; preds = %for.body.i19
  %inc47 = add nuw nsw i32 %col25.032, 1
  %exitcond2.not = icmp eq i32 %inc47, 10
  br i1 %exitcond2.not, label %for.inc49, label %for.body29, !llvm.loop !12

for.inc49:                                        ; preds = %m_vec_add.exit24
  %inc50 = add nuw nsw i32 %j20.033, 1
  %exitcond3.not = icmp eq i32 %inc50, 8
  br i1 %exitcond3.not, label %for.inc52, label %for.cond26.preheader, !llvm.loop !13

for.inc52:                                        ; preds = %for.inc49
  %inc53 = add nuw nsw i32 %row.036, 1
  %indvars.iv.next = add nsw i32 %indvars.iv34, -1
  %exitcond4.not = icmp eq i32 %inc53, 78
  br i1 %exitcond4.not, label %for.cond56.preheader, label %for.cond2.preheader, !llvm.loop !14

while.cond.preheader:                             ; preds = %for.inc90
  br label %while.body

for.cond61.preheader:                             ; preds = %for.cond56.preheader, %for.inc90
  %row55.045 = phi i32 [ 78, %for.cond56.preheader ], [ %inc91, %for.inc90 ]
  %P3_used.044 = phi i32 [ 0, %for.cond56.preheader ], [ %split42, %for.inc90 ]
  %indvars.iv643 = phi i32 [ 8, %for.cond56.preheader ], [ %indvars.iv.next7, %for.inc90 ]
  %10 = add i32 %P3_used.044, %indvars.iv643
  br label %for.cond66.preheader.lr.ph

for.cond66.preheader.lr.ph:                       ; preds = %for.cond61.preheader
  br label %for.cond66.preheader

for.cond66.preheader:                             ; preds = %for.cond66.preheader.lr.ph, %for.inc87
  %j60.041 = phi i32 [ %row55.045, %for.cond66.preheader.lr.ph ], [ %inc88, %for.inc87 ]
  %P3_used.140 = phi i32 [ %P3_used.044, %for.cond66.preheader.lr.ph ], [ %inc86, %for.inc87 ]
  br label %for.body69

for.body69:                                       ; preds = %for.cond66.preheader, %m_vec_add.exit
  %col65.038 = phi i32 [ 0, %for.cond66.preheader ], [ %inc84, %m_vec_add.exit ]
  %add.ptr71.idx = mul nsw i32 %P3_used.140, 40
  %add.ptr71 = getelementptr inbounds i8, ptr %P3, i32 %add.ptr71.idx
  %mul73 = mul nuw nsw i32 %row55.045, 10
  %add74 = add nuw nsw i32 %mul73, %col65.038
  %mul75 = shl nuw nsw i32 %add74, 4
  %mul76 = mul nuw nsw i32 %col65.038, 86
  %11 = getelementptr i8, ptr %S, i32 %mul76
  %arrayidx78 = getelementptr i8, ptr %11, i32 %j60.041
  %12 = load i8, ptr %arrayidx78, align 1
  %conv79 = zext i8 %12 to i32
  %add80 = add nuw nsw i32 %mul75, %conv79
  %add.ptr82.idx = mul nuw nsw i32 %add80, 40
  %add.ptr82 = getelementptr inbounds nuw i8, ptr %accumulator, i32 %add.ptr82.idx
  br label %for.body.i4

for.body.i4:                                      ; preds = %for.body69, %for.body.i4
  %i.0.i237 = phi i32 [ 0, %for.body69 ], [ %inc.i6, %for.body.i4 ]
  %arrayidx.i5 = getelementptr inbounds nuw i64, ptr %add.ptr71, i32 %i.0.i237
  %13 = load i64, ptr %arrayidx.i5, align 8
  %arrayidx1.i = getelementptr inbounds nuw i64, ptr %add.ptr82, i32 %i.0.i237
  %14 = load i64, ptr %arrayidx1.i, align 8
  %xor.i = xor i64 %14, %13
  store i64 %xor.i, ptr %arrayidx1.i, align 8
  %inc.i6 = add nuw nsw i32 %i.0.i237, 1
  %exitcond.i3.not = icmp eq i32 %inc.i6, 5
  br i1 %exitcond.i3.not, label %m_vec_add.exit, label %for.body.i4, !llvm.loop !15

m_vec_add.exit:                                   ; preds = %for.body.i4
  %inc84 = add nuw nsw i32 %col65.038, 1
  %exitcond5.not = icmp eq i32 %inc84, 10
  br i1 %exitcond5.not, label %for.inc87, label %for.body69, !llvm.loop !16

for.inc87:                                        ; preds = %m_vec_add.exit
  %inc86 = add i32 %P3_used.140, 1
  %inc88 = add nuw nsw i32 %j60.041, 1
  %exitcond8.not = icmp eq i32 %inc86, %10
  br i1 %exitcond8.not, label %for.cond61.for.inc90_crit_edge, label %for.cond66.preheader, !llvm.loop !17

for.cond61.for.inc90_crit_edge:                   ; preds = %for.inc87
  %split42 = phi i32 [ %inc86, %for.inc87 ]
  br label %for.inc90

for.inc90:                                        ; preds = %for.cond61.for.inc90_crit_edge
  %inc91 = add nuw nsw i32 %row55.045, 1
  %indvars.iv.next7 = add nsw i32 %indvars.iv643, -1
  %exitcond9.not = icmp eq i32 %inc91, 86
  br i1 %exitcond9.not, label %while.cond.preheader, label %for.cond61.preheader, !llvm.loop !18

while.body:                                       ; preds = %while.cond.preheader, %m_vec_multiply_bins.exit
  %i.061 = phi i32 [ 0, %while.cond.preheader ], [ %inc102, %m_vec_multiply_bins.exit ]
  %add.ptr99.idx = mul nuw nsw i32 %i.061, 640
  %add.ptr99 = getelementptr inbounds nuw i8, ptr %accumulator, i32 %add.ptr99.idx
  %add.ptr101.idx = mul nuw nsw i32 %i.061, 40
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %add.ptr99, i32 200
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %add.ptr99, i32 400
  br label %for.body.i10.i

for.body.i10.i:                                   ; preds = %while.body, %for.body.i10.i
  %i.0.i8.i46 = phi i32 [ 0, %while.body ], [ %inc.i19.i, %for.body.i10.i ]
  %arrayidx.i11.i = getelementptr inbounds nuw i64, ptr %add.ptr.i, i32 %i.0.i8.i46
  %15 = load i64, ptr %arrayidx.i11.i, align 8
  %and.i12.i = and i64 %15, 1229782938247303441
  %xor.i13.i = lshr i64 %15, 1
  %shr.i14.i = and i64 %xor.i13.i, 8608480567731124087
  %mul.i15.i = mul nuw i64 %and.i12.i, 9
  %xor2.i16.i = xor i64 %shr.i14.i, %mul.i15.i
  %arrayidx3.i17.i = getelementptr inbounds nuw i64, ptr %add.ptr1.i, i32 %i.0.i8.i46
  %16 = load i64, ptr %arrayidx3.i17.i, align 8
  %xor4.i18.i = xor i64 %16, %xor2.i16.i
  store i64 %xor4.i18.i, ptr %arrayidx3.i17.i, align 8
  %inc.i19.i = add nuw nsw i32 %i.0.i8.i46, 1
  %exitcond.i9.i.not = icmp eq i32 %inc.i19.i, 5
  br i1 %exitcond.i9.i.not, label %m_vec_mul_add_x_inv.exit20.i, label %for.body.i10.i, !llvm.loop !19

m_vec_mul_add_x_inv.exit20.i:                     ; preds = %for.body.i10.i
  %add.ptr2.i = getelementptr inbounds nuw i8, ptr %add.ptr99, i32 440
  %add.ptr3.i = getelementptr inbounds nuw i8, ptr %add.ptr99, i32 480
  br label %for.body.i107.i

for.body.i107.i:                                  ; preds = %m_vec_mul_add_x_inv.exit20.i, %for.body.i107.i
  %i.0.i105.i47 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit20.i ], [ %inc.i117.i, %for.body.i107.i ]
  %arrayidx.i108.i = getelementptr inbounds nuw i64, ptr %add.ptr2.i, i32 %i.0.i105.i47
  %17 = load i64, ptr %arrayidx.i108.i, align 8
  %xor.i109.i = shl i64 %17, 1
  %shl.i110.i = and i64 %xor.i109.i, -1229782938247303442
  %and.i111.i = lshr i64 %17, 3
  %shr.i112.i = and i64 %and.i111.i, 1229782938247303441
  %mul.i113.i = mul nuw nsw i64 %shr.i112.i, 3
  %xor2.i114.i = xor i64 %shl.i110.i, %mul.i113.i
  %arrayidx3.i115.i = getelementptr inbounds nuw i64, ptr %add.ptr3.i, i32 %i.0.i105.i47
  %18 = load i64, ptr %arrayidx3.i115.i, align 8
  %xor4.i116.i = xor i64 %18, %xor2.i114.i
  store i64 %xor4.i116.i, ptr %arrayidx3.i115.i, align 8
  %inc.i117.i = add nuw nsw i32 %i.0.i105.i47, 1
  %exitcond.i106.i.not = icmp eq i32 %inc.i117.i, 5
  br i1 %exitcond.i106.i.not, label %m_vec_mul_add_x.exit118.i, label %for.body.i107.i, !llvm.loop !20

m_vec_mul_add_x.exit118.i:                        ; preds = %for.body.i107.i
  %add.ptr4.i = getelementptr inbounds nuw i8, ptr %add.ptr99, i32 400
  %add.ptr5.i = getelementptr inbounds nuw i8, ptr %add.ptr99, i32 280
  br label %for.body.i52.i

for.body.i52.i:                                   ; preds = %m_vec_mul_add_x.exit118.i, %for.body.i52.i
  %i.0.i50.i48 = phi i32 [ 0, %m_vec_mul_add_x.exit118.i ], [ %inc.i61.i, %for.body.i52.i ]
  %arrayidx.i53.i = getelementptr inbounds nuw i64, ptr %add.ptr4.i, i32 %i.0.i50.i48
  %19 = load i64, ptr %arrayidx.i53.i, align 8
  %and.i54.i = and i64 %19, 1229782938247303441
  %xor.i55.i = lshr i64 %19, 1
  %shr.i56.i = and i64 %xor.i55.i, 8608480567731124087
  %mul.i57.i = mul nuw i64 %and.i54.i, 9
  %xor2.i58.i = xor i64 %shr.i56.i, %mul.i57.i
  %arrayidx3.i59.i = getelementptr inbounds nuw i64, ptr %add.ptr5.i, i32 %i.0.i50.i48
  %20 = load i64, ptr %arrayidx3.i59.i, align 8
  %xor4.i60.i = xor i64 %20, %xor2.i58.i
  store i64 %xor4.i60.i, ptr %arrayidx3.i59.i, align 8
  %inc.i61.i = add nuw nsw i32 %i.0.i50.i48, 1
  %exitcond.i51.i.not = icmp eq i32 %inc.i61.i, 5
  br i1 %exitcond.i51.i.not, label %m_vec_mul_add_x_inv.exit62.i, label %for.body.i52.i, !llvm.loop !21

m_vec_mul_add_x_inv.exit62.i:                     ; preds = %for.body.i52.i
  %add.ptr6.i = getelementptr inbounds nuw i8, ptr %add.ptr99, i32 480
  %add.ptr7.i = getelementptr inbounds nuw i8, ptr %add.ptr99, i32 240
  br label %for.body.i137.i

for.body.i137.i:                                  ; preds = %m_vec_mul_add_x_inv.exit62.i, %for.body.i137.i
  %i.0.i135.i49 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit62.i ], [ %inc.i147.i, %for.body.i137.i ]
  %arrayidx.i138.i = getelementptr inbounds nuw i64, ptr %add.ptr6.i, i32 %i.0.i135.i49
  %21 = load i64, ptr %arrayidx.i138.i, align 8
  %xor.i139.i = shl i64 %21, 1
  %shl.i140.i = and i64 %xor.i139.i, -1229782938247303442
  %and.i141.i = lshr i64 %21, 3
  %shr.i142.i = and i64 %and.i141.i, 1229782938247303441
  %mul.i143.i = mul nuw nsw i64 %shr.i142.i, 3
  %xor2.i144.i = xor i64 %shl.i140.i, %mul.i143.i
  %arrayidx3.i145.i = getelementptr inbounds nuw i64, ptr %add.ptr7.i, i32 %i.0.i135.i49
  %22 = load i64, ptr %arrayidx3.i145.i, align 8
  %xor4.i146.i = xor i64 %22, %xor2.i144.i
  store i64 %xor4.i146.i, ptr %arrayidx3.i145.i, align 8
  %inc.i147.i = add nuw nsw i32 %i.0.i135.i49, 1
  %exitcond.i136.i.not = icmp eq i32 %inc.i147.i, 5
  br i1 %exitcond.i136.i.not, label %m_vec_mul_add_x.exit148.i, label %for.body.i137.i, !llvm.loop !22

m_vec_mul_add_x.exit148.i:                        ; preds = %for.body.i137.i
  %add.ptr8.i = getelementptr inbounds nuw i8, ptr %add.ptr99, i32 280
  %add.ptr9.i = getelementptr inbounds nuw i8, ptr %add.ptr99, i32 560
  br label %for.body.i38.i

for.body.i38.i:                                   ; preds = %m_vec_mul_add_x.exit148.i, %for.body.i38.i
  %i.0.i36.i50 = phi i32 [ 0, %m_vec_mul_add_x.exit148.i ], [ %inc.i47.i, %for.body.i38.i ]
  %arrayidx.i39.i = getelementptr inbounds nuw i64, ptr %add.ptr8.i, i32 %i.0.i36.i50
  %23 = load i64, ptr %arrayidx.i39.i, align 8
  %and.i40.i = and i64 %23, 1229782938247303441
  %xor.i41.i = lshr i64 %23, 1
  %shr.i42.i = and i64 %xor.i41.i, 8608480567731124087
  %mul.i43.i = mul nuw i64 %and.i40.i, 9
  %xor2.i44.i = xor i64 %shr.i42.i, %mul.i43.i
  %arrayidx3.i45.i = getelementptr inbounds nuw i64, ptr %add.ptr9.i, i32 %i.0.i36.i50
  %24 = load i64, ptr %arrayidx3.i45.i, align 8
  %xor4.i46.i = xor i64 %24, %xor2.i44.i
  store i64 %xor4.i46.i, ptr %arrayidx3.i45.i, align 8
  %inc.i47.i = add nuw nsw i32 %i.0.i36.i50, 1
  %exitcond.i37.i.not = icmp eq i32 %inc.i47.i, 5
  br i1 %exitcond.i37.i.not, label %m_vec_mul_add_x_inv.exit48.i, label %for.body.i38.i, !llvm.loop !23

m_vec_mul_add_x_inv.exit48.i:                     ; preds = %for.body.i38.i
  %add.ptr10.i = getelementptr inbounds nuw i8, ptr %add.ptr99, i32 240
  %add.ptr11.i = getelementptr inbounds nuw i8, ptr %add.ptr99, i32 120
  br label %for.body.i152.i

for.body.i152.i:                                  ; preds = %m_vec_mul_add_x_inv.exit48.i, %for.body.i152.i
  %i.0.i150.i51 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit48.i ], [ %inc.i162.i, %for.body.i152.i ]
  %arrayidx.i153.i = getelementptr inbounds nuw i64, ptr %add.ptr10.i, i32 %i.0.i150.i51
  %25 = load i64, ptr %arrayidx.i153.i, align 8
  %xor.i154.i = shl i64 %25, 1
  %shl.i155.i = and i64 %xor.i154.i, -1229782938247303442
  %and.i156.i = lshr i64 %25, 3
  %shr.i157.i = and i64 %and.i156.i, 1229782938247303441
  %mul.i158.i = mul nuw nsw i64 %shr.i157.i, 3
  %xor2.i159.i = xor i64 %shl.i155.i, %mul.i158.i
  %arrayidx3.i160.i = getelementptr inbounds nuw i64, ptr %add.ptr11.i, i32 %i.0.i150.i51
  %26 = load i64, ptr %arrayidx3.i160.i, align 8
  %xor4.i161.i = xor i64 %26, %xor2.i159.i
  store i64 %xor4.i161.i, ptr %arrayidx3.i160.i, align 8
  %inc.i162.i = add nuw nsw i32 %i.0.i150.i51, 1
  %exitcond.i151.i.not = icmp eq i32 %inc.i162.i, 5
  br i1 %exitcond.i151.i.not, label %m_vec_mul_add_x.exit163.i, label %for.body.i152.i, !llvm.loop !24

m_vec_mul_add_x.exit163.i:                        ; preds = %for.body.i152.i
  %add.ptr12.i = getelementptr inbounds nuw i8, ptr %add.ptr99, i32 560
  %add.ptr13.i = getelementptr inbounds nuw i8, ptr %add.ptr99, i32 600
  br label %for.body.i24.i

for.body.i24.i:                                   ; preds = %m_vec_mul_add_x.exit163.i, %for.body.i24.i
  %i.0.i22.i52 = phi i32 [ 0, %m_vec_mul_add_x.exit163.i ], [ %inc.i33.i, %for.body.i24.i ]
  %arrayidx.i25.i = getelementptr inbounds nuw i64, ptr %add.ptr12.i, i32 %i.0.i22.i52
  %27 = load i64, ptr %arrayidx.i25.i, align 8
  %and.i26.i = and i64 %27, 1229782938247303441
  %xor.i27.i = lshr i64 %27, 1
  %shr.i28.i = and i64 %xor.i27.i, 8608480567731124087
  %mul.i29.i = mul nuw i64 %and.i26.i, 9
  %xor2.i30.i = xor i64 %shr.i28.i, %mul.i29.i
  %arrayidx3.i31.i = getelementptr inbounds nuw i64, ptr %add.ptr13.i, i32 %i.0.i22.i52
  %28 = load i64, ptr %arrayidx3.i31.i, align 8
  %xor4.i32.i = xor i64 %28, %xor2.i30.i
  store i64 %xor4.i32.i, ptr %arrayidx3.i31.i, align 8
  %inc.i33.i = add nuw nsw i32 %i.0.i22.i52, 1
  %exitcond.i23.i.not = icmp eq i32 %inc.i33.i, 5
  br i1 %exitcond.i23.i.not, label %m_vec_mul_add_x_inv.exit34.i, label %for.body.i24.i, !llvm.loop !25

m_vec_mul_add_x_inv.exit34.i:                     ; preds = %for.body.i24.i
  %add.ptr14.i = getelementptr inbounds nuw i8, ptr %add.ptr99, i32 120
  %add.ptr15.i = getelementptr inbounds nuw i8, ptr %add.ptr99, i32 320
  br label %for.body.i94.i

for.body.i94.i:                                   ; preds = %m_vec_mul_add_x_inv.exit34.i, %for.body.i94.i
  %i.0.i92.i53 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit34.i ], [ %inc.i103.i, %for.body.i94.i ]
  %arrayidx.i95.i = getelementptr inbounds nuw i64, ptr %add.ptr14.i, i32 %i.0.i92.i53
  %29 = load i64, ptr %arrayidx.i95.i, align 8
  %xor.i96.i = shl i64 %29, 1
  %shl.i.i = and i64 %xor.i96.i, -1229782938247303442
  %and.i97.i = lshr i64 %29, 3
  %shr.i98.i = and i64 %and.i97.i, 1229782938247303441
  %mul.i99.i = mul nuw nsw i64 %shr.i98.i, 3
  %xor2.i100.i = xor i64 %shl.i.i, %mul.i99.i
  %arrayidx3.i101.i = getelementptr inbounds nuw i64, ptr %add.ptr15.i, i32 %i.0.i92.i53
  %30 = load i64, ptr %arrayidx3.i101.i, align 8
  %xor4.i102.i = xor i64 %30, %xor2.i100.i
  store i64 %xor4.i102.i, ptr %arrayidx3.i101.i, align 8
  %inc.i103.i = add nuw nsw i32 %i.0.i92.i53, 1
  %exitcond.i93.i.not = icmp eq i32 %inc.i103.i, 5
  br i1 %exitcond.i93.i.not, label %m_vec_mul_add_x.exit.i, label %for.body.i94.i, !llvm.loop !26

m_vec_mul_add_x.exit.i:                           ; preds = %for.body.i94.i
  %add.ptr16.i = getelementptr inbounds nuw i8, ptr %add.ptr99, i32 600
  %add.ptr17.i = getelementptr inbounds nuw i8, ptr %add.ptr99, i32 520
  br label %for.body.i4.i

for.body.i4.i:                                    ; preds = %m_vec_mul_add_x.exit.i, %for.body.i4.i
  %i.0.i2.i54 = phi i32 [ 0, %m_vec_mul_add_x.exit.i ], [ %inc.i6.i, %for.body.i4.i ]
  %arrayidx.i5.i = getelementptr inbounds nuw i64, ptr %add.ptr16.i, i32 %i.0.i2.i54
  %31 = load i64, ptr %arrayidx.i5.i, align 8
  %and.i.i = and i64 %31, 1229782938247303441
  %xor.i.i = lshr i64 %31, 1
  %shr.i.i = and i64 %xor.i.i, 8608480567731124087
  %mul.i.i = mul nuw i64 %and.i.i, 9
  %xor2.i.i = xor i64 %shr.i.i, %mul.i.i
  %arrayidx3.i.i = getelementptr inbounds nuw i64, ptr %add.ptr17.i, i32 %i.0.i2.i54
  %32 = load i64, ptr %arrayidx3.i.i, align 8
  %xor4.i.i = xor i64 %32, %xor2.i.i
  store i64 %xor4.i.i, ptr %arrayidx3.i.i, align 8
  %inc.i6.i = add nuw nsw i32 %i.0.i2.i54, 1
  %exitcond.i3.i.not = icmp eq i32 %inc.i6.i, 5
  br i1 %exitcond.i3.i.not, label %m_vec_mul_add_x_inv.exit.i, label %for.body.i4.i, !llvm.loop !27

m_vec_mul_add_x_inv.exit.i:                       ; preds = %for.body.i4.i
  %add.ptr18.i = getelementptr inbounds nuw i8, ptr %add.ptr99, i32 320
  %add.ptr19.i = getelementptr inbounds nuw i8, ptr %add.ptr99, i32 160
  br label %for.body.i122.i

for.body.i122.i:                                  ; preds = %m_vec_mul_add_x_inv.exit.i, %for.body.i122.i
  %i.0.i120.i55 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit.i ], [ %inc.i132.i, %for.body.i122.i ]
  %arrayidx.i123.i = getelementptr inbounds nuw i64, ptr %add.ptr18.i, i32 %i.0.i120.i55
  %33 = load i64, ptr %arrayidx.i123.i, align 8
  %xor.i124.i = shl i64 %33, 1
  %shl.i125.i = and i64 %xor.i124.i, -1229782938247303442
  %and.i126.i = lshr i64 %33, 3
  %shr.i127.i = and i64 %and.i126.i, 1229782938247303441
  %mul.i128.i = mul nuw nsw i64 %shr.i127.i, 3
  %xor2.i129.i = xor i64 %shl.i125.i, %mul.i128.i
  %arrayidx3.i130.i = getelementptr inbounds nuw i64, ptr %add.ptr19.i, i32 %i.0.i120.i55
  %34 = load i64, ptr %arrayidx3.i130.i, align 8
  %xor4.i131.i = xor i64 %34, %xor2.i129.i
  store i64 %xor4.i131.i, ptr %arrayidx3.i130.i, align 8
  %inc.i132.i = add nuw nsw i32 %i.0.i120.i55, 1
  %exitcond.i121.i.not = icmp eq i32 %inc.i132.i, 5
  br i1 %exitcond.i121.i.not, label %m_vec_mul_add_x.exit133.i, label %for.body.i122.i, !llvm.loop !28

m_vec_mul_add_x.exit133.i:                        ; preds = %for.body.i122.i
  %add.ptr20.i = getelementptr inbounds nuw i8, ptr %add.ptr99, i32 520
  %add.ptr21.i = getelementptr inbounds nuw i8, ptr %add.ptr99, i32 360
  br label %for.body.i66.i

for.body.i66.i:                                   ; preds = %m_vec_mul_add_x.exit133.i, %for.body.i66.i
  %i.0.i64.i56 = phi i32 [ 0, %m_vec_mul_add_x.exit133.i ], [ %inc.i75.i, %for.body.i66.i ]
  %arrayidx.i67.i = getelementptr inbounds nuw i64, ptr %add.ptr20.i, i32 %i.0.i64.i56
  %35 = load i64, ptr %arrayidx.i67.i, align 8
  %and.i68.i = and i64 %35, 1229782938247303441
  %xor.i69.i = lshr i64 %35, 1
  %shr.i70.i = and i64 %xor.i69.i, 8608480567731124087
  %mul.i71.i = mul nuw i64 %and.i68.i, 9
  %xor2.i72.i = xor i64 %shr.i70.i, %mul.i71.i
  %arrayidx3.i73.i = getelementptr inbounds nuw i64, ptr %add.ptr21.i, i32 %i.0.i64.i56
  %36 = load i64, ptr %arrayidx3.i73.i, align 8
  %xor4.i74.i = xor i64 %36, %xor2.i72.i
  store i64 %xor4.i74.i, ptr %arrayidx3.i73.i, align 8
  %inc.i75.i = add nuw nsw i32 %i.0.i64.i56, 1
  %exitcond.i65.i.not = icmp eq i32 %inc.i75.i, 5
  br i1 %exitcond.i65.i.not, label %m_vec_mul_add_x_inv.exit76.i, label %for.body.i66.i, !llvm.loop !29

m_vec_mul_add_x_inv.exit76.i:                     ; preds = %for.body.i66.i
  %add.ptr22.i = getelementptr inbounds nuw i8, ptr %add.ptr99, i32 160
  %add.ptr23.i = getelementptr inbounds nuw i8, ptr %add.ptr99, i32 80
  br label %for.body.i182.i

for.body.i182.i:                                  ; preds = %m_vec_mul_add_x_inv.exit76.i, %for.body.i182.i
  %i.0.i180.i57 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit76.i ], [ %inc.i192.i, %for.body.i182.i ]
  %arrayidx.i183.i = getelementptr inbounds nuw i64, ptr %add.ptr22.i, i32 %i.0.i180.i57
  %37 = load i64, ptr %arrayidx.i183.i, align 8
  %xor.i184.i = shl i64 %37, 1
  %shl.i185.i = and i64 %xor.i184.i, -1229782938247303442
  %and.i186.i = lshr i64 %37, 3
  %shr.i187.i = and i64 %and.i186.i, 1229782938247303441
  %mul.i188.i = mul nuw nsw i64 %shr.i187.i, 3
  %xor2.i189.i = xor i64 %shl.i185.i, %mul.i188.i
  %arrayidx3.i190.i = getelementptr inbounds nuw i64, ptr %add.ptr23.i, i32 %i.0.i180.i57
  %38 = load i64, ptr %arrayidx3.i190.i, align 8
  %xor4.i191.i = xor i64 %38, %xor2.i189.i
  store i64 %xor4.i191.i, ptr %arrayidx3.i190.i, align 8
  %inc.i192.i = add nuw nsw i32 %i.0.i180.i57, 1
  %exitcond.i181.i.not = icmp eq i32 %inc.i192.i, 5
  br i1 %exitcond.i181.i.not, label %m_vec_mul_add_x.exit193.i, label %for.body.i182.i, !llvm.loop !30

m_vec_mul_add_x.exit193.i:                        ; preds = %for.body.i182.i
  %add.ptr24.i = getelementptr inbounds nuw i8, ptr %add.ptr99, i32 360
  %add.ptr25.i = getelementptr inbounds nuw i8, ptr %add.ptr99, i32 40
  br label %for.body.i80.i

for.body.i80.i:                                   ; preds = %m_vec_mul_add_x.exit193.i, %for.body.i80.i
  %i.0.i78.i58 = phi i32 [ 0, %m_vec_mul_add_x.exit193.i ], [ %inc.i89.i, %for.body.i80.i ]
  %arrayidx.i81.i = getelementptr inbounds nuw i64, ptr %add.ptr24.i, i32 %i.0.i78.i58
  %39 = load i64, ptr %arrayidx.i81.i, align 8
  %and.i82.i = and i64 %39, 1229782938247303441
  %xor.i83.i = lshr i64 %39, 1
  %shr.i84.i = and i64 %xor.i83.i, 8608480567731124087
  %mul.i85.i = mul nuw i64 %and.i82.i, 9
  %xor2.i86.i = xor i64 %shr.i84.i, %mul.i85.i
  %arrayidx3.i87.i = getelementptr inbounds nuw i64, ptr %add.ptr25.i, i32 %i.0.i78.i58
  %40 = load i64, ptr %arrayidx3.i87.i, align 8
  %xor4.i88.i = xor i64 %40, %xor2.i86.i
  store i64 %xor4.i88.i, ptr %arrayidx3.i87.i, align 8
  %inc.i89.i = add nuw nsw i32 %i.0.i78.i58, 1
  %exitcond.i79.i.not = icmp eq i32 %inc.i89.i, 5
  br i1 %exitcond.i79.i.not, label %m_vec_mul_add_x_inv.exit90.i, label %for.body.i80.i, !llvm.loop !31

m_vec_mul_add_x_inv.exit90.i:                     ; preds = %for.body.i80.i
  %add.ptr26.i = getelementptr inbounds nuw i8, ptr %add.ptr99, i32 80
  %add.ptr27.i = getelementptr inbounds nuw i8, ptr %add.ptr99, i32 40
  br label %for.body.i167.i

for.body.i167.i:                                  ; preds = %m_vec_mul_add_x_inv.exit90.i, %for.body.i167.i
  %i.0.i165.i59 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit90.i ], [ %inc.i177.i, %for.body.i167.i ]
  %arrayidx.i168.i = getelementptr inbounds nuw i64, ptr %add.ptr26.i, i32 %i.0.i165.i59
  %41 = load i64, ptr %arrayidx.i168.i, align 8
  %xor.i169.i = shl i64 %41, 1
  %shl.i170.i = and i64 %xor.i169.i, -1229782938247303442
  %and.i171.i = lshr i64 %41, 3
  %shr.i172.i = and i64 %and.i171.i, 1229782938247303441
  %mul.i173.i = mul nuw nsw i64 %shr.i172.i, 3
  %xor2.i174.i = xor i64 %shl.i170.i, %mul.i173.i
  %arrayidx3.i175.i = getelementptr inbounds nuw i64, ptr %add.ptr27.i, i32 %i.0.i165.i59
  %42 = load i64, ptr %arrayidx3.i175.i, align 8
  %xor4.i176.i = xor i64 %42, %xor2.i174.i
  store i64 %xor4.i176.i, ptr %arrayidx3.i175.i, align 8
  %inc.i177.i = add nuw nsw i32 %i.0.i165.i59, 1
  %exitcond.i166.i.not = icmp eq i32 %inc.i177.i, 5
  br i1 %exitcond.i166.i.not, label %m_vec_mul_add_x.exit178.i, label %for.body.i167.i, !llvm.loop !32

m_vec_mul_add_x.exit178.i:                        ; preds = %for.body.i167.i
  %add.ptr101 = getelementptr inbounds nuw i8, ptr %PS, i32 %add.ptr101.idx
  %add.ptr28.i = getelementptr inbounds nuw i8, ptr %add.ptr99, i32 40
  br label %for.body.i.i

for.body.i.i:                                     ; preds = %m_vec_mul_add_x.exit178.i, %for.body.i.i
  %i.0.i.i60 = phi i32 [ 0, %m_vec_mul_add_x.exit178.i ], [ %inc.i.i, %for.body.i.i ]
  %arrayidx.i.i = getelementptr inbounds nuw i64, ptr %add.ptr28.i, i32 %i.0.i.i60
  %43 = load i64, ptr %arrayidx.i.i, align 8
  %arrayidx1.i.i = getelementptr inbounds nuw i64, ptr %add.ptr101, i32 %i.0.i.i60
  store i64 %43, ptr %arrayidx1.i.i, align 8
  %inc.i.i = add nuw nsw i32 %i.0.i.i60, 1
  %exitcond.i.i.not = icmp eq i32 %inc.i.i, 5
  br i1 %exitcond.i.i.not, label %m_vec_multiply_bins.exit, label %for.body.i.i, !llvm.loop !33

m_vec_multiply_bins.exit:                         ; preds = %for.body.i.i
  %inc102 = add nuw nsw i32 %i.061, 1
  %exitcond10.not = icmp eq i32 %inc102, 860
  br i1 %exitcond10.not, label %while.end, label %while.body, !llvm.loop !34

while.end:                                        ; preds = %m_vec_multiply_bins.exit
  ret void
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #1 {
entry:
  %pk = alloca [18705 x i64], align 16
  call void @mayo_memset(ptr %pk, i8 0, i32 149640)
  %pk1 = alloca [18705 x i64], align 16
  call void @mayo_memset(ptr %pk1, i8 0, i32 149640)
  %pk2 = alloca [18705 x i64], align 16
  call void @mayo_memset(ptr %pk2, i8 0, i32 149640)
  %s = alloca [860 x i8], align 16
  call void @mayo_memset(ptr %s, i8 0, i32 860)
  %PS = alloca [4300 x i64], align 16
  call void @mayo_memset(ptr %PS, i8 0, i32 34400)
  call fastcc void @mayo_generic_m_calculate_PS(ptr %pk, ptr %pk1, ptr %pk2, ptr %s, i32 78, i32 78, i32 8, i32 10, ptr %PS)
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
  br label %for.cond, !llvm.loop !35

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
!29 = distinct !{!29, !6}
!30 = distinct !{!30, !6}
!31 = distinct !{!31, !6}
!32 = distinct !{!32, !6}
!33 = distinct !{!33, !6}
!34 = distinct !{!34, !6}
!35 = distinct !{!35, !6}
