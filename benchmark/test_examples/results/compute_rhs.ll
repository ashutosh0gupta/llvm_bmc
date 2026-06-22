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
define dso_local fastcc void @compute_rhs(ptr noundef %p, ptr noundef nonnull %vPv, ptr noundef nonnull %t, ptr noundef nonnull %y) unnamed_addr #0 {
entry:
  %temp = alloca [5 x i64], align 8
  br label %for.body

for.cond.i.preheader:                             ; preds = %for.body
  br label %for.body.i

for.body:                                         ; preds = %entry, %for.body
  %i.010 = phi i32 [ 0, %entry ], [ %inc, %for.body ]
  %.idx7 = mul nuw nsw i32 %i.010, 40
  %0 = getelementptr inbounds nuw i8, ptr %vPv, i32 %.idx7
  %arrayidx = getelementptr inbounds nuw i8, ptr %0, i32 32
  %1 = load i64, ptr %arrayidx, align 8
  %and = and i64 %1, 72057594037927935
  store i64 %and, ptr %arrayidx, align 8
  %inc = add nuw nsw i32 %i.010, 1
  %exitcond.not = icmp eq i32 %inc, 100
  br i1 %exitcond.not, label %for.cond.i.preheader, label %for.body, !llvm.loop !7

for.cond3.preheader:                              ; preds = %for.body.i
  br label %for.cond6.preheader

for.body.i:                                       ; preds = %for.cond.i.preheader, %for.body.i
  %i.0.i11 = phi i32 [ 0, %for.cond.i.preheader ], [ %inc.i, %for.body.i ]
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %temp, i32 %i.0.i11
  store i8 0, ptr %arrayidx.i, align 1
  %inc.i = add nuw nsw i32 %i.0.i11, 1
  %exitcond.i.not = icmp eq i32 %inc.i, 40
  br i1 %exitcond.i.not, label %for.cond3.preheader, label %for.body.i, !llvm.loop !8

for.cond6.preheader:                              ; preds = %for.cond3.preheader, %for.inc77
  %i2.017 = phi i32 [ 9, %for.cond3.preheader ], [ %dec78, %for.inc77 ]
  br label %for.body8.lr.ph

for.body8.lr.ph:                                  ; preds = %for.cond6.preheader
  br label %for.body8

for.cond81.preheader:                             ; preds = %for.inc77
  br label %for.body84

for.body8:                                        ; preds = %for.body8.lr.ph, %for.inc74
  %j.016 = phi i32 [ %i2.017, %for.body8.lr.ph ], [ %inc75, %for.inc74 ]
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %temp, i32 32
  %2 = load i64, ptr %arrayidx9, align 8
  %shr = lshr i64 %2, 52
  %arrayidx10 = getelementptr inbounds nuw i8, ptr %temp, i32 32
  %shl11 = shl i64 %2, 4
  store i64 %shl11, ptr %arrayidx10, align 8
  br label %for.body15

for.cond24.preheader:                             ; preds = %for.body15
  %rem.lhs.trunc = trunc i64 %shr to i8
  %rem1 = and i8 %rem.lhs.trunc, 15
  br label %for.body27

for.body15:                                       ; preds = %for.body8, %for.body15
  %k.012 = phi i32 [ 3, %for.body8 ], [ %dec, %for.body15 ]
  %arrayidx16 = getelementptr inbounds nuw [5 x i64], ptr %temp, i32 0, i32 %k.012
  %3 = load i64, ptr %arrayidx16, align 8
  %shr17 = lshr i64 %3, 60
  %add18 = add nuw nsw i32 %k.012, 1
  %arrayidx19 = getelementptr inbounds nuw [5 x i64], ptr %temp, i32 0, i32 %add18
  %4 = load i64, ptr %arrayidx19, align 8
  %xor = xor i64 %4, %shr17
  store i64 %xor, ptr %arrayidx19, align 8
  %arrayidx20 = getelementptr inbounds nuw [5 x i64], ptr %temp, i32 0, i32 %k.012
  %5 = load i64, ptr %arrayidx20, align 8
  %shl21 = shl i64 %5, 4
  store i64 %shl21, ptr %arrayidx20, align 8
  %dec = add nsw i32 %k.012, -1
  %cmp13 = icmp sgt i32 %dec, -1
  br i1 %cmp13, label %for.body15, label %for.cond24.preheader, !llvm.loop !9

for.cond50.preheader:                             ; preds = %for.inc46
  br label %for.body53

for.body27:                                       ; preds = %for.cond24.preheader, %for.inc46
  %jj.013 = phi i32 [ 0, %for.cond24.preheader ], [ %inc47, %for.inc46 ]
  %rem28 = and i32 %jj.013, 1
  %cmp29 = icmp eq i32 %rem28, 0
  br i1 %cmp29, label %if.then, label %if.else

if.then:                                          ; preds = %for.body27
  %arrayidx31 = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %jj.013
  %6 = load i8, ptr %arrayidx31, align 1
  %7 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1
  %xor1.i1 = xor i8 %rem1, %7
  %8 = trunc i8 %xor1.i1 to i1
  %9 = and i8 %xor1.i1, 2
  %mul9.i2 = mul i8 %9, %6
  %conv10.i3 = select i1 %8, i8 %6, i8 0
  %xor11.i4 = xor i8 %conv10.i3, %mul9.i2
  %10 = and i8 %xor1.i1, 4
  %mul16.i5 = mul i8 %10, %6
  %xor18.i6 = xor i8 %mul16.i5, %xor11.i4
  %11 = and i8 %xor1.i1, 8
  %mul23.i7 = mul i8 %11, %6
  %xor25.i8 = xor i8 %mul23.i7, %xor18.i6
  %12 = lshr i8 %xor25.i8, 4
  %13 = lshr i8 %xor25.i8, 3
  %14 = and i8 %13, 14
  %15 = xor i8 %12, %14
  %xor25.masked.i9 = and i8 %xor25.i8, 15
  %16 = xor i8 %15, %xor25.masked.i9
  %div = lshr exact i32 %jj.013, 1
  %arrayidx33 = getelementptr inbounds nuw i8, ptr %temp, i32 %div
  %17 = load i8, ptr %arrayidx33, align 1
  %xor356 = xor i8 %17, %16
  store i8 %xor356, ptr %arrayidx33, align 1
  br label %for.inc46

if.else:                                          ; preds = %for.body27
  %arrayidx37 = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %jj.013
  %18 = load i8, ptr %arrayidx37, align 1
  %19 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1
  %xor1.i = xor i8 %rem1, %19
  %20 = trunc i8 %xor1.i to i1
  %21 = and i8 %xor1.i, 2
  %mul9.i = mul i8 %21, %18
  %conv10.i = select i1 %20, i8 %18, i8 0
  %xor11.i = xor i8 %conv10.i, %mul9.i
  %22 = and i8 %xor1.i, 4
  %mul16.i = mul i8 %22, %18
  %xor18.i = xor i8 %mul16.i, %xor11.i
  %23 = and i8 %xor1.i, 8
  %mul23.i = mul i8 %23, %18
  %xor25.i = xor i8 %mul23.i, %xor18.i
  %24 = lshr i8 %xor25.i, 4
  %25 = lshr i8 %xor25.i, 3
  %26 = and i8 %25, 14
  %27 = xor i8 %24, %26
  %xor25.masked.i = and i8 %xor25.i, 15
  %28 = xor i8 %27, %xor25.masked.i
  %shl40 = shl nuw i8 %28, 4
  %div415 = lshr i32 %jj.013, 1
  %arrayidx42 = getelementptr inbounds nuw i8, ptr %temp, i32 %div415
  %29 = load i8, ptr %arrayidx42, align 1
  %xor44 = xor i8 %shl40, %29
  store i8 %xor44, ptr %arrayidx42, align 1
  br label %for.inc46

for.inc46:                                        ; preds = %if.else, %if.then
  %inc47 = add nuw nsw i32 %jj.013, 1
  %exitcond8.not = icmp eq i32 %inc47, 4
  br i1 %exitcond8.not, label %for.cond50.preheader, label %for.body27, !llvm.loop !10

for.body53:                                       ; preds = %for.cond50.preheader, %for.body53
  %k49.014 = phi i32 [ 0, %for.cond50.preheader ], [ %inc72, %for.body53 ]
  %mul54 = mul nuw nsw i32 %i2.017, 10
  %add55 = add nuw nsw i32 %mul54, %j.016
  %.idx = mul nuw nsw i32 %add55, 40
  %30 = getelementptr i8, ptr %vPv, i32 %.idx
  %arrayidx58 = getelementptr i64, ptr %30, i32 %k49.014
  %31 = load i64, ptr %arrayidx58, align 8
  %cmp59.not = icmp eq i32 %i2.017, %j.016
  %mul62 = mul nuw nsw i32 %j.016, 10
  %add63 = add nuw nsw i32 %mul62, %i2.017
  %.idx4 = mul nuw nsw i32 %add63, 40
  %32 = getelementptr i8, ptr %vPv, i32 %.idx4
  %arrayidx66 = getelementptr i64, ptr %32, i32 %k49.014
  %33 = load i64, ptr %arrayidx66, align 8
  %mul67 = select i1 %cmp59.not, i64 0, i64 %33
  %xor68 = xor i64 %31, %mul67
  %arrayidx69 = getelementptr inbounds nuw [5 x i64], ptr %temp, i32 0, i32 %k49.014
  %34 = load i64, ptr %arrayidx69, align 8
  %xor70 = xor i64 %34, %xor68
  store i64 %xor70, ptr %arrayidx69, align 8
  %inc72 = add nuw nsw i32 %k49.014, 1
  %exitcond9.not = icmp eq i32 %inc72, 5
  br i1 %exitcond9.not, label %for.inc74, label %for.body53, !llvm.loop !11

for.inc74:                                        ; preds = %for.body53
  %inc75 = add nuw nsw i32 %j.016, 1
  %exitcond10.not = icmp eq i32 %inc75, 10
  br i1 %exitcond10.not, label %for.cond6.for.inc77_crit_edge, label %for.body8, !llvm.loop !12

for.cond6.for.inc77_crit_edge:                    ; preds = %for.inc74
  br label %for.inc77

for.inc77:                                        ; preds = %for.cond6.for.inc77_crit_edge
  %dec78 = add nsw i32 %i2.017, -1
  %cmp4 = icmp sgt i32 %dec78, -1
  br i1 %cmp4, label %for.cond6.preheader, label %for.cond81.preheader, !llvm.loop !13

for.body84:                                       ; preds = %for.cond81.preheader, %for.body84
  %i80.018 = phi i32 [ 0, %for.cond81.preheader ], [ %add106, %for.body84 ]
  %arrayidx85 = getelementptr inbounds nuw i8, ptr %t, i32 %i80.018
  %35 = load i8, ptr %arrayidx85, align 1
  %div87 = lshr exact i32 %i80.018, 1
  %arrayidx88 = getelementptr inbounds nuw i8, ptr %temp, i32 %div87
  %36 = load i8, ptr %arrayidx88, align 1
  %37 = and i8 %36, 15
  %xor912 = xor i8 %35, %37
  %arrayidx93 = getelementptr inbounds nuw i8, ptr %y, i32 %i80.018
  store i8 %xor912, ptr %arrayidx93, align 1
  %add94 = or disjoint i32 %i80.018, 1
  %arrayidx95 = getelementptr inbounds nuw i8, ptr %t, i32 %add94
  %38 = load i8, ptr %arrayidx95, align 1
  %div97 = lshr exact i32 %i80.018, 1
  %arrayidx98 = getelementptr inbounds nuw i8, ptr %temp, i32 %div97
  %39 = load i8, ptr %arrayidx98, align 1
  %40 = lshr i8 %39, 4
  %xor1013 = xor i8 %38, %40
  %add103 = or disjoint i32 %i80.018, 1
  %arrayidx104 = getelementptr inbounds nuw i8, ptr %y, i32 %add103
  store i8 %xor1013, ptr %arrayidx104, align 1
  %add106 = add nuw nsw i32 %i80.018, 2
  %cmp82 = icmp samesign ult i32 %add106, 78
  br i1 %cmp82, label %for.body84, label %for.end107, !llvm.loop !14

for.end107:                                       ; preds = %for.body84
  ret void
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #1 {
entry:
  %p_buf = alloca [128 x i8], align 16
  call void @mayo_memset(ptr %p_buf, i8 0, i32 128)
  %SPS = alloca [500 x i64], align 16
  call void @mayo_memset(ptr %SPS, i8 0, i32 4000)
  %zero = alloca [78 x i8], align 16
  call void @mayo_memset(ptr %zero, i8 0, i32 78)
  %y = alloca [156 x i8], align 16
  call void @mayo_memset(ptr %y, i8 0, i32 156)
  call fastcc void @compute_rhs(ptr nonnull %p_buf, ptr %SPS, ptr %zero, ptr %y)
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
  br label %for.cond, !llvm.loop !15

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
