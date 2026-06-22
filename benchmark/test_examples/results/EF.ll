; ModuleID = '../mayo_IR/mayo1.ll'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

@pqmayo_MAYO_1_ref_uint64_t_blocker = dso_local global i64 0, align 8
@pqmayo_MAYO_1_ref_unsigned_char_blocker = dso_local global i8 0, align 1
@mayo_secure_clear.memset_func = internal global ptr @memset, align 4

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

declare dso_local ptr @memset(ptr noundef, i32 noundef, i32 noundef) #1

; Function Attrs: inlinehint nounwind
define dso_local fastcc void @EF(ptr noundef %A, i32 noundef %nrows, i32 noundef range(i32 -2147483647, -2147483648) %ncols) unnamed_addr #0 {
entry:
  %_pivot_row = alloca [6 x i64], align 32
  %_pivot_row2 = alloca [6 x i64], align 32
  %packed_A = alloca [468 x i64], align 32
  %temp = alloca [96 x i8], align 1
  br label %for.body.i

for.body.i:                                       ; preds = %entry, %for.body.i
  %i.0.i129 = phi i32 [ 0, %entry ], [ %inc.i, %for.body.i ]
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %packed_A, i32 %i.0.i129
  store i8 0, ptr %arrayidx.i, align 1
  %inc.i = add nuw nsw i32 %i.0.i129, 1
  %exitcond.i.not = icmp eq i32 %inc.i, 3744
  br i1 %exitcond.i.not, label %mayo_memset.exit, label %for.body.i, !llvm.loop !7

mayo_memset.exit:                                 ; preds = %for.body.i
  %add = add nsw i32 %ncols, 15
  %div = sdiv i32 %add, 16
  %0 = call i32 @llvm.smax.i32(i32 %nrows, i32 0)
  %exitcond.not132 = icmp eq i32 0, %0
  br i1 %exitcond.not132, label %for.cond3.preheader, label %for.body.lr.ph

for.body.lr.ph:                                   ; preds = %mayo_memset.exit
  br label %for.body

for.cond.for.cond3.preheader_crit_edge:           ; preds = %ef_pack_m_vec.exit
  br label %for.cond3.preheader

for.cond3.preheader:                              ; preds = %for.cond.for.cond3.preheader_crit_edge, %mayo_memset.exit
  %1 = call i32 @llvm.smax.i32(i32 %div, i32 0)
  %2 = call i32 @llvm.smax.i32(i32 %ncols, i32 0)
  %exitcond6.not153 = icmp eq i32 0, %2
  br i1 %exitcond6.not153, label %for.cond121.preheader, label %for.body5.lr.ph

for.body5.lr.ph:                                  ; preds = %for.cond3.preheader
  br label %for.body5

for.body:                                         ; preds = %for.body.lr.ph, %ef_pack_m_vec.exit
  %i.0133 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %ef_pack_m_vec.exit ]
  %mul = mul nsw i32 %i.0133, %ncols
  %add.ptr = getelementptr inbounds i8, ptr %A, i32 %mul
  %mul1 = mul nsw i32 %i.0133, %div
  %add.ptr2 = getelementptr inbounds i64, ptr %packed_A, i32 %mul1
  %cmp.i68130 = icmp slt i32 1, %ncols
  br i1 %cmp.i68130, label %for.body.i69.lr.ph, label %for.end.i

for.body.i69.lr.ph:                               ; preds = %for.body
  br label %for.body.i69

for.body.i69:                                     ; preds = %for.body.i69.lr.ph, %for.body.i69
  %i.0.i66131 = phi i32 [ 0, %for.body.i69.lr.ph ], [ %add8.i73, %for.body.i69 ]
  %arrayidx.i70 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %i.0.i66131
  %3 = load i8, ptr %arrayidx.i70, align 1
  %add2.i = or disjoint i32 %i.0.i66131, 1
  %arrayidx3.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %add2.i
  %4 = load i8, ptr %arrayidx3.i, align 1
  %shl5.i = shl i8 %4, 4
  %or.i = or i8 %shl5.i, %3
  %div.i71 = lshr exact i32 %i.0.i66131, 1
  %arrayidx7.i72 = getelementptr inbounds nuw i8, ptr %add.ptr2, i32 %div.i71
  store i8 %or.i, ptr %arrayidx7.i72, align 1
  %add8.i73 = add nuw nsw i32 %i.0.i66131, 2
  %add.i67 = or disjoint i32 %add8.i73, 1
  %cmp.i68 = icmp slt i32 %add.i67, %ncols
  br i1 %cmp.i68, label %for.body.i69, label %for.cond.i65.for.end.i_crit_edge, !llvm.loop !8

for.cond.i65.for.end.i_crit_edge:                 ; preds = %for.body.i69
  %split = phi i32 [ %add8.i73, %for.body.i69 ]
  br label %for.end.i

for.end.i:                                        ; preds = %for.cond.i65.for.end.i_crit_edge, %for.body
  %i.0.i66.lcssa = phi i32 [ %split, %for.cond.i65.for.end.i_crit_edge ], [ 0, %for.body ]
  %5 = and i32 %ncols, -2147483647
  %cmp9.i = icmp eq i32 %5, 1
  br i1 %cmp9.i, label %if.then.i, label %ef_pack_m_vec.exit

if.then.i:                                        ; preds = %for.end.i
  %arrayidx12.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %i.0.i66.lcssa
  %6 = load i8, ptr %arrayidx12.i, align 1
  %div16.i = lshr exact i32 %i.0.i66.lcssa, 1
  %arrayidx17.i = getelementptr inbounds nuw i8, ptr %add.ptr2, i32 %div16.i
  store i8 %6, ptr %arrayidx17.i, align 1
  br label %ef_pack_m_vec.exit

ef_pack_m_vec.exit:                               ; preds = %for.end.i, %if.then.i
  %inc = add nuw nsw i32 %i.0133, 1
  %exitcond.not = icmp eq i32 %inc, %0
  br i1 %exitcond.not, label %for.cond.for.cond3.preheader_crit_edge, label %for.body, !llvm.loop !9

for.cond3.for.cond121.preheader_crit_edge:        ; preds = %for.inc117
  br label %for.cond121.preheader

for.cond121.preheader:                            ; preds = %for.cond3.for.cond121.preheader_crit_edge, %for.cond3.preheader
  %exitcond8.not160 = icmp eq i32 0, %0
  br i1 %exitcond8.not160, label %for.end143, label %for.body124.lr.ph

for.body124.lr.ph:                                ; preds = %for.cond121.preheader
  br label %for.body124

for.body5:                                        ; preds = %for.body5.lr.ph, %for.inc117
  %pivot_row.0155 = phi i32 [ 0, %for.body5.lr.ph ], [ %conv116, %for.inc117 ]
  %pivot_col.0154 = phi i32 [ 0, %for.body5.lr.ph ], [ %inc118, %for.inc117 ]
  %add6 = add nsw i32 %pivot_col.0154, %nrows
  %cmp7 = icmp slt i32 %add6, %ncols
  %add8 = add nsw i32 %pivot_col.0154, %nrows
  %sub9 = sub nsw i32 %add8, %ncols
  %cond = select i1 %cmp7, i32 0, i32 %sub9
  %sub13 = add nsw i32 %nrows, -1
  %exitcond2.not134 = icmp eq i32 0, %1
  br i1 %exitcond2.not134, label %for.cond25.preheader, label %for.body20.lr.ph

for.body20.lr.ph:                                 ; preds = %for.body5
  br label %for.body20

for.cond18.for.cond25.preheader_crit_edge:        ; preds = %for.body20
  br label %for.cond25.preheader

for.cond25.preheader:                             ; preds = %for.cond18.for.cond25.preheader_crit_edge, %for.body5
  %cmp11.not = icmp sgt i32 %nrows, %pivot_col.0154
  %cond16 = select i1 %cmp11.not, i32 %pivot_col.0154, i32 %sub13
  %add27 = add nsw i32 %cond16, 32
  %cmp28.not = icmp sgt i32 %nrows, %add27
  %sub30 = add nsw i32 %nrows, -1
  %add32 = add nsw i32 %cond16, 32
  %cond34 = select i1 %cmp28.not, i32 %add32, i32 %sub30
  %cmp35.not138 = icmp sgt i32 %cond, %cond34
  br i1 %cmp35.not138, label %for.end55, label %for.body36.lr.ph

for.body36.lr.ph:                                 ; preds = %for.cond25.preheader
  br label %for.body36

for.body20:                                       ; preds = %for.body20.lr.ph, %for.body20
  %i17.0135 = phi i32 [ 0, %for.body20.lr.ph ], [ %inc23, %for.body20 ]
  %arrayidx = getelementptr inbounds nuw [6 x i64], ptr %_pivot_row, i32 0, i32 %i17.0135
  store i64 0, ptr %arrayidx, align 8
  %arrayidx21 = getelementptr inbounds nuw [6 x i64], ptr %_pivot_row2, i32 0, i32 %i17.0135
  store i64 0, ptr %arrayidx21, align 8
  %inc23 = add nuw nsw i32 %i17.0135, 1
  %exitcond2.not = icmp eq i32 %inc23, %1
  br i1 %exitcond2.not, label %for.cond18.for.cond25.preheader_crit_edge, label %for.body20, !llvm.loop !10

for.body36:                                       ; preds = %for.body36.lr.ph, %for.end48
  %row.0140 = phi i32 [ %cond, %for.body36.lr.ph ], [ %inc54, %for.end48 ]
  %pivot_is_zero.0139 = phi i64 [ -1, %for.body36.lr.ph ], [ %not52, %for.end48 ]
  %xor.i7 = xor i32 %row.0140, %pivot_row.0155
  %7 = load volatile i64, ptr @pqmayo_MAYO_1_ref_uint64_t_blocker, align 8
  %8 = icmp slt i32 %xor.i7, 1
  %9 = sext i1 %8 to i64
  %not = xor i64 %7, %9
  %10 = icmp slt i32 %pivot_row.0155, %row.0140
  %shr.i = sext i1 %10 to i64
  %11 = load volatile i64, ptr @pqmayo_MAYO_1_ref_uint64_t_blocker, align 8
  %xor.i = xor i64 %11, %shr.i
  %exitcond3.not136 = icmp eq i32 0, %1
  br i1 %exitcond3.not136, label %for.end48, label %for.body40.lr.ph

for.body40.lr.ph:                                 ; preds = %for.body36
  br label %for.body40

for.body40:                                       ; preds = %for.body40.lr.ph, %for.body40
  %j.0137 = phi i32 [ 0, %for.body40.lr.ph ], [ %inc47, %for.body40 ]
  %and = and i64 %xor.i, %pivot_is_zero.0139
  %or = or i64 %and, %not
  %mul41 = mul nsw i32 %row.0140, %div
  %add42 = add nsw i32 %mul41, %j.0137
  %arrayidx43 = getelementptr inbounds [468 x i64], ptr %packed_A, i32 0, i32 %add42
  %12 = load i64, ptr %arrayidx43, align 8
  %and44 = and i64 %or, %12
  %arrayidx45 = getelementptr inbounds nuw [6 x i64], ptr %_pivot_row, i32 0, i32 %j.0137
  %13 = load i64, ptr %arrayidx45, align 8
  %xor = xor i64 %13, %and44
  store i64 %xor, ptr %arrayidx45, align 8
  %inc47 = add nuw nsw i32 %j.0137, 1
  %exitcond3.not = icmp eq i32 %inc47, %1
  br i1 %exitcond3.not, label %for.cond38.for.end48_crit_edge, label %for.body40, !llvm.loop !11

for.cond38.for.end48_crit_edge:                   ; preds = %for.body40
  br label %for.end48

for.end48:                                        ; preds = %for.cond38.for.end48_crit_edge, %for.body36
  %div.i.udiv = udiv i32 %pivot_col.0154, 16
  %rem.i.urem = urem i32 %pivot_col.0154, 16
  %arrayidx.i13 = getelementptr inbounds nuw i64, ptr %_pivot_row, i32 %div.i.udiv
  %14 = load i64, ptr %arrayidx.i13, align 8
  %mul.i = shl nuw nsw i32 %rem.i.urem, 2
  %sh_prom.i = zext nneg i32 %mul.i to i64
  %shr.i14 = lshr i64 %14, %sh_prom.i
  %15 = trunc i64 %shr.i14 to i8
  %conv.i = and i8 %15, 15
  %16 = load volatile i64, ptr @pqmayo_MAYO_1_ref_uint64_t_blocker, align 8
  %17 = icmp eq i8 %conv.i, 0
  %18 = sext i1 %17 to i64
  %not52 = xor i64 %16, %18
  %inc54 = add nsw i32 %row.0140, 1
  %cmp35.not = icmp sgt i32 %inc54, %cond34
  br i1 %cmp35.not, label %for.cond25.for.end55_crit_edge, label %for.body36, !llvm.loop !12

for.cond25.for.end55_crit_edge:                   ; preds = %for.end48
  %split141 = phi i64 [ %not52, %for.end48 ]
  %split142 = phi i8 [ %conv.i, %for.end48 ]
  br label %for.end55

for.end55:                                        ; preds = %for.cond25.for.end55_crit_edge, %for.cond25.preheader
  %pivot_is_zero.0.lcssa = phi i64 [ %split141, %for.cond25.for.end55_crit_edge ], [ -1, %for.cond25.preheader ]
  %pivot.0.lcssa = phi i8 [ %split142, %for.cond25.for.end55_crit_edge ], [ 0, %for.cond25.preheader ]
  %19 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1
  %xor1.i50 = xor i8 %pivot.0.lcssa, %19
  %20 = trunc i8 %xor1.i50 to i1
  %21 = and i8 %xor1.i50, 2
  %mul9.i51 = mul nuw nsw i8 %21, %pivot.0.lcssa
  %conv10.i52 = select i1 %20, i8 %pivot.0.lcssa, i8 0
  %xor11.i53 = xor i8 %conv10.i52, %mul9.i51
  %22 = and i8 %xor1.i50, 4
  %mul16.i54 = mul nuw nsw i8 %22, %pivot.0.lcssa
  %xor18.i55 = xor i8 %mul16.i54, %xor11.i53
  %23 = and i8 %xor1.i50, 8
  %mul23.i56 = mul nuw nsw i8 %23, %pivot.0.lcssa
  %xor25.i57 = xor i8 %mul23.i56, %xor18.i55
  %24 = lshr i8 %xor25.i57, 4
  %25 = lshr i8 %xor25.i57, 3
  %26 = and i8 %25, 14
  %27 = xor i8 %24, %26
  %xor25.masked.i58 = and i8 %xor25.i57, 15
  %28 = xor i8 %27, %xor25.masked.i58
  %29 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1
  %xor1.i22 = xor i8 %28, %29
  %30 = trunc i8 %xor1.i22 to i1
  %31 = and i8 %xor1.i22, 2
  %mul9.i = mul nuw nsw i8 %31, %28
  %conv10.i = select i1 %30, i8 %28, i8 0
  %xor11.i = xor i8 %conv10.i, %mul9.i
  %32 = and i8 %xor1.i22, 4
  %mul16.i = mul nuw nsw i8 %32, %28
  %xor18.i = xor i8 %mul16.i, %xor11.i
  %33 = and i8 %xor1.i22, 8
  %mul23.i = mul nuw nsw i8 %33, %28
  %xor25.i = xor i8 %mul23.i, %xor18.i
  %34 = lshr i8 %xor25.i, 4
  %35 = lshr i8 %xor25.i, 3
  %36 = and i8 %35, 14
  %37 = xor i8 %34, %36
  %xor25.masked.i = and i8 %xor25.i, 15
  %38 = xor i8 %37, %xor25.masked.i
  %39 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1
  %xor1.i32 = xor i8 %38, %39
  %40 = trunc i8 %xor1.i32 to i1
  %41 = and i8 %xor1.i32, 2
  %mul9.i33 = mul nuw nsw i8 %41, %38
  %conv10.i34 = select i1 %40, i8 %38, i8 0
  %xor11.i35 = xor i8 %conv10.i34, %mul9.i33
  %42 = and i8 %xor1.i32, 4
  %mul16.i36 = mul nuw nsw i8 %42, %38
  %xor18.i37 = xor i8 %mul16.i36, %xor11.i35
  %43 = and i8 %xor1.i32, 8
  %mul23.i38 = mul nuw nsw i8 %43, %38
  %xor25.i39 = xor i8 %mul23.i38, %xor18.i37
  %44 = lshr i8 %xor25.i39, 4
  %45 = lshr i8 %xor25.i39, 3
  %46 = and i8 %45, 14
  %47 = xor i8 %44, %46
  %xor25.masked.i40 = and i8 %xor25.i39, 15
  %48 = xor i8 %47, %xor25.masked.i40
  %49 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1
  %xor1.i23 = xor i8 %28, %49
  %50 = trunc i8 %xor1.i23 to i1
  %51 = and i8 %xor1.i23, 2
  %mul9.i24 = mul nuw nsw i8 %51, %38
  %conv10.i25 = select i1 %50, i8 %38, i8 0
  %xor11.i26 = xor i8 %conv10.i25, %mul9.i24
  %52 = and i8 %xor1.i23, 4
  %mul16.i27 = mul nuw nsw i8 %52, %38
  %xor18.i28 = xor i8 %mul16.i27, %xor11.i26
  %53 = and i8 %xor1.i23, 8
  %mul23.i29 = mul nuw nsw i8 %53, %38
  %xor25.i30 = xor i8 %mul23.i29, %xor18.i28
  %54 = lshr i8 %xor25.i30, 4
  %55 = lshr i8 %xor25.i30, 3
  %56 = and i8 %55, 14
  %57 = xor i8 %54, %56
  %xor25.masked.i31 = and i8 %xor25.i30, 15
  %58 = xor i8 %57, %xor25.masked.i31
  %59 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1
  %xor1.i41 = xor i8 %48, %59
  %60 = trunc i8 %xor1.i41 to i1
  %61 = and i8 %xor1.i41, 2
  %mul9.i42 = mul nuw nsw i8 %61, %58
  %conv10.i43 = select i1 %60, i8 %58, i8 0
  %xor11.i44 = xor i8 %conv10.i43, %mul9.i42
  %62 = and i8 %xor1.i41, 4
  %mul16.i45 = mul nuw nsw i8 %62, %58
  %xor18.i46 = xor i8 %mul16.i45, %xor11.i44
  %63 = and i8 %xor1.i41, 8
  %mul23.i47 = mul nuw nsw i8 %63, %58
  %xor25.i48 = xor i8 %mul23.i47, %xor18.i46
  %64 = lshr i8 %xor25.i48, 4
  %65 = lshr i8 %xor25.i48, 3
  %66 = and i8 %65, 14
  %67 = xor i8 %64, %66
  %xor25.masked.i49 = and i8 %xor25.i48, 15
  %68 = xor i8 %67, %xor25.masked.i49
  %conv.i.i86 = zext nneg i8 %68 to i32
  %mul.i.i87 = mul nuw nsw i32 %conv.i.i86, 134480385
  %and.i.i88 = and i32 %mul.i.i87, 1894838512
  %shr.i.i89 = lshr exact i32 %and.i.i88, 4
  %shr1.i.i90 = lshr exact i32 %and.i.i88, 3
  %69 = xor i32 %shr.i.i89, %shr1.i.i90
  %xor2.i.i91 = xor i32 %69, %mul.i.i87
  %70 = call i32 @llvm.smax.i32(i32 %div, i32 0)
  %exitcond.i94.not143 = icmp eq i32 0, %70
  br i1 %exitcond.i94.not143, label %for.cond60.preheader, label %for.body.i96.lr.ph

for.body.i96.lr.ph:                               ; preds = %for.end55
  br label %for.body.i96

for.cond.i92.for.cond60.preheader_crit_edge:      ; preds = %for.body.i96
  br label %for.cond60.preheader

for.cond60.preheader:                             ; preds = %for.cond.i92.for.cond60.preheader_crit_edge, %for.end55
  %cmp61.not147 = icmp sgt i32 %cond, %cond16
  br i1 %cmp61.not147, label %for.cond90.preheader, label %for.body63.lr.ph

for.body63.lr.ph:                                 ; preds = %for.cond60.preheader
  br label %for.body63

for.body.i96:                                     ; preds = %for.body.i96.lr.ph, %for.body.i96
  %i.0.i93144 = phi i32 [ 0, %for.body.i96.lr.ph ], [ %inc.i127, %for.body.i96 ]
  %arrayidx.i97 = getelementptr inbounds nuw i64, ptr %_pivot_row, i32 %i.0.i93144
  %71 = load i64, ptr %arrayidx.i97, align 8
  %and.i98 = and i64 %71, 1229782938247303441
  %and1.i99 = and i32 %xor2.i.i91, 255
  %conv.i100 = zext nneg i32 %and1.i99 to i64
  %mul.i101 = mul i64 %and.i98, %conv.i100
  %shr.i102 = lshr i64 %71, 1
  %and3.i103 = and i64 %shr.i102, 1229782938247303441
  %shr4.i104 = lshr i32 %xor2.i.i91, 8
  %and5.i105 = and i32 %shr4.i104, 15
  %conv6.i106 = zext nneg i32 %and5.i105 to i64
  %mul7.i107 = mul nuw i64 %and3.i103, %conv6.i106
  %xor.i108 = xor i64 %mul.i101, %mul7.i107
  %arrayidx8.i109 = getelementptr inbounds nuw i64, ptr %_pivot_row, i32 %i.0.i93144
  %72 = load i64, ptr %arrayidx8.i109, align 8
  %shr9.i110 = lshr i64 %72, 2
  %and10.i111 = and i64 %shr9.i110, 1229782938247303441
  %shr11.i112 = lshr i32 %xor2.i.i91, 16
  %and12.i113 = and i32 %shr11.i112, 15
  %conv13.i114 = zext nneg i32 %and12.i113 to i64
  %mul14.i115 = mul nuw i64 %and10.i111, %conv13.i114
  %xor15.i116 = xor i64 %xor.i108, %mul14.i115
  %arrayidx16.i117 = getelementptr inbounds nuw i64, ptr %_pivot_row, i32 %i.0.i93144
  %73 = load i64, ptr %arrayidx16.i117, align 8
  %shr17.i118 = lshr i64 %73, 3
  %and18.i119 = and i64 %shr17.i118, 1229782938247303441
  %shr19.i120 = lshr i32 %xor2.i.i91, 24
  %and20.i121 = and i32 %shr19.i120, 15
  %conv21.i122 = zext nneg i32 %and20.i121 to i64
  %mul22.i123 = mul nuw i64 %and18.i119, %conv21.i122
  %xor23.i124 = xor i64 %xor15.i116, %mul22.i123
  %arrayidx24.i125 = getelementptr inbounds nuw i64, ptr %_pivot_row2, i32 %i.0.i93144
  %74 = load i64, ptr %arrayidx24.i125, align 8
  %xor25.i126 = xor i64 %74, %xor23.i124
  store i64 %xor25.i126, ptr %arrayidx24.i125, align 8
  %inc.i127 = add nuw nsw i32 %i.0.i93144, 1
  %exitcond.i94.not = icmp eq i32 %inc.i127, %70
  br i1 %exitcond.i94.not, label %for.cond.i92.for.cond60.preheader_crit_edge, label %for.body.i96, !llvm.loop !13

for.cond60.for.cond90.preheader_crit_edge:        ; preds = %for.inc86
  br label %for.cond90.preheader

for.cond90.preheader:                             ; preds = %for.cond60.for.cond90.preheader_crit_edge, %for.cond60.preheader
  %cmp91151 = icmp slt i32 %cond, %nrows
  br i1 %cmp91151, label %for.body93.lr.ph, label %for.inc117

for.body93.lr.ph:                                 ; preds = %for.cond90.preheader
  br label %for.body93

for.body63:                                       ; preds = %for.body63.lr.ph, %for.inc86
  %row59.0148 = phi i32 [ %cond, %for.body63.lr.ph ], [ %inc87, %for.inc86 ]
  %xor.i10 = xor i32 %row59.0148, %pivot_row.0155
  %75 = icmp sgt i32 %xor.i10, 0
  %shr.i11 = sext i1 %75 to i64
  %76 = load volatile i64, ptr @pqmayo_MAYO_1_ref_uint64_t_blocker, align 8
  %xor1.i12 = xor i64 %76, %shr.i11
  %and67.demorgan = or i64 %xor1.i12, %pivot_is_zero.0.lcssa
  %and67 = xor i64 %and67.demorgan, -1
  %exitcond4.not145 = icmp eq i32 0, %1
  br i1 %exitcond4.not145, label %for.inc86, label %for.body72.lr.ph

for.body72.lr.ph:                                 ; preds = %for.body63
  br label %for.body72

for.body72:                                       ; preds = %for.body72.lr.ph, %for.body72
  %col.0146 = phi i32 [ 0, %for.body72.lr.ph ], [ %inc84, %for.body72 ]
  %mul73 = mul nsw i32 %row59.0148, %div
  %add74 = add nsw i32 %mul73, %col.0146
  %arrayidx75 = getelementptr inbounds [468 x i64], ptr %packed_A, i32 0, i32 %add74
  %77 = load i64, ptr %arrayidx75, align 8
  %and76 = and i64 %and67.demorgan, %77
  %arrayidx77 = getelementptr inbounds nuw [6 x i64], ptr %_pivot_row2, i32 0, i32 %col.0146
  %78 = load i64, ptr %arrayidx77, align 8
  %and78 = and i64 %78, %and67
  %add79 = add i64 %and76, %and78
  %mul80 = mul nsw i32 %row59.0148, %div
  %add81 = add nsw i32 %mul80, %col.0146
  %arrayidx82 = getelementptr inbounds [468 x i64], ptr %packed_A, i32 0, i32 %add81
  store i64 %add79, ptr %arrayidx82, align 8
  %inc84 = add nuw nsw i32 %col.0146, 1
  %exitcond4.not = icmp eq i32 %inc84, %1
  br i1 %exitcond4.not, label %for.cond69.for.inc86_crit_edge, label %for.body72, !llvm.loop !14

for.cond69.for.inc86_crit_edge:                   ; preds = %for.body72
  br label %for.inc86

for.inc86:                                        ; preds = %for.cond69.for.inc86_crit_edge, %for.body63
  %inc87 = add nsw i32 %row59.0148, 1
  %cmp61.not = icmp sgt i32 %inc87, %cond16
  br i1 %cmp61.not, label %for.cond60.for.cond90.preheader_crit_edge, label %for.body63, !llvm.loop !15

for.body93:                                       ; preds = %for.body93.lr.ph, %vec_mul_add_u64.exit
  %row89.0152 = phi i32 [ %cond, %for.body93.lr.ph ], [ %inc110, %vec_mul_add_u64.exit ]
  %cmp94 = icmp sgt i32 %row89.0152, %pivot_row.0155
  %mul98 = mul nsw i32 %row89.0152, %div
  %add.ptr99 = getelementptr inbounds i64, ptr %packed_A, i32 %mul98
  %div.i15.udiv = udiv i32 %pivot_col.0154, 16
  %rem.i16.urem = urem i32 %pivot_col.0154, 16
  %arrayidx.i17 = getelementptr inbounds nuw i64, ptr %add.ptr99, i32 %div.i15.udiv
  %79 = load i64, ptr %arrayidx.i17, align 8
  %mul.i18 = shl nuw nsw i32 %rem.i16.urem, 2
  %sh_prom.i19 = zext nneg i32 %mul.i18 to i64
  %shr.i20 = lshr i64 %79, %sh_prom.i19
  %80 = trunc i64 %shr.i20 to i32
  %conv.i21 = and i32 %80, 15
  %mul107 = mul nsw i32 %row89.0152, %div
  %add.ptr108 = getelementptr inbounds i64, ptr %packed_A, i32 %mul107
  %81 = mul nuw nsw i32 %conv.i21, 134480385
  %mul.i.i = select i1 %cmp94, i32 %81, i32 0
  %and.i.i = and i32 %mul.i.i, 1894838512
  %shr.i.i = lshr exact i32 %and.i.i, 4
  %shr1.i.i = lshr exact i32 %and.i.i, 3
  %82 = xor i32 %shr.i.i, %shr1.i.i
  %xor2.i.i = xor i32 %82, %mul.i.i
  %83 = call i32 @llvm.smax.i32(i32 %div, i32 0)
  %exitcond.i76.not149 = icmp eq i32 0, %83
  br i1 %exitcond.i76.not149, label %vec_mul_add_u64.exit, label %for.body.i78.lr.ph

for.body.i78.lr.ph:                               ; preds = %for.body93
  br label %for.body.i78

for.body.i78:                                     ; preds = %for.body.i78.lr.ph, %for.body.i78
  %i.0.i75150 = phi i32 [ 0, %for.body.i78.lr.ph ], [ %inc.i85, %for.body.i78 ]
  %arrayidx.i79 = getelementptr inbounds nuw i64, ptr %_pivot_row2, i32 %i.0.i75150
  %84 = load i64, ptr %arrayidx.i79, align 8
  %and.i = and i64 %84, 1229782938247303441
  %and1.i = and i32 %xor2.i.i, 255
  %conv.i80 = zext nneg i32 %and1.i to i64
  %mul.i81 = mul i64 %and.i, %conv.i80
  %shr.i82 = lshr i64 %84, 1
  %and3.i = and i64 %shr.i82, 1229782938247303441
  %shr4.i = lshr i32 %xor2.i.i, 8
  %and5.i = and i32 %shr4.i, 15
  %conv6.i = zext nneg i32 %and5.i to i64
  %mul7.i = mul nuw i64 %and3.i, %conv6.i
  %xor.i83 = xor i64 %mul.i81, %mul7.i
  %arrayidx8.i = getelementptr inbounds nuw i64, ptr %_pivot_row2, i32 %i.0.i75150
  %85 = load i64, ptr %arrayidx8.i, align 8
  %shr9.i = lshr i64 %85, 2
  %and10.i = and i64 %shr9.i, 1229782938247303441
  %shr11.i = lshr i32 %xor2.i.i, 16
  %and12.i = and i32 %shr11.i, 15
  %conv13.i = zext nneg i32 %and12.i to i64
  %mul14.i = mul nuw i64 %and10.i, %conv13.i
  %xor15.i = xor i64 %xor.i83, %mul14.i
  %arrayidx16.i = getelementptr inbounds nuw i64, ptr %_pivot_row2, i32 %i.0.i75150
  %86 = load i64, ptr %arrayidx16.i, align 8
  %shr17.i = lshr i64 %86, 3
  %and18.i = and i64 %shr17.i, 1229782938247303441
  %shr19.i = lshr i32 %xor2.i.i, 24
  %and20.i = and i32 %shr19.i, 15
  %conv21.i = zext nneg i32 %and20.i to i64
  %mul22.i = mul nuw i64 %and18.i, %conv21.i
  %xor23.i = xor i64 %xor15.i, %mul22.i
  %arrayidx24.i = getelementptr inbounds nuw i64, ptr %add.ptr108, i32 %i.0.i75150
  %87 = load i64, ptr %arrayidx24.i, align 8
  %xor25.i84 = xor i64 %87, %xor23.i
  store i64 %xor25.i84, ptr %arrayidx24.i, align 8
  %inc.i85 = add nuw nsw i32 %i.0.i75150, 1
  %exitcond.i76.not = icmp eq i32 %inc.i85, %83
  br i1 %exitcond.i76.not, label %for.cond.i74.vec_mul_add_u64.exit_crit_edge, label %for.body.i78, !llvm.loop !16

for.cond.i74.vec_mul_add_u64.exit_crit_edge:      ; preds = %for.body.i78
  br label %vec_mul_add_u64.exit

vec_mul_add_u64.exit:                             ; preds = %for.cond.i74.vec_mul_add_u64.exit_crit_edge, %for.body93
  %inc110 = add nsw i32 %row89.0152, 1
  %cmp91 = icmp slt i32 %inc110, %nrows
  br i1 %cmp91, label %for.body93, label %for.cond90.for.inc117_crit_edge, !llvm.loop !17

for.cond90.for.inc117_crit_edge:                  ; preds = %vec_mul_add_u64.exit
  br label %for.inc117

for.inc117:                                       ; preds = %for.cond90.for.inc117_crit_edge, %for.cond90.preheader
  %88 = trunc i64 %pivot_is_zero.0.lcssa to i32
  %89 = add i32 %88, 1
  %conv116 = add i32 %89, %pivot_row.0155
  %inc118 = add nuw nsw i32 %pivot_col.0154, 1
  %exitcond6.not = icmp eq i32 %inc118, %2
  br i1 %exitcond6.not, label %for.cond3.for.cond121.preheader_crit_edge, label %for.body5, !llvm.loop !18

for.body124:                                      ; preds = %for.body124.lr.ph, %for.inc141
  %i120.0161 = phi i32 [ 0, %for.body124.lr.ph ], [ %inc142, %for.inc141 ]
  %mul126 = mul nsw i32 %i120.0161, %div
  %add.ptr127 = getelementptr inbounds i64, ptr %packed_A, i32 %mul126
  %mul.i61 = shl nsw i32 %div, 4
  %cmp.i156 = icmp slt i32 0, %mul.i61
  br i1 %cmp.i156, label %for.body.i62.lr.ph, label %for.cond130.preheader

for.body.i62.lr.ph:                               ; preds = %for.body124
  br label %for.body.i62

for.cond.i59.for.cond130.preheader_crit_edge:     ; preds = %for.body.i62
  br label %for.cond130.preheader

for.cond130.preheader:                            ; preds = %for.cond.i59.for.cond130.preheader_crit_edge, %for.body124
  %exitcond7.not158 = icmp eq i32 0, %2
  br i1 %exitcond7.not158, label %for.inc141, label %for.body133.lr.ph

for.body133.lr.ph:                                ; preds = %for.cond130.preheader
  br label %for.body133

for.body.i62:                                     ; preds = %for.body.i62.lr.ph, %for.body.i62
  %i.0.i60157 = phi i32 [ 0, %for.body.i62.lr.ph ], [ %add8.i, %for.body.i62 ]
  %div.i63 = lshr exact i32 %i.0.i60157, 1
  %arrayidx.i64 = getelementptr inbounds nuw i8, ptr %add.ptr127, i32 %div.i63
  %90 = load i8, ptr %arrayidx.i64, align 1
  %91 = and i8 %90, 15
  %arrayidx2.i = getelementptr inbounds nuw i8, ptr %temp, i32 %i.0.i60157
  store i8 %91, ptr %arrayidx2.i, align 1
  %div3.i = lshr exact i32 %i.0.i60157, 1
  %arrayidx4.i = getelementptr inbounds nuw i8, ptr %add.ptr127, i32 %div3.i
  %92 = load i8, ptr %arrayidx4.i, align 1
  %93 = lshr i8 %92, 4
  %add.i = or disjoint i32 %i.0.i60157, 1
  %arrayidx7.i = getelementptr inbounds nuw i8, ptr %temp, i32 %add.i
  store i8 %93, ptr %arrayidx7.i, align 1
  %add8.i = add nuw nsw i32 %i.0.i60157, 2
  %cmp.i = icmp slt i32 %add8.i, %mul.i61
  br i1 %cmp.i, label %for.body.i62, label %for.cond.i59.for.cond130.preheader_crit_edge, !llvm.loop !19

for.body133:                                      ; preds = %for.body133.lr.ph, %for.body133
  %j129.0159 = phi i32 [ 0, %for.body133.lr.ph ], [ %inc139, %for.body133 ]
  %arrayidx134 = getelementptr inbounds nuw [96 x i8], ptr %temp, i32 0, i32 %j129.0159
  %94 = load i8, ptr %arrayidx134, align 1
  %mul135 = mul nsw i32 %i120.0161, %ncols
  %95 = getelementptr i8, ptr %A, i32 %mul135
  %arrayidx137 = getelementptr i8, ptr %95, i32 %j129.0159
  store i8 %94, ptr %arrayidx137, align 1
  %inc139 = add nuw nsw i32 %j129.0159, 1
  %exitcond7.not = icmp eq i32 %inc139, %2
  br i1 %exitcond7.not, label %for.cond130.for.inc141_crit_edge, label %for.body133, !llvm.loop !20

for.cond130.for.inc141_crit_edge:                 ; preds = %for.body133
  br label %for.inc141

for.inc141:                                       ; preds = %for.cond130.for.inc141_crit_edge, %for.cond130.preheader
  %inc142 = add nuw nsw i32 %i120.0161, 1
  %exitcond8.not = icmp eq i32 %inc142, %0
  br i1 %exitcond8.not, label %for.cond121.for.end143_crit_edge, label %for.body124, !llvm.loop !21

for.cond121.for.end143_crit_edge:                 ; preds = %for.inc141
  br label %for.end143

for.end143:                                       ; preds = %for.cond121.for.end143_crit_edge, %for.cond121.preheader
  %96 = load volatile ptr, ptr @mayo_secure_clear.memset_func, align 4
  %call.i = call ptr %96(ptr noundef nonnull %temp, i32 noundef 0, i32 noundef 96) #5
  %97 = load volatile ptr, ptr @mayo_secure_clear.memset_func, align 4
  %call.i1 = call ptr %97(ptr noundef nonnull %_pivot_row, i32 noundef 0, i32 noundef 48) #5
  %98 = load volatile ptr, ptr @mayo_secure_clear.memset_func, align 4
  %call.i2 = call ptr %98(ptr noundef nonnull %_pivot_row2, i32 noundef 0, i32 noundef 48) #5
  %99 = load volatile ptr, ptr @mayo_secure_clear.memset_func, align 4
  %call.i3 = call ptr %99(ptr noundef nonnull %packed_A, i32 noundef 0, i32 noundef 3744) #5
  ret void
}

; Function Attrs: inlinehint nounwind
define dso_local void @mayo_secure_clear(ptr noundef %mem, i32 noundef %size) local_unnamed_addr #0 {
entry:
  %0 = load volatile ptr, ptr @mayo_secure_clear.memset_func, align 4
  %call = call ptr %0(ptr noundef %mem, i32 noundef 0, i32 noundef %size) #5
  ret void
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #2 {
entry:
  %A = alloca [6480 x i8], align 16
  call void @mayo_memset(ptr %A, i8 0, i32 6480)
  call fastcc void @EF(ptr nonnull %A, i32 78, i32 81)
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #3

; Function Attrs: nounwind
define dso_local void @mayo_memcpy(ptr noundef %dst, ptr noundef %src, i32 noundef %len) local_unnamed_addr #4 {
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
attributes #1 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #2 = { inlinehint }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #5 = { nobuiltin nounwind "no-builtins" }

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
