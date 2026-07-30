; ModuleID = '../../mayo_IR/mayo1.ll'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "thumbv7em-unknown-none-eabihf"

@pqmayo_MAYO_1_ref_unsigned_char_blocker = dso_local global i8 0, align 1, !dbg !0

; Function Attrs: inlinehint nounwind
define dso_local fastcc void @mat_mul(ptr noundef nonnull %a, ptr noundef nonnull %b, ptr noundef nonnull %c, i32 noundef %colrow_ab, i32 noundef %row_a, i32 noundef %col_b) unnamed_addr #0 !dbg !130 {
entry:
    #dbg_value(ptr %a, !134, !DIExpression(), !135)
    #dbg_value(ptr %b, !136, !DIExpression(), !135)
    #dbg_value(ptr %c, !137, !DIExpression(), !135)
    #dbg_value(i32 8, !138, !DIExpression(), !135)
    #dbg_value(i32 78, !139, !DIExpression(), !135)
    #dbg_value(i32 1, !140, !DIExpression(), !135)
    #dbg_value(i32 0, !141, !DIExpression(), !143)
  br label %iter_0_start

for.end7:                                         ; preds = %iter_77_end
  ret void, !dbg !144

iter_0_start:                                     ; preds = %entry
  br label %for.cond1.preheader.iter0

for.cond1.preheader.iter0:                        ; preds = %iter_0_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter0, !dbg !150

for.inc4.iter0:                                   ; preds = %lincomb.exit.iter0
  %c.addr.1.lcssa.iter0 = phi ptr [ %incdec.ptr.iter0, %lincomb.exit.iter0 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter0 = getelementptr inbounds nuw i8, ptr %a, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_0_end

for.body.i.iter0:                                 ; preds = %for.cond.i.preheader.iter0, %for.body.i.iter0
  %i.0.i3.iter0 = phi i32 [ 0, %for.cond.i.preheader.iter0 ], [ %inc.i.iter0, %for.body.i.iter0 ]
  %b.addr.0.i2.iter0 = phi ptr [ %b, %for.cond.i.preheader.iter0 ], [ %add.ptr.i.iter0, %for.body.i.iter0 ]
  %ret.0.i1.iter0 = phi i8 [ 0, %for.cond.i.preheader.iter0 ], [ %xor1.i.i.iter0, %for.body.i.iter0 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter0 = getelementptr inbounds nuw i8, ptr %a, i32 %i.0.i3.iter0, !dbg !164
  %0 = load i8, ptr %arrayidx.i.iter0, align 1, !dbg !164
  %1 = load i8, ptr %b.addr.0.i2.iter0, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %2 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter0 = xor i8 %0, %2, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %3 = trunc i8 %xor1.i.iter0 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %4 = and i8 %xor1.i.iter0, 2, !dbg !179
  %mul9.i.iter0 = mul i8 %4, %1, !dbg !180
  %conv10.i.iter0 = select i1 %3, i8 %1, i8 0, !dbg !177
  %xor11.i.iter0 = xor i8 %conv10.i.iter0, %mul9.i.iter0, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %5 = and i8 %xor1.i.iter0, 4, !dbg !182
  %mul16.i.iter0 = mul i8 %5, %1, !dbg !183
  %xor18.i.iter0 = xor i8 %mul16.i.iter0, %xor11.i.iter0, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %6 = and i8 %xor1.i.iter0, 8, !dbg !185
  %mul23.i.iter0 = mul i8 %6, %1, !dbg !186
  %xor25.i.iter0 = xor i8 %mul23.i.iter0, %xor18.i.iter0, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %7 = lshr i8 %xor25.i.iter0, 4, !dbg !189
  %8 = lshr i8 %xor25.i.iter0, 3, !dbg !190
  %9 = and i8 %8, 14, !dbg !190
  %10 = xor i8 %7, %9, !dbg !191
  %xor25.masked.i.iter0 = and i8 %xor25.i.iter0, 15, !dbg !192
  %11 = xor i8 %10, %xor25.masked.i.iter0, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter0 = xor i8 %11, %ret.0.i1.iter0, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter0 = add nuw nsw i32 %i.0.i3.iter0, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter0 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter0, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter0 = icmp eq i32 %inc.i.iter0, 8, !dbg !202
  br i1 %exitcond.i.not.iter0, label %lincomb.exit.iter0, label %for.body.i.iter0, !dbg !203, !llvm.loop !204

lincomb.exit.iter0:                               ; preds = %for.body.i.iter0
  %ret.0.i.lcssa.iter0 = phi i8 [ %xor1.i.i.iter0, %for.body.i.iter0 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter0, ptr %c, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter0 = getelementptr inbounds nuw i8, ptr %c, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter0, !dbg !150

for.cond.i.preheader.iter0:                       ; preds = %for.cond1.preheader.iter0
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter0, !dbg !203

iter_0_end:                                       ; preds = %for.inc4.iter0
  br label %iter_1_start

iter_1_start:                                     ; preds = %iter_0_end
  br label %for.cond1.preheader.iter1

for.cond1.preheader.iter1:                        ; preds = %iter_1_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter1, !dbg !150

for.inc4.iter1:                                   ; preds = %lincomb.exit.iter1
  %c.addr.1.lcssa.iter1 = phi ptr [ %incdec.ptr.iter1, %lincomb.exit.iter1 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter1 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter0, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_1_end

for.body.i.iter1:                                 ; preds = %for.cond.i.preheader.iter1, %for.body.i.iter1
  %i.0.i3.iter1 = phi i32 [ 0, %for.cond.i.preheader.iter1 ], [ %inc.i.iter1, %for.body.i.iter1 ]
  %b.addr.0.i2.iter1 = phi ptr [ %b, %for.cond.i.preheader.iter1 ], [ %add.ptr.i.iter1, %for.body.i.iter1 ]
  %ret.0.i1.iter1 = phi i8 [ 0, %for.cond.i.preheader.iter1 ], [ %xor1.i.i.iter1, %for.body.i.iter1 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter1 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter0, i32 %i.0.i3.iter1, !dbg !164
  %12 = load i8, ptr %arrayidx.i.iter1, align 1, !dbg !164
  %13 = load i8, ptr %b.addr.0.i2.iter1, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %14 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter1 = xor i8 %12, %14, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %15 = trunc i8 %xor1.i.iter1 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %16 = and i8 %xor1.i.iter1, 2, !dbg !179
  %mul9.i.iter1 = mul i8 %16, %13, !dbg !180
  %conv10.i.iter1 = select i1 %15, i8 %13, i8 0, !dbg !177
  %xor11.i.iter1 = xor i8 %conv10.i.iter1, %mul9.i.iter1, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %17 = and i8 %xor1.i.iter1, 4, !dbg !182
  %mul16.i.iter1 = mul i8 %17, %13, !dbg !183
  %xor18.i.iter1 = xor i8 %mul16.i.iter1, %xor11.i.iter1, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %18 = and i8 %xor1.i.iter1, 8, !dbg !185
  %mul23.i.iter1 = mul i8 %18, %13, !dbg !186
  %xor25.i.iter1 = xor i8 %mul23.i.iter1, %xor18.i.iter1, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %19 = lshr i8 %xor25.i.iter1, 4, !dbg !189
  %20 = lshr i8 %xor25.i.iter1, 3, !dbg !190
  %21 = and i8 %20, 14, !dbg !190
  %22 = xor i8 %19, %21, !dbg !191
  %xor25.masked.i.iter1 = and i8 %xor25.i.iter1, 15, !dbg !192
  %23 = xor i8 %22, %xor25.masked.i.iter1, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter1 = xor i8 %23, %ret.0.i1.iter1, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter1 = add nuw nsw i32 %i.0.i3.iter1, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter1 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter1, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter1 = icmp eq i32 %inc.i.iter1, 8, !dbg !202
  br i1 %exitcond.i.not.iter1, label %lincomb.exit.iter1, label %for.body.i.iter1, !dbg !203, !llvm.loop !204

lincomb.exit.iter1:                               ; preds = %for.body.i.iter1
  %ret.0.i.lcssa.iter1 = phi i8 [ %xor1.i.i.iter1, %for.body.i.iter1 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter1, ptr %c.addr.1.lcssa.iter0, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter1 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter0, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter1, !dbg !150

for.cond.i.preheader.iter1:                       ; preds = %for.cond1.preheader.iter1
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter1, !dbg !203

iter_1_end:                                       ; preds = %for.inc4.iter1
  br label %iter_2_start

iter_2_start:                                     ; preds = %iter_1_end
  br label %for.cond1.preheader.iter2

for.cond1.preheader.iter2:                        ; preds = %iter_2_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter2, !dbg !150

for.inc4.iter2:                                   ; preds = %lincomb.exit.iter2
  %c.addr.1.lcssa.iter2 = phi ptr [ %incdec.ptr.iter2, %lincomb.exit.iter2 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter2 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter1, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_2_end

for.body.i.iter2:                                 ; preds = %for.cond.i.preheader.iter2, %for.body.i.iter2
  %i.0.i3.iter2 = phi i32 [ 0, %for.cond.i.preheader.iter2 ], [ %inc.i.iter2, %for.body.i.iter2 ]
  %b.addr.0.i2.iter2 = phi ptr [ %b, %for.cond.i.preheader.iter2 ], [ %add.ptr.i.iter2, %for.body.i.iter2 ]
  %ret.0.i1.iter2 = phi i8 [ 0, %for.cond.i.preheader.iter2 ], [ %xor1.i.i.iter2, %for.body.i.iter2 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter2 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter1, i32 %i.0.i3.iter2, !dbg !164
  %24 = load i8, ptr %arrayidx.i.iter2, align 1, !dbg !164
  %25 = load i8, ptr %b.addr.0.i2.iter2, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %26 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter2 = xor i8 %24, %26, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %27 = trunc i8 %xor1.i.iter2 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %28 = and i8 %xor1.i.iter2, 2, !dbg !179
  %mul9.i.iter2 = mul i8 %28, %25, !dbg !180
  %conv10.i.iter2 = select i1 %27, i8 %25, i8 0, !dbg !177
  %xor11.i.iter2 = xor i8 %conv10.i.iter2, %mul9.i.iter2, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %29 = and i8 %xor1.i.iter2, 4, !dbg !182
  %mul16.i.iter2 = mul i8 %29, %25, !dbg !183
  %xor18.i.iter2 = xor i8 %mul16.i.iter2, %xor11.i.iter2, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %30 = and i8 %xor1.i.iter2, 8, !dbg !185
  %mul23.i.iter2 = mul i8 %30, %25, !dbg !186
  %xor25.i.iter2 = xor i8 %mul23.i.iter2, %xor18.i.iter2, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %31 = lshr i8 %xor25.i.iter2, 4, !dbg !189
  %32 = lshr i8 %xor25.i.iter2, 3, !dbg !190
  %33 = and i8 %32, 14, !dbg !190
  %34 = xor i8 %31, %33, !dbg !191
  %xor25.masked.i.iter2 = and i8 %xor25.i.iter2, 15, !dbg !192
  %35 = xor i8 %34, %xor25.masked.i.iter2, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter2 = xor i8 %35, %ret.0.i1.iter2, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter2 = add nuw nsw i32 %i.0.i3.iter2, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter2 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter2, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter2 = icmp eq i32 %inc.i.iter2, 8, !dbg !202
  br i1 %exitcond.i.not.iter2, label %lincomb.exit.iter2, label %for.body.i.iter2, !dbg !203, !llvm.loop !204

lincomb.exit.iter2:                               ; preds = %for.body.i.iter2
  %ret.0.i.lcssa.iter2 = phi i8 [ %xor1.i.i.iter2, %for.body.i.iter2 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter2, ptr %c.addr.1.lcssa.iter1, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter2 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter1, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter2, !dbg !150

for.cond.i.preheader.iter2:                       ; preds = %for.cond1.preheader.iter2
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter2, !dbg !203

iter_2_end:                                       ; preds = %for.inc4.iter2
  br label %iter_3_start

iter_3_start:                                     ; preds = %iter_2_end
  br label %for.cond1.preheader.iter3

for.cond1.preheader.iter3:                        ; preds = %iter_3_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter3, !dbg !150

for.inc4.iter3:                                   ; preds = %lincomb.exit.iter3
  %c.addr.1.lcssa.iter3 = phi ptr [ %incdec.ptr.iter3, %lincomb.exit.iter3 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter3 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter2, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_3_end

for.body.i.iter3:                                 ; preds = %for.cond.i.preheader.iter3, %for.body.i.iter3
  %i.0.i3.iter3 = phi i32 [ 0, %for.cond.i.preheader.iter3 ], [ %inc.i.iter3, %for.body.i.iter3 ]
  %b.addr.0.i2.iter3 = phi ptr [ %b, %for.cond.i.preheader.iter3 ], [ %add.ptr.i.iter3, %for.body.i.iter3 ]
  %ret.0.i1.iter3 = phi i8 [ 0, %for.cond.i.preheader.iter3 ], [ %xor1.i.i.iter3, %for.body.i.iter3 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter3 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter2, i32 %i.0.i3.iter3, !dbg !164
  %36 = load i8, ptr %arrayidx.i.iter3, align 1, !dbg !164
  %37 = load i8, ptr %b.addr.0.i2.iter3, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %38 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter3 = xor i8 %36, %38, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %39 = trunc i8 %xor1.i.iter3 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %40 = and i8 %xor1.i.iter3, 2, !dbg !179
  %mul9.i.iter3 = mul i8 %40, %37, !dbg !180
  %conv10.i.iter3 = select i1 %39, i8 %37, i8 0, !dbg !177
  %xor11.i.iter3 = xor i8 %conv10.i.iter3, %mul9.i.iter3, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %41 = and i8 %xor1.i.iter3, 4, !dbg !182
  %mul16.i.iter3 = mul i8 %41, %37, !dbg !183
  %xor18.i.iter3 = xor i8 %mul16.i.iter3, %xor11.i.iter3, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %42 = and i8 %xor1.i.iter3, 8, !dbg !185
  %mul23.i.iter3 = mul i8 %42, %37, !dbg !186
  %xor25.i.iter3 = xor i8 %mul23.i.iter3, %xor18.i.iter3, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %43 = lshr i8 %xor25.i.iter3, 4, !dbg !189
  %44 = lshr i8 %xor25.i.iter3, 3, !dbg !190
  %45 = and i8 %44, 14, !dbg !190
  %46 = xor i8 %43, %45, !dbg !191
  %xor25.masked.i.iter3 = and i8 %xor25.i.iter3, 15, !dbg !192
  %47 = xor i8 %46, %xor25.masked.i.iter3, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter3 = xor i8 %47, %ret.0.i1.iter3, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter3 = add nuw nsw i32 %i.0.i3.iter3, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter3 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter3, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter3 = icmp eq i32 %inc.i.iter3, 8, !dbg !202
  br i1 %exitcond.i.not.iter3, label %lincomb.exit.iter3, label %for.body.i.iter3, !dbg !203, !llvm.loop !204

lincomb.exit.iter3:                               ; preds = %for.body.i.iter3
  %ret.0.i.lcssa.iter3 = phi i8 [ %xor1.i.i.iter3, %for.body.i.iter3 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter3, ptr %c.addr.1.lcssa.iter2, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter3 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter2, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter3, !dbg !150

for.cond.i.preheader.iter3:                       ; preds = %for.cond1.preheader.iter3
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter3, !dbg !203

iter_3_end:                                       ; preds = %for.inc4.iter3
  br label %iter_4_start

iter_4_start:                                     ; preds = %iter_3_end
  br label %for.cond1.preheader.iter4

for.cond1.preheader.iter4:                        ; preds = %iter_4_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter4, !dbg !150

for.inc4.iter4:                                   ; preds = %lincomb.exit.iter4
  %c.addr.1.lcssa.iter4 = phi ptr [ %incdec.ptr.iter4, %lincomb.exit.iter4 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter4 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter3, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_4_end

for.body.i.iter4:                                 ; preds = %for.cond.i.preheader.iter4, %for.body.i.iter4
  %i.0.i3.iter4 = phi i32 [ 0, %for.cond.i.preheader.iter4 ], [ %inc.i.iter4, %for.body.i.iter4 ]
  %b.addr.0.i2.iter4 = phi ptr [ %b, %for.cond.i.preheader.iter4 ], [ %add.ptr.i.iter4, %for.body.i.iter4 ]
  %ret.0.i1.iter4 = phi i8 [ 0, %for.cond.i.preheader.iter4 ], [ %xor1.i.i.iter4, %for.body.i.iter4 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter4 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter3, i32 %i.0.i3.iter4, !dbg !164
  %48 = load i8, ptr %arrayidx.i.iter4, align 1, !dbg !164
  %49 = load i8, ptr %b.addr.0.i2.iter4, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %50 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter4 = xor i8 %48, %50, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %51 = trunc i8 %xor1.i.iter4 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %52 = and i8 %xor1.i.iter4, 2, !dbg !179
  %mul9.i.iter4 = mul i8 %52, %49, !dbg !180
  %conv10.i.iter4 = select i1 %51, i8 %49, i8 0, !dbg !177
  %xor11.i.iter4 = xor i8 %conv10.i.iter4, %mul9.i.iter4, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %53 = and i8 %xor1.i.iter4, 4, !dbg !182
  %mul16.i.iter4 = mul i8 %53, %49, !dbg !183
  %xor18.i.iter4 = xor i8 %mul16.i.iter4, %xor11.i.iter4, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %54 = and i8 %xor1.i.iter4, 8, !dbg !185
  %mul23.i.iter4 = mul i8 %54, %49, !dbg !186
  %xor25.i.iter4 = xor i8 %mul23.i.iter4, %xor18.i.iter4, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %55 = lshr i8 %xor25.i.iter4, 4, !dbg !189
  %56 = lshr i8 %xor25.i.iter4, 3, !dbg !190
  %57 = and i8 %56, 14, !dbg !190
  %58 = xor i8 %55, %57, !dbg !191
  %xor25.masked.i.iter4 = and i8 %xor25.i.iter4, 15, !dbg !192
  %59 = xor i8 %58, %xor25.masked.i.iter4, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter4 = xor i8 %59, %ret.0.i1.iter4, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter4 = add nuw nsw i32 %i.0.i3.iter4, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter4 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter4, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter4 = icmp eq i32 %inc.i.iter4, 8, !dbg !202
  br i1 %exitcond.i.not.iter4, label %lincomb.exit.iter4, label %for.body.i.iter4, !dbg !203, !llvm.loop !204

lincomb.exit.iter4:                               ; preds = %for.body.i.iter4
  %ret.0.i.lcssa.iter4 = phi i8 [ %xor1.i.i.iter4, %for.body.i.iter4 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter4, ptr %c.addr.1.lcssa.iter3, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter4 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter3, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter4, !dbg !150

for.cond.i.preheader.iter4:                       ; preds = %for.cond1.preheader.iter4
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter4, !dbg !203

iter_4_end:                                       ; preds = %for.inc4.iter4
  br label %iter_5_start

iter_5_start:                                     ; preds = %iter_4_end
  br label %for.cond1.preheader.iter5

for.cond1.preheader.iter5:                        ; preds = %iter_5_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter5, !dbg !150

for.inc4.iter5:                                   ; preds = %lincomb.exit.iter5
  %c.addr.1.lcssa.iter5 = phi ptr [ %incdec.ptr.iter5, %lincomb.exit.iter5 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter5 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter4, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_5_end

for.body.i.iter5:                                 ; preds = %for.cond.i.preheader.iter5, %for.body.i.iter5
  %i.0.i3.iter5 = phi i32 [ 0, %for.cond.i.preheader.iter5 ], [ %inc.i.iter5, %for.body.i.iter5 ]
  %b.addr.0.i2.iter5 = phi ptr [ %b, %for.cond.i.preheader.iter5 ], [ %add.ptr.i.iter5, %for.body.i.iter5 ]
  %ret.0.i1.iter5 = phi i8 [ 0, %for.cond.i.preheader.iter5 ], [ %xor1.i.i.iter5, %for.body.i.iter5 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter5 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter4, i32 %i.0.i3.iter5, !dbg !164
  %60 = load i8, ptr %arrayidx.i.iter5, align 1, !dbg !164
  %61 = load i8, ptr %b.addr.0.i2.iter5, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %62 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter5 = xor i8 %60, %62, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %63 = trunc i8 %xor1.i.iter5 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %64 = and i8 %xor1.i.iter5, 2, !dbg !179
  %mul9.i.iter5 = mul i8 %64, %61, !dbg !180
  %conv10.i.iter5 = select i1 %63, i8 %61, i8 0, !dbg !177
  %xor11.i.iter5 = xor i8 %conv10.i.iter5, %mul9.i.iter5, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %65 = and i8 %xor1.i.iter5, 4, !dbg !182
  %mul16.i.iter5 = mul i8 %65, %61, !dbg !183
  %xor18.i.iter5 = xor i8 %mul16.i.iter5, %xor11.i.iter5, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %66 = and i8 %xor1.i.iter5, 8, !dbg !185
  %mul23.i.iter5 = mul i8 %66, %61, !dbg !186
  %xor25.i.iter5 = xor i8 %mul23.i.iter5, %xor18.i.iter5, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %67 = lshr i8 %xor25.i.iter5, 4, !dbg !189
  %68 = lshr i8 %xor25.i.iter5, 3, !dbg !190
  %69 = and i8 %68, 14, !dbg !190
  %70 = xor i8 %67, %69, !dbg !191
  %xor25.masked.i.iter5 = and i8 %xor25.i.iter5, 15, !dbg !192
  %71 = xor i8 %70, %xor25.masked.i.iter5, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter5 = xor i8 %71, %ret.0.i1.iter5, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter5 = add nuw nsw i32 %i.0.i3.iter5, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter5 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter5, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter5 = icmp eq i32 %inc.i.iter5, 8, !dbg !202
  br i1 %exitcond.i.not.iter5, label %lincomb.exit.iter5, label %for.body.i.iter5, !dbg !203, !llvm.loop !204

lincomb.exit.iter5:                               ; preds = %for.body.i.iter5
  %ret.0.i.lcssa.iter5 = phi i8 [ %xor1.i.i.iter5, %for.body.i.iter5 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter5, ptr %c.addr.1.lcssa.iter4, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter5 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter4, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter5, !dbg !150

for.cond.i.preheader.iter5:                       ; preds = %for.cond1.preheader.iter5
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter5, !dbg !203

iter_5_end:                                       ; preds = %for.inc4.iter5
  br label %iter_6_start

iter_6_start:                                     ; preds = %iter_5_end
  br label %for.cond1.preheader.iter6

for.cond1.preheader.iter6:                        ; preds = %iter_6_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter6, !dbg !150

for.inc4.iter6:                                   ; preds = %lincomb.exit.iter6
  %c.addr.1.lcssa.iter6 = phi ptr [ %incdec.ptr.iter6, %lincomb.exit.iter6 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter6 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter5, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_6_end

for.body.i.iter6:                                 ; preds = %for.cond.i.preheader.iter6, %for.body.i.iter6
  %i.0.i3.iter6 = phi i32 [ 0, %for.cond.i.preheader.iter6 ], [ %inc.i.iter6, %for.body.i.iter6 ]
  %b.addr.0.i2.iter6 = phi ptr [ %b, %for.cond.i.preheader.iter6 ], [ %add.ptr.i.iter6, %for.body.i.iter6 ]
  %ret.0.i1.iter6 = phi i8 [ 0, %for.cond.i.preheader.iter6 ], [ %xor1.i.i.iter6, %for.body.i.iter6 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter6 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter5, i32 %i.0.i3.iter6, !dbg !164
  %72 = load i8, ptr %arrayidx.i.iter6, align 1, !dbg !164
  %73 = load i8, ptr %b.addr.0.i2.iter6, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %74 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter6 = xor i8 %72, %74, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %75 = trunc i8 %xor1.i.iter6 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %76 = and i8 %xor1.i.iter6, 2, !dbg !179
  %mul9.i.iter6 = mul i8 %76, %73, !dbg !180
  %conv10.i.iter6 = select i1 %75, i8 %73, i8 0, !dbg !177
  %xor11.i.iter6 = xor i8 %conv10.i.iter6, %mul9.i.iter6, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %77 = and i8 %xor1.i.iter6, 4, !dbg !182
  %mul16.i.iter6 = mul i8 %77, %73, !dbg !183
  %xor18.i.iter6 = xor i8 %mul16.i.iter6, %xor11.i.iter6, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %78 = and i8 %xor1.i.iter6, 8, !dbg !185
  %mul23.i.iter6 = mul i8 %78, %73, !dbg !186
  %xor25.i.iter6 = xor i8 %mul23.i.iter6, %xor18.i.iter6, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %79 = lshr i8 %xor25.i.iter6, 4, !dbg !189
  %80 = lshr i8 %xor25.i.iter6, 3, !dbg !190
  %81 = and i8 %80, 14, !dbg !190
  %82 = xor i8 %79, %81, !dbg !191
  %xor25.masked.i.iter6 = and i8 %xor25.i.iter6, 15, !dbg !192
  %83 = xor i8 %82, %xor25.masked.i.iter6, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter6 = xor i8 %83, %ret.0.i1.iter6, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter6 = add nuw nsw i32 %i.0.i3.iter6, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter6 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter6, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter6 = icmp eq i32 %inc.i.iter6, 8, !dbg !202
  br i1 %exitcond.i.not.iter6, label %lincomb.exit.iter6, label %for.body.i.iter6, !dbg !203, !llvm.loop !204

lincomb.exit.iter6:                               ; preds = %for.body.i.iter6
  %ret.0.i.lcssa.iter6 = phi i8 [ %xor1.i.i.iter6, %for.body.i.iter6 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter6, ptr %c.addr.1.lcssa.iter5, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter6 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter5, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter6, !dbg !150

for.cond.i.preheader.iter6:                       ; preds = %for.cond1.preheader.iter6
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter6, !dbg !203

iter_6_end:                                       ; preds = %for.inc4.iter6
  br label %iter_7_start

iter_7_start:                                     ; preds = %iter_6_end
  br label %for.cond1.preheader.iter7

for.cond1.preheader.iter7:                        ; preds = %iter_7_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter7, !dbg !150

for.inc4.iter7:                                   ; preds = %lincomb.exit.iter7
  %c.addr.1.lcssa.iter7 = phi ptr [ %incdec.ptr.iter7, %lincomb.exit.iter7 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter7 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter6, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_7_end

for.body.i.iter7:                                 ; preds = %for.cond.i.preheader.iter7, %for.body.i.iter7
  %i.0.i3.iter7 = phi i32 [ 0, %for.cond.i.preheader.iter7 ], [ %inc.i.iter7, %for.body.i.iter7 ]
  %b.addr.0.i2.iter7 = phi ptr [ %b, %for.cond.i.preheader.iter7 ], [ %add.ptr.i.iter7, %for.body.i.iter7 ]
  %ret.0.i1.iter7 = phi i8 [ 0, %for.cond.i.preheader.iter7 ], [ %xor1.i.i.iter7, %for.body.i.iter7 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter7 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter6, i32 %i.0.i3.iter7, !dbg !164
  %84 = load i8, ptr %arrayidx.i.iter7, align 1, !dbg !164
  %85 = load i8, ptr %b.addr.0.i2.iter7, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %86 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter7 = xor i8 %84, %86, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %87 = trunc i8 %xor1.i.iter7 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %88 = and i8 %xor1.i.iter7, 2, !dbg !179
  %mul9.i.iter7 = mul i8 %88, %85, !dbg !180
  %conv10.i.iter7 = select i1 %87, i8 %85, i8 0, !dbg !177
  %xor11.i.iter7 = xor i8 %conv10.i.iter7, %mul9.i.iter7, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %89 = and i8 %xor1.i.iter7, 4, !dbg !182
  %mul16.i.iter7 = mul i8 %89, %85, !dbg !183
  %xor18.i.iter7 = xor i8 %mul16.i.iter7, %xor11.i.iter7, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %90 = and i8 %xor1.i.iter7, 8, !dbg !185
  %mul23.i.iter7 = mul i8 %90, %85, !dbg !186
  %xor25.i.iter7 = xor i8 %mul23.i.iter7, %xor18.i.iter7, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %91 = lshr i8 %xor25.i.iter7, 4, !dbg !189
  %92 = lshr i8 %xor25.i.iter7, 3, !dbg !190
  %93 = and i8 %92, 14, !dbg !190
  %94 = xor i8 %91, %93, !dbg !191
  %xor25.masked.i.iter7 = and i8 %xor25.i.iter7, 15, !dbg !192
  %95 = xor i8 %94, %xor25.masked.i.iter7, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter7 = xor i8 %95, %ret.0.i1.iter7, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter7 = add nuw nsw i32 %i.0.i3.iter7, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter7 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter7, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter7 = icmp eq i32 %inc.i.iter7, 8, !dbg !202
  br i1 %exitcond.i.not.iter7, label %lincomb.exit.iter7, label %for.body.i.iter7, !dbg !203, !llvm.loop !204

lincomb.exit.iter7:                               ; preds = %for.body.i.iter7
  %ret.0.i.lcssa.iter7 = phi i8 [ %xor1.i.i.iter7, %for.body.i.iter7 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter7, ptr %c.addr.1.lcssa.iter6, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter7 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter6, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter7, !dbg !150

for.cond.i.preheader.iter7:                       ; preds = %for.cond1.preheader.iter7
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter7, !dbg !203

iter_7_end:                                       ; preds = %for.inc4.iter7
  br label %iter_8_start

iter_8_start:                                     ; preds = %iter_7_end
  br label %for.cond1.preheader.iter8

for.cond1.preheader.iter8:                        ; preds = %iter_8_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter8, !dbg !150

for.inc4.iter8:                                   ; preds = %lincomb.exit.iter8
  %c.addr.1.lcssa.iter8 = phi ptr [ %incdec.ptr.iter8, %lincomb.exit.iter8 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter8 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter7, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_8_end

for.body.i.iter8:                                 ; preds = %for.cond.i.preheader.iter8, %for.body.i.iter8
  %i.0.i3.iter8 = phi i32 [ 0, %for.cond.i.preheader.iter8 ], [ %inc.i.iter8, %for.body.i.iter8 ]
  %b.addr.0.i2.iter8 = phi ptr [ %b, %for.cond.i.preheader.iter8 ], [ %add.ptr.i.iter8, %for.body.i.iter8 ]
  %ret.0.i1.iter8 = phi i8 [ 0, %for.cond.i.preheader.iter8 ], [ %xor1.i.i.iter8, %for.body.i.iter8 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter8 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter7, i32 %i.0.i3.iter8, !dbg !164
  %96 = load i8, ptr %arrayidx.i.iter8, align 1, !dbg !164
  %97 = load i8, ptr %b.addr.0.i2.iter8, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %98 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter8 = xor i8 %96, %98, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %99 = trunc i8 %xor1.i.iter8 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %100 = and i8 %xor1.i.iter8, 2, !dbg !179
  %mul9.i.iter8 = mul i8 %100, %97, !dbg !180
  %conv10.i.iter8 = select i1 %99, i8 %97, i8 0, !dbg !177
  %xor11.i.iter8 = xor i8 %conv10.i.iter8, %mul9.i.iter8, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %101 = and i8 %xor1.i.iter8, 4, !dbg !182
  %mul16.i.iter8 = mul i8 %101, %97, !dbg !183
  %xor18.i.iter8 = xor i8 %mul16.i.iter8, %xor11.i.iter8, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %102 = and i8 %xor1.i.iter8, 8, !dbg !185
  %mul23.i.iter8 = mul i8 %102, %97, !dbg !186
  %xor25.i.iter8 = xor i8 %mul23.i.iter8, %xor18.i.iter8, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %103 = lshr i8 %xor25.i.iter8, 4, !dbg !189
  %104 = lshr i8 %xor25.i.iter8, 3, !dbg !190
  %105 = and i8 %104, 14, !dbg !190
  %106 = xor i8 %103, %105, !dbg !191
  %xor25.masked.i.iter8 = and i8 %xor25.i.iter8, 15, !dbg !192
  %107 = xor i8 %106, %xor25.masked.i.iter8, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter8 = xor i8 %107, %ret.0.i1.iter8, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter8 = add nuw nsw i32 %i.0.i3.iter8, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter8 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter8, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter8 = icmp eq i32 %inc.i.iter8, 8, !dbg !202
  br i1 %exitcond.i.not.iter8, label %lincomb.exit.iter8, label %for.body.i.iter8, !dbg !203, !llvm.loop !204

lincomb.exit.iter8:                               ; preds = %for.body.i.iter8
  %ret.0.i.lcssa.iter8 = phi i8 [ %xor1.i.i.iter8, %for.body.i.iter8 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter8, ptr %c.addr.1.lcssa.iter7, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter8 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter7, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter8, !dbg !150

for.cond.i.preheader.iter8:                       ; preds = %for.cond1.preheader.iter8
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter8, !dbg !203

iter_8_end:                                       ; preds = %for.inc4.iter8
  br label %iter_9_start

iter_9_start:                                     ; preds = %iter_8_end
  br label %for.cond1.preheader.iter9

for.cond1.preheader.iter9:                        ; preds = %iter_9_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter9, !dbg !150

for.inc4.iter9:                                   ; preds = %lincomb.exit.iter9
  %c.addr.1.lcssa.iter9 = phi ptr [ %incdec.ptr.iter9, %lincomb.exit.iter9 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter9 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter8, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_9_end

for.body.i.iter9:                                 ; preds = %for.cond.i.preheader.iter9, %for.body.i.iter9
  %i.0.i3.iter9 = phi i32 [ 0, %for.cond.i.preheader.iter9 ], [ %inc.i.iter9, %for.body.i.iter9 ]
  %b.addr.0.i2.iter9 = phi ptr [ %b, %for.cond.i.preheader.iter9 ], [ %add.ptr.i.iter9, %for.body.i.iter9 ]
  %ret.0.i1.iter9 = phi i8 [ 0, %for.cond.i.preheader.iter9 ], [ %xor1.i.i.iter9, %for.body.i.iter9 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter9 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter8, i32 %i.0.i3.iter9, !dbg !164
  %108 = load i8, ptr %arrayidx.i.iter9, align 1, !dbg !164
  %109 = load i8, ptr %b.addr.0.i2.iter9, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %110 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter9 = xor i8 %108, %110, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %111 = trunc i8 %xor1.i.iter9 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %112 = and i8 %xor1.i.iter9, 2, !dbg !179
  %mul9.i.iter9 = mul i8 %112, %109, !dbg !180
  %conv10.i.iter9 = select i1 %111, i8 %109, i8 0, !dbg !177
  %xor11.i.iter9 = xor i8 %conv10.i.iter9, %mul9.i.iter9, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %113 = and i8 %xor1.i.iter9, 4, !dbg !182
  %mul16.i.iter9 = mul i8 %113, %109, !dbg !183
  %xor18.i.iter9 = xor i8 %mul16.i.iter9, %xor11.i.iter9, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %114 = and i8 %xor1.i.iter9, 8, !dbg !185
  %mul23.i.iter9 = mul i8 %114, %109, !dbg !186
  %xor25.i.iter9 = xor i8 %mul23.i.iter9, %xor18.i.iter9, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %115 = lshr i8 %xor25.i.iter9, 4, !dbg !189
  %116 = lshr i8 %xor25.i.iter9, 3, !dbg !190
  %117 = and i8 %116, 14, !dbg !190
  %118 = xor i8 %115, %117, !dbg !191
  %xor25.masked.i.iter9 = and i8 %xor25.i.iter9, 15, !dbg !192
  %119 = xor i8 %118, %xor25.masked.i.iter9, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter9 = xor i8 %119, %ret.0.i1.iter9, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter9 = add nuw nsw i32 %i.0.i3.iter9, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter9 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter9, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter9 = icmp eq i32 %inc.i.iter9, 8, !dbg !202
  br i1 %exitcond.i.not.iter9, label %lincomb.exit.iter9, label %for.body.i.iter9, !dbg !203, !llvm.loop !204

lincomb.exit.iter9:                               ; preds = %for.body.i.iter9
  %ret.0.i.lcssa.iter9 = phi i8 [ %xor1.i.i.iter9, %for.body.i.iter9 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter9, ptr %c.addr.1.lcssa.iter8, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter9 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter8, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter9, !dbg !150

for.cond.i.preheader.iter9:                       ; preds = %for.cond1.preheader.iter9
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter9, !dbg !203

iter_9_end:                                       ; preds = %for.inc4.iter9
  br label %iter_10_start

iter_10_start:                                    ; preds = %iter_9_end
  br label %for.cond1.preheader.iter10

for.cond1.preheader.iter10:                       ; preds = %iter_10_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter10, !dbg !150

for.inc4.iter10:                                  ; preds = %lincomb.exit.iter10
  %c.addr.1.lcssa.iter10 = phi ptr [ %incdec.ptr.iter10, %lincomb.exit.iter10 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter10 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter9, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_10_end

for.body.i.iter10:                                ; preds = %for.cond.i.preheader.iter10, %for.body.i.iter10
  %i.0.i3.iter10 = phi i32 [ 0, %for.cond.i.preheader.iter10 ], [ %inc.i.iter10, %for.body.i.iter10 ]
  %b.addr.0.i2.iter10 = phi ptr [ %b, %for.cond.i.preheader.iter10 ], [ %add.ptr.i.iter10, %for.body.i.iter10 ]
  %ret.0.i1.iter10 = phi i8 [ 0, %for.cond.i.preheader.iter10 ], [ %xor1.i.i.iter10, %for.body.i.iter10 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter10 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter9, i32 %i.0.i3.iter10, !dbg !164
  %120 = load i8, ptr %arrayidx.i.iter10, align 1, !dbg !164
  %121 = load i8, ptr %b.addr.0.i2.iter10, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %122 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter10 = xor i8 %120, %122, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %123 = trunc i8 %xor1.i.iter10 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %124 = and i8 %xor1.i.iter10, 2, !dbg !179
  %mul9.i.iter10 = mul i8 %124, %121, !dbg !180
  %conv10.i.iter10 = select i1 %123, i8 %121, i8 0, !dbg !177
  %xor11.i.iter10 = xor i8 %conv10.i.iter10, %mul9.i.iter10, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %125 = and i8 %xor1.i.iter10, 4, !dbg !182
  %mul16.i.iter10 = mul i8 %125, %121, !dbg !183
  %xor18.i.iter10 = xor i8 %mul16.i.iter10, %xor11.i.iter10, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %126 = and i8 %xor1.i.iter10, 8, !dbg !185
  %mul23.i.iter10 = mul i8 %126, %121, !dbg !186
  %xor25.i.iter10 = xor i8 %mul23.i.iter10, %xor18.i.iter10, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %127 = lshr i8 %xor25.i.iter10, 4, !dbg !189
  %128 = lshr i8 %xor25.i.iter10, 3, !dbg !190
  %129 = and i8 %128, 14, !dbg !190
  %130 = xor i8 %127, %129, !dbg !191
  %xor25.masked.i.iter10 = and i8 %xor25.i.iter10, 15, !dbg !192
  %131 = xor i8 %130, %xor25.masked.i.iter10, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter10 = xor i8 %131, %ret.0.i1.iter10, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter10 = add nuw nsw i32 %i.0.i3.iter10, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter10 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter10, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter10 = icmp eq i32 %inc.i.iter10, 8, !dbg !202
  br i1 %exitcond.i.not.iter10, label %lincomb.exit.iter10, label %for.body.i.iter10, !dbg !203, !llvm.loop !204

lincomb.exit.iter10:                              ; preds = %for.body.i.iter10
  %ret.0.i.lcssa.iter10 = phi i8 [ %xor1.i.i.iter10, %for.body.i.iter10 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter10, ptr %c.addr.1.lcssa.iter9, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter10 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter9, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter10, !dbg !150

for.cond.i.preheader.iter10:                      ; preds = %for.cond1.preheader.iter10
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter10, !dbg !203

iter_10_end:                                      ; preds = %for.inc4.iter10
  br label %iter_11_start

iter_11_start:                                    ; preds = %iter_10_end
  br label %for.cond1.preheader.iter11

for.cond1.preheader.iter11:                       ; preds = %iter_11_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter11, !dbg !150

for.inc4.iter11:                                  ; preds = %lincomb.exit.iter11
  %c.addr.1.lcssa.iter11 = phi ptr [ %incdec.ptr.iter11, %lincomb.exit.iter11 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter11 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter10, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_11_end

for.body.i.iter11:                                ; preds = %for.cond.i.preheader.iter11, %for.body.i.iter11
  %i.0.i3.iter11 = phi i32 [ 0, %for.cond.i.preheader.iter11 ], [ %inc.i.iter11, %for.body.i.iter11 ]
  %b.addr.0.i2.iter11 = phi ptr [ %b, %for.cond.i.preheader.iter11 ], [ %add.ptr.i.iter11, %for.body.i.iter11 ]
  %ret.0.i1.iter11 = phi i8 [ 0, %for.cond.i.preheader.iter11 ], [ %xor1.i.i.iter11, %for.body.i.iter11 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter11 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter10, i32 %i.0.i3.iter11, !dbg !164
  %132 = load i8, ptr %arrayidx.i.iter11, align 1, !dbg !164
  %133 = load i8, ptr %b.addr.0.i2.iter11, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %134 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter11 = xor i8 %132, %134, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %135 = trunc i8 %xor1.i.iter11 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %136 = and i8 %xor1.i.iter11, 2, !dbg !179
  %mul9.i.iter11 = mul i8 %136, %133, !dbg !180
  %conv10.i.iter11 = select i1 %135, i8 %133, i8 0, !dbg !177
  %xor11.i.iter11 = xor i8 %conv10.i.iter11, %mul9.i.iter11, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %137 = and i8 %xor1.i.iter11, 4, !dbg !182
  %mul16.i.iter11 = mul i8 %137, %133, !dbg !183
  %xor18.i.iter11 = xor i8 %mul16.i.iter11, %xor11.i.iter11, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %138 = and i8 %xor1.i.iter11, 8, !dbg !185
  %mul23.i.iter11 = mul i8 %138, %133, !dbg !186
  %xor25.i.iter11 = xor i8 %mul23.i.iter11, %xor18.i.iter11, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %139 = lshr i8 %xor25.i.iter11, 4, !dbg !189
  %140 = lshr i8 %xor25.i.iter11, 3, !dbg !190
  %141 = and i8 %140, 14, !dbg !190
  %142 = xor i8 %139, %141, !dbg !191
  %xor25.masked.i.iter11 = and i8 %xor25.i.iter11, 15, !dbg !192
  %143 = xor i8 %142, %xor25.masked.i.iter11, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter11 = xor i8 %143, %ret.0.i1.iter11, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter11 = add nuw nsw i32 %i.0.i3.iter11, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter11 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter11, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter11 = icmp eq i32 %inc.i.iter11, 8, !dbg !202
  br i1 %exitcond.i.not.iter11, label %lincomb.exit.iter11, label %for.body.i.iter11, !dbg !203, !llvm.loop !204

lincomb.exit.iter11:                              ; preds = %for.body.i.iter11
  %ret.0.i.lcssa.iter11 = phi i8 [ %xor1.i.i.iter11, %for.body.i.iter11 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter11, ptr %c.addr.1.lcssa.iter10, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter11 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter10, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter11, !dbg !150

for.cond.i.preheader.iter11:                      ; preds = %for.cond1.preheader.iter11
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter11, !dbg !203

iter_11_end:                                      ; preds = %for.inc4.iter11
  br label %iter_12_start

iter_12_start:                                    ; preds = %iter_11_end
  br label %for.cond1.preheader.iter12

for.cond1.preheader.iter12:                       ; preds = %iter_12_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter12, !dbg !150

for.inc4.iter12:                                  ; preds = %lincomb.exit.iter12
  %c.addr.1.lcssa.iter12 = phi ptr [ %incdec.ptr.iter12, %lincomb.exit.iter12 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter12 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter11, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_12_end

for.body.i.iter12:                                ; preds = %for.cond.i.preheader.iter12, %for.body.i.iter12
  %i.0.i3.iter12 = phi i32 [ 0, %for.cond.i.preheader.iter12 ], [ %inc.i.iter12, %for.body.i.iter12 ]
  %b.addr.0.i2.iter12 = phi ptr [ %b, %for.cond.i.preheader.iter12 ], [ %add.ptr.i.iter12, %for.body.i.iter12 ]
  %ret.0.i1.iter12 = phi i8 [ 0, %for.cond.i.preheader.iter12 ], [ %xor1.i.i.iter12, %for.body.i.iter12 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter12 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter11, i32 %i.0.i3.iter12, !dbg !164
  %144 = load i8, ptr %arrayidx.i.iter12, align 1, !dbg !164
  %145 = load i8, ptr %b.addr.0.i2.iter12, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %146 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter12 = xor i8 %144, %146, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %147 = trunc i8 %xor1.i.iter12 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %148 = and i8 %xor1.i.iter12, 2, !dbg !179
  %mul9.i.iter12 = mul i8 %148, %145, !dbg !180
  %conv10.i.iter12 = select i1 %147, i8 %145, i8 0, !dbg !177
  %xor11.i.iter12 = xor i8 %conv10.i.iter12, %mul9.i.iter12, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %149 = and i8 %xor1.i.iter12, 4, !dbg !182
  %mul16.i.iter12 = mul i8 %149, %145, !dbg !183
  %xor18.i.iter12 = xor i8 %mul16.i.iter12, %xor11.i.iter12, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %150 = and i8 %xor1.i.iter12, 8, !dbg !185
  %mul23.i.iter12 = mul i8 %150, %145, !dbg !186
  %xor25.i.iter12 = xor i8 %mul23.i.iter12, %xor18.i.iter12, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %151 = lshr i8 %xor25.i.iter12, 4, !dbg !189
  %152 = lshr i8 %xor25.i.iter12, 3, !dbg !190
  %153 = and i8 %152, 14, !dbg !190
  %154 = xor i8 %151, %153, !dbg !191
  %xor25.masked.i.iter12 = and i8 %xor25.i.iter12, 15, !dbg !192
  %155 = xor i8 %154, %xor25.masked.i.iter12, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter12 = xor i8 %155, %ret.0.i1.iter12, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter12 = add nuw nsw i32 %i.0.i3.iter12, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter12 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter12, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter12 = icmp eq i32 %inc.i.iter12, 8, !dbg !202
  br i1 %exitcond.i.not.iter12, label %lincomb.exit.iter12, label %for.body.i.iter12, !dbg !203, !llvm.loop !204

lincomb.exit.iter12:                              ; preds = %for.body.i.iter12
  %ret.0.i.lcssa.iter12 = phi i8 [ %xor1.i.i.iter12, %for.body.i.iter12 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter12, ptr %c.addr.1.lcssa.iter11, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter12 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter11, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter12, !dbg !150

for.cond.i.preheader.iter12:                      ; preds = %for.cond1.preheader.iter12
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter12, !dbg !203

iter_12_end:                                      ; preds = %for.inc4.iter12
  br label %iter_13_start

iter_13_start:                                    ; preds = %iter_12_end
  br label %for.cond1.preheader.iter13

for.cond1.preheader.iter13:                       ; preds = %iter_13_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter13, !dbg !150

for.inc4.iter13:                                  ; preds = %lincomb.exit.iter13
  %c.addr.1.lcssa.iter13 = phi ptr [ %incdec.ptr.iter13, %lincomb.exit.iter13 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter13 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter12, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_13_end

for.body.i.iter13:                                ; preds = %for.cond.i.preheader.iter13, %for.body.i.iter13
  %i.0.i3.iter13 = phi i32 [ 0, %for.cond.i.preheader.iter13 ], [ %inc.i.iter13, %for.body.i.iter13 ]
  %b.addr.0.i2.iter13 = phi ptr [ %b, %for.cond.i.preheader.iter13 ], [ %add.ptr.i.iter13, %for.body.i.iter13 ]
  %ret.0.i1.iter13 = phi i8 [ 0, %for.cond.i.preheader.iter13 ], [ %xor1.i.i.iter13, %for.body.i.iter13 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter13 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter12, i32 %i.0.i3.iter13, !dbg !164
  %156 = load i8, ptr %arrayidx.i.iter13, align 1, !dbg !164
  %157 = load i8, ptr %b.addr.0.i2.iter13, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %158 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter13 = xor i8 %156, %158, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %159 = trunc i8 %xor1.i.iter13 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %160 = and i8 %xor1.i.iter13, 2, !dbg !179
  %mul9.i.iter13 = mul i8 %160, %157, !dbg !180
  %conv10.i.iter13 = select i1 %159, i8 %157, i8 0, !dbg !177
  %xor11.i.iter13 = xor i8 %conv10.i.iter13, %mul9.i.iter13, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %161 = and i8 %xor1.i.iter13, 4, !dbg !182
  %mul16.i.iter13 = mul i8 %161, %157, !dbg !183
  %xor18.i.iter13 = xor i8 %mul16.i.iter13, %xor11.i.iter13, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %162 = and i8 %xor1.i.iter13, 8, !dbg !185
  %mul23.i.iter13 = mul i8 %162, %157, !dbg !186
  %xor25.i.iter13 = xor i8 %mul23.i.iter13, %xor18.i.iter13, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %163 = lshr i8 %xor25.i.iter13, 4, !dbg !189
  %164 = lshr i8 %xor25.i.iter13, 3, !dbg !190
  %165 = and i8 %164, 14, !dbg !190
  %166 = xor i8 %163, %165, !dbg !191
  %xor25.masked.i.iter13 = and i8 %xor25.i.iter13, 15, !dbg !192
  %167 = xor i8 %166, %xor25.masked.i.iter13, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter13 = xor i8 %167, %ret.0.i1.iter13, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter13 = add nuw nsw i32 %i.0.i3.iter13, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter13 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter13, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter13 = icmp eq i32 %inc.i.iter13, 8, !dbg !202
  br i1 %exitcond.i.not.iter13, label %lincomb.exit.iter13, label %for.body.i.iter13, !dbg !203, !llvm.loop !204

lincomb.exit.iter13:                              ; preds = %for.body.i.iter13
  %ret.0.i.lcssa.iter13 = phi i8 [ %xor1.i.i.iter13, %for.body.i.iter13 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter13, ptr %c.addr.1.lcssa.iter12, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter13 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter12, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter13, !dbg !150

for.cond.i.preheader.iter13:                      ; preds = %for.cond1.preheader.iter13
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter13, !dbg !203

iter_13_end:                                      ; preds = %for.inc4.iter13
  br label %iter_14_start

iter_14_start:                                    ; preds = %iter_13_end
  br label %for.cond1.preheader.iter14

for.cond1.preheader.iter14:                       ; preds = %iter_14_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter14, !dbg !150

for.inc4.iter14:                                  ; preds = %lincomb.exit.iter14
  %c.addr.1.lcssa.iter14 = phi ptr [ %incdec.ptr.iter14, %lincomb.exit.iter14 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter14 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter13, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_14_end

for.body.i.iter14:                                ; preds = %for.cond.i.preheader.iter14, %for.body.i.iter14
  %i.0.i3.iter14 = phi i32 [ 0, %for.cond.i.preheader.iter14 ], [ %inc.i.iter14, %for.body.i.iter14 ]
  %b.addr.0.i2.iter14 = phi ptr [ %b, %for.cond.i.preheader.iter14 ], [ %add.ptr.i.iter14, %for.body.i.iter14 ]
  %ret.0.i1.iter14 = phi i8 [ 0, %for.cond.i.preheader.iter14 ], [ %xor1.i.i.iter14, %for.body.i.iter14 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter14 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter13, i32 %i.0.i3.iter14, !dbg !164
  %168 = load i8, ptr %arrayidx.i.iter14, align 1, !dbg !164
  %169 = load i8, ptr %b.addr.0.i2.iter14, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %170 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter14 = xor i8 %168, %170, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %171 = trunc i8 %xor1.i.iter14 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %172 = and i8 %xor1.i.iter14, 2, !dbg !179
  %mul9.i.iter14 = mul i8 %172, %169, !dbg !180
  %conv10.i.iter14 = select i1 %171, i8 %169, i8 0, !dbg !177
  %xor11.i.iter14 = xor i8 %conv10.i.iter14, %mul9.i.iter14, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %173 = and i8 %xor1.i.iter14, 4, !dbg !182
  %mul16.i.iter14 = mul i8 %173, %169, !dbg !183
  %xor18.i.iter14 = xor i8 %mul16.i.iter14, %xor11.i.iter14, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %174 = and i8 %xor1.i.iter14, 8, !dbg !185
  %mul23.i.iter14 = mul i8 %174, %169, !dbg !186
  %xor25.i.iter14 = xor i8 %mul23.i.iter14, %xor18.i.iter14, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %175 = lshr i8 %xor25.i.iter14, 4, !dbg !189
  %176 = lshr i8 %xor25.i.iter14, 3, !dbg !190
  %177 = and i8 %176, 14, !dbg !190
  %178 = xor i8 %175, %177, !dbg !191
  %xor25.masked.i.iter14 = and i8 %xor25.i.iter14, 15, !dbg !192
  %179 = xor i8 %178, %xor25.masked.i.iter14, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter14 = xor i8 %179, %ret.0.i1.iter14, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter14 = add nuw nsw i32 %i.0.i3.iter14, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter14 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter14, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter14 = icmp eq i32 %inc.i.iter14, 8, !dbg !202
  br i1 %exitcond.i.not.iter14, label %lincomb.exit.iter14, label %for.body.i.iter14, !dbg !203, !llvm.loop !204

lincomb.exit.iter14:                              ; preds = %for.body.i.iter14
  %ret.0.i.lcssa.iter14 = phi i8 [ %xor1.i.i.iter14, %for.body.i.iter14 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter14, ptr %c.addr.1.lcssa.iter13, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter14 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter13, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter14, !dbg !150

for.cond.i.preheader.iter14:                      ; preds = %for.cond1.preheader.iter14
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter14, !dbg !203

iter_14_end:                                      ; preds = %for.inc4.iter14
  br label %iter_15_start

iter_15_start:                                    ; preds = %iter_14_end
  br label %for.cond1.preheader.iter15

for.cond1.preheader.iter15:                       ; preds = %iter_15_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter15, !dbg !150

for.inc4.iter15:                                  ; preds = %lincomb.exit.iter15
  %c.addr.1.lcssa.iter15 = phi ptr [ %incdec.ptr.iter15, %lincomb.exit.iter15 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter15 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter14, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_15_end

for.body.i.iter15:                                ; preds = %for.cond.i.preheader.iter15, %for.body.i.iter15
  %i.0.i3.iter15 = phi i32 [ 0, %for.cond.i.preheader.iter15 ], [ %inc.i.iter15, %for.body.i.iter15 ]
  %b.addr.0.i2.iter15 = phi ptr [ %b, %for.cond.i.preheader.iter15 ], [ %add.ptr.i.iter15, %for.body.i.iter15 ]
  %ret.0.i1.iter15 = phi i8 [ 0, %for.cond.i.preheader.iter15 ], [ %xor1.i.i.iter15, %for.body.i.iter15 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter15 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter14, i32 %i.0.i3.iter15, !dbg !164
  %180 = load i8, ptr %arrayidx.i.iter15, align 1, !dbg !164
  %181 = load i8, ptr %b.addr.0.i2.iter15, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %182 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter15 = xor i8 %180, %182, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %183 = trunc i8 %xor1.i.iter15 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %184 = and i8 %xor1.i.iter15, 2, !dbg !179
  %mul9.i.iter15 = mul i8 %184, %181, !dbg !180
  %conv10.i.iter15 = select i1 %183, i8 %181, i8 0, !dbg !177
  %xor11.i.iter15 = xor i8 %conv10.i.iter15, %mul9.i.iter15, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %185 = and i8 %xor1.i.iter15, 4, !dbg !182
  %mul16.i.iter15 = mul i8 %185, %181, !dbg !183
  %xor18.i.iter15 = xor i8 %mul16.i.iter15, %xor11.i.iter15, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %186 = and i8 %xor1.i.iter15, 8, !dbg !185
  %mul23.i.iter15 = mul i8 %186, %181, !dbg !186
  %xor25.i.iter15 = xor i8 %mul23.i.iter15, %xor18.i.iter15, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %187 = lshr i8 %xor25.i.iter15, 4, !dbg !189
  %188 = lshr i8 %xor25.i.iter15, 3, !dbg !190
  %189 = and i8 %188, 14, !dbg !190
  %190 = xor i8 %187, %189, !dbg !191
  %xor25.masked.i.iter15 = and i8 %xor25.i.iter15, 15, !dbg !192
  %191 = xor i8 %190, %xor25.masked.i.iter15, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter15 = xor i8 %191, %ret.0.i1.iter15, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter15 = add nuw nsw i32 %i.0.i3.iter15, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter15 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter15, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter15 = icmp eq i32 %inc.i.iter15, 8, !dbg !202
  br i1 %exitcond.i.not.iter15, label %lincomb.exit.iter15, label %for.body.i.iter15, !dbg !203, !llvm.loop !204

lincomb.exit.iter15:                              ; preds = %for.body.i.iter15
  %ret.0.i.lcssa.iter15 = phi i8 [ %xor1.i.i.iter15, %for.body.i.iter15 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter15, ptr %c.addr.1.lcssa.iter14, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter15 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter14, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter15, !dbg !150

for.cond.i.preheader.iter15:                      ; preds = %for.cond1.preheader.iter15
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter15, !dbg !203

iter_15_end:                                      ; preds = %for.inc4.iter15
  br label %iter_16_start

iter_16_start:                                    ; preds = %iter_15_end
  br label %for.cond1.preheader.iter16

for.cond1.preheader.iter16:                       ; preds = %iter_16_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter16, !dbg !150

for.inc4.iter16:                                  ; preds = %lincomb.exit.iter16
  %c.addr.1.lcssa.iter16 = phi ptr [ %incdec.ptr.iter16, %lincomb.exit.iter16 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter16 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter15, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_16_end

for.body.i.iter16:                                ; preds = %for.cond.i.preheader.iter16, %for.body.i.iter16
  %i.0.i3.iter16 = phi i32 [ 0, %for.cond.i.preheader.iter16 ], [ %inc.i.iter16, %for.body.i.iter16 ]
  %b.addr.0.i2.iter16 = phi ptr [ %b, %for.cond.i.preheader.iter16 ], [ %add.ptr.i.iter16, %for.body.i.iter16 ]
  %ret.0.i1.iter16 = phi i8 [ 0, %for.cond.i.preheader.iter16 ], [ %xor1.i.i.iter16, %for.body.i.iter16 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter16 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter15, i32 %i.0.i3.iter16, !dbg !164
  %192 = load i8, ptr %arrayidx.i.iter16, align 1, !dbg !164
  %193 = load i8, ptr %b.addr.0.i2.iter16, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %194 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter16 = xor i8 %192, %194, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %195 = trunc i8 %xor1.i.iter16 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %196 = and i8 %xor1.i.iter16, 2, !dbg !179
  %mul9.i.iter16 = mul i8 %196, %193, !dbg !180
  %conv10.i.iter16 = select i1 %195, i8 %193, i8 0, !dbg !177
  %xor11.i.iter16 = xor i8 %conv10.i.iter16, %mul9.i.iter16, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %197 = and i8 %xor1.i.iter16, 4, !dbg !182
  %mul16.i.iter16 = mul i8 %197, %193, !dbg !183
  %xor18.i.iter16 = xor i8 %mul16.i.iter16, %xor11.i.iter16, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %198 = and i8 %xor1.i.iter16, 8, !dbg !185
  %mul23.i.iter16 = mul i8 %198, %193, !dbg !186
  %xor25.i.iter16 = xor i8 %mul23.i.iter16, %xor18.i.iter16, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %199 = lshr i8 %xor25.i.iter16, 4, !dbg !189
  %200 = lshr i8 %xor25.i.iter16, 3, !dbg !190
  %201 = and i8 %200, 14, !dbg !190
  %202 = xor i8 %199, %201, !dbg !191
  %xor25.masked.i.iter16 = and i8 %xor25.i.iter16, 15, !dbg !192
  %203 = xor i8 %202, %xor25.masked.i.iter16, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter16 = xor i8 %203, %ret.0.i1.iter16, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter16 = add nuw nsw i32 %i.0.i3.iter16, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter16 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter16, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter16 = icmp eq i32 %inc.i.iter16, 8, !dbg !202
  br i1 %exitcond.i.not.iter16, label %lincomb.exit.iter16, label %for.body.i.iter16, !dbg !203, !llvm.loop !204

lincomb.exit.iter16:                              ; preds = %for.body.i.iter16
  %ret.0.i.lcssa.iter16 = phi i8 [ %xor1.i.i.iter16, %for.body.i.iter16 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter16, ptr %c.addr.1.lcssa.iter15, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter16 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter15, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter16, !dbg !150

for.cond.i.preheader.iter16:                      ; preds = %for.cond1.preheader.iter16
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter16, !dbg !203

iter_16_end:                                      ; preds = %for.inc4.iter16
  br label %iter_17_start

iter_17_start:                                    ; preds = %iter_16_end
  br label %for.cond1.preheader.iter17

for.cond1.preheader.iter17:                       ; preds = %iter_17_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter17, !dbg !150

for.inc4.iter17:                                  ; preds = %lincomb.exit.iter17
  %c.addr.1.lcssa.iter17 = phi ptr [ %incdec.ptr.iter17, %lincomb.exit.iter17 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter17 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter16, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_17_end

for.body.i.iter17:                                ; preds = %for.cond.i.preheader.iter17, %for.body.i.iter17
  %i.0.i3.iter17 = phi i32 [ 0, %for.cond.i.preheader.iter17 ], [ %inc.i.iter17, %for.body.i.iter17 ]
  %b.addr.0.i2.iter17 = phi ptr [ %b, %for.cond.i.preheader.iter17 ], [ %add.ptr.i.iter17, %for.body.i.iter17 ]
  %ret.0.i1.iter17 = phi i8 [ 0, %for.cond.i.preheader.iter17 ], [ %xor1.i.i.iter17, %for.body.i.iter17 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter17 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter16, i32 %i.0.i3.iter17, !dbg !164
  %204 = load i8, ptr %arrayidx.i.iter17, align 1, !dbg !164
  %205 = load i8, ptr %b.addr.0.i2.iter17, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %206 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter17 = xor i8 %204, %206, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %207 = trunc i8 %xor1.i.iter17 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %208 = and i8 %xor1.i.iter17, 2, !dbg !179
  %mul9.i.iter17 = mul i8 %208, %205, !dbg !180
  %conv10.i.iter17 = select i1 %207, i8 %205, i8 0, !dbg !177
  %xor11.i.iter17 = xor i8 %conv10.i.iter17, %mul9.i.iter17, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %209 = and i8 %xor1.i.iter17, 4, !dbg !182
  %mul16.i.iter17 = mul i8 %209, %205, !dbg !183
  %xor18.i.iter17 = xor i8 %mul16.i.iter17, %xor11.i.iter17, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %210 = and i8 %xor1.i.iter17, 8, !dbg !185
  %mul23.i.iter17 = mul i8 %210, %205, !dbg !186
  %xor25.i.iter17 = xor i8 %mul23.i.iter17, %xor18.i.iter17, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %211 = lshr i8 %xor25.i.iter17, 4, !dbg !189
  %212 = lshr i8 %xor25.i.iter17, 3, !dbg !190
  %213 = and i8 %212, 14, !dbg !190
  %214 = xor i8 %211, %213, !dbg !191
  %xor25.masked.i.iter17 = and i8 %xor25.i.iter17, 15, !dbg !192
  %215 = xor i8 %214, %xor25.masked.i.iter17, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter17 = xor i8 %215, %ret.0.i1.iter17, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter17 = add nuw nsw i32 %i.0.i3.iter17, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter17 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter17, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter17 = icmp eq i32 %inc.i.iter17, 8, !dbg !202
  br i1 %exitcond.i.not.iter17, label %lincomb.exit.iter17, label %for.body.i.iter17, !dbg !203, !llvm.loop !204

lincomb.exit.iter17:                              ; preds = %for.body.i.iter17
  %ret.0.i.lcssa.iter17 = phi i8 [ %xor1.i.i.iter17, %for.body.i.iter17 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter17, ptr %c.addr.1.lcssa.iter16, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter17 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter16, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter17, !dbg !150

for.cond.i.preheader.iter17:                      ; preds = %for.cond1.preheader.iter17
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter17, !dbg !203

iter_17_end:                                      ; preds = %for.inc4.iter17
  br label %iter_18_start

iter_18_start:                                    ; preds = %iter_17_end
  br label %for.cond1.preheader.iter18

for.cond1.preheader.iter18:                       ; preds = %iter_18_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter18, !dbg !150

for.inc4.iter18:                                  ; preds = %lincomb.exit.iter18
  %c.addr.1.lcssa.iter18 = phi ptr [ %incdec.ptr.iter18, %lincomb.exit.iter18 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter18 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter17, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_18_end

for.body.i.iter18:                                ; preds = %for.cond.i.preheader.iter18, %for.body.i.iter18
  %i.0.i3.iter18 = phi i32 [ 0, %for.cond.i.preheader.iter18 ], [ %inc.i.iter18, %for.body.i.iter18 ]
  %b.addr.0.i2.iter18 = phi ptr [ %b, %for.cond.i.preheader.iter18 ], [ %add.ptr.i.iter18, %for.body.i.iter18 ]
  %ret.0.i1.iter18 = phi i8 [ 0, %for.cond.i.preheader.iter18 ], [ %xor1.i.i.iter18, %for.body.i.iter18 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter18 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter17, i32 %i.0.i3.iter18, !dbg !164
  %216 = load i8, ptr %arrayidx.i.iter18, align 1, !dbg !164
  %217 = load i8, ptr %b.addr.0.i2.iter18, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %218 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter18 = xor i8 %216, %218, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %219 = trunc i8 %xor1.i.iter18 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %220 = and i8 %xor1.i.iter18, 2, !dbg !179
  %mul9.i.iter18 = mul i8 %220, %217, !dbg !180
  %conv10.i.iter18 = select i1 %219, i8 %217, i8 0, !dbg !177
  %xor11.i.iter18 = xor i8 %conv10.i.iter18, %mul9.i.iter18, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %221 = and i8 %xor1.i.iter18, 4, !dbg !182
  %mul16.i.iter18 = mul i8 %221, %217, !dbg !183
  %xor18.i.iter18 = xor i8 %mul16.i.iter18, %xor11.i.iter18, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %222 = and i8 %xor1.i.iter18, 8, !dbg !185
  %mul23.i.iter18 = mul i8 %222, %217, !dbg !186
  %xor25.i.iter18 = xor i8 %mul23.i.iter18, %xor18.i.iter18, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %223 = lshr i8 %xor25.i.iter18, 4, !dbg !189
  %224 = lshr i8 %xor25.i.iter18, 3, !dbg !190
  %225 = and i8 %224, 14, !dbg !190
  %226 = xor i8 %223, %225, !dbg !191
  %xor25.masked.i.iter18 = and i8 %xor25.i.iter18, 15, !dbg !192
  %227 = xor i8 %226, %xor25.masked.i.iter18, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter18 = xor i8 %227, %ret.0.i1.iter18, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter18 = add nuw nsw i32 %i.0.i3.iter18, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter18 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter18, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter18 = icmp eq i32 %inc.i.iter18, 8, !dbg !202
  br i1 %exitcond.i.not.iter18, label %lincomb.exit.iter18, label %for.body.i.iter18, !dbg !203, !llvm.loop !204

lincomb.exit.iter18:                              ; preds = %for.body.i.iter18
  %ret.0.i.lcssa.iter18 = phi i8 [ %xor1.i.i.iter18, %for.body.i.iter18 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter18, ptr %c.addr.1.lcssa.iter17, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter18 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter17, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter18, !dbg !150

for.cond.i.preheader.iter18:                      ; preds = %for.cond1.preheader.iter18
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter18, !dbg !203

iter_18_end:                                      ; preds = %for.inc4.iter18
  br label %iter_19_start

iter_19_start:                                    ; preds = %iter_18_end
  br label %for.cond1.preheader.iter19

for.cond1.preheader.iter19:                       ; preds = %iter_19_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter19, !dbg !150

for.inc4.iter19:                                  ; preds = %lincomb.exit.iter19
  %c.addr.1.lcssa.iter19 = phi ptr [ %incdec.ptr.iter19, %lincomb.exit.iter19 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter19 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter18, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_19_end

for.body.i.iter19:                                ; preds = %for.cond.i.preheader.iter19, %for.body.i.iter19
  %i.0.i3.iter19 = phi i32 [ 0, %for.cond.i.preheader.iter19 ], [ %inc.i.iter19, %for.body.i.iter19 ]
  %b.addr.0.i2.iter19 = phi ptr [ %b, %for.cond.i.preheader.iter19 ], [ %add.ptr.i.iter19, %for.body.i.iter19 ]
  %ret.0.i1.iter19 = phi i8 [ 0, %for.cond.i.preheader.iter19 ], [ %xor1.i.i.iter19, %for.body.i.iter19 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter19 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter18, i32 %i.0.i3.iter19, !dbg !164
  %228 = load i8, ptr %arrayidx.i.iter19, align 1, !dbg !164
  %229 = load i8, ptr %b.addr.0.i2.iter19, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %230 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter19 = xor i8 %228, %230, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %231 = trunc i8 %xor1.i.iter19 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %232 = and i8 %xor1.i.iter19, 2, !dbg !179
  %mul9.i.iter19 = mul i8 %232, %229, !dbg !180
  %conv10.i.iter19 = select i1 %231, i8 %229, i8 0, !dbg !177
  %xor11.i.iter19 = xor i8 %conv10.i.iter19, %mul9.i.iter19, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %233 = and i8 %xor1.i.iter19, 4, !dbg !182
  %mul16.i.iter19 = mul i8 %233, %229, !dbg !183
  %xor18.i.iter19 = xor i8 %mul16.i.iter19, %xor11.i.iter19, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %234 = and i8 %xor1.i.iter19, 8, !dbg !185
  %mul23.i.iter19 = mul i8 %234, %229, !dbg !186
  %xor25.i.iter19 = xor i8 %mul23.i.iter19, %xor18.i.iter19, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %235 = lshr i8 %xor25.i.iter19, 4, !dbg !189
  %236 = lshr i8 %xor25.i.iter19, 3, !dbg !190
  %237 = and i8 %236, 14, !dbg !190
  %238 = xor i8 %235, %237, !dbg !191
  %xor25.masked.i.iter19 = and i8 %xor25.i.iter19, 15, !dbg !192
  %239 = xor i8 %238, %xor25.masked.i.iter19, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter19 = xor i8 %239, %ret.0.i1.iter19, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter19 = add nuw nsw i32 %i.0.i3.iter19, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter19 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter19, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter19 = icmp eq i32 %inc.i.iter19, 8, !dbg !202
  br i1 %exitcond.i.not.iter19, label %lincomb.exit.iter19, label %for.body.i.iter19, !dbg !203, !llvm.loop !204

lincomb.exit.iter19:                              ; preds = %for.body.i.iter19
  %ret.0.i.lcssa.iter19 = phi i8 [ %xor1.i.i.iter19, %for.body.i.iter19 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter19, ptr %c.addr.1.lcssa.iter18, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter19 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter18, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter19, !dbg !150

for.cond.i.preheader.iter19:                      ; preds = %for.cond1.preheader.iter19
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter19, !dbg !203

iter_19_end:                                      ; preds = %for.inc4.iter19
  br label %iter_20_start

iter_20_start:                                    ; preds = %iter_19_end
  br label %for.cond1.preheader.iter20

for.cond1.preheader.iter20:                       ; preds = %iter_20_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter20, !dbg !150

for.inc4.iter20:                                  ; preds = %lincomb.exit.iter20
  %c.addr.1.lcssa.iter20 = phi ptr [ %incdec.ptr.iter20, %lincomb.exit.iter20 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter20 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter19, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_20_end

for.body.i.iter20:                                ; preds = %for.cond.i.preheader.iter20, %for.body.i.iter20
  %i.0.i3.iter20 = phi i32 [ 0, %for.cond.i.preheader.iter20 ], [ %inc.i.iter20, %for.body.i.iter20 ]
  %b.addr.0.i2.iter20 = phi ptr [ %b, %for.cond.i.preheader.iter20 ], [ %add.ptr.i.iter20, %for.body.i.iter20 ]
  %ret.0.i1.iter20 = phi i8 [ 0, %for.cond.i.preheader.iter20 ], [ %xor1.i.i.iter20, %for.body.i.iter20 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter20 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter19, i32 %i.0.i3.iter20, !dbg !164
  %240 = load i8, ptr %arrayidx.i.iter20, align 1, !dbg !164
  %241 = load i8, ptr %b.addr.0.i2.iter20, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %242 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter20 = xor i8 %240, %242, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %243 = trunc i8 %xor1.i.iter20 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %244 = and i8 %xor1.i.iter20, 2, !dbg !179
  %mul9.i.iter20 = mul i8 %244, %241, !dbg !180
  %conv10.i.iter20 = select i1 %243, i8 %241, i8 0, !dbg !177
  %xor11.i.iter20 = xor i8 %conv10.i.iter20, %mul9.i.iter20, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %245 = and i8 %xor1.i.iter20, 4, !dbg !182
  %mul16.i.iter20 = mul i8 %245, %241, !dbg !183
  %xor18.i.iter20 = xor i8 %mul16.i.iter20, %xor11.i.iter20, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %246 = and i8 %xor1.i.iter20, 8, !dbg !185
  %mul23.i.iter20 = mul i8 %246, %241, !dbg !186
  %xor25.i.iter20 = xor i8 %mul23.i.iter20, %xor18.i.iter20, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %247 = lshr i8 %xor25.i.iter20, 4, !dbg !189
  %248 = lshr i8 %xor25.i.iter20, 3, !dbg !190
  %249 = and i8 %248, 14, !dbg !190
  %250 = xor i8 %247, %249, !dbg !191
  %xor25.masked.i.iter20 = and i8 %xor25.i.iter20, 15, !dbg !192
  %251 = xor i8 %250, %xor25.masked.i.iter20, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter20 = xor i8 %251, %ret.0.i1.iter20, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter20 = add nuw nsw i32 %i.0.i3.iter20, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter20 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter20, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter20 = icmp eq i32 %inc.i.iter20, 8, !dbg !202
  br i1 %exitcond.i.not.iter20, label %lincomb.exit.iter20, label %for.body.i.iter20, !dbg !203, !llvm.loop !204

lincomb.exit.iter20:                              ; preds = %for.body.i.iter20
  %ret.0.i.lcssa.iter20 = phi i8 [ %xor1.i.i.iter20, %for.body.i.iter20 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter20, ptr %c.addr.1.lcssa.iter19, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter20 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter19, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter20, !dbg !150

for.cond.i.preheader.iter20:                      ; preds = %for.cond1.preheader.iter20
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter20, !dbg !203

iter_20_end:                                      ; preds = %for.inc4.iter20
  br label %iter_21_start

iter_21_start:                                    ; preds = %iter_20_end
  br label %for.cond1.preheader.iter21

for.cond1.preheader.iter21:                       ; preds = %iter_21_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter21, !dbg !150

for.inc4.iter21:                                  ; preds = %lincomb.exit.iter21
  %c.addr.1.lcssa.iter21 = phi ptr [ %incdec.ptr.iter21, %lincomb.exit.iter21 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter21 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter20, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_21_end

for.body.i.iter21:                                ; preds = %for.cond.i.preheader.iter21, %for.body.i.iter21
  %i.0.i3.iter21 = phi i32 [ 0, %for.cond.i.preheader.iter21 ], [ %inc.i.iter21, %for.body.i.iter21 ]
  %b.addr.0.i2.iter21 = phi ptr [ %b, %for.cond.i.preheader.iter21 ], [ %add.ptr.i.iter21, %for.body.i.iter21 ]
  %ret.0.i1.iter21 = phi i8 [ 0, %for.cond.i.preheader.iter21 ], [ %xor1.i.i.iter21, %for.body.i.iter21 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter21 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter20, i32 %i.0.i3.iter21, !dbg !164
  %252 = load i8, ptr %arrayidx.i.iter21, align 1, !dbg !164
  %253 = load i8, ptr %b.addr.0.i2.iter21, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %254 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter21 = xor i8 %252, %254, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %255 = trunc i8 %xor1.i.iter21 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %256 = and i8 %xor1.i.iter21, 2, !dbg !179
  %mul9.i.iter21 = mul i8 %256, %253, !dbg !180
  %conv10.i.iter21 = select i1 %255, i8 %253, i8 0, !dbg !177
  %xor11.i.iter21 = xor i8 %conv10.i.iter21, %mul9.i.iter21, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %257 = and i8 %xor1.i.iter21, 4, !dbg !182
  %mul16.i.iter21 = mul i8 %257, %253, !dbg !183
  %xor18.i.iter21 = xor i8 %mul16.i.iter21, %xor11.i.iter21, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %258 = and i8 %xor1.i.iter21, 8, !dbg !185
  %mul23.i.iter21 = mul i8 %258, %253, !dbg !186
  %xor25.i.iter21 = xor i8 %mul23.i.iter21, %xor18.i.iter21, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %259 = lshr i8 %xor25.i.iter21, 4, !dbg !189
  %260 = lshr i8 %xor25.i.iter21, 3, !dbg !190
  %261 = and i8 %260, 14, !dbg !190
  %262 = xor i8 %259, %261, !dbg !191
  %xor25.masked.i.iter21 = and i8 %xor25.i.iter21, 15, !dbg !192
  %263 = xor i8 %262, %xor25.masked.i.iter21, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter21 = xor i8 %263, %ret.0.i1.iter21, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter21 = add nuw nsw i32 %i.0.i3.iter21, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter21 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter21, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter21 = icmp eq i32 %inc.i.iter21, 8, !dbg !202
  br i1 %exitcond.i.not.iter21, label %lincomb.exit.iter21, label %for.body.i.iter21, !dbg !203, !llvm.loop !204

lincomb.exit.iter21:                              ; preds = %for.body.i.iter21
  %ret.0.i.lcssa.iter21 = phi i8 [ %xor1.i.i.iter21, %for.body.i.iter21 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter21, ptr %c.addr.1.lcssa.iter20, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter21 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter20, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter21, !dbg !150

for.cond.i.preheader.iter21:                      ; preds = %for.cond1.preheader.iter21
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter21, !dbg !203

iter_21_end:                                      ; preds = %for.inc4.iter21
  br label %iter_22_start

iter_22_start:                                    ; preds = %iter_21_end
  br label %for.cond1.preheader.iter22

for.cond1.preheader.iter22:                       ; preds = %iter_22_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter22, !dbg !150

for.inc4.iter22:                                  ; preds = %lincomb.exit.iter22
  %c.addr.1.lcssa.iter22 = phi ptr [ %incdec.ptr.iter22, %lincomb.exit.iter22 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter22 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter21, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_22_end

for.body.i.iter22:                                ; preds = %for.cond.i.preheader.iter22, %for.body.i.iter22
  %i.0.i3.iter22 = phi i32 [ 0, %for.cond.i.preheader.iter22 ], [ %inc.i.iter22, %for.body.i.iter22 ]
  %b.addr.0.i2.iter22 = phi ptr [ %b, %for.cond.i.preheader.iter22 ], [ %add.ptr.i.iter22, %for.body.i.iter22 ]
  %ret.0.i1.iter22 = phi i8 [ 0, %for.cond.i.preheader.iter22 ], [ %xor1.i.i.iter22, %for.body.i.iter22 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter22 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter21, i32 %i.0.i3.iter22, !dbg !164
  %264 = load i8, ptr %arrayidx.i.iter22, align 1, !dbg !164
  %265 = load i8, ptr %b.addr.0.i2.iter22, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %266 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter22 = xor i8 %264, %266, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %267 = trunc i8 %xor1.i.iter22 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %268 = and i8 %xor1.i.iter22, 2, !dbg !179
  %mul9.i.iter22 = mul i8 %268, %265, !dbg !180
  %conv10.i.iter22 = select i1 %267, i8 %265, i8 0, !dbg !177
  %xor11.i.iter22 = xor i8 %conv10.i.iter22, %mul9.i.iter22, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %269 = and i8 %xor1.i.iter22, 4, !dbg !182
  %mul16.i.iter22 = mul i8 %269, %265, !dbg !183
  %xor18.i.iter22 = xor i8 %mul16.i.iter22, %xor11.i.iter22, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %270 = and i8 %xor1.i.iter22, 8, !dbg !185
  %mul23.i.iter22 = mul i8 %270, %265, !dbg !186
  %xor25.i.iter22 = xor i8 %mul23.i.iter22, %xor18.i.iter22, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %271 = lshr i8 %xor25.i.iter22, 4, !dbg !189
  %272 = lshr i8 %xor25.i.iter22, 3, !dbg !190
  %273 = and i8 %272, 14, !dbg !190
  %274 = xor i8 %271, %273, !dbg !191
  %xor25.masked.i.iter22 = and i8 %xor25.i.iter22, 15, !dbg !192
  %275 = xor i8 %274, %xor25.masked.i.iter22, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter22 = xor i8 %275, %ret.0.i1.iter22, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter22 = add nuw nsw i32 %i.0.i3.iter22, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter22 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter22, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter22 = icmp eq i32 %inc.i.iter22, 8, !dbg !202
  br i1 %exitcond.i.not.iter22, label %lincomb.exit.iter22, label %for.body.i.iter22, !dbg !203, !llvm.loop !204

lincomb.exit.iter22:                              ; preds = %for.body.i.iter22
  %ret.0.i.lcssa.iter22 = phi i8 [ %xor1.i.i.iter22, %for.body.i.iter22 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter22, ptr %c.addr.1.lcssa.iter21, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter22 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter21, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter22, !dbg !150

for.cond.i.preheader.iter22:                      ; preds = %for.cond1.preheader.iter22
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter22, !dbg !203

iter_22_end:                                      ; preds = %for.inc4.iter22
  br label %iter_23_start

iter_23_start:                                    ; preds = %iter_22_end
  br label %for.cond1.preheader.iter23

for.cond1.preheader.iter23:                       ; preds = %iter_23_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter23, !dbg !150

for.inc4.iter23:                                  ; preds = %lincomb.exit.iter23
  %c.addr.1.lcssa.iter23 = phi ptr [ %incdec.ptr.iter23, %lincomb.exit.iter23 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter23 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter22, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_23_end

for.body.i.iter23:                                ; preds = %for.cond.i.preheader.iter23, %for.body.i.iter23
  %i.0.i3.iter23 = phi i32 [ 0, %for.cond.i.preheader.iter23 ], [ %inc.i.iter23, %for.body.i.iter23 ]
  %b.addr.0.i2.iter23 = phi ptr [ %b, %for.cond.i.preheader.iter23 ], [ %add.ptr.i.iter23, %for.body.i.iter23 ]
  %ret.0.i1.iter23 = phi i8 [ 0, %for.cond.i.preheader.iter23 ], [ %xor1.i.i.iter23, %for.body.i.iter23 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter23 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter22, i32 %i.0.i3.iter23, !dbg !164
  %276 = load i8, ptr %arrayidx.i.iter23, align 1, !dbg !164
  %277 = load i8, ptr %b.addr.0.i2.iter23, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %278 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter23 = xor i8 %276, %278, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %279 = trunc i8 %xor1.i.iter23 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %280 = and i8 %xor1.i.iter23, 2, !dbg !179
  %mul9.i.iter23 = mul i8 %280, %277, !dbg !180
  %conv10.i.iter23 = select i1 %279, i8 %277, i8 0, !dbg !177
  %xor11.i.iter23 = xor i8 %conv10.i.iter23, %mul9.i.iter23, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %281 = and i8 %xor1.i.iter23, 4, !dbg !182
  %mul16.i.iter23 = mul i8 %281, %277, !dbg !183
  %xor18.i.iter23 = xor i8 %mul16.i.iter23, %xor11.i.iter23, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %282 = and i8 %xor1.i.iter23, 8, !dbg !185
  %mul23.i.iter23 = mul i8 %282, %277, !dbg !186
  %xor25.i.iter23 = xor i8 %mul23.i.iter23, %xor18.i.iter23, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %283 = lshr i8 %xor25.i.iter23, 4, !dbg !189
  %284 = lshr i8 %xor25.i.iter23, 3, !dbg !190
  %285 = and i8 %284, 14, !dbg !190
  %286 = xor i8 %283, %285, !dbg !191
  %xor25.masked.i.iter23 = and i8 %xor25.i.iter23, 15, !dbg !192
  %287 = xor i8 %286, %xor25.masked.i.iter23, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter23 = xor i8 %287, %ret.0.i1.iter23, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter23 = add nuw nsw i32 %i.0.i3.iter23, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter23 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter23, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter23 = icmp eq i32 %inc.i.iter23, 8, !dbg !202
  br i1 %exitcond.i.not.iter23, label %lincomb.exit.iter23, label %for.body.i.iter23, !dbg !203, !llvm.loop !204

lincomb.exit.iter23:                              ; preds = %for.body.i.iter23
  %ret.0.i.lcssa.iter23 = phi i8 [ %xor1.i.i.iter23, %for.body.i.iter23 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter23, ptr %c.addr.1.lcssa.iter22, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter23 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter22, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter23, !dbg !150

for.cond.i.preheader.iter23:                      ; preds = %for.cond1.preheader.iter23
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter23, !dbg !203

iter_23_end:                                      ; preds = %for.inc4.iter23
  br label %iter_24_start

iter_24_start:                                    ; preds = %iter_23_end
  br label %for.cond1.preheader.iter24

for.cond1.preheader.iter24:                       ; preds = %iter_24_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter24, !dbg !150

for.inc4.iter24:                                  ; preds = %lincomb.exit.iter24
  %c.addr.1.lcssa.iter24 = phi ptr [ %incdec.ptr.iter24, %lincomb.exit.iter24 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter24 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter23, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_24_end

for.body.i.iter24:                                ; preds = %for.cond.i.preheader.iter24, %for.body.i.iter24
  %i.0.i3.iter24 = phi i32 [ 0, %for.cond.i.preheader.iter24 ], [ %inc.i.iter24, %for.body.i.iter24 ]
  %b.addr.0.i2.iter24 = phi ptr [ %b, %for.cond.i.preheader.iter24 ], [ %add.ptr.i.iter24, %for.body.i.iter24 ]
  %ret.0.i1.iter24 = phi i8 [ 0, %for.cond.i.preheader.iter24 ], [ %xor1.i.i.iter24, %for.body.i.iter24 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter24 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter23, i32 %i.0.i3.iter24, !dbg !164
  %288 = load i8, ptr %arrayidx.i.iter24, align 1, !dbg !164
  %289 = load i8, ptr %b.addr.0.i2.iter24, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %290 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter24 = xor i8 %288, %290, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %291 = trunc i8 %xor1.i.iter24 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %292 = and i8 %xor1.i.iter24, 2, !dbg !179
  %mul9.i.iter24 = mul i8 %292, %289, !dbg !180
  %conv10.i.iter24 = select i1 %291, i8 %289, i8 0, !dbg !177
  %xor11.i.iter24 = xor i8 %conv10.i.iter24, %mul9.i.iter24, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %293 = and i8 %xor1.i.iter24, 4, !dbg !182
  %mul16.i.iter24 = mul i8 %293, %289, !dbg !183
  %xor18.i.iter24 = xor i8 %mul16.i.iter24, %xor11.i.iter24, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %294 = and i8 %xor1.i.iter24, 8, !dbg !185
  %mul23.i.iter24 = mul i8 %294, %289, !dbg !186
  %xor25.i.iter24 = xor i8 %mul23.i.iter24, %xor18.i.iter24, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %295 = lshr i8 %xor25.i.iter24, 4, !dbg !189
  %296 = lshr i8 %xor25.i.iter24, 3, !dbg !190
  %297 = and i8 %296, 14, !dbg !190
  %298 = xor i8 %295, %297, !dbg !191
  %xor25.masked.i.iter24 = and i8 %xor25.i.iter24, 15, !dbg !192
  %299 = xor i8 %298, %xor25.masked.i.iter24, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter24 = xor i8 %299, %ret.0.i1.iter24, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter24 = add nuw nsw i32 %i.0.i3.iter24, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter24 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter24, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter24 = icmp eq i32 %inc.i.iter24, 8, !dbg !202
  br i1 %exitcond.i.not.iter24, label %lincomb.exit.iter24, label %for.body.i.iter24, !dbg !203, !llvm.loop !204

lincomb.exit.iter24:                              ; preds = %for.body.i.iter24
  %ret.0.i.lcssa.iter24 = phi i8 [ %xor1.i.i.iter24, %for.body.i.iter24 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter24, ptr %c.addr.1.lcssa.iter23, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter24 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter23, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter24, !dbg !150

for.cond.i.preheader.iter24:                      ; preds = %for.cond1.preheader.iter24
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter24, !dbg !203

iter_24_end:                                      ; preds = %for.inc4.iter24
  br label %iter_25_start

iter_25_start:                                    ; preds = %iter_24_end
  br label %for.cond1.preheader.iter25

for.cond1.preheader.iter25:                       ; preds = %iter_25_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter25, !dbg !150

for.inc4.iter25:                                  ; preds = %lincomb.exit.iter25
  %c.addr.1.lcssa.iter25 = phi ptr [ %incdec.ptr.iter25, %lincomb.exit.iter25 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter25 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter24, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_25_end

for.body.i.iter25:                                ; preds = %for.cond.i.preheader.iter25, %for.body.i.iter25
  %i.0.i3.iter25 = phi i32 [ 0, %for.cond.i.preheader.iter25 ], [ %inc.i.iter25, %for.body.i.iter25 ]
  %b.addr.0.i2.iter25 = phi ptr [ %b, %for.cond.i.preheader.iter25 ], [ %add.ptr.i.iter25, %for.body.i.iter25 ]
  %ret.0.i1.iter25 = phi i8 [ 0, %for.cond.i.preheader.iter25 ], [ %xor1.i.i.iter25, %for.body.i.iter25 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter25 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter24, i32 %i.0.i3.iter25, !dbg !164
  %300 = load i8, ptr %arrayidx.i.iter25, align 1, !dbg !164
  %301 = load i8, ptr %b.addr.0.i2.iter25, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %302 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter25 = xor i8 %300, %302, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %303 = trunc i8 %xor1.i.iter25 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %304 = and i8 %xor1.i.iter25, 2, !dbg !179
  %mul9.i.iter25 = mul i8 %304, %301, !dbg !180
  %conv10.i.iter25 = select i1 %303, i8 %301, i8 0, !dbg !177
  %xor11.i.iter25 = xor i8 %conv10.i.iter25, %mul9.i.iter25, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %305 = and i8 %xor1.i.iter25, 4, !dbg !182
  %mul16.i.iter25 = mul i8 %305, %301, !dbg !183
  %xor18.i.iter25 = xor i8 %mul16.i.iter25, %xor11.i.iter25, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %306 = and i8 %xor1.i.iter25, 8, !dbg !185
  %mul23.i.iter25 = mul i8 %306, %301, !dbg !186
  %xor25.i.iter25 = xor i8 %mul23.i.iter25, %xor18.i.iter25, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %307 = lshr i8 %xor25.i.iter25, 4, !dbg !189
  %308 = lshr i8 %xor25.i.iter25, 3, !dbg !190
  %309 = and i8 %308, 14, !dbg !190
  %310 = xor i8 %307, %309, !dbg !191
  %xor25.masked.i.iter25 = and i8 %xor25.i.iter25, 15, !dbg !192
  %311 = xor i8 %310, %xor25.masked.i.iter25, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter25 = xor i8 %311, %ret.0.i1.iter25, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter25 = add nuw nsw i32 %i.0.i3.iter25, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter25 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter25, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter25 = icmp eq i32 %inc.i.iter25, 8, !dbg !202
  br i1 %exitcond.i.not.iter25, label %lincomb.exit.iter25, label %for.body.i.iter25, !dbg !203, !llvm.loop !204

lincomb.exit.iter25:                              ; preds = %for.body.i.iter25
  %ret.0.i.lcssa.iter25 = phi i8 [ %xor1.i.i.iter25, %for.body.i.iter25 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter25, ptr %c.addr.1.lcssa.iter24, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter25 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter24, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter25, !dbg !150

for.cond.i.preheader.iter25:                      ; preds = %for.cond1.preheader.iter25
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter25, !dbg !203

iter_25_end:                                      ; preds = %for.inc4.iter25
  br label %iter_26_start

iter_26_start:                                    ; preds = %iter_25_end
  br label %for.cond1.preheader.iter26

for.cond1.preheader.iter26:                       ; preds = %iter_26_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter26, !dbg !150

for.inc4.iter26:                                  ; preds = %lincomb.exit.iter26
  %c.addr.1.lcssa.iter26 = phi ptr [ %incdec.ptr.iter26, %lincomb.exit.iter26 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter26 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter25, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_26_end

for.body.i.iter26:                                ; preds = %for.cond.i.preheader.iter26, %for.body.i.iter26
  %i.0.i3.iter26 = phi i32 [ 0, %for.cond.i.preheader.iter26 ], [ %inc.i.iter26, %for.body.i.iter26 ]
  %b.addr.0.i2.iter26 = phi ptr [ %b, %for.cond.i.preheader.iter26 ], [ %add.ptr.i.iter26, %for.body.i.iter26 ]
  %ret.0.i1.iter26 = phi i8 [ 0, %for.cond.i.preheader.iter26 ], [ %xor1.i.i.iter26, %for.body.i.iter26 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter26 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter25, i32 %i.0.i3.iter26, !dbg !164
  %312 = load i8, ptr %arrayidx.i.iter26, align 1, !dbg !164
  %313 = load i8, ptr %b.addr.0.i2.iter26, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %314 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter26 = xor i8 %312, %314, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %315 = trunc i8 %xor1.i.iter26 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %316 = and i8 %xor1.i.iter26, 2, !dbg !179
  %mul9.i.iter26 = mul i8 %316, %313, !dbg !180
  %conv10.i.iter26 = select i1 %315, i8 %313, i8 0, !dbg !177
  %xor11.i.iter26 = xor i8 %conv10.i.iter26, %mul9.i.iter26, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %317 = and i8 %xor1.i.iter26, 4, !dbg !182
  %mul16.i.iter26 = mul i8 %317, %313, !dbg !183
  %xor18.i.iter26 = xor i8 %mul16.i.iter26, %xor11.i.iter26, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %318 = and i8 %xor1.i.iter26, 8, !dbg !185
  %mul23.i.iter26 = mul i8 %318, %313, !dbg !186
  %xor25.i.iter26 = xor i8 %mul23.i.iter26, %xor18.i.iter26, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %319 = lshr i8 %xor25.i.iter26, 4, !dbg !189
  %320 = lshr i8 %xor25.i.iter26, 3, !dbg !190
  %321 = and i8 %320, 14, !dbg !190
  %322 = xor i8 %319, %321, !dbg !191
  %xor25.masked.i.iter26 = and i8 %xor25.i.iter26, 15, !dbg !192
  %323 = xor i8 %322, %xor25.masked.i.iter26, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter26 = xor i8 %323, %ret.0.i1.iter26, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter26 = add nuw nsw i32 %i.0.i3.iter26, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter26 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter26, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter26 = icmp eq i32 %inc.i.iter26, 8, !dbg !202
  br i1 %exitcond.i.not.iter26, label %lincomb.exit.iter26, label %for.body.i.iter26, !dbg !203, !llvm.loop !204

lincomb.exit.iter26:                              ; preds = %for.body.i.iter26
  %ret.0.i.lcssa.iter26 = phi i8 [ %xor1.i.i.iter26, %for.body.i.iter26 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter26, ptr %c.addr.1.lcssa.iter25, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter26 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter25, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter26, !dbg !150

for.cond.i.preheader.iter26:                      ; preds = %for.cond1.preheader.iter26
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter26, !dbg !203

iter_26_end:                                      ; preds = %for.inc4.iter26
  br label %iter_27_start

iter_27_start:                                    ; preds = %iter_26_end
  br label %for.cond1.preheader.iter27

for.cond1.preheader.iter27:                       ; preds = %iter_27_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter27, !dbg !150

for.inc4.iter27:                                  ; preds = %lincomb.exit.iter27
  %c.addr.1.lcssa.iter27 = phi ptr [ %incdec.ptr.iter27, %lincomb.exit.iter27 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter27 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter26, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_27_end

for.body.i.iter27:                                ; preds = %for.cond.i.preheader.iter27, %for.body.i.iter27
  %i.0.i3.iter27 = phi i32 [ 0, %for.cond.i.preheader.iter27 ], [ %inc.i.iter27, %for.body.i.iter27 ]
  %b.addr.0.i2.iter27 = phi ptr [ %b, %for.cond.i.preheader.iter27 ], [ %add.ptr.i.iter27, %for.body.i.iter27 ]
  %ret.0.i1.iter27 = phi i8 [ 0, %for.cond.i.preheader.iter27 ], [ %xor1.i.i.iter27, %for.body.i.iter27 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter27 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter26, i32 %i.0.i3.iter27, !dbg !164
  %324 = load i8, ptr %arrayidx.i.iter27, align 1, !dbg !164
  %325 = load i8, ptr %b.addr.0.i2.iter27, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %326 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter27 = xor i8 %324, %326, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %327 = trunc i8 %xor1.i.iter27 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %328 = and i8 %xor1.i.iter27, 2, !dbg !179
  %mul9.i.iter27 = mul i8 %328, %325, !dbg !180
  %conv10.i.iter27 = select i1 %327, i8 %325, i8 0, !dbg !177
  %xor11.i.iter27 = xor i8 %conv10.i.iter27, %mul9.i.iter27, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %329 = and i8 %xor1.i.iter27, 4, !dbg !182
  %mul16.i.iter27 = mul i8 %329, %325, !dbg !183
  %xor18.i.iter27 = xor i8 %mul16.i.iter27, %xor11.i.iter27, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %330 = and i8 %xor1.i.iter27, 8, !dbg !185
  %mul23.i.iter27 = mul i8 %330, %325, !dbg !186
  %xor25.i.iter27 = xor i8 %mul23.i.iter27, %xor18.i.iter27, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %331 = lshr i8 %xor25.i.iter27, 4, !dbg !189
  %332 = lshr i8 %xor25.i.iter27, 3, !dbg !190
  %333 = and i8 %332, 14, !dbg !190
  %334 = xor i8 %331, %333, !dbg !191
  %xor25.masked.i.iter27 = and i8 %xor25.i.iter27, 15, !dbg !192
  %335 = xor i8 %334, %xor25.masked.i.iter27, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter27 = xor i8 %335, %ret.0.i1.iter27, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter27 = add nuw nsw i32 %i.0.i3.iter27, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter27 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter27, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter27 = icmp eq i32 %inc.i.iter27, 8, !dbg !202
  br i1 %exitcond.i.not.iter27, label %lincomb.exit.iter27, label %for.body.i.iter27, !dbg !203, !llvm.loop !204

lincomb.exit.iter27:                              ; preds = %for.body.i.iter27
  %ret.0.i.lcssa.iter27 = phi i8 [ %xor1.i.i.iter27, %for.body.i.iter27 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter27, ptr %c.addr.1.lcssa.iter26, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter27 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter26, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter27, !dbg !150

for.cond.i.preheader.iter27:                      ; preds = %for.cond1.preheader.iter27
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter27, !dbg !203

iter_27_end:                                      ; preds = %for.inc4.iter27
  br label %iter_28_start

iter_28_start:                                    ; preds = %iter_27_end
  br label %for.cond1.preheader.iter28

for.cond1.preheader.iter28:                       ; preds = %iter_28_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter28, !dbg !150

for.inc4.iter28:                                  ; preds = %lincomb.exit.iter28
  %c.addr.1.lcssa.iter28 = phi ptr [ %incdec.ptr.iter28, %lincomb.exit.iter28 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter28 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter27, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_28_end

for.body.i.iter28:                                ; preds = %for.cond.i.preheader.iter28, %for.body.i.iter28
  %i.0.i3.iter28 = phi i32 [ 0, %for.cond.i.preheader.iter28 ], [ %inc.i.iter28, %for.body.i.iter28 ]
  %b.addr.0.i2.iter28 = phi ptr [ %b, %for.cond.i.preheader.iter28 ], [ %add.ptr.i.iter28, %for.body.i.iter28 ]
  %ret.0.i1.iter28 = phi i8 [ 0, %for.cond.i.preheader.iter28 ], [ %xor1.i.i.iter28, %for.body.i.iter28 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter28 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter27, i32 %i.0.i3.iter28, !dbg !164
  %336 = load i8, ptr %arrayidx.i.iter28, align 1, !dbg !164
  %337 = load i8, ptr %b.addr.0.i2.iter28, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %338 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter28 = xor i8 %336, %338, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %339 = trunc i8 %xor1.i.iter28 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %340 = and i8 %xor1.i.iter28, 2, !dbg !179
  %mul9.i.iter28 = mul i8 %340, %337, !dbg !180
  %conv10.i.iter28 = select i1 %339, i8 %337, i8 0, !dbg !177
  %xor11.i.iter28 = xor i8 %conv10.i.iter28, %mul9.i.iter28, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %341 = and i8 %xor1.i.iter28, 4, !dbg !182
  %mul16.i.iter28 = mul i8 %341, %337, !dbg !183
  %xor18.i.iter28 = xor i8 %mul16.i.iter28, %xor11.i.iter28, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %342 = and i8 %xor1.i.iter28, 8, !dbg !185
  %mul23.i.iter28 = mul i8 %342, %337, !dbg !186
  %xor25.i.iter28 = xor i8 %mul23.i.iter28, %xor18.i.iter28, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %343 = lshr i8 %xor25.i.iter28, 4, !dbg !189
  %344 = lshr i8 %xor25.i.iter28, 3, !dbg !190
  %345 = and i8 %344, 14, !dbg !190
  %346 = xor i8 %343, %345, !dbg !191
  %xor25.masked.i.iter28 = and i8 %xor25.i.iter28, 15, !dbg !192
  %347 = xor i8 %346, %xor25.masked.i.iter28, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter28 = xor i8 %347, %ret.0.i1.iter28, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter28 = add nuw nsw i32 %i.0.i3.iter28, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter28 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter28, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter28 = icmp eq i32 %inc.i.iter28, 8, !dbg !202
  br i1 %exitcond.i.not.iter28, label %lincomb.exit.iter28, label %for.body.i.iter28, !dbg !203, !llvm.loop !204

lincomb.exit.iter28:                              ; preds = %for.body.i.iter28
  %ret.0.i.lcssa.iter28 = phi i8 [ %xor1.i.i.iter28, %for.body.i.iter28 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter28, ptr %c.addr.1.lcssa.iter27, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter28 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter27, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter28, !dbg !150

for.cond.i.preheader.iter28:                      ; preds = %for.cond1.preheader.iter28
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter28, !dbg !203

iter_28_end:                                      ; preds = %for.inc4.iter28
  br label %iter_29_start

iter_29_start:                                    ; preds = %iter_28_end
  br label %for.cond1.preheader.iter29

for.cond1.preheader.iter29:                       ; preds = %iter_29_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter29, !dbg !150

for.inc4.iter29:                                  ; preds = %lincomb.exit.iter29
  %c.addr.1.lcssa.iter29 = phi ptr [ %incdec.ptr.iter29, %lincomb.exit.iter29 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter29 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter28, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_29_end

for.body.i.iter29:                                ; preds = %for.cond.i.preheader.iter29, %for.body.i.iter29
  %i.0.i3.iter29 = phi i32 [ 0, %for.cond.i.preheader.iter29 ], [ %inc.i.iter29, %for.body.i.iter29 ]
  %b.addr.0.i2.iter29 = phi ptr [ %b, %for.cond.i.preheader.iter29 ], [ %add.ptr.i.iter29, %for.body.i.iter29 ]
  %ret.0.i1.iter29 = phi i8 [ 0, %for.cond.i.preheader.iter29 ], [ %xor1.i.i.iter29, %for.body.i.iter29 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter29 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter28, i32 %i.0.i3.iter29, !dbg !164
  %348 = load i8, ptr %arrayidx.i.iter29, align 1, !dbg !164
  %349 = load i8, ptr %b.addr.0.i2.iter29, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %350 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter29 = xor i8 %348, %350, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %351 = trunc i8 %xor1.i.iter29 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %352 = and i8 %xor1.i.iter29, 2, !dbg !179
  %mul9.i.iter29 = mul i8 %352, %349, !dbg !180
  %conv10.i.iter29 = select i1 %351, i8 %349, i8 0, !dbg !177
  %xor11.i.iter29 = xor i8 %conv10.i.iter29, %mul9.i.iter29, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %353 = and i8 %xor1.i.iter29, 4, !dbg !182
  %mul16.i.iter29 = mul i8 %353, %349, !dbg !183
  %xor18.i.iter29 = xor i8 %mul16.i.iter29, %xor11.i.iter29, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %354 = and i8 %xor1.i.iter29, 8, !dbg !185
  %mul23.i.iter29 = mul i8 %354, %349, !dbg !186
  %xor25.i.iter29 = xor i8 %mul23.i.iter29, %xor18.i.iter29, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %355 = lshr i8 %xor25.i.iter29, 4, !dbg !189
  %356 = lshr i8 %xor25.i.iter29, 3, !dbg !190
  %357 = and i8 %356, 14, !dbg !190
  %358 = xor i8 %355, %357, !dbg !191
  %xor25.masked.i.iter29 = and i8 %xor25.i.iter29, 15, !dbg !192
  %359 = xor i8 %358, %xor25.masked.i.iter29, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter29 = xor i8 %359, %ret.0.i1.iter29, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter29 = add nuw nsw i32 %i.0.i3.iter29, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter29 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter29, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter29 = icmp eq i32 %inc.i.iter29, 8, !dbg !202
  br i1 %exitcond.i.not.iter29, label %lincomb.exit.iter29, label %for.body.i.iter29, !dbg !203, !llvm.loop !204

lincomb.exit.iter29:                              ; preds = %for.body.i.iter29
  %ret.0.i.lcssa.iter29 = phi i8 [ %xor1.i.i.iter29, %for.body.i.iter29 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter29, ptr %c.addr.1.lcssa.iter28, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter29 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter28, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter29, !dbg !150

for.cond.i.preheader.iter29:                      ; preds = %for.cond1.preheader.iter29
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter29, !dbg !203

iter_29_end:                                      ; preds = %for.inc4.iter29
  br label %iter_30_start

iter_30_start:                                    ; preds = %iter_29_end
  br label %for.cond1.preheader.iter30

for.cond1.preheader.iter30:                       ; preds = %iter_30_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter30, !dbg !150

for.inc4.iter30:                                  ; preds = %lincomb.exit.iter30
  %c.addr.1.lcssa.iter30 = phi ptr [ %incdec.ptr.iter30, %lincomb.exit.iter30 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter30 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter29, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_30_end

for.body.i.iter30:                                ; preds = %for.cond.i.preheader.iter30, %for.body.i.iter30
  %i.0.i3.iter30 = phi i32 [ 0, %for.cond.i.preheader.iter30 ], [ %inc.i.iter30, %for.body.i.iter30 ]
  %b.addr.0.i2.iter30 = phi ptr [ %b, %for.cond.i.preheader.iter30 ], [ %add.ptr.i.iter30, %for.body.i.iter30 ]
  %ret.0.i1.iter30 = phi i8 [ 0, %for.cond.i.preheader.iter30 ], [ %xor1.i.i.iter30, %for.body.i.iter30 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter30 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter29, i32 %i.0.i3.iter30, !dbg !164
  %360 = load i8, ptr %arrayidx.i.iter30, align 1, !dbg !164
  %361 = load i8, ptr %b.addr.0.i2.iter30, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %362 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter30 = xor i8 %360, %362, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %363 = trunc i8 %xor1.i.iter30 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %364 = and i8 %xor1.i.iter30, 2, !dbg !179
  %mul9.i.iter30 = mul i8 %364, %361, !dbg !180
  %conv10.i.iter30 = select i1 %363, i8 %361, i8 0, !dbg !177
  %xor11.i.iter30 = xor i8 %conv10.i.iter30, %mul9.i.iter30, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %365 = and i8 %xor1.i.iter30, 4, !dbg !182
  %mul16.i.iter30 = mul i8 %365, %361, !dbg !183
  %xor18.i.iter30 = xor i8 %mul16.i.iter30, %xor11.i.iter30, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %366 = and i8 %xor1.i.iter30, 8, !dbg !185
  %mul23.i.iter30 = mul i8 %366, %361, !dbg !186
  %xor25.i.iter30 = xor i8 %mul23.i.iter30, %xor18.i.iter30, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %367 = lshr i8 %xor25.i.iter30, 4, !dbg !189
  %368 = lshr i8 %xor25.i.iter30, 3, !dbg !190
  %369 = and i8 %368, 14, !dbg !190
  %370 = xor i8 %367, %369, !dbg !191
  %xor25.masked.i.iter30 = and i8 %xor25.i.iter30, 15, !dbg !192
  %371 = xor i8 %370, %xor25.masked.i.iter30, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter30 = xor i8 %371, %ret.0.i1.iter30, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter30 = add nuw nsw i32 %i.0.i3.iter30, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter30 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter30, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter30 = icmp eq i32 %inc.i.iter30, 8, !dbg !202
  br i1 %exitcond.i.not.iter30, label %lincomb.exit.iter30, label %for.body.i.iter30, !dbg !203, !llvm.loop !204

lincomb.exit.iter30:                              ; preds = %for.body.i.iter30
  %ret.0.i.lcssa.iter30 = phi i8 [ %xor1.i.i.iter30, %for.body.i.iter30 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter30, ptr %c.addr.1.lcssa.iter29, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter30 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter29, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter30, !dbg !150

for.cond.i.preheader.iter30:                      ; preds = %for.cond1.preheader.iter30
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter30, !dbg !203

iter_30_end:                                      ; preds = %for.inc4.iter30
  br label %iter_31_start

iter_31_start:                                    ; preds = %iter_30_end
  br label %for.cond1.preheader.iter31

for.cond1.preheader.iter31:                       ; preds = %iter_31_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter31, !dbg !150

for.inc4.iter31:                                  ; preds = %lincomb.exit.iter31
  %c.addr.1.lcssa.iter31 = phi ptr [ %incdec.ptr.iter31, %lincomb.exit.iter31 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter31 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter30, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_31_end

for.body.i.iter31:                                ; preds = %for.cond.i.preheader.iter31, %for.body.i.iter31
  %i.0.i3.iter31 = phi i32 [ 0, %for.cond.i.preheader.iter31 ], [ %inc.i.iter31, %for.body.i.iter31 ]
  %b.addr.0.i2.iter31 = phi ptr [ %b, %for.cond.i.preheader.iter31 ], [ %add.ptr.i.iter31, %for.body.i.iter31 ]
  %ret.0.i1.iter31 = phi i8 [ 0, %for.cond.i.preheader.iter31 ], [ %xor1.i.i.iter31, %for.body.i.iter31 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter31 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter30, i32 %i.0.i3.iter31, !dbg !164
  %372 = load i8, ptr %arrayidx.i.iter31, align 1, !dbg !164
  %373 = load i8, ptr %b.addr.0.i2.iter31, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %374 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter31 = xor i8 %372, %374, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %375 = trunc i8 %xor1.i.iter31 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %376 = and i8 %xor1.i.iter31, 2, !dbg !179
  %mul9.i.iter31 = mul i8 %376, %373, !dbg !180
  %conv10.i.iter31 = select i1 %375, i8 %373, i8 0, !dbg !177
  %xor11.i.iter31 = xor i8 %conv10.i.iter31, %mul9.i.iter31, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %377 = and i8 %xor1.i.iter31, 4, !dbg !182
  %mul16.i.iter31 = mul i8 %377, %373, !dbg !183
  %xor18.i.iter31 = xor i8 %mul16.i.iter31, %xor11.i.iter31, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %378 = and i8 %xor1.i.iter31, 8, !dbg !185
  %mul23.i.iter31 = mul i8 %378, %373, !dbg !186
  %xor25.i.iter31 = xor i8 %mul23.i.iter31, %xor18.i.iter31, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %379 = lshr i8 %xor25.i.iter31, 4, !dbg !189
  %380 = lshr i8 %xor25.i.iter31, 3, !dbg !190
  %381 = and i8 %380, 14, !dbg !190
  %382 = xor i8 %379, %381, !dbg !191
  %xor25.masked.i.iter31 = and i8 %xor25.i.iter31, 15, !dbg !192
  %383 = xor i8 %382, %xor25.masked.i.iter31, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter31 = xor i8 %383, %ret.0.i1.iter31, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter31 = add nuw nsw i32 %i.0.i3.iter31, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter31 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter31, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter31 = icmp eq i32 %inc.i.iter31, 8, !dbg !202
  br i1 %exitcond.i.not.iter31, label %lincomb.exit.iter31, label %for.body.i.iter31, !dbg !203, !llvm.loop !204

lincomb.exit.iter31:                              ; preds = %for.body.i.iter31
  %ret.0.i.lcssa.iter31 = phi i8 [ %xor1.i.i.iter31, %for.body.i.iter31 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter31, ptr %c.addr.1.lcssa.iter30, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter31 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter30, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter31, !dbg !150

for.cond.i.preheader.iter31:                      ; preds = %for.cond1.preheader.iter31
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter31, !dbg !203

iter_31_end:                                      ; preds = %for.inc4.iter31
  br label %iter_32_start

iter_32_start:                                    ; preds = %iter_31_end
  br label %for.cond1.preheader.iter32

for.cond1.preheader.iter32:                       ; preds = %iter_32_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter32, !dbg !150

for.inc4.iter32:                                  ; preds = %lincomb.exit.iter32
  %c.addr.1.lcssa.iter32 = phi ptr [ %incdec.ptr.iter32, %lincomb.exit.iter32 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter32 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter31, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_32_end

for.body.i.iter32:                                ; preds = %for.cond.i.preheader.iter32, %for.body.i.iter32
  %i.0.i3.iter32 = phi i32 [ 0, %for.cond.i.preheader.iter32 ], [ %inc.i.iter32, %for.body.i.iter32 ]
  %b.addr.0.i2.iter32 = phi ptr [ %b, %for.cond.i.preheader.iter32 ], [ %add.ptr.i.iter32, %for.body.i.iter32 ]
  %ret.0.i1.iter32 = phi i8 [ 0, %for.cond.i.preheader.iter32 ], [ %xor1.i.i.iter32, %for.body.i.iter32 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter32 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter31, i32 %i.0.i3.iter32, !dbg !164
  %384 = load i8, ptr %arrayidx.i.iter32, align 1, !dbg !164
  %385 = load i8, ptr %b.addr.0.i2.iter32, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %386 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter32 = xor i8 %384, %386, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %387 = trunc i8 %xor1.i.iter32 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %388 = and i8 %xor1.i.iter32, 2, !dbg !179
  %mul9.i.iter32 = mul i8 %388, %385, !dbg !180
  %conv10.i.iter32 = select i1 %387, i8 %385, i8 0, !dbg !177
  %xor11.i.iter32 = xor i8 %conv10.i.iter32, %mul9.i.iter32, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %389 = and i8 %xor1.i.iter32, 4, !dbg !182
  %mul16.i.iter32 = mul i8 %389, %385, !dbg !183
  %xor18.i.iter32 = xor i8 %mul16.i.iter32, %xor11.i.iter32, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %390 = and i8 %xor1.i.iter32, 8, !dbg !185
  %mul23.i.iter32 = mul i8 %390, %385, !dbg !186
  %xor25.i.iter32 = xor i8 %mul23.i.iter32, %xor18.i.iter32, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %391 = lshr i8 %xor25.i.iter32, 4, !dbg !189
  %392 = lshr i8 %xor25.i.iter32, 3, !dbg !190
  %393 = and i8 %392, 14, !dbg !190
  %394 = xor i8 %391, %393, !dbg !191
  %xor25.masked.i.iter32 = and i8 %xor25.i.iter32, 15, !dbg !192
  %395 = xor i8 %394, %xor25.masked.i.iter32, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter32 = xor i8 %395, %ret.0.i1.iter32, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter32 = add nuw nsw i32 %i.0.i3.iter32, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter32 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter32, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter32 = icmp eq i32 %inc.i.iter32, 8, !dbg !202
  br i1 %exitcond.i.not.iter32, label %lincomb.exit.iter32, label %for.body.i.iter32, !dbg !203, !llvm.loop !204

lincomb.exit.iter32:                              ; preds = %for.body.i.iter32
  %ret.0.i.lcssa.iter32 = phi i8 [ %xor1.i.i.iter32, %for.body.i.iter32 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter32, ptr %c.addr.1.lcssa.iter31, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter32 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter31, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter32, !dbg !150

for.cond.i.preheader.iter32:                      ; preds = %for.cond1.preheader.iter32
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter32, !dbg !203

iter_32_end:                                      ; preds = %for.inc4.iter32
  br label %iter_33_start

iter_33_start:                                    ; preds = %iter_32_end
  br label %for.cond1.preheader.iter33

for.cond1.preheader.iter33:                       ; preds = %iter_33_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter33, !dbg !150

for.inc4.iter33:                                  ; preds = %lincomb.exit.iter33
  %c.addr.1.lcssa.iter33 = phi ptr [ %incdec.ptr.iter33, %lincomb.exit.iter33 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter33 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter32, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_33_end

for.body.i.iter33:                                ; preds = %for.cond.i.preheader.iter33, %for.body.i.iter33
  %i.0.i3.iter33 = phi i32 [ 0, %for.cond.i.preheader.iter33 ], [ %inc.i.iter33, %for.body.i.iter33 ]
  %b.addr.0.i2.iter33 = phi ptr [ %b, %for.cond.i.preheader.iter33 ], [ %add.ptr.i.iter33, %for.body.i.iter33 ]
  %ret.0.i1.iter33 = phi i8 [ 0, %for.cond.i.preheader.iter33 ], [ %xor1.i.i.iter33, %for.body.i.iter33 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter33 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter32, i32 %i.0.i3.iter33, !dbg !164
  %396 = load i8, ptr %arrayidx.i.iter33, align 1, !dbg !164
  %397 = load i8, ptr %b.addr.0.i2.iter33, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %398 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter33 = xor i8 %396, %398, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %399 = trunc i8 %xor1.i.iter33 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %400 = and i8 %xor1.i.iter33, 2, !dbg !179
  %mul9.i.iter33 = mul i8 %400, %397, !dbg !180
  %conv10.i.iter33 = select i1 %399, i8 %397, i8 0, !dbg !177
  %xor11.i.iter33 = xor i8 %conv10.i.iter33, %mul9.i.iter33, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %401 = and i8 %xor1.i.iter33, 4, !dbg !182
  %mul16.i.iter33 = mul i8 %401, %397, !dbg !183
  %xor18.i.iter33 = xor i8 %mul16.i.iter33, %xor11.i.iter33, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %402 = and i8 %xor1.i.iter33, 8, !dbg !185
  %mul23.i.iter33 = mul i8 %402, %397, !dbg !186
  %xor25.i.iter33 = xor i8 %mul23.i.iter33, %xor18.i.iter33, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %403 = lshr i8 %xor25.i.iter33, 4, !dbg !189
  %404 = lshr i8 %xor25.i.iter33, 3, !dbg !190
  %405 = and i8 %404, 14, !dbg !190
  %406 = xor i8 %403, %405, !dbg !191
  %xor25.masked.i.iter33 = and i8 %xor25.i.iter33, 15, !dbg !192
  %407 = xor i8 %406, %xor25.masked.i.iter33, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter33 = xor i8 %407, %ret.0.i1.iter33, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter33 = add nuw nsw i32 %i.0.i3.iter33, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter33 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter33, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter33 = icmp eq i32 %inc.i.iter33, 8, !dbg !202
  br i1 %exitcond.i.not.iter33, label %lincomb.exit.iter33, label %for.body.i.iter33, !dbg !203, !llvm.loop !204

lincomb.exit.iter33:                              ; preds = %for.body.i.iter33
  %ret.0.i.lcssa.iter33 = phi i8 [ %xor1.i.i.iter33, %for.body.i.iter33 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter33, ptr %c.addr.1.lcssa.iter32, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter33 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter32, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter33, !dbg !150

for.cond.i.preheader.iter33:                      ; preds = %for.cond1.preheader.iter33
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter33, !dbg !203

iter_33_end:                                      ; preds = %for.inc4.iter33
  br label %iter_34_start

iter_34_start:                                    ; preds = %iter_33_end
  br label %for.cond1.preheader.iter34

for.cond1.preheader.iter34:                       ; preds = %iter_34_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter34, !dbg !150

for.inc4.iter34:                                  ; preds = %lincomb.exit.iter34
  %c.addr.1.lcssa.iter34 = phi ptr [ %incdec.ptr.iter34, %lincomb.exit.iter34 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter34 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter33, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_34_end

for.body.i.iter34:                                ; preds = %for.cond.i.preheader.iter34, %for.body.i.iter34
  %i.0.i3.iter34 = phi i32 [ 0, %for.cond.i.preheader.iter34 ], [ %inc.i.iter34, %for.body.i.iter34 ]
  %b.addr.0.i2.iter34 = phi ptr [ %b, %for.cond.i.preheader.iter34 ], [ %add.ptr.i.iter34, %for.body.i.iter34 ]
  %ret.0.i1.iter34 = phi i8 [ 0, %for.cond.i.preheader.iter34 ], [ %xor1.i.i.iter34, %for.body.i.iter34 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter34 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter33, i32 %i.0.i3.iter34, !dbg !164
  %408 = load i8, ptr %arrayidx.i.iter34, align 1, !dbg !164
  %409 = load i8, ptr %b.addr.0.i2.iter34, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %410 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter34 = xor i8 %408, %410, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %411 = trunc i8 %xor1.i.iter34 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %412 = and i8 %xor1.i.iter34, 2, !dbg !179
  %mul9.i.iter34 = mul i8 %412, %409, !dbg !180
  %conv10.i.iter34 = select i1 %411, i8 %409, i8 0, !dbg !177
  %xor11.i.iter34 = xor i8 %conv10.i.iter34, %mul9.i.iter34, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %413 = and i8 %xor1.i.iter34, 4, !dbg !182
  %mul16.i.iter34 = mul i8 %413, %409, !dbg !183
  %xor18.i.iter34 = xor i8 %mul16.i.iter34, %xor11.i.iter34, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %414 = and i8 %xor1.i.iter34, 8, !dbg !185
  %mul23.i.iter34 = mul i8 %414, %409, !dbg !186
  %xor25.i.iter34 = xor i8 %mul23.i.iter34, %xor18.i.iter34, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %415 = lshr i8 %xor25.i.iter34, 4, !dbg !189
  %416 = lshr i8 %xor25.i.iter34, 3, !dbg !190
  %417 = and i8 %416, 14, !dbg !190
  %418 = xor i8 %415, %417, !dbg !191
  %xor25.masked.i.iter34 = and i8 %xor25.i.iter34, 15, !dbg !192
  %419 = xor i8 %418, %xor25.masked.i.iter34, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter34 = xor i8 %419, %ret.0.i1.iter34, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter34 = add nuw nsw i32 %i.0.i3.iter34, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter34 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter34, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter34 = icmp eq i32 %inc.i.iter34, 8, !dbg !202
  br i1 %exitcond.i.not.iter34, label %lincomb.exit.iter34, label %for.body.i.iter34, !dbg !203, !llvm.loop !204

lincomb.exit.iter34:                              ; preds = %for.body.i.iter34
  %ret.0.i.lcssa.iter34 = phi i8 [ %xor1.i.i.iter34, %for.body.i.iter34 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter34, ptr %c.addr.1.lcssa.iter33, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter34 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter33, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter34, !dbg !150

for.cond.i.preheader.iter34:                      ; preds = %for.cond1.preheader.iter34
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter34, !dbg !203

iter_34_end:                                      ; preds = %for.inc4.iter34
  br label %iter_35_start

iter_35_start:                                    ; preds = %iter_34_end
  br label %for.cond1.preheader.iter35

for.cond1.preheader.iter35:                       ; preds = %iter_35_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter35, !dbg !150

for.inc4.iter35:                                  ; preds = %lincomb.exit.iter35
  %c.addr.1.lcssa.iter35 = phi ptr [ %incdec.ptr.iter35, %lincomb.exit.iter35 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter35 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter34, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_35_end

for.body.i.iter35:                                ; preds = %for.cond.i.preheader.iter35, %for.body.i.iter35
  %i.0.i3.iter35 = phi i32 [ 0, %for.cond.i.preheader.iter35 ], [ %inc.i.iter35, %for.body.i.iter35 ]
  %b.addr.0.i2.iter35 = phi ptr [ %b, %for.cond.i.preheader.iter35 ], [ %add.ptr.i.iter35, %for.body.i.iter35 ]
  %ret.0.i1.iter35 = phi i8 [ 0, %for.cond.i.preheader.iter35 ], [ %xor1.i.i.iter35, %for.body.i.iter35 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter35 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter34, i32 %i.0.i3.iter35, !dbg !164
  %420 = load i8, ptr %arrayidx.i.iter35, align 1, !dbg !164
  %421 = load i8, ptr %b.addr.0.i2.iter35, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %422 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter35 = xor i8 %420, %422, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %423 = trunc i8 %xor1.i.iter35 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %424 = and i8 %xor1.i.iter35, 2, !dbg !179
  %mul9.i.iter35 = mul i8 %424, %421, !dbg !180
  %conv10.i.iter35 = select i1 %423, i8 %421, i8 0, !dbg !177
  %xor11.i.iter35 = xor i8 %conv10.i.iter35, %mul9.i.iter35, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %425 = and i8 %xor1.i.iter35, 4, !dbg !182
  %mul16.i.iter35 = mul i8 %425, %421, !dbg !183
  %xor18.i.iter35 = xor i8 %mul16.i.iter35, %xor11.i.iter35, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %426 = and i8 %xor1.i.iter35, 8, !dbg !185
  %mul23.i.iter35 = mul i8 %426, %421, !dbg !186
  %xor25.i.iter35 = xor i8 %mul23.i.iter35, %xor18.i.iter35, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %427 = lshr i8 %xor25.i.iter35, 4, !dbg !189
  %428 = lshr i8 %xor25.i.iter35, 3, !dbg !190
  %429 = and i8 %428, 14, !dbg !190
  %430 = xor i8 %427, %429, !dbg !191
  %xor25.masked.i.iter35 = and i8 %xor25.i.iter35, 15, !dbg !192
  %431 = xor i8 %430, %xor25.masked.i.iter35, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter35 = xor i8 %431, %ret.0.i1.iter35, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter35 = add nuw nsw i32 %i.0.i3.iter35, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter35 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter35, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter35 = icmp eq i32 %inc.i.iter35, 8, !dbg !202
  br i1 %exitcond.i.not.iter35, label %lincomb.exit.iter35, label %for.body.i.iter35, !dbg !203, !llvm.loop !204

lincomb.exit.iter35:                              ; preds = %for.body.i.iter35
  %ret.0.i.lcssa.iter35 = phi i8 [ %xor1.i.i.iter35, %for.body.i.iter35 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter35, ptr %c.addr.1.lcssa.iter34, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter35 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter34, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter35, !dbg !150

for.cond.i.preheader.iter35:                      ; preds = %for.cond1.preheader.iter35
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter35, !dbg !203

iter_35_end:                                      ; preds = %for.inc4.iter35
  br label %iter_36_start

iter_36_start:                                    ; preds = %iter_35_end
  br label %for.cond1.preheader.iter36

for.cond1.preheader.iter36:                       ; preds = %iter_36_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter36, !dbg !150

for.inc4.iter36:                                  ; preds = %lincomb.exit.iter36
  %c.addr.1.lcssa.iter36 = phi ptr [ %incdec.ptr.iter36, %lincomb.exit.iter36 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter36 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter35, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_36_end

for.body.i.iter36:                                ; preds = %for.cond.i.preheader.iter36, %for.body.i.iter36
  %i.0.i3.iter36 = phi i32 [ 0, %for.cond.i.preheader.iter36 ], [ %inc.i.iter36, %for.body.i.iter36 ]
  %b.addr.0.i2.iter36 = phi ptr [ %b, %for.cond.i.preheader.iter36 ], [ %add.ptr.i.iter36, %for.body.i.iter36 ]
  %ret.0.i1.iter36 = phi i8 [ 0, %for.cond.i.preheader.iter36 ], [ %xor1.i.i.iter36, %for.body.i.iter36 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter36 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter35, i32 %i.0.i3.iter36, !dbg !164
  %432 = load i8, ptr %arrayidx.i.iter36, align 1, !dbg !164
  %433 = load i8, ptr %b.addr.0.i2.iter36, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %434 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter36 = xor i8 %432, %434, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %435 = trunc i8 %xor1.i.iter36 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %436 = and i8 %xor1.i.iter36, 2, !dbg !179
  %mul9.i.iter36 = mul i8 %436, %433, !dbg !180
  %conv10.i.iter36 = select i1 %435, i8 %433, i8 0, !dbg !177
  %xor11.i.iter36 = xor i8 %conv10.i.iter36, %mul9.i.iter36, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %437 = and i8 %xor1.i.iter36, 4, !dbg !182
  %mul16.i.iter36 = mul i8 %437, %433, !dbg !183
  %xor18.i.iter36 = xor i8 %mul16.i.iter36, %xor11.i.iter36, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %438 = and i8 %xor1.i.iter36, 8, !dbg !185
  %mul23.i.iter36 = mul i8 %438, %433, !dbg !186
  %xor25.i.iter36 = xor i8 %mul23.i.iter36, %xor18.i.iter36, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %439 = lshr i8 %xor25.i.iter36, 4, !dbg !189
  %440 = lshr i8 %xor25.i.iter36, 3, !dbg !190
  %441 = and i8 %440, 14, !dbg !190
  %442 = xor i8 %439, %441, !dbg !191
  %xor25.masked.i.iter36 = and i8 %xor25.i.iter36, 15, !dbg !192
  %443 = xor i8 %442, %xor25.masked.i.iter36, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter36 = xor i8 %443, %ret.0.i1.iter36, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter36 = add nuw nsw i32 %i.0.i3.iter36, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter36 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter36, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter36 = icmp eq i32 %inc.i.iter36, 8, !dbg !202
  br i1 %exitcond.i.not.iter36, label %lincomb.exit.iter36, label %for.body.i.iter36, !dbg !203, !llvm.loop !204

lincomb.exit.iter36:                              ; preds = %for.body.i.iter36
  %ret.0.i.lcssa.iter36 = phi i8 [ %xor1.i.i.iter36, %for.body.i.iter36 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter36, ptr %c.addr.1.lcssa.iter35, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter36 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter35, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter36, !dbg !150

for.cond.i.preheader.iter36:                      ; preds = %for.cond1.preheader.iter36
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter36, !dbg !203

iter_36_end:                                      ; preds = %for.inc4.iter36
  br label %iter_37_start

iter_37_start:                                    ; preds = %iter_36_end
  br label %for.cond1.preheader.iter37

for.cond1.preheader.iter37:                       ; preds = %iter_37_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter37, !dbg !150

for.inc4.iter37:                                  ; preds = %lincomb.exit.iter37
  %c.addr.1.lcssa.iter37 = phi ptr [ %incdec.ptr.iter37, %lincomb.exit.iter37 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter37 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter36, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_37_end

for.body.i.iter37:                                ; preds = %for.cond.i.preheader.iter37, %for.body.i.iter37
  %i.0.i3.iter37 = phi i32 [ 0, %for.cond.i.preheader.iter37 ], [ %inc.i.iter37, %for.body.i.iter37 ]
  %b.addr.0.i2.iter37 = phi ptr [ %b, %for.cond.i.preheader.iter37 ], [ %add.ptr.i.iter37, %for.body.i.iter37 ]
  %ret.0.i1.iter37 = phi i8 [ 0, %for.cond.i.preheader.iter37 ], [ %xor1.i.i.iter37, %for.body.i.iter37 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter37 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter36, i32 %i.0.i3.iter37, !dbg !164
  %444 = load i8, ptr %arrayidx.i.iter37, align 1, !dbg !164
  %445 = load i8, ptr %b.addr.0.i2.iter37, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %446 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter37 = xor i8 %444, %446, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %447 = trunc i8 %xor1.i.iter37 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %448 = and i8 %xor1.i.iter37, 2, !dbg !179
  %mul9.i.iter37 = mul i8 %448, %445, !dbg !180
  %conv10.i.iter37 = select i1 %447, i8 %445, i8 0, !dbg !177
  %xor11.i.iter37 = xor i8 %conv10.i.iter37, %mul9.i.iter37, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %449 = and i8 %xor1.i.iter37, 4, !dbg !182
  %mul16.i.iter37 = mul i8 %449, %445, !dbg !183
  %xor18.i.iter37 = xor i8 %mul16.i.iter37, %xor11.i.iter37, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %450 = and i8 %xor1.i.iter37, 8, !dbg !185
  %mul23.i.iter37 = mul i8 %450, %445, !dbg !186
  %xor25.i.iter37 = xor i8 %mul23.i.iter37, %xor18.i.iter37, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %451 = lshr i8 %xor25.i.iter37, 4, !dbg !189
  %452 = lshr i8 %xor25.i.iter37, 3, !dbg !190
  %453 = and i8 %452, 14, !dbg !190
  %454 = xor i8 %451, %453, !dbg !191
  %xor25.masked.i.iter37 = and i8 %xor25.i.iter37, 15, !dbg !192
  %455 = xor i8 %454, %xor25.masked.i.iter37, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter37 = xor i8 %455, %ret.0.i1.iter37, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter37 = add nuw nsw i32 %i.0.i3.iter37, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter37 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter37, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter37 = icmp eq i32 %inc.i.iter37, 8, !dbg !202
  br i1 %exitcond.i.not.iter37, label %lincomb.exit.iter37, label %for.body.i.iter37, !dbg !203, !llvm.loop !204

lincomb.exit.iter37:                              ; preds = %for.body.i.iter37
  %ret.0.i.lcssa.iter37 = phi i8 [ %xor1.i.i.iter37, %for.body.i.iter37 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter37, ptr %c.addr.1.lcssa.iter36, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter37 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter36, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter37, !dbg !150

for.cond.i.preheader.iter37:                      ; preds = %for.cond1.preheader.iter37
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter37, !dbg !203

iter_37_end:                                      ; preds = %for.inc4.iter37
  br label %iter_38_start

iter_38_start:                                    ; preds = %iter_37_end
  br label %for.cond1.preheader.iter38

for.cond1.preheader.iter38:                       ; preds = %iter_38_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter38, !dbg !150

for.inc4.iter38:                                  ; preds = %lincomb.exit.iter38
  %c.addr.1.lcssa.iter38 = phi ptr [ %incdec.ptr.iter38, %lincomb.exit.iter38 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter38 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter37, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_38_end

for.body.i.iter38:                                ; preds = %for.cond.i.preheader.iter38, %for.body.i.iter38
  %i.0.i3.iter38 = phi i32 [ 0, %for.cond.i.preheader.iter38 ], [ %inc.i.iter38, %for.body.i.iter38 ]
  %b.addr.0.i2.iter38 = phi ptr [ %b, %for.cond.i.preheader.iter38 ], [ %add.ptr.i.iter38, %for.body.i.iter38 ]
  %ret.0.i1.iter38 = phi i8 [ 0, %for.cond.i.preheader.iter38 ], [ %xor1.i.i.iter38, %for.body.i.iter38 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter38 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter37, i32 %i.0.i3.iter38, !dbg !164
  %456 = load i8, ptr %arrayidx.i.iter38, align 1, !dbg !164
  %457 = load i8, ptr %b.addr.0.i2.iter38, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %458 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter38 = xor i8 %456, %458, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %459 = trunc i8 %xor1.i.iter38 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %460 = and i8 %xor1.i.iter38, 2, !dbg !179
  %mul9.i.iter38 = mul i8 %460, %457, !dbg !180
  %conv10.i.iter38 = select i1 %459, i8 %457, i8 0, !dbg !177
  %xor11.i.iter38 = xor i8 %conv10.i.iter38, %mul9.i.iter38, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %461 = and i8 %xor1.i.iter38, 4, !dbg !182
  %mul16.i.iter38 = mul i8 %461, %457, !dbg !183
  %xor18.i.iter38 = xor i8 %mul16.i.iter38, %xor11.i.iter38, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %462 = and i8 %xor1.i.iter38, 8, !dbg !185
  %mul23.i.iter38 = mul i8 %462, %457, !dbg !186
  %xor25.i.iter38 = xor i8 %mul23.i.iter38, %xor18.i.iter38, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %463 = lshr i8 %xor25.i.iter38, 4, !dbg !189
  %464 = lshr i8 %xor25.i.iter38, 3, !dbg !190
  %465 = and i8 %464, 14, !dbg !190
  %466 = xor i8 %463, %465, !dbg !191
  %xor25.masked.i.iter38 = and i8 %xor25.i.iter38, 15, !dbg !192
  %467 = xor i8 %466, %xor25.masked.i.iter38, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter38 = xor i8 %467, %ret.0.i1.iter38, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter38 = add nuw nsw i32 %i.0.i3.iter38, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter38 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter38, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter38 = icmp eq i32 %inc.i.iter38, 8, !dbg !202
  br i1 %exitcond.i.not.iter38, label %lincomb.exit.iter38, label %for.body.i.iter38, !dbg !203, !llvm.loop !204

lincomb.exit.iter38:                              ; preds = %for.body.i.iter38
  %ret.0.i.lcssa.iter38 = phi i8 [ %xor1.i.i.iter38, %for.body.i.iter38 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter38, ptr %c.addr.1.lcssa.iter37, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter38 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter37, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter38, !dbg !150

for.cond.i.preheader.iter38:                      ; preds = %for.cond1.preheader.iter38
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter38, !dbg !203

iter_38_end:                                      ; preds = %for.inc4.iter38
  br label %iter_39_start

iter_39_start:                                    ; preds = %iter_38_end
  br label %for.cond1.preheader.iter39

for.cond1.preheader.iter39:                       ; preds = %iter_39_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter39, !dbg !150

for.inc4.iter39:                                  ; preds = %lincomb.exit.iter39
  %c.addr.1.lcssa.iter39 = phi ptr [ %incdec.ptr.iter39, %lincomb.exit.iter39 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter39 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter38, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_39_end

for.body.i.iter39:                                ; preds = %for.cond.i.preheader.iter39, %for.body.i.iter39
  %i.0.i3.iter39 = phi i32 [ 0, %for.cond.i.preheader.iter39 ], [ %inc.i.iter39, %for.body.i.iter39 ]
  %b.addr.0.i2.iter39 = phi ptr [ %b, %for.cond.i.preheader.iter39 ], [ %add.ptr.i.iter39, %for.body.i.iter39 ]
  %ret.0.i1.iter39 = phi i8 [ 0, %for.cond.i.preheader.iter39 ], [ %xor1.i.i.iter39, %for.body.i.iter39 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter39 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter38, i32 %i.0.i3.iter39, !dbg !164
  %468 = load i8, ptr %arrayidx.i.iter39, align 1, !dbg !164
  %469 = load i8, ptr %b.addr.0.i2.iter39, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %470 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter39 = xor i8 %468, %470, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %471 = trunc i8 %xor1.i.iter39 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %472 = and i8 %xor1.i.iter39, 2, !dbg !179
  %mul9.i.iter39 = mul i8 %472, %469, !dbg !180
  %conv10.i.iter39 = select i1 %471, i8 %469, i8 0, !dbg !177
  %xor11.i.iter39 = xor i8 %conv10.i.iter39, %mul9.i.iter39, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %473 = and i8 %xor1.i.iter39, 4, !dbg !182
  %mul16.i.iter39 = mul i8 %473, %469, !dbg !183
  %xor18.i.iter39 = xor i8 %mul16.i.iter39, %xor11.i.iter39, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %474 = and i8 %xor1.i.iter39, 8, !dbg !185
  %mul23.i.iter39 = mul i8 %474, %469, !dbg !186
  %xor25.i.iter39 = xor i8 %mul23.i.iter39, %xor18.i.iter39, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %475 = lshr i8 %xor25.i.iter39, 4, !dbg !189
  %476 = lshr i8 %xor25.i.iter39, 3, !dbg !190
  %477 = and i8 %476, 14, !dbg !190
  %478 = xor i8 %475, %477, !dbg !191
  %xor25.masked.i.iter39 = and i8 %xor25.i.iter39, 15, !dbg !192
  %479 = xor i8 %478, %xor25.masked.i.iter39, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter39 = xor i8 %479, %ret.0.i1.iter39, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter39 = add nuw nsw i32 %i.0.i3.iter39, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter39 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter39, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter39 = icmp eq i32 %inc.i.iter39, 8, !dbg !202
  br i1 %exitcond.i.not.iter39, label %lincomb.exit.iter39, label %for.body.i.iter39, !dbg !203, !llvm.loop !204

lincomb.exit.iter39:                              ; preds = %for.body.i.iter39
  %ret.0.i.lcssa.iter39 = phi i8 [ %xor1.i.i.iter39, %for.body.i.iter39 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter39, ptr %c.addr.1.lcssa.iter38, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter39 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter38, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter39, !dbg !150

for.cond.i.preheader.iter39:                      ; preds = %for.cond1.preheader.iter39
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter39, !dbg !203

iter_39_end:                                      ; preds = %for.inc4.iter39
  br label %iter_40_start

iter_40_start:                                    ; preds = %iter_39_end
  br label %for.cond1.preheader.iter40

for.cond1.preheader.iter40:                       ; preds = %iter_40_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter40, !dbg !150

for.inc4.iter40:                                  ; preds = %lincomb.exit.iter40
  %c.addr.1.lcssa.iter40 = phi ptr [ %incdec.ptr.iter40, %lincomb.exit.iter40 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter40 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter39, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_40_end

for.body.i.iter40:                                ; preds = %for.cond.i.preheader.iter40, %for.body.i.iter40
  %i.0.i3.iter40 = phi i32 [ 0, %for.cond.i.preheader.iter40 ], [ %inc.i.iter40, %for.body.i.iter40 ]
  %b.addr.0.i2.iter40 = phi ptr [ %b, %for.cond.i.preheader.iter40 ], [ %add.ptr.i.iter40, %for.body.i.iter40 ]
  %ret.0.i1.iter40 = phi i8 [ 0, %for.cond.i.preheader.iter40 ], [ %xor1.i.i.iter40, %for.body.i.iter40 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter40 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter39, i32 %i.0.i3.iter40, !dbg !164
  %480 = load i8, ptr %arrayidx.i.iter40, align 1, !dbg !164
  %481 = load i8, ptr %b.addr.0.i2.iter40, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %482 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter40 = xor i8 %480, %482, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %483 = trunc i8 %xor1.i.iter40 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %484 = and i8 %xor1.i.iter40, 2, !dbg !179
  %mul9.i.iter40 = mul i8 %484, %481, !dbg !180
  %conv10.i.iter40 = select i1 %483, i8 %481, i8 0, !dbg !177
  %xor11.i.iter40 = xor i8 %conv10.i.iter40, %mul9.i.iter40, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %485 = and i8 %xor1.i.iter40, 4, !dbg !182
  %mul16.i.iter40 = mul i8 %485, %481, !dbg !183
  %xor18.i.iter40 = xor i8 %mul16.i.iter40, %xor11.i.iter40, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %486 = and i8 %xor1.i.iter40, 8, !dbg !185
  %mul23.i.iter40 = mul i8 %486, %481, !dbg !186
  %xor25.i.iter40 = xor i8 %mul23.i.iter40, %xor18.i.iter40, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %487 = lshr i8 %xor25.i.iter40, 4, !dbg !189
  %488 = lshr i8 %xor25.i.iter40, 3, !dbg !190
  %489 = and i8 %488, 14, !dbg !190
  %490 = xor i8 %487, %489, !dbg !191
  %xor25.masked.i.iter40 = and i8 %xor25.i.iter40, 15, !dbg !192
  %491 = xor i8 %490, %xor25.masked.i.iter40, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter40 = xor i8 %491, %ret.0.i1.iter40, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter40 = add nuw nsw i32 %i.0.i3.iter40, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter40 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter40, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter40 = icmp eq i32 %inc.i.iter40, 8, !dbg !202
  br i1 %exitcond.i.not.iter40, label %lincomb.exit.iter40, label %for.body.i.iter40, !dbg !203, !llvm.loop !204

lincomb.exit.iter40:                              ; preds = %for.body.i.iter40
  %ret.0.i.lcssa.iter40 = phi i8 [ %xor1.i.i.iter40, %for.body.i.iter40 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter40, ptr %c.addr.1.lcssa.iter39, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter40 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter39, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter40, !dbg !150

for.cond.i.preheader.iter40:                      ; preds = %for.cond1.preheader.iter40
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter40, !dbg !203

iter_40_end:                                      ; preds = %for.inc4.iter40
  br label %iter_41_start

iter_41_start:                                    ; preds = %iter_40_end
  br label %for.cond1.preheader.iter41

for.cond1.preheader.iter41:                       ; preds = %iter_41_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter41, !dbg !150

for.inc4.iter41:                                  ; preds = %lincomb.exit.iter41
  %c.addr.1.lcssa.iter41 = phi ptr [ %incdec.ptr.iter41, %lincomb.exit.iter41 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter41 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter40, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_41_end

for.body.i.iter41:                                ; preds = %for.cond.i.preheader.iter41, %for.body.i.iter41
  %i.0.i3.iter41 = phi i32 [ 0, %for.cond.i.preheader.iter41 ], [ %inc.i.iter41, %for.body.i.iter41 ]
  %b.addr.0.i2.iter41 = phi ptr [ %b, %for.cond.i.preheader.iter41 ], [ %add.ptr.i.iter41, %for.body.i.iter41 ]
  %ret.0.i1.iter41 = phi i8 [ 0, %for.cond.i.preheader.iter41 ], [ %xor1.i.i.iter41, %for.body.i.iter41 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter41 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter40, i32 %i.0.i3.iter41, !dbg !164
  %492 = load i8, ptr %arrayidx.i.iter41, align 1, !dbg !164
  %493 = load i8, ptr %b.addr.0.i2.iter41, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %494 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter41 = xor i8 %492, %494, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %495 = trunc i8 %xor1.i.iter41 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %496 = and i8 %xor1.i.iter41, 2, !dbg !179
  %mul9.i.iter41 = mul i8 %496, %493, !dbg !180
  %conv10.i.iter41 = select i1 %495, i8 %493, i8 0, !dbg !177
  %xor11.i.iter41 = xor i8 %conv10.i.iter41, %mul9.i.iter41, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %497 = and i8 %xor1.i.iter41, 4, !dbg !182
  %mul16.i.iter41 = mul i8 %497, %493, !dbg !183
  %xor18.i.iter41 = xor i8 %mul16.i.iter41, %xor11.i.iter41, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %498 = and i8 %xor1.i.iter41, 8, !dbg !185
  %mul23.i.iter41 = mul i8 %498, %493, !dbg !186
  %xor25.i.iter41 = xor i8 %mul23.i.iter41, %xor18.i.iter41, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %499 = lshr i8 %xor25.i.iter41, 4, !dbg !189
  %500 = lshr i8 %xor25.i.iter41, 3, !dbg !190
  %501 = and i8 %500, 14, !dbg !190
  %502 = xor i8 %499, %501, !dbg !191
  %xor25.masked.i.iter41 = and i8 %xor25.i.iter41, 15, !dbg !192
  %503 = xor i8 %502, %xor25.masked.i.iter41, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter41 = xor i8 %503, %ret.0.i1.iter41, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter41 = add nuw nsw i32 %i.0.i3.iter41, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter41 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter41, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter41 = icmp eq i32 %inc.i.iter41, 8, !dbg !202
  br i1 %exitcond.i.not.iter41, label %lincomb.exit.iter41, label %for.body.i.iter41, !dbg !203, !llvm.loop !204

lincomb.exit.iter41:                              ; preds = %for.body.i.iter41
  %ret.0.i.lcssa.iter41 = phi i8 [ %xor1.i.i.iter41, %for.body.i.iter41 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter41, ptr %c.addr.1.lcssa.iter40, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter41 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter40, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter41, !dbg !150

for.cond.i.preheader.iter41:                      ; preds = %for.cond1.preheader.iter41
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter41, !dbg !203

iter_41_end:                                      ; preds = %for.inc4.iter41
  br label %iter_42_start

iter_42_start:                                    ; preds = %iter_41_end
  br label %for.cond1.preheader.iter42

for.cond1.preheader.iter42:                       ; preds = %iter_42_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter42, !dbg !150

for.inc4.iter42:                                  ; preds = %lincomb.exit.iter42
  %c.addr.1.lcssa.iter42 = phi ptr [ %incdec.ptr.iter42, %lincomb.exit.iter42 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter42 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter41, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_42_end

for.body.i.iter42:                                ; preds = %for.cond.i.preheader.iter42, %for.body.i.iter42
  %i.0.i3.iter42 = phi i32 [ 0, %for.cond.i.preheader.iter42 ], [ %inc.i.iter42, %for.body.i.iter42 ]
  %b.addr.0.i2.iter42 = phi ptr [ %b, %for.cond.i.preheader.iter42 ], [ %add.ptr.i.iter42, %for.body.i.iter42 ]
  %ret.0.i1.iter42 = phi i8 [ 0, %for.cond.i.preheader.iter42 ], [ %xor1.i.i.iter42, %for.body.i.iter42 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter42 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter41, i32 %i.0.i3.iter42, !dbg !164
  %504 = load i8, ptr %arrayidx.i.iter42, align 1, !dbg !164
  %505 = load i8, ptr %b.addr.0.i2.iter42, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %506 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter42 = xor i8 %504, %506, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %507 = trunc i8 %xor1.i.iter42 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %508 = and i8 %xor1.i.iter42, 2, !dbg !179
  %mul9.i.iter42 = mul i8 %508, %505, !dbg !180
  %conv10.i.iter42 = select i1 %507, i8 %505, i8 0, !dbg !177
  %xor11.i.iter42 = xor i8 %conv10.i.iter42, %mul9.i.iter42, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %509 = and i8 %xor1.i.iter42, 4, !dbg !182
  %mul16.i.iter42 = mul i8 %509, %505, !dbg !183
  %xor18.i.iter42 = xor i8 %mul16.i.iter42, %xor11.i.iter42, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %510 = and i8 %xor1.i.iter42, 8, !dbg !185
  %mul23.i.iter42 = mul i8 %510, %505, !dbg !186
  %xor25.i.iter42 = xor i8 %mul23.i.iter42, %xor18.i.iter42, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %511 = lshr i8 %xor25.i.iter42, 4, !dbg !189
  %512 = lshr i8 %xor25.i.iter42, 3, !dbg !190
  %513 = and i8 %512, 14, !dbg !190
  %514 = xor i8 %511, %513, !dbg !191
  %xor25.masked.i.iter42 = and i8 %xor25.i.iter42, 15, !dbg !192
  %515 = xor i8 %514, %xor25.masked.i.iter42, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter42 = xor i8 %515, %ret.0.i1.iter42, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter42 = add nuw nsw i32 %i.0.i3.iter42, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter42 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter42, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter42 = icmp eq i32 %inc.i.iter42, 8, !dbg !202
  br i1 %exitcond.i.not.iter42, label %lincomb.exit.iter42, label %for.body.i.iter42, !dbg !203, !llvm.loop !204

lincomb.exit.iter42:                              ; preds = %for.body.i.iter42
  %ret.0.i.lcssa.iter42 = phi i8 [ %xor1.i.i.iter42, %for.body.i.iter42 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter42, ptr %c.addr.1.lcssa.iter41, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter42 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter41, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter42, !dbg !150

for.cond.i.preheader.iter42:                      ; preds = %for.cond1.preheader.iter42
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter42, !dbg !203

iter_42_end:                                      ; preds = %for.inc4.iter42
  br label %iter_43_start

iter_43_start:                                    ; preds = %iter_42_end
  br label %for.cond1.preheader.iter43

for.cond1.preheader.iter43:                       ; preds = %iter_43_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter43, !dbg !150

for.inc4.iter43:                                  ; preds = %lincomb.exit.iter43
  %c.addr.1.lcssa.iter43 = phi ptr [ %incdec.ptr.iter43, %lincomb.exit.iter43 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter43 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter42, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_43_end

for.body.i.iter43:                                ; preds = %for.cond.i.preheader.iter43, %for.body.i.iter43
  %i.0.i3.iter43 = phi i32 [ 0, %for.cond.i.preheader.iter43 ], [ %inc.i.iter43, %for.body.i.iter43 ]
  %b.addr.0.i2.iter43 = phi ptr [ %b, %for.cond.i.preheader.iter43 ], [ %add.ptr.i.iter43, %for.body.i.iter43 ]
  %ret.0.i1.iter43 = phi i8 [ 0, %for.cond.i.preheader.iter43 ], [ %xor1.i.i.iter43, %for.body.i.iter43 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter43 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter42, i32 %i.0.i3.iter43, !dbg !164
  %516 = load i8, ptr %arrayidx.i.iter43, align 1, !dbg !164
  %517 = load i8, ptr %b.addr.0.i2.iter43, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %518 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter43 = xor i8 %516, %518, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %519 = trunc i8 %xor1.i.iter43 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %520 = and i8 %xor1.i.iter43, 2, !dbg !179
  %mul9.i.iter43 = mul i8 %520, %517, !dbg !180
  %conv10.i.iter43 = select i1 %519, i8 %517, i8 0, !dbg !177
  %xor11.i.iter43 = xor i8 %conv10.i.iter43, %mul9.i.iter43, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %521 = and i8 %xor1.i.iter43, 4, !dbg !182
  %mul16.i.iter43 = mul i8 %521, %517, !dbg !183
  %xor18.i.iter43 = xor i8 %mul16.i.iter43, %xor11.i.iter43, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %522 = and i8 %xor1.i.iter43, 8, !dbg !185
  %mul23.i.iter43 = mul i8 %522, %517, !dbg !186
  %xor25.i.iter43 = xor i8 %mul23.i.iter43, %xor18.i.iter43, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %523 = lshr i8 %xor25.i.iter43, 4, !dbg !189
  %524 = lshr i8 %xor25.i.iter43, 3, !dbg !190
  %525 = and i8 %524, 14, !dbg !190
  %526 = xor i8 %523, %525, !dbg !191
  %xor25.masked.i.iter43 = and i8 %xor25.i.iter43, 15, !dbg !192
  %527 = xor i8 %526, %xor25.masked.i.iter43, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter43 = xor i8 %527, %ret.0.i1.iter43, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter43 = add nuw nsw i32 %i.0.i3.iter43, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter43 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter43, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter43 = icmp eq i32 %inc.i.iter43, 8, !dbg !202
  br i1 %exitcond.i.not.iter43, label %lincomb.exit.iter43, label %for.body.i.iter43, !dbg !203, !llvm.loop !204

lincomb.exit.iter43:                              ; preds = %for.body.i.iter43
  %ret.0.i.lcssa.iter43 = phi i8 [ %xor1.i.i.iter43, %for.body.i.iter43 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter43, ptr %c.addr.1.lcssa.iter42, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter43 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter42, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter43, !dbg !150

for.cond.i.preheader.iter43:                      ; preds = %for.cond1.preheader.iter43
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter43, !dbg !203

iter_43_end:                                      ; preds = %for.inc4.iter43
  br label %iter_44_start

iter_44_start:                                    ; preds = %iter_43_end
  br label %for.cond1.preheader.iter44

for.cond1.preheader.iter44:                       ; preds = %iter_44_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter44, !dbg !150

for.inc4.iter44:                                  ; preds = %lincomb.exit.iter44
  %c.addr.1.lcssa.iter44 = phi ptr [ %incdec.ptr.iter44, %lincomb.exit.iter44 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter44 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter43, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_44_end

for.body.i.iter44:                                ; preds = %for.cond.i.preheader.iter44, %for.body.i.iter44
  %i.0.i3.iter44 = phi i32 [ 0, %for.cond.i.preheader.iter44 ], [ %inc.i.iter44, %for.body.i.iter44 ]
  %b.addr.0.i2.iter44 = phi ptr [ %b, %for.cond.i.preheader.iter44 ], [ %add.ptr.i.iter44, %for.body.i.iter44 ]
  %ret.0.i1.iter44 = phi i8 [ 0, %for.cond.i.preheader.iter44 ], [ %xor1.i.i.iter44, %for.body.i.iter44 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter44 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter43, i32 %i.0.i3.iter44, !dbg !164
  %528 = load i8, ptr %arrayidx.i.iter44, align 1, !dbg !164
  %529 = load i8, ptr %b.addr.0.i2.iter44, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %530 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter44 = xor i8 %528, %530, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %531 = trunc i8 %xor1.i.iter44 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %532 = and i8 %xor1.i.iter44, 2, !dbg !179
  %mul9.i.iter44 = mul i8 %532, %529, !dbg !180
  %conv10.i.iter44 = select i1 %531, i8 %529, i8 0, !dbg !177
  %xor11.i.iter44 = xor i8 %conv10.i.iter44, %mul9.i.iter44, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %533 = and i8 %xor1.i.iter44, 4, !dbg !182
  %mul16.i.iter44 = mul i8 %533, %529, !dbg !183
  %xor18.i.iter44 = xor i8 %mul16.i.iter44, %xor11.i.iter44, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %534 = and i8 %xor1.i.iter44, 8, !dbg !185
  %mul23.i.iter44 = mul i8 %534, %529, !dbg !186
  %xor25.i.iter44 = xor i8 %mul23.i.iter44, %xor18.i.iter44, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %535 = lshr i8 %xor25.i.iter44, 4, !dbg !189
  %536 = lshr i8 %xor25.i.iter44, 3, !dbg !190
  %537 = and i8 %536, 14, !dbg !190
  %538 = xor i8 %535, %537, !dbg !191
  %xor25.masked.i.iter44 = and i8 %xor25.i.iter44, 15, !dbg !192
  %539 = xor i8 %538, %xor25.masked.i.iter44, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter44 = xor i8 %539, %ret.0.i1.iter44, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter44 = add nuw nsw i32 %i.0.i3.iter44, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter44 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter44, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter44 = icmp eq i32 %inc.i.iter44, 8, !dbg !202
  br i1 %exitcond.i.not.iter44, label %lincomb.exit.iter44, label %for.body.i.iter44, !dbg !203, !llvm.loop !204

lincomb.exit.iter44:                              ; preds = %for.body.i.iter44
  %ret.0.i.lcssa.iter44 = phi i8 [ %xor1.i.i.iter44, %for.body.i.iter44 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter44, ptr %c.addr.1.lcssa.iter43, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter44 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter43, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter44, !dbg !150

for.cond.i.preheader.iter44:                      ; preds = %for.cond1.preheader.iter44
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter44, !dbg !203

iter_44_end:                                      ; preds = %for.inc4.iter44
  br label %iter_45_start

iter_45_start:                                    ; preds = %iter_44_end
  br label %for.cond1.preheader.iter45

for.cond1.preheader.iter45:                       ; preds = %iter_45_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter45, !dbg !150

for.inc4.iter45:                                  ; preds = %lincomb.exit.iter45
  %c.addr.1.lcssa.iter45 = phi ptr [ %incdec.ptr.iter45, %lincomb.exit.iter45 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter45 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter44, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_45_end

for.body.i.iter45:                                ; preds = %for.cond.i.preheader.iter45, %for.body.i.iter45
  %i.0.i3.iter45 = phi i32 [ 0, %for.cond.i.preheader.iter45 ], [ %inc.i.iter45, %for.body.i.iter45 ]
  %b.addr.0.i2.iter45 = phi ptr [ %b, %for.cond.i.preheader.iter45 ], [ %add.ptr.i.iter45, %for.body.i.iter45 ]
  %ret.0.i1.iter45 = phi i8 [ 0, %for.cond.i.preheader.iter45 ], [ %xor1.i.i.iter45, %for.body.i.iter45 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter45 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter44, i32 %i.0.i3.iter45, !dbg !164
  %540 = load i8, ptr %arrayidx.i.iter45, align 1, !dbg !164
  %541 = load i8, ptr %b.addr.0.i2.iter45, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %542 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter45 = xor i8 %540, %542, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %543 = trunc i8 %xor1.i.iter45 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %544 = and i8 %xor1.i.iter45, 2, !dbg !179
  %mul9.i.iter45 = mul i8 %544, %541, !dbg !180
  %conv10.i.iter45 = select i1 %543, i8 %541, i8 0, !dbg !177
  %xor11.i.iter45 = xor i8 %conv10.i.iter45, %mul9.i.iter45, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %545 = and i8 %xor1.i.iter45, 4, !dbg !182
  %mul16.i.iter45 = mul i8 %545, %541, !dbg !183
  %xor18.i.iter45 = xor i8 %mul16.i.iter45, %xor11.i.iter45, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %546 = and i8 %xor1.i.iter45, 8, !dbg !185
  %mul23.i.iter45 = mul i8 %546, %541, !dbg !186
  %xor25.i.iter45 = xor i8 %mul23.i.iter45, %xor18.i.iter45, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %547 = lshr i8 %xor25.i.iter45, 4, !dbg !189
  %548 = lshr i8 %xor25.i.iter45, 3, !dbg !190
  %549 = and i8 %548, 14, !dbg !190
  %550 = xor i8 %547, %549, !dbg !191
  %xor25.masked.i.iter45 = and i8 %xor25.i.iter45, 15, !dbg !192
  %551 = xor i8 %550, %xor25.masked.i.iter45, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter45 = xor i8 %551, %ret.0.i1.iter45, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter45 = add nuw nsw i32 %i.0.i3.iter45, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter45 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter45, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter45 = icmp eq i32 %inc.i.iter45, 8, !dbg !202
  br i1 %exitcond.i.not.iter45, label %lincomb.exit.iter45, label %for.body.i.iter45, !dbg !203, !llvm.loop !204

lincomb.exit.iter45:                              ; preds = %for.body.i.iter45
  %ret.0.i.lcssa.iter45 = phi i8 [ %xor1.i.i.iter45, %for.body.i.iter45 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter45, ptr %c.addr.1.lcssa.iter44, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter45 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter44, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter45, !dbg !150

for.cond.i.preheader.iter45:                      ; preds = %for.cond1.preheader.iter45
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter45, !dbg !203

iter_45_end:                                      ; preds = %for.inc4.iter45
  br label %iter_46_start

iter_46_start:                                    ; preds = %iter_45_end
  br label %for.cond1.preheader.iter46

for.cond1.preheader.iter46:                       ; preds = %iter_46_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter46, !dbg !150

for.inc4.iter46:                                  ; preds = %lincomb.exit.iter46
  %c.addr.1.lcssa.iter46 = phi ptr [ %incdec.ptr.iter46, %lincomb.exit.iter46 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter46 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter45, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_46_end

for.body.i.iter46:                                ; preds = %for.cond.i.preheader.iter46, %for.body.i.iter46
  %i.0.i3.iter46 = phi i32 [ 0, %for.cond.i.preheader.iter46 ], [ %inc.i.iter46, %for.body.i.iter46 ]
  %b.addr.0.i2.iter46 = phi ptr [ %b, %for.cond.i.preheader.iter46 ], [ %add.ptr.i.iter46, %for.body.i.iter46 ]
  %ret.0.i1.iter46 = phi i8 [ 0, %for.cond.i.preheader.iter46 ], [ %xor1.i.i.iter46, %for.body.i.iter46 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter46 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter45, i32 %i.0.i3.iter46, !dbg !164
  %552 = load i8, ptr %arrayidx.i.iter46, align 1, !dbg !164
  %553 = load i8, ptr %b.addr.0.i2.iter46, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %554 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter46 = xor i8 %552, %554, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %555 = trunc i8 %xor1.i.iter46 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %556 = and i8 %xor1.i.iter46, 2, !dbg !179
  %mul9.i.iter46 = mul i8 %556, %553, !dbg !180
  %conv10.i.iter46 = select i1 %555, i8 %553, i8 0, !dbg !177
  %xor11.i.iter46 = xor i8 %conv10.i.iter46, %mul9.i.iter46, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %557 = and i8 %xor1.i.iter46, 4, !dbg !182
  %mul16.i.iter46 = mul i8 %557, %553, !dbg !183
  %xor18.i.iter46 = xor i8 %mul16.i.iter46, %xor11.i.iter46, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %558 = and i8 %xor1.i.iter46, 8, !dbg !185
  %mul23.i.iter46 = mul i8 %558, %553, !dbg !186
  %xor25.i.iter46 = xor i8 %mul23.i.iter46, %xor18.i.iter46, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %559 = lshr i8 %xor25.i.iter46, 4, !dbg !189
  %560 = lshr i8 %xor25.i.iter46, 3, !dbg !190
  %561 = and i8 %560, 14, !dbg !190
  %562 = xor i8 %559, %561, !dbg !191
  %xor25.masked.i.iter46 = and i8 %xor25.i.iter46, 15, !dbg !192
  %563 = xor i8 %562, %xor25.masked.i.iter46, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter46 = xor i8 %563, %ret.0.i1.iter46, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter46 = add nuw nsw i32 %i.0.i3.iter46, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter46 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter46, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter46 = icmp eq i32 %inc.i.iter46, 8, !dbg !202
  br i1 %exitcond.i.not.iter46, label %lincomb.exit.iter46, label %for.body.i.iter46, !dbg !203, !llvm.loop !204

lincomb.exit.iter46:                              ; preds = %for.body.i.iter46
  %ret.0.i.lcssa.iter46 = phi i8 [ %xor1.i.i.iter46, %for.body.i.iter46 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter46, ptr %c.addr.1.lcssa.iter45, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter46 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter45, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter46, !dbg !150

for.cond.i.preheader.iter46:                      ; preds = %for.cond1.preheader.iter46
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter46, !dbg !203

iter_46_end:                                      ; preds = %for.inc4.iter46
  br label %iter_47_start

iter_47_start:                                    ; preds = %iter_46_end
  br label %for.cond1.preheader.iter47

for.cond1.preheader.iter47:                       ; preds = %iter_47_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter47, !dbg !150

for.inc4.iter47:                                  ; preds = %lincomb.exit.iter47
  %c.addr.1.lcssa.iter47 = phi ptr [ %incdec.ptr.iter47, %lincomb.exit.iter47 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter47 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter46, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_47_end

for.body.i.iter47:                                ; preds = %for.cond.i.preheader.iter47, %for.body.i.iter47
  %i.0.i3.iter47 = phi i32 [ 0, %for.cond.i.preheader.iter47 ], [ %inc.i.iter47, %for.body.i.iter47 ]
  %b.addr.0.i2.iter47 = phi ptr [ %b, %for.cond.i.preheader.iter47 ], [ %add.ptr.i.iter47, %for.body.i.iter47 ]
  %ret.0.i1.iter47 = phi i8 [ 0, %for.cond.i.preheader.iter47 ], [ %xor1.i.i.iter47, %for.body.i.iter47 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter47 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter46, i32 %i.0.i3.iter47, !dbg !164
  %564 = load i8, ptr %arrayidx.i.iter47, align 1, !dbg !164
  %565 = load i8, ptr %b.addr.0.i2.iter47, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %566 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter47 = xor i8 %564, %566, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %567 = trunc i8 %xor1.i.iter47 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %568 = and i8 %xor1.i.iter47, 2, !dbg !179
  %mul9.i.iter47 = mul i8 %568, %565, !dbg !180
  %conv10.i.iter47 = select i1 %567, i8 %565, i8 0, !dbg !177
  %xor11.i.iter47 = xor i8 %conv10.i.iter47, %mul9.i.iter47, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %569 = and i8 %xor1.i.iter47, 4, !dbg !182
  %mul16.i.iter47 = mul i8 %569, %565, !dbg !183
  %xor18.i.iter47 = xor i8 %mul16.i.iter47, %xor11.i.iter47, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %570 = and i8 %xor1.i.iter47, 8, !dbg !185
  %mul23.i.iter47 = mul i8 %570, %565, !dbg !186
  %xor25.i.iter47 = xor i8 %mul23.i.iter47, %xor18.i.iter47, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %571 = lshr i8 %xor25.i.iter47, 4, !dbg !189
  %572 = lshr i8 %xor25.i.iter47, 3, !dbg !190
  %573 = and i8 %572, 14, !dbg !190
  %574 = xor i8 %571, %573, !dbg !191
  %xor25.masked.i.iter47 = and i8 %xor25.i.iter47, 15, !dbg !192
  %575 = xor i8 %574, %xor25.masked.i.iter47, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter47 = xor i8 %575, %ret.0.i1.iter47, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter47 = add nuw nsw i32 %i.0.i3.iter47, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter47 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter47, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter47 = icmp eq i32 %inc.i.iter47, 8, !dbg !202
  br i1 %exitcond.i.not.iter47, label %lincomb.exit.iter47, label %for.body.i.iter47, !dbg !203, !llvm.loop !204

lincomb.exit.iter47:                              ; preds = %for.body.i.iter47
  %ret.0.i.lcssa.iter47 = phi i8 [ %xor1.i.i.iter47, %for.body.i.iter47 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter47, ptr %c.addr.1.lcssa.iter46, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter47 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter46, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter47, !dbg !150

for.cond.i.preheader.iter47:                      ; preds = %for.cond1.preheader.iter47
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter47, !dbg !203

iter_47_end:                                      ; preds = %for.inc4.iter47
  br label %iter_48_start

iter_48_start:                                    ; preds = %iter_47_end
  br label %for.cond1.preheader.iter48

for.cond1.preheader.iter48:                       ; preds = %iter_48_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter48, !dbg !150

for.inc4.iter48:                                  ; preds = %lincomb.exit.iter48
  %c.addr.1.lcssa.iter48 = phi ptr [ %incdec.ptr.iter48, %lincomb.exit.iter48 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter48 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter47, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_48_end

for.body.i.iter48:                                ; preds = %for.cond.i.preheader.iter48, %for.body.i.iter48
  %i.0.i3.iter48 = phi i32 [ 0, %for.cond.i.preheader.iter48 ], [ %inc.i.iter48, %for.body.i.iter48 ]
  %b.addr.0.i2.iter48 = phi ptr [ %b, %for.cond.i.preheader.iter48 ], [ %add.ptr.i.iter48, %for.body.i.iter48 ]
  %ret.0.i1.iter48 = phi i8 [ 0, %for.cond.i.preheader.iter48 ], [ %xor1.i.i.iter48, %for.body.i.iter48 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter48 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter47, i32 %i.0.i3.iter48, !dbg !164
  %576 = load i8, ptr %arrayidx.i.iter48, align 1, !dbg !164
  %577 = load i8, ptr %b.addr.0.i2.iter48, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %578 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter48 = xor i8 %576, %578, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %579 = trunc i8 %xor1.i.iter48 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %580 = and i8 %xor1.i.iter48, 2, !dbg !179
  %mul9.i.iter48 = mul i8 %580, %577, !dbg !180
  %conv10.i.iter48 = select i1 %579, i8 %577, i8 0, !dbg !177
  %xor11.i.iter48 = xor i8 %conv10.i.iter48, %mul9.i.iter48, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %581 = and i8 %xor1.i.iter48, 4, !dbg !182
  %mul16.i.iter48 = mul i8 %581, %577, !dbg !183
  %xor18.i.iter48 = xor i8 %mul16.i.iter48, %xor11.i.iter48, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %582 = and i8 %xor1.i.iter48, 8, !dbg !185
  %mul23.i.iter48 = mul i8 %582, %577, !dbg !186
  %xor25.i.iter48 = xor i8 %mul23.i.iter48, %xor18.i.iter48, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %583 = lshr i8 %xor25.i.iter48, 4, !dbg !189
  %584 = lshr i8 %xor25.i.iter48, 3, !dbg !190
  %585 = and i8 %584, 14, !dbg !190
  %586 = xor i8 %583, %585, !dbg !191
  %xor25.masked.i.iter48 = and i8 %xor25.i.iter48, 15, !dbg !192
  %587 = xor i8 %586, %xor25.masked.i.iter48, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter48 = xor i8 %587, %ret.0.i1.iter48, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter48 = add nuw nsw i32 %i.0.i3.iter48, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter48 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter48, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter48 = icmp eq i32 %inc.i.iter48, 8, !dbg !202
  br i1 %exitcond.i.not.iter48, label %lincomb.exit.iter48, label %for.body.i.iter48, !dbg !203, !llvm.loop !204

lincomb.exit.iter48:                              ; preds = %for.body.i.iter48
  %ret.0.i.lcssa.iter48 = phi i8 [ %xor1.i.i.iter48, %for.body.i.iter48 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter48, ptr %c.addr.1.lcssa.iter47, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter48 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter47, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter48, !dbg !150

for.cond.i.preheader.iter48:                      ; preds = %for.cond1.preheader.iter48
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter48, !dbg !203

iter_48_end:                                      ; preds = %for.inc4.iter48
  br label %iter_49_start

iter_49_start:                                    ; preds = %iter_48_end
  br label %for.cond1.preheader.iter49

for.cond1.preheader.iter49:                       ; preds = %iter_49_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter49, !dbg !150

for.inc4.iter49:                                  ; preds = %lincomb.exit.iter49
  %c.addr.1.lcssa.iter49 = phi ptr [ %incdec.ptr.iter49, %lincomb.exit.iter49 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter49 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter48, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_49_end

for.body.i.iter49:                                ; preds = %for.cond.i.preheader.iter49, %for.body.i.iter49
  %i.0.i3.iter49 = phi i32 [ 0, %for.cond.i.preheader.iter49 ], [ %inc.i.iter49, %for.body.i.iter49 ]
  %b.addr.0.i2.iter49 = phi ptr [ %b, %for.cond.i.preheader.iter49 ], [ %add.ptr.i.iter49, %for.body.i.iter49 ]
  %ret.0.i1.iter49 = phi i8 [ 0, %for.cond.i.preheader.iter49 ], [ %xor1.i.i.iter49, %for.body.i.iter49 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter49 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter48, i32 %i.0.i3.iter49, !dbg !164
  %588 = load i8, ptr %arrayidx.i.iter49, align 1, !dbg !164
  %589 = load i8, ptr %b.addr.0.i2.iter49, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %590 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter49 = xor i8 %588, %590, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %591 = trunc i8 %xor1.i.iter49 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %592 = and i8 %xor1.i.iter49, 2, !dbg !179
  %mul9.i.iter49 = mul i8 %592, %589, !dbg !180
  %conv10.i.iter49 = select i1 %591, i8 %589, i8 0, !dbg !177
  %xor11.i.iter49 = xor i8 %conv10.i.iter49, %mul9.i.iter49, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %593 = and i8 %xor1.i.iter49, 4, !dbg !182
  %mul16.i.iter49 = mul i8 %593, %589, !dbg !183
  %xor18.i.iter49 = xor i8 %mul16.i.iter49, %xor11.i.iter49, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %594 = and i8 %xor1.i.iter49, 8, !dbg !185
  %mul23.i.iter49 = mul i8 %594, %589, !dbg !186
  %xor25.i.iter49 = xor i8 %mul23.i.iter49, %xor18.i.iter49, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %595 = lshr i8 %xor25.i.iter49, 4, !dbg !189
  %596 = lshr i8 %xor25.i.iter49, 3, !dbg !190
  %597 = and i8 %596, 14, !dbg !190
  %598 = xor i8 %595, %597, !dbg !191
  %xor25.masked.i.iter49 = and i8 %xor25.i.iter49, 15, !dbg !192
  %599 = xor i8 %598, %xor25.masked.i.iter49, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter49 = xor i8 %599, %ret.0.i1.iter49, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter49 = add nuw nsw i32 %i.0.i3.iter49, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter49 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter49, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter49 = icmp eq i32 %inc.i.iter49, 8, !dbg !202
  br i1 %exitcond.i.not.iter49, label %lincomb.exit.iter49, label %for.body.i.iter49, !dbg !203, !llvm.loop !204

lincomb.exit.iter49:                              ; preds = %for.body.i.iter49
  %ret.0.i.lcssa.iter49 = phi i8 [ %xor1.i.i.iter49, %for.body.i.iter49 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter49, ptr %c.addr.1.lcssa.iter48, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter49 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter48, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter49, !dbg !150

for.cond.i.preheader.iter49:                      ; preds = %for.cond1.preheader.iter49
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter49, !dbg !203

iter_49_end:                                      ; preds = %for.inc4.iter49
  br label %iter_50_start

iter_50_start:                                    ; preds = %iter_49_end
  br label %for.cond1.preheader.iter50

for.cond1.preheader.iter50:                       ; preds = %iter_50_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter50, !dbg !150

for.inc4.iter50:                                  ; preds = %lincomb.exit.iter50
  %c.addr.1.lcssa.iter50 = phi ptr [ %incdec.ptr.iter50, %lincomb.exit.iter50 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter50 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter49, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_50_end

for.body.i.iter50:                                ; preds = %for.cond.i.preheader.iter50, %for.body.i.iter50
  %i.0.i3.iter50 = phi i32 [ 0, %for.cond.i.preheader.iter50 ], [ %inc.i.iter50, %for.body.i.iter50 ]
  %b.addr.0.i2.iter50 = phi ptr [ %b, %for.cond.i.preheader.iter50 ], [ %add.ptr.i.iter50, %for.body.i.iter50 ]
  %ret.0.i1.iter50 = phi i8 [ 0, %for.cond.i.preheader.iter50 ], [ %xor1.i.i.iter50, %for.body.i.iter50 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter50 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter49, i32 %i.0.i3.iter50, !dbg !164
  %600 = load i8, ptr %arrayidx.i.iter50, align 1, !dbg !164
  %601 = load i8, ptr %b.addr.0.i2.iter50, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %602 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter50 = xor i8 %600, %602, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %603 = trunc i8 %xor1.i.iter50 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %604 = and i8 %xor1.i.iter50, 2, !dbg !179
  %mul9.i.iter50 = mul i8 %604, %601, !dbg !180
  %conv10.i.iter50 = select i1 %603, i8 %601, i8 0, !dbg !177
  %xor11.i.iter50 = xor i8 %conv10.i.iter50, %mul9.i.iter50, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %605 = and i8 %xor1.i.iter50, 4, !dbg !182
  %mul16.i.iter50 = mul i8 %605, %601, !dbg !183
  %xor18.i.iter50 = xor i8 %mul16.i.iter50, %xor11.i.iter50, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %606 = and i8 %xor1.i.iter50, 8, !dbg !185
  %mul23.i.iter50 = mul i8 %606, %601, !dbg !186
  %xor25.i.iter50 = xor i8 %mul23.i.iter50, %xor18.i.iter50, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %607 = lshr i8 %xor25.i.iter50, 4, !dbg !189
  %608 = lshr i8 %xor25.i.iter50, 3, !dbg !190
  %609 = and i8 %608, 14, !dbg !190
  %610 = xor i8 %607, %609, !dbg !191
  %xor25.masked.i.iter50 = and i8 %xor25.i.iter50, 15, !dbg !192
  %611 = xor i8 %610, %xor25.masked.i.iter50, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter50 = xor i8 %611, %ret.0.i1.iter50, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter50 = add nuw nsw i32 %i.0.i3.iter50, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter50 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter50, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter50 = icmp eq i32 %inc.i.iter50, 8, !dbg !202
  br i1 %exitcond.i.not.iter50, label %lincomb.exit.iter50, label %for.body.i.iter50, !dbg !203, !llvm.loop !204

lincomb.exit.iter50:                              ; preds = %for.body.i.iter50
  %ret.0.i.lcssa.iter50 = phi i8 [ %xor1.i.i.iter50, %for.body.i.iter50 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter50, ptr %c.addr.1.lcssa.iter49, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter50 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter49, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter50, !dbg !150

for.cond.i.preheader.iter50:                      ; preds = %for.cond1.preheader.iter50
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter50, !dbg !203

iter_50_end:                                      ; preds = %for.inc4.iter50
  br label %iter_51_start

iter_51_start:                                    ; preds = %iter_50_end
  br label %for.cond1.preheader.iter51

for.cond1.preheader.iter51:                       ; preds = %iter_51_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter51, !dbg !150

for.inc4.iter51:                                  ; preds = %lincomb.exit.iter51
  %c.addr.1.lcssa.iter51 = phi ptr [ %incdec.ptr.iter51, %lincomb.exit.iter51 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter51 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter50, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_51_end

for.body.i.iter51:                                ; preds = %for.cond.i.preheader.iter51, %for.body.i.iter51
  %i.0.i3.iter51 = phi i32 [ 0, %for.cond.i.preheader.iter51 ], [ %inc.i.iter51, %for.body.i.iter51 ]
  %b.addr.0.i2.iter51 = phi ptr [ %b, %for.cond.i.preheader.iter51 ], [ %add.ptr.i.iter51, %for.body.i.iter51 ]
  %ret.0.i1.iter51 = phi i8 [ 0, %for.cond.i.preheader.iter51 ], [ %xor1.i.i.iter51, %for.body.i.iter51 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter51 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter50, i32 %i.0.i3.iter51, !dbg !164
  %612 = load i8, ptr %arrayidx.i.iter51, align 1, !dbg !164
  %613 = load i8, ptr %b.addr.0.i2.iter51, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %614 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter51 = xor i8 %612, %614, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %615 = trunc i8 %xor1.i.iter51 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %616 = and i8 %xor1.i.iter51, 2, !dbg !179
  %mul9.i.iter51 = mul i8 %616, %613, !dbg !180
  %conv10.i.iter51 = select i1 %615, i8 %613, i8 0, !dbg !177
  %xor11.i.iter51 = xor i8 %conv10.i.iter51, %mul9.i.iter51, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %617 = and i8 %xor1.i.iter51, 4, !dbg !182
  %mul16.i.iter51 = mul i8 %617, %613, !dbg !183
  %xor18.i.iter51 = xor i8 %mul16.i.iter51, %xor11.i.iter51, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %618 = and i8 %xor1.i.iter51, 8, !dbg !185
  %mul23.i.iter51 = mul i8 %618, %613, !dbg !186
  %xor25.i.iter51 = xor i8 %mul23.i.iter51, %xor18.i.iter51, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %619 = lshr i8 %xor25.i.iter51, 4, !dbg !189
  %620 = lshr i8 %xor25.i.iter51, 3, !dbg !190
  %621 = and i8 %620, 14, !dbg !190
  %622 = xor i8 %619, %621, !dbg !191
  %xor25.masked.i.iter51 = and i8 %xor25.i.iter51, 15, !dbg !192
  %623 = xor i8 %622, %xor25.masked.i.iter51, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter51 = xor i8 %623, %ret.0.i1.iter51, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter51 = add nuw nsw i32 %i.0.i3.iter51, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter51 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter51, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter51 = icmp eq i32 %inc.i.iter51, 8, !dbg !202
  br i1 %exitcond.i.not.iter51, label %lincomb.exit.iter51, label %for.body.i.iter51, !dbg !203, !llvm.loop !204

lincomb.exit.iter51:                              ; preds = %for.body.i.iter51
  %ret.0.i.lcssa.iter51 = phi i8 [ %xor1.i.i.iter51, %for.body.i.iter51 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter51, ptr %c.addr.1.lcssa.iter50, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter51 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter50, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter51, !dbg !150

for.cond.i.preheader.iter51:                      ; preds = %for.cond1.preheader.iter51
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter51, !dbg !203

iter_51_end:                                      ; preds = %for.inc4.iter51
  br label %iter_52_start

iter_52_start:                                    ; preds = %iter_51_end
  br label %for.cond1.preheader.iter52

for.cond1.preheader.iter52:                       ; preds = %iter_52_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter52, !dbg !150

for.inc4.iter52:                                  ; preds = %lincomb.exit.iter52
  %c.addr.1.lcssa.iter52 = phi ptr [ %incdec.ptr.iter52, %lincomb.exit.iter52 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter52 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter51, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_52_end

for.body.i.iter52:                                ; preds = %for.cond.i.preheader.iter52, %for.body.i.iter52
  %i.0.i3.iter52 = phi i32 [ 0, %for.cond.i.preheader.iter52 ], [ %inc.i.iter52, %for.body.i.iter52 ]
  %b.addr.0.i2.iter52 = phi ptr [ %b, %for.cond.i.preheader.iter52 ], [ %add.ptr.i.iter52, %for.body.i.iter52 ]
  %ret.0.i1.iter52 = phi i8 [ 0, %for.cond.i.preheader.iter52 ], [ %xor1.i.i.iter52, %for.body.i.iter52 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter52 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter51, i32 %i.0.i3.iter52, !dbg !164
  %624 = load i8, ptr %arrayidx.i.iter52, align 1, !dbg !164
  %625 = load i8, ptr %b.addr.0.i2.iter52, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %626 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter52 = xor i8 %624, %626, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %627 = trunc i8 %xor1.i.iter52 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %628 = and i8 %xor1.i.iter52, 2, !dbg !179
  %mul9.i.iter52 = mul i8 %628, %625, !dbg !180
  %conv10.i.iter52 = select i1 %627, i8 %625, i8 0, !dbg !177
  %xor11.i.iter52 = xor i8 %conv10.i.iter52, %mul9.i.iter52, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %629 = and i8 %xor1.i.iter52, 4, !dbg !182
  %mul16.i.iter52 = mul i8 %629, %625, !dbg !183
  %xor18.i.iter52 = xor i8 %mul16.i.iter52, %xor11.i.iter52, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %630 = and i8 %xor1.i.iter52, 8, !dbg !185
  %mul23.i.iter52 = mul i8 %630, %625, !dbg !186
  %xor25.i.iter52 = xor i8 %mul23.i.iter52, %xor18.i.iter52, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %631 = lshr i8 %xor25.i.iter52, 4, !dbg !189
  %632 = lshr i8 %xor25.i.iter52, 3, !dbg !190
  %633 = and i8 %632, 14, !dbg !190
  %634 = xor i8 %631, %633, !dbg !191
  %xor25.masked.i.iter52 = and i8 %xor25.i.iter52, 15, !dbg !192
  %635 = xor i8 %634, %xor25.masked.i.iter52, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter52 = xor i8 %635, %ret.0.i1.iter52, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter52 = add nuw nsw i32 %i.0.i3.iter52, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter52 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter52, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter52 = icmp eq i32 %inc.i.iter52, 8, !dbg !202
  br i1 %exitcond.i.not.iter52, label %lincomb.exit.iter52, label %for.body.i.iter52, !dbg !203, !llvm.loop !204

lincomb.exit.iter52:                              ; preds = %for.body.i.iter52
  %ret.0.i.lcssa.iter52 = phi i8 [ %xor1.i.i.iter52, %for.body.i.iter52 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter52, ptr %c.addr.1.lcssa.iter51, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter52 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter51, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter52, !dbg !150

for.cond.i.preheader.iter52:                      ; preds = %for.cond1.preheader.iter52
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter52, !dbg !203

iter_52_end:                                      ; preds = %for.inc4.iter52
  br label %iter_53_start

iter_53_start:                                    ; preds = %iter_52_end
  br label %for.cond1.preheader.iter53

for.cond1.preheader.iter53:                       ; preds = %iter_53_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter53, !dbg !150

for.inc4.iter53:                                  ; preds = %lincomb.exit.iter53
  %c.addr.1.lcssa.iter53 = phi ptr [ %incdec.ptr.iter53, %lincomb.exit.iter53 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter53 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter52, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_53_end

for.body.i.iter53:                                ; preds = %for.cond.i.preheader.iter53, %for.body.i.iter53
  %i.0.i3.iter53 = phi i32 [ 0, %for.cond.i.preheader.iter53 ], [ %inc.i.iter53, %for.body.i.iter53 ]
  %b.addr.0.i2.iter53 = phi ptr [ %b, %for.cond.i.preheader.iter53 ], [ %add.ptr.i.iter53, %for.body.i.iter53 ]
  %ret.0.i1.iter53 = phi i8 [ 0, %for.cond.i.preheader.iter53 ], [ %xor1.i.i.iter53, %for.body.i.iter53 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter53 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter52, i32 %i.0.i3.iter53, !dbg !164
  %636 = load i8, ptr %arrayidx.i.iter53, align 1, !dbg !164
  %637 = load i8, ptr %b.addr.0.i2.iter53, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %638 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter53 = xor i8 %636, %638, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %639 = trunc i8 %xor1.i.iter53 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %640 = and i8 %xor1.i.iter53, 2, !dbg !179
  %mul9.i.iter53 = mul i8 %640, %637, !dbg !180
  %conv10.i.iter53 = select i1 %639, i8 %637, i8 0, !dbg !177
  %xor11.i.iter53 = xor i8 %conv10.i.iter53, %mul9.i.iter53, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %641 = and i8 %xor1.i.iter53, 4, !dbg !182
  %mul16.i.iter53 = mul i8 %641, %637, !dbg !183
  %xor18.i.iter53 = xor i8 %mul16.i.iter53, %xor11.i.iter53, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %642 = and i8 %xor1.i.iter53, 8, !dbg !185
  %mul23.i.iter53 = mul i8 %642, %637, !dbg !186
  %xor25.i.iter53 = xor i8 %mul23.i.iter53, %xor18.i.iter53, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %643 = lshr i8 %xor25.i.iter53, 4, !dbg !189
  %644 = lshr i8 %xor25.i.iter53, 3, !dbg !190
  %645 = and i8 %644, 14, !dbg !190
  %646 = xor i8 %643, %645, !dbg !191
  %xor25.masked.i.iter53 = and i8 %xor25.i.iter53, 15, !dbg !192
  %647 = xor i8 %646, %xor25.masked.i.iter53, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter53 = xor i8 %647, %ret.0.i1.iter53, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter53 = add nuw nsw i32 %i.0.i3.iter53, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter53 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter53, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter53 = icmp eq i32 %inc.i.iter53, 8, !dbg !202
  br i1 %exitcond.i.not.iter53, label %lincomb.exit.iter53, label %for.body.i.iter53, !dbg !203, !llvm.loop !204

lincomb.exit.iter53:                              ; preds = %for.body.i.iter53
  %ret.0.i.lcssa.iter53 = phi i8 [ %xor1.i.i.iter53, %for.body.i.iter53 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter53, ptr %c.addr.1.lcssa.iter52, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter53 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter52, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter53, !dbg !150

for.cond.i.preheader.iter53:                      ; preds = %for.cond1.preheader.iter53
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter53, !dbg !203

iter_53_end:                                      ; preds = %for.inc4.iter53
  br label %iter_54_start

iter_54_start:                                    ; preds = %iter_53_end
  br label %for.cond1.preheader.iter54

for.cond1.preheader.iter54:                       ; preds = %iter_54_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter54, !dbg !150

for.inc4.iter54:                                  ; preds = %lincomb.exit.iter54
  %c.addr.1.lcssa.iter54 = phi ptr [ %incdec.ptr.iter54, %lincomb.exit.iter54 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter54 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter53, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_54_end

for.body.i.iter54:                                ; preds = %for.cond.i.preheader.iter54, %for.body.i.iter54
  %i.0.i3.iter54 = phi i32 [ 0, %for.cond.i.preheader.iter54 ], [ %inc.i.iter54, %for.body.i.iter54 ]
  %b.addr.0.i2.iter54 = phi ptr [ %b, %for.cond.i.preheader.iter54 ], [ %add.ptr.i.iter54, %for.body.i.iter54 ]
  %ret.0.i1.iter54 = phi i8 [ 0, %for.cond.i.preheader.iter54 ], [ %xor1.i.i.iter54, %for.body.i.iter54 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter54 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter53, i32 %i.0.i3.iter54, !dbg !164
  %648 = load i8, ptr %arrayidx.i.iter54, align 1, !dbg !164
  %649 = load i8, ptr %b.addr.0.i2.iter54, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %650 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter54 = xor i8 %648, %650, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %651 = trunc i8 %xor1.i.iter54 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %652 = and i8 %xor1.i.iter54, 2, !dbg !179
  %mul9.i.iter54 = mul i8 %652, %649, !dbg !180
  %conv10.i.iter54 = select i1 %651, i8 %649, i8 0, !dbg !177
  %xor11.i.iter54 = xor i8 %conv10.i.iter54, %mul9.i.iter54, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %653 = and i8 %xor1.i.iter54, 4, !dbg !182
  %mul16.i.iter54 = mul i8 %653, %649, !dbg !183
  %xor18.i.iter54 = xor i8 %mul16.i.iter54, %xor11.i.iter54, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %654 = and i8 %xor1.i.iter54, 8, !dbg !185
  %mul23.i.iter54 = mul i8 %654, %649, !dbg !186
  %xor25.i.iter54 = xor i8 %mul23.i.iter54, %xor18.i.iter54, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %655 = lshr i8 %xor25.i.iter54, 4, !dbg !189
  %656 = lshr i8 %xor25.i.iter54, 3, !dbg !190
  %657 = and i8 %656, 14, !dbg !190
  %658 = xor i8 %655, %657, !dbg !191
  %xor25.masked.i.iter54 = and i8 %xor25.i.iter54, 15, !dbg !192
  %659 = xor i8 %658, %xor25.masked.i.iter54, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter54 = xor i8 %659, %ret.0.i1.iter54, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter54 = add nuw nsw i32 %i.0.i3.iter54, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter54 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter54, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter54 = icmp eq i32 %inc.i.iter54, 8, !dbg !202
  br i1 %exitcond.i.not.iter54, label %lincomb.exit.iter54, label %for.body.i.iter54, !dbg !203, !llvm.loop !204

lincomb.exit.iter54:                              ; preds = %for.body.i.iter54
  %ret.0.i.lcssa.iter54 = phi i8 [ %xor1.i.i.iter54, %for.body.i.iter54 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter54, ptr %c.addr.1.lcssa.iter53, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter54 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter53, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter54, !dbg !150

for.cond.i.preheader.iter54:                      ; preds = %for.cond1.preheader.iter54
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter54, !dbg !203

iter_54_end:                                      ; preds = %for.inc4.iter54
  br label %iter_55_start

iter_55_start:                                    ; preds = %iter_54_end
  br label %for.cond1.preheader.iter55

for.cond1.preheader.iter55:                       ; preds = %iter_55_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter55, !dbg !150

for.inc4.iter55:                                  ; preds = %lincomb.exit.iter55
  %c.addr.1.lcssa.iter55 = phi ptr [ %incdec.ptr.iter55, %lincomb.exit.iter55 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter55 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter54, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_55_end

for.body.i.iter55:                                ; preds = %for.cond.i.preheader.iter55, %for.body.i.iter55
  %i.0.i3.iter55 = phi i32 [ 0, %for.cond.i.preheader.iter55 ], [ %inc.i.iter55, %for.body.i.iter55 ]
  %b.addr.0.i2.iter55 = phi ptr [ %b, %for.cond.i.preheader.iter55 ], [ %add.ptr.i.iter55, %for.body.i.iter55 ]
  %ret.0.i1.iter55 = phi i8 [ 0, %for.cond.i.preheader.iter55 ], [ %xor1.i.i.iter55, %for.body.i.iter55 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter55 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter54, i32 %i.0.i3.iter55, !dbg !164
  %660 = load i8, ptr %arrayidx.i.iter55, align 1, !dbg !164
  %661 = load i8, ptr %b.addr.0.i2.iter55, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %662 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter55 = xor i8 %660, %662, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %663 = trunc i8 %xor1.i.iter55 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %664 = and i8 %xor1.i.iter55, 2, !dbg !179
  %mul9.i.iter55 = mul i8 %664, %661, !dbg !180
  %conv10.i.iter55 = select i1 %663, i8 %661, i8 0, !dbg !177
  %xor11.i.iter55 = xor i8 %conv10.i.iter55, %mul9.i.iter55, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %665 = and i8 %xor1.i.iter55, 4, !dbg !182
  %mul16.i.iter55 = mul i8 %665, %661, !dbg !183
  %xor18.i.iter55 = xor i8 %mul16.i.iter55, %xor11.i.iter55, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %666 = and i8 %xor1.i.iter55, 8, !dbg !185
  %mul23.i.iter55 = mul i8 %666, %661, !dbg !186
  %xor25.i.iter55 = xor i8 %mul23.i.iter55, %xor18.i.iter55, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %667 = lshr i8 %xor25.i.iter55, 4, !dbg !189
  %668 = lshr i8 %xor25.i.iter55, 3, !dbg !190
  %669 = and i8 %668, 14, !dbg !190
  %670 = xor i8 %667, %669, !dbg !191
  %xor25.masked.i.iter55 = and i8 %xor25.i.iter55, 15, !dbg !192
  %671 = xor i8 %670, %xor25.masked.i.iter55, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter55 = xor i8 %671, %ret.0.i1.iter55, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter55 = add nuw nsw i32 %i.0.i3.iter55, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter55 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter55, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter55 = icmp eq i32 %inc.i.iter55, 8, !dbg !202
  br i1 %exitcond.i.not.iter55, label %lincomb.exit.iter55, label %for.body.i.iter55, !dbg !203, !llvm.loop !204

lincomb.exit.iter55:                              ; preds = %for.body.i.iter55
  %ret.0.i.lcssa.iter55 = phi i8 [ %xor1.i.i.iter55, %for.body.i.iter55 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter55, ptr %c.addr.1.lcssa.iter54, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter55 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter54, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter55, !dbg !150

for.cond.i.preheader.iter55:                      ; preds = %for.cond1.preheader.iter55
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter55, !dbg !203

iter_55_end:                                      ; preds = %for.inc4.iter55
  br label %iter_56_start

iter_56_start:                                    ; preds = %iter_55_end
  br label %for.cond1.preheader.iter56

for.cond1.preheader.iter56:                       ; preds = %iter_56_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter56, !dbg !150

for.inc4.iter56:                                  ; preds = %lincomb.exit.iter56
  %c.addr.1.lcssa.iter56 = phi ptr [ %incdec.ptr.iter56, %lincomb.exit.iter56 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter56 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter55, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_56_end

for.body.i.iter56:                                ; preds = %for.cond.i.preheader.iter56, %for.body.i.iter56
  %i.0.i3.iter56 = phi i32 [ 0, %for.cond.i.preheader.iter56 ], [ %inc.i.iter56, %for.body.i.iter56 ]
  %b.addr.0.i2.iter56 = phi ptr [ %b, %for.cond.i.preheader.iter56 ], [ %add.ptr.i.iter56, %for.body.i.iter56 ]
  %ret.0.i1.iter56 = phi i8 [ 0, %for.cond.i.preheader.iter56 ], [ %xor1.i.i.iter56, %for.body.i.iter56 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter56 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter55, i32 %i.0.i3.iter56, !dbg !164
  %672 = load i8, ptr %arrayidx.i.iter56, align 1, !dbg !164
  %673 = load i8, ptr %b.addr.0.i2.iter56, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %674 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter56 = xor i8 %672, %674, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %675 = trunc i8 %xor1.i.iter56 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %676 = and i8 %xor1.i.iter56, 2, !dbg !179
  %mul9.i.iter56 = mul i8 %676, %673, !dbg !180
  %conv10.i.iter56 = select i1 %675, i8 %673, i8 0, !dbg !177
  %xor11.i.iter56 = xor i8 %conv10.i.iter56, %mul9.i.iter56, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %677 = and i8 %xor1.i.iter56, 4, !dbg !182
  %mul16.i.iter56 = mul i8 %677, %673, !dbg !183
  %xor18.i.iter56 = xor i8 %mul16.i.iter56, %xor11.i.iter56, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %678 = and i8 %xor1.i.iter56, 8, !dbg !185
  %mul23.i.iter56 = mul i8 %678, %673, !dbg !186
  %xor25.i.iter56 = xor i8 %mul23.i.iter56, %xor18.i.iter56, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %679 = lshr i8 %xor25.i.iter56, 4, !dbg !189
  %680 = lshr i8 %xor25.i.iter56, 3, !dbg !190
  %681 = and i8 %680, 14, !dbg !190
  %682 = xor i8 %679, %681, !dbg !191
  %xor25.masked.i.iter56 = and i8 %xor25.i.iter56, 15, !dbg !192
  %683 = xor i8 %682, %xor25.masked.i.iter56, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter56 = xor i8 %683, %ret.0.i1.iter56, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter56 = add nuw nsw i32 %i.0.i3.iter56, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter56 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter56, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter56 = icmp eq i32 %inc.i.iter56, 8, !dbg !202
  br i1 %exitcond.i.not.iter56, label %lincomb.exit.iter56, label %for.body.i.iter56, !dbg !203, !llvm.loop !204

lincomb.exit.iter56:                              ; preds = %for.body.i.iter56
  %ret.0.i.lcssa.iter56 = phi i8 [ %xor1.i.i.iter56, %for.body.i.iter56 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter56, ptr %c.addr.1.lcssa.iter55, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter56 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter55, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter56, !dbg !150

for.cond.i.preheader.iter56:                      ; preds = %for.cond1.preheader.iter56
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter56, !dbg !203

iter_56_end:                                      ; preds = %for.inc4.iter56
  br label %iter_57_start

iter_57_start:                                    ; preds = %iter_56_end
  br label %for.cond1.preheader.iter57

for.cond1.preheader.iter57:                       ; preds = %iter_57_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter57, !dbg !150

for.inc4.iter57:                                  ; preds = %lincomb.exit.iter57
  %c.addr.1.lcssa.iter57 = phi ptr [ %incdec.ptr.iter57, %lincomb.exit.iter57 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter57 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter56, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_57_end

for.body.i.iter57:                                ; preds = %for.cond.i.preheader.iter57, %for.body.i.iter57
  %i.0.i3.iter57 = phi i32 [ 0, %for.cond.i.preheader.iter57 ], [ %inc.i.iter57, %for.body.i.iter57 ]
  %b.addr.0.i2.iter57 = phi ptr [ %b, %for.cond.i.preheader.iter57 ], [ %add.ptr.i.iter57, %for.body.i.iter57 ]
  %ret.0.i1.iter57 = phi i8 [ 0, %for.cond.i.preheader.iter57 ], [ %xor1.i.i.iter57, %for.body.i.iter57 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter57 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter56, i32 %i.0.i3.iter57, !dbg !164
  %684 = load i8, ptr %arrayidx.i.iter57, align 1, !dbg !164
  %685 = load i8, ptr %b.addr.0.i2.iter57, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %686 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter57 = xor i8 %684, %686, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %687 = trunc i8 %xor1.i.iter57 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %688 = and i8 %xor1.i.iter57, 2, !dbg !179
  %mul9.i.iter57 = mul i8 %688, %685, !dbg !180
  %conv10.i.iter57 = select i1 %687, i8 %685, i8 0, !dbg !177
  %xor11.i.iter57 = xor i8 %conv10.i.iter57, %mul9.i.iter57, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %689 = and i8 %xor1.i.iter57, 4, !dbg !182
  %mul16.i.iter57 = mul i8 %689, %685, !dbg !183
  %xor18.i.iter57 = xor i8 %mul16.i.iter57, %xor11.i.iter57, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %690 = and i8 %xor1.i.iter57, 8, !dbg !185
  %mul23.i.iter57 = mul i8 %690, %685, !dbg !186
  %xor25.i.iter57 = xor i8 %mul23.i.iter57, %xor18.i.iter57, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %691 = lshr i8 %xor25.i.iter57, 4, !dbg !189
  %692 = lshr i8 %xor25.i.iter57, 3, !dbg !190
  %693 = and i8 %692, 14, !dbg !190
  %694 = xor i8 %691, %693, !dbg !191
  %xor25.masked.i.iter57 = and i8 %xor25.i.iter57, 15, !dbg !192
  %695 = xor i8 %694, %xor25.masked.i.iter57, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter57 = xor i8 %695, %ret.0.i1.iter57, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter57 = add nuw nsw i32 %i.0.i3.iter57, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter57 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter57, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter57 = icmp eq i32 %inc.i.iter57, 8, !dbg !202
  br i1 %exitcond.i.not.iter57, label %lincomb.exit.iter57, label %for.body.i.iter57, !dbg !203, !llvm.loop !204

lincomb.exit.iter57:                              ; preds = %for.body.i.iter57
  %ret.0.i.lcssa.iter57 = phi i8 [ %xor1.i.i.iter57, %for.body.i.iter57 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter57, ptr %c.addr.1.lcssa.iter56, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter57 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter56, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter57, !dbg !150

for.cond.i.preheader.iter57:                      ; preds = %for.cond1.preheader.iter57
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter57, !dbg !203

iter_57_end:                                      ; preds = %for.inc4.iter57
  br label %iter_58_start

iter_58_start:                                    ; preds = %iter_57_end
  br label %for.cond1.preheader.iter58

for.cond1.preheader.iter58:                       ; preds = %iter_58_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter58, !dbg !150

for.inc4.iter58:                                  ; preds = %lincomb.exit.iter58
  %c.addr.1.lcssa.iter58 = phi ptr [ %incdec.ptr.iter58, %lincomb.exit.iter58 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter58 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter57, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_58_end

for.body.i.iter58:                                ; preds = %for.cond.i.preheader.iter58, %for.body.i.iter58
  %i.0.i3.iter58 = phi i32 [ 0, %for.cond.i.preheader.iter58 ], [ %inc.i.iter58, %for.body.i.iter58 ]
  %b.addr.0.i2.iter58 = phi ptr [ %b, %for.cond.i.preheader.iter58 ], [ %add.ptr.i.iter58, %for.body.i.iter58 ]
  %ret.0.i1.iter58 = phi i8 [ 0, %for.cond.i.preheader.iter58 ], [ %xor1.i.i.iter58, %for.body.i.iter58 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter58 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter57, i32 %i.0.i3.iter58, !dbg !164
  %696 = load i8, ptr %arrayidx.i.iter58, align 1, !dbg !164
  %697 = load i8, ptr %b.addr.0.i2.iter58, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %698 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter58 = xor i8 %696, %698, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %699 = trunc i8 %xor1.i.iter58 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %700 = and i8 %xor1.i.iter58, 2, !dbg !179
  %mul9.i.iter58 = mul i8 %700, %697, !dbg !180
  %conv10.i.iter58 = select i1 %699, i8 %697, i8 0, !dbg !177
  %xor11.i.iter58 = xor i8 %conv10.i.iter58, %mul9.i.iter58, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %701 = and i8 %xor1.i.iter58, 4, !dbg !182
  %mul16.i.iter58 = mul i8 %701, %697, !dbg !183
  %xor18.i.iter58 = xor i8 %mul16.i.iter58, %xor11.i.iter58, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %702 = and i8 %xor1.i.iter58, 8, !dbg !185
  %mul23.i.iter58 = mul i8 %702, %697, !dbg !186
  %xor25.i.iter58 = xor i8 %mul23.i.iter58, %xor18.i.iter58, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %703 = lshr i8 %xor25.i.iter58, 4, !dbg !189
  %704 = lshr i8 %xor25.i.iter58, 3, !dbg !190
  %705 = and i8 %704, 14, !dbg !190
  %706 = xor i8 %703, %705, !dbg !191
  %xor25.masked.i.iter58 = and i8 %xor25.i.iter58, 15, !dbg !192
  %707 = xor i8 %706, %xor25.masked.i.iter58, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter58 = xor i8 %707, %ret.0.i1.iter58, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter58 = add nuw nsw i32 %i.0.i3.iter58, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter58 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter58, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter58 = icmp eq i32 %inc.i.iter58, 8, !dbg !202
  br i1 %exitcond.i.not.iter58, label %lincomb.exit.iter58, label %for.body.i.iter58, !dbg !203, !llvm.loop !204

lincomb.exit.iter58:                              ; preds = %for.body.i.iter58
  %ret.0.i.lcssa.iter58 = phi i8 [ %xor1.i.i.iter58, %for.body.i.iter58 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter58, ptr %c.addr.1.lcssa.iter57, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter58 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter57, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter58, !dbg !150

for.cond.i.preheader.iter58:                      ; preds = %for.cond1.preheader.iter58
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter58, !dbg !203

iter_58_end:                                      ; preds = %for.inc4.iter58
  br label %iter_59_start

iter_59_start:                                    ; preds = %iter_58_end
  br label %for.cond1.preheader.iter59

for.cond1.preheader.iter59:                       ; preds = %iter_59_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter59, !dbg !150

for.inc4.iter59:                                  ; preds = %lincomb.exit.iter59
  %c.addr.1.lcssa.iter59 = phi ptr [ %incdec.ptr.iter59, %lincomb.exit.iter59 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter59 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter58, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_59_end

for.body.i.iter59:                                ; preds = %for.cond.i.preheader.iter59, %for.body.i.iter59
  %i.0.i3.iter59 = phi i32 [ 0, %for.cond.i.preheader.iter59 ], [ %inc.i.iter59, %for.body.i.iter59 ]
  %b.addr.0.i2.iter59 = phi ptr [ %b, %for.cond.i.preheader.iter59 ], [ %add.ptr.i.iter59, %for.body.i.iter59 ]
  %ret.0.i1.iter59 = phi i8 [ 0, %for.cond.i.preheader.iter59 ], [ %xor1.i.i.iter59, %for.body.i.iter59 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter59 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter58, i32 %i.0.i3.iter59, !dbg !164
  %708 = load i8, ptr %arrayidx.i.iter59, align 1, !dbg !164
  %709 = load i8, ptr %b.addr.0.i2.iter59, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %710 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter59 = xor i8 %708, %710, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %711 = trunc i8 %xor1.i.iter59 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %712 = and i8 %xor1.i.iter59, 2, !dbg !179
  %mul9.i.iter59 = mul i8 %712, %709, !dbg !180
  %conv10.i.iter59 = select i1 %711, i8 %709, i8 0, !dbg !177
  %xor11.i.iter59 = xor i8 %conv10.i.iter59, %mul9.i.iter59, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %713 = and i8 %xor1.i.iter59, 4, !dbg !182
  %mul16.i.iter59 = mul i8 %713, %709, !dbg !183
  %xor18.i.iter59 = xor i8 %mul16.i.iter59, %xor11.i.iter59, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %714 = and i8 %xor1.i.iter59, 8, !dbg !185
  %mul23.i.iter59 = mul i8 %714, %709, !dbg !186
  %xor25.i.iter59 = xor i8 %mul23.i.iter59, %xor18.i.iter59, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %715 = lshr i8 %xor25.i.iter59, 4, !dbg !189
  %716 = lshr i8 %xor25.i.iter59, 3, !dbg !190
  %717 = and i8 %716, 14, !dbg !190
  %718 = xor i8 %715, %717, !dbg !191
  %xor25.masked.i.iter59 = and i8 %xor25.i.iter59, 15, !dbg !192
  %719 = xor i8 %718, %xor25.masked.i.iter59, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter59 = xor i8 %719, %ret.0.i1.iter59, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter59 = add nuw nsw i32 %i.0.i3.iter59, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter59 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter59, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter59 = icmp eq i32 %inc.i.iter59, 8, !dbg !202
  br i1 %exitcond.i.not.iter59, label %lincomb.exit.iter59, label %for.body.i.iter59, !dbg !203, !llvm.loop !204

lincomb.exit.iter59:                              ; preds = %for.body.i.iter59
  %ret.0.i.lcssa.iter59 = phi i8 [ %xor1.i.i.iter59, %for.body.i.iter59 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter59, ptr %c.addr.1.lcssa.iter58, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter59 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter58, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter59, !dbg !150

for.cond.i.preheader.iter59:                      ; preds = %for.cond1.preheader.iter59
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter59, !dbg !203

iter_59_end:                                      ; preds = %for.inc4.iter59
  br label %iter_60_start

iter_60_start:                                    ; preds = %iter_59_end
  br label %for.cond1.preheader.iter60

for.cond1.preheader.iter60:                       ; preds = %iter_60_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter60, !dbg !150

for.inc4.iter60:                                  ; preds = %lincomb.exit.iter60
  %c.addr.1.lcssa.iter60 = phi ptr [ %incdec.ptr.iter60, %lincomb.exit.iter60 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter60 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter59, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_60_end

for.body.i.iter60:                                ; preds = %for.cond.i.preheader.iter60, %for.body.i.iter60
  %i.0.i3.iter60 = phi i32 [ 0, %for.cond.i.preheader.iter60 ], [ %inc.i.iter60, %for.body.i.iter60 ]
  %b.addr.0.i2.iter60 = phi ptr [ %b, %for.cond.i.preheader.iter60 ], [ %add.ptr.i.iter60, %for.body.i.iter60 ]
  %ret.0.i1.iter60 = phi i8 [ 0, %for.cond.i.preheader.iter60 ], [ %xor1.i.i.iter60, %for.body.i.iter60 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter60 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter59, i32 %i.0.i3.iter60, !dbg !164
  %720 = load i8, ptr %arrayidx.i.iter60, align 1, !dbg !164
  %721 = load i8, ptr %b.addr.0.i2.iter60, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %722 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter60 = xor i8 %720, %722, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %723 = trunc i8 %xor1.i.iter60 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %724 = and i8 %xor1.i.iter60, 2, !dbg !179
  %mul9.i.iter60 = mul i8 %724, %721, !dbg !180
  %conv10.i.iter60 = select i1 %723, i8 %721, i8 0, !dbg !177
  %xor11.i.iter60 = xor i8 %conv10.i.iter60, %mul9.i.iter60, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %725 = and i8 %xor1.i.iter60, 4, !dbg !182
  %mul16.i.iter60 = mul i8 %725, %721, !dbg !183
  %xor18.i.iter60 = xor i8 %mul16.i.iter60, %xor11.i.iter60, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %726 = and i8 %xor1.i.iter60, 8, !dbg !185
  %mul23.i.iter60 = mul i8 %726, %721, !dbg !186
  %xor25.i.iter60 = xor i8 %mul23.i.iter60, %xor18.i.iter60, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %727 = lshr i8 %xor25.i.iter60, 4, !dbg !189
  %728 = lshr i8 %xor25.i.iter60, 3, !dbg !190
  %729 = and i8 %728, 14, !dbg !190
  %730 = xor i8 %727, %729, !dbg !191
  %xor25.masked.i.iter60 = and i8 %xor25.i.iter60, 15, !dbg !192
  %731 = xor i8 %730, %xor25.masked.i.iter60, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter60 = xor i8 %731, %ret.0.i1.iter60, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter60 = add nuw nsw i32 %i.0.i3.iter60, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter60 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter60, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter60 = icmp eq i32 %inc.i.iter60, 8, !dbg !202
  br i1 %exitcond.i.not.iter60, label %lincomb.exit.iter60, label %for.body.i.iter60, !dbg !203, !llvm.loop !204

lincomb.exit.iter60:                              ; preds = %for.body.i.iter60
  %ret.0.i.lcssa.iter60 = phi i8 [ %xor1.i.i.iter60, %for.body.i.iter60 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter60, ptr %c.addr.1.lcssa.iter59, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter60 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter59, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter60, !dbg !150

for.cond.i.preheader.iter60:                      ; preds = %for.cond1.preheader.iter60
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter60, !dbg !203

iter_60_end:                                      ; preds = %for.inc4.iter60
  br label %iter_61_start

iter_61_start:                                    ; preds = %iter_60_end
  br label %for.cond1.preheader.iter61

for.cond1.preheader.iter61:                       ; preds = %iter_61_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter61, !dbg !150

for.inc4.iter61:                                  ; preds = %lincomb.exit.iter61
  %c.addr.1.lcssa.iter61 = phi ptr [ %incdec.ptr.iter61, %lincomb.exit.iter61 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter61 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter60, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_61_end

for.body.i.iter61:                                ; preds = %for.cond.i.preheader.iter61, %for.body.i.iter61
  %i.0.i3.iter61 = phi i32 [ 0, %for.cond.i.preheader.iter61 ], [ %inc.i.iter61, %for.body.i.iter61 ]
  %b.addr.0.i2.iter61 = phi ptr [ %b, %for.cond.i.preheader.iter61 ], [ %add.ptr.i.iter61, %for.body.i.iter61 ]
  %ret.0.i1.iter61 = phi i8 [ 0, %for.cond.i.preheader.iter61 ], [ %xor1.i.i.iter61, %for.body.i.iter61 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter61 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter60, i32 %i.0.i3.iter61, !dbg !164
  %732 = load i8, ptr %arrayidx.i.iter61, align 1, !dbg !164
  %733 = load i8, ptr %b.addr.0.i2.iter61, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %734 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter61 = xor i8 %732, %734, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %735 = trunc i8 %xor1.i.iter61 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %736 = and i8 %xor1.i.iter61, 2, !dbg !179
  %mul9.i.iter61 = mul i8 %736, %733, !dbg !180
  %conv10.i.iter61 = select i1 %735, i8 %733, i8 0, !dbg !177
  %xor11.i.iter61 = xor i8 %conv10.i.iter61, %mul9.i.iter61, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %737 = and i8 %xor1.i.iter61, 4, !dbg !182
  %mul16.i.iter61 = mul i8 %737, %733, !dbg !183
  %xor18.i.iter61 = xor i8 %mul16.i.iter61, %xor11.i.iter61, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %738 = and i8 %xor1.i.iter61, 8, !dbg !185
  %mul23.i.iter61 = mul i8 %738, %733, !dbg !186
  %xor25.i.iter61 = xor i8 %mul23.i.iter61, %xor18.i.iter61, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %739 = lshr i8 %xor25.i.iter61, 4, !dbg !189
  %740 = lshr i8 %xor25.i.iter61, 3, !dbg !190
  %741 = and i8 %740, 14, !dbg !190
  %742 = xor i8 %739, %741, !dbg !191
  %xor25.masked.i.iter61 = and i8 %xor25.i.iter61, 15, !dbg !192
  %743 = xor i8 %742, %xor25.masked.i.iter61, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter61 = xor i8 %743, %ret.0.i1.iter61, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter61 = add nuw nsw i32 %i.0.i3.iter61, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter61 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter61, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter61 = icmp eq i32 %inc.i.iter61, 8, !dbg !202
  br i1 %exitcond.i.not.iter61, label %lincomb.exit.iter61, label %for.body.i.iter61, !dbg !203, !llvm.loop !204

lincomb.exit.iter61:                              ; preds = %for.body.i.iter61
  %ret.0.i.lcssa.iter61 = phi i8 [ %xor1.i.i.iter61, %for.body.i.iter61 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter61, ptr %c.addr.1.lcssa.iter60, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter61 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter60, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter61, !dbg !150

for.cond.i.preheader.iter61:                      ; preds = %for.cond1.preheader.iter61
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter61, !dbg !203

iter_61_end:                                      ; preds = %for.inc4.iter61
  br label %iter_62_start

iter_62_start:                                    ; preds = %iter_61_end
  br label %for.cond1.preheader.iter62

for.cond1.preheader.iter62:                       ; preds = %iter_62_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter62, !dbg !150

for.inc4.iter62:                                  ; preds = %lincomb.exit.iter62
  %c.addr.1.lcssa.iter62 = phi ptr [ %incdec.ptr.iter62, %lincomb.exit.iter62 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter62 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter61, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_62_end

for.body.i.iter62:                                ; preds = %for.cond.i.preheader.iter62, %for.body.i.iter62
  %i.0.i3.iter62 = phi i32 [ 0, %for.cond.i.preheader.iter62 ], [ %inc.i.iter62, %for.body.i.iter62 ]
  %b.addr.0.i2.iter62 = phi ptr [ %b, %for.cond.i.preheader.iter62 ], [ %add.ptr.i.iter62, %for.body.i.iter62 ]
  %ret.0.i1.iter62 = phi i8 [ 0, %for.cond.i.preheader.iter62 ], [ %xor1.i.i.iter62, %for.body.i.iter62 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter62 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter61, i32 %i.0.i3.iter62, !dbg !164
  %744 = load i8, ptr %arrayidx.i.iter62, align 1, !dbg !164
  %745 = load i8, ptr %b.addr.0.i2.iter62, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %746 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter62 = xor i8 %744, %746, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %747 = trunc i8 %xor1.i.iter62 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %748 = and i8 %xor1.i.iter62, 2, !dbg !179
  %mul9.i.iter62 = mul i8 %748, %745, !dbg !180
  %conv10.i.iter62 = select i1 %747, i8 %745, i8 0, !dbg !177
  %xor11.i.iter62 = xor i8 %conv10.i.iter62, %mul9.i.iter62, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %749 = and i8 %xor1.i.iter62, 4, !dbg !182
  %mul16.i.iter62 = mul i8 %749, %745, !dbg !183
  %xor18.i.iter62 = xor i8 %mul16.i.iter62, %xor11.i.iter62, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %750 = and i8 %xor1.i.iter62, 8, !dbg !185
  %mul23.i.iter62 = mul i8 %750, %745, !dbg !186
  %xor25.i.iter62 = xor i8 %mul23.i.iter62, %xor18.i.iter62, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %751 = lshr i8 %xor25.i.iter62, 4, !dbg !189
  %752 = lshr i8 %xor25.i.iter62, 3, !dbg !190
  %753 = and i8 %752, 14, !dbg !190
  %754 = xor i8 %751, %753, !dbg !191
  %xor25.masked.i.iter62 = and i8 %xor25.i.iter62, 15, !dbg !192
  %755 = xor i8 %754, %xor25.masked.i.iter62, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter62 = xor i8 %755, %ret.0.i1.iter62, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter62 = add nuw nsw i32 %i.0.i3.iter62, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter62 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter62, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter62 = icmp eq i32 %inc.i.iter62, 8, !dbg !202
  br i1 %exitcond.i.not.iter62, label %lincomb.exit.iter62, label %for.body.i.iter62, !dbg !203, !llvm.loop !204

lincomb.exit.iter62:                              ; preds = %for.body.i.iter62
  %ret.0.i.lcssa.iter62 = phi i8 [ %xor1.i.i.iter62, %for.body.i.iter62 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter62, ptr %c.addr.1.lcssa.iter61, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter62 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter61, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter62, !dbg !150

for.cond.i.preheader.iter62:                      ; preds = %for.cond1.preheader.iter62
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter62, !dbg !203

iter_62_end:                                      ; preds = %for.inc4.iter62
  br label %iter_63_start

iter_63_start:                                    ; preds = %iter_62_end
  br label %for.cond1.preheader.iter63

for.cond1.preheader.iter63:                       ; preds = %iter_63_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter63, !dbg !150

for.inc4.iter63:                                  ; preds = %lincomb.exit.iter63
  %c.addr.1.lcssa.iter63 = phi ptr [ %incdec.ptr.iter63, %lincomb.exit.iter63 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter63 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter62, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_63_end

for.body.i.iter63:                                ; preds = %for.cond.i.preheader.iter63, %for.body.i.iter63
  %i.0.i3.iter63 = phi i32 [ 0, %for.cond.i.preheader.iter63 ], [ %inc.i.iter63, %for.body.i.iter63 ]
  %b.addr.0.i2.iter63 = phi ptr [ %b, %for.cond.i.preheader.iter63 ], [ %add.ptr.i.iter63, %for.body.i.iter63 ]
  %ret.0.i1.iter63 = phi i8 [ 0, %for.cond.i.preheader.iter63 ], [ %xor1.i.i.iter63, %for.body.i.iter63 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter63 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter62, i32 %i.0.i3.iter63, !dbg !164
  %756 = load i8, ptr %arrayidx.i.iter63, align 1, !dbg !164
  %757 = load i8, ptr %b.addr.0.i2.iter63, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %758 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter63 = xor i8 %756, %758, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %759 = trunc i8 %xor1.i.iter63 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %760 = and i8 %xor1.i.iter63, 2, !dbg !179
  %mul9.i.iter63 = mul i8 %760, %757, !dbg !180
  %conv10.i.iter63 = select i1 %759, i8 %757, i8 0, !dbg !177
  %xor11.i.iter63 = xor i8 %conv10.i.iter63, %mul9.i.iter63, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %761 = and i8 %xor1.i.iter63, 4, !dbg !182
  %mul16.i.iter63 = mul i8 %761, %757, !dbg !183
  %xor18.i.iter63 = xor i8 %mul16.i.iter63, %xor11.i.iter63, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %762 = and i8 %xor1.i.iter63, 8, !dbg !185
  %mul23.i.iter63 = mul i8 %762, %757, !dbg !186
  %xor25.i.iter63 = xor i8 %mul23.i.iter63, %xor18.i.iter63, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %763 = lshr i8 %xor25.i.iter63, 4, !dbg !189
  %764 = lshr i8 %xor25.i.iter63, 3, !dbg !190
  %765 = and i8 %764, 14, !dbg !190
  %766 = xor i8 %763, %765, !dbg !191
  %xor25.masked.i.iter63 = and i8 %xor25.i.iter63, 15, !dbg !192
  %767 = xor i8 %766, %xor25.masked.i.iter63, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter63 = xor i8 %767, %ret.0.i1.iter63, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter63 = add nuw nsw i32 %i.0.i3.iter63, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter63 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter63, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter63 = icmp eq i32 %inc.i.iter63, 8, !dbg !202
  br i1 %exitcond.i.not.iter63, label %lincomb.exit.iter63, label %for.body.i.iter63, !dbg !203, !llvm.loop !204

lincomb.exit.iter63:                              ; preds = %for.body.i.iter63
  %ret.0.i.lcssa.iter63 = phi i8 [ %xor1.i.i.iter63, %for.body.i.iter63 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter63, ptr %c.addr.1.lcssa.iter62, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter63 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter62, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter63, !dbg !150

for.cond.i.preheader.iter63:                      ; preds = %for.cond1.preheader.iter63
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter63, !dbg !203

iter_63_end:                                      ; preds = %for.inc4.iter63
  br label %iter_64_start

iter_64_start:                                    ; preds = %iter_63_end
  br label %for.cond1.preheader.iter64

for.cond1.preheader.iter64:                       ; preds = %iter_64_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter64, !dbg !150

for.inc4.iter64:                                  ; preds = %lincomb.exit.iter64
  %c.addr.1.lcssa.iter64 = phi ptr [ %incdec.ptr.iter64, %lincomb.exit.iter64 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter64 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter63, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_64_end

for.body.i.iter64:                                ; preds = %for.cond.i.preheader.iter64, %for.body.i.iter64
  %i.0.i3.iter64 = phi i32 [ 0, %for.cond.i.preheader.iter64 ], [ %inc.i.iter64, %for.body.i.iter64 ]
  %b.addr.0.i2.iter64 = phi ptr [ %b, %for.cond.i.preheader.iter64 ], [ %add.ptr.i.iter64, %for.body.i.iter64 ]
  %ret.0.i1.iter64 = phi i8 [ 0, %for.cond.i.preheader.iter64 ], [ %xor1.i.i.iter64, %for.body.i.iter64 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter64 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter63, i32 %i.0.i3.iter64, !dbg !164
  %768 = load i8, ptr %arrayidx.i.iter64, align 1, !dbg !164
  %769 = load i8, ptr %b.addr.0.i2.iter64, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %770 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter64 = xor i8 %768, %770, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %771 = trunc i8 %xor1.i.iter64 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %772 = and i8 %xor1.i.iter64, 2, !dbg !179
  %mul9.i.iter64 = mul i8 %772, %769, !dbg !180
  %conv10.i.iter64 = select i1 %771, i8 %769, i8 0, !dbg !177
  %xor11.i.iter64 = xor i8 %conv10.i.iter64, %mul9.i.iter64, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %773 = and i8 %xor1.i.iter64, 4, !dbg !182
  %mul16.i.iter64 = mul i8 %773, %769, !dbg !183
  %xor18.i.iter64 = xor i8 %mul16.i.iter64, %xor11.i.iter64, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %774 = and i8 %xor1.i.iter64, 8, !dbg !185
  %mul23.i.iter64 = mul i8 %774, %769, !dbg !186
  %xor25.i.iter64 = xor i8 %mul23.i.iter64, %xor18.i.iter64, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %775 = lshr i8 %xor25.i.iter64, 4, !dbg !189
  %776 = lshr i8 %xor25.i.iter64, 3, !dbg !190
  %777 = and i8 %776, 14, !dbg !190
  %778 = xor i8 %775, %777, !dbg !191
  %xor25.masked.i.iter64 = and i8 %xor25.i.iter64, 15, !dbg !192
  %779 = xor i8 %778, %xor25.masked.i.iter64, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter64 = xor i8 %779, %ret.0.i1.iter64, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter64 = add nuw nsw i32 %i.0.i3.iter64, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter64 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter64, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter64 = icmp eq i32 %inc.i.iter64, 8, !dbg !202
  br i1 %exitcond.i.not.iter64, label %lincomb.exit.iter64, label %for.body.i.iter64, !dbg !203, !llvm.loop !204

lincomb.exit.iter64:                              ; preds = %for.body.i.iter64
  %ret.0.i.lcssa.iter64 = phi i8 [ %xor1.i.i.iter64, %for.body.i.iter64 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter64, ptr %c.addr.1.lcssa.iter63, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter64 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter63, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter64, !dbg !150

for.cond.i.preheader.iter64:                      ; preds = %for.cond1.preheader.iter64
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter64, !dbg !203

iter_64_end:                                      ; preds = %for.inc4.iter64
  br label %iter_65_start

iter_65_start:                                    ; preds = %iter_64_end
  br label %for.cond1.preheader.iter65

for.cond1.preheader.iter65:                       ; preds = %iter_65_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter65, !dbg !150

for.inc4.iter65:                                  ; preds = %lincomb.exit.iter65
  %c.addr.1.lcssa.iter65 = phi ptr [ %incdec.ptr.iter65, %lincomb.exit.iter65 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter65 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter64, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_65_end

for.body.i.iter65:                                ; preds = %for.cond.i.preheader.iter65, %for.body.i.iter65
  %i.0.i3.iter65 = phi i32 [ 0, %for.cond.i.preheader.iter65 ], [ %inc.i.iter65, %for.body.i.iter65 ]
  %b.addr.0.i2.iter65 = phi ptr [ %b, %for.cond.i.preheader.iter65 ], [ %add.ptr.i.iter65, %for.body.i.iter65 ]
  %ret.0.i1.iter65 = phi i8 [ 0, %for.cond.i.preheader.iter65 ], [ %xor1.i.i.iter65, %for.body.i.iter65 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter65 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter64, i32 %i.0.i3.iter65, !dbg !164
  %780 = load i8, ptr %arrayidx.i.iter65, align 1, !dbg !164
  %781 = load i8, ptr %b.addr.0.i2.iter65, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %782 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter65 = xor i8 %780, %782, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %783 = trunc i8 %xor1.i.iter65 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %784 = and i8 %xor1.i.iter65, 2, !dbg !179
  %mul9.i.iter65 = mul i8 %784, %781, !dbg !180
  %conv10.i.iter65 = select i1 %783, i8 %781, i8 0, !dbg !177
  %xor11.i.iter65 = xor i8 %conv10.i.iter65, %mul9.i.iter65, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %785 = and i8 %xor1.i.iter65, 4, !dbg !182
  %mul16.i.iter65 = mul i8 %785, %781, !dbg !183
  %xor18.i.iter65 = xor i8 %mul16.i.iter65, %xor11.i.iter65, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %786 = and i8 %xor1.i.iter65, 8, !dbg !185
  %mul23.i.iter65 = mul i8 %786, %781, !dbg !186
  %xor25.i.iter65 = xor i8 %mul23.i.iter65, %xor18.i.iter65, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %787 = lshr i8 %xor25.i.iter65, 4, !dbg !189
  %788 = lshr i8 %xor25.i.iter65, 3, !dbg !190
  %789 = and i8 %788, 14, !dbg !190
  %790 = xor i8 %787, %789, !dbg !191
  %xor25.masked.i.iter65 = and i8 %xor25.i.iter65, 15, !dbg !192
  %791 = xor i8 %790, %xor25.masked.i.iter65, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter65 = xor i8 %791, %ret.0.i1.iter65, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter65 = add nuw nsw i32 %i.0.i3.iter65, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter65 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter65, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter65 = icmp eq i32 %inc.i.iter65, 8, !dbg !202
  br i1 %exitcond.i.not.iter65, label %lincomb.exit.iter65, label %for.body.i.iter65, !dbg !203, !llvm.loop !204

lincomb.exit.iter65:                              ; preds = %for.body.i.iter65
  %ret.0.i.lcssa.iter65 = phi i8 [ %xor1.i.i.iter65, %for.body.i.iter65 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter65, ptr %c.addr.1.lcssa.iter64, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter65 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter64, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter65, !dbg !150

for.cond.i.preheader.iter65:                      ; preds = %for.cond1.preheader.iter65
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter65, !dbg !203

iter_65_end:                                      ; preds = %for.inc4.iter65
  br label %iter_66_start

iter_66_start:                                    ; preds = %iter_65_end
  br label %for.cond1.preheader.iter66

for.cond1.preheader.iter66:                       ; preds = %iter_66_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter66, !dbg !150

for.inc4.iter66:                                  ; preds = %lincomb.exit.iter66
  %c.addr.1.lcssa.iter66 = phi ptr [ %incdec.ptr.iter66, %lincomb.exit.iter66 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter66 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter65, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_66_end

for.body.i.iter66:                                ; preds = %for.cond.i.preheader.iter66, %for.body.i.iter66
  %i.0.i3.iter66 = phi i32 [ 0, %for.cond.i.preheader.iter66 ], [ %inc.i.iter66, %for.body.i.iter66 ]
  %b.addr.0.i2.iter66 = phi ptr [ %b, %for.cond.i.preheader.iter66 ], [ %add.ptr.i.iter66, %for.body.i.iter66 ]
  %ret.0.i1.iter66 = phi i8 [ 0, %for.cond.i.preheader.iter66 ], [ %xor1.i.i.iter66, %for.body.i.iter66 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter66 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter65, i32 %i.0.i3.iter66, !dbg !164
  %792 = load i8, ptr %arrayidx.i.iter66, align 1, !dbg !164
  %793 = load i8, ptr %b.addr.0.i2.iter66, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %794 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter66 = xor i8 %792, %794, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %795 = trunc i8 %xor1.i.iter66 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %796 = and i8 %xor1.i.iter66, 2, !dbg !179
  %mul9.i.iter66 = mul i8 %796, %793, !dbg !180
  %conv10.i.iter66 = select i1 %795, i8 %793, i8 0, !dbg !177
  %xor11.i.iter66 = xor i8 %conv10.i.iter66, %mul9.i.iter66, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %797 = and i8 %xor1.i.iter66, 4, !dbg !182
  %mul16.i.iter66 = mul i8 %797, %793, !dbg !183
  %xor18.i.iter66 = xor i8 %mul16.i.iter66, %xor11.i.iter66, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %798 = and i8 %xor1.i.iter66, 8, !dbg !185
  %mul23.i.iter66 = mul i8 %798, %793, !dbg !186
  %xor25.i.iter66 = xor i8 %mul23.i.iter66, %xor18.i.iter66, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %799 = lshr i8 %xor25.i.iter66, 4, !dbg !189
  %800 = lshr i8 %xor25.i.iter66, 3, !dbg !190
  %801 = and i8 %800, 14, !dbg !190
  %802 = xor i8 %799, %801, !dbg !191
  %xor25.masked.i.iter66 = and i8 %xor25.i.iter66, 15, !dbg !192
  %803 = xor i8 %802, %xor25.masked.i.iter66, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter66 = xor i8 %803, %ret.0.i1.iter66, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter66 = add nuw nsw i32 %i.0.i3.iter66, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter66 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter66, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter66 = icmp eq i32 %inc.i.iter66, 8, !dbg !202
  br i1 %exitcond.i.not.iter66, label %lincomb.exit.iter66, label %for.body.i.iter66, !dbg !203, !llvm.loop !204

lincomb.exit.iter66:                              ; preds = %for.body.i.iter66
  %ret.0.i.lcssa.iter66 = phi i8 [ %xor1.i.i.iter66, %for.body.i.iter66 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter66, ptr %c.addr.1.lcssa.iter65, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter66 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter65, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter66, !dbg !150

for.cond.i.preheader.iter66:                      ; preds = %for.cond1.preheader.iter66
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter66, !dbg !203

iter_66_end:                                      ; preds = %for.inc4.iter66
  br label %iter_67_start

iter_67_start:                                    ; preds = %iter_66_end
  br label %for.cond1.preheader.iter67

for.cond1.preheader.iter67:                       ; preds = %iter_67_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter67, !dbg !150

for.inc4.iter67:                                  ; preds = %lincomb.exit.iter67
  %c.addr.1.lcssa.iter67 = phi ptr [ %incdec.ptr.iter67, %lincomb.exit.iter67 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter67 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter66, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_67_end

for.body.i.iter67:                                ; preds = %for.cond.i.preheader.iter67, %for.body.i.iter67
  %i.0.i3.iter67 = phi i32 [ 0, %for.cond.i.preheader.iter67 ], [ %inc.i.iter67, %for.body.i.iter67 ]
  %b.addr.0.i2.iter67 = phi ptr [ %b, %for.cond.i.preheader.iter67 ], [ %add.ptr.i.iter67, %for.body.i.iter67 ]
  %ret.0.i1.iter67 = phi i8 [ 0, %for.cond.i.preheader.iter67 ], [ %xor1.i.i.iter67, %for.body.i.iter67 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter67 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter66, i32 %i.0.i3.iter67, !dbg !164
  %804 = load i8, ptr %arrayidx.i.iter67, align 1, !dbg !164
  %805 = load i8, ptr %b.addr.0.i2.iter67, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %806 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter67 = xor i8 %804, %806, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %807 = trunc i8 %xor1.i.iter67 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %808 = and i8 %xor1.i.iter67, 2, !dbg !179
  %mul9.i.iter67 = mul i8 %808, %805, !dbg !180
  %conv10.i.iter67 = select i1 %807, i8 %805, i8 0, !dbg !177
  %xor11.i.iter67 = xor i8 %conv10.i.iter67, %mul9.i.iter67, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %809 = and i8 %xor1.i.iter67, 4, !dbg !182
  %mul16.i.iter67 = mul i8 %809, %805, !dbg !183
  %xor18.i.iter67 = xor i8 %mul16.i.iter67, %xor11.i.iter67, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %810 = and i8 %xor1.i.iter67, 8, !dbg !185
  %mul23.i.iter67 = mul i8 %810, %805, !dbg !186
  %xor25.i.iter67 = xor i8 %mul23.i.iter67, %xor18.i.iter67, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %811 = lshr i8 %xor25.i.iter67, 4, !dbg !189
  %812 = lshr i8 %xor25.i.iter67, 3, !dbg !190
  %813 = and i8 %812, 14, !dbg !190
  %814 = xor i8 %811, %813, !dbg !191
  %xor25.masked.i.iter67 = and i8 %xor25.i.iter67, 15, !dbg !192
  %815 = xor i8 %814, %xor25.masked.i.iter67, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter67 = xor i8 %815, %ret.0.i1.iter67, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter67 = add nuw nsw i32 %i.0.i3.iter67, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter67 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter67, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter67 = icmp eq i32 %inc.i.iter67, 8, !dbg !202
  br i1 %exitcond.i.not.iter67, label %lincomb.exit.iter67, label %for.body.i.iter67, !dbg !203, !llvm.loop !204

lincomb.exit.iter67:                              ; preds = %for.body.i.iter67
  %ret.0.i.lcssa.iter67 = phi i8 [ %xor1.i.i.iter67, %for.body.i.iter67 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter67, ptr %c.addr.1.lcssa.iter66, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter67 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter66, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter67, !dbg !150

for.cond.i.preheader.iter67:                      ; preds = %for.cond1.preheader.iter67
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter67, !dbg !203

iter_67_end:                                      ; preds = %for.inc4.iter67
  br label %iter_68_start

iter_68_start:                                    ; preds = %iter_67_end
  br label %for.cond1.preheader.iter68

for.cond1.preheader.iter68:                       ; preds = %iter_68_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter68, !dbg !150

for.inc4.iter68:                                  ; preds = %lincomb.exit.iter68
  %c.addr.1.lcssa.iter68 = phi ptr [ %incdec.ptr.iter68, %lincomb.exit.iter68 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter68 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter67, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_68_end

for.body.i.iter68:                                ; preds = %for.cond.i.preheader.iter68, %for.body.i.iter68
  %i.0.i3.iter68 = phi i32 [ 0, %for.cond.i.preheader.iter68 ], [ %inc.i.iter68, %for.body.i.iter68 ]
  %b.addr.0.i2.iter68 = phi ptr [ %b, %for.cond.i.preheader.iter68 ], [ %add.ptr.i.iter68, %for.body.i.iter68 ]
  %ret.0.i1.iter68 = phi i8 [ 0, %for.cond.i.preheader.iter68 ], [ %xor1.i.i.iter68, %for.body.i.iter68 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter68 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter67, i32 %i.0.i3.iter68, !dbg !164
  %816 = load i8, ptr %arrayidx.i.iter68, align 1, !dbg !164
  %817 = load i8, ptr %b.addr.0.i2.iter68, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %818 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter68 = xor i8 %816, %818, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %819 = trunc i8 %xor1.i.iter68 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %820 = and i8 %xor1.i.iter68, 2, !dbg !179
  %mul9.i.iter68 = mul i8 %820, %817, !dbg !180
  %conv10.i.iter68 = select i1 %819, i8 %817, i8 0, !dbg !177
  %xor11.i.iter68 = xor i8 %conv10.i.iter68, %mul9.i.iter68, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %821 = and i8 %xor1.i.iter68, 4, !dbg !182
  %mul16.i.iter68 = mul i8 %821, %817, !dbg !183
  %xor18.i.iter68 = xor i8 %mul16.i.iter68, %xor11.i.iter68, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %822 = and i8 %xor1.i.iter68, 8, !dbg !185
  %mul23.i.iter68 = mul i8 %822, %817, !dbg !186
  %xor25.i.iter68 = xor i8 %mul23.i.iter68, %xor18.i.iter68, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %823 = lshr i8 %xor25.i.iter68, 4, !dbg !189
  %824 = lshr i8 %xor25.i.iter68, 3, !dbg !190
  %825 = and i8 %824, 14, !dbg !190
  %826 = xor i8 %823, %825, !dbg !191
  %xor25.masked.i.iter68 = and i8 %xor25.i.iter68, 15, !dbg !192
  %827 = xor i8 %826, %xor25.masked.i.iter68, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter68 = xor i8 %827, %ret.0.i1.iter68, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter68 = add nuw nsw i32 %i.0.i3.iter68, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter68 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter68, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter68 = icmp eq i32 %inc.i.iter68, 8, !dbg !202
  br i1 %exitcond.i.not.iter68, label %lincomb.exit.iter68, label %for.body.i.iter68, !dbg !203, !llvm.loop !204

lincomb.exit.iter68:                              ; preds = %for.body.i.iter68
  %ret.0.i.lcssa.iter68 = phi i8 [ %xor1.i.i.iter68, %for.body.i.iter68 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter68, ptr %c.addr.1.lcssa.iter67, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter68 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter67, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter68, !dbg !150

for.cond.i.preheader.iter68:                      ; preds = %for.cond1.preheader.iter68
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter68, !dbg !203

iter_68_end:                                      ; preds = %for.inc4.iter68
  br label %iter_69_start

iter_69_start:                                    ; preds = %iter_68_end
  br label %for.cond1.preheader.iter69

for.cond1.preheader.iter69:                       ; preds = %iter_69_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter69, !dbg !150

for.inc4.iter69:                                  ; preds = %lincomb.exit.iter69
  %c.addr.1.lcssa.iter69 = phi ptr [ %incdec.ptr.iter69, %lincomb.exit.iter69 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter69 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter68, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_69_end

for.body.i.iter69:                                ; preds = %for.cond.i.preheader.iter69, %for.body.i.iter69
  %i.0.i3.iter69 = phi i32 [ 0, %for.cond.i.preheader.iter69 ], [ %inc.i.iter69, %for.body.i.iter69 ]
  %b.addr.0.i2.iter69 = phi ptr [ %b, %for.cond.i.preheader.iter69 ], [ %add.ptr.i.iter69, %for.body.i.iter69 ]
  %ret.0.i1.iter69 = phi i8 [ 0, %for.cond.i.preheader.iter69 ], [ %xor1.i.i.iter69, %for.body.i.iter69 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter69 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter68, i32 %i.0.i3.iter69, !dbg !164
  %828 = load i8, ptr %arrayidx.i.iter69, align 1, !dbg !164
  %829 = load i8, ptr %b.addr.0.i2.iter69, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %830 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter69 = xor i8 %828, %830, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %831 = trunc i8 %xor1.i.iter69 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %832 = and i8 %xor1.i.iter69, 2, !dbg !179
  %mul9.i.iter69 = mul i8 %832, %829, !dbg !180
  %conv10.i.iter69 = select i1 %831, i8 %829, i8 0, !dbg !177
  %xor11.i.iter69 = xor i8 %conv10.i.iter69, %mul9.i.iter69, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %833 = and i8 %xor1.i.iter69, 4, !dbg !182
  %mul16.i.iter69 = mul i8 %833, %829, !dbg !183
  %xor18.i.iter69 = xor i8 %mul16.i.iter69, %xor11.i.iter69, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %834 = and i8 %xor1.i.iter69, 8, !dbg !185
  %mul23.i.iter69 = mul i8 %834, %829, !dbg !186
  %xor25.i.iter69 = xor i8 %mul23.i.iter69, %xor18.i.iter69, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %835 = lshr i8 %xor25.i.iter69, 4, !dbg !189
  %836 = lshr i8 %xor25.i.iter69, 3, !dbg !190
  %837 = and i8 %836, 14, !dbg !190
  %838 = xor i8 %835, %837, !dbg !191
  %xor25.masked.i.iter69 = and i8 %xor25.i.iter69, 15, !dbg !192
  %839 = xor i8 %838, %xor25.masked.i.iter69, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter69 = xor i8 %839, %ret.0.i1.iter69, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter69 = add nuw nsw i32 %i.0.i3.iter69, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter69 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter69, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter69 = icmp eq i32 %inc.i.iter69, 8, !dbg !202
  br i1 %exitcond.i.not.iter69, label %lincomb.exit.iter69, label %for.body.i.iter69, !dbg !203, !llvm.loop !204

lincomb.exit.iter69:                              ; preds = %for.body.i.iter69
  %ret.0.i.lcssa.iter69 = phi i8 [ %xor1.i.i.iter69, %for.body.i.iter69 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter69, ptr %c.addr.1.lcssa.iter68, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter69 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter68, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter69, !dbg !150

for.cond.i.preheader.iter69:                      ; preds = %for.cond1.preheader.iter69
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter69, !dbg !203

iter_69_end:                                      ; preds = %for.inc4.iter69
  br label %iter_70_start

iter_70_start:                                    ; preds = %iter_69_end
  br label %for.cond1.preheader.iter70

for.cond1.preheader.iter70:                       ; preds = %iter_70_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter70, !dbg !150

for.inc4.iter70:                                  ; preds = %lincomb.exit.iter70
  %c.addr.1.lcssa.iter70 = phi ptr [ %incdec.ptr.iter70, %lincomb.exit.iter70 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter70 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter69, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_70_end

for.body.i.iter70:                                ; preds = %for.cond.i.preheader.iter70, %for.body.i.iter70
  %i.0.i3.iter70 = phi i32 [ 0, %for.cond.i.preheader.iter70 ], [ %inc.i.iter70, %for.body.i.iter70 ]
  %b.addr.0.i2.iter70 = phi ptr [ %b, %for.cond.i.preheader.iter70 ], [ %add.ptr.i.iter70, %for.body.i.iter70 ]
  %ret.0.i1.iter70 = phi i8 [ 0, %for.cond.i.preheader.iter70 ], [ %xor1.i.i.iter70, %for.body.i.iter70 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter70 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter69, i32 %i.0.i3.iter70, !dbg !164
  %840 = load i8, ptr %arrayidx.i.iter70, align 1, !dbg !164
  %841 = load i8, ptr %b.addr.0.i2.iter70, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %842 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter70 = xor i8 %840, %842, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %843 = trunc i8 %xor1.i.iter70 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %844 = and i8 %xor1.i.iter70, 2, !dbg !179
  %mul9.i.iter70 = mul i8 %844, %841, !dbg !180
  %conv10.i.iter70 = select i1 %843, i8 %841, i8 0, !dbg !177
  %xor11.i.iter70 = xor i8 %conv10.i.iter70, %mul9.i.iter70, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %845 = and i8 %xor1.i.iter70, 4, !dbg !182
  %mul16.i.iter70 = mul i8 %845, %841, !dbg !183
  %xor18.i.iter70 = xor i8 %mul16.i.iter70, %xor11.i.iter70, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %846 = and i8 %xor1.i.iter70, 8, !dbg !185
  %mul23.i.iter70 = mul i8 %846, %841, !dbg !186
  %xor25.i.iter70 = xor i8 %mul23.i.iter70, %xor18.i.iter70, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %847 = lshr i8 %xor25.i.iter70, 4, !dbg !189
  %848 = lshr i8 %xor25.i.iter70, 3, !dbg !190
  %849 = and i8 %848, 14, !dbg !190
  %850 = xor i8 %847, %849, !dbg !191
  %xor25.masked.i.iter70 = and i8 %xor25.i.iter70, 15, !dbg !192
  %851 = xor i8 %850, %xor25.masked.i.iter70, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter70 = xor i8 %851, %ret.0.i1.iter70, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter70 = add nuw nsw i32 %i.0.i3.iter70, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter70 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter70, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter70 = icmp eq i32 %inc.i.iter70, 8, !dbg !202
  br i1 %exitcond.i.not.iter70, label %lincomb.exit.iter70, label %for.body.i.iter70, !dbg !203, !llvm.loop !204

lincomb.exit.iter70:                              ; preds = %for.body.i.iter70
  %ret.0.i.lcssa.iter70 = phi i8 [ %xor1.i.i.iter70, %for.body.i.iter70 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter70, ptr %c.addr.1.lcssa.iter69, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter70 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter69, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter70, !dbg !150

for.cond.i.preheader.iter70:                      ; preds = %for.cond1.preheader.iter70
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter70, !dbg !203

iter_70_end:                                      ; preds = %for.inc4.iter70
  br label %iter_71_start

iter_71_start:                                    ; preds = %iter_70_end
  br label %for.cond1.preheader.iter71

for.cond1.preheader.iter71:                       ; preds = %iter_71_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter71, !dbg !150

for.inc4.iter71:                                  ; preds = %lincomb.exit.iter71
  %c.addr.1.lcssa.iter71 = phi ptr [ %incdec.ptr.iter71, %lincomb.exit.iter71 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter71 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter70, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_71_end

for.body.i.iter71:                                ; preds = %for.cond.i.preheader.iter71, %for.body.i.iter71
  %i.0.i3.iter71 = phi i32 [ 0, %for.cond.i.preheader.iter71 ], [ %inc.i.iter71, %for.body.i.iter71 ]
  %b.addr.0.i2.iter71 = phi ptr [ %b, %for.cond.i.preheader.iter71 ], [ %add.ptr.i.iter71, %for.body.i.iter71 ]
  %ret.0.i1.iter71 = phi i8 [ 0, %for.cond.i.preheader.iter71 ], [ %xor1.i.i.iter71, %for.body.i.iter71 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter71 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter70, i32 %i.0.i3.iter71, !dbg !164
  %852 = load i8, ptr %arrayidx.i.iter71, align 1, !dbg !164
  %853 = load i8, ptr %b.addr.0.i2.iter71, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %854 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter71 = xor i8 %852, %854, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %855 = trunc i8 %xor1.i.iter71 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %856 = and i8 %xor1.i.iter71, 2, !dbg !179
  %mul9.i.iter71 = mul i8 %856, %853, !dbg !180
  %conv10.i.iter71 = select i1 %855, i8 %853, i8 0, !dbg !177
  %xor11.i.iter71 = xor i8 %conv10.i.iter71, %mul9.i.iter71, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %857 = and i8 %xor1.i.iter71, 4, !dbg !182
  %mul16.i.iter71 = mul i8 %857, %853, !dbg !183
  %xor18.i.iter71 = xor i8 %mul16.i.iter71, %xor11.i.iter71, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %858 = and i8 %xor1.i.iter71, 8, !dbg !185
  %mul23.i.iter71 = mul i8 %858, %853, !dbg !186
  %xor25.i.iter71 = xor i8 %mul23.i.iter71, %xor18.i.iter71, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %859 = lshr i8 %xor25.i.iter71, 4, !dbg !189
  %860 = lshr i8 %xor25.i.iter71, 3, !dbg !190
  %861 = and i8 %860, 14, !dbg !190
  %862 = xor i8 %859, %861, !dbg !191
  %xor25.masked.i.iter71 = and i8 %xor25.i.iter71, 15, !dbg !192
  %863 = xor i8 %862, %xor25.masked.i.iter71, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter71 = xor i8 %863, %ret.0.i1.iter71, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter71 = add nuw nsw i32 %i.0.i3.iter71, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter71 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter71, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter71 = icmp eq i32 %inc.i.iter71, 8, !dbg !202
  br i1 %exitcond.i.not.iter71, label %lincomb.exit.iter71, label %for.body.i.iter71, !dbg !203, !llvm.loop !204

lincomb.exit.iter71:                              ; preds = %for.body.i.iter71
  %ret.0.i.lcssa.iter71 = phi i8 [ %xor1.i.i.iter71, %for.body.i.iter71 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter71, ptr %c.addr.1.lcssa.iter70, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter71 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter70, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter71, !dbg !150

for.cond.i.preheader.iter71:                      ; preds = %for.cond1.preheader.iter71
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter71, !dbg !203

iter_71_end:                                      ; preds = %for.inc4.iter71
  br label %iter_72_start

iter_72_start:                                    ; preds = %iter_71_end
  br label %for.cond1.preheader.iter72

for.cond1.preheader.iter72:                       ; preds = %iter_72_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter72, !dbg !150

for.inc4.iter72:                                  ; preds = %lincomb.exit.iter72
  %c.addr.1.lcssa.iter72 = phi ptr [ %incdec.ptr.iter72, %lincomb.exit.iter72 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter72 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter71, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_72_end

for.body.i.iter72:                                ; preds = %for.cond.i.preheader.iter72, %for.body.i.iter72
  %i.0.i3.iter72 = phi i32 [ 0, %for.cond.i.preheader.iter72 ], [ %inc.i.iter72, %for.body.i.iter72 ]
  %b.addr.0.i2.iter72 = phi ptr [ %b, %for.cond.i.preheader.iter72 ], [ %add.ptr.i.iter72, %for.body.i.iter72 ]
  %ret.0.i1.iter72 = phi i8 [ 0, %for.cond.i.preheader.iter72 ], [ %xor1.i.i.iter72, %for.body.i.iter72 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter72 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter71, i32 %i.0.i3.iter72, !dbg !164
  %864 = load i8, ptr %arrayidx.i.iter72, align 1, !dbg !164
  %865 = load i8, ptr %b.addr.0.i2.iter72, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %866 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter72 = xor i8 %864, %866, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %867 = trunc i8 %xor1.i.iter72 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %868 = and i8 %xor1.i.iter72, 2, !dbg !179
  %mul9.i.iter72 = mul i8 %868, %865, !dbg !180
  %conv10.i.iter72 = select i1 %867, i8 %865, i8 0, !dbg !177
  %xor11.i.iter72 = xor i8 %conv10.i.iter72, %mul9.i.iter72, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %869 = and i8 %xor1.i.iter72, 4, !dbg !182
  %mul16.i.iter72 = mul i8 %869, %865, !dbg !183
  %xor18.i.iter72 = xor i8 %mul16.i.iter72, %xor11.i.iter72, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %870 = and i8 %xor1.i.iter72, 8, !dbg !185
  %mul23.i.iter72 = mul i8 %870, %865, !dbg !186
  %xor25.i.iter72 = xor i8 %mul23.i.iter72, %xor18.i.iter72, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %871 = lshr i8 %xor25.i.iter72, 4, !dbg !189
  %872 = lshr i8 %xor25.i.iter72, 3, !dbg !190
  %873 = and i8 %872, 14, !dbg !190
  %874 = xor i8 %871, %873, !dbg !191
  %xor25.masked.i.iter72 = and i8 %xor25.i.iter72, 15, !dbg !192
  %875 = xor i8 %874, %xor25.masked.i.iter72, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter72 = xor i8 %875, %ret.0.i1.iter72, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter72 = add nuw nsw i32 %i.0.i3.iter72, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter72 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter72, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter72 = icmp eq i32 %inc.i.iter72, 8, !dbg !202
  br i1 %exitcond.i.not.iter72, label %lincomb.exit.iter72, label %for.body.i.iter72, !dbg !203, !llvm.loop !204

lincomb.exit.iter72:                              ; preds = %for.body.i.iter72
  %ret.0.i.lcssa.iter72 = phi i8 [ %xor1.i.i.iter72, %for.body.i.iter72 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter72, ptr %c.addr.1.lcssa.iter71, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter72 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter71, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter72, !dbg !150

for.cond.i.preheader.iter72:                      ; preds = %for.cond1.preheader.iter72
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter72, !dbg !203

iter_72_end:                                      ; preds = %for.inc4.iter72
  br label %iter_73_start

iter_73_start:                                    ; preds = %iter_72_end
  br label %for.cond1.preheader.iter73

for.cond1.preheader.iter73:                       ; preds = %iter_73_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter73, !dbg !150

for.inc4.iter73:                                  ; preds = %lincomb.exit.iter73
  %c.addr.1.lcssa.iter73 = phi ptr [ %incdec.ptr.iter73, %lincomb.exit.iter73 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter73 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter72, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_73_end

for.body.i.iter73:                                ; preds = %for.cond.i.preheader.iter73, %for.body.i.iter73
  %i.0.i3.iter73 = phi i32 [ 0, %for.cond.i.preheader.iter73 ], [ %inc.i.iter73, %for.body.i.iter73 ]
  %b.addr.0.i2.iter73 = phi ptr [ %b, %for.cond.i.preheader.iter73 ], [ %add.ptr.i.iter73, %for.body.i.iter73 ]
  %ret.0.i1.iter73 = phi i8 [ 0, %for.cond.i.preheader.iter73 ], [ %xor1.i.i.iter73, %for.body.i.iter73 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter73 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter72, i32 %i.0.i3.iter73, !dbg !164
  %876 = load i8, ptr %arrayidx.i.iter73, align 1, !dbg !164
  %877 = load i8, ptr %b.addr.0.i2.iter73, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %878 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter73 = xor i8 %876, %878, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %879 = trunc i8 %xor1.i.iter73 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %880 = and i8 %xor1.i.iter73, 2, !dbg !179
  %mul9.i.iter73 = mul i8 %880, %877, !dbg !180
  %conv10.i.iter73 = select i1 %879, i8 %877, i8 0, !dbg !177
  %xor11.i.iter73 = xor i8 %conv10.i.iter73, %mul9.i.iter73, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %881 = and i8 %xor1.i.iter73, 4, !dbg !182
  %mul16.i.iter73 = mul i8 %881, %877, !dbg !183
  %xor18.i.iter73 = xor i8 %mul16.i.iter73, %xor11.i.iter73, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %882 = and i8 %xor1.i.iter73, 8, !dbg !185
  %mul23.i.iter73 = mul i8 %882, %877, !dbg !186
  %xor25.i.iter73 = xor i8 %mul23.i.iter73, %xor18.i.iter73, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %883 = lshr i8 %xor25.i.iter73, 4, !dbg !189
  %884 = lshr i8 %xor25.i.iter73, 3, !dbg !190
  %885 = and i8 %884, 14, !dbg !190
  %886 = xor i8 %883, %885, !dbg !191
  %xor25.masked.i.iter73 = and i8 %xor25.i.iter73, 15, !dbg !192
  %887 = xor i8 %886, %xor25.masked.i.iter73, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter73 = xor i8 %887, %ret.0.i1.iter73, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter73 = add nuw nsw i32 %i.0.i3.iter73, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter73 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter73, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter73 = icmp eq i32 %inc.i.iter73, 8, !dbg !202
  br i1 %exitcond.i.not.iter73, label %lincomb.exit.iter73, label %for.body.i.iter73, !dbg !203, !llvm.loop !204

lincomb.exit.iter73:                              ; preds = %for.body.i.iter73
  %ret.0.i.lcssa.iter73 = phi i8 [ %xor1.i.i.iter73, %for.body.i.iter73 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter73, ptr %c.addr.1.lcssa.iter72, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter73 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter72, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter73, !dbg !150

for.cond.i.preheader.iter73:                      ; preds = %for.cond1.preheader.iter73
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter73, !dbg !203

iter_73_end:                                      ; preds = %for.inc4.iter73
  br label %iter_74_start

iter_74_start:                                    ; preds = %iter_73_end
  br label %for.cond1.preheader.iter74

for.cond1.preheader.iter74:                       ; preds = %iter_74_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter74, !dbg !150

for.inc4.iter74:                                  ; preds = %lincomb.exit.iter74
  %c.addr.1.lcssa.iter74 = phi ptr [ %incdec.ptr.iter74, %lincomb.exit.iter74 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter74 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter73, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_74_end

for.body.i.iter74:                                ; preds = %for.cond.i.preheader.iter74, %for.body.i.iter74
  %i.0.i3.iter74 = phi i32 [ 0, %for.cond.i.preheader.iter74 ], [ %inc.i.iter74, %for.body.i.iter74 ]
  %b.addr.0.i2.iter74 = phi ptr [ %b, %for.cond.i.preheader.iter74 ], [ %add.ptr.i.iter74, %for.body.i.iter74 ]
  %ret.0.i1.iter74 = phi i8 [ 0, %for.cond.i.preheader.iter74 ], [ %xor1.i.i.iter74, %for.body.i.iter74 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter74 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter73, i32 %i.0.i3.iter74, !dbg !164
  %888 = load i8, ptr %arrayidx.i.iter74, align 1, !dbg !164
  %889 = load i8, ptr %b.addr.0.i2.iter74, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %890 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter74 = xor i8 %888, %890, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %891 = trunc i8 %xor1.i.iter74 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %892 = and i8 %xor1.i.iter74, 2, !dbg !179
  %mul9.i.iter74 = mul i8 %892, %889, !dbg !180
  %conv10.i.iter74 = select i1 %891, i8 %889, i8 0, !dbg !177
  %xor11.i.iter74 = xor i8 %conv10.i.iter74, %mul9.i.iter74, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %893 = and i8 %xor1.i.iter74, 4, !dbg !182
  %mul16.i.iter74 = mul i8 %893, %889, !dbg !183
  %xor18.i.iter74 = xor i8 %mul16.i.iter74, %xor11.i.iter74, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %894 = and i8 %xor1.i.iter74, 8, !dbg !185
  %mul23.i.iter74 = mul i8 %894, %889, !dbg !186
  %xor25.i.iter74 = xor i8 %mul23.i.iter74, %xor18.i.iter74, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %895 = lshr i8 %xor25.i.iter74, 4, !dbg !189
  %896 = lshr i8 %xor25.i.iter74, 3, !dbg !190
  %897 = and i8 %896, 14, !dbg !190
  %898 = xor i8 %895, %897, !dbg !191
  %xor25.masked.i.iter74 = and i8 %xor25.i.iter74, 15, !dbg !192
  %899 = xor i8 %898, %xor25.masked.i.iter74, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter74 = xor i8 %899, %ret.0.i1.iter74, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter74 = add nuw nsw i32 %i.0.i3.iter74, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter74 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter74, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter74 = icmp eq i32 %inc.i.iter74, 8, !dbg !202
  br i1 %exitcond.i.not.iter74, label %lincomb.exit.iter74, label %for.body.i.iter74, !dbg !203, !llvm.loop !204

lincomb.exit.iter74:                              ; preds = %for.body.i.iter74
  %ret.0.i.lcssa.iter74 = phi i8 [ %xor1.i.i.iter74, %for.body.i.iter74 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter74, ptr %c.addr.1.lcssa.iter73, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter74 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter73, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter74, !dbg !150

for.cond.i.preheader.iter74:                      ; preds = %for.cond1.preheader.iter74
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter74, !dbg !203

iter_74_end:                                      ; preds = %for.inc4.iter74
  br label %iter_75_start

iter_75_start:                                    ; preds = %iter_74_end
  br label %for.cond1.preheader.iter75

for.cond1.preheader.iter75:                       ; preds = %iter_75_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter75, !dbg !150

for.inc4.iter75:                                  ; preds = %lincomb.exit.iter75
  %c.addr.1.lcssa.iter75 = phi ptr [ %incdec.ptr.iter75, %lincomb.exit.iter75 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter75 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter74, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_75_end

for.body.i.iter75:                                ; preds = %for.cond.i.preheader.iter75, %for.body.i.iter75
  %i.0.i3.iter75 = phi i32 [ 0, %for.cond.i.preheader.iter75 ], [ %inc.i.iter75, %for.body.i.iter75 ]
  %b.addr.0.i2.iter75 = phi ptr [ %b, %for.cond.i.preheader.iter75 ], [ %add.ptr.i.iter75, %for.body.i.iter75 ]
  %ret.0.i1.iter75 = phi i8 [ 0, %for.cond.i.preheader.iter75 ], [ %xor1.i.i.iter75, %for.body.i.iter75 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter75 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter74, i32 %i.0.i3.iter75, !dbg !164
  %900 = load i8, ptr %arrayidx.i.iter75, align 1, !dbg !164
  %901 = load i8, ptr %b.addr.0.i2.iter75, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %902 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter75 = xor i8 %900, %902, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %903 = trunc i8 %xor1.i.iter75 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %904 = and i8 %xor1.i.iter75, 2, !dbg !179
  %mul9.i.iter75 = mul i8 %904, %901, !dbg !180
  %conv10.i.iter75 = select i1 %903, i8 %901, i8 0, !dbg !177
  %xor11.i.iter75 = xor i8 %conv10.i.iter75, %mul9.i.iter75, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %905 = and i8 %xor1.i.iter75, 4, !dbg !182
  %mul16.i.iter75 = mul i8 %905, %901, !dbg !183
  %xor18.i.iter75 = xor i8 %mul16.i.iter75, %xor11.i.iter75, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %906 = and i8 %xor1.i.iter75, 8, !dbg !185
  %mul23.i.iter75 = mul i8 %906, %901, !dbg !186
  %xor25.i.iter75 = xor i8 %mul23.i.iter75, %xor18.i.iter75, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %907 = lshr i8 %xor25.i.iter75, 4, !dbg !189
  %908 = lshr i8 %xor25.i.iter75, 3, !dbg !190
  %909 = and i8 %908, 14, !dbg !190
  %910 = xor i8 %907, %909, !dbg !191
  %xor25.masked.i.iter75 = and i8 %xor25.i.iter75, 15, !dbg !192
  %911 = xor i8 %910, %xor25.masked.i.iter75, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter75 = xor i8 %911, %ret.0.i1.iter75, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter75 = add nuw nsw i32 %i.0.i3.iter75, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter75 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter75, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter75 = icmp eq i32 %inc.i.iter75, 8, !dbg !202
  br i1 %exitcond.i.not.iter75, label %lincomb.exit.iter75, label %for.body.i.iter75, !dbg !203, !llvm.loop !204

lincomb.exit.iter75:                              ; preds = %for.body.i.iter75
  %ret.0.i.lcssa.iter75 = phi i8 [ %xor1.i.i.iter75, %for.body.i.iter75 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter75, ptr %c.addr.1.lcssa.iter74, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter75 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter74, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter75, !dbg !150

for.cond.i.preheader.iter75:                      ; preds = %for.cond1.preheader.iter75
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter75, !dbg !203

iter_75_end:                                      ; preds = %for.inc4.iter75
  br label %iter_76_start

iter_76_start:                                    ; preds = %iter_75_end
  br label %for.cond1.preheader.iter76

for.cond1.preheader.iter76:                       ; preds = %iter_76_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter76, !dbg !150

for.inc4.iter76:                                  ; preds = %lincomb.exit.iter76
  %c.addr.1.lcssa.iter76 = phi ptr [ %incdec.ptr.iter76, %lincomb.exit.iter76 ]
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
  %add.ptr6.iter76 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter75, i32 8, !dbg !151
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_76_end

for.body.i.iter76:                                ; preds = %for.cond.i.preheader.iter76, %for.body.i.iter76
  %i.0.i3.iter76 = phi i32 [ 0, %for.cond.i.preheader.iter76 ], [ %inc.i.iter76, %for.body.i.iter76 ]
  %b.addr.0.i2.iter76 = phi ptr [ %b, %for.cond.i.preheader.iter76 ], [ %add.ptr.i.iter76, %for.body.i.iter76 ]
  %ret.0.i1.iter76 = phi i8 [ 0, %for.cond.i.preheader.iter76 ], [ %xor1.i.i.iter76, %for.body.i.iter76 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter76 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter75, i32 %i.0.i3.iter76, !dbg !164
  %912 = load i8, ptr %arrayidx.i.iter76, align 1, !dbg !164
  %913 = load i8, ptr %b.addr.0.i2.iter76, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %914 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter76 = xor i8 %912, %914, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %915 = trunc i8 %xor1.i.iter76 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %916 = and i8 %xor1.i.iter76, 2, !dbg !179
  %mul9.i.iter76 = mul i8 %916, %913, !dbg !180
  %conv10.i.iter76 = select i1 %915, i8 %913, i8 0, !dbg !177
  %xor11.i.iter76 = xor i8 %conv10.i.iter76, %mul9.i.iter76, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %917 = and i8 %xor1.i.iter76, 4, !dbg !182
  %mul16.i.iter76 = mul i8 %917, %913, !dbg !183
  %xor18.i.iter76 = xor i8 %mul16.i.iter76, %xor11.i.iter76, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %918 = and i8 %xor1.i.iter76, 8, !dbg !185
  %mul23.i.iter76 = mul i8 %918, %913, !dbg !186
  %xor25.i.iter76 = xor i8 %mul23.i.iter76, %xor18.i.iter76, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %919 = lshr i8 %xor25.i.iter76, 4, !dbg !189
  %920 = lshr i8 %xor25.i.iter76, 3, !dbg !190
  %921 = and i8 %920, 14, !dbg !190
  %922 = xor i8 %919, %921, !dbg !191
  %xor25.masked.i.iter76 = and i8 %xor25.i.iter76, 15, !dbg !192
  %923 = xor i8 %922, %xor25.masked.i.iter76, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter76 = xor i8 %923, %ret.0.i1.iter76, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter76 = add nuw nsw i32 %i.0.i3.iter76, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter76 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter76, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter76 = icmp eq i32 %inc.i.iter76, 8, !dbg !202
  br i1 %exitcond.i.not.iter76, label %lincomb.exit.iter76, label %for.body.i.iter76, !dbg !203, !llvm.loop !204

lincomb.exit.iter76:                              ; preds = %for.body.i.iter76
  %ret.0.i.lcssa.iter76 = phi i8 [ %xor1.i.i.iter76, %for.body.i.iter76 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter76, ptr %c.addr.1.lcssa.iter75, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
  %incdec.ptr.iter76 = getelementptr inbounds nuw i8, ptr %c.addr.1.lcssa.iter75, i32 1, !dbg !208
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter76, !dbg !150

for.cond.i.preheader.iter76:                      ; preds = %for.cond1.preheader.iter76
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter76, !dbg !203

iter_76_end:                                      ; preds = %for.inc4.iter76
  br label %iter_77_start

iter_77_start:                                    ; preds = %iter_76_end
  br label %for.cond1.preheader.iter77

for.cond1.preheader.iter77:                       ; preds = %iter_77_start
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.cond.i.preheader.iter77, !dbg !150

for.inc4.iter77:                                  ; preds = %lincomb.exit.iter77
    #dbg_value(i32 undef, !141, !DIExpression(), !143)
    #dbg_value(ptr undef, !134, !DIExpression(), !135)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %iter_77_end

for.body.i.iter77:                                ; preds = %for.cond.i.preheader.iter77, %for.body.i.iter77
  %i.0.i3.iter77 = phi i32 [ 0, %for.cond.i.preheader.iter77 ], [ %inc.i.iter77, %for.body.i.iter77 ]
  %b.addr.0.i2.iter77 = phi ptr [ %b, %for.cond.i.preheader.iter77 ], [ %add.ptr.i.iter77, %for.body.i.iter77 ]
  %ret.0.i1.iter77 = phi i8 [ 0, %for.cond.i.preheader.iter77 ], [ %xor1.i.i.iter77, %for.body.i.iter77 ]
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %arrayidx.i.iter77 = getelementptr inbounds nuw i8, ptr %add.ptr6.iter76, i32 %i.0.i3.iter77, !dbg !164
  %924 = load i8, ptr %arrayidx.i.iter77, align 1, !dbg !164
  %925 = load i8, ptr %b.addr.0.i2.iter77, align 1, !dbg !167
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
    #dbg_value(i8 undef, !174, !DIExpression(), !172)
  %926 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !175
  %xor1.i.iter77 = xor i8 %924, %926, !dbg !176
    #dbg_value(i8 undef, !168, !DIExpression(), !172)
  %927 = trunc i8 %xor1.i.iter77 to i1, !dbg !177
    #dbg_value(i8 poison, !178, !DIExpression(), !172)
  %928 = and i8 %xor1.i.iter77, 2, !dbg !179
  %mul9.i.iter77 = mul i8 %928, %925, !dbg !180
  %conv10.i.iter77 = select i1 %927, i8 %925, i8 0, !dbg !177
  %xor11.i.iter77 = xor i8 %conv10.i.iter77, %mul9.i.iter77, !dbg !181
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %929 = and i8 %xor1.i.iter77, 4, !dbg !182
  %mul16.i.iter77 = mul i8 %929, %925, !dbg !183
  %xor18.i.iter77 = xor i8 %mul16.i.iter77, %xor11.i.iter77, !dbg !184
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
  %930 = and i8 %xor1.i.iter77, 8, !dbg !185
  %mul23.i.iter77 = mul i8 %930, %925, !dbg !186
  %xor25.i.iter77 = xor i8 %mul23.i.iter77, %xor18.i.iter77, !dbg !187
    #dbg_value(i8 undef, !178, !DIExpression(), !172)
    #dbg_value(i8 undef, !188, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !172)
  %931 = lshr i8 %xor25.i.iter77, 4, !dbg !189
  %932 = lshr i8 %xor25.i.iter77, 3, !dbg !190
  %933 = and i8 %932, 14, !dbg !190
  %934 = xor i8 %931, %933, !dbg !191
  %xor25.masked.i.iter77 = and i8 %xor25.i.iter77, 15, !dbg !192
  %935 = xor i8 %934, %xor25.masked.i.iter77, !dbg !192
    #dbg_value(i8 undef, !193, !DIExpression(), !172)
    #dbg_value(i8 undef, !194, !DIExpression(), !196)
    #dbg_value(i8 undef, !198, !DIExpression(), !196)
  %xor1.i.i.iter77 = xor i8 %935, %ret.0.i1.iter77, !dbg !199
    #dbg_value(i8 undef, !163, !DIExpression(), !162)
  %inc.i.iter77 = add nuw nsw i32 %i.0.i3.iter77, 1, !dbg !200
    #dbg_value(i32 undef, !152, !DIExpression(), !157)
  %add.ptr.i.iter77 = getelementptr inbounds nuw i8, ptr %b.addr.0.i2.iter77, i32 1, !dbg !201
    #dbg_value(ptr undef, !161, !DIExpression(), !162)
  %exitcond.i.not.iter77 = icmp eq i32 %inc.i.iter77, 8, !dbg !202
  br i1 %exitcond.i.not.iter77, label %lincomb.exit.iter77, label %for.body.i.iter77, !dbg !203, !llvm.loop !204

lincomb.exit.iter77:                              ; preds = %for.body.i.iter77
  %ret.0.i.lcssa.iter77 = phi i8 [ %xor1.i.i.iter77, %for.body.i.iter77 ], !dbg !162
  store i8 %ret.0.i.lcssa.iter77, ptr %c.addr.1.lcssa.iter76, align 1, !dbg !207
    #dbg_value(i32 1, !145, !DIExpression(), !149)
    #dbg_value(i32 poison, !145, !DIExpression(), !149)
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
  br label %for.inc4.iter77, !dbg !150

for.cond.i.preheader.iter77:                      ; preds = %for.cond1.preheader.iter77
    #dbg_value(ptr undef, !137, !DIExpression(), !135)
    #dbg_value(i32 0, !152, !DIExpression(), !157)
    #dbg_value(ptr %b, !161, !DIExpression(), !162)
    #dbg_value(i8 0, !163, !DIExpression(), !162)
  br label %for.body.i.iter77, !dbg !203

iter_77_end:                                      ; preds = %for.inc4.iter77
  br label %for.end7
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #1 {
entry:
  %sk = alloca [18603 x i64], align 16, !llvmbmc.var !209
  call void @mayo_memset(ptr %sk, i8 0, i32 148824)
  %x = alloca [860 x i8], align 16, !llvmbmc.var !210
  call void @mayo_memset(ptr %x, i8 0, i32 860)
  store i8 11, ptr %x, align 1
  %Ox = alloca [78 x i8], align 16, !llvmbmc.var !211
  call void @mayo_memset(ptr %Ox, i8 0, i32 78)
  call fastcc void @mat_mul(ptr %sk, ptr %x, ptr %Ox, i32 81, i32 78, i32 1)
  %out_actual_i8 = load i8, ptr %Ox, align 1
  %out_cmp = icmp eq i8 %out_actual_i8, 0
  call void @_Z6assertb(i1 noundef zeroext %out_cmp)
  ret i32 0
}

declare void @_Z6assertb(i1 noundef zeroext) local_unnamed_addr

; Function Attrs: nounwind
define dso_local void @mayo_memset(ptr noundef %dst, i8 noundef zeroext %val, i32 noundef %len) local_unnamed_addr #2 !dbg !212 {
entry:
    #dbg_value(ptr %dst, !216, !DIExpression(), !217)
    #dbg_value(i8 %val, !218, !DIExpression(), !217)
    #dbg_value(i32 %len, !219, !DIExpression(), !217)
    #dbg_value(ptr %dst, !220, !DIExpression(), !217)
    #dbg_value(i32 0, !221, !DIExpression(), !223)
  br label %for.cond, !dbg !224

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !225
    #dbg_value(i32 %i.0, !221, !DIExpression(), !223)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !226
  br i1 %exitcond, label %for.body, label %for.end, !dbg !228

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !229
  store i8 %val, ptr %arrayidx, align 1, !dbg !230
  %inc = add i32 %i.0, 1, !dbg !231
    #dbg_value(i32 %inc, !221, !DIExpression(), !223)
  br label %for.cond, !dbg !232, !llvm.loop !233

for.end:                                          ; preds = %for.cond
  ret void, !dbg !235
}

; Function Attrs: nounwind
define dso_local void @mayo_memcpy(ptr noundef %dst, ptr noundef %src, i32 noundef %len) local_unnamed_addr #2 !dbg !236 {
entry:
    #dbg_value(ptr %dst, !241, !DIExpression(), !242)
    #dbg_value(ptr %src, !243, !DIExpression(), !242)
    #dbg_value(i32 %len, !244, !DIExpression(), !242)
    #dbg_value(ptr %dst, !245, !DIExpression(), !242)
    #dbg_value(ptr %src, !246, !DIExpression(), !242)
    #dbg_value(i32 0, !249, !DIExpression(), !251)
  br label %for.cond, !dbg !252

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !253
    #dbg_value(i32 %i.0, !249, !DIExpression(), !251)
  %exitcond = icmp ne i32 %i.0, %len, !dbg !254
  br i1 %exitcond, label %for.body, label %for.end, !dbg !256

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %src, i32 %i.0, !dbg !257
  %0 = load i8, ptr %arrayidx, align 1, !dbg !257
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %dst, i32 %i.0, !dbg !258
  store i8 %0, ptr %arrayidx1, align 1, !dbg !259
  %inc = add i32 %i.0, 1, !dbg !260
    #dbg_value(i32 %inc, !249, !DIExpression(), !251)
  br label %for.cond, !dbg !261, !llvm.loop !262

for.end:                                          ; preds = %for.cond
  ret void, !dbg !264
}

attributes #0 = { inlinehint nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+thumb-mode,+vfp2sp,+vfp3d16sp,+vfp4d16sp" }
attributes #1 = { inlinehint }
attributes #2 = { nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+thumb-mode,+vfp2sp,+vfp3d16sp,+vfp4d16sp" }

!llvm.dbg.cu = !{!35, !37, !38, !2, !67, !78, !87, !105, !123, !124}
!llvm.ident = !{!125, !125, !125, !125, !125, !125, !125, !125}
!llvm.module.flags = !{!126, !127, !128, !129}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "pqmayo_MAYO_1_ref_unsigned_char_blocker", scope: !2, file: !29, line: 128, type: !34, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !26, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "../../../src/<stdin>", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!4 = !{!5, !10, !11, !14, !16, !19, !21, !24}
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !6, line: 60, baseType: !7)
!6 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/sys/_stdint.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !8, line: 105, baseType: !9)
!8 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/machine/_default_types.h", directory: "")
!9 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 56, baseType: !12)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !8, line: 103, baseType: !13)
!13 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 32)
!15 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!16 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !6, line: 48, baseType: !17)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !8, line: 79, baseType: !18)
!18 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 32)
!20 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !15)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !6, line: 20, baseType: !22)
!22 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !8, line: 41, baseType: !23)
!23 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!24 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !6, line: 44, baseType: !25)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !8, line: 77, baseType: !10)
!26 = !{!27, !31, !0}
!27 = !DIGlobalVariableExpression(var: !28, expr: !DIExpression())
!28 = distinct !DIGlobalVariable(name: "pqmayo_MAYO_1_ref_uint32_t_blocker", scope: !2, file: !29, line: 126, type: !30, isLocal: false, isDefinition: true)
!29 = !DIFile(filename: "../../../src/arithmetic.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!30 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !16)
!31 = !DIGlobalVariableExpression(var: !32, expr: !DIExpression())
!32 = distinct !DIGlobalVariable(name: "pqmayo_MAYO_1_ref_uint64_t_blocker", scope: !2, file: !29, line: 127, type: !33, isLocal: false, isDefinition: true)
!33 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !5)
!34 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !15)
!35 = distinct !DICompileUnit(language: DW_LANG_C11, file: !36, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!36 = !DIFile(filename: "../<stdin>", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!37 = distinct !DICompileUnit(language: DW_LANG_C11, file: !36, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!38 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !39, globals: !46, splitDebugInlining: false, nameTableKind: None)
!39 = !{!40, !41, !15, !44, !14, !16}
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 32)
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !42, size: 32)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !6, line: 24, baseType: !43)
!43 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !8, line: 43, baseType: !15)
!44 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !45, line: 214, baseType: !18)
!45 = !DIFile(filename: "/usr/lib/gcc/arm-none-eabi/13.2.1/include/stddef.h", directory: "")
!46 = !{!47, !53, !61, !63, !65}
!47 = !DIGlobalVariableExpression(var: !48, expr: !DIExpression())
!48 = distinct !DIGlobalVariable(name: "f_tail", scope: !38, file: !49, line: 247, type: !50, isLocal: true, isDefinition: true)
!49 = !DIFile(filename: "../../../include/mayo.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 32, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 4)
!53 = !DIGlobalVariableExpression(var: !54, expr: !DIExpression())
!54 = distinct !DIGlobalVariable(name: "even_nibbles", scope: !55, file: !56, line: 118, type: !60, isLocal: true, isDefinition: true)
!55 = distinct !DISubprogram(name: "transpose_16x16_nibbles", scope: !56, file: !56, line: 117, type: !57, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !38, retainedNodes: !59)
!56 = !DIFile(filename: "../../../src/mayo.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!57 = !DISubroutineType(types: !58)
!58 = !{null, !40}
!59 = !{}
!60 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !5)
!61 = !DIGlobalVariableExpression(var: !62, expr: !DIExpression())
!62 = distinct !DIGlobalVariable(name: "even_bytes", scope: !55, file: !56, line: 119, type: !60, isLocal: true, isDefinition: true)
!63 = !DIGlobalVariableExpression(var: !64, expr: !DIExpression())
!64 = distinct !DIGlobalVariable(name: "even_2bytes", scope: !55, file: !56, line: 120, type: !60, isLocal: true, isDefinition: true)
!65 = !DIGlobalVariableExpression(var: !66, expr: !DIExpression())
!66 = distinct !DIGlobalVariable(name: "even_half", scope: !55, file: !56, line: 121, type: !60, isLocal: true, isDefinition: true)
!67 = distinct !DICompileUnit(language: DW_LANG_C11, file: !68, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !69, globals: !71, splitDebugInlining: false, nameTableKind: None)
!68 = !DIFile(filename: "../../../src/common/<stdin>", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!69 = !{!70, !16, !5, !44, !42}
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 32)
!71 = !{!72}
!72 = !DIGlobalVariableExpression(var: !73, expr: !DIExpression())
!73 = distinct !DIGlobalVariable(name: "KeccakF_RoundConstants", scope: !67, file: !74, line: 214, type: !75, isLocal: true, isDefinition: true)
!74 = !DIFile(filename: "../../../src/common/fips202.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!75 = !DICompositeType(tag: DW_TAG_array_type, baseType: !60, size: 1536, elements: !76)
!76 = !{!77}
!77 = !DISubrange(count: 24)
!78 = distinct !DICompileUnit(language: DW_LANG_C11, file: !68, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !79, globals: !80, splitDebugInlining: false, nameTableKind: None)
!79 = !{!70, !10, !5, !16, !15}
!80 = !{!81}
!81 = !DIGlobalVariableExpression(var: !82, expr: !DIExpression())
!82 = distinct !DIGlobalVariable(name: "Rcon", scope: !78, file: !83, line: 388, type: !84, isLocal: true, isDefinition: true)
!83 = !DIFile(filename: "../../../src/common/aes_c.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!84 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 80, elements: !85)
!85 = !{!86}
!86 = !DISubrange(count: 10)
!87 = distinct !DICompileUnit(language: DW_LANG_C11, file: !68, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !88, splitDebugInlining: false, nameTableKind: None)
!88 = !{!89, !100}
!89 = !DIGlobalVariableExpression(var: !90, expr: !DIExpression())
!90 = distinct !DIGlobalVariable(name: "memset_func", scope: !91, file: !92, line: 10, type: !95, isLocal: true, isDefinition: true)
!91 = distinct !DISubprogram(name: "mayo_secure_free", scope: !92, file: !92, line: 7, type: !93, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !87, retainedNodes: !59)
!92 = !DIFile(filename: "../../../src/common/mem.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!93 = !DISubroutineType(types: !94)
!94 = !{null, !70, !44}
!95 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !96)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "memset_t", scope: !91, file: !92, line: 9, baseType: !97)
!97 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !98, size: 32)
!98 = !DISubroutineType(types: !99)
!99 = !{!70, !70, !10, !44}
!100 = !DIGlobalVariableExpression(var: !101, expr: !DIExpression())
!101 = distinct !DIGlobalVariable(name: "memset_func", scope: !102, file: !92, line: 17, type: !103, isLocal: true, isDefinition: true)
!102 = distinct !DISubprogram(name: "mayo_secure_clear", scope: !92, file: !92, line: 15, type: !93, scopeLine: 15, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !87, retainedNodes: !59)
!103 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !104)
!104 = !DIDerivedType(tag: DW_TAG_typedef, name: "memset_t", scope: !102, file: !92, line: 16, baseType: !97)
!105 = distinct !DICompileUnit(language: DW_LANG_C11, file: !68, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !106, globals: !107, splitDebugInlining: false, nameTableKind: None)
!106 = !{!70}
!107 = !{!108}
!108 = !DIGlobalVariableExpression(var: !109, expr: !DIExpression())
!109 = distinct !DIGlobalVariable(name: "DRBG_ctx", scope: !105, file: !110, line: 48, type: !111, isLocal: false, isDefinition: true)
!110 = !DIFile(filename: "../../../src/common/randombytes_ctrdrbg.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!111 = !DIDerivedType(tag: DW_TAG_typedef, name: "AES256_CTR_DRBG_struct", file: !110, line: 40, baseType: !112)
!112 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !110, line: 36, size: 416, elements: !113)
!113 = !{!114, !118, !122}
!114 = !DIDerivedType(tag: DW_TAG_member, name: "Key", scope: !112, file: !110, line: 37, baseType: !115, size: 256)
!115 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 256, elements: !116)
!116 = !{!117}
!117 = !DISubrange(count: 32)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "V", scope: !112, file: !110, line: 38, baseType: !119, size: 128, offset: 256)
!119 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 128, elements: !120)
!120 = !{!121}
!121 = !DISubrange(count: 16)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "reseed_counter", scope: !112, file: !110, line: 39, baseType: !10, size: 32, offset: 384)
!123 = distinct !DICompileUnit(language: DW_LANG_C11, file: !36, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!124 = distinct !DICompileUnit(language: DW_LANG_C11, file: !36, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!125 = !{!"Ubuntu clang version 20.1.2 (0ubuntu1~24.04.3)"}
!126 = !{i32 2, !"Debug Info Version", i32 3}
!127 = !{i32 1, !"wchar_size", i32 4}
!128 = !{i32 1, !"min_enum_size", i32 4}
!129 = !{i32 1, !"Code Model", i32 1}
!130 = distinct !DISubprogram(name: "mat_mul", scope: !131, file: !131, line: 82, type: !132, scopeLine: 83, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !38, retainedNodes: !59)
!131 = !DIFile(filename: "../../../src/simple_arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!132 = !DISubroutineType(types: !133)
!133 = !{null, !19, !19, !14, !10, !10, !10}
!134 = !DILocalVariable(name: "a", arg: 1, scope: !130, file: !131, line: 82, type: !19)
!135 = !DILocation(line: 0, scope: !130)
!136 = !DILocalVariable(name: "b", arg: 2, scope: !130, file: !131, line: 82, type: !19)
!137 = !DILocalVariable(name: "c", arg: 3, scope: !130, file: !131, line: 83, type: !14)
!138 = !DILocalVariable(name: "colrow_ab", arg: 4, scope: !130, file: !131, line: 83, type: !10)
!139 = !DILocalVariable(name: "row_a", arg: 5, scope: !130, file: !131, line: 83, type: !10)
!140 = !DILocalVariable(name: "col_b", arg: 6, scope: !130, file: !131, line: 83, type: !10)
!141 = !DILocalVariable(name: "i", scope: !142, file: !131, line: 84, type: !10)
!142 = distinct !DILexicalBlock(scope: !130, file: !131, line: 84, column: 5)
!143 = !DILocation(line: 0, scope: !142)
!144 = !DILocation(line: 91, column: 1, scope: !130)
!145 = !DILocalVariable(name: "j", scope: !146, file: !131, line: 85, type: !10)
!146 = distinct !DILexicalBlock(scope: !147, file: !131, line: 85, column: 9)
!147 = distinct !DILexicalBlock(scope: !148, file: !131, line: 84, column: 53)
!148 = distinct !DILexicalBlock(scope: !142, file: !131, line: 84, column: 5)
!149 = !DILocation(line: 0, scope: !146)
!150 = !DILocation(line: 85, column: 9, scope: !146)
!151 = !DILocation(line: 84, column: 39, scope: !148)
!152 = !DILocalVariable(name: "i", scope: !153, file: !131, line: 74, type: !10)
!153 = distinct !DILexicalBlock(scope: !154, file: !131, line: 74, column: 5)
!154 = distinct !DISubprogram(name: "lincomb", scope: !131, file: !131, line: 71, type: !155, scopeLine: 72, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !38, retainedNodes: !59)
!155 = !DISubroutineType(types: !156)
!156 = !{!15, !19, !19, !10, !10}
!157 = !DILocation(line: 0, scope: !153, inlinedAt: !158)
!158 = distinct !DILocation(line: 86, column: 18, scope: !159)
!159 = distinct !DILexicalBlock(scope: !160, file: !131, line: 85, column: 46)
!160 = distinct !DILexicalBlock(scope: !146, file: !131, line: 85, column: 9)
!161 = !DILocalVariable(name: "b", arg: 2, scope: !154, file: !131, line: 72, type: !19)
!162 = !DILocation(line: 0, scope: !154, inlinedAt: !158)
!163 = !DILocalVariable(name: "ret", scope: !154, file: !131, line: 73, type: !15)
!164 = !DILocation(line: 75, column: 27, scope: !165, inlinedAt: !158)
!165 = distinct !DILexicalBlock(scope: !166, file: !131, line: 74, column: 41)
!166 = distinct !DILexicalBlock(scope: !153, file: !131, line: 74, column: 5)
!167 = !DILocation(line: 75, column: 33, scope: !165, inlinedAt: !158)
!168 = !DILocalVariable(name: "a", arg: 1, scope: !169, file: !131, line: 10, type: !15)
!169 = distinct !DISubprogram(name: "mul_f", scope: !131, file: !131, line: 10, type: !170, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !38, retainedNodes: !59)
!170 = !DISubroutineType(types: !171)
!171 = !{!15, !15, !15}
!172 = !DILocation(line: 0, scope: !169, inlinedAt: !173)
!173 = distinct !DILocation(line: 75, column: 21, scope: !165, inlinedAt: !158)
!174 = !DILocalVariable(name: "b", arg: 2, scope: !169, file: !131, line: 10, type: !15)
!175 = !DILocation(line: 15, column: 10, scope: !169, inlinedAt: !173)
!176 = !DILocation(line: 15, column: 7, scope: !169, inlinedAt: !173)
!177 = !DILocation(line: 18, column: 17, scope: !169, inlinedAt: !173)
!178 = !DILocalVariable(name: "p", scope: !169, file: !131, line: 12, type: !15)
!179 = !DILocation(line: 19, column: 13, scope: !169, inlinedAt: !173)
!180 = !DILocation(line: 19, column: 17, scope: !169, inlinedAt: !173)
!181 = !DILocation(line: 19, column: 7, scope: !169, inlinedAt: !173)
!182 = !DILocation(line: 20, column: 13, scope: !169, inlinedAt: !173)
!183 = !DILocation(line: 20, column: 17, scope: !169, inlinedAt: !173)
!184 = !DILocation(line: 20, column: 7, scope: !169, inlinedAt: !173)
!185 = !DILocation(line: 21, column: 13, scope: !169, inlinedAt: !173)
!186 = !DILocation(line: 21, column: 17, scope: !169, inlinedAt: !173)
!187 = !DILocation(line: 21, column: 7, scope: !169, inlinedAt: !173)
!188 = !DILocalVariable(name: "top_p", scope: !169, file: !131, line: 24, type: !15)
!189 = !DILocation(line: 25, column: 37, scope: !169, inlinedAt: !173)
!190 = !DILocation(line: 25, column: 52, scope: !169, inlinedAt: !173)
!191 = !DILocation(line: 25, column: 43, scope: !169, inlinedAt: !173)
!192 = !DILocation(line: 25, column: 59, scope: !169, inlinedAt: !173)
!193 = !DILocalVariable(name: "out", scope: !169, file: !131, line: 25, type: !15)
!194 = !DILocalVariable(name: "a", arg: 1, scope: !195, file: !131, line: 44, type: !15)
!195 = distinct !DISubprogram(name: "add_f", scope: !131, file: !131, line: 44, type: !170, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !38, retainedNodes: !59)
!196 = !DILocation(line: 0, scope: !195, inlinedAt: !197)
!197 = distinct !DILocation(line: 75, column: 15, scope: !165, inlinedAt: !158)
!198 = !DILocalVariable(name: "b", arg: 2, scope: !195, file: !131, line: 44, type: !15)
!199 = !DILocation(line: 45, column: 14, scope: !195, inlinedAt: !197)
!200 = !DILocation(line: 74, column: 28, scope: !166, inlinedAt: !158)
!201 = !DILocation(line: 74, column: 35, scope: !166, inlinedAt: !158)
!202 = !DILocation(line: 74, column: 23, scope: !166, inlinedAt: !158)
!203 = !DILocation(line: 74, column: 5, scope: !153, inlinedAt: !158)
!204 = distinct !{!204, !203, !205, !206}
!205 = !DILocation(line: 76, column: 5, scope: !153, inlinedAt: !158)
!206 = !{!"llvm.loop.mustprogress"}
!207 = !DILocation(line: 86, column: 16, scope: !159)
!208 = !DILocation(line: 85, column: 41, scope: !160)
!209 = !{!"sk"}
!210 = !{!"x"}
!211 = !{!"Ox"}
!212 = distinct !DISubprogram(name: "mayo_memset", scope: !213, file: !213, line: 3, type: !214, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !123, retainedNodes: !59)
!213 = !DIFile(filename: "../mem.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!214 = !DISubroutineType(types: !215)
!215 = !{null, !70, !42, !16}
!216 = !DILocalVariable(name: "dst", arg: 1, scope: !212, file: !213, line: 3, type: !70)
!217 = !DILocation(line: 0, scope: !212)
!218 = !DILocalVariable(name: "val", arg: 2, scope: !212, file: !213, line: 3, type: !42)
!219 = !DILocalVariable(name: "len", arg: 3, scope: !212, file: !213, line: 3, type: !16)
!220 = !DILocalVariable(name: "d", scope: !212, file: !213, line: 5, type: !41)
!221 = !DILocalVariable(name: "i", scope: !222, file: !213, line: 7, type: !16)
!222 = distinct !DILexicalBlock(scope: !212, file: !213, line: 7, column: 5)
!223 = !DILocation(line: 0, scope: !222)
!224 = !DILocation(line: 7, column: 10, scope: !222)
!225 = !DILocation(line: 7, scope: !222)
!226 = !DILocation(line: 7, column: 28, scope: !227)
!227 = distinct !DILexicalBlock(scope: !222, file: !213, line: 7, column: 5)
!228 = !DILocation(line: 7, column: 5, scope: !222)
!229 = !DILocation(line: 8, column: 9, scope: !227)
!230 = !DILocation(line: 8, column: 14, scope: !227)
!231 = !DILocation(line: 7, column: 36, scope: !227)
!232 = !DILocation(line: 7, column: 5, scope: !227)
!233 = distinct !{!233, !228, !234, !206}
!234 = !DILocation(line: 8, column: 16, scope: !222)
!235 = !DILocation(line: 9, column: 1, scope: !212)
!236 = distinct !DISubprogram(name: "mayo_memcpy", scope: !213, file: !213, line: 11, type: !237, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !124, retainedNodes: !59)
!237 = !DISubroutineType(types: !238)
!238 = !{null, !70, !239, !16}
!239 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !240, size: 32)
!240 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!241 = !DILocalVariable(name: "dst", arg: 1, scope: !236, file: !213, line: 11, type: !70)
!242 = !DILocation(line: 0, scope: !236)
!243 = !DILocalVariable(name: "src", arg: 2, scope: !236, file: !213, line: 11, type: !239)
!244 = !DILocalVariable(name: "len", arg: 3, scope: !236, file: !213, line: 11, type: !16)
!245 = !DILocalVariable(name: "d", scope: !236, file: !213, line: 13, type: !41)
!246 = !DILocalVariable(name: "s", scope: !236, file: !213, line: 14, type: !247)
!247 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !248, size: 32)
!248 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !42)
!249 = !DILocalVariable(name: "i", scope: !250, file: !213, line: 16, type: !16)
!250 = distinct !DILexicalBlock(scope: !236, file: !213, line: 16, column: 5)
!251 = !DILocation(line: 0, scope: !250)
!252 = !DILocation(line: 16, column: 10, scope: !250)
!253 = !DILocation(line: 16, scope: !250)
!254 = !DILocation(line: 16, column: 28, scope: !255)
!255 = distinct !DILexicalBlock(scope: !250, file: !213, line: 16, column: 5)
!256 = !DILocation(line: 16, column: 5, scope: !250)
!257 = !DILocation(line: 17, column: 16, scope: !255)
!258 = !DILocation(line: 17, column: 9, scope: !255)
!259 = !DILocation(line: 17, column: 14, scope: !255)
!260 = !DILocation(line: 16, column: 36, scope: !255)
!261 = !DILocation(line: 16, column: 5, scope: !255)
!262 = distinct !{!262, !256, !263, !206}
!263 = !DILocation(line: 17, column: 19, scope: !250)
!264 = !DILocation(line: 18, column: 1, scope: !236)
