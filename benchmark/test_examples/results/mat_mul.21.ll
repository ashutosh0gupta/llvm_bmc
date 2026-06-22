; ModuleID = '../mayo_IR/mayo1.ll'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

@pqmayo_MAYO_1_ref_unsigned_char_blocker = dso_local global i8 0, align 1

; Function Attrs: inlinehint nounwind
define dso_local fastcc void @mat_mul.21(ptr noundef %a, ptr noundef %b, ptr noundef nonnull %c, i32 noundef range(i32 -2147483647, -2147483648) %colrow_ab, i32 noundef %row_a, i32 noundef %col_b) unnamed_addr #0 {
entry:
  %0 = call i32 @llvm.smax.i32(i32 %row_a, i32 0)
  %exitcond.not6 = icmp eq i32 0, %0
  br i1 %exitcond.not6, label %for.end7, label %for.cond1.preheader.lr.ph

for.cond1.preheader.lr.ph:                        ; preds = %entry
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.lr.ph, %for.inc4
  %a.addr.09 = phi ptr [ %a, %for.cond1.preheader.lr.ph ], [ %add.ptr6, %for.inc4 ]
  %c.addr.08 = phi ptr [ %c, %for.cond1.preheader.lr.ph ], [ %c.addr.1.lcssa, %for.inc4 ]
  %i.07 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc5, %for.inc4 ]
  br label %for.body3

for.body3:                                        ; preds = %for.cond1.preheader
  %1 = call i32 @llvm.smax.i32(i32 %colrow_ab, i32 0)
  %exitcond.i.not1 = icmp eq i32 0, %1
  br i1 %exitcond.i.not1, label %lincomb.24.exit, label %for.body.i.lr.ph

for.body.i.lr.ph:                                 ; preds = %for.body3
  br label %for.body.i

for.body.i:                                       ; preds = %for.body.i.lr.ph, %for.body.i
  %i.0.i4 = phi i32 [ 0, %for.body.i.lr.ph ], [ %inc.i, %for.body.i ]
  %b.addr.0.i3 = phi ptr [ %b, %for.body.i.lr.ph ], [ %add.ptr.i, %for.body.i ]
  %ret.0.i2 = phi i8 [ 0, %for.body.i.lr.ph ], [ %xor1.i.i, %for.body.i ]
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %a.addr.09, i32 %i.0.i4
  %2 = load i8, ptr %arrayidx.i, align 1
  %3 = load i8, ptr %b.addr.0.i3, align 1
  %4 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1
  %xor1.i = xor i8 %2, %4
  %5 = trunc i8 %xor1.i to i1
  %6 = and i8 %xor1.i, 2
  %mul9.i = mul i8 %6, %3
  %conv10.i = select i1 %5, i8 %3, i8 0
  %xor11.i = xor i8 %conv10.i, %mul9.i
  %7 = and i8 %xor1.i, 4
  %mul16.i = mul i8 %7, %3
  %xor18.i = xor i8 %mul16.i, %xor11.i
  %8 = and i8 %xor1.i, 8
  %mul23.i = mul i8 %8, %3
  %xor25.i = xor i8 %mul23.i, %xor18.i
  %9 = lshr i8 %xor25.i, 4
  %10 = lshr i8 %xor25.i, 3
  %11 = and i8 %10, 14
  %12 = xor i8 %9, %11
  %xor25.masked.i = and i8 %xor25.i, 15
  %13 = xor i8 %12, %xor25.masked.i
  %xor1.i.i = xor i8 %13, %ret.0.i2
  %inc.i = add nuw nsw i32 %i.0.i4, 1
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %b.addr.0.i3, i32 1
  %exitcond.i.not = icmp eq i32 %inc.i, %1
  br i1 %exitcond.i.not, label %for.cond.i.lincomb.24.exit_crit_edge, label %for.body.i, !llvm.loop !5

for.cond.i.lincomb.24.exit_crit_edge:             ; preds = %for.body.i
  %split = phi i8 [ %xor1.i.i, %for.body.i ]
  br label %lincomb.24.exit

lincomb.24.exit:                                  ; preds = %for.cond.i.lincomb.24.exit_crit_edge, %for.body3
  %ret.0.i.lcssa = phi i8 [ %split, %for.cond.i.lincomb.24.exit_crit_edge ], [ 0, %for.body3 ]
  store i8 %ret.0.i.lcssa, ptr %c.addr.08, align 1
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %c.addr.08, i32 1
  br label %for.inc4

for.inc4:                                         ; preds = %lincomb.24.exit
  %c.addr.1.lcssa = phi ptr [ %incdec.ptr, %lincomb.24.exit ]
  %inc5 = add nuw nsw i32 %i.07, 1
  %add.ptr6 = getelementptr inbounds i8, ptr %a.addr.09, i32 %colrow_ab
  %exitcond.not = icmp eq i32 %inc5, %0
  br i1 %exitcond.not, label %for.cond.for.end7_crit_edge, label %for.cond1.preheader, !llvm.loop !7

for.cond.for.end7_crit_edge:                      ; preds = %for.inc4
  br label %for.end7

for.end7:                                         ; preds = %for.cond.for.end7_crit_edge, %entry
  ret void
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #1 {
entry:
  %A = alloca [6480 x i8], align 16
  call void @mayo_memset(ptr %A, i8 0, i32 6480)
  %r = alloca [81 x i8], align 16
  call void @mayo_memset(ptr %r, i8 0, i32 81)
  %Ar = alloca [78 x i8], align 16
  call void @mayo_memset(ptr %Ar, i8 0, i32 78)
  call fastcc void @mat_mul.21(ptr nonnull %A, ptr nonnull %r, ptr %Ar, i32 81, i32 78, i32 1)
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #2

; Function Attrs: nounwind
define dso_local void @mayo_memset(ptr noundef %dst, i8 noundef zeroext %val, i32 noundef %len) local_unnamed_addr #3 {
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
  br label %for.cond, !llvm.loop !8

for.end:                                          ; preds = %for.cond
  ret void
}

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
  br label %for.cond, !llvm.loop !9

for.end:                                          ; preds = %for.cond
  ret void
}

attributes #0 = { inlinehint nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #1 = { inlinehint }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
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
