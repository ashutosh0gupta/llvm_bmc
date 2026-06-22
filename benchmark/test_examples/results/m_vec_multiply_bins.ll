; ModuleID = '../mayo_IR/mayo1.ll'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

; Function Attrs: inlinehint nounwind
define dso_local fastcc void @m_vec_multiply_bins(i32 noundef %m_vec_limbs, ptr noundef nonnull %bins, ptr noundef nonnull %out) unnamed_addr #0 {
entry:
  %add.ptr = getelementptr inbounds nuw i8, ptr %bins, i32 200
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %bins, i32 400
  br label %for.body.i24

for.body.i24:                                     ; preds = %entry, %for.body.i24
  %i.0.i22194 = phi i32 [ 0, %entry ], [ %inc.i33, %for.body.i24 ]
  %arrayidx.i25 = getelementptr inbounds nuw i64, ptr %add.ptr, i32 %i.0.i22194
  %0 = load i64, ptr %arrayidx.i25, align 8
  %and.i26 = and i64 %0, 1229782938247303441
  %xor.i27 = lshr i64 %0, 1
  %shr.i28 = and i64 %xor.i27, 8608480567731124087
  %mul.i29 = mul nuw i64 %and.i26, 9
  %xor2.i30 = xor i64 %shr.i28, %mul.i29
  %arrayidx3.i31 = getelementptr inbounds nuw i64, ptr %add.ptr1, i32 %i.0.i22194
  %1 = load i64, ptr %arrayidx3.i31, align 8
  %xor4.i32 = xor i64 %1, %xor2.i30
  store i64 %xor4.i32, ptr %arrayidx3.i31, align 8
  %inc.i33 = add nuw nsw i32 %i.0.i22194, 1
  %exitcond.i23.not = icmp eq i32 %inc.i33, 5
  br i1 %exitcond.i23.not, label %m_vec_mul_add_x_inv.exit34, label %for.body.i24, !llvm.loop !5

m_vec_mul_add_x_inv.exit34:                       ; preds = %for.body.i24
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %bins, i32 440
  %add.ptr3 = getelementptr inbounds nuw i8, ptr %bins, i32 480
  br label %for.body.i182

for.body.i182:                                    ; preds = %m_vec_mul_add_x_inv.exit34, %for.body.i182
  %i.0.i180195 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit34 ], [ %inc.i192, %for.body.i182 ]
  %arrayidx.i183 = getelementptr inbounds nuw i64, ptr %add.ptr2, i32 %i.0.i180195
  %2 = load i64, ptr %arrayidx.i183, align 8
  %xor.i184 = shl i64 %2, 1
  %shl.i185 = and i64 %xor.i184, -1229782938247303442
  %and.i186 = lshr i64 %2, 3
  %shr.i187 = and i64 %and.i186, 1229782938247303441
  %mul.i188 = mul nuw nsw i64 %shr.i187, 3
  %xor2.i189 = xor i64 %shl.i185, %mul.i188
  %arrayidx3.i190 = getelementptr inbounds nuw i64, ptr %add.ptr3, i32 %i.0.i180195
  %3 = load i64, ptr %arrayidx3.i190, align 8
  %xor4.i191 = xor i64 %3, %xor2.i189
  store i64 %xor4.i191, ptr %arrayidx3.i190, align 8
  %inc.i192 = add nuw nsw i32 %i.0.i180195, 1
  %exitcond.i181.not = icmp eq i32 %inc.i192, 5
  br i1 %exitcond.i181.not, label %m_vec_mul_add_x.exit193, label %for.body.i182, !llvm.loop !7

m_vec_mul_add_x.exit193:                          ; preds = %for.body.i182
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %bins, i32 400
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %bins, i32 280
  br label %for.body.i10

for.body.i10:                                     ; preds = %m_vec_mul_add_x.exit193, %for.body.i10
  %i.0.i8196 = phi i32 [ 0, %m_vec_mul_add_x.exit193 ], [ %inc.i19, %for.body.i10 ]
  %arrayidx.i11 = getelementptr inbounds nuw i64, ptr %add.ptr4, i32 %i.0.i8196
  %4 = load i64, ptr %arrayidx.i11, align 8
  %and.i12 = and i64 %4, 1229782938247303441
  %xor.i13 = lshr i64 %4, 1
  %shr.i14 = and i64 %xor.i13, 8608480567731124087
  %mul.i15 = mul nuw i64 %and.i12, 9
  %xor2.i16 = xor i64 %shr.i14, %mul.i15
  %arrayidx3.i17 = getelementptr inbounds nuw i64, ptr %add.ptr5, i32 %i.0.i8196
  %5 = load i64, ptr %arrayidx3.i17, align 8
  %xor4.i18 = xor i64 %5, %xor2.i16
  store i64 %xor4.i18, ptr %arrayidx3.i17, align 8
  %inc.i19 = add nuw nsw i32 %i.0.i8196, 1
  %exitcond.i9.not = icmp eq i32 %inc.i19, 5
  br i1 %exitcond.i9.not, label %m_vec_mul_add_x_inv.exit20, label %for.body.i10, !llvm.loop !8

m_vec_mul_add_x_inv.exit20:                       ; preds = %for.body.i10
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %bins, i32 480
  %add.ptr7 = getelementptr inbounds nuw i8, ptr %bins, i32 240
  br label %for.body.i137

for.body.i137:                                    ; preds = %m_vec_mul_add_x_inv.exit20, %for.body.i137
  %i.0.i135197 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit20 ], [ %inc.i147, %for.body.i137 ]
  %arrayidx.i138 = getelementptr inbounds nuw i64, ptr %add.ptr6, i32 %i.0.i135197
  %6 = load i64, ptr %arrayidx.i138, align 8
  %xor.i139 = shl i64 %6, 1
  %shl.i140 = and i64 %xor.i139, -1229782938247303442
  %and.i141 = lshr i64 %6, 3
  %shr.i142 = and i64 %and.i141, 1229782938247303441
  %mul.i143 = mul nuw nsw i64 %shr.i142, 3
  %xor2.i144 = xor i64 %shl.i140, %mul.i143
  %arrayidx3.i145 = getelementptr inbounds nuw i64, ptr %add.ptr7, i32 %i.0.i135197
  %7 = load i64, ptr %arrayidx3.i145, align 8
  %xor4.i146 = xor i64 %7, %xor2.i144
  store i64 %xor4.i146, ptr %arrayidx3.i145, align 8
  %inc.i147 = add nuw nsw i32 %i.0.i135197, 1
  %exitcond.i136.not = icmp eq i32 %inc.i147, 5
  br i1 %exitcond.i136.not, label %m_vec_mul_add_x.exit148, label %for.body.i137, !llvm.loop !9

m_vec_mul_add_x.exit148:                          ; preds = %for.body.i137
  %add.ptr8 = getelementptr inbounds nuw i8, ptr %bins, i32 280
  %add.ptr9 = getelementptr inbounds nuw i8, ptr %bins, i32 560
  br label %for.body.i66

for.body.i66:                                     ; preds = %m_vec_mul_add_x.exit148, %for.body.i66
  %i.0.i64198 = phi i32 [ 0, %m_vec_mul_add_x.exit148 ], [ %inc.i75, %for.body.i66 ]
  %arrayidx.i67 = getelementptr inbounds nuw i64, ptr %add.ptr8, i32 %i.0.i64198
  %8 = load i64, ptr %arrayidx.i67, align 8
  %and.i68 = and i64 %8, 1229782938247303441
  %xor.i69 = lshr i64 %8, 1
  %shr.i70 = and i64 %xor.i69, 8608480567731124087
  %mul.i71 = mul nuw i64 %and.i68, 9
  %xor2.i72 = xor i64 %shr.i70, %mul.i71
  %arrayidx3.i73 = getelementptr inbounds nuw i64, ptr %add.ptr9, i32 %i.0.i64198
  %9 = load i64, ptr %arrayidx3.i73, align 8
  %xor4.i74 = xor i64 %9, %xor2.i72
  store i64 %xor4.i74, ptr %arrayidx3.i73, align 8
  %inc.i75 = add nuw nsw i32 %i.0.i64198, 1
  %exitcond.i65.not = icmp eq i32 %inc.i75, 5
  br i1 %exitcond.i65.not, label %m_vec_mul_add_x_inv.exit76, label %for.body.i66, !llvm.loop !10

m_vec_mul_add_x_inv.exit76:                       ; preds = %for.body.i66
  %add.ptr10 = getelementptr inbounds nuw i8, ptr %bins, i32 240
  %add.ptr11 = getelementptr inbounds nuw i8, ptr %bins, i32 120
  br label %for.body.i107

for.body.i107:                                    ; preds = %m_vec_mul_add_x_inv.exit76, %for.body.i107
  %i.0.i105199 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit76 ], [ %inc.i117, %for.body.i107 ]
  %arrayidx.i108 = getelementptr inbounds nuw i64, ptr %add.ptr10, i32 %i.0.i105199
  %10 = load i64, ptr %arrayidx.i108, align 8
  %xor.i109 = shl i64 %10, 1
  %shl.i110 = and i64 %xor.i109, -1229782938247303442
  %and.i111 = lshr i64 %10, 3
  %shr.i112 = and i64 %and.i111, 1229782938247303441
  %mul.i113 = mul nuw nsw i64 %shr.i112, 3
  %xor2.i114 = xor i64 %shl.i110, %mul.i113
  %arrayidx3.i115 = getelementptr inbounds nuw i64, ptr %add.ptr11, i32 %i.0.i105199
  %11 = load i64, ptr %arrayidx3.i115, align 8
  %xor4.i116 = xor i64 %11, %xor2.i114
  store i64 %xor4.i116, ptr %arrayidx3.i115, align 8
  %inc.i117 = add nuw nsw i32 %i.0.i105199, 1
  %exitcond.i106.not = icmp eq i32 %inc.i117, 5
  br i1 %exitcond.i106.not, label %m_vec_mul_add_x.exit118, label %for.body.i107, !llvm.loop !11

m_vec_mul_add_x.exit118:                          ; preds = %for.body.i107
  %add.ptr12 = getelementptr inbounds nuw i8, ptr %bins, i32 560
  %add.ptr13 = getelementptr inbounds nuw i8, ptr %bins, i32 600
  br label %for.body.i4

for.body.i4:                                      ; preds = %m_vec_mul_add_x.exit118, %for.body.i4
  %i.0.i2200 = phi i32 [ 0, %m_vec_mul_add_x.exit118 ], [ %inc.i6, %for.body.i4 ]
  %arrayidx.i5 = getelementptr inbounds nuw i64, ptr %add.ptr12, i32 %i.0.i2200
  %12 = load i64, ptr %arrayidx.i5, align 8
  %and.i = and i64 %12, 1229782938247303441
  %xor.i = lshr i64 %12, 1
  %shr.i = and i64 %xor.i, 8608480567731124087
  %mul.i = mul nuw i64 %and.i, 9
  %xor2.i = xor i64 %shr.i, %mul.i
  %arrayidx3.i = getelementptr inbounds nuw i64, ptr %add.ptr13, i32 %i.0.i2200
  %13 = load i64, ptr %arrayidx3.i, align 8
  %xor4.i = xor i64 %13, %xor2.i
  store i64 %xor4.i, ptr %arrayidx3.i, align 8
  %inc.i6 = add nuw nsw i32 %i.0.i2200, 1
  %exitcond.i3.not = icmp eq i32 %inc.i6, 5
  br i1 %exitcond.i3.not, label %m_vec_mul_add_x_inv.exit, label %for.body.i4, !llvm.loop !12

m_vec_mul_add_x_inv.exit:                         ; preds = %for.body.i4
  %add.ptr14 = getelementptr inbounds nuw i8, ptr %bins, i32 120
  %add.ptr15 = getelementptr inbounds nuw i8, ptr %bins, i32 320
  br label %for.body.i167

for.body.i167:                                    ; preds = %m_vec_mul_add_x_inv.exit, %for.body.i167
  %i.0.i165201 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit ], [ %inc.i177, %for.body.i167 ]
  %arrayidx.i168 = getelementptr inbounds nuw i64, ptr %add.ptr14, i32 %i.0.i165201
  %14 = load i64, ptr %arrayidx.i168, align 8
  %xor.i169 = shl i64 %14, 1
  %shl.i170 = and i64 %xor.i169, -1229782938247303442
  %and.i171 = lshr i64 %14, 3
  %shr.i172 = and i64 %and.i171, 1229782938247303441
  %mul.i173 = mul nuw nsw i64 %shr.i172, 3
  %xor2.i174 = xor i64 %shl.i170, %mul.i173
  %arrayidx3.i175 = getelementptr inbounds nuw i64, ptr %add.ptr15, i32 %i.0.i165201
  %15 = load i64, ptr %arrayidx3.i175, align 8
  %xor4.i176 = xor i64 %15, %xor2.i174
  store i64 %xor4.i176, ptr %arrayidx3.i175, align 8
  %inc.i177 = add nuw nsw i32 %i.0.i165201, 1
  %exitcond.i166.not = icmp eq i32 %inc.i177, 5
  br i1 %exitcond.i166.not, label %m_vec_mul_add_x.exit178, label %for.body.i167, !llvm.loop !13

m_vec_mul_add_x.exit178:                          ; preds = %for.body.i167
  %add.ptr16 = getelementptr inbounds nuw i8, ptr %bins, i32 600
  %add.ptr17 = getelementptr inbounds nuw i8, ptr %bins, i32 520
  br label %for.body.i80

for.body.i80:                                     ; preds = %m_vec_mul_add_x.exit178, %for.body.i80
  %i.0.i78202 = phi i32 [ 0, %m_vec_mul_add_x.exit178 ], [ %inc.i89, %for.body.i80 ]
  %arrayidx.i81 = getelementptr inbounds nuw i64, ptr %add.ptr16, i32 %i.0.i78202
  %16 = load i64, ptr %arrayidx.i81, align 8
  %and.i82 = and i64 %16, 1229782938247303441
  %xor.i83 = lshr i64 %16, 1
  %shr.i84 = and i64 %xor.i83, 8608480567731124087
  %mul.i85 = mul nuw i64 %and.i82, 9
  %xor2.i86 = xor i64 %shr.i84, %mul.i85
  %arrayidx3.i87 = getelementptr inbounds nuw i64, ptr %add.ptr17, i32 %i.0.i78202
  %17 = load i64, ptr %arrayidx3.i87, align 8
  %xor4.i88 = xor i64 %17, %xor2.i86
  store i64 %xor4.i88, ptr %arrayidx3.i87, align 8
  %inc.i89 = add nuw nsw i32 %i.0.i78202, 1
  %exitcond.i79.not = icmp eq i32 %inc.i89, 5
  br i1 %exitcond.i79.not, label %m_vec_mul_add_x_inv.exit90, label %for.body.i80, !llvm.loop !14

m_vec_mul_add_x_inv.exit90:                       ; preds = %for.body.i80
  %add.ptr18 = getelementptr inbounds nuw i8, ptr %bins, i32 320
  %add.ptr19 = getelementptr inbounds nuw i8, ptr %bins, i32 160
  br label %for.body.i152

for.body.i152:                                    ; preds = %m_vec_mul_add_x_inv.exit90, %for.body.i152
  %i.0.i150203 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit90 ], [ %inc.i162, %for.body.i152 ]
  %arrayidx.i153 = getelementptr inbounds nuw i64, ptr %add.ptr18, i32 %i.0.i150203
  %18 = load i64, ptr %arrayidx.i153, align 8
  %xor.i154 = shl i64 %18, 1
  %shl.i155 = and i64 %xor.i154, -1229782938247303442
  %and.i156 = lshr i64 %18, 3
  %shr.i157 = and i64 %and.i156, 1229782938247303441
  %mul.i158 = mul nuw nsw i64 %shr.i157, 3
  %xor2.i159 = xor i64 %shl.i155, %mul.i158
  %arrayidx3.i160 = getelementptr inbounds nuw i64, ptr %add.ptr19, i32 %i.0.i150203
  %19 = load i64, ptr %arrayidx3.i160, align 8
  %xor4.i161 = xor i64 %19, %xor2.i159
  store i64 %xor4.i161, ptr %arrayidx3.i160, align 8
  %inc.i162 = add nuw nsw i32 %i.0.i150203, 1
  %exitcond.i151.not = icmp eq i32 %inc.i162, 5
  br i1 %exitcond.i151.not, label %m_vec_mul_add_x.exit163, label %for.body.i152, !llvm.loop !15

m_vec_mul_add_x.exit163:                          ; preds = %for.body.i152
  %add.ptr20 = getelementptr inbounds nuw i8, ptr %bins, i32 520
  %add.ptr21 = getelementptr inbounds nuw i8, ptr %bins, i32 360
  br label %for.body.i52

for.body.i52:                                     ; preds = %m_vec_mul_add_x.exit163, %for.body.i52
  %i.0.i50204 = phi i32 [ 0, %m_vec_mul_add_x.exit163 ], [ %inc.i61, %for.body.i52 ]
  %arrayidx.i53 = getelementptr inbounds nuw i64, ptr %add.ptr20, i32 %i.0.i50204
  %20 = load i64, ptr %arrayidx.i53, align 8
  %and.i54 = and i64 %20, 1229782938247303441
  %xor.i55 = lshr i64 %20, 1
  %shr.i56 = and i64 %xor.i55, 8608480567731124087
  %mul.i57 = mul nuw i64 %and.i54, 9
  %xor2.i58 = xor i64 %shr.i56, %mul.i57
  %arrayidx3.i59 = getelementptr inbounds nuw i64, ptr %add.ptr21, i32 %i.0.i50204
  %21 = load i64, ptr %arrayidx3.i59, align 8
  %xor4.i60 = xor i64 %21, %xor2.i58
  store i64 %xor4.i60, ptr %arrayidx3.i59, align 8
  %inc.i61 = add nuw nsw i32 %i.0.i50204, 1
  %exitcond.i51.not = icmp eq i32 %inc.i61, 5
  br i1 %exitcond.i51.not, label %m_vec_mul_add_x_inv.exit62, label %for.body.i52, !llvm.loop !16

m_vec_mul_add_x_inv.exit62:                       ; preds = %for.body.i52
  %add.ptr22 = getelementptr inbounds nuw i8, ptr %bins, i32 160
  %add.ptr23 = getelementptr inbounds nuw i8, ptr %bins, i32 80
  br label %for.body.i94

for.body.i94:                                     ; preds = %m_vec_mul_add_x_inv.exit62, %for.body.i94
  %i.0.i92205 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit62 ], [ %inc.i103, %for.body.i94 ]
  %arrayidx.i95 = getelementptr inbounds nuw i64, ptr %add.ptr22, i32 %i.0.i92205
  %22 = load i64, ptr %arrayidx.i95, align 8
  %xor.i96 = shl i64 %22, 1
  %shl.i = and i64 %xor.i96, -1229782938247303442
  %and.i97 = lshr i64 %22, 3
  %shr.i98 = and i64 %and.i97, 1229782938247303441
  %mul.i99 = mul nuw nsw i64 %shr.i98, 3
  %xor2.i100 = xor i64 %shl.i, %mul.i99
  %arrayidx3.i101 = getelementptr inbounds nuw i64, ptr %add.ptr23, i32 %i.0.i92205
  %23 = load i64, ptr %arrayidx3.i101, align 8
  %xor4.i102 = xor i64 %23, %xor2.i100
  store i64 %xor4.i102, ptr %arrayidx3.i101, align 8
  %inc.i103 = add nuw nsw i32 %i.0.i92205, 1
  %exitcond.i93.not = icmp eq i32 %inc.i103, 5
  br i1 %exitcond.i93.not, label %m_vec_mul_add_x.exit, label %for.body.i94, !llvm.loop !17

m_vec_mul_add_x.exit:                             ; preds = %for.body.i94
  %add.ptr24 = getelementptr inbounds nuw i8, ptr %bins, i32 360
  %add.ptr25 = getelementptr inbounds nuw i8, ptr %bins, i32 40
  br label %for.body.i38

for.body.i38:                                     ; preds = %m_vec_mul_add_x.exit, %for.body.i38
  %i.0.i36206 = phi i32 [ 0, %m_vec_mul_add_x.exit ], [ %inc.i47, %for.body.i38 ]
  %arrayidx.i39 = getelementptr inbounds nuw i64, ptr %add.ptr24, i32 %i.0.i36206
  %24 = load i64, ptr %arrayidx.i39, align 8
  %and.i40 = and i64 %24, 1229782938247303441
  %xor.i41 = lshr i64 %24, 1
  %shr.i42 = and i64 %xor.i41, 8608480567731124087
  %mul.i43 = mul nuw i64 %and.i40, 9
  %xor2.i44 = xor i64 %shr.i42, %mul.i43
  %arrayidx3.i45 = getelementptr inbounds nuw i64, ptr %add.ptr25, i32 %i.0.i36206
  %25 = load i64, ptr %arrayidx3.i45, align 8
  %xor4.i46 = xor i64 %25, %xor2.i44
  store i64 %xor4.i46, ptr %arrayidx3.i45, align 8
  %inc.i47 = add nuw nsw i32 %i.0.i36206, 1
  %exitcond.i37.not = icmp eq i32 %inc.i47, 5
  br i1 %exitcond.i37.not, label %m_vec_mul_add_x_inv.exit48, label %for.body.i38, !llvm.loop !18

m_vec_mul_add_x_inv.exit48:                       ; preds = %for.body.i38
  %add.ptr26 = getelementptr inbounds nuw i8, ptr %bins, i32 80
  %add.ptr27 = getelementptr inbounds nuw i8, ptr %bins, i32 40
  br label %for.body.i122

for.body.i122:                                    ; preds = %m_vec_mul_add_x_inv.exit48, %for.body.i122
  %i.0.i120207 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit48 ], [ %inc.i132, %for.body.i122 ]
  %arrayidx.i123 = getelementptr inbounds nuw i64, ptr %add.ptr26, i32 %i.0.i120207
  %26 = load i64, ptr %arrayidx.i123, align 8
  %xor.i124 = shl i64 %26, 1
  %shl.i125 = and i64 %xor.i124, -1229782938247303442
  %and.i126 = lshr i64 %26, 3
  %shr.i127 = and i64 %and.i126, 1229782938247303441
  %mul.i128 = mul nuw nsw i64 %shr.i127, 3
  %xor2.i129 = xor i64 %shl.i125, %mul.i128
  %arrayidx3.i130 = getelementptr inbounds nuw i64, ptr %add.ptr27, i32 %i.0.i120207
  %27 = load i64, ptr %arrayidx3.i130, align 8
  %xor4.i131 = xor i64 %27, %xor2.i129
  store i64 %xor4.i131, ptr %arrayidx3.i130, align 8
  %inc.i132 = add nuw nsw i32 %i.0.i120207, 1
  %exitcond.i121.not = icmp eq i32 %inc.i132, 5
  br i1 %exitcond.i121.not, label %m_vec_mul_add_x.exit133, label %for.body.i122, !llvm.loop !19

m_vec_mul_add_x.exit133:                          ; preds = %for.body.i122
  %add.ptr28 = getelementptr inbounds nuw i8, ptr %bins, i32 40
  br label %for.body.i

for.body.i:                                       ; preds = %m_vec_mul_add_x.exit133, %for.body.i
  %i.0.i208 = phi i32 [ 0, %m_vec_mul_add_x.exit133 ], [ %inc.i, %for.body.i ]
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %add.ptr28, i32 %i.0.i208
  %28 = load i64, ptr %arrayidx.i, align 8
  %arrayidx1.i = getelementptr inbounds nuw i64, ptr %out, i32 %i.0.i208
  store i64 %28, ptr %arrayidx1.i, align 8
  %inc.i = add nuw nsw i32 %i.0.i208, 1
  %exitcond.i.not = icmp eq i32 %inc.i, 5
  br i1 %exitcond.i.not, label %m_vec_copy.exit, label %for.body.i, !llvm.loop !20

m_vec_copy.exit:                                  ; preds = %for.body.i
  ret void
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #1 {
entry:
  %accumulator = alloca [68800 x i64], align 16
  call void @mayo_memset(ptr %accumulator, i8 0, i32 550400)
  %PS = alloca [4300 x i64], align 16
  call void @mayo_memset(ptr %PS, i8 0, i32 34400)
  call fastcc void @m_vec_multiply_bins(i32 5, ptr %accumulator, ptr %PS)
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
  br label %for.cond, !llvm.loop !21

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
  br label %for.cond, !llvm.loop !22

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
