; ModuleID = '../mayo_IR/mayo1.ll'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

%struct.shake128incctx = type { ptr }

@Rcon = internal unnamed_addr constant [10 x i8] c"\01\02\04\08\10 @\80\1B6", align 1

declare dso_local void @free(ptr noundef) local_unnamed_addr #0

; Function Attrs: inlinehint nounwind
define dso_local void @mayo_memset(ptr noundef %dst, i8 noundef zeroext %val, i32 noundef %len) local_unnamed_addr #1 {
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
define dso_local fastcc void @expand_P1_P2(ptr noundef %p, ptr noundef %P, ptr noundef %seed_pk) unnamed_addr #1 {
entry:
  %q.i.i = alloca [8 x i64], align 8
  %skey.i = alloca [60 x i32], align 4
  %q.i841 = alloca [8 x i64], align 8
  %w.i63 = alloca [16 x i32], align 4
  %q.i64 = alloca [8 x i64], align 8
  %w.i = alloca [16 x i32], align 4
  %q.i = alloca [8 x i64], align 8
  %ivw.i = alloca [16 x i32], align 4
  %tmp.i10 = alloca [64 x i8], align 1
  %skey.i.i = alloca [22 x i64], align 8
  %ctx.i = alloca %struct.shake128incctx, align 4
  %iv.i = alloca [16 x i8], align 1
  %tmp.i = alloca [5 x i64], align 8
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %ctx.i)
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %iv.i)
  br label %for.body.i.i5

for.body.i.i5:                                    ; preds = %entry, %for.body.i.i5
  %i.0.i.i21137 = phi i32 [ 0, %entry ], [ %inc.i.i7, %for.body.i.i5 ]
  %arrayidx.i.i6 = getelementptr inbounds nuw i8, ptr %iv.i, i32 %i.0.i.i21137
  store i8 0, ptr %arrayidx.i.i6, align 1
  %inc.i.i7 = add nuw nsw i32 %i.0.i.i21137, 1
  %exitcond.i.i3.not = icmp eq i32 %inc.i.i7, 16
  br i1 %exitcond.i.i3.not, label %mayo_memset.exit.i4, label %for.body.i.i5, !llvm.loop !7

mayo_memset.exit.i4:                              ; preds = %for.body.i.i5
  call void @llvm.lifetime.start.p0(i64 176, ptr nonnull %skey.i.i)
  %call.i.i = call dereferenceable_or_null(704) ptr @malloc(i32 noundef 704) #7
  store ptr %call.i.i, ptr %ctx.i, align 4
  %cmp.i.i = icmp eq ptr %call.i.i, null
  br i1 %cmp.i.i, label %if.then.i.i, label %AES_128_CTR.exit

if.then.i.i:                                      ; preds = %mayo_memset.exit.i4
  call void @exit(i32 noundef 111) #8
  br label %AES_128_CTR.exit

AES_128_CTR.exit:                                 ; preds = %mayo_memset.exit.i4, %if.then.i.i
  call void @llvm.lifetime.start.p0(i64 240, ptr nonnull %skey.i)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %q.i841)
  br label %while.body.i.i847

while.body.i.i847:                                ; preds = %AES_128_CTR.exit, %while.body.i.i847
  %v.addr.0.i.i8451140 = phi ptr [ %skey.i, %AES_128_CTR.exit ], [ %incdec.ptr.i.i861, %while.body.i.i847 ]
  %num.addr.0.i.i8441139 = phi i32 [ 4, %AES_128_CTR.exit ], [ %dec.i.i848, %while.body.i.i847 ]
  %src.addr.0.i.i8431138 = phi ptr [ %seed_pk, %AES_128_CTR.exit ], [ %add.ptr.i.i862, %while.body.i.i847 ]
  %dec.i.i848 = add nsw i32 %num.addr.0.i.i8441139, -1
  %0 = load i8, ptr %src.addr.0.i.i8431138, align 1
  %conv.i6.i = zext i8 %0 to i32
  %arrayidx1.i.i849 = getelementptr inbounds nuw i8, ptr %src.addr.0.i.i8431138, i32 1
  %1 = load i8, ptr %arrayidx1.i.i849, align 1
  %conv2.i.i850 = zext i8 %1 to i32
  %shl.i.i851 = shl nuw nsw i32 %conv2.i.i850, 8
  %or.i.i852 = or disjoint i32 %shl.i.i851, %conv.i6.i
  %arrayidx3.i.i853 = getelementptr inbounds nuw i8, ptr %src.addr.0.i.i8431138, i32 2
  %2 = load i8, ptr %arrayidx3.i.i853, align 1
  %conv4.i.i854 = zext i8 %2 to i32
  %shl5.i.i855 = shl nuw nsw i32 %conv4.i.i854, 16
  %or6.i.i856 = or disjoint i32 %or.i.i852, %shl5.i.i855
  %arrayidx7.i.i857 = getelementptr inbounds nuw i8, ptr %src.addr.0.i.i8431138, i32 3
  %3 = load i8, ptr %arrayidx7.i.i857, align 1
  %conv8.i.i858 = zext i8 %3 to i32
  %shl9.i.i859 = shl nuw i32 %conv8.i.i858, 24
  %or10.i.i860 = or disjoint i32 %or6.i.i856, %shl9.i.i859
  %incdec.ptr.i.i861 = getelementptr inbounds nuw i8, ptr %v.addr.0.i.i8451140, i32 4
  store i32 %or10.i.i860, ptr %v.addr.0.i.i8451140, align 4
  %add.ptr.i.i862 = getelementptr inbounds nuw i8, ptr %src.addr.0.i.i8431138, i32 4
  %cmp.not.i.i846 = icmp eq i32 %dec.i.i848, 0
  br i1 %cmp.not.i.i846, label %br_range_dec32le.exit.i863, label %while.body.i.i847, !llvm.loop !8

br_range_dec32le.exit.i863:                       ; preds = %while.body.i.i847
  %arrayidx.i864 = getelementptr inbounds nuw i8, ptr %skey.i, i32 12
  %4 = load i32, ptr %arrayidx.i864, align 4
  br label %for.body.i1016

for.cond27.i.preheader:                           ; preds = %if.end16.i
  br label %for.body30.i

for.body.i1016:                                   ; preds = %br_range_dec32le.exit.i863, %if.end16.i
  %tmp.0.i1144 = phi i32 [ %4, %br_range_dec32le.exit.i863 ], [ %xor19.i, %if.end16.i ]
  %k.0.i1143 = phi i32 [ 0, %br_range_dec32le.exit.i863 ], [ %spec.select1.i, %if.end16.i ]
  %j.0.i1142 = phi i32 [ 0, %br_range_dec32le.exit.i863 ], [ %spec.select.i, %if.end16.i ]
  %i.0.i8661141 = phi i32 [ 4, %br_range_dec32le.exit.i863 ], [ %inc26.i, %if.end16.i ]
  %cmp6.i = icmp eq i32 %j.0.i1142, 0
  br i1 %cmp6.i, label %if.then.i1134, label %if.end16.i

if.then.i1134:                                    ; preds = %for.body.i1016
  %5 = call i32 @llvm.fshl.i32(i32 %tmp.0.i1144, i32 %tmp.0.i1144, i32 24)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %q.i.i)
  %call.i.i1135 = call ptr @memset(ptr noundef nonnull %q.i.i, i32 noundef 0, i32 noundef 64) #8
  %conv.i.i1136 = zext i32 %5 to i64
  store i64 %conv.i.i1136, ptr %q.i.i, align 8
  %arrayidx1.i155.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  %6 = load i64, ptr %arrayidx1.i155.i, align 8
  %and.i156.i = and i64 %conv.i.i1136, 1431655765
  %and2.i157.i = shl i64 %6, 1
  %shl.i158.i = and i64 %and2.i157.i, -6148914691236517206
  %or.i159.i = or disjoint i64 %and.i156.i, %shl.i158.i
  store i64 %or.i159.i, ptr %q.i.i, align 8
  %and4.i160.i = lshr i64 %conv.i.i1136, 1
  %shr.i161.i = and i64 %and4.i160.i, 1431655765
  %and5.i162.i = and i64 %6, -6148914691236517206
  %or6.i163.i = or disjoint i64 %shr.i161.i, %and5.i162.i
  %arrayidx7.i164.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  store i64 %or6.i163.i, ptr %arrayidx7.i164.i, align 8
  %arrayidx11.i165.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  %7 = load i64, ptr %arrayidx11.i165.i, align 8
  %arrayidx12.i166.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  %8 = load i64, ptr %arrayidx12.i166.i, align 8
  %and13.i167.i = and i64 %7, 6148914691236517205
  %and14.i168.i = shl i64 %8, 1
  %shl15.i169.i = and i64 %and14.i168.i, -6148914691236517206
  %or16.i170.i = or disjoint i64 %and13.i167.i, %shl15.i169.i
  %arrayidx17.i171.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  store i64 %or16.i170.i, ptr %arrayidx17.i171.i, align 8
  %and18.i172.i = lshr i64 %7, 1
  %shr19.i173.i = and i64 %and18.i172.i, 6148914691236517205
  %and20.i174.i = and i64 %8, -6148914691236517206
  %or21.i175.i = or disjoint i64 %shr19.i173.i, %and20.i174.i
  %arrayidx22.i176.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  store i64 %or21.i175.i, ptr %arrayidx22.i176.i, align 8
  %arrayidx27.i177.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  %9 = load i64, ptr %arrayidx27.i177.i, align 8
  %arrayidx28.i178.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  %10 = load i64, ptr %arrayidx28.i178.i, align 8
  %and29.i179.i = and i64 %9, 6148914691236517205
  %and30.i180.i = shl i64 %10, 1
  %shl31.i181.i = and i64 %and30.i180.i, -6148914691236517206
  %or32.i182.i = or disjoint i64 %and29.i179.i, %shl31.i181.i
  %arrayidx33.i183.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  store i64 %or32.i182.i, ptr %arrayidx33.i183.i, align 8
  %and34.i184.i = lshr i64 %9, 1
  %shr35.i185.i = and i64 %and34.i184.i, 6148914691236517205
  %and36.i186.i = and i64 %10, -6148914691236517206
  %or37.i187.i = or disjoint i64 %shr35.i185.i, %and36.i186.i
  %arrayidx38.i188.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  store i64 %or37.i187.i, ptr %arrayidx38.i188.i, align 8
  %arrayidx43.i189.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  %11 = load i64, ptr %arrayidx43.i189.i, align 8
  %arrayidx44.i190.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  %12 = load i64, ptr %arrayidx44.i190.i, align 8
  %and45.i191.i = and i64 %11, 6148914691236517205
  %and46.i192.i = shl i64 %12, 1
  %shl47.i193.i = and i64 %and46.i192.i, -6148914691236517206
  %or48.i194.i = or disjoint i64 %and45.i191.i, %shl47.i193.i
  %arrayidx49.i195.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  store i64 %or48.i194.i, ptr %arrayidx49.i195.i, align 8
  %and50.i196.i = lshr i64 %11, 1
  %shr51.i197.i = and i64 %and50.i196.i, 6148914691236517205
  %and52.i198.i = and i64 %12, -6148914691236517206
  %or53.i199.i = or disjoint i64 %shr51.i197.i, %and52.i198.i
  %arrayidx54.i200.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  store i64 %or53.i199.i, ptr %arrayidx54.i200.i, align 8
  %13 = load i64, ptr %q.i.i, align 8
  %arrayidx60.i201.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  %14 = load i64, ptr %arrayidx60.i201.i, align 8
  %and61.i202.i = and i64 %13, 3689348814741910323
  %and62.i203.i = shl i64 %14, 2
  %shl63.i204.i = and i64 %and62.i203.i, -3689348814741910324
  %or64.i205.i = or disjoint i64 %and61.i202.i, %shl63.i204.i
  store i64 %or64.i205.i, ptr %q.i.i, align 8
  %and66.i206.i = lshr i64 %13, 2
  %shr67.i207.i = and i64 %and66.i206.i, 3689348814741910323
  %and68.i208.i = and i64 %14, -3689348814741910324
  %or69.i209.i = or disjoint i64 %shr67.i207.i, %and68.i208.i
  %arrayidx70.i210.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  store i64 %or69.i209.i, ptr %arrayidx70.i210.i, align 8
  %arrayidx75.i211.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  %15 = load i64, ptr %arrayidx75.i211.i, align 8
  %arrayidx76.i212.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  %16 = load i64, ptr %arrayidx76.i212.i, align 8
  %and77.i213.i = and i64 %15, 3689348814741910323
  %and78.i214.i = shl i64 %16, 2
  %shl79.i215.i = and i64 %and78.i214.i, -3689348814741910324
  %or80.i216.i = or disjoint i64 %and77.i213.i, %shl79.i215.i
  %arrayidx81.i217.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  store i64 %or80.i216.i, ptr %arrayidx81.i217.i, align 8
  %and82.i218.i = lshr i64 %15, 2
  %shr83.i219.i = and i64 %and82.i218.i, 3689348814741910323
  %and84.i220.i = and i64 %16, -3689348814741910324
  %or85.i221.i = or disjoint i64 %shr83.i219.i, %and84.i220.i
  %arrayidx86.i222.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  store i64 %or85.i221.i, ptr %arrayidx86.i222.i, align 8
  %arrayidx91.i223.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  %17 = load i64, ptr %arrayidx91.i223.i, align 8
  %arrayidx92.i224.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  %18 = load i64, ptr %arrayidx92.i224.i, align 8
  %and93.i225.i = and i64 %17, 3689348814741910323
  %and94.i226.i = shl i64 %18, 2
  %shl95.i227.i = and i64 %and94.i226.i, -3689348814741910324
  %or96.i228.i = or disjoint i64 %and93.i225.i, %shl95.i227.i
  %arrayidx97.i229.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  store i64 %or96.i228.i, ptr %arrayidx97.i229.i, align 8
  %and98.i230.i = lshr i64 %17, 2
  %shr99.i231.i = and i64 %and98.i230.i, 3689348814741910323
  %and100.i232.i = and i64 %18, -3689348814741910324
  %or101.i233.i = or disjoint i64 %shr99.i231.i, %and100.i232.i
  %arrayidx102.i234.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  store i64 %or101.i233.i, ptr %arrayidx102.i234.i, align 8
  %arrayidx107.i235.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  %19 = load i64, ptr %arrayidx107.i235.i, align 8
  %arrayidx108.i236.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  %20 = load i64, ptr %arrayidx108.i236.i, align 8
  %and109.i237.i = and i64 %19, 3689348814741910323
  %and110.i238.i = shl i64 %20, 2
  %shl111.i239.i = and i64 %and110.i238.i, -3689348814741910324
  %or112.i240.i = or disjoint i64 %and109.i237.i, %shl111.i239.i
  %arrayidx113.i241.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  store i64 %or112.i240.i, ptr %arrayidx113.i241.i, align 8
  %and114.i242.i = lshr i64 %19, 2
  %shr115.i243.i = and i64 %and114.i242.i, 3689348814741910323
  %and116.i244.i = and i64 %20, -3689348814741910324
  %or117.i245.i = or disjoint i64 %shr115.i243.i, %and116.i244.i
  %arrayidx118.i246.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  store i64 %or117.i245.i, ptr %arrayidx118.i246.i, align 8
  %21 = load i64, ptr %q.i.i, align 8
  %arrayidx124.i247.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  %22 = load i64, ptr %arrayidx124.i247.i, align 8
  %and125.i248.i = and i64 %21, 1085102592571150095
  %and126.i249.i = shl i64 %22, 4
  %shl127.i250.i = and i64 %and126.i249.i, -1085102592571150096
  %or128.i251.i = or disjoint i64 %and125.i248.i, %shl127.i250.i
  store i64 %or128.i251.i, ptr %q.i.i, align 8
  %and130.i252.i = lshr i64 %21, 4
  %shr131.i253.i = and i64 %and130.i252.i, 1085102592571150095
  %and132.i254.i = and i64 %22, -1085102592571150096
  %or133.i255.i = or disjoint i64 %shr131.i253.i, %and132.i254.i
  %arrayidx134.i256.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  store i64 %or133.i255.i, ptr %arrayidx134.i256.i, align 8
  %arrayidx139.i257.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  %23 = load i64, ptr %arrayidx139.i257.i, align 8
  %arrayidx140.i258.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  %24 = load i64, ptr %arrayidx140.i258.i, align 8
  %and141.i259.i = and i64 %23, 1085102592571150095
  %and142.i260.i = shl i64 %24, 4
  %shl143.i261.i = and i64 %and142.i260.i, -1085102592571150096
  %or144.i262.i = or disjoint i64 %and141.i259.i, %shl143.i261.i
  %arrayidx145.i263.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  store i64 %or144.i262.i, ptr %arrayidx145.i263.i, align 8
  %and146.i264.i = lshr i64 %23, 4
  %shr147.i265.i = and i64 %and146.i264.i, 1085102592571150095
  %and148.i266.i = and i64 %24, -1085102592571150096
  %or149.i267.i = or disjoint i64 %shr147.i265.i, %and148.i266.i
  %arrayidx150.i268.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  store i64 %or149.i267.i, ptr %arrayidx150.i268.i, align 8
  %arrayidx155.i269.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  %25 = load i64, ptr %arrayidx155.i269.i, align 8
  %arrayidx156.i270.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  %26 = load i64, ptr %arrayidx156.i270.i, align 8
  %and157.i271.i = and i64 %25, 1085102592571150095
  %and158.i272.i = shl i64 %26, 4
  %shl159.i273.i = and i64 %and158.i272.i, -1085102592571150096
  %or160.i274.i = or disjoint i64 %and157.i271.i, %shl159.i273.i
  %arrayidx161.i275.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  store i64 %or160.i274.i, ptr %arrayidx161.i275.i, align 8
  %and162.i276.i = lshr i64 %25, 4
  %shr163.i277.i = and i64 %and162.i276.i, 1085102592571150095
  %and164.i278.i = and i64 %26, -1085102592571150096
  %or165.i279.i = or disjoint i64 %shr163.i277.i, %and164.i278.i
  %arrayidx166.i280.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  store i64 %or165.i279.i, ptr %arrayidx166.i280.i, align 8
  %arrayidx171.i281.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  %27 = load i64, ptr %arrayidx171.i281.i, align 8
  %arrayidx172.i282.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  %28 = load i64, ptr %arrayidx172.i282.i, align 8
  %and173.i283.i = and i64 %27, 1085102592571150095
  %and174.i284.i = shl i64 %28, 4
  %shl175.i285.i = and i64 %and174.i284.i, -1085102592571150096
  %or176.i286.i = or disjoint i64 %and173.i283.i, %shl175.i285.i
  %arrayidx177.i287.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  store i64 %or176.i286.i, ptr %arrayidx177.i287.i, align 8
  %and178.i288.i = lshr i64 %27, 4
  %shr179.i289.i = and i64 %and178.i288.i, 1085102592571150095
  %and180.i290.i = and i64 %28, -1085102592571150096
  %or181.i291.i = or disjoint i64 %shr179.i289.i, %and180.i290.i
  %arrayidx182.i292.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  store i64 %or181.i291.i, ptr %arrayidx182.i292.i, align 8
  %arrayidx1.i21.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  %29 = load i64, ptr %arrayidx1.i21.i, align 8
  %arrayidx2.i22.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  %30 = load i64, ptr %arrayidx2.i22.i, align 8
  %arrayidx3.i23.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  %31 = load i64, ptr %arrayidx3.i23.i, align 8
  %arrayidx4.i24.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  %32 = load i64, ptr %arrayidx4.i24.i, align 8
  %arrayidx5.i25.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  %33 = load i64, ptr %arrayidx5.i25.i, align 8
  %arrayidx6.i26.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  %34 = load i64, ptr %arrayidx6.i26.i, align 8
  %35 = load i64, ptr %q.i.i, align 8
  %xor.i27.i = xor i64 %31, %33
  %xor8.i28.i = xor i64 %or181.i291.i, %34
  %xor9.i29.i = xor i64 %or181.i291.i, %31
  %xor10.i30.i = xor i64 %or181.i291.i, %33
  %xor11.i31.i = xor i64 %29, %30
  %xor12.i32.i = xor i64 %xor11.i31.i, %35
  %xor13.i33.i = xor i64 %xor12.i32.i, %31
  %xor14.i34.i = xor i64 %xor8.i28.i, %xor.i27.i
  %xor15.i35.i = xor i64 %xor12.i32.i, %or181.i291.i
  %xor16.i36.i = xor i64 %xor12.i32.i, %34
  %xor17.i37.i = xor i64 %xor16.i36.i, %xor10.i30.i
  %xor18.i38.i = xor i64 %32, %xor14.i34.i
  %xor19.i39.i = xor i64 %xor18.i38.i, %33
  %xor20.i40.i = xor i64 %xor18.i38.i, %29
  %xor21.i41.i = xor i64 %xor19.i39.i, %35
  %xor22.i42.i = xor i64 %xor19.i39.i, %xor11.i31.i
  %xor23.i43.i = xor i64 %xor20.i40.i, %xor9.i29.i
  %xor24.i44.i = xor i64 %35, %xor23.i43.i
  %xor25.i45.i = xor i64 %xor22.i42.i, %xor23.i43.i
  %xor27.i46.i = xor i64 %xor11.i31.i, %xor23.i43.i
  %and.i47.i = and i64 %xor14.i34.i, %xor19.i39.i
  %and30.i48.i = and i64 %xor17.i37.i, %xor21.i41.i
  %xor31.i49.i = xor i64 %and30.i48.i, %and.i47.i
  %and32.i50.i = and i64 %xor13.i33.i, %35
  %and34.i51.i = and i64 %xor8.i28.i, %xor27.i46.i
  %and35.i52.i = and i64 %xor16.i36.i, %xor12.i32.i
  %and37.i53.i = and i64 %xor15.i35.i, %xor24.i44.i
  %and39.i54.i = and i64 %xor9.i29.i, %xor23.i43.i
  %and40.i55.i = and i64 %xor.i27.i, %xor25.i45.i
  %xor41.i56.i = xor i64 %and40.i55.i, %and39.i54.i
  %and42.i57.i = and i64 %xor10.i30.i, %xor22.i42.i
  %xor43.i58.i = xor i64 %and42.i57.i, %and39.i54.i
  %xor44.i59.i = xor i64 %xor31.i49.i, %xor41.i56.i
  %xor48.i60.i = xor i64 %xor44.i59.i, %xor20.i40.i
  %36 = xor i64 %xor10.i30.i, %and32.i50.i
  %37 = xor i64 %36, %xor22.i42.i
  %38 = xor i64 %37, %and.i47.i
  %xor49.i61.i = xor i64 %38, %xor43.i58.i
  %39 = xor i64 %xor27.i46.i, %and35.i52.i
  %40 = xor i64 %39, %xor8.i28.i
  %41 = xor i64 %40, %and34.i51.i
  %xor50.i62.i = xor i64 %41, %xor41.i56.i
  %42 = xor i64 %xor27.i46.i, %and37.i53.i
  %43 = xor i64 %42, %or181.i291.i
  %44 = xor i64 %43, %and34.i51.i
  %xor51.i63.i = xor i64 %44, %xor43.i58.i
  %xor52.i64.i = xor i64 %xor48.i60.i, %xor49.i61.i
  %and53.i65.i = and i64 %xor48.i60.i, %xor50.i62.i
  %xor54.i66.i = xor i64 %xor51.i63.i, %and53.i65.i
  %and55.i67.i = and i64 %xor52.i64.i, %xor54.i66.i
  %xor56.i68.i = xor i64 %and55.i67.i, %xor49.i61.i
  %xor57.i69.i = xor i64 %xor50.i62.i, %xor51.i63.i
  %xor58.i70.i = xor i64 %xor49.i61.i, %and53.i65.i
  %and59.i71.i = and i64 %xor58.i70.i, %xor57.i69.i
  %xor60.i72.i = xor i64 %and59.i71.i, %xor51.i63.i
  %xor61.i73.i = xor i64 %xor50.i62.i, %xor60.i72.i
  %xor62.i74.i = xor i64 %and59.i71.i, %and53.i65.i
  %and63.i75.i = and i64 %xor51.i63.i, %xor62.i74.i
  %xor64.i76.i = xor i64 %and63.i75.i, %xor61.i73.i
  %xor65.i77.i = xor i64 %xor54.i66.i, %and63.i75.i
  %and66.i78.i = and i64 %xor56.i68.i, %xor65.i77.i
  %xor67.i79.i = xor i64 %xor52.i64.i, %and66.i78.i
  %xor68.i80.i = xor i64 %xor67.i79.i, %xor64.i76.i
  %xor69.i81.i = xor i64 %xor56.i68.i, %xor60.i72.i
  %xor70.i82.i = xor i64 %xor56.i68.i, %xor67.i79.i
  %xor71.i83.i = xor i64 %and63.i75.i, %xor50.i62.i
  %xor72.i84.i = xor i64 %xor69.i81.i, %xor68.i80.i
  %and73.i85.i = and i64 %xor71.i83.i, %xor19.i39.i
  %and74.i86.i = and i64 %xor64.i76.i, %xor21.i41.i
  %and75.i87.i = and i64 %xor60.i72.i, %35
  %and76.i88.i = and i64 %xor70.i82.i, %xor27.i46.i
  %and77.i89.i = and i64 %xor67.i79.i, %xor12.i32.i
  %and78.i90.i = and i64 %xor56.i68.i, %xor24.i44.i
  %and79.i91.i = and i64 %xor69.i81.i, %xor23.i43.i
  %and80.i92.i = and i64 %xor72.i84.i, %xor25.i45.i
  %and81.i93.i = and i64 %xor68.i80.i, %xor22.i42.i
  %and82.i94.i = and i64 %xor71.i83.i, %xor14.i34.i
  %and83.i95.i = and i64 %xor64.i76.i, %xor17.i37.i
  %and84.i96.i = and i64 %xor60.i72.i, %xor13.i33.i
  %and85.i97.i = and i64 %xor70.i82.i, %xor8.i28.i
  %and86.i98.i = and i64 %xor67.i79.i, %xor16.i36.i
  %and87.i99.i = and i64 %xor56.i68.i, %xor15.i35.i
  %and88.i100.i = and i64 %xor69.i81.i, %xor9.i29.i
  %and89.i101.i = and i64 %xor72.i84.i, %xor.i27.i
  %and90.i102.i = and i64 %xor68.i80.i, %xor10.i30.i
  %xor91.i103.i = xor i64 %and88.i100.i, %and89.i101.i
  %xor92.i104.i = xor i64 %and83.i95.i, %and84.i96.i
  %xor93.i105.i = xor i64 %and78.i90.i, %and86.i98.i
  %xor94.i106.i = xor i64 %and82.i94.i, %and83.i95.i
  %xor95.i107.i = xor i64 %and75.i87.i, %and85.i97.i
  %xor96.i108.i = xor i64 %and75.i87.i, %and78.i90.i
  %xor97.i109.i = xor i64 %and80.i92.i, %and81.i93.i
  %xor98.i110.i = xor i64 %and73.i85.i, %and76.i88.i
  %xor99.i111.i = xor i64 %and79.i91.i, %and80.i92.i
  %xor100.i112.i = xor i64 %and89.i101.i, %and90.i102.i
  %xor101.i113.i = xor i64 %and85.i97.i, %xor93.i105.i
  %xor102.i114.i = xor i64 %xor95.i107.i, %xor98.i110.i
  %xor103.i115.i = xor i64 %and77.i89.i, %xor91.i103.i
  %xor104.i116.i = xor i64 %and76.i88.i, %xor99.i111.i
  %xor105.i117.i = xor i64 %xor91.i103.i, %xor102.i114.i
  %xor106.i118.i = xor i64 %and87.i99.i, %xor102.i114.i
  %xor107.i119.i = xor i64 %xor97.i109.i, %xor103.i115.i
  %xor108.i120.i = xor i64 %xor94.i106.i, %xor103.i115.i
  %xor109.i121.i = xor i64 %and77.i89.i, %xor104.i116.i
  %xor110.i122.i = xor i64 %xor106.i118.i, %xor107.i119.i
  %xor111.i123.i = xor i64 %and74.i86.i, %xor108.i120.i
  %xor112.i124.i = xor i64 %xor104.i116.i, %xor108.i120.i
  %45 = xor i64 %xor107.i119.i, %xor101.i113.i
  %xor113.i125.i = xor i64 %45, -1
  %46 = xor i64 %xor105.i117.i, %xor93.i105.i
  %xor115.i126.i = xor i64 %46, -1
  %xor117.i127.i = xor i64 %xor98.i110.i, %xor111.i123.i
  %xor118.i128.i = xor i64 %xor96.i108.i, %xor111.i123.i
  %xor119.i129.i = xor i64 %xor92.i104.i, %xor110.i122.i
  %47 = xor i64 %xor117.i127.i, %xor109.i121.i
  %xor121.i130.i = xor i64 %47, -1
  %48 = xor i64 %xor110.i122.i, %xor100.i112.i
  %49 = xor i64 %48, %xor109.i121.i
  %xor123.i131.i = xor i64 %49, -1
  %arrayidx124.i132.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  store i64 %xor112.i124.i, ptr %arrayidx124.i132.i, align 8
  %arrayidx125.i133.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  store i64 %xor121.i130.i, ptr %arrayidx125.i133.i, align 8
  %arrayidx126.i134.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  store i64 %xor123.i131.i, ptr %arrayidx126.i134.i, align 8
  %arrayidx127.i135.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  store i64 %xor117.i127.i, ptr %arrayidx127.i135.i, align 8
  %arrayidx128.i136.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  store i64 %xor118.i128.i, ptr %arrayidx128.i136.i, align 8
  %arrayidx129.i137.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  store i64 %xor119.i129.i, ptr %arrayidx129.i137.i, align 8
  %arrayidx130.i138.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  store i64 %xor113.i125.i, ptr %arrayidx130.i138.i, align 8
  %and.i570.i = and i64 %xor115.i126.i, 6148914691236517205
  %and2.i571.i = shl i64 %xor113.i125.i, 1
  %shl.i572.i = and i64 %and2.i571.i, -6148914691236517206
  %or.i573.i = or disjoint i64 %and.i570.i, %shl.i572.i
  store i64 %or.i573.i, ptr %q.i.i, align 8
  %and4.i574.i = lshr i64 %xor115.i126.i, 1
  %shr.i575.i = and i64 %and4.i574.i, 6148914691236517205
  %and5.i576.i = and i64 %xor113.i125.i, -6148914691236517206
  %or6.i577.i = or disjoint i64 %shr.i575.i, %and5.i576.i
  %arrayidx7.i578.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  store i64 %or6.i577.i, ptr %arrayidx7.i578.i, align 8
  %arrayidx11.i579.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  %50 = load i64, ptr %arrayidx11.i579.i, align 8
  %arrayidx12.i580.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  %51 = load i64, ptr %arrayidx12.i580.i, align 8
  %and13.i581.i = and i64 %50, 6148914691236517205
  %and14.i582.i = shl i64 %51, 1
  %shl15.i583.i = and i64 %and14.i582.i, -6148914691236517206
  %or16.i584.i = or disjoint i64 %and13.i581.i, %shl15.i583.i
  %arrayidx17.i585.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  store i64 %or16.i584.i, ptr %arrayidx17.i585.i, align 8
  %and18.i586.i = lshr i64 %50, 1
  %shr19.i587.i = and i64 %and18.i586.i, 6148914691236517205
  %and20.i588.i = and i64 %51, -6148914691236517206
  %or21.i589.i = or disjoint i64 %shr19.i587.i, %and20.i588.i
  %arrayidx22.i590.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  store i64 %or21.i589.i, ptr %arrayidx22.i590.i, align 8
  %arrayidx27.i591.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  %52 = load i64, ptr %arrayidx27.i591.i, align 8
  %arrayidx28.i592.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  %53 = load i64, ptr %arrayidx28.i592.i, align 8
  %and29.i593.i = and i64 %52, 6148914691236517205
  %and30.i594.i = shl i64 %53, 1
  %shl31.i595.i = and i64 %and30.i594.i, -6148914691236517206
  %or32.i596.i = or disjoint i64 %and29.i593.i, %shl31.i595.i
  %arrayidx33.i597.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  store i64 %or32.i596.i, ptr %arrayidx33.i597.i, align 8
  %and34.i598.i = lshr i64 %52, 1
  %shr35.i599.i = and i64 %and34.i598.i, 6148914691236517205
  %and36.i600.i = and i64 %53, -6148914691236517206
  %or37.i601.i = or disjoint i64 %shr35.i599.i, %and36.i600.i
  %arrayidx38.i602.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  store i64 %or37.i601.i, ptr %arrayidx38.i602.i, align 8
  %arrayidx43.i603.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  %54 = load i64, ptr %arrayidx43.i603.i, align 8
  %arrayidx44.i604.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  %55 = load i64, ptr %arrayidx44.i604.i, align 8
  %and45.i605.i = and i64 %54, 6148914691236517205
  %and46.i606.i = shl i64 %55, 1
  %shl47.i607.i = and i64 %and46.i606.i, -6148914691236517206
  %or48.i608.i = or disjoint i64 %and45.i605.i, %shl47.i607.i
  %arrayidx49.i609.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  store i64 %or48.i608.i, ptr %arrayidx49.i609.i, align 8
  %and50.i610.i = lshr i64 %54, 1
  %shr51.i611.i = and i64 %and50.i610.i, 6148914691236517205
  %and52.i612.i = and i64 %55, -6148914691236517206
  %or53.i613.i = or disjoint i64 %shr51.i611.i, %and52.i612.i
  %arrayidx54.i614.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  store i64 %or53.i613.i, ptr %arrayidx54.i614.i, align 8
  %56 = load i64, ptr %q.i.i, align 8
  %arrayidx60.i615.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  %57 = load i64, ptr %arrayidx60.i615.i, align 8
  %and61.i616.i = and i64 %56, 3689348814741910323
  %and62.i617.i = shl i64 %57, 2
  %shl63.i618.i = and i64 %and62.i617.i, -3689348814741910324
  %or64.i619.i = or disjoint i64 %and61.i616.i, %shl63.i618.i
  store i64 %or64.i619.i, ptr %q.i.i, align 8
  %and66.i620.i = lshr i64 %56, 2
  %shr67.i621.i = and i64 %and66.i620.i, 3689348814741910323
  %and68.i622.i = and i64 %57, -3689348814741910324
  %or69.i623.i = or disjoint i64 %shr67.i621.i, %and68.i622.i
  %arrayidx70.i624.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  store i64 %or69.i623.i, ptr %arrayidx70.i624.i, align 8
  %arrayidx75.i625.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  %58 = load i64, ptr %arrayidx75.i625.i, align 8
  %arrayidx76.i626.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  %59 = load i64, ptr %arrayidx76.i626.i, align 8
  %and77.i627.i = and i64 %58, 3689348814741910323
  %and78.i628.i = shl i64 %59, 2
  %shl79.i629.i = and i64 %and78.i628.i, -3689348814741910324
  %or80.i630.i = or disjoint i64 %and77.i627.i, %shl79.i629.i
  %arrayidx81.i631.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  store i64 %or80.i630.i, ptr %arrayidx81.i631.i, align 8
  %and82.i632.i = lshr i64 %58, 2
  %shr83.i633.i = and i64 %and82.i632.i, 3689348814741910323
  %and84.i634.i = and i64 %59, -3689348814741910324
  %or85.i635.i = or disjoint i64 %shr83.i633.i, %and84.i634.i
  %arrayidx86.i636.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  store i64 %or85.i635.i, ptr %arrayidx86.i636.i, align 8
  %arrayidx91.i637.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  %60 = load i64, ptr %arrayidx91.i637.i, align 8
  %arrayidx92.i638.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  %61 = load i64, ptr %arrayidx92.i638.i, align 8
  %and93.i639.i = and i64 %60, 3689348814741910323
  %and94.i640.i = shl i64 %61, 2
  %shl95.i641.i = and i64 %and94.i640.i, -3689348814741910324
  %or96.i642.i = or disjoint i64 %and93.i639.i, %shl95.i641.i
  %arrayidx97.i643.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  store i64 %or96.i642.i, ptr %arrayidx97.i643.i, align 8
  %and98.i644.i = lshr i64 %60, 2
  %shr99.i645.i = and i64 %and98.i644.i, 3689348814741910323
  %and100.i646.i = and i64 %61, -3689348814741910324
  %or101.i647.i = or disjoint i64 %shr99.i645.i, %and100.i646.i
  %arrayidx102.i648.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  store i64 %or101.i647.i, ptr %arrayidx102.i648.i, align 8
  %arrayidx107.i649.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  %62 = load i64, ptr %arrayidx107.i649.i, align 8
  %arrayidx108.i650.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  %63 = load i64, ptr %arrayidx108.i650.i, align 8
  %and109.i651.i = and i64 %62, 3689348814741910323
  %and110.i652.i = shl i64 %63, 2
  %shl111.i653.i = and i64 %and110.i652.i, -3689348814741910324
  %or112.i654.i = or disjoint i64 %and109.i651.i, %shl111.i653.i
  %arrayidx113.i655.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  store i64 %or112.i654.i, ptr %arrayidx113.i655.i, align 8
  %and114.i656.i = lshr i64 %62, 2
  %shr115.i657.i = and i64 %and114.i656.i, 3689348814741910323
  %and116.i658.i = and i64 %63, -3689348814741910324
  %or117.i659.i = or disjoint i64 %shr115.i657.i, %and116.i658.i
  %arrayidx118.i660.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  store i64 %or117.i659.i, ptr %arrayidx118.i660.i, align 8
  %64 = load i64, ptr %q.i.i, align 8
  %arrayidx124.i661.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  %65 = load i64, ptr %arrayidx124.i661.i, align 8
  %and125.i662.i = and i64 %64, 1085102592571150095
  %and126.i663.i = shl i64 %65, 4
  %shl127.i664.i = and i64 %and126.i663.i, -1085102592571150096
  %or128.i665.i = or disjoint i64 %and125.i662.i, %shl127.i664.i
  store i64 %or128.i665.i, ptr %q.i.i, align 8
  %and130.i666.i = lshr i64 %64, 4
  %shr131.i667.i = and i64 %and130.i666.i, 1085102592571150095
  %and132.i668.i = and i64 %65, -1085102592571150096
  %or133.i669.i = or disjoint i64 %shr131.i667.i, %and132.i668.i
  %arrayidx134.i670.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  store i64 %or133.i669.i, ptr %arrayidx134.i670.i, align 8
  %arrayidx139.i671.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  %66 = load i64, ptr %arrayidx139.i671.i, align 8
  %arrayidx140.i672.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  %67 = load i64, ptr %arrayidx140.i672.i, align 8
  %and141.i673.i = and i64 %66, 1085102592571150095
  %and142.i674.i = shl i64 %67, 4
  %shl143.i675.i = and i64 %and142.i674.i, -1085102592571150096
  %or144.i676.i = or disjoint i64 %and141.i673.i, %shl143.i675.i
  %arrayidx145.i677.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  store i64 %or144.i676.i, ptr %arrayidx145.i677.i, align 8
  %and146.i678.i = lshr i64 %66, 4
  %shr147.i679.i = and i64 %and146.i678.i, 1085102592571150095
  %and148.i680.i = and i64 %67, -1085102592571150096
  %or149.i681.i = or disjoint i64 %shr147.i679.i, %and148.i680.i
  %arrayidx150.i682.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  store i64 %or149.i681.i, ptr %arrayidx150.i682.i, align 8
  %arrayidx155.i683.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  %68 = load i64, ptr %arrayidx155.i683.i, align 8
  %arrayidx156.i684.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  %69 = load i64, ptr %arrayidx156.i684.i, align 8
  %and157.i685.i = and i64 %68, 1085102592571150095
  %and158.i686.i = shl i64 %69, 4
  %shl159.i687.i = and i64 %and158.i686.i, -1085102592571150096
  %or160.i688.i = or disjoint i64 %and157.i685.i, %shl159.i687.i
  %arrayidx161.i689.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  store i64 %or160.i688.i, ptr %arrayidx161.i689.i, align 8
  %and162.i690.i = lshr i64 %68, 4
  %shr163.i691.i = and i64 %and162.i690.i, 1085102592571150095
  %and164.i692.i = and i64 %69, -1085102592571150096
  %or165.i693.i = or disjoint i64 %shr163.i691.i, %and164.i692.i
  %arrayidx166.i694.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  store i64 %or165.i693.i, ptr %arrayidx166.i694.i, align 8
  %arrayidx171.i695.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  %70 = load i64, ptr %arrayidx171.i695.i, align 8
  %arrayidx172.i696.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  %71 = load i64, ptr %arrayidx172.i696.i, align 8
  %and173.i697.i = and i64 %70, 1085102592571150095
  %and174.i698.i = shl i64 %71, 4
  %shl175.i699.i = and i64 %and174.i698.i, -1085102592571150096
  %or176.i700.i = or disjoint i64 %and173.i697.i, %shl175.i699.i
  %arrayidx177.i701.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  store i64 %or176.i700.i, ptr %arrayidx177.i701.i, align 8
  %and178.i702.i = lshr i64 %70, 4
  %shr179.i703.i = and i64 %and178.i702.i, 1085102592571150095
  %and180.i704.i = and i64 %71, -1085102592571150096
  %or181.i705.i = or disjoint i64 %shr179.i703.i, %and180.i704.i
  %arrayidx182.i706.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  store i64 %or181.i705.i, ptr %arrayidx182.i706.i, align 8
  %72 = load i64, ptr %q.i.i, align 8
  %conv5.i.i = trunc i64 %72 to i32
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %q.i.i)
  %arrayidx9.i = getelementptr inbounds nuw [10 x i8], ptr @Rcon, i32 0, i32 %k.0.i1143
  %73 = load i8, ptr %arrayidx9.i, align 1
  %conv.i = zext i8 %73 to i32
  %xor.i = xor i32 %conv5.i.i, %conv.i
  br label %if.end16.i

if.end16.i:                                       ; preds = %for.body.i1016, %if.then.i1134
  %tmp.2.i = phi i32 [ %xor.i, %if.then.i1134 ], [ %tmp.0.i1144, %for.body.i1016 ]
  %sub17.i = add nsw i32 %i.0.i8661141, -4
  %arrayidx18.i = getelementptr inbounds nuw [60 x i32], ptr %skey.i, i32 0, i32 %sub17.i
  %74 = load i32, ptr %arrayidx18.i, align 4
  %xor19.i = xor i32 %tmp.2.i, %74
  %arrayidx20.i1017 = getelementptr inbounds nuw [60 x i32], ptr %skey.i, i32 0, i32 %i.0.i8661141
  store i32 %xor19.i, ptr %arrayidx20.i1017, align 4
  %inc.i1018 = add i32 %j.0.i1142, 1
  %cmp21.i = icmp eq i32 %inc.i1018, 4
  %spec.select.i = select i1 %cmp21.i, i32 0, i32 %inc.i1018
  %inc24.i = zext i1 %cmp21.i to i32
  %spec.select1.i = add i32 %k.0.i1143, %inc24.i
  %inc26.i = add nuw nsw i32 %i.0.i8661141, 1
  %exitcond.i867.not = icmp eq i32 %inc26.i, 44
  br i1 %exitcond.i867.not, label %for.cond27.i.preheader, label %for.body.i1016, !llvm.loop !9

for.body30.i:                                     ; preds = %for.cond27.i.preheader, %for.body30.i
  %j.2.i1146 = phi i32 [ 0, %for.cond27.i.preheader ], [ %add74.i, %for.body30.i ]
  %i.1.i8681145 = phi i32 [ 0, %for.cond27.i.preheader ], [ %add73.i, %for.body30.i ]
  %arrayidx32.i = getelementptr inbounds nuw i8, ptr %q.i841, i32 32
  %add.ptr.i869 = getelementptr inbounds nuw i32, ptr %skey.i, i32 %i.1.i8681145
  %75 = load i32, ptr %add.ptr.i869, align 4
  %conv.i7.i = zext i32 %75 to i64
  %arrayidx1.i8.i = getelementptr inbounds nuw i8, ptr %add.ptr.i869, i32 4
  %76 = load i32, ptr %arrayidx1.i8.i, align 4
  %conv2.i9.i = zext i32 %76 to i64
  %arrayidx3.i10.i = getelementptr inbounds nuw i8, ptr %add.ptr.i869, i32 8
  %77 = load i32, ptr %arrayidx3.i10.i, align 4
  %conv4.i11.i = zext i32 %77 to i64
  %arrayidx5.i.i870 = getelementptr inbounds nuw i8, ptr %add.ptr.i869, i32 12
  %78 = load i32, ptr %arrayidx5.i.i870, align 4
  %conv6.i.i871 = zext i32 %78 to i64
  %shl.i12.i872 = shl nuw nsw i64 %conv.i7.i, 16
  %or.i13.i = or i64 %shl.i12.i872, %conv.i7.i
  %shl7.i.i873 = shl nuw nsw i64 %conv2.i9.i, 16
  %or8.i.i874 = or i64 %shl7.i.i873, %conv2.i9.i
  %shl9.i14.i = shl nuw nsw i64 %conv4.i11.i, 16
  %or10.i15.i = or i64 %shl9.i14.i, %conv4.i11.i
  %shl11.i.i875 = shl nuw nsw i64 %conv6.i.i871, 16
  %or12.i.i876 = or i64 %shl11.i.i875, %conv6.i.i871
  %and.i.i877 = and i64 %or.i13.i, 281470681808895
  %and13.i.i878 = and i64 %or8.i.i874, 281470681808895
  %and14.i.i879 = and i64 %or10.i15.i, 281470681808895
  %and15.i.i880 = and i64 %or12.i.i876, 281470681808895
  %shl16.i.i881 = shl nuw nsw i64 %and.i.i877, 8
  %or17.i.i882 = or i64 %and.i.i877, %shl16.i.i881
  %shl18.i.i883 = shl nuw nsw i64 %and13.i.i878, 8
  %or19.i.i884 = or i64 %and13.i.i878, %shl18.i.i883
  %and24.i.i885 = and i64 %or17.i.i882, 71777214294589695
  %and25.i.i886 = and i64 %or19.i.i884, 71777214294589695
  %79 = shl nuw i64 %and14.i.i879, 16
  %80 = shl nuw nsw i64 %and14.i.i879, 8
  %and26.i.i887 = or i64 %79, %80
  %shl28.i.i888 = and i64 %and26.i.i887, -71777214294589696
  %or29.i.i889 = or disjoint i64 %and24.i.i885, %shl28.i.i888
  store i64 %or29.i.i889, ptr %q.i841, align 8
  %81 = shl nuw i64 %and15.i.i880, 16
  %82 = shl nuw nsw i64 %and15.i.i880, 8
  %and27.i.i890 = or i64 %81, %82
  %shl30.i.i891 = and i64 %and27.i.i890, -71777214294589696
  %or31.i.i892 = or disjoint i64 %and25.i.i886, %shl30.i.i891
  store i64 %or31.i.i892, ptr %arrayidx32.i, align 8
  %83 = load i64, ptr %q.i841, align 8
  %arrayidx35.i = getelementptr inbounds nuw i8, ptr %q.i841, i32 8
  store i64 %83, ptr %arrayidx35.i, align 8
  %arrayidx37.i = getelementptr inbounds nuw i8, ptr %q.i841, i32 16
  store i64 %83, ptr %arrayidx37.i, align 8
  %arrayidx39.i = getelementptr inbounds nuw i8, ptr %q.i841, i32 24
  store i64 %83, ptr %arrayidx39.i, align 8
  %arrayidx40.i = getelementptr inbounds nuw i8, ptr %q.i841, i32 32
  %84 = load i64, ptr %arrayidx40.i, align 8
  %arrayidx41.i = getelementptr inbounds nuw i8, ptr %q.i841, i32 40
  store i64 %84, ptr %arrayidx41.i, align 8
  %arrayidx43.i = getelementptr inbounds nuw i8, ptr %q.i841, i32 48
  store i64 %84, ptr %arrayidx43.i, align 8
  %arrayidx45.i = getelementptr inbounds nuw i8, ptr %q.i841, i32 56
  store i64 %84, ptr %arrayidx45.i, align 8
  %85 = load i64, ptr %q.i841, align 8
  %arrayidx1.i139.i = getelementptr inbounds nuw i8, ptr %q.i841, i32 8
  %86 = load i64, ptr %arrayidx1.i139.i, align 8
  %and.i140.i = and i64 %85, 6148914691236517205
  %and2.i.i893 = shl i64 %86, 1
  %shl.i141.i = and i64 %and2.i.i893, -6148914691236517206
  %or.i142.i = or disjoint i64 %and.i140.i, %shl.i141.i
  store i64 %or.i142.i, ptr %q.i841, align 8
  %and4.i.i894 = lshr i64 %85, 1
  %shr.i.i895 = and i64 %and4.i.i894, 6148914691236517205
  %and5.i.i896 = and i64 %86, -6148914691236517206
  %or6.i143.i = or disjoint i64 %shr.i.i895, %and5.i.i896
  %arrayidx7.i144.i = getelementptr inbounds nuw i8, ptr %q.i841, i32 8
  store i64 %or6.i143.i, ptr %arrayidx7.i144.i, align 8
  %arrayidx11.i.i897 = getelementptr inbounds nuw i8, ptr %q.i841, i32 16
  %87 = load i64, ptr %arrayidx11.i.i897, align 8
  %arrayidx12.i.i898 = getelementptr inbounds nuw i8, ptr %q.i841, i32 24
  %88 = load i64, ptr %arrayidx12.i.i898, align 8
  %and13.i145.i = and i64 %87, 6148914691236517205
  %and14.i146.i = shl i64 %88, 1
  %shl15.i.i899 = and i64 %and14.i146.i, -6148914691236517206
  %or16.i.i900 = or disjoint i64 %and13.i145.i, %shl15.i.i899
  %arrayidx17.i.i901 = getelementptr inbounds nuw i8, ptr %q.i841, i32 16
  store i64 %or16.i.i900, ptr %arrayidx17.i.i901, align 8
  %and18.i.i902 = lshr i64 %87, 1
  %shr19.i.i903 = and i64 %and18.i.i902, 6148914691236517205
  %and20.i.i904 = and i64 %88, -6148914691236517206
  %or21.i.i905 = or disjoint i64 %shr19.i.i903, %and20.i.i904
  %arrayidx22.i.i906 = getelementptr inbounds nuw i8, ptr %q.i841, i32 24
  store i64 %or21.i.i905, ptr %arrayidx22.i.i906, align 8
  %arrayidx27.i.i907 = getelementptr inbounds nuw i8, ptr %q.i841, i32 32
  %89 = load i64, ptr %arrayidx27.i.i907, align 8
  %arrayidx28.i.i908 = getelementptr inbounds nuw i8, ptr %q.i841, i32 40
  %90 = load i64, ptr %arrayidx28.i.i908, align 8
  %and29.i.i909 = and i64 %89, 6148914691236517205
  %and30.i147.i = shl i64 %90, 1
  %shl31.i.i910 = and i64 %and30.i147.i, -6148914691236517206
  %or32.i.i911 = or disjoint i64 %and29.i.i909, %shl31.i.i910
  %arrayidx33.i.i912 = getelementptr inbounds nuw i8, ptr %q.i841, i32 32
  store i64 %or32.i.i911, ptr %arrayidx33.i.i912, align 8
  %and34.i148.i = lshr i64 %89, 1
  %shr35.i.i913 = and i64 %and34.i148.i, 6148914691236517205
  %and36.i.i914 = and i64 %90, -6148914691236517206
  %or37.i.i915 = or disjoint i64 %shr35.i.i913, %and36.i.i914
  %arrayidx38.i.i916 = getelementptr inbounds nuw i8, ptr %q.i841, i32 40
  store i64 %or37.i.i915, ptr %arrayidx38.i.i916, align 8
  %arrayidx43.i.i917 = getelementptr inbounds nuw i8, ptr %q.i841, i32 48
  %91 = load i64, ptr %arrayidx43.i.i917, align 8
  %arrayidx44.i.i918 = getelementptr inbounds nuw i8, ptr %q.i841, i32 56
  %92 = load i64, ptr %arrayidx44.i.i918, align 8
  %and45.i.i919 = and i64 %91, 6148914691236517205
  %and46.i.i920 = shl i64 %92, 1
  %shl47.i.i921 = and i64 %and46.i.i920, -6148914691236517206
  %or48.i.i922 = or disjoint i64 %and45.i.i919, %shl47.i.i921
  %arrayidx49.i.i923 = getelementptr inbounds nuw i8, ptr %q.i841, i32 48
  store i64 %or48.i.i922, ptr %arrayidx49.i.i923, align 8
  %and50.i.i924 = lshr i64 %91, 1
  %shr51.i.i925 = and i64 %and50.i.i924, 6148914691236517205
  %and52.i.i926 = and i64 %92, -6148914691236517206
  %or53.i.i927 = or disjoint i64 %shr51.i.i925, %and52.i.i926
  %arrayidx54.i.i928 = getelementptr inbounds nuw i8, ptr %q.i841, i32 56
  store i64 %or53.i.i927, ptr %arrayidx54.i.i928, align 8
  %93 = load i64, ptr %q.i841, align 8
  %arrayidx60.i.i929 = getelementptr inbounds nuw i8, ptr %q.i841, i32 16
  %94 = load i64, ptr %arrayidx60.i.i929, align 8
  %and61.i.i930 = and i64 %93, 3689348814741910323
  %and62.i.i931 = shl i64 %94, 2
  %shl63.i.i932 = and i64 %and62.i.i931, -3689348814741910324
  %or64.i.i933 = or disjoint i64 %and61.i.i930, %shl63.i.i932
  store i64 %or64.i.i933, ptr %q.i841, align 8
  %and66.i149.i = lshr i64 %93, 2
  %shr67.i.i934 = and i64 %and66.i149.i, 3689348814741910323
  %and68.i.i935 = and i64 %94, -3689348814741910324
  %or69.i.i936 = or disjoint i64 %shr67.i.i934, %and68.i.i935
  %arrayidx70.i.i937 = getelementptr inbounds nuw i8, ptr %q.i841, i32 16
  store i64 %or69.i.i936, ptr %arrayidx70.i.i937, align 8
  %arrayidx75.i.i938 = getelementptr inbounds nuw i8, ptr %q.i841, i32 8
  %95 = load i64, ptr %arrayidx75.i.i938, align 8
  %arrayidx76.i.i939 = getelementptr inbounds nuw i8, ptr %q.i841, i32 24
  %96 = load i64, ptr %arrayidx76.i.i939, align 8
  %and77.i150.i = and i64 %95, 3689348814741910323
  %and78.i151.i = shl i64 %96, 2
  %shl79.i.i940 = and i64 %and78.i151.i, -3689348814741910324
  %or80.i.i941 = or disjoint i64 %and77.i150.i, %shl79.i.i940
  %arrayidx81.i.i942 = getelementptr inbounds nuw i8, ptr %q.i841, i32 8
  store i64 %or80.i.i941, ptr %arrayidx81.i.i942, align 8
  %and82.i152.i = lshr i64 %95, 2
  %shr83.i.i943 = and i64 %and82.i152.i, 3689348814741910323
  %and84.i153.i = and i64 %96, -3689348814741910324
  %or85.i.i944 = or disjoint i64 %shr83.i.i943, %and84.i153.i
  %arrayidx86.i.i945 = getelementptr inbounds nuw i8, ptr %q.i841, i32 24
  store i64 %or85.i.i944, ptr %arrayidx86.i.i945, align 8
  %arrayidx91.i.i946 = getelementptr inbounds nuw i8, ptr %q.i841, i32 32
  %97 = load i64, ptr %arrayidx91.i.i946, align 8
  %arrayidx92.i.i947 = getelementptr inbounds nuw i8, ptr %q.i841, i32 48
  %98 = load i64, ptr %arrayidx92.i.i947, align 8
  %and93.i.i948 = and i64 %97, 3689348814741910323
  %and94.i.i949 = shl i64 %98, 2
  %shl95.i.i950 = and i64 %and94.i.i949, -3689348814741910324
  %or96.i.i951 = or disjoint i64 %and93.i.i948, %shl95.i.i950
  %arrayidx97.i.i952 = getelementptr inbounds nuw i8, ptr %q.i841, i32 32
  store i64 %or96.i.i951, ptr %arrayidx97.i.i952, align 8
  %and98.i.i953 = lshr i64 %97, 2
  %shr99.i.i954 = and i64 %and98.i.i953, 3689348814741910323
  %and100.i.i955 = and i64 %98, -3689348814741910324
  %or101.i.i956 = or disjoint i64 %shr99.i.i954, %and100.i.i955
  %arrayidx102.i.i957 = getelementptr inbounds nuw i8, ptr %q.i841, i32 48
  store i64 %or101.i.i956, ptr %arrayidx102.i.i957, align 8
  %arrayidx107.i.i958 = getelementptr inbounds nuw i8, ptr %q.i841, i32 40
  %99 = load i64, ptr %arrayidx107.i.i958, align 8
  %arrayidx108.i.i959 = getelementptr inbounds nuw i8, ptr %q.i841, i32 56
  %100 = load i64, ptr %arrayidx108.i.i959, align 8
  %and109.i.i960 = and i64 %99, 3689348814741910323
  %and110.i.i961 = shl i64 %100, 2
  %shl111.i.i962 = and i64 %and110.i.i961, -3689348814741910324
  %or112.i.i963 = or disjoint i64 %and109.i.i960, %shl111.i.i962
  %arrayidx113.i.i964 = getelementptr inbounds nuw i8, ptr %q.i841, i32 40
  store i64 %or112.i.i963, ptr %arrayidx113.i.i964, align 8
  %and114.i.i965 = lshr i64 %99, 2
  %shr115.i.i966 = and i64 %and114.i.i965, 3689348814741910323
  %and116.i.i967 = and i64 %100, -3689348814741910324
  %or117.i.i968 = or disjoint i64 %shr115.i.i966, %and116.i.i967
  %arrayidx118.i.i969 = getelementptr inbounds nuw i8, ptr %q.i841, i32 56
  store i64 %or117.i.i968, ptr %arrayidx118.i.i969, align 8
  %101 = load i64, ptr %q.i841, align 8
  %arrayidx124.i154.i = getelementptr inbounds nuw i8, ptr %q.i841, i32 32
  %102 = load i64, ptr %arrayidx124.i154.i, align 8
  %and125.i.i970 = and i64 %101, 1085102592571150095
  %and126.i.i971 = shl i64 %102, 4
  %shl127.i.i972 = and i64 %and126.i.i971, -1085102592571150096
  %or128.i.i973 = or disjoint i64 %and125.i.i970, %shl127.i.i972
  store i64 %or128.i.i973, ptr %q.i841, align 8
  %and130.i.i974 = lshr i64 %101, 4
  %shr131.i.i975 = and i64 %and130.i.i974, 1085102592571150095
  %and132.i.i976 = and i64 %102, -1085102592571150096
  %or133.i.i977 = or disjoint i64 %shr131.i.i975, %and132.i.i976
  %arrayidx134.i.i978 = getelementptr inbounds nuw i8, ptr %q.i841, i32 32
  store i64 %or133.i.i977, ptr %arrayidx134.i.i978, align 8
  %arrayidx139.i.i979 = getelementptr inbounds nuw i8, ptr %q.i841, i32 8
  %103 = load i64, ptr %arrayidx139.i.i979, align 8
  %arrayidx140.i.i980 = getelementptr inbounds nuw i8, ptr %q.i841, i32 40
  %104 = load i64, ptr %arrayidx140.i.i980, align 8
  %and141.i.i981 = and i64 %103, 1085102592571150095
  %and142.i.i982 = shl i64 %104, 4
  %shl143.i.i983 = and i64 %and142.i.i982, -1085102592571150096
  %or144.i.i984 = or disjoint i64 %and141.i.i981, %shl143.i.i983
  %arrayidx145.i.i985 = getelementptr inbounds nuw i8, ptr %q.i841, i32 8
  store i64 %or144.i.i984, ptr %arrayidx145.i.i985, align 8
  %and146.i.i986 = lshr i64 %103, 4
  %shr147.i.i987 = and i64 %and146.i.i986, 1085102592571150095
  %and148.i.i988 = and i64 %104, -1085102592571150096
  %or149.i.i989 = or disjoint i64 %shr147.i.i987, %and148.i.i988
  %arrayidx150.i.i990 = getelementptr inbounds nuw i8, ptr %q.i841, i32 40
  store i64 %or149.i.i989, ptr %arrayidx150.i.i990, align 8
  %arrayidx155.i.i991 = getelementptr inbounds nuw i8, ptr %q.i841, i32 16
  %105 = load i64, ptr %arrayidx155.i.i991, align 8
  %arrayidx156.i.i992 = getelementptr inbounds nuw i8, ptr %q.i841, i32 48
  %106 = load i64, ptr %arrayidx156.i.i992, align 8
  %and157.i.i993 = and i64 %105, 1085102592571150095
  %and158.i.i994 = shl i64 %106, 4
  %shl159.i.i995 = and i64 %and158.i.i994, -1085102592571150096
  %or160.i.i996 = or disjoint i64 %and157.i.i993, %shl159.i.i995
  %arrayidx161.i.i997 = getelementptr inbounds nuw i8, ptr %q.i841, i32 16
  store i64 %or160.i.i996, ptr %arrayidx161.i.i997, align 8
  %and162.i.i998 = lshr i64 %105, 4
  %shr163.i.i999 = and i64 %and162.i.i998, 1085102592571150095
  %and164.i.i1000 = and i64 %106, -1085102592571150096
  %or165.i.i1001 = or disjoint i64 %shr163.i.i999, %and164.i.i1000
  %arrayidx166.i.i1002 = getelementptr inbounds nuw i8, ptr %q.i841, i32 48
  store i64 %or165.i.i1001, ptr %arrayidx166.i.i1002, align 8
  %arrayidx171.i.i1003 = getelementptr inbounds nuw i8, ptr %q.i841, i32 24
  %107 = load i64, ptr %arrayidx171.i.i1003, align 8
  %arrayidx172.i.i1004 = getelementptr inbounds nuw i8, ptr %q.i841, i32 56
  %108 = load i64, ptr %arrayidx172.i.i1004, align 8
  %and173.i.i1005 = and i64 %107, 1085102592571150095
  %and174.i.i1006 = shl i64 %108, 4
  %shl175.i.i1007 = and i64 %and174.i.i1006, -1085102592571150096
  %or176.i.i1008 = or disjoint i64 %and173.i.i1005, %shl175.i.i1007
  %arrayidx177.i.i1009 = getelementptr inbounds nuw i8, ptr %q.i841, i32 24
  store i64 %or176.i.i1008, ptr %arrayidx177.i.i1009, align 8
  %and178.i.i1010 = lshr i64 %107, 4
  %shr179.i.i1011 = and i64 %and178.i.i1010, 1085102592571150095
  %and180.i.i1012 = and i64 %108, -1085102592571150096
  %or181.i.i1013 = or disjoint i64 %shr179.i.i1011, %and180.i.i1012
  %arrayidx182.i.i1014 = getelementptr inbounds nuw i8, ptr %q.i841, i32 56
  store i64 %or181.i.i1013, ptr %arrayidx182.i.i1014, align 8
  %109 = load i64, ptr %q.i841, align 8
  %and.i1015 = and i64 %109, 1229782938247303441
  %arrayidx48.i = getelementptr inbounds nuw i8, ptr %q.i841, i32 8
  %110 = load i64, ptr %arrayidx48.i, align 8
  %and49.i = and i64 %110, 2459565876494606882
  %or50.i = or disjoint i64 %and.i1015, %and49.i
  %arrayidx51.i = getelementptr inbounds nuw i8, ptr %q.i841, i32 16
  %111 = load i64, ptr %arrayidx51.i, align 8
  %and52.i = and i64 %111, 4919131752989213764
  %or53.i = or disjoint i64 %or50.i, %and52.i
  %arrayidx54.i = getelementptr inbounds nuw i8, ptr %q.i841, i32 24
  %112 = load i64, ptr %arrayidx54.i, align 8
  %and55.i = and i64 %112, -8608480567731124088
  %or56.i = or disjoint i64 %or53.i, %and55.i
  %arrayidx58.i = getelementptr inbounds nuw i64, ptr %skey.i.i, i32 %j.2.i1146
  store i64 %or56.i, ptr %arrayidx58.i, align 8
  %arrayidx59.i = getelementptr inbounds nuw i8, ptr %q.i841, i32 32
  %113 = load i64, ptr %arrayidx59.i, align 8
  %and60.i = and i64 %113, 1229782938247303441
  %arrayidx61.i = getelementptr inbounds nuw i8, ptr %q.i841, i32 40
  %114 = load i64, ptr %arrayidx61.i, align 8
  %and62.i = and i64 %114, 2459565876494606882
  %or63.i = or disjoint i64 %and60.i, %and62.i
  %arrayidx64.i = getelementptr inbounds nuw i8, ptr %q.i841, i32 48
  %115 = load i64, ptr %arrayidx64.i, align 8
  %and65.i = and i64 %115, 4919131752989213764
  %or66.i = or disjoint i64 %or63.i, %and65.i
  %arrayidx67.i = getelementptr inbounds nuw i8, ptr %q.i841, i32 56
  %116 = load i64, ptr %arrayidx67.i, align 8
  %and68.i = and i64 %116, -8608480567731124088
  %or69.i = or disjoint i64 %or66.i, %and68.i
  %add70.i = or disjoint i32 %j.2.i1146, 1
  %arrayidx71.i = getelementptr inbounds nuw i64, ptr %skey.i.i, i32 %add70.i
  store i64 %or69.i, ptr %arrayidx71.i, align 8
  %add73.i = add nuw nsw i32 %i.1.i8681145, 4
  %add74.i = add nuw nsw i32 %j.2.i1146, 2
  %cmp28.i = icmp samesign ult i32 %add73.i, 44
  br i1 %cmp28.i, label %for.body30.i, label %br_aes_ct64_keysched.exit, !llvm.loop !10

br_aes_ct64_keysched.exit:                        ; preds = %for.body30.i
  call void @llvm.lifetime.end.p0(i64 240, ptr nonnull %skey.i)
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %q.i841)
  %117 = load ptr, ptr %ctx.i, align 4
  br label %for.body.i9

for.body.i9:                                      ; preds = %br_aes_ct64_keysched.exit, %for.body.i9
  %v.0.i1148 = phi i32 [ 0, %br_aes_ct64_keysched.exit ], [ %add21.i, %for.body.i9 ]
  %u.0.i1147 = phi i32 [ 0, %br_aes_ct64_keysched.exit ], [ %inc.i, %for.body.i9 ]
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %skey.i.i, i32 %u.0.i1147
  %118 = load i64, ptr %arrayidx.i, align 8
  %and.i = and i64 %118, 1229782938247303441
  %and1.i = lshr i64 %118, 1
  %shr.i = and i64 %and1.i, 1229782938247303441
  %and2.i = lshr i64 %118, 2
  %shr4.i = and i64 %and2.i, 1229782938247303441
  %and3.i = lshr i64 %118, 3
  %shr5.i = and i64 %and3.i, 1229782938247303441
  %sub.i = mul nuw i64 %and.i, 15
  %arrayidx8.i = getelementptr inbounds nuw i64, ptr %117, i32 %v.0.i1148
  store i64 %sub.i, ptr %arrayidx8.i, align 8
  %sub10.i = mul nuw i64 %shr.i, 15
  %add11.i = or disjoint i32 %v.0.i1148, 1
  %arrayidx12.i = getelementptr inbounds nuw i64, ptr %117, i32 %add11.i
  store i64 %sub10.i, ptr %arrayidx12.i, align 8
  %sub14.i = mul nuw i64 %shr4.i, 15
  %add15.i = or disjoint i32 %v.0.i1148, 2
  %arrayidx16.i = getelementptr inbounds nuw i64, ptr %117, i32 %add15.i
  store i64 %sub14.i, ptr %arrayidx16.i, align 8
  %sub18.i = mul nuw i64 %shr5.i, 15
  %add19.i = or disjoint i32 %v.0.i1148, 3
  %arrayidx20.i = getelementptr inbounds nuw i64, ptr %117, i32 %add19.i
  store i64 %sub18.i, ptr %arrayidx20.i, align 8
  %inc.i = add nuw nsw i32 %u.0.i1147, 1
  %add21.i = add nuw nsw i32 %v.0.i1148, 4
  %exitcond.i.not = icmp eq i32 %inc.i, 22
  br i1 %exitcond.i.not, label %br_aes_ct64_skey_expand.exit, label %for.body.i9, !llvm.loop !11

br_aes_ct64_skey_expand.exit:                     ; preds = %for.body.i9
  call void @llvm.lifetime.end.p0(i64 176, ptr nonnull %skey.i.i)
  %119 = load ptr, ptr %ctx.i, align 4
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %ivw.i)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %tmp.i10)
  br label %while.body.i.i

while.body.i.i:                                   ; preds = %br_aes_ct64_skey_expand.exit, %while.body.i.i
  %v.addr.0.i.i1151 = phi ptr [ %ivw.i, %br_aes_ct64_skey_expand.exit ], [ %incdec.ptr.i.i, %while.body.i.i ]
  %num.addr.0.i.i1150 = phi i32 [ 3, %br_aes_ct64_skey_expand.exit ], [ %dec.i.i, %while.body.i.i ]
  %src.addr.0.i.i1149 = phi ptr [ %iv.i, %br_aes_ct64_skey_expand.exit ], [ %add.ptr.i.i, %while.body.i.i ]
  %dec.i.i = add nsw i32 %num.addr.0.i.i1150, -1
  %120 = load i8, ptr %src.addr.0.i.i1149, align 1
  %conv.i.i = zext i8 %120 to i32
  %arrayidx1.i.i = getelementptr inbounds nuw i8, ptr %src.addr.0.i.i1149, i32 1
  %121 = load i8, ptr %arrayidx1.i.i, align 1
  %conv2.i.i = zext i8 %121 to i32
  %shl.i.i = shl nuw nsw i32 %conv2.i.i, 8
  %or.i.i = or disjoint i32 %shl.i.i, %conv.i.i
  %arrayidx3.i.i = getelementptr inbounds nuw i8, ptr %src.addr.0.i.i1149, i32 2
  %122 = load i8, ptr %arrayidx3.i.i, align 1
  %conv4.i.i = zext i8 %122 to i32
  %shl5.i.i = shl nuw nsw i32 %conv4.i.i, 16
  %or6.i.i = or disjoint i32 %or.i.i, %shl5.i.i
  %arrayidx7.i.i = getelementptr inbounds nuw i8, ptr %src.addr.0.i.i1149, i32 3
  %123 = load i8, ptr %arrayidx7.i.i, align 1
  %conv8.i.i = zext i8 %123 to i32
  %shl9.i.i = shl nuw i32 %conv8.i.i, 24
  %or10.i.i = or disjoint i32 %or6.i.i, %shl9.i.i
  %incdec.ptr.i.i = getelementptr inbounds nuw i8, ptr %v.addr.0.i.i1151, i32 4
  store i32 %or10.i.i, ptr %v.addr.0.i.i1151, align 4
  %add.ptr.i.i = getelementptr inbounds nuw i8, ptr %src.addr.0.i.i1149, i32 4
  %cmp.not.i.i = icmp eq i32 %dec.i.i, 0
  br i1 %cmp.not.i.i, label %br_range_dec32le.exit.i, label %while.body.i.i, !llvm.loop !12

br_range_dec32le.exit.i:                          ; preds = %while.body.i.i
  %add.ptr.i11 = getelementptr inbounds nuw i8, ptr %ivw.i, i32 16
  %call.i12 = call ptr @memcpy(ptr noundef nonnull %add.ptr.i11, ptr noundef nonnull %ivw.i, i32 noundef 12) #8
  %add.ptr4.i = getelementptr inbounds nuw i8, ptr %ivw.i, i32 32
  %call6.i = call ptr @memcpy(ptr noundef nonnull %add.ptr4.i, ptr noundef nonnull %ivw.i, i32 noundef 12) #8
  %add.ptr8.i = getelementptr inbounds nuw i8, ptr %ivw.i, i32 48
  %call10.i = call ptr @memcpy(ptr noundef nonnull %add.ptr8.i, ptr noundef nonnull %ivw.i, i32 noundef 12) #8
  %arrayidx.i13 = getelementptr inbounds nuw i8, ptr %ivw.i, i32 12
  store i32 0, ptr %arrayidx.i13, align 4
  %arrayidx13.i = getelementptr inbounds nuw i8, ptr %ivw.i, i32 28
  store i32 16777216, ptr %arrayidx13.i, align 4
  %arrayidx16.i14 = getelementptr inbounds nuw i8, ptr %ivw.i, i32 44
  store i32 33554432, ptr %arrayidx16.i14, align 4
  %arrayidx19.i = getelementptr inbounds nuw i8, ptr %ivw.i, i32 60
  store i32 50331648, ptr %arrayidx19.i, align 4
  br label %while.body.i

while.body.i:                                     ; preds = %br_range_dec32le.exit.i, %aes_ecb4x.exit
  %out.addr.0.i1161 = phi ptr [ %P, %br_range_dec32le.exit.i ], [ %add.ptr21.i, %aes_ecb4x.exit ]
  %outlen.addr.0.i1160 = phi i32 [ 144495, %br_range_dec32le.exit.i ], [ %sub.i20, %aes_ecb4x.exit ]
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %w.i)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %q.i)
  %call.i30 = call ptr @memcpy(ptr noundef nonnull %w.i, ptr noundef nonnull %ivw.i, i32 noundef 64) #8
  br label %for.body.i54

for.body.i54:                                     ; preds = %while.body.i, %for.body.i54
  %i.0.i321152 = phi i32 [ 0, %while.body.i ], [ %inc.i62, %for.body.i54 ]
  %arrayidx.i55 = getelementptr inbounds nuw [8 x i64], ptr %q.i, i32 0, i32 %i.0.i321152
  %add.i = or disjoint i32 %i.0.i321152, 4
  %arrayidx1.i = getelementptr inbounds nuw [8 x i64], ptr %q.i, i32 0, i32 %add.i
  %add.ptr.idx.i = shl nuw nsw i32 %i.0.i321152, 4
  %add.ptr.i56 = getelementptr inbounds nuw i8, ptr %w.i, i32 %add.ptr.idx.i
  %124 = load i32, ptr %add.ptr.i56, align 4
  %conv.i40.i = zext i32 %124 to i64
  %arrayidx1.i.i57 = getelementptr inbounds nuw i8, ptr %add.ptr.i56, i32 4
  %125 = load i32, ptr %arrayidx1.i.i57, align 4
  %conv2.i.i58 = zext i32 %125 to i64
  %arrayidx3.i.i59 = getelementptr inbounds nuw i8, ptr %add.ptr.i56, i32 8
  %126 = load i32, ptr %arrayidx3.i.i59, align 4
  %conv4.i41.i = zext i32 %126 to i64
  %arrayidx5.i42.i = getelementptr inbounds nuw i8, ptr %add.ptr.i56, i32 12
  %127 = load i32, ptr %arrayidx5.i42.i, align 4
  %conv6.i.i = zext i32 %127 to i64
  %shl.i43.i = shl nuw nsw i64 %conv.i40.i, 16
  %or.i44.i = or i64 %shl.i43.i, %conv.i40.i
  %shl7.i.i = shl nuw nsw i64 %conv2.i.i58, 16
  %or8.i.i = or i64 %shl7.i.i, %conv2.i.i58
  %shl9.i.i60 = shl nuw nsw i64 %conv4.i41.i, 16
  %or10.i.i61 = or i64 %shl9.i.i60, %conv4.i41.i
  %shl11.i.i = shl nuw nsw i64 %conv6.i.i, 16
  %or12.i45.i = or i64 %shl11.i.i, %conv6.i.i
  %and.i46.i = and i64 %or.i44.i, 281470681808895
  %and13.i47.i = and i64 %or8.i.i, 281470681808895
  %and14.i.i = and i64 %or10.i.i61, 281470681808895
  %and15.i.i = and i64 %or12.i45.i, 281470681808895
  %shl16.i.i = shl nuw nsw i64 %and.i46.i, 8
  %or17.i.i = or i64 %and.i46.i, %shl16.i.i
  %shl18.i.i = shl nuw nsw i64 %and13.i47.i, 8
  %or19.i.i = or i64 %and13.i47.i, %shl18.i.i
  %and24.i.i = and i64 %or17.i.i, 71777214294589695
  %and25.i.i = and i64 %or19.i.i, 71777214294589695
  %128 = shl nuw i64 %and14.i.i, 16
  %129 = shl nuw nsw i64 %and14.i.i, 8
  %and26.i.i = or i64 %128, %129
  %shl28.i.i = and i64 %and26.i.i, -71777214294589696
  %or29.i.i = or disjoint i64 %and24.i.i, %shl28.i.i
  store i64 %or29.i.i, ptr %arrayidx.i55, align 8
  %130 = shl nuw i64 %and15.i.i, 16
  %131 = shl nuw nsw i64 %and15.i.i, 8
  %and27.i.i = or i64 %130, %131
  %shl30.i.i = and i64 %and27.i.i, -71777214294589696
  %or31.i.i = or disjoint i64 %and25.i.i, %shl30.i.i
  store i64 %or31.i.i, ptr %arrayidx1.i, align 8
  %inc.i62 = add nuw nsw i32 %i.0.i321152, 1
  %exitcond.i33.not = icmp eq i32 %inc.i62, 4
  br i1 %exitcond.i33.not, label %for.end.i, label %for.body.i54, !llvm.loop !13

for.end.i:                                        ; preds = %for.body.i54
  %132 = load i64, ptr %q.i, align 8
  %arrayidx1.i241.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %133 = load i64, ptr %arrayidx1.i241.i, align 8
  %and.i242.i = and i64 %132, 6148914691236517205
  %and2.i243.i = shl i64 %133, 1
  %shl.i244.i = and i64 %and2.i243.i, -6148914691236517206
  %or.i245.i = or disjoint i64 %and.i242.i, %shl.i244.i
  store i64 %or.i245.i, ptr %q.i, align 8
  %and4.i246.i = lshr i64 %132, 1
  %shr.i247.i = and i64 %and4.i246.i, 6148914691236517205
  %and5.i.i = and i64 %133, -6148914691236517206
  %or6.i248.i = or disjoint i64 %shr.i247.i, %and5.i.i
  %arrayidx7.i249.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or6.i248.i, ptr %arrayidx7.i249.i, align 8
  %arrayidx11.i250.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %134 = load i64, ptr %arrayidx11.i250.i, align 8
  %arrayidx12.i251.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %135 = load i64, ptr %arrayidx12.i251.i, align 8
  %and13.i252.i = and i64 %134, 6148914691236517205
  %and14.i253.i = shl i64 %135, 1
  %shl15.i.i = and i64 %and14.i253.i, -6148914691236517206
  %or16.i.i = or disjoint i64 %and13.i252.i, %shl15.i.i
  %arrayidx17.i254.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or16.i.i, ptr %arrayidx17.i254.i, align 8
  %and18.i.i = lshr i64 %134, 1
  %shr19.i.i = and i64 %and18.i.i, 6148914691236517205
  %and20.i.i = and i64 %135, -6148914691236517206
  %or21.i.i = or disjoint i64 %shr19.i.i, %and20.i.i
  %arrayidx22.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or21.i.i, ptr %arrayidx22.i.i, align 8
  %arrayidx27.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %136 = load i64, ptr %arrayidx27.i.i, align 8
  %arrayidx28.i255.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %137 = load i64, ptr %arrayidx28.i255.i, align 8
  %and29.i.i = and i64 %136, 6148914691236517205
  %and30.i256.i = shl i64 %137, 1
  %shl31.i.i = and i64 %and30.i256.i, -6148914691236517206
  %or32.i257.i = or disjoint i64 %and29.i.i, %shl31.i.i
  %arrayidx33.i258.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or32.i257.i, ptr %arrayidx33.i258.i, align 8
  %and34.i259.i = lshr i64 %136, 1
  %shr35.i.i = and i64 %and34.i259.i, 6148914691236517205
  %and36.i.i = and i64 %137, -6148914691236517206
  %or37.i.i = or disjoint i64 %shr35.i.i, %and36.i.i
  %arrayidx38.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or37.i.i, ptr %arrayidx38.i.i, align 8
  %arrayidx43.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %138 = load i64, ptr %arrayidx43.i.i, align 8
  %arrayidx44.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %139 = load i64, ptr %arrayidx44.i.i, align 8
  %and45.i.i = and i64 %138, 6148914691236517205
  %and46.i.i = shl i64 %139, 1
  %shl47.i.i = and i64 %and46.i.i, -6148914691236517206
  %or48.i.i = or disjoint i64 %and45.i.i, %shl47.i.i
  %arrayidx49.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or48.i.i, ptr %arrayidx49.i.i, align 8
  %and50.i.i = lshr i64 %138, 1
  %shr51.i.i = and i64 %and50.i.i, 6148914691236517205
  %and52.i.i = and i64 %139, -6148914691236517206
  %or53.i.i = or disjoint i64 %shr51.i.i, %and52.i.i
  %arrayidx54.i260.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or53.i.i, ptr %arrayidx54.i260.i, align 8
  %140 = load i64, ptr %q.i, align 8
  %arrayidx60.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %141 = load i64, ptr %arrayidx60.i.i, align 8
  %and61.i.i = and i64 %140, 3689348814741910323
  %and62.i.i = shl i64 %141, 2
  %shl63.i.i = and i64 %and62.i.i, -3689348814741910324
  %or64.i.i = or disjoint i64 %and61.i.i, %shl63.i.i
  store i64 %or64.i.i, ptr %q.i, align 8
  %and66.i261.i = lshr i64 %140, 2
  %shr67.i.i = and i64 %and66.i261.i, 3689348814741910323
  %and68.i.i = and i64 %141, -3689348814741910324
  %or69.i.i = or disjoint i64 %shr67.i.i, %and68.i.i
  %arrayidx70.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or69.i.i, ptr %arrayidx70.i.i, align 8
  %arrayidx75.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %142 = load i64, ptr %arrayidx75.i.i, align 8
  %arrayidx76.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %143 = load i64, ptr %arrayidx76.i.i, align 8
  %and77.i262.i = and i64 %142, 3689348814741910323
  %and78.i263.i = shl i64 %143, 2
  %shl79.i.i = and i64 %and78.i263.i, -3689348814741910324
  %or80.i.i = or disjoint i64 %and77.i262.i, %shl79.i.i
  %arrayidx81.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or80.i.i, ptr %arrayidx81.i.i, align 8
  %and82.i264.i = lshr i64 %142, 2
  %shr83.i.i = and i64 %and82.i264.i, 3689348814741910323
  %and84.i265.i = and i64 %143, -3689348814741910324
  %or85.i.i = or disjoint i64 %shr83.i.i, %and84.i265.i
  %arrayidx86.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or85.i.i, ptr %arrayidx86.i.i, align 8
  %arrayidx91.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %144 = load i64, ptr %arrayidx91.i.i, align 8
  %arrayidx92.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %145 = load i64, ptr %arrayidx92.i.i, align 8
  %and93.i.i = and i64 %144, 3689348814741910323
  %and94.i.i = shl i64 %145, 2
  %shl95.i.i = and i64 %and94.i.i, -3689348814741910324
  %or96.i.i = or disjoint i64 %and93.i.i, %shl95.i.i
  %arrayidx97.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or96.i.i, ptr %arrayidx97.i.i, align 8
  %and98.i.i = lshr i64 %144, 2
  %shr99.i.i = and i64 %and98.i.i, 3689348814741910323
  %and100.i.i = and i64 %145, -3689348814741910324
  %or101.i.i = or disjoint i64 %shr99.i.i, %and100.i.i
  %arrayidx102.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or101.i.i, ptr %arrayidx102.i.i, align 8
  %arrayidx107.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %146 = load i64, ptr %arrayidx107.i.i, align 8
  %arrayidx108.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %147 = load i64, ptr %arrayidx108.i.i, align 8
  %and109.i.i = and i64 %146, 3689348814741910323
  %and110.i.i = shl i64 %147, 2
  %shl111.i.i = and i64 %and110.i.i, -3689348814741910324
  %or112.i.i = or disjoint i64 %and109.i.i, %shl111.i.i
  %arrayidx113.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or112.i.i, ptr %arrayidx113.i.i, align 8
  %and114.i.i = lshr i64 %146, 2
  %shr115.i.i = and i64 %and114.i.i, 3689348814741910323
  %and116.i.i = and i64 %147, -3689348814741910324
  %or117.i.i = or disjoint i64 %shr115.i.i, %and116.i.i
  %arrayidx118.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or117.i.i, ptr %arrayidx118.i.i, align 8
  %148 = load i64, ptr %q.i, align 8
  %arrayidx124.i266.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %149 = load i64, ptr %arrayidx124.i266.i, align 8
  %and125.i.i = and i64 %148, 1085102592571150095
  %and126.i.i = shl i64 %149, 4
  %shl127.i.i = and i64 %and126.i.i, -1085102592571150096
  %or128.i.i = or disjoint i64 %and125.i.i, %shl127.i.i
  store i64 %or128.i.i, ptr %q.i, align 8
  %and130.i.i = lshr i64 %148, 4
  %shr131.i.i = and i64 %and130.i.i, 1085102592571150095
  %and132.i.i = and i64 %149, -1085102592571150096
  %or133.i.i = or disjoint i64 %shr131.i.i, %and132.i.i
  %arrayidx134.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or133.i.i, ptr %arrayidx134.i.i, align 8
  %arrayidx139.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %150 = load i64, ptr %arrayidx139.i.i, align 8
  %arrayidx140.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %151 = load i64, ptr %arrayidx140.i.i, align 8
  %and141.i.i = and i64 %150, 1085102592571150095
  %and142.i.i = shl i64 %151, 4
  %shl143.i.i = and i64 %and142.i.i, -1085102592571150096
  %or144.i.i = or disjoint i64 %and141.i.i, %shl143.i.i
  %arrayidx145.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or144.i.i, ptr %arrayidx145.i.i, align 8
  %and146.i.i = lshr i64 %150, 4
  %shr147.i.i = and i64 %and146.i.i, 1085102592571150095
  %and148.i.i = and i64 %151, -1085102592571150096
  %or149.i.i = or disjoint i64 %shr147.i.i, %and148.i.i
  %arrayidx150.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or149.i.i, ptr %arrayidx150.i.i, align 8
  %arrayidx155.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %152 = load i64, ptr %arrayidx155.i.i, align 8
  %arrayidx156.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %153 = load i64, ptr %arrayidx156.i.i, align 8
  %and157.i.i = and i64 %152, 1085102592571150095
  %and158.i.i = shl i64 %153, 4
  %shl159.i.i = and i64 %and158.i.i, -1085102592571150096
  %or160.i.i = or disjoint i64 %and157.i.i, %shl159.i.i
  %arrayidx161.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or160.i.i, ptr %arrayidx161.i.i, align 8
  %and162.i.i = lshr i64 %152, 4
  %shr163.i.i = and i64 %and162.i.i, 1085102592571150095
  %and164.i.i = and i64 %153, -1085102592571150096
  %or165.i.i = or disjoint i64 %shr163.i.i, %and164.i.i
  %arrayidx166.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or165.i.i, ptr %arrayidx166.i.i, align 8
  %arrayidx171.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %154 = load i64, ptr %arrayidx171.i.i, align 8
  %arrayidx172.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %155 = load i64, ptr %arrayidx172.i.i, align 8
  %and173.i.i = and i64 %154, 1085102592571150095
  %and174.i.i = shl i64 %155, 4
  %shl175.i.i = and i64 %and174.i.i, -1085102592571150096
  %or176.i.i = or disjoint i64 %and173.i.i, %shl175.i.i
  %arrayidx177.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or176.i.i, ptr %arrayidx177.i.i, align 8
  %and178.i.i = lshr i64 %154, 4
  %shr179.i.i = and i64 %and178.i.i, 1085102592571150095
  %and180.i.i = and i64 %155, -1085102592571150096
  %or181.i267.i = or disjoint i64 %shr179.i.i, %and180.i.i
  %arrayidx182.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or181.i267.i, ptr %arrayidx182.i.i, align 8
  %156 = load i64, ptr %119, align 8
  %157 = load i64, ptr %q.i, align 8
  %xor.i.i = xor i64 %157, %156
  store i64 %xor.i.i, ptr %q.i, align 8
  %arrayidx2.i48.i = getelementptr inbounds nuw i8, ptr %119, i32 8
  %158 = load i64, ptr %arrayidx2.i48.i, align 8
  %arrayidx3.i49.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %159 = load i64, ptr %arrayidx3.i49.i, align 8
  %xor4.i.i = xor i64 %159, %158
  store i64 %xor4.i.i, ptr %arrayidx3.i49.i, align 8
  %arrayidx5.i50.i = getelementptr inbounds nuw i8, ptr %119, i32 16
  %160 = load i64, ptr %arrayidx5.i50.i, align 8
  %arrayidx6.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %161 = load i64, ptr %arrayidx6.i.i, align 8
  %xor7.i.i = xor i64 %161, %160
  store i64 %xor7.i.i, ptr %arrayidx6.i.i, align 8
  %arrayidx8.i51.i = getelementptr inbounds nuw i8, ptr %119, i32 24
  %162 = load i64, ptr %arrayidx8.i51.i, align 8
  %arrayidx9.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %163 = load i64, ptr %arrayidx9.i.i, align 8
  %xor10.i.i = xor i64 %163, %162
  store i64 %xor10.i.i, ptr %arrayidx9.i.i, align 8
  %arrayidx11.i.i = getelementptr inbounds nuw i8, ptr %119, i32 32
  %164 = load i64, ptr %arrayidx11.i.i, align 8
  %arrayidx12.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %165 = load i64, ptr %arrayidx12.i.i, align 8
  %xor13.i.i = xor i64 %165, %164
  store i64 %xor13.i.i, ptr %arrayidx12.i.i, align 8
  %arrayidx14.i.i = getelementptr inbounds nuw i8, ptr %119, i32 40
  %166 = load i64, ptr %arrayidx14.i.i, align 8
  %arrayidx15.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %167 = load i64, ptr %arrayidx15.i.i, align 8
  %xor16.i.i = xor i64 %167, %166
  store i64 %xor16.i.i, ptr %arrayidx15.i.i, align 8
  %arrayidx17.i.i = getelementptr inbounds nuw i8, ptr %119, i32 48
  %168 = load i64, ptr %arrayidx17.i.i, align 8
  %arrayidx18.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %169 = load i64, ptr %arrayidx18.i.i, align 8
  %xor19.i.i = xor i64 %169, %168
  store i64 %xor19.i.i, ptr %arrayidx18.i.i, align 8
  %arrayidx20.i.i = getelementptr inbounds nuw i8, ptr %119, i32 56
  %170 = load i64, ptr %arrayidx20.i.i, align 8
  %arrayidx21.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %171 = load i64, ptr %arrayidx21.i.i, align 8
  %xor22.i.i = xor i64 %171, %170
  store i64 %xor22.i.i, ptr %arrayidx21.i.i, align 8
  br label %for.body7.i

for.body7.i:                                      ; preds = %for.end.i, %shift_rows.exit28.i
  %i.1.i1154 = phi i32 [ 1, %for.end.i ], [ %inc15.i, %shift_rows.exit28.i ]
  %arrayidx.i122.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %172 = load i64, ptr %arrayidx.i122.i, align 8
  %arrayidx1.i123.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %173 = load i64, ptr %arrayidx1.i123.i, align 8
  %arrayidx2.i124.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %174 = load i64, ptr %arrayidx2.i124.i, align 8
  %arrayidx3.i125.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %175 = load i64, ptr %arrayidx3.i125.i, align 8
  %arrayidx4.i126.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %176 = load i64, ptr %arrayidx4.i126.i, align 8
  %arrayidx5.i127.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %177 = load i64, ptr %arrayidx5.i127.i, align 8
  %arrayidx6.i128.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %178 = load i64, ptr %arrayidx6.i128.i, align 8
  %179 = load i64, ptr %q.i, align 8
  %xor.i129.i = xor i64 %175, %177
  %xor8.i130.i = xor i64 %172, %178
  %xor9.i131.i = xor i64 %172, %175
  %xor10.i132.i = xor i64 %172, %177
  %xor11.i133.i = xor i64 %173, %174
  %xor12.i134.i = xor i64 %xor11.i133.i, %179
  %xor13.i135.i = xor i64 %xor12.i134.i, %175
  %xor14.i136.i = xor i64 %xor8.i130.i, %xor.i129.i
  %xor15.i137.i = xor i64 %xor12.i134.i, %172
  %xor16.i138.i = xor i64 %xor12.i134.i, %178
  %xor17.i139.i = xor i64 %xor16.i138.i, %xor10.i132.i
  %xor18.i140.i = xor i64 %176, %xor14.i136.i
  %xor19.i141.i = xor i64 %xor18.i140.i, %177
  %xor20.i142.i = xor i64 %xor18.i140.i, %173
  %xor21.i143.i = xor i64 %xor19.i141.i, %179
  %xor22.i144.i = xor i64 %xor19.i141.i, %xor11.i133.i
  %xor23.i145.i = xor i64 %xor20.i142.i, %xor9.i131.i
  %xor24.i146.i = xor i64 %179, %xor23.i145.i
  %xor25.i147.i = xor i64 %xor22.i144.i, %xor23.i145.i
  %xor27.i148.i = xor i64 %xor11.i133.i, %xor23.i145.i
  %and.i149.i = and i64 %xor14.i136.i, %xor19.i141.i
  %and30.i150.i = and i64 %xor17.i139.i, %xor21.i143.i
  %xor31.i151.i = xor i64 %and30.i150.i, %and.i149.i
  %and32.i152.i = and i64 %xor13.i135.i, %179
  %and34.i153.i = and i64 %xor8.i130.i, %xor27.i148.i
  %and35.i154.i = and i64 %xor16.i138.i, %xor12.i134.i
  %and37.i155.i = and i64 %xor15.i137.i, %xor24.i146.i
  %and39.i156.i = and i64 %xor9.i131.i, %xor23.i145.i
  %and40.i157.i = and i64 %xor.i129.i, %xor25.i147.i
  %xor41.i158.i = xor i64 %and40.i157.i, %and39.i156.i
  %and42.i159.i = and i64 %xor10.i132.i, %xor22.i144.i
  %xor43.i160.i = xor i64 %and42.i159.i, %and39.i156.i
  %xor44.i161.i = xor i64 %xor31.i151.i, %xor41.i158.i
  %xor48.i162.i = xor i64 %xor44.i161.i, %xor20.i142.i
  %180 = xor i64 %xor10.i132.i, %and32.i152.i
  %181 = xor i64 %180, %xor22.i144.i
  %182 = xor i64 %181, %and.i149.i
  %xor49.i163.i = xor i64 %182, %xor43.i160.i
  %183 = xor i64 %xor27.i148.i, %and35.i154.i
  %184 = xor i64 %183, %xor8.i130.i
  %185 = xor i64 %184, %and34.i153.i
  %xor50.i164.i = xor i64 %185, %xor41.i158.i
  %186 = xor i64 %xor27.i148.i, %and37.i155.i
  %187 = xor i64 %186, %172
  %188 = xor i64 %187, %and34.i153.i
  %xor51.i165.i = xor i64 %188, %xor43.i160.i
  %xor52.i166.i = xor i64 %xor48.i162.i, %xor49.i163.i
  %and53.i167.i = and i64 %xor48.i162.i, %xor50.i164.i
  %xor54.i168.i = xor i64 %xor51.i165.i, %and53.i167.i
  %and55.i169.i = and i64 %xor52.i166.i, %xor54.i168.i
  %xor56.i170.i = xor i64 %and55.i169.i, %xor49.i163.i
  %xor57.i171.i = xor i64 %xor50.i164.i, %xor51.i165.i
  %xor58.i172.i = xor i64 %xor49.i163.i, %and53.i167.i
  %and59.i173.i = and i64 %xor58.i172.i, %xor57.i171.i
  %xor60.i174.i = xor i64 %and59.i173.i, %xor51.i165.i
  %xor61.i175.i = xor i64 %xor50.i164.i, %xor60.i174.i
  %xor62.i176.i = xor i64 %and59.i173.i, %and53.i167.i
  %and63.i177.i = and i64 %xor51.i165.i, %xor62.i176.i
  %xor64.i178.i = xor i64 %and63.i177.i, %xor61.i175.i
  %xor65.i179.i = xor i64 %xor54.i168.i, %and63.i177.i
  %and66.i180.i = and i64 %xor56.i170.i, %xor65.i179.i
  %xor67.i181.i = xor i64 %xor52.i166.i, %and66.i180.i
  %xor68.i182.i = xor i64 %xor67.i181.i, %xor64.i178.i
  %xor69.i183.i = xor i64 %xor56.i170.i, %xor60.i174.i
  %xor70.i184.i = xor i64 %xor56.i170.i, %xor67.i181.i
  %xor71.i185.i = xor i64 %and63.i177.i, %xor50.i164.i
  %xor72.i186.i = xor i64 %xor69.i183.i, %xor68.i182.i
  %and73.i187.i = and i64 %xor71.i185.i, %xor19.i141.i
  %and74.i188.i = and i64 %xor64.i178.i, %xor21.i143.i
  %and75.i189.i = and i64 %xor60.i174.i, %179
  %and76.i190.i = and i64 %xor70.i184.i, %xor27.i148.i
  %and77.i191.i = and i64 %xor67.i181.i, %xor12.i134.i
  %and78.i192.i = and i64 %xor56.i170.i, %xor24.i146.i
  %and79.i193.i = and i64 %xor69.i183.i, %xor23.i145.i
  %and80.i194.i = and i64 %xor72.i186.i, %xor25.i147.i
  %and81.i195.i = and i64 %xor68.i182.i, %xor22.i144.i
  %and82.i196.i = and i64 %xor71.i185.i, %xor14.i136.i
  %and83.i197.i = and i64 %xor64.i178.i, %xor17.i139.i
  %and84.i198.i = and i64 %xor60.i174.i, %xor13.i135.i
  %and85.i199.i = and i64 %xor70.i184.i, %xor8.i130.i
  %and86.i200.i = and i64 %xor67.i181.i, %xor16.i138.i
  %and87.i201.i = and i64 %xor56.i170.i, %xor15.i137.i
  %and88.i202.i = and i64 %xor69.i183.i, %xor9.i131.i
  %and89.i203.i = and i64 %xor72.i186.i, %xor.i129.i
  %and90.i204.i = and i64 %xor68.i182.i, %xor10.i132.i
  %xor91.i205.i = xor i64 %and88.i202.i, %and89.i203.i
  %xor92.i206.i = xor i64 %and83.i197.i, %and84.i198.i
  %xor93.i207.i = xor i64 %and78.i192.i, %and86.i200.i
  %xor94.i208.i = xor i64 %and82.i196.i, %and83.i197.i
  %xor95.i209.i = xor i64 %and75.i189.i, %and85.i199.i
  %xor96.i210.i = xor i64 %and75.i189.i, %and78.i192.i
  %xor97.i211.i = xor i64 %and80.i194.i, %and81.i195.i
  %xor98.i212.i = xor i64 %and73.i187.i, %and76.i190.i
  %xor99.i213.i = xor i64 %and79.i193.i, %and80.i194.i
  %xor100.i214.i = xor i64 %and89.i203.i, %and90.i204.i
  %xor101.i215.i = xor i64 %and85.i199.i, %xor93.i207.i
  %xor102.i216.i = xor i64 %xor95.i209.i, %xor98.i212.i
  %xor103.i217.i = xor i64 %and77.i191.i, %xor91.i205.i
  %xor104.i218.i = xor i64 %and76.i190.i, %xor99.i213.i
  %xor105.i219.i = xor i64 %xor91.i205.i, %xor102.i216.i
  %xor106.i220.i = xor i64 %and87.i201.i, %xor102.i216.i
  %xor107.i221.i = xor i64 %xor97.i211.i, %xor103.i217.i
  %xor108.i222.i = xor i64 %xor94.i208.i, %xor103.i217.i
  %xor109.i223.i = xor i64 %and77.i191.i, %xor104.i218.i
  %xor110.i224.i = xor i64 %xor106.i220.i, %xor107.i221.i
  %xor111.i225.i = xor i64 %and74.i188.i, %xor108.i222.i
  %xor112.i226.i = xor i64 %xor104.i218.i, %xor108.i222.i
  %189 = xor i64 %xor107.i221.i, %xor101.i215.i
  %xor113.i227.i = xor i64 %189, -1
  %190 = xor i64 %xor105.i219.i, %xor93.i207.i
  %xor115.i228.i = xor i64 %190, -1
  %xor117.i229.i = xor i64 %xor98.i212.i, %xor111.i225.i
  %xor118.i230.i = xor i64 %xor96.i210.i, %xor111.i225.i
  %xor119.i231.i = xor i64 %xor92.i206.i, %xor110.i224.i
  %191 = xor i64 %xor117.i229.i, %xor109.i223.i
  %xor121.i232.i = xor i64 %191, -1
  %192 = xor i64 %xor110.i224.i, %xor100.i214.i
  %193 = xor i64 %192, %xor109.i223.i
  %xor123.i233.i = xor i64 %193, -1
  %arrayidx124.i234.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %xor112.i226.i, ptr %arrayidx124.i234.i, align 8
  %arrayidx125.i235.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %xor121.i232.i, ptr %arrayidx125.i235.i, align 8
  %arrayidx126.i236.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %xor123.i233.i, ptr %arrayidx126.i236.i, align 8
  %arrayidx127.i237.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %xor117.i229.i, ptr %arrayidx127.i237.i, align 8
  %arrayidx128.i238.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %xor118.i230.i, ptr %arrayidx128.i238.i, align 8
  %arrayidx129.i239.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %xor119.i231.i, ptr %arrayidx129.i239.i, align 8
  %arrayidx130.i240.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %xor113.i227.i, ptr %arrayidx130.i240.i, align 8
  store i64 %xor115.i228.i, ptr %q.i, align 8
  br label %for.body.i5.i

for.body.i5.i:                                    ; preds = %for.body7.i, %for.body.i5.i
  %i.0.i3.i1153 = phi i32 [ 0, %for.body7.i ], [ %inc.i27.i, %for.body.i5.i ]
  %arrayidx.i6.i = getelementptr inbounds nuw i64, ptr %q.i, i32 %i.0.i3.i1153
  %194 = load i64, ptr %arrayidx.i6.i, align 8
  %and.i7.i = and i64 %194, 65535
  %and1.i8.i = lshr i64 %194, 4
  %shr.i9.i = and i64 %and1.i8.i, 268369920
  %or.i10.i = or disjoint i64 %and.i7.i, %shr.i9.i
  %and2.i11.i = shl i64 %194, 12
  %shl.i12.i = and i64 %and2.i11.i, 4026531840
  %or3.i13.i = or disjoint i64 %or.i10.i, %shl.i12.i
  %and4.i14.i = lshr i64 %194, 8
  %shr5.i15.i = and i64 %and4.i14.i, 1095216660480
  %or6.i16.i = or disjoint i64 %or3.i13.i, %shr5.i15.i
  %and7.i17.i = shl i64 %194, 8
  %shl8.i18.i = and i64 %and7.i17.i, 280375465082880
  %or9.i19.i = or disjoint i64 %or6.i16.i, %shl8.i18.i
  %and10.i20.i = lshr i64 %194, 12
  %shr11.i21.i = and i64 %and10.i20.i, 4222124650659840
  %or12.i22.i = or disjoint i64 %or9.i19.i, %shr11.i21.i
  %and13.i23.i = shl i64 %194, 4
  %shl14.i24.i = and i64 %and13.i23.i, -4503599627370496
  %or15.i25.i = or i64 %or12.i22.i, %shl14.i24.i
  %arrayidx16.i26.i = getelementptr inbounds nuw i64, ptr %q.i, i32 %i.0.i3.i1153
  store i64 %or15.i25.i, ptr %arrayidx16.i26.i, align 8
  %inc.i27.i = add nuw nsw i32 %i.0.i3.i1153, 1
  %exitcond.i4.i.not = icmp eq i32 %inc.i27.i, 8
  br i1 %exitcond.i4.i.not, label %shift_rows.exit28.i, label %for.body.i5.i, !llvm.loop !14

shift_rows.exit28.i:                              ; preds = %for.body.i5.i
  %195 = load i64, ptr %q.i, align 8
  %arrayidx1.i96.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %196 = load i64, ptr %arrayidx1.i96.i, align 8
  %arrayidx2.i97.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %197 = load i64, ptr %arrayidx2.i97.i, align 8
  %arrayidx3.i98.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %198 = load i64, ptr %arrayidx3.i98.i, align 8
  %arrayidx4.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %199 = load i64, ptr %arrayidx4.i.i, align 8
  %arrayidx5.i99.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %200 = load i64, ptr %arrayidx5.i99.i, align 8
  %arrayidx6.i100.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %201 = load i64, ptr %arrayidx6.i100.i, align 8
  %arrayidx7.i.i53 = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %202 = load i64, ptr %arrayidx7.i.i53, align 8
  %203 = call i64 @llvm.fshl.i64(i64 %195, i64 %195, i64 48)
  %204 = call i64 @llvm.fshl.i64(i64 %196, i64 %196, i64 48)
  %205 = call i64 @llvm.fshl.i64(i64 %197, i64 %197, i64 48)
  %206 = call i64 @llvm.fshl.i64(i64 %198, i64 %198, i64 48)
  %207 = call i64 @llvm.fshl.i64(i64 %199, i64 %199, i64 48)
  %208 = call i64 @llvm.fshl.i64(i64 %200, i64 %200, i64 48)
  %209 = call i64 @llvm.fshl.i64(i64 %201, i64 %201, i64 48)
  %210 = call i64 @llvm.fshl.i64(i64 %202, i64 %202, i64 48)
  %xor30.i.i = xor i64 %195, %203
  %211 = call i64 @llvm.fshl.i64(i64 %xor30.i.i, i64 %xor30.i.i, i64 32)
  %212 = xor i64 %210, %211
  %213 = xor i64 %212, %202
  %xor31.i.i = xor i64 %213, %203
  store i64 %xor31.i.i, ptr %q.i, align 8
  %xor37.i.i = xor i64 %196, %204
  %214 = call i64 @llvm.fshl.i64(i64 %xor37.i.i, i64 %xor37.i.i, i64 32)
  %215 = xor i64 %203, %214
  %216 = xor i64 %215, %195
  %217 = xor i64 %216, %202
  %218 = xor i64 %217, %210
  %xor39.i.i = xor i64 %218, %204
  %arrayidx40.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %xor39.i.i, ptr %arrayidx40.i.i, align 8
  %xor43.i.i = xor i64 %197, %205
  %219 = call i64 @llvm.fshl.i64(i64 %xor43.i.i, i64 %xor43.i.i, i64 32)
  %220 = xor i64 %204, %219
  %221 = xor i64 %220, %196
  %xor45.i.i = xor i64 %221, %205
  %arrayidx46.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %xor45.i.i, ptr %arrayidx46.i.i, align 8
  %xor51.i.i = xor i64 %198, %206
  %222 = call i64 @llvm.fshl.i64(i64 %xor51.i.i, i64 %xor51.i.i, i64 32)
  %223 = xor i64 %205, %222
  %224 = xor i64 %223, %197
  %225 = xor i64 %224, %202
  %226 = xor i64 %225, %210
  %xor53.i.i = xor i64 %226, %206
  %arrayidx54.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %xor53.i.i, ptr %arrayidx54.i.i, align 8
  %xor59.i.i = xor i64 %199, %207
  %227 = call i64 @llvm.fshl.i64(i64 %xor59.i.i, i64 %xor59.i.i, i64 32)
  %228 = xor i64 %206, %227
  %229 = xor i64 %228, %198
  %230 = xor i64 %229, %202
  %231 = xor i64 %230, %210
  %xor61.i.i = xor i64 %231, %207
  %arrayidx62.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %xor61.i.i, ptr %arrayidx62.i.i, align 8
  %xor65.i.i = xor i64 %200, %208
  %232 = call i64 @llvm.fshl.i64(i64 %xor65.i.i, i64 %xor65.i.i, i64 32)
  %233 = xor i64 %207, %232
  %234 = xor i64 %233, %199
  %xor67.i.i = xor i64 %234, %208
  %arrayidx68.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %xor67.i.i, ptr %arrayidx68.i.i, align 8
  %xor71.i.i = xor i64 %201, %209
  %235 = call i64 @llvm.fshl.i64(i64 %xor71.i.i, i64 %xor71.i.i, i64 32)
  %236 = xor i64 %208, %235
  %237 = xor i64 %236, %200
  %xor73.i.i = xor i64 %237, %209
  %arrayidx74.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %xor73.i.i, ptr %arrayidx74.i.i, align 8
  %xor77.i.i = xor i64 %202, %210
  %238 = call i64 @llvm.fshl.i64(i64 %xor77.i.i, i64 %xor77.i.i, i64 32)
  %239 = xor i64 %209, %238
  %240 = xor i64 %239, %201
  %xor79.i.i = xor i64 %240, %210
  %arrayidx80.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %xor79.i.i, ptr %arrayidx80.i.i, align 8
  %add.ptr13.idx.i = shl nuw nsw i32 %i.1.i1154, 6
  %add.ptr13.i = getelementptr inbounds nuw i8, ptr %119, i32 %add.ptr13.idx.i
  %241 = load i64, ptr %add.ptr13.i, align 8
  %242 = load i64, ptr %q.i, align 8
  %xor.i74.i = xor i64 %242, %241
  store i64 %xor.i74.i, ptr %q.i, align 8
  %arrayidx2.i75.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i, i32 8
  %243 = load i64, ptr %arrayidx2.i75.i, align 8
  %arrayidx3.i76.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %244 = load i64, ptr %arrayidx3.i76.i, align 8
  %xor4.i77.i = xor i64 %244, %243
  store i64 %xor4.i77.i, ptr %arrayidx3.i76.i, align 8
  %arrayidx5.i78.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i, i32 16
  %245 = load i64, ptr %arrayidx5.i78.i, align 8
  %arrayidx6.i79.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %246 = load i64, ptr %arrayidx6.i79.i, align 8
  %xor7.i80.i = xor i64 %246, %245
  store i64 %xor7.i80.i, ptr %arrayidx6.i79.i, align 8
  %arrayidx8.i81.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i, i32 24
  %247 = load i64, ptr %arrayidx8.i81.i, align 8
  %arrayidx9.i82.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %248 = load i64, ptr %arrayidx9.i82.i, align 8
  %xor10.i83.i = xor i64 %248, %247
  store i64 %xor10.i83.i, ptr %arrayidx9.i82.i, align 8
  %arrayidx11.i84.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i, i32 32
  %249 = load i64, ptr %arrayidx11.i84.i, align 8
  %arrayidx12.i85.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %250 = load i64, ptr %arrayidx12.i85.i, align 8
  %xor13.i86.i = xor i64 %250, %249
  store i64 %xor13.i86.i, ptr %arrayidx12.i85.i, align 8
  %arrayidx14.i87.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i, i32 40
  %251 = load i64, ptr %arrayidx14.i87.i, align 8
  %arrayidx15.i88.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %252 = load i64, ptr %arrayidx15.i88.i, align 8
  %xor16.i89.i = xor i64 %252, %251
  store i64 %xor16.i89.i, ptr %arrayidx15.i88.i, align 8
  %arrayidx17.i90.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i, i32 48
  %253 = load i64, ptr %arrayidx17.i90.i, align 8
  %arrayidx18.i91.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %254 = load i64, ptr %arrayidx18.i91.i, align 8
  %xor19.i92.i = xor i64 %254, %253
  store i64 %xor19.i92.i, ptr %arrayidx18.i91.i, align 8
  %arrayidx20.i93.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i, i32 56
  %255 = load i64, ptr %arrayidx20.i93.i, align 8
  %arrayidx21.i94.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %256 = load i64, ptr %arrayidx21.i94.i, align 8
  %xor22.i95.i = xor i64 %256, %255
  store i64 %xor22.i95.i, ptr %arrayidx21.i94.i, align 8
  %inc15.i = add nuw nsw i32 %i.1.i1154, 1
  %exitcond1.i.not = icmp eq i32 %inc15.i, 10
  br i1 %exitcond1.i.not, label %for.end16.i, label %for.body7.i, !llvm.loop !15

for.end16.i:                                      ; preds = %shift_rows.exit28.i
  %arrayidx.i101.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %257 = load i64, ptr %arrayidx.i101.i, align 8
  %arrayidx1.i102.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %258 = load i64, ptr %arrayidx1.i102.i, align 8
  %arrayidx2.i103.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %259 = load i64, ptr %arrayidx2.i103.i, align 8
  %arrayidx3.i104.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %260 = load i64, ptr %arrayidx3.i104.i, align 8
  %arrayidx4.i105.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %261 = load i64, ptr %arrayidx4.i105.i, align 8
  %arrayidx5.i106.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %262 = load i64, ptr %arrayidx5.i106.i, align 8
  %arrayidx6.i107.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %263 = load i64, ptr %arrayidx6.i107.i, align 8
  %264 = load i64, ptr %q.i, align 8
  %xor.i108.i = xor i64 %260, %262
  %xor8.i.i = xor i64 %257, %263
  %xor9.i.i = xor i64 %257, %260
  %xor10.i109.i = xor i64 %257, %262
  %xor11.i.i = xor i64 %258, %259
  %xor12.i.i = xor i64 %xor11.i.i, %264
  %xor13.i110.i = xor i64 %xor12.i.i, %260
  %xor14.i.i = xor i64 %xor8.i.i, %xor.i108.i
  %xor15.i.i = xor i64 %xor12.i.i, %257
  %xor16.i111.i = xor i64 %xor12.i.i, %263
  %xor17.i.i = xor i64 %xor16.i111.i, %xor10.i109.i
  %xor18.i.i = xor i64 %261, %xor14.i.i
  %xor19.i112.i = xor i64 %xor18.i.i, %262
  %xor20.i.i = xor i64 %xor18.i.i, %258
  %xor21.i.i = xor i64 %xor19.i112.i, %264
  %xor22.i113.i = xor i64 %xor19.i112.i, %xor11.i.i
  %xor23.i.i = xor i64 %xor20.i.i, %xor9.i.i
  %xor24.i.i = xor i64 %264, %xor23.i.i
  %xor25.i.i = xor i64 %xor22.i113.i, %xor23.i.i
  %xor27.i.i = xor i64 %xor11.i.i, %xor23.i.i
  %and.i114.i = and i64 %xor14.i.i, %xor19.i112.i
  %and30.i.i = and i64 %xor17.i.i, %xor21.i.i
  %xor31.i115.i = xor i64 %and30.i.i, %and.i114.i
  %and32.i.i = and i64 %xor13.i110.i, %264
  %and34.i.i = and i64 %xor8.i.i, %xor27.i.i
  %and35.i.i = and i64 %xor16.i111.i, %xor12.i.i
  %and37.i.i = and i64 %xor15.i.i, %xor24.i.i
  %and39.i.i = and i64 %xor9.i.i, %xor23.i.i
  %and40.i.i = and i64 %xor.i108.i, %xor25.i.i
  %xor41.i.i = xor i64 %and40.i.i, %and39.i.i
  %and42.i.i = and i64 %xor10.i109.i, %xor22.i113.i
  %xor43.i116.i = xor i64 %and42.i.i, %and39.i.i
  %xor44.i.i = xor i64 %xor31.i115.i, %xor41.i.i
  %xor48.i.i = xor i64 %xor44.i.i, %xor20.i.i
  %265 = xor i64 %xor10.i109.i, %and32.i.i
  %266 = xor i64 %265, %xor22.i113.i
  %267 = xor i64 %266, %and.i114.i
  %xor49.i.i = xor i64 %267, %xor43.i116.i
  %268 = xor i64 %xor27.i.i, %and35.i.i
  %269 = xor i64 %268, %xor8.i.i
  %270 = xor i64 %269, %and34.i.i
  %xor50.i.i = xor i64 %270, %xor41.i.i
  %271 = xor i64 %xor27.i.i, %and37.i.i
  %272 = xor i64 %271, %257
  %273 = xor i64 %272, %and34.i.i
  %xor51.i117.i = xor i64 %273, %xor43.i116.i
  %xor52.i.i = xor i64 %xor48.i.i, %xor49.i.i
  %and53.i.i = and i64 %xor48.i.i, %xor50.i.i
  %xor54.i.i = xor i64 %xor51.i117.i, %and53.i.i
  %and55.i.i = and i64 %xor52.i.i, %xor54.i.i
  %xor56.i.i = xor i64 %and55.i.i, %xor49.i.i
  %xor57.i.i = xor i64 %xor50.i.i, %xor51.i117.i
  %xor58.i.i = xor i64 %xor49.i.i, %and53.i.i
  %and59.i.i = and i64 %xor58.i.i, %xor57.i.i
  %xor60.i.i = xor i64 %and59.i.i, %xor51.i117.i
  %xor61.i118.i = xor i64 %xor50.i.i, %xor60.i.i
  %xor62.i.i = xor i64 %and59.i.i, %and53.i.i
  %and63.i.i = and i64 %xor51.i117.i, %xor62.i.i
  %xor64.i.i = xor i64 %and63.i.i, %xor61.i118.i
  %xor65.i119.i = xor i64 %xor54.i.i, %and63.i.i
  %and66.i.i = and i64 %xor56.i.i, %xor65.i119.i
  %xor67.i120.i = xor i64 %xor52.i.i, %and66.i.i
  %xor68.i.i = xor i64 %xor67.i120.i, %xor64.i.i
  %xor69.i.i = xor i64 %xor56.i.i, %xor60.i.i
  %xor70.i.i = xor i64 %xor56.i.i, %xor67.i120.i
  %xor71.i121.i = xor i64 %and63.i.i, %xor50.i.i
  %xor72.i.i = xor i64 %xor69.i.i, %xor68.i.i
  %and73.i.i = and i64 %xor71.i121.i, %xor19.i112.i
  %and74.i.i = and i64 %xor64.i.i, %xor21.i.i
  %and75.i.i = and i64 %xor60.i.i, %264
  %and76.i.i = and i64 %xor70.i.i, %xor27.i.i
  %and77.i.i = and i64 %xor67.i120.i, %xor12.i.i
  %and78.i.i = and i64 %xor56.i.i, %xor24.i.i
  %and79.i.i = and i64 %xor69.i.i, %xor23.i.i
  %and80.i.i = and i64 %xor72.i.i, %xor25.i.i
  %and81.i.i = and i64 %xor68.i.i, %xor22.i113.i
  %and82.i.i = and i64 %xor71.i121.i, %xor14.i.i
  %and83.i.i = and i64 %xor64.i.i, %xor17.i.i
  %and84.i.i = and i64 %xor60.i.i, %xor13.i110.i
  %and85.i.i = and i64 %xor70.i.i, %xor8.i.i
  %and86.i.i = and i64 %xor67.i120.i, %xor16.i111.i
  %and87.i.i = and i64 %xor56.i.i, %xor15.i.i
  %and88.i.i = and i64 %xor69.i.i, %xor9.i.i
  %and89.i.i = and i64 %xor72.i.i, %xor.i108.i
  %and90.i.i = and i64 %xor68.i.i, %xor10.i109.i
  %xor91.i.i = xor i64 %and88.i.i, %and89.i.i
  %xor92.i.i = xor i64 %and83.i.i, %and84.i.i
  %xor93.i.i = xor i64 %and78.i.i, %and86.i.i
  %xor94.i.i = xor i64 %and82.i.i, %and83.i.i
  %xor95.i.i = xor i64 %and75.i.i, %and85.i.i
  %xor96.i.i = xor i64 %and75.i.i, %and78.i.i
  %xor97.i.i = xor i64 %and80.i.i, %and81.i.i
  %xor98.i.i = xor i64 %and73.i.i, %and76.i.i
  %xor99.i.i = xor i64 %and79.i.i, %and80.i.i
  %xor100.i.i = xor i64 %and89.i.i, %and90.i.i
  %xor101.i.i = xor i64 %and85.i.i, %xor93.i.i
  %xor102.i.i = xor i64 %xor95.i.i, %xor98.i.i
  %xor103.i.i = xor i64 %and77.i.i, %xor91.i.i
  %xor104.i.i = xor i64 %and76.i.i, %xor99.i.i
  %xor105.i.i = xor i64 %xor91.i.i, %xor102.i.i
  %xor106.i.i = xor i64 %and87.i.i, %xor102.i.i
  %xor107.i.i = xor i64 %xor97.i.i, %xor103.i.i
  %xor108.i.i = xor i64 %xor94.i.i, %xor103.i.i
  %xor109.i.i = xor i64 %and77.i.i, %xor104.i.i
  %xor110.i.i = xor i64 %xor106.i.i, %xor107.i.i
  %xor111.i.i = xor i64 %and74.i.i, %xor108.i.i
  %xor112.i.i = xor i64 %xor104.i.i, %xor108.i.i
  %274 = xor i64 %xor107.i.i, %xor101.i.i
  %xor113.i.i = xor i64 %274, -1
  %275 = xor i64 %xor105.i.i, %xor93.i.i
  %xor115.i.i = xor i64 %275, -1
  %xor117.i.i = xor i64 %xor98.i.i, %xor111.i.i
  %xor118.i.i = xor i64 %xor96.i.i, %xor111.i.i
  %xor119.i.i = xor i64 %xor92.i.i, %xor110.i.i
  %276 = xor i64 %xor117.i.i, %xor109.i.i
  %xor121.i.i = xor i64 %276, -1
  %277 = xor i64 %xor110.i.i, %xor100.i.i
  %278 = xor i64 %277, %xor109.i.i
  %xor123.i.i = xor i64 %278, -1
  %arrayidx124.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %xor112.i.i, ptr %arrayidx124.i.i, align 8
  %arrayidx125.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %xor121.i.i, ptr %arrayidx125.i.i, align 8
  %arrayidx126.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %xor123.i.i, ptr %arrayidx126.i.i, align 8
  %arrayidx127.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %xor117.i.i, ptr %arrayidx127.i.i, align 8
  %arrayidx128.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %xor118.i.i, ptr %arrayidx128.i.i, align 8
  %arrayidx129.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %xor119.i.i, ptr %arrayidx129.i.i, align 8
  %arrayidx130.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %xor113.i.i, ptr %arrayidx130.i.i, align 8
  store i64 %xor115.i.i, ptr %q.i, align 8
  br label %for.body.i.i47

for.body.i.i47:                                   ; preds = %for.end16.i, %for.body.i.i47
  %i.0.i.i351155 = phi i32 [ 0, %for.end16.i ], [ %inc.i.i52, %for.body.i.i47 ]
  %arrayidx.i.i48 = getelementptr inbounds nuw i64, ptr %q.i, i32 %i.0.i.i351155
  %279 = load i64, ptr %arrayidx.i.i48, align 8
  %and.i.i = and i64 %279, 65535
  %and1.i.i = lshr i64 %279, 4
  %shr.i1.i = and i64 %and1.i.i, 268369920
  %or.i.i49 = or disjoint i64 %and.i.i, %shr.i1.i
  %and2.i.i = shl i64 %279, 12
  %shl.i.i50 = and i64 %and2.i.i, 4026531840
  %or3.i.i = or disjoint i64 %or.i.i49, %shl.i.i50
  %and4.i.i = lshr i64 %279, 8
  %shr5.i.i = and i64 %and4.i.i, 1095216660480
  %or6.i.i51 = or disjoint i64 %or3.i.i, %shr5.i.i
  %and7.i.i = shl i64 %279, 8
  %shl8.i.i = and i64 %and7.i.i, 280375465082880
  %or9.i.i = or disjoint i64 %or6.i.i51, %shl8.i.i
  %and10.i.i = lshr i64 %279, 12
  %shr11.i.i = and i64 %and10.i.i, 4222124650659840
  %or12.i.i = or disjoint i64 %or9.i.i, %shr11.i.i
  %and13.i.i = shl i64 %279, 4
  %shl14.i.i = and i64 %and13.i.i, -4503599627370496
  %or15.i.i = or i64 %or12.i.i, %shl14.i.i
  %arrayidx16.i.i = getelementptr inbounds nuw i64, ptr %q.i, i32 %i.0.i.i351155
  store i64 %or15.i.i, ptr %arrayidx16.i.i, align 8
  %inc.i.i52 = add nuw nsw i32 %i.0.i.i351155, 1
  %exitcond.i.i36.not = icmp eq i32 %inc.i.i52, 8
  br i1 %exitcond.i.i36.not, label %shift_rows.exit.i, label %for.body.i.i47, !llvm.loop !16

shift_rows.exit.i:                                ; preds = %for.body.i.i47
  %add.ptr20.i = getelementptr inbounds nuw i8, ptr %119, i32 640
  %280 = load i64, ptr %add.ptr20.i, align 8
  %281 = load i64, ptr %q.i, align 8
  %xor.i52.i = xor i64 %281, %280
  store i64 %xor.i52.i, ptr %q.i, align 8
  %arrayidx2.i53.i = getelementptr inbounds nuw i8, ptr %119, i32 648
  %282 = load i64, ptr %arrayidx2.i53.i, align 8
  %arrayidx3.i54.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %283 = load i64, ptr %arrayidx3.i54.i, align 8
  %xor4.i55.i = xor i64 %283, %282
  store i64 %xor4.i55.i, ptr %arrayidx3.i54.i, align 8
  %arrayidx5.i56.i = getelementptr inbounds nuw i8, ptr %119, i32 656
  %284 = load i64, ptr %arrayidx5.i56.i, align 8
  %arrayidx6.i57.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %285 = load i64, ptr %arrayidx6.i57.i, align 8
  %xor7.i58.i = xor i64 %285, %284
  store i64 %xor7.i58.i, ptr %arrayidx6.i57.i, align 8
  %arrayidx8.i59.i = getelementptr inbounds nuw i8, ptr %119, i32 664
  %286 = load i64, ptr %arrayidx8.i59.i, align 8
  %arrayidx9.i60.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %287 = load i64, ptr %arrayidx9.i60.i, align 8
  %xor10.i61.i = xor i64 %287, %286
  store i64 %xor10.i61.i, ptr %arrayidx9.i60.i, align 8
  %arrayidx11.i62.i = getelementptr inbounds nuw i8, ptr %119, i32 672
  %288 = load i64, ptr %arrayidx11.i62.i, align 8
  %arrayidx12.i63.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %289 = load i64, ptr %arrayidx12.i63.i, align 8
  %xor13.i64.i = xor i64 %289, %288
  store i64 %xor13.i64.i, ptr %arrayidx12.i63.i, align 8
  %arrayidx14.i65.i = getelementptr inbounds nuw i8, ptr %119, i32 680
  %290 = load i64, ptr %arrayidx14.i65.i, align 8
  %arrayidx15.i66.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %291 = load i64, ptr %arrayidx15.i66.i, align 8
  %xor16.i67.i = xor i64 %291, %290
  store i64 %xor16.i67.i, ptr %arrayidx15.i66.i, align 8
  %arrayidx17.i68.i = getelementptr inbounds nuw i8, ptr %119, i32 688
  %292 = load i64, ptr %arrayidx17.i68.i, align 8
  %arrayidx18.i69.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %293 = load i64, ptr %arrayidx18.i69.i, align 8
  %xor19.i70.i = xor i64 %293, %292
  store i64 %xor19.i70.i, ptr %arrayidx18.i69.i, align 8
  %arrayidx20.i71.i = getelementptr inbounds nuw i8, ptr %119, i32 696
  %294 = load i64, ptr %arrayidx20.i71.i, align 8
  %arrayidx21.i72.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %295 = load i64, ptr %arrayidx21.i72.i, align 8
  %xor22.i73.i = xor i64 %295, %294
  store i64 %xor22.i73.i, ptr %arrayidx21.i72.i, align 8
  %296 = load i64, ptr %q.i, align 8
  %arrayidx1.i268.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %297 = load i64, ptr %arrayidx1.i268.i, align 8
  %and.i269.i = and i64 %296, 6148914691236517205
  %and2.i270.i = shl i64 %297, 1
  %shl.i271.i = and i64 %and2.i270.i, -6148914691236517206
  %or.i272.i = or disjoint i64 %and.i269.i, %shl.i271.i
  store i64 %or.i272.i, ptr %q.i, align 8
  %and4.i273.i = lshr i64 %296, 1
  %shr.i274.i = and i64 %and4.i273.i, 6148914691236517205
  %and5.i275.i = and i64 %297, -6148914691236517206
  %or6.i276.i = or disjoint i64 %shr.i274.i, %and5.i275.i
  %arrayidx7.i277.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or6.i276.i, ptr %arrayidx7.i277.i, align 8
  %arrayidx11.i278.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %298 = load i64, ptr %arrayidx11.i278.i, align 8
  %arrayidx12.i279.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %299 = load i64, ptr %arrayidx12.i279.i, align 8
  %and13.i280.i = and i64 %298, 6148914691236517205
  %and14.i281.i = shl i64 %299, 1
  %shl15.i282.i = and i64 %and14.i281.i, -6148914691236517206
  %or16.i283.i = or disjoint i64 %and13.i280.i, %shl15.i282.i
  %arrayidx17.i284.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or16.i283.i, ptr %arrayidx17.i284.i, align 8
  %and18.i285.i = lshr i64 %298, 1
  %shr19.i286.i = and i64 %and18.i285.i, 6148914691236517205
  %and20.i287.i = and i64 %299, -6148914691236517206
  %or21.i288.i = or disjoint i64 %shr19.i286.i, %and20.i287.i
  %arrayidx22.i289.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or21.i288.i, ptr %arrayidx22.i289.i, align 8
  %arrayidx27.i290.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %300 = load i64, ptr %arrayidx27.i290.i, align 8
  %arrayidx28.i291.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %301 = load i64, ptr %arrayidx28.i291.i, align 8
  %and29.i292.i = and i64 %300, 6148914691236517205
  %and30.i293.i = shl i64 %301, 1
  %shl31.i294.i = and i64 %and30.i293.i, -6148914691236517206
  %or32.i295.i = or disjoint i64 %and29.i292.i, %shl31.i294.i
  %arrayidx33.i296.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or32.i295.i, ptr %arrayidx33.i296.i, align 8
  %and34.i297.i = lshr i64 %300, 1
  %shr35.i298.i = and i64 %and34.i297.i, 6148914691236517205
  %and36.i299.i = and i64 %301, -6148914691236517206
  %or37.i300.i = or disjoint i64 %shr35.i298.i, %and36.i299.i
  %arrayidx38.i301.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or37.i300.i, ptr %arrayidx38.i301.i, align 8
  %arrayidx43.i302.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %302 = load i64, ptr %arrayidx43.i302.i, align 8
  %arrayidx44.i303.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %303 = load i64, ptr %arrayidx44.i303.i, align 8
  %and45.i304.i = and i64 %302, 6148914691236517205
  %and46.i305.i = shl i64 %303, 1
  %shl47.i306.i = and i64 %and46.i305.i, -6148914691236517206
  %or48.i307.i = or disjoint i64 %and45.i304.i, %shl47.i306.i
  %arrayidx49.i308.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or48.i307.i, ptr %arrayidx49.i308.i, align 8
  %and50.i309.i = lshr i64 %302, 1
  %shr51.i310.i = and i64 %and50.i309.i, 6148914691236517205
  %and52.i311.i = and i64 %303, -6148914691236517206
  %or53.i312.i = or disjoint i64 %shr51.i310.i, %and52.i311.i
  %arrayidx54.i313.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or53.i312.i, ptr %arrayidx54.i313.i, align 8
  %304 = load i64, ptr %q.i, align 8
  %arrayidx60.i314.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %305 = load i64, ptr %arrayidx60.i314.i, align 8
  %and61.i315.i = and i64 %304, 3689348814741910323
  %and62.i316.i = shl i64 %305, 2
  %shl63.i317.i = and i64 %and62.i316.i, -3689348814741910324
  %or64.i318.i = or disjoint i64 %and61.i315.i, %shl63.i317.i
  store i64 %or64.i318.i, ptr %q.i, align 8
  %and66.i319.i = lshr i64 %304, 2
  %shr67.i320.i = and i64 %and66.i319.i, 3689348814741910323
  %and68.i321.i = and i64 %305, -3689348814741910324
  %or69.i322.i = or disjoint i64 %shr67.i320.i, %and68.i321.i
  %arrayidx70.i323.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or69.i322.i, ptr %arrayidx70.i323.i, align 8
  %arrayidx75.i324.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %306 = load i64, ptr %arrayidx75.i324.i, align 8
  %arrayidx76.i325.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %307 = load i64, ptr %arrayidx76.i325.i, align 8
  %and77.i326.i = and i64 %306, 3689348814741910323
  %and78.i327.i = shl i64 %307, 2
  %shl79.i328.i = and i64 %and78.i327.i, -3689348814741910324
  %or80.i329.i = or disjoint i64 %and77.i326.i, %shl79.i328.i
  %arrayidx81.i330.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or80.i329.i, ptr %arrayidx81.i330.i, align 8
  %and82.i331.i = lshr i64 %306, 2
  %shr83.i332.i = and i64 %and82.i331.i, 3689348814741910323
  %and84.i333.i = and i64 %307, -3689348814741910324
  %or85.i334.i = or disjoint i64 %shr83.i332.i, %and84.i333.i
  %arrayidx86.i335.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or85.i334.i, ptr %arrayidx86.i335.i, align 8
  %arrayidx91.i336.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %308 = load i64, ptr %arrayidx91.i336.i, align 8
  %arrayidx92.i337.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %309 = load i64, ptr %arrayidx92.i337.i, align 8
  %and93.i338.i = and i64 %308, 3689348814741910323
  %and94.i339.i = shl i64 %309, 2
  %shl95.i340.i = and i64 %and94.i339.i, -3689348814741910324
  %or96.i341.i = or disjoint i64 %and93.i338.i, %shl95.i340.i
  %arrayidx97.i342.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or96.i341.i, ptr %arrayidx97.i342.i, align 8
  %and98.i343.i = lshr i64 %308, 2
  %shr99.i344.i = and i64 %and98.i343.i, 3689348814741910323
  %and100.i345.i = and i64 %309, -3689348814741910324
  %or101.i346.i = or disjoint i64 %shr99.i344.i, %and100.i345.i
  %arrayidx102.i347.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or101.i346.i, ptr %arrayidx102.i347.i, align 8
  %arrayidx107.i348.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %310 = load i64, ptr %arrayidx107.i348.i, align 8
  %arrayidx108.i349.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %311 = load i64, ptr %arrayidx108.i349.i, align 8
  %and109.i350.i = and i64 %310, 3689348814741910323
  %and110.i351.i = shl i64 %311, 2
  %shl111.i352.i = and i64 %and110.i351.i, -3689348814741910324
  %or112.i353.i = or disjoint i64 %and109.i350.i, %shl111.i352.i
  %arrayidx113.i354.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or112.i353.i, ptr %arrayidx113.i354.i, align 8
  %and114.i355.i = lshr i64 %310, 2
  %shr115.i356.i = and i64 %and114.i355.i, 3689348814741910323
  %and116.i357.i = and i64 %311, -3689348814741910324
  %or117.i358.i = or disjoint i64 %shr115.i356.i, %and116.i357.i
  %arrayidx118.i359.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or117.i358.i, ptr %arrayidx118.i359.i, align 8
  %312 = load i64, ptr %q.i, align 8
  %arrayidx124.i360.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %313 = load i64, ptr %arrayidx124.i360.i, align 8
  %and125.i361.i = and i64 %312, 1085102592571150095
  %and126.i362.i = shl i64 %313, 4
  %shl127.i363.i = and i64 %and126.i362.i, -1085102592571150096
  %or128.i364.i = or disjoint i64 %and125.i361.i, %shl127.i363.i
  store i64 %or128.i364.i, ptr %q.i, align 8
  %and130.i365.i = lshr i64 %312, 4
  %shr131.i366.i = and i64 %and130.i365.i, 1085102592571150095
  %and132.i367.i = and i64 %313, -1085102592571150096
  %or133.i368.i = or disjoint i64 %shr131.i366.i, %and132.i367.i
  %arrayidx134.i369.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or133.i368.i, ptr %arrayidx134.i369.i, align 8
  %arrayidx139.i370.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %314 = load i64, ptr %arrayidx139.i370.i, align 8
  %arrayidx140.i371.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %315 = load i64, ptr %arrayidx140.i371.i, align 8
  %and141.i372.i = and i64 %314, 1085102592571150095
  %and142.i373.i = shl i64 %315, 4
  %shl143.i374.i = and i64 %and142.i373.i, -1085102592571150096
  %or144.i375.i = or disjoint i64 %and141.i372.i, %shl143.i374.i
  %arrayidx145.i376.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or144.i375.i, ptr %arrayidx145.i376.i, align 8
  %and146.i377.i = lshr i64 %314, 4
  %shr147.i378.i = and i64 %and146.i377.i, 1085102592571150095
  %and148.i379.i = and i64 %315, -1085102592571150096
  %or149.i380.i = or disjoint i64 %shr147.i378.i, %and148.i379.i
  %arrayidx150.i381.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or149.i380.i, ptr %arrayidx150.i381.i, align 8
  %arrayidx155.i382.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %316 = load i64, ptr %arrayidx155.i382.i, align 8
  %arrayidx156.i383.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %317 = load i64, ptr %arrayidx156.i383.i, align 8
  %and157.i384.i = and i64 %316, 1085102592571150095
  %and158.i385.i = shl i64 %317, 4
  %shl159.i386.i = and i64 %and158.i385.i, -1085102592571150096
  %or160.i387.i = or disjoint i64 %and157.i384.i, %shl159.i386.i
  %arrayidx161.i388.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or160.i387.i, ptr %arrayidx161.i388.i, align 8
  %and162.i389.i = lshr i64 %316, 4
  %shr163.i390.i = and i64 %and162.i389.i, 1085102592571150095
  %and164.i391.i = and i64 %317, -1085102592571150096
  %or165.i392.i = or disjoint i64 %shr163.i390.i, %and164.i391.i
  %arrayidx166.i393.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or165.i392.i, ptr %arrayidx166.i393.i, align 8
  %arrayidx171.i394.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %318 = load i64, ptr %arrayidx171.i394.i, align 8
  %arrayidx172.i395.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %319 = load i64, ptr %arrayidx172.i395.i, align 8
  %and173.i396.i = and i64 %318, 1085102592571150095
  %and174.i397.i = shl i64 %319, 4
  %shl175.i398.i = and i64 %and174.i397.i, -1085102592571150096
  %or176.i399.i = or disjoint i64 %and173.i396.i, %shl175.i398.i
  %arrayidx177.i400.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or176.i399.i, ptr %arrayidx177.i400.i, align 8
  %and178.i401.i = lshr i64 %318, 4
  %shr179.i402.i = and i64 %and178.i401.i, 1085102592571150095
  %and180.i403.i = and i64 %319, -1085102592571150096
  %or181.i404.i = or disjoint i64 %shr179.i402.i, %and180.i403.i
  %arrayidx182.i405.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or181.i404.i, ptr %arrayidx182.i405.i, align 8
  br label %for.body24.i

while.cond.i.i37.preheader:                       ; preds = %for.body24.i
  br label %while.body.i.i41

for.body24.i:                                     ; preds = %shift_rows.exit.i, %for.body24.i
  %i.2.i1156 = phi i32 [ 0, %shift_rows.exit.i ], [ %inc32.i, %for.body24.i ]
  %add.ptr27.idx.i = shl nuw nsw i32 %i.2.i1156, 4
  %add.ptr27.i = getelementptr inbounds nuw i8, ptr %w.i, i32 %add.ptr27.idx.i
  %arrayidx28.i = getelementptr inbounds nuw [8 x i64], ptr %q.i, i32 0, i32 %i.2.i1156
  %320 = load i64, ptr %arrayidx28.i, align 8
  %add29.i = or disjoint i32 %i.2.i1156, 4
  %arrayidx30.i = getelementptr inbounds nuw [8 x i64], ptr %q.i, i32 0, i32 %add29.i
  %321 = load i64, ptr %arrayidx30.i, align 8
  %and.i29.i = and i64 %320, 71777214294589695
  %and1.i30.i = and i64 %321, 71777214294589695
  %shr.i31.i = lshr i64 %320, 8
  %and2.i32.i = and i64 %shr.i31.i, 71776119077928960
  %shr3.i33.i = lshr i64 %321, 8
  %and4.i34.i = and i64 %shr3.i33.i, 71776119077928960
  %shr5.i35.i = lshr i64 %and.i29.i, 8
  %or.i36.i = or disjoint i64 %and.i29.i, %shr5.i35.i
  %shr6.i37.i = lshr i64 %and1.i30.i, 8
  %or7.i.i = or disjoint i64 %and1.i30.i, %shr6.i37.i
  %322 = and i64 %320, 280375465148160
  %323 = or disjoint i64 %and2.i32.i, %322
  %or9.i38.i = lshr exact i64 %323, 8
  %324 = and i64 %321, 280375465148160
  %325 = or disjoint i64 %and4.i34.i, %324
  %or11.i.i = lshr exact i64 %325, 8
  %and12.i.i = and i64 %or.i36.i, 281470681808895
  %and13.i39.i = and i64 %or7.i.i, 281470681808895
  %shr16.i.i = lshr i64 %and12.i.i, 16
  %or181.i.i = or disjoint i64 %and12.i.i, %shr16.i.i
  %or18.i.i = trunc i64 %or181.i.i to i32
  store i32 %or18.i.i, ptr %add.ptr27.i, align 4
  %shr20.i.i = lshr i64 %and13.i39.i, 16
  %or222.i.i = or disjoint i64 %and13.i39.i, %shr20.i.i
  %or22.i.i = trunc i64 %or222.i.i to i32
  %arrayidx23.i.i = getelementptr inbounds nuw i8, ptr %add.ptr27.i, i32 4
  store i32 %or22.i.i, ptr %arrayidx23.i.i, align 4
  %shr25.i.i = lshr i64 %323, 24
  %or273.i.i = or disjoint i64 %or9.i38.i, %shr25.i.i
  %or27.i.i = trunc i64 %or273.i.i to i32
  %arrayidx28.i.i = getelementptr inbounds nuw i8, ptr %add.ptr27.i, i32 8
  store i32 %or27.i.i, ptr %arrayidx28.i.i, align 4
  %shr30.i.i = lshr i64 %325, 24
  %or324.i.i = or disjoint i64 %or11.i.i, %shr30.i.i
  %or32.i.i = trunc i64 %or324.i.i to i32
  %arrayidx33.i.i = getelementptr inbounds nuw i8, ptr %add.ptr27.i, i32 12
  store i32 %or32.i.i, ptr %arrayidx33.i.i, align 4
  %inc32.i = add nuw nsw i32 %i.2.i1156, 1
  %exitcond2.i.not = icmp eq i32 %inc32.i, 4
  br i1 %exitcond2.i.not, label %while.cond.i.i37.preheader, label %for.body24.i, !llvm.loop !17

while.body.i.i41:                                 ; preds = %while.cond.i.i37.preheader, %while.body.i.i41
  %dst.addr.0.i.i1159 = phi ptr [ %out.addr.0.i1161, %while.cond.i.i37.preheader ], [ %add.ptr.i.i46, %while.body.i.i41 ]
  %v.addr.0.i.i391158 = phi ptr [ %w.i, %while.cond.i.i37.preheader ], [ %incdec.ptr.i.i43, %while.body.i.i41 ]
  %num.addr.0.i.i381157 = phi i32 [ 16, %while.cond.i.i37.preheader ], [ %dec.i.i42, %while.body.i.i41 ]
  %dec.i.i42 = add nsw i32 %num.addr.0.i.i381157, -1
  %incdec.ptr.i.i43 = getelementptr inbounds nuw i8, ptr %v.addr.0.i.i391158, i32 4
  %326 = load i32, ptr %v.addr.0.i.i391158, align 4
  %conv.i.i44 = trunc i32 %326 to i8
  store i8 %conv.i.i44, ptr %dst.addr.0.i.i1159, align 1
  %shr.i.i = lshr i32 %326, 8
  %conv1.i.i = trunc i32 %shr.i.i to i8
  %arrayidx2.i.i = getelementptr inbounds nuw i8, ptr %dst.addr.0.i.i1159, i32 1
  store i8 %conv1.i.i, ptr %arrayidx2.i.i, align 1
  %shr3.i.i = lshr i32 %326, 16
  %conv4.i.i45 = trunc i32 %shr3.i.i to i8
  %arrayidx5.i.i = getelementptr inbounds nuw i8, ptr %dst.addr.0.i.i1159, i32 2
  store i8 %conv4.i.i45, ptr %arrayidx5.i.i, align 1
  %shr6.i.i = lshr i32 %326, 24
  %conv7.i.i = trunc nuw i32 %shr6.i.i to i8
  %arrayidx8.i.i = getelementptr inbounds nuw i8, ptr %dst.addr.0.i.i1159, i32 3
  store i8 %conv7.i.i, ptr %arrayidx8.i.i, align 1
  %add.ptr.i.i46 = getelementptr inbounds nuw i8, ptr %dst.addr.0.i.i1159, i32 4
  %cmp.not.i.i40 = icmp eq i32 %dec.i.i42, 0
  br i1 %cmp.not.i.i40, label %aes_ecb4x.exit, label %while.body.i.i41, !llvm.loop !18

aes_ecb4x.exit:                                   ; preds = %while.body.i.i41
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %w.i)
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %q.i)
  %add.ptr.i21 = getelementptr inbounds nuw i8, ptr %ivw.i, i32 12
  %327 = load i32, ptr %add.ptr.i21, align 4
  %328 = call i32 @llvm.bswap.i32(i32 %327)
  %add.i8.i = add i32 %328, 4
  %329 = call i32 @llvm.bswap.i32(i32 %add.i8.i)
  store i32 %329, ptr %add.ptr.i21, align 4
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %ivw.i, i32 28
  %330 = load i32, ptr %add.ptr1.i, align 4
  %331 = call i32 @llvm.bswap.i32(i32 %330)
  %add.i5.i = add i32 %331, 4
  %332 = call i32 @llvm.bswap.i32(i32 %add.i5.i)
  store i32 %332, ptr %add.ptr1.i, align 4
  %add.ptr2.i = getelementptr inbounds nuw i8, ptr %ivw.i, i32 44
  %333 = load i32, ptr %add.ptr2.i, align 4
  %334 = call i32 @llvm.bswap.i32(i32 %333)
  %add.i2.i = add i32 %334, 4
  %335 = call i32 @llvm.bswap.i32(i32 %add.i2.i)
  store i32 %335, ptr %add.ptr2.i, align 4
  %add.ptr3.i = getelementptr inbounds nuw i8, ptr %ivw.i, i32 60
  %336 = load i32, ptr %add.ptr3.i, align 4
  %337 = call i32 @llvm.bswap.i32(i32 %336)
  %add.i.i = add i32 %337, 4
  %338 = call i32 @llvm.bswap.i32(i32 %add.i.i)
  store i32 %338, ptr %add.ptr3.i, align 4
  %add.ptr21.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i1161, i32 64
  %sub.i20 = add nsw i32 %outlen.addr.0.i1160, -64
  %cmp.i15 = icmp ugt i32 %sub.i20, 64
  br i1 %cmp.i15, label %while.body.i, label %while.end.i, !llvm.loop !19

while.end.i:                                      ; preds = %aes_ecb4x.exit
  %out.addr.0.i.lcssa = phi ptr [ %add.ptr21.i, %aes_ecb4x.exit ]
  br label %if.then.i

if.then.i:                                        ; preds = %while.end.i
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %w.i63)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %q.i64)
  %call.i65 = call ptr @memcpy(ptr noundef nonnull %w.i63, ptr noundef nonnull %ivw.i, i32 noundef 64) #8
  br label %for.body.i802

for.body.i802:                                    ; preds = %if.then.i, %for.body.i802
  %i.0.i671162 = phi i32 [ 0, %if.then.i ], [ %inc.i839, %for.body.i802 ]
  %arrayidx.i803 = getelementptr inbounds nuw [8 x i64], ptr %q.i64, i32 0, i32 %i.0.i671162
  %add.i804 = or disjoint i32 %i.0.i671162, 4
  %arrayidx1.i805 = getelementptr inbounds nuw [8 x i64], ptr %q.i64, i32 0, i32 %add.i804
  %add.ptr.idx.i806 = shl nuw nsw i32 %i.0.i671162, 4
  %add.ptr.i807 = getelementptr inbounds nuw i8, ptr %w.i63, i32 %add.ptr.idx.i806
  %339 = load i32, ptr %add.ptr.i807, align 4
  %conv.i40.i808 = zext i32 %339 to i64
  %arrayidx1.i.i809 = getelementptr inbounds nuw i8, ptr %add.ptr.i807, i32 4
  %340 = load i32, ptr %arrayidx1.i.i809, align 4
  %conv2.i.i810 = zext i32 %340 to i64
  %arrayidx3.i.i811 = getelementptr inbounds nuw i8, ptr %add.ptr.i807, i32 8
  %341 = load i32, ptr %arrayidx3.i.i811, align 4
  %conv4.i41.i812 = zext i32 %341 to i64
  %arrayidx5.i42.i813 = getelementptr inbounds nuw i8, ptr %add.ptr.i807, i32 12
  %342 = load i32, ptr %arrayidx5.i42.i813, align 4
  %conv6.i.i814 = zext i32 %342 to i64
  %shl.i43.i815 = shl nuw nsw i64 %conv.i40.i808, 16
  %or.i44.i816 = or i64 %shl.i43.i815, %conv.i40.i808
  %shl7.i.i817 = shl nuw nsw i64 %conv2.i.i810, 16
  %or8.i.i818 = or i64 %shl7.i.i817, %conv2.i.i810
  %shl9.i.i819 = shl nuw nsw i64 %conv4.i41.i812, 16
  %or10.i.i820 = or i64 %shl9.i.i819, %conv4.i41.i812
  %shl11.i.i821 = shl nuw nsw i64 %conv6.i.i814, 16
  %or12.i45.i822 = or i64 %shl11.i.i821, %conv6.i.i814
  %and.i46.i823 = and i64 %or.i44.i816, 281470681808895
  %and13.i47.i824 = and i64 %or8.i.i818, 281470681808895
  %and14.i.i825 = and i64 %or10.i.i820, 281470681808895
  %and15.i.i826 = and i64 %or12.i45.i822, 281470681808895
  %shl16.i.i827 = shl nuw nsw i64 %and.i46.i823, 8
  %or17.i.i828 = or i64 %and.i46.i823, %shl16.i.i827
  %shl18.i.i829 = shl nuw nsw i64 %and13.i47.i824, 8
  %or19.i.i830 = or i64 %and13.i47.i824, %shl18.i.i829
  %and24.i.i831 = and i64 %or17.i.i828, 71777214294589695
  %and25.i.i832 = and i64 %or19.i.i830, 71777214294589695
  %343 = shl nuw i64 %and14.i.i825, 16
  %344 = shl nuw nsw i64 %and14.i.i825, 8
  %and26.i.i833 = or i64 %343, %344
  %shl28.i.i834 = and i64 %and26.i.i833, -71777214294589696
  %or29.i.i835 = or disjoint i64 %and24.i.i831, %shl28.i.i834
  store i64 %or29.i.i835, ptr %arrayidx.i803, align 8
  %345 = shl nuw i64 %and15.i.i826, 16
  %346 = shl nuw nsw i64 %and15.i.i826, 8
  %and27.i.i836 = or i64 %345, %346
  %shl30.i.i837 = and i64 %and27.i.i836, -71777214294589696
  %or31.i.i838 = or disjoint i64 %and25.i.i832, %shl30.i.i837
  store i64 %or31.i.i838, ptr %arrayidx1.i805, align 8
  %inc.i839 = add nuw nsw i32 %i.0.i671162, 1
  %exitcond.i68.not = icmp eq i32 %inc.i839, 4
  br i1 %exitcond.i68.not, label %for.end.i69, label %for.body.i802, !llvm.loop !20

for.end.i69:                                      ; preds = %for.body.i802
  %347 = load i64, ptr %q.i64, align 8
  %arrayidx1.i241.i70 = getelementptr inbounds nuw i8, ptr %q.i64, i32 8
  %348 = load i64, ptr %arrayidx1.i241.i70, align 8
  %and.i242.i71 = and i64 %347, 6148914691236517205
  %and2.i243.i72 = shl i64 %348, 1
  %shl.i244.i73 = and i64 %and2.i243.i72, -6148914691236517206
  %or.i245.i74 = or disjoint i64 %and.i242.i71, %shl.i244.i73
  store i64 %or.i245.i74, ptr %q.i64, align 8
  %and4.i246.i75 = lshr i64 %347, 1
  %shr.i247.i76 = and i64 %and4.i246.i75, 6148914691236517205
  %and5.i.i77 = and i64 %348, -6148914691236517206
  %or6.i248.i78 = or disjoint i64 %shr.i247.i76, %and5.i.i77
  %arrayidx7.i249.i79 = getelementptr inbounds nuw i8, ptr %q.i64, i32 8
  store i64 %or6.i248.i78, ptr %arrayidx7.i249.i79, align 8
  %arrayidx11.i250.i80 = getelementptr inbounds nuw i8, ptr %q.i64, i32 16
  %349 = load i64, ptr %arrayidx11.i250.i80, align 8
  %arrayidx12.i251.i81 = getelementptr inbounds nuw i8, ptr %q.i64, i32 24
  %350 = load i64, ptr %arrayidx12.i251.i81, align 8
  %and13.i252.i82 = and i64 %349, 6148914691236517205
  %and14.i253.i83 = shl i64 %350, 1
  %shl15.i.i84 = and i64 %and14.i253.i83, -6148914691236517206
  %or16.i.i85 = or disjoint i64 %and13.i252.i82, %shl15.i.i84
  %arrayidx17.i254.i86 = getelementptr inbounds nuw i8, ptr %q.i64, i32 16
  store i64 %or16.i.i85, ptr %arrayidx17.i254.i86, align 8
  %and18.i.i87 = lshr i64 %349, 1
  %shr19.i.i88 = and i64 %and18.i.i87, 6148914691236517205
  %and20.i.i89 = and i64 %350, -6148914691236517206
  %or21.i.i90 = or disjoint i64 %shr19.i.i88, %and20.i.i89
  %arrayidx22.i.i91 = getelementptr inbounds nuw i8, ptr %q.i64, i32 24
  store i64 %or21.i.i90, ptr %arrayidx22.i.i91, align 8
  %arrayidx27.i.i92 = getelementptr inbounds nuw i8, ptr %q.i64, i32 32
  %351 = load i64, ptr %arrayidx27.i.i92, align 8
  %arrayidx28.i255.i93 = getelementptr inbounds nuw i8, ptr %q.i64, i32 40
  %352 = load i64, ptr %arrayidx28.i255.i93, align 8
  %and29.i.i94 = and i64 %351, 6148914691236517205
  %and30.i256.i95 = shl i64 %352, 1
  %shl31.i.i96 = and i64 %and30.i256.i95, -6148914691236517206
  %or32.i257.i97 = or disjoint i64 %and29.i.i94, %shl31.i.i96
  %arrayidx33.i258.i98 = getelementptr inbounds nuw i8, ptr %q.i64, i32 32
  store i64 %or32.i257.i97, ptr %arrayidx33.i258.i98, align 8
  %and34.i259.i99 = lshr i64 %351, 1
  %shr35.i.i100 = and i64 %and34.i259.i99, 6148914691236517205
  %and36.i.i101 = and i64 %352, -6148914691236517206
  %or37.i.i102 = or disjoint i64 %shr35.i.i100, %and36.i.i101
  %arrayidx38.i.i103 = getelementptr inbounds nuw i8, ptr %q.i64, i32 40
  store i64 %or37.i.i102, ptr %arrayidx38.i.i103, align 8
  %arrayidx43.i.i104 = getelementptr inbounds nuw i8, ptr %q.i64, i32 48
  %353 = load i64, ptr %arrayidx43.i.i104, align 8
  %arrayidx44.i.i105 = getelementptr inbounds nuw i8, ptr %q.i64, i32 56
  %354 = load i64, ptr %arrayidx44.i.i105, align 8
  %and45.i.i106 = and i64 %353, 6148914691236517205
  %and46.i.i107 = shl i64 %354, 1
  %shl47.i.i108 = and i64 %and46.i.i107, -6148914691236517206
  %or48.i.i109 = or disjoint i64 %and45.i.i106, %shl47.i.i108
  %arrayidx49.i.i110 = getelementptr inbounds nuw i8, ptr %q.i64, i32 48
  store i64 %or48.i.i109, ptr %arrayidx49.i.i110, align 8
  %and50.i.i111 = lshr i64 %353, 1
  %shr51.i.i112 = and i64 %and50.i.i111, 6148914691236517205
  %and52.i.i113 = and i64 %354, -6148914691236517206
  %or53.i.i114 = or disjoint i64 %shr51.i.i112, %and52.i.i113
  %arrayidx54.i260.i115 = getelementptr inbounds nuw i8, ptr %q.i64, i32 56
  store i64 %or53.i.i114, ptr %arrayidx54.i260.i115, align 8
  %355 = load i64, ptr %q.i64, align 8
  %arrayidx60.i.i116 = getelementptr inbounds nuw i8, ptr %q.i64, i32 16
  %356 = load i64, ptr %arrayidx60.i.i116, align 8
  %and61.i.i117 = and i64 %355, 3689348814741910323
  %and62.i.i118 = shl i64 %356, 2
  %shl63.i.i119 = and i64 %and62.i.i118, -3689348814741910324
  %or64.i.i120 = or disjoint i64 %and61.i.i117, %shl63.i.i119
  store i64 %or64.i.i120, ptr %q.i64, align 8
  %and66.i261.i121 = lshr i64 %355, 2
  %shr67.i.i122 = and i64 %and66.i261.i121, 3689348814741910323
  %and68.i.i123 = and i64 %356, -3689348814741910324
  %or69.i.i124 = or disjoint i64 %shr67.i.i122, %and68.i.i123
  %arrayidx70.i.i125 = getelementptr inbounds nuw i8, ptr %q.i64, i32 16
  store i64 %or69.i.i124, ptr %arrayidx70.i.i125, align 8
  %arrayidx75.i.i126 = getelementptr inbounds nuw i8, ptr %q.i64, i32 8
  %357 = load i64, ptr %arrayidx75.i.i126, align 8
  %arrayidx76.i.i127 = getelementptr inbounds nuw i8, ptr %q.i64, i32 24
  %358 = load i64, ptr %arrayidx76.i.i127, align 8
  %and77.i262.i128 = and i64 %357, 3689348814741910323
  %and78.i263.i129 = shl i64 %358, 2
  %shl79.i.i130 = and i64 %and78.i263.i129, -3689348814741910324
  %or80.i.i131 = or disjoint i64 %and77.i262.i128, %shl79.i.i130
  %arrayidx81.i.i132 = getelementptr inbounds nuw i8, ptr %q.i64, i32 8
  store i64 %or80.i.i131, ptr %arrayidx81.i.i132, align 8
  %and82.i264.i133 = lshr i64 %357, 2
  %shr83.i.i134 = and i64 %and82.i264.i133, 3689348814741910323
  %and84.i265.i135 = and i64 %358, -3689348814741910324
  %or85.i.i136 = or disjoint i64 %shr83.i.i134, %and84.i265.i135
  %arrayidx86.i.i137 = getelementptr inbounds nuw i8, ptr %q.i64, i32 24
  store i64 %or85.i.i136, ptr %arrayidx86.i.i137, align 8
  %arrayidx91.i.i138 = getelementptr inbounds nuw i8, ptr %q.i64, i32 32
  %359 = load i64, ptr %arrayidx91.i.i138, align 8
  %arrayidx92.i.i139 = getelementptr inbounds nuw i8, ptr %q.i64, i32 48
  %360 = load i64, ptr %arrayidx92.i.i139, align 8
  %and93.i.i140 = and i64 %359, 3689348814741910323
  %and94.i.i141 = shl i64 %360, 2
  %shl95.i.i142 = and i64 %and94.i.i141, -3689348814741910324
  %or96.i.i143 = or disjoint i64 %and93.i.i140, %shl95.i.i142
  %arrayidx97.i.i144 = getelementptr inbounds nuw i8, ptr %q.i64, i32 32
  store i64 %or96.i.i143, ptr %arrayidx97.i.i144, align 8
  %and98.i.i145 = lshr i64 %359, 2
  %shr99.i.i146 = and i64 %and98.i.i145, 3689348814741910323
  %and100.i.i147 = and i64 %360, -3689348814741910324
  %or101.i.i148 = or disjoint i64 %shr99.i.i146, %and100.i.i147
  %arrayidx102.i.i149 = getelementptr inbounds nuw i8, ptr %q.i64, i32 48
  store i64 %or101.i.i148, ptr %arrayidx102.i.i149, align 8
  %arrayidx107.i.i150 = getelementptr inbounds nuw i8, ptr %q.i64, i32 40
  %361 = load i64, ptr %arrayidx107.i.i150, align 8
  %arrayidx108.i.i151 = getelementptr inbounds nuw i8, ptr %q.i64, i32 56
  %362 = load i64, ptr %arrayidx108.i.i151, align 8
  %and109.i.i152 = and i64 %361, 3689348814741910323
  %and110.i.i153 = shl i64 %362, 2
  %shl111.i.i154 = and i64 %and110.i.i153, -3689348814741910324
  %or112.i.i155 = or disjoint i64 %and109.i.i152, %shl111.i.i154
  %arrayidx113.i.i156 = getelementptr inbounds nuw i8, ptr %q.i64, i32 40
  store i64 %or112.i.i155, ptr %arrayidx113.i.i156, align 8
  %and114.i.i157 = lshr i64 %361, 2
  %shr115.i.i158 = and i64 %and114.i.i157, 3689348814741910323
  %and116.i.i159 = and i64 %362, -3689348814741910324
  %or117.i.i160 = or disjoint i64 %shr115.i.i158, %and116.i.i159
  %arrayidx118.i.i161 = getelementptr inbounds nuw i8, ptr %q.i64, i32 56
  store i64 %or117.i.i160, ptr %arrayidx118.i.i161, align 8
  %363 = load i64, ptr %q.i64, align 8
  %arrayidx124.i266.i162 = getelementptr inbounds nuw i8, ptr %q.i64, i32 32
  %364 = load i64, ptr %arrayidx124.i266.i162, align 8
  %and125.i.i163 = and i64 %363, 1085102592571150095
  %and126.i.i164 = shl i64 %364, 4
  %shl127.i.i165 = and i64 %and126.i.i164, -1085102592571150096
  %or128.i.i166 = or disjoint i64 %and125.i.i163, %shl127.i.i165
  store i64 %or128.i.i166, ptr %q.i64, align 8
  %and130.i.i167 = lshr i64 %363, 4
  %shr131.i.i168 = and i64 %and130.i.i167, 1085102592571150095
  %and132.i.i169 = and i64 %364, -1085102592571150096
  %or133.i.i170 = or disjoint i64 %shr131.i.i168, %and132.i.i169
  %arrayidx134.i.i171 = getelementptr inbounds nuw i8, ptr %q.i64, i32 32
  store i64 %or133.i.i170, ptr %arrayidx134.i.i171, align 8
  %arrayidx139.i.i172 = getelementptr inbounds nuw i8, ptr %q.i64, i32 8
  %365 = load i64, ptr %arrayidx139.i.i172, align 8
  %arrayidx140.i.i173 = getelementptr inbounds nuw i8, ptr %q.i64, i32 40
  %366 = load i64, ptr %arrayidx140.i.i173, align 8
  %and141.i.i174 = and i64 %365, 1085102592571150095
  %and142.i.i175 = shl i64 %366, 4
  %shl143.i.i176 = and i64 %and142.i.i175, -1085102592571150096
  %or144.i.i177 = or disjoint i64 %and141.i.i174, %shl143.i.i176
  %arrayidx145.i.i178 = getelementptr inbounds nuw i8, ptr %q.i64, i32 8
  store i64 %or144.i.i177, ptr %arrayidx145.i.i178, align 8
  %and146.i.i179 = lshr i64 %365, 4
  %shr147.i.i180 = and i64 %and146.i.i179, 1085102592571150095
  %and148.i.i181 = and i64 %366, -1085102592571150096
  %or149.i.i182 = or disjoint i64 %shr147.i.i180, %and148.i.i181
  %arrayidx150.i.i183 = getelementptr inbounds nuw i8, ptr %q.i64, i32 40
  store i64 %or149.i.i182, ptr %arrayidx150.i.i183, align 8
  %arrayidx155.i.i184 = getelementptr inbounds nuw i8, ptr %q.i64, i32 16
  %367 = load i64, ptr %arrayidx155.i.i184, align 8
  %arrayidx156.i.i185 = getelementptr inbounds nuw i8, ptr %q.i64, i32 48
  %368 = load i64, ptr %arrayidx156.i.i185, align 8
  %and157.i.i186 = and i64 %367, 1085102592571150095
  %and158.i.i187 = shl i64 %368, 4
  %shl159.i.i188 = and i64 %and158.i.i187, -1085102592571150096
  %or160.i.i189 = or disjoint i64 %and157.i.i186, %shl159.i.i188
  %arrayidx161.i.i190 = getelementptr inbounds nuw i8, ptr %q.i64, i32 16
  store i64 %or160.i.i189, ptr %arrayidx161.i.i190, align 8
  %and162.i.i191 = lshr i64 %367, 4
  %shr163.i.i192 = and i64 %and162.i.i191, 1085102592571150095
  %and164.i.i193 = and i64 %368, -1085102592571150096
  %or165.i.i194 = or disjoint i64 %shr163.i.i192, %and164.i.i193
  %arrayidx166.i.i195 = getelementptr inbounds nuw i8, ptr %q.i64, i32 48
  store i64 %or165.i.i194, ptr %arrayidx166.i.i195, align 8
  %arrayidx171.i.i196 = getelementptr inbounds nuw i8, ptr %q.i64, i32 24
  %369 = load i64, ptr %arrayidx171.i.i196, align 8
  %arrayidx172.i.i197 = getelementptr inbounds nuw i8, ptr %q.i64, i32 56
  %370 = load i64, ptr %arrayidx172.i.i197, align 8
  %and173.i.i198 = and i64 %369, 1085102592571150095
  %and174.i.i199 = shl i64 %370, 4
  %shl175.i.i200 = and i64 %and174.i.i199, -1085102592571150096
  %or176.i.i201 = or disjoint i64 %and173.i.i198, %shl175.i.i200
  %arrayidx177.i.i202 = getelementptr inbounds nuw i8, ptr %q.i64, i32 24
  store i64 %or176.i.i201, ptr %arrayidx177.i.i202, align 8
  %and178.i.i203 = lshr i64 %369, 4
  %shr179.i.i204 = and i64 %and178.i.i203, 1085102592571150095
  %and180.i.i205 = and i64 %370, -1085102592571150096
  %or181.i267.i206 = or disjoint i64 %shr179.i.i204, %and180.i.i205
  %arrayidx182.i.i207 = getelementptr inbounds nuw i8, ptr %q.i64, i32 56
  store i64 %or181.i267.i206, ptr %arrayidx182.i.i207, align 8
  %371 = load i64, ptr %119, align 8
  %372 = load i64, ptr %q.i64, align 8
  %xor.i.i208 = xor i64 %372, %371
  store i64 %xor.i.i208, ptr %q.i64, align 8
  %arrayidx2.i48.i209 = getelementptr inbounds nuw i8, ptr %119, i32 8
  %373 = load i64, ptr %arrayidx2.i48.i209, align 8
  %arrayidx3.i49.i210 = getelementptr inbounds nuw i8, ptr %q.i64, i32 8
  %374 = load i64, ptr %arrayidx3.i49.i210, align 8
  %xor4.i.i211 = xor i64 %374, %373
  store i64 %xor4.i.i211, ptr %arrayidx3.i49.i210, align 8
  %arrayidx5.i50.i212 = getelementptr inbounds nuw i8, ptr %119, i32 16
  %375 = load i64, ptr %arrayidx5.i50.i212, align 8
  %arrayidx6.i.i213 = getelementptr inbounds nuw i8, ptr %q.i64, i32 16
  %376 = load i64, ptr %arrayidx6.i.i213, align 8
  %xor7.i.i214 = xor i64 %376, %375
  store i64 %xor7.i.i214, ptr %arrayidx6.i.i213, align 8
  %arrayidx8.i51.i215 = getelementptr inbounds nuw i8, ptr %119, i32 24
  %377 = load i64, ptr %arrayidx8.i51.i215, align 8
  %arrayidx9.i.i216 = getelementptr inbounds nuw i8, ptr %q.i64, i32 24
  %378 = load i64, ptr %arrayidx9.i.i216, align 8
  %xor10.i.i217 = xor i64 %378, %377
  store i64 %xor10.i.i217, ptr %arrayidx9.i.i216, align 8
  %arrayidx11.i.i218 = getelementptr inbounds nuw i8, ptr %119, i32 32
  %379 = load i64, ptr %arrayidx11.i.i218, align 8
  %arrayidx12.i.i219 = getelementptr inbounds nuw i8, ptr %q.i64, i32 32
  %380 = load i64, ptr %arrayidx12.i.i219, align 8
  %xor13.i.i220 = xor i64 %380, %379
  store i64 %xor13.i.i220, ptr %arrayidx12.i.i219, align 8
  %arrayidx14.i.i221 = getelementptr inbounds nuw i8, ptr %119, i32 40
  %381 = load i64, ptr %arrayidx14.i.i221, align 8
  %arrayidx15.i.i222 = getelementptr inbounds nuw i8, ptr %q.i64, i32 40
  %382 = load i64, ptr %arrayidx15.i.i222, align 8
  %xor16.i.i223 = xor i64 %382, %381
  store i64 %xor16.i.i223, ptr %arrayidx15.i.i222, align 8
  %arrayidx17.i.i224 = getelementptr inbounds nuw i8, ptr %119, i32 48
  %383 = load i64, ptr %arrayidx17.i.i224, align 8
  %arrayidx18.i.i225 = getelementptr inbounds nuw i8, ptr %q.i64, i32 48
  %384 = load i64, ptr %arrayidx18.i.i225, align 8
  %xor19.i.i226 = xor i64 %384, %383
  store i64 %xor19.i.i226, ptr %arrayidx18.i.i225, align 8
  %arrayidx20.i.i227 = getelementptr inbounds nuw i8, ptr %119, i32 56
  %385 = load i64, ptr %arrayidx20.i.i227, align 8
  %arrayidx21.i.i228 = getelementptr inbounds nuw i8, ptr %q.i64, i32 56
  %386 = load i64, ptr %arrayidx21.i.i228, align 8
  %xor22.i.i229 = xor i64 %386, %385
  store i64 %xor22.i.i229, ptr %arrayidx21.i.i228, align 8
  br label %for.body7.i600

for.body7.i600:                                   ; preds = %for.end.i69, %shift_rows.exit28.i723
  %i.1.i2311164 = phi i32 [ 1, %for.end.i69 ], [ %inc15.i778, %shift_rows.exit28.i723 ]
  %arrayidx.i122.i601 = getelementptr inbounds nuw i8, ptr %q.i64, i32 56
  %387 = load i64, ptr %arrayidx.i122.i601, align 8
  %arrayidx1.i123.i602 = getelementptr inbounds nuw i8, ptr %q.i64, i32 48
  %388 = load i64, ptr %arrayidx1.i123.i602, align 8
  %arrayidx2.i124.i603 = getelementptr inbounds nuw i8, ptr %q.i64, i32 40
  %389 = load i64, ptr %arrayidx2.i124.i603, align 8
  %arrayidx3.i125.i604 = getelementptr inbounds nuw i8, ptr %q.i64, i32 32
  %390 = load i64, ptr %arrayidx3.i125.i604, align 8
  %arrayidx4.i126.i605 = getelementptr inbounds nuw i8, ptr %q.i64, i32 24
  %391 = load i64, ptr %arrayidx4.i126.i605, align 8
  %arrayidx5.i127.i606 = getelementptr inbounds nuw i8, ptr %q.i64, i32 16
  %392 = load i64, ptr %arrayidx5.i127.i606, align 8
  %arrayidx6.i128.i607 = getelementptr inbounds nuw i8, ptr %q.i64, i32 8
  %393 = load i64, ptr %arrayidx6.i128.i607, align 8
  %394 = load i64, ptr %q.i64, align 8
  %xor.i129.i608 = xor i64 %390, %392
  %xor8.i130.i609 = xor i64 %387, %393
  %xor9.i131.i610 = xor i64 %387, %390
  %xor10.i132.i611 = xor i64 %387, %392
  %xor11.i133.i612 = xor i64 %388, %389
  %xor12.i134.i613 = xor i64 %xor11.i133.i612, %394
  %xor13.i135.i614 = xor i64 %xor12.i134.i613, %390
  %xor14.i136.i615 = xor i64 %xor8.i130.i609, %xor.i129.i608
  %xor15.i137.i616 = xor i64 %xor12.i134.i613, %387
  %xor16.i138.i617 = xor i64 %xor12.i134.i613, %393
  %xor17.i139.i618 = xor i64 %xor16.i138.i617, %xor10.i132.i611
  %xor18.i140.i619 = xor i64 %391, %xor14.i136.i615
  %xor19.i141.i620 = xor i64 %xor18.i140.i619, %392
  %xor20.i142.i621 = xor i64 %xor18.i140.i619, %388
  %xor21.i143.i622 = xor i64 %xor19.i141.i620, %394
  %xor22.i144.i623 = xor i64 %xor19.i141.i620, %xor11.i133.i612
  %xor23.i145.i624 = xor i64 %xor20.i142.i621, %xor9.i131.i610
  %xor24.i146.i625 = xor i64 %394, %xor23.i145.i624
  %xor25.i147.i626 = xor i64 %xor22.i144.i623, %xor23.i145.i624
  %xor27.i148.i627 = xor i64 %xor11.i133.i612, %xor23.i145.i624
  %and.i149.i628 = and i64 %xor14.i136.i615, %xor19.i141.i620
  %and30.i150.i629 = and i64 %xor17.i139.i618, %xor21.i143.i622
  %xor31.i151.i630 = xor i64 %and30.i150.i629, %and.i149.i628
  %and32.i152.i631 = and i64 %xor13.i135.i614, %394
  %and34.i153.i632 = and i64 %xor8.i130.i609, %xor27.i148.i627
  %and35.i154.i633 = and i64 %xor16.i138.i617, %xor12.i134.i613
  %and37.i155.i634 = and i64 %xor15.i137.i616, %xor24.i146.i625
  %and39.i156.i635 = and i64 %xor9.i131.i610, %xor23.i145.i624
  %and40.i157.i636 = and i64 %xor.i129.i608, %xor25.i147.i626
  %xor41.i158.i637 = xor i64 %and40.i157.i636, %and39.i156.i635
  %and42.i159.i638 = and i64 %xor10.i132.i611, %xor22.i144.i623
  %xor43.i160.i639 = xor i64 %and42.i159.i638, %and39.i156.i635
  %xor44.i161.i640 = xor i64 %xor31.i151.i630, %xor41.i158.i637
  %xor48.i162.i641 = xor i64 %xor44.i161.i640, %xor20.i142.i621
  %395 = xor i64 %xor10.i132.i611, %and32.i152.i631
  %396 = xor i64 %395, %xor22.i144.i623
  %397 = xor i64 %396, %and.i149.i628
  %xor49.i163.i642 = xor i64 %397, %xor43.i160.i639
  %398 = xor i64 %xor27.i148.i627, %and35.i154.i633
  %399 = xor i64 %398, %xor8.i130.i609
  %400 = xor i64 %399, %and34.i153.i632
  %xor50.i164.i643 = xor i64 %400, %xor41.i158.i637
  %401 = xor i64 %xor27.i148.i627, %and37.i155.i634
  %402 = xor i64 %401, %387
  %403 = xor i64 %402, %and34.i153.i632
  %xor51.i165.i644 = xor i64 %403, %xor43.i160.i639
  %xor52.i166.i645 = xor i64 %xor48.i162.i641, %xor49.i163.i642
  %and53.i167.i646 = and i64 %xor48.i162.i641, %xor50.i164.i643
  %xor54.i168.i647 = xor i64 %xor51.i165.i644, %and53.i167.i646
  %and55.i169.i648 = and i64 %xor52.i166.i645, %xor54.i168.i647
  %xor56.i170.i649 = xor i64 %and55.i169.i648, %xor49.i163.i642
  %xor57.i171.i650 = xor i64 %xor50.i164.i643, %xor51.i165.i644
  %xor58.i172.i651 = xor i64 %xor49.i163.i642, %and53.i167.i646
  %and59.i173.i652 = and i64 %xor58.i172.i651, %xor57.i171.i650
  %xor60.i174.i653 = xor i64 %and59.i173.i652, %xor51.i165.i644
  %xor61.i175.i654 = xor i64 %xor50.i164.i643, %xor60.i174.i653
  %xor62.i176.i655 = xor i64 %and59.i173.i652, %and53.i167.i646
  %and63.i177.i656 = and i64 %xor51.i165.i644, %xor62.i176.i655
  %xor64.i178.i657 = xor i64 %and63.i177.i656, %xor61.i175.i654
  %xor65.i179.i658 = xor i64 %xor54.i168.i647, %and63.i177.i656
  %and66.i180.i659 = and i64 %xor56.i170.i649, %xor65.i179.i658
  %xor67.i181.i660 = xor i64 %xor52.i166.i645, %and66.i180.i659
  %xor68.i182.i661 = xor i64 %xor67.i181.i660, %xor64.i178.i657
  %xor69.i183.i662 = xor i64 %xor56.i170.i649, %xor60.i174.i653
  %xor70.i184.i663 = xor i64 %xor56.i170.i649, %xor67.i181.i660
  %xor71.i185.i664 = xor i64 %and63.i177.i656, %xor50.i164.i643
  %xor72.i186.i665 = xor i64 %xor69.i183.i662, %xor68.i182.i661
  %and73.i187.i666 = and i64 %xor71.i185.i664, %xor19.i141.i620
  %and74.i188.i667 = and i64 %xor64.i178.i657, %xor21.i143.i622
  %and75.i189.i668 = and i64 %xor60.i174.i653, %394
  %and76.i190.i669 = and i64 %xor70.i184.i663, %xor27.i148.i627
  %and77.i191.i670 = and i64 %xor67.i181.i660, %xor12.i134.i613
  %and78.i192.i671 = and i64 %xor56.i170.i649, %xor24.i146.i625
  %and79.i193.i672 = and i64 %xor69.i183.i662, %xor23.i145.i624
  %and80.i194.i673 = and i64 %xor72.i186.i665, %xor25.i147.i626
  %and81.i195.i674 = and i64 %xor68.i182.i661, %xor22.i144.i623
  %and82.i196.i675 = and i64 %xor71.i185.i664, %xor14.i136.i615
  %and83.i197.i676 = and i64 %xor64.i178.i657, %xor17.i139.i618
  %and84.i198.i677 = and i64 %xor60.i174.i653, %xor13.i135.i614
  %and85.i199.i678 = and i64 %xor70.i184.i663, %xor8.i130.i609
  %and86.i200.i679 = and i64 %xor67.i181.i660, %xor16.i138.i617
  %and87.i201.i680 = and i64 %xor56.i170.i649, %xor15.i137.i616
  %and88.i202.i681 = and i64 %xor69.i183.i662, %xor9.i131.i610
  %and89.i203.i682 = and i64 %xor72.i186.i665, %xor.i129.i608
  %and90.i204.i683 = and i64 %xor68.i182.i661, %xor10.i132.i611
  %xor91.i205.i684 = xor i64 %and88.i202.i681, %and89.i203.i682
  %xor92.i206.i685 = xor i64 %and83.i197.i676, %and84.i198.i677
  %xor93.i207.i686 = xor i64 %and78.i192.i671, %and86.i200.i679
  %xor94.i208.i687 = xor i64 %and82.i196.i675, %and83.i197.i676
  %xor95.i209.i688 = xor i64 %and75.i189.i668, %and85.i199.i678
  %xor96.i210.i689 = xor i64 %and75.i189.i668, %and78.i192.i671
  %xor97.i211.i690 = xor i64 %and80.i194.i673, %and81.i195.i674
  %xor98.i212.i691 = xor i64 %and73.i187.i666, %and76.i190.i669
  %xor99.i213.i692 = xor i64 %and79.i193.i672, %and80.i194.i673
  %xor100.i214.i693 = xor i64 %and89.i203.i682, %and90.i204.i683
  %xor101.i215.i694 = xor i64 %and85.i199.i678, %xor93.i207.i686
  %xor102.i216.i695 = xor i64 %xor95.i209.i688, %xor98.i212.i691
  %xor103.i217.i696 = xor i64 %and77.i191.i670, %xor91.i205.i684
  %xor104.i218.i697 = xor i64 %and76.i190.i669, %xor99.i213.i692
  %xor105.i219.i698 = xor i64 %xor91.i205.i684, %xor102.i216.i695
  %xor106.i220.i699 = xor i64 %and87.i201.i680, %xor102.i216.i695
  %xor107.i221.i700 = xor i64 %xor97.i211.i690, %xor103.i217.i696
  %xor108.i222.i701 = xor i64 %xor94.i208.i687, %xor103.i217.i696
  %xor109.i223.i702 = xor i64 %and77.i191.i670, %xor104.i218.i697
  %xor110.i224.i703 = xor i64 %xor106.i220.i699, %xor107.i221.i700
  %xor111.i225.i704 = xor i64 %and74.i188.i667, %xor108.i222.i701
  %xor112.i226.i705 = xor i64 %xor104.i218.i697, %xor108.i222.i701
  %404 = xor i64 %xor107.i221.i700, %xor101.i215.i694
  %xor113.i227.i706 = xor i64 %404, -1
  %405 = xor i64 %xor105.i219.i698, %xor93.i207.i686
  %xor115.i228.i707 = xor i64 %405, -1
  %xor117.i229.i708 = xor i64 %xor98.i212.i691, %xor111.i225.i704
  %xor118.i230.i709 = xor i64 %xor96.i210.i689, %xor111.i225.i704
  %xor119.i231.i710 = xor i64 %xor92.i206.i685, %xor110.i224.i703
  %406 = xor i64 %xor117.i229.i708, %xor109.i223.i702
  %xor121.i232.i711 = xor i64 %406, -1
  %407 = xor i64 %xor110.i224.i703, %xor100.i214.i693
  %408 = xor i64 %407, %xor109.i223.i702
  %xor123.i233.i712 = xor i64 %408, -1
  %arrayidx124.i234.i713 = getelementptr inbounds nuw i8, ptr %q.i64, i32 56
  store i64 %xor112.i226.i705, ptr %arrayidx124.i234.i713, align 8
  %arrayidx125.i235.i714 = getelementptr inbounds nuw i8, ptr %q.i64, i32 48
  store i64 %xor121.i232.i711, ptr %arrayidx125.i235.i714, align 8
  %arrayidx126.i236.i715 = getelementptr inbounds nuw i8, ptr %q.i64, i32 40
  store i64 %xor123.i233.i712, ptr %arrayidx126.i236.i715, align 8
  %arrayidx127.i237.i716 = getelementptr inbounds nuw i8, ptr %q.i64, i32 32
  store i64 %xor117.i229.i708, ptr %arrayidx127.i237.i716, align 8
  %arrayidx128.i238.i717 = getelementptr inbounds nuw i8, ptr %q.i64, i32 24
  store i64 %xor118.i230.i709, ptr %arrayidx128.i238.i717, align 8
  %arrayidx129.i239.i718 = getelementptr inbounds nuw i8, ptr %q.i64, i32 16
  store i64 %xor119.i231.i710, ptr %arrayidx129.i239.i718, align 8
  %arrayidx130.i240.i719 = getelementptr inbounds nuw i8, ptr %q.i64, i32 8
  store i64 %xor113.i227.i706, ptr %arrayidx130.i240.i719, align 8
  store i64 %xor115.i228.i707, ptr %q.i64, align 8
  br label %for.body.i5.i779

for.body.i5.i779:                                 ; preds = %for.body7.i600, %for.body.i5.i779
  %i.0.i3.i7211163 = phi i32 [ 0, %for.body7.i600 ], [ %inc.i27.i801, %for.body.i5.i779 ]
  %arrayidx.i6.i780 = getelementptr inbounds nuw i64, ptr %q.i64, i32 %i.0.i3.i7211163
  %409 = load i64, ptr %arrayidx.i6.i780, align 8
  %and.i7.i781 = and i64 %409, 65535
  %and1.i8.i782 = lshr i64 %409, 4
  %shr.i9.i783 = and i64 %and1.i8.i782, 268369920
  %or.i10.i784 = or disjoint i64 %and.i7.i781, %shr.i9.i783
  %and2.i11.i785 = shl i64 %409, 12
  %shl.i12.i786 = and i64 %and2.i11.i785, 4026531840
  %or3.i13.i787 = or disjoint i64 %or.i10.i784, %shl.i12.i786
  %and4.i14.i788 = lshr i64 %409, 8
  %shr5.i15.i789 = and i64 %and4.i14.i788, 1095216660480
  %or6.i16.i790 = or disjoint i64 %or3.i13.i787, %shr5.i15.i789
  %and7.i17.i791 = shl i64 %409, 8
  %shl8.i18.i792 = and i64 %and7.i17.i791, 280375465082880
  %or9.i19.i793 = or disjoint i64 %or6.i16.i790, %shl8.i18.i792
  %and10.i20.i794 = lshr i64 %409, 12
  %shr11.i21.i795 = and i64 %and10.i20.i794, 4222124650659840
  %or12.i22.i796 = or disjoint i64 %or9.i19.i793, %shr11.i21.i795
  %and13.i23.i797 = shl i64 %409, 4
  %shl14.i24.i798 = and i64 %and13.i23.i797, -4503599627370496
  %or15.i25.i799 = or i64 %or12.i22.i796, %shl14.i24.i798
  %arrayidx16.i26.i800 = getelementptr inbounds nuw i64, ptr %q.i64, i32 %i.0.i3.i7211163
  store i64 %or15.i25.i799, ptr %arrayidx16.i26.i800, align 8
  %inc.i27.i801 = add nuw nsw i32 %i.0.i3.i7211163, 1
  %exitcond.i4.i722.not = icmp eq i32 %inc.i27.i801, 8
  br i1 %exitcond.i4.i722.not, label %shift_rows.exit28.i723, label %for.body.i5.i779, !llvm.loop !21

shift_rows.exit28.i723:                           ; preds = %for.body.i5.i779
  %410 = load i64, ptr %q.i64, align 8
  %arrayidx1.i96.i724 = getelementptr inbounds nuw i8, ptr %q.i64, i32 8
  %411 = load i64, ptr %arrayidx1.i96.i724, align 8
  %arrayidx2.i97.i725 = getelementptr inbounds nuw i8, ptr %q.i64, i32 16
  %412 = load i64, ptr %arrayidx2.i97.i725, align 8
  %arrayidx3.i98.i726 = getelementptr inbounds nuw i8, ptr %q.i64, i32 24
  %413 = load i64, ptr %arrayidx3.i98.i726, align 8
  %arrayidx4.i.i727 = getelementptr inbounds nuw i8, ptr %q.i64, i32 32
  %414 = load i64, ptr %arrayidx4.i.i727, align 8
  %arrayidx5.i99.i728 = getelementptr inbounds nuw i8, ptr %q.i64, i32 40
  %415 = load i64, ptr %arrayidx5.i99.i728, align 8
  %arrayidx6.i100.i729 = getelementptr inbounds nuw i8, ptr %q.i64, i32 48
  %416 = load i64, ptr %arrayidx6.i100.i729, align 8
  %arrayidx7.i.i730 = getelementptr inbounds nuw i8, ptr %q.i64, i32 56
  %417 = load i64, ptr %arrayidx7.i.i730, align 8
  %418 = call i64 @llvm.fshl.i64(i64 %410, i64 %410, i64 48)
  %419 = call i64 @llvm.fshl.i64(i64 %411, i64 %411, i64 48)
  %420 = call i64 @llvm.fshl.i64(i64 %412, i64 %412, i64 48)
  %421 = call i64 @llvm.fshl.i64(i64 %413, i64 %413, i64 48)
  %422 = call i64 @llvm.fshl.i64(i64 %414, i64 %414, i64 48)
  %423 = call i64 @llvm.fshl.i64(i64 %415, i64 %415, i64 48)
  %424 = call i64 @llvm.fshl.i64(i64 %416, i64 %416, i64 48)
  %425 = call i64 @llvm.fshl.i64(i64 %417, i64 %417, i64 48)
  %xor30.i.i731 = xor i64 %410, %418
  %426 = call i64 @llvm.fshl.i64(i64 %xor30.i.i731, i64 %xor30.i.i731, i64 32)
  %427 = xor i64 %425, %426
  %428 = xor i64 %427, %417
  %xor31.i.i732 = xor i64 %428, %418
  store i64 %xor31.i.i732, ptr %q.i64, align 8
  %xor37.i.i733 = xor i64 %411, %419
  %429 = call i64 @llvm.fshl.i64(i64 %xor37.i.i733, i64 %xor37.i.i733, i64 32)
  %430 = xor i64 %418, %429
  %431 = xor i64 %430, %410
  %432 = xor i64 %431, %417
  %433 = xor i64 %432, %425
  %xor39.i.i734 = xor i64 %433, %419
  %arrayidx40.i.i735 = getelementptr inbounds nuw i8, ptr %q.i64, i32 8
  store i64 %xor39.i.i734, ptr %arrayidx40.i.i735, align 8
  %xor43.i.i736 = xor i64 %412, %420
  %434 = call i64 @llvm.fshl.i64(i64 %xor43.i.i736, i64 %xor43.i.i736, i64 32)
  %435 = xor i64 %419, %434
  %436 = xor i64 %435, %411
  %xor45.i.i737 = xor i64 %436, %420
  %arrayidx46.i.i738 = getelementptr inbounds nuw i8, ptr %q.i64, i32 16
  store i64 %xor45.i.i737, ptr %arrayidx46.i.i738, align 8
  %xor51.i.i739 = xor i64 %413, %421
  %437 = call i64 @llvm.fshl.i64(i64 %xor51.i.i739, i64 %xor51.i.i739, i64 32)
  %438 = xor i64 %420, %437
  %439 = xor i64 %438, %412
  %440 = xor i64 %439, %417
  %441 = xor i64 %440, %425
  %xor53.i.i740 = xor i64 %441, %421
  %arrayidx54.i.i741 = getelementptr inbounds nuw i8, ptr %q.i64, i32 24
  store i64 %xor53.i.i740, ptr %arrayidx54.i.i741, align 8
  %xor59.i.i742 = xor i64 %414, %422
  %442 = call i64 @llvm.fshl.i64(i64 %xor59.i.i742, i64 %xor59.i.i742, i64 32)
  %443 = xor i64 %421, %442
  %444 = xor i64 %443, %413
  %445 = xor i64 %444, %417
  %446 = xor i64 %445, %425
  %xor61.i.i743 = xor i64 %446, %422
  %arrayidx62.i.i744 = getelementptr inbounds nuw i8, ptr %q.i64, i32 32
  store i64 %xor61.i.i743, ptr %arrayidx62.i.i744, align 8
  %xor65.i.i745 = xor i64 %415, %423
  %447 = call i64 @llvm.fshl.i64(i64 %xor65.i.i745, i64 %xor65.i.i745, i64 32)
  %448 = xor i64 %422, %447
  %449 = xor i64 %448, %414
  %xor67.i.i746 = xor i64 %449, %423
  %arrayidx68.i.i747 = getelementptr inbounds nuw i8, ptr %q.i64, i32 40
  store i64 %xor67.i.i746, ptr %arrayidx68.i.i747, align 8
  %xor71.i.i748 = xor i64 %416, %424
  %450 = call i64 @llvm.fshl.i64(i64 %xor71.i.i748, i64 %xor71.i.i748, i64 32)
  %451 = xor i64 %423, %450
  %452 = xor i64 %451, %415
  %xor73.i.i749 = xor i64 %452, %424
  %arrayidx74.i.i750 = getelementptr inbounds nuw i8, ptr %q.i64, i32 48
  store i64 %xor73.i.i749, ptr %arrayidx74.i.i750, align 8
  %xor77.i.i751 = xor i64 %417, %425
  %453 = call i64 @llvm.fshl.i64(i64 %xor77.i.i751, i64 %xor77.i.i751, i64 32)
  %454 = xor i64 %424, %453
  %455 = xor i64 %454, %416
  %xor79.i.i752 = xor i64 %455, %425
  %arrayidx80.i.i753 = getelementptr inbounds nuw i8, ptr %q.i64, i32 56
  store i64 %xor79.i.i752, ptr %arrayidx80.i.i753, align 8
  %add.ptr13.idx.i754 = shl nuw nsw i32 %i.1.i2311164, 6
  %add.ptr13.i755 = getelementptr inbounds nuw i8, ptr %119, i32 %add.ptr13.idx.i754
  %456 = load i64, ptr %add.ptr13.i755, align 8
  %457 = load i64, ptr %q.i64, align 8
  %xor.i74.i756 = xor i64 %457, %456
  store i64 %xor.i74.i756, ptr %q.i64, align 8
  %arrayidx2.i75.i757 = getelementptr inbounds nuw i8, ptr %add.ptr13.i755, i32 8
  %458 = load i64, ptr %arrayidx2.i75.i757, align 8
  %arrayidx3.i76.i758 = getelementptr inbounds nuw i8, ptr %q.i64, i32 8
  %459 = load i64, ptr %arrayidx3.i76.i758, align 8
  %xor4.i77.i759 = xor i64 %459, %458
  store i64 %xor4.i77.i759, ptr %arrayidx3.i76.i758, align 8
  %arrayidx5.i78.i760 = getelementptr inbounds nuw i8, ptr %add.ptr13.i755, i32 16
  %460 = load i64, ptr %arrayidx5.i78.i760, align 8
  %arrayidx6.i79.i761 = getelementptr inbounds nuw i8, ptr %q.i64, i32 16
  %461 = load i64, ptr %arrayidx6.i79.i761, align 8
  %xor7.i80.i762 = xor i64 %461, %460
  store i64 %xor7.i80.i762, ptr %arrayidx6.i79.i761, align 8
  %arrayidx8.i81.i763 = getelementptr inbounds nuw i8, ptr %add.ptr13.i755, i32 24
  %462 = load i64, ptr %arrayidx8.i81.i763, align 8
  %arrayidx9.i82.i764 = getelementptr inbounds nuw i8, ptr %q.i64, i32 24
  %463 = load i64, ptr %arrayidx9.i82.i764, align 8
  %xor10.i83.i765 = xor i64 %463, %462
  store i64 %xor10.i83.i765, ptr %arrayidx9.i82.i764, align 8
  %arrayidx11.i84.i766 = getelementptr inbounds nuw i8, ptr %add.ptr13.i755, i32 32
  %464 = load i64, ptr %arrayidx11.i84.i766, align 8
  %arrayidx12.i85.i767 = getelementptr inbounds nuw i8, ptr %q.i64, i32 32
  %465 = load i64, ptr %arrayidx12.i85.i767, align 8
  %xor13.i86.i768 = xor i64 %465, %464
  store i64 %xor13.i86.i768, ptr %arrayidx12.i85.i767, align 8
  %arrayidx14.i87.i769 = getelementptr inbounds nuw i8, ptr %add.ptr13.i755, i32 40
  %466 = load i64, ptr %arrayidx14.i87.i769, align 8
  %arrayidx15.i88.i770 = getelementptr inbounds nuw i8, ptr %q.i64, i32 40
  %467 = load i64, ptr %arrayidx15.i88.i770, align 8
  %xor16.i89.i771 = xor i64 %467, %466
  store i64 %xor16.i89.i771, ptr %arrayidx15.i88.i770, align 8
  %arrayidx17.i90.i772 = getelementptr inbounds nuw i8, ptr %add.ptr13.i755, i32 48
  %468 = load i64, ptr %arrayidx17.i90.i772, align 8
  %arrayidx18.i91.i773 = getelementptr inbounds nuw i8, ptr %q.i64, i32 48
  %469 = load i64, ptr %arrayidx18.i91.i773, align 8
  %xor19.i92.i774 = xor i64 %469, %468
  store i64 %xor19.i92.i774, ptr %arrayidx18.i91.i773, align 8
  %arrayidx20.i93.i775 = getelementptr inbounds nuw i8, ptr %add.ptr13.i755, i32 56
  %470 = load i64, ptr %arrayidx20.i93.i775, align 8
  %arrayidx21.i94.i776 = getelementptr inbounds nuw i8, ptr %q.i64, i32 56
  %471 = load i64, ptr %arrayidx21.i94.i776, align 8
  %xor22.i95.i777 = xor i64 %471, %470
  store i64 %xor22.i95.i777, ptr %arrayidx21.i94.i776, align 8
  %inc15.i778 = add nuw nsw i32 %i.1.i2311164, 1
  %exitcond1.i232.not = icmp eq i32 %inc15.i778, 10
  br i1 %exitcond1.i232.not, label %for.end16.i233, label %for.body7.i600, !llvm.loop !22

for.end16.i233:                                   ; preds = %shift_rows.exit28.i723
  %arrayidx.i101.i234 = getelementptr inbounds nuw i8, ptr %q.i64, i32 56
  %472 = load i64, ptr %arrayidx.i101.i234, align 8
  %arrayidx1.i102.i235 = getelementptr inbounds nuw i8, ptr %q.i64, i32 48
  %473 = load i64, ptr %arrayidx1.i102.i235, align 8
  %arrayidx2.i103.i236 = getelementptr inbounds nuw i8, ptr %q.i64, i32 40
  %474 = load i64, ptr %arrayidx2.i103.i236, align 8
  %arrayidx3.i104.i237 = getelementptr inbounds nuw i8, ptr %q.i64, i32 32
  %475 = load i64, ptr %arrayidx3.i104.i237, align 8
  %arrayidx4.i105.i238 = getelementptr inbounds nuw i8, ptr %q.i64, i32 24
  %476 = load i64, ptr %arrayidx4.i105.i238, align 8
  %arrayidx5.i106.i239 = getelementptr inbounds nuw i8, ptr %q.i64, i32 16
  %477 = load i64, ptr %arrayidx5.i106.i239, align 8
  %arrayidx6.i107.i240 = getelementptr inbounds nuw i8, ptr %q.i64, i32 8
  %478 = load i64, ptr %arrayidx6.i107.i240, align 8
  %479 = load i64, ptr %q.i64, align 8
  %xor.i108.i241 = xor i64 %475, %477
  %xor8.i.i242 = xor i64 %472, %478
  %xor9.i.i243 = xor i64 %472, %475
  %xor10.i109.i244 = xor i64 %472, %477
  %xor11.i.i245 = xor i64 %473, %474
  %xor12.i.i246 = xor i64 %xor11.i.i245, %479
  %xor13.i110.i247 = xor i64 %xor12.i.i246, %475
  %xor14.i.i248 = xor i64 %xor8.i.i242, %xor.i108.i241
  %xor15.i.i249 = xor i64 %xor12.i.i246, %472
  %xor16.i111.i250 = xor i64 %xor12.i.i246, %478
  %xor17.i.i251 = xor i64 %xor16.i111.i250, %xor10.i109.i244
  %xor18.i.i252 = xor i64 %476, %xor14.i.i248
  %xor19.i112.i253 = xor i64 %xor18.i.i252, %477
  %xor20.i.i254 = xor i64 %xor18.i.i252, %473
  %xor21.i.i255 = xor i64 %xor19.i112.i253, %479
  %xor22.i113.i256 = xor i64 %xor19.i112.i253, %xor11.i.i245
  %xor23.i.i257 = xor i64 %xor20.i.i254, %xor9.i.i243
  %xor24.i.i258 = xor i64 %479, %xor23.i.i257
  %xor25.i.i259 = xor i64 %xor22.i113.i256, %xor23.i.i257
  %xor27.i.i260 = xor i64 %xor11.i.i245, %xor23.i.i257
  %and.i114.i261 = and i64 %xor14.i.i248, %xor19.i112.i253
  %and30.i.i262 = and i64 %xor17.i.i251, %xor21.i.i255
  %xor31.i115.i263 = xor i64 %and30.i.i262, %and.i114.i261
  %and32.i.i264 = and i64 %xor13.i110.i247, %479
  %and34.i.i265 = and i64 %xor8.i.i242, %xor27.i.i260
  %and35.i.i266 = and i64 %xor16.i111.i250, %xor12.i.i246
  %and37.i.i267 = and i64 %xor15.i.i249, %xor24.i.i258
  %and39.i.i268 = and i64 %xor9.i.i243, %xor23.i.i257
  %and40.i.i269 = and i64 %xor.i108.i241, %xor25.i.i259
  %xor41.i.i270 = xor i64 %and40.i.i269, %and39.i.i268
  %and42.i.i271 = and i64 %xor10.i109.i244, %xor22.i113.i256
  %xor43.i116.i272 = xor i64 %and42.i.i271, %and39.i.i268
  %xor44.i.i273 = xor i64 %xor31.i115.i263, %xor41.i.i270
  %xor48.i.i274 = xor i64 %xor44.i.i273, %xor20.i.i254
  %480 = xor i64 %xor10.i109.i244, %and32.i.i264
  %481 = xor i64 %480, %xor22.i113.i256
  %482 = xor i64 %481, %and.i114.i261
  %xor49.i.i275 = xor i64 %482, %xor43.i116.i272
  %483 = xor i64 %xor27.i.i260, %and35.i.i266
  %484 = xor i64 %483, %xor8.i.i242
  %485 = xor i64 %484, %and34.i.i265
  %xor50.i.i276 = xor i64 %485, %xor41.i.i270
  %486 = xor i64 %xor27.i.i260, %and37.i.i267
  %487 = xor i64 %486, %472
  %488 = xor i64 %487, %and34.i.i265
  %xor51.i117.i277 = xor i64 %488, %xor43.i116.i272
  %xor52.i.i278 = xor i64 %xor48.i.i274, %xor49.i.i275
  %and53.i.i279 = and i64 %xor48.i.i274, %xor50.i.i276
  %xor54.i.i280 = xor i64 %xor51.i117.i277, %and53.i.i279
  %and55.i.i281 = and i64 %xor52.i.i278, %xor54.i.i280
  %xor56.i.i282 = xor i64 %and55.i.i281, %xor49.i.i275
  %xor57.i.i283 = xor i64 %xor50.i.i276, %xor51.i117.i277
  %xor58.i.i284 = xor i64 %xor49.i.i275, %and53.i.i279
  %and59.i.i285 = and i64 %xor58.i.i284, %xor57.i.i283
  %xor60.i.i286 = xor i64 %and59.i.i285, %xor51.i117.i277
  %xor61.i118.i287 = xor i64 %xor50.i.i276, %xor60.i.i286
  %xor62.i.i288 = xor i64 %and59.i.i285, %and53.i.i279
  %and63.i.i289 = and i64 %xor51.i117.i277, %xor62.i.i288
  %xor64.i.i290 = xor i64 %and63.i.i289, %xor61.i118.i287
  %xor65.i119.i291 = xor i64 %xor54.i.i280, %and63.i.i289
  %and66.i.i292 = and i64 %xor56.i.i282, %xor65.i119.i291
  %xor67.i120.i293 = xor i64 %xor52.i.i278, %and66.i.i292
  %xor68.i.i294 = xor i64 %xor67.i120.i293, %xor64.i.i290
  %xor69.i.i295 = xor i64 %xor56.i.i282, %xor60.i.i286
  %xor70.i.i296 = xor i64 %xor56.i.i282, %xor67.i120.i293
  %xor71.i121.i297 = xor i64 %and63.i.i289, %xor50.i.i276
  %xor72.i.i298 = xor i64 %xor69.i.i295, %xor68.i.i294
  %and73.i.i299 = and i64 %xor71.i121.i297, %xor19.i112.i253
  %and74.i.i300 = and i64 %xor64.i.i290, %xor21.i.i255
  %and75.i.i301 = and i64 %xor60.i.i286, %479
  %and76.i.i302 = and i64 %xor70.i.i296, %xor27.i.i260
  %and77.i.i303 = and i64 %xor67.i120.i293, %xor12.i.i246
  %and78.i.i304 = and i64 %xor56.i.i282, %xor24.i.i258
  %and79.i.i305 = and i64 %xor69.i.i295, %xor23.i.i257
  %and80.i.i306 = and i64 %xor72.i.i298, %xor25.i.i259
  %and81.i.i307 = and i64 %xor68.i.i294, %xor22.i113.i256
  %and82.i.i308 = and i64 %xor71.i121.i297, %xor14.i.i248
  %and83.i.i309 = and i64 %xor64.i.i290, %xor17.i.i251
  %and84.i.i310 = and i64 %xor60.i.i286, %xor13.i110.i247
  %and85.i.i311 = and i64 %xor70.i.i296, %xor8.i.i242
  %and86.i.i312 = and i64 %xor67.i120.i293, %xor16.i111.i250
  %and87.i.i313 = and i64 %xor56.i.i282, %xor15.i.i249
  %and88.i.i314 = and i64 %xor69.i.i295, %xor9.i.i243
  %and89.i.i315 = and i64 %xor72.i.i298, %xor.i108.i241
  %and90.i.i316 = and i64 %xor68.i.i294, %xor10.i109.i244
  %xor91.i.i317 = xor i64 %and88.i.i314, %and89.i.i315
  %xor92.i.i318 = xor i64 %and83.i.i309, %and84.i.i310
  %xor93.i.i319 = xor i64 %and78.i.i304, %and86.i.i312
  %xor94.i.i320 = xor i64 %and82.i.i308, %and83.i.i309
  %xor95.i.i321 = xor i64 %and75.i.i301, %and85.i.i311
  %xor96.i.i322 = xor i64 %and75.i.i301, %and78.i.i304
  %xor97.i.i323 = xor i64 %and80.i.i306, %and81.i.i307
  %xor98.i.i324 = xor i64 %and73.i.i299, %and76.i.i302
  %xor99.i.i325 = xor i64 %and79.i.i305, %and80.i.i306
  %xor100.i.i326 = xor i64 %and89.i.i315, %and90.i.i316
  %xor101.i.i327 = xor i64 %and85.i.i311, %xor93.i.i319
  %xor102.i.i328 = xor i64 %xor95.i.i321, %xor98.i.i324
  %xor103.i.i329 = xor i64 %and77.i.i303, %xor91.i.i317
  %xor104.i.i330 = xor i64 %and76.i.i302, %xor99.i.i325
  %xor105.i.i331 = xor i64 %xor91.i.i317, %xor102.i.i328
  %xor106.i.i332 = xor i64 %and87.i.i313, %xor102.i.i328
  %xor107.i.i333 = xor i64 %xor97.i.i323, %xor103.i.i329
  %xor108.i.i334 = xor i64 %xor94.i.i320, %xor103.i.i329
  %xor109.i.i335 = xor i64 %and77.i.i303, %xor104.i.i330
  %xor110.i.i336 = xor i64 %xor106.i.i332, %xor107.i.i333
  %xor111.i.i337 = xor i64 %and74.i.i300, %xor108.i.i334
  %xor112.i.i338 = xor i64 %xor104.i.i330, %xor108.i.i334
  %489 = xor i64 %xor107.i.i333, %xor101.i.i327
  %xor113.i.i339 = xor i64 %489, -1
  %490 = xor i64 %xor105.i.i331, %xor93.i.i319
  %xor115.i.i340 = xor i64 %490, -1
  %xor117.i.i341 = xor i64 %xor98.i.i324, %xor111.i.i337
  %xor118.i.i342 = xor i64 %xor96.i.i322, %xor111.i.i337
  %xor119.i.i343 = xor i64 %xor92.i.i318, %xor110.i.i336
  %491 = xor i64 %xor117.i.i341, %xor109.i.i335
  %xor121.i.i344 = xor i64 %491, -1
  %492 = xor i64 %xor110.i.i336, %xor100.i.i326
  %493 = xor i64 %492, %xor109.i.i335
  %xor123.i.i345 = xor i64 %493, -1
  %arrayidx124.i.i346 = getelementptr inbounds nuw i8, ptr %q.i64, i32 56
  store i64 %xor112.i.i338, ptr %arrayidx124.i.i346, align 8
  %arrayidx125.i.i347 = getelementptr inbounds nuw i8, ptr %q.i64, i32 48
  store i64 %xor121.i.i344, ptr %arrayidx125.i.i347, align 8
  %arrayidx126.i.i348 = getelementptr inbounds nuw i8, ptr %q.i64, i32 40
  store i64 %xor123.i.i345, ptr %arrayidx126.i.i348, align 8
  %arrayidx127.i.i349 = getelementptr inbounds nuw i8, ptr %q.i64, i32 32
  store i64 %xor117.i.i341, ptr %arrayidx127.i.i349, align 8
  %arrayidx128.i.i350 = getelementptr inbounds nuw i8, ptr %q.i64, i32 24
  store i64 %xor118.i.i342, ptr %arrayidx128.i.i350, align 8
  %arrayidx129.i.i351 = getelementptr inbounds nuw i8, ptr %q.i64, i32 16
  store i64 %xor119.i.i343, ptr %arrayidx129.i.i351, align 8
  %arrayidx130.i.i352 = getelementptr inbounds nuw i8, ptr %q.i64, i32 8
  store i64 %xor113.i.i339, ptr %arrayidx130.i.i352, align 8
  store i64 %xor115.i.i340, ptr %q.i64, align 8
  br label %for.body.i.i577

for.body.i.i577:                                  ; preds = %for.end16.i233, %for.body.i.i577
  %i.0.i.i3541165 = phi i32 [ 0, %for.end16.i233 ], [ %inc.i.i599, %for.body.i.i577 ]
  %arrayidx.i.i578 = getelementptr inbounds nuw i64, ptr %q.i64, i32 %i.0.i.i3541165
  %494 = load i64, ptr %arrayidx.i.i578, align 8
  %and.i.i579 = and i64 %494, 65535
  %and1.i.i580 = lshr i64 %494, 4
  %shr.i1.i581 = and i64 %and1.i.i580, 268369920
  %or.i.i582 = or disjoint i64 %and.i.i579, %shr.i1.i581
  %and2.i.i583 = shl i64 %494, 12
  %shl.i.i584 = and i64 %and2.i.i583, 4026531840
  %or3.i.i585 = or disjoint i64 %or.i.i582, %shl.i.i584
  %and4.i.i586 = lshr i64 %494, 8
  %shr5.i.i587 = and i64 %and4.i.i586, 1095216660480
  %or6.i.i588 = or disjoint i64 %or3.i.i585, %shr5.i.i587
  %and7.i.i589 = shl i64 %494, 8
  %shl8.i.i590 = and i64 %and7.i.i589, 280375465082880
  %or9.i.i591 = or disjoint i64 %or6.i.i588, %shl8.i.i590
  %and10.i.i592 = lshr i64 %494, 12
  %shr11.i.i593 = and i64 %and10.i.i592, 4222124650659840
  %or12.i.i594 = or disjoint i64 %or9.i.i591, %shr11.i.i593
  %and13.i.i595 = shl i64 %494, 4
  %shl14.i.i596 = and i64 %and13.i.i595, -4503599627370496
  %or15.i.i597 = or i64 %or12.i.i594, %shl14.i.i596
  %arrayidx16.i.i598 = getelementptr inbounds nuw i64, ptr %q.i64, i32 %i.0.i.i3541165
  store i64 %or15.i.i597, ptr %arrayidx16.i.i598, align 8
  %inc.i.i599 = add nuw nsw i32 %i.0.i.i3541165, 1
  %exitcond.i.i355.not = icmp eq i32 %inc.i.i599, 8
  br i1 %exitcond.i.i355.not, label %shift_rows.exit.i356, label %for.body.i.i577, !llvm.loop !23

shift_rows.exit.i356:                             ; preds = %for.body.i.i577
  %add.ptr20.i357 = getelementptr inbounds nuw i8, ptr %119, i32 640
  %495 = load i64, ptr %add.ptr20.i357, align 8
  %496 = load i64, ptr %q.i64, align 8
  %xor.i52.i358 = xor i64 %496, %495
  store i64 %xor.i52.i358, ptr %q.i64, align 8
  %arrayidx2.i53.i359 = getelementptr inbounds nuw i8, ptr %119, i32 648
  %497 = load i64, ptr %arrayidx2.i53.i359, align 8
  %arrayidx3.i54.i360 = getelementptr inbounds nuw i8, ptr %q.i64, i32 8
  %498 = load i64, ptr %arrayidx3.i54.i360, align 8
  %xor4.i55.i361 = xor i64 %498, %497
  store i64 %xor4.i55.i361, ptr %arrayidx3.i54.i360, align 8
  %arrayidx5.i56.i362 = getelementptr inbounds nuw i8, ptr %119, i32 656
  %499 = load i64, ptr %arrayidx5.i56.i362, align 8
  %arrayidx6.i57.i363 = getelementptr inbounds nuw i8, ptr %q.i64, i32 16
  %500 = load i64, ptr %arrayidx6.i57.i363, align 8
  %xor7.i58.i364 = xor i64 %500, %499
  store i64 %xor7.i58.i364, ptr %arrayidx6.i57.i363, align 8
  %arrayidx8.i59.i365 = getelementptr inbounds nuw i8, ptr %119, i32 664
  %501 = load i64, ptr %arrayidx8.i59.i365, align 8
  %arrayidx9.i60.i366 = getelementptr inbounds nuw i8, ptr %q.i64, i32 24
  %502 = load i64, ptr %arrayidx9.i60.i366, align 8
  %xor10.i61.i367 = xor i64 %502, %501
  store i64 %xor10.i61.i367, ptr %arrayidx9.i60.i366, align 8
  %arrayidx11.i62.i368 = getelementptr inbounds nuw i8, ptr %119, i32 672
  %503 = load i64, ptr %arrayidx11.i62.i368, align 8
  %arrayidx12.i63.i369 = getelementptr inbounds nuw i8, ptr %q.i64, i32 32
  %504 = load i64, ptr %arrayidx12.i63.i369, align 8
  %xor13.i64.i370 = xor i64 %504, %503
  store i64 %xor13.i64.i370, ptr %arrayidx12.i63.i369, align 8
  %arrayidx14.i65.i371 = getelementptr inbounds nuw i8, ptr %119, i32 680
  %505 = load i64, ptr %arrayidx14.i65.i371, align 8
  %arrayidx15.i66.i372 = getelementptr inbounds nuw i8, ptr %q.i64, i32 40
  %506 = load i64, ptr %arrayidx15.i66.i372, align 8
  %xor16.i67.i373 = xor i64 %506, %505
  store i64 %xor16.i67.i373, ptr %arrayidx15.i66.i372, align 8
  %arrayidx17.i68.i374 = getelementptr inbounds nuw i8, ptr %119, i32 688
  %507 = load i64, ptr %arrayidx17.i68.i374, align 8
  %arrayidx18.i69.i375 = getelementptr inbounds nuw i8, ptr %q.i64, i32 48
  %508 = load i64, ptr %arrayidx18.i69.i375, align 8
  %xor19.i70.i376 = xor i64 %508, %507
  store i64 %xor19.i70.i376, ptr %arrayidx18.i69.i375, align 8
  %arrayidx20.i71.i377 = getelementptr inbounds nuw i8, ptr %119, i32 696
  %509 = load i64, ptr %arrayidx20.i71.i377, align 8
  %arrayidx21.i72.i378 = getelementptr inbounds nuw i8, ptr %q.i64, i32 56
  %510 = load i64, ptr %arrayidx21.i72.i378, align 8
  %xor22.i73.i379 = xor i64 %510, %509
  store i64 %xor22.i73.i379, ptr %arrayidx21.i72.i378, align 8
  %511 = load i64, ptr %q.i64, align 8
  %arrayidx1.i268.i380 = getelementptr inbounds nuw i8, ptr %q.i64, i32 8
  %512 = load i64, ptr %arrayidx1.i268.i380, align 8
  %and.i269.i381 = and i64 %511, 6148914691236517205
  %and2.i270.i382 = shl i64 %512, 1
  %shl.i271.i383 = and i64 %and2.i270.i382, -6148914691236517206
  %or.i272.i384 = or disjoint i64 %and.i269.i381, %shl.i271.i383
  store i64 %or.i272.i384, ptr %q.i64, align 8
  %and4.i273.i385 = lshr i64 %511, 1
  %shr.i274.i386 = and i64 %and4.i273.i385, 6148914691236517205
  %and5.i275.i387 = and i64 %512, -6148914691236517206
  %or6.i276.i388 = or disjoint i64 %shr.i274.i386, %and5.i275.i387
  %arrayidx7.i277.i389 = getelementptr inbounds nuw i8, ptr %q.i64, i32 8
  store i64 %or6.i276.i388, ptr %arrayidx7.i277.i389, align 8
  %arrayidx11.i278.i390 = getelementptr inbounds nuw i8, ptr %q.i64, i32 16
  %513 = load i64, ptr %arrayidx11.i278.i390, align 8
  %arrayidx12.i279.i391 = getelementptr inbounds nuw i8, ptr %q.i64, i32 24
  %514 = load i64, ptr %arrayidx12.i279.i391, align 8
  %and13.i280.i392 = and i64 %513, 6148914691236517205
  %and14.i281.i393 = shl i64 %514, 1
  %shl15.i282.i394 = and i64 %and14.i281.i393, -6148914691236517206
  %or16.i283.i395 = or disjoint i64 %and13.i280.i392, %shl15.i282.i394
  %arrayidx17.i284.i396 = getelementptr inbounds nuw i8, ptr %q.i64, i32 16
  store i64 %or16.i283.i395, ptr %arrayidx17.i284.i396, align 8
  %and18.i285.i397 = lshr i64 %513, 1
  %shr19.i286.i398 = and i64 %and18.i285.i397, 6148914691236517205
  %and20.i287.i399 = and i64 %514, -6148914691236517206
  %or21.i288.i400 = or disjoint i64 %shr19.i286.i398, %and20.i287.i399
  %arrayidx22.i289.i401 = getelementptr inbounds nuw i8, ptr %q.i64, i32 24
  store i64 %or21.i288.i400, ptr %arrayidx22.i289.i401, align 8
  %arrayidx27.i290.i402 = getelementptr inbounds nuw i8, ptr %q.i64, i32 32
  %515 = load i64, ptr %arrayidx27.i290.i402, align 8
  %arrayidx28.i291.i403 = getelementptr inbounds nuw i8, ptr %q.i64, i32 40
  %516 = load i64, ptr %arrayidx28.i291.i403, align 8
  %and29.i292.i404 = and i64 %515, 6148914691236517205
  %and30.i293.i405 = shl i64 %516, 1
  %shl31.i294.i406 = and i64 %and30.i293.i405, -6148914691236517206
  %or32.i295.i407 = or disjoint i64 %and29.i292.i404, %shl31.i294.i406
  %arrayidx33.i296.i408 = getelementptr inbounds nuw i8, ptr %q.i64, i32 32
  store i64 %or32.i295.i407, ptr %arrayidx33.i296.i408, align 8
  %and34.i297.i409 = lshr i64 %515, 1
  %shr35.i298.i410 = and i64 %and34.i297.i409, 6148914691236517205
  %and36.i299.i411 = and i64 %516, -6148914691236517206
  %or37.i300.i412 = or disjoint i64 %shr35.i298.i410, %and36.i299.i411
  %arrayidx38.i301.i413 = getelementptr inbounds nuw i8, ptr %q.i64, i32 40
  store i64 %or37.i300.i412, ptr %arrayidx38.i301.i413, align 8
  %arrayidx43.i302.i414 = getelementptr inbounds nuw i8, ptr %q.i64, i32 48
  %517 = load i64, ptr %arrayidx43.i302.i414, align 8
  %arrayidx44.i303.i415 = getelementptr inbounds nuw i8, ptr %q.i64, i32 56
  %518 = load i64, ptr %arrayidx44.i303.i415, align 8
  %and45.i304.i416 = and i64 %517, 6148914691236517205
  %and46.i305.i417 = shl i64 %518, 1
  %shl47.i306.i418 = and i64 %and46.i305.i417, -6148914691236517206
  %or48.i307.i419 = or disjoint i64 %and45.i304.i416, %shl47.i306.i418
  %arrayidx49.i308.i420 = getelementptr inbounds nuw i8, ptr %q.i64, i32 48
  store i64 %or48.i307.i419, ptr %arrayidx49.i308.i420, align 8
  %and50.i309.i421 = lshr i64 %517, 1
  %shr51.i310.i422 = and i64 %and50.i309.i421, 6148914691236517205
  %and52.i311.i423 = and i64 %518, -6148914691236517206
  %or53.i312.i424 = or disjoint i64 %shr51.i310.i422, %and52.i311.i423
  %arrayidx54.i313.i425 = getelementptr inbounds nuw i8, ptr %q.i64, i32 56
  store i64 %or53.i312.i424, ptr %arrayidx54.i313.i425, align 8
  %519 = load i64, ptr %q.i64, align 8
  %arrayidx60.i314.i426 = getelementptr inbounds nuw i8, ptr %q.i64, i32 16
  %520 = load i64, ptr %arrayidx60.i314.i426, align 8
  %and61.i315.i427 = and i64 %519, 3689348814741910323
  %and62.i316.i428 = shl i64 %520, 2
  %shl63.i317.i429 = and i64 %and62.i316.i428, -3689348814741910324
  %or64.i318.i430 = or disjoint i64 %and61.i315.i427, %shl63.i317.i429
  store i64 %or64.i318.i430, ptr %q.i64, align 8
  %and66.i319.i431 = lshr i64 %519, 2
  %shr67.i320.i432 = and i64 %and66.i319.i431, 3689348814741910323
  %and68.i321.i433 = and i64 %520, -3689348814741910324
  %or69.i322.i434 = or disjoint i64 %shr67.i320.i432, %and68.i321.i433
  %arrayidx70.i323.i435 = getelementptr inbounds nuw i8, ptr %q.i64, i32 16
  store i64 %or69.i322.i434, ptr %arrayidx70.i323.i435, align 8
  %arrayidx75.i324.i436 = getelementptr inbounds nuw i8, ptr %q.i64, i32 8
  %521 = load i64, ptr %arrayidx75.i324.i436, align 8
  %arrayidx76.i325.i437 = getelementptr inbounds nuw i8, ptr %q.i64, i32 24
  %522 = load i64, ptr %arrayidx76.i325.i437, align 8
  %and77.i326.i438 = and i64 %521, 3689348814741910323
  %and78.i327.i439 = shl i64 %522, 2
  %shl79.i328.i440 = and i64 %and78.i327.i439, -3689348814741910324
  %or80.i329.i441 = or disjoint i64 %and77.i326.i438, %shl79.i328.i440
  %arrayidx81.i330.i442 = getelementptr inbounds nuw i8, ptr %q.i64, i32 8
  store i64 %or80.i329.i441, ptr %arrayidx81.i330.i442, align 8
  %and82.i331.i443 = lshr i64 %521, 2
  %shr83.i332.i444 = and i64 %and82.i331.i443, 3689348814741910323
  %and84.i333.i445 = and i64 %522, -3689348814741910324
  %or85.i334.i446 = or disjoint i64 %shr83.i332.i444, %and84.i333.i445
  %arrayidx86.i335.i447 = getelementptr inbounds nuw i8, ptr %q.i64, i32 24
  store i64 %or85.i334.i446, ptr %arrayidx86.i335.i447, align 8
  %arrayidx91.i336.i448 = getelementptr inbounds nuw i8, ptr %q.i64, i32 32
  %523 = load i64, ptr %arrayidx91.i336.i448, align 8
  %arrayidx92.i337.i449 = getelementptr inbounds nuw i8, ptr %q.i64, i32 48
  %524 = load i64, ptr %arrayidx92.i337.i449, align 8
  %and93.i338.i450 = and i64 %523, 3689348814741910323
  %and94.i339.i451 = shl i64 %524, 2
  %shl95.i340.i452 = and i64 %and94.i339.i451, -3689348814741910324
  %or96.i341.i453 = or disjoint i64 %and93.i338.i450, %shl95.i340.i452
  %arrayidx97.i342.i454 = getelementptr inbounds nuw i8, ptr %q.i64, i32 32
  store i64 %or96.i341.i453, ptr %arrayidx97.i342.i454, align 8
  %and98.i343.i455 = lshr i64 %523, 2
  %shr99.i344.i456 = and i64 %and98.i343.i455, 3689348814741910323
  %and100.i345.i457 = and i64 %524, -3689348814741910324
  %or101.i346.i458 = or disjoint i64 %shr99.i344.i456, %and100.i345.i457
  %arrayidx102.i347.i459 = getelementptr inbounds nuw i8, ptr %q.i64, i32 48
  store i64 %or101.i346.i458, ptr %arrayidx102.i347.i459, align 8
  %arrayidx107.i348.i460 = getelementptr inbounds nuw i8, ptr %q.i64, i32 40
  %525 = load i64, ptr %arrayidx107.i348.i460, align 8
  %arrayidx108.i349.i461 = getelementptr inbounds nuw i8, ptr %q.i64, i32 56
  %526 = load i64, ptr %arrayidx108.i349.i461, align 8
  %and109.i350.i462 = and i64 %525, 3689348814741910323
  %and110.i351.i463 = shl i64 %526, 2
  %shl111.i352.i464 = and i64 %and110.i351.i463, -3689348814741910324
  %or112.i353.i465 = or disjoint i64 %and109.i350.i462, %shl111.i352.i464
  %arrayidx113.i354.i466 = getelementptr inbounds nuw i8, ptr %q.i64, i32 40
  store i64 %or112.i353.i465, ptr %arrayidx113.i354.i466, align 8
  %and114.i355.i467 = lshr i64 %525, 2
  %shr115.i356.i468 = and i64 %and114.i355.i467, 3689348814741910323
  %and116.i357.i469 = and i64 %526, -3689348814741910324
  %or117.i358.i470 = or disjoint i64 %shr115.i356.i468, %and116.i357.i469
  %arrayidx118.i359.i471 = getelementptr inbounds nuw i8, ptr %q.i64, i32 56
  store i64 %or117.i358.i470, ptr %arrayidx118.i359.i471, align 8
  %527 = load i64, ptr %q.i64, align 8
  %arrayidx124.i360.i472 = getelementptr inbounds nuw i8, ptr %q.i64, i32 32
  %528 = load i64, ptr %arrayidx124.i360.i472, align 8
  %and125.i361.i473 = and i64 %527, 1085102592571150095
  %and126.i362.i474 = shl i64 %528, 4
  %shl127.i363.i475 = and i64 %and126.i362.i474, -1085102592571150096
  %or128.i364.i476 = or disjoint i64 %and125.i361.i473, %shl127.i363.i475
  store i64 %or128.i364.i476, ptr %q.i64, align 8
  %and130.i365.i477 = lshr i64 %527, 4
  %shr131.i366.i478 = and i64 %and130.i365.i477, 1085102592571150095
  %and132.i367.i479 = and i64 %528, -1085102592571150096
  %or133.i368.i480 = or disjoint i64 %shr131.i366.i478, %and132.i367.i479
  %arrayidx134.i369.i481 = getelementptr inbounds nuw i8, ptr %q.i64, i32 32
  store i64 %or133.i368.i480, ptr %arrayidx134.i369.i481, align 8
  %arrayidx139.i370.i482 = getelementptr inbounds nuw i8, ptr %q.i64, i32 8
  %529 = load i64, ptr %arrayidx139.i370.i482, align 8
  %arrayidx140.i371.i483 = getelementptr inbounds nuw i8, ptr %q.i64, i32 40
  %530 = load i64, ptr %arrayidx140.i371.i483, align 8
  %and141.i372.i484 = and i64 %529, 1085102592571150095
  %and142.i373.i485 = shl i64 %530, 4
  %shl143.i374.i486 = and i64 %and142.i373.i485, -1085102592571150096
  %or144.i375.i487 = or disjoint i64 %and141.i372.i484, %shl143.i374.i486
  %arrayidx145.i376.i488 = getelementptr inbounds nuw i8, ptr %q.i64, i32 8
  store i64 %or144.i375.i487, ptr %arrayidx145.i376.i488, align 8
  %and146.i377.i489 = lshr i64 %529, 4
  %shr147.i378.i490 = and i64 %and146.i377.i489, 1085102592571150095
  %and148.i379.i491 = and i64 %530, -1085102592571150096
  %or149.i380.i492 = or disjoint i64 %shr147.i378.i490, %and148.i379.i491
  %arrayidx150.i381.i493 = getelementptr inbounds nuw i8, ptr %q.i64, i32 40
  store i64 %or149.i380.i492, ptr %arrayidx150.i381.i493, align 8
  %arrayidx155.i382.i494 = getelementptr inbounds nuw i8, ptr %q.i64, i32 16
  %531 = load i64, ptr %arrayidx155.i382.i494, align 8
  %arrayidx156.i383.i495 = getelementptr inbounds nuw i8, ptr %q.i64, i32 48
  %532 = load i64, ptr %arrayidx156.i383.i495, align 8
  %and157.i384.i496 = and i64 %531, 1085102592571150095
  %and158.i385.i497 = shl i64 %532, 4
  %shl159.i386.i498 = and i64 %and158.i385.i497, -1085102592571150096
  %or160.i387.i499 = or disjoint i64 %and157.i384.i496, %shl159.i386.i498
  %arrayidx161.i388.i500 = getelementptr inbounds nuw i8, ptr %q.i64, i32 16
  store i64 %or160.i387.i499, ptr %arrayidx161.i388.i500, align 8
  %and162.i389.i501 = lshr i64 %531, 4
  %shr163.i390.i502 = and i64 %and162.i389.i501, 1085102592571150095
  %and164.i391.i503 = and i64 %532, -1085102592571150096
  %or165.i392.i504 = or disjoint i64 %shr163.i390.i502, %and164.i391.i503
  %arrayidx166.i393.i505 = getelementptr inbounds nuw i8, ptr %q.i64, i32 48
  store i64 %or165.i392.i504, ptr %arrayidx166.i393.i505, align 8
  %arrayidx171.i394.i506 = getelementptr inbounds nuw i8, ptr %q.i64, i32 24
  %533 = load i64, ptr %arrayidx171.i394.i506, align 8
  %arrayidx172.i395.i507 = getelementptr inbounds nuw i8, ptr %q.i64, i32 56
  %534 = load i64, ptr %arrayidx172.i395.i507, align 8
  %and173.i396.i508 = and i64 %533, 1085102592571150095
  %and174.i397.i509 = shl i64 %534, 4
  %shl175.i398.i510 = and i64 %and174.i397.i509, -1085102592571150096
  %or176.i399.i511 = or disjoint i64 %and173.i396.i508, %shl175.i398.i510
  %arrayidx177.i400.i512 = getelementptr inbounds nuw i8, ptr %q.i64, i32 24
  store i64 %or176.i399.i511, ptr %arrayidx177.i400.i512, align 8
  %and178.i401.i513 = lshr i64 %533, 4
  %shr179.i402.i514 = and i64 %and178.i401.i513, 1085102592571150095
  %and180.i403.i515 = and i64 %534, -1085102592571150096
  %or181.i404.i516 = or disjoint i64 %shr179.i402.i514, %and180.i403.i515
  %arrayidx182.i405.i517 = getelementptr inbounds nuw i8, ptr %q.i64, i32 56
  store i64 %or181.i404.i516, ptr %arrayidx182.i405.i517, align 8
  br label %for.body24.i541

while.cond.i.i522.preheader:                      ; preds = %for.body24.i541
  br label %while.body.i.i527

for.body24.i541:                                  ; preds = %shift_rows.exit.i356, %for.body24.i541
  %i.2.i5191166 = phi i32 [ 0, %shift_rows.exit.i356 ], [ %inc32.i576, %for.body24.i541 ]
  %add.ptr27.idx.i542 = shl nuw nsw i32 %i.2.i5191166, 4
  %add.ptr27.i543 = getelementptr inbounds nuw i8, ptr %w.i63, i32 %add.ptr27.idx.i542
  %arrayidx28.i544 = getelementptr inbounds nuw [8 x i64], ptr %q.i64, i32 0, i32 %i.2.i5191166
  %535 = load i64, ptr %arrayidx28.i544, align 8
  %add29.i545 = or disjoint i32 %i.2.i5191166, 4
  %arrayidx30.i546 = getelementptr inbounds nuw [8 x i64], ptr %q.i64, i32 0, i32 %add29.i545
  %536 = load i64, ptr %arrayidx30.i546, align 8
  %and.i29.i547 = and i64 %535, 71777214294589695
  %and1.i30.i548 = and i64 %536, 71777214294589695
  %shr.i31.i549 = lshr i64 %535, 8
  %and2.i32.i550 = and i64 %shr.i31.i549, 71776119077928960
  %shr3.i33.i551 = lshr i64 %536, 8
  %and4.i34.i552 = and i64 %shr3.i33.i551, 71776119077928960
  %shr5.i35.i553 = lshr i64 %and.i29.i547, 8
  %or.i36.i554 = or disjoint i64 %and.i29.i547, %shr5.i35.i553
  %shr6.i37.i555 = lshr i64 %and1.i30.i548, 8
  %or7.i.i556 = or disjoint i64 %and1.i30.i548, %shr6.i37.i555
  %537 = and i64 %535, 280375465148160
  %538 = or disjoint i64 %and2.i32.i550, %537
  %or9.i38.i557 = lshr exact i64 %538, 8
  %539 = and i64 %536, 280375465148160
  %540 = or disjoint i64 %and4.i34.i552, %539
  %or11.i.i558 = lshr exact i64 %540, 8
  %and12.i.i559 = and i64 %or.i36.i554, 281470681808895
  %and13.i39.i560 = and i64 %or7.i.i556, 281470681808895
  %shr16.i.i561 = lshr i64 %and12.i.i559, 16
  %or181.i.i562 = or disjoint i64 %and12.i.i559, %shr16.i.i561
  %or18.i.i563 = trunc i64 %or181.i.i562 to i32
  store i32 %or18.i.i563, ptr %add.ptr27.i543, align 4
  %shr20.i.i564 = lshr i64 %and13.i39.i560, 16
  %or222.i.i565 = or disjoint i64 %and13.i39.i560, %shr20.i.i564
  %or22.i.i566 = trunc i64 %or222.i.i565 to i32
  %arrayidx23.i.i567 = getelementptr inbounds nuw i8, ptr %add.ptr27.i543, i32 4
  store i32 %or22.i.i566, ptr %arrayidx23.i.i567, align 4
  %shr25.i.i568 = lshr i64 %538, 24
  %or273.i.i569 = or disjoint i64 %or9.i38.i557, %shr25.i.i568
  %or27.i.i570 = trunc i64 %or273.i.i569 to i32
  %arrayidx28.i.i571 = getelementptr inbounds nuw i8, ptr %add.ptr27.i543, i32 8
  store i32 %or27.i.i570, ptr %arrayidx28.i.i571, align 4
  %shr30.i.i572 = lshr i64 %540, 24
  %or324.i.i573 = or disjoint i64 %or11.i.i558, %shr30.i.i572
  %or32.i.i574 = trunc i64 %or324.i.i573 to i32
  %arrayidx33.i.i575 = getelementptr inbounds nuw i8, ptr %add.ptr27.i543, i32 12
  store i32 %or32.i.i574, ptr %arrayidx33.i.i575, align 4
  %inc32.i576 = add nuw nsw i32 %i.2.i5191166, 1
  %exitcond2.i520.not = icmp eq i32 %inc32.i576, 4
  br i1 %exitcond2.i520.not, label %while.cond.i.i522.preheader, label %for.body24.i541, !llvm.loop !24

while.body.i.i527:                                ; preds = %while.cond.i.i522.preheader, %while.body.i.i527
  %dst.addr.0.i.i5251169 = phi ptr [ %tmp.i10, %while.cond.i.i522.preheader ], [ %add.ptr.i.i540, %while.body.i.i527 ]
  %v.addr.0.i.i5241168 = phi ptr [ %w.i63, %while.cond.i.i522.preheader ], [ %incdec.ptr.i.i529, %while.body.i.i527 ]
  %num.addr.0.i.i5231167 = phi i32 [ 16, %while.cond.i.i522.preheader ], [ %dec.i.i528, %while.body.i.i527 ]
  %dec.i.i528 = add nsw i32 %num.addr.0.i.i5231167, -1
  %incdec.ptr.i.i529 = getelementptr inbounds nuw i8, ptr %v.addr.0.i.i5241168, i32 4
  %541 = load i32, ptr %v.addr.0.i.i5241168, align 4
  %conv.i.i530 = trunc i32 %541 to i8
  store i8 %conv.i.i530, ptr %dst.addr.0.i.i5251169, align 1
  %shr.i.i531 = lshr i32 %541, 8
  %conv1.i.i532 = trunc i32 %shr.i.i531 to i8
  %arrayidx2.i.i533 = getelementptr inbounds nuw i8, ptr %dst.addr.0.i.i5251169, i32 1
  store i8 %conv1.i.i532, ptr %arrayidx2.i.i533, align 1
  %shr3.i.i534 = lshr i32 %541, 16
  %conv4.i.i535 = trunc i32 %shr3.i.i534 to i8
  %arrayidx5.i.i536 = getelementptr inbounds nuw i8, ptr %dst.addr.0.i.i5251169, i32 2
  store i8 %conv4.i.i535, ptr %arrayidx5.i.i536, align 1
  %shr6.i.i537 = lshr i32 %541, 24
  %conv7.i.i538 = trunc nuw i32 %shr6.i.i537 to i8
  %arrayidx8.i.i539 = getelementptr inbounds nuw i8, ptr %dst.addr.0.i.i5251169, i32 3
  store i8 %conv7.i.i538, ptr %arrayidx8.i.i539, align 1
  %add.ptr.i.i540 = getelementptr inbounds nuw i8, ptr %dst.addr.0.i.i5251169, i32 4
  %cmp.not.i.i526 = icmp eq i32 %dec.i.i528, 0
  br i1 %cmp.not.i.i526, label %aes_ecb4x.exit840, label %while.body.i.i527, !llvm.loop !25

aes_ecb4x.exit840:                                ; preds = %while.body.i.i527
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %w.i63)
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %q.i64)
  %add.ptr.i22 = getelementptr inbounds nuw i8, ptr %ivw.i, i32 12
  %542 = load i32, ptr %add.ptr.i22, align 4
  %543 = call i32 @llvm.bswap.i32(i32 %542)
  %add.i8.i23 = add i32 %543, 4
  %544 = call i32 @llvm.bswap.i32(i32 %add.i8.i23)
  store i32 %544, ptr %add.ptr.i22, align 4
  %add.ptr1.i24 = getelementptr inbounds nuw i8, ptr %ivw.i, i32 28
  %545 = load i32, ptr %add.ptr1.i24, align 4
  %546 = call i32 @llvm.bswap.i32(i32 %545)
  %add.i5.i25 = add i32 %546, 4
  %547 = call i32 @llvm.bswap.i32(i32 %add.i5.i25)
  store i32 %547, ptr %add.ptr1.i24, align 4
  %add.ptr2.i26 = getelementptr inbounds nuw i8, ptr %ivw.i, i32 44
  %548 = load i32, ptr %add.ptr2.i26, align 4
  %549 = call i32 @llvm.bswap.i32(i32 %548)
  %add.i2.i27 = add i32 %549, 4
  %550 = call i32 @llvm.bswap.i32(i32 %add.i2.i27)
  store i32 %550, ptr %add.ptr2.i26, align 4
  %add.ptr3.i28 = getelementptr inbounds nuw i8, ptr %ivw.i, i32 60
  %551 = load i32, ptr %add.ptr3.i28, align 4
  %552 = call i32 @llvm.bswap.i32(i32 %551)
  %add.i.i29 = add i32 %552, 4
  %553 = call i32 @llvm.bswap.i32(i32 %add.i.i29)
  store i32 %553, ptr %add.ptr3.i28, align 4
  br label %for.body.i18

for.body.i18:                                     ; preds = %aes_ecb4x.exit840, %for.body.i18
  %i.0.i171170 = phi i32 [ 0, %aes_ecb4x.exit840 ], [ %inc.i19, %for.body.i18 ]
  %arrayidx26.i = getelementptr inbounds nuw [64 x i8], ptr %tmp.i10, i32 0, i32 %i.0.i171170
  %554 = load i8, ptr %arrayidx26.i, align 1
  %arrayidx27.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i.lcssa, i32 %i.0.i171170
  store i8 %554, ptr %arrayidx27.i, align 1
  %inc.i19 = add nuw nsw i32 %i.0.i171170, 1
  %exitcond = icmp ne i32 %inc.i19, 47
  br i1 %exitcond, label %for.body.i18, label %aes_ctr.exit.loopexit, !llvm.loop !26

aes_ctr.exit.loopexit:                            ; preds = %for.body.i18
  br label %aes_ctr.exit

aes_ctr.exit:                                     ; preds = %aes_ctr.exit.loopexit
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %ivw.i)
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %tmp.i10)
  %555 = load ptr, ptr %ctx.i, align 4
  call void @free(ptr noundef %555) #8
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %ctx.i)
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %iv.i)
  call void @llvm.lifetime.start.p0(i64 40, ptr nonnull %tmp.i)
  br label %for.body.i.i

for.cond.i.preheader:                             ; preds = %for.body.i.i
  br label %for.body.i

for.body.i.i:                                     ; preds = %aes_ctr.exit, %for.body.i.i
  %i.0.i.i1171 = phi i32 [ 0, %aes_ctr.exit ], [ %inc.i.i, %for.body.i.i ]
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %tmp.i, i32 %i.0.i.i1171
  store i8 0, ptr %arrayidx.i.i, align 1
  %inc.i.i = add nuw nsw i32 %i.0.i.i1171, 1
  %exitcond.i.i.not = icmp eq i32 %inc.i.i, 40
  br i1 %exitcond.i.i.not, label %for.cond.i.preheader, label %for.body.i.i, !llvm.loop !27

for.body.i:                                       ; preds = %for.cond.i.preheader, %for.body.i
  %i.0.in.i1172 = phi i32 [ 3705, %for.cond.i.preheader ], [ %i.0.i, %for.body.i ]
  %i.0.i = add nsw i32 %i.0.in.i1172, -1
  %div1.i = mul nuw nsw i32 %i.0.i, 39
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %P, i32 %div1.i
  %call.i = call ptr @memcpy(ptr noundef nonnull %tmp.i, ptr noundef %add.ptr.i, i32 noundef 39) #8
  %mul4.i = mul nuw nsw i32 %i.0.i, 40
  %add.ptr5.i = getelementptr inbounds nuw i8, ptr %P, i32 %mul4.i
  %call8.i = call ptr @memcpy(ptr noundef %add.ptr5.i, ptr noundef nonnull %tmp.i, i32 noundef 40) #8
  %cmp.i = icmp ugt i32 %i.0.i, 0
  br i1 %cmp.i, label %for.body.i, label %unpack_m_vecs.exit, !llvm.loop !28

unpack_m_vecs.exit:                               ; preds = %for.body.i
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %tmp.i)
  ret void
}

declare dso_local ptr @memcpy(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #0

declare dso_local ptr @memset(ptr noundef, i32 noundef, i32 noundef) local_unnamed_addr #0

; Function Attrs: allocsize(0)
declare dso_local ptr @malloc(i32 noundef) local_unnamed_addr #2

declare dso_local void @exit(i32 noundef) local_unnamed_addr #0

; Function Attrs: inlinehint nounwind
define dso_local void @aes128_ecb_keyexp(ptr noundef %r, ptr noundef %key) local_unnamed_addr #1 {
entry:
  %q.i.i = alloca [8 x i64], align 8
  %skey.i = alloca [60 x i32], align 4
  %q.i = alloca [8 x i64], align 8
  %skey = alloca [22 x i64], align 8
  %call = call dereferenceable_or_null(704) ptr @malloc(i32 noundef 704) #7
  store ptr %call, ptr %r, align 4
  %cmp = icmp eq ptr %call, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef 111) #8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.lifetime.start.p0(i64 240, ptr nonnull %skey.i)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %q.i)
  br label %while.body.i.i

while.body.i.i:                                   ; preds = %if.end, %while.body.i.i
  %v.addr.0.i.i10 = phi ptr [ %skey.i, %if.end ], [ %incdec.ptr.i.i, %while.body.i.i ]
  %num.addr.0.i.i9 = phi i32 [ 4, %if.end ], [ %dec.i.i, %while.body.i.i ]
  %src.addr.0.i.i8 = phi ptr [ %key, %if.end ], [ %add.ptr.i.i, %while.body.i.i ]
  %dec.i.i = add nsw i32 %num.addr.0.i.i9, -1
  %0 = load i8, ptr %src.addr.0.i.i8, align 1
  %conv.i6.i = zext i8 %0 to i32
  %arrayidx1.i.i = getelementptr inbounds nuw i8, ptr %src.addr.0.i.i8, i32 1
  %1 = load i8, ptr %arrayidx1.i.i, align 1
  %conv2.i.i = zext i8 %1 to i32
  %shl.i.i = shl nuw nsw i32 %conv2.i.i, 8
  %or.i.i = or disjoint i32 %shl.i.i, %conv.i6.i
  %arrayidx3.i.i = getelementptr inbounds nuw i8, ptr %src.addr.0.i.i8, i32 2
  %2 = load i8, ptr %arrayidx3.i.i, align 1
  %conv4.i.i = zext i8 %2 to i32
  %shl5.i.i = shl nuw nsw i32 %conv4.i.i, 16
  %or6.i.i = or disjoint i32 %or.i.i, %shl5.i.i
  %arrayidx7.i.i = getelementptr inbounds nuw i8, ptr %src.addr.0.i.i8, i32 3
  %3 = load i8, ptr %arrayidx7.i.i, align 1
  %conv8.i.i = zext i8 %3 to i32
  %shl9.i.i = shl nuw i32 %conv8.i.i, 24
  %or10.i.i = or disjoint i32 %or6.i.i, %shl9.i.i
  %incdec.ptr.i.i = getelementptr inbounds nuw i8, ptr %v.addr.0.i.i10, i32 4
  store i32 %or10.i.i, ptr %v.addr.0.i.i10, align 4
  %add.ptr.i.i = getelementptr inbounds nuw i8, ptr %src.addr.0.i.i8, i32 4
  %cmp.not.i.i = icmp eq i32 %dec.i.i, 0
  br i1 %cmp.not.i.i, label %br_range_dec32le.exit.i, label %while.body.i.i, !llvm.loop !29

br_range_dec32le.exit.i:                          ; preds = %while.body.i.i
  %arrayidx.i1 = getelementptr inbounds nuw i8, ptr %skey.i, i32 12
  %4 = load i32, ptr %arrayidx.i1, align 4
  br label %for.body.i5

for.cond27.i.preheader:                           ; preds = %if.end16.i
  br label %for.body30.i

for.body.i5:                                      ; preds = %br_range_dec32le.exit.i, %if.end16.i
  %tmp.0.i14 = phi i32 [ %4, %br_range_dec32le.exit.i ], [ %xor19.i, %if.end16.i ]
  %k.0.i13 = phi i32 [ 0, %br_range_dec32le.exit.i ], [ %spec.select1.i, %if.end16.i ]
  %j.0.i12 = phi i32 [ 0, %br_range_dec32le.exit.i ], [ %spec.select.i, %if.end16.i ]
  %i.0.i11 = phi i32 [ 4, %br_range_dec32le.exit.i ], [ %inc26.i, %if.end16.i ]
  %cmp6.i = icmp eq i32 %j.0.i12, 0
  br i1 %cmp6.i, label %if.then.i, label %if.end16.i

if.then.i:                                        ; preds = %for.body.i5
  %5 = call i32 @llvm.fshl.i32(i32 %tmp.0.i14, i32 %tmp.0.i14, i32 24)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %q.i.i)
  %call.i.i = call ptr @memset(ptr noundef nonnull %q.i.i, i32 noundef 0, i32 noundef 64) #8
  %conv.i.i = zext i32 %5 to i64
  store i64 %conv.i.i, ptr %q.i.i, align 8
  %arrayidx1.i155.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  %6 = load i64, ptr %arrayidx1.i155.i, align 8
  %and.i156.i = and i64 %conv.i.i, 1431655765
  %and2.i157.i = shl i64 %6, 1
  %shl.i158.i = and i64 %and2.i157.i, -6148914691236517206
  %or.i159.i = or disjoint i64 %and.i156.i, %shl.i158.i
  store i64 %or.i159.i, ptr %q.i.i, align 8
  %and4.i160.i = lshr i64 %conv.i.i, 1
  %shr.i161.i = and i64 %and4.i160.i, 1431655765
  %and5.i162.i = and i64 %6, -6148914691236517206
  %or6.i163.i = or disjoint i64 %shr.i161.i, %and5.i162.i
  %arrayidx7.i164.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  store i64 %or6.i163.i, ptr %arrayidx7.i164.i, align 8
  %arrayidx11.i165.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  %7 = load i64, ptr %arrayidx11.i165.i, align 8
  %arrayidx12.i166.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  %8 = load i64, ptr %arrayidx12.i166.i, align 8
  %and13.i167.i = and i64 %7, 6148914691236517205
  %and14.i168.i = shl i64 %8, 1
  %shl15.i169.i = and i64 %and14.i168.i, -6148914691236517206
  %or16.i170.i = or disjoint i64 %and13.i167.i, %shl15.i169.i
  %arrayidx17.i171.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  store i64 %or16.i170.i, ptr %arrayidx17.i171.i, align 8
  %and18.i172.i = lshr i64 %7, 1
  %shr19.i173.i = and i64 %and18.i172.i, 6148914691236517205
  %and20.i174.i = and i64 %8, -6148914691236517206
  %or21.i175.i = or disjoint i64 %shr19.i173.i, %and20.i174.i
  %arrayidx22.i176.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  store i64 %or21.i175.i, ptr %arrayidx22.i176.i, align 8
  %arrayidx27.i177.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  %9 = load i64, ptr %arrayidx27.i177.i, align 8
  %arrayidx28.i178.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  %10 = load i64, ptr %arrayidx28.i178.i, align 8
  %and29.i179.i = and i64 %9, 6148914691236517205
  %and30.i180.i = shl i64 %10, 1
  %shl31.i181.i = and i64 %and30.i180.i, -6148914691236517206
  %or32.i182.i = or disjoint i64 %and29.i179.i, %shl31.i181.i
  %arrayidx33.i183.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  store i64 %or32.i182.i, ptr %arrayidx33.i183.i, align 8
  %and34.i184.i = lshr i64 %9, 1
  %shr35.i185.i = and i64 %and34.i184.i, 6148914691236517205
  %and36.i186.i = and i64 %10, -6148914691236517206
  %or37.i187.i = or disjoint i64 %shr35.i185.i, %and36.i186.i
  %arrayidx38.i188.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  store i64 %or37.i187.i, ptr %arrayidx38.i188.i, align 8
  %arrayidx43.i189.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  %11 = load i64, ptr %arrayidx43.i189.i, align 8
  %arrayidx44.i190.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  %12 = load i64, ptr %arrayidx44.i190.i, align 8
  %and45.i191.i = and i64 %11, 6148914691236517205
  %and46.i192.i = shl i64 %12, 1
  %shl47.i193.i = and i64 %and46.i192.i, -6148914691236517206
  %or48.i194.i = or disjoint i64 %and45.i191.i, %shl47.i193.i
  %arrayidx49.i195.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  store i64 %or48.i194.i, ptr %arrayidx49.i195.i, align 8
  %and50.i196.i = lshr i64 %11, 1
  %shr51.i197.i = and i64 %and50.i196.i, 6148914691236517205
  %and52.i198.i = and i64 %12, -6148914691236517206
  %or53.i199.i = or disjoint i64 %shr51.i197.i, %and52.i198.i
  %arrayidx54.i200.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  store i64 %or53.i199.i, ptr %arrayidx54.i200.i, align 8
  %13 = load i64, ptr %q.i.i, align 8
  %arrayidx60.i201.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  %14 = load i64, ptr %arrayidx60.i201.i, align 8
  %and61.i202.i = and i64 %13, 3689348814741910323
  %and62.i203.i = shl i64 %14, 2
  %shl63.i204.i = and i64 %and62.i203.i, -3689348814741910324
  %or64.i205.i = or disjoint i64 %and61.i202.i, %shl63.i204.i
  store i64 %or64.i205.i, ptr %q.i.i, align 8
  %and66.i206.i = lshr i64 %13, 2
  %shr67.i207.i = and i64 %and66.i206.i, 3689348814741910323
  %and68.i208.i = and i64 %14, -3689348814741910324
  %or69.i209.i = or disjoint i64 %shr67.i207.i, %and68.i208.i
  %arrayidx70.i210.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  store i64 %or69.i209.i, ptr %arrayidx70.i210.i, align 8
  %arrayidx75.i211.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  %15 = load i64, ptr %arrayidx75.i211.i, align 8
  %arrayidx76.i212.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  %16 = load i64, ptr %arrayidx76.i212.i, align 8
  %and77.i213.i = and i64 %15, 3689348814741910323
  %and78.i214.i = shl i64 %16, 2
  %shl79.i215.i = and i64 %and78.i214.i, -3689348814741910324
  %or80.i216.i = or disjoint i64 %and77.i213.i, %shl79.i215.i
  %arrayidx81.i217.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  store i64 %or80.i216.i, ptr %arrayidx81.i217.i, align 8
  %and82.i218.i = lshr i64 %15, 2
  %shr83.i219.i = and i64 %and82.i218.i, 3689348814741910323
  %and84.i220.i = and i64 %16, -3689348814741910324
  %or85.i221.i = or disjoint i64 %shr83.i219.i, %and84.i220.i
  %arrayidx86.i222.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  store i64 %or85.i221.i, ptr %arrayidx86.i222.i, align 8
  %arrayidx91.i223.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  %17 = load i64, ptr %arrayidx91.i223.i, align 8
  %arrayidx92.i224.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  %18 = load i64, ptr %arrayidx92.i224.i, align 8
  %and93.i225.i = and i64 %17, 3689348814741910323
  %and94.i226.i = shl i64 %18, 2
  %shl95.i227.i = and i64 %and94.i226.i, -3689348814741910324
  %or96.i228.i = or disjoint i64 %and93.i225.i, %shl95.i227.i
  %arrayidx97.i229.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  store i64 %or96.i228.i, ptr %arrayidx97.i229.i, align 8
  %and98.i230.i = lshr i64 %17, 2
  %shr99.i231.i = and i64 %and98.i230.i, 3689348814741910323
  %and100.i232.i = and i64 %18, -3689348814741910324
  %or101.i233.i = or disjoint i64 %shr99.i231.i, %and100.i232.i
  %arrayidx102.i234.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  store i64 %or101.i233.i, ptr %arrayidx102.i234.i, align 8
  %arrayidx107.i235.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  %19 = load i64, ptr %arrayidx107.i235.i, align 8
  %arrayidx108.i236.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  %20 = load i64, ptr %arrayidx108.i236.i, align 8
  %and109.i237.i = and i64 %19, 3689348814741910323
  %and110.i238.i = shl i64 %20, 2
  %shl111.i239.i = and i64 %and110.i238.i, -3689348814741910324
  %or112.i240.i = or disjoint i64 %and109.i237.i, %shl111.i239.i
  %arrayidx113.i241.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  store i64 %or112.i240.i, ptr %arrayidx113.i241.i, align 8
  %and114.i242.i = lshr i64 %19, 2
  %shr115.i243.i = and i64 %and114.i242.i, 3689348814741910323
  %and116.i244.i = and i64 %20, -3689348814741910324
  %or117.i245.i = or disjoint i64 %shr115.i243.i, %and116.i244.i
  %arrayidx118.i246.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  store i64 %or117.i245.i, ptr %arrayidx118.i246.i, align 8
  %21 = load i64, ptr %q.i.i, align 8
  %arrayidx124.i247.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  %22 = load i64, ptr %arrayidx124.i247.i, align 8
  %and125.i248.i = and i64 %21, 1085102592571150095
  %and126.i249.i = shl i64 %22, 4
  %shl127.i250.i = and i64 %and126.i249.i, -1085102592571150096
  %or128.i251.i = or disjoint i64 %and125.i248.i, %shl127.i250.i
  store i64 %or128.i251.i, ptr %q.i.i, align 8
  %and130.i252.i = lshr i64 %21, 4
  %shr131.i253.i = and i64 %and130.i252.i, 1085102592571150095
  %and132.i254.i = and i64 %22, -1085102592571150096
  %or133.i255.i = or disjoint i64 %shr131.i253.i, %and132.i254.i
  %arrayidx134.i256.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  store i64 %or133.i255.i, ptr %arrayidx134.i256.i, align 8
  %arrayidx139.i257.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  %23 = load i64, ptr %arrayidx139.i257.i, align 8
  %arrayidx140.i258.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  %24 = load i64, ptr %arrayidx140.i258.i, align 8
  %and141.i259.i = and i64 %23, 1085102592571150095
  %and142.i260.i = shl i64 %24, 4
  %shl143.i261.i = and i64 %and142.i260.i, -1085102592571150096
  %or144.i262.i = or disjoint i64 %and141.i259.i, %shl143.i261.i
  %arrayidx145.i263.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  store i64 %or144.i262.i, ptr %arrayidx145.i263.i, align 8
  %and146.i264.i = lshr i64 %23, 4
  %shr147.i265.i = and i64 %and146.i264.i, 1085102592571150095
  %and148.i266.i = and i64 %24, -1085102592571150096
  %or149.i267.i = or disjoint i64 %shr147.i265.i, %and148.i266.i
  %arrayidx150.i268.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  store i64 %or149.i267.i, ptr %arrayidx150.i268.i, align 8
  %arrayidx155.i269.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  %25 = load i64, ptr %arrayidx155.i269.i, align 8
  %arrayidx156.i270.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  %26 = load i64, ptr %arrayidx156.i270.i, align 8
  %and157.i271.i = and i64 %25, 1085102592571150095
  %and158.i272.i = shl i64 %26, 4
  %shl159.i273.i = and i64 %and158.i272.i, -1085102592571150096
  %or160.i274.i = or disjoint i64 %and157.i271.i, %shl159.i273.i
  %arrayidx161.i275.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  store i64 %or160.i274.i, ptr %arrayidx161.i275.i, align 8
  %and162.i276.i = lshr i64 %25, 4
  %shr163.i277.i = and i64 %and162.i276.i, 1085102592571150095
  %and164.i278.i = and i64 %26, -1085102592571150096
  %or165.i279.i = or disjoint i64 %shr163.i277.i, %and164.i278.i
  %arrayidx166.i280.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  store i64 %or165.i279.i, ptr %arrayidx166.i280.i, align 8
  %arrayidx171.i281.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  %27 = load i64, ptr %arrayidx171.i281.i, align 8
  %arrayidx172.i282.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  %28 = load i64, ptr %arrayidx172.i282.i, align 8
  %and173.i283.i = and i64 %27, 1085102592571150095
  %and174.i284.i = shl i64 %28, 4
  %shl175.i285.i = and i64 %and174.i284.i, -1085102592571150096
  %or176.i286.i = or disjoint i64 %and173.i283.i, %shl175.i285.i
  %arrayidx177.i287.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  store i64 %or176.i286.i, ptr %arrayidx177.i287.i, align 8
  %and178.i288.i = lshr i64 %27, 4
  %shr179.i289.i = and i64 %and178.i288.i, 1085102592571150095
  %and180.i290.i = and i64 %28, -1085102592571150096
  %or181.i291.i = or disjoint i64 %shr179.i289.i, %and180.i290.i
  %arrayidx182.i292.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  store i64 %or181.i291.i, ptr %arrayidx182.i292.i, align 8
  %arrayidx1.i21.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  %29 = load i64, ptr %arrayidx1.i21.i, align 8
  %arrayidx2.i22.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  %30 = load i64, ptr %arrayidx2.i22.i, align 8
  %arrayidx3.i23.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  %31 = load i64, ptr %arrayidx3.i23.i, align 8
  %arrayidx4.i24.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  %32 = load i64, ptr %arrayidx4.i24.i, align 8
  %arrayidx5.i25.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  %33 = load i64, ptr %arrayidx5.i25.i, align 8
  %arrayidx6.i26.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  %34 = load i64, ptr %arrayidx6.i26.i, align 8
  %35 = load i64, ptr %q.i.i, align 8
  %xor.i27.i = xor i64 %31, %33
  %xor8.i28.i = xor i64 %or181.i291.i, %34
  %xor9.i29.i = xor i64 %or181.i291.i, %31
  %xor10.i30.i = xor i64 %or181.i291.i, %33
  %xor11.i31.i = xor i64 %29, %30
  %xor12.i32.i = xor i64 %xor11.i31.i, %35
  %xor13.i33.i = xor i64 %xor12.i32.i, %31
  %xor14.i34.i = xor i64 %xor8.i28.i, %xor.i27.i
  %xor15.i35.i = xor i64 %xor12.i32.i, %or181.i291.i
  %xor16.i36.i = xor i64 %xor12.i32.i, %34
  %xor17.i37.i = xor i64 %xor16.i36.i, %xor10.i30.i
  %xor18.i38.i = xor i64 %32, %xor14.i34.i
  %xor19.i39.i = xor i64 %xor18.i38.i, %33
  %xor20.i40.i = xor i64 %xor18.i38.i, %29
  %xor21.i41.i = xor i64 %xor19.i39.i, %35
  %xor22.i42.i = xor i64 %xor19.i39.i, %xor11.i31.i
  %xor23.i43.i = xor i64 %xor20.i40.i, %xor9.i29.i
  %xor24.i44.i = xor i64 %35, %xor23.i43.i
  %xor25.i45.i = xor i64 %xor22.i42.i, %xor23.i43.i
  %xor27.i46.i = xor i64 %xor11.i31.i, %xor23.i43.i
  %and.i47.i = and i64 %xor14.i34.i, %xor19.i39.i
  %and30.i48.i = and i64 %xor17.i37.i, %xor21.i41.i
  %xor31.i49.i = xor i64 %and30.i48.i, %and.i47.i
  %and32.i50.i = and i64 %xor13.i33.i, %35
  %and34.i51.i = and i64 %xor8.i28.i, %xor27.i46.i
  %and35.i52.i = and i64 %xor16.i36.i, %xor12.i32.i
  %and37.i53.i = and i64 %xor15.i35.i, %xor24.i44.i
  %and39.i54.i = and i64 %xor9.i29.i, %xor23.i43.i
  %and40.i55.i = and i64 %xor.i27.i, %xor25.i45.i
  %xor41.i56.i = xor i64 %and40.i55.i, %and39.i54.i
  %and42.i57.i = and i64 %xor10.i30.i, %xor22.i42.i
  %xor43.i58.i = xor i64 %and42.i57.i, %and39.i54.i
  %xor44.i59.i = xor i64 %xor31.i49.i, %xor41.i56.i
  %xor48.i60.i = xor i64 %xor44.i59.i, %xor20.i40.i
  %36 = xor i64 %xor10.i30.i, %and32.i50.i
  %37 = xor i64 %36, %xor22.i42.i
  %38 = xor i64 %37, %and.i47.i
  %xor49.i61.i = xor i64 %38, %xor43.i58.i
  %39 = xor i64 %xor27.i46.i, %and35.i52.i
  %40 = xor i64 %39, %xor8.i28.i
  %41 = xor i64 %40, %and34.i51.i
  %xor50.i62.i = xor i64 %41, %xor41.i56.i
  %42 = xor i64 %xor27.i46.i, %and37.i53.i
  %43 = xor i64 %42, %or181.i291.i
  %44 = xor i64 %43, %and34.i51.i
  %xor51.i63.i = xor i64 %44, %xor43.i58.i
  %xor52.i64.i = xor i64 %xor48.i60.i, %xor49.i61.i
  %and53.i65.i = and i64 %xor48.i60.i, %xor50.i62.i
  %xor54.i66.i = xor i64 %xor51.i63.i, %and53.i65.i
  %and55.i67.i = and i64 %xor52.i64.i, %xor54.i66.i
  %xor56.i68.i = xor i64 %and55.i67.i, %xor49.i61.i
  %xor57.i69.i = xor i64 %xor50.i62.i, %xor51.i63.i
  %xor58.i70.i = xor i64 %xor49.i61.i, %and53.i65.i
  %and59.i71.i = and i64 %xor58.i70.i, %xor57.i69.i
  %xor60.i72.i = xor i64 %and59.i71.i, %xor51.i63.i
  %xor61.i73.i = xor i64 %xor50.i62.i, %xor60.i72.i
  %xor62.i74.i = xor i64 %and59.i71.i, %and53.i65.i
  %and63.i75.i = and i64 %xor51.i63.i, %xor62.i74.i
  %xor64.i76.i = xor i64 %and63.i75.i, %xor61.i73.i
  %xor65.i77.i = xor i64 %xor54.i66.i, %and63.i75.i
  %and66.i78.i = and i64 %xor56.i68.i, %xor65.i77.i
  %xor67.i79.i = xor i64 %xor52.i64.i, %and66.i78.i
  %xor68.i80.i = xor i64 %xor67.i79.i, %xor64.i76.i
  %xor69.i81.i = xor i64 %xor56.i68.i, %xor60.i72.i
  %xor70.i82.i = xor i64 %xor56.i68.i, %xor67.i79.i
  %xor71.i83.i = xor i64 %and63.i75.i, %xor50.i62.i
  %xor72.i84.i = xor i64 %xor69.i81.i, %xor68.i80.i
  %and73.i85.i = and i64 %xor71.i83.i, %xor19.i39.i
  %and74.i86.i = and i64 %xor64.i76.i, %xor21.i41.i
  %and75.i87.i = and i64 %xor60.i72.i, %35
  %and76.i88.i = and i64 %xor70.i82.i, %xor27.i46.i
  %and77.i89.i = and i64 %xor67.i79.i, %xor12.i32.i
  %and78.i90.i = and i64 %xor56.i68.i, %xor24.i44.i
  %and79.i91.i = and i64 %xor69.i81.i, %xor23.i43.i
  %and80.i92.i = and i64 %xor72.i84.i, %xor25.i45.i
  %and81.i93.i = and i64 %xor68.i80.i, %xor22.i42.i
  %and82.i94.i = and i64 %xor71.i83.i, %xor14.i34.i
  %and83.i95.i = and i64 %xor64.i76.i, %xor17.i37.i
  %and84.i96.i = and i64 %xor60.i72.i, %xor13.i33.i
  %and85.i97.i = and i64 %xor70.i82.i, %xor8.i28.i
  %and86.i98.i = and i64 %xor67.i79.i, %xor16.i36.i
  %and87.i99.i = and i64 %xor56.i68.i, %xor15.i35.i
  %and88.i100.i = and i64 %xor69.i81.i, %xor9.i29.i
  %and89.i101.i = and i64 %xor72.i84.i, %xor.i27.i
  %and90.i102.i = and i64 %xor68.i80.i, %xor10.i30.i
  %xor91.i103.i = xor i64 %and88.i100.i, %and89.i101.i
  %xor92.i104.i = xor i64 %and83.i95.i, %and84.i96.i
  %xor93.i105.i = xor i64 %and78.i90.i, %and86.i98.i
  %xor94.i106.i = xor i64 %and82.i94.i, %and83.i95.i
  %xor95.i107.i = xor i64 %and75.i87.i, %and85.i97.i
  %xor96.i108.i = xor i64 %and75.i87.i, %and78.i90.i
  %xor97.i109.i = xor i64 %and80.i92.i, %and81.i93.i
  %xor98.i110.i = xor i64 %and73.i85.i, %and76.i88.i
  %xor99.i111.i = xor i64 %and79.i91.i, %and80.i92.i
  %xor100.i112.i = xor i64 %and89.i101.i, %and90.i102.i
  %xor101.i113.i = xor i64 %and85.i97.i, %xor93.i105.i
  %xor102.i114.i = xor i64 %xor95.i107.i, %xor98.i110.i
  %xor103.i115.i = xor i64 %and77.i89.i, %xor91.i103.i
  %xor104.i116.i = xor i64 %and76.i88.i, %xor99.i111.i
  %xor105.i117.i = xor i64 %xor91.i103.i, %xor102.i114.i
  %xor106.i118.i = xor i64 %and87.i99.i, %xor102.i114.i
  %xor107.i119.i = xor i64 %xor97.i109.i, %xor103.i115.i
  %xor108.i120.i = xor i64 %xor94.i106.i, %xor103.i115.i
  %xor109.i121.i = xor i64 %and77.i89.i, %xor104.i116.i
  %xor110.i122.i = xor i64 %xor106.i118.i, %xor107.i119.i
  %xor111.i123.i = xor i64 %and74.i86.i, %xor108.i120.i
  %xor112.i124.i = xor i64 %xor104.i116.i, %xor108.i120.i
  %45 = xor i64 %xor107.i119.i, %xor101.i113.i
  %xor113.i125.i = xor i64 %45, -1
  %46 = xor i64 %xor105.i117.i, %xor93.i105.i
  %xor115.i126.i = xor i64 %46, -1
  %xor117.i127.i = xor i64 %xor98.i110.i, %xor111.i123.i
  %xor118.i128.i = xor i64 %xor96.i108.i, %xor111.i123.i
  %xor119.i129.i = xor i64 %xor92.i104.i, %xor110.i122.i
  %47 = xor i64 %xor117.i127.i, %xor109.i121.i
  %xor121.i130.i = xor i64 %47, -1
  %48 = xor i64 %xor110.i122.i, %xor100.i112.i
  %49 = xor i64 %48, %xor109.i121.i
  %xor123.i131.i = xor i64 %49, -1
  %arrayidx124.i132.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  store i64 %xor112.i124.i, ptr %arrayidx124.i132.i, align 8
  %arrayidx125.i133.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  store i64 %xor121.i130.i, ptr %arrayidx125.i133.i, align 8
  %arrayidx126.i134.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  store i64 %xor123.i131.i, ptr %arrayidx126.i134.i, align 8
  %arrayidx127.i135.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  store i64 %xor117.i127.i, ptr %arrayidx127.i135.i, align 8
  %arrayidx128.i136.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  store i64 %xor118.i128.i, ptr %arrayidx128.i136.i, align 8
  %arrayidx129.i137.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  store i64 %xor119.i129.i, ptr %arrayidx129.i137.i, align 8
  %arrayidx130.i138.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  store i64 %xor113.i125.i, ptr %arrayidx130.i138.i, align 8
  %and.i570.i = and i64 %xor115.i126.i, 6148914691236517205
  %and2.i571.i = shl i64 %xor113.i125.i, 1
  %shl.i572.i = and i64 %and2.i571.i, -6148914691236517206
  %or.i573.i = or disjoint i64 %and.i570.i, %shl.i572.i
  store i64 %or.i573.i, ptr %q.i.i, align 8
  %and4.i574.i = lshr i64 %xor115.i126.i, 1
  %shr.i575.i = and i64 %and4.i574.i, 6148914691236517205
  %and5.i576.i = and i64 %xor113.i125.i, -6148914691236517206
  %or6.i577.i = or disjoint i64 %shr.i575.i, %and5.i576.i
  %arrayidx7.i578.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  store i64 %or6.i577.i, ptr %arrayidx7.i578.i, align 8
  %arrayidx11.i579.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  %50 = load i64, ptr %arrayidx11.i579.i, align 8
  %arrayidx12.i580.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  %51 = load i64, ptr %arrayidx12.i580.i, align 8
  %and13.i581.i = and i64 %50, 6148914691236517205
  %and14.i582.i = shl i64 %51, 1
  %shl15.i583.i = and i64 %and14.i582.i, -6148914691236517206
  %or16.i584.i = or disjoint i64 %and13.i581.i, %shl15.i583.i
  %arrayidx17.i585.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  store i64 %or16.i584.i, ptr %arrayidx17.i585.i, align 8
  %and18.i586.i = lshr i64 %50, 1
  %shr19.i587.i = and i64 %and18.i586.i, 6148914691236517205
  %and20.i588.i = and i64 %51, -6148914691236517206
  %or21.i589.i = or disjoint i64 %shr19.i587.i, %and20.i588.i
  %arrayidx22.i590.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  store i64 %or21.i589.i, ptr %arrayidx22.i590.i, align 8
  %arrayidx27.i591.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  %52 = load i64, ptr %arrayidx27.i591.i, align 8
  %arrayidx28.i592.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  %53 = load i64, ptr %arrayidx28.i592.i, align 8
  %and29.i593.i = and i64 %52, 6148914691236517205
  %and30.i594.i = shl i64 %53, 1
  %shl31.i595.i = and i64 %and30.i594.i, -6148914691236517206
  %or32.i596.i = or disjoint i64 %and29.i593.i, %shl31.i595.i
  %arrayidx33.i597.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  store i64 %or32.i596.i, ptr %arrayidx33.i597.i, align 8
  %and34.i598.i = lshr i64 %52, 1
  %shr35.i599.i = and i64 %and34.i598.i, 6148914691236517205
  %and36.i600.i = and i64 %53, -6148914691236517206
  %or37.i601.i = or disjoint i64 %shr35.i599.i, %and36.i600.i
  %arrayidx38.i602.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  store i64 %or37.i601.i, ptr %arrayidx38.i602.i, align 8
  %arrayidx43.i603.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  %54 = load i64, ptr %arrayidx43.i603.i, align 8
  %arrayidx44.i604.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  %55 = load i64, ptr %arrayidx44.i604.i, align 8
  %and45.i605.i = and i64 %54, 6148914691236517205
  %and46.i606.i = shl i64 %55, 1
  %shl47.i607.i = and i64 %and46.i606.i, -6148914691236517206
  %or48.i608.i = or disjoint i64 %and45.i605.i, %shl47.i607.i
  %arrayidx49.i609.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  store i64 %or48.i608.i, ptr %arrayidx49.i609.i, align 8
  %and50.i610.i = lshr i64 %54, 1
  %shr51.i611.i = and i64 %and50.i610.i, 6148914691236517205
  %and52.i612.i = and i64 %55, -6148914691236517206
  %or53.i613.i = or disjoint i64 %shr51.i611.i, %and52.i612.i
  %arrayidx54.i614.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  store i64 %or53.i613.i, ptr %arrayidx54.i614.i, align 8
  %56 = load i64, ptr %q.i.i, align 8
  %arrayidx60.i615.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  %57 = load i64, ptr %arrayidx60.i615.i, align 8
  %and61.i616.i = and i64 %56, 3689348814741910323
  %and62.i617.i = shl i64 %57, 2
  %shl63.i618.i = and i64 %and62.i617.i, -3689348814741910324
  %or64.i619.i = or disjoint i64 %and61.i616.i, %shl63.i618.i
  store i64 %or64.i619.i, ptr %q.i.i, align 8
  %and66.i620.i = lshr i64 %56, 2
  %shr67.i621.i = and i64 %and66.i620.i, 3689348814741910323
  %and68.i622.i = and i64 %57, -3689348814741910324
  %or69.i623.i = or disjoint i64 %shr67.i621.i, %and68.i622.i
  %arrayidx70.i624.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  store i64 %or69.i623.i, ptr %arrayidx70.i624.i, align 8
  %arrayidx75.i625.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  %58 = load i64, ptr %arrayidx75.i625.i, align 8
  %arrayidx76.i626.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  %59 = load i64, ptr %arrayidx76.i626.i, align 8
  %and77.i627.i = and i64 %58, 3689348814741910323
  %and78.i628.i = shl i64 %59, 2
  %shl79.i629.i = and i64 %and78.i628.i, -3689348814741910324
  %or80.i630.i = or disjoint i64 %and77.i627.i, %shl79.i629.i
  %arrayidx81.i631.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  store i64 %or80.i630.i, ptr %arrayidx81.i631.i, align 8
  %and82.i632.i = lshr i64 %58, 2
  %shr83.i633.i = and i64 %and82.i632.i, 3689348814741910323
  %and84.i634.i = and i64 %59, -3689348814741910324
  %or85.i635.i = or disjoint i64 %shr83.i633.i, %and84.i634.i
  %arrayidx86.i636.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  store i64 %or85.i635.i, ptr %arrayidx86.i636.i, align 8
  %arrayidx91.i637.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  %60 = load i64, ptr %arrayidx91.i637.i, align 8
  %arrayidx92.i638.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  %61 = load i64, ptr %arrayidx92.i638.i, align 8
  %and93.i639.i = and i64 %60, 3689348814741910323
  %and94.i640.i = shl i64 %61, 2
  %shl95.i641.i = and i64 %and94.i640.i, -3689348814741910324
  %or96.i642.i = or disjoint i64 %and93.i639.i, %shl95.i641.i
  %arrayidx97.i643.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  store i64 %or96.i642.i, ptr %arrayidx97.i643.i, align 8
  %and98.i644.i = lshr i64 %60, 2
  %shr99.i645.i = and i64 %and98.i644.i, 3689348814741910323
  %and100.i646.i = and i64 %61, -3689348814741910324
  %or101.i647.i = or disjoint i64 %shr99.i645.i, %and100.i646.i
  %arrayidx102.i648.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  store i64 %or101.i647.i, ptr %arrayidx102.i648.i, align 8
  %arrayidx107.i649.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  %62 = load i64, ptr %arrayidx107.i649.i, align 8
  %arrayidx108.i650.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  %63 = load i64, ptr %arrayidx108.i650.i, align 8
  %and109.i651.i = and i64 %62, 3689348814741910323
  %and110.i652.i = shl i64 %63, 2
  %shl111.i653.i = and i64 %and110.i652.i, -3689348814741910324
  %or112.i654.i = or disjoint i64 %and109.i651.i, %shl111.i653.i
  %arrayidx113.i655.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  store i64 %or112.i654.i, ptr %arrayidx113.i655.i, align 8
  %and114.i656.i = lshr i64 %62, 2
  %shr115.i657.i = and i64 %and114.i656.i, 3689348814741910323
  %and116.i658.i = and i64 %63, -3689348814741910324
  %or117.i659.i = or disjoint i64 %shr115.i657.i, %and116.i658.i
  %arrayidx118.i660.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  store i64 %or117.i659.i, ptr %arrayidx118.i660.i, align 8
  %64 = load i64, ptr %q.i.i, align 8
  %arrayidx124.i661.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  %65 = load i64, ptr %arrayidx124.i661.i, align 8
  %and125.i662.i = and i64 %64, 1085102592571150095
  %and126.i663.i = shl i64 %65, 4
  %shl127.i664.i = and i64 %and126.i663.i, -1085102592571150096
  %or128.i665.i = or disjoint i64 %and125.i662.i, %shl127.i664.i
  store i64 %or128.i665.i, ptr %q.i.i, align 8
  %and130.i666.i = lshr i64 %64, 4
  %shr131.i667.i = and i64 %and130.i666.i, 1085102592571150095
  %and132.i668.i = and i64 %65, -1085102592571150096
  %or133.i669.i = or disjoint i64 %shr131.i667.i, %and132.i668.i
  %arrayidx134.i670.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  store i64 %or133.i669.i, ptr %arrayidx134.i670.i, align 8
  %arrayidx139.i671.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  %66 = load i64, ptr %arrayidx139.i671.i, align 8
  %arrayidx140.i672.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  %67 = load i64, ptr %arrayidx140.i672.i, align 8
  %and141.i673.i = and i64 %66, 1085102592571150095
  %and142.i674.i = shl i64 %67, 4
  %shl143.i675.i = and i64 %and142.i674.i, -1085102592571150096
  %or144.i676.i = or disjoint i64 %and141.i673.i, %shl143.i675.i
  %arrayidx145.i677.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  store i64 %or144.i676.i, ptr %arrayidx145.i677.i, align 8
  %and146.i678.i = lshr i64 %66, 4
  %shr147.i679.i = and i64 %and146.i678.i, 1085102592571150095
  %and148.i680.i = and i64 %67, -1085102592571150096
  %or149.i681.i = or disjoint i64 %shr147.i679.i, %and148.i680.i
  %arrayidx150.i682.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  store i64 %or149.i681.i, ptr %arrayidx150.i682.i, align 8
  %arrayidx155.i683.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  %68 = load i64, ptr %arrayidx155.i683.i, align 8
  %arrayidx156.i684.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  %69 = load i64, ptr %arrayidx156.i684.i, align 8
  %and157.i685.i = and i64 %68, 1085102592571150095
  %and158.i686.i = shl i64 %69, 4
  %shl159.i687.i = and i64 %and158.i686.i, -1085102592571150096
  %or160.i688.i = or disjoint i64 %and157.i685.i, %shl159.i687.i
  %arrayidx161.i689.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  store i64 %or160.i688.i, ptr %arrayidx161.i689.i, align 8
  %and162.i690.i = lshr i64 %68, 4
  %shr163.i691.i = and i64 %and162.i690.i, 1085102592571150095
  %and164.i692.i = and i64 %69, -1085102592571150096
  %or165.i693.i = or disjoint i64 %shr163.i691.i, %and164.i692.i
  %arrayidx166.i694.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  store i64 %or165.i693.i, ptr %arrayidx166.i694.i, align 8
  %arrayidx171.i695.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  %70 = load i64, ptr %arrayidx171.i695.i, align 8
  %arrayidx172.i696.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  %71 = load i64, ptr %arrayidx172.i696.i, align 8
  %and173.i697.i = and i64 %70, 1085102592571150095
  %and174.i698.i = shl i64 %71, 4
  %shl175.i699.i = and i64 %and174.i698.i, -1085102592571150096
  %or176.i700.i = or disjoint i64 %and173.i697.i, %shl175.i699.i
  %arrayidx177.i701.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  store i64 %or176.i700.i, ptr %arrayidx177.i701.i, align 8
  %and178.i702.i = lshr i64 %70, 4
  %shr179.i703.i = and i64 %and178.i702.i, 1085102592571150095
  %and180.i704.i = and i64 %71, -1085102592571150096
  %or181.i705.i = or disjoint i64 %shr179.i703.i, %and180.i704.i
  %arrayidx182.i706.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  store i64 %or181.i705.i, ptr %arrayidx182.i706.i, align 8
  %72 = load i64, ptr %q.i.i, align 8
  %conv5.i.i = trunc i64 %72 to i32
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %q.i.i)
  %arrayidx9.i = getelementptr inbounds nuw [10 x i8], ptr @Rcon, i32 0, i32 %k.0.i13
  %73 = load i8, ptr %arrayidx9.i, align 1
  %conv.i = zext i8 %73 to i32
  %xor.i = xor i32 %conv5.i.i, %conv.i
  br label %if.end16.i

if.end16.i:                                       ; preds = %for.body.i5, %if.then.i
  %tmp.2.i = phi i32 [ %xor.i, %if.then.i ], [ %tmp.0.i14, %for.body.i5 ]
  %sub17.i = add nsw i32 %i.0.i11, -4
  %arrayidx18.i = getelementptr inbounds nuw [60 x i32], ptr %skey.i, i32 0, i32 %sub17.i
  %74 = load i32, ptr %arrayidx18.i, align 4
  %xor19.i = xor i32 %tmp.2.i, %74
  %arrayidx20.i6 = getelementptr inbounds nuw [60 x i32], ptr %skey.i, i32 0, i32 %i.0.i11
  store i32 %xor19.i, ptr %arrayidx20.i6, align 4
  %inc.i7 = add i32 %j.0.i12, 1
  %cmp21.i = icmp eq i32 %inc.i7, 4
  %spec.select.i = select i1 %cmp21.i, i32 0, i32 %inc.i7
  %inc24.i = zext i1 %cmp21.i to i32
  %spec.select1.i = add i32 %k.0.i13, %inc24.i
  %inc26.i = add nuw nsw i32 %i.0.i11, 1
  %exitcond.i3.not = icmp eq i32 %inc26.i, 44
  br i1 %exitcond.i3.not, label %for.cond27.i.preheader, label %for.body.i5, !llvm.loop !30

for.body30.i:                                     ; preds = %for.cond27.i.preheader, %for.body30.i
  %j.2.i16 = phi i32 [ 0, %for.cond27.i.preheader ], [ %add74.i, %for.body30.i ]
  %i.1.i15 = phi i32 [ 0, %for.cond27.i.preheader ], [ %add73.i, %for.body30.i ]
  %arrayidx32.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %add.ptr.i = getelementptr inbounds nuw i32, ptr %skey.i, i32 %i.1.i15
  %75 = load i32, ptr %add.ptr.i, align 4
  %conv.i7.i = zext i32 %75 to i64
  %arrayidx1.i8.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 4
  %76 = load i32, ptr %arrayidx1.i8.i, align 4
  %conv2.i9.i = zext i32 %76 to i64
  %arrayidx3.i10.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 8
  %77 = load i32, ptr %arrayidx3.i10.i, align 4
  %conv4.i11.i = zext i32 %77 to i64
  %arrayidx5.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 12
  %78 = load i32, ptr %arrayidx5.i.i, align 4
  %conv6.i.i = zext i32 %78 to i64
  %shl.i12.i = shl nuw nsw i64 %conv.i7.i, 16
  %or.i13.i = or i64 %shl.i12.i, %conv.i7.i
  %shl7.i.i = shl nuw nsw i64 %conv2.i9.i, 16
  %or8.i.i = or i64 %shl7.i.i, %conv2.i9.i
  %shl9.i14.i = shl nuw nsw i64 %conv4.i11.i, 16
  %or10.i15.i = or i64 %shl9.i14.i, %conv4.i11.i
  %shl11.i.i = shl nuw nsw i64 %conv6.i.i, 16
  %or12.i.i = or i64 %shl11.i.i, %conv6.i.i
  %and.i.i = and i64 %or.i13.i, 281470681808895
  %and13.i.i = and i64 %or8.i.i, 281470681808895
  %and14.i.i = and i64 %or10.i15.i, 281470681808895
  %and15.i.i = and i64 %or12.i.i, 281470681808895
  %shl16.i.i = shl nuw nsw i64 %and.i.i, 8
  %or17.i.i = or i64 %and.i.i, %shl16.i.i
  %shl18.i.i = shl nuw nsw i64 %and13.i.i, 8
  %or19.i.i = or i64 %and13.i.i, %shl18.i.i
  %and24.i.i = and i64 %or17.i.i, 71777214294589695
  %and25.i.i = and i64 %or19.i.i, 71777214294589695
  %79 = shl nuw i64 %and14.i.i, 16
  %80 = shl nuw nsw i64 %and14.i.i, 8
  %and26.i.i = or i64 %79, %80
  %shl28.i.i = and i64 %and26.i.i, -71777214294589696
  %or29.i.i = or disjoint i64 %and24.i.i, %shl28.i.i
  store i64 %or29.i.i, ptr %q.i, align 8
  %81 = shl nuw i64 %and15.i.i, 16
  %82 = shl nuw nsw i64 %and15.i.i, 8
  %and27.i.i = or i64 %81, %82
  %shl30.i.i = and i64 %and27.i.i, -71777214294589696
  %or31.i.i = or disjoint i64 %and25.i.i, %shl30.i.i
  store i64 %or31.i.i, ptr %arrayidx32.i, align 8
  %83 = load i64, ptr %q.i, align 8
  %arrayidx35.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %83, ptr %arrayidx35.i, align 8
  %arrayidx37.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %83, ptr %arrayidx37.i, align 8
  %arrayidx39.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %83, ptr %arrayidx39.i, align 8
  %arrayidx40.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %84 = load i64, ptr %arrayidx40.i, align 8
  %arrayidx41.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %84, ptr %arrayidx41.i, align 8
  %arrayidx43.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %84, ptr %arrayidx43.i, align 8
  %arrayidx45.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %84, ptr %arrayidx45.i, align 8
  %85 = load i64, ptr %q.i, align 8
  %arrayidx1.i139.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %86 = load i64, ptr %arrayidx1.i139.i, align 8
  %and.i140.i = and i64 %85, 6148914691236517205
  %and2.i.i = shl i64 %86, 1
  %shl.i141.i = and i64 %and2.i.i, -6148914691236517206
  %or.i142.i = or disjoint i64 %and.i140.i, %shl.i141.i
  store i64 %or.i142.i, ptr %q.i, align 8
  %and4.i.i = lshr i64 %85, 1
  %shr.i.i = and i64 %and4.i.i, 6148914691236517205
  %and5.i.i = and i64 %86, -6148914691236517206
  %or6.i143.i = or disjoint i64 %shr.i.i, %and5.i.i
  %arrayidx7.i144.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or6.i143.i, ptr %arrayidx7.i144.i, align 8
  %arrayidx11.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %87 = load i64, ptr %arrayidx11.i.i, align 8
  %arrayidx12.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %88 = load i64, ptr %arrayidx12.i.i, align 8
  %and13.i145.i = and i64 %87, 6148914691236517205
  %and14.i146.i = shl i64 %88, 1
  %shl15.i.i = and i64 %and14.i146.i, -6148914691236517206
  %or16.i.i = or disjoint i64 %and13.i145.i, %shl15.i.i
  %arrayidx17.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or16.i.i, ptr %arrayidx17.i.i, align 8
  %and18.i.i = lshr i64 %87, 1
  %shr19.i.i = and i64 %and18.i.i, 6148914691236517205
  %and20.i.i = and i64 %88, -6148914691236517206
  %or21.i.i = or disjoint i64 %shr19.i.i, %and20.i.i
  %arrayidx22.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or21.i.i, ptr %arrayidx22.i.i, align 8
  %arrayidx27.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %89 = load i64, ptr %arrayidx27.i.i, align 8
  %arrayidx28.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %90 = load i64, ptr %arrayidx28.i.i, align 8
  %and29.i.i = and i64 %89, 6148914691236517205
  %and30.i147.i = shl i64 %90, 1
  %shl31.i.i = and i64 %and30.i147.i, -6148914691236517206
  %or32.i.i = or disjoint i64 %and29.i.i, %shl31.i.i
  %arrayidx33.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or32.i.i, ptr %arrayidx33.i.i, align 8
  %and34.i148.i = lshr i64 %89, 1
  %shr35.i.i = and i64 %and34.i148.i, 6148914691236517205
  %and36.i.i = and i64 %90, -6148914691236517206
  %or37.i.i = or disjoint i64 %shr35.i.i, %and36.i.i
  %arrayidx38.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or37.i.i, ptr %arrayidx38.i.i, align 8
  %arrayidx43.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %91 = load i64, ptr %arrayidx43.i.i, align 8
  %arrayidx44.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %92 = load i64, ptr %arrayidx44.i.i, align 8
  %and45.i.i = and i64 %91, 6148914691236517205
  %and46.i.i = shl i64 %92, 1
  %shl47.i.i = and i64 %and46.i.i, -6148914691236517206
  %or48.i.i = or disjoint i64 %and45.i.i, %shl47.i.i
  %arrayidx49.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or48.i.i, ptr %arrayidx49.i.i, align 8
  %and50.i.i = lshr i64 %91, 1
  %shr51.i.i = and i64 %and50.i.i, 6148914691236517205
  %and52.i.i = and i64 %92, -6148914691236517206
  %or53.i.i = or disjoint i64 %shr51.i.i, %and52.i.i
  %arrayidx54.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or53.i.i, ptr %arrayidx54.i.i, align 8
  %93 = load i64, ptr %q.i, align 8
  %arrayidx60.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %94 = load i64, ptr %arrayidx60.i.i, align 8
  %and61.i.i = and i64 %93, 3689348814741910323
  %and62.i.i = shl i64 %94, 2
  %shl63.i.i = and i64 %and62.i.i, -3689348814741910324
  %or64.i.i = or disjoint i64 %and61.i.i, %shl63.i.i
  store i64 %or64.i.i, ptr %q.i, align 8
  %and66.i149.i = lshr i64 %93, 2
  %shr67.i.i = and i64 %and66.i149.i, 3689348814741910323
  %and68.i.i = and i64 %94, -3689348814741910324
  %or69.i.i = or disjoint i64 %shr67.i.i, %and68.i.i
  %arrayidx70.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or69.i.i, ptr %arrayidx70.i.i, align 8
  %arrayidx75.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %95 = load i64, ptr %arrayidx75.i.i, align 8
  %arrayidx76.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %96 = load i64, ptr %arrayidx76.i.i, align 8
  %and77.i150.i = and i64 %95, 3689348814741910323
  %and78.i151.i = shl i64 %96, 2
  %shl79.i.i = and i64 %and78.i151.i, -3689348814741910324
  %or80.i.i = or disjoint i64 %and77.i150.i, %shl79.i.i
  %arrayidx81.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or80.i.i, ptr %arrayidx81.i.i, align 8
  %and82.i152.i = lshr i64 %95, 2
  %shr83.i.i = and i64 %and82.i152.i, 3689348814741910323
  %and84.i153.i = and i64 %96, -3689348814741910324
  %or85.i.i = or disjoint i64 %shr83.i.i, %and84.i153.i
  %arrayidx86.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or85.i.i, ptr %arrayidx86.i.i, align 8
  %arrayidx91.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %97 = load i64, ptr %arrayidx91.i.i, align 8
  %arrayidx92.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %98 = load i64, ptr %arrayidx92.i.i, align 8
  %and93.i.i = and i64 %97, 3689348814741910323
  %and94.i.i = shl i64 %98, 2
  %shl95.i.i = and i64 %and94.i.i, -3689348814741910324
  %or96.i.i = or disjoint i64 %and93.i.i, %shl95.i.i
  %arrayidx97.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or96.i.i, ptr %arrayidx97.i.i, align 8
  %and98.i.i = lshr i64 %97, 2
  %shr99.i.i = and i64 %and98.i.i, 3689348814741910323
  %and100.i.i = and i64 %98, -3689348814741910324
  %or101.i.i = or disjoint i64 %shr99.i.i, %and100.i.i
  %arrayidx102.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or101.i.i, ptr %arrayidx102.i.i, align 8
  %arrayidx107.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %99 = load i64, ptr %arrayidx107.i.i, align 8
  %arrayidx108.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %100 = load i64, ptr %arrayidx108.i.i, align 8
  %and109.i.i = and i64 %99, 3689348814741910323
  %and110.i.i = shl i64 %100, 2
  %shl111.i.i = and i64 %and110.i.i, -3689348814741910324
  %or112.i.i = or disjoint i64 %and109.i.i, %shl111.i.i
  %arrayidx113.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or112.i.i, ptr %arrayidx113.i.i, align 8
  %and114.i.i = lshr i64 %99, 2
  %shr115.i.i = and i64 %and114.i.i, 3689348814741910323
  %and116.i.i = and i64 %100, -3689348814741910324
  %or117.i.i = or disjoint i64 %shr115.i.i, %and116.i.i
  %arrayidx118.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or117.i.i, ptr %arrayidx118.i.i, align 8
  %101 = load i64, ptr %q.i, align 8
  %arrayidx124.i154.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %102 = load i64, ptr %arrayidx124.i154.i, align 8
  %and125.i.i = and i64 %101, 1085102592571150095
  %and126.i.i = shl i64 %102, 4
  %shl127.i.i = and i64 %and126.i.i, -1085102592571150096
  %or128.i.i = or disjoint i64 %and125.i.i, %shl127.i.i
  store i64 %or128.i.i, ptr %q.i, align 8
  %and130.i.i = lshr i64 %101, 4
  %shr131.i.i = and i64 %and130.i.i, 1085102592571150095
  %and132.i.i = and i64 %102, -1085102592571150096
  %or133.i.i = or disjoint i64 %shr131.i.i, %and132.i.i
  %arrayidx134.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or133.i.i, ptr %arrayidx134.i.i, align 8
  %arrayidx139.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %103 = load i64, ptr %arrayidx139.i.i, align 8
  %arrayidx140.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %104 = load i64, ptr %arrayidx140.i.i, align 8
  %and141.i.i = and i64 %103, 1085102592571150095
  %and142.i.i = shl i64 %104, 4
  %shl143.i.i = and i64 %and142.i.i, -1085102592571150096
  %or144.i.i = or disjoint i64 %and141.i.i, %shl143.i.i
  %arrayidx145.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or144.i.i, ptr %arrayidx145.i.i, align 8
  %and146.i.i = lshr i64 %103, 4
  %shr147.i.i = and i64 %and146.i.i, 1085102592571150095
  %and148.i.i = and i64 %104, -1085102592571150096
  %or149.i.i = or disjoint i64 %shr147.i.i, %and148.i.i
  %arrayidx150.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or149.i.i, ptr %arrayidx150.i.i, align 8
  %arrayidx155.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %105 = load i64, ptr %arrayidx155.i.i, align 8
  %arrayidx156.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %106 = load i64, ptr %arrayidx156.i.i, align 8
  %and157.i.i = and i64 %105, 1085102592571150095
  %and158.i.i = shl i64 %106, 4
  %shl159.i.i = and i64 %and158.i.i, -1085102592571150096
  %or160.i.i = or disjoint i64 %and157.i.i, %shl159.i.i
  %arrayidx161.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or160.i.i, ptr %arrayidx161.i.i, align 8
  %and162.i.i = lshr i64 %105, 4
  %shr163.i.i = and i64 %and162.i.i, 1085102592571150095
  %and164.i.i = and i64 %106, -1085102592571150096
  %or165.i.i = or disjoint i64 %shr163.i.i, %and164.i.i
  %arrayidx166.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or165.i.i, ptr %arrayidx166.i.i, align 8
  %arrayidx171.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %107 = load i64, ptr %arrayidx171.i.i, align 8
  %arrayidx172.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %108 = load i64, ptr %arrayidx172.i.i, align 8
  %and173.i.i = and i64 %107, 1085102592571150095
  %and174.i.i = shl i64 %108, 4
  %shl175.i.i = and i64 %and174.i.i, -1085102592571150096
  %or176.i.i = or disjoint i64 %and173.i.i, %shl175.i.i
  %arrayidx177.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or176.i.i, ptr %arrayidx177.i.i, align 8
  %and178.i.i = lshr i64 %107, 4
  %shr179.i.i = and i64 %and178.i.i, 1085102592571150095
  %and180.i.i = and i64 %108, -1085102592571150096
  %or181.i.i = or disjoint i64 %shr179.i.i, %and180.i.i
  %arrayidx182.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or181.i.i, ptr %arrayidx182.i.i, align 8
  %109 = load i64, ptr %q.i, align 8
  %and.i4 = and i64 %109, 1229782938247303441
  %arrayidx48.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %110 = load i64, ptr %arrayidx48.i, align 8
  %and49.i = and i64 %110, 2459565876494606882
  %or50.i = or disjoint i64 %and.i4, %and49.i
  %arrayidx51.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %111 = load i64, ptr %arrayidx51.i, align 8
  %and52.i = and i64 %111, 4919131752989213764
  %or53.i = or disjoint i64 %or50.i, %and52.i
  %arrayidx54.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %112 = load i64, ptr %arrayidx54.i, align 8
  %and55.i = and i64 %112, -8608480567731124088
  %or56.i = or disjoint i64 %or53.i, %and55.i
  %arrayidx58.i = getelementptr inbounds nuw i64, ptr %skey, i32 %j.2.i16
  store i64 %or56.i, ptr %arrayidx58.i, align 8
  %arrayidx59.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %113 = load i64, ptr %arrayidx59.i, align 8
  %and60.i = and i64 %113, 1229782938247303441
  %arrayidx61.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %114 = load i64, ptr %arrayidx61.i, align 8
  %and62.i = and i64 %114, 2459565876494606882
  %or63.i = or disjoint i64 %and60.i, %and62.i
  %arrayidx64.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %115 = load i64, ptr %arrayidx64.i, align 8
  %and65.i = and i64 %115, 4919131752989213764
  %or66.i = or disjoint i64 %or63.i, %and65.i
  %arrayidx67.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %116 = load i64, ptr %arrayidx67.i, align 8
  %and68.i = and i64 %116, -8608480567731124088
  %or69.i = or disjoint i64 %or66.i, %and68.i
  %add70.i = or disjoint i32 %j.2.i16, 1
  %arrayidx71.i = getelementptr inbounds nuw i64, ptr %skey, i32 %add70.i
  store i64 %or69.i, ptr %arrayidx71.i, align 8
  %add73.i = add nuw nsw i32 %i.1.i15, 4
  %add74.i = add nuw nsw i32 %j.2.i16, 2
  %cmp28.i = icmp samesign ult i32 %add73.i, 44
  br i1 %cmp28.i, label %for.body30.i, label %br_aes_ct64_keysched.exit, !llvm.loop !31

br_aes_ct64_keysched.exit:                        ; preds = %for.body30.i
  call void @llvm.lifetime.end.p0(i64 240, ptr nonnull %skey.i)
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %q.i)
  %117 = load ptr, ptr %r, align 4
  br label %for.body.i

for.body.i:                                       ; preds = %br_aes_ct64_keysched.exit, %for.body.i
  %v.0.i18 = phi i32 [ 0, %br_aes_ct64_keysched.exit ], [ %add21.i, %for.body.i ]
  %u.0.i17 = phi i32 [ 0, %br_aes_ct64_keysched.exit ], [ %inc.i, %for.body.i ]
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %skey, i32 %u.0.i17
  %118 = load i64, ptr %arrayidx.i, align 8
  %and.i = and i64 %118, 1229782938247303441
  %and1.i = lshr i64 %118, 1
  %shr.i = and i64 %and1.i, 1229782938247303441
  %and2.i = lshr i64 %118, 2
  %shr4.i = and i64 %and2.i, 1229782938247303441
  %and3.i = lshr i64 %118, 3
  %shr5.i = and i64 %and3.i, 1229782938247303441
  %sub.i = mul nuw i64 %and.i, 15
  %arrayidx8.i = getelementptr inbounds nuw i64, ptr %117, i32 %v.0.i18
  store i64 %sub.i, ptr %arrayidx8.i, align 8
  %sub10.i = mul nuw i64 %shr.i, 15
  %add11.i = or disjoint i32 %v.0.i18, 1
  %arrayidx12.i = getelementptr inbounds nuw i64, ptr %117, i32 %add11.i
  store i64 %sub10.i, ptr %arrayidx12.i, align 8
  %sub14.i = mul nuw i64 %shr4.i, 15
  %add15.i = or disjoint i32 %v.0.i18, 2
  %arrayidx16.i = getelementptr inbounds nuw i64, ptr %117, i32 %add15.i
  store i64 %sub14.i, ptr %arrayidx16.i, align 8
  %sub18.i = mul nuw i64 %shr5.i, 15
  %add19.i = or disjoint i32 %v.0.i18, 3
  %arrayidx20.i = getelementptr inbounds nuw i64, ptr %117, i32 %add19.i
  store i64 %sub18.i, ptr %arrayidx20.i, align 8
  %inc.i = add nuw nsw i32 %u.0.i17, 1
  %add21.i = add nuw nsw i32 %v.0.i18, 4
  %exitcond.i.not = icmp eq i32 %inc.i, 22
  br i1 %exitcond.i.not, label %br_aes_ct64_skey_expand.exit, label %for.body.i, !llvm.loop !32

br_aes_ct64_skey_expand.exit:                     ; preds = %for.body.i
  ret void
}

; Function Attrs: inlinehint nounwind
define dso_local void @aes128_ctr_keyexp(ptr noundef %r, ptr noundef %key) local_unnamed_addr #1 {
entry:
  %q.i.i = alloca [8 x i64], align 8
  %skey.i1 = alloca [60 x i32], align 4
  %q.i = alloca [8 x i64], align 8
  %skey.i = alloca [22 x i64], align 8
  call void @llvm.lifetime.start.p0(i64 176, ptr nonnull %skey.i)
  %call.i = call dereferenceable_or_null(704) ptr @malloc(i32 noundef 704) #7
  store ptr %call.i, ptr %r, align 4
  %cmp.i = icmp eq ptr %call.i, null
  br i1 %cmp.i, label %if.then.i, label %aes128_ecb_keyexp.exit

if.then.i:                                        ; preds = %entry
  call void @exit(i32 noundef 111) #8
  br label %aes128_ecb_keyexp.exit

aes128_ecb_keyexp.exit:                           ; preds = %entry, %if.then.i
  call void @llvm.lifetime.start.p0(i64 240, ptr nonnull %skey.i1)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %q.i)
  br label %while.body.i.i

while.body.i.i:                                   ; preds = %aes128_ecb_keyexp.exit, %while.body.i.i
  %v.addr.0.i.i12 = phi ptr [ %skey.i1, %aes128_ecb_keyexp.exit ], [ %incdec.ptr.i.i, %while.body.i.i ]
  %num.addr.0.i.i11 = phi i32 [ 4, %aes128_ecb_keyexp.exit ], [ %dec.i.i, %while.body.i.i ]
  %src.addr.0.i.i10 = phi ptr [ %key, %aes128_ecb_keyexp.exit ], [ %add.ptr.i.i, %while.body.i.i ]
  %dec.i.i = add nsw i32 %num.addr.0.i.i11, -1
  %0 = load i8, ptr %src.addr.0.i.i10, align 1
  %conv.i6.i = zext i8 %0 to i32
  %arrayidx1.i.i = getelementptr inbounds nuw i8, ptr %src.addr.0.i.i10, i32 1
  %1 = load i8, ptr %arrayidx1.i.i, align 1
  %conv2.i.i = zext i8 %1 to i32
  %shl.i.i = shl nuw nsw i32 %conv2.i.i, 8
  %or.i.i = or disjoint i32 %shl.i.i, %conv.i6.i
  %arrayidx3.i.i = getelementptr inbounds nuw i8, ptr %src.addr.0.i.i10, i32 2
  %2 = load i8, ptr %arrayidx3.i.i, align 1
  %conv4.i.i = zext i8 %2 to i32
  %shl5.i.i = shl nuw nsw i32 %conv4.i.i, 16
  %or6.i.i = or disjoint i32 %or.i.i, %shl5.i.i
  %arrayidx7.i.i = getelementptr inbounds nuw i8, ptr %src.addr.0.i.i10, i32 3
  %3 = load i8, ptr %arrayidx7.i.i, align 1
  %conv8.i.i = zext i8 %3 to i32
  %shl9.i.i = shl nuw i32 %conv8.i.i, 24
  %or10.i.i = or disjoint i32 %or6.i.i, %shl9.i.i
  %incdec.ptr.i.i = getelementptr inbounds nuw i8, ptr %v.addr.0.i.i12, i32 4
  store i32 %or10.i.i, ptr %v.addr.0.i.i12, align 4
  %add.ptr.i.i = getelementptr inbounds nuw i8, ptr %src.addr.0.i.i10, i32 4
  %cmp.not.i.i = icmp eq i32 %dec.i.i, 0
  br i1 %cmp.not.i.i, label %br_range_dec32le.exit.i, label %while.body.i.i, !llvm.loop !33

br_range_dec32le.exit.i:                          ; preds = %while.body.i.i
  %arrayidx.i2 = getelementptr inbounds nuw i8, ptr %skey.i1, i32 12
  %4 = load i32, ptr %arrayidx.i2, align 4
  br label %for.body.i6

for.cond27.i.preheader:                           ; preds = %if.end16.i
  br label %for.body30.i

for.body.i6:                                      ; preds = %br_range_dec32le.exit.i, %if.end16.i
  %tmp.0.i16 = phi i32 [ %4, %br_range_dec32le.exit.i ], [ %xor19.i, %if.end16.i ]
  %k.0.i15 = phi i32 [ 0, %br_range_dec32le.exit.i ], [ %spec.select1.i, %if.end16.i ]
  %j.0.i14 = phi i32 [ 0, %br_range_dec32le.exit.i ], [ %spec.select.i, %if.end16.i ]
  %i.0.i13 = phi i32 [ 4, %br_range_dec32le.exit.i ], [ %inc26.i, %if.end16.i ]
  %cmp6.i = icmp eq i32 %j.0.i14, 0
  br i1 %cmp6.i, label %if.then.i9, label %if.end16.i

if.then.i9:                                       ; preds = %for.body.i6
  %5 = call i32 @llvm.fshl.i32(i32 %tmp.0.i16, i32 %tmp.0.i16, i32 24)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %q.i.i)
  %call.i.i = call ptr @memset(ptr noundef nonnull %q.i.i, i32 noundef 0, i32 noundef 64) #8
  %conv.i.i = zext i32 %5 to i64
  store i64 %conv.i.i, ptr %q.i.i, align 8
  %arrayidx1.i155.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  %6 = load i64, ptr %arrayidx1.i155.i, align 8
  %and.i156.i = and i64 %conv.i.i, 1431655765
  %and2.i157.i = shl i64 %6, 1
  %shl.i158.i = and i64 %and2.i157.i, -6148914691236517206
  %or.i159.i = or disjoint i64 %and.i156.i, %shl.i158.i
  store i64 %or.i159.i, ptr %q.i.i, align 8
  %and4.i160.i = lshr i64 %conv.i.i, 1
  %shr.i161.i = and i64 %and4.i160.i, 1431655765
  %and5.i162.i = and i64 %6, -6148914691236517206
  %or6.i163.i = or disjoint i64 %shr.i161.i, %and5.i162.i
  %arrayidx7.i164.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  store i64 %or6.i163.i, ptr %arrayidx7.i164.i, align 8
  %arrayidx11.i165.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  %7 = load i64, ptr %arrayidx11.i165.i, align 8
  %arrayidx12.i166.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  %8 = load i64, ptr %arrayidx12.i166.i, align 8
  %and13.i167.i = and i64 %7, 6148914691236517205
  %and14.i168.i = shl i64 %8, 1
  %shl15.i169.i = and i64 %and14.i168.i, -6148914691236517206
  %or16.i170.i = or disjoint i64 %and13.i167.i, %shl15.i169.i
  %arrayidx17.i171.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  store i64 %or16.i170.i, ptr %arrayidx17.i171.i, align 8
  %and18.i172.i = lshr i64 %7, 1
  %shr19.i173.i = and i64 %and18.i172.i, 6148914691236517205
  %and20.i174.i = and i64 %8, -6148914691236517206
  %or21.i175.i = or disjoint i64 %shr19.i173.i, %and20.i174.i
  %arrayidx22.i176.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  store i64 %or21.i175.i, ptr %arrayidx22.i176.i, align 8
  %arrayidx27.i177.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  %9 = load i64, ptr %arrayidx27.i177.i, align 8
  %arrayidx28.i178.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  %10 = load i64, ptr %arrayidx28.i178.i, align 8
  %and29.i179.i = and i64 %9, 6148914691236517205
  %and30.i180.i = shl i64 %10, 1
  %shl31.i181.i = and i64 %and30.i180.i, -6148914691236517206
  %or32.i182.i = or disjoint i64 %and29.i179.i, %shl31.i181.i
  %arrayidx33.i183.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  store i64 %or32.i182.i, ptr %arrayidx33.i183.i, align 8
  %and34.i184.i = lshr i64 %9, 1
  %shr35.i185.i = and i64 %and34.i184.i, 6148914691236517205
  %and36.i186.i = and i64 %10, -6148914691236517206
  %or37.i187.i = or disjoint i64 %shr35.i185.i, %and36.i186.i
  %arrayidx38.i188.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  store i64 %or37.i187.i, ptr %arrayidx38.i188.i, align 8
  %arrayidx43.i189.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  %11 = load i64, ptr %arrayidx43.i189.i, align 8
  %arrayidx44.i190.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  %12 = load i64, ptr %arrayidx44.i190.i, align 8
  %and45.i191.i = and i64 %11, 6148914691236517205
  %and46.i192.i = shl i64 %12, 1
  %shl47.i193.i = and i64 %and46.i192.i, -6148914691236517206
  %or48.i194.i = or disjoint i64 %and45.i191.i, %shl47.i193.i
  %arrayidx49.i195.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  store i64 %or48.i194.i, ptr %arrayidx49.i195.i, align 8
  %and50.i196.i = lshr i64 %11, 1
  %shr51.i197.i = and i64 %and50.i196.i, 6148914691236517205
  %and52.i198.i = and i64 %12, -6148914691236517206
  %or53.i199.i = or disjoint i64 %shr51.i197.i, %and52.i198.i
  %arrayidx54.i200.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  store i64 %or53.i199.i, ptr %arrayidx54.i200.i, align 8
  %13 = load i64, ptr %q.i.i, align 8
  %arrayidx60.i201.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  %14 = load i64, ptr %arrayidx60.i201.i, align 8
  %and61.i202.i = and i64 %13, 3689348814741910323
  %and62.i203.i = shl i64 %14, 2
  %shl63.i204.i = and i64 %and62.i203.i, -3689348814741910324
  %or64.i205.i = or disjoint i64 %and61.i202.i, %shl63.i204.i
  store i64 %or64.i205.i, ptr %q.i.i, align 8
  %and66.i206.i = lshr i64 %13, 2
  %shr67.i207.i = and i64 %and66.i206.i, 3689348814741910323
  %and68.i208.i = and i64 %14, -3689348814741910324
  %or69.i209.i = or disjoint i64 %shr67.i207.i, %and68.i208.i
  %arrayidx70.i210.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  store i64 %or69.i209.i, ptr %arrayidx70.i210.i, align 8
  %arrayidx75.i211.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  %15 = load i64, ptr %arrayidx75.i211.i, align 8
  %arrayidx76.i212.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  %16 = load i64, ptr %arrayidx76.i212.i, align 8
  %and77.i213.i = and i64 %15, 3689348814741910323
  %and78.i214.i = shl i64 %16, 2
  %shl79.i215.i = and i64 %and78.i214.i, -3689348814741910324
  %or80.i216.i = or disjoint i64 %and77.i213.i, %shl79.i215.i
  %arrayidx81.i217.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  store i64 %or80.i216.i, ptr %arrayidx81.i217.i, align 8
  %and82.i218.i = lshr i64 %15, 2
  %shr83.i219.i = and i64 %and82.i218.i, 3689348814741910323
  %and84.i220.i = and i64 %16, -3689348814741910324
  %or85.i221.i = or disjoint i64 %shr83.i219.i, %and84.i220.i
  %arrayidx86.i222.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  store i64 %or85.i221.i, ptr %arrayidx86.i222.i, align 8
  %arrayidx91.i223.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  %17 = load i64, ptr %arrayidx91.i223.i, align 8
  %arrayidx92.i224.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  %18 = load i64, ptr %arrayidx92.i224.i, align 8
  %and93.i225.i = and i64 %17, 3689348814741910323
  %and94.i226.i = shl i64 %18, 2
  %shl95.i227.i = and i64 %and94.i226.i, -3689348814741910324
  %or96.i228.i = or disjoint i64 %and93.i225.i, %shl95.i227.i
  %arrayidx97.i229.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  store i64 %or96.i228.i, ptr %arrayidx97.i229.i, align 8
  %and98.i230.i = lshr i64 %17, 2
  %shr99.i231.i = and i64 %and98.i230.i, 3689348814741910323
  %and100.i232.i = and i64 %18, -3689348814741910324
  %or101.i233.i = or disjoint i64 %shr99.i231.i, %and100.i232.i
  %arrayidx102.i234.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  store i64 %or101.i233.i, ptr %arrayidx102.i234.i, align 8
  %arrayidx107.i235.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  %19 = load i64, ptr %arrayidx107.i235.i, align 8
  %arrayidx108.i236.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  %20 = load i64, ptr %arrayidx108.i236.i, align 8
  %and109.i237.i = and i64 %19, 3689348814741910323
  %and110.i238.i = shl i64 %20, 2
  %shl111.i239.i = and i64 %and110.i238.i, -3689348814741910324
  %or112.i240.i = or disjoint i64 %and109.i237.i, %shl111.i239.i
  %arrayidx113.i241.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  store i64 %or112.i240.i, ptr %arrayidx113.i241.i, align 8
  %and114.i242.i = lshr i64 %19, 2
  %shr115.i243.i = and i64 %and114.i242.i, 3689348814741910323
  %and116.i244.i = and i64 %20, -3689348814741910324
  %or117.i245.i = or disjoint i64 %shr115.i243.i, %and116.i244.i
  %arrayidx118.i246.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  store i64 %or117.i245.i, ptr %arrayidx118.i246.i, align 8
  %21 = load i64, ptr %q.i.i, align 8
  %arrayidx124.i247.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  %22 = load i64, ptr %arrayidx124.i247.i, align 8
  %and125.i248.i = and i64 %21, 1085102592571150095
  %and126.i249.i = shl i64 %22, 4
  %shl127.i250.i = and i64 %and126.i249.i, -1085102592571150096
  %or128.i251.i = or disjoint i64 %and125.i248.i, %shl127.i250.i
  store i64 %or128.i251.i, ptr %q.i.i, align 8
  %and130.i252.i = lshr i64 %21, 4
  %shr131.i253.i = and i64 %and130.i252.i, 1085102592571150095
  %and132.i254.i = and i64 %22, -1085102592571150096
  %or133.i255.i = or disjoint i64 %shr131.i253.i, %and132.i254.i
  %arrayidx134.i256.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  store i64 %or133.i255.i, ptr %arrayidx134.i256.i, align 8
  %arrayidx139.i257.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  %23 = load i64, ptr %arrayidx139.i257.i, align 8
  %arrayidx140.i258.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  %24 = load i64, ptr %arrayidx140.i258.i, align 8
  %and141.i259.i = and i64 %23, 1085102592571150095
  %and142.i260.i = shl i64 %24, 4
  %shl143.i261.i = and i64 %and142.i260.i, -1085102592571150096
  %or144.i262.i = or disjoint i64 %and141.i259.i, %shl143.i261.i
  %arrayidx145.i263.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  store i64 %or144.i262.i, ptr %arrayidx145.i263.i, align 8
  %and146.i264.i = lshr i64 %23, 4
  %shr147.i265.i = and i64 %and146.i264.i, 1085102592571150095
  %and148.i266.i = and i64 %24, -1085102592571150096
  %or149.i267.i = or disjoint i64 %shr147.i265.i, %and148.i266.i
  %arrayidx150.i268.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  store i64 %or149.i267.i, ptr %arrayidx150.i268.i, align 8
  %arrayidx155.i269.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  %25 = load i64, ptr %arrayidx155.i269.i, align 8
  %arrayidx156.i270.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  %26 = load i64, ptr %arrayidx156.i270.i, align 8
  %and157.i271.i = and i64 %25, 1085102592571150095
  %and158.i272.i = shl i64 %26, 4
  %shl159.i273.i = and i64 %and158.i272.i, -1085102592571150096
  %or160.i274.i = or disjoint i64 %and157.i271.i, %shl159.i273.i
  %arrayidx161.i275.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  store i64 %or160.i274.i, ptr %arrayidx161.i275.i, align 8
  %and162.i276.i = lshr i64 %25, 4
  %shr163.i277.i = and i64 %and162.i276.i, 1085102592571150095
  %and164.i278.i = and i64 %26, -1085102592571150096
  %or165.i279.i = or disjoint i64 %shr163.i277.i, %and164.i278.i
  %arrayidx166.i280.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  store i64 %or165.i279.i, ptr %arrayidx166.i280.i, align 8
  %arrayidx171.i281.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  %27 = load i64, ptr %arrayidx171.i281.i, align 8
  %arrayidx172.i282.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  %28 = load i64, ptr %arrayidx172.i282.i, align 8
  %and173.i283.i = and i64 %27, 1085102592571150095
  %and174.i284.i = shl i64 %28, 4
  %shl175.i285.i = and i64 %and174.i284.i, -1085102592571150096
  %or176.i286.i = or disjoint i64 %and173.i283.i, %shl175.i285.i
  %arrayidx177.i287.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  store i64 %or176.i286.i, ptr %arrayidx177.i287.i, align 8
  %and178.i288.i = lshr i64 %27, 4
  %shr179.i289.i = and i64 %and178.i288.i, 1085102592571150095
  %and180.i290.i = and i64 %28, -1085102592571150096
  %or181.i291.i = or disjoint i64 %shr179.i289.i, %and180.i290.i
  %arrayidx182.i292.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  store i64 %or181.i291.i, ptr %arrayidx182.i292.i, align 8
  %arrayidx1.i21.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  %29 = load i64, ptr %arrayidx1.i21.i, align 8
  %arrayidx2.i22.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  %30 = load i64, ptr %arrayidx2.i22.i, align 8
  %arrayidx3.i23.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  %31 = load i64, ptr %arrayidx3.i23.i, align 8
  %arrayidx4.i24.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  %32 = load i64, ptr %arrayidx4.i24.i, align 8
  %arrayidx5.i25.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  %33 = load i64, ptr %arrayidx5.i25.i, align 8
  %arrayidx6.i26.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  %34 = load i64, ptr %arrayidx6.i26.i, align 8
  %35 = load i64, ptr %q.i.i, align 8
  %xor.i27.i = xor i64 %31, %33
  %xor8.i28.i = xor i64 %or181.i291.i, %34
  %xor9.i29.i = xor i64 %or181.i291.i, %31
  %xor10.i30.i = xor i64 %or181.i291.i, %33
  %xor11.i31.i = xor i64 %29, %30
  %xor12.i32.i = xor i64 %xor11.i31.i, %35
  %xor13.i33.i = xor i64 %xor12.i32.i, %31
  %xor14.i34.i = xor i64 %xor8.i28.i, %xor.i27.i
  %xor15.i35.i = xor i64 %xor12.i32.i, %or181.i291.i
  %xor16.i36.i = xor i64 %xor12.i32.i, %34
  %xor17.i37.i = xor i64 %xor16.i36.i, %xor10.i30.i
  %xor18.i38.i = xor i64 %32, %xor14.i34.i
  %xor19.i39.i = xor i64 %xor18.i38.i, %33
  %xor20.i40.i = xor i64 %xor18.i38.i, %29
  %xor21.i41.i = xor i64 %xor19.i39.i, %35
  %xor22.i42.i = xor i64 %xor19.i39.i, %xor11.i31.i
  %xor23.i43.i = xor i64 %xor20.i40.i, %xor9.i29.i
  %xor24.i44.i = xor i64 %35, %xor23.i43.i
  %xor25.i45.i = xor i64 %xor22.i42.i, %xor23.i43.i
  %xor27.i46.i = xor i64 %xor11.i31.i, %xor23.i43.i
  %and.i47.i = and i64 %xor14.i34.i, %xor19.i39.i
  %and30.i48.i = and i64 %xor17.i37.i, %xor21.i41.i
  %xor31.i49.i = xor i64 %and30.i48.i, %and.i47.i
  %and32.i50.i = and i64 %xor13.i33.i, %35
  %and34.i51.i = and i64 %xor8.i28.i, %xor27.i46.i
  %and35.i52.i = and i64 %xor16.i36.i, %xor12.i32.i
  %and37.i53.i = and i64 %xor15.i35.i, %xor24.i44.i
  %and39.i54.i = and i64 %xor9.i29.i, %xor23.i43.i
  %and40.i55.i = and i64 %xor.i27.i, %xor25.i45.i
  %xor41.i56.i = xor i64 %and40.i55.i, %and39.i54.i
  %and42.i57.i = and i64 %xor10.i30.i, %xor22.i42.i
  %xor43.i58.i = xor i64 %and42.i57.i, %and39.i54.i
  %xor44.i59.i = xor i64 %xor31.i49.i, %xor41.i56.i
  %xor48.i60.i = xor i64 %xor44.i59.i, %xor20.i40.i
  %36 = xor i64 %xor10.i30.i, %and32.i50.i
  %37 = xor i64 %36, %xor22.i42.i
  %38 = xor i64 %37, %and.i47.i
  %xor49.i61.i = xor i64 %38, %xor43.i58.i
  %39 = xor i64 %xor27.i46.i, %and35.i52.i
  %40 = xor i64 %39, %xor8.i28.i
  %41 = xor i64 %40, %and34.i51.i
  %xor50.i62.i = xor i64 %41, %xor41.i56.i
  %42 = xor i64 %xor27.i46.i, %and37.i53.i
  %43 = xor i64 %42, %or181.i291.i
  %44 = xor i64 %43, %and34.i51.i
  %xor51.i63.i = xor i64 %44, %xor43.i58.i
  %xor52.i64.i = xor i64 %xor48.i60.i, %xor49.i61.i
  %and53.i65.i = and i64 %xor48.i60.i, %xor50.i62.i
  %xor54.i66.i = xor i64 %xor51.i63.i, %and53.i65.i
  %and55.i67.i = and i64 %xor52.i64.i, %xor54.i66.i
  %xor56.i68.i = xor i64 %and55.i67.i, %xor49.i61.i
  %xor57.i69.i = xor i64 %xor50.i62.i, %xor51.i63.i
  %xor58.i70.i = xor i64 %xor49.i61.i, %and53.i65.i
  %and59.i71.i = and i64 %xor58.i70.i, %xor57.i69.i
  %xor60.i72.i = xor i64 %and59.i71.i, %xor51.i63.i
  %xor61.i73.i = xor i64 %xor50.i62.i, %xor60.i72.i
  %xor62.i74.i = xor i64 %and59.i71.i, %and53.i65.i
  %and63.i75.i = and i64 %xor51.i63.i, %xor62.i74.i
  %xor64.i76.i = xor i64 %and63.i75.i, %xor61.i73.i
  %xor65.i77.i = xor i64 %xor54.i66.i, %and63.i75.i
  %and66.i78.i = and i64 %xor56.i68.i, %xor65.i77.i
  %xor67.i79.i = xor i64 %xor52.i64.i, %and66.i78.i
  %xor68.i80.i = xor i64 %xor67.i79.i, %xor64.i76.i
  %xor69.i81.i = xor i64 %xor56.i68.i, %xor60.i72.i
  %xor70.i82.i = xor i64 %xor56.i68.i, %xor67.i79.i
  %xor71.i83.i = xor i64 %and63.i75.i, %xor50.i62.i
  %xor72.i84.i = xor i64 %xor69.i81.i, %xor68.i80.i
  %and73.i85.i = and i64 %xor71.i83.i, %xor19.i39.i
  %and74.i86.i = and i64 %xor64.i76.i, %xor21.i41.i
  %and75.i87.i = and i64 %xor60.i72.i, %35
  %and76.i88.i = and i64 %xor70.i82.i, %xor27.i46.i
  %and77.i89.i = and i64 %xor67.i79.i, %xor12.i32.i
  %and78.i90.i = and i64 %xor56.i68.i, %xor24.i44.i
  %and79.i91.i = and i64 %xor69.i81.i, %xor23.i43.i
  %and80.i92.i = and i64 %xor72.i84.i, %xor25.i45.i
  %and81.i93.i = and i64 %xor68.i80.i, %xor22.i42.i
  %and82.i94.i = and i64 %xor71.i83.i, %xor14.i34.i
  %and83.i95.i = and i64 %xor64.i76.i, %xor17.i37.i
  %and84.i96.i = and i64 %xor60.i72.i, %xor13.i33.i
  %and85.i97.i = and i64 %xor70.i82.i, %xor8.i28.i
  %and86.i98.i = and i64 %xor67.i79.i, %xor16.i36.i
  %and87.i99.i = and i64 %xor56.i68.i, %xor15.i35.i
  %and88.i100.i = and i64 %xor69.i81.i, %xor9.i29.i
  %and89.i101.i = and i64 %xor72.i84.i, %xor.i27.i
  %and90.i102.i = and i64 %xor68.i80.i, %xor10.i30.i
  %xor91.i103.i = xor i64 %and88.i100.i, %and89.i101.i
  %xor92.i104.i = xor i64 %and83.i95.i, %and84.i96.i
  %xor93.i105.i = xor i64 %and78.i90.i, %and86.i98.i
  %xor94.i106.i = xor i64 %and82.i94.i, %and83.i95.i
  %xor95.i107.i = xor i64 %and75.i87.i, %and85.i97.i
  %xor96.i108.i = xor i64 %and75.i87.i, %and78.i90.i
  %xor97.i109.i = xor i64 %and80.i92.i, %and81.i93.i
  %xor98.i110.i = xor i64 %and73.i85.i, %and76.i88.i
  %xor99.i111.i = xor i64 %and79.i91.i, %and80.i92.i
  %xor100.i112.i = xor i64 %and89.i101.i, %and90.i102.i
  %xor101.i113.i = xor i64 %and85.i97.i, %xor93.i105.i
  %xor102.i114.i = xor i64 %xor95.i107.i, %xor98.i110.i
  %xor103.i115.i = xor i64 %and77.i89.i, %xor91.i103.i
  %xor104.i116.i = xor i64 %and76.i88.i, %xor99.i111.i
  %xor105.i117.i = xor i64 %xor91.i103.i, %xor102.i114.i
  %xor106.i118.i = xor i64 %and87.i99.i, %xor102.i114.i
  %xor107.i119.i = xor i64 %xor97.i109.i, %xor103.i115.i
  %xor108.i120.i = xor i64 %xor94.i106.i, %xor103.i115.i
  %xor109.i121.i = xor i64 %and77.i89.i, %xor104.i116.i
  %xor110.i122.i = xor i64 %xor106.i118.i, %xor107.i119.i
  %xor111.i123.i = xor i64 %and74.i86.i, %xor108.i120.i
  %xor112.i124.i = xor i64 %xor104.i116.i, %xor108.i120.i
  %45 = xor i64 %xor107.i119.i, %xor101.i113.i
  %xor113.i125.i = xor i64 %45, -1
  %46 = xor i64 %xor105.i117.i, %xor93.i105.i
  %xor115.i126.i = xor i64 %46, -1
  %xor117.i127.i = xor i64 %xor98.i110.i, %xor111.i123.i
  %xor118.i128.i = xor i64 %xor96.i108.i, %xor111.i123.i
  %xor119.i129.i = xor i64 %xor92.i104.i, %xor110.i122.i
  %47 = xor i64 %xor117.i127.i, %xor109.i121.i
  %xor121.i130.i = xor i64 %47, -1
  %48 = xor i64 %xor110.i122.i, %xor100.i112.i
  %49 = xor i64 %48, %xor109.i121.i
  %xor123.i131.i = xor i64 %49, -1
  %arrayidx124.i132.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  store i64 %xor112.i124.i, ptr %arrayidx124.i132.i, align 8
  %arrayidx125.i133.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  store i64 %xor121.i130.i, ptr %arrayidx125.i133.i, align 8
  %arrayidx126.i134.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  store i64 %xor123.i131.i, ptr %arrayidx126.i134.i, align 8
  %arrayidx127.i135.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  store i64 %xor117.i127.i, ptr %arrayidx127.i135.i, align 8
  %arrayidx128.i136.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  store i64 %xor118.i128.i, ptr %arrayidx128.i136.i, align 8
  %arrayidx129.i137.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  store i64 %xor119.i129.i, ptr %arrayidx129.i137.i, align 8
  %arrayidx130.i138.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  store i64 %xor113.i125.i, ptr %arrayidx130.i138.i, align 8
  %and.i570.i = and i64 %xor115.i126.i, 6148914691236517205
  %and2.i571.i = shl i64 %xor113.i125.i, 1
  %shl.i572.i = and i64 %and2.i571.i, -6148914691236517206
  %or.i573.i = or disjoint i64 %and.i570.i, %shl.i572.i
  store i64 %or.i573.i, ptr %q.i.i, align 8
  %and4.i574.i = lshr i64 %xor115.i126.i, 1
  %shr.i575.i = and i64 %and4.i574.i, 6148914691236517205
  %and5.i576.i = and i64 %xor113.i125.i, -6148914691236517206
  %or6.i577.i = or disjoint i64 %shr.i575.i, %and5.i576.i
  %arrayidx7.i578.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  store i64 %or6.i577.i, ptr %arrayidx7.i578.i, align 8
  %arrayidx11.i579.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  %50 = load i64, ptr %arrayidx11.i579.i, align 8
  %arrayidx12.i580.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  %51 = load i64, ptr %arrayidx12.i580.i, align 8
  %and13.i581.i = and i64 %50, 6148914691236517205
  %and14.i582.i = shl i64 %51, 1
  %shl15.i583.i = and i64 %and14.i582.i, -6148914691236517206
  %or16.i584.i = or disjoint i64 %and13.i581.i, %shl15.i583.i
  %arrayidx17.i585.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  store i64 %or16.i584.i, ptr %arrayidx17.i585.i, align 8
  %and18.i586.i = lshr i64 %50, 1
  %shr19.i587.i = and i64 %and18.i586.i, 6148914691236517205
  %and20.i588.i = and i64 %51, -6148914691236517206
  %or21.i589.i = or disjoint i64 %shr19.i587.i, %and20.i588.i
  %arrayidx22.i590.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  store i64 %or21.i589.i, ptr %arrayidx22.i590.i, align 8
  %arrayidx27.i591.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  %52 = load i64, ptr %arrayidx27.i591.i, align 8
  %arrayidx28.i592.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  %53 = load i64, ptr %arrayidx28.i592.i, align 8
  %and29.i593.i = and i64 %52, 6148914691236517205
  %and30.i594.i = shl i64 %53, 1
  %shl31.i595.i = and i64 %and30.i594.i, -6148914691236517206
  %or32.i596.i = or disjoint i64 %and29.i593.i, %shl31.i595.i
  %arrayidx33.i597.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  store i64 %or32.i596.i, ptr %arrayidx33.i597.i, align 8
  %and34.i598.i = lshr i64 %52, 1
  %shr35.i599.i = and i64 %and34.i598.i, 6148914691236517205
  %and36.i600.i = and i64 %53, -6148914691236517206
  %or37.i601.i = or disjoint i64 %shr35.i599.i, %and36.i600.i
  %arrayidx38.i602.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  store i64 %or37.i601.i, ptr %arrayidx38.i602.i, align 8
  %arrayidx43.i603.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  %54 = load i64, ptr %arrayidx43.i603.i, align 8
  %arrayidx44.i604.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  %55 = load i64, ptr %arrayidx44.i604.i, align 8
  %and45.i605.i = and i64 %54, 6148914691236517205
  %and46.i606.i = shl i64 %55, 1
  %shl47.i607.i = and i64 %and46.i606.i, -6148914691236517206
  %or48.i608.i = or disjoint i64 %and45.i605.i, %shl47.i607.i
  %arrayidx49.i609.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  store i64 %or48.i608.i, ptr %arrayidx49.i609.i, align 8
  %and50.i610.i = lshr i64 %54, 1
  %shr51.i611.i = and i64 %and50.i610.i, 6148914691236517205
  %and52.i612.i = and i64 %55, -6148914691236517206
  %or53.i613.i = or disjoint i64 %shr51.i611.i, %and52.i612.i
  %arrayidx54.i614.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  store i64 %or53.i613.i, ptr %arrayidx54.i614.i, align 8
  %56 = load i64, ptr %q.i.i, align 8
  %arrayidx60.i615.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  %57 = load i64, ptr %arrayidx60.i615.i, align 8
  %and61.i616.i = and i64 %56, 3689348814741910323
  %and62.i617.i = shl i64 %57, 2
  %shl63.i618.i = and i64 %and62.i617.i, -3689348814741910324
  %or64.i619.i = or disjoint i64 %and61.i616.i, %shl63.i618.i
  store i64 %or64.i619.i, ptr %q.i.i, align 8
  %and66.i620.i = lshr i64 %56, 2
  %shr67.i621.i = and i64 %and66.i620.i, 3689348814741910323
  %and68.i622.i = and i64 %57, -3689348814741910324
  %or69.i623.i = or disjoint i64 %shr67.i621.i, %and68.i622.i
  %arrayidx70.i624.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  store i64 %or69.i623.i, ptr %arrayidx70.i624.i, align 8
  %arrayidx75.i625.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  %58 = load i64, ptr %arrayidx75.i625.i, align 8
  %arrayidx76.i626.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  %59 = load i64, ptr %arrayidx76.i626.i, align 8
  %and77.i627.i = and i64 %58, 3689348814741910323
  %and78.i628.i = shl i64 %59, 2
  %shl79.i629.i = and i64 %and78.i628.i, -3689348814741910324
  %or80.i630.i = or disjoint i64 %and77.i627.i, %shl79.i629.i
  %arrayidx81.i631.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  store i64 %or80.i630.i, ptr %arrayidx81.i631.i, align 8
  %and82.i632.i = lshr i64 %58, 2
  %shr83.i633.i = and i64 %and82.i632.i, 3689348814741910323
  %and84.i634.i = and i64 %59, -3689348814741910324
  %or85.i635.i = or disjoint i64 %shr83.i633.i, %and84.i634.i
  %arrayidx86.i636.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  store i64 %or85.i635.i, ptr %arrayidx86.i636.i, align 8
  %arrayidx91.i637.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  %60 = load i64, ptr %arrayidx91.i637.i, align 8
  %arrayidx92.i638.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  %61 = load i64, ptr %arrayidx92.i638.i, align 8
  %and93.i639.i = and i64 %60, 3689348814741910323
  %and94.i640.i = shl i64 %61, 2
  %shl95.i641.i = and i64 %and94.i640.i, -3689348814741910324
  %or96.i642.i = or disjoint i64 %and93.i639.i, %shl95.i641.i
  %arrayidx97.i643.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  store i64 %or96.i642.i, ptr %arrayidx97.i643.i, align 8
  %and98.i644.i = lshr i64 %60, 2
  %shr99.i645.i = and i64 %and98.i644.i, 3689348814741910323
  %and100.i646.i = and i64 %61, -3689348814741910324
  %or101.i647.i = or disjoint i64 %shr99.i645.i, %and100.i646.i
  %arrayidx102.i648.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  store i64 %or101.i647.i, ptr %arrayidx102.i648.i, align 8
  %arrayidx107.i649.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  %62 = load i64, ptr %arrayidx107.i649.i, align 8
  %arrayidx108.i650.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  %63 = load i64, ptr %arrayidx108.i650.i, align 8
  %and109.i651.i = and i64 %62, 3689348814741910323
  %and110.i652.i = shl i64 %63, 2
  %shl111.i653.i = and i64 %and110.i652.i, -3689348814741910324
  %or112.i654.i = or disjoint i64 %and109.i651.i, %shl111.i653.i
  %arrayidx113.i655.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  store i64 %or112.i654.i, ptr %arrayidx113.i655.i, align 8
  %and114.i656.i = lshr i64 %62, 2
  %shr115.i657.i = and i64 %and114.i656.i, 3689348814741910323
  %and116.i658.i = and i64 %63, -3689348814741910324
  %or117.i659.i = or disjoint i64 %shr115.i657.i, %and116.i658.i
  %arrayidx118.i660.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  store i64 %or117.i659.i, ptr %arrayidx118.i660.i, align 8
  %64 = load i64, ptr %q.i.i, align 8
  %arrayidx124.i661.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  %65 = load i64, ptr %arrayidx124.i661.i, align 8
  %and125.i662.i = and i64 %64, 1085102592571150095
  %and126.i663.i = shl i64 %65, 4
  %shl127.i664.i = and i64 %and126.i663.i, -1085102592571150096
  %or128.i665.i = or disjoint i64 %and125.i662.i, %shl127.i664.i
  store i64 %or128.i665.i, ptr %q.i.i, align 8
  %and130.i666.i = lshr i64 %64, 4
  %shr131.i667.i = and i64 %and130.i666.i, 1085102592571150095
  %and132.i668.i = and i64 %65, -1085102592571150096
  %or133.i669.i = or disjoint i64 %shr131.i667.i, %and132.i668.i
  %arrayidx134.i670.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  store i64 %or133.i669.i, ptr %arrayidx134.i670.i, align 8
  %arrayidx139.i671.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  %66 = load i64, ptr %arrayidx139.i671.i, align 8
  %arrayidx140.i672.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  %67 = load i64, ptr %arrayidx140.i672.i, align 8
  %and141.i673.i = and i64 %66, 1085102592571150095
  %and142.i674.i = shl i64 %67, 4
  %shl143.i675.i = and i64 %and142.i674.i, -1085102592571150096
  %or144.i676.i = or disjoint i64 %and141.i673.i, %shl143.i675.i
  %arrayidx145.i677.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  store i64 %or144.i676.i, ptr %arrayidx145.i677.i, align 8
  %and146.i678.i = lshr i64 %66, 4
  %shr147.i679.i = and i64 %and146.i678.i, 1085102592571150095
  %and148.i680.i = and i64 %67, -1085102592571150096
  %or149.i681.i = or disjoint i64 %shr147.i679.i, %and148.i680.i
  %arrayidx150.i682.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  store i64 %or149.i681.i, ptr %arrayidx150.i682.i, align 8
  %arrayidx155.i683.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  %68 = load i64, ptr %arrayidx155.i683.i, align 8
  %arrayidx156.i684.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  %69 = load i64, ptr %arrayidx156.i684.i, align 8
  %and157.i685.i = and i64 %68, 1085102592571150095
  %and158.i686.i = shl i64 %69, 4
  %shl159.i687.i = and i64 %and158.i686.i, -1085102592571150096
  %or160.i688.i = or disjoint i64 %and157.i685.i, %shl159.i687.i
  %arrayidx161.i689.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  store i64 %or160.i688.i, ptr %arrayidx161.i689.i, align 8
  %and162.i690.i = lshr i64 %68, 4
  %shr163.i691.i = and i64 %and162.i690.i, 1085102592571150095
  %and164.i692.i = and i64 %69, -1085102592571150096
  %or165.i693.i = or disjoint i64 %shr163.i691.i, %and164.i692.i
  %arrayidx166.i694.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  store i64 %or165.i693.i, ptr %arrayidx166.i694.i, align 8
  %arrayidx171.i695.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  %70 = load i64, ptr %arrayidx171.i695.i, align 8
  %arrayidx172.i696.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  %71 = load i64, ptr %arrayidx172.i696.i, align 8
  %and173.i697.i = and i64 %70, 1085102592571150095
  %and174.i698.i = shl i64 %71, 4
  %shl175.i699.i = and i64 %and174.i698.i, -1085102592571150096
  %or176.i700.i = or disjoint i64 %and173.i697.i, %shl175.i699.i
  %arrayidx177.i701.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  store i64 %or176.i700.i, ptr %arrayidx177.i701.i, align 8
  %and178.i702.i = lshr i64 %70, 4
  %shr179.i703.i = and i64 %and178.i702.i, 1085102592571150095
  %and180.i704.i = and i64 %71, -1085102592571150096
  %or181.i705.i = or disjoint i64 %shr179.i703.i, %and180.i704.i
  %arrayidx182.i706.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  store i64 %or181.i705.i, ptr %arrayidx182.i706.i, align 8
  %72 = load i64, ptr %q.i.i, align 8
  %conv5.i.i = trunc i64 %72 to i32
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %q.i.i)
  %arrayidx9.i = getelementptr inbounds nuw [10 x i8], ptr @Rcon, i32 0, i32 %k.0.i15
  %73 = load i8, ptr %arrayidx9.i, align 1
  %conv.i = zext i8 %73 to i32
  %xor.i = xor i32 %conv5.i.i, %conv.i
  br label %if.end16.i

if.end16.i:                                       ; preds = %for.body.i6, %if.then.i9
  %tmp.2.i = phi i32 [ %xor.i, %if.then.i9 ], [ %tmp.0.i16, %for.body.i6 ]
  %sub17.i = add nsw i32 %i.0.i13, -4
  %arrayidx18.i = getelementptr inbounds nuw [60 x i32], ptr %skey.i1, i32 0, i32 %sub17.i
  %74 = load i32, ptr %arrayidx18.i, align 4
  %xor19.i = xor i32 %tmp.2.i, %74
  %arrayidx20.i7 = getelementptr inbounds nuw [60 x i32], ptr %skey.i1, i32 0, i32 %i.0.i13
  store i32 %xor19.i, ptr %arrayidx20.i7, align 4
  %inc.i8 = add i32 %j.0.i14, 1
  %cmp21.i = icmp eq i32 %inc.i8, 4
  %spec.select.i = select i1 %cmp21.i, i32 0, i32 %inc.i8
  %inc24.i = zext i1 %cmp21.i to i32
  %spec.select1.i = add i32 %k.0.i15, %inc24.i
  %inc26.i = add nuw nsw i32 %i.0.i13, 1
  %exitcond.i4.not = icmp eq i32 %inc26.i, 44
  br i1 %exitcond.i4.not, label %for.cond27.i.preheader, label %for.body.i6, !llvm.loop !34

for.body30.i:                                     ; preds = %for.cond27.i.preheader, %for.body30.i
  %j.2.i18 = phi i32 [ 0, %for.cond27.i.preheader ], [ %add74.i, %for.body30.i ]
  %i.1.i17 = phi i32 [ 0, %for.cond27.i.preheader ], [ %add73.i, %for.body30.i ]
  %arrayidx32.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %add.ptr.i = getelementptr inbounds nuw i32, ptr %skey.i1, i32 %i.1.i17
  %75 = load i32, ptr %add.ptr.i, align 4
  %conv.i7.i = zext i32 %75 to i64
  %arrayidx1.i8.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 4
  %76 = load i32, ptr %arrayidx1.i8.i, align 4
  %conv2.i9.i = zext i32 %76 to i64
  %arrayidx3.i10.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 8
  %77 = load i32, ptr %arrayidx3.i10.i, align 4
  %conv4.i11.i = zext i32 %77 to i64
  %arrayidx5.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 12
  %78 = load i32, ptr %arrayidx5.i.i, align 4
  %conv6.i.i = zext i32 %78 to i64
  %shl.i12.i = shl nuw nsw i64 %conv.i7.i, 16
  %or.i13.i = or i64 %shl.i12.i, %conv.i7.i
  %shl7.i.i = shl nuw nsw i64 %conv2.i9.i, 16
  %or8.i.i = or i64 %shl7.i.i, %conv2.i9.i
  %shl9.i14.i = shl nuw nsw i64 %conv4.i11.i, 16
  %or10.i15.i = or i64 %shl9.i14.i, %conv4.i11.i
  %shl11.i.i = shl nuw nsw i64 %conv6.i.i, 16
  %or12.i.i = or i64 %shl11.i.i, %conv6.i.i
  %and.i.i = and i64 %or.i13.i, 281470681808895
  %and13.i.i = and i64 %or8.i.i, 281470681808895
  %and14.i.i = and i64 %or10.i15.i, 281470681808895
  %and15.i.i = and i64 %or12.i.i, 281470681808895
  %shl16.i.i = shl nuw nsw i64 %and.i.i, 8
  %or17.i.i = or i64 %and.i.i, %shl16.i.i
  %shl18.i.i = shl nuw nsw i64 %and13.i.i, 8
  %or19.i.i = or i64 %and13.i.i, %shl18.i.i
  %and24.i.i = and i64 %or17.i.i, 71777214294589695
  %and25.i.i = and i64 %or19.i.i, 71777214294589695
  %79 = shl nuw i64 %and14.i.i, 16
  %80 = shl nuw nsw i64 %and14.i.i, 8
  %and26.i.i = or i64 %79, %80
  %shl28.i.i = and i64 %and26.i.i, -71777214294589696
  %or29.i.i = or disjoint i64 %and24.i.i, %shl28.i.i
  store i64 %or29.i.i, ptr %q.i, align 8
  %81 = shl nuw i64 %and15.i.i, 16
  %82 = shl nuw nsw i64 %and15.i.i, 8
  %and27.i.i = or i64 %81, %82
  %shl30.i.i = and i64 %and27.i.i, -71777214294589696
  %or31.i.i = or disjoint i64 %and25.i.i, %shl30.i.i
  store i64 %or31.i.i, ptr %arrayidx32.i, align 8
  %83 = load i64, ptr %q.i, align 8
  %arrayidx35.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %83, ptr %arrayidx35.i, align 8
  %arrayidx37.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %83, ptr %arrayidx37.i, align 8
  %arrayidx39.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %83, ptr %arrayidx39.i, align 8
  %arrayidx40.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %84 = load i64, ptr %arrayidx40.i, align 8
  %arrayidx41.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %84, ptr %arrayidx41.i, align 8
  %arrayidx43.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %84, ptr %arrayidx43.i, align 8
  %arrayidx45.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %84, ptr %arrayidx45.i, align 8
  %85 = load i64, ptr %q.i, align 8
  %arrayidx1.i139.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %86 = load i64, ptr %arrayidx1.i139.i, align 8
  %and.i140.i = and i64 %85, 6148914691236517205
  %and2.i.i = shl i64 %86, 1
  %shl.i141.i = and i64 %and2.i.i, -6148914691236517206
  %or.i142.i = or disjoint i64 %and.i140.i, %shl.i141.i
  store i64 %or.i142.i, ptr %q.i, align 8
  %and4.i.i = lshr i64 %85, 1
  %shr.i.i = and i64 %and4.i.i, 6148914691236517205
  %and5.i.i = and i64 %86, -6148914691236517206
  %or6.i143.i = or disjoint i64 %shr.i.i, %and5.i.i
  %arrayidx7.i144.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or6.i143.i, ptr %arrayidx7.i144.i, align 8
  %arrayidx11.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %87 = load i64, ptr %arrayidx11.i.i, align 8
  %arrayidx12.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %88 = load i64, ptr %arrayidx12.i.i, align 8
  %and13.i145.i = and i64 %87, 6148914691236517205
  %and14.i146.i = shl i64 %88, 1
  %shl15.i.i = and i64 %and14.i146.i, -6148914691236517206
  %or16.i.i = or disjoint i64 %and13.i145.i, %shl15.i.i
  %arrayidx17.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or16.i.i, ptr %arrayidx17.i.i, align 8
  %and18.i.i = lshr i64 %87, 1
  %shr19.i.i = and i64 %and18.i.i, 6148914691236517205
  %and20.i.i = and i64 %88, -6148914691236517206
  %or21.i.i = or disjoint i64 %shr19.i.i, %and20.i.i
  %arrayidx22.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or21.i.i, ptr %arrayidx22.i.i, align 8
  %arrayidx27.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %89 = load i64, ptr %arrayidx27.i.i, align 8
  %arrayidx28.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %90 = load i64, ptr %arrayidx28.i.i, align 8
  %and29.i.i = and i64 %89, 6148914691236517205
  %and30.i147.i = shl i64 %90, 1
  %shl31.i.i = and i64 %and30.i147.i, -6148914691236517206
  %or32.i.i = or disjoint i64 %and29.i.i, %shl31.i.i
  %arrayidx33.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or32.i.i, ptr %arrayidx33.i.i, align 8
  %and34.i148.i = lshr i64 %89, 1
  %shr35.i.i = and i64 %and34.i148.i, 6148914691236517205
  %and36.i.i = and i64 %90, -6148914691236517206
  %or37.i.i = or disjoint i64 %shr35.i.i, %and36.i.i
  %arrayidx38.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or37.i.i, ptr %arrayidx38.i.i, align 8
  %arrayidx43.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %91 = load i64, ptr %arrayidx43.i.i, align 8
  %arrayidx44.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %92 = load i64, ptr %arrayidx44.i.i, align 8
  %and45.i.i = and i64 %91, 6148914691236517205
  %and46.i.i = shl i64 %92, 1
  %shl47.i.i = and i64 %and46.i.i, -6148914691236517206
  %or48.i.i = or disjoint i64 %and45.i.i, %shl47.i.i
  %arrayidx49.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or48.i.i, ptr %arrayidx49.i.i, align 8
  %and50.i.i = lshr i64 %91, 1
  %shr51.i.i = and i64 %and50.i.i, 6148914691236517205
  %and52.i.i = and i64 %92, -6148914691236517206
  %or53.i.i = or disjoint i64 %shr51.i.i, %and52.i.i
  %arrayidx54.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or53.i.i, ptr %arrayidx54.i.i, align 8
  %93 = load i64, ptr %q.i, align 8
  %arrayidx60.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %94 = load i64, ptr %arrayidx60.i.i, align 8
  %and61.i.i = and i64 %93, 3689348814741910323
  %and62.i.i = shl i64 %94, 2
  %shl63.i.i = and i64 %and62.i.i, -3689348814741910324
  %or64.i.i = or disjoint i64 %and61.i.i, %shl63.i.i
  store i64 %or64.i.i, ptr %q.i, align 8
  %and66.i149.i = lshr i64 %93, 2
  %shr67.i.i = and i64 %and66.i149.i, 3689348814741910323
  %and68.i.i = and i64 %94, -3689348814741910324
  %or69.i.i = or disjoint i64 %shr67.i.i, %and68.i.i
  %arrayidx70.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or69.i.i, ptr %arrayidx70.i.i, align 8
  %arrayidx75.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %95 = load i64, ptr %arrayidx75.i.i, align 8
  %arrayidx76.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %96 = load i64, ptr %arrayidx76.i.i, align 8
  %and77.i150.i = and i64 %95, 3689348814741910323
  %and78.i151.i = shl i64 %96, 2
  %shl79.i.i = and i64 %and78.i151.i, -3689348814741910324
  %or80.i.i = or disjoint i64 %and77.i150.i, %shl79.i.i
  %arrayidx81.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or80.i.i, ptr %arrayidx81.i.i, align 8
  %and82.i152.i = lshr i64 %95, 2
  %shr83.i.i = and i64 %and82.i152.i, 3689348814741910323
  %and84.i153.i = and i64 %96, -3689348814741910324
  %or85.i.i = or disjoint i64 %shr83.i.i, %and84.i153.i
  %arrayidx86.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or85.i.i, ptr %arrayidx86.i.i, align 8
  %arrayidx91.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %97 = load i64, ptr %arrayidx91.i.i, align 8
  %arrayidx92.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %98 = load i64, ptr %arrayidx92.i.i, align 8
  %and93.i.i = and i64 %97, 3689348814741910323
  %and94.i.i = shl i64 %98, 2
  %shl95.i.i = and i64 %and94.i.i, -3689348814741910324
  %or96.i.i = or disjoint i64 %and93.i.i, %shl95.i.i
  %arrayidx97.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or96.i.i, ptr %arrayidx97.i.i, align 8
  %and98.i.i = lshr i64 %97, 2
  %shr99.i.i = and i64 %and98.i.i, 3689348814741910323
  %and100.i.i = and i64 %98, -3689348814741910324
  %or101.i.i = or disjoint i64 %shr99.i.i, %and100.i.i
  %arrayidx102.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or101.i.i, ptr %arrayidx102.i.i, align 8
  %arrayidx107.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %99 = load i64, ptr %arrayidx107.i.i, align 8
  %arrayidx108.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %100 = load i64, ptr %arrayidx108.i.i, align 8
  %and109.i.i = and i64 %99, 3689348814741910323
  %and110.i.i = shl i64 %100, 2
  %shl111.i.i = and i64 %and110.i.i, -3689348814741910324
  %or112.i.i = or disjoint i64 %and109.i.i, %shl111.i.i
  %arrayidx113.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or112.i.i, ptr %arrayidx113.i.i, align 8
  %and114.i.i = lshr i64 %99, 2
  %shr115.i.i = and i64 %and114.i.i, 3689348814741910323
  %and116.i.i = and i64 %100, -3689348814741910324
  %or117.i.i = or disjoint i64 %shr115.i.i, %and116.i.i
  %arrayidx118.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or117.i.i, ptr %arrayidx118.i.i, align 8
  %101 = load i64, ptr %q.i, align 8
  %arrayidx124.i154.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %102 = load i64, ptr %arrayidx124.i154.i, align 8
  %and125.i.i = and i64 %101, 1085102592571150095
  %and126.i.i = shl i64 %102, 4
  %shl127.i.i = and i64 %and126.i.i, -1085102592571150096
  %or128.i.i = or disjoint i64 %and125.i.i, %shl127.i.i
  store i64 %or128.i.i, ptr %q.i, align 8
  %and130.i.i = lshr i64 %101, 4
  %shr131.i.i = and i64 %and130.i.i, 1085102592571150095
  %and132.i.i = and i64 %102, -1085102592571150096
  %or133.i.i = or disjoint i64 %shr131.i.i, %and132.i.i
  %arrayidx134.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or133.i.i, ptr %arrayidx134.i.i, align 8
  %arrayidx139.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %103 = load i64, ptr %arrayidx139.i.i, align 8
  %arrayidx140.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %104 = load i64, ptr %arrayidx140.i.i, align 8
  %and141.i.i = and i64 %103, 1085102592571150095
  %and142.i.i = shl i64 %104, 4
  %shl143.i.i = and i64 %and142.i.i, -1085102592571150096
  %or144.i.i = or disjoint i64 %and141.i.i, %shl143.i.i
  %arrayidx145.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or144.i.i, ptr %arrayidx145.i.i, align 8
  %and146.i.i = lshr i64 %103, 4
  %shr147.i.i = and i64 %and146.i.i, 1085102592571150095
  %and148.i.i = and i64 %104, -1085102592571150096
  %or149.i.i = or disjoint i64 %shr147.i.i, %and148.i.i
  %arrayidx150.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or149.i.i, ptr %arrayidx150.i.i, align 8
  %arrayidx155.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %105 = load i64, ptr %arrayidx155.i.i, align 8
  %arrayidx156.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %106 = load i64, ptr %arrayidx156.i.i, align 8
  %and157.i.i = and i64 %105, 1085102592571150095
  %and158.i.i = shl i64 %106, 4
  %shl159.i.i = and i64 %and158.i.i, -1085102592571150096
  %or160.i.i = or disjoint i64 %and157.i.i, %shl159.i.i
  %arrayidx161.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or160.i.i, ptr %arrayidx161.i.i, align 8
  %and162.i.i = lshr i64 %105, 4
  %shr163.i.i = and i64 %and162.i.i, 1085102592571150095
  %and164.i.i = and i64 %106, -1085102592571150096
  %or165.i.i = or disjoint i64 %shr163.i.i, %and164.i.i
  %arrayidx166.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or165.i.i, ptr %arrayidx166.i.i, align 8
  %arrayidx171.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %107 = load i64, ptr %arrayidx171.i.i, align 8
  %arrayidx172.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %108 = load i64, ptr %arrayidx172.i.i, align 8
  %and173.i.i = and i64 %107, 1085102592571150095
  %and174.i.i = shl i64 %108, 4
  %shl175.i.i = and i64 %and174.i.i, -1085102592571150096
  %or176.i.i = or disjoint i64 %and173.i.i, %shl175.i.i
  %arrayidx177.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or176.i.i, ptr %arrayidx177.i.i, align 8
  %and178.i.i = lshr i64 %107, 4
  %shr179.i.i = and i64 %and178.i.i, 1085102592571150095
  %and180.i.i = and i64 %108, -1085102592571150096
  %or181.i.i = or disjoint i64 %shr179.i.i, %and180.i.i
  %arrayidx182.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or181.i.i, ptr %arrayidx182.i.i, align 8
  %109 = load i64, ptr %q.i, align 8
  %and.i5 = and i64 %109, 1229782938247303441
  %arrayidx48.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %110 = load i64, ptr %arrayidx48.i, align 8
  %and49.i = and i64 %110, 2459565876494606882
  %or50.i = or disjoint i64 %and.i5, %and49.i
  %arrayidx51.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %111 = load i64, ptr %arrayidx51.i, align 8
  %and52.i = and i64 %111, 4919131752989213764
  %or53.i = or disjoint i64 %or50.i, %and52.i
  %arrayidx54.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %112 = load i64, ptr %arrayidx54.i, align 8
  %and55.i = and i64 %112, -8608480567731124088
  %or56.i = or disjoint i64 %or53.i, %and55.i
  %arrayidx58.i = getelementptr inbounds nuw i64, ptr %skey.i, i32 %j.2.i18
  store i64 %or56.i, ptr %arrayidx58.i, align 8
  %arrayidx59.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %113 = load i64, ptr %arrayidx59.i, align 8
  %and60.i = and i64 %113, 1229782938247303441
  %arrayidx61.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %114 = load i64, ptr %arrayidx61.i, align 8
  %and62.i = and i64 %114, 2459565876494606882
  %or63.i = or disjoint i64 %and60.i, %and62.i
  %arrayidx64.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %115 = load i64, ptr %arrayidx64.i, align 8
  %and65.i = and i64 %115, 4919131752989213764
  %or66.i = or disjoint i64 %or63.i, %and65.i
  %arrayidx67.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %116 = load i64, ptr %arrayidx67.i, align 8
  %and68.i = and i64 %116, -8608480567731124088
  %or69.i = or disjoint i64 %or66.i, %and68.i
  %add70.i = or disjoint i32 %j.2.i18, 1
  %arrayidx71.i = getelementptr inbounds nuw i64, ptr %skey.i, i32 %add70.i
  store i64 %or69.i, ptr %arrayidx71.i, align 8
  %add73.i = add nuw nsw i32 %i.1.i17, 4
  %add74.i = add nuw nsw i32 %j.2.i18, 2
  %cmp28.i = icmp samesign ult i32 %add73.i, 44
  br i1 %cmp28.i, label %for.body30.i, label %br_aes_ct64_keysched.exit, !llvm.loop !35

br_aes_ct64_keysched.exit:                        ; preds = %for.body30.i
  call void @llvm.lifetime.end.p0(i64 240, ptr nonnull %skey.i1)
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %q.i)
  %117 = load ptr, ptr %r, align 4
  br label %for.body.i

for.body.i:                                       ; preds = %br_aes_ct64_keysched.exit, %for.body.i
  %v.0.i20 = phi i32 [ 0, %br_aes_ct64_keysched.exit ], [ %add21.i, %for.body.i ]
  %u.0.i19 = phi i32 [ 0, %br_aes_ct64_keysched.exit ], [ %inc.i, %for.body.i ]
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %skey.i, i32 %u.0.i19
  %118 = load i64, ptr %arrayidx.i, align 8
  %and.i = and i64 %118, 1229782938247303441
  %and1.i = lshr i64 %118, 1
  %shr.i = and i64 %and1.i, 1229782938247303441
  %and2.i = lshr i64 %118, 2
  %shr4.i = and i64 %and2.i, 1229782938247303441
  %and3.i = lshr i64 %118, 3
  %shr5.i = and i64 %and3.i, 1229782938247303441
  %sub.i = mul nuw i64 %and.i, 15
  %arrayidx8.i = getelementptr inbounds nuw i64, ptr %117, i32 %v.0.i20
  store i64 %sub.i, ptr %arrayidx8.i, align 8
  %sub10.i = mul nuw i64 %shr.i, 15
  %add11.i = or disjoint i32 %v.0.i20, 1
  %arrayidx12.i = getelementptr inbounds nuw i64, ptr %117, i32 %add11.i
  store i64 %sub10.i, ptr %arrayidx12.i, align 8
  %sub14.i = mul nuw i64 %shr4.i, 15
  %add15.i = or disjoint i32 %v.0.i20, 2
  %arrayidx16.i = getelementptr inbounds nuw i64, ptr %117, i32 %add15.i
  store i64 %sub14.i, ptr %arrayidx16.i, align 8
  %sub18.i = mul nuw i64 %shr5.i, 15
  %add19.i = or disjoint i32 %v.0.i20, 3
  %arrayidx20.i = getelementptr inbounds nuw i64, ptr %117, i32 %add19.i
  store i64 %sub18.i, ptr %arrayidx20.i, align 8
  %inc.i = add nuw nsw i32 %u.0.i19, 1
  %add21.i = add nuw nsw i32 %v.0.i20, 4
  %exitcond.i.not = icmp eq i32 %inc.i, 22
  br i1 %exitcond.i.not, label %br_aes_ct64_skey_expand.exit, label %for.body.i, !llvm.loop !36

br_aes_ct64_skey_expand.exit:                     ; preds = %for.body.i
  call void @llvm.lifetime.end.p0(i64 176, ptr nonnull %skey.i)
  ret void
}

; Function Attrs: inlinehint nounwind
define dso_local void @aes128_ctr(ptr noundef %out, i32 noundef %outlen, ptr noundef %iv, ptr noundef %ctx) local_unnamed_addr #1 {
entry:
  %w.i36 = alloca [16 x i32], align 4
  %q.i37 = alloca [8 x i64], align 8
  %w.i = alloca [16 x i32], align 4
  %q.i = alloca [8 x i64], align 8
  %ivw.i = alloca [16 x i32], align 4
  %tmp.i = alloca [64 x i8], align 1
  %0 = load ptr, ptr %ctx, align 4
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %ivw.i)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %tmp.i)
  br label %while.body.i.i

while.body.i.i:                                   ; preds = %entry, %while.body.i.i
  %v.addr.0.i.i816 = phi ptr [ %ivw.i, %entry ], [ %incdec.ptr.i.i, %while.body.i.i ]
  %num.addr.0.i.i815 = phi i32 [ 3, %entry ], [ %dec.i.i, %while.body.i.i ]
  %src.addr.0.i.i814 = phi ptr [ %iv, %entry ], [ %add.ptr.i.i, %while.body.i.i ]
  %dec.i.i = add nsw i32 %num.addr.0.i.i815, -1
  %1 = load i8, ptr %src.addr.0.i.i814, align 1
  %conv.i.i = zext i8 %1 to i32
  %arrayidx1.i.i = getelementptr inbounds nuw i8, ptr %src.addr.0.i.i814, i32 1
  %2 = load i8, ptr %arrayidx1.i.i, align 1
  %conv2.i.i = zext i8 %2 to i32
  %shl.i.i = shl nuw nsw i32 %conv2.i.i, 8
  %or.i.i = or disjoint i32 %shl.i.i, %conv.i.i
  %arrayidx3.i.i = getelementptr inbounds nuw i8, ptr %src.addr.0.i.i814, i32 2
  %3 = load i8, ptr %arrayidx3.i.i, align 1
  %conv4.i.i = zext i8 %3 to i32
  %shl5.i.i = shl nuw nsw i32 %conv4.i.i, 16
  %or6.i.i = or disjoint i32 %or.i.i, %shl5.i.i
  %arrayidx7.i.i = getelementptr inbounds nuw i8, ptr %src.addr.0.i.i814, i32 3
  %4 = load i8, ptr %arrayidx7.i.i, align 1
  %conv8.i.i = zext i8 %4 to i32
  %shl9.i.i = shl nuw i32 %conv8.i.i, 24
  %or10.i.i = or disjoint i32 %or6.i.i, %shl9.i.i
  %incdec.ptr.i.i = getelementptr inbounds nuw i8, ptr %v.addr.0.i.i816, i32 4
  store i32 %or10.i.i, ptr %v.addr.0.i.i816, align 4
  %add.ptr.i.i = getelementptr inbounds nuw i8, ptr %src.addr.0.i.i814, i32 4
  %cmp.not.i.i = icmp eq i32 %dec.i.i, 0
  br i1 %cmp.not.i.i, label %br_range_dec32le.exit.i, label %while.body.i.i, !llvm.loop !37

br_range_dec32le.exit.i:                          ; preds = %while.body.i.i
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %ivw.i, i32 16
  %call.i = call ptr @memcpy(ptr noundef nonnull %add.ptr.i, ptr noundef nonnull %ivw.i, i32 noundef 12) #8
  %add.ptr4.i = getelementptr inbounds nuw i8, ptr %ivw.i, i32 32
  %call6.i = call ptr @memcpy(ptr noundef nonnull %add.ptr4.i, ptr noundef nonnull %ivw.i, i32 noundef 12) #8
  %add.ptr8.i = getelementptr inbounds nuw i8, ptr %ivw.i, i32 48
  %call10.i = call ptr @memcpy(ptr noundef nonnull %add.ptr8.i, ptr noundef nonnull %ivw.i, i32 noundef 12) #8
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %ivw.i, i32 12
  store i32 0, ptr %arrayidx.i, align 4
  %arrayidx13.i = getelementptr inbounds nuw i8, ptr %ivw.i, i32 28
  store i32 16777216, ptr %arrayidx13.i, align 4
  %arrayidx16.i = getelementptr inbounds nuw i8, ptr %ivw.i, i32 44
  store i32 33554432, ptr %arrayidx16.i, align 4
  %arrayidx19.i = getelementptr inbounds nuw i8, ptr %ivw.i, i32 60
  store i32 50331648, ptr %arrayidx19.i, align 4
  %cmp.i825 = icmp ugt i32 %outlen, 64
  br i1 %cmp.i825, label %while.body.i.lr.ph, label %while.end.i

while.body.i.lr.ph:                               ; preds = %br_range_dec32le.exit.i
  br label %while.body.i

while.body.i:                                     ; preds = %while.body.i.lr.ph, %aes_ecb4x.exit
  %out.addr.0.i827 = phi ptr [ %out, %while.body.i.lr.ph ], [ %add.ptr21.i, %aes_ecb4x.exit ]
  %outlen.addr.0.i826 = phi i32 [ %outlen, %while.body.i.lr.ph ], [ %sub.i, %aes_ecb4x.exit ]
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %w.i)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %q.i)
  %call.i10 = call ptr @memcpy(ptr noundef nonnull %w.i, ptr noundef nonnull %ivw.i, i32 noundef 64) #8
  br label %for.body.i27

for.body.i27:                                     ; preds = %while.body.i, %for.body.i27
  %i.0.i12817 = phi i32 [ 0, %while.body.i ], [ %inc.i35, %for.body.i27 ]
  %arrayidx.i28 = getelementptr inbounds nuw [8 x i64], ptr %q.i, i32 0, i32 %i.0.i12817
  %add.i = or disjoint i32 %i.0.i12817, 4
  %arrayidx1.i = getelementptr inbounds nuw [8 x i64], ptr %q.i, i32 0, i32 %add.i
  %add.ptr.idx.i = shl nuw nsw i32 %i.0.i12817, 4
  %add.ptr.i29 = getelementptr inbounds nuw i8, ptr %w.i, i32 %add.ptr.idx.i
  %5 = load i32, ptr %add.ptr.i29, align 4
  %conv.i40.i = zext i32 %5 to i64
  %arrayidx1.i.i30 = getelementptr inbounds nuw i8, ptr %add.ptr.i29, i32 4
  %6 = load i32, ptr %arrayidx1.i.i30, align 4
  %conv2.i.i31 = zext i32 %6 to i64
  %arrayidx3.i.i32 = getelementptr inbounds nuw i8, ptr %add.ptr.i29, i32 8
  %7 = load i32, ptr %arrayidx3.i.i32, align 4
  %conv4.i41.i = zext i32 %7 to i64
  %arrayidx5.i42.i = getelementptr inbounds nuw i8, ptr %add.ptr.i29, i32 12
  %8 = load i32, ptr %arrayidx5.i42.i, align 4
  %conv6.i.i = zext i32 %8 to i64
  %shl.i43.i = shl nuw nsw i64 %conv.i40.i, 16
  %or.i44.i = or i64 %shl.i43.i, %conv.i40.i
  %shl7.i.i = shl nuw nsw i64 %conv2.i.i31, 16
  %or8.i.i = or i64 %shl7.i.i, %conv2.i.i31
  %shl9.i.i33 = shl nuw nsw i64 %conv4.i41.i, 16
  %or10.i.i34 = or i64 %shl9.i.i33, %conv4.i41.i
  %shl11.i.i = shl nuw nsw i64 %conv6.i.i, 16
  %or12.i45.i = or i64 %shl11.i.i, %conv6.i.i
  %and.i46.i = and i64 %or.i44.i, 281470681808895
  %and13.i47.i = and i64 %or8.i.i, 281470681808895
  %and14.i.i = and i64 %or10.i.i34, 281470681808895
  %and15.i.i = and i64 %or12.i45.i, 281470681808895
  %shl16.i.i = shl nuw nsw i64 %and.i46.i, 8
  %or17.i.i = or i64 %and.i46.i, %shl16.i.i
  %shl18.i.i = shl nuw nsw i64 %and13.i47.i, 8
  %or19.i.i = or i64 %and13.i47.i, %shl18.i.i
  %and24.i.i = and i64 %or17.i.i, 71777214294589695
  %and25.i.i = and i64 %or19.i.i, 71777214294589695
  %9 = shl nuw i64 %and14.i.i, 16
  %10 = shl nuw nsw i64 %and14.i.i, 8
  %and26.i.i = or i64 %9, %10
  %shl28.i.i = and i64 %and26.i.i, -71777214294589696
  %or29.i.i = or disjoint i64 %and24.i.i, %shl28.i.i
  store i64 %or29.i.i, ptr %arrayidx.i28, align 8
  %11 = shl nuw i64 %and15.i.i, 16
  %12 = shl nuw nsw i64 %and15.i.i, 8
  %and27.i.i = or i64 %11, %12
  %shl30.i.i = and i64 %and27.i.i, -71777214294589696
  %or31.i.i = or disjoint i64 %and25.i.i, %shl30.i.i
  store i64 %or31.i.i, ptr %arrayidx1.i, align 8
  %inc.i35 = add nuw nsw i32 %i.0.i12817, 1
  %exitcond.i.not = icmp eq i32 %inc.i35, 4
  br i1 %exitcond.i.not, label %for.end.i, label %for.body.i27, !llvm.loop !38

for.end.i:                                        ; preds = %for.body.i27
  %13 = load i64, ptr %q.i, align 8
  %arrayidx1.i241.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %14 = load i64, ptr %arrayidx1.i241.i, align 8
  %and.i242.i = and i64 %13, 6148914691236517205
  %and2.i243.i = shl i64 %14, 1
  %shl.i244.i = and i64 %and2.i243.i, -6148914691236517206
  %or.i245.i = or disjoint i64 %and.i242.i, %shl.i244.i
  store i64 %or.i245.i, ptr %q.i, align 8
  %and4.i246.i = lshr i64 %13, 1
  %shr.i247.i = and i64 %and4.i246.i, 6148914691236517205
  %and5.i.i = and i64 %14, -6148914691236517206
  %or6.i248.i = or disjoint i64 %shr.i247.i, %and5.i.i
  %arrayidx7.i249.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or6.i248.i, ptr %arrayidx7.i249.i, align 8
  %arrayidx11.i250.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %15 = load i64, ptr %arrayidx11.i250.i, align 8
  %arrayidx12.i251.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %16 = load i64, ptr %arrayidx12.i251.i, align 8
  %and13.i252.i = and i64 %15, 6148914691236517205
  %and14.i253.i = shl i64 %16, 1
  %shl15.i.i = and i64 %and14.i253.i, -6148914691236517206
  %or16.i.i = or disjoint i64 %and13.i252.i, %shl15.i.i
  %arrayidx17.i254.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or16.i.i, ptr %arrayidx17.i254.i, align 8
  %and18.i.i = lshr i64 %15, 1
  %shr19.i.i = and i64 %and18.i.i, 6148914691236517205
  %and20.i.i = and i64 %16, -6148914691236517206
  %or21.i.i = or disjoint i64 %shr19.i.i, %and20.i.i
  %arrayidx22.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or21.i.i, ptr %arrayidx22.i.i, align 8
  %arrayidx27.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %17 = load i64, ptr %arrayidx27.i.i, align 8
  %arrayidx28.i255.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %18 = load i64, ptr %arrayidx28.i255.i, align 8
  %and29.i.i = and i64 %17, 6148914691236517205
  %and30.i256.i = shl i64 %18, 1
  %shl31.i.i = and i64 %and30.i256.i, -6148914691236517206
  %or32.i257.i = or disjoint i64 %and29.i.i, %shl31.i.i
  %arrayidx33.i258.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or32.i257.i, ptr %arrayidx33.i258.i, align 8
  %and34.i259.i = lshr i64 %17, 1
  %shr35.i.i = and i64 %and34.i259.i, 6148914691236517205
  %and36.i.i = and i64 %18, -6148914691236517206
  %or37.i.i = or disjoint i64 %shr35.i.i, %and36.i.i
  %arrayidx38.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or37.i.i, ptr %arrayidx38.i.i, align 8
  %arrayidx43.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %19 = load i64, ptr %arrayidx43.i.i, align 8
  %arrayidx44.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %20 = load i64, ptr %arrayidx44.i.i, align 8
  %and45.i.i = and i64 %19, 6148914691236517205
  %and46.i.i = shl i64 %20, 1
  %shl47.i.i = and i64 %and46.i.i, -6148914691236517206
  %or48.i.i = or disjoint i64 %and45.i.i, %shl47.i.i
  %arrayidx49.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or48.i.i, ptr %arrayidx49.i.i, align 8
  %and50.i.i = lshr i64 %19, 1
  %shr51.i.i = and i64 %and50.i.i, 6148914691236517205
  %and52.i.i = and i64 %20, -6148914691236517206
  %or53.i.i = or disjoint i64 %shr51.i.i, %and52.i.i
  %arrayidx54.i260.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or53.i.i, ptr %arrayidx54.i260.i, align 8
  %21 = load i64, ptr %q.i, align 8
  %arrayidx60.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %22 = load i64, ptr %arrayidx60.i.i, align 8
  %and61.i.i = and i64 %21, 3689348814741910323
  %and62.i.i = shl i64 %22, 2
  %shl63.i.i = and i64 %and62.i.i, -3689348814741910324
  %or64.i.i = or disjoint i64 %and61.i.i, %shl63.i.i
  store i64 %or64.i.i, ptr %q.i, align 8
  %and66.i261.i = lshr i64 %21, 2
  %shr67.i.i = and i64 %and66.i261.i, 3689348814741910323
  %and68.i.i = and i64 %22, -3689348814741910324
  %or69.i.i = or disjoint i64 %shr67.i.i, %and68.i.i
  %arrayidx70.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or69.i.i, ptr %arrayidx70.i.i, align 8
  %arrayidx75.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %23 = load i64, ptr %arrayidx75.i.i, align 8
  %arrayidx76.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %24 = load i64, ptr %arrayidx76.i.i, align 8
  %and77.i262.i = and i64 %23, 3689348814741910323
  %and78.i263.i = shl i64 %24, 2
  %shl79.i.i = and i64 %and78.i263.i, -3689348814741910324
  %or80.i.i = or disjoint i64 %and77.i262.i, %shl79.i.i
  %arrayidx81.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or80.i.i, ptr %arrayidx81.i.i, align 8
  %and82.i264.i = lshr i64 %23, 2
  %shr83.i.i = and i64 %and82.i264.i, 3689348814741910323
  %and84.i265.i = and i64 %24, -3689348814741910324
  %or85.i.i = or disjoint i64 %shr83.i.i, %and84.i265.i
  %arrayidx86.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or85.i.i, ptr %arrayidx86.i.i, align 8
  %arrayidx91.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %25 = load i64, ptr %arrayidx91.i.i, align 8
  %arrayidx92.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %26 = load i64, ptr %arrayidx92.i.i, align 8
  %and93.i.i = and i64 %25, 3689348814741910323
  %and94.i.i = shl i64 %26, 2
  %shl95.i.i = and i64 %and94.i.i, -3689348814741910324
  %or96.i.i = or disjoint i64 %and93.i.i, %shl95.i.i
  %arrayidx97.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or96.i.i, ptr %arrayidx97.i.i, align 8
  %and98.i.i = lshr i64 %25, 2
  %shr99.i.i = and i64 %and98.i.i, 3689348814741910323
  %and100.i.i = and i64 %26, -3689348814741910324
  %or101.i.i = or disjoint i64 %shr99.i.i, %and100.i.i
  %arrayidx102.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or101.i.i, ptr %arrayidx102.i.i, align 8
  %arrayidx107.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %27 = load i64, ptr %arrayidx107.i.i, align 8
  %arrayidx108.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %28 = load i64, ptr %arrayidx108.i.i, align 8
  %and109.i.i = and i64 %27, 3689348814741910323
  %and110.i.i = shl i64 %28, 2
  %shl111.i.i = and i64 %and110.i.i, -3689348814741910324
  %or112.i.i = or disjoint i64 %and109.i.i, %shl111.i.i
  %arrayidx113.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or112.i.i, ptr %arrayidx113.i.i, align 8
  %and114.i.i = lshr i64 %27, 2
  %shr115.i.i = and i64 %and114.i.i, 3689348814741910323
  %and116.i.i = and i64 %28, -3689348814741910324
  %or117.i.i = or disjoint i64 %shr115.i.i, %and116.i.i
  %arrayidx118.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or117.i.i, ptr %arrayidx118.i.i, align 8
  %29 = load i64, ptr %q.i, align 8
  %arrayidx124.i266.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %30 = load i64, ptr %arrayidx124.i266.i, align 8
  %and125.i.i = and i64 %29, 1085102592571150095
  %and126.i.i = shl i64 %30, 4
  %shl127.i.i = and i64 %and126.i.i, -1085102592571150096
  %or128.i.i = or disjoint i64 %and125.i.i, %shl127.i.i
  store i64 %or128.i.i, ptr %q.i, align 8
  %and130.i.i = lshr i64 %29, 4
  %shr131.i.i = and i64 %and130.i.i, 1085102592571150095
  %and132.i.i = and i64 %30, -1085102592571150096
  %or133.i.i = or disjoint i64 %shr131.i.i, %and132.i.i
  %arrayidx134.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or133.i.i, ptr %arrayidx134.i.i, align 8
  %arrayidx139.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %31 = load i64, ptr %arrayidx139.i.i, align 8
  %arrayidx140.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %32 = load i64, ptr %arrayidx140.i.i, align 8
  %and141.i.i = and i64 %31, 1085102592571150095
  %and142.i.i = shl i64 %32, 4
  %shl143.i.i = and i64 %and142.i.i, -1085102592571150096
  %or144.i.i = or disjoint i64 %and141.i.i, %shl143.i.i
  %arrayidx145.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or144.i.i, ptr %arrayidx145.i.i, align 8
  %and146.i.i = lshr i64 %31, 4
  %shr147.i.i = and i64 %and146.i.i, 1085102592571150095
  %and148.i.i = and i64 %32, -1085102592571150096
  %or149.i.i = or disjoint i64 %shr147.i.i, %and148.i.i
  %arrayidx150.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or149.i.i, ptr %arrayidx150.i.i, align 8
  %arrayidx155.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %33 = load i64, ptr %arrayidx155.i.i, align 8
  %arrayidx156.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %34 = load i64, ptr %arrayidx156.i.i, align 8
  %and157.i.i = and i64 %33, 1085102592571150095
  %and158.i.i = shl i64 %34, 4
  %shl159.i.i = and i64 %and158.i.i, -1085102592571150096
  %or160.i.i = or disjoint i64 %and157.i.i, %shl159.i.i
  %arrayidx161.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or160.i.i, ptr %arrayidx161.i.i, align 8
  %and162.i.i = lshr i64 %33, 4
  %shr163.i.i = and i64 %and162.i.i, 1085102592571150095
  %and164.i.i = and i64 %34, -1085102592571150096
  %or165.i.i = or disjoint i64 %shr163.i.i, %and164.i.i
  %arrayidx166.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or165.i.i, ptr %arrayidx166.i.i, align 8
  %arrayidx171.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %35 = load i64, ptr %arrayidx171.i.i, align 8
  %arrayidx172.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %36 = load i64, ptr %arrayidx172.i.i, align 8
  %and173.i.i = and i64 %35, 1085102592571150095
  %and174.i.i = shl i64 %36, 4
  %shl175.i.i = and i64 %and174.i.i, -1085102592571150096
  %or176.i.i = or disjoint i64 %and173.i.i, %shl175.i.i
  %arrayidx177.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or176.i.i, ptr %arrayidx177.i.i, align 8
  %and178.i.i = lshr i64 %35, 4
  %shr179.i.i = and i64 %and178.i.i, 1085102592571150095
  %and180.i.i = and i64 %36, -1085102592571150096
  %or181.i267.i = or disjoint i64 %shr179.i.i, %and180.i.i
  %arrayidx182.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or181.i267.i, ptr %arrayidx182.i.i, align 8
  %37 = load i64, ptr %0, align 8
  %38 = load i64, ptr %q.i, align 8
  %xor.i.i = xor i64 %38, %37
  store i64 %xor.i.i, ptr %q.i, align 8
  %arrayidx2.i48.i = getelementptr inbounds nuw i8, ptr %0, i32 8
  %39 = load i64, ptr %arrayidx2.i48.i, align 8
  %arrayidx3.i49.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %40 = load i64, ptr %arrayidx3.i49.i, align 8
  %xor4.i.i = xor i64 %40, %39
  store i64 %xor4.i.i, ptr %arrayidx3.i49.i, align 8
  %arrayidx5.i50.i = getelementptr inbounds nuw i8, ptr %0, i32 16
  %41 = load i64, ptr %arrayidx5.i50.i, align 8
  %arrayidx6.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %42 = load i64, ptr %arrayidx6.i.i, align 8
  %xor7.i.i = xor i64 %42, %41
  store i64 %xor7.i.i, ptr %arrayidx6.i.i, align 8
  %arrayidx8.i51.i = getelementptr inbounds nuw i8, ptr %0, i32 24
  %43 = load i64, ptr %arrayidx8.i51.i, align 8
  %arrayidx9.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %44 = load i64, ptr %arrayidx9.i.i, align 8
  %xor10.i.i = xor i64 %44, %43
  store i64 %xor10.i.i, ptr %arrayidx9.i.i, align 8
  %arrayidx11.i.i = getelementptr inbounds nuw i8, ptr %0, i32 32
  %45 = load i64, ptr %arrayidx11.i.i, align 8
  %arrayidx12.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %46 = load i64, ptr %arrayidx12.i.i, align 8
  %xor13.i.i = xor i64 %46, %45
  store i64 %xor13.i.i, ptr %arrayidx12.i.i, align 8
  %arrayidx14.i.i = getelementptr inbounds nuw i8, ptr %0, i32 40
  %47 = load i64, ptr %arrayidx14.i.i, align 8
  %arrayidx15.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %48 = load i64, ptr %arrayidx15.i.i, align 8
  %xor16.i.i = xor i64 %48, %47
  store i64 %xor16.i.i, ptr %arrayidx15.i.i, align 8
  %arrayidx17.i.i = getelementptr inbounds nuw i8, ptr %0, i32 48
  %49 = load i64, ptr %arrayidx17.i.i, align 8
  %arrayidx18.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %50 = load i64, ptr %arrayidx18.i.i, align 8
  %xor19.i.i = xor i64 %50, %49
  store i64 %xor19.i.i, ptr %arrayidx18.i.i, align 8
  %arrayidx20.i.i = getelementptr inbounds nuw i8, ptr %0, i32 56
  %51 = load i64, ptr %arrayidx20.i.i, align 8
  %arrayidx21.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %52 = load i64, ptr %arrayidx21.i.i, align 8
  %xor22.i.i = xor i64 %52, %51
  store i64 %xor22.i.i, ptr %arrayidx21.i.i, align 8
  br label %for.body7.i

for.body7.i:                                      ; preds = %for.end.i, %shift_rows.exit28.i
  %i.1.i819 = phi i32 [ 1, %for.end.i ], [ %inc15.i, %shift_rows.exit28.i ]
  %arrayidx.i122.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %53 = load i64, ptr %arrayidx.i122.i, align 8
  %arrayidx1.i123.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %54 = load i64, ptr %arrayidx1.i123.i, align 8
  %arrayidx2.i124.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %55 = load i64, ptr %arrayidx2.i124.i, align 8
  %arrayidx3.i125.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %56 = load i64, ptr %arrayidx3.i125.i, align 8
  %arrayidx4.i126.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %57 = load i64, ptr %arrayidx4.i126.i, align 8
  %arrayidx5.i127.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %58 = load i64, ptr %arrayidx5.i127.i, align 8
  %arrayidx6.i128.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %59 = load i64, ptr %arrayidx6.i128.i, align 8
  %60 = load i64, ptr %q.i, align 8
  %xor.i129.i = xor i64 %56, %58
  %xor8.i130.i = xor i64 %53, %59
  %xor9.i131.i = xor i64 %53, %56
  %xor10.i132.i = xor i64 %53, %58
  %xor11.i133.i = xor i64 %54, %55
  %xor12.i134.i = xor i64 %xor11.i133.i, %60
  %xor13.i135.i = xor i64 %xor12.i134.i, %56
  %xor14.i136.i = xor i64 %xor8.i130.i, %xor.i129.i
  %xor15.i137.i = xor i64 %xor12.i134.i, %53
  %xor16.i138.i = xor i64 %xor12.i134.i, %59
  %xor17.i139.i = xor i64 %xor16.i138.i, %xor10.i132.i
  %xor18.i140.i = xor i64 %57, %xor14.i136.i
  %xor19.i141.i = xor i64 %xor18.i140.i, %58
  %xor20.i142.i = xor i64 %xor18.i140.i, %54
  %xor21.i143.i = xor i64 %xor19.i141.i, %60
  %xor22.i144.i = xor i64 %xor19.i141.i, %xor11.i133.i
  %xor23.i145.i = xor i64 %xor20.i142.i, %xor9.i131.i
  %xor24.i146.i = xor i64 %60, %xor23.i145.i
  %xor25.i147.i = xor i64 %xor22.i144.i, %xor23.i145.i
  %xor27.i148.i = xor i64 %xor11.i133.i, %xor23.i145.i
  %and.i149.i = and i64 %xor14.i136.i, %xor19.i141.i
  %and30.i150.i = and i64 %xor17.i139.i, %xor21.i143.i
  %xor31.i151.i = xor i64 %and30.i150.i, %and.i149.i
  %and32.i152.i = and i64 %xor13.i135.i, %60
  %and34.i153.i = and i64 %xor8.i130.i, %xor27.i148.i
  %and35.i154.i = and i64 %xor16.i138.i, %xor12.i134.i
  %and37.i155.i = and i64 %xor15.i137.i, %xor24.i146.i
  %and39.i156.i = and i64 %xor9.i131.i, %xor23.i145.i
  %and40.i157.i = and i64 %xor.i129.i, %xor25.i147.i
  %xor41.i158.i = xor i64 %and40.i157.i, %and39.i156.i
  %and42.i159.i = and i64 %xor10.i132.i, %xor22.i144.i
  %xor43.i160.i = xor i64 %and42.i159.i, %and39.i156.i
  %xor44.i161.i = xor i64 %xor31.i151.i, %xor41.i158.i
  %xor48.i162.i = xor i64 %xor44.i161.i, %xor20.i142.i
  %61 = xor i64 %xor10.i132.i, %and32.i152.i
  %62 = xor i64 %61, %xor22.i144.i
  %63 = xor i64 %62, %and.i149.i
  %xor49.i163.i = xor i64 %63, %xor43.i160.i
  %64 = xor i64 %xor27.i148.i, %and35.i154.i
  %65 = xor i64 %64, %xor8.i130.i
  %66 = xor i64 %65, %and34.i153.i
  %xor50.i164.i = xor i64 %66, %xor41.i158.i
  %67 = xor i64 %xor27.i148.i, %and37.i155.i
  %68 = xor i64 %67, %53
  %69 = xor i64 %68, %and34.i153.i
  %xor51.i165.i = xor i64 %69, %xor43.i160.i
  %xor52.i166.i = xor i64 %xor48.i162.i, %xor49.i163.i
  %and53.i167.i = and i64 %xor48.i162.i, %xor50.i164.i
  %xor54.i168.i = xor i64 %xor51.i165.i, %and53.i167.i
  %and55.i169.i = and i64 %xor52.i166.i, %xor54.i168.i
  %xor56.i170.i = xor i64 %and55.i169.i, %xor49.i163.i
  %xor57.i171.i = xor i64 %xor50.i164.i, %xor51.i165.i
  %xor58.i172.i = xor i64 %xor49.i163.i, %and53.i167.i
  %and59.i173.i = and i64 %xor58.i172.i, %xor57.i171.i
  %xor60.i174.i = xor i64 %and59.i173.i, %xor51.i165.i
  %xor61.i175.i = xor i64 %xor50.i164.i, %xor60.i174.i
  %xor62.i176.i = xor i64 %and59.i173.i, %and53.i167.i
  %and63.i177.i = and i64 %xor51.i165.i, %xor62.i176.i
  %xor64.i178.i = xor i64 %and63.i177.i, %xor61.i175.i
  %xor65.i179.i = xor i64 %xor54.i168.i, %and63.i177.i
  %and66.i180.i = and i64 %xor56.i170.i, %xor65.i179.i
  %xor67.i181.i = xor i64 %xor52.i166.i, %and66.i180.i
  %xor68.i182.i = xor i64 %xor67.i181.i, %xor64.i178.i
  %xor69.i183.i = xor i64 %xor56.i170.i, %xor60.i174.i
  %xor70.i184.i = xor i64 %xor56.i170.i, %xor67.i181.i
  %xor71.i185.i = xor i64 %and63.i177.i, %xor50.i164.i
  %xor72.i186.i = xor i64 %xor69.i183.i, %xor68.i182.i
  %and73.i187.i = and i64 %xor71.i185.i, %xor19.i141.i
  %and74.i188.i = and i64 %xor64.i178.i, %xor21.i143.i
  %and75.i189.i = and i64 %xor60.i174.i, %60
  %and76.i190.i = and i64 %xor70.i184.i, %xor27.i148.i
  %and77.i191.i = and i64 %xor67.i181.i, %xor12.i134.i
  %and78.i192.i = and i64 %xor56.i170.i, %xor24.i146.i
  %and79.i193.i = and i64 %xor69.i183.i, %xor23.i145.i
  %and80.i194.i = and i64 %xor72.i186.i, %xor25.i147.i
  %and81.i195.i = and i64 %xor68.i182.i, %xor22.i144.i
  %and82.i196.i = and i64 %xor71.i185.i, %xor14.i136.i
  %and83.i197.i = and i64 %xor64.i178.i, %xor17.i139.i
  %and84.i198.i = and i64 %xor60.i174.i, %xor13.i135.i
  %and85.i199.i = and i64 %xor70.i184.i, %xor8.i130.i
  %and86.i200.i = and i64 %xor67.i181.i, %xor16.i138.i
  %and87.i201.i = and i64 %xor56.i170.i, %xor15.i137.i
  %and88.i202.i = and i64 %xor69.i183.i, %xor9.i131.i
  %and89.i203.i = and i64 %xor72.i186.i, %xor.i129.i
  %and90.i204.i = and i64 %xor68.i182.i, %xor10.i132.i
  %xor91.i205.i = xor i64 %and88.i202.i, %and89.i203.i
  %xor92.i206.i = xor i64 %and83.i197.i, %and84.i198.i
  %xor93.i207.i = xor i64 %and78.i192.i, %and86.i200.i
  %xor94.i208.i = xor i64 %and82.i196.i, %and83.i197.i
  %xor95.i209.i = xor i64 %and75.i189.i, %and85.i199.i
  %xor96.i210.i = xor i64 %and75.i189.i, %and78.i192.i
  %xor97.i211.i = xor i64 %and80.i194.i, %and81.i195.i
  %xor98.i212.i = xor i64 %and73.i187.i, %and76.i190.i
  %xor99.i213.i = xor i64 %and79.i193.i, %and80.i194.i
  %xor100.i214.i = xor i64 %and89.i203.i, %and90.i204.i
  %xor101.i215.i = xor i64 %and85.i199.i, %xor93.i207.i
  %xor102.i216.i = xor i64 %xor95.i209.i, %xor98.i212.i
  %xor103.i217.i = xor i64 %and77.i191.i, %xor91.i205.i
  %xor104.i218.i = xor i64 %and76.i190.i, %xor99.i213.i
  %xor105.i219.i = xor i64 %xor91.i205.i, %xor102.i216.i
  %xor106.i220.i = xor i64 %and87.i201.i, %xor102.i216.i
  %xor107.i221.i = xor i64 %xor97.i211.i, %xor103.i217.i
  %xor108.i222.i = xor i64 %xor94.i208.i, %xor103.i217.i
  %xor109.i223.i = xor i64 %and77.i191.i, %xor104.i218.i
  %xor110.i224.i = xor i64 %xor106.i220.i, %xor107.i221.i
  %xor111.i225.i = xor i64 %and74.i188.i, %xor108.i222.i
  %xor112.i226.i = xor i64 %xor104.i218.i, %xor108.i222.i
  %70 = xor i64 %xor107.i221.i, %xor101.i215.i
  %xor113.i227.i = xor i64 %70, -1
  %71 = xor i64 %xor105.i219.i, %xor93.i207.i
  %xor115.i228.i = xor i64 %71, -1
  %xor117.i229.i = xor i64 %xor98.i212.i, %xor111.i225.i
  %xor118.i230.i = xor i64 %xor96.i210.i, %xor111.i225.i
  %xor119.i231.i = xor i64 %xor92.i206.i, %xor110.i224.i
  %72 = xor i64 %xor117.i229.i, %xor109.i223.i
  %xor121.i232.i = xor i64 %72, -1
  %73 = xor i64 %xor110.i224.i, %xor100.i214.i
  %74 = xor i64 %73, %xor109.i223.i
  %xor123.i233.i = xor i64 %74, -1
  %arrayidx124.i234.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %xor112.i226.i, ptr %arrayidx124.i234.i, align 8
  %arrayidx125.i235.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %xor121.i232.i, ptr %arrayidx125.i235.i, align 8
  %arrayidx126.i236.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %xor123.i233.i, ptr %arrayidx126.i236.i, align 8
  %arrayidx127.i237.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %xor117.i229.i, ptr %arrayidx127.i237.i, align 8
  %arrayidx128.i238.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %xor118.i230.i, ptr %arrayidx128.i238.i, align 8
  %arrayidx129.i239.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %xor119.i231.i, ptr %arrayidx129.i239.i, align 8
  %arrayidx130.i240.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %xor113.i227.i, ptr %arrayidx130.i240.i, align 8
  store i64 %xor115.i228.i, ptr %q.i, align 8
  br label %for.body.i5.i

for.body.i5.i:                                    ; preds = %for.body7.i, %for.body.i5.i
  %i.0.i3.i818 = phi i32 [ 0, %for.body7.i ], [ %inc.i27.i, %for.body.i5.i ]
  %arrayidx.i6.i = getelementptr inbounds nuw i64, ptr %q.i, i32 %i.0.i3.i818
  %75 = load i64, ptr %arrayidx.i6.i, align 8
  %and.i7.i = and i64 %75, 65535
  %and1.i8.i = lshr i64 %75, 4
  %shr.i9.i = and i64 %and1.i8.i, 268369920
  %or.i10.i = or disjoint i64 %and.i7.i, %shr.i9.i
  %and2.i11.i = shl i64 %75, 12
  %shl.i12.i = and i64 %and2.i11.i, 4026531840
  %or3.i13.i = or disjoint i64 %or.i10.i, %shl.i12.i
  %and4.i14.i = lshr i64 %75, 8
  %shr5.i15.i = and i64 %and4.i14.i, 1095216660480
  %or6.i16.i = or disjoint i64 %or3.i13.i, %shr5.i15.i
  %and7.i17.i = shl i64 %75, 8
  %shl8.i18.i = and i64 %and7.i17.i, 280375465082880
  %or9.i19.i = or disjoint i64 %or6.i16.i, %shl8.i18.i
  %and10.i20.i = lshr i64 %75, 12
  %shr11.i21.i = and i64 %and10.i20.i, 4222124650659840
  %or12.i22.i = or disjoint i64 %or9.i19.i, %shr11.i21.i
  %and13.i23.i = shl i64 %75, 4
  %shl14.i24.i = and i64 %and13.i23.i, -4503599627370496
  %or15.i25.i = or i64 %or12.i22.i, %shl14.i24.i
  %arrayidx16.i26.i = getelementptr inbounds nuw i64, ptr %q.i, i32 %i.0.i3.i818
  store i64 %or15.i25.i, ptr %arrayidx16.i26.i, align 8
  %inc.i27.i = add nuw nsw i32 %i.0.i3.i818, 1
  %exitcond.i4.i.not = icmp eq i32 %inc.i27.i, 8
  br i1 %exitcond.i4.i.not, label %shift_rows.exit28.i, label %for.body.i5.i, !llvm.loop !39

shift_rows.exit28.i:                              ; preds = %for.body.i5.i
  %76 = load i64, ptr %q.i, align 8
  %arrayidx1.i96.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %77 = load i64, ptr %arrayidx1.i96.i, align 8
  %arrayidx2.i97.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %78 = load i64, ptr %arrayidx2.i97.i, align 8
  %arrayidx3.i98.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %79 = load i64, ptr %arrayidx3.i98.i, align 8
  %arrayidx4.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %80 = load i64, ptr %arrayidx4.i.i, align 8
  %arrayidx5.i99.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %81 = load i64, ptr %arrayidx5.i99.i, align 8
  %arrayidx6.i100.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %82 = load i64, ptr %arrayidx6.i100.i, align 8
  %arrayidx7.i.i26 = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %83 = load i64, ptr %arrayidx7.i.i26, align 8
  %84 = call i64 @llvm.fshl.i64(i64 %76, i64 %76, i64 48)
  %85 = call i64 @llvm.fshl.i64(i64 %77, i64 %77, i64 48)
  %86 = call i64 @llvm.fshl.i64(i64 %78, i64 %78, i64 48)
  %87 = call i64 @llvm.fshl.i64(i64 %79, i64 %79, i64 48)
  %88 = call i64 @llvm.fshl.i64(i64 %80, i64 %80, i64 48)
  %89 = call i64 @llvm.fshl.i64(i64 %81, i64 %81, i64 48)
  %90 = call i64 @llvm.fshl.i64(i64 %82, i64 %82, i64 48)
  %91 = call i64 @llvm.fshl.i64(i64 %83, i64 %83, i64 48)
  %xor30.i.i = xor i64 %76, %84
  %92 = call i64 @llvm.fshl.i64(i64 %xor30.i.i, i64 %xor30.i.i, i64 32)
  %93 = xor i64 %91, %92
  %94 = xor i64 %93, %83
  %xor31.i.i = xor i64 %94, %84
  store i64 %xor31.i.i, ptr %q.i, align 8
  %xor37.i.i = xor i64 %77, %85
  %95 = call i64 @llvm.fshl.i64(i64 %xor37.i.i, i64 %xor37.i.i, i64 32)
  %96 = xor i64 %84, %95
  %97 = xor i64 %96, %76
  %98 = xor i64 %97, %83
  %99 = xor i64 %98, %91
  %xor39.i.i = xor i64 %99, %85
  %arrayidx40.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %xor39.i.i, ptr %arrayidx40.i.i, align 8
  %xor43.i.i = xor i64 %78, %86
  %100 = call i64 @llvm.fshl.i64(i64 %xor43.i.i, i64 %xor43.i.i, i64 32)
  %101 = xor i64 %85, %100
  %102 = xor i64 %101, %77
  %xor45.i.i = xor i64 %102, %86
  %arrayidx46.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %xor45.i.i, ptr %arrayidx46.i.i, align 8
  %xor51.i.i = xor i64 %79, %87
  %103 = call i64 @llvm.fshl.i64(i64 %xor51.i.i, i64 %xor51.i.i, i64 32)
  %104 = xor i64 %86, %103
  %105 = xor i64 %104, %78
  %106 = xor i64 %105, %83
  %107 = xor i64 %106, %91
  %xor53.i.i = xor i64 %107, %87
  %arrayidx54.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %xor53.i.i, ptr %arrayidx54.i.i, align 8
  %xor59.i.i = xor i64 %80, %88
  %108 = call i64 @llvm.fshl.i64(i64 %xor59.i.i, i64 %xor59.i.i, i64 32)
  %109 = xor i64 %87, %108
  %110 = xor i64 %109, %79
  %111 = xor i64 %110, %83
  %112 = xor i64 %111, %91
  %xor61.i.i = xor i64 %112, %88
  %arrayidx62.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %xor61.i.i, ptr %arrayidx62.i.i, align 8
  %xor65.i.i = xor i64 %81, %89
  %113 = call i64 @llvm.fshl.i64(i64 %xor65.i.i, i64 %xor65.i.i, i64 32)
  %114 = xor i64 %88, %113
  %115 = xor i64 %114, %80
  %xor67.i.i = xor i64 %115, %89
  %arrayidx68.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %xor67.i.i, ptr %arrayidx68.i.i, align 8
  %xor71.i.i = xor i64 %82, %90
  %116 = call i64 @llvm.fshl.i64(i64 %xor71.i.i, i64 %xor71.i.i, i64 32)
  %117 = xor i64 %89, %116
  %118 = xor i64 %117, %81
  %xor73.i.i = xor i64 %118, %90
  %arrayidx74.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %xor73.i.i, ptr %arrayidx74.i.i, align 8
  %xor77.i.i = xor i64 %83, %91
  %119 = call i64 @llvm.fshl.i64(i64 %xor77.i.i, i64 %xor77.i.i, i64 32)
  %120 = xor i64 %90, %119
  %121 = xor i64 %120, %82
  %xor79.i.i = xor i64 %121, %91
  %arrayidx80.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %xor79.i.i, ptr %arrayidx80.i.i, align 8
  %add.ptr13.idx.i = shl nuw nsw i32 %i.1.i819, 6
  %add.ptr13.i = getelementptr inbounds nuw i8, ptr %0, i32 %add.ptr13.idx.i
  %122 = load i64, ptr %add.ptr13.i, align 8
  %123 = load i64, ptr %q.i, align 8
  %xor.i74.i = xor i64 %123, %122
  store i64 %xor.i74.i, ptr %q.i, align 8
  %arrayidx2.i75.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i, i32 8
  %124 = load i64, ptr %arrayidx2.i75.i, align 8
  %arrayidx3.i76.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %125 = load i64, ptr %arrayidx3.i76.i, align 8
  %xor4.i77.i = xor i64 %125, %124
  store i64 %xor4.i77.i, ptr %arrayidx3.i76.i, align 8
  %arrayidx5.i78.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i, i32 16
  %126 = load i64, ptr %arrayidx5.i78.i, align 8
  %arrayidx6.i79.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %127 = load i64, ptr %arrayidx6.i79.i, align 8
  %xor7.i80.i = xor i64 %127, %126
  store i64 %xor7.i80.i, ptr %arrayidx6.i79.i, align 8
  %arrayidx8.i81.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i, i32 24
  %128 = load i64, ptr %arrayidx8.i81.i, align 8
  %arrayidx9.i82.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %129 = load i64, ptr %arrayidx9.i82.i, align 8
  %xor10.i83.i = xor i64 %129, %128
  store i64 %xor10.i83.i, ptr %arrayidx9.i82.i, align 8
  %arrayidx11.i84.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i, i32 32
  %130 = load i64, ptr %arrayidx11.i84.i, align 8
  %arrayidx12.i85.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %131 = load i64, ptr %arrayidx12.i85.i, align 8
  %xor13.i86.i = xor i64 %131, %130
  store i64 %xor13.i86.i, ptr %arrayidx12.i85.i, align 8
  %arrayidx14.i87.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i, i32 40
  %132 = load i64, ptr %arrayidx14.i87.i, align 8
  %arrayidx15.i88.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %133 = load i64, ptr %arrayidx15.i88.i, align 8
  %xor16.i89.i = xor i64 %133, %132
  store i64 %xor16.i89.i, ptr %arrayidx15.i88.i, align 8
  %arrayidx17.i90.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i, i32 48
  %134 = load i64, ptr %arrayidx17.i90.i, align 8
  %arrayidx18.i91.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %135 = load i64, ptr %arrayidx18.i91.i, align 8
  %xor19.i92.i = xor i64 %135, %134
  store i64 %xor19.i92.i, ptr %arrayidx18.i91.i, align 8
  %arrayidx20.i93.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i, i32 56
  %136 = load i64, ptr %arrayidx20.i93.i, align 8
  %arrayidx21.i94.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %137 = load i64, ptr %arrayidx21.i94.i, align 8
  %xor22.i95.i = xor i64 %137, %136
  store i64 %xor22.i95.i, ptr %arrayidx21.i94.i, align 8
  %inc15.i = add nuw nsw i32 %i.1.i819, 1
  %exitcond1.i.not = icmp eq i32 %inc15.i, 10
  br i1 %exitcond1.i.not, label %for.end16.i, label %for.body7.i, !llvm.loop !40

for.end16.i:                                      ; preds = %shift_rows.exit28.i
  %arrayidx.i101.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %138 = load i64, ptr %arrayidx.i101.i, align 8
  %arrayidx1.i102.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %139 = load i64, ptr %arrayidx1.i102.i, align 8
  %arrayidx2.i103.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %140 = load i64, ptr %arrayidx2.i103.i, align 8
  %arrayidx3.i104.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %141 = load i64, ptr %arrayidx3.i104.i, align 8
  %arrayidx4.i105.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %142 = load i64, ptr %arrayidx4.i105.i, align 8
  %arrayidx5.i106.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %143 = load i64, ptr %arrayidx5.i106.i, align 8
  %arrayidx6.i107.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %144 = load i64, ptr %arrayidx6.i107.i, align 8
  %145 = load i64, ptr %q.i, align 8
  %xor.i108.i = xor i64 %141, %143
  %xor8.i.i = xor i64 %138, %144
  %xor9.i.i = xor i64 %138, %141
  %xor10.i109.i = xor i64 %138, %143
  %xor11.i.i = xor i64 %139, %140
  %xor12.i.i = xor i64 %xor11.i.i, %145
  %xor13.i110.i = xor i64 %xor12.i.i, %141
  %xor14.i.i = xor i64 %xor8.i.i, %xor.i108.i
  %xor15.i.i = xor i64 %xor12.i.i, %138
  %xor16.i111.i = xor i64 %xor12.i.i, %144
  %xor17.i.i = xor i64 %xor16.i111.i, %xor10.i109.i
  %xor18.i.i = xor i64 %142, %xor14.i.i
  %xor19.i112.i = xor i64 %xor18.i.i, %143
  %xor20.i.i = xor i64 %xor18.i.i, %139
  %xor21.i.i = xor i64 %xor19.i112.i, %145
  %xor22.i113.i = xor i64 %xor19.i112.i, %xor11.i.i
  %xor23.i.i = xor i64 %xor20.i.i, %xor9.i.i
  %xor24.i.i = xor i64 %145, %xor23.i.i
  %xor25.i.i = xor i64 %xor22.i113.i, %xor23.i.i
  %xor27.i.i = xor i64 %xor11.i.i, %xor23.i.i
  %and.i114.i = and i64 %xor14.i.i, %xor19.i112.i
  %and30.i.i = and i64 %xor17.i.i, %xor21.i.i
  %xor31.i115.i = xor i64 %and30.i.i, %and.i114.i
  %and32.i.i = and i64 %xor13.i110.i, %145
  %and34.i.i = and i64 %xor8.i.i, %xor27.i.i
  %and35.i.i = and i64 %xor16.i111.i, %xor12.i.i
  %and37.i.i = and i64 %xor15.i.i, %xor24.i.i
  %and39.i.i = and i64 %xor9.i.i, %xor23.i.i
  %and40.i.i = and i64 %xor.i108.i, %xor25.i.i
  %xor41.i.i = xor i64 %and40.i.i, %and39.i.i
  %and42.i.i = and i64 %xor10.i109.i, %xor22.i113.i
  %xor43.i116.i = xor i64 %and42.i.i, %and39.i.i
  %xor44.i.i = xor i64 %xor31.i115.i, %xor41.i.i
  %xor48.i.i = xor i64 %xor44.i.i, %xor20.i.i
  %146 = xor i64 %xor10.i109.i, %and32.i.i
  %147 = xor i64 %146, %xor22.i113.i
  %148 = xor i64 %147, %and.i114.i
  %xor49.i.i = xor i64 %148, %xor43.i116.i
  %149 = xor i64 %xor27.i.i, %and35.i.i
  %150 = xor i64 %149, %xor8.i.i
  %151 = xor i64 %150, %and34.i.i
  %xor50.i.i = xor i64 %151, %xor41.i.i
  %152 = xor i64 %xor27.i.i, %and37.i.i
  %153 = xor i64 %152, %138
  %154 = xor i64 %153, %and34.i.i
  %xor51.i117.i = xor i64 %154, %xor43.i116.i
  %xor52.i.i = xor i64 %xor48.i.i, %xor49.i.i
  %and53.i.i = and i64 %xor48.i.i, %xor50.i.i
  %xor54.i.i = xor i64 %xor51.i117.i, %and53.i.i
  %and55.i.i = and i64 %xor52.i.i, %xor54.i.i
  %xor56.i.i = xor i64 %and55.i.i, %xor49.i.i
  %xor57.i.i = xor i64 %xor50.i.i, %xor51.i117.i
  %xor58.i.i = xor i64 %xor49.i.i, %and53.i.i
  %and59.i.i = and i64 %xor58.i.i, %xor57.i.i
  %xor60.i.i = xor i64 %and59.i.i, %xor51.i117.i
  %xor61.i118.i = xor i64 %xor50.i.i, %xor60.i.i
  %xor62.i.i = xor i64 %and59.i.i, %and53.i.i
  %and63.i.i = and i64 %xor51.i117.i, %xor62.i.i
  %xor64.i.i = xor i64 %and63.i.i, %xor61.i118.i
  %xor65.i119.i = xor i64 %xor54.i.i, %and63.i.i
  %and66.i.i = and i64 %xor56.i.i, %xor65.i119.i
  %xor67.i120.i = xor i64 %xor52.i.i, %and66.i.i
  %xor68.i.i = xor i64 %xor67.i120.i, %xor64.i.i
  %xor69.i.i = xor i64 %xor56.i.i, %xor60.i.i
  %xor70.i.i = xor i64 %xor56.i.i, %xor67.i120.i
  %xor71.i121.i = xor i64 %and63.i.i, %xor50.i.i
  %xor72.i.i = xor i64 %xor69.i.i, %xor68.i.i
  %and73.i.i = and i64 %xor71.i121.i, %xor19.i112.i
  %and74.i.i = and i64 %xor64.i.i, %xor21.i.i
  %and75.i.i = and i64 %xor60.i.i, %145
  %and76.i.i = and i64 %xor70.i.i, %xor27.i.i
  %and77.i.i = and i64 %xor67.i120.i, %xor12.i.i
  %and78.i.i = and i64 %xor56.i.i, %xor24.i.i
  %and79.i.i = and i64 %xor69.i.i, %xor23.i.i
  %and80.i.i = and i64 %xor72.i.i, %xor25.i.i
  %and81.i.i = and i64 %xor68.i.i, %xor22.i113.i
  %and82.i.i = and i64 %xor71.i121.i, %xor14.i.i
  %and83.i.i = and i64 %xor64.i.i, %xor17.i.i
  %and84.i.i = and i64 %xor60.i.i, %xor13.i110.i
  %and85.i.i = and i64 %xor70.i.i, %xor8.i.i
  %and86.i.i = and i64 %xor67.i120.i, %xor16.i111.i
  %and87.i.i = and i64 %xor56.i.i, %xor15.i.i
  %and88.i.i = and i64 %xor69.i.i, %xor9.i.i
  %and89.i.i = and i64 %xor72.i.i, %xor.i108.i
  %and90.i.i = and i64 %xor68.i.i, %xor10.i109.i
  %xor91.i.i = xor i64 %and88.i.i, %and89.i.i
  %xor92.i.i = xor i64 %and83.i.i, %and84.i.i
  %xor93.i.i = xor i64 %and78.i.i, %and86.i.i
  %xor94.i.i = xor i64 %and82.i.i, %and83.i.i
  %xor95.i.i = xor i64 %and75.i.i, %and85.i.i
  %xor96.i.i = xor i64 %and75.i.i, %and78.i.i
  %xor97.i.i = xor i64 %and80.i.i, %and81.i.i
  %xor98.i.i = xor i64 %and73.i.i, %and76.i.i
  %xor99.i.i = xor i64 %and79.i.i, %and80.i.i
  %xor100.i.i = xor i64 %and89.i.i, %and90.i.i
  %xor101.i.i = xor i64 %and85.i.i, %xor93.i.i
  %xor102.i.i = xor i64 %xor95.i.i, %xor98.i.i
  %xor103.i.i = xor i64 %and77.i.i, %xor91.i.i
  %xor104.i.i = xor i64 %and76.i.i, %xor99.i.i
  %xor105.i.i = xor i64 %xor91.i.i, %xor102.i.i
  %xor106.i.i = xor i64 %and87.i.i, %xor102.i.i
  %xor107.i.i = xor i64 %xor97.i.i, %xor103.i.i
  %xor108.i.i = xor i64 %xor94.i.i, %xor103.i.i
  %xor109.i.i = xor i64 %and77.i.i, %xor104.i.i
  %xor110.i.i = xor i64 %xor106.i.i, %xor107.i.i
  %xor111.i.i = xor i64 %and74.i.i, %xor108.i.i
  %xor112.i.i = xor i64 %xor104.i.i, %xor108.i.i
  %155 = xor i64 %xor107.i.i, %xor101.i.i
  %xor113.i.i = xor i64 %155, -1
  %156 = xor i64 %xor105.i.i, %xor93.i.i
  %xor115.i.i = xor i64 %156, -1
  %xor117.i.i = xor i64 %xor98.i.i, %xor111.i.i
  %xor118.i.i = xor i64 %xor96.i.i, %xor111.i.i
  %xor119.i.i = xor i64 %xor92.i.i, %xor110.i.i
  %157 = xor i64 %xor117.i.i, %xor109.i.i
  %xor121.i.i = xor i64 %157, -1
  %158 = xor i64 %xor110.i.i, %xor100.i.i
  %159 = xor i64 %158, %xor109.i.i
  %xor123.i.i = xor i64 %159, -1
  %arrayidx124.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %xor112.i.i, ptr %arrayidx124.i.i, align 8
  %arrayidx125.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %xor121.i.i, ptr %arrayidx125.i.i, align 8
  %arrayidx126.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %xor123.i.i, ptr %arrayidx126.i.i, align 8
  %arrayidx127.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %xor117.i.i, ptr %arrayidx127.i.i, align 8
  %arrayidx128.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %xor118.i.i, ptr %arrayidx128.i.i, align 8
  %arrayidx129.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %xor119.i.i, ptr %arrayidx129.i.i, align 8
  %arrayidx130.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %xor113.i.i, ptr %arrayidx130.i.i, align 8
  store i64 %xor115.i.i, ptr %q.i, align 8
  br label %for.body.i.i

for.body.i.i:                                     ; preds = %for.end16.i, %for.body.i.i
  %i.0.i.i820 = phi i32 [ 0, %for.end16.i ], [ %inc.i.i, %for.body.i.i ]
  %arrayidx.i.i = getelementptr inbounds nuw i64, ptr %q.i, i32 %i.0.i.i820
  %160 = load i64, ptr %arrayidx.i.i, align 8
  %and.i.i = and i64 %160, 65535
  %and1.i.i = lshr i64 %160, 4
  %shr.i1.i = and i64 %and1.i.i, 268369920
  %or.i.i23 = or disjoint i64 %and.i.i, %shr.i1.i
  %and2.i.i = shl i64 %160, 12
  %shl.i.i24 = and i64 %and2.i.i, 4026531840
  %or3.i.i = or disjoint i64 %or.i.i23, %shl.i.i24
  %and4.i.i = lshr i64 %160, 8
  %shr5.i.i = and i64 %and4.i.i, 1095216660480
  %or6.i.i25 = or disjoint i64 %or3.i.i, %shr5.i.i
  %and7.i.i = shl i64 %160, 8
  %shl8.i.i = and i64 %and7.i.i, 280375465082880
  %or9.i.i = or disjoint i64 %or6.i.i25, %shl8.i.i
  %and10.i.i = lshr i64 %160, 12
  %shr11.i.i = and i64 %and10.i.i, 4222124650659840
  %or12.i.i = or disjoint i64 %or9.i.i, %shr11.i.i
  %and13.i.i = shl i64 %160, 4
  %shl14.i.i = and i64 %and13.i.i, -4503599627370496
  %or15.i.i = or i64 %or12.i.i, %shl14.i.i
  %arrayidx16.i.i = getelementptr inbounds nuw i64, ptr %q.i, i32 %i.0.i.i820
  store i64 %or15.i.i, ptr %arrayidx16.i.i, align 8
  %inc.i.i = add nuw nsw i32 %i.0.i.i820, 1
  %exitcond.i.i.not = icmp eq i32 %inc.i.i, 8
  br i1 %exitcond.i.i.not, label %shift_rows.exit.i, label %for.body.i.i, !llvm.loop !41

shift_rows.exit.i:                                ; preds = %for.body.i.i
  %add.ptr20.i = getelementptr inbounds nuw i8, ptr %0, i32 640
  %161 = load i64, ptr %add.ptr20.i, align 8
  %162 = load i64, ptr %q.i, align 8
  %xor.i52.i = xor i64 %162, %161
  store i64 %xor.i52.i, ptr %q.i, align 8
  %arrayidx2.i53.i = getelementptr inbounds nuw i8, ptr %0, i32 648
  %163 = load i64, ptr %arrayidx2.i53.i, align 8
  %arrayidx3.i54.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %164 = load i64, ptr %arrayidx3.i54.i, align 8
  %xor4.i55.i = xor i64 %164, %163
  store i64 %xor4.i55.i, ptr %arrayidx3.i54.i, align 8
  %arrayidx5.i56.i = getelementptr inbounds nuw i8, ptr %0, i32 656
  %165 = load i64, ptr %arrayidx5.i56.i, align 8
  %arrayidx6.i57.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %166 = load i64, ptr %arrayidx6.i57.i, align 8
  %xor7.i58.i = xor i64 %166, %165
  store i64 %xor7.i58.i, ptr %arrayidx6.i57.i, align 8
  %arrayidx8.i59.i = getelementptr inbounds nuw i8, ptr %0, i32 664
  %167 = load i64, ptr %arrayidx8.i59.i, align 8
  %arrayidx9.i60.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %168 = load i64, ptr %arrayidx9.i60.i, align 8
  %xor10.i61.i = xor i64 %168, %167
  store i64 %xor10.i61.i, ptr %arrayidx9.i60.i, align 8
  %arrayidx11.i62.i = getelementptr inbounds nuw i8, ptr %0, i32 672
  %169 = load i64, ptr %arrayidx11.i62.i, align 8
  %arrayidx12.i63.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %170 = load i64, ptr %arrayidx12.i63.i, align 8
  %xor13.i64.i = xor i64 %170, %169
  store i64 %xor13.i64.i, ptr %arrayidx12.i63.i, align 8
  %arrayidx14.i65.i = getelementptr inbounds nuw i8, ptr %0, i32 680
  %171 = load i64, ptr %arrayidx14.i65.i, align 8
  %arrayidx15.i66.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %172 = load i64, ptr %arrayidx15.i66.i, align 8
  %xor16.i67.i = xor i64 %172, %171
  store i64 %xor16.i67.i, ptr %arrayidx15.i66.i, align 8
  %arrayidx17.i68.i = getelementptr inbounds nuw i8, ptr %0, i32 688
  %173 = load i64, ptr %arrayidx17.i68.i, align 8
  %arrayidx18.i69.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %174 = load i64, ptr %arrayidx18.i69.i, align 8
  %xor19.i70.i = xor i64 %174, %173
  store i64 %xor19.i70.i, ptr %arrayidx18.i69.i, align 8
  %arrayidx20.i71.i = getelementptr inbounds nuw i8, ptr %0, i32 696
  %175 = load i64, ptr %arrayidx20.i71.i, align 8
  %arrayidx21.i72.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %176 = load i64, ptr %arrayidx21.i72.i, align 8
  %xor22.i73.i = xor i64 %176, %175
  store i64 %xor22.i73.i, ptr %arrayidx21.i72.i, align 8
  %177 = load i64, ptr %q.i, align 8
  %arrayidx1.i268.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %178 = load i64, ptr %arrayidx1.i268.i, align 8
  %and.i269.i = and i64 %177, 6148914691236517205
  %and2.i270.i = shl i64 %178, 1
  %shl.i271.i = and i64 %and2.i270.i, -6148914691236517206
  %or.i272.i = or disjoint i64 %and.i269.i, %shl.i271.i
  store i64 %or.i272.i, ptr %q.i, align 8
  %and4.i273.i = lshr i64 %177, 1
  %shr.i274.i = and i64 %and4.i273.i, 6148914691236517205
  %and5.i275.i = and i64 %178, -6148914691236517206
  %or6.i276.i = or disjoint i64 %shr.i274.i, %and5.i275.i
  %arrayidx7.i277.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or6.i276.i, ptr %arrayidx7.i277.i, align 8
  %arrayidx11.i278.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %179 = load i64, ptr %arrayidx11.i278.i, align 8
  %arrayidx12.i279.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %180 = load i64, ptr %arrayidx12.i279.i, align 8
  %and13.i280.i = and i64 %179, 6148914691236517205
  %and14.i281.i = shl i64 %180, 1
  %shl15.i282.i = and i64 %and14.i281.i, -6148914691236517206
  %or16.i283.i = or disjoint i64 %and13.i280.i, %shl15.i282.i
  %arrayidx17.i284.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or16.i283.i, ptr %arrayidx17.i284.i, align 8
  %and18.i285.i = lshr i64 %179, 1
  %shr19.i286.i = and i64 %and18.i285.i, 6148914691236517205
  %and20.i287.i = and i64 %180, -6148914691236517206
  %or21.i288.i = or disjoint i64 %shr19.i286.i, %and20.i287.i
  %arrayidx22.i289.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or21.i288.i, ptr %arrayidx22.i289.i, align 8
  %arrayidx27.i290.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %181 = load i64, ptr %arrayidx27.i290.i, align 8
  %arrayidx28.i291.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %182 = load i64, ptr %arrayidx28.i291.i, align 8
  %and29.i292.i = and i64 %181, 6148914691236517205
  %and30.i293.i = shl i64 %182, 1
  %shl31.i294.i = and i64 %and30.i293.i, -6148914691236517206
  %or32.i295.i = or disjoint i64 %and29.i292.i, %shl31.i294.i
  %arrayidx33.i296.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or32.i295.i, ptr %arrayidx33.i296.i, align 8
  %and34.i297.i = lshr i64 %181, 1
  %shr35.i298.i = and i64 %and34.i297.i, 6148914691236517205
  %and36.i299.i = and i64 %182, -6148914691236517206
  %or37.i300.i = or disjoint i64 %shr35.i298.i, %and36.i299.i
  %arrayidx38.i301.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or37.i300.i, ptr %arrayidx38.i301.i, align 8
  %arrayidx43.i302.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %183 = load i64, ptr %arrayidx43.i302.i, align 8
  %arrayidx44.i303.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %184 = load i64, ptr %arrayidx44.i303.i, align 8
  %and45.i304.i = and i64 %183, 6148914691236517205
  %and46.i305.i = shl i64 %184, 1
  %shl47.i306.i = and i64 %and46.i305.i, -6148914691236517206
  %or48.i307.i = or disjoint i64 %and45.i304.i, %shl47.i306.i
  %arrayidx49.i308.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or48.i307.i, ptr %arrayidx49.i308.i, align 8
  %and50.i309.i = lshr i64 %183, 1
  %shr51.i310.i = and i64 %and50.i309.i, 6148914691236517205
  %and52.i311.i = and i64 %184, -6148914691236517206
  %or53.i312.i = or disjoint i64 %shr51.i310.i, %and52.i311.i
  %arrayidx54.i313.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or53.i312.i, ptr %arrayidx54.i313.i, align 8
  %185 = load i64, ptr %q.i, align 8
  %arrayidx60.i314.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %186 = load i64, ptr %arrayidx60.i314.i, align 8
  %and61.i315.i = and i64 %185, 3689348814741910323
  %and62.i316.i = shl i64 %186, 2
  %shl63.i317.i = and i64 %and62.i316.i, -3689348814741910324
  %or64.i318.i = or disjoint i64 %and61.i315.i, %shl63.i317.i
  store i64 %or64.i318.i, ptr %q.i, align 8
  %and66.i319.i = lshr i64 %185, 2
  %shr67.i320.i = and i64 %and66.i319.i, 3689348814741910323
  %and68.i321.i = and i64 %186, -3689348814741910324
  %or69.i322.i = or disjoint i64 %shr67.i320.i, %and68.i321.i
  %arrayidx70.i323.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or69.i322.i, ptr %arrayidx70.i323.i, align 8
  %arrayidx75.i324.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %187 = load i64, ptr %arrayidx75.i324.i, align 8
  %arrayidx76.i325.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %188 = load i64, ptr %arrayidx76.i325.i, align 8
  %and77.i326.i = and i64 %187, 3689348814741910323
  %and78.i327.i = shl i64 %188, 2
  %shl79.i328.i = and i64 %and78.i327.i, -3689348814741910324
  %or80.i329.i = or disjoint i64 %and77.i326.i, %shl79.i328.i
  %arrayidx81.i330.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or80.i329.i, ptr %arrayidx81.i330.i, align 8
  %and82.i331.i = lshr i64 %187, 2
  %shr83.i332.i = and i64 %and82.i331.i, 3689348814741910323
  %and84.i333.i = and i64 %188, -3689348814741910324
  %or85.i334.i = or disjoint i64 %shr83.i332.i, %and84.i333.i
  %arrayidx86.i335.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or85.i334.i, ptr %arrayidx86.i335.i, align 8
  %arrayidx91.i336.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %189 = load i64, ptr %arrayidx91.i336.i, align 8
  %arrayidx92.i337.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %190 = load i64, ptr %arrayidx92.i337.i, align 8
  %and93.i338.i = and i64 %189, 3689348814741910323
  %and94.i339.i = shl i64 %190, 2
  %shl95.i340.i = and i64 %and94.i339.i, -3689348814741910324
  %or96.i341.i = or disjoint i64 %and93.i338.i, %shl95.i340.i
  %arrayidx97.i342.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or96.i341.i, ptr %arrayidx97.i342.i, align 8
  %and98.i343.i = lshr i64 %189, 2
  %shr99.i344.i = and i64 %and98.i343.i, 3689348814741910323
  %and100.i345.i = and i64 %190, -3689348814741910324
  %or101.i346.i = or disjoint i64 %shr99.i344.i, %and100.i345.i
  %arrayidx102.i347.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or101.i346.i, ptr %arrayidx102.i347.i, align 8
  %arrayidx107.i348.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %191 = load i64, ptr %arrayidx107.i348.i, align 8
  %arrayidx108.i349.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %192 = load i64, ptr %arrayidx108.i349.i, align 8
  %and109.i350.i = and i64 %191, 3689348814741910323
  %and110.i351.i = shl i64 %192, 2
  %shl111.i352.i = and i64 %and110.i351.i, -3689348814741910324
  %or112.i353.i = or disjoint i64 %and109.i350.i, %shl111.i352.i
  %arrayidx113.i354.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or112.i353.i, ptr %arrayidx113.i354.i, align 8
  %and114.i355.i = lshr i64 %191, 2
  %shr115.i356.i = and i64 %and114.i355.i, 3689348814741910323
  %and116.i357.i = and i64 %192, -3689348814741910324
  %or117.i358.i = or disjoint i64 %shr115.i356.i, %and116.i357.i
  %arrayidx118.i359.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or117.i358.i, ptr %arrayidx118.i359.i, align 8
  %193 = load i64, ptr %q.i, align 8
  %arrayidx124.i360.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %194 = load i64, ptr %arrayidx124.i360.i, align 8
  %and125.i361.i = and i64 %193, 1085102592571150095
  %and126.i362.i = shl i64 %194, 4
  %shl127.i363.i = and i64 %and126.i362.i, -1085102592571150096
  %or128.i364.i = or disjoint i64 %and125.i361.i, %shl127.i363.i
  store i64 %or128.i364.i, ptr %q.i, align 8
  %and130.i365.i = lshr i64 %193, 4
  %shr131.i366.i = and i64 %and130.i365.i, 1085102592571150095
  %and132.i367.i = and i64 %194, -1085102592571150096
  %or133.i368.i = or disjoint i64 %shr131.i366.i, %and132.i367.i
  %arrayidx134.i369.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or133.i368.i, ptr %arrayidx134.i369.i, align 8
  %arrayidx139.i370.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %195 = load i64, ptr %arrayidx139.i370.i, align 8
  %arrayidx140.i371.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %196 = load i64, ptr %arrayidx140.i371.i, align 8
  %and141.i372.i = and i64 %195, 1085102592571150095
  %and142.i373.i = shl i64 %196, 4
  %shl143.i374.i = and i64 %and142.i373.i, -1085102592571150096
  %or144.i375.i = or disjoint i64 %and141.i372.i, %shl143.i374.i
  %arrayidx145.i376.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or144.i375.i, ptr %arrayidx145.i376.i, align 8
  %and146.i377.i = lshr i64 %195, 4
  %shr147.i378.i = and i64 %and146.i377.i, 1085102592571150095
  %and148.i379.i = and i64 %196, -1085102592571150096
  %or149.i380.i = or disjoint i64 %shr147.i378.i, %and148.i379.i
  %arrayidx150.i381.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or149.i380.i, ptr %arrayidx150.i381.i, align 8
  %arrayidx155.i382.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %197 = load i64, ptr %arrayidx155.i382.i, align 8
  %arrayidx156.i383.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %198 = load i64, ptr %arrayidx156.i383.i, align 8
  %and157.i384.i = and i64 %197, 1085102592571150095
  %and158.i385.i = shl i64 %198, 4
  %shl159.i386.i = and i64 %and158.i385.i, -1085102592571150096
  %or160.i387.i = or disjoint i64 %and157.i384.i, %shl159.i386.i
  %arrayidx161.i388.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or160.i387.i, ptr %arrayidx161.i388.i, align 8
  %and162.i389.i = lshr i64 %197, 4
  %shr163.i390.i = and i64 %and162.i389.i, 1085102592571150095
  %and164.i391.i = and i64 %198, -1085102592571150096
  %or165.i392.i = or disjoint i64 %shr163.i390.i, %and164.i391.i
  %arrayidx166.i393.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or165.i392.i, ptr %arrayidx166.i393.i, align 8
  %arrayidx171.i394.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %199 = load i64, ptr %arrayidx171.i394.i, align 8
  %arrayidx172.i395.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %200 = load i64, ptr %arrayidx172.i395.i, align 8
  %and173.i396.i = and i64 %199, 1085102592571150095
  %and174.i397.i = shl i64 %200, 4
  %shl175.i398.i = and i64 %and174.i397.i, -1085102592571150096
  %or176.i399.i = or disjoint i64 %and173.i396.i, %shl175.i398.i
  %arrayidx177.i400.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or176.i399.i, ptr %arrayidx177.i400.i, align 8
  %and178.i401.i = lshr i64 %199, 4
  %shr179.i402.i = and i64 %and178.i401.i, 1085102592571150095
  %and180.i403.i = and i64 %200, -1085102592571150096
  %or181.i404.i = or disjoint i64 %shr179.i402.i, %and180.i403.i
  %arrayidx182.i405.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or181.i404.i, ptr %arrayidx182.i405.i, align 8
  br label %for.body24.i

while.cond.i.i13.preheader:                       ; preds = %for.body24.i
  br label %while.body.i.i17

for.body24.i:                                     ; preds = %shift_rows.exit.i, %for.body24.i
  %i.2.i821 = phi i32 [ 0, %shift_rows.exit.i ], [ %inc32.i, %for.body24.i ]
  %add.ptr27.idx.i = shl nuw nsw i32 %i.2.i821, 4
  %add.ptr27.i = getelementptr inbounds nuw i8, ptr %w.i, i32 %add.ptr27.idx.i
  %arrayidx28.i = getelementptr inbounds nuw [8 x i64], ptr %q.i, i32 0, i32 %i.2.i821
  %201 = load i64, ptr %arrayidx28.i, align 8
  %add29.i = or disjoint i32 %i.2.i821, 4
  %arrayidx30.i = getelementptr inbounds nuw [8 x i64], ptr %q.i, i32 0, i32 %add29.i
  %202 = load i64, ptr %arrayidx30.i, align 8
  %and.i29.i = and i64 %201, 71777214294589695
  %and1.i30.i = and i64 %202, 71777214294589695
  %shr.i31.i = lshr i64 %201, 8
  %and2.i32.i = and i64 %shr.i31.i, 71776119077928960
  %shr3.i33.i = lshr i64 %202, 8
  %and4.i34.i = and i64 %shr3.i33.i, 71776119077928960
  %shr5.i35.i = lshr i64 %and.i29.i, 8
  %or.i36.i = or disjoint i64 %and.i29.i, %shr5.i35.i
  %shr6.i37.i = lshr i64 %and1.i30.i, 8
  %or7.i.i = or disjoint i64 %and1.i30.i, %shr6.i37.i
  %203 = and i64 %201, 280375465148160
  %204 = or disjoint i64 %and2.i32.i, %203
  %or9.i38.i = lshr exact i64 %204, 8
  %205 = and i64 %202, 280375465148160
  %206 = or disjoint i64 %and4.i34.i, %205
  %or11.i.i = lshr exact i64 %206, 8
  %and12.i.i = and i64 %or.i36.i, 281470681808895
  %and13.i39.i = and i64 %or7.i.i, 281470681808895
  %shr16.i.i = lshr i64 %and12.i.i, 16
  %or181.i.i = or disjoint i64 %and12.i.i, %shr16.i.i
  %or18.i.i = trunc i64 %or181.i.i to i32
  store i32 %or18.i.i, ptr %add.ptr27.i, align 4
  %shr20.i.i = lshr i64 %and13.i39.i, 16
  %or222.i.i = or disjoint i64 %and13.i39.i, %shr20.i.i
  %or22.i.i = trunc i64 %or222.i.i to i32
  %arrayidx23.i.i = getelementptr inbounds nuw i8, ptr %add.ptr27.i, i32 4
  store i32 %or22.i.i, ptr %arrayidx23.i.i, align 4
  %shr25.i.i = lshr i64 %204, 24
  %or273.i.i = or disjoint i64 %or9.i38.i, %shr25.i.i
  %or27.i.i = trunc i64 %or273.i.i to i32
  %arrayidx28.i.i = getelementptr inbounds nuw i8, ptr %add.ptr27.i, i32 8
  store i32 %or27.i.i, ptr %arrayidx28.i.i, align 4
  %shr30.i.i = lshr i64 %206, 24
  %or324.i.i = or disjoint i64 %or11.i.i, %shr30.i.i
  %or32.i.i = trunc i64 %or324.i.i to i32
  %arrayidx33.i.i = getelementptr inbounds nuw i8, ptr %add.ptr27.i, i32 12
  store i32 %or32.i.i, ptr %arrayidx33.i.i, align 4
  %inc32.i = add nuw nsw i32 %i.2.i821, 1
  %exitcond2.i.not = icmp eq i32 %inc32.i, 4
  br i1 %exitcond2.i.not, label %while.cond.i.i13.preheader, label %for.body24.i, !llvm.loop !42

while.body.i.i17:                                 ; preds = %while.cond.i.i13.preheader, %while.body.i.i17
  %dst.addr.0.i.i824 = phi ptr [ %out.addr.0.i827, %while.cond.i.i13.preheader ], [ %add.ptr.i.i22, %while.body.i.i17 ]
  %v.addr.0.i.i15823 = phi ptr [ %w.i, %while.cond.i.i13.preheader ], [ %incdec.ptr.i.i19, %while.body.i.i17 ]
  %num.addr.0.i.i14822 = phi i32 [ 16, %while.cond.i.i13.preheader ], [ %dec.i.i18, %while.body.i.i17 ]
  %dec.i.i18 = add nsw i32 %num.addr.0.i.i14822, -1
  %incdec.ptr.i.i19 = getelementptr inbounds nuw i8, ptr %v.addr.0.i.i15823, i32 4
  %207 = load i32, ptr %v.addr.0.i.i15823, align 4
  %conv.i.i20 = trunc i32 %207 to i8
  store i8 %conv.i.i20, ptr %dst.addr.0.i.i824, align 1
  %shr.i.i = lshr i32 %207, 8
  %conv1.i.i = trunc i32 %shr.i.i to i8
  %arrayidx2.i.i = getelementptr inbounds nuw i8, ptr %dst.addr.0.i.i824, i32 1
  store i8 %conv1.i.i, ptr %arrayidx2.i.i, align 1
  %shr3.i.i = lshr i32 %207, 16
  %conv4.i.i21 = trunc i32 %shr3.i.i to i8
  %arrayidx5.i.i = getelementptr inbounds nuw i8, ptr %dst.addr.0.i.i824, i32 2
  store i8 %conv4.i.i21, ptr %arrayidx5.i.i, align 1
  %shr6.i.i = lshr i32 %207, 24
  %conv7.i.i = trunc nuw i32 %shr6.i.i to i8
  %arrayidx8.i.i = getelementptr inbounds nuw i8, ptr %dst.addr.0.i.i824, i32 3
  store i8 %conv7.i.i, ptr %arrayidx8.i.i, align 1
  %add.ptr.i.i22 = getelementptr inbounds nuw i8, ptr %dst.addr.0.i.i824, i32 4
  %cmp.not.i.i16 = icmp eq i32 %dec.i.i18, 0
  br i1 %cmp.not.i.i16, label %aes_ecb4x.exit, label %while.body.i.i17, !llvm.loop !43

aes_ecb4x.exit:                                   ; preds = %while.body.i.i17
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %w.i)
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %q.i)
  %add.ptr.i1 = getelementptr inbounds nuw i8, ptr %ivw.i, i32 12
  %208 = load i32, ptr %add.ptr.i1, align 4
  %209 = call i32 @llvm.bswap.i32(i32 %208)
  %add.i8.i = add i32 %209, 4
  %210 = call i32 @llvm.bswap.i32(i32 %add.i8.i)
  store i32 %210, ptr %add.ptr.i1, align 4
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %ivw.i, i32 28
  %211 = load i32, ptr %add.ptr1.i, align 4
  %212 = call i32 @llvm.bswap.i32(i32 %211)
  %add.i5.i = add i32 %212, 4
  %213 = call i32 @llvm.bswap.i32(i32 %add.i5.i)
  store i32 %213, ptr %add.ptr1.i, align 4
  %add.ptr2.i = getelementptr inbounds nuw i8, ptr %ivw.i, i32 44
  %214 = load i32, ptr %add.ptr2.i, align 4
  %215 = call i32 @llvm.bswap.i32(i32 %214)
  %add.i2.i = add i32 %215, 4
  %216 = call i32 @llvm.bswap.i32(i32 %add.i2.i)
  store i32 %216, ptr %add.ptr2.i, align 4
  %add.ptr3.i = getelementptr inbounds nuw i8, ptr %ivw.i, i32 60
  %217 = load i32, ptr %add.ptr3.i, align 4
  %218 = call i32 @llvm.bswap.i32(i32 %217)
  %add.i.i = add i32 %218, 4
  %219 = call i32 @llvm.bswap.i32(i32 %add.i.i)
  store i32 %219, ptr %add.ptr3.i, align 4
  %add.ptr21.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i827, i32 64
  %sub.i = add i32 %outlen.addr.0.i826, -64
  %cmp.i = icmp ugt i32 %sub.i, 64
  br i1 %cmp.i, label %while.body.i, label %while.cond.i.while.end.i_crit_edge, !llvm.loop !44

while.cond.i.while.end.i_crit_edge:               ; preds = %aes_ecb4x.exit
  %split = phi i32 [ %sub.i, %aes_ecb4x.exit ]
  %split828 = phi ptr [ %add.ptr21.i, %aes_ecb4x.exit ]
  br label %while.end.i

while.end.i:                                      ; preds = %while.cond.i.while.end.i_crit_edge, %br_range_dec32le.exit.i
  %outlen.addr.0.i.lcssa = phi i32 [ %split, %while.cond.i.while.end.i_crit_edge ], [ %outlen, %br_range_dec32le.exit.i ]
  %out.addr.0.i.lcssa = phi ptr [ %split828, %while.cond.i.while.end.i_crit_edge ], [ %out, %br_range_dec32le.exit.i ]
  %cmp22.not.i = icmp eq i32 %outlen.addr.0.i.lcssa, 0
  br i1 %cmp22.not.i, label %aes_ctr.exit, label %if.then.i

if.then.i:                                        ; preds = %while.end.i
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %w.i36)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %q.i37)
  %call.i38 = call ptr @memcpy(ptr noundef nonnull %w.i36, ptr noundef nonnull %ivw.i, i32 noundef 64) #8
  br label %for.body.i775

for.body.i775:                                    ; preds = %if.then.i, %for.body.i775
  %i.0.i40829 = phi i32 [ 0, %if.then.i ], [ %inc.i812, %for.body.i775 ]
  %arrayidx.i776 = getelementptr inbounds nuw [8 x i64], ptr %q.i37, i32 0, i32 %i.0.i40829
  %add.i777 = or disjoint i32 %i.0.i40829, 4
  %arrayidx1.i778 = getelementptr inbounds nuw [8 x i64], ptr %q.i37, i32 0, i32 %add.i777
  %add.ptr.idx.i779 = shl nuw nsw i32 %i.0.i40829, 4
  %add.ptr.i780 = getelementptr inbounds nuw i8, ptr %w.i36, i32 %add.ptr.idx.i779
  %220 = load i32, ptr %add.ptr.i780, align 4
  %conv.i40.i781 = zext i32 %220 to i64
  %arrayidx1.i.i782 = getelementptr inbounds nuw i8, ptr %add.ptr.i780, i32 4
  %221 = load i32, ptr %arrayidx1.i.i782, align 4
  %conv2.i.i783 = zext i32 %221 to i64
  %arrayidx3.i.i784 = getelementptr inbounds nuw i8, ptr %add.ptr.i780, i32 8
  %222 = load i32, ptr %arrayidx3.i.i784, align 4
  %conv4.i41.i785 = zext i32 %222 to i64
  %arrayidx5.i42.i786 = getelementptr inbounds nuw i8, ptr %add.ptr.i780, i32 12
  %223 = load i32, ptr %arrayidx5.i42.i786, align 4
  %conv6.i.i787 = zext i32 %223 to i64
  %shl.i43.i788 = shl nuw nsw i64 %conv.i40.i781, 16
  %or.i44.i789 = or i64 %shl.i43.i788, %conv.i40.i781
  %shl7.i.i790 = shl nuw nsw i64 %conv2.i.i783, 16
  %or8.i.i791 = or i64 %shl7.i.i790, %conv2.i.i783
  %shl9.i.i792 = shl nuw nsw i64 %conv4.i41.i785, 16
  %or10.i.i793 = or i64 %shl9.i.i792, %conv4.i41.i785
  %shl11.i.i794 = shl nuw nsw i64 %conv6.i.i787, 16
  %or12.i45.i795 = or i64 %shl11.i.i794, %conv6.i.i787
  %and.i46.i796 = and i64 %or.i44.i789, 281470681808895
  %and13.i47.i797 = and i64 %or8.i.i791, 281470681808895
  %and14.i.i798 = and i64 %or10.i.i793, 281470681808895
  %and15.i.i799 = and i64 %or12.i45.i795, 281470681808895
  %shl16.i.i800 = shl nuw nsw i64 %and.i46.i796, 8
  %or17.i.i801 = or i64 %and.i46.i796, %shl16.i.i800
  %shl18.i.i802 = shl nuw nsw i64 %and13.i47.i797, 8
  %or19.i.i803 = or i64 %and13.i47.i797, %shl18.i.i802
  %and24.i.i804 = and i64 %or17.i.i801, 71777214294589695
  %and25.i.i805 = and i64 %or19.i.i803, 71777214294589695
  %224 = shl nuw i64 %and14.i.i798, 16
  %225 = shl nuw nsw i64 %and14.i.i798, 8
  %and26.i.i806 = or i64 %224, %225
  %shl28.i.i807 = and i64 %and26.i.i806, -71777214294589696
  %or29.i.i808 = or disjoint i64 %and24.i.i804, %shl28.i.i807
  store i64 %or29.i.i808, ptr %arrayidx.i776, align 8
  %226 = shl nuw i64 %and15.i.i799, 16
  %227 = shl nuw nsw i64 %and15.i.i799, 8
  %and27.i.i809 = or i64 %226, %227
  %shl30.i.i810 = and i64 %and27.i.i809, -71777214294589696
  %or31.i.i811 = or disjoint i64 %and25.i.i805, %shl30.i.i810
  store i64 %or31.i.i811, ptr %arrayidx1.i778, align 8
  %inc.i812 = add nuw nsw i32 %i.0.i40829, 1
  %exitcond.i41.not = icmp eq i32 %inc.i812, 4
  br i1 %exitcond.i41.not, label %for.end.i42, label %for.body.i775, !llvm.loop !45

for.end.i42:                                      ; preds = %for.body.i775
  %228 = load i64, ptr %q.i37, align 8
  %arrayidx1.i241.i43 = getelementptr inbounds nuw i8, ptr %q.i37, i32 8
  %229 = load i64, ptr %arrayidx1.i241.i43, align 8
  %and.i242.i44 = and i64 %228, 6148914691236517205
  %and2.i243.i45 = shl i64 %229, 1
  %shl.i244.i46 = and i64 %and2.i243.i45, -6148914691236517206
  %or.i245.i47 = or disjoint i64 %and.i242.i44, %shl.i244.i46
  store i64 %or.i245.i47, ptr %q.i37, align 8
  %and4.i246.i48 = lshr i64 %228, 1
  %shr.i247.i49 = and i64 %and4.i246.i48, 6148914691236517205
  %and5.i.i50 = and i64 %229, -6148914691236517206
  %or6.i248.i51 = or disjoint i64 %shr.i247.i49, %and5.i.i50
  %arrayidx7.i249.i52 = getelementptr inbounds nuw i8, ptr %q.i37, i32 8
  store i64 %or6.i248.i51, ptr %arrayidx7.i249.i52, align 8
  %arrayidx11.i250.i53 = getelementptr inbounds nuw i8, ptr %q.i37, i32 16
  %230 = load i64, ptr %arrayidx11.i250.i53, align 8
  %arrayidx12.i251.i54 = getelementptr inbounds nuw i8, ptr %q.i37, i32 24
  %231 = load i64, ptr %arrayidx12.i251.i54, align 8
  %and13.i252.i55 = and i64 %230, 6148914691236517205
  %and14.i253.i56 = shl i64 %231, 1
  %shl15.i.i57 = and i64 %and14.i253.i56, -6148914691236517206
  %or16.i.i58 = or disjoint i64 %and13.i252.i55, %shl15.i.i57
  %arrayidx17.i254.i59 = getelementptr inbounds nuw i8, ptr %q.i37, i32 16
  store i64 %or16.i.i58, ptr %arrayidx17.i254.i59, align 8
  %and18.i.i60 = lshr i64 %230, 1
  %shr19.i.i61 = and i64 %and18.i.i60, 6148914691236517205
  %and20.i.i62 = and i64 %231, -6148914691236517206
  %or21.i.i63 = or disjoint i64 %shr19.i.i61, %and20.i.i62
  %arrayidx22.i.i64 = getelementptr inbounds nuw i8, ptr %q.i37, i32 24
  store i64 %or21.i.i63, ptr %arrayidx22.i.i64, align 8
  %arrayidx27.i.i65 = getelementptr inbounds nuw i8, ptr %q.i37, i32 32
  %232 = load i64, ptr %arrayidx27.i.i65, align 8
  %arrayidx28.i255.i66 = getelementptr inbounds nuw i8, ptr %q.i37, i32 40
  %233 = load i64, ptr %arrayidx28.i255.i66, align 8
  %and29.i.i67 = and i64 %232, 6148914691236517205
  %and30.i256.i68 = shl i64 %233, 1
  %shl31.i.i69 = and i64 %and30.i256.i68, -6148914691236517206
  %or32.i257.i70 = or disjoint i64 %and29.i.i67, %shl31.i.i69
  %arrayidx33.i258.i71 = getelementptr inbounds nuw i8, ptr %q.i37, i32 32
  store i64 %or32.i257.i70, ptr %arrayidx33.i258.i71, align 8
  %and34.i259.i72 = lshr i64 %232, 1
  %shr35.i.i73 = and i64 %and34.i259.i72, 6148914691236517205
  %and36.i.i74 = and i64 %233, -6148914691236517206
  %or37.i.i75 = or disjoint i64 %shr35.i.i73, %and36.i.i74
  %arrayidx38.i.i76 = getelementptr inbounds nuw i8, ptr %q.i37, i32 40
  store i64 %or37.i.i75, ptr %arrayidx38.i.i76, align 8
  %arrayidx43.i.i77 = getelementptr inbounds nuw i8, ptr %q.i37, i32 48
  %234 = load i64, ptr %arrayidx43.i.i77, align 8
  %arrayidx44.i.i78 = getelementptr inbounds nuw i8, ptr %q.i37, i32 56
  %235 = load i64, ptr %arrayidx44.i.i78, align 8
  %and45.i.i79 = and i64 %234, 6148914691236517205
  %and46.i.i80 = shl i64 %235, 1
  %shl47.i.i81 = and i64 %and46.i.i80, -6148914691236517206
  %or48.i.i82 = or disjoint i64 %and45.i.i79, %shl47.i.i81
  %arrayidx49.i.i83 = getelementptr inbounds nuw i8, ptr %q.i37, i32 48
  store i64 %or48.i.i82, ptr %arrayidx49.i.i83, align 8
  %and50.i.i84 = lshr i64 %234, 1
  %shr51.i.i85 = and i64 %and50.i.i84, 6148914691236517205
  %and52.i.i86 = and i64 %235, -6148914691236517206
  %or53.i.i87 = or disjoint i64 %shr51.i.i85, %and52.i.i86
  %arrayidx54.i260.i88 = getelementptr inbounds nuw i8, ptr %q.i37, i32 56
  store i64 %or53.i.i87, ptr %arrayidx54.i260.i88, align 8
  %236 = load i64, ptr %q.i37, align 8
  %arrayidx60.i.i89 = getelementptr inbounds nuw i8, ptr %q.i37, i32 16
  %237 = load i64, ptr %arrayidx60.i.i89, align 8
  %and61.i.i90 = and i64 %236, 3689348814741910323
  %and62.i.i91 = shl i64 %237, 2
  %shl63.i.i92 = and i64 %and62.i.i91, -3689348814741910324
  %or64.i.i93 = or disjoint i64 %and61.i.i90, %shl63.i.i92
  store i64 %or64.i.i93, ptr %q.i37, align 8
  %and66.i261.i94 = lshr i64 %236, 2
  %shr67.i.i95 = and i64 %and66.i261.i94, 3689348814741910323
  %and68.i.i96 = and i64 %237, -3689348814741910324
  %or69.i.i97 = or disjoint i64 %shr67.i.i95, %and68.i.i96
  %arrayidx70.i.i98 = getelementptr inbounds nuw i8, ptr %q.i37, i32 16
  store i64 %or69.i.i97, ptr %arrayidx70.i.i98, align 8
  %arrayidx75.i.i99 = getelementptr inbounds nuw i8, ptr %q.i37, i32 8
  %238 = load i64, ptr %arrayidx75.i.i99, align 8
  %arrayidx76.i.i100 = getelementptr inbounds nuw i8, ptr %q.i37, i32 24
  %239 = load i64, ptr %arrayidx76.i.i100, align 8
  %and77.i262.i101 = and i64 %238, 3689348814741910323
  %and78.i263.i102 = shl i64 %239, 2
  %shl79.i.i103 = and i64 %and78.i263.i102, -3689348814741910324
  %or80.i.i104 = or disjoint i64 %and77.i262.i101, %shl79.i.i103
  %arrayidx81.i.i105 = getelementptr inbounds nuw i8, ptr %q.i37, i32 8
  store i64 %or80.i.i104, ptr %arrayidx81.i.i105, align 8
  %and82.i264.i106 = lshr i64 %238, 2
  %shr83.i.i107 = and i64 %and82.i264.i106, 3689348814741910323
  %and84.i265.i108 = and i64 %239, -3689348814741910324
  %or85.i.i109 = or disjoint i64 %shr83.i.i107, %and84.i265.i108
  %arrayidx86.i.i110 = getelementptr inbounds nuw i8, ptr %q.i37, i32 24
  store i64 %or85.i.i109, ptr %arrayidx86.i.i110, align 8
  %arrayidx91.i.i111 = getelementptr inbounds nuw i8, ptr %q.i37, i32 32
  %240 = load i64, ptr %arrayidx91.i.i111, align 8
  %arrayidx92.i.i112 = getelementptr inbounds nuw i8, ptr %q.i37, i32 48
  %241 = load i64, ptr %arrayidx92.i.i112, align 8
  %and93.i.i113 = and i64 %240, 3689348814741910323
  %and94.i.i114 = shl i64 %241, 2
  %shl95.i.i115 = and i64 %and94.i.i114, -3689348814741910324
  %or96.i.i116 = or disjoint i64 %and93.i.i113, %shl95.i.i115
  %arrayidx97.i.i117 = getelementptr inbounds nuw i8, ptr %q.i37, i32 32
  store i64 %or96.i.i116, ptr %arrayidx97.i.i117, align 8
  %and98.i.i118 = lshr i64 %240, 2
  %shr99.i.i119 = and i64 %and98.i.i118, 3689348814741910323
  %and100.i.i120 = and i64 %241, -3689348814741910324
  %or101.i.i121 = or disjoint i64 %shr99.i.i119, %and100.i.i120
  %arrayidx102.i.i122 = getelementptr inbounds nuw i8, ptr %q.i37, i32 48
  store i64 %or101.i.i121, ptr %arrayidx102.i.i122, align 8
  %arrayidx107.i.i123 = getelementptr inbounds nuw i8, ptr %q.i37, i32 40
  %242 = load i64, ptr %arrayidx107.i.i123, align 8
  %arrayidx108.i.i124 = getelementptr inbounds nuw i8, ptr %q.i37, i32 56
  %243 = load i64, ptr %arrayidx108.i.i124, align 8
  %and109.i.i125 = and i64 %242, 3689348814741910323
  %and110.i.i126 = shl i64 %243, 2
  %shl111.i.i127 = and i64 %and110.i.i126, -3689348814741910324
  %or112.i.i128 = or disjoint i64 %and109.i.i125, %shl111.i.i127
  %arrayidx113.i.i129 = getelementptr inbounds nuw i8, ptr %q.i37, i32 40
  store i64 %or112.i.i128, ptr %arrayidx113.i.i129, align 8
  %and114.i.i130 = lshr i64 %242, 2
  %shr115.i.i131 = and i64 %and114.i.i130, 3689348814741910323
  %and116.i.i132 = and i64 %243, -3689348814741910324
  %or117.i.i133 = or disjoint i64 %shr115.i.i131, %and116.i.i132
  %arrayidx118.i.i134 = getelementptr inbounds nuw i8, ptr %q.i37, i32 56
  store i64 %or117.i.i133, ptr %arrayidx118.i.i134, align 8
  %244 = load i64, ptr %q.i37, align 8
  %arrayidx124.i266.i135 = getelementptr inbounds nuw i8, ptr %q.i37, i32 32
  %245 = load i64, ptr %arrayidx124.i266.i135, align 8
  %and125.i.i136 = and i64 %244, 1085102592571150095
  %and126.i.i137 = shl i64 %245, 4
  %shl127.i.i138 = and i64 %and126.i.i137, -1085102592571150096
  %or128.i.i139 = or disjoint i64 %and125.i.i136, %shl127.i.i138
  store i64 %or128.i.i139, ptr %q.i37, align 8
  %and130.i.i140 = lshr i64 %244, 4
  %shr131.i.i141 = and i64 %and130.i.i140, 1085102592571150095
  %and132.i.i142 = and i64 %245, -1085102592571150096
  %or133.i.i143 = or disjoint i64 %shr131.i.i141, %and132.i.i142
  %arrayidx134.i.i144 = getelementptr inbounds nuw i8, ptr %q.i37, i32 32
  store i64 %or133.i.i143, ptr %arrayidx134.i.i144, align 8
  %arrayidx139.i.i145 = getelementptr inbounds nuw i8, ptr %q.i37, i32 8
  %246 = load i64, ptr %arrayidx139.i.i145, align 8
  %arrayidx140.i.i146 = getelementptr inbounds nuw i8, ptr %q.i37, i32 40
  %247 = load i64, ptr %arrayidx140.i.i146, align 8
  %and141.i.i147 = and i64 %246, 1085102592571150095
  %and142.i.i148 = shl i64 %247, 4
  %shl143.i.i149 = and i64 %and142.i.i148, -1085102592571150096
  %or144.i.i150 = or disjoint i64 %and141.i.i147, %shl143.i.i149
  %arrayidx145.i.i151 = getelementptr inbounds nuw i8, ptr %q.i37, i32 8
  store i64 %or144.i.i150, ptr %arrayidx145.i.i151, align 8
  %and146.i.i152 = lshr i64 %246, 4
  %shr147.i.i153 = and i64 %and146.i.i152, 1085102592571150095
  %and148.i.i154 = and i64 %247, -1085102592571150096
  %or149.i.i155 = or disjoint i64 %shr147.i.i153, %and148.i.i154
  %arrayidx150.i.i156 = getelementptr inbounds nuw i8, ptr %q.i37, i32 40
  store i64 %or149.i.i155, ptr %arrayidx150.i.i156, align 8
  %arrayidx155.i.i157 = getelementptr inbounds nuw i8, ptr %q.i37, i32 16
  %248 = load i64, ptr %arrayidx155.i.i157, align 8
  %arrayidx156.i.i158 = getelementptr inbounds nuw i8, ptr %q.i37, i32 48
  %249 = load i64, ptr %arrayidx156.i.i158, align 8
  %and157.i.i159 = and i64 %248, 1085102592571150095
  %and158.i.i160 = shl i64 %249, 4
  %shl159.i.i161 = and i64 %and158.i.i160, -1085102592571150096
  %or160.i.i162 = or disjoint i64 %and157.i.i159, %shl159.i.i161
  %arrayidx161.i.i163 = getelementptr inbounds nuw i8, ptr %q.i37, i32 16
  store i64 %or160.i.i162, ptr %arrayidx161.i.i163, align 8
  %and162.i.i164 = lshr i64 %248, 4
  %shr163.i.i165 = and i64 %and162.i.i164, 1085102592571150095
  %and164.i.i166 = and i64 %249, -1085102592571150096
  %or165.i.i167 = or disjoint i64 %shr163.i.i165, %and164.i.i166
  %arrayidx166.i.i168 = getelementptr inbounds nuw i8, ptr %q.i37, i32 48
  store i64 %or165.i.i167, ptr %arrayidx166.i.i168, align 8
  %arrayidx171.i.i169 = getelementptr inbounds nuw i8, ptr %q.i37, i32 24
  %250 = load i64, ptr %arrayidx171.i.i169, align 8
  %arrayidx172.i.i170 = getelementptr inbounds nuw i8, ptr %q.i37, i32 56
  %251 = load i64, ptr %arrayidx172.i.i170, align 8
  %and173.i.i171 = and i64 %250, 1085102592571150095
  %and174.i.i172 = shl i64 %251, 4
  %shl175.i.i173 = and i64 %and174.i.i172, -1085102592571150096
  %or176.i.i174 = or disjoint i64 %and173.i.i171, %shl175.i.i173
  %arrayidx177.i.i175 = getelementptr inbounds nuw i8, ptr %q.i37, i32 24
  store i64 %or176.i.i174, ptr %arrayidx177.i.i175, align 8
  %and178.i.i176 = lshr i64 %250, 4
  %shr179.i.i177 = and i64 %and178.i.i176, 1085102592571150095
  %and180.i.i178 = and i64 %251, -1085102592571150096
  %or181.i267.i179 = or disjoint i64 %shr179.i.i177, %and180.i.i178
  %arrayidx182.i.i180 = getelementptr inbounds nuw i8, ptr %q.i37, i32 56
  store i64 %or181.i267.i179, ptr %arrayidx182.i.i180, align 8
  %252 = load i64, ptr %0, align 8
  %253 = load i64, ptr %q.i37, align 8
  %xor.i.i181 = xor i64 %253, %252
  store i64 %xor.i.i181, ptr %q.i37, align 8
  %arrayidx2.i48.i182 = getelementptr inbounds nuw i8, ptr %0, i32 8
  %254 = load i64, ptr %arrayidx2.i48.i182, align 8
  %arrayidx3.i49.i183 = getelementptr inbounds nuw i8, ptr %q.i37, i32 8
  %255 = load i64, ptr %arrayidx3.i49.i183, align 8
  %xor4.i.i184 = xor i64 %255, %254
  store i64 %xor4.i.i184, ptr %arrayidx3.i49.i183, align 8
  %arrayidx5.i50.i185 = getelementptr inbounds nuw i8, ptr %0, i32 16
  %256 = load i64, ptr %arrayidx5.i50.i185, align 8
  %arrayidx6.i.i186 = getelementptr inbounds nuw i8, ptr %q.i37, i32 16
  %257 = load i64, ptr %arrayidx6.i.i186, align 8
  %xor7.i.i187 = xor i64 %257, %256
  store i64 %xor7.i.i187, ptr %arrayidx6.i.i186, align 8
  %arrayidx8.i51.i188 = getelementptr inbounds nuw i8, ptr %0, i32 24
  %258 = load i64, ptr %arrayidx8.i51.i188, align 8
  %arrayidx9.i.i189 = getelementptr inbounds nuw i8, ptr %q.i37, i32 24
  %259 = load i64, ptr %arrayidx9.i.i189, align 8
  %xor10.i.i190 = xor i64 %259, %258
  store i64 %xor10.i.i190, ptr %arrayidx9.i.i189, align 8
  %arrayidx11.i.i191 = getelementptr inbounds nuw i8, ptr %0, i32 32
  %260 = load i64, ptr %arrayidx11.i.i191, align 8
  %arrayidx12.i.i192 = getelementptr inbounds nuw i8, ptr %q.i37, i32 32
  %261 = load i64, ptr %arrayidx12.i.i192, align 8
  %xor13.i.i193 = xor i64 %261, %260
  store i64 %xor13.i.i193, ptr %arrayidx12.i.i192, align 8
  %arrayidx14.i.i194 = getelementptr inbounds nuw i8, ptr %0, i32 40
  %262 = load i64, ptr %arrayidx14.i.i194, align 8
  %arrayidx15.i.i195 = getelementptr inbounds nuw i8, ptr %q.i37, i32 40
  %263 = load i64, ptr %arrayidx15.i.i195, align 8
  %xor16.i.i196 = xor i64 %263, %262
  store i64 %xor16.i.i196, ptr %arrayidx15.i.i195, align 8
  %arrayidx17.i.i197 = getelementptr inbounds nuw i8, ptr %0, i32 48
  %264 = load i64, ptr %arrayidx17.i.i197, align 8
  %arrayidx18.i.i198 = getelementptr inbounds nuw i8, ptr %q.i37, i32 48
  %265 = load i64, ptr %arrayidx18.i.i198, align 8
  %xor19.i.i199 = xor i64 %265, %264
  store i64 %xor19.i.i199, ptr %arrayidx18.i.i198, align 8
  %arrayidx20.i.i200 = getelementptr inbounds nuw i8, ptr %0, i32 56
  %266 = load i64, ptr %arrayidx20.i.i200, align 8
  %arrayidx21.i.i201 = getelementptr inbounds nuw i8, ptr %q.i37, i32 56
  %267 = load i64, ptr %arrayidx21.i.i201, align 8
  %xor22.i.i202 = xor i64 %267, %266
  store i64 %xor22.i.i202, ptr %arrayidx21.i.i201, align 8
  br label %for.body7.i573

for.body7.i573:                                   ; preds = %for.end.i42, %shift_rows.exit28.i696
  %i.1.i204831 = phi i32 [ 1, %for.end.i42 ], [ %inc15.i751, %shift_rows.exit28.i696 ]
  %arrayidx.i122.i574 = getelementptr inbounds nuw i8, ptr %q.i37, i32 56
  %268 = load i64, ptr %arrayidx.i122.i574, align 8
  %arrayidx1.i123.i575 = getelementptr inbounds nuw i8, ptr %q.i37, i32 48
  %269 = load i64, ptr %arrayidx1.i123.i575, align 8
  %arrayidx2.i124.i576 = getelementptr inbounds nuw i8, ptr %q.i37, i32 40
  %270 = load i64, ptr %arrayidx2.i124.i576, align 8
  %arrayidx3.i125.i577 = getelementptr inbounds nuw i8, ptr %q.i37, i32 32
  %271 = load i64, ptr %arrayidx3.i125.i577, align 8
  %arrayidx4.i126.i578 = getelementptr inbounds nuw i8, ptr %q.i37, i32 24
  %272 = load i64, ptr %arrayidx4.i126.i578, align 8
  %arrayidx5.i127.i579 = getelementptr inbounds nuw i8, ptr %q.i37, i32 16
  %273 = load i64, ptr %arrayidx5.i127.i579, align 8
  %arrayidx6.i128.i580 = getelementptr inbounds nuw i8, ptr %q.i37, i32 8
  %274 = load i64, ptr %arrayidx6.i128.i580, align 8
  %275 = load i64, ptr %q.i37, align 8
  %xor.i129.i581 = xor i64 %271, %273
  %xor8.i130.i582 = xor i64 %268, %274
  %xor9.i131.i583 = xor i64 %268, %271
  %xor10.i132.i584 = xor i64 %268, %273
  %xor11.i133.i585 = xor i64 %269, %270
  %xor12.i134.i586 = xor i64 %xor11.i133.i585, %275
  %xor13.i135.i587 = xor i64 %xor12.i134.i586, %271
  %xor14.i136.i588 = xor i64 %xor8.i130.i582, %xor.i129.i581
  %xor15.i137.i589 = xor i64 %xor12.i134.i586, %268
  %xor16.i138.i590 = xor i64 %xor12.i134.i586, %274
  %xor17.i139.i591 = xor i64 %xor16.i138.i590, %xor10.i132.i584
  %xor18.i140.i592 = xor i64 %272, %xor14.i136.i588
  %xor19.i141.i593 = xor i64 %xor18.i140.i592, %273
  %xor20.i142.i594 = xor i64 %xor18.i140.i592, %269
  %xor21.i143.i595 = xor i64 %xor19.i141.i593, %275
  %xor22.i144.i596 = xor i64 %xor19.i141.i593, %xor11.i133.i585
  %xor23.i145.i597 = xor i64 %xor20.i142.i594, %xor9.i131.i583
  %xor24.i146.i598 = xor i64 %275, %xor23.i145.i597
  %xor25.i147.i599 = xor i64 %xor22.i144.i596, %xor23.i145.i597
  %xor27.i148.i600 = xor i64 %xor11.i133.i585, %xor23.i145.i597
  %and.i149.i601 = and i64 %xor14.i136.i588, %xor19.i141.i593
  %and30.i150.i602 = and i64 %xor17.i139.i591, %xor21.i143.i595
  %xor31.i151.i603 = xor i64 %and30.i150.i602, %and.i149.i601
  %and32.i152.i604 = and i64 %xor13.i135.i587, %275
  %and34.i153.i605 = and i64 %xor8.i130.i582, %xor27.i148.i600
  %and35.i154.i606 = and i64 %xor16.i138.i590, %xor12.i134.i586
  %and37.i155.i607 = and i64 %xor15.i137.i589, %xor24.i146.i598
  %and39.i156.i608 = and i64 %xor9.i131.i583, %xor23.i145.i597
  %and40.i157.i609 = and i64 %xor.i129.i581, %xor25.i147.i599
  %xor41.i158.i610 = xor i64 %and40.i157.i609, %and39.i156.i608
  %and42.i159.i611 = and i64 %xor10.i132.i584, %xor22.i144.i596
  %xor43.i160.i612 = xor i64 %and42.i159.i611, %and39.i156.i608
  %xor44.i161.i613 = xor i64 %xor31.i151.i603, %xor41.i158.i610
  %xor48.i162.i614 = xor i64 %xor44.i161.i613, %xor20.i142.i594
  %276 = xor i64 %xor10.i132.i584, %and32.i152.i604
  %277 = xor i64 %276, %xor22.i144.i596
  %278 = xor i64 %277, %and.i149.i601
  %xor49.i163.i615 = xor i64 %278, %xor43.i160.i612
  %279 = xor i64 %xor27.i148.i600, %and35.i154.i606
  %280 = xor i64 %279, %xor8.i130.i582
  %281 = xor i64 %280, %and34.i153.i605
  %xor50.i164.i616 = xor i64 %281, %xor41.i158.i610
  %282 = xor i64 %xor27.i148.i600, %and37.i155.i607
  %283 = xor i64 %282, %268
  %284 = xor i64 %283, %and34.i153.i605
  %xor51.i165.i617 = xor i64 %284, %xor43.i160.i612
  %xor52.i166.i618 = xor i64 %xor48.i162.i614, %xor49.i163.i615
  %and53.i167.i619 = and i64 %xor48.i162.i614, %xor50.i164.i616
  %xor54.i168.i620 = xor i64 %xor51.i165.i617, %and53.i167.i619
  %and55.i169.i621 = and i64 %xor52.i166.i618, %xor54.i168.i620
  %xor56.i170.i622 = xor i64 %and55.i169.i621, %xor49.i163.i615
  %xor57.i171.i623 = xor i64 %xor50.i164.i616, %xor51.i165.i617
  %xor58.i172.i624 = xor i64 %xor49.i163.i615, %and53.i167.i619
  %and59.i173.i625 = and i64 %xor58.i172.i624, %xor57.i171.i623
  %xor60.i174.i626 = xor i64 %and59.i173.i625, %xor51.i165.i617
  %xor61.i175.i627 = xor i64 %xor50.i164.i616, %xor60.i174.i626
  %xor62.i176.i628 = xor i64 %and59.i173.i625, %and53.i167.i619
  %and63.i177.i629 = and i64 %xor51.i165.i617, %xor62.i176.i628
  %xor64.i178.i630 = xor i64 %and63.i177.i629, %xor61.i175.i627
  %xor65.i179.i631 = xor i64 %xor54.i168.i620, %and63.i177.i629
  %and66.i180.i632 = and i64 %xor56.i170.i622, %xor65.i179.i631
  %xor67.i181.i633 = xor i64 %xor52.i166.i618, %and66.i180.i632
  %xor68.i182.i634 = xor i64 %xor67.i181.i633, %xor64.i178.i630
  %xor69.i183.i635 = xor i64 %xor56.i170.i622, %xor60.i174.i626
  %xor70.i184.i636 = xor i64 %xor56.i170.i622, %xor67.i181.i633
  %xor71.i185.i637 = xor i64 %and63.i177.i629, %xor50.i164.i616
  %xor72.i186.i638 = xor i64 %xor69.i183.i635, %xor68.i182.i634
  %and73.i187.i639 = and i64 %xor71.i185.i637, %xor19.i141.i593
  %and74.i188.i640 = and i64 %xor64.i178.i630, %xor21.i143.i595
  %and75.i189.i641 = and i64 %xor60.i174.i626, %275
  %and76.i190.i642 = and i64 %xor70.i184.i636, %xor27.i148.i600
  %and77.i191.i643 = and i64 %xor67.i181.i633, %xor12.i134.i586
  %and78.i192.i644 = and i64 %xor56.i170.i622, %xor24.i146.i598
  %and79.i193.i645 = and i64 %xor69.i183.i635, %xor23.i145.i597
  %and80.i194.i646 = and i64 %xor72.i186.i638, %xor25.i147.i599
  %and81.i195.i647 = and i64 %xor68.i182.i634, %xor22.i144.i596
  %and82.i196.i648 = and i64 %xor71.i185.i637, %xor14.i136.i588
  %and83.i197.i649 = and i64 %xor64.i178.i630, %xor17.i139.i591
  %and84.i198.i650 = and i64 %xor60.i174.i626, %xor13.i135.i587
  %and85.i199.i651 = and i64 %xor70.i184.i636, %xor8.i130.i582
  %and86.i200.i652 = and i64 %xor67.i181.i633, %xor16.i138.i590
  %and87.i201.i653 = and i64 %xor56.i170.i622, %xor15.i137.i589
  %and88.i202.i654 = and i64 %xor69.i183.i635, %xor9.i131.i583
  %and89.i203.i655 = and i64 %xor72.i186.i638, %xor.i129.i581
  %and90.i204.i656 = and i64 %xor68.i182.i634, %xor10.i132.i584
  %xor91.i205.i657 = xor i64 %and88.i202.i654, %and89.i203.i655
  %xor92.i206.i658 = xor i64 %and83.i197.i649, %and84.i198.i650
  %xor93.i207.i659 = xor i64 %and78.i192.i644, %and86.i200.i652
  %xor94.i208.i660 = xor i64 %and82.i196.i648, %and83.i197.i649
  %xor95.i209.i661 = xor i64 %and75.i189.i641, %and85.i199.i651
  %xor96.i210.i662 = xor i64 %and75.i189.i641, %and78.i192.i644
  %xor97.i211.i663 = xor i64 %and80.i194.i646, %and81.i195.i647
  %xor98.i212.i664 = xor i64 %and73.i187.i639, %and76.i190.i642
  %xor99.i213.i665 = xor i64 %and79.i193.i645, %and80.i194.i646
  %xor100.i214.i666 = xor i64 %and89.i203.i655, %and90.i204.i656
  %xor101.i215.i667 = xor i64 %and85.i199.i651, %xor93.i207.i659
  %xor102.i216.i668 = xor i64 %xor95.i209.i661, %xor98.i212.i664
  %xor103.i217.i669 = xor i64 %and77.i191.i643, %xor91.i205.i657
  %xor104.i218.i670 = xor i64 %and76.i190.i642, %xor99.i213.i665
  %xor105.i219.i671 = xor i64 %xor91.i205.i657, %xor102.i216.i668
  %xor106.i220.i672 = xor i64 %and87.i201.i653, %xor102.i216.i668
  %xor107.i221.i673 = xor i64 %xor97.i211.i663, %xor103.i217.i669
  %xor108.i222.i674 = xor i64 %xor94.i208.i660, %xor103.i217.i669
  %xor109.i223.i675 = xor i64 %and77.i191.i643, %xor104.i218.i670
  %xor110.i224.i676 = xor i64 %xor106.i220.i672, %xor107.i221.i673
  %xor111.i225.i677 = xor i64 %and74.i188.i640, %xor108.i222.i674
  %xor112.i226.i678 = xor i64 %xor104.i218.i670, %xor108.i222.i674
  %285 = xor i64 %xor107.i221.i673, %xor101.i215.i667
  %xor113.i227.i679 = xor i64 %285, -1
  %286 = xor i64 %xor105.i219.i671, %xor93.i207.i659
  %xor115.i228.i680 = xor i64 %286, -1
  %xor117.i229.i681 = xor i64 %xor98.i212.i664, %xor111.i225.i677
  %xor118.i230.i682 = xor i64 %xor96.i210.i662, %xor111.i225.i677
  %xor119.i231.i683 = xor i64 %xor92.i206.i658, %xor110.i224.i676
  %287 = xor i64 %xor117.i229.i681, %xor109.i223.i675
  %xor121.i232.i684 = xor i64 %287, -1
  %288 = xor i64 %xor110.i224.i676, %xor100.i214.i666
  %289 = xor i64 %288, %xor109.i223.i675
  %xor123.i233.i685 = xor i64 %289, -1
  %arrayidx124.i234.i686 = getelementptr inbounds nuw i8, ptr %q.i37, i32 56
  store i64 %xor112.i226.i678, ptr %arrayidx124.i234.i686, align 8
  %arrayidx125.i235.i687 = getelementptr inbounds nuw i8, ptr %q.i37, i32 48
  store i64 %xor121.i232.i684, ptr %arrayidx125.i235.i687, align 8
  %arrayidx126.i236.i688 = getelementptr inbounds nuw i8, ptr %q.i37, i32 40
  store i64 %xor123.i233.i685, ptr %arrayidx126.i236.i688, align 8
  %arrayidx127.i237.i689 = getelementptr inbounds nuw i8, ptr %q.i37, i32 32
  store i64 %xor117.i229.i681, ptr %arrayidx127.i237.i689, align 8
  %arrayidx128.i238.i690 = getelementptr inbounds nuw i8, ptr %q.i37, i32 24
  store i64 %xor118.i230.i682, ptr %arrayidx128.i238.i690, align 8
  %arrayidx129.i239.i691 = getelementptr inbounds nuw i8, ptr %q.i37, i32 16
  store i64 %xor119.i231.i683, ptr %arrayidx129.i239.i691, align 8
  %arrayidx130.i240.i692 = getelementptr inbounds nuw i8, ptr %q.i37, i32 8
  store i64 %xor113.i227.i679, ptr %arrayidx130.i240.i692, align 8
  store i64 %xor115.i228.i680, ptr %q.i37, align 8
  br label %for.body.i5.i752

for.body.i5.i752:                                 ; preds = %for.body7.i573, %for.body.i5.i752
  %i.0.i3.i694830 = phi i32 [ 0, %for.body7.i573 ], [ %inc.i27.i774, %for.body.i5.i752 ]
  %arrayidx.i6.i753 = getelementptr inbounds nuw i64, ptr %q.i37, i32 %i.0.i3.i694830
  %290 = load i64, ptr %arrayidx.i6.i753, align 8
  %and.i7.i754 = and i64 %290, 65535
  %and1.i8.i755 = lshr i64 %290, 4
  %shr.i9.i756 = and i64 %and1.i8.i755, 268369920
  %or.i10.i757 = or disjoint i64 %and.i7.i754, %shr.i9.i756
  %and2.i11.i758 = shl i64 %290, 12
  %shl.i12.i759 = and i64 %and2.i11.i758, 4026531840
  %or3.i13.i760 = or disjoint i64 %or.i10.i757, %shl.i12.i759
  %and4.i14.i761 = lshr i64 %290, 8
  %shr5.i15.i762 = and i64 %and4.i14.i761, 1095216660480
  %or6.i16.i763 = or disjoint i64 %or3.i13.i760, %shr5.i15.i762
  %and7.i17.i764 = shl i64 %290, 8
  %shl8.i18.i765 = and i64 %and7.i17.i764, 280375465082880
  %or9.i19.i766 = or disjoint i64 %or6.i16.i763, %shl8.i18.i765
  %and10.i20.i767 = lshr i64 %290, 12
  %shr11.i21.i768 = and i64 %and10.i20.i767, 4222124650659840
  %or12.i22.i769 = or disjoint i64 %or9.i19.i766, %shr11.i21.i768
  %and13.i23.i770 = shl i64 %290, 4
  %shl14.i24.i771 = and i64 %and13.i23.i770, -4503599627370496
  %or15.i25.i772 = or i64 %or12.i22.i769, %shl14.i24.i771
  %arrayidx16.i26.i773 = getelementptr inbounds nuw i64, ptr %q.i37, i32 %i.0.i3.i694830
  store i64 %or15.i25.i772, ptr %arrayidx16.i26.i773, align 8
  %inc.i27.i774 = add nuw nsw i32 %i.0.i3.i694830, 1
  %exitcond.i4.i695.not = icmp eq i32 %inc.i27.i774, 8
  br i1 %exitcond.i4.i695.not, label %shift_rows.exit28.i696, label %for.body.i5.i752, !llvm.loop !46

shift_rows.exit28.i696:                           ; preds = %for.body.i5.i752
  %291 = load i64, ptr %q.i37, align 8
  %arrayidx1.i96.i697 = getelementptr inbounds nuw i8, ptr %q.i37, i32 8
  %292 = load i64, ptr %arrayidx1.i96.i697, align 8
  %arrayidx2.i97.i698 = getelementptr inbounds nuw i8, ptr %q.i37, i32 16
  %293 = load i64, ptr %arrayidx2.i97.i698, align 8
  %arrayidx3.i98.i699 = getelementptr inbounds nuw i8, ptr %q.i37, i32 24
  %294 = load i64, ptr %arrayidx3.i98.i699, align 8
  %arrayidx4.i.i700 = getelementptr inbounds nuw i8, ptr %q.i37, i32 32
  %295 = load i64, ptr %arrayidx4.i.i700, align 8
  %arrayidx5.i99.i701 = getelementptr inbounds nuw i8, ptr %q.i37, i32 40
  %296 = load i64, ptr %arrayidx5.i99.i701, align 8
  %arrayidx6.i100.i702 = getelementptr inbounds nuw i8, ptr %q.i37, i32 48
  %297 = load i64, ptr %arrayidx6.i100.i702, align 8
  %arrayidx7.i.i703 = getelementptr inbounds nuw i8, ptr %q.i37, i32 56
  %298 = load i64, ptr %arrayidx7.i.i703, align 8
  %299 = call i64 @llvm.fshl.i64(i64 %291, i64 %291, i64 48)
  %300 = call i64 @llvm.fshl.i64(i64 %292, i64 %292, i64 48)
  %301 = call i64 @llvm.fshl.i64(i64 %293, i64 %293, i64 48)
  %302 = call i64 @llvm.fshl.i64(i64 %294, i64 %294, i64 48)
  %303 = call i64 @llvm.fshl.i64(i64 %295, i64 %295, i64 48)
  %304 = call i64 @llvm.fshl.i64(i64 %296, i64 %296, i64 48)
  %305 = call i64 @llvm.fshl.i64(i64 %297, i64 %297, i64 48)
  %306 = call i64 @llvm.fshl.i64(i64 %298, i64 %298, i64 48)
  %xor30.i.i704 = xor i64 %291, %299
  %307 = call i64 @llvm.fshl.i64(i64 %xor30.i.i704, i64 %xor30.i.i704, i64 32)
  %308 = xor i64 %306, %307
  %309 = xor i64 %308, %298
  %xor31.i.i705 = xor i64 %309, %299
  store i64 %xor31.i.i705, ptr %q.i37, align 8
  %xor37.i.i706 = xor i64 %292, %300
  %310 = call i64 @llvm.fshl.i64(i64 %xor37.i.i706, i64 %xor37.i.i706, i64 32)
  %311 = xor i64 %299, %310
  %312 = xor i64 %311, %291
  %313 = xor i64 %312, %298
  %314 = xor i64 %313, %306
  %xor39.i.i707 = xor i64 %314, %300
  %arrayidx40.i.i708 = getelementptr inbounds nuw i8, ptr %q.i37, i32 8
  store i64 %xor39.i.i707, ptr %arrayidx40.i.i708, align 8
  %xor43.i.i709 = xor i64 %293, %301
  %315 = call i64 @llvm.fshl.i64(i64 %xor43.i.i709, i64 %xor43.i.i709, i64 32)
  %316 = xor i64 %300, %315
  %317 = xor i64 %316, %292
  %xor45.i.i710 = xor i64 %317, %301
  %arrayidx46.i.i711 = getelementptr inbounds nuw i8, ptr %q.i37, i32 16
  store i64 %xor45.i.i710, ptr %arrayidx46.i.i711, align 8
  %xor51.i.i712 = xor i64 %294, %302
  %318 = call i64 @llvm.fshl.i64(i64 %xor51.i.i712, i64 %xor51.i.i712, i64 32)
  %319 = xor i64 %301, %318
  %320 = xor i64 %319, %293
  %321 = xor i64 %320, %298
  %322 = xor i64 %321, %306
  %xor53.i.i713 = xor i64 %322, %302
  %arrayidx54.i.i714 = getelementptr inbounds nuw i8, ptr %q.i37, i32 24
  store i64 %xor53.i.i713, ptr %arrayidx54.i.i714, align 8
  %xor59.i.i715 = xor i64 %295, %303
  %323 = call i64 @llvm.fshl.i64(i64 %xor59.i.i715, i64 %xor59.i.i715, i64 32)
  %324 = xor i64 %302, %323
  %325 = xor i64 %324, %294
  %326 = xor i64 %325, %298
  %327 = xor i64 %326, %306
  %xor61.i.i716 = xor i64 %327, %303
  %arrayidx62.i.i717 = getelementptr inbounds nuw i8, ptr %q.i37, i32 32
  store i64 %xor61.i.i716, ptr %arrayidx62.i.i717, align 8
  %xor65.i.i718 = xor i64 %296, %304
  %328 = call i64 @llvm.fshl.i64(i64 %xor65.i.i718, i64 %xor65.i.i718, i64 32)
  %329 = xor i64 %303, %328
  %330 = xor i64 %329, %295
  %xor67.i.i719 = xor i64 %330, %304
  %arrayidx68.i.i720 = getelementptr inbounds nuw i8, ptr %q.i37, i32 40
  store i64 %xor67.i.i719, ptr %arrayidx68.i.i720, align 8
  %xor71.i.i721 = xor i64 %297, %305
  %331 = call i64 @llvm.fshl.i64(i64 %xor71.i.i721, i64 %xor71.i.i721, i64 32)
  %332 = xor i64 %304, %331
  %333 = xor i64 %332, %296
  %xor73.i.i722 = xor i64 %333, %305
  %arrayidx74.i.i723 = getelementptr inbounds nuw i8, ptr %q.i37, i32 48
  store i64 %xor73.i.i722, ptr %arrayidx74.i.i723, align 8
  %xor77.i.i724 = xor i64 %298, %306
  %334 = call i64 @llvm.fshl.i64(i64 %xor77.i.i724, i64 %xor77.i.i724, i64 32)
  %335 = xor i64 %305, %334
  %336 = xor i64 %335, %297
  %xor79.i.i725 = xor i64 %336, %306
  %arrayidx80.i.i726 = getelementptr inbounds nuw i8, ptr %q.i37, i32 56
  store i64 %xor79.i.i725, ptr %arrayidx80.i.i726, align 8
  %add.ptr13.idx.i727 = shl nuw nsw i32 %i.1.i204831, 6
  %add.ptr13.i728 = getelementptr inbounds nuw i8, ptr %0, i32 %add.ptr13.idx.i727
  %337 = load i64, ptr %add.ptr13.i728, align 8
  %338 = load i64, ptr %q.i37, align 8
  %xor.i74.i729 = xor i64 %338, %337
  store i64 %xor.i74.i729, ptr %q.i37, align 8
  %arrayidx2.i75.i730 = getelementptr inbounds nuw i8, ptr %add.ptr13.i728, i32 8
  %339 = load i64, ptr %arrayidx2.i75.i730, align 8
  %arrayidx3.i76.i731 = getelementptr inbounds nuw i8, ptr %q.i37, i32 8
  %340 = load i64, ptr %arrayidx3.i76.i731, align 8
  %xor4.i77.i732 = xor i64 %340, %339
  store i64 %xor4.i77.i732, ptr %arrayidx3.i76.i731, align 8
  %arrayidx5.i78.i733 = getelementptr inbounds nuw i8, ptr %add.ptr13.i728, i32 16
  %341 = load i64, ptr %arrayidx5.i78.i733, align 8
  %arrayidx6.i79.i734 = getelementptr inbounds nuw i8, ptr %q.i37, i32 16
  %342 = load i64, ptr %arrayidx6.i79.i734, align 8
  %xor7.i80.i735 = xor i64 %342, %341
  store i64 %xor7.i80.i735, ptr %arrayidx6.i79.i734, align 8
  %arrayidx8.i81.i736 = getelementptr inbounds nuw i8, ptr %add.ptr13.i728, i32 24
  %343 = load i64, ptr %arrayidx8.i81.i736, align 8
  %arrayidx9.i82.i737 = getelementptr inbounds nuw i8, ptr %q.i37, i32 24
  %344 = load i64, ptr %arrayidx9.i82.i737, align 8
  %xor10.i83.i738 = xor i64 %344, %343
  store i64 %xor10.i83.i738, ptr %arrayidx9.i82.i737, align 8
  %arrayidx11.i84.i739 = getelementptr inbounds nuw i8, ptr %add.ptr13.i728, i32 32
  %345 = load i64, ptr %arrayidx11.i84.i739, align 8
  %arrayidx12.i85.i740 = getelementptr inbounds nuw i8, ptr %q.i37, i32 32
  %346 = load i64, ptr %arrayidx12.i85.i740, align 8
  %xor13.i86.i741 = xor i64 %346, %345
  store i64 %xor13.i86.i741, ptr %arrayidx12.i85.i740, align 8
  %arrayidx14.i87.i742 = getelementptr inbounds nuw i8, ptr %add.ptr13.i728, i32 40
  %347 = load i64, ptr %arrayidx14.i87.i742, align 8
  %arrayidx15.i88.i743 = getelementptr inbounds nuw i8, ptr %q.i37, i32 40
  %348 = load i64, ptr %arrayidx15.i88.i743, align 8
  %xor16.i89.i744 = xor i64 %348, %347
  store i64 %xor16.i89.i744, ptr %arrayidx15.i88.i743, align 8
  %arrayidx17.i90.i745 = getelementptr inbounds nuw i8, ptr %add.ptr13.i728, i32 48
  %349 = load i64, ptr %arrayidx17.i90.i745, align 8
  %arrayidx18.i91.i746 = getelementptr inbounds nuw i8, ptr %q.i37, i32 48
  %350 = load i64, ptr %arrayidx18.i91.i746, align 8
  %xor19.i92.i747 = xor i64 %350, %349
  store i64 %xor19.i92.i747, ptr %arrayidx18.i91.i746, align 8
  %arrayidx20.i93.i748 = getelementptr inbounds nuw i8, ptr %add.ptr13.i728, i32 56
  %351 = load i64, ptr %arrayidx20.i93.i748, align 8
  %arrayidx21.i94.i749 = getelementptr inbounds nuw i8, ptr %q.i37, i32 56
  %352 = load i64, ptr %arrayidx21.i94.i749, align 8
  %xor22.i95.i750 = xor i64 %352, %351
  store i64 %xor22.i95.i750, ptr %arrayidx21.i94.i749, align 8
  %inc15.i751 = add nuw nsw i32 %i.1.i204831, 1
  %exitcond1.i205.not = icmp eq i32 %inc15.i751, 10
  br i1 %exitcond1.i205.not, label %for.end16.i206, label %for.body7.i573, !llvm.loop !47

for.end16.i206:                                   ; preds = %shift_rows.exit28.i696
  %arrayidx.i101.i207 = getelementptr inbounds nuw i8, ptr %q.i37, i32 56
  %353 = load i64, ptr %arrayidx.i101.i207, align 8
  %arrayidx1.i102.i208 = getelementptr inbounds nuw i8, ptr %q.i37, i32 48
  %354 = load i64, ptr %arrayidx1.i102.i208, align 8
  %arrayidx2.i103.i209 = getelementptr inbounds nuw i8, ptr %q.i37, i32 40
  %355 = load i64, ptr %arrayidx2.i103.i209, align 8
  %arrayidx3.i104.i210 = getelementptr inbounds nuw i8, ptr %q.i37, i32 32
  %356 = load i64, ptr %arrayidx3.i104.i210, align 8
  %arrayidx4.i105.i211 = getelementptr inbounds nuw i8, ptr %q.i37, i32 24
  %357 = load i64, ptr %arrayidx4.i105.i211, align 8
  %arrayidx5.i106.i212 = getelementptr inbounds nuw i8, ptr %q.i37, i32 16
  %358 = load i64, ptr %arrayidx5.i106.i212, align 8
  %arrayidx6.i107.i213 = getelementptr inbounds nuw i8, ptr %q.i37, i32 8
  %359 = load i64, ptr %arrayidx6.i107.i213, align 8
  %360 = load i64, ptr %q.i37, align 8
  %xor.i108.i214 = xor i64 %356, %358
  %xor8.i.i215 = xor i64 %353, %359
  %xor9.i.i216 = xor i64 %353, %356
  %xor10.i109.i217 = xor i64 %353, %358
  %xor11.i.i218 = xor i64 %354, %355
  %xor12.i.i219 = xor i64 %xor11.i.i218, %360
  %xor13.i110.i220 = xor i64 %xor12.i.i219, %356
  %xor14.i.i221 = xor i64 %xor8.i.i215, %xor.i108.i214
  %xor15.i.i222 = xor i64 %xor12.i.i219, %353
  %xor16.i111.i223 = xor i64 %xor12.i.i219, %359
  %xor17.i.i224 = xor i64 %xor16.i111.i223, %xor10.i109.i217
  %xor18.i.i225 = xor i64 %357, %xor14.i.i221
  %xor19.i112.i226 = xor i64 %xor18.i.i225, %358
  %xor20.i.i227 = xor i64 %xor18.i.i225, %354
  %xor21.i.i228 = xor i64 %xor19.i112.i226, %360
  %xor22.i113.i229 = xor i64 %xor19.i112.i226, %xor11.i.i218
  %xor23.i.i230 = xor i64 %xor20.i.i227, %xor9.i.i216
  %xor24.i.i231 = xor i64 %360, %xor23.i.i230
  %xor25.i.i232 = xor i64 %xor22.i113.i229, %xor23.i.i230
  %xor27.i.i233 = xor i64 %xor11.i.i218, %xor23.i.i230
  %and.i114.i234 = and i64 %xor14.i.i221, %xor19.i112.i226
  %and30.i.i235 = and i64 %xor17.i.i224, %xor21.i.i228
  %xor31.i115.i236 = xor i64 %and30.i.i235, %and.i114.i234
  %and32.i.i237 = and i64 %xor13.i110.i220, %360
  %and34.i.i238 = and i64 %xor8.i.i215, %xor27.i.i233
  %and35.i.i239 = and i64 %xor16.i111.i223, %xor12.i.i219
  %and37.i.i240 = and i64 %xor15.i.i222, %xor24.i.i231
  %and39.i.i241 = and i64 %xor9.i.i216, %xor23.i.i230
  %and40.i.i242 = and i64 %xor.i108.i214, %xor25.i.i232
  %xor41.i.i243 = xor i64 %and40.i.i242, %and39.i.i241
  %and42.i.i244 = and i64 %xor10.i109.i217, %xor22.i113.i229
  %xor43.i116.i245 = xor i64 %and42.i.i244, %and39.i.i241
  %xor44.i.i246 = xor i64 %xor31.i115.i236, %xor41.i.i243
  %xor48.i.i247 = xor i64 %xor44.i.i246, %xor20.i.i227
  %361 = xor i64 %xor10.i109.i217, %and32.i.i237
  %362 = xor i64 %361, %xor22.i113.i229
  %363 = xor i64 %362, %and.i114.i234
  %xor49.i.i248 = xor i64 %363, %xor43.i116.i245
  %364 = xor i64 %xor27.i.i233, %and35.i.i239
  %365 = xor i64 %364, %xor8.i.i215
  %366 = xor i64 %365, %and34.i.i238
  %xor50.i.i249 = xor i64 %366, %xor41.i.i243
  %367 = xor i64 %xor27.i.i233, %and37.i.i240
  %368 = xor i64 %367, %353
  %369 = xor i64 %368, %and34.i.i238
  %xor51.i117.i250 = xor i64 %369, %xor43.i116.i245
  %xor52.i.i251 = xor i64 %xor48.i.i247, %xor49.i.i248
  %and53.i.i252 = and i64 %xor48.i.i247, %xor50.i.i249
  %xor54.i.i253 = xor i64 %xor51.i117.i250, %and53.i.i252
  %and55.i.i254 = and i64 %xor52.i.i251, %xor54.i.i253
  %xor56.i.i255 = xor i64 %and55.i.i254, %xor49.i.i248
  %xor57.i.i256 = xor i64 %xor50.i.i249, %xor51.i117.i250
  %xor58.i.i257 = xor i64 %xor49.i.i248, %and53.i.i252
  %and59.i.i258 = and i64 %xor58.i.i257, %xor57.i.i256
  %xor60.i.i259 = xor i64 %and59.i.i258, %xor51.i117.i250
  %xor61.i118.i260 = xor i64 %xor50.i.i249, %xor60.i.i259
  %xor62.i.i261 = xor i64 %and59.i.i258, %and53.i.i252
  %and63.i.i262 = and i64 %xor51.i117.i250, %xor62.i.i261
  %xor64.i.i263 = xor i64 %and63.i.i262, %xor61.i118.i260
  %xor65.i119.i264 = xor i64 %xor54.i.i253, %and63.i.i262
  %and66.i.i265 = and i64 %xor56.i.i255, %xor65.i119.i264
  %xor67.i120.i266 = xor i64 %xor52.i.i251, %and66.i.i265
  %xor68.i.i267 = xor i64 %xor67.i120.i266, %xor64.i.i263
  %xor69.i.i268 = xor i64 %xor56.i.i255, %xor60.i.i259
  %xor70.i.i269 = xor i64 %xor56.i.i255, %xor67.i120.i266
  %xor71.i121.i270 = xor i64 %and63.i.i262, %xor50.i.i249
  %xor72.i.i271 = xor i64 %xor69.i.i268, %xor68.i.i267
  %and73.i.i272 = and i64 %xor71.i121.i270, %xor19.i112.i226
  %and74.i.i273 = and i64 %xor64.i.i263, %xor21.i.i228
  %and75.i.i274 = and i64 %xor60.i.i259, %360
  %and76.i.i275 = and i64 %xor70.i.i269, %xor27.i.i233
  %and77.i.i276 = and i64 %xor67.i120.i266, %xor12.i.i219
  %and78.i.i277 = and i64 %xor56.i.i255, %xor24.i.i231
  %and79.i.i278 = and i64 %xor69.i.i268, %xor23.i.i230
  %and80.i.i279 = and i64 %xor72.i.i271, %xor25.i.i232
  %and81.i.i280 = and i64 %xor68.i.i267, %xor22.i113.i229
  %and82.i.i281 = and i64 %xor71.i121.i270, %xor14.i.i221
  %and83.i.i282 = and i64 %xor64.i.i263, %xor17.i.i224
  %and84.i.i283 = and i64 %xor60.i.i259, %xor13.i110.i220
  %and85.i.i284 = and i64 %xor70.i.i269, %xor8.i.i215
  %and86.i.i285 = and i64 %xor67.i120.i266, %xor16.i111.i223
  %and87.i.i286 = and i64 %xor56.i.i255, %xor15.i.i222
  %and88.i.i287 = and i64 %xor69.i.i268, %xor9.i.i216
  %and89.i.i288 = and i64 %xor72.i.i271, %xor.i108.i214
  %and90.i.i289 = and i64 %xor68.i.i267, %xor10.i109.i217
  %xor91.i.i290 = xor i64 %and88.i.i287, %and89.i.i288
  %xor92.i.i291 = xor i64 %and83.i.i282, %and84.i.i283
  %xor93.i.i292 = xor i64 %and78.i.i277, %and86.i.i285
  %xor94.i.i293 = xor i64 %and82.i.i281, %and83.i.i282
  %xor95.i.i294 = xor i64 %and75.i.i274, %and85.i.i284
  %xor96.i.i295 = xor i64 %and75.i.i274, %and78.i.i277
  %xor97.i.i296 = xor i64 %and80.i.i279, %and81.i.i280
  %xor98.i.i297 = xor i64 %and73.i.i272, %and76.i.i275
  %xor99.i.i298 = xor i64 %and79.i.i278, %and80.i.i279
  %xor100.i.i299 = xor i64 %and89.i.i288, %and90.i.i289
  %xor101.i.i300 = xor i64 %and85.i.i284, %xor93.i.i292
  %xor102.i.i301 = xor i64 %xor95.i.i294, %xor98.i.i297
  %xor103.i.i302 = xor i64 %and77.i.i276, %xor91.i.i290
  %xor104.i.i303 = xor i64 %and76.i.i275, %xor99.i.i298
  %xor105.i.i304 = xor i64 %xor91.i.i290, %xor102.i.i301
  %xor106.i.i305 = xor i64 %and87.i.i286, %xor102.i.i301
  %xor107.i.i306 = xor i64 %xor97.i.i296, %xor103.i.i302
  %xor108.i.i307 = xor i64 %xor94.i.i293, %xor103.i.i302
  %xor109.i.i308 = xor i64 %and77.i.i276, %xor104.i.i303
  %xor110.i.i309 = xor i64 %xor106.i.i305, %xor107.i.i306
  %xor111.i.i310 = xor i64 %and74.i.i273, %xor108.i.i307
  %xor112.i.i311 = xor i64 %xor104.i.i303, %xor108.i.i307
  %370 = xor i64 %xor107.i.i306, %xor101.i.i300
  %xor113.i.i312 = xor i64 %370, -1
  %371 = xor i64 %xor105.i.i304, %xor93.i.i292
  %xor115.i.i313 = xor i64 %371, -1
  %xor117.i.i314 = xor i64 %xor98.i.i297, %xor111.i.i310
  %xor118.i.i315 = xor i64 %xor96.i.i295, %xor111.i.i310
  %xor119.i.i316 = xor i64 %xor92.i.i291, %xor110.i.i309
  %372 = xor i64 %xor117.i.i314, %xor109.i.i308
  %xor121.i.i317 = xor i64 %372, -1
  %373 = xor i64 %xor110.i.i309, %xor100.i.i299
  %374 = xor i64 %373, %xor109.i.i308
  %xor123.i.i318 = xor i64 %374, -1
  %arrayidx124.i.i319 = getelementptr inbounds nuw i8, ptr %q.i37, i32 56
  store i64 %xor112.i.i311, ptr %arrayidx124.i.i319, align 8
  %arrayidx125.i.i320 = getelementptr inbounds nuw i8, ptr %q.i37, i32 48
  store i64 %xor121.i.i317, ptr %arrayidx125.i.i320, align 8
  %arrayidx126.i.i321 = getelementptr inbounds nuw i8, ptr %q.i37, i32 40
  store i64 %xor123.i.i318, ptr %arrayidx126.i.i321, align 8
  %arrayidx127.i.i322 = getelementptr inbounds nuw i8, ptr %q.i37, i32 32
  store i64 %xor117.i.i314, ptr %arrayidx127.i.i322, align 8
  %arrayidx128.i.i323 = getelementptr inbounds nuw i8, ptr %q.i37, i32 24
  store i64 %xor118.i.i315, ptr %arrayidx128.i.i323, align 8
  %arrayidx129.i.i324 = getelementptr inbounds nuw i8, ptr %q.i37, i32 16
  store i64 %xor119.i.i316, ptr %arrayidx129.i.i324, align 8
  %arrayidx130.i.i325 = getelementptr inbounds nuw i8, ptr %q.i37, i32 8
  store i64 %xor113.i.i312, ptr %arrayidx130.i.i325, align 8
  store i64 %xor115.i.i313, ptr %q.i37, align 8
  br label %for.body.i.i550

for.body.i.i550:                                  ; preds = %for.end16.i206, %for.body.i.i550
  %i.0.i.i327832 = phi i32 [ 0, %for.end16.i206 ], [ %inc.i.i572, %for.body.i.i550 ]
  %arrayidx.i.i551 = getelementptr inbounds nuw i64, ptr %q.i37, i32 %i.0.i.i327832
  %375 = load i64, ptr %arrayidx.i.i551, align 8
  %and.i.i552 = and i64 %375, 65535
  %and1.i.i553 = lshr i64 %375, 4
  %shr.i1.i554 = and i64 %and1.i.i553, 268369920
  %or.i.i555 = or disjoint i64 %and.i.i552, %shr.i1.i554
  %and2.i.i556 = shl i64 %375, 12
  %shl.i.i557 = and i64 %and2.i.i556, 4026531840
  %or3.i.i558 = or disjoint i64 %or.i.i555, %shl.i.i557
  %and4.i.i559 = lshr i64 %375, 8
  %shr5.i.i560 = and i64 %and4.i.i559, 1095216660480
  %or6.i.i561 = or disjoint i64 %or3.i.i558, %shr5.i.i560
  %and7.i.i562 = shl i64 %375, 8
  %shl8.i.i563 = and i64 %and7.i.i562, 280375465082880
  %or9.i.i564 = or disjoint i64 %or6.i.i561, %shl8.i.i563
  %and10.i.i565 = lshr i64 %375, 12
  %shr11.i.i566 = and i64 %and10.i.i565, 4222124650659840
  %or12.i.i567 = or disjoint i64 %or9.i.i564, %shr11.i.i566
  %and13.i.i568 = shl i64 %375, 4
  %shl14.i.i569 = and i64 %and13.i.i568, -4503599627370496
  %or15.i.i570 = or i64 %or12.i.i567, %shl14.i.i569
  %arrayidx16.i.i571 = getelementptr inbounds nuw i64, ptr %q.i37, i32 %i.0.i.i327832
  store i64 %or15.i.i570, ptr %arrayidx16.i.i571, align 8
  %inc.i.i572 = add nuw nsw i32 %i.0.i.i327832, 1
  %exitcond.i.i328.not = icmp eq i32 %inc.i.i572, 8
  br i1 %exitcond.i.i328.not, label %shift_rows.exit.i329, label %for.body.i.i550, !llvm.loop !48

shift_rows.exit.i329:                             ; preds = %for.body.i.i550
  %add.ptr20.i330 = getelementptr inbounds nuw i8, ptr %0, i32 640
  %376 = load i64, ptr %add.ptr20.i330, align 8
  %377 = load i64, ptr %q.i37, align 8
  %xor.i52.i331 = xor i64 %377, %376
  store i64 %xor.i52.i331, ptr %q.i37, align 8
  %arrayidx2.i53.i332 = getelementptr inbounds nuw i8, ptr %0, i32 648
  %378 = load i64, ptr %arrayidx2.i53.i332, align 8
  %arrayidx3.i54.i333 = getelementptr inbounds nuw i8, ptr %q.i37, i32 8
  %379 = load i64, ptr %arrayidx3.i54.i333, align 8
  %xor4.i55.i334 = xor i64 %379, %378
  store i64 %xor4.i55.i334, ptr %arrayidx3.i54.i333, align 8
  %arrayidx5.i56.i335 = getelementptr inbounds nuw i8, ptr %0, i32 656
  %380 = load i64, ptr %arrayidx5.i56.i335, align 8
  %arrayidx6.i57.i336 = getelementptr inbounds nuw i8, ptr %q.i37, i32 16
  %381 = load i64, ptr %arrayidx6.i57.i336, align 8
  %xor7.i58.i337 = xor i64 %381, %380
  store i64 %xor7.i58.i337, ptr %arrayidx6.i57.i336, align 8
  %arrayidx8.i59.i338 = getelementptr inbounds nuw i8, ptr %0, i32 664
  %382 = load i64, ptr %arrayidx8.i59.i338, align 8
  %arrayidx9.i60.i339 = getelementptr inbounds nuw i8, ptr %q.i37, i32 24
  %383 = load i64, ptr %arrayidx9.i60.i339, align 8
  %xor10.i61.i340 = xor i64 %383, %382
  store i64 %xor10.i61.i340, ptr %arrayidx9.i60.i339, align 8
  %arrayidx11.i62.i341 = getelementptr inbounds nuw i8, ptr %0, i32 672
  %384 = load i64, ptr %arrayidx11.i62.i341, align 8
  %arrayidx12.i63.i342 = getelementptr inbounds nuw i8, ptr %q.i37, i32 32
  %385 = load i64, ptr %arrayidx12.i63.i342, align 8
  %xor13.i64.i343 = xor i64 %385, %384
  store i64 %xor13.i64.i343, ptr %arrayidx12.i63.i342, align 8
  %arrayidx14.i65.i344 = getelementptr inbounds nuw i8, ptr %0, i32 680
  %386 = load i64, ptr %arrayidx14.i65.i344, align 8
  %arrayidx15.i66.i345 = getelementptr inbounds nuw i8, ptr %q.i37, i32 40
  %387 = load i64, ptr %arrayidx15.i66.i345, align 8
  %xor16.i67.i346 = xor i64 %387, %386
  store i64 %xor16.i67.i346, ptr %arrayidx15.i66.i345, align 8
  %arrayidx17.i68.i347 = getelementptr inbounds nuw i8, ptr %0, i32 688
  %388 = load i64, ptr %arrayidx17.i68.i347, align 8
  %arrayidx18.i69.i348 = getelementptr inbounds nuw i8, ptr %q.i37, i32 48
  %389 = load i64, ptr %arrayidx18.i69.i348, align 8
  %xor19.i70.i349 = xor i64 %389, %388
  store i64 %xor19.i70.i349, ptr %arrayidx18.i69.i348, align 8
  %arrayidx20.i71.i350 = getelementptr inbounds nuw i8, ptr %0, i32 696
  %390 = load i64, ptr %arrayidx20.i71.i350, align 8
  %arrayidx21.i72.i351 = getelementptr inbounds nuw i8, ptr %q.i37, i32 56
  %391 = load i64, ptr %arrayidx21.i72.i351, align 8
  %xor22.i73.i352 = xor i64 %391, %390
  store i64 %xor22.i73.i352, ptr %arrayidx21.i72.i351, align 8
  %392 = load i64, ptr %q.i37, align 8
  %arrayidx1.i268.i353 = getelementptr inbounds nuw i8, ptr %q.i37, i32 8
  %393 = load i64, ptr %arrayidx1.i268.i353, align 8
  %and.i269.i354 = and i64 %392, 6148914691236517205
  %and2.i270.i355 = shl i64 %393, 1
  %shl.i271.i356 = and i64 %and2.i270.i355, -6148914691236517206
  %or.i272.i357 = or disjoint i64 %and.i269.i354, %shl.i271.i356
  store i64 %or.i272.i357, ptr %q.i37, align 8
  %and4.i273.i358 = lshr i64 %392, 1
  %shr.i274.i359 = and i64 %and4.i273.i358, 6148914691236517205
  %and5.i275.i360 = and i64 %393, -6148914691236517206
  %or6.i276.i361 = or disjoint i64 %shr.i274.i359, %and5.i275.i360
  %arrayidx7.i277.i362 = getelementptr inbounds nuw i8, ptr %q.i37, i32 8
  store i64 %or6.i276.i361, ptr %arrayidx7.i277.i362, align 8
  %arrayidx11.i278.i363 = getelementptr inbounds nuw i8, ptr %q.i37, i32 16
  %394 = load i64, ptr %arrayidx11.i278.i363, align 8
  %arrayidx12.i279.i364 = getelementptr inbounds nuw i8, ptr %q.i37, i32 24
  %395 = load i64, ptr %arrayidx12.i279.i364, align 8
  %and13.i280.i365 = and i64 %394, 6148914691236517205
  %and14.i281.i366 = shl i64 %395, 1
  %shl15.i282.i367 = and i64 %and14.i281.i366, -6148914691236517206
  %or16.i283.i368 = or disjoint i64 %and13.i280.i365, %shl15.i282.i367
  %arrayidx17.i284.i369 = getelementptr inbounds nuw i8, ptr %q.i37, i32 16
  store i64 %or16.i283.i368, ptr %arrayidx17.i284.i369, align 8
  %and18.i285.i370 = lshr i64 %394, 1
  %shr19.i286.i371 = and i64 %and18.i285.i370, 6148914691236517205
  %and20.i287.i372 = and i64 %395, -6148914691236517206
  %or21.i288.i373 = or disjoint i64 %shr19.i286.i371, %and20.i287.i372
  %arrayidx22.i289.i374 = getelementptr inbounds nuw i8, ptr %q.i37, i32 24
  store i64 %or21.i288.i373, ptr %arrayidx22.i289.i374, align 8
  %arrayidx27.i290.i375 = getelementptr inbounds nuw i8, ptr %q.i37, i32 32
  %396 = load i64, ptr %arrayidx27.i290.i375, align 8
  %arrayidx28.i291.i376 = getelementptr inbounds nuw i8, ptr %q.i37, i32 40
  %397 = load i64, ptr %arrayidx28.i291.i376, align 8
  %and29.i292.i377 = and i64 %396, 6148914691236517205
  %and30.i293.i378 = shl i64 %397, 1
  %shl31.i294.i379 = and i64 %and30.i293.i378, -6148914691236517206
  %or32.i295.i380 = or disjoint i64 %and29.i292.i377, %shl31.i294.i379
  %arrayidx33.i296.i381 = getelementptr inbounds nuw i8, ptr %q.i37, i32 32
  store i64 %or32.i295.i380, ptr %arrayidx33.i296.i381, align 8
  %and34.i297.i382 = lshr i64 %396, 1
  %shr35.i298.i383 = and i64 %and34.i297.i382, 6148914691236517205
  %and36.i299.i384 = and i64 %397, -6148914691236517206
  %or37.i300.i385 = or disjoint i64 %shr35.i298.i383, %and36.i299.i384
  %arrayidx38.i301.i386 = getelementptr inbounds nuw i8, ptr %q.i37, i32 40
  store i64 %or37.i300.i385, ptr %arrayidx38.i301.i386, align 8
  %arrayidx43.i302.i387 = getelementptr inbounds nuw i8, ptr %q.i37, i32 48
  %398 = load i64, ptr %arrayidx43.i302.i387, align 8
  %arrayidx44.i303.i388 = getelementptr inbounds nuw i8, ptr %q.i37, i32 56
  %399 = load i64, ptr %arrayidx44.i303.i388, align 8
  %and45.i304.i389 = and i64 %398, 6148914691236517205
  %and46.i305.i390 = shl i64 %399, 1
  %shl47.i306.i391 = and i64 %and46.i305.i390, -6148914691236517206
  %or48.i307.i392 = or disjoint i64 %and45.i304.i389, %shl47.i306.i391
  %arrayidx49.i308.i393 = getelementptr inbounds nuw i8, ptr %q.i37, i32 48
  store i64 %or48.i307.i392, ptr %arrayidx49.i308.i393, align 8
  %and50.i309.i394 = lshr i64 %398, 1
  %shr51.i310.i395 = and i64 %and50.i309.i394, 6148914691236517205
  %and52.i311.i396 = and i64 %399, -6148914691236517206
  %or53.i312.i397 = or disjoint i64 %shr51.i310.i395, %and52.i311.i396
  %arrayidx54.i313.i398 = getelementptr inbounds nuw i8, ptr %q.i37, i32 56
  store i64 %or53.i312.i397, ptr %arrayidx54.i313.i398, align 8
  %400 = load i64, ptr %q.i37, align 8
  %arrayidx60.i314.i399 = getelementptr inbounds nuw i8, ptr %q.i37, i32 16
  %401 = load i64, ptr %arrayidx60.i314.i399, align 8
  %and61.i315.i400 = and i64 %400, 3689348814741910323
  %and62.i316.i401 = shl i64 %401, 2
  %shl63.i317.i402 = and i64 %and62.i316.i401, -3689348814741910324
  %or64.i318.i403 = or disjoint i64 %and61.i315.i400, %shl63.i317.i402
  store i64 %or64.i318.i403, ptr %q.i37, align 8
  %and66.i319.i404 = lshr i64 %400, 2
  %shr67.i320.i405 = and i64 %and66.i319.i404, 3689348814741910323
  %and68.i321.i406 = and i64 %401, -3689348814741910324
  %or69.i322.i407 = or disjoint i64 %shr67.i320.i405, %and68.i321.i406
  %arrayidx70.i323.i408 = getelementptr inbounds nuw i8, ptr %q.i37, i32 16
  store i64 %or69.i322.i407, ptr %arrayidx70.i323.i408, align 8
  %arrayidx75.i324.i409 = getelementptr inbounds nuw i8, ptr %q.i37, i32 8
  %402 = load i64, ptr %arrayidx75.i324.i409, align 8
  %arrayidx76.i325.i410 = getelementptr inbounds nuw i8, ptr %q.i37, i32 24
  %403 = load i64, ptr %arrayidx76.i325.i410, align 8
  %and77.i326.i411 = and i64 %402, 3689348814741910323
  %and78.i327.i412 = shl i64 %403, 2
  %shl79.i328.i413 = and i64 %and78.i327.i412, -3689348814741910324
  %or80.i329.i414 = or disjoint i64 %and77.i326.i411, %shl79.i328.i413
  %arrayidx81.i330.i415 = getelementptr inbounds nuw i8, ptr %q.i37, i32 8
  store i64 %or80.i329.i414, ptr %arrayidx81.i330.i415, align 8
  %and82.i331.i416 = lshr i64 %402, 2
  %shr83.i332.i417 = and i64 %and82.i331.i416, 3689348814741910323
  %and84.i333.i418 = and i64 %403, -3689348814741910324
  %or85.i334.i419 = or disjoint i64 %shr83.i332.i417, %and84.i333.i418
  %arrayidx86.i335.i420 = getelementptr inbounds nuw i8, ptr %q.i37, i32 24
  store i64 %or85.i334.i419, ptr %arrayidx86.i335.i420, align 8
  %arrayidx91.i336.i421 = getelementptr inbounds nuw i8, ptr %q.i37, i32 32
  %404 = load i64, ptr %arrayidx91.i336.i421, align 8
  %arrayidx92.i337.i422 = getelementptr inbounds nuw i8, ptr %q.i37, i32 48
  %405 = load i64, ptr %arrayidx92.i337.i422, align 8
  %and93.i338.i423 = and i64 %404, 3689348814741910323
  %and94.i339.i424 = shl i64 %405, 2
  %shl95.i340.i425 = and i64 %and94.i339.i424, -3689348814741910324
  %or96.i341.i426 = or disjoint i64 %and93.i338.i423, %shl95.i340.i425
  %arrayidx97.i342.i427 = getelementptr inbounds nuw i8, ptr %q.i37, i32 32
  store i64 %or96.i341.i426, ptr %arrayidx97.i342.i427, align 8
  %and98.i343.i428 = lshr i64 %404, 2
  %shr99.i344.i429 = and i64 %and98.i343.i428, 3689348814741910323
  %and100.i345.i430 = and i64 %405, -3689348814741910324
  %or101.i346.i431 = or disjoint i64 %shr99.i344.i429, %and100.i345.i430
  %arrayidx102.i347.i432 = getelementptr inbounds nuw i8, ptr %q.i37, i32 48
  store i64 %or101.i346.i431, ptr %arrayidx102.i347.i432, align 8
  %arrayidx107.i348.i433 = getelementptr inbounds nuw i8, ptr %q.i37, i32 40
  %406 = load i64, ptr %arrayidx107.i348.i433, align 8
  %arrayidx108.i349.i434 = getelementptr inbounds nuw i8, ptr %q.i37, i32 56
  %407 = load i64, ptr %arrayidx108.i349.i434, align 8
  %and109.i350.i435 = and i64 %406, 3689348814741910323
  %and110.i351.i436 = shl i64 %407, 2
  %shl111.i352.i437 = and i64 %and110.i351.i436, -3689348814741910324
  %or112.i353.i438 = or disjoint i64 %and109.i350.i435, %shl111.i352.i437
  %arrayidx113.i354.i439 = getelementptr inbounds nuw i8, ptr %q.i37, i32 40
  store i64 %or112.i353.i438, ptr %arrayidx113.i354.i439, align 8
  %and114.i355.i440 = lshr i64 %406, 2
  %shr115.i356.i441 = and i64 %and114.i355.i440, 3689348814741910323
  %and116.i357.i442 = and i64 %407, -3689348814741910324
  %or117.i358.i443 = or disjoint i64 %shr115.i356.i441, %and116.i357.i442
  %arrayidx118.i359.i444 = getelementptr inbounds nuw i8, ptr %q.i37, i32 56
  store i64 %or117.i358.i443, ptr %arrayidx118.i359.i444, align 8
  %408 = load i64, ptr %q.i37, align 8
  %arrayidx124.i360.i445 = getelementptr inbounds nuw i8, ptr %q.i37, i32 32
  %409 = load i64, ptr %arrayidx124.i360.i445, align 8
  %and125.i361.i446 = and i64 %408, 1085102592571150095
  %and126.i362.i447 = shl i64 %409, 4
  %shl127.i363.i448 = and i64 %and126.i362.i447, -1085102592571150096
  %or128.i364.i449 = or disjoint i64 %and125.i361.i446, %shl127.i363.i448
  store i64 %or128.i364.i449, ptr %q.i37, align 8
  %and130.i365.i450 = lshr i64 %408, 4
  %shr131.i366.i451 = and i64 %and130.i365.i450, 1085102592571150095
  %and132.i367.i452 = and i64 %409, -1085102592571150096
  %or133.i368.i453 = or disjoint i64 %shr131.i366.i451, %and132.i367.i452
  %arrayidx134.i369.i454 = getelementptr inbounds nuw i8, ptr %q.i37, i32 32
  store i64 %or133.i368.i453, ptr %arrayidx134.i369.i454, align 8
  %arrayidx139.i370.i455 = getelementptr inbounds nuw i8, ptr %q.i37, i32 8
  %410 = load i64, ptr %arrayidx139.i370.i455, align 8
  %arrayidx140.i371.i456 = getelementptr inbounds nuw i8, ptr %q.i37, i32 40
  %411 = load i64, ptr %arrayidx140.i371.i456, align 8
  %and141.i372.i457 = and i64 %410, 1085102592571150095
  %and142.i373.i458 = shl i64 %411, 4
  %shl143.i374.i459 = and i64 %and142.i373.i458, -1085102592571150096
  %or144.i375.i460 = or disjoint i64 %and141.i372.i457, %shl143.i374.i459
  %arrayidx145.i376.i461 = getelementptr inbounds nuw i8, ptr %q.i37, i32 8
  store i64 %or144.i375.i460, ptr %arrayidx145.i376.i461, align 8
  %and146.i377.i462 = lshr i64 %410, 4
  %shr147.i378.i463 = and i64 %and146.i377.i462, 1085102592571150095
  %and148.i379.i464 = and i64 %411, -1085102592571150096
  %or149.i380.i465 = or disjoint i64 %shr147.i378.i463, %and148.i379.i464
  %arrayidx150.i381.i466 = getelementptr inbounds nuw i8, ptr %q.i37, i32 40
  store i64 %or149.i380.i465, ptr %arrayidx150.i381.i466, align 8
  %arrayidx155.i382.i467 = getelementptr inbounds nuw i8, ptr %q.i37, i32 16
  %412 = load i64, ptr %arrayidx155.i382.i467, align 8
  %arrayidx156.i383.i468 = getelementptr inbounds nuw i8, ptr %q.i37, i32 48
  %413 = load i64, ptr %arrayidx156.i383.i468, align 8
  %and157.i384.i469 = and i64 %412, 1085102592571150095
  %and158.i385.i470 = shl i64 %413, 4
  %shl159.i386.i471 = and i64 %and158.i385.i470, -1085102592571150096
  %or160.i387.i472 = or disjoint i64 %and157.i384.i469, %shl159.i386.i471
  %arrayidx161.i388.i473 = getelementptr inbounds nuw i8, ptr %q.i37, i32 16
  store i64 %or160.i387.i472, ptr %arrayidx161.i388.i473, align 8
  %and162.i389.i474 = lshr i64 %412, 4
  %shr163.i390.i475 = and i64 %and162.i389.i474, 1085102592571150095
  %and164.i391.i476 = and i64 %413, -1085102592571150096
  %or165.i392.i477 = or disjoint i64 %shr163.i390.i475, %and164.i391.i476
  %arrayidx166.i393.i478 = getelementptr inbounds nuw i8, ptr %q.i37, i32 48
  store i64 %or165.i392.i477, ptr %arrayidx166.i393.i478, align 8
  %arrayidx171.i394.i479 = getelementptr inbounds nuw i8, ptr %q.i37, i32 24
  %414 = load i64, ptr %arrayidx171.i394.i479, align 8
  %arrayidx172.i395.i480 = getelementptr inbounds nuw i8, ptr %q.i37, i32 56
  %415 = load i64, ptr %arrayidx172.i395.i480, align 8
  %and173.i396.i481 = and i64 %414, 1085102592571150095
  %and174.i397.i482 = shl i64 %415, 4
  %shl175.i398.i483 = and i64 %and174.i397.i482, -1085102592571150096
  %or176.i399.i484 = or disjoint i64 %and173.i396.i481, %shl175.i398.i483
  %arrayidx177.i400.i485 = getelementptr inbounds nuw i8, ptr %q.i37, i32 24
  store i64 %or176.i399.i484, ptr %arrayidx177.i400.i485, align 8
  %and178.i401.i486 = lshr i64 %414, 4
  %shr179.i402.i487 = and i64 %and178.i401.i486, 1085102592571150095
  %and180.i403.i488 = and i64 %415, -1085102592571150096
  %or181.i404.i489 = or disjoint i64 %shr179.i402.i487, %and180.i403.i488
  %arrayidx182.i405.i490 = getelementptr inbounds nuw i8, ptr %q.i37, i32 56
  store i64 %or181.i404.i489, ptr %arrayidx182.i405.i490, align 8
  br label %for.body24.i514

while.cond.i.i495.preheader:                      ; preds = %for.body24.i514
  br label %while.body.i.i500

for.body24.i514:                                  ; preds = %shift_rows.exit.i329, %for.body24.i514
  %i.2.i492833 = phi i32 [ 0, %shift_rows.exit.i329 ], [ %inc32.i549, %for.body24.i514 ]
  %add.ptr27.idx.i515 = shl nuw nsw i32 %i.2.i492833, 4
  %add.ptr27.i516 = getelementptr inbounds nuw i8, ptr %w.i36, i32 %add.ptr27.idx.i515
  %arrayidx28.i517 = getelementptr inbounds nuw [8 x i64], ptr %q.i37, i32 0, i32 %i.2.i492833
  %416 = load i64, ptr %arrayidx28.i517, align 8
  %add29.i518 = or disjoint i32 %i.2.i492833, 4
  %arrayidx30.i519 = getelementptr inbounds nuw [8 x i64], ptr %q.i37, i32 0, i32 %add29.i518
  %417 = load i64, ptr %arrayidx30.i519, align 8
  %and.i29.i520 = and i64 %416, 71777214294589695
  %and1.i30.i521 = and i64 %417, 71777214294589695
  %shr.i31.i522 = lshr i64 %416, 8
  %and2.i32.i523 = and i64 %shr.i31.i522, 71776119077928960
  %shr3.i33.i524 = lshr i64 %417, 8
  %and4.i34.i525 = and i64 %shr3.i33.i524, 71776119077928960
  %shr5.i35.i526 = lshr i64 %and.i29.i520, 8
  %or.i36.i527 = or disjoint i64 %and.i29.i520, %shr5.i35.i526
  %shr6.i37.i528 = lshr i64 %and1.i30.i521, 8
  %or7.i.i529 = or disjoint i64 %and1.i30.i521, %shr6.i37.i528
  %418 = and i64 %416, 280375465148160
  %419 = or disjoint i64 %and2.i32.i523, %418
  %or9.i38.i530 = lshr exact i64 %419, 8
  %420 = and i64 %417, 280375465148160
  %421 = or disjoint i64 %and4.i34.i525, %420
  %or11.i.i531 = lshr exact i64 %421, 8
  %and12.i.i532 = and i64 %or.i36.i527, 281470681808895
  %and13.i39.i533 = and i64 %or7.i.i529, 281470681808895
  %shr16.i.i534 = lshr i64 %and12.i.i532, 16
  %or181.i.i535 = or disjoint i64 %and12.i.i532, %shr16.i.i534
  %or18.i.i536 = trunc i64 %or181.i.i535 to i32
  store i32 %or18.i.i536, ptr %add.ptr27.i516, align 4
  %shr20.i.i537 = lshr i64 %and13.i39.i533, 16
  %or222.i.i538 = or disjoint i64 %and13.i39.i533, %shr20.i.i537
  %or22.i.i539 = trunc i64 %or222.i.i538 to i32
  %arrayidx23.i.i540 = getelementptr inbounds nuw i8, ptr %add.ptr27.i516, i32 4
  store i32 %or22.i.i539, ptr %arrayidx23.i.i540, align 4
  %shr25.i.i541 = lshr i64 %419, 24
  %or273.i.i542 = or disjoint i64 %or9.i38.i530, %shr25.i.i541
  %or27.i.i543 = trunc i64 %or273.i.i542 to i32
  %arrayidx28.i.i544 = getelementptr inbounds nuw i8, ptr %add.ptr27.i516, i32 8
  store i32 %or27.i.i543, ptr %arrayidx28.i.i544, align 4
  %shr30.i.i545 = lshr i64 %421, 24
  %or324.i.i546 = or disjoint i64 %or11.i.i531, %shr30.i.i545
  %or32.i.i547 = trunc i64 %or324.i.i546 to i32
  %arrayidx33.i.i548 = getelementptr inbounds nuw i8, ptr %add.ptr27.i516, i32 12
  store i32 %or32.i.i547, ptr %arrayidx33.i.i548, align 4
  %inc32.i549 = add nuw nsw i32 %i.2.i492833, 1
  %exitcond2.i493.not = icmp eq i32 %inc32.i549, 4
  br i1 %exitcond2.i493.not, label %while.cond.i.i495.preheader, label %for.body24.i514, !llvm.loop !49

while.body.i.i500:                                ; preds = %while.cond.i.i495.preheader, %while.body.i.i500
  %dst.addr.0.i.i498836 = phi ptr [ %tmp.i, %while.cond.i.i495.preheader ], [ %add.ptr.i.i513, %while.body.i.i500 ]
  %v.addr.0.i.i497835 = phi ptr [ %w.i36, %while.cond.i.i495.preheader ], [ %incdec.ptr.i.i502, %while.body.i.i500 ]
  %num.addr.0.i.i496834 = phi i32 [ 16, %while.cond.i.i495.preheader ], [ %dec.i.i501, %while.body.i.i500 ]
  %dec.i.i501 = add nsw i32 %num.addr.0.i.i496834, -1
  %incdec.ptr.i.i502 = getelementptr inbounds nuw i8, ptr %v.addr.0.i.i497835, i32 4
  %422 = load i32, ptr %v.addr.0.i.i497835, align 4
  %conv.i.i503 = trunc i32 %422 to i8
  store i8 %conv.i.i503, ptr %dst.addr.0.i.i498836, align 1
  %shr.i.i504 = lshr i32 %422, 8
  %conv1.i.i505 = trunc i32 %shr.i.i504 to i8
  %arrayidx2.i.i506 = getelementptr inbounds nuw i8, ptr %dst.addr.0.i.i498836, i32 1
  store i8 %conv1.i.i505, ptr %arrayidx2.i.i506, align 1
  %shr3.i.i507 = lshr i32 %422, 16
  %conv4.i.i508 = trunc i32 %shr3.i.i507 to i8
  %arrayidx5.i.i509 = getelementptr inbounds nuw i8, ptr %dst.addr.0.i.i498836, i32 2
  store i8 %conv4.i.i508, ptr %arrayidx5.i.i509, align 1
  %shr6.i.i510 = lshr i32 %422, 24
  %conv7.i.i511 = trunc nuw i32 %shr6.i.i510 to i8
  %arrayidx8.i.i512 = getelementptr inbounds nuw i8, ptr %dst.addr.0.i.i498836, i32 3
  store i8 %conv7.i.i511, ptr %arrayidx8.i.i512, align 1
  %add.ptr.i.i513 = getelementptr inbounds nuw i8, ptr %dst.addr.0.i.i498836, i32 4
  %cmp.not.i.i499 = icmp eq i32 %dec.i.i501, 0
  br i1 %cmp.not.i.i499, label %aes_ecb4x.exit813, label %while.body.i.i500, !llvm.loop !50

aes_ecb4x.exit813:                                ; preds = %while.body.i.i500
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %w.i36)
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %q.i37)
  %add.ptr.i2 = getelementptr inbounds nuw i8, ptr %ivw.i, i32 12
  %423 = load i32, ptr %add.ptr.i2, align 4
  %424 = call i32 @llvm.bswap.i32(i32 %423)
  %add.i8.i3 = add i32 %424, 4
  %425 = call i32 @llvm.bswap.i32(i32 %add.i8.i3)
  store i32 %425, ptr %add.ptr.i2, align 4
  %add.ptr1.i4 = getelementptr inbounds nuw i8, ptr %ivw.i, i32 28
  %426 = load i32, ptr %add.ptr1.i4, align 4
  %427 = call i32 @llvm.bswap.i32(i32 %426)
  %add.i5.i5 = add i32 %427, 4
  %428 = call i32 @llvm.bswap.i32(i32 %add.i5.i5)
  store i32 %428, ptr %add.ptr1.i4, align 4
  %add.ptr2.i6 = getelementptr inbounds nuw i8, ptr %ivw.i, i32 44
  %429 = load i32, ptr %add.ptr2.i6, align 4
  %430 = call i32 @llvm.bswap.i32(i32 %429)
  %add.i2.i7 = add i32 %430, 4
  %431 = call i32 @llvm.bswap.i32(i32 %add.i2.i7)
  store i32 %431, ptr %add.ptr2.i6, align 4
  %add.ptr3.i8 = getelementptr inbounds nuw i8, ptr %ivw.i, i32 60
  %432 = load i32, ptr %add.ptr3.i8, align 4
  %433 = call i32 @llvm.bswap.i32(i32 %432)
  %add.i.i9 = add i32 %433, 4
  %434 = call i32 @llvm.bswap.i32(i32 %add.i.i9)
  store i32 %434, ptr %add.ptr3.i8, align 4
  br label %for.body.i

for.body.i:                                       ; preds = %aes_ecb4x.exit813, %for.body.i
  %i.0.i837 = phi i32 [ 0, %aes_ecb4x.exit813 ], [ %inc.i, %for.body.i ]
  %arrayidx26.i = getelementptr inbounds nuw [64 x i8], ptr %tmp.i, i32 0, i32 %i.0.i837
  %435 = load i8, ptr %arrayidx26.i, align 1
  %arrayidx27.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i.lcssa, i32 %i.0.i837
  store i8 %435, ptr %arrayidx27.i, align 1
  %inc.i = add nuw nsw i32 %i.0.i837, 1
  %exitcond = icmp ne i32 %inc.i, %outlen.addr.0.i.lcssa
  br i1 %exitcond, label %for.body.i, label %aes_ctr.exit.loopexit, !llvm.loop !51

aes_ctr.exit.loopexit:                            ; preds = %for.body.i
  br label %aes_ctr.exit

aes_ctr.exit:                                     ; preds = %aes_ctr.exit.loopexit, %while.end.i
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %ivw.i)
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %tmp.i)
  ret void
}

; Function Attrs: inlinehint nounwind
define dso_local void @aes128_ctx_release(ptr noundef %r) local_unnamed_addr #1 {
entry:
  %0 = load ptr, ptr %r, align 4
  call void @free(ptr noundef %0) #8
  ret void
}

; Function Attrs: inlinehint nounwind
define dso_local i32 @AES_128_CTR(ptr noundef %output, i32 noundef %outputByteLen, ptr noundef %input, i32 noundef %inputByteLen) local_unnamed_addr #1 {
entry:
  %q.i.i = alloca [8 x i64], align 8
  %skey.i830 = alloca [60 x i32], align 4
  %q.i831 = alloca [8 x i64], align 8
  %w.i52 = alloca [16 x i32], align 4
  %q.i53 = alloca [8 x i64], align 8
  %w.i = alloca [16 x i32], align 4
  %q.i = alloca [8 x i64], align 8
  %ivw.i = alloca [16 x i32], align 4
  %tmp.i = alloca [64 x i8], align 1
  %skey.i = alloca [22 x i64], align 8
  %ctx = alloca %struct.shake128incctx, align 4
  %iv = alloca [16 x i8], align 1
  br label %for.body.i

for.body.i:                                       ; preds = %entry, %for.body.i
  %i.0.i1126 = phi i32 [ 0, %entry ], [ %inc.i, %for.body.i ]
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %iv, i32 %i.0.i1126
  store i8 0, ptr %arrayidx.i, align 1
  %inc.i = add nuw nsw i32 %i.0.i1126, 1
  %exitcond.i.not = icmp eq i32 %inc.i, 16
  br i1 %exitcond.i.not, label %mayo_memset.exit, label %for.body.i, !llvm.loop !52

mayo_memset.exit:                                 ; preds = %for.body.i
  call void @llvm.lifetime.start.p0(i64 176, ptr nonnull %skey.i)
  %call.i = call dereferenceable_or_null(704) ptr @malloc(i32 noundef 704) #7
  store ptr %call.i, ptr %ctx, align 4
  %cmp.i = icmp eq ptr %call.i, null
  br i1 %cmp.i, label %if.then.i, label %aes128_ecb_keyexp.exit

if.then.i:                                        ; preds = %mayo_memset.exit
  call void @exit(i32 noundef 111) #8
  br label %aes128_ecb_keyexp.exit

aes128_ecb_keyexp.exit:                           ; preds = %mayo_memset.exit, %if.then.i
  call void @llvm.lifetime.start.p0(i64 240, ptr nonnull %skey.i830)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %q.i831)
  br label %while.body.i.i837

while.body.i.i837:                                ; preds = %aes128_ecb_keyexp.exit, %while.body.i.i837
  %v.addr.0.i.i8351129 = phi ptr [ %skey.i830, %aes128_ecb_keyexp.exit ], [ %incdec.ptr.i.i851, %while.body.i.i837 ]
  %num.addr.0.i.i8341128 = phi i32 [ 4, %aes128_ecb_keyexp.exit ], [ %dec.i.i838, %while.body.i.i837 ]
  %src.addr.0.i.i8331127 = phi ptr [ %input, %aes128_ecb_keyexp.exit ], [ %add.ptr.i.i852, %while.body.i.i837 ]
  %dec.i.i838 = add nsw i32 %num.addr.0.i.i8341128, -1
  %0 = load i8, ptr %src.addr.0.i.i8331127, align 1
  %conv.i6.i = zext i8 %0 to i32
  %arrayidx1.i.i839 = getelementptr inbounds nuw i8, ptr %src.addr.0.i.i8331127, i32 1
  %1 = load i8, ptr %arrayidx1.i.i839, align 1
  %conv2.i.i840 = zext i8 %1 to i32
  %shl.i.i841 = shl nuw nsw i32 %conv2.i.i840, 8
  %or.i.i842 = or disjoint i32 %shl.i.i841, %conv.i6.i
  %arrayidx3.i.i843 = getelementptr inbounds nuw i8, ptr %src.addr.0.i.i8331127, i32 2
  %2 = load i8, ptr %arrayidx3.i.i843, align 1
  %conv4.i.i844 = zext i8 %2 to i32
  %shl5.i.i845 = shl nuw nsw i32 %conv4.i.i844, 16
  %or6.i.i846 = or disjoint i32 %or.i.i842, %shl5.i.i845
  %arrayidx7.i.i847 = getelementptr inbounds nuw i8, ptr %src.addr.0.i.i8331127, i32 3
  %3 = load i8, ptr %arrayidx7.i.i847, align 1
  %conv8.i.i848 = zext i8 %3 to i32
  %shl9.i.i849 = shl nuw i32 %conv8.i.i848, 24
  %or10.i.i850 = or disjoint i32 %or6.i.i846, %shl9.i.i849
  %incdec.ptr.i.i851 = getelementptr inbounds nuw i8, ptr %v.addr.0.i.i8351129, i32 4
  store i32 %or10.i.i850, ptr %v.addr.0.i.i8351129, align 4
  %add.ptr.i.i852 = getelementptr inbounds nuw i8, ptr %src.addr.0.i.i8331127, i32 4
  %cmp.not.i.i836 = icmp eq i32 %dec.i.i838, 0
  br i1 %cmp.not.i.i836, label %br_range_dec32le.exit.i853, label %while.body.i.i837, !llvm.loop !53

br_range_dec32le.exit.i853:                       ; preds = %while.body.i.i837
  %arrayidx.i854 = getelementptr inbounds nuw i8, ptr %skey.i830, i32 12
  %4 = load i32, ptr %arrayidx.i854, align 4
  br label %for.body.i1006

for.cond27.i.preheader:                           ; preds = %if.end16.i
  br label %for.body30.i

for.body.i1006:                                   ; preds = %br_range_dec32le.exit.i853, %if.end16.i
  %tmp.0.i1133 = phi i32 [ %4, %br_range_dec32le.exit.i853 ], [ %xor19.i, %if.end16.i ]
  %k.0.i1132 = phi i32 [ 0, %br_range_dec32le.exit.i853 ], [ %spec.select1.i, %if.end16.i ]
  %j.0.i1131 = phi i32 [ 0, %br_range_dec32le.exit.i853 ], [ %spec.select.i, %if.end16.i ]
  %i.0.i8561130 = phi i32 [ 4, %br_range_dec32le.exit.i853 ], [ %inc26.i, %if.end16.i ]
  %cmp6.i = icmp eq i32 %j.0.i1131, 0
  br i1 %cmp6.i, label %if.then.i1124, label %if.end16.i

if.then.i1124:                                    ; preds = %for.body.i1006
  %5 = call i32 @llvm.fshl.i32(i32 %tmp.0.i1133, i32 %tmp.0.i1133, i32 24)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %q.i.i)
  %call.i.i = call ptr @memset(ptr noundef nonnull %q.i.i, i32 noundef 0, i32 noundef 64) #8
  %conv.i.i1125 = zext i32 %5 to i64
  store i64 %conv.i.i1125, ptr %q.i.i, align 8
  %arrayidx1.i155.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  %6 = load i64, ptr %arrayidx1.i155.i, align 8
  %and.i156.i = and i64 %conv.i.i1125, 1431655765
  %and2.i157.i = shl i64 %6, 1
  %shl.i158.i = and i64 %and2.i157.i, -6148914691236517206
  %or.i159.i = or disjoint i64 %and.i156.i, %shl.i158.i
  store i64 %or.i159.i, ptr %q.i.i, align 8
  %and4.i160.i = lshr i64 %conv.i.i1125, 1
  %shr.i161.i = and i64 %and4.i160.i, 1431655765
  %and5.i162.i = and i64 %6, -6148914691236517206
  %or6.i163.i = or disjoint i64 %shr.i161.i, %and5.i162.i
  %arrayidx7.i164.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  store i64 %or6.i163.i, ptr %arrayidx7.i164.i, align 8
  %arrayidx11.i165.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  %7 = load i64, ptr %arrayidx11.i165.i, align 8
  %arrayidx12.i166.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  %8 = load i64, ptr %arrayidx12.i166.i, align 8
  %and13.i167.i = and i64 %7, 6148914691236517205
  %and14.i168.i = shl i64 %8, 1
  %shl15.i169.i = and i64 %and14.i168.i, -6148914691236517206
  %or16.i170.i = or disjoint i64 %and13.i167.i, %shl15.i169.i
  %arrayidx17.i171.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  store i64 %or16.i170.i, ptr %arrayidx17.i171.i, align 8
  %and18.i172.i = lshr i64 %7, 1
  %shr19.i173.i = and i64 %and18.i172.i, 6148914691236517205
  %and20.i174.i = and i64 %8, -6148914691236517206
  %or21.i175.i = or disjoint i64 %shr19.i173.i, %and20.i174.i
  %arrayidx22.i176.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  store i64 %or21.i175.i, ptr %arrayidx22.i176.i, align 8
  %arrayidx27.i177.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  %9 = load i64, ptr %arrayidx27.i177.i, align 8
  %arrayidx28.i178.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  %10 = load i64, ptr %arrayidx28.i178.i, align 8
  %and29.i179.i = and i64 %9, 6148914691236517205
  %and30.i180.i = shl i64 %10, 1
  %shl31.i181.i = and i64 %and30.i180.i, -6148914691236517206
  %or32.i182.i = or disjoint i64 %and29.i179.i, %shl31.i181.i
  %arrayidx33.i183.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  store i64 %or32.i182.i, ptr %arrayidx33.i183.i, align 8
  %and34.i184.i = lshr i64 %9, 1
  %shr35.i185.i = and i64 %and34.i184.i, 6148914691236517205
  %and36.i186.i = and i64 %10, -6148914691236517206
  %or37.i187.i = or disjoint i64 %shr35.i185.i, %and36.i186.i
  %arrayidx38.i188.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  store i64 %or37.i187.i, ptr %arrayidx38.i188.i, align 8
  %arrayidx43.i189.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  %11 = load i64, ptr %arrayidx43.i189.i, align 8
  %arrayidx44.i190.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  %12 = load i64, ptr %arrayidx44.i190.i, align 8
  %and45.i191.i = and i64 %11, 6148914691236517205
  %and46.i192.i = shl i64 %12, 1
  %shl47.i193.i = and i64 %and46.i192.i, -6148914691236517206
  %or48.i194.i = or disjoint i64 %and45.i191.i, %shl47.i193.i
  %arrayidx49.i195.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  store i64 %or48.i194.i, ptr %arrayidx49.i195.i, align 8
  %and50.i196.i = lshr i64 %11, 1
  %shr51.i197.i = and i64 %and50.i196.i, 6148914691236517205
  %and52.i198.i = and i64 %12, -6148914691236517206
  %or53.i199.i = or disjoint i64 %shr51.i197.i, %and52.i198.i
  %arrayidx54.i200.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  store i64 %or53.i199.i, ptr %arrayidx54.i200.i, align 8
  %13 = load i64, ptr %q.i.i, align 8
  %arrayidx60.i201.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  %14 = load i64, ptr %arrayidx60.i201.i, align 8
  %and61.i202.i = and i64 %13, 3689348814741910323
  %and62.i203.i = shl i64 %14, 2
  %shl63.i204.i = and i64 %and62.i203.i, -3689348814741910324
  %or64.i205.i = or disjoint i64 %and61.i202.i, %shl63.i204.i
  store i64 %or64.i205.i, ptr %q.i.i, align 8
  %and66.i206.i = lshr i64 %13, 2
  %shr67.i207.i = and i64 %and66.i206.i, 3689348814741910323
  %and68.i208.i = and i64 %14, -3689348814741910324
  %or69.i209.i = or disjoint i64 %shr67.i207.i, %and68.i208.i
  %arrayidx70.i210.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  store i64 %or69.i209.i, ptr %arrayidx70.i210.i, align 8
  %arrayidx75.i211.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  %15 = load i64, ptr %arrayidx75.i211.i, align 8
  %arrayidx76.i212.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  %16 = load i64, ptr %arrayidx76.i212.i, align 8
  %and77.i213.i = and i64 %15, 3689348814741910323
  %and78.i214.i = shl i64 %16, 2
  %shl79.i215.i = and i64 %and78.i214.i, -3689348814741910324
  %or80.i216.i = or disjoint i64 %and77.i213.i, %shl79.i215.i
  %arrayidx81.i217.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  store i64 %or80.i216.i, ptr %arrayidx81.i217.i, align 8
  %and82.i218.i = lshr i64 %15, 2
  %shr83.i219.i = and i64 %and82.i218.i, 3689348814741910323
  %and84.i220.i = and i64 %16, -3689348814741910324
  %or85.i221.i = or disjoint i64 %shr83.i219.i, %and84.i220.i
  %arrayidx86.i222.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  store i64 %or85.i221.i, ptr %arrayidx86.i222.i, align 8
  %arrayidx91.i223.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  %17 = load i64, ptr %arrayidx91.i223.i, align 8
  %arrayidx92.i224.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  %18 = load i64, ptr %arrayidx92.i224.i, align 8
  %and93.i225.i = and i64 %17, 3689348814741910323
  %and94.i226.i = shl i64 %18, 2
  %shl95.i227.i = and i64 %and94.i226.i, -3689348814741910324
  %or96.i228.i = or disjoint i64 %and93.i225.i, %shl95.i227.i
  %arrayidx97.i229.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  store i64 %or96.i228.i, ptr %arrayidx97.i229.i, align 8
  %and98.i230.i = lshr i64 %17, 2
  %shr99.i231.i = and i64 %and98.i230.i, 3689348814741910323
  %and100.i232.i = and i64 %18, -3689348814741910324
  %or101.i233.i = or disjoint i64 %shr99.i231.i, %and100.i232.i
  %arrayidx102.i234.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  store i64 %or101.i233.i, ptr %arrayidx102.i234.i, align 8
  %arrayidx107.i235.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  %19 = load i64, ptr %arrayidx107.i235.i, align 8
  %arrayidx108.i236.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  %20 = load i64, ptr %arrayidx108.i236.i, align 8
  %and109.i237.i = and i64 %19, 3689348814741910323
  %and110.i238.i = shl i64 %20, 2
  %shl111.i239.i = and i64 %and110.i238.i, -3689348814741910324
  %or112.i240.i = or disjoint i64 %and109.i237.i, %shl111.i239.i
  %arrayidx113.i241.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  store i64 %or112.i240.i, ptr %arrayidx113.i241.i, align 8
  %and114.i242.i = lshr i64 %19, 2
  %shr115.i243.i = and i64 %and114.i242.i, 3689348814741910323
  %and116.i244.i = and i64 %20, -3689348814741910324
  %or117.i245.i = or disjoint i64 %shr115.i243.i, %and116.i244.i
  %arrayidx118.i246.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  store i64 %or117.i245.i, ptr %arrayidx118.i246.i, align 8
  %21 = load i64, ptr %q.i.i, align 8
  %arrayidx124.i247.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  %22 = load i64, ptr %arrayidx124.i247.i, align 8
  %and125.i248.i = and i64 %21, 1085102592571150095
  %and126.i249.i = shl i64 %22, 4
  %shl127.i250.i = and i64 %and126.i249.i, -1085102592571150096
  %or128.i251.i = or disjoint i64 %and125.i248.i, %shl127.i250.i
  store i64 %or128.i251.i, ptr %q.i.i, align 8
  %and130.i252.i = lshr i64 %21, 4
  %shr131.i253.i = and i64 %and130.i252.i, 1085102592571150095
  %and132.i254.i = and i64 %22, -1085102592571150096
  %or133.i255.i = or disjoint i64 %shr131.i253.i, %and132.i254.i
  %arrayidx134.i256.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  store i64 %or133.i255.i, ptr %arrayidx134.i256.i, align 8
  %arrayidx139.i257.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  %23 = load i64, ptr %arrayidx139.i257.i, align 8
  %arrayidx140.i258.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  %24 = load i64, ptr %arrayidx140.i258.i, align 8
  %and141.i259.i = and i64 %23, 1085102592571150095
  %and142.i260.i = shl i64 %24, 4
  %shl143.i261.i = and i64 %and142.i260.i, -1085102592571150096
  %or144.i262.i = or disjoint i64 %and141.i259.i, %shl143.i261.i
  %arrayidx145.i263.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  store i64 %or144.i262.i, ptr %arrayidx145.i263.i, align 8
  %and146.i264.i = lshr i64 %23, 4
  %shr147.i265.i = and i64 %and146.i264.i, 1085102592571150095
  %and148.i266.i = and i64 %24, -1085102592571150096
  %or149.i267.i = or disjoint i64 %shr147.i265.i, %and148.i266.i
  %arrayidx150.i268.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  store i64 %or149.i267.i, ptr %arrayidx150.i268.i, align 8
  %arrayidx155.i269.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  %25 = load i64, ptr %arrayidx155.i269.i, align 8
  %arrayidx156.i270.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  %26 = load i64, ptr %arrayidx156.i270.i, align 8
  %and157.i271.i = and i64 %25, 1085102592571150095
  %and158.i272.i = shl i64 %26, 4
  %shl159.i273.i = and i64 %and158.i272.i, -1085102592571150096
  %or160.i274.i = or disjoint i64 %and157.i271.i, %shl159.i273.i
  %arrayidx161.i275.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  store i64 %or160.i274.i, ptr %arrayidx161.i275.i, align 8
  %and162.i276.i = lshr i64 %25, 4
  %shr163.i277.i = and i64 %and162.i276.i, 1085102592571150095
  %and164.i278.i = and i64 %26, -1085102592571150096
  %or165.i279.i = or disjoint i64 %shr163.i277.i, %and164.i278.i
  %arrayidx166.i280.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  store i64 %or165.i279.i, ptr %arrayidx166.i280.i, align 8
  %arrayidx171.i281.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  %27 = load i64, ptr %arrayidx171.i281.i, align 8
  %arrayidx172.i282.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  %28 = load i64, ptr %arrayidx172.i282.i, align 8
  %and173.i283.i = and i64 %27, 1085102592571150095
  %and174.i284.i = shl i64 %28, 4
  %shl175.i285.i = and i64 %and174.i284.i, -1085102592571150096
  %or176.i286.i = or disjoint i64 %and173.i283.i, %shl175.i285.i
  %arrayidx177.i287.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  store i64 %or176.i286.i, ptr %arrayidx177.i287.i, align 8
  %and178.i288.i = lshr i64 %27, 4
  %shr179.i289.i = and i64 %and178.i288.i, 1085102592571150095
  %and180.i290.i = and i64 %28, -1085102592571150096
  %or181.i291.i = or disjoint i64 %shr179.i289.i, %and180.i290.i
  %arrayidx182.i292.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  store i64 %or181.i291.i, ptr %arrayidx182.i292.i, align 8
  %arrayidx1.i21.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  %29 = load i64, ptr %arrayidx1.i21.i, align 8
  %arrayidx2.i22.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  %30 = load i64, ptr %arrayidx2.i22.i, align 8
  %arrayidx3.i23.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  %31 = load i64, ptr %arrayidx3.i23.i, align 8
  %arrayidx4.i24.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  %32 = load i64, ptr %arrayidx4.i24.i, align 8
  %arrayidx5.i25.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  %33 = load i64, ptr %arrayidx5.i25.i, align 8
  %arrayidx6.i26.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  %34 = load i64, ptr %arrayidx6.i26.i, align 8
  %35 = load i64, ptr %q.i.i, align 8
  %xor.i27.i = xor i64 %31, %33
  %xor8.i28.i = xor i64 %or181.i291.i, %34
  %xor9.i29.i = xor i64 %or181.i291.i, %31
  %xor10.i30.i = xor i64 %or181.i291.i, %33
  %xor11.i31.i = xor i64 %29, %30
  %xor12.i32.i = xor i64 %xor11.i31.i, %35
  %xor13.i33.i = xor i64 %xor12.i32.i, %31
  %xor14.i34.i = xor i64 %xor8.i28.i, %xor.i27.i
  %xor15.i35.i = xor i64 %xor12.i32.i, %or181.i291.i
  %xor16.i36.i = xor i64 %xor12.i32.i, %34
  %xor17.i37.i = xor i64 %xor16.i36.i, %xor10.i30.i
  %xor18.i38.i = xor i64 %32, %xor14.i34.i
  %xor19.i39.i = xor i64 %xor18.i38.i, %33
  %xor20.i40.i = xor i64 %xor18.i38.i, %29
  %xor21.i41.i = xor i64 %xor19.i39.i, %35
  %xor22.i42.i = xor i64 %xor19.i39.i, %xor11.i31.i
  %xor23.i43.i = xor i64 %xor20.i40.i, %xor9.i29.i
  %xor24.i44.i = xor i64 %35, %xor23.i43.i
  %xor25.i45.i = xor i64 %xor22.i42.i, %xor23.i43.i
  %xor27.i46.i = xor i64 %xor11.i31.i, %xor23.i43.i
  %and.i47.i = and i64 %xor14.i34.i, %xor19.i39.i
  %and30.i48.i = and i64 %xor17.i37.i, %xor21.i41.i
  %xor31.i49.i = xor i64 %and30.i48.i, %and.i47.i
  %and32.i50.i = and i64 %xor13.i33.i, %35
  %and34.i51.i = and i64 %xor8.i28.i, %xor27.i46.i
  %and35.i52.i = and i64 %xor16.i36.i, %xor12.i32.i
  %and37.i53.i = and i64 %xor15.i35.i, %xor24.i44.i
  %and39.i54.i = and i64 %xor9.i29.i, %xor23.i43.i
  %and40.i55.i = and i64 %xor.i27.i, %xor25.i45.i
  %xor41.i56.i = xor i64 %and40.i55.i, %and39.i54.i
  %and42.i57.i = and i64 %xor10.i30.i, %xor22.i42.i
  %xor43.i58.i = xor i64 %and42.i57.i, %and39.i54.i
  %xor44.i59.i = xor i64 %xor31.i49.i, %xor41.i56.i
  %xor48.i60.i = xor i64 %xor44.i59.i, %xor20.i40.i
  %36 = xor i64 %xor10.i30.i, %and32.i50.i
  %37 = xor i64 %36, %xor22.i42.i
  %38 = xor i64 %37, %and.i47.i
  %xor49.i61.i = xor i64 %38, %xor43.i58.i
  %39 = xor i64 %xor27.i46.i, %and35.i52.i
  %40 = xor i64 %39, %xor8.i28.i
  %41 = xor i64 %40, %and34.i51.i
  %xor50.i62.i = xor i64 %41, %xor41.i56.i
  %42 = xor i64 %xor27.i46.i, %and37.i53.i
  %43 = xor i64 %42, %or181.i291.i
  %44 = xor i64 %43, %and34.i51.i
  %xor51.i63.i = xor i64 %44, %xor43.i58.i
  %xor52.i64.i = xor i64 %xor48.i60.i, %xor49.i61.i
  %and53.i65.i = and i64 %xor48.i60.i, %xor50.i62.i
  %xor54.i66.i = xor i64 %xor51.i63.i, %and53.i65.i
  %and55.i67.i = and i64 %xor52.i64.i, %xor54.i66.i
  %xor56.i68.i = xor i64 %and55.i67.i, %xor49.i61.i
  %xor57.i69.i = xor i64 %xor50.i62.i, %xor51.i63.i
  %xor58.i70.i = xor i64 %xor49.i61.i, %and53.i65.i
  %and59.i71.i = and i64 %xor58.i70.i, %xor57.i69.i
  %xor60.i72.i = xor i64 %and59.i71.i, %xor51.i63.i
  %xor61.i73.i = xor i64 %xor50.i62.i, %xor60.i72.i
  %xor62.i74.i = xor i64 %and59.i71.i, %and53.i65.i
  %and63.i75.i = and i64 %xor51.i63.i, %xor62.i74.i
  %xor64.i76.i = xor i64 %and63.i75.i, %xor61.i73.i
  %xor65.i77.i = xor i64 %xor54.i66.i, %and63.i75.i
  %and66.i78.i = and i64 %xor56.i68.i, %xor65.i77.i
  %xor67.i79.i = xor i64 %xor52.i64.i, %and66.i78.i
  %xor68.i80.i = xor i64 %xor67.i79.i, %xor64.i76.i
  %xor69.i81.i = xor i64 %xor56.i68.i, %xor60.i72.i
  %xor70.i82.i = xor i64 %xor56.i68.i, %xor67.i79.i
  %xor71.i83.i = xor i64 %and63.i75.i, %xor50.i62.i
  %xor72.i84.i = xor i64 %xor69.i81.i, %xor68.i80.i
  %and73.i85.i = and i64 %xor71.i83.i, %xor19.i39.i
  %and74.i86.i = and i64 %xor64.i76.i, %xor21.i41.i
  %and75.i87.i = and i64 %xor60.i72.i, %35
  %and76.i88.i = and i64 %xor70.i82.i, %xor27.i46.i
  %and77.i89.i = and i64 %xor67.i79.i, %xor12.i32.i
  %and78.i90.i = and i64 %xor56.i68.i, %xor24.i44.i
  %and79.i91.i = and i64 %xor69.i81.i, %xor23.i43.i
  %and80.i92.i = and i64 %xor72.i84.i, %xor25.i45.i
  %and81.i93.i = and i64 %xor68.i80.i, %xor22.i42.i
  %and82.i94.i = and i64 %xor71.i83.i, %xor14.i34.i
  %and83.i95.i = and i64 %xor64.i76.i, %xor17.i37.i
  %and84.i96.i = and i64 %xor60.i72.i, %xor13.i33.i
  %and85.i97.i = and i64 %xor70.i82.i, %xor8.i28.i
  %and86.i98.i = and i64 %xor67.i79.i, %xor16.i36.i
  %and87.i99.i = and i64 %xor56.i68.i, %xor15.i35.i
  %and88.i100.i = and i64 %xor69.i81.i, %xor9.i29.i
  %and89.i101.i = and i64 %xor72.i84.i, %xor.i27.i
  %and90.i102.i = and i64 %xor68.i80.i, %xor10.i30.i
  %xor91.i103.i = xor i64 %and88.i100.i, %and89.i101.i
  %xor92.i104.i = xor i64 %and83.i95.i, %and84.i96.i
  %xor93.i105.i = xor i64 %and78.i90.i, %and86.i98.i
  %xor94.i106.i = xor i64 %and82.i94.i, %and83.i95.i
  %xor95.i107.i = xor i64 %and75.i87.i, %and85.i97.i
  %xor96.i108.i = xor i64 %and75.i87.i, %and78.i90.i
  %xor97.i109.i = xor i64 %and80.i92.i, %and81.i93.i
  %xor98.i110.i = xor i64 %and73.i85.i, %and76.i88.i
  %xor99.i111.i = xor i64 %and79.i91.i, %and80.i92.i
  %xor100.i112.i = xor i64 %and89.i101.i, %and90.i102.i
  %xor101.i113.i = xor i64 %and85.i97.i, %xor93.i105.i
  %xor102.i114.i = xor i64 %xor95.i107.i, %xor98.i110.i
  %xor103.i115.i = xor i64 %and77.i89.i, %xor91.i103.i
  %xor104.i116.i = xor i64 %and76.i88.i, %xor99.i111.i
  %xor105.i117.i = xor i64 %xor91.i103.i, %xor102.i114.i
  %xor106.i118.i = xor i64 %and87.i99.i, %xor102.i114.i
  %xor107.i119.i = xor i64 %xor97.i109.i, %xor103.i115.i
  %xor108.i120.i = xor i64 %xor94.i106.i, %xor103.i115.i
  %xor109.i121.i = xor i64 %and77.i89.i, %xor104.i116.i
  %xor110.i122.i = xor i64 %xor106.i118.i, %xor107.i119.i
  %xor111.i123.i = xor i64 %and74.i86.i, %xor108.i120.i
  %xor112.i124.i = xor i64 %xor104.i116.i, %xor108.i120.i
  %45 = xor i64 %xor107.i119.i, %xor101.i113.i
  %xor113.i125.i = xor i64 %45, -1
  %46 = xor i64 %xor105.i117.i, %xor93.i105.i
  %xor115.i126.i = xor i64 %46, -1
  %xor117.i127.i = xor i64 %xor98.i110.i, %xor111.i123.i
  %xor118.i128.i = xor i64 %xor96.i108.i, %xor111.i123.i
  %xor119.i129.i = xor i64 %xor92.i104.i, %xor110.i122.i
  %47 = xor i64 %xor117.i127.i, %xor109.i121.i
  %xor121.i130.i = xor i64 %47, -1
  %48 = xor i64 %xor110.i122.i, %xor100.i112.i
  %49 = xor i64 %48, %xor109.i121.i
  %xor123.i131.i = xor i64 %49, -1
  %arrayidx124.i132.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  store i64 %xor112.i124.i, ptr %arrayidx124.i132.i, align 8
  %arrayidx125.i133.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  store i64 %xor121.i130.i, ptr %arrayidx125.i133.i, align 8
  %arrayidx126.i134.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  store i64 %xor123.i131.i, ptr %arrayidx126.i134.i, align 8
  %arrayidx127.i135.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  store i64 %xor117.i127.i, ptr %arrayidx127.i135.i, align 8
  %arrayidx128.i136.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  store i64 %xor118.i128.i, ptr %arrayidx128.i136.i, align 8
  %arrayidx129.i137.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  store i64 %xor119.i129.i, ptr %arrayidx129.i137.i, align 8
  %arrayidx130.i138.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  store i64 %xor113.i125.i, ptr %arrayidx130.i138.i, align 8
  %and.i570.i = and i64 %xor115.i126.i, 6148914691236517205
  %and2.i571.i = shl i64 %xor113.i125.i, 1
  %shl.i572.i = and i64 %and2.i571.i, -6148914691236517206
  %or.i573.i = or disjoint i64 %and.i570.i, %shl.i572.i
  store i64 %or.i573.i, ptr %q.i.i, align 8
  %and4.i574.i = lshr i64 %xor115.i126.i, 1
  %shr.i575.i = and i64 %and4.i574.i, 6148914691236517205
  %and5.i576.i = and i64 %xor113.i125.i, -6148914691236517206
  %or6.i577.i = or disjoint i64 %shr.i575.i, %and5.i576.i
  %arrayidx7.i578.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  store i64 %or6.i577.i, ptr %arrayidx7.i578.i, align 8
  %arrayidx11.i579.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  %50 = load i64, ptr %arrayidx11.i579.i, align 8
  %arrayidx12.i580.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  %51 = load i64, ptr %arrayidx12.i580.i, align 8
  %and13.i581.i = and i64 %50, 6148914691236517205
  %and14.i582.i = shl i64 %51, 1
  %shl15.i583.i = and i64 %and14.i582.i, -6148914691236517206
  %or16.i584.i = or disjoint i64 %and13.i581.i, %shl15.i583.i
  %arrayidx17.i585.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  store i64 %or16.i584.i, ptr %arrayidx17.i585.i, align 8
  %and18.i586.i = lshr i64 %50, 1
  %shr19.i587.i = and i64 %and18.i586.i, 6148914691236517205
  %and20.i588.i = and i64 %51, -6148914691236517206
  %or21.i589.i = or disjoint i64 %shr19.i587.i, %and20.i588.i
  %arrayidx22.i590.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  store i64 %or21.i589.i, ptr %arrayidx22.i590.i, align 8
  %arrayidx27.i591.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  %52 = load i64, ptr %arrayidx27.i591.i, align 8
  %arrayidx28.i592.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  %53 = load i64, ptr %arrayidx28.i592.i, align 8
  %and29.i593.i = and i64 %52, 6148914691236517205
  %and30.i594.i = shl i64 %53, 1
  %shl31.i595.i = and i64 %and30.i594.i, -6148914691236517206
  %or32.i596.i = or disjoint i64 %and29.i593.i, %shl31.i595.i
  %arrayidx33.i597.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  store i64 %or32.i596.i, ptr %arrayidx33.i597.i, align 8
  %and34.i598.i = lshr i64 %52, 1
  %shr35.i599.i = and i64 %and34.i598.i, 6148914691236517205
  %and36.i600.i = and i64 %53, -6148914691236517206
  %or37.i601.i = or disjoint i64 %shr35.i599.i, %and36.i600.i
  %arrayidx38.i602.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  store i64 %or37.i601.i, ptr %arrayidx38.i602.i, align 8
  %arrayidx43.i603.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  %54 = load i64, ptr %arrayidx43.i603.i, align 8
  %arrayidx44.i604.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  %55 = load i64, ptr %arrayidx44.i604.i, align 8
  %and45.i605.i = and i64 %54, 6148914691236517205
  %and46.i606.i = shl i64 %55, 1
  %shl47.i607.i = and i64 %and46.i606.i, -6148914691236517206
  %or48.i608.i = or disjoint i64 %and45.i605.i, %shl47.i607.i
  %arrayidx49.i609.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  store i64 %or48.i608.i, ptr %arrayidx49.i609.i, align 8
  %and50.i610.i = lshr i64 %54, 1
  %shr51.i611.i = and i64 %and50.i610.i, 6148914691236517205
  %and52.i612.i = and i64 %55, -6148914691236517206
  %or53.i613.i = or disjoint i64 %shr51.i611.i, %and52.i612.i
  %arrayidx54.i614.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  store i64 %or53.i613.i, ptr %arrayidx54.i614.i, align 8
  %56 = load i64, ptr %q.i.i, align 8
  %arrayidx60.i615.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  %57 = load i64, ptr %arrayidx60.i615.i, align 8
  %and61.i616.i = and i64 %56, 3689348814741910323
  %and62.i617.i = shl i64 %57, 2
  %shl63.i618.i = and i64 %and62.i617.i, -3689348814741910324
  %or64.i619.i = or disjoint i64 %and61.i616.i, %shl63.i618.i
  store i64 %or64.i619.i, ptr %q.i.i, align 8
  %and66.i620.i = lshr i64 %56, 2
  %shr67.i621.i = and i64 %and66.i620.i, 3689348814741910323
  %and68.i622.i = and i64 %57, -3689348814741910324
  %or69.i623.i = or disjoint i64 %shr67.i621.i, %and68.i622.i
  %arrayidx70.i624.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  store i64 %or69.i623.i, ptr %arrayidx70.i624.i, align 8
  %arrayidx75.i625.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  %58 = load i64, ptr %arrayidx75.i625.i, align 8
  %arrayidx76.i626.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  %59 = load i64, ptr %arrayidx76.i626.i, align 8
  %and77.i627.i = and i64 %58, 3689348814741910323
  %and78.i628.i = shl i64 %59, 2
  %shl79.i629.i = and i64 %and78.i628.i, -3689348814741910324
  %or80.i630.i = or disjoint i64 %and77.i627.i, %shl79.i629.i
  %arrayidx81.i631.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  store i64 %or80.i630.i, ptr %arrayidx81.i631.i, align 8
  %and82.i632.i = lshr i64 %58, 2
  %shr83.i633.i = and i64 %and82.i632.i, 3689348814741910323
  %and84.i634.i = and i64 %59, -3689348814741910324
  %or85.i635.i = or disjoint i64 %shr83.i633.i, %and84.i634.i
  %arrayidx86.i636.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  store i64 %or85.i635.i, ptr %arrayidx86.i636.i, align 8
  %arrayidx91.i637.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  %60 = load i64, ptr %arrayidx91.i637.i, align 8
  %arrayidx92.i638.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  %61 = load i64, ptr %arrayidx92.i638.i, align 8
  %and93.i639.i = and i64 %60, 3689348814741910323
  %and94.i640.i = shl i64 %61, 2
  %shl95.i641.i = and i64 %and94.i640.i, -3689348814741910324
  %or96.i642.i = or disjoint i64 %and93.i639.i, %shl95.i641.i
  %arrayidx97.i643.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  store i64 %or96.i642.i, ptr %arrayidx97.i643.i, align 8
  %and98.i644.i = lshr i64 %60, 2
  %shr99.i645.i = and i64 %and98.i644.i, 3689348814741910323
  %and100.i646.i = and i64 %61, -3689348814741910324
  %or101.i647.i = or disjoint i64 %shr99.i645.i, %and100.i646.i
  %arrayidx102.i648.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  store i64 %or101.i647.i, ptr %arrayidx102.i648.i, align 8
  %arrayidx107.i649.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  %62 = load i64, ptr %arrayidx107.i649.i, align 8
  %arrayidx108.i650.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  %63 = load i64, ptr %arrayidx108.i650.i, align 8
  %and109.i651.i = and i64 %62, 3689348814741910323
  %and110.i652.i = shl i64 %63, 2
  %shl111.i653.i = and i64 %and110.i652.i, -3689348814741910324
  %or112.i654.i = or disjoint i64 %and109.i651.i, %shl111.i653.i
  %arrayidx113.i655.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  store i64 %or112.i654.i, ptr %arrayidx113.i655.i, align 8
  %and114.i656.i = lshr i64 %62, 2
  %shr115.i657.i = and i64 %and114.i656.i, 3689348814741910323
  %and116.i658.i = and i64 %63, -3689348814741910324
  %or117.i659.i = or disjoint i64 %shr115.i657.i, %and116.i658.i
  %arrayidx118.i660.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  store i64 %or117.i659.i, ptr %arrayidx118.i660.i, align 8
  %64 = load i64, ptr %q.i.i, align 8
  %arrayidx124.i661.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  %65 = load i64, ptr %arrayidx124.i661.i, align 8
  %and125.i662.i = and i64 %64, 1085102592571150095
  %and126.i663.i = shl i64 %65, 4
  %shl127.i664.i = and i64 %and126.i663.i, -1085102592571150096
  %or128.i665.i = or disjoint i64 %and125.i662.i, %shl127.i664.i
  store i64 %or128.i665.i, ptr %q.i.i, align 8
  %and130.i666.i = lshr i64 %64, 4
  %shr131.i667.i = and i64 %and130.i666.i, 1085102592571150095
  %and132.i668.i = and i64 %65, -1085102592571150096
  %or133.i669.i = or disjoint i64 %shr131.i667.i, %and132.i668.i
  %arrayidx134.i670.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 32
  store i64 %or133.i669.i, ptr %arrayidx134.i670.i, align 8
  %arrayidx139.i671.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  %66 = load i64, ptr %arrayidx139.i671.i, align 8
  %arrayidx140.i672.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  %67 = load i64, ptr %arrayidx140.i672.i, align 8
  %and141.i673.i = and i64 %66, 1085102592571150095
  %and142.i674.i = shl i64 %67, 4
  %shl143.i675.i = and i64 %and142.i674.i, -1085102592571150096
  %or144.i676.i = or disjoint i64 %and141.i673.i, %shl143.i675.i
  %arrayidx145.i677.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 8
  store i64 %or144.i676.i, ptr %arrayidx145.i677.i, align 8
  %and146.i678.i = lshr i64 %66, 4
  %shr147.i679.i = and i64 %and146.i678.i, 1085102592571150095
  %and148.i680.i = and i64 %67, -1085102592571150096
  %or149.i681.i = or disjoint i64 %shr147.i679.i, %and148.i680.i
  %arrayidx150.i682.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 40
  store i64 %or149.i681.i, ptr %arrayidx150.i682.i, align 8
  %arrayidx155.i683.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  %68 = load i64, ptr %arrayidx155.i683.i, align 8
  %arrayidx156.i684.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  %69 = load i64, ptr %arrayidx156.i684.i, align 8
  %and157.i685.i = and i64 %68, 1085102592571150095
  %and158.i686.i = shl i64 %69, 4
  %shl159.i687.i = and i64 %and158.i686.i, -1085102592571150096
  %or160.i688.i = or disjoint i64 %and157.i685.i, %shl159.i687.i
  %arrayidx161.i689.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 16
  store i64 %or160.i688.i, ptr %arrayidx161.i689.i, align 8
  %and162.i690.i = lshr i64 %68, 4
  %shr163.i691.i = and i64 %and162.i690.i, 1085102592571150095
  %and164.i692.i = and i64 %69, -1085102592571150096
  %or165.i693.i = or disjoint i64 %shr163.i691.i, %and164.i692.i
  %arrayidx166.i694.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 48
  store i64 %or165.i693.i, ptr %arrayidx166.i694.i, align 8
  %arrayidx171.i695.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  %70 = load i64, ptr %arrayidx171.i695.i, align 8
  %arrayidx172.i696.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  %71 = load i64, ptr %arrayidx172.i696.i, align 8
  %and173.i697.i = and i64 %70, 1085102592571150095
  %and174.i698.i = shl i64 %71, 4
  %shl175.i699.i = and i64 %and174.i698.i, -1085102592571150096
  %or176.i700.i = or disjoint i64 %and173.i697.i, %shl175.i699.i
  %arrayidx177.i701.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 24
  store i64 %or176.i700.i, ptr %arrayidx177.i701.i, align 8
  %and178.i702.i = lshr i64 %70, 4
  %shr179.i703.i = and i64 %and178.i702.i, 1085102592571150095
  %and180.i704.i = and i64 %71, -1085102592571150096
  %or181.i705.i = or disjoint i64 %shr179.i703.i, %and180.i704.i
  %arrayidx182.i706.i = getelementptr inbounds nuw i8, ptr %q.i.i, i32 56
  store i64 %or181.i705.i, ptr %arrayidx182.i706.i, align 8
  %72 = load i64, ptr %q.i.i, align 8
  %conv5.i.i = trunc i64 %72 to i32
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %q.i.i)
  %arrayidx9.i = getelementptr inbounds nuw [10 x i8], ptr @Rcon, i32 0, i32 %k.0.i1132
  %73 = load i8, ptr %arrayidx9.i, align 1
  %conv.i = zext i8 %73 to i32
  %xor.i = xor i32 %conv5.i.i, %conv.i
  br label %if.end16.i

if.end16.i:                                       ; preds = %for.body.i1006, %if.then.i1124
  %tmp.2.i = phi i32 [ %xor.i, %if.then.i1124 ], [ %tmp.0.i1133, %for.body.i1006 ]
  %sub17.i = add nsw i32 %i.0.i8561130, -4
  %arrayidx18.i = getelementptr inbounds nuw [60 x i32], ptr %skey.i830, i32 0, i32 %sub17.i
  %74 = load i32, ptr %arrayidx18.i, align 4
  %xor19.i = xor i32 %tmp.2.i, %74
  %arrayidx20.i1007 = getelementptr inbounds nuw [60 x i32], ptr %skey.i830, i32 0, i32 %i.0.i8561130
  store i32 %xor19.i, ptr %arrayidx20.i1007, align 4
  %inc.i1008 = add i32 %j.0.i1131, 1
  %cmp21.i = icmp eq i32 %inc.i1008, 4
  %spec.select.i = select i1 %cmp21.i, i32 0, i32 %inc.i1008
  %inc24.i = zext i1 %cmp21.i to i32
  %spec.select1.i = add i32 %k.0.i1132, %inc24.i
  %inc26.i = add nuw nsw i32 %i.0.i8561130, 1
  %exitcond.i857.not = icmp eq i32 %inc26.i, 44
  br i1 %exitcond.i857.not, label %for.cond27.i.preheader, label %for.body.i1006, !llvm.loop !54

for.body30.i:                                     ; preds = %for.cond27.i.preheader, %for.body30.i
  %j.2.i1135 = phi i32 [ 0, %for.cond27.i.preheader ], [ %add74.i, %for.body30.i ]
  %i.1.i8581134 = phi i32 [ 0, %for.cond27.i.preheader ], [ %add73.i, %for.body30.i ]
  %arrayidx32.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 32
  %add.ptr.i859 = getelementptr inbounds nuw i32, ptr %skey.i830, i32 %i.1.i8581134
  %75 = load i32, ptr %add.ptr.i859, align 4
  %conv.i7.i = zext i32 %75 to i64
  %arrayidx1.i8.i = getelementptr inbounds nuw i8, ptr %add.ptr.i859, i32 4
  %76 = load i32, ptr %arrayidx1.i8.i, align 4
  %conv2.i9.i = zext i32 %76 to i64
  %arrayidx3.i10.i = getelementptr inbounds nuw i8, ptr %add.ptr.i859, i32 8
  %77 = load i32, ptr %arrayidx3.i10.i, align 4
  %conv4.i11.i = zext i32 %77 to i64
  %arrayidx5.i.i860 = getelementptr inbounds nuw i8, ptr %add.ptr.i859, i32 12
  %78 = load i32, ptr %arrayidx5.i.i860, align 4
  %conv6.i.i861 = zext i32 %78 to i64
  %shl.i12.i862 = shl nuw nsw i64 %conv.i7.i, 16
  %or.i13.i = or i64 %shl.i12.i862, %conv.i7.i
  %shl7.i.i863 = shl nuw nsw i64 %conv2.i9.i, 16
  %or8.i.i864 = or i64 %shl7.i.i863, %conv2.i9.i
  %shl9.i14.i = shl nuw nsw i64 %conv4.i11.i, 16
  %or10.i15.i = or i64 %shl9.i14.i, %conv4.i11.i
  %shl11.i.i865 = shl nuw nsw i64 %conv6.i.i861, 16
  %or12.i.i866 = or i64 %shl11.i.i865, %conv6.i.i861
  %and.i.i867 = and i64 %or.i13.i, 281470681808895
  %and13.i.i868 = and i64 %or8.i.i864, 281470681808895
  %and14.i.i869 = and i64 %or10.i15.i, 281470681808895
  %and15.i.i870 = and i64 %or12.i.i866, 281470681808895
  %shl16.i.i871 = shl nuw nsw i64 %and.i.i867, 8
  %or17.i.i872 = or i64 %and.i.i867, %shl16.i.i871
  %shl18.i.i873 = shl nuw nsw i64 %and13.i.i868, 8
  %or19.i.i874 = or i64 %and13.i.i868, %shl18.i.i873
  %and24.i.i875 = and i64 %or17.i.i872, 71777214294589695
  %and25.i.i876 = and i64 %or19.i.i874, 71777214294589695
  %79 = shl nuw i64 %and14.i.i869, 16
  %80 = shl nuw nsw i64 %and14.i.i869, 8
  %and26.i.i877 = or i64 %79, %80
  %shl28.i.i878 = and i64 %and26.i.i877, -71777214294589696
  %or29.i.i879 = or disjoint i64 %and24.i.i875, %shl28.i.i878
  store i64 %or29.i.i879, ptr %q.i831, align 8
  %81 = shl nuw i64 %and15.i.i870, 16
  %82 = shl nuw nsw i64 %and15.i.i870, 8
  %and27.i.i880 = or i64 %81, %82
  %shl30.i.i881 = and i64 %and27.i.i880, -71777214294589696
  %or31.i.i882 = or disjoint i64 %and25.i.i876, %shl30.i.i881
  store i64 %or31.i.i882, ptr %arrayidx32.i, align 8
  %83 = load i64, ptr %q.i831, align 8
  %arrayidx35.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 8
  store i64 %83, ptr %arrayidx35.i, align 8
  %arrayidx37.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 16
  store i64 %83, ptr %arrayidx37.i, align 8
  %arrayidx39.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 24
  store i64 %83, ptr %arrayidx39.i, align 8
  %arrayidx40.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 32
  %84 = load i64, ptr %arrayidx40.i, align 8
  %arrayidx41.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 40
  store i64 %84, ptr %arrayidx41.i, align 8
  %arrayidx43.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 48
  store i64 %84, ptr %arrayidx43.i, align 8
  %arrayidx45.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 56
  store i64 %84, ptr %arrayidx45.i, align 8
  %85 = load i64, ptr %q.i831, align 8
  %arrayidx1.i139.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 8
  %86 = load i64, ptr %arrayidx1.i139.i, align 8
  %and.i140.i = and i64 %85, 6148914691236517205
  %and2.i.i883 = shl i64 %86, 1
  %shl.i141.i = and i64 %and2.i.i883, -6148914691236517206
  %or.i142.i = or disjoint i64 %and.i140.i, %shl.i141.i
  store i64 %or.i142.i, ptr %q.i831, align 8
  %and4.i.i884 = lshr i64 %85, 1
  %shr.i.i885 = and i64 %and4.i.i884, 6148914691236517205
  %and5.i.i886 = and i64 %86, -6148914691236517206
  %or6.i143.i = or disjoint i64 %shr.i.i885, %and5.i.i886
  %arrayidx7.i144.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 8
  store i64 %or6.i143.i, ptr %arrayidx7.i144.i, align 8
  %arrayidx11.i.i887 = getelementptr inbounds nuw i8, ptr %q.i831, i32 16
  %87 = load i64, ptr %arrayidx11.i.i887, align 8
  %arrayidx12.i.i888 = getelementptr inbounds nuw i8, ptr %q.i831, i32 24
  %88 = load i64, ptr %arrayidx12.i.i888, align 8
  %and13.i145.i = and i64 %87, 6148914691236517205
  %and14.i146.i = shl i64 %88, 1
  %shl15.i.i889 = and i64 %and14.i146.i, -6148914691236517206
  %or16.i.i890 = or disjoint i64 %and13.i145.i, %shl15.i.i889
  %arrayidx17.i.i891 = getelementptr inbounds nuw i8, ptr %q.i831, i32 16
  store i64 %or16.i.i890, ptr %arrayidx17.i.i891, align 8
  %and18.i.i892 = lshr i64 %87, 1
  %shr19.i.i893 = and i64 %and18.i.i892, 6148914691236517205
  %and20.i.i894 = and i64 %88, -6148914691236517206
  %or21.i.i895 = or disjoint i64 %shr19.i.i893, %and20.i.i894
  %arrayidx22.i.i896 = getelementptr inbounds nuw i8, ptr %q.i831, i32 24
  store i64 %or21.i.i895, ptr %arrayidx22.i.i896, align 8
  %arrayidx27.i.i897 = getelementptr inbounds nuw i8, ptr %q.i831, i32 32
  %89 = load i64, ptr %arrayidx27.i.i897, align 8
  %arrayidx28.i.i898 = getelementptr inbounds nuw i8, ptr %q.i831, i32 40
  %90 = load i64, ptr %arrayidx28.i.i898, align 8
  %and29.i.i899 = and i64 %89, 6148914691236517205
  %and30.i147.i = shl i64 %90, 1
  %shl31.i.i900 = and i64 %and30.i147.i, -6148914691236517206
  %or32.i.i901 = or disjoint i64 %and29.i.i899, %shl31.i.i900
  %arrayidx33.i.i902 = getelementptr inbounds nuw i8, ptr %q.i831, i32 32
  store i64 %or32.i.i901, ptr %arrayidx33.i.i902, align 8
  %and34.i148.i = lshr i64 %89, 1
  %shr35.i.i903 = and i64 %and34.i148.i, 6148914691236517205
  %and36.i.i904 = and i64 %90, -6148914691236517206
  %or37.i.i905 = or disjoint i64 %shr35.i.i903, %and36.i.i904
  %arrayidx38.i.i906 = getelementptr inbounds nuw i8, ptr %q.i831, i32 40
  store i64 %or37.i.i905, ptr %arrayidx38.i.i906, align 8
  %arrayidx43.i.i907 = getelementptr inbounds nuw i8, ptr %q.i831, i32 48
  %91 = load i64, ptr %arrayidx43.i.i907, align 8
  %arrayidx44.i.i908 = getelementptr inbounds nuw i8, ptr %q.i831, i32 56
  %92 = load i64, ptr %arrayidx44.i.i908, align 8
  %and45.i.i909 = and i64 %91, 6148914691236517205
  %and46.i.i910 = shl i64 %92, 1
  %shl47.i.i911 = and i64 %and46.i.i910, -6148914691236517206
  %or48.i.i912 = or disjoint i64 %and45.i.i909, %shl47.i.i911
  %arrayidx49.i.i913 = getelementptr inbounds nuw i8, ptr %q.i831, i32 48
  store i64 %or48.i.i912, ptr %arrayidx49.i.i913, align 8
  %and50.i.i914 = lshr i64 %91, 1
  %shr51.i.i915 = and i64 %and50.i.i914, 6148914691236517205
  %and52.i.i916 = and i64 %92, -6148914691236517206
  %or53.i.i917 = or disjoint i64 %shr51.i.i915, %and52.i.i916
  %arrayidx54.i.i918 = getelementptr inbounds nuw i8, ptr %q.i831, i32 56
  store i64 %or53.i.i917, ptr %arrayidx54.i.i918, align 8
  %93 = load i64, ptr %q.i831, align 8
  %arrayidx60.i.i919 = getelementptr inbounds nuw i8, ptr %q.i831, i32 16
  %94 = load i64, ptr %arrayidx60.i.i919, align 8
  %and61.i.i920 = and i64 %93, 3689348814741910323
  %and62.i.i921 = shl i64 %94, 2
  %shl63.i.i922 = and i64 %and62.i.i921, -3689348814741910324
  %or64.i.i923 = or disjoint i64 %and61.i.i920, %shl63.i.i922
  store i64 %or64.i.i923, ptr %q.i831, align 8
  %and66.i149.i = lshr i64 %93, 2
  %shr67.i.i924 = and i64 %and66.i149.i, 3689348814741910323
  %and68.i.i925 = and i64 %94, -3689348814741910324
  %or69.i.i926 = or disjoint i64 %shr67.i.i924, %and68.i.i925
  %arrayidx70.i.i927 = getelementptr inbounds nuw i8, ptr %q.i831, i32 16
  store i64 %or69.i.i926, ptr %arrayidx70.i.i927, align 8
  %arrayidx75.i.i928 = getelementptr inbounds nuw i8, ptr %q.i831, i32 8
  %95 = load i64, ptr %arrayidx75.i.i928, align 8
  %arrayidx76.i.i929 = getelementptr inbounds nuw i8, ptr %q.i831, i32 24
  %96 = load i64, ptr %arrayidx76.i.i929, align 8
  %and77.i150.i = and i64 %95, 3689348814741910323
  %and78.i151.i = shl i64 %96, 2
  %shl79.i.i930 = and i64 %and78.i151.i, -3689348814741910324
  %or80.i.i931 = or disjoint i64 %and77.i150.i, %shl79.i.i930
  %arrayidx81.i.i932 = getelementptr inbounds nuw i8, ptr %q.i831, i32 8
  store i64 %or80.i.i931, ptr %arrayidx81.i.i932, align 8
  %and82.i152.i = lshr i64 %95, 2
  %shr83.i.i933 = and i64 %and82.i152.i, 3689348814741910323
  %and84.i153.i = and i64 %96, -3689348814741910324
  %or85.i.i934 = or disjoint i64 %shr83.i.i933, %and84.i153.i
  %arrayidx86.i.i935 = getelementptr inbounds nuw i8, ptr %q.i831, i32 24
  store i64 %or85.i.i934, ptr %arrayidx86.i.i935, align 8
  %arrayidx91.i.i936 = getelementptr inbounds nuw i8, ptr %q.i831, i32 32
  %97 = load i64, ptr %arrayidx91.i.i936, align 8
  %arrayidx92.i.i937 = getelementptr inbounds nuw i8, ptr %q.i831, i32 48
  %98 = load i64, ptr %arrayidx92.i.i937, align 8
  %and93.i.i938 = and i64 %97, 3689348814741910323
  %and94.i.i939 = shl i64 %98, 2
  %shl95.i.i940 = and i64 %and94.i.i939, -3689348814741910324
  %or96.i.i941 = or disjoint i64 %and93.i.i938, %shl95.i.i940
  %arrayidx97.i.i942 = getelementptr inbounds nuw i8, ptr %q.i831, i32 32
  store i64 %or96.i.i941, ptr %arrayidx97.i.i942, align 8
  %and98.i.i943 = lshr i64 %97, 2
  %shr99.i.i944 = and i64 %and98.i.i943, 3689348814741910323
  %and100.i.i945 = and i64 %98, -3689348814741910324
  %or101.i.i946 = or disjoint i64 %shr99.i.i944, %and100.i.i945
  %arrayidx102.i.i947 = getelementptr inbounds nuw i8, ptr %q.i831, i32 48
  store i64 %or101.i.i946, ptr %arrayidx102.i.i947, align 8
  %arrayidx107.i.i948 = getelementptr inbounds nuw i8, ptr %q.i831, i32 40
  %99 = load i64, ptr %arrayidx107.i.i948, align 8
  %arrayidx108.i.i949 = getelementptr inbounds nuw i8, ptr %q.i831, i32 56
  %100 = load i64, ptr %arrayidx108.i.i949, align 8
  %and109.i.i950 = and i64 %99, 3689348814741910323
  %and110.i.i951 = shl i64 %100, 2
  %shl111.i.i952 = and i64 %and110.i.i951, -3689348814741910324
  %or112.i.i953 = or disjoint i64 %and109.i.i950, %shl111.i.i952
  %arrayidx113.i.i954 = getelementptr inbounds nuw i8, ptr %q.i831, i32 40
  store i64 %or112.i.i953, ptr %arrayidx113.i.i954, align 8
  %and114.i.i955 = lshr i64 %99, 2
  %shr115.i.i956 = and i64 %and114.i.i955, 3689348814741910323
  %and116.i.i957 = and i64 %100, -3689348814741910324
  %or117.i.i958 = or disjoint i64 %shr115.i.i956, %and116.i.i957
  %arrayidx118.i.i959 = getelementptr inbounds nuw i8, ptr %q.i831, i32 56
  store i64 %or117.i.i958, ptr %arrayidx118.i.i959, align 8
  %101 = load i64, ptr %q.i831, align 8
  %arrayidx124.i154.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 32
  %102 = load i64, ptr %arrayidx124.i154.i, align 8
  %and125.i.i960 = and i64 %101, 1085102592571150095
  %and126.i.i961 = shl i64 %102, 4
  %shl127.i.i962 = and i64 %and126.i.i961, -1085102592571150096
  %or128.i.i963 = or disjoint i64 %and125.i.i960, %shl127.i.i962
  store i64 %or128.i.i963, ptr %q.i831, align 8
  %and130.i.i964 = lshr i64 %101, 4
  %shr131.i.i965 = and i64 %and130.i.i964, 1085102592571150095
  %and132.i.i966 = and i64 %102, -1085102592571150096
  %or133.i.i967 = or disjoint i64 %shr131.i.i965, %and132.i.i966
  %arrayidx134.i.i968 = getelementptr inbounds nuw i8, ptr %q.i831, i32 32
  store i64 %or133.i.i967, ptr %arrayidx134.i.i968, align 8
  %arrayidx139.i.i969 = getelementptr inbounds nuw i8, ptr %q.i831, i32 8
  %103 = load i64, ptr %arrayidx139.i.i969, align 8
  %arrayidx140.i.i970 = getelementptr inbounds nuw i8, ptr %q.i831, i32 40
  %104 = load i64, ptr %arrayidx140.i.i970, align 8
  %and141.i.i971 = and i64 %103, 1085102592571150095
  %and142.i.i972 = shl i64 %104, 4
  %shl143.i.i973 = and i64 %and142.i.i972, -1085102592571150096
  %or144.i.i974 = or disjoint i64 %and141.i.i971, %shl143.i.i973
  %arrayidx145.i.i975 = getelementptr inbounds nuw i8, ptr %q.i831, i32 8
  store i64 %or144.i.i974, ptr %arrayidx145.i.i975, align 8
  %and146.i.i976 = lshr i64 %103, 4
  %shr147.i.i977 = and i64 %and146.i.i976, 1085102592571150095
  %and148.i.i978 = and i64 %104, -1085102592571150096
  %or149.i.i979 = or disjoint i64 %shr147.i.i977, %and148.i.i978
  %arrayidx150.i.i980 = getelementptr inbounds nuw i8, ptr %q.i831, i32 40
  store i64 %or149.i.i979, ptr %arrayidx150.i.i980, align 8
  %arrayidx155.i.i981 = getelementptr inbounds nuw i8, ptr %q.i831, i32 16
  %105 = load i64, ptr %arrayidx155.i.i981, align 8
  %arrayidx156.i.i982 = getelementptr inbounds nuw i8, ptr %q.i831, i32 48
  %106 = load i64, ptr %arrayidx156.i.i982, align 8
  %and157.i.i983 = and i64 %105, 1085102592571150095
  %and158.i.i984 = shl i64 %106, 4
  %shl159.i.i985 = and i64 %and158.i.i984, -1085102592571150096
  %or160.i.i986 = or disjoint i64 %and157.i.i983, %shl159.i.i985
  %arrayidx161.i.i987 = getelementptr inbounds nuw i8, ptr %q.i831, i32 16
  store i64 %or160.i.i986, ptr %arrayidx161.i.i987, align 8
  %and162.i.i988 = lshr i64 %105, 4
  %shr163.i.i989 = and i64 %and162.i.i988, 1085102592571150095
  %and164.i.i990 = and i64 %106, -1085102592571150096
  %or165.i.i991 = or disjoint i64 %shr163.i.i989, %and164.i.i990
  %arrayidx166.i.i992 = getelementptr inbounds nuw i8, ptr %q.i831, i32 48
  store i64 %or165.i.i991, ptr %arrayidx166.i.i992, align 8
  %arrayidx171.i.i993 = getelementptr inbounds nuw i8, ptr %q.i831, i32 24
  %107 = load i64, ptr %arrayidx171.i.i993, align 8
  %arrayidx172.i.i994 = getelementptr inbounds nuw i8, ptr %q.i831, i32 56
  %108 = load i64, ptr %arrayidx172.i.i994, align 8
  %and173.i.i995 = and i64 %107, 1085102592571150095
  %and174.i.i996 = shl i64 %108, 4
  %shl175.i.i997 = and i64 %and174.i.i996, -1085102592571150096
  %or176.i.i998 = or disjoint i64 %and173.i.i995, %shl175.i.i997
  %arrayidx177.i.i999 = getelementptr inbounds nuw i8, ptr %q.i831, i32 24
  store i64 %or176.i.i998, ptr %arrayidx177.i.i999, align 8
  %and178.i.i1000 = lshr i64 %107, 4
  %shr179.i.i1001 = and i64 %and178.i.i1000, 1085102592571150095
  %and180.i.i1002 = and i64 %108, -1085102592571150096
  %or181.i.i1003 = or disjoint i64 %shr179.i.i1001, %and180.i.i1002
  %arrayidx182.i.i1004 = getelementptr inbounds nuw i8, ptr %q.i831, i32 56
  store i64 %or181.i.i1003, ptr %arrayidx182.i.i1004, align 8
  %109 = load i64, ptr %q.i831, align 8
  %and.i1005 = and i64 %109, 1229782938247303441
  %arrayidx48.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 8
  %110 = load i64, ptr %arrayidx48.i, align 8
  %and49.i = and i64 %110, 2459565876494606882
  %or50.i = or disjoint i64 %and.i1005, %and49.i
  %arrayidx51.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 16
  %111 = load i64, ptr %arrayidx51.i, align 8
  %and52.i = and i64 %111, 4919131752989213764
  %or53.i = or disjoint i64 %or50.i, %and52.i
  %arrayidx54.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 24
  %112 = load i64, ptr %arrayidx54.i, align 8
  %and55.i = and i64 %112, -8608480567731124088
  %or56.i = or disjoint i64 %or53.i, %and55.i
  %arrayidx58.i = getelementptr inbounds nuw i64, ptr %skey.i, i32 %j.2.i1135
  store i64 %or56.i, ptr %arrayidx58.i, align 8
  %arrayidx59.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 32
  %113 = load i64, ptr %arrayidx59.i, align 8
  %and60.i = and i64 %113, 1229782938247303441
  %arrayidx61.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 40
  %114 = load i64, ptr %arrayidx61.i, align 8
  %and62.i = and i64 %114, 2459565876494606882
  %or63.i = or disjoint i64 %and60.i, %and62.i
  %arrayidx64.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 48
  %115 = load i64, ptr %arrayidx64.i, align 8
  %and65.i = and i64 %115, 4919131752989213764
  %or66.i = or disjoint i64 %or63.i, %and65.i
  %arrayidx67.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 56
  %116 = load i64, ptr %arrayidx67.i, align 8
  %and68.i = and i64 %116, -8608480567731124088
  %or69.i = or disjoint i64 %or66.i, %and68.i
  %add70.i = or disjoint i32 %j.2.i1135, 1
  %arrayidx71.i = getelementptr inbounds nuw i64, ptr %skey.i, i32 %add70.i
  store i64 %or69.i, ptr %arrayidx71.i, align 8
  %add73.i = add nuw nsw i32 %i.1.i8581134, 4
  %add74.i = add nuw nsw i32 %j.2.i1135, 2
  %cmp28.i = icmp samesign ult i32 %add73.i, 44
  br i1 %cmp28.i, label %for.body30.i, label %br_aes_ct64_keysched.exit, !llvm.loop !55

br_aes_ct64_keysched.exit:                        ; preds = %for.body30.i
  call void @llvm.lifetime.end.p0(i64 240, ptr nonnull %skey.i830)
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %q.i831)
  %117 = load ptr, ptr %ctx, align 4
  br label %for.body.i3

for.body.i3:                                      ; preds = %br_aes_ct64_keysched.exit, %for.body.i3
  %v.0.i1137 = phi i32 [ 0, %br_aes_ct64_keysched.exit ], [ %add21.i, %for.body.i3 ]
  %u.0.i1136 = phi i32 [ 0, %br_aes_ct64_keysched.exit ], [ %inc.i5, %for.body.i3 ]
  %arrayidx.i4 = getelementptr inbounds nuw i64, ptr %skey.i, i32 %u.0.i1136
  %118 = load i64, ptr %arrayidx.i4, align 8
  %and.i = and i64 %118, 1229782938247303441
  %and1.i = lshr i64 %118, 1
  %shr.i = and i64 %and1.i, 1229782938247303441
  %and2.i = lshr i64 %118, 2
  %shr4.i = and i64 %and2.i, 1229782938247303441
  %and3.i = lshr i64 %118, 3
  %shr5.i = and i64 %and3.i, 1229782938247303441
  %sub.i = mul nuw i64 %and.i, 15
  %arrayidx8.i = getelementptr inbounds nuw i64, ptr %117, i32 %v.0.i1137
  store i64 %sub.i, ptr %arrayidx8.i, align 8
  %sub10.i = mul nuw i64 %shr.i, 15
  %add11.i = or disjoint i32 %v.0.i1137, 1
  %arrayidx12.i = getelementptr inbounds nuw i64, ptr %117, i32 %add11.i
  store i64 %sub10.i, ptr %arrayidx12.i, align 8
  %sub14.i = mul nuw i64 %shr4.i, 15
  %add15.i = or disjoint i32 %v.0.i1137, 2
  %arrayidx16.i = getelementptr inbounds nuw i64, ptr %117, i32 %add15.i
  store i64 %sub14.i, ptr %arrayidx16.i, align 8
  %sub18.i = mul nuw i64 %shr5.i, 15
  %add19.i = or disjoint i32 %v.0.i1137, 3
  %arrayidx20.i = getelementptr inbounds nuw i64, ptr %117, i32 %add19.i
  store i64 %sub18.i, ptr %arrayidx20.i, align 8
  %inc.i5 = add nuw nsw i32 %u.0.i1136, 1
  %add21.i = add nuw nsw i32 %v.0.i1137, 4
  %exitcond.i2.not = icmp eq i32 %inc.i5, 22
  br i1 %exitcond.i2.not, label %br_aes_ct64_skey_expand.exit, label %for.body.i3, !llvm.loop !56

br_aes_ct64_skey_expand.exit:                     ; preds = %for.body.i3
  call void @llvm.lifetime.end.p0(i64 176, ptr nonnull %skey.i)
  %119 = load ptr, ptr %ctx, align 4
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %ivw.i)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %tmp.i)
  br label %while.body.i.i

while.body.i.i:                                   ; preds = %br_aes_ct64_skey_expand.exit, %while.body.i.i
  %v.addr.0.i.i1140 = phi ptr [ %ivw.i, %br_aes_ct64_skey_expand.exit ], [ %incdec.ptr.i.i, %while.body.i.i ]
  %num.addr.0.i.i1139 = phi i32 [ 3, %br_aes_ct64_skey_expand.exit ], [ %dec.i.i, %while.body.i.i ]
  %src.addr.0.i.i1138 = phi ptr [ %iv, %br_aes_ct64_skey_expand.exit ], [ %add.ptr.i.i, %while.body.i.i ]
  %dec.i.i = add nsw i32 %num.addr.0.i.i1139, -1
  %120 = load i8, ptr %src.addr.0.i.i1138, align 1
  %conv.i.i = zext i8 %120 to i32
  %arrayidx1.i.i = getelementptr inbounds nuw i8, ptr %src.addr.0.i.i1138, i32 1
  %121 = load i8, ptr %arrayidx1.i.i, align 1
  %conv2.i.i = zext i8 %121 to i32
  %shl.i.i = shl nuw nsw i32 %conv2.i.i, 8
  %or.i.i = or disjoint i32 %shl.i.i, %conv.i.i
  %arrayidx3.i.i = getelementptr inbounds nuw i8, ptr %src.addr.0.i.i1138, i32 2
  %122 = load i8, ptr %arrayidx3.i.i, align 1
  %conv4.i.i = zext i8 %122 to i32
  %shl5.i.i = shl nuw nsw i32 %conv4.i.i, 16
  %or6.i.i = or disjoint i32 %or.i.i, %shl5.i.i
  %arrayidx7.i.i = getelementptr inbounds nuw i8, ptr %src.addr.0.i.i1138, i32 3
  %123 = load i8, ptr %arrayidx7.i.i, align 1
  %conv8.i.i = zext i8 %123 to i32
  %shl9.i.i = shl nuw i32 %conv8.i.i, 24
  %or10.i.i = or disjoint i32 %or6.i.i, %shl9.i.i
  %incdec.ptr.i.i = getelementptr inbounds nuw i8, ptr %v.addr.0.i.i1140, i32 4
  store i32 %or10.i.i, ptr %v.addr.0.i.i1140, align 4
  %add.ptr.i.i = getelementptr inbounds nuw i8, ptr %src.addr.0.i.i1138, i32 4
  %cmp.not.i.i = icmp eq i32 %dec.i.i, 0
  br i1 %cmp.not.i.i, label %br_range_dec32le.exit.i, label %while.body.i.i, !llvm.loop !57

br_range_dec32le.exit.i:                          ; preds = %while.body.i.i
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %ivw.i, i32 16
  %call.i6 = call ptr @memcpy(ptr noundef nonnull %add.ptr.i, ptr noundef nonnull %ivw.i, i32 noundef 12) #8
  %add.ptr4.i = getelementptr inbounds nuw i8, ptr %ivw.i, i32 32
  %call6.i = call ptr @memcpy(ptr noundef nonnull %add.ptr4.i, ptr noundef nonnull %ivw.i, i32 noundef 12) #8
  %add.ptr8.i = getelementptr inbounds nuw i8, ptr %ivw.i, i32 48
  %call10.i = call ptr @memcpy(ptr noundef nonnull %add.ptr8.i, ptr noundef nonnull %ivw.i, i32 noundef 12) #8
  %arrayidx.i7 = getelementptr inbounds nuw i8, ptr %ivw.i, i32 12
  store i32 0, ptr %arrayidx.i7, align 4
  %arrayidx13.i = getelementptr inbounds nuw i8, ptr %ivw.i, i32 28
  store i32 16777216, ptr %arrayidx13.i, align 4
  %arrayidx16.i8 = getelementptr inbounds nuw i8, ptr %ivw.i, i32 44
  store i32 33554432, ptr %arrayidx16.i8, align 4
  %arrayidx19.i = getelementptr inbounds nuw i8, ptr %ivw.i, i32 60
  store i32 50331648, ptr %arrayidx19.i, align 4
  %cmp.i91149 = icmp ugt i32 %outputByteLen, 64
  br i1 %cmp.i91149, label %while.body.i.lr.ph, label %while.end.i

while.body.i.lr.ph:                               ; preds = %br_range_dec32le.exit.i
  br label %while.body.i

while.body.i:                                     ; preds = %while.body.i.lr.ph, %aes_ecb4x.exit
  %out.addr.0.i1151 = phi ptr [ %output, %while.body.i.lr.ph ], [ %add.ptr21.i, %aes_ecb4x.exit ]
  %outlen.addr.0.i1150 = phi i32 [ %outputByteLen, %while.body.i.lr.ph ], [ %sub.i15, %aes_ecb4x.exit ]
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %w.i)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %q.i)
  %call.i25 = call ptr @memcpy(ptr noundef nonnull %w.i, ptr noundef nonnull %ivw.i, i32 noundef 64) #8
  br label %for.body.i43

for.body.i43:                                     ; preds = %while.body.i, %for.body.i43
  %i.0.i271141 = phi i32 [ 0, %while.body.i ], [ %inc.i51, %for.body.i43 ]
  %arrayidx.i44 = getelementptr inbounds nuw [8 x i64], ptr %q.i, i32 0, i32 %i.0.i271141
  %add.i = or disjoint i32 %i.0.i271141, 4
  %arrayidx1.i = getelementptr inbounds nuw [8 x i64], ptr %q.i, i32 0, i32 %add.i
  %add.ptr.idx.i = shl nuw nsw i32 %i.0.i271141, 4
  %add.ptr.i45 = getelementptr inbounds nuw i8, ptr %w.i, i32 %add.ptr.idx.i
  %124 = load i32, ptr %add.ptr.i45, align 4
  %conv.i40.i = zext i32 %124 to i64
  %arrayidx1.i.i46 = getelementptr inbounds nuw i8, ptr %add.ptr.i45, i32 4
  %125 = load i32, ptr %arrayidx1.i.i46, align 4
  %conv2.i.i47 = zext i32 %125 to i64
  %arrayidx3.i.i48 = getelementptr inbounds nuw i8, ptr %add.ptr.i45, i32 8
  %126 = load i32, ptr %arrayidx3.i.i48, align 4
  %conv4.i41.i = zext i32 %126 to i64
  %arrayidx5.i42.i = getelementptr inbounds nuw i8, ptr %add.ptr.i45, i32 12
  %127 = load i32, ptr %arrayidx5.i42.i, align 4
  %conv6.i.i = zext i32 %127 to i64
  %shl.i43.i = shl nuw nsw i64 %conv.i40.i, 16
  %or.i44.i = or i64 %shl.i43.i, %conv.i40.i
  %shl7.i.i = shl nuw nsw i64 %conv2.i.i47, 16
  %or8.i.i = or i64 %shl7.i.i, %conv2.i.i47
  %shl9.i.i49 = shl nuw nsw i64 %conv4.i41.i, 16
  %or10.i.i50 = or i64 %shl9.i.i49, %conv4.i41.i
  %shl11.i.i = shl nuw nsw i64 %conv6.i.i, 16
  %or12.i45.i = or i64 %shl11.i.i, %conv6.i.i
  %and.i46.i = and i64 %or.i44.i, 281470681808895
  %and13.i47.i = and i64 %or8.i.i, 281470681808895
  %and14.i.i = and i64 %or10.i.i50, 281470681808895
  %and15.i.i = and i64 %or12.i45.i, 281470681808895
  %shl16.i.i = shl nuw nsw i64 %and.i46.i, 8
  %or17.i.i = or i64 %and.i46.i, %shl16.i.i
  %shl18.i.i = shl nuw nsw i64 %and13.i47.i, 8
  %or19.i.i = or i64 %and13.i47.i, %shl18.i.i
  %and24.i.i = and i64 %or17.i.i, 71777214294589695
  %and25.i.i = and i64 %or19.i.i, 71777214294589695
  %128 = shl nuw i64 %and14.i.i, 16
  %129 = shl nuw nsw i64 %and14.i.i, 8
  %and26.i.i = or i64 %128, %129
  %shl28.i.i = and i64 %and26.i.i, -71777214294589696
  %or29.i.i = or disjoint i64 %and24.i.i, %shl28.i.i
  store i64 %or29.i.i, ptr %arrayidx.i44, align 8
  %130 = shl nuw i64 %and15.i.i, 16
  %131 = shl nuw nsw i64 %and15.i.i, 8
  %and27.i.i = or i64 %130, %131
  %shl30.i.i = and i64 %and27.i.i, -71777214294589696
  %or31.i.i = or disjoint i64 %and25.i.i, %shl30.i.i
  store i64 %or31.i.i, ptr %arrayidx1.i, align 8
  %inc.i51 = add nuw nsw i32 %i.0.i271141, 1
  %exitcond.i28.not = icmp eq i32 %inc.i51, 4
  br i1 %exitcond.i28.not, label %for.end.i, label %for.body.i43, !llvm.loop !58

for.end.i:                                        ; preds = %for.body.i43
  %132 = load i64, ptr %q.i, align 8
  %arrayidx1.i241.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %133 = load i64, ptr %arrayidx1.i241.i, align 8
  %and.i242.i = and i64 %132, 6148914691236517205
  %and2.i243.i = shl i64 %133, 1
  %shl.i244.i = and i64 %and2.i243.i, -6148914691236517206
  %or.i245.i = or disjoint i64 %and.i242.i, %shl.i244.i
  store i64 %or.i245.i, ptr %q.i, align 8
  %and4.i246.i = lshr i64 %132, 1
  %shr.i247.i = and i64 %and4.i246.i, 6148914691236517205
  %and5.i.i = and i64 %133, -6148914691236517206
  %or6.i248.i = or disjoint i64 %shr.i247.i, %and5.i.i
  %arrayidx7.i249.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or6.i248.i, ptr %arrayidx7.i249.i, align 8
  %arrayidx11.i250.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %134 = load i64, ptr %arrayidx11.i250.i, align 8
  %arrayidx12.i251.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %135 = load i64, ptr %arrayidx12.i251.i, align 8
  %and13.i252.i = and i64 %134, 6148914691236517205
  %and14.i253.i = shl i64 %135, 1
  %shl15.i.i = and i64 %and14.i253.i, -6148914691236517206
  %or16.i.i = or disjoint i64 %and13.i252.i, %shl15.i.i
  %arrayidx17.i254.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or16.i.i, ptr %arrayidx17.i254.i, align 8
  %and18.i.i = lshr i64 %134, 1
  %shr19.i.i = and i64 %and18.i.i, 6148914691236517205
  %and20.i.i = and i64 %135, -6148914691236517206
  %or21.i.i = or disjoint i64 %shr19.i.i, %and20.i.i
  %arrayidx22.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or21.i.i, ptr %arrayidx22.i.i, align 8
  %arrayidx27.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %136 = load i64, ptr %arrayidx27.i.i, align 8
  %arrayidx28.i255.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %137 = load i64, ptr %arrayidx28.i255.i, align 8
  %and29.i.i = and i64 %136, 6148914691236517205
  %and30.i256.i = shl i64 %137, 1
  %shl31.i.i = and i64 %and30.i256.i, -6148914691236517206
  %or32.i257.i = or disjoint i64 %and29.i.i, %shl31.i.i
  %arrayidx33.i258.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or32.i257.i, ptr %arrayidx33.i258.i, align 8
  %and34.i259.i = lshr i64 %136, 1
  %shr35.i.i = and i64 %and34.i259.i, 6148914691236517205
  %and36.i.i = and i64 %137, -6148914691236517206
  %or37.i.i = or disjoint i64 %shr35.i.i, %and36.i.i
  %arrayidx38.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or37.i.i, ptr %arrayidx38.i.i, align 8
  %arrayidx43.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %138 = load i64, ptr %arrayidx43.i.i, align 8
  %arrayidx44.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %139 = load i64, ptr %arrayidx44.i.i, align 8
  %and45.i.i = and i64 %138, 6148914691236517205
  %and46.i.i = shl i64 %139, 1
  %shl47.i.i = and i64 %and46.i.i, -6148914691236517206
  %or48.i.i = or disjoint i64 %and45.i.i, %shl47.i.i
  %arrayidx49.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or48.i.i, ptr %arrayidx49.i.i, align 8
  %and50.i.i = lshr i64 %138, 1
  %shr51.i.i = and i64 %and50.i.i, 6148914691236517205
  %and52.i.i = and i64 %139, -6148914691236517206
  %or53.i.i = or disjoint i64 %shr51.i.i, %and52.i.i
  %arrayidx54.i260.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or53.i.i, ptr %arrayidx54.i260.i, align 8
  %140 = load i64, ptr %q.i, align 8
  %arrayidx60.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %141 = load i64, ptr %arrayidx60.i.i, align 8
  %and61.i.i = and i64 %140, 3689348814741910323
  %and62.i.i = shl i64 %141, 2
  %shl63.i.i = and i64 %and62.i.i, -3689348814741910324
  %or64.i.i = or disjoint i64 %and61.i.i, %shl63.i.i
  store i64 %or64.i.i, ptr %q.i, align 8
  %and66.i261.i = lshr i64 %140, 2
  %shr67.i.i = and i64 %and66.i261.i, 3689348814741910323
  %and68.i.i = and i64 %141, -3689348814741910324
  %or69.i.i = or disjoint i64 %shr67.i.i, %and68.i.i
  %arrayidx70.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or69.i.i, ptr %arrayidx70.i.i, align 8
  %arrayidx75.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %142 = load i64, ptr %arrayidx75.i.i, align 8
  %arrayidx76.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %143 = load i64, ptr %arrayidx76.i.i, align 8
  %and77.i262.i = and i64 %142, 3689348814741910323
  %and78.i263.i = shl i64 %143, 2
  %shl79.i.i = and i64 %and78.i263.i, -3689348814741910324
  %or80.i.i = or disjoint i64 %and77.i262.i, %shl79.i.i
  %arrayidx81.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or80.i.i, ptr %arrayidx81.i.i, align 8
  %and82.i264.i = lshr i64 %142, 2
  %shr83.i.i = and i64 %and82.i264.i, 3689348814741910323
  %and84.i265.i = and i64 %143, -3689348814741910324
  %or85.i.i = or disjoint i64 %shr83.i.i, %and84.i265.i
  %arrayidx86.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or85.i.i, ptr %arrayidx86.i.i, align 8
  %arrayidx91.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %144 = load i64, ptr %arrayidx91.i.i, align 8
  %arrayidx92.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %145 = load i64, ptr %arrayidx92.i.i, align 8
  %and93.i.i = and i64 %144, 3689348814741910323
  %and94.i.i = shl i64 %145, 2
  %shl95.i.i = and i64 %and94.i.i, -3689348814741910324
  %or96.i.i = or disjoint i64 %and93.i.i, %shl95.i.i
  %arrayidx97.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or96.i.i, ptr %arrayidx97.i.i, align 8
  %and98.i.i = lshr i64 %144, 2
  %shr99.i.i = and i64 %and98.i.i, 3689348814741910323
  %and100.i.i = and i64 %145, -3689348814741910324
  %or101.i.i = or disjoint i64 %shr99.i.i, %and100.i.i
  %arrayidx102.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or101.i.i, ptr %arrayidx102.i.i, align 8
  %arrayidx107.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %146 = load i64, ptr %arrayidx107.i.i, align 8
  %arrayidx108.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %147 = load i64, ptr %arrayidx108.i.i, align 8
  %and109.i.i = and i64 %146, 3689348814741910323
  %and110.i.i = shl i64 %147, 2
  %shl111.i.i = and i64 %and110.i.i, -3689348814741910324
  %or112.i.i = or disjoint i64 %and109.i.i, %shl111.i.i
  %arrayidx113.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or112.i.i, ptr %arrayidx113.i.i, align 8
  %and114.i.i = lshr i64 %146, 2
  %shr115.i.i = and i64 %and114.i.i, 3689348814741910323
  %and116.i.i = and i64 %147, -3689348814741910324
  %or117.i.i = or disjoint i64 %shr115.i.i, %and116.i.i
  %arrayidx118.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or117.i.i, ptr %arrayidx118.i.i, align 8
  %148 = load i64, ptr %q.i, align 8
  %arrayidx124.i266.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %149 = load i64, ptr %arrayidx124.i266.i, align 8
  %and125.i.i = and i64 %148, 1085102592571150095
  %and126.i.i = shl i64 %149, 4
  %shl127.i.i = and i64 %and126.i.i, -1085102592571150096
  %or128.i.i = or disjoint i64 %and125.i.i, %shl127.i.i
  store i64 %or128.i.i, ptr %q.i, align 8
  %and130.i.i = lshr i64 %148, 4
  %shr131.i.i = and i64 %and130.i.i, 1085102592571150095
  %and132.i.i = and i64 %149, -1085102592571150096
  %or133.i.i = or disjoint i64 %shr131.i.i, %and132.i.i
  %arrayidx134.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or133.i.i, ptr %arrayidx134.i.i, align 8
  %arrayidx139.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %150 = load i64, ptr %arrayidx139.i.i, align 8
  %arrayidx140.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %151 = load i64, ptr %arrayidx140.i.i, align 8
  %and141.i.i = and i64 %150, 1085102592571150095
  %and142.i.i = shl i64 %151, 4
  %shl143.i.i = and i64 %and142.i.i, -1085102592571150096
  %or144.i.i = or disjoint i64 %and141.i.i, %shl143.i.i
  %arrayidx145.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or144.i.i, ptr %arrayidx145.i.i, align 8
  %and146.i.i = lshr i64 %150, 4
  %shr147.i.i = and i64 %and146.i.i, 1085102592571150095
  %and148.i.i = and i64 %151, -1085102592571150096
  %or149.i.i = or disjoint i64 %shr147.i.i, %and148.i.i
  %arrayidx150.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or149.i.i, ptr %arrayidx150.i.i, align 8
  %arrayidx155.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %152 = load i64, ptr %arrayidx155.i.i, align 8
  %arrayidx156.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %153 = load i64, ptr %arrayidx156.i.i, align 8
  %and157.i.i = and i64 %152, 1085102592571150095
  %and158.i.i = shl i64 %153, 4
  %shl159.i.i = and i64 %and158.i.i, -1085102592571150096
  %or160.i.i = or disjoint i64 %and157.i.i, %shl159.i.i
  %arrayidx161.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or160.i.i, ptr %arrayidx161.i.i, align 8
  %and162.i.i = lshr i64 %152, 4
  %shr163.i.i = and i64 %and162.i.i, 1085102592571150095
  %and164.i.i = and i64 %153, -1085102592571150096
  %or165.i.i = or disjoint i64 %shr163.i.i, %and164.i.i
  %arrayidx166.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or165.i.i, ptr %arrayidx166.i.i, align 8
  %arrayidx171.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %154 = load i64, ptr %arrayidx171.i.i, align 8
  %arrayidx172.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %155 = load i64, ptr %arrayidx172.i.i, align 8
  %and173.i.i = and i64 %154, 1085102592571150095
  %and174.i.i = shl i64 %155, 4
  %shl175.i.i = and i64 %and174.i.i, -1085102592571150096
  %or176.i.i = or disjoint i64 %and173.i.i, %shl175.i.i
  %arrayidx177.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or176.i.i, ptr %arrayidx177.i.i, align 8
  %and178.i.i = lshr i64 %154, 4
  %shr179.i.i = and i64 %and178.i.i, 1085102592571150095
  %and180.i.i = and i64 %155, -1085102592571150096
  %or181.i267.i = or disjoint i64 %shr179.i.i, %and180.i.i
  %arrayidx182.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or181.i267.i, ptr %arrayidx182.i.i, align 8
  %156 = load i64, ptr %119, align 8
  %157 = load i64, ptr %q.i, align 8
  %xor.i.i = xor i64 %157, %156
  store i64 %xor.i.i, ptr %q.i, align 8
  %arrayidx2.i48.i = getelementptr inbounds nuw i8, ptr %119, i32 8
  %158 = load i64, ptr %arrayidx2.i48.i, align 8
  %arrayidx3.i49.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %159 = load i64, ptr %arrayidx3.i49.i, align 8
  %xor4.i.i = xor i64 %159, %158
  store i64 %xor4.i.i, ptr %arrayidx3.i49.i, align 8
  %arrayidx5.i50.i = getelementptr inbounds nuw i8, ptr %119, i32 16
  %160 = load i64, ptr %arrayidx5.i50.i, align 8
  %arrayidx6.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %161 = load i64, ptr %arrayidx6.i.i, align 8
  %xor7.i.i = xor i64 %161, %160
  store i64 %xor7.i.i, ptr %arrayidx6.i.i, align 8
  %arrayidx8.i51.i = getelementptr inbounds nuw i8, ptr %119, i32 24
  %162 = load i64, ptr %arrayidx8.i51.i, align 8
  %arrayidx9.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %163 = load i64, ptr %arrayidx9.i.i, align 8
  %xor10.i.i = xor i64 %163, %162
  store i64 %xor10.i.i, ptr %arrayidx9.i.i, align 8
  %arrayidx11.i.i = getelementptr inbounds nuw i8, ptr %119, i32 32
  %164 = load i64, ptr %arrayidx11.i.i, align 8
  %arrayidx12.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %165 = load i64, ptr %arrayidx12.i.i, align 8
  %xor13.i.i = xor i64 %165, %164
  store i64 %xor13.i.i, ptr %arrayidx12.i.i, align 8
  %arrayidx14.i.i = getelementptr inbounds nuw i8, ptr %119, i32 40
  %166 = load i64, ptr %arrayidx14.i.i, align 8
  %arrayidx15.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %167 = load i64, ptr %arrayidx15.i.i, align 8
  %xor16.i.i = xor i64 %167, %166
  store i64 %xor16.i.i, ptr %arrayidx15.i.i, align 8
  %arrayidx17.i.i = getelementptr inbounds nuw i8, ptr %119, i32 48
  %168 = load i64, ptr %arrayidx17.i.i, align 8
  %arrayidx18.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %169 = load i64, ptr %arrayidx18.i.i, align 8
  %xor19.i.i = xor i64 %169, %168
  store i64 %xor19.i.i, ptr %arrayidx18.i.i, align 8
  %arrayidx20.i.i = getelementptr inbounds nuw i8, ptr %119, i32 56
  %170 = load i64, ptr %arrayidx20.i.i, align 8
  %arrayidx21.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %171 = load i64, ptr %arrayidx21.i.i, align 8
  %xor22.i.i = xor i64 %171, %170
  store i64 %xor22.i.i, ptr %arrayidx21.i.i, align 8
  br label %for.body7.i

for.body7.i:                                      ; preds = %for.end.i, %shift_rows.exit28.i
  %i.1.i1143 = phi i32 [ 1, %for.end.i ], [ %inc15.i, %shift_rows.exit28.i ]
  %arrayidx.i122.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %172 = load i64, ptr %arrayidx.i122.i, align 8
  %arrayidx1.i123.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %173 = load i64, ptr %arrayidx1.i123.i, align 8
  %arrayidx2.i124.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %174 = load i64, ptr %arrayidx2.i124.i, align 8
  %arrayidx3.i125.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %175 = load i64, ptr %arrayidx3.i125.i, align 8
  %arrayidx4.i126.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %176 = load i64, ptr %arrayidx4.i126.i, align 8
  %arrayidx5.i127.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %177 = load i64, ptr %arrayidx5.i127.i, align 8
  %arrayidx6.i128.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %178 = load i64, ptr %arrayidx6.i128.i, align 8
  %179 = load i64, ptr %q.i, align 8
  %xor.i129.i = xor i64 %175, %177
  %xor8.i130.i = xor i64 %172, %178
  %xor9.i131.i = xor i64 %172, %175
  %xor10.i132.i = xor i64 %172, %177
  %xor11.i133.i = xor i64 %173, %174
  %xor12.i134.i = xor i64 %xor11.i133.i, %179
  %xor13.i135.i = xor i64 %xor12.i134.i, %175
  %xor14.i136.i = xor i64 %xor8.i130.i, %xor.i129.i
  %xor15.i137.i = xor i64 %xor12.i134.i, %172
  %xor16.i138.i = xor i64 %xor12.i134.i, %178
  %xor17.i139.i = xor i64 %xor16.i138.i, %xor10.i132.i
  %xor18.i140.i = xor i64 %176, %xor14.i136.i
  %xor19.i141.i = xor i64 %xor18.i140.i, %177
  %xor20.i142.i = xor i64 %xor18.i140.i, %173
  %xor21.i143.i = xor i64 %xor19.i141.i, %179
  %xor22.i144.i = xor i64 %xor19.i141.i, %xor11.i133.i
  %xor23.i145.i = xor i64 %xor20.i142.i, %xor9.i131.i
  %xor24.i146.i = xor i64 %179, %xor23.i145.i
  %xor25.i147.i = xor i64 %xor22.i144.i, %xor23.i145.i
  %xor27.i148.i = xor i64 %xor11.i133.i, %xor23.i145.i
  %and.i149.i = and i64 %xor14.i136.i, %xor19.i141.i
  %and30.i150.i = and i64 %xor17.i139.i, %xor21.i143.i
  %xor31.i151.i = xor i64 %and30.i150.i, %and.i149.i
  %and32.i152.i = and i64 %xor13.i135.i, %179
  %and34.i153.i = and i64 %xor8.i130.i, %xor27.i148.i
  %and35.i154.i = and i64 %xor16.i138.i, %xor12.i134.i
  %and37.i155.i = and i64 %xor15.i137.i, %xor24.i146.i
  %and39.i156.i = and i64 %xor9.i131.i, %xor23.i145.i
  %and40.i157.i = and i64 %xor.i129.i, %xor25.i147.i
  %xor41.i158.i = xor i64 %and40.i157.i, %and39.i156.i
  %and42.i159.i = and i64 %xor10.i132.i, %xor22.i144.i
  %xor43.i160.i = xor i64 %and42.i159.i, %and39.i156.i
  %xor44.i161.i = xor i64 %xor31.i151.i, %xor41.i158.i
  %xor48.i162.i = xor i64 %xor44.i161.i, %xor20.i142.i
  %180 = xor i64 %xor10.i132.i, %and32.i152.i
  %181 = xor i64 %180, %xor22.i144.i
  %182 = xor i64 %181, %and.i149.i
  %xor49.i163.i = xor i64 %182, %xor43.i160.i
  %183 = xor i64 %xor27.i148.i, %and35.i154.i
  %184 = xor i64 %183, %xor8.i130.i
  %185 = xor i64 %184, %and34.i153.i
  %xor50.i164.i = xor i64 %185, %xor41.i158.i
  %186 = xor i64 %xor27.i148.i, %and37.i155.i
  %187 = xor i64 %186, %172
  %188 = xor i64 %187, %and34.i153.i
  %xor51.i165.i = xor i64 %188, %xor43.i160.i
  %xor52.i166.i = xor i64 %xor48.i162.i, %xor49.i163.i
  %and53.i167.i = and i64 %xor48.i162.i, %xor50.i164.i
  %xor54.i168.i = xor i64 %xor51.i165.i, %and53.i167.i
  %and55.i169.i = and i64 %xor52.i166.i, %xor54.i168.i
  %xor56.i170.i = xor i64 %and55.i169.i, %xor49.i163.i
  %xor57.i171.i = xor i64 %xor50.i164.i, %xor51.i165.i
  %xor58.i172.i = xor i64 %xor49.i163.i, %and53.i167.i
  %and59.i173.i = and i64 %xor58.i172.i, %xor57.i171.i
  %xor60.i174.i = xor i64 %and59.i173.i, %xor51.i165.i
  %xor61.i175.i = xor i64 %xor50.i164.i, %xor60.i174.i
  %xor62.i176.i = xor i64 %and59.i173.i, %and53.i167.i
  %and63.i177.i = and i64 %xor51.i165.i, %xor62.i176.i
  %xor64.i178.i = xor i64 %and63.i177.i, %xor61.i175.i
  %xor65.i179.i = xor i64 %xor54.i168.i, %and63.i177.i
  %and66.i180.i = and i64 %xor56.i170.i, %xor65.i179.i
  %xor67.i181.i = xor i64 %xor52.i166.i, %and66.i180.i
  %xor68.i182.i = xor i64 %xor67.i181.i, %xor64.i178.i
  %xor69.i183.i = xor i64 %xor56.i170.i, %xor60.i174.i
  %xor70.i184.i = xor i64 %xor56.i170.i, %xor67.i181.i
  %xor71.i185.i = xor i64 %and63.i177.i, %xor50.i164.i
  %xor72.i186.i = xor i64 %xor69.i183.i, %xor68.i182.i
  %and73.i187.i = and i64 %xor71.i185.i, %xor19.i141.i
  %and74.i188.i = and i64 %xor64.i178.i, %xor21.i143.i
  %and75.i189.i = and i64 %xor60.i174.i, %179
  %and76.i190.i = and i64 %xor70.i184.i, %xor27.i148.i
  %and77.i191.i = and i64 %xor67.i181.i, %xor12.i134.i
  %and78.i192.i = and i64 %xor56.i170.i, %xor24.i146.i
  %and79.i193.i = and i64 %xor69.i183.i, %xor23.i145.i
  %and80.i194.i = and i64 %xor72.i186.i, %xor25.i147.i
  %and81.i195.i = and i64 %xor68.i182.i, %xor22.i144.i
  %and82.i196.i = and i64 %xor71.i185.i, %xor14.i136.i
  %and83.i197.i = and i64 %xor64.i178.i, %xor17.i139.i
  %and84.i198.i = and i64 %xor60.i174.i, %xor13.i135.i
  %and85.i199.i = and i64 %xor70.i184.i, %xor8.i130.i
  %and86.i200.i = and i64 %xor67.i181.i, %xor16.i138.i
  %and87.i201.i = and i64 %xor56.i170.i, %xor15.i137.i
  %and88.i202.i = and i64 %xor69.i183.i, %xor9.i131.i
  %and89.i203.i = and i64 %xor72.i186.i, %xor.i129.i
  %and90.i204.i = and i64 %xor68.i182.i, %xor10.i132.i
  %xor91.i205.i = xor i64 %and88.i202.i, %and89.i203.i
  %xor92.i206.i = xor i64 %and83.i197.i, %and84.i198.i
  %xor93.i207.i = xor i64 %and78.i192.i, %and86.i200.i
  %xor94.i208.i = xor i64 %and82.i196.i, %and83.i197.i
  %xor95.i209.i = xor i64 %and75.i189.i, %and85.i199.i
  %xor96.i210.i = xor i64 %and75.i189.i, %and78.i192.i
  %xor97.i211.i = xor i64 %and80.i194.i, %and81.i195.i
  %xor98.i212.i = xor i64 %and73.i187.i, %and76.i190.i
  %xor99.i213.i = xor i64 %and79.i193.i, %and80.i194.i
  %xor100.i214.i = xor i64 %and89.i203.i, %and90.i204.i
  %xor101.i215.i = xor i64 %and85.i199.i, %xor93.i207.i
  %xor102.i216.i = xor i64 %xor95.i209.i, %xor98.i212.i
  %xor103.i217.i = xor i64 %and77.i191.i, %xor91.i205.i
  %xor104.i218.i = xor i64 %and76.i190.i, %xor99.i213.i
  %xor105.i219.i = xor i64 %xor91.i205.i, %xor102.i216.i
  %xor106.i220.i = xor i64 %and87.i201.i, %xor102.i216.i
  %xor107.i221.i = xor i64 %xor97.i211.i, %xor103.i217.i
  %xor108.i222.i = xor i64 %xor94.i208.i, %xor103.i217.i
  %xor109.i223.i = xor i64 %and77.i191.i, %xor104.i218.i
  %xor110.i224.i = xor i64 %xor106.i220.i, %xor107.i221.i
  %xor111.i225.i = xor i64 %and74.i188.i, %xor108.i222.i
  %xor112.i226.i = xor i64 %xor104.i218.i, %xor108.i222.i
  %189 = xor i64 %xor107.i221.i, %xor101.i215.i
  %xor113.i227.i = xor i64 %189, -1
  %190 = xor i64 %xor105.i219.i, %xor93.i207.i
  %xor115.i228.i = xor i64 %190, -1
  %xor117.i229.i = xor i64 %xor98.i212.i, %xor111.i225.i
  %xor118.i230.i = xor i64 %xor96.i210.i, %xor111.i225.i
  %xor119.i231.i = xor i64 %xor92.i206.i, %xor110.i224.i
  %191 = xor i64 %xor117.i229.i, %xor109.i223.i
  %xor121.i232.i = xor i64 %191, -1
  %192 = xor i64 %xor110.i224.i, %xor100.i214.i
  %193 = xor i64 %192, %xor109.i223.i
  %xor123.i233.i = xor i64 %193, -1
  %arrayidx124.i234.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %xor112.i226.i, ptr %arrayidx124.i234.i, align 8
  %arrayidx125.i235.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %xor121.i232.i, ptr %arrayidx125.i235.i, align 8
  %arrayidx126.i236.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %xor123.i233.i, ptr %arrayidx126.i236.i, align 8
  %arrayidx127.i237.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %xor117.i229.i, ptr %arrayidx127.i237.i, align 8
  %arrayidx128.i238.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %xor118.i230.i, ptr %arrayidx128.i238.i, align 8
  %arrayidx129.i239.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %xor119.i231.i, ptr %arrayidx129.i239.i, align 8
  %arrayidx130.i240.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %xor113.i227.i, ptr %arrayidx130.i240.i, align 8
  store i64 %xor115.i228.i, ptr %q.i, align 8
  br label %for.body.i5.i

for.body.i5.i:                                    ; preds = %for.body7.i, %for.body.i5.i
  %i.0.i3.i1142 = phi i32 [ 0, %for.body7.i ], [ %inc.i27.i, %for.body.i5.i ]
  %arrayidx.i6.i = getelementptr inbounds nuw i64, ptr %q.i, i32 %i.0.i3.i1142
  %194 = load i64, ptr %arrayidx.i6.i, align 8
  %and.i7.i = and i64 %194, 65535
  %and1.i8.i = lshr i64 %194, 4
  %shr.i9.i = and i64 %and1.i8.i, 268369920
  %or.i10.i = or disjoint i64 %and.i7.i, %shr.i9.i
  %and2.i11.i = shl i64 %194, 12
  %shl.i12.i = and i64 %and2.i11.i, 4026531840
  %or3.i13.i = or disjoint i64 %or.i10.i, %shl.i12.i
  %and4.i14.i = lshr i64 %194, 8
  %shr5.i15.i = and i64 %and4.i14.i, 1095216660480
  %or6.i16.i = or disjoint i64 %or3.i13.i, %shr5.i15.i
  %and7.i17.i = shl i64 %194, 8
  %shl8.i18.i = and i64 %and7.i17.i, 280375465082880
  %or9.i19.i = or disjoint i64 %or6.i16.i, %shl8.i18.i
  %and10.i20.i = lshr i64 %194, 12
  %shr11.i21.i = and i64 %and10.i20.i, 4222124650659840
  %or12.i22.i = or disjoint i64 %or9.i19.i, %shr11.i21.i
  %and13.i23.i = shl i64 %194, 4
  %shl14.i24.i = and i64 %and13.i23.i, -4503599627370496
  %or15.i25.i = or i64 %or12.i22.i, %shl14.i24.i
  %arrayidx16.i26.i = getelementptr inbounds nuw i64, ptr %q.i, i32 %i.0.i3.i1142
  store i64 %or15.i25.i, ptr %arrayidx16.i26.i, align 8
  %inc.i27.i = add nuw nsw i32 %i.0.i3.i1142, 1
  %exitcond.i4.i.not = icmp eq i32 %inc.i27.i, 8
  br i1 %exitcond.i4.i.not, label %shift_rows.exit28.i, label %for.body.i5.i, !llvm.loop !59

shift_rows.exit28.i:                              ; preds = %for.body.i5.i
  %195 = load i64, ptr %q.i, align 8
  %arrayidx1.i96.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %196 = load i64, ptr %arrayidx1.i96.i, align 8
  %arrayidx2.i97.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %197 = load i64, ptr %arrayidx2.i97.i, align 8
  %arrayidx3.i98.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %198 = load i64, ptr %arrayidx3.i98.i, align 8
  %arrayidx4.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %199 = load i64, ptr %arrayidx4.i.i, align 8
  %arrayidx5.i99.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %200 = load i64, ptr %arrayidx5.i99.i, align 8
  %arrayidx6.i100.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %201 = load i64, ptr %arrayidx6.i100.i, align 8
  %arrayidx7.i.i42 = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %202 = load i64, ptr %arrayidx7.i.i42, align 8
  %203 = call i64 @llvm.fshl.i64(i64 %195, i64 %195, i64 48)
  %204 = call i64 @llvm.fshl.i64(i64 %196, i64 %196, i64 48)
  %205 = call i64 @llvm.fshl.i64(i64 %197, i64 %197, i64 48)
  %206 = call i64 @llvm.fshl.i64(i64 %198, i64 %198, i64 48)
  %207 = call i64 @llvm.fshl.i64(i64 %199, i64 %199, i64 48)
  %208 = call i64 @llvm.fshl.i64(i64 %200, i64 %200, i64 48)
  %209 = call i64 @llvm.fshl.i64(i64 %201, i64 %201, i64 48)
  %210 = call i64 @llvm.fshl.i64(i64 %202, i64 %202, i64 48)
  %xor30.i.i = xor i64 %195, %203
  %211 = call i64 @llvm.fshl.i64(i64 %xor30.i.i, i64 %xor30.i.i, i64 32)
  %212 = xor i64 %210, %211
  %213 = xor i64 %212, %202
  %xor31.i.i = xor i64 %213, %203
  store i64 %xor31.i.i, ptr %q.i, align 8
  %xor37.i.i = xor i64 %196, %204
  %214 = call i64 @llvm.fshl.i64(i64 %xor37.i.i, i64 %xor37.i.i, i64 32)
  %215 = xor i64 %203, %214
  %216 = xor i64 %215, %195
  %217 = xor i64 %216, %202
  %218 = xor i64 %217, %210
  %xor39.i.i = xor i64 %218, %204
  %arrayidx40.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %xor39.i.i, ptr %arrayidx40.i.i, align 8
  %xor43.i.i = xor i64 %197, %205
  %219 = call i64 @llvm.fshl.i64(i64 %xor43.i.i, i64 %xor43.i.i, i64 32)
  %220 = xor i64 %204, %219
  %221 = xor i64 %220, %196
  %xor45.i.i = xor i64 %221, %205
  %arrayidx46.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %xor45.i.i, ptr %arrayidx46.i.i, align 8
  %xor51.i.i = xor i64 %198, %206
  %222 = call i64 @llvm.fshl.i64(i64 %xor51.i.i, i64 %xor51.i.i, i64 32)
  %223 = xor i64 %205, %222
  %224 = xor i64 %223, %197
  %225 = xor i64 %224, %202
  %226 = xor i64 %225, %210
  %xor53.i.i = xor i64 %226, %206
  %arrayidx54.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %xor53.i.i, ptr %arrayidx54.i.i, align 8
  %xor59.i.i = xor i64 %199, %207
  %227 = call i64 @llvm.fshl.i64(i64 %xor59.i.i, i64 %xor59.i.i, i64 32)
  %228 = xor i64 %206, %227
  %229 = xor i64 %228, %198
  %230 = xor i64 %229, %202
  %231 = xor i64 %230, %210
  %xor61.i.i = xor i64 %231, %207
  %arrayidx62.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %xor61.i.i, ptr %arrayidx62.i.i, align 8
  %xor65.i.i = xor i64 %200, %208
  %232 = call i64 @llvm.fshl.i64(i64 %xor65.i.i, i64 %xor65.i.i, i64 32)
  %233 = xor i64 %207, %232
  %234 = xor i64 %233, %199
  %xor67.i.i = xor i64 %234, %208
  %arrayidx68.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %xor67.i.i, ptr %arrayidx68.i.i, align 8
  %xor71.i.i = xor i64 %201, %209
  %235 = call i64 @llvm.fshl.i64(i64 %xor71.i.i, i64 %xor71.i.i, i64 32)
  %236 = xor i64 %208, %235
  %237 = xor i64 %236, %200
  %xor73.i.i = xor i64 %237, %209
  %arrayidx74.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %xor73.i.i, ptr %arrayidx74.i.i, align 8
  %xor77.i.i = xor i64 %202, %210
  %238 = call i64 @llvm.fshl.i64(i64 %xor77.i.i, i64 %xor77.i.i, i64 32)
  %239 = xor i64 %209, %238
  %240 = xor i64 %239, %201
  %xor79.i.i = xor i64 %240, %210
  %arrayidx80.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %xor79.i.i, ptr %arrayidx80.i.i, align 8
  %add.ptr13.idx.i = shl nuw nsw i32 %i.1.i1143, 6
  %add.ptr13.i = getelementptr inbounds nuw i8, ptr %119, i32 %add.ptr13.idx.i
  %241 = load i64, ptr %add.ptr13.i, align 8
  %242 = load i64, ptr %q.i, align 8
  %xor.i74.i = xor i64 %242, %241
  store i64 %xor.i74.i, ptr %q.i, align 8
  %arrayidx2.i75.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i, i32 8
  %243 = load i64, ptr %arrayidx2.i75.i, align 8
  %arrayidx3.i76.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %244 = load i64, ptr %arrayidx3.i76.i, align 8
  %xor4.i77.i = xor i64 %244, %243
  store i64 %xor4.i77.i, ptr %arrayidx3.i76.i, align 8
  %arrayidx5.i78.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i, i32 16
  %245 = load i64, ptr %arrayidx5.i78.i, align 8
  %arrayidx6.i79.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %246 = load i64, ptr %arrayidx6.i79.i, align 8
  %xor7.i80.i = xor i64 %246, %245
  store i64 %xor7.i80.i, ptr %arrayidx6.i79.i, align 8
  %arrayidx8.i81.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i, i32 24
  %247 = load i64, ptr %arrayidx8.i81.i, align 8
  %arrayidx9.i82.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %248 = load i64, ptr %arrayidx9.i82.i, align 8
  %xor10.i83.i = xor i64 %248, %247
  store i64 %xor10.i83.i, ptr %arrayidx9.i82.i, align 8
  %arrayidx11.i84.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i, i32 32
  %249 = load i64, ptr %arrayidx11.i84.i, align 8
  %arrayidx12.i85.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %250 = load i64, ptr %arrayidx12.i85.i, align 8
  %xor13.i86.i = xor i64 %250, %249
  store i64 %xor13.i86.i, ptr %arrayidx12.i85.i, align 8
  %arrayidx14.i87.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i, i32 40
  %251 = load i64, ptr %arrayidx14.i87.i, align 8
  %arrayidx15.i88.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %252 = load i64, ptr %arrayidx15.i88.i, align 8
  %xor16.i89.i = xor i64 %252, %251
  store i64 %xor16.i89.i, ptr %arrayidx15.i88.i, align 8
  %arrayidx17.i90.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i, i32 48
  %253 = load i64, ptr %arrayidx17.i90.i, align 8
  %arrayidx18.i91.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %254 = load i64, ptr %arrayidx18.i91.i, align 8
  %xor19.i92.i = xor i64 %254, %253
  store i64 %xor19.i92.i, ptr %arrayidx18.i91.i, align 8
  %arrayidx20.i93.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i, i32 56
  %255 = load i64, ptr %arrayidx20.i93.i, align 8
  %arrayidx21.i94.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %256 = load i64, ptr %arrayidx21.i94.i, align 8
  %xor22.i95.i = xor i64 %256, %255
  store i64 %xor22.i95.i, ptr %arrayidx21.i94.i, align 8
  %inc15.i = add nuw nsw i32 %i.1.i1143, 1
  %exitcond1.i.not = icmp eq i32 %inc15.i, 10
  br i1 %exitcond1.i.not, label %for.end16.i, label %for.body7.i, !llvm.loop !60

for.end16.i:                                      ; preds = %shift_rows.exit28.i
  %arrayidx.i101.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %257 = load i64, ptr %arrayidx.i101.i, align 8
  %arrayidx1.i102.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %258 = load i64, ptr %arrayidx1.i102.i, align 8
  %arrayidx2.i103.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %259 = load i64, ptr %arrayidx2.i103.i, align 8
  %arrayidx3.i104.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %260 = load i64, ptr %arrayidx3.i104.i, align 8
  %arrayidx4.i105.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %261 = load i64, ptr %arrayidx4.i105.i, align 8
  %arrayidx5.i106.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %262 = load i64, ptr %arrayidx5.i106.i, align 8
  %arrayidx6.i107.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %263 = load i64, ptr %arrayidx6.i107.i, align 8
  %264 = load i64, ptr %q.i, align 8
  %xor.i108.i = xor i64 %260, %262
  %xor8.i.i = xor i64 %257, %263
  %xor9.i.i = xor i64 %257, %260
  %xor10.i109.i = xor i64 %257, %262
  %xor11.i.i = xor i64 %258, %259
  %xor12.i.i = xor i64 %xor11.i.i, %264
  %xor13.i110.i = xor i64 %xor12.i.i, %260
  %xor14.i.i = xor i64 %xor8.i.i, %xor.i108.i
  %xor15.i.i = xor i64 %xor12.i.i, %257
  %xor16.i111.i = xor i64 %xor12.i.i, %263
  %xor17.i.i = xor i64 %xor16.i111.i, %xor10.i109.i
  %xor18.i.i = xor i64 %261, %xor14.i.i
  %xor19.i112.i = xor i64 %xor18.i.i, %262
  %xor20.i.i = xor i64 %xor18.i.i, %258
  %xor21.i.i = xor i64 %xor19.i112.i, %264
  %xor22.i113.i = xor i64 %xor19.i112.i, %xor11.i.i
  %xor23.i.i = xor i64 %xor20.i.i, %xor9.i.i
  %xor24.i.i = xor i64 %264, %xor23.i.i
  %xor25.i.i = xor i64 %xor22.i113.i, %xor23.i.i
  %xor27.i.i = xor i64 %xor11.i.i, %xor23.i.i
  %and.i114.i = and i64 %xor14.i.i, %xor19.i112.i
  %and30.i.i = and i64 %xor17.i.i, %xor21.i.i
  %xor31.i115.i = xor i64 %and30.i.i, %and.i114.i
  %and32.i.i = and i64 %xor13.i110.i, %264
  %and34.i.i = and i64 %xor8.i.i, %xor27.i.i
  %and35.i.i = and i64 %xor16.i111.i, %xor12.i.i
  %and37.i.i = and i64 %xor15.i.i, %xor24.i.i
  %and39.i.i = and i64 %xor9.i.i, %xor23.i.i
  %and40.i.i = and i64 %xor.i108.i, %xor25.i.i
  %xor41.i.i = xor i64 %and40.i.i, %and39.i.i
  %and42.i.i = and i64 %xor10.i109.i, %xor22.i113.i
  %xor43.i116.i = xor i64 %and42.i.i, %and39.i.i
  %xor44.i.i = xor i64 %xor31.i115.i, %xor41.i.i
  %xor48.i.i = xor i64 %xor44.i.i, %xor20.i.i
  %265 = xor i64 %xor10.i109.i, %and32.i.i
  %266 = xor i64 %265, %xor22.i113.i
  %267 = xor i64 %266, %and.i114.i
  %xor49.i.i = xor i64 %267, %xor43.i116.i
  %268 = xor i64 %xor27.i.i, %and35.i.i
  %269 = xor i64 %268, %xor8.i.i
  %270 = xor i64 %269, %and34.i.i
  %xor50.i.i = xor i64 %270, %xor41.i.i
  %271 = xor i64 %xor27.i.i, %and37.i.i
  %272 = xor i64 %271, %257
  %273 = xor i64 %272, %and34.i.i
  %xor51.i117.i = xor i64 %273, %xor43.i116.i
  %xor52.i.i = xor i64 %xor48.i.i, %xor49.i.i
  %and53.i.i = and i64 %xor48.i.i, %xor50.i.i
  %xor54.i.i = xor i64 %xor51.i117.i, %and53.i.i
  %and55.i.i = and i64 %xor52.i.i, %xor54.i.i
  %xor56.i.i = xor i64 %and55.i.i, %xor49.i.i
  %xor57.i.i = xor i64 %xor50.i.i, %xor51.i117.i
  %xor58.i.i = xor i64 %xor49.i.i, %and53.i.i
  %and59.i.i = and i64 %xor58.i.i, %xor57.i.i
  %xor60.i.i = xor i64 %and59.i.i, %xor51.i117.i
  %xor61.i118.i = xor i64 %xor50.i.i, %xor60.i.i
  %xor62.i.i = xor i64 %and59.i.i, %and53.i.i
  %and63.i.i = and i64 %xor51.i117.i, %xor62.i.i
  %xor64.i.i = xor i64 %and63.i.i, %xor61.i118.i
  %xor65.i119.i = xor i64 %xor54.i.i, %and63.i.i
  %and66.i.i = and i64 %xor56.i.i, %xor65.i119.i
  %xor67.i120.i = xor i64 %xor52.i.i, %and66.i.i
  %xor68.i.i = xor i64 %xor67.i120.i, %xor64.i.i
  %xor69.i.i = xor i64 %xor56.i.i, %xor60.i.i
  %xor70.i.i = xor i64 %xor56.i.i, %xor67.i120.i
  %xor71.i121.i = xor i64 %and63.i.i, %xor50.i.i
  %xor72.i.i = xor i64 %xor69.i.i, %xor68.i.i
  %and73.i.i = and i64 %xor71.i121.i, %xor19.i112.i
  %and74.i.i = and i64 %xor64.i.i, %xor21.i.i
  %and75.i.i = and i64 %xor60.i.i, %264
  %and76.i.i = and i64 %xor70.i.i, %xor27.i.i
  %and77.i.i = and i64 %xor67.i120.i, %xor12.i.i
  %and78.i.i = and i64 %xor56.i.i, %xor24.i.i
  %and79.i.i = and i64 %xor69.i.i, %xor23.i.i
  %and80.i.i = and i64 %xor72.i.i, %xor25.i.i
  %and81.i.i = and i64 %xor68.i.i, %xor22.i113.i
  %and82.i.i = and i64 %xor71.i121.i, %xor14.i.i
  %and83.i.i = and i64 %xor64.i.i, %xor17.i.i
  %and84.i.i = and i64 %xor60.i.i, %xor13.i110.i
  %and85.i.i = and i64 %xor70.i.i, %xor8.i.i
  %and86.i.i = and i64 %xor67.i120.i, %xor16.i111.i
  %and87.i.i = and i64 %xor56.i.i, %xor15.i.i
  %and88.i.i = and i64 %xor69.i.i, %xor9.i.i
  %and89.i.i = and i64 %xor72.i.i, %xor.i108.i
  %and90.i.i = and i64 %xor68.i.i, %xor10.i109.i
  %xor91.i.i = xor i64 %and88.i.i, %and89.i.i
  %xor92.i.i = xor i64 %and83.i.i, %and84.i.i
  %xor93.i.i = xor i64 %and78.i.i, %and86.i.i
  %xor94.i.i = xor i64 %and82.i.i, %and83.i.i
  %xor95.i.i = xor i64 %and75.i.i, %and85.i.i
  %xor96.i.i = xor i64 %and75.i.i, %and78.i.i
  %xor97.i.i = xor i64 %and80.i.i, %and81.i.i
  %xor98.i.i = xor i64 %and73.i.i, %and76.i.i
  %xor99.i.i = xor i64 %and79.i.i, %and80.i.i
  %xor100.i.i = xor i64 %and89.i.i, %and90.i.i
  %xor101.i.i = xor i64 %and85.i.i, %xor93.i.i
  %xor102.i.i = xor i64 %xor95.i.i, %xor98.i.i
  %xor103.i.i = xor i64 %and77.i.i, %xor91.i.i
  %xor104.i.i = xor i64 %and76.i.i, %xor99.i.i
  %xor105.i.i = xor i64 %xor91.i.i, %xor102.i.i
  %xor106.i.i = xor i64 %and87.i.i, %xor102.i.i
  %xor107.i.i = xor i64 %xor97.i.i, %xor103.i.i
  %xor108.i.i = xor i64 %xor94.i.i, %xor103.i.i
  %xor109.i.i = xor i64 %and77.i.i, %xor104.i.i
  %xor110.i.i = xor i64 %xor106.i.i, %xor107.i.i
  %xor111.i.i = xor i64 %and74.i.i, %xor108.i.i
  %xor112.i.i = xor i64 %xor104.i.i, %xor108.i.i
  %274 = xor i64 %xor107.i.i, %xor101.i.i
  %xor113.i.i = xor i64 %274, -1
  %275 = xor i64 %xor105.i.i, %xor93.i.i
  %xor115.i.i = xor i64 %275, -1
  %xor117.i.i = xor i64 %xor98.i.i, %xor111.i.i
  %xor118.i.i = xor i64 %xor96.i.i, %xor111.i.i
  %xor119.i.i = xor i64 %xor92.i.i, %xor110.i.i
  %276 = xor i64 %xor117.i.i, %xor109.i.i
  %xor121.i.i = xor i64 %276, -1
  %277 = xor i64 %xor110.i.i, %xor100.i.i
  %278 = xor i64 %277, %xor109.i.i
  %xor123.i.i = xor i64 %278, -1
  %arrayidx124.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %xor112.i.i, ptr %arrayidx124.i.i, align 8
  %arrayidx125.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %xor121.i.i, ptr %arrayidx125.i.i, align 8
  %arrayidx126.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %xor123.i.i, ptr %arrayidx126.i.i, align 8
  %arrayidx127.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %xor117.i.i, ptr %arrayidx127.i.i, align 8
  %arrayidx128.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %xor118.i.i, ptr %arrayidx128.i.i, align 8
  %arrayidx129.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %xor119.i.i, ptr %arrayidx129.i.i, align 8
  %arrayidx130.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %xor113.i.i, ptr %arrayidx130.i.i, align 8
  store i64 %xor115.i.i, ptr %q.i, align 8
  br label %for.body.i.i

for.body.i.i:                                     ; preds = %for.end16.i, %for.body.i.i
  %i.0.i.i1144 = phi i32 [ 0, %for.end16.i ], [ %inc.i.i, %for.body.i.i ]
  %arrayidx.i.i = getelementptr inbounds nuw i64, ptr %q.i, i32 %i.0.i.i1144
  %279 = load i64, ptr %arrayidx.i.i, align 8
  %and.i.i = and i64 %279, 65535
  %and1.i.i = lshr i64 %279, 4
  %shr.i1.i = and i64 %and1.i.i, 268369920
  %or.i.i39 = or disjoint i64 %and.i.i, %shr.i1.i
  %and2.i.i = shl i64 %279, 12
  %shl.i.i40 = and i64 %and2.i.i, 4026531840
  %or3.i.i = or disjoint i64 %or.i.i39, %shl.i.i40
  %and4.i.i = lshr i64 %279, 8
  %shr5.i.i = and i64 %and4.i.i, 1095216660480
  %or6.i.i41 = or disjoint i64 %or3.i.i, %shr5.i.i
  %and7.i.i = shl i64 %279, 8
  %shl8.i.i = and i64 %and7.i.i, 280375465082880
  %or9.i.i = or disjoint i64 %or6.i.i41, %shl8.i.i
  %and10.i.i = lshr i64 %279, 12
  %shr11.i.i = and i64 %and10.i.i, 4222124650659840
  %or12.i.i = or disjoint i64 %or9.i.i, %shr11.i.i
  %and13.i.i = shl i64 %279, 4
  %shl14.i.i = and i64 %and13.i.i, -4503599627370496
  %or15.i.i = or i64 %or12.i.i, %shl14.i.i
  %arrayidx16.i.i = getelementptr inbounds nuw i64, ptr %q.i, i32 %i.0.i.i1144
  store i64 %or15.i.i, ptr %arrayidx16.i.i, align 8
  %inc.i.i = add nuw nsw i32 %i.0.i.i1144, 1
  %exitcond.i.i.not = icmp eq i32 %inc.i.i, 8
  br i1 %exitcond.i.i.not, label %shift_rows.exit.i, label %for.body.i.i, !llvm.loop !61

shift_rows.exit.i:                                ; preds = %for.body.i.i
  %add.ptr20.i = getelementptr inbounds nuw i8, ptr %119, i32 640
  %280 = load i64, ptr %add.ptr20.i, align 8
  %281 = load i64, ptr %q.i, align 8
  %xor.i52.i = xor i64 %281, %280
  store i64 %xor.i52.i, ptr %q.i, align 8
  %arrayidx2.i53.i = getelementptr inbounds nuw i8, ptr %119, i32 648
  %282 = load i64, ptr %arrayidx2.i53.i, align 8
  %arrayidx3.i54.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %283 = load i64, ptr %arrayidx3.i54.i, align 8
  %xor4.i55.i = xor i64 %283, %282
  store i64 %xor4.i55.i, ptr %arrayidx3.i54.i, align 8
  %arrayidx5.i56.i = getelementptr inbounds nuw i8, ptr %119, i32 656
  %284 = load i64, ptr %arrayidx5.i56.i, align 8
  %arrayidx6.i57.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %285 = load i64, ptr %arrayidx6.i57.i, align 8
  %xor7.i58.i = xor i64 %285, %284
  store i64 %xor7.i58.i, ptr %arrayidx6.i57.i, align 8
  %arrayidx8.i59.i = getelementptr inbounds nuw i8, ptr %119, i32 664
  %286 = load i64, ptr %arrayidx8.i59.i, align 8
  %arrayidx9.i60.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %287 = load i64, ptr %arrayidx9.i60.i, align 8
  %xor10.i61.i = xor i64 %287, %286
  store i64 %xor10.i61.i, ptr %arrayidx9.i60.i, align 8
  %arrayidx11.i62.i = getelementptr inbounds nuw i8, ptr %119, i32 672
  %288 = load i64, ptr %arrayidx11.i62.i, align 8
  %arrayidx12.i63.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %289 = load i64, ptr %arrayidx12.i63.i, align 8
  %xor13.i64.i = xor i64 %289, %288
  store i64 %xor13.i64.i, ptr %arrayidx12.i63.i, align 8
  %arrayidx14.i65.i = getelementptr inbounds nuw i8, ptr %119, i32 680
  %290 = load i64, ptr %arrayidx14.i65.i, align 8
  %arrayidx15.i66.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %291 = load i64, ptr %arrayidx15.i66.i, align 8
  %xor16.i67.i = xor i64 %291, %290
  store i64 %xor16.i67.i, ptr %arrayidx15.i66.i, align 8
  %arrayidx17.i68.i = getelementptr inbounds nuw i8, ptr %119, i32 688
  %292 = load i64, ptr %arrayidx17.i68.i, align 8
  %arrayidx18.i69.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %293 = load i64, ptr %arrayidx18.i69.i, align 8
  %xor19.i70.i = xor i64 %293, %292
  store i64 %xor19.i70.i, ptr %arrayidx18.i69.i, align 8
  %arrayidx20.i71.i = getelementptr inbounds nuw i8, ptr %119, i32 696
  %294 = load i64, ptr %arrayidx20.i71.i, align 8
  %arrayidx21.i72.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %295 = load i64, ptr %arrayidx21.i72.i, align 8
  %xor22.i73.i = xor i64 %295, %294
  store i64 %xor22.i73.i, ptr %arrayidx21.i72.i, align 8
  %296 = load i64, ptr %q.i, align 8
  %arrayidx1.i268.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %297 = load i64, ptr %arrayidx1.i268.i, align 8
  %and.i269.i = and i64 %296, 6148914691236517205
  %and2.i270.i = shl i64 %297, 1
  %shl.i271.i = and i64 %and2.i270.i, -6148914691236517206
  %or.i272.i = or disjoint i64 %and.i269.i, %shl.i271.i
  store i64 %or.i272.i, ptr %q.i, align 8
  %and4.i273.i = lshr i64 %296, 1
  %shr.i274.i = and i64 %and4.i273.i, 6148914691236517205
  %and5.i275.i = and i64 %297, -6148914691236517206
  %or6.i276.i = or disjoint i64 %shr.i274.i, %and5.i275.i
  %arrayidx7.i277.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or6.i276.i, ptr %arrayidx7.i277.i, align 8
  %arrayidx11.i278.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %298 = load i64, ptr %arrayidx11.i278.i, align 8
  %arrayidx12.i279.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %299 = load i64, ptr %arrayidx12.i279.i, align 8
  %and13.i280.i = and i64 %298, 6148914691236517205
  %and14.i281.i = shl i64 %299, 1
  %shl15.i282.i = and i64 %and14.i281.i, -6148914691236517206
  %or16.i283.i = or disjoint i64 %and13.i280.i, %shl15.i282.i
  %arrayidx17.i284.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or16.i283.i, ptr %arrayidx17.i284.i, align 8
  %and18.i285.i = lshr i64 %298, 1
  %shr19.i286.i = and i64 %and18.i285.i, 6148914691236517205
  %and20.i287.i = and i64 %299, -6148914691236517206
  %or21.i288.i = or disjoint i64 %shr19.i286.i, %and20.i287.i
  %arrayidx22.i289.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or21.i288.i, ptr %arrayidx22.i289.i, align 8
  %arrayidx27.i290.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %300 = load i64, ptr %arrayidx27.i290.i, align 8
  %arrayidx28.i291.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %301 = load i64, ptr %arrayidx28.i291.i, align 8
  %and29.i292.i = and i64 %300, 6148914691236517205
  %and30.i293.i = shl i64 %301, 1
  %shl31.i294.i = and i64 %and30.i293.i, -6148914691236517206
  %or32.i295.i = or disjoint i64 %and29.i292.i, %shl31.i294.i
  %arrayidx33.i296.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or32.i295.i, ptr %arrayidx33.i296.i, align 8
  %and34.i297.i = lshr i64 %300, 1
  %shr35.i298.i = and i64 %and34.i297.i, 6148914691236517205
  %and36.i299.i = and i64 %301, -6148914691236517206
  %or37.i300.i = or disjoint i64 %shr35.i298.i, %and36.i299.i
  %arrayidx38.i301.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or37.i300.i, ptr %arrayidx38.i301.i, align 8
  %arrayidx43.i302.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %302 = load i64, ptr %arrayidx43.i302.i, align 8
  %arrayidx44.i303.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %303 = load i64, ptr %arrayidx44.i303.i, align 8
  %and45.i304.i = and i64 %302, 6148914691236517205
  %and46.i305.i = shl i64 %303, 1
  %shl47.i306.i = and i64 %and46.i305.i, -6148914691236517206
  %or48.i307.i = or disjoint i64 %and45.i304.i, %shl47.i306.i
  %arrayidx49.i308.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or48.i307.i, ptr %arrayidx49.i308.i, align 8
  %and50.i309.i = lshr i64 %302, 1
  %shr51.i310.i = and i64 %and50.i309.i, 6148914691236517205
  %and52.i311.i = and i64 %303, -6148914691236517206
  %or53.i312.i = or disjoint i64 %shr51.i310.i, %and52.i311.i
  %arrayidx54.i313.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or53.i312.i, ptr %arrayidx54.i313.i, align 8
  %304 = load i64, ptr %q.i, align 8
  %arrayidx60.i314.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %305 = load i64, ptr %arrayidx60.i314.i, align 8
  %and61.i315.i = and i64 %304, 3689348814741910323
  %and62.i316.i = shl i64 %305, 2
  %shl63.i317.i = and i64 %and62.i316.i, -3689348814741910324
  %or64.i318.i = or disjoint i64 %and61.i315.i, %shl63.i317.i
  store i64 %or64.i318.i, ptr %q.i, align 8
  %and66.i319.i = lshr i64 %304, 2
  %shr67.i320.i = and i64 %and66.i319.i, 3689348814741910323
  %and68.i321.i = and i64 %305, -3689348814741910324
  %or69.i322.i = or disjoint i64 %shr67.i320.i, %and68.i321.i
  %arrayidx70.i323.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or69.i322.i, ptr %arrayidx70.i323.i, align 8
  %arrayidx75.i324.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %306 = load i64, ptr %arrayidx75.i324.i, align 8
  %arrayidx76.i325.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %307 = load i64, ptr %arrayidx76.i325.i, align 8
  %and77.i326.i = and i64 %306, 3689348814741910323
  %and78.i327.i = shl i64 %307, 2
  %shl79.i328.i = and i64 %and78.i327.i, -3689348814741910324
  %or80.i329.i = or disjoint i64 %and77.i326.i, %shl79.i328.i
  %arrayidx81.i330.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or80.i329.i, ptr %arrayidx81.i330.i, align 8
  %and82.i331.i = lshr i64 %306, 2
  %shr83.i332.i = and i64 %and82.i331.i, 3689348814741910323
  %and84.i333.i = and i64 %307, -3689348814741910324
  %or85.i334.i = or disjoint i64 %shr83.i332.i, %and84.i333.i
  %arrayidx86.i335.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or85.i334.i, ptr %arrayidx86.i335.i, align 8
  %arrayidx91.i336.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %308 = load i64, ptr %arrayidx91.i336.i, align 8
  %arrayidx92.i337.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %309 = load i64, ptr %arrayidx92.i337.i, align 8
  %and93.i338.i = and i64 %308, 3689348814741910323
  %and94.i339.i = shl i64 %309, 2
  %shl95.i340.i = and i64 %and94.i339.i, -3689348814741910324
  %or96.i341.i = or disjoint i64 %and93.i338.i, %shl95.i340.i
  %arrayidx97.i342.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or96.i341.i, ptr %arrayidx97.i342.i, align 8
  %and98.i343.i = lshr i64 %308, 2
  %shr99.i344.i = and i64 %and98.i343.i, 3689348814741910323
  %and100.i345.i = and i64 %309, -3689348814741910324
  %or101.i346.i = or disjoint i64 %shr99.i344.i, %and100.i345.i
  %arrayidx102.i347.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or101.i346.i, ptr %arrayidx102.i347.i, align 8
  %arrayidx107.i348.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %310 = load i64, ptr %arrayidx107.i348.i, align 8
  %arrayidx108.i349.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %311 = load i64, ptr %arrayidx108.i349.i, align 8
  %and109.i350.i = and i64 %310, 3689348814741910323
  %and110.i351.i = shl i64 %311, 2
  %shl111.i352.i = and i64 %and110.i351.i, -3689348814741910324
  %or112.i353.i = or disjoint i64 %and109.i350.i, %shl111.i352.i
  %arrayidx113.i354.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or112.i353.i, ptr %arrayidx113.i354.i, align 8
  %and114.i355.i = lshr i64 %310, 2
  %shr115.i356.i = and i64 %and114.i355.i, 3689348814741910323
  %and116.i357.i = and i64 %311, -3689348814741910324
  %or117.i358.i = or disjoint i64 %shr115.i356.i, %and116.i357.i
  %arrayidx118.i359.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or117.i358.i, ptr %arrayidx118.i359.i, align 8
  %312 = load i64, ptr %q.i, align 8
  %arrayidx124.i360.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %313 = load i64, ptr %arrayidx124.i360.i, align 8
  %and125.i361.i = and i64 %312, 1085102592571150095
  %and126.i362.i = shl i64 %313, 4
  %shl127.i363.i = and i64 %and126.i362.i, -1085102592571150096
  %or128.i364.i = or disjoint i64 %and125.i361.i, %shl127.i363.i
  store i64 %or128.i364.i, ptr %q.i, align 8
  %and130.i365.i = lshr i64 %312, 4
  %shr131.i366.i = and i64 %and130.i365.i, 1085102592571150095
  %and132.i367.i = and i64 %313, -1085102592571150096
  %or133.i368.i = or disjoint i64 %shr131.i366.i, %and132.i367.i
  %arrayidx134.i369.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or133.i368.i, ptr %arrayidx134.i369.i, align 8
  %arrayidx139.i370.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %314 = load i64, ptr %arrayidx139.i370.i, align 8
  %arrayidx140.i371.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %315 = load i64, ptr %arrayidx140.i371.i, align 8
  %and141.i372.i = and i64 %314, 1085102592571150095
  %and142.i373.i = shl i64 %315, 4
  %shl143.i374.i = and i64 %and142.i373.i, -1085102592571150096
  %or144.i375.i = or disjoint i64 %and141.i372.i, %shl143.i374.i
  %arrayidx145.i376.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or144.i375.i, ptr %arrayidx145.i376.i, align 8
  %and146.i377.i = lshr i64 %314, 4
  %shr147.i378.i = and i64 %and146.i377.i, 1085102592571150095
  %and148.i379.i = and i64 %315, -1085102592571150096
  %or149.i380.i = or disjoint i64 %shr147.i378.i, %and148.i379.i
  %arrayidx150.i381.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or149.i380.i, ptr %arrayidx150.i381.i, align 8
  %arrayidx155.i382.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %316 = load i64, ptr %arrayidx155.i382.i, align 8
  %arrayidx156.i383.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %317 = load i64, ptr %arrayidx156.i383.i, align 8
  %and157.i384.i = and i64 %316, 1085102592571150095
  %and158.i385.i = shl i64 %317, 4
  %shl159.i386.i = and i64 %and158.i385.i, -1085102592571150096
  %or160.i387.i = or disjoint i64 %and157.i384.i, %shl159.i386.i
  %arrayidx161.i388.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or160.i387.i, ptr %arrayidx161.i388.i, align 8
  %and162.i389.i = lshr i64 %316, 4
  %shr163.i390.i = and i64 %and162.i389.i, 1085102592571150095
  %and164.i391.i = and i64 %317, -1085102592571150096
  %or165.i392.i = or disjoint i64 %shr163.i390.i, %and164.i391.i
  %arrayidx166.i393.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or165.i392.i, ptr %arrayidx166.i393.i, align 8
  %arrayidx171.i394.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %318 = load i64, ptr %arrayidx171.i394.i, align 8
  %arrayidx172.i395.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %319 = load i64, ptr %arrayidx172.i395.i, align 8
  %and173.i396.i = and i64 %318, 1085102592571150095
  %and174.i397.i = shl i64 %319, 4
  %shl175.i398.i = and i64 %and174.i397.i, -1085102592571150096
  %or176.i399.i = or disjoint i64 %and173.i396.i, %shl175.i398.i
  %arrayidx177.i400.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or176.i399.i, ptr %arrayidx177.i400.i, align 8
  %and178.i401.i = lshr i64 %318, 4
  %shr179.i402.i = and i64 %and178.i401.i, 1085102592571150095
  %and180.i403.i = and i64 %319, -1085102592571150096
  %or181.i404.i = or disjoint i64 %shr179.i402.i, %and180.i403.i
  %arrayidx182.i405.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or181.i404.i, ptr %arrayidx182.i405.i, align 8
  br label %for.body24.i

while.cond.i.i29.preheader:                       ; preds = %for.body24.i
  br label %while.body.i.i33

for.body24.i:                                     ; preds = %shift_rows.exit.i, %for.body24.i
  %i.2.i1145 = phi i32 [ 0, %shift_rows.exit.i ], [ %inc32.i, %for.body24.i ]
  %add.ptr27.idx.i = shl nuw nsw i32 %i.2.i1145, 4
  %add.ptr27.i = getelementptr inbounds nuw i8, ptr %w.i, i32 %add.ptr27.idx.i
  %arrayidx28.i = getelementptr inbounds nuw [8 x i64], ptr %q.i, i32 0, i32 %i.2.i1145
  %320 = load i64, ptr %arrayidx28.i, align 8
  %add29.i = or disjoint i32 %i.2.i1145, 4
  %arrayidx30.i = getelementptr inbounds nuw [8 x i64], ptr %q.i, i32 0, i32 %add29.i
  %321 = load i64, ptr %arrayidx30.i, align 8
  %and.i29.i = and i64 %320, 71777214294589695
  %and1.i30.i = and i64 %321, 71777214294589695
  %shr.i31.i = lshr i64 %320, 8
  %and2.i32.i = and i64 %shr.i31.i, 71776119077928960
  %shr3.i33.i = lshr i64 %321, 8
  %and4.i34.i = and i64 %shr3.i33.i, 71776119077928960
  %shr5.i35.i = lshr i64 %and.i29.i, 8
  %or.i36.i = or disjoint i64 %and.i29.i, %shr5.i35.i
  %shr6.i37.i = lshr i64 %and1.i30.i, 8
  %or7.i.i = or disjoint i64 %and1.i30.i, %shr6.i37.i
  %322 = and i64 %320, 280375465148160
  %323 = or disjoint i64 %and2.i32.i, %322
  %or9.i38.i = lshr exact i64 %323, 8
  %324 = and i64 %321, 280375465148160
  %325 = or disjoint i64 %and4.i34.i, %324
  %or11.i.i = lshr exact i64 %325, 8
  %and12.i.i = and i64 %or.i36.i, 281470681808895
  %and13.i39.i = and i64 %or7.i.i, 281470681808895
  %shr16.i.i = lshr i64 %and12.i.i, 16
  %or181.i.i = or disjoint i64 %and12.i.i, %shr16.i.i
  %or18.i.i = trunc i64 %or181.i.i to i32
  store i32 %or18.i.i, ptr %add.ptr27.i, align 4
  %shr20.i.i = lshr i64 %and13.i39.i, 16
  %or222.i.i = or disjoint i64 %and13.i39.i, %shr20.i.i
  %or22.i.i = trunc i64 %or222.i.i to i32
  %arrayidx23.i.i = getelementptr inbounds nuw i8, ptr %add.ptr27.i, i32 4
  store i32 %or22.i.i, ptr %arrayidx23.i.i, align 4
  %shr25.i.i = lshr i64 %323, 24
  %or273.i.i = or disjoint i64 %or9.i38.i, %shr25.i.i
  %or27.i.i = trunc i64 %or273.i.i to i32
  %arrayidx28.i.i = getelementptr inbounds nuw i8, ptr %add.ptr27.i, i32 8
  store i32 %or27.i.i, ptr %arrayidx28.i.i, align 4
  %shr30.i.i = lshr i64 %325, 24
  %or324.i.i = or disjoint i64 %or11.i.i, %shr30.i.i
  %or32.i.i = trunc i64 %or324.i.i to i32
  %arrayidx33.i.i = getelementptr inbounds nuw i8, ptr %add.ptr27.i, i32 12
  store i32 %or32.i.i, ptr %arrayidx33.i.i, align 4
  %inc32.i = add nuw nsw i32 %i.2.i1145, 1
  %exitcond2.i.not = icmp eq i32 %inc32.i, 4
  br i1 %exitcond2.i.not, label %while.cond.i.i29.preheader, label %for.body24.i, !llvm.loop !62

while.body.i.i33:                                 ; preds = %while.cond.i.i29.preheader, %while.body.i.i33
  %dst.addr.0.i.i1148 = phi ptr [ %out.addr.0.i1151, %while.cond.i.i29.preheader ], [ %add.ptr.i.i38, %while.body.i.i33 ]
  %v.addr.0.i.i311147 = phi ptr [ %w.i, %while.cond.i.i29.preheader ], [ %incdec.ptr.i.i35, %while.body.i.i33 ]
  %num.addr.0.i.i301146 = phi i32 [ 16, %while.cond.i.i29.preheader ], [ %dec.i.i34, %while.body.i.i33 ]
  %dec.i.i34 = add nsw i32 %num.addr.0.i.i301146, -1
  %incdec.ptr.i.i35 = getelementptr inbounds nuw i8, ptr %v.addr.0.i.i311147, i32 4
  %326 = load i32, ptr %v.addr.0.i.i311147, align 4
  %conv.i.i36 = trunc i32 %326 to i8
  store i8 %conv.i.i36, ptr %dst.addr.0.i.i1148, align 1
  %shr.i.i = lshr i32 %326, 8
  %conv1.i.i = trunc i32 %shr.i.i to i8
  %arrayidx2.i.i = getelementptr inbounds nuw i8, ptr %dst.addr.0.i.i1148, i32 1
  store i8 %conv1.i.i, ptr %arrayidx2.i.i, align 1
  %shr3.i.i = lshr i32 %326, 16
  %conv4.i.i37 = trunc i32 %shr3.i.i to i8
  %arrayidx5.i.i = getelementptr inbounds nuw i8, ptr %dst.addr.0.i.i1148, i32 2
  store i8 %conv4.i.i37, ptr %arrayidx5.i.i, align 1
  %shr6.i.i = lshr i32 %326, 24
  %conv7.i.i = trunc nuw i32 %shr6.i.i to i8
  %arrayidx8.i.i = getelementptr inbounds nuw i8, ptr %dst.addr.0.i.i1148, i32 3
  store i8 %conv7.i.i, ptr %arrayidx8.i.i, align 1
  %add.ptr.i.i38 = getelementptr inbounds nuw i8, ptr %dst.addr.0.i.i1148, i32 4
  %cmp.not.i.i32 = icmp eq i32 %dec.i.i34, 0
  br i1 %cmp.not.i.i32, label %aes_ecb4x.exit, label %while.body.i.i33, !llvm.loop !63

aes_ecb4x.exit:                                   ; preds = %while.body.i.i33
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %w.i)
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %q.i)
  %add.ptr.i16 = getelementptr inbounds nuw i8, ptr %ivw.i, i32 12
  %327 = load i32, ptr %add.ptr.i16, align 4
  %328 = call i32 @llvm.bswap.i32(i32 %327)
  %add.i8.i = add i32 %328, 4
  %329 = call i32 @llvm.bswap.i32(i32 %add.i8.i)
  store i32 %329, ptr %add.ptr.i16, align 4
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %ivw.i, i32 28
  %330 = load i32, ptr %add.ptr1.i, align 4
  %331 = call i32 @llvm.bswap.i32(i32 %330)
  %add.i5.i = add i32 %331, 4
  %332 = call i32 @llvm.bswap.i32(i32 %add.i5.i)
  store i32 %332, ptr %add.ptr1.i, align 4
  %add.ptr2.i = getelementptr inbounds nuw i8, ptr %ivw.i, i32 44
  %333 = load i32, ptr %add.ptr2.i, align 4
  %334 = call i32 @llvm.bswap.i32(i32 %333)
  %add.i2.i = add i32 %334, 4
  %335 = call i32 @llvm.bswap.i32(i32 %add.i2.i)
  store i32 %335, ptr %add.ptr2.i, align 4
  %add.ptr3.i = getelementptr inbounds nuw i8, ptr %ivw.i, i32 60
  %336 = load i32, ptr %add.ptr3.i, align 4
  %337 = call i32 @llvm.bswap.i32(i32 %336)
  %add.i.i = add i32 %337, 4
  %338 = call i32 @llvm.bswap.i32(i32 %add.i.i)
  store i32 %338, ptr %add.ptr3.i, align 4
  %add.ptr21.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i1151, i32 64
  %sub.i15 = add i32 %outlen.addr.0.i1150, -64
  %cmp.i9 = icmp ugt i32 %sub.i15, 64
  br i1 %cmp.i9, label %while.body.i, label %while.cond.i.while.end.i_crit_edge, !llvm.loop !64

while.cond.i.while.end.i_crit_edge:               ; preds = %aes_ecb4x.exit
  %split = phi i32 [ %sub.i15, %aes_ecb4x.exit ]
  %split1152 = phi ptr [ %add.ptr21.i, %aes_ecb4x.exit ]
  br label %while.end.i

while.end.i:                                      ; preds = %while.cond.i.while.end.i_crit_edge, %br_range_dec32le.exit.i
  %outlen.addr.0.i.lcssa = phi i32 [ %split, %while.cond.i.while.end.i_crit_edge ], [ %outputByteLen, %br_range_dec32le.exit.i ]
  %out.addr.0.i.lcssa = phi ptr [ %split1152, %while.cond.i.while.end.i_crit_edge ], [ %output, %br_range_dec32le.exit.i ]
  %cmp22.not.i = icmp eq i32 %outlen.addr.0.i.lcssa, 0
  br i1 %cmp22.not.i, label %aes_ctr.exit, label %if.then.i10

if.then.i10:                                      ; preds = %while.end.i
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %w.i52)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %q.i53)
  %call.i54 = call ptr @memcpy(ptr noundef nonnull %w.i52, ptr noundef nonnull %ivw.i, i32 noundef 64) #8
  br label %for.body.i791

for.body.i791:                                    ; preds = %if.then.i10, %for.body.i791
  %i.0.i561153 = phi i32 [ 0, %if.then.i10 ], [ %inc.i828, %for.body.i791 ]
  %arrayidx.i792 = getelementptr inbounds nuw [8 x i64], ptr %q.i53, i32 0, i32 %i.0.i561153
  %add.i793 = or disjoint i32 %i.0.i561153, 4
  %arrayidx1.i794 = getelementptr inbounds nuw [8 x i64], ptr %q.i53, i32 0, i32 %add.i793
  %add.ptr.idx.i795 = shl nuw nsw i32 %i.0.i561153, 4
  %add.ptr.i796 = getelementptr inbounds nuw i8, ptr %w.i52, i32 %add.ptr.idx.i795
  %339 = load i32, ptr %add.ptr.i796, align 4
  %conv.i40.i797 = zext i32 %339 to i64
  %arrayidx1.i.i798 = getelementptr inbounds nuw i8, ptr %add.ptr.i796, i32 4
  %340 = load i32, ptr %arrayidx1.i.i798, align 4
  %conv2.i.i799 = zext i32 %340 to i64
  %arrayidx3.i.i800 = getelementptr inbounds nuw i8, ptr %add.ptr.i796, i32 8
  %341 = load i32, ptr %arrayidx3.i.i800, align 4
  %conv4.i41.i801 = zext i32 %341 to i64
  %arrayidx5.i42.i802 = getelementptr inbounds nuw i8, ptr %add.ptr.i796, i32 12
  %342 = load i32, ptr %arrayidx5.i42.i802, align 4
  %conv6.i.i803 = zext i32 %342 to i64
  %shl.i43.i804 = shl nuw nsw i64 %conv.i40.i797, 16
  %or.i44.i805 = or i64 %shl.i43.i804, %conv.i40.i797
  %shl7.i.i806 = shl nuw nsw i64 %conv2.i.i799, 16
  %or8.i.i807 = or i64 %shl7.i.i806, %conv2.i.i799
  %shl9.i.i808 = shl nuw nsw i64 %conv4.i41.i801, 16
  %or10.i.i809 = or i64 %shl9.i.i808, %conv4.i41.i801
  %shl11.i.i810 = shl nuw nsw i64 %conv6.i.i803, 16
  %or12.i45.i811 = or i64 %shl11.i.i810, %conv6.i.i803
  %and.i46.i812 = and i64 %or.i44.i805, 281470681808895
  %and13.i47.i813 = and i64 %or8.i.i807, 281470681808895
  %and14.i.i814 = and i64 %or10.i.i809, 281470681808895
  %and15.i.i815 = and i64 %or12.i45.i811, 281470681808895
  %shl16.i.i816 = shl nuw nsw i64 %and.i46.i812, 8
  %or17.i.i817 = or i64 %and.i46.i812, %shl16.i.i816
  %shl18.i.i818 = shl nuw nsw i64 %and13.i47.i813, 8
  %or19.i.i819 = or i64 %and13.i47.i813, %shl18.i.i818
  %and24.i.i820 = and i64 %or17.i.i817, 71777214294589695
  %and25.i.i821 = and i64 %or19.i.i819, 71777214294589695
  %343 = shl nuw i64 %and14.i.i814, 16
  %344 = shl nuw nsw i64 %and14.i.i814, 8
  %and26.i.i822 = or i64 %343, %344
  %shl28.i.i823 = and i64 %and26.i.i822, -71777214294589696
  %or29.i.i824 = or disjoint i64 %and24.i.i820, %shl28.i.i823
  store i64 %or29.i.i824, ptr %arrayidx.i792, align 8
  %345 = shl nuw i64 %and15.i.i815, 16
  %346 = shl nuw nsw i64 %and15.i.i815, 8
  %and27.i.i825 = or i64 %345, %346
  %shl30.i.i826 = and i64 %and27.i.i825, -71777214294589696
  %or31.i.i827 = or disjoint i64 %and25.i.i821, %shl30.i.i826
  store i64 %or31.i.i827, ptr %arrayidx1.i794, align 8
  %inc.i828 = add nuw nsw i32 %i.0.i561153, 1
  %exitcond.i57.not = icmp eq i32 %inc.i828, 4
  br i1 %exitcond.i57.not, label %for.end.i58, label %for.body.i791, !llvm.loop !65

for.end.i58:                                      ; preds = %for.body.i791
  %347 = load i64, ptr %q.i53, align 8
  %arrayidx1.i241.i59 = getelementptr inbounds nuw i8, ptr %q.i53, i32 8
  %348 = load i64, ptr %arrayidx1.i241.i59, align 8
  %and.i242.i60 = and i64 %347, 6148914691236517205
  %and2.i243.i61 = shl i64 %348, 1
  %shl.i244.i62 = and i64 %and2.i243.i61, -6148914691236517206
  %or.i245.i63 = or disjoint i64 %and.i242.i60, %shl.i244.i62
  store i64 %or.i245.i63, ptr %q.i53, align 8
  %and4.i246.i64 = lshr i64 %347, 1
  %shr.i247.i65 = and i64 %and4.i246.i64, 6148914691236517205
  %and5.i.i66 = and i64 %348, -6148914691236517206
  %or6.i248.i67 = or disjoint i64 %shr.i247.i65, %and5.i.i66
  %arrayidx7.i249.i68 = getelementptr inbounds nuw i8, ptr %q.i53, i32 8
  store i64 %or6.i248.i67, ptr %arrayidx7.i249.i68, align 8
  %arrayidx11.i250.i69 = getelementptr inbounds nuw i8, ptr %q.i53, i32 16
  %349 = load i64, ptr %arrayidx11.i250.i69, align 8
  %arrayidx12.i251.i70 = getelementptr inbounds nuw i8, ptr %q.i53, i32 24
  %350 = load i64, ptr %arrayidx12.i251.i70, align 8
  %and13.i252.i71 = and i64 %349, 6148914691236517205
  %and14.i253.i72 = shl i64 %350, 1
  %shl15.i.i73 = and i64 %and14.i253.i72, -6148914691236517206
  %or16.i.i74 = or disjoint i64 %and13.i252.i71, %shl15.i.i73
  %arrayidx17.i254.i75 = getelementptr inbounds nuw i8, ptr %q.i53, i32 16
  store i64 %or16.i.i74, ptr %arrayidx17.i254.i75, align 8
  %and18.i.i76 = lshr i64 %349, 1
  %shr19.i.i77 = and i64 %and18.i.i76, 6148914691236517205
  %and20.i.i78 = and i64 %350, -6148914691236517206
  %or21.i.i79 = or disjoint i64 %shr19.i.i77, %and20.i.i78
  %arrayidx22.i.i80 = getelementptr inbounds nuw i8, ptr %q.i53, i32 24
  store i64 %or21.i.i79, ptr %arrayidx22.i.i80, align 8
  %arrayidx27.i.i81 = getelementptr inbounds nuw i8, ptr %q.i53, i32 32
  %351 = load i64, ptr %arrayidx27.i.i81, align 8
  %arrayidx28.i255.i82 = getelementptr inbounds nuw i8, ptr %q.i53, i32 40
  %352 = load i64, ptr %arrayidx28.i255.i82, align 8
  %and29.i.i83 = and i64 %351, 6148914691236517205
  %and30.i256.i84 = shl i64 %352, 1
  %shl31.i.i85 = and i64 %and30.i256.i84, -6148914691236517206
  %or32.i257.i86 = or disjoint i64 %and29.i.i83, %shl31.i.i85
  %arrayidx33.i258.i87 = getelementptr inbounds nuw i8, ptr %q.i53, i32 32
  store i64 %or32.i257.i86, ptr %arrayidx33.i258.i87, align 8
  %and34.i259.i88 = lshr i64 %351, 1
  %shr35.i.i89 = and i64 %and34.i259.i88, 6148914691236517205
  %and36.i.i90 = and i64 %352, -6148914691236517206
  %or37.i.i91 = or disjoint i64 %shr35.i.i89, %and36.i.i90
  %arrayidx38.i.i92 = getelementptr inbounds nuw i8, ptr %q.i53, i32 40
  store i64 %or37.i.i91, ptr %arrayidx38.i.i92, align 8
  %arrayidx43.i.i93 = getelementptr inbounds nuw i8, ptr %q.i53, i32 48
  %353 = load i64, ptr %arrayidx43.i.i93, align 8
  %arrayidx44.i.i94 = getelementptr inbounds nuw i8, ptr %q.i53, i32 56
  %354 = load i64, ptr %arrayidx44.i.i94, align 8
  %and45.i.i95 = and i64 %353, 6148914691236517205
  %and46.i.i96 = shl i64 %354, 1
  %shl47.i.i97 = and i64 %and46.i.i96, -6148914691236517206
  %or48.i.i98 = or disjoint i64 %and45.i.i95, %shl47.i.i97
  %arrayidx49.i.i99 = getelementptr inbounds nuw i8, ptr %q.i53, i32 48
  store i64 %or48.i.i98, ptr %arrayidx49.i.i99, align 8
  %and50.i.i100 = lshr i64 %353, 1
  %shr51.i.i101 = and i64 %and50.i.i100, 6148914691236517205
  %and52.i.i102 = and i64 %354, -6148914691236517206
  %or53.i.i103 = or disjoint i64 %shr51.i.i101, %and52.i.i102
  %arrayidx54.i260.i104 = getelementptr inbounds nuw i8, ptr %q.i53, i32 56
  store i64 %or53.i.i103, ptr %arrayidx54.i260.i104, align 8
  %355 = load i64, ptr %q.i53, align 8
  %arrayidx60.i.i105 = getelementptr inbounds nuw i8, ptr %q.i53, i32 16
  %356 = load i64, ptr %arrayidx60.i.i105, align 8
  %and61.i.i106 = and i64 %355, 3689348814741910323
  %and62.i.i107 = shl i64 %356, 2
  %shl63.i.i108 = and i64 %and62.i.i107, -3689348814741910324
  %or64.i.i109 = or disjoint i64 %and61.i.i106, %shl63.i.i108
  store i64 %or64.i.i109, ptr %q.i53, align 8
  %and66.i261.i110 = lshr i64 %355, 2
  %shr67.i.i111 = and i64 %and66.i261.i110, 3689348814741910323
  %and68.i.i112 = and i64 %356, -3689348814741910324
  %or69.i.i113 = or disjoint i64 %shr67.i.i111, %and68.i.i112
  %arrayidx70.i.i114 = getelementptr inbounds nuw i8, ptr %q.i53, i32 16
  store i64 %or69.i.i113, ptr %arrayidx70.i.i114, align 8
  %arrayidx75.i.i115 = getelementptr inbounds nuw i8, ptr %q.i53, i32 8
  %357 = load i64, ptr %arrayidx75.i.i115, align 8
  %arrayidx76.i.i116 = getelementptr inbounds nuw i8, ptr %q.i53, i32 24
  %358 = load i64, ptr %arrayidx76.i.i116, align 8
  %and77.i262.i117 = and i64 %357, 3689348814741910323
  %and78.i263.i118 = shl i64 %358, 2
  %shl79.i.i119 = and i64 %and78.i263.i118, -3689348814741910324
  %or80.i.i120 = or disjoint i64 %and77.i262.i117, %shl79.i.i119
  %arrayidx81.i.i121 = getelementptr inbounds nuw i8, ptr %q.i53, i32 8
  store i64 %or80.i.i120, ptr %arrayidx81.i.i121, align 8
  %and82.i264.i122 = lshr i64 %357, 2
  %shr83.i.i123 = and i64 %and82.i264.i122, 3689348814741910323
  %and84.i265.i124 = and i64 %358, -3689348814741910324
  %or85.i.i125 = or disjoint i64 %shr83.i.i123, %and84.i265.i124
  %arrayidx86.i.i126 = getelementptr inbounds nuw i8, ptr %q.i53, i32 24
  store i64 %or85.i.i125, ptr %arrayidx86.i.i126, align 8
  %arrayidx91.i.i127 = getelementptr inbounds nuw i8, ptr %q.i53, i32 32
  %359 = load i64, ptr %arrayidx91.i.i127, align 8
  %arrayidx92.i.i128 = getelementptr inbounds nuw i8, ptr %q.i53, i32 48
  %360 = load i64, ptr %arrayidx92.i.i128, align 8
  %and93.i.i129 = and i64 %359, 3689348814741910323
  %and94.i.i130 = shl i64 %360, 2
  %shl95.i.i131 = and i64 %and94.i.i130, -3689348814741910324
  %or96.i.i132 = or disjoint i64 %and93.i.i129, %shl95.i.i131
  %arrayidx97.i.i133 = getelementptr inbounds nuw i8, ptr %q.i53, i32 32
  store i64 %or96.i.i132, ptr %arrayidx97.i.i133, align 8
  %and98.i.i134 = lshr i64 %359, 2
  %shr99.i.i135 = and i64 %and98.i.i134, 3689348814741910323
  %and100.i.i136 = and i64 %360, -3689348814741910324
  %or101.i.i137 = or disjoint i64 %shr99.i.i135, %and100.i.i136
  %arrayidx102.i.i138 = getelementptr inbounds nuw i8, ptr %q.i53, i32 48
  store i64 %or101.i.i137, ptr %arrayidx102.i.i138, align 8
  %arrayidx107.i.i139 = getelementptr inbounds nuw i8, ptr %q.i53, i32 40
  %361 = load i64, ptr %arrayidx107.i.i139, align 8
  %arrayidx108.i.i140 = getelementptr inbounds nuw i8, ptr %q.i53, i32 56
  %362 = load i64, ptr %arrayidx108.i.i140, align 8
  %and109.i.i141 = and i64 %361, 3689348814741910323
  %and110.i.i142 = shl i64 %362, 2
  %shl111.i.i143 = and i64 %and110.i.i142, -3689348814741910324
  %or112.i.i144 = or disjoint i64 %and109.i.i141, %shl111.i.i143
  %arrayidx113.i.i145 = getelementptr inbounds nuw i8, ptr %q.i53, i32 40
  store i64 %or112.i.i144, ptr %arrayidx113.i.i145, align 8
  %and114.i.i146 = lshr i64 %361, 2
  %shr115.i.i147 = and i64 %and114.i.i146, 3689348814741910323
  %and116.i.i148 = and i64 %362, -3689348814741910324
  %or117.i.i149 = or disjoint i64 %shr115.i.i147, %and116.i.i148
  %arrayidx118.i.i150 = getelementptr inbounds nuw i8, ptr %q.i53, i32 56
  store i64 %or117.i.i149, ptr %arrayidx118.i.i150, align 8
  %363 = load i64, ptr %q.i53, align 8
  %arrayidx124.i266.i151 = getelementptr inbounds nuw i8, ptr %q.i53, i32 32
  %364 = load i64, ptr %arrayidx124.i266.i151, align 8
  %and125.i.i152 = and i64 %363, 1085102592571150095
  %and126.i.i153 = shl i64 %364, 4
  %shl127.i.i154 = and i64 %and126.i.i153, -1085102592571150096
  %or128.i.i155 = or disjoint i64 %and125.i.i152, %shl127.i.i154
  store i64 %or128.i.i155, ptr %q.i53, align 8
  %and130.i.i156 = lshr i64 %363, 4
  %shr131.i.i157 = and i64 %and130.i.i156, 1085102592571150095
  %and132.i.i158 = and i64 %364, -1085102592571150096
  %or133.i.i159 = or disjoint i64 %shr131.i.i157, %and132.i.i158
  %arrayidx134.i.i160 = getelementptr inbounds nuw i8, ptr %q.i53, i32 32
  store i64 %or133.i.i159, ptr %arrayidx134.i.i160, align 8
  %arrayidx139.i.i161 = getelementptr inbounds nuw i8, ptr %q.i53, i32 8
  %365 = load i64, ptr %arrayidx139.i.i161, align 8
  %arrayidx140.i.i162 = getelementptr inbounds nuw i8, ptr %q.i53, i32 40
  %366 = load i64, ptr %arrayidx140.i.i162, align 8
  %and141.i.i163 = and i64 %365, 1085102592571150095
  %and142.i.i164 = shl i64 %366, 4
  %shl143.i.i165 = and i64 %and142.i.i164, -1085102592571150096
  %or144.i.i166 = or disjoint i64 %and141.i.i163, %shl143.i.i165
  %arrayidx145.i.i167 = getelementptr inbounds nuw i8, ptr %q.i53, i32 8
  store i64 %or144.i.i166, ptr %arrayidx145.i.i167, align 8
  %and146.i.i168 = lshr i64 %365, 4
  %shr147.i.i169 = and i64 %and146.i.i168, 1085102592571150095
  %and148.i.i170 = and i64 %366, -1085102592571150096
  %or149.i.i171 = or disjoint i64 %shr147.i.i169, %and148.i.i170
  %arrayidx150.i.i172 = getelementptr inbounds nuw i8, ptr %q.i53, i32 40
  store i64 %or149.i.i171, ptr %arrayidx150.i.i172, align 8
  %arrayidx155.i.i173 = getelementptr inbounds nuw i8, ptr %q.i53, i32 16
  %367 = load i64, ptr %arrayidx155.i.i173, align 8
  %arrayidx156.i.i174 = getelementptr inbounds nuw i8, ptr %q.i53, i32 48
  %368 = load i64, ptr %arrayidx156.i.i174, align 8
  %and157.i.i175 = and i64 %367, 1085102592571150095
  %and158.i.i176 = shl i64 %368, 4
  %shl159.i.i177 = and i64 %and158.i.i176, -1085102592571150096
  %or160.i.i178 = or disjoint i64 %and157.i.i175, %shl159.i.i177
  %arrayidx161.i.i179 = getelementptr inbounds nuw i8, ptr %q.i53, i32 16
  store i64 %or160.i.i178, ptr %arrayidx161.i.i179, align 8
  %and162.i.i180 = lshr i64 %367, 4
  %shr163.i.i181 = and i64 %and162.i.i180, 1085102592571150095
  %and164.i.i182 = and i64 %368, -1085102592571150096
  %or165.i.i183 = or disjoint i64 %shr163.i.i181, %and164.i.i182
  %arrayidx166.i.i184 = getelementptr inbounds nuw i8, ptr %q.i53, i32 48
  store i64 %or165.i.i183, ptr %arrayidx166.i.i184, align 8
  %arrayidx171.i.i185 = getelementptr inbounds nuw i8, ptr %q.i53, i32 24
  %369 = load i64, ptr %arrayidx171.i.i185, align 8
  %arrayidx172.i.i186 = getelementptr inbounds nuw i8, ptr %q.i53, i32 56
  %370 = load i64, ptr %arrayidx172.i.i186, align 8
  %and173.i.i187 = and i64 %369, 1085102592571150095
  %and174.i.i188 = shl i64 %370, 4
  %shl175.i.i189 = and i64 %and174.i.i188, -1085102592571150096
  %or176.i.i190 = or disjoint i64 %and173.i.i187, %shl175.i.i189
  %arrayidx177.i.i191 = getelementptr inbounds nuw i8, ptr %q.i53, i32 24
  store i64 %or176.i.i190, ptr %arrayidx177.i.i191, align 8
  %and178.i.i192 = lshr i64 %369, 4
  %shr179.i.i193 = and i64 %and178.i.i192, 1085102592571150095
  %and180.i.i194 = and i64 %370, -1085102592571150096
  %or181.i267.i195 = or disjoint i64 %shr179.i.i193, %and180.i.i194
  %arrayidx182.i.i196 = getelementptr inbounds nuw i8, ptr %q.i53, i32 56
  store i64 %or181.i267.i195, ptr %arrayidx182.i.i196, align 8
  %371 = load i64, ptr %119, align 8
  %372 = load i64, ptr %q.i53, align 8
  %xor.i.i197 = xor i64 %372, %371
  store i64 %xor.i.i197, ptr %q.i53, align 8
  %arrayidx2.i48.i198 = getelementptr inbounds nuw i8, ptr %119, i32 8
  %373 = load i64, ptr %arrayidx2.i48.i198, align 8
  %arrayidx3.i49.i199 = getelementptr inbounds nuw i8, ptr %q.i53, i32 8
  %374 = load i64, ptr %arrayidx3.i49.i199, align 8
  %xor4.i.i200 = xor i64 %374, %373
  store i64 %xor4.i.i200, ptr %arrayidx3.i49.i199, align 8
  %arrayidx5.i50.i201 = getelementptr inbounds nuw i8, ptr %119, i32 16
  %375 = load i64, ptr %arrayidx5.i50.i201, align 8
  %arrayidx6.i.i202 = getelementptr inbounds nuw i8, ptr %q.i53, i32 16
  %376 = load i64, ptr %arrayidx6.i.i202, align 8
  %xor7.i.i203 = xor i64 %376, %375
  store i64 %xor7.i.i203, ptr %arrayidx6.i.i202, align 8
  %arrayidx8.i51.i204 = getelementptr inbounds nuw i8, ptr %119, i32 24
  %377 = load i64, ptr %arrayidx8.i51.i204, align 8
  %arrayidx9.i.i205 = getelementptr inbounds nuw i8, ptr %q.i53, i32 24
  %378 = load i64, ptr %arrayidx9.i.i205, align 8
  %xor10.i.i206 = xor i64 %378, %377
  store i64 %xor10.i.i206, ptr %arrayidx9.i.i205, align 8
  %arrayidx11.i.i207 = getelementptr inbounds nuw i8, ptr %119, i32 32
  %379 = load i64, ptr %arrayidx11.i.i207, align 8
  %arrayidx12.i.i208 = getelementptr inbounds nuw i8, ptr %q.i53, i32 32
  %380 = load i64, ptr %arrayidx12.i.i208, align 8
  %xor13.i.i209 = xor i64 %380, %379
  store i64 %xor13.i.i209, ptr %arrayidx12.i.i208, align 8
  %arrayidx14.i.i210 = getelementptr inbounds nuw i8, ptr %119, i32 40
  %381 = load i64, ptr %arrayidx14.i.i210, align 8
  %arrayidx15.i.i211 = getelementptr inbounds nuw i8, ptr %q.i53, i32 40
  %382 = load i64, ptr %arrayidx15.i.i211, align 8
  %xor16.i.i212 = xor i64 %382, %381
  store i64 %xor16.i.i212, ptr %arrayidx15.i.i211, align 8
  %arrayidx17.i.i213 = getelementptr inbounds nuw i8, ptr %119, i32 48
  %383 = load i64, ptr %arrayidx17.i.i213, align 8
  %arrayidx18.i.i214 = getelementptr inbounds nuw i8, ptr %q.i53, i32 48
  %384 = load i64, ptr %arrayidx18.i.i214, align 8
  %xor19.i.i215 = xor i64 %384, %383
  store i64 %xor19.i.i215, ptr %arrayidx18.i.i214, align 8
  %arrayidx20.i.i216 = getelementptr inbounds nuw i8, ptr %119, i32 56
  %385 = load i64, ptr %arrayidx20.i.i216, align 8
  %arrayidx21.i.i217 = getelementptr inbounds nuw i8, ptr %q.i53, i32 56
  %386 = load i64, ptr %arrayidx21.i.i217, align 8
  %xor22.i.i218 = xor i64 %386, %385
  store i64 %xor22.i.i218, ptr %arrayidx21.i.i217, align 8
  br label %for.body7.i589

for.body7.i589:                                   ; preds = %for.end.i58, %shift_rows.exit28.i712
  %i.1.i2201155 = phi i32 [ 1, %for.end.i58 ], [ %inc15.i767, %shift_rows.exit28.i712 ]
  %arrayidx.i122.i590 = getelementptr inbounds nuw i8, ptr %q.i53, i32 56
  %387 = load i64, ptr %arrayidx.i122.i590, align 8
  %arrayidx1.i123.i591 = getelementptr inbounds nuw i8, ptr %q.i53, i32 48
  %388 = load i64, ptr %arrayidx1.i123.i591, align 8
  %arrayidx2.i124.i592 = getelementptr inbounds nuw i8, ptr %q.i53, i32 40
  %389 = load i64, ptr %arrayidx2.i124.i592, align 8
  %arrayidx3.i125.i593 = getelementptr inbounds nuw i8, ptr %q.i53, i32 32
  %390 = load i64, ptr %arrayidx3.i125.i593, align 8
  %arrayidx4.i126.i594 = getelementptr inbounds nuw i8, ptr %q.i53, i32 24
  %391 = load i64, ptr %arrayidx4.i126.i594, align 8
  %arrayidx5.i127.i595 = getelementptr inbounds nuw i8, ptr %q.i53, i32 16
  %392 = load i64, ptr %arrayidx5.i127.i595, align 8
  %arrayidx6.i128.i596 = getelementptr inbounds nuw i8, ptr %q.i53, i32 8
  %393 = load i64, ptr %arrayidx6.i128.i596, align 8
  %394 = load i64, ptr %q.i53, align 8
  %xor.i129.i597 = xor i64 %390, %392
  %xor8.i130.i598 = xor i64 %387, %393
  %xor9.i131.i599 = xor i64 %387, %390
  %xor10.i132.i600 = xor i64 %387, %392
  %xor11.i133.i601 = xor i64 %388, %389
  %xor12.i134.i602 = xor i64 %xor11.i133.i601, %394
  %xor13.i135.i603 = xor i64 %xor12.i134.i602, %390
  %xor14.i136.i604 = xor i64 %xor8.i130.i598, %xor.i129.i597
  %xor15.i137.i605 = xor i64 %xor12.i134.i602, %387
  %xor16.i138.i606 = xor i64 %xor12.i134.i602, %393
  %xor17.i139.i607 = xor i64 %xor16.i138.i606, %xor10.i132.i600
  %xor18.i140.i608 = xor i64 %391, %xor14.i136.i604
  %xor19.i141.i609 = xor i64 %xor18.i140.i608, %392
  %xor20.i142.i610 = xor i64 %xor18.i140.i608, %388
  %xor21.i143.i611 = xor i64 %xor19.i141.i609, %394
  %xor22.i144.i612 = xor i64 %xor19.i141.i609, %xor11.i133.i601
  %xor23.i145.i613 = xor i64 %xor20.i142.i610, %xor9.i131.i599
  %xor24.i146.i614 = xor i64 %394, %xor23.i145.i613
  %xor25.i147.i615 = xor i64 %xor22.i144.i612, %xor23.i145.i613
  %xor27.i148.i616 = xor i64 %xor11.i133.i601, %xor23.i145.i613
  %and.i149.i617 = and i64 %xor14.i136.i604, %xor19.i141.i609
  %and30.i150.i618 = and i64 %xor17.i139.i607, %xor21.i143.i611
  %xor31.i151.i619 = xor i64 %and30.i150.i618, %and.i149.i617
  %and32.i152.i620 = and i64 %xor13.i135.i603, %394
  %and34.i153.i621 = and i64 %xor8.i130.i598, %xor27.i148.i616
  %and35.i154.i622 = and i64 %xor16.i138.i606, %xor12.i134.i602
  %and37.i155.i623 = and i64 %xor15.i137.i605, %xor24.i146.i614
  %and39.i156.i624 = and i64 %xor9.i131.i599, %xor23.i145.i613
  %and40.i157.i625 = and i64 %xor.i129.i597, %xor25.i147.i615
  %xor41.i158.i626 = xor i64 %and40.i157.i625, %and39.i156.i624
  %and42.i159.i627 = and i64 %xor10.i132.i600, %xor22.i144.i612
  %xor43.i160.i628 = xor i64 %and42.i159.i627, %and39.i156.i624
  %xor44.i161.i629 = xor i64 %xor31.i151.i619, %xor41.i158.i626
  %xor48.i162.i630 = xor i64 %xor44.i161.i629, %xor20.i142.i610
  %395 = xor i64 %xor10.i132.i600, %and32.i152.i620
  %396 = xor i64 %395, %xor22.i144.i612
  %397 = xor i64 %396, %and.i149.i617
  %xor49.i163.i631 = xor i64 %397, %xor43.i160.i628
  %398 = xor i64 %xor27.i148.i616, %and35.i154.i622
  %399 = xor i64 %398, %xor8.i130.i598
  %400 = xor i64 %399, %and34.i153.i621
  %xor50.i164.i632 = xor i64 %400, %xor41.i158.i626
  %401 = xor i64 %xor27.i148.i616, %and37.i155.i623
  %402 = xor i64 %401, %387
  %403 = xor i64 %402, %and34.i153.i621
  %xor51.i165.i633 = xor i64 %403, %xor43.i160.i628
  %xor52.i166.i634 = xor i64 %xor48.i162.i630, %xor49.i163.i631
  %and53.i167.i635 = and i64 %xor48.i162.i630, %xor50.i164.i632
  %xor54.i168.i636 = xor i64 %xor51.i165.i633, %and53.i167.i635
  %and55.i169.i637 = and i64 %xor52.i166.i634, %xor54.i168.i636
  %xor56.i170.i638 = xor i64 %and55.i169.i637, %xor49.i163.i631
  %xor57.i171.i639 = xor i64 %xor50.i164.i632, %xor51.i165.i633
  %xor58.i172.i640 = xor i64 %xor49.i163.i631, %and53.i167.i635
  %and59.i173.i641 = and i64 %xor58.i172.i640, %xor57.i171.i639
  %xor60.i174.i642 = xor i64 %and59.i173.i641, %xor51.i165.i633
  %xor61.i175.i643 = xor i64 %xor50.i164.i632, %xor60.i174.i642
  %xor62.i176.i644 = xor i64 %and59.i173.i641, %and53.i167.i635
  %and63.i177.i645 = and i64 %xor51.i165.i633, %xor62.i176.i644
  %xor64.i178.i646 = xor i64 %and63.i177.i645, %xor61.i175.i643
  %xor65.i179.i647 = xor i64 %xor54.i168.i636, %and63.i177.i645
  %and66.i180.i648 = and i64 %xor56.i170.i638, %xor65.i179.i647
  %xor67.i181.i649 = xor i64 %xor52.i166.i634, %and66.i180.i648
  %xor68.i182.i650 = xor i64 %xor67.i181.i649, %xor64.i178.i646
  %xor69.i183.i651 = xor i64 %xor56.i170.i638, %xor60.i174.i642
  %xor70.i184.i652 = xor i64 %xor56.i170.i638, %xor67.i181.i649
  %xor71.i185.i653 = xor i64 %and63.i177.i645, %xor50.i164.i632
  %xor72.i186.i654 = xor i64 %xor69.i183.i651, %xor68.i182.i650
  %and73.i187.i655 = and i64 %xor71.i185.i653, %xor19.i141.i609
  %and74.i188.i656 = and i64 %xor64.i178.i646, %xor21.i143.i611
  %and75.i189.i657 = and i64 %xor60.i174.i642, %394
  %and76.i190.i658 = and i64 %xor70.i184.i652, %xor27.i148.i616
  %and77.i191.i659 = and i64 %xor67.i181.i649, %xor12.i134.i602
  %and78.i192.i660 = and i64 %xor56.i170.i638, %xor24.i146.i614
  %and79.i193.i661 = and i64 %xor69.i183.i651, %xor23.i145.i613
  %and80.i194.i662 = and i64 %xor72.i186.i654, %xor25.i147.i615
  %and81.i195.i663 = and i64 %xor68.i182.i650, %xor22.i144.i612
  %and82.i196.i664 = and i64 %xor71.i185.i653, %xor14.i136.i604
  %and83.i197.i665 = and i64 %xor64.i178.i646, %xor17.i139.i607
  %and84.i198.i666 = and i64 %xor60.i174.i642, %xor13.i135.i603
  %and85.i199.i667 = and i64 %xor70.i184.i652, %xor8.i130.i598
  %and86.i200.i668 = and i64 %xor67.i181.i649, %xor16.i138.i606
  %and87.i201.i669 = and i64 %xor56.i170.i638, %xor15.i137.i605
  %and88.i202.i670 = and i64 %xor69.i183.i651, %xor9.i131.i599
  %and89.i203.i671 = and i64 %xor72.i186.i654, %xor.i129.i597
  %and90.i204.i672 = and i64 %xor68.i182.i650, %xor10.i132.i600
  %xor91.i205.i673 = xor i64 %and88.i202.i670, %and89.i203.i671
  %xor92.i206.i674 = xor i64 %and83.i197.i665, %and84.i198.i666
  %xor93.i207.i675 = xor i64 %and78.i192.i660, %and86.i200.i668
  %xor94.i208.i676 = xor i64 %and82.i196.i664, %and83.i197.i665
  %xor95.i209.i677 = xor i64 %and75.i189.i657, %and85.i199.i667
  %xor96.i210.i678 = xor i64 %and75.i189.i657, %and78.i192.i660
  %xor97.i211.i679 = xor i64 %and80.i194.i662, %and81.i195.i663
  %xor98.i212.i680 = xor i64 %and73.i187.i655, %and76.i190.i658
  %xor99.i213.i681 = xor i64 %and79.i193.i661, %and80.i194.i662
  %xor100.i214.i682 = xor i64 %and89.i203.i671, %and90.i204.i672
  %xor101.i215.i683 = xor i64 %and85.i199.i667, %xor93.i207.i675
  %xor102.i216.i684 = xor i64 %xor95.i209.i677, %xor98.i212.i680
  %xor103.i217.i685 = xor i64 %and77.i191.i659, %xor91.i205.i673
  %xor104.i218.i686 = xor i64 %and76.i190.i658, %xor99.i213.i681
  %xor105.i219.i687 = xor i64 %xor91.i205.i673, %xor102.i216.i684
  %xor106.i220.i688 = xor i64 %and87.i201.i669, %xor102.i216.i684
  %xor107.i221.i689 = xor i64 %xor97.i211.i679, %xor103.i217.i685
  %xor108.i222.i690 = xor i64 %xor94.i208.i676, %xor103.i217.i685
  %xor109.i223.i691 = xor i64 %and77.i191.i659, %xor104.i218.i686
  %xor110.i224.i692 = xor i64 %xor106.i220.i688, %xor107.i221.i689
  %xor111.i225.i693 = xor i64 %and74.i188.i656, %xor108.i222.i690
  %xor112.i226.i694 = xor i64 %xor104.i218.i686, %xor108.i222.i690
  %404 = xor i64 %xor107.i221.i689, %xor101.i215.i683
  %xor113.i227.i695 = xor i64 %404, -1
  %405 = xor i64 %xor105.i219.i687, %xor93.i207.i675
  %xor115.i228.i696 = xor i64 %405, -1
  %xor117.i229.i697 = xor i64 %xor98.i212.i680, %xor111.i225.i693
  %xor118.i230.i698 = xor i64 %xor96.i210.i678, %xor111.i225.i693
  %xor119.i231.i699 = xor i64 %xor92.i206.i674, %xor110.i224.i692
  %406 = xor i64 %xor117.i229.i697, %xor109.i223.i691
  %xor121.i232.i700 = xor i64 %406, -1
  %407 = xor i64 %xor110.i224.i692, %xor100.i214.i682
  %408 = xor i64 %407, %xor109.i223.i691
  %xor123.i233.i701 = xor i64 %408, -1
  %arrayidx124.i234.i702 = getelementptr inbounds nuw i8, ptr %q.i53, i32 56
  store i64 %xor112.i226.i694, ptr %arrayidx124.i234.i702, align 8
  %arrayidx125.i235.i703 = getelementptr inbounds nuw i8, ptr %q.i53, i32 48
  store i64 %xor121.i232.i700, ptr %arrayidx125.i235.i703, align 8
  %arrayidx126.i236.i704 = getelementptr inbounds nuw i8, ptr %q.i53, i32 40
  store i64 %xor123.i233.i701, ptr %arrayidx126.i236.i704, align 8
  %arrayidx127.i237.i705 = getelementptr inbounds nuw i8, ptr %q.i53, i32 32
  store i64 %xor117.i229.i697, ptr %arrayidx127.i237.i705, align 8
  %arrayidx128.i238.i706 = getelementptr inbounds nuw i8, ptr %q.i53, i32 24
  store i64 %xor118.i230.i698, ptr %arrayidx128.i238.i706, align 8
  %arrayidx129.i239.i707 = getelementptr inbounds nuw i8, ptr %q.i53, i32 16
  store i64 %xor119.i231.i699, ptr %arrayidx129.i239.i707, align 8
  %arrayidx130.i240.i708 = getelementptr inbounds nuw i8, ptr %q.i53, i32 8
  store i64 %xor113.i227.i695, ptr %arrayidx130.i240.i708, align 8
  store i64 %xor115.i228.i696, ptr %q.i53, align 8
  br label %for.body.i5.i768

for.body.i5.i768:                                 ; preds = %for.body7.i589, %for.body.i5.i768
  %i.0.i3.i7101154 = phi i32 [ 0, %for.body7.i589 ], [ %inc.i27.i790, %for.body.i5.i768 ]
  %arrayidx.i6.i769 = getelementptr inbounds nuw i64, ptr %q.i53, i32 %i.0.i3.i7101154
  %409 = load i64, ptr %arrayidx.i6.i769, align 8
  %and.i7.i770 = and i64 %409, 65535
  %and1.i8.i771 = lshr i64 %409, 4
  %shr.i9.i772 = and i64 %and1.i8.i771, 268369920
  %or.i10.i773 = or disjoint i64 %and.i7.i770, %shr.i9.i772
  %and2.i11.i774 = shl i64 %409, 12
  %shl.i12.i775 = and i64 %and2.i11.i774, 4026531840
  %or3.i13.i776 = or disjoint i64 %or.i10.i773, %shl.i12.i775
  %and4.i14.i777 = lshr i64 %409, 8
  %shr5.i15.i778 = and i64 %and4.i14.i777, 1095216660480
  %or6.i16.i779 = or disjoint i64 %or3.i13.i776, %shr5.i15.i778
  %and7.i17.i780 = shl i64 %409, 8
  %shl8.i18.i781 = and i64 %and7.i17.i780, 280375465082880
  %or9.i19.i782 = or disjoint i64 %or6.i16.i779, %shl8.i18.i781
  %and10.i20.i783 = lshr i64 %409, 12
  %shr11.i21.i784 = and i64 %and10.i20.i783, 4222124650659840
  %or12.i22.i785 = or disjoint i64 %or9.i19.i782, %shr11.i21.i784
  %and13.i23.i786 = shl i64 %409, 4
  %shl14.i24.i787 = and i64 %and13.i23.i786, -4503599627370496
  %or15.i25.i788 = or i64 %or12.i22.i785, %shl14.i24.i787
  %arrayidx16.i26.i789 = getelementptr inbounds nuw i64, ptr %q.i53, i32 %i.0.i3.i7101154
  store i64 %or15.i25.i788, ptr %arrayidx16.i26.i789, align 8
  %inc.i27.i790 = add nuw nsw i32 %i.0.i3.i7101154, 1
  %exitcond.i4.i711.not = icmp eq i32 %inc.i27.i790, 8
  br i1 %exitcond.i4.i711.not, label %shift_rows.exit28.i712, label %for.body.i5.i768, !llvm.loop !66

shift_rows.exit28.i712:                           ; preds = %for.body.i5.i768
  %410 = load i64, ptr %q.i53, align 8
  %arrayidx1.i96.i713 = getelementptr inbounds nuw i8, ptr %q.i53, i32 8
  %411 = load i64, ptr %arrayidx1.i96.i713, align 8
  %arrayidx2.i97.i714 = getelementptr inbounds nuw i8, ptr %q.i53, i32 16
  %412 = load i64, ptr %arrayidx2.i97.i714, align 8
  %arrayidx3.i98.i715 = getelementptr inbounds nuw i8, ptr %q.i53, i32 24
  %413 = load i64, ptr %arrayidx3.i98.i715, align 8
  %arrayidx4.i.i716 = getelementptr inbounds nuw i8, ptr %q.i53, i32 32
  %414 = load i64, ptr %arrayidx4.i.i716, align 8
  %arrayidx5.i99.i717 = getelementptr inbounds nuw i8, ptr %q.i53, i32 40
  %415 = load i64, ptr %arrayidx5.i99.i717, align 8
  %arrayidx6.i100.i718 = getelementptr inbounds nuw i8, ptr %q.i53, i32 48
  %416 = load i64, ptr %arrayidx6.i100.i718, align 8
  %arrayidx7.i.i719 = getelementptr inbounds nuw i8, ptr %q.i53, i32 56
  %417 = load i64, ptr %arrayidx7.i.i719, align 8
  %418 = call i64 @llvm.fshl.i64(i64 %410, i64 %410, i64 48)
  %419 = call i64 @llvm.fshl.i64(i64 %411, i64 %411, i64 48)
  %420 = call i64 @llvm.fshl.i64(i64 %412, i64 %412, i64 48)
  %421 = call i64 @llvm.fshl.i64(i64 %413, i64 %413, i64 48)
  %422 = call i64 @llvm.fshl.i64(i64 %414, i64 %414, i64 48)
  %423 = call i64 @llvm.fshl.i64(i64 %415, i64 %415, i64 48)
  %424 = call i64 @llvm.fshl.i64(i64 %416, i64 %416, i64 48)
  %425 = call i64 @llvm.fshl.i64(i64 %417, i64 %417, i64 48)
  %xor30.i.i720 = xor i64 %410, %418
  %426 = call i64 @llvm.fshl.i64(i64 %xor30.i.i720, i64 %xor30.i.i720, i64 32)
  %427 = xor i64 %425, %426
  %428 = xor i64 %427, %417
  %xor31.i.i721 = xor i64 %428, %418
  store i64 %xor31.i.i721, ptr %q.i53, align 8
  %xor37.i.i722 = xor i64 %411, %419
  %429 = call i64 @llvm.fshl.i64(i64 %xor37.i.i722, i64 %xor37.i.i722, i64 32)
  %430 = xor i64 %418, %429
  %431 = xor i64 %430, %410
  %432 = xor i64 %431, %417
  %433 = xor i64 %432, %425
  %xor39.i.i723 = xor i64 %433, %419
  %arrayidx40.i.i724 = getelementptr inbounds nuw i8, ptr %q.i53, i32 8
  store i64 %xor39.i.i723, ptr %arrayidx40.i.i724, align 8
  %xor43.i.i725 = xor i64 %412, %420
  %434 = call i64 @llvm.fshl.i64(i64 %xor43.i.i725, i64 %xor43.i.i725, i64 32)
  %435 = xor i64 %419, %434
  %436 = xor i64 %435, %411
  %xor45.i.i726 = xor i64 %436, %420
  %arrayidx46.i.i727 = getelementptr inbounds nuw i8, ptr %q.i53, i32 16
  store i64 %xor45.i.i726, ptr %arrayidx46.i.i727, align 8
  %xor51.i.i728 = xor i64 %413, %421
  %437 = call i64 @llvm.fshl.i64(i64 %xor51.i.i728, i64 %xor51.i.i728, i64 32)
  %438 = xor i64 %420, %437
  %439 = xor i64 %438, %412
  %440 = xor i64 %439, %417
  %441 = xor i64 %440, %425
  %xor53.i.i729 = xor i64 %441, %421
  %arrayidx54.i.i730 = getelementptr inbounds nuw i8, ptr %q.i53, i32 24
  store i64 %xor53.i.i729, ptr %arrayidx54.i.i730, align 8
  %xor59.i.i731 = xor i64 %414, %422
  %442 = call i64 @llvm.fshl.i64(i64 %xor59.i.i731, i64 %xor59.i.i731, i64 32)
  %443 = xor i64 %421, %442
  %444 = xor i64 %443, %413
  %445 = xor i64 %444, %417
  %446 = xor i64 %445, %425
  %xor61.i.i732 = xor i64 %446, %422
  %arrayidx62.i.i733 = getelementptr inbounds nuw i8, ptr %q.i53, i32 32
  store i64 %xor61.i.i732, ptr %arrayidx62.i.i733, align 8
  %xor65.i.i734 = xor i64 %415, %423
  %447 = call i64 @llvm.fshl.i64(i64 %xor65.i.i734, i64 %xor65.i.i734, i64 32)
  %448 = xor i64 %422, %447
  %449 = xor i64 %448, %414
  %xor67.i.i735 = xor i64 %449, %423
  %arrayidx68.i.i736 = getelementptr inbounds nuw i8, ptr %q.i53, i32 40
  store i64 %xor67.i.i735, ptr %arrayidx68.i.i736, align 8
  %xor71.i.i737 = xor i64 %416, %424
  %450 = call i64 @llvm.fshl.i64(i64 %xor71.i.i737, i64 %xor71.i.i737, i64 32)
  %451 = xor i64 %423, %450
  %452 = xor i64 %451, %415
  %xor73.i.i738 = xor i64 %452, %424
  %arrayidx74.i.i739 = getelementptr inbounds nuw i8, ptr %q.i53, i32 48
  store i64 %xor73.i.i738, ptr %arrayidx74.i.i739, align 8
  %xor77.i.i740 = xor i64 %417, %425
  %453 = call i64 @llvm.fshl.i64(i64 %xor77.i.i740, i64 %xor77.i.i740, i64 32)
  %454 = xor i64 %424, %453
  %455 = xor i64 %454, %416
  %xor79.i.i741 = xor i64 %455, %425
  %arrayidx80.i.i742 = getelementptr inbounds nuw i8, ptr %q.i53, i32 56
  store i64 %xor79.i.i741, ptr %arrayidx80.i.i742, align 8
  %add.ptr13.idx.i743 = shl nuw nsw i32 %i.1.i2201155, 6
  %add.ptr13.i744 = getelementptr inbounds nuw i8, ptr %119, i32 %add.ptr13.idx.i743
  %456 = load i64, ptr %add.ptr13.i744, align 8
  %457 = load i64, ptr %q.i53, align 8
  %xor.i74.i745 = xor i64 %457, %456
  store i64 %xor.i74.i745, ptr %q.i53, align 8
  %arrayidx2.i75.i746 = getelementptr inbounds nuw i8, ptr %add.ptr13.i744, i32 8
  %458 = load i64, ptr %arrayidx2.i75.i746, align 8
  %arrayidx3.i76.i747 = getelementptr inbounds nuw i8, ptr %q.i53, i32 8
  %459 = load i64, ptr %arrayidx3.i76.i747, align 8
  %xor4.i77.i748 = xor i64 %459, %458
  store i64 %xor4.i77.i748, ptr %arrayidx3.i76.i747, align 8
  %arrayidx5.i78.i749 = getelementptr inbounds nuw i8, ptr %add.ptr13.i744, i32 16
  %460 = load i64, ptr %arrayidx5.i78.i749, align 8
  %arrayidx6.i79.i750 = getelementptr inbounds nuw i8, ptr %q.i53, i32 16
  %461 = load i64, ptr %arrayidx6.i79.i750, align 8
  %xor7.i80.i751 = xor i64 %461, %460
  store i64 %xor7.i80.i751, ptr %arrayidx6.i79.i750, align 8
  %arrayidx8.i81.i752 = getelementptr inbounds nuw i8, ptr %add.ptr13.i744, i32 24
  %462 = load i64, ptr %arrayidx8.i81.i752, align 8
  %arrayidx9.i82.i753 = getelementptr inbounds nuw i8, ptr %q.i53, i32 24
  %463 = load i64, ptr %arrayidx9.i82.i753, align 8
  %xor10.i83.i754 = xor i64 %463, %462
  store i64 %xor10.i83.i754, ptr %arrayidx9.i82.i753, align 8
  %arrayidx11.i84.i755 = getelementptr inbounds nuw i8, ptr %add.ptr13.i744, i32 32
  %464 = load i64, ptr %arrayidx11.i84.i755, align 8
  %arrayidx12.i85.i756 = getelementptr inbounds nuw i8, ptr %q.i53, i32 32
  %465 = load i64, ptr %arrayidx12.i85.i756, align 8
  %xor13.i86.i757 = xor i64 %465, %464
  store i64 %xor13.i86.i757, ptr %arrayidx12.i85.i756, align 8
  %arrayidx14.i87.i758 = getelementptr inbounds nuw i8, ptr %add.ptr13.i744, i32 40
  %466 = load i64, ptr %arrayidx14.i87.i758, align 8
  %arrayidx15.i88.i759 = getelementptr inbounds nuw i8, ptr %q.i53, i32 40
  %467 = load i64, ptr %arrayidx15.i88.i759, align 8
  %xor16.i89.i760 = xor i64 %467, %466
  store i64 %xor16.i89.i760, ptr %arrayidx15.i88.i759, align 8
  %arrayidx17.i90.i761 = getelementptr inbounds nuw i8, ptr %add.ptr13.i744, i32 48
  %468 = load i64, ptr %arrayidx17.i90.i761, align 8
  %arrayidx18.i91.i762 = getelementptr inbounds nuw i8, ptr %q.i53, i32 48
  %469 = load i64, ptr %arrayidx18.i91.i762, align 8
  %xor19.i92.i763 = xor i64 %469, %468
  store i64 %xor19.i92.i763, ptr %arrayidx18.i91.i762, align 8
  %arrayidx20.i93.i764 = getelementptr inbounds nuw i8, ptr %add.ptr13.i744, i32 56
  %470 = load i64, ptr %arrayidx20.i93.i764, align 8
  %arrayidx21.i94.i765 = getelementptr inbounds nuw i8, ptr %q.i53, i32 56
  %471 = load i64, ptr %arrayidx21.i94.i765, align 8
  %xor22.i95.i766 = xor i64 %471, %470
  store i64 %xor22.i95.i766, ptr %arrayidx21.i94.i765, align 8
  %inc15.i767 = add nuw nsw i32 %i.1.i2201155, 1
  %exitcond1.i221.not = icmp eq i32 %inc15.i767, 10
  br i1 %exitcond1.i221.not, label %for.end16.i222, label %for.body7.i589, !llvm.loop !67

for.end16.i222:                                   ; preds = %shift_rows.exit28.i712
  %arrayidx.i101.i223 = getelementptr inbounds nuw i8, ptr %q.i53, i32 56
  %472 = load i64, ptr %arrayidx.i101.i223, align 8
  %arrayidx1.i102.i224 = getelementptr inbounds nuw i8, ptr %q.i53, i32 48
  %473 = load i64, ptr %arrayidx1.i102.i224, align 8
  %arrayidx2.i103.i225 = getelementptr inbounds nuw i8, ptr %q.i53, i32 40
  %474 = load i64, ptr %arrayidx2.i103.i225, align 8
  %arrayidx3.i104.i226 = getelementptr inbounds nuw i8, ptr %q.i53, i32 32
  %475 = load i64, ptr %arrayidx3.i104.i226, align 8
  %arrayidx4.i105.i227 = getelementptr inbounds nuw i8, ptr %q.i53, i32 24
  %476 = load i64, ptr %arrayidx4.i105.i227, align 8
  %arrayidx5.i106.i228 = getelementptr inbounds nuw i8, ptr %q.i53, i32 16
  %477 = load i64, ptr %arrayidx5.i106.i228, align 8
  %arrayidx6.i107.i229 = getelementptr inbounds nuw i8, ptr %q.i53, i32 8
  %478 = load i64, ptr %arrayidx6.i107.i229, align 8
  %479 = load i64, ptr %q.i53, align 8
  %xor.i108.i230 = xor i64 %475, %477
  %xor8.i.i231 = xor i64 %472, %478
  %xor9.i.i232 = xor i64 %472, %475
  %xor10.i109.i233 = xor i64 %472, %477
  %xor11.i.i234 = xor i64 %473, %474
  %xor12.i.i235 = xor i64 %xor11.i.i234, %479
  %xor13.i110.i236 = xor i64 %xor12.i.i235, %475
  %xor14.i.i237 = xor i64 %xor8.i.i231, %xor.i108.i230
  %xor15.i.i238 = xor i64 %xor12.i.i235, %472
  %xor16.i111.i239 = xor i64 %xor12.i.i235, %478
  %xor17.i.i240 = xor i64 %xor16.i111.i239, %xor10.i109.i233
  %xor18.i.i241 = xor i64 %476, %xor14.i.i237
  %xor19.i112.i242 = xor i64 %xor18.i.i241, %477
  %xor20.i.i243 = xor i64 %xor18.i.i241, %473
  %xor21.i.i244 = xor i64 %xor19.i112.i242, %479
  %xor22.i113.i245 = xor i64 %xor19.i112.i242, %xor11.i.i234
  %xor23.i.i246 = xor i64 %xor20.i.i243, %xor9.i.i232
  %xor24.i.i247 = xor i64 %479, %xor23.i.i246
  %xor25.i.i248 = xor i64 %xor22.i113.i245, %xor23.i.i246
  %xor27.i.i249 = xor i64 %xor11.i.i234, %xor23.i.i246
  %and.i114.i250 = and i64 %xor14.i.i237, %xor19.i112.i242
  %and30.i.i251 = and i64 %xor17.i.i240, %xor21.i.i244
  %xor31.i115.i252 = xor i64 %and30.i.i251, %and.i114.i250
  %and32.i.i253 = and i64 %xor13.i110.i236, %479
  %and34.i.i254 = and i64 %xor8.i.i231, %xor27.i.i249
  %and35.i.i255 = and i64 %xor16.i111.i239, %xor12.i.i235
  %and37.i.i256 = and i64 %xor15.i.i238, %xor24.i.i247
  %and39.i.i257 = and i64 %xor9.i.i232, %xor23.i.i246
  %and40.i.i258 = and i64 %xor.i108.i230, %xor25.i.i248
  %xor41.i.i259 = xor i64 %and40.i.i258, %and39.i.i257
  %and42.i.i260 = and i64 %xor10.i109.i233, %xor22.i113.i245
  %xor43.i116.i261 = xor i64 %and42.i.i260, %and39.i.i257
  %xor44.i.i262 = xor i64 %xor31.i115.i252, %xor41.i.i259
  %xor48.i.i263 = xor i64 %xor44.i.i262, %xor20.i.i243
  %480 = xor i64 %xor10.i109.i233, %and32.i.i253
  %481 = xor i64 %480, %xor22.i113.i245
  %482 = xor i64 %481, %and.i114.i250
  %xor49.i.i264 = xor i64 %482, %xor43.i116.i261
  %483 = xor i64 %xor27.i.i249, %and35.i.i255
  %484 = xor i64 %483, %xor8.i.i231
  %485 = xor i64 %484, %and34.i.i254
  %xor50.i.i265 = xor i64 %485, %xor41.i.i259
  %486 = xor i64 %xor27.i.i249, %and37.i.i256
  %487 = xor i64 %486, %472
  %488 = xor i64 %487, %and34.i.i254
  %xor51.i117.i266 = xor i64 %488, %xor43.i116.i261
  %xor52.i.i267 = xor i64 %xor48.i.i263, %xor49.i.i264
  %and53.i.i268 = and i64 %xor48.i.i263, %xor50.i.i265
  %xor54.i.i269 = xor i64 %xor51.i117.i266, %and53.i.i268
  %and55.i.i270 = and i64 %xor52.i.i267, %xor54.i.i269
  %xor56.i.i271 = xor i64 %and55.i.i270, %xor49.i.i264
  %xor57.i.i272 = xor i64 %xor50.i.i265, %xor51.i117.i266
  %xor58.i.i273 = xor i64 %xor49.i.i264, %and53.i.i268
  %and59.i.i274 = and i64 %xor58.i.i273, %xor57.i.i272
  %xor60.i.i275 = xor i64 %and59.i.i274, %xor51.i117.i266
  %xor61.i118.i276 = xor i64 %xor50.i.i265, %xor60.i.i275
  %xor62.i.i277 = xor i64 %and59.i.i274, %and53.i.i268
  %and63.i.i278 = and i64 %xor51.i117.i266, %xor62.i.i277
  %xor64.i.i279 = xor i64 %and63.i.i278, %xor61.i118.i276
  %xor65.i119.i280 = xor i64 %xor54.i.i269, %and63.i.i278
  %and66.i.i281 = and i64 %xor56.i.i271, %xor65.i119.i280
  %xor67.i120.i282 = xor i64 %xor52.i.i267, %and66.i.i281
  %xor68.i.i283 = xor i64 %xor67.i120.i282, %xor64.i.i279
  %xor69.i.i284 = xor i64 %xor56.i.i271, %xor60.i.i275
  %xor70.i.i285 = xor i64 %xor56.i.i271, %xor67.i120.i282
  %xor71.i121.i286 = xor i64 %and63.i.i278, %xor50.i.i265
  %xor72.i.i287 = xor i64 %xor69.i.i284, %xor68.i.i283
  %and73.i.i288 = and i64 %xor71.i121.i286, %xor19.i112.i242
  %and74.i.i289 = and i64 %xor64.i.i279, %xor21.i.i244
  %and75.i.i290 = and i64 %xor60.i.i275, %479
  %and76.i.i291 = and i64 %xor70.i.i285, %xor27.i.i249
  %and77.i.i292 = and i64 %xor67.i120.i282, %xor12.i.i235
  %and78.i.i293 = and i64 %xor56.i.i271, %xor24.i.i247
  %and79.i.i294 = and i64 %xor69.i.i284, %xor23.i.i246
  %and80.i.i295 = and i64 %xor72.i.i287, %xor25.i.i248
  %and81.i.i296 = and i64 %xor68.i.i283, %xor22.i113.i245
  %and82.i.i297 = and i64 %xor71.i121.i286, %xor14.i.i237
  %and83.i.i298 = and i64 %xor64.i.i279, %xor17.i.i240
  %and84.i.i299 = and i64 %xor60.i.i275, %xor13.i110.i236
  %and85.i.i300 = and i64 %xor70.i.i285, %xor8.i.i231
  %and86.i.i301 = and i64 %xor67.i120.i282, %xor16.i111.i239
  %and87.i.i302 = and i64 %xor56.i.i271, %xor15.i.i238
  %and88.i.i303 = and i64 %xor69.i.i284, %xor9.i.i232
  %and89.i.i304 = and i64 %xor72.i.i287, %xor.i108.i230
  %and90.i.i305 = and i64 %xor68.i.i283, %xor10.i109.i233
  %xor91.i.i306 = xor i64 %and88.i.i303, %and89.i.i304
  %xor92.i.i307 = xor i64 %and83.i.i298, %and84.i.i299
  %xor93.i.i308 = xor i64 %and78.i.i293, %and86.i.i301
  %xor94.i.i309 = xor i64 %and82.i.i297, %and83.i.i298
  %xor95.i.i310 = xor i64 %and75.i.i290, %and85.i.i300
  %xor96.i.i311 = xor i64 %and75.i.i290, %and78.i.i293
  %xor97.i.i312 = xor i64 %and80.i.i295, %and81.i.i296
  %xor98.i.i313 = xor i64 %and73.i.i288, %and76.i.i291
  %xor99.i.i314 = xor i64 %and79.i.i294, %and80.i.i295
  %xor100.i.i315 = xor i64 %and89.i.i304, %and90.i.i305
  %xor101.i.i316 = xor i64 %and85.i.i300, %xor93.i.i308
  %xor102.i.i317 = xor i64 %xor95.i.i310, %xor98.i.i313
  %xor103.i.i318 = xor i64 %and77.i.i292, %xor91.i.i306
  %xor104.i.i319 = xor i64 %and76.i.i291, %xor99.i.i314
  %xor105.i.i320 = xor i64 %xor91.i.i306, %xor102.i.i317
  %xor106.i.i321 = xor i64 %and87.i.i302, %xor102.i.i317
  %xor107.i.i322 = xor i64 %xor97.i.i312, %xor103.i.i318
  %xor108.i.i323 = xor i64 %xor94.i.i309, %xor103.i.i318
  %xor109.i.i324 = xor i64 %and77.i.i292, %xor104.i.i319
  %xor110.i.i325 = xor i64 %xor106.i.i321, %xor107.i.i322
  %xor111.i.i326 = xor i64 %and74.i.i289, %xor108.i.i323
  %xor112.i.i327 = xor i64 %xor104.i.i319, %xor108.i.i323
  %489 = xor i64 %xor107.i.i322, %xor101.i.i316
  %xor113.i.i328 = xor i64 %489, -1
  %490 = xor i64 %xor105.i.i320, %xor93.i.i308
  %xor115.i.i329 = xor i64 %490, -1
  %xor117.i.i330 = xor i64 %xor98.i.i313, %xor111.i.i326
  %xor118.i.i331 = xor i64 %xor96.i.i311, %xor111.i.i326
  %xor119.i.i332 = xor i64 %xor92.i.i307, %xor110.i.i325
  %491 = xor i64 %xor117.i.i330, %xor109.i.i324
  %xor121.i.i333 = xor i64 %491, -1
  %492 = xor i64 %xor110.i.i325, %xor100.i.i315
  %493 = xor i64 %492, %xor109.i.i324
  %xor123.i.i334 = xor i64 %493, -1
  %arrayidx124.i.i335 = getelementptr inbounds nuw i8, ptr %q.i53, i32 56
  store i64 %xor112.i.i327, ptr %arrayidx124.i.i335, align 8
  %arrayidx125.i.i336 = getelementptr inbounds nuw i8, ptr %q.i53, i32 48
  store i64 %xor121.i.i333, ptr %arrayidx125.i.i336, align 8
  %arrayidx126.i.i337 = getelementptr inbounds nuw i8, ptr %q.i53, i32 40
  store i64 %xor123.i.i334, ptr %arrayidx126.i.i337, align 8
  %arrayidx127.i.i338 = getelementptr inbounds nuw i8, ptr %q.i53, i32 32
  store i64 %xor117.i.i330, ptr %arrayidx127.i.i338, align 8
  %arrayidx128.i.i339 = getelementptr inbounds nuw i8, ptr %q.i53, i32 24
  store i64 %xor118.i.i331, ptr %arrayidx128.i.i339, align 8
  %arrayidx129.i.i340 = getelementptr inbounds nuw i8, ptr %q.i53, i32 16
  store i64 %xor119.i.i332, ptr %arrayidx129.i.i340, align 8
  %arrayidx130.i.i341 = getelementptr inbounds nuw i8, ptr %q.i53, i32 8
  store i64 %xor113.i.i328, ptr %arrayidx130.i.i341, align 8
  store i64 %xor115.i.i329, ptr %q.i53, align 8
  br label %for.body.i.i566

for.body.i.i566:                                  ; preds = %for.end16.i222, %for.body.i.i566
  %i.0.i.i3431156 = phi i32 [ 0, %for.end16.i222 ], [ %inc.i.i588, %for.body.i.i566 ]
  %arrayidx.i.i567 = getelementptr inbounds nuw i64, ptr %q.i53, i32 %i.0.i.i3431156
  %494 = load i64, ptr %arrayidx.i.i567, align 8
  %and.i.i568 = and i64 %494, 65535
  %and1.i.i569 = lshr i64 %494, 4
  %shr.i1.i570 = and i64 %and1.i.i569, 268369920
  %or.i.i571 = or disjoint i64 %and.i.i568, %shr.i1.i570
  %and2.i.i572 = shl i64 %494, 12
  %shl.i.i573 = and i64 %and2.i.i572, 4026531840
  %or3.i.i574 = or disjoint i64 %or.i.i571, %shl.i.i573
  %and4.i.i575 = lshr i64 %494, 8
  %shr5.i.i576 = and i64 %and4.i.i575, 1095216660480
  %or6.i.i577 = or disjoint i64 %or3.i.i574, %shr5.i.i576
  %and7.i.i578 = shl i64 %494, 8
  %shl8.i.i579 = and i64 %and7.i.i578, 280375465082880
  %or9.i.i580 = or disjoint i64 %or6.i.i577, %shl8.i.i579
  %and10.i.i581 = lshr i64 %494, 12
  %shr11.i.i582 = and i64 %and10.i.i581, 4222124650659840
  %or12.i.i583 = or disjoint i64 %or9.i.i580, %shr11.i.i582
  %and13.i.i584 = shl i64 %494, 4
  %shl14.i.i585 = and i64 %and13.i.i584, -4503599627370496
  %or15.i.i586 = or i64 %or12.i.i583, %shl14.i.i585
  %arrayidx16.i.i587 = getelementptr inbounds nuw i64, ptr %q.i53, i32 %i.0.i.i3431156
  store i64 %or15.i.i586, ptr %arrayidx16.i.i587, align 8
  %inc.i.i588 = add nuw nsw i32 %i.0.i.i3431156, 1
  %exitcond.i.i344.not = icmp eq i32 %inc.i.i588, 8
  br i1 %exitcond.i.i344.not, label %shift_rows.exit.i345, label %for.body.i.i566, !llvm.loop !68

shift_rows.exit.i345:                             ; preds = %for.body.i.i566
  %add.ptr20.i346 = getelementptr inbounds nuw i8, ptr %119, i32 640
  %495 = load i64, ptr %add.ptr20.i346, align 8
  %496 = load i64, ptr %q.i53, align 8
  %xor.i52.i347 = xor i64 %496, %495
  store i64 %xor.i52.i347, ptr %q.i53, align 8
  %arrayidx2.i53.i348 = getelementptr inbounds nuw i8, ptr %119, i32 648
  %497 = load i64, ptr %arrayidx2.i53.i348, align 8
  %arrayidx3.i54.i349 = getelementptr inbounds nuw i8, ptr %q.i53, i32 8
  %498 = load i64, ptr %arrayidx3.i54.i349, align 8
  %xor4.i55.i350 = xor i64 %498, %497
  store i64 %xor4.i55.i350, ptr %arrayidx3.i54.i349, align 8
  %arrayidx5.i56.i351 = getelementptr inbounds nuw i8, ptr %119, i32 656
  %499 = load i64, ptr %arrayidx5.i56.i351, align 8
  %arrayidx6.i57.i352 = getelementptr inbounds nuw i8, ptr %q.i53, i32 16
  %500 = load i64, ptr %arrayidx6.i57.i352, align 8
  %xor7.i58.i353 = xor i64 %500, %499
  store i64 %xor7.i58.i353, ptr %arrayidx6.i57.i352, align 8
  %arrayidx8.i59.i354 = getelementptr inbounds nuw i8, ptr %119, i32 664
  %501 = load i64, ptr %arrayidx8.i59.i354, align 8
  %arrayidx9.i60.i355 = getelementptr inbounds nuw i8, ptr %q.i53, i32 24
  %502 = load i64, ptr %arrayidx9.i60.i355, align 8
  %xor10.i61.i356 = xor i64 %502, %501
  store i64 %xor10.i61.i356, ptr %arrayidx9.i60.i355, align 8
  %arrayidx11.i62.i357 = getelementptr inbounds nuw i8, ptr %119, i32 672
  %503 = load i64, ptr %arrayidx11.i62.i357, align 8
  %arrayidx12.i63.i358 = getelementptr inbounds nuw i8, ptr %q.i53, i32 32
  %504 = load i64, ptr %arrayidx12.i63.i358, align 8
  %xor13.i64.i359 = xor i64 %504, %503
  store i64 %xor13.i64.i359, ptr %arrayidx12.i63.i358, align 8
  %arrayidx14.i65.i360 = getelementptr inbounds nuw i8, ptr %119, i32 680
  %505 = load i64, ptr %arrayidx14.i65.i360, align 8
  %arrayidx15.i66.i361 = getelementptr inbounds nuw i8, ptr %q.i53, i32 40
  %506 = load i64, ptr %arrayidx15.i66.i361, align 8
  %xor16.i67.i362 = xor i64 %506, %505
  store i64 %xor16.i67.i362, ptr %arrayidx15.i66.i361, align 8
  %arrayidx17.i68.i363 = getelementptr inbounds nuw i8, ptr %119, i32 688
  %507 = load i64, ptr %arrayidx17.i68.i363, align 8
  %arrayidx18.i69.i364 = getelementptr inbounds nuw i8, ptr %q.i53, i32 48
  %508 = load i64, ptr %arrayidx18.i69.i364, align 8
  %xor19.i70.i365 = xor i64 %508, %507
  store i64 %xor19.i70.i365, ptr %arrayidx18.i69.i364, align 8
  %arrayidx20.i71.i366 = getelementptr inbounds nuw i8, ptr %119, i32 696
  %509 = load i64, ptr %arrayidx20.i71.i366, align 8
  %arrayidx21.i72.i367 = getelementptr inbounds nuw i8, ptr %q.i53, i32 56
  %510 = load i64, ptr %arrayidx21.i72.i367, align 8
  %xor22.i73.i368 = xor i64 %510, %509
  store i64 %xor22.i73.i368, ptr %arrayidx21.i72.i367, align 8
  %511 = load i64, ptr %q.i53, align 8
  %arrayidx1.i268.i369 = getelementptr inbounds nuw i8, ptr %q.i53, i32 8
  %512 = load i64, ptr %arrayidx1.i268.i369, align 8
  %and.i269.i370 = and i64 %511, 6148914691236517205
  %and2.i270.i371 = shl i64 %512, 1
  %shl.i271.i372 = and i64 %and2.i270.i371, -6148914691236517206
  %or.i272.i373 = or disjoint i64 %and.i269.i370, %shl.i271.i372
  store i64 %or.i272.i373, ptr %q.i53, align 8
  %and4.i273.i374 = lshr i64 %511, 1
  %shr.i274.i375 = and i64 %and4.i273.i374, 6148914691236517205
  %and5.i275.i376 = and i64 %512, -6148914691236517206
  %or6.i276.i377 = or disjoint i64 %shr.i274.i375, %and5.i275.i376
  %arrayidx7.i277.i378 = getelementptr inbounds nuw i8, ptr %q.i53, i32 8
  store i64 %or6.i276.i377, ptr %arrayidx7.i277.i378, align 8
  %arrayidx11.i278.i379 = getelementptr inbounds nuw i8, ptr %q.i53, i32 16
  %513 = load i64, ptr %arrayidx11.i278.i379, align 8
  %arrayidx12.i279.i380 = getelementptr inbounds nuw i8, ptr %q.i53, i32 24
  %514 = load i64, ptr %arrayidx12.i279.i380, align 8
  %and13.i280.i381 = and i64 %513, 6148914691236517205
  %and14.i281.i382 = shl i64 %514, 1
  %shl15.i282.i383 = and i64 %and14.i281.i382, -6148914691236517206
  %or16.i283.i384 = or disjoint i64 %and13.i280.i381, %shl15.i282.i383
  %arrayidx17.i284.i385 = getelementptr inbounds nuw i8, ptr %q.i53, i32 16
  store i64 %or16.i283.i384, ptr %arrayidx17.i284.i385, align 8
  %and18.i285.i386 = lshr i64 %513, 1
  %shr19.i286.i387 = and i64 %and18.i285.i386, 6148914691236517205
  %and20.i287.i388 = and i64 %514, -6148914691236517206
  %or21.i288.i389 = or disjoint i64 %shr19.i286.i387, %and20.i287.i388
  %arrayidx22.i289.i390 = getelementptr inbounds nuw i8, ptr %q.i53, i32 24
  store i64 %or21.i288.i389, ptr %arrayidx22.i289.i390, align 8
  %arrayidx27.i290.i391 = getelementptr inbounds nuw i8, ptr %q.i53, i32 32
  %515 = load i64, ptr %arrayidx27.i290.i391, align 8
  %arrayidx28.i291.i392 = getelementptr inbounds nuw i8, ptr %q.i53, i32 40
  %516 = load i64, ptr %arrayidx28.i291.i392, align 8
  %and29.i292.i393 = and i64 %515, 6148914691236517205
  %and30.i293.i394 = shl i64 %516, 1
  %shl31.i294.i395 = and i64 %and30.i293.i394, -6148914691236517206
  %or32.i295.i396 = or disjoint i64 %and29.i292.i393, %shl31.i294.i395
  %arrayidx33.i296.i397 = getelementptr inbounds nuw i8, ptr %q.i53, i32 32
  store i64 %or32.i295.i396, ptr %arrayidx33.i296.i397, align 8
  %and34.i297.i398 = lshr i64 %515, 1
  %shr35.i298.i399 = and i64 %and34.i297.i398, 6148914691236517205
  %and36.i299.i400 = and i64 %516, -6148914691236517206
  %or37.i300.i401 = or disjoint i64 %shr35.i298.i399, %and36.i299.i400
  %arrayidx38.i301.i402 = getelementptr inbounds nuw i8, ptr %q.i53, i32 40
  store i64 %or37.i300.i401, ptr %arrayidx38.i301.i402, align 8
  %arrayidx43.i302.i403 = getelementptr inbounds nuw i8, ptr %q.i53, i32 48
  %517 = load i64, ptr %arrayidx43.i302.i403, align 8
  %arrayidx44.i303.i404 = getelementptr inbounds nuw i8, ptr %q.i53, i32 56
  %518 = load i64, ptr %arrayidx44.i303.i404, align 8
  %and45.i304.i405 = and i64 %517, 6148914691236517205
  %and46.i305.i406 = shl i64 %518, 1
  %shl47.i306.i407 = and i64 %and46.i305.i406, -6148914691236517206
  %or48.i307.i408 = or disjoint i64 %and45.i304.i405, %shl47.i306.i407
  %arrayidx49.i308.i409 = getelementptr inbounds nuw i8, ptr %q.i53, i32 48
  store i64 %or48.i307.i408, ptr %arrayidx49.i308.i409, align 8
  %and50.i309.i410 = lshr i64 %517, 1
  %shr51.i310.i411 = and i64 %and50.i309.i410, 6148914691236517205
  %and52.i311.i412 = and i64 %518, -6148914691236517206
  %or53.i312.i413 = or disjoint i64 %shr51.i310.i411, %and52.i311.i412
  %arrayidx54.i313.i414 = getelementptr inbounds nuw i8, ptr %q.i53, i32 56
  store i64 %or53.i312.i413, ptr %arrayidx54.i313.i414, align 8
  %519 = load i64, ptr %q.i53, align 8
  %arrayidx60.i314.i415 = getelementptr inbounds nuw i8, ptr %q.i53, i32 16
  %520 = load i64, ptr %arrayidx60.i314.i415, align 8
  %and61.i315.i416 = and i64 %519, 3689348814741910323
  %and62.i316.i417 = shl i64 %520, 2
  %shl63.i317.i418 = and i64 %and62.i316.i417, -3689348814741910324
  %or64.i318.i419 = or disjoint i64 %and61.i315.i416, %shl63.i317.i418
  store i64 %or64.i318.i419, ptr %q.i53, align 8
  %and66.i319.i420 = lshr i64 %519, 2
  %shr67.i320.i421 = and i64 %and66.i319.i420, 3689348814741910323
  %and68.i321.i422 = and i64 %520, -3689348814741910324
  %or69.i322.i423 = or disjoint i64 %shr67.i320.i421, %and68.i321.i422
  %arrayidx70.i323.i424 = getelementptr inbounds nuw i8, ptr %q.i53, i32 16
  store i64 %or69.i322.i423, ptr %arrayidx70.i323.i424, align 8
  %arrayidx75.i324.i425 = getelementptr inbounds nuw i8, ptr %q.i53, i32 8
  %521 = load i64, ptr %arrayidx75.i324.i425, align 8
  %arrayidx76.i325.i426 = getelementptr inbounds nuw i8, ptr %q.i53, i32 24
  %522 = load i64, ptr %arrayidx76.i325.i426, align 8
  %and77.i326.i427 = and i64 %521, 3689348814741910323
  %and78.i327.i428 = shl i64 %522, 2
  %shl79.i328.i429 = and i64 %and78.i327.i428, -3689348814741910324
  %or80.i329.i430 = or disjoint i64 %and77.i326.i427, %shl79.i328.i429
  %arrayidx81.i330.i431 = getelementptr inbounds nuw i8, ptr %q.i53, i32 8
  store i64 %or80.i329.i430, ptr %arrayidx81.i330.i431, align 8
  %and82.i331.i432 = lshr i64 %521, 2
  %shr83.i332.i433 = and i64 %and82.i331.i432, 3689348814741910323
  %and84.i333.i434 = and i64 %522, -3689348814741910324
  %or85.i334.i435 = or disjoint i64 %shr83.i332.i433, %and84.i333.i434
  %arrayidx86.i335.i436 = getelementptr inbounds nuw i8, ptr %q.i53, i32 24
  store i64 %or85.i334.i435, ptr %arrayidx86.i335.i436, align 8
  %arrayidx91.i336.i437 = getelementptr inbounds nuw i8, ptr %q.i53, i32 32
  %523 = load i64, ptr %arrayidx91.i336.i437, align 8
  %arrayidx92.i337.i438 = getelementptr inbounds nuw i8, ptr %q.i53, i32 48
  %524 = load i64, ptr %arrayidx92.i337.i438, align 8
  %and93.i338.i439 = and i64 %523, 3689348814741910323
  %and94.i339.i440 = shl i64 %524, 2
  %shl95.i340.i441 = and i64 %and94.i339.i440, -3689348814741910324
  %or96.i341.i442 = or disjoint i64 %and93.i338.i439, %shl95.i340.i441
  %arrayidx97.i342.i443 = getelementptr inbounds nuw i8, ptr %q.i53, i32 32
  store i64 %or96.i341.i442, ptr %arrayidx97.i342.i443, align 8
  %and98.i343.i444 = lshr i64 %523, 2
  %shr99.i344.i445 = and i64 %and98.i343.i444, 3689348814741910323
  %and100.i345.i446 = and i64 %524, -3689348814741910324
  %or101.i346.i447 = or disjoint i64 %shr99.i344.i445, %and100.i345.i446
  %arrayidx102.i347.i448 = getelementptr inbounds nuw i8, ptr %q.i53, i32 48
  store i64 %or101.i346.i447, ptr %arrayidx102.i347.i448, align 8
  %arrayidx107.i348.i449 = getelementptr inbounds nuw i8, ptr %q.i53, i32 40
  %525 = load i64, ptr %arrayidx107.i348.i449, align 8
  %arrayidx108.i349.i450 = getelementptr inbounds nuw i8, ptr %q.i53, i32 56
  %526 = load i64, ptr %arrayidx108.i349.i450, align 8
  %and109.i350.i451 = and i64 %525, 3689348814741910323
  %and110.i351.i452 = shl i64 %526, 2
  %shl111.i352.i453 = and i64 %and110.i351.i452, -3689348814741910324
  %or112.i353.i454 = or disjoint i64 %and109.i350.i451, %shl111.i352.i453
  %arrayidx113.i354.i455 = getelementptr inbounds nuw i8, ptr %q.i53, i32 40
  store i64 %or112.i353.i454, ptr %arrayidx113.i354.i455, align 8
  %and114.i355.i456 = lshr i64 %525, 2
  %shr115.i356.i457 = and i64 %and114.i355.i456, 3689348814741910323
  %and116.i357.i458 = and i64 %526, -3689348814741910324
  %or117.i358.i459 = or disjoint i64 %shr115.i356.i457, %and116.i357.i458
  %arrayidx118.i359.i460 = getelementptr inbounds nuw i8, ptr %q.i53, i32 56
  store i64 %or117.i358.i459, ptr %arrayidx118.i359.i460, align 8
  %527 = load i64, ptr %q.i53, align 8
  %arrayidx124.i360.i461 = getelementptr inbounds nuw i8, ptr %q.i53, i32 32
  %528 = load i64, ptr %arrayidx124.i360.i461, align 8
  %and125.i361.i462 = and i64 %527, 1085102592571150095
  %and126.i362.i463 = shl i64 %528, 4
  %shl127.i363.i464 = and i64 %and126.i362.i463, -1085102592571150096
  %or128.i364.i465 = or disjoint i64 %and125.i361.i462, %shl127.i363.i464
  store i64 %or128.i364.i465, ptr %q.i53, align 8
  %and130.i365.i466 = lshr i64 %527, 4
  %shr131.i366.i467 = and i64 %and130.i365.i466, 1085102592571150095
  %and132.i367.i468 = and i64 %528, -1085102592571150096
  %or133.i368.i469 = or disjoint i64 %shr131.i366.i467, %and132.i367.i468
  %arrayidx134.i369.i470 = getelementptr inbounds nuw i8, ptr %q.i53, i32 32
  store i64 %or133.i368.i469, ptr %arrayidx134.i369.i470, align 8
  %arrayidx139.i370.i471 = getelementptr inbounds nuw i8, ptr %q.i53, i32 8
  %529 = load i64, ptr %arrayidx139.i370.i471, align 8
  %arrayidx140.i371.i472 = getelementptr inbounds nuw i8, ptr %q.i53, i32 40
  %530 = load i64, ptr %arrayidx140.i371.i472, align 8
  %and141.i372.i473 = and i64 %529, 1085102592571150095
  %and142.i373.i474 = shl i64 %530, 4
  %shl143.i374.i475 = and i64 %and142.i373.i474, -1085102592571150096
  %or144.i375.i476 = or disjoint i64 %and141.i372.i473, %shl143.i374.i475
  %arrayidx145.i376.i477 = getelementptr inbounds nuw i8, ptr %q.i53, i32 8
  store i64 %or144.i375.i476, ptr %arrayidx145.i376.i477, align 8
  %and146.i377.i478 = lshr i64 %529, 4
  %shr147.i378.i479 = and i64 %and146.i377.i478, 1085102592571150095
  %and148.i379.i480 = and i64 %530, -1085102592571150096
  %or149.i380.i481 = or disjoint i64 %shr147.i378.i479, %and148.i379.i480
  %arrayidx150.i381.i482 = getelementptr inbounds nuw i8, ptr %q.i53, i32 40
  store i64 %or149.i380.i481, ptr %arrayidx150.i381.i482, align 8
  %arrayidx155.i382.i483 = getelementptr inbounds nuw i8, ptr %q.i53, i32 16
  %531 = load i64, ptr %arrayidx155.i382.i483, align 8
  %arrayidx156.i383.i484 = getelementptr inbounds nuw i8, ptr %q.i53, i32 48
  %532 = load i64, ptr %arrayidx156.i383.i484, align 8
  %and157.i384.i485 = and i64 %531, 1085102592571150095
  %and158.i385.i486 = shl i64 %532, 4
  %shl159.i386.i487 = and i64 %and158.i385.i486, -1085102592571150096
  %or160.i387.i488 = or disjoint i64 %and157.i384.i485, %shl159.i386.i487
  %arrayidx161.i388.i489 = getelementptr inbounds nuw i8, ptr %q.i53, i32 16
  store i64 %or160.i387.i488, ptr %arrayidx161.i388.i489, align 8
  %and162.i389.i490 = lshr i64 %531, 4
  %shr163.i390.i491 = and i64 %and162.i389.i490, 1085102592571150095
  %and164.i391.i492 = and i64 %532, -1085102592571150096
  %or165.i392.i493 = or disjoint i64 %shr163.i390.i491, %and164.i391.i492
  %arrayidx166.i393.i494 = getelementptr inbounds nuw i8, ptr %q.i53, i32 48
  store i64 %or165.i392.i493, ptr %arrayidx166.i393.i494, align 8
  %arrayidx171.i394.i495 = getelementptr inbounds nuw i8, ptr %q.i53, i32 24
  %533 = load i64, ptr %arrayidx171.i394.i495, align 8
  %arrayidx172.i395.i496 = getelementptr inbounds nuw i8, ptr %q.i53, i32 56
  %534 = load i64, ptr %arrayidx172.i395.i496, align 8
  %and173.i396.i497 = and i64 %533, 1085102592571150095
  %and174.i397.i498 = shl i64 %534, 4
  %shl175.i398.i499 = and i64 %and174.i397.i498, -1085102592571150096
  %or176.i399.i500 = or disjoint i64 %and173.i396.i497, %shl175.i398.i499
  %arrayidx177.i400.i501 = getelementptr inbounds nuw i8, ptr %q.i53, i32 24
  store i64 %or176.i399.i500, ptr %arrayidx177.i400.i501, align 8
  %and178.i401.i502 = lshr i64 %533, 4
  %shr179.i402.i503 = and i64 %and178.i401.i502, 1085102592571150095
  %and180.i403.i504 = and i64 %534, -1085102592571150096
  %or181.i404.i505 = or disjoint i64 %shr179.i402.i503, %and180.i403.i504
  %arrayidx182.i405.i506 = getelementptr inbounds nuw i8, ptr %q.i53, i32 56
  store i64 %or181.i404.i505, ptr %arrayidx182.i405.i506, align 8
  br label %for.body24.i530

while.cond.i.i511.preheader:                      ; preds = %for.body24.i530
  br label %while.body.i.i516

for.body24.i530:                                  ; preds = %shift_rows.exit.i345, %for.body24.i530
  %i.2.i5081157 = phi i32 [ 0, %shift_rows.exit.i345 ], [ %inc32.i565, %for.body24.i530 ]
  %add.ptr27.idx.i531 = shl nuw nsw i32 %i.2.i5081157, 4
  %add.ptr27.i532 = getelementptr inbounds nuw i8, ptr %w.i52, i32 %add.ptr27.idx.i531
  %arrayidx28.i533 = getelementptr inbounds nuw [8 x i64], ptr %q.i53, i32 0, i32 %i.2.i5081157
  %535 = load i64, ptr %arrayidx28.i533, align 8
  %add29.i534 = or disjoint i32 %i.2.i5081157, 4
  %arrayidx30.i535 = getelementptr inbounds nuw [8 x i64], ptr %q.i53, i32 0, i32 %add29.i534
  %536 = load i64, ptr %arrayidx30.i535, align 8
  %and.i29.i536 = and i64 %535, 71777214294589695
  %and1.i30.i537 = and i64 %536, 71777214294589695
  %shr.i31.i538 = lshr i64 %535, 8
  %and2.i32.i539 = and i64 %shr.i31.i538, 71776119077928960
  %shr3.i33.i540 = lshr i64 %536, 8
  %and4.i34.i541 = and i64 %shr3.i33.i540, 71776119077928960
  %shr5.i35.i542 = lshr i64 %and.i29.i536, 8
  %or.i36.i543 = or disjoint i64 %and.i29.i536, %shr5.i35.i542
  %shr6.i37.i544 = lshr i64 %and1.i30.i537, 8
  %or7.i.i545 = or disjoint i64 %and1.i30.i537, %shr6.i37.i544
  %537 = and i64 %535, 280375465148160
  %538 = or disjoint i64 %and2.i32.i539, %537
  %or9.i38.i546 = lshr exact i64 %538, 8
  %539 = and i64 %536, 280375465148160
  %540 = or disjoint i64 %and4.i34.i541, %539
  %or11.i.i547 = lshr exact i64 %540, 8
  %and12.i.i548 = and i64 %or.i36.i543, 281470681808895
  %and13.i39.i549 = and i64 %or7.i.i545, 281470681808895
  %shr16.i.i550 = lshr i64 %and12.i.i548, 16
  %or181.i.i551 = or disjoint i64 %and12.i.i548, %shr16.i.i550
  %or18.i.i552 = trunc i64 %or181.i.i551 to i32
  store i32 %or18.i.i552, ptr %add.ptr27.i532, align 4
  %shr20.i.i553 = lshr i64 %and13.i39.i549, 16
  %or222.i.i554 = or disjoint i64 %and13.i39.i549, %shr20.i.i553
  %or22.i.i555 = trunc i64 %or222.i.i554 to i32
  %arrayidx23.i.i556 = getelementptr inbounds nuw i8, ptr %add.ptr27.i532, i32 4
  store i32 %or22.i.i555, ptr %arrayidx23.i.i556, align 4
  %shr25.i.i557 = lshr i64 %538, 24
  %or273.i.i558 = or disjoint i64 %or9.i38.i546, %shr25.i.i557
  %or27.i.i559 = trunc i64 %or273.i.i558 to i32
  %arrayidx28.i.i560 = getelementptr inbounds nuw i8, ptr %add.ptr27.i532, i32 8
  store i32 %or27.i.i559, ptr %arrayidx28.i.i560, align 4
  %shr30.i.i561 = lshr i64 %540, 24
  %or324.i.i562 = or disjoint i64 %or11.i.i547, %shr30.i.i561
  %or32.i.i563 = trunc i64 %or324.i.i562 to i32
  %arrayidx33.i.i564 = getelementptr inbounds nuw i8, ptr %add.ptr27.i532, i32 12
  store i32 %or32.i.i563, ptr %arrayidx33.i.i564, align 4
  %inc32.i565 = add nuw nsw i32 %i.2.i5081157, 1
  %exitcond2.i509.not = icmp eq i32 %inc32.i565, 4
  br i1 %exitcond2.i509.not, label %while.cond.i.i511.preheader, label %for.body24.i530, !llvm.loop !69

while.body.i.i516:                                ; preds = %while.cond.i.i511.preheader, %while.body.i.i516
  %dst.addr.0.i.i5141160 = phi ptr [ %tmp.i, %while.cond.i.i511.preheader ], [ %add.ptr.i.i529, %while.body.i.i516 ]
  %v.addr.0.i.i5131159 = phi ptr [ %w.i52, %while.cond.i.i511.preheader ], [ %incdec.ptr.i.i518, %while.body.i.i516 ]
  %num.addr.0.i.i5121158 = phi i32 [ 16, %while.cond.i.i511.preheader ], [ %dec.i.i517, %while.body.i.i516 ]
  %dec.i.i517 = add nsw i32 %num.addr.0.i.i5121158, -1
  %incdec.ptr.i.i518 = getelementptr inbounds nuw i8, ptr %v.addr.0.i.i5131159, i32 4
  %541 = load i32, ptr %v.addr.0.i.i5131159, align 4
  %conv.i.i519 = trunc i32 %541 to i8
  store i8 %conv.i.i519, ptr %dst.addr.0.i.i5141160, align 1
  %shr.i.i520 = lshr i32 %541, 8
  %conv1.i.i521 = trunc i32 %shr.i.i520 to i8
  %arrayidx2.i.i522 = getelementptr inbounds nuw i8, ptr %dst.addr.0.i.i5141160, i32 1
  store i8 %conv1.i.i521, ptr %arrayidx2.i.i522, align 1
  %shr3.i.i523 = lshr i32 %541, 16
  %conv4.i.i524 = trunc i32 %shr3.i.i523 to i8
  %arrayidx5.i.i525 = getelementptr inbounds nuw i8, ptr %dst.addr.0.i.i5141160, i32 2
  store i8 %conv4.i.i524, ptr %arrayidx5.i.i525, align 1
  %shr6.i.i526 = lshr i32 %541, 24
  %conv7.i.i527 = trunc nuw i32 %shr6.i.i526 to i8
  %arrayidx8.i.i528 = getelementptr inbounds nuw i8, ptr %dst.addr.0.i.i5141160, i32 3
  store i8 %conv7.i.i527, ptr %arrayidx8.i.i528, align 1
  %add.ptr.i.i529 = getelementptr inbounds nuw i8, ptr %dst.addr.0.i.i5141160, i32 4
  %cmp.not.i.i515 = icmp eq i32 %dec.i.i517, 0
  br i1 %cmp.not.i.i515, label %aes_ecb4x.exit829, label %while.body.i.i516, !llvm.loop !70

aes_ecb4x.exit829:                                ; preds = %while.body.i.i516
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %w.i52)
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %q.i53)
  %add.ptr.i17 = getelementptr inbounds nuw i8, ptr %ivw.i, i32 12
  %542 = load i32, ptr %add.ptr.i17, align 4
  %543 = call i32 @llvm.bswap.i32(i32 %542)
  %add.i8.i18 = add i32 %543, 4
  %544 = call i32 @llvm.bswap.i32(i32 %add.i8.i18)
  store i32 %544, ptr %add.ptr.i17, align 4
  %add.ptr1.i19 = getelementptr inbounds nuw i8, ptr %ivw.i, i32 28
  %545 = load i32, ptr %add.ptr1.i19, align 4
  %546 = call i32 @llvm.bswap.i32(i32 %545)
  %add.i5.i20 = add i32 %546, 4
  %547 = call i32 @llvm.bswap.i32(i32 %add.i5.i20)
  store i32 %547, ptr %add.ptr1.i19, align 4
  %add.ptr2.i21 = getelementptr inbounds nuw i8, ptr %ivw.i, i32 44
  %548 = load i32, ptr %add.ptr2.i21, align 4
  %549 = call i32 @llvm.bswap.i32(i32 %548)
  %add.i2.i22 = add i32 %549, 4
  %550 = call i32 @llvm.bswap.i32(i32 %add.i2.i22)
  store i32 %550, ptr %add.ptr2.i21, align 4
  %add.ptr3.i23 = getelementptr inbounds nuw i8, ptr %ivw.i, i32 60
  %551 = load i32, ptr %add.ptr3.i23, align 4
  %552 = call i32 @llvm.bswap.i32(i32 %551)
  %add.i.i24 = add i32 %552, 4
  %553 = call i32 @llvm.bswap.i32(i32 %add.i.i24)
  store i32 %553, ptr %add.ptr3.i23, align 4
  br label %for.body.i13

for.body.i13:                                     ; preds = %aes_ecb4x.exit829, %for.body.i13
  %i.0.i121161 = phi i32 [ 0, %aes_ecb4x.exit829 ], [ %inc.i14, %for.body.i13 ]
  %arrayidx26.i = getelementptr inbounds nuw [64 x i8], ptr %tmp.i, i32 0, i32 %i.0.i121161
  %554 = load i8, ptr %arrayidx26.i, align 1
  %arrayidx27.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i.lcssa, i32 %i.0.i121161
  store i8 %554, ptr %arrayidx27.i, align 1
  %inc.i14 = add nuw nsw i32 %i.0.i121161, 1
  %exitcond = icmp ne i32 %inc.i14, %outlen.addr.0.i.lcssa
  br i1 %exitcond, label %for.body.i13, label %aes_ctr.exit.loopexit, !llvm.loop !71

aes_ctr.exit.loopexit:                            ; preds = %for.body.i13
  br label %aes_ctr.exit

aes_ctr.exit:                                     ; preds = %aes_ctr.exit.loopexit, %while.end.i
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %ivw.i)
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %tmp.i)
  %555 = load ptr, ptr %ctx, align 4
  call void @free(ptr noundef %555) #8
  ret i32 %outputByteLen
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #3 {
entry:
  %p_buf = alloca [128 x i8], align 16
  call void @mayo_memset(ptr %p_buf, i8 0, i32 128)
  %epk = alloca [18705 x i64], align 16
  call void @mayo_memset(ptr %epk, i8 0, i32 149640)
  %seed_pk_buf = alloca [128 x i8], align 16
  call void @mayo_memset(ptr %seed_pk_buf, i8 0, i32 128)
  call fastcc void @expand_P1_P2(ptr nonnull %p_buf, ptr nonnull %epk, ptr nonnull %seed_pk_buf)
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #4

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.bswap.i32(i32) #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.fshl.i64(i64, i64, i64) #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.fshl.i32(i32, i32, i32) #5

; Function Attrs: nounwind
define dso_local void @mayo_memcpy(ptr noundef %dst, ptr noundef %src, i32 noundef %len) local_unnamed_addr #6 {
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
  br label %for.cond, !llvm.loop !72

for.end:                                          ; preds = %for.cond
  ret void
}

attributes #0 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #1 = { inlinehint nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #2 = { allocsize(0) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #3 = { inlinehint }
attributes #4 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #5 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #7 = { nobuiltin nounwind allocsize(0) "no-builtins" }
attributes #8 = { nobuiltin nounwind "no-builtins" }

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
!36 = distinct !{!36, !6}
!37 = distinct !{!37, !6}
!38 = distinct !{!38, !6}
!39 = distinct !{!39, !6}
!40 = distinct !{!40, !6}
!41 = distinct !{!41, !6}
!42 = distinct !{!42, !6}
!43 = distinct !{!43, !6}
!44 = distinct !{!44, !6}
!45 = distinct !{!45, !6}
!46 = distinct !{!46, !6}
!47 = distinct !{!47, !6}
!48 = distinct !{!48, !6}
!49 = distinct !{!49, !6}
!50 = distinct !{!50, !6}
!51 = distinct !{!51, !6}
!52 = distinct !{!52, !6}
!53 = distinct !{!53, !6}
!54 = distinct !{!54, !6}
!55 = distinct !{!55, !6}
!56 = distinct !{!56, !6}
!57 = distinct !{!57, !6}
!58 = distinct !{!58, !6}
!59 = distinct !{!59, !6}
!60 = distinct !{!60, !6}
!61 = distinct !{!61, !6}
!62 = distinct !{!62, !6}
!63 = distinct !{!63, !6}
!64 = distinct !{!64, !6}
!65 = distinct !{!65, !6}
!66 = distinct !{!66, !6}
!67 = distinct !{!67, !6}
!68 = distinct !{!68, !6}
!69 = distinct !{!69, !6}
!70 = distinct !{!70, !6}
!71 = distinct !{!71, !6}
!72 = distinct !{!72, !6}
