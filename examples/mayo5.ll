; ModuleID = 'composite'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

%struct.sk_t = type { [106713 x i64], [1704 x i8] }

@__const.example_mayo.msg = private unnamed_addr constant <{ i8, [31 x i8] }> <{ i8 14, [31 x i8] zeroinitializer }>, align 1
@.str = private unnamed_addr constant [17 x i8] c"Example with %s\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [7 x i8] c"MAYO_5\00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [17 x i8] c"mayo_keypair -> \00", align 1, !dbg !12
@.str.3 = private unnamed_addr constant [6 x i8] c"FAIL\0A\00", align 1, !dbg !14
@.str.4 = private unnamed_addr constant [4 x i8] c"OK\0A\00", align 1, !dbg !19
@.str.5 = private unnamed_addr constant [19 x i8] c"mayo_expand_sk -> \00", align 1, !dbg !24
@.str.6 = private unnamed_addr constant [19 x i8] c"mayo_expand_pk -> \00", align 1, !dbg !29
@.str.7 = private unnamed_addr constant [14 x i8] c"mayo_sign -> \00", align 1, !dbg !31
@.str.8 = private unnamed_addr constant [39 x i8] c"mayo_open (with correct signature) -> \00", align 1, !dbg !36
@.str.9 = private unnamed_addr constant [41 x i8] c"mayo_verify (with correct signature) -> \00", align 1, !dbg !41
@f_tail = internal unnamed_addr constant [4 x i8] c"\04\00\08\01", align 1, !dbg !46
@pqmayo_MAYO_5_ref_uint32_t_blocker = dso_local local_unnamed_addr global i32 0, align 4, !dbg !82
@pqmayo_MAYO_5_ref_uint64_t_blocker = dso_local global i64 0, align 8, !dbg !97
@pqmayo_MAYO_5_ref_unsigned_char_blocker = dso_local global i8 0, align 1, !dbg !101

; Function Attrs: nounwind
define dso_local range(i32 -1, 1) i32 @main() local_unnamed_addr #0 !dbg !113 {
entry:
  %tmp.i6.i = alloca [9 x i64], align 8
  %tmp.i.i = alloca [9 x i64], align 8
  %smlen.i = alloca i32, align 4
  %msg.i = alloca [32 x i8], align 1
  %msg2.i = alloca [32 x i8], align 1
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %smlen.i), !dbg !116
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %msg.i), !dbg !116
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %msg2.i), !dbg !116
    #dbg_value(ptr null, !151, !DIExpression(), !152)
    #dbg_value(i32 32, !153, !DIExpression(), !152)
    #dbg_value(i32 32, !153, !DIExpression(), !152)
    #dbg_value(i32 996, !154, !DIExpression(), !152)
  store i32 996, ptr %smlen.i, align 4, !dbg !155
  %call.i = call dereferenceable_or_null(5554) ptr @calloc(i32 noundef 5554, i32 noundef 1) #7, !dbg !156
    #dbg_value(ptr %call.i, !157, !DIExpression(), !152)
  %call1.i = call dereferenceable_or_null(40) ptr @calloc(i32 noundef 40, i32 noundef 1) #7, !dbg !158
    #dbg_value(ptr %call1.i, !159, !DIExpression(), !152)
  %call2.i = call dereferenceable_or_null(859320) ptr @calloc(i32 noundef 1, i32 noundef 859320) #7, !dbg !160
    #dbg_value(ptr %call2.i, !161, !DIExpression(), !152)
  %call3.i = call dereferenceable_or_null(855408) ptr @calloc(i32 noundef 1, i32 noundef 855408) #7, !dbg !162
    #dbg_value(ptr %call3.i, !163, !DIExpression(), !152)
    #dbg_value(i32 32, !153, !DIExpression(), !152)
  %call5.i = call dereferenceable_or_null(996) ptr @calloc(i32 noundef 996, i32 noundef 1) #7, !dbg !178
    #dbg_value(ptr %call5.i, !179, !DIExpression(), !152)
    #dbg_declare(ptr %msg.i, !180, !DIExpression(), !184)
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(32) %msg.i, ptr noundef nonnull align 1 dereferenceable(32) @__const.example_mayo.msg, i32 32, i1 false), !dbg !184
    #dbg_declare(ptr %msg2.i, !185, !DIExpression(), !186)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(32) %msg2.i, i8 0, i32 32, i1 false), !dbg !186
  %call6.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str, ptr noundef nonnull @.str.1) #8, !dbg !187
  %call7.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.2) #8, !dbg !188
    #dbg_value(ptr null, !189, !DIExpression(), !221)
    #dbg_value(ptr %call.i, !223, !DIExpression(), !221)
    #dbg_value(ptr %call1.i, !224, !DIExpression(), !221)
    #dbg_value(i32 0, !225, !DIExpression(), !221)
  %call.i.i = call i32 @pqmayo_MAYO_5_ref_mayo_keypair_compact(ptr noundef null, ptr noundef %call.i, ptr noundef %call1.i) #9, !dbg !226
    #dbg_value(i32 %call.i.i, !225, !DIExpression(), !221)
    #dbg_label(!227, !228)
    #dbg_value(i32 %call.i.i, !229, !DIExpression(), !152)
  %cmp.not.i = icmp eq i32 %call.i.i, 0, !dbg !230
  br i1 %cmp.not.i, label %if.else.i, label %if.then.i, !dbg !230

if.then.i:                                        ; preds = %entry
  %call9.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.3) #8, !dbg !232
    #dbg_value(i32 -1, !229, !DIExpression(), !152)
  br label %example_mayo.exit, !dbg !234

if.else.i:                                        ; preds = %entry
  %call10.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.4) #8, !dbg !235
  %call11.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.5) #8, !dbg !237
  %call12.i = call i32 @pqmayo_MAYO_5_ref_mayo_expand_sk(ptr noundef null, ptr noundef %call1.i, ptr noundef %call3.i) #9, !dbg !238
    #dbg_value(i32 %call12.i, !229, !DIExpression(), !152)
  %cmp13.not.i = icmp eq i32 %call12.i, 0, !dbg !239
  br i1 %cmp13.not.i, label %if.else16.i, label %if.then14.i, !dbg !239

if.then14.i:                                      ; preds = %if.else.i
  %call15.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.3) #8, !dbg !241
    #dbg_value(i32 -1, !229, !DIExpression(), !152)
  br label %example_mayo.exit, !dbg !243

if.else16.i:                                      ; preds = %if.else.i
  %call17.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.4) #8, !dbg !244
  %call19.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.6) #8, !dbg !246
    #dbg_value(ptr null, !247, !DIExpression(), !251)
    #dbg_value(ptr %call.i, !253, !DIExpression(), !251)
    #dbg_value(ptr %call2.i, !254, !DIExpression(), !251)
    #dbg_value(ptr null, !255, !DIExpression(), !259)
    #dbg_value(ptr %call2.i, !261, !DIExpression(), !259)
    #dbg_value(ptr %call.i, !262, !DIExpression(), !259)
  %call.i.i.i = call i32 @AES_128_CTR(ptr noundef %call2.i, i32 noundef 841847, ptr noundef %call.i, i32 noundef 16) #8, !dbg !263
  call void @llvm.lifetime.start.p0(i64 72, ptr nonnull %tmp.i.i), !dbg !264
    #dbg_value(ptr %call2.i, !269, !DIExpression(), !270)
    #dbg_value(ptr %call2.i, !271, !DIExpression(), !270)
    #dbg_value(i32 11857, !272, !DIExpression(), !270)
    #dbg_value(i32 142, !273, !DIExpression(), !270)
    #dbg_value(i32 9, !274, !DIExpression(), !270)
    #dbg_value(ptr %call2.i, !276, !DIExpression(), !270)
    #dbg_declare(ptr %tmp.i.i, !277, !DIExpression(), !264)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(72) %tmp.i.i, i8 0, i32 72, i1 false), !dbg !264
    #dbg_value(i32 11857, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !283)
  br label %for.cond.i.i, !dbg !284

for.cond.i.i:                                     ; preds = %for.body.i.i, %if.else16.i
  %i.0.in.i.i = phi i32 [ 11857, %if.else16.i ], [ %i.0.i.i, %for.body.i.i ]
    #dbg_value(i32 %i.0.in.i.i, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !283)
  %cmp.i3.i = icmp ugt i32 %i.0.in.i.i, 0, !dbg !285
  br i1 %cmp.i3.i, label %for.body.i.i, label %unpack_m_vecs.exit.i, !dbg !287

for.body.i.i:                                     ; preds = %for.cond.i.i
  %i.0.i.i = add nsw i32 %i.0.in.i.i, -1, !dbg !288
    #dbg_value(i32 %i.0.i.i, !281, !DIExpression(), !283)
  %mul.i.i = mul nsw i32 %i.0.i.i, 142, !dbg !289
  %div1.i.i14 = lshr exact i32 %mul.i.i, 1, !dbg !291
  %add.ptr.i4.i = getelementptr inbounds nuw i8, ptr %call2.i, i32 %div1.i.i14, !dbg !292
  %call.i5.i = call ptr @memcpy(ptr noundef nonnull %tmp.i.i, ptr noundef %add.ptr.i4.i, i32 noundef 71) #8, !dbg !293
  %mul4.i.i = mul nsw i32 %i.0.i.i, 72, !dbg !294
  %add.ptr5.i.i = getelementptr inbounds nuw i8, ptr %call2.i, i32 %mul4.i.i, !dbg !295
  %call8.i.i = call ptr @memcpy(ptr noundef %add.ptr5.i.i, ptr noundef nonnull %tmp.i.i, i32 noundef 72) #8, !dbg !296
    #dbg_value(i32 %i.0.i.i, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !283)
  br label %for.cond.i.i, !dbg !297, !llvm.loop !298

unpack_m_vecs.exit.i:                             ; preds = %for.cond.i.i
  call void @llvm.lifetime.end.p0(i64 72, ptr nonnull %tmp.i.i), !dbg !301
  %add.ptr.i.i = getelementptr inbounds nuw i8, ptr %call.i, i32 16, !dbg !302
  %add.ptr2.i.i = getelementptr inbounds nuw i8, ptr %call2.i, i32 853704, !dbg !303
  call void @llvm.lifetime.start.p0(i64 72, ptr nonnull %tmp.i6.i), !dbg !304
    #dbg_value(ptr %add.ptr.i.i, !269, !DIExpression(), !306)
    #dbg_value(ptr %add.ptr2.i.i, !271, !DIExpression(), !306)
    #dbg_value(i32 78, !272, !DIExpression(), !306)
    #dbg_value(i32 142, !273, !DIExpression(), !306)
    #dbg_value(i32 9, !274, !DIExpression(), !306)
    #dbg_value(ptr %add.ptr2.i.i, !276, !DIExpression(), !306)
    #dbg_declare(ptr %tmp.i6.i, !277, !DIExpression(), !304)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(72) %tmp.i6.i, i8 0, i32 72, i1 false), !dbg !304
    #dbg_value(i32 78, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !307)
  br label %for.cond.i7.i, !dbg !308

for.cond.i7.i:                                    ; preds = %for.body.i11.i, %unpack_m_vecs.exit.i
  %i.0.in.i8.i = phi i32 [ 78, %unpack_m_vecs.exit.i ], [ %i.0.i9.i, %for.body.i11.i ]
    #dbg_value(i32 %i.0.in.i8.i, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !307)
  %cmp.i10.i = icmp ugt i32 %i.0.in.i8.i, 0, !dbg !309
  br i1 %cmp.i10.i, label %for.body.i11.i, label %unpack_m_vecs.exit20.i, !dbg !310

for.body.i11.i:                                   ; preds = %for.cond.i7.i
  %i.0.i9.i = add nsw i32 %i.0.in.i8.i, -1, !dbg !311
    #dbg_value(i32 %i.0.i9.i, !281, !DIExpression(), !307)
  %mul.i12.i = mul nsw i32 %i.0.i9.i, 142, !dbg !312
  %div1.i13.i23 = lshr exact i32 %mul.i12.i, 1, !dbg !313
  %add.ptr.i14.i = getelementptr inbounds nuw i8, ptr %add.ptr.i.i, i32 %div1.i13.i23, !dbg !314
  %call.i15.i = call ptr @memcpy(ptr noundef nonnull %tmp.i6.i, ptr noundef nonnull %add.ptr.i14.i, i32 noundef 71) #8, !dbg !315
  %mul4.i17.i = mul nsw i32 %i.0.i9.i, 72, !dbg !316
  %add.ptr5.i18.i = getelementptr inbounds nuw i8, ptr %add.ptr2.i.i, i32 %mul4.i17.i, !dbg !317
  %call8.i19.i = call ptr @memcpy(ptr noundef nonnull %add.ptr5.i18.i, ptr noundef nonnull %tmp.i6.i, i32 noundef 72) #8, !dbg !318
    #dbg_value(i32 %i.0.i9.i, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !307)
  br label %for.cond.i7.i, !dbg !319, !llvm.loop !320

unpack_m_vecs.exit20.i:                           ; preds = %for.cond.i7.i
  call void @llvm.lifetime.end.p0(i64 72, ptr nonnull %tmp.i6.i), !dbg !322
    #dbg_value(i32 0, !229, !DIExpression(), !152)
  %call25.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.4) #8, !dbg !323
  %call27.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.7) #8, !dbg !326
    #dbg_value(i32 32, !153, !DIExpression(), !152)
    #dbg_value(ptr %smlen.i, !154, !DIExpression(DW_OP_deref), !152)
  %call28.i = call i32 @pqmayo_MAYO_5_ref_mayo_sign(ptr noundef null, ptr noundef %call5.i, ptr noundef nonnull %smlen.i, ptr noundef nonnull %msg.i, i32 noundef 32, ptr noundef %call1.i) #9, !dbg !327
    #dbg_value(i32 %call28.i, !229, !DIExpression(), !152)
  %cmp29.not.i = icmp eq i32 %call28.i, 0, !dbg !328
  br i1 %cmp29.not.i, label %if.else32.i, label %if.then30.i, !dbg !328

if.then30.i:                                      ; preds = %unpack_m_vecs.exit20.i
  %call31.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.3) #8, !dbg !330
    #dbg_value(i32 -1, !229, !DIExpression(), !152)
  br label %example_mayo.exit, !dbg !332

if.else32.i:                                      ; preds = %unpack_m_vecs.exit20.i
  %call33.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.4) #8, !dbg !333
  %call35.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.8) #8, !dbg !335
  %0 = load i32, ptr %smlen.i, align 4, !dbg !336
    #dbg_value(i32 %0, !154, !DIExpression(), !152)
    #dbg_value(ptr null, !337, !DIExpression(), !342)
    #dbg_value(ptr %msg2.i, !344, !DIExpression(), !342)
    #dbg_value(ptr undef, !345, !DIExpression(), !342)
    #dbg_value(ptr %call5.i, !346, !DIExpression(), !342)
    #dbg_value(i32 %0, !347, !DIExpression(), !342)
    #dbg_value(ptr %call.i, !348, !DIExpression(), !342)
    #dbg_value(i32 964, !349, !DIExpression(), !342)
  %cmp.i.i = icmp ult i32 %0, 964, !dbg !350
  br i1 %cmp.i.i, label %pqmayo_MAYO_5_ref_mayo_open.exit.i, label %if.end.i.i, !dbg !350

if.end.i.i:                                       ; preds = %if.else32.i
  %add.ptr.i1.i = getelementptr inbounds nuw i8, ptr %call5.i, i32 964, !dbg !352
  %sub.i.i = add i32 %0, -964, !dbg !353
  %call.i2.i = call i32 @pqmayo_MAYO_5_ref_mayo_verify(ptr noundef null, ptr noundef nonnull %add.ptr.i1.i, i32 noundef %sub.i.i, ptr noundef %call5.i, ptr noundef %call.i) #9, !dbg !354
    #dbg_value(i32 %call.i2.i, !355, !DIExpression(), !342)
  %cmp1.i.i = icmp eq i32 %call.i2.i, 0, !dbg !356
  br i1 %cmp1.i.i, label %if.then2.i.i, label %pqmayo_MAYO_5_ref_mayo_open.exit.i, !dbg !356

if.then2.i.i:                                     ; preds = %if.end.i.i
  %sub3.i.i = add i32 %0, -964, !dbg !358
  %add.ptr4.i.i = getelementptr inbounds nuw i8, ptr %call5.i, i32 964, !dbg !360
  %call5.i.i = call ptr @memmove(ptr noundef nonnull %msg2.i, ptr noundef nonnull %add.ptr4.i.i, i32 noundef %sub3.i.i) #8, !dbg !361
  br label %pqmayo_MAYO_5_ref_mayo_open.exit.i, !dbg !362

pqmayo_MAYO_5_ref_mayo_open.exit.i:               ; preds = %if.then2.i.i, %if.end.i.i, %if.else32.i
  %msglen.i.0 = phi i32 [ 32, %if.else32.i ], [ %sub3.i.i, %if.then2.i.i ], [ 32, %if.end.i.i ], !dbg !152
  %cmp38.not.i = phi i1 [ false, %if.else32.i ], [ true, %if.then2.i.i ], [ false, %if.end.i.i ], !dbg !342
    #dbg_value(i32 poison, !229, !DIExpression(), !152)
  br i1 %cmp38.not.i, label %lor.lhs.false.i, label %if.then42.i, !dbg !363

lor.lhs.false.i:                                  ; preds = %pqmayo_MAYO_5_ref_mayo_open.exit.i
    #dbg_value(i32 %msglen.i.0, !153, !DIExpression(), !152)
  %call41.i = call i32 @memcmp(ptr noundef nonnull %msg.i, ptr noundef nonnull %msg2.i, i32 noundef %msglen.i.0) #8, !dbg !365
  %tobool.not.i = icmp eq i32 %call41.i, 0, !dbg !365
  br i1 %tobool.not.i, label %if.else44.i, label %if.then42.i, !dbg !363

if.then42.i:                                      ; preds = %lor.lhs.false.i, %pqmayo_MAYO_5_ref_mayo_open.exit.i
  %call43.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.3) #8, !dbg !366
    #dbg_value(i32 -1, !229, !DIExpression(), !152)
  br label %example_mayo.exit, !dbg !368

if.else44.i:                                      ; preds = %lor.lhs.false.i
    #dbg_value(i32 0, !229, !DIExpression(), !152)
  %call45.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.4) #8, !dbg !369
  %call47.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.9) #8, !dbg !371
    #dbg_value(i32 %msglen.i.0, !153, !DIExpression(), !152)
  %call49.i = call i32 @pqmayo_MAYO_5_ref_mayo_verify(ptr noundef null, ptr noundef nonnull %msg.i, i32 noundef %msglen.i.0, ptr noundef %call5.i, ptr noundef %call.i) #9, !dbg !372
    #dbg_value(i32 %call49.i, !229, !DIExpression(), !152)
  %cmp50.not.i = icmp eq i32 %call49.i, 0, !dbg !373
  br i1 %cmp50.not.i, label %if.else53.i, label %if.then51.i, !dbg !373

if.then51.i:                                      ; preds = %if.else44.i
  %call52.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.3) #8, !dbg !375
    #dbg_value(i32 -1, !229, !DIExpression(), !152)
  br label %example_mayo.exit, !dbg !377

if.else53.i:                                      ; preds = %if.else44.i
    #dbg_value(i32 0, !229, !DIExpression(), !152)
  %call54.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.4) #8, !dbg !378
  br label %example_mayo.exit, !dbg !380

example_mayo.exit:                                ; preds = %if.then.i, %if.then14.i, %if.then30.i, %if.then42.i, %if.then51.i, %if.else53.i
  %res.0.i = phi i32 [ -1, %if.then.i ], [ -1, %if.then14.i ], [ -1, %if.then30.i ], [ -1, %if.then42.i ], [ -1, %if.then51.i ], [ 0, %if.else53.i ], !dbg !152
    #dbg_value(i32 %res.0.i, !229, !DIExpression(), !152)
    #dbg_label(!381, !382)
  call void @free(ptr noundef %call.i) #8, !dbg !383
  call void @free(ptr noundef %call2.i) #8, !dbg !384
  call void @mayo_secure_free(ptr noundef %call1.i, i32 noundef 40) #8, !dbg !385
  call void @mayo_secure_free(ptr noundef %call3.i, i32 noundef 855408) #8, !dbg !386
  call void @free(ptr noundef %call5.i) #8, !dbg !387
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %smlen.i), !dbg !388
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %msg.i), !dbg !388
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %msg2.i), !dbg !388
  ret i32 %res.0.i, !dbg !389
}

; Function Attrs: allocsize(0,1)
declare dso_local ptr @calloc(i32 noundef, i32 noundef) local_unnamed_addr #1

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i32(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i32, i1 immarg) #2

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i32(ptr nocapture writeonly, i8, i32, i1 immarg) #3

declare dso_local i32 @printf(ptr noundef, ...) local_unnamed_addr #4

declare dso_local i32 @memcmp(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #4

declare dso_local void @free(ptr noundef) local_unnamed_addr #4

declare dso_local void @mayo_secure_free(ptr noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_5_ref_mayo_keypair(ptr noundef %p, ptr noundef %pk, ptr noundef %sk) local_unnamed_addr #0 !dbg !190 {
entry:
    #dbg_value(ptr %p, !189, !DIExpression(), !390)
    #dbg_value(ptr %pk, !223, !DIExpression(), !390)
    #dbg_value(ptr %sk, !224, !DIExpression(), !390)
    #dbg_value(i32 0, !225, !DIExpression(), !390)
  %call = call i32 @pqmayo_MAYO_5_ref_mayo_keypair_compact(ptr noundef %p, ptr noundef %pk, ptr noundef %sk) #9, !dbg !391
    #dbg_value(i32 %call, !225, !DIExpression(), !390)
    #dbg_label(!227, !392)
  ret i32 %call, !dbg !393
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_5_ref_mayo_keypair_compact(ptr noundef %p, ptr noundef %cpk, ptr noundef %csk) local_unnamed_addr #0 !dbg !394 {
entry:
  %tmp.i = alloca [9 x i64], align 8
  %S = alloca [868 x i8], align 1
  %P = alloca [106713 x i64], align 8
  %P3 = alloca [1296 x i64], align 8
  %O = alloca [1704 x i8], align 1
  %P3_upper = alloca [702 x i64], align 8
    #dbg_value(ptr %p, !395, !DIExpression(), !396)
    #dbg_value(ptr %cpk, !397, !DIExpression(), !396)
    #dbg_value(ptr %csk, !398, !DIExpression(), !396)
    #dbg_value(i32 0, !399, !DIExpression(), !396)
    #dbg_value(ptr %csk, !400, !DIExpression(), !396)
    #dbg_declare(ptr %S, !401, !DIExpression(), !405)
    #dbg_declare(ptr %P, !406, !DIExpression(), !407)
    #dbg_declare(ptr %P3, !408, !DIExpression(), !412)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(10368) %P3, i8 0, i32 10368, i1 false), !dbg !412
    #dbg_declare(ptr %O, !413, !DIExpression(), !415)
    #dbg_value(i32 9, !416, !DIExpression(), !396)
    #dbg_value(i32 142, !417, !DIExpression(), !396)
    #dbg_value(i32 142, !418, !DIExpression(), !396)
    #dbg_value(i32 12, !419, !DIExpression(), !396)
    #dbg_value(i32 852, !420, !DIExpression(), !396)
    #dbg_value(i32 91377, !421, !DIExpression(), !396)
    #dbg_value(i32 702, !422, !DIExpression(), !396)
    #dbg_value(i32 16, !423, !DIExpression(), !396)
    #dbg_value(i32 40, !424, !DIExpression(), !396)
    #dbg_value(ptr %P, !425, !DIExpression(), !396)
  %add.ptr = getelementptr inbounds nuw i8, ptr %P, i32 731016, !dbg !426
    #dbg_value(ptr %add.ptr, !427, !DIExpression(), !396)
  %call = call i32 @randombytes(ptr noundef %csk, i32 noundef 40) #8, !dbg !428
  %cmp.not = icmp eq i32 %call, 0, !dbg !430
  br i1 %cmp.not, label %if.end, label %err, !dbg !430

if.end:                                           ; preds = %entry
    #dbg_value(ptr %P, !425, !DIExpression(), !396)
  %call3 = call i32 @shake256(ptr noundef nonnull %S, i32 noundef 868, ptr noundef %csk, i32 noundef 40) #8, !dbg !431
    #dbg_value(ptr %S, !432, !DIExpression(), !396)
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %S, i32 16, !dbg !433
    #dbg_value(ptr %add.ptr6, !434, !DIExpression(), !438)
    #dbg_value(ptr %O, !440, !DIExpression(), !438)
    #dbg_value(i32 1704, !441, !DIExpression(), !438)
    #dbg_value(i32 0, !442, !DIExpression(), !438)
  br label %for.cond.i11, !dbg !443

for.cond.i11:                                     ; preds = %for.body.i14, %if.end
  %mdec.addr.0.i = phi ptr [ %O, %if.end ], [ %incdec.ptr5.i, %for.body.i14 ]
  %i.0.i12 = phi i32 [ 0, %if.end ], [ %inc.i15, %for.body.i14 ], !dbg !445
    #dbg_value(i32 %i.0.i12, !442, !DIExpression(), !438)
    #dbg_value(ptr %mdec.addr.0.i, !440, !DIExpression(), !438)
  %exitcond = icmp ne i32 %i.0.i12, 852, !dbg !446
  br i1 %exitcond, label %for.body.i14, label %decode.exit, !dbg !448

for.body.i14:                                     ; preds = %for.cond.i11
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %add.ptr6, i32 %i.0.i12, !dbg !449
  %0 = load i8, ptr %arrayidx.i, align 1, !dbg !449
  %1 = and i8 %0, 15, !dbg !451
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i, i32 1, !dbg !452
    #dbg_value(ptr %incdec.ptr.i, !440, !DIExpression(), !438)
  store i8 %1, ptr %mdec.addr.0.i, align 1, !dbg !453
  %2 = lshr i8 %0, 4, !dbg !454
    #dbg_value(ptr %incdec.ptr.i, !440, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !438)
  store i8 %2, ptr %incdec.ptr.i, align 1, !dbg !455
  %incdec.ptr5.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i, i32 2, !dbg !456
    #dbg_value(ptr %incdec.ptr5.i, !440, !DIExpression(), !438)
  %inc.i15 = add nuw nsw i32 %i.0.i12, 1, !dbg !457
    #dbg_value(i32 %inc.i15, !442, !DIExpression(), !438)
  br label %for.cond.i11, !dbg !458, !llvm.loop !459

decode.exit:                                      ; preds = %for.cond.i11
    #dbg_value(ptr %p, !255, !DIExpression(), !461)
    #dbg_value(ptr %P, !261, !DIExpression(), !461)
    #dbg_value(ptr %S, !262, !DIExpression(), !461)
  %call.i = call i32 @AES_128_CTR(ptr noundef nonnull %P, i32 noundef 841847, ptr noundef nonnull %S, i32 noundef 16) #8, !dbg !463
  call void @llvm.lifetime.start.p0(i64 72, ptr nonnull %tmp.i), !dbg !464
    #dbg_value(ptr %P, !269, !DIExpression(), !466)
    #dbg_value(ptr %P, !271, !DIExpression(), !466)
    #dbg_value(i32 11857, !272, !DIExpression(), !466)
    #dbg_value(i32 142, !273, !DIExpression(), !466)
    #dbg_value(i32 9, !274, !DIExpression(), !466)
    #dbg_value(ptr %P, !276, !DIExpression(), !466)
    #dbg_declare(ptr %tmp.i, !277, !DIExpression(), !464)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(72) %tmp.i, i8 0, i32 72, i1 false), !dbg !464
    #dbg_value(i32 11857, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !467)
  br label %for.cond.i2, !dbg !468

for.cond.i2:                                      ; preds = %for.body.i5, %decode.exit
  %i.0.in.i = phi i32 [ 11857, %decode.exit ], [ %i.0.i3, %for.body.i5 ]
    #dbg_value(i32 %i.0.in.i, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !467)
  %cmp.i4 = icmp ugt i32 %i.0.in.i, 0, !dbg !469
  br i1 %cmp.i4, label %for.body.i5, label %unpack_m_vecs.exit, !dbg !470

for.body.i5:                                      ; preds = %for.cond.i2
  %i.0.i3 = add nsw i32 %i.0.in.i, -1, !dbg !471
    #dbg_value(i32 %i.0.i3, !281, !DIExpression(), !467)
  %mul.i6 = mul nsw i32 %i.0.i3, 142, !dbg !472
  %div1.i74344 = lshr exact i32 %mul.i6, 1, !dbg !473
  %add.ptr.i8 = getelementptr inbounds nuw i8, ptr %P, i32 %div1.i74344, !dbg !474
  %call.i9 = call ptr @memcpy(ptr noundef nonnull %tmp.i, ptr noundef nonnull %add.ptr.i8, i32 noundef 71) #8, !dbg !475
  %mul4.i = mul nsw i32 %i.0.i3, 72, !dbg !476
  %add.ptr5.i = getelementptr inbounds nuw i8, ptr %P, i32 %mul4.i, !dbg !477
  %call8.i = call ptr @memcpy(ptr noundef nonnull %add.ptr5.i, ptr noundef nonnull %tmp.i, i32 noundef 72) #8, !dbg !478
    #dbg_value(i32 %i.0.i3, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !467)
  br label %for.cond.i2, !dbg !479, !llvm.loop !480

unpack_m_vecs.exit:                               ; preds = %for.cond.i2
  call void @llvm.lifetime.end.p0(i64 72, ptr nonnull %tmp.i), !dbg !482
    #dbg_value(ptr %p, !483, !DIExpression(), !489)
    #dbg_value(ptr %P, !491, !DIExpression(), !489)
    #dbg_value(ptr %add.ptr, !492, !DIExpression(), !489)
    #dbg_value(ptr %O, !493, !DIExpression(), !489)
    #dbg_value(ptr %P3, !494, !DIExpression(), !489)
    #dbg_value(i32 9, !495, !DIExpression(), !489)
    #dbg_value(i32 142, !496, !DIExpression(), !489)
    #dbg_value(i32 12, !497, !DIExpression(), !489)
    #dbg_value(ptr %p, !498, !DIExpression(), !502)
    #dbg_value(ptr %P, !504, !DIExpression(), !502)
    #dbg_value(ptr %O, !505, !DIExpression(), !502)
    #dbg_value(ptr %add.ptr, !506, !DIExpression(), !502)
    #dbg_value(i32 9, !507, !DIExpression(), !511)
    #dbg_value(ptr %P, !513, !DIExpression(), !511)
    #dbg_value(ptr %O, !514, !DIExpression(), !511)
    #dbg_value(ptr %add.ptr, !515, !DIExpression(), !511)
    #dbg_value(i32 142, !516, !DIExpression(), !511)
    #dbg_value(i32 142, !517, !DIExpression(), !511)
    #dbg_value(i32 12, !518, !DIExpression(), !511)
    #dbg_value(i32 1, !519, !DIExpression(), !511)
    #dbg_value(i32 0, !520, !DIExpression(), !511)
    #dbg_value(i32 0, !521, !DIExpression(), !523)
  br label %for.cond.i22, !dbg !524

for.cond.i22:                                     ; preds = %for.inc17.i30, %unpack_m_vecs.exit
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc17.i30 ], [ 142, %unpack_m_vecs.exit ], !dbg !525
  %bs_mat_entries_used.0.i = phi i32 [ 0, %unpack_m_vecs.exit ], [ %bs_mat_entries_used.1.i.lcssa, %for.inc17.i30 ], !dbg !525
  %r.0.i23 = phi i32 [ 0, %unpack_m_vecs.exit ], [ %inc18.i31, %for.inc17.i30 ], !dbg !526
    #dbg_value(i32 %r.0.i23, !521, !DIExpression(), !523)
    #dbg_value(i32 %bs_mat_entries_used.0.i, !520, !DIExpression(), !511)
  %exitcond47 = icmp ne i32 %r.0.i23, 142, !dbg !527
  br i1 %exitcond47, label %for.cond1.i27.preheader, label %for.cond.i16.preheader, !dbg !529

for.cond1.i27.preheader:                          ; preds = %for.cond.i22
  %3 = add i32 %bs_mat_entries_used.0.i, %indvars.iv, !dbg !530
  br label %for.cond1.i27, !dbg !530

for.cond.i16.preheader:                           ; preds = %for.cond.i22
  br label %for.cond.i16, !dbg !533

for.cond1.i27:                                    ; preds = %for.cond1.i27.preheader, %for.inc15.i35
  %bs_mat_entries_used.1.i = phi i32 [ %add14.i36, %for.inc15.i35 ], [ %bs_mat_entries_used.0.i, %for.cond1.i27.preheader ], !dbg !511
  %c.0.i28 = phi i32 [ %inc.i37, %for.inc15.i35 ], [ %r.0.i23, %for.cond1.i27.preheader ], !dbg !539
    #dbg_value(i32 %c.0.i28, !540, !DIExpression(), !541)
    #dbg_value(i32 %bs_mat_entries_used.1.i, !520, !DIExpression(), !511)
  %exitcond46 = icmp ne i32 %bs_mat_entries_used.1.i, %3, !dbg !542
  br i1 %exitcond46, label %for.cond4.i32.preheader, label %for.inc17.i30, !dbg !530

for.cond4.i32.preheader:                          ; preds = %for.cond1.i27
  br label %for.cond4.i32, !dbg !544

for.cond4.i32:                                    ; preds = %for.cond4.i32.preheader, %for.body6.i38
  %k.0.i33 = phi i32 [ %add13.i, %for.body6.i38 ], [ 0, %for.cond4.i32.preheader ], !dbg !547
    #dbg_value(i32 %k.0.i33, !548, !DIExpression(), !549)
  %exitcond45 = icmp ne i32 %k.0.i33, 12, !dbg !550
  br i1 %exitcond45, label %for.body6.i38, label %for.inc15.i35, !dbg !544

for.body6.i38:                                    ; preds = %for.cond4.i32
  %add.ptr.i40.idx = mul nsw i32 %bs_mat_entries_used.1.i, 72, !dbg !552
  %add.ptr.i40 = getelementptr inbounds i8, ptr %P, i32 %add.ptr.i40.idx, !dbg !552
  %mul8.i41 = mul nuw nsw i32 %c.0.i28, 12, !dbg !554
  %4 = getelementptr i8, ptr %O, i32 %mul8.i41, !dbg !555
  %arrayidx.i42 = getelementptr i8, ptr %4, i32 %k.0.i33, !dbg !555
  %5 = load i8, ptr %arrayidx.i42, align 1, !dbg !555
  %mul9.i = mul nuw nsw i32 %r.0.i23, 12, !dbg !556
  %add10.i = add nuw nsw i32 %mul9.i, %k.0.i33, !dbg !557
  %add.ptr12.i.idx = mul nuw nsw i32 %add10.i, 72, !dbg !558
  %add.ptr12.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %add.ptr12.i.idx, !dbg !558
  call fastcc void @m_vec_mul_add(i32 noundef 9, ptr noundef nonnull %add.ptr.i40, i8 noundef zeroext %5, ptr noundef nonnull %add.ptr12.i) #9, !dbg !559
  %add13.i = add nuw nsw i32 %k.0.i33, 1, !dbg !560
    #dbg_value(i32 %add13.i, !548, !DIExpression(), !549)
  br label %for.cond4.i32, !dbg !561, !llvm.loop !562

for.inc15.i35:                                    ; preds = %for.cond4.i32
    #dbg_value(i32 %bs_mat_entries_used.1.i, !520, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !511)
  %add14.i36 = add i32 %bs_mat_entries_used.1.i, 1, !dbg !564
    #dbg_value(i32 %add14.i36, !520, !DIExpression(), !511)
  %inc.i37 = add nuw nsw i32 %c.0.i28, 1, !dbg !565
    #dbg_value(i32 %inc.i37, !540, !DIExpression(), !541)
  br label %for.cond1.i27, !dbg !566, !llvm.loop !567

for.inc17.i30:                                    ; preds = %for.cond1.i27
  %bs_mat_entries_used.1.i.lcssa = phi i32 [ %bs_mat_entries_used.1.i, %for.cond1.i27 ], !dbg !511
  %inc18.i31 = add nuw nsw i32 %r.0.i23, 1, !dbg !569
    #dbg_value(i32 %inc18.i31, !521, !DIExpression(), !523)
  %indvars.iv.next = add nsw i32 %indvars.iv, -1, !dbg !570
  br label %for.cond.i22, !dbg !570, !llvm.loop !571

for.cond.i16:                                     ; preds = %for.cond.i16.preheader, %for.inc17.i
  %r.0.i = phi i32 [ %inc18.i, %for.inc17.i ], [ 0, %for.cond.i16.preheader ], !dbg !573
    #dbg_value(i32 %r.0.i, !574, !DIExpression(), !575)
  %exitcond50 = icmp ne i32 %r.0.i, 12, !dbg !576
  br i1 %exitcond50, label %for.cond1.i.preheader, label %mul_add_mat_trans_x_m_mat.exit, !dbg !533

for.cond1.i.preheader:                            ; preds = %for.cond.i16
  br label %for.cond1.i, !dbg !578

for.cond1.i:                                      ; preds = %for.cond1.i.preheader, %for.inc15.i
  %c.0.i = phi i32 [ %inc.i18, %for.inc15.i ], [ 0, %for.cond1.i.preheader ], !dbg !581
    #dbg_value(i32 %c.0.i, !582, !DIExpression(), !583)
  %exitcond49 = icmp ne i32 %c.0.i, 142, !dbg !584
  br i1 %exitcond49, label %for.cond4.i.preheader, label %for.inc17.i, !dbg !578

for.cond4.i.preheader:                            ; preds = %for.cond1.i
  br label %for.cond4.i, !dbg !586

for.cond4.i:                                      ; preds = %for.cond4.i.preheader, %for.body6.i
  %k.0.i = phi i32 [ %add14.i, %for.body6.i ], [ 0, %for.cond4.i.preheader ], !dbg !589
    #dbg_value(i32 %k.0.i, !590, !DIExpression(), !591)
  %exitcond48 = icmp ne i32 %k.0.i, 12, !dbg !592
  br i1 %exitcond48, label %for.body6.i, label %for.inc15.i, !dbg !586

for.body6.i:                                      ; preds = %for.cond4.i
  %mul.i19 = mul nuw nsw i32 %c.0.i, 12, !dbg !594
  %add.i = add nuw nsw i32 %mul.i19, %k.0.i, !dbg !596
  %add.ptr.i20.idx = mul nuw nsw i32 %add.i, 72, !dbg !597
  %add.ptr.i20 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %add.ptr.i20.idx, !dbg !597
  %mul8.i = mul nuw nsw i32 %c.0.i, 12, !dbg !598
  %6 = getelementptr i8, ptr %O, i32 %mul8.i, !dbg !599
  %arrayidx.i21 = getelementptr i8, ptr %6, i32 %r.0.i, !dbg !599
  %7 = load i8, ptr %arrayidx.i21, align 1, !dbg !599
  %mul10.i = mul nuw nsw i32 %r.0.i, 12, !dbg !600
  %add11.i = add nuw nsw i32 %mul10.i, %k.0.i, !dbg !601
  %add.ptr13.i.idx = mul nuw nsw i32 %add11.i, 72, !dbg !602
  %add.ptr13.i = getelementptr inbounds nuw i8, ptr %P3, i32 %add.ptr13.i.idx, !dbg !602
  call fastcc void @m_vec_mul_add(i32 noundef 9, ptr noundef nonnull %add.ptr.i20, i8 noundef zeroext %7, ptr noundef nonnull %add.ptr13.i) #9, !dbg !603
  %add14.i = add nuw nsw i32 %k.0.i, 1, !dbg !604
    #dbg_value(i32 %add14.i, !590, !DIExpression(), !591)
  br label %for.cond4.i, !dbg !605, !llvm.loop !606

for.inc15.i:                                      ; preds = %for.cond4.i
  %inc.i18 = add nuw nsw i32 %c.0.i, 1, !dbg !608
    #dbg_value(i32 %inc.i18, !582, !DIExpression(), !583)
  br label %for.cond1.i, !dbg !609, !llvm.loop !610

for.inc17.i:                                      ; preds = %for.cond1.i
  %inc18.i = add nuw nsw i32 %r.0.i, 1, !dbg !612
    #dbg_value(i32 %inc18.i, !574, !DIExpression(), !575)
  br label %for.cond.i16, !dbg !613, !llvm.loop !614

mul_add_mat_trans_x_m_mat.exit:                   ; preds = %for.cond.i16
  %call11 = call ptr @memcpy(ptr noundef %cpk, ptr noundef nonnull %S, i32 noundef 16) #8, !dbg !616
    #dbg_declare(ptr %P3_upper, !617, !DIExpression(), !621)
  call void @pqmayo_MAYO_5_ref_m_upper(ptr noundef %p, ptr noundef nonnull %P3, ptr noundef nonnull %P3_upper, i32 noundef 12) #9, !dbg !622
  %add.ptr15 = getelementptr inbounds nuw i8, ptr %cpk, i32 16, !dbg !623
    #dbg_value(ptr %P3_upper, !624, !DIExpression(), !628)
    #dbg_value(ptr %add.ptr15, !630, !DIExpression(), !628)
    #dbg_value(i32 78, !631, !DIExpression(), !628)
    #dbg_value(i32 142, !632, !DIExpression(), !628)
    #dbg_value(i32 9, !633, !DIExpression(), !628)
    #dbg_value(ptr %P3_upper, !634, !DIExpression(), !628)
    #dbg_value(i32 0, !635, !DIExpression(), !637)
  br label %for.cond.i, !dbg !638

for.cond.i:                                       ; preds = %for.body.i, %mul_add_mat_trans_x_m_mat.exit
  %i.0.i = phi i32 [ 0, %mul_add_mat_trans_x_m_mat.exit ], [ %inc.i, %for.body.i ], !dbg !639
    #dbg_value(i32 %i.0.i, !635, !DIExpression(), !637)
  %exitcond51 = icmp ne i32 %i.0.i, 78, !dbg !640
  br i1 %exitcond51, label %for.body.i, label %err.loopexit, !dbg !642

for.body.i:                                       ; preds = %for.cond.i
  %div1.i = mul nuw nsw i32 %i.0.i, 71, !dbg !643
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %add.ptr15, i32 %div1.i, !dbg !645
  %mul3.i = mul nuw nsw i32 %i.0.i, 72, !dbg !646
  %add.ptr4.i = getelementptr inbounds nuw i8, ptr %P3_upper, i32 %mul3.i, !dbg !647
  %call.i1 = call ptr @memmove(ptr noundef nonnull %add.ptr.i, ptr noundef nonnull %add.ptr4.i, i32 noundef 71) #8, !dbg !648
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !649
    #dbg_value(i32 %inc.i, !635, !DIExpression(), !637)
  br label %for.cond.i, !dbg !650, !llvm.loop !651

err.loopexit:                                     ; preds = %for.cond.i
  br label %err, !dbg !653

err:                                              ; preds = %err.loopexit, %entry
  %ret.0 = phi i32 [ 1, %entry ], [ 0, %err.loopexit ], !dbg !396
    #dbg_value(i32 %ret.0, !399, !DIExpression(), !396)
    #dbg_label(!654, !655)
  call void @mayo_secure_clear(ptr noundef nonnull %O, i32 noundef 1704) #8, !dbg !653
  call void @mayo_secure_clear(ptr noundef nonnull %add.ptr, i32 noundef 122688) #8, !dbg !656
  call void @mayo_secure_clear(ptr noundef nonnull %P3, i32 noundef 10368) #8, !dbg !657
  ret i32 %ret.0, !dbg !658
}

declare dso_local i32 @randombytes(ptr noundef, i32 noundef) local_unnamed_addr #4

declare dso_local i32 @shake256(ptr noundef, i32 noundef, ptr noundef, i32 noundef) local_unnamed_addr #4

declare dso_local ptr @memcpy(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #4

declare dso_local void @mayo_secure_clear(ptr noundef, i32 noundef) local_unnamed_addr #4

declare dso_local ptr @memmove(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: nounwind
define internal fastcc void @m_vec_mul_add(i32 noundef %m_vec_limbs, ptr noundef %in, i8 noundef zeroext %a, ptr noundef %acc) unnamed_addr #0 !dbg !659 {
entry:
    #dbg_value(i32 %m_vec_limbs, !663, !DIExpression(), !664)
    #dbg_value(ptr %in, !665, !DIExpression(), !664)
    #dbg_value(i8 %a, !666, !DIExpression(), !664)
    #dbg_value(ptr %acc, !667, !DIExpression(), !664)
    #dbg_value(i8 %a, !668, !DIExpression(), !673)
  %conv.i = zext i8 %a to i32, !dbg !675
  %mul.i = mul i32 %conv.i, 134480385, !dbg !676
    #dbg_value(i32 %mul.i, !677, !DIExpression(), !673)
    #dbg_value(i32 -252645136, !678, !DIExpression(), !673)
  %and.i = and i32 %mul.i, -252645136, !dbg !679
    #dbg_value(i32 %and.i, !680, !DIExpression(), !673)
  %shr.i = lshr exact i32 %and.i, 4, !dbg !681
  %shr1.i = lshr exact i32 %and.i, 3, !dbg !682
  %0 = xor i32 %shr.i, %shr1.i, !dbg !683
  %xor2.i = xor i32 %0, %mul.i, !dbg !683
    #dbg_value(i32 %xor2.i, !684, !DIExpression(), !664)
    #dbg_value(i64 1229782938247303441, !685, !DIExpression(), !664)
    #dbg_value(i32 0, !686, !DIExpression(), !688)
  br label %for.cond, !dbg !689

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !690
    #dbg_value(i32 %i.0, !686, !DIExpression(), !688)
  %exitcond = icmp ne i32 %i.0, 9, !dbg !691
  br i1 %exitcond, label %for.body, label %for.end, !dbg !693

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !694
  %1 = load i64, ptr %arrayidx, align 8, !dbg !694
  %and = and i64 %1, 1229782938247303441, !dbg !696
  %and1 = and i32 %xor2.i, 255, !dbg !697
  %conv = zext nneg i32 %and1 to i64, !dbg !698
  %mul = mul i64 %and, %conv, !dbg !699
  %shr = lshr i64 %1, 1, !dbg !700
  %and3 = and i64 %shr, 1229782938247303441, !dbg !701
  %shr4 = lshr i32 %xor2.i, 8, !dbg !702
  %and5 = and i32 %shr4, 15, !dbg !703
  %conv6 = zext nneg i32 %and5 to i64, !dbg !704
  %mul7 = mul nuw i64 %and3, %conv6, !dbg !705
  %xor = xor i64 %mul, %mul7, !dbg !706
  %arrayidx8 = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !707
  %2 = load i64, ptr %arrayidx8, align 8, !dbg !707
  %shr9 = lshr i64 %2, 2, !dbg !708
  %and10 = and i64 %shr9, 1229782938247303441, !dbg !709
  %shr11 = lshr i32 %xor2.i, 16, !dbg !710
  %and12 = and i32 %shr11, 15, !dbg !711
  %conv13 = zext nneg i32 %and12 to i64, !dbg !712
  %mul14 = mul nuw i64 %and10, %conv13, !dbg !713
  %xor15 = xor i64 %xor, %mul14, !dbg !714
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !715
  %3 = load i64, ptr %arrayidx16, align 8, !dbg !715
  %shr17 = lshr i64 %3, 3, !dbg !716
  %and18 = and i64 %shr17, 1229782938247303441, !dbg !717
  %shr19 = lshr i32 %xor2.i, 24, !dbg !718
  %and20 = and i32 %shr19, 15, !dbg !719
  %conv21 = zext nneg i32 %and20 to i64, !dbg !720
  %mul22 = mul nuw i64 %and18, %conv21, !dbg !721
  %xor23 = xor i64 %xor15, %mul22, !dbg !722
  %arrayidx24 = getelementptr inbounds nuw i64, ptr %acc, i32 %i.0, !dbg !723
  %4 = load i64, ptr %arrayidx24, align 8, !dbg !724
  %xor25 = xor i64 %4, %xor23, !dbg !724
  store i64 %xor25, ptr %arrayidx24, align 8, !dbg !724
  %inc = add nuw nsw i32 %i.0, 1, !dbg !725
    #dbg_value(i32 %inc, !686, !DIExpression(), !688)
  br label %for.cond, !dbg !726, !llvm.loop !727

for.end:                                          ; preds = %for.cond
  ret void, !dbg !729
}

declare dso_local i32 @AES_128_CTR(ptr noundef, i32 noundef, ptr noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: nounwind
define dso_local i32 @pqmayo_MAYO_5_ref_mayo_expand_sk(ptr noundef %p, ptr noundef %csk, ptr noundef %sk) local_unnamed_addr #0 !dbg !730 {
entry:
  %tmp.i = alloca [9 x i64], align 8
  %S = alloca [868 x i8], align 1
    #dbg_value(ptr %p, !739, !DIExpression(), !740)
    #dbg_value(ptr %csk, !741, !DIExpression(), !740)
    #dbg_value(ptr %sk, !742, !DIExpression(), !740)
    #dbg_value(i32 0, !743, !DIExpression(), !740)
    #dbg_declare(ptr %S, !744, !DIExpression(), !745)
    #dbg_value(ptr %sk, !746, !DIExpression(), !740)
  %O2 = getelementptr inbounds nuw i8, ptr %sk, i32 853704, !dbg !747
    #dbg_value(ptr %O2, !748, !DIExpression(), !740)
    #dbg_value(i32 12, !749, !DIExpression(), !740)
    #dbg_value(i32 142, !750, !DIExpression(), !740)
    #dbg_value(i32 852, !751, !DIExpression(), !740)
    #dbg_value(i32 16, !752, !DIExpression(), !740)
    #dbg_value(i32 40, !753, !DIExpression(), !740)
    #dbg_value(ptr %csk, !754, !DIExpression(), !740)
    #dbg_value(ptr %S, !755, !DIExpression(), !740)
  %call = call i32 @shake256(ptr noundef nonnull %S, i32 noundef 868, ptr noundef %csk, i32 noundef 40) #8, !dbg !756
  %add.ptr = getelementptr inbounds nuw i8, ptr %S, i32 16, !dbg !757
    #dbg_value(ptr %add.ptr, !434, !DIExpression(), !758)
    #dbg_value(ptr %O2, !440, !DIExpression(), !758)
    #dbg_value(i32 1704, !441, !DIExpression(), !758)
    #dbg_value(i32 0, !442, !DIExpression(), !758)
  br label %for.cond.i2, !dbg !760

for.cond.i2:                                      ; preds = %for.body.i5, %entry
  %mdec.addr.0.i = phi ptr [ %O2, %entry ], [ %incdec.ptr5.i, %for.body.i5 ]
  %i.0.i3 = phi i32 [ 0, %entry ], [ %inc.i, %for.body.i5 ], !dbg !761
    #dbg_value(i32 %i.0.i3, !442, !DIExpression(), !758)
    #dbg_value(ptr %mdec.addr.0.i, !440, !DIExpression(), !758)
  %exitcond = icmp ne i32 %i.0.i3, 852, !dbg !762
  br i1 %exitcond, label %for.body.i5, label %decode.exit, !dbg !763

for.body.i5:                                      ; preds = %for.cond.i2
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %i.0.i3, !dbg !764
  %0 = load i8, ptr %arrayidx.i, align 1, !dbg !764
  %1 = and i8 %0, 15, !dbg !765
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i, i32 1, !dbg !766
    #dbg_value(ptr %incdec.ptr.i, !440, !DIExpression(), !758)
  store i8 %1, ptr %mdec.addr.0.i, align 1, !dbg !767
  %2 = lshr i8 %0, 4, !dbg !768
    #dbg_value(ptr %incdec.ptr.i, !440, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !758)
  store i8 %2, ptr %incdec.ptr.i, align 1, !dbg !769
  %incdec.ptr5.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i, i32 2, !dbg !770
    #dbg_value(ptr %incdec.ptr5.i, !440, !DIExpression(), !758)
  %inc.i = add nuw nsw i32 %i.0.i3, 1, !dbg !771
    #dbg_value(i32 %inc.i, !442, !DIExpression(), !758)
  br label %for.cond.i2, !dbg !772, !llvm.loop !773

decode.exit:                                      ; preds = %for.cond.i2
    #dbg_value(ptr %p, !255, !DIExpression(), !775)
    #dbg_value(ptr %sk, !261, !DIExpression(), !775)
    #dbg_value(ptr %S, !262, !DIExpression(), !775)
  %call.i = call i32 @AES_128_CTR(ptr noundef %sk, i32 noundef 841847, ptr noundef nonnull %S, i32 noundef 16) #8, !dbg !777
  call void @llvm.lifetime.start.p0(i64 72, ptr nonnull %tmp.i), !dbg !778
    #dbg_value(ptr %sk, !269, !DIExpression(), !780)
    #dbg_value(ptr %sk, !271, !DIExpression(), !780)
    #dbg_value(i32 11857, !272, !DIExpression(), !780)
    #dbg_value(i32 142, !273, !DIExpression(), !780)
    #dbg_value(i32 9, !274, !DIExpression(), !780)
    #dbg_value(ptr %sk, !276, !DIExpression(), !780)
    #dbg_declare(ptr %tmp.i, !277, !DIExpression(), !778)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(72) %tmp.i, i8 0, i32 72, i1 false), !dbg !778
    #dbg_value(i32 11857, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !781)
  br label %for.cond.i, !dbg !782

for.cond.i:                                       ; preds = %for.body.i, %decode.exit
  %i.0.in.i = phi i32 [ 11857, %decode.exit ], [ %i.0.i, %for.body.i ]
    #dbg_value(i32 %i.0.in.i, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !781)
  %cmp.i = icmp ugt i32 %i.0.in.i, 0, !dbg !783
  br i1 %cmp.i, label %for.body.i, label %unpack_m_vecs.exit, !dbg !784

for.body.i:                                       ; preds = %for.cond.i
  %i.0.i = add nsw i32 %i.0.in.i, -1, !dbg !785
    #dbg_value(i32 %i.0.i, !281, !DIExpression(), !781)
  %mul.i = mul nsw i32 %i.0.i, 142, !dbg !786
  %div1.i1112 = lshr exact i32 %mul.i, 1, !dbg !787
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %sk, i32 %div1.i1112, !dbg !788
  %call.i1 = call ptr @memcpy(ptr noundef nonnull %tmp.i, ptr noundef %add.ptr.i, i32 noundef 71) #8, !dbg !789
  %mul4.i = mul nsw i32 %i.0.i, 72, !dbg !790
  %add.ptr5.i = getelementptr inbounds nuw i8, ptr %sk, i32 %mul4.i, !dbg !791
  %call8.i = call ptr @memcpy(ptr noundef %add.ptr5.i, ptr noundef nonnull %tmp.i, i32 noundef 72) #8, !dbg !792
    #dbg_value(i32 %i.0.i, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !781)
  br label %for.cond.i, !dbg !793, !llvm.loop !794

unpack_m_vecs.exit:                               ; preds = %for.cond.i
  call void @llvm.lifetime.end.p0(i64 72, ptr nonnull %tmp.i), !dbg !796
  %add.ptr7 = getelementptr inbounds nuw i8, ptr %sk, i32 731016, !dbg !797
    #dbg_value(ptr %add.ptr7, !798, !DIExpression(), !740)
    #dbg_value(ptr %sk, !799, !DIExpression(), !740)
    #dbg_value(ptr %add.ptr7, !800, !DIExpression(), !740)
    #dbg_value(ptr %p, !801, !DIExpression(), !803)
    #dbg_value(ptr %sk, !805, !DIExpression(), !803)
    #dbg_value(ptr %O2, !806, !DIExpression(), !803)
    #dbg_value(ptr %add.ptr7, !807, !DIExpression(), !803)
    #dbg_value(i32 12, !808, !DIExpression(), !803)
    #dbg_value(i32 142, !809, !DIExpression(), !803)
    #dbg_value(i32 9, !810, !DIExpression(), !803)
    #dbg_value(i32 0, !811, !DIExpression(), !803)
    #dbg_value(i32 0, !812, !DIExpression(), !814)
  br label %for.cond.i6, !dbg !815

for.cond.i6:                                      ; preds = %for.inc27.i, %unpack_m_vecs.exit
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc27.i ], [ 142, %unpack_m_vecs.exit ], !dbg !816
  %bs_mat_entries_used.0.i = phi i32 [ 0, %unpack_m_vecs.exit ], [ %bs_mat_entries_used.1.i.lcssa, %for.inc27.i ], !dbg !816
  %r.0.i = phi i32 [ 0, %unpack_m_vecs.exit ], [ %inc28.i, %for.inc27.i ], !dbg !817
    #dbg_value(i32 %r.0.i, !812, !DIExpression(), !814)
    #dbg_value(i32 %bs_mat_entries_used.0.i, !811, !DIExpression(), !803)
  %exitcond15 = icmp ne i32 %r.0.i, 142, !dbg !818
  br i1 %exitcond15, label %for.cond1.i.preheader, label %P1P1t_times_O.exit, !dbg !820

for.cond1.i.preheader:                            ; preds = %for.cond.i6
  %3 = add i32 %bs_mat_entries_used.0.i, %indvars.iv, !dbg !821
  br label %for.cond1.i, !dbg !821

for.cond1.i:                                      ; preds = %for.cond1.i.preheader, %for.inc25.i
  %bs_mat_entries_used.1.i = phi i32 [ %bs_mat_entries_used.2.i, %for.inc25.i ], [ %bs_mat_entries_used.0.i, %for.cond1.i.preheader ], !dbg !803
  %c.0.i = phi i32 [ %inc.i8, %for.inc25.i ], [ %r.0.i, %for.cond1.i.preheader ], !dbg !824
    #dbg_value(i32 %c.0.i, !825, !DIExpression(), !826)
    #dbg_value(i32 %bs_mat_entries_used.1.i, !811, !DIExpression(), !803)
  %exitcond14 = icmp ne i32 %bs_mat_entries_used.1.i, %3, !dbg !827
  br i1 %exitcond14, label %for.body3.i, label %for.inc27.i, !dbg !821

for.body3.i:                                      ; preds = %for.cond1.i
  %cmp4.i = icmp eq i32 %c.0.i, %r.0.i, !dbg !829
  br i1 %cmp4.i, label %for.inc25.i, label %for.cond5.i.preheader, !dbg !829

for.cond5.i.preheader:                            ; preds = %for.body3.i
  br label %for.cond5.i, !dbg !832

for.cond5.i:                                      ; preds = %for.cond5.i.preheader, %for.body7.i
  %k.0.i = phi i32 [ %add23.i, %for.body7.i ], [ 0, %for.cond5.i.preheader ], !dbg !834
    #dbg_value(i32 %k.0.i, !835, !DIExpression(), !836)
  %exitcond13 = icmp ne i32 %k.0.i, 12, !dbg !837
  br i1 %exitcond13, label %for.body7.i, label %for.inc25.i.loopexit, !dbg !832

for.body7.i:                                      ; preds = %for.cond5.i
  %add.ptr.idx.i = mul nsw i32 %bs_mat_entries_used.1.i, 72, !dbg !839
  %add.ptr.i9 = getelementptr inbounds i8, ptr %sk, i32 %add.ptr.idx.i, !dbg !839
  %mul8.i = mul nuw nsw i32 %c.0.i, 12, !dbg !841
  %4 = getelementptr inbounds nuw i8, ptr %O2, i32 %mul8.i, !dbg !842
  %arrayidx.i10 = getelementptr inbounds nuw i8, ptr %4, i32 %k.0.i, !dbg !842
  %5 = load i8, ptr %arrayidx.i10, align 1, !dbg !842
  %mul10.i = mul nuw nsw i32 %r.0.i, 12, !dbg !843
  %add11.i = add nuw nsw i32 %mul10.i, %k.0.i, !dbg !844
  %add.ptr13.idx.i = mul nuw nsw i32 %add11.i, 72, !dbg !845
  %add.ptr13.i = getelementptr inbounds nuw i8, ptr %add.ptr7, i32 %add.ptr13.idx.i, !dbg !845
  call fastcc void @m_vec_mul_add(i32 noundef 9, ptr noundef %add.ptr.i9, i8 noundef zeroext %5, ptr noundef nonnull %add.ptr13.i) #9, !dbg !846
  %add.ptr15.idx.i = mul nsw i32 %bs_mat_entries_used.1.i, 72, !dbg !847
  %add.ptr15.i = getelementptr inbounds i8, ptr %sk, i32 %add.ptr15.idx.i, !dbg !847
  %mul16.i = mul nuw nsw i32 %r.0.i, 12, !dbg !848
  %6 = getelementptr inbounds nuw i8, ptr %O2, i32 %mul16.i, !dbg !849
  %arrayidx18.i = getelementptr inbounds nuw i8, ptr %6, i32 %k.0.i, !dbg !849
  %7 = load i8, ptr %arrayidx18.i, align 1, !dbg !849
  %mul19.i = mul nuw nsw i32 %c.0.i, 12, !dbg !850
  %add20.i = add nuw nsw i32 %mul19.i, %k.0.i, !dbg !851
  %add.ptr22.idx.i = mul nuw nsw i32 %add20.i, 72, !dbg !852
  %add.ptr22.i = getelementptr inbounds nuw i8, ptr %add.ptr7, i32 %add.ptr22.idx.i, !dbg !852
  call fastcc void @m_vec_mul_add(i32 noundef 9, ptr noundef %add.ptr15.i, i8 noundef zeroext %7, ptr noundef nonnull %add.ptr22.i) #9, !dbg !853
  %add23.i = add nuw nsw i32 %k.0.i, 1, !dbg !854
    #dbg_value(i32 %add23.i, !835, !DIExpression(), !836)
  br label %for.cond5.i, !dbg !855, !llvm.loop !856

for.inc25.i.loopexit:                             ; preds = %for.cond5.i
  br label %for.inc25.i, !dbg !858

for.inc25.i:                                      ; preds = %for.inc25.i.loopexit, %for.body3.i
  %bs_mat_entries_used.2.i = add i32 %bs_mat_entries_used.1.i, 1, !dbg !858
    #dbg_value(i32 %bs_mat_entries_used.2.i, !811, !DIExpression(), !803)
  %inc.i8 = add nuw nsw i32 %c.0.i, 1, !dbg !859
    #dbg_value(i32 %inc.i8, !825, !DIExpression(), !826)
  br label %for.cond1.i, !dbg !860, !llvm.loop !861

for.inc27.i:                                      ; preds = %for.cond1.i
  %bs_mat_entries_used.1.i.lcssa = phi i32 [ %bs_mat_entries_used.1.i, %for.cond1.i ], !dbg !803
  %inc28.i = add nuw nsw i32 %r.0.i, 1, !dbg !863
    #dbg_value(i32 %inc28.i, !812, !DIExpression(), !814)
  %indvars.iv.next = add nsw i32 %indvars.iv, -1, !dbg !864
  br label %for.cond.i6, !dbg !864, !llvm.loop !865

P1P1t_times_O.exit:                               ; preds = %for.cond.i6
  call void @mayo_secure_clear(ptr noundef nonnull %S, i32 noundef 868) #8, !dbg !867
  ret i32 0, !dbg !868
}

; Function Attrs: nounwind
define dso_local i32 @pqmayo_MAYO_5_ref_mayo_sign_signature(ptr noundef %p, ptr noundef %sig, ptr noundef %siglen, ptr noundef %m, i32 noundef %mlen, ptr noundef %csk) local_unnamed_addr #0 !dbg !869 {
entry:
  %A.i = alloca [2592 x i64], align 8
  %tab.i = alloca [16 x i8], align 1
  %Pv.i = alloca [15336 x i64], align 8
  %tenc = alloca [71 x i8], align 1
  %t = alloca [142 x i8], align 1
  %y = alloca [142 x i8], align 1
  %salt = alloca [40 x i8], align 1
  %V = alloca [924 x i8], align 1
  %Vdec = alloca [1704 x i8], align 1
  %A = alloca [20880 x i8], align 1
  %x = alloca [1848 x i8], align 1
  %r = alloca [145 x i8], align 1
  %s = alloca [1848 x i8], align 1
  %sk = alloca %struct.sk_t, align 32
  %Ox = alloca [142 x i8], align 1
  %tmp = alloca [145 x i8], align 1
  %Mtmp = alloca [1296 x i64], align 8
    #dbg_value(ptr %p, !870, !DIExpression(), !871)
    #dbg_value(ptr %sig, !872, !DIExpression(), !871)
    #dbg_value(ptr %siglen, !873, !DIExpression(), !871)
    #dbg_value(ptr %m, !874, !DIExpression(), !871)
    #dbg_value(i32 %mlen, !875, !DIExpression(), !871)
    #dbg_value(ptr %csk, !876, !DIExpression(), !871)
    #dbg_value(i32 0, !877, !DIExpression(), !871)
    #dbg_declare(ptr %tenc, !878, !DIExpression(), !882)
    #dbg_declare(ptr %t, !883, !DIExpression(), !887)
    #dbg_declare(ptr %y, !888, !DIExpression(), !889)
    #dbg_declare(ptr %salt, !890, !DIExpression(), !894)
    #dbg_declare(ptr %V, !895, !DIExpression(), !899)
    #dbg_declare(ptr %Vdec, !900, !DIExpression(), !901)
    #dbg_declare(ptr %A, !902, !DIExpression(), !906)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(20880) %A, i8 0, i32 20880, i1 false), !dbg !906
    #dbg_declare(ptr %x, !907, !DIExpression(), !911)
    #dbg_declare(ptr %r, !912, !DIExpression(), !916)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(145) %r, i8 0, i32 145, i1 false), !dbg !916
    #dbg_declare(ptr %s, !917, !DIExpression(), !918)
    #dbg_declare(ptr %sk, !919, !DIExpression(), !920)
    #dbg_declare(ptr %Ox, !921, !DIExpression(), !922)
    #dbg_declare(ptr %tmp, !923, !DIExpression(), !924)
    #dbg_value(i32 142, !925, !DIExpression(), !871)
    #dbg_value(i32 154, !926, !DIExpression(), !871)
    #dbg_value(i32 12, !927, !DIExpression(), !871)
    #dbg_value(i32 12, !928, !DIExpression(), !871)
    #dbg_value(i32 142, !929, !DIExpression(), !871)
    #dbg_value(i32 71, !930, !DIExpression(), !871)
    #dbg_value(i32 71, !931, !DIExpression(), !871)
    #dbg_value(i32 72, !932, !DIExpression(), !871)
    #dbg_value(i32 964, !933, !DIExpression(), !871)
    #dbg_value(i32 145, !934, !DIExpression(), !871)
    #dbg_value(i32 64, !935, !DIExpression(), !871)
    #dbg_value(i32 40, !936, !DIExpression(), !871)
    #dbg_value(i32 40, !937, !DIExpression(), !871)
  %call = call i32 @pqmayo_MAYO_5_ref_mayo_expand_sk(ptr noundef %p, ptr noundef %csk, ptr noundef nonnull %sk) #9, !dbg !938
    #dbg_value(i32 %call, !877, !DIExpression(), !871)
  %cmp.not = icmp eq i32 %call, 0, !dbg !939
  br i1 %cmp.not, label %if.end, label %err, !dbg !939

if.end:                                           ; preds = %entry
    #dbg_value(ptr %csk, !941, !DIExpression(), !871)
  %call1 = call i32 @shake256(ptr noundef nonnull %tmp, i32 noundef 64, ptr noundef %m, i32 noundef %mlen) #8, !dbg !942
    #dbg_value(ptr %sk, !943, !DIExpression(), !871)
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 731016, !dbg !944
    #dbg_value(ptr %add.ptr, !945, !DIExpression(), !871)
    #dbg_declare(ptr %Mtmp, !946, !DIExpression(), !947)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(10368) %Mtmp, i8 0, i32 10368, i1 false), !dbg !947
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %tmp, i32 64, !dbg !948
  %call6 = call i32 @randombytes(ptr noundef nonnull %add.ptr5, i32 noundef 40) #8, !dbg !950
  %cmp7.not = icmp eq i32 %call6, 0, !dbg !951
  br i1 %cmp7.not, label %if.end9, label %err, !dbg !951

if.end9:                                          ; preds = %if.end
  %add.ptr12 = getelementptr inbounds nuw i8, ptr %tmp, i32 104, !dbg !952
  %call13 = call ptr @memcpy(ptr noundef nonnull %add.ptr12, ptr noundef %csk, i32 noundef 40) #8, !dbg !953
  %call16 = call i32 @shake256(ptr noundef nonnull %salt, i32 noundef 40, ptr noundef nonnull %tmp, i32 noundef 144) #8, !dbg !954
  %add.ptr18 = getelementptr inbounds nuw i8, ptr %tmp, i32 64, !dbg !955
  %call20 = call ptr @memcpy(ptr noundef nonnull %add.ptr18, ptr noundef nonnull %salt, i32 noundef 40) #8, !dbg !956
    #dbg_value(ptr %add.ptr24, !957, !DIExpression(), !871)
  %call27 = call i32 @shake256(ptr noundef nonnull %tenc, i32 noundef 71, ptr noundef nonnull %tmp, i32 noundef 104) #8, !dbg !958
    #dbg_value(ptr %tenc, !434, !DIExpression(), !959)
    #dbg_value(ptr %t, !440, !DIExpression(), !959)
    #dbg_value(i32 142, !441, !DIExpression(), !959)
    #dbg_value(i32 0, !442, !DIExpression(), !959)
  br label %for.cond.i23, !dbg !961

for.cond.i23:                                     ; preds = %for.body.i27, %if.end9
  %mdec.addr.0.i24 = phi ptr [ %t, %if.end9 ], [ %incdec.ptr5.i31, %for.body.i27 ]
  %i.0.i25 = phi i32 [ 0, %if.end9 ], [ %inc.i32, %for.body.i27 ], !dbg !962
    #dbg_value(i32 %i.0.i25, !442, !DIExpression(), !959)
    #dbg_value(ptr %mdec.addr.0.i24, !440, !DIExpression(), !959)
  %exitcond = icmp ne i32 %i.0.i25, 71, !dbg !963
  br i1 %exitcond, label %for.body.i27, label %for.cond.preheader, !dbg !964

for.cond.preheader:                               ; preds = %for.cond.i23
  %add.ptr24 = getelementptr inbounds nuw i8, ptr %tmp, i32 144, !dbg !965
  br label %for.cond, !dbg !966

for.body.i27:                                     ; preds = %for.cond.i23
  %arrayidx.i28 = getelementptr inbounds nuw i8, ptr %tenc, i32 %i.0.i25, !dbg !968
  %0 = load i8, ptr %arrayidx.i28, align 1, !dbg !968
  %1 = and i8 %0, 15, !dbg !969
  %incdec.ptr.i29 = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i24, i32 1, !dbg !970
    #dbg_value(ptr %incdec.ptr.i29, !440, !DIExpression(), !959)
  store i8 %1, ptr %mdec.addr.0.i24, align 1, !dbg !971
  %2 = lshr i8 %0, 4, !dbg !972
    #dbg_value(ptr %incdec.ptr.i29, !440, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !959)
  store i8 %2, ptr %incdec.ptr.i29, align 1, !dbg !973
  %incdec.ptr5.i31 = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i24, i32 2, !dbg !974
    #dbg_value(ptr %incdec.ptr5.i31, !440, !DIExpression(), !959)
  %inc.i32 = add nuw nsw i32 %i.0.i25, 1, !dbg !975
    #dbg_value(i32 %inc.i32, !442, !DIExpression(), !959)
  br label %for.cond.i23, !dbg !976, !llvm.loop !977

for.cond:                                         ; preds = %for.cond.preheader, %if.else
  %ctr.0 = phi i32 [ %inc75, %if.else ], [ 0, %for.cond.preheader ], !dbg !979
    #dbg_value(i32 %ctr.0, !980, !DIExpression(), !981)
  %exitcond153 = icmp ne i32 %ctr.0, 256, !dbg !982
  br i1 %exitcond153, label %for.body, label %for.end76, !dbg !966

for.body:                                         ; preds = %for.cond
  %conv = trunc nuw i32 %ctr.0 to i8, !dbg !984
  store i8 %conv, ptr %add.ptr24, align 1, !dbg !986
  %call33 = call i32 @shake256(ptr noundef nonnull %V, i32 noundef 924, ptr noundef nonnull %tmp, i32 noundef 145) #8, !dbg !987
    #dbg_value(i32 0, !988, !DIExpression(), !990)
  br label %for.cond34, !dbg !991

for.cond34:                                       ; preds = %decode.exit22, %for.body
  %i.0 = phi i32 [ 0, %for.body ], [ %inc, %decode.exit22 ], !dbg !992
    #dbg_value(i32 %i.0, !988, !DIExpression(), !990)
  %exitcond127 = icmp ne i32 %i.0, 12, !dbg !993
  br i1 %exitcond127, label %for.body37, label %for.end, !dbg !995

for.body37:                                       ; preds = %for.cond34
  %mul = mul nuw nsw i32 %i.0, 71, !dbg !996
  %add.ptr39 = getelementptr inbounds nuw i8, ptr %V, i32 %mul, !dbg !998
  %mul41 = mul nuw nsw i32 %i.0, 142, !dbg !999
  %add.ptr42 = getelementptr inbounds nuw i8, ptr %Vdec, i32 %mul41, !dbg !1000
    #dbg_value(ptr %add.ptr39, !434, !DIExpression(), !1001)
    #dbg_value(ptr %add.ptr42, !440, !DIExpression(), !1001)
    #dbg_value(i32 142, !441, !DIExpression(), !1001)
    #dbg_value(i32 0, !442, !DIExpression(), !1001)
  br label %for.cond.i12, !dbg !1003

for.cond.i12:                                     ; preds = %for.body.i16, %for.body37
  %mdec.addr.0.i13 = phi ptr [ %add.ptr42, %for.body37 ], [ %incdec.ptr5.i20, %for.body.i16 ]
  %i.0.i14 = phi i32 [ 0, %for.body37 ], [ %inc.i21, %for.body.i16 ], !dbg !1004
    #dbg_value(i32 %i.0.i14, !442, !DIExpression(), !1001)
    #dbg_value(ptr %mdec.addr.0.i13, !440, !DIExpression(), !1001)
  %exitcond126 = icmp ne i32 %i.0.i14, 71, !dbg !1005
  br i1 %exitcond126, label %for.body.i16, label %decode.exit22, !dbg !1006

for.body.i16:                                     ; preds = %for.cond.i12
  %arrayidx.i17 = getelementptr inbounds nuw i8, ptr %add.ptr39, i32 %i.0.i14, !dbg !1007
  %3 = load i8, ptr %arrayidx.i17, align 1, !dbg !1007
  %4 = and i8 %3, 15, !dbg !1008
  %incdec.ptr.i18 = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i13, i32 1, !dbg !1009
    #dbg_value(ptr %incdec.ptr.i18, !440, !DIExpression(), !1001)
  store i8 %4, ptr %mdec.addr.0.i13, align 1, !dbg !1010
  %5 = lshr i8 %3, 4, !dbg !1011
    #dbg_value(ptr %incdec.ptr.i18, !440, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1001)
  store i8 %5, ptr %incdec.ptr.i18, align 1, !dbg !1012
  %incdec.ptr5.i20 = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i13, i32 2, !dbg !1013
    #dbg_value(ptr %incdec.ptr5.i20, !440, !DIExpression(), !1001)
  %inc.i21 = add nuw nsw i32 %i.0.i14, 1, !dbg !1014
    #dbg_value(i32 %inc.i21, !442, !DIExpression(), !1001)
  br label %for.cond.i12, !dbg !1015, !llvm.loop !1016

decode.exit22:                                    ; preds = %for.cond.i12
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1018
    #dbg_value(i32 %inc, !988, !DIExpression(), !990)
  br label %for.cond34, !dbg !1019, !llvm.loop !1020

for.end:                                          ; preds = %for.cond34
  call void @llvm.lifetime.start.p0(i64 122688, ptr nonnull %Pv.i), !dbg !1022
    #dbg_value(ptr %p, !1027, !DIExpression(), !1028)
    #dbg_value(ptr %Vdec, !1029, !DIExpression(), !1028)
    #dbg_value(ptr %add.ptr, !1030, !DIExpression(), !1028)
    #dbg_value(ptr %sk, !1031, !DIExpression(), !1028)
    #dbg_value(ptr %Mtmp, !1032, !DIExpression(), !1028)
    #dbg_value(ptr %A, !1033, !DIExpression(), !1028)
    #dbg_value(i32 12, !1034, !DIExpression(), !1028)
    #dbg_value(i32 142, !1035, !DIExpression(), !1028)
    #dbg_value(i32 12, !1036, !DIExpression(), !1028)
    #dbg_value(i32 9, !1037, !DIExpression(), !1039)
    #dbg_value(ptr %Vdec, !1041, !DIExpression(), !1039)
    #dbg_value(ptr %add.ptr, !1042, !DIExpression(), !1039)
    #dbg_value(ptr %Mtmp, !1043, !DIExpression(), !1039)
    #dbg_value(i32 12, !1044, !DIExpression(), !1039)
    #dbg_value(i32 142, !1045, !DIExpression(), !1039)
    #dbg_value(i32 12, !1046, !DIExpression(), !1039)
    #dbg_value(i32 0, !1047, !DIExpression(), !1049)
  br label %for.cond.i41, !dbg !1050

for.cond.i41:                                     ; preds = %for.inc17.i47, %for.end
  %r.0.i42 = phi i32 [ 0, %for.end ], [ %inc18.i48, %for.inc17.i47 ], !dbg !1051
    #dbg_value(i32 %r.0.i42, !1047, !DIExpression(), !1049)
  %exitcond130 = icmp ne i32 %r.0.i42, 12, !dbg !1052
  br i1 %exitcond130, label %for.cond1.i44.preheader, label %mul_add_mat_x_m_mat.exit66, !dbg !1054

for.cond1.i44.preheader:                          ; preds = %for.cond.i41
  br label %for.cond1.i44, !dbg !1055

for.cond1.i44:                                    ; preds = %for.cond1.i44.preheader, %for.inc15.i52
  %c.0.i45 = phi i32 [ %inc.i53, %for.inc15.i52 ], [ 0, %for.cond1.i44.preheader ], !dbg !1058
    #dbg_value(i32 %c.0.i45, !1059, !DIExpression(), !1060)
  %exitcond129 = icmp ne i32 %c.0.i45, 142, !dbg !1061
  br i1 %exitcond129, label %for.cond4.i49.preheader, label %for.inc17.i47, !dbg !1055

for.cond4.i49.preheader:                          ; preds = %for.cond1.i44
  br label %for.cond4.i49, !dbg !1063

for.cond4.i49:                                    ; preds = %for.cond4.i49.preheader, %for.body6.i54
  %k.0.i50 = phi i32 [ %add14.i65, %for.body6.i54 ], [ 0, %for.cond4.i49.preheader ], !dbg !1066
    #dbg_value(i32 %k.0.i50, !1067, !DIExpression(), !1068)
  %exitcond128 = icmp ne i32 %k.0.i50, 12, !dbg !1069
  br i1 %exitcond128, label %for.body6.i54, label %for.inc15.i52, !dbg !1063

for.body6.i54:                                    ; preds = %for.cond4.i49
  %mul.i55 = mul nuw nsw i32 %c.0.i45, 12, !dbg !1071
  %add.i56 = add nuw nsw i32 %mul.i55, %k.0.i50, !dbg !1073
  %add.ptr.i58.idx = mul nuw nsw i32 %add.i56, 72, !dbg !1074
  %add.ptr.i58 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %add.ptr.i58.idx, !dbg !1074
  %mul8.i59 = mul nuw nsw i32 %r.0.i42, 142, !dbg !1075
  %6 = getelementptr i8, ptr %Vdec, i32 %mul8.i59, !dbg !1076
  %arrayidx.i60 = getelementptr i8, ptr %6, i32 %c.0.i45, !dbg !1076
  %7 = load i8, ptr %arrayidx.i60, align 1, !dbg !1076
  %mul10.i61 = mul nuw nsw i32 %r.0.i42, 12, !dbg !1077
  %add11.i62 = add nuw nsw i32 %mul10.i61, %k.0.i50, !dbg !1078
  %add.ptr13.i64.idx = mul nuw nsw i32 %add11.i62, 72, !dbg !1079
  %add.ptr13.i64 = getelementptr inbounds nuw i8, ptr %Mtmp, i32 %add.ptr13.i64.idx, !dbg !1079
  call fastcc void @m_vec_mul_add(i32 noundef 9, ptr noundef nonnull %add.ptr.i58, i8 noundef zeroext %7, ptr noundef nonnull %add.ptr13.i64) #9, !dbg !1080
  %add14.i65 = add nuw nsw i32 %k.0.i50, 1, !dbg !1081
    #dbg_value(i32 %add14.i65, !1067, !DIExpression(), !1068)
  br label %for.cond4.i49, !dbg !1082, !llvm.loop !1083

for.inc15.i52:                                    ; preds = %for.cond4.i49
  %inc.i53 = add nuw nsw i32 %c.0.i45, 1, !dbg !1085
    #dbg_value(i32 %inc.i53, !1059, !DIExpression(), !1060)
  br label %for.cond1.i44, !dbg !1086, !llvm.loop !1087

for.inc17.i47:                                    ; preds = %for.cond1.i44
  %inc18.i48 = add nuw nsw i32 %r.0.i42, 1, !dbg !1089
    #dbg_value(i32 %inc18.i48, !1047, !DIExpression(), !1049)
  br label %for.cond.i41, !dbg !1090, !llvm.loop !1091

mul_add_mat_x_m_mat.exit66:                       ; preds = %for.cond.i41
    #dbg_declare(ptr %Pv.i, !1093, !DIExpression(), !1097)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(122688) %Pv.i, i8 0, i32 122688, i1 false), !dbg !1097
    #dbg_value(ptr %p, !1098, !DIExpression(), !1100)
    #dbg_value(ptr %sk, !1102, !DIExpression(), !1100)
    #dbg_value(ptr %Vdec, !1103, !DIExpression(), !1100)
    #dbg_value(ptr %Pv.i, !1104, !DIExpression(), !1100)
    #dbg_value(i32 9, !1105, !DIExpression(), !1107)
    #dbg_value(ptr %sk, !1109, !DIExpression(), !1107)
    #dbg_value(ptr %Vdec, !1110, !DIExpression(), !1107)
    #dbg_value(ptr %Pv.i, !1111, !DIExpression(), !1107)
    #dbg_value(i32 142, !1112, !DIExpression(), !1107)
    #dbg_value(i32 142, !1113, !DIExpression(), !1107)
    #dbg_value(i32 12, !1114, !DIExpression(), !1107)
    #dbg_value(i32 1, !1115, !DIExpression(), !1107)
    #dbg_value(i32 0, !1116, !DIExpression(), !1107)
    #dbg_value(i32 0, !1117, !DIExpression(), !1119)
  br label %for.cond.i67, !dbg !1120

for.cond.i67:                                     ; preds = %for.inc17.i75, %mul_add_mat_x_m_mat.exit66
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc17.i75 ], [ 142, %mul_add_mat_x_m_mat.exit66 ], !dbg !1121
  %bs_mat_entries_used.0.i = phi i32 [ 0, %mul_add_mat_x_m_mat.exit66 ], [ %bs_mat_entries_used.1.i.lcssa, %for.inc17.i75 ], !dbg !1121
  %r.0.i68 = phi i32 [ 0, %mul_add_mat_x_m_mat.exit66 ], [ %inc18.i76, %for.inc17.i75 ], !dbg !1122
    #dbg_value(i32 %r.0.i68, !1117, !DIExpression(), !1119)
    #dbg_value(i32 %bs_mat_entries_used.0.i, !1116, !DIExpression(), !1107)
  %exitcond133 = icmp ne i32 %r.0.i68, 142, !dbg !1123
  br i1 %exitcond133, label %for.cond1.i72.preheader, label %for.cond.i34.preheader, !dbg !1125

for.cond.i34.preheader:                           ; preds = %for.cond.i67
  br label %for.cond.i34, !dbg !1126

for.cond1.i72.preheader:                          ; preds = %for.cond.i67
  %8 = add i32 %bs_mat_entries_used.0.i, %indvars.iv, !dbg !1128
  br label %for.cond1.i72, !dbg !1128

for.cond1.i72:                                    ; preds = %for.cond1.i72.preheader, %for.inc15.i80
  %bs_mat_entries_used.1.i = phi i32 [ %add14.i81, %for.inc15.i80 ], [ %bs_mat_entries_used.0.i, %for.cond1.i72.preheader ], !dbg !1107
  %c.0.i73 = phi i32 [ %inc.i82, %for.inc15.i80 ], [ %r.0.i68, %for.cond1.i72.preheader ], !dbg !1131
    #dbg_value(i32 %c.0.i73, !1132, !DIExpression(), !1133)
    #dbg_value(i32 %bs_mat_entries_used.1.i, !1116, !DIExpression(), !1107)
  %exitcond132 = icmp ne i32 %bs_mat_entries_used.1.i, %8, !dbg !1134
  br i1 %exitcond132, label %for.cond4.i77.preheader, label %for.inc17.i75, !dbg !1128

for.cond4.i77.preheader:                          ; preds = %for.cond1.i72
  br label %for.cond4.i77, !dbg !1136

for.cond4.i77:                                    ; preds = %for.cond4.i77.preheader, %for.body6.i83
  %k.0.i78 = phi i32 [ %add13.i, %for.body6.i83 ], [ 0, %for.cond4.i77.preheader ], !dbg !1139
    #dbg_value(i32 %k.0.i78, !1140, !DIExpression(), !1141)
  %exitcond131 = icmp ne i32 %k.0.i78, 12, !dbg !1142
  br i1 %exitcond131, label %for.body6.i83, label %for.inc15.i80, !dbg !1136

for.body6.i83:                                    ; preds = %for.cond4.i77
  %add.ptr.i85.idx = mul nsw i32 %bs_mat_entries_used.1.i, 72, !dbg !1144
  %add.ptr.i85 = getelementptr inbounds i8, ptr %sk, i32 %add.ptr.i85.idx, !dbg !1144
  %mul8.i86 = mul nuw nsw i32 %k.0.i78, 142, !dbg !1146
  %9 = getelementptr i8, ptr %Vdec, i32 %mul8.i86, !dbg !1147
  %arrayidx.i87 = getelementptr i8, ptr %9, i32 %c.0.i73, !dbg !1147
  %10 = load i8, ptr %arrayidx.i87, align 1, !dbg !1147
  %mul9.i = mul nuw nsw i32 %r.0.i68, 12, !dbg !1148
  %add10.i = add nuw nsw i32 %mul9.i, %k.0.i78, !dbg !1149
  %add.ptr12.i.idx = mul nuw nsw i32 %add10.i, 72, !dbg !1150
  %add.ptr12.i = getelementptr inbounds nuw i8, ptr %Pv.i, i32 %add.ptr12.i.idx, !dbg !1150
  call fastcc void @m_vec_mul_add(i32 noundef 9, ptr noundef nonnull %add.ptr.i85, i8 noundef zeroext %10, ptr noundef nonnull %add.ptr12.i) #9, !dbg !1151
  %add13.i = add nuw nsw i32 %k.0.i78, 1, !dbg !1152
    #dbg_value(i32 %add13.i, !1140, !DIExpression(), !1141)
  br label %for.cond4.i77, !dbg !1153, !llvm.loop !1154

for.inc15.i80:                                    ; preds = %for.cond4.i77
    #dbg_value(i32 %bs_mat_entries_used.1.i, !1116, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1107)
  %add14.i81 = add i32 %bs_mat_entries_used.1.i, 1, !dbg !1156
    #dbg_value(i32 %add14.i81, !1116, !DIExpression(), !1107)
  %inc.i82 = add nuw nsw i32 %c.0.i73, 1, !dbg !1157
    #dbg_value(i32 %inc.i82, !1132, !DIExpression(), !1133)
  br label %for.cond1.i72, !dbg !1158, !llvm.loop !1159

for.inc17.i75:                                    ; preds = %for.cond1.i72
  %bs_mat_entries_used.1.i.lcssa = phi i32 [ %bs_mat_entries_used.1.i, %for.cond1.i72 ], !dbg !1107
  %inc18.i76 = add nuw nsw i32 %r.0.i68, 1, !dbg !1161
    #dbg_value(i32 %inc18.i76, !1117, !DIExpression(), !1119)
  %indvars.iv.next = add nsw i32 %indvars.iv, -1, !dbg !1162
  br label %for.cond.i67, !dbg !1162, !llvm.loop !1163

for.cond.i34:                                     ; preds = %for.cond.i34.preheader, %for.inc17.i
  %r.0.i = phi i32 [ %inc18.i, %for.inc17.i ], [ 0, %for.cond.i34.preheader ], !dbg !1165
    #dbg_value(i32 %r.0.i, !1047, !DIExpression(), !1166)
  %exitcond136 = icmp ne i32 %r.0.i, 12, !dbg !1167
  br i1 %exitcond136, label %for.cond1.i36.preheader, label %mul_add_mat_x_m_mat.exit, !dbg !1126

for.cond1.i36.preheader:                          ; preds = %for.cond.i34
  br label %for.cond1.i36, !dbg !1168

for.cond1.i36:                                    ; preds = %for.cond1.i36.preheader, %for.inc15.i
  %c.0.i = phi i32 [ %inc.i38, %for.inc15.i ], [ 0, %for.cond1.i36.preheader ], !dbg !1169
    #dbg_value(i32 %c.0.i, !1059, !DIExpression(), !1170)
  %exitcond135 = icmp ne i32 %c.0.i, 142, !dbg !1171
  br i1 %exitcond135, label %for.cond4.i.preheader, label %for.inc17.i, !dbg !1168

for.cond4.i.preheader:                            ; preds = %for.cond1.i36
  br label %for.cond4.i, !dbg !1172

for.cond4.i:                                      ; preds = %for.cond4.i.preheader, %for.body6.i
  %k.0.i = phi i32 [ %add14.i, %for.body6.i ], [ 0, %for.cond4.i.preheader ], !dbg !1173
    #dbg_value(i32 %k.0.i, !1067, !DIExpression(), !1174)
  %exitcond134 = icmp ne i32 %k.0.i, 12, !dbg !1175
  br i1 %exitcond134, label %for.body6.i, label %for.inc15.i, !dbg !1172

for.body6.i:                                      ; preds = %for.cond4.i
  %mul.i = mul nuw nsw i32 %c.0.i, 12, !dbg !1176
  %add.i = add nuw nsw i32 %mul.i, %k.0.i, !dbg !1177
  %add.ptr.i39.idx = mul nuw nsw i32 %add.i, 72, !dbg !1178
  %add.ptr.i39 = getelementptr inbounds nuw i8, ptr %Pv.i, i32 %add.ptr.i39.idx, !dbg !1178
  %mul8.i = mul nuw nsw i32 %r.0.i, 142, !dbg !1179
  %11 = getelementptr i8, ptr %Vdec, i32 %mul8.i, !dbg !1180
  %arrayidx.i40 = getelementptr i8, ptr %11, i32 %c.0.i, !dbg !1180
  %12 = load i8, ptr %arrayidx.i40, align 1, !dbg !1180
  %mul10.i = mul nuw nsw i32 %r.0.i, 12, !dbg !1181
  %add11.i = add nuw nsw i32 %mul10.i, %k.0.i, !dbg !1182
  %add.ptr13.i.idx = mul nuw nsw i32 %add11.i, 72, !dbg !1183
  %add.ptr13.i = getelementptr inbounds nuw i8, ptr %A, i32 %add.ptr13.i.idx, !dbg !1183
  call fastcc void @m_vec_mul_add(i32 noundef 9, ptr noundef nonnull %add.ptr.i39, i8 noundef zeroext %12, ptr noundef nonnull %add.ptr13.i) #9, !dbg !1184
  %add14.i = add nuw nsw i32 %k.0.i, 1, !dbg !1185
    #dbg_value(i32 %add14.i, !1067, !DIExpression(), !1174)
  br label %for.cond4.i, !dbg !1186, !llvm.loop !1187

for.inc15.i:                                      ; preds = %for.cond4.i
  %inc.i38 = add nuw nsw i32 %c.0.i, 1, !dbg !1189
    #dbg_value(i32 %inc.i38, !1059, !DIExpression(), !1170)
  br label %for.cond1.i36, !dbg !1190, !llvm.loop !1191

for.inc17.i:                                      ; preds = %for.cond1.i36
  %inc18.i = add nuw nsw i32 %r.0.i, 1, !dbg !1193
    #dbg_value(i32 %inc18.i, !1047, !DIExpression(), !1166)
  br label %for.cond.i34, !dbg !1194, !llvm.loop !1195

mul_add_mat_x_m_mat.exit:                         ; preds = %for.cond.i34
  call void @llvm.lifetime.end.p0(i64 122688, ptr nonnull %Pv.i), !dbg !1197
  call fastcc void @compute_rhs(ptr noundef %p, ptr noundef nonnull %A, ptr noundef nonnull %t, ptr noundef nonnull %y) #9, !dbg !1198
  call void @llvm.lifetime.start.p0(i64 20736, ptr nonnull %A.i), !dbg !1199
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %tab.i), !dbg !1199
    #dbg_value(ptr %p, !1204, !DIExpression(), !1205)
    #dbg_value(ptr %Mtmp, !1206, !DIExpression(), !1205)
    #dbg_value(ptr %A, !1207, !DIExpression(), !1205)
    #dbg_value(i32 0, !1208, !DIExpression(), !1205)
    #dbg_value(i32 0, !1209, !DIExpression(), !1205)
    #dbg_value(i32 9, !1210, !DIExpression(), !1205)
    #dbg_declare(ptr %A.i, !1211, !DIExpression(), !1199)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(20736) %A.i, i8 0, i32 20736, i1 false), !dbg !1199
    #dbg_value(i32 144, !1215, !DIExpression(), !1205)
    #dbg_value(i64 1, !1216, !DIExpression(), !1219)
    #dbg_value(i64 72057594037927936, !1216, !DIExpression(), !1219)
    #dbg_value(i64 72057594037927935, !1216, !DIExpression(), !1219)
    #dbg_value(i32 0, !1220, !DIExpression(), !1222)
  br label %for.cond.i100, !dbg !1223

for.cond.i100:                                    ; preds = %for.body.i123, %mul_add_mat_x_m_mat.exit
  %i.0.i101 = phi i32 [ 0, %mul_add_mat_x_m_mat.exit ], [ %inc.i125, %for.body.i123 ], !dbg !1224
    #dbg_value(i32 %i.0.i101, !1220, !DIExpression(), !1222)
  %exitcond137 = icmp ne i32 %i.0.i101, 144, !dbg !1225
  br i1 %exitcond137, label %for.body.i123, label %for.cond3.i.preheader, !dbg !1227

for.cond3.i.preheader:                            ; preds = %for.cond.i100
  br label %for.cond3.i, !dbg !1228

for.body.i123:                                    ; preds = %for.cond.i100
  %.idx.i = mul nuw nsw i32 %i.0.i101, 72, !dbg !1230
  %13 = getelementptr inbounds nuw i8, ptr %Mtmp, i32 %.idx.i, !dbg !1230
  %arrayidx.i124 = getelementptr inbounds nuw i8, ptr %13, i32 64, !dbg !1230
  %14 = load i64, ptr %arrayidx.i124, align 8, !dbg !1232
  %and.i = and i64 %14, 72057594037927935, !dbg !1232
  store i64 %and.i, ptr %arrayidx.i124, align 8, !dbg !1232
  %inc.i125 = add nuw nsw i32 %i.0.i101, 1, !dbg !1233
    #dbg_value(i32 %inc.i125, !1220, !DIExpression(), !1222)
  br label %for.cond.i100, !dbg !1234, !llvm.loop !1235

for.cond3.i:                                      ; preds = %for.cond3.i.preheader, %for.inc103.i
  %i2.0.i = phi i32 [ %inc104.i, %for.inc103.i ], [ 0, %for.cond3.i.preheader ], !dbg !1237
  %words_to_shift.0.i = phi i32 [ %words_to_shift.1.i.lcssa, %for.inc103.i ], [ 0, %for.cond3.i.preheader ], !dbg !1238
  %bits_to_shift.0.i = phi i32 [ %bits_to_shift.1.i.lcssa, %for.inc103.i ], [ 0, %for.cond3.i.preheader ], !dbg !1239
    #dbg_value(i32 %bits_to_shift.0.i, !1208, !DIExpression(), !1205)
    #dbg_value(i32 %words_to_shift.0.i, !1209, !DIExpression(), !1205)
    #dbg_value(i32 %i2.0.i, !1240, !DIExpression(), !1241)
  %exitcond142 = icmp ne i32 %i2.0.i, 12, !dbg !1242
  br i1 %exitcond142, label %for.cond6.i.preheader, label %for.cond107.i.preheader, !dbg !1228

for.cond107.i.preheader:                          ; preds = %for.cond3.i
  br label %for.cond107.i, !dbg !1244

for.cond6.i.preheader:                            ; preds = %for.cond3.i
  br label %for.cond6.i, !dbg !1246

for.cond6.i:                                      ; preds = %for.cond6.i.preheader, %if.end95.i
  %j.0.i119 = phi i32 [ %dec.i, %if.end95.i ], [ 11, %for.cond6.i.preheader ], !dbg !1249
  %words_to_shift.1.i = phi i32 [ %spec.select.i, %if.end95.i ], [ %words_to_shift.0.i, %for.cond6.i.preheader ], !dbg !1205
  %bits_to_shift.1.i = phi i32 [ %spec.select3.i, %if.end95.i ], [ %bits_to_shift.0.i, %for.cond6.i.preheader ], !dbg !1205
    #dbg_value(i32 %bits_to_shift.1.i, !1208, !DIExpression(), !1205)
    #dbg_value(i32 %words_to_shift.1.i, !1209, !DIExpression(), !1205)
    #dbg_value(i32 %j.0.i119, !1250, !DIExpression(), !1251)
  %cmp7.not.i = icmp slt i32 %j.0.i119, %i2.0.i, !dbg !1252
  br i1 %cmp7.not.i, label %for.inc103.i, label %for.body8.i, !dbg !1246

for.body8.i:                                      ; preds = %for.cond6.i
  %add.ptr.idx.i = mul nsw i32 %j.0.i119, 864, !dbg !1254
  %add.ptr.i120 = getelementptr inbounds i8, ptr %Mtmp, i32 %add.ptr.idx.i, !dbg !1254
    #dbg_value(ptr %add.ptr.i120, !1256, !DIExpression(), !1205)
    #dbg_value(i32 0, !1257, !DIExpression(), !1259)
  br label %for.cond11.i, !dbg !1260

for.cond11.i:                                     ; preds = %for.inc44.i, %for.body8.i
  %c.0.i121 = phi i32 [ 0, %for.body8.i ], [ %inc45.i, %for.inc44.i ], !dbg !1261
    #dbg_value(i32 %c.0.i121, !1257, !DIExpression(), !1259)
  %exitcond139 = icmp ne i32 %c.0.i121, 12, !dbg !1262
  br i1 %exitcond139, label %for.cond14.i.preheader, label %for.end46.i, !dbg !1264

for.cond14.i.preheader:                           ; preds = %for.cond11.i
  br label %for.cond14.i, !dbg !1265

for.cond14.i:                                     ; preds = %for.cond14.i.preheader, %for.inc41.i
  %k.0.i122 = phi i32 [ %inc42.i, %for.inc41.i ], [ 0, %for.cond14.i.preheader ], !dbg !1268
    #dbg_value(i32 %k.0.i122, !1269, !DIExpression(), !1270)
  %exitcond138 = icmp ne i32 %k.0.i122, 9, !dbg !1271
  br i1 %exitcond138, label %for.body16.i, label %for.inc44.i, !dbg !1265

for.body16.i:                                     ; preds = %for.cond14.i
  %15 = getelementptr inbounds nuw i64, ptr %add.ptr.i120, i32 %k.0.i122, !dbg !1273
  %arrayidx19.idx.i = mul nuw nsw i32 %c.0.i121, 72, !dbg !1273
  %arrayidx19.i = getelementptr inbounds nuw i8, ptr %15, i32 %arrayidx19.idx.i, !dbg !1273
  %16 = load i64, ptr %arrayidx19.i, align 8, !dbg !1273
  %sh_prom.i = zext nneg i32 %bits_to_shift.1.i to i64, !dbg !1275
  %shl20.i = shl i64 %16, %sh_prom.i, !dbg !1275
  %mul21.i = mul nuw nsw i32 %i2.0.i, 12, !dbg !1276
  %add22.i = add nuw nsw i32 %mul21.i, %c.0.i121, !dbg !1277
  %add23.i = add nsw i32 %k.0.i122, %words_to_shift.1.i, !dbg !1278
  %mul24.i = mul i32 %add23.i, 144, !dbg !1279
  %add25.i = add i32 %add22.i, %mul24.i, !dbg !1280
  %arrayidx26.i = getelementptr inbounds nuw [2592 x i64], ptr %A.i, i32 0, i32 %add25.i, !dbg !1281
  %17 = load i64, ptr %arrayidx26.i, align 8, !dbg !1282
  %xor.i = xor i64 %17, %shl20.i, !dbg !1282
  store i64 %xor.i, ptr %arrayidx26.i, align 8, !dbg !1282
  %cmp27.i = icmp sgt i32 %bits_to_shift.1.i, 0, !dbg !1283
  br i1 %cmp27.i, label %if.then.i, label %for.inc41.i, !dbg !1283

if.then.i:                                        ; preds = %for.body16.i
  %18 = getelementptr inbounds nuw i64, ptr %add.ptr.i120, i32 %k.0.i122, !dbg !1285
  %arrayidx30.idx.i = mul nuw nsw i32 %c.0.i121, 72, !dbg !1285
  %arrayidx30.i = getelementptr inbounds nuw i8, ptr %18, i32 %arrayidx30.idx.i, !dbg !1285
  %19 = load i64, ptr %arrayidx30.i, align 8, !dbg !1285
  %sub31.i = sub nsw i32 64, %bits_to_shift.1.i, !dbg !1287
  %sh_prom32.i = zext nneg i32 %sub31.i to i64, !dbg !1288
  %shr.i = lshr i64 %19, %sh_prom32.i, !dbg !1288
  %mul33.i = mul nuw nsw i32 %i2.0.i, 12, !dbg !1289
  %add34.i = add nuw nsw i32 %mul33.i, %c.0.i121, !dbg !1290
  %add35.i = add nsw i32 %k.0.i122, %words_to_shift.1.i, !dbg !1291
  %20 = mul i32 %add35.i, 144, !dbg !1292
  %mul37.i = add i32 %20, 144, !dbg !1292
  %add38.i = add i32 %add34.i, %mul37.i, !dbg !1293
  %arrayidx39.i = getelementptr inbounds nuw [2592 x i64], ptr %A.i, i32 0, i32 %add38.i, !dbg !1294
  %21 = load i64, ptr %arrayidx39.i, align 8, !dbg !1295
  %xor40.i = xor i64 %21, %shr.i, !dbg !1295
  store i64 %xor40.i, ptr %arrayidx39.i, align 8, !dbg !1295
  br label %for.inc41.i, !dbg !1296

for.inc41.i:                                      ; preds = %if.then.i, %for.body16.i
  %inc42.i = add nuw nsw i32 %k.0.i122, 1, !dbg !1297
    #dbg_value(i32 %inc42.i, !1269, !DIExpression(), !1270)
  br label %for.cond14.i, !dbg !1298, !llvm.loop !1299

for.inc44.i:                                      ; preds = %for.cond14.i
  %inc45.i = add nuw nsw i32 %c.0.i121, 1, !dbg !1301
    #dbg_value(i32 %inc45.i, !1257, !DIExpression(), !1259)
  br label %for.cond11.i, !dbg !1302, !llvm.loop !1303

for.end46.i:                                      ; preds = %for.cond11.i
  %cmp47.not.i = icmp eq i32 %i2.0.i, %j.0.i119, !dbg !1305
  br i1 %cmp47.not.i, label %if.end95.i, label %if.then48.i, !dbg !1305

if.then48.i:                                      ; preds = %for.end46.i
  %add.ptr51.idx.i = mul nuw nsw i32 %i2.0.i, 864, !dbg !1307
  %add.ptr51.i = getelementptr inbounds nuw i8, ptr %Mtmp, i32 %add.ptr51.idx.i, !dbg !1307
    #dbg_value(ptr %add.ptr51.i, !1309, !DIExpression(), !1205)
    #dbg_value(i32 0, !1310, !DIExpression(), !1312)
  br label %for.cond53.i, !dbg !1313

for.cond53.i:                                     ; preds = %for.inc92.i, %if.then48.i
  %c52.0.i = phi i32 [ 0, %if.then48.i ], [ %inc93.i, %for.inc92.i ], !dbg !1314
    #dbg_value(i32 %c52.0.i, !1310, !DIExpression(), !1312)
  %exitcond141 = icmp ne i32 %c52.0.i, 12, !dbg !1315
  br i1 %exitcond141, label %for.cond57.i.preheader, label %if.end95.i.loopexit, !dbg !1317

for.cond57.i.preheader:                           ; preds = %for.cond53.i
  br label %for.cond57.i, !dbg !1318

for.cond57.i:                                     ; preds = %for.cond57.i.preheader, %for.inc89.i
  %k56.0.i = phi i32 [ %inc90.i, %for.inc89.i ], [ 0, %for.cond57.i.preheader ], !dbg !1321
    #dbg_value(i32 %k56.0.i, !1322, !DIExpression(), !1323)
  %exitcond140 = icmp ne i32 %k56.0.i, 9, !dbg !1324
  br i1 %exitcond140, label %for.body59.i, label %for.inc92.i, !dbg !1318

for.body59.i:                                     ; preds = %for.cond57.i
  %22 = getelementptr inbounds nuw i64, ptr %add.ptr51.i, i32 %k56.0.i, !dbg !1326
  %arrayidx62.idx.i = mul nuw nsw i32 %c52.0.i, 72, !dbg !1326
  %arrayidx62.i = getelementptr inbounds nuw i8, ptr %22, i32 %arrayidx62.idx.i, !dbg !1326
  %23 = load i64, ptr %arrayidx62.i, align 8, !dbg !1326
  %sh_prom63.i = zext nneg i32 %bits_to_shift.1.i to i64, !dbg !1328
  %shl64.i = shl i64 %23, %sh_prom63.i, !dbg !1328
  %mul65.i = mul nsw i32 %j.0.i119, 12, !dbg !1329
  %add66.i = add nsw i32 %mul65.i, %c52.0.i, !dbg !1330
  %add67.i = add nsw i32 %k56.0.i, %words_to_shift.1.i, !dbg !1331
  %mul68.i = mul i32 %add67.i, 144, !dbg !1332
  %add69.i = add i32 %add66.i, %mul68.i, !dbg !1333
  %arrayidx70.i = getelementptr inbounds nuw [2592 x i64], ptr %A.i, i32 0, i32 %add69.i, !dbg !1334
  %24 = load i64, ptr %arrayidx70.i, align 8, !dbg !1335
  %xor71.i = xor i64 %24, %shl64.i, !dbg !1335
  store i64 %xor71.i, ptr %arrayidx70.i, align 8, !dbg !1335
  %cmp72.i = icmp sgt i32 %bits_to_shift.1.i, 0, !dbg !1336
  br i1 %cmp72.i, label %if.then73.i, label %for.inc89.i, !dbg !1336

if.then73.i:                                      ; preds = %for.body59.i
  %25 = getelementptr inbounds nuw i64, ptr %add.ptr51.i, i32 %k56.0.i, !dbg !1338
  %arrayidx76.idx.i = mul nuw nsw i32 %c52.0.i, 72, !dbg !1338
  %arrayidx76.i = getelementptr inbounds nuw i8, ptr %25, i32 %arrayidx76.idx.i, !dbg !1338
  %26 = load i64, ptr %arrayidx76.i, align 8, !dbg !1338
  %sub77.i = sub nsw i32 64, %bits_to_shift.1.i, !dbg !1340
  %sh_prom78.i = zext nneg i32 %sub77.i to i64, !dbg !1341
  %shr79.i = lshr i64 %26, %sh_prom78.i, !dbg !1341
  %mul80.i = mul nsw i32 %j.0.i119, 12, !dbg !1342
  %add81.i = add nsw i32 %mul80.i, %c52.0.i, !dbg !1343
  %add82.i = add nsw i32 %k56.0.i, %words_to_shift.1.i, !dbg !1344
  %27 = mul i32 %add82.i, 144, !dbg !1345
  %mul84.i = add i32 %27, 144, !dbg !1345
  %add85.i = add i32 %add81.i, %mul84.i, !dbg !1346
  %arrayidx86.i = getelementptr inbounds nuw [2592 x i64], ptr %A.i, i32 0, i32 %add85.i, !dbg !1347
  %28 = load i64, ptr %arrayidx86.i, align 8, !dbg !1348
  %xor87.i = xor i64 %28, %shr79.i, !dbg !1348
  store i64 %xor87.i, ptr %arrayidx86.i, align 8, !dbg !1348
  br label %for.inc89.i, !dbg !1349

for.inc89.i:                                      ; preds = %if.then73.i, %for.body59.i
  %inc90.i = add nuw nsw i32 %k56.0.i, 1, !dbg !1350
    #dbg_value(i32 %inc90.i, !1322, !DIExpression(), !1323)
  br label %for.cond57.i, !dbg !1351, !llvm.loop !1352

for.inc92.i:                                      ; preds = %for.cond57.i
  %inc93.i = add nuw nsw i32 %c52.0.i, 1, !dbg !1354
    #dbg_value(i32 %inc93.i, !1310, !DIExpression(), !1312)
  br label %for.cond53.i, !dbg !1355, !llvm.loop !1356

if.end95.i.loopexit:                              ; preds = %for.cond53.i
  br label %if.end95.i, !dbg !1358

if.end95.i:                                       ; preds = %if.end95.i.loopexit, %for.end46.i
  %add96.i = add nsw i32 %bits_to_shift.1.i, 4, !dbg !1358
    #dbg_value(i32 %add96.i, !1208, !DIExpression(), !1205)
  %cmp97.i = icmp eq i32 %add96.i, 64, !dbg !1359
  %inc99.i = zext i1 %cmp97.i to i32, !dbg !1359
  %spec.select.i = add nsw i32 %words_to_shift.1.i, %inc99.i, !dbg !1359
  %spec.select3.i = select i1 %cmp97.i, i32 0, i32 %add96.i, !dbg !1359
    #dbg_value(i32 %spec.select3.i, !1208, !DIExpression(), !1205)
    #dbg_value(i32 %spec.select.i, !1209, !DIExpression(), !1205)
  %dec.i = add nsw i32 %j.0.i119, -1, !dbg !1361
    #dbg_value(i32 %dec.i, !1250, !DIExpression(), !1251)
  br label %for.cond6.i, !dbg !1362, !llvm.loop !1363

for.inc103.i:                                     ; preds = %for.cond6.i
  %words_to_shift.1.i.lcssa = phi i32 [ %words_to_shift.1.i, %for.cond6.i ], !dbg !1205
  %bits_to_shift.1.i.lcssa = phi i32 [ %bits_to_shift.1.i, %for.cond6.i ], !dbg !1205
  %inc104.i = add nuw nsw i32 %i2.0.i, 1, !dbg !1365
    #dbg_value(i32 %inc104.i, !1240, !DIExpression(), !1241)
  br label %for.cond3.i, !dbg !1366, !llvm.loop !1367

for.cond107.i:                                    ; preds = %for.cond107.i.preheader, %transpose_16x16_nibbles.exit.i
  %c106.0.i = phi i32 [ %add113.i, %transpose_16x16_nibbles.exit.i ], [ 0, %for.cond107.i.preheader ], !dbg !1369
    #dbg_value(i32 %c106.0.i, !1370, !DIExpression(), !1371)
  %cmp109.i = icmp samesign ult i32 %c106.0.i, 2016, !dbg !1372
  br i1 %cmp109.i, label %for.body110.i, label %for.end114.i, !dbg !1244

for.body110.i:                                    ; preds = %for.cond107.i
  %add.ptr111.i = getelementptr inbounds nuw i64, ptr %A.i, i32 %c106.0.i, !dbg !1374
    #dbg_value(ptr %add.ptr111.i, !1376, !DIExpression(), !1377)
    #dbg_value(i32 0, !1379, !DIExpression(), !1381)
  br label %for.cond.i31.i, !dbg !1382

for.cond.i31.i:                                   ; preds = %for.body.i35.i, %for.body110.i
  %i.0.i32.i = phi i32 [ 0, %for.body110.i ], [ %add7.i.i, %for.body.i35.i ], !dbg !1383
    #dbg_value(i32 %i.0.i32.i, !1379, !DIExpression(), !1381)
  %cmp.i33.i = icmp samesign ult i32 %i.0.i32.i, 16, !dbg !1384
  br i1 %cmp.i33.i, label %for.body.i35.i, label %for.cond9.i.i.preheader, !dbg !1386

for.cond9.i.i.preheader:                          ; preds = %for.cond.i31.i
  br label %for.cond9.i.i, !dbg !1387

for.body.i35.i:                                   ; preds = %for.cond.i31.i
  %arrayidx.i36.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %i.0.i32.i, !dbg !1389
  %29 = load i64, ptr %arrayidx.i36.i, align 8, !dbg !1389
  %shr.i.i = lshr i64 %29, 4, !dbg !1391
  %add.i.i = or disjoint i32 %i.0.i32.i, 1, !dbg !1392
  %arrayidx1.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add.i.i, !dbg !1393
  %30 = load i64, ptr %arrayidx1.i.i, align 8, !dbg !1393
  %xor.i.i = xor i64 %shr.i.i, %30, !dbg !1394
  %and.i.i = and i64 %xor.i.i, 1085102592571150095, !dbg !1395
    #dbg_value(i64 %and.i.i, !1396, !DIExpression(), !1397)
  %shl.i.i = shl nuw i64 %and.i.i, 4, !dbg !1398
  %arrayidx2.i37.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %i.0.i32.i, !dbg !1399
  %31 = load i64, ptr %arrayidx2.i37.i, align 8, !dbg !1400
  %xor3.i.i = xor i64 %31, %shl.i.i, !dbg !1400
  store i64 %xor3.i.i, ptr %arrayidx2.i37.i, align 8, !dbg !1400
  %add4.i.i = or disjoint i32 %i.0.i32.i, 1, !dbg !1401
  %arrayidx5.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add4.i.i, !dbg !1402
  %32 = load i64, ptr %arrayidx5.i.i, align 8, !dbg !1403
  %xor6.i.i = xor i64 %32, %and.i.i, !dbg !1403
  store i64 %xor6.i.i, ptr %arrayidx5.i.i, align 8, !dbg !1403
  %add7.i.i = add nuw nsw i32 %i.0.i32.i, 2, !dbg !1404
    #dbg_value(i32 %add7.i.i, !1379, !DIExpression(), !1381)
  br label %for.cond.i31.i, !dbg !1405, !llvm.loop !1406

for.cond9.i.i:                                    ; preds = %for.cond9.i.i.preheader, %for.body11.i.i
  %i8.0.i.i = phi i32 [ %add39.i.i, %for.body11.i.i ], [ 0, %for.cond9.i.i.preheader ], !dbg !1408
    #dbg_value(i32 %i8.0.i.i, !1409, !DIExpression(), !1410)
  %cmp10.i.i = icmp samesign ult i32 %i8.0.i.i, 16, !dbg !1411
  br i1 %cmp10.i.i, label %for.body11.i.i, label %for.cond42.i.i.preheader, !dbg !1387

for.cond42.i.i.preheader:                         ; preds = %for.cond9.i.i
  br label %for.cond42.i.i, !dbg !1413

for.body11.i.i:                                   ; preds = %for.cond9.i.i
  %arrayidx12.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %i8.0.i.i, !dbg !1415
  %33 = load i64, ptr %arrayidx12.i.i, align 8, !dbg !1415
  %shr13.i.i = lshr i64 %33, 8, !dbg !1417
  %add14.i.i = or disjoint i32 %i8.0.i.i, 2, !dbg !1418
  %arrayidx15.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add14.i.i, !dbg !1419
  %34 = load i64, ptr %arrayidx15.i.i, align 8, !dbg !1419
  %xor16.i.i = xor i64 %shr13.i.i, %34, !dbg !1420
  %and17.i.i = and i64 %xor16.i.i, 71777214294589695, !dbg !1421
    #dbg_value(i64 %and17.i.i, !1422, !DIExpression(), !1423)
  %add18.i.i = or disjoint i32 %i8.0.i.i, 1, !dbg !1424
  %arrayidx19.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add18.i.i, !dbg !1425
  %35 = load i64, ptr %arrayidx19.i.i, align 8, !dbg !1425
  %shr20.i.i = lshr i64 %35, 8, !dbg !1426
  %add21.i.i = or disjoint i32 %i8.0.i.i, 3, !dbg !1427
  %arrayidx22.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add21.i.i, !dbg !1428
  %36 = load i64, ptr %arrayidx22.i.i, align 8, !dbg !1428
  %xor23.i.i = xor i64 %shr20.i.i, %36, !dbg !1429
  %and24.i.i = and i64 %xor23.i.i, 71777214294589695, !dbg !1430
    #dbg_value(i64 %and24.i.i, !1431, !DIExpression(), !1423)
  %shl25.i.i = shl nuw i64 %and17.i.i, 8, !dbg !1432
  %arrayidx26.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %i8.0.i.i, !dbg !1433
  %37 = load i64, ptr %arrayidx26.i.i, align 8, !dbg !1434
  %xor27.i.i = xor i64 %37, %shl25.i.i, !dbg !1434
  store i64 %xor27.i.i, ptr %arrayidx26.i.i, align 8, !dbg !1434
  %shl28.i.i = shl nuw i64 %and24.i.i, 8, !dbg !1435
  %add29.i.i = or disjoint i32 %i8.0.i.i, 1, !dbg !1436
  %arrayidx30.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add29.i.i, !dbg !1437
  %38 = load i64, ptr %arrayidx30.i.i, align 8, !dbg !1438
  %xor31.i.i = xor i64 %38, %shl28.i.i, !dbg !1438
  store i64 %xor31.i.i, ptr %arrayidx30.i.i, align 8, !dbg !1438
  %add32.i.i = or disjoint i32 %i8.0.i.i, 2, !dbg !1439
  %arrayidx33.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add32.i.i, !dbg !1440
  %39 = load i64, ptr %arrayidx33.i.i, align 8, !dbg !1441
  %xor34.i.i = xor i64 %39, %and17.i.i, !dbg !1441
  store i64 %xor34.i.i, ptr %arrayidx33.i.i, align 8, !dbg !1441
  %add35.i.i = or disjoint i32 %i8.0.i.i, 3, !dbg !1442
  %arrayidx36.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add35.i.i, !dbg !1443
  %40 = load i64, ptr %arrayidx36.i.i, align 8, !dbg !1444
  %xor37.i.i = xor i64 %40, %and24.i.i, !dbg !1444
  store i64 %xor37.i.i, ptr %arrayidx36.i.i, align 8, !dbg !1444
  %add39.i.i = add nuw nsw i32 %i8.0.i.i, 4, !dbg !1445
    #dbg_value(i32 %add39.i.i, !1409, !DIExpression(), !1410)
  br label %for.cond9.i.i, !dbg !1446, !llvm.loop !1447

for.cond42.i.i:                                   ; preds = %for.cond42.i.i.preheader, %for.body44.i.i
  %i41.0.i.i = phi i32 [ %inc.i34.i, %for.body44.i.i ], [ 0, %for.cond42.i.i.preheader ], !dbg !1449
    #dbg_value(i32 %i41.0.i.i, !1450, !DIExpression(), !1451)
  %exitcond143 = icmp ne i32 %i41.0.i.i, 4, !dbg !1452
  br i1 %exitcond143, label %for.body44.i.i, label %for.cond76.i.i.preheader, !dbg !1413

for.cond76.i.i.preheader:                         ; preds = %for.cond42.i.i
  br label %for.cond76.i.i, !dbg !1454

for.body44.i.i:                                   ; preds = %for.cond42.i.i
  %arrayidx46.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %i41.0.i.i, !dbg !1456
  %41 = load i64, ptr %arrayidx46.i.i, align 8, !dbg !1456
  %shr47.i.i = lshr i64 %41, 16, !dbg !1458
  %add48.i.i = or disjoint i32 %i41.0.i.i, 4, !dbg !1459
  %arrayidx49.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add48.i.i, !dbg !1460
  %42 = load i64, ptr %arrayidx49.i.i, align 8, !dbg !1460
  %xor50.i.i = xor i64 %shr47.i.i, %42, !dbg !1461
  %and51.i.i = and i64 %xor50.i.i, 281470681808895, !dbg !1462
    #dbg_value(i64 %and51.i.i, !1463, !DIExpression(), !1464)
  %add53.i.i = or disjoint i32 %i41.0.i.i, 8, !dbg !1465
  %arrayidx54.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add53.i.i, !dbg !1466
  %43 = load i64, ptr %arrayidx54.i.i, align 8, !dbg !1466
  %shr55.i.i = lshr i64 %43, 16, !dbg !1467
  %add56.i.i = or disjoint i32 %i41.0.i.i, 12, !dbg !1468
  %arrayidx57.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add56.i.i, !dbg !1469
  %44 = load i64, ptr %arrayidx57.i.i, align 8, !dbg !1469
  %xor58.i.i = xor i64 %shr55.i.i, %44, !dbg !1470
  %and59.i.i = and i64 %xor58.i.i, 281470681808895, !dbg !1471
    #dbg_value(i64 %and59.i.i, !1472, !DIExpression(), !1464)
  %shl60.i.i = shl nuw i64 %and51.i.i, 16, !dbg !1473
  %arrayidx61.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %i41.0.i.i, !dbg !1474
  %45 = load i64, ptr %arrayidx61.i.i, align 8, !dbg !1475
  %xor62.i.i = xor i64 %45, %shl60.i.i, !dbg !1475
  store i64 %xor62.i.i, ptr %arrayidx61.i.i, align 8, !dbg !1475
  %shl63.i.i = shl nuw i64 %and59.i.i, 16, !dbg !1476
  %add64.i.i = or disjoint i32 %i41.0.i.i, 8, !dbg !1477
  %arrayidx65.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add64.i.i, !dbg !1478
  %46 = load i64, ptr %arrayidx65.i.i, align 8, !dbg !1479
  %xor66.i.i = xor i64 %46, %shl63.i.i, !dbg !1479
  store i64 %xor66.i.i, ptr %arrayidx65.i.i, align 8, !dbg !1479
  %add67.i.i = or disjoint i32 %i41.0.i.i, 4, !dbg !1480
  %arrayidx68.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add67.i.i, !dbg !1481
  %47 = load i64, ptr %arrayidx68.i.i, align 8, !dbg !1482
  %xor69.i.i = xor i64 %47, %and51.i.i, !dbg !1482
  store i64 %xor69.i.i, ptr %arrayidx68.i.i, align 8, !dbg !1482
  %add70.i.i = or disjoint i32 %i41.0.i.i, 12, !dbg !1483
  %arrayidx71.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add70.i.i, !dbg !1484
  %48 = load i64, ptr %arrayidx71.i.i, align 8, !dbg !1485
  %xor72.i.i = xor i64 %48, %and59.i.i, !dbg !1485
  store i64 %xor72.i.i, ptr %arrayidx71.i.i, align 8, !dbg !1485
  %inc.i34.i = add nuw nsw i32 %i41.0.i.i, 1, !dbg !1486
    #dbg_value(i32 %inc.i34.i, !1450, !DIExpression(), !1451)
  br label %for.cond42.i.i, !dbg !1487, !llvm.loop !1488

for.cond76.i.i:                                   ; preds = %for.cond76.i.i.preheader, %for.body78.i.i
  %i75.0.i.i = phi i32 [ %inc93.i.i, %for.body78.i.i ], [ 0, %for.cond76.i.i.preheader ], !dbg !1490
    #dbg_value(i32 %i75.0.i.i, !1491, !DIExpression(), !1492)
  %exitcond144 = icmp ne i32 %i75.0.i.i, 8, !dbg !1493
  br i1 %exitcond144, label %for.body78.i.i, label %transpose_16x16_nibbles.exit.i, !dbg !1454

for.body78.i.i:                                   ; preds = %for.cond76.i.i
  %arrayidx80.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %i75.0.i.i, !dbg !1495
  %49 = load i64, ptr %arrayidx80.i.i, align 8, !dbg !1495
  %shr81.i.i = lshr i64 %49, 32, !dbg !1497
  %add82.i.i = or disjoint i32 %i75.0.i.i, 8, !dbg !1498
  %arrayidx83.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add82.i.i, !dbg !1499
  %50 = load i64, ptr %arrayidx83.i.i, align 8, !dbg !1499
  %.masked.i.i = and i64 %50, 4294967295, !dbg !1500
  %and85.i.i = xor i64 %shr81.i.i, %.masked.i.i, !dbg !1500
    #dbg_value(i64 %and85.i.i, !1501, !DIExpression(), !1502)
  %shl86.i.i = shl nuw i64 %and85.i.i, 32, !dbg !1503
  %arrayidx87.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %i75.0.i.i, !dbg !1504
  %51 = load i64, ptr %arrayidx87.i.i, align 8, !dbg !1505
  %xor88.i.i = xor i64 %51, %shl86.i.i, !dbg !1505
  store i64 %xor88.i.i, ptr %arrayidx87.i.i, align 8, !dbg !1505
  %add89.i.i = or disjoint i32 %i75.0.i.i, 8, !dbg !1506
  %arrayidx90.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add89.i.i, !dbg !1507
  %52 = load i64, ptr %arrayidx90.i.i, align 8, !dbg !1508
  %xor91.i.i = xor i64 %52, %and85.i.i, !dbg !1508
  store i64 %xor91.i.i, ptr %arrayidx90.i.i, align 8, !dbg !1508
  %inc93.i.i = add nuw nsw i32 %i75.0.i.i, 1, !dbg !1509
    #dbg_value(i32 %inc93.i.i, !1491, !DIExpression(), !1492)
  br label %for.cond76.i.i, !dbg !1510, !llvm.loop !1511

transpose_16x16_nibbles.exit.i:                   ; preds = %for.cond76.i.i
  %add113.i = add nuw nsw i32 %c106.0.i, 16, !dbg !1513
    #dbg_value(i32 %add113.i, !1370, !DIExpression(), !1371)
  br label %for.cond107.i, !dbg !1514, !llvm.loop !1515

for.end114.i:                                     ; preds = %for.cond107.i
    #dbg_declare(ptr %tab.i, !1517, !DIExpression(), !1521)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(16) %tab.i, i8 0, i32 16, i1 false), !dbg !1521
    #dbg_value(i32 0, !1522, !DIExpression(), !1524)
  br label %for.cond116.i, !dbg !1525

for.cond116.i:                                    ; preds = %for.body118.i, %for.end114.i
  %i115.0.i = phi i32 [ 0, %for.end114.i ], [ %inc138.i, %for.body118.i ], !dbg !1526
    #dbg_value(i32 %i115.0.i, !1522, !DIExpression(), !1524)
  %exitcond145 = icmp ne i32 %i115.0.i, 4, !dbg !1527
  br i1 %exitcond145, label %for.body118.i, label %for.cond141.i.preheader, !dbg !1529

for.cond141.i.preheader:                          ; preds = %for.cond116.i
  br label %for.cond141.i, !dbg !1530

for.body118.i:                                    ; preds = %for.cond116.i
  %arrayidx119.i = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %i115.0.i, !dbg !1532
  %53 = load i8, ptr %arrayidx119.i, align 1, !dbg !1532
    #dbg_value(i8 %53, !1534, !DIExpression(), !1538)
    #dbg_value(i8 1, !1540, !DIExpression(), !1538)
  %54 = load volatile i8, ptr @pqmayo_MAYO_5_ref_unsigned_char_blocker, align 1, !dbg !1541
  %xor1.i4.i = xor i8 %53, %54, !dbg !1542
    #dbg_value(i8 %xor1.i4.i, !1534, !DIExpression(), !1538)
    #dbg_value(i8 poison, !1543, !DIExpression(), !1538)
    #dbg_value(i8 %xor1.i4.i, !1543, !DIExpression(DW_OP_constu, 3, DW_OP_and, DW_OP_stack_value), !1538)
    #dbg_value(i8 %xor1.i4.i, !1543, !DIExpression(DW_OP_constu, 7, DW_OP_and, DW_OP_stack_value), !1538)
  %xor25.i11.i = and i8 %xor1.i4.i, 15, !dbg !1544
    #dbg_value(i8 %xor25.i11.i, !1543, !DIExpression(), !1538)
    #dbg_value(i8 %xor25.i11.i, !1545, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !1538)
    #dbg_value(i8 %xor25.i11.i, !1546, !DIExpression(), !1538)
  %mul120.i = shl nuw nsw i32 %i115.0.i, 2, !dbg !1547
  %arrayidx121.i = getelementptr inbounds nuw [16 x i8], ptr %tab.i, i32 0, i32 %mul120.i, !dbg !1548
  store i8 %xor25.i11.i, ptr %arrayidx121.i, align 1, !dbg !1549
    #dbg_value(i8 %53, !1534, !DIExpression(), !1550)
    #dbg_value(i8 2, !1540, !DIExpression(), !1550)
  %55 = load volatile i8, ptr @pqmayo_MAYO_5_ref_unsigned_char_blocker, align 1, !dbg !1552
  %xor1.i13.i = xor i8 %53, %55, !dbg !1553
    #dbg_value(i8 %xor1.i13.i, !1534, !DIExpression(), !1550)
  %56 = trunc i8 %xor1.i13.i to i1, !dbg !1554
    #dbg_value(i8 poison, !1543, !DIExpression(), !1550)
  %57 = shl i8 %xor1.i13.i, 1, !dbg !1555
  %mul9.i14.i = and i8 %57, 4, !dbg !1555
  %conv10.i15.i = select i1 %56, i8 2, i8 0, !dbg !1554
  %xor11.i16.i = or disjoint i8 %conv10.i15.i, %mul9.i14.i, !dbg !1556
    #dbg_value(i8 %xor11.i16.i, !1543, !DIExpression(), !1550)
  %58 = shl i8 %xor1.i13.i, 1, !dbg !1557
  %mul16.i17.i = and i8 %58, 8, !dbg !1557
  %xor18.i18.i = or disjoint i8 %mul16.i17.i, %xor11.i16.i, !dbg !1558
    #dbg_value(i8 %xor18.i18.i, !1543, !DIExpression(), !1550)
  %59 = shl i8 %xor1.i13.i, 1, !dbg !1559
  %mul23.i19.i = and i8 %59, 16, !dbg !1559
    #dbg_value(!DIArgList(i8 %59, i8 %xor18.i18.i), !1543, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_constu, 16, DW_OP_and, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value), !1550)
    #dbg_value(!DIArgList(i8 %59, i8 %xor18.i18.i), !1545, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_constu, 16, DW_OP_and, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !1550)
  %60 = lshr exact i8 %mul23.i19.i, 4, !dbg !1560
  %61 = lshr exact i8 %mul23.i19.i, 3, !dbg !1561
  %62 = or disjoint i8 %60, %61, !dbg !1562
  %63 = xor i8 %62, %xor18.i18.i, !dbg !1563
    #dbg_value(i8 %63, !1546, !DIExpression(), !1550)
  %mul124.i = shl nuw nsw i32 %i115.0.i, 2, !dbg !1564
  %add125.i = or disjoint i32 %mul124.i, 1, !dbg !1565
  %arrayidx126.i = getelementptr inbounds nuw [16 x i8], ptr %tab.i, i32 0, i32 %add125.i, !dbg !1566
  store i8 %63, ptr %arrayidx126.i, align 1, !dbg !1567
  %arrayidx127.i = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %i115.0.i, !dbg !1568
  %64 = load i8, ptr %arrayidx127.i, align 1, !dbg !1568
    #dbg_value(i8 %64, !1534, !DIExpression(), !1569)
    #dbg_value(i8 4, !1540, !DIExpression(), !1569)
  %65 = load volatile i8, ptr @pqmayo_MAYO_5_ref_unsigned_char_blocker, align 1, !dbg !1571
  %xor1.i22.i = xor i8 %64, %65, !dbg !1572
    #dbg_value(i8 %xor1.i22.i, !1534, !DIExpression(), !1569)
  %66 = trunc i8 %xor1.i22.i to i1, !dbg !1573
    #dbg_value(i8 poison, !1543, !DIExpression(), !1569)
  %67 = shl i8 %xor1.i22.i, 2, !dbg !1574
  %mul9.i23.i = and i8 %67, 8, !dbg !1574
  %conv10.i24.i = select i1 %66, i8 4, i8 0, !dbg !1573
  %xor11.i25.i = or disjoint i8 %conv10.i24.i, %mul9.i23.i, !dbg !1575
    #dbg_value(!DIArgList(i8 %conv10.i24.i, i8 %mul9.i23.i), !1543, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value), !1569)
  %68 = shl i8 %xor1.i22.i, 2, !dbg !1576
  %mul16.i26.i = and i8 %68, 16, !dbg !1576
    #dbg_value(!DIArgList(i8 %mul16.i26.i, i8 %conv10.i24.i, i8 %mul9.i23.i), !1543, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_or, DW_OP_or, DW_OP_stack_value), !1569)
  %69 = shl i8 %xor1.i22.i, 2, !dbg !1577
  %mul23.i28.i = and i8 %69, 32, !dbg !1577
  %70 = or disjoint i8 %mul16.i26.i, %mul23.i28.i, !dbg !1578
    #dbg_value(!DIArgList(i8 %mul23.i28.i, i8 %mul16.i26.i, i8 %conv10.i24.i, i8 %mul9.i23.i), !1543, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_or, DW_OP_or, DW_OP_or, DW_OP_stack_value), !1569)
    #dbg_value(!DIArgList(i8 %mul23.i28.i, i8 %mul16.i26.i, i8 %conv10.i24.i, i8 %mul9.i23.i), !1545, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_or, DW_OP_or, DW_OP_or, DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !1569)
  %71 = lshr exact i8 %70, 4, !dbg !1579
  %72 = lshr exact i8 %70, 3, !dbg !1580
  %73 = xor i8 %71, %72, !dbg !1581
  %74 = xor i8 %73, %xor11.i25.i, !dbg !1582
    #dbg_value(i8 %74, !1546, !DIExpression(), !1569)
  %mul129.i = shl nuw nsw i32 %i115.0.i, 2, !dbg !1583
  %add130.i = or disjoint i32 %mul129.i, 2, !dbg !1584
  %arrayidx131.i = getelementptr inbounds nuw [16 x i8], ptr %tab.i, i32 0, i32 %add130.i, !dbg !1585
  store i8 %74, ptr %arrayidx131.i, align 1, !dbg !1586
  %arrayidx132.i = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %i115.0.i, !dbg !1587
  %75 = load i8, ptr %arrayidx132.i, align 1, !dbg !1587
    #dbg_value(i8 %75, !1534, !DIExpression(), !1588)
    #dbg_value(i8 8, !1540, !DIExpression(), !1588)
  %76 = load volatile i8, ptr @pqmayo_MAYO_5_ref_unsigned_char_blocker, align 1, !dbg !1590
  %xor1.i.i110 = xor i8 %75, %76, !dbg !1591
    #dbg_value(i8 %xor1.i.i110, !1534, !DIExpression(), !1588)
  %77 = trunc i8 %xor1.i.i110 to i1, !dbg !1592
    #dbg_value(i8 poison, !1543, !DIExpression(), !1588)
  %78 = shl i8 %xor1.i.i110, 3, !dbg !1593
  %mul9.i.i111 = and i8 %78, 16, !dbg !1593
  %conv10.i.i112 = select i1 %77, i8 8, i8 0, !dbg !1592
    #dbg_value(!DIArgList(i8 poison, i8 poison), !1543, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value), !1588)
  %79 = shl i8 %xor1.i.i110, 3, !dbg !1594
  %mul16.i.i114 = and i8 %79, 32, !dbg !1594
  %80 = or disjoint i8 %mul9.i.i111, %mul16.i.i114, !dbg !1595
    #dbg_value(!DIArgList(i8 poison, i8 poison), !1543, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value), !1588)
  %81 = shl i8 %xor1.i.i110, 3, !dbg !1596
  %mul23.i.i116 = and i8 %81, 64, !dbg !1596
  %82 = or disjoint i8 %80, %mul23.i.i116, !dbg !1597
    #dbg_value(!DIArgList(i8 poison, i8 poison, i8 poison), !1543, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_or, DW_OP_or, DW_OP_stack_value), !1588)
    #dbg_value(!DIArgList(i8 poison, i8 poison, i8 poison), !1545, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_or, DW_OP_or, DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !1588)
  %83 = lshr exact i8 %82, 4, !dbg !1598
  %84 = lshr exact i8 %82, 3, !dbg !1599
  %85 = xor i8 %83, %84, !dbg !1600
  %86 = xor i8 %85, %conv10.i.i112, !dbg !1601
    #dbg_value(i8 %86, !1546, !DIExpression(), !1588)
  %mul134.i = shl nuw nsw i32 %i115.0.i, 2, !dbg !1602
  %add135.i = or disjoint i32 %mul134.i, 3, !dbg !1603
  %arrayidx136.i = getelementptr inbounds nuw [16 x i8], ptr %tab.i, i32 0, i32 %add135.i, !dbg !1604
  store i8 %86, ptr %arrayidx136.i, align 1, !dbg !1605
  %inc138.i = add nuw nsw i32 %i115.0.i, 1, !dbg !1606
    #dbg_value(i32 %inc138.i, !1522, !DIExpression(), !1524)
  br label %for.cond116.i, !dbg !1607, !llvm.loop !1608

for.cond141.i:                                    ; preds = %for.cond141.i.preheader, %for.inc203.i
  %c140.0.i = phi i32 [ %add204.i, %for.inc203.i ], [ 0, %for.cond141.i.preheader ], !dbg !1610
    #dbg_value(i32 %c140.0.i, !1611, !DIExpression(), !1612)
  %cmp142.i = icmp samesign ult i32 %c140.0.i, 144, !dbg !1613
  br i1 %cmp142.i, label %for.cond144.i.preheader, label %for.cond207.i.preheader, !dbg !1530

for.cond207.i.preheader:                          ; preds = %for.cond141.i
  br label %for.cond207.i, !dbg !1615

for.cond144.i.preheader:                          ; preds = %for.cond141.i
  br label %for.cond144.i, !dbg !1617

for.cond144.i:                                    ; preds = %for.cond144.i.preheader, %for.inc200.i
  %r.0.i109 = phi i32 [ %inc201.i, %for.inc200.i ], [ 142, %for.cond144.i.preheader ], !dbg !1620
    #dbg_value(i32 %r.0.i109, !1621, !DIExpression(), !1622)
  %exitcond147 = icmp ne i32 %r.0.i109, 220, !dbg !1623
  br i1 %exitcond147, label %for.body146.i, label %for.inc203.i, !dbg !1617

for.body146.i:                                    ; preds = %for.cond144.i
  %div1.i = lshr i32 %r.0.i109, 4, !dbg !1625
  %mul147.i = mul nuw nsw i32 %div1.i, 144, !dbg !1627
  %add148.i = add nuw nsw i32 %mul147.i, %c140.0.i, !dbg !1628
  %rem.i = and i32 %r.0.i109, 15, !dbg !1629
  %add149.i = or disjoint i32 %add148.i, %rem.i, !dbg !1630
    #dbg_value(i32 %add149.i, !1631, !DIExpression(), !1632)
  %arrayidx150.i = getelementptr inbounds nuw [2592 x i64], ptr %A.i, i32 0, i32 %add149.i, !dbg !1633
  %87 = load i64, ptr %arrayidx150.i, align 8, !dbg !1633
  %and151.i = and i64 %87, 1229782938247303441, !dbg !1634
    #dbg_value(i64 %and151.i, !1635, !DIExpression(), !1632)
  %shr153.i = lshr i64 %87, 1, !dbg !1636
  %and154.i = and i64 %shr153.i, 1229782938247303441, !dbg !1637
    #dbg_value(i64 %and154.i, !1638, !DIExpression(), !1632)
  %shr156.i = lshr i64 %87, 2, !dbg !1639
  %and157.i = and i64 %shr156.i, 1229782938247303441, !dbg !1640
    #dbg_value(i64 %and157.i, !1641, !DIExpression(), !1632)
  %arrayidx158.i = getelementptr inbounds nuw [2592 x i64], ptr %A.i, i32 0, i32 %add149.i, !dbg !1642
  %88 = load i64, ptr %arrayidx158.i, align 8, !dbg !1642
  %shr159.i = lshr i64 %88, 3, !dbg !1643
  %and160.i = and i64 %shr159.i, 1229782938247303441, !dbg !1644
    #dbg_value(i64 %and160.i, !1645, !DIExpression(), !1632)
    #dbg_value(i32 0, !1646, !DIExpression(), !1648)
  br label %for.cond161.i, !dbg !1649

for.cond161.i:                                    ; preds = %for.body163.i, %for.body146.i
  %t.0.i = phi i32 [ 0, %for.body146.i ], [ %inc198.i, %for.body163.i ], !dbg !1650
    #dbg_value(i32 %t.0.i, !1646, !DIExpression(), !1648)
  %exitcond146 = icmp ne i32 %t.0.i, 4, !dbg !1651
  br i1 %exitcond146, label %for.body163.i, label %for.inc200.i, !dbg !1653

for.body163.i:                                    ; preds = %for.cond161.i
  %mul164.i = shl nuw nsw i32 %t.0.i, 2, !dbg !1654
  %arrayidx166.i = getelementptr inbounds nuw [16 x i8], ptr %tab.i, i32 0, i32 %mul164.i, !dbg !1656
  %89 = load i8, ptr %arrayidx166.i, align 1, !dbg !1656
  %conv.i = zext i8 %89 to i64, !dbg !1656
  %mul167.i = mul i64 %and151.i, %conv.i, !dbg !1657
  %mul168.i = shl nuw nsw i32 %t.0.i, 2, !dbg !1658
  %add169.i = or disjoint i32 %mul168.i, 1, !dbg !1659
  %arrayidx170.i = getelementptr inbounds nuw [16 x i8], ptr %tab.i, i32 0, i32 %add169.i, !dbg !1660
  %90 = load i8, ptr %arrayidx170.i, align 1, !dbg !1660
  %conv171.i = zext i8 %90 to i64, !dbg !1660
  %mul172.i = mul i64 %and154.i, %conv171.i, !dbg !1661
  %xor173.i = xor i64 %mul167.i, %mul172.i, !dbg !1662
  %mul174.i = shl nuw nsw i32 %t.0.i, 2, !dbg !1663
  %add175.i = or disjoint i32 %mul174.i, 2, !dbg !1664
  %arrayidx176.i = getelementptr inbounds nuw [16 x i8], ptr %tab.i, i32 0, i32 %add175.i, !dbg !1665
  %91 = load i8, ptr %arrayidx176.i, align 1, !dbg !1665
  %conv177.i = zext i8 %91 to i64, !dbg !1665
  %mul178.i = mul i64 %and157.i, %conv177.i, !dbg !1666
  %xor179.i = xor i64 %xor173.i, %mul178.i, !dbg !1667
  %mul180.i = shl nuw nsw i32 %t.0.i, 2, !dbg !1668
  %add181.i = or disjoint i32 %mul180.i, 3, !dbg !1669
  %arrayidx182.i = getelementptr inbounds nuw [16 x i8], ptr %tab.i, i32 0, i32 %add181.i, !dbg !1670
  %92 = load i8, ptr %arrayidx182.i, align 1, !dbg !1670
  %conv183.i = zext i8 %92 to i64, !dbg !1670
  %mul184.i = mul i64 %and160.i, %conv183.i, !dbg !1671
  %xor185.i = xor i64 %xor179.i, %mul184.i, !dbg !1672
  %add186.i = add nuw nsw i32 %r.0.i109, %t.0.i, !dbg !1673
  %sub187.i = add nsw i32 %add186.i, -142, !dbg !1674
  %div1882.i = lshr i32 %sub187.i, 4, !dbg !1675
  %mul189.i = mul i32 %div1882.i, 144, !dbg !1676
  %add190.i = add i32 %mul189.i, %c140.0.i, !dbg !1677
  %add191.i = add nuw nsw i32 %r.0.i109, %t.0.i, !dbg !1678
  %sub192.i = add nuw nsw i32 %add191.i, 2, !dbg !1679
  %rem193.i = and i32 %sub192.i, 15, !dbg !1680
  %add194.i = or disjoint i32 %add190.i, %rem193.i, !dbg !1681
  %arrayidx195.i = getelementptr inbounds nuw [2592 x i64], ptr %A.i, i32 0, i32 %add194.i, !dbg !1682
  %93 = load i64, ptr %arrayidx195.i, align 8, !dbg !1683
  %xor196.i = xor i64 %93, %xor185.i, !dbg !1683
  store i64 %xor196.i, ptr %arrayidx195.i, align 8, !dbg !1683
  %inc198.i = add nuw nsw i32 %t.0.i, 1, !dbg !1684
    #dbg_value(i32 %inc198.i, !1646, !DIExpression(), !1648)
  br label %for.cond161.i, !dbg !1685, !llvm.loop !1686

for.inc200.i:                                     ; preds = %for.cond161.i
  %inc201.i = add nuw nsw i32 %r.0.i109, 1, !dbg !1688
    #dbg_value(i32 %inc201.i, !1621, !DIExpression(), !1622)
  br label %for.cond144.i, !dbg !1689, !llvm.loop !1690

for.inc203.i:                                     ; preds = %for.cond144.i
  %add204.i = add nuw nsw i32 %c140.0.i, 16, !dbg !1692
    #dbg_value(i32 %add204.i, !1611, !DIExpression(), !1612)
  br label %for.cond141.i, !dbg !1693, !llvm.loop !1694

for.cond207.i:                                    ; preds = %for.cond207.i.preheader, %for.inc241.i
  %indvars.iv148 = phi i32 [ 142, %for.cond207.i.preheader ], [ %indvars.iv.next149, %for.inc241.i ], !dbg !1696
  %r206.0.i = phi i32 [ %add242.i, %for.inc241.i ], [ 0, %for.cond207.i.preheader ], !dbg !1696
    #dbg_value(i32 %r206.0.i, !1697, !DIExpression(), !1698)
  %cmp208.i = icmp samesign ult i32 %r206.0.i, 142, !dbg !1699
  br i1 %cmp208.i, label %for.cond212.i.preheader, label %compute_A.exit, !dbg !1615

for.cond212.i.preheader:                          ; preds = %for.cond207.i
  br label %for.cond212.i, !dbg !1701

for.cond212.i:                                    ; preds = %for.cond212.i.preheader, %for.inc238.i
  %c211.0.i = phi i32 [ %add239.i, %for.inc238.i ], [ 0, %for.cond212.i.preheader ], !dbg !1704
    #dbg_value(i32 %c211.0.i, !1705, !DIExpression(), !1706)
  %cmp213.i = icmp samesign ult i32 %c211.0.i, 144, !dbg !1707
  br i1 %cmp213.i, label %for.cond217.i.preheader, label %for.inc241.i, !dbg !1701

for.cond217.i.preheader:                          ; preds = %for.cond212.i
  br label %for.cond217.i, !dbg !1709

for.cond217.i:                                    ; preds = %for.cond217.i.preheader, %decode.exit.i
  %i216.0.i = phi i32 [ %inc236.i, %decode.exit.i ], [ 0, %for.cond217.i.preheader ], !dbg !1712
    #dbg_value(i32 %i216.0.i, !1713, !DIExpression(), !1714)
  %exitcond150 = icmp ne i32 %i216.0.i, %indvars.iv148, !dbg !1715
  br i1 %exitcond150, label %for.body221.i, label %for.inc238.i, !dbg !1709

for.body221.i:                                    ; preds = %for.cond217.i
  %div223.i = mul nuw nsw i32 %r206.0.i, 9, !dbg !1717
  %add224.i = add nuw nsw i32 %div223.i, %c211.0.i, !dbg !1719
  %add225.i = add nuw nsw i32 %add224.i, %i216.0.i, !dbg !1720
  %arrayidx226.i = getelementptr inbounds nuw [2592 x i64], ptr %A.i, i32 0, i32 %add225.i, !dbg !1721
  %add227.i = add nuw nsw i32 %r206.0.i, %i216.0.i, !dbg !1722
  %mul228.i = mul nuw nsw i32 %add227.i, 145, !dbg !1723
  %add.ptr229.i = getelementptr inbounds nuw i8, ptr %A, i32 %mul228.i, !dbg !1724
  %add.ptr230.i = getelementptr inbounds nuw i8, ptr %add.ptr229.i, i32 %c211.0.i, !dbg !1725
  %cmp232.i = icmp samesign ult i32 %c211.0.i, 128, !dbg !1726
  %sub234.i = sub nuw nsw i32 144, %c211.0.i, !dbg !1726
    #dbg_value(ptr %arrayidx226.i, !434, !DIExpression(), !1727)
    #dbg_value(ptr %add.ptr230.i, !440, !DIExpression(), !1727)
    #dbg_value(i32 poison, !441, !DIExpression(), !1727)
    #dbg_value(i32 0, !442, !DIExpression(), !1727)
  br label %for.cond.i.i103, !dbg !1729

for.cond.i.i103:                                  ; preds = %for.body.i.i106, %for.body221.i
  %mdec.addr.0.i.i = phi ptr [ %add.ptr230.i, %for.body221.i ], [ %incdec.ptr5.i.i, %for.body.i.i106 ]
  %i.0.i.i104 = phi i32 [ 0, %for.body221.i ], [ %inc.i.i108, %for.body.i.i106 ], !dbg !1730
    #dbg_value(i32 %i.0.i.i104, !442, !DIExpression(), !1727)
    #dbg_value(ptr %mdec.addr.0.i.i, !440, !DIExpression(), !1727)
  %94 = ashr exact i32 %sub234.i, 1, !dbg !1731
  %div.i.i = select i1 %cmp232.i, i32 8, i32 %94, !dbg !1726
  %cmp.i.i105 = icmp slt i32 %i.0.i.i104, %div.i.i, !dbg !1732
  br i1 %cmp.i.i105, label %for.body.i.i106, label %decode.exit.i, !dbg !1733

for.body.i.i106:                                  ; preds = %for.cond.i.i103
  %arrayidx.i.i107 = getelementptr inbounds nuw i8, ptr %arrayidx226.i, i32 %i.0.i.i104, !dbg !1734
  %95 = load i8, ptr %arrayidx.i.i107, align 1, !dbg !1734
  %96 = and i8 %95, 15, !dbg !1735
  %incdec.ptr.i.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i.i, i32 1, !dbg !1736
    #dbg_value(ptr %incdec.ptr.i.i, !440, !DIExpression(), !1727)
  store i8 %96, ptr %mdec.addr.0.i.i, align 1, !dbg !1737
  %97 = lshr i8 %95, 4, !dbg !1738
    #dbg_value(ptr %incdec.ptr.i.i, !440, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1727)
  store i8 %97, ptr %incdec.ptr.i.i, align 1, !dbg !1739
  %incdec.ptr5.i.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i.i, i32 2, !dbg !1740
    #dbg_value(ptr %incdec.ptr5.i.i, !440, !DIExpression(), !1727)
  %inc.i.i108 = add nuw nsw i32 %i.0.i.i104, 1, !dbg !1741
    #dbg_value(i32 %inc.i.i108, !442, !DIExpression(), !1727)
  br label %for.cond.i.i103, !dbg !1742, !llvm.loop !1743

decode.exit.i:                                    ; preds = %for.cond.i.i103
  %inc236.i = add nuw nsw i32 %i216.0.i, 1, !dbg !1745
    #dbg_value(i32 %inc236.i, !1713, !DIExpression(), !1714)
  br label %for.cond217.i, !dbg !1746, !llvm.loop !1747

for.inc238.i:                                     ; preds = %for.cond217.i
  %add239.i = add nuw nsw i32 %c211.0.i, 16, !dbg !1749
    #dbg_value(i32 %add239.i, !1705, !DIExpression(), !1706)
  br label %for.cond212.i, !dbg !1750, !llvm.loop !1751

for.inc241.i:                                     ; preds = %for.cond212.i
  %add242.i = add nuw nsw i32 %r206.0.i, 16, !dbg !1753
    #dbg_value(i32 %add242.i, !1697, !DIExpression(), !1698)
  %indvars.iv.next149 = add nsw i32 %indvars.iv148, -16, !dbg !1754
  br label %for.cond207.i, !dbg !1754, !llvm.loop !1755

compute_A.exit:                                   ; preds = %for.cond207.i
  call void @llvm.lifetime.end.p0(i64 20736, ptr nonnull %A.i), !dbg !1757
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %tab.i), !dbg !1757
    #dbg_value(i32 0, !1758, !DIExpression(), !1760)
  br label %for.cond52, !dbg !1761

for.cond52:                                       ; preds = %for.body55, %compute_A.exit
  %i51.0 = phi i32 [ 0, %compute_A.exit ], [ %inc58, %for.body55 ], !dbg !1762
    #dbg_value(i32 %i51.0, !1758, !DIExpression(), !1760)
  %exitcond151 = icmp ne i32 %i51.0, 142, !dbg !1763
  br i1 %exitcond151, label %for.body55, label %for.end59, !dbg !1765

for.body55:                                       ; preds = %for.cond52
  %98 = mul nuw nsw i32 %i51.0, 145, !dbg !1766
  %sub = add nuw nsw i32 %98, 144, !dbg !1768
  %arrayidx = getelementptr inbounds nuw [20880 x i8], ptr %A, i32 0, i32 %sub, !dbg !1769
  store i8 0, ptr %arrayidx, align 1, !dbg !1770
  %inc58 = add nuw nsw i32 %i51.0, 1, !dbg !1771
    #dbg_value(i32 %inc58, !1758, !DIExpression(), !1760)
  br label %for.cond52, !dbg !1772, !llvm.loop !1773

for.end59:                                        ; preds = %for.cond52
  %add.ptr61 = getelementptr inbounds nuw i8, ptr %V, i32 852, !dbg !1775
    #dbg_value(ptr %add.ptr61, !434, !DIExpression(), !1776)
    #dbg_value(ptr %r, !440, !DIExpression(), !1776)
    #dbg_value(i32 144, !441, !DIExpression(), !1776)
    #dbg_value(i32 0, !442, !DIExpression(), !1776)
  br label %for.cond.i6, !dbg !1778

for.cond.i6:                                      ; preds = %for.body.i9, %for.end59
  %mdec.addr.0.i = phi ptr [ %r, %for.end59 ], [ %incdec.ptr5.i, %for.body.i9 ]
  %i.0.i7 = phi i32 [ 0, %for.end59 ], [ %inc.i11, %for.body.i9 ], !dbg !1779
    #dbg_value(i32 %i.0.i7, !442, !DIExpression(), !1776)
    #dbg_value(ptr %mdec.addr.0.i, !440, !DIExpression(), !1776)
  %exitcond152 = icmp ne i32 %i.0.i7, 72, !dbg !1780
  br i1 %exitcond152, label %for.body.i9, label %decode.exit, !dbg !1781

for.body.i9:                                      ; preds = %for.cond.i6
  %arrayidx.i10 = getelementptr inbounds nuw i8, ptr %add.ptr61, i32 %i.0.i7, !dbg !1782
  %99 = load i8, ptr %arrayidx.i10, align 1, !dbg !1782
  %100 = and i8 %99, 15, !dbg !1783
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i, i32 1, !dbg !1784
    #dbg_value(ptr %incdec.ptr.i, !440, !DIExpression(), !1776)
  store i8 %100, ptr %mdec.addr.0.i, align 1, !dbg !1785
  %101 = lshr i8 %99, 4, !dbg !1786
    #dbg_value(ptr %incdec.ptr.i, !440, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1776)
  store i8 %101, ptr %incdec.ptr.i, align 1, !dbg !1787
  %incdec.ptr5.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i, i32 2, !dbg !1788
    #dbg_value(ptr %incdec.ptr5.i, !440, !DIExpression(), !1776)
  %inc.i11 = add nuw nsw i32 %i.0.i7, 1, !dbg !1789
    #dbg_value(i32 %inc.i11, !442, !DIExpression(), !1776)
  br label %for.cond.i6, !dbg !1790, !llvm.loop !1791

decode.exit:                                      ; preds = %for.cond.i6
  %call67 = call i32 @pqmayo_MAYO_5_ref_sample_solution(ptr noundef %p, ptr noundef nonnull %A, ptr noundef nonnull %y, ptr noundef nonnull %r, ptr noundef nonnull %x, i32 noundef 12, i32 noundef 12, i32 noundef 142, i32 noundef 145) #9, !dbg !1793
  %tobool.not = icmp eq i32 %call67, 0, !dbg !1793
  br i1 %tobool.not, label %if.else, label %for.end76, !dbg !1793

if.else:                                          ; preds = %decode.exit
  %call70 = call ptr @memset(ptr noundef nonnull %Mtmp, i32 noundef 0, i32 noundef 10368) #8, !dbg !1795
  %call72 = call ptr @memset(ptr noundef nonnull %A, i32 noundef 0, i32 noundef 20880) #8, !dbg !1797
  %inc75 = add nuw nsw i32 %ctr.0, 1, !dbg !1798
    #dbg_value(i32 %inc75, !980, !DIExpression(), !981)
  br label %for.cond, !dbg !1799, !llvm.loop !1800

for.end76:                                        ; preds = %decode.exit, %for.cond
    #dbg_value(i32 0, !1802, !DIExpression(), !1804)
  br label %for.cond78, !dbg !1805

for.cond78:                                       ; preds = %mat_add.exit, %for.end76
  %i77.0 = phi i32 [ 0, %for.end76 ], [ %inc103, %mat_add.exit ], !dbg !1806
    #dbg_value(i32 %i77.0, !1802, !DIExpression(), !1804)
  %exitcond157 = icmp ne i32 %i77.0, 12, !dbg !1807
  br i1 %exitcond157, label %for.body81, label %for.cond.i.preheader, !dbg !1809

for.cond.i.preheader:                             ; preds = %for.cond78
  br label %for.cond.i, !dbg !1810

for.body81:                                       ; preds = %for.cond78
  %mul83 = mul nuw nsw i32 %i77.0, 142, !dbg !1814
    #dbg_value(ptr %add.ptr84, !1816, !DIExpression(), !871)
  %O = getelementptr inbounds nuw i8, ptr %sk, i32 853704, !dbg !1817
  %mul87 = mul nuw nsw i32 %i77.0, 12, !dbg !1818
  %add.ptr88 = getelementptr inbounds nuw i8, ptr %x, i32 %mul87, !dbg !1819
    #dbg_value(ptr %O, !1820, !DIExpression(), !1824)
    #dbg_value(ptr %add.ptr88, !1826, !DIExpression(), !1824)
    #dbg_value(ptr %Ox, !1827, !DIExpression(), !1824)
    #dbg_value(i32 12, !1828, !DIExpression(), !1824)
    #dbg_value(i32 142, !1829, !DIExpression(), !1824)
    #dbg_value(i32 1, !1830, !DIExpression(), !1824)
    #dbg_value(i32 0, !1831, !DIExpression(), !1833)
  br label %for.cond.i88, !dbg !1834

for.cond.i88:                                     ; preds = %for.inc4.i, %for.body81
  %i.0.i89 = phi i32 [ 0, %for.body81 ], [ %inc5.i, %for.inc4.i ], !dbg !1835
  %c.addr.0.i = phi ptr [ %Ox, %for.body81 ], [ %c.addr.1.i.lcssa, %for.inc4.i ]
  %a.addr.0.i = phi ptr [ %O, %for.body81 ], [ %add.ptr6.i94, %for.inc4.i ]
    #dbg_value(ptr %a.addr.0.i, !1820, !DIExpression(), !1824)
    #dbg_value(ptr %c.addr.0.i, !1827, !DIExpression(), !1824)
    #dbg_value(i32 %i.0.i89, !1831, !DIExpression(), !1833)
  %exitcond155 = icmp ne i32 %i.0.i89, 142, !dbg !1836
  br i1 %exitcond155, label %for.cond1.i91.preheader, label %mat_mul.exit, !dbg !1838

for.cond1.i91.preheader:                          ; preds = %for.cond.i88
  br label %for.cond1.i91, !dbg !1839

for.cond1.i91:                                    ; preds = %for.cond1.i91.preheader, %lincomb.exit.i
  %c.addr.1.i = phi ptr [ %incdec.ptr.i98, %lincomb.exit.i ], [ %c.addr.0.i, %for.cond1.i91.preheader ]
  %j.0.i92 = phi i32 [ 1, %lincomb.exit.i ], [ 0, %for.cond1.i91.preheader ], !dbg !1842
    #dbg_value(i32 poison, !1843, !DIExpression(), !1844)
    #dbg_value(ptr %c.addr.1.i, !1827, !DIExpression(), !1824)
  %cmp2.i93 = icmp eq i32 %j.0.i92, 0, !dbg !1845
  br i1 %cmp2.i93, label %for.body3.i95, label %for.inc4.i, !dbg !1839

for.body3.i95:                                    ; preds = %for.cond1.i91
  %add.ptr.i96 = getelementptr inbounds nuw i8, ptr %add.ptr88, i32 %j.0.i92, !dbg !1847
    #dbg_value(ptr %a.addr.0.i, !1849, !DIExpression(), !1853)
    #dbg_value(ptr %add.ptr.i96, !1855, !DIExpression(), !1853)
    #dbg_value(i32 12, !1856, !DIExpression(), !1853)
    #dbg_value(i32 1, !1857, !DIExpression(), !1853)
    #dbg_value(i8 0, !1858, !DIExpression(), !1853)
    #dbg_value(i32 0, !1859, !DIExpression(), !1861)
  br label %for.cond.i.i, !dbg !1862

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body3.i95
  %ret.0.i.i = phi i8 [ 0, %for.body3.i95 ], [ %xor1.i.i.i, %for.body.i.i ], !dbg !1853
  %b.addr.0.i.i = phi ptr [ %add.ptr.i96, %for.body3.i95 ], [ %add.ptr.i.i, %for.body.i.i ]
  %i.0.i.i = phi i32 [ 0, %for.body3.i95 ], [ %inc.i.i, %for.body.i.i ], !dbg !1863
    #dbg_value(i32 %i.0.i.i, !1859, !DIExpression(), !1861)
    #dbg_value(ptr %b.addr.0.i.i, !1855, !DIExpression(), !1853)
    #dbg_value(i8 %ret.0.i.i, !1858, !DIExpression(), !1853)
  %exitcond154 = icmp ne i32 %i.0.i.i, 12, !dbg !1864
  br i1 %exitcond154, label %for.body.i.i, label %lincomb.exit.i, !dbg !1866

for.body.i.i:                                     ; preds = %for.cond.i.i
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %a.addr.0.i, i32 %i.0.i.i, !dbg !1867
  %102 = load i8, ptr %arrayidx.i.i, align 1, !dbg !1867
  %103 = load i8, ptr %b.addr.0.i.i, align 1, !dbg !1869
    #dbg_value(i8 %102, !1534, !DIExpression(), !1870)
    #dbg_value(i8 %103, !1540, !DIExpression(), !1870)
  %104 = load volatile i8, ptr @pqmayo_MAYO_5_ref_unsigned_char_blocker, align 1, !dbg !1872
  %xor1.i.i99 = xor i8 %102, %104, !dbg !1873
    #dbg_value(i8 %xor1.i.i99, !1534, !DIExpression(), !1870)
  %105 = trunc i8 %xor1.i.i99 to i1, !dbg !1874
    #dbg_value(i8 poison, !1543, !DIExpression(), !1870)
  %106 = and i8 %xor1.i.i99, 2, !dbg !1875
  %mul9.i.i = mul i8 %106, %103, !dbg !1876
  %conv10.i.i = select i1 %105, i8 %103, i8 0, !dbg !1874
  %xor11.i.i = xor i8 %conv10.i.i, %mul9.i.i, !dbg !1877
    #dbg_value(i8 %xor11.i.i, !1543, !DIExpression(), !1870)
  %107 = and i8 %xor1.i.i99, 4, !dbg !1878
  %mul16.i.i = mul i8 %107, %103, !dbg !1879
  %xor18.i.i = xor i8 %mul16.i.i, %xor11.i.i, !dbg !1880
    #dbg_value(i8 %xor18.i.i, !1543, !DIExpression(), !1870)
  %108 = and i8 %xor1.i.i99, 8, !dbg !1881
  %mul23.i.i = mul i8 %108, %103, !dbg !1882
  %xor25.i.i = xor i8 %mul23.i.i, %xor18.i.i, !dbg !1883
    #dbg_value(i8 %xor25.i.i, !1543, !DIExpression(), !1870)
    #dbg_value(i8 %xor25.i.i, !1545, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !1870)
  %109 = lshr i8 %xor25.i.i, 4, !dbg !1884
  %110 = lshr i8 %xor25.i.i, 3, !dbg !1885
  %111 = and i8 %110, 14, !dbg !1885
  %112 = xor i8 %109, %111, !dbg !1886
  %xor25.masked.i.i = and i8 %xor25.i.i, 15, !dbg !1887
  %113 = xor i8 %112, %xor25.masked.i.i, !dbg !1887
    #dbg_value(i8 %113, !1546, !DIExpression(), !1870)
    #dbg_value(i8 %113, !1888, !DIExpression(), !1890)
    #dbg_value(i8 %ret.0.i.i, !1892, !DIExpression(), !1890)
  %xor1.i.i.i = xor i8 %113, %ret.0.i.i, !dbg !1893
    #dbg_value(i8 %xor1.i.i.i, !1858, !DIExpression(), !1853)
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !1894
    #dbg_value(i32 %inc.i.i, !1859, !DIExpression(), !1861)
  %add.ptr.i.i = getelementptr inbounds nuw i8, ptr %b.addr.0.i.i, i32 1, !dbg !1895
    #dbg_value(ptr %add.ptr.i.i, !1855, !DIExpression(), !1853)
  br label %for.cond.i.i, !dbg !1896, !llvm.loop !1897

lincomb.exit.i:                                   ; preds = %for.cond.i.i
  %ret.0.i.i.lcssa = phi i8 [ %ret.0.i.i, %for.cond.i.i ], !dbg !1853
  store i8 %ret.0.i.i.lcssa, ptr %c.addr.1.i, align 1, !dbg !1899
    #dbg_value(i32 1, !1843, !DIExpression(), !1844)
  %incdec.ptr.i98 = getelementptr inbounds nuw i8, ptr %c.addr.1.i, i32 1, !dbg !1900
    #dbg_value(ptr %incdec.ptr.i98, !1827, !DIExpression(), !1824)
  br label %for.cond1.i91, !dbg !1901, !llvm.loop !1902

for.inc4.i:                                       ; preds = %for.cond1.i91
  %c.addr.1.i.lcssa = phi ptr [ %c.addr.1.i, %for.cond1.i91 ]
  %inc5.i = add nuw nsw i32 %i.0.i89, 1, !dbg !1904
    #dbg_value(i32 %inc5.i, !1831, !DIExpression(), !1833)
  %add.ptr6.i94 = getelementptr inbounds nuw i8, ptr %a.addr.0.i, i32 12, !dbg !1905
    #dbg_value(ptr %add.ptr6.i94, !1820, !DIExpression(), !1824)
  br label %for.cond.i88, !dbg !1906, !llvm.loop !1907

mat_mul.exit:                                     ; preds = %for.cond.i88
  %add.ptr84 = getelementptr inbounds nuw i8, ptr %Vdec, i32 %mul83, !dbg !1909
  %mul92 = mul nuw nsw i32 %i77.0, 154, !dbg !1910
  %add.ptr93 = getelementptr inbounds nuw i8, ptr %s, i32 %mul92, !dbg !1911
    #dbg_value(ptr %add.ptr84, !1912, !DIExpression(), !1916)
    #dbg_value(ptr %Ox, !1918, !DIExpression(), !1916)
    #dbg_value(ptr %add.ptr93, !1919, !DIExpression(), !1916)
    #dbg_value(i32 142, !1920, !DIExpression(), !1916)
    #dbg_value(i32 1, !1921, !DIExpression(), !1916)
    #dbg_value(i32 0, !1922, !DIExpression(), !1924)
  br label %for.cond.i1, !dbg !1925

for.cond.i1:                                      ; preds = %for.inc11.i, %mat_mul.exit
  %i.0.i2 = phi i32 [ 0, %mat_mul.exit ], [ %inc12.i, %for.inc11.i ], !dbg !1926
    #dbg_value(i32 %i.0.i2, !1922, !DIExpression(), !1924)
  %exitcond156 = icmp ne i32 %i.0.i2, 142, !dbg !1927
  br i1 %exitcond156, label %for.cond1.i.preheader, label %mat_add.exit, !dbg !1929

for.cond1.i.preheader:                            ; preds = %for.cond.i1
  br label %for.cond1.i, !dbg !1930

for.cond1.i:                                      ; preds = %for.cond1.i.preheader, %for.body3.i
  %j.0.i = phi i32 [ 1, %for.body3.i ], [ 0, %for.cond1.i.preheader ], !dbg !1933
    #dbg_value(i32 poison, !1934, !DIExpression(), !1935)
  %cmp2.i = icmp eq i32 %j.0.i, 0, !dbg !1936
  br i1 %cmp2.i, label %for.body3.i, label %for.inc11.i, !dbg !1930

for.body3.i:                                      ; preds = %for.cond1.i
  %add.ptr.i4 = getelementptr inbounds nuw i8, ptr %add.ptr84, i32 %i.0.i2, !dbg !1938
  %add.ptr4.i = getelementptr inbounds nuw i8, ptr %add.ptr.i4, i32 %j.0.i, !dbg !1940
  %114 = load i8, ptr %add.ptr4.i, align 1, !dbg !1941
  %add.ptr6.i = getelementptr inbounds nuw i8, ptr %Ox, i32 %i.0.i2, !dbg !1942
  %add.ptr7.i = getelementptr inbounds nuw i8, ptr %add.ptr6.i, i32 %j.0.i, !dbg !1943
  %115 = load i8, ptr %add.ptr7.i, align 1, !dbg !1944
    #dbg_value(i8 %114, !1888, !DIExpression(), !1945)
    #dbg_value(i8 %115, !1892, !DIExpression(), !1945)
  %xor1.i.i = xor i8 %114, %115, !dbg !1947
  %add.ptr9.i = getelementptr inbounds nuw i8, ptr %add.ptr93, i32 %i.0.i2, !dbg !1948
  %add.ptr10.i = getelementptr inbounds nuw i8, ptr %add.ptr9.i, i32 %j.0.i, !dbg !1949
  store i8 %xor1.i.i, ptr %add.ptr10.i, align 1, !dbg !1950
    #dbg_value(i32 1, !1934, !DIExpression(), !1935)
  br label %for.cond1.i, !dbg !1951, !llvm.loop !1952

for.inc11.i:                                      ; preds = %for.cond1.i
  %inc12.i = add nuw nsw i32 %i.0.i2, 1, !dbg !1954
    #dbg_value(i32 %inc12.i, !1922, !DIExpression(), !1924)
  br label %for.cond.i1, !dbg !1955, !llvm.loop !1956

mat_add.exit:                                     ; preds = %for.cond.i1
  %mul95 = mul nuw nsw i32 %i77.0, 154, !dbg !1958
  %add.ptr96 = getelementptr inbounds nuw i8, ptr %s, i32 %mul95, !dbg !1959
  %add.ptr97 = getelementptr inbounds nuw i8, ptr %add.ptr96, i32 142, !dbg !1960
  %mul99 = mul nuw nsw i32 %i77.0, 12, !dbg !1961
  %add.ptr100 = getelementptr inbounds nuw i8, ptr %x, i32 %mul99, !dbg !1962
  %call101 = call ptr @memcpy(ptr noundef nonnull %add.ptr97, ptr noundef nonnull %add.ptr100, i32 noundef 12) #8, !dbg !1963
  %inc103 = add nuw nsw i32 %i77.0, 1, !dbg !1964
    #dbg_value(i32 %inc103, !1802, !DIExpression(), !1804)
  br label %for.cond78, !dbg !1965, !llvm.loop !1966

for.cond.i:                                       ; preds = %for.cond.i.preheader, %for.body.i
  %i.0.i = phi i32 [ %inc.i, %for.body.i ], [ 0, %for.cond.i.preheader ], !dbg !1968
  %m.addr.0.i = phi ptr [ %add.ptr3.i, %for.body.i ], [ %s, %for.cond.i.preheader ]
    #dbg_value(ptr %m.addr.0.i, !1969, !DIExpression(), !1970)
    #dbg_value(i32 %i.0.i, !1971, !DIExpression(), !1970)
  %exitcond158 = icmp ne i32 %i.0.i, 924, !dbg !1972
  br i1 %exitcond158, label %for.body.i, label %encode.exit, !dbg !1810

for.body.i:                                       ; preds = %for.cond.i
  %116 = load i8, ptr %m.addr.0.i, align 1, !dbg !1974
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %m.addr.0.i, i32 1, !dbg !1976
  %117 = load i8, ptr %add.ptr.i, align 1, !dbg !1977
  %shl.i = shl i8 %117, 4, !dbg !1978
  %or.i = or i8 %shl.i, %116, !dbg !1979
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %sig, i32 %i.0.i, !dbg !1980
  store i8 %or.i, ptr %arrayidx.i, align 1, !dbg !1981
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !1982
    #dbg_value(i32 %inc.i, !1971, !DIExpression(), !1970)
  %add.ptr3.i = getelementptr inbounds nuw i8, ptr %m.addr.0.i, i32 2, !dbg !1983
    #dbg_value(ptr %add.ptr3.i, !1969, !DIExpression(), !1970)
  br label %for.cond.i, !dbg !1984, !llvm.loop !1985

encode.exit:                                      ; preds = %for.cond.i
  %add.ptr107 = getelementptr inbounds nuw i8, ptr %sig, i32 924, !dbg !1987
  %call109 = call ptr @memcpy(ptr noundef nonnull %add.ptr107, ptr noundef nonnull %salt, i32 noundef 40) #8, !dbg !1988
  store i32 964, ptr %siglen, align 4, !dbg !1989
  br label %err, !dbg !1990

err:                                              ; preds = %if.end, %entry, %encode.exit
  %ret.0 = phi i32 [ %call, %encode.exit ], [ %call, %entry ], [ 1, %if.end ], !dbg !871
    #dbg_value(i32 %ret.0, !877, !DIExpression(), !871)
    #dbg_label(!1991, !1992)
  call void @mayo_secure_clear(ptr noundef nonnull %V, i32 noundef 924) #8, !dbg !1993
  call void @mayo_secure_clear(ptr noundef nonnull %Vdec, i32 noundef 1704) #8, !dbg !1994
  call void @mayo_secure_clear(ptr noundef nonnull %A, i32 noundef 20880) #8, !dbg !1995
  call void @mayo_secure_clear(ptr noundef nonnull %r, i32 noundef 145) #8, !dbg !1996
  %O114 = getelementptr inbounds nuw i8, ptr %sk, i32 853704, !dbg !1997
  call void @mayo_secure_clear(ptr noundef nonnull %O114, i32 noundef 1704) #8, !dbg !1998
  call void @mayo_secure_clear(ptr noundef nonnull %sk, i32 noundef 855408) #8, !dbg !1999
  call void @mayo_secure_clear(ptr noundef nonnull %Ox, i32 noundef 142) #8, !dbg !2000
  call void @mayo_secure_clear(ptr noundef nonnull %tmp, i32 noundef 145) #8, !dbg !2001
  call void @mayo_secure_clear(ptr noundef nonnull %Mtmp, i32 noundef 10368) #8, !dbg !2002
  ret i32 %ret.0, !dbg !2003
}

; Function Attrs: nounwind
define internal fastcc void @compute_rhs(ptr noundef %p, ptr noundef %vPv, ptr noundef %t, ptr noundef %y) unnamed_addr #0 !dbg !2004 {
entry:
  %temp = alloca [9 x i64], align 8
    #dbg_value(ptr %p, !2007, !DIExpression(), !2008)
    #dbg_value(ptr %vPv, !2009, !DIExpression(), !2008)
    #dbg_value(ptr %t, !2010, !DIExpression(), !2008)
    #dbg_value(ptr %y, !2011, !DIExpression(), !2008)
    #dbg_value(i32 52, !2012, !DIExpression(), !2008)
    #dbg_value(i32 9, !2014, !DIExpression(), !2008)
    #dbg_value(i64 1, !2015, !DIExpression(), !2018)
    #dbg_value(i64 72057594037927936, !2015, !DIExpression(), !2018)
    #dbg_value(i64 72057594037927935, !2015, !DIExpression(), !2018)
    #dbg_value(i32 0, !2019, !DIExpression(), !2021)
  br label %for.cond, !dbg !2022

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2023
    #dbg_value(i32 %i.0, !2019, !DIExpression(), !2021)
  %exitcond = icmp ne i32 %i.0, 144, !dbg !2024
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2026

for.body:                                         ; preds = %for.cond
  %.idx6 = mul nuw nsw i32 %i.0, 72, !dbg !2027
  %0 = getelementptr inbounds nuw i8, ptr %vPv, i32 %.idx6, !dbg !2027
  %arrayidx = getelementptr inbounds nuw i8, ptr %0, i32 64, !dbg !2027
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2029
  %and = and i64 %1, 72057594037927935, !dbg !2029
  store i64 %and, ptr %arrayidx, align 8, !dbg !2029
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2030
    #dbg_value(i32 %inc, !2019, !DIExpression(), !2021)
  br label %for.cond, !dbg !2031, !llvm.loop !2032

for.end:                                          ; preds = %for.cond
    #dbg_declare(ptr %temp, !2034, !DIExpression(), !2035)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(72) %temp, i8 0, i32 72, i1 false), !dbg !2035
    #dbg_value(ptr %temp, !2036, !DIExpression(), !2008)
    #dbg_value(i32 11, !2037, !DIExpression(), !2039)
  br label %for.cond3, !dbg !2040

for.cond3:                                        ; preds = %for.inc77, %for.end
  %i2.0 = phi i32 [ 11, %for.end ], [ %dec78, %for.inc77 ], !dbg !2041
    #dbg_value(i32 %i2.0, !2037, !DIExpression(), !2039)
  %cmp4 = icmp sgt i32 %i2.0, -1, !dbg !2042
  br i1 %cmp4, label %for.cond6.preheader, label %for.cond81.preheader, !dbg !2044

for.cond6.preheader:                              ; preds = %for.cond3
  br label %for.cond6, !dbg !2045

for.cond81.preheader:                             ; preds = %for.cond3
  br label %for.cond81, !dbg !2048

for.cond6:                                        ; preds = %for.cond6.preheader, %for.inc74
  %j.0 = phi i32 [ %inc75, %for.inc74 ], [ %i2.0, %for.cond6.preheader ], !dbg !2050
    #dbg_value(i32 %j.0, !2051, !DIExpression(), !2052)
  %exitcond18 = icmp ne i32 %j.0, 12, !dbg !2053
  br i1 %exitcond18, label %for.body8, label %for.inc77, !dbg !2045

for.body8:                                        ; preds = %for.cond6
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %temp, i32 64, !dbg !2055
  %2 = load i64, ptr %arrayidx9, align 8, !dbg !2055
  %shr = lshr i64 %2, 52, !dbg !2057
  %3 = trunc i64 %shr to i8, !dbg !2058
    #dbg_value(i8 %conv, !2059, !DIExpression(), !2060)
  %arrayidx10 = getelementptr inbounds nuw i8, ptr %temp, i32 64, !dbg !2061
  %shl11 = shl i64 %2, 4, !dbg !2062
  store i64 %shl11, ptr %arrayidx10, align 8, !dbg !2062
    #dbg_value(i32 7, !2063, !DIExpression(), !2065)
  br label %for.cond12, !dbg !2066

for.cond12:                                       ; preds = %for.body15, %for.body8
  %k.0 = phi i32 [ 7, %for.body8 ], [ %dec, %for.body15 ], !dbg !2067
    #dbg_value(i32 %k.0, !2063, !DIExpression(), !2065)
  %cmp13 = icmp sgt i32 %k.0, -1, !dbg !2068
  br i1 %cmp13, label %for.body15, label %for.cond24.preheader, !dbg !2070

for.cond24.preheader:                             ; preds = %for.cond12
  %conv = and i8 %3, 15, !dbg !2058
  br label %for.cond24, !dbg !2071

for.body15:                                       ; preds = %for.cond12
  %arrayidx16 = getelementptr inbounds nuw [9 x i64], ptr %temp, i32 0, i32 %k.0, !dbg !2073
  %4 = load i64, ptr %arrayidx16, align 8, !dbg !2073
  %shr17 = lshr i64 %4, 60, !dbg !2075
  %add18 = add nuw nsw i32 %k.0, 1, !dbg !2076
  %arrayidx19 = getelementptr inbounds nuw [9 x i64], ptr %temp, i32 0, i32 %add18, !dbg !2077
  %5 = load i64, ptr %arrayidx19, align 8, !dbg !2078
  %xor = xor i64 %5, %shr17, !dbg !2078
  store i64 %xor, ptr %arrayidx19, align 8, !dbg !2078
  %arrayidx20 = getelementptr inbounds nuw [9 x i64], ptr %temp, i32 0, i32 %k.0, !dbg !2079
  %6 = load i64, ptr %arrayidx20, align 8, !dbg !2080
  %shl21 = shl i64 %6, 4, !dbg !2080
  store i64 %shl21, ptr %arrayidx20, align 8, !dbg !2080
  %dec = add nsw i32 %k.0, -1, !dbg !2081
    #dbg_value(i32 %dec, !2063, !DIExpression(), !2065)
  br label %for.cond12, !dbg !2082, !llvm.loop !2083

for.cond24:                                       ; preds = %for.cond24.preheader, %for.inc46
  %jj.0 = phi i32 [ %inc47, %for.inc46 ], [ 0, %for.cond24.preheader ], !dbg !2085
    #dbg_value(i32 %jj.0, !2086, !DIExpression(), !2087)
  %exitcond16 = icmp ne i32 %jj.0, 4, !dbg !2088
  br i1 %exitcond16, label %for.body27, label %for.cond50.preheader, !dbg !2071

for.cond50.preheader:                             ; preds = %for.cond24
  br label %for.cond50, !dbg !2090

for.body27:                                       ; preds = %for.cond24
  %rem28 = and i32 %jj.0, 1, !dbg !2092
  %cmp29 = icmp eq i32 %rem28, 0, !dbg !2095
  br i1 %cmp29, label %if.then, label %if.else, !dbg !2095

if.then:                                          ; preds = %for.body27
  %arrayidx31 = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %jj.0, !dbg !2096
  %7 = load i8, ptr %arrayidx31, align 1, !dbg !2096
    #dbg_value(i8 %conv, !1534, !DIExpression(), !2098)
    #dbg_value(i8 %7, !1540, !DIExpression(), !2098)
  %8 = load volatile i8, ptr @pqmayo_MAYO_5_ref_unsigned_char_blocker, align 1, !dbg !2100
  %xor1.i = xor i8 %conv, %8, !dbg !2101
    #dbg_value(i8 %xor1.i, !1534, !DIExpression(), !2098)
  %9 = trunc i8 %xor1.i to i1, !dbg !2102
    #dbg_value(i8 poison, !1543, !DIExpression(), !2098)
  %10 = and i8 %xor1.i, 2, !dbg !2103
  %mul9.i = mul i8 %10, %7, !dbg !2104
  %conv10.i = select i1 %9, i8 %7, i8 0, !dbg !2102
  %xor11.i = xor i8 %conv10.i, %mul9.i, !dbg !2105
    #dbg_value(i8 %xor11.i, !1543, !DIExpression(), !2098)
  %11 = and i8 %xor1.i, 4, !dbg !2106
  %mul16.i = mul i8 %11, %7, !dbg !2107
  %xor18.i = xor i8 %mul16.i, %xor11.i, !dbg !2108
    #dbg_value(i8 %xor18.i, !1543, !DIExpression(), !2098)
  %12 = and i8 %xor1.i, 8, !dbg !2109
  %mul23.i = mul i8 %12, %7, !dbg !2110
  %xor25.i = xor i8 %mul23.i, %xor18.i, !dbg !2111
    #dbg_value(i8 %xor25.i, !1543, !DIExpression(), !2098)
    #dbg_value(i8 %xor25.i, !1545, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !2098)
  %13 = lshr i8 %xor25.i, 4, !dbg !2112
  %14 = lshr i8 %xor25.i, 3, !dbg !2113
  %15 = and i8 %14, 14, !dbg !2113
  %16 = xor i8 %13, %15, !dbg !2114
  %xor25.masked.i = and i8 %xor25.i, 15, !dbg !2115
  %17 = xor i8 %16, %xor25.masked.i, !dbg !2115
    #dbg_value(i8 %17, !1546, !DIExpression(), !2098)
  %div = lshr exact i32 %jj.0, 1, !dbg !2116
  %arrayidx33 = getelementptr inbounds nuw i8, ptr %temp, i32 %div, !dbg !2117
  %18 = load i8, ptr %arrayidx33, align 1, !dbg !2118
  %xor355 = xor i8 %18, %17, !dbg !2118
  store i8 %xor355, ptr %arrayidx33, align 1, !dbg !2118
  br label %for.inc46, !dbg !2119

if.else:                                          ; preds = %for.body27
  %arrayidx37 = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %jj.0, !dbg !2120
  %19 = load i8, ptr %arrayidx37, align 1, !dbg !2120
    #dbg_value(i8 %conv, !1534, !DIExpression(), !2122)
    #dbg_value(i8 %19, !1540, !DIExpression(), !2122)
  %20 = load volatile i8, ptr @pqmayo_MAYO_5_ref_unsigned_char_blocker, align 1, !dbg !2124
  %xor1.i7 = xor i8 %conv, %20, !dbg !2125
    #dbg_value(i8 %xor1.i7, !1534, !DIExpression(), !2122)
  %21 = trunc i8 %xor1.i7 to i1, !dbg !2126
    #dbg_value(i8 poison, !1543, !DIExpression(), !2122)
  %22 = and i8 %xor1.i7, 2, !dbg !2127
  %mul9.i8 = mul i8 %22, %19, !dbg !2128
  %conv10.i9 = select i1 %21, i8 %19, i8 0, !dbg !2126
  %xor11.i10 = xor i8 %conv10.i9, %mul9.i8, !dbg !2129
    #dbg_value(i8 %xor11.i10, !1543, !DIExpression(), !2122)
  %23 = and i8 %xor1.i7, 4, !dbg !2130
  %mul16.i11 = mul i8 %23, %19, !dbg !2131
  %xor18.i12 = xor i8 %mul16.i11, %xor11.i10, !dbg !2132
    #dbg_value(i8 %xor18.i12, !1543, !DIExpression(), !2122)
  %24 = and i8 %xor1.i7, 8, !dbg !2133
  %mul23.i13 = mul i8 %24, %19, !dbg !2134
  %xor25.i14 = xor i8 %mul23.i13, %xor18.i12, !dbg !2135
    #dbg_value(i8 %xor25.i14, !1543, !DIExpression(), !2122)
    #dbg_value(i8 %xor25.i14, !1545, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !2122)
  %25 = lshr i8 %xor25.i14, 4, !dbg !2136
  %26 = lshr i8 %xor25.i14, 3, !dbg !2137
  %27 = and i8 %26, 14, !dbg !2137
  %28 = xor i8 %25, %27, !dbg !2138
  %xor25.masked.i15 = and i8 %xor25.i14, 15, !dbg !2139
  %29 = xor i8 %28, %xor25.masked.i15, !dbg !2139
    #dbg_value(i8 %29, !1546, !DIExpression(), !2122)
  %shl40 = shl nuw i8 %29, 4, !dbg !2140
  %div414 = lshr i32 %jj.0, 1, !dbg !2141
  %arrayidx42 = getelementptr inbounds nuw i8, ptr %temp, i32 %div414, !dbg !2142
  %30 = load i8, ptr %arrayidx42, align 1, !dbg !2143
  %xor44 = xor i8 %shl40, %30, !dbg !2143
  store i8 %xor44, ptr %arrayidx42, align 1, !dbg !2143
  br label %for.inc46

for.inc46:                                        ; preds = %if.then, %if.else
  %inc47 = add nuw nsw i32 %jj.0, 1, !dbg !2144
    #dbg_value(i32 %inc47, !2086, !DIExpression(), !2087)
  br label %for.cond24, !dbg !2145, !llvm.loop !2146

for.cond50:                                       ; preds = %for.cond50.preheader, %for.body53
  %k49.0 = phi i32 [ %inc72, %for.body53 ], [ 0, %for.cond50.preheader ], !dbg !2148
    #dbg_value(i32 %k49.0, !2149, !DIExpression(), !2150)
  %exitcond17 = icmp ne i32 %k49.0, 9, !dbg !2151
  br i1 %exitcond17, label %for.body53, label %for.inc74, !dbg !2090

for.body53:                                       ; preds = %for.cond50
  %mul54 = mul nuw nsw i32 %i2.0, 12, !dbg !2153
  %add55 = add nuw nsw i32 %mul54, %j.0, !dbg !2155
  %.idx = mul nsw i32 %add55, 72, !dbg !2156
  %31 = getelementptr i8, ptr %vPv, i32 %.idx, !dbg !2156
  %arrayidx58 = getelementptr i64, ptr %31, i32 %k49.0, !dbg !2156
  %32 = load i64, ptr %arrayidx58, align 8, !dbg !2156
  %cmp59.not = icmp eq i32 %i2.0, %j.0, !dbg !2157
  %mul62 = mul nuw nsw i32 %j.0, 12, !dbg !2158
  %add63 = add nuw nsw i32 %mul62, %i2.0, !dbg !2159
  %.idx3 = mul nsw i32 %add63, 72, !dbg !2160
  %33 = getelementptr i8, ptr %vPv, i32 %.idx3, !dbg !2160
  %arrayidx66 = getelementptr i64, ptr %33, i32 %k49.0, !dbg !2160
  %34 = load i64, ptr %arrayidx66, align 8, !dbg !2160
  %mul67 = select i1 %cmp59.not, i64 0, i64 %34, !dbg !2161
  %xor68 = xor i64 %32, %mul67, !dbg !2162
  %arrayidx69 = getelementptr inbounds nuw [9 x i64], ptr %temp, i32 0, i32 %k49.0, !dbg !2163
  %35 = load i64, ptr %arrayidx69, align 8, !dbg !2164
  %xor70 = xor i64 %35, %xor68, !dbg !2164
  store i64 %xor70, ptr %arrayidx69, align 8, !dbg !2164
  %inc72 = add nuw nsw i32 %k49.0, 1, !dbg !2165
    #dbg_value(i32 %inc72, !2149, !DIExpression(), !2150)
  br label %for.cond50, !dbg !2166, !llvm.loop !2167

for.inc74:                                        ; preds = %for.cond50
  %inc75 = add nuw nsw i32 %j.0, 1, !dbg !2169
    #dbg_value(i32 %inc75, !2051, !DIExpression(), !2052)
  br label %for.cond6, !dbg !2170, !llvm.loop !2171

for.inc77:                                        ; preds = %for.cond6
  %dec78 = add nsw i32 %i2.0, -1, !dbg !2173
    #dbg_value(i32 %dec78, !2037, !DIExpression(), !2039)
  br label %for.cond3, !dbg !2174, !llvm.loop !2175

for.cond81:                                       ; preds = %for.cond81.preheader, %for.body84
  %i80.0 = phi i32 [ %add106, %for.body84 ], [ 0, %for.cond81.preheader ], !dbg !2177
    #dbg_value(i32 %i80.0, !2178, !DIExpression(), !2179)
  %cmp82 = icmp samesign ult i32 %i80.0, 142, !dbg !2180
  br i1 %cmp82, label %for.body84, label %for.end107, !dbg !2048

for.body84:                                       ; preds = %for.cond81
  %arrayidx85 = getelementptr inbounds nuw i8, ptr %t, i32 %i80.0, !dbg !2182
  %36 = load i8, ptr %arrayidx85, align 1, !dbg !2182
  %div87 = lshr exact i32 %i80.0, 1, !dbg !2184
  %arrayidx88 = getelementptr inbounds nuw i8, ptr %temp, i32 %div87, !dbg !2185
  %37 = load i8, ptr %arrayidx88, align 1, !dbg !2185
  %38 = and i8 %37, 15, !dbg !2186
  %xor911 = xor i8 %36, %38, !dbg !2187
  %arrayidx93 = getelementptr inbounds nuw i8, ptr %y, i32 %i80.0, !dbg !2188
  store i8 %xor911, ptr %arrayidx93, align 1, !dbg !2189
  %add94 = or disjoint i32 %i80.0, 1, !dbg !2190
  %arrayidx95 = getelementptr inbounds nuw i8, ptr %t, i32 %add94, !dbg !2191
  %39 = load i8, ptr %arrayidx95, align 1, !dbg !2191
  %div97 = lshr exact i32 %i80.0, 1, !dbg !2192
  %arrayidx98 = getelementptr inbounds nuw i8, ptr %temp, i32 %div97, !dbg !2193
  %40 = load i8, ptr %arrayidx98, align 1, !dbg !2193
  %41 = lshr i8 %40, 4, !dbg !2194
  %xor1012 = xor i8 %39, %41, !dbg !2195
  %add103 = or disjoint i32 %i80.0, 1, !dbg !2196
  %arrayidx104 = getelementptr inbounds nuw i8, ptr %y, i32 %add103, !dbg !2197
  store i8 %xor1012, ptr %arrayidx104, align 1, !dbg !2198
  %add106 = add nuw nsw i32 %i80.0, 2, !dbg !2199
    #dbg_value(i32 %add106, !2178, !DIExpression(), !2179)
  br label %for.cond81, !dbg !2200, !llvm.loop !2201

for.end107:                                       ; preds = %for.cond81
  ret void, !dbg !2203
}

declare dso_local ptr @memset(ptr noundef, i32 noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: nounwind
define dso_local i32 @pqmayo_MAYO_5_ref_mayo_sign(ptr noundef %p, ptr noundef %sm, ptr noundef %smlen, ptr noundef %m, i32 noundef %mlen, ptr noundef %csk) local_unnamed_addr #0 !dbg !2204 {
entry:
  %siglen = alloca i32, align 4
    #dbg_value(ptr %p, !2205, !DIExpression(), !2206)
    #dbg_value(ptr %sm, !2207, !DIExpression(), !2206)
    #dbg_value(ptr %smlen, !2208, !DIExpression(), !2206)
    #dbg_value(ptr %m, !2209, !DIExpression(), !2206)
    #dbg_value(i32 %mlen, !2210, !DIExpression(), !2206)
    #dbg_value(ptr %csk, !2211, !DIExpression(), !2206)
    #dbg_value(i32 0, !2212, !DIExpression(), !2206)
    #dbg_value(i32 964, !2213, !DIExpression(), !2206)
  %add.ptr = getelementptr inbounds nuw i8, ptr %sm, i32 964, !dbg !2214
  %call = call ptr @memmove(ptr noundef nonnull %add.ptr, ptr noundef %m, i32 noundef %mlen) #8, !dbg !2215
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %sm, i32 964, !dbg !2216
    #dbg_value(ptr %siglen, !2217, !DIExpression(DW_OP_deref), !2206)
  %call2 = call i32 @pqmayo_MAYO_5_ref_mayo_sign_signature(ptr noundef %p, ptr noundef %sm, ptr noundef nonnull %siglen, ptr noundef nonnull %add.ptr1, i32 noundef %mlen, ptr noundef %csk) #9, !dbg !2218
    #dbg_value(i32 %call2, !2212, !DIExpression(), !2206)
  %cmp.not = icmp eq i32 %call2, 0, !dbg !2219
  %0 = load i32, ptr %siglen, align 4
    #dbg_value(i32 %0, !2217, !DIExpression(), !2206)
  %cmp3.not = icmp eq i32 %0, 964
  %or.cond = select i1 %cmp.not, i1 %cmp3.not, i1 false, !dbg !2221
  br i1 %or.cond, label %if.end, label %if.then, !dbg !2221

if.then:                                          ; preds = %entry
  %1 = load i32, ptr %siglen, align 4, !dbg !2222
    #dbg_value(i32 %1, !2217, !DIExpression(), !2206)
  %add = add i32 %1, %mlen, !dbg !2224
  %call4 = call ptr @memset(ptr noundef %sm, i32 noundef 0, i32 noundef %add) #8, !dbg !2225
  br label %err, !dbg !2226

if.end:                                           ; preds = %entry
  %2 = load i32, ptr %siglen, align 4, !dbg !2227
    #dbg_value(i32 %2, !2217, !DIExpression(), !2206)
  %add5 = add i32 %2, %mlen, !dbg !2228
  store i32 %add5, ptr %smlen, align 4, !dbg !2229
  br label %err, !dbg !2230

err:                                              ; preds = %if.end, %if.then
    #dbg_label(!2231, !2232)
  ret i32 %call2, !dbg !2233
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_5_ref_mayo_open(ptr noundef %p, ptr noundef %m, ptr noundef %mlen, ptr noundef %sm, i32 noundef %smlen, ptr noundef %pk) local_unnamed_addr #0 !dbg !338 {
entry:
    #dbg_value(ptr %p, !337, !DIExpression(), !2234)
    #dbg_value(ptr %m, !344, !DIExpression(), !2234)
    #dbg_value(ptr %mlen, !345, !DIExpression(), !2234)
    #dbg_value(ptr %sm, !346, !DIExpression(), !2234)
    #dbg_value(i32 %smlen, !347, !DIExpression(), !2234)
    #dbg_value(ptr %pk, !348, !DIExpression(), !2234)
    #dbg_value(i32 964, !349, !DIExpression(), !2234)
  %cmp = icmp ult i32 %smlen, 964, !dbg !2235
  br i1 %cmp, label %return, label %if.end, !dbg !2235

if.end:                                           ; preds = %entry
  %add.ptr = getelementptr inbounds nuw i8, ptr %sm, i32 964, !dbg !2236
  %sub = add i32 %smlen, -964, !dbg !2237
  %call = call i32 @pqmayo_MAYO_5_ref_mayo_verify(ptr noundef %p, ptr noundef nonnull %add.ptr, i32 noundef %sub, ptr noundef %sm, ptr noundef %pk) #9, !dbg !2238
    #dbg_value(i32 %call, !355, !DIExpression(), !2234)
  %cmp1 = icmp eq i32 %call, 0, !dbg !2239
  br i1 %cmp1, label %if.then2, label %return, !dbg !2239

if.then2:                                         ; preds = %if.end
  %sub3 = add i32 %smlen, -964, !dbg !2240
  store i32 %sub3, ptr %mlen, align 4, !dbg !2241
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sm, i32 964, !dbg !2242
  %call5 = call ptr @memmove(ptr noundef %m, ptr noundef nonnull %add.ptr4, i32 noundef %sub3) #8, !dbg !2243
  br label %return, !dbg !2244

return:                                           ; preds = %if.end, %if.then2, %entry
  %retval.0 = phi i32 [ 1, %entry ], [ 0, %if.then2 ], [ 1, %if.end ], !dbg !2234
  ret i32 %retval.0, !dbg !2245
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_5_ref_mayo_verify(ptr noundef %p, ptr noundef %m, i32 noundef %mlen, ptr noundef %sig, ptr noundef %cpk) local_unnamed_addr #0 !dbg !2246 {
entry:
  %accumulator.i39 = alloca [266112 x i64], align 8
  %accumulator.i = alloca [20736 x i64], align 8
  %tmp.i2 = alloca [9 x i64], align 8
  %tmp.i = alloca [9 x i64], align 8
  %PS.i.i = alloca [16632 x i64], align 8
  %SPS.i = alloca [1296 x i64], align 8
  %zero.i = alloca [142 x i8], align 1
  %tEnc = alloca [71 x i8], align 1
  %t = alloca [142 x i8], align 1
  %y = alloca [284 x i8], align 1
  %s = alloca [1848 x i8], align 1
  %pk = alloca [107415 x i64], align 8
  %tmp = alloca [104 x i8], align 1
    #dbg_value(ptr %p, !2249, !DIExpression(), !2250)
    #dbg_value(ptr %m, !2251, !DIExpression(), !2250)
    #dbg_value(i32 %mlen, !2252, !DIExpression(), !2250)
    #dbg_value(ptr %sig, !2253, !DIExpression(), !2250)
    #dbg_value(ptr %cpk, !2254, !DIExpression(), !2250)
    #dbg_declare(ptr %tEnc, !2255, !DIExpression(), !2256)
    #dbg_declare(ptr %t, !2257, !DIExpression(), !2258)
    #dbg_declare(ptr %y, !2259, !DIExpression(), !2263)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(284) %y, i8 0, i32 284, i1 false), !dbg !2263
    #dbg_declare(ptr %s, !2264, !DIExpression(), !2265)
    #dbg_declare(ptr %pk, !2266, !DIExpression(), !2270)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(859320) %pk, i8 0, i32 859320, i1 false), !dbg !2270
    #dbg_declare(ptr %tmp, !2271, !DIExpression(), !2275)
    #dbg_value(i32 142, !2276, !DIExpression(), !2250)
    #dbg_value(i32 154, !2277, !DIExpression(), !2250)
    #dbg_value(i32 12, !2278, !DIExpression(), !2250)
    #dbg_value(i32 71, !2279, !DIExpression(), !2250)
    #dbg_value(i32 964, !2280, !DIExpression(), !2250)
    #dbg_value(i32 64, !2281, !DIExpression(), !2250)
    #dbg_value(i32 40, !2282, !DIExpression(), !2250)
    #dbg_value(ptr %p, !247, !DIExpression(), !2283)
    #dbg_value(ptr %cpk, !253, !DIExpression(), !2283)
    #dbg_value(ptr %pk, !254, !DIExpression(), !2283)
    #dbg_value(ptr %p, !255, !DIExpression(), !2285)
    #dbg_value(ptr %pk, !261, !DIExpression(), !2285)
    #dbg_value(ptr %cpk, !262, !DIExpression(), !2285)
  %call.i.i = call i32 @AES_128_CTR(ptr noundef nonnull %pk, i32 noundef 841847, ptr noundef %cpk, i32 noundef 16) #8, !dbg !2287
  call void @llvm.lifetime.start.p0(i64 72, ptr nonnull %tmp.i2), !dbg !2288
    #dbg_value(ptr %pk, !269, !DIExpression(), !2290)
    #dbg_value(ptr %pk, !271, !DIExpression(), !2290)
    #dbg_value(i32 11857, !272, !DIExpression(), !2290)
    #dbg_value(i32 142, !273, !DIExpression(), !2290)
    #dbg_value(i32 9, !274, !DIExpression(), !2290)
    #dbg_value(ptr %pk, !276, !DIExpression(), !2290)
    #dbg_declare(ptr %tmp.i2, !277, !DIExpression(), !2288)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(72) %tmp.i2, i8 0, i32 72, i1 false), !dbg !2288
    #dbg_value(i32 11857, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2291)
  br label %for.cond.i3, !dbg !2292

for.cond.i3:                                      ; preds = %for.body.i7, %entry
  %i.0.in.i4 = phi i32 [ 11857, %entry ], [ %i.0.i5, %for.body.i7 ]
    #dbg_value(i32 %i.0.in.i4, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2291)
  %cmp.i6 = icmp ugt i32 %i.0.in.i4, 0, !dbg !2293
  br i1 %cmp.i6, label %for.body.i7, label %unpack_m_vecs.exit16, !dbg !2294

for.body.i7:                                      ; preds = %for.cond.i3
  %i.0.i5 = add nsw i32 %i.0.in.i4, -1, !dbg !2295
    #dbg_value(i32 %i.0.i5, !281, !DIExpression(), !2291)
  %mul.i8 = mul nsw i32 %i.0.i5, 142, !dbg !2296
  %div1.i96568 = lshr exact i32 %mul.i8, 1, !dbg !2297
  %add.ptr.i10 = getelementptr inbounds nuw i8, ptr %pk, i32 %div1.i96568, !dbg !2298
  %call.i11 = call ptr @memcpy(ptr noundef nonnull %tmp.i2, ptr noundef nonnull %add.ptr.i10, i32 noundef 71) #8, !dbg !2299
  %mul4.i13 = mul nsw i32 %i.0.i5, 72, !dbg !2300
  %add.ptr5.i14 = getelementptr inbounds nuw i8, ptr %pk, i32 %mul4.i13, !dbg !2301
  %call8.i15 = call ptr @memcpy(ptr noundef nonnull %add.ptr5.i14, ptr noundef nonnull %tmp.i2, i32 noundef 72) #8, !dbg !2302
    #dbg_value(i32 %i.0.i5, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2291)
  br label %for.cond.i3, !dbg !2303, !llvm.loop !2304

unpack_m_vecs.exit16:                             ; preds = %for.cond.i3
  call void @llvm.lifetime.end.p0(i64 72, ptr nonnull %tmp.i2), !dbg !2306
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %cpk, i32 16, !dbg !2307
  %add.ptr2.i = getelementptr inbounds nuw i8, ptr %pk, i32 853704, !dbg !2308
  call void @llvm.lifetime.start.p0(i64 72, ptr nonnull %tmp.i), !dbg !2309
    #dbg_value(ptr %add.ptr.i, !269, !DIExpression(), !2311)
    #dbg_value(ptr %add.ptr2.i, !271, !DIExpression(), !2311)
    #dbg_value(i32 78, !272, !DIExpression(), !2311)
    #dbg_value(i32 142, !273, !DIExpression(), !2311)
    #dbg_value(i32 9, !274, !DIExpression(), !2311)
    #dbg_value(ptr %add.ptr2.i, !276, !DIExpression(), !2311)
    #dbg_declare(ptr %tmp.i, !277, !DIExpression(), !2309)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(72) %tmp.i, i8 0, i32 72, i1 false), !dbg !2309
    #dbg_value(i32 78, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2312)
  br label %for.cond.i, !dbg !2313

for.cond.i:                                       ; preds = %for.body.i, %unpack_m_vecs.exit16
  %i.0.in.i = phi i32 [ 78, %unpack_m_vecs.exit16 ], [ %i.0.i, %for.body.i ]
    #dbg_value(i32 %i.0.in.i, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2312)
  %cmp.i = icmp ugt i32 %i.0.in.i, 0, !dbg !2314
  br i1 %cmp.i, label %for.body.i, label %unpack_m_vecs.exit, !dbg !2315

for.body.i:                                       ; preds = %for.cond.i
  %i.0.i = add nsw i32 %i.0.in.i, -1, !dbg !2316
    #dbg_value(i32 %i.0.i, !281, !DIExpression(), !2312)
  %mul.i = mul nsw i32 %i.0.i, 142, !dbg !2317
  %div1.i6667 = lshr exact i32 %mul.i, 1, !dbg !2318
  %add.ptr.i1 = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 %div1.i6667, !dbg !2319
  %call.i = call ptr @memcpy(ptr noundef nonnull %tmp.i, ptr noundef nonnull %add.ptr.i1, i32 noundef 71) #8, !dbg !2320
  %mul4.i = mul nsw i32 %i.0.i, 72, !dbg !2321
  %add.ptr5.i = getelementptr inbounds nuw i8, ptr %add.ptr2.i, i32 %mul4.i, !dbg !2322
  %call8.i = call ptr @memcpy(ptr noundef nonnull %add.ptr5.i, ptr noundef nonnull %tmp.i, i32 noundef 72) #8, !dbg !2323
    #dbg_value(i32 %i.0.i, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2312)
  br label %for.cond.i, !dbg !2324, !llvm.loop !2325

unpack_m_vecs.exit:                               ; preds = %for.cond.i
  call void @llvm.lifetime.end.p0(i64 72, ptr nonnull %tmp.i), !dbg !2327
    #dbg_value(i32 0, !2328, !DIExpression(), !2250)
    #dbg_value(ptr %pk, !2329, !DIExpression(), !2250)
  %add.ptr = getelementptr inbounds nuw i8, ptr %pk, i32 731016, !dbg !2330
    #dbg_value(ptr %add.ptr, !2331, !DIExpression(), !2250)
    #dbg_value(ptr %add.ptr2, !2332, !DIExpression(), !2250)
  %call4 = call i32 @shake256(ptr noundef nonnull %tmp, i32 noundef 64, ptr noundef %m, i32 noundef %mlen) #8, !dbg !2333
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %tmp, i32 64, !dbg !2334
  %add.ptr8 = getelementptr inbounds nuw i8, ptr %sig, i32 924, !dbg !2335
  %call9 = call ptr @memcpy(ptr noundef nonnull %add.ptr6, ptr noundef nonnull %add.ptr8, i32 noundef 40) #8, !dbg !2336
  %call12 = call i32 @shake256(ptr noundef nonnull %tEnc, i32 noundef 71, ptr noundef nonnull %tmp, i32 noundef 104) #8, !dbg !2337
    #dbg_value(ptr %tEnc, !434, !DIExpression(), !2338)
    #dbg_value(ptr %t, !440, !DIExpression(), !2338)
    #dbg_value(i32 142, !441, !DIExpression(), !2338)
    #dbg_value(i32 0, !442, !DIExpression(), !2338)
  br label %for.cond.i17, !dbg !2340

for.cond.i17:                                     ; preds = %for.body.i20, %unpack_m_vecs.exit
  %mdec.addr.0.i = phi ptr [ %t, %unpack_m_vecs.exit ], [ %incdec.ptr5.i, %for.body.i20 ]
  %i.0.i18 = phi i32 [ 0, %unpack_m_vecs.exit ], [ %inc.i, %for.body.i20 ], !dbg !2341
    #dbg_value(i32 %i.0.i18, !442, !DIExpression(), !2338)
    #dbg_value(ptr %mdec.addr.0.i, !440, !DIExpression(), !2338)
  %exitcond = icmp ne i32 %i.0.i18, 71, !dbg !2342
  br i1 %exitcond, label %for.body.i20, label %for.cond.i21.preheader, !dbg !2343

for.cond.i21.preheader:                           ; preds = %for.cond.i17
  br label %for.cond.i21, !dbg !2344

for.body.i20:                                     ; preds = %for.cond.i17
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %tEnc, i32 %i.0.i18, !dbg !2346
  %0 = load i8, ptr %arrayidx.i, align 1, !dbg !2346
  %1 = and i8 %0, 15, !dbg !2347
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i, i32 1, !dbg !2348
    #dbg_value(ptr %incdec.ptr.i, !440, !DIExpression(), !2338)
  store i8 %1, ptr %mdec.addr.0.i, align 1, !dbg !2349
  %2 = lshr i8 %0, 4, !dbg !2350
    #dbg_value(ptr %incdec.ptr.i, !440, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2338)
  store i8 %2, ptr %incdec.ptr.i, align 1, !dbg !2351
  %incdec.ptr5.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i, i32 2, !dbg !2352
    #dbg_value(ptr %incdec.ptr5.i, !440, !DIExpression(), !2338)
  %inc.i = add nuw nsw i32 %i.0.i18, 1, !dbg !2353
    #dbg_value(i32 %inc.i, !442, !DIExpression(), !2338)
  br label %for.cond.i17, !dbg !2354, !llvm.loop !2355

for.cond.i21:                                     ; preds = %for.cond.i21.preheader, %for.body.i25
  %mdec.addr.0.i22 = phi ptr [ %incdec.ptr5.i29, %for.body.i25 ], [ %s, %for.cond.i21.preheader ]
  %i.0.i23 = phi i32 [ %inc.i30, %for.body.i25 ], [ 0, %for.cond.i21.preheader ], !dbg !2357
    #dbg_value(i32 %i.0.i23, !442, !DIExpression(), !2358)
    #dbg_value(ptr %mdec.addr.0.i22, !440, !DIExpression(), !2358)
  %exitcond69 = icmp ne i32 %i.0.i23, 924, !dbg !2359
  br i1 %exitcond69, label %for.body.i25, label %decode.exit31, !dbg !2344

for.body.i25:                                     ; preds = %for.cond.i21
  %arrayidx.i26 = getelementptr inbounds nuw i8, ptr %sig, i32 %i.0.i23, !dbg !2360
  %3 = load i8, ptr %arrayidx.i26, align 1, !dbg !2360
  %4 = and i8 %3, 15, !dbg !2361
  %incdec.ptr.i27 = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i22, i32 1, !dbg !2362
    #dbg_value(ptr %incdec.ptr.i27, !440, !DIExpression(), !2358)
  store i8 %4, ptr %mdec.addr.0.i22, align 1, !dbg !2363
  %5 = lshr i8 %3, 4, !dbg !2364
    #dbg_value(ptr %incdec.ptr.i27, !440, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2358)
  store i8 %5, ptr %incdec.ptr.i27, align 1, !dbg !2365
  %incdec.ptr5.i29 = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i22, i32 2, !dbg !2366
    #dbg_value(ptr %incdec.ptr5.i29, !440, !DIExpression(), !2358)
  %inc.i30 = add nuw nsw i32 %i.0.i23, 1, !dbg !2367
    #dbg_value(i32 %inc.i30, !442, !DIExpression(), !2358)
  br label %for.cond.i21, !dbg !2368, !llvm.loop !2369

decode.exit31:                                    ; preds = %for.cond.i21
  call void @llvm.lifetime.start.p0(i64 10368, ptr nonnull %SPS.i), !dbg !2371
  call void @llvm.lifetime.start.p0(i64 142, ptr nonnull %zero.i), !dbg !2371
    #dbg_value(ptr %p, !2376, !DIExpression(), !2377)
    #dbg_value(ptr %s, !2378, !DIExpression(), !2377)
    #dbg_value(ptr %pk, !2379, !DIExpression(), !2377)
    #dbg_value(ptr %add.ptr, !2380, !DIExpression(), !2377)
    #dbg_value(ptr %add.ptr2, !2381, !DIExpression(), !2377)
    #dbg_value(ptr %y, !2382, !DIExpression(), !2377)
    #dbg_declare(ptr %SPS.i, !2383, !DIExpression(), !2371)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(10368) %SPS.i, i8 0, i32 10368, i1 false), !dbg !2371
  call void @llvm.lifetime.start.p0(i64 133056, ptr nonnull %PS.i.i), !dbg !2384
    #dbg_value(ptr %p, !2389, !DIExpression(), !2390)
    #dbg_value(ptr %pk, !2391, !DIExpression(), !2390)
    #dbg_value(ptr %add.ptr, !2392, !DIExpression(), !2390)
    #dbg_value(ptr %add.ptr2, !2393, !DIExpression(), !2390)
    #dbg_value(ptr %s, !2394, !DIExpression(), !2390)
    #dbg_value(ptr %SPS.i, !2395, !DIExpression(), !2390)
    #dbg_declare(ptr %PS.i.i, !2396, !DIExpression(), !2384)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(133056) %PS.i.i, i8 0, i32 133056, i1 false), !dbg !2384
  call void @llvm.lifetime.start.p0(i64 2128896, ptr nonnull %accumulator.i39), !dbg !2400
    #dbg_value(ptr %pk, !2405, !DIExpression(), !2406)
    #dbg_value(ptr %add.ptr, !2407, !DIExpression(), !2406)
    #dbg_value(ptr %add.ptr2, !2408, !DIExpression(), !2406)
    #dbg_value(ptr %s, !2409, !DIExpression(), !2406)
    #dbg_value(i32 142, !2410, !DIExpression(), !2406)
    #dbg_value(i32 142, !2411, !DIExpression(), !2406)
    #dbg_value(i32 12, !2412, !DIExpression(), !2406)
    #dbg_value(i32 12, !2413, !DIExpression(), !2406)
    #dbg_value(ptr %PS.i.i, !2414, !DIExpression(), !2406)
    #dbg_value(i32 154, !2415, !DIExpression(), !2406)
    #dbg_value(i32 9, !2416, !DIExpression(), !2406)
    #dbg_declare(ptr %accumulator.i39, !2417, !DIExpression(), !2400)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(2128896) %accumulator.i39, i8 0, i32 2128896, i1 false), !dbg !2400
    #dbg_value(i32 0, !2421, !DIExpression(), !2406)
    #dbg_value(i32 0, !2422, !DIExpression(), !2424)
  br label %for.cond.i40, !dbg !2425

for.cond.i40:                                     ; preds = %for.inc52.i, %decode.exit31
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc52.i ], [ 142, %decode.exit31 ], !dbg !2426
  %P1_used.0.i = phi i32 [ 0, %decode.exit31 ], [ %P1_used.1.i.lcssa, %for.inc52.i ], !dbg !2426
  %row.0.i41 = phi i32 [ 0, %decode.exit31 ], [ %inc53.i, %for.inc52.i ], !dbg !2427
    #dbg_value(i32 %row.0.i41, !2422, !DIExpression(), !2424)
    #dbg_value(i32 %P1_used.0.i, !2421, !DIExpression(), !2406)
  %exitcond76 = icmp ne i32 %row.0.i41, 142, !dbg !2428
  br i1 %exitcond76, label %for.cond2.i.preheader, label %for.cond56.i.preheader, !dbg !2430

for.cond2.i.preheader:                            ; preds = %for.cond.i40
  %6 = add i32 %P1_used.0.i, %indvars.iv, !dbg !2431
  br label %for.cond2.i, !dbg !2431

for.cond56.i.preheader:                           ; preds = %for.cond.i40
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %pk, i32 853704, !dbg !2434
  br label %for.cond56.i, !dbg !2435

for.cond2.i:                                      ; preds = %for.cond2.i.preheader, %for.inc17.i
  %P1_used.1.i = phi i32 [ %inc16.i, %for.inc17.i ], [ %P1_used.0.i, %for.cond2.i.preheader ], !dbg !2406
  %j.0.i46 = phi i32 [ %inc18.i, %for.inc17.i ], [ %row.0.i41, %for.cond2.i.preheader ], !dbg !2437
    #dbg_value(i32 %j.0.i46, !2438, !DIExpression(), !2439)
    #dbg_value(i32 %P1_used.1.i, !2421, !DIExpression(), !2406)
  %exitcond72 = icmp ne i32 %P1_used.1.i, %6, !dbg !2440
  br i1 %exitcond72, label %for.cond5.i.preheader, label %for.cond21.i.preheader, !dbg !2431

for.cond21.i.preheader:                           ; preds = %for.cond2.i
  %P1_used.1.i.lcssa = phi i32 [ %P1_used.1.i, %for.cond2.i ], !dbg !2406
  br label %for.cond21.i, !dbg !2442

for.cond5.i.preheader:                            ; preds = %for.cond2.i
  br label %for.cond5.i, !dbg !2444

for.cond5.i:                                      ; preds = %for.cond5.i.preheader, %m_vec_add.exit.i58
  %col.0.i48 = phi i32 [ %inc.i59, %m_vec_add.exit.i58 ], [ 0, %for.cond5.i.preheader ], !dbg !2447
    #dbg_value(i32 %col.0.i48, !2448, !DIExpression(), !2449)
  %exitcond71 = icmp ne i32 %col.0.i48, 12, !dbg !2450
  br i1 %exitcond71, label %for.body7.i, label %for.inc17.i, !dbg !2444

for.body7.i:                                      ; preds = %for.cond5.i
  %add.ptr.i50.idx = mul nsw i32 %P1_used.1.i, 72, !dbg !2452
  %add.ptr.i50 = getelementptr inbounds i8, ptr %pk, i32 %add.ptr.i50.idx, !dbg !2452
  %mul8.i51 = mul nuw nsw i32 %row.0.i41, 12, !dbg !2454
  %add9.i = add nuw nsw i32 %mul8.i51, %col.0.i48, !dbg !2455
  %mul10.i = shl nuw nsw i32 %add9.i, 4, !dbg !2456
  %mul11.i52 = mul nuw nsw i32 %col.0.i48, 154, !dbg !2457
  %7 = getelementptr i8, ptr %s, i32 %mul11.i52, !dbg !2458
  %arrayidx.i53 = getelementptr i8, ptr %7, i32 %j.0.i46, !dbg !2458
  %8 = load i8, ptr %arrayidx.i53, align 1, !dbg !2458
  %conv.i54 = zext i8 %8 to i32, !dbg !2458
  %add13.i = add nuw nsw i32 %mul10.i, %conv.i54, !dbg !2459
  %add.ptr15.i.idx = mul nuw nsw i32 %add13.i, 72, !dbg !2460
  %add.ptr15.i = getelementptr inbounds nuw i8, ptr %accumulator.i39, i32 %add.ptr15.i.idx, !dbg !2460
    #dbg_value(i32 9, !2461, !DIExpression(), !2465)
    #dbg_value(ptr %add.ptr.i50, !2467, !DIExpression(), !2465)
    #dbg_value(ptr %add.ptr15.i, !2468, !DIExpression(), !2465)
    #dbg_value(i32 0, !2469, !DIExpression(), !2471)
  br label %for.cond.i.i55, !dbg !2472

for.cond.i.i55:                                   ; preds = %for.body.i.i60, %for.body7.i
  %i.0.i.i56 = phi i32 [ 0, %for.body7.i ], [ %inc.i.i64, %for.body.i.i60 ], !dbg !2473
    #dbg_value(i32 %i.0.i.i56, !2469, !DIExpression(), !2471)
  %exitcond70 = icmp ne i32 %i.0.i.i56, 9, !dbg !2474
  br i1 %exitcond70, label %for.body.i.i60, label %m_vec_add.exit.i58, !dbg !2476

for.body.i.i60:                                   ; preds = %for.cond.i.i55
  %arrayidx.i.i61 = getelementptr inbounds nuw i64, ptr %add.ptr.i50, i32 %i.0.i.i56, !dbg !2477
  %9 = load i64, ptr %arrayidx.i.i61, align 8, !dbg !2477
  %arrayidx1.i.i62 = getelementptr inbounds nuw i64, ptr %add.ptr15.i, i32 %i.0.i.i56, !dbg !2479
  %10 = load i64, ptr %arrayidx1.i.i62, align 8, !dbg !2480
  %xor.i.i63 = xor i64 %10, %9, !dbg !2480
  store i64 %xor.i.i63, ptr %arrayidx1.i.i62, align 8, !dbg !2480
  %inc.i.i64 = add nuw nsw i32 %i.0.i.i56, 1, !dbg !2481
    #dbg_value(i32 %inc.i.i64, !2469, !DIExpression(), !2471)
  br label %for.cond.i.i55, !dbg !2482, !llvm.loop !2483

m_vec_add.exit.i58:                               ; preds = %for.cond.i.i55
  %inc.i59 = add nuw nsw i32 %col.0.i48, 1, !dbg !2485
    #dbg_value(i32 %inc.i59, !2448, !DIExpression(), !2449)
  br label %for.cond5.i, !dbg !2486, !llvm.loop !2487

for.inc17.i:                                      ; preds = %for.cond5.i
    #dbg_value(i32 %P1_used.1.i, !2421, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2406)
  %inc16.i = add i32 %P1_used.1.i, 1, !dbg !2489
    #dbg_value(i32 %inc16.i, !2421, !DIExpression(), !2406)
  %inc18.i = add nuw nsw i32 %j.0.i46, 1, !dbg !2490
    #dbg_value(i32 %inc18.i, !2438, !DIExpression(), !2439)
  br label %for.cond2.i, !dbg !2491, !llvm.loop !2492

for.cond21.i:                                     ; preds = %for.cond21.i.preheader, %for.inc49.i
  %j20.0.i = phi i32 [ %inc50.i, %for.inc49.i ], [ 0, %for.cond21.i.preheader ], !dbg !2494
    #dbg_value(i32 %j20.0.i, !2495, !DIExpression(), !2496)
  %exitcond75 = icmp ne i32 %j20.0.i, 12, !dbg !2497
  br i1 %exitcond75, label %for.cond26.i.preheader, label %for.inc52.i, !dbg !2442

for.cond26.i.preheader:                           ; preds = %for.cond21.i
  br label %for.cond26.i, !dbg !2499

for.cond26.i:                                     ; preds = %for.cond26.i.preheader, %m_vec_add.exit18.i
  %col25.0.i = phi i32 [ %inc47.i, %m_vec_add.exit18.i ], [ 0, %for.cond26.i.preheader ], !dbg !2502
    #dbg_value(i32 %col25.0.i, !2503, !DIExpression(), !2504)
  %exitcond74 = icmp ne i32 %col25.0.i, 12, !dbg !2505
  br i1 %exitcond74, label %for.body29.i, label %for.inc49.i, !dbg !2499

for.body29.i:                                     ; preds = %for.cond26.i
  %mul30.i47 = mul nuw nsw i32 %row.0.i41, 12, !dbg !2507
  %add31.i = add nuw nsw i32 %mul30.i47, %j20.0.i, !dbg !2509
  %add.ptr33.i.idx = mul nuw nsw i32 %add31.i, 72, !dbg !2510
  %add.ptr33.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %add.ptr33.i.idx, !dbg !2510
  %mul35.i = mul nuw nsw i32 %row.0.i41, 12, !dbg !2511
  %add36.i = add nuw nsw i32 %mul35.i, %col25.0.i, !dbg !2512
  %mul37.i = shl nuw nsw i32 %add36.i, 4, !dbg !2513
  %mul38.i = mul nuw nsw i32 %col25.0.i, 154, !dbg !2514
  %11 = getelementptr i8, ptr %s, i32 %mul38.i, !dbg !2515
  %12 = getelementptr i8, ptr %11, i32 %j20.0.i, !dbg !2515
  %arrayidx41.i = getelementptr i8, ptr %12, i32 142, !dbg !2515
  %13 = load i8, ptr %arrayidx41.i, align 1, !dbg !2515
  %conv42.i = zext i8 %13 to i32, !dbg !2515
  %add43.i = add nuw nsw i32 %mul37.i, %conv42.i, !dbg !2516
  %add.ptr45.i.idx = mul nuw nsw i32 %add43.i, 72, !dbg !2517
  %add.ptr45.i = getelementptr inbounds nuw i8, ptr %accumulator.i39, i32 %add.ptr45.i.idx, !dbg !2517
    #dbg_value(i32 9, !2461, !DIExpression(), !2518)
    #dbg_value(ptr %add.ptr33.i, !2467, !DIExpression(), !2518)
    #dbg_value(ptr %add.ptr45.i, !2468, !DIExpression(), !2518)
    #dbg_value(i32 0, !2469, !DIExpression(), !2520)
  br label %for.cond.i10.i, !dbg !2521

for.cond.i10.i:                                   ; preds = %for.body.i13.i, %for.body29.i
  %i.0.i11.i = phi i32 [ 0, %for.body29.i ], [ %inc.i17.i, %for.body.i13.i ], !dbg !2522
    #dbg_value(i32 %i.0.i11.i, !2469, !DIExpression(), !2520)
  %exitcond73 = icmp ne i32 %i.0.i11.i, 9, !dbg !2523
  br i1 %exitcond73, label %for.body.i13.i, label %m_vec_add.exit18.i, !dbg !2524

for.body.i13.i:                                   ; preds = %for.cond.i10.i
  %arrayidx.i14.i = getelementptr inbounds nuw i64, ptr %add.ptr33.i, i32 %i.0.i11.i, !dbg !2525
  %14 = load i64, ptr %arrayidx.i14.i, align 8, !dbg !2525
  %arrayidx1.i15.i = getelementptr inbounds nuw i64, ptr %add.ptr45.i, i32 %i.0.i11.i, !dbg !2526
  %15 = load i64, ptr %arrayidx1.i15.i, align 8, !dbg !2527
  %xor.i16.i = xor i64 %15, %14, !dbg !2527
  store i64 %xor.i16.i, ptr %arrayidx1.i15.i, align 8, !dbg !2527
  %inc.i17.i = add nuw nsw i32 %i.0.i11.i, 1, !dbg !2528
    #dbg_value(i32 %inc.i17.i, !2469, !DIExpression(), !2520)
  br label %for.cond.i10.i, !dbg !2529, !llvm.loop !2530

m_vec_add.exit18.i:                               ; preds = %for.cond.i10.i
  %inc47.i = add nuw nsw i32 %col25.0.i, 1, !dbg !2532
    #dbg_value(i32 %inc47.i, !2503, !DIExpression(), !2504)
  br label %for.cond26.i, !dbg !2533, !llvm.loop !2534

for.inc49.i:                                      ; preds = %for.cond26.i
  %inc50.i = add nuw nsw i32 %j20.0.i, 1, !dbg !2536
    #dbg_value(i32 %inc50.i, !2495, !DIExpression(), !2496)
  br label %for.cond21.i, !dbg !2537, !llvm.loop !2538

for.inc52.i:                                      ; preds = %for.cond21.i
  %inc53.i = add nuw nsw i32 %row.0.i41, 1, !dbg !2540
    #dbg_value(i32 %inc53.i, !2422, !DIExpression(), !2424)
  %indvars.iv.next = add nsw i32 %indvars.iv, -1, !dbg !2541
  br label %for.cond.i40, !dbg !2541, !llvm.loop !2542

for.cond56.i:                                     ; preds = %for.cond56.i.preheader, %for.inc90.i
  %indvars.iv79 = phi i32 [ 12, %for.cond56.i.preheader ], [ %indvars.iv.next80, %for.inc90.i ], !dbg !2544
  %P3_used.0.i = phi i32 [ %P3_used.1.i.lcssa, %for.inc90.i ], [ 0, %for.cond56.i.preheader ], !dbg !2544
  %row55.0.i = phi i32 [ %inc91.i, %for.inc90.i ], [ 142, %for.cond56.i.preheader ], !dbg !2545
    #dbg_value(i32 %row55.0.i, !2546, !DIExpression(), !2547)
    #dbg_value(i32 %P3_used.0.i, !2548, !DIExpression(), !2406)
  %exitcond82 = icmp ne i32 %row55.0.i, 154, !dbg !2549
  br i1 %exitcond82, label %for.cond61.i.preheader, label %while.cond.i43.preheader, !dbg !2435

for.cond61.i.preheader:                           ; preds = %for.cond56.i
  %16 = add i32 %P3_used.0.i, %indvars.iv79, !dbg !2551
  br label %for.cond61.i, !dbg !2551

while.cond.i43.preheader:                         ; preds = %for.cond56.i
  br label %while.cond.i43, !dbg !2554

for.cond61.i:                                     ; preds = %for.cond61.i.preheader, %for.inc87.i
  %P3_used.1.i = phi i32 [ %inc86.i, %for.inc87.i ], [ %P3_used.0.i, %for.cond61.i.preheader ], !dbg !2406
  %j60.0.i = phi i32 [ %inc88.i, %for.inc87.i ], [ %row55.0.i, %for.cond61.i.preheader ], !dbg !2555
    #dbg_value(i32 %j60.0.i, !2556, !DIExpression(), !2557)
    #dbg_value(i32 %P3_used.1.i, !2548, !DIExpression(), !2406)
  %exitcond81 = icmp ne i32 %P3_used.1.i, %16, !dbg !2558
  br i1 %exitcond81, label %for.cond66.i.preheader, label %for.inc90.i, !dbg !2551

for.cond66.i.preheader:                           ; preds = %for.cond61.i
  br label %for.cond66.i, !dbg !2560

for.cond66.i:                                     ; preds = %for.cond66.i.preheader, %m_vec_add.exit9.i
  %col65.0.i = phi i32 [ %inc84.i, %m_vec_add.exit9.i ], [ 0, %for.cond66.i.preheader ], !dbg !2563
    #dbg_value(i32 %col65.0.i, !2564, !DIExpression(), !2565)
  %exitcond78 = icmp ne i32 %col65.0.i, 12, !dbg !2566
  br i1 %exitcond78, label %for.body69.i, label %for.inc87.i, !dbg !2560

for.body69.i:                                     ; preds = %for.cond66.i
  %add.ptr71.i.idx = mul nsw i32 %P3_used.1.i, 72, !dbg !2568
  %add.ptr71.i = getelementptr inbounds i8, ptr %add.ptr2, i32 %add.ptr71.i.idx, !dbg !2568
  %mul73.i = mul nuw nsw i32 %row55.0.i, 12, !dbg !2570
  %add74.i = add nuw nsw i32 %mul73.i, %col65.0.i, !dbg !2571
  %mul75.i = shl nuw nsw i32 %add74.i, 4, !dbg !2572
  %mul76.i = mul nuw nsw i32 %col65.0.i, 154, !dbg !2573
  %17 = getelementptr i8, ptr %s, i32 %mul76.i, !dbg !2574
  %arrayidx78.i = getelementptr i8, ptr %17, i32 %j60.0.i, !dbg !2574
  %18 = load i8, ptr %arrayidx78.i, align 1, !dbg !2574
  %conv79.i = zext i8 %18 to i32, !dbg !2574
  %add80.i = add nuw nsw i32 %mul75.i, %conv79.i, !dbg !2575
  %add.ptr82.i.idx = mul nuw nsw i32 %add80.i, 72, !dbg !2576
  %add.ptr82.i = getelementptr inbounds nuw i8, ptr %accumulator.i39, i32 %add.ptr82.i.idx, !dbg !2576
    #dbg_value(i32 9, !2461, !DIExpression(), !2577)
    #dbg_value(ptr %add.ptr71.i, !2467, !DIExpression(), !2577)
    #dbg_value(ptr %add.ptr82.i, !2468, !DIExpression(), !2577)
    #dbg_value(i32 0, !2469, !DIExpression(), !2579)
  br label %for.cond.i1.i, !dbg !2580

for.cond.i1.i:                                    ; preds = %for.body.i4.i, %for.body69.i
  %i.0.i2.i = phi i32 [ 0, %for.body69.i ], [ %inc.i8.i, %for.body.i4.i ], !dbg !2581
    #dbg_value(i32 %i.0.i2.i, !2469, !DIExpression(), !2579)
  %exitcond77 = icmp ne i32 %i.0.i2.i, 9, !dbg !2582
  br i1 %exitcond77, label %for.body.i4.i, label %m_vec_add.exit9.i, !dbg !2583

for.body.i4.i:                                    ; preds = %for.cond.i1.i
  %arrayidx.i5.i = getelementptr inbounds nuw i64, ptr %add.ptr71.i, i32 %i.0.i2.i, !dbg !2584
  %19 = load i64, ptr %arrayidx.i5.i, align 8, !dbg !2584
  %arrayidx1.i6.i = getelementptr inbounds nuw i64, ptr %add.ptr82.i, i32 %i.0.i2.i, !dbg !2585
  %20 = load i64, ptr %arrayidx1.i6.i, align 8, !dbg !2586
  %xor.i7.i = xor i64 %20, %19, !dbg !2586
  store i64 %xor.i7.i, ptr %arrayidx1.i6.i, align 8, !dbg !2586
  %inc.i8.i = add nuw nsw i32 %i.0.i2.i, 1, !dbg !2587
    #dbg_value(i32 %inc.i8.i, !2469, !DIExpression(), !2579)
  br label %for.cond.i1.i, !dbg !2588, !llvm.loop !2589

m_vec_add.exit9.i:                                ; preds = %for.cond.i1.i
  %inc84.i = add nuw nsw i32 %col65.0.i, 1, !dbg !2591
    #dbg_value(i32 %inc84.i, !2564, !DIExpression(), !2565)
  br label %for.cond66.i, !dbg !2592, !llvm.loop !2593

for.inc87.i:                                      ; preds = %for.cond66.i
    #dbg_value(i32 %P3_used.1.i, !2548, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2406)
  %inc86.i = add i32 %P3_used.1.i, 1, !dbg !2595
    #dbg_value(i32 %inc86.i, !2548, !DIExpression(), !2406)
  %inc88.i = add nuw nsw i32 %j60.0.i, 1, !dbg !2596
    #dbg_value(i32 %inc88.i, !2556, !DIExpression(), !2557)
  br label %for.cond61.i, !dbg !2597, !llvm.loop !2598

for.inc90.i:                                      ; preds = %for.cond61.i
  %P3_used.1.i.lcssa = phi i32 [ %P3_used.1.i, %for.cond61.i ], !dbg !2406
  %inc91.i = add nuw nsw i32 %row55.0.i, 1, !dbg !2600
    #dbg_value(i32 %inc91.i, !2546, !DIExpression(), !2547)
  %indvars.iv.next80 = add nsw i32 %indvars.iv79, -1, !dbg !2601
  br label %for.cond56.i, !dbg !2601, !llvm.loop !2602

while.cond.i43:                                   ; preds = %while.cond.i43.preheader, %while.body.i45
  %i.0.i44 = phi i32 [ %inc102.i, %while.body.i45 ], [ 0, %while.cond.i43.preheader ], !dbg !2406
    #dbg_value(i32 %i.0.i44, !2604, !DIExpression(), !2406)
  %exitcond83 = icmp ne i32 %i.0.i44, 1848, !dbg !2605
  br i1 %exitcond83, label %while.body.i45, label %mayo_generic_m_calculate_PS.exit, !dbg !2554

while.body.i45:                                   ; preds = %while.cond.i43
  %add.ptr99.i.idx = mul nuw nsw i32 %i.0.i44, 1152, !dbg !2606
  %add.ptr99.i = getelementptr inbounds nuw i8, ptr %accumulator.i39, i32 %add.ptr99.i.idx, !dbg !2606
  %add.ptr101.i.idx = mul nuw nsw i32 %i.0.i44, 72, !dbg !2608
  %add.ptr101.i = getelementptr inbounds nuw i8, ptr %PS.i.i, i32 %add.ptr101.i.idx, !dbg !2608
  call fastcc void @m_vec_multiply_bins(i32 noundef 9, ptr noundef nonnull %add.ptr99.i, ptr noundef nonnull %add.ptr101.i) #9, !dbg !2609
  %inc102.i = add nuw nsw i32 %i.0.i44, 1, !dbg !2610
    #dbg_value(i32 %inc102.i, !2604, !DIExpression(), !2406)
  br label %while.cond.i43, !dbg !2554, !llvm.loop !2611

mayo_generic_m_calculate_PS.exit:                 ; preds = %while.cond.i43
  call void @llvm.lifetime.end.p0(i64 2128896, ptr nonnull %accumulator.i39), !dbg !2613
  call void @llvm.lifetime.start.p0(i64 165888, ptr nonnull %accumulator.i), !dbg !2614
    #dbg_value(ptr %PS.i.i, !2619, !DIExpression(), !2620)
    #dbg_value(ptr %s, !2621, !DIExpression(), !2620)
    #dbg_value(i32 142, !2622, !DIExpression(), !2620)
    #dbg_value(i32 12, !2623, !DIExpression(), !2620)
    #dbg_value(i32 154, !2624, !DIExpression(), !2620)
    #dbg_value(ptr %SPS.i, !2625, !DIExpression(), !2620)
    #dbg_declare(ptr %accumulator.i, !2626, !DIExpression(), !2614)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(165888) %accumulator.i, i8 0, i32 165888, i1 false), !dbg !2614
    #dbg_value(i32 9, !2630, !DIExpression(), !2620)
    #dbg_value(i32 0, !2631, !DIExpression(), !2633)
  br label %for.cond.i32, !dbg !2634

for.cond.i32:                                     ; preds = %for.inc20.i, %mayo_generic_m_calculate_PS.exit
  %row.0.i = phi i32 [ 0, %mayo_generic_m_calculate_PS.exit ], [ %inc21.i, %for.inc20.i ], !dbg !2635
    #dbg_value(i32 %row.0.i, !2631, !DIExpression(), !2633)
  %exitcond87 = icmp ne i32 %row.0.i, 12, !dbg !2636
  br i1 %exitcond87, label %for.cond1.i.preheader, label %while.cond.i.preheader, !dbg !2638

for.cond1.i.preheader:                            ; preds = %for.cond.i32
  br label %for.cond1.i, !dbg !2639

while.cond.i.preheader:                           ; preds = %for.cond.i32
  br label %while.cond.i, !dbg !2642

for.cond1.i:                                      ; preds = %for.cond1.i.preheader, %for.inc18.i
  %j.0.i = phi i32 [ %inc.i35, %for.inc18.i ], [ 0, %for.cond1.i.preheader ], !dbg !2643
    #dbg_value(i32 %j.0.i, !2644, !DIExpression(), !2645)
  %exitcond86 = icmp ne i32 %j.0.i, 154, !dbg !2646
  br i1 %exitcond86, label %for.cond4.i.preheader, label %for.inc20.i, !dbg !2639

for.cond4.i.preheader:                            ; preds = %for.cond1.i
  br label %for.cond4.i, !dbg !2648

for.cond4.i:                                      ; preds = %for.cond4.i.preheader, %m_vec_add.exit.i
  %col.0.i = phi i32 [ %add17.i, %m_vec_add.exit.i ], [ 0, %for.cond4.i.preheader ], !dbg !2651
    #dbg_value(i32 %col.0.i, !2652, !DIExpression(), !2653)
  %exitcond85 = icmp ne i32 %col.0.i, 12, !dbg !2654
  br i1 %exitcond85, label %for.body6.i, label %for.inc18.i, !dbg !2648

for.body6.i:                                      ; preds = %for.cond4.i
  %mul.i36 = mul nuw nsw i32 %j.0.i, 12, !dbg !2656
  %add7.i = add nuw nsw i32 %mul.i36, %col.0.i, !dbg !2658
  %add.ptr.i37.idx = mul nuw nsw i32 %add7.i, 72, !dbg !2659
  %add.ptr.i37 = getelementptr inbounds nuw i8, ptr %PS.i.i, i32 %add.ptr.i37.idx, !dbg !2659
  %mul9.i = mul nuw nsw i32 %row.0.i, 12, !dbg !2660
  %add10.i = add nuw nsw i32 %mul9.i, %col.0.i, !dbg !2661
  %mul11.i = shl nuw nsw i32 %add10.i, 4, !dbg !2662
  %mul12.i = mul nuw nsw i32 %row.0.i, 154, !dbg !2663
  %21 = getelementptr i8, ptr %s, i32 %mul12.i, !dbg !2664
  %arrayidx.i38 = getelementptr i8, ptr %21, i32 %j.0.i, !dbg !2664
  %22 = load i8, ptr %arrayidx.i38, align 1, !dbg !2664
  %conv.i = zext i8 %22 to i32, !dbg !2664
  %add14.i = add nuw nsw i32 %mul11.i, %conv.i, !dbg !2665
  %add.ptr16.i.idx = mul nuw nsw i32 %add14.i, 72, !dbg !2666
  %add.ptr16.i = getelementptr inbounds nuw i8, ptr %accumulator.i, i32 %add.ptr16.i.idx, !dbg !2666
    #dbg_value(i32 9, !2461, !DIExpression(), !2667)
    #dbg_value(ptr %add.ptr.i37, !2467, !DIExpression(), !2667)
    #dbg_value(ptr %add.ptr16.i, !2468, !DIExpression(), !2667)
    #dbg_value(i32 0, !2469, !DIExpression(), !2669)
  br label %for.cond.i.i, !dbg !2670

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body6.i
  %i.0.i.i = phi i32 [ 0, %for.body6.i ], [ %inc.i.i, %for.body.i.i ], !dbg !2671
    #dbg_value(i32 %i.0.i.i, !2469, !DIExpression(), !2669)
  %exitcond84 = icmp ne i32 %i.0.i.i, 9, !dbg !2672
  br i1 %exitcond84, label %for.body.i.i, label %m_vec_add.exit.i, !dbg !2673

for.body.i.i:                                     ; preds = %for.cond.i.i
  %arrayidx.i.i = getelementptr inbounds nuw i64, ptr %add.ptr.i37, i32 %i.0.i.i, !dbg !2674
  %23 = load i64, ptr %arrayidx.i.i, align 8, !dbg !2674
  %arrayidx1.i.i = getelementptr inbounds nuw i64, ptr %add.ptr16.i, i32 %i.0.i.i, !dbg !2675
  %24 = load i64, ptr %arrayidx1.i.i, align 8, !dbg !2676
  %xor.i.i = xor i64 %24, %23, !dbg !2676
  store i64 %xor.i.i, ptr %arrayidx1.i.i, align 8, !dbg !2676
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !2677
    #dbg_value(i32 %inc.i.i, !2469, !DIExpression(), !2669)
  br label %for.cond.i.i, !dbg !2678, !llvm.loop !2679

m_vec_add.exit.i:                                 ; preds = %for.cond.i.i
  %add17.i = add nuw nsw i32 %col.0.i, 1, !dbg !2681
    #dbg_value(i32 %add17.i, !2652, !DIExpression(), !2653)
  br label %for.cond4.i, !dbg !2682, !llvm.loop !2683

for.inc18.i:                                      ; preds = %for.cond4.i
  %inc.i35 = add nuw nsw i32 %j.0.i, 1, !dbg !2685
    #dbg_value(i32 %inc.i35, !2644, !DIExpression(), !2645)
  br label %for.cond1.i, !dbg !2686, !llvm.loop !2687

for.inc20.i:                                      ; preds = %for.cond1.i
  %inc21.i = add nuw nsw i32 %row.0.i, 1, !dbg !2689
    #dbg_value(i32 %inc21.i, !2631, !DIExpression(), !2633)
  br label %for.cond.i32, !dbg !2690, !llvm.loop !2691

while.cond.i:                                     ; preds = %while.cond.i.preheader, %while.body.i
  %i.0.i34 = phi i32 [ %inc32.i, %while.body.i ], [ 0, %while.cond.i.preheader ], !dbg !2620
    #dbg_value(i32 %i.0.i34, !2693, !DIExpression(), !2620)
  %exitcond88 = icmp ne i32 %i.0.i34, 144, !dbg !2694
  br i1 %exitcond88, label %while.body.i, label %mayo_generic_m_calculate_SPS.exit, !dbg !2642

while.body.i:                                     ; preds = %while.cond.i
  %add.ptr29.i.idx = mul nuw nsw i32 %i.0.i34, 1152, !dbg !2695
  %add.ptr29.i = getelementptr inbounds nuw i8, ptr %accumulator.i, i32 %add.ptr29.i.idx, !dbg !2695
  %add.ptr31.i.idx = mul nuw nsw i32 %i.0.i34, 72, !dbg !2697
  %add.ptr31.i = getelementptr inbounds nuw i8, ptr %SPS.i, i32 %add.ptr31.i.idx, !dbg !2697
  call fastcc void @m_vec_multiply_bins(i32 noundef 9, ptr noundef nonnull %add.ptr29.i, ptr noundef nonnull %add.ptr31.i) #9, !dbg !2698
  %inc32.i = add nuw nsw i32 %i.0.i34, 1, !dbg !2699
    #dbg_value(i32 %inc32.i, !2693, !DIExpression(), !2620)
  br label %while.cond.i, !dbg !2642, !llvm.loop !2700

mayo_generic_m_calculate_SPS.exit:                ; preds = %while.cond.i
  call void @llvm.lifetime.end.p0(i64 165888, ptr nonnull %accumulator.i), !dbg !2702
  call void @llvm.lifetime.end.p0(i64 133056, ptr nonnull %PS.i.i), !dbg !2703
    #dbg_declare(ptr %zero.i, !2704, !DIExpression(), !2705)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(142) %zero.i, i8 0, i32 142, i1 false), !dbg !2705
  call fastcc void @compute_rhs(ptr noundef %p, ptr noundef nonnull %SPS.i, ptr noundef nonnull %zero.i, ptr noundef nonnull %y) #9, !dbg !2706
  call void @llvm.lifetime.end.p0(i64 10368, ptr nonnull %SPS.i), !dbg !2707
  call void @llvm.lifetime.end.p0(i64 142, ptr nonnull %zero.i), !dbg !2707
  %call20 = call i32 @memcmp(ptr noundef nonnull %y, ptr noundef nonnull %t, i32 noundef 142) #8, !dbg !2708
  %cmp21 = icmp ne i32 %call20, 0, !dbg !2710
  %. = zext i1 %cmp21 to i32, !dbg !2250
  ret i32 %., !dbg !2711
}

; Function Attrs: nounwind
define dso_local i32 @pqmayo_MAYO_5_ref_mayo_expand_pk(ptr noundef %p, ptr noundef %cpk, ptr noundef %pk) local_unnamed_addr #0 !dbg !248 {
entry:
  %tmp.i2 = alloca [9 x i64], align 8
  %tmp.i = alloca [9 x i64], align 8
    #dbg_value(ptr %p, !247, !DIExpression(), !2712)
    #dbg_value(ptr %cpk, !253, !DIExpression(), !2712)
    #dbg_value(ptr %pk, !254, !DIExpression(), !2712)
    #dbg_value(ptr %p, !255, !DIExpression(), !2713)
    #dbg_value(ptr %pk, !261, !DIExpression(), !2713)
    #dbg_value(ptr %cpk, !262, !DIExpression(), !2713)
  %call.i = call i32 @AES_128_CTR(ptr noundef %pk, i32 noundef 841847, ptr noundef %cpk, i32 noundef 16) #8, !dbg !2715
  call void @llvm.lifetime.start.p0(i64 72, ptr nonnull %tmp.i2), !dbg !2716
    #dbg_value(ptr %pk, !269, !DIExpression(), !2718)
    #dbg_value(ptr %pk, !271, !DIExpression(), !2718)
    #dbg_value(i32 11857, !272, !DIExpression(), !2718)
    #dbg_value(i32 142, !273, !DIExpression(), !2718)
    #dbg_value(i32 9, !274, !DIExpression(), !2718)
    #dbg_value(ptr %pk, !276, !DIExpression(), !2718)
    #dbg_declare(ptr %tmp.i2, !277, !DIExpression(), !2716)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(72) %tmp.i2, i8 0, i32 72, i1 false), !dbg !2716
    #dbg_value(i32 11857, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2719)
  br label %for.cond.i3, !dbg !2720

for.cond.i3:                                      ; preds = %for.body.i7, %entry
  %i.0.in.i4 = phi i32 [ 11857, %entry ], [ %i.0.i5, %for.body.i7 ]
    #dbg_value(i32 %i.0.in.i4, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2719)
  %cmp.i6 = icmp ugt i32 %i.0.in.i4, 0, !dbg !2721
  br i1 %cmp.i6, label %for.body.i7, label %unpack_m_vecs.exit16, !dbg !2722

for.body.i7:                                      ; preds = %for.cond.i3
  %i.0.i5 = add nsw i32 %i.0.in.i4, -1, !dbg !2723
    #dbg_value(i32 %i.0.i5, !281, !DIExpression(), !2719)
  %mul.i8 = mul nsw i32 %i.0.i5, 142, !dbg !2724
  %div1.i91720 = lshr exact i32 %mul.i8, 1, !dbg !2725
  %add.ptr.i10 = getelementptr inbounds nuw i8, ptr %pk, i32 %div1.i91720, !dbg !2726
  %call.i11 = call ptr @memcpy(ptr noundef nonnull %tmp.i2, ptr noundef %add.ptr.i10, i32 noundef 71) #8, !dbg !2727
  %mul4.i13 = mul nsw i32 %i.0.i5, 72, !dbg !2728
  %add.ptr5.i14 = getelementptr inbounds nuw i8, ptr %pk, i32 %mul4.i13, !dbg !2729
  %call8.i15 = call ptr @memcpy(ptr noundef %add.ptr5.i14, ptr noundef nonnull %tmp.i2, i32 noundef 72) #8, !dbg !2730
    #dbg_value(i32 %i.0.i5, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2719)
  br label %for.cond.i3, !dbg !2731, !llvm.loop !2732

unpack_m_vecs.exit16:                             ; preds = %for.cond.i3
  call void @llvm.lifetime.end.p0(i64 72, ptr nonnull %tmp.i2), !dbg !2734
  %add.ptr = getelementptr inbounds nuw i8, ptr %cpk, i32 16, !dbg !2735
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %pk, i32 853704, !dbg !2736
  call void @llvm.lifetime.start.p0(i64 72, ptr nonnull %tmp.i), !dbg !2737
    #dbg_value(ptr %add.ptr, !269, !DIExpression(), !2739)
    #dbg_value(ptr %add.ptr2, !271, !DIExpression(), !2739)
    #dbg_value(i32 78, !272, !DIExpression(), !2739)
    #dbg_value(i32 142, !273, !DIExpression(), !2739)
    #dbg_value(i32 9, !274, !DIExpression(), !2739)
    #dbg_value(ptr %add.ptr2, !276, !DIExpression(), !2739)
    #dbg_declare(ptr %tmp.i, !277, !DIExpression(), !2737)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(72) %tmp.i, i8 0, i32 72, i1 false), !dbg !2737
    #dbg_value(i32 78, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2740)
  br label %for.cond.i, !dbg !2741

for.cond.i:                                       ; preds = %for.body.i, %unpack_m_vecs.exit16
  %i.0.in.i = phi i32 [ 78, %unpack_m_vecs.exit16 ], [ %i.0.i, %for.body.i ]
    #dbg_value(i32 %i.0.in.i, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2740)
  %cmp.i = icmp ugt i32 %i.0.in.i, 0, !dbg !2742
  br i1 %cmp.i, label %for.body.i, label %unpack_m_vecs.exit, !dbg !2743

for.body.i:                                       ; preds = %for.cond.i
  %i.0.i = add nsw i32 %i.0.in.i, -1, !dbg !2744
    #dbg_value(i32 %i.0.i, !281, !DIExpression(), !2740)
  %mul.i = mul nsw i32 %i.0.i, 142, !dbg !2745
  %div1.i1819 = lshr exact i32 %mul.i, 1, !dbg !2746
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %div1.i1819, !dbg !2747
  %call.i1 = call ptr @memcpy(ptr noundef nonnull %tmp.i, ptr noundef nonnull %add.ptr.i, i32 noundef 71) #8, !dbg !2748
  %mul4.i = mul nsw i32 %i.0.i, 72, !dbg !2749
  %add.ptr5.i = getelementptr inbounds nuw i8, ptr %add.ptr2, i32 %mul4.i, !dbg !2750
  %call8.i = call ptr @memcpy(ptr noundef nonnull %add.ptr5.i, ptr noundef nonnull %tmp.i, i32 noundef 72) #8, !dbg !2751
    #dbg_value(i32 %i.0.i, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2740)
  br label %for.cond.i, !dbg !2752, !llvm.loop !2753

unpack_m_vecs.exit:                               ; preds = %for.cond.i
  call void @llvm.lifetime.end.p0(i64 72, ptr nonnull %tmp.i), !dbg !2755
  ret i32 0, !dbg !2756
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_multiply_bins(i32 noundef %m_vec_limbs, ptr noundef %bins, ptr noundef %out) unnamed_addr #0 !dbg !2757 {
entry:
    #dbg_value(i32 %m_vec_limbs, !2760, !DIExpression(), !2761)
    #dbg_value(ptr %bins, !2762, !DIExpression(), !2761)
    #dbg_value(ptr %out, !2763, !DIExpression(), !2761)
  %add.ptr = getelementptr inbounds nuw i8, ptr %bins, i32 360, !dbg !2764
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %bins, i32 720, !dbg !2765
    #dbg_value(i32 %m_vec_limbs, !2766, !DIExpression(), !2768)
    #dbg_value(ptr %add.ptr, !2770, !DIExpression(), !2768)
    #dbg_value(ptr %add.ptr1, !2771, !DIExpression(), !2768)
    #dbg_value(i64 1229782938247303441, !2772, !DIExpression(), !2768)
    #dbg_value(i32 0, !2773, !DIExpression(), !2775)
  br label %for.cond.i77, !dbg !2776

for.cond.i77:                                     ; preds = %for.body.i80, %entry
  %i.0.i78 = phi i32 [ 0, %entry ], [ %inc.i89, %for.body.i80 ], !dbg !2777
    #dbg_value(i32 %i.0.i78, !2773, !DIExpression(), !2775)
  %exitcond = icmp ne i32 %i.0.i78, 9, !dbg !2778
  br i1 %exitcond, label %for.body.i80, label %m_vec_mul_add_x_inv.exit90, !dbg !2780

for.body.i80:                                     ; preds = %for.cond.i77
  %arrayidx.i81 = getelementptr inbounds nuw i64, ptr %add.ptr, i32 %i.0.i78, !dbg !2781
  %0 = load i64, ptr %arrayidx.i81, align 8, !dbg !2781
  %and.i82 = and i64 %0, 1229782938247303441, !dbg !2783
    #dbg_value(i64 %and.i82, !2784, !DIExpression(), !2785)
  %xor.i83 = lshr i64 %0, 1, !dbg !2786
  %shr.i84 = and i64 %xor.i83, 8608480567731124087, !dbg !2786
  %mul.i85 = mul nuw i64 %and.i82, 9, !dbg !2787
  %xor2.i86 = xor i64 %shr.i84, %mul.i85, !dbg !2788
  %arrayidx3.i87 = getelementptr inbounds nuw i64, ptr %add.ptr1, i32 %i.0.i78, !dbg !2789
  %1 = load i64, ptr %arrayidx3.i87, align 8, !dbg !2790
  %xor4.i88 = xor i64 %1, %xor2.i86, !dbg !2790
  store i64 %xor4.i88, ptr %arrayidx3.i87, align 8, !dbg !2790
  %inc.i89 = add nuw nsw i32 %i.0.i78, 1, !dbg !2791
    #dbg_value(i32 %inc.i89, !2773, !DIExpression(), !2775)
  br label %for.cond.i77, !dbg !2792, !llvm.loop !2793

m_vec_mul_add_x_inv.exit90:                       ; preds = %for.cond.i77
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %bins, i32 792, !dbg !2795
  %add.ptr3 = getelementptr inbounds nuw i8, ptr %bins, i32 864, !dbg !2796
    #dbg_value(i32 %m_vec_limbs, !2797, !DIExpression(), !2799)
    #dbg_value(ptr %add.ptr2, !2801, !DIExpression(), !2799)
    #dbg_value(ptr %add.ptr3, !2802, !DIExpression(), !2799)
    #dbg_value(i64 -8608480567731124088, !2803, !DIExpression(), !2799)
    #dbg_value(i32 0, !2804, !DIExpression(), !2806)
  br label %for.cond.i104, !dbg !2807

for.cond.i104:                                    ; preds = %for.body.i107, %m_vec_mul_add_x_inv.exit90
  %i.0.i105 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit90 ], [ %inc.i117, %for.body.i107 ], !dbg !2808
    #dbg_value(i32 %i.0.i105, !2804, !DIExpression(), !2806)
  %exitcond194 = icmp ne i32 %i.0.i105, 9, !dbg !2809
  br i1 %exitcond194, label %for.body.i107, label %m_vec_mul_add_x.exit118, !dbg !2811

for.body.i107:                                    ; preds = %for.cond.i104
  %arrayidx.i108 = getelementptr inbounds nuw i64, ptr %add.ptr2, i32 %i.0.i105, !dbg !2812
  %2 = load i64, ptr %arrayidx.i108, align 8, !dbg !2812
    #dbg_value(i64 %2, !2814, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2815)
  %xor.i109 = shl i64 %2, 1, !dbg !2816
  %shl.i110 = and i64 %xor.i109, -1229782938247303442, !dbg !2816
  %and.i111 = lshr i64 %2, 3, !dbg !2817
  %shr.i112 = and i64 %and.i111, 1229782938247303441, !dbg !2817
  %mul.i113 = mul nuw nsw i64 %shr.i112, 3, !dbg !2818
  %xor2.i114 = xor i64 %shl.i110, %mul.i113, !dbg !2819
  %arrayidx3.i115 = getelementptr inbounds nuw i64, ptr %add.ptr3, i32 %i.0.i105, !dbg !2820
  %3 = load i64, ptr %arrayidx3.i115, align 8, !dbg !2821
  %xor4.i116 = xor i64 %3, %xor2.i114, !dbg !2821
  store i64 %xor4.i116, ptr %arrayidx3.i115, align 8, !dbg !2821
  %inc.i117 = add nuw nsw i32 %i.0.i105, 1, !dbg !2822
    #dbg_value(i32 %inc.i117, !2804, !DIExpression(), !2806)
  br label %for.cond.i104, !dbg !2823, !llvm.loop !2824

m_vec_mul_add_x.exit118:                          ; preds = %for.cond.i104
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %bins, i32 720, !dbg !2826
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %bins, i32 504, !dbg !2827
    #dbg_value(i32 %m_vec_limbs, !2766, !DIExpression(), !2828)
    #dbg_value(ptr %add.ptr4, !2770, !DIExpression(), !2828)
    #dbg_value(ptr %add.ptr5, !2771, !DIExpression(), !2828)
    #dbg_value(i64 1229782938247303441, !2772, !DIExpression(), !2828)
    #dbg_value(i32 0, !2773, !DIExpression(), !2830)
  br label %for.cond.i49, !dbg !2831

for.cond.i49:                                     ; preds = %for.body.i52, %m_vec_mul_add_x.exit118
  %i.0.i50 = phi i32 [ 0, %m_vec_mul_add_x.exit118 ], [ %inc.i61, %for.body.i52 ], !dbg !2832
    #dbg_value(i32 %i.0.i50, !2773, !DIExpression(), !2830)
  %exitcond195 = icmp ne i32 %i.0.i50, 9, !dbg !2833
  br i1 %exitcond195, label %for.body.i52, label %m_vec_mul_add_x_inv.exit62, !dbg !2834

for.body.i52:                                     ; preds = %for.cond.i49
  %arrayidx.i53 = getelementptr inbounds nuw i64, ptr %add.ptr4, i32 %i.0.i50, !dbg !2835
  %4 = load i64, ptr %arrayidx.i53, align 8, !dbg !2835
  %and.i54 = and i64 %4, 1229782938247303441, !dbg !2836
    #dbg_value(i64 %and.i54, !2784, !DIExpression(), !2837)
  %xor.i55 = lshr i64 %4, 1, !dbg !2838
  %shr.i56 = and i64 %xor.i55, 8608480567731124087, !dbg !2838
  %mul.i57 = mul nuw i64 %and.i54, 9, !dbg !2839
  %xor2.i58 = xor i64 %shr.i56, %mul.i57, !dbg !2840
  %arrayidx3.i59 = getelementptr inbounds nuw i64, ptr %add.ptr5, i32 %i.0.i50, !dbg !2841
  %5 = load i64, ptr %arrayidx3.i59, align 8, !dbg !2842
  %xor4.i60 = xor i64 %5, %xor2.i58, !dbg !2842
  store i64 %xor4.i60, ptr %arrayidx3.i59, align 8, !dbg !2842
  %inc.i61 = add nuw nsw i32 %i.0.i50, 1, !dbg !2843
    #dbg_value(i32 %inc.i61, !2773, !DIExpression(), !2830)
  br label %for.cond.i49, !dbg !2844, !llvm.loop !2845

m_vec_mul_add_x_inv.exit62:                       ; preds = %for.cond.i49
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %bins, i32 864, !dbg !2847
  %add.ptr7 = getelementptr inbounds nuw i8, ptr %bins, i32 432, !dbg !2848
    #dbg_value(i32 %m_vec_limbs, !2797, !DIExpression(), !2849)
    #dbg_value(ptr %add.ptr6, !2801, !DIExpression(), !2849)
    #dbg_value(ptr %add.ptr7, !2802, !DIExpression(), !2849)
    #dbg_value(i64 -8608480567731124088, !2803, !DIExpression(), !2849)
    #dbg_value(i32 0, !2804, !DIExpression(), !2851)
  br label %for.cond.i91, !dbg !2852

for.cond.i91:                                     ; preds = %for.body.i94, %m_vec_mul_add_x_inv.exit62
  %i.0.i92 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit62 ], [ %inc.i103, %for.body.i94 ], !dbg !2853
    #dbg_value(i32 %i.0.i92, !2804, !DIExpression(), !2851)
  %exitcond196 = icmp ne i32 %i.0.i92, 9, !dbg !2854
  br i1 %exitcond196, label %for.body.i94, label %m_vec_mul_add_x.exit, !dbg !2855

for.body.i94:                                     ; preds = %for.cond.i91
  %arrayidx.i95 = getelementptr inbounds nuw i64, ptr %add.ptr6, i32 %i.0.i92, !dbg !2856
  %6 = load i64, ptr %arrayidx.i95, align 8, !dbg !2856
    #dbg_value(i64 %6, !2814, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2857)
  %xor.i96 = shl i64 %6, 1, !dbg !2858
  %shl.i = and i64 %xor.i96, -1229782938247303442, !dbg !2858
  %and.i97 = lshr i64 %6, 3, !dbg !2859
  %shr.i98 = and i64 %and.i97, 1229782938247303441, !dbg !2859
  %mul.i99 = mul nuw nsw i64 %shr.i98, 3, !dbg !2860
  %xor2.i100 = xor i64 %shl.i, %mul.i99, !dbg !2861
  %arrayidx3.i101 = getelementptr inbounds nuw i64, ptr %add.ptr7, i32 %i.0.i92, !dbg !2862
  %7 = load i64, ptr %arrayidx3.i101, align 8, !dbg !2863
  %xor4.i102 = xor i64 %7, %xor2.i100, !dbg !2863
  store i64 %xor4.i102, ptr %arrayidx3.i101, align 8, !dbg !2863
  %inc.i103 = add nuw nsw i32 %i.0.i92, 1, !dbg !2864
    #dbg_value(i32 %inc.i103, !2804, !DIExpression(), !2851)
  br label %for.cond.i91, !dbg !2865, !llvm.loop !2866

m_vec_mul_add_x.exit:                             ; preds = %for.cond.i91
  %add.ptr8 = getelementptr inbounds nuw i8, ptr %bins, i32 504, !dbg !2868
  %add.ptr9 = getelementptr inbounds nuw i8, ptr %bins, i32 1008, !dbg !2869
    #dbg_value(i32 %m_vec_limbs, !2766, !DIExpression(), !2870)
    #dbg_value(ptr %add.ptr8, !2770, !DIExpression(), !2870)
    #dbg_value(ptr %add.ptr9, !2771, !DIExpression(), !2870)
    #dbg_value(i64 1229782938247303441, !2772, !DIExpression(), !2870)
    #dbg_value(i32 0, !2773, !DIExpression(), !2872)
  br label %for.cond.i7, !dbg !2873

for.cond.i7:                                      ; preds = %for.body.i10, %m_vec_mul_add_x.exit
  %i.0.i8 = phi i32 [ 0, %m_vec_mul_add_x.exit ], [ %inc.i19, %for.body.i10 ], !dbg !2874
    #dbg_value(i32 %i.0.i8, !2773, !DIExpression(), !2872)
  %exitcond197 = icmp ne i32 %i.0.i8, 9, !dbg !2875
  br i1 %exitcond197, label %for.body.i10, label %m_vec_mul_add_x_inv.exit20, !dbg !2876

for.body.i10:                                     ; preds = %for.cond.i7
  %arrayidx.i11 = getelementptr inbounds nuw i64, ptr %add.ptr8, i32 %i.0.i8, !dbg !2877
  %8 = load i64, ptr %arrayidx.i11, align 8, !dbg !2877
  %and.i12 = and i64 %8, 1229782938247303441, !dbg !2878
    #dbg_value(i64 %and.i12, !2784, !DIExpression(), !2879)
  %xor.i13 = lshr i64 %8, 1, !dbg !2880
  %shr.i14 = and i64 %xor.i13, 8608480567731124087, !dbg !2880
  %mul.i15 = mul nuw i64 %and.i12, 9, !dbg !2881
  %xor2.i16 = xor i64 %shr.i14, %mul.i15, !dbg !2882
  %arrayidx3.i17 = getelementptr inbounds nuw i64, ptr %add.ptr9, i32 %i.0.i8, !dbg !2883
  %9 = load i64, ptr %arrayidx3.i17, align 8, !dbg !2884
  %xor4.i18 = xor i64 %9, %xor2.i16, !dbg !2884
  store i64 %xor4.i18, ptr %arrayidx3.i17, align 8, !dbg !2884
  %inc.i19 = add nuw nsw i32 %i.0.i8, 1, !dbg !2885
    #dbg_value(i32 %inc.i19, !2773, !DIExpression(), !2872)
  br label %for.cond.i7, !dbg !2886, !llvm.loop !2887

m_vec_mul_add_x_inv.exit20:                       ; preds = %for.cond.i7
  %add.ptr10 = getelementptr inbounds nuw i8, ptr %bins, i32 432, !dbg !2889
  %add.ptr11 = getelementptr inbounds nuw i8, ptr %bins, i32 216, !dbg !2890
    #dbg_value(i32 %m_vec_limbs, !2797, !DIExpression(), !2891)
    #dbg_value(ptr %add.ptr10, !2801, !DIExpression(), !2891)
    #dbg_value(ptr %add.ptr11, !2802, !DIExpression(), !2891)
    #dbg_value(i64 -8608480567731124088, !2803, !DIExpression(), !2891)
    #dbg_value(i32 0, !2804, !DIExpression(), !2893)
  br label %for.cond.i149, !dbg !2894

for.cond.i149:                                    ; preds = %for.body.i152, %m_vec_mul_add_x_inv.exit20
  %i.0.i150 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit20 ], [ %inc.i162, %for.body.i152 ], !dbg !2895
    #dbg_value(i32 %i.0.i150, !2804, !DIExpression(), !2893)
  %exitcond198 = icmp ne i32 %i.0.i150, 9, !dbg !2896
  br i1 %exitcond198, label %for.body.i152, label %m_vec_mul_add_x.exit163, !dbg !2897

for.body.i152:                                    ; preds = %for.cond.i149
  %arrayidx.i153 = getelementptr inbounds nuw i64, ptr %add.ptr10, i32 %i.0.i150, !dbg !2898
  %10 = load i64, ptr %arrayidx.i153, align 8, !dbg !2898
    #dbg_value(i64 %10, !2814, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2899)
  %xor.i154 = shl i64 %10, 1, !dbg !2900
  %shl.i155 = and i64 %xor.i154, -1229782938247303442, !dbg !2900
  %and.i156 = lshr i64 %10, 3, !dbg !2901
  %shr.i157 = and i64 %and.i156, 1229782938247303441, !dbg !2901
  %mul.i158 = mul nuw nsw i64 %shr.i157, 3, !dbg !2902
  %xor2.i159 = xor i64 %shl.i155, %mul.i158, !dbg !2903
  %arrayidx3.i160 = getelementptr inbounds nuw i64, ptr %add.ptr11, i32 %i.0.i150, !dbg !2904
  %11 = load i64, ptr %arrayidx3.i160, align 8, !dbg !2905
  %xor4.i161 = xor i64 %11, %xor2.i159, !dbg !2905
  store i64 %xor4.i161, ptr %arrayidx3.i160, align 8, !dbg !2905
  %inc.i162 = add nuw nsw i32 %i.0.i150, 1, !dbg !2906
    #dbg_value(i32 %inc.i162, !2804, !DIExpression(), !2893)
  br label %for.cond.i149, !dbg !2907, !llvm.loop !2908

m_vec_mul_add_x.exit163:                          ; preds = %for.cond.i149
  %add.ptr12 = getelementptr inbounds nuw i8, ptr %bins, i32 1008, !dbg !2910
  %add.ptr13 = getelementptr inbounds nuw i8, ptr %bins, i32 1080, !dbg !2911
    #dbg_value(i32 %m_vec_limbs, !2766, !DIExpression(), !2912)
    #dbg_value(ptr %add.ptr12, !2770, !DIExpression(), !2912)
    #dbg_value(ptr %add.ptr13, !2771, !DIExpression(), !2912)
    #dbg_value(i64 1229782938247303441, !2772, !DIExpression(), !2912)
    #dbg_value(i32 0, !2773, !DIExpression(), !2914)
  br label %for.cond.i63, !dbg !2915

for.cond.i63:                                     ; preds = %for.body.i66, %m_vec_mul_add_x.exit163
  %i.0.i64 = phi i32 [ 0, %m_vec_mul_add_x.exit163 ], [ %inc.i75, %for.body.i66 ], !dbg !2916
    #dbg_value(i32 %i.0.i64, !2773, !DIExpression(), !2914)
  %exitcond199 = icmp ne i32 %i.0.i64, 9, !dbg !2917
  br i1 %exitcond199, label %for.body.i66, label %m_vec_mul_add_x_inv.exit76, !dbg !2918

for.body.i66:                                     ; preds = %for.cond.i63
  %arrayidx.i67 = getelementptr inbounds nuw i64, ptr %add.ptr12, i32 %i.0.i64, !dbg !2919
  %12 = load i64, ptr %arrayidx.i67, align 8, !dbg !2919
  %and.i68 = and i64 %12, 1229782938247303441, !dbg !2920
    #dbg_value(i64 %and.i68, !2784, !DIExpression(), !2921)
  %xor.i69 = lshr i64 %12, 1, !dbg !2922
  %shr.i70 = and i64 %xor.i69, 8608480567731124087, !dbg !2922
  %mul.i71 = mul nuw i64 %and.i68, 9, !dbg !2923
  %xor2.i72 = xor i64 %shr.i70, %mul.i71, !dbg !2924
  %arrayidx3.i73 = getelementptr inbounds nuw i64, ptr %add.ptr13, i32 %i.0.i64, !dbg !2925
  %13 = load i64, ptr %arrayidx3.i73, align 8, !dbg !2926
  %xor4.i74 = xor i64 %13, %xor2.i72, !dbg !2926
  store i64 %xor4.i74, ptr %arrayidx3.i73, align 8, !dbg !2926
  %inc.i75 = add nuw nsw i32 %i.0.i64, 1, !dbg !2927
    #dbg_value(i32 %inc.i75, !2773, !DIExpression(), !2914)
  br label %for.cond.i63, !dbg !2928, !llvm.loop !2929

m_vec_mul_add_x_inv.exit76:                       ; preds = %for.cond.i63
  %add.ptr14 = getelementptr inbounds nuw i8, ptr %bins, i32 216, !dbg !2931
  %add.ptr15 = getelementptr inbounds nuw i8, ptr %bins, i32 576, !dbg !2932
    #dbg_value(i32 %m_vec_limbs, !2797, !DIExpression(), !2933)
    #dbg_value(ptr %add.ptr14, !2801, !DIExpression(), !2933)
    #dbg_value(ptr %add.ptr15, !2802, !DIExpression(), !2933)
    #dbg_value(i64 -8608480567731124088, !2803, !DIExpression(), !2933)
    #dbg_value(i32 0, !2804, !DIExpression(), !2935)
  br label %for.cond.i119, !dbg !2936

for.cond.i119:                                    ; preds = %for.body.i122, %m_vec_mul_add_x_inv.exit76
  %i.0.i120 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit76 ], [ %inc.i132, %for.body.i122 ], !dbg !2937
    #dbg_value(i32 %i.0.i120, !2804, !DIExpression(), !2935)
  %exitcond200 = icmp ne i32 %i.0.i120, 9, !dbg !2938
  br i1 %exitcond200, label %for.body.i122, label %m_vec_mul_add_x.exit133, !dbg !2939

for.body.i122:                                    ; preds = %for.cond.i119
  %arrayidx.i123 = getelementptr inbounds nuw i64, ptr %add.ptr14, i32 %i.0.i120, !dbg !2940
  %14 = load i64, ptr %arrayidx.i123, align 8, !dbg !2940
    #dbg_value(i64 %14, !2814, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2941)
  %xor.i124 = shl i64 %14, 1, !dbg !2942
  %shl.i125 = and i64 %xor.i124, -1229782938247303442, !dbg !2942
  %and.i126 = lshr i64 %14, 3, !dbg !2943
  %shr.i127 = and i64 %and.i126, 1229782938247303441, !dbg !2943
  %mul.i128 = mul nuw nsw i64 %shr.i127, 3, !dbg !2944
  %xor2.i129 = xor i64 %shl.i125, %mul.i128, !dbg !2945
  %arrayidx3.i130 = getelementptr inbounds nuw i64, ptr %add.ptr15, i32 %i.0.i120, !dbg !2946
  %15 = load i64, ptr %arrayidx3.i130, align 8, !dbg !2947
  %xor4.i131 = xor i64 %15, %xor2.i129, !dbg !2947
  store i64 %xor4.i131, ptr %arrayidx3.i130, align 8, !dbg !2947
  %inc.i132 = add nuw nsw i32 %i.0.i120, 1, !dbg !2948
    #dbg_value(i32 %inc.i132, !2804, !DIExpression(), !2935)
  br label %for.cond.i119, !dbg !2949, !llvm.loop !2950

m_vec_mul_add_x.exit133:                          ; preds = %for.cond.i119
  %add.ptr16 = getelementptr inbounds nuw i8, ptr %bins, i32 1080, !dbg !2952
  %add.ptr17 = getelementptr inbounds nuw i8, ptr %bins, i32 936, !dbg !2953
    #dbg_value(i32 %m_vec_limbs, !2766, !DIExpression(), !2954)
    #dbg_value(ptr %add.ptr16, !2770, !DIExpression(), !2954)
    #dbg_value(ptr %add.ptr17, !2771, !DIExpression(), !2954)
    #dbg_value(i64 1229782938247303441, !2772, !DIExpression(), !2954)
    #dbg_value(i32 0, !2773, !DIExpression(), !2956)
  br label %for.cond.i1, !dbg !2957

for.cond.i1:                                      ; preds = %for.body.i4, %m_vec_mul_add_x.exit133
  %i.0.i2 = phi i32 [ 0, %m_vec_mul_add_x.exit133 ], [ %inc.i6, %for.body.i4 ], !dbg !2958
    #dbg_value(i32 %i.0.i2, !2773, !DIExpression(), !2956)
  %exitcond201 = icmp ne i32 %i.0.i2, 9, !dbg !2959
  br i1 %exitcond201, label %for.body.i4, label %m_vec_mul_add_x_inv.exit, !dbg !2960

for.body.i4:                                      ; preds = %for.cond.i1
  %arrayidx.i5 = getelementptr inbounds nuw i64, ptr %add.ptr16, i32 %i.0.i2, !dbg !2961
  %16 = load i64, ptr %arrayidx.i5, align 8, !dbg !2961
  %and.i = and i64 %16, 1229782938247303441, !dbg !2962
    #dbg_value(i64 %and.i, !2784, !DIExpression(), !2963)
  %xor.i = lshr i64 %16, 1, !dbg !2964
  %shr.i = and i64 %xor.i, 8608480567731124087, !dbg !2964
  %mul.i = mul nuw i64 %and.i, 9, !dbg !2965
  %xor2.i = xor i64 %shr.i, %mul.i, !dbg !2966
  %arrayidx3.i = getelementptr inbounds nuw i64, ptr %add.ptr17, i32 %i.0.i2, !dbg !2967
  %17 = load i64, ptr %arrayidx3.i, align 8, !dbg !2968
  %xor4.i = xor i64 %17, %xor2.i, !dbg !2968
  store i64 %xor4.i, ptr %arrayidx3.i, align 8, !dbg !2968
  %inc.i6 = add nuw nsw i32 %i.0.i2, 1, !dbg !2969
    #dbg_value(i32 %inc.i6, !2773, !DIExpression(), !2956)
  br label %for.cond.i1, !dbg !2970, !llvm.loop !2971

m_vec_mul_add_x_inv.exit:                         ; preds = %for.cond.i1
  %add.ptr18 = getelementptr inbounds nuw i8, ptr %bins, i32 576, !dbg !2973
  %add.ptr19 = getelementptr inbounds nuw i8, ptr %bins, i32 288, !dbg !2974
    #dbg_value(i32 %m_vec_limbs, !2797, !DIExpression(), !2975)
    #dbg_value(ptr %add.ptr18, !2801, !DIExpression(), !2975)
    #dbg_value(ptr %add.ptr19, !2802, !DIExpression(), !2975)
    #dbg_value(i64 -8608480567731124088, !2803, !DIExpression(), !2975)
    #dbg_value(i32 0, !2804, !DIExpression(), !2977)
  br label %for.cond.i134, !dbg !2978

for.cond.i134:                                    ; preds = %for.body.i137, %m_vec_mul_add_x_inv.exit
  %i.0.i135 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit ], [ %inc.i147, %for.body.i137 ], !dbg !2979
    #dbg_value(i32 %i.0.i135, !2804, !DIExpression(), !2977)
  %exitcond202 = icmp ne i32 %i.0.i135, 9, !dbg !2980
  br i1 %exitcond202, label %for.body.i137, label %m_vec_mul_add_x.exit148, !dbg !2981

for.body.i137:                                    ; preds = %for.cond.i134
  %arrayidx.i138 = getelementptr inbounds nuw i64, ptr %add.ptr18, i32 %i.0.i135, !dbg !2982
  %18 = load i64, ptr %arrayidx.i138, align 8, !dbg !2982
    #dbg_value(i64 %18, !2814, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2983)
  %xor.i139 = shl i64 %18, 1, !dbg !2984
  %shl.i140 = and i64 %xor.i139, -1229782938247303442, !dbg !2984
  %and.i141 = lshr i64 %18, 3, !dbg !2985
  %shr.i142 = and i64 %and.i141, 1229782938247303441, !dbg !2985
  %mul.i143 = mul nuw nsw i64 %shr.i142, 3, !dbg !2986
  %xor2.i144 = xor i64 %shl.i140, %mul.i143, !dbg !2987
  %arrayidx3.i145 = getelementptr inbounds nuw i64, ptr %add.ptr19, i32 %i.0.i135, !dbg !2988
  %19 = load i64, ptr %arrayidx3.i145, align 8, !dbg !2989
  %xor4.i146 = xor i64 %19, %xor2.i144, !dbg !2989
  store i64 %xor4.i146, ptr %arrayidx3.i145, align 8, !dbg !2989
  %inc.i147 = add nuw nsw i32 %i.0.i135, 1, !dbg !2990
    #dbg_value(i32 %inc.i147, !2804, !DIExpression(), !2977)
  br label %for.cond.i134, !dbg !2991, !llvm.loop !2992

m_vec_mul_add_x.exit148:                          ; preds = %for.cond.i134
  %add.ptr20 = getelementptr inbounds nuw i8, ptr %bins, i32 936, !dbg !2994
  %add.ptr21 = getelementptr inbounds nuw i8, ptr %bins, i32 648, !dbg !2995
    #dbg_value(i32 %m_vec_limbs, !2766, !DIExpression(), !2996)
    #dbg_value(ptr %add.ptr20, !2770, !DIExpression(), !2996)
    #dbg_value(ptr %add.ptr21, !2771, !DIExpression(), !2996)
    #dbg_value(i64 1229782938247303441, !2772, !DIExpression(), !2996)
    #dbg_value(i32 0, !2773, !DIExpression(), !2998)
  br label %for.cond.i35, !dbg !2999

for.cond.i35:                                     ; preds = %for.body.i38, %m_vec_mul_add_x.exit148
  %i.0.i36 = phi i32 [ 0, %m_vec_mul_add_x.exit148 ], [ %inc.i47, %for.body.i38 ], !dbg !3000
    #dbg_value(i32 %i.0.i36, !2773, !DIExpression(), !2998)
  %exitcond203 = icmp ne i32 %i.0.i36, 9, !dbg !3001
  br i1 %exitcond203, label %for.body.i38, label %m_vec_mul_add_x_inv.exit48, !dbg !3002

for.body.i38:                                     ; preds = %for.cond.i35
  %arrayidx.i39 = getelementptr inbounds nuw i64, ptr %add.ptr20, i32 %i.0.i36, !dbg !3003
  %20 = load i64, ptr %arrayidx.i39, align 8, !dbg !3003
  %and.i40 = and i64 %20, 1229782938247303441, !dbg !3004
    #dbg_value(i64 %and.i40, !2784, !DIExpression(), !3005)
  %xor.i41 = lshr i64 %20, 1, !dbg !3006
  %shr.i42 = and i64 %xor.i41, 8608480567731124087, !dbg !3006
  %mul.i43 = mul nuw i64 %and.i40, 9, !dbg !3007
  %xor2.i44 = xor i64 %shr.i42, %mul.i43, !dbg !3008
  %arrayidx3.i45 = getelementptr inbounds nuw i64, ptr %add.ptr21, i32 %i.0.i36, !dbg !3009
  %21 = load i64, ptr %arrayidx3.i45, align 8, !dbg !3010
  %xor4.i46 = xor i64 %21, %xor2.i44, !dbg !3010
  store i64 %xor4.i46, ptr %arrayidx3.i45, align 8, !dbg !3010
  %inc.i47 = add nuw nsw i32 %i.0.i36, 1, !dbg !3011
    #dbg_value(i32 %inc.i47, !2773, !DIExpression(), !2998)
  br label %for.cond.i35, !dbg !3012, !llvm.loop !3013

m_vec_mul_add_x_inv.exit48:                       ; preds = %for.cond.i35
  %add.ptr22 = getelementptr inbounds nuw i8, ptr %bins, i32 288, !dbg !3015
  %add.ptr23 = getelementptr inbounds nuw i8, ptr %bins, i32 144, !dbg !3016
    #dbg_value(i32 %m_vec_limbs, !2797, !DIExpression(), !3017)
    #dbg_value(ptr %add.ptr22, !2801, !DIExpression(), !3017)
    #dbg_value(ptr %add.ptr23, !2802, !DIExpression(), !3017)
    #dbg_value(i64 -8608480567731124088, !2803, !DIExpression(), !3017)
    #dbg_value(i32 0, !2804, !DIExpression(), !3019)
  br label %for.cond.i179, !dbg !3020

for.cond.i179:                                    ; preds = %for.body.i182, %m_vec_mul_add_x_inv.exit48
  %i.0.i180 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit48 ], [ %inc.i192, %for.body.i182 ], !dbg !3021
    #dbg_value(i32 %i.0.i180, !2804, !DIExpression(), !3019)
  %exitcond204 = icmp ne i32 %i.0.i180, 9, !dbg !3022
  br i1 %exitcond204, label %for.body.i182, label %m_vec_mul_add_x.exit193, !dbg !3023

for.body.i182:                                    ; preds = %for.cond.i179
  %arrayidx.i183 = getelementptr inbounds nuw i64, ptr %add.ptr22, i32 %i.0.i180, !dbg !3024
  %22 = load i64, ptr %arrayidx.i183, align 8, !dbg !3024
    #dbg_value(i64 %22, !2814, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !3025)
  %xor.i184 = shl i64 %22, 1, !dbg !3026
  %shl.i185 = and i64 %xor.i184, -1229782938247303442, !dbg !3026
  %and.i186 = lshr i64 %22, 3, !dbg !3027
  %shr.i187 = and i64 %and.i186, 1229782938247303441, !dbg !3027
  %mul.i188 = mul nuw nsw i64 %shr.i187, 3, !dbg !3028
  %xor2.i189 = xor i64 %shl.i185, %mul.i188, !dbg !3029
  %arrayidx3.i190 = getelementptr inbounds nuw i64, ptr %add.ptr23, i32 %i.0.i180, !dbg !3030
  %23 = load i64, ptr %arrayidx3.i190, align 8, !dbg !3031
  %xor4.i191 = xor i64 %23, %xor2.i189, !dbg !3031
  store i64 %xor4.i191, ptr %arrayidx3.i190, align 8, !dbg !3031
  %inc.i192 = add nuw nsw i32 %i.0.i180, 1, !dbg !3032
    #dbg_value(i32 %inc.i192, !2804, !DIExpression(), !3019)
  br label %for.cond.i179, !dbg !3033, !llvm.loop !3034

m_vec_mul_add_x.exit193:                          ; preds = %for.cond.i179
  %add.ptr24 = getelementptr inbounds nuw i8, ptr %bins, i32 648, !dbg !3036
  %add.ptr25 = getelementptr inbounds nuw i8, ptr %bins, i32 72, !dbg !3037
    #dbg_value(i32 %m_vec_limbs, !2766, !DIExpression(), !3038)
    #dbg_value(ptr %add.ptr24, !2770, !DIExpression(), !3038)
    #dbg_value(ptr %add.ptr25, !2771, !DIExpression(), !3038)
    #dbg_value(i64 1229782938247303441, !2772, !DIExpression(), !3038)
    #dbg_value(i32 0, !2773, !DIExpression(), !3040)
  br label %for.cond.i21, !dbg !3041

for.cond.i21:                                     ; preds = %for.body.i24, %m_vec_mul_add_x.exit193
  %i.0.i22 = phi i32 [ 0, %m_vec_mul_add_x.exit193 ], [ %inc.i33, %for.body.i24 ], !dbg !3042
    #dbg_value(i32 %i.0.i22, !2773, !DIExpression(), !3040)
  %exitcond205 = icmp ne i32 %i.0.i22, 9, !dbg !3043
  br i1 %exitcond205, label %for.body.i24, label %m_vec_mul_add_x_inv.exit34, !dbg !3044

for.body.i24:                                     ; preds = %for.cond.i21
  %arrayidx.i25 = getelementptr inbounds nuw i64, ptr %add.ptr24, i32 %i.0.i22, !dbg !3045
  %24 = load i64, ptr %arrayidx.i25, align 8, !dbg !3045
  %and.i26 = and i64 %24, 1229782938247303441, !dbg !3046
    #dbg_value(i64 %and.i26, !2784, !DIExpression(), !3047)
  %xor.i27 = lshr i64 %24, 1, !dbg !3048
  %shr.i28 = and i64 %xor.i27, 8608480567731124087, !dbg !3048
  %mul.i29 = mul nuw i64 %and.i26, 9, !dbg !3049
  %xor2.i30 = xor i64 %shr.i28, %mul.i29, !dbg !3050
  %arrayidx3.i31 = getelementptr inbounds nuw i64, ptr %add.ptr25, i32 %i.0.i22, !dbg !3051
  %25 = load i64, ptr %arrayidx3.i31, align 8, !dbg !3052
  %xor4.i32 = xor i64 %25, %xor2.i30, !dbg !3052
  store i64 %xor4.i32, ptr %arrayidx3.i31, align 8, !dbg !3052
  %inc.i33 = add nuw nsw i32 %i.0.i22, 1, !dbg !3053
    #dbg_value(i32 %inc.i33, !2773, !DIExpression(), !3040)
  br label %for.cond.i21, !dbg !3054, !llvm.loop !3055

m_vec_mul_add_x_inv.exit34:                       ; preds = %for.cond.i21
  %add.ptr26 = getelementptr inbounds nuw i8, ptr %bins, i32 144, !dbg !3057
  %add.ptr27 = getelementptr inbounds nuw i8, ptr %bins, i32 72, !dbg !3058
    #dbg_value(i32 %m_vec_limbs, !2797, !DIExpression(), !3059)
    #dbg_value(ptr %add.ptr26, !2801, !DIExpression(), !3059)
    #dbg_value(ptr %add.ptr27, !2802, !DIExpression(), !3059)
    #dbg_value(i64 -8608480567731124088, !2803, !DIExpression(), !3059)
    #dbg_value(i32 0, !2804, !DIExpression(), !3061)
  br label %for.cond.i164, !dbg !3062

for.cond.i164:                                    ; preds = %for.body.i167, %m_vec_mul_add_x_inv.exit34
  %i.0.i165 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit34 ], [ %inc.i177, %for.body.i167 ], !dbg !3063
    #dbg_value(i32 %i.0.i165, !2804, !DIExpression(), !3061)
  %exitcond206 = icmp ne i32 %i.0.i165, 9, !dbg !3064
  br i1 %exitcond206, label %for.body.i167, label %m_vec_mul_add_x.exit178, !dbg !3065

for.body.i167:                                    ; preds = %for.cond.i164
  %arrayidx.i168 = getelementptr inbounds nuw i64, ptr %add.ptr26, i32 %i.0.i165, !dbg !3066
  %26 = load i64, ptr %arrayidx.i168, align 8, !dbg !3066
    #dbg_value(i64 %26, !2814, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !3067)
  %xor.i169 = shl i64 %26, 1, !dbg !3068
  %shl.i170 = and i64 %xor.i169, -1229782938247303442, !dbg !3068
  %and.i171 = lshr i64 %26, 3, !dbg !3069
  %shr.i172 = and i64 %and.i171, 1229782938247303441, !dbg !3069
  %mul.i173 = mul nuw nsw i64 %shr.i172, 3, !dbg !3070
  %xor2.i174 = xor i64 %shl.i170, %mul.i173, !dbg !3071
  %arrayidx3.i175 = getelementptr inbounds nuw i64, ptr %add.ptr27, i32 %i.0.i165, !dbg !3072
  %27 = load i64, ptr %arrayidx3.i175, align 8, !dbg !3073
  %xor4.i176 = xor i64 %27, %xor2.i174, !dbg !3073
  store i64 %xor4.i176, ptr %arrayidx3.i175, align 8, !dbg !3073
  %inc.i177 = add nuw nsw i32 %i.0.i165, 1, !dbg !3074
    #dbg_value(i32 %inc.i177, !2804, !DIExpression(), !3061)
  br label %for.cond.i164, !dbg !3075, !llvm.loop !3076

m_vec_mul_add_x.exit178:                          ; preds = %for.cond.i164
  %add.ptr28 = getelementptr inbounds nuw i8, ptr %bins, i32 72, !dbg !3078
    #dbg_value(i32 %m_vec_limbs, !3079, !DIExpression(), !3081)
    #dbg_value(ptr %add.ptr28, !3083, !DIExpression(), !3081)
    #dbg_value(ptr %out, !3084, !DIExpression(), !3081)
    #dbg_value(i32 0, !3085, !DIExpression(), !3087)
  br label %for.cond.i, !dbg !3088

for.cond.i:                                       ; preds = %for.body.i, %m_vec_mul_add_x.exit178
  %i.0.i = phi i32 [ 0, %m_vec_mul_add_x.exit178 ], [ %inc.i, %for.body.i ], !dbg !3089
    #dbg_value(i32 %i.0.i, !3085, !DIExpression(), !3087)
  %exitcond207 = icmp ne i32 %i.0.i, 9, !dbg !3090
  br i1 %exitcond207, label %for.body.i, label %m_vec_copy.exit, !dbg !3092

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %add.ptr28, i32 %i.0.i, !dbg !3093
  %28 = load i64, ptr %arrayidx.i, align 8, !dbg !3093
  %arrayidx1.i = getelementptr inbounds nuw i64, ptr %out, i32 %i.0.i, !dbg !3095
  store i64 %28, ptr %arrayidx1.i, align 8, !dbg !3096
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !3097
    #dbg_value(i32 %inc.i, !3085, !DIExpression(), !3087)
  br label %for.cond.i, !dbg !3098, !llvm.loop !3099

m_vec_copy.exit:                                  ; preds = %for.cond.i
  ret void, !dbg !3101
}

; Function Attrs: nounwind
define dso_local void @pqmayo_MAYO_5_ref_m_upper(ptr noundef %p, ptr noundef %in, ptr noundef %out, i32 noundef %size) local_unnamed_addr #0 !dbg !3102 {
entry:
    #dbg_value(ptr %p, !3133, !DIExpression(), !3134)
    #dbg_value(ptr %in, !3135, !DIExpression(), !3134)
    #dbg_value(ptr %out, !3136, !DIExpression(), !3134)
    #dbg_value(i32 %size, !3137, !DIExpression(), !3134)
    #dbg_value(i32 9, !3138, !DIExpression(), !3134)
    #dbg_value(i32 0, !3139, !DIExpression(), !3134)
    #dbg_value(i32 0, !3140, !DIExpression(), !3142)
  %smax = call i32 @llvm.smax.i32(i32 %size, i32 0), !dbg !3143
  br label %for.cond, !dbg !3143

for.cond:                                         ; preds = %for.inc15, %entry
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc15 ], [ %size, %entry ], !dbg !3144
  %m_vecs_stored.0 = phi i32 [ 0, %entry ], [ %m_vecs_stored.1.lcssa, %for.inc15 ], !dbg !3144
  %r.0 = phi i32 [ 0, %entry ], [ %inc16, %for.inc15 ], !dbg !3145
    #dbg_value(i32 %r.0, !3140, !DIExpression(), !3142)
    #dbg_value(i32 %m_vecs_stored.0, !3139, !DIExpression(), !3134)
  %exitcond10 = icmp ne i32 %r.0, %smax, !dbg !3146
  br i1 %exitcond10, label %for.cond1.preheader, label %for.end17, !dbg !3148

for.cond1.preheader:                              ; preds = %for.cond
  %0 = add i32 %m_vecs_stored.0, %indvars.iv, !dbg !3149
  br label %for.cond1, !dbg !3149

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc
  %m_vecs_stored.1 = phi i32 [ %inc, %for.inc ], [ %m_vecs_stored.0, %for.cond1.preheader ], !dbg !3134
  %c.0 = phi i32 [ %inc14, %for.inc ], [ %r.0, %for.cond1.preheader ], !dbg !3152
    #dbg_value(i32 %c.0, !3153, !DIExpression(), !3154)
    #dbg_value(i32 %m_vecs_stored.1, !3139, !DIExpression(), !3134)
  %exitcond9 = icmp ne i32 %m_vecs_stored.1, %0, !dbg !3155
  br i1 %exitcond9, label %for.body3, label %for.inc15, !dbg !3149

for.body3:                                        ; preds = %for.cond1
  %mul = mul nsw i32 %r.0, %size, !dbg !3157
  %add = add nsw i32 %mul, %c.0, !dbg !3159
  %add.ptr.idx = mul nsw i32 %add, 72, !dbg !3160
  %add.ptr = getelementptr inbounds i8, ptr %in, i32 %add.ptr.idx, !dbg !3160
  %add.ptr6.idx = mul nsw i32 %m_vecs_stored.1, 72, !dbg !3161
  %add.ptr6 = getelementptr inbounds i8, ptr %out, i32 %add.ptr6.idx, !dbg !3161
    #dbg_value(i32 9, !3162, !DIExpression(), !3164)
    #dbg_value(ptr %add.ptr, !3166, !DIExpression(), !3164)
    #dbg_value(ptr %add.ptr6, !3167, !DIExpression(), !3164)
    #dbg_value(i32 0, !3168, !DIExpression(), !3170)
  br label %for.cond.i, !dbg !3171

for.cond.i:                                       ; preds = %for.body.i, %for.body3
  %i.0.i = phi i32 [ 0, %for.body3 ], [ %inc.i, %for.body.i ], !dbg !3172
    #dbg_value(i32 %i.0.i, !3168, !DIExpression(), !3170)
  %exitcond = icmp ne i32 %i.0.i, 9, !dbg !3173
  br i1 %exitcond, label %for.body.i, label %m_vec_copy.17.exit, !dbg !3175

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %add.ptr, i32 %i.0.i, !dbg !3176
  %1 = load i64, ptr %arrayidx.i, align 8, !dbg !3176
  %arrayidx1.i = getelementptr inbounds nuw i64, ptr %add.ptr6, i32 %i.0.i, !dbg !3178
  store i64 %1, ptr %arrayidx1.i, align 8, !dbg !3179
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !3180
    #dbg_value(i32 %inc.i, !3168, !DIExpression(), !3170)
  br label %for.cond.i, !dbg !3181, !llvm.loop !3182

m_vec_copy.17.exit:                               ; preds = %for.cond.i
  %cmp7.not = icmp eq i32 %r.0, %c.0, !dbg !3184
  br i1 %cmp7.not, label %for.inc, label %if.then, !dbg !3184

if.then:                                          ; preds = %m_vec_copy.17.exit
  %mul8 = mul nsw i32 %c.0, %size, !dbg !3186
  %add9 = add nsw i32 %mul8, %r.0, !dbg !3188
  %add.ptr11.idx = mul nsw i32 %add9, 72, !dbg !3189
  %add.ptr11 = getelementptr inbounds i8, ptr %in, i32 %add.ptr11.idx, !dbg !3189
  %add.ptr13.idx = mul nsw i32 %m_vecs_stored.1, 72, !dbg !3190
  %add.ptr13 = getelementptr inbounds i8, ptr %out, i32 %add.ptr13.idx, !dbg !3190
    #dbg_value(i32 9, !3191, !DIExpression(), !3193)
    #dbg_value(ptr %add.ptr11, !3195, !DIExpression(), !3193)
    #dbg_value(ptr %add.ptr13, !3196, !DIExpression(), !3193)
    #dbg_value(i32 0, !3197, !DIExpression(), !3199)
  br label %for.cond.i1, !dbg !3200

for.cond.i1:                                      ; preds = %for.body.i4, %if.then
  %i.0.i2 = phi i32 [ 0, %if.then ], [ %inc.i7, %for.body.i4 ], !dbg !3201
    #dbg_value(i32 %i.0.i2, !3197, !DIExpression(), !3199)
  %exitcond8 = icmp ne i32 %i.0.i2, 9, !dbg !3202
  br i1 %exitcond8, label %for.body.i4, label %for.inc.loopexit, !dbg !3204

for.body.i4:                                      ; preds = %for.cond.i1
  %arrayidx.i5 = getelementptr inbounds nuw i64, ptr %add.ptr11, i32 %i.0.i2, !dbg !3205
  %2 = load i64, ptr %arrayidx.i5, align 8, !dbg !3205
  %arrayidx1.i6 = getelementptr inbounds nuw i64, ptr %add.ptr13, i32 %i.0.i2, !dbg !3207
  %3 = load i64, ptr %arrayidx1.i6, align 8, !dbg !3208
  %xor.i = xor i64 %3, %2, !dbg !3208
  store i64 %xor.i, ptr %arrayidx1.i6, align 8, !dbg !3208
  %inc.i7 = add nuw nsw i32 %i.0.i2, 1, !dbg !3209
    #dbg_value(i32 %inc.i7, !3197, !DIExpression(), !3199)
  br label %for.cond.i1, !dbg !3210, !llvm.loop !3211

for.inc.loopexit:                                 ; preds = %for.cond.i1
  br label %for.inc, !dbg !3213

for.inc:                                          ; preds = %for.inc.loopexit, %m_vec_copy.17.exit
    #dbg_value(i32 %m_vecs_stored.1, !3139, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !3134)
  %inc = add i32 %m_vecs_stored.1, 1, !dbg !3213
    #dbg_value(i32 %inc, !3139, !DIExpression(), !3134)
  %inc14 = add nuw nsw i32 %c.0, 1, !dbg !3214
    #dbg_value(i32 %inc14, !3153, !DIExpression(), !3154)
  br label %for.cond1, !dbg !3215, !llvm.loop !3216

for.inc15:                                        ; preds = %for.cond1
  %m_vecs_stored.1.lcssa = phi i32 [ %m_vecs_stored.1, %for.cond1 ], !dbg !3134
  %inc16 = add nuw i32 %r.0, 1, !dbg !3218
    #dbg_value(i32 %inc16, !3140, !DIExpression(), !3142)
  %indvars.iv.next = add i32 %indvars.iv, -1, !dbg !3219
  br label %for.cond, !dbg !3219, !llvm.loop !3220

for.end17:                                        ; preds = %for.cond
  ret void, !dbg !3222
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_5_ref_sample_solution(ptr noundef %p, ptr noundef %A, ptr noundef %y, ptr noundef %r, ptr noundef %x, i32 noundef %k, i32 noundef %o, i32 noundef %m, i32 noundef %A_cols) local_unnamed_addr #0 !dbg !3223 {
entry:
  %_pivot_row.i = alloca [10 x i64], align 32
  %_pivot_row2.i = alloca [10 x i64], align 32
  %packed_A.i = alloca [1420 x i64], align 32
  %temp.i = alloca [160 x i8], align 1
  %Ar = alloca [142 x i8], align 1
    #dbg_value(ptr %p, !3226, !DIExpression(), !3227)
    #dbg_value(ptr %A, !3228, !DIExpression(), !3227)
    #dbg_value(ptr %y, !3229, !DIExpression(), !3227)
    #dbg_value(ptr %r, !3230, !DIExpression(), !3227)
    #dbg_value(ptr %x, !3231, !DIExpression(), !3227)
    #dbg_value(i32 %k, !3232, !DIExpression(), !3227)
    #dbg_value(i32 %o, !3233, !DIExpression(), !3227)
    #dbg_value(i32 %m, !3234, !DIExpression(), !3227)
    #dbg_value(i32 %A_cols, !3235, !DIExpression(), !3227)
    #dbg_value(i32 0, !3236, !DIExpression(), !3238)
  %0 = mul nsw i32 %o, %k, !dbg !3239
  %smax = call i32 @llvm.smax.i32(i32 %0, i32 0), !dbg !3239
  br label %for.cond, !dbg !3239

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !3240
    #dbg_value(i32 %i.0, !3236, !DIExpression(), !3238)
  %exitcond = icmp ne i32 %i.0, %smax, !dbg !3241
  br i1 %exitcond, label %for.body, label %for.cond3.preheader, !dbg !3243

for.cond3.preheader:                              ; preds = %for.cond
  %smax37 = call i32 @llvm.smax.i32(i32 %m, i32 0), !dbg !3244
  br label %for.cond3, !dbg !3244

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !3246
  %1 = load i8, ptr %arrayidx, align 1, !dbg !3246
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !3248
  store i8 %1, ptr %arrayidx1, align 1, !dbg !3249
  %inc = add nuw i32 %i.0, 1, !dbg !3250
    #dbg_value(i32 %inc, !3236, !DIExpression(), !3238)
  br label %for.cond, !dbg !3251, !llvm.loop !3252

for.cond3:                                        ; preds = %for.cond3.preheader, %for.body5
  %i2.0 = phi i32 [ %inc12, %for.body5 ], [ 0, %for.cond3.preheader ], !dbg !3254
    #dbg_value(i32 %i2.0, !3255, !DIExpression(), !3256)
  %exitcond38 = icmp ne i32 %i2.0, %smax37, !dbg !3257
  br i1 %exitcond38, label %for.body5, label %for.end13, !dbg !3244

for.body5:                                        ; preds = %for.cond3
  %mul6 = mul nsw i32 %k, %o, !dbg !3259
  %mul7 = mul nsw i32 %k, %o, !dbg !3261
  %add = add nsw i32 %mul7, 1, !dbg !3262
  %mul8 = mul nsw i32 %i2.0, %add, !dbg !3263
  %2 = getelementptr i8, ptr %A, i32 %mul6, !dbg !3264
  %arrayidx10 = getelementptr i8, ptr %2, i32 %mul8, !dbg !3264
  store i8 0, ptr %arrayidx10, align 1, !dbg !3265
  %inc12 = add nuw i32 %i2.0, 1, !dbg !3266
    #dbg_value(i32 %inc12, !3255, !DIExpression(), !3256)
  br label %for.cond3, !dbg !3267, !llvm.loop !3268

for.end13:                                        ; preds = %for.cond3
  %mul14 = mul nsw i32 %k, %o, !dbg !3270
    #dbg_value(ptr %A, !3271, !DIExpression(), !3273)
    #dbg_value(ptr %r, !3275, !DIExpression(), !3273)
    #dbg_value(ptr %Ar, !3276, !DIExpression(), !3273)
    #dbg_value(i32 %mul14, !3277, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !3273)
    #dbg_value(i32 %m, !3278, !DIExpression(), !3273)
    #dbg_value(i32 1, !3279, !DIExpression(), !3273)
    #dbg_value(i32 0, !3280, !DIExpression(), !3282)
  %smax39 = call i32 @llvm.smax.i32(i32 %0, i32 -1), !dbg !3283
  %3 = add i32 %smax39, 1, !dbg !3283
  br label %for.cond.i, !dbg !3283

for.cond.i:                                       ; preds = %for.inc4.i, %for.end13
  %i.0.i = phi i32 [ 0, %for.end13 ], [ %inc5.i, %for.inc4.i ], !dbg !3284
  %c.addr.0.i = phi ptr [ %Ar, %for.end13 ], [ %c.addr.1.i.lcssa, %for.inc4.i ]
  %a.addr.0.i = phi ptr [ %A, %for.end13 ], [ %add.ptr6.i, %for.inc4.i ]
    #dbg_value(ptr %a.addr.0.i, !3271, !DIExpression(), !3273)
    #dbg_value(ptr %c.addr.0.i, !3276, !DIExpression(), !3273)
    #dbg_value(i32 %i.0.i, !3280, !DIExpression(), !3282)
  %exitcond41 = icmp ne i32 %i.0.i, %smax37, !dbg !3285
  br i1 %exitcond41, label %for.cond1.i.preheader, label %for.cond17.preheader, !dbg !3287

for.cond1.i.preheader:                            ; preds = %for.cond.i
  br label %for.cond1.i, !dbg !3288

for.cond17.preheader:                             ; preds = %for.cond.i
  br label %for.cond17, !dbg !3291

for.cond1.i:                                      ; preds = %for.cond1.i.preheader, %lincomb.24.exit.i
  %c.addr.1.i = phi ptr [ %incdec.ptr.i, %lincomb.24.exit.i ], [ %c.addr.0.i, %for.cond1.i.preheader ]
  %j.0.i = phi i32 [ 1, %lincomb.24.exit.i ], [ 0, %for.cond1.i.preheader ], !dbg !3293
    #dbg_value(i32 poison, !3294, !DIExpression(), !3295)
    #dbg_value(ptr %c.addr.1.i, !3276, !DIExpression(), !3273)
  %cmp2.i = icmp eq i32 %j.0.i, 0, !dbg !3296
  br i1 %cmp2.i, label %for.body3.i, label %for.inc4.i, !dbg !3288

for.body3.i:                                      ; preds = %for.cond1.i
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %r, i32 %j.0.i, !dbg !3298
    #dbg_value(ptr %a.addr.0.i, !3300, !DIExpression(), !3302)
    #dbg_value(ptr %add.ptr.i, !3304, !DIExpression(), !3302)
    #dbg_value(i32 %mul14, !3305, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !3302)
    #dbg_value(i32 1, !3306, !DIExpression(), !3302)
    #dbg_value(i8 0, !3307, !DIExpression(), !3302)
    #dbg_value(i32 0, !3308, !DIExpression(), !3310)
  br label %for.cond.i.i, !dbg !3311

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body3.i
  %ret.0.i.i = phi i8 [ 0, %for.body3.i ], [ %xor1.i.i.i, %for.body.i.i ], !dbg !3302
  %b.addr.0.i.i = phi ptr [ %add.ptr.i, %for.body3.i ], [ %add.ptr.i.i, %for.body.i.i ]
  %i.0.i.i = phi i32 [ 0, %for.body3.i ], [ %inc.i.i, %for.body.i.i ], !dbg !3312
    #dbg_value(i32 %i.0.i.i, !3308, !DIExpression(), !3310)
    #dbg_value(ptr %b.addr.0.i.i, !3304, !DIExpression(), !3302)
    #dbg_value(i8 %ret.0.i.i, !3307, !DIExpression(), !3302)
  %exitcond40 = icmp eq i32 %i.0.i.i, %3, !dbg !3313
  br i1 %exitcond40, label %lincomb.24.exit.i, label %for.body.i.i, !dbg !3315

for.body.i.i:                                     ; preds = %for.cond.i.i
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %a.addr.0.i, i32 %i.0.i.i, !dbg !3316
  %4 = load i8, ptr %arrayidx.i.i, align 1, !dbg !3316
  %5 = load i8, ptr %b.addr.0.i.i, align 1, !dbg !3318
    #dbg_value(i8 %4, !3319, !DIExpression(), !3321)
    #dbg_value(i8 %5, !3323, !DIExpression(), !3321)
  %6 = load volatile i8, ptr @pqmayo_MAYO_5_ref_unsigned_char_blocker, align 1, !dbg !3324
  %xor1.i.i = xor i8 %4, %6, !dbg !3325
    #dbg_value(i8 %xor1.i.i, !3319, !DIExpression(), !3321)
  %7 = trunc i8 %xor1.i.i to i1, !dbg !3326
    #dbg_value(i8 poison, !3327, !DIExpression(), !3321)
  %8 = and i8 %xor1.i.i, 2, !dbg !3328
  %mul9.i.i = mul i8 %8, %5, !dbg !3329
  %conv10.i.i = select i1 %7, i8 %5, i8 0, !dbg !3326
  %xor11.i.i = xor i8 %conv10.i.i, %mul9.i.i, !dbg !3330
    #dbg_value(i8 %xor11.i.i, !3327, !DIExpression(), !3321)
  %9 = and i8 %xor1.i.i, 4, !dbg !3331
  %mul16.i.i = mul i8 %9, %5, !dbg !3332
  %xor18.i.i = xor i8 %mul16.i.i, %xor11.i.i, !dbg !3333
    #dbg_value(i8 %xor18.i.i, !3327, !DIExpression(), !3321)
  %10 = and i8 %xor1.i.i, 8, !dbg !3334
  %mul23.i.i = mul i8 %10, %5, !dbg !3335
  %xor25.i.i = xor i8 %mul23.i.i, %xor18.i.i, !dbg !3336
    #dbg_value(i8 %xor25.i.i, !3327, !DIExpression(), !3321)
    #dbg_value(i8 %xor25.i.i, !3337, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !3321)
  %11 = lshr i8 %xor25.i.i, 4, !dbg !3338
  %12 = lshr i8 %xor25.i.i, 3, !dbg !3339
  %13 = and i8 %12, 14, !dbg !3339
  %14 = xor i8 %11, %13, !dbg !3340
  %xor25.masked.i.i = and i8 %xor25.i.i, 15, !dbg !3341
  %15 = xor i8 %14, %xor25.masked.i.i, !dbg !3341
    #dbg_value(i8 %15, !3342, !DIExpression(), !3321)
    #dbg_value(i8 %15, !3343, !DIExpression(), !3345)
    #dbg_value(i8 %ret.0.i.i, !3347, !DIExpression(), !3345)
  %xor1.i.i.i = xor i8 %15, %ret.0.i.i, !dbg !3348
    #dbg_value(i8 %xor1.i.i.i, !3307, !DIExpression(), !3302)
  %inc.i.i = add nuw i32 %i.0.i.i, 1, !dbg !3349
    #dbg_value(i32 %inc.i.i, !3308, !DIExpression(), !3310)
  %add.ptr.i.i = getelementptr inbounds nuw i8, ptr %b.addr.0.i.i, i32 1, !dbg !3350
    #dbg_value(ptr %add.ptr.i.i, !3304, !DIExpression(), !3302)
  br label %for.cond.i.i, !dbg !3351, !llvm.loop !3352

lincomb.24.exit.i:                                ; preds = %for.cond.i.i
  %ret.0.i.i.lcssa = phi i8 [ %ret.0.i.i, %for.cond.i.i ], !dbg !3302
  store i8 %ret.0.i.i.lcssa, ptr %c.addr.1.i, align 1, !dbg !3354
    #dbg_value(i32 1, !3294, !DIExpression(), !3295)
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %c.addr.1.i, i32 1, !dbg !3355
    #dbg_value(ptr %incdec.ptr.i, !3276, !DIExpression(), !3273)
  br label %for.cond1.i, !dbg !3356, !llvm.loop !3357

for.inc4.i:                                       ; preds = %for.cond1.i
  %c.addr.1.i.lcssa = phi ptr [ %c.addr.1.i, %for.cond1.i ]
  %inc5.i = add nuw i32 %i.0.i, 1, !dbg !3359
    #dbg_value(i32 %inc5.i, !3280, !DIExpression(), !3282)
  %16 = getelementptr i8, ptr %a.addr.0.i, i32 %mul14, !dbg !3360
  %add.ptr6.i = getelementptr i8, ptr %16, i32 1, !dbg !3360
    #dbg_value(ptr %add.ptr6.i, !3271, !DIExpression(), !3273)
  br label %for.cond.i, !dbg !3361, !llvm.loop !3362

for.cond17:                                       ; preds = %for.cond17.preheader, %for.body19
  %i16.0 = phi i32 [ %inc29, %for.body19 ], [ 0, %for.cond17.preheader ], !dbg !3364
    #dbg_value(i32 %i16.0, !3365, !DIExpression(), !3366)
  %exitcond42 = icmp ne i32 %i16.0, %smax37, !dbg !3367
  br i1 %exitcond42, label %for.body19, label %for.end30, !dbg !3291

for.body19:                                       ; preds = %for.cond17
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %y, i32 %i16.0, !dbg !3369
  %17 = load i8, ptr %arrayidx20, align 1, !dbg !3369
  %arrayidx21 = getelementptr inbounds nuw [142 x i8], ptr %Ar, i32 0, i32 %i16.0, !dbg !3371
  %18 = load i8, ptr %arrayidx21, align 1, !dbg !3371
    #dbg_value(i8 %17, !3372, !DIExpression(), !3374)
    #dbg_value(i8 %18, !3376, !DIExpression(), !3374)
  %xor1.i = xor i8 %17, %18, !dbg !3377
  %mul22 = mul nsw i32 %k, %o, !dbg !3378
  %mul23 = mul nsw i32 %k, %o, !dbg !3379
  %add24 = add nsw i32 %mul23, 1, !dbg !3380
  %mul25 = mul nsw i32 %i16.0, %add24, !dbg !3381
  %19 = getelementptr i8, ptr %A, i32 %mul22, !dbg !3382
  %arrayidx27 = getelementptr i8, ptr %19, i32 %mul25, !dbg !3382
  store i8 %xor1.i, ptr %arrayidx27, align 1, !dbg !3383
  %inc29 = add nuw i32 %i16.0, 1, !dbg !3384
    #dbg_value(i32 %inc29, !3365, !DIExpression(), !3366)
  br label %for.cond17, !dbg !3385, !llvm.loop !3386

for.end30:                                        ; preds = %for.cond17
  %mul31 = mul nsw i32 %k, %o, !dbg !3388
  %add32 = add nsw i32 %mul31, 1, !dbg !3389
  call void @llvm.lifetime.start.p0(i64 80, ptr nonnull %_pivot_row.i), !dbg !3390
  call void @llvm.lifetime.start.p0(i64 80, ptr nonnull %_pivot_row2.i), !dbg !3390
  call void @llvm.lifetime.start.p0(i64 11360, ptr nonnull %packed_A.i), !dbg !3390
  call void @llvm.lifetime.start.p0(i64 160, ptr nonnull %temp.i), !dbg !3390
    #dbg_value(ptr %A, !3396, !DIExpression(), !3397)
    #dbg_value(i32 %m, !3398, !DIExpression(), !3397)
    #dbg_value(i32 %add32, !3399, !DIExpression(), !3397)
    #dbg_declare(ptr %_pivot_row.i, !3400, !DIExpression(), !3404)
    #dbg_declare(ptr %_pivot_row2.i, !3405, !DIExpression(), !3406)
    #dbg_declare(ptr %packed_A.i, !3407, !DIExpression(), !3390)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 32 dereferenceable(11360) %packed_A.i, i8 0, i32 11360, i1 false), !dbg !3390
  %add.i = add nsw i32 %mul31, 16, !dbg !3411
  %div.i = sdiv i32 %add.i, 16, !dbg !3412
    #dbg_value(i32 %div.i, !3413, !DIExpression(), !3397)
    #dbg_value(i32 0, !3414, !DIExpression(), !3416)
  br label %for.cond.i13, !dbg !3417

for.cond.i13:                                     ; preds = %ef_pack_m_vec.exit.i, %for.end30
  %i.0.i14 = phi i32 [ 0, %for.end30 ], [ %inc.i34, %ef_pack_m_vec.exit.i ], !dbg !3418
    #dbg_value(i32 %i.0.i14, !3414, !DIExpression(), !3416)
  %exitcond43 = icmp ne i32 %i.0.i14, %smax37, !dbg !3419
  br i1 %exitcond43, label %for.body.i, label %for.cond3.i.preheader, !dbg !3421

for.cond3.i.preheader:                            ; preds = %for.cond.i13
  %smax44 = call i32 @llvm.smax.i32(i32 %div.i, i32 0), !dbg !3422
  %smax50 = call i32 @llvm.smax.i32(i32 %0, i32 -1), !dbg !3422
  %20 = add i32 %smax50, 1, !dbg !3422
  br label %for.cond3.i, !dbg !3422

for.body.i:                                       ; preds = %for.cond.i13
  %mul.i32 = mul nsw i32 %i.0.i14, %add32, !dbg !3424
  %add.ptr.i33 = getelementptr inbounds i8, ptr %A, i32 %mul.i32, !dbg !3426
  %mul1.i = mul nsw i32 %i.0.i14, %div.i, !dbg !3427
  %add.ptr2.i = getelementptr inbounds i64, ptr %packed_A.i, i32 %mul1.i, !dbg !3428
    #dbg_value(ptr %add.ptr.i33, !3429, !DIExpression(), !3433)
    #dbg_value(ptr %add.ptr2.i, !3435, !DIExpression(), !3433)
    #dbg_value(i32 %add32, !3436, !DIExpression(), !3433)
    #dbg_value(ptr %add.ptr2.i, !3437, !DIExpression(), !3433)
    #dbg_value(i32 0, !3438, !DIExpression(), !3433)
  br label %for.cond.i57.i, !dbg !3439

for.cond.i57.i:                                   ; preds = %for.body.i61.i, %for.body.i
  %i.0.i58.i = phi i32 [ 0, %for.body.i ], [ %add8.i65.i, %for.body.i61.i ], !dbg !3441
    #dbg_value(i32 %i.0.i58.i, !3438, !DIExpression(), !3433)
  %cmp.i60.i = icmp slt i32 %i.0.i58.i, %mul31, !dbg !3442
  br i1 %cmp.i60.i, label %for.body.i61.i, label %for.end.i.i, !dbg !3444

for.body.i61.i:                                   ; preds = %for.cond.i57.i
  %arrayidx.i62.i = getelementptr inbounds nuw i8, ptr %add.ptr.i33, i32 %i.0.i58.i, !dbg !3445
  %21 = load i8, ptr %arrayidx.i62.i, align 1, !dbg !3445
  %add2.i.i = or disjoint i32 %i.0.i58.i, 1, !dbg !3447
  %arrayidx3.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i33, i32 %add2.i.i, !dbg !3448
  %22 = load i8, ptr %arrayidx3.i.i, align 1, !dbg !3448
  %shl5.i.i = shl i8 %22, 4, !dbg !3449
  %or.i.i = or i8 %shl5.i.i, %21, !dbg !3450
  %div.i63.i = lshr exact i32 %i.0.i58.i, 1, !dbg !3451
  %arrayidx7.i64.i = getelementptr inbounds nuw i8, ptr %add.ptr2.i, i32 %div.i63.i, !dbg !3452
  store i8 %or.i.i, ptr %arrayidx7.i64.i, align 1, !dbg !3453
  %add8.i65.i = add nuw nsw i32 %i.0.i58.i, 2, !dbg !3454
    #dbg_value(i32 %add8.i65.i, !3438, !DIExpression(), !3433)
  br label %for.cond.i57.i, !dbg !3455, !llvm.loop !3456

for.end.i.i:                                      ; preds = %for.cond.i57.i
  %i.0.i58.i.lcssa = phi i32 [ %i.0.i58.i, %for.cond.i57.i ], !dbg !3441
  %23 = and i32 %add32, -2147483647, !dbg !3458
  %cmp9.i.i = icmp eq i32 %23, 1, !dbg !3458
  br i1 %cmp9.i.i, label %if.then.i.i, label %ef_pack_m_vec.exit.i, !dbg !3458

if.then.i.i:                                      ; preds = %for.end.i.i
  %arrayidx12.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i33, i32 %i.0.i58.i.lcssa, !dbg !3460
  %24 = load i8, ptr %arrayidx12.i.i, align 1, !dbg !3460
  %div16.i.i = lshr exact i32 %i.0.i58.i.lcssa, 1, !dbg !3462
  %arrayidx17.i.i = getelementptr inbounds nuw i8, ptr %add.ptr2.i, i32 %div16.i.i, !dbg !3463
  store i8 %24, ptr %arrayidx17.i.i, align 1, !dbg !3464
  br label %ef_pack_m_vec.exit.i, !dbg !3465

ef_pack_m_vec.exit.i:                             ; preds = %if.then.i.i, %for.end.i.i
  %inc.i34 = add nuw i32 %i.0.i14, 1, !dbg !3466
    #dbg_value(i32 %inc.i34, !3414, !DIExpression(), !3416)
  br label %for.cond.i13, !dbg !3467, !llvm.loop !3468

for.cond3.i:                                      ; preds = %for.cond3.i.preheader, %for.inc117.i
  %pivot_col.0.i = phi i32 [ %inc118.i, %for.inc117.i ], [ 0, %for.cond3.i.preheader ], !dbg !3470
  %pivot_row.0.i = phi i32 [ %conv116.i, %for.inc117.i ], [ 0, %for.cond3.i.preheader ], !dbg !3397
    #dbg_value(i32 %pivot_row.0.i, !3471, !DIExpression(), !3397)
    #dbg_value(i32 %pivot_col.0.i, !3472, !DIExpression(), !3473)
  %exitcond51 = icmp eq i32 %pivot_col.0.i, %20, !dbg !3474
  br i1 %exitcond51, label %for.cond121.i.preheader, label %for.body5.i, !dbg !3422

for.cond121.i.preheader:                          ; preds = %for.cond3.i
  br label %for.cond121.i, !dbg !3476

for.body5.i:                                      ; preds = %for.cond3.i
  %add6.i = add nsw i32 %pivot_col.0.i, %m, !dbg !3478
  %cmp7.i.not = icmp sgt i32 %add6.i, %mul31, !dbg !3478
  %add8.i = add nsw i32 %pivot_col.0.i, %m, !dbg !3478
  %sub9.i = sub nsw i32 %add8.i, %add32, !dbg !3478
  %cond.i = select i1 %cmp7.i.not, i32 %sub9.i, i32 0, !dbg !3478
    #dbg_value(i32 %cond.i, !3480, !DIExpression(), !3481)
  %sub13.i = add nsw i32 %m, -1, !dbg !3482
    #dbg_value(i32 %cond16.i, !3483, !DIExpression(), !3481)
    #dbg_value(i32 0, !3484, !DIExpression(), !3486)
  br label %for.cond18.i, !dbg !3487

for.cond18.i:                                     ; preds = %for.body20.i, %for.body5.i
  %i17.0.i = phi i32 [ 0, %for.body5.i ], [ %inc23.i, %for.body20.i ], !dbg !3488
    #dbg_value(i32 %i17.0.i, !3484, !DIExpression(), !3486)
  %exitcond45 = icmp ne i32 %i17.0.i, %smax44, !dbg !3489
  br i1 %exitcond45, label %for.body20.i, label %for.cond25.i.preheader, !dbg !3491

for.cond25.i.preheader:                           ; preds = %for.cond18.i
  %cmp11.not.i = icmp sgt i32 %m, %pivot_col.0.i, !dbg !3482
  %cond16.i = select i1 %cmp11.not.i, i32 %pivot_col.0.i, i32 %sub13.i, !dbg !3482
  br label %for.cond25.i, !dbg !3492

for.body20.i:                                     ; preds = %for.cond18.i
  %arrayidx.i = getelementptr inbounds nuw [10 x i64], ptr %_pivot_row.i, i32 0, i32 %i17.0.i, !dbg !3494
  store i64 0, ptr %arrayidx.i, align 8, !dbg !3496
  %arrayidx21.i = getelementptr inbounds nuw [10 x i64], ptr %_pivot_row2.i, i32 0, i32 %i17.0.i, !dbg !3497
  store i64 0, ptr %arrayidx21.i, align 8, !dbg !3498
  %inc23.i = add nuw nsw i32 %i17.0.i, 1, !dbg !3499
    #dbg_value(i32 %inc23.i, !3484, !DIExpression(), !3486)
  br label %for.cond18.i, !dbg !3500, !llvm.loop !3501

for.cond25.i:                                     ; preds = %for.cond25.i.preheader, %for.end48.i
  %pivot_is_zero.0.i = phi i64 [ %not52.i, %for.end48.i ], [ -1, %for.cond25.i.preheader ], !dbg !3481
  %pivot.0.i = phi i8 [ %conv.i16.i, %for.end48.i ], [ 0, %for.cond25.i.preheader ], !dbg !3481
  %row.0.i = phi i32 [ %inc54.i, %for.end48.i ], [ %cond.i, %for.cond25.i.preheader ], !dbg !3503
    #dbg_value(i32 %row.0.i, !3504, !DIExpression(), !3503)
    #dbg_value(i8 %pivot.0.i, !3505, !DIExpression(), !3481)
    #dbg_value(i64 %pivot_is_zero.0.i, !3506, !DIExpression(), !3481)
  %add27.i = add nsw i32 %cond16.i, 32, !dbg !3507
  %cmp28.not.i = icmp sgt i32 %m, %add27.i, !dbg !3507
  %sub30.i = add nsw i32 %m, -1, !dbg !3507
  %add32.i = add nsw i32 %cond16.i, 32, !dbg !3507
  %cond34.i = select i1 %cmp28.not.i, i32 %add32.i, i32 %sub30.i, !dbg !3507
  %cmp35.not.i = icmp sgt i32 %row.0.i, %cond34.i, !dbg !3509
  br i1 %cmp35.not.i, label %for.end55.i, label %for.body36.i, !dbg !3492

for.body36.i:                                     ; preds = %for.cond25.i
    #dbg_value(i32 %row.0.i, !3510, !DIExpression(), !3515)
    #dbg_value(i32 %pivot_row.0.i, !3518, !DIExpression(), !3515)
  %xor.i6.i = xor i32 %row.0.i, %pivot_row.0.i, !dbg !3519
  %25 = load volatile i64, ptr @pqmayo_MAYO_5_ref_uint64_t_blocker, align 8, !dbg !3520
  %26 = icmp slt i32 %xor.i6.i, 1, !dbg !3521
  %27 = sext i1 %26 to i64, !dbg !3521
  %not.i = xor i64 %25, %27, !dbg !3521
    #dbg_value(i64 %not.i, !3522, !DIExpression(), !3523)
    #dbg_value(i32 %row.0.i, !3524, !DIExpression(), !3526)
    #dbg_value(i32 %pivot_row.0.i, !3528, !DIExpression(), !3526)
    #dbg_value(!DIArgList(i32 %pivot_row.0.i, i32 %row.0.i), !3529, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_LLVM_convert, 64, DW_ATE_signed, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_LLVM_convert, 64, DW_ATE_signed, DW_OP_minus, DW_OP_stack_value), !3526)
  %28 = icmp slt i32 %pivot_row.0.i, %row.0.i, !dbg !3530
  %shr.i.i = sext i1 %28 to i64, !dbg !3530
  %29 = load volatile i64, ptr @pqmayo_MAYO_5_ref_uint64_t_blocker, align 8, !dbg !3531
  %xor.i.i = xor i64 %29, %shr.i.i, !dbg !3532
    #dbg_value(i64 %xor.i.i, !3533, !DIExpression(), !3523)
    #dbg_value(i32 0, !3534, !DIExpression(), !3536)
  br label %for.cond38.i, !dbg !3537

for.cond38.i:                                     ; preds = %for.body40.i, %for.body36.i
  %j.0.i20 = phi i32 [ 0, %for.body36.i ], [ %inc47.i, %for.body40.i ], !dbg !3538
    #dbg_value(i32 %j.0.i20, !3534, !DIExpression(), !3536)
  %exitcond46 = icmp ne i32 %j.0.i20, %smax44, !dbg !3539
  br i1 %exitcond46, label %for.body40.i, label %for.end48.i, !dbg !3541

for.body40.i:                                     ; preds = %for.cond38.i
  %and.i = and i64 %xor.i.i, %pivot_is_zero.0.i, !dbg !3542
  %or.i = or i64 %and.i, %not.i, !dbg !3544
  %mul41.i = mul nsw i32 %row.0.i, %div.i, !dbg !3545
  %add42.i = add nsw i32 %mul41.i, %j.0.i20, !dbg !3546
  %arrayidx43.i = getelementptr inbounds [1420 x i64], ptr %packed_A.i, i32 0, i32 %add42.i, !dbg !3547
  %30 = load i64, ptr %arrayidx43.i, align 8, !dbg !3547
  %and44.i = and i64 %or.i, %30, !dbg !3548
  %arrayidx45.i = getelementptr inbounds nuw [10 x i64], ptr %_pivot_row.i, i32 0, i32 %j.0.i20, !dbg !3549
  %31 = load i64, ptr %arrayidx45.i, align 8, !dbg !3550
  %xor.i21 = xor i64 %31, %and44.i, !dbg !3550
  store i64 %xor.i21, ptr %arrayidx45.i, align 8, !dbg !3550
  %inc47.i = add nuw nsw i32 %j.0.i20, 1, !dbg !3551
    #dbg_value(i32 %inc47.i, !3534, !DIExpression(), !3536)
  br label %for.cond38.i, !dbg !3552, !llvm.loop !3553

for.end48.i:                                      ; preds = %for.cond38.i
    #dbg_value(ptr %_pivot_row.i, !3555, !DIExpression(), !3559)
    #dbg_value(i32 %pivot_col.0.i, !3561, !DIExpression(), !3559)
  %div.i10.i35 = lshr i32 %pivot_col.0.i, 4, !dbg !3562
    #dbg_value(i32 %div.i10.i35, !3563, !DIExpression(), !3559)
    #dbg_value(i32 %pivot_col.0.i, !3564, !DIExpression(DW_OP_constu, 15, DW_OP_and, DW_OP_stack_value), !3559)
  %arrayidx.i12.i = getelementptr inbounds nuw i64, ptr %_pivot_row.i, i32 %div.i10.i35, !dbg !3565
  %32 = load i64, ptr %arrayidx.i12.i, align 8, !dbg !3565
  %rem.i11.i = shl i32 %pivot_col.0.i, 2, !dbg !3566
  %mul.i13.i = and i32 %rem.i11.i, 60, !dbg !3566
  %sh_prom.i14.i = zext nneg i32 %mul.i13.i to i64, !dbg !3567
  %shr.i15.i = lshr i64 %32, %sh_prom.i14.i, !dbg !3567
  %33 = trunc i64 %shr.i15.i to i8, !dbg !3568
  %conv.i16.i = and i8 %33, 15, !dbg !3568
    #dbg_value(i8 %conv.i16.i, !3505, !DIExpression(), !3481)
    #dbg_value(i8 %conv.i16.i, !3510, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !3569)
    #dbg_value(i32 0, !3518, !DIExpression(), !3569)
  %34 = load volatile i64, ptr @pqmayo_MAYO_5_ref_uint64_t_blocker, align 8, !dbg !3571
    #dbg_value(!DIArgList(i64 %34, i8 %conv.i16.i), !3506, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_lit0, DW_OP_ne, DW_OP_LLVM_convert, 1, DW_ATE_signed, DW_OP_LLVM_convert, 64, DW_ATE_signed, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_stack_value), !3481)
  %35 = icmp eq i8 %conv.i16.i, 0, !dbg !3572
  %36 = sext i1 %35 to i64, !dbg !3572
  %not52.i = xor i64 %34, %36, !dbg !3572
    #dbg_value(i64 %not52.i, !3506, !DIExpression(), !3481)
  %inc54.i = add nsw i32 %row.0.i, 1, !dbg !3573
    #dbg_value(i32 %inc54.i, !3504, !DIExpression(), !3503)
  br label %for.cond25.i, !dbg !3574, !llvm.loop !3575

for.end55.i:                                      ; preds = %for.cond25.i
  %pivot_is_zero.0.i.lcssa = phi i64 [ %pivot_is_zero.0.i, %for.cond25.i ], !dbg !3481
  %pivot.0.i.lcssa = phi i8 [ %pivot.0.i, %for.cond25.i ], !dbg !3481
    #dbg_value(i8 %pivot.0.i.lcssa, !3577, !DIExpression(), !3581)
    #dbg_value(i8 %pivot.0.i.lcssa, !3319, !DIExpression(), !3583)
    #dbg_value(i8 %pivot.0.i.lcssa, !3323, !DIExpression(), !3583)
  %37 = load volatile i8, ptr @pqmayo_MAYO_5_ref_unsigned_char_blocker, align 1, !dbg !3585
  %xor1.i17.i = xor i8 %pivot.0.i.lcssa, %37, !dbg !3586
    #dbg_value(i8 %xor1.i17.i, !3319, !DIExpression(), !3583)
  %38 = trunc i8 %xor1.i17.i to i1, !dbg !3587
    #dbg_value(i8 poison, !3327, !DIExpression(), !3583)
  %39 = and i8 %xor1.i17.i, 2, !dbg !3588
  %mul9.i.i22 = mul nuw nsw i8 %39, %pivot.0.i.lcssa, !dbg !3589
  %conv10.i.i23 = select i1 %38, i8 %pivot.0.i.lcssa, i8 0, !dbg !3587
  %xor11.i.i24 = xor i8 %conv10.i.i23, %mul9.i.i22, !dbg !3590
    #dbg_value(i8 %xor11.i.i24, !3327, !DIExpression(), !3583)
  %40 = and i8 %xor1.i17.i, 4, !dbg !3591
  %mul16.i.i25 = mul nuw nsw i8 %40, %pivot.0.i.lcssa, !dbg !3592
  %xor18.i.i26 = xor i8 %mul16.i.i25, %xor11.i.i24, !dbg !3593
    #dbg_value(i8 %xor18.i.i26, !3327, !DIExpression(), !3583)
  %41 = and i8 %xor1.i17.i, 8, !dbg !3594
  %mul23.i.i27 = mul nuw nsw i8 %41, %pivot.0.i.lcssa, !dbg !3595
  %xor25.i.i28 = xor i8 %mul23.i.i27, %xor18.i.i26, !dbg !3596
    #dbg_value(i8 %xor25.i.i28, !3327, !DIExpression(), !3583)
    #dbg_value(i8 %xor25.i.i28, !3337, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !3583)
  %42 = lshr i8 %xor25.i.i28, 4, !dbg !3597
  %43 = lshr i8 %xor25.i.i28, 3, !dbg !3598
  %44 = and i8 %43, 14, !dbg !3598
  %45 = xor i8 %42, %44, !dbg !3599
  %xor25.masked.i.i29 = and i8 %xor25.i.i28, 15, !dbg !3600
  %46 = xor i8 %45, %xor25.masked.i.i29, !dbg !3600
    #dbg_value(i8 %46, !3342, !DIExpression(), !3583)
    #dbg_value(i8 %46, !3601, !DIExpression(), !3581)
    #dbg_value(i8 %46, !3319, !DIExpression(), !3602)
    #dbg_value(i8 %46, !3323, !DIExpression(), !3602)
  %47 = load volatile i8, ptr @pqmayo_MAYO_5_ref_unsigned_char_blocker, align 1, !dbg !3604
  %xor1.i45.i = xor i8 %46, %47, !dbg !3605
    #dbg_value(i8 %xor1.i45.i, !3319, !DIExpression(), !3602)
  %48 = trunc i8 %xor1.i45.i to i1, !dbg !3606
    #dbg_value(i8 poison, !3327, !DIExpression(), !3602)
  %49 = and i8 %xor1.i45.i, 2, !dbg !3607
  %mul9.i46.i = mul nuw nsw i8 %49, %46, !dbg !3608
  %conv10.i47.i = select i1 %48, i8 %46, i8 0, !dbg !3606
  %xor11.i48.i = xor i8 %conv10.i47.i, %mul9.i46.i, !dbg !3609
    #dbg_value(i8 %xor11.i48.i, !3327, !DIExpression(), !3602)
  %50 = and i8 %xor1.i45.i, 4, !dbg !3610
  %mul16.i49.i = mul nuw nsw i8 %50, %46, !dbg !3611
  %xor18.i50.i = xor i8 %mul16.i49.i, %xor11.i48.i, !dbg !3612
    #dbg_value(i8 %xor18.i50.i, !3327, !DIExpression(), !3602)
  %51 = and i8 %xor1.i45.i, 8, !dbg !3613
  %mul23.i51.i = mul nuw nsw i8 %51, %46, !dbg !3614
  %xor25.i52.i = xor i8 %mul23.i51.i, %xor18.i50.i, !dbg !3615
    #dbg_value(i8 %xor25.i52.i, !3327, !DIExpression(), !3602)
    #dbg_value(i8 %xor25.i52.i, !3337, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !3602)
  %52 = lshr i8 %xor25.i52.i, 4, !dbg !3616
  %53 = lshr i8 %xor25.i52.i, 3, !dbg !3617
  %54 = and i8 %53, 14, !dbg !3617
  %55 = xor i8 %52, %54, !dbg !3618
  %xor25.masked.i53.i = and i8 %xor25.i52.i, 15, !dbg !3619
  %56 = xor i8 %55, %xor25.masked.i53.i, !dbg !3619
    #dbg_value(i8 %56, !3342, !DIExpression(), !3602)
    #dbg_value(i8 %56, !3620, !DIExpression(), !3581)
    #dbg_value(i8 %56, !3319, !DIExpression(), !3621)
    #dbg_value(i8 %56, !3323, !DIExpression(), !3621)
  %57 = load volatile i8, ptr @pqmayo_MAYO_5_ref_unsigned_char_blocker, align 1, !dbg !3623
  %xor1.i27.i = xor i8 %56, %57, !dbg !3624
    #dbg_value(i8 %xor1.i27.i, !3319, !DIExpression(), !3621)
  %58 = trunc i8 %xor1.i27.i to i1, !dbg !3625
    #dbg_value(i8 poison, !3327, !DIExpression(), !3621)
  %59 = and i8 %xor1.i27.i, 2, !dbg !3626
  %mul9.i28.i = mul nuw nsw i8 %59, %56, !dbg !3627
  %conv10.i29.i = select i1 %58, i8 %56, i8 0, !dbg !3625
  %xor11.i30.i = xor i8 %conv10.i29.i, %mul9.i28.i, !dbg !3628
    #dbg_value(i8 %xor11.i30.i, !3327, !DIExpression(), !3621)
  %60 = and i8 %xor1.i27.i, 4, !dbg !3629
  %mul16.i31.i = mul nuw nsw i8 %60, %56, !dbg !3630
  %xor18.i32.i = xor i8 %mul16.i31.i, %xor11.i30.i, !dbg !3631
    #dbg_value(i8 %xor18.i32.i, !3327, !DIExpression(), !3621)
  %61 = and i8 %xor1.i27.i, 8, !dbg !3632
  %mul23.i33.i = mul nuw nsw i8 %61, %56, !dbg !3633
  %xor25.i34.i = xor i8 %mul23.i33.i, %xor18.i32.i, !dbg !3634
    #dbg_value(i8 %xor25.i34.i, !3327, !DIExpression(), !3621)
    #dbg_value(i8 %xor25.i34.i, !3337, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !3621)
  %62 = lshr i8 %xor25.i34.i, 4, !dbg !3635
  %63 = lshr i8 %xor25.i34.i, 3, !dbg !3636
  %64 = and i8 %63, 14, !dbg !3636
  %65 = xor i8 %62, %64, !dbg !3637
  %xor25.masked.i35.i = and i8 %xor25.i34.i, 15, !dbg !3638
  %66 = xor i8 %65, %xor25.masked.i35.i, !dbg !3638
    #dbg_value(i8 %66, !3342, !DIExpression(), !3621)
    #dbg_value(i8 %66, !3639, !DIExpression(), !3581)
    #dbg_value(i8 %46, !3319, !DIExpression(), !3640)
    #dbg_value(i8 %56, !3323, !DIExpression(), !3640)
  %67 = load volatile i8, ptr @pqmayo_MAYO_5_ref_unsigned_char_blocker, align 1, !dbg !3642
  %xor1.i36.i = xor i8 %46, %67, !dbg !3643
    #dbg_value(i8 %xor1.i36.i, !3319, !DIExpression(), !3640)
  %68 = trunc i8 %xor1.i36.i to i1, !dbg !3644
    #dbg_value(i8 poison, !3327, !DIExpression(), !3640)
  %69 = and i8 %xor1.i36.i, 2, !dbg !3645
  %mul9.i37.i = mul nuw nsw i8 %69, %56, !dbg !3646
  %conv10.i38.i = select i1 %68, i8 %56, i8 0, !dbg !3644
  %xor11.i39.i = xor i8 %conv10.i38.i, %mul9.i37.i, !dbg !3647
    #dbg_value(i8 %xor11.i39.i, !3327, !DIExpression(), !3640)
  %70 = and i8 %xor1.i36.i, 4, !dbg !3648
  %mul16.i40.i = mul nuw nsw i8 %70, %56, !dbg !3649
  %xor18.i41.i = xor i8 %mul16.i40.i, %xor11.i39.i, !dbg !3650
    #dbg_value(i8 %xor18.i41.i, !3327, !DIExpression(), !3640)
  %71 = and i8 %xor1.i36.i, 8, !dbg !3651
  %mul23.i42.i = mul nuw nsw i8 %71, %56, !dbg !3652
  %xor25.i43.i = xor i8 %mul23.i42.i, %xor18.i41.i, !dbg !3653
    #dbg_value(i8 %xor25.i43.i, !3327, !DIExpression(), !3640)
    #dbg_value(i8 %xor25.i43.i, !3337, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !3640)
  %72 = lshr i8 %xor25.i43.i, 4, !dbg !3654
  %73 = lshr i8 %xor25.i43.i, 3, !dbg !3655
  %74 = and i8 %73, 14, !dbg !3655
  %75 = xor i8 %72, %74, !dbg !3656
  %xor25.masked.i44.i = and i8 %xor25.i43.i, 15, !dbg !3657
  %76 = xor i8 %75, %xor25.masked.i44.i, !dbg !3657
    #dbg_value(i8 %76, !3342, !DIExpression(), !3640)
    #dbg_value(i8 %76, !3658, !DIExpression(), !3581)
    #dbg_value(i8 %66, !3319, !DIExpression(), !3659)
    #dbg_value(i8 %76, !3323, !DIExpression(), !3659)
  %77 = load volatile i8, ptr @pqmayo_MAYO_5_ref_unsigned_char_blocker, align 1, !dbg !3661
  %xor1.i18.i = xor i8 %66, %77, !dbg !3662
    #dbg_value(i8 %xor1.i18.i, !3319, !DIExpression(), !3659)
  %78 = trunc i8 %xor1.i18.i to i1, !dbg !3663
    #dbg_value(i8 poison, !3327, !DIExpression(), !3659)
  %79 = and i8 %xor1.i18.i, 2, !dbg !3664
  %mul9.i19.i = mul nuw nsw i8 %79, %76, !dbg !3665
  %conv10.i20.i = select i1 %78, i8 %76, i8 0, !dbg !3663
  %xor11.i21.i = xor i8 %conv10.i20.i, %mul9.i19.i, !dbg !3666
    #dbg_value(i8 %xor11.i21.i, !3327, !DIExpression(), !3659)
  %80 = and i8 %xor1.i18.i, 4, !dbg !3667
  %mul16.i22.i = mul nuw nsw i8 %80, %76, !dbg !3668
  %xor18.i23.i = xor i8 %mul16.i22.i, %xor11.i21.i, !dbg !3669
    #dbg_value(i8 %xor18.i23.i, !3327, !DIExpression(), !3659)
  %81 = and i8 %xor1.i18.i, 8, !dbg !3670
  %mul23.i24.i = mul nuw nsw i8 %81, %76, !dbg !3671
  %xor25.i25.i = xor i8 %mul23.i24.i, %xor18.i23.i, !dbg !3672
    #dbg_value(i8 %xor25.i25.i, !3327, !DIExpression(), !3659)
    #dbg_value(i8 %xor25.i25.i, !3337, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !3659)
  %82 = lshr i8 %xor25.i25.i, 4, !dbg !3673
  %83 = lshr i8 %xor25.i25.i, 3, !dbg !3674
  %84 = and i8 %83, 14, !dbg !3674
  %85 = xor i8 %82, %84, !dbg !3675
  %xor25.masked.i26.i = and i8 %xor25.i25.i, 15, !dbg !3676
  %86 = xor i8 %85, %xor25.masked.i26.i, !dbg !3676
    #dbg_value(i8 %86, !3342, !DIExpression(), !3659)
    #dbg_value(i8 %86, !3677, !DIExpression(), !3581)
    #dbg_value(i8 %86, !3678, !DIExpression(), !3397)
  call fastcc void @vec_mul_add_u64(i32 noundef %div.i, ptr noundef nonnull %_pivot_row.i, i8 noundef zeroext %86, ptr noundef nonnull %_pivot_row2.i) #9, !dbg !3679
    #dbg_value(i32 %cond.i, !3680, !DIExpression(), !3682)
  br label %for.cond60.i, !dbg !3683

for.cond60.i:                                     ; preds = %for.inc86.i, %for.end55.i
  %row59.0.i = phi i32 [ %cond.i, %for.end55.i ], [ %inc87.i, %for.inc86.i ], !dbg !3684
    #dbg_value(i32 %row59.0.i, !3680, !DIExpression(), !3682)
  %cmp61.not.i = icmp sgt i32 %row59.0.i, %cond16.i, !dbg !3685
  br i1 %cmp61.not.i, label %for.cond90.i.preheader, label %for.body63.i, !dbg !3687

for.cond90.i.preheader:                           ; preds = %for.cond60.i
  %smax48 = call i32 @llvm.smax.i32(i32 %cond.i, i32 %m), !dbg !3688
  br label %for.cond90.i, !dbg !3688

for.body63.i:                                     ; preds = %for.cond60.i
    #dbg_value(i32 %row59.0.i, !3510, !DIExpression(), !3690)
    #dbg_value(i32 %pivot_row.0.i, !3518, !DIExpression(), !3690)
  %xor.i1.i = xor i32 %row59.0.i, %pivot_row.0.i, !dbg !3693
  %87 = icmp sgt i32 %xor.i1.i, 0, !dbg !3694
  %shr.i2.i = sext i1 %87 to i64, !dbg !3694
  %88 = load volatile i64, ptr @pqmayo_MAYO_5_ref_uint64_t_blocker, align 8, !dbg !3695
  %xor1.i.i30 = xor i64 %88, %shr.i2.i, !dbg !3696
  %and67.demorgan.i = or i64 %xor1.i.i30, %pivot_is_zero.0.i.lcssa, !dbg !3697
  %and67.i = xor i64 %and67.demorgan.i, -1, !dbg !3697
    #dbg_value(i64 %and67.i, !3698, !DIExpression(), !3699)
    #dbg_value(i64 %and67.demorgan.i, !3700, !DIExpression(), !3699)
    #dbg_value(i32 0, !3701, !DIExpression(), !3703)
  br label %for.cond69.i, !dbg !3704

for.cond69.i:                                     ; preds = %for.body72.i, %for.body63.i
  %col.0.i = phi i32 [ 0, %for.body63.i ], [ %inc84.i, %for.body72.i ], !dbg !3705
    #dbg_value(i32 %col.0.i, !3701, !DIExpression(), !3703)
  %exitcond47 = icmp ne i32 %col.0.i, %smax44, !dbg !3706
  br i1 %exitcond47, label %for.body72.i, label %for.inc86.i, !dbg !3708

for.body72.i:                                     ; preds = %for.cond69.i
  %mul73.i = mul nsw i32 %row59.0.i, %div.i, !dbg !3709
  %add74.i = add nsw i32 %mul73.i, %col.0.i, !dbg !3711
  %arrayidx75.i = getelementptr inbounds [1420 x i64], ptr %packed_A.i, i32 0, i32 %add74.i, !dbg !3712
  %89 = load i64, ptr %arrayidx75.i, align 8, !dbg !3712
  %and76.i = and i64 %and67.demorgan.i, %89, !dbg !3713
  %arrayidx77.i = getelementptr inbounds nuw [10 x i64], ptr %_pivot_row2.i, i32 0, i32 %col.0.i, !dbg !3714
  %90 = load i64, ptr %arrayidx77.i, align 8, !dbg !3714
  %and78.i = and i64 %90, %and67.i, !dbg !3715
  %add79.i = add i64 %and76.i, %and78.i, !dbg !3716
  %mul80.i = mul nsw i32 %row59.0.i, %div.i, !dbg !3717
  %add81.i = add nsw i32 %mul80.i, %col.0.i, !dbg !3718
  %arrayidx82.i = getelementptr inbounds [1420 x i64], ptr %packed_A.i, i32 0, i32 %add81.i, !dbg !3719
  store i64 %add79.i, ptr %arrayidx82.i, align 8, !dbg !3720
  %inc84.i = add nuw nsw i32 %col.0.i, 1, !dbg !3721
    #dbg_value(i32 %inc84.i, !3701, !DIExpression(), !3703)
  br label %for.cond69.i, !dbg !3722, !llvm.loop !3723

for.inc86.i:                                      ; preds = %for.cond69.i
  %inc87.i = add nsw i32 %row59.0.i, 1, !dbg !3725
    #dbg_value(i32 %inc87.i, !3680, !DIExpression(), !3682)
  br label %for.cond60.i, !dbg !3726, !llvm.loop !3727

for.cond90.i:                                     ; preds = %for.cond90.i.preheader, %for.body93.i
  %row89.0.i = phi i32 [ %inc110.i, %for.body93.i ], [ %cond.i, %for.cond90.i.preheader ], !dbg !3729
    #dbg_value(i32 %row89.0.i, !3730, !DIExpression(), !3731)
  %exitcond49 = icmp ne i32 %row89.0.i, %smax48, !dbg !3732
  br i1 %exitcond49, label %for.body93.i, label %for.inc117.i, !dbg !3688

for.body93.i:                                     ; preds = %for.cond90.i
  %cmp94.i = icmp sgt i32 %row89.0.i, %pivot_row.0.i, !dbg !3734
    #dbg_value(i1 %cmp94.i, !3736, !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3737)
  %mul98.i = mul nsw i32 %row89.0.i, %div.i, !dbg !3738
  %add.ptr99.i = getelementptr inbounds i64, ptr %packed_A.i, i32 %mul98.i, !dbg !3739
    #dbg_value(ptr %add.ptr99.i, !3555, !DIExpression(), !3740)
    #dbg_value(i32 %pivot_col.0.i, !3561, !DIExpression(), !3740)
  %div.i.i36 = lshr i32 %pivot_col.0.i, 4, !dbg !3742
    #dbg_value(i32 %div.i.i36, !3563, !DIExpression(), !3740)
    #dbg_value(i32 %pivot_col.0.i, !3564, !DIExpression(DW_OP_constu, 15, DW_OP_and, DW_OP_stack_value), !3740)
  %arrayidx.i.i31 = getelementptr inbounds nuw i64, ptr %add.ptr99.i, i32 %div.i.i36, !dbg !3743
  %91 = load i64, ptr %arrayidx.i.i31, align 8, !dbg !3743
  %rem.i.i = shl i32 %pivot_col.0.i, 2, !dbg !3744
  %mul.i.i = and i32 %rem.i.i, 60, !dbg !3744
  %sh_prom.i.i = zext nneg i32 %mul.i.i to i64, !dbg !3745
  %shr.i9.i = lshr i64 %91, %sh_prom.i.i, !dbg !3745
  %92 = trunc i64 %shr.i9.i to i8, !dbg !3746
  %conv.i.i = and i8 %92, 15, !dbg !3746
    #dbg_value(i8 %conv.i.i, !3747, !DIExpression(), !3737)
  %conv105.i = select i1 %cmp94.i, i8 %conv.i.i, i8 0, !dbg !3748
  %mul107.i = mul nsw i32 %row89.0.i, %div.i, !dbg !3749
  %add.ptr108.i = getelementptr inbounds i64, ptr %packed_A.i, i32 %mul107.i, !dbg !3750
  call fastcc void @vec_mul_add_u64(i32 noundef %div.i, ptr noundef nonnull %_pivot_row2.i, i8 noundef zeroext %conv105.i, ptr noundef nonnull %add.ptr108.i) #9, !dbg !3751
  %inc110.i = add i32 %row89.0.i, 1, !dbg !3752
    #dbg_value(i32 %inc110.i, !3730, !DIExpression(), !3731)
  br label %for.cond90.i, !dbg !3753, !llvm.loop !3754

for.inc117.i:                                     ; preds = %for.cond90.i
    #dbg_value(!DIArgList(i64 %pivot_is_zero.0.i.lcssa, i32 %pivot_row.0.i), !3471, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_plus_uconst, 1, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_plus, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !3397)
  %93 = trunc i64 %pivot_is_zero.0.i.lcssa to i32, !dbg !3756
  %94 = add i32 %93, 1, !dbg !3756
  %conv116.i = add i32 %94, %pivot_row.0.i, !dbg !3756
    #dbg_value(i32 %conv116.i, !3471, !DIExpression(), !3397)
  %inc118.i = add nuw i32 %pivot_col.0.i, 1, !dbg !3757
    #dbg_value(i32 %inc118.i, !3472, !DIExpression(), !3473)
  br label %for.cond3.i, !dbg !3758, !llvm.loop !3759

for.cond121.i:                                    ; preds = %for.cond121.i.preheader, %for.inc141.i
  %i120.0.i = phi i32 [ %inc142.i, %for.inc141.i ], [ 0, %for.cond121.i.preheader ], !dbg !3761
    #dbg_value(i32 %i120.0.i, !3762, !DIExpression(), !3763)
  %exitcond53 = icmp ne i32 %i120.0.i, %smax37, !dbg !3764
  br i1 %exitcond53, label %for.body124.i, label %EF.exit, !dbg !3476

for.body124.i:                                    ; preds = %for.cond121.i
  %mul126.i = mul nsw i32 %i120.0.i, %div.i, !dbg !3766
  %add.ptr127.i = getelementptr inbounds i64, ptr %packed_A.i, i32 %mul126.i, !dbg !3768
    #dbg_value(i32 %div.i, !3769, !DIExpression(), !3773)
    #dbg_value(ptr %add.ptr127.i, !3775, !DIExpression(), !3773)
    #dbg_value(ptr %temp.i, !3776, !DIExpression(), !3773)
    #dbg_value(ptr %add.ptr127.i, !3777, !DIExpression(), !3773)
    #dbg_value(i32 0, !3778, !DIExpression(), !3780)
  br label %for.cond.i.i16, !dbg !3781

for.cond.i.i16:                                   ; preds = %for.body.i.i19, %for.body124.i
  %i.0.i.i17 = phi i32 [ 0, %for.body124.i ], [ %add8.i.i, %for.body.i.i19 ], !dbg !3782
    #dbg_value(i32 %i.0.i.i17, !3778, !DIExpression(), !3780)
  %mul.i54.i = shl nsw i32 %div.i, 4, !dbg !3783
  %cmp.i.i18 = icmp slt i32 %i.0.i.i17, %mul.i54.i, !dbg !3785
  br i1 %cmp.i.i18, label %for.body.i.i19, label %for.cond130.i.preheader, !dbg !3786

for.cond130.i.preheader:                          ; preds = %for.cond.i.i16
  br label %for.cond130.i, !dbg !3787

for.body.i.i19:                                   ; preds = %for.cond.i.i16
  %div.i55.i = lshr exact i32 %i.0.i.i17, 1, !dbg !3789
  %arrayidx.i56.i = getelementptr inbounds nuw i8, ptr %add.ptr127.i, i32 %div.i55.i, !dbg !3791
  %95 = load i8, ptr %arrayidx.i56.i, align 1, !dbg !3791
  %96 = and i8 %95, 15, !dbg !3792
  %arrayidx2.i.i = getelementptr inbounds nuw i8, ptr %temp.i, i32 %i.0.i.i17, !dbg !3793
  store i8 %96, ptr %arrayidx2.i.i, align 1, !dbg !3794
  %div3.i.i = lshr exact i32 %i.0.i.i17, 1, !dbg !3795
  %arrayidx4.i.i = getelementptr inbounds nuw i8, ptr %add.ptr127.i, i32 %div3.i.i, !dbg !3796
  %97 = load i8, ptr %arrayidx4.i.i, align 1, !dbg !3796
  %98 = lshr i8 %97, 4, !dbg !3797
  %add.i.i = or disjoint i32 %i.0.i.i17, 1, !dbg !3798
  %arrayidx7.i.i = getelementptr inbounds nuw i8, ptr %temp.i, i32 %add.i.i, !dbg !3799
  store i8 %98, ptr %arrayidx7.i.i, align 1, !dbg !3800
  %add8.i.i = add nuw nsw i32 %i.0.i.i17, 2, !dbg !3801
    #dbg_value(i32 %add8.i.i, !3778, !DIExpression(), !3780)
  br label %for.cond.i.i16, !dbg !3802, !llvm.loop !3803

for.cond130.i:                                    ; preds = %for.cond130.i.preheader, %for.body133.i
  %j129.0.i = phi i32 [ %inc139.i, %for.body133.i ], [ 0, %for.cond130.i.preheader ], !dbg !3805
    #dbg_value(i32 %j129.0.i, !3806, !DIExpression(), !3807)
  %exitcond52 = icmp eq i32 %j129.0.i, %20, !dbg !3808
  br i1 %exitcond52, label %for.inc141.i, label %for.body133.i, !dbg !3787

for.body133.i:                                    ; preds = %for.cond130.i
  %arrayidx134.i = getelementptr inbounds nuw [160 x i8], ptr %temp.i, i32 0, i32 %j129.0.i, !dbg !3810
  %99 = load i8, ptr %arrayidx134.i, align 1, !dbg !3810
  %mul135.i = mul nsw i32 %i120.0.i, %add32, !dbg !3812
  %100 = getelementptr i8, ptr %A, i32 %mul135.i, !dbg !3813
  %arrayidx137.i = getelementptr i8, ptr %100, i32 %j129.0.i, !dbg !3813
  store i8 %99, ptr %arrayidx137.i, align 1, !dbg !3814
  %inc139.i = add nuw i32 %j129.0.i, 1, !dbg !3815
    #dbg_value(i32 %inc139.i, !3806, !DIExpression(), !3807)
  br label %for.cond130.i, !dbg !3816, !llvm.loop !3817

for.inc141.i:                                     ; preds = %for.cond130.i
  %inc142.i = add nuw i32 %i120.0.i, 1, !dbg !3819
    #dbg_value(i32 %inc142.i, !3762, !DIExpression(), !3763)
  br label %for.cond121.i, !dbg !3820, !llvm.loop !3821

EF.exit:                                          ; preds = %for.cond121.i
  call void @mayo_secure_clear(ptr noundef nonnull %temp.i, i32 noundef 160) #8, !dbg !3823
  call void @mayo_secure_clear(ptr noundef nonnull %_pivot_row.i, i32 noundef 80) #8, !dbg !3824
  call void @mayo_secure_clear(ptr noundef nonnull %_pivot_row2.i, i32 noundef 80) #8, !dbg !3825
  call void @mayo_secure_clear(ptr noundef nonnull %packed_A.i, i32 noundef 11360) #8, !dbg !3826
  call void @llvm.lifetime.end.p0(i64 80, ptr nonnull %_pivot_row.i), !dbg !3827
  call void @llvm.lifetime.end.p0(i64 80, ptr nonnull %_pivot_row2.i), !dbg !3827
  call void @llvm.lifetime.end.p0(i64 11360, ptr nonnull %packed_A.i), !dbg !3827
  call void @llvm.lifetime.end.p0(i64 160, ptr nonnull %temp.i), !dbg !3827
    #dbg_value(i8 0, !3828, !DIExpression(), !3227)
    #dbg_value(i32 0, !3829, !DIExpression(), !3831)
  %101 = add i32 %A_cols, -1, !dbg !3832
  %smax54 = call i32 @llvm.smax.i32(i32 %101, i32 0), !dbg !3832
  br label %for.cond34, !dbg !3832

for.cond34:                                       ; preds = %for.inc43, %EF.exit
  %full_rank.0 = phi i8 [ 0, %EF.exit ], [ %or12, %for.inc43 ], !dbg !3227
  %i33.0 = phi i32 [ 0, %EF.exit ], [ %inc44, %for.inc43 ], !dbg !3833
    #dbg_value(i32 %i33.0, !3829, !DIExpression(), !3831)
    #dbg_value(i8 %full_rank.0, !3828, !DIExpression(), !3227)
  %exitcond55 = icmp ne i32 %i33.0, %smax54, !dbg !3834
  br i1 %exitcond55, label %for.inc43, label %for.end45, !dbg !3836

for.inc43:                                        ; preds = %for.cond34
    #dbg_value(!DIArgList(i8 poison, i8 poison), !3828, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3227)
  %sub37 = add nsw i32 %m, -1, !dbg !3837
  %mul38 = mul nsw i32 %sub37, %A_cols, !dbg !3839
  %102 = getelementptr i8, ptr %A, i32 %mul38, !dbg !3840
  %arrayidx40 = getelementptr i8, ptr %102, i32 %i33.0, !dbg !3840
  %103 = load i8, ptr %arrayidx40, align 1, !dbg !3840
    #dbg_value(!DIArgList(i8 %full_rank.0, i8 %103), !3828, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3227)
  %or12 = or i8 %full_rank.0, %103, !dbg !3841
    #dbg_value(i8 %or12, !3828, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3227)
    #dbg_value(i8 %or12, !3828, !DIExpression(), !3227)
  %inc44 = add nuw i32 %i33.0, 1, !dbg !3842
    #dbg_value(i32 %inc44, !3829, !DIExpression(), !3831)
  br label %for.cond34, !dbg !3843, !llvm.loop !3844

for.end45:                                        ; preds = %for.cond34
  %full_rank.0.lcssa = phi i8 [ %full_rank.0, %for.cond34 ], !dbg !3227
  %cmp47 = icmp eq i8 %full_rank.0.lcssa, 0, !dbg !3846
  br i1 %cmp47, label %return, label %for.cond50.preheader, !dbg !3846

for.cond50.preheader:                             ; preds = %for.end45
  br label %for.cond50, !dbg !3848

for.cond50.loopexit:                              ; preds = %for.cond63
  br label %for.cond50, !dbg !3848, !llvm.loop !3850

for.cond50:                                       ; preds = %for.cond50.preheader, %for.cond50.loopexit
  %row.0.in = phi i32 [ %row.0, %for.cond50.loopexit ], [ %m, %for.cond50.preheader ]
  %row.0 = add nsw i32 %row.0.in, -1, !dbg !3852
    #dbg_value(i32 %row.0, !3853, !DIExpression(), !3854)
  %cmp51 = icmp sgt i32 %row.0.in, 0, !dbg !3855
  br i1 %cmp51, label %for.body53, label %return.loopexit, !dbg !3848

for.body53:                                       ; preds = %for.cond50
    #dbg_value(i8 0, !3857, !DIExpression(), !3227)
  %sub54 = sub nsw i32 %m, %row.0, !dbg !3858
  %div = sdiv i32 32, %sub54, !dbg !3858
  %add55 = add nsw i32 %row.0, %div, !dbg !3858
  %mul56 = mul nsw i32 %k, %o, !dbg !3858
  %cmp57 = icmp slt i32 %add55, %mul56, !dbg !3858
  br i1 %cmp57, label %cond.true, label %cond.false, !dbg !3858

cond.true:                                        ; preds = %for.body53
  %sub59 = sub nsw i32 %m, %row.0, !dbg !3858
  %div60 = sdiv i32 32, %sub59, !dbg !3858
  %add61 = add nsw i32 %row.0, %div60, !dbg !3858
  br label %cond.end, !dbg !3858

cond.false:                                       ; preds = %for.body53
  %mul62 = mul nsw i32 %k, %o, !dbg !3858
  br label %cond.end, !dbg !3858

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %add61, %cond.true ], [ %mul62, %cond.false ], !dbg !3858
    #dbg_value(i32 %cond, !3860, !DIExpression(), !3227)
    #dbg_value(i32 %row.0, !3861, !DIExpression(), !3863)
  br label %for.cond63, !dbg !3864

for.cond63:                                       ; preds = %for.inc229, %cond.end
  %finished.0 = phi i8 [ 0, %cond.end ], [ %or2273, %for.inc229 ], !dbg !3865
  %col.0 = phi i32 [ %row.0, %cond.end ], [ %inc230, %for.inc229 ], !dbg !3866
    #dbg_value(i32 %col.0, !3861, !DIExpression(), !3863)
    #dbg_value(i8 %finished.0, !3857, !DIExpression(), !3227)
  %cmp64.not = icmp sgt i32 %col.0, %cond, !dbg !3867
  br i1 %cmp64.not, label %for.cond50.loopexit, label %for.body66, !dbg !3869

for.body66:                                       ; preds = %for.cond63
  %mul67 = mul nsw i32 %row.0, %A_cols, !dbg !3870
  %104 = getelementptr i8, ptr %A, i32 %mul67, !dbg !3872
  %arrayidx69 = getelementptr i8, ptr %104, i32 %col.0, !dbg !3872
  %105 = load i8, ptr %arrayidx69, align 1, !dbg !3872
    #dbg_value(i8 %105, !3873, !DIExpression(), !3875)
    #dbg_value(i8 0, !3877, !DIExpression(), !3875)
  %106 = icmp ne i8 %105, 0, !dbg !3878
  %conv3.i = sext i1 %106 to i8, !dbg !3879
  %107 = load volatile i8, ptr @pqmayo_MAYO_5_ref_unsigned_char_blocker, align 1, !dbg !3880
  %xor5.i = xor i8 %107, %conv3.i, !dbg !3881
  %not = xor i8 %finished.0, -1, !dbg !3882
    #dbg_value(!DIArgList(i8 %xor5.i, i8 %not), !3883, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_and, DW_OP_stack_value), !3227)
  %add76 = mul i32 %row.0.in, %A_cols, !dbg !3884
  %108 = getelementptr i8, ptr %A, i32 %add76, !dbg !3885
  %arrayidx78 = getelementptr i8, ptr %108, i32 -1, !dbg !3885
  %109 = load i8, ptr %arrayidx78, align 1, !dbg !3885
  %110 = and i8 %109, %not, !dbg !3886
  %and801 = and i8 %110, %xor5.i, !dbg !3886
    #dbg_value(i8 %and801, !3887, !DIExpression(), !3888)
  %arrayidx83 = getelementptr inbounds i8, ptr %x, i32 %col.0, !dbg !3889
  %111 = load i8, ptr %arrayidx83, align 1, !dbg !3890
  %xor2 = xor i8 %111, %and801, !dbg !3890
  store i8 %xor2, ptr %arrayidx83, align 1, !dbg !3890
    #dbg_value(i32 0, !3891, !DIExpression(), !3893)
  br label %for.cond87, !dbg !3894

for.cond87:                                       ; preds = %for.body90, %for.body66
  %i86.0 = phi i32 [ 0, %for.body66 ], [ %add223, %for.body90 ], !dbg !3895
    #dbg_value(i32 %i86.0, !3891, !DIExpression(), !3893)
  %cmp88 = icmp slt i32 %i86.0, %row.0, !dbg !3896
  br i1 %cmp88, label %for.body90, label %for.inc229, !dbg !3898

for.body90:                                       ; preds = %for.cond87
  %mul91 = mul nsw i32 %i86.0, %A_cols, !dbg !3899
  %112 = getelementptr i8, ptr %A, i32 %mul91, !dbg !3901
  %arrayidx93 = getelementptr i8, ptr %112, i32 %col.0, !dbg !3901
  %113 = load i8, ptr %arrayidx93, align 1, !dbg !3901
  %conv94 = zext i8 %113 to i64, !dbg !3902
  %add95 = or disjoint i32 %i86.0, 1, !dbg !3903
  %mul96 = mul nsw i32 %add95, %A_cols, !dbg !3904
  %114 = getelementptr i8, ptr %A, i32 %mul96, !dbg !3905
  %arrayidx98 = getelementptr i8, ptr %114, i32 %col.0, !dbg !3905
  %115 = load i8, ptr %arrayidx98, align 1, !dbg !3905
  %conv99 = zext i8 %115 to i64, !dbg !3906
  %shl100 = shl nuw nsw i64 %conv99, 8, !dbg !3907
  %xor101 = or disjoint i64 %shl100, %conv94, !dbg !3908
  %add102 = or disjoint i32 %i86.0, 2, !dbg !3909
  %mul103 = mul nsw i32 %add102, %A_cols, !dbg !3910
  %116 = getelementptr i8, ptr %A, i32 %mul103, !dbg !3911
  %arrayidx105 = getelementptr i8, ptr %116, i32 %col.0, !dbg !3911
  %117 = load i8, ptr %arrayidx105, align 1, !dbg !3911
  %conv106 = zext i8 %117 to i64, !dbg !3912
  %shl107 = shl nuw nsw i64 %conv106, 16, !dbg !3913
  %xor108 = or disjoint i64 %xor101, %shl107, !dbg !3914
  %add109 = or disjoint i32 %i86.0, 3, !dbg !3915
  %mul110 = mul nsw i32 %add109, %A_cols, !dbg !3916
  %118 = getelementptr i8, ptr %A, i32 %mul110, !dbg !3917
  %arrayidx112 = getelementptr i8, ptr %118, i32 %col.0, !dbg !3917
  %119 = load i8, ptr %arrayidx112, align 1, !dbg !3917
  %conv113 = zext i8 %119 to i64, !dbg !3918
  %shl114 = shl nuw nsw i64 %conv113, 24, !dbg !3919
  %xor115 = or disjoint i64 %xor108, %shl114, !dbg !3920
  %add116 = or disjoint i32 %i86.0, 4, !dbg !3921
  %mul117 = mul nsw i32 %add116, %A_cols, !dbg !3922
  %120 = getelementptr i8, ptr %A, i32 %mul117, !dbg !3923
  %arrayidx119 = getelementptr i8, ptr %120, i32 %col.0, !dbg !3923
  %121 = load i8, ptr %arrayidx119, align 1, !dbg !3923
  %conv120 = zext i8 %121 to i64, !dbg !3924
  %shl121 = shl nuw nsw i64 %conv120, 32, !dbg !3925
  %xor122 = or disjoint i64 %xor115, %shl121, !dbg !3926
  %add123 = or disjoint i32 %i86.0, 5, !dbg !3927
  %mul124 = mul nsw i32 %add123, %A_cols, !dbg !3928
  %122 = getelementptr i8, ptr %A, i32 %mul124, !dbg !3929
  %arrayidx126 = getelementptr i8, ptr %122, i32 %col.0, !dbg !3929
  %123 = load i8, ptr %arrayidx126, align 1, !dbg !3929
  %conv127 = zext i8 %123 to i64, !dbg !3930
  %shl128 = shl nuw nsw i64 %conv127, 40, !dbg !3931
  %xor129 = xor i64 %xor122, %shl128, !dbg !3932
  %add130 = or disjoint i32 %i86.0, 6, !dbg !3933
  %mul131 = mul nsw i32 %add130, %A_cols, !dbg !3934
  %124 = getelementptr i8, ptr %A, i32 %mul131, !dbg !3935
  %arrayidx133 = getelementptr i8, ptr %124, i32 %col.0, !dbg !3935
  %125 = load i8, ptr %arrayidx133, align 1, !dbg !3935
  %conv134 = zext i8 %125 to i64, !dbg !3936
  %shl135 = shl nuw nsw i64 %conv134, 48, !dbg !3937
  %xor136 = xor i64 %xor129, %shl135, !dbg !3938
  %add137 = or disjoint i32 %i86.0, 7, !dbg !3939
  %mul138 = mul nsw i32 %add137, %A_cols, !dbg !3940
  %126 = getelementptr i8, ptr %A, i32 %mul138, !dbg !3941
  %arrayidx140 = getelementptr i8, ptr %126, i32 %col.0, !dbg !3941
  %127 = load i8, ptr %arrayidx140, align 1, !dbg !3941
  %conv141 = zext i8 %127 to i64, !dbg !3942
  %shl142 = shl nuw i64 %conv141, 56, !dbg !3943
  %xor143 = xor i64 %xor136, %shl142, !dbg !3944
    #dbg_value(i64 %xor143, !3945, !DIExpression(), !3946)
    #dbg_value(i8 %and801, !3947, !DIExpression(), !3951)
    #dbg_value(i64 %xor143, !3953, !DIExpression(), !3951)
  %128 = and i8 %and801, 1, !dbg !3954
  %conv1.i = zext nneg i8 %128 to i64, !dbg !3955
  %mul.i = mul nuw nsw i64 %xor143, %conv1.i, !dbg !3956
    #dbg_value(i64 %mul.i, !3957, !DIExpression(), !3951)
  %129 = and i8 %and801, 2, !dbg !3958
  %conv4.i = zext nneg i8 %129 to i64, !dbg !3959
  %mul5.i = mul i64 %xor143, %conv4.i, !dbg !3960
  %xor.i = xor i64 %mul.i, %mul5.i, !dbg !3961
    #dbg_value(i64 %xor.i, !3957, !DIExpression(), !3951)
  %130 = and i8 %and801, 4, !dbg !3962
  %conv8.i = zext nneg i8 %130 to i64, !dbg !3963
  %mul9.i = mul i64 %xor143, %conv8.i, !dbg !3964
  %xor10.i = xor i64 %xor.i, %mul9.i, !dbg !3965
    #dbg_value(i64 %xor10.i, !3957, !DIExpression(), !3951)
  %131 = and i8 %and801, 8, !dbg !3966
  %conv13.i = zext nneg i8 %131 to i64, !dbg !3967
  %mul14.i = mul i64 %xor143, %conv13.i, !dbg !3968
  %xor15.i = xor i64 %xor10.i, %mul14.i, !dbg !3969
    #dbg_value(i64 %xor15.i, !3957, !DIExpression(), !3951)
    #dbg_value(i64 %xor15.i, !3970, !DIExpression(DW_OP_constu, 17361641481138401520, DW_OP_and, DW_OP_stack_value), !3951)
  %shr.i = lshr i64 %xor15.i, 4, !dbg !3971
  %and16.i = lshr i64 %xor15.i, 3, !dbg !3972
  %shr18.i = and i64 %and16.i, 1012762419733073422, !dbg !3972
  %132 = xor i64 %shr.i, %shr18.i, !dbg !3973
  %xor19.i = xor i64 %132, %xor15.i, !dbg !3973
    #dbg_value(i64 %xor19.i, !3974, !DIExpression(DW_OP_constu, 1085102592571150095, DW_OP_and, DW_OP_stack_value), !3951)
    #dbg_value(i64 %xor19.i, !3945, !DIExpression(DW_OP_constu, 1085102592571150095, DW_OP_and, DW_OP_stack_value), !3946)
  %mul1464 = or disjoint i32 %i86.0, 1, !dbg !3975
  %add147 = mul i32 %mul1464, %A_cols, !dbg !3975
  %133 = getelementptr i8, ptr %A, i32 %add147, !dbg !3976
  %arrayidx149 = getelementptr i8, ptr %133, i32 -1, !dbg !3976
  %134 = load i8, ptr %arrayidx149, align 1, !dbg !3977
  %135 = trunc i64 %xor19.i to i8, !dbg !3977
  %136 = and i8 %135, 15, !dbg !3977
  %conv152 = xor i8 %136, %134, !dbg !3977
  store i8 %conv152, ptr %arrayidx149, align 1, !dbg !3977
  %shr = lshr i64 %xor19.i, 8, !dbg !3978
  %mul1555 = or disjoint i32 %i86.0, 2, !dbg !3979
  %add156 = mul i32 %mul1555, %A_cols, !dbg !3979
  %137 = getelementptr i8, ptr %A, i32 %add156, !dbg !3980
  %arrayidx158 = getelementptr i8, ptr %137, i32 -1, !dbg !3980
  %138 = load i8, ptr %arrayidx158, align 1, !dbg !3981
  %139 = trunc i64 %shr to i8, !dbg !3981
  %140 = and i8 %139, 15, !dbg !3981
  %conv161 = xor i8 %140, %138, !dbg !3981
  store i8 %conv161, ptr %arrayidx158, align 1, !dbg !3981
  %shr162 = lshr i64 %xor19.i, 16, !dbg !3982
  %mul1656 = or disjoint i32 %i86.0, 3, !dbg !3983
  %add166 = mul i32 %mul1656, %A_cols, !dbg !3983
  %141 = getelementptr i8, ptr %A, i32 %add166, !dbg !3984
  %arrayidx168 = getelementptr i8, ptr %141, i32 -1, !dbg !3984
  %142 = load i8, ptr %arrayidx168, align 1, !dbg !3985
  %143 = trunc i64 %shr162 to i8, !dbg !3985
  %144 = and i8 %143, 15, !dbg !3985
  %conv171 = xor i8 %144, %142, !dbg !3985
  store i8 %conv171, ptr %arrayidx168, align 1, !dbg !3985
  %shr172 = lshr i64 %xor19.i, 24, !dbg !3986
  %mul1757 = or disjoint i32 %i86.0, 4, !dbg !3987
  %add176 = mul i32 %mul1757, %A_cols, !dbg !3987
  %145 = getelementptr i8, ptr %A, i32 %add176, !dbg !3988
  %arrayidx178 = getelementptr i8, ptr %145, i32 -1, !dbg !3988
  %146 = load i8, ptr %arrayidx178, align 1, !dbg !3989
  %147 = trunc i64 %shr172 to i8, !dbg !3989
  %148 = and i8 %147, 15, !dbg !3989
  %conv181 = xor i8 %148, %146, !dbg !3989
  store i8 %conv181, ptr %arrayidx178, align 1, !dbg !3989
  %shr182 = lshr i64 %xor19.i, 32, !dbg !3990
  %mul1858 = or disjoint i32 %i86.0, 5, !dbg !3991
  %add186 = mul i32 %mul1858, %A_cols, !dbg !3991
  %149 = getelementptr i8, ptr %A, i32 %add186, !dbg !3992
  %arrayidx188 = getelementptr i8, ptr %149, i32 -1, !dbg !3992
  %150 = load i8, ptr %arrayidx188, align 1, !dbg !3993
  %151 = trunc i64 %shr182 to i8, !dbg !3993
  %152 = and i8 %151, 15, !dbg !3993
  %conv191 = xor i8 %152, %150, !dbg !3993
  store i8 %conv191, ptr %arrayidx188, align 1, !dbg !3993
  %shr192 = lshr i64 %xor19.i, 40, !dbg !3994
  %mul1959 = or disjoint i32 %i86.0, 6, !dbg !3995
  %add196 = mul i32 %mul1959, %A_cols, !dbg !3995
  %153 = getelementptr i8, ptr %A, i32 %add196, !dbg !3996
  %arrayidx198 = getelementptr i8, ptr %153, i32 -1, !dbg !3996
  %154 = load i8, ptr %arrayidx198, align 1, !dbg !3997
  %155 = trunc i64 %shr192 to i8, !dbg !3997
  %156 = and i8 %155, 15, !dbg !3997
  %conv201 = xor i8 %156, %154, !dbg !3997
  store i8 %conv201, ptr %arrayidx198, align 1, !dbg !3997
  %shr202 = lshr i64 %xor19.i, 48, !dbg !3998
  %mul20510 = or disjoint i32 %i86.0, 7, !dbg !3999
  %add206 = mul i32 %mul20510, %A_cols, !dbg !3999
  %157 = getelementptr i8, ptr %A, i32 %add206, !dbg !4000
  %arrayidx208 = getelementptr i8, ptr %157, i32 -1, !dbg !4000
  %158 = load i8, ptr %arrayidx208, align 1, !dbg !4001
  %159 = trunc i64 %shr202 to i8, !dbg !4001
  %160 = and i8 %159, 15, !dbg !4001
  %conv211 = xor i8 %160, %158, !dbg !4001
  store i8 %conv211, ptr %arrayidx208, align 1, !dbg !4001
  %and20.i = lshr i64 %xor19.i, 56, !dbg !4002
  %mul21511 = add nuw i32 %i86.0, 8, !dbg !4003
  %add216 = mul i32 %mul21511, %A_cols, !dbg !4003
  %161 = getelementptr i8, ptr %A, i32 %add216, !dbg !4004
  %arrayidx218 = getelementptr i8, ptr %161, i32 -1, !dbg !4004
  %162 = load i8, ptr %arrayidx218, align 1, !dbg !4005
  %163 = trunc nuw i64 %and20.i to i8, !dbg !4005
  %164 = and i8 %163, 15, !dbg !4005
  %conv221 = xor i8 %164, %162, !dbg !4005
  store i8 %conv221, ptr %arrayidx218, align 1, !dbg !4005
  %add223 = add nuw nsw i32 %i86.0, 8, !dbg !4006
    #dbg_value(i32 %add223, !3891, !DIExpression(), !3893)
  br label %for.cond87, !dbg !4007, !llvm.loop !4008

for.inc229:                                       ; preds = %for.cond87
    #dbg_value(!DIArgList(i8 %finished.0, i8 %xor5.i), !3857, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3227)
  %or2273 = or i8 %finished.0, %xor5.i, !dbg !4010
    #dbg_value(i8 %or2273, !3857, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3227)
    #dbg_value(i8 %or2273, !3857, !DIExpression(), !3227)
  %inc230 = add nsw i32 %col.0, 1, !dbg !4011
    #dbg_value(i32 %inc230, !3861, !DIExpression(), !3863)
  br label %for.cond63, !dbg !4012, !llvm.loop !4013

return.loopexit:                                  ; preds = %for.cond50
  br label %return, !dbg !4015

return:                                           ; preds = %return.loopexit, %for.end45
  %retval.0 = phi i32 [ 0, %for.end45 ], [ 1, %return.loopexit ], !dbg !3227
  ret i32 %retval.0, !dbg !4015
}

; Function Attrs: nounwind
define internal fastcc void @vec_mul_add_u64(i32 noundef %legs, ptr noundef %in, i8 noundef zeroext %a, ptr noundef %acc) unnamed_addr #0 !dbg !4016 {
entry:
    #dbg_value(i32 %legs, !4019, !DIExpression(), !4020)
    #dbg_value(ptr %in, !4021, !DIExpression(), !4020)
    #dbg_value(i8 %a, !4022, !DIExpression(), !4020)
    #dbg_value(ptr %acc, !4023, !DIExpression(), !4020)
    #dbg_value(i8 %a, !4024, !DIExpression(), !4026)
  %conv.i = zext i8 %a to i32, !dbg !4028
  %mul.i = mul i32 %conv.i, 134480385, !dbg !4029
    #dbg_value(i32 %mul.i, !4030, !DIExpression(), !4026)
    #dbg_value(i32 -252645136, !4031, !DIExpression(), !4026)
  %and.i = and i32 %mul.i, -252645136, !dbg !4032
    #dbg_value(i32 %and.i, !4033, !DIExpression(), !4026)
  %shr.i = lshr exact i32 %and.i, 4, !dbg !4034
  %shr1.i = lshr exact i32 %and.i, 3, !dbg !4035
  %0 = xor i32 %shr.i, %shr1.i, !dbg !4036
  %xor2.i = xor i32 %0, %mul.i, !dbg !4036
    #dbg_value(i32 %xor2.i, !4037, !DIExpression(), !4020)
    #dbg_value(i64 1229782938247303441, !4038, !DIExpression(), !4020)
    #dbg_value(i32 0, !4039, !DIExpression(), !4041)
  %smax = call i32 @llvm.smax.i32(i32 %legs, i32 0), !dbg !4042
  br label %for.cond, !dbg !4042

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !4043
    #dbg_value(i32 %i.0, !4039, !DIExpression(), !4041)
  %exitcond = icmp ne i32 %i.0, %smax, !dbg !4044
  br i1 %exitcond, label %for.body, label %for.end, !dbg !4046

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !4047
  %1 = load i64, ptr %arrayidx, align 8, !dbg !4047
  %and = and i64 %1, 1229782938247303441, !dbg !4049
  %and1 = and i32 %xor2.i, 255, !dbg !4050
  %conv = zext nneg i32 %and1 to i64, !dbg !4051
  %mul = mul i64 %and, %conv, !dbg !4052
  %shr = lshr i64 %1, 1, !dbg !4053
  %and3 = and i64 %shr, 1229782938247303441, !dbg !4054
  %shr4 = lshr i32 %xor2.i, 8, !dbg !4055
  %and5 = and i32 %shr4, 15, !dbg !4056
  %conv6 = zext nneg i32 %and5 to i64, !dbg !4057
  %mul7 = mul nuw i64 %and3, %conv6, !dbg !4058
  %xor = xor i64 %mul, %mul7, !dbg !4059
  %arrayidx8 = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !4060
  %2 = load i64, ptr %arrayidx8, align 8, !dbg !4060
  %shr9 = lshr i64 %2, 2, !dbg !4061
  %and10 = and i64 %shr9, 1229782938247303441, !dbg !4062
  %shr11 = lshr i32 %xor2.i, 16, !dbg !4063
  %and12 = and i32 %shr11, 15, !dbg !4064
  %conv13 = zext nneg i32 %and12 to i64, !dbg !4065
  %mul14 = mul nuw i64 %and10, %conv13, !dbg !4066
  %xor15 = xor i64 %xor, %mul14, !dbg !4067
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !4068
  %3 = load i64, ptr %arrayidx16, align 8, !dbg !4068
  %shr17 = lshr i64 %3, 3, !dbg !4069
  %and18 = and i64 %shr17, 1229782938247303441, !dbg !4070
  %shr19 = lshr i32 %xor2.i, 24, !dbg !4071
  %and20 = and i32 %shr19, 15, !dbg !4072
  %conv21 = zext nneg i32 %and20 to i64, !dbg !4073
  %mul22 = mul nuw i64 %and18, %conv21, !dbg !4074
  %xor23 = xor i64 %xor15, %mul22, !dbg !4075
  %arrayidx24 = getelementptr inbounds nuw i64, ptr %acc, i32 %i.0, !dbg !4076
  %4 = load i64, ptr %arrayidx24, align 8, !dbg !4077
  %xor25 = xor i64 %4, %xor23, !dbg !4077
  store i64 %xor25, ptr %arrayidx24, align 8, !dbg !4077
  %inc = add nuw i32 %i.0, 1, !dbg !4078
    #dbg_value(i32 %inc, !4039, !DIExpression(), !4041)
  br label %for.cond, !dbg !4079, !llvm.loop !4080

for.end:                                          ; preds = %for.cond
  ret void, !dbg !4082
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #5

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #6

attributes #0 = { nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #1 = { allocsize(0,1) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #4 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #5 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #7 = { nobuiltin nounwind allocsize(0,1) "no-builtins" }
attributes #8 = { nobuiltin nounwind "no-builtins" }
attributes #9 = { nobuiltin "no-builtins" }

!llvm.dbg.cu = !{!105, !48, !84}
!llvm.ident = !{!108, !108, !108}
!llvm.module.flags = !{!109, !110, !111, !112}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 41, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "../example.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 136, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 17)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 41, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 56, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 7)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 43, type: !3, isLocal: true, isDefinition: true)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(scope: null, file: !2, line: 46, type: !16, isLocal: true, isDefinition: true)
!16 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 48, elements: !17)
!17 = !{!18}
!18 = !DISubrange(count: 6)
!19 = !DIGlobalVariableExpression(var: !20, expr: !DIExpression())
!20 = distinct !DIGlobalVariable(scope: null, file: !2, line: 50, type: !21, isLocal: true, isDefinition: true)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 32, elements: !22)
!22 = !{!23}
!23 = !DISubrange(count: 4)
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(scope: null, file: !2, line: 53, type: !26, isLocal: true, isDefinition: true)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 152, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 19)
!29 = !DIGlobalVariableExpression(var: !30, expr: !DIExpression())
!30 = distinct !DIGlobalVariable(scope: null, file: !2, line: 63, type: !26, isLocal: true, isDefinition: true)
!31 = !DIGlobalVariableExpression(var: !32, expr: !DIExpression())
!32 = distinct !DIGlobalVariable(scope: null, file: !2, line: 73, type: !33, isLocal: true, isDefinition: true)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 112, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 14)
!36 = !DIGlobalVariableExpression(var: !37, expr: !DIExpression())
!37 = distinct !DIGlobalVariable(scope: null, file: !2, line: 83, type: !38, isLocal: true, isDefinition: true)
!38 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 312, elements: !39)
!39 = !{!40}
!40 = !DISubrange(count: 39)
!41 = !DIGlobalVariableExpression(var: !42, expr: !DIExpression())
!42 = distinct !DIGlobalVariable(scope: null, file: !2, line: 94, type: !43, isLocal: true, isDefinition: true)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 328, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 41)
!46 = !DIGlobalVariableExpression(var: !47, expr: !DIExpression())
!47 = distinct !DIGlobalVariable(name: "f_tail", scope: !48, file: !79, line: 247, type: !80, isLocal: true, isDefinition: true)
!48 = distinct !DICompileUnit(language: DW_LANG_C11, file: !49, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !50, globals: !64, splitDebugInlining: false, nameTableKind: None)
!49 = !DIFile(filename: "../../../src/<stdin>", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!50 = !{!51, !52, !58, !61, !62}
!51 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !53, size: 32)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !54, line: 60, baseType: !55)
!54 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/sys/_stdint.h", directory: "")
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !56, line: 105, baseType: !57)
!56 = !DIFile(filename: "/usr/lib/arm-none-eabi/include/machine/_default_types.h", directory: "")
!57 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!58 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !59, line: 214, baseType: !60)
!59 = !DIFile(filename: "/usr/lib/gcc/arm-none-eabi/13.2.1/include/stddef.h", directory: "")
!60 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!61 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 32)
!62 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !54, line: 48, baseType: !63)
!63 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !56, line: 79, baseType: !60)
!64 = !{!46, !65, !73, !75, !77}
!65 = !DIGlobalVariableExpression(var: !66, expr: !DIExpression())
!66 = distinct !DIGlobalVariable(name: "even_nibbles", scope: !67, file: !68, line: 112, type: !72, isLocal: true, isDefinition: true)
!67 = distinct !DISubprogram(name: "transpose_16x16_nibbles", scope: !68, file: !68, line: 111, type: !69, scopeLine: 111, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!68 = !DIFile(filename: "../../../src/mayo.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!69 = !DISubroutineType(types: !70)
!70 = !{null, !52}
!71 = !{}
!72 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !53)
!73 = !DIGlobalVariableExpression(var: !74, expr: !DIExpression())
!74 = distinct !DIGlobalVariable(name: "even_bytes", scope: !67, file: !68, line: 113, type: !72, isLocal: true, isDefinition: true)
!75 = !DIGlobalVariableExpression(var: !76, expr: !DIExpression())
!76 = distinct !DIGlobalVariable(name: "even_2bytes", scope: !67, file: !68, line: 114, type: !72, isLocal: true, isDefinition: true)
!77 = !DIGlobalVariableExpression(var: !78, expr: !DIExpression())
!78 = distinct !DIGlobalVariable(name: "even_half", scope: !67, file: !68, line: 115, type: !72, isLocal: true, isDefinition: true)
!79 = !DIFile(filename: "../../../include/mayo.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!80 = !DICompositeType(tag: DW_TAG_array_type, baseType: !81, size: 32, elements: !22)
!81 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !51)
!82 = !DIGlobalVariableExpression(var: !83, expr: !DIExpression())
!83 = distinct !DIGlobalVariable(name: "pqmayo_MAYO_5_ref_uint32_t_blocker", scope: !84, file: !99, line: 126, type: !104, isLocal: false, isDefinition: true)
!84 = distinct !DICompileUnit(language: DW_LANG_C11, file: !49, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !85, globals: !96, splitDebugInlining: false, nameTableKind: None)
!85 = !{!53, !86, !87, !61, !62, !90, !91, !94}
!86 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!87 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !54, line: 56, baseType: !88)
!88 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !56, line: 103, baseType: !89)
!89 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 32)
!91 = !DIDerivedType(tag: DW_TAG_typedef, name: "int8_t", file: !54, line: 20, baseType: !92)
!92 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int8_t", file: !56, line: 41, baseType: !93)
!93 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!94 = !DIDerivedType(tag: DW_TAG_typedef, name: "int32_t", file: !54, line: 44, baseType: !95)
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int32_t", file: !56, line: 77, baseType: !86)
!96 = !{!82, !97, !101}
!97 = !DIGlobalVariableExpression(var: !98, expr: !DIExpression())
!98 = distinct !DIGlobalVariable(name: "pqmayo_MAYO_5_ref_uint64_t_blocker", scope: !84, file: !99, line: 127, type: !100, isLocal: false, isDefinition: true)
!99 = !DIFile(filename: "../../../src/arithmetic.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!100 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !53)
!101 = !DIGlobalVariableExpression(var: !102, expr: !DIExpression())
!102 = distinct !DIGlobalVariable(name: "pqmayo_MAYO_5_ref_unsigned_char_blocker", scope: !84, file: !99, line: 128, type: !103, isLocal: false, isDefinition: true)
!103 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !51)
!104 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !62)
!105 = distinct !DICompileUnit(language: DW_LANG_C11, file: !106, producer: "Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !107, splitDebugInlining: false, nameTableKind: None)
!106 = !DIFile(filename: "../<stdin>", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!107 = !{!0, !7, !12, !14, !19, !24, !29, !31, !36, !41}
!108 = !{!"Ubuntu clang version 20.1.2 (0ubuntu1~24.04.2)"}
!109 = !{i32 2, !"Debug Info Version", i32 3}
!110 = !{i32 1, !"wchar_size", i32 4}
!111 = !{i32 1, !"min_enum_size", i32 4}
!112 = !{i32 1, !"Code Model", i32 1}
!113 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 138, type: !114, scopeLine: 138, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !105)
!114 = !DISubroutineType(types: !115)
!115 = !{!86}
!116 = !DILocation(line: 27, column: 12, scope: !117, inlinedAt: !150)
!117 = distinct !DISubprogram(name: "example_mayo", scope: !2, file: !2, line: 25, type: !118, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !105, retainedNodes: !71)
!118 = !DISubroutineType(types: !119)
!119 = !{!86, !120}
!120 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !121, size: 32)
!121 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !122)
!122 = !DIDerivedType(tag: DW_TAG_typedef, name: "mayo_params_t", file: !79, line: 289, baseType: !123)
!123 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !79, line: 265, size: 736, elements: !124)
!124 = !{!125, !126, !127, !128, !129, !130, !131, !132, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147}
!125 = !DIDerivedType(tag: DW_TAG_member, name: "m", scope: !123, file: !79, line: 266, baseType: !86, size: 32)
!126 = !DIDerivedType(tag: DW_TAG_member, name: "n", scope: !123, file: !79, line: 267, baseType: !86, size: 32, offset: 32)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "o", scope: !123, file: !79, line: 268, baseType: !86, size: 32, offset: 64)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "k", scope: !123, file: !79, line: 269, baseType: !86, size: 32, offset: 96)
!129 = !DIDerivedType(tag: DW_TAG_member, name: "q", scope: !123, file: !79, line: 270, baseType: !86, size: 32, offset: 128)
!130 = !DIDerivedType(tag: DW_TAG_member, name: "f_tail", scope: !123, file: !79, line: 271, baseType: !90, size: 32, offset: 160)
!131 = !DIDerivedType(tag: DW_TAG_member, name: "m_bytes", scope: !123, file: !79, line: 272, baseType: !86, size: 32, offset: 192)
!132 = !DIDerivedType(tag: DW_TAG_member, name: "O_bytes", scope: !123, file: !79, line: 273, baseType: !86, size: 32, offset: 224)
!133 = !DIDerivedType(tag: DW_TAG_member, name: "v_bytes", scope: !123, file: !79, line: 274, baseType: !86, size: 32, offset: 256)
!134 = !DIDerivedType(tag: DW_TAG_member, name: "r_bytes", scope: !123, file: !79, line: 275, baseType: !86, size: 32, offset: 288)
!135 = !DIDerivedType(tag: DW_TAG_member, name: "R_bytes", scope: !123, file: !79, line: 276, baseType: !86, size: 32, offset: 320)
!136 = !DIDerivedType(tag: DW_TAG_member, name: "P1_bytes", scope: !123, file: !79, line: 277, baseType: !86, size: 32, offset: 352)
!137 = !DIDerivedType(tag: DW_TAG_member, name: "P2_bytes", scope: !123, file: !79, line: 278, baseType: !86, size: 32, offset: 384)
!138 = !DIDerivedType(tag: DW_TAG_member, name: "P3_bytes", scope: !123, file: !79, line: 279, baseType: !86, size: 32, offset: 416)
!139 = !DIDerivedType(tag: DW_TAG_member, name: "csk_bytes", scope: !123, file: !79, line: 280, baseType: !86, size: 32, offset: 448)
!140 = !DIDerivedType(tag: DW_TAG_member, name: "cpk_bytes", scope: !123, file: !79, line: 281, baseType: !86, size: 32, offset: 480)
!141 = !DIDerivedType(tag: DW_TAG_member, name: "sig_bytes", scope: !123, file: !79, line: 282, baseType: !86, size: 32, offset: 512)
!142 = !DIDerivedType(tag: DW_TAG_member, name: "salt_bytes", scope: !123, file: !79, line: 283, baseType: !86, size: 32, offset: 544)
!143 = !DIDerivedType(tag: DW_TAG_member, name: "sk_seed_bytes", scope: !123, file: !79, line: 284, baseType: !86, size: 32, offset: 576)
!144 = !DIDerivedType(tag: DW_TAG_member, name: "digest_bytes", scope: !123, file: !79, line: 285, baseType: !86, size: 32, offset: 608)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "pk_seed_bytes", scope: !123, file: !79, line: 286, baseType: !86, size: 32, offset: 640)
!146 = !DIDerivedType(tag: DW_TAG_member, name: "m_vec_limbs", scope: !123, file: !79, line: 287, baseType: !86, size: 32, offset: 672)
!147 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !123, file: !79, line: 288, baseType: !148, size: 32, offset: 704)
!148 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !149, size: 32)
!149 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!150 = distinct !DILocation(line: 148, column: 12, scope: !113)
!151 = !DILocalVariable(name: "p", arg: 1, scope: !117, file: !2, line: 25, type: !120)
!152 = !DILocation(line: 0, scope: !117, inlinedAt: !150)
!153 = !DILocalVariable(name: "msglen", scope: !117, file: !2, line: 27, type: !58)
!154 = !DILocalVariable(name: "smlen", scope: !117, file: !2, line: 28, type: !58)
!155 = !DILocation(line: 28, column: 12, scope: !117, inlinedAt: !150)
!156 = !DILocation(line: 30, column: 26, scope: !117, inlinedAt: !150)
!157 = !DILocalVariable(name: "pk", scope: !117, file: !2, line: 30, type: !61)
!158 = !DILocation(line: 31, column: 26, scope: !117, inlinedAt: !150)
!159 = !DILocalVariable(name: "sk", scope: !117, file: !2, line: 31, type: !61)
!160 = !DILocation(line: 33, column: 21, scope: !117, inlinedAt: !150)
!161 = !DILocalVariable(name: "epk", scope: !117, file: !2, line: 33, type: !52)
!162 = !DILocation(line: 34, column: 17, scope: !117, inlinedAt: !150)
!163 = !DILocalVariable(name: "esk", scope: !117, file: !2, line: 34, type: !164)
!164 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !165, size: 32)
!165 = !DIDerivedType(tag: DW_TAG_typedef, name: "sk_t", file: !79, line: 294, baseType: !166)
!166 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sk_t", file: !79, line: 291, size: 6843264, elements: !167)
!167 = !{!168, !172}
!168 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !166, file: !79, line: 292, baseType: !169, size: 6829632)
!169 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 6829632, elements: !170)
!170 = !{!171}
!171 = !DISubrange(count: 106713)
!172 = !DIDerivedType(tag: DW_TAG_member, name: "O", scope: !166, file: !79, line: 293, baseType: !173, size: 13632, offset: 6829632)
!173 = !DICompositeType(tag: DW_TAG_array_type, baseType: !174, size: 13632, elements: !176)
!174 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !54, line: 24, baseType: !175)
!175 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !56, line: 43, baseType: !51)
!176 = !{!177}
!177 = !DISubrange(count: 1704)
!178 = !DILocation(line: 36, column: 26, scope: !117, inlinedAt: !150)
!179 = !DILocalVariable(name: "sig", scope: !117, file: !2, line: 36, type: !61)
!180 = !DILocalVariable(name: "msg", scope: !117, file: !2, line: 38, type: !181)
!181 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 256, elements: !182)
!182 = !{!183}
!183 = !DISubrange(count: 32)
!184 = !DILocation(line: 38, column: 19, scope: !117, inlinedAt: !150)
!185 = !DILocalVariable(name: "msg2", scope: !117, file: !2, line: 39, type: !181)
!186 = !DILocation(line: 39, column: 19, scope: !117, inlinedAt: !150)
!187 = !DILocation(line: 41, column: 5, scope: !117, inlinedAt: !150)
!188 = !DILocation(line: 43, column: 5, scope: !117, inlinedAt: !150)
!189 = !DILocalVariable(name: "p", arg: 1, scope: !190, file: !68, line: 298, type: !193)
!190 = distinct !DISubprogram(name: "pqmayo_MAYO_5_ref_mayo_keypair", scope: !68, file: !68, line: 298, type: !191, scopeLine: 298, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!191 = !DISubroutineType(types: !192)
!192 = !{!86, !193, !61, !61}
!193 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !194, size: 32)
!194 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !195)
!195 = !DIDerivedType(tag: DW_TAG_typedef, name: "mayo_params_t", file: !79, line: 289, baseType: !196)
!196 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !79, line: 265, size: 736, elements: !197)
!197 = !{!198, !199, !200, !201, !202, !203, !204, !205, !206, !207, !208, !209, !210, !211, !212, !213, !214, !215, !216, !217, !218, !219, !220}
!198 = !DIDerivedType(tag: DW_TAG_member, name: "m", scope: !196, file: !79, line: 266, baseType: !86, size: 32)
!199 = !DIDerivedType(tag: DW_TAG_member, name: "n", scope: !196, file: !79, line: 267, baseType: !86, size: 32, offset: 32)
!200 = !DIDerivedType(tag: DW_TAG_member, name: "o", scope: !196, file: !79, line: 268, baseType: !86, size: 32, offset: 64)
!201 = !DIDerivedType(tag: DW_TAG_member, name: "k", scope: !196, file: !79, line: 269, baseType: !86, size: 32, offset: 96)
!202 = !DIDerivedType(tag: DW_TAG_member, name: "q", scope: !196, file: !79, line: 270, baseType: !86, size: 32, offset: 128)
!203 = !DIDerivedType(tag: DW_TAG_member, name: "f_tail", scope: !196, file: !79, line: 271, baseType: !90, size: 32, offset: 160)
!204 = !DIDerivedType(tag: DW_TAG_member, name: "m_bytes", scope: !196, file: !79, line: 272, baseType: !86, size: 32, offset: 192)
!205 = !DIDerivedType(tag: DW_TAG_member, name: "O_bytes", scope: !196, file: !79, line: 273, baseType: !86, size: 32, offset: 224)
!206 = !DIDerivedType(tag: DW_TAG_member, name: "v_bytes", scope: !196, file: !79, line: 274, baseType: !86, size: 32, offset: 256)
!207 = !DIDerivedType(tag: DW_TAG_member, name: "r_bytes", scope: !196, file: !79, line: 275, baseType: !86, size: 32, offset: 288)
!208 = !DIDerivedType(tag: DW_TAG_member, name: "R_bytes", scope: !196, file: !79, line: 276, baseType: !86, size: 32, offset: 320)
!209 = !DIDerivedType(tag: DW_TAG_member, name: "P1_bytes", scope: !196, file: !79, line: 277, baseType: !86, size: 32, offset: 352)
!210 = !DIDerivedType(tag: DW_TAG_member, name: "P2_bytes", scope: !196, file: !79, line: 278, baseType: !86, size: 32, offset: 384)
!211 = !DIDerivedType(tag: DW_TAG_member, name: "P3_bytes", scope: !196, file: !79, line: 279, baseType: !86, size: 32, offset: 416)
!212 = !DIDerivedType(tag: DW_TAG_member, name: "csk_bytes", scope: !196, file: !79, line: 280, baseType: !86, size: 32, offset: 448)
!213 = !DIDerivedType(tag: DW_TAG_member, name: "cpk_bytes", scope: !196, file: !79, line: 281, baseType: !86, size: 32, offset: 480)
!214 = !DIDerivedType(tag: DW_TAG_member, name: "sig_bytes", scope: !196, file: !79, line: 282, baseType: !86, size: 32, offset: 512)
!215 = !DIDerivedType(tag: DW_TAG_member, name: "salt_bytes", scope: !196, file: !79, line: 283, baseType: !86, size: 32, offset: 544)
!216 = !DIDerivedType(tag: DW_TAG_member, name: "sk_seed_bytes", scope: !196, file: !79, line: 284, baseType: !86, size: 32, offset: 576)
!217 = !DIDerivedType(tag: DW_TAG_member, name: "digest_bytes", scope: !196, file: !79, line: 285, baseType: !86, size: 32, offset: 608)
!218 = !DIDerivedType(tag: DW_TAG_member, name: "pk_seed_bytes", scope: !196, file: !79, line: 286, baseType: !86, size: 32, offset: 640)
!219 = !DIDerivedType(tag: DW_TAG_member, name: "m_vec_limbs", scope: !196, file: !79, line: 287, baseType: !86, size: 32, offset: 672)
!220 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !196, file: !79, line: 288, baseType: !148, size: 32, offset: 704)
!221 = !DILocation(line: 0, scope: !190, inlinedAt: !222)
!222 = distinct !DILocation(line: 44, column: 15, scope: !117, inlinedAt: !150)
!223 = !DILocalVariable(name: "pk", arg: 2, scope: !190, file: !68, line: 298, type: !61)
!224 = !DILocalVariable(name: "sk", arg: 3, scope: !190, file: !68, line: 298, type: !61)
!225 = !DILocalVariable(name: "ret", scope: !190, file: !68, line: 299, type: !86)
!226 = !DILocation(line: 301, column: 11, scope: !190, inlinedAt: !222)
!227 = !DILabel(scope: !190, name: "err", file: !68, line: 306)
!228 = !DILocation(line: 306, column: 1, scope: !190, inlinedAt: !222)
!229 = !DILocalVariable(name: "res", scope: !117, file: !2, line: 44, type: !86)
!230 = !DILocation(line: 45, column: 13, scope: !231, inlinedAt: !150)
!231 = distinct !DILexicalBlock(scope: !117, file: !2, line: 45, column: 9)
!232 = !DILocation(line: 46, column: 9, scope: !233, inlinedAt: !150)
!233 = distinct !DILexicalBlock(scope: !231, file: !2, line: 45, column: 25)
!234 = !DILocation(line: 48, column: 9, scope: !233, inlinedAt: !150)
!235 = !DILocation(line: 50, column: 9, scope: !236, inlinedAt: !150)
!236 = distinct !DILexicalBlock(scope: !231, file: !2, line: 49, column: 12)
!237 = !DILocation(line: 53, column: 5, scope: !117, inlinedAt: !150)
!238 = !DILocation(line: 54, column: 11, scope: !117, inlinedAt: !150)
!239 = !DILocation(line: 55, column: 13, scope: !240, inlinedAt: !150)
!240 = distinct !DILexicalBlock(scope: !117, file: !2, line: 55, column: 9)
!241 = !DILocation(line: 56, column: 9, scope: !242, inlinedAt: !150)
!242 = distinct !DILexicalBlock(scope: !240, file: !2, line: 55, column: 25)
!243 = !DILocation(line: 58, column: 9, scope: !242, inlinedAt: !150)
!244 = !DILocation(line: 60, column: 9, scope: !245, inlinedAt: !150)
!245 = distinct !DILexicalBlock(scope: !240, file: !2, line: 59, column: 12)
!246 = !DILocation(line: 63, column: 5, scope: !117, inlinedAt: !150)
!247 = !DILocalVariable(name: "p", arg: 1, scope: !248, file: !68, line: 608, type: !193)
!248 = distinct !DISubprogram(name: "pqmayo_MAYO_5_ref_mayo_expand_pk", scope: !68, file: !68, line: 608, type: !249, scopeLine: 609, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!249 = !DISubroutineType(types: !250)
!250 = !{!86, !193, !90, !52}
!251 = !DILocation(line: 0, scope: !248, inlinedAt: !252)
!252 = distinct !DILocation(line: 64, column: 11, scope: !117, inlinedAt: !150)
!253 = !DILocalVariable(name: "cpk", arg: 2, scope: !248, file: !68, line: 608, type: !90)
!254 = !DILocalVariable(name: "pk", arg: 3, scope: !248, file: !68, line: 609, type: !52)
!255 = !DILocalVariable(name: "p", arg: 1, scope: !256, file: !68, line: 280, type: !193)
!256 = distinct !DISubprogram(name: "expand_P1_P2", scope: !68, file: !68, line: 280, type: !257, scopeLine: 280, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!257 = !DISubroutineType(types: !258)
!258 = !{null, !193, !52, !90}
!259 = !DILocation(line: 0, scope: !256, inlinedAt: !260)
!260 = distinct !DILocation(line: 610, column: 5, scope: !248, inlinedAt: !252)
!261 = !DILocalVariable(name: "P", arg: 2, scope: !256, file: !68, line: 280, type: !52)
!262 = !DILocalVariable(name: "seed_pk", arg: 3, scope: !256, file: !68, line: 280, type: !90)
!263 = !DILocation(line: 284, column: 5, scope: !256, inlinedAt: !260)
!264 = !DILocation(line: 265, column: 14, scope: !265, inlinedAt: !268)
!265 = distinct !DISubprogram(name: "unpack_m_vecs", scope: !68, file: !68, line: 262, type: !266, scopeLine: 262, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!266 = !DISubroutineType(types: !267)
!267 = !{null, !90, !52, !86, !86}
!268 = distinct !DILocation(line: 285, column: 5, scope: !256, inlinedAt: !260)
!269 = !DILocalVariable(name: "in", arg: 1, scope: !265, file: !68, line: 262, type: !90)
!270 = !DILocation(line: 0, scope: !265, inlinedAt: !268)
!271 = !DILocalVariable(name: "out", arg: 2, scope: !265, file: !68, line: 262, type: !52)
!272 = !DILocalVariable(name: "vecs", arg: 3, scope: !265, file: !68, line: 262, type: !86)
!273 = !DILocalVariable(name: "m", arg: 4, scope: !265, file: !68, line: 262, type: !86)
!274 = !DILocalVariable(name: "m_vec_limbs", scope: !265, file: !68, line: 263, type: !275)
!275 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !86)
!276 = !DILocalVariable(name: "_out", scope: !265, file: !68, line: 264, type: !61)
!277 = !DILocalVariable(name: "tmp", scope: !265, file: !68, line: 265, type: !278)
!278 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 576, elements: !279)
!279 = !{!280}
!280 = !DISubrange(count: 9)
!281 = !DILocalVariable(name: "i", scope: !282, file: !68, line: 266, type: !86)
!282 = distinct !DILexicalBlock(scope: !265, file: !68, line: 266, column: 5)
!283 = !DILocation(line: 0, scope: !282, inlinedAt: !268)
!284 = !DILocation(line: 266, column: 10, scope: !282, inlinedAt: !268)
!285 = !DILocation(line: 266, column: 28, scope: !286, inlinedAt: !268)
!286 = distinct !DILexicalBlock(scope: !282, file: !68, line: 266, column: 5)
!287 = !DILocation(line: 266, column: 5, scope: !282, inlinedAt: !268)
!288 = !DILocation(line: 266, scope: !282, inlinedAt: !268)
!289 = !DILocation(line: 268, column: 27, scope: !290, inlinedAt: !268)
!290 = distinct !DILexicalBlock(scope: !286, file: !68, line: 267, column: 5)
!291 = !DILocation(line: 268, column: 29, scope: !290, inlinedAt: !268)
!292 = !DILocation(line: 268, column: 24, scope: !290, inlinedAt: !268)
!293 = !DILocation(line: 268, column: 9, scope: !290, inlinedAt: !268)
!294 = !DILocation(line: 269, column: 36, scope: !290, inlinedAt: !268)
!295 = !DILocation(line: 269, column: 21, scope: !290, inlinedAt: !268)
!296 = !DILocation(line: 269, column: 9, scope: !290, inlinedAt: !268)
!297 = !DILocation(line: 266, column: 5, scope: !286, inlinedAt: !268)
!298 = distinct !{!298, !287, !299, !300}
!299 = !DILocation(line: 270, column: 5, scope: !282, inlinedAt: !268)
!300 = !{!"llvm.loop.mustprogress"}
!301 = !DILocation(line: 271, column: 1, scope: !265, inlinedAt: !268)
!302 = !DILocation(line: 612, column: 23, scope: !248, inlinedAt: !252)
!303 = !DILocation(line: 612, column: 72, scope: !248, inlinedAt: !252)
!304 = !DILocation(line: 265, column: 14, scope: !265, inlinedAt: !305)
!305 = distinct !DILocation(line: 612, column: 5, scope: !248, inlinedAt: !252)
!306 = !DILocation(line: 0, scope: !265, inlinedAt: !305)
!307 = !DILocation(line: 0, scope: !282, inlinedAt: !305)
!308 = !DILocation(line: 266, column: 10, scope: !282, inlinedAt: !305)
!309 = !DILocation(line: 266, column: 28, scope: !286, inlinedAt: !305)
!310 = !DILocation(line: 266, column: 5, scope: !282, inlinedAt: !305)
!311 = !DILocation(line: 266, scope: !282, inlinedAt: !305)
!312 = !DILocation(line: 268, column: 27, scope: !290, inlinedAt: !305)
!313 = !DILocation(line: 268, column: 29, scope: !290, inlinedAt: !305)
!314 = !DILocation(line: 268, column: 24, scope: !290, inlinedAt: !305)
!315 = !DILocation(line: 268, column: 9, scope: !290, inlinedAt: !305)
!316 = !DILocation(line: 269, column: 36, scope: !290, inlinedAt: !305)
!317 = !DILocation(line: 269, column: 21, scope: !290, inlinedAt: !305)
!318 = !DILocation(line: 269, column: 9, scope: !290, inlinedAt: !305)
!319 = !DILocation(line: 266, column: 5, scope: !286, inlinedAt: !305)
!320 = distinct !{!320, !310, !321, !300}
!321 = !DILocation(line: 270, column: 5, scope: !282, inlinedAt: !305)
!322 = !DILocation(line: 271, column: 1, scope: !265, inlinedAt: !305)
!323 = !DILocation(line: 70, column: 9, scope: !324, inlinedAt: !150)
!324 = distinct !DILexicalBlock(scope: !325, file: !2, line: 69, column: 12)
!325 = distinct !DILexicalBlock(scope: !117, file: !2, line: 65, column: 9)
!326 = !DILocation(line: 73, column: 5, scope: !117, inlinedAt: !150)
!327 = !DILocation(line: 74, column: 11, scope: !117, inlinedAt: !150)
!328 = !DILocation(line: 75, column: 13, scope: !329, inlinedAt: !150)
!329 = distinct !DILexicalBlock(scope: !117, file: !2, line: 75, column: 9)
!330 = !DILocation(line: 76, column: 9, scope: !331, inlinedAt: !150)
!331 = distinct !DILexicalBlock(scope: !329, file: !2, line: 75, column: 25)
!332 = !DILocation(line: 78, column: 9, scope: !331, inlinedAt: !150)
!333 = !DILocation(line: 80, column: 9, scope: !334, inlinedAt: !150)
!334 = distinct !DILexicalBlock(scope: !329, file: !2, line: 79, column: 12)
!335 = !DILocation(line: 83, column: 5, scope: !117, inlinedAt: !150)
!336 = !DILocation(line: 84, column: 44, scope: !117, inlinedAt: !150)
!337 = !DILocalVariable(name: "p", arg: 1, scope: !338, file: !68, line: 520, type: !193)
!338 = distinct !DISubprogram(name: "pqmayo_MAYO_5_ref_mayo_open", scope: !68, file: !68, line: 520, type: !339, scopeLine: 522, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!339 = !DISubroutineType(types: !340)
!340 = !{!86, !193, !61, !341, !90, !58, !90}
!341 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 32)
!342 = !DILocation(line: 0, scope: !338, inlinedAt: !343)
!343 = distinct !DILocation(line: 84, column: 11, scope: !117, inlinedAt: !150)
!344 = !DILocalVariable(name: "m", arg: 2, scope: !338, file: !68, line: 520, type: !61)
!345 = !DILocalVariable(name: "mlen", arg: 3, scope: !338, file: !68, line: 521, type: !341)
!346 = !DILocalVariable(name: "sm", arg: 4, scope: !338, file: !68, line: 521, type: !90)
!347 = !DILocalVariable(name: "smlen", arg: 5, scope: !338, file: !68, line: 522, type: !58)
!348 = !DILocalVariable(name: "pk", arg: 6, scope: !338, file: !68, line: 522, type: !90)
!349 = !DILocalVariable(name: "param_sig_bytes", scope: !338, file: !68, line: 523, type: !275)
!350 = !DILocation(line: 524, column: 15, scope: !351, inlinedAt: !343)
!351 = distinct !DILexicalBlock(scope: !338, file: !68, line: 524, column: 9)
!352 = !DILocation(line: 527, column: 36, scope: !338, inlinedAt: !343)
!353 = !DILocation(line: 527, column: 61, scope: !338, inlinedAt: !343)
!354 = !DILocation(line: 527, column: 18, scope: !338, inlinedAt: !343)
!355 = !DILocalVariable(name: "result", scope: !338, file: !68, line: 527, type: !86)
!356 = !DILocation(line: 530, column: 16, scope: !357, inlinedAt: !343)
!357 = distinct !DILexicalBlock(scope: !338, file: !68, line: 530, column: 9)
!358 = !DILocation(line: 531, column: 23, scope: !359, inlinedAt: !343)
!359 = distinct !DILexicalBlock(scope: !357, file: !68, line: 530, column: 28)
!360 = !DILocation(line: 532, column: 23, scope: !359, inlinedAt: !343)
!361 = !DILocation(line: 532, column: 9, scope: !359, inlinedAt: !343)
!362 = !DILocation(line: 533, column: 5, scope: !359, inlinedAt: !343)
!363 = !DILocation(line: 85, column: 24, scope: !364, inlinedAt: !150)
!364 = distinct !DILexicalBlock(scope: !117, file: !2, line: 85, column: 9)
!365 = !DILocation(line: 85, column: 27, scope: !364, inlinedAt: !150)
!366 = !DILocation(line: 86, column: 9, scope: !367, inlinedAt: !150)
!367 = distinct !DILexicalBlock(scope: !364, file: !2, line: 85, column: 54)
!368 = !DILocation(line: 88, column: 9, scope: !367, inlinedAt: !150)
!369 = !DILocation(line: 91, column: 9, scope: !370, inlinedAt: !150)
!370 = distinct !DILexicalBlock(scope: !364, file: !2, line: 89, column: 12)
!371 = !DILocation(line: 94, column: 5, scope: !117, inlinedAt: !150)
!372 = !DILocation(line: 95, column: 11, scope: !117, inlinedAt: !150)
!373 = !DILocation(line: 96, column: 13, scope: !374, inlinedAt: !150)
!374 = distinct !DILexicalBlock(scope: !117, file: !2, line: 96, column: 9)
!375 = !DILocation(line: 97, column: 9, scope: !376, inlinedAt: !150)
!376 = distinct !DILexicalBlock(scope: !374, file: !2, line: 96, column: 25)
!377 = !DILocation(line: 99, column: 9, scope: !376, inlinedAt: !150)
!378 = !DILocation(line: 102, column: 9, scope: !379, inlinedAt: !150)
!379 = distinct !DILexicalBlock(scope: !374, file: !2, line: 100, column: 12)
!380 = !DILocation(line: 96, column: 16, scope: !374, inlinedAt: !150)
!381 = !DILabel(scope: !117, name: "err", file: !2, line: 129)
!382 = !DILocation(line: 129, column: 1, scope: !117, inlinedAt: !150)
!383 = !DILocation(line: 130, column: 5, scope: !117, inlinedAt: !150)
!384 = !DILocation(line: 131, column: 5, scope: !117, inlinedAt: !150)
!385 = !DILocation(line: 132, column: 5, scope: !117, inlinedAt: !150)
!386 = !DILocation(line: 133, column: 5, scope: !117, inlinedAt: !150)
!387 = !DILocation(line: 134, column: 5, scope: !117, inlinedAt: !150)
!388 = !DILocation(line: 135, column: 5, scope: !117, inlinedAt: !150)
!389 = !DILocation(line: 148, column: 5, scope: !113)
!390 = !DILocation(line: 0, scope: !190)
!391 = !DILocation(line: 301, column: 11, scope: !190)
!392 = !DILocation(line: 306, column: 1, scope: !190)
!393 = !DILocation(line: 307, column: 5, scope: !190)
!394 = distinct !DISubprogram(name: "pqmayo_MAYO_5_ref_mayo_keypair_compact", scope: !68, file: !68, line: 538, type: !191, scopeLine: 539, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!395 = !DILocalVariable(name: "p", arg: 1, scope: !394, file: !68, line: 538, type: !193)
!396 = !DILocation(line: 0, scope: !394)
!397 = !DILocalVariable(name: "cpk", arg: 2, scope: !394, file: !68, line: 538, type: !61)
!398 = !DILocalVariable(name: "csk", arg: 3, scope: !394, file: !68, line: 539, type: !61)
!399 = !DILocalVariable(name: "ret", scope: !394, file: !68, line: 540, type: !86)
!400 = !DILocalVariable(name: "seed_sk", scope: !394, file: !68, line: 541, type: !61)
!401 = !DILocalVariable(name: "S", scope: !394, file: !68, line: 542, type: !402)
!402 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 6944, elements: !403)
!403 = !{!404}
!404 = !DISubrange(count: 868)
!405 = !DILocation(line: 542, column: 19, scope: !394)
!406 = !DILocalVariable(name: "P", scope: !394, file: !68, line: 543, type: !169)
!407 = !DILocation(line: 543, column: 14, scope: !394)
!408 = !DILocalVariable(name: "P3", scope: !394, file: !68, line: 544, type: !409)
!409 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 82944, elements: !410)
!410 = !{!411}
!411 = !DISubrange(count: 1296)
!412 = !DILocation(line: 544, column: 14, scope: !394)
!413 = !DILocalVariable(name: "O", scope: !394, file: !68, line: 547, type: !414)
!414 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 13632, elements: !176)
!415 = !DILocation(line: 547, column: 19, scope: !394)
!416 = !DILocalVariable(name: "m_vec_limbs", scope: !394, file: !68, line: 549, type: !275)
!417 = !DILocalVariable(name: "param_m", scope: !394, file: !68, line: 550, type: !275)
!418 = !DILocalVariable(name: "param_v", scope: !394, file: !68, line: 551, type: !275)
!419 = !DILocalVariable(name: "param_o", scope: !394, file: !68, line: 552, type: !275)
!420 = !DILocalVariable(name: "param_O_bytes", scope: !394, file: !68, line: 553, type: !275)
!421 = !DILocalVariable(name: "param_P1_limbs", scope: !394, file: !68, line: 554, type: !275)
!422 = !DILocalVariable(name: "param_P3_limbs", scope: !394, file: !68, line: 555, type: !275)
!423 = !DILocalVariable(name: "param_pk_seed_bytes", scope: !394, file: !68, line: 556, type: !275)
!424 = !DILocalVariable(name: "param_sk_seed_bytes", scope: !394, file: !68, line: 557, type: !275)
!425 = !DILocalVariable(name: "P1", scope: !394, file: !68, line: 559, type: !52)
!426 = !DILocation(line: 560, column: 22, scope: !394)
!427 = !DILocalVariable(name: "P2", scope: !394, file: !68, line: 560, type: !52)
!428 = !DILocation(line: 566, column: 9, scope: !429)
!429 = distinct !DILexicalBlock(scope: !394, file: !68, line: 566, column: 9)
!430 = !DILocation(line: 566, column: 51, scope: !429)
!431 = !DILocation(line: 573, column: 5, scope: !394)
!432 = !DILocalVariable(name: "seed_pk", scope: !394, file: !68, line: 546, type: !61)
!433 = !DILocation(line: 579, column: 14, scope: !394)
!434 = !DILocalVariable(name: "m", arg: 1, scope: !435, file: !68, line: 20, type: !90)
!435 = distinct !DISubprogram(name: "decode", scope: !68, file: !68, line: 20, type: !436, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!436 = !DISubroutineType(types: !437)
!437 = !{null, !90, !61, !86}
!438 = !DILocation(line: 0, scope: !435, inlinedAt: !439)
!439 = distinct !DILocation(line: 579, column: 5, scope: !394)
!440 = !DILocalVariable(name: "mdec", arg: 2, scope: !435, file: !68, line: 20, type: !61)
!441 = !DILocalVariable(name: "mdeclen", arg: 3, scope: !435, file: !68, line: 20, type: !86)
!442 = !DILocalVariable(name: "i", scope: !435, file: !68, line: 21, type: !86)
!443 = !DILocation(line: 22, column: 10, scope: !444, inlinedAt: !439)
!444 = distinct !DILexicalBlock(scope: !435, file: !68, line: 22, column: 5)
!445 = !DILocation(line: 22, scope: !444, inlinedAt: !439)
!446 = !DILocation(line: 22, column: 19, scope: !447, inlinedAt: !439)
!447 = distinct !DILexicalBlock(scope: !444, file: !68, line: 22, column: 5)
!448 = !DILocation(line: 22, column: 5, scope: !444, inlinedAt: !439)
!449 = !DILocation(line: 23, column: 19, scope: !450, inlinedAt: !439)
!450 = distinct !DILexicalBlock(scope: !447, file: !68, line: 22, column: 39)
!451 = !DILocation(line: 23, column: 24, scope: !450, inlinedAt: !439)
!452 = !DILocation(line: 23, column: 14, scope: !450, inlinedAt: !439)
!453 = !DILocation(line: 23, column: 17, scope: !450, inlinedAt: !439)
!454 = !DILocation(line: 24, column: 24, scope: !450, inlinedAt: !439)
!455 = !DILocation(line: 24, column: 17, scope: !450, inlinedAt: !439)
!456 = !DILocation(line: 24, column: 14, scope: !450, inlinedAt: !439)
!457 = !DILocation(line: 22, column: 34, scope: !447, inlinedAt: !439)
!458 = !DILocation(line: 22, column: 5, scope: !447, inlinedAt: !439)
!459 = distinct !{!459, !448, !460, !300}
!460 = !DILocation(line: 25, column: 5, scope: !444, inlinedAt: !439)
!461 = !DILocation(line: 0, scope: !256, inlinedAt: !462)
!462 = distinct !DILocation(line: 585, column: 5, scope: !394)
!463 = !DILocation(line: 284, column: 5, scope: !256, inlinedAt: !462)
!464 = !DILocation(line: 265, column: 14, scope: !265, inlinedAt: !465)
!465 = distinct !DILocation(line: 285, column: 5, scope: !256, inlinedAt: !462)
!466 = !DILocation(line: 0, scope: !265, inlinedAt: !465)
!467 = !DILocation(line: 0, scope: !282, inlinedAt: !465)
!468 = !DILocation(line: 266, column: 10, scope: !282, inlinedAt: !465)
!469 = !DILocation(line: 266, column: 28, scope: !286, inlinedAt: !465)
!470 = !DILocation(line: 266, column: 5, scope: !282, inlinedAt: !465)
!471 = !DILocation(line: 266, scope: !282, inlinedAt: !465)
!472 = !DILocation(line: 268, column: 27, scope: !290, inlinedAt: !465)
!473 = !DILocation(line: 268, column: 29, scope: !290, inlinedAt: !465)
!474 = !DILocation(line: 268, column: 24, scope: !290, inlinedAt: !465)
!475 = !DILocation(line: 268, column: 9, scope: !290, inlinedAt: !465)
!476 = !DILocation(line: 269, column: 36, scope: !290, inlinedAt: !465)
!477 = !DILocation(line: 269, column: 21, scope: !290, inlinedAt: !465)
!478 = !DILocation(line: 269, column: 9, scope: !290, inlinedAt: !465)
!479 = !DILocation(line: 266, column: 5, scope: !286, inlinedAt: !465)
!480 = distinct !{!480, !470, !481, !300}
!481 = !DILocation(line: 270, column: 5, scope: !282, inlinedAt: !465)
!482 = !DILocation(line: 271, column: 1, scope: !265, inlinedAt: !465)
!483 = !DILocalVariable(name: "p", arg: 1, scope: !484, file: !485, line: 260, type: !193)
!484 = distinct !DISubprogram(name: "compute_P3", scope: !485, file: !485, line: 260, type: !486, scopeLine: 260, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!485 = !DIFile(filename: "../../../src/generic/generic_arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!486 = !DISubroutineType(types: !487)
!487 = !{null, !193, !488, !52, !90, !52}
!488 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 32)
!489 = !DILocation(line: 0, scope: !484, inlinedAt: !490)
!490 = distinct !DILocation(line: 588, column: 5, scope: !394)
!491 = !DILocalVariable(name: "P1", arg: 2, scope: !484, file: !485, line: 260, type: !488)
!492 = !DILocalVariable(name: "P2", arg: 3, scope: !484, file: !485, line: 260, type: !52)
!493 = !DILocalVariable(name: "O", arg: 4, scope: !484, file: !485, line: 260, type: !90)
!494 = !DILocalVariable(name: "P3", arg: 5, scope: !484, file: !485, line: 260, type: !52)
!495 = !DILocalVariable(name: "m_vec_limbs", scope: !484, file: !485, line: 262, type: !275)
!496 = !DILocalVariable(name: "param_v", scope: !484, file: !485, line: 263, type: !275)
!497 = !DILocalVariable(name: "param_o", scope: !484, file: !485, line: 264, type: !275)
!498 = !DILocalVariable(name: "p", arg: 1, scope: !499, file: !485, line: 74, type: !193)
!499 = distinct !DISubprogram(name: "P1_times_O", scope: !485, file: !485, line: 74, type: !500, scopeLine: 74, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!500 = !DISubroutineType(types: !501)
!501 = !{null, !193, !488, !90, !52}
!502 = !DILocation(line: 0, scope: !499, inlinedAt: !503)
!503 = distinct !DILocation(line: 267, column: 5, scope: !484, inlinedAt: !490)
!504 = !DILocalVariable(name: "P1", arg: 2, scope: !499, file: !485, line: 74, type: !488)
!505 = !DILocalVariable(name: "O", arg: 3, scope: !499, file: !485, line: 74, type: !90)
!506 = !DILocalVariable(name: "acc", arg: 4, scope: !499, file: !485, line: 74, type: !52)
!507 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !508, file: !485, line: 16, type: !275)
!508 = distinct !DISubprogram(name: "mul_add_m_upper_triangular_mat_x_mat", scope: !485, file: !485, line: 16, type: !509, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!509 = !DISubroutineType(types: !510)
!510 = !{null, !275, !488, !90, !52, !275, !275, !275, !275}
!511 = !DILocation(line: 0, scope: !508, inlinedAt: !512)
!512 = distinct !DILocation(line: 78, column: 5, scope: !499, inlinedAt: !503)
!513 = !DILocalVariable(name: "bs_mat", arg: 2, scope: !508, file: !485, line: 16, type: !488)
!514 = !DILocalVariable(name: "mat", arg: 3, scope: !508, file: !485, line: 16, type: !90)
!515 = !DILocalVariable(name: "acc", arg: 4, scope: !508, file: !485, line: 16, type: !52)
!516 = !DILocalVariable(name: "bs_mat_rows", arg: 5, scope: !508, file: !485, line: 17, type: !275)
!517 = !DILocalVariable(name: "bs_mat_cols", arg: 6, scope: !508, file: !485, line: 17, type: !275)
!518 = !DILocalVariable(name: "mat_cols", arg: 7, scope: !508, file: !485, line: 17, type: !275)
!519 = !DILocalVariable(name: "triangular", arg: 8, scope: !508, file: !485, line: 17, type: !275)
!520 = !DILocalVariable(name: "bs_mat_entries_used", scope: !508, file: !485, line: 19, type: !86)
!521 = !DILocalVariable(name: "r", scope: !522, file: !485, line: 20, type: !86)
!522 = distinct !DILexicalBlock(scope: !508, file: !485, line: 20, column: 5)
!523 = !DILocation(line: 0, scope: !522, inlinedAt: !512)
!524 = !DILocation(line: 20, column: 10, scope: !522, inlinedAt: !512)
!525 = !DILocation(line: 19, column: 9, scope: !508, inlinedAt: !512)
!526 = !DILocation(line: 20, scope: !522, inlinedAt: !512)
!527 = !DILocation(line: 20, column: 23, scope: !528, inlinedAt: !512)
!528 = distinct !DILexicalBlock(scope: !522, file: !485, line: 20, column: 5)
!529 = !DILocation(line: 20, column: 5, scope: !522, inlinedAt: !512)
!530 = !DILocation(line: 21, column: 9, scope: !531, inlinedAt: !512)
!531 = distinct !DILexicalBlock(scope: !532, file: !485, line: 21, column: 9)
!532 = distinct !DILexicalBlock(scope: !528, file: !485, line: 20, column: 43)
!533 = !DILocation(line: 50, column: 5, scope: !534, inlinedAt: !538)
!534 = distinct !DILexicalBlock(scope: !535, file: !485, line: 50, column: 5)
!535 = distinct !DISubprogram(name: "mul_add_mat_trans_x_m_mat", scope: !485, file: !485, line: 47, type: !536, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!536 = !DISubroutineType(types: !537)
!537 = !{null, !275, !90, !488, !52, !275, !275, !275}
!538 = distinct !DILocation(line: 270, column: 5, scope: !484, inlinedAt: !490)
!539 = !DILocation(line: 21, scope: !531, inlinedAt: !512)
!540 = !DILocalVariable(name: "c", scope: !531, file: !485, line: 21, type: !86)
!541 = !DILocation(line: 0, scope: !531, inlinedAt: !512)
!542 = !DILocation(line: 21, column: 40, scope: !543, inlinedAt: !512)
!543 = distinct !DILexicalBlock(scope: !531, file: !485, line: 21, column: 9)
!544 = !DILocation(line: 22, column: 13, scope: !545, inlinedAt: !512)
!545 = distinct !DILexicalBlock(scope: !546, file: !485, line: 22, column: 13)
!546 = distinct !DILexicalBlock(scope: !543, file: !485, line: 21, column: 60)
!547 = !DILocation(line: 22, scope: !545, inlinedAt: !512)
!548 = !DILocalVariable(name: "k", scope: !545, file: !485, line: 22, type: !86)
!549 = !DILocation(line: 0, scope: !545, inlinedAt: !512)
!550 = !DILocation(line: 22, column: 31, scope: !551, inlinedAt: !512)
!551 = distinct !DILexicalBlock(scope: !545, file: !485, line: 22, column: 13)
!552 = !DILocation(line: 23, column: 51, scope: !553, inlinedAt: !512)
!553 = distinct !DILexicalBlock(scope: !551, file: !485, line: 22, column: 51)
!554 = !DILocation(line: 23, column: 94, scope: !553, inlinedAt: !512)
!555 = !DILocation(line: 23, column: 88, scope: !553, inlinedAt: !512)
!556 = !DILocation(line: 23, column: 134, scope: !553, inlinedAt: !512)
!557 = !DILocation(line: 23, column: 145, scope: !553, inlinedAt: !512)
!558 = !DILocation(line: 23, column: 115, scope: !553, inlinedAt: !512)
!559 = !DILocation(line: 23, column: 17, scope: !553, inlinedAt: !512)
!560 = !DILocation(line: 22, column: 45, scope: !551, inlinedAt: !512)
!561 = !DILocation(line: 22, column: 13, scope: !551, inlinedAt: !512)
!562 = distinct !{!562, !544, !563, !300}
!563 = !DILocation(line: 24, column: 13, scope: !545, inlinedAt: !512)
!564 = !DILocation(line: 25, column: 33, scope: !546, inlinedAt: !512)
!565 = !DILocation(line: 21, column: 56, scope: !543, inlinedAt: !512)
!566 = !DILocation(line: 21, column: 9, scope: !543, inlinedAt: !512)
!567 = distinct !{!567, !530, !568, !300}
!568 = !DILocation(line: 26, column: 9, scope: !531, inlinedAt: !512)
!569 = !DILocation(line: 20, column: 39, scope: !528, inlinedAt: !512)
!570 = !DILocation(line: 20, column: 5, scope: !528, inlinedAt: !512)
!571 = distinct !{!571, !529, !572, !300}
!572 = !DILocation(line: 27, column: 5, scope: !522, inlinedAt: !512)
!573 = !DILocation(line: 50, scope: !534, inlinedAt: !538)
!574 = !DILocalVariable(name: "r", scope: !534, file: !485, line: 50, type: !86)
!575 = !DILocation(line: 0, scope: !534, inlinedAt: !538)
!576 = !DILocation(line: 50, column: 23, scope: !577, inlinedAt: !538)
!577 = distinct !DILexicalBlock(scope: !534, file: !485, line: 50, column: 5)
!578 = !DILocation(line: 51, column: 9, scope: !579, inlinedAt: !538)
!579 = distinct !DILexicalBlock(scope: !580, file: !485, line: 51, column: 9)
!580 = distinct !DILexicalBlock(scope: !577, file: !485, line: 50, column: 40)
!581 = !DILocation(line: 51, scope: !579, inlinedAt: !538)
!582 = !DILocalVariable(name: "c", scope: !579, file: !485, line: 51, type: !86)
!583 = !DILocation(line: 0, scope: !579, inlinedAt: !538)
!584 = !DILocation(line: 51, column: 27, scope: !585, inlinedAt: !538)
!585 = distinct !DILexicalBlock(scope: !579, file: !485, line: 51, column: 9)
!586 = !DILocation(line: 52, column: 13, scope: !587, inlinedAt: !538)
!587 = distinct !DILexicalBlock(scope: !588, file: !485, line: 52, column: 13)
!588 = distinct !DILexicalBlock(scope: !585, file: !485, line: 51, column: 44)
!589 = !DILocation(line: 52, scope: !587, inlinedAt: !538)
!590 = !DILocalVariable(name: "k", scope: !587, file: !485, line: 52, type: !86)
!591 = !DILocation(line: 0, scope: !587, inlinedAt: !538)
!592 = !DILocation(line: 52, column: 31, scope: !593, inlinedAt: !538)
!593 = distinct !DILexicalBlock(scope: !587, file: !485, line: 52, column: 13)
!594 = !DILocation(line: 53, column: 70, scope: !595, inlinedAt: !538)
!595 = distinct !DILexicalBlock(scope: !593, file: !485, line: 52, column: 54)
!596 = !DILocation(line: 53, column: 84, scope: !595, inlinedAt: !538)
!597 = !DILocation(line: 53, column: 51, scope: !595, inlinedAt: !538)
!598 = !DILocation(line: 53, column: 96, scope: !595, inlinedAt: !538)
!599 = !DILocation(line: 53, column: 90, scope: !595, inlinedAt: !538)
!600 = !DILocation(line: 53, column: 136, scope: !595, inlinedAt: !538)
!601 = !DILocation(line: 53, column: 150, scope: !595, inlinedAt: !538)
!602 = !DILocation(line: 53, column: 117, scope: !595, inlinedAt: !538)
!603 = !DILocation(line: 53, column: 17, scope: !595, inlinedAt: !538)
!604 = !DILocation(line: 52, column: 48, scope: !593, inlinedAt: !538)
!605 = !DILocation(line: 52, column: 13, scope: !593, inlinedAt: !538)
!606 = distinct !{!606, !586, !607, !300}
!607 = !DILocation(line: 54, column: 13, scope: !587, inlinedAt: !538)
!608 = !DILocation(line: 51, column: 40, scope: !585, inlinedAt: !538)
!609 = !DILocation(line: 51, column: 9, scope: !585, inlinedAt: !538)
!610 = distinct !{!610, !578, !611, !300}
!611 = !DILocation(line: 55, column: 9, scope: !579, inlinedAt: !538)
!612 = !DILocation(line: 50, column: 36, scope: !577, inlinedAt: !538)
!613 = !DILocation(line: 50, column: 5, scope: !577, inlinedAt: !538)
!614 = distinct !{!614, !533, !615, !300}
!615 = !DILocation(line: 56, column: 5, scope: !534, inlinedAt: !538)
!616 = !DILocation(line: 591, column: 5, scope: !394)
!617 = !DILocalVariable(name: "P3_upper", scope: !394, file: !68, line: 593, type: !618)
!618 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 44928, elements: !619)
!619 = !{!620}
!620 = !DISubrange(count: 702)
!621 = !DILocation(line: 593, column: 14, scope: !394)
!622 = !DILocation(line: 596, column: 5, scope: !394)
!623 = !DILocation(line: 597, column: 31, scope: !394)
!624 = !DILocalVariable(name: "in", arg: 1, scope: !625, file: !68, line: 272, type: !488)
!625 = distinct !DISubprogram(name: "pack_m_vecs", scope: !68, file: !68, line: 272, type: !626, scopeLine: 272, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!626 = !DISubroutineType(types: !627)
!627 = !{null, !488, !61, !86, !86}
!628 = !DILocation(line: 0, scope: !625, inlinedAt: !629)
!629 = distinct !DILocation(line: 597, column: 5, scope: !394)
!630 = !DILocalVariable(name: "out", arg: 2, scope: !625, file: !68, line: 272, type: !61)
!631 = !DILocalVariable(name: "vecs", arg: 3, scope: !625, file: !68, line: 272, type: !86)
!632 = !DILocalVariable(name: "m", arg: 4, scope: !625, file: !68, line: 272, type: !86)
!633 = !DILocalVariable(name: "m_vec_limbs", scope: !625, file: !68, line: 273, type: !275)
!634 = !DILocalVariable(name: "_in", scope: !625, file: !68, line: 274, type: !61)
!635 = !DILocalVariable(name: "i", scope: !636, file: !68, line: 275, type: !86)
!636 = distinct !DILexicalBlock(scope: !625, file: !68, line: 275, column: 5)
!637 = !DILocation(line: 0, scope: !636, inlinedAt: !629)
!638 = !DILocation(line: 275, column: 10, scope: !636, inlinedAt: !629)
!639 = !DILocation(line: 275, scope: !636, inlinedAt: !629)
!640 = !DILocation(line: 275, column: 23, scope: !641, inlinedAt: !629)
!641 = distinct !DILexicalBlock(scope: !636, file: !68, line: 275, column: 5)
!642 = !DILocation(line: 275, column: 5, scope: !636, inlinedAt: !629)
!643 = !DILocation(line: 277, column: 27, scope: !644, inlinedAt: !629)
!644 = distinct !DILexicalBlock(scope: !641, file: !68, line: 276, column: 5)
!645 = !DILocation(line: 277, column: 21, scope: !644, inlinedAt: !629)
!646 = !DILocation(line: 277, column: 51, scope: !644, inlinedAt: !629)
!647 = !DILocation(line: 277, column: 36, scope: !644, inlinedAt: !629)
!648 = !DILocation(line: 277, column: 9, scope: !644, inlinedAt: !629)
!649 = !DILocation(line: 275, column: 32, scope: !641, inlinedAt: !629)
!650 = !DILocation(line: 275, column: 5, scope: !641, inlinedAt: !629)
!651 = distinct !{!651, !642, !652, !300}
!652 = !DILocation(line: 278, column: 5, scope: !636, inlinedAt: !629)
!653 = !DILocation(line: 602, column: 5, scope: !394)
!654 = !DILabel(scope: !394, name: "err", file: !68, line: 600)
!655 = !DILocation(line: 600, column: 5, scope: !394)
!656 = !DILocation(line: 603, column: 5, scope: !394)
!657 = !DILocation(line: 604, column: 5, scope: !394)
!658 = !DILocation(line: 605, column: 5, scope: !394)
!659 = distinct !DISubprogram(name: "m_vec_mul_add", scope: !660, file: !660, line: 31, type: !661, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!660 = !DIFile(filename: "../../../src/generic/arithmetic_fixed.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!661 = !DISubroutineType(types: !662)
!662 = !{null, !86, !488, !51, !52}
!663 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !659, file: !660, line: 31, type: !86)
!664 = !DILocation(line: 0, scope: !659)
!665 = !DILocalVariable(name: "in", arg: 2, scope: !659, file: !660, line: 31, type: !488)
!666 = !DILocalVariable(name: "a", arg: 3, scope: !659, file: !660, line: 31, type: !51)
!667 = !DILocalVariable(name: "acc", arg: 4, scope: !659, file: !660, line: 31, type: !52)
!668 = !DILocalVariable(name: "b", arg: 1, scope: !669, file: !670, line: 128, type: !174)
!669 = distinct !DISubprogram(name: "mul_table", scope: !670, file: !670, line: 128, type: !671, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!670 = !DIFile(filename: "../../../src/simple_arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!671 = !DISubroutineType(types: !672)
!672 = !{!62, !174}
!673 = !DILocation(line: 0, scope: !669, inlinedAt: !674)
!674 = distinct !DILocation(line: 33, column: 20, scope: !659)
!675 = !DILocation(line: 129, column: 19, scope: !669, inlinedAt: !674)
!676 = !DILocation(line: 129, column: 33, scope: !669, inlinedAt: !674)
!677 = !DILocalVariable(name: "x", scope: !669, file: !670, line: 129, type: !62)
!678 = !DILocalVariable(name: "high_nibble_mask", scope: !669, file: !670, line: 131, type: !62)
!679 = !DILocation(line: 133, column: 28, scope: !669, inlinedAt: !674)
!680 = !DILocalVariable(name: "high_half", scope: !669, file: !670, line: 133, type: !62)
!681 = !DILocation(line: 134, column: 28, scope: !669, inlinedAt: !674)
!682 = !DILocation(line: 134, column: 47, scope: !669, inlinedAt: !674)
!683 = !DILocation(line: 134, column: 34, scope: !669, inlinedAt: !674)
!684 = !DILocalVariable(name: "tab", scope: !659, file: !660, line: 33, type: !62)
!685 = !DILocalVariable(name: "lsb_ask", scope: !659, file: !660, line: 35, type: !53)
!686 = !DILocalVariable(name: "i", scope: !687, file: !660, line: 37, type: !86)
!687 = distinct !DILexicalBlock(scope: !659, file: !660, line: 37, column: 5)
!688 = !DILocation(line: 0, scope: !687)
!689 = !DILocation(line: 37, column: 9, scope: !687)
!690 = !DILocation(line: 37, scope: !687)
!691 = !DILocation(line: 37, column: 20, scope: !692)
!692 = distinct !DILexicalBlock(scope: !687, file: !660, line: 37, column: 5)
!693 = !DILocation(line: 37, column: 5, scope: !687)
!694 = !DILocation(line: 38, column: 21, scope: !695)
!695 = distinct !DILexicalBlock(scope: !692, file: !660, line: 37, column: 43)
!696 = !DILocation(line: 38, column: 33, scope: !695)
!697 = !DILocation(line: 38, column: 51, scope: !695)
!698 = !DILocation(line: 38, column: 46, scope: !695)
!699 = !DILocation(line: 38, column: 44, scope: !695)
!700 = !DILocation(line: 39, column: 27, scope: !695)
!701 = !DILocation(line: 39, column: 33, scope: !695)
!702 = !DILocation(line: 39, column: 52, scope: !695)
!703 = !DILocation(line: 39, column: 59, scope: !695)
!704 = !DILocation(line: 39, column: 46, scope: !695)
!705 = !DILocation(line: 39, column: 44, scope: !695)
!706 = !DILocation(line: 39, column: 17, scope: !695)
!707 = !DILocation(line: 40, column: 21, scope: !695)
!708 = !DILocation(line: 40, column: 27, scope: !695)
!709 = !DILocation(line: 40, column: 33, scope: !695)
!710 = !DILocation(line: 40, column: 52, scope: !695)
!711 = !DILocation(line: 40, column: 59, scope: !695)
!712 = !DILocation(line: 40, column: 46, scope: !695)
!713 = !DILocation(line: 40, column: 44, scope: !695)
!714 = !DILocation(line: 40, column: 17, scope: !695)
!715 = !DILocation(line: 41, column: 21, scope: !695)
!716 = !DILocation(line: 41, column: 27, scope: !695)
!717 = !DILocation(line: 41, column: 33, scope: !695)
!718 = !DILocation(line: 41, column: 52, scope: !695)
!719 = !DILocation(line: 41, column: 59, scope: !695)
!720 = !DILocation(line: 41, column: 46, scope: !695)
!721 = !DILocation(line: 41, column: 44, scope: !695)
!722 = !DILocation(line: 41, column: 17, scope: !695)
!723 = !DILocation(line: 38, column: 9, scope: !695)
!724 = !DILocation(line: 38, column: 16, scope: !695)
!725 = !DILocation(line: 37, column: 40, scope: !692)
!726 = !DILocation(line: 37, column: 5, scope: !692)
!727 = distinct !{!727, !693, !728, !300}
!728 = !DILocation(line: 42, column: 5, scope: !687)
!729 = !DILocation(line: 43, column: 1, scope: !659)
!730 = distinct !DISubprogram(name: "pqmayo_MAYO_5_ref_mayo_expand_sk", scope: !68, file: !68, line: 310, type: !731, scopeLine: 311, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!731 = !DISubroutineType(types: !732)
!732 = !{!86, !193, !90, !733}
!733 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !734, size: 32)
!734 = !DIDerivedType(tag: DW_TAG_typedef, name: "sk_t", file: !79, line: 294, baseType: !735)
!735 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sk_t", file: !79, line: 291, size: 6843264, elements: !736)
!736 = !{!737, !738}
!737 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !735, file: !79, line: 292, baseType: !169, size: 6829632)
!738 = !DIDerivedType(tag: DW_TAG_member, name: "O", scope: !735, file: !79, line: 293, baseType: !173, size: 13632, offset: 6829632)
!739 = !DILocalVariable(name: "p", arg: 1, scope: !730, file: !68, line: 310, type: !193)
!740 = !DILocation(line: 0, scope: !730)
!741 = !DILocalVariable(name: "csk", arg: 2, scope: !730, file: !68, line: 310, type: !90)
!742 = !DILocalVariable(name: "sk", arg: 3, scope: !730, file: !68, line: 311, type: !733)
!743 = !DILocalVariable(name: "ret", scope: !730, file: !68, line: 312, type: !86)
!744 = !DILocalVariable(name: "S", scope: !730, file: !68, line: 313, type: !402)
!745 = !DILocation(line: 313, column: 19, scope: !730)
!746 = !DILocalVariable(name: "P", scope: !730, file: !68, line: 314, type: !52)
!747 = !DILocation(line: 315, column: 28, scope: !730)
!748 = !DILocalVariable(name: "O", scope: !730, file: !68, line: 315, type: !61)
!749 = !DILocalVariable(name: "param_o", scope: !730, file: !68, line: 317, type: !275)
!750 = !DILocalVariable(name: "param_v", scope: !730, file: !68, line: 318, type: !275)
!751 = !DILocalVariable(name: "param_O_bytes", scope: !730, file: !68, line: 319, type: !275)
!752 = !DILocalVariable(name: "param_pk_seed_bytes", scope: !730, file: !68, line: 320, type: !275)
!753 = !DILocalVariable(name: "param_sk_seed_bytes", scope: !730, file: !68, line: 321, type: !275)
!754 = !DILocalVariable(name: "seed_sk", scope: !730, file: !68, line: 323, type: !90)
!755 = !DILocalVariable(name: "seed_pk", scope: !730, file: !68, line: 324, type: !61)
!756 = !DILocation(line: 326, column: 5, scope: !730)
!757 = !DILocation(line: 328, column: 14, scope: !730)
!758 = !DILocation(line: 0, scope: !435, inlinedAt: !759)
!759 = distinct !DILocation(line: 328, column: 5, scope: !730)
!760 = !DILocation(line: 22, column: 10, scope: !444, inlinedAt: !759)
!761 = !DILocation(line: 22, scope: !444, inlinedAt: !759)
!762 = !DILocation(line: 22, column: 19, scope: !447, inlinedAt: !759)
!763 = !DILocation(line: 22, column: 5, scope: !444, inlinedAt: !759)
!764 = !DILocation(line: 23, column: 19, scope: !450, inlinedAt: !759)
!765 = !DILocation(line: 23, column: 24, scope: !450, inlinedAt: !759)
!766 = !DILocation(line: 23, column: 14, scope: !450, inlinedAt: !759)
!767 = !DILocation(line: 23, column: 17, scope: !450, inlinedAt: !759)
!768 = !DILocation(line: 24, column: 24, scope: !450, inlinedAt: !759)
!769 = !DILocation(line: 24, column: 17, scope: !450, inlinedAt: !759)
!770 = !DILocation(line: 24, column: 14, scope: !450, inlinedAt: !759)
!771 = !DILocation(line: 22, column: 34, scope: !447, inlinedAt: !759)
!772 = !DILocation(line: 22, column: 5, scope: !447, inlinedAt: !759)
!773 = distinct !{!773, !763, !774, !300}
!774 = !DILocation(line: 25, column: 5, scope: !444, inlinedAt: !759)
!775 = !DILocation(line: 0, scope: !256, inlinedAt: !776)
!776 = distinct !DILocation(line: 334, column: 5, scope: !730)
!777 = !DILocation(line: 284, column: 5, scope: !256, inlinedAt: !776)
!778 = !DILocation(line: 265, column: 14, scope: !265, inlinedAt: !779)
!779 = distinct !DILocation(line: 285, column: 5, scope: !256, inlinedAt: !776)
!780 = !DILocation(line: 0, scope: !265, inlinedAt: !779)
!781 = !DILocation(line: 0, scope: !282, inlinedAt: !779)
!782 = !DILocation(line: 266, column: 10, scope: !282, inlinedAt: !779)
!783 = !DILocation(line: 266, column: 28, scope: !286, inlinedAt: !779)
!784 = !DILocation(line: 266, column: 5, scope: !282, inlinedAt: !779)
!785 = !DILocation(line: 266, scope: !282, inlinedAt: !779)
!786 = !DILocation(line: 268, column: 27, scope: !290, inlinedAt: !779)
!787 = !DILocation(line: 268, column: 29, scope: !290, inlinedAt: !779)
!788 = !DILocation(line: 268, column: 24, scope: !290, inlinedAt: !779)
!789 = !DILocation(line: 268, column: 9, scope: !290, inlinedAt: !779)
!790 = !DILocation(line: 269, column: 36, scope: !290, inlinedAt: !779)
!791 = !DILocation(line: 269, column: 21, scope: !290, inlinedAt: !779)
!792 = !DILocation(line: 269, column: 9, scope: !290, inlinedAt: !779)
!793 = !DILocation(line: 266, column: 5, scope: !286, inlinedAt: !779)
!794 = distinct !{!794, !784, !795, !300}
!795 = !DILocation(line: 270, column: 5, scope: !282, inlinedAt: !779)
!796 = !DILocation(line: 271, column: 1, scope: !265, inlinedAt: !779)
!797 = !DILocation(line: 341, column: 22, scope: !730)
!798 = !DILocalVariable(name: "P2", scope: !730, file: !68, line: 341, type: !52)
!799 = !DILocalVariable(name: "P1", scope: !730, file: !68, line: 343, type: !52)
!800 = !DILocalVariable(name: "L", scope: !730, file: !68, line: 346, type: !52)
!801 = !DILocalVariable(name: "p", arg: 1, scope: !802, file: !485, line: 218, type: !193)
!802 = distinct !DISubprogram(name: "P1P1t_times_O", scope: !485, file: !485, line: 218, type: !500, scopeLine: 218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!803 = !DILocation(line: 0, scope: !802, inlinedAt: !804)
!804 = distinct !DILocation(line: 347, column: 5, scope: !730)
!805 = !DILocalVariable(name: "P1", arg: 2, scope: !802, file: !485, line: 218, type: !488)
!806 = !DILocalVariable(name: "O", arg: 3, scope: !802, file: !485, line: 218, type: !90)
!807 = !DILocalVariable(name: "acc", arg: 4, scope: !802, file: !485, line: 218, type: !52)
!808 = !DILocalVariable(name: "param_o", scope: !802, file: !485, line: 222, type: !275)
!809 = !DILocalVariable(name: "param_v", scope: !802, file: !485, line: 223, type: !275)
!810 = !DILocalVariable(name: "m_vec_limbs", scope: !802, file: !485, line: 224, type: !275)
!811 = !DILocalVariable(name: "bs_mat_entries_used", scope: !802, file: !485, line: 226, type: !86)
!812 = !DILocalVariable(name: "r", scope: !813, file: !485, line: 227, type: !86)
!813 = distinct !DILexicalBlock(scope: !802, file: !485, line: 227, column: 5)
!814 = !DILocation(line: 0, scope: !813, inlinedAt: !804)
!815 = !DILocation(line: 227, column: 10, scope: !813, inlinedAt: !804)
!816 = !DILocation(line: 226, column: 9, scope: !802, inlinedAt: !804)
!817 = !DILocation(line: 227, scope: !813, inlinedAt: !804)
!818 = !DILocation(line: 227, column: 23, scope: !819, inlinedAt: !804)
!819 = distinct !DILexicalBlock(scope: !813, file: !485, line: 227, column: 5)
!820 = !DILocation(line: 227, column: 5, scope: !813, inlinedAt: !804)
!821 = !DILocation(line: 228, column: 9, scope: !822, inlinedAt: !804)
!822 = distinct !DILexicalBlock(scope: !823, file: !485, line: 228, column: 9)
!823 = distinct !DILexicalBlock(scope: !819, file: !485, line: 227, column: 39)
!824 = !DILocation(line: 228, scope: !822, inlinedAt: !804)
!825 = !DILocalVariable(name: "c", scope: !822, file: !485, line: 228, type: !86)
!826 = !DILocation(line: 0, scope: !822, inlinedAt: !804)
!827 = !DILocation(line: 228, column: 27, scope: !828, inlinedAt: !804)
!828 = distinct !DILexicalBlock(scope: !822, file: !485, line: 228, column: 9)
!829 = !DILocation(line: 229, column: 17, scope: !830, inlinedAt: !804)
!830 = distinct !DILexicalBlock(scope: !831, file: !485, line: 229, column: 16)
!831 = distinct !DILexicalBlock(scope: !828, file: !485, line: 228, column: 43)
!832 = !DILocation(line: 233, column: 13, scope: !833, inlinedAt: !804)
!833 = distinct !DILexicalBlock(scope: !831, file: !485, line: 233, column: 13)
!834 = !DILocation(line: 233, scope: !833, inlinedAt: !804)
!835 = !DILocalVariable(name: "k", scope: !833, file: !485, line: 233, type: !86)
!836 = !DILocation(line: 0, scope: !833, inlinedAt: !804)
!837 = !DILocation(line: 233, column: 31, scope: !838, inlinedAt: !804)
!838 = distinct !DILexicalBlock(scope: !833, file: !485, line: 233, column: 13)
!839 = !DILocation(line: 234, column: 47, scope: !840, inlinedAt: !804)
!840 = distinct !DILexicalBlock(scope: !838, file: !485, line: 233, column: 50)
!841 = !DILocation(line: 234, column: 88, scope: !840, inlinedAt: !804)
!842 = !DILocation(line: 234, column: 84, scope: !840, inlinedAt: !804)
!843 = !DILocation(line: 234, column: 127, scope: !840, inlinedAt: !804)
!844 = !DILocation(line: 234, column: 137, scope: !840, inlinedAt: !804)
!845 = !DILocation(line: 234, column: 108, scope: !840, inlinedAt: !804)
!846 = !DILocation(line: 234, column: 17, scope: !840, inlinedAt: !804)
!847 = !DILocation(line: 235, column: 47, scope: !840, inlinedAt: !804)
!848 = !DILocation(line: 235, column: 88, scope: !840, inlinedAt: !804)
!849 = !DILocation(line: 235, column: 84, scope: !840, inlinedAt: !804)
!850 = !DILocation(line: 235, column: 127, scope: !840, inlinedAt: !804)
!851 = !DILocation(line: 235, column: 137, scope: !840, inlinedAt: !804)
!852 = !DILocation(line: 235, column: 108, scope: !840, inlinedAt: !804)
!853 = !DILocation(line: 235, column: 17, scope: !840, inlinedAt: !804)
!854 = !DILocation(line: 233, column: 44, scope: !838, inlinedAt: !804)
!855 = !DILocation(line: 233, column: 13, scope: !838, inlinedAt: !804)
!856 = distinct !{!856, !832, !857, !300}
!857 = !DILocation(line: 236, column: 13, scope: !833, inlinedAt: !804)
!858 = !DILocation(line: 0, scope: !831, inlinedAt: !804)
!859 = !DILocation(line: 228, column: 39, scope: !828, inlinedAt: !804)
!860 = !DILocation(line: 228, column: 9, scope: !828, inlinedAt: !804)
!861 = distinct !{!861, !821, !862, !300}
!862 = !DILocation(line: 238, column: 9, scope: !822, inlinedAt: !804)
!863 = !DILocation(line: 227, column: 35, scope: !819, inlinedAt: !804)
!864 = !DILocation(line: 227, column: 5, scope: !819, inlinedAt: !804)
!865 = distinct !{!865, !820, !866, !300}
!866 = !DILocation(line: 239, column: 5, scope: !813, inlinedAt: !804)
!867 = !DILocation(line: 355, column: 5, scope: !730)
!868 = !DILocation(line: 356, column: 5, scope: !730)
!869 = distinct !DISubprogram(name: "pqmayo_MAYO_5_ref_mayo_sign_signature", scope: !68, file: !68, line: 359, type: !339, scopeLine: 361, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!870 = !DILocalVariable(name: "p", arg: 1, scope: !869, file: !68, line: 359, type: !193)
!871 = !DILocation(line: 0, scope: !869)
!872 = !DILocalVariable(name: "sig", arg: 2, scope: !869, file: !68, line: 359, type: !61)
!873 = !DILocalVariable(name: "siglen", arg: 3, scope: !869, file: !68, line: 360, type: !341)
!874 = !DILocalVariable(name: "m", arg: 4, scope: !869, file: !68, line: 360, type: !90)
!875 = !DILocalVariable(name: "mlen", arg: 5, scope: !869, file: !68, line: 361, type: !58)
!876 = !DILocalVariable(name: "csk", arg: 6, scope: !869, file: !68, line: 361, type: !90)
!877 = !DILocalVariable(name: "ret", scope: !869, file: !68, line: 362, type: !86)
!878 = !DILocalVariable(name: "tenc", scope: !869, file: !68, line: 363, type: !879)
!879 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 568, elements: !880)
!880 = !{!881}
!881 = !DISubrange(count: 71)
!882 = !DILocation(line: 363, column: 19, scope: !869)
!883 = !DILocalVariable(name: "t", scope: !869, file: !68, line: 363, type: !884)
!884 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 1136, elements: !885)
!885 = !{!886}
!886 = !DISubrange(count: 142)
!887 = !DILocation(line: 363, column: 38, scope: !869)
!888 = !DILocalVariable(name: "y", scope: !869, file: !68, line: 364, type: !884)
!889 = !DILocation(line: 364, column: 19, scope: !869)
!890 = !DILocalVariable(name: "salt", scope: !869, file: !68, line: 365, type: !891)
!891 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 320, elements: !892)
!892 = !{!893}
!893 = !DISubrange(count: 40)
!894 = !DILocation(line: 365, column: 19, scope: !869)
!895 = !DILocalVariable(name: "V", scope: !869, file: !68, line: 366, type: !896)
!896 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 7392, elements: !897)
!897 = !{!898}
!898 = !DISubrange(count: 924)
!899 = !DILocation(line: 366, column: 19, scope: !869)
!900 = !DILocalVariable(name: "Vdec", scope: !869, file: !68, line: 366, type: !414)
!901 = !DILocation(line: 366, column: 57, scope: !869)
!902 = !DILocalVariable(name: "A", scope: !869, file: !68, line: 367, type: !903)
!903 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 167040, elements: !904)
!904 = !{!905}
!905 = !DISubrange(count: 20880)
!906 = !DILocation(line: 367, column: 19, scope: !869)
!907 = !DILocalVariable(name: "x", scope: !869, file: !68, line: 368, type: !908)
!908 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 14784, elements: !909)
!909 = !{!910}
!910 = !DISubrange(count: 1848)
!911 = !DILocation(line: 368, column: 19, scope: !869)
!912 = !DILocalVariable(name: "r", scope: !869, file: !68, line: 369, type: !913)
!913 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 1160, elements: !914)
!914 = !{!915}
!915 = !DISubrange(count: 145)
!916 = !DILocation(line: 369, column: 19, scope: !869)
!917 = !DILocalVariable(name: "s", scope: !869, file: !68, line: 370, type: !908)
!918 = !DILocation(line: 370, column: 19, scope: !869)
!919 = !DILocalVariable(name: "sk", scope: !869, file: !68, line: 372, type: !734, align: 256)
!920 = !DILocation(line: 372, column: 22, scope: !869)
!921 = !DILocalVariable(name: "Ox", scope: !869, file: !68, line: 373, type: !884)
!922 = !DILocation(line: 373, column: 19, scope: !869)
!923 = !DILocalVariable(name: "tmp", scope: !869, file: !68, line: 374, type: !913)
!924 = !DILocation(line: 374, column: 19, scope: !869)
!925 = !DILocalVariable(name: "param_m", scope: !869, file: !68, line: 378, type: !275)
!926 = !DILocalVariable(name: "param_n", scope: !869, file: !68, line: 379, type: !275)
!927 = !DILocalVariable(name: "param_o", scope: !869, file: !68, line: 380, type: !275)
!928 = !DILocalVariable(name: "param_k", scope: !869, file: !68, line: 381, type: !275)
!929 = !DILocalVariable(name: "param_v", scope: !869, file: !68, line: 382, type: !275)
!930 = !DILocalVariable(name: "param_m_bytes", scope: !869, file: !68, line: 383, type: !275)
!931 = !DILocalVariable(name: "param_v_bytes", scope: !869, file: !68, line: 384, type: !275)
!932 = !DILocalVariable(name: "param_r_bytes", scope: !869, file: !68, line: 385, type: !275)
!933 = !DILocalVariable(name: "param_sig_bytes", scope: !869, file: !68, line: 386, type: !275)
!934 = !DILocalVariable(name: "param_A_cols", scope: !869, file: !68, line: 387, type: !275)
!935 = !DILocalVariable(name: "param_digest_bytes", scope: !869, file: !68, line: 388, type: !275)
!936 = !DILocalVariable(name: "param_sk_seed_bytes", scope: !869, file: !68, line: 389, type: !275)
!937 = !DILocalVariable(name: "param_salt_bytes", scope: !869, file: !68, line: 390, type: !275)
!938 = !DILocation(line: 392, column: 11, scope: !869)
!939 = !DILocation(line: 393, column: 13, scope: !940)
!940 = distinct !DILexicalBlock(scope: !869, file: !68, line: 393, column: 9)
!941 = !DILocalVariable(name: "seed_sk", scope: !869, file: !68, line: 371, type: !90)
!942 = !DILocation(line: 401, column: 5, scope: !869)
!943 = !DILocalVariable(name: "P1", scope: !869, file: !68, line: 403, type: !52)
!944 = !DILocation(line: 404, column: 23, scope: !869)
!945 = !DILocalVariable(name: "L", scope: !869, file: !68, line: 404, type: !52)
!946 = !DILocalVariable(name: "Mtmp", scope: !869, file: !68, line: 405, type: !409)
!947 = !DILocation(line: 405, column: 14, scope: !869)
!948 = !DILocation(line: 420, column: 25, scope: !949)
!949 = distinct !DILexicalBlock(scope: !869, file: !68, line: 420, column: 9)
!950 = !DILocation(line: 420, column: 9, scope: !949)
!951 = !DILocation(line: 420, column: 65, scope: !949)
!952 = !DILocation(line: 427, column: 37, scope: !869)
!953 = !DILocation(line: 427, column: 5, scope: !869)
!954 = !DILocation(line: 429, column: 5, scope: !869)
!955 = !DILocation(line: 437, column: 16, scope: !869)
!956 = !DILocation(line: 437, column: 5, scope: !869)
!957 = !DILocalVariable(name: "ctrbyte", scope: !869, file: !68, line: 375, type: !61)
!958 = !DILocation(line: 440, column: 5, scope: !869)
!959 = !DILocation(line: 0, scope: !435, inlinedAt: !960)
!960 = distinct !DILocation(line: 442, column: 5, scope: !869)
!961 = !DILocation(line: 22, column: 10, scope: !444, inlinedAt: !960)
!962 = !DILocation(line: 22, scope: !444, inlinedAt: !960)
!963 = !DILocation(line: 22, column: 19, scope: !447, inlinedAt: !960)
!964 = !DILocation(line: 22, column: 5, scope: !444, inlinedAt: !960)
!965 = !DILocation(line: 438, column: 59, scope: !869)
!966 = !DILocation(line: 444, column: 5, scope: !967)
!967 = distinct !DILexicalBlock(scope: !869, file: !68, line: 444, column: 5)
!968 = !DILocation(line: 23, column: 19, scope: !450, inlinedAt: !960)
!969 = !DILocation(line: 23, column: 24, scope: !450, inlinedAt: !960)
!970 = !DILocation(line: 23, column: 14, scope: !450, inlinedAt: !960)
!971 = !DILocation(line: 23, column: 17, scope: !450, inlinedAt: !960)
!972 = !DILocation(line: 24, column: 24, scope: !450, inlinedAt: !960)
!973 = !DILocation(line: 24, column: 17, scope: !450, inlinedAt: !960)
!974 = !DILocation(line: 24, column: 14, scope: !450, inlinedAt: !960)
!975 = !DILocation(line: 22, column: 34, scope: !447, inlinedAt: !960)
!976 = !DILocation(line: 22, column: 5, scope: !447, inlinedAt: !960)
!977 = distinct !{!977, !964, !978, !300}
!978 = !DILocation(line: 25, column: 5, scope: !444, inlinedAt: !960)
!979 = !DILocation(line: 444, scope: !967)
!980 = !DILocalVariable(name: "ctr", scope: !967, file: !68, line: 444, type: !86)
!981 = !DILocation(line: 0, scope: !967)
!982 = !DILocation(line: 444, column: 27, scope: !983)
!983 = distinct !DILexicalBlock(scope: !967, file: !68, line: 444, column: 5)
!984 = !DILocation(line: 445, column: 20, scope: !985)
!985 = distinct !DILexicalBlock(scope: !983, file: !68, line: 444, column: 42)
!986 = !DILocation(line: 445, column: 18, scope: !985)
!987 = !DILocation(line: 447, column: 9, scope: !985)
!988 = !DILocalVariable(name: "i", scope: !989, file: !68, line: 451, type: !86)
!989 = distinct !DILexicalBlock(scope: !985, file: !68, line: 451, column: 9)
!990 = !DILocation(line: 0, scope: !989)
!991 = !DILocation(line: 451, column: 14, scope: !989)
!992 = !DILocation(line: 451, scope: !989)
!993 = !DILocation(line: 451, column: 27, scope: !994)
!994 = distinct !DILexicalBlock(scope: !989, file: !68, line: 451, column: 9)
!995 = !DILocation(line: 451, column: 9, scope: !989)
!996 = !DILocation(line: 452, column: 26, scope: !997)
!997 = distinct !DILexicalBlock(scope: !994, file: !68, line: 451, column: 48)
!998 = !DILocation(line: 452, column: 22, scope: !997)
!999 = !DILocation(line: 452, column: 52, scope: !997)
!1000 = !DILocation(line: 452, column: 48, scope: !997)
!1001 = !DILocation(line: 0, scope: !435, inlinedAt: !1002)
!1002 = distinct !DILocation(line: 452, column: 13, scope: !997)
!1003 = !DILocation(line: 22, column: 10, scope: !444, inlinedAt: !1002)
!1004 = !DILocation(line: 22, scope: !444, inlinedAt: !1002)
!1005 = !DILocation(line: 22, column: 19, scope: !447, inlinedAt: !1002)
!1006 = !DILocation(line: 22, column: 5, scope: !444, inlinedAt: !1002)
!1007 = !DILocation(line: 23, column: 19, scope: !450, inlinedAt: !1002)
!1008 = !DILocation(line: 23, column: 24, scope: !450, inlinedAt: !1002)
!1009 = !DILocation(line: 23, column: 14, scope: !450, inlinedAt: !1002)
!1010 = !DILocation(line: 23, column: 17, scope: !450, inlinedAt: !1002)
!1011 = !DILocation(line: 24, column: 24, scope: !450, inlinedAt: !1002)
!1012 = !DILocation(line: 24, column: 17, scope: !450, inlinedAt: !1002)
!1013 = !DILocation(line: 24, column: 14, scope: !450, inlinedAt: !1002)
!1014 = !DILocation(line: 22, column: 34, scope: !447, inlinedAt: !1002)
!1015 = !DILocation(line: 22, column: 5, scope: !447, inlinedAt: !1002)
!1016 = distinct !{!1016, !1006, !1017, !300}
!1017 = !DILocation(line: 25, column: 5, scope: !444, inlinedAt: !1002)
!1018 = !DILocation(line: 451, column: 43, scope: !994)
!1019 = !DILocation(line: 451, column: 9, scope: !994)
!1020 = distinct !{!1020, !995, !1021, !300}
!1021 = !DILocation(line: 453, column: 9, scope: !989)
!1022 = !DILocation(line: 251, column: 5, scope: !1023, inlinedAt: !1026)
!1023 = distinct !DISubprogram(name: "compute_M_and_VPV", scope: !485, file: !485, line: 244, type: !1024, scopeLine: 244, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1024 = !DISubroutineType(types: !1025)
!1025 = !{null, !193, !90, !488, !488, !52, !52}
!1026 = distinct !DILocation(line: 456, column: 9, scope: !985)
!1027 = !DILocalVariable(name: "p", arg: 1, scope: !1023, file: !485, line: 244, type: !193)
!1028 = !DILocation(line: 0, scope: !1023, inlinedAt: !1026)
!1029 = !DILocalVariable(name: "Vdec", arg: 2, scope: !1023, file: !485, line: 244, type: !90)
!1030 = !DILocalVariable(name: "L", arg: 3, scope: !1023, file: !485, line: 244, type: !488)
!1031 = !DILocalVariable(name: "P1", arg: 4, scope: !1023, file: !485, line: 244, type: !488)
!1032 = !DILocalVariable(name: "VL", arg: 5, scope: !1023, file: !485, line: 244, type: !52)
!1033 = !DILocalVariable(name: "VP1V", arg: 6, scope: !1023, file: !485, line: 244, type: !52)
!1034 = !DILocalVariable(name: "param_k", scope: !1023, file: !485, line: 246, type: !275)
!1035 = !DILocalVariable(name: "param_v", scope: !1023, file: !485, line: 247, type: !275)
!1036 = !DILocalVariable(name: "param_o", scope: !1023, file: !485, line: 248, type: !275)
!1037 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !1038, file: !485, line: 61, type: !275)
!1038 = distinct !DISubprogram(name: "mul_add_mat_x_m_mat", scope: !485, file: !485, line: 61, type: !536, scopeLine: 62, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1039 = !DILocation(line: 0, scope: !1038, inlinedAt: !1040)
!1040 = distinct !DILocation(line: 251, column: 5, scope: !1023, inlinedAt: !1026)
!1041 = !DILocalVariable(name: "mat", arg: 2, scope: !1038, file: !485, line: 61, type: !90)
!1042 = !DILocalVariable(name: "bs_mat", arg: 3, scope: !1038, file: !485, line: 61, type: !488)
!1043 = !DILocalVariable(name: "acc", arg: 4, scope: !1038, file: !485, line: 61, type: !52)
!1044 = !DILocalVariable(name: "mat_rows", arg: 5, scope: !1038, file: !485, line: 62, type: !275)
!1045 = !DILocalVariable(name: "mat_cols", arg: 6, scope: !1038, file: !485, line: 62, type: !275)
!1046 = !DILocalVariable(name: "bs_mat_cols", arg: 7, scope: !1038, file: !485, line: 62, type: !275)
!1047 = !DILocalVariable(name: "r", scope: !1048, file: !485, line: 64, type: !86)
!1048 = distinct !DILexicalBlock(scope: !1038, file: !485, line: 64, column: 5)
!1049 = !DILocation(line: 0, scope: !1048, inlinedAt: !1040)
!1050 = !DILocation(line: 64, column: 10, scope: !1048, inlinedAt: !1040)
!1051 = !DILocation(line: 64, scope: !1048, inlinedAt: !1040)
!1052 = !DILocation(line: 64, column: 23, scope: !1053, inlinedAt: !1040)
!1053 = distinct !DILexicalBlock(scope: !1048, file: !485, line: 64, column: 5)
!1054 = !DILocation(line: 64, column: 5, scope: !1048, inlinedAt: !1040)
!1055 = !DILocation(line: 65, column: 9, scope: !1056, inlinedAt: !1040)
!1056 = distinct !DILexicalBlock(scope: !1057, file: !485, line: 65, column: 9)
!1057 = distinct !DILexicalBlock(scope: !1053, file: !485, line: 64, column: 40)
!1058 = !DILocation(line: 65, scope: !1056, inlinedAt: !1040)
!1059 = !DILocalVariable(name: "c", scope: !1056, file: !485, line: 65, type: !86)
!1060 = !DILocation(line: 0, scope: !1056, inlinedAt: !1040)
!1061 = !DILocation(line: 65, column: 27, scope: !1062, inlinedAt: !1040)
!1062 = distinct !DILexicalBlock(scope: !1056, file: !485, line: 65, column: 9)
!1063 = !DILocation(line: 66, column: 13, scope: !1064, inlinedAt: !1040)
!1064 = distinct !DILexicalBlock(scope: !1065, file: !485, line: 66, column: 13)
!1065 = distinct !DILexicalBlock(scope: !1062, file: !485, line: 65, column: 44)
!1066 = !DILocation(line: 66, scope: !1064, inlinedAt: !1040)
!1067 = !DILocalVariable(name: "k", scope: !1064, file: !485, line: 66, type: !86)
!1068 = !DILocation(line: 0, scope: !1064, inlinedAt: !1040)
!1069 = !DILocation(line: 66, column: 31, scope: !1070, inlinedAt: !1040)
!1070 = distinct !DILexicalBlock(scope: !1064, file: !485, line: 66, column: 13)
!1071 = !DILocation(line: 67, column: 70, scope: !1072, inlinedAt: !1040)
!1072 = distinct !DILexicalBlock(scope: !1070, file: !485, line: 66, column: 54)
!1073 = !DILocation(line: 67, column: 84, scope: !1072, inlinedAt: !1040)
!1074 = !DILocation(line: 67, column: 51, scope: !1072, inlinedAt: !1040)
!1075 = !DILocation(line: 67, column: 96, scope: !1072, inlinedAt: !1040)
!1076 = !DILocation(line: 67, column: 90, scope: !1072, inlinedAt: !1040)
!1077 = !DILocation(line: 67, column: 136, scope: !1072, inlinedAt: !1040)
!1078 = !DILocation(line: 67, column: 150, scope: !1072, inlinedAt: !1040)
!1079 = !DILocation(line: 67, column: 117, scope: !1072, inlinedAt: !1040)
!1080 = !DILocation(line: 67, column: 17, scope: !1072, inlinedAt: !1040)
!1081 = !DILocation(line: 66, column: 48, scope: !1070, inlinedAt: !1040)
!1082 = !DILocation(line: 66, column: 13, scope: !1070, inlinedAt: !1040)
!1083 = distinct !{!1083, !1063, !1084, !300}
!1084 = !DILocation(line: 68, column: 13, scope: !1064, inlinedAt: !1040)
!1085 = !DILocation(line: 65, column: 40, scope: !1062, inlinedAt: !1040)
!1086 = !DILocation(line: 65, column: 9, scope: !1062, inlinedAt: !1040)
!1087 = distinct !{!1087, !1055, !1088, !300}
!1088 = !DILocation(line: 69, column: 9, scope: !1056, inlinedAt: !1040)
!1089 = !DILocation(line: 64, column: 36, scope: !1053, inlinedAt: !1040)
!1090 = !DILocation(line: 64, column: 5, scope: !1053, inlinedAt: !1040)
!1091 = distinct !{!1091, !1054, !1092, !300}
!1092 = !DILocation(line: 70, column: 5, scope: !1048, inlinedAt: !1040)
!1093 = !DILocalVariable(name: "Pv", scope: !1023, file: !485, line: 254, type: !1094)
!1094 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 981504, elements: !1095)
!1095 = !{!1096}
!1096 = !DISubrange(count: 15336)
!1097 = !DILocation(line: 254, column: 14, scope: !1023, inlinedAt: !1026)
!1098 = !DILocalVariable(name: "p", arg: 1, scope: !1099, file: !485, line: 82, type: !193)
!1099 = distinct !DISubprogram(name: "P1_times_Vt", scope: !485, file: !485, line: 82, type: !500, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1100 = !DILocation(line: 0, scope: !1099, inlinedAt: !1101)
!1101 = distinct !DILocation(line: 255, column: 5, scope: !1023, inlinedAt: !1026)
!1102 = !DILocalVariable(name: "P1", arg: 2, scope: !1099, file: !485, line: 82, type: !488)
!1103 = !DILocalVariable(name: "V", arg: 3, scope: !1099, file: !485, line: 82, type: !90)
!1104 = !DILocalVariable(name: "acc", arg: 4, scope: !1099, file: !485, line: 82, type: !52)
!1105 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !1106, file: !485, line: 32, type: !275)
!1106 = distinct !DISubprogram(name: "mul_add_m_upper_triangular_mat_x_mat_trans", scope: !485, file: !485, line: 32, type: !509, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1107 = !DILocation(line: 0, scope: !1106, inlinedAt: !1108)
!1108 = distinct !DILocation(line: 86, column: 5, scope: !1099, inlinedAt: !1101)
!1109 = !DILocalVariable(name: "bs_mat", arg: 2, scope: !1106, file: !485, line: 32, type: !488)
!1110 = !DILocalVariable(name: "mat", arg: 3, scope: !1106, file: !485, line: 32, type: !90)
!1111 = !DILocalVariable(name: "acc", arg: 4, scope: !1106, file: !485, line: 32, type: !52)
!1112 = !DILocalVariable(name: "bs_mat_rows", arg: 5, scope: !1106, file: !485, line: 33, type: !275)
!1113 = !DILocalVariable(name: "bs_mat_cols", arg: 6, scope: !1106, file: !485, line: 33, type: !275)
!1114 = !DILocalVariable(name: "mat_rows", arg: 7, scope: !1106, file: !485, line: 33, type: !275)
!1115 = !DILocalVariable(name: "triangular", arg: 8, scope: !1106, file: !485, line: 33, type: !275)
!1116 = !DILocalVariable(name: "bs_mat_entries_used", scope: !1106, file: !485, line: 34, type: !86)
!1117 = !DILocalVariable(name: "r", scope: !1118, file: !485, line: 35, type: !86)
!1118 = distinct !DILexicalBlock(scope: !1106, file: !485, line: 35, column: 5)
!1119 = !DILocation(line: 0, scope: !1118, inlinedAt: !1108)
!1120 = !DILocation(line: 35, column: 10, scope: !1118, inlinedAt: !1108)
!1121 = !DILocation(line: 34, column: 9, scope: !1106, inlinedAt: !1108)
!1122 = !DILocation(line: 35, scope: !1118, inlinedAt: !1108)
!1123 = !DILocation(line: 35, column: 23, scope: !1124, inlinedAt: !1108)
!1124 = distinct !DILexicalBlock(scope: !1118, file: !485, line: 35, column: 5)
!1125 = !DILocation(line: 35, column: 5, scope: !1118, inlinedAt: !1108)
!1126 = !DILocation(line: 64, column: 5, scope: !1048, inlinedAt: !1127)
!1127 = distinct !DILocation(line: 256, column: 5, scope: !1023, inlinedAt: !1026)
!1128 = !DILocation(line: 36, column: 9, scope: !1129, inlinedAt: !1108)
!1129 = distinct !DILexicalBlock(scope: !1130, file: !485, line: 36, column: 9)
!1130 = distinct !DILexicalBlock(scope: !1124, file: !485, line: 35, column: 43)
!1131 = !DILocation(line: 36, scope: !1129, inlinedAt: !1108)
!1132 = !DILocalVariable(name: "c", scope: !1129, file: !485, line: 36, type: !86)
!1133 = !DILocation(line: 0, scope: !1129, inlinedAt: !1108)
!1134 = !DILocation(line: 36, column: 40, scope: !1135, inlinedAt: !1108)
!1135 = distinct !DILexicalBlock(scope: !1129, file: !485, line: 36, column: 9)
!1136 = !DILocation(line: 37, column: 13, scope: !1137, inlinedAt: !1108)
!1137 = distinct !DILexicalBlock(scope: !1138, file: !485, line: 37, column: 13)
!1138 = distinct !DILexicalBlock(scope: !1135, file: !485, line: 36, column: 60)
!1139 = !DILocation(line: 37, scope: !1137, inlinedAt: !1108)
!1140 = !DILocalVariable(name: "k", scope: !1137, file: !485, line: 37, type: !86)
!1141 = !DILocation(line: 0, scope: !1137, inlinedAt: !1108)
!1142 = !DILocation(line: 37, column: 31, scope: !1143, inlinedAt: !1108)
!1143 = distinct !DILexicalBlock(scope: !1137, file: !485, line: 37, column: 13)
!1144 = !DILocation(line: 38, column: 51, scope: !1145, inlinedAt: !1108)
!1145 = distinct !DILexicalBlock(scope: !1143, file: !485, line: 37, column: 51)
!1146 = !DILocation(line: 38, column: 94, scope: !1145, inlinedAt: !1108)
!1147 = !DILocation(line: 38, column: 88, scope: !1145, inlinedAt: !1108)
!1148 = !DILocation(line: 38, column: 137, scope: !1145, inlinedAt: !1108)
!1149 = !DILocation(line: 38, column: 148, scope: !1145, inlinedAt: !1108)
!1150 = !DILocation(line: 38, column: 118, scope: !1145, inlinedAt: !1108)
!1151 = !DILocation(line: 38, column: 17, scope: !1145, inlinedAt: !1108)
!1152 = !DILocation(line: 37, column: 45, scope: !1143, inlinedAt: !1108)
!1153 = !DILocation(line: 37, column: 13, scope: !1143, inlinedAt: !1108)
!1154 = distinct !{!1154, !1136, !1155, !300}
!1155 = !DILocation(line: 39, column: 13, scope: !1137, inlinedAt: !1108)
!1156 = !DILocation(line: 40, column: 33, scope: !1138, inlinedAt: !1108)
!1157 = !DILocation(line: 36, column: 56, scope: !1135, inlinedAt: !1108)
!1158 = !DILocation(line: 36, column: 9, scope: !1135, inlinedAt: !1108)
!1159 = distinct !{!1159, !1128, !1160, !300}
!1160 = !DILocation(line: 41, column: 9, scope: !1129, inlinedAt: !1108)
!1161 = !DILocation(line: 35, column: 39, scope: !1124, inlinedAt: !1108)
!1162 = !DILocation(line: 35, column: 5, scope: !1124, inlinedAt: !1108)
!1163 = distinct !{!1163, !1125, !1164, !300}
!1164 = !DILocation(line: 42, column: 5, scope: !1118, inlinedAt: !1108)
!1165 = !DILocation(line: 64, scope: !1048, inlinedAt: !1127)
!1166 = !DILocation(line: 0, scope: !1048, inlinedAt: !1127)
!1167 = !DILocation(line: 64, column: 23, scope: !1053, inlinedAt: !1127)
!1168 = !DILocation(line: 65, column: 9, scope: !1056, inlinedAt: !1127)
!1169 = !DILocation(line: 65, scope: !1056, inlinedAt: !1127)
!1170 = !DILocation(line: 0, scope: !1056, inlinedAt: !1127)
!1171 = !DILocation(line: 65, column: 27, scope: !1062, inlinedAt: !1127)
!1172 = !DILocation(line: 66, column: 13, scope: !1064, inlinedAt: !1127)
!1173 = !DILocation(line: 66, scope: !1064, inlinedAt: !1127)
!1174 = !DILocation(line: 0, scope: !1064, inlinedAt: !1127)
!1175 = !DILocation(line: 66, column: 31, scope: !1070, inlinedAt: !1127)
!1176 = !DILocation(line: 67, column: 70, scope: !1072, inlinedAt: !1127)
!1177 = !DILocation(line: 67, column: 84, scope: !1072, inlinedAt: !1127)
!1178 = !DILocation(line: 67, column: 51, scope: !1072, inlinedAt: !1127)
!1179 = !DILocation(line: 67, column: 96, scope: !1072, inlinedAt: !1127)
!1180 = !DILocation(line: 67, column: 90, scope: !1072, inlinedAt: !1127)
!1181 = !DILocation(line: 67, column: 136, scope: !1072, inlinedAt: !1127)
!1182 = !DILocation(line: 67, column: 150, scope: !1072, inlinedAt: !1127)
!1183 = !DILocation(line: 67, column: 117, scope: !1072, inlinedAt: !1127)
!1184 = !DILocation(line: 67, column: 17, scope: !1072, inlinedAt: !1127)
!1185 = !DILocation(line: 66, column: 48, scope: !1070, inlinedAt: !1127)
!1186 = !DILocation(line: 66, column: 13, scope: !1070, inlinedAt: !1127)
!1187 = distinct !{!1187, !1172, !1188, !300}
!1188 = !DILocation(line: 68, column: 13, scope: !1064, inlinedAt: !1127)
!1189 = !DILocation(line: 65, column: 40, scope: !1062, inlinedAt: !1127)
!1190 = !DILocation(line: 65, column: 9, scope: !1062, inlinedAt: !1127)
!1191 = distinct !{!1191, !1168, !1192, !300}
!1192 = !DILocation(line: 69, column: 9, scope: !1056, inlinedAt: !1127)
!1193 = !DILocation(line: 64, column: 36, scope: !1053, inlinedAt: !1127)
!1194 = !DILocation(line: 64, column: 5, scope: !1053, inlinedAt: !1127)
!1195 = distinct !{!1195, !1126, !1196, !300}
!1196 = !DILocation(line: 70, column: 5, scope: !1048, inlinedAt: !1127)
!1197 = !DILocation(line: 257, column: 1, scope: !1023, inlinedAt: !1026)
!1198 = !DILocation(line: 458, column: 9, scope: !985)
!1199 = !DILocation(line: 162, column: 14, scope: !1200, inlinedAt: !1203)
!1200 = distinct !DISubprogram(name: "compute_A", scope: !68, file: !68, line: 154, type: !1201, scopeLine: 154, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1201 = !DISubroutineType(types: !1202)
!1202 = !{null, !193, !52, !61}
!1203 = distinct !DILocation(line: 459, column: 9, scope: !985)
!1204 = !DILocalVariable(name: "p", arg: 1, scope: !1200, file: !68, line: 154, type: !193)
!1205 = !DILocation(line: 0, scope: !1200, inlinedAt: !1203)
!1206 = !DILocalVariable(name: "VtL", arg: 2, scope: !1200, file: !68, line: 154, type: !52)
!1207 = !DILocalVariable(name: "A_out", arg: 3, scope: !1200, file: !68, line: 154, type: !61)
!1208 = !DILocalVariable(name: "bits_to_shift", scope: !1200, file: !68, line: 159, type: !86)
!1209 = !DILocalVariable(name: "words_to_shift", scope: !1200, file: !68, line: 160, type: !86)
!1210 = !DILocalVariable(name: "m_vec_limbs", scope: !1200, file: !68, line: 161, type: !275)
!1211 = !DILocalVariable(name: "A", scope: !1200, file: !68, line: 162, type: !1212)
!1212 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 165888, elements: !1213)
!1213 = !{!1214}
!1214 = !DISubrange(count: 2592)
!1215 = !DILocalVariable(name: "A_width", scope: !1200, file: !68, line: 163, type: !58)
!1216 = !DILocalVariable(name: "mask", scope: !1217, file: !68, line: 168, type: !53)
!1217 = distinct !DILexicalBlock(scope: !1218, file: !68, line: 167, column: 29)
!1218 = distinct !DILexicalBlock(scope: !1200, file: !68, line: 167, column: 8)
!1219 = !DILocation(line: 0, scope: !1217, inlinedAt: !1203)
!1220 = !DILocalVariable(name: "i", scope: !1221, file: !68, line: 171, type: !86)
!1221 = distinct !DILexicalBlock(scope: !1217, file: !68, line: 171, column: 9)
!1222 = !DILocation(line: 0, scope: !1221, inlinedAt: !1203)
!1223 = !DILocation(line: 171, column: 14, scope: !1221, inlinedAt: !1203)
!1224 = !DILocation(line: 171, scope: !1221, inlinedAt: !1203)
!1225 = !DILocation(line: 171, column: 27, scope: !1226, inlinedAt: !1203)
!1226 = distinct !DILexicalBlock(scope: !1221, file: !68, line: 171, column: 9)
!1227 = !DILocation(line: 171, column: 9, scope: !1221, inlinedAt: !1203)
!1228 = !DILocation(line: 177, column: 5, scope: !1229, inlinedAt: !1203)
!1229 = distinct !DILexicalBlock(scope: !1200, file: !68, line: 177, column: 5)
!1230 = !DILocation(line: 173, column: 13, scope: !1231, inlinedAt: !1203)
!1231 = distinct !DILexicalBlock(scope: !1226, file: !68, line: 172, column: 9)
!1232 = !DILocation(line: 173, column: 50, scope: !1231, inlinedAt: !1203)
!1233 = !DILocation(line: 171, column: 53, scope: !1226, inlinedAt: !1203)
!1234 = !DILocation(line: 171, column: 9, scope: !1226, inlinedAt: !1203)
!1235 = distinct !{!1235, !1227, !1236, !300}
!1236 = !DILocation(line: 174, column: 9, scope: !1221, inlinedAt: !1203)
!1237 = !DILocation(line: 177, scope: !1229, inlinedAt: !1203)
!1238 = !DILocation(line: 160, column: 9, scope: !1200, inlinedAt: !1203)
!1239 = !DILocation(line: 159, column: 9, scope: !1200, inlinedAt: !1203)
!1240 = !DILocalVariable(name: "i", scope: !1229, file: !68, line: 177, type: !86)
!1241 = !DILocation(line: 0, scope: !1229, inlinedAt: !1203)
!1242 = !DILocation(line: 177, column: 23, scope: !1243, inlinedAt: !1203)
!1243 = distinct !DILexicalBlock(scope: !1229, file: !68, line: 177, column: 5)
!1244 = !DILocation(line: 212, column: 5, scope: !1245, inlinedAt: !1203)
!1245 = distinct !DILexicalBlock(scope: !1200, file: !68, line: 212, column: 5)
!1246 = !DILocation(line: 178, column: 9, scope: !1247, inlinedAt: !1203)
!1247 = distinct !DILexicalBlock(scope: !1248, file: !68, line: 178, column: 9)
!1248 = distinct !DILexicalBlock(scope: !1243, file: !68, line: 177, column: 47)
!1249 = !DILocation(line: 178, scope: !1247, inlinedAt: !1203)
!1250 = !DILocalVariable(name: "j", scope: !1247, file: !68, line: 178, type: !86)
!1251 = !DILocation(line: 0, scope: !1247, inlinedAt: !1203)
!1252 = !DILocation(line: 178, column: 40, scope: !1253, inlinedAt: !1203)
!1253 = distinct !DILexicalBlock(scope: !1247, file: !68, line: 178, column: 9)
!1254 = !DILocation(line: 180, column: 22, scope: !1255, inlinedAt: !1203)
!1255 = distinct !DILexicalBlock(scope: !1253, file: !68, line: 178, column: 51)
!1256 = !DILocalVariable(name: "Mj", scope: !1200, file: !68, line: 164, type: !488)
!1257 = !DILocalVariable(name: "c", scope: !1258, file: !68, line: 181, type: !86)
!1258 = distinct !DILexicalBlock(scope: !1255, file: !68, line: 181, column: 13)
!1259 = !DILocation(line: 0, scope: !1258, inlinedAt: !1203)
!1260 = !DILocation(line: 181, column: 18, scope: !1258, inlinedAt: !1203)
!1261 = !DILocation(line: 181, scope: !1258, inlinedAt: !1203)
!1262 = !DILocation(line: 181, column: 31, scope: !1263, inlinedAt: !1203)
!1263 = distinct !DILexicalBlock(scope: !1258, file: !68, line: 181, column: 13)
!1264 = !DILocation(line: 181, column: 13, scope: !1258, inlinedAt: !1203)
!1265 = !DILocation(line: 182, column: 17, scope: !1266, inlinedAt: !1203)
!1266 = distinct !DILexicalBlock(scope: !1267, file: !68, line: 182, column: 17)
!1267 = distinct !DILexicalBlock(scope: !1263, file: !68, line: 181, column: 50)
!1268 = !DILocation(line: 182, scope: !1266, inlinedAt: !1203)
!1269 = !DILocalVariable(name: "k", scope: !1266, file: !68, line: 182, type: !86)
!1270 = !DILocation(line: 0, scope: !1266, inlinedAt: !1203)
!1271 = !DILocation(line: 182, column: 35, scope: !1272, inlinedAt: !1203)
!1272 = distinct !DILexicalBlock(scope: !1266, file: !68, line: 182, column: 17)
!1273 = !DILocation(line: 184, column: 78, scope: !1274, inlinedAt: !1203)
!1274 = distinct !DILexicalBlock(scope: !1272, file: !68, line: 183, column: 17)
!1275 = !DILocation(line: 184, column: 100, scope: !1274, inlinedAt: !1203)
!1276 = !DILocation(line: 184, column: 35, scope: !1274, inlinedAt: !1203)
!1277 = !DILocation(line: 184, column: 39, scope: !1274, inlinedAt: !1203)
!1278 = !DILocation(line: 184, column: 48, scope: !1274, inlinedAt: !1203)
!1279 = !DILocation(line: 184, column: 65, scope: !1274, inlinedAt: !1203)
!1280 = !DILocation(line: 184, column: 43, scope: !1274, inlinedAt: !1203)
!1281 = !DILocation(line: 184, column: 21, scope: !1274, inlinedAt: !1203)
!1282 = !DILocation(line: 184, column: 75, scope: !1274, inlinedAt: !1203)
!1283 = !DILocation(line: 185, column: 38, scope: !1284, inlinedAt: !1203)
!1284 = distinct !DILexicalBlock(scope: !1274, file: !68, line: 185, column: 24)
!1285 = !DILocation(line: 186, column: 86, scope: !1286, inlinedAt: !1203)
!1286 = distinct !DILexicalBlock(scope: !1284, file: !68, line: 185, column: 42)
!1287 = !DILocation(line: 186, column: 114, scope: !1286, inlinedAt: !1203)
!1288 = !DILocation(line: 186, column: 108, scope: !1286, inlinedAt: !1203)
!1289 = !DILocation(line: 186, column: 39, scope: !1286, inlinedAt: !1203)
!1290 = !DILocation(line: 186, column: 43, scope: !1286, inlinedAt: !1203)
!1291 = !DILocation(line: 186, column: 52, scope: !1286, inlinedAt: !1203)
!1292 = !DILocation(line: 186, column: 73, scope: !1286, inlinedAt: !1203)
!1293 = !DILocation(line: 186, column: 47, scope: !1286, inlinedAt: !1203)
!1294 = !DILocation(line: 186, column: 25, scope: !1286, inlinedAt: !1203)
!1295 = !DILocation(line: 186, column: 83, scope: !1286, inlinedAt: !1203)
!1296 = !DILocation(line: 187, column: 21, scope: !1286, inlinedAt: !1203)
!1297 = !DILocation(line: 182, column: 51, scope: !1272, inlinedAt: !1203)
!1298 = !DILocation(line: 182, column: 17, scope: !1272, inlinedAt: !1203)
!1299 = distinct !{!1299, !1265, !1300, !300}
!1300 = !DILocation(line: 188, column: 17, scope: !1266, inlinedAt: !1203)
!1301 = !DILocation(line: 181, column: 46, scope: !1263, inlinedAt: !1203)
!1302 = !DILocation(line: 181, column: 13, scope: !1263, inlinedAt: !1203)
!1303 = distinct !{!1303, !1264, !1304, !300}
!1304 = !DILocation(line: 189, column: 13, scope: !1258, inlinedAt: !1203)
!1305 = !DILocation(line: 191, column: 19, scope: !1306, inlinedAt: !1203)
!1306 = distinct !DILexicalBlock(scope: !1255, file: !68, line: 191, column: 17)
!1307 = !DILocation(line: 192, column: 26, scope: !1308, inlinedAt: !1203)
!1308 = distinct !DILexicalBlock(scope: !1306, file: !68, line: 191, column: 25)
!1309 = !DILocalVariable(name: "Mi", scope: !1200, file: !68, line: 164, type: !488)
!1310 = !DILocalVariable(name: "c", scope: !1311, file: !68, line: 193, type: !86)
!1311 = distinct !DILexicalBlock(scope: !1308, file: !68, line: 193, column: 17)
!1312 = !DILocation(line: 0, scope: !1311, inlinedAt: !1203)
!1313 = !DILocation(line: 193, column: 22, scope: !1311, inlinedAt: !1203)
!1314 = !DILocation(line: 193, scope: !1311, inlinedAt: !1203)
!1315 = !DILocation(line: 193, column: 35, scope: !1316, inlinedAt: !1203)
!1316 = distinct !DILexicalBlock(scope: !1311, file: !68, line: 193, column: 17)
!1317 = !DILocation(line: 193, column: 17, scope: !1311, inlinedAt: !1203)
!1318 = !DILocation(line: 194, column: 21, scope: !1319, inlinedAt: !1203)
!1319 = distinct !DILexicalBlock(scope: !1320, file: !68, line: 194, column: 21)
!1320 = distinct !DILexicalBlock(scope: !1316, file: !68, line: 193, column: 54)
!1321 = !DILocation(line: 194, scope: !1319, inlinedAt: !1203)
!1322 = !DILocalVariable(name: "k", scope: !1319, file: !68, line: 194, type: !86)
!1323 = !DILocation(line: 0, scope: !1319, inlinedAt: !1203)
!1324 = !DILocation(line: 194, column: 39, scope: !1325, inlinedAt: !1203)
!1325 = distinct !DILexicalBlock(scope: !1319, file: !68, line: 194, column: 21)
!1326 = !DILocation(line: 196, column: 81, scope: !1327, inlinedAt: !1203)
!1327 = distinct !DILexicalBlock(scope: !1325, file: !68, line: 195, column: 21)
!1328 = !DILocation(line: 196, column: 103, scope: !1327, inlinedAt: !1203)
!1329 = !DILocation(line: 196, column: 38, scope: !1327, inlinedAt: !1203)
!1330 = !DILocation(line: 196, column: 42, scope: !1327, inlinedAt: !1203)
!1331 = !DILocation(line: 196, column: 51, scope: !1327, inlinedAt: !1203)
!1332 = !DILocation(line: 196, column: 68, scope: !1327, inlinedAt: !1203)
!1333 = !DILocation(line: 196, column: 46, scope: !1327, inlinedAt: !1203)
!1334 = !DILocation(line: 196, column: 25, scope: !1327, inlinedAt: !1203)
!1335 = !DILocation(line: 196, column: 78, scope: !1327, inlinedAt: !1203)
!1336 = !DILocation(line: 197, column: 42, scope: !1337, inlinedAt: !1203)
!1337 = distinct !DILexicalBlock(scope: !1327, file: !68, line: 197, column: 28)
!1338 = !DILocation(line: 198, column: 89, scope: !1339, inlinedAt: !1203)
!1339 = distinct !DILexicalBlock(scope: !1337, file: !68, line: 197, column: 46)
!1340 = !DILocation(line: 198, column: 117, scope: !1339, inlinedAt: !1203)
!1341 = !DILocation(line: 198, column: 111, scope: !1339, inlinedAt: !1203)
!1342 = !DILocation(line: 198, column: 42, scope: !1339, inlinedAt: !1203)
!1343 = !DILocation(line: 198, column: 46, scope: !1339, inlinedAt: !1203)
!1344 = !DILocation(line: 198, column: 55, scope: !1339, inlinedAt: !1203)
!1345 = !DILocation(line: 198, column: 76, scope: !1339, inlinedAt: !1203)
!1346 = !DILocation(line: 198, column: 50, scope: !1339, inlinedAt: !1203)
!1347 = !DILocation(line: 198, column: 29, scope: !1339, inlinedAt: !1203)
!1348 = !DILocation(line: 198, column: 86, scope: !1339, inlinedAt: !1203)
!1349 = !DILocation(line: 199, column: 25, scope: !1339, inlinedAt: !1203)
!1350 = !DILocation(line: 194, column: 55, scope: !1325, inlinedAt: !1203)
!1351 = !DILocation(line: 194, column: 21, scope: !1325, inlinedAt: !1203)
!1352 = distinct !{!1352, !1318, !1353, !300}
!1353 = !DILocation(line: 200, column: 21, scope: !1319, inlinedAt: !1203)
!1354 = !DILocation(line: 193, column: 50, scope: !1316, inlinedAt: !1203)
!1355 = !DILocation(line: 193, column: 17, scope: !1316, inlinedAt: !1203)
!1356 = distinct !{!1356, !1317, !1357, !300}
!1357 = !DILocation(line: 201, column: 17, scope: !1311, inlinedAt: !1203)
!1358 = !DILocation(line: 204, column: 27, scope: !1255, inlinedAt: !1203)
!1359 = !DILocation(line: 205, column: 30, scope: !1360, inlinedAt: !1203)
!1360 = distinct !DILexicalBlock(scope: !1255, file: !68, line: 205, column: 16)
!1361 = !DILocation(line: 178, column: 46, scope: !1253, inlinedAt: !1203)
!1362 = !DILocation(line: 178, column: 9, scope: !1253, inlinedAt: !1203)
!1363 = distinct !{!1363, !1246, !1364, !300}
!1364 = !DILocation(line: 209, column: 9, scope: !1247, inlinedAt: !1203)
!1365 = !DILocation(line: 177, column: 42, scope: !1243, inlinedAt: !1203)
!1366 = !DILocation(line: 177, column: 5, scope: !1243, inlinedAt: !1203)
!1367 = distinct !{!1367, !1228, !1368, !300}
!1368 = !DILocation(line: 210, column: 5, scope: !1229, inlinedAt: !1203)
!1369 = !DILocation(line: 212, scope: !1245, inlinedAt: !1203)
!1370 = !DILocalVariable(name: "c", scope: !1245, file: !68, line: 212, type: !58)
!1371 = !DILocation(line: 0, scope: !1245, inlinedAt: !1203)
!1372 = !DILocation(line: 212, column: 26, scope: !1373, inlinedAt: !1203)
!1373 = distinct !DILexicalBlock(scope: !1245, file: !68, line: 212, column: 5)
!1374 = !DILocation(line: 214, column: 35, scope: !1375, inlinedAt: !1203)
!1375 = distinct !DILexicalBlock(scope: !1373, file: !68, line: 213, column: 5)
!1376 = !DILocalVariable(name: "M", arg: 1, scope: !67, file: !68, line: 111, type: !52)
!1377 = !DILocation(line: 0, scope: !67, inlinedAt: !1378)
!1378 = distinct !DILocation(line: 214, column: 9, scope: !1375, inlinedAt: !1203)
!1379 = !DILocalVariable(name: "i", scope: !1380, file: !68, line: 117, type: !58)
!1380 = distinct !DILexicalBlock(scope: !67, file: !68, line: 117, column: 5)
!1381 = !DILocation(line: 0, scope: !1380, inlinedAt: !1378)
!1382 = !DILocation(line: 117, column: 10, scope: !1380, inlinedAt: !1378)
!1383 = !DILocation(line: 117, scope: !1380, inlinedAt: !1378)
!1384 = !DILocation(line: 117, column: 26, scope: !1385, inlinedAt: !1378)
!1385 = distinct !DILexicalBlock(scope: !1380, file: !68, line: 117, column: 5)
!1386 = !DILocation(line: 117, column: 5, scope: !1380, inlinedAt: !1378)
!1387 = !DILocation(line: 124, column: 5, scope: !1388, inlinedAt: !1378)
!1388 = distinct !DILexicalBlock(scope: !67, file: !68, line: 124, column: 5)
!1389 = !DILocation(line: 119, column: 24, scope: !1390, inlinedAt: !1378)
!1390 = distinct !DILexicalBlock(scope: !1385, file: !68, line: 118, column: 5)
!1391 = !DILocation(line: 119, column: 29, scope: !1390, inlinedAt: !1378)
!1392 = !DILocation(line: 119, column: 41, scope: !1390, inlinedAt: !1378)
!1393 = !DILocation(line: 119, column: 38, scope: !1390, inlinedAt: !1378)
!1394 = !DILocation(line: 119, column: 36, scope: !1390, inlinedAt: !1378)
!1395 = !DILocation(line: 119, column: 46, scope: !1390, inlinedAt: !1378)
!1396 = !DILocalVariable(name: "t", scope: !1390, file: !68, line: 119, type: !53)
!1397 = !DILocation(line: 0, scope: !1390, inlinedAt: !1378)
!1398 = !DILocation(line: 120, column: 21, scope: !1390, inlinedAt: !1378)
!1399 = !DILocation(line: 120, column: 9, scope: !1390, inlinedAt: !1378)
!1400 = !DILocation(line: 120, column: 16, scope: !1390, inlinedAt: !1378)
!1401 = !DILocation(line: 121, column: 12, scope: !1390, inlinedAt: !1378)
!1402 = !DILocation(line: 121, column: 9, scope: !1390, inlinedAt: !1378)
!1403 = !DILocation(line: 121, column: 16, scope: !1390, inlinedAt: !1378)
!1404 = !DILocation(line: 117, column: 33, scope: !1385, inlinedAt: !1378)
!1405 = !DILocation(line: 117, column: 5, scope: !1385, inlinedAt: !1378)
!1406 = distinct !{!1406, !1386, !1407, !300}
!1407 = !DILocation(line: 122, column: 5, scope: !1380, inlinedAt: !1378)
!1408 = !DILocation(line: 124, scope: !1388, inlinedAt: !1378)
!1409 = !DILocalVariable(name: "i", scope: !1388, file: !68, line: 124, type: !58)
!1410 = !DILocation(line: 0, scope: !1388, inlinedAt: !1378)
!1411 = !DILocation(line: 124, column: 26, scope: !1412, inlinedAt: !1378)
!1412 = distinct !DILexicalBlock(scope: !1388, file: !68, line: 124, column: 5)
!1413 = !DILocation(line: 134, column: 5, scope: !1414, inlinedAt: !1378)
!1414 = distinct !DILexicalBlock(scope: !67, file: !68, line: 134, column: 5)
!1415 = !DILocation(line: 126, column: 25, scope: !1416, inlinedAt: !1378)
!1416 = distinct !DILexicalBlock(scope: !1412, file: !68, line: 125, column: 5)
!1417 = !DILocation(line: 126, column: 32, scope: !1416, inlinedAt: !1378)
!1418 = !DILocation(line: 126, column: 43, scope: !1416, inlinedAt: !1378)
!1419 = !DILocation(line: 126, column: 40, scope: !1416, inlinedAt: !1378)
!1420 = !DILocation(line: 126, column: 38, scope: !1416, inlinedAt: !1378)
!1421 = !DILocation(line: 126, column: 48, scope: !1416, inlinedAt: !1378)
!1422 = !DILocalVariable(name: "t0", scope: !1416, file: !68, line: 126, type: !53)
!1423 = !DILocation(line: 0, scope: !1416, inlinedAt: !1378)
!1424 = !DILocation(line: 127, column: 28, scope: !1416, inlinedAt: !1378)
!1425 = !DILocation(line: 127, column: 25, scope: !1416, inlinedAt: !1378)
!1426 = !DILocation(line: 127, column: 32, scope: !1416, inlinedAt: !1378)
!1427 = !DILocation(line: 127, column: 43, scope: !1416, inlinedAt: !1378)
!1428 = !DILocation(line: 127, column: 40, scope: !1416, inlinedAt: !1378)
!1429 = !DILocation(line: 127, column: 38, scope: !1416, inlinedAt: !1378)
!1430 = !DILocation(line: 127, column: 48, scope: !1416, inlinedAt: !1378)
!1431 = !DILocalVariable(name: "t1", scope: !1416, file: !68, line: 127, type: !53)
!1432 = !DILocation(line: 128, column: 23, scope: !1416, inlinedAt: !1378)
!1433 = !DILocation(line: 128, column: 9, scope: !1416, inlinedAt: !1378)
!1434 = !DILocation(line: 128, column: 16, scope: !1416, inlinedAt: !1378)
!1435 = !DILocation(line: 129, column: 23, scope: !1416, inlinedAt: !1378)
!1436 = !DILocation(line: 129, column: 12, scope: !1416, inlinedAt: !1378)
!1437 = !DILocation(line: 129, column: 9, scope: !1416, inlinedAt: !1378)
!1438 = !DILocation(line: 129, column: 16, scope: !1416, inlinedAt: !1378)
!1439 = !DILocation(line: 130, column: 12, scope: !1416, inlinedAt: !1378)
!1440 = !DILocation(line: 130, column: 9, scope: !1416, inlinedAt: !1378)
!1441 = !DILocation(line: 130, column: 16, scope: !1416, inlinedAt: !1378)
!1442 = !DILocation(line: 131, column: 12, scope: !1416, inlinedAt: !1378)
!1443 = !DILocation(line: 131, column: 9, scope: !1416, inlinedAt: !1378)
!1444 = !DILocation(line: 131, column: 16, scope: !1416, inlinedAt: !1378)
!1445 = !DILocation(line: 124, column: 33, scope: !1412, inlinedAt: !1378)
!1446 = !DILocation(line: 124, column: 5, scope: !1412, inlinedAt: !1378)
!1447 = distinct !{!1447, !1387, !1448, !300}
!1448 = !DILocation(line: 132, column: 5, scope: !1388, inlinedAt: !1378)
!1449 = !DILocation(line: 134, scope: !1414, inlinedAt: !1378)
!1450 = !DILocalVariable(name: "i", scope: !1414, file: !68, line: 134, type: !58)
!1451 = !DILocation(line: 0, scope: !1414, inlinedAt: !1378)
!1452 = !DILocation(line: 134, column: 26, scope: !1453, inlinedAt: !1378)
!1453 = distinct !DILexicalBlock(scope: !1414, file: !68, line: 134, column: 5)
!1454 = !DILocation(line: 145, column: 5, scope: !1455, inlinedAt: !1378)
!1455 = distinct !DILexicalBlock(scope: !67, file: !68, line: 145, column: 5)
!1456 = !DILocation(line: 136, column: 25, scope: !1457, inlinedAt: !1378)
!1457 = distinct !DILexicalBlock(scope: !1453, file: !68, line: 135, column: 5)
!1458 = !DILocation(line: 136, column: 32, scope: !1457, inlinedAt: !1378)
!1459 = !DILocation(line: 136, column: 44, scope: !1457, inlinedAt: !1378)
!1460 = !DILocation(line: 136, column: 41, scope: !1457, inlinedAt: !1378)
!1461 = !DILocation(line: 136, column: 39, scope: !1457, inlinedAt: !1378)
!1462 = !DILocation(line: 136, column: 50, scope: !1457, inlinedAt: !1378)
!1463 = !DILocalVariable(name: "t0", scope: !1457, file: !68, line: 136, type: !53)
!1464 = !DILocation(line: 0, scope: !1457, inlinedAt: !1378)
!1465 = !DILocation(line: 137, column: 28, scope: !1457, inlinedAt: !1378)
!1466 = !DILocation(line: 137, column: 25, scope: !1457, inlinedAt: !1378)
!1467 = !DILocation(line: 137, column: 32, scope: !1457, inlinedAt: !1378)
!1468 = !DILocation(line: 137, column: 44, scope: !1457, inlinedAt: !1378)
!1469 = !DILocation(line: 137, column: 41, scope: !1457, inlinedAt: !1378)
!1470 = !DILocation(line: 137, column: 39, scope: !1457, inlinedAt: !1378)
!1471 = !DILocation(line: 137, column: 50, scope: !1457, inlinedAt: !1378)
!1472 = !DILocalVariable(name: "t1", scope: !1457, file: !68, line: 137, type: !53)
!1473 = !DILocation(line: 139, column: 23, scope: !1457, inlinedAt: !1378)
!1474 = !DILocation(line: 139, column: 9, scope: !1457, inlinedAt: !1378)
!1475 = !DILocation(line: 139, column: 17, scope: !1457, inlinedAt: !1378)
!1476 = !DILocation(line: 140, column: 23, scope: !1457, inlinedAt: !1378)
!1477 = !DILocation(line: 140, column: 12, scope: !1457, inlinedAt: !1378)
!1478 = !DILocation(line: 140, column: 9, scope: !1457, inlinedAt: !1378)
!1479 = !DILocation(line: 140, column: 17, scope: !1457, inlinedAt: !1378)
!1480 = !DILocation(line: 141, column: 12, scope: !1457, inlinedAt: !1378)
!1481 = !DILocation(line: 141, column: 9, scope: !1457, inlinedAt: !1378)
!1482 = !DILocation(line: 141, column: 17, scope: !1457, inlinedAt: !1378)
!1483 = !DILocation(line: 142, column: 12, scope: !1457, inlinedAt: !1378)
!1484 = !DILocation(line: 142, column: 9, scope: !1457, inlinedAt: !1378)
!1485 = !DILocation(line: 142, column: 17, scope: !1457, inlinedAt: !1378)
!1486 = !DILocation(line: 134, column: 32, scope: !1453, inlinedAt: !1378)
!1487 = !DILocation(line: 134, column: 5, scope: !1453, inlinedAt: !1378)
!1488 = distinct !{!1488, !1413, !1489, !300}
!1489 = !DILocation(line: 143, column: 5, scope: !1414, inlinedAt: !1378)
!1490 = !DILocation(line: 145, scope: !1455, inlinedAt: !1378)
!1491 = !DILocalVariable(name: "i", scope: !1455, file: !68, line: 145, type: !58)
!1492 = !DILocation(line: 0, scope: !1455, inlinedAt: !1378)
!1493 = !DILocation(line: 145, column: 26, scope: !1494, inlinedAt: !1378)
!1494 = distinct !DILexicalBlock(scope: !1455, file: !68, line: 145, column: 5)
!1495 = !DILocation(line: 147, column: 24, scope: !1496, inlinedAt: !1378)
!1496 = distinct !DILexicalBlock(scope: !1494, file: !68, line: 146, column: 5)
!1497 = !DILocation(line: 147, column: 28, scope: !1496, inlinedAt: !1378)
!1498 = !DILocation(line: 147, column: 39, scope: !1496, inlinedAt: !1378)
!1499 = !DILocation(line: 147, column: 36, scope: !1496, inlinedAt: !1378)
!1500 = !DILocation(line: 147, column: 44, scope: !1496, inlinedAt: !1378)
!1501 = !DILocalVariable(name: "t", scope: !1496, file: !68, line: 147, type: !53)
!1502 = !DILocation(line: 0, scope: !1496, inlinedAt: !1378)
!1503 = !DILocation(line: 148, column: 21, scope: !1496, inlinedAt: !1378)
!1504 = !DILocation(line: 148, column: 9, scope: !1496, inlinedAt: !1378)
!1505 = !DILocation(line: 148, column: 16, scope: !1496, inlinedAt: !1378)
!1506 = !DILocation(line: 149, column: 12, scope: !1496, inlinedAt: !1378)
!1507 = !DILocation(line: 149, column: 9, scope: !1496, inlinedAt: !1378)
!1508 = !DILocation(line: 149, column: 16, scope: !1496, inlinedAt: !1378)
!1509 = !DILocation(line: 145, column: 32, scope: !1494, inlinedAt: !1378)
!1510 = !DILocation(line: 145, column: 5, scope: !1494, inlinedAt: !1378)
!1511 = distinct !{!1511, !1454, !1512, !300}
!1512 = !DILocation(line: 150, column: 5, scope: !1455, inlinedAt: !1378)
!1513 = !DILocation(line: 212, column: 91, scope: !1373, inlinedAt: !1203)
!1514 = !DILocation(line: 212, column: 5, scope: !1373, inlinedAt: !1203)
!1515 = distinct !{!1515, !1244, !1516, !300}
!1516 = !DILocation(line: 215, column: 5, scope: !1245, inlinedAt: !1203)
!1517 = !DILocalVariable(name: "tab", scope: !1200, file: !68, line: 217, type: !1518)
!1518 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 128, elements: !1519)
!1519 = !{!1520}
!1520 = !DISubrange(count: 16)
!1521 = !DILocation(line: 217, column: 19, scope: !1200, inlinedAt: !1203)
!1522 = !DILocalVariable(name: "i", scope: !1523, file: !68, line: 218, type: !58)
!1523 = distinct !DILexicalBlock(scope: !1200, file: !68, line: 218, column: 5)
!1524 = !DILocation(line: 0, scope: !1523, inlinedAt: !1203)
!1525 = !DILocation(line: 218, column: 10, scope: !1523, inlinedAt: !1203)
!1526 = !DILocation(line: 218, scope: !1523, inlinedAt: !1203)
!1527 = !DILocation(line: 218, column: 26, scope: !1528, inlinedAt: !1203)
!1528 = distinct !DILexicalBlock(scope: !1523, file: !68, line: 218, column: 5)
!1529 = !DILocation(line: 218, column: 5, scope: !1523, inlinedAt: !1203)
!1530 = !DILocation(line: 228, column: 5, scope: !1531, inlinedAt: !1203)
!1531 = distinct !DILexicalBlock(scope: !1200, file: !68, line: 228, column: 5)
!1532 = !DILocation(line: 220, column: 28, scope: !1533, inlinedAt: !1203)
!1533 = distinct !DILexicalBlock(scope: !1528, file: !68, line: 219, column: 5)
!1534 = !DILocalVariable(name: "a", arg: 1, scope: !1535, file: !670, line: 8, type: !51)
!1535 = distinct !DISubprogram(name: "mul_f", scope: !670, file: !670, line: 8, type: !1536, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1536 = !DISubroutineType(types: !1537)
!1537 = !{!51, !51, !51}
!1538 = !DILocation(line: 0, scope: !1535, inlinedAt: !1539)
!1539 = distinct !DILocation(line: 220, column: 22, scope: !1533, inlinedAt: !1203)
!1540 = !DILocalVariable(name: "b", arg: 2, scope: !1535, file: !670, line: 8, type: !51)
!1541 = !DILocation(line: 13, column: 10, scope: !1535, inlinedAt: !1539)
!1542 = !DILocation(line: 13, column: 7, scope: !1535, inlinedAt: !1539)
!1543 = !DILocalVariable(name: "p", scope: !1535, file: !670, line: 10, type: !51)
!1544 = !DILocation(line: 19, column: 7, scope: !1535, inlinedAt: !1539)
!1545 = !DILocalVariable(name: "top_p", scope: !1535, file: !670, line: 22, type: !51)
!1546 = !DILocalVariable(name: "out", scope: !1535, file: !670, line: 23, type: !51)
!1547 = !DILocation(line: 220, column: 14, scope: !1533, inlinedAt: !1203)
!1548 = !DILocation(line: 220, column: 9, scope: !1533, inlinedAt: !1203)
!1549 = !DILocation(line: 220, column: 20, scope: !1533, inlinedAt: !1203)
!1550 = !DILocation(line: 0, scope: !1535, inlinedAt: !1551)
!1551 = distinct !DILocation(line: 221, column: 22, scope: !1533, inlinedAt: !1203)
!1552 = !DILocation(line: 13, column: 10, scope: !1535, inlinedAt: !1551)
!1553 = !DILocation(line: 13, column: 7, scope: !1535, inlinedAt: !1551)
!1554 = !DILocation(line: 16, column: 17, scope: !1535, inlinedAt: !1551)
!1555 = !DILocation(line: 17, column: 17, scope: !1535, inlinedAt: !1551)
!1556 = !DILocation(line: 17, column: 7, scope: !1535, inlinedAt: !1551)
!1557 = !DILocation(line: 18, column: 17, scope: !1535, inlinedAt: !1551)
!1558 = !DILocation(line: 18, column: 7, scope: !1535, inlinedAt: !1551)
!1559 = !DILocation(line: 19, column: 17, scope: !1535, inlinedAt: !1551)
!1560 = !DILocation(line: 23, column: 37, scope: !1535, inlinedAt: !1551)
!1561 = !DILocation(line: 23, column: 52, scope: !1535, inlinedAt: !1551)
!1562 = !DILocation(line: 23, column: 43, scope: !1535, inlinedAt: !1551)
!1563 = !DILocation(line: 23, column: 59, scope: !1535, inlinedAt: !1551)
!1564 = !DILocation(line: 221, column: 14, scope: !1533, inlinedAt: !1203)
!1565 = !DILocation(line: 221, column: 16, scope: !1533, inlinedAt: !1203)
!1566 = !DILocation(line: 221, column: 9, scope: !1533, inlinedAt: !1203)
!1567 = !DILocation(line: 221, column: 20, scope: !1533, inlinedAt: !1203)
!1568 = !DILocation(line: 222, column: 28, scope: !1533, inlinedAt: !1203)
!1569 = !DILocation(line: 0, scope: !1535, inlinedAt: !1570)
!1570 = distinct !DILocation(line: 222, column: 22, scope: !1533, inlinedAt: !1203)
!1571 = !DILocation(line: 13, column: 10, scope: !1535, inlinedAt: !1570)
!1572 = !DILocation(line: 13, column: 7, scope: !1535, inlinedAt: !1570)
!1573 = !DILocation(line: 16, column: 17, scope: !1535, inlinedAt: !1570)
!1574 = !DILocation(line: 17, column: 17, scope: !1535, inlinedAt: !1570)
!1575 = !DILocation(line: 17, column: 7, scope: !1535, inlinedAt: !1570)
!1576 = !DILocation(line: 18, column: 17, scope: !1535, inlinedAt: !1570)
!1577 = !DILocation(line: 19, column: 17, scope: !1535, inlinedAt: !1570)
!1578 = !DILocation(line: 19, column: 7, scope: !1535, inlinedAt: !1570)
!1579 = !DILocation(line: 23, column: 37, scope: !1535, inlinedAt: !1570)
!1580 = !DILocation(line: 23, column: 52, scope: !1535, inlinedAt: !1570)
!1581 = !DILocation(line: 23, column: 43, scope: !1535, inlinedAt: !1570)
!1582 = !DILocation(line: 23, column: 59, scope: !1535, inlinedAt: !1570)
!1583 = !DILocation(line: 222, column: 14, scope: !1533, inlinedAt: !1203)
!1584 = !DILocation(line: 222, column: 16, scope: !1533, inlinedAt: !1203)
!1585 = !DILocation(line: 222, column: 9, scope: !1533, inlinedAt: !1203)
!1586 = !DILocation(line: 222, column: 20, scope: !1533, inlinedAt: !1203)
!1587 = !DILocation(line: 223, column: 28, scope: !1533, inlinedAt: !1203)
!1588 = !DILocation(line: 0, scope: !1535, inlinedAt: !1589)
!1589 = distinct !DILocation(line: 223, column: 22, scope: !1533, inlinedAt: !1203)
!1590 = !DILocation(line: 13, column: 10, scope: !1535, inlinedAt: !1589)
!1591 = !DILocation(line: 13, column: 7, scope: !1535, inlinedAt: !1589)
!1592 = !DILocation(line: 16, column: 17, scope: !1535, inlinedAt: !1589)
!1593 = !DILocation(line: 17, column: 17, scope: !1535, inlinedAt: !1589)
!1594 = !DILocation(line: 18, column: 17, scope: !1535, inlinedAt: !1589)
!1595 = !DILocation(line: 18, column: 7, scope: !1535, inlinedAt: !1589)
!1596 = !DILocation(line: 19, column: 17, scope: !1535, inlinedAt: !1589)
!1597 = !DILocation(line: 19, column: 7, scope: !1535, inlinedAt: !1589)
!1598 = !DILocation(line: 23, column: 37, scope: !1535, inlinedAt: !1589)
!1599 = !DILocation(line: 23, column: 52, scope: !1535, inlinedAt: !1589)
!1600 = !DILocation(line: 23, column: 43, scope: !1535, inlinedAt: !1589)
!1601 = !DILocation(line: 23, column: 59, scope: !1535, inlinedAt: !1589)
!1602 = !DILocation(line: 223, column: 14, scope: !1533, inlinedAt: !1203)
!1603 = !DILocation(line: 223, column: 16, scope: !1533, inlinedAt: !1203)
!1604 = !DILocation(line: 223, column: 9, scope: !1533, inlinedAt: !1203)
!1605 = !DILocation(line: 223, column: 20, scope: !1533, inlinedAt: !1203)
!1606 = !DILocation(line: 218, column: 41, scope: !1528, inlinedAt: !1203)
!1607 = !DILocation(line: 218, column: 5, scope: !1528, inlinedAt: !1203)
!1608 = distinct !{!1608, !1529, !1609, !300}
!1609 = !DILocation(line: 224, column: 5, scope: !1523, inlinedAt: !1203)
!1610 = !DILocation(line: 228, scope: !1531, inlinedAt: !1203)
!1611 = !DILocalVariable(name: "c", scope: !1531, file: !68, line: 228, type: !58)
!1612 = !DILocation(line: 0, scope: !1531, inlinedAt: !1203)
!1613 = !DILocation(line: 228, column: 26, scope: !1614, inlinedAt: !1203)
!1614 = distinct !DILexicalBlock(scope: !1531, file: !68, line: 228, column: 5)
!1615 = !DILocation(line: 250, column: 5, scope: !1616, inlinedAt: !1203)
!1616 = distinct !DILexicalBlock(scope: !1200, file: !68, line: 250, column: 5)
!1617 = !DILocation(line: 230, column: 9, scope: !1618, inlinedAt: !1203)
!1618 = distinct !DILexicalBlock(scope: !1619, file: !68, line: 230, column: 9)
!1619 = distinct !DILexicalBlock(scope: !1614, file: !68, line: 229, column: 5)
!1620 = !DILocation(line: 230, scope: !1618, inlinedAt: !1203)
!1621 = !DILocalVariable(name: "r", scope: !1618, file: !68, line: 230, type: !86)
!1622 = !DILocation(line: 0, scope: !1618, inlinedAt: !1203)
!1623 = !DILocation(line: 230, column: 36, scope: !1624, inlinedAt: !1203)
!1624 = distinct !DILexicalBlock(scope: !1618, file: !68, line: 230, column: 9)
!1625 = !DILocation(line: 232, column: 28, scope: !1626, inlinedAt: !1203)
!1626 = distinct !DILexicalBlock(scope: !1624, file: !68, line: 231, column: 9)
!1627 = !DILocation(line: 232, column: 32, scope: !1626, inlinedAt: !1203)
!1628 = !DILocation(line: 232, column: 41, scope: !1626, inlinedAt: !1203)
!1629 = !DILocation(line: 232, column: 49, scope: !1626, inlinedAt: !1203)
!1630 = !DILocation(line: 232, column: 45, scope: !1626, inlinedAt: !1203)
!1631 = !DILocalVariable(name: "pos", scope: !1626, file: !68, line: 232, type: !58)
!1632 = !DILocation(line: 0, scope: !1626, inlinedAt: !1203)
!1633 = !DILocation(line: 233, column: 28, scope: !1626, inlinedAt: !1203)
!1634 = !DILocation(line: 233, column: 41, scope: !1626, inlinedAt: !1203)
!1635 = !DILocalVariable(name: "t0", scope: !1626, file: !68, line: 233, type: !53)
!1636 = !DILocation(line: 234, column: 35, scope: !1626, inlinedAt: !1203)
!1637 = !DILocation(line: 234, column: 41, scope: !1626, inlinedAt: !1203)
!1638 = !DILocalVariable(name: "t1", scope: !1626, file: !68, line: 234, type: !53)
!1639 = !DILocation(line: 235, column: 35, scope: !1626, inlinedAt: !1203)
!1640 = !DILocation(line: 235, column: 41, scope: !1626, inlinedAt: !1203)
!1641 = !DILocalVariable(name: "t2", scope: !1626, file: !68, line: 235, type: !53)
!1642 = !DILocation(line: 236, column: 28, scope: !1626, inlinedAt: !1203)
!1643 = !DILocation(line: 236, column: 35, scope: !1626, inlinedAt: !1203)
!1644 = !DILocation(line: 236, column: 41, scope: !1626, inlinedAt: !1203)
!1645 = !DILocalVariable(name: "t3", scope: !1626, file: !68, line: 236, type: !53)
!1646 = !DILocalVariable(name: "t", scope: !1647, file: !68, line: 237, type: !58)
!1647 = distinct !DILexicalBlock(scope: !1626, file: !68, line: 237, column: 13)
!1648 = !DILocation(line: 0, scope: !1647, inlinedAt: !1203)
!1649 = !DILocation(line: 237, column: 18, scope: !1647, inlinedAt: !1203)
!1650 = !DILocation(line: 237, scope: !1647, inlinedAt: !1203)
!1651 = !DILocation(line: 237, column: 34, scope: !1652, inlinedAt: !1203)
!1652 = distinct !DILexicalBlock(scope: !1647, file: !68, line: 237, column: 13)
!1653 = !DILocation(line: 237, column: 13, scope: !1647, inlinedAt: !1203)
!1654 = !DILocation(line: 239, column: 89, scope: !1655, inlinedAt: !1203)
!1655 = distinct !DILexicalBlock(scope: !1652, file: !68, line: 238, column: 13)
!1656 = !DILocation(line: 239, column: 84, scope: !1655, inlinedAt: !1203)
!1657 = !DILocation(line: 239, column: 83, scope: !1655, inlinedAt: !1203)
!1658 = !DILocation(line: 239, column: 105, scope: !1655, inlinedAt: !1203)
!1659 = !DILocation(line: 239, column: 107, scope: !1655, inlinedAt: !1203)
!1660 = !DILocation(line: 239, column: 100, scope: !1655, inlinedAt: !1203)
!1661 = !DILocation(line: 239, column: 99, scope: !1655, inlinedAt: !1203)
!1662 = !DILocation(line: 239, column: 95, scope: !1655, inlinedAt: !1203)
!1663 = !DILocation(line: 239, column: 121, scope: !1655, inlinedAt: !1203)
!1664 = !DILocation(line: 239, column: 123, scope: !1655, inlinedAt: !1203)
!1665 = !DILocation(line: 239, column: 116, scope: !1655, inlinedAt: !1203)
!1666 = !DILocation(line: 239, column: 115, scope: !1655, inlinedAt: !1203)
!1667 = !DILocation(line: 239, column: 111, scope: !1655, inlinedAt: !1203)
!1668 = !DILocation(line: 239, column: 137, scope: !1655, inlinedAt: !1203)
!1669 = !DILocation(line: 239, column: 139, scope: !1655, inlinedAt: !1203)
!1670 = !DILocation(line: 239, column: 132, scope: !1655, inlinedAt: !1203)
!1671 = !DILocation(line: 239, column: 131, scope: !1655, inlinedAt: !1203)
!1672 = !DILocation(line: 239, column: 127, scope: !1655, inlinedAt: !1203)
!1673 = !DILocation(line: 239, column: 22, scope: !1655, inlinedAt: !1203)
!1674 = !DILocation(line: 239, column: 24, scope: !1655, inlinedAt: !1203)
!1675 = !DILocation(line: 239, column: 36, scope: !1655, inlinedAt: !1203)
!1676 = !DILocation(line: 239, column: 40, scope: !1655, inlinedAt: !1203)
!1677 = !DILocation(line: 239, column: 49, scope: !1655, inlinedAt: !1203)
!1678 = !DILocation(line: 239, column: 58, scope: !1655, inlinedAt: !1203)
!1679 = !DILocation(line: 239, column: 60, scope: !1655, inlinedAt: !1203)
!1680 = !DILocation(line: 239, column: 72, scope: !1655, inlinedAt: !1203)
!1681 = !DILocation(line: 239, column: 53, scope: !1655, inlinedAt: !1203)
!1682 = !DILocation(line: 239, column: 17, scope: !1655, inlinedAt: !1203)
!1683 = !DILocation(line: 239, column: 78, scope: !1655, inlinedAt: !1203)
!1684 = !DILocation(line: 237, column: 49, scope: !1652, inlinedAt: !1203)
!1685 = !DILocation(line: 237, column: 13, scope: !1652, inlinedAt: !1203)
!1686 = distinct !{!1686, !1653, !1687, !300}
!1687 = !DILocation(line: 240, column: 13, scope: !1647, inlinedAt: !1203)
!1688 = !DILocation(line: 230, column: 82, scope: !1624, inlinedAt: !1203)
!1689 = !DILocation(line: 230, column: 9, scope: !1624, inlinedAt: !1203)
!1690 = distinct !{!1690, !1617, !1691, !300}
!1691 = !DILocation(line: 241, column: 9, scope: !1618, inlinedAt: !1203)
!1692 = !DILocation(line: 228, column: 38, scope: !1614, inlinedAt: !1203)
!1693 = !DILocation(line: 228, column: 5, scope: !1614, inlinedAt: !1203)
!1694 = distinct !{!1694, !1530, !1695, !300}
!1695 = !DILocation(line: 242, column: 5, scope: !1531, inlinedAt: !1203)
!1696 = !DILocation(line: 250, scope: !1616, inlinedAt: !1203)
!1697 = !DILocalVariable(name: "r", scope: !1616, file: !68, line: 250, type: !86)
!1698 = !DILocation(line: 0, scope: !1616, inlinedAt: !1203)
!1699 = !DILocation(line: 250, column: 23, scope: !1700, inlinedAt: !1203)
!1700 = distinct !DILexicalBlock(scope: !1616, file: !68, line: 250, column: 5)
!1701 = !DILocation(line: 252, column: 9, scope: !1702, inlinedAt: !1203)
!1702 = distinct !DILexicalBlock(scope: !1703, file: !68, line: 252, column: 9)
!1703 = distinct !DILexicalBlock(scope: !1700, file: !68, line: 251, column: 5)
!1704 = !DILocation(line: 252, scope: !1702, inlinedAt: !1203)
!1705 = !DILocalVariable(name: "c", scope: !1702, file: !68, line: 252, type: !86)
!1706 = !DILocation(line: 0, scope: !1702, inlinedAt: !1203)
!1707 = !DILocation(line: 252, column: 27, scope: !1708, inlinedAt: !1203)
!1708 = distinct !DILexicalBlock(scope: !1702, file: !68, line: 252, column: 9)
!1709 = !DILocation(line: 254, column: 13, scope: !1710, inlinedAt: !1203)
!1710 = distinct !DILexicalBlock(scope: !1711, file: !68, line: 254, column: 13)
!1711 = distinct !DILexicalBlock(scope: !1708, file: !68, line: 253, column: 9)
!1712 = !DILocation(line: 254, scope: !1710, inlinedAt: !1203)
!1713 = !DILocalVariable(name: "i", scope: !1710, file: !68, line: 254, type: !86)
!1714 = !DILocation(line: 0, scope: !1710, inlinedAt: !1203)
!1715 = !DILocation(line: 254, column: 35, scope: !1716, inlinedAt: !1203)
!1716 = distinct !DILexicalBlock(scope: !1710, file: !68, line: 254, column: 13)
!1717 = !DILocation(line: 256, column: 55, scope: !1718, inlinedAt: !1203)
!1718 = distinct !DILexicalBlock(scope: !1716, file: !68, line: 255, column: 13)
!1719 = !DILocation(line: 256, column: 59, scope: !1718, inlinedAt: !1203)
!1720 = !DILocation(line: 256, column: 63, scope: !1718, inlinedAt: !1203)
!1721 = !DILocation(line: 256, column: 44, scope: !1718, inlinedAt: !1203)
!1722 = !DILocation(line: 256, column: 95, scope: !1718, inlinedAt: !1203)
!1723 = !DILocation(line: 256, column: 92, scope: !1718, inlinedAt: !1203)
!1724 = !DILocation(line: 256, column: 75, scope: !1718, inlinedAt: !1203)
!1725 = !DILocation(line: 256, column: 99, scope: !1718, inlinedAt: !1203)
!1726 = !DILocation(line: 256, column: 104, scope: !1718, inlinedAt: !1203)
!1727 = !DILocation(line: 0, scope: !435, inlinedAt: !1728)
!1728 = distinct !DILocation(line: 256, column: 17, scope: !1718, inlinedAt: !1203)
!1729 = !DILocation(line: 22, column: 10, scope: !444, inlinedAt: !1728)
!1730 = !DILocation(line: 22, scope: !444, inlinedAt: !1728)
!1731 = !DILocation(line: 22, column: 29, scope: !447, inlinedAt: !1728)
!1732 = !DILocation(line: 22, column: 19, scope: !447, inlinedAt: !1728)
!1733 = !DILocation(line: 22, column: 5, scope: !444, inlinedAt: !1728)
!1734 = !DILocation(line: 23, column: 19, scope: !450, inlinedAt: !1728)
!1735 = !DILocation(line: 23, column: 24, scope: !450, inlinedAt: !1728)
!1736 = !DILocation(line: 23, column: 14, scope: !450, inlinedAt: !1728)
!1737 = !DILocation(line: 23, column: 17, scope: !450, inlinedAt: !1728)
!1738 = !DILocation(line: 24, column: 24, scope: !450, inlinedAt: !1728)
!1739 = !DILocation(line: 24, column: 17, scope: !450, inlinedAt: !1728)
!1740 = !DILocation(line: 24, column: 14, scope: !450, inlinedAt: !1728)
!1741 = !DILocation(line: 22, column: 34, scope: !447, inlinedAt: !1728)
!1742 = !DILocation(line: 22, column: 5, scope: !447, inlinedAt: !1728)
!1743 = distinct !{!1743, !1733, !1744, !300}
!1744 = !DILocation(line: 25, column: 5, scope: !444, inlinedAt: !1728)
!1745 = !DILocation(line: 254, column: 50, scope: !1716, inlinedAt: !1203)
!1746 = !DILocation(line: 254, column: 13, scope: !1716, inlinedAt: !1203)
!1747 = distinct !{!1747, !1709, !1748, !300}
!1748 = !DILocation(line: 257, column: 13, scope: !1710, inlinedAt: !1203)
!1749 = !DILocation(line: 252, column: 50, scope: !1708, inlinedAt: !1203)
!1750 = !DILocation(line: 252, column: 9, scope: !1708, inlinedAt: !1203)
!1751 = distinct !{!1751, !1701, !1752, !300}
!1752 = !DILocation(line: 258, column: 9, scope: !1702, inlinedAt: !1203)
!1753 = !DILocation(line: 250, column: 38, scope: !1700, inlinedAt: !1203)
!1754 = !DILocation(line: 250, column: 5, scope: !1700, inlinedAt: !1203)
!1755 = distinct !{!1755, !1615, !1756, !300}
!1756 = !DILocation(line: 259, column: 5, scope: !1616, inlinedAt: !1203)
!1757 = !DILocation(line: 260, column: 1, scope: !1200, inlinedAt: !1203)
!1758 = !DILocalVariable(name: "i", scope: !1759, file: !68, line: 461, type: !86)
!1759 = distinct !DILexicalBlock(scope: !985, file: !68, line: 461, column: 9)
!1760 = !DILocation(line: 0, scope: !1759)
!1761 = !DILocation(line: 461, column: 14, scope: !1759)
!1762 = !DILocation(line: 461, scope: !1759)
!1763 = !DILocation(line: 461, column: 27, scope: !1764)
!1764 = distinct !DILexicalBlock(scope: !1759, file: !68, line: 461, column: 9)
!1765 = !DILocation(line: 461, column: 9, scope: !1759)
!1766 = !DILocation(line: 463, column: 20, scope: !1767)
!1767 = distinct !DILexicalBlock(scope: !1764, file: !68, line: 462, column: 9)
!1768 = !DILocation(line: 463, column: 43, scope: !1767)
!1769 = !DILocation(line: 463, column: 13, scope: !1767)
!1770 = !DILocation(line: 463, column: 48, scope: !1767)
!1771 = !DILocation(line: 461, column: 39, scope: !1764)
!1772 = !DILocation(line: 461, column: 9, scope: !1764)
!1773 = distinct !{!1773, !1765, !1774, !300}
!1774 = !DILocation(line: 464, column: 9, scope: !1759)
!1775 = !DILocation(line: 466, column: 18, scope: !985)
!1776 = !DILocation(line: 0, scope: !435, inlinedAt: !1777)
!1777 = distinct !DILocation(line: 466, column: 9, scope: !985)
!1778 = !DILocation(line: 22, column: 10, scope: !444, inlinedAt: !1777)
!1779 = !DILocation(line: 22, scope: !444, inlinedAt: !1777)
!1780 = !DILocation(line: 22, column: 19, scope: !447, inlinedAt: !1777)
!1781 = !DILocation(line: 22, column: 5, scope: !444, inlinedAt: !1777)
!1782 = !DILocation(line: 23, column: 19, scope: !450, inlinedAt: !1777)
!1783 = !DILocation(line: 23, column: 24, scope: !450, inlinedAt: !1777)
!1784 = !DILocation(line: 23, column: 14, scope: !450, inlinedAt: !1777)
!1785 = !DILocation(line: 23, column: 17, scope: !450, inlinedAt: !1777)
!1786 = !DILocation(line: 24, column: 24, scope: !450, inlinedAt: !1777)
!1787 = !DILocation(line: 24, column: 17, scope: !450, inlinedAt: !1777)
!1788 = !DILocation(line: 24, column: 14, scope: !450, inlinedAt: !1777)
!1789 = !DILocation(line: 22, column: 34, scope: !447, inlinedAt: !1777)
!1790 = !DILocation(line: 22, column: 5, scope: !447, inlinedAt: !1777)
!1791 = distinct !{!1791, !1781, !1792, !300}
!1792 = !DILocation(line: 25, column: 5, scope: !444, inlinedAt: !1777)
!1793 = !DILocation(line: 470, column: 13, scope: !1794)
!1794 = distinct !DILexicalBlock(scope: !985, file: !68, line: 470, column: 13)
!1795 = !DILocation(line: 473, column: 13, scope: !1796)
!1796 = distinct !DILexicalBlock(scope: !1794, file: !68, line: 472, column: 16)
!1797 = !DILocation(line: 474, column: 13, scope: !1796)
!1798 = !DILocation(line: 444, column: 35, scope: !983)
!1799 = !DILocation(line: 444, column: 5, scope: !983)
!1800 = distinct !{!1800, !966, !1801, !300}
!1801 = !DILocation(line: 476, column: 5, scope: !967)
!1802 = !DILocalVariable(name: "i", scope: !1803, file: !68, line: 478, type: !86)
!1803 = distinct !DILexicalBlock(scope: !869, file: !68, line: 478, column: 5)
!1804 = !DILocation(line: 0, scope: !1803)
!1805 = !DILocation(line: 478, column: 10, scope: !1803)
!1806 = !DILocation(line: 478, scope: !1803)
!1807 = !DILocation(line: 478, column: 23, scope: !1808)
!1808 = distinct !DILexicalBlock(scope: !1803, file: !68, line: 478, column: 5)
!1809 = !DILocation(line: 478, column: 5, scope: !1803)
!1810 = !DILocation(line: 34, column: 5, scope: !1811, inlinedAt: !1813)
!1811 = distinct !DILexicalBlock(scope: !1812, file: !68, line: 34, column: 5)
!1812 = distinct !DISubprogram(name: "encode", scope: !68, file: !68, line: 32, type: !436, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1813 = distinct !DILocation(line: 484, column: 5, scope: !869)
!1814 = !DILocation(line: 479, column: 23, scope: !1815)
!1815 = distinct !DILexicalBlock(scope: !1808, file: !68, line: 478, column: 44)
!1816 = !DILocalVariable(name: "vi", scope: !869, file: !68, line: 376, type: !61)
!1817 = !DILocation(line: 480, column: 20, scope: !1815)
!1818 = !DILocation(line: 480, column: 29, scope: !1815)
!1819 = !DILocation(line: 480, column: 25, scope: !1815)
!1820 = !DILocalVariable(name: "a", arg: 1, scope: !1821, file: !670, line: 78, type: !90)
!1821 = distinct !DISubprogram(name: "mat_mul", scope: !670, file: !670, line: 78, type: !1822, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1822 = !DISubroutineType(types: !1823)
!1823 = !{null, !90, !90, !61, !86, !86, !86}
!1824 = !DILocation(line: 0, scope: !1821, inlinedAt: !1825)
!1825 = distinct !DILocation(line: 480, column: 9, scope: !1815)
!1826 = !DILocalVariable(name: "b", arg: 2, scope: !1821, file: !670, line: 78, type: !90)
!1827 = !DILocalVariable(name: "c", arg: 3, scope: !1821, file: !670, line: 79, type: !61)
!1828 = !DILocalVariable(name: "colrow_ab", arg: 4, scope: !1821, file: !670, line: 79, type: !86)
!1829 = !DILocalVariable(name: "row_a", arg: 5, scope: !1821, file: !670, line: 79, type: !86)
!1830 = !DILocalVariable(name: "col_b", arg: 6, scope: !1821, file: !670, line: 79, type: !86)
!1831 = !DILocalVariable(name: "i", scope: !1832, file: !670, line: 80, type: !86)
!1832 = distinct !DILexicalBlock(scope: !1821, file: !670, line: 80, column: 5)
!1833 = !DILocation(line: 0, scope: !1832, inlinedAt: !1825)
!1834 = !DILocation(line: 80, column: 10, scope: !1832, inlinedAt: !1825)
!1835 = !DILocation(line: 80, scope: !1832, inlinedAt: !1825)
!1836 = !DILocation(line: 80, column: 23, scope: !1837, inlinedAt: !1825)
!1837 = distinct !DILexicalBlock(scope: !1832, file: !670, line: 80, column: 5)
!1838 = !DILocation(line: 80, column: 5, scope: !1832, inlinedAt: !1825)
!1839 = !DILocation(line: 81, column: 9, scope: !1840, inlinedAt: !1825)
!1840 = distinct !DILexicalBlock(scope: !1841, file: !670, line: 81, column: 9)
!1841 = distinct !DILexicalBlock(scope: !1837, file: !670, line: 80, column: 53)
!1842 = !DILocation(line: 81, scope: !1840, inlinedAt: !1825)
!1843 = !DILocalVariable(name: "j", scope: !1840, file: !670, line: 81, type: !86)
!1844 = !DILocation(line: 0, scope: !1840, inlinedAt: !1825)
!1845 = !DILocation(line: 81, column: 27, scope: !1846, inlinedAt: !1825)
!1846 = distinct !DILexicalBlock(scope: !1840, file: !670, line: 81, column: 9)
!1847 = !DILocation(line: 82, column: 31, scope: !1848, inlinedAt: !1825)
!1848 = distinct !DILexicalBlock(scope: !1846, file: !670, line: 81, column: 46)
!1849 = !DILocalVariable(name: "a", arg: 1, scope: !1850, file: !670, line: 69, type: !90)
!1850 = distinct !DISubprogram(name: "lincomb", scope: !670, file: !670, line: 69, type: !1851, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1851 = !DISubroutineType(types: !1852)
!1852 = !{!51, !90, !90, !86, !86}
!1853 = !DILocation(line: 0, scope: !1850, inlinedAt: !1854)
!1854 = distinct !DILocation(line: 82, column: 18, scope: !1848, inlinedAt: !1825)
!1855 = !DILocalVariable(name: "b", arg: 2, scope: !1850, file: !670, line: 70, type: !90)
!1856 = !DILocalVariable(name: "n", arg: 3, scope: !1850, file: !670, line: 70, type: !86)
!1857 = !DILocalVariable(name: "m", arg: 4, scope: !1850, file: !670, line: 70, type: !86)
!1858 = !DILocalVariable(name: "ret", scope: !1850, file: !670, line: 71, type: !51)
!1859 = !DILocalVariable(name: "i", scope: !1860, file: !670, line: 72, type: !86)
!1860 = distinct !DILexicalBlock(scope: !1850, file: !670, line: 72, column: 5)
!1861 = !DILocation(line: 0, scope: !1860, inlinedAt: !1854)
!1862 = !DILocation(line: 72, column: 10, scope: !1860, inlinedAt: !1854)
!1863 = !DILocation(line: 72, scope: !1860, inlinedAt: !1854)
!1864 = !DILocation(line: 72, column: 23, scope: !1865, inlinedAt: !1854)
!1865 = distinct !DILexicalBlock(scope: !1860, file: !670, line: 72, column: 5)
!1866 = !DILocation(line: 72, column: 5, scope: !1860, inlinedAt: !1854)
!1867 = !DILocation(line: 73, column: 27, scope: !1868, inlinedAt: !1854)
!1868 = distinct !DILexicalBlock(scope: !1865, file: !670, line: 72, column: 41)
!1869 = !DILocation(line: 73, column: 33, scope: !1868, inlinedAt: !1854)
!1870 = !DILocation(line: 0, scope: !1535, inlinedAt: !1871)
!1871 = distinct !DILocation(line: 73, column: 21, scope: !1868, inlinedAt: !1854)
!1872 = !DILocation(line: 13, column: 10, scope: !1535, inlinedAt: !1871)
!1873 = !DILocation(line: 13, column: 7, scope: !1535, inlinedAt: !1871)
!1874 = !DILocation(line: 16, column: 17, scope: !1535, inlinedAt: !1871)
!1875 = !DILocation(line: 17, column: 13, scope: !1535, inlinedAt: !1871)
!1876 = !DILocation(line: 17, column: 17, scope: !1535, inlinedAt: !1871)
!1877 = !DILocation(line: 17, column: 7, scope: !1535, inlinedAt: !1871)
!1878 = !DILocation(line: 18, column: 13, scope: !1535, inlinedAt: !1871)
!1879 = !DILocation(line: 18, column: 17, scope: !1535, inlinedAt: !1871)
!1880 = !DILocation(line: 18, column: 7, scope: !1535, inlinedAt: !1871)
!1881 = !DILocation(line: 19, column: 13, scope: !1535, inlinedAt: !1871)
!1882 = !DILocation(line: 19, column: 17, scope: !1535, inlinedAt: !1871)
!1883 = !DILocation(line: 19, column: 7, scope: !1535, inlinedAt: !1871)
!1884 = !DILocation(line: 23, column: 37, scope: !1535, inlinedAt: !1871)
!1885 = !DILocation(line: 23, column: 52, scope: !1535, inlinedAt: !1871)
!1886 = !DILocation(line: 23, column: 43, scope: !1535, inlinedAt: !1871)
!1887 = !DILocation(line: 23, column: 59, scope: !1535, inlinedAt: !1871)
!1888 = !DILocalVariable(name: "a", arg: 1, scope: !1889, file: !670, line: 42, type: !51)
!1889 = distinct !DISubprogram(name: "add_f", scope: !670, file: !670, line: 42, type: !1536, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1890 = !DILocation(line: 0, scope: !1889, inlinedAt: !1891)
!1891 = distinct !DILocation(line: 73, column: 15, scope: !1868, inlinedAt: !1854)
!1892 = !DILocalVariable(name: "b", arg: 2, scope: !1889, file: !670, line: 42, type: !51)
!1893 = !DILocation(line: 43, column: 14, scope: !1889, inlinedAt: !1891)
!1894 = !DILocation(line: 72, column: 28, scope: !1865, inlinedAt: !1854)
!1895 = !DILocation(line: 72, column: 35, scope: !1865, inlinedAt: !1854)
!1896 = !DILocation(line: 72, column: 5, scope: !1865, inlinedAt: !1854)
!1897 = distinct !{!1897, !1866, !1898, !300}
!1898 = !DILocation(line: 74, column: 5, scope: !1860, inlinedAt: !1854)
!1899 = !DILocation(line: 82, column: 16, scope: !1848, inlinedAt: !1825)
!1900 = !DILocation(line: 81, column: 41, scope: !1846, inlinedAt: !1825)
!1901 = !DILocation(line: 81, column: 9, scope: !1846, inlinedAt: !1825)
!1902 = distinct !{!1902, !1839, !1903, !300}
!1903 = !DILocation(line: 83, column: 9, scope: !1840, inlinedAt: !1825)
!1904 = !DILocation(line: 80, column: 32, scope: !1837, inlinedAt: !1825)
!1905 = !DILocation(line: 80, column: 39, scope: !1837, inlinedAt: !1825)
!1906 = !DILocation(line: 80, column: 5, scope: !1837, inlinedAt: !1825)
!1907 = distinct !{!1907, !1838, !1908, !300}
!1908 = !DILocation(line: 84, column: 5, scope: !1832, inlinedAt: !1825)
!1909 = !DILocation(line: 479, column: 19, scope: !1815)
!1910 = !DILocation(line: 481, column: 31, scope: !1815)
!1911 = !DILocation(line: 481, column: 27, scope: !1815)
!1912 = !DILocalVariable(name: "a", arg: 1, scope: !1913, file: !670, line: 87, type: !90)
!1913 = distinct !DISubprogram(name: "mat_add", scope: !670, file: !670, line: 87, type: !1914, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1914 = !DISubroutineType(types: !1915)
!1915 = !{null, !90, !90, !61, !86, !86}
!1916 = !DILocation(line: 0, scope: !1913, inlinedAt: !1917)
!1917 = distinct !DILocation(line: 481, column: 9, scope: !1815)
!1918 = !DILocalVariable(name: "b", arg: 2, scope: !1913, file: !670, line: 87, type: !90)
!1919 = !DILocalVariable(name: "c", arg: 3, scope: !1913, file: !670, line: 88, type: !61)
!1920 = !DILocalVariable(name: "m", arg: 4, scope: !1913, file: !670, line: 88, type: !86)
!1921 = !DILocalVariable(name: "n", arg: 5, scope: !1913, file: !670, line: 88, type: !86)
!1922 = !DILocalVariable(name: "i", scope: !1923, file: !670, line: 89, type: !86)
!1923 = distinct !DILexicalBlock(scope: !1913, file: !670, line: 89, column: 5)
!1924 = !DILocation(line: 0, scope: !1923, inlinedAt: !1917)
!1925 = !DILocation(line: 89, column: 10, scope: !1923, inlinedAt: !1917)
!1926 = !DILocation(line: 89, scope: !1923, inlinedAt: !1917)
!1927 = !DILocation(line: 89, column: 23, scope: !1928, inlinedAt: !1917)
!1928 = distinct !DILexicalBlock(scope: !1923, file: !670, line: 89, column: 5)
!1929 = !DILocation(line: 89, column: 5, scope: !1923, inlinedAt: !1917)
!1930 = !DILocation(line: 90, column: 9, scope: !1931, inlinedAt: !1917)
!1931 = distinct !DILexicalBlock(scope: !1932, file: !670, line: 90, column: 9)
!1932 = distinct !DILexicalBlock(scope: !1928, file: !670, line: 89, column: 33)
!1933 = !DILocation(line: 90, scope: !1931, inlinedAt: !1917)
!1934 = !DILocalVariable(name: "j", scope: !1931, file: !670, line: 90, type: !86)
!1935 = !DILocation(line: 0, scope: !1931, inlinedAt: !1917)
!1936 = !DILocation(line: 90, column: 27, scope: !1937, inlinedAt: !1917)
!1937 = distinct !DILexicalBlock(scope: !1931, file: !670, line: 90, column: 9)
!1938 = !DILocation(line: 91, column: 42, scope: !1939, inlinedAt: !1917)
!1939 = distinct !DILexicalBlock(scope: !1937, file: !670, line: 90, column: 37)
!1940 = !DILocation(line: 91, column: 50, scope: !1939, inlinedAt: !1917)
!1941 = !DILocation(line: 91, column: 38, scope: !1939, inlinedAt: !1917)
!1942 = !DILocation(line: 91, column: 60, scope: !1939, inlinedAt: !1917)
!1943 = !DILocation(line: 91, column: 68, scope: !1939, inlinedAt: !1917)
!1944 = !DILocation(line: 91, column: 56, scope: !1939, inlinedAt: !1917)
!1945 = !DILocation(line: 0, scope: !1889, inlinedAt: !1946)
!1946 = distinct !DILocation(line: 91, column: 32, scope: !1939, inlinedAt: !1917)
!1947 = !DILocation(line: 43, column: 14, scope: !1889, inlinedAt: !1946)
!1948 = !DILocation(line: 91, column: 17, scope: !1939, inlinedAt: !1917)
!1949 = !DILocation(line: 91, column: 25, scope: !1939, inlinedAt: !1917)
!1950 = !DILocation(line: 91, column: 30, scope: !1939, inlinedAt: !1917)
!1951 = !DILocation(line: 90, column: 9, scope: !1937, inlinedAt: !1917)
!1952 = distinct !{!1952, !1930, !1953, !300}
!1953 = !DILocation(line: 92, column: 9, scope: !1931, inlinedAt: !1917)
!1954 = !DILocation(line: 89, column: 28, scope: !1928, inlinedAt: !1917)
!1955 = !DILocation(line: 89, column: 5, scope: !1928, inlinedAt: !1917)
!1956 = distinct !{!1956, !1929, !1957, !300}
!1957 = !DILocation(line: 93, column: 5, scope: !1923, inlinedAt: !1917)
!1958 = !DILocation(line: 482, column: 22, scope: !1815)
!1959 = !DILocation(line: 482, column: 18, scope: !1815)
!1960 = !DILocation(line: 482, column: 32, scope: !1815)
!1961 = !DILocation(line: 482, column: 61, scope: !1815)
!1962 = !DILocation(line: 482, column: 57, scope: !1815)
!1963 = !DILocation(line: 482, column: 9, scope: !1815)
!1964 = !DILocation(line: 478, column: 39, scope: !1808)
!1965 = !DILocation(line: 478, column: 5, scope: !1808)
!1966 = distinct !{!1966, !1809, !1967, !300}
!1967 = !DILocation(line: 483, column: 5, scope: !1803)
!1968 = !DILocation(line: 34, scope: !1811, inlinedAt: !1813)
!1969 = !DILocalVariable(name: "m", arg: 1, scope: !1812, file: !68, line: 32, type: !90)
!1970 = !DILocation(line: 0, scope: !1812, inlinedAt: !1813)
!1971 = !DILocalVariable(name: "i", scope: !1812, file: !68, line: 33, type: !86)
!1972 = !DILocation(line: 34, column: 19, scope: !1973, inlinedAt: !1813)
!1973 = distinct !DILexicalBlock(scope: !1811, file: !68, line: 34, column: 5)
!1974 = !DILocation(line: 35, column: 20, scope: !1975, inlinedAt: !1813)
!1975 = distinct !DILexicalBlock(scope: !1973, file: !68, line: 34, column: 44)
!1976 = !DILocation(line: 35, column: 31, scope: !1975, inlinedAt: !1813)
!1977 = !DILocation(line: 35, column: 27, scope: !1975, inlinedAt: !1813)
!1978 = !DILocation(line: 35, column: 36, scope: !1975, inlinedAt: !1813)
!1979 = !DILocation(line: 35, column: 24, scope: !1975, inlinedAt: !1813)
!1980 = !DILocation(line: 35, column: 9, scope: !1975, inlinedAt: !1813)
!1981 = !DILocation(line: 35, column: 17, scope: !1975, inlinedAt: !1813)
!1982 = !DILocation(line: 34, column: 31, scope: !1973, inlinedAt: !1813)
!1983 = !DILocation(line: 34, column: 38, scope: !1973, inlinedAt: !1813)
!1984 = !DILocation(line: 34, column: 5, scope: !1973, inlinedAt: !1813)
!1985 = distinct !{!1985, !1810, !1986, !300}
!1986 = !DILocation(line: 36, column: 5, scope: !1811, inlinedAt: !1813)
!1987 = !DILocation(line: 486, column: 34, scope: !869)
!1988 = !DILocation(line: 486, column: 5, scope: !869)
!1989 = !DILocation(line: 487, column: 13, scope: !869)
!1990 = !DILocation(line: 487, column: 5, scope: !869)
!1991 = !DILabel(scope: !869, name: "err", file: !68, line: 489)
!1992 = !DILocation(line: 489, column: 1, scope: !869)
!1993 = !DILocation(line: 490, column: 5, scope: !869)
!1994 = !DILocation(line: 491, column: 5, scope: !869)
!1995 = !DILocation(line: 492, column: 5, scope: !869)
!1996 = !DILocation(line: 493, column: 5, scope: !869)
!1997 = !DILocation(line: 494, column: 26, scope: !869)
!1998 = !DILocation(line: 494, column: 5, scope: !869)
!1999 = !DILocation(line: 495, column: 5, scope: !869)
!2000 = !DILocation(line: 496, column: 5, scope: !869)
!2001 = !DILocation(line: 497, column: 5, scope: !869)
!2002 = !DILocation(line: 498, column: 5, scope: !869)
!2003 = !DILocation(line: 499, column: 5, scope: !869)
!2004 = distinct !DISubprogram(name: "compute_rhs", scope: !68, file: !68, line: 43, type: !2005, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2005 = !DISubroutineType(types: !2006)
!2006 = !{null, !193, !52, !90, !61}
!2007 = !DILocalVariable(name: "p", arg: 1, scope: !2004, file: !68, line: 43, type: !193)
!2008 = !DILocation(line: 0, scope: !2004)
!2009 = !DILocalVariable(name: "vPv", arg: 2, scope: !2004, file: !68, line: 43, type: !52)
!2010 = !DILocalVariable(name: "t", arg: 3, scope: !2004, file: !68, line: 43, type: !90)
!2011 = !DILocalVariable(name: "y", arg: 4, scope: !2004, file: !68, line: 43, type: !61)
!2012 = !DILocalVariable(name: "top_pos", scope: !2004, file: !68, line: 48, type: !2013)
!2013 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !58)
!2014 = !DILocalVariable(name: "m_vec_limbs", scope: !2004, file: !68, line: 49, type: !2013)
!2015 = !DILocalVariable(name: "mask", scope: !2016, file: !68, line: 53, type: !53)
!2016 = distinct !DILexicalBlock(scope: !2017, file: !68, line: 52, column: 29)
!2017 = distinct !DILexicalBlock(scope: !2004, file: !68, line: 52, column: 8)
!2018 = !DILocation(line: 0, scope: !2016)
!2019 = !DILocalVariable(name: "i", scope: !2020, file: !68, line: 56, type: !86)
!2020 = distinct !DILexicalBlock(scope: !2016, file: !68, line: 56, column: 9)
!2021 = !DILocation(line: 0, scope: !2020)
!2022 = !DILocation(line: 56, column: 14, scope: !2020)
!2023 = !DILocation(line: 56, scope: !2020)
!2024 = !DILocation(line: 56, column: 27, scope: !2025)
!2025 = distinct !DILexicalBlock(scope: !2020, file: !68, line: 56, column: 9)
!2026 = !DILocation(line: 56, column: 9, scope: !2020)
!2027 = !DILocation(line: 58, column: 13, scope: !2028)
!2028 = distinct !DILexicalBlock(scope: !2025, file: !68, line: 57, column: 9)
!2029 = !DILocation(line: 58, column: 50, scope: !2028)
!2030 = !DILocation(line: 56, column: 53, scope: !2025)
!2031 = !DILocation(line: 56, column: 9, scope: !2025)
!2032 = distinct !{!2032, !2026, !2033, !300}
!2033 = !DILocation(line: 59, column: 9, scope: !2020)
!2034 = !DILocalVariable(name: "temp", scope: !2004, file: !68, line: 62, type: !278)
!2035 = !DILocation(line: 62, column: 14, scope: !2004)
!2036 = !DILocalVariable(name: "temp_bytes", scope: !2004, file: !68, line: 63, type: !61)
!2037 = !DILocalVariable(name: "i", scope: !2038, file: !68, line: 64, type: !86)
!2038 = distinct !DILexicalBlock(scope: !2004, file: !68, line: 64, column: 5)
!2039 = !DILocation(line: 0, scope: !2038)
!2040 = !DILocation(line: 64, column: 10, scope: !2038)
!2041 = !DILocation(line: 64, scope: !2038)
!2042 = !DILocation(line: 64, column: 36, scope: !2043)
!2043 = distinct !DILexicalBlock(scope: !2038, file: !68, line: 64, column: 5)
!2044 = !DILocation(line: 64, column: 5, scope: !2038)
!2045 = !DILocation(line: 65, column: 9, scope: !2046)
!2046 = distinct !DILexicalBlock(scope: !2047, file: !68, line: 65, column: 9)
!2047 = distinct !DILexicalBlock(scope: !2043, file: !68, line: 64, column: 48)
!2048 = !DILocation(line: 99, column: 5, scope: !2049)
!2049 = distinct !DILexicalBlock(scope: !2004, file: !68, line: 99, column: 5)
!2050 = !DILocation(line: 65, scope: !2046)
!2051 = !DILocalVariable(name: "j", scope: !2046, file: !68, line: 65, type: !86)
!2052 = !DILocation(line: 0, scope: !2046)
!2053 = !DILocation(line: 65, column: 27, scope: !2054)
!2054 = distinct !DILexicalBlock(scope: !2046, file: !68, line: 65, column: 9)
!2055 = !DILocation(line: 67, column: 34, scope: !2056)
!2056 = distinct !DILexicalBlock(scope: !2054, file: !68, line: 65, column: 46)
!2057 = !DILocation(line: 67, column: 54, scope: !2056)
!2058 = !DILocation(line: 67, column: 33, scope: !2056)
!2059 = !DILocalVariable(name: "top", scope: !2056, file: !68, line: 67, type: !51)
!2060 = !DILocation(line: 0, scope: !2056)
!2061 = !DILocation(line: 68, column: 13, scope: !2056)
!2062 = !DILocation(line: 68, column: 33, scope: !2056)
!2063 = !DILocalVariable(name: "k", scope: !2064, file: !68, line: 69, type: !86)
!2064 = distinct !DILexicalBlock(scope: !2056, file: !68, line: 69, column: 13)
!2065 = !DILocation(line: 0, scope: !2064)
!2066 = !DILocation(line: 69, column: 17, scope: !2064)
!2067 = !DILocation(line: 69, scope: !2064)
!2068 = !DILocation(line: 69, column: 43, scope: !2069)
!2069 = distinct !DILexicalBlock(scope: !2064, file: !68, line: 69, column: 13)
!2070 = !DILocation(line: 69, column: 13, scope: !2064)
!2071 = !DILocation(line: 74, column: 13, scope: !2072)
!2072 = distinct !DILexicalBlock(scope: !2056, file: !68, line: 74, column: 13)
!2073 = !DILocation(line: 70, column: 30, scope: !2074)
!2074 = distinct !DILexicalBlock(scope: !2069, file: !68, line: 69, column: 52)
!2075 = !DILocation(line: 70, column: 38, scope: !2074)
!2076 = !DILocation(line: 70, column: 23, scope: !2074)
!2077 = !DILocation(line: 70, column: 17, scope: !2074)
!2078 = !DILocation(line: 70, column: 27, scope: !2074)
!2079 = !DILocation(line: 71, column: 17, scope: !2074)
!2080 = !DILocation(line: 71, column: 25, scope: !2074)
!2081 = !DILocation(line: 69, column: 49, scope: !2069)
!2082 = !DILocation(line: 69, column: 13, scope: !2069)
!2083 = distinct !{!2083, !2070, !2084, !300}
!2084 = !DILocation(line: 72, column: 13, scope: !2064)
!2085 = !DILocation(line: 74, scope: !2072)
!2086 = !DILocalVariable(name: "jj", scope: !2072, file: !68, line: 74, type: !86)
!2087 = !DILocation(line: 0, scope: !2072)
!2088 = !DILocation(line: 74, column: 33, scope: !2089)
!2089 = distinct !DILexicalBlock(scope: !2072, file: !68, line: 74, column: 13)
!2090 = !DILocation(line: 92, column: 13, scope: !2091)
!2091 = distinct !DILexicalBlock(scope: !2056, file: !68, line: 92, column: 13)
!2092 = !DILocation(line: 75, column: 22, scope: !2093)
!2093 = distinct !DILexicalBlock(scope: !2094, file: !68, line: 75, column: 20)
!2094 = distinct !DILexicalBlock(scope: !2089, file: !68, line: 74, column: 53)
!2095 = !DILocation(line: 75, column: 25, scope: !2093)
!2096 = !DILocation(line: 79, column: 52, scope: !2097)
!2097 = distinct !DILexicalBlock(scope: !2093, file: !68, line: 75, column: 30)
!2098 = !DILocation(line: 0, scope: !1535, inlinedAt: !2099)
!2099 = distinct !DILocation(line: 79, column: 41, scope: !2097)
!2100 = !DILocation(line: 13, column: 10, scope: !1535, inlinedAt: !2099)
!2101 = !DILocation(line: 13, column: 7, scope: !1535, inlinedAt: !2099)
!2102 = !DILocation(line: 16, column: 17, scope: !1535, inlinedAt: !2099)
!2103 = !DILocation(line: 17, column: 13, scope: !1535, inlinedAt: !2099)
!2104 = !DILocation(line: 17, column: 17, scope: !1535, inlinedAt: !2099)
!2105 = !DILocation(line: 17, column: 7, scope: !1535, inlinedAt: !2099)
!2106 = !DILocation(line: 18, column: 13, scope: !1535, inlinedAt: !2099)
!2107 = !DILocation(line: 18, column: 17, scope: !1535, inlinedAt: !2099)
!2108 = !DILocation(line: 18, column: 7, scope: !1535, inlinedAt: !2099)
!2109 = !DILocation(line: 19, column: 13, scope: !1535, inlinedAt: !2099)
!2110 = !DILocation(line: 19, column: 17, scope: !1535, inlinedAt: !2099)
!2111 = !DILocation(line: 19, column: 7, scope: !1535, inlinedAt: !2099)
!2112 = !DILocation(line: 23, column: 37, scope: !1535, inlinedAt: !2099)
!2113 = !DILocation(line: 23, column: 52, scope: !1535, inlinedAt: !2099)
!2114 = !DILocation(line: 23, column: 43, scope: !1535, inlinedAt: !2099)
!2115 = !DILocation(line: 23, column: 59, scope: !1535, inlinedAt: !2099)
!2116 = !DILocation(line: 79, column: 34, scope: !2097)
!2117 = !DILocation(line: 79, column: 21, scope: !2097)
!2118 = !DILocation(line: 79, column: 38, scope: !2097)
!2119 = !DILocation(line: 81, column: 17, scope: !2097)
!2120 = !DILocation(line: 86, column: 52, scope: !2121)
!2121 = distinct !DILexicalBlock(scope: !2093, file: !68, line: 82, column: 22)
!2122 = !DILocation(line: 0, scope: !1535, inlinedAt: !2123)
!2123 = distinct !DILocation(line: 86, column: 41, scope: !2121)
!2124 = !DILocation(line: 13, column: 10, scope: !1535, inlinedAt: !2123)
!2125 = !DILocation(line: 13, column: 7, scope: !1535, inlinedAt: !2123)
!2126 = !DILocation(line: 16, column: 17, scope: !1535, inlinedAt: !2123)
!2127 = !DILocation(line: 17, column: 13, scope: !1535, inlinedAt: !2123)
!2128 = !DILocation(line: 17, column: 17, scope: !1535, inlinedAt: !2123)
!2129 = !DILocation(line: 17, column: 7, scope: !1535, inlinedAt: !2123)
!2130 = !DILocation(line: 18, column: 13, scope: !1535, inlinedAt: !2123)
!2131 = !DILocation(line: 18, column: 17, scope: !1535, inlinedAt: !2123)
!2132 = !DILocation(line: 18, column: 7, scope: !1535, inlinedAt: !2123)
!2133 = !DILocation(line: 19, column: 13, scope: !1535, inlinedAt: !2123)
!2134 = !DILocation(line: 19, column: 17, scope: !1535, inlinedAt: !2123)
!2135 = !DILocation(line: 19, column: 7, scope: !1535, inlinedAt: !2123)
!2136 = !DILocation(line: 23, column: 37, scope: !1535, inlinedAt: !2123)
!2137 = !DILocation(line: 23, column: 52, scope: !1535, inlinedAt: !2123)
!2138 = !DILocation(line: 23, column: 43, scope: !1535, inlinedAt: !2123)
!2139 = !DILocation(line: 23, column: 59, scope: !1535, inlinedAt: !2123)
!2140 = !DILocation(line: 86, column: 73, scope: !2121)
!2141 = !DILocation(line: 86, column: 34, scope: !2121)
!2142 = !DILocation(line: 86, column: 21, scope: !2121)
!2143 = !DILocation(line: 86, column: 38, scope: !2121)
!2144 = !DILocation(line: 74, column: 49, scope: !2089)
!2145 = !DILocation(line: 74, column: 13, scope: !2089)
!2146 = distinct !{!2146, !2071, !2147, !300}
!2147 = !DILocation(line: 89, column: 13, scope: !2072)
!2148 = !DILocation(line: 92, scope: !2091)
!2149 = !DILocalVariable(name: "k", scope: !2091, file: !68, line: 92, type: !58)
!2150 = !DILocation(line: 0, scope: !2091)
!2151 = !DILocation(line: 92, column: 31, scope: !2152)
!2152 = distinct !DILexicalBlock(scope: !2091, file: !68, line: 92, column: 13)
!2153 = !DILocation(line: 93, column: 36, scope: !2154)
!2154 = distinct !DILexicalBlock(scope: !2152, file: !68, line: 92, column: 51)
!2155 = !DILocation(line: 93, column: 49, scope: !2154)
!2156 = !DILocation(line: 93, column: 28, scope: !2154)
!2157 = !DILocation(line: 93, column: 78, scope: !2154)
!2158 = !DILocation(line: 93, column: 91, scope: !2154)
!2159 = !DILocation(line: 93, column: 104, scope: !2154)
!2160 = !DILocation(line: 93, column: 83, scope: !2154)
!2161 = !DILocation(line: 93, column: 82, scope: !2154)
!2162 = !DILocation(line: 93, column: 73, scope: !2154)
!2163 = !DILocation(line: 93, column: 17, scope: !2154)
!2164 = !DILocation(line: 93, column: 25, scope: !2154)
!2165 = !DILocation(line: 92, column: 48, scope: !2152)
!2166 = !DILocation(line: 92, column: 13, scope: !2152)
!2167 = distinct !{!2167, !2090, !2168, !300}
!2168 = !DILocation(line: 94, column: 13, scope: !2091)
!2169 = !DILocation(line: 65, column: 42, scope: !2054)
!2170 = !DILocation(line: 65, column: 9, scope: !2054)
!2171 = distinct !{!2171, !2045, !2172, !300}
!2172 = !DILocation(line: 95, column: 9, scope: !2046)
!2173 = !DILocation(line: 64, column: 44, scope: !2043)
!2174 = !DILocation(line: 64, column: 5, scope: !2043)
!2175 = distinct !{!2175, !2044, !2176, !300}
!2176 = !DILocation(line: 96, column: 5, scope: !2038)
!2177 = !DILocation(line: 99, scope: !2049)
!2178 = !DILocalVariable(name: "i", scope: !2049, file: !68, line: 99, type: !86)
!2179 = !DILocation(line: 0, scope: !2049)
!2180 = !DILocation(line: 99, column: 23, scope: !2181)
!2181 = distinct !DILexicalBlock(scope: !2049, file: !68, line: 99, column: 5)
!2182 = !DILocation(line: 105, column: 18, scope: !2183)
!2183 = distinct !DILexicalBlock(scope: !2181, file: !68, line: 100, column: 5)
!2184 = !DILocation(line: 105, column: 40, scope: !2183)
!2185 = !DILocation(line: 105, column: 28, scope: !2183)
!2186 = !DILocation(line: 105, column: 44, scope: !2183)
!2187 = !DILocation(line: 105, column: 25, scope: !2183)
!2188 = !DILocation(line: 105, column: 9, scope: !2183)
!2189 = !DILocation(line: 105, column: 16, scope: !2183)
!2190 = !DILocation(line: 106, column: 21, scope: !2183)
!2191 = !DILocation(line: 106, column: 18, scope: !2183)
!2192 = !DILocation(line: 106, column: 40, scope: !2183)
!2193 = !DILocation(line: 106, column: 28, scope: !2183)
!2194 = !DILocation(line: 106, column: 44, scope: !2183)
!2195 = !DILocation(line: 106, column: 25, scope: !2183)
!2196 = !DILocation(line: 106, column: 12, scope: !2183)
!2197 = !DILocation(line: 106, column: 9, scope: !2183)
!2198 = !DILocation(line: 106, column: 16, scope: !2183)
!2199 = !DILocation(line: 99, column: 38, scope: !2181)
!2200 = !DILocation(line: 99, column: 5, scope: !2181)
!2201 = distinct !{!2201, !2048, !2202, !300}
!2202 = !DILocation(line: 108, column: 5, scope: !2049)
!2203 = !DILocation(line: 109, column: 1, scope: !2004)
!2204 = distinct !DISubprogram(name: "pqmayo_MAYO_5_ref_mayo_sign", scope: !68, file: !68, line: 502, type: !339, scopeLine: 504, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2205 = !DILocalVariable(name: "p", arg: 1, scope: !2204, file: !68, line: 502, type: !193)
!2206 = !DILocation(line: 0, scope: !2204)
!2207 = !DILocalVariable(name: "sm", arg: 2, scope: !2204, file: !68, line: 502, type: !61)
!2208 = !DILocalVariable(name: "smlen", arg: 3, scope: !2204, file: !68, line: 503, type: !341)
!2209 = !DILocalVariable(name: "m", arg: 4, scope: !2204, file: !68, line: 503, type: !90)
!2210 = !DILocalVariable(name: "mlen", arg: 5, scope: !2204, file: !68, line: 504, type: !58)
!2211 = !DILocalVariable(name: "csk", arg: 6, scope: !2204, file: !68, line: 504, type: !90)
!2212 = !DILocalVariable(name: "ret", scope: !2204, file: !68, line: 505, type: !86)
!2213 = !DILocalVariable(name: "param_sig_bytes", scope: !2204, file: !68, line: 506, type: !275)
!2214 = !DILocation(line: 508, column: 16, scope: !2204)
!2215 = !DILocation(line: 508, column: 5, scope: !2204)
!2216 = !DILocation(line: 509, column: 50, scope: !2204)
!2217 = !DILocalVariable(name: "siglen", scope: !2204, file: !68, line: 507, type: !58)
!2218 = !DILocation(line: 509, column: 11, scope: !2204)
!2219 = !DILocation(line: 510, column: 13, scope: !2220)
!2220 = distinct !DILexicalBlock(scope: !2204, file: !68, line: 510, column: 9)
!2221 = !DILocation(line: 510, column: 24, scope: !2220)
!2222 = !DILocation(line: 511, column: 23, scope: !2223)
!2223 = distinct !DILexicalBlock(scope: !2220, file: !68, line: 510, column: 62)
!2224 = !DILocation(line: 511, column: 30, scope: !2223)
!2225 = !DILocation(line: 511, column: 9, scope: !2223)
!2226 = !DILocation(line: 512, column: 9, scope: !2223)
!2227 = !DILocation(line: 515, column: 14, scope: !2204)
!2228 = !DILocation(line: 515, column: 21, scope: !2204)
!2229 = !DILocation(line: 515, column: 12, scope: !2204)
!2230 = !DILocation(line: 515, column: 5, scope: !2204)
!2231 = !DILabel(scope: !2204, name: "err", file: !68, line: 516)
!2232 = !DILocation(line: 516, column: 1, scope: !2204)
!2233 = !DILocation(line: 517, column: 5, scope: !2204)
!2234 = !DILocation(line: 0, scope: !338)
!2235 = !DILocation(line: 524, column: 15, scope: !351)
!2236 = !DILocation(line: 527, column: 36, scope: !338)
!2237 = !DILocation(line: 527, column: 61, scope: !338)
!2238 = !DILocation(line: 527, column: 18, scope: !338)
!2239 = !DILocation(line: 530, column: 16, scope: !357)
!2240 = !DILocation(line: 531, column: 23, scope: !359)
!2241 = !DILocation(line: 531, column: 15, scope: !359)
!2242 = !DILocation(line: 532, column: 23, scope: !359)
!2243 = !DILocation(line: 532, column: 9, scope: !359)
!2244 = !DILocation(line: 533, column: 5, scope: !359)
!2245 = !DILocation(line: 536, column: 1, scope: !338)
!2246 = distinct !DISubprogram(name: "pqmayo_MAYO_5_ref_mayo_verify", scope: !68, file: !68, line: 617, type: !2247, scopeLine: 619, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2247 = !DISubroutineType(types: !2248)
!2248 = !{!86, !193, !90, !58, !90, !90}
!2249 = !DILocalVariable(name: "p", arg: 1, scope: !2246, file: !68, line: 617, type: !193)
!2250 = !DILocation(line: 0, scope: !2246)
!2251 = !DILocalVariable(name: "m", arg: 2, scope: !2246, file: !68, line: 617, type: !90)
!2252 = !DILocalVariable(name: "mlen", arg: 3, scope: !2246, file: !68, line: 618, type: !58)
!2253 = !DILocalVariable(name: "sig", arg: 4, scope: !2246, file: !68, line: 618, type: !90)
!2254 = !DILocalVariable(name: "cpk", arg: 5, scope: !2246, file: !68, line: 619, type: !90)
!2255 = !DILocalVariable(name: "tEnc", scope: !2246, file: !68, line: 620, type: !879)
!2256 = !DILocation(line: 620, column: 19, scope: !2246)
!2257 = !DILocalVariable(name: "t", scope: !2246, file: !68, line: 621, type: !884)
!2258 = !DILocation(line: 621, column: 19, scope: !2246)
!2259 = !DILocalVariable(name: "y", scope: !2246, file: !68, line: 622, type: !2260)
!2260 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 2272, elements: !2261)
!2261 = !{!2262}
!2262 = !DISubrange(count: 284)
!2263 = !DILocation(line: 622, column: 19, scope: !2246)
!2264 = !DILocalVariable(name: "s", scope: !2246, file: !68, line: 623, type: !908)
!2265 = !DILocation(line: 623, column: 19, scope: !2246)
!2266 = !DILocalVariable(name: "pk", scope: !2246, file: !68, line: 624, type: !2267)
!2267 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 6874560, elements: !2268)
!2268 = !{!2269}
!2269 = !DISubrange(count: 107415)
!2270 = !DILocation(line: 624, column: 14, scope: !2246)
!2271 = !DILocalVariable(name: "tmp", scope: !2246, file: !68, line: 625, type: !2272)
!2272 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 832, elements: !2273)
!2273 = !{!2274}
!2274 = !DISubrange(count: 104)
!2275 = !DILocation(line: 625, column: 19, scope: !2246)
!2276 = !DILocalVariable(name: "param_m", scope: !2246, file: !68, line: 627, type: !275)
!2277 = !DILocalVariable(name: "param_n", scope: !2246, file: !68, line: 628, type: !275)
!2278 = !DILocalVariable(name: "param_k", scope: !2246, file: !68, line: 629, type: !275)
!2279 = !DILocalVariable(name: "param_m_bytes", scope: !2246, file: !68, line: 630, type: !275)
!2280 = !DILocalVariable(name: "param_sig_bytes", scope: !2246, file: !68, line: 631, type: !275)
!2281 = !DILocalVariable(name: "param_digest_bytes", scope: !2246, file: !68, line: 632, type: !275)
!2282 = !DILocalVariable(name: "param_salt_bytes", scope: !2246, file: !68, line: 633, type: !275)
!2283 = !DILocation(line: 0, scope: !248, inlinedAt: !2284)
!2284 = distinct !DILocation(line: 635, column: 15, scope: !2246)
!2285 = !DILocation(line: 0, scope: !256, inlinedAt: !2286)
!2286 = distinct !DILocation(line: 610, column: 5, scope: !248, inlinedAt: !2284)
!2287 = !DILocation(line: 284, column: 5, scope: !256, inlinedAt: !2286)
!2288 = !DILocation(line: 265, column: 14, scope: !265, inlinedAt: !2289)
!2289 = distinct !DILocation(line: 285, column: 5, scope: !256, inlinedAt: !2286)
!2290 = !DILocation(line: 0, scope: !265, inlinedAt: !2289)
!2291 = !DILocation(line: 0, scope: !282, inlinedAt: !2289)
!2292 = !DILocation(line: 266, column: 10, scope: !282, inlinedAt: !2289)
!2293 = !DILocation(line: 266, column: 28, scope: !286, inlinedAt: !2289)
!2294 = !DILocation(line: 266, column: 5, scope: !282, inlinedAt: !2289)
!2295 = !DILocation(line: 266, scope: !282, inlinedAt: !2289)
!2296 = !DILocation(line: 268, column: 27, scope: !290, inlinedAt: !2289)
!2297 = !DILocation(line: 268, column: 29, scope: !290, inlinedAt: !2289)
!2298 = !DILocation(line: 268, column: 24, scope: !290, inlinedAt: !2289)
!2299 = !DILocation(line: 268, column: 9, scope: !290, inlinedAt: !2289)
!2300 = !DILocation(line: 269, column: 36, scope: !290, inlinedAt: !2289)
!2301 = !DILocation(line: 269, column: 21, scope: !290, inlinedAt: !2289)
!2302 = !DILocation(line: 269, column: 9, scope: !290, inlinedAt: !2289)
!2303 = !DILocation(line: 266, column: 5, scope: !286, inlinedAt: !2289)
!2304 = distinct !{!2304, !2294, !2305, !300}
!2305 = !DILocation(line: 270, column: 5, scope: !282, inlinedAt: !2289)
!2306 = !DILocation(line: 271, column: 1, scope: !265, inlinedAt: !2289)
!2307 = !DILocation(line: 612, column: 23, scope: !248, inlinedAt: !2284)
!2308 = !DILocation(line: 612, column: 72, scope: !248, inlinedAt: !2284)
!2309 = !DILocation(line: 265, column: 14, scope: !265, inlinedAt: !2310)
!2310 = distinct !DILocation(line: 612, column: 5, scope: !248, inlinedAt: !2284)
!2311 = !DILocation(line: 0, scope: !265, inlinedAt: !2310)
!2312 = !DILocation(line: 0, scope: !282, inlinedAt: !2310)
!2313 = !DILocation(line: 266, column: 10, scope: !282, inlinedAt: !2310)
!2314 = !DILocation(line: 266, column: 28, scope: !286, inlinedAt: !2310)
!2315 = !DILocation(line: 266, column: 5, scope: !282, inlinedAt: !2310)
!2316 = !DILocation(line: 266, scope: !282, inlinedAt: !2310)
!2317 = !DILocation(line: 268, column: 27, scope: !290, inlinedAt: !2310)
!2318 = !DILocation(line: 268, column: 29, scope: !290, inlinedAt: !2310)
!2319 = !DILocation(line: 268, column: 24, scope: !290, inlinedAt: !2310)
!2320 = !DILocation(line: 268, column: 9, scope: !290, inlinedAt: !2310)
!2321 = !DILocation(line: 269, column: 36, scope: !290, inlinedAt: !2310)
!2322 = !DILocation(line: 269, column: 21, scope: !290, inlinedAt: !2310)
!2323 = !DILocation(line: 269, column: 9, scope: !290, inlinedAt: !2310)
!2324 = !DILocation(line: 266, column: 5, scope: !286, inlinedAt: !2310)
!2325 = distinct !{!2325, !2315, !2326, !300}
!2326 = !DILocation(line: 270, column: 5, scope: !282, inlinedAt: !2310)
!2327 = !DILocation(line: 271, column: 1, scope: !265, inlinedAt: !2310)
!2328 = !DILocalVariable(name: "ret", scope: !2246, file: !68, line: 635, type: !86)
!2329 = !DILocalVariable(name: "P1", scope: !2246, file: !68, line: 640, type: !52)
!2330 = !DILocation(line: 641, column: 23, scope: !2246)
!2331 = !DILocalVariable(name: "P2", scope: !2246, file: !68, line: 641, type: !52)
!2332 = !DILocalVariable(name: "P3", scope: !2246, file: !68, line: 642, type: !52)
!2333 = !DILocation(line: 657, column: 5, scope: !2246)
!2334 = !DILocation(line: 660, column: 16, scope: !2246)
!2335 = !DILocation(line: 660, column: 60, scope: !2246)
!2336 = !DILocation(line: 660, column: 5, scope: !2246)
!2337 = !DILocation(line: 662, column: 5, scope: !2246)
!2338 = !DILocation(line: 0, scope: !435, inlinedAt: !2339)
!2339 = distinct !DILocation(line: 663, column: 5, scope: !2246)
!2340 = !DILocation(line: 22, column: 10, scope: !444, inlinedAt: !2339)
!2341 = !DILocation(line: 22, scope: !444, inlinedAt: !2339)
!2342 = !DILocation(line: 22, column: 19, scope: !447, inlinedAt: !2339)
!2343 = !DILocation(line: 22, column: 5, scope: !444, inlinedAt: !2339)
!2344 = !DILocation(line: 22, column: 5, scope: !444, inlinedAt: !2345)
!2345 = distinct !DILocation(line: 666, column: 5, scope: !2246)
!2346 = !DILocation(line: 23, column: 19, scope: !450, inlinedAt: !2339)
!2347 = !DILocation(line: 23, column: 24, scope: !450, inlinedAt: !2339)
!2348 = !DILocation(line: 23, column: 14, scope: !450, inlinedAt: !2339)
!2349 = !DILocation(line: 23, column: 17, scope: !450, inlinedAt: !2339)
!2350 = !DILocation(line: 24, column: 24, scope: !450, inlinedAt: !2339)
!2351 = !DILocation(line: 24, column: 17, scope: !450, inlinedAt: !2339)
!2352 = !DILocation(line: 24, column: 14, scope: !450, inlinedAt: !2339)
!2353 = !DILocation(line: 22, column: 34, scope: !447, inlinedAt: !2339)
!2354 = !DILocation(line: 22, column: 5, scope: !447, inlinedAt: !2339)
!2355 = distinct !{!2355, !2343, !2356, !300}
!2356 = !DILocation(line: 25, column: 5, scope: !444, inlinedAt: !2339)
!2357 = !DILocation(line: 22, scope: !444, inlinedAt: !2345)
!2358 = !DILocation(line: 0, scope: !435, inlinedAt: !2345)
!2359 = !DILocation(line: 22, column: 19, scope: !447, inlinedAt: !2345)
!2360 = !DILocation(line: 23, column: 19, scope: !450, inlinedAt: !2345)
!2361 = !DILocation(line: 23, column: 24, scope: !450, inlinedAt: !2345)
!2362 = !DILocation(line: 23, column: 14, scope: !450, inlinedAt: !2345)
!2363 = !DILocation(line: 23, column: 17, scope: !450, inlinedAt: !2345)
!2364 = !DILocation(line: 24, column: 24, scope: !450, inlinedAt: !2345)
!2365 = !DILocation(line: 24, column: 17, scope: !450, inlinedAt: !2345)
!2366 = !DILocation(line: 24, column: 14, scope: !450, inlinedAt: !2345)
!2367 = !DILocation(line: 22, column: 34, scope: !447, inlinedAt: !2345)
!2368 = !DILocation(line: 22, column: 5, scope: !447, inlinedAt: !2345)
!2369 = distinct !{!2369, !2344, !2370, !300}
!2370 = !DILocation(line: 25, column: 5, scope: !444, inlinedAt: !2345)
!2371 = !DILocation(line: 289, column: 14, scope: !2372, inlinedAt: !2375)
!2372 = distinct !DISubprogram(name: "eval_public_map", scope: !68, file: !68, line: 288, type: !2373, scopeLine: 288, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2373 = !DISubroutineType(types: !2374)
!2374 = !{null, !193, !90, !488, !488, !488, !61}
!2375 = distinct !DILocation(line: 668, column: 5, scope: !2246)
!2376 = !DILocalVariable(name: "p", arg: 1, scope: !2372, file: !68, line: 288, type: !193)
!2377 = !DILocation(line: 0, scope: !2372, inlinedAt: !2375)
!2378 = !DILocalVariable(name: "s", arg: 2, scope: !2372, file: !68, line: 288, type: !90)
!2379 = !DILocalVariable(name: "P1", arg: 3, scope: !2372, file: !68, line: 288, type: !488)
!2380 = !DILocalVariable(name: "P2", arg: 4, scope: !2372, file: !68, line: 288, type: !488)
!2381 = !DILocalVariable(name: "P3", arg: 5, scope: !2372, file: !68, line: 288, type: !488)
!2382 = !DILocalVariable(name: "eval", arg: 6, scope: !2372, file: !68, line: 288, type: !61)
!2383 = !DILocalVariable(name: "SPS", scope: !2372, file: !68, line: 289, type: !409)
!2384 = !DILocation(line: 286, column: 14, scope: !2385, inlinedAt: !2388)
!2385 = distinct !DISubprogram(name: "m_calculate_PS_SPS", scope: !485, file: !485, line: 277, type: !2386, scopeLine: 278, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2386 = !DISubroutineType(types: !2387)
!2387 = !{null, !193, !488, !488, !488, !90, !52}
!2388 = distinct !DILocation(line: 291, column: 5, scope: !2372, inlinedAt: !2375)
!2389 = !DILocalVariable(name: "p", arg: 1, scope: !2385, file: !485, line: 277, type: !193)
!2390 = !DILocation(line: 0, scope: !2385, inlinedAt: !2388)
!2391 = !DILocalVariable(name: "P1", arg: 2, scope: !2385, file: !485, line: 277, type: !488)
!2392 = !DILocalVariable(name: "P2", arg: 3, scope: !2385, file: !485, line: 277, type: !488)
!2393 = !DILocalVariable(name: "P3", arg: 4, scope: !2385, file: !485, line: 277, type: !488)
!2394 = !DILocalVariable(name: "s", arg: 5, scope: !2385, file: !485, line: 277, type: !90)
!2395 = !DILocalVariable(name: "SPS", arg: 6, scope: !2385, file: !485, line: 278, type: !52)
!2396 = !DILocalVariable(name: "PS", scope: !2385, file: !485, line: 286, type: !2397)
!2397 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 1064448, elements: !2398)
!2398 = !{!2399}
!2399 = !DISubrange(count: 16632)
!2400 = !DILocation(line: 157, column: 14, scope: !2401, inlinedAt: !2404)
!2401 = distinct !DISubprogram(name: "mayo_generic_m_calculate_PS", scope: !485, file: !485, line: 151, type: !2402, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2402 = !DISubroutineType(types: !2403)
!2403 = !{null, !488, !488, !488, !90, !275, !275, !275, !275, !52}
!2404 = distinct !DILocation(line: 287, column: 5, scope: !2385, inlinedAt: !2388)
!2405 = !DILocalVariable(name: "P1", arg: 1, scope: !2401, file: !485, line: 151, type: !488)
!2406 = !DILocation(line: 0, scope: !2401, inlinedAt: !2404)
!2407 = !DILocalVariable(name: "P2", arg: 2, scope: !2401, file: !485, line: 151, type: !488)
!2408 = !DILocalVariable(name: "P3", arg: 3, scope: !2401, file: !485, line: 151, type: !488)
!2409 = !DILocalVariable(name: "S", arg: 4, scope: !2401, file: !485, line: 151, type: !90)
!2410 = !DILocalVariable(name: "m", arg: 5, scope: !2401, file: !485, line: 152, type: !275)
!2411 = !DILocalVariable(name: "v", arg: 6, scope: !2401, file: !485, line: 152, type: !275)
!2412 = !DILocalVariable(name: "o", arg: 7, scope: !2401, file: !485, line: 152, type: !275)
!2413 = !DILocalVariable(name: "k", arg: 8, scope: !2401, file: !485, line: 152, type: !275)
!2414 = !DILocalVariable(name: "PS", arg: 9, scope: !2401, file: !485, line: 152, type: !52)
!2415 = !DILocalVariable(name: "n", scope: !2401, file: !485, line: 154, type: !275)
!2416 = !DILocalVariable(name: "m_vec_limbs", scope: !2401, file: !485, line: 155, type: !275)
!2417 = !DILocalVariable(name: "accumulator", scope: !2401, file: !485, line: 157, type: !2418)
!2418 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 17031168, elements: !2419)
!2419 = !{!2420}
!2420 = !DISubrange(count: 266112)
!2421 = !DILocalVariable(name: "P1_used", scope: !2401, file: !485, line: 158, type: !86)
!2422 = !DILocalVariable(name: "row", scope: !2423, file: !485, line: 159, type: !86)
!2423 = distinct !DILexicalBlock(scope: !2401, file: !485, line: 159, column: 5)
!2424 = !DILocation(line: 0, scope: !2423, inlinedAt: !2404)
!2425 = !DILocation(line: 159, column: 10, scope: !2423, inlinedAt: !2404)
!2426 = !DILocation(line: 158, column: 9, scope: !2401, inlinedAt: !2404)
!2427 = !DILocation(line: 159, scope: !2423, inlinedAt: !2404)
!2428 = !DILocation(line: 159, column: 27, scope: !2429, inlinedAt: !2404)
!2429 = distinct !DILexicalBlock(scope: !2423, file: !485, line: 159, column: 5)
!2430 = !DILocation(line: 159, column: 5, scope: !2423, inlinedAt: !2404)
!2431 = !DILocation(line: 160, column: 9, scope: !2432, inlinedAt: !2404)
!2432 = distinct !DILexicalBlock(scope: !2433, file: !485, line: 160, column: 9)
!2433 = distinct !DILexicalBlock(scope: !2429, file: !485, line: 159, column: 39)
!2434 = !DILocation(line: 642, column: 23, scope: !2246)
!2435 = !DILocation(line: 175, column: 5, scope: !2436, inlinedAt: !2404)
!2436 = distinct !DILexicalBlock(scope: !2401, file: !485, line: 175, column: 5)
!2437 = !DILocation(line: 160, scope: !2432, inlinedAt: !2404)
!2438 = !DILocalVariable(name: "j", scope: !2432, file: !485, line: 160, type: !86)
!2439 = !DILocation(line: 0, scope: !2432, inlinedAt: !2404)
!2440 = !DILocation(line: 160, column: 29, scope: !2441, inlinedAt: !2404)
!2441 = distinct !DILexicalBlock(scope: !2432, file: !485, line: 160, column: 9)
!2442 = !DILocation(line: 167, column: 9, scope: !2443, inlinedAt: !2404)
!2443 = distinct !DILexicalBlock(scope: !2433, file: !485, line: 167, column: 9)
!2444 = !DILocation(line: 161, column: 13, scope: !2445, inlinedAt: !2404)
!2445 = distinct !DILexicalBlock(scope: !2446, file: !485, line: 161, column: 13)
!2446 = distinct !DILexicalBlock(scope: !2441, file: !485, line: 160, column: 39)
!2447 = !DILocation(line: 161, scope: !2445, inlinedAt: !2404)
!2448 = !DILocalVariable(name: "col", scope: !2445, file: !485, line: 161, type: !86)
!2449 = !DILocation(line: 0, scope: !2445, inlinedAt: !2404)
!2450 = !DILocation(line: 161, column: 35, scope: !2451, inlinedAt: !2404)
!2451 = distinct !DILexicalBlock(scope: !2445, file: !485, line: 161, column: 13)
!2452 = !DILocation(line: 162, column: 43, scope: !2453, inlinedAt: !2404)
!2453 = distinct !DILexicalBlock(scope: !2451, file: !485, line: 161, column: 47)
!2454 = !DILocation(line: 162, column: 91, scope: !2453, inlinedAt: !2404)
!2455 = !DILocation(line: 162, column: 95, scope: !2453, inlinedAt: !2404)
!2456 = !DILocation(line: 162, column: 102, scope: !2453, inlinedAt: !2404)
!2457 = !DILocation(line: 162, column: 115, scope: !2453, inlinedAt: !2404)
!2458 = !DILocation(line: 162, column: 109, scope: !2453, inlinedAt: !2404)
!2459 = !DILocation(line: 162, column: 107, scope: !2453, inlinedAt: !2404)
!2460 = !DILocation(line: 162, column: 82, scope: !2453, inlinedAt: !2404)
!2461 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2462, file: !660, line: 22, type: !86)
!2462 = distinct !DISubprogram(name: "m_vec_add", scope: !660, file: !660, line: 22, type: !2463, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2463 = !DISubroutineType(types: !2464)
!2464 = !{null, !86, !488, !52}
!2465 = !DILocation(line: 0, scope: !2462, inlinedAt: !2466)
!2466 = distinct !DILocation(line: 162, column: 17, scope: !2453, inlinedAt: !2404)
!2467 = !DILocalVariable(name: "in", arg: 2, scope: !2462, file: !660, line: 22, type: !488)
!2468 = !DILocalVariable(name: "acc", arg: 3, scope: !2462, file: !660, line: 22, type: !52)
!2469 = !DILocalVariable(name: "i", scope: !2470, file: !660, line: 24, type: !58)
!2470 = distinct !DILexicalBlock(scope: !2462, file: !660, line: 24, column: 5)
!2471 = !DILocation(line: 0, scope: !2470, inlinedAt: !2466)
!2472 = !DILocation(line: 24, column: 10, scope: !2470, inlinedAt: !2466)
!2473 = !DILocation(line: 24, scope: !2470, inlinedAt: !2466)
!2474 = !DILocation(line: 24, column: 26, scope: !2475, inlinedAt: !2466)
!2475 = distinct !DILexicalBlock(scope: !2470, file: !660, line: 24, column: 5)
!2476 = !DILocation(line: 24, column: 5, scope: !2470, inlinedAt: !2466)
!2477 = !DILocation(line: 26, column: 19, scope: !2478, inlinedAt: !2466)
!2478 = distinct !DILexicalBlock(scope: !2475, file: !660, line: 25, column: 5)
!2479 = !DILocation(line: 26, column: 9, scope: !2478, inlinedAt: !2466)
!2480 = !DILocation(line: 26, column: 16, scope: !2478, inlinedAt: !2466)
!2481 = !DILocation(line: 24, column: 46, scope: !2475, inlinedAt: !2466)
!2482 = !DILocation(line: 24, column: 5, scope: !2475, inlinedAt: !2466)
!2483 = distinct !{!2483, !2476, !2484, !300}
!2484 = !DILocation(line: 27, column: 5, scope: !2470, inlinedAt: !2466)
!2485 = !DILocation(line: 161, column: 43, scope: !2451, inlinedAt: !2404)
!2486 = !DILocation(line: 161, column: 13, scope: !2451, inlinedAt: !2404)
!2487 = distinct !{!2487, !2444, !2488, !300}
!2488 = !DILocation(line: 163, column: 13, scope: !2445, inlinedAt: !2404)
!2489 = !DILocation(line: 164, column: 21, scope: !2446, inlinedAt: !2404)
!2490 = !DILocation(line: 160, column: 35, scope: !2441, inlinedAt: !2404)
!2491 = !DILocation(line: 160, column: 9, scope: !2441, inlinedAt: !2404)
!2492 = distinct !{!2492, !2431, !2493, !300}
!2493 = !DILocation(line: 165, column: 9, scope: !2432, inlinedAt: !2404)
!2494 = !DILocation(line: 167, scope: !2443, inlinedAt: !2404)
!2495 = !DILocalVariable(name: "j", scope: !2443, file: !485, line: 167, type: !86)
!2496 = !DILocation(line: 0, scope: !2443, inlinedAt: !2404)
!2497 = !DILocation(line: 167, column: 27, scope: !2498, inlinedAt: !2404)
!2498 = distinct !DILexicalBlock(scope: !2443, file: !485, line: 167, column: 9)
!2499 = !DILocation(line: 168, column: 13, scope: !2500, inlinedAt: !2404)
!2500 = distinct !DILexicalBlock(scope: !2501, file: !485, line: 168, column: 13)
!2501 = distinct !DILexicalBlock(scope: !2498, file: !485, line: 167, column: 37)
!2502 = !DILocation(line: 168, scope: !2500, inlinedAt: !2404)
!2503 = !DILocalVariable(name: "col", scope: !2500, file: !485, line: 168, type: !86)
!2504 = !DILocation(line: 0, scope: !2500, inlinedAt: !2404)
!2505 = !DILocation(line: 168, column: 35, scope: !2506, inlinedAt: !2404)
!2506 = distinct !DILexicalBlock(scope: !2500, file: !485, line: 168, column: 13)
!2507 = !DILocation(line: 169, column: 50, scope: !2508, inlinedAt: !2404)
!2508 = distinct !DILexicalBlock(scope: !2506, file: !485, line: 168, column: 47)
!2509 = !DILocation(line: 169, column: 54, scope: !2508, inlinedAt: !2404)
!2510 = !DILocation(line: 169, column: 43, scope: !2508, inlinedAt: !2404)
!2511 = !DILocation(line: 169, column: 93, scope: !2508, inlinedAt: !2404)
!2512 = !DILocation(line: 169, column: 97, scope: !2508, inlinedAt: !2404)
!2513 = !DILocation(line: 169, column: 104, scope: !2508, inlinedAt: !2404)
!2514 = !DILocation(line: 169, column: 118, scope: !2508, inlinedAt: !2404)
!2515 = !DILocation(line: 169, column: 111, scope: !2508, inlinedAt: !2404)
!2516 = !DILocation(line: 169, column: 109, scope: !2508, inlinedAt: !2404)
!2517 = !DILocation(line: 169, column: 84, scope: !2508, inlinedAt: !2404)
!2518 = !DILocation(line: 0, scope: !2462, inlinedAt: !2519)
!2519 = distinct !DILocation(line: 169, column: 17, scope: !2508, inlinedAt: !2404)
!2520 = !DILocation(line: 0, scope: !2470, inlinedAt: !2519)
!2521 = !DILocation(line: 24, column: 10, scope: !2470, inlinedAt: !2519)
!2522 = !DILocation(line: 24, scope: !2470, inlinedAt: !2519)
!2523 = !DILocation(line: 24, column: 26, scope: !2475, inlinedAt: !2519)
!2524 = !DILocation(line: 24, column: 5, scope: !2470, inlinedAt: !2519)
!2525 = !DILocation(line: 26, column: 19, scope: !2478, inlinedAt: !2519)
!2526 = !DILocation(line: 26, column: 9, scope: !2478, inlinedAt: !2519)
!2527 = !DILocation(line: 26, column: 16, scope: !2478, inlinedAt: !2519)
!2528 = !DILocation(line: 24, column: 46, scope: !2475, inlinedAt: !2519)
!2529 = !DILocation(line: 24, column: 5, scope: !2475, inlinedAt: !2519)
!2530 = distinct !{!2530, !2524, !2531, !300}
!2531 = !DILocation(line: 27, column: 5, scope: !2470, inlinedAt: !2519)
!2532 = !DILocation(line: 168, column: 43, scope: !2506, inlinedAt: !2404)
!2533 = !DILocation(line: 168, column: 13, scope: !2506, inlinedAt: !2404)
!2534 = distinct !{!2534, !2499, !2535, !300}
!2535 = !DILocation(line: 170, column: 13, scope: !2500, inlinedAt: !2404)
!2536 = !DILocation(line: 167, column: 33, scope: !2498, inlinedAt: !2404)
!2537 = !DILocation(line: 167, column: 9, scope: !2498, inlinedAt: !2404)
!2538 = distinct !{!2538, !2442, !2539, !300}
!2539 = !DILocation(line: 171, column: 9, scope: !2443, inlinedAt: !2404)
!2540 = !DILocation(line: 159, column: 35, scope: !2429, inlinedAt: !2404)
!2541 = !DILocation(line: 159, column: 5, scope: !2429, inlinedAt: !2404)
!2542 = distinct !{!2542, !2430, !2543, !300}
!2543 = !DILocation(line: 172, column: 5, scope: !2423, inlinedAt: !2404)
!2544 = !DILocation(line: 174, column: 9, scope: !2401, inlinedAt: !2404)
!2545 = !DILocation(line: 175, scope: !2436, inlinedAt: !2404)
!2546 = !DILocalVariable(name: "row", scope: !2436, file: !485, line: 175, type: !86)
!2547 = !DILocation(line: 0, scope: !2436, inlinedAt: !2404)
!2548 = !DILocalVariable(name: "P3_used", scope: !2401, file: !485, line: 174, type: !86)
!2549 = !DILocation(line: 175, column: 27, scope: !2550, inlinedAt: !2404)
!2550 = distinct !DILexicalBlock(scope: !2436, file: !485, line: 175, column: 5)
!2551 = !DILocation(line: 176, column: 9, scope: !2552, inlinedAt: !2404)
!2552 = distinct !DILexicalBlock(scope: !2553, file: !485, line: 176, column: 9)
!2553 = distinct !DILexicalBlock(scope: !2550, file: !485, line: 175, column: 39)
!2554 = !DILocation(line: 186, column: 5, scope: !2401, inlinedAt: !2404)
!2555 = !DILocation(line: 176, scope: !2552, inlinedAt: !2404)
!2556 = !DILocalVariable(name: "j", scope: !2552, file: !485, line: 176, type: !86)
!2557 = !DILocation(line: 0, scope: !2552, inlinedAt: !2404)
!2558 = !DILocation(line: 176, column: 29, scope: !2559, inlinedAt: !2404)
!2559 = distinct !DILexicalBlock(scope: !2552, file: !485, line: 176, column: 9)
!2560 = !DILocation(line: 177, column: 13, scope: !2561, inlinedAt: !2404)
!2561 = distinct !DILexicalBlock(scope: !2562, file: !485, line: 177, column: 13)
!2562 = distinct !DILexicalBlock(scope: !2559, file: !485, line: 176, column: 39)
!2563 = !DILocation(line: 177, scope: !2561, inlinedAt: !2404)
!2564 = !DILocalVariable(name: "col", scope: !2561, file: !485, line: 177, type: !86)
!2565 = !DILocation(line: 0, scope: !2561, inlinedAt: !2404)
!2566 = !DILocation(line: 177, column: 35, scope: !2567, inlinedAt: !2404)
!2567 = distinct !DILexicalBlock(scope: !2561, file: !485, line: 177, column: 13)
!2568 = !DILocation(line: 178, column: 43, scope: !2569, inlinedAt: !2404)
!2569 = distinct !DILexicalBlock(scope: !2567, file: !485, line: 177, column: 47)
!2570 = !DILocation(line: 178, column: 89, scope: !2569, inlinedAt: !2404)
!2571 = !DILocation(line: 178, column: 93, scope: !2569, inlinedAt: !2404)
!2572 = !DILocation(line: 178, column: 100, scope: !2569, inlinedAt: !2404)
!2573 = !DILocation(line: 178, column: 113, scope: !2569, inlinedAt: !2404)
!2574 = !DILocation(line: 178, column: 107, scope: !2569, inlinedAt: !2404)
!2575 = !DILocation(line: 178, column: 105, scope: !2569, inlinedAt: !2404)
!2576 = !DILocation(line: 178, column: 80, scope: !2569, inlinedAt: !2404)
!2577 = !DILocation(line: 0, scope: !2462, inlinedAt: !2578)
!2578 = distinct !DILocation(line: 178, column: 17, scope: !2569, inlinedAt: !2404)
!2579 = !DILocation(line: 0, scope: !2470, inlinedAt: !2578)
!2580 = !DILocation(line: 24, column: 10, scope: !2470, inlinedAt: !2578)
!2581 = !DILocation(line: 24, scope: !2470, inlinedAt: !2578)
!2582 = !DILocation(line: 24, column: 26, scope: !2475, inlinedAt: !2578)
!2583 = !DILocation(line: 24, column: 5, scope: !2470, inlinedAt: !2578)
!2584 = !DILocation(line: 26, column: 19, scope: !2478, inlinedAt: !2578)
!2585 = !DILocation(line: 26, column: 9, scope: !2478, inlinedAt: !2578)
!2586 = !DILocation(line: 26, column: 16, scope: !2478, inlinedAt: !2578)
!2587 = !DILocation(line: 24, column: 46, scope: !2475, inlinedAt: !2578)
!2588 = !DILocation(line: 24, column: 5, scope: !2475, inlinedAt: !2578)
!2589 = distinct !{!2589, !2583, !2590, !300}
!2590 = !DILocation(line: 27, column: 5, scope: !2470, inlinedAt: !2578)
!2591 = !DILocation(line: 177, column: 43, scope: !2567, inlinedAt: !2404)
!2592 = !DILocation(line: 177, column: 13, scope: !2567, inlinedAt: !2404)
!2593 = distinct !{!2593, !2560, !2594, !300}
!2594 = !DILocation(line: 179, column: 13, scope: !2561, inlinedAt: !2404)
!2595 = !DILocation(line: 180, column: 21, scope: !2562, inlinedAt: !2404)
!2596 = !DILocation(line: 176, column: 35, scope: !2559, inlinedAt: !2404)
!2597 = !DILocation(line: 176, column: 9, scope: !2559, inlinedAt: !2404)
!2598 = distinct !{!2598, !2551, !2599, !300}
!2599 = !DILocation(line: 181, column: 9, scope: !2552, inlinedAt: !2404)
!2600 = !DILocation(line: 175, column: 35, scope: !2550, inlinedAt: !2404)
!2601 = !DILocation(line: 175, column: 5, scope: !2550, inlinedAt: !2404)
!2602 = distinct !{!2602, !2435, !2603, !300}
!2603 = !DILocation(line: 182, column: 5, scope: !2436, inlinedAt: !2404)
!2604 = !DILocalVariable(name: "i", scope: !2401, file: !485, line: 185, type: !86)
!2605 = !DILocation(line: 186, column: 14, scope: !2401, inlinedAt: !2404)
!2606 = !DILocation(line: 187, column: 54, scope: !2607, inlinedAt: !2404)
!2607 = distinct !DILexicalBlock(scope: !2401, file: !485, line: 186, column: 23)
!2608 = !DILocation(line: 187, column: 81, scope: !2607, inlinedAt: !2404)
!2609 = !DILocation(line: 187, column: 9, scope: !2607, inlinedAt: !2404)
!2610 = !DILocation(line: 188, column: 10, scope: !2607, inlinedAt: !2404)
!2611 = distinct !{!2611, !2554, !2612, !300}
!2612 = !DILocation(line: 189, column: 5, scope: !2401, inlinedAt: !2404)
!2613 = !DILocation(line: 191, column: 1, scope: !2401, inlinedAt: !2404)
!2614 = !DILocation(line: 196, column: 14, scope: !2615, inlinedAt: !2618)
!2615 = distinct !DISubprogram(name: "mayo_generic_m_calculate_SPS", scope: !485, file: !485, line: 195, type: !2616, scopeLine: 195, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2616 = !DISubroutineType(types: !2617)
!2617 = !{null, !488, !90, !86, !86, !86, !52}
!2618 = distinct !DILocation(line: 290, column: 5, scope: !2385, inlinedAt: !2388)
!2619 = !DILocalVariable(name: "PS", arg: 1, scope: !2615, file: !485, line: 195, type: !488)
!2620 = !DILocation(line: 0, scope: !2615, inlinedAt: !2618)
!2621 = !DILocalVariable(name: "S", arg: 2, scope: !2615, file: !485, line: 195, type: !90)
!2622 = !DILocalVariable(name: "m", arg: 3, scope: !2615, file: !485, line: 195, type: !86)
!2623 = !DILocalVariable(name: "k", arg: 4, scope: !2615, file: !485, line: 195, type: !86)
!2624 = !DILocalVariable(name: "n", arg: 5, scope: !2615, file: !485, line: 195, type: !86)
!2625 = !DILocalVariable(name: "SPS", arg: 6, scope: !2615, file: !485, line: 195, type: !52)
!2626 = !DILocalVariable(name: "accumulator", scope: !2615, file: !485, line: 196, type: !2627)
!2627 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 1327104, elements: !2628)
!2628 = !{!2629}
!2629 = !DISubrange(count: 20736)
!2630 = !DILocalVariable(name: "m_vec_limbs", scope: !2615, file: !485, line: 197, type: !275)
!2631 = !DILocalVariable(name: "row", scope: !2632, file: !485, line: 198, type: !86)
!2632 = distinct !DILexicalBlock(scope: !2615, file: !485, line: 198, column: 5)
!2633 = !DILocation(line: 0, scope: !2632, inlinedAt: !2618)
!2634 = !DILocation(line: 198, column: 10, scope: !2632, inlinedAt: !2618)
!2635 = !DILocation(line: 198, scope: !2632, inlinedAt: !2618)
!2636 = !DILocation(line: 198, column: 27, scope: !2637, inlinedAt: !2618)
!2637 = distinct !DILexicalBlock(scope: !2632, file: !485, line: 198, column: 5)
!2638 = !DILocation(line: 198, column: 5, scope: !2632, inlinedAt: !2618)
!2639 = !DILocation(line: 199, column: 9, scope: !2640, inlinedAt: !2618)
!2640 = distinct !DILexicalBlock(scope: !2641, file: !485, line: 199, column: 9)
!2641 = distinct !DILexicalBlock(scope: !2637, file: !485, line: 198, column: 39)
!2642 = !DILocation(line: 208, column: 5, scope: !2615, inlinedAt: !2618)
!2643 = !DILocation(line: 199, scope: !2640, inlinedAt: !2618)
!2644 = !DILocalVariable(name: "j", scope: !2640, file: !485, line: 199, type: !86)
!2645 = !DILocation(line: 0, scope: !2640, inlinedAt: !2618)
!2646 = !DILocation(line: 199, column: 27, scope: !2647, inlinedAt: !2618)
!2647 = distinct !DILexicalBlock(scope: !2640, file: !485, line: 199, column: 9)
!2648 = !DILocation(line: 200, column: 13, scope: !2649, inlinedAt: !2618)
!2649 = distinct !DILexicalBlock(scope: !2650, file: !485, line: 200, column: 13)
!2650 = distinct !DILexicalBlock(scope: !2647, file: !485, line: 199, column: 37)
!2651 = !DILocation(line: 200, scope: !2649, inlinedAt: !2618)
!2652 = !DILocalVariable(name: "col", scope: !2649, file: !485, line: 200, type: !86)
!2653 = !DILocation(line: 0, scope: !2649, inlinedAt: !2618)
!2654 = !DILocation(line: 200, column: 35, scope: !2655, inlinedAt: !2618)
!2655 = distinct !DILexicalBlock(scope: !2649, file: !485, line: 200, column: 13)
!2656 = !DILocation(line: 201, column: 52, scope: !2657, inlinedAt: !2618)
!2657 = distinct !DILexicalBlock(scope: !2655, file: !485, line: 200, column: 50)
!2658 = !DILocation(line: 201, column: 56, scope: !2657, inlinedAt: !2618)
!2659 = !DILocation(line: 201, column: 47, scope: !2657, inlinedAt: !2618)
!2660 = !DILocation(line: 201, column: 99, scope: !2657, inlinedAt: !2618)
!2661 = !DILocation(line: 201, column: 103, scope: !2657, inlinedAt: !2618)
!2662 = !DILocation(line: 201, column: 110, scope: !2657, inlinedAt: !2618)
!2663 = !DILocation(line: 201, column: 123, scope: !2657, inlinedAt: !2618)
!2664 = !DILocation(line: 201, column: 117, scope: !2657, inlinedAt: !2618)
!2665 = !DILocation(line: 201, column: 115, scope: !2657, inlinedAt: !2618)
!2666 = !DILocation(line: 201, column: 90, scope: !2657, inlinedAt: !2618)
!2667 = !DILocation(line: 0, scope: !2462, inlinedAt: !2668)
!2668 = distinct !DILocation(line: 201, column: 21, scope: !2657, inlinedAt: !2618)
!2669 = !DILocation(line: 0, scope: !2470, inlinedAt: !2668)
!2670 = !DILocation(line: 24, column: 10, scope: !2470, inlinedAt: !2668)
!2671 = !DILocation(line: 24, scope: !2470, inlinedAt: !2668)
!2672 = !DILocation(line: 24, column: 26, scope: !2475, inlinedAt: !2668)
!2673 = !DILocation(line: 24, column: 5, scope: !2470, inlinedAt: !2668)
!2674 = !DILocation(line: 26, column: 19, scope: !2478, inlinedAt: !2668)
!2675 = !DILocation(line: 26, column: 9, scope: !2478, inlinedAt: !2668)
!2676 = !DILocation(line: 26, column: 16, scope: !2478, inlinedAt: !2668)
!2677 = !DILocation(line: 24, column: 46, scope: !2475, inlinedAt: !2668)
!2678 = !DILocation(line: 24, column: 5, scope: !2475, inlinedAt: !2668)
!2679 = distinct !{!2679, !2673, !2680, !300}
!2680 = !DILocation(line: 27, column: 5, scope: !2470, inlinedAt: !2668)
!2681 = !DILocation(line: 200, column: 44, scope: !2655, inlinedAt: !2618)
!2682 = !DILocation(line: 200, column: 13, scope: !2655, inlinedAt: !2618)
!2683 = distinct !{!2683, !2648, !2684, !300}
!2684 = !DILocation(line: 202, column: 13, scope: !2649, inlinedAt: !2618)
!2685 = !DILocation(line: 199, column: 33, scope: !2647, inlinedAt: !2618)
!2686 = !DILocation(line: 199, column: 9, scope: !2647, inlinedAt: !2618)
!2687 = distinct !{!2687, !2639, !2688, !300}
!2688 = !DILocation(line: 203, column: 9, scope: !2640, inlinedAt: !2618)
!2689 = !DILocation(line: 198, column: 35, scope: !2637, inlinedAt: !2618)
!2690 = !DILocation(line: 198, column: 5, scope: !2637, inlinedAt: !2618)
!2691 = distinct !{!2691, !2638, !2692, !300}
!2692 = !DILocation(line: 204, column: 5, scope: !2632, inlinedAt: !2618)
!2693 = !DILocalVariable(name: "i", scope: !2615, file: !485, line: 207, type: !86)
!2694 = !DILocation(line: 208, column: 14, scope: !2615, inlinedAt: !2618)
!2695 = !DILocation(line: 209, column: 54, scope: !2696, inlinedAt: !2618)
!2696 = distinct !DILexicalBlock(scope: !2615, file: !485, line: 208, column: 21)
!2697 = !DILocation(line: 209, column: 82, scope: !2696, inlinedAt: !2618)
!2698 = !DILocation(line: 209, column: 9, scope: !2696, inlinedAt: !2618)
!2699 = !DILocation(line: 210, column: 10, scope: !2696, inlinedAt: !2618)
!2700 = distinct !{!2700, !2642, !2701, !300}
!2701 = !DILocation(line: 211, column: 5, scope: !2615, inlinedAt: !2618)
!2702 = !DILocation(line: 212, column: 1, scope: !2615, inlinedAt: !2618)
!2703 = !DILocation(line: 292, column: 1, scope: !2385, inlinedAt: !2388)
!2704 = !DILocalVariable(name: "zero", scope: !2372, file: !68, line: 292, type: !884)
!2705 = !DILocation(line: 292, column: 19, scope: !2372, inlinedAt: !2375)
!2706 = !DILocation(line: 293, column: 5, scope: !2372, inlinedAt: !2375)
!2707 = !DILocation(line: 294, column: 1, scope: !2372, inlinedAt: !2375)
!2708 = !DILocation(line: 670, column: 9, scope: !2709)
!2709 = distinct !DILexicalBlock(scope: !2246, file: !68, line: 670, column: 9)
!2710 = !DILocation(line: 670, column: 31, scope: !2709)
!2711 = !DILocation(line: 674, column: 1, scope: !2246)
!2712 = !DILocation(line: 0, scope: !248)
!2713 = !DILocation(line: 0, scope: !256, inlinedAt: !2714)
!2714 = distinct !DILocation(line: 610, column: 5, scope: !248)
!2715 = !DILocation(line: 284, column: 5, scope: !256, inlinedAt: !2714)
!2716 = !DILocation(line: 265, column: 14, scope: !265, inlinedAt: !2717)
!2717 = distinct !DILocation(line: 285, column: 5, scope: !256, inlinedAt: !2714)
!2718 = !DILocation(line: 0, scope: !265, inlinedAt: !2717)
!2719 = !DILocation(line: 0, scope: !282, inlinedAt: !2717)
!2720 = !DILocation(line: 266, column: 10, scope: !282, inlinedAt: !2717)
!2721 = !DILocation(line: 266, column: 28, scope: !286, inlinedAt: !2717)
!2722 = !DILocation(line: 266, column: 5, scope: !282, inlinedAt: !2717)
!2723 = !DILocation(line: 266, scope: !282, inlinedAt: !2717)
!2724 = !DILocation(line: 268, column: 27, scope: !290, inlinedAt: !2717)
!2725 = !DILocation(line: 268, column: 29, scope: !290, inlinedAt: !2717)
!2726 = !DILocation(line: 268, column: 24, scope: !290, inlinedAt: !2717)
!2727 = !DILocation(line: 268, column: 9, scope: !290, inlinedAt: !2717)
!2728 = !DILocation(line: 269, column: 36, scope: !290, inlinedAt: !2717)
!2729 = !DILocation(line: 269, column: 21, scope: !290, inlinedAt: !2717)
!2730 = !DILocation(line: 269, column: 9, scope: !290, inlinedAt: !2717)
!2731 = !DILocation(line: 266, column: 5, scope: !286, inlinedAt: !2717)
!2732 = distinct !{!2732, !2722, !2733, !300}
!2733 = !DILocation(line: 270, column: 5, scope: !282, inlinedAt: !2717)
!2734 = !DILocation(line: 271, column: 1, scope: !265, inlinedAt: !2717)
!2735 = !DILocation(line: 612, column: 23, scope: !248)
!2736 = !DILocation(line: 612, column: 72, scope: !248)
!2737 = !DILocation(line: 265, column: 14, scope: !265, inlinedAt: !2738)
!2738 = distinct !DILocation(line: 612, column: 5, scope: !248)
!2739 = !DILocation(line: 0, scope: !265, inlinedAt: !2738)
!2740 = !DILocation(line: 0, scope: !282, inlinedAt: !2738)
!2741 = !DILocation(line: 266, column: 10, scope: !282, inlinedAt: !2738)
!2742 = !DILocation(line: 266, column: 28, scope: !286, inlinedAt: !2738)
!2743 = !DILocation(line: 266, column: 5, scope: !282, inlinedAt: !2738)
!2744 = !DILocation(line: 266, scope: !282, inlinedAt: !2738)
!2745 = !DILocation(line: 268, column: 27, scope: !290, inlinedAt: !2738)
!2746 = !DILocation(line: 268, column: 29, scope: !290, inlinedAt: !2738)
!2747 = !DILocation(line: 268, column: 24, scope: !290, inlinedAt: !2738)
!2748 = !DILocation(line: 268, column: 9, scope: !290, inlinedAt: !2738)
!2749 = !DILocation(line: 269, column: 36, scope: !290, inlinedAt: !2738)
!2750 = !DILocation(line: 269, column: 21, scope: !290, inlinedAt: !2738)
!2751 = !DILocation(line: 269, column: 9, scope: !290, inlinedAt: !2738)
!2752 = !DILocation(line: 266, column: 5, scope: !286, inlinedAt: !2738)
!2753 = distinct !{!2753, !2743, !2754, !300}
!2754 = !DILocation(line: 270, column: 5, scope: !282, inlinedAt: !2738)
!2755 = !DILocation(line: 271, column: 1, scope: !265, inlinedAt: !2738)
!2756 = !DILocation(line: 614, column: 5, scope: !248)
!2757 = distinct !DISubprogram(name: "m_vec_multiply_bins", scope: !660, file: !660, line: 66, type: !2758, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2758 = !DISubroutineType(types: !2759)
!2759 = !{null, !86, !52, !52}
!2760 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2757, file: !660, line: 66, type: !86)
!2761 = !DILocation(line: 0, scope: !2757)
!2762 = !DILocalVariable(name: "bins", arg: 2, scope: !2757, file: !660, line: 66, type: !52)
!2763 = !DILocalVariable(name: "out", arg: 3, scope: !2757, file: !660, line: 66, type: !52)
!2764 = !DILocation(line: 67, column: 44, scope: !2757)
!2765 = !DILocation(line: 67, column: 73, scope: !2757)
!2766 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2767, file: !660, line: 56, type: !86)
!2767 = distinct !DISubprogram(name: "m_vec_mul_add_x_inv", scope: !660, file: !660, line: 56, type: !2463, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2768 = !DILocation(line: 0, scope: !2767, inlinedAt: !2769)
!2769 = distinct !DILocation(line: 67, column: 5, scope: !2757)
!2770 = !DILocalVariable(name: "in", arg: 2, scope: !2767, file: !660, line: 56, type: !488)
!2771 = !DILocalVariable(name: "acc", arg: 3, scope: !2767, file: !660, line: 56, type: !52)
!2772 = !DILocalVariable(name: "mask_lsb", scope: !2767, file: !660, line: 58, type: !53)
!2773 = !DILocalVariable(name: "i", scope: !2774, file: !660, line: 59, type: !86)
!2774 = distinct !DILexicalBlock(scope: !2767, file: !660, line: 59, column: 5)
!2775 = !DILocation(line: 0, scope: !2774, inlinedAt: !2769)
!2776 = !DILocation(line: 59, column: 9, scope: !2774, inlinedAt: !2769)
!2777 = !DILocation(line: 59, scope: !2774, inlinedAt: !2769)
!2778 = !DILocation(line: 59, column: 20, scope: !2779, inlinedAt: !2769)
!2779 = distinct !DILexicalBlock(scope: !2774, file: !660, line: 59, column: 5)
!2780 = !DILocation(line: 59, column: 5, scope: !2774, inlinedAt: !2769)
!2781 = !DILocation(line: 60, column: 22, scope: !2782, inlinedAt: !2769)
!2782 = distinct !DILexicalBlock(scope: !2779, file: !660, line: 59, column: 43)
!2783 = !DILocation(line: 60, column: 28, scope: !2782, inlinedAt: !2769)
!2784 = !DILocalVariable(name: "t", scope: !2782, file: !660, line: 60, type: !53)
!2785 = !DILocation(line: 0, scope: !2782, inlinedAt: !2769)
!2786 = !DILocation(line: 61, column: 32, scope: !2782, inlinedAt: !2769)
!2787 = !DILocation(line: 61, column: 43, scope: !2782, inlinedAt: !2769)
!2788 = !DILocation(line: 61, column: 38, scope: !2782, inlinedAt: !2769)
!2789 = !DILocation(line: 61, column: 9, scope: !2782, inlinedAt: !2769)
!2790 = !DILocation(line: 61, column: 16, scope: !2782, inlinedAt: !2769)
!2791 = !DILocation(line: 59, column: 40, scope: !2779, inlinedAt: !2769)
!2792 = !DILocation(line: 59, column: 5, scope: !2779, inlinedAt: !2769)
!2793 = distinct !{!2793, !2780, !2794, !300}
!2794 = !DILocation(line: 62, column: 5, scope: !2774, inlinedAt: !2769)
!2795 = !DILocation(line: 68, column: 40, scope: !2757)
!2796 = !DILocation(line: 68, column: 69, scope: !2757)
!2797 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2798, file: !660, line: 46, type: !86)
!2798 = distinct !DISubprogram(name: "m_vec_mul_add_x", scope: !660, file: !660, line: 46, type: !2463, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2799 = !DILocation(line: 0, scope: !2798, inlinedAt: !2800)
!2800 = distinct !DILocation(line: 68, column: 5, scope: !2757)
!2801 = !DILocalVariable(name: "in", arg: 2, scope: !2798, file: !660, line: 46, type: !488)
!2802 = !DILocalVariable(name: "acc", arg: 3, scope: !2798, file: !660, line: 46, type: !52)
!2803 = !DILocalVariable(name: "mask_msb", scope: !2798, file: !660, line: 48, type: !53)
!2804 = !DILocalVariable(name: "i", scope: !2805, file: !660, line: 49, type: !86)
!2805 = distinct !DILexicalBlock(scope: !2798, file: !660, line: 49, column: 5)
!2806 = !DILocation(line: 0, scope: !2805, inlinedAt: !2800)
!2807 = !DILocation(line: 49, column: 9, scope: !2805, inlinedAt: !2800)
!2808 = !DILocation(line: 49, scope: !2805, inlinedAt: !2800)
!2809 = !DILocation(line: 49, column: 20, scope: !2810, inlinedAt: !2800)
!2810 = distinct !DILexicalBlock(scope: !2805, file: !660, line: 49, column: 5)
!2811 = !DILocation(line: 49, column: 5, scope: !2805, inlinedAt: !2800)
!2812 = !DILocation(line: 50, column: 22, scope: !2813, inlinedAt: !2800)
!2813 = distinct !DILexicalBlock(scope: !2810, file: !660, line: 49, column: 43)
!2814 = !DILocalVariable(name: "t", scope: !2813, file: !660, line: 50, type: !53)
!2815 = !DILocation(line: 0, scope: !2813, inlinedAt: !2800)
!2816 = !DILocation(line: 51, column: 32, scope: !2813, inlinedAt: !2800)
!2817 = !DILocation(line: 51, column: 44, scope: !2813, inlinedAt: !2800)
!2818 = !DILocation(line: 51, column: 50, scope: !2813, inlinedAt: !2800)
!2819 = !DILocation(line: 51, column: 38, scope: !2813, inlinedAt: !2800)
!2820 = !DILocation(line: 51, column: 9, scope: !2813, inlinedAt: !2800)
!2821 = !DILocation(line: 51, column: 16, scope: !2813, inlinedAt: !2800)
!2822 = !DILocation(line: 49, column: 40, scope: !2810, inlinedAt: !2800)
!2823 = !DILocation(line: 49, column: 5, scope: !2810, inlinedAt: !2800)
!2824 = distinct !{!2824, !2811, !2825, !300}
!2825 = !DILocation(line: 52, column: 5, scope: !2805, inlinedAt: !2800)
!2826 = !DILocation(line: 69, column: 44, scope: !2757)
!2827 = !DILocation(line: 69, column: 74, scope: !2757)
!2828 = !DILocation(line: 0, scope: !2767, inlinedAt: !2829)
!2829 = distinct !DILocation(line: 69, column: 5, scope: !2757)
!2830 = !DILocation(line: 0, scope: !2774, inlinedAt: !2829)
!2831 = !DILocation(line: 59, column: 9, scope: !2774, inlinedAt: !2829)
!2832 = !DILocation(line: 59, scope: !2774, inlinedAt: !2829)
!2833 = !DILocation(line: 59, column: 20, scope: !2779, inlinedAt: !2829)
!2834 = !DILocation(line: 59, column: 5, scope: !2774, inlinedAt: !2829)
!2835 = !DILocation(line: 60, column: 22, scope: !2782, inlinedAt: !2829)
!2836 = !DILocation(line: 60, column: 28, scope: !2782, inlinedAt: !2829)
!2837 = !DILocation(line: 0, scope: !2782, inlinedAt: !2829)
!2838 = !DILocation(line: 61, column: 32, scope: !2782, inlinedAt: !2829)
!2839 = !DILocation(line: 61, column: 43, scope: !2782, inlinedAt: !2829)
!2840 = !DILocation(line: 61, column: 38, scope: !2782, inlinedAt: !2829)
!2841 = !DILocation(line: 61, column: 9, scope: !2782, inlinedAt: !2829)
!2842 = !DILocation(line: 61, column: 16, scope: !2782, inlinedAt: !2829)
!2843 = !DILocation(line: 59, column: 40, scope: !2779, inlinedAt: !2829)
!2844 = !DILocation(line: 59, column: 5, scope: !2779, inlinedAt: !2829)
!2845 = distinct !{!2845, !2834, !2846, !300}
!2846 = !DILocation(line: 62, column: 5, scope: !2774, inlinedAt: !2829)
!2847 = !DILocation(line: 70, column: 40, scope: !2757)
!2848 = !DILocation(line: 70, column: 69, scope: !2757)
!2849 = !DILocation(line: 0, scope: !2798, inlinedAt: !2850)
!2850 = distinct !DILocation(line: 70, column: 5, scope: !2757)
!2851 = !DILocation(line: 0, scope: !2805, inlinedAt: !2850)
!2852 = !DILocation(line: 49, column: 9, scope: !2805, inlinedAt: !2850)
!2853 = !DILocation(line: 49, scope: !2805, inlinedAt: !2850)
!2854 = !DILocation(line: 49, column: 20, scope: !2810, inlinedAt: !2850)
!2855 = !DILocation(line: 49, column: 5, scope: !2805, inlinedAt: !2850)
!2856 = !DILocation(line: 50, column: 22, scope: !2813, inlinedAt: !2850)
!2857 = !DILocation(line: 0, scope: !2813, inlinedAt: !2850)
!2858 = !DILocation(line: 51, column: 32, scope: !2813, inlinedAt: !2850)
!2859 = !DILocation(line: 51, column: 44, scope: !2813, inlinedAt: !2850)
!2860 = !DILocation(line: 51, column: 50, scope: !2813, inlinedAt: !2850)
!2861 = !DILocation(line: 51, column: 38, scope: !2813, inlinedAt: !2850)
!2862 = !DILocation(line: 51, column: 9, scope: !2813, inlinedAt: !2850)
!2863 = !DILocation(line: 51, column: 16, scope: !2813, inlinedAt: !2850)
!2864 = !DILocation(line: 49, column: 40, scope: !2810, inlinedAt: !2850)
!2865 = !DILocation(line: 49, column: 5, scope: !2810, inlinedAt: !2850)
!2866 = distinct !{!2866, !2855, !2867, !300}
!2867 = !DILocation(line: 52, column: 5, scope: !2805, inlinedAt: !2850)
!2868 = !DILocation(line: 71, column: 44, scope: !2757)
!2869 = !DILocation(line: 71, column: 73, scope: !2757)
!2870 = !DILocation(line: 0, scope: !2767, inlinedAt: !2871)
!2871 = distinct !DILocation(line: 71, column: 5, scope: !2757)
!2872 = !DILocation(line: 0, scope: !2774, inlinedAt: !2871)
!2873 = !DILocation(line: 59, column: 9, scope: !2774, inlinedAt: !2871)
!2874 = !DILocation(line: 59, scope: !2774, inlinedAt: !2871)
!2875 = !DILocation(line: 59, column: 20, scope: !2779, inlinedAt: !2871)
!2876 = !DILocation(line: 59, column: 5, scope: !2774, inlinedAt: !2871)
!2877 = !DILocation(line: 60, column: 22, scope: !2782, inlinedAt: !2871)
!2878 = !DILocation(line: 60, column: 28, scope: !2782, inlinedAt: !2871)
!2879 = !DILocation(line: 0, scope: !2782, inlinedAt: !2871)
!2880 = !DILocation(line: 61, column: 32, scope: !2782, inlinedAt: !2871)
!2881 = !DILocation(line: 61, column: 43, scope: !2782, inlinedAt: !2871)
!2882 = !DILocation(line: 61, column: 38, scope: !2782, inlinedAt: !2871)
!2883 = !DILocation(line: 61, column: 9, scope: !2782, inlinedAt: !2871)
!2884 = !DILocation(line: 61, column: 16, scope: !2782, inlinedAt: !2871)
!2885 = !DILocation(line: 59, column: 40, scope: !2779, inlinedAt: !2871)
!2886 = !DILocation(line: 59, column: 5, scope: !2779, inlinedAt: !2871)
!2887 = distinct !{!2887, !2876, !2888, !300}
!2888 = !DILocation(line: 62, column: 5, scope: !2774, inlinedAt: !2871)
!2889 = !DILocation(line: 72, column: 40, scope: !2757)
!2890 = !DILocation(line: 72, column: 69, scope: !2757)
!2891 = !DILocation(line: 0, scope: !2798, inlinedAt: !2892)
!2892 = distinct !DILocation(line: 72, column: 5, scope: !2757)
!2893 = !DILocation(line: 0, scope: !2805, inlinedAt: !2892)
!2894 = !DILocation(line: 49, column: 9, scope: !2805, inlinedAt: !2892)
!2895 = !DILocation(line: 49, scope: !2805, inlinedAt: !2892)
!2896 = !DILocation(line: 49, column: 20, scope: !2810, inlinedAt: !2892)
!2897 = !DILocation(line: 49, column: 5, scope: !2805, inlinedAt: !2892)
!2898 = !DILocation(line: 50, column: 22, scope: !2813, inlinedAt: !2892)
!2899 = !DILocation(line: 0, scope: !2813, inlinedAt: !2892)
!2900 = !DILocation(line: 51, column: 32, scope: !2813, inlinedAt: !2892)
!2901 = !DILocation(line: 51, column: 44, scope: !2813, inlinedAt: !2892)
!2902 = !DILocation(line: 51, column: 50, scope: !2813, inlinedAt: !2892)
!2903 = !DILocation(line: 51, column: 38, scope: !2813, inlinedAt: !2892)
!2904 = !DILocation(line: 51, column: 9, scope: !2813, inlinedAt: !2892)
!2905 = !DILocation(line: 51, column: 16, scope: !2813, inlinedAt: !2892)
!2906 = !DILocation(line: 49, column: 40, scope: !2810, inlinedAt: !2892)
!2907 = !DILocation(line: 49, column: 5, scope: !2810, inlinedAt: !2892)
!2908 = distinct !{!2908, !2897, !2909, !300}
!2909 = !DILocation(line: 52, column: 5, scope: !2805, inlinedAt: !2892)
!2910 = !DILocation(line: 73, column: 44, scope: !2757)
!2911 = !DILocation(line: 73, column: 74, scope: !2757)
!2912 = !DILocation(line: 0, scope: !2767, inlinedAt: !2913)
!2913 = distinct !DILocation(line: 73, column: 5, scope: !2757)
!2914 = !DILocation(line: 0, scope: !2774, inlinedAt: !2913)
!2915 = !DILocation(line: 59, column: 9, scope: !2774, inlinedAt: !2913)
!2916 = !DILocation(line: 59, scope: !2774, inlinedAt: !2913)
!2917 = !DILocation(line: 59, column: 20, scope: !2779, inlinedAt: !2913)
!2918 = !DILocation(line: 59, column: 5, scope: !2774, inlinedAt: !2913)
!2919 = !DILocation(line: 60, column: 22, scope: !2782, inlinedAt: !2913)
!2920 = !DILocation(line: 60, column: 28, scope: !2782, inlinedAt: !2913)
!2921 = !DILocation(line: 0, scope: !2782, inlinedAt: !2913)
!2922 = !DILocation(line: 61, column: 32, scope: !2782, inlinedAt: !2913)
!2923 = !DILocation(line: 61, column: 43, scope: !2782, inlinedAt: !2913)
!2924 = !DILocation(line: 61, column: 38, scope: !2782, inlinedAt: !2913)
!2925 = !DILocation(line: 61, column: 9, scope: !2782, inlinedAt: !2913)
!2926 = !DILocation(line: 61, column: 16, scope: !2782, inlinedAt: !2913)
!2927 = !DILocation(line: 59, column: 40, scope: !2779, inlinedAt: !2913)
!2928 = !DILocation(line: 59, column: 5, scope: !2779, inlinedAt: !2913)
!2929 = distinct !{!2929, !2918, !2930, !300}
!2930 = !DILocation(line: 62, column: 5, scope: !2774, inlinedAt: !2913)
!2931 = !DILocation(line: 74, column: 40, scope: !2757)
!2932 = !DILocation(line: 74, column: 69, scope: !2757)
!2933 = !DILocation(line: 0, scope: !2798, inlinedAt: !2934)
!2934 = distinct !DILocation(line: 74, column: 5, scope: !2757)
!2935 = !DILocation(line: 0, scope: !2805, inlinedAt: !2934)
!2936 = !DILocation(line: 49, column: 9, scope: !2805, inlinedAt: !2934)
!2937 = !DILocation(line: 49, scope: !2805, inlinedAt: !2934)
!2938 = !DILocation(line: 49, column: 20, scope: !2810, inlinedAt: !2934)
!2939 = !DILocation(line: 49, column: 5, scope: !2805, inlinedAt: !2934)
!2940 = !DILocation(line: 50, column: 22, scope: !2813, inlinedAt: !2934)
!2941 = !DILocation(line: 0, scope: !2813, inlinedAt: !2934)
!2942 = !DILocation(line: 51, column: 32, scope: !2813, inlinedAt: !2934)
!2943 = !DILocation(line: 51, column: 44, scope: !2813, inlinedAt: !2934)
!2944 = !DILocation(line: 51, column: 50, scope: !2813, inlinedAt: !2934)
!2945 = !DILocation(line: 51, column: 38, scope: !2813, inlinedAt: !2934)
!2946 = !DILocation(line: 51, column: 9, scope: !2813, inlinedAt: !2934)
!2947 = !DILocation(line: 51, column: 16, scope: !2813, inlinedAt: !2934)
!2948 = !DILocation(line: 49, column: 40, scope: !2810, inlinedAt: !2934)
!2949 = !DILocation(line: 49, column: 5, scope: !2810, inlinedAt: !2934)
!2950 = distinct !{!2950, !2939, !2951, !300}
!2951 = !DILocation(line: 52, column: 5, scope: !2805, inlinedAt: !2934)
!2952 = !DILocation(line: 75, column: 44, scope: !2757)
!2953 = !DILocation(line: 75, column: 74, scope: !2757)
!2954 = !DILocation(line: 0, scope: !2767, inlinedAt: !2955)
!2955 = distinct !DILocation(line: 75, column: 5, scope: !2757)
!2956 = !DILocation(line: 0, scope: !2774, inlinedAt: !2955)
!2957 = !DILocation(line: 59, column: 9, scope: !2774, inlinedAt: !2955)
!2958 = !DILocation(line: 59, scope: !2774, inlinedAt: !2955)
!2959 = !DILocation(line: 59, column: 20, scope: !2779, inlinedAt: !2955)
!2960 = !DILocation(line: 59, column: 5, scope: !2774, inlinedAt: !2955)
!2961 = !DILocation(line: 60, column: 22, scope: !2782, inlinedAt: !2955)
!2962 = !DILocation(line: 60, column: 28, scope: !2782, inlinedAt: !2955)
!2963 = !DILocation(line: 0, scope: !2782, inlinedAt: !2955)
!2964 = !DILocation(line: 61, column: 32, scope: !2782, inlinedAt: !2955)
!2965 = !DILocation(line: 61, column: 43, scope: !2782, inlinedAt: !2955)
!2966 = !DILocation(line: 61, column: 38, scope: !2782, inlinedAt: !2955)
!2967 = !DILocation(line: 61, column: 9, scope: !2782, inlinedAt: !2955)
!2968 = !DILocation(line: 61, column: 16, scope: !2782, inlinedAt: !2955)
!2969 = !DILocation(line: 59, column: 40, scope: !2779, inlinedAt: !2955)
!2970 = !DILocation(line: 59, column: 5, scope: !2779, inlinedAt: !2955)
!2971 = distinct !{!2971, !2960, !2972, !300}
!2972 = !DILocation(line: 62, column: 5, scope: !2774, inlinedAt: !2955)
!2973 = !DILocation(line: 76, column: 40, scope: !2757)
!2974 = !DILocation(line: 76, column: 69, scope: !2757)
!2975 = !DILocation(line: 0, scope: !2798, inlinedAt: !2976)
!2976 = distinct !DILocation(line: 76, column: 5, scope: !2757)
!2977 = !DILocation(line: 0, scope: !2805, inlinedAt: !2976)
!2978 = !DILocation(line: 49, column: 9, scope: !2805, inlinedAt: !2976)
!2979 = !DILocation(line: 49, scope: !2805, inlinedAt: !2976)
!2980 = !DILocation(line: 49, column: 20, scope: !2810, inlinedAt: !2976)
!2981 = !DILocation(line: 49, column: 5, scope: !2805, inlinedAt: !2976)
!2982 = !DILocation(line: 50, column: 22, scope: !2813, inlinedAt: !2976)
!2983 = !DILocation(line: 0, scope: !2813, inlinedAt: !2976)
!2984 = !DILocation(line: 51, column: 32, scope: !2813, inlinedAt: !2976)
!2985 = !DILocation(line: 51, column: 44, scope: !2813, inlinedAt: !2976)
!2986 = !DILocation(line: 51, column: 50, scope: !2813, inlinedAt: !2976)
!2987 = !DILocation(line: 51, column: 38, scope: !2813, inlinedAt: !2976)
!2988 = !DILocation(line: 51, column: 9, scope: !2813, inlinedAt: !2976)
!2989 = !DILocation(line: 51, column: 16, scope: !2813, inlinedAt: !2976)
!2990 = !DILocation(line: 49, column: 40, scope: !2810, inlinedAt: !2976)
!2991 = !DILocation(line: 49, column: 5, scope: !2810, inlinedAt: !2976)
!2992 = distinct !{!2992, !2981, !2993, !300}
!2993 = !DILocation(line: 52, column: 5, scope: !2805, inlinedAt: !2976)
!2994 = !DILocation(line: 77, column: 44, scope: !2757)
!2995 = !DILocation(line: 77, column: 74, scope: !2757)
!2996 = !DILocation(line: 0, scope: !2767, inlinedAt: !2997)
!2997 = distinct !DILocation(line: 77, column: 5, scope: !2757)
!2998 = !DILocation(line: 0, scope: !2774, inlinedAt: !2997)
!2999 = !DILocation(line: 59, column: 9, scope: !2774, inlinedAt: !2997)
!3000 = !DILocation(line: 59, scope: !2774, inlinedAt: !2997)
!3001 = !DILocation(line: 59, column: 20, scope: !2779, inlinedAt: !2997)
!3002 = !DILocation(line: 59, column: 5, scope: !2774, inlinedAt: !2997)
!3003 = !DILocation(line: 60, column: 22, scope: !2782, inlinedAt: !2997)
!3004 = !DILocation(line: 60, column: 28, scope: !2782, inlinedAt: !2997)
!3005 = !DILocation(line: 0, scope: !2782, inlinedAt: !2997)
!3006 = !DILocation(line: 61, column: 32, scope: !2782, inlinedAt: !2997)
!3007 = !DILocation(line: 61, column: 43, scope: !2782, inlinedAt: !2997)
!3008 = !DILocation(line: 61, column: 38, scope: !2782, inlinedAt: !2997)
!3009 = !DILocation(line: 61, column: 9, scope: !2782, inlinedAt: !2997)
!3010 = !DILocation(line: 61, column: 16, scope: !2782, inlinedAt: !2997)
!3011 = !DILocation(line: 59, column: 40, scope: !2779, inlinedAt: !2997)
!3012 = !DILocation(line: 59, column: 5, scope: !2779, inlinedAt: !2997)
!3013 = distinct !{!3013, !3002, !3014, !300}
!3014 = !DILocation(line: 62, column: 5, scope: !2774, inlinedAt: !2997)
!3015 = !DILocation(line: 78, column: 40, scope: !2757)
!3016 = !DILocation(line: 78, column: 69, scope: !2757)
!3017 = !DILocation(line: 0, scope: !2798, inlinedAt: !3018)
!3018 = distinct !DILocation(line: 78, column: 5, scope: !2757)
!3019 = !DILocation(line: 0, scope: !2805, inlinedAt: !3018)
!3020 = !DILocation(line: 49, column: 9, scope: !2805, inlinedAt: !3018)
!3021 = !DILocation(line: 49, scope: !2805, inlinedAt: !3018)
!3022 = !DILocation(line: 49, column: 20, scope: !2810, inlinedAt: !3018)
!3023 = !DILocation(line: 49, column: 5, scope: !2805, inlinedAt: !3018)
!3024 = !DILocation(line: 50, column: 22, scope: !2813, inlinedAt: !3018)
!3025 = !DILocation(line: 0, scope: !2813, inlinedAt: !3018)
!3026 = !DILocation(line: 51, column: 32, scope: !2813, inlinedAt: !3018)
!3027 = !DILocation(line: 51, column: 44, scope: !2813, inlinedAt: !3018)
!3028 = !DILocation(line: 51, column: 50, scope: !2813, inlinedAt: !3018)
!3029 = !DILocation(line: 51, column: 38, scope: !2813, inlinedAt: !3018)
!3030 = !DILocation(line: 51, column: 9, scope: !2813, inlinedAt: !3018)
!3031 = !DILocation(line: 51, column: 16, scope: !2813, inlinedAt: !3018)
!3032 = !DILocation(line: 49, column: 40, scope: !2810, inlinedAt: !3018)
!3033 = !DILocation(line: 49, column: 5, scope: !2810, inlinedAt: !3018)
!3034 = distinct !{!3034, !3023, !3035, !300}
!3035 = !DILocation(line: 52, column: 5, scope: !2805, inlinedAt: !3018)
!3036 = !DILocation(line: 79, column: 44, scope: !2757)
!3037 = !DILocation(line: 79, column: 74, scope: !2757)
!3038 = !DILocation(line: 0, scope: !2767, inlinedAt: !3039)
!3039 = distinct !DILocation(line: 79, column: 5, scope: !2757)
!3040 = !DILocation(line: 0, scope: !2774, inlinedAt: !3039)
!3041 = !DILocation(line: 59, column: 9, scope: !2774, inlinedAt: !3039)
!3042 = !DILocation(line: 59, scope: !2774, inlinedAt: !3039)
!3043 = !DILocation(line: 59, column: 20, scope: !2779, inlinedAt: !3039)
!3044 = !DILocation(line: 59, column: 5, scope: !2774, inlinedAt: !3039)
!3045 = !DILocation(line: 60, column: 22, scope: !2782, inlinedAt: !3039)
!3046 = !DILocation(line: 60, column: 28, scope: !2782, inlinedAt: !3039)
!3047 = !DILocation(line: 0, scope: !2782, inlinedAt: !3039)
!3048 = !DILocation(line: 61, column: 32, scope: !2782, inlinedAt: !3039)
!3049 = !DILocation(line: 61, column: 43, scope: !2782, inlinedAt: !3039)
!3050 = !DILocation(line: 61, column: 38, scope: !2782, inlinedAt: !3039)
!3051 = !DILocation(line: 61, column: 9, scope: !2782, inlinedAt: !3039)
!3052 = !DILocation(line: 61, column: 16, scope: !2782, inlinedAt: !3039)
!3053 = !DILocation(line: 59, column: 40, scope: !2779, inlinedAt: !3039)
!3054 = !DILocation(line: 59, column: 5, scope: !2779, inlinedAt: !3039)
!3055 = distinct !{!3055, !3044, !3056, !300}
!3056 = !DILocation(line: 62, column: 5, scope: !2774, inlinedAt: !3039)
!3057 = !DILocation(line: 80, column: 40, scope: !2757)
!3058 = !DILocation(line: 80, column: 69, scope: !2757)
!3059 = !DILocation(line: 0, scope: !2798, inlinedAt: !3060)
!3060 = distinct !DILocation(line: 80, column: 5, scope: !2757)
!3061 = !DILocation(line: 0, scope: !2805, inlinedAt: !3060)
!3062 = !DILocation(line: 49, column: 9, scope: !2805, inlinedAt: !3060)
!3063 = !DILocation(line: 49, scope: !2805, inlinedAt: !3060)
!3064 = !DILocation(line: 49, column: 20, scope: !2810, inlinedAt: !3060)
!3065 = !DILocation(line: 49, column: 5, scope: !2805, inlinedAt: !3060)
!3066 = !DILocation(line: 50, column: 22, scope: !2813, inlinedAt: !3060)
!3067 = !DILocation(line: 0, scope: !2813, inlinedAt: !3060)
!3068 = !DILocation(line: 51, column: 32, scope: !2813, inlinedAt: !3060)
!3069 = !DILocation(line: 51, column: 44, scope: !2813, inlinedAt: !3060)
!3070 = !DILocation(line: 51, column: 50, scope: !2813, inlinedAt: !3060)
!3071 = !DILocation(line: 51, column: 38, scope: !2813, inlinedAt: !3060)
!3072 = !DILocation(line: 51, column: 9, scope: !2813, inlinedAt: !3060)
!3073 = !DILocation(line: 51, column: 16, scope: !2813, inlinedAt: !3060)
!3074 = !DILocation(line: 49, column: 40, scope: !2810, inlinedAt: !3060)
!3075 = !DILocation(line: 49, column: 5, scope: !2810, inlinedAt: !3060)
!3076 = distinct !{!3076, !3065, !3077, !300}
!3077 = !DILocation(line: 52, column: 5, scope: !2805, inlinedAt: !3060)
!3078 = !DILocation(line: 81, column: 35, scope: !2757)
!3079 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !3080, file: !660, line: 13, type: !86)
!3080 = distinct !DISubprogram(name: "m_vec_copy", scope: !660, file: !660, line: 13, type: !2463, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!3081 = !DILocation(line: 0, scope: !3080, inlinedAt: !3082)
!3082 = distinct !DILocation(line: 81, column: 5, scope: !2757)
!3083 = !DILocalVariable(name: "in", arg: 2, scope: !3080, file: !660, line: 13, type: !488)
!3084 = !DILocalVariable(name: "out", arg: 3, scope: !3080, file: !660, line: 13, type: !52)
!3085 = !DILocalVariable(name: "i", scope: !3086, file: !660, line: 15, type: !58)
!3086 = distinct !DILexicalBlock(scope: !3080, file: !660, line: 15, column: 5)
!3087 = !DILocation(line: 0, scope: !3086, inlinedAt: !3082)
!3088 = !DILocation(line: 15, column: 10, scope: !3086, inlinedAt: !3082)
!3089 = !DILocation(line: 15, scope: !3086, inlinedAt: !3082)
!3090 = !DILocation(line: 15, column: 26, scope: !3091, inlinedAt: !3082)
!3091 = distinct !DILexicalBlock(scope: !3086, file: !660, line: 15, column: 5)
!3092 = !DILocation(line: 15, column: 5, scope: !3086, inlinedAt: !3082)
!3093 = !DILocation(line: 17, column: 18, scope: !3094, inlinedAt: !3082)
!3094 = distinct !DILexicalBlock(scope: !3091, file: !660, line: 16, column: 5)
!3095 = !DILocation(line: 17, column: 9, scope: !3094, inlinedAt: !3082)
!3096 = !DILocation(line: 17, column: 16, scope: !3094, inlinedAt: !3082)
!3097 = !DILocation(line: 15, column: 46, scope: !3091, inlinedAt: !3082)
!3098 = !DILocation(line: 15, column: 5, scope: !3091, inlinedAt: !3082)
!3099 = distinct !{!3099, !3092, !3100, !300}
!3100 = !DILocation(line: 18, column: 5, scope: !3086, inlinedAt: !3082)
!3101 = !DILocation(line: 82, column: 1, scope: !2757)
!3102 = distinct !DISubprogram(name: "pqmayo_MAYO_5_ref_m_upper", scope: !99, file: !99, line: 14, type: !3103, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3103 = !DISubroutineType(types: !3104)
!3104 = !{null, !3105, !488, !52, !86}
!3105 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3106, size: 32)
!3106 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !3107)
!3107 = !DIDerivedType(tag: DW_TAG_typedef, name: "mayo_params_t", file: !79, line: 289, baseType: !3108)
!3108 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !79, line: 265, size: 736, elements: !3109)
!3109 = !{!3110, !3111, !3112, !3113, !3114, !3115, !3116, !3117, !3118, !3119, !3120, !3121, !3122, !3123, !3124, !3125, !3126, !3127, !3128, !3129, !3130, !3131, !3132}
!3110 = !DIDerivedType(tag: DW_TAG_member, name: "m", scope: !3108, file: !79, line: 266, baseType: !86, size: 32)
!3111 = !DIDerivedType(tag: DW_TAG_member, name: "n", scope: !3108, file: !79, line: 267, baseType: !86, size: 32, offset: 32)
!3112 = !DIDerivedType(tag: DW_TAG_member, name: "o", scope: !3108, file: !79, line: 268, baseType: !86, size: 32, offset: 64)
!3113 = !DIDerivedType(tag: DW_TAG_member, name: "k", scope: !3108, file: !79, line: 269, baseType: !86, size: 32, offset: 96)
!3114 = !DIDerivedType(tag: DW_TAG_member, name: "q", scope: !3108, file: !79, line: 270, baseType: !86, size: 32, offset: 128)
!3115 = !DIDerivedType(tag: DW_TAG_member, name: "f_tail", scope: !3108, file: !79, line: 271, baseType: !90, size: 32, offset: 160)
!3116 = !DIDerivedType(tag: DW_TAG_member, name: "m_bytes", scope: !3108, file: !79, line: 272, baseType: !86, size: 32, offset: 192)
!3117 = !DIDerivedType(tag: DW_TAG_member, name: "O_bytes", scope: !3108, file: !79, line: 273, baseType: !86, size: 32, offset: 224)
!3118 = !DIDerivedType(tag: DW_TAG_member, name: "v_bytes", scope: !3108, file: !79, line: 274, baseType: !86, size: 32, offset: 256)
!3119 = !DIDerivedType(tag: DW_TAG_member, name: "r_bytes", scope: !3108, file: !79, line: 275, baseType: !86, size: 32, offset: 288)
!3120 = !DIDerivedType(tag: DW_TAG_member, name: "R_bytes", scope: !3108, file: !79, line: 276, baseType: !86, size: 32, offset: 320)
!3121 = !DIDerivedType(tag: DW_TAG_member, name: "P1_bytes", scope: !3108, file: !79, line: 277, baseType: !86, size: 32, offset: 352)
!3122 = !DIDerivedType(tag: DW_TAG_member, name: "P2_bytes", scope: !3108, file: !79, line: 278, baseType: !86, size: 32, offset: 384)
!3123 = !DIDerivedType(tag: DW_TAG_member, name: "P3_bytes", scope: !3108, file: !79, line: 279, baseType: !86, size: 32, offset: 416)
!3124 = !DIDerivedType(tag: DW_TAG_member, name: "csk_bytes", scope: !3108, file: !79, line: 280, baseType: !86, size: 32, offset: 448)
!3125 = !DIDerivedType(tag: DW_TAG_member, name: "cpk_bytes", scope: !3108, file: !79, line: 281, baseType: !86, size: 32, offset: 480)
!3126 = !DIDerivedType(tag: DW_TAG_member, name: "sig_bytes", scope: !3108, file: !79, line: 282, baseType: !86, size: 32, offset: 512)
!3127 = !DIDerivedType(tag: DW_TAG_member, name: "salt_bytes", scope: !3108, file: !79, line: 283, baseType: !86, size: 32, offset: 544)
!3128 = !DIDerivedType(tag: DW_TAG_member, name: "sk_seed_bytes", scope: !3108, file: !79, line: 284, baseType: !86, size: 32, offset: 576)
!3129 = !DIDerivedType(tag: DW_TAG_member, name: "digest_bytes", scope: !3108, file: !79, line: 285, baseType: !86, size: 32, offset: 608)
!3130 = !DIDerivedType(tag: DW_TAG_member, name: "pk_seed_bytes", scope: !3108, file: !79, line: 286, baseType: !86, size: 32, offset: 640)
!3131 = !DIDerivedType(tag: DW_TAG_member, name: "m_vec_limbs", scope: !3108, file: !79, line: 287, baseType: !86, size: 32, offset: 672)
!3132 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !3108, file: !79, line: 288, baseType: !148, size: 32, offset: 704)
!3133 = !DILocalVariable(name: "p", arg: 1, scope: !3102, file: !99, line: 14, type: !3105)
!3134 = !DILocation(line: 0, scope: !3102)
!3135 = !DILocalVariable(name: "in", arg: 2, scope: !3102, file: !99, line: 14, type: !488)
!3136 = !DILocalVariable(name: "out", arg: 3, scope: !3102, file: !99, line: 14, type: !52)
!3137 = !DILocalVariable(name: "size", arg: 4, scope: !3102, file: !99, line: 14, type: !86)
!3138 = !DILocalVariable(name: "m_vec_limbs", scope: !3102, file: !99, line: 19, type: !275)
!3139 = !DILocalVariable(name: "m_vecs_stored", scope: !3102, file: !99, line: 20, type: !86)
!3140 = !DILocalVariable(name: "r", scope: !3141, file: !99, line: 21, type: !86)
!3141 = distinct !DILexicalBlock(scope: !3102, file: !99, line: 21, column: 5)
!3142 = !DILocation(line: 0, scope: !3141)
!3143 = !DILocation(line: 21, column: 10, scope: !3141)
!3144 = !DILocation(line: 20, column: 9, scope: !3102)
!3145 = !DILocation(line: 21, scope: !3141)
!3146 = !DILocation(line: 21, column: 23, scope: !3147)
!3147 = distinct !DILexicalBlock(scope: !3141, file: !99, line: 21, column: 5)
!3148 = !DILocation(line: 21, column: 5, scope: !3141)
!3149 = !DILocation(line: 22, column: 9, scope: !3150)
!3150 = distinct !DILexicalBlock(scope: !3151, file: !99, line: 22, column: 9)
!3151 = distinct !DILexicalBlock(scope: !3147, file: !99, line: 21, column: 36)
!3152 = !DILocation(line: 22, scope: !3150)
!3153 = !DILocalVariable(name: "c", scope: !3150, file: !99, line: 22, type: !86)
!3154 = !DILocation(line: 0, scope: !3150)
!3155 = !DILocation(line: 22, column: 27, scope: !3156)
!3156 = distinct !DILexicalBlock(scope: !3150, file: !99, line: 22, column: 9)
!3157 = !DILocation(line: 23, column: 59, scope: !3158)
!3158 = distinct !DILexicalBlock(scope: !3156, file: !99, line: 22, column: 40)
!3159 = !DILocation(line: 23, column: 66, scope: !3158)
!3160 = !DILocation(line: 23, column: 40, scope: !3158)
!3161 = !DILocation(line: 23, column: 76, scope: !3158)
!3162 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !3163, file: !660, line: 13, type: !86)
!3163 = distinct !DISubprogram(name: "m_vec_copy", scope: !660, file: !660, line: 13, type: !2463, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3164 = !DILocation(line: 0, scope: !3163, inlinedAt: !3165)
!3165 = distinct !DILocation(line: 23, column: 13, scope: !3158)
!3166 = !DILocalVariable(name: "in", arg: 2, scope: !3163, file: !660, line: 13, type: !488)
!3167 = !DILocalVariable(name: "out", arg: 3, scope: !3163, file: !660, line: 13, type: !52)
!3168 = !DILocalVariable(name: "i", scope: !3169, file: !660, line: 15, type: !58)
!3169 = distinct !DILexicalBlock(scope: !3163, file: !660, line: 15, column: 5)
!3170 = !DILocation(line: 0, scope: !3169, inlinedAt: !3165)
!3171 = !DILocation(line: 15, column: 10, scope: !3169, inlinedAt: !3165)
!3172 = !DILocation(line: 15, scope: !3169, inlinedAt: !3165)
!3173 = !DILocation(line: 15, column: 26, scope: !3174, inlinedAt: !3165)
!3174 = distinct !DILexicalBlock(scope: !3169, file: !660, line: 15, column: 5)
!3175 = !DILocation(line: 15, column: 5, scope: !3169, inlinedAt: !3165)
!3176 = !DILocation(line: 17, column: 18, scope: !3177, inlinedAt: !3165)
!3177 = distinct !DILexicalBlock(scope: !3174, file: !660, line: 16, column: 5)
!3178 = !DILocation(line: 17, column: 9, scope: !3177, inlinedAt: !3165)
!3179 = !DILocation(line: 17, column: 16, scope: !3177, inlinedAt: !3165)
!3180 = !DILocation(line: 15, column: 46, scope: !3174, inlinedAt: !3165)
!3181 = !DILocation(line: 15, column: 5, scope: !3174, inlinedAt: !3165)
!3182 = distinct !{!3182, !3175, !3183, !300}
!3183 = !DILocation(line: 18, column: 5, scope: !3169, inlinedAt: !3165)
!3184 = !DILocation(line: 24, column: 19, scope: !3185)
!3185 = distinct !DILexicalBlock(scope: !3158, file: !99, line: 24, column: 17)
!3186 = !DILocation(line: 25, column: 62, scope: !3187)
!3187 = distinct !DILexicalBlock(scope: !3185, file: !99, line: 24, column: 25)
!3188 = !DILocation(line: 25, column: 69, scope: !3187)
!3189 = !DILocation(line: 25, column: 43, scope: !3187)
!3190 = !DILocation(line: 25, column: 79, scope: !3187)
!3191 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !3192, file: !660, line: 22, type: !86)
!3192 = distinct !DISubprogram(name: "m_vec_add", scope: !660, file: !660, line: 22, type: !2463, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3193 = !DILocation(line: 0, scope: !3192, inlinedAt: !3194)
!3194 = distinct !DILocation(line: 25, column: 17, scope: !3187)
!3195 = !DILocalVariable(name: "in", arg: 2, scope: !3192, file: !660, line: 22, type: !488)
!3196 = !DILocalVariable(name: "acc", arg: 3, scope: !3192, file: !660, line: 22, type: !52)
!3197 = !DILocalVariable(name: "i", scope: !3198, file: !660, line: 24, type: !58)
!3198 = distinct !DILexicalBlock(scope: !3192, file: !660, line: 24, column: 5)
!3199 = !DILocation(line: 0, scope: !3198, inlinedAt: !3194)
!3200 = !DILocation(line: 24, column: 10, scope: !3198, inlinedAt: !3194)
!3201 = !DILocation(line: 24, scope: !3198, inlinedAt: !3194)
!3202 = !DILocation(line: 24, column: 26, scope: !3203, inlinedAt: !3194)
!3203 = distinct !DILexicalBlock(scope: !3198, file: !660, line: 24, column: 5)
!3204 = !DILocation(line: 24, column: 5, scope: !3198, inlinedAt: !3194)
!3205 = !DILocation(line: 26, column: 19, scope: !3206, inlinedAt: !3194)
!3206 = distinct !DILexicalBlock(scope: !3203, file: !660, line: 25, column: 5)
!3207 = !DILocation(line: 26, column: 9, scope: !3206, inlinedAt: !3194)
!3208 = !DILocation(line: 26, column: 16, scope: !3206, inlinedAt: !3194)
!3209 = !DILocation(line: 24, column: 46, scope: !3203, inlinedAt: !3194)
!3210 = !DILocation(line: 24, column: 5, scope: !3203, inlinedAt: !3194)
!3211 = distinct !{!3211, !3204, !3212, !300}
!3212 = !DILocation(line: 27, column: 5, scope: !3198, inlinedAt: !3194)
!3213 = !DILocation(line: 27, column: 27, scope: !3158)
!3214 = !DILocation(line: 22, column: 36, scope: !3156)
!3215 = !DILocation(line: 22, column: 9, scope: !3156)
!3216 = distinct !{!3216, !3149, !3217, !300}
!3217 = !DILocation(line: 28, column: 9, scope: !3150)
!3218 = !DILocation(line: 21, column: 32, scope: !3147)
!3219 = !DILocation(line: 21, column: 5, scope: !3147)
!3220 = distinct !{!3220, !3148, !3221, !300}
!3221 = !DILocation(line: 29, column: 5, scope: !3141)
!3222 = !DILocation(line: 30, column: 1, scope: !3102)
!3223 = distinct !DISubprogram(name: "pqmayo_MAYO_5_ref_sample_solution", scope: !99, file: !99, line: 40, type: !3224, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3224 = !DISubroutineType(types: !3225)
!3225 = !{!86, !3105, !61, !90, !90, !61, !86, !86, !86, !86}
!3226 = !DILocalVariable(name: "p", arg: 1, scope: !3223, file: !99, line: 40, type: !3105)
!3227 = !DILocation(line: 0, scope: !3223)
!3228 = !DILocalVariable(name: "A", arg: 2, scope: !3223, file: !99, line: 40, type: !61)
!3229 = !DILocalVariable(name: "y", arg: 3, scope: !3223, file: !99, line: 41, type: !90)
!3230 = !DILocalVariable(name: "r", arg: 4, scope: !3223, file: !99, line: 41, type: !90)
!3231 = !DILocalVariable(name: "x", arg: 5, scope: !3223, file: !99, line: 42, type: !61)
!3232 = !DILocalVariable(name: "k", arg: 6, scope: !3223, file: !99, line: 42, type: !86)
!3233 = !DILocalVariable(name: "o", arg: 7, scope: !3223, file: !99, line: 42, type: !86)
!3234 = !DILocalVariable(name: "m", arg: 8, scope: !3223, file: !99, line: 42, type: !86)
!3235 = !DILocalVariable(name: "A_cols", arg: 9, scope: !3223, file: !99, line: 42, type: !86)
!3236 = !DILocalVariable(name: "i", scope: !3237, file: !99, line: 51, type: !86)
!3237 = distinct !DILexicalBlock(scope: !3223, file: !99, line: 51, column: 5)
!3238 = !DILocation(line: 0, scope: !3237)
!3239 = !DILocation(line: 51, column: 10, scope: !3237)
!3240 = !DILocation(line: 51, scope: !3237)
!3241 = !DILocation(line: 51, column: 23, scope: !3242)
!3242 = distinct !DILexicalBlock(scope: !3237, file: !99, line: 51, column: 5)
!3243 = !DILocation(line: 51, column: 5, scope: !3237)
!3244 = !DILocation(line: 57, column: 5, scope: !3245)
!3245 = distinct !DILexicalBlock(scope: !3223, file: !99, line: 57, column: 5)
!3246 = !DILocation(line: 52, column: 16, scope: !3247)
!3247 = distinct !DILexicalBlock(scope: !3242, file: !99, line: 51, column: 37)
!3248 = !DILocation(line: 52, column: 9, scope: !3247)
!3249 = !DILocation(line: 52, column: 14, scope: !3247)
!3250 = !DILocation(line: 51, column: 33, scope: !3242)
!3251 = !DILocation(line: 51, column: 5, scope: !3242)
!3252 = distinct !{!3252, !3243, !3253, !300}
!3253 = !DILocation(line: 53, column: 5, scope: !3237)
!3254 = !DILocation(line: 57, scope: !3245)
!3255 = !DILocalVariable(name: "i", scope: !3245, file: !99, line: 57, type: !86)
!3256 = !DILocation(line: 0, scope: !3245)
!3257 = !DILocation(line: 57, column: 23, scope: !3258)
!3258 = distinct !DILexicalBlock(scope: !3245, file: !99, line: 57, column: 5)
!3259 = !DILocation(line: 58, column: 13, scope: !3260)
!3260 = distinct !DILexicalBlock(scope: !3258, file: !99, line: 57, column: 33)
!3261 = !DILocation(line: 58, column: 26, scope: !3260)
!3262 = !DILocation(line: 58, column: 30, scope: !3260)
!3263 = !DILocation(line: 58, column: 21, scope: !3260)
!3264 = !DILocation(line: 58, column: 9, scope: !3260)
!3265 = !DILocation(line: 58, column: 36, scope: !3260)
!3266 = !DILocation(line: 57, column: 29, scope: !3258)
!3267 = !DILocation(line: 57, column: 5, scope: !3258)
!3268 = distinct !{!3268, !3244, !3269, !300}
!3269 = !DILocation(line: 59, column: 5, scope: !3245)
!3270 = !DILocation(line: 60, column: 25, scope: !3223)
!3271 = !DILocalVariable(name: "a", arg: 1, scope: !3272, file: !670, line: 78, type: !90)
!3272 = distinct !DISubprogram(name: "mat_mul", scope: !670, file: !670, line: 78, type: !1822, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3273 = !DILocation(line: 0, scope: !3272, inlinedAt: !3274)
!3274 = distinct !DILocation(line: 60, column: 5, scope: !3223)
!3275 = !DILocalVariable(name: "b", arg: 2, scope: !3272, file: !670, line: 78, type: !90)
!3276 = !DILocalVariable(name: "c", arg: 3, scope: !3272, file: !670, line: 79, type: !61)
!3277 = !DILocalVariable(name: "colrow_ab", arg: 4, scope: !3272, file: !670, line: 79, type: !86)
!3278 = !DILocalVariable(name: "row_a", arg: 5, scope: !3272, file: !670, line: 79, type: !86)
!3279 = !DILocalVariable(name: "col_b", arg: 6, scope: !3272, file: !670, line: 79, type: !86)
!3280 = !DILocalVariable(name: "i", scope: !3281, file: !670, line: 80, type: !86)
!3281 = distinct !DILexicalBlock(scope: !3272, file: !670, line: 80, column: 5)
!3282 = !DILocation(line: 0, scope: !3281, inlinedAt: !3274)
!3283 = !DILocation(line: 80, column: 10, scope: !3281, inlinedAt: !3274)
!3284 = !DILocation(line: 80, scope: !3281, inlinedAt: !3274)
!3285 = !DILocation(line: 80, column: 23, scope: !3286, inlinedAt: !3274)
!3286 = distinct !DILexicalBlock(scope: !3281, file: !670, line: 80, column: 5)
!3287 = !DILocation(line: 80, column: 5, scope: !3281, inlinedAt: !3274)
!3288 = !DILocation(line: 81, column: 9, scope: !3289, inlinedAt: !3274)
!3289 = distinct !DILexicalBlock(scope: !3290, file: !670, line: 81, column: 9)
!3290 = distinct !DILexicalBlock(scope: !3286, file: !670, line: 80, column: 53)
!3291 = !DILocation(line: 63, column: 5, scope: !3292)
!3292 = distinct !DILexicalBlock(scope: !3223, file: !99, line: 63, column: 5)
!3293 = !DILocation(line: 81, scope: !3289, inlinedAt: !3274)
!3294 = !DILocalVariable(name: "j", scope: !3289, file: !670, line: 81, type: !86)
!3295 = !DILocation(line: 0, scope: !3289, inlinedAt: !3274)
!3296 = !DILocation(line: 81, column: 27, scope: !3297, inlinedAt: !3274)
!3297 = distinct !DILexicalBlock(scope: !3289, file: !670, line: 81, column: 9)
!3298 = !DILocation(line: 82, column: 31, scope: !3299, inlinedAt: !3274)
!3299 = distinct !DILexicalBlock(scope: !3297, file: !670, line: 81, column: 46)
!3300 = !DILocalVariable(name: "a", arg: 1, scope: !3301, file: !670, line: 69, type: !90)
!3301 = distinct !DISubprogram(name: "lincomb", scope: !670, file: !670, line: 69, type: !1851, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3302 = !DILocation(line: 0, scope: !3301, inlinedAt: !3303)
!3303 = distinct !DILocation(line: 82, column: 18, scope: !3299, inlinedAt: !3274)
!3304 = !DILocalVariable(name: "b", arg: 2, scope: !3301, file: !670, line: 70, type: !90)
!3305 = !DILocalVariable(name: "n", arg: 3, scope: !3301, file: !670, line: 70, type: !86)
!3306 = !DILocalVariable(name: "m", arg: 4, scope: !3301, file: !670, line: 70, type: !86)
!3307 = !DILocalVariable(name: "ret", scope: !3301, file: !670, line: 71, type: !51)
!3308 = !DILocalVariable(name: "i", scope: !3309, file: !670, line: 72, type: !86)
!3309 = distinct !DILexicalBlock(scope: !3301, file: !670, line: 72, column: 5)
!3310 = !DILocation(line: 0, scope: !3309, inlinedAt: !3303)
!3311 = !DILocation(line: 72, column: 10, scope: !3309, inlinedAt: !3303)
!3312 = !DILocation(line: 72, scope: !3309, inlinedAt: !3303)
!3313 = !DILocation(line: 72, column: 23, scope: !3314, inlinedAt: !3303)
!3314 = distinct !DILexicalBlock(scope: !3309, file: !670, line: 72, column: 5)
!3315 = !DILocation(line: 72, column: 5, scope: !3309, inlinedAt: !3303)
!3316 = !DILocation(line: 73, column: 27, scope: !3317, inlinedAt: !3303)
!3317 = distinct !DILexicalBlock(scope: !3314, file: !670, line: 72, column: 41)
!3318 = !DILocation(line: 73, column: 33, scope: !3317, inlinedAt: !3303)
!3319 = !DILocalVariable(name: "a", arg: 1, scope: !3320, file: !670, line: 8, type: !51)
!3320 = distinct !DISubprogram(name: "mul_f", scope: !670, file: !670, line: 8, type: !1536, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3321 = !DILocation(line: 0, scope: !3320, inlinedAt: !3322)
!3322 = distinct !DILocation(line: 73, column: 21, scope: !3317, inlinedAt: !3303)
!3323 = !DILocalVariable(name: "b", arg: 2, scope: !3320, file: !670, line: 8, type: !51)
!3324 = !DILocation(line: 13, column: 10, scope: !3320, inlinedAt: !3322)
!3325 = !DILocation(line: 13, column: 7, scope: !3320, inlinedAt: !3322)
!3326 = !DILocation(line: 16, column: 17, scope: !3320, inlinedAt: !3322)
!3327 = !DILocalVariable(name: "p", scope: !3320, file: !670, line: 10, type: !51)
!3328 = !DILocation(line: 17, column: 13, scope: !3320, inlinedAt: !3322)
!3329 = !DILocation(line: 17, column: 17, scope: !3320, inlinedAt: !3322)
!3330 = !DILocation(line: 17, column: 7, scope: !3320, inlinedAt: !3322)
!3331 = !DILocation(line: 18, column: 13, scope: !3320, inlinedAt: !3322)
!3332 = !DILocation(line: 18, column: 17, scope: !3320, inlinedAt: !3322)
!3333 = !DILocation(line: 18, column: 7, scope: !3320, inlinedAt: !3322)
!3334 = !DILocation(line: 19, column: 13, scope: !3320, inlinedAt: !3322)
!3335 = !DILocation(line: 19, column: 17, scope: !3320, inlinedAt: !3322)
!3336 = !DILocation(line: 19, column: 7, scope: !3320, inlinedAt: !3322)
!3337 = !DILocalVariable(name: "top_p", scope: !3320, file: !670, line: 22, type: !51)
!3338 = !DILocation(line: 23, column: 37, scope: !3320, inlinedAt: !3322)
!3339 = !DILocation(line: 23, column: 52, scope: !3320, inlinedAt: !3322)
!3340 = !DILocation(line: 23, column: 43, scope: !3320, inlinedAt: !3322)
!3341 = !DILocation(line: 23, column: 59, scope: !3320, inlinedAt: !3322)
!3342 = !DILocalVariable(name: "out", scope: !3320, file: !670, line: 23, type: !51)
!3343 = !DILocalVariable(name: "a", arg: 1, scope: !3344, file: !670, line: 42, type: !51)
!3344 = distinct !DISubprogram(name: "add_f", scope: !670, file: !670, line: 42, type: !1536, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3345 = !DILocation(line: 0, scope: !3344, inlinedAt: !3346)
!3346 = distinct !DILocation(line: 73, column: 15, scope: !3317, inlinedAt: !3303)
!3347 = !DILocalVariable(name: "b", arg: 2, scope: !3344, file: !670, line: 42, type: !51)
!3348 = !DILocation(line: 43, column: 14, scope: !3344, inlinedAt: !3346)
!3349 = !DILocation(line: 72, column: 28, scope: !3314, inlinedAt: !3303)
!3350 = !DILocation(line: 72, column: 35, scope: !3314, inlinedAt: !3303)
!3351 = !DILocation(line: 72, column: 5, scope: !3314, inlinedAt: !3303)
!3352 = distinct !{!3352, !3315, !3353, !300}
!3353 = !DILocation(line: 74, column: 5, scope: !3309, inlinedAt: !3303)
!3354 = !DILocation(line: 82, column: 16, scope: !3299, inlinedAt: !3274)
!3355 = !DILocation(line: 81, column: 41, scope: !3297, inlinedAt: !3274)
!3356 = !DILocation(line: 81, column: 9, scope: !3297, inlinedAt: !3274)
!3357 = distinct !{!3357, !3288, !3358, !300}
!3358 = !DILocation(line: 83, column: 9, scope: !3289, inlinedAt: !3274)
!3359 = !DILocation(line: 80, column: 32, scope: !3286, inlinedAt: !3274)
!3360 = !DILocation(line: 80, column: 39, scope: !3286, inlinedAt: !3274)
!3361 = !DILocation(line: 80, column: 5, scope: !3286, inlinedAt: !3274)
!3362 = distinct !{!3362, !3287, !3363, !300}
!3363 = !DILocation(line: 84, column: 5, scope: !3281, inlinedAt: !3274)
!3364 = !DILocation(line: 63, scope: !3292)
!3365 = !DILocalVariable(name: "i", scope: !3292, file: !99, line: 63, type: !86)
!3366 = !DILocation(line: 0, scope: !3292)
!3367 = !DILocation(line: 63, column: 23, scope: !3368)
!3368 = distinct !DILexicalBlock(scope: !3292, file: !99, line: 63, column: 5)
!3369 = !DILocation(line: 64, column: 44, scope: !3370)
!3370 = distinct !DILexicalBlock(scope: !3368, file: !99, line: 63, column: 33)
!3371 = !DILocation(line: 64, column: 50, scope: !3370)
!3372 = !DILocalVariable(name: "a", arg: 1, scope: !3373, file: !670, line: 47, type: !51)
!3373 = distinct !DISubprogram(name: "sub_f", scope: !670, file: !670, line: 47, type: !1536, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3374 = !DILocation(line: 0, scope: !3373, inlinedAt: !3375)
!3375 = distinct !DILocation(line: 64, column: 38, scope: !3370)
!3376 = !DILocalVariable(name: "b", arg: 2, scope: !3373, file: !670, line: 47, type: !51)
!3377 = !DILocation(line: 48, column: 14, scope: !3373, inlinedAt: !3375)
!3378 = !DILocation(line: 64, column: 13, scope: !3370)
!3379 = !DILocation(line: 64, column: 26, scope: !3370)
!3380 = !DILocation(line: 64, column: 30, scope: !3370)
!3381 = !DILocation(line: 64, column: 21, scope: !3370)
!3382 = !DILocation(line: 64, column: 9, scope: !3370)
!3383 = !DILocation(line: 64, column: 36, scope: !3370)
!3384 = !DILocation(line: 63, column: 29, scope: !3368)
!3385 = !DILocation(line: 63, column: 5, scope: !3368)
!3386 = distinct !{!3386, !3291, !3387, !300}
!3387 = !DILocation(line: 65, column: 5, scope: !3292)
!3388 = !DILocation(line: 67, column: 16, scope: !3223)
!3389 = !DILocation(line: 67, column: 20, scope: !3223)
!3390 = !DILocation(line: 64, column: 27, scope: !3391, inlinedAt: !3395)
!3391 = distinct !DISubprogram(name: "EF", scope: !3392, file: !3392, line: 60, type: !3393, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3392 = !DIFile(filename: "../../../src/generic/echelon_form.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!3393 = !DISubroutineType(types: !3394)
!3394 = !{null, !61, !86, !86}
!3395 = distinct !DILocation(line: 67, column: 5, scope: !3223)
!3396 = !DILocalVariable(name: "A", arg: 1, scope: !3391, file: !3392, line: 60, type: !61)
!3397 = !DILocation(line: 0, scope: !3391, inlinedAt: !3395)
!3398 = !DILocalVariable(name: "nrows", arg: 2, scope: !3391, file: !3392, line: 60, type: !86)
!3399 = !DILocalVariable(name: "ncols", arg: 3, scope: !3391, file: !3392, line: 60, type: !86)
!3400 = !DILocalVariable(name: "_pivot_row", scope: !3391, file: !3392, line: 62, type: !3401, align: 256)
!3401 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 640, elements: !3402)
!3402 = !{!3403}
!3403 = !DISubrange(count: 10)
!3404 = !DILocation(line: 62, column: 27, scope: !3391, inlinedAt: !3395)
!3405 = !DILocalVariable(name: "_pivot_row2", scope: !3391, file: !3392, line: 63, type: !3401, align: 256)
!3406 = !DILocation(line: 63, column: 27, scope: !3391, inlinedAt: !3395)
!3407 = !DILocalVariable(name: "packed_A", scope: !3391, file: !3392, line: 64, type: !3408, align: 256)
!3408 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 90880, elements: !3409)
!3409 = !{!3410}
!3410 = !DISubrange(count: 1420)
!3411 = !DILocation(line: 66, column: 26, scope: !3391, inlinedAt: !3395)
!3412 = !DILocation(line: 66, column: 32, scope: !3391, inlinedAt: !3395)
!3413 = !DILocalVariable(name: "row_len", scope: !3391, file: !3392, line: 66, type: !86)
!3414 = !DILocalVariable(name: "i", scope: !3415, file: !3392, line: 69, type: !86)
!3415 = distinct !DILexicalBlock(scope: !3391, file: !3392, line: 69, column: 5)
!3416 = !DILocation(line: 0, scope: !3415, inlinedAt: !3395)
!3417 = !DILocation(line: 69, column: 10, scope: !3415, inlinedAt: !3395)
!3418 = !DILocation(line: 69, scope: !3415, inlinedAt: !3395)
!3419 = !DILocation(line: 69, column: 23, scope: !3420, inlinedAt: !3395)
!3420 = distinct !DILexicalBlock(scope: !3415, file: !3392, line: 69, column: 5)
!3421 = !DILocation(line: 69, column: 5, scope: !3415, inlinedAt: !3395)
!3422 = !DILocation(line: 77, column: 5, scope: !3423, inlinedAt: !3395)
!3423 = distinct !DILexicalBlock(scope: !3391, file: !3392, line: 77, column: 5)
!3424 = !DILocation(line: 70, column: 29, scope: !3425, inlinedAt: !3395)
!3425 = distinct !DILexicalBlock(scope: !3420, file: !3392, line: 69, column: 37)
!3426 = !DILocation(line: 70, column: 25, scope: !3425, inlinedAt: !3395)
!3427 = !DILocation(line: 70, column: 51, scope: !3425, inlinedAt: !3395)
!3428 = !DILocation(line: 70, column: 47, scope: !3425, inlinedAt: !3395)
!3429 = !DILocalVariable(name: "in", arg: 1, scope: !3430, file: !3392, line: 24, type: !90)
!3430 = distinct !DISubprogram(name: "ef_pack_m_vec", scope: !3392, file: !3392, line: 24, type: !3431, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3431 = !DISubroutineType(types: !3432)
!3432 = !{null, !90, !52, !86}
!3433 = !DILocation(line: 0, scope: !3430, inlinedAt: !3434)
!3434 = distinct !DILocation(line: 70, column: 9, scope: !3425, inlinedAt: !3395)
!3435 = !DILocalVariable(name: "out", arg: 2, scope: !3430, file: !3392, line: 24, type: !52)
!3436 = !DILocalVariable(name: "ncols", arg: 3, scope: !3430, file: !3392, line: 24, type: !86)
!3437 = !DILocalVariable(name: "out8", scope: !3430, file: !3392, line: 26, type: !61)
!3438 = !DILocalVariable(name: "i", scope: !3430, file: !3392, line: 25, type: !86)
!3439 = !DILocation(line: 27, column: 9, scope: !3440, inlinedAt: !3434)
!3440 = distinct !DILexicalBlock(scope: !3430, file: !3392, line: 27, column: 5)
!3441 = !DILocation(line: 27, scope: !3440, inlinedAt: !3434)
!3442 = !DILocation(line: 27, column: 20, scope: !3443, inlinedAt: !3434)
!3443 = distinct !DILexicalBlock(scope: !3440, file: !3392, line: 27, column: 5)
!3444 = !DILocation(line: 27, column: 5, scope: !3440, inlinedAt: !3434)
!3445 = !DILocation(line: 31, column: 23, scope: !3446, inlinedAt: !3434)
!3446 = distinct !DILexicalBlock(scope: !3443, file: !3392, line: 27, column: 36)
!3447 = !DILocation(line: 31, column: 44, scope: !3446, inlinedAt: !3434)
!3448 = !DILocation(line: 31, column: 40, scope: !3446, inlinedAt: !3434)
!3449 = !DILocation(line: 31, column: 48, scope: !3446, inlinedAt: !3434)
!3450 = !DILocation(line: 31, column: 37, scope: !3446, inlinedAt: !3434)
!3451 = !DILocation(line: 31, column: 15, scope: !3446, inlinedAt: !3434)
!3452 = !DILocation(line: 31, column: 9, scope: !3446, inlinedAt: !3434)
!3453 = !DILocation(line: 31, column: 20, scope: !3446, inlinedAt: !3434)
!3454 = !DILocation(line: 27, column: 31, scope: !3443, inlinedAt: !3434)
!3455 = !DILocation(line: 27, column: 5, scope: !3443, inlinedAt: !3434)
!3456 = distinct !{!3456, !3444, !3457, !300}
!3457 = !DILocation(line: 33, column: 5, scope: !3440, inlinedAt: !3434)
!3458 = !DILocation(line: 34, column: 19, scope: !3459, inlinedAt: !3434)
!3459 = distinct !DILexicalBlock(scope: !3430, file: !3392, line: 34, column: 9)
!3460 = !DILocation(line: 38, column: 23, scope: !3461, inlinedAt: !3434)
!3461 = distinct !DILexicalBlock(scope: !3459, file: !3392, line: 34, column: 24)
!3462 = !DILocation(line: 38, column: 15, scope: !3461, inlinedAt: !3434)
!3463 = !DILocation(line: 38, column: 9, scope: !3461, inlinedAt: !3434)
!3464 = !DILocation(line: 38, column: 20, scope: !3461, inlinedAt: !3434)
!3465 = !DILocation(line: 40, column: 5, scope: !3461, inlinedAt: !3434)
!3466 = !DILocation(line: 69, column: 33, scope: !3420, inlinedAt: !3395)
!3467 = !DILocation(line: 69, column: 5, scope: !3420, inlinedAt: !3395)
!3468 = distinct !{!3468, !3421, !3469, !300}
!3469 = !DILocation(line: 71, column: 5, scope: !3415, inlinedAt: !3395)
!3470 = !DILocation(line: 77, scope: !3423, inlinedAt: !3395)
!3471 = !DILocalVariable(name: "pivot_row", scope: !3391, file: !3392, line: 76, type: !86)
!3472 = !DILocalVariable(name: "pivot_col", scope: !3423, file: !3392, line: 77, type: !86)
!3473 = !DILocation(line: 0, scope: !3423, inlinedAt: !3395)
!3474 = !DILocation(line: 77, column: 39, scope: !3475, inlinedAt: !3395)
!3475 = distinct !DILexicalBlock(scope: !3423, file: !3392, line: 77, column: 5)
!3476 = !DILocation(line: 138, column: 5, scope: !3477, inlinedAt: !3395)
!3477 = distinct !DILexicalBlock(scope: !3391, file: !3392, line: 138, column: 5)
!3478 = !DILocation(line: 79, column: 37, scope: !3479, inlinedAt: !3395)
!3479 = distinct !DILexicalBlock(scope: !3475, file: !3392, line: 77, column: 61)
!3480 = !DILocalVariable(name: "pivot_row_lower_bound", scope: !3479, file: !3392, line: 79, type: !86)
!3481 = !DILocation(line: 0, scope: !3479, inlinedAt: !3395)
!3482 = !DILocation(line: 80, column: 37, scope: !3479, inlinedAt: !3395)
!3483 = !DILocalVariable(name: "pivot_row_upper_bound", scope: !3479, file: !3392, line: 80, type: !86)
!3484 = !DILocalVariable(name: "i", scope: !3485, file: !3392, line: 85, type: !86)
!3485 = distinct !DILexicalBlock(scope: !3479, file: !3392, line: 85, column: 9)
!3486 = !DILocation(line: 0, scope: !3485, inlinedAt: !3395)
!3487 = !DILocation(line: 85, column: 14, scope: !3485, inlinedAt: !3395)
!3488 = !DILocation(line: 85, scope: !3485, inlinedAt: !3395)
!3489 = !DILocation(line: 85, column: 27, scope: !3490, inlinedAt: !3395)
!3490 = distinct !DILexicalBlock(scope: !3485, file: !3392, line: 85, column: 9)
!3491 = !DILocation(line: 85, column: 9, scope: !3485, inlinedAt: !3395)
!3492 = !DILocation(line: 93, column: 9, scope: !3493, inlinedAt: !3395)
!3493 = distinct !DILexicalBlock(scope: !3479, file: !3392, line: 93, column: 9)
!3494 = !DILocation(line: 86, column: 13, scope: !3495, inlinedAt: !3395)
!3495 = distinct !DILexicalBlock(scope: !3490, file: !3392, line: 85, column: 43)
!3496 = !DILocation(line: 86, column: 27, scope: !3495, inlinedAt: !3395)
!3497 = !DILocation(line: 87, column: 13, scope: !3495, inlinedAt: !3395)
!3498 = !DILocation(line: 87, column: 28, scope: !3495, inlinedAt: !3395)
!3499 = !DILocation(line: 85, column: 39, scope: !3490, inlinedAt: !3395)
!3500 = !DILocation(line: 85, column: 9, scope: !3490, inlinedAt: !3395)
!3501 = distinct !{!3501, !3491, !3502, !300}
!3502 = !DILocation(line: 88, column: 9, scope: !3485, inlinedAt: !3395)
!3503 = !DILocation(line: 0, scope: !3493, inlinedAt: !3395)
!3504 = !DILocalVariable(name: "row", scope: !3493, file: !3392, line: 93, type: !86)
!3505 = !DILocalVariable(name: "pivot", scope: !3479, file: !3392, line: 91, type: !51)
!3506 = !DILocalVariable(name: "pivot_is_zero", scope: !3479, file: !3392, line: 92, type: !53)
!3507 = !DILocation(line: 94, column: 24, scope: !3508, inlinedAt: !3395)
!3508 = distinct !DILexicalBlock(scope: !3493, file: !3392, line: 93, column: 9)
!3509 = !DILocation(line: 94, column: 21, scope: !3508, inlinedAt: !3395)
!3510 = !DILocalVariable(name: "a", arg: 1, scope: !3511, file: !3512, line: 46, type: !86)
!3511 = distinct !DISubprogram(name: "ct_compare_64", scope: !3512, file: !3512, line: 46, type: !3513, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3512 = !DIFile(filename: "../../../src/arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!3513 = !DISubroutineType(types: !3514)
!3514 = !{!53, !86, !86}
!3515 = !DILocation(line: 0, scope: !3511, inlinedAt: !3516)
!3516 = distinct !DILocation(line: 96, column: 38, scope: !3517, inlinedAt: !3395)
!3517 = distinct !DILexicalBlock(scope: !3508, file: !3392, line: 94, column: 80)
!3518 = !DILocalVariable(name: "b", arg: 2, scope: !3511, file: !3512, line: 46, type: !86)
!3519 = !DILocation(line: 47, column: 38, scope: !3511, inlinedAt: !3516)
!3520 = !DILocation(line: 47, column: 73, scope: !3511, inlinedAt: !3516)
!3521 = !DILocation(line: 96, column: 37, scope: !3517, inlinedAt: !3395)
!3522 = !DILocalVariable(name: "is_pivot_row", scope: !3517, file: !3392, line: 96, type: !53)
!3523 = !DILocation(line: 0, scope: !3517, inlinedAt: !3395)
!3524 = !DILocalVariable(name: "a", arg: 1, scope: !3525, file: !3512, line: 35, type: !86)
!3525 = distinct !DISubprogram(name: "ct_64_is_greater_than", scope: !3512, file: !3512, line: 35, type: !3513, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3526 = !DILocation(line: 0, scope: !3525, inlinedAt: !3527)
!3527 = distinct !DILocation(line: 97, column: 40, scope: !3517, inlinedAt: !3395)
!3528 = !DILocalVariable(name: "b", arg: 2, scope: !3525, file: !3512, line: 35, type: !86)
!3529 = !DILocalVariable(name: "diff", scope: !3525, file: !3512, line: 36, type: !87)
!3530 = !DILocation(line: 37, column: 30, scope: !3525, inlinedAt: !3527)
!3531 = !DILocation(line: 37, column: 59, scope: !3525, inlinedAt: !3527)
!3532 = !DILocation(line: 37, column: 57, scope: !3525, inlinedAt: !3527)
!3533 = !DILocalVariable(name: "below_pivot_row", scope: !3517, file: !3392, line: 97, type: !53)
!3534 = !DILocalVariable(name: "j", scope: !3535, file: !3392, line: 99, type: !86)
!3535 = distinct !DILexicalBlock(scope: !3517, file: !3392, line: 99, column: 13)
!3536 = !DILocation(line: 0, scope: !3535, inlinedAt: !3395)
!3537 = !DILocation(line: 99, column: 18, scope: !3535, inlinedAt: !3395)
!3538 = !DILocation(line: 99, scope: !3535, inlinedAt: !3395)
!3539 = !DILocation(line: 99, column: 31, scope: !3540, inlinedAt: !3395)
!3540 = distinct !DILexicalBlock(scope: !3535, file: !3392, line: 99, column: 13)
!3541 = !DILocation(line: 99, column: 13, scope: !3535, inlinedAt: !3395)
!3542 = !DILocation(line: 100, column: 67, scope: !3543, inlinedAt: !3395)
!3543 = distinct !DILexicalBlock(scope: !3540, file: !3392, line: 99, column: 47)
!3544 = !DILocation(line: 100, column: 48, scope: !3543, inlinedAt: !3395)
!3545 = !DILocation(line: 101, column: 47, scope: !3543, inlinedAt: !3395)
!3546 = !DILocation(line: 101, column: 57, scope: !3543, inlinedAt: !3395)
!3547 = !DILocation(line: 101, column: 34, scope: !3543, inlinedAt: !3395)
!3548 = !DILocation(line: 100, column: 85, scope: !3543, inlinedAt: !3395)
!3549 = !DILocation(line: 100, column: 17, scope: !3543, inlinedAt: !3395)
!3550 = !DILocation(line: 100, column: 31, scope: !3543, inlinedAt: !3395)
!3551 = !DILocation(line: 99, column: 43, scope: !3540, inlinedAt: !3395)
!3552 = !DILocation(line: 99, column: 13, scope: !3540, inlinedAt: !3395)
!3553 = distinct !{!3553, !3541, !3554, !300}
!3554 = !DILocation(line: 102, column: 13, scope: !3535, inlinedAt: !3395)
!3555 = !DILocalVariable(name: "in", arg: 1, scope: !3556, file: !3392, line: 16, type: !488)
!3556 = distinct !DISubprogram(name: "m_extract_element", scope: !3392, file: !3392, line: 16, type: !3557, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3557 = !DISubroutineType(types: !3558)
!3558 = !{!51, !488, !86}
!3559 = !DILocation(line: 0, scope: !3556, inlinedAt: !3560)
!3560 = distinct !DILocation(line: 103, column: 21, scope: !3517, inlinedAt: !3395)
!3561 = !DILocalVariable(name: "index", arg: 2, scope: !3556, file: !3392, line: 16, type: !86)
!3562 = !DILocation(line: 17, column: 27, scope: !3556, inlinedAt: !3560)
!3563 = !DILocalVariable(name: "leg", scope: !3556, file: !3392, line: 17, type: !275)
!3564 = !DILocalVariable(name: "offset", scope: !3556, file: !3392, line: 18, type: !275)
!3565 = !DILocation(line: 20, column: 13, scope: !3556, inlinedAt: !3560)
!3566 = !DILocation(line: 20, column: 31, scope: !3556, inlinedAt: !3560)
!3567 = !DILocation(line: 20, column: 21, scope: !3556, inlinedAt: !3560)
!3568 = !DILocation(line: 20, column: 12, scope: !3556, inlinedAt: !3560)
!3569 = !DILocation(line: 0, scope: !3511, inlinedAt: !3570)
!3570 = distinct !DILocation(line: 104, column: 30, scope: !3517, inlinedAt: !3395)
!3571 = !DILocation(line: 47, column: 73, scope: !3511, inlinedAt: !3570)
!3572 = !DILocation(line: 104, column: 29, scope: !3517, inlinedAt: !3395)
!3573 = !DILocation(line: 94, column: 76, scope: !3508, inlinedAt: !3395)
!3574 = !DILocation(line: 93, column: 9, scope: !3508, inlinedAt: !3395)
!3575 = distinct !{!3575, !3492, !3576, !300}
!3576 = !DILocation(line: 105, column: 9, scope: !3493, inlinedAt: !3395)
!3577 = !DILocalVariable(name: "a", arg: 1, scope: !3578, file: !670, line: 56, type: !51)
!3578 = distinct !DISubprogram(name: "inverse_f", scope: !670, file: !670, line: 56, type: !3579, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3579 = !DISubroutineType(types: !3580)
!3580 = !{!51, !51}
!3581 = !DILocation(line: 0, scope: !3578, inlinedAt: !3582)
!3582 = distinct !DILocation(line: 108, column: 19, scope: !3479, inlinedAt: !3395)
!3583 = !DILocation(line: 0, scope: !3320, inlinedAt: !3584)
!3584 = distinct !DILocation(line: 60, column: 24, scope: !3578, inlinedAt: !3582)
!3585 = !DILocation(line: 13, column: 10, scope: !3320, inlinedAt: !3584)
!3586 = !DILocation(line: 13, column: 7, scope: !3320, inlinedAt: !3584)
!3587 = !DILocation(line: 16, column: 17, scope: !3320, inlinedAt: !3584)
!3588 = !DILocation(line: 17, column: 13, scope: !3320, inlinedAt: !3584)
!3589 = !DILocation(line: 17, column: 17, scope: !3320, inlinedAt: !3584)
!3590 = !DILocation(line: 17, column: 7, scope: !3320, inlinedAt: !3584)
!3591 = !DILocation(line: 18, column: 13, scope: !3320, inlinedAt: !3584)
!3592 = !DILocation(line: 18, column: 17, scope: !3320, inlinedAt: !3584)
!3593 = !DILocation(line: 18, column: 7, scope: !3320, inlinedAt: !3584)
!3594 = !DILocation(line: 19, column: 13, scope: !3320, inlinedAt: !3584)
!3595 = !DILocation(line: 19, column: 17, scope: !3320, inlinedAt: !3584)
!3596 = !DILocation(line: 19, column: 7, scope: !3320, inlinedAt: !3584)
!3597 = !DILocation(line: 23, column: 37, scope: !3320, inlinedAt: !3584)
!3598 = !DILocation(line: 23, column: 52, scope: !3320, inlinedAt: !3584)
!3599 = !DILocation(line: 23, column: 43, scope: !3320, inlinedAt: !3584)
!3600 = !DILocation(line: 23, column: 59, scope: !3320, inlinedAt: !3584)
!3601 = !DILocalVariable(name: "a2", scope: !3578, file: !670, line: 60, type: !51)
!3602 = !DILocation(line: 0, scope: !3320, inlinedAt: !3603)
!3603 = distinct !DILocation(line: 61, column: 24, scope: !3578, inlinedAt: !3582)
!3604 = !DILocation(line: 13, column: 10, scope: !3320, inlinedAt: !3603)
!3605 = !DILocation(line: 13, column: 7, scope: !3320, inlinedAt: !3603)
!3606 = !DILocation(line: 16, column: 17, scope: !3320, inlinedAt: !3603)
!3607 = !DILocation(line: 17, column: 13, scope: !3320, inlinedAt: !3603)
!3608 = !DILocation(line: 17, column: 17, scope: !3320, inlinedAt: !3603)
!3609 = !DILocation(line: 17, column: 7, scope: !3320, inlinedAt: !3603)
!3610 = !DILocation(line: 18, column: 13, scope: !3320, inlinedAt: !3603)
!3611 = !DILocation(line: 18, column: 17, scope: !3320, inlinedAt: !3603)
!3612 = !DILocation(line: 18, column: 7, scope: !3320, inlinedAt: !3603)
!3613 = !DILocation(line: 19, column: 13, scope: !3320, inlinedAt: !3603)
!3614 = !DILocation(line: 19, column: 17, scope: !3320, inlinedAt: !3603)
!3615 = !DILocation(line: 19, column: 7, scope: !3320, inlinedAt: !3603)
!3616 = !DILocation(line: 23, column: 37, scope: !3320, inlinedAt: !3603)
!3617 = !DILocation(line: 23, column: 52, scope: !3320, inlinedAt: !3603)
!3618 = !DILocation(line: 23, column: 43, scope: !3320, inlinedAt: !3603)
!3619 = !DILocation(line: 23, column: 59, scope: !3320, inlinedAt: !3603)
!3620 = !DILocalVariable(name: "a4", scope: !3578, file: !670, line: 61, type: !51)
!3621 = !DILocation(line: 0, scope: !3320, inlinedAt: !3622)
!3622 = distinct !DILocation(line: 62, column: 24, scope: !3578, inlinedAt: !3582)
!3623 = !DILocation(line: 13, column: 10, scope: !3320, inlinedAt: !3622)
!3624 = !DILocation(line: 13, column: 7, scope: !3320, inlinedAt: !3622)
!3625 = !DILocation(line: 16, column: 17, scope: !3320, inlinedAt: !3622)
!3626 = !DILocation(line: 17, column: 13, scope: !3320, inlinedAt: !3622)
!3627 = !DILocation(line: 17, column: 17, scope: !3320, inlinedAt: !3622)
!3628 = !DILocation(line: 17, column: 7, scope: !3320, inlinedAt: !3622)
!3629 = !DILocation(line: 18, column: 13, scope: !3320, inlinedAt: !3622)
!3630 = !DILocation(line: 18, column: 17, scope: !3320, inlinedAt: !3622)
!3631 = !DILocation(line: 18, column: 7, scope: !3320, inlinedAt: !3622)
!3632 = !DILocation(line: 19, column: 13, scope: !3320, inlinedAt: !3622)
!3633 = !DILocation(line: 19, column: 17, scope: !3320, inlinedAt: !3622)
!3634 = !DILocation(line: 19, column: 7, scope: !3320, inlinedAt: !3622)
!3635 = !DILocation(line: 23, column: 37, scope: !3320, inlinedAt: !3622)
!3636 = !DILocation(line: 23, column: 52, scope: !3320, inlinedAt: !3622)
!3637 = !DILocation(line: 23, column: 43, scope: !3320, inlinedAt: !3622)
!3638 = !DILocation(line: 23, column: 59, scope: !3320, inlinedAt: !3622)
!3639 = !DILocalVariable(name: "a8", scope: !3578, file: !670, line: 62, type: !51)
!3640 = !DILocation(line: 0, scope: !3320, inlinedAt: !3641)
!3641 = distinct !DILocation(line: 63, column: 24, scope: !3578, inlinedAt: !3582)
!3642 = !DILocation(line: 13, column: 10, scope: !3320, inlinedAt: !3641)
!3643 = !DILocation(line: 13, column: 7, scope: !3320, inlinedAt: !3641)
!3644 = !DILocation(line: 16, column: 17, scope: !3320, inlinedAt: !3641)
!3645 = !DILocation(line: 17, column: 13, scope: !3320, inlinedAt: !3641)
!3646 = !DILocation(line: 17, column: 17, scope: !3320, inlinedAt: !3641)
!3647 = !DILocation(line: 17, column: 7, scope: !3320, inlinedAt: !3641)
!3648 = !DILocation(line: 18, column: 13, scope: !3320, inlinedAt: !3641)
!3649 = !DILocation(line: 18, column: 17, scope: !3320, inlinedAt: !3641)
!3650 = !DILocation(line: 18, column: 7, scope: !3320, inlinedAt: !3641)
!3651 = !DILocation(line: 19, column: 13, scope: !3320, inlinedAt: !3641)
!3652 = !DILocation(line: 19, column: 17, scope: !3320, inlinedAt: !3641)
!3653 = !DILocation(line: 19, column: 7, scope: !3320, inlinedAt: !3641)
!3654 = !DILocation(line: 23, column: 37, scope: !3320, inlinedAt: !3641)
!3655 = !DILocation(line: 23, column: 52, scope: !3320, inlinedAt: !3641)
!3656 = !DILocation(line: 23, column: 43, scope: !3320, inlinedAt: !3641)
!3657 = !DILocation(line: 23, column: 59, scope: !3320, inlinedAt: !3641)
!3658 = !DILocalVariable(name: "a6", scope: !3578, file: !670, line: 63, type: !51)
!3659 = !DILocation(line: 0, scope: !3320, inlinedAt: !3660)
!3660 = distinct !DILocation(line: 64, column: 25, scope: !3578, inlinedAt: !3582)
!3661 = !DILocation(line: 13, column: 10, scope: !3320, inlinedAt: !3660)
!3662 = !DILocation(line: 13, column: 7, scope: !3320, inlinedAt: !3660)
!3663 = !DILocation(line: 16, column: 17, scope: !3320, inlinedAt: !3660)
!3664 = !DILocation(line: 17, column: 13, scope: !3320, inlinedAt: !3660)
!3665 = !DILocation(line: 17, column: 17, scope: !3320, inlinedAt: !3660)
!3666 = !DILocation(line: 17, column: 7, scope: !3320, inlinedAt: !3660)
!3667 = !DILocation(line: 18, column: 13, scope: !3320, inlinedAt: !3660)
!3668 = !DILocation(line: 18, column: 17, scope: !3320, inlinedAt: !3660)
!3669 = !DILocation(line: 18, column: 7, scope: !3320, inlinedAt: !3660)
!3670 = !DILocation(line: 19, column: 13, scope: !3320, inlinedAt: !3660)
!3671 = !DILocation(line: 19, column: 17, scope: !3320, inlinedAt: !3660)
!3672 = !DILocation(line: 19, column: 7, scope: !3320, inlinedAt: !3660)
!3673 = !DILocation(line: 23, column: 37, scope: !3320, inlinedAt: !3660)
!3674 = !DILocation(line: 23, column: 52, scope: !3320, inlinedAt: !3660)
!3675 = !DILocation(line: 23, column: 43, scope: !3320, inlinedAt: !3660)
!3676 = !DILocation(line: 23, column: 59, scope: !3320, inlinedAt: !3660)
!3677 = !DILocalVariable(name: "a14", scope: !3578, file: !670, line: 64, type: !51)
!3678 = !DILocalVariable(name: "inverse", scope: !3391, file: !3392, line: 75, type: !51)
!3679 = !DILocation(line: 109, column: 9, scope: !3479, inlinedAt: !3395)
!3680 = !DILocalVariable(name: "row", scope: !3681, file: !3392, line: 113, type: !86)
!3681 = distinct !DILexicalBlock(scope: !3479, file: !3392, line: 113, column: 9)
!3682 = !DILocation(line: 0, scope: !3681, inlinedAt: !3395)
!3683 = !DILocation(line: 113, column: 14, scope: !3681, inlinedAt: !3395)
!3684 = !DILocation(line: 113, scope: !3681, inlinedAt: !3395)
!3685 = !DILocation(line: 113, column: 51, scope: !3686, inlinedAt: !3395)
!3686 = distinct !DILexicalBlock(scope: !3681, file: !3392, line: 113, column: 9)
!3687 = !DILocation(line: 113, column: 9, scope: !3681, inlinedAt: !3395)
!3688 = !DILocation(line: 124, column: 9, scope: !3689, inlinedAt: !3395)
!3689 = distinct !DILexicalBlock(scope: !3479, file: !3392, line: 124, column: 9)
!3690 = !DILocation(line: 0, scope: !3511, inlinedAt: !3691)
!3691 = distinct !DILocation(line: 114, column: 33, scope: !3692, inlinedAt: !3395)
!3692 = distinct !DILexicalBlock(scope: !3686, file: !3392, line: 113, column: 84)
!3693 = !DILocation(line: 47, column: 38, scope: !3511, inlinedAt: !3691)
!3694 = !DILocation(line: 47, column: 44, scope: !3511, inlinedAt: !3691)
!3695 = !DILocation(line: 47, column: 73, scope: !3511, inlinedAt: !3691)
!3696 = !DILocation(line: 47, column: 71, scope: !3511, inlinedAt: !3691)
!3697 = !DILocation(line: 114, column: 63, scope: !3692, inlinedAt: !3395)
!3698 = !DILocalVariable(name: "do_copy", scope: !3692, file: !3392, line: 114, type: !53)
!3699 = !DILocation(line: 0, scope: !3692, inlinedAt: !3395)
!3700 = !DILocalVariable(name: "do_not_copy", scope: !3692, file: !3392, line: 115, type: !53)
!3701 = !DILocalVariable(name: "col", scope: !3702, file: !3392, line: 116, type: !86)
!3702 = distinct !DILexicalBlock(scope: !3692, file: !3392, line: 116, column: 13)
!3703 = !DILocation(line: 0, scope: !3702, inlinedAt: !3395)
!3704 = !DILocation(line: 116, column: 18, scope: !3702, inlinedAt: !3395)
!3705 = !DILocation(line: 116, scope: !3702, inlinedAt: !3395)
!3706 = !DILocation(line: 116, column: 35, scope: !3707, inlinedAt: !3395)
!3707 = distinct !DILexicalBlock(scope: !3702, file: !3392, line: 116, column: 13)
!3708 = !DILocation(line: 116, column: 13, scope: !3702, inlinedAt: !3395)
!3709 = !DILocation(line: 118, column: 49, scope: !3710, inlinedAt: !3395)
!3710 = distinct !DILexicalBlock(scope: !3707, file: !3392, line: 116, column: 53)
!3711 = !DILocation(line: 118, column: 59, scope: !3710, inlinedAt: !3395)
!3712 = !DILocation(line: 118, column: 36, scope: !3710, inlinedAt: !3395)
!3713 = !DILocation(line: 118, column: 34, scope: !3710, inlinedAt: !3395)
!3714 = !DILocation(line: 119, column: 32, scope: !3710, inlinedAt: !3395)
!3715 = !DILocation(line: 119, column: 30, scope: !3710, inlinedAt: !3395)
!3716 = !DILocation(line: 118, column: 67, scope: !3710, inlinedAt: !3395)
!3717 = !DILocation(line: 117, column: 30, scope: !3710, inlinedAt: !3395)
!3718 = !DILocation(line: 117, column: 40, scope: !3710, inlinedAt: !3395)
!3719 = !DILocation(line: 117, column: 17, scope: !3710, inlinedAt: !3395)
!3720 = !DILocation(line: 117, column: 47, scope: !3710, inlinedAt: !3395)
!3721 = !DILocation(line: 116, column: 49, scope: !3707, inlinedAt: !3395)
!3722 = !DILocation(line: 116, column: 13, scope: !3707, inlinedAt: !3395)
!3723 = distinct !{!3723, !3708, !3724, !300}
!3724 = !DILocation(line: 120, column: 13, scope: !3702, inlinedAt: !3395)
!3725 = !DILocation(line: 113, column: 80, scope: !3686, inlinedAt: !3395)
!3726 = !DILocation(line: 113, column: 9, scope: !3686, inlinedAt: !3395)
!3727 = distinct !{!3727, !3687, !3728, !300}
!3728 = !DILocation(line: 121, column: 9, scope: !3681, inlinedAt: !3395)
!3729 = !DILocation(line: 124, scope: !3689, inlinedAt: !3395)
!3730 = !DILocalVariable(name: "row", scope: !3689, file: !3392, line: 124, type: !86)
!3731 = !DILocation(line: 0, scope: !3689, inlinedAt: !3395)
!3732 = !DILocation(line: 124, column: 51, scope: !3733, inlinedAt: !3395)
!3733 = distinct !DILexicalBlock(scope: !3689, file: !3392, line: 124, column: 9)
!3734 = !DILocation(line: 125, column: 46, scope: !3735, inlinedAt: !3395)
!3735 = distinct !DILexicalBlock(scope: !3733, file: !3392, line: 124, column: 67)
!3736 = !DILocalVariable(name: "below_pivot", scope: !3735, file: !3392, line: 125, type: !51)
!3737 = !DILocation(line: 0, scope: !3735, inlinedAt: !3395)
!3738 = !DILocation(line: 126, column: 74, scope: !3735, inlinedAt: !3395)
!3739 = !DILocation(line: 126, column: 68, scope: !3735, inlinedAt: !3395)
!3740 = !DILocation(line: 0, scope: !3556, inlinedAt: !3741)
!3741 = distinct !DILocation(line: 126, column: 41, scope: !3735, inlinedAt: !3395)
!3742 = !DILocation(line: 17, column: 27, scope: !3556, inlinedAt: !3741)
!3743 = !DILocation(line: 20, column: 13, scope: !3556, inlinedAt: !3741)
!3744 = !DILocation(line: 20, column: 31, scope: !3556, inlinedAt: !3741)
!3745 = !DILocation(line: 20, column: 21, scope: !3556, inlinedAt: !3741)
!3746 = !DILocation(line: 20, column: 12, scope: !3556, inlinedAt: !3741)
!3747 = !DILocalVariable(name: "elt_to_elim", scope: !3735, file: !3392, line: 126, type: !51)
!3748 = !DILocation(line: 128, column: 63, scope: !3735, inlinedAt: !3395)
!3749 = !DILocation(line: 129, column: 52, scope: !3735, inlinedAt: !3395)
!3750 = !DILocation(line: 129, column: 46, scope: !3735, inlinedAt: !3395)
!3751 = !DILocation(line: 128, column: 13, scope: !3735, inlinedAt: !3395)
!3752 = !DILocation(line: 124, column: 63, scope: !3733, inlinedAt: !3395)
!3753 = !DILocation(line: 124, column: 9, scope: !3733, inlinedAt: !3395)
!3754 = distinct !{!3754, !3688, !3755, !300}
!3755 = !DILocation(line: 130, column: 9, scope: !3689, inlinedAt: !3395)
!3756 = !DILocation(line: 132, column: 19, scope: !3479, inlinedAt: !3395)
!3757 = !DILocation(line: 77, column: 57, scope: !3475, inlinedAt: !3395)
!3758 = !DILocation(line: 77, column: 5, scope: !3475, inlinedAt: !3395)
!3759 = distinct !{!3759, !3422, !3760, !300}
!3760 = !DILocation(line: 133, column: 5, scope: !3423, inlinedAt: !3395)
!3761 = !DILocation(line: 138, scope: !3477, inlinedAt: !3395)
!3762 = !DILocalVariable(name: "i", scope: !3477, file: !3392, line: 138, type: !86)
!3763 = !DILocation(line: 0, scope: !3477, inlinedAt: !3395)
!3764 = !DILocation(line: 138, column: 23, scope: !3765, inlinedAt: !3395)
!3765 = distinct !DILexicalBlock(scope: !3477, file: !3392, line: 138, column: 5)
!3766 = !DILocation(line: 139, column: 47, scope: !3767, inlinedAt: !3395)
!3767 = distinct !DILexicalBlock(scope: !3765, file: !3392, line: 138, column: 37)
!3768 = !DILocation(line: 139, column: 43, scope: !3767, inlinedAt: !3395)
!3769 = !DILocalVariable(name: "legs", arg: 1, scope: !3770, file: !3392, line: 44, type: !86)
!3770 = distinct !DISubprogram(name: "ef_unpack_m_vec", scope: !3392, file: !3392, line: 44, type: !3771, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3771 = !DISubroutineType(types: !3772)
!3772 = !{null, !86, !488, !61}
!3773 = !DILocation(line: 0, scope: !3770, inlinedAt: !3774)
!3774 = distinct !DILocation(line: 139, column: 9, scope: !3767, inlinedAt: !3395)
!3775 = !DILocalVariable(name: "in", arg: 2, scope: !3770, file: !3392, line: 44, type: !488)
!3776 = !DILocalVariable(name: "out", arg: 3, scope: !3770, file: !3392, line: 44, type: !61)
!3777 = !DILocalVariable(name: "in8", scope: !3770, file: !3392, line: 45, type: !90)
!3778 = !DILocalVariable(name: "i", scope: !3779, file: !3392, line: 46, type: !86)
!3779 = distinct !DILexicalBlock(scope: !3770, file: !3392, line: 46, column: 5)
!3780 = !DILocation(line: 0, scope: !3779, inlinedAt: !3774)
!3781 = !DILocation(line: 46, column: 9, scope: !3779, inlinedAt: !3774)
!3782 = !DILocation(line: 46, scope: !3779, inlinedAt: !3774)
!3783 = !DILocation(line: 46, column: 29, scope: !3784, inlinedAt: !3774)
!3784 = distinct !DILexicalBlock(scope: !3779, file: !3392, line: 46, column: 5)
!3785 = !DILocation(line: 46, column: 22, scope: !3784, inlinedAt: !3774)
!3786 = !DILocation(line: 46, column: 5, scope: !3779, inlinedAt: !3774)
!3787 = !DILocation(line: 140, column: 9, scope: !3788, inlinedAt: !3395)
!3788 = distinct !DILexicalBlock(scope: !3767, file: !3392, line: 140, column: 9)
!3789 = !DILocation(line: 51, column: 26, scope: !3790, inlinedAt: !3774)
!3790 = distinct !DILexicalBlock(scope: !3784, file: !3392, line: 46, column: 42)
!3791 = !DILocation(line: 51, column: 21, scope: !3790, inlinedAt: !3774)
!3792 = !DILocation(line: 51, column: 31, scope: !3790, inlinedAt: !3774)
!3793 = !DILocation(line: 51, column: 9, scope: !3790, inlinedAt: !3774)
!3794 = !DILocation(line: 51, column: 18, scope: !3790, inlinedAt: !3774)
!3795 = !DILocation(line: 52, column: 26, scope: !3790, inlinedAt: !3774)
!3796 = !DILocation(line: 52, column: 21, scope: !3790, inlinedAt: !3774)
!3797 = !DILocation(line: 52, column: 30, scope: !3790, inlinedAt: !3774)
!3798 = !DILocation(line: 52, column: 14, scope: !3790, inlinedAt: !3774)
!3799 = !DILocation(line: 52, column: 9, scope: !3790, inlinedAt: !3774)
!3800 = !DILocation(line: 52, column: 18, scope: !3790, inlinedAt: !3774)
!3801 = !DILocation(line: 46, column: 37, scope: !3784, inlinedAt: !3774)
!3802 = !DILocation(line: 46, column: 5, scope: !3784, inlinedAt: !3774)
!3803 = distinct !{!3803, !3786, !3804, !300}
!3804 = !DILocation(line: 54, column: 5, scope: !3779, inlinedAt: !3774)
!3805 = !DILocation(line: 140, scope: !3788, inlinedAt: !3395)
!3806 = !DILocalVariable(name: "j", scope: !3788, file: !3392, line: 140, type: !86)
!3807 = !DILocation(line: 0, scope: !3788, inlinedAt: !3395)
!3808 = !DILocation(line: 140, column: 27, scope: !3809, inlinedAt: !3395)
!3809 = distinct !DILexicalBlock(scope: !3788, file: !3392, line: 140, column: 9)
!3810 = !DILocation(line: 141, column: 32, scope: !3811, inlinedAt: !3395)
!3811 = distinct !DILexicalBlock(scope: !3809, file: !3392, line: 140, column: 41)
!3812 = !DILocation(line: 141, column: 17, scope: !3811, inlinedAt: !3395)
!3813 = !DILocation(line: 141, column: 13, scope: !3811, inlinedAt: !3395)
!3814 = !DILocation(line: 141, column: 30, scope: !3811, inlinedAt: !3395)
!3815 = !DILocation(line: 140, column: 37, scope: !3809, inlinedAt: !3395)
!3816 = !DILocation(line: 140, column: 9, scope: !3809, inlinedAt: !3395)
!3817 = distinct !{!3817, !3787, !3818, !300}
!3818 = !DILocation(line: 142, column: 9, scope: !3788, inlinedAt: !3395)
!3819 = !DILocation(line: 138, column: 33, scope: !3765, inlinedAt: !3395)
!3820 = !DILocation(line: 138, column: 5, scope: !3765, inlinedAt: !3395)
!3821 = distinct !{!3821, !3476, !3822, !300}
!3822 = !DILocation(line: 143, column: 5, scope: !3477, inlinedAt: !3395)
!3823 = !DILocation(line: 145, column: 5, scope: !3391, inlinedAt: !3395)
!3824 = !DILocation(line: 146, column: 5, scope: !3391, inlinedAt: !3395)
!3825 = !DILocation(line: 147, column: 5, scope: !3391, inlinedAt: !3395)
!3826 = !DILocation(line: 148, column: 5, scope: !3391, inlinedAt: !3395)
!3827 = !DILocation(line: 149, column: 1, scope: !3391, inlinedAt: !3395)
!3828 = !DILocalVariable(name: "full_rank", scope: !3223, file: !99, line: 70, type: !51)
!3829 = !DILocalVariable(name: "i", scope: !3830, file: !99, line: 71, type: !86)
!3830 = distinct !DILexicalBlock(scope: !3223, file: !99, line: 71, column: 5)
!3831 = !DILocation(line: 0, scope: !3830)
!3832 = !DILocation(line: 71, column: 10, scope: !3830)
!3833 = !DILocation(line: 71, scope: !3830)
!3834 = !DILocation(line: 71, column: 23, scope: !3835)
!3835 = distinct !DILexicalBlock(scope: !3830, file: !99, line: 71, column: 5)
!3836 = !DILocation(line: 71, column: 5, scope: !3830)
!3837 = !DILocation(line: 72, column: 27, scope: !3838)
!3838 = distinct !DILexicalBlock(scope: !3835, file: !99, line: 71, column: 42)
!3839 = !DILocation(line: 72, column: 32, scope: !3838)
!3840 = !DILocation(line: 72, column: 22, scope: !3838)
!3841 = !DILocation(line: 72, column: 19, scope: !3838)
!3842 = !DILocation(line: 71, column: 38, scope: !3835)
!3843 = !DILocation(line: 71, column: 5, scope: !3835)
!3844 = distinct !{!3844, !3836, !3845, !300}
!3845 = !DILocation(line: 73, column: 5, scope: !3830)
!3846 = !DILocation(line: 80, column: 19, scope: !3847)
!3847 = distinct !DILexicalBlock(scope: !3223, file: !99, line: 80, column: 9)
!3848 = !DILocation(line: 88, column: 5, scope: !3849)
!3849 = distinct !DILexicalBlock(scope: !3223, file: !99, line: 88, column: 5)
!3850 = distinct !{!3850, !3848, !3851, !300}
!3851 = !DILocation(line: 122, column: 5, scope: !3849)
!3852 = !DILocation(line: 88, scope: !3849)
!3853 = !DILocalVariable(name: "row", scope: !3849, file: !99, line: 88, type: !86)
!3854 = !DILocation(line: 0, scope: !3849)
!3855 = !DILocation(line: 88, column: 31, scope: !3856)
!3856 = distinct !DILexicalBlock(scope: !3849, file: !99, line: 88, column: 5)
!3857 = !DILocalVariable(name: "finished", scope: !3223, file: !99, line: 46, type: !51)
!3858 = !DILocation(line: 90, column: 27, scope: !3859)
!3859 = distinct !DILexicalBlock(scope: !3856, file: !99, line: 88, column: 44)
!3860 = !DILocalVariable(name: "col_upper_bound", scope: !3223, file: !99, line: 47, type: !86)
!3861 = !DILocalVariable(name: "col", scope: !3862, file: !99, line: 93, type: !86)
!3862 = distinct !DILexicalBlock(scope: !3859, file: !99, line: 93, column: 9)
!3863 = !DILocation(line: 0, scope: !3862)
!3864 = !DILocation(line: 93, column: 14, scope: !3862)
!3865 = !DILocation(line: 0, scope: !3859)
!3866 = !DILocation(line: 93, scope: !3862)
!3867 = !DILocation(line: 93, column: 33, scope: !3868)
!3868 = distinct !DILexicalBlock(scope: !3862, file: !99, line: 93, column: 9)
!3869 = !DILocation(line: 93, column: 9, scope: !3862)
!3870 = !DILocation(line: 97, column: 50, scope: !3871)
!3871 = distinct !DILexicalBlock(scope: !3868, file: !99, line: 93, column: 60)
!3872 = !DILocation(line: 97, column: 44, scope: !3871)
!3873 = !DILocalVariable(name: "a", arg: 1, scope: !3874, file: !3512, line: 51, type: !51)
!3874 = distinct !DISubprogram(name: "ct_compare_8", scope: !3512, file: !3512, line: 51, type: !1536, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3875 = !DILocation(line: 0, scope: !3874, inlinedAt: !3876)
!3876 = distinct !DILocation(line: 97, column: 30, scope: !3871)
!3877 = !DILocalVariable(name: "b", arg: 2, scope: !3874, file: !3512, line: 51, type: !51)
!3878 = !DILocation(line: 52, column: 42, scope: !3874, inlinedAt: !3876)
!3879 = !DILocation(line: 52, column: 13, scope: !3874, inlinedAt: !3876)
!3880 = !DILocation(line: 52, column: 71, scope: !3874, inlinedAt: !3876)
!3881 = !DILocation(line: 52, column: 69, scope: !3874, inlinedAt: !3876)
!3882 = !DILocation(line: 97, column: 73, scope: !3871)
!3883 = !DILocalVariable(name: "correct_column", scope: !3223, file: !99, line: 48, type: !51)
!3884 = !DILocation(line: 99, column: 63, scope: !3871)
!3885 = !DILocation(line: 99, column: 48, scope: !3871)
!3886 = !DILocation(line: 99, column: 46, scope: !3871)
!3887 = !DILocalVariable(name: "u", scope: !3871, file: !99, line: 99, type: !51)
!3888 = !DILocation(line: 0, scope: !3871)
!3889 = !DILocation(line: 100, column: 13, scope: !3871)
!3890 = !DILocation(line: 100, column: 20, scope: !3871)
!3891 = !DILocalVariable(name: "i", scope: !3892, file: !99, line: 102, type: !86)
!3892 = distinct !DILexicalBlock(scope: !3871, file: !99, line: 102, column: 13)
!3893 = !DILocation(line: 0, scope: !3892)
!3894 = !DILocation(line: 102, column: 18, scope: !3892)
!3895 = !DILocation(line: 102, scope: !3892)
!3896 = !DILocation(line: 102, column: 31, scope: !3897)
!3897 = distinct !DILexicalBlock(scope: !3892, file: !99, line: 102, column: 13)
!3898 = !DILocation(line: 102, column: 13, scope: !3892)
!3899 = !DILocation(line: 103, column: 53, scope: !3900)
!3900 = distinct !DILexicalBlock(scope: !3897, file: !99, line: 102, column: 46)
!3901 = !DILocation(line: 103, column: 45, scope: !3900)
!3902 = !DILocation(line: 103, column: 34, scope: !3900)
!3903 = !DILocation(line: 103, column: 95, scope: !3900)
!3904 = !DILocation(line: 103, column: 99, scope: !3900)
!3905 = !DILocation(line: 103, column: 91, scope: !3900)
!3906 = !DILocation(line: 103, column: 80, scope: !3900)
!3907 = !DILocation(line: 103, column: 115, scope: !3900)
!3908 = !DILocation(line: 103, column: 76, scope: !3900)
!3909 = !DILocation(line: 104, column: 49, scope: !3900)
!3910 = !DILocation(line: 104, column: 53, scope: !3900)
!3911 = !DILocation(line: 104, column: 45, scope: !3900)
!3912 = !DILocation(line: 104, column: 34, scope: !3900)
!3913 = !DILocation(line: 104, column: 69, scope: !3900)
!3914 = !DILocation(line: 104, column: 30, scope: !3900)
!3915 = !DILocation(line: 104, column: 95, scope: !3900)
!3916 = !DILocation(line: 104, column: 99, scope: !3900)
!3917 = !DILocation(line: 104, column: 91, scope: !3900)
!3918 = !DILocation(line: 104, column: 80, scope: !3900)
!3919 = !DILocation(line: 104, column: 115, scope: !3900)
!3920 = !DILocation(line: 104, column: 76, scope: !3900)
!3921 = !DILocation(line: 105, column: 49, scope: !3900)
!3922 = !DILocation(line: 105, column: 53, scope: !3900)
!3923 = !DILocation(line: 105, column: 45, scope: !3900)
!3924 = !DILocation(line: 105, column: 34, scope: !3900)
!3925 = !DILocation(line: 105, column: 69, scope: !3900)
!3926 = !DILocation(line: 105, column: 30, scope: !3900)
!3927 = !DILocation(line: 105, column: 95, scope: !3900)
!3928 = !DILocation(line: 105, column: 99, scope: !3900)
!3929 = !DILocation(line: 105, column: 91, scope: !3900)
!3930 = !DILocation(line: 105, column: 80, scope: !3900)
!3931 = !DILocation(line: 105, column: 115, scope: !3900)
!3932 = !DILocation(line: 105, column: 76, scope: !3900)
!3933 = !DILocation(line: 106, column: 49, scope: !3900)
!3934 = !DILocation(line: 106, column: 53, scope: !3900)
!3935 = !DILocation(line: 106, column: 45, scope: !3900)
!3936 = !DILocation(line: 106, column: 34, scope: !3900)
!3937 = !DILocation(line: 106, column: 69, scope: !3900)
!3938 = !DILocation(line: 106, column: 30, scope: !3900)
!3939 = !DILocation(line: 106, column: 95, scope: !3900)
!3940 = !DILocation(line: 106, column: 99, scope: !3900)
!3941 = !DILocation(line: 106, column: 91, scope: !3900)
!3942 = !DILocation(line: 106, column: 80, scope: !3900)
!3943 = !DILocation(line: 106, column: 115, scope: !3900)
!3944 = !DILocation(line: 106, column: 76, scope: !3900)
!3945 = !DILocalVariable(name: "tmp", scope: !3900, file: !99, line: 103, type: !53)
!3946 = !DILocation(line: 0, scope: !3900)
!3947 = !DILocalVariable(name: "a", arg: 1, scope: !3948, file: !670, line: 27, type: !51)
!3948 = distinct !DISubprogram(name: "mul_fx8", scope: !670, file: !670, line: 27, type: !3949, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3949 = !DISubroutineType(types: !3950)
!3950 = !{!53, !51, !53}
!3951 = !DILocation(line: 0, scope: !3948, inlinedAt: !3952)
!3952 = distinct !DILocation(line: 108, column: 23, scope: !3900)
!3953 = !DILocalVariable(name: "b", arg: 2, scope: !3948, file: !670, line: 27, type: !53)
!3954 = !DILocation(line: 30, column: 13, scope: !3948, inlinedAt: !3952)
!3955 = !DILocation(line: 30, column: 10, scope: !3948, inlinedAt: !3952)
!3956 = !DILocation(line: 30, column: 17, scope: !3948, inlinedAt: !3952)
!3957 = !DILocalVariable(name: "p", scope: !3948, file: !670, line: 29, type: !53)
!3958 = !DILocation(line: 31, column: 13, scope: !3948, inlinedAt: !3952)
!3959 = !DILocation(line: 31, column: 10, scope: !3948, inlinedAt: !3952)
!3960 = !DILocation(line: 31, column: 17, scope: !3948, inlinedAt: !3952)
!3961 = !DILocation(line: 31, column: 7, scope: !3948, inlinedAt: !3952)
!3962 = !DILocation(line: 32, column: 13, scope: !3948, inlinedAt: !3952)
!3963 = !DILocation(line: 32, column: 10, scope: !3948, inlinedAt: !3952)
!3964 = !DILocation(line: 32, column: 17, scope: !3948, inlinedAt: !3952)
!3965 = !DILocation(line: 32, column: 7, scope: !3948, inlinedAt: !3952)
!3966 = !DILocation(line: 33, column: 13, scope: !3948, inlinedAt: !3952)
!3967 = !DILocation(line: 33, column: 10, scope: !3948, inlinedAt: !3952)
!3968 = !DILocation(line: 33, column: 17, scope: !3948, inlinedAt: !3952)
!3969 = !DILocation(line: 33, column: 7, scope: !3948, inlinedAt: !3952)
!3970 = !DILocalVariable(name: "top_p", scope: !3948, file: !670, line: 36, type: !53)
!3971 = !DILocation(line: 37, column: 32, scope: !3948, inlinedAt: !3952)
!3972 = !DILocation(line: 37, column: 47, scope: !3948, inlinedAt: !3952)
!3973 = !DILocation(line: 37, column: 38, scope: !3948, inlinedAt: !3952)
!3974 = !DILocalVariable(name: "out", scope: !3948, file: !670, line: 37, type: !53)
!3975 = !DILocation(line: 110, column: 34, scope: !3900)
!3976 = !DILocation(line: 110, column: 17, scope: !3900)
!3977 = !DILocation(line: 110, column: 48, scope: !3900)
!3978 = !DILocation(line: 111, column: 56, scope: !3900)
!3979 = !DILocation(line: 111, column: 34, scope: !3900)
!3980 = !DILocation(line: 111, column: 17, scope: !3900)
!3981 = !DILocation(line: 111, column: 48, scope: !3900)
!3982 = !DILocation(line: 112, column: 56, scope: !3900)
!3983 = !DILocation(line: 112, column: 34, scope: !3900)
!3984 = !DILocation(line: 112, column: 17, scope: !3900)
!3985 = !DILocation(line: 112, column: 48, scope: !3900)
!3986 = !DILocation(line: 113, column: 56, scope: !3900)
!3987 = !DILocation(line: 113, column: 34, scope: !3900)
!3988 = !DILocation(line: 113, column: 17, scope: !3900)
!3989 = !DILocation(line: 113, column: 48, scope: !3900)
!3990 = !DILocation(line: 114, column: 56, scope: !3900)
!3991 = !DILocation(line: 114, column: 34, scope: !3900)
!3992 = !DILocation(line: 114, column: 17, scope: !3900)
!3993 = !DILocation(line: 114, column: 48, scope: !3900)
!3994 = !DILocation(line: 115, column: 56, scope: !3900)
!3995 = !DILocation(line: 115, column: 34, scope: !3900)
!3996 = !DILocation(line: 115, column: 17, scope: !3900)
!3997 = !DILocation(line: 115, column: 48, scope: !3900)
!3998 = !DILocation(line: 116, column: 56, scope: !3900)
!3999 = !DILocation(line: 116, column: 34, scope: !3900)
!4000 = !DILocation(line: 116, column: 17, scope: !3900)
!4001 = !DILocation(line: 116, column: 48, scope: !3900)
!4002 = !DILocation(line: 117, column: 56, scope: !3900)
!4003 = !DILocation(line: 117, column: 34, scope: !3900)
!4004 = !DILocation(line: 117, column: 17, scope: !3900)
!4005 = !DILocation(line: 117, column: 48, scope: !3900)
!4006 = !DILocation(line: 102, column: 40, scope: !3897)
!4007 = !DILocation(line: 102, column: 13, scope: !3897)
!4008 = distinct !{!4008, !3898, !4009, !300}
!4009 = !DILocation(line: 118, column: 13, scope: !3892)
!4010 = !DILocation(line: 120, column: 33, scope: !3871)
!4011 = !DILocation(line: 93, column: 56, scope: !3868)
!4012 = !DILocation(line: 93, column: 9, scope: !3868)
!4013 = distinct !{!4013, !3869, !4014, !300}
!4014 = !DILocation(line: 121, column: 9, scope: !3862)
!4015 = !DILocation(line: 124, column: 1, scope: !3223)
!4016 = distinct !DISubprogram(name: "vec_mul_add_u64", scope: !3512, file: !3512, line: 94, type: !4017, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!4017 = !DISubroutineType(types: !4018)
!4018 = !{null, !275, !488, !51, !52}
!4019 = !DILocalVariable(name: "legs", arg: 1, scope: !4016, file: !3512, line: 94, type: !275)
!4020 = !DILocation(line: 0, scope: !4016)
!4021 = !DILocalVariable(name: "in", arg: 2, scope: !4016, file: !3512, line: 94, type: !488)
!4022 = !DILocalVariable(name: "a", arg: 3, scope: !4016, file: !3512, line: 94, type: !51)
!4023 = !DILocalVariable(name: "acc", arg: 4, scope: !4016, file: !3512, line: 94, type: !52)
!4024 = !DILocalVariable(name: "b", arg: 1, scope: !4025, file: !670, line: 128, type: !174)
!4025 = distinct !DISubprogram(name: "mul_table", scope: !670, file: !670, line: 128, type: !671, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!4026 = !DILocation(line: 0, scope: !4025, inlinedAt: !4027)
!4027 = distinct !DILocation(line: 95, column: 20, scope: !4016)
!4028 = !DILocation(line: 129, column: 19, scope: !4025, inlinedAt: !4027)
!4029 = !DILocation(line: 129, column: 33, scope: !4025, inlinedAt: !4027)
!4030 = !DILocalVariable(name: "x", scope: !4025, file: !670, line: 129, type: !62)
!4031 = !DILocalVariable(name: "high_nibble_mask", scope: !4025, file: !670, line: 131, type: !62)
!4032 = !DILocation(line: 133, column: 28, scope: !4025, inlinedAt: !4027)
!4033 = !DILocalVariable(name: "high_half", scope: !4025, file: !670, line: 133, type: !62)
!4034 = !DILocation(line: 134, column: 28, scope: !4025, inlinedAt: !4027)
!4035 = !DILocation(line: 134, column: 47, scope: !4025, inlinedAt: !4027)
!4036 = !DILocation(line: 134, column: 34, scope: !4025, inlinedAt: !4027)
!4037 = !DILocalVariable(name: "tab", scope: !4016, file: !3512, line: 95, type: !62)
!4038 = !DILocalVariable(name: "lsb_ask", scope: !4016, file: !3512, line: 97, type: !53)
!4039 = !DILocalVariable(name: "i", scope: !4040, file: !3512, line: 99, type: !86)
!4040 = distinct !DILexicalBlock(scope: !4016, file: !3512, line: 99, column: 5)
!4041 = !DILocation(line: 0, scope: !4040)
!4042 = !DILocation(line: 99, column: 9, scope: !4040)
!4043 = !DILocation(line: 99, scope: !4040)
!4044 = !DILocation(line: 99, column: 20, scope: !4045)
!4045 = distinct !DILexicalBlock(scope: !4040, file: !3512, line: 99, column: 5)
!4046 = !DILocation(line: 99, column: 5, scope: !4040)
!4047 = !DILocation(line: 100, column: 21, scope: !4048)
!4048 = distinct !DILexicalBlock(scope: !4045, file: !3512, line: 99, column: 32)
!4049 = !DILocation(line: 100, column: 33, scope: !4048)
!4050 = !DILocation(line: 100, column: 51, scope: !4048)
!4051 = !DILocation(line: 100, column: 46, scope: !4048)
!4052 = !DILocation(line: 100, column: 44, scope: !4048)
!4053 = !DILocation(line: 101, column: 27, scope: !4048)
!4054 = !DILocation(line: 101, column: 33, scope: !4048)
!4055 = !DILocation(line: 101, column: 52, scope: !4048)
!4056 = !DILocation(line: 101, column: 59, scope: !4048)
!4057 = !DILocation(line: 101, column: 46, scope: !4048)
!4058 = !DILocation(line: 101, column: 44, scope: !4048)
!4059 = !DILocation(line: 101, column: 17, scope: !4048)
!4060 = !DILocation(line: 102, column: 21, scope: !4048)
!4061 = !DILocation(line: 102, column: 27, scope: !4048)
!4062 = !DILocation(line: 102, column: 33, scope: !4048)
!4063 = !DILocation(line: 102, column: 52, scope: !4048)
!4064 = !DILocation(line: 102, column: 59, scope: !4048)
!4065 = !DILocation(line: 102, column: 46, scope: !4048)
!4066 = !DILocation(line: 102, column: 44, scope: !4048)
!4067 = !DILocation(line: 102, column: 17, scope: !4048)
!4068 = !DILocation(line: 103, column: 21, scope: !4048)
!4069 = !DILocation(line: 103, column: 27, scope: !4048)
!4070 = !DILocation(line: 103, column: 33, scope: !4048)
!4071 = !DILocation(line: 103, column: 52, scope: !4048)
!4072 = !DILocation(line: 103, column: 59, scope: !4048)
!4073 = !DILocation(line: 103, column: 46, scope: !4048)
!4074 = !DILocation(line: 103, column: 44, scope: !4048)
!4075 = !DILocation(line: 103, column: 17, scope: !4048)
!4076 = !DILocation(line: 100, column: 9, scope: !4048)
!4077 = !DILocation(line: 100, column: 16, scope: !4048)
!4078 = !DILocation(line: 99, column: 29, scope: !4045)
!4079 = !DILocation(line: 99, column: 5, scope: !4045)
!4080 = distinct !{!4080, !4046, !4081, !300}
!4081 = !DILocation(line: 104, column: 5, scope: !4040)
!4082 = !DILocation(line: 105, column: 1, scope: !4016)
