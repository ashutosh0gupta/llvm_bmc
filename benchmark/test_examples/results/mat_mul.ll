; ModuleID = '../mayo_IR/mayo1.ll'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

@pqmayo_MAYO_1_ref_unsigned_char_blocker = dso_local global i8 0, align 1

; Function Attrs: inlinehint nounwind
define dso_local fastcc void @mat_mul(ptr noundef nonnull %a, ptr noundef nonnull %b, ptr noundef nonnull %c, i32 noundef %colrow_ab, i32 noundef %row_a, i32 noundef %col_b) unnamed_addr #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.inc4
  %a.addr.07 = phi ptr [ %a, %entry ], [ %add.ptr6, %for.inc4 ]
  %c.addr.06 = phi ptr [ %c, %entry ], [ %c.addr.1.lcssa, %for.inc4 ]
  %i.05 = phi i32 [ 0, %entry ], [ %inc5, %for.inc4 ]
  br label %for.cond.i.preheader

for.cond.i.preheader:                             ; preds = %for.cond1.preheader
  br label %for.body.i

for.body.i:                                       ; preds = %for.cond.i.preheader, %for.body.i
  %i.0.i3 = phi i32 [ 0, %for.cond.i.preheader ], [ %inc.i, %for.body.i ]
  %b.addr.0.i2 = phi ptr [ %b, %for.cond.i.preheader ], [ %add.ptr.i, %for.body.i ]
  %ret.0.i1 = phi i8 [ 0, %for.cond.i.preheader ], [ %xor1.i.i, %for.body.i ]
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %a.addr.07, i32 %i.0.i3
  %0 = load i8, ptr %arrayidx.i, align 1
  %1 = load i8, ptr %b.addr.0.i2, align 1
  %2 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1
  %xor1.i = xor i8 %0, %2
  %3 = trunc i8 %xor1.i to i1
  %4 = and i8 %xor1.i, 2
  %mul9.i = mul i8 %4, %1
  %conv10.i = select i1 %3, i8 %1, i8 0
  %xor11.i = xor i8 %conv10.i, %mul9.i
  %5 = and i8 %xor1.i, 4
  %mul16.i = mul i8 %5, %1
  %xor18.i = xor i8 %mul16.i, %xor11.i
  %6 = and i8 %xor1.i, 8
  %mul23.i = mul i8 %6, %1
  %xor25.i = xor i8 %mul23.i, %xor18.i
  %7 = lshr i8 %xor25.i, 4
  %8 = lshr i8 %xor25.i, 3
  %9 = and i8 %8, 14
  %10 = xor i8 %7, %9
  %xor25.masked.i = and i8 %xor25.i, 15
  %11 = xor i8 %10, %xor25.masked.i
  %xor1.i.i = xor i8 %11, %ret.0.i1
  %inc.i = add nuw nsw i32 %i.0.i3, 1
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %b.addr.0.i2, i32 1
  %exitcond.i.not = icmp eq i32 %inc.i, 8
  br i1 %exitcond.i.not, label %lincomb.exit, label %for.body.i, !llvm.loop !5

lincomb.exit:                                     ; preds = %for.body.i
  %ret.0.i.lcssa = phi i8 [ %xor1.i.i, %for.body.i ]
  store i8 %ret.0.i.lcssa, ptr %c.addr.06, align 1
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %c.addr.06, i32 1
  br label %for.inc4

for.inc4:                                         ; preds = %lincomb.exit
  %c.addr.1.lcssa = phi ptr [ %incdec.ptr, %lincomb.exit ]
  %inc5 = add nuw nsw i32 %i.05, 1
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %a.addr.07, i32 8
  %exitcond.not = icmp eq i32 %inc5, 78
  br i1 %exitcond.not, label %for.end7, label %for.cond1.preheader, !llvm.loop !7

for.end7:                                         ; preds = %for.inc4
  ret void
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #1 {
entry:
  %sk = alloca [18603 x i64], align 16
  call void @mayo_memset(ptr %sk, i8 0, i32 148824)
  %x = alloca [860 x i8], align 16
  call void @mayo_memset(ptr %x, i8 0, i32 860)
  %Ox = alloca [78 x i8], align 16
  call void @mayo_memset(ptr %Ox, i8 0, i32 78)
  call fastcc void @mat_mul(ptr %sk, ptr %x, ptr %Ox, i32 8, i32 78, i32 1)
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
  br label %for.cond, !llvm.loop !8

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
  br label %for.cond, !llvm.loop !9

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
