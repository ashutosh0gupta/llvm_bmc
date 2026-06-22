; ModuleID = 'mayo_IR/mayo1.ll'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

; Function Attrs: inlinehint nounwind
define dso_local fastcc void @vec_mul_add_u64(i32 noundef range(i32 -134217727, 134217728) %legs, ptr noundef nonnull %in, i8 noundef zeroext range(i8 0, 16) %a, ptr noundef nonnull %acc) unnamed_addr #0 {
entry:
  %conv.i = zext nneg i8 %a to i32
  %mul.i = mul nuw nsw i32 %conv.i, 134480385
  %and.i = and i32 %mul.i, 1894838512
  %shr.i = lshr exact i32 %and.i, 4
  %shr1.i = lshr exact i32 %and.i, 3
  %0 = xor i32 %shr.i, %shr1.i
  %xor2.i = xor i32 %0, %mul.i
  %1 = call i32 @llvm.smax.i32(i32 %legs, i32 0)
  %exitcond.not1 = icmp eq i32 0, %1
  br i1 %exitcond.not1, label %for.end, label %for.body.lr.ph

for.body.lr.ph:                                   ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %i.02 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %arrayidx = getelementptr inbounds nuw i64, ptr %in, i32 %i.02
  %2 = load i64, ptr %arrayidx, align 8
  %and = and i64 %2, 1229782938247303441
  %and1 = and i32 %xor2.i, 255
  %conv = zext nneg i32 %and1 to i64
  %mul = mul i64 %and, %conv
  %shr = lshr i64 %2, 1
  %and3 = and i64 %shr, 1229782938247303441
  %shr4 = lshr i32 %xor2.i, 8
  %and5 = and i32 %shr4, 15
  %conv6 = zext nneg i32 %and5 to i64
  %mul7 = mul nuw i64 %and3, %conv6
  %xor = xor i64 %mul, %mul7
  %arrayidx8 = getelementptr inbounds nuw i64, ptr %in, i32 %i.02
  %3 = load i64, ptr %arrayidx8, align 8
  %shr9 = lshr i64 %3, 2
  %and10 = and i64 %shr9, 1229782938247303441
  %shr11 = lshr i32 %xor2.i, 16
  %and12 = and i32 %shr11, 15
  %conv13 = zext nneg i32 %and12 to i64
  %mul14 = mul nuw i64 %and10, %conv13
  %xor15 = xor i64 %xor, %mul14
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %in, i32 %i.02
  %4 = load i64, ptr %arrayidx16, align 8
  %shr17 = lshr i64 %4, 3
  %and18 = and i64 %shr17, 1229782938247303441
  %shr19 = lshr i32 %xor2.i, 24
  %and20 = and i32 %shr19, 15
  %conv21 = zext nneg i32 %and20 to i64
  %mul22 = mul nuw i64 %and18, %conv21
  %xor23 = xor i64 %xor15, %mul22
  %arrayidx24 = getelementptr inbounds nuw i64, ptr %acc, i32 %i.02
  %5 = load i64, ptr %arrayidx24, align 8
  %xor25 = xor i64 %5, %xor23
  store i64 %xor25, ptr %arrayidx24, align 8
  %inc = add nuw nsw i32 %i.02, 1
  %exitcond.not = icmp eq i32 %inc, %1
  br i1 %exitcond.not, label %for.cond.for.end_crit_edge, label %for.body, !llvm.loop !5

for.cond.for.end_crit_edge:                       ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %entry
  ret void
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #1 {
entry:
  %_pivot_row = alloca [6 x i64], align 16
  call void @mayo_memset(ptr %_pivot_row, i8 0, i32 48)
  %_pivot_row2 = alloca [6 x i64], align 16
  call void @mayo_memset(ptr %_pivot_row2, i8 0, i32 48)
  call fastcc void @vec_mul_add_u64(i32 6, ptr %_pivot_row, i8 0, ptr %_pivot_row2)
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
  br label %for.cond, !llvm.loop !7

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
  br label %for.cond, !llvm.loop !8

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
