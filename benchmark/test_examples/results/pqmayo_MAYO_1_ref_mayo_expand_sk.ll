; ModuleID = '../mayo_IR/mayo1.ll'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

%struct.shake128incctx = type { ptr }

@KeccakF_RoundConstants = internal unnamed_addr constant [24 x i64] [i64 1, i64 32898, i64 -9223372036854742902, i64 -9223372034707259392, i64 32907, i64 2147483649, i64 -9223372034707259263, i64 -9223372036854743031, i64 138, i64 136, i64 2147516425, i64 2147483658, i64 2147516555, i64 -9223372036854775669, i64 -9223372036854742903, i64 -9223372036854743037, i64 -9223372036854743038, i64 -9223372036854775680, i64 32778, i64 -9223372034707292150, i64 -9223372034707259263, i64 -9223372036854742912, i64 2147483649, i64 -9223372034707259384], align 8
@Rcon = internal unnamed_addr constant [10 x i8] c"\01\02\04\08\10 @\80\1B6", align 1
@mayo_secure_clear.memset_func = internal global ptr @memset, align 4

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

declare dso_local ptr @memcpy(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #0

; Function Attrs: inlinehint nounwind
define dso_local i32 @pqmayo_MAYO_1_ref_mayo_expand_sk(ptr noundef %p, ptr noundef %csk, ptr noundef %sk) local_unnamed_addr #1 {
entry:
  %q.i1.i = alloca [8 x i64], align 8
  %skey.i1621 = alloca [60 x i32], align 4
  %q.i1622 = alloca [8 x i64], align 8
  %w.i843 = alloca [16 x i32], align 4
  %q.i844 = alloca [8 x i64], align 8
  %w.i = alloca [16 x i32], align 4
  %q.i = alloca [8 x i64], align 8
  %t.i51 = alloca [200 x i8], align 1
  %t.i = alloca [136 x i8], align 1
  %s.i = alloca %struct.shake128incctx, align 4
  %ivw.i = alloca [16 x i32], align 4
  %tmp.i18 = alloca [64 x i8], align 1
  %tmp.i = alloca [5 x i64], align 8
  %skey.i = alloca [22 x i64], align 8
  %ctx.i = alloca %struct.shake128incctx, align 4
  %iv.i = alloca [16 x i8], align 1
  %S = alloca [328 x i8], align 1
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %sk, i32 148200
  call void @llvm.lifetime.start.p0(i64 136, ptr nonnull %t.i)
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %s.i)
  %call.i.i = call dereferenceable_or_null(200) ptr @malloc(i32 noundef 200) #7
  store ptr %call.i.i, ptr %s.i, align 4
  %cmp.i.i = icmp eq ptr %call.i.i, null
  br i1 %cmp.i.i, label %if.then.i.i, label %shake256_absorb.exit.i

if.then.i.i:                                      ; preds = %entry
  call void @exit(i32 noundef 111) #8
  br label %shake256_absorb.exit.i

shake256_absorb.exit.i:                           ; preds = %if.then.i.i, %entry
  %0 = load ptr, ptr %s.i, align 4
  call void @llvm.lifetime.start.p0(i64 200, ptr nonnull %t.i51)
  br label %for.body.i70

for.cond10.i.preheader:                           ; preds = %for.body.i70
  br label %for.body12.i

for.body.i70:                                     ; preds = %shake256_absorb.exit.i, %for.body.i70
  %i.0.i531924 = phi i32 [ 0, %shake256_absorb.exit.i ], [ %inc.i72, %for.body.i70 ]
  %arrayidx.i71 = getelementptr inbounds nuw i64, ptr %0, i32 %i.0.i531924
  store i64 0, ptr %arrayidx.i71, align 8
  %inc.i72 = add nuw nsw i32 %i.0.i531924, 1
  %exitcond.i54.not = icmp eq i32 %inc.i72, 25
  br i1 %exitcond.i54.not, label %for.cond10.i.preheader, label %for.body.i70, !llvm.loop !7

for.cond17.i.preheader:                           ; preds = %for.body12.i
  br label %for.body19.i

for.body12.i:                                     ; preds = %for.cond10.i.preheader, %for.body12.i
  %i.2.i1925 = phi i32 [ 0, %for.cond10.i.preheader ], [ %inc15.i, %for.body12.i ]
  %arrayidx13.i69 = getelementptr inbounds nuw [200 x i8], ptr %t.i51, i32 0, i32 %i.2.i1925
  store i8 0, ptr %arrayidx13.i69, align 1
  %inc15.i = add nuw nsw i32 %i.2.i1925, 1
  %exitcond4.i.not = icmp eq i32 %inc15.i, 136
  br i1 %exitcond4.i.not, label %for.cond17.i.preheader, label %for.body12.i, !llvm.loop !8

for.body19.i:                                     ; preds = %for.cond17.i.preheader, %for.body19.i
  %i.3.i1926 = phi i32 [ 0, %for.cond17.i.preheader ], [ %inc23.i, %for.body19.i ]
  %arrayidx20.i68 = getelementptr inbounds nuw i8, ptr %csk, i32 %i.3.i1926
  %1 = load i8, ptr %arrayidx20.i68, align 1
  %arrayidx21.i = getelementptr inbounds nuw [200 x i8], ptr %t.i51, i32 0, i32 %i.3.i1926
  store i8 %1, ptr %arrayidx21.i, align 1
  %inc23.i = add nuw nsw i32 %i.3.i1926, 1
  %exitcond6.i.not = icmp eq i32 %inc23.i, 24
  br i1 %exitcond6.i.not, label %for.end24.i, label %for.body19.i, !llvm.loop !9

for.end24.i:                                      ; preds = %for.body19.i
  %arrayidx25.i = getelementptr inbounds nuw [200 x i8], ptr %t.i51, i32 0, i32 24
  store i8 31, ptr %arrayidx25.i, align 1
  %arrayidx27.i67 = getelementptr inbounds nuw i8, ptr %t.i51, i32 135
  %2 = load i8, ptr %arrayidx27.i67, align 1
  %3 = or i8 %2, -128
  store i8 %3, ptr %arrayidx27.i67, align 1
  br label %for.body33.i

for.body33.i:                                     ; preds = %for.end24.i, %load64.exit13.i
  %i.4.i1929 = phi i32 [ 0, %for.end24.i ], [ %inc40.i, %load64.exit13.i ]
  %mul34.i = shl nuw nsw i32 %i.4.i1929, 3
  %add.ptr35.i = getelementptr inbounds nuw i8, ptr %t.i51, i32 %mul34.i
  br label %for.inc.i5.i

for.inc.i5.i:                                     ; preds = %for.body33.i, %for.inc.i5.i
  %i.0.i3.i1928 = phi i32 [ 0, %for.body33.i ], [ %inc.i12.i, %for.inc.i5.i ]
  %r.0.i2.i1927 = phi i64 [ 0, %for.body33.i ], [ %or.i11.i, %for.inc.i5.i ]
  %arrayidx.i6.i = getelementptr inbounds nuw i8, ptr %add.ptr35.i, i32 %i.0.i3.i1928
  %4 = load i8, ptr %arrayidx.i6.i, align 1
  %conv.i7.i = zext i8 %4 to i64
  %mul.i8.i = shl nuw nsw i32 %i.0.i3.i1928, 3
  %sh_prom.i9.i = zext nneg i32 %mul.i8.i to i64
  %shl.i10.i = shl nuw i64 %conv.i7.i, %sh_prom.i9.i
  %or.i11.i = or i64 %r.0.i2.i1927, %shl.i10.i
  %inc.i12.i = add nuw nsw i32 %i.0.i3.i1928, 1
  %exitcond.i4.i.not = icmp eq i32 %inc.i12.i, 8
  br i1 %exitcond.i4.i.not, label %load64.exit13.i, label %for.inc.i5.i, !llvm.loop !10

load64.exit13.i:                                  ; preds = %for.inc.i5.i
  %r.0.i2.i.lcssa = phi i64 [ %or.i11.i, %for.inc.i5.i ]
  %arrayidx37.i = getelementptr inbounds nuw i64, ptr %0, i32 %i.4.i1929
  %5 = load i64, ptr %arrayidx37.i, align 8
  %xor38.i = xor i64 %5, %r.0.i2.i.lcssa
  store i64 %xor38.i, ptr %arrayidx37.i, align 8
  %inc40.i = add nuw nsw i32 %i.4.i1929, 1
  %exitcond7.i.not = icmp eq i32 %inc40.i, 17
  br i1 %exitcond7.i.not, label %keccak_absorb.exit, label %for.body33.i, !llvm.loop !11

keccak_absorb.exit:                               ; preds = %load64.exit13.i
  call void @llvm.lifetime.end.p0(i64 200, ptr nonnull %t.i51)
  %6 = load ptr, ptr %s.i, align 4
  br label %while.body.i.i32

while.body.i.i32:                                 ; preds = %keccak_absorb.exit, %for.end.i.i
  %h.addr.0.i.i1959 = phi ptr [ %S, %keccak_absorb.exit ], [ %add.ptr2.i.i, %for.end.i.i ]
  %nblocks.addr.0.i.i1958 = phi i32 [ 2, %keccak_absorb.exit ], [ %dec.i.i36, %for.end.i.i ]
  %7 = load i64, ptr %6, align 8
  %arrayidx1.i = getelementptr inbounds nuw i8, ptr %6, i32 8
  %8 = load i64, ptr %arrayidx1.i, align 8
  %arrayidx2.i99 = getelementptr inbounds nuw i8, ptr %6, i32 16
  %9 = load i64, ptr %arrayidx2.i99, align 8
  %arrayidx3.i = getelementptr inbounds nuw i8, ptr %6, i32 24
  %10 = load i64, ptr %arrayidx3.i, align 8
  %arrayidx4.i = getelementptr inbounds nuw i8, ptr %6, i32 32
  %11 = load i64, ptr %arrayidx4.i, align 8
  %arrayidx5.i100 = getelementptr inbounds nuw i8, ptr %6, i32 40
  %12 = load i64, ptr %arrayidx5.i100, align 8
  %arrayidx6.i = getelementptr inbounds nuw i8, ptr %6, i32 48
  %13 = load i64, ptr %arrayidx6.i, align 8
  %arrayidx7.i = getelementptr inbounds nuw i8, ptr %6, i32 56
  %14 = load i64, ptr %arrayidx7.i, align 8
  %arrayidx8.i101 = getelementptr inbounds nuw i8, ptr %6, i32 64
  %15 = load i64, ptr %arrayidx8.i101, align 8
  %arrayidx9.i = getelementptr inbounds nuw i8, ptr %6, i32 72
  %16 = load i64, ptr %arrayidx9.i, align 8
  %arrayidx10.i = getelementptr inbounds nuw i8, ptr %6, i32 80
  %17 = load i64, ptr %arrayidx10.i, align 8
  %arrayidx11.i = getelementptr inbounds nuw i8, ptr %6, i32 88
  %18 = load i64, ptr %arrayidx11.i, align 8
  %arrayidx12.i102 = getelementptr inbounds nuw i8, ptr %6, i32 96
  %19 = load i64, ptr %arrayidx12.i102, align 8
  %arrayidx13.i103 = getelementptr inbounds nuw i8, ptr %6, i32 104
  %20 = load i64, ptr %arrayidx13.i103, align 8
  %arrayidx14.i = getelementptr inbounds nuw i8, ptr %6, i32 112
  %21 = load i64, ptr %arrayidx14.i, align 8
  %arrayidx15.i = getelementptr inbounds nuw i8, ptr %6, i32 120
  %22 = load i64, ptr %arrayidx15.i, align 8
  %arrayidx16.i104 = getelementptr inbounds nuw i8, ptr %6, i32 128
  %23 = load i64, ptr %arrayidx16.i104, align 8
  %arrayidx17.i = getelementptr inbounds nuw i8, ptr %6, i32 136
  %24 = load i64, ptr %arrayidx17.i, align 8
  %arrayidx18.i105 = getelementptr inbounds nuw i8, ptr %6, i32 144
  %25 = load i64, ptr %arrayidx18.i105, align 8
  %arrayidx19.i106 = getelementptr inbounds nuw i8, ptr %6, i32 152
  %26 = load i64, ptr %arrayidx19.i106, align 8
  %arrayidx20.i107 = getelementptr inbounds nuw i8, ptr %6, i32 160
  %27 = load i64, ptr %arrayidx20.i107, align 8
  %arrayidx21.i108 = getelementptr inbounds nuw i8, ptr %6, i32 168
  %28 = load i64, ptr %arrayidx21.i108, align 8
  %arrayidx22.i = getelementptr inbounds nuw i8, ptr %6, i32 176
  %29 = load i64, ptr %arrayidx22.i, align 8
  %arrayidx23.i = getelementptr inbounds nuw i8, ptr %6, i32 184
  %30 = load i64, ptr %arrayidx23.i, align 8
  %arrayidx24.i = getelementptr inbounds nuw i8, ptr %6, i32 192
  %31 = load i64, ptr %arrayidx24.i, align 8
  br label %for.inc.i

for.inc.i:                                        ; preds = %while.body.i.i32, %for.inc.i
  %Asu.0.i1955 = phi i64 [ %31, %while.body.i.i32 ], [ %xor447.i, %for.inc.i ]
  %round.0.i1954 = phi i32 [ 0, %while.body.i.i32 ], [ %add448.i, %for.inc.i ]
  %Aba.0.i1953 = phi i64 [ %7, %while.body.i.i32 ], [ %xor295.i, %for.inc.i ]
  %Abe.0.i1952 = phi i64 [ %8, %while.body.i.i32 ], [ %xor298.i, %for.inc.i ]
  %Abi.0.i1951 = phi i64 [ %9, %while.body.i.i32 ], [ %xor301.i, %for.inc.i ]
  %Abo.0.i1950 = phi i64 [ %10, %while.body.i.i32 ], [ %xor304.i, %for.inc.i ]
  %Abu.0.i1949 = phi i64 [ %11, %while.body.i.i32 ], [ %xor307.i, %for.inc.i ]
  %Aga.0.i1948 = phi i64 [ %12, %while.body.i.i32 ], [ %xor330.i, %for.inc.i ]
  %Age.0.i1947 = phi i64 [ %13, %while.body.i.i32 ], [ %xor333.i, %for.inc.i ]
  %Agi.0.i1946 = phi i64 [ %14, %while.body.i.i32 ], [ %xor336.i, %for.inc.i ]
  %Ago.0.i1945 = phi i64 [ %15, %while.body.i.i32 ], [ %xor339.i, %for.inc.i ]
  %Agu.0.i1944 = phi i64 [ %16, %while.body.i.i32 ], [ %xor342.i, %for.inc.i ]
  %Aka.0.i1943 = phi i64 [ %17, %while.body.i.i32 ], [ %xor365.i, %for.inc.i ]
  %Ake.0.i1942 = phi i64 [ %18, %while.body.i.i32 ], [ %xor368.i, %for.inc.i ]
  %Aki.0.i1941 = phi i64 [ %19, %while.body.i.i32 ], [ %xor371.i, %for.inc.i ]
  %Ako.0.i1940 = phi i64 [ %20, %while.body.i.i32 ], [ %xor374.i, %for.inc.i ]
  %Aku.0.i1939 = phi i64 [ %21, %while.body.i.i32 ], [ %xor377.i, %for.inc.i ]
  %Ama.0.i1938 = phi i64 [ %22, %while.body.i.i32 ], [ %xor400.i, %for.inc.i ]
  %Ame.0.i1937 = phi i64 [ %23, %while.body.i.i32 ], [ %xor403.i, %for.inc.i ]
  %Ami.0.i1936 = phi i64 [ %24, %while.body.i.i32 ], [ %xor406.i, %for.inc.i ]
  %Amo.0.i1935 = phi i64 [ %25, %while.body.i.i32 ], [ %xor409.i, %for.inc.i ]
  %Amu.0.i1934 = phi i64 [ %26, %while.body.i.i32 ], [ %xor412.i, %for.inc.i ]
  %Asa.0.i1933 = phi i64 [ %27, %while.body.i.i32 ], [ %xor435.i, %for.inc.i ]
  %Ase.0.i1932 = phi i64 [ %28, %while.body.i.i32 ], [ %xor438.i, %for.inc.i ]
  %Asi.0.i1931 = phi i64 [ %29, %while.body.i.i32 ], [ %xor441.i, %for.inc.i ]
  %Aso.0.i1930 = phi i64 [ %30, %while.body.i.i32 ], [ %xor444.i, %for.inc.i ]
  %xor32.i = xor i64 %Abi.0.i1951, %Agi.0.i1946
  %xor33.i = xor i64 %xor32.i, %Aki.0.i1941
  %xor34.i = xor i64 %xor33.i, %Ami.0.i1936
  %xor35.i = xor i64 %xor34.i, %Asi.0.i1931
  %xor40.i = xor i64 %Abu.0.i1949, %Agu.0.i1944
  %xor41.i = xor i64 %xor40.i, %Aku.0.i1939
  %xor42.i = xor i64 %xor41.i, %Amu.0.i1934
  %xor43.i = xor i64 %xor42.i, %Asu.0.i1955
  %32 = call i64 @llvm.fshl.i64(i64 %xor43.i, i64 %xor43.i, i64 1)
  %xor57.i = xor i64 %xor35.i, %32
  %xor203.i = xor i64 %Ago.0.i1945, %xor57.i
  %33 = call i64 @llvm.fshl.i64(i64 %xor203.i, i64 %xor203.i, i64 55)
  %xor28.i = xor i64 %Abe.0.i1952, %Age.0.i1947
  %xor29.i = xor i64 %xor28.i, %Ake.0.i1942
  %xor30.i = xor i64 %xor29.i, %Ame.0.i1937
  %xor31.i = xor i64 %xor30.i, %Ase.0.i1932
  %34 = call i64 @llvm.fshl.i64(i64 %xor31.i, i64 %xor31.i, i64 1)
  %xor45.i = xor i64 %xor43.i, %34
  %xor211.i = xor i64 %Ama.0.i1938, %xor45.i
  %35 = call i64 @llvm.fshl.i64(i64 %xor211.i, i64 %xor211.i, i64 41)
  %xor36.i = xor i64 %Abo.0.i1950, %Ago.0.i1945
  %xor37.i = xor i64 %xor36.i, %Ako.0.i1940
  %xor38.i111 = xor i64 %xor37.i, %Amo.0.i1935
  %xor39.i = xor i64 %xor38.i111, %Aso.0.i1930
  %xor.i112 = xor i64 %Aba.0.i1953, %Aga.0.i1948
  %xor25.i = xor i64 %xor.i112, %Aka.0.i1943
  %xor26.i = xor i64 %xor25.i, %Ama.0.i1938
  %xor27.i = xor i64 %xor26.i, %Asa.0.i1933
  %36 = call i64 @llvm.fshl.i64(i64 %xor27.i, i64 %xor27.i, i64 1)
  %xor61.i = xor i64 %xor39.i, %36
  %xor207.i = xor i64 %Aku.0.i1939, %xor61.i
  %37 = call i64 @llvm.fshl.i64(i64 %xor207.i, i64 %xor207.i, i64 39)
  %not222.i = xor i64 %37, -1
  %and223.i = and i64 %35, %not222.i
  %xor224.i = xor i64 %33, %and223.i
  %38 = call i64 @llvm.fshl.i64(i64 %xor39.i, i64 %xor39.i, i64 1)
  %xor53.i = xor i64 %xor31.i, %38
  %xor67.i = xor i64 %Aki.0.i1941, %xor53.i
  %39 = call i64 @llvm.fshl.i64(i64 %xor67.i, i64 %xor67.i, i64 43)
  %40 = call i64 @llvm.fshl.i64(i64 %xor35.i, i64 %xor35.i, i64 1)
  %xor49.i = xor i64 %xor27.i, %40
  %xor63.i = xor i64 %Age.0.i1947, %xor49.i
  %41 = call i64 @llvm.fshl.i64(i64 %xor63.i, i64 %xor63.i, i64 44)
  %not.i = xor i64 %41, -1
  %and.i113 = and i64 %39, %not.i
  %arrayidx80.i = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %round.0.i1954
  %42 = load i64, ptr %arrayidx80.i, align 8
  %43 = xor i64 %and.i113, %42
  %xor62.i = xor i64 %Aba.0.i1953, %xor45.i
  %xor81.i = xor i64 %43, %xor62.i
  %xor94.i = xor i64 %Abo.0.i1950, %xor57.i
  %44 = call i64 @llvm.fshl.i64(i64 %xor94.i, i64 %xor94.i, i64 28)
  %xor102.i = xor i64 %Aka.0.i1943, %xor45.i
  %45 = call i64 @llvm.fshl.i64(i64 %xor102.i, i64 %xor102.i, i64 3)
  %xor98.i = xor i64 %Agu.0.i1944, %xor61.i
  %46 = call i64 @llvm.fshl.i64(i64 %xor98.i, i64 %xor98.i, i64 20)
  %not114.i = xor i64 %46, -1
  %and115.i = and i64 %45, %not114.i
  %xor116.i = xor i64 %44, %and115.i
  %xor234.i = xor i64 %xor81.i, %xor116.i
  %xor129.i = xor i64 %Abe.0.i1952, %xor49.i
  %47 = call i64 @llvm.fshl.i64(i64 %xor129.i, i64 %xor129.i, i64 1)
  %xor137.i = xor i64 %Ako.0.i1940, %xor57.i
  %48 = call i64 @llvm.fshl.i64(i64 %xor137.i, i64 %xor137.i, i64 25)
  %xor133.i = xor i64 %Agi.0.i1946, %xor53.i
  %49 = call i64 @llvm.fshl.i64(i64 %xor133.i, i64 %xor133.i, i64 6)
  %not149.i = xor i64 %49, -1
  %and150.i = and i64 %48, %not149.i
  %xor151.i = xor i64 %47, %and150.i
  %xor235.i = xor i64 %xor234.i, %xor151.i
  %xor164.i = xor i64 %Abu.0.i1949, %xor61.i
  %50 = call i64 @llvm.fshl.i64(i64 %xor164.i, i64 %xor164.i, i64 27)
  %xor172.i = xor i64 %Ake.0.i1942, %xor49.i
  %51 = call i64 @llvm.fshl.i64(i64 %xor172.i, i64 %xor172.i, i64 10)
  %xor168.i = xor i64 %Aga.0.i1948, %xor45.i
  %52 = call i64 @llvm.fshl.i64(i64 %xor168.i, i64 %xor168.i, i64 36)
  %not184.i = xor i64 %52, -1
  %and185.i = and i64 %51, %not184.i
  %xor186.i = xor i64 %50, %and185.i
  %xor236.i = xor i64 %xor235.i, %xor186.i
  %xor199.i = xor i64 %Abi.0.i1951, %xor53.i
  %53 = call i64 @llvm.fshl.i64(i64 %xor199.i, i64 %xor199.i, i64 62)
  %not219.i = xor i64 %33, -1
  %and220.i = and i64 %37, %not219.i
  %xor221.i = xor i64 %53, %and220.i
  %xor237.i = xor i64 %xor236.i, %xor221.i
  %xor75.i = xor i64 %Asu.0.i1955, %xor61.i
  %54 = call i64 @llvm.fshl.i64(i64 %xor75.i, i64 %xor75.i, i64 14)
  %xor71.i = xor i64 %Amo.0.i1935, %xor57.i
  %55 = call i64 @llvm.fshl.i64(i64 %xor71.i, i64 %xor71.i, i64 21)
  %not85.i = xor i64 %55, -1
  %and86.i = and i64 %54, %not85.i
  %xor87.i = xor i64 %39, %and86.i
  %xor110.i = xor i64 %Asi.0.i1931, %xor53.i
  %56 = call i64 @llvm.fshl.i64(i64 %xor110.i, i64 %xor110.i, i64 61)
  %xor106.i = xor i64 %Ame.0.i1937, %xor49.i
  %57 = call i64 @llvm.fshl.i64(i64 %xor106.i, i64 %xor106.i, i64 45)
  %not120.i = xor i64 %57, -1
  %and121.i = and i64 %56, %not120.i
  %xor122.i = xor i64 %45, %and121.i
  %xor242.i = xor i64 %xor87.i, %xor122.i
  %xor145.i = xor i64 %Asa.0.i1933, %xor45.i
  %58 = call i64 @llvm.fshl.i64(i64 %xor145.i, i64 %xor145.i, i64 18)
  %xor141.i = xor i64 %Amu.0.i1934, %xor61.i
  %59 = call i64 @llvm.fshl.i64(i64 %xor141.i, i64 %xor141.i, i64 8)
  %not155.i = xor i64 %59, -1
  %and156.i = and i64 %58, %not155.i
  %xor157.i = xor i64 %48, %and156.i
  %xor243.i = xor i64 %xor242.i, %xor157.i
  %xor180.i = xor i64 %Aso.0.i1930, %xor57.i
  %60 = call i64 @llvm.fshl.i64(i64 %xor180.i, i64 %xor180.i, i64 56)
  %xor176.i = xor i64 %Ami.0.i1936, %xor53.i
  %61 = call i64 @llvm.fshl.i64(i64 %xor176.i, i64 %xor176.i, i64 15)
  %not190.i = xor i64 %61, -1
  %and191.i = and i64 %60, %not190.i
  %xor192.i = xor i64 %51, %and191.i
  %xor244.i = xor i64 %xor243.i, %xor192.i
  %xor215.i = xor i64 %Ase.0.i1932, %xor49.i
  %62 = call i64 @llvm.fshl.i64(i64 %xor215.i, i64 %xor215.i, i64 2)
  %not225.i = xor i64 %35, -1
  %and226.i = and i64 %62, %not225.i
  %xor227.i = xor i64 %37, %and226.i
  %xor245.i = xor i64 %xor244.i, %xor227.i
  %63 = call i64 @llvm.fshl.i64(i64 %xor245.i, i64 %xor245.i, i64 1)
  %xor261.i = xor i64 %xor237.i, %63
  %xor429.i = xor i64 %xor224.i, %xor261.i
  %64 = call i64 @llvm.fshl.i64(i64 %xor429.i, i64 %xor429.i, i64 2)
  %not123.i = xor i64 %56, -1
  %and124.i = and i64 %44, %not123.i
  %xor125.i = xor i64 %57, %and124.i
  %not91.i = xor i64 %xor62.i, -1
  %and92.i = and i64 %41, %not91.i
  %xor93.i = xor i64 %54, %and92.i
  %not126.i = xor i64 %44, -1
  %and127.i = and i64 %46, %not126.i
  %xor128.i = xor i64 %56, %and127.i
  %xor250.i = xor i64 %xor93.i, %xor128.i
  %not161.i = xor i64 %47, -1
  %and162.i = and i64 %49, %not161.i
  %xor163.i = xor i64 %58, %and162.i
  %xor251.i = xor i64 %xor250.i, %xor163.i
  %not196.i = xor i64 %50, -1
  %and197.i = and i64 %52, %not196.i
  %xor198.i = xor i64 %60, %and197.i
  %xor252.i = xor i64 %xor251.i, %xor198.i
  %not231.i = xor i64 %53, -1
  %and232.i = and i64 %33, %not231.i
  %xor233.i = xor i64 %62, %and232.i
  %xor253.i = xor i64 %xor252.i, %xor233.i
  %65 = call i64 @llvm.fshl.i64(i64 %xor253.i, i64 %xor253.i, i64 1)
  %xor269.i = xor i64 %xor245.i, %65
  %xor417.i = xor i64 %xor125.i, %xor269.i
  %66 = call i64 @llvm.fshl.i64(i64 %xor417.i, i64 %xor417.i, i64 55)
  %not82.i = xor i64 %39, -1
  %and83.i = and i64 %55, %not82.i
  %xor84.i = xor i64 %41, %and83.i
  %not117.i = xor i64 %45, -1
  %and118.i = and i64 %57, %not117.i
  %xor119.i = xor i64 %46, %and118.i
  %xor238.i = xor i64 %xor84.i, %xor119.i
  %not152.i = xor i64 %48, -1
  %and153.i = and i64 %59, %not152.i
  %xor154.i = xor i64 %49, %and153.i
  %xor239.i = xor i64 %xor238.i, %xor154.i
  %not187.i = xor i64 %51, -1
  %and188.i = and i64 %61, %not187.i
  %xor189.i = xor i64 %52, %and188.i
  %xor240.i = xor i64 %xor239.i, %xor189.i
  %xor241.i = xor i64 %xor240.i, %xor224.i
  %not88.i = xor i64 %54, -1
  %and89.i = and i64 %xor62.i, %not88.i
  %xor90.i = xor i64 %55, %and89.i
  %xor246.i = xor i64 %xor90.i, %xor125.i
  %not158.i = xor i64 %58, -1
  %and159.i = and i64 %47, %not158.i
  %xor160.i = xor i64 %59, %and159.i
  %xor247.i = xor i64 %xor246.i, %xor160.i
  %not193.i = xor i64 %60, -1
  %and194.i = and i64 %50, %not193.i
  %xor195.i = xor i64 %61, %and194.i
  %xor248.i = xor i64 %xor247.i, %xor195.i
  %not228.i = xor i64 %62, -1
  %and229.i = and i64 %53, %not228.i
  %xor230.i = xor i64 %35, %and229.i
  %xor249.i = xor i64 %xor248.i, %xor230.i
  %67 = call i64 @llvm.fshl.i64(i64 %xor249.i, i64 %xor249.i, i64 1)
  %xor265.i = xor i64 %xor241.i, %67
  %xor413.i = xor i64 %xor87.i, %xor265.i
  %68 = call i64 @llvm.fshl.i64(i64 %xor413.i, i64 %xor413.i, i64 62)
  %not445.i = xor i64 %68, -1
  %and446.i = and i64 %66, %not445.i
  %xor447.i = xor i64 %64, %and446.i
  %69 = call i64 @llvm.fshl.i64(i64 %xor241.i, i64 %xor241.i, i64 1)
  %xor257.i = xor i64 %xor253.i, %69
  %xor425.i = xor i64 %xor186.i, %xor257.i
  %70 = call i64 @llvm.fshl.i64(i64 %xor425.i, i64 %xor425.i, i64 41)
  %not442.i = xor i64 %64, -1
  %and443.i = and i64 %68, %not442.i
  %xor444.i = xor i64 %70, %and443.i
  %71 = call i64 @llvm.fshl.i64(i64 %xor237.i, i64 %xor237.i, i64 1)
  %xor273.i = xor i64 %xor249.i, %71
  %xor421.i = xor i64 %xor163.i, %xor273.i
  %72 = call i64 @llvm.fshl.i64(i64 %xor421.i, i64 %xor421.i, i64 39)
  %not439.i = xor i64 %70, -1
  %and440.i = and i64 %64, %not439.i
  %xor441.i = xor i64 %72, %and440.i
  %not436.i = xor i64 %72, -1
  %and437.i = and i64 %70, %not436.i
  %xor438.i = xor i64 %66, %and437.i
  %not433.i = xor i64 %66, -1
  %and434.i = and i64 %72, %not433.i
  %xor435.i = xor i64 %68, %and434.i
  %xor394.i = xor i64 %xor230.i, %xor269.i
  %73 = call i64 @llvm.fshl.i64(i64 %xor394.i, i64 %xor394.i, i64 56)
  %xor382.i = xor i64 %xor116.i, %xor257.i
  %74 = call i64 @llvm.fshl.i64(i64 %xor382.i, i64 %xor382.i, i64 36)
  %xor378.i = xor i64 %xor93.i, %xor273.i
  %75 = call i64 @llvm.fshl.i64(i64 %xor378.i, i64 %xor378.i, i64 27)
  %not410.i = xor i64 %75, -1
  %and411.i = and i64 %74, %not410.i
  %xor412.i = xor i64 %73, %and411.i
  %xor390.i = xor i64 %xor192.i, %xor265.i
  %76 = call i64 @llvm.fshl.i64(i64 %xor390.i, i64 %xor390.i, i64 15)
  %not407.i = xor i64 %73, -1
  %and408.i = and i64 %75, %not407.i
  %xor409.i = xor i64 %76, %and408.i
  %xor386.i = xor i64 %xor154.i, %xor261.i
  %77 = call i64 @llvm.fshl.i64(i64 %xor386.i, i64 %xor386.i, i64 10)
  %not404.i = xor i64 %76, -1
  %and405.i = and i64 %73, %not404.i
  %xor406.i = xor i64 %77, %and405.i
  %not401.i = xor i64 %77, -1
  %and402.i = and i64 %76, %not401.i
  %xor403.i = xor i64 %74, %and402.i
  %not398.i = xor i64 %74, -1
  %and399.i = and i64 %77, %not398.i
  %xor400.i = xor i64 %75, %and399.i
  %xor359.i = xor i64 %xor221.i, %xor257.i
  %78 = call i64 @llvm.fshl.i64(i64 %xor359.i, i64 %xor359.i, i64 18)
  %xor347.i = xor i64 %xor122.i, %xor265.i
  %79 = call i64 @llvm.fshl.i64(i64 %xor347.i, i64 %xor347.i, i64 6)
  %xor343.i = xor i64 %xor84.i, %xor261.i
  %80 = call i64 @llvm.fshl.i64(i64 %xor343.i, i64 %xor343.i, i64 1)
  %not375.i = xor i64 %80, -1
  %and376.i = and i64 %79, %not375.i
  %xor377.i = xor i64 %78, %and376.i
  %xor355.i = xor i64 %xor198.i, %xor273.i
  %81 = call i64 @llvm.fshl.i64(i64 %xor355.i, i64 %xor355.i, i64 8)
  %not372.i = xor i64 %78, -1
  %and373.i = and i64 %80, %not372.i
  %xor374.i = xor i64 %81, %and373.i
  %xor351.i = xor i64 %xor160.i, %xor269.i
  %82 = call i64 @llvm.fshl.i64(i64 %xor351.i, i64 %xor351.i, i64 25)
  %not369.i = xor i64 %81, -1
  %and370.i = and i64 %78, %not369.i
  %xor371.i = xor i64 %82, %and370.i
  %not366.i = xor i64 %82, -1
  %and367.i = and i64 %81, %not366.i
  %xor368.i = xor i64 %79, %and367.i
  %not363.i = xor i64 %79, -1
  %and364.i = and i64 %82, %not363.i
  %xor365.i = xor i64 %80, %and364.i
  %xor324.i = xor i64 %xor227.i, %xor265.i
  %83 = call i64 @llvm.fshl.i64(i64 %xor324.i, i64 %xor324.i, i64 61)
  %xor312.i = xor i64 %xor128.i, %xor273.i
  %84 = call i64 @llvm.fshl.i64(i64 %xor312.i, i64 %xor312.i, i64 20)
  %xor308.i = xor i64 %xor90.i, %xor269.i
  %85 = call i64 @llvm.fshl.i64(i64 %xor308.i, i64 %xor308.i, i64 28)
  %not340.i = xor i64 %85, -1
  %and341.i = and i64 %84, %not340.i
  %xor342.i = xor i64 %83, %and341.i
  %xor320.i = xor i64 %xor189.i, %xor261.i
  %86 = call i64 @llvm.fshl.i64(i64 %xor320.i, i64 %xor320.i, i64 45)
  %not337.i = xor i64 %83, -1
  %and338.i = and i64 %85, %not337.i
  %xor339.i = xor i64 %86, %and338.i
  %xor316.i = xor i64 %xor151.i, %xor257.i
  %87 = call i64 @llvm.fshl.i64(i64 %xor316.i, i64 %xor316.i, i64 3)
  %not334.i = xor i64 %86, -1
  %and335.i = and i64 %83, %not334.i
  %xor336.i = xor i64 %87, %and335.i
  %not331.i = xor i64 %87, -1
  %and332.i = and i64 %86, %not331.i
  %xor333.i = xor i64 %84, %and332.i
  %not328.i = xor i64 %84, -1
  %and329.i = and i64 %87, %not328.i
  %xor330.i = xor i64 %85, %and329.i
  %xor287.i = xor i64 %xor233.i, %xor273.i
  %88 = call i64 @llvm.fshl.i64(i64 %xor287.i, i64 %xor287.i, i64 14)
  %xor275.i = xor i64 %xor119.i, %xor261.i
  %89 = call i64 @llvm.fshl.i64(i64 %xor275.i, i64 %xor275.i, i64 44)
  %xor274.i = xor i64 %xor81.i, %xor257.i
  %not305.i = xor i64 %xor274.i, -1
  %and306.i = and i64 %89, %not305.i
  %xor307.i = xor i64 %88, %and306.i
  %xor283.i = xor i64 %xor195.i, %xor269.i
  %90 = call i64 @llvm.fshl.i64(i64 %xor283.i, i64 %xor283.i, i64 21)
  %not302.i = xor i64 %88, -1
  %and303.i = and i64 %xor274.i, %not302.i
  %xor304.i = xor i64 %90, %and303.i
  %xor279.i = xor i64 %xor157.i, %xor265.i
  %91 = call i64 @llvm.fshl.i64(i64 %xor279.i, i64 %xor279.i, i64 43)
  %not299.i = xor i64 %90, -1
  %and300.i = and i64 %88, %not299.i
  %xor301.i = xor i64 %91, %and300.i
  %not296.i = xor i64 %91, -1
  %and297.i = and i64 %90, %not296.i
  %xor298.i = xor i64 %89, %and297.i
  %add.i = or disjoint i32 %round.0.i1954, 1
  %arrayidx294.i = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %add.i
  %92 = load i64, ptr %arrayidx294.i, align 8
  %not291.i = xor i64 %89, -1
  %and292.i = and i64 %91, %not291.i
  %93 = xor i64 %and292.i, %92
  %xor295.i = xor i64 %93, %xor274.i
  %add448.i = add nuw nsw i32 %round.0.i1954, 2
  %cmp.i110 = icmp samesign ult i32 %add448.i, 24
  br i1 %cmp.i110, label %for.inc.i, label %KeccakF1600_StatePermute.exit, !llvm.loop !12

KeccakF1600_StatePermute.exit:                    ; preds = %for.inc.i
  %Aso.0.i.lcssa = phi i64 [ %xor444.i, %for.inc.i ]
  %Asi.0.i.lcssa = phi i64 [ %xor441.i, %for.inc.i ]
  %Ase.0.i.lcssa = phi i64 [ %xor438.i, %for.inc.i ]
  %Asa.0.i.lcssa = phi i64 [ %xor435.i, %for.inc.i ]
  %Amu.0.i.lcssa = phi i64 [ %xor412.i, %for.inc.i ]
  %Amo.0.i.lcssa = phi i64 [ %xor409.i, %for.inc.i ]
  %Ami.0.i.lcssa = phi i64 [ %xor406.i, %for.inc.i ]
  %Ame.0.i.lcssa = phi i64 [ %xor403.i, %for.inc.i ]
  %Ama.0.i.lcssa = phi i64 [ %xor400.i, %for.inc.i ]
  %Aku.0.i.lcssa = phi i64 [ %xor377.i, %for.inc.i ]
  %Ako.0.i.lcssa = phi i64 [ %xor374.i, %for.inc.i ]
  %Aki.0.i.lcssa = phi i64 [ %xor371.i, %for.inc.i ]
  %Ake.0.i.lcssa = phi i64 [ %xor368.i, %for.inc.i ]
  %Aka.0.i.lcssa = phi i64 [ %xor365.i, %for.inc.i ]
  %Agu.0.i.lcssa = phi i64 [ %xor342.i, %for.inc.i ]
  %Ago.0.i.lcssa = phi i64 [ %xor339.i, %for.inc.i ]
  %Agi.0.i.lcssa = phi i64 [ %xor336.i, %for.inc.i ]
  %Age.0.i.lcssa = phi i64 [ %xor333.i, %for.inc.i ]
  %Aga.0.i.lcssa = phi i64 [ %xor330.i, %for.inc.i ]
  %Abu.0.i.lcssa = phi i64 [ %xor307.i, %for.inc.i ]
  %Abo.0.i.lcssa = phi i64 [ %xor304.i, %for.inc.i ]
  %Abi.0.i.lcssa = phi i64 [ %xor301.i, %for.inc.i ]
  %Abe.0.i.lcssa = phi i64 [ %xor298.i, %for.inc.i ]
  %Aba.0.i.lcssa = phi i64 [ %xor295.i, %for.inc.i ]
  %Asu.0.i.lcssa = phi i64 [ %xor447.i, %for.inc.i ]
  store i64 %Aba.0.i.lcssa, ptr %6, align 8
  %arrayidx450.i = getelementptr inbounds nuw i8, ptr %6, i32 8
  store i64 %Abe.0.i.lcssa, ptr %arrayidx450.i, align 8
  %arrayidx451.i = getelementptr inbounds nuw i8, ptr %6, i32 16
  store i64 %Abi.0.i.lcssa, ptr %arrayidx451.i, align 8
  %arrayidx452.i = getelementptr inbounds nuw i8, ptr %6, i32 24
  store i64 %Abo.0.i.lcssa, ptr %arrayidx452.i, align 8
  %arrayidx453.i = getelementptr inbounds nuw i8, ptr %6, i32 32
  store i64 %Abu.0.i.lcssa, ptr %arrayidx453.i, align 8
  %arrayidx454.i = getelementptr inbounds nuw i8, ptr %6, i32 40
  store i64 %Aga.0.i.lcssa, ptr %arrayidx454.i, align 8
  %arrayidx455.i = getelementptr inbounds nuw i8, ptr %6, i32 48
  store i64 %Age.0.i.lcssa, ptr %arrayidx455.i, align 8
  %arrayidx456.i = getelementptr inbounds nuw i8, ptr %6, i32 56
  store i64 %Agi.0.i.lcssa, ptr %arrayidx456.i, align 8
  %arrayidx457.i = getelementptr inbounds nuw i8, ptr %6, i32 64
  store i64 %Ago.0.i.lcssa, ptr %arrayidx457.i, align 8
  %arrayidx458.i = getelementptr inbounds nuw i8, ptr %6, i32 72
  store i64 %Agu.0.i.lcssa, ptr %arrayidx458.i, align 8
  %arrayidx459.i = getelementptr inbounds nuw i8, ptr %6, i32 80
  store i64 %Aka.0.i.lcssa, ptr %arrayidx459.i, align 8
  %arrayidx460.i = getelementptr inbounds nuw i8, ptr %6, i32 88
  store i64 %Ake.0.i.lcssa, ptr %arrayidx460.i, align 8
  %arrayidx461.i = getelementptr inbounds nuw i8, ptr %6, i32 96
  store i64 %Aki.0.i.lcssa, ptr %arrayidx461.i, align 8
  %arrayidx462.i = getelementptr inbounds nuw i8, ptr %6, i32 104
  store i64 %Ako.0.i.lcssa, ptr %arrayidx462.i, align 8
  %arrayidx463.i = getelementptr inbounds nuw i8, ptr %6, i32 112
  store i64 %Aku.0.i.lcssa, ptr %arrayidx463.i, align 8
  %arrayidx464.i = getelementptr inbounds nuw i8, ptr %6, i32 120
  store i64 %Ama.0.i.lcssa, ptr %arrayidx464.i, align 8
  %arrayidx465.i = getelementptr inbounds nuw i8, ptr %6, i32 128
  store i64 %Ame.0.i.lcssa, ptr %arrayidx465.i, align 8
  %arrayidx466.i = getelementptr inbounds nuw i8, ptr %6, i32 136
  store i64 %Ami.0.i.lcssa, ptr %arrayidx466.i, align 8
  %arrayidx467.i = getelementptr inbounds nuw i8, ptr %6, i32 144
  store i64 %Amo.0.i.lcssa, ptr %arrayidx467.i, align 8
  %arrayidx468.i = getelementptr inbounds nuw i8, ptr %6, i32 152
  store i64 %Amu.0.i.lcssa, ptr %arrayidx468.i, align 8
  %arrayidx469.i = getelementptr inbounds nuw i8, ptr %6, i32 160
  store i64 %Asa.0.i.lcssa, ptr %arrayidx469.i, align 8
  %arrayidx470.i = getelementptr inbounds nuw i8, ptr %6, i32 168
  store i64 %Ase.0.i.lcssa, ptr %arrayidx470.i, align 8
  %arrayidx471.i = getelementptr inbounds nuw i8, ptr %6, i32 176
  store i64 %Asi.0.i.lcssa, ptr %arrayidx471.i, align 8
  %arrayidx472.i = getelementptr inbounds nuw i8, ptr %6, i32 184
  store i64 %Aso.0.i.lcssa, ptr %arrayidx472.i, align 8
  %arrayidx473.i = getelementptr inbounds nuw i8, ptr %6, i32 192
  store i64 %Asu.0.i.lcssa, ptr %arrayidx473.i, align 8
  br label %for.body.i.i37

for.body.i.i37:                                   ; preds = %KeccakF1600_StatePermute.exit, %store64.exit.i.i
  %i.0.i.i341957 = phi i32 [ 0, %KeccakF1600_StatePermute.exit ], [ %inc.i.i40, %store64.exit.i.i ]
  %mul.i.i = shl nuw nsw i32 %i.0.i.i341957, 3
  %add.ptr.i.i38 = getelementptr inbounds nuw i8, ptr %h.addr.0.i.i1959, i32 %mul.i.i
  %arrayidx.i.i39 = getelementptr inbounds nuw i64, ptr %6, i32 %i.0.i.i341957
  %94 = load i64, ptr %arrayidx.i.i39, align 8
  br label %for.body.i.i.i

for.body.i.i.i:                                   ; preds = %for.body.i.i37, %for.body.i.i.i
  %i.0.i.i.i1956 = phi i32 [ 0, %for.body.i.i37 ], [ %inc.i.i.i, %for.body.i.i.i ]
  %mul.i.i.i = shl nuw nsw i32 %i.0.i.i.i1956, 3
  %sh_prom.i.i.i = zext nneg i32 %mul.i.i.i to i64
  %shr.i.i.i = lshr i64 %94, %sh_prom.i.i.i
  %conv.i.i.i = trunc i64 %shr.i.i.i to i8
  %arrayidx.i.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i.i38, i32 %i.0.i.i.i1956
  store i8 %conv.i.i.i, ptr %arrayidx.i.i.i, align 1
  %inc.i.i.i = add nuw nsw i32 %i.0.i.i.i1956, 1
  %exitcond.i.i.i.not = icmp eq i32 %inc.i.i.i, 8
  br i1 %exitcond.i.i.i.not, label %store64.exit.i.i, label %for.body.i.i.i, !llvm.loop !13

store64.exit.i.i:                                 ; preds = %for.body.i.i.i
  %inc.i.i40 = add nuw nsw i32 %i.0.i.i341957, 1
  %exitcond.i.i35.not = icmp eq i32 %inc.i.i40, 17
  br i1 %exitcond.i.i35.not, label %for.end.i.i, label %for.body.i.i37, !llvm.loop !14

for.end.i.i:                                      ; preds = %store64.exit.i.i
  %add.ptr2.i.i = getelementptr inbounds nuw i8, ptr %h.addr.0.i.i1959, i32 136
  %dec.i.i36 = add nsw i32 %nblocks.addr.0.i.i1958, -1
  %cmp.not.i.i31 = icmp eq i32 %dec.i.i36, 0
  br i1 %cmp.not.i.i31, label %keccak_squeezeblocks.exit.i, label %while.body.i.i32, !llvm.loop !15

keccak_squeezeblocks.exit.i:                      ; preds = %for.end.i.i
  %95 = load ptr, ptr %s.i, align 4
  br label %while.body.i5.i

for.cond.i43.preheader:                           ; preds = %for.end.i9.i
  %add.ptr.i41 = getelementptr inbounds nuw i8, ptr %S, i32 272
  br label %for.body.i47

while.body.i5.i:                                  ; preds = %keccak_squeezeblocks.exit.i
  %96 = load i64, ptr %95, align 8
  %arrayidx1.i114 = getelementptr inbounds nuw i8, ptr %95, i32 8
  %97 = load i64, ptr %arrayidx1.i114, align 8
  %arrayidx2.i115 = getelementptr inbounds nuw i8, ptr %95, i32 16
  %98 = load i64, ptr %arrayidx2.i115, align 8
  %arrayidx3.i116 = getelementptr inbounds nuw i8, ptr %95, i32 24
  %99 = load i64, ptr %arrayidx3.i116, align 8
  %arrayidx4.i117 = getelementptr inbounds nuw i8, ptr %95, i32 32
  %100 = load i64, ptr %arrayidx4.i117, align 8
  %arrayidx5.i118 = getelementptr inbounds nuw i8, ptr %95, i32 40
  %101 = load i64, ptr %arrayidx5.i118, align 8
  %arrayidx6.i119 = getelementptr inbounds nuw i8, ptr %95, i32 48
  %102 = load i64, ptr %arrayidx6.i119, align 8
  %arrayidx7.i120 = getelementptr inbounds nuw i8, ptr %95, i32 56
  %103 = load i64, ptr %arrayidx7.i120, align 8
  %arrayidx8.i121 = getelementptr inbounds nuw i8, ptr %95, i32 64
  %104 = load i64, ptr %arrayidx8.i121, align 8
  %arrayidx9.i122 = getelementptr inbounds nuw i8, ptr %95, i32 72
  %105 = load i64, ptr %arrayidx9.i122, align 8
  %arrayidx10.i123 = getelementptr inbounds nuw i8, ptr %95, i32 80
  %106 = load i64, ptr %arrayidx10.i123, align 8
  %arrayidx11.i124 = getelementptr inbounds nuw i8, ptr %95, i32 88
  %107 = load i64, ptr %arrayidx11.i124, align 8
  %arrayidx12.i125 = getelementptr inbounds nuw i8, ptr %95, i32 96
  %108 = load i64, ptr %arrayidx12.i125, align 8
  %arrayidx13.i126 = getelementptr inbounds nuw i8, ptr %95, i32 104
  %109 = load i64, ptr %arrayidx13.i126, align 8
  %arrayidx14.i127 = getelementptr inbounds nuw i8, ptr %95, i32 112
  %110 = load i64, ptr %arrayidx14.i127, align 8
  %arrayidx15.i128 = getelementptr inbounds nuw i8, ptr %95, i32 120
  %111 = load i64, ptr %arrayidx15.i128, align 8
  %arrayidx16.i129 = getelementptr inbounds nuw i8, ptr %95, i32 128
  %112 = load i64, ptr %arrayidx16.i129, align 8
  %arrayidx17.i130 = getelementptr inbounds nuw i8, ptr %95, i32 136
  %113 = load i64, ptr %arrayidx17.i130, align 8
  %arrayidx18.i131 = getelementptr inbounds nuw i8, ptr %95, i32 144
  %114 = load i64, ptr %arrayidx18.i131, align 8
  %arrayidx19.i132 = getelementptr inbounds nuw i8, ptr %95, i32 152
  %115 = load i64, ptr %arrayidx19.i132, align 8
  %arrayidx20.i133 = getelementptr inbounds nuw i8, ptr %95, i32 160
  %116 = load i64, ptr %arrayidx20.i133, align 8
  %arrayidx21.i134 = getelementptr inbounds nuw i8, ptr %95, i32 168
  %117 = load i64, ptr %arrayidx21.i134, align 8
  %arrayidx22.i135 = getelementptr inbounds nuw i8, ptr %95, i32 176
  %118 = load i64, ptr %arrayidx22.i135, align 8
  %arrayidx23.i136 = getelementptr inbounds nuw i8, ptr %95, i32 184
  %119 = load i64, ptr %arrayidx23.i136, align 8
  %arrayidx24.i137 = getelementptr inbounds nuw i8, ptr %95, i32 192
  %120 = load i64, ptr %arrayidx24.i137, align 8
  br label %for.inc.i190

for.inc.i190:                                     ; preds = %while.body.i5.i, %for.inc.i190
  %Asu.0.i1641985 = phi i64 [ %120, %while.body.i5.i ], [ %xor447.i345, %for.inc.i190 ]
  %round.0.i1631984 = phi i32 [ 0, %while.body.i5.i ], [ %add448.i444, %for.inc.i190 ]
  %Aba.0.i1621983 = phi i64 [ %96, %while.body.i5.i ], [ %xor295.i443, %for.inc.i190 ]
  %Abe.0.i1611982 = phi i64 [ %97, %while.body.i5.i ], [ %xor298.i438, %for.inc.i190 ]
  %Abi.0.i1601981 = phi i64 [ %98, %while.body.i5.i ], [ %xor301.i435, %for.inc.i190 ]
  %Abo.0.i1591980 = phi i64 [ %99, %while.body.i5.i ], [ %xor304.i431, %for.inc.i190 ]
  %Abu.0.i1581979 = phi i64 [ %100, %while.body.i5.i ], [ %xor307.i427, %for.inc.i190 ]
  %Aga.0.i1571978 = phi i64 [ %101, %while.body.i5.i ], [ %xor330.i421, %for.inc.i190 ]
  %Age.0.i1561977 = phi i64 [ %102, %while.body.i5.i ], [ %xor333.i418, %for.inc.i190 ]
  %Agi.0.i1551976 = phi i64 [ %103, %while.body.i5.i ], [ %xor336.i415, %for.inc.i190 ]
  %Ago.0.i1541975 = phi i64 [ %104, %while.body.i5.i ], [ %xor339.i411, %for.inc.i190 ]
  %Agu.0.i1531974 = phi i64 [ %105, %while.body.i5.i ], [ %xor342.i407, %for.inc.i190 ]
  %Aka.0.i1521973 = phi i64 [ %106, %while.body.i5.i ], [ %xor365.i401, %for.inc.i190 ]
  %Ake.0.i1511972 = phi i64 [ %107, %while.body.i5.i ], [ %xor368.i398, %for.inc.i190 ]
  %Aki.0.i1501971 = phi i64 [ %108, %while.body.i5.i ], [ %xor371.i395, %for.inc.i190 ]
  %Ako.0.i1491970 = phi i64 [ %109, %while.body.i5.i ], [ %xor374.i391, %for.inc.i190 ]
  %Aku.0.i1481969 = phi i64 [ %110, %while.body.i5.i ], [ %xor377.i387, %for.inc.i190 ]
  %Ama.0.i1471968 = phi i64 [ %111, %while.body.i5.i ], [ %xor400.i381, %for.inc.i190 ]
  %Ame.0.i1461967 = phi i64 [ %112, %while.body.i5.i ], [ %xor403.i378, %for.inc.i190 ]
  %Ami.0.i1451966 = phi i64 [ %113, %while.body.i5.i ], [ %xor406.i375, %for.inc.i190 ]
  %Amo.0.i1441965 = phi i64 [ %114, %while.body.i5.i ], [ %xor409.i371, %for.inc.i190 ]
  %Amu.0.i1431964 = phi i64 [ %115, %while.body.i5.i ], [ %xor412.i367, %for.inc.i190 ]
  %Asa.0.i1421963 = phi i64 [ %116, %while.body.i5.i ], [ %xor435.i361, %for.inc.i190 ]
  %Ase.0.i1411962 = phi i64 [ %117, %while.body.i5.i ], [ %xor438.i358, %for.inc.i190 ]
  %Asi.0.i1401961 = phi i64 [ %118, %while.body.i5.i ], [ %xor441.i355, %for.inc.i190 ]
  %Aso.0.i1391960 = phi i64 [ %119, %while.body.i5.i ], [ %xor444.i350, %for.inc.i190 ]
  %xor32.i191 = xor i64 %Abi.0.i1601981, %Agi.0.i1551976
  %xor33.i192 = xor i64 %xor32.i191, %Aki.0.i1501971
  %xor34.i193 = xor i64 %xor33.i192, %Ami.0.i1451966
  %xor35.i194 = xor i64 %xor34.i193, %Asi.0.i1401961
  %xor40.i195 = xor i64 %Abu.0.i1581979, %Agu.0.i1531974
  %xor41.i196 = xor i64 %xor40.i195, %Aku.0.i1481969
  %xor42.i197 = xor i64 %xor41.i196, %Amu.0.i1431964
  %xor43.i198 = xor i64 %xor42.i197, %Asu.0.i1641985
  %121 = call i64 @llvm.fshl.i64(i64 %xor43.i198, i64 %xor43.i198, i64 1)
  %xor57.i199 = xor i64 %xor35.i194, %121
  %xor203.i200 = xor i64 %Ago.0.i1541975, %xor57.i199
  %122 = call i64 @llvm.fshl.i64(i64 %xor203.i200, i64 %xor203.i200, i64 55)
  %xor28.i201 = xor i64 %Abe.0.i1611982, %Age.0.i1561977
  %xor29.i202 = xor i64 %xor28.i201, %Ake.0.i1511972
  %xor30.i203 = xor i64 %xor29.i202, %Ame.0.i1461967
  %xor31.i204 = xor i64 %xor30.i203, %Ase.0.i1411962
  %123 = call i64 @llvm.fshl.i64(i64 %xor31.i204, i64 %xor31.i204, i64 1)
  %xor45.i205 = xor i64 %xor43.i198, %123
  %xor211.i206 = xor i64 %Ama.0.i1471968, %xor45.i205
  %124 = call i64 @llvm.fshl.i64(i64 %xor211.i206, i64 %xor211.i206, i64 41)
  %xor36.i207 = xor i64 %Abo.0.i1591980, %Ago.0.i1541975
  %xor37.i208 = xor i64 %xor36.i207, %Ako.0.i1491970
  %xor38.i209 = xor i64 %xor37.i208, %Amo.0.i1441965
  %xor39.i210 = xor i64 %xor38.i209, %Aso.0.i1391960
  %xor.i211 = xor i64 %Aba.0.i1621983, %Aga.0.i1571978
  %xor25.i212 = xor i64 %xor.i211, %Aka.0.i1521973
  %xor26.i213 = xor i64 %xor25.i212, %Ama.0.i1471968
  %xor27.i214 = xor i64 %xor26.i213, %Asa.0.i1421963
  %125 = call i64 @llvm.fshl.i64(i64 %xor27.i214, i64 %xor27.i214, i64 1)
  %xor61.i215 = xor i64 %xor39.i210, %125
  %xor207.i216 = xor i64 %Aku.0.i1481969, %xor61.i215
  %126 = call i64 @llvm.fshl.i64(i64 %xor207.i216, i64 %xor207.i216, i64 39)
  %not222.i217 = xor i64 %126, -1
  %and223.i218 = and i64 %124, %not222.i217
  %xor224.i219 = xor i64 %122, %and223.i218
  %127 = call i64 @llvm.fshl.i64(i64 %xor39.i210, i64 %xor39.i210, i64 1)
  %xor53.i220 = xor i64 %xor31.i204, %127
  %xor67.i221 = xor i64 %Aki.0.i1501971, %xor53.i220
  %128 = call i64 @llvm.fshl.i64(i64 %xor67.i221, i64 %xor67.i221, i64 43)
  %129 = call i64 @llvm.fshl.i64(i64 %xor35.i194, i64 %xor35.i194, i64 1)
  %xor49.i222 = xor i64 %xor27.i214, %129
  %xor63.i223 = xor i64 %Age.0.i1561977, %xor49.i222
  %130 = call i64 @llvm.fshl.i64(i64 %xor63.i223, i64 %xor63.i223, i64 44)
  %not.i224 = xor i64 %130, -1
  %and.i225 = and i64 %128, %not.i224
  %arrayidx80.i226 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %round.0.i1631984
  %131 = load i64, ptr %arrayidx80.i226, align 8
  %132 = xor i64 %and.i225, %131
  %xor62.i227 = xor i64 %Aba.0.i1621983, %xor45.i205
  %xor81.i228 = xor i64 %132, %xor62.i227
  %xor94.i229 = xor i64 %Abo.0.i1591980, %xor57.i199
  %133 = call i64 @llvm.fshl.i64(i64 %xor94.i229, i64 %xor94.i229, i64 28)
  %xor102.i230 = xor i64 %Aka.0.i1521973, %xor45.i205
  %134 = call i64 @llvm.fshl.i64(i64 %xor102.i230, i64 %xor102.i230, i64 3)
  %xor98.i231 = xor i64 %Agu.0.i1531974, %xor61.i215
  %135 = call i64 @llvm.fshl.i64(i64 %xor98.i231, i64 %xor98.i231, i64 20)
  %not114.i232 = xor i64 %135, -1
  %and115.i233 = and i64 %134, %not114.i232
  %xor116.i234 = xor i64 %133, %and115.i233
  %xor234.i235 = xor i64 %xor81.i228, %xor116.i234
  %xor129.i236 = xor i64 %Abe.0.i1611982, %xor49.i222
  %136 = call i64 @llvm.fshl.i64(i64 %xor129.i236, i64 %xor129.i236, i64 1)
  %xor137.i237 = xor i64 %Ako.0.i1491970, %xor57.i199
  %137 = call i64 @llvm.fshl.i64(i64 %xor137.i237, i64 %xor137.i237, i64 25)
  %xor133.i238 = xor i64 %Agi.0.i1551976, %xor53.i220
  %138 = call i64 @llvm.fshl.i64(i64 %xor133.i238, i64 %xor133.i238, i64 6)
  %not149.i239 = xor i64 %138, -1
  %and150.i240 = and i64 %137, %not149.i239
  %xor151.i241 = xor i64 %136, %and150.i240
  %xor235.i242 = xor i64 %xor234.i235, %xor151.i241
  %xor164.i243 = xor i64 %Abu.0.i1581979, %xor61.i215
  %139 = call i64 @llvm.fshl.i64(i64 %xor164.i243, i64 %xor164.i243, i64 27)
  %xor172.i244 = xor i64 %Ake.0.i1511972, %xor49.i222
  %140 = call i64 @llvm.fshl.i64(i64 %xor172.i244, i64 %xor172.i244, i64 10)
  %xor168.i245 = xor i64 %Aga.0.i1571978, %xor45.i205
  %141 = call i64 @llvm.fshl.i64(i64 %xor168.i245, i64 %xor168.i245, i64 36)
  %not184.i246 = xor i64 %141, -1
  %and185.i247 = and i64 %140, %not184.i246
  %xor186.i248 = xor i64 %139, %and185.i247
  %xor236.i249 = xor i64 %xor235.i242, %xor186.i248
  %xor199.i250 = xor i64 %Abi.0.i1601981, %xor53.i220
  %142 = call i64 @llvm.fshl.i64(i64 %xor199.i250, i64 %xor199.i250, i64 62)
  %not219.i251 = xor i64 %122, -1
  %and220.i252 = and i64 %126, %not219.i251
  %xor221.i253 = xor i64 %142, %and220.i252
  %xor237.i254 = xor i64 %xor236.i249, %xor221.i253
  %xor75.i255 = xor i64 %Asu.0.i1641985, %xor61.i215
  %143 = call i64 @llvm.fshl.i64(i64 %xor75.i255, i64 %xor75.i255, i64 14)
  %xor71.i256 = xor i64 %Amo.0.i1441965, %xor57.i199
  %144 = call i64 @llvm.fshl.i64(i64 %xor71.i256, i64 %xor71.i256, i64 21)
  %not85.i257 = xor i64 %144, -1
  %and86.i258 = and i64 %143, %not85.i257
  %xor87.i259 = xor i64 %128, %and86.i258
  %xor110.i260 = xor i64 %Asi.0.i1401961, %xor53.i220
  %145 = call i64 @llvm.fshl.i64(i64 %xor110.i260, i64 %xor110.i260, i64 61)
  %xor106.i261 = xor i64 %Ame.0.i1461967, %xor49.i222
  %146 = call i64 @llvm.fshl.i64(i64 %xor106.i261, i64 %xor106.i261, i64 45)
  %not120.i262 = xor i64 %146, -1
  %and121.i263 = and i64 %145, %not120.i262
  %xor122.i264 = xor i64 %134, %and121.i263
  %xor242.i265 = xor i64 %xor87.i259, %xor122.i264
  %xor145.i266 = xor i64 %Asa.0.i1421963, %xor45.i205
  %147 = call i64 @llvm.fshl.i64(i64 %xor145.i266, i64 %xor145.i266, i64 18)
  %xor141.i267 = xor i64 %Amu.0.i1431964, %xor61.i215
  %148 = call i64 @llvm.fshl.i64(i64 %xor141.i267, i64 %xor141.i267, i64 8)
  %not155.i268 = xor i64 %148, -1
  %and156.i269 = and i64 %147, %not155.i268
  %xor157.i270 = xor i64 %137, %and156.i269
  %xor243.i271 = xor i64 %xor242.i265, %xor157.i270
  %xor180.i272 = xor i64 %Aso.0.i1391960, %xor57.i199
  %149 = call i64 @llvm.fshl.i64(i64 %xor180.i272, i64 %xor180.i272, i64 56)
  %xor176.i273 = xor i64 %Ami.0.i1451966, %xor53.i220
  %150 = call i64 @llvm.fshl.i64(i64 %xor176.i273, i64 %xor176.i273, i64 15)
  %not190.i274 = xor i64 %150, -1
  %and191.i275 = and i64 %149, %not190.i274
  %xor192.i276 = xor i64 %140, %and191.i275
  %xor244.i277 = xor i64 %xor243.i271, %xor192.i276
  %xor215.i278 = xor i64 %Ase.0.i1411962, %xor49.i222
  %151 = call i64 @llvm.fshl.i64(i64 %xor215.i278, i64 %xor215.i278, i64 2)
  %not225.i279 = xor i64 %124, -1
  %and226.i280 = and i64 %151, %not225.i279
  %xor227.i281 = xor i64 %126, %and226.i280
  %xor245.i282 = xor i64 %xor244.i277, %xor227.i281
  %152 = call i64 @llvm.fshl.i64(i64 %xor245.i282, i64 %xor245.i282, i64 1)
  %xor261.i283 = xor i64 %xor237.i254, %152
  %xor429.i284 = xor i64 %xor224.i219, %xor261.i283
  %153 = call i64 @llvm.fshl.i64(i64 %xor429.i284, i64 %xor429.i284, i64 2)
  %not123.i285 = xor i64 %145, -1
  %and124.i286 = and i64 %133, %not123.i285
  %xor125.i287 = xor i64 %146, %and124.i286
  %not91.i288 = xor i64 %xor62.i227, -1
  %and92.i289 = and i64 %130, %not91.i288
  %xor93.i290 = xor i64 %143, %and92.i289
  %not126.i291 = xor i64 %133, -1
  %and127.i292 = and i64 %135, %not126.i291
  %xor128.i293 = xor i64 %145, %and127.i292
  %xor250.i294 = xor i64 %xor93.i290, %xor128.i293
  %not161.i295 = xor i64 %136, -1
  %and162.i296 = and i64 %138, %not161.i295
  %xor163.i297 = xor i64 %147, %and162.i296
  %xor251.i298 = xor i64 %xor250.i294, %xor163.i297
  %not196.i299 = xor i64 %139, -1
  %and197.i300 = and i64 %141, %not196.i299
  %xor198.i301 = xor i64 %149, %and197.i300
  %xor252.i302 = xor i64 %xor251.i298, %xor198.i301
  %not231.i303 = xor i64 %142, -1
  %and232.i304 = and i64 %122, %not231.i303
  %xor233.i305 = xor i64 %151, %and232.i304
  %xor253.i306 = xor i64 %xor252.i302, %xor233.i305
  %154 = call i64 @llvm.fshl.i64(i64 %xor253.i306, i64 %xor253.i306, i64 1)
  %xor269.i307 = xor i64 %xor245.i282, %154
  %xor417.i308 = xor i64 %xor125.i287, %xor269.i307
  %155 = call i64 @llvm.fshl.i64(i64 %xor417.i308, i64 %xor417.i308, i64 55)
  %not82.i309 = xor i64 %128, -1
  %and83.i310 = and i64 %144, %not82.i309
  %xor84.i311 = xor i64 %130, %and83.i310
  %not117.i312 = xor i64 %134, -1
  %and118.i313 = and i64 %146, %not117.i312
  %xor119.i314 = xor i64 %135, %and118.i313
  %xor238.i315 = xor i64 %xor84.i311, %xor119.i314
  %not152.i316 = xor i64 %137, -1
  %and153.i317 = and i64 %148, %not152.i316
  %xor154.i318 = xor i64 %138, %and153.i317
  %xor239.i319 = xor i64 %xor238.i315, %xor154.i318
  %not187.i320 = xor i64 %140, -1
  %and188.i321 = and i64 %150, %not187.i320
  %xor189.i322 = xor i64 %141, %and188.i321
  %xor240.i323 = xor i64 %xor239.i319, %xor189.i322
  %xor241.i324 = xor i64 %xor240.i323, %xor224.i219
  %not88.i325 = xor i64 %143, -1
  %and89.i326 = and i64 %xor62.i227, %not88.i325
  %xor90.i327 = xor i64 %144, %and89.i326
  %xor246.i328 = xor i64 %xor90.i327, %xor125.i287
  %not158.i329 = xor i64 %147, -1
  %and159.i330 = and i64 %136, %not158.i329
  %xor160.i331 = xor i64 %148, %and159.i330
  %xor247.i332 = xor i64 %xor246.i328, %xor160.i331
  %not193.i333 = xor i64 %149, -1
  %and194.i334 = and i64 %139, %not193.i333
  %xor195.i335 = xor i64 %150, %and194.i334
  %xor248.i336 = xor i64 %xor247.i332, %xor195.i335
  %not228.i337 = xor i64 %151, -1
  %and229.i338 = and i64 %142, %not228.i337
  %xor230.i339 = xor i64 %124, %and229.i338
  %xor249.i340 = xor i64 %xor248.i336, %xor230.i339
  %156 = call i64 @llvm.fshl.i64(i64 %xor249.i340, i64 %xor249.i340, i64 1)
  %xor265.i341 = xor i64 %xor241.i324, %156
  %xor413.i342 = xor i64 %xor87.i259, %xor265.i341
  %157 = call i64 @llvm.fshl.i64(i64 %xor413.i342, i64 %xor413.i342, i64 62)
  %not445.i343 = xor i64 %157, -1
  %and446.i344 = and i64 %155, %not445.i343
  %xor447.i345 = xor i64 %153, %and446.i344
  %158 = call i64 @llvm.fshl.i64(i64 %xor241.i324, i64 %xor241.i324, i64 1)
  %xor257.i346 = xor i64 %xor253.i306, %158
  %xor425.i347 = xor i64 %xor186.i248, %xor257.i346
  %159 = call i64 @llvm.fshl.i64(i64 %xor425.i347, i64 %xor425.i347, i64 41)
  %not442.i348 = xor i64 %153, -1
  %and443.i349 = and i64 %157, %not442.i348
  %xor444.i350 = xor i64 %159, %and443.i349
  %160 = call i64 @llvm.fshl.i64(i64 %xor237.i254, i64 %xor237.i254, i64 1)
  %xor273.i351 = xor i64 %xor249.i340, %160
  %xor421.i352 = xor i64 %xor163.i297, %xor273.i351
  %161 = call i64 @llvm.fshl.i64(i64 %xor421.i352, i64 %xor421.i352, i64 39)
  %not439.i353 = xor i64 %159, -1
  %and440.i354 = and i64 %153, %not439.i353
  %xor441.i355 = xor i64 %161, %and440.i354
  %not436.i356 = xor i64 %161, -1
  %and437.i357 = and i64 %159, %not436.i356
  %xor438.i358 = xor i64 %155, %and437.i357
  %not433.i359 = xor i64 %155, -1
  %and434.i360 = and i64 %161, %not433.i359
  %xor435.i361 = xor i64 %157, %and434.i360
  %xor394.i362 = xor i64 %xor230.i339, %xor269.i307
  %162 = call i64 @llvm.fshl.i64(i64 %xor394.i362, i64 %xor394.i362, i64 56)
  %xor382.i363 = xor i64 %xor116.i234, %xor257.i346
  %163 = call i64 @llvm.fshl.i64(i64 %xor382.i363, i64 %xor382.i363, i64 36)
  %xor378.i364 = xor i64 %xor93.i290, %xor273.i351
  %164 = call i64 @llvm.fshl.i64(i64 %xor378.i364, i64 %xor378.i364, i64 27)
  %not410.i365 = xor i64 %164, -1
  %and411.i366 = and i64 %163, %not410.i365
  %xor412.i367 = xor i64 %162, %and411.i366
  %xor390.i368 = xor i64 %xor192.i276, %xor265.i341
  %165 = call i64 @llvm.fshl.i64(i64 %xor390.i368, i64 %xor390.i368, i64 15)
  %not407.i369 = xor i64 %162, -1
  %and408.i370 = and i64 %164, %not407.i369
  %xor409.i371 = xor i64 %165, %and408.i370
  %xor386.i372 = xor i64 %xor154.i318, %xor261.i283
  %166 = call i64 @llvm.fshl.i64(i64 %xor386.i372, i64 %xor386.i372, i64 10)
  %not404.i373 = xor i64 %165, -1
  %and405.i374 = and i64 %162, %not404.i373
  %xor406.i375 = xor i64 %166, %and405.i374
  %not401.i376 = xor i64 %166, -1
  %and402.i377 = and i64 %165, %not401.i376
  %xor403.i378 = xor i64 %163, %and402.i377
  %not398.i379 = xor i64 %163, -1
  %and399.i380 = and i64 %166, %not398.i379
  %xor400.i381 = xor i64 %164, %and399.i380
  %xor359.i382 = xor i64 %xor221.i253, %xor257.i346
  %167 = call i64 @llvm.fshl.i64(i64 %xor359.i382, i64 %xor359.i382, i64 18)
  %xor347.i383 = xor i64 %xor122.i264, %xor265.i341
  %168 = call i64 @llvm.fshl.i64(i64 %xor347.i383, i64 %xor347.i383, i64 6)
  %xor343.i384 = xor i64 %xor84.i311, %xor261.i283
  %169 = call i64 @llvm.fshl.i64(i64 %xor343.i384, i64 %xor343.i384, i64 1)
  %not375.i385 = xor i64 %169, -1
  %and376.i386 = and i64 %168, %not375.i385
  %xor377.i387 = xor i64 %167, %and376.i386
  %xor355.i388 = xor i64 %xor198.i301, %xor273.i351
  %170 = call i64 @llvm.fshl.i64(i64 %xor355.i388, i64 %xor355.i388, i64 8)
  %not372.i389 = xor i64 %167, -1
  %and373.i390 = and i64 %169, %not372.i389
  %xor374.i391 = xor i64 %170, %and373.i390
  %xor351.i392 = xor i64 %xor160.i331, %xor269.i307
  %171 = call i64 @llvm.fshl.i64(i64 %xor351.i392, i64 %xor351.i392, i64 25)
  %not369.i393 = xor i64 %170, -1
  %and370.i394 = and i64 %167, %not369.i393
  %xor371.i395 = xor i64 %171, %and370.i394
  %not366.i396 = xor i64 %171, -1
  %and367.i397 = and i64 %170, %not366.i396
  %xor368.i398 = xor i64 %168, %and367.i397
  %not363.i399 = xor i64 %168, -1
  %and364.i400 = and i64 %171, %not363.i399
  %xor365.i401 = xor i64 %169, %and364.i400
  %xor324.i402 = xor i64 %xor227.i281, %xor265.i341
  %172 = call i64 @llvm.fshl.i64(i64 %xor324.i402, i64 %xor324.i402, i64 61)
  %xor312.i403 = xor i64 %xor128.i293, %xor273.i351
  %173 = call i64 @llvm.fshl.i64(i64 %xor312.i403, i64 %xor312.i403, i64 20)
  %xor308.i404 = xor i64 %xor90.i327, %xor269.i307
  %174 = call i64 @llvm.fshl.i64(i64 %xor308.i404, i64 %xor308.i404, i64 28)
  %not340.i405 = xor i64 %174, -1
  %and341.i406 = and i64 %173, %not340.i405
  %xor342.i407 = xor i64 %172, %and341.i406
  %xor320.i408 = xor i64 %xor189.i322, %xor261.i283
  %175 = call i64 @llvm.fshl.i64(i64 %xor320.i408, i64 %xor320.i408, i64 45)
  %not337.i409 = xor i64 %172, -1
  %and338.i410 = and i64 %174, %not337.i409
  %xor339.i411 = xor i64 %175, %and338.i410
  %xor316.i412 = xor i64 %xor151.i241, %xor257.i346
  %176 = call i64 @llvm.fshl.i64(i64 %xor316.i412, i64 %xor316.i412, i64 3)
  %not334.i413 = xor i64 %175, -1
  %and335.i414 = and i64 %172, %not334.i413
  %xor336.i415 = xor i64 %176, %and335.i414
  %not331.i416 = xor i64 %176, -1
  %and332.i417 = and i64 %175, %not331.i416
  %xor333.i418 = xor i64 %173, %and332.i417
  %not328.i419 = xor i64 %173, -1
  %and329.i420 = and i64 %176, %not328.i419
  %xor330.i421 = xor i64 %174, %and329.i420
  %xor287.i422 = xor i64 %xor233.i305, %xor273.i351
  %177 = call i64 @llvm.fshl.i64(i64 %xor287.i422, i64 %xor287.i422, i64 14)
  %xor275.i423 = xor i64 %xor119.i314, %xor261.i283
  %178 = call i64 @llvm.fshl.i64(i64 %xor275.i423, i64 %xor275.i423, i64 44)
  %xor274.i424 = xor i64 %xor81.i228, %xor257.i346
  %not305.i425 = xor i64 %xor274.i424, -1
  %and306.i426 = and i64 %178, %not305.i425
  %xor307.i427 = xor i64 %177, %and306.i426
  %xor283.i428 = xor i64 %xor195.i335, %xor269.i307
  %179 = call i64 @llvm.fshl.i64(i64 %xor283.i428, i64 %xor283.i428, i64 21)
  %not302.i429 = xor i64 %177, -1
  %and303.i430 = and i64 %xor274.i424, %not302.i429
  %xor304.i431 = xor i64 %179, %and303.i430
  %xor279.i432 = xor i64 %xor157.i270, %xor265.i341
  %180 = call i64 @llvm.fshl.i64(i64 %xor279.i432, i64 %xor279.i432, i64 43)
  %not299.i433 = xor i64 %179, -1
  %and300.i434 = and i64 %177, %not299.i433
  %xor301.i435 = xor i64 %180, %and300.i434
  %not296.i436 = xor i64 %180, -1
  %and297.i437 = and i64 %179, %not296.i436
  %xor298.i438 = xor i64 %178, %and297.i437
  %add.i439 = or disjoint i32 %round.0.i1631984, 1
  %arrayidx294.i440 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %add.i439
  %181 = load i64, ptr %arrayidx294.i440, align 8
  %not291.i441 = xor i64 %178, -1
  %and292.i442 = and i64 %180, %not291.i441
  %182 = xor i64 %and292.i442, %181
  %xor295.i443 = xor i64 %182, %xor274.i424
  %add448.i444 = add nuw nsw i32 %round.0.i1631984, 2
  %cmp.i165 = icmp samesign ult i32 %add448.i444, 24
  br i1 %cmp.i165, label %for.inc.i190, label %KeccakF1600_StatePermute.exit445, !llvm.loop !16

KeccakF1600_StatePermute.exit445:                 ; preds = %for.inc.i190
  %Aso.0.i139.lcssa = phi i64 [ %xor444.i350, %for.inc.i190 ]
  %Asi.0.i140.lcssa = phi i64 [ %xor441.i355, %for.inc.i190 ]
  %Ase.0.i141.lcssa = phi i64 [ %xor438.i358, %for.inc.i190 ]
  %Asa.0.i142.lcssa = phi i64 [ %xor435.i361, %for.inc.i190 ]
  %Amu.0.i143.lcssa = phi i64 [ %xor412.i367, %for.inc.i190 ]
  %Amo.0.i144.lcssa = phi i64 [ %xor409.i371, %for.inc.i190 ]
  %Ami.0.i145.lcssa = phi i64 [ %xor406.i375, %for.inc.i190 ]
  %Ame.0.i146.lcssa = phi i64 [ %xor403.i378, %for.inc.i190 ]
  %Ama.0.i147.lcssa = phi i64 [ %xor400.i381, %for.inc.i190 ]
  %Aku.0.i148.lcssa = phi i64 [ %xor377.i387, %for.inc.i190 ]
  %Ako.0.i149.lcssa = phi i64 [ %xor374.i391, %for.inc.i190 ]
  %Aki.0.i150.lcssa = phi i64 [ %xor371.i395, %for.inc.i190 ]
  %Ake.0.i151.lcssa = phi i64 [ %xor368.i398, %for.inc.i190 ]
  %Aka.0.i152.lcssa = phi i64 [ %xor365.i401, %for.inc.i190 ]
  %Agu.0.i153.lcssa = phi i64 [ %xor342.i407, %for.inc.i190 ]
  %Ago.0.i154.lcssa = phi i64 [ %xor339.i411, %for.inc.i190 ]
  %Agi.0.i155.lcssa = phi i64 [ %xor336.i415, %for.inc.i190 ]
  %Age.0.i156.lcssa = phi i64 [ %xor333.i418, %for.inc.i190 ]
  %Aga.0.i157.lcssa = phi i64 [ %xor330.i421, %for.inc.i190 ]
  %Abu.0.i158.lcssa = phi i64 [ %xor307.i427, %for.inc.i190 ]
  %Abo.0.i159.lcssa = phi i64 [ %xor304.i431, %for.inc.i190 ]
  %Abi.0.i160.lcssa = phi i64 [ %xor301.i435, %for.inc.i190 ]
  %Abe.0.i161.lcssa = phi i64 [ %xor298.i438, %for.inc.i190 ]
  %Aba.0.i162.lcssa = phi i64 [ %xor295.i443, %for.inc.i190 ]
  %Asu.0.i164.lcssa = phi i64 [ %xor447.i345, %for.inc.i190 ]
  store i64 %Aba.0.i162.lcssa, ptr %95, align 8
  %arrayidx450.i166 = getelementptr inbounds nuw i8, ptr %95, i32 8
  store i64 %Abe.0.i161.lcssa, ptr %arrayidx450.i166, align 8
  %arrayidx451.i167 = getelementptr inbounds nuw i8, ptr %95, i32 16
  store i64 %Abi.0.i160.lcssa, ptr %arrayidx451.i167, align 8
  %arrayidx452.i168 = getelementptr inbounds nuw i8, ptr %95, i32 24
  store i64 %Abo.0.i159.lcssa, ptr %arrayidx452.i168, align 8
  %arrayidx453.i169 = getelementptr inbounds nuw i8, ptr %95, i32 32
  store i64 %Abu.0.i158.lcssa, ptr %arrayidx453.i169, align 8
  %arrayidx454.i170 = getelementptr inbounds nuw i8, ptr %95, i32 40
  store i64 %Aga.0.i157.lcssa, ptr %arrayidx454.i170, align 8
  %arrayidx455.i171 = getelementptr inbounds nuw i8, ptr %95, i32 48
  store i64 %Age.0.i156.lcssa, ptr %arrayidx455.i171, align 8
  %arrayidx456.i172 = getelementptr inbounds nuw i8, ptr %95, i32 56
  store i64 %Agi.0.i155.lcssa, ptr %arrayidx456.i172, align 8
  %arrayidx457.i173 = getelementptr inbounds nuw i8, ptr %95, i32 64
  store i64 %Ago.0.i154.lcssa, ptr %arrayidx457.i173, align 8
  %arrayidx458.i174 = getelementptr inbounds nuw i8, ptr %95, i32 72
  store i64 %Agu.0.i153.lcssa, ptr %arrayidx458.i174, align 8
  %arrayidx459.i175 = getelementptr inbounds nuw i8, ptr %95, i32 80
  store i64 %Aka.0.i152.lcssa, ptr %arrayidx459.i175, align 8
  %arrayidx460.i176 = getelementptr inbounds nuw i8, ptr %95, i32 88
  store i64 %Ake.0.i151.lcssa, ptr %arrayidx460.i176, align 8
  %arrayidx461.i177 = getelementptr inbounds nuw i8, ptr %95, i32 96
  store i64 %Aki.0.i150.lcssa, ptr %arrayidx461.i177, align 8
  %arrayidx462.i178 = getelementptr inbounds nuw i8, ptr %95, i32 104
  store i64 %Ako.0.i149.lcssa, ptr %arrayidx462.i178, align 8
  %arrayidx463.i179 = getelementptr inbounds nuw i8, ptr %95, i32 112
  store i64 %Aku.0.i148.lcssa, ptr %arrayidx463.i179, align 8
  %arrayidx464.i180 = getelementptr inbounds nuw i8, ptr %95, i32 120
  store i64 %Ama.0.i147.lcssa, ptr %arrayidx464.i180, align 8
  %arrayidx465.i181 = getelementptr inbounds nuw i8, ptr %95, i32 128
  store i64 %Ame.0.i146.lcssa, ptr %arrayidx465.i181, align 8
  %arrayidx466.i182 = getelementptr inbounds nuw i8, ptr %95, i32 136
  store i64 %Ami.0.i145.lcssa, ptr %arrayidx466.i182, align 8
  %arrayidx467.i183 = getelementptr inbounds nuw i8, ptr %95, i32 144
  store i64 %Amo.0.i144.lcssa, ptr %arrayidx467.i183, align 8
  %arrayidx468.i184 = getelementptr inbounds nuw i8, ptr %95, i32 152
  store i64 %Amu.0.i143.lcssa, ptr %arrayidx468.i184, align 8
  %arrayidx469.i185 = getelementptr inbounds nuw i8, ptr %95, i32 160
  store i64 %Asa.0.i142.lcssa, ptr %arrayidx469.i185, align 8
  %arrayidx470.i186 = getelementptr inbounds nuw i8, ptr %95, i32 168
  store i64 %Ase.0.i141.lcssa, ptr %arrayidx470.i186, align 8
  %arrayidx471.i187 = getelementptr inbounds nuw i8, ptr %95, i32 176
  store i64 %Asi.0.i140.lcssa, ptr %arrayidx471.i187, align 8
  %arrayidx472.i188 = getelementptr inbounds nuw i8, ptr %95, i32 184
  store i64 %Aso.0.i139.lcssa, ptr %arrayidx472.i188, align 8
  %arrayidx473.i189 = getelementptr inbounds nuw i8, ptr %95, i32 192
  store i64 %Asu.0.i164.lcssa, ptr %arrayidx473.i189, align 8
  br label %for.body.i12.i

for.body.i12.i:                                   ; preds = %KeccakF1600_StatePermute.exit445, %store64.exit.i19.i
  %i.0.i7.i1987 = phi i32 [ 0, %KeccakF1600_StatePermute.exit445 ], [ %inc.i20.i, %store64.exit.i19.i ]
  %mul.i13.i = shl nuw nsw i32 %i.0.i7.i1987, 3
  %add.ptr.i14.i = getelementptr inbounds nuw i8, ptr %t.i, i32 %mul.i13.i
  %arrayidx.i15.i = getelementptr inbounds nuw i64, ptr %95, i32 %i.0.i7.i1987
  %183 = load i64, ptr %arrayidx.i15.i, align 8
  br label %for.body.i.i21.i

for.body.i.i21.i:                                 ; preds = %for.body.i12.i, %for.body.i.i21.i
  %i.0.i.i17.i1986 = phi i32 [ 0, %for.body.i12.i ], [ %inc.i.i27.i, %for.body.i.i21.i ]
  %mul.i.i22.i = shl nuw nsw i32 %i.0.i.i17.i1986, 3
  %sh_prom.i.i23.i = zext nneg i32 %mul.i.i22.i to i64
  %shr.i.i24.i = lshr i64 %183, %sh_prom.i.i23.i
  %conv.i.i25.i = trunc i64 %shr.i.i24.i to i8
  %arrayidx.i.i26.i = getelementptr inbounds nuw i8, ptr %add.ptr.i14.i, i32 %i.0.i.i17.i1986
  store i8 %conv.i.i25.i, ptr %arrayidx.i.i26.i, align 1
  %inc.i.i27.i = add nuw nsw i32 %i.0.i.i17.i1986, 1
  %exitcond.i.i18.i.not = icmp eq i32 %inc.i.i27.i, 8
  br i1 %exitcond.i.i18.i.not, label %store64.exit.i19.i, label %for.body.i.i21.i, !llvm.loop !17

store64.exit.i19.i:                               ; preds = %for.body.i.i21.i
  %inc.i20.i = add nuw nsw i32 %i.0.i7.i1987, 1
  %exitcond.i8.i.not = icmp eq i32 %inc.i20.i, 17
  br i1 %exitcond.i8.i.not, label %for.end.i9.i, label %for.body.i12.i, !llvm.loop !18

for.end.i9.i:                                     ; preds = %store64.exit.i19.i
  br label %for.cond.i43.preheader

for.body.i47:                                     ; preds = %for.cond.i43.preheader, %for.body.i47
  %i.0.i441990 = phi i32 [ 0, %for.cond.i43.preheader ], [ %inc.i50, %for.body.i47 ]
  %arrayidx.i48 = getelementptr inbounds nuw [136 x i8], ptr %t.i, i32 0, i32 %i.0.i441990
  %184 = load i8, ptr %arrayidx.i48, align 1
  %arrayidx2.i49 = getelementptr inbounds nuw i8, ptr %add.ptr.i41, i32 %i.0.i441990
  store i8 %184, ptr %arrayidx2.i49, align 1
  %inc.i50 = add nuw nsw i32 %i.0.i441990, 1
  %exitcond.i45.not = icmp eq i32 %inc.i50, 56
  br i1 %exitcond.i45.not, label %shake256.exit, label %for.body.i47, !llvm.loop !19

shake256.exit:                                    ; preds = %for.body.i47
  %185 = load ptr, ptr %s.i, align 4
  call void @free(ptr noundef %185) #8
  call void @llvm.lifetime.end.p0(i64 136, ptr nonnull %t.i)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %s.i)
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %S, i32 16
  br label %for.body.i10

for.body.i10:                                     ; preds = %shake256.exit, %for.body.i10
  %i.0.i81992 = phi i32 [ 0, %shake256.exit ], [ %inc.i12, %for.body.i10 ]
  %mdec.addr.0.i1991 = phi ptr [ %add.ptr1, %shake256.exit ], [ %incdec.ptr5.i, %for.body.i10 ]
  %arrayidx.i11 = getelementptr inbounds nuw i8, ptr %add.ptr4, i32 %i.0.i81992
  %186 = load i8, ptr %arrayidx.i11, align 1
  %187 = and i8 %186, 15
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i1991, i32 1
  store i8 %187, ptr %mdec.addr.0.i1991, align 1
  %188 = lshr i8 %186, 4
  store i8 %188, ptr %incdec.ptr.i, align 1
  %incdec.ptr5.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i1991, i32 2
  %inc.i12 = add nuw nsw i32 %i.0.i81992, 1
  %exitcond = icmp ne i32 %inc.i12, 312
  br i1 %exitcond, label %for.body.i10, label %decode.exit, !llvm.loop !20

decode.exit:                                      ; preds = %for.body.i10
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %ctx.i)
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %iv.i)
  br label %for.body.i

for.body.i:                                       ; preds = %decode.exit, %for.body.i
  %i.0.i1993 = phi i32 [ 0, %decode.exit ], [ %inc.i, %for.body.i ]
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %iv.i, i32 %i.0.i1993
  store i8 0, ptr %arrayidx.i, align 1
  %inc.i = add nuw nsw i32 %i.0.i1993, 1
  %exitcond.i.not = icmp eq i32 %inc.i, 16
  br i1 %exitcond.i.not, label %mayo_memset.exit, label %for.body.i, !llvm.loop !21

mayo_memset.exit:                                 ; preds = %for.body.i
  call void @llvm.lifetime.start.p0(i64 176, ptr nonnull %skey.i)
  %call.i = call dereferenceable_or_null(704) ptr @malloc(i32 noundef 704) #7
  store ptr %call.i, ptr %ctx.i, align 4
  %cmp.i = icmp eq ptr %call.i, null
  br i1 %cmp.i, label %if.then.i, label %aes128_ecb_keyexp.exit

if.then.i:                                        ; preds = %mayo_memset.exit
  call void @exit(i32 noundef 111) #8
  br label %aes128_ecb_keyexp.exit

aes128_ecb_keyexp.exit:                           ; preds = %mayo_memset.exit, %if.then.i
  call void @llvm.lifetime.start.p0(i64 240, ptr nonnull %skey.i1621)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %q.i1622)
  br label %while.body.i.i1628

while.body.i.i1628:                               ; preds = %aes128_ecb_keyexp.exit, %while.body.i.i1628
  %v.addr.0.i.i16261996 = phi ptr [ %skey.i1621, %aes128_ecb_keyexp.exit ], [ %incdec.ptr.i.i1642, %while.body.i.i1628 ]
  %num.addr.0.i.i16251995 = phi i32 [ 4, %aes128_ecb_keyexp.exit ], [ %dec.i.i1629, %while.body.i.i1628 ]
  %src.addr.0.i.i16241994 = phi ptr [ %S, %aes128_ecb_keyexp.exit ], [ %add.ptr.i.i1643, %while.body.i.i1628 ]
  %dec.i.i1629 = add nsw i32 %num.addr.0.i.i16251995, -1
  %189 = load i8, ptr %src.addr.0.i.i16241994, align 1
  %conv.i6.i = zext i8 %189 to i32
  %arrayidx1.i.i1630 = getelementptr inbounds nuw i8, ptr %src.addr.0.i.i16241994, i32 1
  %190 = load i8, ptr %arrayidx1.i.i1630, align 1
  %conv2.i.i1631 = zext i8 %190 to i32
  %shl.i.i1632 = shl nuw nsw i32 %conv2.i.i1631, 8
  %or.i.i1633 = or disjoint i32 %shl.i.i1632, %conv.i6.i
  %arrayidx3.i.i1634 = getelementptr inbounds nuw i8, ptr %src.addr.0.i.i16241994, i32 2
  %191 = load i8, ptr %arrayidx3.i.i1634, align 1
  %conv4.i.i1635 = zext i8 %191 to i32
  %shl5.i.i1636 = shl nuw nsw i32 %conv4.i.i1635, 16
  %or6.i.i1637 = or disjoint i32 %or.i.i1633, %shl5.i.i1636
  %arrayidx7.i.i1638 = getelementptr inbounds nuw i8, ptr %src.addr.0.i.i16241994, i32 3
  %192 = load i8, ptr %arrayidx7.i.i1638, align 1
  %conv8.i.i1639 = zext i8 %192 to i32
  %shl9.i.i1640 = shl nuw i32 %conv8.i.i1639, 24
  %or10.i.i1641 = or disjoint i32 %or6.i.i1637, %shl9.i.i1640
  %incdec.ptr.i.i1642 = getelementptr inbounds nuw i8, ptr %v.addr.0.i.i16261996, i32 4
  store i32 %or10.i.i1641, ptr %v.addr.0.i.i16261996, align 4
  %add.ptr.i.i1643 = getelementptr inbounds nuw i8, ptr %src.addr.0.i.i16241994, i32 4
  %cmp.not.i.i1627 = icmp eq i32 %dec.i.i1629, 0
  br i1 %cmp.not.i.i1627, label %br_range_dec32le.exit.i1644, label %while.body.i.i1628, !llvm.loop !22

br_range_dec32le.exit.i1644:                      ; preds = %while.body.i.i1628
  %arrayidx.i1645 = getelementptr inbounds nuw i8, ptr %skey.i1621, i32 12
  %193 = load i32, ptr %arrayidx.i1645, align 4
  br label %for.body.i1678

for.cond27.i.preheader:                           ; preds = %if.end16.i
  br label %for.body30.i

for.body.i1678:                                   ; preds = %br_range_dec32le.exit.i1644, %if.end16.i
  %tmp.0.i2000 = phi i32 [ %193, %br_range_dec32le.exit.i1644 ], [ %xor19.i, %if.end16.i ]
  %k.0.i16481999 = phi i32 [ 0, %br_range_dec32le.exit.i1644 ], [ %spec.select1.i, %if.end16.i ]
  %j.0.i1998 = phi i32 [ 0, %br_range_dec32le.exit.i1644 ], [ %spec.select.i, %if.end16.i ]
  %i.0.i16471997 = phi i32 [ 4, %br_range_dec32le.exit.i1644 ], [ %inc26.i, %if.end16.i ]
  %cmp6.i = icmp eq i32 %j.0.i1998, 0
  br i1 %cmp6.i, label %if.then.i1799, label %if.end16.i

if.then.i1799:                                    ; preds = %for.body.i1678
  %194 = call i32 @llvm.fshl.i32(i32 %tmp.0.i2000, i32 %tmp.0.i2000, i32 24)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %q.i1.i)
  %call.i2.i = call ptr @memset(ptr noundef nonnull %q.i1.i, i32 noundef 0, i32 noundef 64) #8
  %conv.i3.i = zext i32 %194 to i64
  store i64 %conv.i3.i, ptr %q.i1.i, align 8
  %arrayidx1.i431.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  %195 = load i64, ptr %arrayidx1.i431.i, align 8
  %and.i432.i = and i64 %conv.i3.i, 1431655765
  %and2.i433.i = shl i64 %195, 1
  %shl.i434.i = and i64 %and2.i433.i, -6148914691236517206
  %or.i435.i = or disjoint i64 %and.i432.i, %shl.i434.i
  store i64 %or.i435.i, ptr %q.i1.i, align 8
  %and4.i436.i = lshr i64 %conv.i3.i, 1
  %shr.i437.i = and i64 %and4.i436.i, 1431655765
  %and5.i438.i = and i64 %195, -6148914691236517206
  %or6.i439.i = or disjoint i64 %shr.i437.i, %and5.i438.i
  %arrayidx7.i440.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  store i64 %or6.i439.i, ptr %arrayidx7.i440.i, align 8
  %arrayidx11.i441.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  %196 = load i64, ptr %arrayidx11.i441.i, align 8
  %arrayidx12.i442.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  %197 = load i64, ptr %arrayidx12.i442.i, align 8
  %and13.i443.i = and i64 %196, 6148914691236517205
  %and14.i444.i = shl i64 %197, 1
  %shl15.i445.i = and i64 %and14.i444.i, -6148914691236517206
  %or16.i446.i = or disjoint i64 %and13.i443.i, %shl15.i445.i
  %arrayidx17.i447.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  store i64 %or16.i446.i, ptr %arrayidx17.i447.i, align 8
  %and18.i448.i = lshr i64 %196, 1
  %shr19.i449.i = and i64 %and18.i448.i, 6148914691236517205
  %and20.i450.i = and i64 %197, -6148914691236517206
  %or21.i451.i = or disjoint i64 %shr19.i449.i, %and20.i450.i
  %arrayidx22.i452.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  store i64 %or21.i451.i, ptr %arrayidx22.i452.i, align 8
  %arrayidx27.i453.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  %198 = load i64, ptr %arrayidx27.i453.i, align 8
  %arrayidx28.i454.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  %199 = load i64, ptr %arrayidx28.i454.i, align 8
  %and29.i455.i = and i64 %198, 6148914691236517205
  %and30.i456.i = shl i64 %199, 1
  %shl31.i457.i = and i64 %and30.i456.i, -6148914691236517206
  %or32.i458.i = or disjoint i64 %and29.i455.i, %shl31.i457.i
  %arrayidx33.i459.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  store i64 %or32.i458.i, ptr %arrayidx33.i459.i, align 8
  %and34.i460.i = lshr i64 %198, 1
  %shr35.i461.i = and i64 %and34.i460.i, 6148914691236517205
  %and36.i462.i = and i64 %199, -6148914691236517206
  %or37.i463.i = or disjoint i64 %shr35.i461.i, %and36.i462.i
  %arrayidx38.i464.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  store i64 %or37.i463.i, ptr %arrayidx38.i464.i, align 8
  %arrayidx43.i465.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  %200 = load i64, ptr %arrayidx43.i465.i, align 8
  %arrayidx44.i466.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  %201 = load i64, ptr %arrayidx44.i466.i, align 8
  %and45.i467.i = and i64 %200, 6148914691236517205
  %and46.i468.i = shl i64 %201, 1
  %shl47.i469.i = and i64 %and46.i468.i, -6148914691236517206
  %or48.i470.i = or disjoint i64 %and45.i467.i, %shl47.i469.i
  %arrayidx49.i471.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  store i64 %or48.i470.i, ptr %arrayidx49.i471.i, align 8
  %and50.i472.i = lshr i64 %200, 1
  %shr51.i473.i = and i64 %and50.i472.i, 6148914691236517205
  %and52.i474.i = and i64 %201, -6148914691236517206
  %or53.i475.i = or disjoint i64 %shr51.i473.i, %and52.i474.i
  %arrayidx54.i476.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  store i64 %or53.i475.i, ptr %arrayidx54.i476.i, align 8
  %202 = load i64, ptr %q.i1.i, align 8
  %arrayidx60.i477.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  %203 = load i64, ptr %arrayidx60.i477.i, align 8
  %and61.i478.i = and i64 %202, 3689348814741910323
  %and62.i479.i = shl i64 %203, 2
  %shl63.i480.i = and i64 %and62.i479.i, -3689348814741910324
  %or64.i481.i = or disjoint i64 %and61.i478.i, %shl63.i480.i
  store i64 %or64.i481.i, ptr %q.i1.i, align 8
  %and66.i482.i = lshr i64 %202, 2
  %shr67.i483.i = and i64 %and66.i482.i, 3689348814741910323
  %and68.i484.i = and i64 %203, -3689348814741910324
  %or69.i485.i = or disjoint i64 %shr67.i483.i, %and68.i484.i
  %arrayidx70.i486.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  store i64 %or69.i485.i, ptr %arrayidx70.i486.i, align 8
  %arrayidx75.i487.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  %204 = load i64, ptr %arrayidx75.i487.i, align 8
  %arrayidx76.i488.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  %205 = load i64, ptr %arrayidx76.i488.i, align 8
  %and77.i489.i = and i64 %204, 3689348814741910323
  %and78.i490.i = shl i64 %205, 2
  %shl79.i491.i = and i64 %and78.i490.i, -3689348814741910324
  %or80.i492.i = or disjoint i64 %and77.i489.i, %shl79.i491.i
  %arrayidx81.i493.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  store i64 %or80.i492.i, ptr %arrayidx81.i493.i, align 8
  %and82.i494.i = lshr i64 %204, 2
  %shr83.i495.i = and i64 %and82.i494.i, 3689348814741910323
  %and84.i496.i = and i64 %205, -3689348814741910324
  %or85.i497.i = or disjoint i64 %shr83.i495.i, %and84.i496.i
  %arrayidx86.i498.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  store i64 %or85.i497.i, ptr %arrayidx86.i498.i, align 8
  %arrayidx91.i499.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  %206 = load i64, ptr %arrayidx91.i499.i, align 8
  %arrayidx92.i500.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  %207 = load i64, ptr %arrayidx92.i500.i, align 8
  %and93.i501.i = and i64 %206, 3689348814741910323
  %and94.i502.i = shl i64 %207, 2
  %shl95.i503.i = and i64 %and94.i502.i, -3689348814741910324
  %or96.i504.i = or disjoint i64 %and93.i501.i, %shl95.i503.i
  %arrayidx97.i505.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  store i64 %or96.i504.i, ptr %arrayidx97.i505.i, align 8
  %and98.i506.i = lshr i64 %206, 2
  %shr99.i507.i = and i64 %and98.i506.i, 3689348814741910323
  %and100.i508.i = and i64 %207, -3689348814741910324
  %or101.i509.i = or disjoint i64 %shr99.i507.i, %and100.i508.i
  %arrayidx102.i510.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  store i64 %or101.i509.i, ptr %arrayidx102.i510.i, align 8
  %arrayidx107.i511.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  %208 = load i64, ptr %arrayidx107.i511.i, align 8
  %arrayidx108.i512.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  %209 = load i64, ptr %arrayidx108.i512.i, align 8
  %and109.i513.i = and i64 %208, 3689348814741910323
  %and110.i514.i = shl i64 %209, 2
  %shl111.i515.i = and i64 %and110.i514.i, -3689348814741910324
  %or112.i516.i = or disjoint i64 %and109.i513.i, %shl111.i515.i
  %arrayidx113.i517.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  store i64 %or112.i516.i, ptr %arrayidx113.i517.i, align 8
  %and114.i518.i = lshr i64 %208, 2
  %shr115.i519.i = and i64 %and114.i518.i, 3689348814741910323
  %and116.i520.i = and i64 %209, -3689348814741910324
  %or117.i521.i = or disjoint i64 %shr115.i519.i, %and116.i520.i
  %arrayidx118.i522.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  store i64 %or117.i521.i, ptr %arrayidx118.i522.i, align 8
  %210 = load i64, ptr %q.i1.i, align 8
  %arrayidx124.i523.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  %211 = load i64, ptr %arrayidx124.i523.i, align 8
  %and125.i524.i = and i64 %210, 1085102592571150095
  %and126.i525.i = shl i64 %211, 4
  %shl127.i526.i = and i64 %and126.i525.i, -1085102592571150096
  %or128.i527.i = or disjoint i64 %and125.i524.i, %shl127.i526.i
  store i64 %or128.i527.i, ptr %q.i1.i, align 8
  %and130.i528.i = lshr i64 %210, 4
  %shr131.i529.i = and i64 %and130.i528.i, 1085102592571150095
  %and132.i530.i = and i64 %211, -1085102592571150096
  %or133.i531.i = or disjoint i64 %shr131.i529.i, %and132.i530.i
  %arrayidx134.i532.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  store i64 %or133.i531.i, ptr %arrayidx134.i532.i, align 8
  %arrayidx139.i533.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  %212 = load i64, ptr %arrayidx139.i533.i, align 8
  %arrayidx140.i534.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  %213 = load i64, ptr %arrayidx140.i534.i, align 8
  %and141.i535.i = and i64 %212, 1085102592571150095
  %and142.i536.i = shl i64 %213, 4
  %shl143.i537.i = and i64 %and142.i536.i, -1085102592571150096
  %or144.i538.i = or disjoint i64 %and141.i535.i, %shl143.i537.i
  %arrayidx145.i539.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  store i64 %or144.i538.i, ptr %arrayidx145.i539.i, align 8
  %and146.i540.i = lshr i64 %212, 4
  %shr147.i541.i = and i64 %and146.i540.i, 1085102592571150095
  %and148.i542.i = and i64 %213, -1085102592571150096
  %or149.i543.i = or disjoint i64 %shr147.i541.i, %and148.i542.i
  %arrayidx150.i544.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  store i64 %or149.i543.i, ptr %arrayidx150.i544.i, align 8
  %arrayidx155.i545.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  %214 = load i64, ptr %arrayidx155.i545.i, align 8
  %arrayidx156.i546.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  %215 = load i64, ptr %arrayidx156.i546.i, align 8
  %and157.i547.i = and i64 %214, 1085102592571150095
  %and158.i548.i = shl i64 %215, 4
  %shl159.i549.i = and i64 %and158.i548.i, -1085102592571150096
  %or160.i550.i = or disjoint i64 %and157.i547.i, %shl159.i549.i
  %arrayidx161.i551.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  store i64 %or160.i550.i, ptr %arrayidx161.i551.i, align 8
  %and162.i552.i = lshr i64 %214, 4
  %shr163.i553.i = and i64 %and162.i552.i, 1085102592571150095
  %and164.i554.i = and i64 %215, -1085102592571150096
  %or165.i555.i = or disjoint i64 %shr163.i553.i, %and164.i554.i
  %arrayidx166.i556.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  store i64 %or165.i555.i, ptr %arrayidx166.i556.i, align 8
  %arrayidx171.i557.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  %216 = load i64, ptr %arrayidx171.i557.i, align 8
  %arrayidx172.i558.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  %217 = load i64, ptr %arrayidx172.i558.i, align 8
  %and173.i559.i = and i64 %216, 1085102592571150095
  %and174.i560.i = shl i64 %217, 4
  %shl175.i561.i = and i64 %and174.i560.i, -1085102592571150096
  %or176.i562.i = or disjoint i64 %and173.i559.i, %shl175.i561.i
  %arrayidx177.i563.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  store i64 %or176.i562.i, ptr %arrayidx177.i563.i, align 8
  %and178.i564.i = lshr i64 %216, 4
  %shr179.i565.i = and i64 %and178.i564.i, 1085102592571150095
  %and180.i566.i = and i64 %217, -1085102592571150096
  %or181.i567.i = or disjoint i64 %shr179.i565.i, %and180.i566.i
  %arrayidx182.i568.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  store i64 %or181.i567.i, ptr %arrayidx182.i568.i, align 8
  %arrayidx1.i21.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  %218 = load i64, ptr %arrayidx1.i21.i, align 8
  %arrayidx2.i22.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  %219 = load i64, ptr %arrayidx2.i22.i, align 8
  %arrayidx3.i23.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  %220 = load i64, ptr %arrayidx3.i23.i, align 8
  %arrayidx4.i24.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  %221 = load i64, ptr %arrayidx4.i24.i, align 8
  %arrayidx5.i25.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  %222 = load i64, ptr %arrayidx5.i25.i, align 8
  %arrayidx6.i26.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  %223 = load i64, ptr %arrayidx6.i26.i, align 8
  %224 = load i64, ptr %q.i1.i, align 8
  %xor.i27.i = xor i64 %220, %222
  %xor8.i28.i = xor i64 %or181.i567.i, %223
  %xor9.i29.i = xor i64 %or181.i567.i, %220
  %xor10.i30.i = xor i64 %or181.i567.i, %222
  %xor11.i31.i = xor i64 %218, %219
  %xor12.i32.i = xor i64 %xor11.i31.i, %224
  %xor13.i33.i = xor i64 %xor12.i32.i, %220
  %xor14.i34.i = xor i64 %xor8.i28.i, %xor.i27.i
  %xor15.i35.i = xor i64 %xor12.i32.i, %or181.i567.i
  %xor16.i36.i = xor i64 %xor12.i32.i, %223
  %xor17.i37.i = xor i64 %xor16.i36.i, %xor10.i30.i
  %xor18.i38.i = xor i64 %221, %xor14.i34.i
  %xor19.i39.i = xor i64 %xor18.i38.i, %222
  %xor20.i40.i = xor i64 %xor18.i38.i, %218
  %xor21.i41.i = xor i64 %xor19.i39.i, %224
  %xor22.i42.i = xor i64 %xor19.i39.i, %xor11.i31.i
  %xor23.i43.i = xor i64 %xor20.i40.i, %xor9.i29.i
  %xor24.i44.i = xor i64 %224, %xor23.i43.i
  %xor25.i45.i = xor i64 %xor22.i42.i, %xor23.i43.i
  %xor27.i46.i = xor i64 %xor11.i31.i, %xor23.i43.i
  %and.i47.i = and i64 %xor14.i34.i, %xor19.i39.i
  %and30.i48.i = and i64 %xor17.i37.i, %xor21.i41.i
  %xor31.i49.i = xor i64 %and30.i48.i, %and.i47.i
  %and32.i50.i = and i64 %xor13.i33.i, %224
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
  %225 = xor i64 %xor10.i30.i, %and32.i50.i
  %226 = xor i64 %225, %xor22.i42.i
  %227 = xor i64 %226, %and.i47.i
  %xor49.i61.i = xor i64 %227, %xor43.i58.i
  %228 = xor i64 %xor27.i46.i, %and35.i52.i
  %229 = xor i64 %228, %xor8.i28.i
  %230 = xor i64 %229, %and34.i51.i
  %xor50.i62.i = xor i64 %230, %xor41.i56.i
  %231 = xor i64 %xor27.i46.i, %and37.i53.i
  %232 = xor i64 %231, %or181.i567.i
  %233 = xor i64 %232, %and34.i51.i
  %xor51.i63.i = xor i64 %233, %xor43.i58.i
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
  %and75.i87.i = and i64 %xor60.i72.i, %224
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
  %234 = xor i64 %xor107.i119.i, %xor101.i113.i
  %xor113.i125.i = xor i64 %234, -1
  %235 = xor i64 %xor105.i117.i, %xor93.i105.i
  %xor115.i126.i = xor i64 %235, -1
  %xor117.i127.i = xor i64 %xor98.i110.i, %xor111.i123.i
  %xor118.i128.i = xor i64 %xor96.i108.i, %xor111.i123.i
  %xor119.i129.i = xor i64 %xor92.i104.i, %xor110.i122.i
  %236 = xor i64 %xor117.i127.i, %xor109.i121.i
  %xor121.i130.i = xor i64 %236, -1
  %237 = xor i64 %xor110.i122.i, %xor100.i112.i
  %238 = xor i64 %237, %xor109.i121.i
  %xor123.i131.i = xor i64 %238, -1
  %arrayidx124.i132.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  store i64 %xor112.i124.i, ptr %arrayidx124.i132.i, align 8
  %arrayidx125.i133.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  store i64 %xor121.i130.i, ptr %arrayidx125.i133.i, align 8
  %arrayidx126.i134.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  store i64 %xor123.i131.i, ptr %arrayidx126.i134.i, align 8
  %arrayidx127.i135.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  store i64 %xor117.i127.i, ptr %arrayidx127.i135.i, align 8
  %arrayidx128.i136.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  store i64 %xor118.i128.i, ptr %arrayidx128.i136.i, align 8
  %arrayidx129.i137.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  store i64 %xor119.i129.i, ptr %arrayidx129.i137.i, align 8
  %arrayidx130.i138.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  store i64 %xor113.i125.i, ptr %arrayidx130.i138.i, align 8
  %and.i140.i = and i64 %xor115.i126.i, 6148914691236517205
  %and2.i.i1800 = shl i64 %xor113.i125.i, 1
  %shl.i141.i = and i64 %and2.i.i1800, -6148914691236517206
  %or.i142.i = or disjoint i64 %and.i140.i, %shl.i141.i
  store i64 %or.i142.i, ptr %q.i1.i, align 8
  %and4.i.i1801 = lshr i64 %xor115.i126.i, 1
  %shr.i.i1802 = and i64 %and4.i.i1801, 6148914691236517205
  %and5.i.i1803 = and i64 %xor113.i125.i, -6148914691236517206
  %or6.i143.i = or disjoint i64 %shr.i.i1802, %and5.i.i1803
  %arrayidx7.i144.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  store i64 %or6.i143.i, ptr %arrayidx7.i144.i, align 8
  %arrayidx11.i.i1804 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  %239 = load i64, ptr %arrayidx11.i.i1804, align 8
  %arrayidx12.i.i1805 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  %240 = load i64, ptr %arrayidx12.i.i1805, align 8
  %and13.i145.i = and i64 %239, 6148914691236517205
  %and14.i146.i = shl i64 %240, 1
  %shl15.i.i1806 = and i64 %and14.i146.i, -6148914691236517206
  %or16.i.i1807 = or disjoint i64 %and13.i145.i, %shl15.i.i1806
  %arrayidx17.i.i1808 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  store i64 %or16.i.i1807, ptr %arrayidx17.i.i1808, align 8
  %and18.i.i1809 = lshr i64 %239, 1
  %shr19.i.i1810 = and i64 %and18.i.i1809, 6148914691236517205
  %and20.i.i1811 = and i64 %240, -6148914691236517206
  %or21.i.i1812 = or disjoint i64 %shr19.i.i1810, %and20.i.i1811
  %arrayidx22.i.i1813 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  store i64 %or21.i.i1812, ptr %arrayidx22.i.i1813, align 8
  %arrayidx27.i.i1814 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  %241 = load i64, ptr %arrayidx27.i.i1814, align 8
  %arrayidx28.i.i1815 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  %242 = load i64, ptr %arrayidx28.i.i1815, align 8
  %and29.i.i1816 = and i64 %241, 6148914691236517205
  %and30.i147.i = shl i64 %242, 1
  %shl31.i.i1817 = and i64 %and30.i147.i, -6148914691236517206
  %or32.i.i1818 = or disjoint i64 %and29.i.i1816, %shl31.i.i1817
  %arrayidx33.i.i1819 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  store i64 %or32.i.i1818, ptr %arrayidx33.i.i1819, align 8
  %and34.i148.i = lshr i64 %241, 1
  %shr35.i.i1820 = and i64 %and34.i148.i, 6148914691236517205
  %and36.i.i1821 = and i64 %242, -6148914691236517206
  %or37.i.i1822 = or disjoint i64 %shr35.i.i1820, %and36.i.i1821
  %arrayidx38.i.i1823 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  store i64 %or37.i.i1822, ptr %arrayidx38.i.i1823, align 8
  %arrayidx43.i.i1824 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  %243 = load i64, ptr %arrayidx43.i.i1824, align 8
  %arrayidx44.i.i1825 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  %244 = load i64, ptr %arrayidx44.i.i1825, align 8
  %and45.i.i1826 = and i64 %243, 6148914691236517205
  %and46.i.i1827 = shl i64 %244, 1
  %shl47.i.i1828 = and i64 %and46.i.i1827, -6148914691236517206
  %or48.i.i1829 = or disjoint i64 %and45.i.i1826, %shl47.i.i1828
  %arrayidx49.i.i1830 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  store i64 %or48.i.i1829, ptr %arrayidx49.i.i1830, align 8
  %and50.i.i1831 = lshr i64 %243, 1
  %shr51.i.i1832 = and i64 %and50.i.i1831, 6148914691236517205
  %and52.i.i1833 = and i64 %244, -6148914691236517206
  %or53.i.i1834 = or disjoint i64 %shr51.i.i1832, %and52.i.i1833
  %arrayidx54.i.i1835 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  store i64 %or53.i.i1834, ptr %arrayidx54.i.i1835, align 8
  %245 = load i64, ptr %q.i1.i, align 8
  %arrayidx60.i.i1836 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  %246 = load i64, ptr %arrayidx60.i.i1836, align 8
  %and61.i.i1837 = and i64 %245, 3689348814741910323
  %and62.i.i1838 = shl i64 %246, 2
  %shl63.i.i1839 = and i64 %and62.i.i1838, -3689348814741910324
  %or64.i.i1840 = or disjoint i64 %and61.i.i1837, %shl63.i.i1839
  store i64 %or64.i.i1840, ptr %q.i1.i, align 8
  %and66.i149.i = lshr i64 %245, 2
  %shr67.i.i1841 = and i64 %and66.i149.i, 3689348814741910323
  %and68.i.i1842 = and i64 %246, -3689348814741910324
  %or69.i.i1843 = or disjoint i64 %shr67.i.i1841, %and68.i.i1842
  %arrayidx70.i.i1844 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  store i64 %or69.i.i1843, ptr %arrayidx70.i.i1844, align 8
  %arrayidx75.i.i1845 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  %247 = load i64, ptr %arrayidx75.i.i1845, align 8
  %arrayidx76.i.i1846 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  %248 = load i64, ptr %arrayidx76.i.i1846, align 8
  %and77.i150.i = and i64 %247, 3689348814741910323
  %and78.i151.i = shl i64 %248, 2
  %shl79.i.i1847 = and i64 %and78.i151.i, -3689348814741910324
  %or80.i.i1848 = or disjoint i64 %and77.i150.i, %shl79.i.i1847
  %arrayidx81.i.i1849 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  store i64 %or80.i.i1848, ptr %arrayidx81.i.i1849, align 8
  %and82.i152.i = lshr i64 %247, 2
  %shr83.i.i1850 = and i64 %and82.i152.i, 3689348814741910323
  %and84.i153.i = and i64 %248, -3689348814741910324
  %or85.i.i1851 = or disjoint i64 %shr83.i.i1850, %and84.i153.i
  %arrayidx86.i.i1852 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  store i64 %or85.i.i1851, ptr %arrayidx86.i.i1852, align 8
  %arrayidx91.i.i1853 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  %249 = load i64, ptr %arrayidx91.i.i1853, align 8
  %arrayidx92.i.i1854 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  %250 = load i64, ptr %arrayidx92.i.i1854, align 8
  %and93.i.i1855 = and i64 %249, 3689348814741910323
  %and94.i.i1856 = shl i64 %250, 2
  %shl95.i.i1857 = and i64 %and94.i.i1856, -3689348814741910324
  %or96.i.i1858 = or disjoint i64 %and93.i.i1855, %shl95.i.i1857
  %arrayidx97.i.i1859 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  store i64 %or96.i.i1858, ptr %arrayidx97.i.i1859, align 8
  %and98.i.i1860 = lshr i64 %249, 2
  %shr99.i.i1861 = and i64 %and98.i.i1860, 3689348814741910323
  %and100.i.i1862 = and i64 %250, -3689348814741910324
  %or101.i.i1863 = or disjoint i64 %shr99.i.i1861, %and100.i.i1862
  %arrayidx102.i.i1864 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  store i64 %or101.i.i1863, ptr %arrayidx102.i.i1864, align 8
  %arrayidx107.i.i1865 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  %251 = load i64, ptr %arrayidx107.i.i1865, align 8
  %arrayidx108.i.i1866 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  %252 = load i64, ptr %arrayidx108.i.i1866, align 8
  %and109.i.i1867 = and i64 %251, 3689348814741910323
  %and110.i.i1868 = shl i64 %252, 2
  %shl111.i.i1869 = and i64 %and110.i.i1868, -3689348814741910324
  %or112.i.i1870 = or disjoint i64 %and109.i.i1867, %shl111.i.i1869
  %arrayidx113.i.i1871 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  store i64 %or112.i.i1870, ptr %arrayidx113.i.i1871, align 8
  %and114.i.i1872 = lshr i64 %251, 2
  %shr115.i.i1873 = and i64 %and114.i.i1872, 3689348814741910323
  %and116.i.i1874 = and i64 %252, -3689348814741910324
  %or117.i.i1875 = or disjoint i64 %shr115.i.i1873, %and116.i.i1874
  %arrayidx118.i.i1876 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  store i64 %or117.i.i1875, ptr %arrayidx118.i.i1876, align 8
  %253 = load i64, ptr %q.i1.i, align 8
  %arrayidx124.i154.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  %254 = load i64, ptr %arrayidx124.i154.i, align 8
  %and125.i.i1877 = and i64 %253, 1085102592571150095
  %and126.i.i1878 = shl i64 %254, 4
  %shl127.i.i1879 = and i64 %and126.i.i1878, -1085102592571150096
  %or128.i.i1880 = or disjoint i64 %and125.i.i1877, %shl127.i.i1879
  store i64 %or128.i.i1880, ptr %q.i1.i, align 8
  %and130.i.i1881 = lshr i64 %253, 4
  %shr131.i.i1882 = and i64 %and130.i.i1881, 1085102592571150095
  %and132.i.i1883 = and i64 %254, -1085102592571150096
  %or133.i.i1884 = or disjoint i64 %shr131.i.i1882, %and132.i.i1883
  %arrayidx134.i.i1885 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  store i64 %or133.i.i1884, ptr %arrayidx134.i.i1885, align 8
  %arrayidx139.i.i1886 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  %255 = load i64, ptr %arrayidx139.i.i1886, align 8
  %arrayidx140.i.i1887 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  %256 = load i64, ptr %arrayidx140.i.i1887, align 8
  %and141.i.i1888 = and i64 %255, 1085102592571150095
  %and142.i.i1889 = shl i64 %256, 4
  %shl143.i.i1890 = and i64 %and142.i.i1889, -1085102592571150096
  %or144.i.i1891 = or disjoint i64 %and141.i.i1888, %shl143.i.i1890
  %arrayidx145.i.i1892 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  store i64 %or144.i.i1891, ptr %arrayidx145.i.i1892, align 8
  %and146.i.i1893 = lshr i64 %255, 4
  %shr147.i.i1894 = and i64 %and146.i.i1893, 1085102592571150095
  %and148.i.i1895 = and i64 %256, -1085102592571150096
  %or149.i.i1896 = or disjoint i64 %shr147.i.i1894, %and148.i.i1895
  %arrayidx150.i.i1897 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  store i64 %or149.i.i1896, ptr %arrayidx150.i.i1897, align 8
  %arrayidx155.i.i1898 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  %257 = load i64, ptr %arrayidx155.i.i1898, align 8
  %arrayidx156.i.i1899 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  %258 = load i64, ptr %arrayidx156.i.i1899, align 8
  %and157.i.i1900 = and i64 %257, 1085102592571150095
  %and158.i.i1901 = shl i64 %258, 4
  %shl159.i.i1902 = and i64 %and158.i.i1901, -1085102592571150096
  %or160.i.i1903 = or disjoint i64 %and157.i.i1900, %shl159.i.i1902
  %arrayidx161.i.i1904 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  store i64 %or160.i.i1903, ptr %arrayidx161.i.i1904, align 8
  %and162.i.i1905 = lshr i64 %257, 4
  %shr163.i.i1906 = and i64 %and162.i.i1905, 1085102592571150095
  %and164.i.i1907 = and i64 %258, -1085102592571150096
  %or165.i.i1908 = or disjoint i64 %shr163.i.i1906, %and164.i.i1907
  %arrayidx166.i.i1909 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  store i64 %or165.i.i1908, ptr %arrayidx166.i.i1909, align 8
  %arrayidx171.i.i1910 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  %259 = load i64, ptr %arrayidx171.i.i1910, align 8
  %arrayidx172.i.i1911 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  %260 = load i64, ptr %arrayidx172.i.i1911, align 8
  %and173.i.i1912 = and i64 %259, 1085102592571150095
  %and174.i.i1913 = shl i64 %260, 4
  %shl175.i.i1914 = and i64 %and174.i.i1913, -1085102592571150096
  %or176.i.i1915 = or disjoint i64 %and173.i.i1912, %shl175.i.i1914
  %arrayidx177.i.i1916 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  store i64 %or176.i.i1915, ptr %arrayidx177.i.i1916, align 8
  %and178.i.i1917 = lshr i64 %259, 4
  %shr179.i.i1918 = and i64 %and178.i.i1917, 1085102592571150095
  %and180.i.i1919 = and i64 %260, -1085102592571150096
  %or181.i.i1920 = or disjoint i64 %shr179.i.i1918, %and180.i.i1919
  %arrayidx182.i.i1921 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  store i64 %or181.i.i1920, ptr %arrayidx182.i.i1921, align 8
  %261 = load i64, ptr %q.i1.i, align 8
  %conv5.i4.i = trunc i64 %261 to i32
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %q.i1.i)
  %arrayidx9.i1922 = getelementptr inbounds nuw [10 x i8], ptr @Rcon, i32 0, i32 %k.0.i16481999
  %262 = load i8, ptr %arrayidx9.i1922, align 1
  %conv.i = zext i8 %262 to i32
  %xor.i1923 = xor i32 %conv5.i4.i, %conv.i
  br label %if.end16.i

if.end16.i:                                       ; preds = %for.body.i1678, %if.then.i1799
  %tmp.2.i = phi i32 [ %xor.i1923, %if.then.i1799 ], [ %tmp.0.i2000, %for.body.i1678 ]
  %sub17.i = add nsw i32 %i.0.i16471997, -4
  %arrayidx18.i1679 = getelementptr inbounds nuw [60 x i32], ptr %skey.i1621, i32 0, i32 %sub17.i
  %263 = load i32, ptr %arrayidx18.i1679, align 4
  %xor19.i = xor i32 %tmp.2.i, %263
  %arrayidx20.i1680 = getelementptr inbounds nuw [60 x i32], ptr %skey.i1621, i32 0, i32 %i.0.i16471997
  store i32 %xor19.i, ptr %arrayidx20.i1680, align 4
  %inc.i1681 = add i32 %j.0.i1998, 1
  %cmp21.i = icmp eq i32 %inc.i1681, 4
  %spec.select.i = select i1 %cmp21.i, i32 0, i32 %inc.i1681
  %inc24.i = zext i1 %cmp21.i to i32
  %spec.select1.i = add i32 %k.0.i16481999, %inc24.i
  %inc26.i = add nuw nsw i32 %i.0.i16471997, 1
  %exitcond.i1649.not = icmp eq i32 %inc26.i, 44
  br i1 %exitcond.i1649.not, label %for.cond27.i.preheader, label %for.body.i1678, !llvm.loop !23

for.body30.i:                                     ; preds = %for.cond27.i.preheader, %for.body30.i
  %j.2.i2002 = phi i32 [ 0, %for.cond27.i.preheader ], [ %add74.i, %for.body30.i ]
  %i.1.i16502001 = phi i32 [ 0, %for.cond27.i.preheader ], [ %add73.i, %for.body30.i ]
  %arrayidx32.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 32
  %add.ptr.i1651 = getelementptr inbounds nuw i32, ptr %skey.i1621, i32 %i.1.i16502001
  %264 = load i32, ptr %add.ptr.i1651, align 4
  %conv.i7.i1652 = zext i32 %264 to i64
  %arrayidx1.i8.i = getelementptr inbounds nuw i8, ptr %add.ptr.i1651, i32 4
  %265 = load i32, ptr %arrayidx1.i8.i, align 4
  %conv2.i9.i = zext i32 %265 to i64
  %arrayidx3.i10.i = getelementptr inbounds nuw i8, ptr %add.ptr.i1651, i32 8
  %266 = load i32, ptr %arrayidx3.i10.i, align 4
  %conv4.i11.i = zext i32 %266 to i64
  %arrayidx5.i.i1653 = getelementptr inbounds nuw i8, ptr %add.ptr.i1651, i32 12
  %267 = load i32, ptr %arrayidx5.i.i1653, align 4
  %conv6.i.i1654 = zext i32 %267 to i64
  %shl.i12.i1655 = shl nuw nsw i64 %conv.i7.i1652, 16
  %or.i13.i = or i64 %shl.i12.i1655, %conv.i7.i1652
  %shl7.i.i1656 = shl nuw nsw i64 %conv2.i9.i, 16
  %or8.i.i1657 = or i64 %shl7.i.i1656, %conv2.i9.i
  %shl9.i14.i = shl nuw nsw i64 %conv4.i11.i, 16
  %or10.i15.i = or i64 %shl9.i14.i, %conv4.i11.i
  %shl11.i.i1658 = shl nuw nsw i64 %conv6.i.i1654, 16
  %or12.i.i1659 = or i64 %shl11.i.i1658, %conv6.i.i1654
  %and.i.i1660 = and i64 %or.i13.i, 281470681808895
  %and13.i.i1661 = and i64 %or8.i.i1657, 281470681808895
  %and14.i.i1662 = and i64 %or10.i15.i, 281470681808895
  %and15.i.i1663 = and i64 %or12.i.i1659, 281470681808895
  %shl16.i.i1664 = shl nuw nsw i64 %and.i.i1660, 8
  %or17.i.i1665 = or i64 %and.i.i1660, %shl16.i.i1664
  %shl18.i.i1666 = shl nuw nsw i64 %and13.i.i1661, 8
  %or19.i.i1667 = or i64 %and13.i.i1661, %shl18.i.i1666
  %and24.i.i1668 = and i64 %or17.i.i1665, 71777214294589695
  %and25.i.i1669 = and i64 %or19.i.i1667, 71777214294589695
  %268 = shl nuw i64 %and14.i.i1662, 16
  %269 = shl nuw nsw i64 %and14.i.i1662, 8
  %and26.i.i1670 = or i64 %268, %269
  %shl28.i.i1671 = and i64 %and26.i.i1670, -71777214294589696
  %or29.i.i1672 = or disjoint i64 %and24.i.i1668, %shl28.i.i1671
  store i64 %or29.i.i1672, ptr %q.i1622, align 8
  %270 = shl nuw i64 %and15.i.i1663, 16
  %271 = shl nuw nsw i64 %and15.i.i1663, 8
  %and27.i.i1673 = or i64 %270, %271
  %shl30.i.i1674 = and i64 %and27.i.i1673, -71777214294589696
  %or31.i.i1675 = or disjoint i64 %and25.i.i1669, %shl30.i.i1674
  store i64 %or31.i.i1675, ptr %arrayidx32.i, align 8
  %272 = load i64, ptr %q.i1622, align 8
  %arrayidx35.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 8
  store i64 %272, ptr %arrayidx35.i, align 8
  %arrayidx37.i1676 = getelementptr inbounds nuw i8, ptr %q.i1622, i32 16
  store i64 %272, ptr %arrayidx37.i1676, align 8
  %arrayidx39.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 24
  store i64 %272, ptr %arrayidx39.i, align 8
  %arrayidx40.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 32
  %273 = load i64, ptr %arrayidx40.i, align 8
  %arrayidx41.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 40
  store i64 %273, ptr %arrayidx41.i, align 8
  %arrayidx43.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 48
  store i64 %273, ptr %arrayidx43.i, align 8
  %arrayidx45.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 56
  store i64 %273, ptr %arrayidx45.i, align 8
  %274 = load i64, ptr %q.i1622, align 8
  %arrayidx1.i293.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 8
  %275 = load i64, ptr %arrayidx1.i293.i, align 8
  %and.i294.i = and i64 %274, 6148914691236517205
  %and2.i295.i = shl i64 %275, 1
  %shl.i296.i = and i64 %and2.i295.i, -6148914691236517206
  %or.i297.i = or disjoint i64 %and.i294.i, %shl.i296.i
  store i64 %or.i297.i, ptr %q.i1622, align 8
  %and4.i298.i = lshr i64 %274, 1
  %shr.i299.i = and i64 %and4.i298.i, 6148914691236517205
  %and5.i300.i = and i64 %275, -6148914691236517206
  %or6.i301.i = or disjoint i64 %shr.i299.i, %and5.i300.i
  %arrayidx7.i302.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 8
  store i64 %or6.i301.i, ptr %arrayidx7.i302.i, align 8
  %arrayidx11.i303.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 16
  %276 = load i64, ptr %arrayidx11.i303.i, align 8
  %arrayidx12.i304.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 24
  %277 = load i64, ptr %arrayidx12.i304.i, align 8
  %and13.i305.i = and i64 %276, 6148914691236517205
  %and14.i306.i = shl i64 %277, 1
  %shl15.i307.i = and i64 %and14.i306.i, -6148914691236517206
  %or16.i308.i = or disjoint i64 %and13.i305.i, %shl15.i307.i
  %arrayidx17.i309.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 16
  store i64 %or16.i308.i, ptr %arrayidx17.i309.i, align 8
  %and18.i310.i = lshr i64 %276, 1
  %shr19.i311.i = and i64 %and18.i310.i, 6148914691236517205
  %and20.i312.i = and i64 %277, -6148914691236517206
  %or21.i313.i = or disjoint i64 %shr19.i311.i, %and20.i312.i
  %arrayidx22.i314.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 24
  store i64 %or21.i313.i, ptr %arrayidx22.i314.i, align 8
  %arrayidx27.i315.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 32
  %278 = load i64, ptr %arrayidx27.i315.i, align 8
  %arrayidx28.i316.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 40
  %279 = load i64, ptr %arrayidx28.i316.i, align 8
  %and29.i317.i = and i64 %278, 6148914691236517205
  %and30.i318.i = shl i64 %279, 1
  %shl31.i319.i = and i64 %and30.i318.i, -6148914691236517206
  %or32.i320.i = or disjoint i64 %and29.i317.i, %shl31.i319.i
  %arrayidx33.i321.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 32
  store i64 %or32.i320.i, ptr %arrayidx33.i321.i, align 8
  %and34.i322.i = lshr i64 %278, 1
  %shr35.i323.i = and i64 %and34.i322.i, 6148914691236517205
  %and36.i324.i = and i64 %279, -6148914691236517206
  %or37.i325.i = or disjoint i64 %shr35.i323.i, %and36.i324.i
  %arrayidx38.i326.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 40
  store i64 %or37.i325.i, ptr %arrayidx38.i326.i, align 8
  %arrayidx43.i327.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 48
  %280 = load i64, ptr %arrayidx43.i327.i, align 8
  %arrayidx44.i328.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 56
  %281 = load i64, ptr %arrayidx44.i328.i, align 8
  %and45.i329.i = and i64 %280, 6148914691236517205
  %and46.i330.i = shl i64 %281, 1
  %shl47.i331.i = and i64 %and46.i330.i, -6148914691236517206
  %or48.i332.i = or disjoint i64 %and45.i329.i, %shl47.i331.i
  %arrayidx49.i333.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 48
  store i64 %or48.i332.i, ptr %arrayidx49.i333.i, align 8
  %and50.i334.i = lshr i64 %280, 1
  %shr51.i335.i = and i64 %and50.i334.i, 6148914691236517205
  %and52.i336.i = and i64 %281, -6148914691236517206
  %or53.i337.i = or disjoint i64 %shr51.i335.i, %and52.i336.i
  %arrayidx54.i338.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 56
  store i64 %or53.i337.i, ptr %arrayidx54.i338.i, align 8
  %282 = load i64, ptr %q.i1622, align 8
  %arrayidx60.i339.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 16
  %283 = load i64, ptr %arrayidx60.i339.i, align 8
  %and61.i340.i = and i64 %282, 3689348814741910323
  %and62.i341.i = shl i64 %283, 2
  %shl63.i342.i = and i64 %and62.i341.i, -3689348814741910324
  %or64.i343.i = or disjoint i64 %and61.i340.i, %shl63.i342.i
  store i64 %or64.i343.i, ptr %q.i1622, align 8
  %and66.i344.i = lshr i64 %282, 2
  %shr67.i345.i = and i64 %and66.i344.i, 3689348814741910323
  %and68.i346.i = and i64 %283, -3689348814741910324
  %or69.i347.i = or disjoint i64 %shr67.i345.i, %and68.i346.i
  %arrayidx70.i348.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 16
  store i64 %or69.i347.i, ptr %arrayidx70.i348.i, align 8
  %arrayidx75.i349.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 8
  %284 = load i64, ptr %arrayidx75.i349.i, align 8
  %arrayidx76.i350.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 24
  %285 = load i64, ptr %arrayidx76.i350.i, align 8
  %and77.i351.i = and i64 %284, 3689348814741910323
  %and78.i352.i = shl i64 %285, 2
  %shl79.i353.i = and i64 %and78.i352.i, -3689348814741910324
  %or80.i354.i = or disjoint i64 %and77.i351.i, %shl79.i353.i
  %arrayidx81.i355.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 8
  store i64 %or80.i354.i, ptr %arrayidx81.i355.i, align 8
  %and82.i356.i = lshr i64 %284, 2
  %shr83.i357.i = and i64 %and82.i356.i, 3689348814741910323
  %and84.i358.i = and i64 %285, -3689348814741910324
  %or85.i359.i = or disjoint i64 %shr83.i357.i, %and84.i358.i
  %arrayidx86.i360.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 24
  store i64 %or85.i359.i, ptr %arrayidx86.i360.i, align 8
  %arrayidx91.i361.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 32
  %286 = load i64, ptr %arrayidx91.i361.i, align 8
  %arrayidx92.i362.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 48
  %287 = load i64, ptr %arrayidx92.i362.i, align 8
  %and93.i363.i = and i64 %286, 3689348814741910323
  %and94.i364.i = shl i64 %287, 2
  %shl95.i365.i = and i64 %and94.i364.i, -3689348814741910324
  %or96.i366.i = or disjoint i64 %and93.i363.i, %shl95.i365.i
  %arrayidx97.i367.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 32
  store i64 %or96.i366.i, ptr %arrayidx97.i367.i, align 8
  %and98.i368.i = lshr i64 %286, 2
  %shr99.i369.i = and i64 %and98.i368.i, 3689348814741910323
  %and100.i370.i = and i64 %287, -3689348814741910324
  %or101.i371.i = or disjoint i64 %shr99.i369.i, %and100.i370.i
  %arrayidx102.i372.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 48
  store i64 %or101.i371.i, ptr %arrayidx102.i372.i, align 8
  %arrayidx107.i373.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 40
  %288 = load i64, ptr %arrayidx107.i373.i, align 8
  %arrayidx108.i374.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 56
  %289 = load i64, ptr %arrayidx108.i374.i, align 8
  %and109.i375.i = and i64 %288, 3689348814741910323
  %and110.i376.i = shl i64 %289, 2
  %shl111.i377.i = and i64 %and110.i376.i, -3689348814741910324
  %or112.i378.i = or disjoint i64 %and109.i375.i, %shl111.i377.i
  %arrayidx113.i379.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 40
  store i64 %or112.i378.i, ptr %arrayidx113.i379.i, align 8
  %and114.i380.i = lshr i64 %288, 2
  %shr115.i381.i = and i64 %and114.i380.i, 3689348814741910323
  %and116.i382.i = and i64 %289, -3689348814741910324
  %or117.i383.i = or disjoint i64 %shr115.i381.i, %and116.i382.i
  %arrayidx118.i384.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 56
  store i64 %or117.i383.i, ptr %arrayidx118.i384.i, align 8
  %290 = load i64, ptr %q.i1622, align 8
  %arrayidx124.i385.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 32
  %291 = load i64, ptr %arrayidx124.i385.i, align 8
  %and125.i386.i = and i64 %290, 1085102592571150095
  %and126.i387.i = shl i64 %291, 4
  %shl127.i388.i = and i64 %and126.i387.i, -1085102592571150096
  %or128.i389.i = or disjoint i64 %and125.i386.i, %shl127.i388.i
  store i64 %or128.i389.i, ptr %q.i1622, align 8
  %and130.i390.i = lshr i64 %290, 4
  %shr131.i391.i = and i64 %and130.i390.i, 1085102592571150095
  %and132.i392.i = and i64 %291, -1085102592571150096
  %or133.i393.i = or disjoint i64 %shr131.i391.i, %and132.i392.i
  %arrayidx134.i394.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 32
  store i64 %or133.i393.i, ptr %arrayidx134.i394.i, align 8
  %arrayidx139.i395.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 8
  %292 = load i64, ptr %arrayidx139.i395.i, align 8
  %arrayidx140.i396.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 40
  %293 = load i64, ptr %arrayidx140.i396.i, align 8
  %and141.i397.i = and i64 %292, 1085102592571150095
  %and142.i398.i = shl i64 %293, 4
  %shl143.i399.i = and i64 %and142.i398.i, -1085102592571150096
  %or144.i400.i = or disjoint i64 %and141.i397.i, %shl143.i399.i
  %arrayidx145.i401.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 8
  store i64 %or144.i400.i, ptr %arrayidx145.i401.i, align 8
  %and146.i402.i = lshr i64 %292, 4
  %shr147.i403.i = and i64 %and146.i402.i, 1085102592571150095
  %and148.i404.i = and i64 %293, -1085102592571150096
  %or149.i405.i = or disjoint i64 %shr147.i403.i, %and148.i404.i
  %arrayidx150.i406.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 40
  store i64 %or149.i405.i, ptr %arrayidx150.i406.i, align 8
  %arrayidx155.i407.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 16
  %294 = load i64, ptr %arrayidx155.i407.i, align 8
  %arrayidx156.i408.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 48
  %295 = load i64, ptr %arrayidx156.i408.i, align 8
  %and157.i409.i = and i64 %294, 1085102592571150095
  %and158.i410.i = shl i64 %295, 4
  %shl159.i411.i = and i64 %and158.i410.i, -1085102592571150096
  %or160.i412.i = or disjoint i64 %and157.i409.i, %shl159.i411.i
  %arrayidx161.i413.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 16
  store i64 %or160.i412.i, ptr %arrayidx161.i413.i, align 8
  %and162.i414.i = lshr i64 %294, 4
  %shr163.i415.i = and i64 %and162.i414.i, 1085102592571150095
  %and164.i416.i = and i64 %295, -1085102592571150096
  %or165.i417.i = or disjoint i64 %shr163.i415.i, %and164.i416.i
  %arrayidx166.i418.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 48
  store i64 %or165.i417.i, ptr %arrayidx166.i418.i, align 8
  %arrayidx171.i419.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 24
  %296 = load i64, ptr %arrayidx171.i419.i, align 8
  %arrayidx172.i420.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 56
  %297 = load i64, ptr %arrayidx172.i420.i, align 8
  %and173.i421.i = and i64 %296, 1085102592571150095
  %and174.i422.i = shl i64 %297, 4
  %shl175.i423.i = and i64 %and174.i422.i, -1085102592571150096
  %or176.i424.i = or disjoint i64 %and173.i421.i, %shl175.i423.i
  %arrayidx177.i425.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 24
  store i64 %or176.i424.i, ptr %arrayidx177.i425.i, align 8
  %and178.i426.i = lshr i64 %296, 4
  %shr179.i427.i = and i64 %and178.i426.i, 1085102592571150095
  %and180.i428.i = and i64 %297, -1085102592571150096
  %or181.i429.i = or disjoint i64 %shr179.i427.i, %and180.i428.i
  %arrayidx182.i430.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 56
  store i64 %or181.i429.i, ptr %arrayidx182.i430.i, align 8
  %298 = load i64, ptr %q.i1622, align 8
  %and.i1677 = and i64 %298, 1229782938247303441
  %arrayidx48.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 8
  %299 = load i64, ptr %arrayidx48.i, align 8
  %and49.i = and i64 %299, 2459565876494606882
  %or50.i = or disjoint i64 %and.i1677, %and49.i
  %arrayidx51.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 16
  %300 = load i64, ptr %arrayidx51.i, align 8
  %and52.i = and i64 %300, 4919131752989213764
  %or53.i = or disjoint i64 %or50.i, %and52.i
  %arrayidx54.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 24
  %301 = load i64, ptr %arrayidx54.i, align 8
  %and55.i = and i64 %301, -8608480567731124088
  %or56.i = or disjoint i64 %or53.i, %and55.i
  %arrayidx58.i = getelementptr inbounds nuw i64, ptr %skey.i, i32 %j.2.i2002
  store i64 %or56.i, ptr %arrayidx58.i, align 8
  %arrayidx59.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 32
  %302 = load i64, ptr %arrayidx59.i, align 8
  %and60.i = and i64 %302, 1229782938247303441
  %arrayidx61.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 40
  %303 = load i64, ptr %arrayidx61.i, align 8
  %and62.i = and i64 %303, 2459565876494606882
  %or63.i = or disjoint i64 %and60.i, %and62.i
  %arrayidx64.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 48
  %304 = load i64, ptr %arrayidx64.i, align 8
  %and65.i = and i64 %304, 4919131752989213764
  %or66.i = or disjoint i64 %or63.i, %and65.i
  %arrayidx67.i = getelementptr inbounds nuw i8, ptr %q.i1622, i32 56
  %305 = load i64, ptr %arrayidx67.i, align 8
  %and68.i = and i64 %305, -8608480567731124088
  %or69.i = or disjoint i64 %or66.i, %and68.i
  %add70.i = or disjoint i32 %j.2.i2002, 1
  %arrayidx71.i = getelementptr inbounds nuw i64, ptr %skey.i, i32 %add70.i
  store i64 %or69.i, ptr %arrayidx71.i, align 8
  %add73.i = add nuw nsw i32 %i.1.i16502001, 4
  %add74.i = add nuw nsw i32 %j.2.i2002, 2
  %cmp28.i = icmp samesign ult i32 %add73.i, 44
  br i1 %cmp28.i, label %for.body30.i, label %br_aes_ct64_keysched.exit, !llvm.loop !24

br_aes_ct64_keysched.exit:                        ; preds = %for.body30.i
  call void @llvm.lifetime.end.p0(i64 240, ptr nonnull %skey.i1621)
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %q.i1622)
  %306 = load ptr, ptr %ctx.i, align 4
  br label %for.body.i15

for.body.i15:                                     ; preds = %br_aes_ct64_keysched.exit, %for.body.i15
  %v.0.i2004 = phi i32 [ 0, %br_aes_ct64_keysched.exit ], [ %add21.i, %for.body.i15 ]
  %u.0.i2003 = phi i32 [ 0, %br_aes_ct64_keysched.exit ], [ %inc.i17, %for.body.i15 ]
  %arrayidx.i16 = getelementptr inbounds nuw i64, ptr %skey.i, i32 %u.0.i2003
  %307 = load i64, ptr %arrayidx.i16, align 8
  %and.i = and i64 %307, 1229782938247303441
  %and1.i = lshr i64 %307, 1
  %shr.i = and i64 %and1.i, 1229782938247303441
  %and2.i = lshr i64 %307, 2
  %shr4.i = and i64 %and2.i, 1229782938247303441
  %and3.i = lshr i64 %307, 3
  %shr5.i = and i64 %and3.i, 1229782938247303441
  %sub.i = mul nuw i64 %and.i, 15
  %arrayidx8.i = getelementptr inbounds nuw i64, ptr %306, i32 %v.0.i2004
  store i64 %sub.i, ptr %arrayidx8.i, align 8
  %sub10.i = mul nuw i64 %shr.i, 15
  %add11.i = or disjoint i32 %v.0.i2004, 1
  %arrayidx12.i = getelementptr inbounds nuw i64, ptr %306, i32 %add11.i
  store i64 %sub10.i, ptr %arrayidx12.i, align 8
  %sub14.i = mul nuw i64 %shr4.i, 15
  %add15.i = or disjoint i32 %v.0.i2004, 2
  %arrayidx16.i = getelementptr inbounds nuw i64, ptr %306, i32 %add15.i
  store i64 %sub14.i, ptr %arrayidx16.i, align 8
  %sub18.i = mul nuw i64 %shr5.i, 15
  %add19.i = or disjoint i32 %v.0.i2004, 3
  %arrayidx20.i = getelementptr inbounds nuw i64, ptr %306, i32 %add19.i
  store i64 %sub18.i, ptr %arrayidx20.i, align 8
  %inc.i17 = add nuw nsw i32 %u.0.i2003, 1
  %add21.i = add nuw nsw i32 %v.0.i2004, 4
  %exitcond.i14.not = icmp eq i32 %inc.i17, 22
  br i1 %exitcond.i14.not, label %br_aes_ct64_skey_expand.exit, label %for.body.i15, !llvm.loop !25

br_aes_ct64_skey_expand.exit:                     ; preds = %for.body.i15
  call void @llvm.lifetime.end.p0(i64 176, ptr nonnull %skey.i)
  %308 = load ptr, ptr %ctx.i, align 4
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %ivw.i)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %tmp.i18)
  br label %while.body.i.i

while.body.i.i:                                   ; preds = %br_aes_ct64_skey_expand.exit, %while.body.i.i
  %v.addr.0.i.i2007 = phi ptr [ %ivw.i, %br_aes_ct64_skey_expand.exit ], [ %incdec.ptr.i.i, %while.body.i.i ]
  %num.addr.0.i.i2006 = phi i32 [ 3, %br_aes_ct64_skey_expand.exit ], [ %dec.i.i, %while.body.i.i ]
  %src.addr.0.i.i2005 = phi ptr [ %iv.i, %br_aes_ct64_skey_expand.exit ], [ %add.ptr.i.i, %while.body.i.i ]
  %dec.i.i = add nsw i32 %num.addr.0.i.i2006, -1
  %309 = load i8, ptr %src.addr.0.i.i2005, align 1
  %conv.i.i = zext i8 %309 to i32
  %arrayidx1.i.i = getelementptr inbounds nuw i8, ptr %src.addr.0.i.i2005, i32 1
  %310 = load i8, ptr %arrayidx1.i.i, align 1
  %conv2.i.i = zext i8 %310 to i32
  %shl.i.i = shl nuw nsw i32 %conv2.i.i, 8
  %or.i.i = or disjoint i32 %shl.i.i, %conv.i.i
  %arrayidx3.i.i = getelementptr inbounds nuw i8, ptr %src.addr.0.i.i2005, i32 2
  %311 = load i8, ptr %arrayidx3.i.i, align 1
  %conv4.i.i = zext i8 %311 to i32
  %shl5.i.i = shl nuw nsw i32 %conv4.i.i, 16
  %or6.i.i = or disjoint i32 %or.i.i, %shl5.i.i
  %arrayidx7.i.i = getelementptr inbounds nuw i8, ptr %src.addr.0.i.i2005, i32 3
  %312 = load i8, ptr %arrayidx7.i.i, align 1
  %conv8.i.i = zext i8 %312 to i32
  %shl9.i.i = shl nuw i32 %conv8.i.i, 24
  %or10.i.i = or disjoint i32 %or6.i.i, %shl9.i.i
  %incdec.ptr.i.i = getelementptr inbounds nuw i8, ptr %v.addr.0.i.i2007, i32 4
  store i32 %or10.i.i, ptr %v.addr.0.i.i2007, align 4
  %add.ptr.i.i = getelementptr inbounds nuw i8, ptr %src.addr.0.i.i2005, i32 4
  %cmp.not.i.i = icmp eq i32 %dec.i.i, 0
  br i1 %cmp.not.i.i, label %br_range_dec32le.exit.i, label %while.body.i.i, !llvm.loop !26

br_range_dec32le.exit.i:                          ; preds = %while.body.i.i
  %add.ptr.i19 = getelementptr inbounds nuw i8, ptr %ivw.i, i32 16
  %call.i20 = call ptr @memcpy(ptr noundef nonnull %add.ptr.i19, ptr noundef nonnull %ivw.i, i32 noundef 12) #8
  %add.ptr4.i = getelementptr inbounds nuw i8, ptr %ivw.i, i32 32
  %call6.i = call ptr @memcpy(ptr noundef nonnull %add.ptr4.i, ptr noundef nonnull %ivw.i, i32 noundef 12) #8
  %add.ptr8.i = getelementptr inbounds nuw i8, ptr %ivw.i, i32 48
  %call10.i = call ptr @memcpy(ptr noundef nonnull %add.ptr8.i, ptr noundef nonnull %ivw.i, i32 noundef 12) #8
  %arrayidx.i21 = getelementptr inbounds nuw i8, ptr %ivw.i, i32 12
  store i32 0, ptr %arrayidx.i21, align 4
  %arrayidx13.i = getelementptr inbounds nuw i8, ptr %ivw.i, i32 28
  store i32 16777216, ptr %arrayidx13.i, align 4
  %arrayidx16.i22 = getelementptr inbounds nuw i8, ptr %ivw.i, i32 44
  store i32 33554432, ptr %arrayidx16.i22, align 4
  %arrayidx19.i = getelementptr inbounds nuw i8, ptr %ivw.i, i32 60
  store i32 50331648, ptr %arrayidx19.i, align 4
  br label %while.body.i

while.body.i:                                     ; preds = %br_range_dec32le.exit.i, %aes_ecb4x.exit1620
  %out.addr.0.i2017 = phi ptr [ %sk, %br_range_dec32le.exit.i ], [ %add.ptr21.i, %aes_ecb4x.exit1620 ]
  %outlen.addr.0.i2016 = phi i32 [ 144495, %br_range_dec32le.exit.i ], [ %sub.i29, %aes_ecb4x.exit1620 ]
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %w.i843)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %q.i844)
  %call.i845 = call ptr @memcpy(ptr noundef nonnull %w.i843, ptr noundef nonnull %ivw.i, i32 noundef 64) #8
  br label %for.body.i1582

for.body.i1582:                                   ; preds = %while.body.i, %for.body.i1582
  %i.0.i8472008 = phi i32 [ 0, %while.body.i ], [ %inc.i1619, %for.body.i1582 ]
  %arrayidx.i1583 = getelementptr inbounds nuw [8 x i64], ptr %q.i844, i32 0, i32 %i.0.i8472008
  %add.i1584 = or disjoint i32 %i.0.i8472008, 4
  %arrayidx1.i1585 = getelementptr inbounds nuw [8 x i64], ptr %q.i844, i32 0, i32 %add.i1584
  %add.ptr.idx.i1586 = shl nuw nsw i32 %i.0.i8472008, 4
  %add.ptr.i1587 = getelementptr inbounds nuw i8, ptr %w.i843, i32 %add.ptr.idx.i1586
  %313 = load i32, ptr %add.ptr.i1587, align 4
  %conv.i40.i1588 = zext i32 %313 to i64
  %arrayidx1.i.i1589 = getelementptr inbounds nuw i8, ptr %add.ptr.i1587, i32 4
  %314 = load i32, ptr %arrayidx1.i.i1589, align 4
  %conv2.i.i1590 = zext i32 %314 to i64
  %arrayidx3.i.i1591 = getelementptr inbounds nuw i8, ptr %add.ptr.i1587, i32 8
  %315 = load i32, ptr %arrayidx3.i.i1591, align 4
  %conv4.i41.i1592 = zext i32 %315 to i64
  %arrayidx5.i42.i1593 = getelementptr inbounds nuw i8, ptr %add.ptr.i1587, i32 12
  %316 = load i32, ptr %arrayidx5.i42.i1593, align 4
  %conv6.i.i1594 = zext i32 %316 to i64
  %shl.i43.i1595 = shl nuw nsw i64 %conv.i40.i1588, 16
  %or.i44.i1596 = or i64 %shl.i43.i1595, %conv.i40.i1588
  %shl7.i.i1597 = shl nuw nsw i64 %conv2.i.i1590, 16
  %or8.i.i1598 = or i64 %shl7.i.i1597, %conv2.i.i1590
  %shl9.i.i1599 = shl nuw nsw i64 %conv4.i41.i1592, 16
  %or10.i.i1600 = or i64 %shl9.i.i1599, %conv4.i41.i1592
  %shl11.i.i1601 = shl nuw nsw i64 %conv6.i.i1594, 16
  %or12.i45.i1602 = or i64 %shl11.i.i1601, %conv6.i.i1594
  %and.i46.i1603 = and i64 %or.i44.i1596, 281470681808895
  %and13.i47.i1604 = and i64 %or8.i.i1598, 281470681808895
  %and14.i.i1605 = and i64 %or10.i.i1600, 281470681808895
  %and15.i.i1606 = and i64 %or12.i45.i1602, 281470681808895
  %shl16.i.i1607 = shl nuw nsw i64 %and.i46.i1603, 8
  %or17.i.i1608 = or i64 %and.i46.i1603, %shl16.i.i1607
  %shl18.i.i1609 = shl nuw nsw i64 %and13.i47.i1604, 8
  %or19.i.i1610 = or i64 %and13.i47.i1604, %shl18.i.i1609
  %and24.i.i1611 = and i64 %or17.i.i1608, 71777214294589695
  %and25.i.i1612 = and i64 %or19.i.i1610, 71777214294589695
  %317 = shl nuw i64 %and14.i.i1605, 16
  %318 = shl nuw nsw i64 %and14.i.i1605, 8
  %and26.i.i1613 = or i64 %317, %318
  %shl28.i.i1614 = and i64 %and26.i.i1613, -71777214294589696
  %or29.i.i1615 = or disjoint i64 %and24.i.i1611, %shl28.i.i1614
  store i64 %or29.i.i1615, ptr %arrayidx.i1583, align 8
  %319 = shl nuw i64 %and15.i.i1606, 16
  %320 = shl nuw nsw i64 %and15.i.i1606, 8
  %and27.i.i1616 = or i64 %319, %320
  %shl30.i.i1617 = and i64 %and27.i.i1616, -71777214294589696
  %or31.i.i1618 = or disjoint i64 %and25.i.i1612, %shl30.i.i1617
  store i64 %or31.i.i1618, ptr %arrayidx1.i1585, align 8
  %inc.i1619 = add nuw nsw i32 %i.0.i8472008, 1
  %exitcond.i848.not = icmp eq i32 %inc.i1619, 4
  br i1 %exitcond.i848.not, label %for.end.i849, label %for.body.i1582, !llvm.loop !27

for.end.i849:                                     ; preds = %for.body.i1582
  %321 = load i64, ptr %q.i844, align 8
  %arrayidx1.i268.i850 = getelementptr inbounds nuw i8, ptr %q.i844, i32 8
  %322 = load i64, ptr %arrayidx1.i268.i850, align 8
  %and.i269.i851 = and i64 %321, 6148914691236517205
  %and2.i270.i852 = shl i64 %322, 1
  %shl.i271.i853 = and i64 %and2.i270.i852, -6148914691236517206
  %or.i272.i854 = or disjoint i64 %and.i269.i851, %shl.i271.i853
  store i64 %or.i272.i854, ptr %q.i844, align 8
  %and4.i273.i855 = lshr i64 %321, 1
  %shr.i274.i856 = and i64 %and4.i273.i855, 6148914691236517205
  %and5.i275.i857 = and i64 %322, -6148914691236517206
  %or6.i276.i858 = or disjoint i64 %shr.i274.i856, %and5.i275.i857
  %arrayidx7.i277.i859 = getelementptr inbounds nuw i8, ptr %q.i844, i32 8
  store i64 %or6.i276.i858, ptr %arrayidx7.i277.i859, align 8
  %arrayidx11.i278.i860 = getelementptr inbounds nuw i8, ptr %q.i844, i32 16
  %323 = load i64, ptr %arrayidx11.i278.i860, align 8
  %arrayidx12.i279.i861 = getelementptr inbounds nuw i8, ptr %q.i844, i32 24
  %324 = load i64, ptr %arrayidx12.i279.i861, align 8
  %and13.i280.i862 = and i64 %323, 6148914691236517205
  %and14.i281.i863 = shl i64 %324, 1
  %shl15.i282.i864 = and i64 %and14.i281.i863, -6148914691236517206
  %or16.i283.i865 = or disjoint i64 %and13.i280.i862, %shl15.i282.i864
  %arrayidx17.i284.i866 = getelementptr inbounds nuw i8, ptr %q.i844, i32 16
  store i64 %or16.i283.i865, ptr %arrayidx17.i284.i866, align 8
  %and18.i285.i867 = lshr i64 %323, 1
  %shr19.i286.i868 = and i64 %and18.i285.i867, 6148914691236517205
  %and20.i287.i869 = and i64 %324, -6148914691236517206
  %or21.i288.i870 = or disjoint i64 %shr19.i286.i868, %and20.i287.i869
  %arrayidx22.i289.i871 = getelementptr inbounds nuw i8, ptr %q.i844, i32 24
  store i64 %or21.i288.i870, ptr %arrayidx22.i289.i871, align 8
  %arrayidx27.i290.i872 = getelementptr inbounds nuw i8, ptr %q.i844, i32 32
  %325 = load i64, ptr %arrayidx27.i290.i872, align 8
  %arrayidx28.i291.i873 = getelementptr inbounds nuw i8, ptr %q.i844, i32 40
  %326 = load i64, ptr %arrayidx28.i291.i873, align 8
  %and29.i292.i874 = and i64 %325, 6148914691236517205
  %and30.i293.i875 = shl i64 %326, 1
  %shl31.i294.i876 = and i64 %and30.i293.i875, -6148914691236517206
  %or32.i295.i877 = or disjoint i64 %and29.i292.i874, %shl31.i294.i876
  %arrayidx33.i296.i878 = getelementptr inbounds nuw i8, ptr %q.i844, i32 32
  store i64 %or32.i295.i877, ptr %arrayidx33.i296.i878, align 8
  %and34.i297.i879 = lshr i64 %325, 1
  %shr35.i298.i880 = and i64 %and34.i297.i879, 6148914691236517205
  %and36.i299.i881 = and i64 %326, -6148914691236517206
  %or37.i300.i882 = or disjoint i64 %shr35.i298.i880, %and36.i299.i881
  %arrayidx38.i301.i883 = getelementptr inbounds nuw i8, ptr %q.i844, i32 40
  store i64 %or37.i300.i882, ptr %arrayidx38.i301.i883, align 8
  %arrayidx43.i302.i884 = getelementptr inbounds nuw i8, ptr %q.i844, i32 48
  %327 = load i64, ptr %arrayidx43.i302.i884, align 8
  %arrayidx44.i303.i885 = getelementptr inbounds nuw i8, ptr %q.i844, i32 56
  %328 = load i64, ptr %arrayidx44.i303.i885, align 8
  %and45.i304.i886 = and i64 %327, 6148914691236517205
  %and46.i305.i887 = shl i64 %328, 1
  %shl47.i306.i888 = and i64 %and46.i305.i887, -6148914691236517206
  %or48.i307.i889 = or disjoint i64 %and45.i304.i886, %shl47.i306.i888
  %arrayidx49.i308.i890 = getelementptr inbounds nuw i8, ptr %q.i844, i32 48
  store i64 %or48.i307.i889, ptr %arrayidx49.i308.i890, align 8
  %and50.i309.i891 = lshr i64 %327, 1
  %shr51.i310.i892 = and i64 %and50.i309.i891, 6148914691236517205
  %and52.i311.i893 = and i64 %328, -6148914691236517206
  %or53.i312.i894 = or disjoint i64 %shr51.i310.i892, %and52.i311.i893
  %arrayidx54.i313.i895 = getelementptr inbounds nuw i8, ptr %q.i844, i32 56
  store i64 %or53.i312.i894, ptr %arrayidx54.i313.i895, align 8
  %329 = load i64, ptr %q.i844, align 8
  %arrayidx60.i314.i896 = getelementptr inbounds nuw i8, ptr %q.i844, i32 16
  %330 = load i64, ptr %arrayidx60.i314.i896, align 8
  %and61.i315.i897 = and i64 %329, 3689348814741910323
  %and62.i316.i898 = shl i64 %330, 2
  %shl63.i317.i899 = and i64 %and62.i316.i898, -3689348814741910324
  %or64.i318.i900 = or disjoint i64 %and61.i315.i897, %shl63.i317.i899
  store i64 %or64.i318.i900, ptr %q.i844, align 8
  %and66.i319.i901 = lshr i64 %329, 2
  %shr67.i320.i902 = and i64 %and66.i319.i901, 3689348814741910323
  %and68.i321.i903 = and i64 %330, -3689348814741910324
  %or69.i322.i904 = or disjoint i64 %shr67.i320.i902, %and68.i321.i903
  %arrayidx70.i323.i905 = getelementptr inbounds nuw i8, ptr %q.i844, i32 16
  store i64 %or69.i322.i904, ptr %arrayidx70.i323.i905, align 8
  %arrayidx75.i324.i906 = getelementptr inbounds nuw i8, ptr %q.i844, i32 8
  %331 = load i64, ptr %arrayidx75.i324.i906, align 8
  %arrayidx76.i325.i907 = getelementptr inbounds nuw i8, ptr %q.i844, i32 24
  %332 = load i64, ptr %arrayidx76.i325.i907, align 8
  %and77.i326.i908 = and i64 %331, 3689348814741910323
  %and78.i327.i909 = shl i64 %332, 2
  %shl79.i328.i910 = and i64 %and78.i327.i909, -3689348814741910324
  %or80.i329.i911 = or disjoint i64 %and77.i326.i908, %shl79.i328.i910
  %arrayidx81.i330.i912 = getelementptr inbounds nuw i8, ptr %q.i844, i32 8
  store i64 %or80.i329.i911, ptr %arrayidx81.i330.i912, align 8
  %and82.i331.i913 = lshr i64 %331, 2
  %shr83.i332.i914 = and i64 %and82.i331.i913, 3689348814741910323
  %and84.i333.i915 = and i64 %332, -3689348814741910324
  %or85.i334.i916 = or disjoint i64 %shr83.i332.i914, %and84.i333.i915
  %arrayidx86.i335.i917 = getelementptr inbounds nuw i8, ptr %q.i844, i32 24
  store i64 %or85.i334.i916, ptr %arrayidx86.i335.i917, align 8
  %arrayidx91.i336.i918 = getelementptr inbounds nuw i8, ptr %q.i844, i32 32
  %333 = load i64, ptr %arrayidx91.i336.i918, align 8
  %arrayidx92.i337.i919 = getelementptr inbounds nuw i8, ptr %q.i844, i32 48
  %334 = load i64, ptr %arrayidx92.i337.i919, align 8
  %and93.i338.i920 = and i64 %333, 3689348814741910323
  %and94.i339.i921 = shl i64 %334, 2
  %shl95.i340.i922 = and i64 %and94.i339.i921, -3689348814741910324
  %or96.i341.i923 = or disjoint i64 %and93.i338.i920, %shl95.i340.i922
  %arrayidx97.i342.i924 = getelementptr inbounds nuw i8, ptr %q.i844, i32 32
  store i64 %or96.i341.i923, ptr %arrayidx97.i342.i924, align 8
  %and98.i343.i925 = lshr i64 %333, 2
  %shr99.i344.i926 = and i64 %and98.i343.i925, 3689348814741910323
  %and100.i345.i927 = and i64 %334, -3689348814741910324
  %or101.i346.i928 = or disjoint i64 %shr99.i344.i926, %and100.i345.i927
  %arrayidx102.i347.i929 = getelementptr inbounds nuw i8, ptr %q.i844, i32 48
  store i64 %or101.i346.i928, ptr %arrayidx102.i347.i929, align 8
  %arrayidx107.i348.i930 = getelementptr inbounds nuw i8, ptr %q.i844, i32 40
  %335 = load i64, ptr %arrayidx107.i348.i930, align 8
  %arrayidx108.i349.i931 = getelementptr inbounds nuw i8, ptr %q.i844, i32 56
  %336 = load i64, ptr %arrayidx108.i349.i931, align 8
  %and109.i350.i932 = and i64 %335, 3689348814741910323
  %and110.i351.i933 = shl i64 %336, 2
  %shl111.i352.i934 = and i64 %and110.i351.i933, -3689348814741910324
  %or112.i353.i935 = or disjoint i64 %and109.i350.i932, %shl111.i352.i934
  %arrayidx113.i354.i936 = getelementptr inbounds nuw i8, ptr %q.i844, i32 40
  store i64 %or112.i353.i935, ptr %arrayidx113.i354.i936, align 8
  %and114.i355.i937 = lshr i64 %335, 2
  %shr115.i356.i938 = and i64 %and114.i355.i937, 3689348814741910323
  %and116.i357.i939 = and i64 %336, -3689348814741910324
  %or117.i358.i940 = or disjoint i64 %shr115.i356.i938, %and116.i357.i939
  %arrayidx118.i359.i941 = getelementptr inbounds nuw i8, ptr %q.i844, i32 56
  store i64 %or117.i358.i940, ptr %arrayidx118.i359.i941, align 8
  %337 = load i64, ptr %q.i844, align 8
  %arrayidx124.i360.i942 = getelementptr inbounds nuw i8, ptr %q.i844, i32 32
  %338 = load i64, ptr %arrayidx124.i360.i942, align 8
  %and125.i361.i943 = and i64 %337, 1085102592571150095
  %and126.i362.i944 = shl i64 %338, 4
  %shl127.i363.i945 = and i64 %and126.i362.i944, -1085102592571150096
  %or128.i364.i946 = or disjoint i64 %and125.i361.i943, %shl127.i363.i945
  store i64 %or128.i364.i946, ptr %q.i844, align 8
  %and130.i365.i947 = lshr i64 %337, 4
  %shr131.i366.i948 = and i64 %and130.i365.i947, 1085102592571150095
  %and132.i367.i949 = and i64 %338, -1085102592571150096
  %or133.i368.i950 = or disjoint i64 %shr131.i366.i948, %and132.i367.i949
  %arrayidx134.i369.i951 = getelementptr inbounds nuw i8, ptr %q.i844, i32 32
  store i64 %or133.i368.i950, ptr %arrayidx134.i369.i951, align 8
  %arrayidx139.i370.i952 = getelementptr inbounds nuw i8, ptr %q.i844, i32 8
  %339 = load i64, ptr %arrayidx139.i370.i952, align 8
  %arrayidx140.i371.i953 = getelementptr inbounds nuw i8, ptr %q.i844, i32 40
  %340 = load i64, ptr %arrayidx140.i371.i953, align 8
  %and141.i372.i954 = and i64 %339, 1085102592571150095
  %and142.i373.i955 = shl i64 %340, 4
  %shl143.i374.i956 = and i64 %and142.i373.i955, -1085102592571150096
  %or144.i375.i957 = or disjoint i64 %and141.i372.i954, %shl143.i374.i956
  %arrayidx145.i376.i958 = getelementptr inbounds nuw i8, ptr %q.i844, i32 8
  store i64 %or144.i375.i957, ptr %arrayidx145.i376.i958, align 8
  %and146.i377.i959 = lshr i64 %339, 4
  %shr147.i378.i960 = and i64 %and146.i377.i959, 1085102592571150095
  %and148.i379.i961 = and i64 %340, -1085102592571150096
  %or149.i380.i962 = or disjoint i64 %shr147.i378.i960, %and148.i379.i961
  %arrayidx150.i381.i963 = getelementptr inbounds nuw i8, ptr %q.i844, i32 40
  store i64 %or149.i380.i962, ptr %arrayidx150.i381.i963, align 8
  %arrayidx155.i382.i964 = getelementptr inbounds nuw i8, ptr %q.i844, i32 16
  %341 = load i64, ptr %arrayidx155.i382.i964, align 8
  %arrayidx156.i383.i965 = getelementptr inbounds nuw i8, ptr %q.i844, i32 48
  %342 = load i64, ptr %arrayidx156.i383.i965, align 8
  %and157.i384.i966 = and i64 %341, 1085102592571150095
  %and158.i385.i967 = shl i64 %342, 4
  %shl159.i386.i968 = and i64 %and158.i385.i967, -1085102592571150096
  %or160.i387.i969 = or disjoint i64 %and157.i384.i966, %shl159.i386.i968
  %arrayidx161.i388.i970 = getelementptr inbounds nuw i8, ptr %q.i844, i32 16
  store i64 %or160.i387.i969, ptr %arrayidx161.i388.i970, align 8
  %and162.i389.i971 = lshr i64 %341, 4
  %shr163.i390.i972 = and i64 %and162.i389.i971, 1085102592571150095
  %and164.i391.i973 = and i64 %342, -1085102592571150096
  %or165.i392.i974 = or disjoint i64 %shr163.i390.i972, %and164.i391.i973
  %arrayidx166.i393.i975 = getelementptr inbounds nuw i8, ptr %q.i844, i32 48
  store i64 %or165.i392.i974, ptr %arrayidx166.i393.i975, align 8
  %arrayidx171.i394.i976 = getelementptr inbounds nuw i8, ptr %q.i844, i32 24
  %343 = load i64, ptr %arrayidx171.i394.i976, align 8
  %arrayidx172.i395.i977 = getelementptr inbounds nuw i8, ptr %q.i844, i32 56
  %344 = load i64, ptr %arrayidx172.i395.i977, align 8
  %and173.i396.i978 = and i64 %343, 1085102592571150095
  %and174.i397.i979 = shl i64 %344, 4
  %shl175.i398.i980 = and i64 %and174.i397.i979, -1085102592571150096
  %or176.i399.i981 = or disjoint i64 %and173.i396.i978, %shl175.i398.i980
  %arrayidx177.i400.i982 = getelementptr inbounds nuw i8, ptr %q.i844, i32 24
  store i64 %or176.i399.i981, ptr %arrayidx177.i400.i982, align 8
  %and178.i401.i983 = lshr i64 %343, 4
  %shr179.i402.i984 = and i64 %and178.i401.i983, 1085102592571150095
  %and180.i403.i985 = and i64 %344, -1085102592571150096
  %or181.i404.i986 = or disjoint i64 %shr179.i402.i984, %and180.i403.i985
  %arrayidx182.i405.i987 = getelementptr inbounds nuw i8, ptr %q.i844, i32 56
  store i64 %or181.i404.i986, ptr %arrayidx182.i405.i987, align 8
  %345 = load i64, ptr %308, align 8
  %346 = load i64, ptr %q.i844, align 8
  %xor.i.i988 = xor i64 %346, %345
  store i64 %xor.i.i988, ptr %q.i844, align 8
  %arrayidx2.i48.i989 = getelementptr inbounds nuw i8, ptr %308, i32 8
  %347 = load i64, ptr %arrayidx2.i48.i989, align 8
  %arrayidx3.i49.i990 = getelementptr inbounds nuw i8, ptr %q.i844, i32 8
  %348 = load i64, ptr %arrayidx3.i49.i990, align 8
  %xor4.i.i991 = xor i64 %348, %347
  store i64 %xor4.i.i991, ptr %arrayidx3.i49.i990, align 8
  %arrayidx5.i50.i992 = getelementptr inbounds nuw i8, ptr %308, i32 16
  %349 = load i64, ptr %arrayidx5.i50.i992, align 8
  %arrayidx6.i.i993 = getelementptr inbounds nuw i8, ptr %q.i844, i32 16
  %350 = load i64, ptr %arrayidx6.i.i993, align 8
  %xor7.i.i994 = xor i64 %350, %349
  store i64 %xor7.i.i994, ptr %arrayidx6.i.i993, align 8
  %arrayidx8.i51.i995 = getelementptr inbounds nuw i8, ptr %308, i32 24
  %351 = load i64, ptr %arrayidx8.i51.i995, align 8
  %arrayidx9.i.i996 = getelementptr inbounds nuw i8, ptr %q.i844, i32 24
  %352 = load i64, ptr %arrayidx9.i.i996, align 8
  %xor10.i.i997 = xor i64 %352, %351
  store i64 %xor10.i.i997, ptr %arrayidx9.i.i996, align 8
  %arrayidx11.i.i998 = getelementptr inbounds nuw i8, ptr %308, i32 32
  %353 = load i64, ptr %arrayidx11.i.i998, align 8
  %arrayidx12.i.i999 = getelementptr inbounds nuw i8, ptr %q.i844, i32 32
  %354 = load i64, ptr %arrayidx12.i.i999, align 8
  %xor13.i.i1000 = xor i64 %354, %353
  store i64 %xor13.i.i1000, ptr %arrayidx12.i.i999, align 8
  %arrayidx14.i.i1001 = getelementptr inbounds nuw i8, ptr %308, i32 40
  %355 = load i64, ptr %arrayidx14.i.i1001, align 8
  %arrayidx15.i.i1002 = getelementptr inbounds nuw i8, ptr %q.i844, i32 40
  %356 = load i64, ptr %arrayidx15.i.i1002, align 8
  %xor16.i.i1003 = xor i64 %356, %355
  store i64 %xor16.i.i1003, ptr %arrayidx15.i.i1002, align 8
  %arrayidx17.i.i1004 = getelementptr inbounds nuw i8, ptr %308, i32 48
  %357 = load i64, ptr %arrayidx17.i.i1004, align 8
  %arrayidx18.i.i1005 = getelementptr inbounds nuw i8, ptr %q.i844, i32 48
  %358 = load i64, ptr %arrayidx18.i.i1005, align 8
  %xor19.i.i1006 = xor i64 %358, %357
  store i64 %xor19.i.i1006, ptr %arrayidx18.i.i1005, align 8
  %arrayidx20.i.i1007 = getelementptr inbounds nuw i8, ptr %308, i32 56
  %359 = load i64, ptr %arrayidx20.i.i1007, align 8
  %arrayidx21.i.i1008 = getelementptr inbounds nuw i8, ptr %q.i844, i32 56
  %360 = load i64, ptr %arrayidx21.i.i1008, align 8
  %xor22.i.i1009 = xor i64 %360, %359
  store i64 %xor22.i.i1009, ptr %arrayidx21.i.i1008, align 8
  br label %for.body7.i1380

for.body7.i1380:                                  ; preds = %for.end.i849, %shift_rows.exit.i1503
  %i.1.i10112010 = phi i32 [ 1, %for.end.i849 ], [ %inc15.i1558, %shift_rows.exit.i1503 ]
  %arrayidx.i101.i1381 = getelementptr inbounds nuw i8, ptr %q.i844, i32 56
  %361 = load i64, ptr %arrayidx.i101.i1381, align 8
  %arrayidx1.i102.i1382 = getelementptr inbounds nuw i8, ptr %q.i844, i32 48
  %362 = load i64, ptr %arrayidx1.i102.i1382, align 8
  %arrayidx2.i103.i1383 = getelementptr inbounds nuw i8, ptr %q.i844, i32 40
  %363 = load i64, ptr %arrayidx2.i103.i1383, align 8
  %arrayidx3.i104.i1384 = getelementptr inbounds nuw i8, ptr %q.i844, i32 32
  %364 = load i64, ptr %arrayidx3.i104.i1384, align 8
  %arrayidx4.i105.i1385 = getelementptr inbounds nuw i8, ptr %q.i844, i32 24
  %365 = load i64, ptr %arrayidx4.i105.i1385, align 8
  %arrayidx5.i106.i1386 = getelementptr inbounds nuw i8, ptr %q.i844, i32 16
  %366 = load i64, ptr %arrayidx5.i106.i1386, align 8
  %arrayidx6.i107.i1387 = getelementptr inbounds nuw i8, ptr %q.i844, i32 8
  %367 = load i64, ptr %arrayidx6.i107.i1387, align 8
  %368 = load i64, ptr %q.i844, align 8
  %xor.i108.i1388 = xor i64 %364, %366
  %xor8.i.i1389 = xor i64 %361, %367
  %xor9.i.i1390 = xor i64 %361, %364
  %xor10.i109.i1391 = xor i64 %361, %366
  %xor11.i.i1392 = xor i64 %362, %363
  %xor12.i.i1393 = xor i64 %xor11.i.i1392, %368
  %xor13.i110.i1394 = xor i64 %xor12.i.i1393, %364
  %xor14.i.i1395 = xor i64 %xor8.i.i1389, %xor.i108.i1388
  %xor15.i.i1396 = xor i64 %xor12.i.i1393, %361
  %xor16.i111.i1397 = xor i64 %xor12.i.i1393, %367
  %xor17.i.i1398 = xor i64 %xor16.i111.i1397, %xor10.i109.i1391
  %xor18.i.i1399 = xor i64 %365, %xor14.i.i1395
  %xor19.i112.i1400 = xor i64 %xor18.i.i1399, %366
  %xor20.i.i1401 = xor i64 %xor18.i.i1399, %362
  %xor21.i.i1402 = xor i64 %xor19.i112.i1400, %368
  %xor22.i113.i1403 = xor i64 %xor19.i112.i1400, %xor11.i.i1392
  %xor23.i.i1404 = xor i64 %xor20.i.i1401, %xor9.i.i1390
  %xor24.i.i1405 = xor i64 %368, %xor23.i.i1404
  %xor25.i.i1406 = xor i64 %xor22.i113.i1403, %xor23.i.i1404
  %xor27.i.i1407 = xor i64 %xor11.i.i1392, %xor23.i.i1404
  %and.i114.i1408 = and i64 %xor14.i.i1395, %xor19.i112.i1400
  %and30.i.i1409 = and i64 %xor17.i.i1398, %xor21.i.i1402
  %xor31.i115.i1410 = xor i64 %and30.i.i1409, %and.i114.i1408
  %and32.i.i1411 = and i64 %xor13.i110.i1394, %368
  %and34.i.i1412 = and i64 %xor8.i.i1389, %xor27.i.i1407
  %and35.i.i1413 = and i64 %xor16.i111.i1397, %xor12.i.i1393
  %and37.i.i1414 = and i64 %xor15.i.i1396, %xor24.i.i1405
  %and39.i.i1415 = and i64 %xor9.i.i1390, %xor23.i.i1404
  %and40.i.i1416 = and i64 %xor.i108.i1388, %xor25.i.i1406
  %xor41.i.i1417 = xor i64 %and40.i.i1416, %and39.i.i1415
  %and42.i.i1418 = and i64 %xor10.i109.i1391, %xor22.i113.i1403
  %xor43.i116.i1419 = xor i64 %and42.i.i1418, %and39.i.i1415
  %xor44.i.i1420 = xor i64 %xor31.i115.i1410, %xor41.i.i1417
  %xor48.i.i1421 = xor i64 %xor44.i.i1420, %xor20.i.i1401
  %369 = xor i64 %xor10.i109.i1391, %and32.i.i1411
  %370 = xor i64 %369, %xor22.i113.i1403
  %371 = xor i64 %370, %and.i114.i1408
  %xor49.i.i1422 = xor i64 %371, %xor43.i116.i1419
  %372 = xor i64 %xor27.i.i1407, %and35.i.i1413
  %373 = xor i64 %372, %xor8.i.i1389
  %374 = xor i64 %373, %and34.i.i1412
  %xor50.i.i1423 = xor i64 %374, %xor41.i.i1417
  %375 = xor i64 %xor27.i.i1407, %and37.i.i1414
  %376 = xor i64 %375, %361
  %377 = xor i64 %376, %and34.i.i1412
  %xor51.i117.i1424 = xor i64 %377, %xor43.i116.i1419
  %xor52.i.i1425 = xor i64 %xor48.i.i1421, %xor49.i.i1422
  %and53.i.i1426 = and i64 %xor48.i.i1421, %xor50.i.i1423
  %xor54.i.i1427 = xor i64 %xor51.i117.i1424, %and53.i.i1426
  %and55.i.i1428 = and i64 %xor52.i.i1425, %xor54.i.i1427
  %xor56.i.i1429 = xor i64 %and55.i.i1428, %xor49.i.i1422
  %xor57.i.i1430 = xor i64 %xor50.i.i1423, %xor51.i117.i1424
  %xor58.i.i1431 = xor i64 %xor49.i.i1422, %and53.i.i1426
  %and59.i.i1432 = and i64 %xor58.i.i1431, %xor57.i.i1430
  %xor60.i.i1433 = xor i64 %and59.i.i1432, %xor51.i117.i1424
  %xor61.i118.i1434 = xor i64 %xor50.i.i1423, %xor60.i.i1433
  %xor62.i.i1435 = xor i64 %and59.i.i1432, %and53.i.i1426
  %and63.i.i1436 = and i64 %xor51.i117.i1424, %xor62.i.i1435
  %xor64.i.i1437 = xor i64 %and63.i.i1436, %xor61.i118.i1434
  %xor65.i119.i1438 = xor i64 %xor54.i.i1427, %and63.i.i1436
  %and66.i.i1439 = and i64 %xor56.i.i1429, %xor65.i119.i1438
  %xor67.i120.i1440 = xor i64 %xor52.i.i1425, %and66.i.i1439
  %xor68.i.i1441 = xor i64 %xor67.i120.i1440, %xor64.i.i1437
  %xor69.i.i1442 = xor i64 %xor56.i.i1429, %xor60.i.i1433
  %xor70.i.i1443 = xor i64 %xor56.i.i1429, %xor67.i120.i1440
  %xor71.i121.i1444 = xor i64 %and63.i.i1436, %xor50.i.i1423
  %xor72.i.i1445 = xor i64 %xor69.i.i1442, %xor68.i.i1441
  %and73.i.i1446 = and i64 %xor71.i121.i1444, %xor19.i112.i1400
  %and74.i.i1447 = and i64 %xor64.i.i1437, %xor21.i.i1402
  %and75.i.i1448 = and i64 %xor60.i.i1433, %368
  %and76.i.i1449 = and i64 %xor70.i.i1443, %xor27.i.i1407
  %and77.i.i1450 = and i64 %xor67.i120.i1440, %xor12.i.i1393
  %and78.i.i1451 = and i64 %xor56.i.i1429, %xor24.i.i1405
  %and79.i.i1452 = and i64 %xor69.i.i1442, %xor23.i.i1404
  %and80.i.i1453 = and i64 %xor72.i.i1445, %xor25.i.i1406
  %and81.i.i1454 = and i64 %xor68.i.i1441, %xor22.i113.i1403
  %and82.i.i1455 = and i64 %xor71.i121.i1444, %xor14.i.i1395
  %and83.i.i1456 = and i64 %xor64.i.i1437, %xor17.i.i1398
  %and84.i.i1457 = and i64 %xor60.i.i1433, %xor13.i110.i1394
  %and85.i.i1458 = and i64 %xor70.i.i1443, %xor8.i.i1389
  %and86.i.i1459 = and i64 %xor67.i120.i1440, %xor16.i111.i1397
  %and87.i.i1460 = and i64 %xor56.i.i1429, %xor15.i.i1396
  %and88.i.i1461 = and i64 %xor69.i.i1442, %xor9.i.i1390
  %and89.i.i1462 = and i64 %xor72.i.i1445, %xor.i108.i1388
  %and90.i.i1463 = and i64 %xor68.i.i1441, %xor10.i109.i1391
  %xor91.i.i1464 = xor i64 %and88.i.i1461, %and89.i.i1462
  %xor92.i.i1465 = xor i64 %and83.i.i1456, %and84.i.i1457
  %xor93.i.i1466 = xor i64 %and78.i.i1451, %and86.i.i1459
  %xor94.i.i1467 = xor i64 %and82.i.i1455, %and83.i.i1456
  %xor95.i.i1468 = xor i64 %and75.i.i1448, %and85.i.i1458
  %xor96.i.i1469 = xor i64 %and75.i.i1448, %and78.i.i1451
  %xor97.i.i1470 = xor i64 %and80.i.i1453, %and81.i.i1454
  %xor98.i.i1471 = xor i64 %and73.i.i1446, %and76.i.i1449
  %xor99.i.i1472 = xor i64 %and79.i.i1452, %and80.i.i1453
  %xor100.i.i1473 = xor i64 %and89.i.i1462, %and90.i.i1463
  %xor101.i.i1474 = xor i64 %and85.i.i1458, %xor93.i.i1466
  %xor102.i.i1475 = xor i64 %xor95.i.i1468, %xor98.i.i1471
  %xor103.i.i1476 = xor i64 %and77.i.i1450, %xor91.i.i1464
  %xor104.i.i1477 = xor i64 %and76.i.i1449, %xor99.i.i1472
  %xor105.i.i1478 = xor i64 %xor91.i.i1464, %xor102.i.i1475
  %xor106.i.i1479 = xor i64 %and87.i.i1460, %xor102.i.i1475
  %xor107.i.i1480 = xor i64 %xor97.i.i1470, %xor103.i.i1476
  %xor108.i.i1481 = xor i64 %xor94.i.i1467, %xor103.i.i1476
  %xor109.i.i1482 = xor i64 %and77.i.i1450, %xor104.i.i1477
  %xor110.i.i1483 = xor i64 %xor106.i.i1479, %xor107.i.i1480
  %xor111.i.i1484 = xor i64 %and74.i.i1447, %xor108.i.i1481
  %xor112.i.i1485 = xor i64 %xor104.i.i1477, %xor108.i.i1481
  %378 = xor i64 %xor107.i.i1480, %xor101.i.i1474
  %xor113.i.i1486 = xor i64 %378, -1
  %379 = xor i64 %xor105.i.i1478, %xor93.i.i1466
  %xor115.i.i1487 = xor i64 %379, -1
  %xor117.i.i1488 = xor i64 %xor98.i.i1471, %xor111.i.i1484
  %xor118.i.i1489 = xor i64 %xor96.i.i1469, %xor111.i.i1484
  %xor119.i.i1490 = xor i64 %xor92.i.i1465, %xor110.i.i1483
  %380 = xor i64 %xor117.i.i1488, %xor109.i.i1482
  %xor121.i.i1491 = xor i64 %380, -1
  %381 = xor i64 %xor110.i.i1483, %xor100.i.i1473
  %382 = xor i64 %381, %xor109.i.i1482
  %xor123.i.i1492 = xor i64 %382, -1
  %arrayidx124.i.i1493 = getelementptr inbounds nuw i8, ptr %q.i844, i32 56
  store i64 %xor112.i.i1485, ptr %arrayidx124.i.i1493, align 8
  %arrayidx125.i.i1494 = getelementptr inbounds nuw i8, ptr %q.i844, i32 48
  store i64 %xor121.i.i1491, ptr %arrayidx125.i.i1494, align 8
  %arrayidx126.i.i1495 = getelementptr inbounds nuw i8, ptr %q.i844, i32 40
  store i64 %xor123.i.i1492, ptr %arrayidx126.i.i1495, align 8
  %arrayidx127.i.i1496 = getelementptr inbounds nuw i8, ptr %q.i844, i32 32
  store i64 %xor117.i.i1488, ptr %arrayidx127.i.i1496, align 8
  %arrayidx128.i.i1497 = getelementptr inbounds nuw i8, ptr %q.i844, i32 24
  store i64 %xor118.i.i1489, ptr %arrayidx128.i.i1497, align 8
  %arrayidx129.i.i1498 = getelementptr inbounds nuw i8, ptr %q.i844, i32 16
  store i64 %xor119.i.i1490, ptr %arrayidx129.i.i1498, align 8
  %arrayidx130.i.i1499 = getelementptr inbounds nuw i8, ptr %q.i844, i32 8
  store i64 %xor113.i.i1486, ptr %arrayidx130.i.i1499, align 8
  store i64 %xor115.i.i1487, ptr %q.i844, align 8
  br label %for.body.i.i1559

for.body.i.i1559:                                 ; preds = %for.body7.i1380, %for.body.i.i1559
  %i.0.i.i15012009 = phi i32 [ 0, %for.body7.i1380 ], [ %inc.i.i1581, %for.body.i.i1559 ]
  %arrayidx.i.i1560 = getelementptr inbounds nuw i64, ptr %q.i844, i32 %i.0.i.i15012009
  %383 = load i64, ptr %arrayidx.i.i1560, align 8
  %and.i.i1561 = and i64 %383, 65535
  %and1.i.i1562 = lshr i64 %383, 4
  %shr.i1.i1563 = and i64 %and1.i.i1562, 268369920
  %or.i.i1564 = or disjoint i64 %and.i.i1561, %shr.i1.i1563
  %and2.i.i1565 = shl i64 %383, 12
  %shl.i.i1566 = and i64 %and2.i.i1565, 4026531840
  %or3.i.i1567 = or disjoint i64 %or.i.i1564, %shl.i.i1566
  %and4.i.i1568 = lshr i64 %383, 8
  %shr5.i.i1569 = and i64 %and4.i.i1568, 1095216660480
  %or6.i.i1570 = or disjoint i64 %or3.i.i1567, %shr5.i.i1569
  %and7.i.i1571 = shl i64 %383, 8
  %shl8.i.i1572 = and i64 %and7.i.i1571, 280375465082880
  %or9.i.i1573 = or disjoint i64 %or6.i.i1570, %shl8.i.i1572
  %and10.i.i1574 = lshr i64 %383, 12
  %shr11.i.i1575 = and i64 %and10.i.i1574, 4222124650659840
  %or12.i.i1576 = or disjoint i64 %or9.i.i1573, %shr11.i.i1575
  %and13.i.i1577 = shl i64 %383, 4
  %shl14.i.i1578 = and i64 %and13.i.i1577, -4503599627370496
  %or15.i.i1579 = or i64 %or12.i.i1576, %shl14.i.i1578
  %arrayidx16.i.i1580 = getelementptr inbounds nuw i64, ptr %q.i844, i32 %i.0.i.i15012009
  store i64 %or15.i.i1579, ptr %arrayidx16.i.i1580, align 8
  %inc.i.i1581 = add nuw nsw i32 %i.0.i.i15012009, 1
  %exitcond.i.i1502.not = icmp eq i32 %inc.i.i1581, 8
  br i1 %exitcond.i.i1502.not, label %shift_rows.exit.i1503, label %for.body.i.i1559, !llvm.loop !28

shift_rows.exit.i1503:                            ; preds = %for.body.i.i1559
  %384 = load i64, ptr %q.i844, align 8
  %arrayidx1.i96.i1504 = getelementptr inbounds nuw i8, ptr %q.i844, i32 8
  %385 = load i64, ptr %arrayidx1.i96.i1504, align 8
  %arrayidx2.i97.i1505 = getelementptr inbounds nuw i8, ptr %q.i844, i32 16
  %386 = load i64, ptr %arrayidx2.i97.i1505, align 8
  %arrayidx3.i98.i1506 = getelementptr inbounds nuw i8, ptr %q.i844, i32 24
  %387 = load i64, ptr %arrayidx3.i98.i1506, align 8
  %arrayidx4.i.i1507 = getelementptr inbounds nuw i8, ptr %q.i844, i32 32
  %388 = load i64, ptr %arrayidx4.i.i1507, align 8
  %arrayidx5.i99.i1508 = getelementptr inbounds nuw i8, ptr %q.i844, i32 40
  %389 = load i64, ptr %arrayidx5.i99.i1508, align 8
  %arrayidx6.i100.i1509 = getelementptr inbounds nuw i8, ptr %q.i844, i32 48
  %390 = load i64, ptr %arrayidx6.i100.i1509, align 8
  %arrayidx7.i.i1510 = getelementptr inbounds nuw i8, ptr %q.i844, i32 56
  %391 = load i64, ptr %arrayidx7.i.i1510, align 8
  %392 = call i64 @llvm.fshl.i64(i64 %384, i64 %384, i64 48)
  %393 = call i64 @llvm.fshl.i64(i64 %385, i64 %385, i64 48)
  %394 = call i64 @llvm.fshl.i64(i64 %386, i64 %386, i64 48)
  %395 = call i64 @llvm.fshl.i64(i64 %387, i64 %387, i64 48)
  %396 = call i64 @llvm.fshl.i64(i64 %388, i64 %388, i64 48)
  %397 = call i64 @llvm.fshl.i64(i64 %389, i64 %389, i64 48)
  %398 = call i64 @llvm.fshl.i64(i64 %390, i64 %390, i64 48)
  %399 = call i64 @llvm.fshl.i64(i64 %391, i64 %391, i64 48)
  %xor30.i.i1511 = xor i64 %384, %392
  %400 = call i64 @llvm.fshl.i64(i64 %xor30.i.i1511, i64 %xor30.i.i1511, i64 32)
  %401 = xor i64 %399, %400
  %402 = xor i64 %401, %391
  %xor31.i.i1512 = xor i64 %402, %392
  store i64 %xor31.i.i1512, ptr %q.i844, align 8
  %xor37.i.i1513 = xor i64 %385, %393
  %403 = call i64 @llvm.fshl.i64(i64 %xor37.i.i1513, i64 %xor37.i.i1513, i64 32)
  %404 = xor i64 %392, %403
  %405 = xor i64 %404, %384
  %406 = xor i64 %405, %391
  %407 = xor i64 %406, %399
  %xor39.i.i1514 = xor i64 %407, %393
  %arrayidx40.i.i1515 = getelementptr inbounds nuw i8, ptr %q.i844, i32 8
  store i64 %xor39.i.i1514, ptr %arrayidx40.i.i1515, align 8
  %xor43.i.i1516 = xor i64 %386, %394
  %408 = call i64 @llvm.fshl.i64(i64 %xor43.i.i1516, i64 %xor43.i.i1516, i64 32)
  %409 = xor i64 %393, %408
  %410 = xor i64 %409, %385
  %xor45.i.i1517 = xor i64 %410, %394
  %arrayidx46.i.i1518 = getelementptr inbounds nuw i8, ptr %q.i844, i32 16
  store i64 %xor45.i.i1517, ptr %arrayidx46.i.i1518, align 8
  %xor51.i.i1519 = xor i64 %387, %395
  %411 = call i64 @llvm.fshl.i64(i64 %xor51.i.i1519, i64 %xor51.i.i1519, i64 32)
  %412 = xor i64 %394, %411
  %413 = xor i64 %412, %386
  %414 = xor i64 %413, %391
  %415 = xor i64 %414, %399
  %xor53.i.i1520 = xor i64 %415, %395
  %arrayidx54.i.i1521 = getelementptr inbounds nuw i8, ptr %q.i844, i32 24
  store i64 %xor53.i.i1520, ptr %arrayidx54.i.i1521, align 8
  %xor59.i.i1522 = xor i64 %388, %396
  %416 = call i64 @llvm.fshl.i64(i64 %xor59.i.i1522, i64 %xor59.i.i1522, i64 32)
  %417 = xor i64 %395, %416
  %418 = xor i64 %417, %387
  %419 = xor i64 %418, %391
  %420 = xor i64 %419, %399
  %xor61.i.i1523 = xor i64 %420, %396
  %arrayidx62.i.i1524 = getelementptr inbounds nuw i8, ptr %q.i844, i32 32
  store i64 %xor61.i.i1523, ptr %arrayidx62.i.i1524, align 8
  %xor65.i.i1525 = xor i64 %389, %397
  %421 = call i64 @llvm.fshl.i64(i64 %xor65.i.i1525, i64 %xor65.i.i1525, i64 32)
  %422 = xor i64 %396, %421
  %423 = xor i64 %422, %388
  %xor67.i.i1526 = xor i64 %423, %397
  %arrayidx68.i.i1527 = getelementptr inbounds nuw i8, ptr %q.i844, i32 40
  store i64 %xor67.i.i1526, ptr %arrayidx68.i.i1527, align 8
  %xor71.i.i1528 = xor i64 %390, %398
  %424 = call i64 @llvm.fshl.i64(i64 %xor71.i.i1528, i64 %xor71.i.i1528, i64 32)
  %425 = xor i64 %397, %424
  %426 = xor i64 %425, %389
  %xor73.i.i1529 = xor i64 %426, %398
  %arrayidx74.i.i1530 = getelementptr inbounds nuw i8, ptr %q.i844, i32 48
  store i64 %xor73.i.i1529, ptr %arrayidx74.i.i1530, align 8
  %xor77.i.i1531 = xor i64 %391, %399
  %427 = call i64 @llvm.fshl.i64(i64 %xor77.i.i1531, i64 %xor77.i.i1531, i64 32)
  %428 = xor i64 %398, %427
  %429 = xor i64 %428, %390
  %xor79.i.i1532 = xor i64 %429, %399
  %arrayidx80.i.i1533 = getelementptr inbounds nuw i8, ptr %q.i844, i32 56
  store i64 %xor79.i.i1532, ptr %arrayidx80.i.i1533, align 8
  %add.ptr13.idx.i1534 = shl nuw nsw i32 %i.1.i10112010, 6
  %add.ptr13.i1535 = getelementptr inbounds nuw i8, ptr %308, i32 %add.ptr13.idx.i1534
  %430 = load i64, ptr %add.ptr13.i1535, align 8
  %431 = load i64, ptr %q.i844, align 8
  %xor.i52.i1536 = xor i64 %431, %430
  store i64 %xor.i52.i1536, ptr %q.i844, align 8
  %arrayidx2.i53.i1537 = getelementptr inbounds nuw i8, ptr %add.ptr13.i1535, i32 8
  %432 = load i64, ptr %arrayidx2.i53.i1537, align 8
  %arrayidx3.i54.i1538 = getelementptr inbounds nuw i8, ptr %q.i844, i32 8
  %433 = load i64, ptr %arrayidx3.i54.i1538, align 8
  %xor4.i55.i1539 = xor i64 %433, %432
  store i64 %xor4.i55.i1539, ptr %arrayidx3.i54.i1538, align 8
  %arrayidx5.i56.i1540 = getelementptr inbounds nuw i8, ptr %add.ptr13.i1535, i32 16
  %434 = load i64, ptr %arrayidx5.i56.i1540, align 8
  %arrayidx6.i57.i1541 = getelementptr inbounds nuw i8, ptr %q.i844, i32 16
  %435 = load i64, ptr %arrayidx6.i57.i1541, align 8
  %xor7.i58.i1542 = xor i64 %435, %434
  store i64 %xor7.i58.i1542, ptr %arrayidx6.i57.i1541, align 8
  %arrayidx8.i59.i1543 = getelementptr inbounds nuw i8, ptr %add.ptr13.i1535, i32 24
  %436 = load i64, ptr %arrayidx8.i59.i1543, align 8
  %arrayidx9.i60.i1544 = getelementptr inbounds nuw i8, ptr %q.i844, i32 24
  %437 = load i64, ptr %arrayidx9.i60.i1544, align 8
  %xor10.i61.i1545 = xor i64 %437, %436
  store i64 %xor10.i61.i1545, ptr %arrayidx9.i60.i1544, align 8
  %arrayidx11.i62.i1546 = getelementptr inbounds nuw i8, ptr %add.ptr13.i1535, i32 32
  %438 = load i64, ptr %arrayidx11.i62.i1546, align 8
  %arrayidx12.i63.i1547 = getelementptr inbounds nuw i8, ptr %q.i844, i32 32
  %439 = load i64, ptr %arrayidx12.i63.i1547, align 8
  %xor13.i64.i1548 = xor i64 %439, %438
  store i64 %xor13.i64.i1548, ptr %arrayidx12.i63.i1547, align 8
  %arrayidx14.i65.i1549 = getelementptr inbounds nuw i8, ptr %add.ptr13.i1535, i32 40
  %440 = load i64, ptr %arrayidx14.i65.i1549, align 8
  %arrayidx15.i66.i1550 = getelementptr inbounds nuw i8, ptr %q.i844, i32 40
  %441 = load i64, ptr %arrayidx15.i66.i1550, align 8
  %xor16.i67.i1551 = xor i64 %441, %440
  store i64 %xor16.i67.i1551, ptr %arrayidx15.i66.i1550, align 8
  %arrayidx17.i68.i1552 = getelementptr inbounds nuw i8, ptr %add.ptr13.i1535, i32 48
  %442 = load i64, ptr %arrayidx17.i68.i1552, align 8
  %arrayidx18.i69.i1553 = getelementptr inbounds nuw i8, ptr %q.i844, i32 48
  %443 = load i64, ptr %arrayidx18.i69.i1553, align 8
  %xor19.i70.i1554 = xor i64 %443, %442
  store i64 %xor19.i70.i1554, ptr %arrayidx18.i69.i1553, align 8
  %arrayidx20.i71.i1555 = getelementptr inbounds nuw i8, ptr %add.ptr13.i1535, i32 56
  %444 = load i64, ptr %arrayidx20.i71.i1555, align 8
  %arrayidx21.i72.i1556 = getelementptr inbounds nuw i8, ptr %q.i844, i32 56
  %445 = load i64, ptr %arrayidx21.i72.i1556, align 8
  %xor22.i73.i1557 = xor i64 %445, %444
  store i64 %xor22.i73.i1557, ptr %arrayidx21.i72.i1556, align 8
  %inc15.i1558 = add nuw nsw i32 %i.1.i10112010, 1
  %exitcond1.i1012.not = icmp eq i32 %inc15.i1558, 10
  br i1 %exitcond1.i1012.not, label %for.end16.i1013, label %for.body7.i1380, !llvm.loop !29

for.end16.i1013:                                  ; preds = %shift_rows.exit.i1503
  %arrayidx.i122.i1014 = getelementptr inbounds nuw i8, ptr %q.i844, i32 56
  %446 = load i64, ptr %arrayidx.i122.i1014, align 8
  %arrayidx1.i123.i1015 = getelementptr inbounds nuw i8, ptr %q.i844, i32 48
  %447 = load i64, ptr %arrayidx1.i123.i1015, align 8
  %arrayidx2.i124.i1016 = getelementptr inbounds nuw i8, ptr %q.i844, i32 40
  %448 = load i64, ptr %arrayidx2.i124.i1016, align 8
  %arrayidx3.i125.i1017 = getelementptr inbounds nuw i8, ptr %q.i844, i32 32
  %449 = load i64, ptr %arrayidx3.i125.i1017, align 8
  %arrayidx4.i126.i1018 = getelementptr inbounds nuw i8, ptr %q.i844, i32 24
  %450 = load i64, ptr %arrayidx4.i126.i1018, align 8
  %arrayidx5.i127.i1019 = getelementptr inbounds nuw i8, ptr %q.i844, i32 16
  %451 = load i64, ptr %arrayidx5.i127.i1019, align 8
  %arrayidx6.i128.i1020 = getelementptr inbounds nuw i8, ptr %q.i844, i32 8
  %452 = load i64, ptr %arrayidx6.i128.i1020, align 8
  %453 = load i64, ptr %q.i844, align 8
  %xor.i129.i1021 = xor i64 %449, %451
  %xor8.i130.i1022 = xor i64 %446, %452
  %xor9.i131.i1023 = xor i64 %446, %449
  %xor10.i132.i1024 = xor i64 %446, %451
  %xor11.i133.i1025 = xor i64 %447, %448
  %xor12.i134.i1026 = xor i64 %xor11.i133.i1025, %453
  %xor13.i135.i1027 = xor i64 %xor12.i134.i1026, %449
  %xor14.i136.i1028 = xor i64 %xor8.i130.i1022, %xor.i129.i1021
  %xor15.i137.i1029 = xor i64 %xor12.i134.i1026, %446
  %xor16.i138.i1030 = xor i64 %xor12.i134.i1026, %452
  %xor17.i139.i1031 = xor i64 %xor16.i138.i1030, %xor10.i132.i1024
  %xor18.i140.i1032 = xor i64 %450, %xor14.i136.i1028
  %xor19.i141.i1033 = xor i64 %xor18.i140.i1032, %451
  %xor20.i142.i1034 = xor i64 %xor18.i140.i1032, %447
  %xor21.i143.i1035 = xor i64 %xor19.i141.i1033, %453
  %xor22.i144.i1036 = xor i64 %xor19.i141.i1033, %xor11.i133.i1025
  %xor23.i145.i1037 = xor i64 %xor20.i142.i1034, %xor9.i131.i1023
  %xor24.i146.i1038 = xor i64 %453, %xor23.i145.i1037
  %xor25.i147.i1039 = xor i64 %xor22.i144.i1036, %xor23.i145.i1037
  %xor27.i148.i1040 = xor i64 %xor11.i133.i1025, %xor23.i145.i1037
  %and.i149.i1041 = and i64 %xor14.i136.i1028, %xor19.i141.i1033
  %and30.i150.i1042 = and i64 %xor17.i139.i1031, %xor21.i143.i1035
  %xor31.i151.i1043 = xor i64 %and30.i150.i1042, %and.i149.i1041
  %and32.i152.i1044 = and i64 %xor13.i135.i1027, %453
  %and34.i153.i1045 = and i64 %xor8.i130.i1022, %xor27.i148.i1040
  %and35.i154.i1046 = and i64 %xor16.i138.i1030, %xor12.i134.i1026
  %and37.i155.i1047 = and i64 %xor15.i137.i1029, %xor24.i146.i1038
  %and39.i156.i1048 = and i64 %xor9.i131.i1023, %xor23.i145.i1037
  %and40.i157.i1049 = and i64 %xor.i129.i1021, %xor25.i147.i1039
  %xor41.i158.i1050 = xor i64 %and40.i157.i1049, %and39.i156.i1048
  %and42.i159.i1051 = and i64 %xor10.i132.i1024, %xor22.i144.i1036
  %xor43.i160.i1052 = xor i64 %and42.i159.i1051, %and39.i156.i1048
  %xor44.i161.i1053 = xor i64 %xor31.i151.i1043, %xor41.i158.i1050
  %xor48.i162.i1054 = xor i64 %xor44.i161.i1053, %xor20.i142.i1034
  %454 = xor i64 %xor10.i132.i1024, %and32.i152.i1044
  %455 = xor i64 %454, %xor22.i144.i1036
  %456 = xor i64 %455, %and.i149.i1041
  %xor49.i163.i1055 = xor i64 %456, %xor43.i160.i1052
  %457 = xor i64 %xor27.i148.i1040, %and35.i154.i1046
  %458 = xor i64 %457, %xor8.i130.i1022
  %459 = xor i64 %458, %and34.i153.i1045
  %xor50.i164.i1056 = xor i64 %459, %xor41.i158.i1050
  %460 = xor i64 %xor27.i148.i1040, %and37.i155.i1047
  %461 = xor i64 %460, %446
  %462 = xor i64 %461, %and34.i153.i1045
  %xor51.i165.i1057 = xor i64 %462, %xor43.i160.i1052
  %xor52.i166.i1058 = xor i64 %xor48.i162.i1054, %xor49.i163.i1055
  %and53.i167.i1059 = and i64 %xor48.i162.i1054, %xor50.i164.i1056
  %xor54.i168.i1060 = xor i64 %xor51.i165.i1057, %and53.i167.i1059
  %and55.i169.i1061 = and i64 %xor52.i166.i1058, %xor54.i168.i1060
  %xor56.i170.i1062 = xor i64 %and55.i169.i1061, %xor49.i163.i1055
  %xor57.i171.i1063 = xor i64 %xor50.i164.i1056, %xor51.i165.i1057
  %xor58.i172.i1064 = xor i64 %xor49.i163.i1055, %and53.i167.i1059
  %and59.i173.i1065 = and i64 %xor58.i172.i1064, %xor57.i171.i1063
  %xor60.i174.i1066 = xor i64 %and59.i173.i1065, %xor51.i165.i1057
  %xor61.i175.i1067 = xor i64 %xor50.i164.i1056, %xor60.i174.i1066
  %xor62.i176.i1068 = xor i64 %and59.i173.i1065, %and53.i167.i1059
  %and63.i177.i1069 = and i64 %xor51.i165.i1057, %xor62.i176.i1068
  %xor64.i178.i1070 = xor i64 %and63.i177.i1069, %xor61.i175.i1067
  %xor65.i179.i1071 = xor i64 %xor54.i168.i1060, %and63.i177.i1069
  %and66.i180.i1072 = and i64 %xor56.i170.i1062, %xor65.i179.i1071
  %xor67.i181.i1073 = xor i64 %xor52.i166.i1058, %and66.i180.i1072
  %xor68.i182.i1074 = xor i64 %xor67.i181.i1073, %xor64.i178.i1070
  %xor69.i183.i1075 = xor i64 %xor56.i170.i1062, %xor60.i174.i1066
  %xor70.i184.i1076 = xor i64 %xor56.i170.i1062, %xor67.i181.i1073
  %xor71.i185.i1077 = xor i64 %and63.i177.i1069, %xor50.i164.i1056
  %xor72.i186.i1078 = xor i64 %xor69.i183.i1075, %xor68.i182.i1074
  %and73.i187.i1079 = and i64 %xor71.i185.i1077, %xor19.i141.i1033
  %and74.i188.i1080 = and i64 %xor64.i178.i1070, %xor21.i143.i1035
  %and75.i189.i1081 = and i64 %xor60.i174.i1066, %453
  %and76.i190.i1082 = and i64 %xor70.i184.i1076, %xor27.i148.i1040
  %and77.i191.i1083 = and i64 %xor67.i181.i1073, %xor12.i134.i1026
  %and78.i192.i1084 = and i64 %xor56.i170.i1062, %xor24.i146.i1038
  %and79.i193.i1085 = and i64 %xor69.i183.i1075, %xor23.i145.i1037
  %and80.i194.i1086 = and i64 %xor72.i186.i1078, %xor25.i147.i1039
  %and81.i195.i1087 = and i64 %xor68.i182.i1074, %xor22.i144.i1036
  %and82.i196.i1088 = and i64 %xor71.i185.i1077, %xor14.i136.i1028
  %and83.i197.i1089 = and i64 %xor64.i178.i1070, %xor17.i139.i1031
  %and84.i198.i1090 = and i64 %xor60.i174.i1066, %xor13.i135.i1027
  %and85.i199.i1091 = and i64 %xor70.i184.i1076, %xor8.i130.i1022
  %and86.i200.i1092 = and i64 %xor67.i181.i1073, %xor16.i138.i1030
  %and87.i201.i1093 = and i64 %xor56.i170.i1062, %xor15.i137.i1029
  %and88.i202.i1094 = and i64 %xor69.i183.i1075, %xor9.i131.i1023
  %and89.i203.i1095 = and i64 %xor72.i186.i1078, %xor.i129.i1021
  %and90.i204.i1096 = and i64 %xor68.i182.i1074, %xor10.i132.i1024
  %xor91.i205.i1097 = xor i64 %and88.i202.i1094, %and89.i203.i1095
  %xor92.i206.i1098 = xor i64 %and83.i197.i1089, %and84.i198.i1090
  %xor93.i207.i1099 = xor i64 %and78.i192.i1084, %and86.i200.i1092
  %xor94.i208.i1100 = xor i64 %and82.i196.i1088, %and83.i197.i1089
  %xor95.i209.i1101 = xor i64 %and75.i189.i1081, %and85.i199.i1091
  %xor96.i210.i1102 = xor i64 %and75.i189.i1081, %and78.i192.i1084
  %xor97.i211.i1103 = xor i64 %and80.i194.i1086, %and81.i195.i1087
  %xor98.i212.i1104 = xor i64 %and73.i187.i1079, %and76.i190.i1082
  %xor99.i213.i1105 = xor i64 %and79.i193.i1085, %and80.i194.i1086
  %xor100.i214.i1106 = xor i64 %and89.i203.i1095, %and90.i204.i1096
  %xor101.i215.i1107 = xor i64 %and85.i199.i1091, %xor93.i207.i1099
  %xor102.i216.i1108 = xor i64 %xor95.i209.i1101, %xor98.i212.i1104
  %xor103.i217.i1109 = xor i64 %and77.i191.i1083, %xor91.i205.i1097
  %xor104.i218.i1110 = xor i64 %and76.i190.i1082, %xor99.i213.i1105
  %xor105.i219.i1111 = xor i64 %xor91.i205.i1097, %xor102.i216.i1108
  %xor106.i220.i1112 = xor i64 %and87.i201.i1093, %xor102.i216.i1108
  %xor107.i221.i1113 = xor i64 %xor97.i211.i1103, %xor103.i217.i1109
  %xor108.i222.i1114 = xor i64 %xor94.i208.i1100, %xor103.i217.i1109
  %xor109.i223.i1115 = xor i64 %and77.i191.i1083, %xor104.i218.i1110
  %xor110.i224.i1116 = xor i64 %xor106.i220.i1112, %xor107.i221.i1113
  %xor111.i225.i1117 = xor i64 %and74.i188.i1080, %xor108.i222.i1114
  %xor112.i226.i1118 = xor i64 %xor104.i218.i1110, %xor108.i222.i1114
  %463 = xor i64 %xor107.i221.i1113, %xor101.i215.i1107
  %xor113.i227.i1119 = xor i64 %463, -1
  %464 = xor i64 %xor105.i219.i1111, %xor93.i207.i1099
  %xor115.i228.i1120 = xor i64 %464, -1
  %xor117.i229.i1121 = xor i64 %xor98.i212.i1104, %xor111.i225.i1117
  %xor118.i230.i1122 = xor i64 %xor96.i210.i1102, %xor111.i225.i1117
  %xor119.i231.i1123 = xor i64 %xor92.i206.i1098, %xor110.i224.i1116
  %465 = xor i64 %xor117.i229.i1121, %xor109.i223.i1115
  %xor121.i232.i1124 = xor i64 %465, -1
  %466 = xor i64 %xor110.i224.i1116, %xor100.i214.i1106
  %467 = xor i64 %466, %xor109.i223.i1115
  %xor123.i233.i1125 = xor i64 %467, -1
  %arrayidx124.i234.i1126 = getelementptr inbounds nuw i8, ptr %q.i844, i32 56
  store i64 %xor112.i226.i1118, ptr %arrayidx124.i234.i1126, align 8
  %arrayidx125.i235.i1127 = getelementptr inbounds nuw i8, ptr %q.i844, i32 48
  store i64 %xor121.i232.i1124, ptr %arrayidx125.i235.i1127, align 8
  %arrayidx126.i236.i1128 = getelementptr inbounds nuw i8, ptr %q.i844, i32 40
  store i64 %xor123.i233.i1125, ptr %arrayidx126.i236.i1128, align 8
  %arrayidx127.i237.i1129 = getelementptr inbounds nuw i8, ptr %q.i844, i32 32
  store i64 %xor117.i229.i1121, ptr %arrayidx127.i237.i1129, align 8
  %arrayidx128.i238.i1130 = getelementptr inbounds nuw i8, ptr %q.i844, i32 24
  store i64 %xor118.i230.i1122, ptr %arrayidx128.i238.i1130, align 8
  %arrayidx129.i239.i1131 = getelementptr inbounds nuw i8, ptr %q.i844, i32 16
  store i64 %xor119.i231.i1123, ptr %arrayidx129.i239.i1131, align 8
  %arrayidx130.i240.i1132 = getelementptr inbounds nuw i8, ptr %q.i844, i32 8
  store i64 %xor113.i227.i1119, ptr %arrayidx130.i240.i1132, align 8
  store i64 %xor115.i228.i1120, ptr %q.i844, align 8
  br label %for.body.i5.i1357

for.body.i5.i1357:                                ; preds = %for.end16.i1013, %for.body.i5.i1357
  %i.0.i3.i11342011 = phi i32 [ 0, %for.end16.i1013 ], [ %inc.i27.i1379, %for.body.i5.i1357 ]
  %arrayidx.i6.i1358 = getelementptr inbounds nuw i64, ptr %q.i844, i32 %i.0.i3.i11342011
  %468 = load i64, ptr %arrayidx.i6.i1358, align 8
  %and.i7.i1359 = and i64 %468, 65535
  %and1.i8.i1360 = lshr i64 %468, 4
  %shr.i9.i1361 = and i64 %and1.i8.i1360, 268369920
  %or.i10.i1362 = or disjoint i64 %and.i7.i1359, %shr.i9.i1361
  %and2.i11.i1363 = shl i64 %468, 12
  %shl.i12.i1364 = and i64 %and2.i11.i1363, 4026531840
  %or3.i13.i1365 = or disjoint i64 %or.i10.i1362, %shl.i12.i1364
  %and4.i14.i1366 = lshr i64 %468, 8
  %shr5.i15.i1367 = and i64 %and4.i14.i1366, 1095216660480
  %or6.i16.i1368 = or disjoint i64 %or3.i13.i1365, %shr5.i15.i1367
  %and7.i17.i1369 = shl i64 %468, 8
  %shl8.i18.i1370 = and i64 %and7.i17.i1369, 280375465082880
  %or9.i19.i1371 = or disjoint i64 %or6.i16.i1368, %shl8.i18.i1370
  %and10.i20.i1372 = lshr i64 %468, 12
  %shr11.i21.i1373 = and i64 %and10.i20.i1372, 4222124650659840
  %or12.i22.i1374 = or disjoint i64 %or9.i19.i1371, %shr11.i21.i1373
  %and13.i23.i1375 = shl i64 %468, 4
  %shl14.i24.i1376 = and i64 %and13.i23.i1375, -4503599627370496
  %or15.i25.i1377 = or i64 %or12.i22.i1374, %shl14.i24.i1376
  %arrayidx16.i26.i1378 = getelementptr inbounds nuw i64, ptr %q.i844, i32 %i.0.i3.i11342011
  store i64 %or15.i25.i1377, ptr %arrayidx16.i26.i1378, align 8
  %inc.i27.i1379 = add nuw nsw i32 %i.0.i3.i11342011, 1
  %exitcond.i4.i1135.not = icmp eq i32 %inc.i27.i1379, 8
  br i1 %exitcond.i4.i1135.not, label %shift_rows.exit28.i1136, label %for.body.i5.i1357, !llvm.loop !30

shift_rows.exit28.i1136:                          ; preds = %for.body.i5.i1357
  %add.ptr20.i1137 = getelementptr inbounds nuw i8, ptr %308, i32 640
  %469 = load i64, ptr %add.ptr20.i1137, align 8
  %470 = load i64, ptr %q.i844, align 8
  %xor.i74.i1138 = xor i64 %470, %469
  store i64 %xor.i74.i1138, ptr %q.i844, align 8
  %arrayidx2.i75.i1139 = getelementptr inbounds nuw i8, ptr %308, i32 648
  %471 = load i64, ptr %arrayidx2.i75.i1139, align 8
  %arrayidx3.i76.i1140 = getelementptr inbounds nuw i8, ptr %q.i844, i32 8
  %472 = load i64, ptr %arrayidx3.i76.i1140, align 8
  %xor4.i77.i1141 = xor i64 %472, %471
  store i64 %xor4.i77.i1141, ptr %arrayidx3.i76.i1140, align 8
  %arrayidx5.i78.i1142 = getelementptr inbounds nuw i8, ptr %308, i32 656
  %473 = load i64, ptr %arrayidx5.i78.i1142, align 8
  %arrayidx6.i79.i1143 = getelementptr inbounds nuw i8, ptr %q.i844, i32 16
  %474 = load i64, ptr %arrayidx6.i79.i1143, align 8
  %xor7.i80.i1144 = xor i64 %474, %473
  store i64 %xor7.i80.i1144, ptr %arrayidx6.i79.i1143, align 8
  %arrayidx8.i81.i1145 = getelementptr inbounds nuw i8, ptr %308, i32 664
  %475 = load i64, ptr %arrayidx8.i81.i1145, align 8
  %arrayidx9.i82.i1146 = getelementptr inbounds nuw i8, ptr %q.i844, i32 24
  %476 = load i64, ptr %arrayidx9.i82.i1146, align 8
  %xor10.i83.i1147 = xor i64 %476, %475
  store i64 %xor10.i83.i1147, ptr %arrayidx9.i82.i1146, align 8
  %arrayidx11.i84.i1148 = getelementptr inbounds nuw i8, ptr %308, i32 672
  %477 = load i64, ptr %arrayidx11.i84.i1148, align 8
  %arrayidx12.i85.i1149 = getelementptr inbounds nuw i8, ptr %q.i844, i32 32
  %478 = load i64, ptr %arrayidx12.i85.i1149, align 8
  %xor13.i86.i1150 = xor i64 %478, %477
  store i64 %xor13.i86.i1150, ptr %arrayidx12.i85.i1149, align 8
  %arrayidx14.i87.i1151 = getelementptr inbounds nuw i8, ptr %308, i32 680
  %479 = load i64, ptr %arrayidx14.i87.i1151, align 8
  %arrayidx15.i88.i1152 = getelementptr inbounds nuw i8, ptr %q.i844, i32 40
  %480 = load i64, ptr %arrayidx15.i88.i1152, align 8
  %xor16.i89.i1153 = xor i64 %480, %479
  store i64 %xor16.i89.i1153, ptr %arrayidx15.i88.i1152, align 8
  %arrayidx17.i90.i1154 = getelementptr inbounds nuw i8, ptr %308, i32 688
  %481 = load i64, ptr %arrayidx17.i90.i1154, align 8
  %arrayidx18.i91.i1155 = getelementptr inbounds nuw i8, ptr %q.i844, i32 48
  %482 = load i64, ptr %arrayidx18.i91.i1155, align 8
  %xor19.i92.i1156 = xor i64 %482, %481
  store i64 %xor19.i92.i1156, ptr %arrayidx18.i91.i1155, align 8
  %arrayidx20.i93.i1157 = getelementptr inbounds nuw i8, ptr %308, i32 696
  %483 = load i64, ptr %arrayidx20.i93.i1157, align 8
  %arrayidx21.i94.i1158 = getelementptr inbounds nuw i8, ptr %q.i844, i32 56
  %484 = load i64, ptr %arrayidx21.i94.i1158, align 8
  %xor22.i95.i1159 = xor i64 %484, %483
  store i64 %xor22.i95.i1159, ptr %arrayidx21.i94.i1158, align 8
  %485 = load i64, ptr %q.i844, align 8
  %arrayidx1.i241.i1160 = getelementptr inbounds nuw i8, ptr %q.i844, i32 8
  %486 = load i64, ptr %arrayidx1.i241.i1160, align 8
  %and.i242.i1161 = and i64 %485, 6148914691236517205
  %and2.i243.i1162 = shl i64 %486, 1
  %shl.i244.i1163 = and i64 %and2.i243.i1162, -6148914691236517206
  %or.i245.i1164 = or disjoint i64 %and.i242.i1161, %shl.i244.i1163
  store i64 %or.i245.i1164, ptr %q.i844, align 8
  %and4.i246.i1165 = lshr i64 %485, 1
  %shr.i247.i1166 = and i64 %and4.i246.i1165, 6148914691236517205
  %and5.i.i1167 = and i64 %486, -6148914691236517206
  %or6.i248.i1168 = or disjoint i64 %shr.i247.i1166, %and5.i.i1167
  %arrayidx7.i249.i1169 = getelementptr inbounds nuw i8, ptr %q.i844, i32 8
  store i64 %or6.i248.i1168, ptr %arrayidx7.i249.i1169, align 8
  %arrayidx11.i250.i1170 = getelementptr inbounds nuw i8, ptr %q.i844, i32 16
  %487 = load i64, ptr %arrayidx11.i250.i1170, align 8
  %arrayidx12.i251.i1171 = getelementptr inbounds nuw i8, ptr %q.i844, i32 24
  %488 = load i64, ptr %arrayidx12.i251.i1171, align 8
  %and13.i252.i1172 = and i64 %487, 6148914691236517205
  %and14.i253.i1173 = shl i64 %488, 1
  %shl15.i.i1174 = and i64 %and14.i253.i1173, -6148914691236517206
  %or16.i.i1175 = or disjoint i64 %and13.i252.i1172, %shl15.i.i1174
  %arrayidx17.i254.i1176 = getelementptr inbounds nuw i8, ptr %q.i844, i32 16
  store i64 %or16.i.i1175, ptr %arrayidx17.i254.i1176, align 8
  %and18.i.i1177 = lshr i64 %487, 1
  %shr19.i.i1178 = and i64 %and18.i.i1177, 6148914691236517205
  %and20.i.i1179 = and i64 %488, -6148914691236517206
  %or21.i.i1180 = or disjoint i64 %shr19.i.i1178, %and20.i.i1179
  %arrayidx22.i.i1181 = getelementptr inbounds nuw i8, ptr %q.i844, i32 24
  store i64 %or21.i.i1180, ptr %arrayidx22.i.i1181, align 8
  %arrayidx27.i.i1182 = getelementptr inbounds nuw i8, ptr %q.i844, i32 32
  %489 = load i64, ptr %arrayidx27.i.i1182, align 8
  %arrayidx28.i255.i1183 = getelementptr inbounds nuw i8, ptr %q.i844, i32 40
  %490 = load i64, ptr %arrayidx28.i255.i1183, align 8
  %and29.i.i1184 = and i64 %489, 6148914691236517205
  %and30.i256.i1185 = shl i64 %490, 1
  %shl31.i.i1186 = and i64 %and30.i256.i1185, -6148914691236517206
  %or32.i257.i1187 = or disjoint i64 %and29.i.i1184, %shl31.i.i1186
  %arrayidx33.i258.i1188 = getelementptr inbounds nuw i8, ptr %q.i844, i32 32
  store i64 %or32.i257.i1187, ptr %arrayidx33.i258.i1188, align 8
  %and34.i259.i1189 = lshr i64 %489, 1
  %shr35.i.i1190 = and i64 %and34.i259.i1189, 6148914691236517205
  %and36.i.i1191 = and i64 %490, -6148914691236517206
  %or37.i.i1192 = or disjoint i64 %shr35.i.i1190, %and36.i.i1191
  %arrayidx38.i.i1193 = getelementptr inbounds nuw i8, ptr %q.i844, i32 40
  store i64 %or37.i.i1192, ptr %arrayidx38.i.i1193, align 8
  %arrayidx43.i.i1194 = getelementptr inbounds nuw i8, ptr %q.i844, i32 48
  %491 = load i64, ptr %arrayidx43.i.i1194, align 8
  %arrayidx44.i.i1195 = getelementptr inbounds nuw i8, ptr %q.i844, i32 56
  %492 = load i64, ptr %arrayidx44.i.i1195, align 8
  %and45.i.i1196 = and i64 %491, 6148914691236517205
  %and46.i.i1197 = shl i64 %492, 1
  %shl47.i.i1198 = and i64 %and46.i.i1197, -6148914691236517206
  %or48.i.i1199 = or disjoint i64 %and45.i.i1196, %shl47.i.i1198
  %arrayidx49.i.i1200 = getelementptr inbounds nuw i8, ptr %q.i844, i32 48
  store i64 %or48.i.i1199, ptr %arrayidx49.i.i1200, align 8
  %and50.i.i1201 = lshr i64 %491, 1
  %shr51.i.i1202 = and i64 %and50.i.i1201, 6148914691236517205
  %and52.i.i1203 = and i64 %492, -6148914691236517206
  %or53.i.i1204 = or disjoint i64 %shr51.i.i1202, %and52.i.i1203
  %arrayidx54.i260.i1205 = getelementptr inbounds nuw i8, ptr %q.i844, i32 56
  store i64 %or53.i.i1204, ptr %arrayidx54.i260.i1205, align 8
  %493 = load i64, ptr %q.i844, align 8
  %arrayidx60.i.i1206 = getelementptr inbounds nuw i8, ptr %q.i844, i32 16
  %494 = load i64, ptr %arrayidx60.i.i1206, align 8
  %and61.i.i1207 = and i64 %493, 3689348814741910323
  %and62.i.i1208 = shl i64 %494, 2
  %shl63.i.i1209 = and i64 %and62.i.i1208, -3689348814741910324
  %or64.i.i1210 = or disjoint i64 %and61.i.i1207, %shl63.i.i1209
  store i64 %or64.i.i1210, ptr %q.i844, align 8
  %and66.i261.i1211 = lshr i64 %493, 2
  %shr67.i.i1212 = and i64 %and66.i261.i1211, 3689348814741910323
  %and68.i.i1213 = and i64 %494, -3689348814741910324
  %or69.i.i1214 = or disjoint i64 %shr67.i.i1212, %and68.i.i1213
  %arrayidx70.i.i1215 = getelementptr inbounds nuw i8, ptr %q.i844, i32 16
  store i64 %or69.i.i1214, ptr %arrayidx70.i.i1215, align 8
  %arrayidx75.i.i1216 = getelementptr inbounds nuw i8, ptr %q.i844, i32 8
  %495 = load i64, ptr %arrayidx75.i.i1216, align 8
  %arrayidx76.i.i1217 = getelementptr inbounds nuw i8, ptr %q.i844, i32 24
  %496 = load i64, ptr %arrayidx76.i.i1217, align 8
  %and77.i262.i1218 = and i64 %495, 3689348814741910323
  %and78.i263.i1219 = shl i64 %496, 2
  %shl79.i.i1220 = and i64 %and78.i263.i1219, -3689348814741910324
  %or80.i.i1221 = or disjoint i64 %and77.i262.i1218, %shl79.i.i1220
  %arrayidx81.i.i1222 = getelementptr inbounds nuw i8, ptr %q.i844, i32 8
  store i64 %or80.i.i1221, ptr %arrayidx81.i.i1222, align 8
  %and82.i264.i1223 = lshr i64 %495, 2
  %shr83.i.i1224 = and i64 %and82.i264.i1223, 3689348814741910323
  %and84.i265.i1225 = and i64 %496, -3689348814741910324
  %or85.i.i1226 = or disjoint i64 %shr83.i.i1224, %and84.i265.i1225
  %arrayidx86.i.i1227 = getelementptr inbounds nuw i8, ptr %q.i844, i32 24
  store i64 %or85.i.i1226, ptr %arrayidx86.i.i1227, align 8
  %arrayidx91.i.i1228 = getelementptr inbounds nuw i8, ptr %q.i844, i32 32
  %497 = load i64, ptr %arrayidx91.i.i1228, align 8
  %arrayidx92.i.i1229 = getelementptr inbounds nuw i8, ptr %q.i844, i32 48
  %498 = load i64, ptr %arrayidx92.i.i1229, align 8
  %and93.i.i1230 = and i64 %497, 3689348814741910323
  %and94.i.i1231 = shl i64 %498, 2
  %shl95.i.i1232 = and i64 %and94.i.i1231, -3689348814741910324
  %or96.i.i1233 = or disjoint i64 %and93.i.i1230, %shl95.i.i1232
  %arrayidx97.i.i1234 = getelementptr inbounds nuw i8, ptr %q.i844, i32 32
  store i64 %or96.i.i1233, ptr %arrayidx97.i.i1234, align 8
  %and98.i.i1235 = lshr i64 %497, 2
  %shr99.i.i1236 = and i64 %and98.i.i1235, 3689348814741910323
  %and100.i.i1237 = and i64 %498, -3689348814741910324
  %or101.i.i1238 = or disjoint i64 %shr99.i.i1236, %and100.i.i1237
  %arrayidx102.i.i1239 = getelementptr inbounds nuw i8, ptr %q.i844, i32 48
  store i64 %or101.i.i1238, ptr %arrayidx102.i.i1239, align 8
  %arrayidx107.i.i1240 = getelementptr inbounds nuw i8, ptr %q.i844, i32 40
  %499 = load i64, ptr %arrayidx107.i.i1240, align 8
  %arrayidx108.i.i1241 = getelementptr inbounds nuw i8, ptr %q.i844, i32 56
  %500 = load i64, ptr %arrayidx108.i.i1241, align 8
  %and109.i.i1242 = and i64 %499, 3689348814741910323
  %and110.i.i1243 = shl i64 %500, 2
  %shl111.i.i1244 = and i64 %and110.i.i1243, -3689348814741910324
  %or112.i.i1245 = or disjoint i64 %and109.i.i1242, %shl111.i.i1244
  %arrayidx113.i.i1246 = getelementptr inbounds nuw i8, ptr %q.i844, i32 40
  store i64 %or112.i.i1245, ptr %arrayidx113.i.i1246, align 8
  %and114.i.i1247 = lshr i64 %499, 2
  %shr115.i.i1248 = and i64 %and114.i.i1247, 3689348814741910323
  %and116.i.i1249 = and i64 %500, -3689348814741910324
  %or117.i.i1250 = or disjoint i64 %shr115.i.i1248, %and116.i.i1249
  %arrayidx118.i.i1251 = getelementptr inbounds nuw i8, ptr %q.i844, i32 56
  store i64 %or117.i.i1250, ptr %arrayidx118.i.i1251, align 8
  %501 = load i64, ptr %q.i844, align 8
  %arrayidx124.i266.i1252 = getelementptr inbounds nuw i8, ptr %q.i844, i32 32
  %502 = load i64, ptr %arrayidx124.i266.i1252, align 8
  %and125.i.i1253 = and i64 %501, 1085102592571150095
  %and126.i.i1254 = shl i64 %502, 4
  %shl127.i.i1255 = and i64 %and126.i.i1254, -1085102592571150096
  %or128.i.i1256 = or disjoint i64 %and125.i.i1253, %shl127.i.i1255
  store i64 %or128.i.i1256, ptr %q.i844, align 8
  %and130.i.i1257 = lshr i64 %501, 4
  %shr131.i.i1258 = and i64 %and130.i.i1257, 1085102592571150095
  %and132.i.i1259 = and i64 %502, -1085102592571150096
  %or133.i.i1260 = or disjoint i64 %shr131.i.i1258, %and132.i.i1259
  %arrayidx134.i.i1261 = getelementptr inbounds nuw i8, ptr %q.i844, i32 32
  store i64 %or133.i.i1260, ptr %arrayidx134.i.i1261, align 8
  %arrayidx139.i.i1262 = getelementptr inbounds nuw i8, ptr %q.i844, i32 8
  %503 = load i64, ptr %arrayidx139.i.i1262, align 8
  %arrayidx140.i.i1263 = getelementptr inbounds nuw i8, ptr %q.i844, i32 40
  %504 = load i64, ptr %arrayidx140.i.i1263, align 8
  %and141.i.i1264 = and i64 %503, 1085102592571150095
  %and142.i.i1265 = shl i64 %504, 4
  %shl143.i.i1266 = and i64 %and142.i.i1265, -1085102592571150096
  %or144.i.i1267 = or disjoint i64 %and141.i.i1264, %shl143.i.i1266
  %arrayidx145.i.i1268 = getelementptr inbounds nuw i8, ptr %q.i844, i32 8
  store i64 %or144.i.i1267, ptr %arrayidx145.i.i1268, align 8
  %and146.i.i1269 = lshr i64 %503, 4
  %shr147.i.i1270 = and i64 %and146.i.i1269, 1085102592571150095
  %and148.i.i1271 = and i64 %504, -1085102592571150096
  %or149.i.i1272 = or disjoint i64 %shr147.i.i1270, %and148.i.i1271
  %arrayidx150.i.i1273 = getelementptr inbounds nuw i8, ptr %q.i844, i32 40
  store i64 %or149.i.i1272, ptr %arrayidx150.i.i1273, align 8
  %arrayidx155.i.i1274 = getelementptr inbounds nuw i8, ptr %q.i844, i32 16
  %505 = load i64, ptr %arrayidx155.i.i1274, align 8
  %arrayidx156.i.i1275 = getelementptr inbounds nuw i8, ptr %q.i844, i32 48
  %506 = load i64, ptr %arrayidx156.i.i1275, align 8
  %and157.i.i1276 = and i64 %505, 1085102592571150095
  %and158.i.i1277 = shl i64 %506, 4
  %shl159.i.i1278 = and i64 %and158.i.i1277, -1085102592571150096
  %or160.i.i1279 = or disjoint i64 %and157.i.i1276, %shl159.i.i1278
  %arrayidx161.i.i1280 = getelementptr inbounds nuw i8, ptr %q.i844, i32 16
  store i64 %or160.i.i1279, ptr %arrayidx161.i.i1280, align 8
  %and162.i.i1281 = lshr i64 %505, 4
  %shr163.i.i1282 = and i64 %and162.i.i1281, 1085102592571150095
  %and164.i.i1283 = and i64 %506, -1085102592571150096
  %or165.i.i1284 = or disjoint i64 %shr163.i.i1282, %and164.i.i1283
  %arrayidx166.i.i1285 = getelementptr inbounds nuw i8, ptr %q.i844, i32 48
  store i64 %or165.i.i1284, ptr %arrayidx166.i.i1285, align 8
  %arrayidx171.i.i1286 = getelementptr inbounds nuw i8, ptr %q.i844, i32 24
  %507 = load i64, ptr %arrayidx171.i.i1286, align 8
  %arrayidx172.i.i1287 = getelementptr inbounds nuw i8, ptr %q.i844, i32 56
  %508 = load i64, ptr %arrayidx172.i.i1287, align 8
  %and173.i.i1288 = and i64 %507, 1085102592571150095
  %and174.i.i1289 = shl i64 %508, 4
  %shl175.i.i1290 = and i64 %and174.i.i1289, -1085102592571150096
  %or176.i.i1291 = or disjoint i64 %and173.i.i1288, %shl175.i.i1290
  %arrayidx177.i.i1292 = getelementptr inbounds nuw i8, ptr %q.i844, i32 24
  store i64 %or176.i.i1291, ptr %arrayidx177.i.i1292, align 8
  %and178.i.i1293 = lshr i64 %507, 4
  %shr179.i.i1294 = and i64 %and178.i.i1293, 1085102592571150095
  %and180.i.i1295 = and i64 %508, -1085102592571150096
  %or181.i267.i1296 = or disjoint i64 %shr179.i.i1294, %and180.i.i1295
  %arrayidx182.i.i1297 = getelementptr inbounds nuw i8, ptr %q.i844, i32 56
  store i64 %or181.i267.i1296, ptr %arrayidx182.i.i1297, align 8
  br label %for.body24.i1321

while.cond.i.i1302.preheader:                     ; preds = %for.body24.i1321
  br label %while.body.i.i1307

for.body24.i1321:                                 ; preds = %shift_rows.exit28.i1136, %for.body24.i1321
  %i.2.i12992012 = phi i32 [ 0, %shift_rows.exit28.i1136 ], [ %inc32.i1356, %for.body24.i1321 ]
  %add.ptr27.idx.i1322 = shl nuw nsw i32 %i.2.i12992012, 4
  %add.ptr27.i1323 = getelementptr inbounds nuw i8, ptr %w.i843, i32 %add.ptr27.idx.i1322
  %arrayidx28.i1324 = getelementptr inbounds nuw [8 x i64], ptr %q.i844, i32 0, i32 %i.2.i12992012
  %509 = load i64, ptr %arrayidx28.i1324, align 8
  %add29.i1325 = or disjoint i32 %i.2.i12992012, 4
  %arrayidx30.i1326 = getelementptr inbounds nuw [8 x i64], ptr %q.i844, i32 0, i32 %add29.i1325
  %510 = load i64, ptr %arrayidx30.i1326, align 8
  %and.i29.i1327 = and i64 %509, 71777214294589695
  %and1.i30.i1328 = and i64 %510, 71777214294589695
  %shr.i31.i1329 = lshr i64 %509, 8
  %and2.i32.i1330 = and i64 %shr.i31.i1329, 71776119077928960
  %shr3.i33.i1331 = lshr i64 %510, 8
  %and4.i34.i1332 = and i64 %shr3.i33.i1331, 71776119077928960
  %shr5.i35.i1333 = lshr i64 %and.i29.i1327, 8
  %or.i36.i1334 = or disjoint i64 %and.i29.i1327, %shr5.i35.i1333
  %shr6.i37.i1335 = lshr i64 %and1.i30.i1328, 8
  %or7.i.i1336 = or disjoint i64 %and1.i30.i1328, %shr6.i37.i1335
  %511 = and i64 %509, 280375465148160
  %512 = or disjoint i64 %and2.i32.i1330, %511
  %or9.i38.i1337 = lshr exact i64 %512, 8
  %513 = and i64 %510, 280375465148160
  %514 = or disjoint i64 %and4.i34.i1332, %513
  %or11.i.i1338 = lshr exact i64 %514, 8
  %and12.i.i1339 = and i64 %or.i36.i1334, 281470681808895
  %and13.i39.i1340 = and i64 %or7.i.i1336, 281470681808895
  %shr16.i.i1341 = lshr i64 %and12.i.i1339, 16
  %or181.i.i1342 = or disjoint i64 %and12.i.i1339, %shr16.i.i1341
  %or18.i.i1343 = trunc i64 %or181.i.i1342 to i32
  store i32 %or18.i.i1343, ptr %add.ptr27.i1323, align 4
  %shr20.i.i1344 = lshr i64 %and13.i39.i1340, 16
  %or222.i.i1345 = or disjoint i64 %and13.i39.i1340, %shr20.i.i1344
  %or22.i.i1346 = trunc i64 %or222.i.i1345 to i32
  %arrayidx23.i.i1347 = getelementptr inbounds nuw i8, ptr %add.ptr27.i1323, i32 4
  store i32 %or22.i.i1346, ptr %arrayidx23.i.i1347, align 4
  %shr25.i.i1348 = lshr i64 %512, 24
  %or273.i.i1349 = or disjoint i64 %or9.i38.i1337, %shr25.i.i1348
  %or27.i.i1350 = trunc i64 %or273.i.i1349 to i32
  %arrayidx28.i.i1351 = getelementptr inbounds nuw i8, ptr %add.ptr27.i1323, i32 8
  store i32 %or27.i.i1350, ptr %arrayidx28.i.i1351, align 4
  %shr30.i.i1352 = lshr i64 %514, 24
  %or324.i.i1353 = or disjoint i64 %or11.i.i1338, %shr30.i.i1352
  %or32.i.i1354 = trunc i64 %or324.i.i1353 to i32
  %arrayidx33.i.i1355 = getelementptr inbounds nuw i8, ptr %add.ptr27.i1323, i32 12
  store i32 %or32.i.i1354, ptr %arrayidx33.i.i1355, align 4
  %inc32.i1356 = add nuw nsw i32 %i.2.i12992012, 1
  %exitcond2.i1300.not = icmp eq i32 %inc32.i1356, 4
  br i1 %exitcond2.i1300.not, label %while.cond.i.i1302.preheader, label %for.body24.i1321, !llvm.loop !31

while.body.i.i1307:                               ; preds = %while.cond.i.i1302.preheader, %while.body.i.i1307
  %dst.addr.0.i.i13052015 = phi ptr [ %out.addr.0.i2017, %while.cond.i.i1302.preheader ], [ %add.ptr.i.i1320, %while.body.i.i1307 ]
  %v.addr.0.i.i13042014 = phi ptr [ %w.i843, %while.cond.i.i1302.preheader ], [ %incdec.ptr.i.i1309, %while.body.i.i1307 ]
  %num.addr.0.i.i13032013 = phi i32 [ 16, %while.cond.i.i1302.preheader ], [ %dec.i.i1308, %while.body.i.i1307 ]
  %dec.i.i1308 = add nsw i32 %num.addr.0.i.i13032013, -1
  %incdec.ptr.i.i1309 = getelementptr inbounds nuw i8, ptr %v.addr.0.i.i13042014, i32 4
  %515 = load i32, ptr %v.addr.0.i.i13042014, align 4
  %conv.i.i1310 = trunc i32 %515 to i8
  store i8 %conv.i.i1310, ptr %dst.addr.0.i.i13052015, align 1
  %shr.i.i1311 = lshr i32 %515, 8
  %conv1.i.i1312 = trunc i32 %shr.i.i1311 to i8
  %arrayidx2.i.i1313 = getelementptr inbounds nuw i8, ptr %dst.addr.0.i.i13052015, i32 1
  store i8 %conv1.i.i1312, ptr %arrayidx2.i.i1313, align 1
  %shr3.i.i1314 = lshr i32 %515, 16
  %conv4.i.i1315 = trunc i32 %shr3.i.i1314 to i8
  %arrayidx5.i.i1316 = getelementptr inbounds nuw i8, ptr %dst.addr.0.i.i13052015, i32 2
  store i8 %conv4.i.i1315, ptr %arrayidx5.i.i1316, align 1
  %shr6.i.i1317 = lshr i32 %515, 24
  %conv7.i.i1318 = trunc nuw i32 %shr6.i.i1317 to i8
  %arrayidx8.i.i1319 = getelementptr inbounds nuw i8, ptr %dst.addr.0.i.i13052015, i32 3
  store i8 %conv7.i.i1318, ptr %arrayidx8.i.i1319, align 1
  %add.ptr.i.i1320 = getelementptr inbounds nuw i8, ptr %dst.addr.0.i.i13052015, i32 4
  %cmp.not.i.i1306 = icmp eq i32 %dec.i.i1308, 0
  br i1 %cmp.not.i.i1306, label %aes_ecb4x.exit1620, label %while.body.i.i1307, !llvm.loop !32

aes_ecb4x.exit1620:                               ; preds = %while.body.i.i1307
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %w.i843)
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %q.i844)
  %add.ptr.i73 = getelementptr inbounds nuw i8, ptr %ivw.i, i32 12
  %516 = load i32, ptr %add.ptr.i73, align 4
  %517 = call i32 @llvm.bswap.i32(i32 %516)
  %add.i8.i = add i32 %517, 4
  %518 = call i32 @llvm.bswap.i32(i32 %add.i8.i)
  store i32 %518, ptr %add.ptr.i73, align 4
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %ivw.i, i32 28
  %519 = load i32, ptr %add.ptr1.i, align 4
  %520 = call i32 @llvm.bswap.i32(i32 %519)
  %add.i5.i = add i32 %520, 4
  %521 = call i32 @llvm.bswap.i32(i32 %add.i5.i)
  store i32 %521, ptr %add.ptr1.i, align 4
  %add.ptr2.i = getelementptr inbounds nuw i8, ptr %ivw.i, i32 44
  %522 = load i32, ptr %add.ptr2.i, align 4
  %523 = call i32 @llvm.bswap.i32(i32 %522)
  %add.i.i = add i32 %523, 4
  %524 = call i32 @llvm.bswap.i32(i32 %add.i.i)
  store i32 %524, ptr %add.ptr2.i, align 4
  %add.ptr3.i = getelementptr inbounds nuw i8, ptr %ivw.i, i32 60
  %525 = load i32, ptr %add.ptr3.i, align 4
  %526 = call i32 @llvm.bswap.i32(i32 %525)
  %add.i2.i = add i32 %526, 4
  %527 = call i32 @llvm.bswap.i32(i32 %add.i2.i)
  store i32 %527, ptr %add.ptr3.i, align 4
  %add.ptr21.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i2017, i32 64
  %sub.i29 = add nsw i32 %outlen.addr.0.i2016, -64
  %cmp.i23 = icmp ugt i32 %sub.i29, 64
  br i1 %cmp.i23, label %while.body.i, label %while.end.i, !llvm.loop !33

while.end.i:                                      ; preds = %aes_ecb4x.exit1620
  %out.addr.0.i.lcssa = phi ptr [ %add.ptr21.i, %aes_ecb4x.exit1620 ]
  br label %if.then.i24

if.then.i24:                                      ; preds = %while.end.i
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %w.i)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %q.i)
  %call.i778 = call ptr @memcpy(ptr noundef nonnull %w.i, ptr noundef nonnull %ivw.i, i32 noundef 64) #8
  br label %for.body.i830

for.body.i830:                                    ; preds = %if.then.i24, %for.body.i830
  %i.0.i7802018 = phi i32 [ 0, %if.then.i24 ], [ %inc.i842, %for.body.i830 ]
  %arrayidx.i831 = getelementptr inbounds nuw [8 x i64], ptr %q.i, i32 0, i32 %i.0.i7802018
  %add.i832 = or disjoint i32 %i.0.i7802018, 4
  %arrayidx1.i833 = getelementptr inbounds nuw [8 x i64], ptr %q.i, i32 0, i32 %add.i832
  %add.ptr.idx.i834 = shl nuw nsw i32 %i.0.i7802018, 4
  %add.ptr.i835 = getelementptr inbounds nuw i8, ptr %w.i, i32 %add.ptr.idx.i834
  %528 = load i32, ptr %add.ptr.i835, align 4
  %conv.i40.i = zext i32 %528 to i64
  %arrayidx1.i.i836 = getelementptr inbounds nuw i8, ptr %add.ptr.i835, i32 4
  %529 = load i32, ptr %arrayidx1.i.i836, align 4
  %conv2.i.i837 = zext i32 %529 to i64
  %arrayidx3.i.i838 = getelementptr inbounds nuw i8, ptr %add.ptr.i835, i32 8
  %530 = load i32, ptr %arrayidx3.i.i838, align 4
  %conv4.i41.i = zext i32 %530 to i64
  %arrayidx5.i42.i = getelementptr inbounds nuw i8, ptr %add.ptr.i835, i32 12
  %531 = load i32, ptr %arrayidx5.i42.i, align 4
  %conv6.i.i839 = zext i32 %531 to i64
  %shl.i43.i = shl nuw nsw i64 %conv.i40.i, 16
  %or.i44.i = or i64 %shl.i43.i, %conv.i40.i
  %shl7.i.i = shl nuw nsw i64 %conv2.i.i837, 16
  %or8.i.i = or i64 %shl7.i.i, %conv2.i.i837
  %shl9.i.i840 = shl nuw nsw i64 %conv4.i41.i, 16
  %or10.i.i841 = or i64 %shl9.i.i840, %conv4.i41.i
  %shl11.i.i = shl nuw nsw i64 %conv6.i.i839, 16
  %or12.i45.i = or i64 %shl11.i.i, %conv6.i.i839
  %and.i46.i = and i64 %or.i44.i, 281470681808895
  %and13.i47.i = and i64 %or8.i.i, 281470681808895
  %and14.i.i = and i64 %or10.i.i841, 281470681808895
  %and15.i.i = and i64 %or12.i45.i, 281470681808895
  %shl16.i.i = shl nuw nsw i64 %and.i46.i, 8
  %or17.i.i = or i64 %and.i46.i, %shl16.i.i
  %shl18.i.i = shl nuw nsw i64 %and13.i47.i, 8
  %or19.i.i = or i64 %and13.i47.i, %shl18.i.i
  %and24.i.i = and i64 %or17.i.i, 71777214294589695
  %and25.i.i = and i64 %or19.i.i, 71777214294589695
  %532 = shl nuw i64 %and14.i.i, 16
  %533 = shl nuw nsw i64 %and14.i.i, 8
  %and26.i.i = or i64 %532, %533
  %shl28.i.i = and i64 %and26.i.i, -71777214294589696
  %or29.i.i = or disjoint i64 %and24.i.i, %shl28.i.i
  store i64 %or29.i.i, ptr %arrayidx.i831, align 8
  %534 = shl nuw i64 %and15.i.i, 16
  %535 = shl nuw nsw i64 %and15.i.i, 8
  %and27.i.i = or i64 %534, %535
  %shl30.i.i = and i64 %and27.i.i, -71777214294589696
  %or31.i.i = or disjoint i64 %and25.i.i, %shl30.i.i
  store i64 %or31.i.i, ptr %arrayidx1.i833, align 8
  %inc.i842 = add nuw nsw i32 %i.0.i7802018, 1
  %exitcond.i781.not = icmp eq i32 %inc.i842, 4
  br i1 %exitcond.i781.not, label %for.end.i, label %for.body.i830, !llvm.loop !34

for.end.i:                                        ; preds = %for.body.i830
  %536 = load i64, ptr %q.i, align 8
  %arrayidx1.i268.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %537 = load i64, ptr %arrayidx1.i268.i, align 8
  %and.i269.i = and i64 %536, 6148914691236517205
  %and2.i270.i = shl i64 %537, 1
  %shl.i271.i = and i64 %and2.i270.i, -6148914691236517206
  %or.i272.i = or disjoint i64 %and.i269.i, %shl.i271.i
  store i64 %or.i272.i, ptr %q.i, align 8
  %and4.i273.i = lshr i64 %536, 1
  %shr.i274.i = and i64 %and4.i273.i, 6148914691236517205
  %and5.i275.i = and i64 %537, -6148914691236517206
  %or6.i276.i = or disjoint i64 %shr.i274.i, %and5.i275.i
  %arrayidx7.i277.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or6.i276.i, ptr %arrayidx7.i277.i, align 8
  %arrayidx11.i278.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %538 = load i64, ptr %arrayidx11.i278.i, align 8
  %arrayidx12.i279.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %539 = load i64, ptr %arrayidx12.i279.i, align 8
  %and13.i280.i = and i64 %538, 6148914691236517205
  %and14.i281.i = shl i64 %539, 1
  %shl15.i282.i = and i64 %and14.i281.i, -6148914691236517206
  %or16.i283.i = or disjoint i64 %and13.i280.i, %shl15.i282.i
  %arrayidx17.i284.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or16.i283.i, ptr %arrayidx17.i284.i, align 8
  %and18.i285.i = lshr i64 %538, 1
  %shr19.i286.i = and i64 %and18.i285.i, 6148914691236517205
  %and20.i287.i = and i64 %539, -6148914691236517206
  %or21.i288.i = or disjoint i64 %shr19.i286.i, %and20.i287.i
  %arrayidx22.i289.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or21.i288.i, ptr %arrayidx22.i289.i, align 8
  %arrayidx27.i290.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %540 = load i64, ptr %arrayidx27.i290.i, align 8
  %arrayidx28.i291.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %541 = load i64, ptr %arrayidx28.i291.i, align 8
  %and29.i292.i = and i64 %540, 6148914691236517205
  %and30.i293.i = shl i64 %541, 1
  %shl31.i294.i = and i64 %and30.i293.i, -6148914691236517206
  %or32.i295.i = or disjoint i64 %and29.i292.i, %shl31.i294.i
  %arrayidx33.i296.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or32.i295.i, ptr %arrayidx33.i296.i, align 8
  %and34.i297.i = lshr i64 %540, 1
  %shr35.i298.i = and i64 %and34.i297.i, 6148914691236517205
  %and36.i299.i = and i64 %541, -6148914691236517206
  %or37.i300.i = or disjoint i64 %shr35.i298.i, %and36.i299.i
  %arrayidx38.i301.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or37.i300.i, ptr %arrayidx38.i301.i, align 8
  %arrayidx43.i302.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %542 = load i64, ptr %arrayidx43.i302.i, align 8
  %arrayidx44.i303.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %543 = load i64, ptr %arrayidx44.i303.i, align 8
  %and45.i304.i = and i64 %542, 6148914691236517205
  %and46.i305.i = shl i64 %543, 1
  %shl47.i306.i = and i64 %and46.i305.i, -6148914691236517206
  %or48.i307.i = or disjoint i64 %and45.i304.i, %shl47.i306.i
  %arrayidx49.i308.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or48.i307.i, ptr %arrayidx49.i308.i, align 8
  %and50.i309.i = lshr i64 %542, 1
  %shr51.i310.i = and i64 %and50.i309.i, 6148914691236517205
  %and52.i311.i = and i64 %543, -6148914691236517206
  %or53.i312.i = or disjoint i64 %shr51.i310.i, %and52.i311.i
  %arrayidx54.i313.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or53.i312.i, ptr %arrayidx54.i313.i, align 8
  %544 = load i64, ptr %q.i, align 8
  %arrayidx60.i314.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %545 = load i64, ptr %arrayidx60.i314.i, align 8
  %and61.i315.i = and i64 %544, 3689348814741910323
  %and62.i316.i = shl i64 %545, 2
  %shl63.i317.i = and i64 %and62.i316.i, -3689348814741910324
  %or64.i318.i = or disjoint i64 %and61.i315.i, %shl63.i317.i
  store i64 %or64.i318.i, ptr %q.i, align 8
  %and66.i319.i = lshr i64 %544, 2
  %shr67.i320.i = and i64 %and66.i319.i, 3689348814741910323
  %and68.i321.i = and i64 %545, -3689348814741910324
  %or69.i322.i = or disjoint i64 %shr67.i320.i, %and68.i321.i
  %arrayidx70.i323.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or69.i322.i, ptr %arrayidx70.i323.i, align 8
  %arrayidx75.i324.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %546 = load i64, ptr %arrayidx75.i324.i, align 8
  %arrayidx76.i325.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %547 = load i64, ptr %arrayidx76.i325.i, align 8
  %and77.i326.i = and i64 %546, 3689348814741910323
  %and78.i327.i = shl i64 %547, 2
  %shl79.i328.i = and i64 %and78.i327.i, -3689348814741910324
  %or80.i329.i = or disjoint i64 %and77.i326.i, %shl79.i328.i
  %arrayidx81.i330.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or80.i329.i, ptr %arrayidx81.i330.i, align 8
  %and82.i331.i = lshr i64 %546, 2
  %shr83.i332.i = and i64 %and82.i331.i, 3689348814741910323
  %and84.i333.i = and i64 %547, -3689348814741910324
  %or85.i334.i = or disjoint i64 %shr83.i332.i, %and84.i333.i
  %arrayidx86.i335.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or85.i334.i, ptr %arrayidx86.i335.i, align 8
  %arrayidx91.i336.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %548 = load i64, ptr %arrayidx91.i336.i, align 8
  %arrayidx92.i337.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %549 = load i64, ptr %arrayidx92.i337.i, align 8
  %and93.i338.i = and i64 %548, 3689348814741910323
  %and94.i339.i = shl i64 %549, 2
  %shl95.i340.i = and i64 %and94.i339.i, -3689348814741910324
  %or96.i341.i = or disjoint i64 %and93.i338.i, %shl95.i340.i
  %arrayidx97.i342.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or96.i341.i, ptr %arrayidx97.i342.i, align 8
  %and98.i343.i = lshr i64 %548, 2
  %shr99.i344.i = and i64 %and98.i343.i, 3689348814741910323
  %and100.i345.i = and i64 %549, -3689348814741910324
  %or101.i346.i = or disjoint i64 %shr99.i344.i, %and100.i345.i
  %arrayidx102.i347.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or101.i346.i, ptr %arrayidx102.i347.i, align 8
  %arrayidx107.i348.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %550 = load i64, ptr %arrayidx107.i348.i, align 8
  %arrayidx108.i349.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %551 = load i64, ptr %arrayidx108.i349.i, align 8
  %and109.i350.i = and i64 %550, 3689348814741910323
  %and110.i351.i = shl i64 %551, 2
  %shl111.i352.i = and i64 %and110.i351.i, -3689348814741910324
  %or112.i353.i = or disjoint i64 %and109.i350.i, %shl111.i352.i
  %arrayidx113.i354.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or112.i353.i, ptr %arrayidx113.i354.i, align 8
  %and114.i355.i = lshr i64 %550, 2
  %shr115.i356.i = and i64 %and114.i355.i, 3689348814741910323
  %and116.i357.i = and i64 %551, -3689348814741910324
  %or117.i358.i = or disjoint i64 %shr115.i356.i, %and116.i357.i
  %arrayidx118.i359.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or117.i358.i, ptr %arrayidx118.i359.i, align 8
  %552 = load i64, ptr %q.i, align 8
  %arrayidx124.i360.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %553 = load i64, ptr %arrayidx124.i360.i, align 8
  %and125.i361.i = and i64 %552, 1085102592571150095
  %and126.i362.i = shl i64 %553, 4
  %shl127.i363.i = and i64 %and126.i362.i, -1085102592571150096
  %or128.i364.i = or disjoint i64 %and125.i361.i, %shl127.i363.i
  store i64 %or128.i364.i, ptr %q.i, align 8
  %and130.i365.i = lshr i64 %552, 4
  %shr131.i366.i = and i64 %and130.i365.i, 1085102592571150095
  %and132.i367.i = and i64 %553, -1085102592571150096
  %or133.i368.i = or disjoint i64 %shr131.i366.i, %and132.i367.i
  %arrayidx134.i369.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or133.i368.i, ptr %arrayidx134.i369.i, align 8
  %arrayidx139.i370.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %554 = load i64, ptr %arrayidx139.i370.i, align 8
  %arrayidx140.i371.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %555 = load i64, ptr %arrayidx140.i371.i, align 8
  %and141.i372.i = and i64 %554, 1085102592571150095
  %and142.i373.i = shl i64 %555, 4
  %shl143.i374.i = and i64 %and142.i373.i, -1085102592571150096
  %or144.i375.i = or disjoint i64 %and141.i372.i, %shl143.i374.i
  %arrayidx145.i376.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or144.i375.i, ptr %arrayidx145.i376.i, align 8
  %and146.i377.i = lshr i64 %554, 4
  %shr147.i378.i = and i64 %and146.i377.i, 1085102592571150095
  %and148.i379.i = and i64 %555, -1085102592571150096
  %or149.i380.i = or disjoint i64 %shr147.i378.i, %and148.i379.i
  %arrayidx150.i381.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or149.i380.i, ptr %arrayidx150.i381.i, align 8
  %arrayidx155.i382.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %556 = load i64, ptr %arrayidx155.i382.i, align 8
  %arrayidx156.i383.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %557 = load i64, ptr %arrayidx156.i383.i, align 8
  %and157.i384.i = and i64 %556, 1085102592571150095
  %and158.i385.i = shl i64 %557, 4
  %shl159.i386.i = and i64 %and158.i385.i, -1085102592571150096
  %or160.i387.i = or disjoint i64 %and157.i384.i, %shl159.i386.i
  %arrayidx161.i388.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or160.i387.i, ptr %arrayidx161.i388.i, align 8
  %and162.i389.i = lshr i64 %556, 4
  %shr163.i390.i = and i64 %and162.i389.i, 1085102592571150095
  %and164.i391.i = and i64 %557, -1085102592571150096
  %or165.i392.i = or disjoint i64 %shr163.i390.i, %and164.i391.i
  %arrayidx166.i393.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or165.i392.i, ptr %arrayidx166.i393.i, align 8
  %arrayidx171.i394.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %558 = load i64, ptr %arrayidx171.i394.i, align 8
  %arrayidx172.i395.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %559 = load i64, ptr %arrayidx172.i395.i, align 8
  %and173.i396.i = and i64 %558, 1085102592571150095
  %and174.i397.i = shl i64 %559, 4
  %shl175.i398.i = and i64 %and174.i397.i, -1085102592571150096
  %or176.i399.i = or disjoint i64 %and173.i396.i, %shl175.i398.i
  %arrayidx177.i400.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or176.i399.i, ptr %arrayidx177.i400.i, align 8
  %and178.i401.i = lshr i64 %558, 4
  %shr179.i402.i = and i64 %and178.i401.i, 1085102592571150095
  %and180.i403.i = and i64 %559, -1085102592571150096
  %or181.i404.i = or disjoint i64 %shr179.i402.i, %and180.i403.i
  %arrayidx182.i405.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or181.i404.i, ptr %arrayidx182.i405.i, align 8
  %560 = load i64, ptr %308, align 8
  %561 = load i64, ptr %q.i, align 8
  %xor.i.i782 = xor i64 %561, %560
  store i64 %xor.i.i782, ptr %q.i, align 8
  %arrayidx2.i48.i = getelementptr inbounds nuw i8, ptr %308, i32 8
  %562 = load i64, ptr %arrayidx2.i48.i, align 8
  %arrayidx3.i49.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %563 = load i64, ptr %arrayidx3.i49.i, align 8
  %xor4.i.i = xor i64 %563, %562
  store i64 %xor4.i.i, ptr %arrayidx3.i49.i, align 8
  %arrayidx5.i50.i = getelementptr inbounds nuw i8, ptr %308, i32 16
  %564 = load i64, ptr %arrayidx5.i50.i, align 8
  %arrayidx6.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %565 = load i64, ptr %arrayidx6.i.i, align 8
  %xor7.i.i = xor i64 %565, %564
  store i64 %xor7.i.i, ptr %arrayidx6.i.i, align 8
  %arrayidx8.i51.i = getelementptr inbounds nuw i8, ptr %308, i32 24
  %566 = load i64, ptr %arrayidx8.i51.i, align 8
  %arrayidx9.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %567 = load i64, ptr %arrayidx9.i.i, align 8
  %xor10.i.i = xor i64 %567, %566
  store i64 %xor10.i.i, ptr %arrayidx9.i.i, align 8
  %arrayidx11.i.i = getelementptr inbounds nuw i8, ptr %308, i32 32
  %568 = load i64, ptr %arrayidx11.i.i, align 8
  %arrayidx12.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %569 = load i64, ptr %arrayidx12.i.i, align 8
  %xor13.i.i = xor i64 %569, %568
  store i64 %xor13.i.i, ptr %arrayidx12.i.i, align 8
  %arrayidx14.i.i = getelementptr inbounds nuw i8, ptr %308, i32 40
  %570 = load i64, ptr %arrayidx14.i.i, align 8
  %arrayidx15.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %571 = load i64, ptr %arrayidx15.i.i, align 8
  %xor16.i.i = xor i64 %571, %570
  store i64 %xor16.i.i, ptr %arrayidx15.i.i, align 8
  %arrayidx17.i.i = getelementptr inbounds nuw i8, ptr %308, i32 48
  %572 = load i64, ptr %arrayidx17.i.i, align 8
  %arrayidx18.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %573 = load i64, ptr %arrayidx18.i.i, align 8
  %xor19.i.i = xor i64 %573, %572
  store i64 %xor19.i.i, ptr %arrayidx18.i.i, align 8
  %arrayidx20.i.i = getelementptr inbounds nuw i8, ptr %308, i32 56
  %574 = load i64, ptr %arrayidx20.i.i, align 8
  %arrayidx21.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %575 = load i64, ptr %arrayidx21.i.i, align 8
  %xor22.i.i = xor i64 %575, %574
  store i64 %xor22.i.i, ptr %arrayidx21.i.i, align 8
  br label %for.body7.i808

for.body7.i808:                                   ; preds = %for.end.i, %shift_rows.exit.i
  %i.1.i7842020 = phi i32 [ 1, %for.end.i ], [ %inc15.i818, %shift_rows.exit.i ]
  %arrayidx.i101.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %576 = load i64, ptr %arrayidx.i101.i, align 8
  %arrayidx1.i102.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %577 = load i64, ptr %arrayidx1.i102.i, align 8
  %arrayidx2.i103.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %578 = load i64, ptr %arrayidx2.i103.i, align 8
  %arrayidx3.i104.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %579 = load i64, ptr %arrayidx3.i104.i, align 8
  %arrayidx4.i105.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %580 = load i64, ptr %arrayidx4.i105.i, align 8
  %arrayidx5.i106.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %581 = load i64, ptr %arrayidx5.i106.i, align 8
  %arrayidx6.i107.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %582 = load i64, ptr %arrayidx6.i107.i, align 8
  %583 = load i64, ptr %q.i, align 8
  %xor.i108.i = xor i64 %579, %581
  %xor8.i.i = xor i64 %576, %582
  %xor9.i.i = xor i64 %576, %579
  %xor10.i109.i = xor i64 %576, %581
  %xor11.i.i = xor i64 %577, %578
  %xor12.i.i = xor i64 %xor11.i.i, %583
  %xor13.i110.i = xor i64 %xor12.i.i, %579
  %xor14.i.i = xor i64 %xor8.i.i, %xor.i108.i
  %xor15.i.i809 = xor i64 %xor12.i.i, %576
  %xor16.i111.i = xor i64 %xor12.i.i, %582
  %xor17.i.i = xor i64 %xor16.i111.i, %xor10.i109.i
  %xor18.i.i = xor i64 %580, %xor14.i.i
  %xor19.i112.i = xor i64 %xor18.i.i, %581
  %xor20.i.i = xor i64 %xor18.i.i, %577
  %xor21.i.i = xor i64 %xor19.i112.i, %583
  %xor22.i113.i = xor i64 %xor19.i112.i, %xor11.i.i
  %xor23.i.i810 = xor i64 %xor20.i.i, %xor9.i.i
  %xor24.i.i = xor i64 %583, %xor23.i.i810
  %xor25.i.i811 = xor i64 %xor22.i113.i, %xor23.i.i810
  %xor27.i.i = xor i64 %xor11.i.i, %xor23.i.i810
  %and.i114.i = and i64 %xor14.i.i, %xor19.i112.i
  %and30.i.i = and i64 %xor17.i.i, %xor21.i.i
  %xor31.i115.i = xor i64 %and30.i.i, %and.i114.i
  %and32.i.i = and i64 %xor13.i110.i, %583
  %and34.i.i = and i64 %xor8.i.i, %xor27.i.i
  %and35.i.i = and i64 %xor16.i111.i, %xor12.i.i
  %and37.i.i = and i64 %xor15.i.i809, %xor24.i.i
  %and39.i.i = and i64 %xor9.i.i, %xor23.i.i810
  %and40.i.i = and i64 %xor.i108.i, %xor25.i.i811
  %xor41.i.i = xor i64 %and40.i.i, %and39.i.i
  %and42.i.i = and i64 %xor10.i109.i, %xor22.i113.i
  %xor43.i116.i = xor i64 %and42.i.i, %and39.i.i
  %xor44.i.i = xor i64 %xor31.i115.i, %xor41.i.i
  %xor48.i.i = xor i64 %xor44.i.i, %xor20.i.i
  %584 = xor i64 %xor10.i109.i, %and32.i.i
  %585 = xor i64 %584, %xor22.i113.i
  %586 = xor i64 %585, %and.i114.i
  %xor49.i.i = xor i64 %586, %xor43.i116.i
  %587 = xor i64 %xor27.i.i, %and35.i.i
  %588 = xor i64 %587, %xor8.i.i
  %589 = xor i64 %588, %and34.i.i
  %xor50.i.i = xor i64 %589, %xor41.i.i
  %590 = xor i64 %xor27.i.i, %and37.i.i
  %591 = xor i64 %590, %576
  %592 = xor i64 %591, %and34.i.i
  %xor51.i117.i = xor i64 %592, %xor43.i116.i
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
  %and75.i.i = and i64 %xor60.i.i, %583
  %and76.i.i = and i64 %xor70.i.i, %xor27.i.i
  %and77.i.i = and i64 %xor67.i120.i, %xor12.i.i
  %and78.i.i = and i64 %xor56.i.i, %xor24.i.i
  %and79.i.i = and i64 %xor69.i.i, %xor23.i.i810
  %and80.i.i = and i64 %xor72.i.i, %xor25.i.i811
  %and81.i.i = and i64 %xor68.i.i, %xor22.i113.i
  %and82.i.i = and i64 %xor71.i121.i, %xor14.i.i
  %and83.i.i = and i64 %xor64.i.i, %xor17.i.i
  %and84.i.i = and i64 %xor60.i.i, %xor13.i110.i
  %and85.i.i = and i64 %xor70.i.i, %xor8.i.i
  %and86.i.i = and i64 %xor67.i120.i, %xor16.i111.i
  %and87.i.i = and i64 %xor56.i.i, %xor15.i.i809
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
  %593 = xor i64 %xor107.i.i, %xor101.i.i
  %xor113.i.i = xor i64 %593, -1
  %594 = xor i64 %xor105.i.i, %xor93.i.i
  %xor115.i.i = xor i64 %594, -1
  %xor117.i.i = xor i64 %xor98.i.i, %xor111.i.i
  %xor118.i.i = xor i64 %xor96.i.i, %xor111.i.i
  %xor119.i.i = xor i64 %xor92.i.i, %xor110.i.i
  %595 = xor i64 %xor117.i.i, %xor109.i.i
  %xor121.i.i = xor i64 %595, -1
  %596 = xor i64 %xor110.i.i, %xor100.i.i
  %597 = xor i64 %596, %xor109.i.i
  %xor123.i.i = xor i64 %597, -1
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
  br label %for.body.i.i819

for.body.i.i819:                                  ; preds = %for.body7.i808, %for.body.i.i819
  %i.0.i.i8132019 = phi i32 [ 0, %for.body7.i808 ], [ %inc.i.i829, %for.body.i.i819 ]
  %arrayidx.i.i820 = getelementptr inbounds nuw i64, ptr %q.i, i32 %i.0.i.i8132019
  %598 = load i64, ptr %arrayidx.i.i820, align 8
  %and.i.i821 = and i64 %598, 65535
  %and1.i.i822 = lshr i64 %598, 4
  %shr.i1.i = and i64 %and1.i.i822, 268369920
  %or.i.i823 = or disjoint i64 %and.i.i821, %shr.i1.i
  %and2.i.i = shl i64 %598, 12
  %shl.i.i824 = and i64 %and2.i.i, 4026531840
  %or3.i.i = or disjoint i64 %or.i.i823, %shl.i.i824
  %and4.i.i = lshr i64 %598, 8
  %shr5.i.i = and i64 %and4.i.i, 1095216660480
  %or6.i.i825 = or disjoint i64 %or3.i.i, %shr5.i.i
  %and7.i.i = shl i64 %598, 8
  %shl8.i.i = and i64 %and7.i.i, 280375465082880
  %or9.i.i = or disjoint i64 %or6.i.i825, %shl8.i.i
  %and10.i.i826 = lshr i64 %598, 12
  %shr11.i.i827 = and i64 %and10.i.i826, 4222124650659840
  %or12.i.i = or disjoint i64 %or9.i.i, %shr11.i.i827
  %and13.i.i = shl i64 %598, 4
  %shl14.i.i = and i64 %and13.i.i, -4503599627370496
  %or15.i.i = or i64 %or12.i.i, %shl14.i.i
  %arrayidx16.i.i828 = getelementptr inbounds nuw i64, ptr %q.i, i32 %i.0.i.i8132019
  store i64 %or15.i.i, ptr %arrayidx16.i.i828, align 8
  %inc.i.i829 = add nuw nsw i32 %i.0.i.i8132019, 1
  %exitcond.i.i814.not = icmp eq i32 %inc.i.i829, 8
  br i1 %exitcond.i.i814.not, label %shift_rows.exit.i, label %for.body.i.i819, !llvm.loop !35

shift_rows.exit.i:                                ; preds = %for.body.i.i819
  %599 = load i64, ptr %q.i, align 8
  %arrayidx1.i96.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %600 = load i64, ptr %arrayidx1.i96.i, align 8
  %arrayidx2.i97.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %601 = load i64, ptr %arrayidx2.i97.i, align 8
  %arrayidx3.i98.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %602 = load i64, ptr %arrayidx3.i98.i, align 8
  %arrayidx4.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %603 = load i64, ptr %arrayidx4.i.i, align 8
  %arrayidx5.i99.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %604 = load i64, ptr %arrayidx5.i99.i, align 8
  %arrayidx6.i100.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %605 = load i64, ptr %arrayidx6.i100.i, align 8
  %arrayidx7.i.i815 = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %606 = load i64, ptr %arrayidx7.i.i815, align 8
  %607 = call i64 @llvm.fshl.i64(i64 %599, i64 %599, i64 48)
  %608 = call i64 @llvm.fshl.i64(i64 %600, i64 %600, i64 48)
  %609 = call i64 @llvm.fshl.i64(i64 %601, i64 %601, i64 48)
  %610 = call i64 @llvm.fshl.i64(i64 %602, i64 %602, i64 48)
  %611 = call i64 @llvm.fshl.i64(i64 %603, i64 %603, i64 48)
  %612 = call i64 @llvm.fshl.i64(i64 %604, i64 %604, i64 48)
  %613 = call i64 @llvm.fshl.i64(i64 %605, i64 %605, i64 48)
  %614 = call i64 @llvm.fshl.i64(i64 %606, i64 %606, i64 48)
  %xor30.i.i = xor i64 %599, %607
  %615 = call i64 @llvm.fshl.i64(i64 %xor30.i.i, i64 %xor30.i.i, i64 32)
  %616 = xor i64 %614, %615
  %617 = xor i64 %616, %606
  %xor31.i.i = xor i64 %617, %607
  store i64 %xor31.i.i, ptr %q.i, align 8
  %xor37.i.i = xor i64 %600, %608
  %618 = call i64 @llvm.fshl.i64(i64 %xor37.i.i, i64 %xor37.i.i, i64 32)
  %619 = xor i64 %607, %618
  %620 = xor i64 %619, %599
  %621 = xor i64 %620, %606
  %622 = xor i64 %621, %614
  %xor39.i.i = xor i64 %622, %608
  %arrayidx40.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %xor39.i.i, ptr %arrayidx40.i.i, align 8
  %xor43.i.i = xor i64 %601, %609
  %623 = call i64 @llvm.fshl.i64(i64 %xor43.i.i, i64 %xor43.i.i, i64 32)
  %624 = xor i64 %608, %623
  %625 = xor i64 %624, %600
  %xor45.i.i = xor i64 %625, %609
  %arrayidx46.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %xor45.i.i, ptr %arrayidx46.i.i, align 8
  %xor51.i.i = xor i64 %602, %610
  %626 = call i64 @llvm.fshl.i64(i64 %xor51.i.i, i64 %xor51.i.i, i64 32)
  %627 = xor i64 %609, %626
  %628 = xor i64 %627, %601
  %629 = xor i64 %628, %606
  %630 = xor i64 %629, %614
  %xor53.i.i = xor i64 %630, %610
  %arrayidx54.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %xor53.i.i, ptr %arrayidx54.i.i, align 8
  %xor59.i.i = xor i64 %603, %611
  %631 = call i64 @llvm.fshl.i64(i64 %xor59.i.i, i64 %xor59.i.i, i64 32)
  %632 = xor i64 %610, %631
  %633 = xor i64 %632, %602
  %634 = xor i64 %633, %606
  %635 = xor i64 %634, %614
  %xor61.i.i = xor i64 %635, %611
  %arrayidx62.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %xor61.i.i, ptr %arrayidx62.i.i, align 8
  %xor65.i.i = xor i64 %604, %612
  %636 = call i64 @llvm.fshl.i64(i64 %xor65.i.i, i64 %xor65.i.i, i64 32)
  %637 = xor i64 %611, %636
  %638 = xor i64 %637, %603
  %xor67.i.i = xor i64 %638, %612
  %arrayidx68.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %xor67.i.i, ptr %arrayidx68.i.i, align 8
  %xor71.i.i = xor i64 %605, %613
  %639 = call i64 @llvm.fshl.i64(i64 %xor71.i.i, i64 %xor71.i.i, i64 32)
  %640 = xor i64 %612, %639
  %641 = xor i64 %640, %604
  %xor73.i.i = xor i64 %641, %613
  %arrayidx74.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %xor73.i.i, ptr %arrayidx74.i.i, align 8
  %xor77.i.i = xor i64 %606, %614
  %642 = call i64 @llvm.fshl.i64(i64 %xor77.i.i, i64 %xor77.i.i, i64 32)
  %643 = xor i64 %613, %642
  %644 = xor i64 %643, %605
  %xor79.i.i = xor i64 %644, %614
  %arrayidx80.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %xor79.i.i, ptr %arrayidx80.i.i, align 8
  %add.ptr13.idx.i816 = shl nuw nsw i32 %i.1.i7842020, 6
  %add.ptr13.i817 = getelementptr inbounds nuw i8, ptr %308, i32 %add.ptr13.idx.i816
  %645 = load i64, ptr %add.ptr13.i817, align 8
  %646 = load i64, ptr %q.i, align 8
  %xor.i52.i = xor i64 %646, %645
  store i64 %xor.i52.i, ptr %q.i, align 8
  %arrayidx2.i53.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i817, i32 8
  %647 = load i64, ptr %arrayidx2.i53.i, align 8
  %arrayidx3.i54.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %648 = load i64, ptr %arrayidx3.i54.i, align 8
  %xor4.i55.i = xor i64 %648, %647
  store i64 %xor4.i55.i, ptr %arrayidx3.i54.i, align 8
  %arrayidx5.i56.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i817, i32 16
  %649 = load i64, ptr %arrayidx5.i56.i, align 8
  %arrayidx6.i57.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %650 = load i64, ptr %arrayidx6.i57.i, align 8
  %xor7.i58.i = xor i64 %650, %649
  store i64 %xor7.i58.i, ptr %arrayidx6.i57.i, align 8
  %arrayidx8.i59.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i817, i32 24
  %651 = load i64, ptr %arrayidx8.i59.i, align 8
  %arrayidx9.i60.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %652 = load i64, ptr %arrayidx9.i60.i, align 8
  %xor10.i61.i = xor i64 %652, %651
  store i64 %xor10.i61.i, ptr %arrayidx9.i60.i, align 8
  %arrayidx11.i62.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i817, i32 32
  %653 = load i64, ptr %arrayidx11.i62.i, align 8
  %arrayidx12.i63.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %654 = load i64, ptr %arrayidx12.i63.i, align 8
  %xor13.i64.i = xor i64 %654, %653
  store i64 %xor13.i64.i, ptr %arrayidx12.i63.i, align 8
  %arrayidx14.i65.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i817, i32 40
  %655 = load i64, ptr %arrayidx14.i65.i, align 8
  %arrayidx15.i66.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %656 = load i64, ptr %arrayidx15.i66.i, align 8
  %xor16.i67.i = xor i64 %656, %655
  store i64 %xor16.i67.i, ptr %arrayidx15.i66.i, align 8
  %arrayidx17.i68.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i817, i32 48
  %657 = load i64, ptr %arrayidx17.i68.i, align 8
  %arrayidx18.i69.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %658 = load i64, ptr %arrayidx18.i69.i, align 8
  %xor19.i70.i = xor i64 %658, %657
  store i64 %xor19.i70.i, ptr %arrayidx18.i69.i, align 8
  %arrayidx20.i71.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i817, i32 56
  %659 = load i64, ptr %arrayidx20.i71.i, align 8
  %arrayidx21.i72.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %660 = load i64, ptr %arrayidx21.i72.i, align 8
  %xor22.i73.i = xor i64 %660, %659
  store i64 %xor22.i73.i, ptr %arrayidx21.i72.i, align 8
  %inc15.i818 = add nuw nsw i32 %i.1.i7842020, 1
  %exitcond1.i785.not = icmp eq i32 %inc15.i818, 10
  br i1 %exitcond1.i785.not, label %for.end16.i, label %for.body7.i808, !llvm.loop !36

for.end16.i:                                      ; preds = %shift_rows.exit.i
  %arrayidx.i122.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %661 = load i64, ptr %arrayidx.i122.i, align 8
  %arrayidx1.i123.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %662 = load i64, ptr %arrayidx1.i123.i, align 8
  %arrayidx2.i124.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %663 = load i64, ptr %arrayidx2.i124.i, align 8
  %arrayidx3.i125.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %664 = load i64, ptr %arrayidx3.i125.i, align 8
  %arrayidx4.i126.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %665 = load i64, ptr %arrayidx4.i126.i, align 8
  %arrayidx5.i127.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %666 = load i64, ptr %arrayidx5.i127.i, align 8
  %arrayidx6.i128.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %667 = load i64, ptr %arrayidx6.i128.i, align 8
  %668 = load i64, ptr %q.i, align 8
  %xor.i129.i = xor i64 %664, %666
  %xor8.i130.i = xor i64 %661, %667
  %xor9.i131.i = xor i64 %661, %664
  %xor10.i132.i = xor i64 %661, %666
  %xor11.i133.i = xor i64 %662, %663
  %xor12.i134.i = xor i64 %xor11.i133.i, %668
  %xor13.i135.i = xor i64 %xor12.i134.i, %664
  %xor14.i136.i = xor i64 %xor8.i130.i, %xor.i129.i
  %xor15.i137.i = xor i64 %xor12.i134.i, %661
  %xor16.i138.i = xor i64 %xor12.i134.i, %667
  %xor17.i139.i = xor i64 %xor16.i138.i, %xor10.i132.i
  %xor18.i140.i = xor i64 %665, %xor14.i136.i
  %xor19.i141.i = xor i64 %xor18.i140.i, %666
  %xor20.i142.i = xor i64 %xor18.i140.i, %662
  %xor21.i143.i = xor i64 %xor19.i141.i, %668
  %xor22.i144.i = xor i64 %xor19.i141.i, %xor11.i133.i
  %xor23.i145.i = xor i64 %xor20.i142.i, %xor9.i131.i
  %xor24.i146.i = xor i64 %668, %xor23.i145.i
  %xor25.i147.i = xor i64 %xor22.i144.i, %xor23.i145.i
  %xor27.i148.i = xor i64 %xor11.i133.i, %xor23.i145.i
  %and.i149.i = and i64 %xor14.i136.i, %xor19.i141.i
  %and30.i150.i = and i64 %xor17.i139.i, %xor21.i143.i
  %xor31.i151.i = xor i64 %and30.i150.i, %and.i149.i
  %and32.i152.i = and i64 %xor13.i135.i, %668
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
  %669 = xor i64 %xor10.i132.i, %and32.i152.i
  %670 = xor i64 %669, %xor22.i144.i
  %671 = xor i64 %670, %and.i149.i
  %xor49.i163.i = xor i64 %671, %xor43.i160.i
  %672 = xor i64 %xor27.i148.i, %and35.i154.i
  %673 = xor i64 %672, %xor8.i130.i
  %674 = xor i64 %673, %and34.i153.i
  %xor50.i164.i = xor i64 %674, %xor41.i158.i
  %675 = xor i64 %xor27.i148.i, %and37.i155.i
  %676 = xor i64 %675, %661
  %677 = xor i64 %676, %and34.i153.i
  %xor51.i165.i = xor i64 %677, %xor43.i160.i
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
  %and75.i189.i = and i64 %xor60.i174.i, %668
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
  %678 = xor i64 %xor107.i221.i, %xor101.i215.i
  %xor113.i227.i = xor i64 %678, -1
  %679 = xor i64 %xor105.i219.i, %xor93.i207.i
  %xor115.i228.i = xor i64 %679, -1
  %xor117.i229.i = xor i64 %xor98.i212.i, %xor111.i225.i
  %xor118.i230.i = xor i64 %xor96.i210.i, %xor111.i225.i
  %xor119.i231.i = xor i64 %xor92.i206.i, %xor110.i224.i
  %680 = xor i64 %xor117.i229.i, %xor109.i223.i
  %xor121.i232.i = xor i64 %680, -1
  %681 = xor i64 %xor110.i224.i, %xor100.i214.i
  %682 = xor i64 %681, %xor109.i223.i
  %xor123.i233.i = xor i64 %682, -1
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

for.body.i5.i:                                    ; preds = %for.end16.i, %for.body.i5.i
  %i.0.i3.i7862021 = phi i32 [ 0, %for.end16.i ], [ %inc.i27.i, %for.body.i5.i ]
  %arrayidx.i6.i807 = getelementptr inbounds nuw i64, ptr %q.i, i32 %i.0.i3.i7862021
  %683 = load i64, ptr %arrayidx.i6.i807, align 8
  %and.i7.i = and i64 %683, 65535
  %and1.i8.i = lshr i64 %683, 4
  %shr.i9.i = and i64 %and1.i8.i, 268369920
  %or.i10.i = or disjoint i64 %and.i7.i, %shr.i9.i
  %and2.i11.i = shl i64 %683, 12
  %shl.i12.i = and i64 %and2.i11.i, 4026531840
  %or3.i13.i = or disjoint i64 %or.i10.i, %shl.i12.i
  %and4.i14.i = lshr i64 %683, 8
  %shr5.i15.i = and i64 %and4.i14.i, 1095216660480
  %or6.i16.i = or disjoint i64 %or3.i13.i, %shr5.i15.i
  %and7.i17.i = shl i64 %683, 8
  %shl8.i18.i = and i64 %and7.i17.i, 280375465082880
  %or9.i19.i = or disjoint i64 %or6.i16.i, %shl8.i18.i
  %and10.i20.i = lshr i64 %683, 12
  %shr11.i21.i = and i64 %and10.i20.i, 4222124650659840
  %or12.i22.i = or disjoint i64 %or9.i19.i, %shr11.i21.i
  %and13.i23.i = shl i64 %683, 4
  %shl14.i24.i = and i64 %and13.i23.i, -4503599627370496
  %or15.i25.i = or i64 %or12.i22.i, %shl14.i24.i
  %arrayidx16.i26.i = getelementptr inbounds nuw i64, ptr %q.i, i32 %i.0.i3.i7862021
  store i64 %or15.i25.i, ptr %arrayidx16.i26.i, align 8
  %inc.i27.i = add nuw nsw i32 %i.0.i3.i7862021, 1
  %exitcond.i4.i787.not = icmp eq i32 %inc.i27.i, 8
  br i1 %exitcond.i4.i787.not, label %shift_rows.exit28.i, label %for.body.i5.i, !llvm.loop !37

shift_rows.exit28.i:                              ; preds = %for.body.i5.i
  %add.ptr20.i = getelementptr inbounds nuw i8, ptr %308, i32 640
  %684 = load i64, ptr %add.ptr20.i, align 8
  %685 = load i64, ptr %q.i, align 8
  %xor.i74.i = xor i64 %685, %684
  store i64 %xor.i74.i, ptr %q.i, align 8
  %arrayidx2.i75.i = getelementptr inbounds nuw i8, ptr %308, i32 648
  %686 = load i64, ptr %arrayidx2.i75.i, align 8
  %arrayidx3.i76.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %687 = load i64, ptr %arrayidx3.i76.i, align 8
  %xor4.i77.i = xor i64 %687, %686
  store i64 %xor4.i77.i, ptr %arrayidx3.i76.i, align 8
  %arrayidx5.i78.i = getelementptr inbounds nuw i8, ptr %308, i32 656
  %688 = load i64, ptr %arrayidx5.i78.i, align 8
  %arrayidx6.i79.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %689 = load i64, ptr %arrayidx6.i79.i, align 8
  %xor7.i80.i = xor i64 %689, %688
  store i64 %xor7.i80.i, ptr %arrayidx6.i79.i, align 8
  %arrayidx8.i81.i = getelementptr inbounds nuw i8, ptr %308, i32 664
  %690 = load i64, ptr %arrayidx8.i81.i, align 8
  %arrayidx9.i82.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %691 = load i64, ptr %arrayidx9.i82.i, align 8
  %xor10.i83.i = xor i64 %691, %690
  store i64 %xor10.i83.i, ptr %arrayidx9.i82.i, align 8
  %arrayidx11.i84.i = getelementptr inbounds nuw i8, ptr %308, i32 672
  %692 = load i64, ptr %arrayidx11.i84.i, align 8
  %arrayidx12.i85.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %693 = load i64, ptr %arrayidx12.i85.i, align 8
  %xor13.i86.i = xor i64 %693, %692
  store i64 %xor13.i86.i, ptr %arrayidx12.i85.i, align 8
  %arrayidx14.i87.i = getelementptr inbounds nuw i8, ptr %308, i32 680
  %694 = load i64, ptr %arrayidx14.i87.i, align 8
  %arrayidx15.i88.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %695 = load i64, ptr %arrayidx15.i88.i, align 8
  %xor16.i89.i = xor i64 %695, %694
  store i64 %xor16.i89.i, ptr %arrayidx15.i88.i, align 8
  %arrayidx17.i90.i = getelementptr inbounds nuw i8, ptr %308, i32 688
  %696 = load i64, ptr %arrayidx17.i90.i, align 8
  %arrayidx18.i91.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %697 = load i64, ptr %arrayidx18.i91.i, align 8
  %xor19.i92.i = xor i64 %697, %696
  store i64 %xor19.i92.i, ptr %arrayidx18.i91.i, align 8
  %arrayidx20.i93.i = getelementptr inbounds nuw i8, ptr %308, i32 696
  %698 = load i64, ptr %arrayidx20.i93.i, align 8
  %arrayidx21.i94.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %699 = load i64, ptr %arrayidx21.i94.i, align 8
  %xor22.i95.i = xor i64 %699, %698
  store i64 %xor22.i95.i, ptr %arrayidx21.i94.i, align 8
  %700 = load i64, ptr %q.i, align 8
  %arrayidx1.i241.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %701 = load i64, ptr %arrayidx1.i241.i, align 8
  %and.i242.i = and i64 %700, 6148914691236517205
  %and2.i243.i = shl i64 %701, 1
  %shl.i244.i = and i64 %and2.i243.i, -6148914691236517206
  %or.i245.i = or disjoint i64 %and.i242.i, %shl.i244.i
  store i64 %or.i245.i, ptr %q.i, align 8
  %and4.i246.i = lshr i64 %700, 1
  %shr.i247.i = and i64 %and4.i246.i, 6148914691236517205
  %and5.i.i788 = and i64 %701, -6148914691236517206
  %or6.i248.i = or disjoint i64 %shr.i247.i, %and5.i.i788
  %arrayidx7.i249.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or6.i248.i, ptr %arrayidx7.i249.i, align 8
  %arrayidx11.i250.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %702 = load i64, ptr %arrayidx11.i250.i, align 8
  %arrayidx12.i251.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %703 = load i64, ptr %arrayidx12.i251.i, align 8
  %and13.i252.i = and i64 %702, 6148914691236517205
  %and14.i253.i = shl i64 %703, 1
  %shl15.i.i = and i64 %and14.i253.i, -6148914691236517206
  %or16.i.i = or disjoint i64 %and13.i252.i, %shl15.i.i
  %arrayidx17.i254.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or16.i.i, ptr %arrayidx17.i254.i, align 8
  %and18.i.i789 = lshr i64 %702, 1
  %shr19.i.i790 = and i64 %and18.i.i789, 6148914691236517205
  %and20.i.i791 = and i64 %703, -6148914691236517206
  %or21.i.i = or disjoint i64 %shr19.i.i790, %and20.i.i791
  %arrayidx22.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or21.i.i, ptr %arrayidx22.i.i, align 8
  %arrayidx27.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %704 = load i64, ptr %arrayidx27.i.i, align 8
  %arrayidx28.i255.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %705 = load i64, ptr %arrayidx28.i255.i, align 8
  %and29.i.i = and i64 %704, 6148914691236517205
  %and30.i256.i = shl i64 %705, 1
  %shl31.i.i = and i64 %and30.i256.i, -6148914691236517206
  %or32.i257.i = or disjoint i64 %and29.i.i, %shl31.i.i
  %arrayidx33.i258.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or32.i257.i, ptr %arrayidx33.i258.i, align 8
  %and34.i259.i = lshr i64 %704, 1
  %shr35.i.i = and i64 %and34.i259.i, 6148914691236517205
  %and36.i.i = and i64 %705, -6148914691236517206
  %or37.i.i = or disjoint i64 %shr35.i.i, %and36.i.i
  %arrayidx38.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or37.i.i, ptr %arrayidx38.i.i, align 8
  %arrayidx43.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %706 = load i64, ptr %arrayidx43.i.i, align 8
  %arrayidx44.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %707 = load i64, ptr %arrayidx44.i.i, align 8
  %and45.i.i = and i64 %706, 6148914691236517205
  %and46.i.i = shl i64 %707, 1
  %shl47.i.i = and i64 %and46.i.i, -6148914691236517206
  %or48.i.i = or disjoint i64 %and45.i.i, %shl47.i.i
  %arrayidx49.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or48.i.i, ptr %arrayidx49.i.i, align 8
  %and50.i.i = lshr i64 %706, 1
  %shr51.i.i = and i64 %and50.i.i, 6148914691236517205
  %and52.i.i = and i64 %707, -6148914691236517206
  %or53.i.i = or disjoint i64 %shr51.i.i, %and52.i.i
  %arrayidx54.i260.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or53.i.i, ptr %arrayidx54.i260.i, align 8
  %708 = load i64, ptr %q.i, align 8
  %arrayidx60.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %709 = load i64, ptr %arrayidx60.i.i, align 8
  %and61.i.i = and i64 %708, 3689348814741910323
  %and62.i.i = shl i64 %709, 2
  %shl63.i.i = and i64 %and62.i.i, -3689348814741910324
  %or64.i.i = or disjoint i64 %and61.i.i, %shl63.i.i
  store i64 %or64.i.i, ptr %q.i, align 8
  %and66.i261.i = lshr i64 %708, 2
  %shr67.i.i = and i64 %and66.i261.i, 3689348814741910323
  %and68.i.i = and i64 %709, -3689348814741910324
  %or69.i.i = or disjoint i64 %shr67.i.i, %and68.i.i
  %arrayidx70.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or69.i.i, ptr %arrayidx70.i.i, align 8
  %arrayidx75.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %710 = load i64, ptr %arrayidx75.i.i, align 8
  %arrayidx76.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %711 = load i64, ptr %arrayidx76.i.i, align 8
  %and77.i262.i = and i64 %710, 3689348814741910323
  %and78.i263.i = shl i64 %711, 2
  %shl79.i.i = and i64 %and78.i263.i, -3689348814741910324
  %or80.i.i = or disjoint i64 %and77.i262.i, %shl79.i.i
  %arrayidx81.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or80.i.i, ptr %arrayidx81.i.i, align 8
  %and82.i264.i = lshr i64 %710, 2
  %shr83.i.i = and i64 %and82.i264.i, 3689348814741910323
  %and84.i265.i = and i64 %711, -3689348814741910324
  %or85.i.i = or disjoint i64 %shr83.i.i, %and84.i265.i
  %arrayidx86.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or85.i.i, ptr %arrayidx86.i.i, align 8
  %arrayidx91.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %712 = load i64, ptr %arrayidx91.i.i, align 8
  %arrayidx92.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %713 = load i64, ptr %arrayidx92.i.i, align 8
  %and93.i.i = and i64 %712, 3689348814741910323
  %and94.i.i = shl i64 %713, 2
  %shl95.i.i = and i64 %and94.i.i, -3689348814741910324
  %or96.i.i = or disjoint i64 %and93.i.i, %shl95.i.i
  %arrayidx97.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or96.i.i, ptr %arrayidx97.i.i, align 8
  %and98.i.i = lshr i64 %712, 2
  %shr99.i.i = and i64 %and98.i.i, 3689348814741910323
  %and100.i.i = and i64 %713, -3689348814741910324
  %or101.i.i = or disjoint i64 %shr99.i.i, %and100.i.i
  %arrayidx102.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or101.i.i, ptr %arrayidx102.i.i, align 8
  %arrayidx107.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %714 = load i64, ptr %arrayidx107.i.i, align 8
  %arrayidx108.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %715 = load i64, ptr %arrayidx108.i.i, align 8
  %and109.i.i = and i64 %714, 3689348814741910323
  %and110.i.i = shl i64 %715, 2
  %shl111.i.i = and i64 %and110.i.i, -3689348814741910324
  %or112.i.i = or disjoint i64 %and109.i.i, %shl111.i.i
  %arrayidx113.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or112.i.i, ptr %arrayidx113.i.i, align 8
  %and114.i.i = lshr i64 %714, 2
  %shr115.i.i = and i64 %and114.i.i, 3689348814741910323
  %and116.i.i = and i64 %715, -3689348814741910324
  %or117.i.i = or disjoint i64 %shr115.i.i, %and116.i.i
  %arrayidx118.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or117.i.i, ptr %arrayidx118.i.i, align 8
  %716 = load i64, ptr %q.i, align 8
  %arrayidx124.i266.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %717 = load i64, ptr %arrayidx124.i266.i, align 8
  %and125.i.i = and i64 %716, 1085102592571150095
  %and126.i.i = shl i64 %717, 4
  %shl127.i.i = and i64 %and126.i.i, -1085102592571150096
  %or128.i.i = or disjoint i64 %and125.i.i, %shl127.i.i
  store i64 %or128.i.i, ptr %q.i, align 8
  %and130.i.i = lshr i64 %716, 4
  %shr131.i.i = and i64 %and130.i.i, 1085102592571150095
  %and132.i.i = and i64 %717, -1085102592571150096
  %or133.i.i = or disjoint i64 %shr131.i.i, %and132.i.i
  %arrayidx134.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or133.i.i, ptr %arrayidx134.i.i, align 8
  %arrayidx139.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %718 = load i64, ptr %arrayidx139.i.i, align 8
  %arrayidx140.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %719 = load i64, ptr %arrayidx140.i.i, align 8
  %and141.i.i = and i64 %718, 1085102592571150095
  %and142.i.i = shl i64 %719, 4
  %shl143.i.i = and i64 %and142.i.i, -1085102592571150096
  %or144.i.i = or disjoint i64 %and141.i.i, %shl143.i.i
  %arrayidx145.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or144.i.i, ptr %arrayidx145.i.i, align 8
  %and146.i.i = lshr i64 %718, 4
  %shr147.i.i = and i64 %and146.i.i, 1085102592571150095
  %and148.i.i = and i64 %719, -1085102592571150096
  %or149.i.i = or disjoint i64 %shr147.i.i, %and148.i.i
  %arrayidx150.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or149.i.i, ptr %arrayidx150.i.i, align 8
  %arrayidx155.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %720 = load i64, ptr %arrayidx155.i.i, align 8
  %arrayidx156.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %721 = load i64, ptr %arrayidx156.i.i, align 8
  %and157.i.i = and i64 %720, 1085102592571150095
  %and158.i.i = shl i64 %721, 4
  %shl159.i.i = and i64 %and158.i.i, -1085102592571150096
  %or160.i.i = or disjoint i64 %and157.i.i, %shl159.i.i
  %arrayidx161.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or160.i.i, ptr %arrayidx161.i.i, align 8
  %and162.i.i = lshr i64 %720, 4
  %shr163.i.i = and i64 %and162.i.i, 1085102592571150095
  %and164.i.i = and i64 %721, -1085102592571150096
  %or165.i.i = or disjoint i64 %shr163.i.i, %and164.i.i
  %arrayidx166.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or165.i.i, ptr %arrayidx166.i.i, align 8
  %arrayidx171.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %722 = load i64, ptr %arrayidx171.i.i, align 8
  %arrayidx172.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %723 = load i64, ptr %arrayidx172.i.i, align 8
  %and173.i.i = and i64 %722, 1085102592571150095
  %and174.i.i = shl i64 %723, 4
  %shl175.i.i = and i64 %and174.i.i, -1085102592571150096
  %or176.i.i = or disjoint i64 %and173.i.i, %shl175.i.i
  %arrayidx177.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or176.i.i, ptr %arrayidx177.i.i, align 8
  %and178.i.i = lshr i64 %722, 4
  %shr179.i.i = and i64 %and178.i.i, 1085102592571150095
  %and180.i.i = and i64 %723, -1085102592571150096
  %or181.i267.i = or disjoint i64 %shr179.i.i, %and180.i.i
  %arrayidx182.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or181.i267.i, ptr %arrayidx182.i.i, align 8
  br label %for.body24.i

while.cond.i.i794.preheader:                      ; preds = %for.body24.i
  br label %while.body.i.i798

for.body24.i:                                     ; preds = %shift_rows.exit28.i, %for.body24.i
  %i.2.i7922022 = phi i32 [ 0, %shift_rows.exit28.i ], [ %inc32.i, %for.body24.i ]
  %add.ptr27.idx.i = shl nuw nsw i32 %i.2.i7922022, 4
  %add.ptr27.i = getelementptr inbounds nuw i8, ptr %w.i, i32 %add.ptr27.idx.i
  %arrayidx28.i = getelementptr inbounds nuw [8 x i64], ptr %q.i, i32 0, i32 %i.2.i7922022
  %724 = load i64, ptr %arrayidx28.i, align 8
  %add29.i = or disjoint i32 %i.2.i7922022, 4
  %arrayidx30.i = getelementptr inbounds nuw [8 x i64], ptr %q.i, i32 0, i32 %add29.i
  %725 = load i64, ptr %arrayidx30.i, align 8
  %and.i29.i = and i64 %724, 71777214294589695
  %and1.i30.i = and i64 %725, 71777214294589695
  %shr.i31.i = lshr i64 %724, 8
  %and2.i32.i = and i64 %shr.i31.i, 71776119077928960
  %shr3.i33.i = lshr i64 %725, 8
  %and4.i34.i = and i64 %shr3.i33.i, 71776119077928960
  %shr5.i35.i = lshr i64 %and.i29.i, 8
  %or.i36.i = or disjoint i64 %and.i29.i, %shr5.i35.i
  %shr6.i37.i = lshr i64 %and1.i30.i, 8
  %or7.i.i = or disjoint i64 %and1.i30.i, %shr6.i37.i
  %726 = and i64 %724, 280375465148160
  %727 = or disjoint i64 %and2.i32.i, %726
  %or9.i38.i = lshr exact i64 %727, 8
  %728 = and i64 %725, 280375465148160
  %729 = or disjoint i64 %and4.i34.i, %728
  %or11.i.i = lshr exact i64 %729, 8
  %and12.i.i806 = and i64 %or.i36.i, 281470681808895
  %and13.i39.i = and i64 %or7.i.i, 281470681808895
  %shr16.i.i = lshr i64 %and12.i.i806, 16
  %or181.i.i = or disjoint i64 %and12.i.i806, %shr16.i.i
  %or18.i.i = trunc i64 %or181.i.i to i32
  store i32 %or18.i.i, ptr %add.ptr27.i, align 4
  %shr20.i.i = lshr i64 %and13.i39.i, 16
  %or222.i.i = or disjoint i64 %and13.i39.i, %shr20.i.i
  %or22.i.i = trunc i64 %or222.i.i to i32
  %arrayidx23.i.i = getelementptr inbounds nuw i8, ptr %add.ptr27.i, i32 4
  store i32 %or22.i.i, ptr %arrayidx23.i.i, align 4
  %shr25.i.i = lshr i64 %727, 24
  %or273.i.i = or disjoint i64 %or9.i38.i, %shr25.i.i
  %or27.i.i = trunc i64 %or273.i.i to i32
  %arrayidx28.i.i = getelementptr inbounds nuw i8, ptr %add.ptr27.i, i32 8
  store i32 %or27.i.i, ptr %arrayidx28.i.i, align 4
  %shr30.i.i = lshr i64 %729, 24
  %or324.i.i = or disjoint i64 %or11.i.i, %shr30.i.i
  %or32.i.i = trunc i64 %or324.i.i to i32
  %arrayidx33.i.i = getelementptr inbounds nuw i8, ptr %add.ptr27.i, i32 12
  store i32 %or32.i.i, ptr %arrayidx33.i.i, align 4
  %inc32.i = add nuw nsw i32 %i.2.i7922022, 1
  %exitcond2.i793.not = icmp eq i32 %inc32.i, 4
  br i1 %exitcond2.i793.not, label %while.cond.i.i794.preheader, label %for.body24.i, !llvm.loop !38

while.body.i.i798:                                ; preds = %while.cond.i.i794.preheader, %while.body.i.i798
  %dst.addr.0.i.i2025 = phi ptr [ %tmp.i18, %while.cond.i.i794.preheader ], [ %add.ptr.i.i805, %while.body.i.i798 ]
  %v.addr.0.i.i7962024 = phi ptr [ %w.i, %while.cond.i.i794.preheader ], [ %incdec.ptr.i.i800, %while.body.i.i798 ]
  %num.addr.0.i.i7952023 = phi i32 [ 16, %while.cond.i.i794.preheader ], [ %dec.i.i799, %while.body.i.i798 ]
  %dec.i.i799 = add nsw i32 %num.addr.0.i.i7952023, -1
  %incdec.ptr.i.i800 = getelementptr inbounds nuw i8, ptr %v.addr.0.i.i7962024, i32 4
  %730 = load i32, ptr %v.addr.0.i.i7962024, align 4
  %conv.i.i801 = trunc i32 %730 to i8
  store i8 %conv.i.i801, ptr %dst.addr.0.i.i2025, align 1
  %shr.i.i802 = lshr i32 %730, 8
  %conv1.i.i = trunc i32 %shr.i.i802 to i8
  %arrayidx2.i.i = getelementptr inbounds nuw i8, ptr %dst.addr.0.i.i2025, i32 1
  store i8 %conv1.i.i, ptr %arrayidx2.i.i, align 1
  %shr3.i.i = lshr i32 %730, 16
  %conv4.i.i803 = trunc i32 %shr3.i.i to i8
  %arrayidx5.i.i = getelementptr inbounds nuw i8, ptr %dst.addr.0.i.i2025, i32 2
  store i8 %conv4.i.i803, ptr %arrayidx5.i.i, align 1
  %shr6.i.i = lshr i32 %730, 24
  %conv7.i.i = trunc nuw i32 %shr6.i.i to i8
  %arrayidx8.i.i804 = getelementptr inbounds nuw i8, ptr %dst.addr.0.i.i2025, i32 3
  store i8 %conv7.i.i, ptr %arrayidx8.i.i804, align 1
  %add.ptr.i.i805 = getelementptr inbounds nuw i8, ptr %dst.addr.0.i.i2025, i32 4
  %cmp.not.i.i797 = icmp eq i32 %dec.i.i799, 0
  br i1 %cmp.not.i.i797, label %aes_ecb4x.exit, label %while.body.i.i798, !llvm.loop !39

aes_ecb4x.exit:                                   ; preds = %while.body.i.i798
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %w.i)
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %q.i)
  %add.ptr.i74 = getelementptr inbounds nuw i8, ptr %ivw.i, i32 12
  %731 = load i32, ptr %add.ptr.i74, align 4
  %732 = call i32 @llvm.bswap.i32(i32 %731)
  %add.i8.i75 = add i32 %732, 4
  %733 = call i32 @llvm.bswap.i32(i32 %add.i8.i75)
  store i32 %733, ptr %add.ptr.i74, align 4
  %add.ptr1.i76 = getelementptr inbounds nuw i8, ptr %ivw.i, i32 28
  %734 = load i32, ptr %add.ptr1.i76, align 4
  %735 = call i32 @llvm.bswap.i32(i32 %734)
  %add.i5.i77 = add i32 %735, 4
  %736 = call i32 @llvm.bswap.i32(i32 %add.i5.i77)
  store i32 %736, ptr %add.ptr1.i76, align 4
  %add.ptr2.i78 = getelementptr inbounds nuw i8, ptr %ivw.i, i32 44
  %737 = load i32, ptr %add.ptr2.i78, align 4
  %738 = call i32 @llvm.bswap.i32(i32 %737)
  %add.i.i79 = add i32 %738, 4
  %739 = call i32 @llvm.bswap.i32(i32 %add.i.i79)
  store i32 %739, ptr %add.ptr2.i78, align 4
  %add.ptr3.i80 = getelementptr inbounds nuw i8, ptr %ivw.i, i32 60
  %740 = load i32, ptr %add.ptr3.i80, align 4
  %741 = call i32 @llvm.bswap.i32(i32 %740)
  %add.i2.i81 = add i32 %741, 4
  %742 = call i32 @llvm.bswap.i32(i32 %add.i2.i81)
  store i32 %742, ptr %add.ptr3.i80, align 4
  br label %for.body.i27

for.body.i27:                                     ; preds = %aes_ecb4x.exit, %for.body.i27
  %i.0.i262026 = phi i32 [ 0, %aes_ecb4x.exit ], [ %inc.i28, %for.body.i27 ]
  %arrayidx26.i = getelementptr inbounds nuw [64 x i8], ptr %tmp.i18, i32 0, i32 %i.0.i262026
  %743 = load i8, ptr %arrayidx26.i, align 1
  %arrayidx27.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i.lcssa, i32 %i.0.i262026
  store i8 %743, ptr %arrayidx27.i, align 1
  %inc.i28 = add nuw nsw i32 %i.0.i262026, 1
  %exitcond2038 = icmp ne i32 %inc.i28, 47
  br i1 %exitcond2038, label %for.body.i27, label %aes_ctr.exit.loopexit, !llvm.loop !40

aes_ctr.exit.loopexit:                            ; preds = %for.body.i27
  br label %aes_ctr.exit

aes_ctr.exit:                                     ; preds = %aes_ctr.exit.loopexit
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %ivw.i)
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %tmp.i18)
  %744 = load ptr, ptr %ctx.i, align 4
  call void @free(ptr noundef %744) #8
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %ctx.i)
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %iv.i)
  call void @llvm.lifetime.start.p0(i64 40, ptr nonnull %tmp.i)
  br label %for.body.i.i

for.cond.i2.preheader:                            ; preds = %for.body.i.i
  br label %for.body.i4

for.body.i.i:                                     ; preds = %aes_ctr.exit, %for.body.i.i
  %i.0.i.i2027 = phi i32 [ 0, %aes_ctr.exit ], [ %inc.i.i, %for.body.i.i ]
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %tmp.i, i32 %i.0.i.i2027
  store i8 0, ptr %arrayidx.i.i, align 1
  %inc.i.i = add nuw nsw i32 %i.0.i.i2027, 1
  %exitcond.i.i.not = icmp eq i32 %inc.i.i, 40
  br i1 %exitcond.i.i.not, label %for.cond.i2.preheader, label %for.body.i.i, !llvm.loop !41

for.body.i4:                                      ; preds = %for.cond.i2.preheader, %for.body.i4
  %i.0.in.i2028 = phi i32 [ 3705, %for.cond.i2.preheader ], [ %i.0.i5, %for.body.i4 ]
  %i.0.i5 = add nsw i32 %i.0.in.i2028, -1
  %div1.i = mul nuw nsw i32 %i.0.i5, 39
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %sk, i32 %div1.i
  %call.i6 = call ptr @memcpy(ptr noundef nonnull %tmp.i, ptr noundef %add.ptr.i, i32 noundef 39) #8
  %mul4.i = mul nuw nsw i32 %i.0.i5, 40
  %add.ptr5.i = getelementptr inbounds nuw i8, ptr %sk, i32 %mul4.i
  %call8.i = call ptr @memcpy(ptr noundef %add.ptr5.i, ptr noundef nonnull %tmp.i, i32 noundef 40) #8
  %cmp.i3 = icmp ugt i32 %i.0.i5, 0
  br i1 %cmp.i3, label %for.body.i4, label %unpack_m_vecs.exit, !llvm.loop !42

unpack_m_vecs.exit:                               ; preds = %for.body.i4
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %tmp.i)
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %sk, i32 123240
  br label %for.cond1.preheader.i

for.cond1.preheader.i:                            ; preds = %unpack_m_vecs.exit, %for.inc27.i
  %r.0.i2037 = phi i32 [ 0, %unpack_m_vecs.exit ], [ %inc28.i, %for.inc27.i ]
  %bs_mat_entries_used.0.i2036 = phi i32 [ 0, %unpack_m_vecs.exit ], [ %split, %for.inc27.i ]
  %indvars.iv.i2035 = phi i32 [ 78, %unpack_m_vecs.exit ], [ %indvars.iv.next.i, %for.inc27.i ]
  %745 = add i32 %bs_mat_entries_used.0.i2036, %indvars.iv.i2035
  br label %for.body3.i.lr.ph

for.body3.i.lr.ph:                                ; preds = %for.cond1.preheader.i
  br label %for.body3.i

for.body3.i:                                      ; preds = %for.body3.i.lr.ph, %for.inc25.i
  %c.0.i2034 = phi i32 [ %r.0.i2037, %for.body3.i.lr.ph ], [ %inc.i84, %for.inc25.i ]
  %bs_mat_entries_used.1.i2033 = phi i32 [ %bs_mat_entries_used.0.i2036, %for.body3.i.lr.ph ], [ %bs_mat_entries_used.2.i, %for.inc25.i ]
  %cmp4.i = icmp eq i32 %c.0.i2034, %r.0.i2037
  br i1 %cmp4.i, label %for.inc25.i, label %for.cond5.i.preheader

for.cond5.i.preheader:                            ; preds = %for.body3.i
  br label %for.body7.i

for.body7.i:                                      ; preds = %for.cond5.i.preheader, %m_vec_mul_add.exit42.i
  %k.0.i2031 = phi i32 [ 0, %for.cond5.i.preheader ], [ %add23.i, %m_vec_mul_add.exit42.i ]
  %add.ptr.idx.i = mul nsw i32 %bs_mat_entries_used.1.i2033, 40
  %add.ptr.i85 = getelementptr inbounds i8, ptr %sk, i32 %add.ptr.idx.i
  %mul8.i = shl nuw nsw i32 %c.0.i2034, 3
  %add9.i = or disjoint i32 %mul8.i, %k.0.i2031
  %arrayidx.i86 = getelementptr inbounds nuw i8, ptr %add.ptr1, i32 %add9.i
  %746 = load i8, ptr %arrayidx.i86, align 1
  %mul10.i = shl nuw nsw i32 %r.0.i2037, 3
  %add11.i87 = or disjoint i32 %mul10.i, %k.0.i2031
  %add.ptr13.idx.i = mul nuw nsw i32 %add11.i87, 40
  %add.ptr13.i = getelementptr inbounds nuw i8, ptr %add.ptr5, i32 %add.ptr13.idx.i
  %conv.i.i.i88 = zext i8 %746 to i32
  %mul.i.i.i89 = mul i32 %conv.i.i.i88, 134480385
  %and.i.i.i = and i32 %mul.i.i.i89, -252645136
  %shr.i.i.i90 = lshr exact i32 %and.i.i.i, 4
  %shr1.i.i.i = lshr exact i32 %and.i.i.i, 3
  %747 = xor i32 %shr.i.i.i90, %shr1.i.i.i
  %xor2.i.i.i = xor i32 %747, %mul.i.i.i89
  br label %for.body.i.i94

for.body.i.i94:                                   ; preds = %for.body7.i, %for.body.i.i94
  %i.0.i.i922029 = phi i32 [ 0, %for.body7.i ], [ %inc.i.i98, %for.body.i.i94 ]
  %arrayidx.i.i95 = getelementptr inbounds nuw i64, ptr %add.ptr.i85, i32 %i.0.i.i922029
  %748 = load i64, ptr %arrayidx.i.i95, align 8
  %and.i.i = and i64 %748, 1229782938247303441
  %and1.i.i = and i32 %xor2.i.i.i, 255
  %conv.i.i96 = zext nneg i32 %and1.i.i to i64
  %mul.i.i97 = mul i64 %and.i.i, %conv.i.i96
  %shr.i.i = lshr i64 %748, 1
  %and3.i.i = and i64 %shr.i.i, 1229782938247303441
  %shr4.i.i = lshr i32 %xor2.i.i.i, 8
  %and5.i.i = and i32 %shr4.i.i, 15
  %conv6.i.i = zext nneg i32 %and5.i.i to i64
  %mul7.i.i = mul nuw i64 %and3.i.i, %conv6.i.i
  %xor.i.i = xor i64 %mul.i.i97, %mul7.i.i
  %arrayidx8.i.i = getelementptr inbounds nuw i64, ptr %add.ptr.i85, i32 %i.0.i.i922029
  %749 = load i64, ptr %arrayidx8.i.i, align 8
  %shr9.i.i = lshr i64 %749, 2
  %and10.i.i = and i64 %shr9.i.i, 1229782938247303441
  %shr11.i.i = lshr i32 %xor2.i.i.i, 16
  %and12.i.i = and i32 %shr11.i.i, 15
  %conv13.i.i = zext nneg i32 %and12.i.i to i64
  %mul14.i.i = mul nuw i64 %and10.i.i, %conv13.i.i
  %xor15.i.i = xor i64 %xor.i.i, %mul14.i.i
  %arrayidx16.i.i = getelementptr inbounds nuw i64, ptr %add.ptr.i85, i32 %i.0.i.i922029
  %750 = load i64, ptr %arrayidx16.i.i, align 8
  %shr17.i.i = lshr i64 %750, 3
  %and18.i.i = and i64 %shr17.i.i, 1229782938247303441
  %shr19.i.i = lshr i32 %xor2.i.i.i, 24
  %and20.i.i = and i32 %shr19.i.i, 15
  %conv21.i.i = zext nneg i32 %and20.i.i to i64
  %mul22.i.i = mul nuw i64 %and18.i.i, %conv21.i.i
  %xor23.i.i = xor i64 %xor15.i.i, %mul22.i.i
  %arrayidx24.i.i = getelementptr inbounds nuw i64, ptr %add.ptr13.i, i32 %i.0.i.i922029
  %751 = load i64, ptr %arrayidx24.i.i, align 8
  %xor25.i.i = xor i64 %751, %xor23.i.i
  store i64 %xor25.i.i, ptr %arrayidx24.i.i, align 8
  %inc.i.i98 = add nuw nsw i32 %i.0.i.i922029, 1
  %exitcond.i.i93.not = icmp eq i32 %inc.i.i98, 5
  br i1 %exitcond.i.i93.not, label %m_vec_mul_add.exit.i, label %for.body.i.i94, !llvm.loop !43

m_vec_mul_add.exit.i:                             ; preds = %for.body.i.i94
  %add.ptr15.idx.i = mul nsw i32 %bs_mat_entries_used.1.i2033, 40
  %add.ptr15.i = getelementptr inbounds i8, ptr %sk, i32 %add.ptr15.idx.i
  %mul16.i = shl nuw nsw i32 %r.0.i2037, 3
  %add17.i = or disjoint i32 %mul16.i, %k.0.i2031
  %arrayidx18.i = getelementptr inbounds nuw i8, ptr %add.ptr1, i32 %add17.i
  %752 = load i8, ptr %arrayidx18.i, align 1
  %mul19.i = shl nuw nsw i32 %c.0.i2034, 3
  %add20.i = or disjoint i32 %mul19.i, %k.0.i2031
  %add.ptr22.idx.i = mul nuw nsw i32 %add20.i, 40
  %add.ptr22.i = getelementptr inbounds nuw i8, ptr %add.ptr5, i32 %add.ptr22.idx.i
  %conv.i.i1.i = zext i8 %752 to i32
  %mul.i.i2.i = mul i32 %conv.i.i1.i, 134480385
  %and.i.i3.i = and i32 %mul.i.i2.i, -252645136
  %shr.i.i4.i = lshr exact i32 %and.i.i3.i, 4
  %shr1.i.i5.i = lshr exact i32 %and.i.i3.i, 3
  %753 = xor i32 %shr.i.i4.i, %shr1.i.i5.i
  %xor2.i.i6.i = xor i32 %753, %mul.i.i2.i
  br label %for.body.i10.i

for.body.i10.i:                                   ; preds = %m_vec_mul_add.exit.i, %for.body.i10.i
  %i.0.i8.i2030 = phi i32 [ 0, %m_vec_mul_add.exit.i ], [ %inc.i41.i, %for.body.i10.i ]
  %arrayidx.i11.i = getelementptr inbounds nuw i64, ptr %add.ptr15.i, i32 %i.0.i8.i2030
  %754 = load i64, ptr %arrayidx.i11.i, align 8
  %and.i12.i = and i64 %754, 1229782938247303441
  %and1.i13.i = and i32 %xor2.i.i6.i, 255
  %conv.i14.i = zext nneg i32 %and1.i13.i to i64
  %mul.i15.i = mul i64 %and.i12.i, %conv.i14.i
  %shr.i16.i = lshr i64 %754, 1
  %and3.i17.i = and i64 %shr.i16.i, 1229782938247303441
  %shr4.i18.i = lshr i32 %xor2.i.i6.i, 8
  %and5.i19.i = and i32 %shr4.i18.i, 15
  %conv6.i20.i = zext nneg i32 %and5.i19.i to i64
  %mul7.i21.i = mul nuw i64 %and3.i17.i, %conv6.i20.i
  %xor.i22.i = xor i64 %mul.i15.i, %mul7.i21.i
  %arrayidx8.i23.i = getelementptr inbounds nuw i64, ptr %add.ptr15.i, i32 %i.0.i8.i2030
  %755 = load i64, ptr %arrayidx8.i23.i, align 8
  %shr9.i24.i = lshr i64 %755, 2
  %and10.i25.i = and i64 %shr9.i24.i, 1229782938247303441
  %shr11.i26.i = lshr i32 %xor2.i.i6.i, 16
  %and12.i27.i = and i32 %shr11.i26.i, 15
  %conv13.i28.i = zext nneg i32 %and12.i27.i to i64
  %mul14.i29.i = mul nuw i64 %and10.i25.i, %conv13.i28.i
  %xor15.i30.i = xor i64 %xor.i22.i, %mul14.i29.i
  %arrayidx16.i31.i = getelementptr inbounds nuw i64, ptr %add.ptr15.i, i32 %i.0.i8.i2030
  %756 = load i64, ptr %arrayidx16.i31.i, align 8
  %shr17.i32.i = lshr i64 %756, 3
  %and18.i33.i = and i64 %shr17.i32.i, 1229782938247303441
  %shr19.i34.i = lshr i32 %xor2.i.i6.i, 24
  %and20.i35.i = and i32 %shr19.i34.i, 15
  %conv21.i36.i = zext nneg i32 %and20.i35.i to i64
  %mul22.i37.i = mul nuw i64 %and18.i33.i, %conv21.i36.i
  %xor23.i38.i = xor i64 %xor15.i30.i, %mul22.i37.i
  %arrayidx24.i39.i = getelementptr inbounds nuw i64, ptr %add.ptr22.i, i32 %i.0.i8.i2030
  %757 = load i64, ptr %arrayidx24.i39.i, align 8
  %xor25.i40.i = xor i64 %757, %xor23.i38.i
  store i64 %xor25.i40.i, ptr %arrayidx24.i39.i, align 8
  %inc.i41.i = add nuw nsw i32 %i.0.i8.i2030, 1
  %exitcond.i9.i.not = icmp eq i32 %inc.i41.i, 5
  br i1 %exitcond.i9.i.not, label %m_vec_mul_add.exit42.i, label %for.body.i10.i, !llvm.loop !44

m_vec_mul_add.exit42.i:                           ; preds = %for.body.i10.i
  %add23.i = add nuw nsw i32 %k.0.i2031, 1
  %exitcond.i83.not = icmp eq i32 %add23.i, 8
  br i1 %exitcond.i83.not, label %for.inc25.i.loopexit, label %for.body7.i, !llvm.loop !45

for.inc25.i.loopexit:                             ; preds = %m_vec_mul_add.exit42.i
  br label %for.inc25.i

for.inc25.i:                                      ; preds = %for.inc25.i.loopexit, %for.body3.i
  %bs_mat_entries_used.2.i = add i32 %bs_mat_entries_used.1.i2033, 1
  %inc.i84 = add nuw nsw i32 %c.0.i2034, 1
  %exitcond1.i.not = icmp eq i32 %bs_mat_entries_used.2.i, %745
  br i1 %exitcond1.i.not, label %for.cond1.i.for.inc27.i_crit_edge, label %for.body3.i, !llvm.loop !46

for.cond1.i.for.inc27.i_crit_edge:                ; preds = %for.inc25.i
  %split = phi i32 [ %bs_mat_entries_used.2.i, %for.inc25.i ]
  br label %for.inc27.i

for.inc27.i:                                      ; preds = %for.cond1.i.for.inc27.i_crit_edge
  %inc28.i = add nuw nsw i32 %r.0.i2037, 1
  %indvars.iv.next.i = add nsw i32 %indvars.iv.i2035, -1
  %exitcond2.i.not = icmp eq i32 %inc28.i, 78
  br i1 %exitcond2.i.not, label %P1P1t_times_O.exit, label %for.cond1.preheader.i, !llvm.loop !47

P1P1t_times_O.exit:                               ; preds = %for.inc27.i
  %758 = load volatile ptr, ptr @mayo_secure_clear.memset_func, align 4
  %call.i1 = call ptr %758(ptr noundef nonnull %S, i32 noundef 0, i32 noundef 328) #8
  ret i32 0
}

declare dso_local ptr @memset(ptr noundef, i32 noundef, i32 noundef) #0

; Function Attrs: allocsize(0)
declare dso_local ptr @malloc(i32 noundef) local_unnamed_addr #2

declare dso_local void @exit(i32 noundef) local_unnamed_addr #0

; Function Attrs: inlinehint nounwind
define dso_local void @shake256_absorb(ptr noundef %state, ptr noundef %input, i32 noundef %inlen) local_unnamed_addr #1 {
entry:
  %t.i = alloca [200 x i8], align 1
  %call = call dereferenceable_or_null(200) ptr @malloc(i32 noundef 200) #7
  store ptr %call, ptr %state, align 4
  %cmp = icmp eq ptr %call, null
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef 111) #8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %0 = load ptr, ptr %state, align 4
  call void @llvm.lifetime.start.p0(i64 200, ptr nonnull %t.i)
  br label %for.body.i

while.cond.i.preheader:                           ; preds = %for.body.i
  %cmp1.not.i38 = icmp ult i32 %inlen, 136
  br i1 %cmp1.not.i38, label %for.cond10.i.preheader, label %for.cond2.i.preheader.lr.ph

for.cond2.i.preheader.lr.ph:                      ; preds = %while.cond.i.preheader
  br label %for.cond2.i.preheader

for.body.i:                                       ; preds = %if.end, %for.body.i
  %i.0.i8 = phi i32 [ 0, %if.end ], [ %inc.i, %for.body.i ]
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %0, i32 %i.0.i8
  store i64 0, ptr %arrayidx.i, align 8
  %inc.i = add nuw nsw i32 %i.0.i8, 1
  %exitcond.i.not = icmp eq i32 %inc.i, 25
  br i1 %exitcond.i.not, label %while.cond.i.preheader, label %for.body.i, !llvm.loop !48

for.cond2.i.preheader:                            ; preds = %for.cond2.i.preheader.lr.ph, %KeccakF1600_StatePermute.exit
  %mlen.addr.0.i40 = phi i32 [ %inlen, %for.cond2.i.preheader.lr.ph ], [ %sub.i, %KeccakF1600_StatePermute.exit ]
  %m.addr.0.i39 = phi ptr [ %input, %for.cond2.i.preheader.lr.ph ], [ %add.ptr9.i, %KeccakF1600_StatePermute.exit ]
  br label %for.body4.i

while.cond.i.for.cond10.i.preheader_crit_edge:    ; preds = %KeccakF1600_StatePermute.exit
  %split = phi ptr [ %add.ptr9.i, %KeccakF1600_StatePermute.exit ]
  %split41 = phi i32 [ %sub.i, %KeccakF1600_StatePermute.exit ]
  br label %for.cond10.i.preheader

for.cond10.i.preheader:                           ; preds = %while.cond.i.for.cond10.i.preheader_crit_edge, %while.cond.i.preheader
  %m.addr.0.i.lcssa = phi ptr [ %split, %while.cond.i.for.cond10.i.preheader_crit_edge ], [ %input, %while.cond.i.preheader ]
  %mlen.addr.0.i.lcssa = phi i32 [ %split41, %while.cond.i.for.cond10.i.preheader_crit_edge ], [ %inlen, %while.cond.i.preheader ]
  br label %for.body12.i

for.body4.i:                                      ; preds = %for.cond2.i.preheader, %load64.exit.i
  %i.1.i11 = phi i32 [ 0, %for.cond2.i.preheader ], [ %inc7.i, %load64.exit.i ]
  %mul.i = shl nuw nsw i32 %i.1.i11, 3
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %m.addr.0.i39, i32 %mul.i
  br label %for.inc.i.i

for.inc.i.i:                                      ; preds = %for.body4.i, %for.inc.i.i
  %i.0.i.i10 = phi i32 [ 0, %for.body4.i ], [ %inc.i.i, %for.inc.i.i ]
  %r.0.i.i9 = phi i64 [ 0, %for.body4.i ], [ %or.i.i, %for.inc.i.i ]
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 %i.0.i.i10
  %1 = load i8, ptr %arrayidx.i.i, align 1
  %conv.i.i = zext i8 %1 to i64
  %mul.i.i = shl nuw nsw i32 %i.0.i.i10, 3
  %sh_prom.i.i = zext nneg i32 %mul.i.i to i64
  %shl.i.i = shl nuw i64 %conv.i.i, %sh_prom.i.i
  %or.i.i = or i64 %r.0.i.i9, %shl.i.i
  %inc.i.i = add nuw nsw i32 %i.0.i.i10, 1
  %exitcond.i.i.not = icmp eq i32 %inc.i.i, 8
  br i1 %exitcond.i.i.not, label %load64.exit.i, label %for.inc.i.i, !llvm.loop !49

load64.exit.i:                                    ; preds = %for.inc.i.i
  %r.0.i.i.lcssa = phi i64 [ %or.i.i, %for.inc.i.i ]
  %arrayidx5.i = getelementptr inbounds nuw i64, ptr %0, i32 %i.1.i11
  %2 = load i64, ptr %arrayidx5.i, align 8
  %xor.i = xor i64 %2, %r.0.i.i.lcssa
  store i64 %xor.i, ptr %arrayidx5.i, align 8
  %inc7.i = add nuw nsw i32 %i.1.i11, 1
  %exitcond3.i.not = icmp eq i32 %inc7.i, 17
  br i1 %exitcond3.i.not, label %for.end8.i, label %for.body4.i, !llvm.loop !50

for.end8.i:                                       ; preds = %load64.exit.i
  %3 = load i64, ptr %0, align 8
  %arrayidx1.i = getelementptr inbounds nuw i8, ptr %0, i32 8
  %4 = load i64, ptr %arrayidx1.i, align 8
  %arrayidx2.i = getelementptr inbounds nuw i8, ptr %0, i32 16
  %5 = load i64, ptr %arrayidx2.i, align 8
  %arrayidx3.i = getelementptr inbounds nuw i8, ptr %0, i32 24
  %6 = load i64, ptr %arrayidx3.i, align 8
  %arrayidx4.i = getelementptr inbounds nuw i8, ptr %0, i32 32
  %7 = load i64, ptr %arrayidx4.i, align 8
  %arrayidx5.i1 = getelementptr inbounds nuw i8, ptr %0, i32 40
  %8 = load i64, ptr %arrayidx5.i1, align 8
  %arrayidx6.i = getelementptr inbounds nuw i8, ptr %0, i32 48
  %9 = load i64, ptr %arrayidx6.i, align 8
  %arrayidx7.i = getelementptr inbounds nuw i8, ptr %0, i32 56
  %10 = load i64, ptr %arrayidx7.i, align 8
  %arrayidx8.i = getelementptr inbounds nuw i8, ptr %0, i32 64
  %11 = load i64, ptr %arrayidx8.i, align 8
  %arrayidx9.i = getelementptr inbounds nuw i8, ptr %0, i32 72
  %12 = load i64, ptr %arrayidx9.i, align 8
  %arrayidx10.i = getelementptr inbounds nuw i8, ptr %0, i32 80
  %13 = load i64, ptr %arrayidx10.i, align 8
  %arrayidx11.i = getelementptr inbounds nuw i8, ptr %0, i32 88
  %14 = load i64, ptr %arrayidx11.i, align 8
  %arrayidx12.i = getelementptr inbounds nuw i8, ptr %0, i32 96
  %15 = load i64, ptr %arrayidx12.i, align 8
  %arrayidx13.i2 = getelementptr inbounds nuw i8, ptr %0, i32 104
  %16 = load i64, ptr %arrayidx13.i2, align 8
  %arrayidx14.i = getelementptr inbounds nuw i8, ptr %0, i32 112
  %17 = load i64, ptr %arrayidx14.i, align 8
  %arrayidx15.i = getelementptr inbounds nuw i8, ptr %0, i32 120
  %18 = load i64, ptr %arrayidx15.i, align 8
  %arrayidx16.i = getelementptr inbounds nuw i8, ptr %0, i32 128
  %19 = load i64, ptr %arrayidx16.i, align 8
  %arrayidx17.i = getelementptr inbounds nuw i8, ptr %0, i32 136
  %20 = load i64, ptr %arrayidx17.i, align 8
  %arrayidx18.i = getelementptr inbounds nuw i8, ptr %0, i32 144
  %21 = load i64, ptr %arrayidx18.i, align 8
  %arrayidx19.i = getelementptr inbounds nuw i8, ptr %0, i32 152
  %22 = load i64, ptr %arrayidx19.i, align 8
  %arrayidx20.i3 = getelementptr inbounds nuw i8, ptr %0, i32 160
  %23 = load i64, ptr %arrayidx20.i3, align 8
  %arrayidx21.i4 = getelementptr inbounds nuw i8, ptr %0, i32 168
  %24 = load i64, ptr %arrayidx21.i4, align 8
  %arrayidx22.i = getelementptr inbounds nuw i8, ptr %0, i32 176
  %25 = load i64, ptr %arrayidx22.i, align 8
  %arrayidx23.i = getelementptr inbounds nuw i8, ptr %0, i32 184
  %26 = load i64, ptr %arrayidx23.i, align 8
  %arrayidx24.i = getelementptr inbounds nuw i8, ptr %0, i32 192
  %27 = load i64, ptr %arrayidx24.i, align 8
  br label %for.inc.i

for.inc.i:                                        ; preds = %for.end8.i, %for.inc.i
  %Asu.0.i37 = phi i64 [ %27, %for.end8.i ], [ %xor447.i, %for.inc.i ]
  %round.0.i36 = phi i32 [ 0, %for.end8.i ], [ %add448.i, %for.inc.i ]
  %Aba.0.i35 = phi i64 [ %3, %for.end8.i ], [ %xor295.i, %for.inc.i ]
  %Abe.0.i34 = phi i64 [ %4, %for.end8.i ], [ %xor298.i, %for.inc.i ]
  %Abi.0.i33 = phi i64 [ %5, %for.end8.i ], [ %xor301.i, %for.inc.i ]
  %Abo.0.i32 = phi i64 [ %6, %for.end8.i ], [ %xor304.i, %for.inc.i ]
  %Abu.0.i31 = phi i64 [ %7, %for.end8.i ], [ %xor307.i, %for.inc.i ]
  %Aga.0.i30 = phi i64 [ %8, %for.end8.i ], [ %xor330.i, %for.inc.i ]
  %Age.0.i29 = phi i64 [ %9, %for.end8.i ], [ %xor333.i, %for.inc.i ]
  %Agi.0.i28 = phi i64 [ %10, %for.end8.i ], [ %xor336.i, %for.inc.i ]
  %Ago.0.i27 = phi i64 [ %11, %for.end8.i ], [ %xor339.i, %for.inc.i ]
  %Agu.0.i26 = phi i64 [ %12, %for.end8.i ], [ %xor342.i, %for.inc.i ]
  %Aka.0.i25 = phi i64 [ %13, %for.end8.i ], [ %xor365.i, %for.inc.i ]
  %Ake.0.i24 = phi i64 [ %14, %for.end8.i ], [ %xor368.i, %for.inc.i ]
  %Aki.0.i23 = phi i64 [ %15, %for.end8.i ], [ %xor371.i, %for.inc.i ]
  %Ako.0.i22 = phi i64 [ %16, %for.end8.i ], [ %xor374.i, %for.inc.i ]
  %Aku.0.i21 = phi i64 [ %17, %for.end8.i ], [ %xor377.i, %for.inc.i ]
  %Ama.0.i20 = phi i64 [ %18, %for.end8.i ], [ %xor400.i, %for.inc.i ]
  %Ame.0.i19 = phi i64 [ %19, %for.end8.i ], [ %xor403.i, %for.inc.i ]
  %Ami.0.i18 = phi i64 [ %20, %for.end8.i ], [ %xor406.i, %for.inc.i ]
  %Amo.0.i17 = phi i64 [ %21, %for.end8.i ], [ %xor409.i, %for.inc.i ]
  %Amu.0.i16 = phi i64 [ %22, %for.end8.i ], [ %xor412.i, %for.inc.i ]
  %Asa.0.i15 = phi i64 [ %23, %for.end8.i ], [ %xor435.i, %for.inc.i ]
  %Ase.0.i14 = phi i64 [ %24, %for.end8.i ], [ %xor438.i, %for.inc.i ]
  %Asi.0.i13 = phi i64 [ %25, %for.end8.i ], [ %xor441.i, %for.inc.i ]
  %Aso.0.i12 = phi i64 [ %26, %for.end8.i ], [ %xor444.i, %for.inc.i ]
  %xor32.i = xor i64 %Abi.0.i33, %Agi.0.i28
  %xor33.i = xor i64 %xor32.i, %Aki.0.i23
  %xor34.i = xor i64 %xor33.i, %Ami.0.i18
  %xor35.i = xor i64 %xor34.i, %Asi.0.i13
  %xor40.i = xor i64 %Abu.0.i31, %Agu.0.i26
  %xor41.i = xor i64 %xor40.i, %Aku.0.i21
  %xor42.i = xor i64 %xor41.i, %Amu.0.i16
  %xor43.i = xor i64 %xor42.i, %Asu.0.i37
  %28 = call i64 @llvm.fshl.i64(i64 %xor43.i, i64 %xor43.i, i64 1)
  %xor57.i = xor i64 %xor35.i, %28
  %xor203.i = xor i64 %Ago.0.i27, %xor57.i
  %29 = call i64 @llvm.fshl.i64(i64 %xor203.i, i64 %xor203.i, i64 55)
  %xor28.i = xor i64 %Abe.0.i34, %Age.0.i29
  %xor29.i = xor i64 %xor28.i, %Ake.0.i24
  %xor30.i = xor i64 %xor29.i, %Ame.0.i19
  %xor31.i = xor i64 %xor30.i, %Ase.0.i14
  %30 = call i64 @llvm.fshl.i64(i64 %xor31.i, i64 %xor31.i, i64 1)
  %xor45.i = xor i64 %xor43.i, %30
  %xor211.i = xor i64 %Ama.0.i20, %xor45.i
  %31 = call i64 @llvm.fshl.i64(i64 %xor211.i, i64 %xor211.i, i64 41)
  %xor36.i = xor i64 %Abo.0.i32, %Ago.0.i27
  %xor37.i = xor i64 %xor36.i, %Ako.0.i22
  %xor38.i6 = xor i64 %xor37.i, %Amo.0.i17
  %xor39.i = xor i64 %xor38.i6, %Aso.0.i12
  %xor.i7 = xor i64 %Aba.0.i35, %Aga.0.i30
  %xor25.i = xor i64 %xor.i7, %Aka.0.i25
  %xor26.i = xor i64 %xor25.i, %Ama.0.i20
  %xor27.i = xor i64 %xor26.i, %Asa.0.i15
  %32 = call i64 @llvm.fshl.i64(i64 %xor27.i, i64 %xor27.i, i64 1)
  %xor61.i = xor i64 %xor39.i, %32
  %xor207.i = xor i64 %Aku.0.i21, %xor61.i
  %33 = call i64 @llvm.fshl.i64(i64 %xor207.i, i64 %xor207.i, i64 39)
  %not222.i = xor i64 %33, -1
  %and223.i = and i64 %31, %not222.i
  %xor224.i = xor i64 %29, %and223.i
  %34 = call i64 @llvm.fshl.i64(i64 %xor39.i, i64 %xor39.i, i64 1)
  %xor53.i = xor i64 %xor31.i, %34
  %xor67.i = xor i64 %Aki.0.i23, %xor53.i
  %35 = call i64 @llvm.fshl.i64(i64 %xor67.i, i64 %xor67.i, i64 43)
  %36 = call i64 @llvm.fshl.i64(i64 %xor35.i, i64 %xor35.i, i64 1)
  %xor49.i = xor i64 %xor27.i, %36
  %xor63.i = xor i64 %Age.0.i29, %xor49.i
  %37 = call i64 @llvm.fshl.i64(i64 %xor63.i, i64 %xor63.i, i64 44)
  %not.i = xor i64 %37, -1
  %and.i = and i64 %35, %not.i
  %arrayidx80.i = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %round.0.i36
  %38 = load i64, ptr %arrayidx80.i, align 8
  %39 = xor i64 %and.i, %38
  %xor62.i = xor i64 %Aba.0.i35, %xor45.i
  %xor81.i = xor i64 %39, %xor62.i
  %xor94.i = xor i64 %Abo.0.i32, %xor57.i
  %40 = call i64 @llvm.fshl.i64(i64 %xor94.i, i64 %xor94.i, i64 28)
  %xor102.i = xor i64 %Aka.0.i25, %xor45.i
  %41 = call i64 @llvm.fshl.i64(i64 %xor102.i, i64 %xor102.i, i64 3)
  %xor98.i = xor i64 %Agu.0.i26, %xor61.i
  %42 = call i64 @llvm.fshl.i64(i64 %xor98.i, i64 %xor98.i, i64 20)
  %not114.i = xor i64 %42, -1
  %and115.i = and i64 %41, %not114.i
  %xor116.i = xor i64 %40, %and115.i
  %xor234.i = xor i64 %xor81.i, %xor116.i
  %xor129.i = xor i64 %Abe.0.i34, %xor49.i
  %43 = call i64 @llvm.fshl.i64(i64 %xor129.i, i64 %xor129.i, i64 1)
  %xor137.i = xor i64 %Ako.0.i22, %xor57.i
  %44 = call i64 @llvm.fshl.i64(i64 %xor137.i, i64 %xor137.i, i64 25)
  %xor133.i = xor i64 %Agi.0.i28, %xor53.i
  %45 = call i64 @llvm.fshl.i64(i64 %xor133.i, i64 %xor133.i, i64 6)
  %not149.i = xor i64 %45, -1
  %and150.i = and i64 %44, %not149.i
  %xor151.i = xor i64 %43, %and150.i
  %xor235.i = xor i64 %xor234.i, %xor151.i
  %xor164.i = xor i64 %Abu.0.i31, %xor61.i
  %46 = call i64 @llvm.fshl.i64(i64 %xor164.i, i64 %xor164.i, i64 27)
  %xor172.i = xor i64 %Ake.0.i24, %xor49.i
  %47 = call i64 @llvm.fshl.i64(i64 %xor172.i, i64 %xor172.i, i64 10)
  %xor168.i = xor i64 %Aga.0.i30, %xor45.i
  %48 = call i64 @llvm.fshl.i64(i64 %xor168.i, i64 %xor168.i, i64 36)
  %not184.i = xor i64 %48, -1
  %and185.i = and i64 %47, %not184.i
  %xor186.i = xor i64 %46, %and185.i
  %xor236.i = xor i64 %xor235.i, %xor186.i
  %xor199.i = xor i64 %Abi.0.i33, %xor53.i
  %49 = call i64 @llvm.fshl.i64(i64 %xor199.i, i64 %xor199.i, i64 62)
  %not219.i = xor i64 %29, -1
  %and220.i = and i64 %33, %not219.i
  %xor221.i = xor i64 %49, %and220.i
  %xor237.i = xor i64 %xor236.i, %xor221.i
  %xor75.i = xor i64 %Asu.0.i37, %xor61.i
  %50 = call i64 @llvm.fshl.i64(i64 %xor75.i, i64 %xor75.i, i64 14)
  %xor71.i = xor i64 %Amo.0.i17, %xor57.i
  %51 = call i64 @llvm.fshl.i64(i64 %xor71.i, i64 %xor71.i, i64 21)
  %not85.i = xor i64 %51, -1
  %and86.i = and i64 %50, %not85.i
  %xor87.i = xor i64 %35, %and86.i
  %xor110.i = xor i64 %Asi.0.i13, %xor53.i
  %52 = call i64 @llvm.fshl.i64(i64 %xor110.i, i64 %xor110.i, i64 61)
  %xor106.i = xor i64 %Ame.0.i19, %xor49.i
  %53 = call i64 @llvm.fshl.i64(i64 %xor106.i, i64 %xor106.i, i64 45)
  %not120.i = xor i64 %53, -1
  %and121.i = and i64 %52, %not120.i
  %xor122.i = xor i64 %41, %and121.i
  %xor242.i = xor i64 %xor87.i, %xor122.i
  %xor145.i = xor i64 %Asa.0.i15, %xor45.i
  %54 = call i64 @llvm.fshl.i64(i64 %xor145.i, i64 %xor145.i, i64 18)
  %xor141.i = xor i64 %Amu.0.i16, %xor61.i
  %55 = call i64 @llvm.fshl.i64(i64 %xor141.i, i64 %xor141.i, i64 8)
  %not155.i = xor i64 %55, -1
  %and156.i = and i64 %54, %not155.i
  %xor157.i = xor i64 %44, %and156.i
  %xor243.i = xor i64 %xor242.i, %xor157.i
  %xor180.i = xor i64 %Aso.0.i12, %xor57.i
  %56 = call i64 @llvm.fshl.i64(i64 %xor180.i, i64 %xor180.i, i64 56)
  %xor176.i = xor i64 %Ami.0.i18, %xor53.i
  %57 = call i64 @llvm.fshl.i64(i64 %xor176.i, i64 %xor176.i, i64 15)
  %not190.i = xor i64 %57, -1
  %and191.i = and i64 %56, %not190.i
  %xor192.i = xor i64 %47, %and191.i
  %xor244.i = xor i64 %xor243.i, %xor192.i
  %xor215.i = xor i64 %Ase.0.i14, %xor49.i
  %58 = call i64 @llvm.fshl.i64(i64 %xor215.i, i64 %xor215.i, i64 2)
  %not225.i = xor i64 %31, -1
  %and226.i = and i64 %58, %not225.i
  %xor227.i = xor i64 %33, %and226.i
  %xor245.i = xor i64 %xor244.i, %xor227.i
  %59 = call i64 @llvm.fshl.i64(i64 %xor245.i, i64 %xor245.i, i64 1)
  %xor261.i = xor i64 %xor237.i, %59
  %xor429.i = xor i64 %xor224.i, %xor261.i
  %60 = call i64 @llvm.fshl.i64(i64 %xor429.i, i64 %xor429.i, i64 2)
  %not123.i = xor i64 %52, -1
  %and124.i = and i64 %40, %not123.i
  %xor125.i = xor i64 %53, %and124.i
  %not91.i = xor i64 %xor62.i, -1
  %and92.i = and i64 %37, %not91.i
  %xor93.i = xor i64 %50, %and92.i
  %not126.i = xor i64 %40, -1
  %and127.i = and i64 %42, %not126.i
  %xor128.i = xor i64 %52, %and127.i
  %xor250.i = xor i64 %xor93.i, %xor128.i
  %not161.i = xor i64 %43, -1
  %and162.i = and i64 %45, %not161.i
  %xor163.i = xor i64 %54, %and162.i
  %xor251.i = xor i64 %xor250.i, %xor163.i
  %not196.i = xor i64 %46, -1
  %and197.i = and i64 %48, %not196.i
  %xor198.i = xor i64 %56, %and197.i
  %xor252.i = xor i64 %xor251.i, %xor198.i
  %not231.i = xor i64 %49, -1
  %and232.i = and i64 %29, %not231.i
  %xor233.i = xor i64 %58, %and232.i
  %xor253.i = xor i64 %xor252.i, %xor233.i
  %61 = call i64 @llvm.fshl.i64(i64 %xor253.i, i64 %xor253.i, i64 1)
  %xor269.i = xor i64 %xor245.i, %61
  %xor417.i = xor i64 %xor125.i, %xor269.i
  %62 = call i64 @llvm.fshl.i64(i64 %xor417.i, i64 %xor417.i, i64 55)
  %not82.i = xor i64 %35, -1
  %and83.i = and i64 %51, %not82.i
  %xor84.i = xor i64 %37, %and83.i
  %not117.i = xor i64 %41, -1
  %and118.i = and i64 %53, %not117.i
  %xor119.i = xor i64 %42, %and118.i
  %xor238.i = xor i64 %xor84.i, %xor119.i
  %not152.i = xor i64 %44, -1
  %and153.i = and i64 %55, %not152.i
  %xor154.i = xor i64 %45, %and153.i
  %xor239.i = xor i64 %xor238.i, %xor154.i
  %not187.i = xor i64 %47, -1
  %and188.i = and i64 %57, %not187.i
  %xor189.i = xor i64 %48, %and188.i
  %xor240.i = xor i64 %xor239.i, %xor189.i
  %xor241.i = xor i64 %xor240.i, %xor224.i
  %not88.i = xor i64 %50, -1
  %and89.i = and i64 %xor62.i, %not88.i
  %xor90.i = xor i64 %51, %and89.i
  %xor246.i = xor i64 %xor90.i, %xor125.i
  %not158.i = xor i64 %54, -1
  %and159.i = and i64 %43, %not158.i
  %xor160.i = xor i64 %55, %and159.i
  %xor247.i = xor i64 %xor246.i, %xor160.i
  %not193.i = xor i64 %56, -1
  %and194.i = and i64 %46, %not193.i
  %xor195.i = xor i64 %57, %and194.i
  %xor248.i = xor i64 %xor247.i, %xor195.i
  %not228.i = xor i64 %58, -1
  %and229.i = and i64 %49, %not228.i
  %xor230.i = xor i64 %31, %and229.i
  %xor249.i = xor i64 %xor248.i, %xor230.i
  %63 = call i64 @llvm.fshl.i64(i64 %xor249.i, i64 %xor249.i, i64 1)
  %xor265.i = xor i64 %xor241.i, %63
  %xor413.i = xor i64 %xor87.i, %xor265.i
  %64 = call i64 @llvm.fshl.i64(i64 %xor413.i, i64 %xor413.i, i64 62)
  %not445.i = xor i64 %64, -1
  %and446.i = and i64 %62, %not445.i
  %xor447.i = xor i64 %60, %and446.i
  %65 = call i64 @llvm.fshl.i64(i64 %xor241.i, i64 %xor241.i, i64 1)
  %xor257.i = xor i64 %xor253.i, %65
  %xor425.i = xor i64 %xor186.i, %xor257.i
  %66 = call i64 @llvm.fshl.i64(i64 %xor425.i, i64 %xor425.i, i64 41)
  %not442.i = xor i64 %60, -1
  %and443.i = and i64 %64, %not442.i
  %xor444.i = xor i64 %66, %and443.i
  %67 = call i64 @llvm.fshl.i64(i64 %xor237.i, i64 %xor237.i, i64 1)
  %xor273.i = xor i64 %xor249.i, %67
  %xor421.i = xor i64 %xor163.i, %xor273.i
  %68 = call i64 @llvm.fshl.i64(i64 %xor421.i, i64 %xor421.i, i64 39)
  %not439.i = xor i64 %66, -1
  %and440.i = and i64 %60, %not439.i
  %xor441.i = xor i64 %68, %and440.i
  %not436.i = xor i64 %68, -1
  %and437.i = and i64 %66, %not436.i
  %xor438.i = xor i64 %62, %and437.i
  %not433.i = xor i64 %62, -1
  %and434.i = and i64 %68, %not433.i
  %xor435.i = xor i64 %64, %and434.i
  %xor394.i = xor i64 %xor230.i, %xor269.i
  %69 = call i64 @llvm.fshl.i64(i64 %xor394.i, i64 %xor394.i, i64 56)
  %xor382.i = xor i64 %xor116.i, %xor257.i
  %70 = call i64 @llvm.fshl.i64(i64 %xor382.i, i64 %xor382.i, i64 36)
  %xor378.i = xor i64 %xor93.i, %xor273.i
  %71 = call i64 @llvm.fshl.i64(i64 %xor378.i, i64 %xor378.i, i64 27)
  %not410.i = xor i64 %71, -1
  %and411.i = and i64 %70, %not410.i
  %xor412.i = xor i64 %69, %and411.i
  %xor390.i = xor i64 %xor192.i, %xor265.i
  %72 = call i64 @llvm.fshl.i64(i64 %xor390.i, i64 %xor390.i, i64 15)
  %not407.i = xor i64 %69, -1
  %and408.i = and i64 %71, %not407.i
  %xor409.i = xor i64 %72, %and408.i
  %xor386.i = xor i64 %xor154.i, %xor261.i
  %73 = call i64 @llvm.fshl.i64(i64 %xor386.i, i64 %xor386.i, i64 10)
  %not404.i = xor i64 %72, -1
  %and405.i = and i64 %69, %not404.i
  %xor406.i = xor i64 %73, %and405.i
  %not401.i = xor i64 %73, -1
  %and402.i = and i64 %72, %not401.i
  %xor403.i = xor i64 %70, %and402.i
  %not398.i = xor i64 %70, -1
  %and399.i = and i64 %73, %not398.i
  %xor400.i = xor i64 %71, %and399.i
  %xor359.i = xor i64 %xor221.i, %xor257.i
  %74 = call i64 @llvm.fshl.i64(i64 %xor359.i, i64 %xor359.i, i64 18)
  %xor347.i = xor i64 %xor122.i, %xor265.i
  %75 = call i64 @llvm.fshl.i64(i64 %xor347.i, i64 %xor347.i, i64 6)
  %xor343.i = xor i64 %xor84.i, %xor261.i
  %76 = call i64 @llvm.fshl.i64(i64 %xor343.i, i64 %xor343.i, i64 1)
  %not375.i = xor i64 %76, -1
  %and376.i = and i64 %75, %not375.i
  %xor377.i = xor i64 %74, %and376.i
  %xor355.i = xor i64 %xor198.i, %xor273.i
  %77 = call i64 @llvm.fshl.i64(i64 %xor355.i, i64 %xor355.i, i64 8)
  %not372.i = xor i64 %74, -1
  %and373.i = and i64 %76, %not372.i
  %xor374.i = xor i64 %77, %and373.i
  %xor351.i = xor i64 %xor160.i, %xor269.i
  %78 = call i64 @llvm.fshl.i64(i64 %xor351.i, i64 %xor351.i, i64 25)
  %not369.i = xor i64 %77, -1
  %and370.i = and i64 %74, %not369.i
  %xor371.i = xor i64 %78, %and370.i
  %not366.i = xor i64 %78, -1
  %and367.i = and i64 %77, %not366.i
  %xor368.i = xor i64 %75, %and367.i
  %not363.i = xor i64 %75, -1
  %and364.i = and i64 %78, %not363.i
  %xor365.i = xor i64 %76, %and364.i
  %xor324.i = xor i64 %xor227.i, %xor265.i
  %79 = call i64 @llvm.fshl.i64(i64 %xor324.i, i64 %xor324.i, i64 61)
  %xor312.i = xor i64 %xor128.i, %xor273.i
  %80 = call i64 @llvm.fshl.i64(i64 %xor312.i, i64 %xor312.i, i64 20)
  %xor308.i = xor i64 %xor90.i, %xor269.i
  %81 = call i64 @llvm.fshl.i64(i64 %xor308.i, i64 %xor308.i, i64 28)
  %not340.i = xor i64 %81, -1
  %and341.i = and i64 %80, %not340.i
  %xor342.i = xor i64 %79, %and341.i
  %xor320.i = xor i64 %xor189.i, %xor261.i
  %82 = call i64 @llvm.fshl.i64(i64 %xor320.i, i64 %xor320.i, i64 45)
  %not337.i = xor i64 %79, -1
  %and338.i = and i64 %81, %not337.i
  %xor339.i = xor i64 %82, %and338.i
  %xor316.i = xor i64 %xor151.i, %xor257.i
  %83 = call i64 @llvm.fshl.i64(i64 %xor316.i, i64 %xor316.i, i64 3)
  %not334.i = xor i64 %82, -1
  %and335.i = and i64 %79, %not334.i
  %xor336.i = xor i64 %83, %and335.i
  %not331.i = xor i64 %83, -1
  %and332.i = and i64 %82, %not331.i
  %xor333.i = xor i64 %80, %and332.i
  %not328.i = xor i64 %80, -1
  %and329.i = and i64 %83, %not328.i
  %xor330.i = xor i64 %81, %and329.i
  %xor287.i = xor i64 %xor233.i, %xor273.i
  %84 = call i64 @llvm.fshl.i64(i64 %xor287.i, i64 %xor287.i, i64 14)
  %xor275.i = xor i64 %xor119.i, %xor261.i
  %85 = call i64 @llvm.fshl.i64(i64 %xor275.i, i64 %xor275.i, i64 44)
  %xor274.i = xor i64 %xor81.i, %xor257.i
  %not305.i = xor i64 %xor274.i, -1
  %and306.i = and i64 %85, %not305.i
  %xor307.i = xor i64 %84, %and306.i
  %xor283.i = xor i64 %xor195.i, %xor269.i
  %86 = call i64 @llvm.fshl.i64(i64 %xor283.i, i64 %xor283.i, i64 21)
  %not302.i = xor i64 %84, -1
  %and303.i = and i64 %xor274.i, %not302.i
  %xor304.i = xor i64 %86, %and303.i
  %xor279.i = xor i64 %xor157.i, %xor265.i
  %87 = call i64 @llvm.fshl.i64(i64 %xor279.i, i64 %xor279.i, i64 43)
  %not299.i = xor i64 %86, -1
  %and300.i = and i64 %84, %not299.i
  %xor301.i = xor i64 %87, %and300.i
  %not296.i = xor i64 %87, -1
  %and297.i = and i64 %86, %not296.i
  %xor298.i = xor i64 %85, %and297.i
  %add.i = or disjoint i32 %round.0.i36, 1
  %arrayidx294.i = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %add.i
  %88 = load i64, ptr %arrayidx294.i, align 8
  %not291.i = xor i64 %85, -1
  %and292.i = and i64 %87, %not291.i
  %89 = xor i64 %and292.i, %88
  %xor295.i = xor i64 %89, %xor274.i
  %add448.i = add nuw nsw i32 %round.0.i36, 2
  %cmp.i = icmp samesign ult i32 %add448.i, 24
  br i1 %cmp.i, label %for.inc.i, label %KeccakF1600_StatePermute.exit, !llvm.loop !51

KeccakF1600_StatePermute.exit:                    ; preds = %for.inc.i
  %Aso.0.i.lcssa = phi i64 [ %xor444.i, %for.inc.i ]
  %Asi.0.i.lcssa = phi i64 [ %xor441.i, %for.inc.i ]
  %Ase.0.i.lcssa = phi i64 [ %xor438.i, %for.inc.i ]
  %Asa.0.i.lcssa = phi i64 [ %xor435.i, %for.inc.i ]
  %Amu.0.i.lcssa = phi i64 [ %xor412.i, %for.inc.i ]
  %Amo.0.i.lcssa = phi i64 [ %xor409.i, %for.inc.i ]
  %Ami.0.i.lcssa = phi i64 [ %xor406.i, %for.inc.i ]
  %Ame.0.i.lcssa = phi i64 [ %xor403.i, %for.inc.i ]
  %Ama.0.i.lcssa = phi i64 [ %xor400.i, %for.inc.i ]
  %Aku.0.i.lcssa = phi i64 [ %xor377.i, %for.inc.i ]
  %Ako.0.i.lcssa = phi i64 [ %xor374.i, %for.inc.i ]
  %Aki.0.i.lcssa = phi i64 [ %xor371.i, %for.inc.i ]
  %Ake.0.i.lcssa = phi i64 [ %xor368.i, %for.inc.i ]
  %Aka.0.i.lcssa = phi i64 [ %xor365.i, %for.inc.i ]
  %Agu.0.i.lcssa = phi i64 [ %xor342.i, %for.inc.i ]
  %Ago.0.i.lcssa = phi i64 [ %xor339.i, %for.inc.i ]
  %Agi.0.i.lcssa = phi i64 [ %xor336.i, %for.inc.i ]
  %Age.0.i.lcssa = phi i64 [ %xor333.i, %for.inc.i ]
  %Aga.0.i.lcssa = phi i64 [ %xor330.i, %for.inc.i ]
  %Abu.0.i.lcssa = phi i64 [ %xor307.i, %for.inc.i ]
  %Abo.0.i.lcssa = phi i64 [ %xor304.i, %for.inc.i ]
  %Abi.0.i.lcssa = phi i64 [ %xor301.i, %for.inc.i ]
  %Abe.0.i.lcssa = phi i64 [ %xor298.i, %for.inc.i ]
  %Aba.0.i.lcssa = phi i64 [ %xor295.i, %for.inc.i ]
  %Asu.0.i.lcssa = phi i64 [ %xor447.i, %for.inc.i ]
  store i64 %Aba.0.i.lcssa, ptr %0, align 8
  %arrayidx450.i = getelementptr inbounds nuw i8, ptr %0, i32 8
  store i64 %Abe.0.i.lcssa, ptr %arrayidx450.i, align 8
  %arrayidx451.i = getelementptr inbounds nuw i8, ptr %0, i32 16
  store i64 %Abi.0.i.lcssa, ptr %arrayidx451.i, align 8
  %arrayidx452.i = getelementptr inbounds nuw i8, ptr %0, i32 24
  store i64 %Abo.0.i.lcssa, ptr %arrayidx452.i, align 8
  %arrayidx453.i = getelementptr inbounds nuw i8, ptr %0, i32 32
  store i64 %Abu.0.i.lcssa, ptr %arrayidx453.i, align 8
  %arrayidx454.i = getelementptr inbounds nuw i8, ptr %0, i32 40
  store i64 %Aga.0.i.lcssa, ptr %arrayidx454.i, align 8
  %arrayidx455.i = getelementptr inbounds nuw i8, ptr %0, i32 48
  store i64 %Age.0.i.lcssa, ptr %arrayidx455.i, align 8
  %arrayidx456.i = getelementptr inbounds nuw i8, ptr %0, i32 56
  store i64 %Agi.0.i.lcssa, ptr %arrayidx456.i, align 8
  %arrayidx457.i = getelementptr inbounds nuw i8, ptr %0, i32 64
  store i64 %Ago.0.i.lcssa, ptr %arrayidx457.i, align 8
  %arrayidx458.i = getelementptr inbounds nuw i8, ptr %0, i32 72
  store i64 %Agu.0.i.lcssa, ptr %arrayidx458.i, align 8
  %arrayidx459.i = getelementptr inbounds nuw i8, ptr %0, i32 80
  store i64 %Aka.0.i.lcssa, ptr %arrayidx459.i, align 8
  %arrayidx460.i = getelementptr inbounds nuw i8, ptr %0, i32 88
  store i64 %Ake.0.i.lcssa, ptr %arrayidx460.i, align 8
  %arrayidx461.i = getelementptr inbounds nuw i8, ptr %0, i32 96
  store i64 %Aki.0.i.lcssa, ptr %arrayidx461.i, align 8
  %arrayidx462.i = getelementptr inbounds nuw i8, ptr %0, i32 104
  store i64 %Ako.0.i.lcssa, ptr %arrayidx462.i, align 8
  %arrayidx463.i = getelementptr inbounds nuw i8, ptr %0, i32 112
  store i64 %Aku.0.i.lcssa, ptr %arrayidx463.i, align 8
  %arrayidx464.i = getelementptr inbounds nuw i8, ptr %0, i32 120
  store i64 %Ama.0.i.lcssa, ptr %arrayidx464.i, align 8
  %arrayidx465.i = getelementptr inbounds nuw i8, ptr %0, i32 128
  store i64 %Ame.0.i.lcssa, ptr %arrayidx465.i, align 8
  %arrayidx466.i = getelementptr inbounds nuw i8, ptr %0, i32 136
  store i64 %Ami.0.i.lcssa, ptr %arrayidx466.i, align 8
  %arrayidx467.i = getelementptr inbounds nuw i8, ptr %0, i32 144
  store i64 %Amo.0.i.lcssa, ptr %arrayidx467.i, align 8
  %arrayidx468.i = getelementptr inbounds nuw i8, ptr %0, i32 152
  store i64 %Amu.0.i.lcssa, ptr %arrayidx468.i, align 8
  %arrayidx469.i = getelementptr inbounds nuw i8, ptr %0, i32 160
  store i64 %Asa.0.i.lcssa, ptr %arrayidx469.i, align 8
  %arrayidx470.i = getelementptr inbounds nuw i8, ptr %0, i32 168
  store i64 %Ase.0.i.lcssa, ptr %arrayidx470.i, align 8
  %arrayidx471.i = getelementptr inbounds nuw i8, ptr %0, i32 176
  store i64 %Asi.0.i.lcssa, ptr %arrayidx471.i, align 8
  %arrayidx472.i = getelementptr inbounds nuw i8, ptr %0, i32 184
  store i64 %Aso.0.i.lcssa, ptr %arrayidx472.i, align 8
  %arrayidx473.i = getelementptr inbounds nuw i8, ptr %0, i32 192
  store i64 %Asu.0.i.lcssa, ptr %arrayidx473.i, align 8
  %sub.i = add i32 %mlen.addr.0.i40, -136
  %add.ptr9.i = getelementptr inbounds nuw i8, ptr %m.addr.0.i39, i32 136
  %cmp1.not.i = icmp ult i32 %sub.i, 136
  br i1 %cmp1.not.i, label %while.cond.i.for.cond10.i.preheader_crit_edge, label %for.cond2.i.preheader, !llvm.loop !52

for.cond17.i.preheader:                           ; preds = %for.body12.i
  %exitcond6.i.not43 = icmp eq i32 0, %mlen.addr.0.i.lcssa
  br i1 %exitcond6.i.not43, label %for.end24.i, label %for.body19.i.lr.ph

for.body19.i.lr.ph:                               ; preds = %for.cond17.i.preheader
  br label %for.body19.i

for.body12.i:                                     ; preds = %for.cond10.i.preheader, %for.body12.i
  %i.2.i42 = phi i32 [ 0, %for.cond10.i.preheader ], [ %inc15.i, %for.body12.i ]
  %arrayidx13.i = getelementptr inbounds nuw [200 x i8], ptr %t.i, i32 0, i32 %i.2.i42
  store i8 0, ptr %arrayidx13.i, align 1
  %inc15.i = add nuw nsw i32 %i.2.i42, 1
  %exitcond4.i.not = icmp eq i32 %inc15.i, 136
  br i1 %exitcond4.i.not, label %for.cond17.i.preheader, label %for.body12.i, !llvm.loop !53

for.body19.i:                                     ; preds = %for.body19.i.lr.ph, %for.body19.i
  %i.3.i44 = phi i32 [ 0, %for.body19.i.lr.ph ], [ %inc23.i, %for.body19.i ]
  %arrayidx20.i = getelementptr inbounds nuw i8, ptr %m.addr.0.i.lcssa, i32 %i.3.i44
  %90 = load i8, ptr %arrayidx20.i, align 1
  %arrayidx21.i = getelementptr inbounds nuw [200 x i8], ptr %t.i, i32 0, i32 %i.3.i44
  store i8 %90, ptr %arrayidx21.i, align 1
  %inc23.i = add nuw i32 %i.3.i44, 1
  %exitcond6.i.not = icmp eq i32 %inc23.i, %mlen.addr.0.i.lcssa
  br i1 %exitcond6.i.not, label %for.cond17.i.for.end24.i_crit_edge, label %for.body19.i, !llvm.loop !54

for.cond17.i.for.end24.i_crit_edge:               ; preds = %for.body19.i
  br label %for.end24.i

for.end24.i:                                      ; preds = %for.cond17.i.for.end24.i_crit_edge, %for.cond17.i.preheader
  %i.3.i.lcssa = phi i32 [ %mlen.addr.0.i.lcssa, %for.cond17.i.for.end24.i_crit_edge ], [ 0, %for.cond17.i.preheader ]
  %arrayidx25.i = getelementptr inbounds nuw [200 x i8], ptr %t.i, i32 0, i32 %i.3.i.lcssa
  store i8 31, ptr %arrayidx25.i, align 1
  %arrayidx27.i = getelementptr inbounds nuw i8, ptr %t.i, i32 135
  %91 = load i8, ptr %arrayidx27.i, align 1
  %92 = or i8 %91, -128
  store i8 %92, ptr %arrayidx27.i, align 1
  br label %for.body33.i

for.body33.i:                                     ; preds = %for.end24.i, %load64.exit13.i
  %i.4.i48 = phi i32 [ 0, %for.end24.i ], [ %inc40.i, %load64.exit13.i ]
  %mul34.i = shl nuw nsw i32 %i.4.i48, 3
  %add.ptr35.i = getelementptr inbounds nuw i8, ptr %t.i, i32 %mul34.i
  br label %for.inc.i5.i

for.inc.i5.i:                                     ; preds = %for.body33.i, %for.inc.i5.i
  %i.0.i3.i47 = phi i32 [ 0, %for.body33.i ], [ %inc.i12.i, %for.inc.i5.i ]
  %r.0.i2.i46 = phi i64 [ 0, %for.body33.i ], [ %or.i11.i, %for.inc.i5.i ]
  %arrayidx.i6.i = getelementptr inbounds nuw i8, ptr %add.ptr35.i, i32 %i.0.i3.i47
  %93 = load i8, ptr %arrayidx.i6.i, align 1
  %conv.i7.i = zext i8 %93 to i64
  %mul.i8.i = shl nuw nsw i32 %i.0.i3.i47, 3
  %sh_prom.i9.i = zext nneg i32 %mul.i8.i to i64
  %shl.i10.i = shl nuw i64 %conv.i7.i, %sh_prom.i9.i
  %or.i11.i = or i64 %r.0.i2.i46, %shl.i10.i
  %inc.i12.i = add nuw nsw i32 %i.0.i3.i47, 1
  %exitcond.i4.i.not = icmp eq i32 %inc.i12.i, 8
  br i1 %exitcond.i4.i.not, label %load64.exit13.i, label %for.inc.i5.i, !llvm.loop !55

load64.exit13.i:                                  ; preds = %for.inc.i5.i
  %r.0.i2.i.lcssa = phi i64 [ %or.i11.i, %for.inc.i5.i ]
  %arrayidx37.i = getelementptr inbounds nuw i64, ptr %0, i32 %i.4.i48
  %94 = load i64, ptr %arrayidx37.i, align 8
  %xor38.i = xor i64 %94, %r.0.i2.i.lcssa
  store i64 %xor38.i, ptr %arrayidx37.i, align 8
  %inc40.i = add nuw nsw i32 %i.4.i48, 1
  %exitcond7.i.not = icmp eq i32 %inc40.i, 17
  br i1 %exitcond7.i.not, label %keccak_absorb.exit, label %for.body33.i, !llvm.loop !56

keccak_absorb.exit:                               ; preds = %load64.exit13.i
  call void @llvm.lifetime.end.p0(i64 200, ptr nonnull %t.i)
  ret void
}

; Function Attrs: inlinehint nounwind
define dso_local void @shake256_squeezeblocks(ptr noundef %output, i32 noundef %nblocks, ptr noundef %state) local_unnamed_addr #1 {
entry:
  %0 = load ptr, ptr %state, align 4
  %cmp.not.i31 = icmp eq i32 %nblocks, 0
  br i1 %cmp.not.i31, label %keccak_squeezeblocks.exit, label %while.body.i.lr.ph

while.body.i.lr.ph:                               ; preds = %entry
  br label %while.body.i

while.body.i:                                     ; preds = %while.body.i.lr.ph, %for.end.i
  %h.addr.0.i33 = phi ptr [ %output, %while.body.i.lr.ph ], [ %add.ptr2.i, %for.end.i ]
  %nblocks.addr.0.i32 = phi i32 [ %nblocks, %while.body.i.lr.ph ], [ %dec.i, %for.end.i ]
  %1 = load i64, ptr %0, align 8
  %arrayidx1.i = getelementptr inbounds nuw i8, ptr %0, i32 8
  %2 = load i64, ptr %arrayidx1.i, align 8
  %arrayidx2.i = getelementptr inbounds nuw i8, ptr %0, i32 16
  %3 = load i64, ptr %arrayidx2.i, align 8
  %arrayidx3.i = getelementptr inbounds nuw i8, ptr %0, i32 24
  %4 = load i64, ptr %arrayidx3.i, align 8
  %arrayidx4.i = getelementptr inbounds nuw i8, ptr %0, i32 32
  %5 = load i64, ptr %arrayidx4.i, align 8
  %arrayidx5.i = getelementptr inbounds nuw i8, ptr %0, i32 40
  %6 = load i64, ptr %arrayidx5.i, align 8
  %arrayidx6.i = getelementptr inbounds nuw i8, ptr %0, i32 48
  %7 = load i64, ptr %arrayidx6.i, align 8
  %arrayidx7.i = getelementptr inbounds nuw i8, ptr %0, i32 56
  %8 = load i64, ptr %arrayidx7.i, align 8
  %arrayidx8.i = getelementptr inbounds nuw i8, ptr %0, i32 64
  %9 = load i64, ptr %arrayidx8.i, align 8
  %arrayidx9.i = getelementptr inbounds nuw i8, ptr %0, i32 72
  %10 = load i64, ptr %arrayidx9.i, align 8
  %arrayidx10.i = getelementptr inbounds nuw i8, ptr %0, i32 80
  %11 = load i64, ptr %arrayidx10.i, align 8
  %arrayidx11.i = getelementptr inbounds nuw i8, ptr %0, i32 88
  %12 = load i64, ptr %arrayidx11.i, align 8
  %arrayidx12.i = getelementptr inbounds nuw i8, ptr %0, i32 96
  %13 = load i64, ptr %arrayidx12.i, align 8
  %arrayidx13.i = getelementptr inbounds nuw i8, ptr %0, i32 104
  %14 = load i64, ptr %arrayidx13.i, align 8
  %arrayidx14.i = getelementptr inbounds nuw i8, ptr %0, i32 112
  %15 = load i64, ptr %arrayidx14.i, align 8
  %arrayidx15.i = getelementptr inbounds nuw i8, ptr %0, i32 120
  %16 = load i64, ptr %arrayidx15.i, align 8
  %arrayidx16.i = getelementptr inbounds nuw i8, ptr %0, i32 128
  %17 = load i64, ptr %arrayidx16.i, align 8
  %arrayidx17.i = getelementptr inbounds nuw i8, ptr %0, i32 136
  %18 = load i64, ptr %arrayidx17.i, align 8
  %arrayidx18.i = getelementptr inbounds nuw i8, ptr %0, i32 144
  %19 = load i64, ptr %arrayidx18.i, align 8
  %arrayidx19.i = getelementptr inbounds nuw i8, ptr %0, i32 152
  %20 = load i64, ptr %arrayidx19.i, align 8
  %arrayidx20.i = getelementptr inbounds nuw i8, ptr %0, i32 160
  %21 = load i64, ptr %arrayidx20.i, align 8
  %arrayidx21.i = getelementptr inbounds nuw i8, ptr %0, i32 168
  %22 = load i64, ptr %arrayidx21.i, align 8
  %arrayidx22.i = getelementptr inbounds nuw i8, ptr %0, i32 176
  %23 = load i64, ptr %arrayidx22.i, align 8
  %arrayidx23.i = getelementptr inbounds nuw i8, ptr %0, i32 184
  %24 = load i64, ptr %arrayidx23.i, align 8
  %arrayidx24.i = getelementptr inbounds nuw i8, ptr %0, i32 192
  %25 = load i64, ptr %arrayidx24.i, align 8
  br label %for.inc.i

for.inc.i:                                        ; preds = %while.body.i, %for.inc.i
  %Asu.0.i28 = phi i64 [ %25, %while.body.i ], [ %xor447.i, %for.inc.i ]
  %round.0.i27 = phi i32 [ 0, %while.body.i ], [ %add448.i, %for.inc.i ]
  %Aba.0.i26 = phi i64 [ %1, %while.body.i ], [ %xor295.i, %for.inc.i ]
  %Abe.0.i25 = phi i64 [ %2, %while.body.i ], [ %xor298.i, %for.inc.i ]
  %Abi.0.i24 = phi i64 [ %3, %while.body.i ], [ %xor301.i, %for.inc.i ]
  %Abo.0.i23 = phi i64 [ %4, %while.body.i ], [ %xor304.i, %for.inc.i ]
  %Abu.0.i22 = phi i64 [ %5, %while.body.i ], [ %xor307.i, %for.inc.i ]
  %Aga.0.i21 = phi i64 [ %6, %while.body.i ], [ %xor330.i, %for.inc.i ]
  %Age.0.i20 = phi i64 [ %7, %while.body.i ], [ %xor333.i, %for.inc.i ]
  %Agi.0.i19 = phi i64 [ %8, %while.body.i ], [ %xor336.i, %for.inc.i ]
  %Ago.0.i18 = phi i64 [ %9, %while.body.i ], [ %xor339.i, %for.inc.i ]
  %Agu.0.i17 = phi i64 [ %10, %while.body.i ], [ %xor342.i, %for.inc.i ]
  %Aka.0.i16 = phi i64 [ %11, %while.body.i ], [ %xor365.i, %for.inc.i ]
  %Ake.0.i15 = phi i64 [ %12, %while.body.i ], [ %xor368.i, %for.inc.i ]
  %Aki.0.i14 = phi i64 [ %13, %while.body.i ], [ %xor371.i, %for.inc.i ]
  %Ako.0.i13 = phi i64 [ %14, %while.body.i ], [ %xor374.i, %for.inc.i ]
  %Aku.0.i12 = phi i64 [ %15, %while.body.i ], [ %xor377.i, %for.inc.i ]
  %Ama.0.i11 = phi i64 [ %16, %while.body.i ], [ %xor400.i, %for.inc.i ]
  %Ame.0.i10 = phi i64 [ %17, %while.body.i ], [ %xor403.i, %for.inc.i ]
  %Ami.0.i9 = phi i64 [ %18, %while.body.i ], [ %xor406.i, %for.inc.i ]
  %Amo.0.i8 = phi i64 [ %19, %while.body.i ], [ %xor409.i, %for.inc.i ]
  %Amu.0.i7 = phi i64 [ %20, %while.body.i ], [ %xor412.i, %for.inc.i ]
  %Asa.0.i6 = phi i64 [ %21, %while.body.i ], [ %xor435.i, %for.inc.i ]
  %Ase.0.i5 = phi i64 [ %22, %while.body.i ], [ %xor438.i, %for.inc.i ]
  %Asi.0.i4 = phi i64 [ %23, %while.body.i ], [ %xor441.i, %for.inc.i ]
  %Aso.0.i3 = phi i64 [ %24, %while.body.i ], [ %xor444.i, %for.inc.i ]
  %xor32.i = xor i64 %Abi.0.i24, %Agi.0.i19
  %xor33.i = xor i64 %xor32.i, %Aki.0.i14
  %xor34.i = xor i64 %xor33.i, %Ami.0.i9
  %xor35.i = xor i64 %xor34.i, %Asi.0.i4
  %xor40.i = xor i64 %Abu.0.i22, %Agu.0.i17
  %xor41.i = xor i64 %xor40.i, %Aku.0.i12
  %xor42.i = xor i64 %xor41.i, %Amu.0.i7
  %xor43.i = xor i64 %xor42.i, %Asu.0.i28
  %26 = call i64 @llvm.fshl.i64(i64 %xor43.i, i64 %xor43.i, i64 1)
  %xor57.i = xor i64 %xor35.i, %26
  %xor203.i = xor i64 %Ago.0.i18, %xor57.i
  %27 = call i64 @llvm.fshl.i64(i64 %xor203.i, i64 %xor203.i, i64 55)
  %xor28.i = xor i64 %Abe.0.i25, %Age.0.i20
  %xor29.i = xor i64 %xor28.i, %Ake.0.i15
  %xor30.i = xor i64 %xor29.i, %Ame.0.i10
  %xor31.i = xor i64 %xor30.i, %Ase.0.i5
  %28 = call i64 @llvm.fshl.i64(i64 %xor31.i, i64 %xor31.i, i64 1)
  %xor45.i = xor i64 %xor43.i, %28
  %xor211.i = xor i64 %Ama.0.i11, %xor45.i
  %29 = call i64 @llvm.fshl.i64(i64 %xor211.i, i64 %xor211.i, i64 41)
  %xor36.i = xor i64 %Abo.0.i23, %Ago.0.i18
  %xor37.i = xor i64 %xor36.i, %Ako.0.i13
  %xor38.i = xor i64 %xor37.i, %Amo.0.i8
  %xor39.i = xor i64 %xor38.i, %Aso.0.i3
  %xor.i = xor i64 %Aba.0.i26, %Aga.0.i21
  %xor25.i = xor i64 %xor.i, %Aka.0.i16
  %xor26.i = xor i64 %xor25.i, %Ama.0.i11
  %xor27.i = xor i64 %xor26.i, %Asa.0.i6
  %30 = call i64 @llvm.fshl.i64(i64 %xor27.i, i64 %xor27.i, i64 1)
  %xor61.i = xor i64 %xor39.i, %30
  %xor207.i = xor i64 %Aku.0.i12, %xor61.i
  %31 = call i64 @llvm.fshl.i64(i64 %xor207.i, i64 %xor207.i, i64 39)
  %not222.i = xor i64 %31, -1
  %and223.i = and i64 %29, %not222.i
  %xor224.i = xor i64 %27, %and223.i
  %32 = call i64 @llvm.fshl.i64(i64 %xor39.i, i64 %xor39.i, i64 1)
  %xor53.i = xor i64 %xor31.i, %32
  %xor67.i = xor i64 %Aki.0.i14, %xor53.i
  %33 = call i64 @llvm.fshl.i64(i64 %xor67.i, i64 %xor67.i, i64 43)
  %34 = call i64 @llvm.fshl.i64(i64 %xor35.i, i64 %xor35.i, i64 1)
  %xor49.i = xor i64 %xor27.i, %34
  %xor63.i = xor i64 %Age.0.i20, %xor49.i
  %35 = call i64 @llvm.fshl.i64(i64 %xor63.i, i64 %xor63.i, i64 44)
  %not.i = xor i64 %35, -1
  %and.i = and i64 %33, %not.i
  %arrayidx80.i = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %round.0.i27
  %36 = load i64, ptr %arrayidx80.i, align 8
  %37 = xor i64 %and.i, %36
  %xor62.i = xor i64 %Aba.0.i26, %xor45.i
  %xor81.i = xor i64 %37, %xor62.i
  %xor94.i = xor i64 %Abo.0.i23, %xor57.i
  %38 = call i64 @llvm.fshl.i64(i64 %xor94.i, i64 %xor94.i, i64 28)
  %xor102.i = xor i64 %Aka.0.i16, %xor45.i
  %39 = call i64 @llvm.fshl.i64(i64 %xor102.i, i64 %xor102.i, i64 3)
  %xor98.i = xor i64 %Agu.0.i17, %xor61.i
  %40 = call i64 @llvm.fshl.i64(i64 %xor98.i, i64 %xor98.i, i64 20)
  %not114.i = xor i64 %40, -1
  %and115.i = and i64 %39, %not114.i
  %xor116.i = xor i64 %38, %and115.i
  %xor234.i = xor i64 %xor81.i, %xor116.i
  %xor129.i = xor i64 %Abe.0.i25, %xor49.i
  %41 = call i64 @llvm.fshl.i64(i64 %xor129.i, i64 %xor129.i, i64 1)
  %xor137.i = xor i64 %Ako.0.i13, %xor57.i
  %42 = call i64 @llvm.fshl.i64(i64 %xor137.i, i64 %xor137.i, i64 25)
  %xor133.i = xor i64 %Agi.0.i19, %xor53.i
  %43 = call i64 @llvm.fshl.i64(i64 %xor133.i, i64 %xor133.i, i64 6)
  %not149.i = xor i64 %43, -1
  %and150.i = and i64 %42, %not149.i
  %xor151.i = xor i64 %41, %and150.i
  %xor235.i = xor i64 %xor234.i, %xor151.i
  %xor164.i = xor i64 %Abu.0.i22, %xor61.i
  %44 = call i64 @llvm.fshl.i64(i64 %xor164.i, i64 %xor164.i, i64 27)
  %xor172.i = xor i64 %Ake.0.i15, %xor49.i
  %45 = call i64 @llvm.fshl.i64(i64 %xor172.i, i64 %xor172.i, i64 10)
  %xor168.i = xor i64 %Aga.0.i21, %xor45.i
  %46 = call i64 @llvm.fshl.i64(i64 %xor168.i, i64 %xor168.i, i64 36)
  %not184.i = xor i64 %46, -1
  %and185.i = and i64 %45, %not184.i
  %xor186.i = xor i64 %44, %and185.i
  %xor236.i = xor i64 %xor235.i, %xor186.i
  %xor199.i = xor i64 %Abi.0.i24, %xor53.i
  %47 = call i64 @llvm.fshl.i64(i64 %xor199.i, i64 %xor199.i, i64 62)
  %not219.i = xor i64 %27, -1
  %and220.i = and i64 %31, %not219.i
  %xor221.i = xor i64 %47, %and220.i
  %xor237.i = xor i64 %xor236.i, %xor221.i
  %xor75.i = xor i64 %Asu.0.i28, %xor61.i
  %48 = call i64 @llvm.fshl.i64(i64 %xor75.i, i64 %xor75.i, i64 14)
  %xor71.i = xor i64 %Amo.0.i8, %xor57.i
  %49 = call i64 @llvm.fshl.i64(i64 %xor71.i, i64 %xor71.i, i64 21)
  %not85.i = xor i64 %49, -1
  %and86.i = and i64 %48, %not85.i
  %xor87.i = xor i64 %33, %and86.i
  %xor110.i = xor i64 %Asi.0.i4, %xor53.i
  %50 = call i64 @llvm.fshl.i64(i64 %xor110.i, i64 %xor110.i, i64 61)
  %xor106.i = xor i64 %Ame.0.i10, %xor49.i
  %51 = call i64 @llvm.fshl.i64(i64 %xor106.i, i64 %xor106.i, i64 45)
  %not120.i = xor i64 %51, -1
  %and121.i = and i64 %50, %not120.i
  %xor122.i = xor i64 %39, %and121.i
  %xor242.i = xor i64 %xor87.i, %xor122.i
  %xor145.i = xor i64 %Asa.0.i6, %xor45.i
  %52 = call i64 @llvm.fshl.i64(i64 %xor145.i, i64 %xor145.i, i64 18)
  %xor141.i = xor i64 %Amu.0.i7, %xor61.i
  %53 = call i64 @llvm.fshl.i64(i64 %xor141.i, i64 %xor141.i, i64 8)
  %not155.i = xor i64 %53, -1
  %and156.i = and i64 %52, %not155.i
  %xor157.i = xor i64 %42, %and156.i
  %xor243.i = xor i64 %xor242.i, %xor157.i
  %xor180.i = xor i64 %Aso.0.i3, %xor57.i
  %54 = call i64 @llvm.fshl.i64(i64 %xor180.i, i64 %xor180.i, i64 56)
  %xor176.i = xor i64 %Ami.0.i9, %xor53.i
  %55 = call i64 @llvm.fshl.i64(i64 %xor176.i, i64 %xor176.i, i64 15)
  %not190.i = xor i64 %55, -1
  %and191.i = and i64 %54, %not190.i
  %xor192.i = xor i64 %45, %and191.i
  %xor244.i = xor i64 %xor243.i, %xor192.i
  %xor215.i = xor i64 %Ase.0.i5, %xor49.i
  %56 = call i64 @llvm.fshl.i64(i64 %xor215.i, i64 %xor215.i, i64 2)
  %not225.i = xor i64 %29, -1
  %and226.i = and i64 %56, %not225.i
  %xor227.i = xor i64 %31, %and226.i
  %xor245.i = xor i64 %xor244.i, %xor227.i
  %57 = call i64 @llvm.fshl.i64(i64 %xor245.i, i64 %xor245.i, i64 1)
  %xor261.i = xor i64 %xor237.i, %57
  %xor429.i = xor i64 %xor224.i, %xor261.i
  %58 = call i64 @llvm.fshl.i64(i64 %xor429.i, i64 %xor429.i, i64 2)
  %not123.i = xor i64 %50, -1
  %and124.i = and i64 %38, %not123.i
  %xor125.i = xor i64 %51, %and124.i
  %not91.i = xor i64 %xor62.i, -1
  %and92.i = and i64 %35, %not91.i
  %xor93.i = xor i64 %48, %and92.i
  %not126.i = xor i64 %38, -1
  %and127.i = and i64 %40, %not126.i
  %xor128.i = xor i64 %50, %and127.i
  %xor250.i = xor i64 %xor93.i, %xor128.i
  %not161.i = xor i64 %41, -1
  %and162.i = and i64 %43, %not161.i
  %xor163.i = xor i64 %52, %and162.i
  %xor251.i = xor i64 %xor250.i, %xor163.i
  %not196.i = xor i64 %44, -1
  %and197.i = and i64 %46, %not196.i
  %xor198.i = xor i64 %54, %and197.i
  %xor252.i = xor i64 %xor251.i, %xor198.i
  %not231.i = xor i64 %47, -1
  %and232.i = and i64 %27, %not231.i
  %xor233.i = xor i64 %56, %and232.i
  %xor253.i = xor i64 %xor252.i, %xor233.i
  %59 = call i64 @llvm.fshl.i64(i64 %xor253.i, i64 %xor253.i, i64 1)
  %xor269.i = xor i64 %xor245.i, %59
  %xor417.i = xor i64 %xor125.i, %xor269.i
  %60 = call i64 @llvm.fshl.i64(i64 %xor417.i, i64 %xor417.i, i64 55)
  %not82.i = xor i64 %33, -1
  %and83.i = and i64 %49, %not82.i
  %xor84.i = xor i64 %35, %and83.i
  %not117.i = xor i64 %39, -1
  %and118.i = and i64 %51, %not117.i
  %xor119.i = xor i64 %40, %and118.i
  %xor238.i = xor i64 %xor84.i, %xor119.i
  %not152.i = xor i64 %42, -1
  %and153.i = and i64 %53, %not152.i
  %xor154.i = xor i64 %43, %and153.i
  %xor239.i = xor i64 %xor238.i, %xor154.i
  %not187.i = xor i64 %45, -1
  %and188.i = and i64 %55, %not187.i
  %xor189.i = xor i64 %46, %and188.i
  %xor240.i = xor i64 %xor239.i, %xor189.i
  %xor241.i = xor i64 %xor240.i, %xor224.i
  %not88.i = xor i64 %48, -1
  %and89.i = and i64 %xor62.i, %not88.i
  %xor90.i = xor i64 %49, %and89.i
  %xor246.i = xor i64 %xor90.i, %xor125.i
  %not158.i = xor i64 %52, -1
  %and159.i = and i64 %41, %not158.i
  %xor160.i = xor i64 %53, %and159.i
  %xor247.i = xor i64 %xor246.i, %xor160.i
  %not193.i = xor i64 %54, -1
  %and194.i = and i64 %44, %not193.i
  %xor195.i = xor i64 %55, %and194.i
  %xor248.i = xor i64 %xor247.i, %xor195.i
  %not228.i = xor i64 %56, -1
  %and229.i = and i64 %47, %not228.i
  %xor230.i = xor i64 %29, %and229.i
  %xor249.i = xor i64 %xor248.i, %xor230.i
  %61 = call i64 @llvm.fshl.i64(i64 %xor249.i, i64 %xor249.i, i64 1)
  %xor265.i = xor i64 %xor241.i, %61
  %xor413.i = xor i64 %xor87.i, %xor265.i
  %62 = call i64 @llvm.fshl.i64(i64 %xor413.i, i64 %xor413.i, i64 62)
  %not445.i = xor i64 %62, -1
  %and446.i = and i64 %60, %not445.i
  %xor447.i = xor i64 %58, %and446.i
  %63 = call i64 @llvm.fshl.i64(i64 %xor241.i, i64 %xor241.i, i64 1)
  %xor257.i = xor i64 %xor253.i, %63
  %xor425.i = xor i64 %xor186.i, %xor257.i
  %64 = call i64 @llvm.fshl.i64(i64 %xor425.i, i64 %xor425.i, i64 41)
  %not442.i = xor i64 %58, -1
  %and443.i = and i64 %62, %not442.i
  %xor444.i = xor i64 %64, %and443.i
  %65 = call i64 @llvm.fshl.i64(i64 %xor237.i, i64 %xor237.i, i64 1)
  %xor273.i = xor i64 %xor249.i, %65
  %xor421.i = xor i64 %xor163.i, %xor273.i
  %66 = call i64 @llvm.fshl.i64(i64 %xor421.i, i64 %xor421.i, i64 39)
  %not439.i = xor i64 %64, -1
  %and440.i = and i64 %58, %not439.i
  %xor441.i = xor i64 %66, %and440.i
  %not436.i = xor i64 %66, -1
  %and437.i = and i64 %64, %not436.i
  %xor438.i = xor i64 %60, %and437.i
  %not433.i = xor i64 %60, -1
  %and434.i = and i64 %66, %not433.i
  %xor435.i = xor i64 %62, %and434.i
  %xor394.i = xor i64 %xor230.i, %xor269.i
  %67 = call i64 @llvm.fshl.i64(i64 %xor394.i, i64 %xor394.i, i64 56)
  %xor382.i = xor i64 %xor116.i, %xor257.i
  %68 = call i64 @llvm.fshl.i64(i64 %xor382.i, i64 %xor382.i, i64 36)
  %xor378.i = xor i64 %xor93.i, %xor273.i
  %69 = call i64 @llvm.fshl.i64(i64 %xor378.i, i64 %xor378.i, i64 27)
  %not410.i = xor i64 %69, -1
  %and411.i = and i64 %68, %not410.i
  %xor412.i = xor i64 %67, %and411.i
  %xor390.i = xor i64 %xor192.i, %xor265.i
  %70 = call i64 @llvm.fshl.i64(i64 %xor390.i, i64 %xor390.i, i64 15)
  %not407.i = xor i64 %67, -1
  %and408.i = and i64 %69, %not407.i
  %xor409.i = xor i64 %70, %and408.i
  %xor386.i = xor i64 %xor154.i, %xor261.i
  %71 = call i64 @llvm.fshl.i64(i64 %xor386.i, i64 %xor386.i, i64 10)
  %not404.i = xor i64 %70, -1
  %and405.i = and i64 %67, %not404.i
  %xor406.i = xor i64 %71, %and405.i
  %not401.i = xor i64 %71, -1
  %and402.i = and i64 %70, %not401.i
  %xor403.i = xor i64 %68, %and402.i
  %not398.i = xor i64 %68, -1
  %and399.i = and i64 %71, %not398.i
  %xor400.i = xor i64 %69, %and399.i
  %xor359.i = xor i64 %xor221.i, %xor257.i
  %72 = call i64 @llvm.fshl.i64(i64 %xor359.i, i64 %xor359.i, i64 18)
  %xor347.i = xor i64 %xor122.i, %xor265.i
  %73 = call i64 @llvm.fshl.i64(i64 %xor347.i, i64 %xor347.i, i64 6)
  %xor343.i = xor i64 %xor84.i, %xor261.i
  %74 = call i64 @llvm.fshl.i64(i64 %xor343.i, i64 %xor343.i, i64 1)
  %not375.i = xor i64 %74, -1
  %and376.i = and i64 %73, %not375.i
  %xor377.i = xor i64 %72, %and376.i
  %xor355.i = xor i64 %xor198.i, %xor273.i
  %75 = call i64 @llvm.fshl.i64(i64 %xor355.i, i64 %xor355.i, i64 8)
  %not372.i = xor i64 %72, -1
  %and373.i = and i64 %74, %not372.i
  %xor374.i = xor i64 %75, %and373.i
  %xor351.i = xor i64 %xor160.i, %xor269.i
  %76 = call i64 @llvm.fshl.i64(i64 %xor351.i, i64 %xor351.i, i64 25)
  %not369.i = xor i64 %75, -1
  %and370.i = and i64 %72, %not369.i
  %xor371.i = xor i64 %76, %and370.i
  %not366.i = xor i64 %76, -1
  %and367.i = and i64 %75, %not366.i
  %xor368.i = xor i64 %73, %and367.i
  %not363.i = xor i64 %73, -1
  %and364.i = and i64 %76, %not363.i
  %xor365.i = xor i64 %74, %and364.i
  %xor324.i = xor i64 %xor227.i, %xor265.i
  %77 = call i64 @llvm.fshl.i64(i64 %xor324.i, i64 %xor324.i, i64 61)
  %xor312.i = xor i64 %xor128.i, %xor273.i
  %78 = call i64 @llvm.fshl.i64(i64 %xor312.i, i64 %xor312.i, i64 20)
  %xor308.i = xor i64 %xor90.i, %xor269.i
  %79 = call i64 @llvm.fshl.i64(i64 %xor308.i, i64 %xor308.i, i64 28)
  %not340.i = xor i64 %79, -1
  %and341.i = and i64 %78, %not340.i
  %xor342.i = xor i64 %77, %and341.i
  %xor320.i = xor i64 %xor189.i, %xor261.i
  %80 = call i64 @llvm.fshl.i64(i64 %xor320.i, i64 %xor320.i, i64 45)
  %not337.i = xor i64 %77, -1
  %and338.i = and i64 %79, %not337.i
  %xor339.i = xor i64 %80, %and338.i
  %xor316.i = xor i64 %xor151.i, %xor257.i
  %81 = call i64 @llvm.fshl.i64(i64 %xor316.i, i64 %xor316.i, i64 3)
  %not334.i = xor i64 %80, -1
  %and335.i = and i64 %77, %not334.i
  %xor336.i = xor i64 %81, %and335.i
  %not331.i = xor i64 %81, -1
  %and332.i = and i64 %80, %not331.i
  %xor333.i = xor i64 %78, %and332.i
  %not328.i = xor i64 %78, -1
  %and329.i = and i64 %81, %not328.i
  %xor330.i = xor i64 %79, %and329.i
  %xor287.i = xor i64 %xor233.i, %xor273.i
  %82 = call i64 @llvm.fshl.i64(i64 %xor287.i, i64 %xor287.i, i64 14)
  %xor275.i = xor i64 %xor119.i, %xor261.i
  %83 = call i64 @llvm.fshl.i64(i64 %xor275.i, i64 %xor275.i, i64 44)
  %xor274.i = xor i64 %xor81.i, %xor257.i
  %not305.i = xor i64 %xor274.i, -1
  %and306.i = and i64 %83, %not305.i
  %xor307.i = xor i64 %82, %and306.i
  %xor283.i = xor i64 %xor195.i, %xor269.i
  %84 = call i64 @llvm.fshl.i64(i64 %xor283.i, i64 %xor283.i, i64 21)
  %not302.i = xor i64 %82, -1
  %and303.i = and i64 %xor274.i, %not302.i
  %xor304.i = xor i64 %84, %and303.i
  %xor279.i = xor i64 %xor157.i, %xor265.i
  %85 = call i64 @llvm.fshl.i64(i64 %xor279.i, i64 %xor279.i, i64 43)
  %not299.i = xor i64 %84, -1
  %and300.i = and i64 %82, %not299.i
  %xor301.i = xor i64 %85, %and300.i
  %not296.i = xor i64 %85, -1
  %and297.i = and i64 %84, %not296.i
  %xor298.i = xor i64 %83, %and297.i
  %add.i = or disjoint i32 %round.0.i27, 1
  %arrayidx294.i = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %add.i
  %86 = load i64, ptr %arrayidx294.i, align 8
  %not291.i = xor i64 %83, -1
  %and292.i = and i64 %85, %not291.i
  %87 = xor i64 %and292.i, %86
  %xor295.i = xor i64 %87, %xor274.i
  %add448.i = add nuw nsw i32 %round.0.i27, 2
  %cmp.i = icmp samesign ult i32 %add448.i, 24
  br i1 %cmp.i, label %for.inc.i, label %KeccakF1600_StatePermute.exit, !llvm.loop !57

KeccakF1600_StatePermute.exit:                    ; preds = %for.inc.i
  %Aso.0.i.lcssa = phi i64 [ %xor444.i, %for.inc.i ]
  %Asi.0.i.lcssa = phi i64 [ %xor441.i, %for.inc.i ]
  %Ase.0.i.lcssa = phi i64 [ %xor438.i, %for.inc.i ]
  %Asa.0.i.lcssa = phi i64 [ %xor435.i, %for.inc.i ]
  %Amu.0.i.lcssa = phi i64 [ %xor412.i, %for.inc.i ]
  %Amo.0.i.lcssa = phi i64 [ %xor409.i, %for.inc.i ]
  %Ami.0.i.lcssa = phi i64 [ %xor406.i, %for.inc.i ]
  %Ame.0.i.lcssa = phi i64 [ %xor403.i, %for.inc.i ]
  %Ama.0.i.lcssa = phi i64 [ %xor400.i, %for.inc.i ]
  %Aku.0.i.lcssa = phi i64 [ %xor377.i, %for.inc.i ]
  %Ako.0.i.lcssa = phi i64 [ %xor374.i, %for.inc.i ]
  %Aki.0.i.lcssa = phi i64 [ %xor371.i, %for.inc.i ]
  %Ake.0.i.lcssa = phi i64 [ %xor368.i, %for.inc.i ]
  %Aka.0.i.lcssa = phi i64 [ %xor365.i, %for.inc.i ]
  %Agu.0.i.lcssa = phi i64 [ %xor342.i, %for.inc.i ]
  %Ago.0.i.lcssa = phi i64 [ %xor339.i, %for.inc.i ]
  %Agi.0.i.lcssa = phi i64 [ %xor336.i, %for.inc.i ]
  %Age.0.i.lcssa = phi i64 [ %xor333.i, %for.inc.i ]
  %Aga.0.i.lcssa = phi i64 [ %xor330.i, %for.inc.i ]
  %Abu.0.i.lcssa = phi i64 [ %xor307.i, %for.inc.i ]
  %Abo.0.i.lcssa = phi i64 [ %xor304.i, %for.inc.i ]
  %Abi.0.i.lcssa = phi i64 [ %xor301.i, %for.inc.i ]
  %Abe.0.i.lcssa = phi i64 [ %xor298.i, %for.inc.i ]
  %Aba.0.i.lcssa = phi i64 [ %xor295.i, %for.inc.i ]
  %Asu.0.i.lcssa = phi i64 [ %xor447.i, %for.inc.i ]
  store i64 %Aba.0.i.lcssa, ptr %0, align 8
  %arrayidx450.i = getelementptr inbounds nuw i8, ptr %0, i32 8
  store i64 %Abe.0.i.lcssa, ptr %arrayidx450.i, align 8
  %arrayidx451.i = getelementptr inbounds nuw i8, ptr %0, i32 16
  store i64 %Abi.0.i.lcssa, ptr %arrayidx451.i, align 8
  %arrayidx452.i = getelementptr inbounds nuw i8, ptr %0, i32 24
  store i64 %Abo.0.i.lcssa, ptr %arrayidx452.i, align 8
  %arrayidx453.i = getelementptr inbounds nuw i8, ptr %0, i32 32
  store i64 %Abu.0.i.lcssa, ptr %arrayidx453.i, align 8
  %arrayidx454.i = getelementptr inbounds nuw i8, ptr %0, i32 40
  store i64 %Aga.0.i.lcssa, ptr %arrayidx454.i, align 8
  %arrayidx455.i = getelementptr inbounds nuw i8, ptr %0, i32 48
  store i64 %Age.0.i.lcssa, ptr %arrayidx455.i, align 8
  %arrayidx456.i = getelementptr inbounds nuw i8, ptr %0, i32 56
  store i64 %Agi.0.i.lcssa, ptr %arrayidx456.i, align 8
  %arrayidx457.i = getelementptr inbounds nuw i8, ptr %0, i32 64
  store i64 %Ago.0.i.lcssa, ptr %arrayidx457.i, align 8
  %arrayidx458.i = getelementptr inbounds nuw i8, ptr %0, i32 72
  store i64 %Agu.0.i.lcssa, ptr %arrayidx458.i, align 8
  %arrayidx459.i = getelementptr inbounds nuw i8, ptr %0, i32 80
  store i64 %Aka.0.i.lcssa, ptr %arrayidx459.i, align 8
  %arrayidx460.i = getelementptr inbounds nuw i8, ptr %0, i32 88
  store i64 %Ake.0.i.lcssa, ptr %arrayidx460.i, align 8
  %arrayidx461.i = getelementptr inbounds nuw i8, ptr %0, i32 96
  store i64 %Aki.0.i.lcssa, ptr %arrayidx461.i, align 8
  %arrayidx462.i = getelementptr inbounds nuw i8, ptr %0, i32 104
  store i64 %Ako.0.i.lcssa, ptr %arrayidx462.i, align 8
  %arrayidx463.i = getelementptr inbounds nuw i8, ptr %0, i32 112
  store i64 %Aku.0.i.lcssa, ptr %arrayidx463.i, align 8
  %arrayidx464.i = getelementptr inbounds nuw i8, ptr %0, i32 120
  store i64 %Ama.0.i.lcssa, ptr %arrayidx464.i, align 8
  %arrayidx465.i = getelementptr inbounds nuw i8, ptr %0, i32 128
  store i64 %Ame.0.i.lcssa, ptr %arrayidx465.i, align 8
  %arrayidx466.i = getelementptr inbounds nuw i8, ptr %0, i32 136
  store i64 %Ami.0.i.lcssa, ptr %arrayidx466.i, align 8
  %arrayidx467.i = getelementptr inbounds nuw i8, ptr %0, i32 144
  store i64 %Amo.0.i.lcssa, ptr %arrayidx467.i, align 8
  %arrayidx468.i = getelementptr inbounds nuw i8, ptr %0, i32 152
  store i64 %Amu.0.i.lcssa, ptr %arrayidx468.i, align 8
  %arrayidx469.i = getelementptr inbounds nuw i8, ptr %0, i32 160
  store i64 %Asa.0.i.lcssa, ptr %arrayidx469.i, align 8
  %arrayidx470.i = getelementptr inbounds nuw i8, ptr %0, i32 168
  store i64 %Ase.0.i.lcssa, ptr %arrayidx470.i, align 8
  %arrayidx471.i = getelementptr inbounds nuw i8, ptr %0, i32 176
  store i64 %Asi.0.i.lcssa, ptr %arrayidx471.i, align 8
  %arrayidx472.i = getelementptr inbounds nuw i8, ptr %0, i32 184
  store i64 %Aso.0.i.lcssa, ptr %arrayidx472.i, align 8
  %arrayidx473.i = getelementptr inbounds nuw i8, ptr %0, i32 192
  store i64 %Asu.0.i.lcssa, ptr %arrayidx473.i, align 8
  br label %for.body.i

for.body.i:                                       ; preds = %KeccakF1600_StatePermute.exit, %store64.exit.i
  %i.0.i30 = phi i32 [ 0, %KeccakF1600_StatePermute.exit ], [ %inc.i, %store64.exit.i ]
  %mul.i = shl nuw nsw i32 %i.0.i30, 3
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %h.addr.0.i33, i32 %mul.i
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %0, i32 %i.0.i30
  %88 = load i64, ptr %arrayidx.i, align 8
  br label %for.body.i.i

for.body.i.i:                                     ; preds = %for.body.i, %for.body.i.i
  %i.0.i.i29 = phi i32 [ 0, %for.body.i ], [ %inc.i.i, %for.body.i.i ]
  %mul.i.i = shl nuw nsw i32 %i.0.i.i29, 3
  %sh_prom.i.i = zext nneg i32 %mul.i.i to i64
  %shr.i.i = lshr i64 %88, %sh_prom.i.i
  %conv.i.i = trunc i64 %shr.i.i to i8
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 %i.0.i.i29
  store i8 %conv.i.i, ptr %arrayidx.i.i, align 1
  %inc.i.i = add nuw nsw i32 %i.0.i.i29, 1
  %exitcond.i.i.not = icmp eq i32 %inc.i.i, 8
  br i1 %exitcond.i.i.not, label %store64.exit.i, label %for.body.i.i, !llvm.loop !58

store64.exit.i:                                   ; preds = %for.body.i.i
  %inc.i = add nuw nsw i32 %i.0.i30, 1
  %exitcond.i.not = icmp eq i32 %inc.i, 17
  br i1 %exitcond.i.not, label %for.end.i, label %for.body.i, !llvm.loop !59

for.end.i:                                        ; preds = %store64.exit.i
  %add.ptr2.i = getelementptr inbounds nuw i8, ptr %h.addr.0.i33, i32 136
  %dec.i = add i32 %nblocks.addr.0.i32, -1
  %cmp.not.i = icmp eq i32 %dec.i, 0
  br i1 %cmp.not.i, label %while.cond.i.keccak_squeezeblocks.exit_crit_edge, label %while.body.i, !llvm.loop !60

while.cond.i.keccak_squeezeblocks.exit_crit_edge: ; preds = %for.end.i
  br label %keccak_squeezeblocks.exit

keccak_squeezeblocks.exit:                        ; preds = %while.cond.i.keccak_squeezeblocks.exit_crit_edge, %entry
  ret void
}

; Function Attrs: inlinehint nounwind
define dso_local void @shake256_ctx_release(ptr noundef %state) local_unnamed_addr #1 {
entry:
  %0 = load ptr, ptr %state, align 4
  call void @free(ptr noundef %0) #8
  ret void
}

; Function Attrs: inlinehint nounwind
define dso_local void @shake256(ptr noundef %output, i32 noundef %outlen, ptr noundef %input, i32 noundef %inlen) local_unnamed_addr #1 {
entry:
  %t.i = alloca [200 x i8], align 1
  %t = alloca [136 x i8], align 1
  %s = alloca %struct.shake128incctx, align 4
  %div = udiv i32 %outlen, 136
  %call.i = call dereferenceable_or_null(200) ptr @malloc(i32 noundef 200) #7
  store ptr %call.i, ptr %s, align 4
  %cmp.i = icmp eq ptr %call.i, null
  br i1 %cmp.i, label %if.then.i, label %shake256_absorb.exit

if.then.i:                                        ; preds = %entry
  call void @exit(i32 noundef 111) #8
  br label %shake256_absorb.exit

shake256_absorb.exit:                             ; preds = %entry, %if.then.i
  %0 = load ptr, ptr %s, align 4
  call void @llvm.lifetime.start.p0(i64 200, ptr nonnull %t.i)
  br label %for.body.i43

while.cond.i32.preheader:                         ; preds = %for.body.i43
  %cmp1.not.i751 = icmp ult i32 %inlen, 136
  br i1 %cmp1.not.i751, label %for.cond10.i.preheader, label %for.cond2.i.preheader.lr.ph

for.cond2.i.preheader.lr.ph:                      ; preds = %while.cond.i32.preheader
  br label %for.cond2.i.preheader

for.body.i43:                                     ; preds = %shake256_absorb.exit, %for.body.i43
  %i.0.i30721 = phi i32 [ 0, %shake256_absorb.exit ], [ %inc.i45, %for.body.i43 ]
  %arrayidx.i44 = getelementptr inbounds nuw i64, ptr %0, i32 %i.0.i30721
  store i64 0, ptr %arrayidx.i44, align 8
  %inc.i45 = add nuw nsw i32 %i.0.i30721, 1
  %exitcond.i31.not = icmp eq i32 %inc.i45, 25
  br i1 %exitcond.i31.not, label %while.cond.i32.preheader, label %for.body.i43, !llvm.loop !61

for.cond2.i.preheader:                            ; preds = %for.cond2.i.preheader.lr.ph, %KeccakF1600_StatePermute.exit387
  %mlen.addr.0.i753 = phi i32 [ %inlen, %for.cond2.i.preheader.lr.ph ], [ %sub.i, %KeccakF1600_StatePermute.exit387 ]
  %m.addr.0.i752 = phi ptr [ %input, %for.cond2.i.preheader.lr.ph ], [ %add.ptr9.i, %KeccakF1600_StatePermute.exit387 ]
  br label %for.body4.i

while.cond.i32.for.cond10.i.preheader_crit_edge:  ; preds = %KeccakF1600_StatePermute.exit387
  %split = phi ptr [ %add.ptr9.i, %KeccakF1600_StatePermute.exit387 ]
  %split754 = phi i32 [ %sub.i, %KeccakF1600_StatePermute.exit387 ]
  br label %for.cond10.i.preheader

for.cond10.i.preheader:                           ; preds = %while.cond.i32.for.cond10.i.preheader_crit_edge, %while.cond.i32.preheader
  %m.addr.0.i.lcssa = phi ptr [ %split, %while.cond.i32.for.cond10.i.preheader_crit_edge ], [ %input, %while.cond.i32.preheader ]
  %mlen.addr.0.i.lcssa = phi i32 [ %split754, %while.cond.i32.for.cond10.i.preheader_crit_edge ], [ %inlen, %while.cond.i32.preheader ]
  br label %for.body12.i

for.body4.i:                                      ; preds = %for.cond2.i.preheader, %load64.exit.i
  %i.1.i724 = phi i32 [ 0, %for.cond2.i.preheader ], [ %inc7.i, %load64.exit.i ]
  %mul.i33 = shl nuw nsw i32 %i.1.i724, 3
  %add.ptr.i34 = getelementptr inbounds nuw i8, ptr %m.addr.0.i752, i32 %mul.i33
  br label %for.inc.i.i

for.inc.i.i:                                      ; preds = %for.body4.i, %for.inc.i.i
  %i.0.i.i36723 = phi i32 [ 0, %for.body4.i ], [ %inc.i.i42, %for.inc.i.i ]
  %r.0.i.i722 = phi i64 [ 0, %for.body4.i ], [ %or.i.i, %for.inc.i.i ]
  %arrayidx.i.i38 = getelementptr inbounds nuw i8, ptr %add.ptr.i34, i32 %i.0.i.i36723
  %1 = load i8, ptr %arrayidx.i.i38, align 1
  %conv.i.i39 = zext i8 %1 to i64
  %mul.i.i40 = shl nuw nsw i32 %i.0.i.i36723, 3
  %sh_prom.i.i41 = zext nneg i32 %mul.i.i40 to i64
  %shl.i.i = shl nuw i64 %conv.i.i39, %sh_prom.i.i41
  %or.i.i = or i64 %r.0.i.i722, %shl.i.i
  %inc.i.i42 = add nuw nsw i32 %i.0.i.i36723, 1
  %exitcond.i.i37.not = icmp eq i32 %inc.i.i42, 8
  br i1 %exitcond.i.i37.not, label %load64.exit.i, label %for.inc.i.i, !llvm.loop !62

load64.exit.i:                                    ; preds = %for.inc.i.i
  %r.0.i.i.lcssa = phi i64 [ %or.i.i, %for.inc.i.i ]
  %arrayidx5.i = getelementptr inbounds nuw i64, ptr %0, i32 %i.1.i724
  %2 = load i64, ptr %arrayidx5.i, align 8
  %xor.i = xor i64 %2, %r.0.i.i.lcssa
  store i64 %xor.i, ptr %arrayidx5.i, align 8
  %inc7.i = add nuw nsw i32 %i.1.i724, 1
  %exitcond3.i.not = icmp eq i32 %inc7.i, 17
  br i1 %exitcond3.i.not, label %for.end8.i, label %for.body4.i, !llvm.loop !63

for.end8.i:                                       ; preds = %load64.exit.i
  %3 = load i64, ptr %0, align 8
  %arrayidx1.i55 = getelementptr inbounds nuw i8, ptr %0, i32 8
  %4 = load i64, ptr %arrayidx1.i55, align 8
  %arrayidx2.i56 = getelementptr inbounds nuw i8, ptr %0, i32 16
  %5 = load i64, ptr %arrayidx2.i56, align 8
  %arrayidx3.i57 = getelementptr inbounds nuw i8, ptr %0, i32 24
  %6 = load i64, ptr %arrayidx3.i57, align 8
  %arrayidx4.i58 = getelementptr inbounds nuw i8, ptr %0, i32 32
  %7 = load i64, ptr %arrayidx4.i58, align 8
  %arrayidx5.i59 = getelementptr inbounds nuw i8, ptr %0, i32 40
  %8 = load i64, ptr %arrayidx5.i59, align 8
  %arrayidx6.i60 = getelementptr inbounds nuw i8, ptr %0, i32 48
  %9 = load i64, ptr %arrayidx6.i60, align 8
  %arrayidx7.i61 = getelementptr inbounds nuw i8, ptr %0, i32 56
  %10 = load i64, ptr %arrayidx7.i61, align 8
  %arrayidx8.i62 = getelementptr inbounds nuw i8, ptr %0, i32 64
  %11 = load i64, ptr %arrayidx8.i62, align 8
  %arrayidx9.i63 = getelementptr inbounds nuw i8, ptr %0, i32 72
  %12 = load i64, ptr %arrayidx9.i63, align 8
  %arrayidx10.i64 = getelementptr inbounds nuw i8, ptr %0, i32 80
  %13 = load i64, ptr %arrayidx10.i64, align 8
  %arrayidx11.i65 = getelementptr inbounds nuw i8, ptr %0, i32 88
  %14 = load i64, ptr %arrayidx11.i65, align 8
  %arrayidx12.i66 = getelementptr inbounds nuw i8, ptr %0, i32 96
  %15 = load i64, ptr %arrayidx12.i66, align 8
  %arrayidx13.i67 = getelementptr inbounds nuw i8, ptr %0, i32 104
  %16 = load i64, ptr %arrayidx13.i67, align 8
  %arrayidx14.i68 = getelementptr inbounds nuw i8, ptr %0, i32 112
  %17 = load i64, ptr %arrayidx14.i68, align 8
  %arrayidx15.i69 = getelementptr inbounds nuw i8, ptr %0, i32 120
  %18 = load i64, ptr %arrayidx15.i69, align 8
  %arrayidx16.i70 = getelementptr inbounds nuw i8, ptr %0, i32 128
  %19 = load i64, ptr %arrayidx16.i70, align 8
  %arrayidx17.i71 = getelementptr inbounds nuw i8, ptr %0, i32 136
  %20 = load i64, ptr %arrayidx17.i71, align 8
  %arrayidx18.i72 = getelementptr inbounds nuw i8, ptr %0, i32 144
  %21 = load i64, ptr %arrayidx18.i72, align 8
  %arrayidx19.i73 = getelementptr inbounds nuw i8, ptr %0, i32 152
  %22 = load i64, ptr %arrayidx19.i73, align 8
  %arrayidx20.i74 = getelementptr inbounds nuw i8, ptr %0, i32 160
  %23 = load i64, ptr %arrayidx20.i74, align 8
  %arrayidx21.i75 = getelementptr inbounds nuw i8, ptr %0, i32 168
  %24 = load i64, ptr %arrayidx21.i75, align 8
  %arrayidx22.i76 = getelementptr inbounds nuw i8, ptr %0, i32 176
  %25 = load i64, ptr %arrayidx22.i76, align 8
  %arrayidx23.i77 = getelementptr inbounds nuw i8, ptr %0, i32 184
  %26 = load i64, ptr %arrayidx23.i77, align 8
  %arrayidx24.i78 = getelementptr inbounds nuw i8, ptr %0, i32 192
  %27 = load i64, ptr %arrayidx24.i78, align 8
  br label %for.inc.i132

for.inc.i132:                                     ; preds = %for.end8.i, %for.inc.i132
  %Asu.0.i105750 = phi i64 [ %27, %for.end8.i ], [ %xor447.i287, %for.inc.i132 ]
  %round.0.i104749 = phi i32 [ 0, %for.end8.i ], [ %add448.i386, %for.inc.i132 ]
  %Aba.0.i103748 = phi i64 [ %3, %for.end8.i ], [ %xor295.i385, %for.inc.i132 ]
  %Abe.0.i102747 = phi i64 [ %4, %for.end8.i ], [ %xor298.i380, %for.inc.i132 ]
  %Abi.0.i101746 = phi i64 [ %5, %for.end8.i ], [ %xor301.i377, %for.inc.i132 ]
  %Abo.0.i100745 = phi i64 [ %6, %for.end8.i ], [ %xor304.i373, %for.inc.i132 ]
  %Abu.0.i99744 = phi i64 [ %7, %for.end8.i ], [ %xor307.i369, %for.inc.i132 ]
  %Aga.0.i98743 = phi i64 [ %8, %for.end8.i ], [ %xor330.i363, %for.inc.i132 ]
  %Age.0.i97742 = phi i64 [ %9, %for.end8.i ], [ %xor333.i360, %for.inc.i132 ]
  %Agi.0.i96741 = phi i64 [ %10, %for.end8.i ], [ %xor336.i357, %for.inc.i132 ]
  %Ago.0.i95740 = phi i64 [ %11, %for.end8.i ], [ %xor339.i353, %for.inc.i132 ]
  %Agu.0.i94739 = phi i64 [ %12, %for.end8.i ], [ %xor342.i349, %for.inc.i132 ]
  %Aka.0.i93738 = phi i64 [ %13, %for.end8.i ], [ %xor365.i343, %for.inc.i132 ]
  %Ake.0.i92737 = phi i64 [ %14, %for.end8.i ], [ %xor368.i340, %for.inc.i132 ]
  %Aki.0.i91736 = phi i64 [ %15, %for.end8.i ], [ %xor371.i337, %for.inc.i132 ]
  %Ako.0.i90735 = phi i64 [ %16, %for.end8.i ], [ %xor374.i333, %for.inc.i132 ]
  %Aku.0.i89734 = phi i64 [ %17, %for.end8.i ], [ %xor377.i329, %for.inc.i132 ]
  %Ama.0.i88733 = phi i64 [ %18, %for.end8.i ], [ %xor400.i323, %for.inc.i132 ]
  %Ame.0.i87732 = phi i64 [ %19, %for.end8.i ], [ %xor403.i320, %for.inc.i132 ]
  %Ami.0.i86731 = phi i64 [ %20, %for.end8.i ], [ %xor406.i317, %for.inc.i132 ]
  %Amo.0.i85730 = phi i64 [ %21, %for.end8.i ], [ %xor409.i313, %for.inc.i132 ]
  %Amu.0.i84729 = phi i64 [ %22, %for.end8.i ], [ %xor412.i309, %for.inc.i132 ]
  %Asa.0.i83728 = phi i64 [ %23, %for.end8.i ], [ %xor435.i303, %for.inc.i132 ]
  %Ase.0.i82727 = phi i64 [ %24, %for.end8.i ], [ %xor438.i300, %for.inc.i132 ]
  %Asi.0.i81726 = phi i64 [ %25, %for.end8.i ], [ %xor441.i297, %for.inc.i132 ]
  %Aso.0.i80725 = phi i64 [ %26, %for.end8.i ], [ %xor444.i292, %for.inc.i132 ]
  %xor32.i133 = xor i64 %Abi.0.i101746, %Agi.0.i96741
  %xor33.i134 = xor i64 %xor32.i133, %Aki.0.i91736
  %xor34.i135 = xor i64 %xor33.i134, %Ami.0.i86731
  %xor35.i136 = xor i64 %xor34.i135, %Asi.0.i81726
  %xor40.i137 = xor i64 %Abu.0.i99744, %Agu.0.i94739
  %xor41.i138 = xor i64 %xor40.i137, %Aku.0.i89734
  %xor42.i139 = xor i64 %xor41.i138, %Amu.0.i84729
  %xor43.i140 = xor i64 %xor42.i139, %Asu.0.i105750
  %28 = call i64 @llvm.fshl.i64(i64 %xor43.i140, i64 %xor43.i140, i64 1)
  %xor57.i141 = xor i64 %xor35.i136, %28
  %xor203.i142 = xor i64 %Ago.0.i95740, %xor57.i141
  %29 = call i64 @llvm.fshl.i64(i64 %xor203.i142, i64 %xor203.i142, i64 55)
  %xor28.i143 = xor i64 %Abe.0.i102747, %Age.0.i97742
  %xor29.i144 = xor i64 %xor28.i143, %Ake.0.i92737
  %xor30.i145 = xor i64 %xor29.i144, %Ame.0.i87732
  %xor31.i146 = xor i64 %xor30.i145, %Ase.0.i82727
  %30 = call i64 @llvm.fshl.i64(i64 %xor31.i146, i64 %xor31.i146, i64 1)
  %xor45.i147 = xor i64 %xor43.i140, %30
  %xor211.i148 = xor i64 %Ama.0.i88733, %xor45.i147
  %31 = call i64 @llvm.fshl.i64(i64 %xor211.i148, i64 %xor211.i148, i64 41)
  %xor36.i149 = xor i64 %Abo.0.i100745, %Ago.0.i95740
  %xor37.i150 = xor i64 %xor36.i149, %Ako.0.i90735
  %xor38.i151 = xor i64 %xor37.i150, %Amo.0.i85730
  %xor39.i152 = xor i64 %xor38.i151, %Aso.0.i80725
  %xor.i153 = xor i64 %Aba.0.i103748, %Aga.0.i98743
  %xor25.i154 = xor i64 %xor.i153, %Aka.0.i93738
  %xor26.i155 = xor i64 %xor25.i154, %Ama.0.i88733
  %xor27.i156 = xor i64 %xor26.i155, %Asa.0.i83728
  %32 = call i64 @llvm.fshl.i64(i64 %xor27.i156, i64 %xor27.i156, i64 1)
  %xor61.i157 = xor i64 %xor39.i152, %32
  %xor207.i158 = xor i64 %Aku.0.i89734, %xor61.i157
  %33 = call i64 @llvm.fshl.i64(i64 %xor207.i158, i64 %xor207.i158, i64 39)
  %not222.i159 = xor i64 %33, -1
  %and223.i160 = and i64 %31, %not222.i159
  %xor224.i161 = xor i64 %29, %and223.i160
  %34 = call i64 @llvm.fshl.i64(i64 %xor39.i152, i64 %xor39.i152, i64 1)
  %xor53.i162 = xor i64 %xor31.i146, %34
  %xor67.i163 = xor i64 %Aki.0.i91736, %xor53.i162
  %35 = call i64 @llvm.fshl.i64(i64 %xor67.i163, i64 %xor67.i163, i64 43)
  %36 = call i64 @llvm.fshl.i64(i64 %xor35.i136, i64 %xor35.i136, i64 1)
  %xor49.i164 = xor i64 %xor27.i156, %36
  %xor63.i165 = xor i64 %Age.0.i97742, %xor49.i164
  %37 = call i64 @llvm.fshl.i64(i64 %xor63.i165, i64 %xor63.i165, i64 44)
  %not.i166 = xor i64 %37, -1
  %and.i167 = and i64 %35, %not.i166
  %arrayidx80.i168 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %round.0.i104749
  %38 = load i64, ptr %arrayidx80.i168, align 8
  %39 = xor i64 %and.i167, %38
  %xor62.i169 = xor i64 %Aba.0.i103748, %xor45.i147
  %xor81.i170 = xor i64 %39, %xor62.i169
  %xor94.i171 = xor i64 %Abo.0.i100745, %xor57.i141
  %40 = call i64 @llvm.fshl.i64(i64 %xor94.i171, i64 %xor94.i171, i64 28)
  %xor102.i172 = xor i64 %Aka.0.i93738, %xor45.i147
  %41 = call i64 @llvm.fshl.i64(i64 %xor102.i172, i64 %xor102.i172, i64 3)
  %xor98.i173 = xor i64 %Agu.0.i94739, %xor61.i157
  %42 = call i64 @llvm.fshl.i64(i64 %xor98.i173, i64 %xor98.i173, i64 20)
  %not114.i174 = xor i64 %42, -1
  %and115.i175 = and i64 %41, %not114.i174
  %xor116.i176 = xor i64 %40, %and115.i175
  %xor234.i177 = xor i64 %xor81.i170, %xor116.i176
  %xor129.i178 = xor i64 %Abe.0.i102747, %xor49.i164
  %43 = call i64 @llvm.fshl.i64(i64 %xor129.i178, i64 %xor129.i178, i64 1)
  %xor137.i179 = xor i64 %Ako.0.i90735, %xor57.i141
  %44 = call i64 @llvm.fshl.i64(i64 %xor137.i179, i64 %xor137.i179, i64 25)
  %xor133.i180 = xor i64 %Agi.0.i96741, %xor53.i162
  %45 = call i64 @llvm.fshl.i64(i64 %xor133.i180, i64 %xor133.i180, i64 6)
  %not149.i181 = xor i64 %45, -1
  %and150.i182 = and i64 %44, %not149.i181
  %xor151.i183 = xor i64 %43, %and150.i182
  %xor235.i184 = xor i64 %xor234.i177, %xor151.i183
  %xor164.i185 = xor i64 %Abu.0.i99744, %xor61.i157
  %46 = call i64 @llvm.fshl.i64(i64 %xor164.i185, i64 %xor164.i185, i64 27)
  %xor172.i186 = xor i64 %Ake.0.i92737, %xor49.i164
  %47 = call i64 @llvm.fshl.i64(i64 %xor172.i186, i64 %xor172.i186, i64 10)
  %xor168.i187 = xor i64 %Aga.0.i98743, %xor45.i147
  %48 = call i64 @llvm.fshl.i64(i64 %xor168.i187, i64 %xor168.i187, i64 36)
  %not184.i188 = xor i64 %48, -1
  %and185.i189 = and i64 %47, %not184.i188
  %xor186.i190 = xor i64 %46, %and185.i189
  %xor236.i191 = xor i64 %xor235.i184, %xor186.i190
  %xor199.i192 = xor i64 %Abi.0.i101746, %xor53.i162
  %49 = call i64 @llvm.fshl.i64(i64 %xor199.i192, i64 %xor199.i192, i64 62)
  %not219.i193 = xor i64 %29, -1
  %and220.i194 = and i64 %33, %not219.i193
  %xor221.i195 = xor i64 %49, %and220.i194
  %xor237.i196 = xor i64 %xor236.i191, %xor221.i195
  %xor75.i197 = xor i64 %Asu.0.i105750, %xor61.i157
  %50 = call i64 @llvm.fshl.i64(i64 %xor75.i197, i64 %xor75.i197, i64 14)
  %xor71.i198 = xor i64 %Amo.0.i85730, %xor57.i141
  %51 = call i64 @llvm.fshl.i64(i64 %xor71.i198, i64 %xor71.i198, i64 21)
  %not85.i199 = xor i64 %51, -1
  %and86.i200 = and i64 %50, %not85.i199
  %xor87.i201 = xor i64 %35, %and86.i200
  %xor110.i202 = xor i64 %Asi.0.i81726, %xor53.i162
  %52 = call i64 @llvm.fshl.i64(i64 %xor110.i202, i64 %xor110.i202, i64 61)
  %xor106.i203 = xor i64 %Ame.0.i87732, %xor49.i164
  %53 = call i64 @llvm.fshl.i64(i64 %xor106.i203, i64 %xor106.i203, i64 45)
  %not120.i204 = xor i64 %53, -1
  %and121.i205 = and i64 %52, %not120.i204
  %xor122.i206 = xor i64 %41, %and121.i205
  %xor242.i207 = xor i64 %xor87.i201, %xor122.i206
  %xor145.i208 = xor i64 %Asa.0.i83728, %xor45.i147
  %54 = call i64 @llvm.fshl.i64(i64 %xor145.i208, i64 %xor145.i208, i64 18)
  %xor141.i209 = xor i64 %Amu.0.i84729, %xor61.i157
  %55 = call i64 @llvm.fshl.i64(i64 %xor141.i209, i64 %xor141.i209, i64 8)
  %not155.i210 = xor i64 %55, -1
  %and156.i211 = and i64 %54, %not155.i210
  %xor157.i212 = xor i64 %44, %and156.i211
  %xor243.i213 = xor i64 %xor242.i207, %xor157.i212
  %xor180.i214 = xor i64 %Aso.0.i80725, %xor57.i141
  %56 = call i64 @llvm.fshl.i64(i64 %xor180.i214, i64 %xor180.i214, i64 56)
  %xor176.i215 = xor i64 %Ami.0.i86731, %xor53.i162
  %57 = call i64 @llvm.fshl.i64(i64 %xor176.i215, i64 %xor176.i215, i64 15)
  %not190.i216 = xor i64 %57, -1
  %and191.i217 = and i64 %56, %not190.i216
  %xor192.i218 = xor i64 %47, %and191.i217
  %xor244.i219 = xor i64 %xor243.i213, %xor192.i218
  %xor215.i220 = xor i64 %Ase.0.i82727, %xor49.i164
  %58 = call i64 @llvm.fshl.i64(i64 %xor215.i220, i64 %xor215.i220, i64 2)
  %not225.i221 = xor i64 %31, -1
  %and226.i222 = and i64 %58, %not225.i221
  %xor227.i223 = xor i64 %33, %and226.i222
  %xor245.i224 = xor i64 %xor244.i219, %xor227.i223
  %59 = call i64 @llvm.fshl.i64(i64 %xor245.i224, i64 %xor245.i224, i64 1)
  %xor261.i225 = xor i64 %xor237.i196, %59
  %xor429.i226 = xor i64 %xor224.i161, %xor261.i225
  %60 = call i64 @llvm.fshl.i64(i64 %xor429.i226, i64 %xor429.i226, i64 2)
  %not123.i227 = xor i64 %52, -1
  %and124.i228 = and i64 %40, %not123.i227
  %xor125.i229 = xor i64 %53, %and124.i228
  %not91.i230 = xor i64 %xor62.i169, -1
  %and92.i231 = and i64 %37, %not91.i230
  %xor93.i232 = xor i64 %50, %and92.i231
  %not126.i233 = xor i64 %40, -1
  %and127.i234 = and i64 %42, %not126.i233
  %xor128.i235 = xor i64 %52, %and127.i234
  %xor250.i236 = xor i64 %xor93.i232, %xor128.i235
  %not161.i237 = xor i64 %43, -1
  %and162.i238 = and i64 %45, %not161.i237
  %xor163.i239 = xor i64 %54, %and162.i238
  %xor251.i240 = xor i64 %xor250.i236, %xor163.i239
  %not196.i241 = xor i64 %46, -1
  %and197.i242 = and i64 %48, %not196.i241
  %xor198.i243 = xor i64 %56, %and197.i242
  %xor252.i244 = xor i64 %xor251.i240, %xor198.i243
  %not231.i245 = xor i64 %49, -1
  %and232.i246 = and i64 %29, %not231.i245
  %xor233.i247 = xor i64 %58, %and232.i246
  %xor253.i248 = xor i64 %xor252.i244, %xor233.i247
  %61 = call i64 @llvm.fshl.i64(i64 %xor253.i248, i64 %xor253.i248, i64 1)
  %xor269.i249 = xor i64 %xor245.i224, %61
  %xor417.i250 = xor i64 %xor125.i229, %xor269.i249
  %62 = call i64 @llvm.fshl.i64(i64 %xor417.i250, i64 %xor417.i250, i64 55)
  %not82.i251 = xor i64 %35, -1
  %and83.i252 = and i64 %51, %not82.i251
  %xor84.i253 = xor i64 %37, %and83.i252
  %not117.i254 = xor i64 %41, -1
  %and118.i255 = and i64 %53, %not117.i254
  %xor119.i256 = xor i64 %42, %and118.i255
  %xor238.i257 = xor i64 %xor84.i253, %xor119.i256
  %not152.i258 = xor i64 %44, -1
  %and153.i259 = and i64 %55, %not152.i258
  %xor154.i260 = xor i64 %45, %and153.i259
  %xor239.i261 = xor i64 %xor238.i257, %xor154.i260
  %not187.i262 = xor i64 %47, -1
  %and188.i263 = and i64 %57, %not187.i262
  %xor189.i264 = xor i64 %48, %and188.i263
  %xor240.i265 = xor i64 %xor239.i261, %xor189.i264
  %xor241.i266 = xor i64 %xor240.i265, %xor224.i161
  %not88.i267 = xor i64 %50, -1
  %and89.i268 = and i64 %xor62.i169, %not88.i267
  %xor90.i269 = xor i64 %51, %and89.i268
  %xor246.i270 = xor i64 %xor90.i269, %xor125.i229
  %not158.i271 = xor i64 %54, -1
  %and159.i272 = and i64 %43, %not158.i271
  %xor160.i273 = xor i64 %55, %and159.i272
  %xor247.i274 = xor i64 %xor246.i270, %xor160.i273
  %not193.i275 = xor i64 %56, -1
  %and194.i276 = and i64 %46, %not193.i275
  %xor195.i277 = xor i64 %57, %and194.i276
  %xor248.i278 = xor i64 %xor247.i274, %xor195.i277
  %not228.i279 = xor i64 %58, -1
  %and229.i280 = and i64 %49, %not228.i279
  %xor230.i281 = xor i64 %31, %and229.i280
  %xor249.i282 = xor i64 %xor248.i278, %xor230.i281
  %63 = call i64 @llvm.fshl.i64(i64 %xor249.i282, i64 %xor249.i282, i64 1)
  %xor265.i283 = xor i64 %xor241.i266, %63
  %xor413.i284 = xor i64 %xor87.i201, %xor265.i283
  %64 = call i64 @llvm.fshl.i64(i64 %xor413.i284, i64 %xor413.i284, i64 62)
  %not445.i285 = xor i64 %64, -1
  %and446.i286 = and i64 %62, %not445.i285
  %xor447.i287 = xor i64 %60, %and446.i286
  %65 = call i64 @llvm.fshl.i64(i64 %xor241.i266, i64 %xor241.i266, i64 1)
  %xor257.i288 = xor i64 %xor253.i248, %65
  %xor425.i289 = xor i64 %xor186.i190, %xor257.i288
  %66 = call i64 @llvm.fshl.i64(i64 %xor425.i289, i64 %xor425.i289, i64 41)
  %not442.i290 = xor i64 %60, -1
  %and443.i291 = and i64 %64, %not442.i290
  %xor444.i292 = xor i64 %66, %and443.i291
  %67 = call i64 @llvm.fshl.i64(i64 %xor237.i196, i64 %xor237.i196, i64 1)
  %xor273.i293 = xor i64 %xor249.i282, %67
  %xor421.i294 = xor i64 %xor163.i239, %xor273.i293
  %68 = call i64 @llvm.fshl.i64(i64 %xor421.i294, i64 %xor421.i294, i64 39)
  %not439.i295 = xor i64 %66, -1
  %and440.i296 = and i64 %60, %not439.i295
  %xor441.i297 = xor i64 %68, %and440.i296
  %not436.i298 = xor i64 %68, -1
  %and437.i299 = and i64 %66, %not436.i298
  %xor438.i300 = xor i64 %62, %and437.i299
  %not433.i301 = xor i64 %62, -1
  %and434.i302 = and i64 %68, %not433.i301
  %xor435.i303 = xor i64 %64, %and434.i302
  %xor394.i304 = xor i64 %xor230.i281, %xor269.i249
  %69 = call i64 @llvm.fshl.i64(i64 %xor394.i304, i64 %xor394.i304, i64 56)
  %xor382.i305 = xor i64 %xor116.i176, %xor257.i288
  %70 = call i64 @llvm.fshl.i64(i64 %xor382.i305, i64 %xor382.i305, i64 36)
  %xor378.i306 = xor i64 %xor93.i232, %xor273.i293
  %71 = call i64 @llvm.fshl.i64(i64 %xor378.i306, i64 %xor378.i306, i64 27)
  %not410.i307 = xor i64 %71, -1
  %and411.i308 = and i64 %70, %not410.i307
  %xor412.i309 = xor i64 %69, %and411.i308
  %xor390.i310 = xor i64 %xor192.i218, %xor265.i283
  %72 = call i64 @llvm.fshl.i64(i64 %xor390.i310, i64 %xor390.i310, i64 15)
  %not407.i311 = xor i64 %69, -1
  %and408.i312 = and i64 %71, %not407.i311
  %xor409.i313 = xor i64 %72, %and408.i312
  %xor386.i314 = xor i64 %xor154.i260, %xor261.i225
  %73 = call i64 @llvm.fshl.i64(i64 %xor386.i314, i64 %xor386.i314, i64 10)
  %not404.i315 = xor i64 %72, -1
  %and405.i316 = and i64 %69, %not404.i315
  %xor406.i317 = xor i64 %73, %and405.i316
  %not401.i318 = xor i64 %73, -1
  %and402.i319 = and i64 %72, %not401.i318
  %xor403.i320 = xor i64 %70, %and402.i319
  %not398.i321 = xor i64 %70, -1
  %and399.i322 = and i64 %73, %not398.i321
  %xor400.i323 = xor i64 %71, %and399.i322
  %xor359.i324 = xor i64 %xor221.i195, %xor257.i288
  %74 = call i64 @llvm.fshl.i64(i64 %xor359.i324, i64 %xor359.i324, i64 18)
  %xor347.i325 = xor i64 %xor122.i206, %xor265.i283
  %75 = call i64 @llvm.fshl.i64(i64 %xor347.i325, i64 %xor347.i325, i64 6)
  %xor343.i326 = xor i64 %xor84.i253, %xor261.i225
  %76 = call i64 @llvm.fshl.i64(i64 %xor343.i326, i64 %xor343.i326, i64 1)
  %not375.i327 = xor i64 %76, -1
  %and376.i328 = and i64 %75, %not375.i327
  %xor377.i329 = xor i64 %74, %and376.i328
  %xor355.i330 = xor i64 %xor198.i243, %xor273.i293
  %77 = call i64 @llvm.fshl.i64(i64 %xor355.i330, i64 %xor355.i330, i64 8)
  %not372.i331 = xor i64 %74, -1
  %and373.i332 = and i64 %76, %not372.i331
  %xor374.i333 = xor i64 %77, %and373.i332
  %xor351.i334 = xor i64 %xor160.i273, %xor269.i249
  %78 = call i64 @llvm.fshl.i64(i64 %xor351.i334, i64 %xor351.i334, i64 25)
  %not369.i335 = xor i64 %77, -1
  %and370.i336 = and i64 %74, %not369.i335
  %xor371.i337 = xor i64 %78, %and370.i336
  %not366.i338 = xor i64 %78, -1
  %and367.i339 = and i64 %77, %not366.i338
  %xor368.i340 = xor i64 %75, %and367.i339
  %not363.i341 = xor i64 %75, -1
  %and364.i342 = and i64 %78, %not363.i341
  %xor365.i343 = xor i64 %76, %and364.i342
  %xor324.i344 = xor i64 %xor227.i223, %xor265.i283
  %79 = call i64 @llvm.fshl.i64(i64 %xor324.i344, i64 %xor324.i344, i64 61)
  %xor312.i345 = xor i64 %xor128.i235, %xor273.i293
  %80 = call i64 @llvm.fshl.i64(i64 %xor312.i345, i64 %xor312.i345, i64 20)
  %xor308.i346 = xor i64 %xor90.i269, %xor269.i249
  %81 = call i64 @llvm.fshl.i64(i64 %xor308.i346, i64 %xor308.i346, i64 28)
  %not340.i347 = xor i64 %81, -1
  %and341.i348 = and i64 %80, %not340.i347
  %xor342.i349 = xor i64 %79, %and341.i348
  %xor320.i350 = xor i64 %xor189.i264, %xor261.i225
  %82 = call i64 @llvm.fshl.i64(i64 %xor320.i350, i64 %xor320.i350, i64 45)
  %not337.i351 = xor i64 %79, -1
  %and338.i352 = and i64 %81, %not337.i351
  %xor339.i353 = xor i64 %82, %and338.i352
  %xor316.i354 = xor i64 %xor151.i183, %xor257.i288
  %83 = call i64 @llvm.fshl.i64(i64 %xor316.i354, i64 %xor316.i354, i64 3)
  %not334.i355 = xor i64 %82, -1
  %and335.i356 = and i64 %79, %not334.i355
  %xor336.i357 = xor i64 %83, %and335.i356
  %not331.i358 = xor i64 %83, -1
  %and332.i359 = and i64 %82, %not331.i358
  %xor333.i360 = xor i64 %80, %and332.i359
  %not328.i361 = xor i64 %80, -1
  %and329.i362 = and i64 %83, %not328.i361
  %xor330.i363 = xor i64 %81, %and329.i362
  %xor287.i364 = xor i64 %xor233.i247, %xor273.i293
  %84 = call i64 @llvm.fshl.i64(i64 %xor287.i364, i64 %xor287.i364, i64 14)
  %xor275.i365 = xor i64 %xor119.i256, %xor261.i225
  %85 = call i64 @llvm.fshl.i64(i64 %xor275.i365, i64 %xor275.i365, i64 44)
  %xor274.i366 = xor i64 %xor81.i170, %xor257.i288
  %not305.i367 = xor i64 %xor274.i366, -1
  %and306.i368 = and i64 %85, %not305.i367
  %xor307.i369 = xor i64 %84, %and306.i368
  %xor283.i370 = xor i64 %xor195.i277, %xor269.i249
  %86 = call i64 @llvm.fshl.i64(i64 %xor283.i370, i64 %xor283.i370, i64 21)
  %not302.i371 = xor i64 %84, -1
  %and303.i372 = and i64 %xor274.i366, %not302.i371
  %xor304.i373 = xor i64 %86, %and303.i372
  %xor279.i374 = xor i64 %xor157.i212, %xor265.i283
  %87 = call i64 @llvm.fshl.i64(i64 %xor279.i374, i64 %xor279.i374, i64 43)
  %not299.i375 = xor i64 %86, -1
  %and300.i376 = and i64 %84, %not299.i375
  %xor301.i377 = xor i64 %87, %and300.i376
  %not296.i378 = xor i64 %87, -1
  %and297.i379 = and i64 %86, %not296.i378
  %xor298.i380 = xor i64 %85, %and297.i379
  %add.i381 = or disjoint i32 %round.0.i104749, 1
  %arrayidx294.i382 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %add.i381
  %88 = load i64, ptr %arrayidx294.i382, align 8
  %not291.i383 = xor i64 %85, -1
  %and292.i384 = and i64 %87, %not291.i383
  %89 = xor i64 %and292.i384, %88
  %xor295.i385 = xor i64 %89, %xor274.i366
  %add448.i386 = add nuw nsw i32 %round.0.i104749, 2
  %cmp.i106 = icmp samesign ult i32 %add448.i386, 24
  br i1 %cmp.i106, label %for.inc.i132, label %KeccakF1600_StatePermute.exit387, !llvm.loop !64

KeccakF1600_StatePermute.exit387:                 ; preds = %for.inc.i132
  %Aso.0.i80.lcssa = phi i64 [ %xor444.i292, %for.inc.i132 ]
  %Asi.0.i81.lcssa = phi i64 [ %xor441.i297, %for.inc.i132 ]
  %Ase.0.i82.lcssa = phi i64 [ %xor438.i300, %for.inc.i132 ]
  %Asa.0.i83.lcssa = phi i64 [ %xor435.i303, %for.inc.i132 ]
  %Amu.0.i84.lcssa = phi i64 [ %xor412.i309, %for.inc.i132 ]
  %Amo.0.i85.lcssa = phi i64 [ %xor409.i313, %for.inc.i132 ]
  %Ami.0.i86.lcssa = phi i64 [ %xor406.i317, %for.inc.i132 ]
  %Ame.0.i87.lcssa = phi i64 [ %xor403.i320, %for.inc.i132 ]
  %Ama.0.i88.lcssa = phi i64 [ %xor400.i323, %for.inc.i132 ]
  %Aku.0.i89.lcssa = phi i64 [ %xor377.i329, %for.inc.i132 ]
  %Ako.0.i90.lcssa = phi i64 [ %xor374.i333, %for.inc.i132 ]
  %Aki.0.i91.lcssa = phi i64 [ %xor371.i337, %for.inc.i132 ]
  %Ake.0.i92.lcssa = phi i64 [ %xor368.i340, %for.inc.i132 ]
  %Aka.0.i93.lcssa = phi i64 [ %xor365.i343, %for.inc.i132 ]
  %Agu.0.i94.lcssa = phi i64 [ %xor342.i349, %for.inc.i132 ]
  %Ago.0.i95.lcssa = phi i64 [ %xor339.i353, %for.inc.i132 ]
  %Agi.0.i96.lcssa = phi i64 [ %xor336.i357, %for.inc.i132 ]
  %Age.0.i97.lcssa = phi i64 [ %xor333.i360, %for.inc.i132 ]
  %Aga.0.i98.lcssa = phi i64 [ %xor330.i363, %for.inc.i132 ]
  %Abu.0.i99.lcssa = phi i64 [ %xor307.i369, %for.inc.i132 ]
  %Abo.0.i100.lcssa = phi i64 [ %xor304.i373, %for.inc.i132 ]
  %Abi.0.i101.lcssa = phi i64 [ %xor301.i377, %for.inc.i132 ]
  %Abe.0.i102.lcssa = phi i64 [ %xor298.i380, %for.inc.i132 ]
  %Aba.0.i103.lcssa = phi i64 [ %xor295.i385, %for.inc.i132 ]
  %Asu.0.i105.lcssa = phi i64 [ %xor447.i287, %for.inc.i132 ]
  store i64 %Aba.0.i103.lcssa, ptr %0, align 8
  %arrayidx450.i108 = getelementptr inbounds nuw i8, ptr %0, i32 8
  store i64 %Abe.0.i102.lcssa, ptr %arrayidx450.i108, align 8
  %arrayidx451.i109 = getelementptr inbounds nuw i8, ptr %0, i32 16
  store i64 %Abi.0.i101.lcssa, ptr %arrayidx451.i109, align 8
  %arrayidx452.i110 = getelementptr inbounds nuw i8, ptr %0, i32 24
  store i64 %Abo.0.i100.lcssa, ptr %arrayidx452.i110, align 8
  %arrayidx453.i111 = getelementptr inbounds nuw i8, ptr %0, i32 32
  store i64 %Abu.0.i99.lcssa, ptr %arrayidx453.i111, align 8
  %arrayidx454.i112 = getelementptr inbounds nuw i8, ptr %0, i32 40
  store i64 %Aga.0.i98.lcssa, ptr %arrayidx454.i112, align 8
  %arrayidx455.i113 = getelementptr inbounds nuw i8, ptr %0, i32 48
  store i64 %Age.0.i97.lcssa, ptr %arrayidx455.i113, align 8
  %arrayidx456.i114 = getelementptr inbounds nuw i8, ptr %0, i32 56
  store i64 %Agi.0.i96.lcssa, ptr %arrayidx456.i114, align 8
  %arrayidx457.i115 = getelementptr inbounds nuw i8, ptr %0, i32 64
  store i64 %Ago.0.i95.lcssa, ptr %arrayidx457.i115, align 8
  %arrayidx458.i116 = getelementptr inbounds nuw i8, ptr %0, i32 72
  store i64 %Agu.0.i94.lcssa, ptr %arrayidx458.i116, align 8
  %arrayidx459.i117 = getelementptr inbounds nuw i8, ptr %0, i32 80
  store i64 %Aka.0.i93.lcssa, ptr %arrayidx459.i117, align 8
  %arrayidx460.i118 = getelementptr inbounds nuw i8, ptr %0, i32 88
  store i64 %Ake.0.i92.lcssa, ptr %arrayidx460.i118, align 8
  %arrayidx461.i119 = getelementptr inbounds nuw i8, ptr %0, i32 96
  store i64 %Aki.0.i91.lcssa, ptr %arrayidx461.i119, align 8
  %arrayidx462.i120 = getelementptr inbounds nuw i8, ptr %0, i32 104
  store i64 %Ako.0.i90.lcssa, ptr %arrayidx462.i120, align 8
  %arrayidx463.i121 = getelementptr inbounds nuw i8, ptr %0, i32 112
  store i64 %Aku.0.i89.lcssa, ptr %arrayidx463.i121, align 8
  %arrayidx464.i122 = getelementptr inbounds nuw i8, ptr %0, i32 120
  store i64 %Ama.0.i88.lcssa, ptr %arrayidx464.i122, align 8
  %arrayidx465.i123 = getelementptr inbounds nuw i8, ptr %0, i32 128
  store i64 %Ame.0.i87.lcssa, ptr %arrayidx465.i123, align 8
  %arrayidx466.i124 = getelementptr inbounds nuw i8, ptr %0, i32 136
  store i64 %Ami.0.i86.lcssa, ptr %arrayidx466.i124, align 8
  %arrayidx467.i125 = getelementptr inbounds nuw i8, ptr %0, i32 144
  store i64 %Amo.0.i85.lcssa, ptr %arrayidx467.i125, align 8
  %arrayidx468.i126 = getelementptr inbounds nuw i8, ptr %0, i32 152
  store i64 %Amu.0.i84.lcssa, ptr %arrayidx468.i126, align 8
  %arrayidx469.i127 = getelementptr inbounds nuw i8, ptr %0, i32 160
  store i64 %Asa.0.i83.lcssa, ptr %arrayidx469.i127, align 8
  %arrayidx470.i128 = getelementptr inbounds nuw i8, ptr %0, i32 168
  store i64 %Ase.0.i82.lcssa, ptr %arrayidx470.i128, align 8
  %arrayidx471.i129 = getelementptr inbounds nuw i8, ptr %0, i32 176
  store i64 %Asi.0.i81.lcssa, ptr %arrayidx471.i129, align 8
  %arrayidx472.i130 = getelementptr inbounds nuw i8, ptr %0, i32 184
  store i64 %Aso.0.i80.lcssa, ptr %arrayidx472.i130, align 8
  %arrayidx473.i131 = getelementptr inbounds nuw i8, ptr %0, i32 192
  store i64 %Asu.0.i105.lcssa, ptr %arrayidx473.i131, align 8
  %sub.i = add i32 %mlen.addr.0.i753, -136
  %add.ptr9.i = getelementptr inbounds nuw i8, ptr %m.addr.0.i752, i32 136
  %cmp1.not.i = icmp ult i32 %sub.i, 136
  br i1 %cmp1.not.i, label %while.cond.i32.for.cond10.i.preheader_crit_edge, label %for.cond2.i.preheader, !llvm.loop !65

for.cond17.i.preheader:                           ; preds = %for.body12.i
  %exitcond6.i.not756 = icmp eq i32 0, %mlen.addr.0.i.lcssa
  br i1 %exitcond6.i.not756, label %for.end24.i, label %for.body19.i.lr.ph

for.body19.i.lr.ph:                               ; preds = %for.cond17.i.preheader
  br label %for.body19.i

for.body12.i:                                     ; preds = %for.cond10.i.preheader, %for.body12.i
  %i.2.i755 = phi i32 [ 0, %for.cond10.i.preheader ], [ %inc15.i, %for.body12.i ]
  %arrayidx13.i = getelementptr inbounds nuw [200 x i8], ptr %t.i, i32 0, i32 %i.2.i755
  store i8 0, ptr %arrayidx13.i, align 1
  %inc15.i = add nuw nsw i32 %i.2.i755, 1
  %exitcond4.i.not = icmp eq i32 %inc15.i, 136
  br i1 %exitcond4.i.not, label %for.cond17.i.preheader, label %for.body12.i, !llvm.loop !66

for.body19.i:                                     ; preds = %for.body19.i.lr.ph, %for.body19.i
  %i.3.i757 = phi i32 [ 0, %for.body19.i.lr.ph ], [ %inc23.i, %for.body19.i ]
  %arrayidx20.i = getelementptr inbounds nuw i8, ptr %m.addr.0.i.lcssa, i32 %i.3.i757
  %90 = load i8, ptr %arrayidx20.i, align 1
  %arrayidx21.i = getelementptr inbounds nuw [200 x i8], ptr %t.i, i32 0, i32 %i.3.i757
  store i8 %90, ptr %arrayidx21.i, align 1
  %inc23.i = add nuw i32 %i.3.i757, 1
  %exitcond6.i.not = icmp eq i32 %inc23.i, %mlen.addr.0.i.lcssa
  br i1 %exitcond6.i.not, label %for.cond17.i.for.end24.i_crit_edge, label %for.body19.i, !llvm.loop !67

for.cond17.i.for.end24.i_crit_edge:               ; preds = %for.body19.i
  br label %for.end24.i

for.end24.i:                                      ; preds = %for.cond17.i.for.end24.i_crit_edge, %for.cond17.i.preheader
  %i.3.i.lcssa = phi i32 [ %mlen.addr.0.i.lcssa, %for.cond17.i.for.end24.i_crit_edge ], [ 0, %for.cond17.i.preheader ]
  %arrayidx25.i = getelementptr inbounds nuw [200 x i8], ptr %t.i, i32 0, i32 %i.3.i.lcssa
  store i8 31, ptr %arrayidx25.i, align 1
  %arrayidx27.i = getelementptr inbounds nuw i8, ptr %t.i, i32 135
  %91 = load i8, ptr %arrayidx27.i, align 1
  %92 = or i8 %91, -128
  store i8 %92, ptr %arrayidx27.i, align 1
  br label %for.body33.i

for.body33.i:                                     ; preds = %for.end24.i, %load64.exit13.i
  %i.4.i761 = phi i32 [ 0, %for.end24.i ], [ %inc40.i, %load64.exit13.i ]
  %mul34.i = shl nuw nsw i32 %i.4.i761, 3
  %add.ptr35.i = getelementptr inbounds nuw i8, ptr %t.i, i32 %mul34.i
  br label %for.inc.i5.i

for.inc.i5.i:                                     ; preds = %for.body33.i, %for.inc.i5.i
  %i.0.i3.i760 = phi i32 [ 0, %for.body33.i ], [ %inc.i12.i, %for.inc.i5.i ]
  %r.0.i2.i759 = phi i64 [ 0, %for.body33.i ], [ %or.i11.i, %for.inc.i5.i ]
  %arrayidx.i6.i = getelementptr inbounds nuw i8, ptr %add.ptr35.i, i32 %i.0.i3.i760
  %93 = load i8, ptr %arrayidx.i6.i, align 1
  %conv.i7.i = zext i8 %93 to i64
  %mul.i8.i = shl nuw nsw i32 %i.0.i3.i760, 3
  %sh_prom.i9.i = zext nneg i32 %mul.i8.i to i64
  %shl.i10.i = shl nuw i64 %conv.i7.i, %sh_prom.i9.i
  %or.i11.i = or i64 %r.0.i2.i759, %shl.i10.i
  %inc.i12.i = add nuw nsw i32 %i.0.i3.i760, 1
  %exitcond.i4.i.not = icmp eq i32 %inc.i12.i, 8
  br i1 %exitcond.i4.i.not, label %load64.exit13.i, label %for.inc.i5.i, !llvm.loop !68

load64.exit13.i:                                  ; preds = %for.inc.i5.i
  %r.0.i2.i.lcssa = phi i64 [ %or.i11.i, %for.inc.i5.i ]
  %arrayidx37.i = getelementptr inbounds nuw i64, ptr %0, i32 %i.4.i761
  %94 = load i64, ptr %arrayidx37.i, align 8
  %xor38.i = xor i64 %94, %r.0.i2.i.lcssa
  store i64 %xor38.i, ptr %arrayidx37.i, align 8
  %inc40.i = add nuw nsw i32 %i.4.i761, 1
  %exitcond7.i.not = icmp eq i32 %inc40.i, 17
  br i1 %exitcond7.i.not, label %keccak_absorb.exit, label %for.body33.i, !llvm.loop !69

keccak_absorb.exit:                               ; preds = %load64.exit13.i
  call void @llvm.lifetime.end.p0(i64 200, ptr nonnull %t.i)
  %95 = load ptr, ptr %s, align 4
  %cmp.not.i790 = icmp eq i32 %div, 0
  br i1 %cmp.not.i790, label %keccak_squeezeblocks.exit, label %while.body.i.lr.ph

while.body.i.lr.ph:                               ; preds = %keccak_absorb.exit
  br label %while.body.i

while.body.i:                                     ; preds = %while.body.i.lr.ph, %for.end.i
  %h.addr.0.i792 = phi ptr [ %output, %while.body.i.lr.ph ], [ %add.ptr2.i, %for.end.i ]
  %nblocks.addr.0.i791 = phi i32 [ %div, %while.body.i.lr.ph ], [ %dec.i, %for.end.i ]
  %96 = load i64, ptr %95, align 8
  %arrayidx1.i388 = getelementptr inbounds nuw i8, ptr %95, i32 8
  %97 = load i64, ptr %arrayidx1.i388, align 8
  %arrayidx2.i389 = getelementptr inbounds nuw i8, ptr %95, i32 16
  %98 = load i64, ptr %arrayidx2.i389, align 8
  %arrayidx3.i390 = getelementptr inbounds nuw i8, ptr %95, i32 24
  %99 = load i64, ptr %arrayidx3.i390, align 8
  %arrayidx4.i391 = getelementptr inbounds nuw i8, ptr %95, i32 32
  %100 = load i64, ptr %arrayidx4.i391, align 8
  %arrayidx5.i392 = getelementptr inbounds nuw i8, ptr %95, i32 40
  %101 = load i64, ptr %arrayidx5.i392, align 8
  %arrayidx6.i393 = getelementptr inbounds nuw i8, ptr %95, i32 48
  %102 = load i64, ptr %arrayidx6.i393, align 8
  %arrayidx7.i394 = getelementptr inbounds nuw i8, ptr %95, i32 56
  %103 = load i64, ptr %arrayidx7.i394, align 8
  %arrayidx8.i395 = getelementptr inbounds nuw i8, ptr %95, i32 64
  %104 = load i64, ptr %arrayidx8.i395, align 8
  %arrayidx9.i396 = getelementptr inbounds nuw i8, ptr %95, i32 72
  %105 = load i64, ptr %arrayidx9.i396, align 8
  %arrayidx10.i397 = getelementptr inbounds nuw i8, ptr %95, i32 80
  %106 = load i64, ptr %arrayidx10.i397, align 8
  %arrayidx11.i398 = getelementptr inbounds nuw i8, ptr %95, i32 88
  %107 = load i64, ptr %arrayidx11.i398, align 8
  %arrayidx12.i399 = getelementptr inbounds nuw i8, ptr %95, i32 96
  %108 = load i64, ptr %arrayidx12.i399, align 8
  %arrayidx13.i400 = getelementptr inbounds nuw i8, ptr %95, i32 104
  %109 = load i64, ptr %arrayidx13.i400, align 8
  %arrayidx14.i401 = getelementptr inbounds nuw i8, ptr %95, i32 112
  %110 = load i64, ptr %arrayidx14.i401, align 8
  %arrayidx15.i402 = getelementptr inbounds nuw i8, ptr %95, i32 120
  %111 = load i64, ptr %arrayidx15.i402, align 8
  %arrayidx16.i403 = getelementptr inbounds nuw i8, ptr %95, i32 128
  %112 = load i64, ptr %arrayidx16.i403, align 8
  %arrayidx17.i404 = getelementptr inbounds nuw i8, ptr %95, i32 136
  %113 = load i64, ptr %arrayidx17.i404, align 8
  %arrayidx18.i405 = getelementptr inbounds nuw i8, ptr %95, i32 144
  %114 = load i64, ptr %arrayidx18.i405, align 8
  %arrayidx19.i406 = getelementptr inbounds nuw i8, ptr %95, i32 152
  %115 = load i64, ptr %arrayidx19.i406, align 8
  %arrayidx20.i407 = getelementptr inbounds nuw i8, ptr %95, i32 160
  %116 = load i64, ptr %arrayidx20.i407, align 8
  %arrayidx21.i408 = getelementptr inbounds nuw i8, ptr %95, i32 168
  %117 = load i64, ptr %arrayidx21.i408, align 8
  %arrayidx22.i409 = getelementptr inbounds nuw i8, ptr %95, i32 176
  %118 = load i64, ptr %arrayidx22.i409, align 8
  %arrayidx23.i410 = getelementptr inbounds nuw i8, ptr %95, i32 184
  %119 = load i64, ptr %arrayidx23.i410, align 8
  %arrayidx24.i411 = getelementptr inbounds nuw i8, ptr %95, i32 192
  %120 = load i64, ptr %arrayidx24.i411, align 8
  br label %for.inc.i465

for.inc.i465:                                     ; preds = %while.body.i, %for.inc.i465
  %Asu.0.i438787 = phi i64 [ %120, %while.body.i ], [ %xor447.i620, %for.inc.i465 ]
  %round.0.i437786 = phi i32 [ 0, %while.body.i ], [ %add448.i719, %for.inc.i465 ]
  %Aba.0.i436785 = phi i64 [ %96, %while.body.i ], [ %xor295.i718, %for.inc.i465 ]
  %Abe.0.i435784 = phi i64 [ %97, %while.body.i ], [ %xor298.i713, %for.inc.i465 ]
  %Abi.0.i434783 = phi i64 [ %98, %while.body.i ], [ %xor301.i710, %for.inc.i465 ]
  %Abo.0.i433782 = phi i64 [ %99, %while.body.i ], [ %xor304.i706, %for.inc.i465 ]
  %Abu.0.i432781 = phi i64 [ %100, %while.body.i ], [ %xor307.i702, %for.inc.i465 ]
  %Aga.0.i431780 = phi i64 [ %101, %while.body.i ], [ %xor330.i696, %for.inc.i465 ]
  %Age.0.i430779 = phi i64 [ %102, %while.body.i ], [ %xor333.i693, %for.inc.i465 ]
  %Agi.0.i429778 = phi i64 [ %103, %while.body.i ], [ %xor336.i690, %for.inc.i465 ]
  %Ago.0.i428777 = phi i64 [ %104, %while.body.i ], [ %xor339.i686, %for.inc.i465 ]
  %Agu.0.i427776 = phi i64 [ %105, %while.body.i ], [ %xor342.i682, %for.inc.i465 ]
  %Aka.0.i426775 = phi i64 [ %106, %while.body.i ], [ %xor365.i676, %for.inc.i465 ]
  %Ake.0.i425774 = phi i64 [ %107, %while.body.i ], [ %xor368.i673, %for.inc.i465 ]
  %Aki.0.i424773 = phi i64 [ %108, %while.body.i ], [ %xor371.i670, %for.inc.i465 ]
  %Ako.0.i423772 = phi i64 [ %109, %while.body.i ], [ %xor374.i666, %for.inc.i465 ]
  %Aku.0.i422771 = phi i64 [ %110, %while.body.i ], [ %xor377.i662, %for.inc.i465 ]
  %Ama.0.i421770 = phi i64 [ %111, %while.body.i ], [ %xor400.i656, %for.inc.i465 ]
  %Ame.0.i420769 = phi i64 [ %112, %while.body.i ], [ %xor403.i653, %for.inc.i465 ]
  %Ami.0.i419768 = phi i64 [ %113, %while.body.i ], [ %xor406.i650, %for.inc.i465 ]
  %Amo.0.i418767 = phi i64 [ %114, %while.body.i ], [ %xor409.i646, %for.inc.i465 ]
  %Amu.0.i417766 = phi i64 [ %115, %while.body.i ], [ %xor412.i642, %for.inc.i465 ]
  %Asa.0.i416765 = phi i64 [ %116, %while.body.i ], [ %xor435.i636, %for.inc.i465 ]
  %Ase.0.i415764 = phi i64 [ %117, %while.body.i ], [ %xor438.i633, %for.inc.i465 ]
  %Asi.0.i414763 = phi i64 [ %118, %while.body.i ], [ %xor441.i630, %for.inc.i465 ]
  %Aso.0.i413762 = phi i64 [ %119, %while.body.i ], [ %xor444.i625, %for.inc.i465 ]
  %xor32.i466 = xor i64 %Abi.0.i434783, %Agi.0.i429778
  %xor33.i467 = xor i64 %xor32.i466, %Aki.0.i424773
  %xor34.i468 = xor i64 %xor33.i467, %Ami.0.i419768
  %xor35.i469 = xor i64 %xor34.i468, %Asi.0.i414763
  %xor40.i470 = xor i64 %Abu.0.i432781, %Agu.0.i427776
  %xor41.i471 = xor i64 %xor40.i470, %Aku.0.i422771
  %xor42.i472 = xor i64 %xor41.i471, %Amu.0.i417766
  %xor43.i473 = xor i64 %xor42.i472, %Asu.0.i438787
  %121 = call i64 @llvm.fshl.i64(i64 %xor43.i473, i64 %xor43.i473, i64 1)
  %xor57.i474 = xor i64 %xor35.i469, %121
  %xor203.i475 = xor i64 %Ago.0.i428777, %xor57.i474
  %122 = call i64 @llvm.fshl.i64(i64 %xor203.i475, i64 %xor203.i475, i64 55)
  %xor28.i476 = xor i64 %Abe.0.i435784, %Age.0.i430779
  %xor29.i477 = xor i64 %xor28.i476, %Ake.0.i425774
  %xor30.i478 = xor i64 %xor29.i477, %Ame.0.i420769
  %xor31.i479 = xor i64 %xor30.i478, %Ase.0.i415764
  %123 = call i64 @llvm.fshl.i64(i64 %xor31.i479, i64 %xor31.i479, i64 1)
  %xor45.i480 = xor i64 %xor43.i473, %123
  %xor211.i481 = xor i64 %Ama.0.i421770, %xor45.i480
  %124 = call i64 @llvm.fshl.i64(i64 %xor211.i481, i64 %xor211.i481, i64 41)
  %xor36.i482 = xor i64 %Abo.0.i433782, %Ago.0.i428777
  %xor37.i483 = xor i64 %xor36.i482, %Ako.0.i423772
  %xor38.i484 = xor i64 %xor37.i483, %Amo.0.i418767
  %xor39.i485 = xor i64 %xor38.i484, %Aso.0.i413762
  %xor.i486 = xor i64 %Aba.0.i436785, %Aga.0.i431780
  %xor25.i487 = xor i64 %xor.i486, %Aka.0.i426775
  %xor26.i488 = xor i64 %xor25.i487, %Ama.0.i421770
  %xor27.i489 = xor i64 %xor26.i488, %Asa.0.i416765
  %125 = call i64 @llvm.fshl.i64(i64 %xor27.i489, i64 %xor27.i489, i64 1)
  %xor61.i490 = xor i64 %xor39.i485, %125
  %xor207.i491 = xor i64 %Aku.0.i422771, %xor61.i490
  %126 = call i64 @llvm.fshl.i64(i64 %xor207.i491, i64 %xor207.i491, i64 39)
  %not222.i492 = xor i64 %126, -1
  %and223.i493 = and i64 %124, %not222.i492
  %xor224.i494 = xor i64 %122, %and223.i493
  %127 = call i64 @llvm.fshl.i64(i64 %xor39.i485, i64 %xor39.i485, i64 1)
  %xor53.i495 = xor i64 %xor31.i479, %127
  %xor67.i496 = xor i64 %Aki.0.i424773, %xor53.i495
  %128 = call i64 @llvm.fshl.i64(i64 %xor67.i496, i64 %xor67.i496, i64 43)
  %129 = call i64 @llvm.fshl.i64(i64 %xor35.i469, i64 %xor35.i469, i64 1)
  %xor49.i497 = xor i64 %xor27.i489, %129
  %xor63.i498 = xor i64 %Age.0.i430779, %xor49.i497
  %130 = call i64 @llvm.fshl.i64(i64 %xor63.i498, i64 %xor63.i498, i64 44)
  %not.i499 = xor i64 %130, -1
  %and.i500 = and i64 %128, %not.i499
  %arrayidx80.i501 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %round.0.i437786
  %131 = load i64, ptr %arrayidx80.i501, align 8
  %132 = xor i64 %and.i500, %131
  %xor62.i502 = xor i64 %Aba.0.i436785, %xor45.i480
  %xor81.i503 = xor i64 %132, %xor62.i502
  %xor94.i504 = xor i64 %Abo.0.i433782, %xor57.i474
  %133 = call i64 @llvm.fshl.i64(i64 %xor94.i504, i64 %xor94.i504, i64 28)
  %xor102.i505 = xor i64 %Aka.0.i426775, %xor45.i480
  %134 = call i64 @llvm.fshl.i64(i64 %xor102.i505, i64 %xor102.i505, i64 3)
  %xor98.i506 = xor i64 %Agu.0.i427776, %xor61.i490
  %135 = call i64 @llvm.fshl.i64(i64 %xor98.i506, i64 %xor98.i506, i64 20)
  %not114.i507 = xor i64 %135, -1
  %and115.i508 = and i64 %134, %not114.i507
  %xor116.i509 = xor i64 %133, %and115.i508
  %xor234.i510 = xor i64 %xor81.i503, %xor116.i509
  %xor129.i511 = xor i64 %Abe.0.i435784, %xor49.i497
  %136 = call i64 @llvm.fshl.i64(i64 %xor129.i511, i64 %xor129.i511, i64 1)
  %xor137.i512 = xor i64 %Ako.0.i423772, %xor57.i474
  %137 = call i64 @llvm.fshl.i64(i64 %xor137.i512, i64 %xor137.i512, i64 25)
  %xor133.i513 = xor i64 %Agi.0.i429778, %xor53.i495
  %138 = call i64 @llvm.fshl.i64(i64 %xor133.i513, i64 %xor133.i513, i64 6)
  %not149.i514 = xor i64 %138, -1
  %and150.i515 = and i64 %137, %not149.i514
  %xor151.i516 = xor i64 %136, %and150.i515
  %xor235.i517 = xor i64 %xor234.i510, %xor151.i516
  %xor164.i518 = xor i64 %Abu.0.i432781, %xor61.i490
  %139 = call i64 @llvm.fshl.i64(i64 %xor164.i518, i64 %xor164.i518, i64 27)
  %xor172.i519 = xor i64 %Ake.0.i425774, %xor49.i497
  %140 = call i64 @llvm.fshl.i64(i64 %xor172.i519, i64 %xor172.i519, i64 10)
  %xor168.i520 = xor i64 %Aga.0.i431780, %xor45.i480
  %141 = call i64 @llvm.fshl.i64(i64 %xor168.i520, i64 %xor168.i520, i64 36)
  %not184.i521 = xor i64 %141, -1
  %and185.i522 = and i64 %140, %not184.i521
  %xor186.i523 = xor i64 %139, %and185.i522
  %xor236.i524 = xor i64 %xor235.i517, %xor186.i523
  %xor199.i525 = xor i64 %Abi.0.i434783, %xor53.i495
  %142 = call i64 @llvm.fshl.i64(i64 %xor199.i525, i64 %xor199.i525, i64 62)
  %not219.i526 = xor i64 %122, -1
  %and220.i527 = and i64 %126, %not219.i526
  %xor221.i528 = xor i64 %142, %and220.i527
  %xor237.i529 = xor i64 %xor236.i524, %xor221.i528
  %xor75.i530 = xor i64 %Asu.0.i438787, %xor61.i490
  %143 = call i64 @llvm.fshl.i64(i64 %xor75.i530, i64 %xor75.i530, i64 14)
  %xor71.i531 = xor i64 %Amo.0.i418767, %xor57.i474
  %144 = call i64 @llvm.fshl.i64(i64 %xor71.i531, i64 %xor71.i531, i64 21)
  %not85.i532 = xor i64 %144, -1
  %and86.i533 = and i64 %143, %not85.i532
  %xor87.i534 = xor i64 %128, %and86.i533
  %xor110.i535 = xor i64 %Asi.0.i414763, %xor53.i495
  %145 = call i64 @llvm.fshl.i64(i64 %xor110.i535, i64 %xor110.i535, i64 61)
  %xor106.i536 = xor i64 %Ame.0.i420769, %xor49.i497
  %146 = call i64 @llvm.fshl.i64(i64 %xor106.i536, i64 %xor106.i536, i64 45)
  %not120.i537 = xor i64 %146, -1
  %and121.i538 = and i64 %145, %not120.i537
  %xor122.i539 = xor i64 %134, %and121.i538
  %xor242.i540 = xor i64 %xor87.i534, %xor122.i539
  %xor145.i541 = xor i64 %Asa.0.i416765, %xor45.i480
  %147 = call i64 @llvm.fshl.i64(i64 %xor145.i541, i64 %xor145.i541, i64 18)
  %xor141.i542 = xor i64 %Amu.0.i417766, %xor61.i490
  %148 = call i64 @llvm.fshl.i64(i64 %xor141.i542, i64 %xor141.i542, i64 8)
  %not155.i543 = xor i64 %148, -1
  %and156.i544 = and i64 %147, %not155.i543
  %xor157.i545 = xor i64 %137, %and156.i544
  %xor243.i546 = xor i64 %xor242.i540, %xor157.i545
  %xor180.i547 = xor i64 %Aso.0.i413762, %xor57.i474
  %149 = call i64 @llvm.fshl.i64(i64 %xor180.i547, i64 %xor180.i547, i64 56)
  %xor176.i548 = xor i64 %Ami.0.i419768, %xor53.i495
  %150 = call i64 @llvm.fshl.i64(i64 %xor176.i548, i64 %xor176.i548, i64 15)
  %not190.i549 = xor i64 %150, -1
  %and191.i550 = and i64 %149, %not190.i549
  %xor192.i551 = xor i64 %140, %and191.i550
  %xor244.i552 = xor i64 %xor243.i546, %xor192.i551
  %xor215.i553 = xor i64 %Ase.0.i415764, %xor49.i497
  %151 = call i64 @llvm.fshl.i64(i64 %xor215.i553, i64 %xor215.i553, i64 2)
  %not225.i554 = xor i64 %124, -1
  %and226.i555 = and i64 %151, %not225.i554
  %xor227.i556 = xor i64 %126, %and226.i555
  %xor245.i557 = xor i64 %xor244.i552, %xor227.i556
  %152 = call i64 @llvm.fshl.i64(i64 %xor245.i557, i64 %xor245.i557, i64 1)
  %xor261.i558 = xor i64 %xor237.i529, %152
  %xor429.i559 = xor i64 %xor224.i494, %xor261.i558
  %153 = call i64 @llvm.fshl.i64(i64 %xor429.i559, i64 %xor429.i559, i64 2)
  %not123.i560 = xor i64 %145, -1
  %and124.i561 = and i64 %133, %not123.i560
  %xor125.i562 = xor i64 %146, %and124.i561
  %not91.i563 = xor i64 %xor62.i502, -1
  %and92.i564 = and i64 %130, %not91.i563
  %xor93.i565 = xor i64 %143, %and92.i564
  %not126.i566 = xor i64 %133, -1
  %and127.i567 = and i64 %135, %not126.i566
  %xor128.i568 = xor i64 %145, %and127.i567
  %xor250.i569 = xor i64 %xor93.i565, %xor128.i568
  %not161.i570 = xor i64 %136, -1
  %and162.i571 = and i64 %138, %not161.i570
  %xor163.i572 = xor i64 %147, %and162.i571
  %xor251.i573 = xor i64 %xor250.i569, %xor163.i572
  %not196.i574 = xor i64 %139, -1
  %and197.i575 = and i64 %141, %not196.i574
  %xor198.i576 = xor i64 %149, %and197.i575
  %xor252.i577 = xor i64 %xor251.i573, %xor198.i576
  %not231.i578 = xor i64 %142, -1
  %and232.i579 = and i64 %122, %not231.i578
  %xor233.i580 = xor i64 %151, %and232.i579
  %xor253.i581 = xor i64 %xor252.i577, %xor233.i580
  %154 = call i64 @llvm.fshl.i64(i64 %xor253.i581, i64 %xor253.i581, i64 1)
  %xor269.i582 = xor i64 %xor245.i557, %154
  %xor417.i583 = xor i64 %xor125.i562, %xor269.i582
  %155 = call i64 @llvm.fshl.i64(i64 %xor417.i583, i64 %xor417.i583, i64 55)
  %not82.i584 = xor i64 %128, -1
  %and83.i585 = and i64 %144, %not82.i584
  %xor84.i586 = xor i64 %130, %and83.i585
  %not117.i587 = xor i64 %134, -1
  %and118.i588 = and i64 %146, %not117.i587
  %xor119.i589 = xor i64 %135, %and118.i588
  %xor238.i590 = xor i64 %xor84.i586, %xor119.i589
  %not152.i591 = xor i64 %137, -1
  %and153.i592 = and i64 %148, %not152.i591
  %xor154.i593 = xor i64 %138, %and153.i592
  %xor239.i594 = xor i64 %xor238.i590, %xor154.i593
  %not187.i595 = xor i64 %140, -1
  %and188.i596 = and i64 %150, %not187.i595
  %xor189.i597 = xor i64 %141, %and188.i596
  %xor240.i598 = xor i64 %xor239.i594, %xor189.i597
  %xor241.i599 = xor i64 %xor240.i598, %xor224.i494
  %not88.i600 = xor i64 %143, -1
  %and89.i601 = and i64 %xor62.i502, %not88.i600
  %xor90.i602 = xor i64 %144, %and89.i601
  %xor246.i603 = xor i64 %xor90.i602, %xor125.i562
  %not158.i604 = xor i64 %147, -1
  %and159.i605 = and i64 %136, %not158.i604
  %xor160.i606 = xor i64 %148, %and159.i605
  %xor247.i607 = xor i64 %xor246.i603, %xor160.i606
  %not193.i608 = xor i64 %149, -1
  %and194.i609 = and i64 %139, %not193.i608
  %xor195.i610 = xor i64 %150, %and194.i609
  %xor248.i611 = xor i64 %xor247.i607, %xor195.i610
  %not228.i612 = xor i64 %151, -1
  %and229.i613 = and i64 %142, %not228.i612
  %xor230.i614 = xor i64 %124, %and229.i613
  %xor249.i615 = xor i64 %xor248.i611, %xor230.i614
  %156 = call i64 @llvm.fshl.i64(i64 %xor249.i615, i64 %xor249.i615, i64 1)
  %xor265.i616 = xor i64 %xor241.i599, %156
  %xor413.i617 = xor i64 %xor87.i534, %xor265.i616
  %157 = call i64 @llvm.fshl.i64(i64 %xor413.i617, i64 %xor413.i617, i64 62)
  %not445.i618 = xor i64 %157, -1
  %and446.i619 = and i64 %155, %not445.i618
  %xor447.i620 = xor i64 %153, %and446.i619
  %158 = call i64 @llvm.fshl.i64(i64 %xor241.i599, i64 %xor241.i599, i64 1)
  %xor257.i621 = xor i64 %xor253.i581, %158
  %xor425.i622 = xor i64 %xor186.i523, %xor257.i621
  %159 = call i64 @llvm.fshl.i64(i64 %xor425.i622, i64 %xor425.i622, i64 41)
  %not442.i623 = xor i64 %153, -1
  %and443.i624 = and i64 %157, %not442.i623
  %xor444.i625 = xor i64 %159, %and443.i624
  %160 = call i64 @llvm.fshl.i64(i64 %xor237.i529, i64 %xor237.i529, i64 1)
  %xor273.i626 = xor i64 %xor249.i615, %160
  %xor421.i627 = xor i64 %xor163.i572, %xor273.i626
  %161 = call i64 @llvm.fshl.i64(i64 %xor421.i627, i64 %xor421.i627, i64 39)
  %not439.i628 = xor i64 %159, -1
  %and440.i629 = and i64 %153, %not439.i628
  %xor441.i630 = xor i64 %161, %and440.i629
  %not436.i631 = xor i64 %161, -1
  %and437.i632 = and i64 %159, %not436.i631
  %xor438.i633 = xor i64 %155, %and437.i632
  %not433.i634 = xor i64 %155, -1
  %and434.i635 = and i64 %161, %not433.i634
  %xor435.i636 = xor i64 %157, %and434.i635
  %xor394.i637 = xor i64 %xor230.i614, %xor269.i582
  %162 = call i64 @llvm.fshl.i64(i64 %xor394.i637, i64 %xor394.i637, i64 56)
  %xor382.i638 = xor i64 %xor116.i509, %xor257.i621
  %163 = call i64 @llvm.fshl.i64(i64 %xor382.i638, i64 %xor382.i638, i64 36)
  %xor378.i639 = xor i64 %xor93.i565, %xor273.i626
  %164 = call i64 @llvm.fshl.i64(i64 %xor378.i639, i64 %xor378.i639, i64 27)
  %not410.i640 = xor i64 %164, -1
  %and411.i641 = and i64 %163, %not410.i640
  %xor412.i642 = xor i64 %162, %and411.i641
  %xor390.i643 = xor i64 %xor192.i551, %xor265.i616
  %165 = call i64 @llvm.fshl.i64(i64 %xor390.i643, i64 %xor390.i643, i64 15)
  %not407.i644 = xor i64 %162, -1
  %and408.i645 = and i64 %164, %not407.i644
  %xor409.i646 = xor i64 %165, %and408.i645
  %xor386.i647 = xor i64 %xor154.i593, %xor261.i558
  %166 = call i64 @llvm.fshl.i64(i64 %xor386.i647, i64 %xor386.i647, i64 10)
  %not404.i648 = xor i64 %165, -1
  %and405.i649 = and i64 %162, %not404.i648
  %xor406.i650 = xor i64 %166, %and405.i649
  %not401.i651 = xor i64 %166, -1
  %and402.i652 = and i64 %165, %not401.i651
  %xor403.i653 = xor i64 %163, %and402.i652
  %not398.i654 = xor i64 %163, -1
  %and399.i655 = and i64 %166, %not398.i654
  %xor400.i656 = xor i64 %164, %and399.i655
  %xor359.i657 = xor i64 %xor221.i528, %xor257.i621
  %167 = call i64 @llvm.fshl.i64(i64 %xor359.i657, i64 %xor359.i657, i64 18)
  %xor347.i658 = xor i64 %xor122.i539, %xor265.i616
  %168 = call i64 @llvm.fshl.i64(i64 %xor347.i658, i64 %xor347.i658, i64 6)
  %xor343.i659 = xor i64 %xor84.i586, %xor261.i558
  %169 = call i64 @llvm.fshl.i64(i64 %xor343.i659, i64 %xor343.i659, i64 1)
  %not375.i660 = xor i64 %169, -1
  %and376.i661 = and i64 %168, %not375.i660
  %xor377.i662 = xor i64 %167, %and376.i661
  %xor355.i663 = xor i64 %xor198.i576, %xor273.i626
  %170 = call i64 @llvm.fshl.i64(i64 %xor355.i663, i64 %xor355.i663, i64 8)
  %not372.i664 = xor i64 %167, -1
  %and373.i665 = and i64 %169, %not372.i664
  %xor374.i666 = xor i64 %170, %and373.i665
  %xor351.i667 = xor i64 %xor160.i606, %xor269.i582
  %171 = call i64 @llvm.fshl.i64(i64 %xor351.i667, i64 %xor351.i667, i64 25)
  %not369.i668 = xor i64 %170, -1
  %and370.i669 = and i64 %167, %not369.i668
  %xor371.i670 = xor i64 %171, %and370.i669
  %not366.i671 = xor i64 %171, -1
  %and367.i672 = and i64 %170, %not366.i671
  %xor368.i673 = xor i64 %168, %and367.i672
  %not363.i674 = xor i64 %168, -1
  %and364.i675 = and i64 %171, %not363.i674
  %xor365.i676 = xor i64 %169, %and364.i675
  %xor324.i677 = xor i64 %xor227.i556, %xor265.i616
  %172 = call i64 @llvm.fshl.i64(i64 %xor324.i677, i64 %xor324.i677, i64 61)
  %xor312.i678 = xor i64 %xor128.i568, %xor273.i626
  %173 = call i64 @llvm.fshl.i64(i64 %xor312.i678, i64 %xor312.i678, i64 20)
  %xor308.i679 = xor i64 %xor90.i602, %xor269.i582
  %174 = call i64 @llvm.fshl.i64(i64 %xor308.i679, i64 %xor308.i679, i64 28)
  %not340.i680 = xor i64 %174, -1
  %and341.i681 = and i64 %173, %not340.i680
  %xor342.i682 = xor i64 %172, %and341.i681
  %xor320.i683 = xor i64 %xor189.i597, %xor261.i558
  %175 = call i64 @llvm.fshl.i64(i64 %xor320.i683, i64 %xor320.i683, i64 45)
  %not337.i684 = xor i64 %172, -1
  %and338.i685 = and i64 %174, %not337.i684
  %xor339.i686 = xor i64 %175, %and338.i685
  %xor316.i687 = xor i64 %xor151.i516, %xor257.i621
  %176 = call i64 @llvm.fshl.i64(i64 %xor316.i687, i64 %xor316.i687, i64 3)
  %not334.i688 = xor i64 %175, -1
  %and335.i689 = and i64 %172, %not334.i688
  %xor336.i690 = xor i64 %176, %and335.i689
  %not331.i691 = xor i64 %176, -1
  %and332.i692 = and i64 %175, %not331.i691
  %xor333.i693 = xor i64 %173, %and332.i692
  %not328.i694 = xor i64 %173, -1
  %and329.i695 = and i64 %176, %not328.i694
  %xor330.i696 = xor i64 %174, %and329.i695
  %xor287.i697 = xor i64 %xor233.i580, %xor273.i626
  %177 = call i64 @llvm.fshl.i64(i64 %xor287.i697, i64 %xor287.i697, i64 14)
  %xor275.i698 = xor i64 %xor119.i589, %xor261.i558
  %178 = call i64 @llvm.fshl.i64(i64 %xor275.i698, i64 %xor275.i698, i64 44)
  %xor274.i699 = xor i64 %xor81.i503, %xor257.i621
  %not305.i700 = xor i64 %xor274.i699, -1
  %and306.i701 = and i64 %178, %not305.i700
  %xor307.i702 = xor i64 %177, %and306.i701
  %xor283.i703 = xor i64 %xor195.i610, %xor269.i582
  %179 = call i64 @llvm.fshl.i64(i64 %xor283.i703, i64 %xor283.i703, i64 21)
  %not302.i704 = xor i64 %177, -1
  %and303.i705 = and i64 %xor274.i699, %not302.i704
  %xor304.i706 = xor i64 %179, %and303.i705
  %xor279.i707 = xor i64 %xor157.i545, %xor265.i616
  %180 = call i64 @llvm.fshl.i64(i64 %xor279.i707, i64 %xor279.i707, i64 43)
  %not299.i708 = xor i64 %179, -1
  %and300.i709 = and i64 %177, %not299.i708
  %xor301.i710 = xor i64 %180, %and300.i709
  %not296.i711 = xor i64 %180, -1
  %and297.i712 = and i64 %179, %not296.i711
  %xor298.i713 = xor i64 %178, %and297.i712
  %add.i714 = or disjoint i32 %round.0.i437786, 1
  %arrayidx294.i715 = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %add.i714
  %181 = load i64, ptr %arrayidx294.i715, align 8
  %not291.i716 = xor i64 %178, -1
  %and292.i717 = and i64 %180, %not291.i716
  %182 = xor i64 %and292.i717, %181
  %xor295.i718 = xor i64 %182, %xor274.i699
  %add448.i719 = add nuw nsw i32 %round.0.i437786, 2
  %cmp.i439 = icmp samesign ult i32 %add448.i719, 24
  br i1 %cmp.i439, label %for.inc.i465, label %KeccakF1600_StatePermute.exit720, !llvm.loop !70

KeccakF1600_StatePermute.exit720:                 ; preds = %for.inc.i465
  %Aso.0.i413.lcssa = phi i64 [ %xor444.i625, %for.inc.i465 ]
  %Asi.0.i414.lcssa = phi i64 [ %xor441.i630, %for.inc.i465 ]
  %Ase.0.i415.lcssa = phi i64 [ %xor438.i633, %for.inc.i465 ]
  %Asa.0.i416.lcssa = phi i64 [ %xor435.i636, %for.inc.i465 ]
  %Amu.0.i417.lcssa = phi i64 [ %xor412.i642, %for.inc.i465 ]
  %Amo.0.i418.lcssa = phi i64 [ %xor409.i646, %for.inc.i465 ]
  %Ami.0.i419.lcssa = phi i64 [ %xor406.i650, %for.inc.i465 ]
  %Ame.0.i420.lcssa = phi i64 [ %xor403.i653, %for.inc.i465 ]
  %Ama.0.i421.lcssa = phi i64 [ %xor400.i656, %for.inc.i465 ]
  %Aku.0.i422.lcssa = phi i64 [ %xor377.i662, %for.inc.i465 ]
  %Ako.0.i423.lcssa = phi i64 [ %xor374.i666, %for.inc.i465 ]
  %Aki.0.i424.lcssa = phi i64 [ %xor371.i670, %for.inc.i465 ]
  %Ake.0.i425.lcssa = phi i64 [ %xor368.i673, %for.inc.i465 ]
  %Aka.0.i426.lcssa = phi i64 [ %xor365.i676, %for.inc.i465 ]
  %Agu.0.i427.lcssa = phi i64 [ %xor342.i682, %for.inc.i465 ]
  %Ago.0.i428.lcssa = phi i64 [ %xor339.i686, %for.inc.i465 ]
  %Agi.0.i429.lcssa = phi i64 [ %xor336.i690, %for.inc.i465 ]
  %Age.0.i430.lcssa = phi i64 [ %xor333.i693, %for.inc.i465 ]
  %Aga.0.i431.lcssa = phi i64 [ %xor330.i696, %for.inc.i465 ]
  %Abu.0.i432.lcssa = phi i64 [ %xor307.i702, %for.inc.i465 ]
  %Abo.0.i433.lcssa = phi i64 [ %xor304.i706, %for.inc.i465 ]
  %Abi.0.i434.lcssa = phi i64 [ %xor301.i710, %for.inc.i465 ]
  %Abe.0.i435.lcssa = phi i64 [ %xor298.i713, %for.inc.i465 ]
  %Aba.0.i436.lcssa = phi i64 [ %xor295.i718, %for.inc.i465 ]
  %Asu.0.i438.lcssa = phi i64 [ %xor447.i620, %for.inc.i465 ]
  store i64 %Aba.0.i436.lcssa, ptr %95, align 8
  %arrayidx450.i441 = getelementptr inbounds nuw i8, ptr %95, i32 8
  store i64 %Abe.0.i435.lcssa, ptr %arrayidx450.i441, align 8
  %arrayidx451.i442 = getelementptr inbounds nuw i8, ptr %95, i32 16
  store i64 %Abi.0.i434.lcssa, ptr %arrayidx451.i442, align 8
  %arrayidx452.i443 = getelementptr inbounds nuw i8, ptr %95, i32 24
  store i64 %Abo.0.i433.lcssa, ptr %arrayidx452.i443, align 8
  %arrayidx453.i444 = getelementptr inbounds nuw i8, ptr %95, i32 32
  store i64 %Abu.0.i432.lcssa, ptr %arrayidx453.i444, align 8
  %arrayidx454.i445 = getelementptr inbounds nuw i8, ptr %95, i32 40
  store i64 %Aga.0.i431.lcssa, ptr %arrayidx454.i445, align 8
  %arrayidx455.i446 = getelementptr inbounds nuw i8, ptr %95, i32 48
  store i64 %Age.0.i430.lcssa, ptr %arrayidx455.i446, align 8
  %arrayidx456.i447 = getelementptr inbounds nuw i8, ptr %95, i32 56
  store i64 %Agi.0.i429.lcssa, ptr %arrayidx456.i447, align 8
  %arrayidx457.i448 = getelementptr inbounds nuw i8, ptr %95, i32 64
  store i64 %Ago.0.i428.lcssa, ptr %arrayidx457.i448, align 8
  %arrayidx458.i449 = getelementptr inbounds nuw i8, ptr %95, i32 72
  store i64 %Agu.0.i427.lcssa, ptr %arrayidx458.i449, align 8
  %arrayidx459.i450 = getelementptr inbounds nuw i8, ptr %95, i32 80
  store i64 %Aka.0.i426.lcssa, ptr %arrayidx459.i450, align 8
  %arrayidx460.i451 = getelementptr inbounds nuw i8, ptr %95, i32 88
  store i64 %Ake.0.i425.lcssa, ptr %arrayidx460.i451, align 8
  %arrayidx461.i452 = getelementptr inbounds nuw i8, ptr %95, i32 96
  store i64 %Aki.0.i424.lcssa, ptr %arrayidx461.i452, align 8
  %arrayidx462.i453 = getelementptr inbounds nuw i8, ptr %95, i32 104
  store i64 %Ako.0.i423.lcssa, ptr %arrayidx462.i453, align 8
  %arrayidx463.i454 = getelementptr inbounds nuw i8, ptr %95, i32 112
  store i64 %Aku.0.i422.lcssa, ptr %arrayidx463.i454, align 8
  %arrayidx464.i455 = getelementptr inbounds nuw i8, ptr %95, i32 120
  store i64 %Ama.0.i421.lcssa, ptr %arrayidx464.i455, align 8
  %arrayidx465.i456 = getelementptr inbounds nuw i8, ptr %95, i32 128
  store i64 %Ame.0.i420.lcssa, ptr %arrayidx465.i456, align 8
  %arrayidx466.i457 = getelementptr inbounds nuw i8, ptr %95, i32 136
  store i64 %Ami.0.i419.lcssa, ptr %arrayidx466.i457, align 8
  %arrayidx467.i458 = getelementptr inbounds nuw i8, ptr %95, i32 144
  store i64 %Amo.0.i418.lcssa, ptr %arrayidx467.i458, align 8
  %arrayidx468.i459 = getelementptr inbounds nuw i8, ptr %95, i32 152
  store i64 %Amu.0.i417.lcssa, ptr %arrayidx468.i459, align 8
  %arrayidx469.i460 = getelementptr inbounds nuw i8, ptr %95, i32 160
  store i64 %Asa.0.i416.lcssa, ptr %arrayidx469.i460, align 8
  %arrayidx470.i461 = getelementptr inbounds nuw i8, ptr %95, i32 168
  store i64 %Ase.0.i415.lcssa, ptr %arrayidx470.i461, align 8
  %arrayidx471.i462 = getelementptr inbounds nuw i8, ptr %95, i32 176
  store i64 %Asi.0.i414.lcssa, ptr %arrayidx471.i462, align 8
  %arrayidx472.i463 = getelementptr inbounds nuw i8, ptr %95, i32 184
  store i64 %Aso.0.i413.lcssa, ptr %arrayidx472.i463, align 8
  %arrayidx473.i464 = getelementptr inbounds nuw i8, ptr %95, i32 192
  store i64 %Asu.0.i438.lcssa, ptr %arrayidx473.i464, align 8
  br label %for.body.i

for.body.i:                                       ; preds = %KeccakF1600_StatePermute.exit720, %store64.exit.i
  %i.0.i789 = phi i32 [ 0, %KeccakF1600_StatePermute.exit720 ], [ %inc.i, %store64.exit.i ]
  %mul.i = shl nuw nsw i32 %i.0.i789, 3
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %h.addr.0.i792, i32 %mul.i
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %95, i32 %i.0.i789
  %183 = load i64, ptr %arrayidx.i, align 8
  br label %for.body.i.i

for.body.i.i:                                     ; preds = %for.body.i, %for.body.i.i
  %i.0.i.i788 = phi i32 [ 0, %for.body.i ], [ %inc.i.i, %for.body.i.i ]
  %mul.i.i = shl nuw nsw i32 %i.0.i.i788, 3
  %sh_prom.i.i = zext nneg i32 %mul.i.i to i64
  %shr.i.i = lshr i64 %183, %sh_prom.i.i
  %conv.i.i = trunc i64 %shr.i.i to i8
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 %i.0.i.i788
  store i8 %conv.i.i, ptr %arrayidx.i.i, align 1
  %inc.i.i = add nuw nsw i32 %i.0.i.i788, 1
  %exitcond.i.i.not = icmp eq i32 %inc.i.i, 8
  br i1 %exitcond.i.i.not, label %store64.exit.i, label %for.body.i.i, !llvm.loop !71

store64.exit.i:                                   ; preds = %for.body.i.i
  %inc.i = add nuw nsw i32 %i.0.i789, 1
  %exitcond.i.not = icmp eq i32 %inc.i, 17
  br i1 %exitcond.i.not, label %for.end.i, label %for.body.i, !llvm.loop !72

for.end.i:                                        ; preds = %store64.exit.i
  %add.ptr2.i = getelementptr inbounds nuw i8, ptr %h.addr.0.i792, i32 136
  %dec.i = add nsw i32 %nblocks.addr.0.i791, -1
  %cmp.not.i = icmp eq i32 %dec.i, 0
  br i1 %cmp.not.i, label %while.cond.i.keccak_squeezeblocks.exit_crit_edge, label %while.body.i, !llvm.loop !73

while.cond.i.keccak_squeezeblocks.exit_crit_edge: ; preds = %for.end.i
  br label %keccak_squeezeblocks.exit

keccak_squeezeblocks.exit:                        ; preds = %while.cond.i.keccak_squeezeblocks.exit_crit_edge, %keccak_absorb.exit
  %mul = mul nuw i32 %div, 136
  %add.ptr = getelementptr inbounds nuw i8, ptr %output, i32 %mul
  %mul1.neg = mul i32 %div, -136
  %sub = add i32 %mul1.neg, %outlen
  %tobool.not = icmp eq i32 %sub, 0
  br i1 %tobool.not, label %if.end, label %if.then

if.then:                                          ; preds = %keccak_squeezeblocks.exit
  %184 = load ptr, ptr %s, align 4
  br label %while.body.i5

for.cond.preheader:                               ; preds = %for.end.i9
  br label %for.body

while.body.i5:                                    ; preds = %if.then
  %185 = load i64, ptr %184, align 8
  %arrayidx1.i = getelementptr inbounds nuw i8, ptr %184, i32 8
  %186 = load i64, ptr %arrayidx1.i, align 8
  %arrayidx2.i = getelementptr inbounds nuw i8, ptr %184, i32 16
  %187 = load i64, ptr %arrayidx2.i, align 8
  %arrayidx3.i = getelementptr inbounds nuw i8, ptr %184, i32 24
  %188 = load i64, ptr %arrayidx3.i, align 8
  %arrayidx4.i = getelementptr inbounds nuw i8, ptr %184, i32 32
  %189 = load i64, ptr %arrayidx4.i, align 8
  %arrayidx5.i46 = getelementptr inbounds nuw i8, ptr %184, i32 40
  %190 = load i64, ptr %arrayidx5.i46, align 8
  %arrayidx6.i = getelementptr inbounds nuw i8, ptr %184, i32 48
  %191 = load i64, ptr %arrayidx6.i, align 8
  %arrayidx7.i = getelementptr inbounds nuw i8, ptr %184, i32 56
  %192 = load i64, ptr %arrayidx7.i, align 8
  %arrayidx8.i = getelementptr inbounds nuw i8, ptr %184, i32 64
  %193 = load i64, ptr %arrayidx8.i, align 8
  %arrayidx9.i = getelementptr inbounds nuw i8, ptr %184, i32 72
  %194 = load i64, ptr %arrayidx9.i, align 8
  %arrayidx10.i = getelementptr inbounds nuw i8, ptr %184, i32 80
  %195 = load i64, ptr %arrayidx10.i, align 8
  %arrayidx11.i = getelementptr inbounds nuw i8, ptr %184, i32 88
  %196 = load i64, ptr %arrayidx11.i, align 8
  %arrayidx12.i = getelementptr inbounds nuw i8, ptr %184, i32 96
  %197 = load i64, ptr %arrayidx12.i, align 8
  %arrayidx13.i47 = getelementptr inbounds nuw i8, ptr %184, i32 104
  %198 = load i64, ptr %arrayidx13.i47, align 8
  %arrayidx14.i = getelementptr inbounds nuw i8, ptr %184, i32 112
  %199 = load i64, ptr %arrayidx14.i, align 8
  %arrayidx15.i = getelementptr inbounds nuw i8, ptr %184, i32 120
  %200 = load i64, ptr %arrayidx15.i, align 8
  %arrayidx16.i = getelementptr inbounds nuw i8, ptr %184, i32 128
  %201 = load i64, ptr %arrayidx16.i, align 8
  %arrayidx17.i = getelementptr inbounds nuw i8, ptr %184, i32 136
  %202 = load i64, ptr %arrayidx17.i, align 8
  %arrayidx18.i = getelementptr inbounds nuw i8, ptr %184, i32 144
  %203 = load i64, ptr %arrayidx18.i, align 8
  %arrayidx19.i = getelementptr inbounds nuw i8, ptr %184, i32 152
  %204 = load i64, ptr %arrayidx19.i, align 8
  %arrayidx20.i48 = getelementptr inbounds nuw i8, ptr %184, i32 160
  %205 = load i64, ptr %arrayidx20.i48, align 8
  %arrayidx21.i49 = getelementptr inbounds nuw i8, ptr %184, i32 168
  %206 = load i64, ptr %arrayidx21.i49, align 8
  %arrayidx22.i = getelementptr inbounds nuw i8, ptr %184, i32 176
  %207 = load i64, ptr %arrayidx22.i, align 8
  %arrayidx23.i = getelementptr inbounds nuw i8, ptr %184, i32 184
  %208 = load i64, ptr %arrayidx23.i, align 8
  %arrayidx24.i = getelementptr inbounds nuw i8, ptr %184, i32 192
  %209 = load i64, ptr %arrayidx24.i, align 8
  br label %for.inc.i

for.inc.i:                                        ; preds = %while.body.i5, %for.inc.i
  %Asu.0.i818 = phi i64 [ %209, %while.body.i5 ], [ %xor447.i, %for.inc.i ]
  %round.0.i817 = phi i32 [ 0, %while.body.i5 ], [ %add448.i, %for.inc.i ]
  %Aba.0.i816 = phi i64 [ %185, %while.body.i5 ], [ %xor295.i, %for.inc.i ]
  %Abe.0.i815 = phi i64 [ %186, %while.body.i5 ], [ %xor298.i, %for.inc.i ]
  %Abi.0.i814 = phi i64 [ %187, %while.body.i5 ], [ %xor301.i, %for.inc.i ]
  %Abo.0.i813 = phi i64 [ %188, %while.body.i5 ], [ %xor304.i, %for.inc.i ]
  %Abu.0.i812 = phi i64 [ %189, %while.body.i5 ], [ %xor307.i, %for.inc.i ]
  %Aga.0.i811 = phi i64 [ %190, %while.body.i5 ], [ %xor330.i, %for.inc.i ]
  %Age.0.i810 = phi i64 [ %191, %while.body.i5 ], [ %xor333.i, %for.inc.i ]
  %Agi.0.i809 = phi i64 [ %192, %while.body.i5 ], [ %xor336.i, %for.inc.i ]
  %Ago.0.i808 = phi i64 [ %193, %while.body.i5 ], [ %xor339.i, %for.inc.i ]
  %Agu.0.i807 = phi i64 [ %194, %while.body.i5 ], [ %xor342.i, %for.inc.i ]
  %Aka.0.i806 = phi i64 [ %195, %while.body.i5 ], [ %xor365.i, %for.inc.i ]
  %Ake.0.i805 = phi i64 [ %196, %while.body.i5 ], [ %xor368.i, %for.inc.i ]
  %Aki.0.i804 = phi i64 [ %197, %while.body.i5 ], [ %xor371.i, %for.inc.i ]
  %Ako.0.i803 = phi i64 [ %198, %while.body.i5 ], [ %xor374.i, %for.inc.i ]
  %Aku.0.i802 = phi i64 [ %199, %while.body.i5 ], [ %xor377.i, %for.inc.i ]
  %Ama.0.i801 = phi i64 [ %200, %while.body.i5 ], [ %xor400.i, %for.inc.i ]
  %Ame.0.i800 = phi i64 [ %201, %while.body.i5 ], [ %xor403.i, %for.inc.i ]
  %Ami.0.i799 = phi i64 [ %202, %while.body.i5 ], [ %xor406.i, %for.inc.i ]
  %Amo.0.i798 = phi i64 [ %203, %while.body.i5 ], [ %xor409.i, %for.inc.i ]
  %Amu.0.i797 = phi i64 [ %204, %while.body.i5 ], [ %xor412.i, %for.inc.i ]
  %Asa.0.i796 = phi i64 [ %205, %while.body.i5 ], [ %xor435.i, %for.inc.i ]
  %Ase.0.i795 = phi i64 [ %206, %while.body.i5 ], [ %xor438.i, %for.inc.i ]
  %Asi.0.i794 = phi i64 [ %207, %while.body.i5 ], [ %xor441.i, %for.inc.i ]
  %Aso.0.i793 = phi i64 [ %208, %while.body.i5 ], [ %xor444.i, %for.inc.i ]
  %xor32.i = xor i64 %Abi.0.i814, %Agi.0.i809
  %xor33.i = xor i64 %xor32.i, %Aki.0.i804
  %xor34.i = xor i64 %xor33.i, %Ami.0.i799
  %xor35.i = xor i64 %xor34.i, %Asi.0.i794
  %xor40.i = xor i64 %Abu.0.i812, %Agu.0.i807
  %xor41.i = xor i64 %xor40.i, %Aku.0.i802
  %xor42.i = xor i64 %xor41.i, %Amu.0.i797
  %xor43.i = xor i64 %xor42.i, %Asu.0.i818
  %210 = call i64 @llvm.fshl.i64(i64 %xor43.i, i64 %xor43.i, i64 1)
  %xor57.i = xor i64 %xor35.i, %210
  %xor203.i = xor i64 %Ago.0.i808, %xor57.i
  %211 = call i64 @llvm.fshl.i64(i64 %xor203.i, i64 %xor203.i, i64 55)
  %xor28.i = xor i64 %Abe.0.i815, %Age.0.i810
  %xor29.i = xor i64 %xor28.i, %Ake.0.i805
  %xor30.i = xor i64 %xor29.i, %Ame.0.i800
  %xor31.i = xor i64 %xor30.i, %Ase.0.i795
  %212 = call i64 @llvm.fshl.i64(i64 %xor31.i, i64 %xor31.i, i64 1)
  %xor45.i = xor i64 %xor43.i, %212
  %xor211.i = xor i64 %Ama.0.i801, %xor45.i
  %213 = call i64 @llvm.fshl.i64(i64 %xor211.i, i64 %xor211.i, i64 41)
  %xor36.i = xor i64 %Abo.0.i813, %Ago.0.i808
  %xor37.i = xor i64 %xor36.i, %Ako.0.i803
  %xor38.i53 = xor i64 %xor37.i, %Amo.0.i798
  %xor39.i = xor i64 %xor38.i53, %Aso.0.i793
  %xor.i54 = xor i64 %Aba.0.i816, %Aga.0.i811
  %xor25.i = xor i64 %xor.i54, %Aka.0.i806
  %xor26.i = xor i64 %xor25.i, %Ama.0.i801
  %xor27.i = xor i64 %xor26.i, %Asa.0.i796
  %214 = call i64 @llvm.fshl.i64(i64 %xor27.i, i64 %xor27.i, i64 1)
  %xor61.i = xor i64 %xor39.i, %214
  %xor207.i = xor i64 %Aku.0.i802, %xor61.i
  %215 = call i64 @llvm.fshl.i64(i64 %xor207.i, i64 %xor207.i, i64 39)
  %not222.i = xor i64 %215, -1
  %and223.i = and i64 %213, %not222.i
  %xor224.i = xor i64 %211, %and223.i
  %216 = call i64 @llvm.fshl.i64(i64 %xor39.i, i64 %xor39.i, i64 1)
  %xor53.i = xor i64 %xor31.i, %216
  %xor67.i = xor i64 %Aki.0.i804, %xor53.i
  %217 = call i64 @llvm.fshl.i64(i64 %xor67.i, i64 %xor67.i, i64 43)
  %218 = call i64 @llvm.fshl.i64(i64 %xor35.i, i64 %xor35.i, i64 1)
  %xor49.i = xor i64 %xor27.i, %218
  %xor63.i = xor i64 %Age.0.i810, %xor49.i
  %219 = call i64 @llvm.fshl.i64(i64 %xor63.i, i64 %xor63.i, i64 44)
  %not.i = xor i64 %219, -1
  %and.i = and i64 %217, %not.i
  %arrayidx80.i = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %round.0.i817
  %220 = load i64, ptr %arrayidx80.i, align 8
  %221 = xor i64 %and.i, %220
  %xor62.i = xor i64 %Aba.0.i816, %xor45.i
  %xor81.i = xor i64 %221, %xor62.i
  %xor94.i = xor i64 %Abo.0.i813, %xor57.i
  %222 = call i64 @llvm.fshl.i64(i64 %xor94.i, i64 %xor94.i, i64 28)
  %xor102.i = xor i64 %Aka.0.i806, %xor45.i
  %223 = call i64 @llvm.fshl.i64(i64 %xor102.i, i64 %xor102.i, i64 3)
  %xor98.i = xor i64 %Agu.0.i807, %xor61.i
  %224 = call i64 @llvm.fshl.i64(i64 %xor98.i, i64 %xor98.i, i64 20)
  %not114.i = xor i64 %224, -1
  %and115.i = and i64 %223, %not114.i
  %xor116.i = xor i64 %222, %and115.i
  %xor234.i = xor i64 %xor81.i, %xor116.i
  %xor129.i = xor i64 %Abe.0.i815, %xor49.i
  %225 = call i64 @llvm.fshl.i64(i64 %xor129.i, i64 %xor129.i, i64 1)
  %xor137.i = xor i64 %Ako.0.i803, %xor57.i
  %226 = call i64 @llvm.fshl.i64(i64 %xor137.i, i64 %xor137.i, i64 25)
  %xor133.i = xor i64 %Agi.0.i809, %xor53.i
  %227 = call i64 @llvm.fshl.i64(i64 %xor133.i, i64 %xor133.i, i64 6)
  %not149.i = xor i64 %227, -1
  %and150.i = and i64 %226, %not149.i
  %xor151.i = xor i64 %225, %and150.i
  %xor235.i = xor i64 %xor234.i, %xor151.i
  %xor164.i = xor i64 %Abu.0.i812, %xor61.i
  %228 = call i64 @llvm.fshl.i64(i64 %xor164.i, i64 %xor164.i, i64 27)
  %xor172.i = xor i64 %Ake.0.i805, %xor49.i
  %229 = call i64 @llvm.fshl.i64(i64 %xor172.i, i64 %xor172.i, i64 10)
  %xor168.i = xor i64 %Aga.0.i811, %xor45.i
  %230 = call i64 @llvm.fshl.i64(i64 %xor168.i, i64 %xor168.i, i64 36)
  %not184.i = xor i64 %230, -1
  %and185.i = and i64 %229, %not184.i
  %xor186.i = xor i64 %228, %and185.i
  %xor236.i = xor i64 %xor235.i, %xor186.i
  %xor199.i = xor i64 %Abi.0.i814, %xor53.i
  %231 = call i64 @llvm.fshl.i64(i64 %xor199.i, i64 %xor199.i, i64 62)
  %not219.i = xor i64 %211, -1
  %and220.i = and i64 %215, %not219.i
  %xor221.i = xor i64 %231, %and220.i
  %xor237.i = xor i64 %xor236.i, %xor221.i
  %xor75.i = xor i64 %Asu.0.i818, %xor61.i
  %232 = call i64 @llvm.fshl.i64(i64 %xor75.i, i64 %xor75.i, i64 14)
  %xor71.i = xor i64 %Amo.0.i798, %xor57.i
  %233 = call i64 @llvm.fshl.i64(i64 %xor71.i, i64 %xor71.i, i64 21)
  %not85.i = xor i64 %233, -1
  %and86.i = and i64 %232, %not85.i
  %xor87.i = xor i64 %217, %and86.i
  %xor110.i = xor i64 %Asi.0.i794, %xor53.i
  %234 = call i64 @llvm.fshl.i64(i64 %xor110.i, i64 %xor110.i, i64 61)
  %xor106.i = xor i64 %Ame.0.i800, %xor49.i
  %235 = call i64 @llvm.fshl.i64(i64 %xor106.i, i64 %xor106.i, i64 45)
  %not120.i = xor i64 %235, -1
  %and121.i = and i64 %234, %not120.i
  %xor122.i = xor i64 %223, %and121.i
  %xor242.i = xor i64 %xor87.i, %xor122.i
  %xor145.i = xor i64 %Asa.0.i796, %xor45.i
  %236 = call i64 @llvm.fshl.i64(i64 %xor145.i, i64 %xor145.i, i64 18)
  %xor141.i = xor i64 %Amu.0.i797, %xor61.i
  %237 = call i64 @llvm.fshl.i64(i64 %xor141.i, i64 %xor141.i, i64 8)
  %not155.i = xor i64 %237, -1
  %and156.i = and i64 %236, %not155.i
  %xor157.i = xor i64 %226, %and156.i
  %xor243.i = xor i64 %xor242.i, %xor157.i
  %xor180.i = xor i64 %Aso.0.i793, %xor57.i
  %238 = call i64 @llvm.fshl.i64(i64 %xor180.i, i64 %xor180.i, i64 56)
  %xor176.i = xor i64 %Ami.0.i799, %xor53.i
  %239 = call i64 @llvm.fshl.i64(i64 %xor176.i, i64 %xor176.i, i64 15)
  %not190.i = xor i64 %239, -1
  %and191.i = and i64 %238, %not190.i
  %xor192.i = xor i64 %229, %and191.i
  %xor244.i = xor i64 %xor243.i, %xor192.i
  %xor215.i = xor i64 %Ase.0.i795, %xor49.i
  %240 = call i64 @llvm.fshl.i64(i64 %xor215.i, i64 %xor215.i, i64 2)
  %not225.i = xor i64 %213, -1
  %and226.i = and i64 %240, %not225.i
  %xor227.i = xor i64 %215, %and226.i
  %xor245.i = xor i64 %xor244.i, %xor227.i
  %241 = call i64 @llvm.fshl.i64(i64 %xor245.i, i64 %xor245.i, i64 1)
  %xor261.i = xor i64 %xor237.i, %241
  %xor429.i = xor i64 %xor224.i, %xor261.i
  %242 = call i64 @llvm.fshl.i64(i64 %xor429.i, i64 %xor429.i, i64 2)
  %not123.i = xor i64 %234, -1
  %and124.i = and i64 %222, %not123.i
  %xor125.i = xor i64 %235, %and124.i
  %not91.i = xor i64 %xor62.i, -1
  %and92.i = and i64 %219, %not91.i
  %xor93.i = xor i64 %232, %and92.i
  %not126.i = xor i64 %222, -1
  %and127.i = and i64 %224, %not126.i
  %xor128.i = xor i64 %234, %and127.i
  %xor250.i = xor i64 %xor93.i, %xor128.i
  %not161.i = xor i64 %225, -1
  %and162.i = and i64 %227, %not161.i
  %xor163.i = xor i64 %236, %and162.i
  %xor251.i = xor i64 %xor250.i, %xor163.i
  %not196.i = xor i64 %228, -1
  %and197.i = and i64 %230, %not196.i
  %xor198.i = xor i64 %238, %and197.i
  %xor252.i = xor i64 %xor251.i, %xor198.i
  %not231.i = xor i64 %231, -1
  %and232.i = and i64 %211, %not231.i
  %xor233.i = xor i64 %240, %and232.i
  %xor253.i = xor i64 %xor252.i, %xor233.i
  %243 = call i64 @llvm.fshl.i64(i64 %xor253.i, i64 %xor253.i, i64 1)
  %xor269.i = xor i64 %xor245.i, %243
  %xor417.i = xor i64 %xor125.i, %xor269.i
  %244 = call i64 @llvm.fshl.i64(i64 %xor417.i, i64 %xor417.i, i64 55)
  %not82.i = xor i64 %217, -1
  %and83.i = and i64 %233, %not82.i
  %xor84.i = xor i64 %219, %and83.i
  %not117.i = xor i64 %223, -1
  %and118.i = and i64 %235, %not117.i
  %xor119.i = xor i64 %224, %and118.i
  %xor238.i = xor i64 %xor84.i, %xor119.i
  %not152.i = xor i64 %226, -1
  %and153.i = and i64 %237, %not152.i
  %xor154.i = xor i64 %227, %and153.i
  %xor239.i = xor i64 %xor238.i, %xor154.i
  %not187.i = xor i64 %229, -1
  %and188.i = and i64 %239, %not187.i
  %xor189.i = xor i64 %230, %and188.i
  %xor240.i = xor i64 %xor239.i, %xor189.i
  %xor241.i = xor i64 %xor240.i, %xor224.i
  %not88.i = xor i64 %232, -1
  %and89.i = and i64 %xor62.i, %not88.i
  %xor90.i = xor i64 %233, %and89.i
  %xor246.i = xor i64 %xor90.i, %xor125.i
  %not158.i = xor i64 %236, -1
  %and159.i = and i64 %225, %not158.i
  %xor160.i = xor i64 %237, %and159.i
  %xor247.i = xor i64 %xor246.i, %xor160.i
  %not193.i = xor i64 %238, -1
  %and194.i = and i64 %228, %not193.i
  %xor195.i = xor i64 %239, %and194.i
  %xor248.i = xor i64 %xor247.i, %xor195.i
  %not228.i = xor i64 %240, -1
  %and229.i = and i64 %231, %not228.i
  %xor230.i = xor i64 %213, %and229.i
  %xor249.i = xor i64 %xor248.i, %xor230.i
  %245 = call i64 @llvm.fshl.i64(i64 %xor249.i, i64 %xor249.i, i64 1)
  %xor265.i = xor i64 %xor241.i, %245
  %xor413.i = xor i64 %xor87.i, %xor265.i
  %246 = call i64 @llvm.fshl.i64(i64 %xor413.i, i64 %xor413.i, i64 62)
  %not445.i = xor i64 %246, -1
  %and446.i = and i64 %244, %not445.i
  %xor447.i = xor i64 %242, %and446.i
  %247 = call i64 @llvm.fshl.i64(i64 %xor241.i, i64 %xor241.i, i64 1)
  %xor257.i = xor i64 %xor253.i, %247
  %xor425.i = xor i64 %xor186.i, %xor257.i
  %248 = call i64 @llvm.fshl.i64(i64 %xor425.i, i64 %xor425.i, i64 41)
  %not442.i = xor i64 %242, -1
  %and443.i = and i64 %246, %not442.i
  %xor444.i = xor i64 %248, %and443.i
  %249 = call i64 @llvm.fshl.i64(i64 %xor237.i, i64 %xor237.i, i64 1)
  %xor273.i = xor i64 %xor249.i, %249
  %xor421.i = xor i64 %xor163.i, %xor273.i
  %250 = call i64 @llvm.fshl.i64(i64 %xor421.i, i64 %xor421.i, i64 39)
  %not439.i = xor i64 %248, -1
  %and440.i = and i64 %242, %not439.i
  %xor441.i = xor i64 %250, %and440.i
  %not436.i = xor i64 %250, -1
  %and437.i = and i64 %248, %not436.i
  %xor438.i = xor i64 %244, %and437.i
  %not433.i = xor i64 %244, -1
  %and434.i = and i64 %250, %not433.i
  %xor435.i = xor i64 %246, %and434.i
  %xor394.i = xor i64 %xor230.i, %xor269.i
  %251 = call i64 @llvm.fshl.i64(i64 %xor394.i, i64 %xor394.i, i64 56)
  %xor382.i = xor i64 %xor116.i, %xor257.i
  %252 = call i64 @llvm.fshl.i64(i64 %xor382.i, i64 %xor382.i, i64 36)
  %xor378.i = xor i64 %xor93.i, %xor273.i
  %253 = call i64 @llvm.fshl.i64(i64 %xor378.i, i64 %xor378.i, i64 27)
  %not410.i = xor i64 %253, -1
  %and411.i = and i64 %252, %not410.i
  %xor412.i = xor i64 %251, %and411.i
  %xor390.i = xor i64 %xor192.i, %xor265.i
  %254 = call i64 @llvm.fshl.i64(i64 %xor390.i, i64 %xor390.i, i64 15)
  %not407.i = xor i64 %251, -1
  %and408.i = and i64 %253, %not407.i
  %xor409.i = xor i64 %254, %and408.i
  %xor386.i = xor i64 %xor154.i, %xor261.i
  %255 = call i64 @llvm.fshl.i64(i64 %xor386.i, i64 %xor386.i, i64 10)
  %not404.i = xor i64 %254, -1
  %and405.i = and i64 %251, %not404.i
  %xor406.i = xor i64 %255, %and405.i
  %not401.i = xor i64 %255, -1
  %and402.i = and i64 %254, %not401.i
  %xor403.i = xor i64 %252, %and402.i
  %not398.i = xor i64 %252, -1
  %and399.i = and i64 %255, %not398.i
  %xor400.i = xor i64 %253, %and399.i
  %xor359.i = xor i64 %xor221.i, %xor257.i
  %256 = call i64 @llvm.fshl.i64(i64 %xor359.i, i64 %xor359.i, i64 18)
  %xor347.i = xor i64 %xor122.i, %xor265.i
  %257 = call i64 @llvm.fshl.i64(i64 %xor347.i, i64 %xor347.i, i64 6)
  %xor343.i = xor i64 %xor84.i, %xor261.i
  %258 = call i64 @llvm.fshl.i64(i64 %xor343.i, i64 %xor343.i, i64 1)
  %not375.i = xor i64 %258, -1
  %and376.i = and i64 %257, %not375.i
  %xor377.i = xor i64 %256, %and376.i
  %xor355.i = xor i64 %xor198.i, %xor273.i
  %259 = call i64 @llvm.fshl.i64(i64 %xor355.i, i64 %xor355.i, i64 8)
  %not372.i = xor i64 %256, -1
  %and373.i = and i64 %258, %not372.i
  %xor374.i = xor i64 %259, %and373.i
  %xor351.i = xor i64 %xor160.i, %xor269.i
  %260 = call i64 @llvm.fshl.i64(i64 %xor351.i, i64 %xor351.i, i64 25)
  %not369.i = xor i64 %259, -1
  %and370.i = and i64 %256, %not369.i
  %xor371.i = xor i64 %260, %and370.i
  %not366.i = xor i64 %260, -1
  %and367.i = and i64 %259, %not366.i
  %xor368.i = xor i64 %257, %and367.i
  %not363.i = xor i64 %257, -1
  %and364.i = and i64 %260, %not363.i
  %xor365.i = xor i64 %258, %and364.i
  %xor324.i = xor i64 %xor227.i, %xor265.i
  %261 = call i64 @llvm.fshl.i64(i64 %xor324.i, i64 %xor324.i, i64 61)
  %xor312.i = xor i64 %xor128.i, %xor273.i
  %262 = call i64 @llvm.fshl.i64(i64 %xor312.i, i64 %xor312.i, i64 20)
  %xor308.i = xor i64 %xor90.i, %xor269.i
  %263 = call i64 @llvm.fshl.i64(i64 %xor308.i, i64 %xor308.i, i64 28)
  %not340.i = xor i64 %263, -1
  %and341.i = and i64 %262, %not340.i
  %xor342.i = xor i64 %261, %and341.i
  %xor320.i = xor i64 %xor189.i, %xor261.i
  %264 = call i64 @llvm.fshl.i64(i64 %xor320.i, i64 %xor320.i, i64 45)
  %not337.i = xor i64 %261, -1
  %and338.i = and i64 %263, %not337.i
  %xor339.i = xor i64 %264, %and338.i
  %xor316.i = xor i64 %xor151.i, %xor257.i
  %265 = call i64 @llvm.fshl.i64(i64 %xor316.i, i64 %xor316.i, i64 3)
  %not334.i = xor i64 %264, -1
  %and335.i = and i64 %261, %not334.i
  %xor336.i = xor i64 %265, %and335.i
  %not331.i = xor i64 %265, -1
  %and332.i = and i64 %264, %not331.i
  %xor333.i = xor i64 %262, %and332.i
  %not328.i = xor i64 %262, -1
  %and329.i = and i64 %265, %not328.i
  %xor330.i = xor i64 %263, %and329.i
  %xor287.i = xor i64 %xor233.i, %xor273.i
  %266 = call i64 @llvm.fshl.i64(i64 %xor287.i, i64 %xor287.i, i64 14)
  %xor275.i = xor i64 %xor119.i, %xor261.i
  %267 = call i64 @llvm.fshl.i64(i64 %xor275.i, i64 %xor275.i, i64 44)
  %xor274.i = xor i64 %xor81.i, %xor257.i
  %not305.i = xor i64 %xor274.i, -1
  %and306.i = and i64 %267, %not305.i
  %xor307.i = xor i64 %266, %and306.i
  %xor283.i = xor i64 %xor195.i, %xor269.i
  %268 = call i64 @llvm.fshl.i64(i64 %xor283.i, i64 %xor283.i, i64 21)
  %not302.i = xor i64 %266, -1
  %and303.i = and i64 %xor274.i, %not302.i
  %xor304.i = xor i64 %268, %and303.i
  %xor279.i = xor i64 %xor157.i, %xor265.i
  %269 = call i64 @llvm.fshl.i64(i64 %xor279.i, i64 %xor279.i, i64 43)
  %not299.i = xor i64 %268, -1
  %and300.i = and i64 %266, %not299.i
  %xor301.i = xor i64 %269, %and300.i
  %not296.i = xor i64 %269, -1
  %and297.i = and i64 %268, %not296.i
  %xor298.i = xor i64 %267, %and297.i
  %add.i = or disjoint i32 %round.0.i817, 1
  %arrayidx294.i = getelementptr inbounds nuw [24 x i64], ptr @KeccakF_RoundConstants, i32 0, i32 %add.i
  %270 = load i64, ptr %arrayidx294.i, align 8
  %not291.i = xor i64 %267, -1
  %and292.i = and i64 %269, %not291.i
  %271 = xor i64 %and292.i, %270
  %xor295.i = xor i64 %271, %xor274.i
  %add448.i = add nuw nsw i32 %round.0.i817, 2
  %cmp.i51 = icmp samesign ult i32 %add448.i, 24
  br i1 %cmp.i51, label %for.inc.i, label %KeccakF1600_StatePermute.exit, !llvm.loop !74

KeccakF1600_StatePermute.exit:                    ; preds = %for.inc.i
  %Aso.0.i.lcssa = phi i64 [ %xor444.i, %for.inc.i ]
  %Asi.0.i.lcssa = phi i64 [ %xor441.i, %for.inc.i ]
  %Ase.0.i.lcssa = phi i64 [ %xor438.i, %for.inc.i ]
  %Asa.0.i.lcssa = phi i64 [ %xor435.i, %for.inc.i ]
  %Amu.0.i.lcssa = phi i64 [ %xor412.i, %for.inc.i ]
  %Amo.0.i.lcssa = phi i64 [ %xor409.i, %for.inc.i ]
  %Ami.0.i.lcssa = phi i64 [ %xor406.i, %for.inc.i ]
  %Ame.0.i.lcssa = phi i64 [ %xor403.i, %for.inc.i ]
  %Ama.0.i.lcssa = phi i64 [ %xor400.i, %for.inc.i ]
  %Aku.0.i.lcssa = phi i64 [ %xor377.i, %for.inc.i ]
  %Ako.0.i.lcssa = phi i64 [ %xor374.i, %for.inc.i ]
  %Aki.0.i.lcssa = phi i64 [ %xor371.i, %for.inc.i ]
  %Ake.0.i.lcssa = phi i64 [ %xor368.i, %for.inc.i ]
  %Aka.0.i.lcssa = phi i64 [ %xor365.i, %for.inc.i ]
  %Agu.0.i.lcssa = phi i64 [ %xor342.i, %for.inc.i ]
  %Ago.0.i.lcssa = phi i64 [ %xor339.i, %for.inc.i ]
  %Agi.0.i.lcssa = phi i64 [ %xor336.i, %for.inc.i ]
  %Age.0.i.lcssa = phi i64 [ %xor333.i, %for.inc.i ]
  %Aga.0.i.lcssa = phi i64 [ %xor330.i, %for.inc.i ]
  %Abu.0.i.lcssa = phi i64 [ %xor307.i, %for.inc.i ]
  %Abo.0.i.lcssa = phi i64 [ %xor304.i, %for.inc.i ]
  %Abi.0.i.lcssa = phi i64 [ %xor301.i, %for.inc.i ]
  %Abe.0.i.lcssa = phi i64 [ %xor298.i, %for.inc.i ]
  %Aba.0.i.lcssa = phi i64 [ %xor295.i, %for.inc.i ]
  %Asu.0.i.lcssa = phi i64 [ %xor447.i, %for.inc.i ]
  store i64 %Aba.0.i.lcssa, ptr %184, align 8
  %arrayidx450.i = getelementptr inbounds nuw i8, ptr %184, i32 8
  store i64 %Abe.0.i.lcssa, ptr %arrayidx450.i, align 8
  %arrayidx451.i = getelementptr inbounds nuw i8, ptr %184, i32 16
  store i64 %Abi.0.i.lcssa, ptr %arrayidx451.i, align 8
  %arrayidx452.i = getelementptr inbounds nuw i8, ptr %184, i32 24
  store i64 %Abo.0.i.lcssa, ptr %arrayidx452.i, align 8
  %arrayidx453.i = getelementptr inbounds nuw i8, ptr %184, i32 32
  store i64 %Abu.0.i.lcssa, ptr %arrayidx453.i, align 8
  %arrayidx454.i = getelementptr inbounds nuw i8, ptr %184, i32 40
  store i64 %Aga.0.i.lcssa, ptr %arrayidx454.i, align 8
  %arrayidx455.i = getelementptr inbounds nuw i8, ptr %184, i32 48
  store i64 %Age.0.i.lcssa, ptr %arrayidx455.i, align 8
  %arrayidx456.i = getelementptr inbounds nuw i8, ptr %184, i32 56
  store i64 %Agi.0.i.lcssa, ptr %arrayidx456.i, align 8
  %arrayidx457.i = getelementptr inbounds nuw i8, ptr %184, i32 64
  store i64 %Ago.0.i.lcssa, ptr %arrayidx457.i, align 8
  %arrayidx458.i = getelementptr inbounds nuw i8, ptr %184, i32 72
  store i64 %Agu.0.i.lcssa, ptr %arrayidx458.i, align 8
  %arrayidx459.i = getelementptr inbounds nuw i8, ptr %184, i32 80
  store i64 %Aka.0.i.lcssa, ptr %arrayidx459.i, align 8
  %arrayidx460.i = getelementptr inbounds nuw i8, ptr %184, i32 88
  store i64 %Ake.0.i.lcssa, ptr %arrayidx460.i, align 8
  %arrayidx461.i = getelementptr inbounds nuw i8, ptr %184, i32 96
  store i64 %Aki.0.i.lcssa, ptr %arrayidx461.i, align 8
  %arrayidx462.i = getelementptr inbounds nuw i8, ptr %184, i32 104
  store i64 %Ako.0.i.lcssa, ptr %arrayidx462.i, align 8
  %arrayidx463.i = getelementptr inbounds nuw i8, ptr %184, i32 112
  store i64 %Aku.0.i.lcssa, ptr %arrayidx463.i, align 8
  %arrayidx464.i = getelementptr inbounds nuw i8, ptr %184, i32 120
  store i64 %Ama.0.i.lcssa, ptr %arrayidx464.i, align 8
  %arrayidx465.i = getelementptr inbounds nuw i8, ptr %184, i32 128
  store i64 %Ame.0.i.lcssa, ptr %arrayidx465.i, align 8
  %arrayidx466.i = getelementptr inbounds nuw i8, ptr %184, i32 136
  store i64 %Ami.0.i.lcssa, ptr %arrayidx466.i, align 8
  %arrayidx467.i = getelementptr inbounds nuw i8, ptr %184, i32 144
  store i64 %Amo.0.i.lcssa, ptr %arrayidx467.i, align 8
  %arrayidx468.i = getelementptr inbounds nuw i8, ptr %184, i32 152
  store i64 %Amu.0.i.lcssa, ptr %arrayidx468.i, align 8
  %arrayidx469.i = getelementptr inbounds nuw i8, ptr %184, i32 160
  store i64 %Asa.0.i.lcssa, ptr %arrayidx469.i, align 8
  %arrayidx470.i = getelementptr inbounds nuw i8, ptr %184, i32 168
  store i64 %Ase.0.i.lcssa, ptr %arrayidx470.i, align 8
  %arrayidx471.i = getelementptr inbounds nuw i8, ptr %184, i32 176
  store i64 %Asi.0.i.lcssa, ptr %arrayidx471.i, align 8
  %arrayidx472.i = getelementptr inbounds nuw i8, ptr %184, i32 184
  store i64 %Aso.0.i.lcssa, ptr %arrayidx472.i, align 8
  %arrayidx473.i = getelementptr inbounds nuw i8, ptr %184, i32 192
  store i64 %Asu.0.i.lcssa, ptr %arrayidx473.i, align 8
  br label %for.body.i12

for.body.i12:                                     ; preds = %KeccakF1600_StatePermute.exit, %store64.exit.i19
  %i.0.i7820 = phi i32 [ 0, %KeccakF1600_StatePermute.exit ], [ %inc.i20, %store64.exit.i19 ]
  %mul.i13 = shl nuw nsw i32 %i.0.i7820, 3
  %add.ptr.i14 = getelementptr inbounds nuw i8, ptr %t, i32 %mul.i13
  %arrayidx.i15 = getelementptr inbounds nuw i64, ptr %184, i32 %i.0.i7820
  %272 = load i64, ptr %arrayidx.i15, align 8
  br label %for.body.i.i21

for.body.i.i21:                                   ; preds = %for.body.i12, %for.body.i.i21
  %i.0.i.i17819 = phi i32 [ 0, %for.body.i12 ], [ %inc.i.i27, %for.body.i.i21 ]
  %mul.i.i22 = shl nuw nsw i32 %i.0.i.i17819, 3
  %sh_prom.i.i23 = zext nneg i32 %mul.i.i22 to i64
  %shr.i.i24 = lshr i64 %272, %sh_prom.i.i23
  %conv.i.i25 = trunc i64 %shr.i.i24 to i8
  %arrayidx.i.i26 = getelementptr inbounds nuw i8, ptr %add.ptr.i14, i32 %i.0.i.i17819
  store i8 %conv.i.i25, ptr %arrayidx.i.i26, align 1
  %inc.i.i27 = add nuw nsw i32 %i.0.i.i17819, 1
  %exitcond.i.i18.not = icmp eq i32 %inc.i.i27, 8
  br i1 %exitcond.i.i18.not, label %store64.exit.i19, label %for.body.i.i21, !llvm.loop !75

store64.exit.i19:                                 ; preds = %for.body.i.i21
  %inc.i20 = add nuw nsw i32 %i.0.i7820, 1
  %exitcond.i8.not = icmp eq i32 %inc.i20, 17
  br i1 %exitcond.i8.not, label %for.end.i9, label %for.body.i12, !llvm.loop !76

for.end.i9:                                       ; preds = %store64.exit.i19
  br label %for.cond.preheader

for.body:                                         ; preds = %for.cond.preheader, %for.body
  %i.0823 = phi i32 [ 0, %for.cond.preheader ], [ %inc, %for.body ]
  %arrayidx = getelementptr inbounds nuw [136 x i8], ptr %t, i32 0, i32 %i.0823
  %273 = load i8, ptr %arrayidx, align 1
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %i.0823
  store i8 %273, ptr %arrayidx2, align 1
  %inc = add nuw i32 %i.0823, 1
  %exitcond.not = icmp eq i32 %inc, %sub
  br i1 %exitcond.not, label %if.end.loopexit, label %for.body, !llvm.loop !77

if.end.loopexit:                                  ; preds = %for.body
  br label %if.end

if.end:                                           ; preds = %if.end.loopexit, %keccak_squeezeblocks.exit
  %274 = load ptr, ptr %s, align 4
  call void @free(ptr noundef %274) #8
  ret void
}

; Function Attrs: inlinehint nounwind
define dso_local void @aes128_ecb_keyexp(ptr noundef %r, ptr noundef %key) local_unnamed_addr #1 {
entry:
  %q.i1.i = alloca [8 x i64], align 8
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
  br i1 %cmp.not.i.i, label %br_range_dec32le.exit.i, label %while.body.i.i, !llvm.loop !78

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
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %q.i1.i)
  %call.i2.i = call ptr @memset(ptr noundef nonnull %q.i1.i, i32 noundef 0, i32 noundef 64) #8
  %conv.i3.i = zext i32 %5 to i64
  store i64 %conv.i3.i, ptr %q.i1.i, align 8
  %arrayidx1.i431.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  %6 = load i64, ptr %arrayidx1.i431.i, align 8
  %and.i432.i = and i64 %conv.i3.i, 1431655765
  %and2.i433.i = shl i64 %6, 1
  %shl.i434.i = and i64 %and2.i433.i, -6148914691236517206
  %or.i435.i = or disjoint i64 %and.i432.i, %shl.i434.i
  store i64 %or.i435.i, ptr %q.i1.i, align 8
  %and4.i436.i = lshr i64 %conv.i3.i, 1
  %shr.i437.i = and i64 %and4.i436.i, 1431655765
  %and5.i438.i = and i64 %6, -6148914691236517206
  %or6.i439.i = or disjoint i64 %shr.i437.i, %and5.i438.i
  %arrayidx7.i440.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  store i64 %or6.i439.i, ptr %arrayidx7.i440.i, align 8
  %arrayidx11.i441.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  %7 = load i64, ptr %arrayidx11.i441.i, align 8
  %arrayidx12.i442.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  %8 = load i64, ptr %arrayidx12.i442.i, align 8
  %and13.i443.i = and i64 %7, 6148914691236517205
  %and14.i444.i = shl i64 %8, 1
  %shl15.i445.i = and i64 %and14.i444.i, -6148914691236517206
  %or16.i446.i = or disjoint i64 %and13.i443.i, %shl15.i445.i
  %arrayidx17.i447.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  store i64 %or16.i446.i, ptr %arrayidx17.i447.i, align 8
  %and18.i448.i = lshr i64 %7, 1
  %shr19.i449.i = and i64 %and18.i448.i, 6148914691236517205
  %and20.i450.i = and i64 %8, -6148914691236517206
  %or21.i451.i = or disjoint i64 %shr19.i449.i, %and20.i450.i
  %arrayidx22.i452.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  store i64 %or21.i451.i, ptr %arrayidx22.i452.i, align 8
  %arrayidx27.i453.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  %9 = load i64, ptr %arrayidx27.i453.i, align 8
  %arrayidx28.i454.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  %10 = load i64, ptr %arrayidx28.i454.i, align 8
  %and29.i455.i = and i64 %9, 6148914691236517205
  %and30.i456.i = shl i64 %10, 1
  %shl31.i457.i = and i64 %and30.i456.i, -6148914691236517206
  %or32.i458.i = or disjoint i64 %and29.i455.i, %shl31.i457.i
  %arrayidx33.i459.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  store i64 %or32.i458.i, ptr %arrayidx33.i459.i, align 8
  %and34.i460.i = lshr i64 %9, 1
  %shr35.i461.i = and i64 %and34.i460.i, 6148914691236517205
  %and36.i462.i = and i64 %10, -6148914691236517206
  %or37.i463.i = or disjoint i64 %shr35.i461.i, %and36.i462.i
  %arrayidx38.i464.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  store i64 %or37.i463.i, ptr %arrayidx38.i464.i, align 8
  %arrayidx43.i465.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  %11 = load i64, ptr %arrayidx43.i465.i, align 8
  %arrayidx44.i466.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  %12 = load i64, ptr %arrayidx44.i466.i, align 8
  %and45.i467.i = and i64 %11, 6148914691236517205
  %and46.i468.i = shl i64 %12, 1
  %shl47.i469.i = and i64 %and46.i468.i, -6148914691236517206
  %or48.i470.i = or disjoint i64 %and45.i467.i, %shl47.i469.i
  %arrayidx49.i471.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  store i64 %or48.i470.i, ptr %arrayidx49.i471.i, align 8
  %and50.i472.i = lshr i64 %11, 1
  %shr51.i473.i = and i64 %and50.i472.i, 6148914691236517205
  %and52.i474.i = and i64 %12, -6148914691236517206
  %or53.i475.i = or disjoint i64 %shr51.i473.i, %and52.i474.i
  %arrayidx54.i476.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  store i64 %or53.i475.i, ptr %arrayidx54.i476.i, align 8
  %13 = load i64, ptr %q.i1.i, align 8
  %arrayidx60.i477.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  %14 = load i64, ptr %arrayidx60.i477.i, align 8
  %and61.i478.i = and i64 %13, 3689348814741910323
  %and62.i479.i = shl i64 %14, 2
  %shl63.i480.i = and i64 %and62.i479.i, -3689348814741910324
  %or64.i481.i = or disjoint i64 %and61.i478.i, %shl63.i480.i
  store i64 %or64.i481.i, ptr %q.i1.i, align 8
  %and66.i482.i = lshr i64 %13, 2
  %shr67.i483.i = and i64 %and66.i482.i, 3689348814741910323
  %and68.i484.i = and i64 %14, -3689348814741910324
  %or69.i485.i = or disjoint i64 %shr67.i483.i, %and68.i484.i
  %arrayidx70.i486.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  store i64 %or69.i485.i, ptr %arrayidx70.i486.i, align 8
  %arrayidx75.i487.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  %15 = load i64, ptr %arrayidx75.i487.i, align 8
  %arrayidx76.i488.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  %16 = load i64, ptr %arrayidx76.i488.i, align 8
  %and77.i489.i = and i64 %15, 3689348814741910323
  %and78.i490.i = shl i64 %16, 2
  %shl79.i491.i = and i64 %and78.i490.i, -3689348814741910324
  %or80.i492.i = or disjoint i64 %and77.i489.i, %shl79.i491.i
  %arrayidx81.i493.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  store i64 %or80.i492.i, ptr %arrayidx81.i493.i, align 8
  %and82.i494.i = lshr i64 %15, 2
  %shr83.i495.i = and i64 %and82.i494.i, 3689348814741910323
  %and84.i496.i = and i64 %16, -3689348814741910324
  %or85.i497.i = or disjoint i64 %shr83.i495.i, %and84.i496.i
  %arrayidx86.i498.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  store i64 %or85.i497.i, ptr %arrayidx86.i498.i, align 8
  %arrayidx91.i499.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  %17 = load i64, ptr %arrayidx91.i499.i, align 8
  %arrayidx92.i500.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  %18 = load i64, ptr %arrayidx92.i500.i, align 8
  %and93.i501.i = and i64 %17, 3689348814741910323
  %and94.i502.i = shl i64 %18, 2
  %shl95.i503.i = and i64 %and94.i502.i, -3689348814741910324
  %or96.i504.i = or disjoint i64 %and93.i501.i, %shl95.i503.i
  %arrayidx97.i505.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  store i64 %or96.i504.i, ptr %arrayidx97.i505.i, align 8
  %and98.i506.i = lshr i64 %17, 2
  %shr99.i507.i = and i64 %and98.i506.i, 3689348814741910323
  %and100.i508.i = and i64 %18, -3689348814741910324
  %or101.i509.i = or disjoint i64 %shr99.i507.i, %and100.i508.i
  %arrayidx102.i510.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  store i64 %or101.i509.i, ptr %arrayidx102.i510.i, align 8
  %arrayidx107.i511.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  %19 = load i64, ptr %arrayidx107.i511.i, align 8
  %arrayidx108.i512.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  %20 = load i64, ptr %arrayidx108.i512.i, align 8
  %and109.i513.i = and i64 %19, 3689348814741910323
  %and110.i514.i = shl i64 %20, 2
  %shl111.i515.i = and i64 %and110.i514.i, -3689348814741910324
  %or112.i516.i = or disjoint i64 %and109.i513.i, %shl111.i515.i
  %arrayidx113.i517.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  store i64 %or112.i516.i, ptr %arrayidx113.i517.i, align 8
  %and114.i518.i = lshr i64 %19, 2
  %shr115.i519.i = and i64 %and114.i518.i, 3689348814741910323
  %and116.i520.i = and i64 %20, -3689348814741910324
  %or117.i521.i = or disjoint i64 %shr115.i519.i, %and116.i520.i
  %arrayidx118.i522.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  store i64 %or117.i521.i, ptr %arrayidx118.i522.i, align 8
  %21 = load i64, ptr %q.i1.i, align 8
  %arrayidx124.i523.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  %22 = load i64, ptr %arrayidx124.i523.i, align 8
  %and125.i524.i = and i64 %21, 1085102592571150095
  %and126.i525.i = shl i64 %22, 4
  %shl127.i526.i = and i64 %and126.i525.i, -1085102592571150096
  %or128.i527.i = or disjoint i64 %and125.i524.i, %shl127.i526.i
  store i64 %or128.i527.i, ptr %q.i1.i, align 8
  %and130.i528.i = lshr i64 %21, 4
  %shr131.i529.i = and i64 %and130.i528.i, 1085102592571150095
  %and132.i530.i = and i64 %22, -1085102592571150096
  %or133.i531.i = or disjoint i64 %shr131.i529.i, %and132.i530.i
  %arrayidx134.i532.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  store i64 %or133.i531.i, ptr %arrayidx134.i532.i, align 8
  %arrayidx139.i533.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  %23 = load i64, ptr %arrayidx139.i533.i, align 8
  %arrayidx140.i534.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  %24 = load i64, ptr %arrayidx140.i534.i, align 8
  %and141.i535.i = and i64 %23, 1085102592571150095
  %and142.i536.i = shl i64 %24, 4
  %shl143.i537.i = and i64 %and142.i536.i, -1085102592571150096
  %or144.i538.i = or disjoint i64 %and141.i535.i, %shl143.i537.i
  %arrayidx145.i539.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  store i64 %or144.i538.i, ptr %arrayidx145.i539.i, align 8
  %and146.i540.i = lshr i64 %23, 4
  %shr147.i541.i = and i64 %and146.i540.i, 1085102592571150095
  %and148.i542.i = and i64 %24, -1085102592571150096
  %or149.i543.i = or disjoint i64 %shr147.i541.i, %and148.i542.i
  %arrayidx150.i544.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  store i64 %or149.i543.i, ptr %arrayidx150.i544.i, align 8
  %arrayidx155.i545.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  %25 = load i64, ptr %arrayidx155.i545.i, align 8
  %arrayidx156.i546.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  %26 = load i64, ptr %arrayidx156.i546.i, align 8
  %and157.i547.i = and i64 %25, 1085102592571150095
  %and158.i548.i = shl i64 %26, 4
  %shl159.i549.i = and i64 %and158.i548.i, -1085102592571150096
  %or160.i550.i = or disjoint i64 %and157.i547.i, %shl159.i549.i
  %arrayidx161.i551.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  store i64 %or160.i550.i, ptr %arrayidx161.i551.i, align 8
  %and162.i552.i = lshr i64 %25, 4
  %shr163.i553.i = and i64 %and162.i552.i, 1085102592571150095
  %and164.i554.i = and i64 %26, -1085102592571150096
  %or165.i555.i = or disjoint i64 %shr163.i553.i, %and164.i554.i
  %arrayidx166.i556.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  store i64 %or165.i555.i, ptr %arrayidx166.i556.i, align 8
  %arrayidx171.i557.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  %27 = load i64, ptr %arrayidx171.i557.i, align 8
  %arrayidx172.i558.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  %28 = load i64, ptr %arrayidx172.i558.i, align 8
  %and173.i559.i = and i64 %27, 1085102592571150095
  %and174.i560.i = shl i64 %28, 4
  %shl175.i561.i = and i64 %and174.i560.i, -1085102592571150096
  %or176.i562.i = or disjoint i64 %and173.i559.i, %shl175.i561.i
  %arrayidx177.i563.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  store i64 %or176.i562.i, ptr %arrayidx177.i563.i, align 8
  %and178.i564.i = lshr i64 %27, 4
  %shr179.i565.i = and i64 %and178.i564.i, 1085102592571150095
  %and180.i566.i = and i64 %28, -1085102592571150096
  %or181.i567.i = or disjoint i64 %shr179.i565.i, %and180.i566.i
  %arrayidx182.i568.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  store i64 %or181.i567.i, ptr %arrayidx182.i568.i, align 8
  %arrayidx1.i21.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  %29 = load i64, ptr %arrayidx1.i21.i, align 8
  %arrayidx2.i22.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  %30 = load i64, ptr %arrayidx2.i22.i, align 8
  %arrayidx3.i23.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  %31 = load i64, ptr %arrayidx3.i23.i, align 8
  %arrayidx4.i24.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  %32 = load i64, ptr %arrayidx4.i24.i, align 8
  %arrayidx5.i25.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  %33 = load i64, ptr %arrayidx5.i25.i, align 8
  %arrayidx6.i26.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  %34 = load i64, ptr %arrayidx6.i26.i, align 8
  %35 = load i64, ptr %q.i1.i, align 8
  %xor.i27.i = xor i64 %31, %33
  %xor8.i28.i = xor i64 %or181.i567.i, %34
  %xor9.i29.i = xor i64 %or181.i567.i, %31
  %xor10.i30.i = xor i64 %or181.i567.i, %33
  %xor11.i31.i = xor i64 %29, %30
  %xor12.i32.i = xor i64 %xor11.i31.i, %35
  %xor13.i33.i = xor i64 %xor12.i32.i, %31
  %xor14.i34.i = xor i64 %xor8.i28.i, %xor.i27.i
  %xor15.i35.i = xor i64 %xor12.i32.i, %or181.i567.i
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
  %43 = xor i64 %42, %or181.i567.i
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
  %arrayidx124.i132.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  store i64 %xor112.i124.i, ptr %arrayidx124.i132.i, align 8
  %arrayidx125.i133.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  store i64 %xor121.i130.i, ptr %arrayidx125.i133.i, align 8
  %arrayidx126.i134.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  store i64 %xor123.i131.i, ptr %arrayidx126.i134.i, align 8
  %arrayidx127.i135.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  store i64 %xor117.i127.i, ptr %arrayidx127.i135.i, align 8
  %arrayidx128.i136.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  store i64 %xor118.i128.i, ptr %arrayidx128.i136.i, align 8
  %arrayidx129.i137.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  store i64 %xor119.i129.i, ptr %arrayidx129.i137.i, align 8
  %arrayidx130.i138.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  store i64 %xor113.i125.i, ptr %arrayidx130.i138.i, align 8
  %and.i140.i = and i64 %xor115.i126.i, 6148914691236517205
  %and2.i.i = shl i64 %xor113.i125.i, 1
  %shl.i141.i = and i64 %and2.i.i, -6148914691236517206
  %or.i142.i = or disjoint i64 %and.i140.i, %shl.i141.i
  store i64 %or.i142.i, ptr %q.i1.i, align 8
  %and4.i.i = lshr i64 %xor115.i126.i, 1
  %shr.i.i = and i64 %and4.i.i, 6148914691236517205
  %and5.i.i = and i64 %xor113.i125.i, -6148914691236517206
  %or6.i143.i = or disjoint i64 %shr.i.i, %and5.i.i
  %arrayidx7.i144.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  store i64 %or6.i143.i, ptr %arrayidx7.i144.i, align 8
  %arrayidx11.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  %50 = load i64, ptr %arrayidx11.i.i, align 8
  %arrayidx12.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  %51 = load i64, ptr %arrayidx12.i.i, align 8
  %and13.i145.i = and i64 %50, 6148914691236517205
  %and14.i146.i = shl i64 %51, 1
  %shl15.i.i = and i64 %and14.i146.i, -6148914691236517206
  %or16.i.i = or disjoint i64 %and13.i145.i, %shl15.i.i
  %arrayidx17.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  store i64 %or16.i.i, ptr %arrayidx17.i.i, align 8
  %and18.i.i = lshr i64 %50, 1
  %shr19.i.i = and i64 %and18.i.i, 6148914691236517205
  %and20.i.i = and i64 %51, -6148914691236517206
  %or21.i.i = or disjoint i64 %shr19.i.i, %and20.i.i
  %arrayidx22.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  store i64 %or21.i.i, ptr %arrayidx22.i.i, align 8
  %arrayidx27.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  %52 = load i64, ptr %arrayidx27.i.i, align 8
  %arrayidx28.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  %53 = load i64, ptr %arrayidx28.i.i, align 8
  %and29.i.i = and i64 %52, 6148914691236517205
  %and30.i147.i = shl i64 %53, 1
  %shl31.i.i = and i64 %and30.i147.i, -6148914691236517206
  %or32.i.i = or disjoint i64 %and29.i.i, %shl31.i.i
  %arrayidx33.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  store i64 %or32.i.i, ptr %arrayidx33.i.i, align 8
  %and34.i148.i = lshr i64 %52, 1
  %shr35.i.i = and i64 %and34.i148.i, 6148914691236517205
  %and36.i.i = and i64 %53, -6148914691236517206
  %or37.i.i = or disjoint i64 %shr35.i.i, %and36.i.i
  %arrayidx38.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  store i64 %or37.i.i, ptr %arrayidx38.i.i, align 8
  %arrayidx43.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  %54 = load i64, ptr %arrayidx43.i.i, align 8
  %arrayidx44.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  %55 = load i64, ptr %arrayidx44.i.i, align 8
  %and45.i.i = and i64 %54, 6148914691236517205
  %and46.i.i = shl i64 %55, 1
  %shl47.i.i = and i64 %and46.i.i, -6148914691236517206
  %or48.i.i = or disjoint i64 %and45.i.i, %shl47.i.i
  %arrayidx49.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  store i64 %or48.i.i, ptr %arrayidx49.i.i, align 8
  %and50.i.i = lshr i64 %54, 1
  %shr51.i.i = and i64 %and50.i.i, 6148914691236517205
  %and52.i.i = and i64 %55, -6148914691236517206
  %or53.i.i = or disjoint i64 %shr51.i.i, %and52.i.i
  %arrayidx54.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  store i64 %or53.i.i, ptr %arrayidx54.i.i, align 8
  %56 = load i64, ptr %q.i1.i, align 8
  %arrayidx60.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  %57 = load i64, ptr %arrayidx60.i.i, align 8
  %and61.i.i = and i64 %56, 3689348814741910323
  %and62.i.i = shl i64 %57, 2
  %shl63.i.i = and i64 %and62.i.i, -3689348814741910324
  %or64.i.i = or disjoint i64 %and61.i.i, %shl63.i.i
  store i64 %or64.i.i, ptr %q.i1.i, align 8
  %and66.i149.i = lshr i64 %56, 2
  %shr67.i.i = and i64 %and66.i149.i, 3689348814741910323
  %and68.i.i = and i64 %57, -3689348814741910324
  %or69.i.i = or disjoint i64 %shr67.i.i, %and68.i.i
  %arrayidx70.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  store i64 %or69.i.i, ptr %arrayidx70.i.i, align 8
  %arrayidx75.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  %58 = load i64, ptr %arrayidx75.i.i, align 8
  %arrayidx76.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  %59 = load i64, ptr %arrayidx76.i.i, align 8
  %and77.i150.i = and i64 %58, 3689348814741910323
  %and78.i151.i = shl i64 %59, 2
  %shl79.i.i = and i64 %and78.i151.i, -3689348814741910324
  %or80.i.i = or disjoint i64 %and77.i150.i, %shl79.i.i
  %arrayidx81.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  store i64 %or80.i.i, ptr %arrayidx81.i.i, align 8
  %and82.i152.i = lshr i64 %58, 2
  %shr83.i.i = and i64 %and82.i152.i, 3689348814741910323
  %and84.i153.i = and i64 %59, -3689348814741910324
  %or85.i.i = or disjoint i64 %shr83.i.i, %and84.i153.i
  %arrayidx86.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  store i64 %or85.i.i, ptr %arrayidx86.i.i, align 8
  %arrayidx91.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  %60 = load i64, ptr %arrayidx91.i.i, align 8
  %arrayidx92.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  %61 = load i64, ptr %arrayidx92.i.i, align 8
  %and93.i.i = and i64 %60, 3689348814741910323
  %and94.i.i = shl i64 %61, 2
  %shl95.i.i = and i64 %and94.i.i, -3689348814741910324
  %or96.i.i = or disjoint i64 %and93.i.i, %shl95.i.i
  %arrayidx97.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  store i64 %or96.i.i, ptr %arrayidx97.i.i, align 8
  %and98.i.i = lshr i64 %60, 2
  %shr99.i.i = and i64 %and98.i.i, 3689348814741910323
  %and100.i.i = and i64 %61, -3689348814741910324
  %or101.i.i = or disjoint i64 %shr99.i.i, %and100.i.i
  %arrayidx102.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  store i64 %or101.i.i, ptr %arrayidx102.i.i, align 8
  %arrayidx107.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  %62 = load i64, ptr %arrayidx107.i.i, align 8
  %arrayidx108.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  %63 = load i64, ptr %arrayidx108.i.i, align 8
  %and109.i.i = and i64 %62, 3689348814741910323
  %and110.i.i = shl i64 %63, 2
  %shl111.i.i = and i64 %and110.i.i, -3689348814741910324
  %or112.i.i = or disjoint i64 %and109.i.i, %shl111.i.i
  %arrayidx113.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  store i64 %or112.i.i, ptr %arrayidx113.i.i, align 8
  %and114.i.i = lshr i64 %62, 2
  %shr115.i.i = and i64 %and114.i.i, 3689348814741910323
  %and116.i.i = and i64 %63, -3689348814741910324
  %or117.i.i = or disjoint i64 %shr115.i.i, %and116.i.i
  %arrayidx118.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  store i64 %or117.i.i, ptr %arrayidx118.i.i, align 8
  %64 = load i64, ptr %q.i1.i, align 8
  %arrayidx124.i154.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  %65 = load i64, ptr %arrayidx124.i154.i, align 8
  %and125.i.i = and i64 %64, 1085102592571150095
  %and126.i.i = shl i64 %65, 4
  %shl127.i.i = and i64 %and126.i.i, -1085102592571150096
  %or128.i.i = or disjoint i64 %and125.i.i, %shl127.i.i
  store i64 %or128.i.i, ptr %q.i1.i, align 8
  %and130.i.i = lshr i64 %64, 4
  %shr131.i.i = and i64 %and130.i.i, 1085102592571150095
  %and132.i.i = and i64 %65, -1085102592571150096
  %or133.i.i = or disjoint i64 %shr131.i.i, %and132.i.i
  %arrayidx134.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  store i64 %or133.i.i, ptr %arrayidx134.i.i, align 8
  %arrayidx139.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  %66 = load i64, ptr %arrayidx139.i.i, align 8
  %arrayidx140.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  %67 = load i64, ptr %arrayidx140.i.i, align 8
  %and141.i.i = and i64 %66, 1085102592571150095
  %and142.i.i = shl i64 %67, 4
  %shl143.i.i = and i64 %and142.i.i, -1085102592571150096
  %or144.i.i = or disjoint i64 %and141.i.i, %shl143.i.i
  %arrayidx145.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  store i64 %or144.i.i, ptr %arrayidx145.i.i, align 8
  %and146.i.i = lshr i64 %66, 4
  %shr147.i.i = and i64 %and146.i.i, 1085102592571150095
  %and148.i.i = and i64 %67, -1085102592571150096
  %or149.i.i = or disjoint i64 %shr147.i.i, %and148.i.i
  %arrayidx150.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  store i64 %or149.i.i, ptr %arrayidx150.i.i, align 8
  %arrayidx155.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  %68 = load i64, ptr %arrayidx155.i.i, align 8
  %arrayidx156.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  %69 = load i64, ptr %arrayidx156.i.i, align 8
  %and157.i.i = and i64 %68, 1085102592571150095
  %and158.i.i = shl i64 %69, 4
  %shl159.i.i = and i64 %and158.i.i, -1085102592571150096
  %or160.i.i = or disjoint i64 %and157.i.i, %shl159.i.i
  %arrayidx161.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  store i64 %or160.i.i, ptr %arrayidx161.i.i, align 8
  %and162.i.i = lshr i64 %68, 4
  %shr163.i.i = and i64 %and162.i.i, 1085102592571150095
  %and164.i.i = and i64 %69, -1085102592571150096
  %or165.i.i = or disjoint i64 %shr163.i.i, %and164.i.i
  %arrayidx166.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  store i64 %or165.i.i, ptr %arrayidx166.i.i, align 8
  %arrayidx171.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  %70 = load i64, ptr %arrayidx171.i.i, align 8
  %arrayidx172.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  %71 = load i64, ptr %arrayidx172.i.i, align 8
  %and173.i.i = and i64 %70, 1085102592571150095
  %and174.i.i = shl i64 %71, 4
  %shl175.i.i = and i64 %and174.i.i, -1085102592571150096
  %or176.i.i = or disjoint i64 %and173.i.i, %shl175.i.i
  %arrayidx177.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  store i64 %or176.i.i, ptr %arrayidx177.i.i, align 8
  %and178.i.i = lshr i64 %70, 4
  %shr179.i.i = and i64 %and178.i.i, 1085102592571150095
  %and180.i.i = and i64 %71, -1085102592571150096
  %or181.i.i = or disjoint i64 %shr179.i.i, %and180.i.i
  %arrayidx182.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  store i64 %or181.i.i, ptr %arrayidx182.i.i, align 8
  %72 = load i64, ptr %q.i1.i, align 8
  %conv5.i4.i = trunc i64 %72 to i32
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %q.i1.i)
  %arrayidx9.i = getelementptr inbounds nuw [10 x i8], ptr @Rcon, i32 0, i32 %k.0.i13
  %73 = load i8, ptr %arrayidx9.i, align 1
  %conv.i = zext i8 %73 to i32
  %xor.i = xor i32 %conv5.i4.i, %conv.i
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
  br i1 %exitcond.i3.not, label %for.cond27.i.preheader, label %for.body.i5, !llvm.loop !79

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
  %arrayidx1.i293.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %86 = load i64, ptr %arrayidx1.i293.i, align 8
  %and.i294.i = and i64 %85, 6148914691236517205
  %and2.i295.i = shl i64 %86, 1
  %shl.i296.i = and i64 %and2.i295.i, -6148914691236517206
  %or.i297.i = or disjoint i64 %and.i294.i, %shl.i296.i
  store i64 %or.i297.i, ptr %q.i, align 8
  %and4.i298.i = lshr i64 %85, 1
  %shr.i299.i = and i64 %and4.i298.i, 6148914691236517205
  %and5.i300.i = and i64 %86, -6148914691236517206
  %or6.i301.i = or disjoint i64 %shr.i299.i, %and5.i300.i
  %arrayidx7.i302.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or6.i301.i, ptr %arrayidx7.i302.i, align 8
  %arrayidx11.i303.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %87 = load i64, ptr %arrayidx11.i303.i, align 8
  %arrayidx12.i304.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %88 = load i64, ptr %arrayidx12.i304.i, align 8
  %and13.i305.i = and i64 %87, 6148914691236517205
  %and14.i306.i = shl i64 %88, 1
  %shl15.i307.i = and i64 %and14.i306.i, -6148914691236517206
  %or16.i308.i = or disjoint i64 %and13.i305.i, %shl15.i307.i
  %arrayidx17.i309.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or16.i308.i, ptr %arrayidx17.i309.i, align 8
  %and18.i310.i = lshr i64 %87, 1
  %shr19.i311.i = and i64 %and18.i310.i, 6148914691236517205
  %and20.i312.i = and i64 %88, -6148914691236517206
  %or21.i313.i = or disjoint i64 %shr19.i311.i, %and20.i312.i
  %arrayidx22.i314.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or21.i313.i, ptr %arrayidx22.i314.i, align 8
  %arrayidx27.i315.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %89 = load i64, ptr %arrayidx27.i315.i, align 8
  %arrayidx28.i316.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %90 = load i64, ptr %arrayidx28.i316.i, align 8
  %and29.i317.i = and i64 %89, 6148914691236517205
  %and30.i318.i = shl i64 %90, 1
  %shl31.i319.i = and i64 %and30.i318.i, -6148914691236517206
  %or32.i320.i = or disjoint i64 %and29.i317.i, %shl31.i319.i
  %arrayidx33.i321.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or32.i320.i, ptr %arrayidx33.i321.i, align 8
  %and34.i322.i = lshr i64 %89, 1
  %shr35.i323.i = and i64 %and34.i322.i, 6148914691236517205
  %and36.i324.i = and i64 %90, -6148914691236517206
  %or37.i325.i = or disjoint i64 %shr35.i323.i, %and36.i324.i
  %arrayidx38.i326.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or37.i325.i, ptr %arrayidx38.i326.i, align 8
  %arrayidx43.i327.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %91 = load i64, ptr %arrayidx43.i327.i, align 8
  %arrayidx44.i328.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %92 = load i64, ptr %arrayidx44.i328.i, align 8
  %and45.i329.i = and i64 %91, 6148914691236517205
  %and46.i330.i = shl i64 %92, 1
  %shl47.i331.i = and i64 %and46.i330.i, -6148914691236517206
  %or48.i332.i = or disjoint i64 %and45.i329.i, %shl47.i331.i
  %arrayidx49.i333.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or48.i332.i, ptr %arrayidx49.i333.i, align 8
  %and50.i334.i = lshr i64 %91, 1
  %shr51.i335.i = and i64 %and50.i334.i, 6148914691236517205
  %and52.i336.i = and i64 %92, -6148914691236517206
  %or53.i337.i = or disjoint i64 %shr51.i335.i, %and52.i336.i
  %arrayidx54.i338.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or53.i337.i, ptr %arrayidx54.i338.i, align 8
  %93 = load i64, ptr %q.i, align 8
  %arrayidx60.i339.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %94 = load i64, ptr %arrayidx60.i339.i, align 8
  %and61.i340.i = and i64 %93, 3689348814741910323
  %and62.i341.i = shl i64 %94, 2
  %shl63.i342.i = and i64 %and62.i341.i, -3689348814741910324
  %or64.i343.i = or disjoint i64 %and61.i340.i, %shl63.i342.i
  store i64 %or64.i343.i, ptr %q.i, align 8
  %and66.i344.i = lshr i64 %93, 2
  %shr67.i345.i = and i64 %and66.i344.i, 3689348814741910323
  %and68.i346.i = and i64 %94, -3689348814741910324
  %or69.i347.i = or disjoint i64 %shr67.i345.i, %and68.i346.i
  %arrayidx70.i348.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or69.i347.i, ptr %arrayidx70.i348.i, align 8
  %arrayidx75.i349.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %95 = load i64, ptr %arrayidx75.i349.i, align 8
  %arrayidx76.i350.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %96 = load i64, ptr %arrayidx76.i350.i, align 8
  %and77.i351.i = and i64 %95, 3689348814741910323
  %and78.i352.i = shl i64 %96, 2
  %shl79.i353.i = and i64 %and78.i352.i, -3689348814741910324
  %or80.i354.i = or disjoint i64 %and77.i351.i, %shl79.i353.i
  %arrayidx81.i355.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or80.i354.i, ptr %arrayidx81.i355.i, align 8
  %and82.i356.i = lshr i64 %95, 2
  %shr83.i357.i = and i64 %and82.i356.i, 3689348814741910323
  %and84.i358.i = and i64 %96, -3689348814741910324
  %or85.i359.i = or disjoint i64 %shr83.i357.i, %and84.i358.i
  %arrayidx86.i360.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or85.i359.i, ptr %arrayidx86.i360.i, align 8
  %arrayidx91.i361.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %97 = load i64, ptr %arrayidx91.i361.i, align 8
  %arrayidx92.i362.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %98 = load i64, ptr %arrayidx92.i362.i, align 8
  %and93.i363.i = and i64 %97, 3689348814741910323
  %and94.i364.i = shl i64 %98, 2
  %shl95.i365.i = and i64 %and94.i364.i, -3689348814741910324
  %or96.i366.i = or disjoint i64 %and93.i363.i, %shl95.i365.i
  %arrayidx97.i367.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or96.i366.i, ptr %arrayidx97.i367.i, align 8
  %and98.i368.i = lshr i64 %97, 2
  %shr99.i369.i = and i64 %and98.i368.i, 3689348814741910323
  %and100.i370.i = and i64 %98, -3689348814741910324
  %or101.i371.i = or disjoint i64 %shr99.i369.i, %and100.i370.i
  %arrayidx102.i372.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or101.i371.i, ptr %arrayidx102.i372.i, align 8
  %arrayidx107.i373.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %99 = load i64, ptr %arrayidx107.i373.i, align 8
  %arrayidx108.i374.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %100 = load i64, ptr %arrayidx108.i374.i, align 8
  %and109.i375.i = and i64 %99, 3689348814741910323
  %and110.i376.i = shl i64 %100, 2
  %shl111.i377.i = and i64 %and110.i376.i, -3689348814741910324
  %or112.i378.i = or disjoint i64 %and109.i375.i, %shl111.i377.i
  %arrayidx113.i379.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or112.i378.i, ptr %arrayidx113.i379.i, align 8
  %and114.i380.i = lshr i64 %99, 2
  %shr115.i381.i = and i64 %and114.i380.i, 3689348814741910323
  %and116.i382.i = and i64 %100, -3689348814741910324
  %or117.i383.i = or disjoint i64 %shr115.i381.i, %and116.i382.i
  %arrayidx118.i384.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or117.i383.i, ptr %arrayidx118.i384.i, align 8
  %101 = load i64, ptr %q.i, align 8
  %arrayidx124.i385.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %102 = load i64, ptr %arrayidx124.i385.i, align 8
  %and125.i386.i = and i64 %101, 1085102592571150095
  %and126.i387.i = shl i64 %102, 4
  %shl127.i388.i = and i64 %and126.i387.i, -1085102592571150096
  %or128.i389.i = or disjoint i64 %and125.i386.i, %shl127.i388.i
  store i64 %or128.i389.i, ptr %q.i, align 8
  %and130.i390.i = lshr i64 %101, 4
  %shr131.i391.i = and i64 %and130.i390.i, 1085102592571150095
  %and132.i392.i = and i64 %102, -1085102592571150096
  %or133.i393.i = or disjoint i64 %shr131.i391.i, %and132.i392.i
  %arrayidx134.i394.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or133.i393.i, ptr %arrayidx134.i394.i, align 8
  %arrayidx139.i395.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %103 = load i64, ptr %arrayidx139.i395.i, align 8
  %arrayidx140.i396.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %104 = load i64, ptr %arrayidx140.i396.i, align 8
  %and141.i397.i = and i64 %103, 1085102592571150095
  %and142.i398.i = shl i64 %104, 4
  %shl143.i399.i = and i64 %and142.i398.i, -1085102592571150096
  %or144.i400.i = or disjoint i64 %and141.i397.i, %shl143.i399.i
  %arrayidx145.i401.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or144.i400.i, ptr %arrayidx145.i401.i, align 8
  %and146.i402.i = lshr i64 %103, 4
  %shr147.i403.i = and i64 %and146.i402.i, 1085102592571150095
  %and148.i404.i = and i64 %104, -1085102592571150096
  %or149.i405.i = or disjoint i64 %shr147.i403.i, %and148.i404.i
  %arrayidx150.i406.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or149.i405.i, ptr %arrayidx150.i406.i, align 8
  %arrayidx155.i407.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %105 = load i64, ptr %arrayidx155.i407.i, align 8
  %arrayidx156.i408.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %106 = load i64, ptr %arrayidx156.i408.i, align 8
  %and157.i409.i = and i64 %105, 1085102592571150095
  %and158.i410.i = shl i64 %106, 4
  %shl159.i411.i = and i64 %and158.i410.i, -1085102592571150096
  %or160.i412.i = or disjoint i64 %and157.i409.i, %shl159.i411.i
  %arrayidx161.i413.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or160.i412.i, ptr %arrayidx161.i413.i, align 8
  %and162.i414.i = lshr i64 %105, 4
  %shr163.i415.i = and i64 %and162.i414.i, 1085102592571150095
  %and164.i416.i = and i64 %106, -1085102592571150096
  %or165.i417.i = or disjoint i64 %shr163.i415.i, %and164.i416.i
  %arrayidx166.i418.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or165.i417.i, ptr %arrayidx166.i418.i, align 8
  %arrayidx171.i419.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %107 = load i64, ptr %arrayidx171.i419.i, align 8
  %arrayidx172.i420.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %108 = load i64, ptr %arrayidx172.i420.i, align 8
  %and173.i421.i = and i64 %107, 1085102592571150095
  %and174.i422.i = shl i64 %108, 4
  %shl175.i423.i = and i64 %and174.i422.i, -1085102592571150096
  %or176.i424.i = or disjoint i64 %and173.i421.i, %shl175.i423.i
  %arrayidx177.i425.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or176.i424.i, ptr %arrayidx177.i425.i, align 8
  %and178.i426.i = lshr i64 %107, 4
  %shr179.i427.i = and i64 %and178.i426.i, 1085102592571150095
  %and180.i428.i = and i64 %108, -1085102592571150096
  %or181.i429.i = or disjoint i64 %shr179.i427.i, %and180.i428.i
  %arrayidx182.i430.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or181.i429.i, ptr %arrayidx182.i430.i, align 8
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
  br i1 %cmp28.i, label %for.body30.i, label %br_aes_ct64_keysched.exit, !llvm.loop !80

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
  br i1 %exitcond.i.not, label %br_aes_ct64_skey_expand.exit, label %for.body.i, !llvm.loop !81

br_aes_ct64_skey_expand.exit:                     ; preds = %for.body.i
  ret void
}

; Function Attrs: inlinehint nounwind
define dso_local void @aes128_ctr_keyexp(ptr noundef %r, ptr noundef %key) local_unnamed_addr #1 {
entry:
  %q.i1.i = alloca [8 x i64], align 8
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
  br i1 %cmp.not.i.i, label %br_range_dec32le.exit.i, label %while.body.i.i, !llvm.loop !82

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
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %q.i1.i)
  %call.i2.i = call ptr @memset(ptr noundef nonnull %q.i1.i, i32 noundef 0, i32 noundef 64) #8
  %conv.i3.i = zext i32 %5 to i64
  store i64 %conv.i3.i, ptr %q.i1.i, align 8
  %arrayidx1.i431.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  %6 = load i64, ptr %arrayidx1.i431.i, align 8
  %and.i432.i = and i64 %conv.i3.i, 1431655765
  %and2.i433.i = shl i64 %6, 1
  %shl.i434.i = and i64 %and2.i433.i, -6148914691236517206
  %or.i435.i = or disjoint i64 %and.i432.i, %shl.i434.i
  store i64 %or.i435.i, ptr %q.i1.i, align 8
  %and4.i436.i = lshr i64 %conv.i3.i, 1
  %shr.i437.i = and i64 %and4.i436.i, 1431655765
  %and5.i438.i = and i64 %6, -6148914691236517206
  %or6.i439.i = or disjoint i64 %shr.i437.i, %and5.i438.i
  %arrayidx7.i440.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  store i64 %or6.i439.i, ptr %arrayidx7.i440.i, align 8
  %arrayidx11.i441.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  %7 = load i64, ptr %arrayidx11.i441.i, align 8
  %arrayidx12.i442.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  %8 = load i64, ptr %arrayidx12.i442.i, align 8
  %and13.i443.i = and i64 %7, 6148914691236517205
  %and14.i444.i = shl i64 %8, 1
  %shl15.i445.i = and i64 %and14.i444.i, -6148914691236517206
  %or16.i446.i = or disjoint i64 %and13.i443.i, %shl15.i445.i
  %arrayidx17.i447.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  store i64 %or16.i446.i, ptr %arrayidx17.i447.i, align 8
  %and18.i448.i = lshr i64 %7, 1
  %shr19.i449.i = and i64 %and18.i448.i, 6148914691236517205
  %and20.i450.i = and i64 %8, -6148914691236517206
  %or21.i451.i = or disjoint i64 %shr19.i449.i, %and20.i450.i
  %arrayidx22.i452.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  store i64 %or21.i451.i, ptr %arrayidx22.i452.i, align 8
  %arrayidx27.i453.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  %9 = load i64, ptr %arrayidx27.i453.i, align 8
  %arrayidx28.i454.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  %10 = load i64, ptr %arrayidx28.i454.i, align 8
  %and29.i455.i = and i64 %9, 6148914691236517205
  %and30.i456.i = shl i64 %10, 1
  %shl31.i457.i = and i64 %and30.i456.i, -6148914691236517206
  %or32.i458.i = or disjoint i64 %and29.i455.i, %shl31.i457.i
  %arrayidx33.i459.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  store i64 %or32.i458.i, ptr %arrayidx33.i459.i, align 8
  %and34.i460.i = lshr i64 %9, 1
  %shr35.i461.i = and i64 %and34.i460.i, 6148914691236517205
  %and36.i462.i = and i64 %10, -6148914691236517206
  %or37.i463.i = or disjoint i64 %shr35.i461.i, %and36.i462.i
  %arrayidx38.i464.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  store i64 %or37.i463.i, ptr %arrayidx38.i464.i, align 8
  %arrayidx43.i465.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  %11 = load i64, ptr %arrayidx43.i465.i, align 8
  %arrayidx44.i466.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  %12 = load i64, ptr %arrayidx44.i466.i, align 8
  %and45.i467.i = and i64 %11, 6148914691236517205
  %and46.i468.i = shl i64 %12, 1
  %shl47.i469.i = and i64 %and46.i468.i, -6148914691236517206
  %or48.i470.i = or disjoint i64 %and45.i467.i, %shl47.i469.i
  %arrayidx49.i471.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  store i64 %or48.i470.i, ptr %arrayidx49.i471.i, align 8
  %and50.i472.i = lshr i64 %11, 1
  %shr51.i473.i = and i64 %and50.i472.i, 6148914691236517205
  %and52.i474.i = and i64 %12, -6148914691236517206
  %or53.i475.i = or disjoint i64 %shr51.i473.i, %and52.i474.i
  %arrayidx54.i476.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  store i64 %or53.i475.i, ptr %arrayidx54.i476.i, align 8
  %13 = load i64, ptr %q.i1.i, align 8
  %arrayidx60.i477.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  %14 = load i64, ptr %arrayidx60.i477.i, align 8
  %and61.i478.i = and i64 %13, 3689348814741910323
  %and62.i479.i = shl i64 %14, 2
  %shl63.i480.i = and i64 %and62.i479.i, -3689348814741910324
  %or64.i481.i = or disjoint i64 %and61.i478.i, %shl63.i480.i
  store i64 %or64.i481.i, ptr %q.i1.i, align 8
  %and66.i482.i = lshr i64 %13, 2
  %shr67.i483.i = and i64 %and66.i482.i, 3689348814741910323
  %and68.i484.i = and i64 %14, -3689348814741910324
  %or69.i485.i = or disjoint i64 %shr67.i483.i, %and68.i484.i
  %arrayidx70.i486.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  store i64 %or69.i485.i, ptr %arrayidx70.i486.i, align 8
  %arrayidx75.i487.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  %15 = load i64, ptr %arrayidx75.i487.i, align 8
  %arrayidx76.i488.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  %16 = load i64, ptr %arrayidx76.i488.i, align 8
  %and77.i489.i = and i64 %15, 3689348814741910323
  %and78.i490.i = shl i64 %16, 2
  %shl79.i491.i = and i64 %and78.i490.i, -3689348814741910324
  %or80.i492.i = or disjoint i64 %and77.i489.i, %shl79.i491.i
  %arrayidx81.i493.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  store i64 %or80.i492.i, ptr %arrayidx81.i493.i, align 8
  %and82.i494.i = lshr i64 %15, 2
  %shr83.i495.i = and i64 %and82.i494.i, 3689348814741910323
  %and84.i496.i = and i64 %16, -3689348814741910324
  %or85.i497.i = or disjoint i64 %shr83.i495.i, %and84.i496.i
  %arrayidx86.i498.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  store i64 %or85.i497.i, ptr %arrayidx86.i498.i, align 8
  %arrayidx91.i499.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  %17 = load i64, ptr %arrayidx91.i499.i, align 8
  %arrayidx92.i500.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  %18 = load i64, ptr %arrayidx92.i500.i, align 8
  %and93.i501.i = and i64 %17, 3689348814741910323
  %and94.i502.i = shl i64 %18, 2
  %shl95.i503.i = and i64 %and94.i502.i, -3689348814741910324
  %or96.i504.i = or disjoint i64 %and93.i501.i, %shl95.i503.i
  %arrayidx97.i505.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  store i64 %or96.i504.i, ptr %arrayidx97.i505.i, align 8
  %and98.i506.i = lshr i64 %17, 2
  %shr99.i507.i = and i64 %and98.i506.i, 3689348814741910323
  %and100.i508.i = and i64 %18, -3689348814741910324
  %or101.i509.i = or disjoint i64 %shr99.i507.i, %and100.i508.i
  %arrayidx102.i510.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  store i64 %or101.i509.i, ptr %arrayidx102.i510.i, align 8
  %arrayidx107.i511.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  %19 = load i64, ptr %arrayidx107.i511.i, align 8
  %arrayidx108.i512.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  %20 = load i64, ptr %arrayidx108.i512.i, align 8
  %and109.i513.i = and i64 %19, 3689348814741910323
  %and110.i514.i = shl i64 %20, 2
  %shl111.i515.i = and i64 %and110.i514.i, -3689348814741910324
  %or112.i516.i = or disjoint i64 %and109.i513.i, %shl111.i515.i
  %arrayidx113.i517.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  store i64 %or112.i516.i, ptr %arrayidx113.i517.i, align 8
  %and114.i518.i = lshr i64 %19, 2
  %shr115.i519.i = and i64 %and114.i518.i, 3689348814741910323
  %and116.i520.i = and i64 %20, -3689348814741910324
  %or117.i521.i = or disjoint i64 %shr115.i519.i, %and116.i520.i
  %arrayidx118.i522.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  store i64 %or117.i521.i, ptr %arrayidx118.i522.i, align 8
  %21 = load i64, ptr %q.i1.i, align 8
  %arrayidx124.i523.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  %22 = load i64, ptr %arrayidx124.i523.i, align 8
  %and125.i524.i = and i64 %21, 1085102592571150095
  %and126.i525.i = shl i64 %22, 4
  %shl127.i526.i = and i64 %and126.i525.i, -1085102592571150096
  %or128.i527.i = or disjoint i64 %and125.i524.i, %shl127.i526.i
  store i64 %or128.i527.i, ptr %q.i1.i, align 8
  %and130.i528.i = lshr i64 %21, 4
  %shr131.i529.i = and i64 %and130.i528.i, 1085102592571150095
  %and132.i530.i = and i64 %22, -1085102592571150096
  %or133.i531.i = or disjoint i64 %shr131.i529.i, %and132.i530.i
  %arrayidx134.i532.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  store i64 %or133.i531.i, ptr %arrayidx134.i532.i, align 8
  %arrayidx139.i533.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  %23 = load i64, ptr %arrayidx139.i533.i, align 8
  %arrayidx140.i534.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  %24 = load i64, ptr %arrayidx140.i534.i, align 8
  %and141.i535.i = and i64 %23, 1085102592571150095
  %and142.i536.i = shl i64 %24, 4
  %shl143.i537.i = and i64 %and142.i536.i, -1085102592571150096
  %or144.i538.i = or disjoint i64 %and141.i535.i, %shl143.i537.i
  %arrayidx145.i539.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  store i64 %or144.i538.i, ptr %arrayidx145.i539.i, align 8
  %and146.i540.i = lshr i64 %23, 4
  %shr147.i541.i = and i64 %and146.i540.i, 1085102592571150095
  %and148.i542.i = and i64 %24, -1085102592571150096
  %or149.i543.i = or disjoint i64 %shr147.i541.i, %and148.i542.i
  %arrayidx150.i544.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  store i64 %or149.i543.i, ptr %arrayidx150.i544.i, align 8
  %arrayidx155.i545.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  %25 = load i64, ptr %arrayidx155.i545.i, align 8
  %arrayidx156.i546.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  %26 = load i64, ptr %arrayidx156.i546.i, align 8
  %and157.i547.i = and i64 %25, 1085102592571150095
  %and158.i548.i = shl i64 %26, 4
  %shl159.i549.i = and i64 %and158.i548.i, -1085102592571150096
  %or160.i550.i = or disjoint i64 %and157.i547.i, %shl159.i549.i
  %arrayidx161.i551.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  store i64 %or160.i550.i, ptr %arrayidx161.i551.i, align 8
  %and162.i552.i = lshr i64 %25, 4
  %shr163.i553.i = and i64 %and162.i552.i, 1085102592571150095
  %and164.i554.i = and i64 %26, -1085102592571150096
  %or165.i555.i = or disjoint i64 %shr163.i553.i, %and164.i554.i
  %arrayidx166.i556.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  store i64 %or165.i555.i, ptr %arrayidx166.i556.i, align 8
  %arrayidx171.i557.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  %27 = load i64, ptr %arrayidx171.i557.i, align 8
  %arrayidx172.i558.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  %28 = load i64, ptr %arrayidx172.i558.i, align 8
  %and173.i559.i = and i64 %27, 1085102592571150095
  %and174.i560.i = shl i64 %28, 4
  %shl175.i561.i = and i64 %and174.i560.i, -1085102592571150096
  %or176.i562.i = or disjoint i64 %and173.i559.i, %shl175.i561.i
  %arrayidx177.i563.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  store i64 %or176.i562.i, ptr %arrayidx177.i563.i, align 8
  %and178.i564.i = lshr i64 %27, 4
  %shr179.i565.i = and i64 %and178.i564.i, 1085102592571150095
  %and180.i566.i = and i64 %28, -1085102592571150096
  %or181.i567.i = or disjoint i64 %shr179.i565.i, %and180.i566.i
  %arrayidx182.i568.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  store i64 %or181.i567.i, ptr %arrayidx182.i568.i, align 8
  %arrayidx1.i21.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  %29 = load i64, ptr %arrayidx1.i21.i, align 8
  %arrayidx2.i22.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  %30 = load i64, ptr %arrayidx2.i22.i, align 8
  %arrayidx3.i23.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  %31 = load i64, ptr %arrayidx3.i23.i, align 8
  %arrayidx4.i24.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  %32 = load i64, ptr %arrayidx4.i24.i, align 8
  %arrayidx5.i25.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  %33 = load i64, ptr %arrayidx5.i25.i, align 8
  %arrayidx6.i26.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  %34 = load i64, ptr %arrayidx6.i26.i, align 8
  %35 = load i64, ptr %q.i1.i, align 8
  %xor.i27.i = xor i64 %31, %33
  %xor8.i28.i = xor i64 %or181.i567.i, %34
  %xor9.i29.i = xor i64 %or181.i567.i, %31
  %xor10.i30.i = xor i64 %or181.i567.i, %33
  %xor11.i31.i = xor i64 %29, %30
  %xor12.i32.i = xor i64 %xor11.i31.i, %35
  %xor13.i33.i = xor i64 %xor12.i32.i, %31
  %xor14.i34.i = xor i64 %xor8.i28.i, %xor.i27.i
  %xor15.i35.i = xor i64 %xor12.i32.i, %or181.i567.i
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
  %43 = xor i64 %42, %or181.i567.i
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
  %arrayidx124.i132.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  store i64 %xor112.i124.i, ptr %arrayidx124.i132.i, align 8
  %arrayidx125.i133.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  store i64 %xor121.i130.i, ptr %arrayidx125.i133.i, align 8
  %arrayidx126.i134.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  store i64 %xor123.i131.i, ptr %arrayidx126.i134.i, align 8
  %arrayidx127.i135.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  store i64 %xor117.i127.i, ptr %arrayidx127.i135.i, align 8
  %arrayidx128.i136.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  store i64 %xor118.i128.i, ptr %arrayidx128.i136.i, align 8
  %arrayidx129.i137.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  store i64 %xor119.i129.i, ptr %arrayidx129.i137.i, align 8
  %arrayidx130.i138.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  store i64 %xor113.i125.i, ptr %arrayidx130.i138.i, align 8
  %and.i140.i = and i64 %xor115.i126.i, 6148914691236517205
  %and2.i.i = shl i64 %xor113.i125.i, 1
  %shl.i141.i = and i64 %and2.i.i, -6148914691236517206
  %or.i142.i = or disjoint i64 %and.i140.i, %shl.i141.i
  store i64 %or.i142.i, ptr %q.i1.i, align 8
  %and4.i.i = lshr i64 %xor115.i126.i, 1
  %shr.i.i = and i64 %and4.i.i, 6148914691236517205
  %and5.i.i = and i64 %xor113.i125.i, -6148914691236517206
  %or6.i143.i = or disjoint i64 %shr.i.i, %and5.i.i
  %arrayidx7.i144.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  store i64 %or6.i143.i, ptr %arrayidx7.i144.i, align 8
  %arrayidx11.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  %50 = load i64, ptr %arrayidx11.i.i, align 8
  %arrayidx12.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  %51 = load i64, ptr %arrayidx12.i.i, align 8
  %and13.i145.i = and i64 %50, 6148914691236517205
  %and14.i146.i = shl i64 %51, 1
  %shl15.i.i = and i64 %and14.i146.i, -6148914691236517206
  %or16.i.i = or disjoint i64 %and13.i145.i, %shl15.i.i
  %arrayidx17.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  store i64 %or16.i.i, ptr %arrayidx17.i.i, align 8
  %and18.i.i = lshr i64 %50, 1
  %shr19.i.i = and i64 %and18.i.i, 6148914691236517205
  %and20.i.i = and i64 %51, -6148914691236517206
  %or21.i.i = or disjoint i64 %shr19.i.i, %and20.i.i
  %arrayidx22.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  store i64 %or21.i.i, ptr %arrayidx22.i.i, align 8
  %arrayidx27.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  %52 = load i64, ptr %arrayidx27.i.i, align 8
  %arrayidx28.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  %53 = load i64, ptr %arrayidx28.i.i, align 8
  %and29.i.i = and i64 %52, 6148914691236517205
  %and30.i147.i = shl i64 %53, 1
  %shl31.i.i = and i64 %and30.i147.i, -6148914691236517206
  %or32.i.i = or disjoint i64 %and29.i.i, %shl31.i.i
  %arrayidx33.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  store i64 %or32.i.i, ptr %arrayidx33.i.i, align 8
  %and34.i148.i = lshr i64 %52, 1
  %shr35.i.i = and i64 %and34.i148.i, 6148914691236517205
  %and36.i.i = and i64 %53, -6148914691236517206
  %or37.i.i = or disjoint i64 %shr35.i.i, %and36.i.i
  %arrayidx38.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  store i64 %or37.i.i, ptr %arrayidx38.i.i, align 8
  %arrayidx43.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  %54 = load i64, ptr %arrayidx43.i.i, align 8
  %arrayidx44.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  %55 = load i64, ptr %arrayidx44.i.i, align 8
  %and45.i.i = and i64 %54, 6148914691236517205
  %and46.i.i = shl i64 %55, 1
  %shl47.i.i = and i64 %and46.i.i, -6148914691236517206
  %or48.i.i = or disjoint i64 %and45.i.i, %shl47.i.i
  %arrayidx49.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  store i64 %or48.i.i, ptr %arrayidx49.i.i, align 8
  %and50.i.i = lshr i64 %54, 1
  %shr51.i.i = and i64 %and50.i.i, 6148914691236517205
  %and52.i.i = and i64 %55, -6148914691236517206
  %or53.i.i = or disjoint i64 %shr51.i.i, %and52.i.i
  %arrayidx54.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  store i64 %or53.i.i, ptr %arrayidx54.i.i, align 8
  %56 = load i64, ptr %q.i1.i, align 8
  %arrayidx60.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  %57 = load i64, ptr %arrayidx60.i.i, align 8
  %and61.i.i = and i64 %56, 3689348814741910323
  %and62.i.i = shl i64 %57, 2
  %shl63.i.i = and i64 %and62.i.i, -3689348814741910324
  %or64.i.i = or disjoint i64 %and61.i.i, %shl63.i.i
  store i64 %or64.i.i, ptr %q.i1.i, align 8
  %and66.i149.i = lshr i64 %56, 2
  %shr67.i.i = and i64 %and66.i149.i, 3689348814741910323
  %and68.i.i = and i64 %57, -3689348814741910324
  %or69.i.i = or disjoint i64 %shr67.i.i, %and68.i.i
  %arrayidx70.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  store i64 %or69.i.i, ptr %arrayidx70.i.i, align 8
  %arrayidx75.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  %58 = load i64, ptr %arrayidx75.i.i, align 8
  %arrayidx76.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  %59 = load i64, ptr %arrayidx76.i.i, align 8
  %and77.i150.i = and i64 %58, 3689348814741910323
  %and78.i151.i = shl i64 %59, 2
  %shl79.i.i = and i64 %and78.i151.i, -3689348814741910324
  %or80.i.i = or disjoint i64 %and77.i150.i, %shl79.i.i
  %arrayidx81.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  store i64 %or80.i.i, ptr %arrayidx81.i.i, align 8
  %and82.i152.i = lshr i64 %58, 2
  %shr83.i.i = and i64 %and82.i152.i, 3689348814741910323
  %and84.i153.i = and i64 %59, -3689348814741910324
  %or85.i.i = or disjoint i64 %shr83.i.i, %and84.i153.i
  %arrayidx86.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  store i64 %or85.i.i, ptr %arrayidx86.i.i, align 8
  %arrayidx91.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  %60 = load i64, ptr %arrayidx91.i.i, align 8
  %arrayidx92.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  %61 = load i64, ptr %arrayidx92.i.i, align 8
  %and93.i.i = and i64 %60, 3689348814741910323
  %and94.i.i = shl i64 %61, 2
  %shl95.i.i = and i64 %and94.i.i, -3689348814741910324
  %or96.i.i = or disjoint i64 %and93.i.i, %shl95.i.i
  %arrayidx97.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  store i64 %or96.i.i, ptr %arrayidx97.i.i, align 8
  %and98.i.i = lshr i64 %60, 2
  %shr99.i.i = and i64 %and98.i.i, 3689348814741910323
  %and100.i.i = and i64 %61, -3689348814741910324
  %or101.i.i = or disjoint i64 %shr99.i.i, %and100.i.i
  %arrayidx102.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  store i64 %or101.i.i, ptr %arrayidx102.i.i, align 8
  %arrayidx107.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  %62 = load i64, ptr %arrayidx107.i.i, align 8
  %arrayidx108.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  %63 = load i64, ptr %arrayidx108.i.i, align 8
  %and109.i.i = and i64 %62, 3689348814741910323
  %and110.i.i = shl i64 %63, 2
  %shl111.i.i = and i64 %and110.i.i, -3689348814741910324
  %or112.i.i = or disjoint i64 %and109.i.i, %shl111.i.i
  %arrayidx113.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  store i64 %or112.i.i, ptr %arrayidx113.i.i, align 8
  %and114.i.i = lshr i64 %62, 2
  %shr115.i.i = and i64 %and114.i.i, 3689348814741910323
  %and116.i.i = and i64 %63, -3689348814741910324
  %or117.i.i = or disjoint i64 %shr115.i.i, %and116.i.i
  %arrayidx118.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  store i64 %or117.i.i, ptr %arrayidx118.i.i, align 8
  %64 = load i64, ptr %q.i1.i, align 8
  %arrayidx124.i154.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  %65 = load i64, ptr %arrayidx124.i154.i, align 8
  %and125.i.i = and i64 %64, 1085102592571150095
  %and126.i.i = shl i64 %65, 4
  %shl127.i.i = and i64 %and126.i.i, -1085102592571150096
  %or128.i.i = or disjoint i64 %and125.i.i, %shl127.i.i
  store i64 %or128.i.i, ptr %q.i1.i, align 8
  %and130.i.i = lshr i64 %64, 4
  %shr131.i.i = and i64 %and130.i.i, 1085102592571150095
  %and132.i.i = and i64 %65, -1085102592571150096
  %or133.i.i = or disjoint i64 %shr131.i.i, %and132.i.i
  %arrayidx134.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  store i64 %or133.i.i, ptr %arrayidx134.i.i, align 8
  %arrayidx139.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  %66 = load i64, ptr %arrayidx139.i.i, align 8
  %arrayidx140.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  %67 = load i64, ptr %arrayidx140.i.i, align 8
  %and141.i.i = and i64 %66, 1085102592571150095
  %and142.i.i = shl i64 %67, 4
  %shl143.i.i = and i64 %and142.i.i, -1085102592571150096
  %or144.i.i = or disjoint i64 %and141.i.i, %shl143.i.i
  %arrayidx145.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  store i64 %or144.i.i, ptr %arrayidx145.i.i, align 8
  %and146.i.i = lshr i64 %66, 4
  %shr147.i.i = and i64 %and146.i.i, 1085102592571150095
  %and148.i.i = and i64 %67, -1085102592571150096
  %or149.i.i = or disjoint i64 %shr147.i.i, %and148.i.i
  %arrayidx150.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  store i64 %or149.i.i, ptr %arrayidx150.i.i, align 8
  %arrayidx155.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  %68 = load i64, ptr %arrayidx155.i.i, align 8
  %arrayidx156.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  %69 = load i64, ptr %arrayidx156.i.i, align 8
  %and157.i.i = and i64 %68, 1085102592571150095
  %and158.i.i = shl i64 %69, 4
  %shl159.i.i = and i64 %and158.i.i, -1085102592571150096
  %or160.i.i = or disjoint i64 %and157.i.i, %shl159.i.i
  %arrayidx161.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  store i64 %or160.i.i, ptr %arrayidx161.i.i, align 8
  %and162.i.i = lshr i64 %68, 4
  %shr163.i.i = and i64 %and162.i.i, 1085102592571150095
  %and164.i.i = and i64 %69, -1085102592571150096
  %or165.i.i = or disjoint i64 %shr163.i.i, %and164.i.i
  %arrayidx166.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  store i64 %or165.i.i, ptr %arrayidx166.i.i, align 8
  %arrayidx171.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  %70 = load i64, ptr %arrayidx171.i.i, align 8
  %arrayidx172.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  %71 = load i64, ptr %arrayidx172.i.i, align 8
  %and173.i.i = and i64 %70, 1085102592571150095
  %and174.i.i = shl i64 %71, 4
  %shl175.i.i = and i64 %and174.i.i, -1085102592571150096
  %or176.i.i = or disjoint i64 %and173.i.i, %shl175.i.i
  %arrayidx177.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  store i64 %or176.i.i, ptr %arrayidx177.i.i, align 8
  %and178.i.i = lshr i64 %70, 4
  %shr179.i.i = and i64 %and178.i.i, 1085102592571150095
  %and180.i.i = and i64 %71, -1085102592571150096
  %or181.i.i = or disjoint i64 %shr179.i.i, %and180.i.i
  %arrayidx182.i.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  store i64 %or181.i.i, ptr %arrayidx182.i.i, align 8
  %72 = load i64, ptr %q.i1.i, align 8
  %conv5.i4.i = trunc i64 %72 to i32
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %q.i1.i)
  %arrayidx9.i = getelementptr inbounds nuw [10 x i8], ptr @Rcon, i32 0, i32 %k.0.i15
  %73 = load i8, ptr %arrayidx9.i, align 1
  %conv.i = zext i8 %73 to i32
  %xor.i = xor i32 %conv5.i4.i, %conv.i
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
  br i1 %exitcond.i4.not, label %for.cond27.i.preheader, label %for.body.i6, !llvm.loop !83

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
  %arrayidx1.i293.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %86 = load i64, ptr %arrayidx1.i293.i, align 8
  %and.i294.i = and i64 %85, 6148914691236517205
  %and2.i295.i = shl i64 %86, 1
  %shl.i296.i = and i64 %and2.i295.i, -6148914691236517206
  %or.i297.i = or disjoint i64 %and.i294.i, %shl.i296.i
  store i64 %or.i297.i, ptr %q.i, align 8
  %and4.i298.i = lshr i64 %85, 1
  %shr.i299.i = and i64 %and4.i298.i, 6148914691236517205
  %and5.i300.i = and i64 %86, -6148914691236517206
  %or6.i301.i = or disjoint i64 %shr.i299.i, %and5.i300.i
  %arrayidx7.i302.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or6.i301.i, ptr %arrayidx7.i302.i, align 8
  %arrayidx11.i303.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %87 = load i64, ptr %arrayidx11.i303.i, align 8
  %arrayidx12.i304.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %88 = load i64, ptr %arrayidx12.i304.i, align 8
  %and13.i305.i = and i64 %87, 6148914691236517205
  %and14.i306.i = shl i64 %88, 1
  %shl15.i307.i = and i64 %and14.i306.i, -6148914691236517206
  %or16.i308.i = or disjoint i64 %and13.i305.i, %shl15.i307.i
  %arrayidx17.i309.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or16.i308.i, ptr %arrayidx17.i309.i, align 8
  %and18.i310.i = lshr i64 %87, 1
  %shr19.i311.i = and i64 %and18.i310.i, 6148914691236517205
  %and20.i312.i = and i64 %88, -6148914691236517206
  %or21.i313.i = or disjoint i64 %shr19.i311.i, %and20.i312.i
  %arrayidx22.i314.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or21.i313.i, ptr %arrayidx22.i314.i, align 8
  %arrayidx27.i315.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %89 = load i64, ptr %arrayidx27.i315.i, align 8
  %arrayidx28.i316.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %90 = load i64, ptr %arrayidx28.i316.i, align 8
  %and29.i317.i = and i64 %89, 6148914691236517205
  %and30.i318.i = shl i64 %90, 1
  %shl31.i319.i = and i64 %and30.i318.i, -6148914691236517206
  %or32.i320.i = or disjoint i64 %and29.i317.i, %shl31.i319.i
  %arrayidx33.i321.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or32.i320.i, ptr %arrayidx33.i321.i, align 8
  %and34.i322.i = lshr i64 %89, 1
  %shr35.i323.i = and i64 %and34.i322.i, 6148914691236517205
  %and36.i324.i = and i64 %90, -6148914691236517206
  %or37.i325.i = or disjoint i64 %shr35.i323.i, %and36.i324.i
  %arrayidx38.i326.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or37.i325.i, ptr %arrayidx38.i326.i, align 8
  %arrayidx43.i327.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %91 = load i64, ptr %arrayidx43.i327.i, align 8
  %arrayidx44.i328.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %92 = load i64, ptr %arrayidx44.i328.i, align 8
  %and45.i329.i = and i64 %91, 6148914691236517205
  %and46.i330.i = shl i64 %92, 1
  %shl47.i331.i = and i64 %and46.i330.i, -6148914691236517206
  %or48.i332.i = or disjoint i64 %and45.i329.i, %shl47.i331.i
  %arrayidx49.i333.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or48.i332.i, ptr %arrayidx49.i333.i, align 8
  %and50.i334.i = lshr i64 %91, 1
  %shr51.i335.i = and i64 %and50.i334.i, 6148914691236517205
  %and52.i336.i = and i64 %92, -6148914691236517206
  %or53.i337.i = or disjoint i64 %shr51.i335.i, %and52.i336.i
  %arrayidx54.i338.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or53.i337.i, ptr %arrayidx54.i338.i, align 8
  %93 = load i64, ptr %q.i, align 8
  %arrayidx60.i339.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %94 = load i64, ptr %arrayidx60.i339.i, align 8
  %and61.i340.i = and i64 %93, 3689348814741910323
  %and62.i341.i = shl i64 %94, 2
  %shl63.i342.i = and i64 %and62.i341.i, -3689348814741910324
  %or64.i343.i = or disjoint i64 %and61.i340.i, %shl63.i342.i
  store i64 %or64.i343.i, ptr %q.i, align 8
  %and66.i344.i = lshr i64 %93, 2
  %shr67.i345.i = and i64 %and66.i344.i, 3689348814741910323
  %and68.i346.i = and i64 %94, -3689348814741910324
  %or69.i347.i = or disjoint i64 %shr67.i345.i, %and68.i346.i
  %arrayidx70.i348.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or69.i347.i, ptr %arrayidx70.i348.i, align 8
  %arrayidx75.i349.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %95 = load i64, ptr %arrayidx75.i349.i, align 8
  %arrayidx76.i350.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %96 = load i64, ptr %arrayidx76.i350.i, align 8
  %and77.i351.i = and i64 %95, 3689348814741910323
  %and78.i352.i = shl i64 %96, 2
  %shl79.i353.i = and i64 %and78.i352.i, -3689348814741910324
  %or80.i354.i = or disjoint i64 %and77.i351.i, %shl79.i353.i
  %arrayidx81.i355.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or80.i354.i, ptr %arrayidx81.i355.i, align 8
  %and82.i356.i = lshr i64 %95, 2
  %shr83.i357.i = and i64 %and82.i356.i, 3689348814741910323
  %and84.i358.i = and i64 %96, -3689348814741910324
  %or85.i359.i = or disjoint i64 %shr83.i357.i, %and84.i358.i
  %arrayidx86.i360.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or85.i359.i, ptr %arrayidx86.i360.i, align 8
  %arrayidx91.i361.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %97 = load i64, ptr %arrayidx91.i361.i, align 8
  %arrayidx92.i362.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %98 = load i64, ptr %arrayidx92.i362.i, align 8
  %and93.i363.i = and i64 %97, 3689348814741910323
  %and94.i364.i = shl i64 %98, 2
  %shl95.i365.i = and i64 %and94.i364.i, -3689348814741910324
  %or96.i366.i = or disjoint i64 %and93.i363.i, %shl95.i365.i
  %arrayidx97.i367.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or96.i366.i, ptr %arrayidx97.i367.i, align 8
  %and98.i368.i = lshr i64 %97, 2
  %shr99.i369.i = and i64 %and98.i368.i, 3689348814741910323
  %and100.i370.i = and i64 %98, -3689348814741910324
  %or101.i371.i = or disjoint i64 %shr99.i369.i, %and100.i370.i
  %arrayidx102.i372.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or101.i371.i, ptr %arrayidx102.i372.i, align 8
  %arrayidx107.i373.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %99 = load i64, ptr %arrayidx107.i373.i, align 8
  %arrayidx108.i374.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %100 = load i64, ptr %arrayidx108.i374.i, align 8
  %and109.i375.i = and i64 %99, 3689348814741910323
  %and110.i376.i = shl i64 %100, 2
  %shl111.i377.i = and i64 %and110.i376.i, -3689348814741910324
  %or112.i378.i = or disjoint i64 %and109.i375.i, %shl111.i377.i
  %arrayidx113.i379.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or112.i378.i, ptr %arrayidx113.i379.i, align 8
  %and114.i380.i = lshr i64 %99, 2
  %shr115.i381.i = and i64 %and114.i380.i, 3689348814741910323
  %and116.i382.i = and i64 %100, -3689348814741910324
  %or117.i383.i = or disjoint i64 %shr115.i381.i, %and116.i382.i
  %arrayidx118.i384.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or117.i383.i, ptr %arrayidx118.i384.i, align 8
  %101 = load i64, ptr %q.i, align 8
  %arrayidx124.i385.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %102 = load i64, ptr %arrayidx124.i385.i, align 8
  %and125.i386.i = and i64 %101, 1085102592571150095
  %and126.i387.i = shl i64 %102, 4
  %shl127.i388.i = and i64 %and126.i387.i, -1085102592571150096
  %or128.i389.i = or disjoint i64 %and125.i386.i, %shl127.i388.i
  store i64 %or128.i389.i, ptr %q.i, align 8
  %and130.i390.i = lshr i64 %101, 4
  %shr131.i391.i = and i64 %and130.i390.i, 1085102592571150095
  %and132.i392.i = and i64 %102, -1085102592571150096
  %or133.i393.i = or disjoint i64 %shr131.i391.i, %and132.i392.i
  %arrayidx134.i394.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or133.i393.i, ptr %arrayidx134.i394.i, align 8
  %arrayidx139.i395.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %103 = load i64, ptr %arrayidx139.i395.i, align 8
  %arrayidx140.i396.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %104 = load i64, ptr %arrayidx140.i396.i, align 8
  %and141.i397.i = and i64 %103, 1085102592571150095
  %and142.i398.i = shl i64 %104, 4
  %shl143.i399.i = and i64 %and142.i398.i, -1085102592571150096
  %or144.i400.i = or disjoint i64 %and141.i397.i, %shl143.i399.i
  %arrayidx145.i401.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or144.i400.i, ptr %arrayidx145.i401.i, align 8
  %and146.i402.i = lshr i64 %103, 4
  %shr147.i403.i = and i64 %and146.i402.i, 1085102592571150095
  %and148.i404.i = and i64 %104, -1085102592571150096
  %or149.i405.i = or disjoint i64 %shr147.i403.i, %and148.i404.i
  %arrayidx150.i406.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or149.i405.i, ptr %arrayidx150.i406.i, align 8
  %arrayidx155.i407.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %105 = load i64, ptr %arrayidx155.i407.i, align 8
  %arrayidx156.i408.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %106 = load i64, ptr %arrayidx156.i408.i, align 8
  %and157.i409.i = and i64 %105, 1085102592571150095
  %and158.i410.i = shl i64 %106, 4
  %shl159.i411.i = and i64 %and158.i410.i, -1085102592571150096
  %or160.i412.i = or disjoint i64 %and157.i409.i, %shl159.i411.i
  %arrayidx161.i413.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or160.i412.i, ptr %arrayidx161.i413.i, align 8
  %and162.i414.i = lshr i64 %105, 4
  %shr163.i415.i = and i64 %and162.i414.i, 1085102592571150095
  %and164.i416.i = and i64 %106, -1085102592571150096
  %or165.i417.i = or disjoint i64 %shr163.i415.i, %and164.i416.i
  %arrayidx166.i418.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or165.i417.i, ptr %arrayidx166.i418.i, align 8
  %arrayidx171.i419.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %107 = load i64, ptr %arrayidx171.i419.i, align 8
  %arrayidx172.i420.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %108 = load i64, ptr %arrayidx172.i420.i, align 8
  %and173.i421.i = and i64 %107, 1085102592571150095
  %and174.i422.i = shl i64 %108, 4
  %shl175.i423.i = and i64 %and174.i422.i, -1085102592571150096
  %or176.i424.i = or disjoint i64 %and173.i421.i, %shl175.i423.i
  %arrayidx177.i425.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or176.i424.i, ptr %arrayidx177.i425.i, align 8
  %and178.i426.i = lshr i64 %107, 4
  %shr179.i427.i = and i64 %and178.i426.i, 1085102592571150095
  %and180.i428.i = and i64 %108, -1085102592571150096
  %or181.i429.i = or disjoint i64 %shr179.i427.i, %and180.i428.i
  %arrayidx182.i430.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or181.i429.i, ptr %arrayidx182.i430.i, align 8
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
  br i1 %cmp28.i, label %for.body30.i, label %br_aes_ct64_keysched.exit, !llvm.loop !84

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
  br i1 %exitcond.i.not, label %br_aes_ct64_skey_expand.exit, label %for.body.i, !llvm.loop !85

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
  br i1 %cmp.not.i.i, label %br_range_dec32le.exit.i, label %while.body.i.i, !llvm.loop !86

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
  br i1 %exitcond.i.not, label %for.end.i, label %for.body.i27, !llvm.loop !87

for.end.i:                                        ; preds = %for.body.i27
  %13 = load i64, ptr %q.i, align 8
  %arrayidx1.i268.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %14 = load i64, ptr %arrayidx1.i268.i, align 8
  %and.i269.i = and i64 %13, 6148914691236517205
  %and2.i270.i = shl i64 %14, 1
  %shl.i271.i = and i64 %and2.i270.i, -6148914691236517206
  %or.i272.i = or disjoint i64 %and.i269.i, %shl.i271.i
  store i64 %or.i272.i, ptr %q.i, align 8
  %and4.i273.i = lshr i64 %13, 1
  %shr.i274.i = and i64 %and4.i273.i, 6148914691236517205
  %and5.i275.i = and i64 %14, -6148914691236517206
  %or6.i276.i = or disjoint i64 %shr.i274.i, %and5.i275.i
  %arrayidx7.i277.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or6.i276.i, ptr %arrayidx7.i277.i, align 8
  %arrayidx11.i278.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %15 = load i64, ptr %arrayidx11.i278.i, align 8
  %arrayidx12.i279.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %16 = load i64, ptr %arrayidx12.i279.i, align 8
  %and13.i280.i = and i64 %15, 6148914691236517205
  %and14.i281.i = shl i64 %16, 1
  %shl15.i282.i = and i64 %and14.i281.i, -6148914691236517206
  %or16.i283.i = or disjoint i64 %and13.i280.i, %shl15.i282.i
  %arrayidx17.i284.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or16.i283.i, ptr %arrayidx17.i284.i, align 8
  %and18.i285.i = lshr i64 %15, 1
  %shr19.i286.i = and i64 %and18.i285.i, 6148914691236517205
  %and20.i287.i = and i64 %16, -6148914691236517206
  %or21.i288.i = or disjoint i64 %shr19.i286.i, %and20.i287.i
  %arrayidx22.i289.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or21.i288.i, ptr %arrayidx22.i289.i, align 8
  %arrayidx27.i290.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %17 = load i64, ptr %arrayidx27.i290.i, align 8
  %arrayidx28.i291.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %18 = load i64, ptr %arrayidx28.i291.i, align 8
  %and29.i292.i = and i64 %17, 6148914691236517205
  %and30.i293.i = shl i64 %18, 1
  %shl31.i294.i = and i64 %and30.i293.i, -6148914691236517206
  %or32.i295.i = or disjoint i64 %and29.i292.i, %shl31.i294.i
  %arrayidx33.i296.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or32.i295.i, ptr %arrayidx33.i296.i, align 8
  %and34.i297.i = lshr i64 %17, 1
  %shr35.i298.i = and i64 %and34.i297.i, 6148914691236517205
  %and36.i299.i = and i64 %18, -6148914691236517206
  %or37.i300.i = or disjoint i64 %shr35.i298.i, %and36.i299.i
  %arrayidx38.i301.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or37.i300.i, ptr %arrayidx38.i301.i, align 8
  %arrayidx43.i302.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %19 = load i64, ptr %arrayidx43.i302.i, align 8
  %arrayidx44.i303.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %20 = load i64, ptr %arrayidx44.i303.i, align 8
  %and45.i304.i = and i64 %19, 6148914691236517205
  %and46.i305.i = shl i64 %20, 1
  %shl47.i306.i = and i64 %and46.i305.i, -6148914691236517206
  %or48.i307.i = or disjoint i64 %and45.i304.i, %shl47.i306.i
  %arrayidx49.i308.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or48.i307.i, ptr %arrayidx49.i308.i, align 8
  %and50.i309.i = lshr i64 %19, 1
  %shr51.i310.i = and i64 %and50.i309.i, 6148914691236517205
  %and52.i311.i = and i64 %20, -6148914691236517206
  %or53.i312.i = or disjoint i64 %shr51.i310.i, %and52.i311.i
  %arrayidx54.i313.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or53.i312.i, ptr %arrayidx54.i313.i, align 8
  %21 = load i64, ptr %q.i, align 8
  %arrayidx60.i314.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %22 = load i64, ptr %arrayidx60.i314.i, align 8
  %and61.i315.i = and i64 %21, 3689348814741910323
  %and62.i316.i = shl i64 %22, 2
  %shl63.i317.i = and i64 %and62.i316.i, -3689348814741910324
  %or64.i318.i = or disjoint i64 %and61.i315.i, %shl63.i317.i
  store i64 %or64.i318.i, ptr %q.i, align 8
  %and66.i319.i = lshr i64 %21, 2
  %shr67.i320.i = and i64 %and66.i319.i, 3689348814741910323
  %and68.i321.i = and i64 %22, -3689348814741910324
  %or69.i322.i = or disjoint i64 %shr67.i320.i, %and68.i321.i
  %arrayidx70.i323.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or69.i322.i, ptr %arrayidx70.i323.i, align 8
  %arrayidx75.i324.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %23 = load i64, ptr %arrayidx75.i324.i, align 8
  %arrayidx76.i325.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %24 = load i64, ptr %arrayidx76.i325.i, align 8
  %and77.i326.i = and i64 %23, 3689348814741910323
  %and78.i327.i = shl i64 %24, 2
  %shl79.i328.i = and i64 %and78.i327.i, -3689348814741910324
  %or80.i329.i = or disjoint i64 %and77.i326.i, %shl79.i328.i
  %arrayidx81.i330.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or80.i329.i, ptr %arrayidx81.i330.i, align 8
  %and82.i331.i = lshr i64 %23, 2
  %shr83.i332.i = and i64 %and82.i331.i, 3689348814741910323
  %and84.i333.i = and i64 %24, -3689348814741910324
  %or85.i334.i = or disjoint i64 %shr83.i332.i, %and84.i333.i
  %arrayidx86.i335.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or85.i334.i, ptr %arrayidx86.i335.i, align 8
  %arrayidx91.i336.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %25 = load i64, ptr %arrayidx91.i336.i, align 8
  %arrayidx92.i337.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %26 = load i64, ptr %arrayidx92.i337.i, align 8
  %and93.i338.i = and i64 %25, 3689348814741910323
  %and94.i339.i = shl i64 %26, 2
  %shl95.i340.i = and i64 %and94.i339.i, -3689348814741910324
  %or96.i341.i = or disjoint i64 %and93.i338.i, %shl95.i340.i
  %arrayidx97.i342.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or96.i341.i, ptr %arrayidx97.i342.i, align 8
  %and98.i343.i = lshr i64 %25, 2
  %shr99.i344.i = and i64 %and98.i343.i, 3689348814741910323
  %and100.i345.i = and i64 %26, -3689348814741910324
  %or101.i346.i = or disjoint i64 %shr99.i344.i, %and100.i345.i
  %arrayidx102.i347.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or101.i346.i, ptr %arrayidx102.i347.i, align 8
  %arrayidx107.i348.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %27 = load i64, ptr %arrayidx107.i348.i, align 8
  %arrayidx108.i349.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %28 = load i64, ptr %arrayidx108.i349.i, align 8
  %and109.i350.i = and i64 %27, 3689348814741910323
  %and110.i351.i = shl i64 %28, 2
  %shl111.i352.i = and i64 %and110.i351.i, -3689348814741910324
  %or112.i353.i = or disjoint i64 %and109.i350.i, %shl111.i352.i
  %arrayidx113.i354.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or112.i353.i, ptr %arrayidx113.i354.i, align 8
  %and114.i355.i = lshr i64 %27, 2
  %shr115.i356.i = and i64 %and114.i355.i, 3689348814741910323
  %and116.i357.i = and i64 %28, -3689348814741910324
  %or117.i358.i = or disjoint i64 %shr115.i356.i, %and116.i357.i
  %arrayidx118.i359.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or117.i358.i, ptr %arrayidx118.i359.i, align 8
  %29 = load i64, ptr %q.i, align 8
  %arrayidx124.i360.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %30 = load i64, ptr %arrayidx124.i360.i, align 8
  %and125.i361.i = and i64 %29, 1085102592571150095
  %and126.i362.i = shl i64 %30, 4
  %shl127.i363.i = and i64 %and126.i362.i, -1085102592571150096
  %or128.i364.i = or disjoint i64 %and125.i361.i, %shl127.i363.i
  store i64 %or128.i364.i, ptr %q.i, align 8
  %and130.i365.i = lshr i64 %29, 4
  %shr131.i366.i = and i64 %and130.i365.i, 1085102592571150095
  %and132.i367.i = and i64 %30, -1085102592571150096
  %or133.i368.i = or disjoint i64 %shr131.i366.i, %and132.i367.i
  %arrayidx134.i369.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or133.i368.i, ptr %arrayidx134.i369.i, align 8
  %arrayidx139.i370.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %31 = load i64, ptr %arrayidx139.i370.i, align 8
  %arrayidx140.i371.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %32 = load i64, ptr %arrayidx140.i371.i, align 8
  %and141.i372.i = and i64 %31, 1085102592571150095
  %and142.i373.i = shl i64 %32, 4
  %shl143.i374.i = and i64 %and142.i373.i, -1085102592571150096
  %or144.i375.i = or disjoint i64 %and141.i372.i, %shl143.i374.i
  %arrayidx145.i376.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or144.i375.i, ptr %arrayidx145.i376.i, align 8
  %and146.i377.i = lshr i64 %31, 4
  %shr147.i378.i = and i64 %and146.i377.i, 1085102592571150095
  %and148.i379.i = and i64 %32, -1085102592571150096
  %or149.i380.i = or disjoint i64 %shr147.i378.i, %and148.i379.i
  %arrayidx150.i381.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or149.i380.i, ptr %arrayidx150.i381.i, align 8
  %arrayidx155.i382.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %33 = load i64, ptr %arrayidx155.i382.i, align 8
  %arrayidx156.i383.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %34 = load i64, ptr %arrayidx156.i383.i, align 8
  %and157.i384.i = and i64 %33, 1085102592571150095
  %and158.i385.i = shl i64 %34, 4
  %shl159.i386.i = and i64 %and158.i385.i, -1085102592571150096
  %or160.i387.i = or disjoint i64 %and157.i384.i, %shl159.i386.i
  %arrayidx161.i388.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or160.i387.i, ptr %arrayidx161.i388.i, align 8
  %and162.i389.i = lshr i64 %33, 4
  %shr163.i390.i = and i64 %and162.i389.i, 1085102592571150095
  %and164.i391.i = and i64 %34, -1085102592571150096
  %or165.i392.i = or disjoint i64 %shr163.i390.i, %and164.i391.i
  %arrayidx166.i393.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or165.i392.i, ptr %arrayidx166.i393.i, align 8
  %arrayidx171.i394.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %35 = load i64, ptr %arrayidx171.i394.i, align 8
  %arrayidx172.i395.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %36 = load i64, ptr %arrayidx172.i395.i, align 8
  %and173.i396.i = and i64 %35, 1085102592571150095
  %and174.i397.i = shl i64 %36, 4
  %shl175.i398.i = and i64 %and174.i397.i, -1085102592571150096
  %or176.i399.i = or disjoint i64 %and173.i396.i, %shl175.i398.i
  %arrayidx177.i400.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or176.i399.i, ptr %arrayidx177.i400.i, align 8
  %and178.i401.i = lshr i64 %35, 4
  %shr179.i402.i = and i64 %and178.i401.i, 1085102592571150095
  %and180.i403.i = and i64 %36, -1085102592571150096
  %or181.i404.i = or disjoint i64 %shr179.i402.i, %and180.i403.i
  %arrayidx182.i405.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or181.i404.i, ptr %arrayidx182.i405.i, align 8
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

for.body7.i:                                      ; preds = %for.end.i, %shift_rows.exit.i
  %i.1.i819 = phi i32 [ 1, %for.end.i ], [ %inc15.i, %shift_rows.exit.i ]
  %arrayidx.i101.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %53 = load i64, ptr %arrayidx.i101.i, align 8
  %arrayidx1.i102.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %54 = load i64, ptr %arrayidx1.i102.i, align 8
  %arrayidx2.i103.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %55 = load i64, ptr %arrayidx2.i103.i, align 8
  %arrayidx3.i104.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %56 = load i64, ptr %arrayidx3.i104.i, align 8
  %arrayidx4.i105.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %57 = load i64, ptr %arrayidx4.i105.i, align 8
  %arrayidx5.i106.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %58 = load i64, ptr %arrayidx5.i106.i, align 8
  %arrayidx6.i107.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %59 = load i64, ptr %arrayidx6.i107.i, align 8
  %60 = load i64, ptr %q.i, align 8
  %xor.i108.i = xor i64 %56, %58
  %xor8.i.i = xor i64 %53, %59
  %xor9.i.i = xor i64 %53, %56
  %xor10.i109.i = xor i64 %53, %58
  %xor11.i.i = xor i64 %54, %55
  %xor12.i.i = xor i64 %xor11.i.i, %60
  %xor13.i110.i = xor i64 %xor12.i.i, %56
  %xor14.i.i = xor i64 %xor8.i.i, %xor.i108.i
  %xor15.i.i = xor i64 %xor12.i.i, %53
  %xor16.i111.i = xor i64 %xor12.i.i, %59
  %xor17.i.i = xor i64 %xor16.i111.i, %xor10.i109.i
  %xor18.i.i = xor i64 %57, %xor14.i.i
  %xor19.i112.i = xor i64 %xor18.i.i, %58
  %xor20.i.i = xor i64 %xor18.i.i, %54
  %xor21.i.i = xor i64 %xor19.i112.i, %60
  %xor22.i113.i = xor i64 %xor19.i112.i, %xor11.i.i
  %xor23.i.i = xor i64 %xor20.i.i, %xor9.i.i
  %xor24.i.i = xor i64 %60, %xor23.i.i
  %xor25.i.i = xor i64 %xor22.i113.i, %xor23.i.i
  %xor27.i.i = xor i64 %xor11.i.i, %xor23.i.i
  %and.i114.i = and i64 %xor14.i.i, %xor19.i112.i
  %and30.i.i = and i64 %xor17.i.i, %xor21.i.i
  %xor31.i115.i = xor i64 %and30.i.i, %and.i114.i
  %and32.i.i = and i64 %xor13.i110.i, %60
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
  %61 = xor i64 %xor10.i109.i, %and32.i.i
  %62 = xor i64 %61, %xor22.i113.i
  %63 = xor i64 %62, %and.i114.i
  %xor49.i.i = xor i64 %63, %xor43.i116.i
  %64 = xor i64 %xor27.i.i, %and35.i.i
  %65 = xor i64 %64, %xor8.i.i
  %66 = xor i64 %65, %and34.i.i
  %xor50.i.i = xor i64 %66, %xor41.i.i
  %67 = xor i64 %xor27.i.i, %and37.i.i
  %68 = xor i64 %67, %53
  %69 = xor i64 %68, %and34.i.i
  %xor51.i117.i = xor i64 %69, %xor43.i116.i
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
  %and75.i.i = and i64 %xor60.i.i, %60
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
  %70 = xor i64 %xor107.i.i, %xor101.i.i
  %xor113.i.i = xor i64 %70, -1
  %71 = xor i64 %xor105.i.i, %xor93.i.i
  %xor115.i.i = xor i64 %71, -1
  %xor117.i.i = xor i64 %xor98.i.i, %xor111.i.i
  %xor118.i.i = xor i64 %xor96.i.i, %xor111.i.i
  %xor119.i.i = xor i64 %xor92.i.i, %xor110.i.i
  %72 = xor i64 %xor117.i.i, %xor109.i.i
  %xor121.i.i = xor i64 %72, -1
  %73 = xor i64 %xor110.i.i, %xor100.i.i
  %74 = xor i64 %73, %xor109.i.i
  %xor123.i.i = xor i64 %74, -1
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

for.body.i.i:                                     ; preds = %for.body7.i, %for.body.i.i
  %i.0.i.i818 = phi i32 [ 0, %for.body7.i ], [ %inc.i.i, %for.body.i.i ]
  %arrayidx.i.i = getelementptr inbounds nuw i64, ptr %q.i, i32 %i.0.i.i818
  %75 = load i64, ptr %arrayidx.i.i, align 8
  %and.i.i = and i64 %75, 65535
  %and1.i.i = lshr i64 %75, 4
  %shr.i1.i = and i64 %and1.i.i, 268369920
  %or.i.i24 = or disjoint i64 %and.i.i, %shr.i1.i
  %and2.i.i = shl i64 %75, 12
  %shl.i.i25 = and i64 %and2.i.i, 4026531840
  %or3.i.i = or disjoint i64 %or.i.i24, %shl.i.i25
  %and4.i.i = lshr i64 %75, 8
  %shr5.i.i = and i64 %and4.i.i, 1095216660480
  %or6.i.i26 = or disjoint i64 %or3.i.i, %shr5.i.i
  %and7.i.i = shl i64 %75, 8
  %shl8.i.i = and i64 %and7.i.i, 280375465082880
  %or9.i.i = or disjoint i64 %or6.i.i26, %shl8.i.i
  %and10.i.i = lshr i64 %75, 12
  %shr11.i.i = and i64 %and10.i.i, 4222124650659840
  %or12.i.i = or disjoint i64 %or9.i.i, %shr11.i.i
  %and13.i.i = shl i64 %75, 4
  %shl14.i.i = and i64 %and13.i.i, -4503599627370496
  %or15.i.i = or i64 %or12.i.i, %shl14.i.i
  %arrayidx16.i.i = getelementptr inbounds nuw i64, ptr %q.i, i32 %i.0.i.i818
  store i64 %or15.i.i, ptr %arrayidx16.i.i, align 8
  %inc.i.i = add nuw nsw i32 %i.0.i.i818, 1
  %exitcond.i.i.not = icmp eq i32 %inc.i.i, 8
  br i1 %exitcond.i.i.not, label %shift_rows.exit.i, label %for.body.i.i, !llvm.loop !88

shift_rows.exit.i:                                ; preds = %for.body.i.i
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
  %arrayidx7.i.i23 = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %83 = load i64, ptr %arrayidx7.i.i23, align 8
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
  %xor.i52.i = xor i64 %123, %122
  store i64 %xor.i52.i, ptr %q.i, align 8
  %arrayidx2.i53.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i, i32 8
  %124 = load i64, ptr %arrayidx2.i53.i, align 8
  %arrayidx3.i54.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %125 = load i64, ptr %arrayidx3.i54.i, align 8
  %xor4.i55.i = xor i64 %125, %124
  store i64 %xor4.i55.i, ptr %arrayidx3.i54.i, align 8
  %arrayidx5.i56.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i, i32 16
  %126 = load i64, ptr %arrayidx5.i56.i, align 8
  %arrayidx6.i57.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %127 = load i64, ptr %arrayidx6.i57.i, align 8
  %xor7.i58.i = xor i64 %127, %126
  store i64 %xor7.i58.i, ptr %arrayidx6.i57.i, align 8
  %arrayidx8.i59.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i, i32 24
  %128 = load i64, ptr %arrayidx8.i59.i, align 8
  %arrayidx9.i60.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %129 = load i64, ptr %arrayidx9.i60.i, align 8
  %xor10.i61.i = xor i64 %129, %128
  store i64 %xor10.i61.i, ptr %arrayidx9.i60.i, align 8
  %arrayidx11.i62.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i, i32 32
  %130 = load i64, ptr %arrayidx11.i62.i, align 8
  %arrayidx12.i63.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %131 = load i64, ptr %arrayidx12.i63.i, align 8
  %xor13.i64.i = xor i64 %131, %130
  store i64 %xor13.i64.i, ptr %arrayidx12.i63.i, align 8
  %arrayidx14.i65.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i, i32 40
  %132 = load i64, ptr %arrayidx14.i65.i, align 8
  %arrayidx15.i66.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %133 = load i64, ptr %arrayidx15.i66.i, align 8
  %xor16.i67.i = xor i64 %133, %132
  store i64 %xor16.i67.i, ptr %arrayidx15.i66.i, align 8
  %arrayidx17.i68.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i, i32 48
  %134 = load i64, ptr %arrayidx17.i68.i, align 8
  %arrayidx18.i69.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %135 = load i64, ptr %arrayidx18.i69.i, align 8
  %xor19.i70.i = xor i64 %135, %134
  store i64 %xor19.i70.i, ptr %arrayidx18.i69.i, align 8
  %arrayidx20.i71.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i, i32 56
  %136 = load i64, ptr %arrayidx20.i71.i, align 8
  %arrayidx21.i72.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %137 = load i64, ptr %arrayidx21.i72.i, align 8
  %xor22.i73.i = xor i64 %137, %136
  store i64 %xor22.i73.i, ptr %arrayidx21.i72.i, align 8
  %inc15.i = add nuw nsw i32 %i.1.i819, 1
  %exitcond1.i.not = icmp eq i32 %inc15.i, 10
  br i1 %exitcond1.i.not, label %for.end16.i, label %for.body7.i, !llvm.loop !89

for.end16.i:                                      ; preds = %shift_rows.exit.i
  %arrayidx.i122.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %138 = load i64, ptr %arrayidx.i122.i, align 8
  %arrayidx1.i123.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %139 = load i64, ptr %arrayidx1.i123.i, align 8
  %arrayidx2.i124.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %140 = load i64, ptr %arrayidx2.i124.i, align 8
  %arrayidx3.i125.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %141 = load i64, ptr %arrayidx3.i125.i, align 8
  %arrayidx4.i126.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %142 = load i64, ptr %arrayidx4.i126.i, align 8
  %arrayidx5.i127.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %143 = load i64, ptr %arrayidx5.i127.i, align 8
  %arrayidx6.i128.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %144 = load i64, ptr %arrayidx6.i128.i, align 8
  %145 = load i64, ptr %q.i, align 8
  %xor.i129.i = xor i64 %141, %143
  %xor8.i130.i = xor i64 %138, %144
  %xor9.i131.i = xor i64 %138, %141
  %xor10.i132.i = xor i64 %138, %143
  %xor11.i133.i = xor i64 %139, %140
  %xor12.i134.i = xor i64 %xor11.i133.i, %145
  %xor13.i135.i = xor i64 %xor12.i134.i, %141
  %xor14.i136.i = xor i64 %xor8.i130.i, %xor.i129.i
  %xor15.i137.i = xor i64 %xor12.i134.i, %138
  %xor16.i138.i = xor i64 %xor12.i134.i, %144
  %xor17.i139.i = xor i64 %xor16.i138.i, %xor10.i132.i
  %xor18.i140.i = xor i64 %142, %xor14.i136.i
  %xor19.i141.i = xor i64 %xor18.i140.i, %143
  %xor20.i142.i = xor i64 %xor18.i140.i, %139
  %xor21.i143.i = xor i64 %xor19.i141.i, %145
  %xor22.i144.i = xor i64 %xor19.i141.i, %xor11.i133.i
  %xor23.i145.i = xor i64 %xor20.i142.i, %xor9.i131.i
  %xor24.i146.i = xor i64 %145, %xor23.i145.i
  %xor25.i147.i = xor i64 %xor22.i144.i, %xor23.i145.i
  %xor27.i148.i = xor i64 %xor11.i133.i, %xor23.i145.i
  %and.i149.i = and i64 %xor14.i136.i, %xor19.i141.i
  %and30.i150.i = and i64 %xor17.i139.i, %xor21.i143.i
  %xor31.i151.i = xor i64 %and30.i150.i, %and.i149.i
  %and32.i152.i = and i64 %xor13.i135.i, %145
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
  %146 = xor i64 %xor10.i132.i, %and32.i152.i
  %147 = xor i64 %146, %xor22.i144.i
  %148 = xor i64 %147, %and.i149.i
  %xor49.i163.i = xor i64 %148, %xor43.i160.i
  %149 = xor i64 %xor27.i148.i, %and35.i154.i
  %150 = xor i64 %149, %xor8.i130.i
  %151 = xor i64 %150, %and34.i153.i
  %xor50.i164.i = xor i64 %151, %xor41.i158.i
  %152 = xor i64 %xor27.i148.i, %and37.i155.i
  %153 = xor i64 %152, %138
  %154 = xor i64 %153, %and34.i153.i
  %xor51.i165.i = xor i64 %154, %xor43.i160.i
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
  %and75.i189.i = and i64 %xor60.i174.i, %145
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
  %155 = xor i64 %xor107.i221.i, %xor101.i215.i
  %xor113.i227.i = xor i64 %155, -1
  %156 = xor i64 %xor105.i219.i, %xor93.i207.i
  %xor115.i228.i = xor i64 %156, -1
  %xor117.i229.i = xor i64 %xor98.i212.i, %xor111.i225.i
  %xor118.i230.i = xor i64 %xor96.i210.i, %xor111.i225.i
  %xor119.i231.i = xor i64 %xor92.i206.i, %xor110.i224.i
  %157 = xor i64 %xor117.i229.i, %xor109.i223.i
  %xor121.i232.i = xor i64 %157, -1
  %158 = xor i64 %xor110.i224.i, %xor100.i214.i
  %159 = xor i64 %158, %xor109.i223.i
  %xor123.i233.i = xor i64 %159, -1
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

for.body.i5.i:                                    ; preds = %for.end16.i, %for.body.i5.i
  %i.0.i3.i820 = phi i32 [ 0, %for.end16.i ], [ %inc.i27.i, %for.body.i5.i ]
  %arrayidx.i6.i = getelementptr inbounds nuw i64, ptr %q.i, i32 %i.0.i3.i820
  %160 = load i64, ptr %arrayidx.i6.i, align 8
  %and.i7.i = and i64 %160, 65535
  %and1.i8.i = lshr i64 %160, 4
  %shr.i9.i = and i64 %and1.i8.i, 268369920
  %or.i10.i = or disjoint i64 %and.i7.i, %shr.i9.i
  %and2.i11.i = shl i64 %160, 12
  %shl.i12.i = and i64 %and2.i11.i, 4026531840
  %or3.i13.i = or disjoint i64 %or.i10.i, %shl.i12.i
  %and4.i14.i = lshr i64 %160, 8
  %shr5.i15.i = and i64 %and4.i14.i, 1095216660480
  %or6.i16.i = or disjoint i64 %or3.i13.i, %shr5.i15.i
  %and7.i17.i = shl i64 %160, 8
  %shl8.i18.i = and i64 %and7.i17.i, 280375465082880
  %or9.i19.i = or disjoint i64 %or6.i16.i, %shl8.i18.i
  %and10.i20.i = lshr i64 %160, 12
  %shr11.i21.i = and i64 %and10.i20.i, 4222124650659840
  %or12.i22.i = or disjoint i64 %or9.i19.i, %shr11.i21.i
  %and13.i23.i = shl i64 %160, 4
  %shl14.i24.i = and i64 %and13.i23.i, -4503599627370496
  %or15.i25.i = or i64 %or12.i22.i, %shl14.i24.i
  %arrayidx16.i26.i = getelementptr inbounds nuw i64, ptr %q.i, i32 %i.0.i3.i820
  store i64 %or15.i25.i, ptr %arrayidx16.i26.i, align 8
  %inc.i27.i = add nuw nsw i32 %i.0.i3.i820, 1
  %exitcond.i4.i.not = icmp eq i32 %inc.i27.i, 8
  br i1 %exitcond.i4.i.not, label %shift_rows.exit28.i, label %for.body.i5.i, !llvm.loop !90

shift_rows.exit28.i:                              ; preds = %for.body.i5.i
  %add.ptr20.i = getelementptr inbounds nuw i8, ptr %0, i32 640
  %161 = load i64, ptr %add.ptr20.i, align 8
  %162 = load i64, ptr %q.i, align 8
  %xor.i74.i = xor i64 %162, %161
  store i64 %xor.i74.i, ptr %q.i, align 8
  %arrayidx2.i75.i = getelementptr inbounds nuw i8, ptr %0, i32 648
  %163 = load i64, ptr %arrayidx2.i75.i, align 8
  %arrayidx3.i76.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %164 = load i64, ptr %arrayidx3.i76.i, align 8
  %xor4.i77.i = xor i64 %164, %163
  store i64 %xor4.i77.i, ptr %arrayidx3.i76.i, align 8
  %arrayidx5.i78.i = getelementptr inbounds nuw i8, ptr %0, i32 656
  %165 = load i64, ptr %arrayidx5.i78.i, align 8
  %arrayidx6.i79.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %166 = load i64, ptr %arrayidx6.i79.i, align 8
  %xor7.i80.i = xor i64 %166, %165
  store i64 %xor7.i80.i, ptr %arrayidx6.i79.i, align 8
  %arrayidx8.i81.i = getelementptr inbounds nuw i8, ptr %0, i32 664
  %167 = load i64, ptr %arrayidx8.i81.i, align 8
  %arrayidx9.i82.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %168 = load i64, ptr %arrayidx9.i82.i, align 8
  %xor10.i83.i = xor i64 %168, %167
  store i64 %xor10.i83.i, ptr %arrayidx9.i82.i, align 8
  %arrayidx11.i84.i = getelementptr inbounds nuw i8, ptr %0, i32 672
  %169 = load i64, ptr %arrayidx11.i84.i, align 8
  %arrayidx12.i85.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %170 = load i64, ptr %arrayidx12.i85.i, align 8
  %xor13.i86.i = xor i64 %170, %169
  store i64 %xor13.i86.i, ptr %arrayidx12.i85.i, align 8
  %arrayidx14.i87.i = getelementptr inbounds nuw i8, ptr %0, i32 680
  %171 = load i64, ptr %arrayidx14.i87.i, align 8
  %arrayidx15.i88.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %172 = load i64, ptr %arrayidx15.i88.i, align 8
  %xor16.i89.i = xor i64 %172, %171
  store i64 %xor16.i89.i, ptr %arrayidx15.i88.i, align 8
  %arrayidx17.i90.i = getelementptr inbounds nuw i8, ptr %0, i32 688
  %173 = load i64, ptr %arrayidx17.i90.i, align 8
  %arrayidx18.i91.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %174 = load i64, ptr %arrayidx18.i91.i, align 8
  %xor19.i92.i = xor i64 %174, %173
  store i64 %xor19.i92.i, ptr %arrayidx18.i91.i, align 8
  %arrayidx20.i93.i = getelementptr inbounds nuw i8, ptr %0, i32 696
  %175 = load i64, ptr %arrayidx20.i93.i, align 8
  %arrayidx21.i94.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %176 = load i64, ptr %arrayidx21.i94.i, align 8
  %xor22.i95.i = xor i64 %176, %175
  store i64 %xor22.i95.i, ptr %arrayidx21.i94.i, align 8
  %177 = load i64, ptr %q.i, align 8
  %arrayidx1.i241.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %178 = load i64, ptr %arrayidx1.i241.i, align 8
  %and.i242.i = and i64 %177, 6148914691236517205
  %and2.i243.i = shl i64 %178, 1
  %shl.i244.i = and i64 %and2.i243.i, -6148914691236517206
  %or.i245.i = or disjoint i64 %and.i242.i, %shl.i244.i
  store i64 %or.i245.i, ptr %q.i, align 8
  %and4.i246.i = lshr i64 %177, 1
  %shr.i247.i = and i64 %and4.i246.i, 6148914691236517205
  %and5.i.i = and i64 %178, -6148914691236517206
  %or6.i248.i = or disjoint i64 %shr.i247.i, %and5.i.i
  %arrayidx7.i249.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or6.i248.i, ptr %arrayidx7.i249.i, align 8
  %arrayidx11.i250.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %179 = load i64, ptr %arrayidx11.i250.i, align 8
  %arrayidx12.i251.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %180 = load i64, ptr %arrayidx12.i251.i, align 8
  %and13.i252.i = and i64 %179, 6148914691236517205
  %and14.i253.i = shl i64 %180, 1
  %shl15.i.i = and i64 %and14.i253.i, -6148914691236517206
  %or16.i.i = or disjoint i64 %and13.i252.i, %shl15.i.i
  %arrayidx17.i254.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or16.i.i, ptr %arrayidx17.i254.i, align 8
  %and18.i.i = lshr i64 %179, 1
  %shr19.i.i = and i64 %and18.i.i, 6148914691236517205
  %and20.i.i = and i64 %180, -6148914691236517206
  %or21.i.i = or disjoint i64 %shr19.i.i, %and20.i.i
  %arrayidx22.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or21.i.i, ptr %arrayidx22.i.i, align 8
  %arrayidx27.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %181 = load i64, ptr %arrayidx27.i.i, align 8
  %arrayidx28.i255.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %182 = load i64, ptr %arrayidx28.i255.i, align 8
  %and29.i.i = and i64 %181, 6148914691236517205
  %and30.i256.i = shl i64 %182, 1
  %shl31.i.i = and i64 %and30.i256.i, -6148914691236517206
  %or32.i257.i = or disjoint i64 %and29.i.i, %shl31.i.i
  %arrayidx33.i258.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or32.i257.i, ptr %arrayidx33.i258.i, align 8
  %and34.i259.i = lshr i64 %181, 1
  %shr35.i.i = and i64 %and34.i259.i, 6148914691236517205
  %and36.i.i = and i64 %182, -6148914691236517206
  %or37.i.i = or disjoint i64 %shr35.i.i, %and36.i.i
  %arrayidx38.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or37.i.i, ptr %arrayidx38.i.i, align 8
  %arrayidx43.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %183 = load i64, ptr %arrayidx43.i.i, align 8
  %arrayidx44.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %184 = load i64, ptr %arrayidx44.i.i, align 8
  %and45.i.i = and i64 %183, 6148914691236517205
  %and46.i.i = shl i64 %184, 1
  %shl47.i.i = and i64 %and46.i.i, -6148914691236517206
  %or48.i.i = or disjoint i64 %and45.i.i, %shl47.i.i
  %arrayidx49.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or48.i.i, ptr %arrayidx49.i.i, align 8
  %and50.i.i = lshr i64 %183, 1
  %shr51.i.i = and i64 %and50.i.i, 6148914691236517205
  %and52.i.i = and i64 %184, -6148914691236517206
  %or53.i.i = or disjoint i64 %shr51.i.i, %and52.i.i
  %arrayidx54.i260.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or53.i.i, ptr %arrayidx54.i260.i, align 8
  %185 = load i64, ptr %q.i, align 8
  %arrayidx60.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %186 = load i64, ptr %arrayidx60.i.i, align 8
  %and61.i.i = and i64 %185, 3689348814741910323
  %and62.i.i = shl i64 %186, 2
  %shl63.i.i = and i64 %and62.i.i, -3689348814741910324
  %or64.i.i = or disjoint i64 %and61.i.i, %shl63.i.i
  store i64 %or64.i.i, ptr %q.i, align 8
  %and66.i261.i = lshr i64 %185, 2
  %shr67.i.i = and i64 %and66.i261.i, 3689348814741910323
  %and68.i.i = and i64 %186, -3689348814741910324
  %or69.i.i = or disjoint i64 %shr67.i.i, %and68.i.i
  %arrayidx70.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or69.i.i, ptr %arrayidx70.i.i, align 8
  %arrayidx75.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %187 = load i64, ptr %arrayidx75.i.i, align 8
  %arrayidx76.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %188 = load i64, ptr %arrayidx76.i.i, align 8
  %and77.i262.i = and i64 %187, 3689348814741910323
  %and78.i263.i = shl i64 %188, 2
  %shl79.i.i = and i64 %and78.i263.i, -3689348814741910324
  %or80.i.i = or disjoint i64 %and77.i262.i, %shl79.i.i
  %arrayidx81.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or80.i.i, ptr %arrayidx81.i.i, align 8
  %and82.i264.i = lshr i64 %187, 2
  %shr83.i.i = and i64 %and82.i264.i, 3689348814741910323
  %and84.i265.i = and i64 %188, -3689348814741910324
  %or85.i.i = or disjoint i64 %shr83.i.i, %and84.i265.i
  %arrayidx86.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or85.i.i, ptr %arrayidx86.i.i, align 8
  %arrayidx91.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %189 = load i64, ptr %arrayidx91.i.i, align 8
  %arrayidx92.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %190 = load i64, ptr %arrayidx92.i.i, align 8
  %and93.i.i = and i64 %189, 3689348814741910323
  %and94.i.i = shl i64 %190, 2
  %shl95.i.i = and i64 %and94.i.i, -3689348814741910324
  %or96.i.i = or disjoint i64 %and93.i.i, %shl95.i.i
  %arrayidx97.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or96.i.i, ptr %arrayidx97.i.i, align 8
  %and98.i.i = lshr i64 %189, 2
  %shr99.i.i = and i64 %and98.i.i, 3689348814741910323
  %and100.i.i = and i64 %190, -3689348814741910324
  %or101.i.i = or disjoint i64 %shr99.i.i, %and100.i.i
  %arrayidx102.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or101.i.i, ptr %arrayidx102.i.i, align 8
  %arrayidx107.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %191 = load i64, ptr %arrayidx107.i.i, align 8
  %arrayidx108.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %192 = load i64, ptr %arrayidx108.i.i, align 8
  %and109.i.i = and i64 %191, 3689348814741910323
  %and110.i.i = shl i64 %192, 2
  %shl111.i.i = and i64 %and110.i.i, -3689348814741910324
  %or112.i.i = or disjoint i64 %and109.i.i, %shl111.i.i
  %arrayidx113.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or112.i.i, ptr %arrayidx113.i.i, align 8
  %and114.i.i = lshr i64 %191, 2
  %shr115.i.i = and i64 %and114.i.i, 3689348814741910323
  %and116.i.i = and i64 %192, -3689348814741910324
  %or117.i.i = or disjoint i64 %shr115.i.i, %and116.i.i
  %arrayidx118.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or117.i.i, ptr %arrayidx118.i.i, align 8
  %193 = load i64, ptr %q.i, align 8
  %arrayidx124.i266.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %194 = load i64, ptr %arrayidx124.i266.i, align 8
  %and125.i.i = and i64 %193, 1085102592571150095
  %and126.i.i = shl i64 %194, 4
  %shl127.i.i = and i64 %and126.i.i, -1085102592571150096
  %or128.i.i = or disjoint i64 %and125.i.i, %shl127.i.i
  store i64 %or128.i.i, ptr %q.i, align 8
  %and130.i.i = lshr i64 %193, 4
  %shr131.i.i = and i64 %and130.i.i, 1085102592571150095
  %and132.i.i = and i64 %194, -1085102592571150096
  %or133.i.i = or disjoint i64 %shr131.i.i, %and132.i.i
  %arrayidx134.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or133.i.i, ptr %arrayidx134.i.i, align 8
  %arrayidx139.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %195 = load i64, ptr %arrayidx139.i.i, align 8
  %arrayidx140.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %196 = load i64, ptr %arrayidx140.i.i, align 8
  %and141.i.i = and i64 %195, 1085102592571150095
  %and142.i.i = shl i64 %196, 4
  %shl143.i.i = and i64 %and142.i.i, -1085102592571150096
  %or144.i.i = or disjoint i64 %and141.i.i, %shl143.i.i
  %arrayidx145.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or144.i.i, ptr %arrayidx145.i.i, align 8
  %and146.i.i = lshr i64 %195, 4
  %shr147.i.i = and i64 %and146.i.i, 1085102592571150095
  %and148.i.i = and i64 %196, -1085102592571150096
  %or149.i.i = or disjoint i64 %shr147.i.i, %and148.i.i
  %arrayidx150.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or149.i.i, ptr %arrayidx150.i.i, align 8
  %arrayidx155.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %197 = load i64, ptr %arrayidx155.i.i, align 8
  %arrayidx156.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %198 = load i64, ptr %arrayidx156.i.i, align 8
  %and157.i.i = and i64 %197, 1085102592571150095
  %and158.i.i = shl i64 %198, 4
  %shl159.i.i = and i64 %and158.i.i, -1085102592571150096
  %or160.i.i = or disjoint i64 %and157.i.i, %shl159.i.i
  %arrayidx161.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or160.i.i, ptr %arrayidx161.i.i, align 8
  %and162.i.i = lshr i64 %197, 4
  %shr163.i.i = and i64 %and162.i.i, 1085102592571150095
  %and164.i.i = and i64 %198, -1085102592571150096
  %or165.i.i = or disjoint i64 %shr163.i.i, %and164.i.i
  %arrayidx166.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or165.i.i, ptr %arrayidx166.i.i, align 8
  %arrayidx171.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %199 = load i64, ptr %arrayidx171.i.i, align 8
  %arrayidx172.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %200 = load i64, ptr %arrayidx172.i.i, align 8
  %and173.i.i = and i64 %199, 1085102592571150095
  %and174.i.i = shl i64 %200, 4
  %shl175.i.i = and i64 %and174.i.i, -1085102592571150096
  %or176.i.i = or disjoint i64 %and173.i.i, %shl175.i.i
  %arrayidx177.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or176.i.i, ptr %arrayidx177.i.i, align 8
  %and178.i.i = lshr i64 %199, 4
  %shr179.i.i = and i64 %and178.i.i, 1085102592571150095
  %and180.i.i = and i64 %200, -1085102592571150096
  %or181.i267.i = or disjoint i64 %shr179.i.i, %and180.i.i
  %arrayidx182.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or181.i267.i, ptr %arrayidx182.i.i, align 8
  br label %for.body24.i

while.cond.i.i13.preheader:                       ; preds = %for.body24.i
  br label %while.body.i.i17

for.body24.i:                                     ; preds = %shift_rows.exit28.i, %for.body24.i
  %i.2.i821 = phi i32 [ 0, %shift_rows.exit28.i ], [ %inc32.i, %for.body24.i ]
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
  br i1 %exitcond2.i.not, label %while.cond.i.i13.preheader, label %for.body24.i, !llvm.loop !91

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
  br i1 %cmp.not.i.i16, label %aes_ecb4x.exit, label %while.body.i.i17, !llvm.loop !92

aes_ecb4x.exit:                                   ; preds = %while.body.i.i17
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %w.i)
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %q.i)
  %add.ptr.i2 = getelementptr inbounds nuw i8, ptr %ivw.i, i32 12
  %208 = load i32, ptr %add.ptr.i2, align 4
  %209 = call i32 @llvm.bswap.i32(i32 %208)
  %add.i8.i3 = add i32 %209, 4
  %210 = call i32 @llvm.bswap.i32(i32 %add.i8.i3)
  store i32 %210, ptr %add.ptr.i2, align 4
  %add.ptr1.i4 = getelementptr inbounds nuw i8, ptr %ivw.i, i32 28
  %211 = load i32, ptr %add.ptr1.i4, align 4
  %212 = call i32 @llvm.bswap.i32(i32 %211)
  %add.i5.i5 = add i32 %212, 4
  %213 = call i32 @llvm.bswap.i32(i32 %add.i5.i5)
  store i32 %213, ptr %add.ptr1.i4, align 4
  %add.ptr2.i6 = getelementptr inbounds nuw i8, ptr %ivw.i, i32 44
  %214 = load i32, ptr %add.ptr2.i6, align 4
  %215 = call i32 @llvm.bswap.i32(i32 %214)
  %add.i.i7 = add i32 %215, 4
  %216 = call i32 @llvm.bswap.i32(i32 %add.i.i7)
  store i32 %216, ptr %add.ptr2.i6, align 4
  %add.ptr3.i8 = getelementptr inbounds nuw i8, ptr %ivw.i, i32 60
  %217 = load i32, ptr %add.ptr3.i8, align 4
  %218 = call i32 @llvm.bswap.i32(i32 %217)
  %add.i2.i9 = add i32 %218, 4
  %219 = call i32 @llvm.bswap.i32(i32 %add.i2.i9)
  store i32 %219, ptr %add.ptr3.i8, align 4
  %add.ptr21.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i827, i32 64
  %sub.i = add i32 %outlen.addr.0.i826, -64
  %cmp.i = icmp ugt i32 %sub.i, 64
  br i1 %cmp.i, label %while.body.i, label %while.cond.i.while.end.i_crit_edge, !llvm.loop !93

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
  br i1 %exitcond.i41.not, label %for.end.i42, label %for.body.i775, !llvm.loop !94

for.end.i42:                                      ; preds = %for.body.i775
  %228 = load i64, ptr %q.i37, align 8
  %arrayidx1.i268.i43 = getelementptr inbounds nuw i8, ptr %q.i37, i32 8
  %229 = load i64, ptr %arrayidx1.i268.i43, align 8
  %and.i269.i44 = and i64 %228, 6148914691236517205
  %and2.i270.i45 = shl i64 %229, 1
  %shl.i271.i46 = and i64 %and2.i270.i45, -6148914691236517206
  %or.i272.i47 = or disjoint i64 %and.i269.i44, %shl.i271.i46
  store i64 %or.i272.i47, ptr %q.i37, align 8
  %and4.i273.i48 = lshr i64 %228, 1
  %shr.i274.i49 = and i64 %and4.i273.i48, 6148914691236517205
  %and5.i275.i50 = and i64 %229, -6148914691236517206
  %or6.i276.i51 = or disjoint i64 %shr.i274.i49, %and5.i275.i50
  %arrayidx7.i277.i52 = getelementptr inbounds nuw i8, ptr %q.i37, i32 8
  store i64 %or6.i276.i51, ptr %arrayidx7.i277.i52, align 8
  %arrayidx11.i278.i53 = getelementptr inbounds nuw i8, ptr %q.i37, i32 16
  %230 = load i64, ptr %arrayidx11.i278.i53, align 8
  %arrayidx12.i279.i54 = getelementptr inbounds nuw i8, ptr %q.i37, i32 24
  %231 = load i64, ptr %arrayidx12.i279.i54, align 8
  %and13.i280.i55 = and i64 %230, 6148914691236517205
  %and14.i281.i56 = shl i64 %231, 1
  %shl15.i282.i57 = and i64 %and14.i281.i56, -6148914691236517206
  %or16.i283.i58 = or disjoint i64 %and13.i280.i55, %shl15.i282.i57
  %arrayidx17.i284.i59 = getelementptr inbounds nuw i8, ptr %q.i37, i32 16
  store i64 %or16.i283.i58, ptr %arrayidx17.i284.i59, align 8
  %and18.i285.i60 = lshr i64 %230, 1
  %shr19.i286.i61 = and i64 %and18.i285.i60, 6148914691236517205
  %and20.i287.i62 = and i64 %231, -6148914691236517206
  %or21.i288.i63 = or disjoint i64 %shr19.i286.i61, %and20.i287.i62
  %arrayidx22.i289.i64 = getelementptr inbounds nuw i8, ptr %q.i37, i32 24
  store i64 %or21.i288.i63, ptr %arrayidx22.i289.i64, align 8
  %arrayidx27.i290.i65 = getelementptr inbounds nuw i8, ptr %q.i37, i32 32
  %232 = load i64, ptr %arrayidx27.i290.i65, align 8
  %arrayidx28.i291.i66 = getelementptr inbounds nuw i8, ptr %q.i37, i32 40
  %233 = load i64, ptr %arrayidx28.i291.i66, align 8
  %and29.i292.i67 = and i64 %232, 6148914691236517205
  %and30.i293.i68 = shl i64 %233, 1
  %shl31.i294.i69 = and i64 %and30.i293.i68, -6148914691236517206
  %or32.i295.i70 = or disjoint i64 %and29.i292.i67, %shl31.i294.i69
  %arrayidx33.i296.i71 = getelementptr inbounds nuw i8, ptr %q.i37, i32 32
  store i64 %or32.i295.i70, ptr %arrayidx33.i296.i71, align 8
  %and34.i297.i72 = lshr i64 %232, 1
  %shr35.i298.i73 = and i64 %and34.i297.i72, 6148914691236517205
  %and36.i299.i74 = and i64 %233, -6148914691236517206
  %or37.i300.i75 = or disjoint i64 %shr35.i298.i73, %and36.i299.i74
  %arrayidx38.i301.i76 = getelementptr inbounds nuw i8, ptr %q.i37, i32 40
  store i64 %or37.i300.i75, ptr %arrayidx38.i301.i76, align 8
  %arrayidx43.i302.i77 = getelementptr inbounds nuw i8, ptr %q.i37, i32 48
  %234 = load i64, ptr %arrayidx43.i302.i77, align 8
  %arrayidx44.i303.i78 = getelementptr inbounds nuw i8, ptr %q.i37, i32 56
  %235 = load i64, ptr %arrayidx44.i303.i78, align 8
  %and45.i304.i79 = and i64 %234, 6148914691236517205
  %and46.i305.i80 = shl i64 %235, 1
  %shl47.i306.i81 = and i64 %and46.i305.i80, -6148914691236517206
  %or48.i307.i82 = or disjoint i64 %and45.i304.i79, %shl47.i306.i81
  %arrayidx49.i308.i83 = getelementptr inbounds nuw i8, ptr %q.i37, i32 48
  store i64 %or48.i307.i82, ptr %arrayidx49.i308.i83, align 8
  %and50.i309.i84 = lshr i64 %234, 1
  %shr51.i310.i85 = and i64 %and50.i309.i84, 6148914691236517205
  %and52.i311.i86 = and i64 %235, -6148914691236517206
  %or53.i312.i87 = or disjoint i64 %shr51.i310.i85, %and52.i311.i86
  %arrayidx54.i313.i88 = getelementptr inbounds nuw i8, ptr %q.i37, i32 56
  store i64 %or53.i312.i87, ptr %arrayidx54.i313.i88, align 8
  %236 = load i64, ptr %q.i37, align 8
  %arrayidx60.i314.i89 = getelementptr inbounds nuw i8, ptr %q.i37, i32 16
  %237 = load i64, ptr %arrayidx60.i314.i89, align 8
  %and61.i315.i90 = and i64 %236, 3689348814741910323
  %and62.i316.i91 = shl i64 %237, 2
  %shl63.i317.i92 = and i64 %and62.i316.i91, -3689348814741910324
  %or64.i318.i93 = or disjoint i64 %and61.i315.i90, %shl63.i317.i92
  store i64 %or64.i318.i93, ptr %q.i37, align 8
  %and66.i319.i94 = lshr i64 %236, 2
  %shr67.i320.i95 = and i64 %and66.i319.i94, 3689348814741910323
  %and68.i321.i96 = and i64 %237, -3689348814741910324
  %or69.i322.i97 = or disjoint i64 %shr67.i320.i95, %and68.i321.i96
  %arrayidx70.i323.i98 = getelementptr inbounds nuw i8, ptr %q.i37, i32 16
  store i64 %or69.i322.i97, ptr %arrayidx70.i323.i98, align 8
  %arrayidx75.i324.i99 = getelementptr inbounds nuw i8, ptr %q.i37, i32 8
  %238 = load i64, ptr %arrayidx75.i324.i99, align 8
  %arrayidx76.i325.i100 = getelementptr inbounds nuw i8, ptr %q.i37, i32 24
  %239 = load i64, ptr %arrayidx76.i325.i100, align 8
  %and77.i326.i101 = and i64 %238, 3689348814741910323
  %and78.i327.i102 = shl i64 %239, 2
  %shl79.i328.i103 = and i64 %and78.i327.i102, -3689348814741910324
  %or80.i329.i104 = or disjoint i64 %and77.i326.i101, %shl79.i328.i103
  %arrayidx81.i330.i105 = getelementptr inbounds nuw i8, ptr %q.i37, i32 8
  store i64 %or80.i329.i104, ptr %arrayidx81.i330.i105, align 8
  %and82.i331.i106 = lshr i64 %238, 2
  %shr83.i332.i107 = and i64 %and82.i331.i106, 3689348814741910323
  %and84.i333.i108 = and i64 %239, -3689348814741910324
  %or85.i334.i109 = or disjoint i64 %shr83.i332.i107, %and84.i333.i108
  %arrayidx86.i335.i110 = getelementptr inbounds nuw i8, ptr %q.i37, i32 24
  store i64 %or85.i334.i109, ptr %arrayidx86.i335.i110, align 8
  %arrayidx91.i336.i111 = getelementptr inbounds nuw i8, ptr %q.i37, i32 32
  %240 = load i64, ptr %arrayidx91.i336.i111, align 8
  %arrayidx92.i337.i112 = getelementptr inbounds nuw i8, ptr %q.i37, i32 48
  %241 = load i64, ptr %arrayidx92.i337.i112, align 8
  %and93.i338.i113 = and i64 %240, 3689348814741910323
  %and94.i339.i114 = shl i64 %241, 2
  %shl95.i340.i115 = and i64 %and94.i339.i114, -3689348814741910324
  %or96.i341.i116 = or disjoint i64 %and93.i338.i113, %shl95.i340.i115
  %arrayidx97.i342.i117 = getelementptr inbounds nuw i8, ptr %q.i37, i32 32
  store i64 %or96.i341.i116, ptr %arrayidx97.i342.i117, align 8
  %and98.i343.i118 = lshr i64 %240, 2
  %shr99.i344.i119 = and i64 %and98.i343.i118, 3689348814741910323
  %and100.i345.i120 = and i64 %241, -3689348814741910324
  %or101.i346.i121 = or disjoint i64 %shr99.i344.i119, %and100.i345.i120
  %arrayidx102.i347.i122 = getelementptr inbounds nuw i8, ptr %q.i37, i32 48
  store i64 %or101.i346.i121, ptr %arrayidx102.i347.i122, align 8
  %arrayidx107.i348.i123 = getelementptr inbounds nuw i8, ptr %q.i37, i32 40
  %242 = load i64, ptr %arrayidx107.i348.i123, align 8
  %arrayidx108.i349.i124 = getelementptr inbounds nuw i8, ptr %q.i37, i32 56
  %243 = load i64, ptr %arrayidx108.i349.i124, align 8
  %and109.i350.i125 = and i64 %242, 3689348814741910323
  %and110.i351.i126 = shl i64 %243, 2
  %shl111.i352.i127 = and i64 %and110.i351.i126, -3689348814741910324
  %or112.i353.i128 = or disjoint i64 %and109.i350.i125, %shl111.i352.i127
  %arrayidx113.i354.i129 = getelementptr inbounds nuw i8, ptr %q.i37, i32 40
  store i64 %or112.i353.i128, ptr %arrayidx113.i354.i129, align 8
  %and114.i355.i130 = lshr i64 %242, 2
  %shr115.i356.i131 = and i64 %and114.i355.i130, 3689348814741910323
  %and116.i357.i132 = and i64 %243, -3689348814741910324
  %or117.i358.i133 = or disjoint i64 %shr115.i356.i131, %and116.i357.i132
  %arrayidx118.i359.i134 = getelementptr inbounds nuw i8, ptr %q.i37, i32 56
  store i64 %or117.i358.i133, ptr %arrayidx118.i359.i134, align 8
  %244 = load i64, ptr %q.i37, align 8
  %arrayidx124.i360.i135 = getelementptr inbounds nuw i8, ptr %q.i37, i32 32
  %245 = load i64, ptr %arrayidx124.i360.i135, align 8
  %and125.i361.i136 = and i64 %244, 1085102592571150095
  %and126.i362.i137 = shl i64 %245, 4
  %shl127.i363.i138 = and i64 %and126.i362.i137, -1085102592571150096
  %or128.i364.i139 = or disjoint i64 %and125.i361.i136, %shl127.i363.i138
  store i64 %or128.i364.i139, ptr %q.i37, align 8
  %and130.i365.i140 = lshr i64 %244, 4
  %shr131.i366.i141 = and i64 %and130.i365.i140, 1085102592571150095
  %and132.i367.i142 = and i64 %245, -1085102592571150096
  %or133.i368.i143 = or disjoint i64 %shr131.i366.i141, %and132.i367.i142
  %arrayidx134.i369.i144 = getelementptr inbounds nuw i8, ptr %q.i37, i32 32
  store i64 %or133.i368.i143, ptr %arrayidx134.i369.i144, align 8
  %arrayidx139.i370.i145 = getelementptr inbounds nuw i8, ptr %q.i37, i32 8
  %246 = load i64, ptr %arrayidx139.i370.i145, align 8
  %arrayidx140.i371.i146 = getelementptr inbounds nuw i8, ptr %q.i37, i32 40
  %247 = load i64, ptr %arrayidx140.i371.i146, align 8
  %and141.i372.i147 = and i64 %246, 1085102592571150095
  %and142.i373.i148 = shl i64 %247, 4
  %shl143.i374.i149 = and i64 %and142.i373.i148, -1085102592571150096
  %or144.i375.i150 = or disjoint i64 %and141.i372.i147, %shl143.i374.i149
  %arrayidx145.i376.i151 = getelementptr inbounds nuw i8, ptr %q.i37, i32 8
  store i64 %or144.i375.i150, ptr %arrayidx145.i376.i151, align 8
  %and146.i377.i152 = lshr i64 %246, 4
  %shr147.i378.i153 = and i64 %and146.i377.i152, 1085102592571150095
  %and148.i379.i154 = and i64 %247, -1085102592571150096
  %or149.i380.i155 = or disjoint i64 %shr147.i378.i153, %and148.i379.i154
  %arrayidx150.i381.i156 = getelementptr inbounds nuw i8, ptr %q.i37, i32 40
  store i64 %or149.i380.i155, ptr %arrayidx150.i381.i156, align 8
  %arrayidx155.i382.i157 = getelementptr inbounds nuw i8, ptr %q.i37, i32 16
  %248 = load i64, ptr %arrayidx155.i382.i157, align 8
  %arrayidx156.i383.i158 = getelementptr inbounds nuw i8, ptr %q.i37, i32 48
  %249 = load i64, ptr %arrayidx156.i383.i158, align 8
  %and157.i384.i159 = and i64 %248, 1085102592571150095
  %and158.i385.i160 = shl i64 %249, 4
  %shl159.i386.i161 = and i64 %and158.i385.i160, -1085102592571150096
  %or160.i387.i162 = or disjoint i64 %and157.i384.i159, %shl159.i386.i161
  %arrayidx161.i388.i163 = getelementptr inbounds nuw i8, ptr %q.i37, i32 16
  store i64 %or160.i387.i162, ptr %arrayidx161.i388.i163, align 8
  %and162.i389.i164 = lshr i64 %248, 4
  %shr163.i390.i165 = and i64 %and162.i389.i164, 1085102592571150095
  %and164.i391.i166 = and i64 %249, -1085102592571150096
  %or165.i392.i167 = or disjoint i64 %shr163.i390.i165, %and164.i391.i166
  %arrayidx166.i393.i168 = getelementptr inbounds nuw i8, ptr %q.i37, i32 48
  store i64 %or165.i392.i167, ptr %arrayidx166.i393.i168, align 8
  %arrayidx171.i394.i169 = getelementptr inbounds nuw i8, ptr %q.i37, i32 24
  %250 = load i64, ptr %arrayidx171.i394.i169, align 8
  %arrayidx172.i395.i170 = getelementptr inbounds nuw i8, ptr %q.i37, i32 56
  %251 = load i64, ptr %arrayidx172.i395.i170, align 8
  %and173.i396.i171 = and i64 %250, 1085102592571150095
  %and174.i397.i172 = shl i64 %251, 4
  %shl175.i398.i173 = and i64 %and174.i397.i172, -1085102592571150096
  %or176.i399.i174 = or disjoint i64 %and173.i396.i171, %shl175.i398.i173
  %arrayidx177.i400.i175 = getelementptr inbounds nuw i8, ptr %q.i37, i32 24
  store i64 %or176.i399.i174, ptr %arrayidx177.i400.i175, align 8
  %and178.i401.i176 = lshr i64 %250, 4
  %shr179.i402.i177 = and i64 %and178.i401.i176, 1085102592571150095
  %and180.i403.i178 = and i64 %251, -1085102592571150096
  %or181.i404.i179 = or disjoint i64 %shr179.i402.i177, %and180.i403.i178
  %arrayidx182.i405.i180 = getelementptr inbounds nuw i8, ptr %q.i37, i32 56
  store i64 %or181.i404.i179, ptr %arrayidx182.i405.i180, align 8
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

for.body7.i573:                                   ; preds = %for.end.i42, %shift_rows.exit.i696
  %i.1.i204831 = phi i32 [ 1, %for.end.i42 ], [ %inc15.i751, %shift_rows.exit.i696 ]
  %arrayidx.i101.i574 = getelementptr inbounds nuw i8, ptr %q.i37, i32 56
  %268 = load i64, ptr %arrayidx.i101.i574, align 8
  %arrayidx1.i102.i575 = getelementptr inbounds nuw i8, ptr %q.i37, i32 48
  %269 = load i64, ptr %arrayidx1.i102.i575, align 8
  %arrayidx2.i103.i576 = getelementptr inbounds nuw i8, ptr %q.i37, i32 40
  %270 = load i64, ptr %arrayidx2.i103.i576, align 8
  %arrayidx3.i104.i577 = getelementptr inbounds nuw i8, ptr %q.i37, i32 32
  %271 = load i64, ptr %arrayidx3.i104.i577, align 8
  %arrayidx4.i105.i578 = getelementptr inbounds nuw i8, ptr %q.i37, i32 24
  %272 = load i64, ptr %arrayidx4.i105.i578, align 8
  %arrayidx5.i106.i579 = getelementptr inbounds nuw i8, ptr %q.i37, i32 16
  %273 = load i64, ptr %arrayidx5.i106.i579, align 8
  %arrayidx6.i107.i580 = getelementptr inbounds nuw i8, ptr %q.i37, i32 8
  %274 = load i64, ptr %arrayidx6.i107.i580, align 8
  %275 = load i64, ptr %q.i37, align 8
  %xor.i108.i581 = xor i64 %271, %273
  %xor8.i.i582 = xor i64 %268, %274
  %xor9.i.i583 = xor i64 %268, %271
  %xor10.i109.i584 = xor i64 %268, %273
  %xor11.i.i585 = xor i64 %269, %270
  %xor12.i.i586 = xor i64 %xor11.i.i585, %275
  %xor13.i110.i587 = xor i64 %xor12.i.i586, %271
  %xor14.i.i588 = xor i64 %xor8.i.i582, %xor.i108.i581
  %xor15.i.i589 = xor i64 %xor12.i.i586, %268
  %xor16.i111.i590 = xor i64 %xor12.i.i586, %274
  %xor17.i.i591 = xor i64 %xor16.i111.i590, %xor10.i109.i584
  %xor18.i.i592 = xor i64 %272, %xor14.i.i588
  %xor19.i112.i593 = xor i64 %xor18.i.i592, %273
  %xor20.i.i594 = xor i64 %xor18.i.i592, %269
  %xor21.i.i595 = xor i64 %xor19.i112.i593, %275
  %xor22.i113.i596 = xor i64 %xor19.i112.i593, %xor11.i.i585
  %xor23.i.i597 = xor i64 %xor20.i.i594, %xor9.i.i583
  %xor24.i.i598 = xor i64 %275, %xor23.i.i597
  %xor25.i.i599 = xor i64 %xor22.i113.i596, %xor23.i.i597
  %xor27.i.i600 = xor i64 %xor11.i.i585, %xor23.i.i597
  %and.i114.i601 = and i64 %xor14.i.i588, %xor19.i112.i593
  %and30.i.i602 = and i64 %xor17.i.i591, %xor21.i.i595
  %xor31.i115.i603 = xor i64 %and30.i.i602, %and.i114.i601
  %and32.i.i604 = and i64 %xor13.i110.i587, %275
  %and34.i.i605 = and i64 %xor8.i.i582, %xor27.i.i600
  %and35.i.i606 = and i64 %xor16.i111.i590, %xor12.i.i586
  %and37.i.i607 = and i64 %xor15.i.i589, %xor24.i.i598
  %and39.i.i608 = and i64 %xor9.i.i583, %xor23.i.i597
  %and40.i.i609 = and i64 %xor.i108.i581, %xor25.i.i599
  %xor41.i.i610 = xor i64 %and40.i.i609, %and39.i.i608
  %and42.i.i611 = and i64 %xor10.i109.i584, %xor22.i113.i596
  %xor43.i116.i612 = xor i64 %and42.i.i611, %and39.i.i608
  %xor44.i.i613 = xor i64 %xor31.i115.i603, %xor41.i.i610
  %xor48.i.i614 = xor i64 %xor44.i.i613, %xor20.i.i594
  %276 = xor i64 %xor10.i109.i584, %and32.i.i604
  %277 = xor i64 %276, %xor22.i113.i596
  %278 = xor i64 %277, %and.i114.i601
  %xor49.i.i615 = xor i64 %278, %xor43.i116.i612
  %279 = xor i64 %xor27.i.i600, %and35.i.i606
  %280 = xor i64 %279, %xor8.i.i582
  %281 = xor i64 %280, %and34.i.i605
  %xor50.i.i616 = xor i64 %281, %xor41.i.i610
  %282 = xor i64 %xor27.i.i600, %and37.i.i607
  %283 = xor i64 %282, %268
  %284 = xor i64 %283, %and34.i.i605
  %xor51.i117.i617 = xor i64 %284, %xor43.i116.i612
  %xor52.i.i618 = xor i64 %xor48.i.i614, %xor49.i.i615
  %and53.i.i619 = and i64 %xor48.i.i614, %xor50.i.i616
  %xor54.i.i620 = xor i64 %xor51.i117.i617, %and53.i.i619
  %and55.i.i621 = and i64 %xor52.i.i618, %xor54.i.i620
  %xor56.i.i622 = xor i64 %and55.i.i621, %xor49.i.i615
  %xor57.i.i623 = xor i64 %xor50.i.i616, %xor51.i117.i617
  %xor58.i.i624 = xor i64 %xor49.i.i615, %and53.i.i619
  %and59.i.i625 = and i64 %xor58.i.i624, %xor57.i.i623
  %xor60.i.i626 = xor i64 %and59.i.i625, %xor51.i117.i617
  %xor61.i118.i627 = xor i64 %xor50.i.i616, %xor60.i.i626
  %xor62.i.i628 = xor i64 %and59.i.i625, %and53.i.i619
  %and63.i.i629 = and i64 %xor51.i117.i617, %xor62.i.i628
  %xor64.i.i630 = xor i64 %and63.i.i629, %xor61.i118.i627
  %xor65.i119.i631 = xor i64 %xor54.i.i620, %and63.i.i629
  %and66.i.i632 = and i64 %xor56.i.i622, %xor65.i119.i631
  %xor67.i120.i633 = xor i64 %xor52.i.i618, %and66.i.i632
  %xor68.i.i634 = xor i64 %xor67.i120.i633, %xor64.i.i630
  %xor69.i.i635 = xor i64 %xor56.i.i622, %xor60.i.i626
  %xor70.i.i636 = xor i64 %xor56.i.i622, %xor67.i120.i633
  %xor71.i121.i637 = xor i64 %and63.i.i629, %xor50.i.i616
  %xor72.i.i638 = xor i64 %xor69.i.i635, %xor68.i.i634
  %and73.i.i639 = and i64 %xor71.i121.i637, %xor19.i112.i593
  %and74.i.i640 = and i64 %xor64.i.i630, %xor21.i.i595
  %and75.i.i641 = and i64 %xor60.i.i626, %275
  %and76.i.i642 = and i64 %xor70.i.i636, %xor27.i.i600
  %and77.i.i643 = and i64 %xor67.i120.i633, %xor12.i.i586
  %and78.i.i644 = and i64 %xor56.i.i622, %xor24.i.i598
  %and79.i.i645 = and i64 %xor69.i.i635, %xor23.i.i597
  %and80.i.i646 = and i64 %xor72.i.i638, %xor25.i.i599
  %and81.i.i647 = and i64 %xor68.i.i634, %xor22.i113.i596
  %and82.i.i648 = and i64 %xor71.i121.i637, %xor14.i.i588
  %and83.i.i649 = and i64 %xor64.i.i630, %xor17.i.i591
  %and84.i.i650 = and i64 %xor60.i.i626, %xor13.i110.i587
  %and85.i.i651 = and i64 %xor70.i.i636, %xor8.i.i582
  %and86.i.i652 = and i64 %xor67.i120.i633, %xor16.i111.i590
  %and87.i.i653 = and i64 %xor56.i.i622, %xor15.i.i589
  %and88.i.i654 = and i64 %xor69.i.i635, %xor9.i.i583
  %and89.i.i655 = and i64 %xor72.i.i638, %xor.i108.i581
  %and90.i.i656 = and i64 %xor68.i.i634, %xor10.i109.i584
  %xor91.i.i657 = xor i64 %and88.i.i654, %and89.i.i655
  %xor92.i.i658 = xor i64 %and83.i.i649, %and84.i.i650
  %xor93.i.i659 = xor i64 %and78.i.i644, %and86.i.i652
  %xor94.i.i660 = xor i64 %and82.i.i648, %and83.i.i649
  %xor95.i.i661 = xor i64 %and75.i.i641, %and85.i.i651
  %xor96.i.i662 = xor i64 %and75.i.i641, %and78.i.i644
  %xor97.i.i663 = xor i64 %and80.i.i646, %and81.i.i647
  %xor98.i.i664 = xor i64 %and73.i.i639, %and76.i.i642
  %xor99.i.i665 = xor i64 %and79.i.i645, %and80.i.i646
  %xor100.i.i666 = xor i64 %and89.i.i655, %and90.i.i656
  %xor101.i.i667 = xor i64 %and85.i.i651, %xor93.i.i659
  %xor102.i.i668 = xor i64 %xor95.i.i661, %xor98.i.i664
  %xor103.i.i669 = xor i64 %and77.i.i643, %xor91.i.i657
  %xor104.i.i670 = xor i64 %and76.i.i642, %xor99.i.i665
  %xor105.i.i671 = xor i64 %xor91.i.i657, %xor102.i.i668
  %xor106.i.i672 = xor i64 %and87.i.i653, %xor102.i.i668
  %xor107.i.i673 = xor i64 %xor97.i.i663, %xor103.i.i669
  %xor108.i.i674 = xor i64 %xor94.i.i660, %xor103.i.i669
  %xor109.i.i675 = xor i64 %and77.i.i643, %xor104.i.i670
  %xor110.i.i676 = xor i64 %xor106.i.i672, %xor107.i.i673
  %xor111.i.i677 = xor i64 %and74.i.i640, %xor108.i.i674
  %xor112.i.i678 = xor i64 %xor104.i.i670, %xor108.i.i674
  %285 = xor i64 %xor107.i.i673, %xor101.i.i667
  %xor113.i.i679 = xor i64 %285, -1
  %286 = xor i64 %xor105.i.i671, %xor93.i.i659
  %xor115.i.i680 = xor i64 %286, -1
  %xor117.i.i681 = xor i64 %xor98.i.i664, %xor111.i.i677
  %xor118.i.i682 = xor i64 %xor96.i.i662, %xor111.i.i677
  %xor119.i.i683 = xor i64 %xor92.i.i658, %xor110.i.i676
  %287 = xor i64 %xor117.i.i681, %xor109.i.i675
  %xor121.i.i684 = xor i64 %287, -1
  %288 = xor i64 %xor110.i.i676, %xor100.i.i666
  %289 = xor i64 %288, %xor109.i.i675
  %xor123.i.i685 = xor i64 %289, -1
  %arrayidx124.i.i686 = getelementptr inbounds nuw i8, ptr %q.i37, i32 56
  store i64 %xor112.i.i678, ptr %arrayidx124.i.i686, align 8
  %arrayidx125.i.i687 = getelementptr inbounds nuw i8, ptr %q.i37, i32 48
  store i64 %xor121.i.i684, ptr %arrayidx125.i.i687, align 8
  %arrayidx126.i.i688 = getelementptr inbounds nuw i8, ptr %q.i37, i32 40
  store i64 %xor123.i.i685, ptr %arrayidx126.i.i688, align 8
  %arrayidx127.i.i689 = getelementptr inbounds nuw i8, ptr %q.i37, i32 32
  store i64 %xor117.i.i681, ptr %arrayidx127.i.i689, align 8
  %arrayidx128.i.i690 = getelementptr inbounds nuw i8, ptr %q.i37, i32 24
  store i64 %xor118.i.i682, ptr %arrayidx128.i.i690, align 8
  %arrayidx129.i.i691 = getelementptr inbounds nuw i8, ptr %q.i37, i32 16
  store i64 %xor119.i.i683, ptr %arrayidx129.i.i691, align 8
  %arrayidx130.i.i692 = getelementptr inbounds nuw i8, ptr %q.i37, i32 8
  store i64 %xor113.i.i679, ptr %arrayidx130.i.i692, align 8
  store i64 %xor115.i.i680, ptr %q.i37, align 8
  br label %for.body.i.i752

for.body.i.i752:                                  ; preds = %for.body7.i573, %for.body.i.i752
  %i.0.i.i694830 = phi i32 [ 0, %for.body7.i573 ], [ %inc.i.i774, %for.body.i.i752 ]
  %arrayidx.i.i753 = getelementptr inbounds nuw i64, ptr %q.i37, i32 %i.0.i.i694830
  %290 = load i64, ptr %arrayidx.i.i753, align 8
  %and.i.i754 = and i64 %290, 65535
  %and1.i.i755 = lshr i64 %290, 4
  %shr.i1.i756 = and i64 %and1.i.i755, 268369920
  %or.i.i757 = or disjoint i64 %and.i.i754, %shr.i1.i756
  %and2.i.i758 = shl i64 %290, 12
  %shl.i.i759 = and i64 %and2.i.i758, 4026531840
  %or3.i.i760 = or disjoint i64 %or.i.i757, %shl.i.i759
  %and4.i.i761 = lshr i64 %290, 8
  %shr5.i.i762 = and i64 %and4.i.i761, 1095216660480
  %or6.i.i763 = or disjoint i64 %or3.i.i760, %shr5.i.i762
  %and7.i.i764 = shl i64 %290, 8
  %shl8.i.i765 = and i64 %and7.i.i764, 280375465082880
  %or9.i.i766 = or disjoint i64 %or6.i.i763, %shl8.i.i765
  %and10.i.i767 = lshr i64 %290, 12
  %shr11.i.i768 = and i64 %and10.i.i767, 4222124650659840
  %or12.i.i769 = or disjoint i64 %or9.i.i766, %shr11.i.i768
  %and13.i.i770 = shl i64 %290, 4
  %shl14.i.i771 = and i64 %and13.i.i770, -4503599627370496
  %or15.i.i772 = or i64 %or12.i.i769, %shl14.i.i771
  %arrayidx16.i.i773 = getelementptr inbounds nuw i64, ptr %q.i37, i32 %i.0.i.i694830
  store i64 %or15.i.i772, ptr %arrayidx16.i.i773, align 8
  %inc.i.i774 = add nuw nsw i32 %i.0.i.i694830, 1
  %exitcond.i.i695.not = icmp eq i32 %inc.i.i774, 8
  br i1 %exitcond.i.i695.not, label %shift_rows.exit.i696, label %for.body.i.i752, !llvm.loop !95

shift_rows.exit.i696:                             ; preds = %for.body.i.i752
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
  %xor.i52.i729 = xor i64 %338, %337
  store i64 %xor.i52.i729, ptr %q.i37, align 8
  %arrayidx2.i53.i730 = getelementptr inbounds nuw i8, ptr %add.ptr13.i728, i32 8
  %339 = load i64, ptr %arrayidx2.i53.i730, align 8
  %arrayidx3.i54.i731 = getelementptr inbounds nuw i8, ptr %q.i37, i32 8
  %340 = load i64, ptr %arrayidx3.i54.i731, align 8
  %xor4.i55.i732 = xor i64 %340, %339
  store i64 %xor4.i55.i732, ptr %arrayidx3.i54.i731, align 8
  %arrayidx5.i56.i733 = getelementptr inbounds nuw i8, ptr %add.ptr13.i728, i32 16
  %341 = load i64, ptr %arrayidx5.i56.i733, align 8
  %arrayidx6.i57.i734 = getelementptr inbounds nuw i8, ptr %q.i37, i32 16
  %342 = load i64, ptr %arrayidx6.i57.i734, align 8
  %xor7.i58.i735 = xor i64 %342, %341
  store i64 %xor7.i58.i735, ptr %arrayidx6.i57.i734, align 8
  %arrayidx8.i59.i736 = getelementptr inbounds nuw i8, ptr %add.ptr13.i728, i32 24
  %343 = load i64, ptr %arrayidx8.i59.i736, align 8
  %arrayidx9.i60.i737 = getelementptr inbounds nuw i8, ptr %q.i37, i32 24
  %344 = load i64, ptr %arrayidx9.i60.i737, align 8
  %xor10.i61.i738 = xor i64 %344, %343
  store i64 %xor10.i61.i738, ptr %arrayidx9.i60.i737, align 8
  %arrayidx11.i62.i739 = getelementptr inbounds nuw i8, ptr %add.ptr13.i728, i32 32
  %345 = load i64, ptr %arrayidx11.i62.i739, align 8
  %arrayidx12.i63.i740 = getelementptr inbounds nuw i8, ptr %q.i37, i32 32
  %346 = load i64, ptr %arrayidx12.i63.i740, align 8
  %xor13.i64.i741 = xor i64 %346, %345
  store i64 %xor13.i64.i741, ptr %arrayidx12.i63.i740, align 8
  %arrayidx14.i65.i742 = getelementptr inbounds nuw i8, ptr %add.ptr13.i728, i32 40
  %347 = load i64, ptr %arrayidx14.i65.i742, align 8
  %arrayidx15.i66.i743 = getelementptr inbounds nuw i8, ptr %q.i37, i32 40
  %348 = load i64, ptr %arrayidx15.i66.i743, align 8
  %xor16.i67.i744 = xor i64 %348, %347
  store i64 %xor16.i67.i744, ptr %arrayidx15.i66.i743, align 8
  %arrayidx17.i68.i745 = getelementptr inbounds nuw i8, ptr %add.ptr13.i728, i32 48
  %349 = load i64, ptr %arrayidx17.i68.i745, align 8
  %arrayidx18.i69.i746 = getelementptr inbounds nuw i8, ptr %q.i37, i32 48
  %350 = load i64, ptr %arrayidx18.i69.i746, align 8
  %xor19.i70.i747 = xor i64 %350, %349
  store i64 %xor19.i70.i747, ptr %arrayidx18.i69.i746, align 8
  %arrayidx20.i71.i748 = getelementptr inbounds nuw i8, ptr %add.ptr13.i728, i32 56
  %351 = load i64, ptr %arrayidx20.i71.i748, align 8
  %arrayidx21.i72.i749 = getelementptr inbounds nuw i8, ptr %q.i37, i32 56
  %352 = load i64, ptr %arrayidx21.i72.i749, align 8
  %xor22.i73.i750 = xor i64 %352, %351
  store i64 %xor22.i73.i750, ptr %arrayidx21.i72.i749, align 8
  %inc15.i751 = add nuw nsw i32 %i.1.i204831, 1
  %exitcond1.i205.not = icmp eq i32 %inc15.i751, 10
  br i1 %exitcond1.i205.not, label %for.end16.i206, label %for.body7.i573, !llvm.loop !96

for.end16.i206:                                   ; preds = %shift_rows.exit.i696
  %arrayidx.i122.i207 = getelementptr inbounds nuw i8, ptr %q.i37, i32 56
  %353 = load i64, ptr %arrayidx.i122.i207, align 8
  %arrayidx1.i123.i208 = getelementptr inbounds nuw i8, ptr %q.i37, i32 48
  %354 = load i64, ptr %arrayidx1.i123.i208, align 8
  %arrayidx2.i124.i209 = getelementptr inbounds nuw i8, ptr %q.i37, i32 40
  %355 = load i64, ptr %arrayidx2.i124.i209, align 8
  %arrayidx3.i125.i210 = getelementptr inbounds nuw i8, ptr %q.i37, i32 32
  %356 = load i64, ptr %arrayidx3.i125.i210, align 8
  %arrayidx4.i126.i211 = getelementptr inbounds nuw i8, ptr %q.i37, i32 24
  %357 = load i64, ptr %arrayidx4.i126.i211, align 8
  %arrayidx5.i127.i212 = getelementptr inbounds nuw i8, ptr %q.i37, i32 16
  %358 = load i64, ptr %arrayidx5.i127.i212, align 8
  %arrayidx6.i128.i213 = getelementptr inbounds nuw i8, ptr %q.i37, i32 8
  %359 = load i64, ptr %arrayidx6.i128.i213, align 8
  %360 = load i64, ptr %q.i37, align 8
  %xor.i129.i214 = xor i64 %356, %358
  %xor8.i130.i215 = xor i64 %353, %359
  %xor9.i131.i216 = xor i64 %353, %356
  %xor10.i132.i217 = xor i64 %353, %358
  %xor11.i133.i218 = xor i64 %354, %355
  %xor12.i134.i219 = xor i64 %xor11.i133.i218, %360
  %xor13.i135.i220 = xor i64 %xor12.i134.i219, %356
  %xor14.i136.i221 = xor i64 %xor8.i130.i215, %xor.i129.i214
  %xor15.i137.i222 = xor i64 %xor12.i134.i219, %353
  %xor16.i138.i223 = xor i64 %xor12.i134.i219, %359
  %xor17.i139.i224 = xor i64 %xor16.i138.i223, %xor10.i132.i217
  %xor18.i140.i225 = xor i64 %357, %xor14.i136.i221
  %xor19.i141.i226 = xor i64 %xor18.i140.i225, %358
  %xor20.i142.i227 = xor i64 %xor18.i140.i225, %354
  %xor21.i143.i228 = xor i64 %xor19.i141.i226, %360
  %xor22.i144.i229 = xor i64 %xor19.i141.i226, %xor11.i133.i218
  %xor23.i145.i230 = xor i64 %xor20.i142.i227, %xor9.i131.i216
  %xor24.i146.i231 = xor i64 %360, %xor23.i145.i230
  %xor25.i147.i232 = xor i64 %xor22.i144.i229, %xor23.i145.i230
  %xor27.i148.i233 = xor i64 %xor11.i133.i218, %xor23.i145.i230
  %and.i149.i234 = and i64 %xor14.i136.i221, %xor19.i141.i226
  %and30.i150.i235 = and i64 %xor17.i139.i224, %xor21.i143.i228
  %xor31.i151.i236 = xor i64 %and30.i150.i235, %and.i149.i234
  %and32.i152.i237 = and i64 %xor13.i135.i220, %360
  %and34.i153.i238 = and i64 %xor8.i130.i215, %xor27.i148.i233
  %and35.i154.i239 = and i64 %xor16.i138.i223, %xor12.i134.i219
  %and37.i155.i240 = and i64 %xor15.i137.i222, %xor24.i146.i231
  %and39.i156.i241 = and i64 %xor9.i131.i216, %xor23.i145.i230
  %and40.i157.i242 = and i64 %xor.i129.i214, %xor25.i147.i232
  %xor41.i158.i243 = xor i64 %and40.i157.i242, %and39.i156.i241
  %and42.i159.i244 = and i64 %xor10.i132.i217, %xor22.i144.i229
  %xor43.i160.i245 = xor i64 %and42.i159.i244, %and39.i156.i241
  %xor44.i161.i246 = xor i64 %xor31.i151.i236, %xor41.i158.i243
  %xor48.i162.i247 = xor i64 %xor44.i161.i246, %xor20.i142.i227
  %361 = xor i64 %xor10.i132.i217, %and32.i152.i237
  %362 = xor i64 %361, %xor22.i144.i229
  %363 = xor i64 %362, %and.i149.i234
  %xor49.i163.i248 = xor i64 %363, %xor43.i160.i245
  %364 = xor i64 %xor27.i148.i233, %and35.i154.i239
  %365 = xor i64 %364, %xor8.i130.i215
  %366 = xor i64 %365, %and34.i153.i238
  %xor50.i164.i249 = xor i64 %366, %xor41.i158.i243
  %367 = xor i64 %xor27.i148.i233, %and37.i155.i240
  %368 = xor i64 %367, %353
  %369 = xor i64 %368, %and34.i153.i238
  %xor51.i165.i250 = xor i64 %369, %xor43.i160.i245
  %xor52.i166.i251 = xor i64 %xor48.i162.i247, %xor49.i163.i248
  %and53.i167.i252 = and i64 %xor48.i162.i247, %xor50.i164.i249
  %xor54.i168.i253 = xor i64 %xor51.i165.i250, %and53.i167.i252
  %and55.i169.i254 = and i64 %xor52.i166.i251, %xor54.i168.i253
  %xor56.i170.i255 = xor i64 %and55.i169.i254, %xor49.i163.i248
  %xor57.i171.i256 = xor i64 %xor50.i164.i249, %xor51.i165.i250
  %xor58.i172.i257 = xor i64 %xor49.i163.i248, %and53.i167.i252
  %and59.i173.i258 = and i64 %xor58.i172.i257, %xor57.i171.i256
  %xor60.i174.i259 = xor i64 %and59.i173.i258, %xor51.i165.i250
  %xor61.i175.i260 = xor i64 %xor50.i164.i249, %xor60.i174.i259
  %xor62.i176.i261 = xor i64 %and59.i173.i258, %and53.i167.i252
  %and63.i177.i262 = and i64 %xor51.i165.i250, %xor62.i176.i261
  %xor64.i178.i263 = xor i64 %and63.i177.i262, %xor61.i175.i260
  %xor65.i179.i264 = xor i64 %xor54.i168.i253, %and63.i177.i262
  %and66.i180.i265 = and i64 %xor56.i170.i255, %xor65.i179.i264
  %xor67.i181.i266 = xor i64 %xor52.i166.i251, %and66.i180.i265
  %xor68.i182.i267 = xor i64 %xor67.i181.i266, %xor64.i178.i263
  %xor69.i183.i268 = xor i64 %xor56.i170.i255, %xor60.i174.i259
  %xor70.i184.i269 = xor i64 %xor56.i170.i255, %xor67.i181.i266
  %xor71.i185.i270 = xor i64 %and63.i177.i262, %xor50.i164.i249
  %xor72.i186.i271 = xor i64 %xor69.i183.i268, %xor68.i182.i267
  %and73.i187.i272 = and i64 %xor71.i185.i270, %xor19.i141.i226
  %and74.i188.i273 = and i64 %xor64.i178.i263, %xor21.i143.i228
  %and75.i189.i274 = and i64 %xor60.i174.i259, %360
  %and76.i190.i275 = and i64 %xor70.i184.i269, %xor27.i148.i233
  %and77.i191.i276 = and i64 %xor67.i181.i266, %xor12.i134.i219
  %and78.i192.i277 = and i64 %xor56.i170.i255, %xor24.i146.i231
  %and79.i193.i278 = and i64 %xor69.i183.i268, %xor23.i145.i230
  %and80.i194.i279 = and i64 %xor72.i186.i271, %xor25.i147.i232
  %and81.i195.i280 = and i64 %xor68.i182.i267, %xor22.i144.i229
  %and82.i196.i281 = and i64 %xor71.i185.i270, %xor14.i136.i221
  %and83.i197.i282 = and i64 %xor64.i178.i263, %xor17.i139.i224
  %and84.i198.i283 = and i64 %xor60.i174.i259, %xor13.i135.i220
  %and85.i199.i284 = and i64 %xor70.i184.i269, %xor8.i130.i215
  %and86.i200.i285 = and i64 %xor67.i181.i266, %xor16.i138.i223
  %and87.i201.i286 = and i64 %xor56.i170.i255, %xor15.i137.i222
  %and88.i202.i287 = and i64 %xor69.i183.i268, %xor9.i131.i216
  %and89.i203.i288 = and i64 %xor72.i186.i271, %xor.i129.i214
  %and90.i204.i289 = and i64 %xor68.i182.i267, %xor10.i132.i217
  %xor91.i205.i290 = xor i64 %and88.i202.i287, %and89.i203.i288
  %xor92.i206.i291 = xor i64 %and83.i197.i282, %and84.i198.i283
  %xor93.i207.i292 = xor i64 %and78.i192.i277, %and86.i200.i285
  %xor94.i208.i293 = xor i64 %and82.i196.i281, %and83.i197.i282
  %xor95.i209.i294 = xor i64 %and75.i189.i274, %and85.i199.i284
  %xor96.i210.i295 = xor i64 %and75.i189.i274, %and78.i192.i277
  %xor97.i211.i296 = xor i64 %and80.i194.i279, %and81.i195.i280
  %xor98.i212.i297 = xor i64 %and73.i187.i272, %and76.i190.i275
  %xor99.i213.i298 = xor i64 %and79.i193.i278, %and80.i194.i279
  %xor100.i214.i299 = xor i64 %and89.i203.i288, %and90.i204.i289
  %xor101.i215.i300 = xor i64 %and85.i199.i284, %xor93.i207.i292
  %xor102.i216.i301 = xor i64 %xor95.i209.i294, %xor98.i212.i297
  %xor103.i217.i302 = xor i64 %and77.i191.i276, %xor91.i205.i290
  %xor104.i218.i303 = xor i64 %and76.i190.i275, %xor99.i213.i298
  %xor105.i219.i304 = xor i64 %xor91.i205.i290, %xor102.i216.i301
  %xor106.i220.i305 = xor i64 %and87.i201.i286, %xor102.i216.i301
  %xor107.i221.i306 = xor i64 %xor97.i211.i296, %xor103.i217.i302
  %xor108.i222.i307 = xor i64 %xor94.i208.i293, %xor103.i217.i302
  %xor109.i223.i308 = xor i64 %and77.i191.i276, %xor104.i218.i303
  %xor110.i224.i309 = xor i64 %xor106.i220.i305, %xor107.i221.i306
  %xor111.i225.i310 = xor i64 %and74.i188.i273, %xor108.i222.i307
  %xor112.i226.i311 = xor i64 %xor104.i218.i303, %xor108.i222.i307
  %370 = xor i64 %xor107.i221.i306, %xor101.i215.i300
  %xor113.i227.i312 = xor i64 %370, -1
  %371 = xor i64 %xor105.i219.i304, %xor93.i207.i292
  %xor115.i228.i313 = xor i64 %371, -1
  %xor117.i229.i314 = xor i64 %xor98.i212.i297, %xor111.i225.i310
  %xor118.i230.i315 = xor i64 %xor96.i210.i295, %xor111.i225.i310
  %xor119.i231.i316 = xor i64 %xor92.i206.i291, %xor110.i224.i309
  %372 = xor i64 %xor117.i229.i314, %xor109.i223.i308
  %xor121.i232.i317 = xor i64 %372, -1
  %373 = xor i64 %xor110.i224.i309, %xor100.i214.i299
  %374 = xor i64 %373, %xor109.i223.i308
  %xor123.i233.i318 = xor i64 %374, -1
  %arrayidx124.i234.i319 = getelementptr inbounds nuw i8, ptr %q.i37, i32 56
  store i64 %xor112.i226.i311, ptr %arrayidx124.i234.i319, align 8
  %arrayidx125.i235.i320 = getelementptr inbounds nuw i8, ptr %q.i37, i32 48
  store i64 %xor121.i232.i317, ptr %arrayidx125.i235.i320, align 8
  %arrayidx126.i236.i321 = getelementptr inbounds nuw i8, ptr %q.i37, i32 40
  store i64 %xor123.i233.i318, ptr %arrayidx126.i236.i321, align 8
  %arrayidx127.i237.i322 = getelementptr inbounds nuw i8, ptr %q.i37, i32 32
  store i64 %xor117.i229.i314, ptr %arrayidx127.i237.i322, align 8
  %arrayidx128.i238.i323 = getelementptr inbounds nuw i8, ptr %q.i37, i32 24
  store i64 %xor118.i230.i315, ptr %arrayidx128.i238.i323, align 8
  %arrayidx129.i239.i324 = getelementptr inbounds nuw i8, ptr %q.i37, i32 16
  store i64 %xor119.i231.i316, ptr %arrayidx129.i239.i324, align 8
  %arrayidx130.i240.i325 = getelementptr inbounds nuw i8, ptr %q.i37, i32 8
  store i64 %xor113.i227.i312, ptr %arrayidx130.i240.i325, align 8
  store i64 %xor115.i228.i313, ptr %q.i37, align 8
  br label %for.body.i5.i550

for.body.i5.i550:                                 ; preds = %for.end16.i206, %for.body.i5.i550
  %i.0.i3.i327832 = phi i32 [ 0, %for.end16.i206 ], [ %inc.i27.i572, %for.body.i5.i550 ]
  %arrayidx.i6.i551 = getelementptr inbounds nuw i64, ptr %q.i37, i32 %i.0.i3.i327832
  %375 = load i64, ptr %arrayidx.i6.i551, align 8
  %and.i7.i552 = and i64 %375, 65535
  %and1.i8.i553 = lshr i64 %375, 4
  %shr.i9.i554 = and i64 %and1.i8.i553, 268369920
  %or.i10.i555 = or disjoint i64 %and.i7.i552, %shr.i9.i554
  %and2.i11.i556 = shl i64 %375, 12
  %shl.i12.i557 = and i64 %and2.i11.i556, 4026531840
  %or3.i13.i558 = or disjoint i64 %or.i10.i555, %shl.i12.i557
  %and4.i14.i559 = lshr i64 %375, 8
  %shr5.i15.i560 = and i64 %and4.i14.i559, 1095216660480
  %or6.i16.i561 = or disjoint i64 %or3.i13.i558, %shr5.i15.i560
  %and7.i17.i562 = shl i64 %375, 8
  %shl8.i18.i563 = and i64 %and7.i17.i562, 280375465082880
  %or9.i19.i564 = or disjoint i64 %or6.i16.i561, %shl8.i18.i563
  %and10.i20.i565 = lshr i64 %375, 12
  %shr11.i21.i566 = and i64 %and10.i20.i565, 4222124650659840
  %or12.i22.i567 = or disjoint i64 %or9.i19.i564, %shr11.i21.i566
  %and13.i23.i568 = shl i64 %375, 4
  %shl14.i24.i569 = and i64 %and13.i23.i568, -4503599627370496
  %or15.i25.i570 = or i64 %or12.i22.i567, %shl14.i24.i569
  %arrayidx16.i26.i571 = getelementptr inbounds nuw i64, ptr %q.i37, i32 %i.0.i3.i327832
  store i64 %or15.i25.i570, ptr %arrayidx16.i26.i571, align 8
  %inc.i27.i572 = add nuw nsw i32 %i.0.i3.i327832, 1
  %exitcond.i4.i328.not = icmp eq i32 %inc.i27.i572, 8
  br i1 %exitcond.i4.i328.not, label %shift_rows.exit28.i329, label %for.body.i5.i550, !llvm.loop !97

shift_rows.exit28.i329:                           ; preds = %for.body.i5.i550
  %add.ptr20.i330 = getelementptr inbounds nuw i8, ptr %0, i32 640
  %376 = load i64, ptr %add.ptr20.i330, align 8
  %377 = load i64, ptr %q.i37, align 8
  %xor.i74.i331 = xor i64 %377, %376
  store i64 %xor.i74.i331, ptr %q.i37, align 8
  %arrayidx2.i75.i332 = getelementptr inbounds nuw i8, ptr %0, i32 648
  %378 = load i64, ptr %arrayidx2.i75.i332, align 8
  %arrayidx3.i76.i333 = getelementptr inbounds nuw i8, ptr %q.i37, i32 8
  %379 = load i64, ptr %arrayidx3.i76.i333, align 8
  %xor4.i77.i334 = xor i64 %379, %378
  store i64 %xor4.i77.i334, ptr %arrayidx3.i76.i333, align 8
  %arrayidx5.i78.i335 = getelementptr inbounds nuw i8, ptr %0, i32 656
  %380 = load i64, ptr %arrayidx5.i78.i335, align 8
  %arrayidx6.i79.i336 = getelementptr inbounds nuw i8, ptr %q.i37, i32 16
  %381 = load i64, ptr %arrayidx6.i79.i336, align 8
  %xor7.i80.i337 = xor i64 %381, %380
  store i64 %xor7.i80.i337, ptr %arrayidx6.i79.i336, align 8
  %arrayidx8.i81.i338 = getelementptr inbounds nuw i8, ptr %0, i32 664
  %382 = load i64, ptr %arrayidx8.i81.i338, align 8
  %arrayidx9.i82.i339 = getelementptr inbounds nuw i8, ptr %q.i37, i32 24
  %383 = load i64, ptr %arrayidx9.i82.i339, align 8
  %xor10.i83.i340 = xor i64 %383, %382
  store i64 %xor10.i83.i340, ptr %arrayidx9.i82.i339, align 8
  %arrayidx11.i84.i341 = getelementptr inbounds nuw i8, ptr %0, i32 672
  %384 = load i64, ptr %arrayidx11.i84.i341, align 8
  %arrayidx12.i85.i342 = getelementptr inbounds nuw i8, ptr %q.i37, i32 32
  %385 = load i64, ptr %arrayidx12.i85.i342, align 8
  %xor13.i86.i343 = xor i64 %385, %384
  store i64 %xor13.i86.i343, ptr %arrayidx12.i85.i342, align 8
  %arrayidx14.i87.i344 = getelementptr inbounds nuw i8, ptr %0, i32 680
  %386 = load i64, ptr %arrayidx14.i87.i344, align 8
  %arrayidx15.i88.i345 = getelementptr inbounds nuw i8, ptr %q.i37, i32 40
  %387 = load i64, ptr %arrayidx15.i88.i345, align 8
  %xor16.i89.i346 = xor i64 %387, %386
  store i64 %xor16.i89.i346, ptr %arrayidx15.i88.i345, align 8
  %arrayidx17.i90.i347 = getelementptr inbounds nuw i8, ptr %0, i32 688
  %388 = load i64, ptr %arrayidx17.i90.i347, align 8
  %arrayidx18.i91.i348 = getelementptr inbounds nuw i8, ptr %q.i37, i32 48
  %389 = load i64, ptr %arrayidx18.i91.i348, align 8
  %xor19.i92.i349 = xor i64 %389, %388
  store i64 %xor19.i92.i349, ptr %arrayidx18.i91.i348, align 8
  %arrayidx20.i93.i350 = getelementptr inbounds nuw i8, ptr %0, i32 696
  %390 = load i64, ptr %arrayidx20.i93.i350, align 8
  %arrayidx21.i94.i351 = getelementptr inbounds nuw i8, ptr %q.i37, i32 56
  %391 = load i64, ptr %arrayidx21.i94.i351, align 8
  %xor22.i95.i352 = xor i64 %391, %390
  store i64 %xor22.i95.i352, ptr %arrayidx21.i94.i351, align 8
  %392 = load i64, ptr %q.i37, align 8
  %arrayidx1.i241.i353 = getelementptr inbounds nuw i8, ptr %q.i37, i32 8
  %393 = load i64, ptr %arrayidx1.i241.i353, align 8
  %and.i242.i354 = and i64 %392, 6148914691236517205
  %and2.i243.i355 = shl i64 %393, 1
  %shl.i244.i356 = and i64 %and2.i243.i355, -6148914691236517206
  %or.i245.i357 = or disjoint i64 %and.i242.i354, %shl.i244.i356
  store i64 %or.i245.i357, ptr %q.i37, align 8
  %and4.i246.i358 = lshr i64 %392, 1
  %shr.i247.i359 = and i64 %and4.i246.i358, 6148914691236517205
  %and5.i.i360 = and i64 %393, -6148914691236517206
  %or6.i248.i361 = or disjoint i64 %shr.i247.i359, %and5.i.i360
  %arrayidx7.i249.i362 = getelementptr inbounds nuw i8, ptr %q.i37, i32 8
  store i64 %or6.i248.i361, ptr %arrayidx7.i249.i362, align 8
  %arrayidx11.i250.i363 = getelementptr inbounds nuw i8, ptr %q.i37, i32 16
  %394 = load i64, ptr %arrayidx11.i250.i363, align 8
  %arrayidx12.i251.i364 = getelementptr inbounds nuw i8, ptr %q.i37, i32 24
  %395 = load i64, ptr %arrayidx12.i251.i364, align 8
  %and13.i252.i365 = and i64 %394, 6148914691236517205
  %and14.i253.i366 = shl i64 %395, 1
  %shl15.i.i367 = and i64 %and14.i253.i366, -6148914691236517206
  %or16.i.i368 = or disjoint i64 %and13.i252.i365, %shl15.i.i367
  %arrayidx17.i254.i369 = getelementptr inbounds nuw i8, ptr %q.i37, i32 16
  store i64 %or16.i.i368, ptr %arrayidx17.i254.i369, align 8
  %and18.i.i370 = lshr i64 %394, 1
  %shr19.i.i371 = and i64 %and18.i.i370, 6148914691236517205
  %and20.i.i372 = and i64 %395, -6148914691236517206
  %or21.i.i373 = or disjoint i64 %shr19.i.i371, %and20.i.i372
  %arrayidx22.i.i374 = getelementptr inbounds nuw i8, ptr %q.i37, i32 24
  store i64 %or21.i.i373, ptr %arrayidx22.i.i374, align 8
  %arrayidx27.i.i375 = getelementptr inbounds nuw i8, ptr %q.i37, i32 32
  %396 = load i64, ptr %arrayidx27.i.i375, align 8
  %arrayidx28.i255.i376 = getelementptr inbounds nuw i8, ptr %q.i37, i32 40
  %397 = load i64, ptr %arrayidx28.i255.i376, align 8
  %and29.i.i377 = and i64 %396, 6148914691236517205
  %and30.i256.i378 = shl i64 %397, 1
  %shl31.i.i379 = and i64 %and30.i256.i378, -6148914691236517206
  %or32.i257.i380 = or disjoint i64 %and29.i.i377, %shl31.i.i379
  %arrayidx33.i258.i381 = getelementptr inbounds nuw i8, ptr %q.i37, i32 32
  store i64 %or32.i257.i380, ptr %arrayidx33.i258.i381, align 8
  %and34.i259.i382 = lshr i64 %396, 1
  %shr35.i.i383 = and i64 %and34.i259.i382, 6148914691236517205
  %and36.i.i384 = and i64 %397, -6148914691236517206
  %or37.i.i385 = or disjoint i64 %shr35.i.i383, %and36.i.i384
  %arrayidx38.i.i386 = getelementptr inbounds nuw i8, ptr %q.i37, i32 40
  store i64 %or37.i.i385, ptr %arrayidx38.i.i386, align 8
  %arrayidx43.i.i387 = getelementptr inbounds nuw i8, ptr %q.i37, i32 48
  %398 = load i64, ptr %arrayidx43.i.i387, align 8
  %arrayidx44.i.i388 = getelementptr inbounds nuw i8, ptr %q.i37, i32 56
  %399 = load i64, ptr %arrayidx44.i.i388, align 8
  %and45.i.i389 = and i64 %398, 6148914691236517205
  %and46.i.i390 = shl i64 %399, 1
  %shl47.i.i391 = and i64 %and46.i.i390, -6148914691236517206
  %or48.i.i392 = or disjoint i64 %and45.i.i389, %shl47.i.i391
  %arrayidx49.i.i393 = getelementptr inbounds nuw i8, ptr %q.i37, i32 48
  store i64 %or48.i.i392, ptr %arrayidx49.i.i393, align 8
  %and50.i.i394 = lshr i64 %398, 1
  %shr51.i.i395 = and i64 %and50.i.i394, 6148914691236517205
  %and52.i.i396 = and i64 %399, -6148914691236517206
  %or53.i.i397 = or disjoint i64 %shr51.i.i395, %and52.i.i396
  %arrayidx54.i260.i398 = getelementptr inbounds nuw i8, ptr %q.i37, i32 56
  store i64 %or53.i.i397, ptr %arrayidx54.i260.i398, align 8
  %400 = load i64, ptr %q.i37, align 8
  %arrayidx60.i.i399 = getelementptr inbounds nuw i8, ptr %q.i37, i32 16
  %401 = load i64, ptr %arrayidx60.i.i399, align 8
  %and61.i.i400 = and i64 %400, 3689348814741910323
  %and62.i.i401 = shl i64 %401, 2
  %shl63.i.i402 = and i64 %and62.i.i401, -3689348814741910324
  %or64.i.i403 = or disjoint i64 %and61.i.i400, %shl63.i.i402
  store i64 %or64.i.i403, ptr %q.i37, align 8
  %and66.i261.i404 = lshr i64 %400, 2
  %shr67.i.i405 = and i64 %and66.i261.i404, 3689348814741910323
  %and68.i.i406 = and i64 %401, -3689348814741910324
  %or69.i.i407 = or disjoint i64 %shr67.i.i405, %and68.i.i406
  %arrayidx70.i.i408 = getelementptr inbounds nuw i8, ptr %q.i37, i32 16
  store i64 %or69.i.i407, ptr %arrayidx70.i.i408, align 8
  %arrayidx75.i.i409 = getelementptr inbounds nuw i8, ptr %q.i37, i32 8
  %402 = load i64, ptr %arrayidx75.i.i409, align 8
  %arrayidx76.i.i410 = getelementptr inbounds nuw i8, ptr %q.i37, i32 24
  %403 = load i64, ptr %arrayidx76.i.i410, align 8
  %and77.i262.i411 = and i64 %402, 3689348814741910323
  %and78.i263.i412 = shl i64 %403, 2
  %shl79.i.i413 = and i64 %and78.i263.i412, -3689348814741910324
  %or80.i.i414 = or disjoint i64 %and77.i262.i411, %shl79.i.i413
  %arrayidx81.i.i415 = getelementptr inbounds nuw i8, ptr %q.i37, i32 8
  store i64 %or80.i.i414, ptr %arrayidx81.i.i415, align 8
  %and82.i264.i416 = lshr i64 %402, 2
  %shr83.i.i417 = and i64 %and82.i264.i416, 3689348814741910323
  %and84.i265.i418 = and i64 %403, -3689348814741910324
  %or85.i.i419 = or disjoint i64 %shr83.i.i417, %and84.i265.i418
  %arrayidx86.i.i420 = getelementptr inbounds nuw i8, ptr %q.i37, i32 24
  store i64 %or85.i.i419, ptr %arrayidx86.i.i420, align 8
  %arrayidx91.i.i421 = getelementptr inbounds nuw i8, ptr %q.i37, i32 32
  %404 = load i64, ptr %arrayidx91.i.i421, align 8
  %arrayidx92.i.i422 = getelementptr inbounds nuw i8, ptr %q.i37, i32 48
  %405 = load i64, ptr %arrayidx92.i.i422, align 8
  %and93.i.i423 = and i64 %404, 3689348814741910323
  %and94.i.i424 = shl i64 %405, 2
  %shl95.i.i425 = and i64 %and94.i.i424, -3689348814741910324
  %or96.i.i426 = or disjoint i64 %and93.i.i423, %shl95.i.i425
  %arrayidx97.i.i427 = getelementptr inbounds nuw i8, ptr %q.i37, i32 32
  store i64 %or96.i.i426, ptr %arrayidx97.i.i427, align 8
  %and98.i.i428 = lshr i64 %404, 2
  %shr99.i.i429 = and i64 %and98.i.i428, 3689348814741910323
  %and100.i.i430 = and i64 %405, -3689348814741910324
  %or101.i.i431 = or disjoint i64 %shr99.i.i429, %and100.i.i430
  %arrayidx102.i.i432 = getelementptr inbounds nuw i8, ptr %q.i37, i32 48
  store i64 %or101.i.i431, ptr %arrayidx102.i.i432, align 8
  %arrayidx107.i.i433 = getelementptr inbounds nuw i8, ptr %q.i37, i32 40
  %406 = load i64, ptr %arrayidx107.i.i433, align 8
  %arrayidx108.i.i434 = getelementptr inbounds nuw i8, ptr %q.i37, i32 56
  %407 = load i64, ptr %arrayidx108.i.i434, align 8
  %and109.i.i435 = and i64 %406, 3689348814741910323
  %and110.i.i436 = shl i64 %407, 2
  %shl111.i.i437 = and i64 %and110.i.i436, -3689348814741910324
  %or112.i.i438 = or disjoint i64 %and109.i.i435, %shl111.i.i437
  %arrayidx113.i.i439 = getelementptr inbounds nuw i8, ptr %q.i37, i32 40
  store i64 %or112.i.i438, ptr %arrayidx113.i.i439, align 8
  %and114.i.i440 = lshr i64 %406, 2
  %shr115.i.i441 = and i64 %and114.i.i440, 3689348814741910323
  %and116.i.i442 = and i64 %407, -3689348814741910324
  %or117.i.i443 = or disjoint i64 %shr115.i.i441, %and116.i.i442
  %arrayidx118.i.i444 = getelementptr inbounds nuw i8, ptr %q.i37, i32 56
  store i64 %or117.i.i443, ptr %arrayidx118.i.i444, align 8
  %408 = load i64, ptr %q.i37, align 8
  %arrayidx124.i266.i445 = getelementptr inbounds nuw i8, ptr %q.i37, i32 32
  %409 = load i64, ptr %arrayidx124.i266.i445, align 8
  %and125.i.i446 = and i64 %408, 1085102592571150095
  %and126.i.i447 = shl i64 %409, 4
  %shl127.i.i448 = and i64 %and126.i.i447, -1085102592571150096
  %or128.i.i449 = or disjoint i64 %and125.i.i446, %shl127.i.i448
  store i64 %or128.i.i449, ptr %q.i37, align 8
  %and130.i.i450 = lshr i64 %408, 4
  %shr131.i.i451 = and i64 %and130.i.i450, 1085102592571150095
  %and132.i.i452 = and i64 %409, -1085102592571150096
  %or133.i.i453 = or disjoint i64 %shr131.i.i451, %and132.i.i452
  %arrayidx134.i.i454 = getelementptr inbounds nuw i8, ptr %q.i37, i32 32
  store i64 %or133.i.i453, ptr %arrayidx134.i.i454, align 8
  %arrayidx139.i.i455 = getelementptr inbounds nuw i8, ptr %q.i37, i32 8
  %410 = load i64, ptr %arrayidx139.i.i455, align 8
  %arrayidx140.i.i456 = getelementptr inbounds nuw i8, ptr %q.i37, i32 40
  %411 = load i64, ptr %arrayidx140.i.i456, align 8
  %and141.i.i457 = and i64 %410, 1085102592571150095
  %and142.i.i458 = shl i64 %411, 4
  %shl143.i.i459 = and i64 %and142.i.i458, -1085102592571150096
  %or144.i.i460 = or disjoint i64 %and141.i.i457, %shl143.i.i459
  %arrayidx145.i.i461 = getelementptr inbounds nuw i8, ptr %q.i37, i32 8
  store i64 %or144.i.i460, ptr %arrayidx145.i.i461, align 8
  %and146.i.i462 = lshr i64 %410, 4
  %shr147.i.i463 = and i64 %and146.i.i462, 1085102592571150095
  %and148.i.i464 = and i64 %411, -1085102592571150096
  %or149.i.i465 = or disjoint i64 %shr147.i.i463, %and148.i.i464
  %arrayidx150.i.i466 = getelementptr inbounds nuw i8, ptr %q.i37, i32 40
  store i64 %or149.i.i465, ptr %arrayidx150.i.i466, align 8
  %arrayidx155.i.i467 = getelementptr inbounds nuw i8, ptr %q.i37, i32 16
  %412 = load i64, ptr %arrayidx155.i.i467, align 8
  %arrayidx156.i.i468 = getelementptr inbounds nuw i8, ptr %q.i37, i32 48
  %413 = load i64, ptr %arrayidx156.i.i468, align 8
  %and157.i.i469 = and i64 %412, 1085102592571150095
  %and158.i.i470 = shl i64 %413, 4
  %shl159.i.i471 = and i64 %and158.i.i470, -1085102592571150096
  %or160.i.i472 = or disjoint i64 %and157.i.i469, %shl159.i.i471
  %arrayidx161.i.i473 = getelementptr inbounds nuw i8, ptr %q.i37, i32 16
  store i64 %or160.i.i472, ptr %arrayidx161.i.i473, align 8
  %and162.i.i474 = lshr i64 %412, 4
  %shr163.i.i475 = and i64 %and162.i.i474, 1085102592571150095
  %and164.i.i476 = and i64 %413, -1085102592571150096
  %or165.i.i477 = or disjoint i64 %shr163.i.i475, %and164.i.i476
  %arrayidx166.i.i478 = getelementptr inbounds nuw i8, ptr %q.i37, i32 48
  store i64 %or165.i.i477, ptr %arrayidx166.i.i478, align 8
  %arrayidx171.i.i479 = getelementptr inbounds nuw i8, ptr %q.i37, i32 24
  %414 = load i64, ptr %arrayidx171.i.i479, align 8
  %arrayidx172.i.i480 = getelementptr inbounds nuw i8, ptr %q.i37, i32 56
  %415 = load i64, ptr %arrayidx172.i.i480, align 8
  %and173.i.i481 = and i64 %414, 1085102592571150095
  %and174.i.i482 = shl i64 %415, 4
  %shl175.i.i483 = and i64 %and174.i.i482, -1085102592571150096
  %or176.i.i484 = or disjoint i64 %and173.i.i481, %shl175.i.i483
  %arrayidx177.i.i485 = getelementptr inbounds nuw i8, ptr %q.i37, i32 24
  store i64 %or176.i.i484, ptr %arrayidx177.i.i485, align 8
  %and178.i.i486 = lshr i64 %414, 4
  %shr179.i.i487 = and i64 %and178.i.i486, 1085102592571150095
  %and180.i.i488 = and i64 %415, -1085102592571150096
  %or181.i267.i489 = or disjoint i64 %shr179.i.i487, %and180.i.i488
  %arrayidx182.i.i490 = getelementptr inbounds nuw i8, ptr %q.i37, i32 56
  store i64 %or181.i267.i489, ptr %arrayidx182.i.i490, align 8
  br label %for.body24.i514

while.cond.i.i495.preheader:                      ; preds = %for.body24.i514
  br label %while.body.i.i500

for.body24.i514:                                  ; preds = %shift_rows.exit28.i329, %for.body24.i514
  %i.2.i492833 = phi i32 [ 0, %shift_rows.exit28.i329 ], [ %inc32.i549, %for.body24.i514 ]
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
  br i1 %exitcond2.i493.not, label %while.cond.i.i495.preheader, label %for.body24.i514, !llvm.loop !98

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
  br i1 %cmp.not.i.i499, label %aes_ecb4x.exit813, label %while.body.i.i500, !llvm.loop !99

aes_ecb4x.exit813:                                ; preds = %while.body.i.i500
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %w.i36)
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %q.i37)
  %add.ptr.i1 = getelementptr inbounds nuw i8, ptr %ivw.i, i32 12
  %423 = load i32, ptr %add.ptr.i1, align 4
  %424 = call i32 @llvm.bswap.i32(i32 %423)
  %add.i8.i = add i32 %424, 4
  %425 = call i32 @llvm.bswap.i32(i32 %add.i8.i)
  store i32 %425, ptr %add.ptr.i1, align 4
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %ivw.i, i32 28
  %426 = load i32, ptr %add.ptr1.i, align 4
  %427 = call i32 @llvm.bswap.i32(i32 %426)
  %add.i5.i = add i32 %427, 4
  %428 = call i32 @llvm.bswap.i32(i32 %add.i5.i)
  store i32 %428, ptr %add.ptr1.i, align 4
  %add.ptr2.i = getelementptr inbounds nuw i8, ptr %ivw.i, i32 44
  %429 = load i32, ptr %add.ptr2.i, align 4
  %430 = call i32 @llvm.bswap.i32(i32 %429)
  %add.i.i = add i32 %430, 4
  %431 = call i32 @llvm.bswap.i32(i32 %add.i.i)
  store i32 %431, ptr %add.ptr2.i, align 4
  %add.ptr3.i = getelementptr inbounds nuw i8, ptr %ivw.i, i32 60
  %432 = load i32, ptr %add.ptr3.i, align 4
  %433 = call i32 @llvm.bswap.i32(i32 %432)
  %add.i2.i = add i32 %433, 4
  %434 = call i32 @llvm.bswap.i32(i32 %add.i2.i)
  store i32 %434, ptr %add.ptr3.i, align 4
  br label %for.body.i

for.body.i:                                       ; preds = %aes_ecb4x.exit813, %for.body.i
  %i.0.i837 = phi i32 [ 0, %aes_ecb4x.exit813 ], [ %inc.i, %for.body.i ]
  %arrayidx26.i = getelementptr inbounds nuw [64 x i8], ptr %tmp.i, i32 0, i32 %i.0.i837
  %435 = load i8, ptr %arrayidx26.i, align 1
  %arrayidx27.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i.lcssa, i32 %i.0.i837
  store i8 %435, ptr %arrayidx27.i, align 1
  %inc.i = add nuw nsw i32 %i.0.i837, 1
  %exitcond = icmp ne i32 %inc.i, %outlen.addr.0.i.lcssa
  br i1 %exitcond, label %for.body.i, label %aes_ctr.exit.loopexit, !llvm.loop !100

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
  %q.i1.i = alloca [8 x i64], align 8
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
  br i1 %exitcond.i.not, label %mayo_memset.exit, label %for.body.i, !llvm.loop !101

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
  br i1 %cmp.not.i.i836, label %br_range_dec32le.exit.i853, label %while.body.i.i837, !llvm.loop !102

br_range_dec32le.exit.i853:                       ; preds = %while.body.i.i837
  %arrayidx.i854 = getelementptr inbounds nuw i8, ptr %skey.i830, i32 12
  %4 = load i32, ptr %arrayidx.i854, align 4
  br label %for.body.i884

for.cond27.i.preheader:                           ; preds = %if.end16.i
  br label %for.body30.i

for.body.i884:                                    ; preds = %br_range_dec32le.exit.i853, %if.end16.i
  %tmp.0.i1133 = phi i32 [ %4, %br_range_dec32le.exit.i853 ], [ %xor19.i, %if.end16.i ]
  %k.0.i1132 = phi i32 [ 0, %br_range_dec32le.exit.i853 ], [ %spec.select1.i, %if.end16.i ]
  %j.0.i1131 = phi i32 [ 0, %br_range_dec32le.exit.i853 ], [ %spec.select.i, %if.end16.i ]
  %i.0.i8561130 = phi i32 [ 4, %br_range_dec32le.exit.i853 ], [ %inc26.i, %if.end16.i ]
  %cmp6.i = icmp eq i32 %j.0.i1131, 0
  br i1 %cmp6.i, label %if.then.i1003, label %if.end16.i

if.then.i1003:                                    ; preds = %for.body.i884
  %5 = call i32 @llvm.fshl.i32(i32 %tmp.0.i1133, i32 %tmp.0.i1133, i32 24)
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %q.i1.i)
  %call.i2.i = call ptr @memset(ptr noundef nonnull %q.i1.i, i32 noundef 0, i32 noundef 64) #8
  %conv.i3.i = zext i32 %5 to i64
  store i64 %conv.i3.i, ptr %q.i1.i, align 8
  %arrayidx1.i431.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  %6 = load i64, ptr %arrayidx1.i431.i, align 8
  %and.i432.i = and i64 %conv.i3.i, 1431655765
  %and2.i433.i = shl i64 %6, 1
  %shl.i434.i = and i64 %and2.i433.i, -6148914691236517206
  %or.i435.i = or disjoint i64 %and.i432.i, %shl.i434.i
  store i64 %or.i435.i, ptr %q.i1.i, align 8
  %and4.i436.i = lshr i64 %conv.i3.i, 1
  %shr.i437.i = and i64 %and4.i436.i, 1431655765
  %and5.i438.i = and i64 %6, -6148914691236517206
  %or6.i439.i = or disjoint i64 %shr.i437.i, %and5.i438.i
  %arrayidx7.i440.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  store i64 %or6.i439.i, ptr %arrayidx7.i440.i, align 8
  %arrayidx11.i441.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  %7 = load i64, ptr %arrayidx11.i441.i, align 8
  %arrayidx12.i442.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  %8 = load i64, ptr %arrayidx12.i442.i, align 8
  %and13.i443.i = and i64 %7, 6148914691236517205
  %and14.i444.i = shl i64 %8, 1
  %shl15.i445.i = and i64 %and14.i444.i, -6148914691236517206
  %or16.i446.i = or disjoint i64 %and13.i443.i, %shl15.i445.i
  %arrayidx17.i447.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  store i64 %or16.i446.i, ptr %arrayidx17.i447.i, align 8
  %and18.i448.i = lshr i64 %7, 1
  %shr19.i449.i = and i64 %and18.i448.i, 6148914691236517205
  %and20.i450.i = and i64 %8, -6148914691236517206
  %or21.i451.i = or disjoint i64 %shr19.i449.i, %and20.i450.i
  %arrayidx22.i452.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  store i64 %or21.i451.i, ptr %arrayidx22.i452.i, align 8
  %arrayidx27.i453.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  %9 = load i64, ptr %arrayidx27.i453.i, align 8
  %arrayidx28.i454.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  %10 = load i64, ptr %arrayidx28.i454.i, align 8
  %and29.i455.i = and i64 %9, 6148914691236517205
  %and30.i456.i = shl i64 %10, 1
  %shl31.i457.i = and i64 %and30.i456.i, -6148914691236517206
  %or32.i458.i = or disjoint i64 %and29.i455.i, %shl31.i457.i
  %arrayidx33.i459.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  store i64 %or32.i458.i, ptr %arrayidx33.i459.i, align 8
  %and34.i460.i = lshr i64 %9, 1
  %shr35.i461.i = and i64 %and34.i460.i, 6148914691236517205
  %and36.i462.i = and i64 %10, -6148914691236517206
  %or37.i463.i = or disjoint i64 %shr35.i461.i, %and36.i462.i
  %arrayidx38.i464.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  store i64 %or37.i463.i, ptr %arrayidx38.i464.i, align 8
  %arrayidx43.i465.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  %11 = load i64, ptr %arrayidx43.i465.i, align 8
  %arrayidx44.i466.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  %12 = load i64, ptr %arrayidx44.i466.i, align 8
  %and45.i467.i = and i64 %11, 6148914691236517205
  %and46.i468.i = shl i64 %12, 1
  %shl47.i469.i = and i64 %and46.i468.i, -6148914691236517206
  %or48.i470.i = or disjoint i64 %and45.i467.i, %shl47.i469.i
  %arrayidx49.i471.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  store i64 %or48.i470.i, ptr %arrayidx49.i471.i, align 8
  %and50.i472.i = lshr i64 %11, 1
  %shr51.i473.i = and i64 %and50.i472.i, 6148914691236517205
  %and52.i474.i = and i64 %12, -6148914691236517206
  %or53.i475.i = or disjoint i64 %shr51.i473.i, %and52.i474.i
  %arrayidx54.i476.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  store i64 %or53.i475.i, ptr %arrayidx54.i476.i, align 8
  %13 = load i64, ptr %q.i1.i, align 8
  %arrayidx60.i477.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  %14 = load i64, ptr %arrayidx60.i477.i, align 8
  %and61.i478.i = and i64 %13, 3689348814741910323
  %and62.i479.i = shl i64 %14, 2
  %shl63.i480.i = and i64 %and62.i479.i, -3689348814741910324
  %or64.i481.i = or disjoint i64 %and61.i478.i, %shl63.i480.i
  store i64 %or64.i481.i, ptr %q.i1.i, align 8
  %and66.i482.i = lshr i64 %13, 2
  %shr67.i483.i = and i64 %and66.i482.i, 3689348814741910323
  %and68.i484.i = and i64 %14, -3689348814741910324
  %or69.i485.i = or disjoint i64 %shr67.i483.i, %and68.i484.i
  %arrayidx70.i486.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  store i64 %or69.i485.i, ptr %arrayidx70.i486.i, align 8
  %arrayidx75.i487.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  %15 = load i64, ptr %arrayidx75.i487.i, align 8
  %arrayidx76.i488.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  %16 = load i64, ptr %arrayidx76.i488.i, align 8
  %and77.i489.i = and i64 %15, 3689348814741910323
  %and78.i490.i = shl i64 %16, 2
  %shl79.i491.i = and i64 %and78.i490.i, -3689348814741910324
  %or80.i492.i = or disjoint i64 %and77.i489.i, %shl79.i491.i
  %arrayidx81.i493.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  store i64 %or80.i492.i, ptr %arrayidx81.i493.i, align 8
  %and82.i494.i = lshr i64 %15, 2
  %shr83.i495.i = and i64 %and82.i494.i, 3689348814741910323
  %and84.i496.i = and i64 %16, -3689348814741910324
  %or85.i497.i = or disjoint i64 %shr83.i495.i, %and84.i496.i
  %arrayidx86.i498.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  store i64 %or85.i497.i, ptr %arrayidx86.i498.i, align 8
  %arrayidx91.i499.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  %17 = load i64, ptr %arrayidx91.i499.i, align 8
  %arrayidx92.i500.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  %18 = load i64, ptr %arrayidx92.i500.i, align 8
  %and93.i501.i = and i64 %17, 3689348814741910323
  %and94.i502.i = shl i64 %18, 2
  %shl95.i503.i = and i64 %and94.i502.i, -3689348814741910324
  %or96.i504.i = or disjoint i64 %and93.i501.i, %shl95.i503.i
  %arrayidx97.i505.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  store i64 %or96.i504.i, ptr %arrayidx97.i505.i, align 8
  %and98.i506.i = lshr i64 %17, 2
  %shr99.i507.i = and i64 %and98.i506.i, 3689348814741910323
  %and100.i508.i = and i64 %18, -3689348814741910324
  %or101.i509.i = or disjoint i64 %shr99.i507.i, %and100.i508.i
  %arrayidx102.i510.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  store i64 %or101.i509.i, ptr %arrayidx102.i510.i, align 8
  %arrayidx107.i511.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  %19 = load i64, ptr %arrayidx107.i511.i, align 8
  %arrayidx108.i512.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  %20 = load i64, ptr %arrayidx108.i512.i, align 8
  %and109.i513.i = and i64 %19, 3689348814741910323
  %and110.i514.i = shl i64 %20, 2
  %shl111.i515.i = and i64 %and110.i514.i, -3689348814741910324
  %or112.i516.i = or disjoint i64 %and109.i513.i, %shl111.i515.i
  %arrayidx113.i517.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  store i64 %or112.i516.i, ptr %arrayidx113.i517.i, align 8
  %and114.i518.i = lshr i64 %19, 2
  %shr115.i519.i = and i64 %and114.i518.i, 3689348814741910323
  %and116.i520.i = and i64 %20, -3689348814741910324
  %or117.i521.i = or disjoint i64 %shr115.i519.i, %and116.i520.i
  %arrayidx118.i522.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  store i64 %or117.i521.i, ptr %arrayidx118.i522.i, align 8
  %21 = load i64, ptr %q.i1.i, align 8
  %arrayidx124.i523.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  %22 = load i64, ptr %arrayidx124.i523.i, align 8
  %and125.i524.i = and i64 %21, 1085102592571150095
  %and126.i525.i = shl i64 %22, 4
  %shl127.i526.i = and i64 %and126.i525.i, -1085102592571150096
  %or128.i527.i = or disjoint i64 %and125.i524.i, %shl127.i526.i
  store i64 %or128.i527.i, ptr %q.i1.i, align 8
  %and130.i528.i = lshr i64 %21, 4
  %shr131.i529.i = and i64 %and130.i528.i, 1085102592571150095
  %and132.i530.i = and i64 %22, -1085102592571150096
  %or133.i531.i = or disjoint i64 %shr131.i529.i, %and132.i530.i
  %arrayidx134.i532.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  store i64 %or133.i531.i, ptr %arrayidx134.i532.i, align 8
  %arrayidx139.i533.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  %23 = load i64, ptr %arrayidx139.i533.i, align 8
  %arrayidx140.i534.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  %24 = load i64, ptr %arrayidx140.i534.i, align 8
  %and141.i535.i = and i64 %23, 1085102592571150095
  %and142.i536.i = shl i64 %24, 4
  %shl143.i537.i = and i64 %and142.i536.i, -1085102592571150096
  %or144.i538.i = or disjoint i64 %and141.i535.i, %shl143.i537.i
  %arrayidx145.i539.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  store i64 %or144.i538.i, ptr %arrayidx145.i539.i, align 8
  %and146.i540.i = lshr i64 %23, 4
  %shr147.i541.i = and i64 %and146.i540.i, 1085102592571150095
  %and148.i542.i = and i64 %24, -1085102592571150096
  %or149.i543.i = or disjoint i64 %shr147.i541.i, %and148.i542.i
  %arrayidx150.i544.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  store i64 %or149.i543.i, ptr %arrayidx150.i544.i, align 8
  %arrayidx155.i545.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  %25 = load i64, ptr %arrayidx155.i545.i, align 8
  %arrayidx156.i546.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  %26 = load i64, ptr %arrayidx156.i546.i, align 8
  %and157.i547.i = and i64 %25, 1085102592571150095
  %and158.i548.i = shl i64 %26, 4
  %shl159.i549.i = and i64 %and158.i548.i, -1085102592571150096
  %or160.i550.i = or disjoint i64 %and157.i547.i, %shl159.i549.i
  %arrayidx161.i551.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  store i64 %or160.i550.i, ptr %arrayidx161.i551.i, align 8
  %and162.i552.i = lshr i64 %25, 4
  %shr163.i553.i = and i64 %and162.i552.i, 1085102592571150095
  %and164.i554.i = and i64 %26, -1085102592571150096
  %or165.i555.i = or disjoint i64 %shr163.i553.i, %and164.i554.i
  %arrayidx166.i556.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  store i64 %or165.i555.i, ptr %arrayidx166.i556.i, align 8
  %arrayidx171.i557.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  %27 = load i64, ptr %arrayidx171.i557.i, align 8
  %arrayidx172.i558.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  %28 = load i64, ptr %arrayidx172.i558.i, align 8
  %and173.i559.i = and i64 %27, 1085102592571150095
  %and174.i560.i = shl i64 %28, 4
  %shl175.i561.i = and i64 %and174.i560.i, -1085102592571150096
  %or176.i562.i = or disjoint i64 %and173.i559.i, %shl175.i561.i
  %arrayidx177.i563.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  store i64 %or176.i562.i, ptr %arrayidx177.i563.i, align 8
  %and178.i564.i = lshr i64 %27, 4
  %shr179.i565.i = and i64 %and178.i564.i, 1085102592571150095
  %and180.i566.i = and i64 %28, -1085102592571150096
  %or181.i567.i = or disjoint i64 %shr179.i565.i, %and180.i566.i
  %arrayidx182.i568.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  store i64 %or181.i567.i, ptr %arrayidx182.i568.i, align 8
  %arrayidx1.i21.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  %29 = load i64, ptr %arrayidx1.i21.i, align 8
  %arrayidx2.i22.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  %30 = load i64, ptr %arrayidx2.i22.i, align 8
  %arrayidx3.i23.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  %31 = load i64, ptr %arrayidx3.i23.i, align 8
  %arrayidx4.i24.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  %32 = load i64, ptr %arrayidx4.i24.i, align 8
  %arrayidx5.i25.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  %33 = load i64, ptr %arrayidx5.i25.i, align 8
  %arrayidx6.i26.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  %34 = load i64, ptr %arrayidx6.i26.i, align 8
  %35 = load i64, ptr %q.i1.i, align 8
  %xor.i27.i = xor i64 %31, %33
  %xor8.i28.i = xor i64 %or181.i567.i, %34
  %xor9.i29.i = xor i64 %or181.i567.i, %31
  %xor10.i30.i = xor i64 %or181.i567.i, %33
  %xor11.i31.i = xor i64 %29, %30
  %xor12.i32.i = xor i64 %xor11.i31.i, %35
  %xor13.i33.i = xor i64 %xor12.i32.i, %31
  %xor14.i34.i = xor i64 %xor8.i28.i, %xor.i27.i
  %xor15.i35.i = xor i64 %xor12.i32.i, %or181.i567.i
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
  %43 = xor i64 %42, %or181.i567.i
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
  %arrayidx124.i132.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  store i64 %xor112.i124.i, ptr %arrayidx124.i132.i, align 8
  %arrayidx125.i133.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  store i64 %xor121.i130.i, ptr %arrayidx125.i133.i, align 8
  %arrayidx126.i134.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  store i64 %xor123.i131.i, ptr %arrayidx126.i134.i, align 8
  %arrayidx127.i135.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  store i64 %xor117.i127.i, ptr %arrayidx127.i135.i, align 8
  %arrayidx128.i136.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  store i64 %xor118.i128.i, ptr %arrayidx128.i136.i, align 8
  %arrayidx129.i137.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  store i64 %xor119.i129.i, ptr %arrayidx129.i137.i, align 8
  %arrayidx130.i138.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  store i64 %xor113.i125.i, ptr %arrayidx130.i138.i, align 8
  %and.i140.i = and i64 %xor115.i126.i, 6148914691236517205
  %and2.i.i1004 = shl i64 %xor113.i125.i, 1
  %shl.i141.i = and i64 %and2.i.i1004, -6148914691236517206
  %or.i142.i = or disjoint i64 %and.i140.i, %shl.i141.i
  store i64 %or.i142.i, ptr %q.i1.i, align 8
  %and4.i.i1005 = lshr i64 %xor115.i126.i, 1
  %shr.i.i1006 = and i64 %and4.i.i1005, 6148914691236517205
  %and5.i.i1007 = and i64 %xor113.i125.i, -6148914691236517206
  %or6.i143.i = or disjoint i64 %shr.i.i1006, %and5.i.i1007
  %arrayidx7.i144.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  store i64 %or6.i143.i, ptr %arrayidx7.i144.i, align 8
  %arrayidx11.i.i1008 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  %50 = load i64, ptr %arrayidx11.i.i1008, align 8
  %arrayidx12.i.i1009 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  %51 = load i64, ptr %arrayidx12.i.i1009, align 8
  %and13.i145.i = and i64 %50, 6148914691236517205
  %and14.i146.i = shl i64 %51, 1
  %shl15.i.i1010 = and i64 %and14.i146.i, -6148914691236517206
  %or16.i.i1011 = or disjoint i64 %and13.i145.i, %shl15.i.i1010
  %arrayidx17.i.i1012 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  store i64 %or16.i.i1011, ptr %arrayidx17.i.i1012, align 8
  %and18.i.i1013 = lshr i64 %50, 1
  %shr19.i.i1014 = and i64 %and18.i.i1013, 6148914691236517205
  %and20.i.i1015 = and i64 %51, -6148914691236517206
  %or21.i.i1016 = or disjoint i64 %shr19.i.i1014, %and20.i.i1015
  %arrayidx22.i.i1017 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  store i64 %or21.i.i1016, ptr %arrayidx22.i.i1017, align 8
  %arrayidx27.i.i1018 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  %52 = load i64, ptr %arrayidx27.i.i1018, align 8
  %arrayidx28.i.i1019 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  %53 = load i64, ptr %arrayidx28.i.i1019, align 8
  %and29.i.i1020 = and i64 %52, 6148914691236517205
  %and30.i147.i = shl i64 %53, 1
  %shl31.i.i1021 = and i64 %and30.i147.i, -6148914691236517206
  %or32.i.i1022 = or disjoint i64 %and29.i.i1020, %shl31.i.i1021
  %arrayidx33.i.i1023 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  store i64 %or32.i.i1022, ptr %arrayidx33.i.i1023, align 8
  %and34.i148.i = lshr i64 %52, 1
  %shr35.i.i1024 = and i64 %and34.i148.i, 6148914691236517205
  %and36.i.i1025 = and i64 %53, -6148914691236517206
  %or37.i.i1026 = or disjoint i64 %shr35.i.i1024, %and36.i.i1025
  %arrayidx38.i.i1027 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  store i64 %or37.i.i1026, ptr %arrayidx38.i.i1027, align 8
  %arrayidx43.i.i1028 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  %54 = load i64, ptr %arrayidx43.i.i1028, align 8
  %arrayidx44.i.i1029 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  %55 = load i64, ptr %arrayidx44.i.i1029, align 8
  %and45.i.i1030 = and i64 %54, 6148914691236517205
  %and46.i.i1031 = shl i64 %55, 1
  %shl47.i.i1032 = and i64 %and46.i.i1031, -6148914691236517206
  %or48.i.i1033 = or disjoint i64 %and45.i.i1030, %shl47.i.i1032
  %arrayidx49.i.i1034 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  store i64 %or48.i.i1033, ptr %arrayidx49.i.i1034, align 8
  %and50.i.i1035 = lshr i64 %54, 1
  %shr51.i.i1036 = and i64 %and50.i.i1035, 6148914691236517205
  %and52.i.i1037 = and i64 %55, -6148914691236517206
  %or53.i.i1038 = or disjoint i64 %shr51.i.i1036, %and52.i.i1037
  %arrayidx54.i.i1039 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  store i64 %or53.i.i1038, ptr %arrayidx54.i.i1039, align 8
  %56 = load i64, ptr %q.i1.i, align 8
  %arrayidx60.i.i1040 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  %57 = load i64, ptr %arrayidx60.i.i1040, align 8
  %and61.i.i1041 = and i64 %56, 3689348814741910323
  %and62.i.i1042 = shl i64 %57, 2
  %shl63.i.i1043 = and i64 %and62.i.i1042, -3689348814741910324
  %or64.i.i1044 = or disjoint i64 %and61.i.i1041, %shl63.i.i1043
  store i64 %or64.i.i1044, ptr %q.i1.i, align 8
  %and66.i149.i = lshr i64 %56, 2
  %shr67.i.i1045 = and i64 %and66.i149.i, 3689348814741910323
  %and68.i.i1046 = and i64 %57, -3689348814741910324
  %or69.i.i1047 = or disjoint i64 %shr67.i.i1045, %and68.i.i1046
  %arrayidx70.i.i1048 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  store i64 %or69.i.i1047, ptr %arrayidx70.i.i1048, align 8
  %arrayidx75.i.i1049 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  %58 = load i64, ptr %arrayidx75.i.i1049, align 8
  %arrayidx76.i.i1050 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  %59 = load i64, ptr %arrayidx76.i.i1050, align 8
  %and77.i150.i = and i64 %58, 3689348814741910323
  %and78.i151.i = shl i64 %59, 2
  %shl79.i.i1051 = and i64 %and78.i151.i, -3689348814741910324
  %or80.i.i1052 = or disjoint i64 %and77.i150.i, %shl79.i.i1051
  %arrayidx81.i.i1053 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  store i64 %or80.i.i1052, ptr %arrayidx81.i.i1053, align 8
  %and82.i152.i = lshr i64 %58, 2
  %shr83.i.i1054 = and i64 %and82.i152.i, 3689348814741910323
  %and84.i153.i = and i64 %59, -3689348814741910324
  %or85.i.i1055 = or disjoint i64 %shr83.i.i1054, %and84.i153.i
  %arrayidx86.i.i1056 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  store i64 %or85.i.i1055, ptr %arrayidx86.i.i1056, align 8
  %arrayidx91.i.i1057 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  %60 = load i64, ptr %arrayidx91.i.i1057, align 8
  %arrayidx92.i.i1058 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  %61 = load i64, ptr %arrayidx92.i.i1058, align 8
  %and93.i.i1059 = and i64 %60, 3689348814741910323
  %and94.i.i1060 = shl i64 %61, 2
  %shl95.i.i1061 = and i64 %and94.i.i1060, -3689348814741910324
  %or96.i.i1062 = or disjoint i64 %and93.i.i1059, %shl95.i.i1061
  %arrayidx97.i.i1063 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  store i64 %or96.i.i1062, ptr %arrayidx97.i.i1063, align 8
  %and98.i.i1064 = lshr i64 %60, 2
  %shr99.i.i1065 = and i64 %and98.i.i1064, 3689348814741910323
  %and100.i.i1066 = and i64 %61, -3689348814741910324
  %or101.i.i1067 = or disjoint i64 %shr99.i.i1065, %and100.i.i1066
  %arrayidx102.i.i1068 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  store i64 %or101.i.i1067, ptr %arrayidx102.i.i1068, align 8
  %arrayidx107.i.i1069 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  %62 = load i64, ptr %arrayidx107.i.i1069, align 8
  %arrayidx108.i.i1070 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  %63 = load i64, ptr %arrayidx108.i.i1070, align 8
  %and109.i.i1071 = and i64 %62, 3689348814741910323
  %and110.i.i1072 = shl i64 %63, 2
  %shl111.i.i1073 = and i64 %and110.i.i1072, -3689348814741910324
  %or112.i.i1074 = or disjoint i64 %and109.i.i1071, %shl111.i.i1073
  %arrayidx113.i.i1075 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  store i64 %or112.i.i1074, ptr %arrayidx113.i.i1075, align 8
  %and114.i.i1076 = lshr i64 %62, 2
  %shr115.i.i1077 = and i64 %and114.i.i1076, 3689348814741910323
  %and116.i.i1078 = and i64 %63, -3689348814741910324
  %or117.i.i1079 = or disjoint i64 %shr115.i.i1077, %and116.i.i1078
  %arrayidx118.i.i1080 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  store i64 %or117.i.i1079, ptr %arrayidx118.i.i1080, align 8
  %64 = load i64, ptr %q.i1.i, align 8
  %arrayidx124.i154.i = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  %65 = load i64, ptr %arrayidx124.i154.i, align 8
  %and125.i.i1081 = and i64 %64, 1085102592571150095
  %and126.i.i1082 = shl i64 %65, 4
  %shl127.i.i1083 = and i64 %and126.i.i1082, -1085102592571150096
  %or128.i.i1084 = or disjoint i64 %and125.i.i1081, %shl127.i.i1083
  store i64 %or128.i.i1084, ptr %q.i1.i, align 8
  %and130.i.i1085 = lshr i64 %64, 4
  %shr131.i.i1086 = and i64 %and130.i.i1085, 1085102592571150095
  %and132.i.i1087 = and i64 %65, -1085102592571150096
  %or133.i.i1088 = or disjoint i64 %shr131.i.i1086, %and132.i.i1087
  %arrayidx134.i.i1089 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 32
  store i64 %or133.i.i1088, ptr %arrayidx134.i.i1089, align 8
  %arrayidx139.i.i1090 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  %66 = load i64, ptr %arrayidx139.i.i1090, align 8
  %arrayidx140.i.i1091 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  %67 = load i64, ptr %arrayidx140.i.i1091, align 8
  %and141.i.i1092 = and i64 %66, 1085102592571150095
  %and142.i.i1093 = shl i64 %67, 4
  %shl143.i.i1094 = and i64 %and142.i.i1093, -1085102592571150096
  %or144.i.i1095 = or disjoint i64 %and141.i.i1092, %shl143.i.i1094
  %arrayidx145.i.i1096 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 8
  store i64 %or144.i.i1095, ptr %arrayidx145.i.i1096, align 8
  %and146.i.i1097 = lshr i64 %66, 4
  %shr147.i.i1098 = and i64 %and146.i.i1097, 1085102592571150095
  %and148.i.i1099 = and i64 %67, -1085102592571150096
  %or149.i.i1100 = or disjoint i64 %shr147.i.i1098, %and148.i.i1099
  %arrayidx150.i.i1101 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 40
  store i64 %or149.i.i1100, ptr %arrayidx150.i.i1101, align 8
  %arrayidx155.i.i1102 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  %68 = load i64, ptr %arrayidx155.i.i1102, align 8
  %arrayidx156.i.i1103 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  %69 = load i64, ptr %arrayidx156.i.i1103, align 8
  %and157.i.i1104 = and i64 %68, 1085102592571150095
  %and158.i.i1105 = shl i64 %69, 4
  %shl159.i.i1106 = and i64 %and158.i.i1105, -1085102592571150096
  %or160.i.i1107 = or disjoint i64 %and157.i.i1104, %shl159.i.i1106
  %arrayidx161.i.i1108 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 16
  store i64 %or160.i.i1107, ptr %arrayidx161.i.i1108, align 8
  %and162.i.i1109 = lshr i64 %68, 4
  %shr163.i.i1110 = and i64 %and162.i.i1109, 1085102592571150095
  %and164.i.i1111 = and i64 %69, -1085102592571150096
  %or165.i.i1112 = or disjoint i64 %shr163.i.i1110, %and164.i.i1111
  %arrayidx166.i.i1113 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 48
  store i64 %or165.i.i1112, ptr %arrayidx166.i.i1113, align 8
  %arrayidx171.i.i1114 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  %70 = load i64, ptr %arrayidx171.i.i1114, align 8
  %arrayidx172.i.i1115 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  %71 = load i64, ptr %arrayidx172.i.i1115, align 8
  %and173.i.i1116 = and i64 %70, 1085102592571150095
  %and174.i.i1117 = shl i64 %71, 4
  %shl175.i.i1118 = and i64 %and174.i.i1117, -1085102592571150096
  %or176.i.i1119 = or disjoint i64 %and173.i.i1116, %shl175.i.i1118
  %arrayidx177.i.i1120 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 24
  store i64 %or176.i.i1119, ptr %arrayidx177.i.i1120, align 8
  %and178.i.i1121 = lshr i64 %70, 4
  %shr179.i.i1122 = and i64 %and178.i.i1121, 1085102592571150095
  %and180.i.i1123 = and i64 %71, -1085102592571150096
  %or181.i.i1124 = or disjoint i64 %shr179.i.i1122, %and180.i.i1123
  %arrayidx182.i.i1125 = getelementptr inbounds nuw i8, ptr %q.i1.i, i32 56
  store i64 %or181.i.i1124, ptr %arrayidx182.i.i1125, align 8
  %72 = load i64, ptr %q.i1.i, align 8
  %conv5.i4.i = trunc i64 %72 to i32
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %q.i1.i)
  %arrayidx9.i = getelementptr inbounds nuw [10 x i8], ptr @Rcon, i32 0, i32 %k.0.i1132
  %73 = load i8, ptr %arrayidx9.i, align 1
  %conv.i = zext i8 %73 to i32
  %xor.i = xor i32 %conv5.i4.i, %conv.i
  br label %if.end16.i

if.end16.i:                                       ; preds = %for.body.i884, %if.then.i1003
  %tmp.2.i = phi i32 [ %xor.i, %if.then.i1003 ], [ %tmp.0.i1133, %for.body.i884 ]
  %sub17.i = add nsw i32 %i.0.i8561130, -4
  %arrayidx18.i = getelementptr inbounds nuw [60 x i32], ptr %skey.i830, i32 0, i32 %sub17.i
  %74 = load i32, ptr %arrayidx18.i, align 4
  %xor19.i = xor i32 %tmp.2.i, %74
  %arrayidx20.i885 = getelementptr inbounds nuw [60 x i32], ptr %skey.i830, i32 0, i32 %i.0.i8561130
  store i32 %xor19.i, ptr %arrayidx20.i885, align 4
  %inc.i886 = add i32 %j.0.i1131, 1
  %cmp21.i = icmp eq i32 %inc.i886, 4
  %spec.select.i = select i1 %cmp21.i, i32 0, i32 %inc.i886
  %inc24.i = zext i1 %cmp21.i to i32
  %spec.select1.i = add i32 %k.0.i1132, %inc24.i
  %inc26.i = add nuw nsw i32 %i.0.i8561130, 1
  %exitcond.i857.not = icmp eq i32 %inc26.i, 44
  br i1 %exitcond.i857.not, label %for.cond27.i.preheader, label %for.body.i884, !llvm.loop !103

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
  %arrayidx1.i293.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 8
  %86 = load i64, ptr %arrayidx1.i293.i, align 8
  %and.i294.i = and i64 %85, 6148914691236517205
  %and2.i295.i = shl i64 %86, 1
  %shl.i296.i = and i64 %and2.i295.i, -6148914691236517206
  %or.i297.i = or disjoint i64 %and.i294.i, %shl.i296.i
  store i64 %or.i297.i, ptr %q.i831, align 8
  %and4.i298.i = lshr i64 %85, 1
  %shr.i299.i = and i64 %and4.i298.i, 6148914691236517205
  %and5.i300.i = and i64 %86, -6148914691236517206
  %or6.i301.i = or disjoint i64 %shr.i299.i, %and5.i300.i
  %arrayidx7.i302.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 8
  store i64 %or6.i301.i, ptr %arrayidx7.i302.i, align 8
  %arrayidx11.i303.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 16
  %87 = load i64, ptr %arrayidx11.i303.i, align 8
  %arrayidx12.i304.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 24
  %88 = load i64, ptr %arrayidx12.i304.i, align 8
  %and13.i305.i = and i64 %87, 6148914691236517205
  %and14.i306.i = shl i64 %88, 1
  %shl15.i307.i = and i64 %and14.i306.i, -6148914691236517206
  %or16.i308.i = or disjoint i64 %and13.i305.i, %shl15.i307.i
  %arrayidx17.i309.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 16
  store i64 %or16.i308.i, ptr %arrayidx17.i309.i, align 8
  %and18.i310.i = lshr i64 %87, 1
  %shr19.i311.i = and i64 %and18.i310.i, 6148914691236517205
  %and20.i312.i = and i64 %88, -6148914691236517206
  %or21.i313.i = or disjoint i64 %shr19.i311.i, %and20.i312.i
  %arrayidx22.i314.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 24
  store i64 %or21.i313.i, ptr %arrayidx22.i314.i, align 8
  %arrayidx27.i315.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 32
  %89 = load i64, ptr %arrayidx27.i315.i, align 8
  %arrayidx28.i316.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 40
  %90 = load i64, ptr %arrayidx28.i316.i, align 8
  %and29.i317.i = and i64 %89, 6148914691236517205
  %and30.i318.i = shl i64 %90, 1
  %shl31.i319.i = and i64 %and30.i318.i, -6148914691236517206
  %or32.i320.i = or disjoint i64 %and29.i317.i, %shl31.i319.i
  %arrayidx33.i321.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 32
  store i64 %or32.i320.i, ptr %arrayidx33.i321.i, align 8
  %and34.i322.i = lshr i64 %89, 1
  %shr35.i323.i = and i64 %and34.i322.i, 6148914691236517205
  %and36.i324.i = and i64 %90, -6148914691236517206
  %or37.i325.i = or disjoint i64 %shr35.i323.i, %and36.i324.i
  %arrayidx38.i326.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 40
  store i64 %or37.i325.i, ptr %arrayidx38.i326.i, align 8
  %arrayidx43.i327.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 48
  %91 = load i64, ptr %arrayidx43.i327.i, align 8
  %arrayidx44.i328.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 56
  %92 = load i64, ptr %arrayidx44.i328.i, align 8
  %and45.i329.i = and i64 %91, 6148914691236517205
  %and46.i330.i = shl i64 %92, 1
  %shl47.i331.i = and i64 %and46.i330.i, -6148914691236517206
  %or48.i332.i = or disjoint i64 %and45.i329.i, %shl47.i331.i
  %arrayidx49.i333.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 48
  store i64 %or48.i332.i, ptr %arrayidx49.i333.i, align 8
  %and50.i334.i = lshr i64 %91, 1
  %shr51.i335.i = and i64 %and50.i334.i, 6148914691236517205
  %and52.i336.i = and i64 %92, -6148914691236517206
  %or53.i337.i = or disjoint i64 %shr51.i335.i, %and52.i336.i
  %arrayidx54.i338.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 56
  store i64 %or53.i337.i, ptr %arrayidx54.i338.i, align 8
  %93 = load i64, ptr %q.i831, align 8
  %arrayidx60.i339.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 16
  %94 = load i64, ptr %arrayidx60.i339.i, align 8
  %and61.i340.i = and i64 %93, 3689348814741910323
  %and62.i341.i = shl i64 %94, 2
  %shl63.i342.i = and i64 %and62.i341.i, -3689348814741910324
  %or64.i343.i = or disjoint i64 %and61.i340.i, %shl63.i342.i
  store i64 %or64.i343.i, ptr %q.i831, align 8
  %and66.i344.i = lshr i64 %93, 2
  %shr67.i345.i = and i64 %and66.i344.i, 3689348814741910323
  %and68.i346.i = and i64 %94, -3689348814741910324
  %or69.i347.i = or disjoint i64 %shr67.i345.i, %and68.i346.i
  %arrayidx70.i348.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 16
  store i64 %or69.i347.i, ptr %arrayidx70.i348.i, align 8
  %arrayidx75.i349.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 8
  %95 = load i64, ptr %arrayidx75.i349.i, align 8
  %arrayidx76.i350.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 24
  %96 = load i64, ptr %arrayidx76.i350.i, align 8
  %and77.i351.i = and i64 %95, 3689348814741910323
  %and78.i352.i = shl i64 %96, 2
  %shl79.i353.i = and i64 %and78.i352.i, -3689348814741910324
  %or80.i354.i = or disjoint i64 %and77.i351.i, %shl79.i353.i
  %arrayidx81.i355.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 8
  store i64 %or80.i354.i, ptr %arrayidx81.i355.i, align 8
  %and82.i356.i = lshr i64 %95, 2
  %shr83.i357.i = and i64 %and82.i356.i, 3689348814741910323
  %and84.i358.i = and i64 %96, -3689348814741910324
  %or85.i359.i = or disjoint i64 %shr83.i357.i, %and84.i358.i
  %arrayidx86.i360.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 24
  store i64 %or85.i359.i, ptr %arrayidx86.i360.i, align 8
  %arrayidx91.i361.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 32
  %97 = load i64, ptr %arrayidx91.i361.i, align 8
  %arrayidx92.i362.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 48
  %98 = load i64, ptr %arrayidx92.i362.i, align 8
  %and93.i363.i = and i64 %97, 3689348814741910323
  %and94.i364.i = shl i64 %98, 2
  %shl95.i365.i = and i64 %and94.i364.i, -3689348814741910324
  %or96.i366.i = or disjoint i64 %and93.i363.i, %shl95.i365.i
  %arrayidx97.i367.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 32
  store i64 %or96.i366.i, ptr %arrayidx97.i367.i, align 8
  %and98.i368.i = lshr i64 %97, 2
  %shr99.i369.i = and i64 %and98.i368.i, 3689348814741910323
  %and100.i370.i = and i64 %98, -3689348814741910324
  %or101.i371.i = or disjoint i64 %shr99.i369.i, %and100.i370.i
  %arrayidx102.i372.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 48
  store i64 %or101.i371.i, ptr %arrayidx102.i372.i, align 8
  %arrayidx107.i373.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 40
  %99 = load i64, ptr %arrayidx107.i373.i, align 8
  %arrayidx108.i374.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 56
  %100 = load i64, ptr %arrayidx108.i374.i, align 8
  %and109.i375.i = and i64 %99, 3689348814741910323
  %and110.i376.i = shl i64 %100, 2
  %shl111.i377.i = and i64 %and110.i376.i, -3689348814741910324
  %or112.i378.i = or disjoint i64 %and109.i375.i, %shl111.i377.i
  %arrayidx113.i379.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 40
  store i64 %or112.i378.i, ptr %arrayidx113.i379.i, align 8
  %and114.i380.i = lshr i64 %99, 2
  %shr115.i381.i = and i64 %and114.i380.i, 3689348814741910323
  %and116.i382.i = and i64 %100, -3689348814741910324
  %or117.i383.i = or disjoint i64 %shr115.i381.i, %and116.i382.i
  %arrayidx118.i384.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 56
  store i64 %or117.i383.i, ptr %arrayidx118.i384.i, align 8
  %101 = load i64, ptr %q.i831, align 8
  %arrayidx124.i385.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 32
  %102 = load i64, ptr %arrayidx124.i385.i, align 8
  %and125.i386.i = and i64 %101, 1085102592571150095
  %and126.i387.i = shl i64 %102, 4
  %shl127.i388.i = and i64 %and126.i387.i, -1085102592571150096
  %or128.i389.i = or disjoint i64 %and125.i386.i, %shl127.i388.i
  store i64 %or128.i389.i, ptr %q.i831, align 8
  %and130.i390.i = lshr i64 %101, 4
  %shr131.i391.i = and i64 %and130.i390.i, 1085102592571150095
  %and132.i392.i = and i64 %102, -1085102592571150096
  %or133.i393.i = or disjoint i64 %shr131.i391.i, %and132.i392.i
  %arrayidx134.i394.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 32
  store i64 %or133.i393.i, ptr %arrayidx134.i394.i, align 8
  %arrayidx139.i395.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 8
  %103 = load i64, ptr %arrayidx139.i395.i, align 8
  %arrayidx140.i396.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 40
  %104 = load i64, ptr %arrayidx140.i396.i, align 8
  %and141.i397.i = and i64 %103, 1085102592571150095
  %and142.i398.i = shl i64 %104, 4
  %shl143.i399.i = and i64 %and142.i398.i, -1085102592571150096
  %or144.i400.i = or disjoint i64 %and141.i397.i, %shl143.i399.i
  %arrayidx145.i401.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 8
  store i64 %or144.i400.i, ptr %arrayidx145.i401.i, align 8
  %and146.i402.i = lshr i64 %103, 4
  %shr147.i403.i = and i64 %and146.i402.i, 1085102592571150095
  %and148.i404.i = and i64 %104, -1085102592571150096
  %or149.i405.i = or disjoint i64 %shr147.i403.i, %and148.i404.i
  %arrayidx150.i406.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 40
  store i64 %or149.i405.i, ptr %arrayidx150.i406.i, align 8
  %arrayidx155.i407.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 16
  %105 = load i64, ptr %arrayidx155.i407.i, align 8
  %arrayidx156.i408.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 48
  %106 = load i64, ptr %arrayidx156.i408.i, align 8
  %and157.i409.i = and i64 %105, 1085102592571150095
  %and158.i410.i = shl i64 %106, 4
  %shl159.i411.i = and i64 %and158.i410.i, -1085102592571150096
  %or160.i412.i = or disjoint i64 %and157.i409.i, %shl159.i411.i
  %arrayidx161.i413.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 16
  store i64 %or160.i412.i, ptr %arrayidx161.i413.i, align 8
  %and162.i414.i = lshr i64 %105, 4
  %shr163.i415.i = and i64 %and162.i414.i, 1085102592571150095
  %and164.i416.i = and i64 %106, -1085102592571150096
  %or165.i417.i = or disjoint i64 %shr163.i415.i, %and164.i416.i
  %arrayidx166.i418.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 48
  store i64 %or165.i417.i, ptr %arrayidx166.i418.i, align 8
  %arrayidx171.i419.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 24
  %107 = load i64, ptr %arrayidx171.i419.i, align 8
  %arrayidx172.i420.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 56
  %108 = load i64, ptr %arrayidx172.i420.i, align 8
  %and173.i421.i = and i64 %107, 1085102592571150095
  %and174.i422.i = shl i64 %108, 4
  %shl175.i423.i = and i64 %and174.i422.i, -1085102592571150096
  %or176.i424.i = or disjoint i64 %and173.i421.i, %shl175.i423.i
  %arrayidx177.i425.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 24
  store i64 %or176.i424.i, ptr %arrayidx177.i425.i, align 8
  %and178.i426.i = lshr i64 %107, 4
  %shr179.i427.i = and i64 %and178.i426.i, 1085102592571150095
  %and180.i428.i = and i64 %108, -1085102592571150096
  %or181.i429.i = or disjoint i64 %shr179.i427.i, %and180.i428.i
  %arrayidx182.i430.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 56
  store i64 %or181.i429.i, ptr %arrayidx182.i430.i, align 8
  %109 = load i64, ptr %q.i831, align 8
  %and.i883 = and i64 %109, 1229782938247303441
  %arrayidx48.i = getelementptr inbounds nuw i8, ptr %q.i831, i32 8
  %110 = load i64, ptr %arrayidx48.i, align 8
  %and49.i = and i64 %110, 2459565876494606882
  %or50.i = or disjoint i64 %and.i883, %and49.i
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
  br i1 %cmp28.i, label %for.body30.i, label %br_aes_ct64_keysched.exit, !llvm.loop !104

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
  br i1 %exitcond.i2.not, label %br_aes_ct64_skey_expand.exit, label %for.body.i3, !llvm.loop !105

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
  br i1 %cmp.not.i.i, label %br_range_dec32le.exit.i, label %while.body.i.i, !llvm.loop !106

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
  br i1 %exitcond.i28.not, label %for.end.i, label %for.body.i43, !llvm.loop !107

for.end.i:                                        ; preds = %for.body.i43
  %132 = load i64, ptr %q.i, align 8
  %arrayidx1.i268.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %133 = load i64, ptr %arrayidx1.i268.i, align 8
  %and.i269.i = and i64 %132, 6148914691236517205
  %and2.i270.i = shl i64 %133, 1
  %shl.i271.i = and i64 %and2.i270.i, -6148914691236517206
  %or.i272.i = or disjoint i64 %and.i269.i, %shl.i271.i
  store i64 %or.i272.i, ptr %q.i, align 8
  %and4.i273.i = lshr i64 %132, 1
  %shr.i274.i = and i64 %and4.i273.i, 6148914691236517205
  %and5.i275.i = and i64 %133, -6148914691236517206
  %or6.i276.i = or disjoint i64 %shr.i274.i, %and5.i275.i
  %arrayidx7.i277.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or6.i276.i, ptr %arrayidx7.i277.i, align 8
  %arrayidx11.i278.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %134 = load i64, ptr %arrayidx11.i278.i, align 8
  %arrayidx12.i279.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %135 = load i64, ptr %arrayidx12.i279.i, align 8
  %and13.i280.i = and i64 %134, 6148914691236517205
  %and14.i281.i = shl i64 %135, 1
  %shl15.i282.i = and i64 %and14.i281.i, -6148914691236517206
  %or16.i283.i = or disjoint i64 %and13.i280.i, %shl15.i282.i
  %arrayidx17.i284.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or16.i283.i, ptr %arrayidx17.i284.i, align 8
  %and18.i285.i = lshr i64 %134, 1
  %shr19.i286.i = and i64 %and18.i285.i, 6148914691236517205
  %and20.i287.i = and i64 %135, -6148914691236517206
  %or21.i288.i = or disjoint i64 %shr19.i286.i, %and20.i287.i
  %arrayidx22.i289.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or21.i288.i, ptr %arrayidx22.i289.i, align 8
  %arrayidx27.i290.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %136 = load i64, ptr %arrayidx27.i290.i, align 8
  %arrayidx28.i291.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %137 = load i64, ptr %arrayidx28.i291.i, align 8
  %and29.i292.i = and i64 %136, 6148914691236517205
  %and30.i293.i = shl i64 %137, 1
  %shl31.i294.i = and i64 %and30.i293.i, -6148914691236517206
  %or32.i295.i = or disjoint i64 %and29.i292.i, %shl31.i294.i
  %arrayidx33.i296.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or32.i295.i, ptr %arrayidx33.i296.i, align 8
  %and34.i297.i = lshr i64 %136, 1
  %shr35.i298.i = and i64 %and34.i297.i, 6148914691236517205
  %and36.i299.i = and i64 %137, -6148914691236517206
  %or37.i300.i = or disjoint i64 %shr35.i298.i, %and36.i299.i
  %arrayidx38.i301.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or37.i300.i, ptr %arrayidx38.i301.i, align 8
  %arrayidx43.i302.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %138 = load i64, ptr %arrayidx43.i302.i, align 8
  %arrayidx44.i303.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %139 = load i64, ptr %arrayidx44.i303.i, align 8
  %and45.i304.i = and i64 %138, 6148914691236517205
  %and46.i305.i = shl i64 %139, 1
  %shl47.i306.i = and i64 %and46.i305.i, -6148914691236517206
  %or48.i307.i = or disjoint i64 %and45.i304.i, %shl47.i306.i
  %arrayidx49.i308.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or48.i307.i, ptr %arrayidx49.i308.i, align 8
  %and50.i309.i = lshr i64 %138, 1
  %shr51.i310.i = and i64 %and50.i309.i, 6148914691236517205
  %and52.i311.i = and i64 %139, -6148914691236517206
  %or53.i312.i = or disjoint i64 %shr51.i310.i, %and52.i311.i
  %arrayidx54.i313.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or53.i312.i, ptr %arrayidx54.i313.i, align 8
  %140 = load i64, ptr %q.i, align 8
  %arrayidx60.i314.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %141 = load i64, ptr %arrayidx60.i314.i, align 8
  %and61.i315.i = and i64 %140, 3689348814741910323
  %and62.i316.i = shl i64 %141, 2
  %shl63.i317.i = and i64 %and62.i316.i, -3689348814741910324
  %or64.i318.i = or disjoint i64 %and61.i315.i, %shl63.i317.i
  store i64 %or64.i318.i, ptr %q.i, align 8
  %and66.i319.i = lshr i64 %140, 2
  %shr67.i320.i = and i64 %and66.i319.i, 3689348814741910323
  %and68.i321.i = and i64 %141, -3689348814741910324
  %or69.i322.i = or disjoint i64 %shr67.i320.i, %and68.i321.i
  %arrayidx70.i323.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or69.i322.i, ptr %arrayidx70.i323.i, align 8
  %arrayidx75.i324.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %142 = load i64, ptr %arrayidx75.i324.i, align 8
  %arrayidx76.i325.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %143 = load i64, ptr %arrayidx76.i325.i, align 8
  %and77.i326.i = and i64 %142, 3689348814741910323
  %and78.i327.i = shl i64 %143, 2
  %shl79.i328.i = and i64 %and78.i327.i, -3689348814741910324
  %or80.i329.i = or disjoint i64 %and77.i326.i, %shl79.i328.i
  %arrayidx81.i330.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or80.i329.i, ptr %arrayidx81.i330.i, align 8
  %and82.i331.i = lshr i64 %142, 2
  %shr83.i332.i = and i64 %and82.i331.i, 3689348814741910323
  %and84.i333.i = and i64 %143, -3689348814741910324
  %or85.i334.i = or disjoint i64 %shr83.i332.i, %and84.i333.i
  %arrayidx86.i335.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or85.i334.i, ptr %arrayidx86.i335.i, align 8
  %arrayidx91.i336.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %144 = load i64, ptr %arrayidx91.i336.i, align 8
  %arrayidx92.i337.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %145 = load i64, ptr %arrayidx92.i337.i, align 8
  %and93.i338.i = and i64 %144, 3689348814741910323
  %and94.i339.i = shl i64 %145, 2
  %shl95.i340.i = and i64 %and94.i339.i, -3689348814741910324
  %or96.i341.i = or disjoint i64 %and93.i338.i, %shl95.i340.i
  %arrayidx97.i342.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or96.i341.i, ptr %arrayidx97.i342.i, align 8
  %and98.i343.i = lshr i64 %144, 2
  %shr99.i344.i = and i64 %and98.i343.i, 3689348814741910323
  %and100.i345.i = and i64 %145, -3689348814741910324
  %or101.i346.i = or disjoint i64 %shr99.i344.i, %and100.i345.i
  %arrayidx102.i347.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or101.i346.i, ptr %arrayidx102.i347.i, align 8
  %arrayidx107.i348.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %146 = load i64, ptr %arrayidx107.i348.i, align 8
  %arrayidx108.i349.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %147 = load i64, ptr %arrayidx108.i349.i, align 8
  %and109.i350.i = and i64 %146, 3689348814741910323
  %and110.i351.i = shl i64 %147, 2
  %shl111.i352.i = and i64 %and110.i351.i, -3689348814741910324
  %or112.i353.i = or disjoint i64 %and109.i350.i, %shl111.i352.i
  %arrayidx113.i354.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or112.i353.i, ptr %arrayidx113.i354.i, align 8
  %and114.i355.i = lshr i64 %146, 2
  %shr115.i356.i = and i64 %and114.i355.i, 3689348814741910323
  %and116.i357.i = and i64 %147, -3689348814741910324
  %or117.i358.i = or disjoint i64 %shr115.i356.i, %and116.i357.i
  %arrayidx118.i359.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or117.i358.i, ptr %arrayidx118.i359.i, align 8
  %148 = load i64, ptr %q.i, align 8
  %arrayidx124.i360.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %149 = load i64, ptr %arrayidx124.i360.i, align 8
  %and125.i361.i = and i64 %148, 1085102592571150095
  %and126.i362.i = shl i64 %149, 4
  %shl127.i363.i = and i64 %and126.i362.i, -1085102592571150096
  %or128.i364.i = or disjoint i64 %and125.i361.i, %shl127.i363.i
  store i64 %or128.i364.i, ptr %q.i, align 8
  %and130.i365.i = lshr i64 %148, 4
  %shr131.i366.i = and i64 %and130.i365.i, 1085102592571150095
  %and132.i367.i = and i64 %149, -1085102592571150096
  %or133.i368.i = or disjoint i64 %shr131.i366.i, %and132.i367.i
  %arrayidx134.i369.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or133.i368.i, ptr %arrayidx134.i369.i, align 8
  %arrayidx139.i370.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %150 = load i64, ptr %arrayidx139.i370.i, align 8
  %arrayidx140.i371.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %151 = load i64, ptr %arrayidx140.i371.i, align 8
  %and141.i372.i = and i64 %150, 1085102592571150095
  %and142.i373.i = shl i64 %151, 4
  %shl143.i374.i = and i64 %and142.i373.i, -1085102592571150096
  %or144.i375.i = or disjoint i64 %and141.i372.i, %shl143.i374.i
  %arrayidx145.i376.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or144.i375.i, ptr %arrayidx145.i376.i, align 8
  %and146.i377.i = lshr i64 %150, 4
  %shr147.i378.i = and i64 %and146.i377.i, 1085102592571150095
  %and148.i379.i = and i64 %151, -1085102592571150096
  %or149.i380.i = or disjoint i64 %shr147.i378.i, %and148.i379.i
  %arrayidx150.i381.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or149.i380.i, ptr %arrayidx150.i381.i, align 8
  %arrayidx155.i382.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %152 = load i64, ptr %arrayidx155.i382.i, align 8
  %arrayidx156.i383.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %153 = load i64, ptr %arrayidx156.i383.i, align 8
  %and157.i384.i = and i64 %152, 1085102592571150095
  %and158.i385.i = shl i64 %153, 4
  %shl159.i386.i = and i64 %and158.i385.i, -1085102592571150096
  %or160.i387.i = or disjoint i64 %and157.i384.i, %shl159.i386.i
  %arrayidx161.i388.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or160.i387.i, ptr %arrayidx161.i388.i, align 8
  %and162.i389.i = lshr i64 %152, 4
  %shr163.i390.i = and i64 %and162.i389.i, 1085102592571150095
  %and164.i391.i = and i64 %153, -1085102592571150096
  %or165.i392.i = or disjoint i64 %shr163.i390.i, %and164.i391.i
  %arrayidx166.i393.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or165.i392.i, ptr %arrayidx166.i393.i, align 8
  %arrayidx171.i394.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %154 = load i64, ptr %arrayidx171.i394.i, align 8
  %arrayidx172.i395.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %155 = load i64, ptr %arrayidx172.i395.i, align 8
  %and173.i396.i = and i64 %154, 1085102592571150095
  %and174.i397.i = shl i64 %155, 4
  %shl175.i398.i = and i64 %and174.i397.i, -1085102592571150096
  %or176.i399.i = or disjoint i64 %and173.i396.i, %shl175.i398.i
  %arrayidx177.i400.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or176.i399.i, ptr %arrayidx177.i400.i, align 8
  %and178.i401.i = lshr i64 %154, 4
  %shr179.i402.i = and i64 %and178.i401.i, 1085102592571150095
  %and180.i403.i = and i64 %155, -1085102592571150096
  %or181.i404.i = or disjoint i64 %shr179.i402.i, %and180.i403.i
  %arrayidx182.i405.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or181.i404.i, ptr %arrayidx182.i405.i, align 8
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

for.body7.i:                                      ; preds = %for.end.i, %shift_rows.exit.i
  %i.1.i1143 = phi i32 [ 1, %for.end.i ], [ %inc15.i, %shift_rows.exit.i ]
  %arrayidx.i101.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %172 = load i64, ptr %arrayidx.i101.i, align 8
  %arrayidx1.i102.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %173 = load i64, ptr %arrayidx1.i102.i, align 8
  %arrayidx2.i103.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %174 = load i64, ptr %arrayidx2.i103.i, align 8
  %arrayidx3.i104.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %175 = load i64, ptr %arrayidx3.i104.i, align 8
  %arrayidx4.i105.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %176 = load i64, ptr %arrayidx4.i105.i, align 8
  %arrayidx5.i106.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %177 = load i64, ptr %arrayidx5.i106.i, align 8
  %arrayidx6.i107.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %178 = load i64, ptr %arrayidx6.i107.i, align 8
  %179 = load i64, ptr %q.i, align 8
  %xor.i108.i = xor i64 %175, %177
  %xor8.i.i = xor i64 %172, %178
  %xor9.i.i = xor i64 %172, %175
  %xor10.i109.i = xor i64 %172, %177
  %xor11.i.i = xor i64 %173, %174
  %xor12.i.i = xor i64 %xor11.i.i, %179
  %xor13.i110.i = xor i64 %xor12.i.i, %175
  %xor14.i.i = xor i64 %xor8.i.i, %xor.i108.i
  %xor15.i.i = xor i64 %xor12.i.i, %172
  %xor16.i111.i = xor i64 %xor12.i.i, %178
  %xor17.i.i = xor i64 %xor16.i111.i, %xor10.i109.i
  %xor18.i.i = xor i64 %176, %xor14.i.i
  %xor19.i112.i = xor i64 %xor18.i.i, %177
  %xor20.i.i = xor i64 %xor18.i.i, %173
  %xor21.i.i = xor i64 %xor19.i112.i, %179
  %xor22.i113.i = xor i64 %xor19.i112.i, %xor11.i.i
  %xor23.i.i = xor i64 %xor20.i.i, %xor9.i.i
  %xor24.i.i = xor i64 %179, %xor23.i.i
  %xor25.i.i = xor i64 %xor22.i113.i, %xor23.i.i
  %xor27.i.i = xor i64 %xor11.i.i, %xor23.i.i
  %and.i114.i = and i64 %xor14.i.i, %xor19.i112.i
  %and30.i.i = and i64 %xor17.i.i, %xor21.i.i
  %xor31.i115.i = xor i64 %and30.i.i, %and.i114.i
  %and32.i.i = and i64 %xor13.i110.i, %179
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
  %180 = xor i64 %xor10.i109.i, %and32.i.i
  %181 = xor i64 %180, %xor22.i113.i
  %182 = xor i64 %181, %and.i114.i
  %xor49.i.i = xor i64 %182, %xor43.i116.i
  %183 = xor i64 %xor27.i.i, %and35.i.i
  %184 = xor i64 %183, %xor8.i.i
  %185 = xor i64 %184, %and34.i.i
  %xor50.i.i = xor i64 %185, %xor41.i.i
  %186 = xor i64 %xor27.i.i, %and37.i.i
  %187 = xor i64 %186, %172
  %188 = xor i64 %187, %and34.i.i
  %xor51.i117.i = xor i64 %188, %xor43.i116.i
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
  %and75.i.i = and i64 %xor60.i.i, %179
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
  %189 = xor i64 %xor107.i.i, %xor101.i.i
  %xor113.i.i = xor i64 %189, -1
  %190 = xor i64 %xor105.i.i, %xor93.i.i
  %xor115.i.i = xor i64 %190, -1
  %xor117.i.i = xor i64 %xor98.i.i, %xor111.i.i
  %xor118.i.i = xor i64 %xor96.i.i, %xor111.i.i
  %xor119.i.i = xor i64 %xor92.i.i, %xor110.i.i
  %191 = xor i64 %xor117.i.i, %xor109.i.i
  %xor121.i.i = xor i64 %191, -1
  %192 = xor i64 %xor110.i.i, %xor100.i.i
  %193 = xor i64 %192, %xor109.i.i
  %xor123.i.i = xor i64 %193, -1
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

for.body.i.i:                                     ; preds = %for.body7.i, %for.body.i.i
  %i.0.i.i1142 = phi i32 [ 0, %for.body7.i ], [ %inc.i.i, %for.body.i.i ]
  %arrayidx.i.i = getelementptr inbounds nuw i64, ptr %q.i, i32 %i.0.i.i1142
  %194 = load i64, ptr %arrayidx.i.i, align 8
  %and.i.i = and i64 %194, 65535
  %and1.i.i = lshr i64 %194, 4
  %shr.i1.i = and i64 %and1.i.i, 268369920
  %or.i.i40 = or disjoint i64 %and.i.i, %shr.i1.i
  %and2.i.i = shl i64 %194, 12
  %shl.i.i41 = and i64 %and2.i.i, 4026531840
  %or3.i.i = or disjoint i64 %or.i.i40, %shl.i.i41
  %and4.i.i = lshr i64 %194, 8
  %shr5.i.i = and i64 %and4.i.i, 1095216660480
  %or6.i.i42 = or disjoint i64 %or3.i.i, %shr5.i.i
  %and7.i.i = shl i64 %194, 8
  %shl8.i.i = and i64 %and7.i.i, 280375465082880
  %or9.i.i = or disjoint i64 %or6.i.i42, %shl8.i.i
  %and10.i.i = lshr i64 %194, 12
  %shr11.i.i = and i64 %and10.i.i, 4222124650659840
  %or12.i.i = or disjoint i64 %or9.i.i, %shr11.i.i
  %and13.i.i = shl i64 %194, 4
  %shl14.i.i = and i64 %and13.i.i, -4503599627370496
  %or15.i.i = or i64 %or12.i.i, %shl14.i.i
  %arrayidx16.i.i = getelementptr inbounds nuw i64, ptr %q.i, i32 %i.0.i.i1142
  store i64 %or15.i.i, ptr %arrayidx16.i.i, align 8
  %inc.i.i = add nuw nsw i32 %i.0.i.i1142, 1
  %exitcond.i.i.not = icmp eq i32 %inc.i.i, 8
  br i1 %exitcond.i.i.not, label %shift_rows.exit.i, label %for.body.i.i, !llvm.loop !108

shift_rows.exit.i:                                ; preds = %for.body.i.i
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
  %arrayidx7.i.i39 = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %202 = load i64, ptr %arrayidx7.i.i39, align 8
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
  %xor.i52.i = xor i64 %242, %241
  store i64 %xor.i52.i, ptr %q.i, align 8
  %arrayidx2.i53.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i, i32 8
  %243 = load i64, ptr %arrayidx2.i53.i, align 8
  %arrayidx3.i54.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %244 = load i64, ptr %arrayidx3.i54.i, align 8
  %xor4.i55.i = xor i64 %244, %243
  store i64 %xor4.i55.i, ptr %arrayidx3.i54.i, align 8
  %arrayidx5.i56.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i, i32 16
  %245 = load i64, ptr %arrayidx5.i56.i, align 8
  %arrayidx6.i57.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %246 = load i64, ptr %arrayidx6.i57.i, align 8
  %xor7.i58.i = xor i64 %246, %245
  store i64 %xor7.i58.i, ptr %arrayidx6.i57.i, align 8
  %arrayidx8.i59.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i, i32 24
  %247 = load i64, ptr %arrayidx8.i59.i, align 8
  %arrayidx9.i60.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %248 = load i64, ptr %arrayidx9.i60.i, align 8
  %xor10.i61.i = xor i64 %248, %247
  store i64 %xor10.i61.i, ptr %arrayidx9.i60.i, align 8
  %arrayidx11.i62.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i, i32 32
  %249 = load i64, ptr %arrayidx11.i62.i, align 8
  %arrayidx12.i63.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %250 = load i64, ptr %arrayidx12.i63.i, align 8
  %xor13.i64.i = xor i64 %250, %249
  store i64 %xor13.i64.i, ptr %arrayidx12.i63.i, align 8
  %arrayidx14.i65.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i, i32 40
  %251 = load i64, ptr %arrayidx14.i65.i, align 8
  %arrayidx15.i66.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %252 = load i64, ptr %arrayidx15.i66.i, align 8
  %xor16.i67.i = xor i64 %252, %251
  store i64 %xor16.i67.i, ptr %arrayidx15.i66.i, align 8
  %arrayidx17.i68.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i, i32 48
  %253 = load i64, ptr %arrayidx17.i68.i, align 8
  %arrayidx18.i69.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %254 = load i64, ptr %arrayidx18.i69.i, align 8
  %xor19.i70.i = xor i64 %254, %253
  store i64 %xor19.i70.i, ptr %arrayidx18.i69.i, align 8
  %arrayidx20.i71.i = getelementptr inbounds nuw i8, ptr %add.ptr13.i, i32 56
  %255 = load i64, ptr %arrayidx20.i71.i, align 8
  %arrayidx21.i72.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %256 = load i64, ptr %arrayidx21.i72.i, align 8
  %xor22.i73.i = xor i64 %256, %255
  store i64 %xor22.i73.i, ptr %arrayidx21.i72.i, align 8
  %inc15.i = add nuw nsw i32 %i.1.i1143, 1
  %exitcond1.i.not = icmp eq i32 %inc15.i, 10
  br i1 %exitcond1.i.not, label %for.end16.i, label %for.body7.i, !llvm.loop !109

for.end16.i:                                      ; preds = %shift_rows.exit.i
  %arrayidx.i122.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %257 = load i64, ptr %arrayidx.i122.i, align 8
  %arrayidx1.i123.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %258 = load i64, ptr %arrayidx1.i123.i, align 8
  %arrayidx2.i124.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %259 = load i64, ptr %arrayidx2.i124.i, align 8
  %arrayidx3.i125.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %260 = load i64, ptr %arrayidx3.i125.i, align 8
  %arrayidx4.i126.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %261 = load i64, ptr %arrayidx4.i126.i, align 8
  %arrayidx5.i127.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %262 = load i64, ptr %arrayidx5.i127.i, align 8
  %arrayidx6.i128.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %263 = load i64, ptr %arrayidx6.i128.i, align 8
  %264 = load i64, ptr %q.i, align 8
  %xor.i129.i = xor i64 %260, %262
  %xor8.i130.i = xor i64 %257, %263
  %xor9.i131.i = xor i64 %257, %260
  %xor10.i132.i = xor i64 %257, %262
  %xor11.i133.i = xor i64 %258, %259
  %xor12.i134.i = xor i64 %xor11.i133.i, %264
  %xor13.i135.i = xor i64 %xor12.i134.i, %260
  %xor14.i136.i = xor i64 %xor8.i130.i, %xor.i129.i
  %xor15.i137.i = xor i64 %xor12.i134.i, %257
  %xor16.i138.i = xor i64 %xor12.i134.i, %263
  %xor17.i139.i = xor i64 %xor16.i138.i, %xor10.i132.i
  %xor18.i140.i = xor i64 %261, %xor14.i136.i
  %xor19.i141.i = xor i64 %xor18.i140.i, %262
  %xor20.i142.i = xor i64 %xor18.i140.i, %258
  %xor21.i143.i = xor i64 %xor19.i141.i, %264
  %xor22.i144.i = xor i64 %xor19.i141.i, %xor11.i133.i
  %xor23.i145.i = xor i64 %xor20.i142.i, %xor9.i131.i
  %xor24.i146.i = xor i64 %264, %xor23.i145.i
  %xor25.i147.i = xor i64 %xor22.i144.i, %xor23.i145.i
  %xor27.i148.i = xor i64 %xor11.i133.i, %xor23.i145.i
  %and.i149.i = and i64 %xor14.i136.i, %xor19.i141.i
  %and30.i150.i = and i64 %xor17.i139.i, %xor21.i143.i
  %xor31.i151.i = xor i64 %and30.i150.i, %and.i149.i
  %and32.i152.i = and i64 %xor13.i135.i, %264
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
  %265 = xor i64 %xor10.i132.i, %and32.i152.i
  %266 = xor i64 %265, %xor22.i144.i
  %267 = xor i64 %266, %and.i149.i
  %xor49.i163.i = xor i64 %267, %xor43.i160.i
  %268 = xor i64 %xor27.i148.i, %and35.i154.i
  %269 = xor i64 %268, %xor8.i130.i
  %270 = xor i64 %269, %and34.i153.i
  %xor50.i164.i = xor i64 %270, %xor41.i158.i
  %271 = xor i64 %xor27.i148.i, %and37.i155.i
  %272 = xor i64 %271, %257
  %273 = xor i64 %272, %and34.i153.i
  %xor51.i165.i = xor i64 %273, %xor43.i160.i
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
  %and75.i189.i = and i64 %xor60.i174.i, %264
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
  %274 = xor i64 %xor107.i221.i, %xor101.i215.i
  %xor113.i227.i = xor i64 %274, -1
  %275 = xor i64 %xor105.i219.i, %xor93.i207.i
  %xor115.i228.i = xor i64 %275, -1
  %xor117.i229.i = xor i64 %xor98.i212.i, %xor111.i225.i
  %xor118.i230.i = xor i64 %xor96.i210.i, %xor111.i225.i
  %xor119.i231.i = xor i64 %xor92.i206.i, %xor110.i224.i
  %276 = xor i64 %xor117.i229.i, %xor109.i223.i
  %xor121.i232.i = xor i64 %276, -1
  %277 = xor i64 %xor110.i224.i, %xor100.i214.i
  %278 = xor i64 %277, %xor109.i223.i
  %xor123.i233.i = xor i64 %278, -1
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

for.body.i5.i:                                    ; preds = %for.end16.i, %for.body.i5.i
  %i.0.i3.i1144 = phi i32 [ 0, %for.end16.i ], [ %inc.i27.i, %for.body.i5.i ]
  %arrayidx.i6.i = getelementptr inbounds nuw i64, ptr %q.i, i32 %i.0.i3.i1144
  %279 = load i64, ptr %arrayidx.i6.i, align 8
  %and.i7.i = and i64 %279, 65535
  %and1.i8.i = lshr i64 %279, 4
  %shr.i9.i = and i64 %and1.i8.i, 268369920
  %or.i10.i = or disjoint i64 %and.i7.i, %shr.i9.i
  %and2.i11.i = shl i64 %279, 12
  %shl.i12.i = and i64 %and2.i11.i, 4026531840
  %or3.i13.i = or disjoint i64 %or.i10.i, %shl.i12.i
  %and4.i14.i = lshr i64 %279, 8
  %shr5.i15.i = and i64 %and4.i14.i, 1095216660480
  %or6.i16.i = or disjoint i64 %or3.i13.i, %shr5.i15.i
  %and7.i17.i = shl i64 %279, 8
  %shl8.i18.i = and i64 %and7.i17.i, 280375465082880
  %or9.i19.i = or disjoint i64 %or6.i16.i, %shl8.i18.i
  %and10.i20.i = lshr i64 %279, 12
  %shr11.i21.i = and i64 %and10.i20.i, 4222124650659840
  %or12.i22.i = or disjoint i64 %or9.i19.i, %shr11.i21.i
  %and13.i23.i = shl i64 %279, 4
  %shl14.i24.i = and i64 %and13.i23.i, -4503599627370496
  %or15.i25.i = or i64 %or12.i22.i, %shl14.i24.i
  %arrayidx16.i26.i = getelementptr inbounds nuw i64, ptr %q.i, i32 %i.0.i3.i1144
  store i64 %or15.i25.i, ptr %arrayidx16.i26.i, align 8
  %inc.i27.i = add nuw nsw i32 %i.0.i3.i1144, 1
  %exitcond.i4.i.not = icmp eq i32 %inc.i27.i, 8
  br i1 %exitcond.i4.i.not, label %shift_rows.exit28.i, label %for.body.i5.i, !llvm.loop !110

shift_rows.exit28.i:                              ; preds = %for.body.i5.i
  %add.ptr20.i = getelementptr inbounds nuw i8, ptr %119, i32 640
  %280 = load i64, ptr %add.ptr20.i, align 8
  %281 = load i64, ptr %q.i, align 8
  %xor.i74.i = xor i64 %281, %280
  store i64 %xor.i74.i, ptr %q.i, align 8
  %arrayidx2.i75.i = getelementptr inbounds nuw i8, ptr %119, i32 648
  %282 = load i64, ptr %arrayidx2.i75.i, align 8
  %arrayidx3.i76.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %283 = load i64, ptr %arrayidx3.i76.i, align 8
  %xor4.i77.i = xor i64 %283, %282
  store i64 %xor4.i77.i, ptr %arrayidx3.i76.i, align 8
  %arrayidx5.i78.i = getelementptr inbounds nuw i8, ptr %119, i32 656
  %284 = load i64, ptr %arrayidx5.i78.i, align 8
  %arrayidx6.i79.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %285 = load i64, ptr %arrayidx6.i79.i, align 8
  %xor7.i80.i = xor i64 %285, %284
  store i64 %xor7.i80.i, ptr %arrayidx6.i79.i, align 8
  %arrayidx8.i81.i = getelementptr inbounds nuw i8, ptr %119, i32 664
  %286 = load i64, ptr %arrayidx8.i81.i, align 8
  %arrayidx9.i82.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %287 = load i64, ptr %arrayidx9.i82.i, align 8
  %xor10.i83.i = xor i64 %287, %286
  store i64 %xor10.i83.i, ptr %arrayidx9.i82.i, align 8
  %arrayidx11.i84.i = getelementptr inbounds nuw i8, ptr %119, i32 672
  %288 = load i64, ptr %arrayidx11.i84.i, align 8
  %arrayidx12.i85.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %289 = load i64, ptr %arrayidx12.i85.i, align 8
  %xor13.i86.i = xor i64 %289, %288
  store i64 %xor13.i86.i, ptr %arrayidx12.i85.i, align 8
  %arrayidx14.i87.i = getelementptr inbounds nuw i8, ptr %119, i32 680
  %290 = load i64, ptr %arrayidx14.i87.i, align 8
  %arrayidx15.i88.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %291 = load i64, ptr %arrayidx15.i88.i, align 8
  %xor16.i89.i = xor i64 %291, %290
  store i64 %xor16.i89.i, ptr %arrayidx15.i88.i, align 8
  %arrayidx17.i90.i = getelementptr inbounds nuw i8, ptr %119, i32 688
  %292 = load i64, ptr %arrayidx17.i90.i, align 8
  %arrayidx18.i91.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %293 = load i64, ptr %arrayidx18.i91.i, align 8
  %xor19.i92.i = xor i64 %293, %292
  store i64 %xor19.i92.i, ptr %arrayidx18.i91.i, align 8
  %arrayidx20.i93.i = getelementptr inbounds nuw i8, ptr %119, i32 696
  %294 = load i64, ptr %arrayidx20.i93.i, align 8
  %arrayidx21.i94.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %295 = load i64, ptr %arrayidx21.i94.i, align 8
  %xor22.i95.i = xor i64 %295, %294
  store i64 %xor22.i95.i, ptr %arrayidx21.i94.i, align 8
  %296 = load i64, ptr %q.i, align 8
  %arrayidx1.i241.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %297 = load i64, ptr %arrayidx1.i241.i, align 8
  %and.i242.i = and i64 %296, 6148914691236517205
  %and2.i243.i = shl i64 %297, 1
  %shl.i244.i = and i64 %and2.i243.i, -6148914691236517206
  %or.i245.i = or disjoint i64 %and.i242.i, %shl.i244.i
  store i64 %or.i245.i, ptr %q.i, align 8
  %and4.i246.i = lshr i64 %296, 1
  %shr.i247.i = and i64 %and4.i246.i, 6148914691236517205
  %and5.i.i = and i64 %297, -6148914691236517206
  %or6.i248.i = or disjoint i64 %shr.i247.i, %and5.i.i
  %arrayidx7.i249.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or6.i248.i, ptr %arrayidx7.i249.i, align 8
  %arrayidx11.i250.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %298 = load i64, ptr %arrayidx11.i250.i, align 8
  %arrayidx12.i251.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %299 = load i64, ptr %arrayidx12.i251.i, align 8
  %and13.i252.i = and i64 %298, 6148914691236517205
  %and14.i253.i = shl i64 %299, 1
  %shl15.i.i = and i64 %and14.i253.i, -6148914691236517206
  %or16.i.i = or disjoint i64 %and13.i252.i, %shl15.i.i
  %arrayidx17.i254.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or16.i.i, ptr %arrayidx17.i254.i, align 8
  %and18.i.i = lshr i64 %298, 1
  %shr19.i.i = and i64 %and18.i.i, 6148914691236517205
  %and20.i.i = and i64 %299, -6148914691236517206
  %or21.i.i = or disjoint i64 %shr19.i.i, %and20.i.i
  %arrayidx22.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or21.i.i, ptr %arrayidx22.i.i, align 8
  %arrayidx27.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %300 = load i64, ptr %arrayidx27.i.i, align 8
  %arrayidx28.i255.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %301 = load i64, ptr %arrayidx28.i255.i, align 8
  %and29.i.i = and i64 %300, 6148914691236517205
  %and30.i256.i = shl i64 %301, 1
  %shl31.i.i = and i64 %and30.i256.i, -6148914691236517206
  %or32.i257.i = or disjoint i64 %and29.i.i, %shl31.i.i
  %arrayidx33.i258.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or32.i257.i, ptr %arrayidx33.i258.i, align 8
  %and34.i259.i = lshr i64 %300, 1
  %shr35.i.i = and i64 %and34.i259.i, 6148914691236517205
  %and36.i.i = and i64 %301, -6148914691236517206
  %or37.i.i = or disjoint i64 %shr35.i.i, %and36.i.i
  %arrayidx38.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or37.i.i, ptr %arrayidx38.i.i, align 8
  %arrayidx43.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %302 = load i64, ptr %arrayidx43.i.i, align 8
  %arrayidx44.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %303 = load i64, ptr %arrayidx44.i.i, align 8
  %and45.i.i = and i64 %302, 6148914691236517205
  %and46.i.i = shl i64 %303, 1
  %shl47.i.i = and i64 %and46.i.i, -6148914691236517206
  %or48.i.i = or disjoint i64 %and45.i.i, %shl47.i.i
  %arrayidx49.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or48.i.i, ptr %arrayidx49.i.i, align 8
  %and50.i.i = lshr i64 %302, 1
  %shr51.i.i = and i64 %and50.i.i, 6148914691236517205
  %and52.i.i = and i64 %303, -6148914691236517206
  %or53.i.i = or disjoint i64 %shr51.i.i, %and52.i.i
  %arrayidx54.i260.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or53.i.i, ptr %arrayidx54.i260.i, align 8
  %304 = load i64, ptr %q.i, align 8
  %arrayidx60.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %305 = load i64, ptr %arrayidx60.i.i, align 8
  %and61.i.i = and i64 %304, 3689348814741910323
  %and62.i.i = shl i64 %305, 2
  %shl63.i.i = and i64 %and62.i.i, -3689348814741910324
  %or64.i.i = or disjoint i64 %and61.i.i, %shl63.i.i
  store i64 %or64.i.i, ptr %q.i, align 8
  %and66.i261.i = lshr i64 %304, 2
  %shr67.i.i = and i64 %and66.i261.i, 3689348814741910323
  %and68.i.i = and i64 %305, -3689348814741910324
  %or69.i.i = or disjoint i64 %shr67.i.i, %and68.i.i
  %arrayidx70.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or69.i.i, ptr %arrayidx70.i.i, align 8
  %arrayidx75.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %306 = load i64, ptr %arrayidx75.i.i, align 8
  %arrayidx76.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %307 = load i64, ptr %arrayidx76.i.i, align 8
  %and77.i262.i = and i64 %306, 3689348814741910323
  %and78.i263.i = shl i64 %307, 2
  %shl79.i.i = and i64 %and78.i263.i, -3689348814741910324
  %or80.i.i = or disjoint i64 %and77.i262.i, %shl79.i.i
  %arrayidx81.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or80.i.i, ptr %arrayidx81.i.i, align 8
  %and82.i264.i = lshr i64 %306, 2
  %shr83.i.i = and i64 %and82.i264.i, 3689348814741910323
  %and84.i265.i = and i64 %307, -3689348814741910324
  %or85.i.i = or disjoint i64 %shr83.i.i, %and84.i265.i
  %arrayidx86.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or85.i.i, ptr %arrayidx86.i.i, align 8
  %arrayidx91.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %308 = load i64, ptr %arrayidx91.i.i, align 8
  %arrayidx92.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %309 = load i64, ptr %arrayidx92.i.i, align 8
  %and93.i.i = and i64 %308, 3689348814741910323
  %and94.i.i = shl i64 %309, 2
  %shl95.i.i = and i64 %and94.i.i, -3689348814741910324
  %or96.i.i = or disjoint i64 %and93.i.i, %shl95.i.i
  %arrayidx97.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or96.i.i, ptr %arrayidx97.i.i, align 8
  %and98.i.i = lshr i64 %308, 2
  %shr99.i.i = and i64 %and98.i.i, 3689348814741910323
  %and100.i.i = and i64 %309, -3689348814741910324
  %or101.i.i = or disjoint i64 %shr99.i.i, %and100.i.i
  %arrayidx102.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or101.i.i, ptr %arrayidx102.i.i, align 8
  %arrayidx107.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %310 = load i64, ptr %arrayidx107.i.i, align 8
  %arrayidx108.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %311 = load i64, ptr %arrayidx108.i.i, align 8
  %and109.i.i = and i64 %310, 3689348814741910323
  %and110.i.i = shl i64 %311, 2
  %shl111.i.i = and i64 %and110.i.i, -3689348814741910324
  %or112.i.i = or disjoint i64 %and109.i.i, %shl111.i.i
  %arrayidx113.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or112.i.i, ptr %arrayidx113.i.i, align 8
  %and114.i.i = lshr i64 %310, 2
  %shr115.i.i = and i64 %and114.i.i, 3689348814741910323
  %and116.i.i = and i64 %311, -3689348814741910324
  %or117.i.i = or disjoint i64 %shr115.i.i, %and116.i.i
  %arrayidx118.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or117.i.i, ptr %arrayidx118.i.i, align 8
  %312 = load i64, ptr %q.i, align 8
  %arrayidx124.i266.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  %313 = load i64, ptr %arrayidx124.i266.i, align 8
  %and125.i.i = and i64 %312, 1085102592571150095
  %and126.i.i = shl i64 %313, 4
  %shl127.i.i = and i64 %and126.i.i, -1085102592571150096
  %or128.i.i = or disjoint i64 %and125.i.i, %shl127.i.i
  store i64 %or128.i.i, ptr %q.i, align 8
  %and130.i.i = lshr i64 %312, 4
  %shr131.i.i = and i64 %and130.i.i, 1085102592571150095
  %and132.i.i = and i64 %313, -1085102592571150096
  %or133.i.i = or disjoint i64 %shr131.i.i, %and132.i.i
  %arrayidx134.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 32
  store i64 %or133.i.i, ptr %arrayidx134.i.i, align 8
  %arrayidx139.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  %314 = load i64, ptr %arrayidx139.i.i, align 8
  %arrayidx140.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  %315 = load i64, ptr %arrayidx140.i.i, align 8
  %and141.i.i = and i64 %314, 1085102592571150095
  %and142.i.i = shl i64 %315, 4
  %shl143.i.i = and i64 %and142.i.i, -1085102592571150096
  %or144.i.i = or disjoint i64 %and141.i.i, %shl143.i.i
  %arrayidx145.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 8
  store i64 %or144.i.i, ptr %arrayidx145.i.i, align 8
  %and146.i.i = lshr i64 %314, 4
  %shr147.i.i = and i64 %and146.i.i, 1085102592571150095
  %and148.i.i = and i64 %315, -1085102592571150096
  %or149.i.i = or disjoint i64 %shr147.i.i, %and148.i.i
  %arrayidx150.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 40
  store i64 %or149.i.i, ptr %arrayidx150.i.i, align 8
  %arrayidx155.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  %316 = load i64, ptr %arrayidx155.i.i, align 8
  %arrayidx156.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  %317 = load i64, ptr %arrayidx156.i.i, align 8
  %and157.i.i = and i64 %316, 1085102592571150095
  %and158.i.i = shl i64 %317, 4
  %shl159.i.i = and i64 %and158.i.i, -1085102592571150096
  %or160.i.i = or disjoint i64 %and157.i.i, %shl159.i.i
  %arrayidx161.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 16
  store i64 %or160.i.i, ptr %arrayidx161.i.i, align 8
  %and162.i.i = lshr i64 %316, 4
  %shr163.i.i = and i64 %and162.i.i, 1085102592571150095
  %and164.i.i = and i64 %317, -1085102592571150096
  %or165.i.i = or disjoint i64 %shr163.i.i, %and164.i.i
  %arrayidx166.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 48
  store i64 %or165.i.i, ptr %arrayidx166.i.i, align 8
  %arrayidx171.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  %318 = load i64, ptr %arrayidx171.i.i, align 8
  %arrayidx172.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  %319 = load i64, ptr %arrayidx172.i.i, align 8
  %and173.i.i = and i64 %318, 1085102592571150095
  %and174.i.i = shl i64 %319, 4
  %shl175.i.i = and i64 %and174.i.i, -1085102592571150096
  %or176.i.i = or disjoint i64 %and173.i.i, %shl175.i.i
  %arrayidx177.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 24
  store i64 %or176.i.i, ptr %arrayidx177.i.i, align 8
  %and178.i.i = lshr i64 %318, 4
  %shr179.i.i = and i64 %and178.i.i, 1085102592571150095
  %and180.i.i = and i64 %319, -1085102592571150096
  %or181.i267.i = or disjoint i64 %shr179.i.i, %and180.i.i
  %arrayidx182.i.i = getelementptr inbounds nuw i8, ptr %q.i, i32 56
  store i64 %or181.i267.i, ptr %arrayidx182.i.i, align 8
  br label %for.body24.i

while.cond.i.i29.preheader:                       ; preds = %for.body24.i
  br label %while.body.i.i33

for.body24.i:                                     ; preds = %shift_rows.exit28.i, %for.body24.i
  %i.2.i1145 = phi i32 [ 0, %shift_rows.exit28.i ], [ %inc32.i, %for.body24.i ]
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
  br i1 %exitcond2.i.not, label %while.cond.i.i29.preheader, label %for.body24.i, !llvm.loop !111

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
  br i1 %cmp.not.i.i32, label %aes_ecb4x.exit, label %while.body.i.i33, !llvm.loop !112

aes_ecb4x.exit:                                   ; preds = %while.body.i.i33
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %w.i)
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %q.i)
  %add.ptr.i17 = getelementptr inbounds nuw i8, ptr %ivw.i, i32 12
  %327 = load i32, ptr %add.ptr.i17, align 4
  %328 = call i32 @llvm.bswap.i32(i32 %327)
  %add.i8.i18 = add i32 %328, 4
  %329 = call i32 @llvm.bswap.i32(i32 %add.i8.i18)
  store i32 %329, ptr %add.ptr.i17, align 4
  %add.ptr1.i19 = getelementptr inbounds nuw i8, ptr %ivw.i, i32 28
  %330 = load i32, ptr %add.ptr1.i19, align 4
  %331 = call i32 @llvm.bswap.i32(i32 %330)
  %add.i5.i20 = add i32 %331, 4
  %332 = call i32 @llvm.bswap.i32(i32 %add.i5.i20)
  store i32 %332, ptr %add.ptr1.i19, align 4
  %add.ptr2.i21 = getelementptr inbounds nuw i8, ptr %ivw.i, i32 44
  %333 = load i32, ptr %add.ptr2.i21, align 4
  %334 = call i32 @llvm.bswap.i32(i32 %333)
  %add.i.i22 = add i32 %334, 4
  %335 = call i32 @llvm.bswap.i32(i32 %add.i.i22)
  store i32 %335, ptr %add.ptr2.i21, align 4
  %add.ptr3.i23 = getelementptr inbounds nuw i8, ptr %ivw.i, i32 60
  %336 = load i32, ptr %add.ptr3.i23, align 4
  %337 = call i32 @llvm.bswap.i32(i32 %336)
  %add.i2.i24 = add i32 %337, 4
  %338 = call i32 @llvm.bswap.i32(i32 %add.i2.i24)
  store i32 %338, ptr %add.ptr3.i23, align 4
  %add.ptr21.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i1151, i32 64
  %sub.i15 = add i32 %outlen.addr.0.i1150, -64
  %cmp.i9 = icmp ugt i32 %sub.i15, 64
  br i1 %cmp.i9, label %while.body.i, label %while.cond.i.while.end.i_crit_edge, !llvm.loop !113

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
  br i1 %exitcond.i57.not, label %for.end.i58, label %for.body.i791, !llvm.loop !114

for.end.i58:                                      ; preds = %for.body.i791
  %347 = load i64, ptr %q.i53, align 8
  %arrayidx1.i268.i59 = getelementptr inbounds nuw i8, ptr %q.i53, i32 8
  %348 = load i64, ptr %arrayidx1.i268.i59, align 8
  %and.i269.i60 = and i64 %347, 6148914691236517205
  %and2.i270.i61 = shl i64 %348, 1
  %shl.i271.i62 = and i64 %and2.i270.i61, -6148914691236517206
  %or.i272.i63 = or disjoint i64 %and.i269.i60, %shl.i271.i62
  store i64 %or.i272.i63, ptr %q.i53, align 8
  %and4.i273.i64 = lshr i64 %347, 1
  %shr.i274.i65 = and i64 %and4.i273.i64, 6148914691236517205
  %and5.i275.i66 = and i64 %348, -6148914691236517206
  %or6.i276.i67 = or disjoint i64 %shr.i274.i65, %and5.i275.i66
  %arrayidx7.i277.i68 = getelementptr inbounds nuw i8, ptr %q.i53, i32 8
  store i64 %or6.i276.i67, ptr %arrayidx7.i277.i68, align 8
  %arrayidx11.i278.i69 = getelementptr inbounds nuw i8, ptr %q.i53, i32 16
  %349 = load i64, ptr %arrayidx11.i278.i69, align 8
  %arrayidx12.i279.i70 = getelementptr inbounds nuw i8, ptr %q.i53, i32 24
  %350 = load i64, ptr %arrayidx12.i279.i70, align 8
  %and13.i280.i71 = and i64 %349, 6148914691236517205
  %and14.i281.i72 = shl i64 %350, 1
  %shl15.i282.i73 = and i64 %and14.i281.i72, -6148914691236517206
  %or16.i283.i74 = or disjoint i64 %and13.i280.i71, %shl15.i282.i73
  %arrayidx17.i284.i75 = getelementptr inbounds nuw i8, ptr %q.i53, i32 16
  store i64 %or16.i283.i74, ptr %arrayidx17.i284.i75, align 8
  %and18.i285.i76 = lshr i64 %349, 1
  %shr19.i286.i77 = and i64 %and18.i285.i76, 6148914691236517205
  %and20.i287.i78 = and i64 %350, -6148914691236517206
  %or21.i288.i79 = or disjoint i64 %shr19.i286.i77, %and20.i287.i78
  %arrayidx22.i289.i80 = getelementptr inbounds nuw i8, ptr %q.i53, i32 24
  store i64 %or21.i288.i79, ptr %arrayidx22.i289.i80, align 8
  %arrayidx27.i290.i81 = getelementptr inbounds nuw i8, ptr %q.i53, i32 32
  %351 = load i64, ptr %arrayidx27.i290.i81, align 8
  %arrayidx28.i291.i82 = getelementptr inbounds nuw i8, ptr %q.i53, i32 40
  %352 = load i64, ptr %arrayidx28.i291.i82, align 8
  %and29.i292.i83 = and i64 %351, 6148914691236517205
  %and30.i293.i84 = shl i64 %352, 1
  %shl31.i294.i85 = and i64 %and30.i293.i84, -6148914691236517206
  %or32.i295.i86 = or disjoint i64 %and29.i292.i83, %shl31.i294.i85
  %arrayidx33.i296.i87 = getelementptr inbounds nuw i8, ptr %q.i53, i32 32
  store i64 %or32.i295.i86, ptr %arrayidx33.i296.i87, align 8
  %and34.i297.i88 = lshr i64 %351, 1
  %shr35.i298.i89 = and i64 %and34.i297.i88, 6148914691236517205
  %and36.i299.i90 = and i64 %352, -6148914691236517206
  %or37.i300.i91 = or disjoint i64 %shr35.i298.i89, %and36.i299.i90
  %arrayidx38.i301.i92 = getelementptr inbounds nuw i8, ptr %q.i53, i32 40
  store i64 %or37.i300.i91, ptr %arrayidx38.i301.i92, align 8
  %arrayidx43.i302.i93 = getelementptr inbounds nuw i8, ptr %q.i53, i32 48
  %353 = load i64, ptr %arrayidx43.i302.i93, align 8
  %arrayidx44.i303.i94 = getelementptr inbounds nuw i8, ptr %q.i53, i32 56
  %354 = load i64, ptr %arrayidx44.i303.i94, align 8
  %and45.i304.i95 = and i64 %353, 6148914691236517205
  %and46.i305.i96 = shl i64 %354, 1
  %shl47.i306.i97 = and i64 %and46.i305.i96, -6148914691236517206
  %or48.i307.i98 = or disjoint i64 %and45.i304.i95, %shl47.i306.i97
  %arrayidx49.i308.i99 = getelementptr inbounds nuw i8, ptr %q.i53, i32 48
  store i64 %or48.i307.i98, ptr %arrayidx49.i308.i99, align 8
  %and50.i309.i100 = lshr i64 %353, 1
  %shr51.i310.i101 = and i64 %and50.i309.i100, 6148914691236517205
  %and52.i311.i102 = and i64 %354, -6148914691236517206
  %or53.i312.i103 = or disjoint i64 %shr51.i310.i101, %and52.i311.i102
  %arrayidx54.i313.i104 = getelementptr inbounds nuw i8, ptr %q.i53, i32 56
  store i64 %or53.i312.i103, ptr %arrayidx54.i313.i104, align 8
  %355 = load i64, ptr %q.i53, align 8
  %arrayidx60.i314.i105 = getelementptr inbounds nuw i8, ptr %q.i53, i32 16
  %356 = load i64, ptr %arrayidx60.i314.i105, align 8
  %and61.i315.i106 = and i64 %355, 3689348814741910323
  %and62.i316.i107 = shl i64 %356, 2
  %shl63.i317.i108 = and i64 %and62.i316.i107, -3689348814741910324
  %or64.i318.i109 = or disjoint i64 %and61.i315.i106, %shl63.i317.i108
  store i64 %or64.i318.i109, ptr %q.i53, align 8
  %and66.i319.i110 = lshr i64 %355, 2
  %shr67.i320.i111 = and i64 %and66.i319.i110, 3689348814741910323
  %and68.i321.i112 = and i64 %356, -3689348814741910324
  %or69.i322.i113 = or disjoint i64 %shr67.i320.i111, %and68.i321.i112
  %arrayidx70.i323.i114 = getelementptr inbounds nuw i8, ptr %q.i53, i32 16
  store i64 %or69.i322.i113, ptr %arrayidx70.i323.i114, align 8
  %arrayidx75.i324.i115 = getelementptr inbounds nuw i8, ptr %q.i53, i32 8
  %357 = load i64, ptr %arrayidx75.i324.i115, align 8
  %arrayidx76.i325.i116 = getelementptr inbounds nuw i8, ptr %q.i53, i32 24
  %358 = load i64, ptr %arrayidx76.i325.i116, align 8
  %and77.i326.i117 = and i64 %357, 3689348814741910323
  %and78.i327.i118 = shl i64 %358, 2
  %shl79.i328.i119 = and i64 %and78.i327.i118, -3689348814741910324
  %or80.i329.i120 = or disjoint i64 %and77.i326.i117, %shl79.i328.i119
  %arrayidx81.i330.i121 = getelementptr inbounds nuw i8, ptr %q.i53, i32 8
  store i64 %or80.i329.i120, ptr %arrayidx81.i330.i121, align 8
  %and82.i331.i122 = lshr i64 %357, 2
  %shr83.i332.i123 = and i64 %and82.i331.i122, 3689348814741910323
  %and84.i333.i124 = and i64 %358, -3689348814741910324
  %or85.i334.i125 = or disjoint i64 %shr83.i332.i123, %and84.i333.i124
  %arrayidx86.i335.i126 = getelementptr inbounds nuw i8, ptr %q.i53, i32 24
  store i64 %or85.i334.i125, ptr %arrayidx86.i335.i126, align 8
  %arrayidx91.i336.i127 = getelementptr inbounds nuw i8, ptr %q.i53, i32 32
  %359 = load i64, ptr %arrayidx91.i336.i127, align 8
  %arrayidx92.i337.i128 = getelementptr inbounds nuw i8, ptr %q.i53, i32 48
  %360 = load i64, ptr %arrayidx92.i337.i128, align 8
  %and93.i338.i129 = and i64 %359, 3689348814741910323
  %and94.i339.i130 = shl i64 %360, 2
  %shl95.i340.i131 = and i64 %and94.i339.i130, -3689348814741910324
  %or96.i341.i132 = or disjoint i64 %and93.i338.i129, %shl95.i340.i131
  %arrayidx97.i342.i133 = getelementptr inbounds nuw i8, ptr %q.i53, i32 32
  store i64 %or96.i341.i132, ptr %arrayidx97.i342.i133, align 8
  %and98.i343.i134 = lshr i64 %359, 2
  %shr99.i344.i135 = and i64 %and98.i343.i134, 3689348814741910323
  %and100.i345.i136 = and i64 %360, -3689348814741910324
  %or101.i346.i137 = or disjoint i64 %shr99.i344.i135, %and100.i345.i136
  %arrayidx102.i347.i138 = getelementptr inbounds nuw i8, ptr %q.i53, i32 48
  store i64 %or101.i346.i137, ptr %arrayidx102.i347.i138, align 8
  %arrayidx107.i348.i139 = getelementptr inbounds nuw i8, ptr %q.i53, i32 40
  %361 = load i64, ptr %arrayidx107.i348.i139, align 8
  %arrayidx108.i349.i140 = getelementptr inbounds nuw i8, ptr %q.i53, i32 56
  %362 = load i64, ptr %arrayidx108.i349.i140, align 8
  %and109.i350.i141 = and i64 %361, 3689348814741910323
  %and110.i351.i142 = shl i64 %362, 2
  %shl111.i352.i143 = and i64 %and110.i351.i142, -3689348814741910324
  %or112.i353.i144 = or disjoint i64 %and109.i350.i141, %shl111.i352.i143
  %arrayidx113.i354.i145 = getelementptr inbounds nuw i8, ptr %q.i53, i32 40
  store i64 %or112.i353.i144, ptr %arrayidx113.i354.i145, align 8
  %and114.i355.i146 = lshr i64 %361, 2
  %shr115.i356.i147 = and i64 %and114.i355.i146, 3689348814741910323
  %and116.i357.i148 = and i64 %362, -3689348814741910324
  %or117.i358.i149 = or disjoint i64 %shr115.i356.i147, %and116.i357.i148
  %arrayidx118.i359.i150 = getelementptr inbounds nuw i8, ptr %q.i53, i32 56
  store i64 %or117.i358.i149, ptr %arrayidx118.i359.i150, align 8
  %363 = load i64, ptr %q.i53, align 8
  %arrayidx124.i360.i151 = getelementptr inbounds nuw i8, ptr %q.i53, i32 32
  %364 = load i64, ptr %arrayidx124.i360.i151, align 8
  %and125.i361.i152 = and i64 %363, 1085102592571150095
  %and126.i362.i153 = shl i64 %364, 4
  %shl127.i363.i154 = and i64 %and126.i362.i153, -1085102592571150096
  %or128.i364.i155 = or disjoint i64 %and125.i361.i152, %shl127.i363.i154
  store i64 %or128.i364.i155, ptr %q.i53, align 8
  %and130.i365.i156 = lshr i64 %363, 4
  %shr131.i366.i157 = and i64 %and130.i365.i156, 1085102592571150095
  %and132.i367.i158 = and i64 %364, -1085102592571150096
  %or133.i368.i159 = or disjoint i64 %shr131.i366.i157, %and132.i367.i158
  %arrayidx134.i369.i160 = getelementptr inbounds nuw i8, ptr %q.i53, i32 32
  store i64 %or133.i368.i159, ptr %arrayidx134.i369.i160, align 8
  %arrayidx139.i370.i161 = getelementptr inbounds nuw i8, ptr %q.i53, i32 8
  %365 = load i64, ptr %arrayidx139.i370.i161, align 8
  %arrayidx140.i371.i162 = getelementptr inbounds nuw i8, ptr %q.i53, i32 40
  %366 = load i64, ptr %arrayidx140.i371.i162, align 8
  %and141.i372.i163 = and i64 %365, 1085102592571150095
  %and142.i373.i164 = shl i64 %366, 4
  %shl143.i374.i165 = and i64 %and142.i373.i164, -1085102592571150096
  %or144.i375.i166 = or disjoint i64 %and141.i372.i163, %shl143.i374.i165
  %arrayidx145.i376.i167 = getelementptr inbounds nuw i8, ptr %q.i53, i32 8
  store i64 %or144.i375.i166, ptr %arrayidx145.i376.i167, align 8
  %and146.i377.i168 = lshr i64 %365, 4
  %shr147.i378.i169 = and i64 %and146.i377.i168, 1085102592571150095
  %and148.i379.i170 = and i64 %366, -1085102592571150096
  %or149.i380.i171 = or disjoint i64 %shr147.i378.i169, %and148.i379.i170
  %arrayidx150.i381.i172 = getelementptr inbounds nuw i8, ptr %q.i53, i32 40
  store i64 %or149.i380.i171, ptr %arrayidx150.i381.i172, align 8
  %arrayidx155.i382.i173 = getelementptr inbounds nuw i8, ptr %q.i53, i32 16
  %367 = load i64, ptr %arrayidx155.i382.i173, align 8
  %arrayidx156.i383.i174 = getelementptr inbounds nuw i8, ptr %q.i53, i32 48
  %368 = load i64, ptr %arrayidx156.i383.i174, align 8
  %and157.i384.i175 = and i64 %367, 1085102592571150095
  %and158.i385.i176 = shl i64 %368, 4
  %shl159.i386.i177 = and i64 %and158.i385.i176, -1085102592571150096
  %or160.i387.i178 = or disjoint i64 %and157.i384.i175, %shl159.i386.i177
  %arrayidx161.i388.i179 = getelementptr inbounds nuw i8, ptr %q.i53, i32 16
  store i64 %or160.i387.i178, ptr %arrayidx161.i388.i179, align 8
  %and162.i389.i180 = lshr i64 %367, 4
  %shr163.i390.i181 = and i64 %and162.i389.i180, 1085102592571150095
  %and164.i391.i182 = and i64 %368, -1085102592571150096
  %or165.i392.i183 = or disjoint i64 %shr163.i390.i181, %and164.i391.i182
  %arrayidx166.i393.i184 = getelementptr inbounds nuw i8, ptr %q.i53, i32 48
  store i64 %or165.i392.i183, ptr %arrayidx166.i393.i184, align 8
  %arrayidx171.i394.i185 = getelementptr inbounds nuw i8, ptr %q.i53, i32 24
  %369 = load i64, ptr %arrayidx171.i394.i185, align 8
  %arrayidx172.i395.i186 = getelementptr inbounds nuw i8, ptr %q.i53, i32 56
  %370 = load i64, ptr %arrayidx172.i395.i186, align 8
  %and173.i396.i187 = and i64 %369, 1085102592571150095
  %and174.i397.i188 = shl i64 %370, 4
  %shl175.i398.i189 = and i64 %and174.i397.i188, -1085102592571150096
  %or176.i399.i190 = or disjoint i64 %and173.i396.i187, %shl175.i398.i189
  %arrayidx177.i400.i191 = getelementptr inbounds nuw i8, ptr %q.i53, i32 24
  store i64 %or176.i399.i190, ptr %arrayidx177.i400.i191, align 8
  %and178.i401.i192 = lshr i64 %369, 4
  %shr179.i402.i193 = and i64 %and178.i401.i192, 1085102592571150095
  %and180.i403.i194 = and i64 %370, -1085102592571150096
  %or181.i404.i195 = or disjoint i64 %shr179.i402.i193, %and180.i403.i194
  %arrayidx182.i405.i196 = getelementptr inbounds nuw i8, ptr %q.i53, i32 56
  store i64 %or181.i404.i195, ptr %arrayidx182.i405.i196, align 8
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

for.body7.i589:                                   ; preds = %for.end.i58, %shift_rows.exit.i712
  %i.1.i2201155 = phi i32 [ 1, %for.end.i58 ], [ %inc15.i767, %shift_rows.exit.i712 ]
  %arrayidx.i101.i590 = getelementptr inbounds nuw i8, ptr %q.i53, i32 56
  %387 = load i64, ptr %arrayidx.i101.i590, align 8
  %arrayidx1.i102.i591 = getelementptr inbounds nuw i8, ptr %q.i53, i32 48
  %388 = load i64, ptr %arrayidx1.i102.i591, align 8
  %arrayidx2.i103.i592 = getelementptr inbounds nuw i8, ptr %q.i53, i32 40
  %389 = load i64, ptr %arrayidx2.i103.i592, align 8
  %arrayidx3.i104.i593 = getelementptr inbounds nuw i8, ptr %q.i53, i32 32
  %390 = load i64, ptr %arrayidx3.i104.i593, align 8
  %arrayidx4.i105.i594 = getelementptr inbounds nuw i8, ptr %q.i53, i32 24
  %391 = load i64, ptr %arrayidx4.i105.i594, align 8
  %arrayidx5.i106.i595 = getelementptr inbounds nuw i8, ptr %q.i53, i32 16
  %392 = load i64, ptr %arrayidx5.i106.i595, align 8
  %arrayidx6.i107.i596 = getelementptr inbounds nuw i8, ptr %q.i53, i32 8
  %393 = load i64, ptr %arrayidx6.i107.i596, align 8
  %394 = load i64, ptr %q.i53, align 8
  %xor.i108.i597 = xor i64 %390, %392
  %xor8.i.i598 = xor i64 %387, %393
  %xor9.i.i599 = xor i64 %387, %390
  %xor10.i109.i600 = xor i64 %387, %392
  %xor11.i.i601 = xor i64 %388, %389
  %xor12.i.i602 = xor i64 %xor11.i.i601, %394
  %xor13.i110.i603 = xor i64 %xor12.i.i602, %390
  %xor14.i.i604 = xor i64 %xor8.i.i598, %xor.i108.i597
  %xor15.i.i605 = xor i64 %xor12.i.i602, %387
  %xor16.i111.i606 = xor i64 %xor12.i.i602, %393
  %xor17.i.i607 = xor i64 %xor16.i111.i606, %xor10.i109.i600
  %xor18.i.i608 = xor i64 %391, %xor14.i.i604
  %xor19.i112.i609 = xor i64 %xor18.i.i608, %392
  %xor20.i.i610 = xor i64 %xor18.i.i608, %388
  %xor21.i.i611 = xor i64 %xor19.i112.i609, %394
  %xor22.i113.i612 = xor i64 %xor19.i112.i609, %xor11.i.i601
  %xor23.i.i613 = xor i64 %xor20.i.i610, %xor9.i.i599
  %xor24.i.i614 = xor i64 %394, %xor23.i.i613
  %xor25.i.i615 = xor i64 %xor22.i113.i612, %xor23.i.i613
  %xor27.i.i616 = xor i64 %xor11.i.i601, %xor23.i.i613
  %and.i114.i617 = and i64 %xor14.i.i604, %xor19.i112.i609
  %and30.i.i618 = and i64 %xor17.i.i607, %xor21.i.i611
  %xor31.i115.i619 = xor i64 %and30.i.i618, %and.i114.i617
  %and32.i.i620 = and i64 %xor13.i110.i603, %394
  %and34.i.i621 = and i64 %xor8.i.i598, %xor27.i.i616
  %and35.i.i622 = and i64 %xor16.i111.i606, %xor12.i.i602
  %and37.i.i623 = and i64 %xor15.i.i605, %xor24.i.i614
  %and39.i.i624 = and i64 %xor9.i.i599, %xor23.i.i613
  %and40.i.i625 = and i64 %xor.i108.i597, %xor25.i.i615
  %xor41.i.i626 = xor i64 %and40.i.i625, %and39.i.i624
  %and42.i.i627 = and i64 %xor10.i109.i600, %xor22.i113.i612
  %xor43.i116.i628 = xor i64 %and42.i.i627, %and39.i.i624
  %xor44.i.i629 = xor i64 %xor31.i115.i619, %xor41.i.i626
  %xor48.i.i630 = xor i64 %xor44.i.i629, %xor20.i.i610
  %395 = xor i64 %xor10.i109.i600, %and32.i.i620
  %396 = xor i64 %395, %xor22.i113.i612
  %397 = xor i64 %396, %and.i114.i617
  %xor49.i.i631 = xor i64 %397, %xor43.i116.i628
  %398 = xor i64 %xor27.i.i616, %and35.i.i622
  %399 = xor i64 %398, %xor8.i.i598
  %400 = xor i64 %399, %and34.i.i621
  %xor50.i.i632 = xor i64 %400, %xor41.i.i626
  %401 = xor i64 %xor27.i.i616, %and37.i.i623
  %402 = xor i64 %401, %387
  %403 = xor i64 %402, %and34.i.i621
  %xor51.i117.i633 = xor i64 %403, %xor43.i116.i628
  %xor52.i.i634 = xor i64 %xor48.i.i630, %xor49.i.i631
  %and53.i.i635 = and i64 %xor48.i.i630, %xor50.i.i632
  %xor54.i.i636 = xor i64 %xor51.i117.i633, %and53.i.i635
  %and55.i.i637 = and i64 %xor52.i.i634, %xor54.i.i636
  %xor56.i.i638 = xor i64 %and55.i.i637, %xor49.i.i631
  %xor57.i.i639 = xor i64 %xor50.i.i632, %xor51.i117.i633
  %xor58.i.i640 = xor i64 %xor49.i.i631, %and53.i.i635
  %and59.i.i641 = and i64 %xor58.i.i640, %xor57.i.i639
  %xor60.i.i642 = xor i64 %and59.i.i641, %xor51.i117.i633
  %xor61.i118.i643 = xor i64 %xor50.i.i632, %xor60.i.i642
  %xor62.i.i644 = xor i64 %and59.i.i641, %and53.i.i635
  %and63.i.i645 = and i64 %xor51.i117.i633, %xor62.i.i644
  %xor64.i.i646 = xor i64 %and63.i.i645, %xor61.i118.i643
  %xor65.i119.i647 = xor i64 %xor54.i.i636, %and63.i.i645
  %and66.i.i648 = and i64 %xor56.i.i638, %xor65.i119.i647
  %xor67.i120.i649 = xor i64 %xor52.i.i634, %and66.i.i648
  %xor68.i.i650 = xor i64 %xor67.i120.i649, %xor64.i.i646
  %xor69.i.i651 = xor i64 %xor56.i.i638, %xor60.i.i642
  %xor70.i.i652 = xor i64 %xor56.i.i638, %xor67.i120.i649
  %xor71.i121.i653 = xor i64 %and63.i.i645, %xor50.i.i632
  %xor72.i.i654 = xor i64 %xor69.i.i651, %xor68.i.i650
  %and73.i.i655 = and i64 %xor71.i121.i653, %xor19.i112.i609
  %and74.i.i656 = and i64 %xor64.i.i646, %xor21.i.i611
  %and75.i.i657 = and i64 %xor60.i.i642, %394
  %and76.i.i658 = and i64 %xor70.i.i652, %xor27.i.i616
  %and77.i.i659 = and i64 %xor67.i120.i649, %xor12.i.i602
  %and78.i.i660 = and i64 %xor56.i.i638, %xor24.i.i614
  %and79.i.i661 = and i64 %xor69.i.i651, %xor23.i.i613
  %and80.i.i662 = and i64 %xor72.i.i654, %xor25.i.i615
  %and81.i.i663 = and i64 %xor68.i.i650, %xor22.i113.i612
  %and82.i.i664 = and i64 %xor71.i121.i653, %xor14.i.i604
  %and83.i.i665 = and i64 %xor64.i.i646, %xor17.i.i607
  %and84.i.i666 = and i64 %xor60.i.i642, %xor13.i110.i603
  %and85.i.i667 = and i64 %xor70.i.i652, %xor8.i.i598
  %and86.i.i668 = and i64 %xor67.i120.i649, %xor16.i111.i606
  %and87.i.i669 = and i64 %xor56.i.i638, %xor15.i.i605
  %and88.i.i670 = and i64 %xor69.i.i651, %xor9.i.i599
  %and89.i.i671 = and i64 %xor72.i.i654, %xor.i108.i597
  %and90.i.i672 = and i64 %xor68.i.i650, %xor10.i109.i600
  %xor91.i.i673 = xor i64 %and88.i.i670, %and89.i.i671
  %xor92.i.i674 = xor i64 %and83.i.i665, %and84.i.i666
  %xor93.i.i675 = xor i64 %and78.i.i660, %and86.i.i668
  %xor94.i.i676 = xor i64 %and82.i.i664, %and83.i.i665
  %xor95.i.i677 = xor i64 %and75.i.i657, %and85.i.i667
  %xor96.i.i678 = xor i64 %and75.i.i657, %and78.i.i660
  %xor97.i.i679 = xor i64 %and80.i.i662, %and81.i.i663
  %xor98.i.i680 = xor i64 %and73.i.i655, %and76.i.i658
  %xor99.i.i681 = xor i64 %and79.i.i661, %and80.i.i662
  %xor100.i.i682 = xor i64 %and89.i.i671, %and90.i.i672
  %xor101.i.i683 = xor i64 %and85.i.i667, %xor93.i.i675
  %xor102.i.i684 = xor i64 %xor95.i.i677, %xor98.i.i680
  %xor103.i.i685 = xor i64 %and77.i.i659, %xor91.i.i673
  %xor104.i.i686 = xor i64 %and76.i.i658, %xor99.i.i681
  %xor105.i.i687 = xor i64 %xor91.i.i673, %xor102.i.i684
  %xor106.i.i688 = xor i64 %and87.i.i669, %xor102.i.i684
  %xor107.i.i689 = xor i64 %xor97.i.i679, %xor103.i.i685
  %xor108.i.i690 = xor i64 %xor94.i.i676, %xor103.i.i685
  %xor109.i.i691 = xor i64 %and77.i.i659, %xor104.i.i686
  %xor110.i.i692 = xor i64 %xor106.i.i688, %xor107.i.i689
  %xor111.i.i693 = xor i64 %and74.i.i656, %xor108.i.i690
  %xor112.i.i694 = xor i64 %xor104.i.i686, %xor108.i.i690
  %404 = xor i64 %xor107.i.i689, %xor101.i.i683
  %xor113.i.i695 = xor i64 %404, -1
  %405 = xor i64 %xor105.i.i687, %xor93.i.i675
  %xor115.i.i696 = xor i64 %405, -1
  %xor117.i.i697 = xor i64 %xor98.i.i680, %xor111.i.i693
  %xor118.i.i698 = xor i64 %xor96.i.i678, %xor111.i.i693
  %xor119.i.i699 = xor i64 %xor92.i.i674, %xor110.i.i692
  %406 = xor i64 %xor117.i.i697, %xor109.i.i691
  %xor121.i.i700 = xor i64 %406, -1
  %407 = xor i64 %xor110.i.i692, %xor100.i.i682
  %408 = xor i64 %407, %xor109.i.i691
  %xor123.i.i701 = xor i64 %408, -1
  %arrayidx124.i.i702 = getelementptr inbounds nuw i8, ptr %q.i53, i32 56
  store i64 %xor112.i.i694, ptr %arrayidx124.i.i702, align 8
  %arrayidx125.i.i703 = getelementptr inbounds nuw i8, ptr %q.i53, i32 48
  store i64 %xor121.i.i700, ptr %arrayidx125.i.i703, align 8
  %arrayidx126.i.i704 = getelementptr inbounds nuw i8, ptr %q.i53, i32 40
  store i64 %xor123.i.i701, ptr %arrayidx126.i.i704, align 8
  %arrayidx127.i.i705 = getelementptr inbounds nuw i8, ptr %q.i53, i32 32
  store i64 %xor117.i.i697, ptr %arrayidx127.i.i705, align 8
  %arrayidx128.i.i706 = getelementptr inbounds nuw i8, ptr %q.i53, i32 24
  store i64 %xor118.i.i698, ptr %arrayidx128.i.i706, align 8
  %arrayidx129.i.i707 = getelementptr inbounds nuw i8, ptr %q.i53, i32 16
  store i64 %xor119.i.i699, ptr %arrayidx129.i.i707, align 8
  %arrayidx130.i.i708 = getelementptr inbounds nuw i8, ptr %q.i53, i32 8
  store i64 %xor113.i.i695, ptr %arrayidx130.i.i708, align 8
  store i64 %xor115.i.i696, ptr %q.i53, align 8
  br label %for.body.i.i768

for.body.i.i768:                                  ; preds = %for.body7.i589, %for.body.i.i768
  %i.0.i.i7101154 = phi i32 [ 0, %for.body7.i589 ], [ %inc.i.i790, %for.body.i.i768 ]
  %arrayidx.i.i769 = getelementptr inbounds nuw i64, ptr %q.i53, i32 %i.0.i.i7101154
  %409 = load i64, ptr %arrayidx.i.i769, align 8
  %and.i.i770 = and i64 %409, 65535
  %and1.i.i771 = lshr i64 %409, 4
  %shr.i1.i772 = and i64 %and1.i.i771, 268369920
  %or.i.i773 = or disjoint i64 %and.i.i770, %shr.i1.i772
  %and2.i.i774 = shl i64 %409, 12
  %shl.i.i775 = and i64 %and2.i.i774, 4026531840
  %or3.i.i776 = or disjoint i64 %or.i.i773, %shl.i.i775
  %and4.i.i777 = lshr i64 %409, 8
  %shr5.i.i778 = and i64 %and4.i.i777, 1095216660480
  %or6.i.i779 = or disjoint i64 %or3.i.i776, %shr5.i.i778
  %and7.i.i780 = shl i64 %409, 8
  %shl8.i.i781 = and i64 %and7.i.i780, 280375465082880
  %or9.i.i782 = or disjoint i64 %or6.i.i779, %shl8.i.i781
  %and10.i.i783 = lshr i64 %409, 12
  %shr11.i.i784 = and i64 %and10.i.i783, 4222124650659840
  %or12.i.i785 = or disjoint i64 %or9.i.i782, %shr11.i.i784
  %and13.i.i786 = shl i64 %409, 4
  %shl14.i.i787 = and i64 %and13.i.i786, -4503599627370496
  %or15.i.i788 = or i64 %or12.i.i785, %shl14.i.i787
  %arrayidx16.i.i789 = getelementptr inbounds nuw i64, ptr %q.i53, i32 %i.0.i.i7101154
  store i64 %or15.i.i788, ptr %arrayidx16.i.i789, align 8
  %inc.i.i790 = add nuw nsw i32 %i.0.i.i7101154, 1
  %exitcond.i.i711.not = icmp eq i32 %inc.i.i790, 8
  br i1 %exitcond.i.i711.not, label %shift_rows.exit.i712, label %for.body.i.i768, !llvm.loop !115

shift_rows.exit.i712:                             ; preds = %for.body.i.i768
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
  %xor.i52.i745 = xor i64 %457, %456
  store i64 %xor.i52.i745, ptr %q.i53, align 8
  %arrayidx2.i53.i746 = getelementptr inbounds nuw i8, ptr %add.ptr13.i744, i32 8
  %458 = load i64, ptr %arrayidx2.i53.i746, align 8
  %arrayidx3.i54.i747 = getelementptr inbounds nuw i8, ptr %q.i53, i32 8
  %459 = load i64, ptr %arrayidx3.i54.i747, align 8
  %xor4.i55.i748 = xor i64 %459, %458
  store i64 %xor4.i55.i748, ptr %arrayidx3.i54.i747, align 8
  %arrayidx5.i56.i749 = getelementptr inbounds nuw i8, ptr %add.ptr13.i744, i32 16
  %460 = load i64, ptr %arrayidx5.i56.i749, align 8
  %arrayidx6.i57.i750 = getelementptr inbounds nuw i8, ptr %q.i53, i32 16
  %461 = load i64, ptr %arrayidx6.i57.i750, align 8
  %xor7.i58.i751 = xor i64 %461, %460
  store i64 %xor7.i58.i751, ptr %arrayidx6.i57.i750, align 8
  %arrayidx8.i59.i752 = getelementptr inbounds nuw i8, ptr %add.ptr13.i744, i32 24
  %462 = load i64, ptr %arrayidx8.i59.i752, align 8
  %arrayidx9.i60.i753 = getelementptr inbounds nuw i8, ptr %q.i53, i32 24
  %463 = load i64, ptr %arrayidx9.i60.i753, align 8
  %xor10.i61.i754 = xor i64 %463, %462
  store i64 %xor10.i61.i754, ptr %arrayidx9.i60.i753, align 8
  %arrayidx11.i62.i755 = getelementptr inbounds nuw i8, ptr %add.ptr13.i744, i32 32
  %464 = load i64, ptr %arrayidx11.i62.i755, align 8
  %arrayidx12.i63.i756 = getelementptr inbounds nuw i8, ptr %q.i53, i32 32
  %465 = load i64, ptr %arrayidx12.i63.i756, align 8
  %xor13.i64.i757 = xor i64 %465, %464
  store i64 %xor13.i64.i757, ptr %arrayidx12.i63.i756, align 8
  %arrayidx14.i65.i758 = getelementptr inbounds nuw i8, ptr %add.ptr13.i744, i32 40
  %466 = load i64, ptr %arrayidx14.i65.i758, align 8
  %arrayidx15.i66.i759 = getelementptr inbounds nuw i8, ptr %q.i53, i32 40
  %467 = load i64, ptr %arrayidx15.i66.i759, align 8
  %xor16.i67.i760 = xor i64 %467, %466
  store i64 %xor16.i67.i760, ptr %arrayidx15.i66.i759, align 8
  %arrayidx17.i68.i761 = getelementptr inbounds nuw i8, ptr %add.ptr13.i744, i32 48
  %468 = load i64, ptr %arrayidx17.i68.i761, align 8
  %arrayidx18.i69.i762 = getelementptr inbounds nuw i8, ptr %q.i53, i32 48
  %469 = load i64, ptr %arrayidx18.i69.i762, align 8
  %xor19.i70.i763 = xor i64 %469, %468
  store i64 %xor19.i70.i763, ptr %arrayidx18.i69.i762, align 8
  %arrayidx20.i71.i764 = getelementptr inbounds nuw i8, ptr %add.ptr13.i744, i32 56
  %470 = load i64, ptr %arrayidx20.i71.i764, align 8
  %arrayidx21.i72.i765 = getelementptr inbounds nuw i8, ptr %q.i53, i32 56
  %471 = load i64, ptr %arrayidx21.i72.i765, align 8
  %xor22.i73.i766 = xor i64 %471, %470
  store i64 %xor22.i73.i766, ptr %arrayidx21.i72.i765, align 8
  %inc15.i767 = add nuw nsw i32 %i.1.i2201155, 1
  %exitcond1.i221.not = icmp eq i32 %inc15.i767, 10
  br i1 %exitcond1.i221.not, label %for.end16.i222, label %for.body7.i589, !llvm.loop !116

for.end16.i222:                                   ; preds = %shift_rows.exit.i712
  %arrayidx.i122.i223 = getelementptr inbounds nuw i8, ptr %q.i53, i32 56
  %472 = load i64, ptr %arrayidx.i122.i223, align 8
  %arrayidx1.i123.i224 = getelementptr inbounds nuw i8, ptr %q.i53, i32 48
  %473 = load i64, ptr %arrayidx1.i123.i224, align 8
  %arrayidx2.i124.i225 = getelementptr inbounds nuw i8, ptr %q.i53, i32 40
  %474 = load i64, ptr %arrayidx2.i124.i225, align 8
  %arrayidx3.i125.i226 = getelementptr inbounds nuw i8, ptr %q.i53, i32 32
  %475 = load i64, ptr %arrayidx3.i125.i226, align 8
  %arrayidx4.i126.i227 = getelementptr inbounds nuw i8, ptr %q.i53, i32 24
  %476 = load i64, ptr %arrayidx4.i126.i227, align 8
  %arrayidx5.i127.i228 = getelementptr inbounds nuw i8, ptr %q.i53, i32 16
  %477 = load i64, ptr %arrayidx5.i127.i228, align 8
  %arrayidx6.i128.i229 = getelementptr inbounds nuw i8, ptr %q.i53, i32 8
  %478 = load i64, ptr %arrayidx6.i128.i229, align 8
  %479 = load i64, ptr %q.i53, align 8
  %xor.i129.i230 = xor i64 %475, %477
  %xor8.i130.i231 = xor i64 %472, %478
  %xor9.i131.i232 = xor i64 %472, %475
  %xor10.i132.i233 = xor i64 %472, %477
  %xor11.i133.i234 = xor i64 %473, %474
  %xor12.i134.i235 = xor i64 %xor11.i133.i234, %479
  %xor13.i135.i236 = xor i64 %xor12.i134.i235, %475
  %xor14.i136.i237 = xor i64 %xor8.i130.i231, %xor.i129.i230
  %xor15.i137.i238 = xor i64 %xor12.i134.i235, %472
  %xor16.i138.i239 = xor i64 %xor12.i134.i235, %478
  %xor17.i139.i240 = xor i64 %xor16.i138.i239, %xor10.i132.i233
  %xor18.i140.i241 = xor i64 %476, %xor14.i136.i237
  %xor19.i141.i242 = xor i64 %xor18.i140.i241, %477
  %xor20.i142.i243 = xor i64 %xor18.i140.i241, %473
  %xor21.i143.i244 = xor i64 %xor19.i141.i242, %479
  %xor22.i144.i245 = xor i64 %xor19.i141.i242, %xor11.i133.i234
  %xor23.i145.i246 = xor i64 %xor20.i142.i243, %xor9.i131.i232
  %xor24.i146.i247 = xor i64 %479, %xor23.i145.i246
  %xor25.i147.i248 = xor i64 %xor22.i144.i245, %xor23.i145.i246
  %xor27.i148.i249 = xor i64 %xor11.i133.i234, %xor23.i145.i246
  %and.i149.i250 = and i64 %xor14.i136.i237, %xor19.i141.i242
  %and30.i150.i251 = and i64 %xor17.i139.i240, %xor21.i143.i244
  %xor31.i151.i252 = xor i64 %and30.i150.i251, %and.i149.i250
  %and32.i152.i253 = and i64 %xor13.i135.i236, %479
  %and34.i153.i254 = and i64 %xor8.i130.i231, %xor27.i148.i249
  %and35.i154.i255 = and i64 %xor16.i138.i239, %xor12.i134.i235
  %and37.i155.i256 = and i64 %xor15.i137.i238, %xor24.i146.i247
  %and39.i156.i257 = and i64 %xor9.i131.i232, %xor23.i145.i246
  %and40.i157.i258 = and i64 %xor.i129.i230, %xor25.i147.i248
  %xor41.i158.i259 = xor i64 %and40.i157.i258, %and39.i156.i257
  %and42.i159.i260 = and i64 %xor10.i132.i233, %xor22.i144.i245
  %xor43.i160.i261 = xor i64 %and42.i159.i260, %and39.i156.i257
  %xor44.i161.i262 = xor i64 %xor31.i151.i252, %xor41.i158.i259
  %xor48.i162.i263 = xor i64 %xor44.i161.i262, %xor20.i142.i243
  %480 = xor i64 %xor10.i132.i233, %and32.i152.i253
  %481 = xor i64 %480, %xor22.i144.i245
  %482 = xor i64 %481, %and.i149.i250
  %xor49.i163.i264 = xor i64 %482, %xor43.i160.i261
  %483 = xor i64 %xor27.i148.i249, %and35.i154.i255
  %484 = xor i64 %483, %xor8.i130.i231
  %485 = xor i64 %484, %and34.i153.i254
  %xor50.i164.i265 = xor i64 %485, %xor41.i158.i259
  %486 = xor i64 %xor27.i148.i249, %and37.i155.i256
  %487 = xor i64 %486, %472
  %488 = xor i64 %487, %and34.i153.i254
  %xor51.i165.i266 = xor i64 %488, %xor43.i160.i261
  %xor52.i166.i267 = xor i64 %xor48.i162.i263, %xor49.i163.i264
  %and53.i167.i268 = and i64 %xor48.i162.i263, %xor50.i164.i265
  %xor54.i168.i269 = xor i64 %xor51.i165.i266, %and53.i167.i268
  %and55.i169.i270 = and i64 %xor52.i166.i267, %xor54.i168.i269
  %xor56.i170.i271 = xor i64 %and55.i169.i270, %xor49.i163.i264
  %xor57.i171.i272 = xor i64 %xor50.i164.i265, %xor51.i165.i266
  %xor58.i172.i273 = xor i64 %xor49.i163.i264, %and53.i167.i268
  %and59.i173.i274 = and i64 %xor58.i172.i273, %xor57.i171.i272
  %xor60.i174.i275 = xor i64 %and59.i173.i274, %xor51.i165.i266
  %xor61.i175.i276 = xor i64 %xor50.i164.i265, %xor60.i174.i275
  %xor62.i176.i277 = xor i64 %and59.i173.i274, %and53.i167.i268
  %and63.i177.i278 = and i64 %xor51.i165.i266, %xor62.i176.i277
  %xor64.i178.i279 = xor i64 %and63.i177.i278, %xor61.i175.i276
  %xor65.i179.i280 = xor i64 %xor54.i168.i269, %and63.i177.i278
  %and66.i180.i281 = and i64 %xor56.i170.i271, %xor65.i179.i280
  %xor67.i181.i282 = xor i64 %xor52.i166.i267, %and66.i180.i281
  %xor68.i182.i283 = xor i64 %xor67.i181.i282, %xor64.i178.i279
  %xor69.i183.i284 = xor i64 %xor56.i170.i271, %xor60.i174.i275
  %xor70.i184.i285 = xor i64 %xor56.i170.i271, %xor67.i181.i282
  %xor71.i185.i286 = xor i64 %and63.i177.i278, %xor50.i164.i265
  %xor72.i186.i287 = xor i64 %xor69.i183.i284, %xor68.i182.i283
  %and73.i187.i288 = and i64 %xor71.i185.i286, %xor19.i141.i242
  %and74.i188.i289 = and i64 %xor64.i178.i279, %xor21.i143.i244
  %and75.i189.i290 = and i64 %xor60.i174.i275, %479
  %and76.i190.i291 = and i64 %xor70.i184.i285, %xor27.i148.i249
  %and77.i191.i292 = and i64 %xor67.i181.i282, %xor12.i134.i235
  %and78.i192.i293 = and i64 %xor56.i170.i271, %xor24.i146.i247
  %and79.i193.i294 = and i64 %xor69.i183.i284, %xor23.i145.i246
  %and80.i194.i295 = and i64 %xor72.i186.i287, %xor25.i147.i248
  %and81.i195.i296 = and i64 %xor68.i182.i283, %xor22.i144.i245
  %and82.i196.i297 = and i64 %xor71.i185.i286, %xor14.i136.i237
  %and83.i197.i298 = and i64 %xor64.i178.i279, %xor17.i139.i240
  %and84.i198.i299 = and i64 %xor60.i174.i275, %xor13.i135.i236
  %and85.i199.i300 = and i64 %xor70.i184.i285, %xor8.i130.i231
  %and86.i200.i301 = and i64 %xor67.i181.i282, %xor16.i138.i239
  %and87.i201.i302 = and i64 %xor56.i170.i271, %xor15.i137.i238
  %and88.i202.i303 = and i64 %xor69.i183.i284, %xor9.i131.i232
  %and89.i203.i304 = and i64 %xor72.i186.i287, %xor.i129.i230
  %and90.i204.i305 = and i64 %xor68.i182.i283, %xor10.i132.i233
  %xor91.i205.i306 = xor i64 %and88.i202.i303, %and89.i203.i304
  %xor92.i206.i307 = xor i64 %and83.i197.i298, %and84.i198.i299
  %xor93.i207.i308 = xor i64 %and78.i192.i293, %and86.i200.i301
  %xor94.i208.i309 = xor i64 %and82.i196.i297, %and83.i197.i298
  %xor95.i209.i310 = xor i64 %and75.i189.i290, %and85.i199.i300
  %xor96.i210.i311 = xor i64 %and75.i189.i290, %and78.i192.i293
  %xor97.i211.i312 = xor i64 %and80.i194.i295, %and81.i195.i296
  %xor98.i212.i313 = xor i64 %and73.i187.i288, %and76.i190.i291
  %xor99.i213.i314 = xor i64 %and79.i193.i294, %and80.i194.i295
  %xor100.i214.i315 = xor i64 %and89.i203.i304, %and90.i204.i305
  %xor101.i215.i316 = xor i64 %and85.i199.i300, %xor93.i207.i308
  %xor102.i216.i317 = xor i64 %xor95.i209.i310, %xor98.i212.i313
  %xor103.i217.i318 = xor i64 %and77.i191.i292, %xor91.i205.i306
  %xor104.i218.i319 = xor i64 %and76.i190.i291, %xor99.i213.i314
  %xor105.i219.i320 = xor i64 %xor91.i205.i306, %xor102.i216.i317
  %xor106.i220.i321 = xor i64 %and87.i201.i302, %xor102.i216.i317
  %xor107.i221.i322 = xor i64 %xor97.i211.i312, %xor103.i217.i318
  %xor108.i222.i323 = xor i64 %xor94.i208.i309, %xor103.i217.i318
  %xor109.i223.i324 = xor i64 %and77.i191.i292, %xor104.i218.i319
  %xor110.i224.i325 = xor i64 %xor106.i220.i321, %xor107.i221.i322
  %xor111.i225.i326 = xor i64 %and74.i188.i289, %xor108.i222.i323
  %xor112.i226.i327 = xor i64 %xor104.i218.i319, %xor108.i222.i323
  %489 = xor i64 %xor107.i221.i322, %xor101.i215.i316
  %xor113.i227.i328 = xor i64 %489, -1
  %490 = xor i64 %xor105.i219.i320, %xor93.i207.i308
  %xor115.i228.i329 = xor i64 %490, -1
  %xor117.i229.i330 = xor i64 %xor98.i212.i313, %xor111.i225.i326
  %xor118.i230.i331 = xor i64 %xor96.i210.i311, %xor111.i225.i326
  %xor119.i231.i332 = xor i64 %xor92.i206.i307, %xor110.i224.i325
  %491 = xor i64 %xor117.i229.i330, %xor109.i223.i324
  %xor121.i232.i333 = xor i64 %491, -1
  %492 = xor i64 %xor110.i224.i325, %xor100.i214.i315
  %493 = xor i64 %492, %xor109.i223.i324
  %xor123.i233.i334 = xor i64 %493, -1
  %arrayidx124.i234.i335 = getelementptr inbounds nuw i8, ptr %q.i53, i32 56
  store i64 %xor112.i226.i327, ptr %arrayidx124.i234.i335, align 8
  %arrayidx125.i235.i336 = getelementptr inbounds nuw i8, ptr %q.i53, i32 48
  store i64 %xor121.i232.i333, ptr %arrayidx125.i235.i336, align 8
  %arrayidx126.i236.i337 = getelementptr inbounds nuw i8, ptr %q.i53, i32 40
  store i64 %xor123.i233.i334, ptr %arrayidx126.i236.i337, align 8
  %arrayidx127.i237.i338 = getelementptr inbounds nuw i8, ptr %q.i53, i32 32
  store i64 %xor117.i229.i330, ptr %arrayidx127.i237.i338, align 8
  %arrayidx128.i238.i339 = getelementptr inbounds nuw i8, ptr %q.i53, i32 24
  store i64 %xor118.i230.i331, ptr %arrayidx128.i238.i339, align 8
  %arrayidx129.i239.i340 = getelementptr inbounds nuw i8, ptr %q.i53, i32 16
  store i64 %xor119.i231.i332, ptr %arrayidx129.i239.i340, align 8
  %arrayidx130.i240.i341 = getelementptr inbounds nuw i8, ptr %q.i53, i32 8
  store i64 %xor113.i227.i328, ptr %arrayidx130.i240.i341, align 8
  store i64 %xor115.i228.i329, ptr %q.i53, align 8
  br label %for.body.i5.i566

for.body.i5.i566:                                 ; preds = %for.end16.i222, %for.body.i5.i566
  %i.0.i3.i3431156 = phi i32 [ 0, %for.end16.i222 ], [ %inc.i27.i588, %for.body.i5.i566 ]
  %arrayidx.i6.i567 = getelementptr inbounds nuw i64, ptr %q.i53, i32 %i.0.i3.i3431156
  %494 = load i64, ptr %arrayidx.i6.i567, align 8
  %and.i7.i568 = and i64 %494, 65535
  %and1.i8.i569 = lshr i64 %494, 4
  %shr.i9.i570 = and i64 %and1.i8.i569, 268369920
  %or.i10.i571 = or disjoint i64 %and.i7.i568, %shr.i9.i570
  %and2.i11.i572 = shl i64 %494, 12
  %shl.i12.i573 = and i64 %and2.i11.i572, 4026531840
  %or3.i13.i574 = or disjoint i64 %or.i10.i571, %shl.i12.i573
  %and4.i14.i575 = lshr i64 %494, 8
  %shr5.i15.i576 = and i64 %and4.i14.i575, 1095216660480
  %or6.i16.i577 = or disjoint i64 %or3.i13.i574, %shr5.i15.i576
  %and7.i17.i578 = shl i64 %494, 8
  %shl8.i18.i579 = and i64 %and7.i17.i578, 280375465082880
  %or9.i19.i580 = or disjoint i64 %or6.i16.i577, %shl8.i18.i579
  %and10.i20.i581 = lshr i64 %494, 12
  %shr11.i21.i582 = and i64 %and10.i20.i581, 4222124650659840
  %or12.i22.i583 = or disjoint i64 %or9.i19.i580, %shr11.i21.i582
  %and13.i23.i584 = shl i64 %494, 4
  %shl14.i24.i585 = and i64 %and13.i23.i584, -4503599627370496
  %or15.i25.i586 = or i64 %or12.i22.i583, %shl14.i24.i585
  %arrayidx16.i26.i587 = getelementptr inbounds nuw i64, ptr %q.i53, i32 %i.0.i3.i3431156
  store i64 %or15.i25.i586, ptr %arrayidx16.i26.i587, align 8
  %inc.i27.i588 = add nuw nsw i32 %i.0.i3.i3431156, 1
  %exitcond.i4.i344.not = icmp eq i32 %inc.i27.i588, 8
  br i1 %exitcond.i4.i344.not, label %shift_rows.exit28.i345, label %for.body.i5.i566, !llvm.loop !117

shift_rows.exit28.i345:                           ; preds = %for.body.i5.i566
  %add.ptr20.i346 = getelementptr inbounds nuw i8, ptr %119, i32 640
  %495 = load i64, ptr %add.ptr20.i346, align 8
  %496 = load i64, ptr %q.i53, align 8
  %xor.i74.i347 = xor i64 %496, %495
  store i64 %xor.i74.i347, ptr %q.i53, align 8
  %arrayidx2.i75.i348 = getelementptr inbounds nuw i8, ptr %119, i32 648
  %497 = load i64, ptr %arrayidx2.i75.i348, align 8
  %arrayidx3.i76.i349 = getelementptr inbounds nuw i8, ptr %q.i53, i32 8
  %498 = load i64, ptr %arrayidx3.i76.i349, align 8
  %xor4.i77.i350 = xor i64 %498, %497
  store i64 %xor4.i77.i350, ptr %arrayidx3.i76.i349, align 8
  %arrayidx5.i78.i351 = getelementptr inbounds nuw i8, ptr %119, i32 656
  %499 = load i64, ptr %arrayidx5.i78.i351, align 8
  %arrayidx6.i79.i352 = getelementptr inbounds nuw i8, ptr %q.i53, i32 16
  %500 = load i64, ptr %arrayidx6.i79.i352, align 8
  %xor7.i80.i353 = xor i64 %500, %499
  store i64 %xor7.i80.i353, ptr %arrayidx6.i79.i352, align 8
  %arrayidx8.i81.i354 = getelementptr inbounds nuw i8, ptr %119, i32 664
  %501 = load i64, ptr %arrayidx8.i81.i354, align 8
  %arrayidx9.i82.i355 = getelementptr inbounds nuw i8, ptr %q.i53, i32 24
  %502 = load i64, ptr %arrayidx9.i82.i355, align 8
  %xor10.i83.i356 = xor i64 %502, %501
  store i64 %xor10.i83.i356, ptr %arrayidx9.i82.i355, align 8
  %arrayidx11.i84.i357 = getelementptr inbounds nuw i8, ptr %119, i32 672
  %503 = load i64, ptr %arrayidx11.i84.i357, align 8
  %arrayidx12.i85.i358 = getelementptr inbounds nuw i8, ptr %q.i53, i32 32
  %504 = load i64, ptr %arrayidx12.i85.i358, align 8
  %xor13.i86.i359 = xor i64 %504, %503
  store i64 %xor13.i86.i359, ptr %arrayidx12.i85.i358, align 8
  %arrayidx14.i87.i360 = getelementptr inbounds nuw i8, ptr %119, i32 680
  %505 = load i64, ptr %arrayidx14.i87.i360, align 8
  %arrayidx15.i88.i361 = getelementptr inbounds nuw i8, ptr %q.i53, i32 40
  %506 = load i64, ptr %arrayidx15.i88.i361, align 8
  %xor16.i89.i362 = xor i64 %506, %505
  store i64 %xor16.i89.i362, ptr %arrayidx15.i88.i361, align 8
  %arrayidx17.i90.i363 = getelementptr inbounds nuw i8, ptr %119, i32 688
  %507 = load i64, ptr %arrayidx17.i90.i363, align 8
  %arrayidx18.i91.i364 = getelementptr inbounds nuw i8, ptr %q.i53, i32 48
  %508 = load i64, ptr %arrayidx18.i91.i364, align 8
  %xor19.i92.i365 = xor i64 %508, %507
  store i64 %xor19.i92.i365, ptr %arrayidx18.i91.i364, align 8
  %arrayidx20.i93.i366 = getelementptr inbounds nuw i8, ptr %119, i32 696
  %509 = load i64, ptr %arrayidx20.i93.i366, align 8
  %arrayidx21.i94.i367 = getelementptr inbounds nuw i8, ptr %q.i53, i32 56
  %510 = load i64, ptr %arrayidx21.i94.i367, align 8
  %xor22.i95.i368 = xor i64 %510, %509
  store i64 %xor22.i95.i368, ptr %arrayidx21.i94.i367, align 8
  %511 = load i64, ptr %q.i53, align 8
  %arrayidx1.i241.i369 = getelementptr inbounds nuw i8, ptr %q.i53, i32 8
  %512 = load i64, ptr %arrayidx1.i241.i369, align 8
  %and.i242.i370 = and i64 %511, 6148914691236517205
  %and2.i243.i371 = shl i64 %512, 1
  %shl.i244.i372 = and i64 %and2.i243.i371, -6148914691236517206
  %or.i245.i373 = or disjoint i64 %and.i242.i370, %shl.i244.i372
  store i64 %or.i245.i373, ptr %q.i53, align 8
  %and4.i246.i374 = lshr i64 %511, 1
  %shr.i247.i375 = and i64 %and4.i246.i374, 6148914691236517205
  %and5.i.i376 = and i64 %512, -6148914691236517206
  %or6.i248.i377 = or disjoint i64 %shr.i247.i375, %and5.i.i376
  %arrayidx7.i249.i378 = getelementptr inbounds nuw i8, ptr %q.i53, i32 8
  store i64 %or6.i248.i377, ptr %arrayidx7.i249.i378, align 8
  %arrayidx11.i250.i379 = getelementptr inbounds nuw i8, ptr %q.i53, i32 16
  %513 = load i64, ptr %arrayidx11.i250.i379, align 8
  %arrayidx12.i251.i380 = getelementptr inbounds nuw i8, ptr %q.i53, i32 24
  %514 = load i64, ptr %arrayidx12.i251.i380, align 8
  %and13.i252.i381 = and i64 %513, 6148914691236517205
  %and14.i253.i382 = shl i64 %514, 1
  %shl15.i.i383 = and i64 %and14.i253.i382, -6148914691236517206
  %or16.i.i384 = or disjoint i64 %and13.i252.i381, %shl15.i.i383
  %arrayidx17.i254.i385 = getelementptr inbounds nuw i8, ptr %q.i53, i32 16
  store i64 %or16.i.i384, ptr %arrayidx17.i254.i385, align 8
  %and18.i.i386 = lshr i64 %513, 1
  %shr19.i.i387 = and i64 %and18.i.i386, 6148914691236517205
  %and20.i.i388 = and i64 %514, -6148914691236517206
  %or21.i.i389 = or disjoint i64 %shr19.i.i387, %and20.i.i388
  %arrayidx22.i.i390 = getelementptr inbounds nuw i8, ptr %q.i53, i32 24
  store i64 %or21.i.i389, ptr %arrayidx22.i.i390, align 8
  %arrayidx27.i.i391 = getelementptr inbounds nuw i8, ptr %q.i53, i32 32
  %515 = load i64, ptr %arrayidx27.i.i391, align 8
  %arrayidx28.i255.i392 = getelementptr inbounds nuw i8, ptr %q.i53, i32 40
  %516 = load i64, ptr %arrayidx28.i255.i392, align 8
  %and29.i.i393 = and i64 %515, 6148914691236517205
  %and30.i256.i394 = shl i64 %516, 1
  %shl31.i.i395 = and i64 %and30.i256.i394, -6148914691236517206
  %or32.i257.i396 = or disjoint i64 %and29.i.i393, %shl31.i.i395
  %arrayidx33.i258.i397 = getelementptr inbounds nuw i8, ptr %q.i53, i32 32
  store i64 %or32.i257.i396, ptr %arrayidx33.i258.i397, align 8
  %and34.i259.i398 = lshr i64 %515, 1
  %shr35.i.i399 = and i64 %and34.i259.i398, 6148914691236517205
  %and36.i.i400 = and i64 %516, -6148914691236517206
  %or37.i.i401 = or disjoint i64 %shr35.i.i399, %and36.i.i400
  %arrayidx38.i.i402 = getelementptr inbounds nuw i8, ptr %q.i53, i32 40
  store i64 %or37.i.i401, ptr %arrayidx38.i.i402, align 8
  %arrayidx43.i.i403 = getelementptr inbounds nuw i8, ptr %q.i53, i32 48
  %517 = load i64, ptr %arrayidx43.i.i403, align 8
  %arrayidx44.i.i404 = getelementptr inbounds nuw i8, ptr %q.i53, i32 56
  %518 = load i64, ptr %arrayidx44.i.i404, align 8
  %and45.i.i405 = and i64 %517, 6148914691236517205
  %and46.i.i406 = shl i64 %518, 1
  %shl47.i.i407 = and i64 %and46.i.i406, -6148914691236517206
  %or48.i.i408 = or disjoint i64 %and45.i.i405, %shl47.i.i407
  %arrayidx49.i.i409 = getelementptr inbounds nuw i8, ptr %q.i53, i32 48
  store i64 %or48.i.i408, ptr %arrayidx49.i.i409, align 8
  %and50.i.i410 = lshr i64 %517, 1
  %shr51.i.i411 = and i64 %and50.i.i410, 6148914691236517205
  %and52.i.i412 = and i64 %518, -6148914691236517206
  %or53.i.i413 = or disjoint i64 %shr51.i.i411, %and52.i.i412
  %arrayidx54.i260.i414 = getelementptr inbounds nuw i8, ptr %q.i53, i32 56
  store i64 %or53.i.i413, ptr %arrayidx54.i260.i414, align 8
  %519 = load i64, ptr %q.i53, align 8
  %arrayidx60.i.i415 = getelementptr inbounds nuw i8, ptr %q.i53, i32 16
  %520 = load i64, ptr %arrayidx60.i.i415, align 8
  %and61.i.i416 = and i64 %519, 3689348814741910323
  %and62.i.i417 = shl i64 %520, 2
  %shl63.i.i418 = and i64 %and62.i.i417, -3689348814741910324
  %or64.i.i419 = or disjoint i64 %and61.i.i416, %shl63.i.i418
  store i64 %or64.i.i419, ptr %q.i53, align 8
  %and66.i261.i420 = lshr i64 %519, 2
  %shr67.i.i421 = and i64 %and66.i261.i420, 3689348814741910323
  %and68.i.i422 = and i64 %520, -3689348814741910324
  %or69.i.i423 = or disjoint i64 %shr67.i.i421, %and68.i.i422
  %arrayidx70.i.i424 = getelementptr inbounds nuw i8, ptr %q.i53, i32 16
  store i64 %or69.i.i423, ptr %arrayidx70.i.i424, align 8
  %arrayidx75.i.i425 = getelementptr inbounds nuw i8, ptr %q.i53, i32 8
  %521 = load i64, ptr %arrayidx75.i.i425, align 8
  %arrayidx76.i.i426 = getelementptr inbounds nuw i8, ptr %q.i53, i32 24
  %522 = load i64, ptr %arrayidx76.i.i426, align 8
  %and77.i262.i427 = and i64 %521, 3689348814741910323
  %and78.i263.i428 = shl i64 %522, 2
  %shl79.i.i429 = and i64 %and78.i263.i428, -3689348814741910324
  %or80.i.i430 = or disjoint i64 %and77.i262.i427, %shl79.i.i429
  %arrayidx81.i.i431 = getelementptr inbounds nuw i8, ptr %q.i53, i32 8
  store i64 %or80.i.i430, ptr %arrayidx81.i.i431, align 8
  %and82.i264.i432 = lshr i64 %521, 2
  %shr83.i.i433 = and i64 %and82.i264.i432, 3689348814741910323
  %and84.i265.i434 = and i64 %522, -3689348814741910324
  %or85.i.i435 = or disjoint i64 %shr83.i.i433, %and84.i265.i434
  %arrayidx86.i.i436 = getelementptr inbounds nuw i8, ptr %q.i53, i32 24
  store i64 %or85.i.i435, ptr %arrayidx86.i.i436, align 8
  %arrayidx91.i.i437 = getelementptr inbounds nuw i8, ptr %q.i53, i32 32
  %523 = load i64, ptr %arrayidx91.i.i437, align 8
  %arrayidx92.i.i438 = getelementptr inbounds nuw i8, ptr %q.i53, i32 48
  %524 = load i64, ptr %arrayidx92.i.i438, align 8
  %and93.i.i439 = and i64 %523, 3689348814741910323
  %and94.i.i440 = shl i64 %524, 2
  %shl95.i.i441 = and i64 %and94.i.i440, -3689348814741910324
  %or96.i.i442 = or disjoint i64 %and93.i.i439, %shl95.i.i441
  %arrayidx97.i.i443 = getelementptr inbounds nuw i8, ptr %q.i53, i32 32
  store i64 %or96.i.i442, ptr %arrayidx97.i.i443, align 8
  %and98.i.i444 = lshr i64 %523, 2
  %shr99.i.i445 = and i64 %and98.i.i444, 3689348814741910323
  %and100.i.i446 = and i64 %524, -3689348814741910324
  %or101.i.i447 = or disjoint i64 %shr99.i.i445, %and100.i.i446
  %arrayidx102.i.i448 = getelementptr inbounds nuw i8, ptr %q.i53, i32 48
  store i64 %or101.i.i447, ptr %arrayidx102.i.i448, align 8
  %arrayidx107.i.i449 = getelementptr inbounds nuw i8, ptr %q.i53, i32 40
  %525 = load i64, ptr %arrayidx107.i.i449, align 8
  %arrayidx108.i.i450 = getelementptr inbounds nuw i8, ptr %q.i53, i32 56
  %526 = load i64, ptr %arrayidx108.i.i450, align 8
  %and109.i.i451 = and i64 %525, 3689348814741910323
  %and110.i.i452 = shl i64 %526, 2
  %shl111.i.i453 = and i64 %and110.i.i452, -3689348814741910324
  %or112.i.i454 = or disjoint i64 %and109.i.i451, %shl111.i.i453
  %arrayidx113.i.i455 = getelementptr inbounds nuw i8, ptr %q.i53, i32 40
  store i64 %or112.i.i454, ptr %arrayidx113.i.i455, align 8
  %and114.i.i456 = lshr i64 %525, 2
  %shr115.i.i457 = and i64 %and114.i.i456, 3689348814741910323
  %and116.i.i458 = and i64 %526, -3689348814741910324
  %or117.i.i459 = or disjoint i64 %shr115.i.i457, %and116.i.i458
  %arrayidx118.i.i460 = getelementptr inbounds nuw i8, ptr %q.i53, i32 56
  store i64 %or117.i.i459, ptr %arrayidx118.i.i460, align 8
  %527 = load i64, ptr %q.i53, align 8
  %arrayidx124.i266.i461 = getelementptr inbounds nuw i8, ptr %q.i53, i32 32
  %528 = load i64, ptr %arrayidx124.i266.i461, align 8
  %and125.i.i462 = and i64 %527, 1085102592571150095
  %and126.i.i463 = shl i64 %528, 4
  %shl127.i.i464 = and i64 %and126.i.i463, -1085102592571150096
  %or128.i.i465 = or disjoint i64 %and125.i.i462, %shl127.i.i464
  store i64 %or128.i.i465, ptr %q.i53, align 8
  %and130.i.i466 = lshr i64 %527, 4
  %shr131.i.i467 = and i64 %and130.i.i466, 1085102592571150095
  %and132.i.i468 = and i64 %528, -1085102592571150096
  %or133.i.i469 = or disjoint i64 %shr131.i.i467, %and132.i.i468
  %arrayidx134.i.i470 = getelementptr inbounds nuw i8, ptr %q.i53, i32 32
  store i64 %or133.i.i469, ptr %arrayidx134.i.i470, align 8
  %arrayidx139.i.i471 = getelementptr inbounds nuw i8, ptr %q.i53, i32 8
  %529 = load i64, ptr %arrayidx139.i.i471, align 8
  %arrayidx140.i.i472 = getelementptr inbounds nuw i8, ptr %q.i53, i32 40
  %530 = load i64, ptr %arrayidx140.i.i472, align 8
  %and141.i.i473 = and i64 %529, 1085102592571150095
  %and142.i.i474 = shl i64 %530, 4
  %shl143.i.i475 = and i64 %and142.i.i474, -1085102592571150096
  %or144.i.i476 = or disjoint i64 %and141.i.i473, %shl143.i.i475
  %arrayidx145.i.i477 = getelementptr inbounds nuw i8, ptr %q.i53, i32 8
  store i64 %or144.i.i476, ptr %arrayidx145.i.i477, align 8
  %and146.i.i478 = lshr i64 %529, 4
  %shr147.i.i479 = and i64 %and146.i.i478, 1085102592571150095
  %and148.i.i480 = and i64 %530, -1085102592571150096
  %or149.i.i481 = or disjoint i64 %shr147.i.i479, %and148.i.i480
  %arrayidx150.i.i482 = getelementptr inbounds nuw i8, ptr %q.i53, i32 40
  store i64 %or149.i.i481, ptr %arrayidx150.i.i482, align 8
  %arrayidx155.i.i483 = getelementptr inbounds nuw i8, ptr %q.i53, i32 16
  %531 = load i64, ptr %arrayidx155.i.i483, align 8
  %arrayidx156.i.i484 = getelementptr inbounds nuw i8, ptr %q.i53, i32 48
  %532 = load i64, ptr %arrayidx156.i.i484, align 8
  %and157.i.i485 = and i64 %531, 1085102592571150095
  %and158.i.i486 = shl i64 %532, 4
  %shl159.i.i487 = and i64 %and158.i.i486, -1085102592571150096
  %or160.i.i488 = or disjoint i64 %and157.i.i485, %shl159.i.i487
  %arrayidx161.i.i489 = getelementptr inbounds nuw i8, ptr %q.i53, i32 16
  store i64 %or160.i.i488, ptr %arrayidx161.i.i489, align 8
  %and162.i.i490 = lshr i64 %531, 4
  %shr163.i.i491 = and i64 %and162.i.i490, 1085102592571150095
  %and164.i.i492 = and i64 %532, -1085102592571150096
  %or165.i.i493 = or disjoint i64 %shr163.i.i491, %and164.i.i492
  %arrayidx166.i.i494 = getelementptr inbounds nuw i8, ptr %q.i53, i32 48
  store i64 %or165.i.i493, ptr %arrayidx166.i.i494, align 8
  %arrayidx171.i.i495 = getelementptr inbounds nuw i8, ptr %q.i53, i32 24
  %533 = load i64, ptr %arrayidx171.i.i495, align 8
  %arrayidx172.i.i496 = getelementptr inbounds nuw i8, ptr %q.i53, i32 56
  %534 = load i64, ptr %arrayidx172.i.i496, align 8
  %and173.i.i497 = and i64 %533, 1085102592571150095
  %and174.i.i498 = shl i64 %534, 4
  %shl175.i.i499 = and i64 %and174.i.i498, -1085102592571150096
  %or176.i.i500 = or disjoint i64 %and173.i.i497, %shl175.i.i499
  %arrayidx177.i.i501 = getelementptr inbounds nuw i8, ptr %q.i53, i32 24
  store i64 %or176.i.i500, ptr %arrayidx177.i.i501, align 8
  %and178.i.i502 = lshr i64 %533, 4
  %shr179.i.i503 = and i64 %and178.i.i502, 1085102592571150095
  %and180.i.i504 = and i64 %534, -1085102592571150096
  %or181.i267.i505 = or disjoint i64 %shr179.i.i503, %and180.i.i504
  %arrayidx182.i.i506 = getelementptr inbounds nuw i8, ptr %q.i53, i32 56
  store i64 %or181.i267.i505, ptr %arrayidx182.i.i506, align 8
  br label %for.body24.i530

while.cond.i.i511.preheader:                      ; preds = %for.body24.i530
  br label %while.body.i.i516

for.body24.i530:                                  ; preds = %shift_rows.exit28.i345, %for.body24.i530
  %i.2.i5081157 = phi i32 [ 0, %shift_rows.exit28.i345 ], [ %inc32.i565, %for.body24.i530 ]
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
  br i1 %exitcond2.i509.not, label %while.cond.i.i511.preheader, label %for.body24.i530, !llvm.loop !118

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
  br i1 %cmp.not.i.i515, label %aes_ecb4x.exit829, label %while.body.i.i516, !llvm.loop !119

aes_ecb4x.exit829:                                ; preds = %while.body.i.i516
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %w.i52)
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %q.i53)
  %add.ptr.i16 = getelementptr inbounds nuw i8, ptr %ivw.i, i32 12
  %542 = load i32, ptr %add.ptr.i16, align 4
  %543 = call i32 @llvm.bswap.i32(i32 %542)
  %add.i8.i = add i32 %543, 4
  %544 = call i32 @llvm.bswap.i32(i32 %add.i8.i)
  store i32 %544, ptr %add.ptr.i16, align 4
  %add.ptr1.i = getelementptr inbounds nuw i8, ptr %ivw.i, i32 28
  %545 = load i32, ptr %add.ptr1.i, align 4
  %546 = call i32 @llvm.bswap.i32(i32 %545)
  %add.i5.i = add i32 %546, 4
  %547 = call i32 @llvm.bswap.i32(i32 %add.i5.i)
  store i32 %547, ptr %add.ptr1.i, align 4
  %add.ptr2.i = getelementptr inbounds nuw i8, ptr %ivw.i, i32 44
  %548 = load i32, ptr %add.ptr2.i, align 4
  %549 = call i32 @llvm.bswap.i32(i32 %548)
  %add.i.i = add i32 %549, 4
  %550 = call i32 @llvm.bswap.i32(i32 %add.i.i)
  store i32 %550, ptr %add.ptr2.i, align 4
  %add.ptr3.i = getelementptr inbounds nuw i8, ptr %ivw.i, i32 60
  %551 = load i32, ptr %add.ptr3.i, align 4
  %552 = call i32 @llvm.bswap.i32(i32 %551)
  %add.i2.i = add i32 %552, 4
  %553 = call i32 @llvm.bswap.i32(i32 %add.i2.i)
  store i32 %553, ptr %add.ptr3.i, align 4
  br label %for.body.i13

for.body.i13:                                     ; preds = %aes_ecb4x.exit829, %for.body.i13
  %i.0.i121161 = phi i32 [ 0, %aes_ecb4x.exit829 ], [ %inc.i14, %for.body.i13 ]
  %arrayidx26.i = getelementptr inbounds nuw [64 x i8], ptr %tmp.i, i32 0, i32 %i.0.i121161
  %554 = load i8, ptr %arrayidx26.i, align 1
  %arrayidx27.i = getelementptr inbounds nuw i8, ptr %out.addr.0.i.lcssa, i32 %i.0.i121161
  store i8 %554, ptr %arrayidx27.i, align 1
  %inc.i14 = add nuw nsw i32 %i.0.i121161, 1
  %exitcond = icmp ne i32 %inc.i14, %outlen.addr.0.i.lcssa
  br i1 %exitcond, label %for.body.i13, label %aes_ctr.exit.loopexit, !llvm.loop !120

aes_ctr.exit.loopexit:                            ; preds = %for.body.i13
  br label %aes_ctr.exit

aes_ctr.exit:                                     ; preds = %aes_ctr.exit.loopexit, %while.end.i
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %ivw.i)
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %tmp.i)
  %555 = load ptr, ptr %ctx, align 4
  call void @free(ptr noundef %555) #8
  ret i32 %outputByteLen
}

; Function Attrs: inlinehint nounwind
define dso_local void @mayo_secure_clear(ptr noundef %mem, i32 noundef %size) local_unnamed_addr #1 {
entry:
  %0 = load volatile ptr, ptr @mayo_secure_clear.memset_func, align 4
  %call = call ptr %0(ptr noundef %mem, i32 noundef 0, i32 noundef %size) #8
  ret void
}

; Function Attrs: inlinehint
define i32 @main() local_unnamed_addr #3 {
entry:
  %p_buf = alloca [128 x i8], align 16
  call void @mayo_memset(ptr %p_buf, i8 0, i32 128)
  %csk_buf = alloca [128 x i8], align 16
  call void @mayo_memset(ptr %csk_buf, i8 0, i32 128)
  %sk = alloca [18603 x i64], align 16
  call void @mayo_memset(ptr %sk, i8 0, i32 148824)
  %0 = call i32 @pqmayo_MAYO_1_ref_mayo_expand_sk(ptr nonnull %p_buf, ptr nonnull %csk_buf, ptr nonnull %sk)
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #4

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.fshl.i64(i64, i64, i64) #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.bswap.i32(i32) #5

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
  br label %for.cond, !llvm.loop !121

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
!73 = distinct !{!73, !6}
!74 = distinct !{!74, !6}
!75 = distinct !{!75, !6}
!76 = distinct !{!76, !6}
!77 = distinct !{!77, !6}
!78 = distinct !{!78, !6}
!79 = distinct !{!79, !6}
!80 = distinct !{!80, !6}
!81 = distinct !{!81, !6}
!82 = distinct !{!82, !6}
!83 = distinct !{!83, !6}
!84 = distinct !{!84, !6}
!85 = distinct !{!85, !6}
!86 = distinct !{!86, !6}
!87 = distinct !{!87, !6}
!88 = distinct !{!88, !6}
!89 = distinct !{!89, !6}
!90 = distinct !{!90, !6}
!91 = distinct !{!91, !6}
!92 = distinct !{!92, !6}
!93 = distinct !{!93, !6}
!94 = distinct !{!94, !6}
!95 = distinct !{!95, !6}
!96 = distinct !{!96, !6}
!97 = distinct !{!97, !6}
!98 = distinct !{!98, !6}
!99 = distinct !{!99, !6}
!100 = distinct !{!100, !6}
!101 = distinct !{!101, !6}
!102 = distinct !{!102, !6}
!103 = distinct !{!103, !6}
!104 = distinct !{!104, !6}
!105 = distinct !{!105, !6}
!106 = distinct !{!106, !6}
!107 = distinct !{!107, !6}
!108 = distinct !{!108, !6}
!109 = distinct !{!109, !6}
!110 = distinct !{!110, !6}
!111 = distinct !{!111, !6}
!112 = distinct !{!112, !6}
!113 = distinct !{!113, !6}
!114 = distinct !{!114, !6}
!115 = distinct !{!115, !6}
!116 = distinct !{!116, !6}
!117 = distinct !{!117, !6}
!118 = distinct !{!118, !6}
!119 = distinct !{!119, !6}
!120 = distinct !{!120, !6}
!121 = distinct !{!121, !6}
