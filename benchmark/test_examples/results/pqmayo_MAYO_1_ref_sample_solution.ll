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
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_1_ref_sample_solution(ptr noundef %p, ptr noundef %A, ptr noundef %y, ptr noundef %r, ptr noundef %x, i32 noundef %k, i32 noundef %o, i32 noundef %m, i32 noundef %A_cols) local_unnamed_addr #0 {
entry:
  %_pivot_row.i = alloca [6 x i64], align 32
  %_pivot_row2.i = alloca [6 x i64], align 32
  %packed_A.i = alloca [468 x i64], align 32
  %temp.i = alloca [96 x i8], align 1
  %Ar = alloca [78 x i8], align 1
  %0 = mul nsw i32 %o, %k
  %1 = call i32 @llvm.smax.i32(i32 %0, i32 0)
  %exitcond.not21 = icmp eq i32 0, %1
  br i1 %exitcond.not21, label %for.cond3.preheader, label %for.body.lr.ph

for.body.lr.ph:                                   ; preds = %entry
  br label %for.body

for.cond.for.cond3.preheader_crit_edge:           ; preds = %for.body
  br label %for.cond3.preheader

for.cond3.preheader:                              ; preds = %for.cond.for.cond3.preheader_crit_edge, %entry
  %2 = call i32 @llvm.smax.i32(i32 %m, i32 0)
  %exitcond14.not23 = icmp eq i32 0, %2
  br i1 %exitcond14.not23, label %for.end13, label %for.body5.lr.ph

for.body5.lr.ph:                                  ; preds = %for.cond3.preheader
  br label %for.body5

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %i.022 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %arrayidx = getelementptr inbounds nuw i8, ptr %r, i32 %i.022
  %3 = load i8, ptr %arrayidx, align 1
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %x, i32 %i.022
  store i8 %3, ptr %arrayidx1, align 1
  %inc = add nuw nsw i32 %i.022, 1
  %exitcond.not = icmp eq i32 %inc, %1
  br i1 %exitcond.not, label %for.cond.for.cond3.preheader_crit_edge, label %for.body, !llvm.loop !7

for.body5:                                        ; preds = %for.body5.lr.ph, %for.body5
  %i2.024 = phi i32 [ 0, %for.body5.lr.ph ], [ %inc12, %for.body5 ]
  %mul6 = mul nsw i32 %k, %o
  %mul7 = mul nsw i32 %k, %o
  %add = add nsw i32 %mul7, 1
  %mul8 = mul nsw i32 %i2.024, %add
  %4 = getelementptr i8, ptr %A, i32 %mul6
  %arrayidx10 = getelementptr i8, ptr %4, i32 %mul8
  store i8 0, ptr %arrayidx10, align 1
  %inc12 = add nuw nsw i32 %i2.024, 1
  %exitcond14.not = icmp eq i32 %inc12, %2
  br i1 %exitcond14.not, label %for.cond3.for.end13_crit_edge, label %for.body5, !llvm.loop !8

for.cond3.for.end13_crit_edge:                    ; preds = %for.body5
  br label %for.end13

for.end13:                                        ; preds = %for.cond3.for.end13_crit_edge, %for.cond3.preheader
  %mul14 = mul nsw i32 %k, %o
  %add15 = add nsw i32 %mul14, 1
  %5 = call i32 @llvm.smax.i32(i32 %m, i32 0)
  %exitcond.i.not30 = icmp eq i32 0, %5
  br i1 %exitcond.i.not30, label %for.cond17.preheader, label %for.cond1.i.preheader.lr.ph

for.cond1.i.preheader.lr.ph:                      ; preds = %for.end13
  br label %for.cond1.i.preheader

for.cond1.i.preheader:                            ; preds = %for.cond1.i.preheader.lr.ph, %for.inc4.i
  %a.addr.0.i33 = phi ptr [ %A, %for.cond1.i.preheader.lr.ph ], [ %add.ptr6.i, %for.inc4.i ]
  %c.addr.0.i32 = phi ptr [ %Ar, %for.cond1.i.preheader.lr.ph ], [ %c.addr.1.i.lcssa, %for.inc4.i ]
  %i.0.i31 = phi i32 [ 0, %for.cond1.i.preheader.lr.ph ], [ %inc5.i, %for.inc4.i ]
  br label %for.body3.i

for.cond.i.for.cond17.preheader_crit_edge:        ; preds = %for.inc4.i
  br label %for.cond17.preheader

for.cond17.preheader:                             ; preds = %for.cond.i.for.cond17.preheader_crit_edge, %for.end13
  %exitcond15.not34 = icmp eq i32 0, %2
  br i1 %exitcond15.not34, label %for.end30, label %for.body19.lr.ph

for.body19.lr.ph:                                 ; preds = %for.cond17.preheader
  br label %for.body19

for.body3.i:                                      ; preds = %for.cond1.i.preheader
  %6 = call i32 @llvm.smax.i32(i32 %add15, i32 0)
  %exitcond.i.i.not25 = icmp eq i32 0, %6
  br i1 %exitcond.i.i.not25, label %lincomb.24.exit.i, label %for.body.i.i.lr.ph

for.body.i.i.lr.ph:                               ; preds = %for.body3.i
  br label %for.body.i.i

for.body.i.i:                                     ; preds = %for.body.i.i.lr.ph, %for.body.i.i
  %i.0.i.i28 = phi i32 [ 0, %for.body.i.i.lr.ph ], [ %inc.i.i, %for.body.i.i ]
  %b.addr.0.i.i27 = phi ptr [ %r, %for.body.i.i.lr.ph ], [ %add.ptr.i.i, %for.body.i.i ]
  %ret.0.i.i26 = phi i8 [ 0, %for.body.i.i.lr.ph ], [ %xor1.i.i.i, %for.body.i.i ]
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %a.addr.0.i33, i32 %i.0.i.i28
  %7 = load i8, ptr %arrayidx.i.i, align 1
  %8 = load i8, ptr %b.addr.0.i.i27, align 1
  %9 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1
  %xor1.i.i = xor i8 %7, %9
  %10 = trunc i8 %xor1.i.i to i1
  %11 = and i8 %xor1.i.i, 2
  %mul9.i.i = mul i8 %11, %8
  %conv10.i.i = select i1 %10, i8 %8, i8 0
  %xor11.i.i = xor i8 %conv10.i.i, %mul9.i.i
  %12 = and i8 %xor1.i.i, 4
  %mul16.i.i = mul i8 %12, %8
  %xor18.i.i = xor i8 %mul16.i.i, %xor11.i.i
  %13 = and i8 %xor1.i.i, 8
  %mul23.i.i = mul i8 %13, %8
  %xor25.i.i = xor i8 %mul23.i.i, %xor18.i.i
  %14 = lshr i8 %xor25.i.i, 4
  %15 = lshr i8 %xor25.i.i, 3
  %16 = and i8 %15, 14
  %17 = xor i8 %14, %16
  %xor25.masked.i.i = and i8 %xor25.i.i, 15
  %18 = xor i8 %17, %xor25.masked.i.i
  %xor1.i.i.i = xor i8 %18, %ret.0.i.i26
  %inc.i.i = add nuw nsw i32 %i.0.i.i28, 1
  %add.ptr.i.i = getelementptr inbounds nuw i8, ptr %b.addr.0.i.i27, i32 1
  %exitcond.i.i.not = icmp eq i32 %inc.i.i, %6
  br i1 %exitcond.i.i.not, label %for.cond.i.i.lincomb.24.exit.i_crit_edge, label %for.body.i.i, !llvm.loop !9

for.cond.i.i.lincomb.24.exit.i_crit_edge:         ; preds = %for.body.i.i
  %split = phi i8 [ %xor1.i.i.i, %for.body.i.i ]
  br label %lincomb.24.exit.i

lincomb.24.exit.i:                                ; preds = %for.cond.i.i.lincomb.24.exit.i_crit_edge, %for.body3.i
  %ret.0.i.i.lcssa = phi i8 [ %split, %for.cond.i.i.lincomb.24.exit.i_crit_edge ], [ 0, %for.body3.i ]
  store i8 %ret.0.i.i.lcssa, ptr %c.addr.0.i32, align 1
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %c.addr.0.i32, i32 1
  br label %for.inc4.i

for.inc4.i:                                       ; preds = %lincomb.24.exit.i
  %c.addr.1.i.lcssa = phi ptr [ %incdec.ptr.i, %lincomb.24.exit.i ]
  %inc5.i = add nuw nsw i32 %i.0.i31, 1
  %add.ptr6.i = getelementptr inbounds i8, ptr %a.addr.0.i33, i32 %add15
  %exitcond.i.not = icmp eq i32 %inc5.i, %5
  br i1 %exitcond.i.not, label %for.cond.i.for.cond17.preheader_crit_edge, label %for.cond1.i.preheader, !llvm.loop !10

for.body19:                                       ; preds = %for.body19.lr.ph, %for.body19
  %i16.035 = phi i32 [ 0, %for.body19.lr.ph ], [ %inc29, %for.body19 ]
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %y, i32 %i16.035
  %19 = load i8, ptr %arrayidx20, align 1
  %arrayidx21 = getelementptr inbounds nuw [78 x i8], ptr %Ar, i32 0, i32 %i16.035
  %20 = load i8, ptr %arrayidx21, align 1
  %xor1.i = xor i8 %19, %20
  %mul22 = mul nsw i32 %k, %o
  %mul23 = mul nsw i32 %k, %o
  %add24 = add nsw i32 %mul23, 1
  %mul25 = mul nsw i32 %i16.035, %add24
  %21 = getelementptr i8, ptr %A, i32 %mul22
  %arrayidx27 = getelementptr i8, ptr %21, i32 %mul25
  store i8 %xor1.i, ptr %arrayidx27, align 1
  %inc29 = add nuw nsw i32 %i16.035, 1
  %exitcond15.not = icmp eq i32 %inc29, %2
  br i1 %exitcond15.not, label %for.cond17.for.end30_crit_edge, label %for.body19, !llvm.loop !11

for.cond17.for.end30_crit_edge:                   ; preds = %for.body19
  br label %for.end30

for.end30:                                        ; preds = %for.cond17.for.end30_crit_edge, %for.cond17.preheader
  %mul31 = mul nsw i32 %k, %o
  call void @llvm.lifetime.start.p0(i64 48, ptr nonnull %_pivot_row.i)
  call void @llvm.lifetime.start.p0(i64 48, ptr nonnull %_pivot_row2.i)
  call void @llvm.lifetime.start.p0(i64 3744, ptr nonnull %packed_A.i)
  call void @llvm.lifetime.start.p0(i64 96, ptr nonnull %temp.i)
  br label %for.body.i.i18

for.body.i.i18:                                   ; preds = %for.end30, %for.body.i.i18
  %i.0.i.i236 = phi i32 [ 0, %for.end30 ], [ %inc.i.i20, %for.body.i.i18 ]
  %arrayidx.i.i19 = getelementptr inbounds nuw i8, ptr %packed_A.i, i32 %i.0.i.i236
  store i8 0, ptr %arrayidx.i.i19, align 1
  %inc.i.i20 = add nuw nsw i32 %i.0.i.i236, 1
  %exitcond.i.i3.not = icmp eq i32 %inc.i.i20, 3744
  br i1 %exitcond.i.i3.not, label %mayo_memset.exit.i, label %for.body.i.i18, !llvm.loop !12

mayo_memset.exit.i:                               ; preds = %for.body.i.i18
  %add32 = add nsw i32 %mul31, 1
  %add.i = add nsw i32 %mul31, 16
  %div.i = sdiv i32 %add.i, 16
  %22 = call i32 @llvm.smax.i32(i32 %m, i32 0)
  %exitcond.i6.not40 = icmp eq i32 0, %22
  br i1 %exitcond.i6.not40, label %for.cond3.preheader.i, label %for.body.i.lr.ph

for.body.i.lr.ph:                                 ; preds = %mayo_memset.exit.i
  br label %for.body.i

for.cond.i4.for.cond3.preheader.i_crit_edge:      ; preds = %ef_pack_m_vec.exit.i
  br label %for.cond3.preheader.i

for.cond3.preheader.i:                            ; preds = %for.cond.i4.for.cond3.preheader.i_crit_edge, %mayo_memset.exit.i
  %23 = call i32 @llvm.smax.i32(i32 %div.i, i32 0)
  %24 = call i32 @llvm.smax.i32(i32 %add32, i32 0)
  %exitcond6.i.not61 = icmp eq i32 0, %24
  br i1 %exitcond6.i.not61, label %for.cond121.i.preheader, label %for.body5.i.lr.ph

for.body5.i.lr.ph:                                ; preds = %for.cond3.preheader.i
  br label %for.body5.i

for.body.i:                                       ; preds = %for.body.i.lr.ph, %ef_pack_m_vec.exit.i
  %i.0.i541 = phi i32 [ 0, %for.body.i.lr.ph ], [ %inc.i, %ef_pack_m_vec.exit.i ]
  %mul.i17 = mul nsw i32 %i.0.i541, %add32
  %add.ptr.i = getelementptr inbounds i8, ptr %A, i32 %mul.i17
  %mul1.i = mul nsw i32 %i.0.i541, %div.i
  %add.ptr2.i = getelementptr inbounds i64, ptr %packed_A.i, i32 %mul1.i
  %cmp.i68.i37 = icmp slt i32 0, %mul31
  br i1 %cmp.i68.i37, label %for.body.i69.i.lr.ph, label %for.end.i.i

for.body.i69.i.lr.ph:                             ; preds = %for.body.i
  br label %for.body.i69.i

for.body.i69.i:                                   ; preds = %for.body.i69.i.lr.ph, %for.body.i69.i
  %i.0.i66.i38 = phi i32 [ 0, %for.body.i69.i.lr.ph ], [ %add8.i73.i, %for.body.i69.i ]
  %arrayidx.i70.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 %i.0.i66.i38
  %25 = load i8, ptr %arrayidx.i70.i, align 1
  %add2.i.i = or disjoint i32 %i.0.i66.i38, 1
  %arrayidx3.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 %add2.i.i
  %26 = load i8, ptr %arrayidx3.i.i, align 1
  %shl5.i.i = shl i8 %26, 4
  %or.i.i = or i8 %shl5.i.i, %25
  %div.i71.i = lshr exact i32 %i.0.i66.i38, 1
  %arrayidx7.i72.i = getelementptr inbounds nuw i8, ptr %add.ptr2.i, i32 %div.i71.i
  store i8 %or.i.i, ptr %arrayidx7.i72.i, align 1
  %add8.i73.i = add nuw nsw i32 %i.0.i66.i38, 2
  %cmp.i68.i = icmp slt i32 %add8.i73.i, %mul31
  br i1 %cmp.i68.i, label %for.body.i69.i, label %for.cond.i65.i.for.end.i.i_crit_edge, !llvm.loop !13

for.cond.i65.i.for.end.i.i_crit_edge:             ; preds = %for.body.i69.i
  %split39 = phi i32 [ %add8.i73.i, %for.body.i69.i ]
  br label %for.end.i.i

for.end.i.i:                                      ; preds = %for.cond.i65.i.for.end.i.i_crit_edge, %for.body.i
  %i.0.i66.i.lcssa = phi i32 [ %split39, %for.cond.i65.i.for.end.i.i_crit_edge ], [ 0, %for.body.i ]
  %27 = and i32 %add32, -2147483647
  %cmp9.i.i = icmp eq i32 %27, 1
  br i1 %cmp9.i.i, label %if.then.i.i, label %ef_pack_m_vec.exit.i

if.then.i.i:                                      ; preds = %for.end.i.i
  %arrayidx12.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 %i.0.i66.i.lcssa
  %28 = load i8, ptr %arrayidx12.i.i, align 1
  %div16.i.i = lshr exact i32 %i.0.i66.i.lcssa, 1
  %arrayidx17.i.i = getelementptr inbounds nuw i8, ptr %add.ptr2.i, i32 %div16.i.i
  store i8 %28, ptr %arrayidx17.i.i, align 1
  br label %ef_pack_m_vec.exit.i

ef_pack_m_vec.exit.i:                             ; preds = %if.then.i.i, %for.end.i.i
  %inc.i = add nuw nsw i32 %i.0.i541, 1
  %exitcond.i6.not = icmp eq i32 %inc.i, %22
  br i1 %exitcond.i6.not, label %for.cond.i4.for.cond3.preheader.i_crit_edge, label %for.body.i, !llvm.loop !14

for.cond3.i.for.cond121.i.preheader_crit_edge:    ; preds = %for.inc117.i
  br label %for.cond121.i.preheader

for.cond121.i.preheader:                          ; preds = %for.cond3.i.for.cond121.i.preheader_crit_edge, %for.cond3.preheader.i
  %exitcond8.i.not68 = icmp eq i32 0, %22
  br i1 %exitcond8.i.not68, label %EF.exit, label %for.body124.i.lr.ph

for.body124.i.lr.ph:                              ; preds = %for.cond121.i.preheader
  br label %for.body124.i

for.body5.i:                                      ; preds = %for.body5.i.lr.ph, %for.inc117.i
  %pivot_row.0.i63 = phi i32 [ 0, %for.body5.i.lr.ph ], [ %conv116.i, %for.inc117.i ]
  %pivot_col.0.i62 = phi i32 [ 0, %for.body5.i.lr.ph ], [ %inc118.i, %for.inc117.i ]
  %add6.i = add nsw i32 %pivot_col.0.i62, %m
  %cmp7.i.not = icmp sgt i32 %add6.i, %mul31
  %add8.i = add nsw i32 %pivot_col.0.i62, %m
  %sub9.i = sub nsw i32 %add8.i, %add32
  %cond.i = select i1 %cmp7.i.not, i32 %sub9.i, i32 0
  %sub13.i = add nsw i32 %m, -1
  %exitcond2.i.not42 = icmp eq i32 0, %23
  br i1 %exitcond2.i.not42, label %for.cond25.preheader.i, label %for.body20.i.lr.ph

for.body20.i.lr.ph:                               ; preds = %for.body5.i
  br label %for.body20.i

for.cond18.i.for.cond25.preheader.i_crit_edge:    ; preds = %for.body20.i
  br label %for.cond25.preheader.i

for.cond25.preheader.i:                           ; preds = %for.cond18.i.for.cond25.preheader.i_crit_edge, %for.body5.i
  %cmp11.not.i = icmp sgt i32 %m, %pivot_col.0.i62
  %cond16.i = select i1 %cmp11.not.i, i32 %pivot_col.0.i62, i32 %sub13.i
  %add27.i = add nsw i32 %cond16.i, 32
  %cmp28.not.i = icmp sgt i32 %m, %add27.i
  %sub30.i = add nsw i32 %m, -1
  %add32.i = add nsw i32 %cond16.i, 32
  %cond34.i = select i1 %cmp28.not.i, i32 %add32.i, i32 %sub30.i
  %cmp35.not.i46 = icmp sgt i32 %cond.i, %cond34.i
  br i1 %cmp35.not.i46, label %for.end55.i, label %for.body36.i.lr.ph

for.body36.i.lr.ph:                               ; preds = %for.cond25.preheader.i
  br label %for.body36.i

for.body20.i:                                     ; preds = %for.body20.i.lr.ph, %for.body20.i
  %i17.0.i43 = phi i32 [ 0, %for.body20.i.lr.ph ], [ %inc23.i, %for.body20.i ]
  %arrayidx.i = getelementptr inbounds nuw [6 x i64], ptr %_pivot_row.i, i32 0, i32 %i17.0.i43
  store i64 0, ptr %arrayidx.i, align 8
  %arrayidx21.i = getelementptr inbounds nuw [6 x i64], ptr %_pivot_row2.i, i32 0, i32 %i17.0.i43
  store i64 0, ptr %arrayidx21.i, align 8
  %inc23.i = add nuw nsw i32 %i17.0.i43, 1
  %exitcond2.i.not = icmp eq i32 %inc23.i, %23
  br i1 %exitcond2.i.not, label %for.cond18.i.for.cond25.preheader.i_crit_edge, label %for.body20.i, !llvm.loop !15

for.body36.i:                                     ; preds = %for.body36.i.lr.ph, %for.end48.i
  %row.0.i48 = phi i32 [ %cond.i, %for.body36.i.lr.ph ], [ %inc54.i, %for.end48.i ]
  %pivot_is_zero.0.i47 = phi i64 [ -1, %for.body36.i.lr.ph ], [ %not52.i, %for.end48.i ]
  %xor.i10.i = xor i32 %row.0.i48, %pivot_row.0.i63
  %29 = load volatile i64, ptr @pqmayo_MAYO_1_ref_uint64_t_blocker, align 8
  %30 = icmp slt i32 %xor.i10.i, 1
  %31 = sext i1 %30 to i64
  %not.i = xor i64 %29, %31
  %32 = icmp slt i32 %pivot_row.0.i63, %row.0.i48
  %shr.i.i = sext i1 %32 to i64
  %33 = load volatile i64, ptr @pqmayo_MAYO_1_ref_uint64_t_blocker, align 8
  %xor.i.i = xor i64 %33, %shr.i.i
  %exitcond3.i.not44 = icmp eq i32 0, %23
  br i1 %exitcond3.i.not44, label %for.end48.i, label %for.body40.i.lr.ph

for.body40.i.lr.ph:                               ; preds = %for.body36.i
  br label %for.body40.i

for.body40.i:                                     ; preds = %for.body40.i.lr.ph, %for.body40.i
  %j.0.i45 = phi i32 [ 0, %for.body40.i.lr.ph ], [ %inc47.i, %for.body40.i ]
  %and.i = and i64 %xor.i.i, %pivot_is_zero.0.i47
  %or.i = or i64 %and.i, %not.i
  %mul41.i = mul nsw i32 %row.0.i48, %div.i
  %add42.i = add nsw i32 %mul41.i, %j.0.i45
  %arrayidx43.i = getelementptr inbounds [468 x i64], ptr %packed_A.i, i32 0, i32 %add42.i
  %34 = load i64, ptr %arrayidx43.i, align 8
  %and44.i = and i64 %or.i, %34
  %arrayidx45.i = getelementptr inbounds nuw [6 x i64], ptr %_pivot_row.i, i32 0, i32 %j.0.i45
  %35 = load i64, ptr %arrayidx45.i, align 8
  %xor.i7 = xor i64 %35, %and44.i
  store i64 %xor.i7, ptr %arrayidx45.i, align 8
  %inc47.i = add nuw nsw i32 %j.0.i45, 1
  %exitcond3.i.not = icmp eq i32 %inc47.i, %23
  br i1 %exitcond3.i.not, label %for.cond38.i.for.end48.i_crit_edge, label %for.body40.i, !llvm.loop !16

for.cond38.i.for.end48.i_crit_edge:               ; preds = %for.body40.i
  br label %for.end48.i

for.end48.i:                                      ; preds = %for.cond38.i.for.end48.i_crit_edge, %for.body36.i
  %div.i.i.udiv = udiv i32 %pivot_col.0.i62, 16
  %rem.i.i.urem = urem i32 %pivot_col.0.i62, 16
  %arrayidx.i13.i = getelementptr inbounds nuw i64, ptr %_pivot_row.i, i32 %div.i.i.udiv
  %36 = load i64, ptr %arrayidx.i13.i, align 8
  %mul.i.i = shl nuw nsw i32 %rem.i.i.urem, 2
  %sh_prom.i.i = zext nneg i32 %mul.i.i to i64
  %shr.i14.i = lshr i64 %36, %sh_prom.i.i
  %37 = trunc i64 %shr.i14.i to i8
  %conv.i.i = and i8 %37, 15
  %38 = load volatile i64, ptr @pqmayo_MAYO_1_ref_uint64_t_blocker, align 8
  %39 = icmp eq i8 %conv.i.i, 0
  %40 = sext i1 %39 to i64
  %not52.i = xor i64 %38, %40
  %inc54.i = add nsw i32 %row.0.i48, 1
  %cmp35.not.i = icmp sgt i32 %inc54.i, %cond34.i
  br i1 %cmp35.not.i, label %for.cond25.i.for.end55.i_crit_edge, label %for.body36.i, !llvm.loop !17

for.cond25.i.for.end55.i_crit_edge:               ; preds = %for.end48.i
  %split49 = phi i64 [ %not52.i, %for.end48.i ]
  %split50 = phi i8 [ %conv.i.i, %for.end48.i ]
  br label %for.end55.i

for.end55.i:                                      ; preds = %for.cond25.i.for.end55.i_crit_edge, %for.cond25.preheader.i
  %pivot_is_zero.0.i.lcssa = phi i64 [ %split49, %for.cond25.i.for.end55.i_crit_edge ], [ -1, %for.cond25.preheader.i ]
  %pivot.0.i.lcssa = phi i8 [ %split50, %for.cond25.i.for.end55.i_crit_edge ], [ 0, %for.cond25.preheader.i ]
  %41 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1
  %xor1.i23.i = xor i8 %pivot.0.i.lcssa, %41
  %42 = trunc i8 %xor1.i23.i to i1
  %43 = and i8 %xor1.i23.i, 2
  %mul9.i24.i = mul nuw nsw i8 %43, %pivot.0.i.lcssa
  %conv10.i25.i = select i1 %42, i8 %pivot.0.i.lcssa, i8 0
  %xor11.i26.i = xor i8 %conv10.i25.i, %mul9.i24.i
  %44 = and i8 %xor1.i23.i, 4
  %mul16.i27.i = mul nuw nsw i8 %44, %pivot.0.i.lcssa
  %xor18.i28.i = xor i8 %mul16.i27.i, %xor11.i26.i
  %45 = and i8 %xor1.i23.i, 8
  %mul23.i29.i = mul nuw nsw i8 %45, %pivot.0.i.lcssa
  %xor25.i30.i = xor i8 %mul23.i29.i, %xor18.i28.i
  %46 = lshr i8 %xor25.i30.i, 4
  %47 = lshr i8 %xor25.i30.i, 3
  %48 = and i8 %47, 14
  %49 = xor i8 %46, %48
  %xor25.masked.i31.i = and i8 %xor25.i30.i, 15
  %50 = xor i8 %49, %xor25.masked.i31.i
  %51 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1
  %xor1.i22.i = xor i8 %50, %51
  %52 = trunc i8 %xor1.i22.i to i1
  %53 = and i8 %xor1.i22.i, 2
  %mul9.i.i8 = mul nuw nsw i8 %53, %50
  %conv10.i.i9 = select i1 %52, i8 %50, i8 0
  %xor11.i.i10 = xor i8 %conv10.i.i9, %mul9.i.i8
  %54 = and i8 %xor1.i22.i, 4
  %mul16.i.i11 = mul nuw nsw i8 %54, %50
  %xor18.i.i12 = xor i8 %mul16.i.i11, %xor11.i.i10
  %55 = and i8 %xor1.i22.i, 8
  %mul23.i.i13 = mul nuw nsw i8 %55, %50
  %xor25.i.i14 = xor i8 %mul23.i.i13, %xor18.i.i12
  %56 = lshr i8 %xor25.i.i14, 4
  %57 = lshr i8 %xor25.i.i14, 3
  %58 = and i8 %57, 14
  %59 = xor i8 %56, %58
  %xor25.masked.i.i15 = and i8 %xor25.i.i14, 15
  %60 = xor i8 %59, %xor25.masked.i.i15
  %61 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1
  %xor1.i32.i = xor i8 %60, %61
  %62 = trunc i8 %xor1.i32.i to i1
  %63 = and i8 %xor1.i32.i, 2
  %mul9.i33.i = mul nuw nsw i8 %63, %60
  %conv10.i34.i = select i1 %62, i8 %60, i8 0
  %xor11.i35.i = xor i8 %conv10.i34.i, %mul9.i33.i
  %64 = and i8 %xor1.i32.i, 4
  %mul16.i36.i = mul nuw nsw i8 %64, %60
  %xor18.i37.i = xor i8 %mul16.i36.i, %xor11.i35.i
  %65 = and i8 %xor1.i32.i, 8
  %mul23.i38.i = mul nuw nsw i8 %65, %60
  %xor25.i39.i = xor i8 %mul23.i38.i, %xor18.i37.i
  %66 = lshr i8 %xor25.i39.i, 4
  %67 = lshr i8 %xor25.i39.i, 3
  %68 = and i8 %67, 14
  %69 = xor i8 %66, %68
  %xor25.masked.i40.i = and i8 %xor25.i39.i, 15
  %70 = xor i8 %69, %xor25.masked.i40.i
  %71 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1
  %xor1.i41.i = xor i8 %50, %71
  %72 = trunc i8 %xor1.i41.i to i1
  %73 = and i8 %xor1.i41.i, 2
  %mul9.i42.i = mul nuw nsw i8 %73, %60
  %conv10.i43.i = select i1 %72, i8 %60, i8 0
  %xor11.i44.i = xor i8 %conv10.i43.i, %mul9.i42.i
  %74 = and i8 %xor1.i41.i, 4
  %mul16.i45.i = mul nuw nsw i8 %74, %60
  %xor18.i46.i = xor i8 %mul16.i45.i, %xor11.i44.i
  %75 = and i8 %xor1.i41.i, 8
  %mul23.i47.i = mul nuw nsw i8 %75, %60
  %xor25.i48.i = xor i8 %mul23.i47.i, %xor18.i46.i
  %76 = lshr i8 %xor25.i48.i, 4
  %77 = lshr i8 %xor25.i48.i, 3
  %78 = and i8 %77, 14
  %79 = xor i8 %76, %78
  %xor25.masked.i49.i = and i8 %xor25.i48.i, 15
  %80 = xor i8 %79, %xor25.masked.i49.i
  %81 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1
  %xor1.i50.i = xor i8 %70, %81
  %82 = trunc i8 %xor1.i50.i to i1
  %83 = and i8 %xor1.i50.i, 2
  %mul9.i51.i = mul nuw nsw i8 %83, %80
  %conv10.i52.i = select i1 %82, i8 %80, i8 0
  %xor11.i53.i = xor i8 %conv10.i52.i, %mul9.i51.i
  %84 = and i8 %xor1.i50.i, 4
  %mul16.i54.i = mul nuw nsw i8 %84, %80
  %xor18.i55.i = xor i8 %mul16.i54.i, %xor11.i53.i
  %85 = and i8 %xor1.i50.i, 8
  %mul23.i56.i = mul nuw nsw i8 %85, %80
  %xor25.i57.i = xor i8 %mul23.i56.i, %xor18.i55.i
  %86 = lshr i8 %xor25.i57.i, 4
  %87 = lshr i8 %xor25.i57.i, 3
  %88 = and i8 %87, 14
  %89 = xor i8 %86, %88
  %xor25.masked.i58.i = and i8 %xor25.i57.i, 15
  %90 = xor i8 %89, %xor25.masked.i58.i
  %conv.i.i.i = zext nneg i8 %90 to i32
  %mul.i.i.i = mul nuw nsw i32 %conv.i.i.i, 134480385
  %and.i.i.i = and i32 %mul.i.i.i, 1894838512
  %shr.i.i.i = lshr exact i32 %and.i.i.i, 4
  %shr1.i.i.i = lshr exact i32 %and.i.i.i, 3
  %91 = xor i32 %shr.i.i.i, %shr1.i.i.i
  %xor2.i.i.i = xor i32 %91, %mul.i.i.i
  %92 = call i32 @llvm.smax.i32(i32 %div.i, i32 0)
  %exitcond.i76.i.not51 = icmp eq i32 0, %92
  br i1 %exitcond.i76.i.not51, label %for.cond60.i.preheader, label %for.body.i78.i.lr.ph

for.body.i78.i.lr.ph:                             ; preds = %for.end55.i
  br label %for.body.i78.i

for.cond.i74.i.for.cond60.i.preheader_crit_edge:  ; preds = %for.body.i78.i
  br label %for.cond60.i.preheader

for.cond60.i.preheader:                           ; preds = %for.cond.i74.i.for.cond60.i.preheader_crit_edge, %for.end55.i
  %cmp61.not.i55 = icmp sgt i32 %cond.i, %cond16.i
  br i1 %cmp61.not.i55, label %for.cond90.i.preheader, label %for.body63.i.lr.ph

for.body63.i.lr.ph:                               ; preds = %for.cond60.i.preheader
  br label %for.body63.i

for.body.i78.i:                                   ; preds = %for.body.i78.i.lr.ph, %for.body.i78.i
  %i.0.i75.i52 = phi i32 [ 0, %for.body.i78.i.lr.ph ], [ %inc.i85.i, %for.body.i78.i ]
  %arrayidx.i79.i = getelementptr inbounds nuw i64, ptr %_pivot_row.i, i32 %i.0.i75.i52
  %93 = load i64, ptr %arrayidx.i79.i, align 8
  %and.i.i = and i64 %93, 1229782938247303441
  %and1.i.i = and i32 %xor2.i.i.i, 255
  %conv.i80.i = zext nneg i32 %and1.i.i to i64
  %mul.i81.i = mul i64 %and.i.i, %conv.i80.i
  %shr.i82.i = lshr i64 %93, 1
  %and3.i.i = and i64 %shr.i82.i, 1229782938247303441
  %shr4.i.i = lshr i32 %xor2.i.i.i, 8
  %and5.i.i = and i32 %shr4.i.i, 15
  %conv6.i.i = zext nneg i32 %and5.i.i to i64
  %mul7.i.i = mul nuw i64 %and3.i.i, %conv6.i.i
  %xor.i83.i = xor i64 %mul.i81.i, %mul7.i.i
  %arrayidx8.i.i = getelementptr inbounds nuw i64, ptr %_pivot_row.i, i32 %i.0.i75.i52
  %94 = load i64, ptr %arrayidx8.i.i, align 8
  %shr9.i.i = lshr i64 %94, 2
  %and10.i.i = and i64 %shr9.i.i, 1229782938247303441
  %shr11.i.i = lshr i32 %xor2.i.i.i, 16
  %and12.i.i = and i32 %shr11.i.i, 15
  %conv13.i.i = zext nneg i32 %and12.i.i to i64
  %mul14.i.i = mul nuw i64 %and10.i.i, %conv13.i.i
  %xor15.i.i = xor i64 %xor.i83.i, %mul14.i.i
  %arrayidx16.i.i = getelementptr inbounds nuw i64, ptr %_pivot_row.i, i32 %i.0.i75.i52
  %95 = load i64, ptr %arrayidx16.i.i, align 8
  %shr17.i.i = lshr i64 %95, 3
  %and18.i.i = and i64 %shr17.i.i, 1229782938247303441
  %shr19.i.i = lshr i32 %xor2.i.i.i, 24
  %and20.i.i = and i32 %shr19.i.i, 15
  %conv21.i.i = zext nneg i32 %and20.i.i to i64
  %mul22.i.i = mul nuw i64 %and18.i.i, %conv21.i.i
  %xor23.i.i = xor i64 %xor15.i.i, %mul22.i.i
  %arrayidx24.i.i = getelementptr inbounds nuw i64, ptr %_pivot_row2.i, i32 %i.0.i75.i52
  %96 = load i64, ptr %arrayidx24.i.i, align 8
  %xor25.i84.i = xor i64 %96, %xor23.i.i
  store i64 %xor25.i84.i, ptr %arrayidx24.i.i, align 8
  %inc.i85.i = add nuw nsw i32 %i.0.i75.i52, 1
  %exitcond.i76.i.not = icmp eq i32 %inc.i85.i, %92
  br i1 %exitcond.i76.i.not, label %for.cond.i74.i.for.cond60.i.preheader_crit_edge, label %for.body.i78.i, !llvm.loop !18

for.cond60.i.for.cond90.i.preheader_crit_edge:    ; preds = %for.inc86.i
  br label %for.cond90.i.preheader

for.cond90.i.preheader:                           ; preds = %for.cond60.i.for.cond90.i.preheader_crit_edge, %for.cond60.i.preheader
  %cmp91.i59 = icmp slt i32 %cond.i, %m
  br i1 %cmp91.i59, label %for.body93.i.lr.ph, label %for.inc117.i

for.body93.i.lr.ph:                               ; preds = %for.cond90.i.preheader
  br label %for.body93.i

for.body63.i:                                     ; preds = %for.body63.i.lr.ph, %for.inc86.i
  %row59.0.i56 = phi i32 [ %cond.i, %for.body63.i.lr.ph ], [ %inc87.i, %for.inc86.i ]
  %xor.i5.i = xor i32 %row59.0.i56, %pivot_row.0.i63
  %97 = icmp sgt i32 %xor.i5.i, 0
  %shr.i6.i = sext i1 %97 to i64
  %98 = load volatile i64, ptr @pqmayo_MAYO_1_ref_uint64_t_blocker, align 8
  %xor1.i.i16 = xor i64 %98, %shr.i6.i
  %and67.demorgan.i = or i64 %xor1.i.i16, %pivot_is_zero.0.i.lcssa
  %and67.i = xor i64 %and67.demorgan.i, -1
  %exitcond4.i.not53 = icmp eq i32 0, %23
  br i1 %exitcond4.i.not53, label %for.inc86.i, label %for.body72.i.lr.ph

for.body72.i.lr.ph:                               ; preds = %for.body63.i
  br label %for.body72.i

for.body72.i:                                     ; preds = %for.body72.i.lr.ph, %for.body72.i
  %col.0.i54 = phi i32 [ 0, %for.body72.i.lr.ph ], [ %inc84.i, %for.body72.i ]
  %mul73.i = mul nsw i32 %row59.0.i56, %div.i
  %add74.i = add nsw i32 %mul73.i, %col.0.i54
  %arrayidx75.i = getelementptr inbounds [468 x i64], ptr %packed_A.i, i32 0, i32 %add74.i
  %99 = load i64, ptr %arrayidx75.i, align 8
  %and76.i = and i64 %and67.demorgan.i, %99
  %arrayidx77.i = getelementptr inbounds nuw [6 x i64], ptr %_pivot_row2.i, i32 0, i32 %col.0.i54
  %100 = load i64, ptr %arrayidx77.i, align 8
  %and78.i = and i64 %100, %and67.i
  %add79.i = add i64 %and76.i, %and78.i
  %mul80.i = mul nsw i32 %row59.0.i56, %div.i
  %add81.i = add nsw i32 %mul80.i, %col.0.i54
  %arrayidx82.i = getelementptr inbounds [468 x i64], ptr %packed_A.i, i32 0, i32 %add81.i
  store i64 %add79.i, ptr %arrayidx82.i, align 8
  %inc84.i = add nuw nsw i32 %col.0.i54, 1
  %exitcond4.i.not = icmp eq i32 %inc84.i, %23
  br i1 %exitcond4.i.not, label %for.cond69.i.for.inc86.i_crit_edge, label %for.body72.i, !llvm.loop !19

for.cond69.i.for.inc86.i_crit_edge:               ; preds = %for.body72.i
  br label %for.inc86.i

for.inc86.i:                                      ; preds = %for.cond69.i.for.inc86.i_crit_edge, %for.body63.i
  %inc87.i = add nsw i32 %row59.0.i56, 1
  %cmp61.not.i = icmp sgt i32 %inc87.i, %cond16.i
  br i1 %cmp61.not.i, label %for.cond60.i.for.cond90.i.preheader_crit_edge, label %for.body63.i, !llvm.loop !20

for.body93.i:                                     ; preds = %for.body93.i.lr.ph, %vec_mul_add_u64.exit128.i
  %row89.0.i60 = phi i32 [ %cond.i, %for.body93.i.lr.ph ], [ %inc110.i, %vec_mul_add_u64.exit128.i ]
  %cmp94.i = icmp sgt i32 %row89.0.i60, %pivot_row.0.i63
  %mul98.i = mul nsw i32 %row89.0.i60, %div.i
  %add.ptr99.i = getelementptr inbounds i64, ptr %packed_A.i, i32 %mul98.i
  %div.i15.i.udiv = udiv i32 %pivot_col.0.i62, 16
  %rem.i16.i.urem = urem i32 %pivot_col.0.i62, 16
  %arrayidx.i17.i = getelementptr inbounds nuw i64, ptr %add.ptr99.i, i32 %div.i15.i.udiv
  %101 = load i64, ptr %arrayidx.i17.i, align 8
  %mul.i18.i = shl nuw nsw i32 %rem.i16.i.urem, 2
  %sh_prom.i19.i = zext nneg i32 %mul.i18.i to i64
  %shr.i20.i = lshr i64 %101, %sh_prom.i19.i
  %102 = trunc i64 %shr.i20.i to i32
  %conv.i21.i = and i32 %102, 15
  %mul107.i = mul nsw i32 %row89.0.i60, %div.i
  %add.ptr108.i = getelementptr inbounds i64, ptr %packed_A.i, i32 %mul107.i
  %103 = mul nuw nsw i32 %conv.i21.i, 134480385
  %mul.i.i87.i = select i1 %cmp94.i, i32 %103, i32 0
  %and.i.i88.i = and i32 %mul.i.i87.i, 1894838512
  %shr.i.i89.i = lshr exact i32 %and.i.i88.i, 4
  %shr1.i.i90.i = lshr exact i32 %and.i.i88.i, 3
  %104 = xor i32 %shr.i.i89.i, %shr1.i.i90.i
  %xor2.i.i91.i = xor i32 %104, %mul.i.i87.i
  %105 = call i32 @llvm.smax.i32(i32 %div.i, i32 0)
  %exitcond.i94.i.not57 = icmp eq i32 0, %105
  br i1 %exitcond.i94.i.not57, label %vec_mul_add_u64.exit128.i, label %for.body.i96.i.lr.ph

for.body.i96.i.lr.ph:                             ; preds = %for.body93.i
  br label %for.body.i96.i

for.body.i96.i:                                   ; preds = %for.body.i96.i.lr.ph, %for.body.i96.i
  %i.0.i93.i58 = phi i32 [ 0, %for.body.i96.i.lr.ph ], [ %inc.i127.i, %for.body.i96.i ]
  %arrayidx.i97.i = getelementptr inbounds nuw i64, ptr %_pivot_row2.i, i32 %i.0.i93.i58
  %106 = load i64, ptr %arrayidx.i97.i, align 8
  %and.i98.i = and i64 %106, 1229782938247303441
  %and1.i99.i = and i32 %xor2.i.i91.i, 255
  %conv.i100.i = zext nneg i32 %and1.i99.i to i64
  %mul.i101.i = mul i64 %and.i98.i, %conv.i100.i
  %shr.i102.i = lshr i64 %106, 1
  %and3.i103.i = and i64 %shr.i102.i, 1229782938247303441
  %shr4.i104.i = lshr i32 %xor2.i.i91.i, 8
  %and5.i105.i = and i32 %shr4.i104.i, 15
  %conv6.i106.i = zext nneg i32 %and5.i105.i to i64
  %mul7.i107.i = mul nuw i64 %and3.i103.i, %conv6.i106.i
  %xor.i108.i = xor i64 %mul.i101.i, %mul7.i107.i
  %arrayidx8.i109.i = getelementptr inbounds nuw i64, ptr %_pivot_row2.i, i32 %i.0.i93.i58
  %107 = load i64, ptr %arrayidx8.i109.i, align 8
  %shr9.i110.i = lshr i64 %107, 2
  %and10.i111.i = and i64 %shr9.i110.i, 1229782938247303441
  %shr11.i112.i = lshr i32 %xor2.i.i91.i, 16
  %and12.i113.i = and i32 %shr11.i112.i, 15
  %conv13.i114.i = zext nneg i32 %and12.i113.i to i64
  %mul14.i115.i = mul nuw i64 %and10.i111.i, %conv13.i114.i
  %xor15.i116.i = xor i64 %xor.i108.i, %mul14.i115.i
  %arrayidx16.i117.i = getelementptr inbounds nuw i64, ptr %_pivot_row2.i, i32 %i.0.i93.i58
  %108 = load i64, ptr %arrayidx16.i117.i, align 8
  %shr17.i118.i = lshr i64 %108, 3
  %and18.i119.i = and i64 %shr17.i118.i, 1229782938247303441
  %shr19.i120.i = lshr i32 %xor2.i.i91.i, 24
  %and20.i121.i = and i32 %shr19.i120.i, 15
  %conv21.i122.i = zext nneg i32 %and20.i121.i to i64
  %mul22.i123.i = mul nuw i64 %and18.i119.i, %conv21.i122.i
  %xor23.i124.i = xor i64 %xor15.i116.i, %mul22.i123.i
  %arrayidx24.i125.i = getelementptr inbounds nuw i64, ptr %add.ptr108.i, i32 %i.0.i93.i58
  %109 = load i64, ptr %arrayidx24.i125.i, align 8
  %xor25.i126.i = xor i64 %109, %xor23.i124.i
  store i64 %xor25.i126.i, ptr %arrayidx24.i125.i, align 8
  %inc.i127.i = add nuw nsw i32 %i.0.i93.i58, 1
  %exitcond.i94.i.not = icmp eq i32 %inc.i127.i, %105
  br i1 %exitcond.i94.i.not, label %for.cond.i92.i.vec_mul_add_u64.exit128.i_crit_edge, label %for.body.i96.i, !llvm.loop !21

for.cond.i92.i.vec_mul_add_u64.exit128.i_crit_edge: ; preds = %for.body.i96.i
  br label %vec_mul_add_u64.exit128.i

vec_mul_add_u64.exit128.i:                        ; preds = %for.cond.i92.i.vec_mul_add_u64.exit128.i_crit_edge, %for.body93.i
  %inc110.i = add nsw i32 %row89.0.i60, 1
  %exitcond = icmp ne i32 %inc110.i, %m
  br i1 %exitcond, label %for.body93.i, label %for.cond90.i.for.inc117.i_crit_edge, !llvm.loop !22

for.cond90.i.for.inc117.i_crit_edge:              ; preds = %vec_mul_add_u64.exit128.i
  br label %for.inc117.i

for.inc117.i:                                     ; preds = %for.cond90.i.for.inc117.i_crit_edge, %for.cond90.i.preheader
  %110 = trunc i64 %pivot_is_zero.0.i.lcssa to i32
  %111 = add i32 %110, 1
  %conv116.i = add i32 %111, %pivot_row.0.i63
  %inc118.i = add nuw nsw i32 %pivot_col.0.i62, 1
  %exitcond6.i.not = icmp eq i32 %inc118.i, %24
  br i1 %exitcond6.i.not, label %for.cond3.i.for.cond121.i.preheader_crit_edge, label %for.body5.i, !llvm.loop !23

for.body124.i:                                    ; preds = %for.body124.i.lr.ph, %for.inc141.i
  %i120.0.i69 = phi i32 [ 0, %for.body124.i.lr.ph ], [ %inc142.i, %for.inc141.i ]
  %mul126.i = mul nsw i32 %i120.0.i69, %div.i
  %add.ptr127.i = getelementptr inbounds i64, ptr %packed_A.i, i32 %mul126.i
  %mul.i61.i = shl nsw i32 %div.i, 4
  %cmp.i.i64 = icmp slt i32 0, %mul.i61.i
  br i1 %cmp.i.i64, label %for.body.i62.i.lr.ph, label %for.cond130.i.preheader

for.body.i62.i.lr.ph:                             ; preds = %for.body124.i
  br label %for.body.i62.i

for.cond.i59.i.for.cond130.i.preheader_crit_edge: ; preds = %for.body.i62.i
  br label %for.cond130.i.preheader

for.cond130.i.preheader:                          ; preds = %for.cond.i59.i.for.cond130.i.preheader_crit_edge, %for.body124.i
  %exitcond7.i.not66 = icmp eq i32 0, %24
  br i1 %exitcond7.i.not66, label %for.inc141.i, label %for.body133.i.lr.ph

for.body133.i.lr.ph:                              ; preds = %for.cond130.i.preheader
  br label %for.body133.i

for.body.i62.i:                                   ; preds = %for.body.i62.i.lr.ph, %for.body.i62.i
  %i.0.i60.i65 = phi i32 [ 0, %for.body.i62.i.lr.ph ], [ %add8.i.i, %for.body.i62.i ]
  %div.i63.i = lshr exact i32 %i.0.i60.i65, 1
  %arrayidx.i64.i = getelementptr inbounds nuw i8, ptr %add.ptr127.i, i32 %div.i63.i
  %112 = load i8, ptr %arrayidx.i64.i, align 1
  %113 = and i8 %112, 15
  %arrayidx2.i.i = getelementptr inbounds nuw i8, ptr %temp.i, i32 %i.0.i60.i65
  store i8 %113, ptr %arrayidx2.i.i, align 1
  %div3.i.i = lshr exact i32 %i.0.i60.i65, 1
  %arrayidx4.i.i = getelementptr inbounds nuw i8, ptr %add.ptr127.i, i32 %div3.i.i
  %114 = load i8, ptr %arrayidx4.i.i, align 1
  %115 = lshr i8 %114, 4
  %add.i.i = or disjoint i32 %i.0.i60.i65, 1
  %arrayidx7.i.i = getelementptr inbounds nuw i8, ptr %temp.i, i32 %add.i.i
  store i8 %115, ptr %arrayidx7.i.i, align 1
  %add8.i.i = add nuw nsw i32 %i.0.i60.i65, 2
  %cmp.i.i = icmp slt i32 %add8.i.i, %mul.i61.i
  br i1 %cmp.i.i, label %for.body.i62.i, label %for.cond.i59.i.for.cond130.i.preheader_crit_edge, !llvm.loop !24

for.body133.i:                                    ; preds = %for.body133.i.lr.ph, %for.body133.i
  %j129.0.i67 = phi i32 [ 0, %for.body133.i.lr.ph ], [ %inc139.i, %for.body133.i ]
  %arrayidx134.i = getelementptr inbounds nuw [96 x i8], ptr %temp.i, i32 0, i32 %j129.0.i67
  %116 = load i8, ptr %arrayidx134.i, align 1
  %mul135.i = mul nsw i32 %i120.0.i69, %add32
  %117 = getelementptr i8, ptr %A, i32 %mul135.i
  %arrayidx137.i = getelementptr i8, ptr %117, i32 %j129.0.i67
  store i8 %116, ptr %arrayidx137.i, align 1
  %inc139.i = add nuw nsw i32 %j129.0.i67, 1
  %exitcond7.i.not = icmp eq i32 %inc139.i, %24
  br i1 %exitcond7.i.not, label %for.cond130.i.for.inc141.i_crit_edge, label %for.body133.i, !llvm.loop !25

for.cond130.i.for.inc141.i_crit_edge:             ; preds = %for.body133.i
  br label %for.inc141.i

for.inc141.i:                                     ; preds = %for.cond130.i.for.inc141.i_crit_edge, %for.cond130.i.preheader
  %inc142.i = add nuw nsw i32 %i120.0.i69, 1
  %exitcond8.i.not = icmp eq i32 %inc142.i, %22
  br i1 %exitcond8.i.not, label %for.cond121.i.EF.exit_crit_edge, label %for.body124.i, !llvm.loop !26

for.cond121.i.EF.exit_crit_edge:                  ; preds = %for.inc141.i
  br label %EF.exit

EF.exit:                                          ; preds = %for.cond121.i.EF.exit_crit_edge, %for.cond121.i.preheader
  %118 = load volatile ptr, ptr @mayo_secure_clear.memset_func, align 4
  %call.i1.i = call ptr %118(ptr noundef nonnull %temp.i, i32 noundef 0, i32 noundef 96) #6
  %119 = load volatile ptr, ptr @mayo_secure_clear.memset_func, align 4
  %call.i2.i = call ptr %119(ptr noundef nonnull %_pivot_row.i, i32 noundef 0, i32 noundef 48) #6
  %120 = load volatile ptr, ptr @mayo_secure_clear.memset_func, align 4
  %call.i.i = call ptr %120(ptr noundef nonnull %_pivot_row2.i, i32 noundef 0, i32 noundef 48) #6
  %121 = load volatile ptr, ptr @mayo_secure_clear.memset_func, align 4
  %call.i3.i = call ptr %121(ptr noundef nonnull %packed_A.i, i32 noundef 0, i32 noundef 3744) #6
  call void @llvm.lifetime.end.p0(i64 48, ptr nonnull %_pivot_row.i)
  call void @llvm.lifetime.end.p0(i64 48, ptr nonnull %_pivot_row2.i)
  call void @llvm.lifetime.end.p0(i64 3744, ptr nonnull %packed_A.i)
  call void @llvm.lifetime.end.p0(i64 96, ptr nonnull %temp.i)
  %122 = add i32 %A_cols, -1
  %123 = call i32 @llvm.smax.i32(i32 %122, i32 0)
  %exitcond17.not70 = icmp eq i32 0, %123
  br i1 %exitcond17.not70, label %for.end45, label %for.inc43.lr.ph

for.inc43.lr.ph:                                  ; preds = %EF.exit
  br label %for.inc43

for.inc43:                                        ; preds = %for.inc43.lr.ph, %for.inc43
  %i33.072 = phi i32 [ 0, %for.inc43.lr.ph ], [ %inc44, %for.inc43 ]
  %full_rank.071 = phi i8 [ 0, %for.inc43.lr.ph ], [ %or12, %for.inc43 ]
  %sub37 = add nsw i32 %m, -1
  %mul38 = mul nsw i32 %sub37, %A_cols
  %124 = getelementptr i8, ptr %A, i32 %mul38
  %arrayidx40 = getelementptr i8, ptr %124, i32 %i33.072
  %125 = load i8, ptr %arrayidx40, align 1
  %or12 = or i8 %full_rank.071, %125
  %inc44 = add nuw nsw i32 %i33.072, 1
  %exitcond17.not = icmp eq i32 %inc44, %123
  br i1 %exitcond17.not, label %for.cond34.for.end45_crit_edge, label %for.inc43, !llvm.loop !27

for.cond34.for.end45_crit_edge:                   ; preds = %for.inc43
  %split73 = phi i8 [ %or12, %for.inc43 ]
  br label %for.end45

for.end45:                                        ; preds = %for.cond34.for.end45_crit_edge, %EF.exit
  %full_rank.0.lcssa = phi i8 [ %split73, %for.cond34.for.end45_crit_edge ], [ 0, %EF.exit ]
  %cmp47 = icmp eq i8 %full_rank.0.lcssa, 0
  br i1 %cmp47, label %return, label %for.cond50.preheader

for.cond50.preheader:                             ; preds = %for.end45
  %row.079 = add nsw i32 %m, -1
  %cmp5180 = icmp sgt i32 %m, 0
  br i1 %cmp5180, label %for.body53.lr.ph, label %return.loopexit

for.body53.lr.ph:                                 ; preds = %for.cond50.preheader
  br label %for.body53

for.cond63.for.cond50.loopexit_crit_edge:         ; preds = %for.inc229
  br label %for.cond50.loopexit

for.cond50.loopexit:                              ; preds = %for.cond63.for.cond50.loopexit_crit_edge, %cond.end
  %row.0 = add nsw i32 %row.082, -1
  %cmp51 = icmp sgt i32 %row.082, 0
  br i1 %cmp51, label %for.body53, label %for.cond50.return.loopexit_crit_edge, !llvm.loop !28

for.body53:                                       ; preds = %for.body53.lr.ph, %for.cond50.loopexit
  %row.082 = phi i32 [ %row.079, %for.body53.lr.ph ], [ %row.0, %for.cond50.loopexit ]
  %row.0.in81 = phi i32 [ %m, %for.body53.lr.ph ], [ %row.082, %for.cond50.loopexit ]
  %sub54 = sub nsw i32 %m, %row.082
  %div = sdiv i32 32, %sub54
  %add55 = add nsw i32 %row.082, %div
  %mul56 = mul nsw i32 %k, %o
  %cmp57 = icmp slt i32 %add55, %mul56
  br i1 %cmp57, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body53
  %sub59 = sub nsw i32 %m, %row.082
  %div60 = sdiv i32 32, %sub59
  %add61 = add nsw i32 %row.082, %div60
  br label %cond.end

cond.false:                                       ; preds = %for.body53
  %mul62 = mul nsw i32 %k, %o
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %add61, %cond.true ], [ %mul62, %cond.false ]
  %cmp64.not76 = icmp sgt i32 %row.082, %cond
  br i1 %cmp64.not76, label %for.cond50.loopexit, label %for.body66.lr.ph

for.body66.lr.ph:                                 ; preds = %cond.end
  br label %for.body66

for.body66:                                       ; preds = %for.body66.lr.ph, %for.inc229
  %col.078 = phi i32 [ %row.082, %for.body66.lr.ph ], [ %inc230, %for.inc229 ]
  %finished.077 = phi i8 [ 0, %for.body66.lr.ph ], [ %or2273, %for.inc229 ]
  %mul67 = mul nsw i32 %row.082, %A_cols
  %126 = getelementptr i8, ptr %A, i32 %mul67
  %arrayidx69 = getelementptr i8, ptr %126, i32 %col.078
  %127 = load i8, ptr %arrayidx69, align 1
  %128 = icmp ne i8 %127, 0
  %conv3.i = sext i1 %128 to i8
  %129 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1
  %xor5.i = xor i8 %129, %conv3.i
  %not = xor i8 %finished.077, -1
  %add76 = mul i32 %row.0.in81, %A_cols
  %130 = getelementptr i8, ptr %A, i32 %add76
  %arrayidx78 = getelementptr i8, ptr %130, i32 -1
  %131 = load i8, ptr %arrayidx78, align 1
  %132 = and i8 %131, %not
  %and801 = and i8 %132, %xor5.i
  %arrayidx83 = getelementptr inbounds i8, ptr %x, i32 %col.078
  %133 = load i8, ptr %arrayidx83, align 1
  %xor2 = xor i8 %133, %and801
  store i8 %xor2, ptr %arrayidx83, align 1
  %cmp8874 = icmp slt i32 0, %row.082
  br i1 %cmp8874, label %for.body90.lr.ph, label %for.inc229

for.body90.lr.ph:                                 ; preds = %for.body66
  br label %for.body90

for.body90:                                       ; preds = %for.body90.lr.ph, %for.body90
  %i86.075 = phi i32 [ 0, %for.body90.lr.ph ], [ %add223, %for.body90 ]
  %mul91 = mul nsw i32 %i86.075, %A_cols
  %134 = getelementptr i8, ptr %A, i32 %mul91
  %arrayidx93 = getelementptr i8, ptr %134, i32 %col.078
  %135 = load i8, ptr %arrayidx93, align 1
  %conv94 = zext i8 %135 to i64
  %add95 = or disjoint i32 %i86.075, 1
  %mul96 = mul nsw i32 %add95, %A_cols
  %136 = getelementptr i8, ptr %A, i32 %mul96
  %arrayidx98 = getelementptr i8, ptr %136, i32 %col.078
  %137 = load i8, ptr %arrayidx98, align 1
  %conv99 = zext i8 %137 to i64
  %shl100 = shl nuw nsw i64 %conv99, 8
  %xor101 = or disjoint i64 %shl100, %conv94
  %add102 = or disjoint i32 %i86.075, 2
  %mul103 = mul nsw i32 %add102, %A_cols
  %138 = getelementptr i8, ptr %A, i32 %mul103
  %arrayidx105 = getelementptr i8, ptr %138, i32 %col.078
  %139 = load i8, ptr %arrayidx105, align 1
  %conv106 = zext i8 %139 to i64
  %shl107 = shl nuw nsw i64 %conv106, 16
  %xor108 = or disjoint i64 %xor101, %shl107
  %add109 = or disjoint i32 %i86.075, 3
  %mul110 = mul nsw i32 %add109, %A_cols
  %140 = getelementptr i8, ptr %A, i32 %mul110
  %arrayidx112 = getelementptr i8, ptr %140, i32 %col.078
  %141 = load i8, ptr %arrayidx112, align 1
  %conv113 = zext i8 %141 to i64
  %shl114 = shl nuw nsw i64 %conv113, 24
  %xor115 = or disjoint i64 %xor108, %shl114
  %add116 = or disjoint i32 %i86.075, 4
  %mul117 = mul nsw i32 %add116, %A_cols
  %142 = getelementptr i8, ptr %A, i32 %mul117
  %arrayidx119 = getelementptr i8, ptr %142, i32 %col.078
  %143 = load i8, ptr %arrayidx119, align 1
  %conv120 = zext i8 %143 to i64
  %shl121 = shl nuw nsw i64 %conv120, 32
  %xor122 = or disjoint i64 %xor115, %shl121
  %add123 = or disjoint i32 %i86.075, 5
  %mul124 = mul nsw i32 %add123, %A_cols
  %144 = getelementptr i8, ptr %A, i32 %mul124
  %arrayidx126 = getelementptr i8, ptr %144, i32 %col.078
  %145 = load i8, ptr %arrayidx126, align 1
  %conv127 = zext i8 %145 to i64
  %shl128 = shl nuw nsw i64 %conv127, 40
  %xor129 = xor i64 %xor122, %shl128
  %add130 = or disjoint i32 %i86.075, 6
  %mul131 = mul nsw i32 %add130, %A_cols
  %146 = getelementptr i8, ptr %A, i32 %mul131
  %arrayidx133 = getelementptr i8, ptr %146, i32 %col.078
  %147 = load i8, ptr %arrayidx133, align 1
  %conv134 = zext i8 %147 to i64
  %shl135 = shl nuw nsw i64 %conv134, 48
  %xor136 = xor i64 %xor129, %shl135
  %add137 = or disjoint i32 %i86.075, 7
  %mul138 = mul nsw i32 %add137, %A_cols
  %148 = getelementptr i8, ptr %A, i32 %mul138
  %arrayidx140 = getelementptr i8, ptr %148, i32 %col.078
  %149 = load i8, ptr %arrayidx140, align 1
  %conv141 = zext i8 %149 to i64
  %shl142 = shl nuw i64 %conv141, 56
  %xor143 = xor i64 %xor136, %shl142
  %150 = and i8 %and801, 1
  %conv1.i = zext nneg i8 %150 to i64
  %mul.i = mul nuw nsw i64 %xor143, %conv1.i
  %151 = and i8 %and801, 2
  %conv4.i = zext nneg i8 %151 to i64
  %mul5.i = mul i64 %xor143, %conv4.i
  %xor.i = xor i64 %mul.i, %mul5.i
  %152 = and i8 %and801, 4
  %conv8.i = zext nneg i8 %152 to i64
  %mul9.i = mul i64 %xor143, %conv8.i
  %xor10.i = xor i64 %xor.i, %mul9.i
  %153 = and i8 %and801, 8
  %conv13.i = zext nneg i8 %153 to i64
  %mul14.i = mul i64 %xor143, %conv13.i
  %xor15.i = xor i64 %xor10.i, %mul14.i
  %shr.i = lshr i64 %xor15.i, 4
  %and16.i = lshr i64 %xor15.i, 3
  %shr18.i = and i64 %and16.i, 1012762419733073422
  %154 = xor i64 %shr.i, %shr18.i
  %xor19.i = xor i64 %154, %xor15.i
  %mul1464 = or disjoint i32 %i86.075, 1
  %add147 = mul i32 %mul1464, %A_cols
  %155 = getelementptr i8, ptr %A, i32 %add147
  %arrayidx149 = getelementptr i8, ptr %155, i32 -1
  %156 = load i8, ptr %arrayidx149, align 1
  %157 = trunc i64 %xor19.i to i8
  %158 = and i8 %157, 15
  %conv152 = xor i8 %158, %156
  store i8 %conv152, ptr %arrayidx149, align 1
  %shr = lshr i64 %xor19.i, 8
  %mul1555 = or disjoint i32 %i86.075, 2
  %add156 = mul i32 %mul1555, %A_cols
  %159 = getelementptr i8, ptr %A, i32 %add156
  %arrayidx158 = getelementptr i8, ptr %159, i32 -1
  %160 = load i8, ptr %arrayidx158, align 1
  %161 = trunc i64 %shr to i8
  %162 = and i8 %161, 15
  %conv161 = xor i8 %162, %160
  store i8 %conv161, ptr %arrayidx158, align 1
  %shr162 = lshr i64 %xor19.i, 16
  %mul1656 = or disjoint i32 %i86.075, 3
  %add166 = mul i32 %mul1656, %A_cols
  %163 = getelementptr i8, ptr %A, i32 %add166
  %arrayidx168 = getelementptr i8, ptr %163, i32 -1
  %164 = load i8, ptr %arrayidx168, align 1
  %165 = trunc i64 %shr162 to i8
  %166 = and i8 %165, 15
  %conv171 = xor i8 %166, %164
  store i8 %conv171, ptr %arrayidx168, align 1
  %shr172 = lshr i64 %xor19.i, 24
  %mul1757 = or disjoint i32 %i86.075, 4
  %add176 = mul i32 %mul1757, %A_cols
  %167 = getelementptr i8, ptr %A, i32 %add176
  %arrayidx178 = getelementptr i8, ptr %167, i32 -1
  %168 = load i8, ptr %arrayidx178, align 1
  %169 = trunc i64 %shr172 to i8
  %170 = and i8 %169, 15
  %conv181 = xor i8 %170, %168
  store i8 %conv181, ptr %arrayidx178, align 1
  %shr182 = lshr i64 %xor19.i, 32
  %mul1858 = or disjoint i32 %i86.075, 5
  %add186 = mul i32 %mul1858, %A_cols
  %171 = getelementptr i8, ptr %A, i32 %add186
  %arrayidx188 = getelementptr i8, ptr %171, i32 -1
  %172 = load i8, ptr %arrayidx188, align 1
  %173 = trunc i64 %shr182 to i8
  %174 = and i8 %173, 15
  %conv191 = xor i8 %174, %172
  store i8 %conv191, ptr %arrayidx188, align 1
  %shr192 = lshr i64 %xor19.i, 40
  %mul1959 = or disjoint i32 %i86.075, 6
  %add196 = mul i32 %mul1959, %A_cols
  %175 = getelementptr i8, ptr %A, i32 %add196
  %arrayidx198 = getelementptr i8, ptr %175, i32 -1
  %176 = load i8, ptr %arrayidx198, align 1
  %177 = trunc i64 %shr192 to i8
  %178 = and i8 %177, 15
  %conv201 = xor i8 %178, %176
  store i8 %conv201, ptr %arrayidx198, align 1
  %shr202 = lshr i64 %xor19.i, 48
  %mul20510 = or disjoint i32 %i86.075, 7
  %add206 = mul i32 %mul20510, %A_cols
  %179 = getelementptr i8, ptr %A, i32 %add206
  %arrayidx208 = getelementptr i8, ptr %179, i32 -1
  %180 = load i8, ptr %arrayidx208, align 1
  %181 = trunc i64 %shr202 to i8
  %182 = and i8 %181, 15
  %conv211 = xor i8 %182, %180
  store i8 %conv211, ptr %arrayidx208, align 1
  %and20.i = lshr i64 %xor19.i, 56
  %mul21511 = add nuw nsw i32 %i86.075, 8
  %add216 = mul i32 %mul21511, %A_cols
  %183 = getelementptr i8, ptr %A, i32 %add216
  %arrayidx218 = getelementptr i8, ptr %183, i32 -1
  %184 = load i8, ptr %arrayidx218, align 1
  %185 = trunc nuw i64 %and20.i to i8
  %186 = and i8 %185, 15
  %conv221 = xor i8 %184, %186
  store i8 %conv221, ptr %arrayidx218, align 1
  %add223 = add nuw nsw i32 %i86.075, 8
  %cmp88 = icmp slt i32 %add223, %row.082
  br i1 %cmp88, label %for.body90, label %for.cond87.for.inc229_crit_edge, !llvm.loop !29

for.cond87.for.inc229_crit_edge:                  ; preds = %for.body90
  br label %for.inc229

for.inc229:                                       ; preds = %for.cond87.for.inc229_crit_edge, %for.body66
  %or2273 = or i8 %finished.077, %xor5.i
  %inc230 = add nsw i32 %col.078, 1
  %cmp64.not = icmp sgt i32 %inc230, %cond
  br i1 %cmp64.not, label %for.cond63.for.cond50.loopexit_crit_edge, label %for.body66, !llvm.loop !30

for.cond50.return.loopexit_crit_edge:             ; preds = %for.cond50.loopexit
  br label %return.loopexit

return.loopexit:                                  ; preds = %for.cond50.return.loopexit_crit_edge, %for.cond50.preheader
  br label %return

return:                                           ; preds = %return.loopexit, %for.end45
  %retval.0 = phi i32 [ 0, %for.end45 ], [ 1, %return.loopexit ]
  ret i32 %retval.0
}

; Function Attrs: inlinehint nounwind
define dso_local void @mayo_secure_clear(ptr noundef %mem, i32 noundef %size) local_unnamed_addr #0 {
entry:
  %0 = load volatile ptr, ptr @mayo_secure_clear.memset_func, align 4
  %call = call ptr %0(ptr noundef %mem, i32 noundef 0, i32 noundef %size) #6
  ret void
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #2 {
entry:
  %p_buf = alloca [128 x i8], align 16
  call void @mayo_memset(ptr %p_buf, i8 0, i32 128)
  %A = alloca [6480 x i8], align 16
  call void @mayo_memset(ptr %A, i8 0, i32 6480)
  %y = alloca [78 x i8], align 16
  call void @mayo_memset(ptr %y, i8 0, i32 78)
  %r = alloca [81 x i8], align 16
  call void @mayo_memset(ptr %r, i8 0, i32 81)
  %x = alloca [860 x i8], align 16
  call void @mayo_memset(ptr %x, i8 0, i32 860)
  %0 = call i32 @pqmayo_MAYO_1_ref_sample_solution(ptr nonnull %p_buf, ptr nonnull %A, ptr nonnull %y, ptr nonnull %r, ptr nonnull %x, i32 10, i32 8, i32 78, i32 81)
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #4

; Function Attrs: nounwind
define dso_local void @mayo_memcpy(ptr noundef %dst, ptr noundef %src, i32 noundef %len) local_unnamed_addr #5 {
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
  br label %for.cond, !llvm.loop !31

for.end:                                          ; preds = %for.cond
  ret void
}

attributes #0 = { inlinehint nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #1 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #2 = { inlinehint }
attributes #3 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #6 = { nobuiltin nounwind "no-builtins" }

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
