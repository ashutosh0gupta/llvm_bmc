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
define dso_local fastcc void @compute_A(ptr noundef %p, ptr noundef nonnull %VtL, ptr noundef nonnull %A_out) unnamed_addr #0 {
entry:
  %A = alloca [800 x i64], align 8
  %tab = alloca [16 x i8], align 1
  br label %for.body.i

for.cond.preheader:                               ; preds = %for.body.i
  br label %for.body

for.body.i:                                       ; preds = %entry, %for.body.i
  %i.0.i48 = phi i32 [ 0, %entry ], [ %inc.i, %for.body.i ]
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %A, i32 %i.0.i48
  store i8 0, ptr %arrayidx.i, align 1
  %inc.i = add nuw nsw i32 %i.0.i48, 1
  %exitcond.i.not = icmp eq i32 %inc.i, 6400
  br i1 %exitcond.i.not, label %for.cond.preheader, label %for.body.i, !llvm.loop !7

for.cond3.preheader:                              ; preds = %for.body
  br label %for.cond6.preheader

for.body:                                         ; preds = %for.cond.preheader, %for.body
  %i.049 = phi i32 [ 0, %for.cond.preheader ], [ %inc, %for.body ]
  %.idx = mul nuw nsw i32 %i.049, 40
  %0 = getelementptr inbounds nuw i8, ptr %VtL, i32 %.idx
  %arrayidx = getelementptr inbounds nuw i8, ptr %0, i32 32
  %1 = load i64, ptr %arrayidx, align 8
  %and = and i64 %1, 72057594037927935
  store i64 %and, ptr %arrayidx, align 8
  %inc = add nuw nsw i32 %i.049, 1
  %exitcond.not = icmp eq i32 %inc, 80
  br i1 %exitcond.not, label %for.cond3.preheader, label %for.body, !llvm.loop !8

for.cond6.preheader:                              ; preds = %for.cond3.preheader, %for.inc103
  %bits_to_shift.061 = phi i32 [ 0, %for.cond3.preheader ], [ %split58, %for.inc103 ]
  %words_to_shift.060 = phi i32 [ 0, %for.cond3.preheader ], [ %split, %for.inc103 ]
  %i2.059 = phi i32 [ 0, %for.cond3.preheader ], [ %inc104, %for.inc103 ]
  br label %for.body8.lr.ph

for.body8.lr.ph:                                  ; preds = %for.cond6.preheader
  br label %for.body8

for.cond107.preheader:                            ; preds = %for.inc103
  br label %for.body110

for.body8:                                        ; preds = %for.body8.lr.ph, %if.end95
  %bits_to_shift.157 = phi i32 [ %bits_to_shift.061, %for.body8.lr.ph ], [ %spec.select3, %if.end95 ]
  %words_to_shift.156 = phi i32 [ %words_to_shift.060, %for.body8.lr.ph ], [ %spec.select, %if.end95 ]
  %j.055 = phi i32 [ 9, %for.body8.lr.ph ], [ %dec, %if.end95 ]
  %add.ptr.idx = mul nuw nsw i32 %j.055, 320
  %add.ptr = getelementptr inbounds nuw i8, ptr %VtL, i32 %add.ptr.idx
  br label %for.cond14.preheader

for.cond14.preheader:                             ; preds = %for.body8, %for.inc44
  %c.051 = phi i32 [ 0, %for.body8 ], [ %inc45, %for.inc44 ]
  br label %for.body16

for.body16:                                       ; preds = %for.cond14.preheader, %for.inc41
  %k.050 = phi i32 [ 0, %for.cond14.preheader ], [ %inc42, %for.inc41 ]
  %2 = getelementptr inbounds nuw i64, ptr %add.ptr, i32 %k.050
  %arrayidx19.idx = mul nuw nsw i32 %c.051, 40
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %2, i32 %arrayidx19.idx
  %3 = load i64, ptr %arrayidx19, align 8
  %sh_prom = zext nneg i32 %bits_to_shift.157 to i64
  %shl20 = shl i64 %3, %sh_prom
  %mul21 = shl nuw nsw i32 %i2.059, 3
  %add22 = or disjoint i32 %mul21, %c.051
  %add23 = add nsw i32 %k.050, %words_to_shift.156
  %mul24 = mul i32 %add23, 80
  %add25 = add i32 %add22, %mul24
  %arrayidx26 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add25
  %4 = load i64, ptr %arrayidx26, align 8
  %xor = xor i64 %4, %shl20
  store i64 %xor, ptr %arrayidx26, align 8
  %cmp27 = icmp sgt i32 %bits_to_shift.157, 0
  br i1 %cmp27, label %if.then, label %for.inc41

if.then:                                          ; preds = %for.body16
  %5 = getelementptr inbounds nuw i64, ptr %add.ptr, i32 %k.050
  %arrayidx30.idx = mul nuw nsw i32 %c.051, 40
  %arrayidx30 = getelementptr inbounds nuw i8, ptr %5, i32 %arrayidx30.idx
  %6 = load i64, ptr %arrayidx30, align 8
  %sub31 = sub nsw i32 64, %bits_to_shift.157
  %sh_prom32 = zext nneg i32 %sub31 to i64
  %shr = lshr i64 %6, %sh_prom32
  %mul33 = shl nuw nsw i32 %i2.059, 3
  %add34 = or disjoint i32 %mul33, %c.051
  %add35 = add nsw i32 %k.050, %words_to_shift.156
  %7 = mul i32 %add35, 80
  %mul37 = add i32 %7, 80
  %add38 = add i32 %add34, %mul37
  %arrayidx39 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add38
  %8 = load i64, ptr %arrayidx39, align 8
  %xor40 = xor i64 %8, %shr
  store i64 %xor40, ptr %arrayidx39, align 8
  br label %for.inc41

for.inc41:                                        ; preds = %if.then, %for.body16
  %inc42 = add nuw nsw i32 %k.050, 1
  %exitcond4.not = icmp eq i32 %inc42, 5
  br i1 %exitcond4.not, label %for.inc44, label %for.body16, !llvm.loop !9

for.inc44:                                        ; preds = %for.inc41
  %inc45 = add nuw nsw i32 %c.051, 1
  %exitcond5.not = icmp eq i32 %inc45, 8
  br i1 %exitcond5.not, label %for.end46, label %for.cond14.preheader, !llvm.loop !10

for.end46:                                        ; preds = %for.inc44
  %cmp47.not = icmp eq i32 %i2.059, %j.055
  br i1 %cmp47.not, label %if.end95, label %if.then48

if.then48:                                        ; preds = %for.end46
  %add.ptr51.idx = mul nuw nsw i32 %i2.059, 320
  %add.ptr51 = getelementptr inbounds nuw i8, ptr %VtL, i32 %add.ptr51.idx
  br label %for.cond57.preheader

for.cond57.preheader:                             ; preds = %if.then48, %for.inc92
  %c52.053 = phi i32 [ 0, %if.then48 ], [ %inc93, %for.inc92 ]
  br label %for.body59

for.body59:                                       ; preds = %for.cond57.preheader, %for.inc89
  %k56.052 = phi i32 [ 0, %for.cond57.preheader ], [ %inc90, %for.inc89 ]
  %9 = getelementptr inbounds nuw i64, ptr %add.ptr51, i32 %k56.052
  %arrayidx62.idx = mul nuw nsw i32 %c52.053, 40
  %arrayidx62 = getelementptr inbounds nuw i8, ptr %9, i32 %arrayidx62.idx
  %10 = load i64, ptr %arrayidx62, align 8
  %sh_prom63 = zext nneg i32 %bits_to_shift.157 to i64
  %shl64 = shl i64 %10, %sh_prom63
  %mul65 = shl nsw i32 %j.055, 3
  %add66 = or disjoint i32 %mul65, %c52.053
  %add67 = add nsw i32 %k56.052, %words_to_shift.156
  %mul68 = mul i32 %add67, 80
  %add69 = add i32 %add66, %mul68
  %arrayidx70 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add69
  %11 = load i64, ptr %arrayidx70, align 8
  %xor71 = xor i64 %11, %shl64
  store i64 %xor71, ptr %arrayidx70, align 8
  %cmp72 = icmp sgt i32 %bits_to_shift.157, 0
  br i1 %cmp72, label %if.then73, label %for.inc89

if.then73:                                        ; preds = %for.body59
  %12 = getelementptr inbounds nuw i64, ptr %add.ptr51, i32 %k56.052
  %arrayidx76.idx = mul nuw nsw i32 %c52.053, 40
  %arrayidx76 = getelementptr inbounds nuw i8, ptr %12, i32 %arrayidx76.idx
  %13 = load i64, ptr %arrayidx76, align 8
  %sub77 = sub nsw i32 64, %bits_to_shift.157
  %sh_prom78 = zext nneg i32 %sub77 to i64
  %shr79 = lshr i64 %13, %sh_prom78
  %mul80 = shl nsw i32 %j.055, 3
  %add81 = or disjoint i32 %mul80, %c52.053
  %add82 = add nsw i32 %k56.052, %words_to_shift.156
  %14 = mul i32 %add82, 80
  %mul84 = add i32 %14, 80
  %add85 = add i32 %add81, %mul84
  %arrayidx86 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add85
  %15 = load i64, ptr %arrayidx86, align 8
  %xor87 = xor i64 %15, %shr79
  store i64 %xor87, ptr %arrayidx86, align 8
  br label %for.inc89

for.inc89:                                        ; preds = %if.then73, %for.body59
  %inc90 = add nuw nsw i32 %k56.052, 1
  %exitcond6.not = icmp eq i32 %inc90, 5
  br i1 %exitcond6.not, label %for.inc92, label %for.body59, !llvm.loop !11

for.inc92:                                        ; preds = %for.inc89
  %inc93 = add nuw nsw i32 %c52.053, 1
  %exitcond7.not = icmp eq i32 %inc93, 8
  br i1 %exitcond7.not, label %if.end95.loopexit, label %for.cond57.preheader, !llvm.loop !12

if.end95.loopexit:                                ; preds = %for.inc92
  br label %if.end95

if.end95:                                         ; preds = %if.end95.loopexit, %for.end46
  %add96 = add nsw i32 %bits_to_shift.157, 4
  %cmp97 = icmp eq i32 %add96, 64
  %inc99 = zext i1 %cmp97 to i32
  %spec.select = add nsw i32 %words_to_shift.156, %inc99
  %spec.select3 = select i1 %cmp97, i32 0, i32 %add96
  %dec = add nsw i32 %j.055, -1
  %cmp7.not = icmp slt i32 %dec, %i2.059
  br i1 %cmp7.not, label %for.cond6.for.inc103_crit_edge, label %for.body8, !llvm.loop !13

for.cond6.for.inc103_crit_edge:                   ; preds = %if.end95
  %split = phi i32 [ %spec.select, %if.end95 ]
  %split58 = phi i32 [ %spec.select3, %if.end95 ]
  br label %for.inc103

for.inc103:                                       ; preds = %for.cond6.for.inc103_crit_edge
  %inc104 = add nuw nsw i32 %i2.059, 1
  %exitcond8.not = icmp eq i32 %inc104, 10
  br i1 %exitcond8.not, label %for.cond107.preheader, label %for.cond6.preheader, !llvm.loop !14

for.cond.i1.preheader:                            ; preds = %transpose_16x16_nibbles.exit
  br label %for.body.i4

for.body110:                                      ; preds = %for.cond107.preheader, %transpose_16x16_nibbles.exit
  %c106.066 = phi i32 [ 0, %for.cond107.preheader ], [ %add113, %transpose_16x16_nibbles.exit ]
  %add.ptr111 = getelementptr inbounds nuw i64, ptr %A, i32 %c106.066
  br label %for.body.i45

for.cond9.i.preheader:                            ; preds = %for.body.i45
  br label %for.body11.i

for.body.i45:                                     ; preds = %for.body110, %for.body.i45
  %i.0.i4162 = phi i32 [ 0, %for.body110 ], [ %add7.i, %for.body.i45 ]
  %arrayidx.i46 = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %i.0.i4162
  %16 = load i64, ptr %arrayidx.i46, align 8
  %shr.i = lshr i64 %16, 4
  %add.i = or disjoint i32 %i.0.i4162, 1
  %arrayidx1.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %add.i
  %17 = load i64, ptr %arrayidx1.i, align 8
  %xor.i = xor i64 %shr.i, %17
  %and.i = and i64 %xor.i, 1085102592571150095
  %shl.i = shl nuw i64 %and.i, 4
  %arrayidx2.i47 = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %i.0.i4162
  %18 = load i64, ptr %arrayidx2.i47, align 8
  %xor3.i = xor i64 %18, %shl.i
  store i64 %xor3.i, ptr %arrayidx2.i47, align 8
  %add4.i = or disjoint i32 %i.0.i4162, 1
  %arrayidx5.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %add4.i
  %19 = load i64, ptr %arrayidx5.i, align 8
  %xor6.i = xor i64 %19, %and.i
  store i64 %xor6.i, ptr %arrayidx5.i, align 8
  %add7.i = add nuw nsw i32 %i.0.i4162, 2
  %cmp.i42 = icmp samesign ult i32 %add7.i, 16
  br i1 %cmp.i42, label %for.body.i45, label %for.cond9.i.preheader, !llvm.loop !15

for.cond42.i.preheader:                           ; preds = %for.body11.i
  br label %for.body44.i

for.body11.i:                                     ; preds = %for.cond9.i.preheader, %for.body11.i
  %i8.0.i63 = phi i32 [ 0, %for.cond9.i.preheader ], [ %add39.i, %for.body11.i ]
  %arrayidx12.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %i8.0.i63
  %20 = load i64, ptr %arrayidx12.i, align 8
  %shr13.i = lshr i64 %20, 8
  %add14.i = or disjoint i32 %i8.0.i63, 2
  %arrayidx15.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %add14.i
  %21 = load i64, ptr %arrayidx15.i, align 8
  %xor16.i = xor i64 %shr13.i, %21
  %and17.i = and i64 %xor16.i, 71777214294589695
  %add18.i = or disjoint i32 %i8.0.i63, 1
  %arrayidx19.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %add18.i
  %22 = load i64, ptr %arrayidx19.i, align 8
  %shr20.i = lshr i64 %22, 8
  %add21.i = or disjoint i32 %i8.0.i63, 3
  %arrayidx22.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %add21.i
  %23 = load i64, ptr %arrayidx22.i, align 8
  %xor23.i = xor i64 %shr20.i, %23
  %and24.i = and i64 %xor23.i, 71777214294589695
  %shl25.i = shl nuw i64 %and17.i, 8
  %arrayidx26.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %i8.0.i63
  %24 = load i64, ptr %arrayidx26.i, align 8
  %xor27.i = xor i64 %24, %shl25.i
  store i64 %xor27.i, ptr %arrayidx26.i, align 8
  %shl28.i = shl nuw i64 %and24.i, 8
  %add29.i = or disjoint i32 %i8.0.i63, 1
  %arrayidx30.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %add29.i
  %25 = load i64, ptr %arrayidx30.i, align 8
  %xor31.i = xor i64 %25, %shl28.i
  store i64 %xor31.i, ptr %arrayidx30.i, align 8
  %add32.i = or disjoint i32 %i8.0.i63, 2
  %arrayidx33.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %add32.i
  %26 = load i64, ptr %arrayidx33.i, align 8
  %xor34.i = xor i64 %26, %and17.i
  store i64 %xor34.i, ptr %arrayidx33.i, align 8
  %add35.i = or disjoint i32 %i8.0.i63, 3
  %arrayidx36.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %add35.i
  %27 = load i64, ptr %arrayidx36.i, align 8
  %xor37.i = xor i64 %27, %and24.i
  store i64 %xor37.i, ptr %arrayidx36.i, align 8
  %add39.i = add nuw nsw i32 %i8.0.i63, 4
  %cmp10.i = icmp samesign ult i32 %add39.i, 16
  br i1 %cmp10.i, label %for.body11.i, label %for.cond42.i.preheader, !llvm.loop !16

for.cond76.i.preheader:                           ; preds = %for.body44.i
  br label %for.body78.i

for.body44.i:                                     ; preds = %for.cond42.i.preheader, %for.body44.i
  %i41.0.i64 = phi i32 [ 0, %for.cond42.i.preheader ], [ %inc.i44, %for.body44.i ]
  %arrayidx46.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %i41.0.i64
  %28 = load i64, ptr %arrayidx46.i, align 8
  %shr47.i = lshr i64 %28, 16
  %add48.i = or disjoint i32 %i41.0.i64, 4
  %arrayidx49.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %add48.i
  %29 = load i64, ptr %arrayidx49.i, align 8
  %xor50.i = xor i64 %shr47.i, %29
  %and51.i = and i64 %xor50.i, 281470681808895
  %add53.i = or disjoint i32 %i41.0.i64, 8
  %arrayidx54.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %add53.i
  %30 = load i64, ptr %arrayidx54.i, align 8
  %shr55.i = lshr i64 %30, 16
  %add56.i = or disjoint i32 %i41.0.i64, 12
  %arrayidx57.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %add56.i
  %31 = load i64, ptr %arrayidx57.i, align 8
  %xor58.i = xor i64 %shr55.i, %31
  %and59.i = and i64 %xor58.i, 281470681808895
  %shl60.i = shl nuw i64 %and51.i, 16
  %arrayidx61.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %i41.0.i64
  %32 = load i64, ptr %arrayidx61.i, align 8
  %xor62.i = xor i64 %32, %shl60.i
  store i64 %xor62.i, ptr %arrayidx61.i, align 8
  %shl63.i = shl nuw i64 %and59.i, 16
  %add64.i = or disjoint i32 %i41.0.i64, 8
  %arrayidx65.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %add64.i
  %33 = load i64, ptr %arrayidx65.i, align 8
  %xor66.i = xor i64 %33, %shl63.i
  store i64 %xor66.i, ptr %arrayidx65.i, align 8
  %add67.i = or disjoint i32 %i41.0.i64, 4
  %arrayidx68.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %add67.i
  %34 = load i64, ptr %arrayidx68.i, align 8
  %xor69.i = xor i64 %34, %and51.i
  store i64 %xor69.i, ptr %arrayidx68.i, align 8
  %add70.i = or disjoint i32 %i41.0.i64, 12
  %arrayidx71.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %add70.i
  %35 = load i64, ptr %arrayidx71.i, align 8
  %xor72.i = xor i64 %35, %and59.i
  store i64 %xor72.i, ptr %arrayidx71.i, align 8
  %inc.i44 = add nuw nsw i32 %i41.0.i64, 1
  %exitcond.i43.not = icmp eq i32 %inc.i44, 4
  br i1 %exitcond.i43.not, label %for.cond76.i.preheader, label %for.body44.i, !llvm.loop !17

for.body78.i:                                     ; preds = %for.cond76.i.preheader, %for.body78.i
  %i75.0.i65 = phi i32 [ 0, %for.cond76.i.preheader ], [ %inc93.i, %for.body78.i ]
  %arrayidx80.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %i75.0.i65
  %36 = load i64, ptr %arrayidx80.i, align 8
  %shr81.i = lshr i64 %36, 32
  %add82.i = or disjoint i32 %i75.0.i65, 8
  %arrayidx83.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %add82.i
  %37 = load i64, ptr %arrayidx83.i, align 8
  %.masked.i = and i64 %37, 4294967295
  %and85.i = xor i64 %shr81.i, %.masked.i
  %shl86.i = shl nuw i64 %and85.i, 32
  %arrayidx87.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %i75.0.i65
  %38 = load i64, ptr %arrayidx87.i, align 8
  %xor88.i = xor i64 %38, %shl86.i
  store i64 %xor88.i, ptr %arrayidx87.i, align 8
  %add89.i = or disjoint i32 %i75.0.i65, 8
  %arrayidx90.i = getelementptr inbounds nuw i64, ptr %add.ptr111, i32 %add89.i
  %39 = load i64, ptr %arrayidx90.i, align 8
  %xor91.i = xor i64 %39, %and85.i
  store i64 %xor91.i, ptr %arrayidx90.i, align 8
  %inc93.i = add nuw nsw i32 %i75.0.i65, 1
  %exitcond1.i.not = icmp eq i32 %inc93.i, 8
  br i1 %exitcond1.i.not, label %transpose_16x16_nibbles.exit, label %for.body78.i, !llvm.loop !18

transpose_16x16_nibbles.exit:                     ; preds = %for.body78.i
  %add113 = add nuw nsw i32 %c106.066, 16
  %cmp109 = icmp samesign ult i32 %add113, 720
  br i1 %cmp109, label %for.body110, label %for.cond.i1.preheader, !llvm.loop !19

for.cond116.preheader:                            ; preds = %for.body.i4
  br label %for.body118

for.body.i4:                                      ; preds = %for.cond.i1.preheader, %for.body.i4
  %i.0.i267 = phi i32 [ 0, %for.cond.i1.preheader ], [ %inc.i6, %for.body.i4 ]
  %arrayidx.i5 = getelementptr inbounds nuw i8, ptr %tab, i32 %i.0.i267
  store i8 0, ptr %arrayidx.i5, align 1
  %inc.i6 = add nuw nsw i32 %i.0.i267, 1
  %exitcond.i3.not = icmp eq i32 %inc.i6, 16
  br i1 %exitcond.i3.not, label %for.cond116.preheader, label %for.body.i4, !llvm.loop !20

for.cond141.preheader:                            ; preds = %for.body118
  br label %for.cond144.preheader

for.body118:                                      ; preds = %for.cond116.preheader, %for.body118
  %i115.068 = phi i32 [ 0, %for.cond116.preheader ], [ %inc138, %for.body118 ]
  %arrayidx119 = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %i115.068
  %40 = load i8, ptr %arrayidx119, align 1
  %41 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1
  %xor1.i17 = xor i8 %40, %41
  %xor25.i24 = and i8 %xor1.i17, 15
  %mul120 = shl nuw nsw i32 %i115.068, 2
  %arrayidx121 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %mul120
  store i8 %xor25.i24, ptr %arrayidx121, align 1
  %42 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1
  %xor1.i26 = xor i8 %40, %42
  %43 = trunc i8 %xor1.i26 to i1
  %44 = shl i8 %xor1.i26, 1
  %mul9.i27 = and i8 %44, 4
  %conv10.i28 = select i1 %43, i8 2, i8 0
  %xor11.i29 = or disjoint i8 %conv10.i28, %mul9.i27
  %45 = shl i8 %xor1.i26, 1
  %mul16.i30 = and i8 %45, 8
  %xor18.i31 = or disjoint i8 %mul16.i30, %xor11.i29
  %46 = shl i8 %xor1.i26, 1
  %mul23.i32 = and i8 %46, 16
  %47 = lshr exact i8 %mul23.i32, 4
  %48 = lshr exact i8 %mul23.i32, 3
  %49 = or disjoint i8 %47, %48
  %50 = xor i8 %49, %xor18.i31
  %mul124 = shl nuw nsw i32 %i115.068, 2
  %add125 = or disjoint i32 %mul124, 1
  %arrayidx126 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add125
  store i8 %50, ptr %arrayidx126, align 1
  %arrayidx127 = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %i115.068
  %51 = load i8, ptr %arrayidx127, align 1
  %52 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1
  %xor1.i8 = xor i8 %51, %52
  %53 = trunc i8 %xor1.i8 to i1
  %54 = shl i8 %xor1.i8, 2
  %mul9.i9 = and i8 %54, 8
  %conv10.i10 = select i1 %53, i8 4, i8 0
  %xor11.i11 = or disjoint i8 %conv10.i10, %mul9.i9
  %55 = shl i8 %xor1.i8, 2
  %mul16.i12 = and i8 %55, 16
  %56 = shl i8 %xor1.i8, 2
  %mul23.i14 = and i8 %56, 32
  %57 = or disjoint i8 %mul16.i12, %mul23.i14
  %58 = lshr exact i8 %57, 4
  %59 = lshr exact i8 %57, 3
  %60 = xor i8 %58, %59
  %61 = xor i8 %60, %xor11.i11
  %mul129 = shl nuw nsw i32 %i115.068, 2
  %add130 = or disjoint i32 %mul129, 2
  %arrayidx131 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add130
  store i8 %61, ptr %arrayidx131, align 1
  %arrayidx132 = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %i115.068
  %62 = load i8, ptr %arrayidx132, align 1
  %63 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1
  %xor1.i = xor i8 %62, %63
  %64 = trunc i8 %xor1.i to i1
  %65 = shl i8 %xor1.i, 3
  %mul9.i = and i8 %65, 16
  %conv10.i = select i1 %64, i8 8, i8 0
  %66 = shl i8 %xor1.i, 3
  %mul16.i = and i8 %66, 32
  %67 = or disjoint i8 %mul9.i, %mul16.i
  %68 = shl i8 %xor1.i, 3
  %mul23.i = and i8 %68, 64
  %69 = or disjoint i8 %67, %mul23.i
  %70 = lshr exact i8 %69, 4
  %71 = lshr exact i8 %69, 3
  %72 = xor i8 %70, %71
  %73 = xor i8 %72, %conv10.i
  %mul134 = shl nuw nsw i32 %i115.068, 2
  %add135 = or disjoint i32 %mul134, 3
  %arrayidx136 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add135
  store i8 %73, ptr %arrayidx136, align 1
  %inc138 = add nuw nsw i32 %i115.068, 1
  %exitcond9.not = icmp eq i32 %inc138, 4
  br i1 %exitcond9.not, label %for.cond141.preheader, label %for.body118, !llvm.loop !21

for.cond144.preheader:                            ; preds = %for.cond141.preheader, %for.inc203
  %c140.071 = phi i32 [ 0, %for.cond141.preheader ], [ %add204, %for.inc203 ]
  br label %for.body146

for.cond207.preheader:                            ; preds = %for.inc203
  br label %for.cond212.preheader

for.body146:                                      ; preds = %for.cond144.preheader, %for.inc200
  %r.070 = phi i32 [ 78, %for.cond144.preheader ], [ %inc201, %for.inc200 ]
  %div1 = lshr i32 %r.070, 4
  %mul147 = mul nuw nsw i32 %div1, 80
  %add148 = add nuw nsw i32 %mul147, %c140.071
  %rem = and i32 %r.070, 15
  %add149 = or disjoint i32 %add148, %rem
  %arrayidx150 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add149
  %74 = load i64, ptr %arrayidx150, align 8
  %and151 = and i64 %74, 1229782938247303441
  %shr153 = lshr i64 %74, 1
  %and154 = and i64 %shr153, 1229782938247303441
  %shr156 = lshr i64 %74, 2
  %and157 = and i64 %shr156, 1229782938247303441
  %arrayidx158 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add149
  %75 = load i64, ptr %arrayidx158, align 8
  %shr159 = lshr i64 %75, 3
  %and160 = and i64 %shr159, 1229782938247303441
  br label %for.body163

for.body163:                                      ; preds = %for.body146, %for.body163
  %t.069 = phi i32 [ 0, %for.body146 ], [ %inc198, %for.body163 ]
  %mul164 = shl nuw nsw i32 %t.069, 2
  %arrayidx166 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %mul164
  %76 = load i8, ptr %arrayidx166, align 1
  %conv = zext i8 %76 to i64
  %mul167 = mul i64 %and151, %conv
  %mul168 = shl nuw nsw i32 %t.069, 2
  %add169 = or disjoint i32 %mul168, 1
  %arrayidx170 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add169
  %77 = load i8, ptr %arrayidx170, align 1
  %conv171 = zext i8 %77 to i64
  %mul172 = mul i64 %and154, %conv171
  %xor173 = xor i64 %mul167, %mul172
  %mul174 = shl nuw nsw i32 %t.069, 2
  %add175 = or disjoint i32 %mul174, 2
  %arrayidx176 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add175
  %78 = load i8, ptr %arrayidx176, align 1
  %conv177 = zext i8 %78 to i64
  %mul178 = mul i64 %and157, %conv177
  %xor179 = xor i64 %xor173, %mul178
  %mul180 = shl nuw nsw i32 %t.069, 2
  %add181 = or disjoint i32 %mul180, 3
  %arrayidx182 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add181
  %79 = load i8, ptr %arrayidx182, align 1
  %conv183 = zext i8 %79 to i64
  %mul184 = mul i64 %and160, %conv183
  %xor185 = xor i64 %xor179, %mul184
  %add186 = add nuw nsw i32 %r.070, %t.069
  %sub187 = add nsw i32 %add186, -78
  %div1882 = lshr i32 %sub187, 4
  %mul189 = mul i32 %div1882, 80
  %add190 = add i32 %mul189, %c140.071
  %add191 = add nuw nsw i32 %r.070, %t.069
  %sub192 = add nuw nsw i32 %add191, 2
  %rem193 = and i32 %sub192, 15
  %add194 = or disjoint i32 %add190, %rem193
  %arrayidx195 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add194
  %80 = load i64, ptr %arrayidx195, align 8
  %xor196 = xor i64 %80, %xor185
  store i64 %xor196, ptr %arrayidx195, align 8
  %inc198 = add nuw nsw i32 %t.069, 1
  %exitcond10.not = icmp eq i32 %inc198, 4
  br i1 %exitcond10.not, label %for.inc200, label %for.body163, !llvm.loop !22

for.inc200:                                       ; preds = %for.body163
  %inc201 = add nuw nsw i32 %r.070, 1
  %exitcond11.not = icmp eq i32 %inc201, 133
  br i1 %exitcond11.not, label %for.inc203, label %for.body146, !llvm.loop !23

for.inc203:                                       ; preds = %for.inc200
  %add204 = add nuw nsw i32 %c140.071, 16
  %cmp142 = icmp samesign ult i32 %add204, 80
  br i1 %cmp142, label %for.cond144.preheader, label %for.cond207.preheader, !llvm.loop !24

for.cond212.preheader:                            ; preds = %for.cond207.preheader, %for.inc241
  %r206.079 = phi i32 [ 0, %for.cond207.preheader ], [ %add242, %for.inc241 ]
  %indvars.iv78 = phi i32 [ 78, %for.cond207.preheader ], [ %indvars.iv.next, %for.inc241 ]
  br label %for.cond217.preheader

for.cond217.preheader:                            ; preds = %for.cond212.preheader, %for.inc238
  %c211.077 = phi i32 [ 0, %for.cond212.preheader ], [ %add239, %for.inc238 ]
  br label %for.body221.lr.ph

for.body221.lr.ph:                                ; preds = %for.cond217.preheader
  br label %for.body221

for.body221:                                      ; preds = %for.body221.lr.ph, %decode.exit
  %i216.076 = phi i32 [ 0, %for.body221.lr.ph ], [ %inc236, %decode.exit ]
  %div223 = mul nuw nsw i32 %r206.079, 5
  %add224 = add nuw nsw i32 %div223, %c211.077
  %add225 = add nuw nsw i32 %add224, %i216.076
  %arrayidx226 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add225
  %add227 = add nuw nsw i32 %r206.079, %i216.076
  %mul228 = mul nuw nsw i32 %add227, 81
  %add.ptr229 = getelementptr inbounds nuw i8, ptr %A_out, i32 %mul228
  %add.ptr230 = getelementptr inbounds nuw i8, ptr %add.ptr229, i32 %c211.077
  %cmp232 = icmp samesign ult i32 %c211.077, 64
  %sub234 = sub nuw nsw i32 80, %c211.077
  %81 = lshr exact i32 %sub234, 1
  %div.i = select i1 %cmp232, i32 8, i32 %81
  %cmp.i72 = icmp samesign ult i32 0, %div.i
  br i1 %cmp.i72, label %for.body.i37.lr.ph, label %decode.exit

for.body.i37.lr.ph:                               ; preds = %for.body221
  br label %for.body.i37

for.body.i37:                                     ; preds = %for.body.i37.lr.ph, %for.body.i37
  %i.0.i3674 = phi i32 [ 0, %for.body.i37.lr.ph ], [ %inc.i39, %for.body.i37 ]
  %mdec.addr.0.i73 = phi ptr [ %add.ptr230, %for.body.i37.lr.ph ], [ %incdec.ptr5.i, %for.body.i37 ]
  %arrayidx.i38 = getelementptr inbounds nuw i8, ptr %arrayidx226, i32 %i.0.i3674
  %82 = load i8, ptr %arrayidx.i38, align 1
  %83 = and i8 %82, 15
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i73, i32 1
  store i8 %83, ptr %mdec.addr.0.i73, align 1
  %84 = lshr i8 %82, 4
  store i8 %84, ptr %incdec.ptr.i, align 1
  %incdec.ptr5.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i73, i32 2
  %inc.i39 = add nuw nsw i32 %i.0.i3674, 1
  %exitcond = icmp ne i32 %inc.i39, %div.i
  br i1 %exitcond, label %for.body.i37, label %for.cond.i35.decode.exit_crit_edge, !llvm.loop !25

for.cond.i35.decode.exit_crit_edge:               ; preds = %for.body.i37
  br label %decode.exit

decode.exit:                                      ; preds = %for.cond.i35.decode.exit_crit_edge, %for.body221
  %inc236 = add nuw nsw i32 %i216.076, 1
  %exitcond12.not = icmp eq i32 %inc236, %indvars.iv78
  br i1 %exitcond12.not, label %for.cond217.for.inc238_crit_edge, label %for.body221, !llvm.loop !26

for.cond217.for.inc238_crit_edge:                 ; preds = %decode.exit
  br label %for.inc238

for.inc238:                                       ; preds = %for.cond217.for.inc238_crit_edge
  %add239 = add nuw nsw i32 %c211.077, 16
  %cmp213 = icmp samesign ult i32 %add239, 80
  br i1 %cmp213, label %for.cond217.preheader, label %for.inc241, !llvm.loop !27

for.inc241:                                       ; preds = %for.inc238
  %add242 = add nuw nsw i32 %r206.079, 16
  %indvars.iv.next = add nsw i32 %indvars.iv78, -16
  %cmp208 = icmp samesign ult i32 %add242, 78
  br i1 %cmp208, label %for.cond212.preheader, label %for.end243, !llvm.loop !28

for.end243:                                       ; preds = %for.inc241
  ret void
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #1 {
entry:
  %p_buf = alloca [128 x i8], align 16
  call void @mayo_memset(ptr %p_buf, i8 0, i32 128)
  %Mtmp = alloca [400 x i64], align 16
  call void @mayo_memset(ptr %Mtmp, i8 0, i32 3200)
  %A = alloca [6480 x i8], align 16
  call void @mayo_memset(ptr %A, i8 0, i32 6480)
  call fastcc void @compute_A(ptr nonnull %p_buf, ptr %Mtmp, ptr %A)
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
  br label %for.cond, !llvm.loop !29

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
