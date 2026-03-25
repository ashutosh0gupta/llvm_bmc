; ModuleID = 'composite'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

%struct.sk_t = type { [18525 x i64], [624 x i8] }

@__const.example_mayo.msg = private unnamed_addr constant <{ i8, [31 x i8] }> <{ i8 14, [31 x i8] zeroinitializer }>, align 1
@.str = private unnamed_addr constant [17 x i8] c"Example with %s\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [7 x i8] c"MAYO_1\00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [17 x i8] c"mayo_keypair -> \00", align 1, !dbg !12
@.str.3 = private unnamed_addr constant [6 x i8] c"FAIL\0A\00", align 1, !dbg !14
@.str.4 = private unnamed_addr constant [4 x i8] c"OK\0A\00", align 1, !dbg !19
@.str.5 = private unnamed_addr constant [19 x i8] c"mayo_expand_sk -> \00", align 1, !dbg !24
@.str.6 = private unnamed_addr constant [19 x i8] c"mayo_expand_pk -> \00", align 1, !dbg !29
@.str.7 = private unnamed_addr constant [14 x i8] c"mayo_sign -> \00", align 1, !dbg !31
@.str.8 = private unnamed_addr constant [39 x i8] c"mayo_open (with correct signature) -> \00", align 1, !dbg !36
@.str.9 = private unnamed_addr constant [41 x i8] c"mayo_verify (with correct signature) -> \00", align 1, !dbg !41
@f_tail = internal unnamed_addr constant [4 x i8] c"\08\01\01\00", align 1, !dbg !46
@pqmayo_MAYO_1_ref_uint32_t_blocker = dso_local local_unnamed_addr global i32 0, align 4, !dbg !82
@pqmayo_MAYO_1_ref_uint64_t_blocker = dso_local global i64 0, align 8, !dbg !97
@pqmayo_MAYO_1_ref_unsigned_char_blocker = dso_local global i8 0, align 1, !dbg !101

; Function Attrs: nounwind
define dso_local range(i32 -1, 1) i32 @main() local_unnamed_addr #0 !dbg !113 {
entry:
  %tmp.i6.i = alloca [5 x i64], align 8
  %tmp.i.i = alloca [5 x i64], align 8
  %smlen.i = alloca i32, align 4
  %msg.i = alloca [32 x i8], align 1
  %msg2.i = alloca [32 x i8], align 1
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %smlen.i), !dbg !116
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %msg.i), !dbg !116
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %msg2.i), !dbg !116
    #dbg_value(ptr null, !151, !DIExpression(), !152)
    #dbg_value(i32 32, !153, !DIExpression(), !152)
    #dbg_value(i32 32, !153, !DIExpression(), !152)
    #dbg_value(i32 486, !154, !DIExpression(), !152)
  store i32 486, ptr %smlen.i, align 4, !dbg !155
  %call.i = call dereferenceable_or_null(1420) ptr @calloc(i32 noundef 1420, i32 noundef 1) #7, !dbg !156
    #dbg_value(ptr %call.i, !157, !DIExpression(), !152)
  %call1.i = call dereferenceable_or_null(24) ptr @calloc(i32 noundef 24, i32 noundef 1) #7, !dbg !158
    #dbg_value(ptr %call1.i, !159, !DIExpression(), !152)
  %call2.i = call dereferenceable_or_null(149640) ptr @calloc(i32 noundef 1, i32 noundef 149640) #7, !dbg !160
    #dbg_value(ptr %call2.i, !161, !DIExpression(), !152)
  %call3.i = call dereferenceable_or_null(148824) ptr @calloc(i32 noundef 1, i32 noundef 148824) #7, !dbg !162
    #dbg_value(ptr %call3.i, !163, !DIExpression(), !152)
    #dbg_value(i32 32, !153, !DIExpression(), !152)
  %call5.i = call dereferenceable_or_null(486) ptr @calloc(i32 noundef 486, i32 noundef 1) #7, !dbg !178
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
  %call.i.i = call i32 @pqmayo_MAYO_1_ref_mayo_keypair_compact(ptr noundef null, ptr noundef %call.i, ptr noundef %call1.i) #9, !dbg !226
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
  %call12.i = call i32 @pqmayo_MAYO_1_ref_mayo_expand_sk(ptr noundef null, ptr noundef %call1.i, ptr noundef %call3.i) #9, !dbg !238
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
  %call.i.i.i = call i32 @AES_128_CTR(ptr noundef %call2.i, i32 noundef 144495, ptr noundef %call.i, i32 noundef 16) #8, !dbg !263
  call void @llvm.lifetime.start.p0(i64 40, ptr nonnull %tmp.i.i), !dbg !264
    #dbg_value(ptr %call2.i, !269, !DIExpression(), !270)
    #dbg_value(ptr %call2.i, !271, !DIExpression(), !270)
    #dbg_value(i32 3705, !272, !DIExpression(), !270)
    #dbg_value(i32 78, !273, !DIExpression(), !270)
    #dbg_value(i32 5, !274, !DIExpression(), !270)
    #dbg_value(ptr %call2.i, !276, !DIExpression(), !270)
    #dbg_declare(ptr %tmp.i.i, !277, !DIExpression(), !264)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(40) %tmp.i.i, i8 0, i32 40, i1 false), !dbg !264
    #dbg_value(i32 3705, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !283)
  br label %for.cond.i.i, !dbg !284

for.cond.i.i:                                     ; preds = %for.body.i.i, %if.else16.i
  %i.0.in.i.i = phi i32 [ 3705, %if.else16.i ], [ %i.0.i.i, %for.body.i.i ]
    #dbg_value(i32 %i.0.in.i.i, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !283)
  %cmp.i3.i = icmp ugt i32 %i.0.in.i.i, 0, !dbg !285
  br i1 %cmp.i3.i, label %for.body.i.i, label %unpack_m_vecs.exit.i, !dbg !287

for.body.i.i:                                     ; preds = %for.cond.i.i
  %i.0.i.i = add nsw i32 %i.0.in.i.i, -1, !dbg !288
    #dbg_value(i32 %i.0.i.i, !281, !DIExpression(), !283)
  %mul.i.i = mul nsw i32 %i.0.i.i, 78, !dbg !289
  %div1.i.i14 = lshr exact i32 %mul.i.i, 1, !dbg !291
  %add.ptr.i4.i = getelementptr inbounds nuw i8, ptr %call2.i, i32 %div1.i.i14, !dbg !292
  %call.i5.i = call ptr @memcpy(ptr noundef nonnull %tmp.i.i, ptr noundef %add.ptr.i4.i, i32 noundef 39) #8, !dbg !293
  %mul4.i.i = mul nsw i32 %i.0.i.i, 40, !dbg !294
  %add.ptr5.i.i = getelementptr inbounds nuw i8, ptr %call2.i, i32 %mul4.i.i, !dbg !295
  %call8.i.i = call ptr @memcpy(ptr noundef %add.ptr5.i.i, ptr noundef nonnull %tmp.i.i, i32 noundef 40) #8, !dbg !296
    #dbg_value(i32 %i.0.i.i, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !283)
  br label %for.cond.i.i, !dbg !297, !llvm.loop !298

unpack_m_vecs.exit.i:                             ; preds = %for.cond.i.i
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %tmp.i.i), !dbg !301
  %add.ptr.i.i = getelementptr inbounds nuw i8, ptr %call.i, i32 16, !dbg !302
  %add.ptr2.i.i = getelementptr inbounds nuw i8, ptr %call2.i, i32 148200, !dbg !303
  call void @llvm.lifetime.start.p0(i64 40, ptr nonnull %tmp.i6.i), !dbg !304
    #dbg_value(ptr %add.ptr.i.i, !269, !DIExpression(), !306)
    #dbg_value(ptr %add.ptr2.i.i, !271, !DIExpression(), !306)
    #dbg_value(i32 36, !272, !DIExpression(), !306)
    #dbg_value(i32 78, !273, !DIExpression(), !306)
    #dbg_value(i32 5, !274, !DIExpression(), !306)
    #dbg_value(ptr %add.ptr2.i.i, !276, !DIExpression(), !306)
    #dbg_declare(ptr %tmp.i6.i, !277, !DIExpression(), !304)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(40) %tmp.i6.i, i8 0, i32 40, i1 false), !dbg !304
    #dbg_value(i32 36, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !307)
  br label %for.cond.i7.i, !dbg !308

for.cond.i7.i:                                    ; preds = %for.body.i11.i, %unpack_m_vecs.exit.i
  %i.0.in.i8.i = phi i32 [ 36, %unpack_m_vecs.exit.i ], [ %i.0.i9.i, %for.body.i11.i ]
    #dbg_value(i32 %i.0.in.i8.i, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !307)
  %cmp.i10.i = icmp ugt i32 %i.0.in.i8.i, 0, !dbg !309
  br i1 %cmp.i10.i, label %for.body.i11.i, label %unpack_m_vecs.exit20.i, !dbg !310

for.body.i11.i:                                   ; preds = %for.cond.i7.i
  %i.0.i9.i = add nsw i32 %i.0.in.i8.i, -1, !dbg !311
    #dbg_value(i32 %i.0.i9.i, !281, !DIExpression(), !307)
  %mul.i12.i = mul nsw i32 %i.0.i9.i, 78, !dbg !312
  %div1.i13.i23 = lshr exact i32 %mul.i12.i, 1, !dbg !313
  %add.ptr.i14.i = getelementptr inbounds nuw i8, ptr %add.ptr.i.i, i32 %div1.i13.i23, !dbg !314
  %call.i15.i = call ptr @memcpy(ptr noundef nonnull %tmp.i6.i, ptr noundef nonnull %add.ptr.i14.i, i32 noundef 39) #8, !dbg !315
  %mul4.i17.i = mul nsw i32 %i.0.i9.i, 40, !dbg !316
  %add.ptr5.i18.i = getelementptr inbounds nuw i8, ptr %add.ptr2.i.i, i32 %mul4.i17.i, !dbg !317
  %call8.i19.i = call ptr @memcpy(ptr noundef nonnull %add.ptr5.i18.i, ptr noundef nonnull %tmp.i6.i, i32 noundef 40) #8, !dbg !318
    #dbg_value(i32 %i.0.i9.i, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !307)
  br label %for.cond.i7.i, !dbg !319, !llvm.loop !320

unpack_m_vecs.exit20.i:                           ; preds = %for.cond.i7.i
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %tmp.i6.i), !dbg !322
    #dbg_value(i32 0, !229, !DIExpression(), !152)
  %call25.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.4) #8, !dbg !323
  %call27.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.7) #8, !dbg !326
    #dbg_value(i32 32, !153, !DIExpression(), !152)
    #dbg_value(ptr %smlen.i, !154, !DIExpression(DW_OP_deref), !152)
  %call28.i = call i32 @pqmayo_MAYO_1_ref_mayo_sign(ptr noundef null, ptr noundef %call5.i, ptr noundef nonnull %smlen.i, ptr noundef nonnull %msg.i, i32 noundef 32, ptr noundef %call1.i) #9, !dbg !327
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
    #dbg_value(i32 454, !349, !DIExpression(), !342)
  %cmp.i.i = icmp ult i32 %0, 454, !dbg !350
  br i1 %cmp.i.i, label %pqmayo_MAYO_1_ref_mayo_open.exit.i, label %if.end.i.i, !dbg !350

if.end.i.i:                                       ; preds = %if.else32.i
  %add.ptr.i1.i = getelementptr inbounds nuw i8, ptr %call5.i, i32 454, !dbg !352
  %sub.i.i = add i32 %0, -454, !dbg !353
  %call.i2.i = call i32 @pqmayo_MAYO_1_ref_mayo_verify(ptr noundef null, ptr noundef nonnull %add.ptr.i1.i, i32 noundef %sub.i.i, ptr noundef %call5.i, ptr noundef %call.i) #9, !dbg !354
    #dbg_value(i32 %call.i2.i, !355, !DIExpression(), !342)
  %cmp1.i.i = icmp eq i32 %call.i2.i, 0, !dbg !356
  br i1 %cmp1.i.i, label %if.then2.i.i, label %pqmayo_MAYO_1_ref_mayo_open.exit.i, !dbg !356

if.then2.i.i:                                     ; preds = %if.end.i.i
  %sub3.i.i = add i32 %0, -454, !dbg !358
  %add.ptr4.i.i = getelementptr inbounds nuw i8, ptr %call5.i, i32 454, !dbg !360
  %call5.i.i = call ptr @memmove(ptr noundef nonnull %msg2.i, ptr noundef nonnull %add.ptr4.i.i, i32 noundef %sub3.i.i) #8, !dbg !361
  br label %pqmayo_MAYO_1_ref_mayo_open.exit.i, !dbg !362

pqmayo_MAYO_1_ref_mayo_open.exit.i:               ; preds = %if.then2.i.i, %if.end.i.i, %if.else32.i
  %msglen.i.0 = phi i32 [ 32, %if.else32.i ], [ %sub3.i.i, %if.then2.i.i ], [ 32, %if.end.i.i ], !dbg !152
  %cmp38.not.i = phi i1 [ false, %if.else32.i ], [ true, %if.then2.i.i ], [ false, %if.end.i.i ], !dbg !342
    #dbg_value(i32 poison, !229, !DIExpression(), !152)
  br i1 %cmp38.not.i, label %lor.lhs.false.i, label %if.then42.i, !dbg !363

lor.lhs.false.i:                                  ; preds = %pqmayo_MAYO_1_ref_mayo_open.exit.i
    #dbg_value(i32 %msglen.i.0, !153, !DIExpression(), !152)
  %call41.i = call i32 @memcmp(ptr noundef nonnull %msg.i, ptr noundef nonnull %msg2.i, i32 noundef %msglen.i.0) #8, !dbg !365
  %tobool.not.i = icmp eq i32 %call41.i, 0, !dbg !365
  br i1 %tobool.not.i, label %if.else44.i, label %if.then42.i, !dbg !363

if.then42.i:                                      ; preds = %lor.lhs.false.i, %pqmayo_MAYO_1_ref_mayo_open.exit.i
  %call43.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.3) #8, !dbg !366
    #dbg_value(i32 -1, !229, !DIExpression(), !152)
  br label %example_mayo.exit, !dbg !368

if.else44.i:                                      ; preds = %lor.lhs.false.i
    #dbg_value(i32 0, !229, !DIExpression(), !152)
  %call45.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.4) #8, !dbg !369
  %call47.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.9) #8, !dbg !371
    #dbg_value(i32 %msglen.i.0, !153, !DIExpression(), !152)
  %call49.i = call i32 @pqmayo_MAYO_1_ref_mayo_verify(ptr noundef null, ptr noundef nonnull %msg.i, i32 noundef %msglen.i.0, ptr noundef %call5.i, ptr noundef %call.i) #9, !dbg !372
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
  call void @mayo_secure_free(ptr noundef %call1.i, i32 noundef 24) #8, !dbg !385
  call void @mayo_secure_free(ptr noundef %call3.i, i32 noundef 148824) #8, !dbg !386
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
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_1_ref_mayo_keypair(ptr noundef %p, ptr noundef %pk, ptr noundef %sk) local_unnamed_addr #0 !dbg !190 {
entry:
    #dbg_value(ptr %p, !189, !DIExpression(), !390)
    #dbg_value(ptr %pk, !223, !DIExpression(), !390)
    #dbg_value(ptr %sk, !224, !DIExpression(), !390)
    #dbg_value(i32 0, !225, !DIExpression(), !390)
  %call = call i32 @pqmayo_MAYO_1_ref_mayo_keypair_compact(ptr noundef %p, ptr noundef %pk, ptr noundef %sk) #9, !dbg !391
    #dbg_value(i32 %call, !225, !DIExpression(), !390)
    #dbg_label(!227, !392)
  ret i32 %call, !dbg !393
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_1_ref_mayo_keypair_compact(ptr noundef %p, ptr noundef %cpk, ptr noundef %csk) local_unnamed_addr #0 !dbg !394 {
entry:
  %tmp.i = alloca [5 x i64], align 8
  %S = alloca [328 x i8], align 1
  %P = alloca [18525 x i64], align 8
  %P3 = alloca [320 x i64], align 8
  %O = alloca [624 x i8], align 1
  %P3_upper = alloca [180 x i64], align 8
    #dbg_value(ptr %p, !395, !DIExpression(), !396)
    #dbg_value(ptr %cpk, !397, !DIExpression(), !396)
    #dbg_value(ptr %csk, !398, !DIExpression(), !396)
    #dbg_value(i32 0, !399, !DIExpression(), !396)
    #dbg_value(ptr %csk, !400, !DIExpression(), !396)
    #dbg_declare(ptr %S, !401, !DIExpression(), !405)
    #dbg_declare(ptr %P, !406, !DIExpression(), !407)
    #dbg_declare(ptr %P3, !408, !DIExpression(), !412)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(2560) %P3, i8 0, i32 2560, i1 false), !dbg !412
    #dbg_declare(ptr %O, !413, !DIExpression(), !415)
    #dbg_value(i32 5, !416, !DIExpression(), !396)
    #dbg_value(i32 78, !417, !DIExpression(), !396)
    #dbg_value(i32 78, !418, !DIExpression(), !396)
    #dbg_value(i32 8, !419, !DIExpression(), !396)
    #dbg_value(i32 312, !420, !DIExpression(), !396)
    #dbg_value(i32 15405, !421, !DIExpression(), !396)
    #dbg_value(i32 180, !422, !DIExpression(), !396)
    #dbg_value(i32 16, !423, !DIExpression(), !396)
    #dbg_value(i32 24, !424, !DIExpression(), !396)
    #dbg_value(ptr %P, !425, !DIExpression(), !396)
  %add.ptr = getelementptr inbounds nuw i8, ptr %P, i32 123240, !dbg !426
    #dbg_value(ptr %add.ptr, !427, !DIExpression(), !396)
  %call = call i32 @randombytes(ptr noundef %csk, i32 noundef 24) #8, !dbg !428
  %cmp.not = icmp eq i32 %call, 0, !dbg !430
  br i1 %cmp.not, label %if.end, label %err, !dbg !430

if.end:                                           ; preds = %entry
    #dbg_value(ptr %P, !425, !DIExpression(), !396)
  %call3 = call i32 @shake256(ptr noundef nonnull %S, i32 noundef 328, ptr noundef %csk, i32 noundef 24) #8, !dbg !431
    #dbg_value(ptr %S, !432, !DIExpression(), !396)
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %S, i32 16, !dbg !433
    #dbg_value(ptr %add.ptr6, !434, !DIExpression(), !438)
    #dbg_value(ptr %O, !440, !DIExpression(), !438)
    #dbg_value(i32 624, !441, !DIExpression(), !438)
    #dbg_value(i32 0, !442, !DIExpression(), !438)
  br label %for.cond.i11, !dbg !443

for.cond.i11:                                     ; preds = %for.body.i14, %if.end
  %mdec.addr.0.i = phi ptr [ %O, %if.end ], [ %incdec.ptr5.i, %for.body.i14 ]
  %i.0.i12 = phi i32 [ 0, %if.end ], [ %inc.i15, %for.body.i14 ], !dbg !445
    #dbg_value(i32 %i.0.i12, !442, !DIExpression(), !438)
    #dbg_value(ptr %mdec.addr.0.i, !440, !DIExpression(), !438)
  %exitcond = icmp ne i32 %i.0.i12, 312, !dbg !446
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
  %call.i = call i32 @AES_128_CTR(ptr noundef nonnull %P, i32 noundef 144495, ptr noundef nonnull %S, i32 noundef 16) #8, !dbg !463
  call void @llvm.lifetime.start.p0(i64 40, ptr nonnull %tmp.i), !dbg !464
    #dbg_value(ptr %P, !269, !DIExpression(), !466)
    #dbg_value(ptr %P, !271, !DIExpression(), !466)
    #dbg_value(i32 3705, !272, !DIExpression(), !466)
    #dbg_value(i32 78, !273, !DIExpression(), !466)
    #dbg_value(i32 5, !274, !DIExpression(), !466)
    #dbg_value(ptr %P, !276, !DIExpression(), !466)
    #dbg_declare(ptr %tmp.i, !277, !DIExpression(), !464)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(40) %tmp.i, i8 0, i32 40, i1 false), !dbg !464
    #dbg_value(i32 3705, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !467)
  br label %for.cond.i2, !dbg !468

for.cond.i2:                                      ; preds = %for.body.i5, %decode.exit
  %i.0.in.i = phi i32 [ 3705, %decode.exit ], [ %i.0.i3, %for.body.i5 ]
    #dbg_value(i32 %i.0.in.i, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !467)
  %cmp.i4 = icmp ugt i32 %i.0.in.i, 0, !dbg !469
  br i1 %cmp.i4, label %for.body.i5, label %unpack_m_vecs.exit, !dbg !470

for.body.i5:                                      ; preds = %for.cond.i2
  %i.0.i3 = add nsw i32 %i.0.in.i, -1, !dbg !471
    #dbg_value(i32 %i.0.i3, !281, !DIExpression(), !467)
  %mul.i6 = mul nsw i32 %i.0.i3, 78, !dbg !472
  %div1.i74344 = lshr exact i32 %mul.i6, 1, !dbg !473
  %add.ptr.i8 = getelementptr inbounds nuw i8, ptr %P, i32 %div1.i74344, !dbg !474
  %call.i9 = call ptr @memcpy(ptr noundef nonnull %tmp.i, ptr noundef nonnull %add.ptr.i8, i32 noundef 39) #8, !dbg !475
  %mul4.i = mul nsw i32 %i.0.i3, 40, !dbg !476
  %add.ptr5.i = getelementptr inbounds nuw i8, ptr %P, i32 %mul4.i, !dbg !477
  %call8.i = call ptr @memcpy(ptr noundef nonnull %add.ptr5.i, ptr noundef nonnull %tmp.i, i32 noundef 40) #8, !dbg !478
    #dbg_value(i32 %i.0.i3, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !467)
  br label %for.cond.i2, !dbg !479, !llvm.loop !480

unpack_m_vecs.exit:                               ; preds = %for.cond.i2
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %tmp.i), !dbg !482
    #dbg_value(ptr %p, !483, !DIExpression(), !489)
    #dbg_value(ptr %P, !491, !DIExpression(), !489)
    #dbg_value(ptr %add.ptr, !492, !DIExpression(), !489)
    #dbg_value(ptr %O, !493, !DIExpression(), !489)
    #dbg_value(ptr %P3, !494, !DIExpression(), !489)
    #dbg_value(i32 5, !495, !DIExpression(), !489)
    #dbg_value(i32 78, !496, !DIExpression(), !489)
    #dbg_value(i32 8, !497, !DIExpression(), !489)
    #dbg_value(ptr %p, !498, !DIExpression(), !502)
    #dbg_value(ptr %P, !504, !DIExpression(), !502)
    #dbg_value(ptr %O, !505, !DIExpression(), !502)
    #dbg_value(ptr %add.ptr, !506, !DIExpression(), !502)
    #dbg_value(i32 5, !507, !DIExpression(), !511)
    #dbg_value(ptr %P, !513, !DIExpression(), !511)
    #dbg_value(ptr %O, !514, !DIExpression(), !511)
    #dbg_value(ptr %add.ptr, !515, !DIExpression(), !511)
    #dbg_value(i32 78, !516, !DIExpression(), !511)
    #dbg_value(i32 78, !517, !DIExpression(), !511)
    #dbg_value(i32 8, !518, !DIExpression(), !511)
    #dbg_value(i32 1, !519, !DIExpression(), !511)
    #dbg_value(i32 0, !520, !DIExpression(), !511)
    #dbg_value(i32 0, !521, !DIExpression(), !523)
  br label %for.cond.i22, !dbg !524

for.cond.i22:                                     ; preds = %for.inc17.i30, %unpack_m_vecs.exit
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc17.i30 ], [ 78, %unpack_m_vecs.exit ], !dbg !525
  %bs_mat_entries_used.0.i = phi i32 [ 0, %unpack_m_vecs.exit ], [ %bs_mat_entries_used.1.i.lcssa, %for.inc17.i30 ], !dbg !525
  %r.0.i23 = phi i32 [ 0, %unpack_m_vecs.exit ], [ %inc18.i31, %for.inc17.i30 ], !dbg !526
    #dbg_value(i32 %r.0.i23, !521, !DIExpression(), !523)
    #dbg_value(i32 %bs_mat_entries_used.0.i, !520, !DIExpression(), !511)
  %exitcond47 = icmp ne i32 %r.0.i23, 78, !dbg !527
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
  %exitcond45 = icmp ne i32 %k.0.i33, 8, !dbg !550
  br i1 %exitcond45, label %for.body6.i38, label %for.inc15.i35, !dbg !544

for.body6.i38:                                    ; preds = %for.cond4.i32
  %add.ptr.i40.idx = mul nsw i32 %bs_mat_entries_used.1.i, 40, !dbg !552
  %add.ptr.i40 = getelementptr inbounds i8, ptr %P, i32 %add.ptr.i40.idx, !dbg !552
  %mul8.i41 = shl nuw nsw i32 %c.0.i28, 3, !dbg !554
  %4 = getelementptr i8, ptr %O, i32 %mul8.i41, !dbg !555
  %arrayidx.i42 = getelementptr i8, ptr %4, i32 %k.0.i33, !dbg !555
  %5 = load i8, ptr %arrayidx.i42, align 1, !dbg !555
  %mul9.i = shl nuw nsw i32 %r.0.i23, 3, !dbg !556
  %add10.i = or disjoint i32 %mul9.i, %k.0.i33, !dbg !557
  %add.ptr12.i.idx = mul nuw nsw i32 %add10.i, 40, !dbg !558
  %add.ptr12.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %add.ptr12.i.idx, !dbg !558
  call fastcc void @m_vec_mul_add(i32 noundef 5, ptr noundef nonnull %add.ptr.i40, i8 noundef zeroext %5, ptr noundef nonnull %add.ptr12.i) #9, !dbg !559
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
  %exitcond50 = icmp ne i32 %r.0.i, 8, !dbg !576
  br i1 %exitcond50, label %for.cond1.i.preheader, label %mul_add_mat_trans_x_m_mat.exit, !dbg !533

for.cond1.i.preheader:                            ; preds = %for.cond.i16
  br label %for.cond1.i, !dbg !578

for.cond1.i:                                      ; preds = %for.cond1.i.preheader, %for.inc15.i
  %c.0.i = phi i32 [ %inc.i18, %for.inc15.i ], [ 0, %for.cond1.i.preheader ], !dbg !581
    #dbg_value(i32 %c.0.i, !582, !DIExpression(), !583)
  %exitcond49 = icmp ne i32 %c.0.i, 78, !dbg !584
  br i1 %exitcond49, label %for.cond4.i.preheader, label %for.inc17.i, !dbg !578

for.cond4.i.preheader:                            ; preds = %for.cond1.i
  br label %for.cond4.i, !dbg !586

for.cond4.i:                                      ; preds = %for.cond4.i.preheader, %for.body6.i
  %k.0.i = phi i32 [ %add14.i, %for.body6.i ], [ 0, %for.cond4.i.preheader ], !dbg !589
    #dbg_value(i32 %k.0.i, !590, !DIExpression(), !591)
  %exitcond48 = icmp ne i32 %k.0.i, 8, !dbg !592
  br i1 %exitcond48, label %for.body6.i, label %for.inc15.i, !dbg !586

for.body6.i:                                      ; preds = %for.cond4.i
  %mul.i19 = shl nuw nsw i32 %c.0.i, 3, !dbg !594
  %add.i = or disjoint i32 %mul.i19, %k.0.i, !dbg !596
  %add.ptr.i20.idx = mul nuw nsw i32 %add.i, 40, !dbg !597
  %add.ptr.i20 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %add.ptr.i20.idx, !dbg !597
  %mul8.i = shl nuw nsw i32 %c.0.i, 3, !dbg !598
  %6 = getelementptr i8, ptr %O, i32 %mul8.i, !dbg !599
  %arrayidx.i21 = getelementptr i8, ptr %6, i32 %r.0.i, !dbg !599
  %7 = load i8, ptr %arrayidx.i21, align 1, !dbg !599
  %mul10.i = shl nuw nsw i32 %r.0.i, 3, !dbg !600
  %add11.i = or disjoint i32 %mul10.i, %k.0.i, !dbg !601
  %add.ptr13.i.idx = mul nuw nsw i32 %add11.i, 40, !dbg !602
  %add.ptr13.i = getelementptr inbounds nuw i8, ptr %P3, i32 %add.ptr13.i.idx, !dbg !602
  call fastcc void @m_vec_mul_add(i32 noundef 5, ptr noundef nonnull %add.ptr.i20, i8 noundef zeroext %7, ptr noundef nonnull %add.ptr13.i) #9, !dbg !603
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
  call void @pqmayo_MAYO_1_ref_m_upper(ptr noundef %p, ptr noundef nonnull %P3, ptr noundef nonnull %P3_upper, i32 noundef 8) #9, !dbg !622
  %add.ptr15 = getelementptr inbounds nuw i8, ptr %cpk, i32 16, !dbg !623
    #dbg_value(ptr %P3_upper, !624, !DIExpression(), !628)
    #dbg_value(ptr %add.ptr15, !630, !DIExpression(), !628)
    #dbg_value(i32 36, !631, !DIExpression(), !628)
    #dbg_value(i32 78, !632, !DIExpression(), !628)
    #dbg_value(i32 5, !633, !DIExpression(), !628)
    #dbg_value(ptr %P3_upper, !634, !DIExpression(), !628)
    #dbg_value(i32 0, !635, !DIExpression(), !637)
  br label %for.cond.i, !dbg !638

for.cond.i:                                       ; preds = %for.body.i, %mul_add_mat_trans_x_m_mat.exit
  %i.0.i = phi i32 [ 0, %mul_add_mat_trans_x_m_mat.exit ], [ %inc.i, %for.body.i ], !dbg !639
    #dbg_value(i32 %i.0.i, !635, !DIExpression(), !637)
  %exitcond51 = icmp ne i32 %i.0.i, 36, !dbg !640
  br i1 %exitcond51, label %for.body.i, label %err.loopexit, !dbg !642

for.body.i:                                       ; preds = %for.cond.i
  %div1.i = mul nuw nsw i32 %i.0.i, 39, !dbg !643
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %add.ptr15, i32 %div1.i, !dbg !645
  %mul3.i = mul nuw nsw i32 %i.0.i, 40, !dbg !646
  %add.ptr4.i = getelementptr inbounds nuw i8, ptr %P3_upper, i32 %mul3.i, !dbg !647
  %call.i1 = call ptr @memmove(ptr noundef nonnull %add.ptr.i, ptr noundef nonnull %add.ptr4.i, i32 noundef 39) #8, !dbg !648
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !649
    #dbg_value(i32 %inc.i, !635, !DIExpression(), !637)
  br label %for.cond.i, !dbg !650, !llvm.loop !651

err.loopexit:                                     ; preds = %for.cond.i
  br label %err, !dbg !653

err:                                              ; preds = %err.loopexit, %entry
  %ret.0 = phi i32 [ 1, %entry ], [ 0, %err.loopexit ], !dbg !396
    #dbg_value(i32 %ret.0, !399, !DIExpression(), !396)
    #dbg_label(!654, !655)
  call void @mayo_secure_clear(ptr noundef nonnull %O, i32 noundef 624) #8, !dbg !653
  call void @mayo_secure_clear(ptr noundef nonnull %add.ptr, i32 noundef 24960) #8, !dbg !656
  call void @mayo_secure_clear(ptr noundef nonnull %P3, i32 noundef 2560) #8, !dbg !657
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
  %exitcond = icmp ne i32 %i.0, 5, !dbg !691
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
define dso_local i32 @pqmayo_MAYO_1_ref_mayo_expand_sk(ptr noundef %p, ptr noundef %csk, ptr noundef %sk) local_unnamed_addr #0 !dbg !730 {
entry:
  %tmp.i = alloca [5 x i64], align 8
  %S = alloca [328 x i8], align 1
    #dbg_value(ptr %p, !739, !DIExpression(), !740)
    #dbg_value(ptr %csk, !741, !DIExpression(), !740)
    #dbg_value(ptr %sk, !742, !DIExpression(), !740)
    #dbg_value(i32 0, !743, !DIExpression(), !740)
    #dbg_declare(ptr %S, !744, !DIExpression(), !745)
    #dbg_value(ptr %sk, !746, !DIExpression(), !740)
  %O2 = getelementptr inbounds nuw i8, ptr %sk, i32 148200, !dbg !747
    #dbg_value(ptr %O2, !748, !DIExpression(), !740)
    #dbg_value(i32 8, !749, !DIExpression(), !740)
    #dbg_value(i32 78, !750, !DIExpression(), !740)
    #dbg_value(i32 312, !751, !DIExpression(), !740)
    #dbg_value(i32 16, !752, !DIExpression(), !740)
    #dbg_value(i32 24, !753, !DIExpression(), !740)
    #dbg_value(ptr %csk, !754, !DIExpression(), !740)
    #dbg_value(ptr %S, !755, !DIExpression(), !740)
  %call = call i32 @shake256(ptr noundef nonnull %S, i32 noundef 328, ptr noundef %csk, i32 noundef 24) #8, !dbg !756
  %add.ptr = getelementptr inbounds nuw i8, ptr %S, i32 16, !dbg !757
    #dbg_value(ptr %add.ptr, !434, !DIExpression(), !758)
    #dbg_value(ptr %O2, !440, !DIExpression(), !758)
    #dbg_value(i32 624, !441, !DIExpression(), !758)
    #dbg_value(i32 0, !442, !DIExpression(), !758)
  br label %for.cond.i2, !dbg !760

for.cond.i2:                                      ; preds = %for.body.i5, %entry
  %mdec.addr.0.i = phi ptr [ %O2, %entry ], [ %incdec.ptr5.i, %for.body.i5 ]
  %i.0.i3 = phi i32 [ 0, %entry ], [ %inc.i, %for.body.i5 ], !dbg !761
    #dbg_value(i32 %i.0.i3, !442, !DIExpression(), !758)
    #dbg_value(ptr %mdec.addr.0.i, !440, !DIExpression(), !758)
  %exitcond = icmp ne i32 %i.0.i3, 312, !dbg !762
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
  %call.i = call i32 @AES_128_CTR(ptr noundef %sk, i32 noundef 144495, ptr noundef nonnull %S, i32 noundef 16) #8, !dbg !777
  call void @llvm.lifetime.start.p0(i64 40, ptr nonnull %tmp.i), !dbg !778
    #dbg_value(ptr %sk, !269, !DIExpression(), !780)
    #dbg_value(ptr %sk, !271, !DIExpression(), !780)
    #dbg_value(i32 3705, !272, !DIExpression(), !780)
    #dbg_value(i32 78, !273, !DIExpression(), !780)
    #dbg_value(i32 5, !274, !DIExpression(), !780)
    #dbg_value(ptr %sk, !276, !DIExpression(), !780)
    #dbg_declare(ptr %tmp.i, !277, !DIExpression(), !778)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(40) %tmp.i, i8 0, i32 40, i1 false), !dbg !778
    #dbg_value(i32 3705, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !781)
  br label %for.cond.i, !dbg !782

for.cond.i:                                       ; preds = %for.body.i, %decode.exit
  %i.0.in.i = phi i32 [ 3705, %decode.exit ], [ %i.0.i, %for.body.i ]
    #dbg_value(i32 %i.0.in.i, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !781)
  %cmp.i = icmp ugt i32 %i.0.in.i, 0, !dbg !783
  br i1 %cmp.i, label %for.body.i, label %unpack_m_vecs.exit, !dbg !784

for.body.i:                                       ; preds = %for.cond.i
  %i.0.i = add nsw i32 %i.0.in.i, -1, !dbg !785
    #dbg_value(i32 %i.0.i, !281, !DIExpression(), !781)
  %mul.i = mul nsw i32 %i.0.i, 78, !dbg !786
  %div1.i1112 = lshr exact i32 %mul.i, 1, !dbg !787
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %sk, i32 %div1.i1112, !dbg !788
  %call.i1 = call ptr @memcpy(ptr noundef nonnull %tmp.i, ptr noundef %add.ptr.i, i32 noundef 39) #8, !dbg !789
  %mul4.i = mul nsw i32 %i.0.i, 40, !dbg !790
  %add.ptr5.i = getelementptr inbounds nuw i8, ptr %sk, i32 %mul4.i, !dbg !791
  %call8.i = call ptr @memcpy(ptr noundef %add.ptr5.i, ptr noundef nonnull %tmp.i, i32 noundef 40) #8, !dbg !792
    #dbg_value(i32 %i.0.i, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !781)
  br label %for.cond.i, !dbg !793, !llvm.loop !794

unpack_m_vecs.exit:                               ; preds = %for.cond.i
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %tmp.i), !dbg !796
  %add.ptr7 = getelementptr inbounds nuw i8, ptr %sk, i32 123240, !dbg !797
    #dbg_value(ptr %add.ptr7, !798, !DIExpression(), !740)
    #dbg_value(ptr %sk, !799, !DIExpression(), !740)
    #dbg_value(ptr %add.ptr7, !800, !DIExpression(), !740)
    #dbg_value(ptr %p, !801, !DIExpression(), !803)
    #dbg_value(ptr %sk, !805, !DIExpression(), !803)
    #dbg_value(ptr %O2, !806, !DIExpression(), !803)
    #dbg_value(ptr %add.ptr7, !807, !DIExpression(), !803)
    #dbg_value(i32 8, !808, !DIExpression(), !803)
    #dbg_value(i32 78, !809, !DIExpression(), !803)
    #dbg_value(i32 5, !810, !DIExpression(), !803)
    #dbg_value(i32 0, !811, !DIExpression(), !803)
    #dbg_value(i32 0, !812, !DIExpression(), !814)
  br label %for.cond.i6, !dbg !815

for.cond.i6:                                      ; preds = %for.inc27.i, %unpack_m_vecs.exit
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc27.i ], [ 78, %unpack_m_vecs.exit ], !dbg !816
  %bs_mat_entries_used.0.i = phi i32 [ 0, %unpack_m_vecs.exit ], [ %bs_mat_entries_used.1.i.lcssa, %for.inc27.i ], !dbg !816
  %r.0.i = phi i32 [ 0, %unpack_m_vecs.exit ], [ %inc28.i, %for.inc27.i ], !dbg !817
    #dbg_value(i32 %r.0.i, !812, !DIExpression(), !814)
    #dbg_value(i32 %bs_mat_entries_used.0.i, !811, !DIExpression(), !803)
  %exitcond15 = icmp ne i32 %r.0.i, 78, !dbg !818
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
  %exitcond13 = icmp ne i32 %k.0.i, 8, !dbg !837
  br i1 %exitcond13, label %for.body7.i, label %for.inc25.i.loopexit, !dbg !832

for.body7.i:                                      ; preds = %for.cond5.i
  %add.ptr.idx.i = mul nsw i32 %bs_mat_entries_used.1.i, 40, !dbg !839
  %add.ptr.i9 = getelementptr inbounds i8, ptr %sk, i32 %add.ptr.idx.i, !dbg !839
  %mul8.i = shl nuw nsw i32 %c.0.i, 3, !dbg !841
  %add9.i = or disjoint i32 %mul8.i, %k.0.i, !dbg !842
  %arrayidx.i10 = getelementptr inbounds nuw i8, ptr %O2, i32 %add9.i, !dbg !843
  %4 = load i8, ptr %arrayidx.i10, align 1, !dbg !843
  %mul10.i = shl nuw nsw i32 %r.0.i, 3, !dbg !844
  %add11.i = or disjoint i32 %mul10.i, %k.0.i, !dbg !845
  %add.ptr13.idx.i = mul nuw nsw i32 %add11.i, 40, !dbg !846
  %add.ptr13.i = getelementptr inbounds nuw i8, ptr %add.ptr7, i32 %add.ptr13.idx.i, !dbg !846
  call fastcc void @m_vec_mul_add(i32 noundef 5, ptr noundef %add.ptr.i9, i8 noundef zeroext %4, ptr noundef nonnull %add.ptr13.i) #9, !dbg !847
  %add.ptr15.idx.i = mul nsw i32 %bs_mat_entries_used.1.i, 40, !dbg !848
  %add.ptr15.i = getelementptr inbounds i8, ptr %sk, i32 %add.ptr15.idx.i, !dbg !848
  %mul16.i = shl nuw nsw i32 %r.0.i, 3, !dbg !849
  %add17.i = or disjoint i32 %mul16.i, %k.0.i, !dbg !850
  %arrayidx18.i = getelementptr inbounds nuw i8, ptr %O2, i32 %add17.i, !dbg !851
  %5 = load i8, ptr %arrayidx18.i, align 1, !dbg !851
  %mul19.i = shl nuw nsw i32 %c.0.i, 3, !dbg !852
  %add20.i = or disjoint i32 %mul19.i, %k.0.i, !dbg !853
  %add.ptr22.idx.i = mul nuw nsw i32 %add20.i, 40, !dbg !854
  %add.ptr22.i = getelementptr inbounds nuw i8, ptr %add.ptr7, i32 %add.ptr22.idx.i, !dbg !854
  call fastcc void @m_vec_mul_add(i32 noundef 5, ptr noundef %add.ptr15.i, i8 noundef zeroext %5, ptr noundef nonnull %add.ptr22.i) #9, !dbg !855
  %add23.i = add nuw nsw i32 %k.0.i, 1, !dbg !856
    #dbg_value(i32 %add23.i, !835, !DIExpression(), !836)
  br label %for.cond5.i, !dbg !857, !llvm.loop !858

for.inc25.i.loopexit:                             ; preds = %for.cond5.i
  br label %for.inc25.i, !dbg !860

for.inc25.i:                                      ; preds = %for.inc25.i.loopexit, %for.body3.i
  %bs_mat_entries_used.2.i = add i32 %bs_mat_entries_used.1.i, 1, !dbg !860
    #dbg_value(i32 %bs_mat_entries_used.2.i, !811, !DIExpression(), !803)
  %inc.i8 = add nuw nsw i32 %c.0.i, 1, !dbg !861
    #dbg_value(i32 %inc.i8, !825, !DIExpression(), !826)
  br label %for.cond1.i, !dbg !862, !llvm.loop !863

for.inc27.i:                                      ; preds = %for.cond1.i
  %bs_mat_entries_used.1.i.lcssa = phi i32 [ %bs_mat_entries_used.1.i, %for.cond1.i ], !dbg !803
  %inc28.i = add nuw nsw i32 %r.0.i, 1, !dbg !865
    #dbg_value(i32 %inc28.i, !812, !DIExpression(), !814)
  %indvars.iv.next = add nsw i32 %indvars.iv, -1, !dbg !866
  br label %for.cond.i6, !dbg !866, !llvm.loop !867

P1P1t_times_O.exit:                               ; preds = %for.cond.i6
  call void @mayo_secure_clear(ptr noundef nonnull %S, i32 noundef 328) #8, !dbg !869
  ret i32 0, !dbg !870
}

; Function Attrs: nounwind
define dso_local i32 @pqmayo_MAYO_1_ref_mayo_sign_signature(ptr noundef %p, ptr noundef %sig, ptr noundef %siglen, ptr noundef %m, i32 noundef %mlen, ptr noundef %csk) local_unnamed_addr #0 !dbg !871 {
entry:
  %A.i = alloca [800 x i64], align 8
  %tab.i = alloca [16 x i8], align 1
  %Pv.i = alloca [3900 x i64], align 8
  %tenc = alloca [39 x i8], align 1
  %t = alloca [78 x i8], align 1
  %y = alloca [78 x i8], align 1
  %salt = alloca [24 x i8], align 1
  %V = alloca [430 x i8], align 1
  %Vdec = alloca [780 x i8], align 1
  %A = alloca [6480 x i8], align 1
  %x = alloca [860 x i8], align 1
  %r = alloca [81 x i8], align 1
  %s = alloca [860 x i8], align 1
  %sk = alloca %struct.sk_t, align 32
  %Ox = alloca [78 x i8], align 1
  %tmp = alloca [81 x i8], align 1
  %Mtmp = alloca [400 x i64], align 8
    #dbg_value(ptr %p, !872, !DIExpression(), !873)
    #dbg_value(ptr %sig, !874, !DIExpression(), !873)
    #dbg_value(ptr %siglen, !875, !DIExpression(), !873)
    #dbg_value(ptr %m, !876, !DIExpression(), !873)
    #dbg_value(i32 %mlen, !877, !DIExpression(), !873)
    #dbg_value(ptr %csk, !878, !DIExpression(), !873)
    #dbg_value(i32 0, !879, !DIExpression(), !873)
    #dbg_declare(ptr %tenc, !880, !DIExpression(), !882)
    #dbg_declare(ptr %t, !883, !DIExpression(), !887)
    #dbg_declare(ptr %y, !888, !DIExpression(), !889)
    #dbg_declare(ptr %salt, !890, !DIExpression(), !894)
    #dbg_declare(ptr %V, !895, !DIExpression(), !899)
    #dbg_declare(ptr %Vdec, !900, !DIExpression(), !904)
    #dbg_declare(ptr %A, !905, !DIExpression(), !909)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(6480) %A, i8 0, i32 6480, i1 false), !dbg !909
    #dbg_declare(ptr %x, !910, !DIExpression(), !914)
    #dbg_declare(ptr %r, !915, !DIExpression(), !919)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(81) %r, i8 0, i32 81, i1 false), !dbg !919
    #dbg_declare(ptr %s, !920, !DIExpression(), !921)
    #dbg_declare(ptr %sk, !922, !DIExpression(), !923)
    #dbg_declare(ptr %Ox, !924, !DIExpression(), !925)
    #dbg_declare(ptr %tmp, !926, !DIExpression(), !927)
    #dbg_value(i32 78, !928, !DIExpression(), !873)
    #dbg_value(i32 86, !929, !DIExpression(), !873)
    #dbg_value(i32 8, !930, !DIExpression(), !873)
    #dbg_value(i32 10, !931, !DIExpression(), !873)
    #dbg_value(i32 78, !932, !DIExpression(), !873)
    #dbg_value(i32 39, !933, !DIExpression(), !873)
    #dbg_value(i32 39, !934, !DIExpression(), !873)
    #dbg_value(i32 40, !935, !DIExpression(), !873)
    #dbg_value(i32 454, !936, !DIExpression(), !873)
    #dbg_value(i32 81, !937, !DIExpression(), !873)
    #dbg_value(i32 32, !938, !DIExpression(), !873)
    #dbg_value(i32 24, !939, !DIExpression(), !873)
    #dbg_value(i32 24, !940, !DIExpression(), !873)
  %call = call i32 @pqmayo_MAYO_1_ref_mayo_expand_sk(ptr noundef %p, ptr noundef %csk, ptr noundef nonnull %sk) #9, !dbg !941
    #dbg_value(i32 %call, !879, !DIExpression(), !873)
  %cmp.not = icmp eq i32 %call, 0, !dbg !942
  br i1 %cmp.not, label %if.end, label %err, !dbg !942

if.end:                                           ; preds = %entry
    #dbg_value(ptr %csk, !944, !DIExpression(), !873)
  %call1 = call i32 @shake256(ptr noundef nonnull %tmp, i32 noundef 32, ptr noundef %m, i32 noundef %mlen) #8, !dbg !945
    #dbg_value(ptr %sk, !946, !DIExpression(), !873)
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 123240, !dbg !947
    #dbg_value(ptr %add.ptr, !948, !DIExpression(), !873)
    #dbg_declare(ptr %Mtmp, !949, !DIExpression(), !953)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(3200) %Mtmp, i8 0, i32 3200, i1 false), !dbg !953
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %tmp, i32 32, !dbg !954
  %call6 = call i32 @randombytes(ptr noundef nonnull %add.ptr5, i32 noundef 24) #8, !dbg !956
  %cmp7.not = icmp eq i32 %call6, 0, !dbg !957
  br i1 %cmp7.not, label %if.end9, label %err, !dbg !957

if.end9:                                          ; preds = %if.end
  %add.ptr12 = getelementptr inbounds nuw i8, ptr %tmp, i32 56, !dbg !958
  %call13 = call ptr @memcpy(ptr noundef nonnull %add.ptr12, ptr noundef %csk, i32 noundef 24) #8, !dbg !959
  %call16 = call i32 @shake256(ptr noundef nonnull %salt, i32 noundef 24, ptr noundef nonnull %tmp, i32 noundef 80) #8, !dbg !960
  %add.ptr18 = getelementptr inbounds nuw i8, ptr %tmp, i32 32, !dbg !961
  %call20 = call ptr @memcpy(ptr noundef nonnull %add.ptr18, ptr noundef nonnull %salt, i32 noundef 24) #8, !dbg !962
    #dbg_value(ptr %add.ptr24, !963, !DIExpression(), !873)
  %call27 = call i32 @shake256(ptr noundef nonnull %tenc, i32 noundef 39, ptr noundef nonnull %tmp, i32 noundef 56) #8, !dbg !964
    #dbg_value(ptr %tenc, !434, !DIExpression(), !965)
    #dbg_value(ptr %t, !440, !DIExpression(), !965)
    #dbg_value(i32 78, !441, !DIExpression(), !965)
    #dbg_value(i32 0, !442, !DIExpression(), !965)
  br label %for.cond.i23, !dbg !967

for.cond.i23:                                     ; preds = %for.body.i27, %if.end9
  %mdec.addr.0.i24 = phi ptr [ %t, %if.end9 ], [ %incdec.ptr5.i31, %for.body.i27 ]
  %i.0.i25 = phi i32 [ 0, %if.end9 ], [ %inc.i32, %for.body.i27 ], !dbg !968
    #dbg_value(i32 %i.0.i25, !442, !DIExpression(), !965)
    #dbg_value(ptr %mdec.addr.0.i24, !440, !DIExpression(), !965)
  %exitcond = icmp ne i32 %i.0.i25, 39, !dbg !969
  br i1 %exitcond, label %for.body.i27, label %for.cond.preheader, !dbg !970

for.cond.preheader:                               ; preds = %for.cond.i23
  %add.ptr24 = getelementptr inbounds nuw i8, ptr %tmp, i32 80, !dbg !971
  br label %for.cond, !dbg !972

for.body.i27:                                     ; preds = %for.cond.i23
  %arrayidx.i28 = getelementptr inbounds nuw i8, ptr %tenc, i32 %i.0.i25, !dbg !974
  %0 = load i8, ptr %arrayidx.i28, align 1, !dbg !974
  %1 = and i8 %0, 15, !dbg !975
  %incdec.ptr.i29 = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i24, i32 1, !dbg !976
    #dbg_value(ptr %incdec.ptr.i29, !440, !DIExpression(), !965)
  store i8 %1, ptr %mdec.addr.0.i24, align 1, !dbg !977
  %2 = lshr i8 %0, 4, !dbg !978
    #dbg_value(ptr %incdec.ptr.i29, !440, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !965)
  store i8 %2, ptr %incdec.ptr.i29, align 1, !dbg !979
  %incdec.ptr5.i31 = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i24, i32 2, !dbg !980
    #dbg_value(ptr %incdec.ptr5.i31, !440, !DIExpression(), !965)
  %inc.i32 = add nuw nsw i32 %i.0.i25, 1, !dbg !981
    #dbg_value(i32 %inc.i32, !442, !DIExpression(), !965)
  br label %for.cond.i23, !dbg !982, !llvm.loop !983

for.cond:                                         ; preds = %for.cond.preheader, %if.else
  %ctr.0 = phi i32 [ %inc75, %if.else ], [ 0, %for.cond.preheader ], !dbg !985
    #dbg_value(i32 %ctr.0, !986, !DIExpression(), !987)
  %exitcond153 = icmp ne i32 %ctr.0, 256, !dbg !988
  br i1 %exitcond153, label %for.body, label %for.end76, !dbg !972

for.body:                                         ; preds = %for.cond
  %conv = trunc nuw i32 %ctr.0 to i8, !dbg !990
  store i8 %conv, ptr %add.ptr24, align 1, !dbg !992
  %call33 = call i32 @shake256(ptr noundef nonnull %V, i32 noundef 430, ptr noundef nonnull %tmp, i32 noundef 81) #8, !dbg !993
    #dbg_value(i32 0, !994, !DIExpression(), !996)
  br label %for.cond34, !dbg !997

for.cond34:                                       ; preds = %decode.exit22, %for.body
  %i.0 = phi i32 [ 0, %for.body ], [ %inc, %decode.exit22 ], !dbg !998
    #dbg_value(i32 %i.0, !994, !DIExpression(), !996)
  %exitcond127 = icmp ne i32 %i.0, 10, !dbg !999
  br i1 %exitcond127, label %for.body37, label %for.end, !dbg !1001

for.body37:                                       ; preds = %for.cond34
  %mul = mul nuw nsw i32 %i.0, 39, !dbg !1002
  %add.ptr39 = getelementptr inbounds nuw i8, ptr %V, i32 %mul, !dbg !1004
  %mul41 = mul nuw nsw i32 %i.0, 78, !dbg !1005
  %add.ptr42 = getelementptr inbounds nuw i8, ptr %Vdec, i32 %mul41, !dbg !1006
    #dbg_value(ptr %add.ptr39, !434, !DIExpression(), !1007)
    #dbg_value(ptr %add.ptr42, !440, !DIExpression(), !1007)
    #dbg_value(i32 78, !441, !DIExpression(), !1007)
    #dbg_value(i32 0, !442, !DIExpression(), !1007)
  br label %for.cond.i12, !dbg !1009

for.cond.i12:                                     ; preds = %for.body.i16, %for.body37
  %mdec.addr.0.i13 = phi ptr [ %add.ptr42, %for.body37 ], [ %incdec.ptr5.i20, %for.body.i16 ]
  %i.0.i14 = phi i32 [ 0, %for.body37 ], [ %inc.i21, %for.body.i16 ], !dbg !1010
    #dbg_value(i32 %i.0.i14, !442, !DIExpression(), !1007)
    #dbg_value(ptr %mdec.addr.0.i13, !440, !DIExpression(), !1007)
  %exitcond126 = icmp ne i32 %i.0.i14, 39, !dbg !1011
  br i1 %exitcond126, label %for.body.i16, label %decode.exit22, !dbg !1012

for.body.i16:                                     ; preds = %for.cond.i12
  %arrayidx.i17 = getelementptr inbounds nuw i8, ptr %add.ptr39, i32 %i.0.i14, !dbg !1013
  %3 = load i8, ptr %arrayidx.i17, align 1, !dbg !1013
  %4 = and i8 %3, 15, !dbg !1014
  %incdec.ptr.i18 = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i13, i32 1, !dbg !1015
    #dbg_value(ptr %incdec.ptr.i18, !440, !DIExpression(), !1007)
  store i8 %4, ptr %mdec.addr.0.i13, align 1, !dbg !1016
  %5 = lshr i8 %3, 4, !dbg !1017
    #dbg_value(ptr %incdec.ptr.i18, !440, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1007)
  store i8 %5, ptr %incdec.ptr.i18, align 1, !dbg !1018
  %incdec.ptr5.i20 = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i13, i32 2, !dbg !1019
    #dbg_value(ptr %incdec.ptr5.i20, !440, !DIExpression(), !1007)
  %inc.i21 = add nuw nsw i32 %i.0.i14, 1, !dbg !1020
    #dbg_value(i32 %inc.i21, !442, !DIExpression(), !1007)
  br label %for.cond.i12, !dbg !1021, !llvm.loop !1022

decode.exit22:                                    ; preds = %for.cond.i12
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1024
    #dbg_value(i32 %inc, !994, !DIExpression(), !996)
  br label %for.cond34, !dbg !1025, !llvm.loop !1026

for.end:                                          ; preds = %for.cond34
  call void @llvm.lifetime.start.p0(i64 31200, ptr nonnull %Pv.i), !dbg !1028
    #dbg_value(ptr %p, !1033, !DIExpression(), !1034)
    #dbg_value(ptr %Vdec, !1035, !DIExpression(), !1034)
    #dbg_value(ptr %add.ptr, !1036, !DIExpression(), !1034)
    #dbg_value(ptr %sk, !1037, !DIExpression(), !1034)
    #dbg_value(ptr %Mtmp, !1038, !DIExpression(), !1034)
    #dbg_value(ptr %A, !1039, !DIExpression(), !1034)
    #dbg_value(i32 10, !1040, !DIExpression(), !1034)
    #dbg_value(i32 78, !1041, !DIExpression(), !1034)
    #dbg_value(i32 8, !1042, !DIExpression(), !1034)
    #dbg_value(i32 5, !1043, !DIExpression(), !1045)
    #dbg_value(ptr %Vdec, !1047, !DIExpression(), !1045)
    #dbg_value(ptr %add.ptr, !1048, !DIExpression(), !1045)
    #dbg_value(ptr %Mtmp, !1049, !DIExpression(), !1045)
    #dbg_value(i32 10, !1050, !DIExpression(), !1045)
    #dbg_value(i32 78, !1051, !DIExpression(), !1045)
    #dbg_value(i32 8, !1052, !DIExpression(), !1045)
    #dbg_value(i32 0, !1053, !DIExpression(), !1055)
  br label %for.cond.i41, !dbg !1056

for.cond.i41:                                     ; preds = %for.inc17.i47, %for.end
  %r.0.i42 = phi i32 [ 0, %for.end ], [ %inc18.i48, %for.inc17.i47 ], !dbg !1057
    #dbg_value(i32 %r.0.i42, !1053, !DIExpression(), !1055)
  %exitcond130 = icmp ne i32 %r.0.i42, 10, !dbg !1058
  br i1 %exitcond130, label %for.cond1.i44.preheader, label %mul_add_mat_x_m_mat.exit66, !dbg !1060

for.cond1.i44.preheader:                          ; preds = %for.cond.i41
  br label %for.cond1.i44, !dbg !1061

for.cond1.i44:                                    ; preds = %for.cond1.i44.preheader, %for.inc15.i52
  %c.0.i45 = phi i32 [ %inc.i53, %for.inc15.i52 ], [ 0, %for.cond1.i44.preheader ], !dbg !1064
    #dbg_value(i32 %c.0.i45, !1065, !DIExpression(), !1066)
  %exitcond129 = icmp ne i32 %c.0.i45, 78, !dbg !1067
  br i1 %exitcond129, label %for.cond4.i49.preheader, label %for.inc17.i47, !dbg !1061

for.cond4.i49.preheader:                          ; preds = %for.cond1.i44
  br label %for.cond4.i49, !dbg !1069

for.cond4.i49:                                    ; preds = %for.cond4.i49.preheader, %for.body6.i54
  %k.0.i50 = phi i32 [ %add14.i65, %for.body6.i54 ], [ 0, %for.cond4.i49.preheader ], !dbg !1072
    #dbg_value(i32 %k.0.i50, !1073, !DIExpression(), !1074)
  %exitcond128 = icmp ne i32 %k.0.i50, 8, !dbg !1075
  br i1 %exitcond128, label %for.body6.i54, label %for.inc15.i52, !dbg !1069

for.body6.i54:                                    ; preds = %for.cond4.i49
  %mul.i55 = shl nuw nsw i32 %c.0.i45, 3, !dbg !1077
  %add.i56 = or disjoint i32 %mul.i55, %k.0.i50, !dbg !1079
  %add.ptr.i58.idx = mul nuw nsw i32 %add.i56, 40, !dbg !1080
  %add.ptr.i58 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %add.ptr.i58.idx, !dbg !1080
  %mul8.i59 = mul nuw nsw i32 %r.0.i42, 78, !dbg !1081
  %6 = getelementptr i8, ptr %Vdec, i32 %mul8.i59, !dbg !1082
  %arrayidx.i60 = getelementptr i8, ptr %6, i32 %c.0.i45, !dbg !1082
  %7 = load i8, ptr %arrayidx.i60, align 1, !dbg !1082
  %mul10.i61 = shl nuw nsw i32 %r.0.i42, 3, !dbg !1083
  %add11.i62 = or disjoint i32 %mul10.i61, %k.0.i50, !dbg !1084
  %add.ptr13.i64.idx = mul nuw nsw i32 %add11.i62, 40, !dbg !1085
  %add.ptr13.i64 = getelementptr inbounds nuw i8, ptr %Mtmp, i32 %add.ptr13.i64.idx, !dbg !1085
  call fastcc void @m_vec_mul_add(i32 noundef 5, ptr noundef nonnull %add.ptr.i58, i8 noundef zeroext %7, ptr noundef nonnull %add.ptr13.i64) #9, !dbg !1086
  %add14.i65 = add nuw nsw i32 %k.0.i50, 1, !dbg !1087
    #dbg_value(i32 %add14.i65, !1073, !DIExpression(), !1074)
  br label %for.cond4.i49, !dbg !1088, !llvm.loop !1089

for.inc15.i52:                                    ; preds = %for.cond4.i49
  %inc.i53 = add nuw nsw i32 %c.0.i45, 1, !dbg !1091
    #dbg_value(i32 %inc.i53, !1065, !DIExpression(), !1066)
  br label %for.cond1.i44, !dbg !1092, !llvm.loop !1093

for.inc17.i47:                                    ; preds = %for.cond1.i44
  %inc18.i48 = add nuw nsw i32 %r.0.i42, 1, !dbg !1095
    #dbg_value(i32 %inc18.i48, !1053, !DIExpression(), !1055)
  br label %for.cond.i41, !dbg !1096, !llvm.loop !1097

mul_add_mat_x_m_mat.exit66:                       ; preds = %for.cond.i41
    #dbg_declare(ptr %Pv.i, !1099, !DIExpression(), !1103)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(31200) %Pv.i, i8 0, i32 31200, i1 false), !dbg !1103
    #dbg_value(ptr %p, !1104, !DIExpression(), !1106)
    #dbg_value(ptr %sk, !1108, !DIExpression(), !1106)
    #dbg_value(ptr %Vdec, !1109, !DIExpression(), !1106)
    #dbg_value(ptr %Pv.i, !1110, !DIExpression(), !1106)
    #dbg_value(i32 5, !1111, !DIExpression(), !1113)
    #dbg_value(ptr %sk, !1115, !DIExpression(), !1113)
    #dbg_value(ptr %Vdec, !1116, !DIExpression(), !1113)
    #dbg_value(ptr %Pv.i, !1117, !DIExpression(), !1113)
    #dbg_value(i32 78, !1118, !DIExpression(), !1113)
    #dbg_value(i32 78, !1119, !DIExpression(), !1113)
    #dbg_value(i32 10, !1120, !DIExpression(), !1113)
    #dbg_value(i32 1, !1121, !DIExpression(), !1113)
    #dbg_value(i32 0, !1122, !DIExpression(), !1113)
    #dbg_value(i32 0, !1123, !DIExpression(), !1125)
  br label %for.cond.i67, !dbg !1126

for.cond.i67:                                     ; preds = %for.inc17.i75, %mul_add_mat_x_m_mat.exit66
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc17.i75 ], [ 78, %mul_add_mat_x_m_mat.exit66 ], !dbg !1127
  %bs_mat_entries_used.0.i = phi i32 [ 0, %mul_add_mat_x_m_mat.exit66 ], [ %bs_mat_entries_used.1.i.lcssa, %for.inc17.i75 ], !dbg !1127
  %r.0.i68 = phi i32 [ 0, %mul_add_mat_x_m_mat.exit66 ], [ %inc18.i76, %for.inc17.i75 ], !dbg !1128
    #dbg_value(i32 %r.0.i68, !1123, !DIExpression(), !1125)
    #dbg_value(i32 %bs_mat_entries_used.0.i, !1122, !DIExpression(), !1113)
  %exitcond133 = icmp ne i32 %r.0.i68, 78, !dbg !1129
  br i1 %exitcond133, label %for.cond1.i72.preheader, label %for.cond.i34.preheader, !dbg !1131

for.cond.i34.preheader:                           ; preds = %for.cond.i67
  br label %for.cond.i34, !dbg !1132

for.cond1.i72.preheader:                          ; preds = %for.cond.i67
  %8 = add i32 %bs_mat_entries_used.0.i, %indvars.iv, !dbg !1134
  br label %for.cond1.i72, !dbg !1134

for.cond1.i72:                                    ; preds = %for.cond1.i72.preheader, %for.inc15.i80
  %bs_mat_entries_used.1.i = phi i32 [ %add14.i81, %for.inc15.i80 ], [ %bs_mat_entries_used.0.i, %for.cond1.i72.preheader ], !dbg !1113
  %c.0.i73 = phi i32 [ %inc.i82, %for.inc15.i80 ], [ %r.0.i68, %for.cond1.i72.preheader ], !dbg !1137
    #dbg_value(i32 %c.0.i73, !1138, !DIExpression(), !1139)
    #dbg_value(i32 %bs_mat_entries_used.1.i, !1122, !DIExpression(), !1113)
  %exitcond132 = icmp ne i32 %bs_mat_entries_used.1.i, %8, !dbg !1140
  br i1 %exitcond132, label %for.cond4.i77.preheader, label %for.inc17.i75, !dbg !1134

for.cond4.i77.preheader:                          ; preds = %for.cond1.i72
  br label %for.cond4.i77, !dbg !1142

for.cond4.i77:                                    ; preds = %for.cond4.i77.preheader, %for.body6.i83
  %k.0.i78 = phi i32 [ %add13.i, %for.body6.i83 ], [ 0, %for.cond4.i77.preheader ], !dbg !1145
    #dbg_value(i32 %k.0.i78, !1146, !DIExpression(), !1147)
  %exitcond131 = icmp ne i32 %k.0.i78, 10, !dbg !1148
  br i1 %exitcond131, label %for.body6.i83, label %for.inc15.i80, !dbg !1142

for.body6.i83:                                    ; preds = %for.cond4.i77
  %add.ptr.i85.idx = mul nsw i32 %bs_mat_entries_used.1.i, 40, !dbg !1150
  %add.ptr.i85 = getelementptr inbounds i8, ptr %sk, i32 %add.ptr.i85.idx, !dbg !1150
  %mul8.i86 = mul nuw nsw i32 %k.0.i78, 78, !dbg !1152
  %9 = getelementptr i8, ptr %Vdec, i32 %mul8.i86, !dbg !1153
  %arrayidx.i87 = getelementptr i8, ptr %9, i32 %c.0.i73, !dbg !1153
  %10 = load i8, ptr %arrayidx.i87, align 1, !dbg !1153
  %mul9.i = mul nuw nsw i32 %r.0.i68, 10, !dbg !1154
  %add10.i = add nuw nsw i32 %mul9.i, %k.0.i78, !dbg !1155
  %add.ptr12.i.idx = mul nuw nsw i32 %add10.i, 40, !dbg !1156
  %add.ptr12.i = getelementptr inbounds nuw i8, ptr %Pv.i, i32 %add.ptr12.i.idx, !dbg !1156
  call fastcc void @m_vec_mul_add(i32 noundef 5, ptr noundef nonnull %add.ptr.i85, i8 noundef zeroext %10, ptr noundef nonnull %add.ptr12.i) #9, !dbg !1157
  %add13.i = add nuw nsw i32 %k.0.i78, 1, !dbg !1158
    #dbg_value(i32 %add13.i, !1146, !DIExpression(), !1147)
  br label %for.cond4.i77, !dbg !1159, !llvm.loop !1160

for.inc15.i80:                                    ; preds = %for.cond4.i77
    #dbg_value(i32 %bs_mat_entries_used.1.i, !1122, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1113)
  %add14.i81 = add i32 %bs_mat_entries_used.1.i, 1, !dbg !1162
    #dbg_value(i32 %add14.i81, !1122, !DIExpression(), !1113)
  %inc.i82 = add nuw nsw i32 %c.0.i73, 1, !dbg !1163
    #dbg_value(i32 %inc.i82, !1138, !DIExpression(), !1139)
  br label %for.cond1.i72, !dbg !1164, !llvm.loop !1165

for.inc17.i75:                                    ; preds = %for.cond1.i72
  %bs_mat_entries_used.1.i.lcssa = phi i32 [ %bs_mat_entries_used.1.i, %for.cond1.i72 ], !dbg !1113
  %inc18.i76 = add nuw nsw i32 %r.0.i68, 1, !dbg !1167
    #dbg_value(i32 %inc18.i76, !1123, !DIExpression(), !1125)
  %indvars.iv.next = add nsw i32 %indvars.iv, -1, !dbg !1168
  br label %for.cond.i67, !dbg !1168, !llvm.loop !1169

for.cond.i34:                                     ; preds = %for.cond.i34.preheader, %for.inc17.i
  %r.0.i = phi i32 [ %inc18.i, %for.inc17.i ], [ 0, %for.cond.i34.preheader ], !dbg !1171
    #dbg_value(i32 %r.0.i, !1053, !DIExpression(), !1172)
  %exitcond136 = icmp ne i32 %r.0.i, 10, !dbg !1173
  br i1 %exitcond136, label %for.cond1.i36.preheader, label %mul_add_mat_x_m_mat.exit, !dbg !1132

for.cond1.i36.preheader:                          ; preds = %for.cond.i34
  br label %for.cond1.i36, !dbg !1174

for.cond1.i36:                                    ; preds = %for.cond1.i36.preheader, %for.inc15.i
  %c.0.i = phi i32 [ %inc.i38, %for.inc15.i ], [ 0, %for.cond1.i36.preheader ], !dbg !1175
    #dbg_value(i32 %c.0.i, !1065, !DIExpression(), !1176)
  %exitcond135 = icmp ne i32 %c.0.i, 78, !dbg !1177
  br i1 %exitcond135, label %for.cond4.i.preheader, label %for.inc17.i, !dbg !1174

for.cond4.i.preheader:                            ; preds = %for.cond1.i36
  br label %for.cond4.i, !dbg !1178

for.cond4.i:                                      ; preds = %for.cond4.i.preheader, %for.body6.i
  %k.0.i = phi i32 [ %add14.i, %for.body6.i ], [ 0, %for.cond4.i.preheader ], !dbg !1179
    #dbg_value(i32 %k.0.i, !1073, !DIExpression(), !1180)
  %exitcond134 = icmp ne i32 %k.0.i, 10, !dbg !1181
  br i1 %exitcond134, label %for.body6.i, label %for.inc15.i, !dbg !1178

for.body6.i:                                      ; preds = %for.cond4.i
  %mul.i = mul nuw nsw i32 %c.0.i, 10, !dbg !1182
  %add.i = add nuw nsw i32 %mul.i, %k.0.i, !dbg !1183
  %add.ptr.i39.idx = mul nuw nsw i32 %add.i, 40, !dbg !1184
  %add.ptr.i39 = getelementptr inbounds nuw i8, ptr %Pv.i, i32 %add.ptr.i39.idx, !dbg !1184
  %mul8.i = mul nuw nsw i32 %r.0.i, 78, !dbg !1185
  %11 = getelementptr i8, ptr %Vdec, i32 %mul8.i, !dbg !1186
  %arrayidx.i40 = getelementptr i8, ptr %11, i32 %c.0.i, !dbg !1186
  %12 = load i8, ptr %arrayidx.i40, align 1, !dbg !1186
  %mul10.i = mul nuw nsw i32 %r.0.i, 10, !dbg !1187
  %add11.i = add nuw nsw i32 %mul10.i, %k.0.i, !dbg !1188
  %add.ptr13.i.idx = mul nuw nsw i32 %add11.i, 40, !dbg !1189
  %add.ptr13.i = getelementptr inbounds nuw i8, ptr %A, i32 %add.ptr13.i.idx, !dbg !1189
  call fastcc void @m_vec_mul_add(i32 noundef 5, ptr noundef nonnull %add.ptr.i39, i8 noundef zeroext %12, ptr noundef nonnull %add.ptr13.i) #9, !dbg !1190
  %add14.i = add nuw nsw i32 %k.0.i, 1, !dbg !1191
    #dbg_value(i32 %add14.i, !1073, !DIExpression(), !1180)
  br label %for.cond4.i, !dbg !1192, !llvm.loop !1193

for.inc15.i:                                      ; preds = %for.cond4.i
  %inc.i38 = add nuw nsw i32 %c.0.i, 1, !dbg !1195
    #dbg_value(i32 %inc.i38, !1065, !DIExpression(), !1176)
  br label %for.cond1.i36, !dbg !1196, !llvm.loop !1197

for.inc17.i:                                      ; preds = %for.cond1.i36
  %inc18.i = add nuw nsw i32 %r.0.i, 1, !dbg !1199
    #dbg_value(i32 %inc18.i, !1053, !DIExpression(), !1172)
  br label %for.cond.i34, !dbg !1200, !llvm.loop !1201

mul_add_mat_x_m_mat.exit:                         ; preds = %for.cond.i34
  call void @llvm.lifetime.end.p0(i64 31200, ptr nonnull %Pv.i), !dbg !1203
  call fastcc void @compute_rhs(ptr noundef %p, ptr noundef nonnull %A, ptr noundef nonnull %t, ptr noundef nonnull %y) #9, !dbg !1204
  call void @llvm.lifetime.start.p0(i64 6400, ptr nonnull %A.i), !dbg !1205
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %tab.i), !dbg !1205
    #dbg_value(ptr %p, !1210, !DIExpression(), !1211)
    #dbg_value(ptr %Mtmp, !1212, !DIExpression(), !1211)
    #dbg_value(ptr %A, !1213, !DIExpression(), !1211)
    #dbg_value(i32 0, !1214, !DIExpression(), !1211)
    #dbg_value(i32 0, !1215, !DIExpression(), !1211)
    #dbg_value(i32 5, !1216, !DIExpression(), !1211)
    #dbg_declare(ptr %A.i, !1217, !DIExpression(), !1205)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(6400) %A.i, i8 0, i32 6400, i1 false), !dbg !1205
    #dbg_value(i32 80, !1221, !DIExpression(), !1211)
    #dbg_value(i64 1, !1222, !DIExpression(), !1225)
    #dbg_value(i64 72057594037927936, !1222, !DIExpression(), !1225)
    #dbg_value(i64 72057594037927935, !1222, !DIExpression(), !1225)
    #dbg_value(i32 0, !1226, !DIExpression(), !1228)
  br label %for.cond.i100, !dbg !1229

for.cond.i100:                                    ; preds = %for.body.i123, %mul_add_mat_x_m_mat.exit
  %i.0.i101 = phi i32 [ 0, %mul_add_mat_x_m_mat.exit ], [ %inc.i125, %for.body.i123 ], !dbg !1230
    #dbg_value(i32 %i.0.i101, !1226, !DIExpression(), !1228)
  %exitcond137 = icmp ne i32 %i.0.i101, 80, !dbg !1231
  br i1 %exitcond137, label %for.body.i123, label %for.cond3.i.preheader, !dbg !1233

for.cond3.i.preheader:                            ; preds = %for.cond.i100
  br label %for.cond3.i, !dbg !1234

for.body.i123:                                    ; preds = %for.cond.i100
  %.idx.i = mul nuw nsw i32 %i.0.i101, 40, !dbg !1236
  %13 = getelementptr inbounds nuw i8, ptr %Mtmp, i32 %.idx.i, !dbg !1236
  %arrayidx.i124 = getelementptr inbounds nuw i8, ptr %13, i32 32, !dbg !1236
  %14 = load i64, ptr %arrayidx.i124, align 8, !dbg !1238
  %and.i = and i64 %14, 72057594037927935, !dbg !1238
  store i64 %and.i, ptr %arrayidx.i124, align 8, !dbg !1238
  %inc.i125 = add nuw nsw i32 %i.0.i101, 1, !dbg !1239
    #dbg_value(i32 %inc.i125, !1226, !DIExpression(), !1228)
  br label %for.cond.i100, !dbg !1240, !llvm.loop !1241

for.cond3.i:                                      ; preds = %for.cond3.i.preheader, %for.inc103.i
  %i2.0.i = phi i32 [ %inc104.i, %for.inc103.i ], [ 0, %for.cond3.i.preheader ], !dbg !1243
  %words_to_shift.0.i = phi i32 [ %words_to_shift.1.i.lcssa, %for.inc103.i ], [ 0, %for.cond3.i.preheader ], !dbg !1244
  %bits_to_shift.0.i = phi i32 [ %bits_to_shift.1.i.lcssa, %for.inc103.i ], [ 0, %for.cond3.i.preheader ], !dbg !1245
    #dbg_value(i32 %bits_to_shift.0.i, !1214, !DIExpression(), !1211)
    #dbg_value(i32 %words_to_shift.0.i, !1215, !DIExpression(), !1211)
    #dbg_value(i32 %i2.0.i, !1246, !DIExpression(), !1247)
  %exitcond142 = icmp ne i32 %i2.0.i, 10, !dbg !1248
  br i1 %exitcond142, label %for.cond6.i.preheader, label %for.cond107.i.preheader, !dbg !1234

for.cond107.i.preheader:                          ; preds = %for.cond3.i
  br label %for.cond107.i, !dbg !1250

for.cond6.i.preheader:                            ; preds = %for.cond3.i
  br label %for.cond6.i, !dbg !1252

for.cond6.i:                                      ; preds = %for.cond6.i.preheader, %if.end95.i
  %j.0.i119 = phi i32 [ %dec.i, %if.end95.i ], [ 9, %for.cond6.i.preheader ], !dbg !1255
  %words_to_shift.1.i = phi i32 [ %spec.select.i, %if.end95.i ], [ %words_to_shift.0.i, %for.cond6.i.preheader ], !dbg !1211
  %bits_to_shift.1.i = phi i32 [ %spec.select3.i, %if.end95.i ], [ %bits_to_shift.0.i, %for.cond6.i.preheader ], !dbg !1211
    #dbg_value(i32 %bits_to_shift.1.i, !1214, !DIExpression(), !1211)
    #dbg_value(i32 %words_to_shift.1.i, !1215, !DIExpression(), !1211)
    #dbg_value(i32 %j.0.i119, !1256, !DIExpression(), !1257)
  %cmp7.not.i = icmp slt i32 %j.0.i119, %i2.0.i, !dbg !1258
  br i1 %cmp7.not.i, label %for.inc103.i, label %for.body8.i, !dbg !1252

for.body8.i:                                      ; preds = %for.cond6.i
  %add.ptr.idx.i = mul nsw i32 %j.0.i119, 320, !dbg !1260
  %add.ptr.i120 = getelementptr inbounds i8, ptr %Mtmp, i32 %add.ptr.idx.i, !dbg !1260
    #dbg_value(ptr %add.ptr.i120, !1262, !DIExpression(), !1211)
    #dbg_value(i32 0, !1263, !DIExpression(), !1265)
  br label %for.cond11.i, !dbg !1266

for.cond11.i:                                     ; preds = %for.inc44.i, %for.body8.i
  %c.0.i121 = phi i32 [ 0, %for.body8.i ], [ %inc45.i, %for.inc44.i ], !dbg !1267
    #dbg_value(i32 %c.0.i121, !1263, !DIExpression(), !1265)
  %exitcond139 = icmp ne i32 %c.0.i121, 8, !dbg !1268
  br i1 %exitcond139, label %for.cond14.i.preheader, label %for.end46.i, !dbg !1270

for.cond14.i.preheader:                           ; preds = %for.cond11.i
  br label %for.cond14.i, !dbg !1271

for.cond14.i:                                     ; preds = %for.cond14.i.preheader, %for.inc41.i
  %k.0.i122 = phi i32 [ %inc42.i, %for.inc41.i ], [ 0, %for.cond14.i.preheader ], !dbg !1274
    #dbg_value(i32 %k.0.i122, !1275, !DIExpression(), !1276)
  %exitcond138 = icmp ne i32 %k.0.i122, 5, !dbg !1277
  br i1 %exitcond138, label %for.body16.i, label %for.inc44.i, !dbg !1271

for.body16.i:                                     ; preds = %for.cond14.i
  %15 = getelementptr inbounds nuw i64, ptr %add.ptr.i120, i32 %k.0.i122, !dbg !1279
  %arrayidx19.idx.i = mul nuw nsw i32 %c.0.i121, 40, !dbg !1279
  %arrayidx19.i = getelementptr inbounds nuw i8, ptr %15, i32 %arrayidx19.idx.i, !dbg !1279
  %16 = load i64, ptr %arrayidx19.i, align 8, !dbg !1279
  %sh_prom.i = zext nneg i32 %bits_to_shift.1.i to i64, !dbg !1281
  %shl20.i = shl i64 %16, %sh_prom.i, !dbg !1281
  %mul21.i = shl nuw nsw i32 %i2.0.i, 3, !dbg !1282
  %add22.i = or disjoint i32 %mul21.i, %c.0.i121, !dbg !1283
  %add23.i = add nsw i32 %k.0.i122, %words_to_shift.1.i, !dbg !1284
  %mul24.i = mul i32 %add23.i, 80, !dbg !1285
  %add25.i = add i32 %add22.i, %mul24.i, !dbg !1286
  %arrayidx26.i = getelementptr inbounds nuw [800 x i64], ptr %A.i, i32 0, i32 %add25.i, !dbg !1287
  %17 = load i64, ptr %arrayidx26.i, align 8, !dbg !1288
  %xor.i = xor i64 %17, %shl20.i, !dbg !1288
  store i64 %xor.i, ptr %arrayidx26.i, align 8, !dbg !1288
  %cmp27.i = icmp sgt i32 %bits_to_shift.1.i, 0, !dbg !1289
  br i1 %cmp27.i, label %if.then.i, label %for.inc41.i, !dbg !1289

if.then.i:                                        ; preds = %for.body16.i
  %18 = getelementptr inbounds nuw i64, ptr %add.ptr.i120, i32 %k.0.i122, !dbg !1291
  %arrayidx30.idx.i = mul nuw nsw i32 %c.0.i121, 40, !dbg !1291
  %arrayidx30.i = getelementptr inbounds nuw i8, ptr %18, i32 %arrayidx30.idx.i, !dbg !1291
  %19 = load i64, ptr %arrayidx30.i, align 8, !dbg !1291
  %sub31.i = sub nsw i32 64, %bits_to_shift.1.i, !dbg !1293
  %sh_prom32.i = zext nneg i32 %sub31.i to i64, !dbg !1294
  %shr.i = lshr i64 %19, %sh_prom32.i, !dbg !1294
  %mul33.i = shl nuw nsw i32 %i2.0.i, 3, !dbg !1295
  %add34.i = or disjoint i32 %mul33.i, %c.0.i121, !dbg !1296
  %add35.i = add nsw i32 %k.0.i122, %words_to_shift.1.i, !dbg !1297
  %20 = mul i32 %add35.i, 80, !dbg !1298
  %mul37.i = add i32 %20, 80, !dbg !1298
  %add38.i = add i32 %add34.i, %mul37.i, !dbg !1299
  %arrayidx39.i = getelementptr inbounds nuw [800 x i64], ptr %A.i, i32 0, i32 %add38.i, !dbg !1300
  %21 = load i64, ptr %arrayidx39.i, align 8, !dbg !1301
  %xor40.i = xor i64 %21, %shr.i, !dbg !1301
  store i64 %xor40.i, ptr %arrayidx39.i, align 8, !dbg !1301
  br label %for.inc41.i, !dbg !1302

for.inc41.i:                                      ; preds = %if.then.i, %for.body16.i
  %inc42.i = add nuw nsw i32 %k.0.i122, 1, !dbg !1303
    #dbg_value(i32 %inc42.i, !1275, !DIExpression(), !1276)
  br label %for.cond14.i, !dbg !1304, !llvm.loop !1305

for.inc44.i:                                      ; preds = %for.cond14.i
  %inc45.i = add nuw nsw i32 %c.0.i121, 1, !dbg !1307
    #dbg_value(i32 %inc45.i, !1263, !DIExpression(), !1265)
  br label %for.cond11.i, !dbg !1308, !llvm.loop !1309

for.end46.i:                                      ; preds = %for.cond11.i
  %cmp47.not.i = icmp eq i32 %i2.0.i, %j.0.i119, !dbg !1311
  br i1 %cmp47.not.i, label %if.end95.i, label %if.then48.i, !dbg !1311

if.then48.i:                                      ; preds = %for.end46.i
  %add.ptr51.idx.i = mul nuw nsw i32 %i2.0.i, 320, !dbg !1313
  %add.ptr51.i = getelementptr inbounds nuw i8, ptr %Mtmp, i32 %add.ptr51.idx.i, !dbg !1313
    #dbg_value(ptr %add.ptr51.i, !1315, !DIExpression(), !1211)
    #dbg_value(i32 0, !1316, !DIExpression(), !1318)
  br label %for.cond53.i, !dbg !1319

for.cond53.i:                                     ; preds = %for.inc92.i, %if.then48.i
  %c52.0.i = phi i32 [ 0, %if.then48.i ], [ %inc93.i, %for.inc92.i ], !dbg !1320
    #dbg_value(i32 %c52.0.i, !1316, !DIExpression(), !1318)
  %exitcond141 = icmp ne i32 %c52.0.i, 8, !dbg !1321
  br i1 %exitcond141, label %for.cond57.i.preheader, label %if.end95.i.loopexit, !dbg !1323

for.cond57.i.preheader:                           ; preds = %for.cond53.i
  br label %for.cond57.i, !dbg !1324

for.cond57.i:                                     ; preds = %for.cond57.i.preheader, %for.inc89.i
  %k56.0.i = phi i32 [ %inc90.i, %for.inc89.i ], [ 0, %for.cond57.i.preheader ], !dbg !1327
    #dbg_value(i32 %k56.0.i, !1328, !DIExpression(), !1329)
  %exitcond140 = icmp ne i32 %k56.0.i, 5, !dbg !1330
  br i1 %exitcond140, label %for.body59.i, label %for.inc92.i, !dbg !1324

for.body59.i:                                     ; preds = %for.cond57.i
  %22 = getelementptr inbounds nuw i64, ptr %add.ptr51.i, i32 %k56.0.i, !dbg !1332
  %arrayidx62.idx.i = mul nuw nsw i32 %c52.0.i, 40, !dbg !1332
  %arrayidx62.i = getelementptr inbounds nuw i8, ptr %22, i32 %arrayidx62.idx.i, !dbg !1332
  %23 = load i64, ptr %arrayidx62.i, align 8, !dbg !1332
  %sh_prom63.i = zext nneg i32 %bits_to_shift.1.i to i64, !dbg !1334
  %shl64.i = shl i64 %23, %sh_prom63.i, !dbg !1334
  %mul65.i = shl nsw i32 %j.0.i119, 3, !dbg !1335
  %add66.i = or disjoint i32 %mul65.i, %c52.0.i, !dbg !1336
  %add67.i = add nsw i32 %k56.0.i, %words_to_shift.1.i, !dbg !1337
  %mul68.i = mul i32 %add67.i, 80, !dbg !1338
  %add69.i = add i32 %add66.i, %mul68.i, !dbg !1339
  %arrayidx70.i = getelementptr inbounds nuw [800 x i64], ptr %A.i, i32 0, i32 %add69.i, !dbg !1340
  %24 = load i64, ptr %arrayidx70.i, align 8, !dbg !1341
  %xor71.i = xor i64 %24, %shl64.i, !dbg !1341
  store i64 %xor71.i, ptr %arrayidx70.i, align 8, !dbg !1341
  %cmp72.i = icmp sgt i32 %bits_to_shift.1.i, 0, !dbg !1342
  br i1 %cmp72.i, label %if.then73.i, label %for.inc89.i, !dbg !1342

if.then73.i:                                      ; preds = %for.body59.i
  %25 = getelementptr inbounds nuw i64, ptr %add.ptr51.i, i32 %k56.0.i, !dbg !1344
  %arrayidx76.idx.i = mul nuw nsw i32 %c52.0.i, 40, !dbg !1344
  %arrayidx76.i = getelementptr inbounds nuw i8, ptr %25, i32 %arrayidx76.idx.i, !dbg !1344
  %26 = load i64, ptr %arrayidx76.i, align 8, !dbg !1344
  %sub77.i = sub nsw i32 64, %bits_to_shift.1.i, !dbg !1346
  %sh_prom78.i = zext nneg i32 %sub77.i to i64, !dbg !1347
  %shr79.i = lshr i64 %26, %sh_prom78.i, !dbg !1347
  %mul80.i = shl nsw i32 %j.0.i119, 3, !dbg !1348
  %add81.i = or disjoint i32 %mul80.i, %c52.0.i, !dbg !1349
  %add82.i = add nsw i32 %k56.0.i, %words_to_shift.1.i, !dbg !1350
  %27 = mul i32 %add82.i, 80, !dbg !1351
  %mul84.i = add i32 %27, 80, !dbg !1351
  %add85.i = add i32 %add81.i, %mul84.i, !dbg !1352
  %arrayidx86.i = getelementptr inbounds nuw [800 x i64], ptr %A.i, i32 0, i32 %add85.i, !dbg !1353
  %28 = load i64, ptr %arrayidx86.i, align 8, !dbg !1354
  %xor87.i = xor i64 %28, %shr79.i, !dbg !1354
  store i64 %xor87.i, ptr %arrayidx86.i, align 8, !dbg !1354
  br label %for.inc89.i, !dbg !1355

for.inc89.i:                                      ; preds = %if.then73.i, %for.body59.i
  %inc90.i = add nuw nsw i32 %k56.0.i, 1, !dbg !1356
    #dbg_value(i32 %inc90.i, !1328, !DIExpression(), !1329)
  br label %for.cond57.i, !dbg !1357, !llvm.loop !1358

for.inc92.i:                                      ; preds = %for.cond57.i
  %inc93.i = add nuw nsw i32 %c52.0.i, 1, !dbg !1360
    #dbg_value(i32 %inc93.i, !1316, !DIExpression(), !1318)
  br label %for.cond53.i, !dbg !1361, !llvm.loop !1362

if.end95.i.loopexit:                              ; preds = %for.cond53.i
  br label %if.end95.i, !dbg !1364

if.end95.i:                                       ; preds = %if.end95.i.loopexit, %for.end46.i
  %add96.i = add nsw i32 %bits_to_shift.1.i, 4, !dbg !1364
    #dbg_value(i32 %add96.i, !1214, !DIExpression(), !1211)
  %cmp97.i = icmp eq i32 %add96.i, 64, !dbg !1365
  %inc99.i = zext i1 %cmp97.i to i32, !dbg !1365
  %spec.select.i = add nsw i32 %words_to_shift.1.i, %inc99.i, !dbg !1365
  %spec.select3.i = select i1 %cmp97.i, i32 0, i32 %add96.i, !dbg !1365
    #dbg_value(i32 %spec.select3.i, !1214, !DIExpression(), !1211)
    #dbg_value(i32 %spec.select.i, !1215, !DIExpression(), !1211)
  %dec.i = add nsw i32 %j.0.i119, -1, !dbg !1367
    #dbg_value(i32 %dec.i, !1256, !DIExpression(), !1257)
  br label %for.cond6.i, !dbg !1368, !llvm.loop !1369

for.inc103.i:                                     ; preds = %for.cond6.i
  %words_to_shift.1.i.lcssa = phi i32 [ %words_to_shift.1.i, %for.cond6.i ], !dbg !1211
  %bits_to_shift.1.i.lcssa = phi i32 [ %bits_to_shift.1.i, %for.cond6.i ], !dbg !1211
  %inc104.i = add nuw nsw i32 %i2.0.i, 1, !dbg !1371
    #dbg_value(i32 %inc104.i, !1246, !DIExpression(), !1247)
  br label %for.cond3.i, !dbg !1372, !llvm.loop !1373

for.cond107.i:                                    ; preds = %for.cond107.i.preheader, %transpose_16x16_nibbles.exit.i
  %c106.0.i = phi i32 [ %add113.i, %transpose_16x16_nibbles.exit.i ], [ 0, %for.cond107.i.preheader ], !dbg !1375
    #dbg_value(i32 %c106.0.i, !1376, !DIExpression(), !1377)
  %cmp109.i = icmp samesign ult i32 %c106.0.i, 720, !dbg !1378
  br i1 %cmp109.i, label %for.body110.i, label %for.end114.i, !dbg !1250

for.body110.i:                                    ; preds = %for.cond107.i
  %add.ptr111.i = getelementptr inbounds nuw i64, ptr %A.i, i32 %c106.0.i, !dbg !1380
    #dbg_value(ptr %add.ptr111.i, !1382, !DIExpression(), !1383)
    #dbg_value(i32 0, !1385, !DIExpression(), !1387)
  br label %for.cond.i31.i, !dbg !1388

for.cond.i31.i:                                   ; preds = %for.body.i35.i, %for.body110.i
  %i.0.i32.i = phi i32 [ 0, %for.body110.i ], [ %add7.i.i, %for.body.i35.i ], !dbg !1389
    #dbg_value(i32 %i.0.i32.i, !1385, !DIExpression(), !1387)
  %cmp.i33.i = icmp samesign ult i32 %i.0.i32.i, 16, !dbg !1390
  br i1 %cmp.i33.i, label %for.body.i35.i, label %for.cond9.i.i.preheader, !dbg !1392

for.cond9.i.i.preheader:                          ; preds = %for.cond.i31.i
  br label %for.cond9.i.i, !dbg !1393

for.body.i35.i:                                   ; preds = %for.cond.i31.i
  %arrayidx.i36.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %i.0.i32.i, !dbg !1395
  %29 = load i64, ptr %arrayidx.i36.i, align 8, !dbg !1395
  %shr.i.i = lshr i64 %29, 4, !dbg !1397
  %add.i.i = or disjoint i32 %i.0.i32.i, 1, !dbg !1398
  %arrayidx1.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add.i.i, !dbg !1399
  %30 = load i64, ptr %arrayidx1.i.i, align 8, !dbg !1399
  %xor.i.i = xor i64 %shr.i.i, %30, !dbg !1400
  %and.i.i = and i64 %xor.i.i, 1085102592571150095, !dbg !1401
    #dbg_value(i64 %and.i.i, !1402, !DIExpression(), !1403)
  %shl.i.i = shl nuw i64 %and.i.i, 4, !dbg !1404
  %arrayidx2.i37.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %i.0.i32.i, !dbg !1405
  %31 = load i64, ptr %arrayidx2.i37.i, align 8, !dbg !1406
  %xor3.i.i = xor i64 %31, %shl.i.i, !dbg !1406
  store i64 %xor3.i.i, ptr %arrayidx2.i37.i, align 8, !dbg !1406
  %add4.i.i = or disjoint i32 %i.0.i32.i, 1, !dbg !1407
  %arrayidx5.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add4.i.i, !dbg !1408
  %32 = load i64, ptr %arrayidx5.i.i, align 8, !dbg !1409
  %xor6.i.i = xor i64 %32, %and.i.i, !dbg !1409
  store i64 %xor6.i.i, ptr %arrayidx5.i.i, align 8, !dbg !1409
  %add7.i.i = add nuw nsw i32 %i.0.i32.i, 2, !dbg !1410
    #dbg_value(i32 %add7.i.i, !1385, !DIExpression(), !1387)
  br label %for.cond.i31.i, !dbg !1411, !llvm.loop !1412

for.cond9.i.i:                                    ; preds = %for.cond9.i.i.preheader, %for.body11.i.i
  %i8.0.i.i = phi i32 [ %add39.i.i, %for.body11.i.i ], [ 0, %for.cond9.i.i.preheader ], !dbg !1414
    #dbg_value(i32 %i8.0.i.i, !1415, !DIExpression(), !1416)
  %cmp10.i.i = icmp samesign ult i32 %i8.0.i.i, 16, !dbg !1417
  br i1 %cmp10.i.i, label %for.body11.i.i, label %for.cond42.i.i.preheader, !dbg !1393

for.cond42.i.i.preheader:                         ; preds = %for.cond9.i.i
  br label %for.cond42.i.i, !dbg !1419

for.body11.i.i:                                   ; preds = %for.cond9.i.i
  %arrayidx12.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %i8.0.i.i, !dbg !1421
  %33 = load i64, ptr %arrayidx12.i.i, align 8, !dbg !1421
  %shr13.i.i = lshr i64 %33, 8, !dbg !1423
  %add14.i.i = or disjoint i32 %i8.0.i.i, 2, !dbg !1424
  %arrayidx15.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add14.i.i, !dbg !1425
  %34 = load i64, ptr %arrayidx15.i.i, align 8, !dbg !1425
  %xor16.i.i = xor i64 %shr13.i.i, %34, !dbg !1426
  %and17.i.i = and i64 %xor16.i.i, 71777214294589695, !dbg !1427
    #dbg_value(i64 %and17.i.i, !1428, !DIExpression(), !1429)
  %add18.i.i = or disjoint i32 %i8.0.i.i, 1, !dbg !1430
  %arrayidx19.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add18.i.i, !dbg !1431
  %35 = load i64, ptr %arrayidx19.i.i, align 8, !dbg !1431
  %shr20.i.i = lshr i64 %35, 8, !dbg !1432
  %add21.i.i = or disjoint i32 %i8.0.i.i, 3, !dbg !1433
  %arrayidx22.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add21.i.i, !dbg !1434
  %36 = load i64, ptr %arrayidx22.i.i, align 8, !dbg !1434
  %xor23.i.i = xor i64 %shr20.i.i, %36, !dbg !1435
  %and24.i.i = and i64 %xor23.i.i, 71777214294589695, !dbg !1436
    #dbg_value(i64 %and24.i.i, !1437, !DIExpression(), !1429)
  %shl25.i.i = shl nuw i64 %and17.i.i, 8, !dbg !1438
  %arrayidx26.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %i8.0.i.i, !dbg !1439
  %37 = load i64, ptr %arrayidx26.i.i, align 8, !dbg !1440
  %xor27.i.i = xor i64 %37, %shl25.i.i, !dbg !1440
  store i64 %xor27.i.i, ptr %arrayidx26.i.i, align 8, !dbg !1440
  %shl28.i.i = shl nuw i64 %and24.i.i, 8, !dbg !1441
  %add29.i.i = or disjoint i32 %i8.0.i.i, 1, !dbg !1442
  %arrayidx30.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add29.i.i, !dbg !1443
  %38 = load i64, ptr %arrayidx30.i.i, align 8, !dbg !1444
  %xor31.i.i = xor i64 %38, %shl28.i.i, !dbg !1444
  store i64 %xor31.i.i, ptr %arrayidx30.i.i, align 8, !dbg !1444
  %add32.i.i = or disjoint i32 %i8.0.i.i, 2, !dbg !1445
  %arrayidx33.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add32.i.i, !dbg !1446
  %39 = load i64, ptr %arrayidx33.i.i, align 8, !dbg !1447
  %xor34.i.i = xor i64 %39, %and17.i.i, !dbg !1447
  store i64 %xor34.i.i, ptr %arrayidx33.i.i, align 8, !dbg !1447
  %add35.i.i = or disjoint i32 %i8.0.i.i, 3, !dbg !1448
  %arrayidx36.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add35.i.i, !dbg !1449
  %40 = load i64, ptr %arrayidx36.i.i, align 8, !dbg !1450
  %xor37.i.i = xor i64 %40, %and24.i.i, !dbg !1450
  store i64 %xor37.i.i, ptr %arrayidx36.i.i, align 8, !dbg !1450
  %add39.i.i = add nuw nsw i32 %i8.0.i.i, 4, !dbg !1451
    #dbg_value(i32 %add39.i.i, !1415, !DIExpression(), !1416)
  br label %for.cond9.i.i, !dbg !1452, !llvm.loop !1453

for.cond42.i.i:                                   ; preds = %for.cond42.i.i.preheader, %for.body44.i.i
  %i41.0.i.i = phi i32 [ %inc.i34.i, %for.body44.i.i ], [ 0, %for.cond42.i.i.preheader ], !dbg !1455
    #dbg_value(i32 %i41.0.i.i, !1456, !DIExpression(), !1457)
  %exitcond143 = icmp ne i32 %i41.0.i.i, 4, !dbg !1458
  br i1 %exitcond143, label %for.body44.i.i, label %for.cond76.i.i.preheader, !dbg !1419

for.cond76.i.i.preheader:                         ; preds = %for.cond42.i.i
  br label %for.cond76.i.i, !dbg !1460

for.body44.i.i:                                   ; preds = %for.cond42.i.i
  %arrayidx46.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %i41.0.i.i, !dbg !1462
  %41 = load i64, ptr %arrayidx46.i.i, align 8, !dbg !1462
  %shr47.i.i = lshr i64 %41, 16, !dbg !1464
  %add48.i.i = or disjoint i32 %i41.0.i.i, 4, !dbg !1465
  %arrayidx49.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add48.i.i, !dbg !1466
  %42 = load i64, ptr %arrayidx49.i.i, align 8, !dbg !1466
  %xor50.i.i = xor i64 %shr47.i.i, %42, !dbg !1467
  %and51.i.i = and i64 %xor50.i.i, 281470681808895, !dbg !1468
    #dbg_value(i64 %and51.i.i, !1469, !DIExpression(), !1470)
  %add53.i.i = or disjoint i32 %i41.0.i.i, 8, !dbg !1471
  %arrayidx54.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add53.i.i, !dbg !1472
  %43 = load i64, ptr %arrayidx54.i.i, align 8, !dbg !1472
  %shr55.i.i = lshr i64 %43, 16, !dbg !1473
  %add56.i.i = or disjoint i32 %i41.0.i.i, 12, !dbg !1474
  %arrayidx57.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add56.i.i, !dbg !1475
  %44 = load i64, ptr %arrayidx57.i.i, align 8, !dbg !1475
  %xor58.i.i = xor i64 %shr55.i.i, %44, !dbg !1476
  %and59.i.i = and i64 %xor58.i.i, 281470681808895, !dbg !1477
    #dbg_value(i64 %and59.i.i, !1478, !DIExpression(), !1470)
  %shl60.i.i = shl nuw i64 %and51.i.i, 16, !dbg !1479
  %arrayidx61.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %i41.0.i.i, !dbg !1480
  %45 = load i64, ptr %arrayidx61.i.i, align 8, !dbg !1481
  %xor62.i.i = xor i64 %45, %shl60.i.i, !dbg !1481
  store i64 %xor62.i.i, ptr %arrayidx61.i.i, align 8, !dbg !1481
  %shl63.i.i = shl nuw i64 %and59.i.i, 16, !dbg !1482
  %add64.i.i = or disjoint i32 %i41.0.i.i, 8, !dbg !1483
  %arrayidx65.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add64.i.i, !dbg !1484
  %46 = load i64, ptr %arrayidx65.i.i, align 8, !dbg !1485
  %xor66.i.i = xor i64 %46, %shl63.i.i, !dbg !1485
  store i64 %xor66.i.i, ptr %arrayidx65.i.i, align 8, !dbg !1485
  %add67.i.i = or disjoint i32 %i41.0.i.i, 4, !dbg !1486
  %arrayidx68.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add67.i.i, !dbg !1487
  %47 = load i64, ptr %arrayidx68.i.i, align 8, !dbg !1488
  %xor69.i.i = xor i64 %47, %and51.i.i, !dbg !1488
  store i64 %xor69.i.i, ptr %arrayidx68.i.i, align 8, !dbg !1488
  %add70.i.i = or disjoint i32 %i41.0.i.i, 12, !dbg !1489
  %arrayidx71.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add70.i.i, !dbg !1490
  %48 = load i64, ptr %arrayidx71.i.i, align 8, !dbg !1491
  %xor72.i.i = xor i64 %48, %and59.i.i, !dbg !1491
  store i64 %xor72.i.i, ptr %arrayidx71.i.i, align 8, !dbg !1491
  %inc.i34.i = add nuw nsw i32 %i41.0.i.i, 1, !dbg !1492
    #dbg_value(i32 %inc.i34.i, !1456, !DIExpression(), !1457)
  br label %for.cond42.i.i, !dbg !1493, !llvm.loop !1494

for.cond76.i.i:                                   ; preds = %for.cond76.i.i.preheader, %for.body78.i.i
  %i75.0.i.i = phi i32 [ %inc93.i.i, %for.body78.i.i ], [ 0, %for.cond76.i.i.preheader ], !dbg !1496
    #dbg_value(i32 %i75.0.i.i, !1497, !DIExpression(), !1498)
  %exitcond144 = icmp ne i32 %i75.0.i.i, 8, !dbg !1499
  br i1 %exitcond144, label %for.body78.i.i, label %transpose_16x16_nibbles.exit.i, !dbg !1460

for.body78.i.i:                                   ; preds = %for.cond76.i.i
  %arrayidx80.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %i75.0.i.i, !dbg !1501
  %49 = load i64, ptr %arrayidx80.i.i, align 8, !dbg !1501
  %shr81.i.i = lshr i64 %49, 32, !dbg !1503
  %add82.i.i = or disjoint i32 %i75.0.i.i, 8, !dbg !1504
  %arrayidx83.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add82.i.i, !dbg !1505
  %50 = load i64, ptr %arrayidx83.i.i, align 8, !dbg !1505
  %.masked.i.i = and i64 %50, 4294967295, !dbg !1506
  %and85.i.i = xor i64 %shr81.i.i, %.masked.i.i, !dbg !1506
    #dbg_value(i64 %and85.i.i, !1507, !DIExpression(), !1508)
  %shl86.i.i = shl nuw i64 %and85.i.i, 32, !dbg !1509
  %arrayidx87.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %i75.0.i.i, !dbg !1510
  %51 = load i64, ptr %arrayidx87.i.i, align 8, !dbg !1511
  %xor88.i.i = xor i64 %51, %shl86.i.i, !dbg !1511
  store i64 %xor88.i.i, ptr %arrayidx87.i.i, align 8, !dbg !1511
  %add89.i.i = or disjoint i32 %i75.0.i.i, 8, !dbg !1512
  %arrayidx90.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add89.i.i, !dbg !1513
  %52 = load i64, ptr %arrayidx90.i.i, align 8, !dbg !1514
  %xor91.i.i = xor i64 %52, %and85.i.i, !dbg !1514
  store i64 %xor91.i.i, ptr %arrayidx90.i.i, align 8, !dbg !1514
  %inc93.i.i = add nuw nsw i32 %i75.0.i.i, 1, !dbg !1515
    #dbg_value(i32 %inc93.i.i, !1497, !DIExpression(), !1498)
  br label %for.cond76.i.i, !dbg !1516, !llvm.loop !1517

transpose_16x16_nibbles.exit.i:                   ; preds = %for.cond76.i.i
  %add113.i = add nuw nsw i32 %c106.0.i, 16, !dbg !1519
    #dbg_value(i32 %add113.i, !1376, !DIExpression(), !1377)
  br label %for.cond107.i, !dbg !1520, !llvm.loop !1521

for.end114.i:                                     ; preds = %for.cond107.i
    #dbg_declare(ptr %tab.i, !1523, !DIExpression(), !1527)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(16) %tab.i, i8 0, i32 16, i1 false), !dbg !1527
    #dbg_value(i32 0, !1528, !DIExpression(), !1530)
  br label %for.cond116.i, !dbg !1531

for.cond116.i:                                    ; preds = %for.body118.i, %for.end114.i
  %i115.0.i = phi i32 [ 0, %for.end114.i ], [ %inc138.i, %for.body118.i ], !dbg !1532
    #dbg_value(i32 %i115.0.i, !1528, !DIExpression(), !1530)
  %exitcond145 = icmp ne i32 %i115.0.i, 4, !dbg !1533
  br i1 %exitcond145, label %for.body118.i, label %for.cond141.i.preheader, !dbg !1535

for.cond141.i.preheader:                          ; preds = %for.cond116.i
  br label %for.cond141.i, !dbg !1536

for.body118.i:                                    ; preds = %for.cond116.i
  %arrayidx119.i = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %i115.0.i, !dbg !1538
  %53 = load i8, ptr %arrayidx119.i, align 1, !dbg !1538
    #dbg_value(i8 %53, !1540, !DIExpression(), !1544)
    #dbg_value(i8 1, !1546, !DIExpression(), !1544)
  %54 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !1547
  %xor1.i4.i = xor i8 %53, %54, !dbg !1548
    #dbg_value(i8 %xor1.i4.i, !1540, !DIExpression(), !1544)
    #dbg_value(i8 poison, !1549, !DIExpression(), !1544)
    #dbg_value(i8 %xor1.i4.i, !1549, !DIExpression(DW_OP_constu, 3, DW_OP_and, DW_OP_stack_value), !1544)
    #dbg_value(i8 %xor1.i4.i, !1549, !DIExpression(DW_OP_constu, 7, DW_OP_and, DW_OP_stack_value), !1544)
  %xor25.i11.i = and i8 %xor1.i4.i, 15, !dbg !1550
    #dbg_value(i8 %xor25.i11.i, !1549, !DIExpression(), !1544)
    #dbg_value(i8 %xor25.i11.i, !1551, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !1544)
    #dbg_value(i8 %xor25.i11.i, !1552, !DIExpression(), !1544)
  %mul120.i = shl nuw nsw i32 %i115.0.i, 2, !dbg !1553
  %arrayidx121.i = getelementptr inbounds nuw [16 x i8], ptr %tab.i, i32 0, i32 %mul120.i, !dbg !1554
  store i8 %xor25.i11.i, ptr %arrayidx121.i, align 1, !dbg !1555
    #dbg_value(i8 %53, !1540, !DIExpression(), !1556)
    #dbg_value(i8 2, !1546, !DIExpression(), !1556)
  %55 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !1558
  %xor1.i13.i = xor i8 %53, %55, !dbg !1559
    #dbg_value(i8 %xor1.i13.i, !1540, !DIExpression(), !1556)
  %56 = trunc i8 %xor1.i13.i to i1, !dbg !1560
    #dbg_value(i8 poison, !1549, !DIExpression(), !1556)
  %57 = shl i8 %xor1.i13.i, 1, !dbg !1561
  %mul9.i14.i = and i8 %57, 4, !dbg !1561
  %conv10.i15.i = select i1 %56, i8 2, i8 0, !dbg !1560
  %xor11.i16.i = or disjoint i8 %conv10.i15.i, %mul9.i14.i, !dbg !1562
    #dbg_value(i8 %xor11.i16.i, !1549, !DIExpression(), !1556)
  %58 = shl i8 %xor1.i13.i, 1, !dbg !1563
  %mul16.i17.i = and i8 %58, 8, !dbg !1563
  %xor18.i18.i = or disjoint i8 %mul16.i17.i, %xor11.i16.i, !dbg !1564
    #dbg_value(i8 %xor18.i18.i, !1549, !DIExpression(), !1556)
  %59 = shl i8 %xor1.i13.i, 1, !dbg !1565
  %mul23.i19.i = and i8 %59, 16, !dbg !1565
    #dbg_value(!DIArgList(i8 %59, i8 %xor18.i18.i), !1549, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_constu, 16, DW_OP_and, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value), !1556)
    #dbg_value(!DIArgList(i8 %59, i8 %xor18.i18.i), !1551, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_constu, 16, DW_OP_and, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !1556)
  %60 = lshr exact i8 %mul23.i19.i, 4, !dbg !1566
  %61 = lshr exact i8 %mul23.i19.i, 3, !dbg !1567
  %62 = or disjoint i8 %60, %61, !dbg !1568
  %63 = xor i8 %62, %xor18.i18.i, !dbg !1569
    #dbg_value(i8 %63, !1552, !DIExpression(), !1556)
  %mul124.i = shl nuw nsw i32 %i115.0.i, 2, !dbg !1570
  %add125.i = or disjoint i32 %mul124.i, 1, !dbg !1571
  %arrayidx126.i = getelementptr inbounds nuw [16 x i8], ptr %tab.i, i32 0, i32 %add125.i, !dbg !1572
  store i8 %63, ptr %arrayidx126.i, align 1, !dbg !1573
  %arrayidx127.i = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %i115.0.i, !dbg !1574
  %64 = load i8, ptr %arrayidx127.i, align 1, !dbg !1574
    #dbg_value(i8 %64, !1540, !DIExpression(), !1575)
    #dbg_value(i8 4, !1546, !DIExpression(), !1575)
  %65 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !1577
  %xor1.i22.i = xor i8 %64, %65, !dbg !1578
    #dbg_value(i8 %xor1.i22.i, !1540, !DIExpression(), !1575)
  %66 = trunc i8 %xor1.i22.i to i1, !dbg !1579
    #dbg_value(i8 poison, !1549, !DIExpression(), !1575)
  %67 = shl i8 %xor1.i22.i, 2, !dbg !1580
  %mul9.i23.i = and i8 %67, 8, !dbg !1580
  %conv10.i24.i = select i1 %66, i8 4, i8 0, !dbg !1579
  %xor11.i25.i = or disjoint i8 %conv10.i24.i, %mul9.i23.i, !dbg !1581
    #dbg_value(!DIArgList(i8 %conv10.i24.i, i8 %mul9.i23.i), !1549, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value), !1575)
  %68 = shl i8 %xor1.i22.i, 2, !dbg !1582
  %mul16.i26.i = and i8 %68, 16, !dbg !1582
    #dbg_value(!DIArgList(i8 %mul16.i26.i, i8 %conv10.i24.i, i8 %mul9.i23.i), !1549, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_or, DW_OP_or, DW_OP_stack_value), !1575)
  %69 = shl i8 %xor1.i22.i, 2, !dbg !1583
  %mul23.i28.i = and i8 %69, 32, !dbg !1583
  %70 = or disjoint i8 %mul16.i26.i, %mul23.i28.i, !dbg !1584
    #dbg_value(!DIArgList(i8 %mul23.i28.i, i8 %mul16.i26.i, i8 %conv10.i24.i, i8 %mul9.i23.i), !1549, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_or, DW_OP_or, DW_OP_or, DW_OP_stack_value), !1575)
    #dbg_value(!DIArgList(i8 %mul23.i28.i, i8 %mul16.i26.i, i8 %conv10.i24.i, i8 %mul9.i23.i), !1551, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_or, DW_OP_or, DW_OP_or, DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !1575)
  %71 = lshr exact i8 %70, 4, !dbg !1585
  %72 = lshr exact i8 %70, 3, !dbg !1586
  %73 = xor i8 %71, %72, !dbg !1587
  %74 = xor i8 %73, %xor11.i25.i, !dbg !1588
    #dbg_value(i8 %74, !1552, !DIExpression(), !1575)
  %mul129.i = shl nuw nsw i32 %i115.0.i, 2, !dbg !1589
  %add130.i = or disjoint i32 %mul129.i, 2, !dbg !1590
  %arrayidx131.i = getelementptr inbounds nuw [16 x i8], ptr %tab.i, i32 0, i32 %add130.i, !dbg !1591
  store i8 %74, ptr %arrayidx131.i, align 1, !dbg !1592
  %arrayidx132.i = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %i115.0.i, !dbg !1593
  %75 = load i8, ptr %arrayidx132.i, align 1, !dbg !1593
    #dbg_value(i8 %75, !1540, !DIExpression(), !1594)
    #dbg_value(i8 8, !1546, !DIExpression(), !1594)
  %76 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !1596
  %xor1.i.i110 = xor i8 %75, %76, !dbg !1597
    #dbg_value(i8 %xor1.i.i110, !1540, !DIExpression(), !1594)
  %77 = trunc i8 %xor1.i.i110 to i1, !dbg !1598
    #dbg_value(i8 poison, !1549, !DIExpression(), !1594)
  %78 = shl i8 %xor1.i.i110, 3, !dbg !1599
  %mul9.i.i111 = and i8 %78, 16, !dbg !1599
  %conv10.i.i112 = select i1 %77, i8 8, i8 0, !dbg !1598
    #dbg_value(!DIArgList(i8 poison, i8 poison), !1549, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value), !1594)
  %79 = shl i8 %xor1.i.i110, 3, !dbg !1600
  %mul16.i.i114 = and i8 %79, 32, !dbg !1600
  %80 = or disjoint i8 %mul9.i.i111, %mul16.i.i114, !dbg !1601
    #dbg_value(!DIArgList(i8 poison, i8 poison), !1549, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value), !1594)
  %81 = shl i8 %xor1.i.i110, 3, !dbg !1602
  %mul23.i.i116 = and i8 %81, 64, !dbg !1602
  %82 = or disjoint i8 %80, %mul23.i.i116, !dbg !1603
    #dbg_value(!DIArgList(i8 poison, i8 poison, i8 poison), !1549, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_or, DW_OP_or, DW_OP_stack_value), !1594)
    #dbg_value(!DIArgList(i8 poison, i8 poison, i8 poison), !1551, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_or, DW_OP_or, DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !1594)
  %83 = lshr exact i8 %82, 4, !dbg !1604
  %84 = lshr exact i8 %82, 3, !dbg !1605
  %85 = xor i8 %83, %84, !dbg !1606
  %86 = xor i8 %85, %conv10.i.i112, !dbg !1607
    #dbg_value(i8 %86, !1552, !DIExpression(), !1594)
  %mul134.i = shl nuw nsw i32 %i115.0.i, 2, !dbg !1608
  %add135.i = or disjoint i32 %mul134.i, 3, !dbg !1609
  %arrayidx136.i = getelementptr inbounds nuw [16 x i8], ptr %tab.i, i32 0, i32 %add135.i, !dbg !1610
  store i8 %86, ptr %arrayidx136.i, align 1, !dbg !1611
  %inc138.i = add nuw nsw i32 %i115.0.i, 1, !dbg !1612
    #dbg_value(i32 %inc138.i, !1528, !DIExpression(), !1530)
  br label %for.cond116.i, !dbg !1613, !llvm.loop !1614

for.cond141.i:                                    ; preds = %for.cond141.i.preheader, %for.inc203.i
  %c140.0.i = phi i32 [ %add204.i, %for.inc203.i ], [ 0, %for.cond141.i.preheader ], !dbg !1616
    #dbg_value(i32 %c140.0.i, !1617, !DIExpression(), !1618)
  %cmp142.i = icmp samesign ult i32 %c140.0.i, 80, !dbg !1619
  br i1 %cmp142.i, label %for.cond144.i.preheader, label %for.cond207.i.preheader, !dbg !1536

for.cond207.i.preheader:                          ; preds = %for.cond141.i
  br label %for.cond207.i, !dbg !1621

for.cond144.i.preheader:                          ; preds = %for.cond141.i
  br label %for.cond144.i, !dbg !1623

for.cond144.i:                                    ; preds = %for.cond144.i.preheader, %for.inc200.i
  %r.0.i109 = phi i32 [ %inc201.i, %for.inc200.i ], [ 78, %for.cond144.i.preheader ], !dbg !1626
    #dbg_value(i32 %r.0.i109, !1627, !DIExpression(), !1628)
  %exitcond147 = icmp ne i32 %r.0.i109, 133, !dbg !1629
  br i1 %exitcond147, label %for.body146.i, label %for.inc203.i, !dbg !1623

for.body146.i:                                    ; preds = %for.cond144.i
  %div1.i = lshr i32 %r.0.i109, 4, !dbg !1631
  %mul147.i = mul nuw nsw i32 %div1.i, 80, !dbg !1633
  %add148.i = add nuw nsw i32 %mul147.i, %c140.0.i, !dbg !1634
  %rem.i = and i32 %r.0.i109, 15, !dbg !1635
  %add149.i = or disjoint i32 %add148.i, %rem.i, !dbg !1636
    #dbg_value(i32 %add149.i, !1637, !DIExpression(), !1638)
  %arrayidx150.i = getelementptr inbounds nuw [800 x i64], ptr %A.i, i32 0, i32 %add149.i, !dbg !1639
  %87 = load i64, ptr %arrayidx150.i, align 8, !dbg !1639
  %and151.i = and i64 %87, 1229782938247303441, !dbg !1640
    #dbg_value(i64 %and151.i, !1641, !DIExpression(), !1638)
  %shr153.i = lshr i64 %87, 1, !dbg !1642
  %and154.i = and i64 %shr153.i, 1229782938247303441, !dbg !1643
    #dbg_value(i64 %and154.i, !1644, !DIExpression(), !1638)
  %shr156.i = lshr i64 %87, 2, !dbg !1645
  %and157.i = and i64 %shr156.i, 1229782938247303441, !dbg !1646
    #dbg_value(i64 %and157.i, !1647, !DIExpression(), !1638)
  %arrayidx158.i = getelementptr inbounds nuw [800 x i64], ptr %A.i, i32 0, i32 %add149.i, !dbg !1648
  %88 = load i64, ptr %arrayidx158.i, align 8, !dbg !1648
  %shr159.i = lshr i64 %88, 3, !dbg !1649
  %and160.i = and i64 %shr159.i, 1229782938247303441, !dbg !1650
    #dbg_value(i64 %and160.i, !1651, !DIExpression(), !1638)
    #dbg_value(i32 0, !1652, !DIExpression(), !1654)
  br label %for.cond161.i, !dbg !1655

for.cond161.i:                                    ; preds = %for.body163.i, %for.body146.i
  %t.0.i = phi i32 [ 0, %for.body146.i ], [ %inc198.i, %for.body163.i ], !dbg !1656
    #dbg_value(i32 %t.0.i, !1652, !DIExpression(), !1654)
  %exitcond146 = icmp ne i32 %t.0.i, 4, !dbg !1657
  br i1 %exitcond146, label %for.body163.i, label %for.inc200.i, !dbg !1659

for.body163.i:                                    ; preds = %for.cond161.i
  %mul164.i = shl nuw nsw i32 %t.0.i, 2, !dbg !1660
  %arrayidx166.i = getelementptr inbounds nuw [16 x i8], ptr %tab.i, i32 0, i32 %mul164.i, !dbg !1662
  %89 = load i8, ptr %arrayidx166.i, align 1, !dbg !1662
  %conv.i = zext i8 %89 to i64, !dbg !1662
  %mul167.i = mul i64 %and151.i, %conv.i, !dbg !1663
  %mul168.i = shl nuw nsw i32 %t.0.i, 2, !dbg !1664
  %add169.i = or disjoint i32 %mul168.i, 1, !dbg !1665
  %arrayidx170.i = getelementptr inbounds nuw [16 x i8], ptr %tab.i, i32 0, i32 %add169.i, !dbg !1666
  %90 = load i8, ptr %arrayidx170.i, align 1, !dbg !1666
  %conv171.i = zext i8 %90 to i64, !dbg !1666
  %mul172.i = mul i64 %and154.i, %conv171.i, !dbg !1667
  %xor173.i = xor i64 %mul167.i, %mul172.i, !dbg !1668
  %mul174.i = shl nuw nsw i32 %t.0.i, 2, !dbg !1669
  %add175.i = or disjoint i32 %mul174.i, 2, !dbg !1670
  %arrayidx176.i = getelementptr inbounds nuw [16 x i8], ptr %tab.i, i32 0, i32 %add175.i, !dbg !1671
  %91 = load i8, ptr %arrayidx176.i, align 1, !dbg !1671
  %conv177.i = zext i8 %91 to i64, !dbg !1671
  %mul178.i = mul i64 %and157.i, %conv177.i, !dbg !1672
  %xor179.i = xor i64 %xor173.i, %mul178.i, !dbg !1673
  %mul180.i = shl nuw nsw i32 %t.0.i, 2, !dbg !1674
  %add181.i = or disjoint i32 %mul180.i, 3, !dbg !1675
  %arrayidx182.i = getelementptr inbounds nuw [16 x i8], ptr %tab.i, i32 0, i32 %add181.i, !dbg !1676
  %92 = load i8, ptr %arrayidx182.i, align 1, !dbg !1676
  %conv183.i = zext i8 %92 to i64, !dbg !1676
  %mul184.i = mul i64 %and160.i, %conv183.i, !dbg !1677
  %xor185.i = xor i64 %xor179.i, %mul184.i, !dbg !1678
  %add186.i = add nuw nsw i32 %r.0.i109, %t.0.i, !dbg !1679
  %sub187.i = add nsw i32 %add186.i, -78, !dbg !1680
  %div1882.i = lshr i32 %sub187.i, 4, !dbg !1681
  %mul189.i = mul i32 %div1882.i, 80, !dbg !1682
  %add190.i = add i32 %mul189.i, %c140.0.i, !dbg !1683
  %add191.i = add nuw nsw i32 %r.0.i109, %t.0.i, !dbg !1684
  %sub192.i = add nuw nsw i32 %add191.i, 2, !dbg !1685
  %rem193.i = and i32 %sub192.i, 15, !dbg !1686
  %add194.i = or disjoint i32 %add190.i, %rem193.i, !dbg !1687
  %arrayidx195.i = getelementptr inbounds nuw [800 x i64], ptr %A.i, i32 0, i32 %add194.i, !dbg !1688
  %93 = load i64, ptr %arrayidx195.i, align 8, !dbg !1689
  %xor196.i = xor i64 %93, %xor185.i, !dbg !1689
  store i64 %xor196.i, ptr %arrayidx195.i, align 8, !dbg !1689
  %inc198.i = add nuw nsw i32 %t.0.i, 1, !dbg !1690
    #dbg_value(i32 %inc198.i, !1652, !DIExpression(), !1654)
  br label %for.cond161.i, !dbg !1691, !llvm.loop !1692

for.inc200.i:                                     ; preds = %for.cond161.i
  %inc201.i = add nuw nsw i32 %r.0.i109, 1, !dbg !1694
    #dbg_value(i32 %inc201.i, !1627, !DIExpression(), !1628)
  br label %for.cond144.i, !dbg !1695, !llvm.loop !1696

for.inc203.i:                                     ; preds = %for.cond144.i
  %add204.i = add nuw nsw i32 %c140.0.i, 16, !dbg !1698
    #dbg_value(i32 %add204.i, !1617, !DIExpression(), !1618)
  br label %for.cond141.i, !dbg !1699, !llvm.loop !1700

for.cond207.i:                                    ; preds = %for.cond207.i.preheader, %for.inc241.i
  %indvars.iv148 = phi i32 [ 78, %for.cond207.i.preheader ], [ %indvars.iv.next149, %for.inc241.i ], !dbg !1702
  %r206.0.i = phi i32 [ %add242.i, %for.inc241.i ], [ 0, %for.cond207.i.preheader ], !dbg !1702
    #dbg_value(i32 %r206.0.i, !1703, !DIExpression(), !1704)
  %cmp208.i = icmp samesign ult i32 %r206.0.i, 78, !dbg !1705
  br i1 %cmp208.i, label %for.cond212.i.preheader, label %compute_A.exit, !dbg !1621

for.cond212.i.preheader:                          ; preds = %for.cond207.i
  br label %for.cond212.i, !dbg !1707

for.cond212.i:                                    ; preds = %for.cond212.i.preheader, %for.inc238.i
  %c211.0.i = phi i32 [ %add239.i, %for.inc238.i ], [ 0, %for.cond212.i.preheader ], !dbg !1710
    #dbg_value(i32 %c211.0.i, !1711, !DIExpression(), !1712)
  %cmp213.i = icmp samesign ult i32 %c211.0.i, 80, !dbg !1713
  br i1 %cmp213.i, label %for.cond217.i.preheader, label %for.inc241.i, !dbg !1707

for.cond217.i.preheader:                          ; preds = %for.cond212.i
  br label %for.cond217.i, !dbg !1715

for.cond217.i:                                    ; preds = %for.cond217.i.preheader, %decode.exit.i
  %i216.0.i = phi i32 [ %inc236.i, %decode.exit.i ], [ 0, %for.cond217.i.preheader ], !dbg !1718
    #dbg_value(i32 %i216.0.i, !1719, !DIExpression(), !1720)
  %exitcond150 = icmp ne i32 %i216.0.i, %indvars.iv148, !dbg !1721
  br i1 %exitcond150, label %for.body221.i, label %for.inc238.i, !dbg !1715

for.body221.i:                                    ; preds = %for.cond217.i
  %div223.i = mul nuw nsw i32 %r206.0.i, 5, !dbg !1723
  %add224.i = add nuw nsw i32 %div223.i, %c211.0.i, !dbg !1725
  %add225.i = add nuw nsw i32 %add224.i, %i216.0.i, !dbg !1726
  %arrayidx226.i = getelementptr inbounds nuw [800 x i64], ptr %A.i, i32 0, i32 %add225.i, !dbg !1727
  %add227.i = add nuw nsw i32 %r206.0.i, %i216.0.i, !dbg !1728
  %mul228.i = mul nuw nsw i32 %add227.i, 81, !dbg !1729
  %add.ptr229.i = getelementptr inbounds nuw i8, ptr %A, i32 %mul228.i, !dbg !1730
  %add.ptr230.i = getelementptr inbounds nuw i8, ptr %add.ptr229.i, i32 %c211.0.i, !dbg !1731
  %cmp232.i = icmp samesign ult i32 %c211.0.i, 64, !dbg !1732
  %sub234.i = sub nuw nsw i32 80, %c211.0.i, !dbg !1732
    #dbg_value(ptr %arrayidx226.i, !434, !DIExpression(), !1733)
    #dbg_value(ptr %add.ptr230.i, !440, !DIExpression(), !1733)
    #dbg_value(i32 poison, !441, !DIExpression(), !1733)
    #dbg_value(i32 0, !442, !DIExpression(), !1733)
  br label %for.cond.i.i103, !dbg !1735

for.cond.i.i103:                                  ; preds = %for.body.i.i106, %for.body221.i
  %mdec.addr.0.i.i = phi ptr [ %add.ptr230.i, %for.body221.i ], [ %incdec.ptr5.i.i, %for.body.i.i106 ]
  %i.0.i.i104 = phi i32 [ 0, %for.body221.i ], [ %inc.i.i108, %for.body.i.i106 ], !dbg !1736
    #dbg_value(i32 %i.0.i.i104, !442, !DIExpression(), !1733)
    #dbg_value(ptr %mdec.addr.0.i.i, !440, !DIExpression(), !1733)
  %94 = ashr exact i32 %sub234.i, 1, !dbg !1737
  %div.i.i = select i1 %cmp232.i, i32 8, i32 %94, !dbg !1732
  %cmp.i.i105 = icmp slt i32 %i.0.i.i104, %div.i.i, !dbg !1738
  br i1 %cmp.i.i105, label %for.body.i.i106, label %decode.exit.i, !dbg !1739

for.body.i.i106:                                  ; preds = %for.cond.i.i103
  %arrayidx.i.i107 = getelementptr inbounds nuw i8, ptr %arrayidx226.i, i32 %i.0.i.i104, !dbg !1740
  %95 = load i8, ptr %arrayidx.i.i107, align 1, !dbg !1740
  %96 = and i8 %95, 15, !dbg !1741
  %incdec.ptr.i.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i.i, i32 1, !dbg !1742
    #dbg_value(ptr %incdec.ptr.i.i, !440, !DIExpression(), !1733)
  store i8 %96, ptr %mdec.addr.0.i.i, align 1, !dbg !1743
  %97 = lshr i8 %95, 4, !dbg !1744
    #dbg_value(ptr %incdec.ptr.i.i, !440, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1733)
  store i8 %97, ptr %incdec.ptr.i.i, align 1, !dbg !1745
  %incdec.ptr5.i.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i.i, i32 2, !dbg !1746
    #dbg_value(ptr %incdec.ptr5.i.i, !440, !DIExpression(), !1733)
  %inc.i.i108 = add nuw nsw i32 %i.0.i.i104, 1, !dbg !1747
    #dbg_value(i32 %inc.i.i108, !442, !DIExpression(), !1733)
  br label %for.cond.i.i103, !dbg !1748, !llvm.loop !1749

decode.exit.i:                                    ; preds = %for.cond.i.i103
  %inc236.i = add nuw nsw i32 %i216.0.i, 1, !dbg !1751
    #dbg_value(i32 %inc236.i, !1719, !DIExpression(), !1720)
  br label %for.cond217.i, !dbg !1752, !llvm.loop !1753

for.inc238.i:                                     ; preds = %for.cond217.i
  %add239.i = add nuw nsw i32 %c211.0.i, 16, !dbg !1755
    #dbg_value(i32 %add239.i, !1711, !DIExpression(), !1712)
  br label %for.cond212.i, !dbg !1756, !llvm.loop !1757

for.inc241.i:                                     ; preds = %for.cond212.i
  %add242.i = add nuw nsw i32 %r206.0.i, 16, !dbg !1759
    #dbg_value(i32 %add242.i, !1703, !DIExpression(), !1704)
  %indvars.iv.next149 = add nsw i32 %indvars.iv148, -16, !dbg !1760
  br label %for.cond207.i, !dbg !1760, !llvm.loop !1761

compute_A.exit:                                   ; preds = %for.cond207.i
  call void @llvm.lifetime.end.p0(i64 6400, ptr nonnull %A.i), !dbg !1763
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %tab.i), !dbg !1763
    #dbg_value(i32 0, !1764, !DIExpression(), !1766)
  br label %for.cond52, !dbg !1767

for.cond52:                                       ; preds = %for.body55, %compute_A.exit
  %i51.0 = phi i32 [ 0, %compute_A.exit ], [ %inc58, %for.body55 ], !dbg !1768
    #dbg_value(i32 %i51.0, !1764, !DIExpression(), !1766)
  %exitcond151 = icmp ne i32 %i51.0, 78, !dbg !1769
  br i1 %exitcond151, label %for.body55, label %for.end59, !dbg !1771

for.body55:                                       ; preds = %for.cond52
  %98 = mul nuw nsw i32 %i51.0, 81, !dbg !1772
  %sub = add nuw nsw i32 %98, 80, !dbg !1774
  %arrayidx = getelementptr inbounds nuw [6480 x i8], ptr %A, i32 0, i32 %sub, !dbg !1775
  store i8 0, ptr %arrayidx, align 1, !dbg !1776
  %inc58 = add nuw nsw i32 %i51.0, 1, !dbg !1777
    #dbg_value(i32 %inc58, !1764, !DIExpression(), !1766)
  br label %for.cond52, !dbg !1778, !llvm.loop !1779

for.end59:                                        ; preds = %for.cond52
  %add.ptr61 = getelementptr inbounds nuw i8, ptr %V, i32 390, !dbg !1781
    #dbg_value(ptr %add.ptr61, !434, !DIExpression(), !1782)
    #dbg_value(ptr %r, !440, !DIExpression(), !1782)
    #dbg_value(i32 80, !441, !DIExpression(), !1782)
    #dbg_value(i32 0, !442, !DIExpression(), !1782)
  br label %for.cond.i6, !dbg !1784

for.cond.i6:                                      ; preds = %for.body.i9, %for.end59
  %mdec.addr.0.i = phi ptr [ %r, %for.end59 ], [ %incdec.ptr5.i, %for.body.i9 ]
  %i.0.i7 = phi i32 [ 0, %for.end59 ], [ %inc.i11, %for.body.i9 ], !dbg !1785
    #dbg_value(i32 %i.0.i7, !442, !DIExpression(), !1782)
    #dbg_value(ptr %mdec.addr.0.i, !440, !DIExpression(), !1782)
  %exitcond152 = icmp ne i32 %i.0.i7, 40, !dbg !1786
  br i1 %exitcond152, label %for.body.i9, label %decode.exit, !dbg !1787

for.body.i9:                                      ; preds = %for.cond.i6
  %arrayidx.i10 = getelementptr inbounds nuw i8, ptr %add.ptr61, i32 %i.0.i7, !dbg !1788
  %99 = load i8, ptr %arrayidx.i10, align 1, !dbg !1788
  %100 = and i8 %99, 15, !dbg !1789
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i, i32 1, !dbg !1790
    #dbg_value(ptr %incdec.ptr.i, !440, !DIExpression(), !1782)
  store i8 %100, ptr %mdec.addr.0.i, align 1, !dbg !1791
  %101 = lshr i8 %99, 4, !dbg !1792
    #dbg_value(ptr %incdec.ptr.i, !440, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1782)
  store i8 %101, ptr %incdec.ptr.i, align 1, !dbg !1793
  %incdec.ptr5.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i, i32 2, !dbg !1794
    #dbg_value(ptr %incdec.ptr5.i, !440, !DIExpression(), !1782)
  %inc.i11 = add nuw nsw i32 %i.0.i7, 1, !dbg !1795
    #dbg_value(i32 %inc.i11, !442, !DIExpression(), !1782)
  br label %for.cond.i6, !dbg !1796, !llvm.loop !1797

decode.exit:                                      ; preds = %for.cond.i6
  %call67 = call i32 @pqmayo_MAYO_1_ref_sample_solution(ptr noundef %p, ptr noundef nonnull %A, ptr noundef nonnull %y, ptr noundef nonnull %r, ptr noundef nonnull %x, i32 noundef 10, i32 noundef 8, i32 noundef 78, i32 noundef 81) #9, !dbg !1799
  %tobool.not = icmp eq i32 %call67, 0, !dbg !1799
  br i1 %tobool.not, label %if.else, label %for.end76, !dbg !1799

if.else:                                          ; preds = %decode.exit
  %call70 = call ptr @memset(ptr noundef nonnull %Mtmp, i32 noundef 0, i32 noundef 3200) #8, !dbg !1801
  %call72 = call ptr @memset(ptr noundef nonnull %A, i32 noundef 0, i32 noundef 6480) #8, !dbg !1803
  %inc75 = add nuw nsw i32 %ctr.0, 1, !dbg !1804
    #dbg_value(i32 %inc75, !986, !DIExpression(), !987)
  br label %for.cond, !dbg !1805, !llvm.loop !1806

for.end76:                                        ; preds = %decode.exit, %for.cond
    #dbg_value(i32 0, !1808, !DIExpression(), !1810)
  br label %for.cond78, !dbg !1811

for.cond78:                                       ; preds = %mat_add.exit, %for.end76
  %i77.0 = phi i32 [ 0, %for.end76 ], [ %inc103, %mat_add.exit ], !dbg !1812
    #dbg_value(i32 %i77.0, !1808, !DIExpression(), !1810)
  %exitcond157 = icmp ne i32 %i77.0, 10, !dbg !1813
  br i1 %exitcond157, label %for.body81, label %for.cond.i.preheader, !dbg !1815

for.cond.i.preheader:                             ; preds = %for.cond78
  br label %for.cond.i, !dbg !1816

for.body81:                                       ; preds = %for.cond78
  %mul83 = mul nuw nsw i32 %i77.0, 78, !dbg !1820
    #dbg_value(ptr %add.ptr84, !1822, !DIExpression(), !873)
  %O = getelementptr inbounds nuw i8, ptr %sk, i32 148200, !dbg !1823
  %mul87 = shl nuw nsw i32 %i77.0, 3, !dbg !1824
  %add.ptr88 = getelementptr inbounds nuw i8, ptr %x, i32 %mul87, !dbg !1825
    #dbg_value(ptr %O, !1826, !DIExpression(), !1830)
    #dbg_value(ptr %add.ptr88, !1832, !DIExpression(), !1830)
    #dbg_value(ptr %Ox, !1833, !DIExpression(), !1830)
    #dbg_value(i32 8, !1834, !DIExpression(), !1830)
    #dbg_value(i32 78, !1835, !DIExpression(), !1830)
    #dbg_value(i32 1, !1836, !DIExpression(), !1830)
    #dbg_value(i32 0, !1837, !DIExpression(), !1839)
  br label %for.cond.i88, !dbg !1840

for.cond.i88:                                     ; preds = %for.inc4.i, %for.body81
  %i.0.i89 = phi i32 [ 0, %for.body81 ], [ %inc5.i, %for.inc4.i ], !dbg !1841
  %c.addr.0.i = phi ptr [ %Ox, %for.body81 ], [ %c.addr.1.i.lcssa, %for.inc4.i ]
  %a.addr.0.i = phi ptr [ %O, %for.body81 ], [ %add.ptr6.i94, %for.inc4.i ]
    #dbg_value(ptr %a.addr.0.i, !1826, !DIExpression(), !1830)
    #dbg_value(ptr %c.addr.0.i, !1833, !DIExpression(), !1830)
    #dbg_value(i32 %i.0.i89, !1837, !DIExpression(), !1839)
  %exitcond155 = icmp ne i32 %i.0.i89, 78, !dbg !1842
  br i1 %exitcond155, label %for.cond1.i91.preheader, label %mat_mul.exit, !dbg !1844

for.cond1.i91.preheader:                          ; preds = %for.cond.i88
  br label %for.cond1.i91, !dbg !1845

for.cond1.i91:                                    ; preds = %for.cond1.i91.preheader, %lincomb.exit.i
  %c.addr.1.i = phi ptr [ %incdec.ptr.i98, %lincomb.exit.i ], [ %c.addr.0.i, %for.cond1.i91.preheader ]
  %j.0.i92 = phi i32 [ 1, %lincomb.exit.i ], [ 0, %for.cond1.i91.preheader ], !dbg !1848
    #dbg_value(i32 poison, !1849, !DIExpression(), !1850)
    #dbg_value(ptr %c.addr.1.i, !1833, !DIExpression(), !1830)
  %cmp2.i93 = icmp eq i32 %j.0.i92, 0, !dbg !1851
  br i1 %cmp2.i93, label %for.body3.i95, label %for.inc4.i, !dbg !1845

for.body3.i95:                                    ; preds = %for.cond1.i91
  %add.ptr.i96 = getelementptr inbounds nuw i8, ptr %add.ptr88, i32 %j.0.i92, !dbg !1853
    #dbg_value(ptr %a.addr.0.i, !1855, !DIExpression(), !1859)
    #dbg_value(ptr %add.ptr.i96, !1861, !DIExpression(), !1859)
    #dbg_value(i32 8, !1862, !DIExpression(), !1859)
    #dbg_value(i32 1, !1863, !DIExpression(), !1859)
    #dbg_value(i8 0, !1864, !DIExpression(), !1859)
    #dbg_value(i32 0, !1865, !DIExpression(), !1867)
  br label %for.cond.i.i, !dbg !1868

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body3.i95
  %ret.0.i.i = phi i8 [ 0, %for.body3.i95 ], [ %xor1.i.i.i, %for.body.i.i ], !dbg !1859
  %b.addr.0.i.i = phi ptr [ %add.ptr.i96, %for.body3.i95 ], [ %add.ptr.i.i, %for.body.i.i ]
  %i.0.i.i = phi i32 [ 0, %for.body3.i95 ], [ %inc.i.i, %for.body.i.i ], !dbg !1869
    #dbg_value(i32 %i.0.i.i, !1865, !DIExpression(), !1867)
    #dbg_value(ptr %b.addr.0.i.i, !1861, !DIExpression(), !1859)
    #dbg_value(i8 %ret.0.i.i, !1864, !DIExpression(), !1859)
  %exitcond154 = icmp ne i32 %i.0.i.i, 8, !dbg !1870
  br i1 %exitcond154, label %for.body.i.i, label %lincomb.exit.i, !dbg !1872

for.body.i.i:                                     ; preds = %for.cond.i.i
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %a.addr.0.i, i32 %i.0.i.i, !dbg !1873
  %102 = load i8, ptr %arrayidx.i.i, align 1, !dbg !1873
  %103 = load i8, ptr %b.addr.0.i.i, align 1, !dbg !1875
    #dbg_value(i8 %102, !1540, !DIExpression(), !1876)
    #dbg_value(i8 %103, !1546, !DIExpression(), !1876)
  %104 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !1878
  %xor1.i.i99 = xor i8 %102, %104, !dbg !1879
    #dbg_value(i8 %xor1.i.i99, !1540, !DIExpression(), !1876)
  %105 = trunc i8 %xor1.i.i99 to i1, !dbg !1880
    #dbg_value(i8 poison, !1549, !DIExpression(), !1876)
  %106 = and i8 %xor1.i.i99, 2, !dbg !1881
  %mul9.i.i = mul i8 %106, %103, !dbg !1882
  %conv10.i.i = select i1 %105, i8 %103, i8 0, !dbg !1880
  %xor11.i.i = xor i8 %conv10.i.i, %mul9.i.i, !dbg !1883
    #dbg_value(i8 %xor11.i.i, !1549, !DIExpression(), !1876)
  %107 = and i8 %xor1.i.i99, 4, !dbg !1884
  %mul16.i.i = mul i8 %107, %103, !dbg !1885
  %xor18.i.i = xor i8 %mul16.i.i, %xor11.i.i, !dbg !1886
    #dbg_value(i8 %xor18.i.i, !1549, !DIExpression(), !1876)
  %108 = and i8 %xor1.i.i99, 8, !dbg !1887
  %mul23.i.i = mul i8 %108, %103, !dbg !1888
  %xor25.i.i = xor i8 %mul23.i.i, %xor18.i.i, !dbg !1889
    #dbg_value(i8 %xor25.i.i, !1549, !DIExpression(), !1876)
    #dbg_value(i8 %xor25.i.i, !1551, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !1876)
  %109 = lshr i8 %xor25.i.i, 4, !dbg !1890
  %110 = lshr i8 %xor25.i.i, 3, !dbg !1891
  %111 = and i8 %110, 14, !dbg !1891
  %112 = xor i8 %109, %111, !dbg !1892
  %xor25.masked.i.i = and i8 %xor25.i.i, 15, !dbg !1893
  %113 = xor i8 %112, %xor25.masked.i.i, !dbg !1893
    #dbg_value(i8 %113, !1552, !DIExpression(), !1876)
    #dbg_value(i8 %113, !1894, !DIExpression(), !1896)
    #dbg_value(i8 %ret.0.i.i, !1898, !DIExpression(), !1896)
  %xor1.i.i.i = xor i8 %113, %ret.0.i.i, !dbg !1899
    #dbg_value(i8 %xor1.i.i.i, !1864, !DIExpression(), !1859)
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !1900
    #dbg_value(i32 %inc.i.i, !1865, !DIExpression(), !1867)
  %add.ptr.i.i = getelementptr inbounds nuw i8, ptr %b.addr.0.i.i, i32 1, !dbg !1901
    #dbg_value(ptr %add.ptr.i.i, !1861, !DIExpression(), !1859)
  br label %for.cond.i.i, !dbg !1902, !llvm.loop !1903

lincomb.exit.i:                                   ; preds = %for.cond.i.i
  %ret.0.i.i.lcssa = phi i8 [ %ret.0.i.i, %for.cond.i.i ], !dbg !1859
  store i8 %ret.0.i.i.lcssa, ptr %c.addr.1.i, align 1, !dbg !1905
    #dbg_value(i32 1, !1849, !DIExpression(), !1850)
  %incdec.ptr.i98 = getelementptr inbounds nuw i8, ptr %c.addr.1.i, i32 1, !dbg !1906
    #dbg_value(ptr %incdec.ptr.i98, !1833, !DIExpression(), !1830)
  br label %for.cond1.i91, !dbg !1907, !llvm.loop !1908

for.inc4.i:                                       ; preds = %for.cond1.i91
  %c.addr.1.i.lcssa = phi ptr [ %c.addr.1.i, %for.cond1.i91 ]
  %inc5.i = add nuw nsw i32 %i.0.i89, 1, !dbg !1910
    #dbg_value(i32 %inc5.i, !1837, !DIExpression(), !1839)
  %add.ptr6.i94 = getelementptr inbounds nuw i8, ptr %a.addr.0.i, i32 8, !dbg !1911
    #dbg_value(ptr %add.ptr6.i94, !1826, !DIExpression(), !1830)
  br label %for.cond.i88, !dbg !1912, !llvm.loop !1913

mat_mul.exit:                                     ; preds = %for.cond.i88
  %add.ptr84 = getelementptr inbounds nuw i8, ptr %Vdec, i32 %mul83, !dbg !1915
  %mul92 = mul nuw nsw i32 %i77.0, 86, !dbg !1916
  %add.ptr93 = getelementptr inbounds nuw i8, ptr %s, i32 %mul92, !dbg !1917
    #dbg_value(ptr %add.ptr84, !1918, !DIExpression(), !1922)
    #dbg_value(ptr %Ox, !1924, !DIExpression(), !1922)
    #dbg_value(ptr %add.ptr93, !1925, !DIExpression(), !1922)
    #dbg_value(i32 78, !1926, !DIExpression(), !1922)
    #dbg_value(i32 1, !1927, !DIExpression(), !1922)
    #dbg_value(i32 0, !1928, !DIExpression(), !1930)
  br label %for.cond.i1, !dbg !1931

for.cond.i1:                                      ; preds = %for.inc11.i, %mat_mul.exit
  %i.0.i2 = phi i32 [ 0, %mat_mul.exit ], [ %inc12.i, %for.inc11.i ], !dbg !1932
    #dbg_value(i32 %i.0.i2, !1928, !DIExpression(), !1930)
  %exitcond156 = icmp ne i32 %i.0.i2, 78, !dbg !1933
  br i1 %exitcond156, label %for.cond1.i.preheader, label %mat_add.exit, !dbg !1935

for.cond1.i.preheader:                            ; preds = %for.cond.i1
  br label %for.cond1.i, !dbg !1936

for.cond1.i:                                      ; preds = %for.cond1.i.preheader, %for.body3.i
  %j.0.i = phi i32 [ 1, %for.body3.i ], [ 0, %for.cond1.i.preheader ], !dbg !1939
    #dbg_value(i32 poison, !1940, !DIExpression(), !1941)
  %cmp2.i = icmp eq i32 %j.0.i, 0, !dbg !1942
  br i1 %cmp2.i, label %for.body3.i, label %for.inc11.i, !dbg !1936

for.body3.i:                                      ; preds = %for.cond1.i
  %add.ptr.i4 = getelementptr inbounds nuw i8, ptr %add.ptr84, i32 %i.0.i2, !dbg !1944
  %add.ptr4.i = getelementptr inbounds nuw i8, ptr %add.ptr.i4, i32 %j.0.i, !dbg !1946
  %114 = load i8, ptr %add.ptr4.i, align 1, !dbg !1947
  %add.ptr6.i = getelementptr inbounds nuw i8, ptr %Ox, i32 %i.0.i2, !dbg !1948
  %add.ptr7.i = getelementptr inbounds nuw i8, ptr %add.ptr6.i, i32 %j.0.i, !dbg !1949
  %115 = load i8, ptr %add.ptr7.i, align 1, !dbg !1950
    #dbg_value(i8 %114, !1894, !DIExpression(), !1951)
    #dbg_value(i8 %115, !1898, !DIExpression(), !1951)
  %xor1.i.i = xor i8 %114, %115, !dbg !1953
  %add.ptr9.i = getelementptr inbounds nuw i8, ptr %add.ptr93, i32 %i.0.i2, !dbg !1954
  %add.ptr10.i = getelementptr inbounds nuw i8, ptr %add.ptr9.i, i32 %j.0.i, !dbg !1955
  store i8 %xor1.i.i, ptr %add.ptr10.i, align 1, !dbg !1956
    #dbg_value(i32 1, !1940, !DIExpression(), !1941)
  br label %for.cond1.i, !dbg !1957, !llvm.loop !1958

for.inc11.i:                                      ; preds = %for.cond1.i
  %inc12.i = add nuw nsw i32 %i.0.i2, 1, !dbg !1960
    #dbg_value(i32 %inc12.i, !1928, !DIExpression(), !1930)
  br label %for.cond.i1, !dbg !1961, !llvm.loop !1962

mat_add.exit:                                     ; preds = %for.cond.i1
  %mul95 = mul nuw nsw i32 %i77.0, 86, !dbg !1964
  %add.ptr96 = getelementptr inbounds nuw i8, ptr %s, i32 %mul95, !dbg !1965
  %add.ptr97 = getelementptr inbounds nuw i8, ptr %add.ptr96, i32 78, !dbg !1966
  %mul99 = shl nuw nsw i32 %i77.0, 3, !dbg !1967
  %add.ptr100 = getelementptr inbounds nuw i8, ptr %x, i32 %mul99, !dbg !1968
  %call101 = call ptr @memcpy(ptr noundef nonnull %add.ptr97, ptr noundef nonnull %add.ptr100, i32 noundef 8) #8, !dbg !1969
  %inc103 = add nuw nsw i32 %i77.0, 1, !dbg !1970
    #dbg_value(i32 %inc103, !1808, !DIExpression(), !1810)
  br label %for.cond78, !dbg !1971, !llvm.loop !1972

for.cond.i:                                       ; preds = %for.cond.i.preheader, %for.body.i
  %i.0.i = phi i32 [ %inc.i, %for.body.i ], [ 0, %for.cond.i.preheader ], !dbg !1974
  %m.addr.0.i = phi ptr [ %add.ptr3.i, %for.body.i ], [ %s, %for.cond.i.preheader ]
    #dbg_value(ptr %m.addr.0.i, !1975, !DIExpression(), !1976)
    #dbg_value(i32 %i.0.i, !1977, !DIExpression(), !1976)
  %exitcond158 = icmp ne i32 %i.0.i, 430, !dbg !1978
  br i1 %exitcond158, label %for.body.i, label %encode.exit, !dbg !1816

for.body.i:                                       ; preds = %for.cond.i
  %116 = load i8, ptr %m.addr.0.i, align 1, !dbg !1980
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %m.addr.0.i, i32 1, !dbg !1982
  %117 = load i8, ptr %add.ptr.i, align 1, !dbg !1983
  %shl.i = shl i8 %117, 4, !dbg !1984
  %or.i = or i8 %shl.i, %116, !dbg !1985
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %sig, i32 %i.0.i, !dbg !1986
  store i8 %or.i, ptr %arrayidx.i, align 1, !dbg !1987
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !1988
    #dbg_value(i32 %inc.i, !1977, !DIExpression(), !1976)
  %add.ptr3.i = getelementptr inbounds nuw i8, ptr %m.addr.0.i, i32 2, !dbg !1989
    #dbg_value(ptr %add.ptr3.i, !1975, !DIExpression(), !1976)
  br label %for.cond.i, !dbg !1990, !llvm.loop !1991

encode.exit:                                      ; preds = %for.cond.i
  %add.ptr107 = getelementptr inbounds nuw i8, ptr %sig, i32 430, !dbg !1993
  %call109 = call ptr @memcpy(ptr noundef nonnull %add.ptr107, ptr noundef nonnull %salt, i32 noundef 24) #8, !dbg !1994
  store i32 454, ptr %siglen, align 4, !dbg !1995
  br label %err, !dbg !1996

err:                                              ; preds = %if.end, %entry, %encode.exit
  %ret.0 = phi i32 [ %call, %encode.exit ], [ %call, %entry ], [ 1, %if.end ], !dbg !873
    #dbg_value(i32 %ret.0, !879, !DIExpression(), !873)
    #dbg_label(!1997, !1998)
  call void @mayo_secure_clear(ptr noundef nonnull %V, i32 noundef 430) #8, !dbg !1999
  call void @mayo_secure_clear(ptr noundef nonnull %Vdec, i32 noundef 780) #8, !dbg !2000
  call void @mayo_secure_clear(ptr noundef nonnull %A, i32 noundef 6480) #8, !dbg !2001
  call void @mayo_secure_clear(ptr noundef nonnull %r, i32 noundef 81) #8, !dbg !2002
  %O114 = getelementptr inbounds nuw i8, ptr %sk, i32 148200, !dbg !2003
  call void @mayo_secure_clear(ptr noundef nonnull %O114, i32 noundef 624) #8, !dbg !2004
  call void @mayo_secure_clear(ptr noundef nonnull %sk, i32 noundef 148824) #8, !dbg !2005
  call void @mayo_secure_clear(ptr noundef nonnull %Ox, i32 noundef 78) #8, !dbg !2006
  call void @mayo_secure_clear(ptr noundef nonnull %tmp, i32 noundef 81) #8, !dbg !2007
  call void @mayo_secure_clear(ptr noundef nonnull %Mtmp, i32 noundef 3200) #8, !dbg !2008
  ret i32 %ret.0, !dbg !2009
}

; Function Attrs: nounwind
define internal fastcc void @compute_rhs(ptr noundef %p, ptr noundef %vPv, ptr noundef %t, ptr noundef %y) unnamed_addr #0 !dbg !2010 {
entry:
  %temp = alloca [5 x i64], align 8
    #dbg_value(ptr %p, !2013, !DIExpression(), !2014)
    #dbg_value(ptr %vPv, !2015, !DIExpression(), !2014)
    #dbg_value(ptr %t, !2016, !DIExpression(), !2014)
    #dbg_value(ptr %y, !2017, !DIExpression(), !2014)
    #dbg_value(i32 52, !2018, !DIExpression(), !2014)
    #dbg_value(i32 5, !2020, !DIExpression(), !2014)
    #dbg_value(i64 1, !2021, !DIExpression(), !2024)
    #dbg_value(i64 72057594037927936, !2021, !DIExpression(), !2024)
    #dbg_value(i64 72057594037927935, !2021, !DIExpression(), !2024)
    #dbg_value(i32 0, !2025, !DIExpression(), !2027)
  br label %for.cond, !dbg !2028

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2029
    #dbg_value(i32 %i.0, !2025, !DIExpression(), !2027)
  %exitcond = icmp ne i32 %i.0, 100, !dbg !2030
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2032

for.body:                                         ; preds = %for.cond
  %.idx6 = mul nuw nsw i32 %i.0, 40, !dbg !2033
  %0 = getelementptr inbounds nuw i8, ptr %vPv, i32 %.idx6, !dbg !2033
  %arrayidx = getelementptr inbounds nuw i8, ptr %0, i32 32, !dbg !2033
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2035
  %and = and i64 %1, 72057594037927935, !dbg !2035
  store i64 %and, ptr %arrayidx, align 8, !dbg !2035
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2036
    #dbg_value(i32 %inc, !2025, !DIExpression(), !2027)
  br label %for.cond, !dbg !2037, !llvm.loop !2038

for.end:                                          ; preds = %for.cond
    #dbg_declare(ptr %temp, !2040, !DIExpression(), !2041)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(40) %temp, i8 0, i32 40, i1 false), !dbg !2041
    #dbg_value(ptr %temp, !2042, !DIExpression(), !2014)
    #dbg_value(i32 9, !2043, !DIExpression(), !2045)
  br label %for.cond3, !dbg !2046

for.cond3:                                        ; preds = %for.inc77, %for.end
  %i2.0 = phi i32 [ 9, %for.end ], [ %dec78, %for.inc77 ], !dbg !2047
    #dbg_value(i32 %i2.0, !2043, !DIExpression(), !2045)
  %cmp4 = icmp sgt i32 %i2.0, -1, !dbg !2048
  br i1 %cmp4, label %for.cond6.preheader, label %for.cond81.preheader, !dbg !2050

for.cond6.preheader:                              ; preds = %for.cond3
  br label %for.cond6, !dbg !2051

for.cond81.preheader:                             ; preds = %for.cond3
  br label %for.cond81, !dbg !2054

for.cond6:                                        ; preds = %for.cond6.preheader, %for.inc74
  %j.0 = phi i32 [ %inc75, %for.inc74 ], [ %i2.0, %for.cond6.preheader ], !dbg !2056
    #dbg_value(i32 %j.0, !2057, !DIExpression(), !2058)
  %exitcond18 = icmp ne i32 %j.0, 10, !dbg !2059
  br i1 %exitcond18, label %for.body8, label %for.inc77, !dbg !2051

for.body8:                                        ; preds = %for.cond6
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %temp, i32 32, !dbg !2061
  %2 = load i64, ptr %arrayidx9, align 8, !dbg !2061
  %shr = lshr i64 %2, 52, !dbg !2063
  %3 = trunc i64 %shr to i8, !dbg !2064
    #dbg_value(i8 %conv, !2065, !DIExpression(), !2066)
  %arrayidx10 = getelementptr inbounds nuw i8, ptr %temp, i32 32, !dbg !2067
  %shl11 = shl i64 %2, 4, !dbg !2068
  store i64 %shl11, ptr %arrayidx10, align 8, !dbg !2068
    #dbg_value(i32 3, !2069, !DIExpression(), !2071)
  br label %for.cond12, !dbg !2072

for.cond12:                                       ; preds = %for.body15, %for.body8
  %k.0 = phi i32 [ 3, %for.body8 ], [ %dec, %for.body15 ], !dbg !2073
    #dbg_value(i32 %k.0, !2069, !DIExpression(), !2071)
  %cmp13 = icmp sgt i32 %k.0, -1, !dbg !2074
  br i1 %cmp13, label %for.body15, label %for.cond24.preheader, !dbg !2076

for.cond24.preheader:                             ; preds = %for.cond12
  %conv = and i8 %3, 15, !dbg !2064
  br label %for.cond24, !dbg !2077

for.body15:                                       ; preds = %for.cond12
  %arrayidx16 = getelementptr inbounds nuw [5 x i64], ptr %temp, i32 0, i32 %k.0, !dbg !2079
  %4 = load i64, ptr %arrayidx16, align 8, !dbg !2079
  %shr17 = lshr i64 %4, 60, !dbg !2081
  %add18 = add nuw nsw i32 %k.0, 1, !dbg !2082
  %arrayidx19 = getelementptr inbounds nuw [5 x i64], ptr %temp, i32 0, i32 %add18, !dbg !2083
  %5 = load i64, ptr %arrayidx19, align 8, !dbg !2084
  %xor = xor i64 %5, %shr17, !dbg !2084
  store i64 %xor, ptr %arrayidx19, align 8, !dbg !2084
  %arrayidx20 = getelementptr inbounds nuw [5 x i64], ptr %temp, i32 0, i32 %k.0, !dbg !2085
  %6 = load i64, ptr %arrayidx20, align 8, !dbg !2086
  %shl21 = shl i64 %6, 4, !dbg !2086
  store i64 %shl21, ptr %arrayidx20, align 8, !dbg !2086
  %dec = add nsw i32 %k.0, -1, !dbg !2087
    #dbg_value(i32 %dec, !2069, !DIExpression(), !2071)
  br label %for.cond12, !dbg !2088, !llvm.loop !2089

for.cond24:                                       ; preds = %for.cond24.preheader, %for.inc46
  %jj.0 = phi i32 [ %inc47, %for.inc46 ], [ 0, %for.cond24.preheader ], !dbg !2091
    #dbg_value(i32 %jj.0, !2092, !DIExpression(), !2093)
  %exitcond16 = icmp ne i32 %jj.0, 4, !dbg !2094
  br i1 %exitcond16, label %for.body27, label %for.cond50.preheader, !dbg !2077

for.cond50.preheader:                             ; preds = %for.cond24
  br label %for.cond50, !dbg !2096

for.body27:                                       ; preds = %for.cond24
  %rem28 = and i32 %jj.0, 1, !dbg !2098
  %cmp29 = icmp eq i32 %rem28, 0, !dbg !2101
  br i1 %cmp29, label %if.then, label %if.else, !dbg !2101

if.then:                                          ; preds = %for.body27
  %arrayidx31 = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %jj.0, !dbg !2102
  %7 = load i8, ptr %arrayidx31, align 1, !dbg !2102
    #dbg_value(i8 %conv, !1540, !DIExpression(), !2104)
    #dbg_value(i8 %7, !1546, !DIExpression(), !2104)
  %8 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !2106
  %xor1.i = xor i8 %conv, %8, !dbg !2107
    #dbg_value(i8 %xor1.i, !1540, !DIExpression(), !2104)
  %9 = trunc i8 %xor1.i to i1, !dbg !2108
    #dbg_value(i8 poison, !1549, !DIExpression(), !2104)
  %10 = and i8 %xor1.i, 2, !dbg !2109
  %mul9.i = mul i8 %10, %7, !dbg !2110
  %conv10.i = select i1 %9, i8 %7, i8 0, !dbg !2108
  %xor11.i = xor i8 %conv10.i, %mul9.i, !dbg !2111
    #dbg_value(i8 %xor11.i, !1549, !DIExpression(), !2104)
  %11 = and i8 %xor1.i, 4, !dbg !2112
  %mul16.i = mul i8 %11, %7, !dbg !2113
  %xor18.i = xor i8 %mul16.i, %xor11.i, !dbg !2114
    #dbg_value(i8 %xor18.i, !1549, !DIExpression(), !2104)
  %12 = and i8 %xor1.i, 8, !dbg !2115
  %mul23.i = mul i8 %12, %7, !dbg !2116
  %xor25.i = xor i8 %mul23.i, %xor18.i, !dbg !2117
    #dbg_value(i8 %xor25.i, !1549, !DIExpression(), !2104)
    #dbg_value(i8 %xor25.i, !1551, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !2104)
  %13 = lshr i8 %xor25.i, 4, !dbg !2118
  %14 = lshr i8 %xor25.i, 3, !dbg !2119
  %15 = and i8 %14, 14, !dbg !2119
  %16 = xor i8 %13, %15, !dbg !2120
  %xor25.masked.i = and i8 %xor25.i, 15, !dbg !2121
  %17 = xor i8 %16, %xor25.masked.i, !dbg !2121
    #dbg_value(i8 %17, !1552, !DIExpression(), !2104)
  %div = lshr exact i32 %jj.0, 1, !dbg !2122
  %arrayidx33 = getelementptr inbounds nuw i8, ptr %temp, i32 %div, !dbg !2123
  %18 = load i8, ptr %arrayidx33, align 1, !dbg !2124
  %xor355 = xor i8 %18, %17, !dbg !2124
  store i8 %xor355, ptr %arrayidx33, align 1, !dbg !2124
  br label %for.inc46, !dbg !2125

if.else:                                          ; preds = %for.body27
  %arrayidx37 = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %jj.0, !dbg !2126
  %19 = load i8, ptr %arrayidx37, align 1, !dbg !2126
    #dbg_value(i8 %conv, !1540, !DIExpression(), !2128)
    #dbg_value(i8 %19, !1546, !DIExpression(), !2128)
  %20 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !2130
  %xor1.i7 = xor i8 %conv, %20, !dbg !2131
    #dbg_value(i8 %xor1.i7, !1540, !DIExpression(), !2128)
  %21 = trunc i8 %xor1.i7 to i1, !dbg !2132
    #dbg_value(i8 poison, !1549, !DIExpression(), !2128)
  %22 = and i8 %xor1.i7, 2, !dbg !2133
  %mul9.i8 = mul i8 %22, %19, !dbg !2134
  %conv10.i9 = select i1 %21, i8 %19, i8 0, !dbg !2132
  %xor11.i10 = xor i8 %conv10.i9, %mul9.i8, !dbg !2135
    #dbg_value(i8 %xor11.i10, !1549, !DIExpression(), !2128)
  %23 = and i8 %xor1.i7, 4, !dbg !2136
  %mul16.i11 = mul i8 %23, %19, !dbg !2137
  %xor18.i12 = xor i8 %mul16.i11, %xor11.i10, !dbg !2138
    #dbg_value(i8 %xor18.i12, !1549, !DIExpression(), !2128)
  %24 = and i8 %xor1.i7, 8, !dbg !2139
  %mul23.i13 = mul i8 %24, %19, !dbg !2140
  %xor25.i14 = xor i8 %mul23.i13, %xor18.i12, !dbg !2141
    #dbg_value(i8 %xor25.i14, !1549, !DIExpression(), !2128)
    #dbg_value(i8 %xor25.i14, !1551, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !2128)
  %25 = lshr i8 %xor25.i14, 4, !dbg !2142
  %26 = lshr i8 %xor25.i14, 3, !dbg !2143
  %27 = and i8 %26, 14, !dbg !2143
  %28 = xor i8 %25, %27, !dbg !2144
  %xor25.masked.i15 = and i8 %xor25.i14, 15, !dbg !2145
  %29 = xor i8 %28, %xor25.masked.i15, !dbg !2145
    #dbg_value(i8 %29, !1552, !DIExpression(), !2128)
  %shl40 = shl nuw i8 %29, 4, !dbg !2146
  %div414 = lshr i32 %jj.0, 1, !dbg !2147
  %arrayidx42 = getelementptr inbounds nuw i8, ptr %temp, i32 %div414, !dbg !2148
  %30 = load i8, ptr %arrayidx42, align 1, !dbg !2149
  %xor44 = xor i8 %shl40, %30, !dbg !2149
  store i8 %xor44, ptr %arrayidx42, align 1, !dbg !2149
  br label %for.inc46

for.inc46:                                        ; preds = %if.then, %if.else
  %inc47 = add nuw nsw i32 %jj.0, 1, !dbg !2150
    #dbg_value(i32 %inc47, !2092, !DIExpression(), !2093)
  br label %for.cond24, !dbg !2151, !llvm.loop !2152

for.cond50:                                       ; preds = %for.cond50.preheader, %for.body53
  %k49.0 = phi i32 [ %inc72, %for.body53 ], [ 0, %for.cond50.preheader ], !dbg !2154
    #dbg_value(i32 %k49.0, !2155, !DIExpression(), !2156)
  %exitcond17 = icmp ne i32 %k49.0, 5, !dbg !2157
  br i1 %exitcond17, label %for.body53, label %for.inc74, !dbg !2096

for.body53:                                       ; preds = %for.cond50
  %mul54 = mul nuw nsw i32 %i2.0, 10, !dbg !2159
  %add55 = add nuw nsw i32 %mul54, %j.0, !dbg !2161
  %.idx = mul nsw i32 %add55, 40, !dbg !2162
  %31 = getelementptr i8, ptr %vPv, i32 %.idx, !dbg !2162
  %arrayidx58 = getelementptr i64, ptr %31, i32 %k49.0, !dbg !2162
  %32 = load i64, ptr %arrayidx58, align 8, !dbg !2162
  %cmp59.not = icmp eq i32 %i2.0, %j.0, !dbg !2163
  %mul62 = mul nuw nsw i32 %j.0, 10, !dbg !2164
  %add63 = add nuw nsw i32 %mul62, %i2.0, !dbg !2165
  %.idx3 = mul nsw i32 %add63, 40, !dbg !2166
  %33 = getelementptr i8, ptr %vPv, i32 %.idx3, !dbg !2166
  %arrayidx66 = getelementptr i64, ptr %33, i32 %k49.0, !dbg !2166
  %34 = load i64, ptr %arrayidx66, align 8, !dbg !2166
  %mul67 = select i1 %cmp59.not, i64 0, i64 %34, !dbg !2167
  %xor68 = xor i64 %32, %mul67, !dbg !2168
  %arrayidx69 = getelementptr inbounds nuw [5 x i64], ptr %temp, i32 0, i32 %k49.0, !dbg !2169
  %35 = load i64, ptr %arrayidx69, align 8, !dbg !2170
  %xor70 = xor i64 %35, %xor68, !dbg !2170
  store i64 %xor70, ptr %arrayidx69, align 8, !dbg !2170
  %inc72 = add nuw nsw i32 %k49.0, 1, !dbg !2171
    #dbg_value(i32 %inc72, !2155, !DIExpression(), !2156)
  br label %for.cond50, !dbg !2172, !llvm.loop !2173

for.inc74:                                        ; preds = %for.cond50
  %inc75 = add nuw nsw i32 %j.0, 1, !dbg !2175
    #dbg_value(i32 %inc75, !2057, !DIExpression(), !2058)
  br label %for.cond6, !dbg !2176, !llvm.loop !2177

for.inc77:                                        ; preds = %for.cond6
  %dec78 = add nsw i32 %i2.0, -1, !dbg !2179
    #dbg_value(i32 %dec78, !2043, !DIExpression(), !2045)
  br label %for.cond3, !dbg !2180, !llvm.loop !2181

for.cond81:                                       ; preds = %for.cond81.preheader, %for.body84
  %i80.0 = phi i32 [ %add106, %for.body84 ], [ 0, %for.cond81.preheader ], !dbg !2183
    #dbg_value(i32 %i80.0, !2184, !DIExpression(), !2185)
  %cmp82 = icmp samesign ult i32 %i80.0, 78, !dbg !2186
  br i1 %cmp82, label %for.body84, label %for.end107, !dbg !2054

for.body84:                                       ; preds = %for.cond81
  %arrayidx85 = getelementptr inbounds nuw i8, ptr %t, i32 %i80.0, !dbg !2188
  %36 = load i8, ptr %arrayidx85, align 1, !dbg !2188
  %div87 = lshr exact i32 %i80.0, 1, !dbg !2190
  %arrayidx88 = getelementptr inbounds nuw i8, ptr %temp, i32 %div87, !dbg !2191
  %37 = load i8, ptr %arrayidx88, align 1, !dbg !2191
  %38 = and i8 %37, 15, !dbg !2192
  %xor911 = xor i8 %36, %38, !dbg !2193
  %arrayidx93 = getelementptr inbounds nuw i8, ptr %y, i32 %i80.0, !dbg !2194
  store i8 %xor911, ptr %arrayidx93, align 1, !dbg !2195
  %add94 = or disjoint i32 %i80.0, 1, !dbg !2196
  %arrayidx95 = getelementptr inbounds nuw i8, ptr %t, i32 %add94, !dbg !2197
  %39 = load i8, ptr %arrayidx95, align 1, !dbg !2197
  %div97 = lshr exact i32 %i80.0, 1, !dbg !2198
  %arrayidx98 = getelementptr inbounds nuw i8, ptr %temp, i32 %div97, !dbg !2199
  %40 = load i8, ptr %arrayidx98, align 1, !dbg !2199
  %41 = lshr i8 %40, 4, !dbg !2200
  %xor1012 = xor i8 %39, %41, !dbg !2201
  %add103 = or disjoint i32 %i80.0, 1, !dbg !2202
  %arrayidx104 = getelementptr inbounds nuw i8, ptr %y, i32 %add103, !dbg !2203
  store i8 %xor1012, ptr %arrayidx104, align 1, !dbg !2204
  %add106 = add nuw nsw i32 %i80.0, 2, !dbg !2205
    #dbg_value(i32 %add106, !2184, !DIExpression(), !2185)
  br label %for.cond81, !dbg !2206, !llvm.loop !2207

for.end107:                                       ; preds = %for.cond81
  ret void, !dbg !2209
}

declare dso_local ptr @memset(ptr noundef, i32 noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: nounwind
define dso_local i32 @pqmayo_MAYO_1_ref_mayo_sign(ptr noundef %p, ptr noundef %sm, ptr noundef %smlen, ptr noundef %m, i32 noundef %mlen, ptr noundef %csk) local_unnamed_addr #0 !dbg !2210 {
entry:
  %siglen = alloca i32, align 4
    #dbg_value(ptr %p, !2211, !DIExpression(), !2212)
    #dbg_value(ptr %sm, !2213, !DIExpression(), !2212)
    #dbg_value(ptr %smlen, !2214, !DIExpression(), !2212)
    #dbg_value(ptr %m, !2215, !DIExpression(), !2212)
    #dbg_value(i32 %mlen, !2216, !DIExpression(), !2212)
    #dbg_value(ptr %csk, !2217, !DIExpression(), !2212)
    #dbg_value(i32 0, !2218, !DIExpression(), !2212)
    #dbg_value(i32 454, !2219, !DIExpression(), !2212)
  %add.ptr = getelementptr inbounds nuw i8, ptr %sm, i32 454, !dbg !2220
  %call = call ptr @memmove(ptr noundef nonnull %add.ptr, ptr noundef %m, i32 noundef %mlen) #8, !dbg !2221
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %sm, i32 454, !dbg !2222
    #dbg_value(ptr %siglen, !2223, !DIExpression(DW_OP_deref), !2212)
  %call2 = call i32 @pqmayo_MAYO_1_ref_mayo_sign_signature(ptr noundef %p, ptr noundef %sm, ptr noundef nonnull %siglen, ptr noundef nonnull %add.ptr1, i32 noundef %mlen, ptr noundef %csk) #9, !dbg !2224
    #dbg_value(i32 %call2, !2218, !DIExpression(), !2212)
  %cmp.not = icmp eq i32 %call2, 0, !dbg !2225
  %0 = load i32, ptr %siglen, align 4
    #dbg_value(i32 %0, !2223, !DIExpression(), !2212)
  %cmp3.not = icmp eq i32 %0, 454
  %or.cond = select i1 %cmp.not, i1 %cmp3.not, i1 false, !dbg !2227
  br i1 %or.cond, label %if.end, label %if.then, !dbg !2227

if.then:                                          ; preds = %entry
  %1 = load i32, ptr %siglen, align 4, !dbg !2228
    #dbg_value(i32 %1, !2223, !DIExpression(), !2212)
  %add = add i32 %1, %mlen, !dbg !2230
  %call4 = call ptr @memset(ptr noundef %sm, i32 noundef 0, i32 noundef %add) #8, !dbg !2231
  br label %err, !dbg !2232

if.end:                                           ; preds = %entry
  %2 = load i32, ptr %siglen, align 4, !dbg !2233
    #dbg_value(i32 %2, !2223, !DIExpression(), !2212)
  %add5 = add i32 %2, %mlen, !dbg !2234
  store i32 %add5, ptr %smlen, align 4, !dbg !2235
  br label %err, !dbg !2236

err:                                              ; preds = %if.end, %if.then
    #dbg_label(!2237, !2238)
  ret i32 %call2, !dbg !2239
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_1_ref_mayo_open(ptr noundef %p, ptr noundef %m, ptr noundef %mlen, ptr noundef %sm, i32 noundef %smlen, ptr noundef %pk) local_unnamed_addr #0 !dbg !338 {
entry:
    #dbg_value(ptr %p, !337, !DIExpression(), !2240)
    #dbg_value(ptr %m, !344, !DIExpression(), !2240)
    #dbg_value(ptr %mlen, !345, !DIExpression(), !2240)
    #dbg_value(ptr %sm, !346, !DIExpression(), !2240)
    #dbg_value(i32 %smlen, !347, !DIExpression(), !2240)
    #dbg_value(ptr %pk, !348, !DIExpression(), !2240)
    #dbg_value(i32 454, !349, !DIExpression(), !2240)
  %cmp = icmp ult i32 %smlen, 454, !dbg !2241
  br i1 %cmp, label %return, label %if.end, !dbg !2241

if.end:                                           ; preds = %entry
  %add.ptr = getelementptr inbounds nuw i8, ptr %sm, i32 454, !dbg !2242
  %sub = add i32 %smlen, -454, !dbg !2243
  %call = call i32 @pqmayo_MAYO_1_ref_mayo_verify(ptr noundef %p, ptr noundef nonnull %add.ptr, i32 noundef %sub, ptr noundef %sm, ptr noundef %pk) #9, !dbg !2244
    #dbg_value(i32 %call, !355, !DIExpression(), !2240)
  %cmp1 = icmp eq i32 %call, 0, !dbg !2245
  br i1 %cmp1, label %if.then2, label %return, !dbg !2245

if.then2:                                         ; preds = %if.end
  %sub3 = add i32 %smlen, -454, !dbg !2246
  store i32 %sub3, ptr %mlen, align 4, !dbg !2247
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sm, i32 454, !dbg !2248
  %call5 = call ptr @memmove(ptr noundef %m, ptr noundef nonnull %add.ptr4, i32 noundef %sub3) #8, !dbg !2249
  br label %return, !dbg !2250

return:                                           ; preds = %if.end, %if.then2, %entry
  %retval.0 = phi i32 [ 1, %entry ], [ 0, %if.then2 ], [ 1, %if.end ], !dbg !2240
  ret i32 %retval.0, !dbg !2251
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_1_ref_mayo_verify(ptr noundef %p, ptr noundef %m, i32 noundef %mlen, ptr noundef %sig, ptr noundef %cpk) local_unnamed_addr #0 !dbg !2252 {
entry:
  %accumulator.i39 = alloca [68800 x i64], align 8
  %accumulator.i = alloca [8000 x i64], align 8
  %tmp.i2 = alloca [5 x i64], align 8
  %tmp.i = alloca [5 x i64], align 8
  %PS.i.i = alloca [4300 x i64], align 8
  %SPS.i = alloca [500 x i64], align 8
  %zero.i = alloca [78 x i8], align 1
  %tEnc = alloca [39 x i8], align 1
  %t = alloca [78 x i8], align 1
  %y = alloca [156 x i8], align 1
  %s = alloca [860 x i8], align 1
  %pk = alloca [18705 x i64], align 8
  %tmp = alloca [56 x i8], align 1
    #dbg_value(ptr %p, !2255, !DIExpression(), !2256)
    #dbg_value(ptr %m, !2257, !DIExpression(), !2256)
    #dbg_value(i32 %mlen, !2258, !DIExpression(), !2256)
    #dbg_value(ptr %sig, !2259, !DIExpression(), !2256)
    #dbg_value(ptr %cpk, !2260, !DIExpression(), !2256)
    #dbg_declare(ptr %tEnc, !2261, !DIExpression(), !2262)
    #dbg_declare(ptr %t, !2263, !DIExpression(), !2264)
    #dbg_declare(ptr %y, !2265, !DIExpression(), !2269)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(156) %y, i8 0, i32 156, i1 false), !dbg !2269
    #dbg_declare(ptr %s, !2270, !DIExpression(), !2271)
    #dbg_declare(ptr %pk, !2272, !DIExpression(), !2276)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(149640) %pk, i8 0, i32 149640, i1 false), !dbg !2276
    #dbg_declare(ptr %tmp, !2277, !DIExpression(), !2281)
    #dbg_value(i32 78, !2282, !DIExpression(), !2256)
    #dbg_value(i32 86, !2283, !DIExpression(), !2256)
    #dbg_value(i32 10, !2284, !DIExpression(), !2256)
    #dbg_value(i32 39, !2285, !DIExpression(), !2256)
    #dbg_value(i32 454, !2286, !DIExpression(), !2256)
    #dbg_value(i32 32, !2287, !DIExpression(), !2256)
    #dbg_value(i32 24, !2288, !DIExpression(), !2256)
    #dbg_value(ptr %p, !247, !DIExpression(), !2289)
    #dbg_value(ptr %cpk, !253, !DIExpression(), !2289)
    #dbg_value(ptr %pk, !254, !DIExpression(), !2289)
    #dbg_value(ptr %p, !255, !DIExpression(), !2291)
    #dbg_value(ptr %pk, !261, !DIExpression(), !2291)
    #dbg_value(ptr %cpk, !262, !DIExpression(), !2291)
  %call.i.i = call i32 @AES_128_CTR(ptr noundef nonnull %pk, i32 noundef 144495, ptr noundef %cpk, i32 noundef 16) #8, !dbg !2293
  call void @llvm.lifetime.start.p0(i64 40, ptr nonnull %tmp.i2), !dbg !2294
    #dbg_value(ptr %pk, !269, !DIExpression(), !2296)
    #dbg_value(ptr %pk, !271, !DIExpression(), !2296)
    #dbg_value(i32 3705, !272, !DIExpression(), !2296)
    #dbg_value(i32 78, !273, !DIExpression(), !2296)
    #dbg_value(i32 5, !274, !DIExpression(), !2296)
    #dbg_value(ptr %pk, !276, !DIExpression(), !2296)
    #dbg_declare(ptr %tmp.i2, !277, !DIExpression(), !2294)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(40) %tmp.i2, i8 0, i32 40, i1 false), !dbg !2294
    #dbg_value(i32 3705, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2297)
  br label %for.cond.i3, !dbg !2298

for.cond.i3:                                      ; preds = %for.body.i7, %entry
  %i.0.in.i4 = phi i32 [ 3705, %entry ], [ %i.0.i5, %for.body.i7 ]
    #dbg_value(i32 %i.0.in.i4, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2297)
  %cmp.i6 = icmp ugt i32 %i.0.in.i4, 0, !dbg !2299
  br i1 %cmp.i6, label %for.body.i7, label %unpack_m_vecs.exit16, !dbg !2300

for.body.i7:                                      ; preds = %for.cond.i3
  %i.0.i5 = add nsw i32 %i.0.in.i4, -1, !dbg !2301
    #dbg_value(i32 %i.0.i5, !281, !DIExpression(), !2297)
  %mul.i8 = mul nsw i32 %i.0.i5, 78, !dbg !2302
  %div1.i96568 = lshr exact i32 %mul.i8, 1, !dbg !2303
  %add.ptr.i10 = getelementptr inbounds nuw i8, ptr %pk, i32 %div1.i96568, !dbg !2304
  %call.i11 = call ptr @memcpy(ptr noundef nonnull %tmp.i2, ptr noundef nonnull %add.ptr.i10, i32 noundef 39) #8, !dbg !2305
  %mul4.i13 = mul nsw i32 %i.0.i5, 40, !dbg !2306
  %add.ptr5.i14 = getelementptr inbounds nuw i8, ptr %pk, i32 %mul4.i13, !dbg !2307
  %call8.i15 = call ptr @memcpy(ptr noundef nonnull %add.ptr5.i14, ptr noundef nonnull %tmp.i2, i32 noundef 40) #8, !dbg !2308
    #dbg_value(i32 %i.0.i5, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2297)
  br label %for.cond.i3, !dbg !2309, !llvm.loop !2310

unpack_m_vecs.exit16:                             ; preds = %for.cond.i3
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %tmp.i2), !dbg !2312
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %cpk, i32 16, !dbg !2313
  %add.ptr2.i = getelementptr inbounds nuw i8, ptr %pk, i32 148200, !dbg !2314
  call void @llvm.lifetime.start.p0(i64 40, ptr nonnull %tmp.i), !dbg !2315
    #dbg_value(ptr %add.ptr.i, !269, !DIExpression(), !2317)
    #dbg_value(ptr %add.ptr2.i, !271, !DIExpression(), !2317)
    #dbg_value(i32 36, !272, !DIExpression(), !2317)
    #dbg_value(i32 78, !273, !DIExpression(), !2317)
    #dbg_value(i32 5, !274, !DIExpression(), !2317)
    #dbg_value(ptr %add.ptr2.i, !276, !DIExpression(), !2317)
    #dbg_declare(ptr %tmp.i, !277, !DIExpression(), !2315)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(40) %tmp.i, i8 0, i32 40, i1 false), !dbg !2315
    #dbg_value(i32 36, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2318)
  br label %for.cond.i, !dbg !2319

for.cond.i:                                       ; preds = %for.body.i, %unpack_m_vecs.exit16
  %i.0.in.i = phi i32 [ 36, %unpack_m_vecs.exit16 ], [ %i.0.i, %for.body.i ]
    #dbg_value(i32 %i.0.in.i, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2318)
  %cmp.i = icmp ugt i32 %i.0.in.i, 0, !dbg !2320
  br i1 %cmp.i, label %for.body.i, label %unpack_m_vecs.exit, !dbg !2321

for.body.i:                                       ; preds = %for.cond.i
  %i.0.i = add nsw i32 %i.0.in.i, -1, !dbg !2322
    #dbg_value(i32 %i.0.i, !281, !DIExpression(), !2318)
  %mul.i = mul nsw i32 %i.0.i, 78, !dbg !2323
  %div1.i6667 = lshr exact i32 %mul.i, 1, !dbg !2324
  %add.ptr.i1 = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 %div1.i6667, !dbg !2325
  %call.i = call ptr @memcpy(ptr noundef nonnull %tmp.i, ptr noundef nonnull %add.ptr.i1, i32 noundef 39) #8, !dbg !2326
  %mul4.i = mul nsw i32 %i.0.i, 40, !dbg !2327
  %add.ptr5.i = getelementptr inbounds nuw i8, ptr %add.ptr2.i, i32 %mul4.i, !dbg !2328
  %call8.i = call ptr @memcpy(ptr noundef nonnull %add.ptr5.i, ptr noundef nonnull %tmp.i, i32 noundef 40) #8, !dbg !2329
    #dbg_value(i32 %i.0.i, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2318)
  br label %for.cond.i, !dbg !2330, !llvm.loop !2331

unpack_m_vecs.exit:                               ; preds = %for.cond.i
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %tmp.i), !dbg !2333
    #dbg_value(i32 0, !2334, !DIExpression(), !2256)
    #dbg_value(ptr %pk, !2335, !DIExpression(), !2256)
  %add.ptr = getelementptr inbounds nuw i8, ptr %pk, i32 123240, !dbg !2336
    #dbg_value(ptr %add.ptr, !2337, !DIExpression(), !2256)
    #dbg_value(ptr %add.ptr2, !2338, !DIExpression(), !2256)
  %call4 = call i32 @shake256(ptr noundef nonnull %tmp, i32 noundef 32, ptr noundef %m, i32 noundef %mlen) #8, !dbg !2339
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %tmp, i32 32, !dbg !2340
  %add.ptr8 = getelementptr inbounds nuw i8, ptr %sig, i32 430, !dbg !2341
  %call9 = call ptr @memcpy(ptr noundef nonnull %add.ptr6, ptr noundef nonnull %add.ptr8, i32 noundef 24) #8, !dbg !2342
  %call12 = call i32 @shake256(ptr noundef nonnull %tEnc, i32 noundef 39, ptr noundef nonnull %tmp, i32 noundef 56) #8, !dbg !2343
    #dbg_value(ptr %tEnc, !434, !DIExpression(), !2344)
    #dbg_value(ptr %t, !440, !DIExpression(), !2344)
    #dbg_value(i32 78, !441, !DIExpression(), !2344)
    #dbg_value(i32 0, !442, !DIExpression(), !2344)
  br label %for.cond.i17, !dbg !2346

for.cond.i17:                                     ; preds = %for.body.i20, %unpack_m_vecs.exit
  %mdec.addr.0.i = phi ptr [ %t, %unpack_m_vecs.exit ], [ %incdec.ptr5.i, %for.body.i20 ]
  %i.0.i18 = phi i32 [ 0, %unpack_m_vecs.exit ], [ %inc.i, %for.body.i20 ], !dbg !2347
    #dbg_value(i32 %i.0.i18, !442, !DIExpression(), !2344)
    #dbg_value(ptr %mdec.addr.0.i, !440, !DIExpression(), !2344)
  %exitcond = icmp ne i32 %i.0.i18, 39, !dbg !2348
  br i1 %exitcond, label %for.body.i20, label %for.cond.i21.preheader, !dbg !2349

for.cond.i21.preheader:                           ; preds = %for.cond.i17
  br label %for.cond.i21, !dbg !2350

for.body.i20:                                     ; preds = %for.cond.i17
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %tEnc, i32 %i.0.i18, !dbg !2352
  %0 = load i8, ptr %arrayidx.i, align 1, !dbg !2352
  %1 = and i8 %0, 15, !dbg !2353
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i, i32 1, !dbg !2354
    #dbg_value(ptr %incdec.ptr.i, !440, !DIExpression(), !2344)
  store i8 %1, ptr %mdec.addr.0.i, align 1, !dbg !2355
  %2 = lshr i8 %0, 4, !dbg !2356
    #dbg_value(ptr %incdec.ptr.i, !440, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2344)
  store i8 %2, ptr %incdec.ptr.i, align 1, !dbg !2357
  %incdec.ptr5.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i, i32 2, !dbg !2358
    #dbg_value(ptr %incdec.ptr5.i, !440, !DIExpression(), !2344)
  %inc.i = add nuw nsw i32 %i.0.i18, 1, !dbg !2359
    #dbg_value(i32 %inc.i, !442, !DIExpression(), !2344)
  br label %for.cond.i17, !dbg !2360, !llvm.loop !2361

for.cond.i21:                                     ; preds = %for.cond.i21.preheader, %for.body.i25
  %mdec.addr.0.i22 = phi ptr [ %incdec.ptr5.i29, %for.body.i25 ], [ %s, %for.cond.i21.preheader ]
  %i.0.i23 = phi i32 [ %inc.i30, %for.body.i25 ], [ 0, %for.cond.i21.preheader ], !dbg !2363
    #dbg_value(i32 %i.0.i23, !442, !DIExpression(), !2364)
    #dbg_value(ptr %mdec.addr.0.i22, !440, !DIExpression(), !2364)
  %exitcond69 = icmp ne i32 %i.0.i23, 430, !dbg !2365
  br i1 %exitcond69, label %for.body.i25, label %decode.exit31, !dbg !2350

for.body.i25:                                     ; preds = %for.cond.i21
  %arrayidx.i26 = getelementptr inbounds nuw i8, ptr %sig, i32 %i.0.i23, !dbg !2366
  %3 = load i8, ptr %arrayidx.i26, align 1, !dbg !2366
  %4 = and i8 %3, 15, !dbg !2367
  %incdec.ptr.i27 = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i22, i32 1, !dbg !2368
    #dbg_value(ptr %incdec.ptr.i27, !440, !DIExpression(), !2364)
  store i8 %4, ptr %mdec.addr.0.i22, align 1, !dbg !2369
  %5 = lshr i8 %3, 4, !dbg !2370
    #dbg_value(ptr %incdec.ptr.i27, !440, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2364)
  store i8 %5, ptr %incdec.ptr.i27, align 1, !dbg !2371
  %incdec.ptr5.i29 = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i22, i32 2, !dbg !2372
    #dbg_value(ptr %incdec.ptr5.i29, !440, !DIExpression(), !2364)
  %inc.i30 = add nuw nsw i32 %i.0.i23, 1, !dbg !2373
    #dbg_value(i32 %inc.i30, !442, !DIExpression(), !2364)
  br label %for.cond.i21, !dbg !2374, !llvm.loop !2375

decode.exit31:                                    ; preds = %for.cond.i21
  call void @llvm.lifetime.start.p0(i64 4000, ptr nonnull %SPS.i), !dbg !2377
  call void @llvm.lifetime.start.p0(i64 78, ptr nonnull %zero.i), !dbg !2377
    #dbg_value(ptr %p, !2382, !DIExpression(), !2383)
    #dbg_value(ptr %s, !2384, !DIExpression(), !2383)
    #dbg_value(ptr %pk, !2385, !DIExpression(), !2383)
    #dbg_value(ptr %add.ptr, !2386, !DIExpression(), !2383)
    #dbg_value(ptr %add.ptr2, !2387, !DIExpression(), !2383)
    #dbg_value(ptr %y, !2388, !DIExpression(), !2383)
    #dbg_declare(ptr %SPS.i, !2389, !DIExpression(), !2377)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(4000) %SPS.i, i8 0, i32 4000, i1 false), !dbg !2377
  call void @llvm.lifetime.start.p0(i64 34400, ptr nonnull %PS.i.i), !dbg !2393
    #dbg_value(ptr %p, !2398, !DIExpression(), !2399)
    #dbg_value(ptr %pk, !2400, !DIExpression(), !2399)
    #dbg_value(ptr %add.ptr, !2401, !DIExpression(), !2399)
    #dbg_value(ptr %add.ptr2, !2402, !DIExpression(), !2399)
    #dbg_value(ptr %s, !2403, !DIExpression(), !2399)
    #dbg_value(ptr %SPS.i, !2404, !DIExpression(), !2399)
    #dbg_declare(ptr %PS.i.i, !2405, !DIExpression(), !2393)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(34400) %PS.i.i, i8 0, i32 34400, i1 false), !dbg !2393
  call void @llvm.lifetime.start.p0(i64 550400, ptr nonnull %accumulator.i39), !dbg !2409
    #dbg_value(ptr %pk, !2414, !DIExpression(), !2415)
    #dbg_value(ptr %add.ptr, !2416, !DIExpression(), !2415)
    #dbg_value(ptr %add.ptr2, !2417, !DIExpression(), !2415)
    #dbg_value(ptr %s, !2418, !DIExpression(), !2415)
    #dbg_value(i32 78, !2419, !DIExpression(), !2415)
    #dbg_value(i32 78, !2420, !DIExpression(), !2415)
    #dbg_value(i32 8, !2421, !DIExpression(), !2415)
    #dbg_value(i32 10, !2422, !DIExpression(), !2415)
    #dbg_value(ptr %PS.i.i, !2423, !DIExpression(), !2415)
    #dbg_value(i32 86, !2424, !DIExpression(), !2415)
    #dbg_value(i32 5, !2425, !DIExpression(), !2415)
    #dbg_declare(ptr %accumulator.i39, !2426, !DIExpression(), !2409)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(550400) %accumulator.i39, i8 0, i32 550400, i1 false), !dbg !2409
    #dbg_value(i32 0, !2430, !DIExpression(), !2415)
    #dbg_value(i32 0, !2431, !DIExpression(), !2433)
  br label %for.cond.i40, !dbg !2434

for.cond.i40:                                     ; preds = %for.inc52.i, %decode.exit31
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc52.i ], [ 78, %decode.exit31 ], !dbg !2435
  %P1_used.0.i = phi i32 [ 0, %decode.exit31 ], [ %P1_used.1.i.lcssa, %for.inc52.i ], !dbg !2435
  %row.0.i41 = phi i32 [ 0, %decode.exit31 ], [ %inc53.i, %for.inc52.i ], !dbg !2436
    #dbg_value(i32 %row.0.i41, !2431, !DIExpression(), !2433)
    #dbg_value(i32 %P1_used.0.i, !2430, !DIExpression(), !2415)
  %exitcond76 = icmp ne i32 %row.0.i41, 78, !dbg !2437
  br i1 %exitcond76, label %for.cond2.i.preheader, label %for.cond56.i.preheader, !dbg !2439

for.cond2.i.preheader:                            ; preds = %for.cond.i40
  %6 = add i32 %P1_used.0.i, %indvars.iv, !dbg !2440
  br label %for.cond2.i, !dbg !2440

for.cond56.i.preheader:                           ; preds = %for.cond.i40
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %pk, i32 148200, !dbg !2443
  br label %for.cond56.i, !dbg !2444

for.cond2.i:                                      ; preds = %for.cond2.i.preheader, %for.inc17.i
  %P1_used.1.i = phi i32 [ %inc16.i, %for.inc17.i ], [ %P1_used.0.i, %for.cond2.i.preheader ], !dbg !2415
  %j.0.i46 = phi i32 [ %inc18.i, %for.inc17.i ], [ %row.0.i41, %for.cond2.i.preheader ], !dbg !2446
    #dbg_value(i32 %j.0.i46, !2447, !DIExpression(), !2448)
    #dbg_value(i32 %P1_used.1.i, !2430, !DIExpression(), !2415)
  %exitcond72 = icmp ne i32 %P1_used.1.i, %6, !dbg !2449
  br i1 %exitcond72, label %for.cond5.i.preheader, label %for.cond21.i.preheader, !dbg !2440

for.cond21.i.preheader:                           ; preds = %for.cond2.i
  %P1_used.1.i.lcssa = phi i32 [ %P1_used.1.i, %for.cond2.i ], !dbg !2415
  br label %for.cond21.i, !dbg !2451

for.cond5.i.preheader:                            ; preds = %for.cond2.i
  br label %for.cond5.i, !dbg !2453

for.cond5.i:                                      ; preds = %for.cond5.i.preheader, %m_vec_add.exit.i58
  %col.0.i48 = phi i32 [ %inc.i59, %m_vec_add.exit.i58 ], [ 0, %for.cond5.i.preheader ], !dbg !2456
    #dbg_value(i32 %col.0.i48, !2457, !DIExpression(), !2458)
  %exitcond71 = icmp ne i32 %col.0.i48, 10, !dbg !2459
  br i1 %exitcond71, label %for.body7.i, label %for.inc17.i, !dbg !2453

for.body7.i:                                      ; preds = %for.cond5.i
  %add.ptr.i50.idx = mul nsw i32 %P1_used.1.i, 40, !dbg !2461
  %add.ptr.i50 = getelementptr inbounds i8, ptr %pk, i32 %add.ptr.i50.idx, !dbg !2461
  %mul8.i51 = mul nuw nsw i32 %row.0.i41, 10, !dbg !2463
  %add9.i = add nuw nsw i32 %mul8.i51, %col.0.i48, !dbg !2464
  %mul10.i = shl nuw nsw i32 %add9.i, 4, !dbg !2465
  %mul11.i52 = mul nuw nsw i32 %col.0.i48, 86, !dbg !2466
  %7 = getelementptr i8, ptr %s, i32 %mul11.i52, !dbg !2467
  %arrayidx.i53 = getelementptr i8, ptr %7, i32 %j.0.i46, !dbg !2467
  %8 = load i8, ptr %arrayidx.i53, align 1, !dbg !2467
  %conv.i54 = zext i8 %8 to i32, !dbg !2467
  %add13.i = add nuw nsw i32 %mul10.i, %conv.i54, !dbg !2468
  %add.ptr15.i.idx = mul nuw nsw i32 %add13.i, 40, !dbg !2469
  %add.ptr15.i = getelementptr inbounds nuw i8, ptr %accumulator.i39, i32 %add.ptr15.i.idx, !dbg !2469
    #dbg_value(i32 5, !2470, !DIExpression(), !2474)
    #dbg_value(ptr %add.ptr.i50, !2476, !DIExpression(), !2474)
    #dbg_value(ptr %add.ptr15.i, !2477, !DIExpression(), !2474)
    #dbg_value(i32 0, !2478, !DIExpression(), !2480)
  br label %for.cond.i.i55, !dbg !2481

for.cond.i.i55:                                   ; preds = %for.body.i.i60, %for.body7.i
  %i.0.i.i56 = phi i32 [ 0, %for.body7.i ], [ %inc.i.i64, %for.body.i.i60 ], !dbg !2482
    #dbg_value(i32 %i.0.i.i56, !2478, !DIExpression(), !2480)
  %exitcond70 = icmp ne i32 %i.0.i.i56, 5, !dbg !2483
  br i1 %exitcond70, label %for.body.i.i60, label %m_vec_add.exit.i58, !dbg !2485

for.body.i.i60:                                   ; preds = %for.cond.i.i55
  %arrayidx.i.i61 = getelementptr inbounds nuw i64, ptr %add.ptr.i50, i32 %i.0.i.i56, !dbg !2486
  %9 = load i64, ptr %arrayidx.i.i61, align 8, !dbg !2486
  %arrayidx1.i.i62 = getelementptr inbounds nuw i64, ptr %add.ptr15.i, i32 %i.0.i.i56, !dbg !2488
  %10 = load i64, ptr %arrayidx1.i.i62, align 8, !dbg !2489
  %xor.i.i63 = xor i64 %10, %9, !dbg !2489
  store i64 %xor.i.i63, ptr %arrayidx1.i.i62, align 8, !dbg !2489
  %inc.i.i64 = add nuw nsw i32 %i.0.i.i56, 1, !dbg !2490
    #dbg_value(i32 %inc.i.i64, !2478, !DIExpression(), !2480)
  br label %for.cond.i.i55, !dbg !2491, !llvm.loop !2492

m_vec_add.exit.i58:                               ; preds = %for.cond.i.i55
  %inc.i59 = add nuw nsw i32 %col.0.i48, 1, !dbg !2494
    #dbg_value(i32 %inc.i59, !2457, !DIExpression(), !2458)
  br label %for.cond5.i, !dbg !2495, !llvm.loop !2496

for.inc17.i:                                      ; preds = %for.cond5.i
    #dbg_value(i32 %P1_used.1.i, !2430, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2415)
  %inc16.i = add i32 %P1_used.1.i, 1, !dbg !2498
    #dbg_value(i32 %inc16.i, !2430, !DIExpression(), !2415)
  %inc18.i = add nuw nsw i32 %j.0.i46, 1, !dbg !2499
    #dbg_value(i32 %inc18.i, !2447, !DIExpression(), !2448)
  br label %for.cond2.i, !dbg !2500, !llvm.loop !2501

for.cond21.i:                                     ; preds = %for.cond21.i.preheader, %for.inc49.i
  %j20.0.i = phi i32 [ %inc50.i, %for.inc49.i ], [ 0, %for.cond21.i.preheader ], !dbg !2503
    #dbg_value(i32 %j20.0.i, !2504, !DIExpression(), !2505)
  %exitcond75 = icmp ne i32 %j20.0.i, 8, !dbg !2506
  br i1 %exitcond75, label %for.cond26.i.preheader, label %for.inc52.i, !dbg !2451

for.cond26.i.preheader:                           ; preds = %for.cond21.i
  br label %for.cond26.i, !dbg !2508

for.cond26.i:                                     ; preds = %for.cond26.i.preheader, %m_vec_add.exit18.i
  %col25.0.i = phi i32 [ %inc47.i, %m_vec_add.exit18.i ], [ 0, %for.cond26.i.preheader ], !dbg !2511
    #dbg_value(i32 %col25.0.i, !2512, !DIExpression(), !2513)
  %exitcond74 = icmp ne i32 %col25.0.i, 10, !dbg !2514
  br i1 %exitcond74, label %for.body29.i, label %for.inc49.i, !dbg !2508

for.body29.i:                                     ; preds = %for.cond26.i
  %mul30.i47 = shl nuw nsw i32 %row.0.i41, 3, !dbg !2516
  %add31.i = or disjoint i32 %mul30.i47, %j20.0.i, !dbg !2518
  %add.ptr33.i.idx = mul nuw nsw i32 %add31.i, 40, !dbg !2519
  %add.ptr33.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %add.ptr33.i.idx, !dbg !2519
  %mul35.i = mul nuw nsw i32 %row.0.i41, 10, !dbg !2520
  %add36.i = add nuw nsw i32 %mul35.i, %col25.0.i, !dbg !2521
  %mul37.i = shl nuw nsw i32 %add36.i, 4, !dbg !2522
  %mul38.i = mul nuw nsw i32 %col25.0.i, 86, !dbg !2523
  %11 = getelementptr i8, ptr %s, i32 %mul38.i, !dbg !2524
  %12 = getelementptr i8, ptr %11, i32 %j20.0.i, !dbg !2524
  %arrayidx41.i = getelementptr i8, ptr %12, i32 78, !dbg !2524
  %13 = load i8, ptr %arrayidx41.i, align 1, !dbg !2524
  %conv42.i = zext i8 %13 to i32, !dbg !2524
  %add43.i = add nuw nsw i32 %mul37.i, %conv42.i, !dbg !2525
  %add.ptr45.i.idx = mul nuw nsw i32 %add43.i, 40, !dbg !2526
  %add.ptr45.i = getelementptr inbounds nuw i8, ptr %accumulator.i39, i32 %add.ptr45.i.idx, !dbg !2526
    #dbg_value(i32 5, !2470, !DIExpression(), !2527)
    #dbg_value(ptr %add.ptr33.i, !2476, !DIExpression(), !2527)
    #dbg_value(ptr %add.ptr45.i, !2477, !DIExpression(), !2527)
    #dbg_value(i32 0, !2478, !DIExpression(), !2529)
  br label %for.cond.i10.i, !dbg !2530

for.cond.i10.i:                                   ; preds = %for.body.i13.i, %for.body29.i
  %i.0.i11.i = phi i32 [ 0, %for.body29.i ], [ %inc.i17.i, %for.body.i13.i ], !dbg !2531
    #dbg_value(i32 %i.0.i11.i, !2478, !DIExpression(), !2529)
  %exitcond73 = icmp ne i32 %i.0.i11.i, 5, !dbg !2532
  br i1 %exitcond73, label %for.body.i13.i, label %m_vec_add.exit18.i, !dbg !2533

for.body.i13.i:                                   ; preds = %for.cond.i10.i
  %arrayidx.i14.i = getelementptr inbounds nuw i64, ptr %add.ptr33.i, i32 %i.0.i11.i, !dbg !2534
  %14 = load i64, ptr %arrayidx.i14.i, align 8, !dbg !2534
  %arrayidx1.i15.i = getelementptr inbounds nuw i64, ptr %add.ptr45.i, i32 %i.0.i11.i, !dbg !2535
  %15 = load i64, ptr %arrayidx1.i15.i, align 8, !dbg !2536
  %xor.i16.i = xor i64 %15, %14, !dbg !2536
  store i64 %xor.i16.i, ptr %arrayidx1.i15.i, align 8, !dbg !2536
  %inc.i17.i = add nuw nsw i32 %i.0.i11.i, 1, !dbg !2537
    #dbg_value(i32 %inc.i17.i, !2478, !DIExpression(), !2529)
  br label %for.cond.i10.i, !dbg !2538, !llvm.loop !2539

m_vec_add.exit18.i:                               ; preds = %for.cond.i10.i
  %inc47.i = add nuw nsw i32 %col25.0.i, 1, !dbg !2541
    #dbg_value(i32 %inc47.i, !2512, !DIExpression(), !2513)
  br label %for.cond26.i, !dbg !2542, !llvm.loop !2543

for.inc49.i:                                      ; preds = %for.cond26.i
  %inc50.i = add nuw nsw i32 %j20.0.i, 1, !dbg !2545
    #dbg_value(i32 %inc50.i, !2504, !DIExpression(), !2505)
  br label %for.cond21.i, !dbg !2546, !llvm.loop !2547

for.inc52.i:                                      ; preds = %for.cond21.i
  %inc53.i = add nuw nsw i32 %row.0.i41, 1, !dbg !2549
    #dbg_value(i32 %inc53.i, !2431, !DIExpression(), !2433)
  %indvars.iv.next = add nsw i32 %indvars.iv, -1, !dbg !2550
  br label %for.cond.i40, !dbg !2550, !llvm.loop !2551

for.cond56.i:                                     ; preds = %for.cond56.i.preheader, %for.inc90.i
  %indvars.iv79 = phi i32 [ 8, %for.cond56.i.preheader ], [ %indvars.iv.next80, %for.inc90.i ], !dbg !2553
  %P3_used.0.i = phi i32 [ %P3_used.1.i.lcssa, %for.inc90.i ], [ 0, %for.cond56.i.preheader ], !dbg !2553
  %row55.0.i = phi i32 [ %inc91.i, %for.inc90.i ], [ 78, %for.cond56.i.preheader ], !dbg !2554
    #dbg_value(i32 %row55.0.i, !2555, !DIExpression(), !2556)
    #dbg_value(i32 %P3_used.0.i, !2557, !DIExpression(), !2415)
  %exitcond82 = icmp ne i32 %row55.0.i, 86, !dbg !2558
  br i1 %exitcond82, label %for.cond61.i.preheader, label %while.cond.i43.preheader, !dbg !2444

for.cond61.i.preheader:                           ; preds = %for.cond56.i
  %16 = add i32 %P3_used.0.i, %indvars.iv79, !dbg !2560
  br label %for.cond61.i, !dbg !2560

while.cond.i43.preheader:                         ; preds = %for.cond56.i
  br label %while.cond.i43, !dbg !2563

for.cond61.i:                                     ; preds = %for.cond61.i.preheader, %for.inc87.i
  %P3_used.1.i = phi i32 [ %inc86.i, %for.inc87.i ], [ %P3_used.0.i, %for.cond61.i.preheader ], !dbg !2415
  %j60.0.i = phi i32 [ %inc88.i, %for.inc87.i ], [ %row55.0.i, %for.cond61.i.preheader ], !dbg !2564
    #dbg_value(i32 %j60.0.i, !2565, !DIExpression(), !2566)
    #dbg_value(i32 %P3_used.1.i, !2557, !DIExpression(), !2415)
  %exitcond81 = icmp ne i32 %P3_used.1.i, %16, !dbg !2567
  br i1 %exitcond81, label %for.cond66.i.preheader, label %for.inc90.i, !dbg !2560

for.cond66.i.preheader:                           ; preds = %for.cond61.i
  br label %for.cond66.i, !dbg !2569

for.cond66.i:                                     ; preds = %for.cond66.i.preheader, %m_vec_add.exit9.i
  %col65.0.i = phi i32 [ %inc84.i, %m_vec_add.exit9.i ], [ 0, %for.cond66.i.preheader ], !dbg !2572
    #dbg_value(i32 %col65.0.i, !2573, !DIExpression(), !2574)
  %exitcond78 = icmp ne i32 %col65.0.i, 10, !dbg !2575
  br i1 %exitcond78, label %for.body69.i, label %for.inc87.i, !dbg !2569

for.body69.i:                                     ; preds = %for.cond66.i
  %add.ptr71.i.idx = mul nsw i32 %P3_used.1.i, 40, !dbg !2577
  %add.ptr71.i = getelementptr inbounds i8, ptr %add.ptr2, i32 %add.ptr71.i.idx, !dbg !2577
  %mul73.i = mul nuw nsw i32 %row55.0.i, 10, !dbg !2579
  %add74.i = add nuw nsw i32 %mul73.i, %col65.0.i, !dbg !2580
  %mul75.i = shl nuw nsw i32 %add74.i, 4, !dbg !2581
  %mul76.i = mul nuw nsw i32 %col65.0.i, 86, !dbg !2582
  %17 = getelementptr i8, ptr %s, i32 %mul76.i, !dbg !2583
  %arrayidx78.i = getelementptr i8, ptr %17, i32 %j60.0.i, !dbg !2583
  %18 = load i8, ptr %arrayidx78.i, align 1, !dbg !2583
  %conv79.i = zext i8 %18 to i32, !dbg !2583
  %add80.i = add nuw nsw i32 %mul75.i, %conv79.i, !dbg !2584
  %add.ptr82.i.idx = mul nuw nsw i32 %add80.i, 40, !dbg !2585
  %add.ptr82.i = getelementptr inbounds nuw i8, ptr %accumulator.i39, i32 %add.ptr82.i.idx, !dbg !2585
    #dbg_value(i32 5, !2470, !DIExpression(), !2586)
    #dbg_value(ptr %add.ptr71.i, !2476, !DIExpression(), !2586)
    #dbg_value(ptr %add.ptr82.i, !2477, !DIExpression(), !2586)
    #dbg_value(i32 0, !2478, !DIExpression(), !2588)
  br label %for.cond.i1.i, !dbg !2589

for.cond.i1.i:                                    ; preds = %for.body.i4.i, %for.body69.i
  %i.0.i2.i = phi i32 [ 0, %for.body69.i ], [ %inc.i8.i, %for.body.i4.i ], !dbg !2590
    #dbg_value(i32 %i.0.i2.i, !2478, !DIExpression(), !2588)
  %exitcond77 = icmp ne i32 %i.0.i2.i, 5, !dbg !2591
  br i1 %exitcond77, label %for.body.i4.i, label %m_vec_add.exit9.i, !dbg !2592

for.body.i4.i:                                    ; preds = %for.cond.i1.i
  %arrayidx.i5.i = getelementptr inbounds nuw i64, ptr %add.ptr71.i, i32 %i.0.i2.i, !dbg !2593
  %19 = load i64, ptr %arrayidx.i5.i, align 8, !dbg !2593
  %arrayidx1.i6.i = getelementptr inbounds nuw i64, ptr %add.ptr82.i, i32 %i.0.i2.i, !dbg !2594
  %20 = load i64, ptr %arrayidx1.i6.i, align 8, !dbg !2595
  %xor.i7.i = xor i64 %20, %19, !dbg !2595
  store i64 %xor.i7.i, ptr %arrayidx1.i6.i, align 8, !dbg !2595
  %inc.i8.i = add nuw nsw i32 %i.0.i2.i, 1, !dbg !2596
    #dbg_value(i32 %inc.i8.i, !2478, !DIExpression(), !2588)
  br label %for.cond.i1.i, !dbg !2597, !llvm.loop !2598

m_vec_add.exit9.i:                                ; preds = %for.cond.i1.i
  %inc84.i = add nuw nsw i32 %col65.0.i, 1, !dbg !2600
    #dbg_value(i32 %inc84.i, !2573, !DIExpression(), !2574)
  br label %for.cond66.i, !dbg !2601, !llvm.loop !2602

for.inc87.i:                                      ; preds = %for.cond66.i
    #dbg_value(i32 %P3_used.1.i, !2557, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2415)
  %inc86.i = add i32 %P3_used.1.i, 1, !dbg !2604
    #dbg_value(i32 %inc86.i, !2557, !DIExpression(), !2415)
  %inc88.i = add nuw nsw i32 %j60.0.i, 1, !dbg !2605
    #dbg_value(i32 %inc88.i, !2565, !DIExpression(), !2566)
  br label %for.cond61.i, !dbg !2606, !llvm.loop !2607

for.inc90.i:                                      ; preds = %for.cond61.i
  %P3_used.1.i.lcssa = phi i32 [ %P3_used.1.i, %for.cond61.i ], !dbg !2415
  %inc91.i = add nuw nsw i32 %row55.0.i, 1, !dbg !2609
    #dbg_value(i32 %inc91.i, !2555, !DIExpression(), !2556)
  %indvars.iv.next80 = add nsw i32 %indvars.iv79, -1, !dbg !2610
  br label %for.cond56.i, !dbg !2610, !llvm.loop !2611

while.cond.i43:                                   ; preds = %while.cond.i43.preheader, %while.body.i45
  %i.0.i44 = phi i32 [ %inc102.i, %while.body.i45 ], [ 0, %while.cond.i43.preheader ], !dbg !2415
    #dbg_value(i32 %i.0.i44, !2613, !DIExpression(), !2415)
  %exitcond83 = icmp ne i32 %i.0.i44, 860, !dbg !2614
  br i1 %exitcond83, label %while.body.i45, label %mayo_generic_m_calculate_PS.exit, !dbg !2563

while.body.i45:                                   ; preds = %while.cond.i43
  %add.ptr99.i.idx = mul nuw nsw i32 %i.0.i44, 640, !dbg !2615
  %add.ptr99.i = getelementptr inbounds nuw i8, ptr %accumulator.i39, i32 %add.ptr99.i.idx, !dbg !2615
  %add.ptr101.i.idx = mul nuw nsw i32 %i.0.i44, 40, !dbg !2617
  %add.ptr101.i = getelementptr inbounds nuw i8, ptr %PS.i.i, i32 %add.ptr101.i.idx, !dbg !2617
  call fastcc void @m_vec_multiply_bins(i32 noundef 5, ptr noundef nonnull %add.ptr99.i, ptr noundef nonnull %add.ptr101.i) #9, !dbg !2618
  %inc102.i = add nuw nsw i32 %i.0.i44, 1, !dbg !2619
    #dbg_value(i32 %inc102.i, !2613, !DIExpression(), !2415)
  br label %while.cond.i43, !dbg !2563, !llvm.loop !2620

mayo_generic_m_calculate_PS.exit:                 ; preds = %while.cond.i43
  call void @llvm.lifetime.end.p0(i64 550400, ptr nonnull %accumulator.i39), !dbg !2622
  call void @llvm.lifetime.start.p0(i64 64000, ptr nonnull %accumulator.i), !dbg !2623
    #dbg_value(ptr %PS.i.i, !2628, !DIExpression(), !2629)
    #dbg_value(ptr %s, !2630, !DIExpression(), !2629)
    #dbg_value(i32 78, !2631, !DIExpression(), !2629)
    #dbg_value(i32 10, !2632, !DIExpression(), !2629)
    #dbg_value(i32 86, !2633, !DIExpression(), !2629)
    #dbg_value(ptr %SPS.i, !2634, !DIExpression(), !2629)
    #dbg_declare(ptr %accumulator.i, !2635, !DIExpression(), !2623)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(64000) %accumulator.i, i8 0, i32 64000, i1 false), !dbg !2623
    #dbg_value(i32 5, !2639, !DIExpression(), !2629)
    #dbg_value(i32 0, !2640, !DIExpression(), !2642)
  br label %for.cond.i32, !dbg !2643

for.cond.i32:                                     ; preds = %for.inc20.i, %mayo_generic_m_calculate_PS.exit
  %row.0.i = phi i32 [ 0, %mayo_generic_m_calculate_PS.exit ], [ %inc21.i, %for.inc20.i ], !dbg !2644
    #dbg_value(i32 %row.0.i, !2640, !DIExpression(), !2642)
  %exitcond87 = icmp ne i32 %row.0.i, 10, !dbg !2645
  br i1 %exitcond87, label %for.cond1.i.preheader, label %while.cond.i.preheader, !dbg !2647

for.cond1.i.preheader:                            ; preds = %for.cond.i32
  br label %for.cond1.i, !dbg !2648

while.cond.i.preheader:                           ; preds = %for.cond.i32
  br label %while.cond.i, !dbg !2651

for.cond1.i:                                      ; preds = %for.cond1.i.preheader, %for.inc18.i
  %j.0.i = phi i32 [ %inc.i35, %for.inc18.i ], [ 0, %for.cond1.i.preheader ], !dbg !2652
    #dbg_value(i32 %j.0.i, !2653, !DIExpression(), !2654)
  %exitcond86 = icmp ne i32 %j.0.i, 86, !dbg !2655
  br i1 %exitcond86, label %for.cond4.i.preheader, label %for.inc20.i, !dbg !2648

for.cond4.i.preheader:                            ; preds = %for.cond1.i
  br label %for.cond4.i, !dbg !2657

for.cond4.i:                                      ; preds = %for.cond4.i.preheader, %m_vec_add.exit.i
  %col.0.i = phi i32 [ %add17.i, %m_vec_add.exit.i ], [ 0, %for.cond4.i.preheader ], !dbg !2660
    #dbg_value(i32 %col.0.i, !2661, !DIExpression(), !2662)
  %exitcond85 = icmp ne i32 %col.0.i, 10, !dbg !2663
  br i1 %exitcond85, label %for.body6.i, label %for.inc18.i, !dbg !2657

for.body6.i:                                      ; preds = %for.cond4.i
  %mul.i36 = mul nuw nsw i32 %j.0.i, 10, !dbg !2665
  %add7.i = add nuw nsw i32 %mul.i36, %col.0.i, !dbg !2667
  %add.ptr.i37.idx = mul nuw nsw i32 %add7.i, 40, !dbg !2668
  %add.ptr.i37 = getelementptr inbounds nuw i8, ptr %PS.i.i, i32 %add.ptr.i37.idx, !dbg !2668
  %mul9.i = mul nuw nsw i32 %row.0.i, 10, !dbg !2669
  %add10.i = add nuw nsw i32 %mul9.i, %col.0.i, !dbg !2670
  %mul11.i = shl nuw nsw i32 %add10.i, 4, !dbg !2671
  %mul12.i = mul nuw nsw i32 %row.0.i, 86, !dbg !2672
  %21 = getelementptr i8, ptr %s, i32 %mul12.i, !dbg !2673
  %arrayidx.i38 = getelementptr i8, ptr %21, i32 %j.0.i, !dbg !2673
  %22 = load i8, ptr %arrayidx.i38, align 1, !dbg !2673
  %conv.i = zext i8 %22 to i32, !dbg !2673
  %add14.i = add nuw nsw i32 %mul11.i, %conv.i, !dbg !2674
  %add.ptr16.i.idx = mul nuw nsw i32 %add14.i, 40, !dbg !2675
  %add.ptr16.i = getelementptr inbounds nuw i8, ptr %accumulator.i, i32 %add.ptr16.i.idx, !dbg !2675
    #dbg_value(i32 5, !2470, !DIExpression(), !2676)
    #dbg_value(ptr %add.ptr.i37, !2476, !DIExpression(), !2676)
    #dbg_value(ptr %add.ptr16.i, !2477, !DIExpression(), !2676)
    #dbg_value(i32 0, !2478, !DIExpression(), !2678)
  br label %for.cond.i.i, !dbg !2679

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body6.i
  %i.0.i.i = phi i32 [ 0, %for.body6.i ], [ %inc.i.i, %for.body.i.i ], !dbg !2680
    #dbg_value(i32 %i.0.i.i, !2478, !DIExpression(), !2678)
  %exitcond84 = icmp ne i32 %i.0.i.i, 5, !dbg !2681
  br i1 %exitcond84, label %for.body.i.i, label %m_vec_add.exit.i, !dbg !2682

for.body.i.i:                                     ; preds = %for.cond.i.i
  %arrayidx.i.i = getelementptr inbounds nuw i64, ptr %add.ptr.i37, i32 %i.0.i.i, !dbg !2683
  %23 = load i64, ptr %arrayidx.i.i, align 8, !dbg !2683
  %arrayidx1.i.i = getelementptr inbounds nuw i64, ptr %add.ptr16.i, i32 %i.0.i.i, !dbg !2684
  %24 = load i64, ptr %arrayidx1.i.i, align 8, !dbg !2685
  %xor.i.i = xor i64 %24, %23, !dbg !2685
  store i64 %xor.i.i, ptr %arrayidx1.i.i, align 8, !dbg !2685
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !2686
    #dbg_value(i32 %inc.i.i, !2478, !DIExpression(), !2678)
  br label %for.cond.i.i, !dbg !2687, !llvm.loop !2688

m_vec_add.exit.i:                                 ; preds = %for.cond.i.i
  %add17.i = add nuw nsw i32 %col.0.i, 1, !dbg !2690
    #dbg_value(i32 %add17.i, !2661, !DIExpression(), !2662)
  br label %for.cond4.i, !dbg !2691, !llvm.loop !2692

for.inc18.i:                                      ; preds = %for.cond4.i
  %inc.i35 = add nuw nsw i32 %j.0.i, 1, !dbg !2694
    #dbg_value(i32 %inc.i35, !2653, !DIExpression(), !2654)
  br label %for.cond1.i, !dbg !2695, !llvm.loop !2696

for.inc20.i:                                      ; preds = %for.cond1.i
  %inc21.i = add nuw nsw i32 %row.0.i, 1, !dbg !2698
    #dbg_value(i32 %inc21.i, !2640, !DIExpression(), !2642)
  br label %for.cond.i32, !dbg !2699, !llvm.loop !2700

while.cond.i:                                     ; preds = %while.cond.i.preheader, %while.body.i
  %i.0.i34 = phi i32 [ %inc32.i, %while.body.i ], [ 0, %while.cond.i.preheader ], !dbg !2629
    #dbg_value(i32 %i.0.i34, !2702, !DIExpression(), !2629)
  %exitcond88 = icmp ne i32 %i.0.i34, 100, !dbg !2703
  br i1 %exitcond88, label %while.body.i, label %mayo_generic_m_calculate_SPS.exit, !dbg !2651

while.body.i:                                     ; preds = %while.cond.i
  %add.ptr29.i.idx = mul nuw nsw i32 %i.0.i34, 640, !dbg !2704
  %add.ptr29.i = getelementptr inbounds nuw i8, ptr %accumulator.i, i32 %add.ptr29.i.idx, !dbg !2704
  %add.ptr31.i.idx = mul nuw nsw i32 %i.0.i34, 40, !dbg !2706
  %add.ptr31.i = getelementptr inbounds nuw i8, ptr %SPS.i, i32 %add.ptr31.i.idx, !dbg !2706
  call fastcc void @m_vec_multiply_bins(i32 noundef 5, ptr noundef nonnull %add.ptr29.i, ptr noundef nonnull %add.ptr31.i) #9, !dbg !2707
  %inc32.i = add nuw nsw i32 %i.0.i34, 1, !dbg !2708
    #dbg_value(i32 %inc32.i, !2702, !DIExpression(), !2629)
  br label %while.cond.i, !dbg !2651, !llvm.loop !2709

mayo_generic_m_calculate_SPS.exit:                ; preds = %while.cond.i
  call void @llvm.lifetime.end.p0(i64 64000, ptr nonnull %accumulator.i), !dbg !2711
  call void @llvm.lifetime.end.p0(i64 34400, ptr nonnull %PS.i.i), !dbg !2712
    #dbg_declare(ptr %zero.i, !2713, !DIExpression(), !2714)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(78) %zero.i, i8 0, i32 78, i1 false), !dbg !2714
  call fastcc void @compute_rhs(ptr noundef %p, ptr noundef nonnull %SPS.i, ptr noundef nonnull %zero.i, ptr noundef nonnull %y) #9, !dbg !2715
  call void @llvm.lifetime.end.p0(i64 4000, ptr nonnull %SPS.i), !dbg !2716
  call void @llvm.lifetime.end.p0(i64 78, ptr nonnull %zero.i), !dbg !2716
  %call20 = call i32 @memcmp(ptr noundef nonnull %y, ptr noundef nonnull %t, i32 noundef 78) #8, !dbg !2717
  %cmp21 = icmp ne i32 %call20, 0, !dbg !2719
  %. = zext i1 %cmp21 to i32, !dbg !2256
  ret i32 %., !dbg !2720
}

; Function Attrs: nounwind
define dso_local i32 @pqmayo_MAYO_1_ref_mayo_expand_pk(ptr noundef %p, ptr noundef %cpk, ptr noundef %pk) local_unnamed_addr #0 !dbg !248 {
entry:
  %tmp.i2 = alloca [5 x i64], align 8
  %tmp.i = alloca [5 x i64], align 8
    #dbg_value(ptr %p, !247, !DIExpression(), !2721)
    #dbg_value(ptr %cpk, !253, !DIExpression(), !2721)
    #dbg_value(ptr %pk, !254, !DIExpression(), !2721)
    #dbg_value(ptr %p, !255, !DIExpression(), !2722)
    #dbg_value(ptr %pk, !261, !DIExpression(), !2722)
    #dbg_value(ptr %cpk, !262, !DIExpression(), !2722)
  %call.i = call i32 @AES_128_CTR(ptr noundef %pk, i32 noundef 144495, ptr noundef %cpk, i32 noundef 16) #8, !dbg !2724
  call void @llvm.lifetime.start.p0(i64 40, ptr nonnull %tmp.i2), !dbg !2725
    #dbg_value(ptr %pk, !269, !DIExpression(), !2727)
    #dbg_value(ptr %pk, !271, !DIExpression(), !2727)
    #dbg_value(i32 3705, !272, !DIExpression(), !2727)
    #dbg_value(i32 78, !273, !DIExpression(), !2727)
    #dbg_value(i32 5, !274, !DIExpression(), !2727)
    #dbg_value(ptr %pk, !276, !DIExpression(), !2727)
    #dbg_declare(ptr %tmp.i2, !277, !DIExpression(), !2725)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(40) %tmp.i2, i8 0, i32 40, i1 false), !dbg !2725
    #dbg_value(i32 3705, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2728)
  br label %for.cond.i3, !dbg !2729

for.cond.i3:                                      ; preds = %for.body.i7, %entry
  %i.0.in.i4 = phi i32 [ 3705, %entry ], [ %i.0.i5, %for.body.i7 ]
    #dbg_value(i32 %i.0.in.i4, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2728)
  %cmp.i6 = icmp ugt i32 %i.0.in.i4, 0, !dbg !2730
  br i1 %cmp.i6, label %for.body.i7, label %unpack_m_vecs.exit16, !dbg !2731

for.body.i7:                                      ; preds = %for.cond.i3
  %i.0.i5 = add nsw i32 %i.0.in.i4, -1, !dbg !2732
    #dbg_value(i32 %i.0.i5, !281, !DIExpression(), !2728)
  %mul.i8 = mul nsw i32 %i.0.i5, 78, !dbg !2733
  %div1.i91720 = lshr exact i32 %mul.i8, 1, !dbg !2734
  %add.ptr.i10 = getelementptr inbounds nuw i8, ptr %pk, i32 %div1.i91720, !dbg !2735
  %call.i11 = call ptr @memcpy(ptr noundef nonnull %tmp.i2, ptr noundef %add.ptr.i10, i32 noundef 39) #8, !dbg !2736
  %mul4.i13 = mul nsw i32 %i.0.i5, 40, !dbg !2737
  %add.ptr5.i14 = getelementptr inbounds nuw i8, ptr %pk, i32 %mul4.i13, !dbg !2738
  %call8.i15 = call ptr @memcpy(ptr noundef %add.ptr5.i14, ptr noundef nonnull %tmp.i2, i32 noundef 40) #8, !dbg !2739
    #dbg_value(i32 %i.0.i5, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2728)
  br label %for.cond.i3, !dbg !2740, !llvm.loop !2741

unpack_m_vecs.exit16:                             ; preds = %for.cond.i3
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %tmp.i2), !dbg !2743
  %add.ptr = getelementptr inbounds nuw i8, ptr %cpk, i32 16, !dbg !2744
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %pk, i32 148200, !dbg !2745
  call void @llvm.lifetime.start.p0(i64 40, ptr nonnull %tmp.i), !dbg !2746
    #dbg_value(ptr %add.ptr, !269, !DIExpression(), !2748)
    #dbg_value(ptr %add.ptr2, !271, !DIExpression(), !2748)
    #dbg_value(i32 36, !272, !DIExpression(), !2748)
    #dbg_value(i32 78, !273, !DIExpression(), !2748)
    #dbg_value(i32 5, !274, !DIExpression(), !2748)
    #dbg_value(ptr %add.ptr2, !276, !DIExpression(), !2748)
    #dbg_declare(ptr %tmp.i, !277, !DIExpression(), !2746)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(40) %tmp.i, i8 0, i32 40, i1 false), !dbg !2746
    #dbg_value(i32 36, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2749)
  br label %for.cond.i, !dbg !2750

for.cond.i:                                       ; preds = %for.body.i, %unpack_m_vecs.exit16
  %i.0.in.i = phi i32 [ 36, %unpack_m_vecs.exit16 ], [ %i.0.i, %for.body.i ]
    #dbg_value(i32 %i.0.in.i, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2749)
  %cmp.i = icmp ugt i32 %i.0.in.i, 0, !dbg !2751
  br i1 %cmp.i, label %for.body.i, label %unpack_m_vecs.exit, !dbg !2752

for.body.i:                                       ; preds = %for.cond.i
  %i.0.i = add nsw i32 %i.0.in.i, -1, !dbg !2753
    #dbg_value(i32 %i.0.i, !281, !DIExpression(), !2749)
  %mul.i = mul nsw i32 %i.0.i, 78, !dbg !2754
  %div1.i1819 = lshr exact i32 %mul.i, 1, !dbg !2755
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %div1.i1819, !dbg !2756
  %call.i1 = call ptr @memcpy(ptr noundef nonnull %tmp.i, ptr noundef nonnull %add.ptr.i, i32 noundef 39) #8, !dbg !2757
  %mul4.i = mul nsw i32 %i.0.i, 40, !dbg !2758
  %add.ptr5.i = getelementptr inbounds nuw i8, ptr %add.ptr2, i32 %mul4.i, !dbg !2759
  %call8.i = call ptr @memcpy(ptr noundef nonnull %add.ptr5.i, ptr noundef nonnull %tmp.i, i32 noundef 40) #8, !dbg !2760
    #dbg_value(i32 %i.0.i, !281, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2749)
  br label %for.cond.i, !dbg !2761, !llvm.loop !2762

unpack_m_vecs.exit:                               ; preds = %for.cond.i
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %tmp.i), !dbg !2764
  ret i32 0, !dbg !2765
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_multiply_bins(i32 noundef %m_vec_limbs, ptr noundef %bins, ptr noundef %out) unnamed_addr #0 !dbg !2766 {
entry:
    #dbg_value(i32 %m_vec_limbs, !2769, !DIExpression(), !2770)
    #dbg_value(ptr %bins, !2771, !DIExpression(), !2770)
    #dbg_value(ptr %out, !2772, !DIExpression(), !2770)
  %add.ptr = getelementptr inbounds nuw i8, ptr %bins, i32 200, !dbg !2773
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %bins, i32 400, !dbg !2774
    #dbg_value(i32 %m_vec_limbs, !2775, !DIExpression(), !2777)
    #dbg_value(ptr %add.ptr, !2779, !DIExpression(), !2777)
    #dbg_value(ptr %add.ptr1, !2780, !DIExpression(), !2777)
    #dbg_value(i64 1229782938247303441, !2781, !DIExpression(), !2777)
    #dbg_value(i32 0, !2782, !DIExpression(), !2784)
  br label %for.cond.i77, !dbg !2785

for.cond.i77:                                     ; preds = %for.body.i80, %entry
  %i.0.i78 = phi i32 [ 0, %entry ], [ %inc.i89, %for.body.i80 ], !dbg !2786
    #dbg_value(i32 %i.0.i78, !2782, !DIExpression(), !2784)
  %exitcond = icmp ne i32 %i.0.i78, 5, !dbg !2787
  br i1 %exitcond, label %for.body.i80, label %m_vec_mul_add_x_inv.exit90, !dbg !2789

for.body.i80:                                     ; preds = %for.cond.i77
  %arrayidx.i81 = getelementptr inbounds nuw i64, ptr %add.ptr, i32 %i.0.i78, !dbg !2790
  %0 = load i64, ptr %arrayidx.i81, align 8, !dbg !2790
  %and.i82 = and i64 %0, 1229782938247303441, !dbg !2792
    #dbg_value(i64 %and.i82, !2793, !DIExpression(), !2794)
  %xor.i83 = lshr i64 %0, 1, !dbg !2795
  %shr.i84 = and i64 %xor.i83, 8608480567731124087, !dbg !2795
  %mul.i85 = mul nuw i64 %and.i82, 9, !dbg !2796
  %xor2.i86 = xor i64 %shr.i84, %mul.i85, !dbg !2797
  %arrayidx3.i87 = getelementptr inbounds nuw i64, ptr %add.ptr1, i32 %i.0.i78, !dbg !2798
  %1 = load i64, ptr %arrayidx3.i87, align 8, !dbg !2799
  %xor4.i88 = xor i64 %1, %xor2.i86, !dbg !2799
  store i64 %xor4.i88, ptr %arrayidx3.i87, align 8, !dbg !2799
  %inc.i89 = add nuw nsw i32 %i.0.i78, 1, !dbg !2800
    #dbg_value(i32 %inc.i89, !2782, !DIExpression(), !2784)
  br label %for.cond.i77, !dbg !2801, !llvm.loop !2802

m_vec_mul_add_x_inv.exit90:                       ; preds = %for.cond.i77
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %bins, i32 440, !dbg !2804
  %add.ptr3 = getelementptr inbounds nuw i8, ptr %bins, i32 480, !dbg !2805
    #dbg_value(i32 %m_vec_limbs, !2806, !DIExpression(), !2808)
    #dbg_value(ptr %add.ptr2, !2810, !DIExpression(), !2808)
    #dbg_value(ptr %add.ptr3, !2811, !DIExpression(), !2808)
    #dbg_value(i64 -8608480567731124088, !2812, !DIExpression(), !2808)
    #dbg_value(i32 0, !2813, !DIExpression(), !2815)
  br label %for.cond.i104, !dbg !2816

for.cond.i104:                                    ; preds = %for.body.i107, %m_vec_mul_add_x_inv.exit90
  %i.0.i105 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit90 ], [ %inc.i117, %for.body.i107 ], !dbg !2817
    #dbg_value(i32 %i.0.i105, !2813, !DIExpression(), !2815)
  %exitcond194 = icmp ne i32 %i.0.i105, 5, !dbg !2818
  br i1 %exitcond194, label %for.body.i107, label %m_vec_mul_add_x.exit118, !dbg !2820

for.body.i107:                                    ; preds = %for.cond.i104
  %arrayidx.i108 = getelementptr inbounds nuw i64, ptr %add.ptr2, i32 %i.0.i105, !dbg !2821
  %2 = load i64, ptr %arrayidx.i108, align 8, !dbg !2821
    #dbg_value(i64 %2, !2823, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2824)
  %xor.i109 = shl i64 %2, 1, !dbg !2825
  %shl.i110 = and i64 %xor.i109, -1229782938247303442, !dbg !2825
  %and.i111 = lshr i64 %2, 3, !dbg !2826
  %shr.i112 = and i64 %and.i111, 1229782938247303441, !dbg !2826
  %mul.i113 = mul nuw nsw i64 %shr.i112, 3, !dbg !2827
  %xor2.i114 = xor i64 %shl.i110, %mul.i113, !dbg !2828
  %arrayidx3.i115 = getelementptr inbounds nuw i64, ptr %add.ptr3, i32 %i.0.i105, !dbg !2829
  %3 = load i64, ptr %arrayidx3.i115, align 8, !dbg !2830
  %xor4.i116 = xor i64 %3, %xor2.i114, !dbg !2830
  store i64 %xor4.i116, ptr %arrayidx3.i115, align 8, !dbg !2830
  %inc.i117 = add nuw nsw i32 %i.0.i105, 1, !dbg !2831
    #dbg_value(i32 %inc.i117, !2813, !DIExpression(), !2815)
  br label %for.cond.i104, !dbg !2832, !llvm.loop !2833

m_vec_mul_add_x.exit118:                          ; preds = %for.cond.i104
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %bins, i32 400, !dbg !2835
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %bins, i32 280, !dbg !2836
    #dbg_value(i32 %m_vec_limbs, !2775, !DIExpression(), !2837)
    #dbg_value(ptr %add.ptr4, !2779, !DIExpression(), !2837)
    #dbg_value(ptr %add.ptr5, !2780, !DIExpression(), !2837)
    #dbg_value(i64 1229782938247303441, !2781, !DIExpression(), !2837)
    #dbg_value(i32 0, !2782, !DIExpression(), !2839)
  br label %for.cond.i49, !dbg !2840

for.cond.i49:                                     ; preds = %for.body.i52, %m_vec_mul_add_x.exit118
  %i.0.i50 = phi i32 [ 0, %m_vec_mul_add_x.exit118 ], [ %inc.i61, %for.body.i52 ], !dbg !2841
    #dbg_value(i32 %i.0.i50, !2782, !DIExpression(), !2839)
  %exitcond195 = icmp ne i32 %i.0.i50, 5, !dbg !2842
  br i1 %exitcond195, label %for.body.i52, label %m_vec_mul_add_x_inv.exit62, !dbg !2843

for.body.i52:                                     ; preds = %for.cond.i49
  %arrayidx.i53 = getelementptr inbounds nuw i64, ptr %add.ptr4, i32 %i.0.i50, !dbg !2844
  %4 = load i64, ptr %arrayidx.i53, align 8, !dbg !2844
  %and.i54 = and i64 %4, 1229782938247303441, !dbg !2845
    #dbg_value(i64 %and.i54, !2793, !DIExpression(), !2846)
  %xor.i55 = lshr i64 %4, 1, !dbg !2847
  %shr.i56 = and i64 %xor.i55, 8608480567731124087, !dbg !2847
  %mul.i57 = mul nuw i64 %and.i54, 9, !dbg !2848
  %xor2.i58 = xor i64 %shr.i56, %mul.i57, !dbg !2849
  %arrayidx3.i59 = getelementptr inbounds nuw i64, ptr %add.ptr5, i32 %i.0.i50, !dbg !2850
  %5 = load i64, ptr %arrayidx3.i59, align 8, !dbg !2851
  %xor4.i60 = xor i64 %5, %xor2.i58, !dbg !2851
  store i64 %xor4.i60, ptr %arrayidx3.i59, align 8, !dbg !2851
  %inc.i61 = add nuw nsw i32 %i.0.i50, 1, !dbg !2852
    #dbg_value(i32 %inc.i61, !2782, !DIExpression(), !2839)
  br label %for.cond.i49, !dbg !2853, !llvm.loop !2854

m_vec_mul_add_x_inv.exit62:                       ; preds = %for.cond.i49
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %bins, i32 480, !dbg !2856
  %add.ptr7 = getelementptr inbounds nuw i8, ptr %bins, i32 240, !dbg !2857
    #dbg_value(i32 %m_vec_limbs, !2806, !DIExpression(), !2858)
    #dbg_value(ptr %add.ptr6, !2810, !DIExpression(), !2858)
    #dbg_value(ptr %add.ptr7, !2811, !DIExpression(), !2858)
    #dbg_value(i64 -8608480567731124088, !2812, !DIExpression(), !2858)
    #dbg_value(i32 0, !2813, !DIExpression(), !2860)
  br label %for.cond.i91, !dbg !2861

for.cond.i91:                                     ; preds = %for.body.i94, %m_vec_mul_add_x_inv.exit62
  %i.0.i92 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit62 ], [ %inc.i103, %for.body.i94 ], !dbg !2862
    #dbg_value(i32 %i.0.i92, !2813, !DIExpression(), !2860)
  %exitcond196 = icmp ne i32 %i.0.i92, 5, !dbg !2863
  br i1 %exitcond196, label %for.body.i94, label %m_vec_mul_add_x.exit, !dbg !2864

for.body.i94:                                     ; preds = %for.cond.i91
  %arrayidx.i95 = getelementptr inbounds nuw i64, ptr %add.ptr6, i32 %i.0.i92, !dbg !2865
  %6 = load i64, ptr %arrayidx.i95, align 8, !dbg !2865
    #dbg_value(i64 %6, !2823, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2866)
  %xor.i96 = shl i64 %6, 1, !dbg !2867
  %shl.i = and i64 %xor.i96, -1229782938247303442, !dbg !2867
  %and.i97 = lshr i64 %6, 3, !dbg !2868
  %shr.i98 = and i64 %and.i97, 1229782938247303441, !dbg !2868
  %mul.i99 = mul nuw nsw i64 %shr.i98, 3, !dbg !2869
  %xor2.i100 = xor i64 %shl.i, %mul.i99, !dbg !2870
  %arrayidx3.i101 = getelementptr inbounds nuw i64, ptr %add.ptr7, i32 %i.0.i92, !dbg !2871
  %7 = load i64, ptr %arrayidx3.i101, align 8, !dbg !2872
  %xor4.i102 = xor i64 %7, %xor2.i100, !dbg !2872
  store i64 %xor4.i102, ptr %arrayidx3.i101, align 8, !dbg !2872
  %inc.i103 = add nuw nsw i32 %i.0.i92, 1, !dbg !2873
    #dbg_value(i32 %inc.i103, !2813, !DIExpression(), !2860)
  br label %for.cond.i91, !dbg !2874, !llvm.loop !2875

m_vec_mul_add_x.exit:                             ; preds = %for.cond.i91
  %add.ptr8 = getelementptr inbounds nuw i8, ptr %bins, i32 280, !dbg !2877
  %add.ptr9 = getelementptr inbounds nuw i8, ptr %bins, i32 560, !dbg !2878
    #dbg_value(i32 %m_vec_limbs, !2775, !DIExpression(), !2879)
    #dbg_value(ptr %add.ptr8, !2779, !DIExpression(), !2879)
    #dbg_value(ptr %add.ptr9, !2780, !DIExpression(), !2879)
    #dbg_value(i64 1229782938247303441, !2781, !DIExpression(), !2879)
    #dbg_value(i32 0, !2782, !DIExpression(), !2881)
  br label %for.cond.i7, !dbg !2882

for.cond.i7:                                      ; preds = %for.body.i10, %m_vec_mul_add_x.exit
  %i.0.i8 = phi i32 [ 0, %m_vec_mul_add_x.exit ], [ %inc.i19, %for.body.i10 ], !dbg !2883
    #dbg_value(i32 %i.0.i8, !2782, !DIExpression(), !2881)
  %exitcond197 = icmp ne i32 %i.0.i8, 5, !dbg !2884
  br i1 %exitcond197, label %for.body.i10, label %m_vec_mul_add_x_inv.exit20, !dbg !2885

for.body.i10:                                     ; preds = %for.cond.i7
  %arrayidx.i11 = getelementptr inbounds nuw i64, ptr %add.ptr8, i32 %i.0.i8, !dbg !2886
  %8 = load i64, ptr %arrayidx.i11, align 8, !dbg !2886
  %and.i12 = and i64 %8, 1229782938247303441, !dbg !2887
    #dbg_value(i64 %and.i12, !2793, !DIExpression(), !2888)
  %xor.i13 = lshr i64 %8, 1, !dbg !2889
  %shr.i14 = and i64 %xor.i13, 8608480567731124087, !dbg !2889
  %mul.i15 = mul nuw i64 %and.i12, 9, !dbg !2890
  %xor2.i16 = xor i64 %shr.i14, %mul.i15, !dbg !2891
  %arrayidx3.i17 = getelementptr inbounds nuw i64, ptr %add.ptr9, i32 %i.0.i8, !dbg !2892
  %9 = load i64, ptr %arrayidx3.i17, align 8, !dbg !2893
  %xor4.i18 = xor i64 %9, %xor2.i16, !dbg !2893
  store i64 %xor4.i18, ptr %arrayidx3.i17, align 8, !dbg !2893
  %inc.i19 = add nuw nsw i32 %i.0.i8, 1, !dbg !2894
    #dbg_value(i32 %inc.i19, !2782, !DIExpression(), !2881)
  br label %for.cond.i7, !dbg !2895, !llvm.loop !2896

m_vec_mul_add_x_inv.exit20:                       ; preds = %for.cond.i7
  %add.ptr10 = getelementptr inbounds nuw i8, ptr %bins, i32 240, !dbg !2898
  %add.ptr11 = getelementptr inbounds nuw i8, ptr %bins, i32 120, !dbg !2899
    #dbg_value(i32 %m_vec_limbs, !2806, !DIExpression(), !2900)
    #dbg_value(ptr %add.ptr10, !2810, !DIExpression(), !2900)
    #dbg_value(ptr %add.ptr11, !2811, !DIExpression(), !2900)
    #dbg_value(i64 -8608480567731124088, !2812, !DIExpression(), !2900)
    #dbg_value(i32 0, !2813, !DIExpression(), !2902)
  br label %for.cond.i149, !dbg !2903

for.cond.i149:                                    ; preds = %for.body.i152, %m_vec_mul_add_x_inv.exit20
  %i.0.i150 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit20 ], [ %inc.i162, %for.body.i152 ], !dbg !2904
    #dbg_value(i32 %i.0.i150, !2813, !DIExpression(), !2902)
  %exitcond198 = icmp ne i32 %i.0.i150, 5, !dbg !2905
  br i1 %exitcond198, label %for.body.i152, label %m_vec_mul_add_x.exit163, !dbg !2906

for.body.i152:                                    ; preds = %for.cond.i149
  %arrayidx.i153 = getelementptr inbounds nuw i64, ptr %add.ptr10, i32 %i.0.i150, !dbg !2907
  %10 = load i64, ptr %arrayidx.i153, align 8, !dbg !2907
    #dbg_value(i64 %10, !2823, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2908)
  %xor.i154 = shl i64 %10, 1, !dbg !2909
  %shl.i155 = and i64 %xor.i154, -1229782938247303442, !dbg !2909
  %and.i156 = lshr i64 %10, 3, !dbg !2910
  %shr.i157 = and i64 %and.i156, 1229782938247303441, !dbg !2910
  %mul.i158 = mul nuw nsw i64 %shr.i157, 3, !dbg !2911
  %xor2.i159 = xor i64 %shl.i155, %mul.i158, !dbg !2912
  %arrayidx3.i160 = getelementptr inbounds nuw i64, ptr %add.ptr11, i32 %i.0.i150, !dbg !2913
  %11 = load i64, ptr %arrayidx3.i160, align 8, !dbg !2914
  %xor4.i161 = xor i64 %11, %xor2.i159, !dbg !2914
  store i64 %xor4.i161, ptr %arrayidx3.i160, align 8, !dbg !2914
  %inc.i162 = add nuw nsw i32 %i.0.i150, 1, !dbg !2915
    #dbg_value(i32 %inc.i162, !2813, !DIExpression(), !2902)
  br label %for.cond.i149, !dbg !2916, !llvm.loop !2917

m_vec_mul_add_x.exit163:                          ; preds = %for.cond.i149
  %add.ptr12 = getelementptr inbounds nuw i8, ptr %bins, i32 560, !dbg !2919
  %add.ptr13 = getelementptr inbounds nuw i8, ptr %bins, i32 600, !dbg !2920
    #dbg_value(i32 %m_vec_limbs, !2775, !DIExpression(), !2921)
    #dbg_value(ptr %add.ptr12, !2779, !DIExpression(), !2921)
    #dbg_value(ptr %add.ptr13, !2780, !DIExpression(), !2921)
    #dbg_value(i64 1229782938247303441, !2781, !DIExpression(), !2921)
    #dbg_value(i32 0, !2782, !DIExpression(), !2923)
  br label %for.cond.i63, !dbg !2924

for.cond.i63:                                     ; preds = %for.body.i66, %m_vec_mul_add_x.exit163
  %i.0.i64 = phi i32 [ 0, %m_vec_mul_add_x.exit163 ], [ %inc.i75, %for.body.i66 ], !dbg !2925
    #dbg_value(i32 %i.0.i64, !2782, !DIExpression(), !2923)
  %exitcond199 = icmp ne i32 %i.0.i64, 5, !dbg !2926
  br i1 %exitcond199, label %for.body.i66, label %m_vec_mul_add_x_inv.exit76, !dbg !2927

for.body.i66:                                     ; preds = %for.cond.i63
  %arrayidx.i67 = getelementptr inbounds nuw i64, ptr %add.ptr12, i32 %i.0.i64, !dbg !2928
  %12 = load i64, ptr %arrayidx.i67, align 8, !dbg !2928
  %and.i68 = and i64 %12, 1229782938247303441, !dbg !2929
    #dbg_value(i64 %and.i68, !2793, !DIExpression(), !2930)
  %xor.i69 = lshr i64 %12, 1, !dbg !2931
  %shr.i70 = and i64 %xor.i69, 8608480567731124087, !dbg !2931
  %mul.i71 = mul nuw i64 %and.i68, 9, !dbg !2932
  %xor2.i72 = xor i64 %shr.i70, %mul.i71, !dbg !2933
  %arrayidx3.i73 = getelementptr inbounds nuw i64, ptr %add.ptr13, i32 %i.0.i64, !dbg !2934
  %13 = load i64, ptr %arrayidx3.i73, align 8, !dbg !2935
  %xor4.i74 = xor i64 %13, %xor2.i72, !dbg !2935
  store i64 %xor4.i74, ptr %arrayidx3.i73, align 8, !dbg !2935
  %inc.i75 = add nuw nsw i32 %i.0.i64, 1, !dbg !2936
    #dbg_value(i32 %inc.i75, !2782, !DIExpression(), !2923)
  br label %for.cond.i63, !dbg !2937, !llvm.loop !2938

m_vec_mul_add_x_inv.exit76:                       ; preds = %for.cond.i63
  %add.ptr14 = getelementptr inbounds nuw i8, ptr %bins, i32 120, !dbg !2940
  %add.ptr15 = getelementptr inbounds nuw i8, ptr %bins, i32 320, !dbg !2941
    #dbg_value(i32 %m_vec_limbs, !2806, !DIExpression(), !2942)
    #dbg_value(ptr %add.ptr14, !2810, !DIExpression(), !2942)
    #dbg_value(ptr %add.ptr15, !2811, !DIExpression(), !2942)
    #dbg_value(i64 -8608480567731124088, !2812, !DIExpression(), !2942)
    #dbg_value(i32 0, !2813, !DIExpression(), !2944)
  br label %for.cond.i119, !dbg !2945

for.cond.i119:                                    ; preds = %for.body.i122, %m_vec_mul_add_x_inv.exit76
  %i.0.i120 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit76 ], [ %inc.i132, %for.body.i122 ], !dbg !2946
    #dbg_value(i32 %i.0.i120, !2813, !DIExpression(), !2944)
  %exitcond200 = icmp ne i32 %i.0.i120, 5, !dbg !2947
  br i1 %exitcond200, label %for.body.i122, label %m_vec_mul_add_x.exit133, !dbg !2948

for.body.i122:                                    ; preds = %for.cond.i119
  %arrayidx.i123 = getelementptr inbounds nuw i64, ptr %add.ptr14, i32 %i.0.i120, !dbg !2949
  %14 = load i64, ptr %arrayidx.i123, align 8, !dbg !2949
    #dbg_value(i64 %14, !2823, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2950)
  %xor.i124 = shl i64 %14, 1, !dbg !2951
  %shl.i125 = and i64 %xor.i124, -1229782938247303442, !dbg !2951
  %and.i126 = lshr i64 %14, 3, !dbg !2952
  %shr.i127 = and i64 %and.i126, 1229782938247303441, !dbg !2952
  %mul.i128 = mul nuw nsw i64 %shr.i127, 3, !dbg !2953
  %xor2.i129 = xor i64 %shl.i125, %mul.i128, !dbg !2954
  %arrayidx3.i130 = getelementptr inbounds nuw i64, ptr %add.ptr15, i32 %i.0.i120, !dbg !2955
  %15 = load i64, ptr %arrayidx3.i130, align 8, !dbg !2956
  %xor4.i131 = xor i64 %15, %xor2.i129, !dbg !2956
  store i64 %xor4.i131, ptr %arrayidx3.i130, align 8, !dbg !2956
  %inc.i132 = add nuw nsw i32 %i.0.i120, 1, !dbg !2957
    #dbg_value(i32 %inc.i132, !2813, !DIExpression(), !2944)
  br label %for.cond.i119, !dbg !2958, !llvm.loop !2959

m_vec_mul_add_x.exit133:                          ; preds = %for.cond.i119
  %add.ptr16 = getelementptr inbounds nuw i8, ptr %bins, i32 600, !dbg !2961
  %add.ptr17 = getelementptr inbounds nuw i8, ptr %bins, i32 520, !dbg !2962
    #dbg_value(i32 %m_vec_limbs, !2775, !DIExpression(), !2963)
    #dbg_value(ptr %add.ptr16, !2779, !DIExpression(), !2963)
    #dbg_value(ptr %add.ptr17, !2780, !DIExpression(), !2963)
    #dbg_value(i64 1229782938247303441, !2781, !DIExpression(), !2963)
    #dbg_value(i32 0, !2782, !DIExpression(), !2965)
  br label %for.cond.i1, !dbg !2966

for.cond.i1:                                      ; preds = %for.body.i4, %m_vec_mul_add_x.exit133
  %i.0.i2 = phi i32 [ 0, %m_vec_mul_add_x.exit133 ], [ %inc.i6, %for.body.i4 ], !dbg !2967
    #dbg_value(i32 %i.0.i2, !2782, !DIExpression(), !2965)
  %exitcond201 = icmp ne i32 %i.0.i2, 5, !dbg !2968
  br i1 %exitcond201, label %for.body.i4, label %m_vec_mul_add_x_inv.exit, !dbg !2969

for.body.i4:                                      ; preds = %for.cond.i1
  %arrayidx.i5 = getelementptr inbounds nuw i64, ptr %add.ptr16, i32 %i.0.i2, !dbg !2970
  %16 = load i64, ptr %arrayidx.i5, align 8, !dbg !2970
  %and.i = and i64 %16, 1229782938247303441, !dbg !2971
    #dbg_value(i64 %and.i, !2793, !DIExpression(), !2972)
  %xor.i = lshr i64 %16, 1, !dbg !2973
  %shr.i = and i64 %xor.i, 8608480567731124087, !dbg !2973
  %mul.i = mul nuw i64 %and.i, 9, !dbg !2974
  %xor2.i = xor i64 %shr.i, %mul.i, !dbg !2975
  %arrayidx3.i = getelementptr inbounds nuw i64, ptr %add.ptr17, i32 %i.0.i2, !dbg !2976
  %17 = load i64, ptr %arrayidx3.i, align 8, !dbg !2977
  %xor4.i = xor i64 %17, %xor2.i, !dbg !2977
  store i64 %xor4.i, ptr %arrayidx3.i, align 8, !dbg !2977
  %inc.i6 = add nuw nsw i32 %i.0.i2, 1, !dbg !2978
    #dbg_value(i32 %inc.i6, !2782, !DIExpression(), !2965)
  br label %for.cond.i1, !dbg !2979, !llvm.loop !2980

m_vec_mul_add_x_inv.exit:                         ; preds = %for.cond.i1
  %add.ptr18 = getelementptr inbounds nuw i8, ptr %bins, i32 320, !dbg !2982
  %add.ptr19 = getelementptr inbounds nuw i8, ptr %bins, i32 160, !dbg !2983
    #dbg_value(i32 %m_vec_limbs, !2806, !DIExpression(), !2984)
    #dbg_value(ptr %add.ptr18, !2810, !DIExpression(), !2984)
    #dbg_value(ptr %add.ptr19, !2811, !DIExpression(), !2984)
    #dbg_value(i64 -8608480567731124088, !2812, !DIExpression(), !2984)
    #dbg_value(i32 0, !2813, !DIExpression(), !2986)
  br label %for.cond.i134, !dbg !2987

for.cond.i134:                                    ; preds = %for.body.i137, %m_vec_mul_add_x_inv.exit
  %i.0.i135 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit ], [ %inc.i147, %for.body.i137 ], !dbg !2988
    #dbg_value(i32 %i.0.i135, !2813, !DIExpression(), !2986)
  %exitcond202 = icmp ne i32 %i.0.i135, 5, !dbg !2989
  br i1 %exitcond202, label %for.body.i137, label %m_vec_mul_add_x.exit148, !dbg !2990

for.body.i137:                                    ; preds = %for.cond.i134
  %arrayidx.i138 = getelementptr inbounds nuw i64, ptr %add.ptr18, i32 %i.0.i135, !dbg !2991
  %18 = load i64, ptr %arrayidx.i138, align 8, !dbg !2991
    #dbg_value(i64 %18, !2823, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2992)
  %xor.i139 = shl i64 %18, 1, !dbg !2993
  %shl.i140 = and i64 %xor.i139, -1229782938247303442, !dbg !2993
  %and.i141 = lshr i64 %18, 3, !dbg !2994
  %shr.i142 = and i64 %and.i141, 1229782938247303441, !dbg !2994
  %mul.i143 = mul nuw nsw i64 %shr.i142, 3, !dbg !2995
  %xor2.i144 = xor i64 %shl.i140, %mul.i143, !dbg !2996
  %arrayidx3.i145 = getelementptr inbounds nuw i64, ptr %add.ptr19, i32 %i.0.i135, !dbg !2997
  %19 = load i64, ptr %arrayidx3.i145, align 8, !dbg !2998
  %xor4.i146 = xor i64 %19, %xor2.i144, !dbg !2998
  store i64 %xor4.i146, ptr %arrayidx3.i145, align 8, !dbg !2998
  %inc.i147 = add nuw nsw i32 %i.0.i135, 1, !dbg !2999
    #dbg_value(i32 %inc.i147, !2813, !DIExpression(), !2986)
  br label %for.cond.i134, !dbg !3000, !llvm.loop !3001

m_vec_mul_add_x.exit148:                          ; preds = %for.cond.i134
  %add.ptr20 = getelementptr inbounds nuw i8, ptr %bins, i32 520, !dbg !3003
  %add.ptr21 = getelementptr inbounds nuw i8, ptr %bins, i32 360, !dbg !3004
    #dbg_value(i32 %m_vec_limbs, !2775, !DIExpression(), !3005)
    #dbg_value(ptr %add.ptr20, !2779, !DIExpression(), !3005)
    #dbg_value(ptr %add.ptr21, !2780, !DIExpression(), !3005)
    #dbg_value(i64 1229782938247303441, !2781, !DIExpression(), !3005)
    #dbg_value(i32 0, !2782, !DIExpression(), !3007)
  br label %for.cond.i35, !dbg !3008

for.cond.i35:                                     ; preds = %for.body.i38, %m_vec_mul_add_x.exit148
  %i.0.i36 = phi i32 [ 0, %m_vec_mul_add_x.exit148 ], [ %inc.i47, %for.body.i38 ], !dbg !3009
    #dbg_value(i32 %i.0.i36, !2782, !DIExpression(), !3007)
  %exitcond203 = icmp ne i32 %i.0.i36, 5, !dbg !3010
  br i1 %exitcond203, label %for.body.i38, label %m_vec_mul_add_x_inv.exit48, !dbg !3011

for.body.i38:                                     ; preds = %for.cond.i35
  %arrayidx.i39 = getelementptr inbounds nuw i64, ptr %add.ptr20, i32 %i.0.i36, !dbg !3012
  %20 = load i64, ptr %arrayidx.i39, align 8, !dbg !3012
  %and.i40 = and i64 %20, 1229782938247303441, !dbg !3013
    #dbg_value(i64 %and.i40, !2793, !DIExpression(), !3014)
  %xor.i41 = lshr i64 %20, 1, !dbg !3015
  %shr.i42 = and i64 %xor.i41, 8608480567731124087, !dbg !3015
  %mul.i43 = mul nuw i64 %and.i40, 9, !dbg !3016
  %xor2.i44 = xor i64 %shr.i42, %mul.i43, !dbg !3017
  %arrayidx3.i45 = getelementptr inbounds nuw i64, ptr %add.ptr21, i32 %i.0.i36, !dbg !3018
  %21 = load i64, ptr %arrayidx3.i45, align 8, !dbg !3019
  %xor4.i46 = xor i64 %21, %xor2.i44, !dbg !3019
  store i64 %xor4.i46, ptr %arrayidx3.i45, align 8, !dbg !3019
  %inc.i47 = add nuw nsw i32 %i.0.i36, 1, !dbg !3020
    #dbg_value(i32 %inc.i47, !2782, !DIExpression(), !3007)
  br label %for.cond.i35, !dbg !3021, !llvm.loop !3022

m_vec_mul_add_x_inv.exit48:                       ; preds = %for.cond.i35
  %add.ptr22 = getelementptr inbounds nuw i8, ptr %bins, i32 160, !dbg !3024
  %add.ptr23 = getelementptr inbounds nuw i8, ptr %bins, i32 80, !dbg !3025
    #dbg_value(i32 %m_vec_limbs, !2806, !DIExpression(), !3026)
    #dbg_value(ptr %add.ptr22, !2810, !DIExpression(), !3026)
    #dbg_value(ptr %add.ptr23, !2811, !DIExpression(), !3026)
    #dbg_value(i64 -8608480567731124088, !2812, !DIExpression(), !3026)
    #dbg_value(i32 0, !2813, !DIExpression(), !3028)
  br label %for.cond.i179, !dbg !3029

for.cond.i179:                                    ; preds = %for.body.i182, %m_vec_mul_add_x_inv.exit48
  %i.0.i180 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit48 ], [ %inc.i192, %for.body.i182 ], !dbg !3030
    #dbg_value(i32 %i.0.i180, !2813, !DIExpression(), !3028)
  %exitcond204 = icmp ne i32 %i.0.i180, 5, !dbg !3031
  br i1 %exitcond204, label %for.body.i182, label %m_vec_mul_add_x.exit193, !dbg !3032

for.body.i182:                                    ; preds = %for.cond.i179
  %arrayidx.i183 = getelementptr inbounds nuw i64, ptr %add.ptr22, i32 %i.0.i180, !dbg !3033
  %22 = load i64, ptr %arrayidx.i183, align 8, !dbg !3033
    #dbg_value(i64 %22, !2823, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !3034)
  %xor.i184 = shl i64 %22, 1, !dbg !3035
  %shl.i185 = and i64 %xor.i184, -1229782938247303442, !dbg !3035
  %and.i186 = lshr i64 %22, 3, !dbg !3036
  %shr.i187 = and i64 %and.i186, 1229782938247303441, !dbg !3036
  %mul.i188 = mul nuw nsw i64 %shr.i187, 3, !dbg !3037
  %xor2.i189 = xor i64 %shl.i185, %mul.i188, !dbg !3038
  %arrayidx3.i190 = getelementptr inbounds nuw i64, ptr %add.ptr23, i32 %i.0.i180, !dbg !3039
  %23 = load i64, ptr %arrayidx3.i190, align 8, !dbg !3040
  %xor4.i191 = xor i64 %23, %xor2.i189, !dbg !3040
  store i64 %xor4.i191, ptr %arrayidx3.i190, align 8, !dbg !3040
  %inc.i192 = add nuw nsw i32 %i.0.i180, 1, !dbg !3041
    #dbg_value(i32 %inc.i192, !2813, !DIExpression(), !3028)
  br label %for.cond.i179, !dbg !3042, !llvm.loop !3043

m_vec_mul_add_x.exit193:                          ; preds = %for.cond.i179
  %add.ptr24 = getelementptr inbounds nuw i8, ptr %bins, i32 360, !dbg !3045
  %add.ptr25 = getelementptr inbounds nuw i8, ptr %bins, i32 40, !dbg !3046
    #dbg_value(i32 %m_vec_limbs, !2775, !DIExpression(), !3047)
    #dbg_value(ptr %add.ptr24, !2779, !DIExpression(), !3047)
    #dbg_value(ptr %add.ptr25, !2780, !DIExpression(), !3047)
    #dbg_value(i64 1229782938247303441, !2781, !DIExpression(), !3047)
    #dbg_value(i32 0, !2782, !DIExpression(), !3049)
  br label %for.cond.i21, !dbg !3050

for.cond.i21:                                     ; preds = %for.body.i24, %m_vec_mul_add_x.exit193
  %i.0.i22 = phi i32 [ 0, %m_vec_mul_add_x.exit193 ], [ %inc.i33, %for.body.i24 ], !dbg !3051
    #dbg_value(i32 %i.0.i22, !2782, !DIExpression(), !3049)
  %exitcond205 = icmp ne i32 %i.0.i22, 5, !dbg !3052
  br i1 %exitcond205, label %for.body.i24, label %m_vec_mul_add_x_inv.exit34, !dbg !3053

for.body.i24:                                     ; preds = %for.cond.i21
  %arrayidx.i25 = getelementptr inbounds nuw i64, ptr %add.ptr24, i32 %i.0.i22, !dbg !3054
  %24 = load i64, ptr %arrayidx.i25, align 8, !dbg !3054
  %and.i26 = and i64 %24, 1229782938247303441, !dbg !3055
    #dbg_value(i64 %and.i26, !2793, !DIExpression(), !3056)
  %xor.i27 = lshr i64 %24, 1, !dbg !3057
  %shr.i28 = and i64 %xor.i27, 8608480567731124087, !dbg !3057
  %mul.i29 = mul nuw i64 %and.i26, 9, !dbg !3058
  %xor2.i30 = xor i64 %shr.i28, %mul.i29, !dbg !3059
  %arrayidx3.i31 = getelementptr inbounds nuw i64, ptr %add.ptr25, i32 %i.0.i22, !dbg !3060
  %25 = load i64, ptr %arrayidx3.i31, align 8, !dbg !3061
  %xor4.i32 = xor i64 %25, %xor2.i30, !dbg !3061
  store i64 %xor4.i32, ptr %arrayidx3.i31, align 8, !dbg !3061
  %inc.i33 = add nuw nsw i32 %i.0.i22, 1, !dbg !3062
    #dbg_value(i32 %inc.i33, !2782, !DIExpression(), !3049)
  br label %for.cond.i21, !dbg !3063, !llvm.loop !3064

m_vec_mul_add_x_inv.exit34:                       ; preds = %for.cond.i21
  %add.ptr26 = getelementptr inbounds nuw i8, ptr %bins, i32 80, !dbg !3066
  %add.ptr27 = getelementptr inbounds nuw i8, ptr %bins, i32 40, !dbg !3067
    #dbg_value(i32 %m_vec_limbs, !2806, !DIExpression(), !3068)
    #dbg_value(ptr %add.ptr26, !2810, !DIExpression(), !3068)
    #dbg_value(ptr %add.ptr27, !2811, !DIExpression(), !3068)
    #dbg_value(i64 -8608480567731124088, !2812, !DIExpression(), !3068)
    #dbg_value(i32 0, !2813, !DIExpression(), !3070)
  br label %for.cond.i164, !dbg !3071

for.cond.i164:                                    ; preds = %for.body.i167, %m_vec_mul_add_x_inv.exit34
  %i.0.i165 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit34 ], [ %inc.i177, %for.body.i167 ], !dbg !3072
    #dbg_value(i32 %i.0.i165, !2813, !DIExpression(), !3070)
  %exitcond206 = icmp ne i32 %i.0.i165, 5, !dbg !3073
  br i1 %exitcond206, label %for.body.i167, label %m_vec_mul_add_x.exit178, !dbg !3074

for.body.i167:                                    ; preds = %for.cond.i164
  %arrayidx.i168 = getelementptr inbounds nuw i64, ptr %add.ptr26, i32 %i.0.i165, !dbg !3075
  %26 = load i64, ptr %arrayidx.i168, align 8, !dbg !3075
    #dbg_value(i64 %26, !2823, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !3076)
  %xor.i169 = shl i64 %26, 1, !dbg !3077
  %shl.i170 = and i64 %xor.i169, -1229782938247303442, !dbg !3077
  %and.i171 = lshr i64 %26, 3, !dbg !3078
  %shr.i172 = and i64 %and.i171, 1229782938247303441, !dbg !3078
  %mul.i173 = mul nuw nsw i64 %shr.i172, 3, !dbg !3079
  %xor2.i174 = xor i64 %shl.i170, %mul.i173, !dbg !3080
  %arrayidx3.i175 = getelementptr inbounds nuw i64, ptr %add.ptr27, i32 %i.0.i165, !dbg !3081
  %27 = load i64, ptr %arrayidx3.i175, align 8, !dbg !3082
  %xor4.i176 = xor i64 %27, %xor2.i174, !dbg !3082
  store i64 %xor4.i176, ptr %arrayidx3.i175, align 8, !dbg !3082
  %inc.i177 = add nuw nsw i32 %i.0.i165, 1, !dbg !3083
    #dbg_value(i32 %inc.i177, !2813, !DIExpression(), !3070)
  br label %for.cond.i164, !dbg !3084, !llvm.loop !3085

m_vec_mul_add_x.exit178:                          ; preds = %for.cond.i164
  %add.ptr28 = getelementptr inbounds nuw i8, ptr %bins, i32 40, !dbg !3087
    #dbg_value(i32 %m_vec_limbs, !3088, !DIExpression(), !3090)
    #dbg_value(ptr %add.ptr28, !3092, !DIExpression(), !3090)
    #dbg_value(ptr %out, !3093, !DIExpression(), !3090)
    #dbg_value(i32 0, !3094, !DIExpression(), !3096)
  br label %for.cond.i, !dbg !3097

for.cond.i:                                       ; preds = %for.body.i, %m_vec_mul_add_x.exit178
  %i.0.i = phi i32 [ 0, %m_vec_mul_add_x.exit178 ], [ %inc.i, %for.body.i ], !dbg !3098
    #dbg_value(i32 %i.0.i, !3094, !DIExpression(), !3096)
  %exitcond207 = icmp ne i32 %i.0.i, 5, !dbg !3099
  br i1 %exitcond207, label %for.body.i, label %m_vec_copy.exit, !dbg !3101

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %add.ptr28, i32 %i.0.i, !dbg !3102
  %28 = load i64, ptr %arrayidx.i, align 8, !dbg !3102
  %arrayidx1.i = getelementptr inbounds nuw i64, ptr %out, i32 %i.0.i, !dbg !3104
  store i64 %28, ptr %arrayidx1.i, align 8, !dbg !3105
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !3106
    #dbg_value(i32 %inc.i, !3094, !DIExpression(), !3096)
  br label %for.cond.i, !dbg !3107, !llvm.loop !3108

m_vec_copy.exit:                                  ; preds = %for.cond.i
  ret void, !dbg !3110
}

; Function Attrs: nounwind
define dso_local void @pqmayo_MAYO_1_ref_m_upper(ptr noundef %p, ptr noundef %in, ptr noundef %out, i32 noundef %size) local_unnamed_addr #0 !dbg !3111 {
entry:
    #dbg_value(ptr %p, !3142, !DIExpression(), !3143)
    #dbg_value(ptr %in, !3144, !DIExpression(), !3143)
    #dbg_value(ptr %out, !3145, !DIExpression(), !3143)
    #dbg_value(i32 %size, !3146, !DIExpression(), !3143)
    #dbg_value(i32 5, !3147, !DIExpression(), !3143)
    #dbg_value(i32 0, !3148, !DIExpression(), !3143)
    #dbg_value(i32 0, !3149, !DIExpression(), !3151)
  %smax = call i32 @llvm.smax.i32(i32 %size, i32 0), !dbg !3152
  br label %for.cond, !dbg !3152

for.cond:                                         ; preds = %for.inc15, %entry
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc15 ], [ %size, %entry ], !dbg !3153
  %m_vecs_stored.0 = phi i32 [ 0, %entry ], [ %m_vecs_stored.1.lcssa, %for.inc15 ], !dbg !3153
  %r.0 = phi i32 [ 0, %entry ], [ %inc16, %for.inc15 ], !dbg !3154
    #dbg_value(i32 %r.0, !3149, !DIExpression(), !3151)
    #dbg_value(i32 %m_vecs_stored.0, !3148, !DIExpression(), !3143)
  %exitcond10 = icmp ne i32 %r.0, %smax, !dbg !3155
  br i1 %exitcond10, label %for.cond1.preheader, label %for.end17, !dbg !3157

for.cond1.preheader:                              ; preds = %for.cond
  %0 = add i32 %m_vecs_stored.0, %indvars.iv, !dbg !3158
  br label %for.cond1, !dbg !3158

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc
  %m_vecs_stored.1 = phi i32 [ %inc, %for.inc ], [ %m_vecs_stored.0, %for.cond1.preheader ], !dbg !3143
  %c.0 = phi i32 [ %inc14, %for.inc ], [ %r.0, %for.cond1.preheader ], !dbg !3161
    #dbg_value(i32 %c.0, !3162, !DIExpression(), !3163)
    #dbg_value(i32 %m_vecs_stored.1, !3148, !DIExpression(), !3143)
  %exitcond9 = icmp ne i32 %m_vecs_stored.1, %0, !dbg !3164
  br i1 %exitcond9, label %for.body3, label %for.inc15, !dbg !3158

for.body3:                                        ; preds = %for.cond1
  %mul = mul nsw i32 %r.0, %size, !dbg !3166
  %add = add nsw i32 %mul, %c.0, !dbg !3168
  %add.ptr.idx = mul nsw i32 %add, 40, !dbg !3169
  %add.ptr = getelementptr inbounds i8, ptr %in, i32 %add.ptr.idx, !dbg !3169
  %add.ptr6.idx = mul nsw i32 %m_vecs_stored.1, 40, !dbg !3170
  %add.ptr6 = getelementptr inbounds i8, ptr %out, i32 %add.ptr6.idx, !dbg !3170
    #dbg_value(i32 5, !3171, !DIExpression(), !3173)
    #dbg_value(ptr %add.ptr, !3175, !DIExpression(), !3173)
    #dbg_value(ptr %add.ptr6, !3176, !DIExpression(), !3173)
    #dbg_value(i32 0, !3177, !DIExpression(), !3179)
  br label %for.cond.i, !dbg !3180

for.cond.i:                                       ; preds = %for.body.i, %for.body3
  %i.0.i = phi i32 [ 0, %for.body3 ], [ %inc.i, %for.body.i ], !dbg !3181
    #dbg_value(i32 %i.0.i, !3177, !DIExpression(), !3179)
  %exitcond = icmp ne i32 %i.0.i, 5, !dbg !3182
  br i1 %exitcond, label %for.body.i, label %m_vec_copy.17.exit, !dbg !3184

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %add.ptr, i32 %i.0.i, !dbg !3185
  %1 = load i64, ptr %arrayidx.i, align 8, !dbg !3185
  %arrayidx1.i = getelementptr inbounds nuw i64, ptr %add.ptr6, i32 %i.0.i, !dbg !3187
  store i64 %1, ptr %arrayidx1.i, align 8, !dbg !3188
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !3189
    #dbg_value(i32 %inc.i, !3177, !DIExpression(), !3179)
  br label %for.cond.i, !dbg !3190, !llvm.loop !3191

m_vec_copy.17.exit:                               ; preds = %for.cond.i
  %cmp7.not = icmp eq i32 %r.0, %c.0, !dbg !3193
  br i1 %cmp7.not, label %for.inc, label %if.then, !dbg !3193

if.then:                                          ; preds = %m_vec_copy.17.exit
  %mul8 = mul nsw i32 %c.0, %size, !dbg !3195
  %add9 = add nsw i32 %mul8, %r.0, !dbg !3197
  %add.ptr11.idx = mul nsw i32 %add9, 40, !dbg !3198
  %add.ptr11 = getelementptr inbounds i8, ptr %in, i32 %add.ptr11.idx, !dbg !3198
  %add.ptr13.idx = mul nsw i32 %m_vecs_stored.1, 40, !dbg !3199
  %add.ptr13 = getelementptr inbounds i8, ptr %out, i32 %add.ptr13.idx, !dbg !3199
    #dbg_value(i32 5, !3200, !DIExpression(), !3202)
    #dbg_value(ptr %add.ptr11, !3204, !DIExpression(), !3202)
    #dbg_value(ptr %add.ptr13, !3205, !DIExpression(), !3202)
    #dbg_value(i32 0, !3206, !DIExpression(), !3208)
  br label %for.cond.i1, !dbg !3209

for.cond.i1:                                      ; preds = %for.body.i4, %if.then
  %i.0.i2 = phi i32 [ 0, %if.then ], [ %inc.i7, %for.body.i4 ], !dbg !3210
    #dbg_value(i32 %i.0.i2, !3206, !DIExpression(), !3208)
  %exitcond8 = icmp ne i32 %i.0.i2, 5, !dbg !3211
  br i1 %exitcond8, label %for.body.i4, label %for.inc.loopexit, !dbg !3213

for.body.i4:                                      ; preds = %for.cond.i1
  %arrayidx.i5 = getelementptr inbounds nuw i64, ptr %add.ptr11, i32 %i.0.i2, !dbg !3214
  %2 = load i64, ptr %arrayidx.i5, align 8, !dbg !3214
  %arrayidx1.i6 = getelementptr inbounds nuw i64, ptr %add.ptr13, i32 %i.0.i2, !dbg !3216
  %3 = load i64, ptr %arrayidx1.i6, align 8, !dbg !3217
  %xor.i = xor i64 %3, %2, !dbg !3217
  store i64 %xor.i, ptr %arrayidx1.i6, align 8, !dbg !3217
  %inc.i7 = add nuw nsw i32 %i.0.i2, 1, !dbg !3218
    #dbg_value(i32 %inc.i7, !3206, !DIExpression(), !3208)
  br label %for.cond.i1, !dbg !3219, !llvm.loop !3220

for.inc.loopexit:                                 ; preds = %for.cond.i1
  br label %for.inc, !dbg !3222

for.inc:                                          ; preds = %for.inc.loopexit, %m_vec_copy.17.exit
    #dbg_value(i32 %m_vecs_stored.1, !3148, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !3143)
  %inc = add i32 %m_vecs_stored.1, 1, !dbg !3222
    #dbg_value(i32 %inc, !3148, !DIExpression(), !3143)
  %inc14 = add nuw nsw i32 %c.0, 1, !dbg !3223
    #dbg_value(i32 %inc14, !3162, !DIExpression(), !3163)
  br label %for.cond1, !dbg !3224, !llvm.loop !3225

for.inc15:                                        ; preds = %for.cond1
  %m_vecs_stored.1.lcssa = phi i32 [ %m_vecs_stored.1, %for.cond1 ], !dbg !3143
  %inc16 = add nuw i32 %r.0, 1, !dbg !3227
    #dbg_value(i32 %inc16, !3149, !DIExpression(), !3151)
  %indvars.iv.next = add i32 %indvars.iv, -1, !dbg !3228
  br label %for.cond, !dbg !3228, !llvm.loop !3229

for.end17:                                        ; preds = %for.cond
  ret void, !dbg !3231
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_1_ref_sample_solution(ptr noundef %p, ptr noundef %A, ptr noundef %y, ptr noundef %r, ptr noundef %x, i32 noundef %k, i32 noundef %o, i32 noundef %m, i32 noundef %A_cols) local_unnamed_addr #0 !dbg !3232 {
entry:
  %_pivot_row.i = alloca [6 x i64], align 32
  %_pivot_row2.i = alloca [6 x i64], align 32
  %packed_A.i = alloca [468 x i64], align 32
  %temp.i = alloca [96 x i8], align 1
  %Ar = alloca [78 x i8], align 1
    #dbg_value(ptr %p, !3235, !DIExpression(), !3236)
    #dbg_value(ptr %A, !3237, !DIExpression(), !3236)
    #dbg_value(ptr %y, !3238, !DIExpression(), !3236)
    #dbg_value(ptr %r, !3239, !DIExpression(), !3236)
    #dbg_value(ptr %x, !3240, !DIExpression(), !3236)
    #dbg_value(i32 %k, !3241, !DIExpression(), !3236)
    #dbg_value(i32 %o, !3242, !DIExpression(), !3236)
    #dbg_value(i32 %m, !3243, !DIExpression(), !3236)
    #dbg_value(i32 %A_cols, !3244, !DIExpression(), !3236)
    #dbg_value(i32 0, !3245, !DIExpression(), !3247)
  %0 = mul nsw i32 %o, %k, !dbg !3248
  %smax = call i32 @llvm.smax.i32(i32 %0, i32 0), !dbg !3248
  br label %for.cond, !dbg !3248

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !3249
    #dbg_value(i32 %i.0, !3245, !DIExpression(), !3247)
  %exitcond = icmp ne i32 %i.0, %smax, !dbg !3250
  br i1 %exitcond, label %for.body, label %for.cond3.preheader, !dbg !3252

for.cond3.preheader:                              ; preds = %for.cond
  %smax37 = call i32 @llvm.smax.i32(i32 %m, i32 0), !dbg !3253
  br label %for.cond3, !dbg !3253

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !3255
  %1 = load i8, ptr %arrayidx, align 1, !dbg !3255
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !3257
  store i8 %1, ptr %arrayidx1, align 1, !dbg !3258
  %inc = add nuw i32 %i.0, 1, !dbg !3259
    #dbg_value(i32 %inc, !3245, !DIExpression(), !3247)
  br label %for.cond, !dbg !3260, !llvm.loop !3261

for.cond3:                                        ; preds = %for.cond3.preheader, %for.body5
  %i2.0 = phi i32 [ %inc12, %for.body5 ], [ 0, %for.cond3.preheader ], !dbg !3263
    #dbg_value(i32 %i2.0, !3264, !DIExpression(), !3265)
  %exitcond38 = icmp ne i32 %i2.0, %smax37, !dbg !3266
  br i1 %exitcond38, label %for.body5, label %for.end13, !dbg !3253

for.body5:                                        ; preds = %for.cond3
  %mul6 = mul nsw i32 %k, %o, !dbg !3268
  %mul7 = mul nsw i32 %k, %o, !dbg !3270
  %add = add nsw i32 %mul7, 1, !dbg !3271
  %mul8 = mul nsw i32 %i2.0, %add, !dbg !3272
  %2 = getelementptr i8, ptr %A, i32 %mul6, !dbg !3273
  %arrayidx10 = getelementptr i8, ptr %2, i32 %mul8, !dbg !3273
  store i8 0, ptr %arrayidx10, align 1, !dbg !3274
  %inc12 = add nuw i32 %i2.0, 1, !dbg !3275
    #dbg_value(i32 %inc12, !3264, !DIExpression(), !3265)
  br label %for.cond3, !dbg !3276, !llvm.loop !3277

for.end13:                                        ; preds = %for.cond3
  %mul14 = mul nsw i32 %k, %o, !dbg !3279
    #dbg_value(ptr %A, !3280, !DIExpression(), !3282)
    #dbg_value(ptr %r, !3284, !DIExpression(), !3282)
    #dbg_value(ptr %Ar, !3285, !DIExpression(), !3282)
    #dbg_value(i32 %mul14, !3286, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !3282)
    #dbg_value(i32 %m, !3287, !DIExpression(), !3282)
    #dbg_value(i32 1, !3288, !DIExpression(), !3282)
    #dbg_value(i32 0, !3289, !DIExpression(), !3291)
  %smax39 = call i32 @llvm.smax.i32(i32 %0, i32 -1), !dbg !3292
  %3 = add i32 %smax39, 1, !dbg !3292
  br label %for.cond.i, !dbg !3292

for.cond.i:                                       ; preds = %for.inc4.i, %for.end13
  %i.0.i = phi i32 [ 0, %for.end13 ], [ %inc5.i, %for.inc4.i ], !dbg !3293
  %c.addr.0.i = phi ptr [ %Ar, %for.end13 ], [ %c.addr.1.i.lcssa, %for.inc4.i ]
  %a.addr.0.i = phi ptr [ %A, %for.end13 ], [ %add.ptr6.i, %for.inc4.i ]
    #dbg_value(ptr %a.addr.0.i, !3280, !DIExpression(), !3282)
    #dbg_value(ptr %c.addr.0.i, !3285, !DIExpression(), !3282)
    #dbg_value(i32 %i.0.i, !3289, !DIExpression(), !3291)
  %exitcond41 = icmp ne i32 %i.0.i, %smax37, !dbg !3294
  br i1 %exitcond41, label %for.cond1.i.preheader, label %for.cond17.preheader, !dbg !3296

for.cond1.i.preheader:                            ; preds = %for.cond.i
  br label %for.cond1.i, !dbg !3297

for.cond17.preheader:                             ; preds = %for.cond.i
  br label %for.cond17, !dbg !3300

for.cond1.i:                                      ; preds = %for.cond1.i.preheader, %lincomb.24.exit.i
  %c.addr.1.i = phi ptr [ %incdec.ptr.i, %lincomb.24.exit.i ], [ %c.addr.0.i, %for.cond1.i.preheader ]
  %j.0.i = phi i32 [ 1, %lincomb.24.exit.i ], [ 0, %for.cond1.i.preheader ], !dbg !3302
    #dbg_value(i32 poison, !3303, !DIExpression(), !3304)
    #dbg_value(ptr %c.addr.1.i, !3285, !DIExpression(), !3282)
  %cmp2.i = icmp eq i32 %j.0.i, 0, !dbg !3305
  br i1 %cmp2.i, label %for.body3.i, label %for.inc4.i, !dbg !3297

for.body3.i:                                      ; preds = %for.cond1.i
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %r, i32 %j.0.i, !dbg !3307
    #dbg_value(ptr %a.addr.0.i, !3309, !DIExpression(), !3311)
    #dbg_value(ptr %add.ptr.i, !3313, !DIExpression(), !3311)
    #dbg_value(i32 %mul14, !3314, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !3311)
    #dbg_value(i32 1, !3315, !DIExpression(), !3311)
    #dbg_value(i8 0, !3316, !DIExpression(), !3311)
    #dbg_value(i32 0, !3317, !DIExpression(), !3319)
  br label %for.cond.i.i, !dbg !3320

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body3.i
  %ret.0.i.i = phi i8 [ 0, %for.body3.i ], [ %xor1.i.i.i, %for.body.i.i ], !dbg !3311
  %b.addr.0.i.i = phi ptr [ %add.ptr.i, %for.body3.i ], [ %add.ptr.i.i, %for.body.i.i ]
  %i.0.i.i = phi i32 [ 0, %for.body3.i ], [ %inc.i.i, %for.body.i.i ], !dbg !3321
    #dbg_value(i32 %i.0.i.i, !3317, !DIExpression(), !3319)
    #dbg_value(ptr %b.addr.0.i.i, !3313, !DIExpression(), !3311)
    #dbg_value(i8 %ret.0.i.i, !3316, !DIExpression(), !3311)
  %exitcond40 = icmp eq i32 %i.0.i.i, %3, !dbg !3322
  br i1 %exitcond40, label %lincomb.24.exit.i, label %for.body.i.i, !dbg !3324

for.body.i.i:                                     ; preds = %for.cond.i.i
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %a.addr.0.i, i32 %i.0.i.i, !dbg !3325
  %4 = load i8, ptr %arrayidx.i.i, align 1, !dbg !3325
  %5 = load i8, ptr %b.addr.0.i.i, align 1, !dbg !3327
    #dbg_value(i8 %4, !3328, !DIExpression(), !3330)
    #dbg_value(i8 %5, !3332, !DIExpression(), !3330)
  %6 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !3333
  %xor1.i.i = xor i8 %4, %6, !dbg !3334
    #dbg_value(i8 %xor1.i.i, !3328, !DIExpression(), !3330)
  %7 = trunc i8 %xor1.i.i to i1, !dbg !3335
    #dbg_value(i8 poison, !3336, !DIExpression(), !3330)
  %8 = and i8 %xor1.i.i, 2, !dbg !3337
  %mul9.i.i = mul i8 %8, %5, !dbg !3338
  %conv10.i.i = select i1 %7, i8 %5, i8 0, !dbg !3335
  %xor11.i.i = xor i8 %conv10.i.i, %mul9.i.i, !dbg !3339
    #dbg_value(i8 %xor11.i.i, !3336, !DIExpression(), !3330)
  %9 = and i8 %xor1.i.i, 4, !dbg !3340
  %mul16.i.i = mul i8 %9, %5, !dbg !3341
  %xor18.i.i = xor i8 %mul16.i.i, %xor11.i.i, !dbg !3342
    #dbg_value(i8 %xor18.i.i, !3336, !DIExpression(), !3330)
  %10 = and i8 %xor1.i.i, 8, !dbg !3343
  %mul23.i.i = mul i8 %10, %5, !dbg !3344
  %xor25.i.i = xor i8 %mul23.i.i, %xor18.i.i, !dbg !3345
    #dbg_value(i8 %xor25.i.i, !3336, !DIExpression(), !3330)
    #dbg_value(i8 %xor25.i.i, !3346, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !3330)
  %11 = lshr i8 %xor25.i.i, 4, !dbg !3347
  %12 = lshr i8 %xor25.i.i, 3, !dbg !3348
  %13 = and i8 %12, 14, !dbg !3348
  %14 = xor i8 %11, %13, !dbg !3349
  %xor25.masked.i.i = and i8 %xor25.i.i, 15, !dbg !3350
  %15 = xor i8 %14, %xor25.masked.i.i, !dbg !3350
    #dbg_value(i8 %15, !3351, !DIExpression(), !3330)
    #dbg_value(i8 %15, !3352, !DIExpression(), !3354)
    #dbg_value(i8 %ret.0.i.i, !3356, !DIExpression(), !3354)
  %xor1.i.i.i = xor i8 %15, %ret.0.i.i, !dbg !3357
    #dbg_value(i8 %xor1.i.i.i, !3316, !DIExpression(), !3311)
  %inc.i.i = add nuw i32 %i.0.i.i, 1, !dbg !3358
    #dbg_value(i32 %inc.i.i, !3317, !DIExpression(), !3319)
  %add.ptr.i.i = getelementptr inbounds nuw i8, ptr %b.addr.0.i.i, i32 1, !dbg !3359
    #dbg_value(ptr %add.ptr.i.i, !3313, !DIExpression(), !3311)
  br label %for.cond.i.i, !dbg !3360, !llvm.loop !3361

lincomb.24.exit.i:                                ; preds = %for.cond.i.i
  %ret.0.i.i.lcssa = phi i8 [ %ret.0.i.i, %for.cond.i.i ], !dbg !3311
  store i8 %ret.0.i.i.lcssa, ptr %c.addr.1.i, align 1, !dbg !3363
    #dbg_value(i32 1, !3303, !DIExpression(), !3304)
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %c.addr.1.i, i32 1, !dbg !3364
    #dbg_value(ptr %incdec.ptr.i, !3285, !DIExpression(), !3282)
  br label %for.cond1.i, !dbg !3365, !llvm.loop !3366

for.inc4.i:                                       ; preds = %for.cond1.i
  %c.addr.1.i.lcssa = phi ptr [ %c.addr.1.i, %for.cond1.i ]
  %inc5.i = add nuw i32 %i.0.i, 1, !dbg !3368
    #dbg_value(i32 %inc5.i, !3289, !DIExpression(), !3291)
  %16 = getelementptr i8, ptr %a.addr.0.i, i32 %mul14, !dbg !3369
  %add.ptr6.i = getelementptr i8, ptr %16, i32 1, !dbg !3369
    #dbg_value(ptr %add.ptr6.i, !3280, !DIExpression(), !3282)
  br label %for.cond.i, !dbg !3370, !llvm.loop !3371

for.cond17:                                       ; preds = %for.cond17.preheader, %for.body19
  %i16.0 = phi i32 [ %inc29, %for.body19 ], [ 0, %for.cond17.preheader ], !dbg !3373
    #dbg_value(i32 %i16.0, !3374, !DIExpression(), !3375)
  %exitcond42 = icmp ne i32 %i16.0, %smax37, !dbg !3376
  br i1 %exitcond42, label %for.body19, label %for.end30, !dbg !3300

for.body19:                                       ; preds = %for.cond17
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %y, i32 %i16.0, !dbg !3378
  %17 = load i8, ptr %arrayidx20, align 1, !dbg !3378
  %arrayidx21 = getelementptr inbounds nuw [78 x i8], ptr %Ar, i32 0, i32 %i16.0, !dbg !3380
  %18 = load i8, ptr %arrayidx21, align 1, !dbg !3380
    #dbg_value(i8 %17, !3381, !DIExpression(), !3383)
    #dbg_value(i8 %18, !3385, !DIExpression(), !3383)
  %xor1.i = xor i8 %17, %18, !dbg !3386
  %mul22 = mul nsw i32 %k, %o, !dbg !3387
  %mul23 = mul nsw i32 %k, %o, !dbg !3388
  %add24 = add nsw i32 %mul23, 1, !dbg !3389
  %mul25 = mul nsw i32 %i16.0, %add24, !dbg !3390
  %19 = getelementptr i8, ptr %A, i32 %mul22, !dbg !3391
  %arrayidx27 = getelementptr i8, ptr %19, i32 %mul25, !dbg !3391
  store i8 %xor1.i, ptr %arrayidx27, align 1, !dbg !3392
  %inc29 = add nuw i32 %i16.0, 1, !dbg !3393
    #dbg_value(i32 %inc29, !3374, !DIExpression(), !3375)
  br label %for.cond17, !dbg !3394, !llvm.loop !3395

for.end30:                                        ; preds = %for.cond17
  %mul31 = mul nsw i32 %k, %o, !dbg !3397
  %add32 = add nsw i32 %mul31, 1, !dbg !3398
  call void @llvm.lifetime.start.p0(i64 48, ptr nonnull %_pivot_row.i), !dbg !3399
  call void @llvm.lifetime.start.p0(i64 48, ptr nonnull %_pivot_row2.i), !dbg !3399
  call void @llvm.lifetime.start.p0(i64 3744, ptr nonnull %packed_A.i), !dbg !3399
  call void @llvm.lifetime.start.p0(i64 96, ptr nonnull %temp.i), !dbg !3399
    #dbg_value(ptr %A, !3405, !DIExpression(), !3406)
    #dbg_value(i32 %m, !3407, !DIExpression(), !3406)
    #dbg_value(i32 %add32, !3408, !DIExpression(), !3406)
    #dbg_declare(ptr %_pivot_row.i, !3409, !DIExpression(), !3411)
    #dbg_declare(ptr %_pivot_row2.i, !3412, !DIExpression(), !3413)
    #dbg_declare(ptr %packed_A.i, !3414, !DIExpression(), !3399)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 32 dereferenceable(3744) %packed_A.i, i8 0, i32 3744, i1 false), !dbg !3399
  %add.i = add nsw i32 %mul31, 16, !dbg !3418
  %div.i = sdiv i32 %add.i, 16, !dbg !3419
    #dbg_value(i32 %div.i, !3420, !DIExpression(), !3406)
    #dbg_value(i32 0, !3421, !DIExpression(), !3423)
  br label %for.cond.i13, !dbg !3424

for.cond.i13:                                     ; preds = %ef_pack_m_vec.exit.i, %for.end30
  %i.0.i14 = phi i32 [ 0, %for.end30 ], [ %inc.i34, %ef_pack_m_vec.exit.i ], !dbg !3425
    #dbg_value(i32 %i.0.i14, !3421, !DIExpression(), !3423)
  %exitcond43 = icmp ne i32 %i.0.i14, %smax37, !dbg !3426
  br i1 %exitcond43, label %for.body.i, label %for.cond3.i.preheader, !dbg !3428

for.cond3.i.preheader:                            ; preds = %for.cond.i13
  %smax44 = call i32 @llvm.smax.i32(i32 %div.i, i32 0), !dbg !3429
  %smax50 = call i32 @llvm.smax.i32(i32 %0, i32 -1), !dbg !3429
  %20 = add i32 %smax50, 1, !dbg !3429
  br label %for.cond3.i, !dbg !3429

for.body.i:                                       ; preds = %for.cond.i13
  %mul.i32 = mul nsw i32 %i.0.i14, %add32, !dbg !3431
  %add.ptr.i33 = getelementptr inbounds i8, ptr %A, i32 %mul.i32, !dbg !3433
  %mul1.i = mul nsw i32 %i.0.i14, %div.i, !dbg !3434
  %add.ptr2.i = getelementptr inbounds i64, ptr %packed_A.i, i32 %mul1.i, !dbg !3435
    #dbg_value(ptr %add.ptr.i33, !3436, !DIExpression(), !3440)
    #dbg_value(ptr %add.ptr2.i, !3442, !DIExpression(), !3440)
    #dbg_value(i32 %add32, !3443, !DIExpression(), !3440)
    #dbg_value(ptr %add.ptr2.i, !3444, !DIExpression(), !3440)
    #dbg_value(i32 0, !3445, !DIExpression(), !3440)
  br label %for.cond.i57.i, !dbg !3446

for.cond.i57.i:                                   ; preds = %for.body.i61.i, %for.body.i
  %i.0.i58.i = phi i32 [ 0, %for.body.i ], [ %add8.i65.i, %for.body.i61.i ], !dbg !3448
    #dbg_value(i32 %i.0.i58.i, !3445, !DIExpression(), !3440)
  %cmp.i60.i = icmp slt i32 %i.0.i58.i, %mul31, !dbg !3449
  br i1 %cmp.i60.i, label %for.body.i61.i, label %for.end.i.i, !dbg !3451

for.body.i61.i:                                   ; preds = %for.cond.i57.i
  %arrayidx.i62.i = getelementptr inbounds nuw i8, ptr %add.ptr.i33, i32 %i.0.i58.i, !dbg !3452
  %21 = load i8, ptr %arrayidx.i62.i, align 1, !dbg !3452
  %add2.i.i = or disjoint i32 %i.0.i58.i, 1, !dbg !3454
  %arrayidx3.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i33, i32 %add2.i.i, !dbg !3455
  %22 = load i8, ptr %arrayidx3.i.i, align 1, !dbg !3455
  %shl5.i.i = shl i8 %22, 4, !dbg !3456
  %or.i.i = or i8 %shl5.i.i, %21, !dbg !3457
  %div.i63.i = lshr exact i32 %i.0.i58.i, 1, !dbg !3458
  %arrayidx7.i64.i = getelementptr inbounds nuw i8, ptr %add.ptr2.i, i32 %div.i63.i, !dbg !3459
  store i8 %or.i.i, ptr %arrayidx7.i64.i, align 1, !dbg !3460
  %add8.i65.i = add nuw nsw i32 %i.0.i58.i, 2, !dbg !3461
    #dbg_value(i32 %add8.i65.i, !3445, !DIExpression(), !3440)
  br label %for.cond.i57.i, !dbg !3462, !llvm.loop !3463

for.end.i.i:                                      ; preds = %for.cond.i57.i
  %i.0.i58.i.lcssa = phi i32 [ %i.0.i58.i, %for.cond.i57.i ], !dbg !3448
  %23 = and i32 %add32, -2147483647, !dbg !3465
  %cmp9.i.i = icmp eq i32 %23, 1, !dbg !3465
  br i1 %cmp9.i.i, label %if.then.i.i, label %ef_pack_m_vec.exit.i, !dbg !3465

if.then.i.i:                                      ; preds = %for.end.i.i
  %arrayidx12.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i33, i32 %i.0.i58.i.lcssa, !dbg !3467
  %24 = load i8, ptr %arrayidx12.i.i, align 1, !dbg !3467
  %div16.i.i = lshr exact i32 %i.0.i58.i.lcssa, 1, !dbg !3469
  %arrayidx17.i.i = getelementptr inbounds nuw i8, ptr %add.ptr2.i, i32 %div16.i.i, !dbg !3470
  store i8 %24, ptr %arrayidx17.i.i, align 1, !dbg !3471
  br label %ef_pack_m_vec.exit.i, !dbg !3472

ef_pack_m_vec.exit.i:                             ; preds = %if.then.i.i, %for.end.i.i
  %inc.i34 = add nuw i32 %i.0.i14, 1, !dbg !3473
    #dbg_value(i32 %inc.i34, !3421, !DIExpression(), !3423)
  br label %for.cond.i13, !dbg !3474, !llvm.loop !3475

for.cond3.i:                                      ; preds = %for.cond3.i.preheader, %for.inc117.i
  %pivot_col.0.i = phi i32 [ %inc118.i, %for.inc117.i ], [ 0, %for.cond3.i.preheader ], !dbg !3477
  %pivot_row.0.i = phi i32 [ %conv116.i, %for.inc117.i ], [ 0, %for.cond3.i.preheader ], !dbg !3406
    #dbg_value(i32 %pivot_row.0.i, !3478, !DIExpression(), !3406)
    #dbg_value(i32 %pivot_col.0.i, !3479, !DIExpression(), !3480)
  %exitcond51 = icmp eq i32 %pivot_col.0.i, %20, !dbg !3481
  br i1 %exitcond51, label %for.cond121.i.preheader, label %for.body5.i, !dbg !3429

for.cond121.i.preheader:                          ; preds = %for.cond3.i
  br label %for.cond121.i, !dbg !3483

for.body5.i:                                      ; preds = %for.cond3.i
  %add6.i = add nsw i32 %pivot_col.0.i, %m, !dbg !3485
  %cmp7.i.not = icmp sgt i32 %add6.i, %mul31, !dbg !3485
  %add8.i = add nsw i32 %pivot_col.0.i, %m, !dbg !3485
  %sub9.i = sub nsw i32 %add8.i, %add32, !dbg !3485
  %cond.i = select i1 %cmp7.i.not, i32 %sub9.i, i32 0, !dbg !3485
    #dbg_value(i32 %cond.i, !3487, !DIExpression(), !3488)
  %sub13.i = add nsw i32 %m, -1, !dbg !3489
    #dbg_value(i32 %cond16.i, !3490, !DIExpression(), !3488)
    #dbg_value(i32 0, !3491, !DIExpression(), !3493)
  br label %for.cond18.i, !dbg !3494

for.cond18.i:                                     ; preds = %for.body20.i, %for.body5.i
  %i17.0.i = phi i32 [ 0, %for.body5.i ], [ %inc23.i, %for.body20.i ], !dbg !3495
    #dbg_value(i32 %i17.0.i, !3491, !DIExpression(), !3493)
  %exitcond45 = icmp ne i32 %i17.0.i, %smax44, !dbg !3496
  br i1 %exitcond45, label %for.body20.i, label %for.cond25.i.preheader, !dbg !3498

for.cond25.i.preheader:                           ; preds = %for.cond18.i
  %cmp11.not.i = icmp sgt i32 %m, %pivot_col.0.i, !dbg !3489
  %cond16.i = select i1 %cmp11.not.i, i32 %pivot_col.0.i, i32 %sub13.i, !dbg !3489
  br label %for.cond25.i, !dbg !3499

for.body20.i:                                     ; preds = %for.cond18.i
  %arrayidx.i = getelementptr inbounds nuw [6 x i64], ptr %_pivot_row.i, i32 0, i32 %i17.0.i, !dbg !3501
  store i64 0, ptr %arrayidx.i, align 8, !dbg !3503
  %arrayidx21.i = getelementptr inbounds nuw [6 x i64], ptr %_pivot_row2.i, i32 0, i32 %i17.0.i, !dbg !3504
  store i64 0, ptr %arrayidx21.i, align 8, !dbg !3505
  %inc23.i = add nuw nsw i32 %i17.0.i, 1, !dbg !3506
    #dbg_value(i32 %inc23.i, !3491, !DIExpression(), !3493)
  br label %for.cond18.i, !dbg !3507, !llvm.loop !3508

for.cond25.i:                                     ; preds = %for.cond25.i.preheader, %for.end48.i
  %pivot_is_zero.0.i = phi i64 [ %not52.i, %for.end48.i ], [ -1, %for.cond25.i.preheader ], !dbg !3488
  %pivot.0.i = phi i8 [ %conv.i16.i, %for.end48.i ], [ 0, %for.cond25.i.preheader ], !dbg !3488
  %row.0.i = phi i32 [ %inc54.i, %for.end48.i ], [ %cond.i, %for.cond25.i.preheader ], !dbg !3510
    #dbg_value(i32 %row.0.i, !3511, !DIExpression(), !3510)
    #dbg_value(i8 %pivot.0.i, !3512, !DIExpression(), !3488)
    #dbg_value(i64 %pivot_is_zero.0.i, !3513, !DIExpression(), !3488)
  %add27.i = add nsw i32 %cond16.i, 32, !dbg !3514
  %cmp28.not.i = icmp sgt i32 %m, %add27.i, !dbg !3514
  %sub30.i = add nsw i32 %m, -1, !dbg !3514
  %add32.i = add nsw i32 %cond16.i, 32, !dbg !3514
  %cond34.i = select i1 %cmp28.not.i, i32 %add32.i, i32 %sub30.i, !dbg !3514
  %cmp35.not.i = icmp sgt i32 %row.0.i, %cond34.i, !dbg !3516
  br i1 %cmp35.not.i, label %for.end55.i, label %for.body36.i, !dbg !3499

for.body36.i:                                     ; preds = %for.cond25.i
    #dbg_value(i32 %row.0.i, !3517, !DIExpression(), !3522)
    #dbg_value(i32 %pivot_row.0.i, !3525, !DIExpression(), !3522)
  %xor.i6.i = xor i32 %row.0.i, %pivot_row.0.i, !dbg !3526
  %25 = load volatile i64, ptr @pqmayo_MAYO_1_ref_uint64_t_blocker, align 8, !dbg !3527
  %26 = icmp slt i32 %xor.i6.i, 1, !dbg !3528
  %27 = sext i1 %26 to i64, !dbg !3528
  %not.i = xor i64 %25, %27, !dbg !3528
    #dbg_value(i64 %not.i, !3529, !DIExpression(), !3530)
    #dbg_value(i32 %row.0.i, !3531, !DIExpression(), !3533)
    #dbg_value(i32 %pivot_row.0.i, !3535, !DIExpression(), !3533)
    #dbg_value(!DIArgList(i32 %pivot_row.0.i, i32 %row.0.i), !3536, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_LLVM_convert, 64, DW_ATE_signed, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_LLVM_convert, 64, DW_ATE_signed, DW_OP_minus, DW_OP_stack_value), !3533)
  %28 = icmp slt i32 %pivot_row.0.i, %row.0.i, !dbg !3537
  %shr.i.i = sext i1 %28 to i64, !dbg !3537
  %29 = load volatile i64, ptr @pqmayo_MAYO_1_ref_uint64_t_blocker, align 8, !dbg !3538
  %xor.i.i = xor i64 %29, %shr.i.i, !dbg !3539
    #dbg_value(i64 %xor.i.i, !3540, !DIExpression(), !3530)
    #dbg_value(i32 0, !3541, !DIExpression(), !3543)
  br label %for.cond38.i, !dbg !3544

for.cond38.i:                                     ; preds = %for.body40.i, %for.body36.i
  %j.0.i20 = phi i32 [ 0, %for.body36.i ], [ %inc47.i, %for.body40.i ], !dbg !3545
    #dbg_value(i32 %j.0.i20, !3541, !DIExpression(), !3543)
  %exitcond46 = icmp ne i32 %j.0.i20, %smax44, !dbg !3546
  br i1 %exitcond46, label %for.body40.i, label %for.end48.i, !dbg !3548

for.body40.i:                                     ; preds = %for.cond38.i
  %and.i = and i64 %xor.i.i, %pivot_is_zero.0.i, !dbg !3549
  %or.i = or i64 %and.i, %not.i, !dbg !3551
  %mul41.i = mul nsw i32 %row.0.i, %div.i, !dbg !3552
  %add42.i = add nsw i32 %mul41.i, %j.0.i20, !dbg !3553
  %arrayidx43.i = getelementptr inbounds [468 x i64], ptr %packed_A.i, i32 0, i32 %add42.i, !dbg !3554
  %30 = load i64, ptr %arrayidx43.i, align 8, !dbg !3554
  %and44.i = and i64 %or.i, %30, !dbg !3555
  %arrayidx45.i = getelementptr inbounds nuw [6 x i64], ptr %_pivot_row.i, i32 0, i32 %j.0.i20, !dbg !3556
  %31 = load i64, ptr %arrayidx45.i, align 8, !dbg !3557
  %xor.i21 = xor i64 %31, %and44.i, !dbg !3557
  store i64 %xor.i21, ptr %arrayidx45.i, align 8, !dbg !3557
  %inc47.i = add nuw nsw i32 %j.0.i20, 1, !dbg !3558
    #dbg_value(i32 %inc47.i, !3541, !DIExpression(), !3543)
  br label %for.cond38.i, !dbg !3559, !llvm.loop !3560

for.end48.i:                                      ; preds = %for.cond38.i
    #dbg_value(ptr %_pivot_row.i, !3562, !DIExpression(), !3566)
    #dbg_value(i32 %pivot_col.0.i, !3568, !DIExpression(), !3566)
  %div.i10.i35 = lshr i32 %pivot_col.0.i, 4, !dbg !3569
    #dbg_value(i32 %div.i10.i35, !3570, !DIExpression(), !3566)
    #dbg_value(i32 %pivot_col.0.i, !3571, !DIExpression(DW_OP_constu, 15, DW_OP_and, DW_OP_stack_value), !3566)
  %arrayidx.i12.i = getelementptr inbounds nuw i64, ptr %_pivot_row.i, i32 %div.i10.i35, !dbg !3572
  %32 = load i64, ptr %arrayidx.i12.i, align 8, !dbg !3572
  %rem.i11.i = shl i32 %pivot_col.0.i, 2, !dbg !3573
  %mul.i13.i = and i32 %rem.i11.i, 60, !dbg !3573
  %sh_prom.i14.i = zext nneg i32 %mul.i13.i to i64, !dbg !3574
  %shr.i15.i = lshr i64 %32, %sh_prom.i14.i, !dbg !3574
  %33 = trunc i64 %shr.i15.i to i8, !dbg !3575
  %conv.i16.i = and i8 %33, 15, !dbg !3575
    #dbg_value(i8 %conv.i16.i, !3512, !DIExpression(), !3488)
    #dbg_value(i8 %conv.i16.i, !3517, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !3576)
    #dbg_value(i32 0, !3525, !DIExpression(), !3576)
  %34 = load volatile i64, ptr @pqmayo_MAYO_1_ref_uint64_t_blocker, align 8, !dbg !3578
    #dbg_value(!DIArgList(i64 %34, i8 %conv.i16.i), !3513, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_lit0, DW_OP_ne, DW_OP_LLVM_convert, 1, DW_ATE_signed, DW_OP_LLVM_convert, 64, DW_ATE_signed, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_stack_value), !3488)
  %35 = icmp eq i8 %conv.i16.i, 0, !dbg !3579
  %36 = sext i1 %35 to i64, !dbg !3579
  %not52.i = xor i64 %34, %36, !dbg !3579
    #dbg_value(i64 %not52.i, !3513, !DIExpression(), !3488)
  %inc54.i = add nsw i32 %row.0.i, 1, !dbg !3580
    #dbg_value(i32 %inc54.i, !3511, !DIExpression(), !3510)
  br label %for.cond25.i, !dbg !3581, !llvm.loop !3582

for.end55.i:                                      ; preds = %for.cond25.i
  %pivot_is_zero.0.i.lcssa = phi i64 [ %pivot_is_zero.0.i, %for.cond25.i ], !dbg !3488
  %pivot.0.i.lcssa = phi i8 [ %pivot.0.i, %for.cond25.i ], !dbg !3488
    #dbg_value(i8 %pivot.0.i.lcssa, !3584, !DIExpression(), !3588)
    #dbg_value(i8 %pivot.0.i.lcssa, !3328, !DIExpression(), !3590)
    #dbg_value(i8 %pivot.0.i.lcssa, !3332, !DIExpression(), !3590)
  %37 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !3592
  %xor1.i17.i = xor i8 %pivot.0.i.lcssa, %37, !dbg !3593
    #dbg_value(i8 %xor1.i17.i, !3328, !DIExpression(), !3590)
  %38 = trunc i8 %xor1.i17.i to i1, !dbg !3594
    #dbg_value(i8 poison, !3336, !DIExpression(), !3590)
  %39 = and i8 %xor1.i17.i, 2, !dbg !3595
  %mul9.i.i22 = mul nuw nsw i8 %39, %pivot.0.i.lcssa, !dbg !3596
  %conv10.i.i23 = select i1 %38, i8 %pivot.0.i.lcssa, i8 0, !dbg !3594
  %xor11.i.i24 = xor i8 %conv10.i.i23, %mul9.i.i22, !dbg !3597
    #dbg_value(i8 %xor11.i.i24, !3336, !DIExpression(), !3590)
  %40 = and i8 %xor1.i17.i, 4, !dbg !3598
  %mul16.i.i25 = mul nuw nsw i8 %40, %pivot.0.i.lcssa, !dbg !3599
  %xor18.i.i26 = xor i8 %mul16.i.i25, %xor11.i.i24, !dbg !3600
    #dbg_value(i8 %xor18.i.i26, !3336, !DIExpression(), !3590)
  %41 = and i8 %xor1.i17.i, 8, !dbg !3601
  %mul23.i.i27 = mul nuw nsw i8 %41, %pivot.0.i.lcssa, !dbg !3602
  %xor25.i.i28 = xor i8 %mul23.i.i27, %xor18.i.i26, !dbg !3603
    #dbg_value(i8 %xor25.i.i28, !3336, !DIExpression(), !3590)
    #dbg_value(i8 %xor25.i.i28, !3346, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !3590)
  %42 = lshr i8 %xor25.i.i28, 4, !dbg !3604
  %43 = lshr i8 %xor25.i.i28, 3, !dbg !3605
  %44 = and i8 %43, 14, !dbg !3605
  %45 = xor i8 %42, %44, !dbg !3606
  %xor25.masked.i.i29 = and i8 %xor25.i.i28, 15, !dbg !3607
  %46 = xor i8 %45, %xor25.masked.i.i29, !dbg !3607
    #dbg_value(i8 %46, !3351, !DIExpression(), !3590)
    #dbg_value(i8 %46, !3608, !DIExpression(), !3588)
    #dbg_value(i8 %46, !3328, !DIExpression(), !3609)
    #dbg_value(i8 %46, !3332, !DIExpression(), !3609)
  %47 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !3611
  %xor1.i45.i = xor i8 %46, %47, !dbg !3612
    #dbg_value(i8 %xor1.i45.i, !3328, !DIExpression(), !3609)
  %48 = trunc i8 %xor1.i45.i to i1, !dbg !3613
    #dbg_value(i8 poison, !3336, !DIExpression(), !3609)
  %49 = and i8 %xor1.i45.i, 2, !dbg !3614
  %mul9.i46.i = mul nuw nsw i8 %49, %46, !dbg !3615
  %conv10.i47.i = select i1 %48, i8 %46, i8 0, !dbg !3613
  %xor11.i48.i = xor i8 %conv10.i47.i, %mul9.i46.i, !dbg !3616
    #dbg_value(i8 %xor11.i48.i, !3336, !DIExpression(), !3609)
  %50 = and i8 %xor1.i45.i, 4, !dbg !3617
  %mul16.i49.i = mul nuw nsw i8 %50, %46, !dbg !3618
  %xor18.i50.i = xor i8 %mul16.i49.i, %xor11.i48.i, !dbg !3619
    #dbg_value(i8 %xor18.i50.i, !3336, !DIExpression(), !3609)
  %51 = and i8 %xor1.i45.i, 8, !dbg !3620
  %mul23.i51.i = mul nuw nsw i8 %51, %46, !dbg !3621
  %xor25.i52.i = xor i8 %mul23.i51.i, %xor18.i50.i, !dbg !3622
    #dbg_value(i8 %xor25.i52.i, !3336, !DIExpression(), !3609)
    #dbg_value(i8 %xor25.i52.i, !3346, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !3609)
  %52 = lshr i8 %xor25.i52.i, 4, !dbg !3623
  %53 = lshr i8 %xor25.i52.i, 3, !dbg !3624
  %54 = and i8 %53, 14, !dbg !3624
  %55 = xor i8 %52, %54, !dbg !3625
  %xor25.masked.i53.i = and i8 %xor25.i52.i, 15, !dbg !3626
  %56 = xor i8 %55, %xor25.masked.i53.i, !dbg !3626
    #dbg_value(i8 %56, !3351, !DIExpression(), !3609)
    #dbg_value(i8 %56, !3627, !DIExpression(), !3588)
    #dbg_value(i8 %56, !3328, !DIExpression(), !3628)
    #dbg_value(i8 %56, !3332, !DIExpression(), !3628)
  %57 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !3630
  %xor1.i27.i = xor i8 %56, %57, !dbg !3631
    #dbg_value(i8 %xor1.i27.i, !3328, !DIExpression(), !3628)
  %58 = trunc i8 %xor1.i27.i to i1, !dbg !3632
    #dbg_value(i8 poison, !3336, !DIExpression(), !3628)
  %59 = and i8 %xor1.i27.i, 2, !dbg !3633
  %mul9.i28.i = mul nuw nsw i8 %59, %56, !dbg !3634
  %conv10.i29.i = select i1 %58, i8 %56, i8 0, !dbg !3632
  %xor11.i30.i = xor i8 %conv10.i29.i, %mul9.i28.i, !dbg !3635
    #dbg_value(i8 %xor11.i30.i, !3336, !DIExpression(), !3628)
  %60 = and i8 %xor1.i27.i, 4, !dbg !3636
  %mul16.i31.i = mul nuw nsw i8 %60, %56, !dbg !3637
  %xor18.i32.i = xor i8 %mul16.i31.i, %xor11.i30.i, !dbg !3638
    #dbg_value(i8 %xor18.i32.i, !3336, !DIExpression(), !3628)
  %61 = and i8 %xor1.i27.i, 8, !dbg !3639
  %mul23.i33.i = mul nuw nsw i8 %61, %56, !dbg !3640
  %xor25.i34.i = xor i8 %mul23.i33.i, %xor18.i32.i, !dbg !3641
    #dbg_value(i8 %xor25.i34.i, !3336, !DIExpression(), !3628)
    #dbg_value(i8 %xor25.i34.i, !3346, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !3628)
  %62 = lshr i8 %xor25.i34.i, 4, !dbg !3642
  %63 = lshr i8 %xor25.i34.i, 3, !dbg !3643
  %64 = and i8 %63, 14, !dbg !3643
  %65 = xor i8 %62, %64, !dbg !3644
  %xor25.masked.i35.i = and i8 %xor25.i34.i, 15, !dbg !3645
  %66 = xor i8 %65, %xor25.masked.i35.i, !dbg !3645
    #dbg_value(i8 %66, !3351, !DIExpression(), !3628)
    #dbg_value(i8 %66, !3646, !DIExpression(), !3588)
    #dbg_value(i8 %46, !3328, !DIExpression(), !3647)
    #dbg_value(i8 %56, !3332, !DIExpression(), !3647)
  %67 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !3649
  %xor1.i36.i = xor i8 %46, %67, !dbg !3650
    #dbg_value(i8 %xor1.i36.i, !3328, !DIExpression(), !3647)
  %68 = trunc i8 %xor1.i36.i to i1, !dbg !3651
    #dbg_value(i8 poison, !3336, !DIExpression(), !3647)
  %69 = and i8 %xor1.i36.i, 2, !dbg !3652
  %mul9.i37.i = mul nuw nsw i8 %69, %56, !dbg !3653
  %conv10.i38.i = select i1 %68, i8 %56, i8 0, !dbg !3651
  %xor11.i39.i = xor i8 %conv10.i38.i, %mul9.i37.i, !dbg !3654
    #dbg_value(i8 %xor11.i39.i, !3336, !DIExpression(), !3647)
  %70 = and i8 %xor1.i36.i, 4, !dbg !3655
  %mul16.i40.i = mul nuw nsw i8 %70, %56, !dbg !3656
  %xor18.i41.i = xor i8 %mul16.i40.i, %xor11.i39.i, !dbg !3657
    #dbg_value(i8 %xor18.i41.i, !3336, !DIExpression(), !3647)
  %71 = and i8 %xor1.i36.i, 8, !dbg !3658
  %mul23.i42.i = mul nuw nsw i8 %71, %56, !dbg !3659
  %xor25.i43.i = xor i8 %mul23.i42.i, %xor18.i41.i, !dbg !3660
    #dbg_value(i8 %xor25.i43.i, !3336, !DIExpression(), !3647)
    #dbg_value(i8 %xor25.i43.i, !3346, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !3647)
  %72 = lshr i8 %xor25.i43.i, 4, !dbg !3661
  %73 = lshr i8 %xor25.i43.i, 3, !dbg !3662
  %74 = and i8 %73, 14, !dbg !3662
  %75 = xor i8 %72, %74, !dbg !3663
  %xor25.masked.i44.i = and i8 %xor25.i43.i, 15, !dbg !3664
  %76 = xor i8 %75, %xor25.masked.i44.i, !dbg !3664
    #dbg_value(i8 %76, !3351, !DIExpression(), !3647)
    #dbg_value(i8 %76, !3665, !DIExpression(), !3588)
    #dbg_value(i8 %66, !3328, !DIExpression(), !3666)
    #dbg_value(i8 %76, !3332, !DIExpression(), !3666)
  %77 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !3668
  %xor1.i18.i = xor i8 %66, %77, !dbg !3669
    #dbg_value(i8 %xor1.i18.i, !3328, !DIExpression(), !3666)
  %78 = trunc i8 %xor1.i18.i to i1, !dbg !3670
    #dbg_value(i8 poison, !3336, !DIExpression(), !3666)
  %79 = and i8 %xor1.i18.i, 2, !dbg !3671
  %mul9.i19.i = mul nuw nsw i8 %79, %76, !dbg !3672
  %conv10.i20.i = select i1 %78, i8 %76, i8 0, !dbg !3670
  %xor11.i21.i = xor i8 %conv10.i20.i, %mul9.i19.i, !dbg !3673
    #dbg_value(i8 %xor11.i21.i, !3336, !DIExpression(), !3666)
  %80 = and i8 %xor1.i18.i, 4, !dbg !3674
  %mul16.i22.i = mul nuw nsw i8 %80, %76, !dbg !3675
  %xor18.i23.i = xor i8 %mul16.i22.i, %xor11.i21.i, !dbg !3676
    #dbg_value(i8 %xor18.i23.i, !3336, !DIExpression(), !3666)
  %81 = and i8 %xor1.i18.i, 8, !dbg !3677
  %mul23.i24.i = mul nuw nsw i8 %81, %76, !dbg !3678
  %xor25.i25.i = xor i8 %mul23.i24.i, %xor18.i23.i, !dbg !3679
    #dbg_value(i8 %xor25.i25.i, !3336, !DIExpression(), !3666)
    #dbg_value(i8 %xor25.i25.i, !3346, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !3666)
  %82 = lshr i8 %xor25.i25.i, 4, !dbg !3680
  %83 = lshr i8 %xor25.i25.i, 3, !dbg !3681
  %84 = and i8 %83, 14, !dbg !3681
  %85 = xor i8 %82, %84, !dbg !3682
  %xor25.masked.i26.i = and i8 %xor25.i25.i, 15, !dbg !3683
  %86 = xor i8 %85, %xor25.masked.i26.i, !dbg !3683
    #dbg_value(i8 %86, !3351, !DIExpression(), !3666)
    #dbg_value(i8 %86, !3684, !DIExpression(), !3588)
    #dbg_value(i8 %86, !3685, !DIExpression(), !3406)
  call fastcc void @vec_mul_add_u64(i32 noundef %div.i, ptr noundef nonnull %_pivot_row.i, i8 noundef zeroext %86, ptr noundef nonnull %_pivot_row2.i) #9, !dbg !3686
    #dbg_value(i32 %cond.i, !3687, !DIExpression(), !3689)
  br label %for.cond60.i, !dbg !3690

for.cond60.i:                                     ; preds = %for.inc86.i, %for.end55.i
  %row59.0.i = phi i32 [ %cond.i, %for.end55.i ], [ %inc87.i, %for.inc86.i ], !dbg !3691
    #dbg_value(i32 %row59.0.i, !3687, !DIExpression(), !3689)
  %cmp61.not.i = icmp sgt i32 %row59.0.i, %cond16.i, !dbg !3692
  br i1 %cmp61.not.i, label %for.cond90.i.preheader, label %for.body63.i, !dbg !3694

for.cond90.i.preheader:                           ; preds = %for.cond60.i
  %smax48 = call i32 @llvm.smax.i32(i32 %cond.i, i32 %m), !dbg !3695
  br label %for.cond90.i, !dbg !3695

for.body63.i:                                     ; preds = %for.cond60.i
    #dbg_value(i32 %row59.0.i, !3517, !DIExpression(), !3697)
    #dbg_value(i32 %pivot_row.0.i, !3525, !DIExpression(), !3697)
  %xor.i1.i = xor i32 %row59.0.i, %pivot_row.0.i, !dbg !3700
  %87 = icmp sgt i32 %xor.i1.i, 0, !dbg !3701
  %shr.i2.i = sext i1 %87 to i64, !dbg !3701
  %88 = load volatile i64, ptr @pqmayo_MAYO_1_ref_uint64_t_blocker, align 8, !dbg !3702
  %xor1.i.i30 = xor i64 %88, %shr.i2.i, !dbg !3703
  %and67.demorgan.i = or i64 %xor1.i.i30, %pivot_is_zero.0.i.lcssa, !dbg !3704
  %and67.i = xor i64 %and67.demorgan.i, -1, !dbg !3704
    #dbg_value(i64 %and67.i, !3705, !DIExpression(), !3706)
    #dbg_value(i64 %and67.demorgan.i, !3707, !DIExpression(), !3706)
    #dbg_value(i32 0, !3708, !DIExpression(), !3710)
  br label %for.cond69.i, !dbg !3711

for.cond69.i:                                     ; preds = %for.body72.i, %for.body63.i
  %col.0.i = phi i32 [ 0, %for.body63.i ], [ %inc84.i, %for.body72.i ], !dbg !3712
    #dbg_value(i32 %col.0.i, !3708, !DIExpression(), !3710)
  %exitcond47 = icmp ne i32 %col.0.i, %smax44, !dbg !3713
  br i1 %exitcond47, label %for.body72.i, label %for.inc86.i, !dbg !3715

for.body72.i:                                     ; preds = %for.cond69.i
  %mul73.i = mul nsw i32 %row59.0.i, %div.i, !dbg !3716
  %add74.i = add nsw i32 %mul73.i, %col.0.i, !dbg !3718
  %arrayidx75.i = getelementptr inbounds [468 x i64], ptr %packed_A.i, i32 0, i32 %add74.i, !dbg !3719
  %89 = load i64, ptr %arrayidx75.i, align 8, !dbg !3719
  %and76.i = and i64 %and67.demorgan.i, %89, !dbg !3720
  %arrayidx77.i = getelementptr inbounds nuw [6 x i64], ptr %_pivot_row2.i, i32 0, i32 %col.0.i, !dbg !3721
  %90 = load i64, ptr %arrayidx77.i, align 8, !dbg !3721
  %and78.i = and i64 %90, %and67.i, !dbg !3722
  %add79.i = add i64 %and76.i, %and78.i, !dbg !3723
  %mul80.i = mul nsw i32 %row59.0.i, %div.i, !dbg !3724
  %add81.i = add nsw i32 %mul80.i, %col.0.i, !dbg !3725
  %arrayidx82.i = getelementptr inbounds [468 x i64], ptr %packed_A.i, i32 0, i32 %add81.i, !dbg !3726
  store i64 %add79.i, ptr %arrayidx82.i, align 8, !dbg !3727
  %inc84.i = add nuw nsw i32 %col.0.i, 1, !dbg !3728
    #dbg_value(i32 %inc84.i, !3708, !DIExpression(), !3710)
  br label %for.cond69.i, !dbg !3729, !llvm.loop !3730

for.inc86.i:                                      ; preds = %for.cond69.i
  %inc87.i = add nsw i32 %row59.0.i, 1, !dbg !3732
    #dbg_value(i32 %inc87.i, !3687, !DIExpression(), !3689)
  br label %for.cond60.i, !dbg !3733, !llvm.loop !3734

for.cond90.i:                                     ; preds = %for.cond90.i.preheader, %for.body93.i
  %row89.0.i = phi i32 [ %inc110.i, %for.body93.i ], [ %cond.i, %for.cond90.i.preheader ], !dbg !3736
    #dbg_value(i32 %row89.0.i, !3737, !DIExpression(), !3738)
  %exitcond49 = icmp ne i32 %row89.0.i, %smax48, !dbg !3739
  br i1 %exitcond49, label %for.body93.i, label %for.inc117.i, !dbg !3695

for.body93.i:                                     ; preds = %for.cond90.i
  %cmp94.i = icmp sgt i32 %row89.0.i, %pivot_row.0.i, !dbg !3741
    #dbg_value(i1 %cmp94.i, !3743, !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3744)
  %mul98.i = mul nsw i32 %row89.0.i, %div.i, !dbg !3745
  %add.ptr99.i = getelementptr inbounds i64, ptr %packed_A.i, i32 %mul98.i, !dbg !3746
    #dbg_value(ptr %add.ptr99.i, !3562, !DIExpression(), !3747)
    #dbg_value(i32 %pivot_col.0.i, !3568, !DIExpression(), !3747)
  %div.i.i36 = lshr i32 %pivot_col.0.i, 4, !dbg !3749
    #dbg_value(i32 %div.i.i36, !3570, !DIExpression(), !3747)
    #dbg_value(i32 %pivot_col.0.i, !3571, !DIExpression(DW_OP_constu, 15, DW_OP_and, DW_OP_stack_value), !3747)
  %arrayidx.i.i31 = getelementptr inbounds nuw i64, ptr %add.ptr99.i, i32 %div.i.i36, !dbg !3750
  %91 = load i64, ptr %arrayidx.i.i31, align 8, !dbg !3750
  %rem.i.i = shl i32 %pivot_col.0.i, 2, !dbg !3751
  %mul.i.i = and i32 %rem.i.i, 60, !dbg !3751
  %sh_prom.i.i = zext nneg i32 %mul.i.i to i64, !dbg !3752
  %shr.i9.i = lshr i64 %91, %sh_prom.i.i, !dbg !3752
  %92 = trunc i64 %shr.i9.i to i8, !dbg !3753
  %conv.i.i = and i8 %92, 15, !dbg !3753
    #dbg_value(i8 %conv.i.i, !3754, !DIExpression(), !3744)
  %conv105.i = select i1 %cmp94.i, i8 %conv.i.i, i8 0, !dbg !3755
  %mul107.i = mul nsw i32 %row89.0.i, %div.i, !dbg !3756
  %add.ptr108.i = getelementptr inbounds i64, ptr %packed_A.i, i32 %mul107.i, !dbg !3757
  call fastcc void @vec_mul_add_u64(i32 noundef %div.i, ptr noundef nonnull %_pivot_row2.i, i8 noundef zeroext %conv105.i, ptr noundef nonnull %add.ptr108.i) #9, !dbg !3758
  %inc110.i = add i32 %row89.0.i, 1, !dbg !3759
    #dbg_value(i32 %inc110.i, !3737, !DIExpression(), !3738)
  br label %for.cond90.i, !dbg !3760, !llvm.loop !3761

for.inc117.i:                                     ; preds = %for.cond90.i
    #dbg_value(!DIArgList(i64 %pivot_is_zero.0.i.lcssa, i32 %pivot_row.0.i), !3478, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_plus_uconst, 1, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_plus, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !3406)
  %93 = trunc i64 %pivot_is_zero.0.i.lcssa to i32, !dbg !3763
  %94 = add i32 %93, 1, !dbg !3763
  %conv116.i = add i32 %94, %pivot_row.0.i, !dbg !3763
    #dbg_value(i32 %conv116.i, !3478, !DIExpression(), !3406)
  %inc118.i = add nuw i32 %pivot_col.0.i, 1, !dbg !3764
    #dbg_value(i32 %inc118.i, !3479, !DIExpression(), !3480)
  br label %for.cond3.i, !dbg !3765, !llvm.loop !3766

for.cond121.i:                                    ; preds = %for.cond121.i.preheader, %for.inc141.i
  %i120.0.i = phi i32 [ %inc142.i, %for.inc141.i ], [ 0, %for.cond121.i.preheader ], !dbg !3768
    #dbg_value(i32 %i120.0.i, !3769, !DIExpression(), !3770)
  %exitcond53 = icmp ne i32 %i120.0.i, %smax37, !dbg !3771
  br i1 %exitcond53, label %for.body124.i, label %EF.exit, !dbg !3483

for.body124.i:                                    ; preds = %for.cond121.i
  %mul126.i = mul nsw i32 %i120.0.i, %div.i, !dbg !3773
  %add.ptr127.i = getelementptr inbounds i64, ptr %packed_A.i, i32 %mul126.i, !dbg !3775
    #dbg_value(i32 %div.i, !3776, !DIExpression(), !3780)
    #dbg_value(ptr %add.ptr127.i, !3782, !DIExpression(), !3780)
    #dbg_value(ptr %temp.i, !3783, !DIExpression(), !3780)
    #dbg_value(ptr %add.ptr127.i, !3784, !DIExpression(), !3780)
    #dbg_value(i32 0, !3785, !DIExpression(), !3787)
  br label %for.cond.i.i16, !dbg !3788

for.cond.i.i16:                                   ; preds = %for.body.i.i19, %for.body124.i
  %i.0.i.i17 = phi i32 [ 0, %for.body124.i ], [ %add8.i.i, %for.body.i.i19 ], !dbg !3789
    #dbg_value(i32 %i.0.i.i17, !3785, !DIExpression(), !3787)
  %mul.i54.i = shl nsw i32 %div.i, 4, !dbg !3790
  %cmp.i.i18 = icmp slt i32 %i.0.i.i17, %mul.i54.i, !dbg !3792
  br i1 %cmp.i.i18, label %for.body.i.i19, label %for.cond130.i.preheader, !dbg !3793

for.cond130.i.preheader:                          ; preds = %for.cond.i.i16
  br label %for.cond130.i, !dbg !3794

for.body.i.i19:                                   ; preds = %for.cond.i.i16
  %div.i55.i = lshr exact i32 %i.0.i.i17, 1, !dbg !3796
  %arrayidx.i56.i = getelementptr inbounds nuw i8, ptr %add.ptr127.i, i32 %div.i55.i, !dbg !3798
  %95 = load i8, ptr %arrayidx.i56.i, align 1, !dbg !3798
  %96 = and i8 %95, 15, !dbg !3799
  %arrayidx2.i.i = getelementptr inbounds nuw i8, ptr %temp.i, i32 %i.0.i.i17, !dbg !3800
  store i8 %96, ptr %arrayidx2.i.i, align 1, !dbg !3801
  %div3.i.i = lshr exact i32 %i.0.i.i17, 1, !dbg !3802
  %arrayidx4.i.i = getelementptr inbounds nuw i8, ptr %add.ptr127.i, i32 %div3.i.i, !dbg !3803
  %97 = load i8, ptr %arrayidx4.i.i, align 1, !dbg !3803
  %98 = lshr i8 %97, 4, !dbg !3804
  %add.i.i = or disjoint i32 %i.0.i.i17, 1, !dbg !3805
  %arrayidx7.i.i = getelementptr inbounds nuw i8, ptr %temp.i, i32 %add.i.i, !dbg !3806
  store i8 %98, ptr %arrayidx7.i.i, align 1, !dbg !3807
  %add8.i.i = add nuw nsw i32 %i.0.i.i17, 2, !dbg !3808
    #dbg_value(i32 %add8.i.i, !3785, !DIExpression(), !3787)
  br label %for.cond.i.i16, !dbg !3809, !llvm.loop !3810

for.cond130.i:                                    ; preds = %for.cond130.i.preheader, %for.body133.i
  %j129.0.i = phi i32 [ %inc139.i, %for.body133.i ], [ 0, %for.cond130.i.preheader ], !dbg !3812
    #dbg_value(i32 %j129.0.i, !3813, !DIExpression(), !3814)
  %exitcond52 = icmp eq i32 %j129.0.i, %20, !dbg !3815
  br i1 %exitcond52, label %for.inc141.i, label %for.body133.i, !dbg !3794

for.body133.i:                                    ; preds = %for.cond130.i
  %arrayidx134.i = getelementptr inbounds nuw [96 x i8], ptr %temp.i, i32 0, i32 %j129.0.i, !dbg !3817
  %99 = load i8, ptr %arrayidx134.i, align 1, !dbg !3817
  %mul135.i = mul nsw i32 %i120.0.i, %add32, !dbg !3819
  %100 = getelementptr i8, ptr %A, i32 %mul135.i, !dbg !3820
  %arrayidx137.i = getelementptr i8, ptr %100, i32 %j129.0.i, !dbg !3820
  store i8 %99, ptr %arrayidx137.i, align 1, !dbg !3821
  %inc139.i = add nuw i32 %j129.0.i, 1, !dbg !3822
    #dbg_value(i32 %inc139.i, !3813, !DIExpression(), !3814)
  br label %for.cond130.i, !dbg !3823, !llvm.loop !3824

for.inc141.i:                                     ; preds = %for.cond130.i
  %inc142.i = add nuw i32 %i120.0.i, 1, !dbg !3826
    #dbg_value(i32 %inc142.i, !3769, !DIExpression(), !3770)
  br label %for.cond121.i, !dbg !3827, !llvm.loop !3828

EF.exit:                                          ; preds = %for.cond121.i
  call void @mayo_secure_clear(ptr noundef nonnull %temp.i, i32 noundef 96) #8, !dbg !3830
  call void @mayo_secure_clear(ptr noundef nonnull %_pivot_row.i, i32 noundef 48) #8, !dbg !3831
  call void @mayo_secure_clear(ptr noundef nonnull %_pivot_row2.i, i32 noundef 48) #8, !dbg !3832
  call void @mayo_secure_clear(ptr noundef nonnull %packed_A.i, i32 noundef 3744) #8, !dbg !3833
  call void @llvm.lifetime.end.p0(i64 48, ptr nonnull %_pivot_row.i), !dbg !3834
  call void @llvm.lifetime.end.p0(i64 48, ptr nonnull %_pivot_row2.i), !dbg !3834
  call void @llvm.lifetime.end.p0(i64 3744, ptr nonnull %packed_A.i), !dbg !3834
  call void @llvm.lifetime.end.p0(i64 96, ptr nonnull %temp.i), !dbg !3834
    #dbg_value(i8 0, !3835, !DIExpression(), !3236)
    #dbg_value(i32 0, !3836, !DIExpression(), !3838)
  %101 = add i32 %A_cols, -1, !dbg !3839
  %smax54 = call i32 @llvm.smax.i32(i32 %101, i32 0), !dbg !3839
  br label %for.cond34, !dbg !3839

for.cond34:                                       ; preds = %for.inc43, %EF.exit
  %full_rank.0 = phi i8 [ 0, %EF.exit ], [ %or12, %for.inc43 ], !dbg !3236
  %i33.0 = phi i32 [ 0, %EF.exit ], [ %inc44, %for.inc43 ], !dbg !3840
    #dbg_value(i32 %i33.0, !3836, !DIExpression(), !3838)
    #dbg_value(i8 %full_rank.0, !3835, !DIExpression(), !3236)
  %exitcond55 = icmp ne i32 %i33.0, %smax54, !dbg !3841
  br i1 %exitcond55, label %for.inc43, label %for.end45, !dbg !3843

for.inc43:                                        ; preds = %for.cond34
    #dbg_value(!DIArgList(i8 poison, i8 poison), !3835, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3236)
  %sub37 = add nsw i32 %m, -1, !dbg !3844
  %mul38 = mul nsw i32 %sub37, %A_cols, !dbg !3846
  %102 = getelementptr i8, ptr %A, i32 %mul38, !dbg !3847
  %arrayidx40 = getelementptr i8, ptr %102, i32 %i33.0, !dbg !3847
  %103 = load i8, ptr %arrayidx40, align 1, !dbg !3847
    #dbg_value(!DIArgList(i8 %full_rank.0, i8 %103), !3835, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3236)
  %or12 = or i8 %full_rank.0, %103, !dbg !3848
    #dbg_value(i8 %or12, !3835, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3236)
    #dbg_value(i8 %or12, !3835, !DIExpression(), !3236)
  %inc44 = add nuw i32 %i33.0, 1, !dbg !3849
    #dbg_value(i32 %inc44, !3836, !DIExpression(), !3838)
  br label %for.cond34, !dbg !3850, !llvm.loop !3851

for.end45:                                        ; preds = %for.cond34
  %full_rank.0.lcssa = phi i8 [ %full_rank.0, %for.cond34 ], !dbg !3236
  %cmp47 = icmp eq i8 %full_rank.0.lcssa, 0, !dbg !3853
  br i1 %cmp47, label %return, label %for.cond50.preheader, !dbg !3853

for.cond50.preheader:                             ; preds = %for.end45
  br label %for.cond50, !dbg !3855

for.cond50.loopexit:                              ; preds = %for.cond63
  br label %for.cond50, !dbg !3855, !llvm.loop !3857

for.cond50:                                       ; preds = %for.cond50.preheader, %for.cond50.loopexit
  %row.0.in = phi i32 [ %row.0, %for.cond50.loopexit ], [ %m, %for.cond50.preheader ]
  %row.0 = add nsw i32 %row.0.in, -1, !dbg !3859
    #dbg_value(i32 %row.0, !3860, !DIExpression(), !3861)
  %cmp51 = icmp sgt i32 %row.0.in, 0, !dbg !3862
  br i1 %cmp51, label %for.body53, label %return.loopexit, !dbg !3855

for.body53:                                       ; preds = %for.cond50
    #dbg_value(i8 0, !3864, !DIExpression(), !3236)
  %sub54 = sub nsw i32 %m, %row.0, !dbg !3865
  %div = sdiv i32 32, %sub54, !dbg !3865
  %add55 = add nsw i32 %row.0, %div, !dbg !3865
  %mul56 = mul nsw i32 %k, %o, !dbg !3865
  %cmp57 = icmp slt i32 %add55, %mul56, !dbg !3865
  br i1 %cmp57, label %cond.true, label %cond.false, !dbg !3865

cond.true:                                        ; preds = %for.body53
  %sub59 = sub nsw i32 %m, %row.0, !dbg !3865
  %div60 = sdiv i32 32, %sub59, !dbg !3865
  %add61 = add nsw i32 %row.0, %div60, !dbg !3865
  br label %cond.end, !dbg !3865

cond.false:                                       ; preds = %for.body53
  %mul62 = mul nsw i32 %k, %o, !dbg !3865
  br label %cond.end, !dbg !3865

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %add61, %cond.true ], [ %mul62, %cond.false ], !dbg !3865
    #dbg_value(i32 %cond, !3867, !DIExpression(), !3236)
    #dbg_value(i32 %row.0, !3868, !DIExpression(), !3870)
  br label %for.cond63, !dbg !3871

for.cond63:                                       ; preds = %for.inc229, %cond.end
  %finished.0 = phi i8 [ 0, %cond.end ], [ %or2273, %for.inc229 ], !dbg !3872
  %col.0 = phi i32 [ %row.0, %cond.end ], [ %inc230, %for.inc229 ], !dbg !3873
    #dbg_value(i32 %col.0, !3868, !DIExpression(), !3870)
    #dbg_value(i8 %finished.0, !3864, !DIExpression(), !3236)
  %cmp64.not = icmp sgt i32 %col.0, %cond, !dbg !3874
  br i1 %cmp64.not, label %for.cond50.loopexit, label %for.body66, !dbg !3876

for.body66:                                       ; preds = %for.cond63
  %mul67 = mul nsw i32 %row.0, %A_cols, !dbg !3877
  %104 = getelementptr i8, ptr %A, i32 %mul67, !dbg !3879
  %arrayidx69 = getelementptr i8, ptr %104, i32 %col.0, !dbg !3879
  %105 = load i8, ptr %arrayidx69, align 1, !dbg !3879
    #dbg_value(i8 %105, !3880, !DIExpression(), !3882)
    #dbg_value(i8 0, !3884, !DIExpression(), !3882)
  %106 = icmp ne i8 %105, 0, !dbg !3885
  %conv3.i = sext i1 %106 to i8, !dbg !3886
  %107 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !3887
  %xor5.i = xor i8 %107, %conv3.i, !dbg !3888
  %not = xor i8 %finished.0, -1, !dbg !3889
    #dbg_value(!DIArgList(i8 %xor5.i, i8 %not), !3890, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_and, DW_OP_stack_value), !3236)
  %add76 = mul i32 %row.0.in, %A_cols, !dbg !3891
  %108 = getelementptr i8, ptr %A, i32 %add76, !dbg !3892
  %arrayidx78 = getelementptr i8, ptr %108, i32 -1, !dbg !3892
  %109 = load i8, ptr %arrayidx78, align 1, !dbg !3892
  %110 = and i8 %109, %not, !dbg !3893
  %and801 = and i8 %110, %xor5.i, !dbg !3893
    #dbg_value(i8 %and801, !3894, !DIExpression(), !3895)
  %arrayidx83 = getelementptr inbounds i8, ptr %x, i32 %col.0, !dbg !3896
  %111 = load i8, ptr %arrayidx83, align 1, !dbg !3897
  %xor2 = xor i8 %111, %and801, !dbg !3897
  store i8 %xor2, ptr %arrayidx83, align 1, !dbg !3897
    #dbg_value(i32 0, !3898, !DIExpression(), !3900)
  br label %for.cond87, !dbg !3901

for.cond87:                                       ; preds = %for.body90, %for.body66
  %i86.0 = phi i32 [ 0, %for.body66 ], [ %add223, %for.body90 ], !dbg !3902
    #dbg_value(i32 %i86.0, !3898, !DIExpression(), !3900)
  %cmp88 = icmp slt i32 %i86.0, %row.0, !dbg !3903
  br i1 %cmp88, label %for.body90, label %for.inc229, !dbg !3905

for.body90:                                       ; preds = %for.cond87
  %mul91 = mul nsw i32 %i86.0, %A_cols, !dbg !3906
  %112 = getelementptr i8, ptr %A, i32 %mul91, !dbg !3908
  %arrayidx93 = getelementptr i8, ptr %112, i32 %col.0, !dbg !3908
  %113 = load i8, ptr %arrayidx93, align 1, !dbg !3908
  %conv94 = zext i8 %113 to i64, !dbg !3909
  %add95 = or disjoint i32 %i86.0, 1, !dbg !3910
  %mul96 = mul nsw i32 %add95, %A_cols, !dbg !3911
  %114 = getelementptr i8, ptr %A, i32 %mul96, !dbg !3912
  %arrayidx98 = getelementptr i8, ptr %114, i32 %col.0, !dbg !3912
  %115 = load i8, ptr %arrayidx98, align 1, !dbg !3912
  %conv99 = zext i8 %115 to i64, !dbg !3913
  %shl100 = shl nuw nsw i64 %conv99, 8, !dbg !3914
  %xor101 = or disjoint i64 %shl100, %conv94, !dbg !3915
  %add102 = or disjoint i32 %i86.0, 2, !dbg !3916
  %mul103 = mul nsw i32 %add102, %A_cols, !dbg !3917
  %116 = getelementptr i8, ptr %A, i32 %mul103, !dbg !3918
  %arrayidx105 = getelementptr i8, ptr %116, i32 %col.0, !dbg !3918
  %117 = load i8, ptr %arrayidx105, align 1, !dbg !3918
  %conv106 = zext i8 %117 to i64, !dbg !3919
  %shl107 = shl nuw nsw i64 %conv106, 16, !dbg !3920
  %xor108 = or disjoint i64 %xor101, %shl107, !dbg !3921
  %add109 = or disjoint i32 %i86.0, 3, !dbg !3922
  %mul110 = mul nsw i32 %add109, %A_cols, !dbg !3923
  %118 = getelementptr i8, ptr %A, i32 %mul110, !dbg !3924
  %arrayidx112 = getelementptr i8, ptr %118, i32 %col.0, !dbg !3924
  %119 = load i8, ptr %arrayidx112, align 1, !dbg !3924
  %conv113 = zext i8 %119 to i64, !dbg !3925
  %shl114 = shl nuw nsw i64 %conv113, 24, !dbg !3926
  %xor115 = or disjoint i64 %xor108, %shl114, !dbg !3927
  %add116 = or disjoint i32 %i86.0, 4, !dbg !3928
  %mul117 = mul nsw i32 %add116, %A_cols, !dbg !3929
  %120 = getelementptr i8, ptr %A, i32 %mul117, !dbg !3930
  %arrayidx119 = getelementptr i8, ptr %120, i32 %col.0, !dbg !3930
  %121 = load i8, ptr %arrayidx119, align 1, !dbg !3930
  %conv120 = zext i8 %121 to i64, !dbg !3931
  %shl121 = shl nuw nsw i64 %conv120, 32, !dbg !3932
  %xor122 = or disjoint i64 %xor115, %shl121, !dbg !3933
  %add123 = or disjoint i32 %i86.0, 5, !dbg !3934
  %mul124 = mul nsw i32 %add123, %A_cols, !dbg !3935
  %122 = getelementptr i8, ptr %A, i32 %mul124, !dbg !3936
  %arrayidx126 = getelementptr i8, ptr %122, i32 %col.0, !dbg !3936
  %123 = load i8, ptr %arrayidx126, align 1, !dbg !3936
  %conv127 = zext i8 %123 to i64, !dbg !3937
  %shl128 = shl nuw nsw i64 %conv127, 40, !dbg !3938
  %xor129 = xor i64 %xor122, %shl128, !dbg !3939
  %add130 = or disjoint i32 %i86.0, 6, !dbg !3940
  %mul131 = mul nsw i32 %add130, %A_cols, !dbg !3941
  %124 = getelementptr i8, ptr %A, i32 %mul131, !dbg !3942
  %arrayidx133 = getelementptr i8, ptr %124, i32 %col.0, !dbg !3942
  %125 = load i8, ptr %arrayidx133, align 1, !dbg !3942
  %conv134 = zext i8 %125 to i64, !dbg !3943
  %shl135 = shl nuw nsw i64 %conv134, 48, !dbg !3944
  %xor136 = xor i64 %xor129, %shl135, !dbg !3945
  %add137 = or disjoint i32 %i86.0, 7, !dbg !3946
  %mul138 = mul nsw i32 %add137, %A_cols, !dbg !3947
  %126 = getelementptr i8, ptr %A, i32 %mul138, !dbg !3948
  %arrayidx140 = getelementptr i8, ptr %126, i32 %col.0, !dbg !3948
  %127 = load i8, ptr %arrayidx140, align 1, !dbg !3948
  %conv141 = zext i8 %127 to i64, !dbg !3949
  %shl142 = shl nuw i64 %conv141, 56, !dbg !3950
  %xor143 = xor i64 %xor136, %shl142, !dbg !3951
    #dbg_value(i64 %xor143, !3952, !DIExpression(), !3953)
    #dbg_value(i8 %and801, !3954, !DIExpression(), !3958)
    #dbg_value(i64 %xor143, !3960, !DIExpression(), !3958)
  %128 = and i8 %and801, 1, !dbg !3961
  %conv1.i = zext nneg i8 %128 to i64, !dbg !3962
  %mul.i = mul nuw nsw i64 %xor143, %conv1.i, !dbg !3963
    #dbg_value(i64 %mul.i, !3964, !DIExpression(), !3958)
  %129 = and i8 %and801, 2, !dbg !3965
  %conv4.i = zext nneg i8 %129 to i64, !dbg !3966
  %mul5.i = mul i64 %xor143, %conv4.i, !dbg !3967
  %xor.i = xor i64 %mul.i, %mul5.i, !dbg !3968
    #dbg_value(i64 %xor.i, !3964, !DIExpression(), !3958)
  %130 = and i8 %and801, 4, !dbg !3969
  %conv8.i = zext nneg i8 %130 to i64, !dbg !3970
  %mul9.i = mul i64 %xor143, %conv8.i, !dbg !3971
  %xor10.i = xor i64 %xor.i, %mul9.i, !dbg !3972
    #dbg_value(i64 %xor10.i, !3964, !DIExpression(), !3958)
  %131 = and i8 %and801, 8, !dbg !3973
  %conv13.i = zext nneg i8 %131 to i64, !dbg !3974
  %mul14.i = mul i64 %xor143, %conv13.i, !dbg !3975
  %xor15.i = xor i64 %xor10.i, %mul14.i, !dbg !3976
    #dbg_value(i64 %xor15.i, !3964, !DIExpression(), !3958)
    #dbg_value(i64 %xor15.i, !3977, !DIExpression(DW_OP_constu, 17361641481138401520, DW_OP_and, DW_OP_stack_value), !3958)
  %shr.i = lshr i64 %xor15.i, 4, !dbg !3978
  %and16.i = lshr i64 %xor15.i, 3, !dbg !3979
  %shr18.i = and i64 %and16.i, 1012762419733073422, !dbg !3979
  %132 = xor i64 %shr.i, %shr18.i, !dbg !3980
  %xor19.i = xor i64 %132, %xor15.i, !dbg !3980
    #dbg_value(i64 %xor19.i, !3981, !DIExpression(DW_OP_constu, 1085102592571150095, DW_OP_and, DW_OP_stack_value), !3958)
    #dbg_value(i64 %xor19.i, !3952, !DIExpression(DW_OP_constu, 1085102592571150095, DW_OP_and, DW_OP_stack_value), !3953)
  %mul1464 = or disjoint i32 %i86.0, 1, !dbg !3982
  %add147 = mul i32 %mul1464, %A_cols, !dbg !3982
  %133 = getelementptr i8, ptr %A, i32 %add147, !dbg !3983
  %arrayidx149 = getelementptr i8, ptr %133, i32 -1, !dbg !3983
  %134 = load i8, ptr %arrayidx149, align 1, !dbg !3984
  %135 = trunc i64 %xor19.i to i8, !dbg !3984
  %136 = and i8 %135, 15, !dbg !3984
  %conv152 = xor i8 %136, %134, !dbg !3984
  store i8 %conv152, ptr %arrayidx149, align 1, !dbg !3984
  %shr = lshr i64 %xor19.i, 8, !dbg !3985
  %mul1555 = or disjoint i32 %i86.0, 2, !dbg !3986
  %add156 = mul i32 %mul1555, %A_cols, !dbg !3986
  %137 = getelementptr i8, ptr %A, i32 %add156, !dbg !3987
  %arrayidx158 = getelementptr i8, ptr %137, i32 -1, !dbg !3987
  %138 = load i8, ptr %arrayidx158, align 1, !dbg !3988
  %139 = trunc i64 %shr to i8, !dbg !3988
  %140 = and i8 %139, 15, !dbg !3988
  %conv161 = xor i8 %140, %138, !dbg !3988
  store i8 %conv161, ptr %arrayidx158, align 1, !dbg !3988
  %shr162 = lshr i64 %xor19.i, 16, !dbg !3989
  %mul1656 = or disjoint i32 %i86.0, 3, !dbg !3990
  %add166 = mul i32 %mul1656, %A_cols, !dbg !3990
  %141 = getelementptr i8, ptr %A, i32 %add166, !dbg !3991
  %arrayidx168 = getelementptr i8, ptr %141, i32 -1, !dbg !3991
  %142 = load i8, ptr %arrayidx168, align 1, !dbg !3992
  %143 = trunc i64 %shr162 to i8, !dbg !3992
  %144 = and i8 %143, 15, !dbg !3992
  %conv171 = xor i8 %144, %142, !dbg !3992
  store i8 %conv171, ptr %arrayidx168, align 1, !dbg !3992
  %shr172 = lshr i64 %xor19.i, 24, !dbg !3993
  %mul1757 = or disjoint i32 %i86.0, 4, !dbg !3994
  %add176 = mul i32 %mul1757, %A_cols, !dbg !3994
  %145 = getelementptr i8, ptr %A, i32 %add176, !dbg !3995
  %arrayidx178 = getelementptr i8, ptr %145, i32 -1, !dbg !3995
  %146 = load i8, ptr %arrayidx178, align 1, !dbg !3996
  %147 = trunc i64 %shr172 to i8, !dbg !3996
  %148 = and i8 %147, 15, !dbg !3996
  %conv181 = xor i8 %148, %146, !dbg !3996
  store i8 %conv181, ptr %arrayidx178, align 1, !dbg !3996
  %shr182 = lshr i64 %xor19.i, 32, !dbg !3997
  %mul1858 = or disjoint i32 %i86.0, 5, !dbg !3998
  %add186 = mul i32 %mul1858, %A_cols, !dbg !3998
  %149 = getelementptr i8, ptr %A, i32 %add186, !dbg !3999
  %arrayidx188 = getelementptr i8, ptr %149, i32 -1, !dbg !3999
  %150 = load i8, ptr %arrayidx188, align 1, !dbg !4000
  %151 = trunc i64 %shr182 to i8, !dbg !4000
  %152 = and i8 %151, 15, !dbg !4000
  %conv191 = xor i8 %152, %150, !dbg !4000
  store i8 %conv191, ptr %arrayidx188, align 1, !dbg !4000
  %shr192 = lshr i64 %xor19.i, 40, !dbg !4001
  %mul1959 = or disjoint i32 %i86.0, 6, !dbg !4002
  %add196 = mul i32 %mul1959, %A_cols, !dbg !4002
  %153 = getelementptr i8, ptr %A, i32 %add196, !dbg !4003
  %arrayidx198 = getelementptr i8, ptr %153, i32 -1, !dbg !4003
  %154 = load i8, ptr %arrayidx198, align 1, !dbg !4004
  %155 = trunc i64 %shr192 to i8, !dbg !4004
  %156 = and i8 %155, 15, !dbg !4004
  %conv201 = xor i8 %156, %154, !dbg !4004
  store i8 %conv201, ptr %arrayidx198, align 1, !dbg !4004
  %shr202 = lshr i64 %xor19.i, 48, !dbg !4005
  %mul20510 = or disjoint i32 %i86.0, 7, !dbg !4006
  %add206 = mul i32 %mul20510, %A_cols, !dbg !4006
  %157 = getelementptr i8, ptr %A, i32 %add206, !dbg !4007
  %arrayidx208 = getelementptr i8, ptr %157, i32 -1, !dbg !4007
  %158 = load i8, ptr %arrayidx208, align 1, !dbg !4008
  %159 = trunc i64 %shr202 to i8, !dbg !4008
  %160 = and i8 %159, 15, !dbg !4008
  %conv211 = xor i8 %160, %158, !dbg !4008
  store i8 %conv211, ptr %arrayidx208, align 1, !dbg !4008
  %and20.i = lshr i64 %xor19.i, 56, !dbg !4009
  %mul21511 = add nuw i32 %i86.0, 8, !dbg !4010
  %add216 = mul i32 %mul21511, %A_cols, !dbg !4010
  %161 = getelementptr i8, ptr %A, i32 %add216, !dbg !4011
  %arrayidx218 = getelementptr i8, ptr %161, i32 -1, !dbg !4011
  %162 = load i8, ptr %arrayidx218, align 1, !dbg !4012
  %163 = trunc nuw i64 %and20.i to i8, !dbg !4012
  %164 = and i8 %163, 15, !dbg !4012
  %conv221 = xor i8 %164, %162, !dbg !4012
  store i8 %conv221, ptr %arrayidx218, align 1, !dbg !4012
  %add223 = add nuw nsw i32 %i86.0, 8, !dbg !4013
    #dbg_value(i32 %add223, !3898, !DIExpression(), !3900)
  br label %for.cond87, !dbg !4014, !llvm.loop !4015

for.inc229:                                       ; preds = %for.cond87
    #dbg_value(!DIArgList(i8 %finished.0, i8 %xor5.i), !3864, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3236)
  %or2273 = or i8 %finished.0, %xor5.i, !dbg !4017
    #dbg_value(i8 %or2273, !3864, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3236)
    #dbg_value(i8 %or2273, !3864, !DIExpression(), !3236)
  %inc230 = add nsw i32 %col.0, 1, !dbg !4018
    #dbg_value(i32 %inc230, !3868, !DIExpression(), !3870)
  br label %for.cond63, !dbg !4019, !llvm.loop !4020

return.loopexit:                                  ; preds = %for.cond50
  br label %return, !dbg !4022

return:                                           ; preds = %return.loopexit, %for.end45
  %retval.0 = phi i32 [ 0, %for.end45 ], [ 1, %return.loopexit ], !dbg !3236
  ret i32 %retval.0, !dbg !4022
}

; Function Attrs: nounwind
define internal fastcc void @vec_mul_add_u64(i32 noundef %legs, ptr noundef %in, i8 noundef zeroext %a, ptr noundef %acc) unnamed_addr #0 !dbg !4023 {
entry:
    #dbg_value(i32 %legs, !4026, !DIExpression(), !4027)
    #dbg_value(ptr %in, !4028, !DIExpression(), !4027)
    #dbg_value(i8 %a, !4029, !DIExpression(), !4027)
    #dbg_value(ptr %acc, !4030, !DIExpression(), !4027)
    #dbg_value(i8 %a, !4031, !DIExpression(), !4033)
  %conv.i = zext i8 %a to i32, !dbg !4035
  %mul.i = mul i32 %conv.i, 134480385, !dbg !4036
    #dbg_value(i32 %mul.i, !4037, !DIExpression(), !4033)
    #dbg_value(i32 -252645136, !4038, !DIExpression(), !4033)
  %and.i = and i32 %mul.i, -252645136, !dbg !4039
    #dbg_value(i32 %and.i, !4040, !DIExpression(), !4033)
  %shr.i = lshr exact i32 %and.i, 4, !dbg !4041
  %shr1.i = lshr exact i32 %and.i, 3, !dbg !4042
  %0 = xor i32 %shr.i, %shr1.i, !dbg !4043
  %xor2.i = xor i32 %0, %mul.i, !dbg !4043
    #dbg_value(i32 %xor2.i, !4044, !DIExpression(), !4027)
    #dbg_value(i64 1229782938247303441, !4045, !DIExpression(), !4027)
    #dbg_value(i32 0, !4046, !DIExpression(), !4048)
  %smax = call i32 @llvm.smax.i32(i32 %legs, i32 0), !dbg !4049
  br label %for.cond, !dbg !4049

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !4050
    #dbg_value(i32 %i.0, !4046, !DIExpression(), !4048)
  %exitcond = icmp ne i32 %i.0, %smax, !dbg !4051
  br i1 %exitcond, label %for.body, label %for.end, !dbg !4053

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !4054
  %1 = load i64, ptr %arrayidx, align 8, !dbg !4054
  %and = and i64 %1, 1229782938247303441, !dbg !4056
  %and1 = and i32 %xor2.i, 255, !dbg !4057
  %conv = zext nneg i32 %and1 to i64, !dbg !4058
  %mul = mul i64 %and, %conv, !dbg !4059
  %shr = lshr i64 %1, 1, !dbg !4060
  %and3 = and i64 %shr, 1229782938247303441, !dbg !4061
  %shr4 = lshr i32 %xor2.i, 8, !dbg !4062
  %and5 = and i32 %shr4, 15, !dbg !4063
  %conv6 = zext nneg i32 %and5 to i64, !dbg !4064
  %mul7 = mul nuw i64 %and3, %conv6, !dbg !4065
  %xor = xor i64 %mul, %mul7, !dbg !4066
  %arrayidx8 = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !4067
  %2 = load i64, ptr %arrayidx8, align 8, !dbg !4067
  %shr9 = lshr i64 %2, 2, !dbg !4068
  %and10 = and i64 %shr9, 1229782938247303441, !dbg !4069
  %shr11 = lshr i32 %xor2.i, 16, !dbg !4070
  %and12 = and i32 %shr11, 15, !dbg !4071
  %conv13 = zext nneg i32 %and12 to i64, !dbg !4072
  %mul14 = mul nuw i64 %and10, %conv13, !dbg !4073
  %xor15 = xor i64 %xor, %mul14, !dbg !4074
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !4075
  %3 = load i64, ptr %arrayidx16, align 8, !dbg !4075
  %shr17 = lshr i64 %3, 3, !dbg !4076
  %and18 = and i64 %shr17, 1229782938247303441, !dbg !4077
  %shr19 = lshr i32 %xor2.i, 24, !dbg !4078
  %and20 = and i32 %shr19, 15, !dbg !4079
  %conv21 = zext nneg i32 %and20 to i64, !dbg !4080
  %mul22 = mul nuw i64 %and18, %conv21, !dbg !4081
  %xor23 = xor i64 %xor15, %mul22, !dbg !4082
  %arrayidx24 = getelementptr inbounds nuw i64, ptr %acc, i32 %i.0, !dbg !4083
  %4 = load i64, ptr %arrayidx24, align 8, !dbg !4084
  %xor25 = xor i64 %4, %xor23, !dbg !4084
  store i64 %xor25, ptr %arrayidx24, align 8, !dbg !4084
  %inc = add nuw i32 %i.0, 1, !dbg !4085
    #dbg_value(i32 %inc, !4046, !DIExpression(), !4048)
  br label %for.cond, !dbg !4086, !llvm.loop !4087

for.end:                                          ; preds = %for.cond
  ret void, !dbg !4089
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
!83 = distinct !DIGlobalVariable(name: "pqmayo_MAYO_1_ref_uint32_t_blocker", scope: !84, file: !99, line: 126, type: !104, isLocal: false, isDefinition: true)
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
!98 = distinct !DIGlobalVariable(name: "pqmayo_MAYO_1_ref_uint64_t_blocker", scope: !84, file: !99, line: 127, type: !100, isLocal: false, isDefinition: true)
!99 = !DIFile(filename: "../../../src/arithmetic.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!100 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !53)
!101 = !DIGlobalVariableExpression(var: !102, expr: !DIExpression())
!102 = distinct !DIGlobalVariable(name: "pqmayo_MAYO_1_ref_unsigned_char_blocker", scope: !84, file: !99, line: 128, type: !103, isLocal: false, isDefinition: true)
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
!166 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sk_t", file: !79, line: 291, size: 1190592, elements: !167)
!167 = !{!168, !172}
!168 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !166, file: !79, line: 292, baseType: !169, size: 1185600)
!169 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 1185600, elements: !170)
!170 = !{!171}
!171 = !DISubrange(count: 18525)
!172 = !DIDerivedType(tag: DW_TAG_member, name: "O", scope: !166, file: !79, line: 293, baseType: !173, size: 4992, offset: 1185600)
!173 = !DICompositeType(tag: DW_TAG_array_type, baseType: !174, size: 4992, elements: !176)
!174 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !54, line: 24, baseType: !175)
!175 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !56, line: 43, baseType: !51)
!176 = !{!177}
!177 = !DISubrange(count: 624)
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
!190 = distinct !DISubprogram(name: "pqmayo_MAYO_1_ref_mayo_keypair", scope: !68, file: !68, line: 298, type: !191, scopeLine: 298, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
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
!248 = distinct !DISubprogram(name: "pqmayo_MAYO_1_ref_mayo_expand_pk", scope: !68, file: !68, line: 608, type: !249, scopeLine: 609, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
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
!278 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 320, elements: !279)
!279 = !{!280}
!280 = !DISubrange(count: 5)
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
!338 = distinct !DISubprogram(name: "pqmayo_MAYO_1_ref_mayo_open", scope: !68, file: !68, line: 520, type: !339, scopeLine: 522, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
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
!394 = distinct !DISubprogram(name: "pqmayo_MAYO_1_ref_mayo_keypair_compact", scope: !68, file: !68, line: 538, type: !191, scopeLine: 539, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!395 = !DILocalVariable(name: "p", arg: 1, scope: !394, file: !68, line: 538, type: !193)
!396 = !DILocation(line: 0, scope: !394)
!397 = !DILocalVariable(name: "cpk", arg: 2, scope: !394, file: !68, line: 538, type: !61)
!398 = !DILocalVariable(name: "csk", arg: 3, scope: !394, file: !68, line: 539, type: !61)
!399 = !DILocalVariable(name: "ret", scope: !394, file: !68, line: 540, type: !86)
!400 = !DILocalVariable(name: "seed_sk", scope: !394, file: !68, line: 541, type: !61)
!401 = !DILocalVariable(name: "S", scope: !394, file: !68, line: 542, type: !402)
!402 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 2624, elements: !403)
!403 = !{!404}
!404 = !DISubrange(count: 328)
!405 = !DILocation(line: 542, column: 19, scope: !394)
!406 = !DILocalVariable(name: "P", scope: !394, file: !68, line: 543, type: !169)
!407 = !DILocation(line: 543, column: 14, scope: !394)
!408 = !DILocalVariable(name: "P3", scope: !394, file: !68, line: 544, type: !409)
!409 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 20480, elements: !410)
!410 = !{!411}
!411 = !DISubrange(count: 320)
!412 = !DILocation(line: 544, column: 14, scope: !394)
!413 = !DILocalVariable(name: "O", scope: !394, file: !68, line: 547, type: !414)
!414 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 4992, elements: !176)
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
!618 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 11520, elements: !619)
!619 = !{!620}
!620 = !DISubrange(count: 180)
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
!730 = distinct !DISubprogram(name: "pqmayo_MAYO_1_ref_mayo_expand_sk", scope: !68, file: !68, line: 310, type: !731, scopeLine: 311, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!731 = !DISubroutineType(types: !732)
!732 = !{!86, !193, !90, !733}
!733 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !734, size: 32)
!734 = !DIDerivedType(tag: DW_TAG_typedef, name: "sk_t", file: !79, line: 294, baseType: !735)
!735 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sk_t", file: !79, line: 291, size: 1190592, elements: !736)
!736 = !{!737, !738}
!737 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !735, file: !79, line: 292, baseType: !169, size: 1185600)
!738 = !DIDerivedType(tag: DW_TAG_member, name: "O", scope: !735, file: !79, line: 293, baseType: !173, size: 4992, offset: 1185600)
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
!842 = !DILocation(line: 234, column: 98, scope: !840, inlinedAt: !804)
!843 = !DILocation(line: 234, column: 84, scope: !840, inlinedAt: !804)
!844 = !DILocation(line: 234, column: 127, scope: !840, inlinedAt: !804)
!845 = !DILocation(line: 234, column: 137, scope: !840, inlinedAt: !804)
!846 = !DILocation(line: 234, column: 108, scope: !840, inlinedAt: !804)
!847 = !DILocation(line: 234, column: 17, scope: !840, inlinedAt: !804)
!848 = !DILocation(line: 235, column: 47, scope: !840, inlinedAt: !804)
!849 = !DILocation(line: 235, column: 88, scope: !840, inlinedAt: !804)
!850 = !DILocation(line: 235, column: 98, scope: !840, inlinedAt: !804)
!851 = !DILocation(line: 235, column: 84, scope: !840, inlinedAt: !804)
!852 = !DILocation(line: 235, column: 127, scope: !840, inlinedAt: !804)
!853 = !DILocation(line: 235, column: 137, scope: !840, inlinedAt: !804)
!854 = !DILocation(line: 235, column: 108, scope: !840, inlinedAt: !804)
!855 = !DILocation(line: 235, column: 17, scope: !840, inlinedAt: !804)
!856 = !DILocation(line: 233, column: 44, scope: !838, inlinedAt: !804)
!857 = !DILocation(line: 233, column: 13, scope: !838, inlinedAt: !804)
!858 = distinct !{!858, !832, !859, !300}
!859 = !DILocation(line: 236, column: 13, scope: !833, inlinedAt: !804)
!860 = !DILocation(line: 0, scope: !831, inlinedAt: !804)
!861 = !DILocation(line: 228, column: 39, scope: !828, inlinedAt: !804)
!862 = !DILocation(line: 228, column: 9, scope: !828, inlinedAt: !804)
!863 = distinct !{!863, !821, !864, !300}
!864 = !DILocation(line: 238, column: 9, scope: !822, inlinedAt: !804)
!865 = !DILocation(line: 227, column: 35, scope: !819, inlinedAt: !804)
!866 = !DILocation(line: 227, column: 5, scope: !819, inlinedAt: !804)
!867 = distinct !{!867, !820, !868, !300}
!868 = !DILocation(line: 239, column: 5, scope: !813, inlinedAt: !804)
!869 = !DILocation(line: 355, column: 5, scope: !730)
!870 = !DILocation(line: 356, column: 5, scope: !730)
!871 = distinct !DISubprogram(name: "pqmayo_MAYO_1_ref_mayo_sign_signature", scope: !68, file: !68, line: 359, type: !339, scopeLine: 361, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!872 = !DILocalVariable(name: "p", arg: 1, scope: !871, file: !68, line: 359, type: !193)
!873 = !DILocation(line: 0, scope: !871)
!874 = !DILocalVariable(name: "sig", arg: 2, scope: !871, file: !68, line: 359, type: !61)
!875 = !DILocalVariable(name: "siglen", arg: 3, scope: !871, file: !68, line: 360, type: !341)
!876 = !DILocalVariable(name: "m", arg: 4, scope: !871, file: !68, line: 360, type: !90)
!877 = !DILocalVariable(name: "mlen", arg: 5, scope: !871, file: !68, line: 361, type: !58)
!878 = !DILocalVariable(name: "csk", arg: 6, scope: !871, file: !68, line: 361, type: !90)
!879 = !DILocalVariable(name: "ret", scope: !871, file: !68, line: 362, type: !86)
!880 = !DILocalVariable(name: "tenc", scope: !871, file: !68, line: 363, type: !881)
!881 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 312, elements: !39)
!882 = !DILocation(line: 363, column: 19, scope: !871)
!883 = !DILocalVariable(name: "t", scope: !871, file: !68, line: 363, type: !884)
!884 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 624, elements: !885)
!885 = !{!886}
!886 = !DISubrange(count: 78)
!887 = !DILocation(line: 363, column: 38, scope: !871)
!888 = !DILocalVariable(name: "y", scope: !871, file: !68, line: 364, type: !884)
!889 = !DILocation(line: 364, column: 19, scope: !871)
!890 = !DILocalVariable(name: "salt", scope: !871, file: !68, line: 365, type: !891)
!891 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 192, elements: !892)
!892 = !{!893}
!893 = !DISubrange(count: 24)
!894 = !DILocation(line: 365, column: 19, scope: !871)
!895 = !DILocalVariable(name: "V", scope: !871, file: !68, line: 366, type: !896)
!896 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 3440, elements: !897)
!897 = !{!898}
!898 = !DISubrange(count: 430)
!899 = !DILocation(line: 366, column: 19, scope: !871)
!900 = !DILocalVariable(name: "Vdec", scope: !871, file: !68, line: 366, type: !901)
!901 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 6240, elements: !902)
!902 = !{!903}
!903 = !DISubrange(count: 780)
!904 = !DILocation(line: 366, column: 57, scope: !871)
!905 = !DILocalVariable(name: "A", scope: !871, file: !68, line: 367, type: !906)
!906 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 51840, elements: !907)
!907 = !{!908}
!908 = !DISubrange(count: 6480)
!909 = !DILocation(line: 367, column: 19, scope: !871)
!910 = !DILocalVariable(name: "x", scope: !871, file: !68, line: 368, type: !911)
!911 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 6880, elements: !912)
!912 = !{!913}
!913 = !DISubrange(count: 860)
!914 = !DILocation(line: 368, column: 19, scope: !871)
!915 = !DILocalVariable(name: "r", scope: !871, file: !68, line: 369, type: !916)
!916 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 648, elements: !917)
!917 = !{!918}
!918 = !DISubrange(count: 81)
!919 = !DILocation(line: 369, column: 19, scope: !871)
!920 = !DILocalVariable(name: "s", scope: !871, file: !68, line: 370, type: !911)
!921 = !DILocation(line: 370, column: 19, scope: !871)
!922 = !DILocalVariable(name: "sk", scope: !871, file: !68, line: 372, type: !734, align: 256)
!923 = !DILocation(line: 372, column: 22, scope: !871)
!924 = !DILocalVariable(name: "Ox", scope: !871, file: !68, line: 373, type: !884)
!925 = !DILocation(line: 373, column: 19, scope: !871)
!926 = !DILocalVariable(name: "tmp", scope: !871, file: !68, line: 374, type: !916)
!927 = !DILocation(line: 374, column: 19, scope: !871)
!928 = !DILocalVariable(name: "param_m", scope: !871, file: !68, line: 378, type: !275)
!929 = !DILocalVariable(name: "param_n", scope: !871, file: !68, line: 379, type: !275)
!930 = !DILocalVariable(name: "param_o", scope: !871, file: !68, line: 380, type: !275)
!931 = !DILocalVariable(name: "param_k", scope: !871, file: !68, line: 381, type: !275)
!932 = !DILocalVariable(name: "param_v", scope: !871, file: !68, line: 382, type: !275)
!933 = !DILocalVariable(name: "param_m_bytes", scope: !871, file: !68, line: 383, type: !275)
!934 = !DILocalVariable(name: "param_v_bytes", scope: !871, file: !68, line: 384, type: !275)
!935 = !DILocalVariable(name: "param_r_bytes", scope: !871, file: !68, line: 385, type: !275)
!936 = !DILocalVariable(name: "param_sig_bytes", scope: !871, file: !68, line: 386, type: !275)
!937 = !DILocalVariable(name: "param_A_cols", scope: !871, file: !68, line: 387, type: !275)
!938 = !DILocalVariable(name: "param_digest_bytes", scope: !871, file: !68, line: 388, type: !275)
!939 = !DILocalVariable(name: "param_sk_seed_bytes", scope: !871, file: !68, line: 389, type: !275)
!940 = !DILocalVariable(name: "param_salt_bytes", scope: !871, file: !68, line: 390, type: !275)
!941 = !DILocation(line: 392, column: 11, scope: !871)
!942 = !DILocation(line: 393, column: 13, scope: !943)
!943 = distinct !DILexicalBlock(scope: !871, file: !68, line: 393, column: 9)
!944 = !DILocalVariable(name: "seed_sk", scope: !871, file: !68, line: 371, type: !90)
!945 = !DILocation(line: 401, column: 5, scope: !871)
!946 = !DILocalVariable(name: "P1", scope: !871, file: !68, line: 403, type: !52)
!947 = !DILocation(line: 404, column: 23, scope: !871)
!948 = !DILocalVariable(name: "L", scope: !871, file: !68, line: 404, type: !52)
!949 = !DILocalVariable(name: "Mtmp", scope: !871, file: !68, line: 405, type: !950)
!950 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 25600, elements: !951)
!951 = !{!952}
!952 = !DISubrange(count: 400)
!953 = !DILocation(line: 405, column: 14, scope: !871)
!954 = !DILocation(line: 420, column: 25, scope: !955)
!955 = distinct !DILexicalBlock(scope: !871, file: !68, line: 420, column: 9)
!956 = !DILocation(line: 420, column: 9, scope: !955)
!957 = !DILocation(line: 420, column: 65, scope: !955)
!958 = !DILocation(line: 427, column: 37, scope: !871)
!959 = !DILocation(line: 427, column: 5, scope: !871)
!960 = !DILocation(line: 429, column: 5, scope: !871)
!961 = !DILocation(line: 437, column: 16, scope: !871)
!962 = !DILocation(line: 437, column: 5, scope: !871)
!963 = !DILocalVariable(name: "ctrbyte", scope: !871, file: !68, line: 375, type: !61)
!964 = !DILocation(line: 440, column: 5, scope: !871)
!965 = !DILocation(line: 0, scope: !435, inlinedAt: !966)
!966 = distinct !DILocation(line: 442, column: 5, scope: !871)
!967 = !DILocation(line: 22, column: 10, scope: !444, inlinedAt: !966)
!968 = !DILocation(line: 22, scope: !444, inlinedAt: !966)
!969 = !DILocation(line: 22, column: 19, scope: !447, inlinedAt: !966)
!970 = !DILocation(line: 22, column: 5, scope: !444, inlinedAt: !966)
!971 = !DILocation(line: 438, column: 59, scope: !871)
!972 = !DILocation(line: 444, column: 5, scope: !973)
!973 = distinct !DILexicalBlock(scope: !871, file: !68, line: 444, column: 5)
!974 = !DILocation(line: 23, column: 19, scope: !450, inlinedAt: !966)
!975 = !DILocation(line: 23, column: 24, scope: !450, inlinedAt: !966)
!976 = !DILocation(line: 23, column: 14, scope: !450, inlinedAt: !966)
!977 = !DILocation(line: 23, column: 17, scope: !450, inlinedAt: !966)
!978 = !DILocation(line: 24, column: 24, scope: !450, inlinedAt: !966)
!979 = !DILocation(line: 24, column: 17, scope: !450, inlinedAt: !966)
!980 = !DILocation(line: 24, column: 14, scope: !450, inlinedAt: !966)
!981 = !DILocation(line: 22, column: 34, scope: !447, inlinedAt: !966)
!982 = !DILocation(line: 22, column: 5, scope: !447, inlinedAt: !966)
!983 = distinct !{!983, !970, !984, !300}
!984 = !DILocation(line: 25, column: 5, scope: !444, inlinedAt: !966)
!985 = !DILocation(line: 444, scope: !973)
!986 = !DILocalVariable(name: "ctr", scope: !973, file: !68, line: 444, type: !86)
!987 = !DILocation(line: 0, scope: !973)
!988 = !DILocation(line: 444, column: 27, scope: !989)
!989 = distinct !DILexicalBlock(scope: !973, file: !68, line: 444, column: 5)
!990 = !DILocation(line: 445, column: 20, scope: !991)
!991 = distinct !DILexicalBlock(scope: !989, file: !68, line: 444, column: 42)
!992 = !DILocation(line: 445, column: 18, scope: !991)
!993 = !DILocation(line: 447, column: 9, scope: !991)
!994 = !DILocalVariable(name: "i", scope: !995, file: !68, line: 451, type: !86)
!995 = distinct !DILexicalBlock(scope: !991, file: !68, line: 451, column: 9)
!996 = !DILocation(line: 0, scope: !995)
!997 = !DILocation(line: 451, column: 14, scope: !995)
!998 = !DILocation(line: 451, scope: !995)
!999 = !DILocation(line: 451, column: 27, scope: !1000)
!1000 = distinct !DILexicalBlock(scope: !995, file: !68, line: 451, column: 9)
!1001 = !DILocation(line: 451, column: 9, scope: !995)
!1002 = !DILocation(line: 452, column: 26, scope: !1003)
!1003 = distinct !DILexicalBlock(scope: !1000, file: !68, line: 451, column: 48)
!1004 = !DILocation(line: 452, column: 22, scope: !1003)
!1005 = !DILocation(line: 452, column: 52, scope: !1003)
!1006 = !DILocation(line: 452, column: 48, scope: !1003)
!1007 = !DILocation(line: 0, scope: !435, inlinedAt: !1008)
!1008 = distinct !DILocation(line: 452, column: 13, scope: !1003)
!1009 = !DILocation(line: 22, column: 10, scope: !444, inlinedAt: !1008)
!1010 = !DILocation(line: 22, scope: !444, inlinedAt: !1008)
!1011 = !DILocation(line: 22, column: 19, scope: !447, inlinedAt: !1008)
!1012 = !DILocation(line: 22, column: 5, scope: !444, inlinedAt: !1008)
!1013 = !DILocation(line: 23, column: 19, scope: !450, inlinedAt: !1008)
!1014 = !DILocation(line: 23, column: 24, scope: !450, inlinedAt: !1008)
!1015 = !DILocation(line: 23, column: 14, scope: !450, inlinedAt: !1008)
!1016 = !DILocation(line: 23, column: 17, scope: !450, inlinedAt: !1008)
!1017 = !DILocation(line: 24, column: 24, scope: !450, inlinedAt: !1008)
!1018 = !DILocation(line: 24, column: 17, scope: !450, inlinedAt: !1008)
!1019 = !DILocation(line: 24, column: 14, scope: !450, inlinedAt: !1008)
!1020 = !DILocation(line: 22, column: 34, scope: !447, inlinedAt: !1008)
!1021 = !DILocation(line: 22, column: 5, scope: !447, inlinedAt: !1008)
!1022 = distinct !{!1022, !1012, !1023, !300}
!1023 = !DILocation(line: 25, column: 5, scope: !444, inlinedAt: !1008)
!1024 = !DILocation(line: 451, column: 43, scope: !1000)
!1025 = !DILocation(line: 451, column: 9, scope: !1000)
!1026 = distinct !{!1026, !1001, !1027, !300}
!1027 = !DILocation(line: 453, column: 9, scope: !995)
!1028 = !DILocation(line: 251, column: 5, scope: !1029, inlinedAt: !1032)
!1029 = distinct !DISubprogram(name: "compute_M_and_VPV", scope: !485, file: !485, line: 244, type: !1030, scopeLine: 244, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1030 = !DISubroutineType(types: !1031)
!1031 = !{null, !193, !90, !488, !488, !52, !52}
!1032 = distinct !DILocation(line: 456, column: 9, scope: !991)
!1033 = !DILocalVariable(name: "p", arg: 1, scope: !1029, file: !485, line: 244, type: !193)
!1034 = !DILocation(line: 0, scope: !1029, inlinedAt: !1032)
!1035 = !DILocalVariable(name: "Vdec", arg: 2, scope: !1029, file: !485, line: 244, type: !90)
!1036 = !DILocalVariable(name: "L", arg: 3, scope: !1029, file: !485, line: 244, type: !488)
!1037 = !DILocalVariable(name: "P1", arg: 4, scope: !1029, file: !485, line: 244, type: !488)
!1038 = !DILocalVariable(name: "VL", arg: 5, scope: !1029, file: !485, line: 244, type: !52)
!1039 = !DILocalVariable(name: "VP1V", arg: 6, scope: !1029, file: !485, line: 244, type: !52)
!1040 = !DILocalVariable(name: "param_k", scope: !1029, file: !485, line: 246, type: !275)
!1041 = !DILocalVariable(name: "param_v", scope: !1029, file: !485, line: 247, type: !275)
!1042 = !DILocalVariable(name: "param_o", scope: !1029, file: !485, line: 248, type: !275)
!1043 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !1044, file: !485, line: 61, type: !275)
!1044 = distinct !DISubprogram(name: "mul_add_mat_x_m_mat", scope: !485, file: !485, line: 61, type: !536, scopeLine: 62, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1045 = !DILocation(line: 0, scope: !1044, inlinedAt: !1046)
!1046 = distinct !DILocation(line: 251, column: 5, scope: !1029, inlinedAt: !1032)
!1047 = !DILocalVariable(name: "mat", arg: 2, scope: !1044, file: !485, line: 61, type: !90)
!1048 = !DILocalVariable(name: "bs_mat", arg: 3, scope: !1044, file: !485, line: 61, type: !488)
!1049 = !DILocalVariable(name: "acc", arg: 4, scope: !1044, file: !485, line: 61, type: !52)
!1050 = !DILocalVariable(name: "mat_rows", arg: 5, scope: !1044, file: !485, line: 62, type: !275)
!1051 = !DILocalVariable(name: "mat_cols", arg: 6, scope: !1044, file: !485, line: 62, type: !275)
!1052 = !DILocalVariable(name: "bs_mat_cols", arg: 7, scope: !1044, file: !485, line: 62, type: !275)
!1053 = !DILocalVariable(name: "r", scope: !1054, file: !485, line: 64, type: !86)
!1054 = distinct !DILexicalBlock(scope: !1044, file: !485, line: 64, column: 5)
!1055 = !DILocation(line: 0, scope: !1054, inlinedAt: !1046)
!1056 = !DILocation(line: 64, column: 10, scope: !1054, inlinedAt: !1046)
!1057 = !DILocation(line: 64, scope: !1054, inlinedAt: !1046)
!1058 = !DILocation(line: 64, column: 23, scope: !1059, inlinedAt: !1046)
!1059 = distinct !DILexicalBlock(scope: !1054, file: !485, line: 64, column: 5)
!1060 = !DILocation(line: 64, column: 5, scope: !1054, inlinedAt: !1046)
!1061 = !DILocation(line: 65, column: 9, scope: !1062, inlinedAt: !1046)
!1062 = distinct !DILexicalBlock(scope: !1063, file: !485, line: 65, column: 9)
!1063 = distinct !DILexicalBlock(scope: !1059, file: !485, line: 64, column: 40)
!1064 = !DILocation(line: 65, scope: !1062, inlinedAt: !1046)
!1065 = !DILocalVariable(name: "c", scope: !1062, file: !485, line: 65, type: !86)
!1066 = !DILocation(line: 0, scope: !1062, inlinedAt: !1046)
!1067 = !DILocation(line: 65, column: 27, scope: !1068, inlinedAt: !1046)
!1068 = distinct !DILexicalBlock(scope: !1062, file: !485, line: 65, column: 9)
!1069 = !DILocation(line: 66, column: 13, scope: !1070, inlinedAt: !1046)
!1070 = distinct !DILexicalBlock(scope: !1071, file: !485, line: 66, column: 13)
!1071 = distinct !DILexicalBlock(scope: !1068, file: !485, line: 65, column: 44)
!1072 = !DILocation(line: 66, scope: !1070, inlinedAt: !1046)
!1073 = !DILocalVariable(name: "k", scope: !1070, file: !485, line: 66, type: !86)
!1074 = !DILocation(line: 0, scope: !1070, inlinedAt: !1046)
!1075 = !DILocation(line: 66, column: 31, scope: !1076, inlinedAt: !1046)
!1076 = distinct !DILexicalBlock(scope: !1070, file: !485, line: 66, column: 13)
!1077 = !DILocation(line: 67, column: 70, scope: !1078, inlinedAt: !1046)
!1078 = distinct !DILexicalBlock(scope: !1076, file: !485, line: 66, column: 54)
!1079 = !DILocation(line: 67, column: 84, scope: !1078, inlinedAt: !1046)
!1080 = !DILocation(line: 67, column: 51, scope: !1078, inlinedAt: !1046)
!1081 = !DILocation(line: 67, column: 96, scope: !1078, inlinedAt: !1046)
!1082 = !DILocation(line: 67, column: 90, scope: !1078, inlinedAt: !1046)
!1083 = !DILocation(line: 67, column: 136, scope: !1078, inlinedAt: !1046)
!1084 = !DILocation(line: 67, column: 150, scope: !1078, inlinedAt: !1046)
!1085 = !DILocation(line: 67, column: 117, scope: !1078, inlinedAt: !1046)
!1086 = !DILocation(line: 67, column: 17, scope: !1078, inlinedAt: !1046)
!1087 = !DILocation(line: 66, column: 48, scope: !1076, inlinedAt: !1046)
!1088 = !DILocation(line: 66, column: 13, scope: !1076, inlinedAt: !1046)
!1089 = distinct !{!1089, !1069, !1090, !300}
!1090 = !DILocation(line: 68, column: 13, scope: !1070, inlinedAt: !1046)
!1091 = !DILocation(line: 65, column: 40, scope: !1068, inlinedAt: !1046)
!1092 = !DILocation(line: 65, column: 9, scope: !1068, inlinedAt: !1046)
!1093 = distinct !{!1093, !1061, !1094, !300}
!1094 = !DILocation(line: 69, column: 9, scope: !1062, inlinedAt: !1046)
!1095 = !DILocation(line: 64, column: 36, scope: !1059, inlinedAt: !1046)
!1096 = !DILocation(line: 64, column: 5, scope: !1059, inlinedAt: !1046)
!1097 = distinct !{!1097, !1060, !1098, !300}
!1098 = !DILocation(line: 70, column: 5, scope: !1054, inlinedAt: !1046)
!1099 = !DILocalVariable(name: "Pv", scope: !1029, file: !485, line: 254, type: !1100)
!1100 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 249600, elements: !1101)
!1101 = !{!1102}
!1102 = !DISubrange(count: 3900)
!1103 = !DILocation(line: 254, column: 14, scope: !1029, inlinedAt: !1032)
!1104 = !DILocalVariable(name: "p", arg: 1, scope: !1105, file: !485, line: 82, type: !193)
!1105 = distinct !DISubprogram(name: "P1_times_Vt", scope: !485, file: !485, line: 82, type: !500, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1106 = !DILocation(line: 0, scope: !1105, inlinedAt: !1107)
!1107 = distinct !DILocation(line: 255, column: 5, scope: !1029, inlinedAt: !1032)
!1108 = !DILocalVariable(name: "P1", arg: 2, scope: !1105, file: !485, line: 82, type: !488)
!1109 = !DILocalVariable(name: "V", arg: 3, scope: !1105, file: !485, line: 82, type: !90)
!1110 = !DILocalVariable(name: "acc", arg: 4, scope: !1105, file: !485, line: 82, type: !52)
!1111 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !1112, file: !485, line: 32, type: !275)
!1112 = distinct !DISubprogram(name: "mul_add_m_upper_triangular_mat_x_mat_trans", scope: !485, file: !485, line: 32, type: !509, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1113 = !DILocation(line: 0, scope: !1112, inlinedAt: !1114)
!1114 = distinct !DILocation(line: 86, column: 5, scope: !1105, inlinedAt: !1107)
!1115 = !DILocalVariable(name: "bs_mat", arg: 2, scope: !1112, file: !485, line: 32, type: !488)
!1116 = !DILocalVariable(name: "mat", arg: 3, scope: !1112, file: !485, line: 32, type: !90)
!1117 = !DILocalVariable(name: "acc", arg: 4, scope: !1112, file: !485, line: 32, type: !52)
!1118 = !DILocalVariable(name: "bs_mat_rows", arg: 5, scope: !1112, file: !485, line: 33, type: !275)
!1119 = !DILocalVariable(name: "bs_mat_cols", arg: 6, scope: !1112, file: !485, line: 33, type: !275)
!1120 = !DILocalVariable(name: "mat_rows", arg: 7, scope: !1112, file: !485, line: 33, type: !275)
!1121 = !DILocalVariable(name: "triangular", arg: 8, scope: !1112, file: !485, line: 33, type: !275)
!1122 = !DILocalVariable(name: "bs_mat_entries_used", scope: !1112, file: !485, line: 34, type: !86)
!1123 = !DILocalVariable(name: "r", scope: !1124, file: !485, line: 35, type: !86)
!1124 = distinct !DILexicalBlock(scope: !1112, file: !485, line: 35, column: 5)
!1125 = !DILocation(line: 0, scope: !1124, inlinedAt: !1114)
!1126 = !DILocation(line: 35, column: 10, scope: !1124, inlinedAt: !1114)
!1127 = !DILocation(line: 34, column: 9, scope: !1112, inlinedAt: !1114)
!1128 = !DILocation(line: 35, scope: !1124, inlinedAt: !1114)
!1129 = !DILocation(line: 35, column: 23, scope: !1130, inlinedAt: !1114)
!1130 = distinct !DILexicalBlock(scope: !1124, file: !485, line: 35, column: 5)
!1131 = !DILocation(line: 35, column: 5, scope: !1124, inlinedAt: !1114)
!1132 = !DILocation(line: 64, column: 5, scope: !1054, inlinedAt: !1133)
!1133 = distinct !DILocation(line: 256, column: 5, scope: !1029, inlinedAt: !1032)
!1134 = !DILocation(line: 36, column: 9, scope: !1135, inlinedAt: !1114)
!1135 = distinct !DILexicalBlock(scope: !1136, file: !485, line: 36, column: 9)
!1136 = distinct !DILexicalBlock(scope: !1130, file: !485, line: 35, column: 43)
!1137 = !DILocation(line: 36, scope: !1135, inlinedAt: !1114)
!1138 = !DILocalVariable(name: "c", scope: !1135, file: !485, line: 36, type: !86)
!1139 = !DILocation(line: 0, scope: !1135, inlinedAt: !1114)
!1140 = !DILocation(line: 36, column: 40, scope: !1141, inlinedAt: !1114)
!1141 = distinct !DILexicalBlock(scope: !1135, file: !485, line: 36, column: 9)
!1142 = !DILocation(line: 37, column: 13, scope: !1143, inlinedAt: !1114)
!1143 = distinct !DILexicalBlock(scope: !1144, file: !485, line: 37, column: 13)
!1144 = distinct !DILexicalBlock(scope: !1141, file: !485, line: 36, column: 60)
!1145 = !DILocation(line: 37, scope: !1143, inlinedAt: !1114)
!1146 = !DILocalVariable(name: "k", scope: !1143, file: !485, line: 37, type: !86)
!1147 = !DILocation(line: 0, scope: !1143, inlinedAt: !1114)
!1148 = !DILocation(line: 37, column: 31, scope: !1149, inlinedAt: !1114)
!1149 = distinct !DILexicalBlock(scope: !1143, file: !485, line: 37, column: 13)
!1150 = !DILocation(line: 38, column: 51, scope: !1151, inlinedAt: !1114)
!1151 = distinct !DILexicalBlock(scope: !1149, file: !485, line: 37, column: 51)
!1152 = !DILocation(line: 38, column: 94, scope: !1151, inlinedAt: !1114)
!1153 = !DILocation(line: 38, column: 88, scope: !1151, inlinedAt: !1114)
!1154 = !DILocation(line: 38, column: 137, scope: !1151, inlinedAt: !1114)
!1155 = !DILocation(line: 38, column: 148, scope: !1151, inlinedAt: !1114)
!1156 = !DILocation(line: 38, column: 118, scope: !1151, inlinedAt: !1114)
!1157 = !DILocation(line: 38, column: 17, scope: !1151, inlinedAt: !1114)
!1158 = !DILocation(line: 37, column: 45, scope: !1149, inlinedAt: !1114)
!1159 = !DILocation(line: 37, column: 13, scope: !1149, inlinedAt: !1114)
!1160 = distinct !{!1160, !1142, !1161, !300}
!1161 = !DILocation(line: 39, column: 13, scope: !1143, inlinedAt: !1114)
!1162 = !DILocation(line: 40, column: 33, scope: !1144, inlinedAt: !1114)
!1163 = !DILocation(line: 36, column: 56, scope: !1141, inlinedAt: !1114)
!1164 = !DILocation(line: 36, column: 9, scope: !1141, inlinedAt: !1114)
!1165 = distinct !{!1165, !1134, !1166, !300}
!1166 = !DILocation(line: 41, column: 9, scope: !1135, inlinedAt: !1114)
!1167 = !DILocation(line: 35, column: 39, scope: !1130, inlinedAt: !1114)
!1168 = !DILocation(line: 35, column: 5, scope: !1130, inlinedAt: !1114)
!1169 = distinct !{!1169, !1131, !1170, !300}
!1170 = !DILocation(line: 42, column: 5, scope: !1124, inlinedAt: !1114)
!1171 = !DILocation(line: 64, scope: !1054, inlinedAt: !1133)
!1172 = !DILocation(line: 0, scope: !1054, inlinedAt: !1133)
!1173 = !DILocation(line: 64, column: 23, scope: !1059, inlinedAt: !1133)
!1174 = !DILocation(line: 65, column: 9, scope: !1062, inlinedAt: !1133)
!1175 = !DILocation(line: 65, scope: !1062, inlinedAt: !1133)
!1176 = !DILocation(line: 0, scope: !1062, inlinedAt: !1133)
!1177 = !DILocation(line: 65, column: 27, scope: !1068, inlinedAt: !1133)
!1178 = !DILocation(line: 66, column: 13, scope: !1070, inlinedAt: !1133)
!1179 = !DILocation(line: 66, scope: !1070, inlinedAt: !1133)
!1180 = !DILocation(line: 0, scope: !1070, inlinedAt: !1133)
!1181 = !DILocation(line: 66, column: 31, scope: !1076, inlinedAt: !1133)
!1182 = !DILocation(line: 67, column: 70, scope: !1078, inlinedAt: !1133)
!1183 = !DILocation(line: 67, column: 84, scope: !1078, inlinedAt: !1133)
!1184 = !DILocation(line: 67, column: 51, scope: !1078, inlinedAt: !1133)
!1185 = !DILocation(line: 67, column: 96, scope: !1078, inlinedAt: !1133)
!1186 = !DILocation(line: 67, column: 90, scope: !1078, inlinedAt: !1133)
!1187 = !DILocation(line: 67, column: 136, scope: !1078, inlinedAt: !1133)
!1188 = !DILocation(line: 67, column: 150, scope: !1078, inlinedAt: !1133)
!1189 = !DILocation(line: 67, column: 117, scope: !1078, inlinedAt: !1133)
!1190 = !DILocation(line: 67, column: 17, scope: !1078, inlinedAt: !1133)
!1191 = !DILocation(line: 66, column: 48, scope: !1076, inlinedAt: !1133)
!1192 = !DILocation(line: 66, column: 13, scope: !1076, inlinedAt: !1133)
!1193 = distinct !{!1193, !1178, !1194, !300}
!1194 = !DILocation(line: 68, column: 13, scope: !1070, inlinedAt: !1133)
!1195 = !DILocation(line: 65, column: 40, scope: !1068, inlinedAt: !1133)
!1196 = !DILocation(line: 65, column: 9, scope: !1068, inlinedAt: !1133)
!1197 = distinct !{!1197, !1174, !1198, !300}
!1198 = !DILocation(line: 69, column: 9, scope: !1062, inlinedAt: !1133)
!1199 = !DILocation(line: 64, column: 36, scope: !1059, inlinedAt: !1133)
!1200 = !DILocation(line: 64, column: 5, scope: !1059, inlinedAt: !1133)
!1201 = distinct !{!1201, !1132, !1202, !300}
!1202 = !DILocation(line: 70, column: 5, scope: !1054, inlinedAt: !1133)
!1203 = !DILocation(line: 257, column: 1, scope: !1029, inlinedAt: !1032)
!1204 = !DILocation(line: 458, column: 9, scope: !991)
!1205 = !DILocation(line: 162, column: 14, scope: !1206, inlinedAt: !1209)
!1206 = distinct !DISubprogram(name: "compute_A", scope: !68, file: !68, line: 154, type: !1207, scopeLine: 154, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1207 = !DISubroutineType(types: !1208)
!1208 = !{null, !193, !52, !61}
!1209 = distinct !DILocation(line: 459, column: 9, scope: !991)
!1210 = !DILocalVariable(name: "p", arg: 1, scope: !1206, file: !68, line: 154, type: !193)
!1211 = !DILocation(line: 0, scope: !1206, inlinedAt: !1209)
!1212 = !DILocalVariable(name: "VtL", arg: 2, scope: !1206, file: !68, line: 154, type: !52)
!1213 = !DILocalVariable(name: "A_out", arg: 3, scope: !1206, file: !68, line: 154, type: !61)
!1214 = !DILocalVariable(name: "bits_to_shift", scope: !1206, file: !68, line: 159, type: !86)
!1215 = !DILocalVariable(name: "words_to_shift", scope: !1206, file: !68, line: 160, type: !86)
!1216 = !DILocalVariable(name: "m_vec_limbs", scope: !1206, file: !68, line: 161, type: !275)
!1217 = !DILocalVariable(name: "A", scope: !1206, file: !68, line: 162, type: !1218)
!1218 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 51200, elements: !1219)
!1219 = !{!1220}
!1220 = !DISubrange(count: 800)
!1221 = !DILocalVariable(name: "A_width", scope: !1206, file: !68, line: 163, type: !58)
!1222 = !DILocalVariable(name: "mask", scope: !1223, file: !68, line: 168, type: !53)
!1223 = distinct !DILexicalBlock(scope: !1224, file: !68, line: 167, column: 29)
!1224 = distinct !DILexicalBlock(scope: !1206, file: !68, line: 167, column: 8)
!1225 = !DILocation(line: 0, scope: !1223, inlinedAt: !1209)
!1226 = !DILocalVariable(name: "i", scope: !1227, file: !68, line: 171, type: !86)
!1227 = distinct !DILexicalBlock(scope: !1223, file: !68, line: 171, column: 9)
!1228 = !DILocation(line: 0, scope: !1227, inlinedAt: !1209)
!1229 = !DILocation(line: 171, column: 14, scope: !1227, inlinedAt: !1209)
!1230 = !DILocation(line: 171, scope: !1227, inlinedAt: !1209)
!1231 = !DILocation(line: 171, column: 27, scope: !1232, inlinedAt: !1209)
!1232 = distinct !DILexicalBlock(scope: !1227, file: !68, line: 171, column: 9)
!1233 = !DILocation(line: 171, column: 9, scope: !1227, inlinedAt: !1209)
!1234 = !DILocation(line: 177, column: 5, scope: !1235, inlinedAt: !1209)
!1235 = distinct !DILexicalBlock(scope: !1206, file: !68, line: 177, column: 5)
!1236 = !DILocation(line: 173, column: 13, scope: !1237, inlinedAt: !1209)
!1237 = distinct !DILexicalBlock(scope: !1232, file: !68, line: 172, column: 9)
!1238 = !DILocation(line: 173, column: 50, scope: !1237, inlinedAt: !1209)
!1239 = !DILocation(line: 171, column: 53, scope: !1232, inlinedAt: !1209)
!1240 = !DILocation(line: 171, column: 9, scope: !1232, inlinedAt: !1209)
!1241 = distinct !{!1241, !1233, !1242, !300}
!1242 = !DILocation(line: 174, column: 9, scope: !1227, inlinedAt: !1209)
!1243 = !DILocation(line: 177, scope: !1235, inlinedAt: !1209)
!1244 = !DILocation(line: 160, column: 9, scope: !1206, inlinedAt: !1209)
!1245 = !DILocation(line: 159, column: 9, scope: !1206, inlinedAt: !1209)
!1246 = !DILocalVariable(name: "i", scope: !1235, file: !68, line: 177, type: !86)
!1247 = !DILocation(line: 0, scope: !1235, inlinedAt: !1209)
!1248 = !DILocation(line: 177, column: 23, scope: !1249, inlinedAt: !1209)
!1249 = distinct !DILexicalBlock(scope: !1235, file: !68, line: 177, column: 5)
!1250 = !DILocation(line: 212, column: 5, scope: !1251, inlinedAt: !1209)
!1251 = distinct !DILexicalBlock(scope: !1206, file: !68, line: 212, column: 5)
!1252 = !DILocation(line: 178, column: 9, scope: !1253, inlinedAt: !1209)
!1253 = distinct !DILexicalBlock(scope: !1254, file: !68, line: 178, column: 9)
!1254 = distinct !DILexicalBlock(scope: !1249, file: !68, line: 177, column: 47)
!1255 = !DILocation(line: 178, scope: !1253, inlinedAt: !1209)
!1256 = !DILocalVariable(name: "j", scope: !1253, file: !68, line: 178, type: !86)
!1257 = !DILocation(line: 0, scope: !1253, inlinedAt: !1209)
!1258 = !DILocation(line: 178, column: 40, scope: !1259, inlinedAt: !1209)
!1259 = distinct !DILexicalBlock(scope: !1253, file: !68, line: 178, column: 9)
!1260 = !DILocation(line: 180, column: 22, scope: !1261, inlinedAt: !1209)
!1261 = distinct !DILexicalBlock(scope: !1259, file: !68, line: 178, column: 51)
!1262 = !DILocalVariable(name: "Mj", scope: !1206, file: !68, line: 164, type: !488)
!1263 = !DILocalVariable(name: "c", scope: !1264, file: !68, line: 181, type: !86)
!1264 = distinct !DILexicalBlock(scope: !1261, file: !68, line: 181, column: 13)
!1265 = !DILocation(line: 0, scope: !1264, inlinedAt: !1209)
!1266 = !DILocation(line: 181, column: 18, scope: !1264, inlinedAt: !1209)
!1267 = !DILocation(line: 181, scope: !1264, inlinedAt: !1209)
!1268 = !DILocation(line: 181, column: 31, scope: !1269, inlinedAt: !1209)
!1269 = distinct !DILexicalBlock(scope: !1264, file: !68, line: 181, column: 13)
!1270 = !DILocation(line: 181, column: 13, scope: !1264, inlinedAt: !1209)
!1271 = !DILocation(line: 182, column: 17, scope: !1272, inlinedAt: !1209)
!1272 = distinct !DILexicalBlock(scope: !1273, file: !68, line: 182, column: 17)
!1273 = distinct !DILexicalBlock(scope: !1269, file: !68, line: 181, column: 50)
!1274 = !DILocation(line: 182, scope: !1272, inlinedAt: !1209)
!1275 = !DILocalVariable(name: "k", scope: !1272, file: !68, line: 182, type: !86)
!1276 = !DILocation(line: 0, scope: !1272, inlinedAt: !1209)
!1277 = !DILocation(line: 182, column: 35, scope: !1278, inlinedAt: !1209)
!1278 = distinct !DILexicalBlock(scope: !1272, file: !68, line: 182, column: 17)
!1279 = !DILocation(line: 184, column: 78, scope: !1280, inlinedAt: !1209)
!1280 = distinct !DILexicalBlock(scope: !1278, file: !68, line: 183, column: 17)
!1281 = !DILocation(line: 184, column: 100, scope: !1280, inlinedAt: !1209)
!1282 = !DILocation(line: 184, column: 35, scope: !1280, inlinedAt: !1209)
!1283 = !DILocation(line: 184, column: 39, scope: !1280, inlinedAt: !1209)
!1284 = !DILocation(line: 184, column: 48, scope: !1280, inlinedAt: !1209)
!1285 = !DILocation(line: 184, column: 65, scope: !1280, inlinedAt: !1209)
!1286 = !DILocation(line: 184, column: 43, scope: !1280, inlinedAt: !1209)
!1287 = !DILocation(line: 184, column: 21, scope: !1280, inlinedAt: !1209)
!1288 = !DILocation(line: 184, column: 75, scope: !1280, inlinedAt: !1209)
!1289 = !DILocation(line: 185, column: 38, scope: !1290, inlinedAt: !1209)
!1290 = distinct !DILexicalBlock(scope: !1280, file: !68, line: 185, column: 24)
!1291 = !DILocation(line: 186, column: 86, scope: !1292, inlinedAt: !1209)
!1292 = distinct !DILexicalBlock(scope: !1290, file: !68, line: 185, column: 42)
!1293 = !DILocation(line: 186, column: 114, scope: !1292, inlinedAt: !1209)
!1294 = !DILocation(line: 186, column: 108, scope: !1292, inlinedAt: !1209)
!1295 = !DILocation(line: 186, column: 39, scope: !1292, inlinedAt: !1209)
!1296 = !DILocation(line: 186, column: 43, scope: !1292, inlinedAt: !1209)
!1297 = !DILocation(line: 186, column: 52, scope: !1292, inlinedAt: !1209)
!1298 = !DILocation(line: 186, column: 73, scope: !1292, inlinedAt: !1209)
!1299 = !DILocation(line: 186, column: 47, scope: !1292, inlinedAt: !1209)
!1300 = !DILocation(line: 186, column: 25, scope: !1292, inlinedAt: !1209)
!1301 = !DILocation(line: 186, column: 83, scope: !1292, inlinedAt: !1209)
!1302 = !DILocation(line: 187, column: 21, scope: !1292, inlinedAt: !1209)
!1303 = !DILocation(line: 182, column: 51, scope: !1278, inlinedAt: !1209)
!1304 = !DILocation(line: 182, column: 17, scope: !1278, inlinedAt: !1209)
!1305 = distinct !{!1305, !1271, !1306, !300}
!1306 = !DILocation(line: 188, column: 17, scope: !1272, inlinedAt: !1209)
!1307 = !DILocation(line: 181, column: 46, scope: !1269, inlinedAt: !1209)
!1308 = !DILocation(line: 181, column: 13, scope: !1269, inlinedAt: !1209)
!1309 = distinct !{!1309, !1270, !1310, !300}
!1310 = !DILocation(line: 189, column: 13, scope: !1264, inlinedAt: !1209)
!1311 = !DILocation(line: 191, column: 19, scope: !1312, inlinedAt: !1209)
!1312 = distinct !DILexicalBlock(scope: !1261, file: !68, line: 191, column: 17)
!1313 = !DILocation(line: 192, column: 26, scope: !1314, inlinedAt: !1209)
!1314 = distinct !DILexicalBlock(scope: !1312, file: !68, line: 191, column: 25)
!1315 = !DILocalVariable(name: "Mi", scope: !1206, file: !68, line: 164, type: !488)
!1316 = !DILocalVariable(name: "c", scope: !1317, file: !68, line: 193, type: !86)
!1317 = distinct !DILexicalBlock(scope: !1314, file: !68, line: 193, column: 17)
!1318 = !DILocation(line: 0, scope: !1317, inlinedAt: !1209)
!1319 = !DILocation(line: 193, column: 22, scope: !1317, inlinedAt: !1209)
!1320 = !DILocation(line: 193, scope: !1317, inlinedAt: !1209)
!1321 = !DILocation(line: 193, column: 35, scope: !1322, inlinedAt: !1209)
!1322 = distinct !DILexicalBlock(scope: !1317, file: !68, line: 193, column: 17)
!1323 = !DILocation(line: 193, column: 17, scope: !1317, inlinedAt: !1209)
!1324 = !DILocation(line: 194, column: 21, scope: !1325, inlinedAt: !1209)
!1325 = distinct !DILexicalBlock(scope: !1326, file: !68, line: 194, column: 21)
!1326 = distinct !DILexicalBlock(scope: !1322, file: !68, line: 193, column: 54)
!1327 = !DILocation(line: 194, scope: !1325, inlinedAt: !1209)
!1328 = !DILocalVariable(name: "k", scope: !1325, file: !68, line: 194, type: !86)
!1329 = !DILocation(line: 0, scope: !1325, inlinedAt: !1209)
!1330 = !DILocation(line: 194, column: 39, scope: !1331, inlinedAt: !1209)
!1331 = distinct !DILexicalBlock(scope: !1325, file: !68, line: 194, column: 21)
!1332 = !DILocation(line: 196, column: 81, scope: !1333, inlinedAt: !1209)
!1333 = distinct !DILexicalBlock(scope: !1331, file: !68, line: 195, column: 21)
!1334 = !DILocation(line: 196, column: 103, scope: !1333, inlinedAt: !1209)
!1335 = !DILocation(line: 196, column: 38, scope: !1333, inlinedAt: !1209)
!1336 = !DILocation(line: 196, column: 42, scope: !1333, inlinedAt: !1209)
!1337 = !DILocation(line: 196, column: 51, scope: !1333, inlinedAt: !1209)
!1338 = !DILocation(line: 196, column: 68, scope: !1333, inlinedAt: !1209)
!1339 = !DILocation(line: 196, column: 46, scope: !1333, inlinedAt: !1209)
!1340 = !DILocation(line: 196, column: 25, scope: !1333, inlinedAt: !1209)
!1341 = !DILocation(line: 196, column: 78, scope: !1333, inlinedAt: !1209)
!1342 = !DILocation(line: 197, column: 42, scope: !1343, inlinedAt: !1209)
!1343 = distinct !DILexicalBlock(scope: !1333, file: !68, line: 197, column: 28)
!1344 = !DILocation(line: 198, column: 89, scope: !1345, inlinedAt: !1209)
!1345 = distinct !DILexicalBlock(scope: !1343, file: !68, line: 197, column: 46)
!1346 = !DILocation(line: 198, column: 117, scope: !1345, inlinedAt: !1209)
!1347 = !DILocation(line: 198, column: 111, scope: !1345, inlinedAt: !1209)
!1348 = !DILocation(line: 198, column: 42, scope: !1345, inlinedAt: !1209)
!1349 = !DILocation(line: 198, column: 46, scope: !1345, inlinedAt: !1209)
!1350 = !DILocation(line: 198, column: 55, scope: !1345, inlinedAt: !1209)
!1351 = !DILocation(line: 198, column: 76, scope: !1345, inlinedAt: !1209)
!1352 = !DILocation(line: 198, column: 50, scope: !1345, inlinedAt: !1209)
!1353 = !DILocation(line: 198, column: 29, scope: !1345, inlinedAt: !1209)
!1354 = !DILocation(line: 198, column: 86, scope: !1345, inlinedAt: !1209)
!1355 = !DILocation(line: 199, column: 25, scope: !1345, inlinedAt: !1209)
!1356 = !DILocation(line: 194, column: 55, scope: !1331, inlinedAt: !1209)
!1357 = !DILocation(line: 194, column: 21, scope: !1331, inlinedAt: !1209)
!1358 = distinct !{!1358, !1324, !1359, !300}
!1359 = !DILocation(line: 200, column: 21, scope: !1325, inlinedAt: !1209)
!1360 = !DILocation(line: 193, column: 50, scope: !1322, inlinedAt: !1209)
!1361 = !DILocation(line: 193, column: 17, scope: !1322, inlinedAt: !1209)
!1362 = distinct !{!1362, !1323, !1363, !300}
!1363 = !DILocation(line: 201, column: 17, scope: !1317, inlinedAt: !1209)
!1364 = !DILocation(line: 204, column: 27, scope: !1261, inlinedAt: !1209)
!1365 = !DILocation(line: 205, column: 30, scope: !1366, inlinedAt: !1209)
!1366 = distinct !DILexicalBlock(scope: !1261, file: !68, line: 205, column: 16)
!1367 = !DILocation(line: 178, column: 46, scope: !1259, inlinedAt: !1209)
!1368 = !DILocation(line: 178, column: 9, scope: !1259, inlinedAt: !1209)
!1369 = distinct !{!1369, !1252, !1370, !300}
!1370 = !DILocation(line: 209, column: 9, scope: !1253, inlinedAt: !1209)
!1371 = !DILocation(line: 177, column: 42, scope: !1249, inlinedAt: !1209)
!1372 = !DILocation(line: 177, column: 5, scope: !1249, inlinedAt: !1209)
!1373 = distinct !{!1373, !1234, !1374, !300}
!1374 = !DILocation(line: 210, column: 5, scope: !1235, inlinedAt: !1209)
!1375 = !DILocation(line: 212, scope: !1251, inlinedAt: !1209)
!1376 = !DILocalVariable(name: "c", scope: !1251, file: !68, line: 212, type: !58)
!1377 = !DILocation(line: 0, scope: !1251, inlinedAt: !1209)
!1378 = !DILocation(line: 212, column: 26, scope: !1379, inlinedAt: !1209)
!1379 = distinct !DILexicalBlock(scope: !1251, file: !68, line: 212, column: 5)
!1380 = !DILocation(line: 214, column: 35, scope: !1381, inlinedAt: !1209)
!1381 = distinct !DILexicalBlock(scope: !1379, file: !68, line: 213, column: 5)
!1382 = !DILocalVariable(name: "M", arg: 1, scope: !67, file: !68, line: 111, type: !52)
!1383 = !DILocation(line: 0, scope: !67, inlinedAt: !1384)
!1384 = distinct !DILocation(line: 214, column: 9, scope: !1381, inlinedAt: !1209)
!1385 = !DILocalVariable(name: "i", scope: !1386, file: !68, line: 117, type: !58)
!1386 = distinct !DILexicalBlock(scope: !67, file: !68, line: 117, column: 5)
!1387 = !DILocation(line: 0, scope: !1386, inlinedAt: !1384)
!1388 = !DILocation(line: 117, column: 10, scope: !1386, inlinedAt: !1384)
!1389 = !DILocation(line: 117, scope: !1386, inlinedAt: !1384)
!1390 = !DILocation(line: 117, column: 26, scope: !1391, inlinedAt: !1384)
!1391 = distinct !DILexicalBlock(scope: !1386, file: !68, line: 117, column: 5)
!1392 = !DILocation(line: 117, column: 5, scope: !1386, inlinedAt: !1384)
!1393 = !DILocation(line: 124, column: 5, scope: !1394, inlinedAt: !1384)
!1394 = distinct !DILexicalBlock(scope: !67, file: !68, line: 124, column: 5)
!1395 = !DILocation(line: 119, column: 24, scope: !1396, inlinedAt: !1384)
!1396 = distinct !DILexicalBlock(scope: !1391, file: !68, line: 118, column: 5)
!1397 = !DILocation(line: 119, column: 29, scope: !1396, inlinedAt: !1384)
!1398 = !DILocation(line: 119, column: 41, scope: !1396, inlinedAt: !1384)
!1399 = !DILocation(line: 119, column: 38, scope: !1396, inlinedAt: !1384)
!1400 = !DILocation(line: 119, column: 36, scope: !1396, inlinedAt: !1384)
!1401 = !DILocation(line: 119, column: 46, scope: !1396, inlinedAt: !1384)
!1402 = !DILocalVariable(name: "t", scope: !1396, file: !68, line: 119, type: !53)
!1403 = !DILocation(line: 0, scope: !1396, inlinedAt: !1384)
!1404 = !DILocation(line: 120, column: 21, scope: !1396, inlinedAt: !1384)
!1405 = !DILocation(line: 120, column: 9, scope: !1396, inlinedAt: !1384)
!1406 = !DILocation(line: 120, column: 16, scope: !1396, inlinedAt: !1384)
!1407 = !DILocation(line: 121, column: 12, scope: !1396, inlinedAt: !1384)
!1408 = !DILocation(line: 121, column: 9, scope: !1396, inlinedAt: !1384)
!1409 = !DILocation(line: 121, column: 16, scope: !1396, inlinedAt: !1384)
!1410 = !DILocation(line: 117, column: 33, scope: !1391, inlinedAt: !1384)
!1411 = !DILocation(line: 117, column: 5, scope: !1391, inlinedAt: !1384)
!1412 = distinct !{!1412, !1392, !1413, !300}
!1413 = !DILocation(line: 122, column: 5, scope: !1386, inlinedAt: !1384)
!1414 = !DILocation(line: 124, scope: !1394, inlinedAt: !1384)
!1415 = !DILocalVariable(name: "i", scope: !1394, file: !68, line: 124, type: !58)
!1416 = !DILocation(line: 0, scope: !1394, inlinedAt: !1384)
!1417 = !DILocation(line: 124, column: 26, scope: !1418, inlinedAt: !1384)
!1418 = distinct !DILexicalBlock(scope: !1394, file: !68, line: 124, column: 5)
!1419 = !DILocation(line: 134, column: 5, scope: !1420, inlinedAt: !1384)
!1420 = distinct !DILexicalBlock(scope: !67, file: !68, line: 134, column: 5)
!1421 = !DILocation(line: 126, column: 25, scope: !1422, inlinedAt: !1384)
!1422 = distinct !DILexicalBlock(scope: !1418, file: !68, line: 125, column: 5)
!1423 = !DILocation(line: 126, column: 32, scope: !1422, inlinedAt: !1384)
!1424 = !DILocation(line: 126, column: 43, scope: !1422, inlinedAt: !1384)
!1425 = !DILocation(line: 126, column: 40, scope: !1422, inlinedAt: !1384)
!1426 = !DILocation(line: 126, column: 38, scope: !1422, inlinedAt: !1384)
!1427 = !DILocation(line: 126, column: 48, scope: !1422, inlinedAt: !1384)
!1428 = !DILocalVariable(name: "t0", scope: !1422, file: !68, line: 126, type: !53)
!1429 = !DILocation(line: 0, scope: !1422, inlinedAt: !1384)
!1430 = !DILocation(line: 127, column: 28, scope: !1422, inlinedAt: !1384)
!1431 = !DILocation(line: 127, column: 25, scope: !1422, inlinedAt: !1384)
!1432 = !DILocation(line: 127, column: 32, scope: !1422, inlinedAt: !1384)
!1433 = !DILocation(line: 127, column: 43, scope: !1422, inlinedAt: !1384)
!1434 = !DILocation(line: 127, column: 40, scope: !1422, inlinedAt: !1384)
!1435 = !DILocation(line: 127, column: 38, scope: !1422, inlinedAt: !1384)
!1436 = !DILocation(line: 127, column: 48, scope: !1422, inlinedAt: !1384)
!1437 = !DILocalVariable(name: "t1", scope: !1422, file: !68, line: 127, type: !53)
!1438 = !DILocation(line: 128, column: 23, scope: !1422, inlinedAt: !1384)
!1439 = !DILocation(line: 128, column: 9, scope: !1422, inlinedAt: !1384)
!1440 = !DILocation(line: 128, column: 16, scope: !1422, inlinedAt: !1384)
!1441 = !DILocation(line: 129, column: 23, scope: !1422, inlinedAt: !1384)
!1442 = !DILocation(line: 129, column: 12, scope: !1422, inlinedAt: !1384)
!1443 = !DILocation(line: 129, column: 9, scope: !1422, inlinedAt: !1384)
!1444 = !DILocation(line: 129, column: 16, scope: !1422, inlinedAt: !1384)
!1445 = !DILocation(line: 130, column: 12, scope: !1422, inlinedAt: !1384)
!1446 = !DILocation(line: 130, column: 9, scope: !1422, inlinedAt: !1384)
!1447 = !DILocation(line: 130, column: 16, scope: !1422, inlinedAt: !1384)
!1448 = !DILocation(line: 131, column: 12, scope: !1422, inlinedAt: !1384)
!1449 = !DILocation(line: 131, column: 9, scope: !1422, inlinedAt: !1384)
!1450 = !DILocation(line: 131, column: 16, scope: !1422, inlinedAt: !1384)
!1451 = !DILocation(line: 124, column: 33, scope: !1418, inlinedAt: !1384)
!1452 = !DILocation(line: 124, column: 5, scope: !1418, inlinedAt: !1384)
!1453 = distinct !{!1453, !1393, !1454, !300}
!1454 = !DILocation(line: 132, column: 5, scope: !1394, inlinedAt: !1384)
!1455 = !DILocation(line: 134, scope: !1420, inlinedAt: !1384)
!1456 = !DILocalVariable(name: "i", scope: !1420, file: !68, line: 134, type: !58)
!1457 = !DILocation(line: 0, scope: !1420, inlinedAt: !1384)
!1458 = !DILocation(line: 134, column: 26, scope: !1459, inlinedAt: !1384)
!1459 = distinct !DILexicalBlock(scope: !1420, file: !68, line: 134, column: 5)
!1460 = !DILocation(line: 145, column: 5, scope: !1461, inlinedAt: !1384)
!1461 = distinct !DILexicalBlock(scope: !67, file: !68, line: 145, column: 5)
!1462 = !DILocation(line: 136, column: 25, scope: !1463, inlinedAt: !1384)
!1463 = distinct !DILexicalBlock(scope: !1459, file: !68, line: 135, column: 5)
!1464 = !DILocation(line: 136, column: 32, scope: !1463, inlinedAt: !1384)
!1465 = !DILocation(line: 136, column: 44, scope: !1463, inlinedAt: !1384)
!1466 = !DILocation(line: 136, column: 41, scope: !1463, inlinedAt: !1384)
!1467 = !DILocation(line: 136, column: 39, scope: !1463, inlinedAt: !1384)
!1468 = !DILocation(line: 136, column: 50, scope: !1463, inlinedAt: !1384)
!1469 = !DILocalVariable(name: "t0", scope: !1463, file: !68, line: 136, type: !53)
!1470 = !DILocation(line: 0, scope: !1463, inlinedAt: !1384)
!1471 = !DILocation(line: 137, column: 28, scope: !1463, inlinedAt: !1384)
!1472 = !DILocation(line: 137, column: 25, scope: !1463, inlinedAt: !1384)
!1473 = !DILocation(line: 137, column: 32, scope: !1463, inlinedAt: !1384)
!1474 = !DILocation(line: 137, column: 44, scope: !1463, inlinedAt: !1384)
!1475 = !DILocation(line: 137, column: 41, scope: !1463, inlinedAt: !1384)
!1476 = !DILocation(line: 137, column: 39, scope: !1463, inlinedAt: !1384)
!1477 = !DILocation(line: 137, column: 50, scope: !1463, inlinedAt: !1384)
!1478 = !DILocalVariable(name: "t1", scope: !1463, file: !68, line: 137, type: !53)
!1479 = !DILocation(line: 139, column: 23, scope: !1463, inlinedAt: !1384)
!1480 = !DILocation(line: 139, column: 9, scope: !1463, inlinedAt: !1384)
!1481 = !DILocation(line: 139, column: 17, scope: !1463, inlinedAt: !1384)
!1482 = !DILocation(line: 140, column: 23, scope: !1463, inlinedAt: !1384)
!1483 = !DILocation(line: 140, column: 12, scope: !1463, inlinedAt: !1384)
!1484 = !DILocation(line: 140, column: 9, scope: !1463, inlinedAt: !1384)
!1485 = !DILocation(line: 140, column: 17, scope: !1463, inlinedAt: !1384)
!1486 = !DILocation(line: 141, column: 12, scope: !1463, inlinedAt: !1384)
!1487 = !DILocation(line: 141, column: 9, scope: !1463, inlinedAt: !1384)
!1488 = !DILocation(line: 141, column: 17, scope: !1463, inlinedAt: !1384)
!1489 = !DILocation(line: 142, column: 12, scope: !1463, inlinedAt: !1384)
!1490 = !DILocation(line: 142, column: 9, scope: !1463, inlinedAt: !1384)
!1491 = !DILocation(line: 142, column: 17, scope: !1463, inlinedAt: !1384)
!1492 = !DILocation(line: 134, column: 32, scope: !1459, inlinedAt: !1384)
!1493 = !DILocation(line: 134, column: 5, scope: !1459, inlinedAt: !1384)
!1494 = distinct !{!1494, !1419, !1495, !300}
!1495 = !DILocation(line: 143, column: 5, scope: !1420, inlinedAt: !1384)
!1496 = !DILocation(line: 145, scope: !1461, inlinedAt: !1384)
!1497 = !DILocalVariable(name: "i", scope: !1461, file: !68, line: 145, type: !58)
!1498 = !DILocation(line: 0, scope: !1461, inlinedAt: !1384)
!1499 = !DILocation(line: 145, column: 26, scope: !1500, inlinedAt: !1384)
!1500 = distinct !DILexicalBlock(scope: !1461, file: !68, line: 145, column: 5)
!1501 = !DILocation(line: 147, column: 24, scope: !1502, inlinedAt: !1384)
!1502 = distinct !DILexicalBlock(scope: !1500, file: !68, line: 146, column: 5)
!1503 = !DILocation(line: 147, column: 28, scope: !1502, inlinedAt: !1384)
!1504 = !DILocation(line: 147, column: 39, scope: !1502, inlinedAt: !1384)
!1505 = !DILocation(line: 147, column: 36, scope: !1502, inlinedAt: !1384)
!1506 = !DILocation(line: 147, column: 44, scope: !1502, inlinedAt: !1384)
!1507 = !DILocalVariable(name: "t", scope: !1502, file: !68, line: 147, type: !53)
!1508 = !DILocation(line: 0, scope: !1502, inlinedAt: !1384)
!1509 = !DILocation(line: 148, column: 21, scope: !1502, inlinedAt: !1384)
!1510 = !DILocation(line: 148, column: 9, scope: !1502, inlinedAt: !1384)
!1511 = !DILocation(line: 148, column: 16, scope: !1502, inlinedAt: !1384)
!1512 = !DILocation(line: 149, column: 12, scope: !1502, inlinedAt: !1384)
!1513 = !DILocation(line: 149, column: 9, scope: !1502, inlinedAt: !1384)
!1514 = !DILocation(line: 149, column: 16, scope: !1502, inlinedAt: !1384)
!1515 = !DILocation(line: 145, column: 32, scope: !1500, inlinedAt: !1384)
!1516 = !DILocation(line: 145, column: 5, scope: !1500, inlinedAt: !1384)
!1517 = distinct !{!1517, !1460, !1518, !300}
!1518 = !DILocation(line: 150, column: 5, scope: !1461, inlinedAt: !1384)
!1519 = !DILocation(line: 212, column: 91, scope: !1379, inlinedAt: !1209)
!1520 = !DILocation(line: 212, column: 5, scope: !1379, inlinedAt: !1209)
!1521 = distinct !{!1521, !1250, !1522, !300}
!1522 = !DILocation(line: 215, column: 5, scope: !1251, inlinedAt: !1209)
!1523 = !DILocalVariable(name: "tab", scope: !1206, file: !68, line: 217, type: !1524)
!1524 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 128, elements: !1525)
!1525 = !{!1526}
!1526 = !DISubrange(count: 16)
!1527 = !DILocation(line: 217, column: 19, scope: !1206, inlinedAt: !1209)
!1528 = !DILocalVariable(name: "i", scope: !1529, file: !68, line: 218, type: !58)
!1529 = distinct !DILexicalBlock(scope: !1206, file: !68, line: 218, column: 5)
!1530 = !DILocation(line: 0, scope: !1529, inlinedAt: !1209)
!1531 = !DILocation(line: 218, column: 10, scope: !1529, inlinedAt: !1209)
!1532 = !DILocation(line: 218, scope: !1529, inlinedAt: !1209)
!1533 = !DILocation(line: 218, column: 26, scope: !1534, inlinedAt: !1209)
!1534 = distinct !DILexicalBlock(scope: !1529, file: !68, line: 218, column: 5)
!1535 = !DILocation(line: 218, column: 5, scope: !1529, inlinedAt: !1209)
!1536 = !DILocation(line: 228, column: 5, scope: !1537, inlinedAt: !1209)
!1537 = distinct !DILexicalBlock(scope: !1206, file: !68, line: 228, column: 5)
!1538 = !DILocation(line: 220, column: 28, scope: !1539, inlinedAt: !1209)
!1539 = distinct !DILexicalBlock(scope: !1534, file: !68, line: 219, column: 5)
!1540 = !DILocalVariable(name: "a", arg: 1, scope: !1541, file: !670, line: 8, type: !51)
!1541 = distinct !DISubprogram(name: "mul_f", scope: !670, file: !670, line: 8, type: !1542, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1542 = !DISubroutineType(types: !1543)
!1543 = !{!51, !51, !51}
!1544 = !DILocation(line: 0, scope: !1541, inlinedAt: !1545)
!1545 = distinct !DILocation(line: 220, column: 22, scope: !1539, inlinedAt: !1209)
!1546 = !DILocalVariable(name: "b", arg: 2, scope: !1541, file: !670, line: 8, type: !51)
!1547 = !DILocation(line: 13, column: 10, scope: !1541, inlinedAt: !1545)
!1548 = !DILocation(line: 13, column: 7, scope: !1541, inlinedAt: !1545)
!1549 = !DILocalVariable(name: "p", scope: !1541, file: !670, line: 10, type: !51)
!1550 = !DILocation(line: 19, column: 7, scope: !1541, inlinedAt: !1545)
!1551 = !DILocalVariable(name: "top_p", scope: !1541, file: !670, line: 22, type: !51)
!1552 = !DILocalVariable(name: "out", scope: !1541, file: !670, line: 23, type: !51)
!1553 = !DILocation(line: 220, column: 14, scope: !1539, inlinedAt: !1209)
!1554 = !DILocation(line: 220, column: 9, scope: !1539, inlinedAt: !1209)
!1555 = !DILocation(line: 220, column: 20, scope: !1539, inlinedAt: !1209)
!1556 = !DILocation(line: 0, scope: !1541, inlinedAt: !1557)
!1557 = distinct !DILocation(line: 221, column: 22, scope: !1539, inlinedAt: !1209)
!1558 = !DILocation(line: 13, column: 10, scope: !1541, inlinedAt: !1557)
!1559 = !DILocation(line: 13, column: 7, scope: !1541, inlinedAt: !1557)
!1560 = !DILocation(line: 16, column: 17, scope: !1541, inlinedAt: !1557)
!1561 = !DILocation(line: 17, column: 17, scope: !1541, inlinedAt: !1557)
!1562 = !DILocation(line: 17, column: 7, scope: !1541, inlinedAt: !1557)
!1563 = !DILocation(line: 18, column: 17, scope: !1541, inlinedAt: !1557)
!1564 = !DILocation(line: 18, column: 7, scope: !1541, inlinedAt: !1557)
!1565 = !DILocation(line: 19, column: 17, scope: !1541, inlinedAt: !1557)
!1566 = !DILocation(line: 23, column: 37, scope: !1541, inlinedAt: !1557)
!1567 = !DILocation(line: 23, column: 52, scope: !1541, inlinedAt: !1557)
!1568 = !DILocation(line: 23, column: 43, scope: !1541, inlinedAt: !1557)
!1569 = !DILocation(line: 23, column: 59, scope: !1541, inlinedAt: !1557)
!1570 = !DILocation(line: 221, column: 14, scope: !1539, inlinedAt: !1209)
!1571 = !DILocation(line: 221, column: 16, scope: !1539, inlinedAt: !1209)
!1572 = !DILocation(line: 221, column: 9, scope: !1539, inlinedAt: !1209)
!1573 = !DILocation(line: 221, column: 20, scope: !1539, inlinedAt: !1209)
!1574 = !DILocation(line: 222, column: 28, scope: !1539, inlinedAt: !1209)
!1575 = !DILocation(line: 0, scope: !1541, inlinedAt: !1576)
!1576 = distinct !DILocation(line: 222, column: 22, scope: !1539, inlinedAt: !1209)
!1577 = !DILocation(line: 13, column: 10, scope: !1541, inlinedAt: !1576)
!1578 = !DILocation(line: 13, column: 7, scope: !1541, inlinedAt: !1576)
!1579 = !DILocation(line: 16, column: 17, scope: !1541, inlinedAt: !1576)
!1580 = !DILocation(line: 17, column: 17, scope: !1541, inlinedAt: !1576)
!1581 = !DILocation(line: 17, column: 7, scope: !1541, inlinedAt: !1576)
!1582 = !DILocation(line: 18, column: 17, scope: !1541, inlinedAt: !1576)
!1583 = !DILocation(line: 19, column: 17, scope: !1541, inlinedAt: !1576)
!1584 = !DILocation(line: 19, column: 7, scope: !1541, inlinedAt: !1576)
!1585 = !DILocation(line: 23, column: 37, scope: !1541, inlinedAt: !1576)
!1586 = !DILocation(line: 23, column: 52, scope: !1541, inlinedAt: !1576)
!1587 = !DILocation(line: 23, column: 43, scope: !1541, inlinedAt: !1576)
!1588 = !DILocation(line: 23, column: 59, scope: !1541, inlinedAt: !1576)
!1589 = !DILocation(line: 222, column: 14, scope: !1539, inlinedAt: !1209)
!1590 = !DILocation(line: 222, column: 16, scope: !1539, inlinedAt: !1209)
!1591 = !DILocation(line: 222, column: 9, scope: !1539, inlinedAt: !1209)
!1592 = !DILocation(line: 222, column: 20, scope: !1539, inlinedAt: !1209)
!1593 = !DILocation(line: 223, column: 28, scope: !1539, inlinedAt: !1209)
!1594 = !DILocation(line: 0, scope: !1541, inlinedAt: !1595)
!1595 = distinct !DILocation(line: 223, column: 22, scope: !1539, inlinedAt: !1209)
!1596 = !DILocation(line: 13, column: 10, scope: !1541, inlinedAt: !1595)
!1597 = !DILocation(line: 13, column: 7, scope: !1541, inlinedAt: !1595)
!1598 = !DILocation(line: 16, column: 17, scope: !1541, inlinedAt: !1595)
!1599 = !DILocation(line: 17, column: 17, scope: !1541, inlinedAt: !1595)
!1600 = !DILocation(line: 18, column: 17, scope: !1541, inlinedAt: !1595)
!1601 = !DILocation(line: 18, column: 7, scope: !1541, inlinedAt: !1595)
!1602 = !DILocation(line: 19, column: 17, scope: !1541, inlinedAt: !1595)
!1603 = !DILocation(line: 19, column: 7, scope: !1541, inlinedAt: !1595)
!1604 = !DILocation(line: 23, column: 37, scope: !1541, inlinedAt: !1595)
!1605 = !DILocation(line: 23, column: 52, scope: !1541, inlinedAt: !1595)
!1606 = !DILocation(line: 23, column: 43, scope: !1541, inlinedAt: !1595)
!1607 = !DILocation(line: 23, column: 59, scope: !1541, inlinedAt: !1595)
!1608 = !DILocation(line: 223, column: 14, scope: !1539, inlinedAt: !1209)
!1609 = !DILocation(line: 223, column: 16, scope: !1539, inlinedAt: !1209)
!1610 = !DILocation(line: 223, column: 9, scope: !1539, inlinedAt: !1209)
!1611 = !DILocation(line: 223, column: 20, scope: !1539, inlinedAt: !1209)
!1612 = !DILocation(line: 218, column: 41, scope: !1534, inlinedAt: !1209)
!1613 = !DILocation(line: 218, column: 5, scope: !1534, inlinedAt: !1209)
!1614 = distinct !{!1614, !1535, !1615, !300}
!1615 = !DILocation(line: 224, column: 5, scope: !1529, inlinedAt: !1209)
!1616 = !DILocation(line: 228, scope: !1537, inlinedAt: !1209)
!1617 = !DILocalVariable(name: "c", scope: !1537, file: !68, line: 228, type: !58)
!1618 = !DILocation(line: 0, scope: !1537, inlinedAt: !1209)
!1619 = !DILocation(line: 228, column: 26, scope: !1620, inlinedAt: !1209)
!1620 = distinct !DILexicalBlock(scope: !1537, file: !68, line: 228, column: 5)
!1621 = !DILocation(line: 250, column: 5, scope: !1622, inlinedAt: !1209)
!1622 = distinct !DILexicalBlock(scope: !1206, file: !68, line: 250, column: 5)
!1623 = !DILocation(line: 230, column: 9, scope: !1624, inlinedAt: !1209)
!1624 = distinct !DILexicalBlock(scope: !1625, file: !68, line: 230, column: 9)
!1625 = distinct !DILexicalBlock(scope: !1620, file: !68, line: 229, column: 5)
!1626 = !DILocation(line: 230, scope: !1624, inlinedAt: !1209)
!1627 = !DILocalVariable(name: "r", scope: !1624, file: !68, line: 230, type: !86)
!1628 = !DILocation(line: 0, scope: !1624, inlinedAt: !1209)
!1629 = !DILocation(line: 230, column: 36, scope: !1630, inlinedAt: !1209)
!1630 = distinct !DILexicalBlock(scope: !1624, file: !68, line: 230, column: 9)
!1631 = !DILocation(line: 232, column: 28, scope: !1632, inlinedAt: !1209)
!1632 = distinct !DILexicalBlock(scope: !1630, file: !68, line: 231, column: 9)
!1633 = !DILocation(line: 232, column: 32, scope: !1632, inlinedAt: !1209)
!1634 = !DILocation(line: 232, column: 41, scope: !1632, inlinedAt: !1209)
!1635 = !DILocation(line: 232, column: 49, scope: !1632, inlinedAt: !1209)
!1636 = !DILocation(line: 232, column: 45, scope: !1632, inlinedAt: !1209)
!1637 = !DILocalVariable(name: "pos", scope: !1632, file: !68, line: 232, type: !58)
!1638 = !DILocation(line: 0, scope: !1632, inlinedAt: !1209)
!1639 = !DILocation(line: 233, column: 28, scope: !1632, inlinedAt: !1209)
!1640 = !DILocation(line: 233, column: 41, scope: !1632, inlinedAt: !1209)
!1641 = !DILocalVariable(name: "t0", scope: !1632, file: !68, line: 233, type: !53)
!1642 = !DILocation(line: 234, column: 35, scope: !1632, inlinedAt: !1209)
!1643 = !DILocation(line: 234, column: 41, scope: !1632, inlinedAt: !1209)
!1644 = !DILocalVariable(name: "t1", scope: !1632, file: !68, line: 234, type: !53)
!1645 = !DILocation(line: 235, column: 35, scope: !1632, inlinedAt: !1209)
!1646 = !DILocation(line: 235, column: 41, scope: !1632, inlinedAt: !1209)
!1647 = !DILocalVariable(name: "t2", scope: !1632, file: !68, line: 235, type: !53)
!1648 = !DILocation(line: 236, column: 28, scope: !1632, inlinedAt: !1209)
!1649 = !DILocation(line: 236, column: 35, scope: !1632, inlinedAt: !1209)
!1650 = !DILocation(line: 236, column: 41, scope: !1632, inlinedAt: !1209)
!1651 = !DILocalVariable(name: "t3", scope: !1632, file: !68, line: 236, type: !53)
!1652 = !DILocalVariable(name: "t", scope: !1653, file: !68, line: 237, type: !58)
!1653 = distinct !DILexicalBlock(scope: !1632, file: !68, line: 237, column: 13)
!1654 = !DILocation(line: 0, scope: !1653, inlinedAt: !1209)
!1655 = !DILocation(line: 237, column: 18, scope: !1653, inlinedAt: !1209)
!1656 = !DILocation(line: 237, scope: !1653, inlinedAt: !1209)
!1657 = !DILocation(line: 237, column: 34, scope: !1658, inlinedAt: !1209)
!1658 = distinct !DILexicalBlock(scope: !1653, file: !68, line: 237, column: 13)
!1659 = !DILocation(line: 237, column: 13, scope: !1653, inlinedAt: !1209)
!1660 = !DILocation(line: 239, column: 89, scope: !1661, inlinedAt: !1209)
!1661 = distinct !DILexicalBlock(scope: !1658, file: !68, line: 238, column: 13)
!1662 = !DILocation(line: 239, column: 84, scope: !1661, inlinedAt: !1209)
!1663 = !DILocation(line: 239, column: 83, scope: !1661, inlinedAt: !1209)
!1664 = !DILocation(line: 239, column: 105, scope: !1661, inlinedAt: !1209)
!1665 = !DILocation(line: 239, column: 107, scope: !1661, inlinedAt: !1209)
!1666 = !DILocation(line: 239, column: 100, scope: !1661, inlinedAt: !1209)
!1667 = !DILocation(line: 239, column: 99, scope: !1661, inlinedAt: !1209)
!1668 = !DILocation(line: 239, column: 95, scope: !1661, inlinedAt: !1209)
!1669 = !DILocation(line: 239, column: 121, scope: !1661, inlinedAt: !1209)
!1670 = !DILocation(line: 239, column: 123, scope: !1661, inlinedAt: !1209)
!1671 = !DILocation(line: 239, column: 116, scope: !1661, inlinedAt: !1209)
!1672 = !DILocation(line: 239, column: 115, scope: !1661, inlinedAt: !1209)
!1673 = !DILocation(line: 239, column: 111, scope: !1661, inlinedAt: !1209)
!1674 = !DILocation(line: 239, column: 137, scope: !1661, inlinedAt: !1209)
!1675 = !DILocation(line: 239, column: 139, scope: !1661, inlinedAt: !1209)
!1676 = !DILocation(line: 239, column: 132, scope: !1661, inlinedAt: !1209)
!1677 = !DILocation(line: 239, column: 131, scope: !1661, inlinedAt: !1209)
!1678 = !DILocation(line: 239, column: 127, scope: !1661, inlinedAt: !1209)
!1679 = !DILocation(line: 239, column: 22, scope: !1661, inlinedAt: !1209)
!1680 = !DILocation(line: 239, column: 24, scope: !1661, inlinedAt: !1209)
!1681 = !DILocation(line: 239, column: 36, scope: !1661, inlinedAt: !1209)
!1682 = !DILocation(line: 239, column: 40, scope: !1661, inlinedAt: !1209)
!1683 = !DILocation(line: 239, column: 49, scope: !1661, inlinedAt: !1209)
!1684 = !DILocation(line: 239, column: 58, scope: !1661, inlinedAt: !1209)
!1685 = !DILocation(line: 239, column: 60, scope: !1661, inlinedAt: !1209)
!1686 = !DILocation(line: 239, column: 72, scope: !1661, inlinedAt: !1209)
!1687 = !DILocation(line: 239, column: 53, scope: !1661, inlinedAt: !1209)
!1688 = !DILocation(line: 239, column: 17, scope: !1661, inlinedAt: !1209)
!1689 = !DILocation(line: 239, column: 78, scope: !1661, inlinedAt: !1209)
!1690 = !DILocation(line: 237, column: 49, scope: !1658, inlinedAt: !1209)
!1691 = !DILocation(line: 237, column: 13, scope: !1658, inlinedAt: !1209)
!1692 = distinct !{!1692, !1659, !1693, !300}
!1693 = !DILocation(line: 240, column: 13, scope: !1653, inlinedAt: !1209)
!1694 = !DILocation(line: 230, column: 82, scope: !1630, inlinedAt: !1209)
!1695 = !DILocation(line: 230, column: 9, scope: !1630, inlinedAt: !1209)
!1696 = distinct !{!1696, !1623, !1697, !300}
!1697 = !DILocation(line: 241, column: 9, scope: !1624, inlinedAt: !1209)
!1698 = !DILocation(line: 228, column: 38, scope: !1620, inlinedAt: !1209)
!1699 = !DILocation(line: 228, column: 5, scope: !1620, inlinedAt: !1209)
!1700 = distinct !{!1700, !1536, !1701, !300}
!1701 = !DILocation(line: 242, column: 5, scope: !1537, inlinedAt: !1209)
!1702 = !DILocation(line: 250, scope: !1622, inlinedAt: !1209)
!1703 = !DILocalVariable(name: "r", scope: !1622, file: !68, line: 250, type: !86)
!1704 = !DILocation(line: 0, scope: !1622, inlinedAt: !1209)
!1705 = !DILocation(line: 250, column: 23, scope: !1706, inlinedAt: !1209)
!1706 = distinct !DILexicalBlock(scope: !1622, file: !68, line: 250, column: 5)
!1707 = !DILocation(line: 252, column: 9, scope: !1708, inlinedAt: !1209)
!1708 = distinct !DILexicalBlock(scope: !1709, file: !68, line: 252, column: 9)
!1709 = distinct !DILexicalBlock(scope: !1706, file: !68, line: 251, column: 5)
!1710 = !DILocation(line: 252, scope: !1708, inlinedAt: !1209)
!1711 = !DILocalVariable(name: "c", scope: !1708, file: !68, line: 252, type: !86)
!1712 = !DILocation(line: 0, scope: !1708, inlinedAt: !1209)
!1713 = !DILocation(line: 252, column: 27, scope: !1714, inlinedAt: !1209)
!1714 = distinct !DILexicalBlock(scope: !1708, file: !68, line: 252, column: 9)
!1715 = !DILocation(line: 254, column: 13, scope: !1716, inlinedAt: !1209)
!1716 = distinct !DILexicalBlock(scope: !1717, file: !68, line: 254, column: 13)
!1717 = distinct !DILexicalBlock(scope: !1714, file: !68, line: 253, column: 9)
!1718 = !DILocation(line: 254, scope: !1716, inlinedAt: !1209)
!1719 = !DILocalVariable(name: "i", scope: !1716, file: !68, line: 254, type: !86)
!1720 = !DILocation(line: 0, scope: !1716, inlinedAt: !1209)
!1721 = !DILocation(line: 254, column: 35, scope: !1722, inlinedAt: !1209)
!1722 = distinct !DILexicalBlock(scope: !1716, file: !68, line: 254, column: 13)
!1723 = !DILocation(line: 256, column: 55, scope: !1724, inlinedAt: !1209)
!1724 = distinct !DILexicalBlock(scope: !1722, file: !68, line: 255, column: 13)
!1725 = !DILocation(line: 256, column: 59, scope: !1724, inlinedAt: !1209)
!1726 = !DILocation(line: 256, column: 63, scope: !1724, inlinedAt: !1209)
!1727 = !DILocation(line: 256, column: 44, scope: !1724, inlinedAt: !1209)
!1728 = !DILocation(line: 256, column: 95, scope: !1724, inlinedAt: !1209)
!1729 = !DILocation(line: 256, column: 92, scope: !1724, inlinedAt: !1209)
!1730 = !DILocation(line: 256, column: 75, scope: !1724, inlinedAt: !1209)
!1731 = !DILocation(line: 256, column: 99, scope: !1724, inlinedAt: !1209)
!1732 = !DILocation(line: 256, column: 104, scope: !1724, inlinedAt: !1209)
!1733 = !DILocation(line: 0, scope: !435, inlinedAt: !1734)
!1734 = distinct !DILocation(line: 256, column: 17, scope: !1724, inlinedAt: !1209)
!1735 = !DILocation(line: 22, column: 10, scope: !444, inlinedAt: !1734)
!1736 = !DILocation(line: 22, scope: !444, inlinedAt: !1734)
!1737 = !DILocation(line: 22, column: 29, scope: !447, inlinedAt: !1734)
!1738 = !DILocation(line: 22, column: 19, scope: !447, inlinedAt: !1734)
!1739 = !DILocation(line: 22, column: 5, scope: !444, inlinedAt: !1734)
!1740 = !DILocation(line: 23, column: 19, scope: !450, inlinedAt: !1734)
!1741 = !DILocation(line: 23, column: 24, scope: !450, inlinedAt: !1734)
!1742 = !DILocation(line: 23, column: 14, scope: !450, inlinedAt: !1734)
!1743 = !DILocation(line: 23, column: 17, scope: !450, inlinedAt: !1734)
!1744 = !DILocation(line: 24, column: 24, scope: !450, inlinedAt: !1734)
!1745 = !DILocation(line: 24, column: 17, scope: !450, inlinedAt: !1734)
!1746 = !DILocation(line: 24, column: 14, scope: !450, inlinedAt: !1734)
!1747 = !DILocation(line: 22, column: 34, scope: !447, inlinedAt: !1734)
!1748 = !DILocation(line: 22, column: 5, scope: !447, inlinedAt: !1734)
!1749 = distinct !{!1749, !1739, !1750, !300}
!1750 = !DILocation(line: 25, column: 5, scope: !444, inlinedAt: !1734)
!1751 = !DILocation(line: 254, column: 50, scope: !1722, inlinedAt: !1209)
!1752 = !DILocation(line: 254, column: 13, scope: !1722, inlinedAt: !1209)
!1753 = distinct !{!1753, !1715, !1754, !300}
!1754 = !DILocation(line: 257, column: 13, scope: !1716, inlinedAt: !1209)
!1755 = !DILocation(line: 252, column: 50, scope: !1714, inlinedAt: !1209)
!1756 = !DILocation(line: 252, column: 9, scope: !1714, inlinedAt: !1209)
!1757 = distinct !{!1757, !1707, !1758, !300}
!1758 = !DILocation(line: 258, column: 9, scope: !1708, inlinedAt: !1209)
!1759 = !DILocation(line: 250, column: 38, scope: !1706, inlinedAt: !1209)
!1760 = !DILocation(line: 250, column: 5, scope: !1706, inlinedAt: !1209)
!1761 = distinct !{!1761, !1621, !1762, !300}
!1762 = !DILocation(line: 259, column: 5, scope: !1622, inlinedAt: !1209)
!1763 = !DILocation(line: 260, column: 1, scope: !1206, inlinedAt: !1209)
!1764 = !DILocalVariable(name: "i", scope: !1765, file: !68, line: 461, type: !86)
!1765 = distinct !DILexicalBlock(scope: !991, file: !68, line: 461, column: 9)
!1766 = !DILocation(line: 0, scope: !1765)
!1767 = !DILocation(line: 461, column: 14, scope: !1765)
!1768 = !DILocation(line: 461, scope: !1765)
!1769 = !DILocation(line: 461, column: 27, scope: !1770)
!1770 = distinct !DILexicalBlock(scope: !1765, file: !68, line: 461, column: 9)
!1771 = !DILocation(line: 461, column: 9, scope: !1765)
!1772 = !DILocation(line: 463, column: 20, scope: !1773)
!1773 = distinct !DILexicalBlock(scope: !1770, file: !68, line: 462, column: 9)
!1774 = !DILocation(line: 463, column: 43, scope: !1773)
!1775 = !DILocation(line: 463, column: 13, scope: !1773)
!1776 = !DILocation(line: 463, column: 48, scope: !1773)
!1777 = !DILocation(line: 461, column: 39, scope: !1770)
!1778 = !DILocation(line: 461, column: 9, scope: !1770)
!1779 = distinct !{!1779, !1771, !1780, !300}
!1780 = !DILocation(line: 464, column: 9, scope: !1765)
!1781 = !DILocation(line: 466, column: 18, scope: !991)
!1782 = !DILocation(line: 0, scope: !435, inlinedAt: !1783)
!1783 = distinct !DILocation(line: 466, column: 9, scope: !991)
!1784 = !DILocation(line: 22, column: 10, scope: !444, inlinedAt: !1783)
!1785 = !DILocation(line: 22, scope: !444, inlinedAt: !1783)
!1786 = !DILocation(line: 22, column: 19, scope: !447, inlinedAt: !1783)
!1787 = !DILocation(line: 22, column: 5, scope: !444, inlinedAt: !1783)
!1788 = !DILocation(line: 23, column: 19, scope: !450, inlinedAt: !1783)
!1789 = !DILocation(line: 23, column: 24, scope: !450, inlinedAt: !1783)
!1790 = !DILocation(line: 23, column: 14, scope: !450, inlinedAt: !1783)
!1791 = !DILocation(line: 23, column: 17, scope: !450, inlinedAt: !1783)
!1792 = !DILocation(line: 24, column: 24, scope: !450, inlinedAt: !1783)
!1793 = !DILocation(line: 24, column: 17, scope: !450, inlinedAt: !1783)
!1794 = !DILocation(line: 24, column: 14, scope: !450, inlinedAt: !1783)
!1795 = !DILocation(line: 22, column: 34, scope: !447, inlinedAt: !1783)
!1796 = !DILocation(line: 22, column: 5, scope: !447, inlinedAt: !1783)
!1797 = distinct !{!1797, !1787, !1798, !300}
!1798 = !DILocation(line: 25, column: 5, scope: !444, inlinedAt: !1783)
!1799 = !DILocation(line: 470, column: 13, scope: !1800)
!1800 = distinct !DILexicalBlock(scope: !991, file: !68, line: 470, column: 13)
!1801 = !DILocation(line: 473, column: 13, scope: !1802)
!1802 = distinct !DILexicalBlock(scope: !1800, file: !68, line: 472, column: 16)
!1803 = !DILocation(line: 474, column: 13, scope: !1802)
!1804 = !DILocation(line: 444, column: 35, scope: !989)
!1805 = !DILocation(line: 444, column: 5, scope: !989)
!1806 = distinct !{!1806, !972, !1807, !300}
!1807 = !DILocation(line: 476, column: 5, scope: !973)
!1808 = !DILocalVariable(name: "i", scope: !1809, file: !68, line: 478, type: !86)
!1809 = distinct !DILexicalBlock(scope: !871, file: !68, line: 478, column: 5)
!1810 = !DILocation(line: 0, scope: !1809)
!1811 = !DILocation(line: 478, column: 10, scope: !1809)
!1812 = !DILocation(line: 478, scope: !1809)
!1813 = !DILocation(line: 478, column: 23, scope: !1814)
!1814 = distinct !DILexicalBlock(scope: !1809, file: !68, line: 478, column: 5)
!1815 = !DILocation(line: 478, column: 5, scope: !1809)
!1816 = !DILocation(line: 34, column: 5, scope: !1817, inlinedAt: !1819)
!1817 = distinct !DILexicalBlock(scope: !1818, file: !68, line: 34, column: 5)
!1818 = distinct !DISubprogram(name: "encode", scope: !68, file: !68, line: 32, type: !436, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1819 = distinct !DILocation(line: 484, column: 5, scope: !871)
!1820 = !DILocation(line: 479, column: 23, scope: !1821)
!1821 = distinct !DILexicalBlock(scope: !1814, file: !68, line: 478, column: 44)
!1822 = !DILocalVariable(name: "vi", scope: !871, file: !68, line: 376, type: !61)
!1823 = !DILocation(line: 480, column: 20, scope: !1821)
!1824 = !DILocation(line: 480, column: 29, scope: !1821)
!1825 = !DILocation(line: 480, column: 25, scope: !1821)
!1826 = !DILocalVariable(name: "a", arg: 1, scope: !1827, file: !670, line: 78, type: !90)
!1827 = distinct !DISubprogram(name: "mat_mul", scope: !670, file: !670, line: 78, type: !1828, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1828 = !DISubroutineType(types: !1829)
!1829 = !{null, !90, !90, !61, !86, !86, !86}
!1830 = !DILocation(line: 0, scope: !1827, inlinedAt: !1831)
!1831 = distinct !DILocation(line: 480, column: 9, scope: !1821)
!1832 = !DILocalVariable(name: "b", arg: 2, scope: !1827, file: !670, line: 78, type: !90)
!1833 = !DILocalVariable(name: "c", arg: 3, scope: !1827, file: !670, line: 79, type: !61)
!1834 = !DILocalVariable(name: "colrow_ab", arg: 4, scope: !1827, file: !670, line: 79, type: !86)
!1835 = !DILocalVariable(name: "row_a", arg: 5, scope: !1827, file: !670, line: 79, type: !86)
!1836 = !DILocalVariable(name: "col_b", arg: 6, scope: !1827, file: !670, line: 79, type: !86)
!1837 = !DILocalVariable(name: "i", scope: !1838, file: !670, line: 80, type: !86)
!1838 = distinct !DILexicalBlock(scope: !1827, file: !670, line: 80, column: 5)
!1839 = !DILocation(line: 0, scope: !1838, inlinedAt: !1831)
!1840 = !DILocation(line: 80, column: 10, scope: !1838, inlinedAt: !1831)
!1841 = !DILocation(line: 80, scope: !1838, inlinedAt: !1831)
!1842 = !DILocation(line: 80, column: 23, scope: !1843, inlinedAt: !1831)
!1843 = distinct !DILexicalBlock(scope: !1838, file: !670, line: 80, column: 5)
!1844 = !DILocation(line: 80, column: 5, scope: !1838, inlinedAt: !1831)
!1845 = !DILocation(line: 81, column: 9, scope: !1846, inlinedAt: !1831)
!1846 = distinct !DILexicalBlock(scope: !1847, file: !670, line: 81, column: 9)
!1847 = distinct !DILexicalBlock(scope: !1843, file: !670, line: 80, column: 53)
!1848 = !DILocation(line: 81, scope: !1846, inlinedAt: !1831)
!1849 = !DILocalVariable(name: "j", scope: !1846, file: !670, line: 81, type: !86)
!1850 = !DILocation(line: 0, scope: !1846, inlinedAt: !1831)
!1851 = !DILocation(line: 81, column: 27, scope: !1852, inlinedAt: !1831)
!1852 = distinct !DILexicalBlock(scope: !1846, file: !670, line: 81, column: 9)
!1853 = !DILocation(line: 82, column: 31, scope: !1854, inlinedAt: !1831)
!1854 = distinct !DILexicalBlock(scope: !1852, file: !670, line: 81, column: 46)
!1855 = !DILocalVariable(name: "a", arg: 1, scope: !1856, file: !670, line: 69, type: !90)
!1856 = distinct !DISubprogram(name: "lincomb", scope: !670, file: !670, line: 69, type: !1857, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1857 = !DISubroutineType(types: !1858)
!1858 = !{!51, !90, !90, !86, !86}
!1859 = !DILocation(line: 0, scope: !1856, inlinedAt: !1860)
!1860 = distinct !DILocation(line: 82, column: 18, scope: !1854, inlinedAt: !1831)
!1861 = !DILocalVariable(name: "b", arg: 2, scope: !1856, file: !670, line: 70, type: !90)
!1862 = !DILocalVariable(name: "n", arg: 3, scope: !1856, file: !670, line: 70, type: !86)
!1863 = !DILocalVariable(name: "m", arg: 4, scope: !1856, file: !670, line: 70, type: !86)
!1864 = !DILocalVariable(name: "ret", scope: !1856, file: !670, line: 71, type: !51)
!1865 = !DILocalVariable(name: "i", scope: !1866, file: !670, line: 72, type: !86)
!1866 = distinct !DILexicalBlock(scope: !1856, file: !670, line: 72, column: 5)
!1867 = !DILocation(line: 0, scope: !1866, inlinedAt: !1860)
!1868 = !DILocation(line: 72, column: 10, scope: !1866, inlinedAt: !1860)
!1869 = !DILocation(line: 72, scope: !1866, inlinedAt: !1860)
!1870 = !DILocation(line: 72, column: 23, scope: !1871, inlinedAt: !1860)
!1871 = distinct !DILexicalBlock(scope: !1866, file: !670, line: 72, column: 5)
!1872 = !DILocation(line: 72, column: 5, scope: !1866, inlinedAt: !1860)
!1873 = !DILocation(line: 73, column: 27, scope: !1874, inlinedAt: !1860)
!1874 = distinct !DILexicalBlock(scope: !1871, file: !670, line: 72, column: 41)
!1875 = !DILocation(line: 73, column: 33, scope: !1874, inlinedAt: !1860)
!1876 = !DILocation(line: 0, scope: !1541, inlinedAt: !1877)
!1877 = distinct !DILocation(line: 73, column: 21, scope: !1874, inlinedAt: !1860)
!1878 = !DILocation(line: 13, column: 10, scope: !1541, inlinedAt: !1877)
!1879 = !DILocation(line: 13, column: 7, scope: !1541, inlinedAt: !1877)
!1880 = !DILocation(line: 16, column: 17, scope: !1541, inlinedAt: !1877)
!1881 = !DILocation(line: 17, column: 13, scope: !1541, inlinedAt: !1877)
!1882 = !DILocation(line: 17, column: 17, scope: !1541, inlinedAt: !1877)
!1883 = !DILocation(line: 17, column: 7, scope: !1541, inlinedAt: !1877)
!1884 = !DILocation(line: 18, column: 13, scope: !1541, inlinedAt: !1877)
!1885 = !DILocation(line: 18, column: 17, scope: !1541, inlinedAt: !1877)
!1886 = !DILocation(line: 18, column: 7, scope: !1541, inlinedAt: !1877)
!1887 = !DILocation(line: 19, column: 13, scope: !1541, inlinedAt: !1877)
!1888 = !DILocation(line: 19, column: 17, scope: !1541, inlinedAt: !1877)
!1889 = !DILocation(line: 19, column: 7, scope: !1541, inlinedAt: !1877)
!1890 = !DILocation(line: 23, column: 37, scope: !1541, inlinedAt: !1877)
!1891 = !DILocation(line: 23, column: 52, scope: !1541, inlinedAt: !1877)
!1892 = !DILocation(line: 23, column: 43, scope: !1541, inlinedAt: !1877)
!1893 = !DILocation(line: 23, column: 59, scope: !1541, inlinedAt: !1877)
!1894 = !DILocalVariable(name: "a", arg: 1, scope: !1895, file: !670, line: 42, type: !51)
!1895 = distinct !DISubprogram(name: "add_f", scope: !670, file: !670, line: 42, type: !1542, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1896 = !DILocation(line: 0, scope: !1895, inlinedAt: !1897)
!1897 = distinct !DILocation(line: 73, column: 15, scope: !1874, inlinedAt: !1860)
!1898 = !DILocalVariable(name: "b", arg: 2, scope: !1895, file: !670, line: 42, type: !51)
!1899 = !DILocation(line: 43, column: 14, scope: !1895, inlinedAt: !1897)
!1900 = !DILocation(line: 72, column: 28, scope: !1871, inlinedAt: !1860)
!1901 = !DILocation(line: 72, column: 35, scope: !1871, inlinedAt: !1860)
!1902 = !DILocation(line: 72, column: 5, scope: !1871, inlinedAt: !1860)
!1903 = distinct !{!1903, !1872, !1904, !300}
!1904 = !DILocation(line: 74, column: 5, scope: !1866, inlinedAt: !1860)
!1905 = !DILocation(line: 82, column: 16, scope: !1854, inlinedAt: !1831)
!1906 = !DILocation(line: 81, column: 41, scope: !1852, inlinedAt: !1831)
!1907 = !DILocation(line: 81, column: 9, scope: !1852, inlinedAt: !1831)
!1908 = distinct !{!1908, !1845, !1909, !300}
!1909 = !DILocation(line: 83, column: 9, scope: !1846, inlinedAt: !1831)
!1910 = !DILocation(line: 80, column: 32, scope: !1843, inlinedAt: !1831)
!1911 = !DILocation(line: 80, column: 39, scope: !1843, inlinedAt: !1831)
!1912 = !DILocation(line: 80, column: 5, scope: !1843, inlinedAt: !1831)
!1913 = distinct !{!1913, !1844, !1914, !300}
!1914 = !DILocation(line: 84, column: 5, scope: !1838, inlinedAt: !1831)
!1915 = !DILocation(line: 479, column: 19, scope: !1821)
!1916 = !DILocation(line: 481, column: 31, scope: !1821)
!1917 = !DILocation(line: 481, column: 27, scope: !1821)
!1918 = !DILocalVariable(name: "a", arg: 1, scope: !1919, file: !670, line: 87, type: !90)
!1919 = distinct !DISubprogram(name: "mat_add", scope: !670, file: !670, line: 87, type: !1920, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1920 = !DISubroutineType(types: !1921)
!1921 = !{null, !90, !90, !61, !86, !86}
!1922 = !DILocation(line: 0, scope: !1919, inlinedAt: !1923)
!1923 = distinct !DILocation(line: 481, column: 9, scope: !1821)
!1924 = !DILocalVariable(name: "b", arg: 2, scope: !1919, file: !670, line: 87, type: !90)
!1925 = !DILocalVariable(name: "c", arg: 3, scope: !1919, file: !670, line: 88, type: !61)
!1926 = !DILocalVariable(name: "m", arg: 4, scope: !1919, file: !670, line: 88, type: !86)
!1927 = !DILocalVariable(name: "n", arg: 5, scope: !1919, file: !670, line: 88, type: !86)
!1928 = !DILocalVariable(name: "i", scope: !1929, file: !670, line: 89, type: !86)
!1929 = distinct !DILexicalBlock(scope: !1919, file: !670, line: 89, column: 5)
!1930 = !DILocation(line: 0, scope: !1929, inlinedAt: !1923)
!1931 = !DILocation(line: 89, column: 10, scope: !1929, inlinedAt: !1923)
!1932 = !DILocation(line: 89, scope: !1929, inlinedAt: !1923)
!1933 = !DILocation(line: 89, column: 23, scope: !1934, inlinedAt: !1923)
!1934 = distinct !DILexicalBlock(scope: !1929, file: !670, line: 89, column: 5)
!1935 = !DILocation(line: 89, column: 5, scope: !1929, inlinedAt: !1923)
!1936 = !DILocation(line: 90, column: 9, scope: !1937, inlinedAt: !1923)
!1937 = distinct !DILexicalBlock(scope: !1938, file: !670, line: 90, column: 9)
!1938 = distinct !DILexicalBlock(scope: !1934, file: !670, line: 89, column: 33)
!1939 = !DILocation(line: 90, scope: !1937, inlinedAt: !1923)
!1940 = !DILocalVariable(name: "j", scope: !1937, file: !670, line: 90, type: !86)
!1941 = !DILocation(line: 0, scope: !1937, inlinedAt: !1923)
!1942 = !DILocation(line: 90, column: 27, scope: !1943, inlinedAt: !1923)
!1943 = distinct !DILexicalBlock(scope: !1937, file: !670, line: 90, column: 9)
!1944 = !DILocation(line: 91, column: 42, scope: !1945, inlinedAt: !1923)
!1945 = distinct !DILexicalBlock(scope: !1943, file: !670, line: 90, column: 37)
!1946 = !DILocation(line: 91, column: 50, scope: !1945, inlinedAt: !1923)
!1947 = !DILocation(line: 91, column: 38, scope: !1945, inlinedAt: !1923)
!1948 = !DILocation(line: 91, column: 60, scope: !1945, inlinedAt: !1923)
!1949 = !DILocation(line: 91, column: 68, scope: !1945, inlinedAt: !1923)
!1950 = !DILocation(line: 91, column: 56, scope: !1945, inlinedAt: !1923)
!1951 = !DILocation(line: 0, scope: !1895, inlinedAt: !1952)
!1952 = distinct !DILocation(line: 91, column: 32, scope: !1945, inlinedAt: !1923)
!1953 = !DILocation(line: 43, column: 14, scope: !1895, inlinedAt: !1952)
!1954 = !DILocation(line: 91, column: 17, scope: !1945, inlinedAt: !1923)
!1955 = !DILocation(line: 91, column: 25, scope: !1945, inlinedAt: !1923)
!1956 = !DILocation(line: 91, column: 30, scope: !1945, inlinedAt: !1923)
!1957 = !DILocation(line: 90, column: 9, scope: !1943, inlinedAt: !1923)
!1958 = distinct !{!1958, !1936, !1959, !300}
!1959 = !DILocation(line: 92, column: 9, scope: !1937, inlinedAt: !1923)
!1960 = !DILocation(line: 89, column: 28, scope: !1934, inlinedAt: !1923)
!1961 = !DILocation(line: 89, column: 5, scope: !1934, inlinedAt: !1923)
!1962 = distinct !{!1962, !1935, !1963, !300}
!1963 = !DILocation(line: 93, column: 5, scope: !1929, inlinedAt: !1923)
!1964 = !DILocation(line: 482, column: 22, scope: !1821)
!1965 = !DILocation(line: 482, column: 18, scope: !1821)
!1966 = !DILocation(line: 482, column: 32, scope: !1821)
!1967 = !DILocation(line: 482, column: 61, scope: !1821)
!1968 = !DILocation(line: 482, column: 57, scope: !1821)
!1969 = !DILocation(line: 482, column: 9, scope: !1821)
!1970 = !DILocation(line: 478, column: 39, scope: !1814)
!1971 = !DILocation(line: 478, column: 5, scope: !1814)
!1972 = distinct !{!1972, !1815, !1973, !300}
!1973 = !DILocation(line: 483, column: 5, scope: !1809)
!1974 = !DILocation(line: 34, scope: !1817, inlinedAt: !1819)
!1975 = !DILocalVariable(name: "m", arg: 1, scope: !1818, file: !68, line: 32, type: !90)
!1976 = !DILocation(line: 0, scope: !1818, inlinedAt: !1819)
!1977 = !DILocalVariable(name: "i", scope: !1818, file: !68, line: 33, type: !86)
!1978 = !DILocation(line: 34, column: 19, scope: !1979, inlinedAt: !1819)
!1979 = distinct !DILexicalBlock(scope: !1817, file: !68, line: 34, column: 5)
!1980 = !DILocation(line: 35, column: 20, scope: !1981, inlinedAt: !1819)
!1981 = distinct !DILexicalBlock(scope: !1979, file: !68, line: 34, column: 44)
!1982 = !DILocation(line: 35, column: 31, scope: !1981, inlinedAt: !1819)
!1983 = !DILocation(line: 35, column: 27, scope: !1981, inlinedAt: !1819)
!1984 = !DILocation(line: 35, column: 36, scope: !1981, inlinedAt: !1819)
!1985 = !DILocation(line: 35, column: 24, scope: !1981, inlinedAt: !1819)
!1986 = !DILocation(line: 35, column: 9, scope: !1981, inlinedAt: !1819)
!1987 = !DILocation(line: 35, column: 17, scope: !1981, inlinedAt: !1819)
!1988 = !DILocation(line: 34, column: 31, scope: !1979, inlinedAt: !1819)
!1989 = !DILocation(line: 34, column: 38, scope: !1979, inlinedAt: !1819)
!1990 = !DILocation(line: 34, column: 5, scope: !1979, inlinedAt: !1819)
!1991 = distinct !{!1991, !1816, !1992, !300}
!1992 = !DILocation(line: 36, column: 5, scope: !1817, inlinedAt: !1819)
!1993 = !DILocation(line: 486, column: 34, scope: !871)
!1994 = !DILocation(line: 486, column: 5, scope: !871)
!1995 = !DILocation(line: 487, column: 13, scope: !871)
!1996 = !DILocation(line: 487, column: 5, scope: !871)
!1997 = !DILabel(scope: !871, name: "err", file: !68, line: 489)
!1998 = !DILocation(line: 489, column: 1, scope: !871)
!1999 = !DILocation(line: 490, column: 5, scope: !871)
!2000 = !DILocation(line: 491, column: 5, scope: !871)
!2001 = !DILocation(line: 492, column: 5, scope: !871)
!2002 = !DILocation(line: 493, column: 5, scope: !871)
!2003 = !DILocation(line: 494, column: 26, scope: !871)
!2004 = !DILocation(line: 494, column: 5, scope: !871)
!2005 = !DILocation(line: 495, column: 5, scope: !871)
!2006 = !DILocation(line: 496, column: 5, scope: !871)
!2007 = !DILocation(line: 497, column: 5, scope: !871)
!2008 = !DILocation(line: 498, column: 5, scope: !871)
!2009 = !DILocation(line: 499, column: 5, scope: !871)
!2010 = distinct !DISubprogram(name: "compute_rhs", scope: !68, file: !68, line: 43, type: !2011, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2011 = !DISubroutineType(types: !2012)
!2012 = !{null, !193, !52, !90, !61}
!2013 = !DILocalVariable(name: "p", arg: 1, scope: !2010, file: !68, line: 43, type: !193)
!2014 = !DILocation(line: 0, scope: !2010)
!2015 = !DILocalVariable(name: "vPv", arg: 2, scope: !2010, file: !68, line: 43, type: !52)
!2016 = !DILocalVariable(name: "t", arg: 3, scope: !2010, file: !68, line: 43, type: !90)
!2017 = !DILocalVariable(name: "y", arg: 4, scope: !2010, file: !68, line: 43, type: !61)
!2018 = !DILocalVariable(name: "top_pos", scope: !2010, file: !68, line: 48, type: !2019)
!2019 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !58)
!2020 = !DILocalVariable(name: "m_vec_limbs", scope: !2010, file: !68, line: 49, type: !2019)
!2021 = !DILocalVariable(name: "mask", scope: !2022, file: !68, line: 53, type: !53)
!2022 = distinct !DILexicalBlock(scope: !2023, file: !68, line: 52, column: 29)
!2023 = distinct !DILexicalBlock(scope: !2010, file: !68, line: 52, column: 8)
!2024 = !DILocation(line: 0, scope: !2022)
!2025 = !DILocalVariable(name: "i", scope: !2026, file: !68, line: 56, type: !86)
!2026 = distinct !DILexicalBlock(scope: !2022, file: !68, line: 56, column: 9)
!2027 = !DILocation(line: 0, scope: !2026)
!2028 = !DILocation(line: 56, column: 14, scope: !2026)
!2029 = !DILocation(line: 56, scope: !2026)
!2030 = !DILocation(line: 56, column: 27, scope: !2031)
!2031 = distinct !DILexicalBlock(scope: !2026, file: !68, line: 56, column: 9)
!2032 = !DILocation(line: 56, column: 9, scope: !2026)
!2033 = !DILocation(line: 58, column: 13, scope: !2034)
!2034 = distinct !DILexicalBlock(scope: !2031, file: !68, line: 57, column: 9)
!2035 = !DILocation(line: 58, column: 50, scope: !2034)
!2036 = !DILocation(line: 56, column: 53, scope: !2031)
!2037 = !DILocation(line: 56, column: 9, scope: !2031)
!2038 = distinct !{!2038, !2032, !2039, !300}
!2039 = !DILocation(line: 59, column: 9, scope: !2026)
!2040 = !DILocalVariable(name: "temp", scope: !2010, file: !68, line: 62, type: !278)
!2041 = !DILocation(line: 62, column: 14, scope: !2010)
!2042 = !DILocalVariable(name: "temp_bytes", scope: !2010, file: !68, line: 63, type: !61)
!2043 = !DILocalVariable(name: "i", scope: !2044, file: !68, line: 64, type: !86)
!2044 = distinct !DILexicalBlock(scope: !2010, file: !68, line: 64, column: 5)
!2045 = !DILocation(line: 0, scope: !2044)
!2046 = !DILocation(line: 64, column: 10, scope: !2044)
!2047 = !DILocation(line: 64, scope: !2044)
!2048 = !DILocation(line: 64, column: 36, scope: !2049)
!2049 = distinct !DILexicalBlock(scope: !2044, file: !68, line: 64, column: 5)
!2050 = !DILocation(line: 64, column: 5, scope: !2044)
!2051 = !DILocation(line: 65, column: 9, scope: !2052)
!2052 = distinct !DILexicalBlock(scope: !2053, file: !68, line: 65, column: 9)
!2053 = distinct !DILexicalBlock(scope: !2049, file: !68, line: 64, column: 48)
!2054 = !DILocation(line: 99, column: 5, scope: !2055)
!2055 = distinct !DILexicalBlock(scope: !2010, file: !68, line: 99, column: 5)
!2056 = !DILocation(line: 65, scope: !2052)
!2057 = !DILocalVariable(name: "j", scope: !2052, file: !68, line: 65, type: !86)
!2058 = !DILocation(line: 0, scope: !2052)
!2059 = !DILocation(line: 65, column: 27, scope: !2060)
!2060 = distinct !DILexicalBlock(scope: !2052, file: !68, line: 65, column: 9)
!2061 = !DILocation(line: 67, column: 34, scope: !2062)
!2062 = distinct !DILexicalBlock(scope: !2060, file: !68, line: 65, column: 46)
!2063 = !DILocation(line: 67, column: 54, scope: !2062)
!2064 = !DILocation(line: 67, column: 33, scope: !2062)
!2065 = !DILocalVariable(name: "top", scope: !2062, file: !68, line: 67, type: !51)
!2066 = !DILocation(line: 0, scope: !2062)
!2067 = !DILocation(line: 68, column: 13, scope: !2062)
!2068 = !DILocation(line: 68, column: 33, scope: !2062)
!2069 = !DILocalVariable(name: "k", scope: !2070, file: !68, line: 69, type: !86)
!2070 = distinct !DILexicalBlock(scope: !2062, file: !68, line: 69, column: 13)
!2071 = !DILocation(line: 0, scope: !2070)
!2072 = !DILocation(line: 69, column: 17, scope: !2070)
!2073 = !DILocation(line: 69, scope: !2070)
!2074 = !DILocation(line: 69, column: 43, scope: !2075)
!2075 = distinct !DILexicalBlock(scope: !2070, file: !68, line: 69, column: 13)
!2076 = !DILocation(line: 69, column: 13, scope: !2070)
!2077 = !DILocation(line: 74, column: 13, scope: !2078)
!2078 = distinct !DILexicalBlock(scope: !2062, file: !68, line: 74, column: 13)
!2079 = !DILocation(line: 70, column: 30, scope: !2080)
!2080 = distinct !DILexicalBlock(scope: !2075, file: !68, line: 69, column: 52)
!2081 = !DILocation(line: 70, column: 38, scope: !2080)
!2082 = !DILocation(line: 70, column: 23, scope: !2080)
!2083 = !DILocation(line: 70, column: 17, scope: !2080)
!2084 = !DILocation(line: 70, column: 27, scope: !2080)
!2085 = !DILocation(line: 71, column: 17, scope: !2080)
!2086 = !DILocation(line: 71, column: 25, scope: !2080)
!2087 = !DILocation(line: 69, column: 49, scope: !2075)
!2088 = !DILocation(line: 69, column: 13, scope: !2075)
!2089 = distinct !{!2089, !2076, !2090, !300}
!2090 = !DILocation(line: 72, column: 13, scope: !2070)
!2091 = !DILocation(line: 74, scope: !2078)
!2092 = !DILocalVariable(name: "jj", scope: !2078, file: !68, line: 74, type: !86)
!2093 = !DILocation(line: 0, scope: !2078)
!2094 = !DILocation(line: 74, column: 33, scope: !2095)
!2095 = distinct !DILexicalBlock(scope: !2078, file: !68, line: 74, column: 13)
!2096 = !DILocation(line: 92, column: 13, scope: !2097)
!2097 = distinct !DILexicalBlock(scope: !2062, file: !68, line: 92, column: 13)
!2098 = !DILocation(line: 75, column: 22, scope: !2099)
!2099 = distinct !DILexicalBlock(scope: !2100, file: !68, line: 75, column: 20)
!2100 = distinct !DILexicalBlock(scope: !2095, file: !68, line: 74, column: 53)
!2101 = !DILocation(line: 75, column: 25, scope: !2099)
!2102 = !DILocation(line: 79, column: 52, scope: !2103)
!2103 = distinct !DILexicalBlock(scope: !2099, file: !68, line: 75, column: 30)
!2104 = !DILocation(line: 0, scope: !1541, inlinedAt: !2105)
!2105 = distinct !DILocation(line: 79, column: 41, scope: !2103)
!2106 = !DILocation(line: 13, column: 10, scope: !1541, inlinedAt: !2105)
!2107 = !DILocation(line: 13, column: 7, scope: !1541, inlinedAt: !2105)
!2108 = !DILocation(line: 16, column: 17, scope: !1541, inlinedAt: !2105)
!2109 = !DILocation(line: 17, column: 13, scope: !1541, inlinedAt: !2105)
!2110 = !DILocation(line: 17, column: 17, scope: !1541, inlinedAt: !2105)
!2111 = !DILocation(line: 17, column: 7, scope: !1541, inlinedAt: !2105)
!2112 = !DILocation(line: 18, column: 13, scope: !1541, inlinedAt: !2105)
!2113 = !DILocation(line: 18, column: 17, scope: !1541, inlinedAt: !2105)
!2114 = !DILocation(line: 18, column: 7, scope: !1541, inlinedAt: !2105)
!2115 = !DILocation(line: 19, column: 13, scope: !1541, inlinedAt: !2105)
!2116 = !DILocation(line: 19, column: 17, scope: !1541, inlinedAt: !2105)
!2117 = !DILocation(line: 19, column: 7, scope: !1541, inlinedAt: !2105)
!2118 = !DILocation(line: 23, column: 37, scope: !1541, inlinedAt: !2105)
!2119 = !DILocation(line: 23, column: 52, scope: !1541, inlinedAt: !2105)
!2120 = !DILocation(line: 23, column: 43, scope: !1541, inlinedAt: !2105)
!2121 = !DILocation(line: 23, column: 59, scope: !1541, inlinedAt: !2105)
!2122 = !DILocation(line: 79, column: 34, scope: !2103)
!2123 = !DILocation(line: 79, column: 21, scope: !2103)
!2124 = !DILocation(line: 79, column: 38, scope: !2103)
!2125 = !DILocation(line: 81, column: 17, scope: !2103)
!2126 = !DILocation(line: 86, column: 52, scope: !2127)
!2127 = distinct !DILexicalBlock(scope: !2099, file: !68, line: 82, column: 22)
!2128 = !DILocation(line: 0, scope: !1541, inlinedAt: !2129)
!2129 = distinct !DILocation(line: 86, column: 41, scope: !2127)
!2130 = !DILocation(line: 13, column: 10, scope: !1541, inlinedAt: !2129)
!2131 = !DILocation(line: 13, column: 7, scope: !1541, inlinedAt: !2129)
!2132 = !DILocation(line: 16, column: 17, scope: !1541, inlinedAt: !2129)
!2133 = !DILocation(line: 17, column: 13, scope: !1541, inlinedAt: !2129)
!2134 = !DILocation(line: 17, column: 17, scope: !1541, inlinedAt: !2129)
!2135 = !DILocation(line: 17, column: 7, scope: !1541, inlinedAt: !2129)
!2136 = !DILocation(line: 18, column: 13, scope: !1541, inlinedAt: !2129)
!2137 = !DILocation(line: 18, column: 17, scope: !1541, inlinedAt: !2129)
!2138 = !DILocation(line: 18, column: 7, scope: !1541, inlinedAt: !2129)
!2139 = !DILocation(line: 19, column: 13, scope: !1541, inlinedAt: !2129)
!2140 = !DILocation(line: 19, column: 17, scope: !1541, inlinedAt: !2129)
!2141 = !DILocation(line: 19, column: 7, scope: !1541, inlinedAt: !2129)
!2142 = !DILocation(line: 23, column: 37, scope: !1541, inlinedAt: !2129)
!2143 = !DILocation(line: 23, column: 52, scope: !1541, inlinedAt: !2129)
!2144 = !DILocation(line: 23, column: 43, scope: !1541, inlinedAt: !2129)
!2145 = !DILocation(line: 23, column: 59, scope: !1541, inlinedAt: !2129)
!2146 = !DILocation(line: 86, column: 73, scope: !2127)
!2147 = !DILocation(line: 86, column: 34, scope: !2127)
!2148 = !DILocation(line: 86, column: 21, scope: !2127)
!2149 = !DILocation(line: 86, column: 38, scope: !2127)
!2150 = !DILocation(line: 74, column: 49, scope: !2095)
!2151 = !DILocation(line: 74, column: 13, scope: !2095)
!2152 = distinct !{!2152, !2077, !2153, !300}
!2153 = !DILocation(line: 89, column: 13, scope: !2078)
!2154 = !DILocation(line: 92, scope: !2097)
!2155 = !DILocalVariable(name: "k", scope: !2097, file: !68, line: 92, type: !58)
!2156 = !DILocation(line: 0, scope: !2097)
!2157 = !DILocation(line: 92, column: 31, scope: !2158)
!2158 = distinct !DILexicalBlock(scope: !2097, file: !68, line: 92, column: 13)
!2159 = !DILocation(line: 93, column: 36, scope: !2160)
!2160 = distinct !DILexicalBlock(scope: !2158, file: !68, line: 92, column: 51)
!2161 = !DILocation(line: 93, column: 49, scope: !2160)
!2162 = !DILocation(line: 93, column: 28, scope: !2160)
!2163 = !DILocation(line: 93, column: 78, scope: !2160)
!2164 = !DILocation(line: 93, column: 91, scope: !2160)
!2165 = !DILocation(line: 93, column: 104, scope: !2160)
!2166 = !DILocation(line: 93, column: 83, scope: !2160)
!2167 = !DILocation(line: 93, column: 82, scope: !2160)
!2168 = !DILocation(line: 93, column: 73, scope: !2160)
!2169 = !DILocation(line: 93, column: 17, scope: !2160)
!2170 = !DILocation(line: 93, column: 25, scope: !2160)
!2171 = !DILocation(line: 92, column: 48, scope: !2158)
!2172 = !DILocation(line: 92, column: 13, scope: !2158)
!2173 = distinct !{!2173, !2096, !2174, !300}
!2174 = !DILocation(line: 94, column: 13, scope: !2097)
!2175 = !DILocation(line: 65, column: 42, scope: !2060)
!2176 = !DILocation(line: 65, column: 9, scope: !2060)
!2177 = distinct !{!2177, !2051, !2178, !300}
!2178 = !DILocation(line: 95, column: 9, scope: !2052)
!2179 = !DILocation(line: 64, column: 44, scope: !2049)
!2180 = !DILocation(line: 64, column: 5, scope: !2049)
!2181 = distinct !{!2181, !2050, !2182, !300}
!2182 = !DILocation(line: 96, column: 5, scope: !2044)
!2183 = !DILocation(line: 99, scope: !2055)
!2184 = !DILocalVariable(name: "i", scope: !2055, file: !68, line: 99, type: !86)
!2185 = !DILocation(line: 0, scope: !2055)
!2186 = !DILocation(line: 99, column: 23, scope: !2187)
!2187 = distinct !DILexicalBlock(scope: !2055, file: !68, line: 99, column: 5)
!2188 = !DILocation(line: 105, column: 18, scope: !2189)
!2189 = distinct !DILexicalBlock(scope: !2187, file: !68, line: 100, column: 5)
!2190 = !DILocation(line: 105, column: 40, scope: !2189)
!2191 = !DILocation(line: 105, column: 28, scope: !2189)
!2192 = !DILocation(line: 105, column: 44, scope: !2189)
!2193 = !DILocation(line: 105, column: 25, scope: !2189)
!2194 = !DILocation(line: 105, column: 9, scope: !2189)
!2195 = !DILocation(line: 105, column: 16, scope: !2189)
!2196 = !DILocation(line: 106, column: 21, scope: !2189)
!2197 = !DILocation(line: 106, column: 18, scope: !2189)
!2198 = !DILocation(line: 106, column: 40, scope: !2189)
!2199 = !DILocation(line: 106, column: 28, scope: !2189)
!2200 = !DILocation(line: 106, column: 44, scope: !2189)
!2201 = !DILocation(line: 106, column: 25, scope: !2189)
!2202 = !DILocation(line: 106, column: 12, scope: !2189)
!2203 = !DILocation(line: 106, column: 9, scope: !2189)
!2204 = !DILocation(line: 106, column: 16, scope: !2189)
!2205 = !DILocation(line: 99, column: 38, scope: !2187)
!2206 = !DILocation(line: 99, column: 5, scope: !2187)
!2207 = distinct !{!2207, !2054, !2208, !300}
!2208 = !DILocation(line: 108, column: 5, scope: !2055)
!2209 = !DILocation(line: 109, column: 1, scope: !2010)
!2210 = distinct !DISubprogram(name: "pqmayo_MAYO_1_ref_mayo_sign", scope: !68, file: !68, line: 502, type: !339, scopeLine: 504, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2211 = !DILocalVariable(name: "p", arg: 1, scope: !2210, file: !68, line: 502, type: !193)
!2212 = !DILocation(line: 0, scope: !2210)
!2213 = !DILocalVariable(name: "sm", arg: 2, scope: !2210, file: !68, line: 502, type: !61)
!2214 = !DILocalVariable(name: "smlen", arg: 3, scope: !2210, file: !68, line: 503, type: !341)
!2215 = !DILocalVariable(name: "m", arg: 4, scope: !2210, file: !68, line: 503, type: !90)
!2216 = !DILocalVariable(name: "mlen", arg: 5, scope: !2210, file: !68, line: 504, type: !58)
!2217 = !DILocalVariable(name: "csk", arg: 6, scope: !2210, file: !68, line: 504, type: !90)
!2218 = !DILocalVariable(name: "ret", scope: !2210, file: !68, line: 505, type: !86)
!2219 = !DILocalVariable(name: "param_sig_bytes", scope: !2210, file: !68, line: 506, type: !275)
!2220 = !DILocation(line: 508, column: 16, scope: !2210)
!2221 = !DILocation(line: 508, column: 5, scope: !2210)
!2222 = !DILocation(line: 509, column: 50, scope: !2210)
!2223 = !DILocalVariable(name: "siglen", scope: !2210, file: !68, line: 507, type: !58)
!2224 = !DILocation(line: 509, column: 11, scope: !2210)
!2225 = !DILocation(line: 510, column: 13, scope: !2226)
!2226 = distinct !DILexicalBlock(scope: !2210, file: !68, line: 510, column: 9)
!2227 = !DILocation(line: 510, column: 24, scope: !2226)
!2228 = !DILocation(line: 511, column: 23, scope: !2229)
!2229 = distinct !DILexicalBlock(scope: !2226, file: !68, line: 510, column: 62)
!2230 = !DILocation(line: 511, column: 30, scope: !2229)
!2231 = !DILocation(line: 511, column: 9, scope: !2229)
!2232 = !DILocation(line: 512, column: 9, scope: !2229)
!2233 = !DILocation(line: 515, column: 14, scope: !2210)
!2234 = !DILocation(line: 515, column: 21, scope: !2210)
!2235 = !DILocation(line: 515, column: 12, scope: !2210)
!2236 = !DILocation(line: 515, column: 5, scope: !2210)
!2237 = !DILabel(scope: !2210, name: "err", file: !68, line: 516)
!2238 = !DILocation(line: 516, column: 1, scope: !2210)
!2239 = !DILocation(line: 517, column: 5, scope: !2210)
!2240 = !DILocation(line: 0, scope: !338)
!2241 = !DILocation(line: 524, column: 15, scope: !351)
!2242 = !DILocation(line: 527, column: 36, scope: !338)
!2243 = !DILocation(line: 527, column: 61, scope: !338)
!2244 = !DILocation(line: 527, column: 18, scope: !338)
!2245 = !DILocation(line: 530, column: 16, scope: !357)
!2246 = !DILocation(line: 531, column: 23, scope: !359)
!2247 = !DILocation(line: 531, column: 15, scope: !359)
!2248 = !DILocation(line: 532, column: 23, scope: !359)
!2249 = !DILocation(line: 532, column: 9, scope: !359)
!2250 = !DILocation(line: 533, column: 5, scope: !359)
!2251 = !DILocation(line: 536, column: 1, scope: !338)
!2252 = distinct !DISubprogram(name: "pqmayo_MAYO_1_ref_mayo_verify", scope: !68, file: !68, line: 617, type: !2253, scopeLine: 619, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2253 = !DISubroutineType(types: !2254)
!2254 = !{!86, !193, !90, !58, !90, !90}
!2255 = !DILocalVariable(name: "p", arg: 1, scope: !2252, file: !68, line: 617, type: !193)
!2256 = !DILocation(line: 0, scope: !2252)
!2257 = !DILocalVariable(name: "m", arg: 2, scope: !2252, file: !68, line: 617, type: !90)
!2258 = !DILocalVariable(name: "mlen", arg: 3, scope: !2252, file: !68, line: 618, type: !58)
!2259 = !DILocalVariable(name: "sig", arg: 4, scope: !2252, file: !68, line: 618, type: !90)
!2260 = !DILocalVariable(name: "cpk", arg: 5, scope: !2252, file: !68, line: 619, type: !90)
!2261 = !DILocalVariable(name: "tEnc", scope: !2252, file: !68, line: 620, type: !881)
!2262 = !DILocation(line: 620, column: 19, scope: !2252)
!2263 = !DILocalVariable(name: "t", scope: !2252, file: !68, line: 621, type: !884)
!2264 = !DILocation(line: 621, column: 19, scope: !2252)
!2265 = !DILocalVariable(name: "y", scope: !2252, file: !68, line: 622, type: !2266)
!2266 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 1248, elements: !2267)
!2267 = !{!2268}
!2268 = !DISubrange(count: 156)
!2269 = !DILocation(line: 622, column: 19, scope: !2252)
!2270 = !DILocalVariable(name: "s", scope: !2252, file: !68, line: 623, type: !911)
!2271 = !DILocation(line: 623, column: 19, scope: !2252)
!2272 = !DILocalVariable(name: "pk", scope: !2252, file: !68, line: 624, type: !2273)
!2273 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 1197120, elements: !2274)
!2274 = !{!2275}
!2275 = !DISubrange(count: 18705)
!2276 = !DILocation(line: 624, column: 14, scope: !2252)
!2277 = !DILocalVariable(name: "tmp", scope: !2252, file: !68, line: 625, type: !2278)
!2278 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 448, elements: !2279)
!2279 = !{!2280}
!2280 = !DISubrange(count: 56)
!2281 = !DILocation(line: 625, column: 19, scope: !2252)
!2282 = !DILocalVariable(name: "param_m", scope: !2252, file: !68, line: 627, type: !275)
!2283 = !DILocalVariable(name: "param_n", scope: !2252, file: !68, line: 628, type: !275)
!2284 = !DILocalVariable(name: "param_k", scope: !2252, file: !68, line: 629, type: !275)
!2285 = !DILocalVariable(name: "param_m_bytes", scope: !2252, file: !68, line: 630, type: !275)
!2286 = !DILocalVariable(name: "param_sig_bytes", scope: !2252, file: !68, line: 631, type: !275)
!2287 = !DILocalVariable(name: "param_digest_bytes", scope: !2252, file: !68, line: 632, type: !275)
!2288 = !DILocalVariable(name: "param_salt_bytes", scope: !2252, file: !68, line: 633, type: !275)
!2289 = !DILocation(line: 0, scope: !248, inlinedAt: !2290)
!2290 = distinct !DILocation(line: 635, column: 15, scope: !2252)
!2291 = !DILocation(line: 0, scope: !256, inlinedAt: !2292)
!2292 = distinct !DILocation(line: 610, column: 5, scope: !248, inlinedAt: !2290)
!2293 = !DILocation(line: 284, column: 5, scope: !256, inlinedAt: !2292)
!2294 = !DILocation(line: 265, column: 14, scope: !265, inlinedAt: !2295)
!2295 = distinct !DILocation(line: 285, column: 5, scope: !256, inlinedAt: !2292)
!2296 = !DILocation(line: 0, scope: !265, inlinedAt: !2295)
!2297 = !DILocation(line: 0, scope: !282, inlinedAt: !2295)
!2298 = !DILocation(line: 266, column: 10, scope: !282, inlinedAt: !2295)
!2299 = !DILocation(line: 266, column: 28, scope: !286, inlinedAt: !2295)
!2300 = !DILocation(line: 266, column: 5, scope: !282, inlinedAt: !2295)
!2301 = !DILocation(line: 266, scope: !282, inlinedAt: !2295)
!2302 = !DILocation(line: 268, column: 27, scope: !290, inlinedAt: !2295)
!2303 = !DILocation(line: 268, column: 29, scope: !290, inlinedAt: !2295)
!2304 = !DILocation(line: 268, column: 24, scope: !290, inlinedAt: !2295)
!2305 = !DILocation(line: 268, column: 9, scope: !290, inlinedAt: !2295)
!2306 = !DILocation(line: 269, column: 36, scope: !290, inlinedAt: !2295)
!2307 = !DILocation(line: 269, column: 21, scope: !290, inlinedAt: !2295)
!2308 = !DILocation(line: 269, column: 9, scope: !290, inlinedAt: !2295)
!2309 = !DILocation(line: 266, column: 5, scope: !286, inlinedAt: !2295)
!2310 = distinct !{!2310, !2300, !2311, !300}
!2311 = !DILocation(line: 270, column: 5, scope: !282, inlinedAt: !2295)
!2312 = !DILocation(line: 271, column: 1, scope: !265, inlinedAt: !2295)
!2313 = !DILocation(line: 612, column: 23, scope: !248, inlinedAt: !2290)
!2314 = !DILocation(line: 612, column: 72, scope: !248, inlinedAt: !2290)
!2315 = !DILocation(line: 265, column: 14, scope: !265, inlinedAt: !2316)
!2316 = distinct !DILocation(line: 612, column: 5, scope: !248, inlinedAt: !2290)
!2317 = !DILocation(line: 0, scope: !265, inlinedAt: !2316)
!2318 = !DILocation(line: 0, scope: !282, inlinedAt: !2316)
!2319 = !DILocation(line: 266, column: 10, scope: !282, inlinedAt: !2316)
!2320 = !DILocation(line: 266, column: 28, scope: !286, inlinedAt: !2316)
!2321 = !DILocation(line: 266, column: 5, scope: !282, inlinedAt: !2316)
!2322 = !DILocation(line: 266, scope: !282, inlinedAt: !2316)
!2323 = !DILocation(line: 268, column: 27, scope: !290, inlinedAt: !2316)
!2324 = !DILocation(line: 268, column: 29, scope: !290, inlinedAt: !2316)
!2325 = !DILocation(line: 268, column: 24, scope: !290, inlinedAt: !2316)
!2326 = !DILocation(line: 268, column: 9, scope: !290, inlinedAt: !2316)
!2327 = !DILocation(line: 269, column: 36, scope: !290, inlinedAt: !2316)
!2328 = !DILocation(line: 269, column: 21, scope: !290, inlinedAt: !2316)
!2329 = !DILocation(line: 269, column: 9, scope: !290, inlinedAt: !2316)
!2330 = !DILocation(line: 266, column: 5, scope: !286, inlinedAt: !2316)
!2331 = distinct !{!2331, !2321, !2332, !300}
!2332 = !DILocation(line: 270, column: 5, scope: !282, inlinedAt: !2316)
!2333 = !DILocation(line: 271, column: 1, scope: !265, inlinedAt: !2316)
!2334 = !DILocalVariable(name: "ret", scope: !2252, file: !68, line: 635, type: !86)
!2335 = !DILocalVariable(name: "P1", scope: !2252, file: !68, line: 640, type: !52)
!2336 = !DILocation(line: 641, column: 23, scope: !2252)
!2337 = !DILocalVariable(name: "P2", scope: !2252, file: !68, line: 641, type: !52)
!2338 = !DILocalVariable(name: "P3", scope: !2252, file: !68, line: 642, type: !52)
!2339 = !DILocation(line: 657, column: 5, scope: !2252)
!2340 = !DILocation(line: 660, column: 16, scope: !2252)
!2341 = !DILocation(line: 660, column: 60, scope: !2252)
!2342 = !DILocation(line: 660, column: 5, scope: !2252)
!2343 = !DILocation(line: 662, column: 5, scope: !2252)
!2344 = !DILocation(line: 0, scope: !435, inlinedAt: !2345)
!2345 = distinct !DILocation(line: 663, column: 5, scope: !2252)
!2346 = !DILocation(line: 22, column: 10, scope: !444, inlinedAt: !2345)
!2347 = !DILocation(line: 22, scope: !444, inlinedAt: !2345)
!2348 = !DILocation(line: 22, column: 19, scope: !447, inlinedAt: !2345)
!2349 = !DILocation(line: 22, column: 5, scope: !444, inlinedAt: !2345)
!2350 = !DILocation(line: 22, column: 5, scope: !444, inlinedAt: !2351)
!2351 = distinct !DILocation(line: 666, column: 5, scope: !2252)
!2352 = !DILocation(line: 23, column: 19, scope: !450, inlinedAt: !2345)
!2353 = !DILocation(line: 23, column: 24, scope: !450, inlinedAt: !2345)
!2354 = !DILocation(line: 23, column: 14, scope: !450, inlinedAt: !2345)
!2355 = !DILocation(line: 23, column: 17, scope: !450, inlinedAt: !2345)
!2356 = !DILocation(line: 24, column: 24, scope: !450, inlinedAt: !2345)
!2357 = !DILocation(line: 24, column: 17, scope: !450, inlinedAt: !2345)
!2358 = !DILocation(line: 24, column: 14, scope: !450, inlinedAt: !2345)
!2359 = !DILocation(line: 22, column: 34, scope: !447, inlinedAt: !2345)
!2360 = !DILocation(line: 22, column: 5, scope: !447, inlinedAt: !2345)
!2361 = distinct !{!2361, !2349, !2362, !300}
!2362 = !DILocation(line: 25, column: 5, scope: !444, inlinedAt: !2345)
!2363 = !DILocation(line: 22, scope: !444, inlinedAt: !2351)
!2364 = !DILocation(line: 0, scope: !435, inlinedAt: !2351)
!2365 = !DILocation(line: 22, column: 19, scope: !447, inlinedAt: !2351)
!2366 = !DILocation(line: 23, column: 19, scope: !450, inlinedAt: !2351)
!2367 = !DILocation(line: 23, column: 24, scope: !450, inlinedAt: !2351)
!2368 = !DILocation(line: 23, column: 14, scope: !450, inlinedAt: !2351)
!2369 = !DILocation(line: 23, column: 17, scope: !450, inlinedAt: !2351)
!2370 = !DILocation(line: 24, column: 24, scope: !450, inlinedAt: !2351)
!2371 = !DILocation(line: 24, column: 17, scope: !450, inlinedAt: !2351)
!2372 = !DILocation(line: 24, column: 14, scope: !450, inlinedAt: !2351)
!2373 = !DILocation(line: 22, column: 34, scope: !447, inlinedAt: !2351)
!2374 = !DILocation(line: 22, column: 5, scope: !447, inlinedAt: !2351)
!2375 = distinct !{!2375, !2350, !2376, !300}
!2376 = !DILocation(line: 25, column: 5, scope: !444, inlinedAt: !2351)
!2377 = !DILocation(line: 289, column: 14, scope: !2378, inlinedAt: !2381)
!2378 = distinct !DISubprogram(name: "eval_public_map", scope: !68, file: !68, line: 288, type: !2379, scopeLine: 288, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2379 = !DISubroutineType(types: !2380)
!2380 = !{null, !193, !90, !488, !488, !488, !61}
!2381 = distinct !DILocation(line: 668, column: 5, scope: !2252)
!2382 = !DILocalVariable(name: "p", arg: 1, scope: !2378, file: !68, line: 288, type: !193)
!2383 = !DILocation(line: 0, scope: !2378, inlinedAt: !2381)
!2384 = !DILocalVariable(name: "s", arg: 2, scope: !2378, file: !68, line: 288, type: !90)
!2385 = !DILocalVariable(name: "P1", arg: 3, scope: !2378, file: !68, line: 288, type: !488)
!2386 = !DILocalVariable(name: "P2", arg: 4, scope: !2378, file: !68, line: 288, type: !488)
!2387 = !DILocalVariable(name: "P3", arg: 5, scope: !2378, file: !68, line: 288, type: !488)
!2388 = !DILocalVariable(name: "eval", arg: 6, scope: !2378, file: !68, line: 288, type: !61)
!2389 = !DILocalVariable(name: "SPS", scope: !2378, file: !68, line: 289, type: !2390)
!2390 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 32000, elements: !2391)
!2391 = !{!2392}
!2392 = !DISubrange(count: 500)
!2393 = !DILocation(line: 286, column: 14, scope: !2394, inlinedAt: !2397)
!2394 = distinct !DISubprogram(name: "m_calculate_PS_SPS", scope: !485, file: !485, line: 277, type: !2395, scopeLine: 278, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2395 = !DISubroutineType(types: !2396)
!2396 = !{null, !193, !488, !488, !488, !90, !52}
!2397 = distinct !DILocation(line: 291, column: 5, scope: !2378, inlinedAt: !2381)
!2398 = !DILocalVariable(name: "p", arg: 1, scope: !2394, file: !485, line: 277, type: !193)
!2399 = !DILocation(line: 0, scope: !2394, inlinedAt: !2397)
!2400 = !DILocalVariable(name: "P1", arg: 2, scope: !2394, file: !485, line: 277, type: !488)
!2401 = !DILocalVariable(name: "P2", arg: 3, scope: !2394, file: !485, line: 277, type: !488)
!2402 = !DILocalVariable(name: "P3", arg: 4, scope: !2394, file: !485, line: 277, type: !488)
!2403 = !DILocalVariable(name: "s", arg: 5, scope: !2394, file: !485, line: 277, type: !90)
!2404 = !DILocalVariable(name: "SPS", arg: 6, scope: !2394, file: !485, line: 278, type: !52)
!2405 = !DILocalVariable(name: "PS", scope: !2394, file: !485, line: 286, type: !2406)
!2406 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 275200, elements: !2407)
!2407 = !{!2408}
!2408 = !DISubrange(count: 4300)
!2409 = !DILocation(line: 157, column: 14, scope: !2410, inlinedAt: !2413)
!2410 = distinct !DISubprogram(name: "mayo_generic_m_calculate_PS", scope: !485, file: !485, line: 151, type: !2411, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2411 = !DISubroutineType(types: !2412)
!2412 = !{null, !488, !488, !488, !90, !275, !275, !275, !275, !52}
!2413 = distinct !DILocation(line: 287, column: 5, scope: !2394, inlinedAt: !2397)
!2414 = !DILocalVariable(name: "P1", arg: 1, scope: !2410, file: !485, line: 151, type: !488)
!2415 = !DILocation(line: 0, scope: !2410, inlinedAt: !2413)
!2416 = !DILocalVariable(name: "P2", arg: 2, scope: !2410, file: !485, line: 151, type: !488)
!2417 = !DILocalVariable(name: "P3", arg: 3, scope: !2410, file: !485, line: 151, type: !488)
!2418 = !DILocalVariable(name: "S", arg: 4, scope: !2410, file: !485, line: 151, type: !90)
!2419 = !DILocalVariable(name: "m", arg: 5, scope: !2410, file: !485, line: 152, type: !275)
!2420 = !DILocalVariable(name: "v", arg: 6, scope: !2410, file: !485, line: 152, type: !275)
!2421 = !DILocalVariable(name: "o", arg: 7, scope: !2410, file: !485, line: 152, type: !275)
!2422 = !DILocalVariable(name: "k", arg: 8, scope: !2410, file: !485, line: 152, type: !275)
!2423 = !DILocalVariable(name: "PS", arg: 9, scope: !2410, file: !485, line: 152, type: !52)
!2424 = !DILocalVariable(name: "n", scope: !2410, file: !485, line: 154, type: !275)
!2425 = !DILocalVariable(name: "m_vec_limbs", scope: !2410, file: !485, line: 155, type: !275)
!2426 = !DILocalVariable(name: "accumulator", scope: !2410, file: !485, line: 157, type: !2427)
!2427 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 4403200, elements: !2428)
!2428 = !{!2429}
!2429 = !DISubrange(count: 68800)
!2430 = !DILocalVariable(name: "P1_used", scope: !2410, file: !485, line: 158, type: !86)
!2431 = !DILocalVariable(name: "row", scope: !2432, file: !485, line: 159, type: !86)
!2432 = distinct !DILexicalBlock(scope: !2410, file: !485, line: 159, column: 5)
!2433 = !DILocation(line: 0, scope: !2432, inlinedAt: !2413)
!2434 = !DILocation(line: 159, column: 10, scope: !2432, inlinedAt: !2413)
!2435 = !DILocation(line: 158, column: 9, scope: !2410, inlinedAt: !2413)
!2436 = !DILocation(line: 159, scope: !2432, inlinedAt: !2413)
!2437 = !DILocation(line: 159, column: 27, scope: !2438, inlinedAt: !2413)
!2438 = distinct !DILexicalBlock(scope: !2432, file: !485, line: 159, column: 5)
!2439 = !DILocation(line: 159, column: 5, scope: !2432, inlinedAt: !2413)
!2440 = !DILocation(line: 160, column: 9, scope: !2441, inlinedAt: !2413)
!2441 = distinct !DILexicalBlock(scope: !2442, file: !485, line: 160, column: 9)
!2442 = distinct !DILexicalBlock(scope: !2438, file: !485, line: 159, column: 39)
!2443 = !DILocation(line: 642, column: 23, scope: !2252)
!2444 = !DILocation(line: 175, column: 5, scope: !2445, inlinedAt: !2413)
!2445 = distinct !DILexicalBlock(scope: !2410, file: !485, line: 175, column: 5)
!2446 = !DILocation(line: 160, scope: !2441, inlinedAt: !2413)
!2447 = !DILocalVariable(name: "j", scope: !2441, file: !485, line: 160, type: !86)
!2448 = !DILocation(line: 0, scope: !2441, inlinedAt: !2413)
!2449 = !DILocation(line: 160, column: 29, scope: !2450, inlinedAt: !2413)
!2450 = distinct !DILexicalBlock(scope: !2441, file: !485, line: 160, column: 9)
!2451 = !DILocation(line: 167, column: 9, scope: !2452, inlinedAt: !2413)
!2452 = distinct !DILexicalBlock(scope: !2442, file: !485, line: 167, column: 9)
!2453 = !DILocation(line: 161, column: 13, scope: !2454, inlinedAt: !2413)
!2454 = distinct !DILexicalBlock(scope: !2455, file: !485, line: 161, column: 13)
!2455 = distinct !DILexicalBlock(scope: !2450, file: !485, line: 160, column: 39)
!2456 = !DILocation(line: 161, scope: !2454, inlinedAt: !2413)
!2457 = !DILocalVariable(name: "col", scope: !2454, file: !485, line: 161, type: !86)
!2458 = !DILocation(line: 0, scope: !2454, inlinedAt: !2413)
!2459 = !DILocation(line: 161, column: 35, scope: !2460, inlinedAt: !2413)
!2460 = distinct !DILexicalBlock(scope: !2454, file: !485, line: 161, column: 13)
!2461 = !DILocation(line: 162, column: 43, scope: !2462, inlinedAt: !2413)
!2462 = distinct !DILexicalBlock(scope: !2460, file: !485, line: 161, column: 47)
!2463 = !DILocation(line: 162, column: 91, scope: !2462, inlinedAt: !2413)
!2464 = !DILocation(line: 162, column: 95, scope: !2462, inlinedAt: !2413)
!2465 = !DILocation(line: 162, column: 102, scope: !2462, inlinedAt: !2413)
!2466 = !DILocation(line: 162, column: 115, scope: !2462, inlinedAt: !2413)
!2467 = !DILocation(line: 162, column: 109, scope: !2462, inlinedAt: !2413)
!2468 = !DILocation(line: 162, column: 107, scope: !2462, inlinedAt: !2413)
!2469 = !DILocation(line: 162, column: 82, scope: !2462, inlinedAt: !2413)
!2470 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2471, file: !660, line: 22, type: !86)
!2471 = distinct !DISubprogram(name: "m_vec_add", scope: !660, file: !660, line: 22, type: !2472, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2472 = !DISubroutineType(types: !2473)
!2473 = !{null, !86, !488, !52}
!2474 = !DILocation(line: 0, scope: !2471, inlinedAt: !2475)
!2475 = distinct !DILocation(line: 162, column: 17, scope: !2462, inlinedAt: !2413)
!2476 = !DILocalVariable(name: "in", arg: 2, scope: !2471, file: !660, line: 22, type: !488)
!2477 = !DILocalVariable(name: "acc", arg: 3, scope: !2471, file: !660, line: 22, type: !52)
!2478 = !DILocalVariable(name: "i", scope: !2479, file: !660, line: 24, type: !58)
!2479 = distinct !DILexicalBlock(scope: !2471, file: !660, line: 24, column: 5)
!2480 = !DILocation(line: 0, scope: !2479, inlinedAt: !2475)
!2481 = !DILocation(line: 24, column: 10, scope: !2479, inlinedAt: !2475)
!2482 = !DILocation(line: 24, scope: !2479, inlinedAt: !2475)
!2483 = !DILocation(line: 24, column: 26, scope: !2484, inlinedAt: !2475)
!2484 = distinct !DILexicalBlock(scope: !2479, file: !660, line: 24, column: 5)
!2485 = !DILocation(line: 24, column: 5, scope: !2479, inlinedAt: !2475)
!2486 = !DILocation(line: 26, column: 19, scope: !2487, inlinedAt: !2475)
!2487 = distinct !DILexicalBlock(scope: !2484, file: !660, line: 25, column: 5)
!2488 = !DILocation(line: 26, column: 9, scope: !2487, inlinedAt: !2475)
!2489 = !DILocation(line: 26, column: 16, scope: !2487, inlinedAt: !2475)
!2490 = !DILocation(line: 24, column: 46, scope: !2484, inlinedAt: !2475)
!2491 = !DILocation(line: 24, column: 5, scope: !2484, inlinedAt: !2475)
!2492 = distinct !{!2492, !2485, !2493, !300}
!2493 = !DILocation(line: 27, column: 5, scope: !2479, inlinedAt: !2475)
!2494 = !DILocation(line: 161, column: 43, scope: !2460, inlinedAt: !2413)
!2495 = !DILocation(line: 161, column: 13, scope: !2460, inlinedAt: !2413)
!2496 = distinct !{!2496, !2453, !2497, !300}
!2497 = !DILocation(line: 163, column: 13, scope: !2454, inlinedAt: !2413)
!2498 = !DILocation(line: 164, column: 21, scope: !2455, inlinedAt: !2413)
!2499 = !DILocation(line: 160, column: 35, scope: !2450, inlinedAt: !2413)
!2500 = !DILocation(line: 160, column: 9, scope: !2450, inlinedAt: !2413)
!2501 = distinct !{!2501, !2440, !2502, !300}
!2502 = !DILocation(line: 165, column: 9, scope: !2441, inlinedAt: !2413)
!2503 = !DILocation(line: 167, scope: !2452, inlinedAt: !2413)
!2504 = !DILocalVariable(name: "j", scope: !2452, file: !485, line: 167, type: !86)
!2505 = !DILocation(line: 0, scope: !2452, inlinedAt: !2413)
!2506 = !DILocation(line: 167, column: 27, scope: !2507, inlinedAt: !2413)
!2507 = distinct !DILexicalBlock(scope: !2452, file: !485, line: 167, column: 9)
!2508 = !DILocation(line: 168, column: 13, scope: !2509, inlinedAt: !2413)
!2509 = distinct !DILexicalBlock(scope: !2510, file: !485, line: 168, column: 13)
!2510 = distinct !DILexicalBlock(scope: !2507, file: !485, line: 167, column: 37)
!2511 = !DILocation(line: 168, scope: !2509, inlinedAt: !2413)
!2512 = !DILocalVariable(name: "col", scope: !2509, file: !485, line: 168, type: !86)
!2513 = !DILocation(line: 0, scope: !2509, inlinedAt: !2413)
!2514 = !DILocation(line: 168, column: 35, scope: !2515, inlinedAt: !2413)
!2515 = distinct !DILexicalBlock(scope: !2509, file: !485, line: 168, column: 13)
!2516 = !DILocation(line: 169, column: 50, scope: !2517, inlinedAt: !2413)
!2517 = distinct !DILexicalBlock(scope: !2515, file: !485, line: 168, column: 47)
!2518 = !DILocation(line: 169, column: 54, scope: !2517, inlinedAt: !2413)
!2519 = !DILocation(line: 169, column: 43, scope: !2517, inlinedAt: !2413)
!2520 = !DILocation(line: 169, column: 93, scope: !2517, inlinedAt: !2413)
!2521 = !DILocation(line: 169, column: 97, scope: !2517, inlinedAt: !2413)
!2522 = !DILocation(line: 169, column: 104, scope: !2517, inlinedAt: !2413)
!2523 = !DILocation(line: 169, column: 118, scope: !2517, inlinedAt: !2413)
!2524 = !DILocation(line: 169, column: 111, scope: !2517, inlinedAt: !2413)
!2525 = !DILocation(line: 169, column: 109, scope: !2517, inlinedAt: !2413)
!2526 = !DILocation(line: 169, column: 84, scope: !2517, inlinedAt: !2413)
!2527 = !DILocation(line: 0, scope: !2471, inlinedAt: !2528)
!2528 = distinct !DILocation(line: 169, column: 17, scope: !2517, inlinedAt: !2413)
!2529 = !DILocation(line: 0, scope: !2479, inlinedAt: !2528)
!2530 = !DILocation(line: 24, column: 10, scope: !2479, inlinedAt: !2528)
!2531 = !DILocation(line: 24, scope: !2479, inlinedAt: !2528)
!2532 = !DILocation(line: 24, column: 26, scope: !2484, inlinedAt: !2528)
!2533 = !DILocation(line: 24, column: 5, scope: !2479, inlinedAt: !2528)
!2534 = !DILocation(line: 26, column: 19, scope: !2487, inlinedAt: !2528)
!2535 = !DILocation(line: 26, column: 9, scope: !2487, inlinedAt: !2528)
!2536 = !DILocation(line: 26, column: 16, scope: !2487, inlinedAt: !2528)
!2537 = !DILocation(line: 24, column: 46, scope: !2484, inlinedAt: !2528)
!2538 = !DILocation(line: 24, column: 5, scope: !2484, inlinedAt: !2528)
!2539 = distinct !{!2539, !2533, !2540, !300}
!2540 = !DILocation(line: 27, column: 5, scope: !2479, inlinedAt: !2528)
!2541 = !DILocation(line: 168, column: 43, scope: !2515, inlinedAt: !2413)
!2542 = !DILocation(line: 168, column: 13, scope: !2515, inlinedAt: !2413)
!2543 = distinct !{!2543, !2508, !2544, !300}
!2544 = !DILocation(line: 170, column: 13, scope: !2509, inlinedAt: !2413)
!2545 = !DILocation(line: 167, column: 33, scope: !2507, inlinedAt: !2413)
!2546 = !DILocation(line: 167, column: 9, scope: !2507, inlinedAt: !2413)
!2547 = distinct !{!2547, !2451, !2548, !300}
!2548 = !DILocation(line: 171, column: 9, scope: !2452, inlinedAt: !2413)
!2549 = !DILocation(line: 159, column: 35, scope: !2438, inlinedAt: !2413)
!2550 = !DILocation(line: 159, column: 5, scope: !2438, inlinedAt: !2413)
!2551 = distinct !{!2551, !2439, !2552, !300}
!2552 = !DILocation(line: 172, column: 5, scope: !2432, inlinedAt: !2413)
!2553 = !DILocation(line: 174, column: 9, scope: !2410, inlinedAt: !2413)
!2554 = !DILocation(line: 175, scope: !2445, inlinedAt: !2413)
!2555 = !DILocalVariable(name: "row", scope: !2445, file: !485, line: 175, type: !86)
!2556 = !DILocation(line: 0, scope: !2445, inlinedAt: !2413)
!2557 = !DILocalVariable(name: "P3_used", scope: !2410, file: !485, line: 174, type: !86)
!2558 = !DILocation(line: 175, column: 27, scope: !2559, inlinedAt: !2413)
!2559 = distinct !DILexicalBlock(scope: !2445, file: !485, line: 175, column: 5)
!2560 = !DILocation(line: 176, column: 9, scope: !2561, inlinedAt: !2413)
!2561 = distinct !DILexicalBlock(scope: !2562, file: !485, line: 176, column: 9)
!2562 = distinct !DILexicalBlock(scope: !2559, file: !485, line: 175, column: 39)
!2563 = !DILocation(line: 186, column: 5, scope: !2410, inlinedAt: !2413)
!2564 = !DILocation(line: 176, scope: !2561, inlinedAt: !2413)
!2565 = !DILocalVariable(name: "j", scope: !2561, file: !485, line: 176, type: !86)
!2566 = !DILocation(line: 0, scope: !2561, inlinedAt: !2413)
!2567 = !DILocation(line: 176, column: 29, scope: !2568, inlinedAt: !2413)
!2568 = distinct !DILexicalBlock(scope: !2561, file: !485, line: 176, column: 9)
!2569 = !DILocation(line: 177, column: 13, scope: !2570, inlinedAt: !2413)
!2570 = distinct !DILexicalBlock(scope: !2571, file: !485, line: 177, column: 13)
!2571 = distinct !DILexicalBlock(scope: !2568, file: !485, line: 176, column: 39)
!2572 = !DILocation(line: 177, scope: !2570, inlinedAt: !2413)
!2573 = !DILocalVariable(name: "col", scope: !2570, file: !485, line: 177, type: !86)
!2574 = !DILocation(line: 0, scope: !2570, inlinedAt: !2413)
!2575 = !DILocation(line: 177, column: 35, scope: !2576, inlinedAt: !2413)
!2576 = distinct !DILexicalBlock(scope: !2570, file: !485, line: 177, column: 13)
!2577 = !DILocation(line: 178, column: 43, scope: !2578, inlinedAt: !2413)
!2578 = distinct !DILexicalBlock(scope: !2576, file: !485, line: 177, column: 47)
!2579 = !DILocation(line: 178, column: 89, scope: !2578, inlinedAt: !2413)
!2580 = !DILocation(line: 178, column: 93, scope: !2578, inlinedAt: !2413)
!2581 = !DILocation(line: 178, column: 100, scope: !2578, inlinedAt: !2413)
!2582 = !DILocation(line: 178, column: 113, scope: !2578, inlinedAt: !2413)
!2583 = !DILocation(line: 178, column: 107, scope: !2578, inlinedAt: !2413)
!2584 = !DILocation(line: 178, column: 105, scope: !2578, inlinedAt: !2413)
!2585 = !DILocation(line: 178, column: 80, scope: !2578, inlinedAt: !2413)
!2586 = !DILocation(line: 0, scope: !2471, inlinedAt: !2587)
!2587 = distinct !DILocation(line: 178, column: 17, scope: !2578, inlinedAt: !2413)
!2588 = !DILocation(line: 0, scope: !2479, inlinedAt: !2587)
!2589 = !DILocation(line: 24, column: 10, scope: !2479, inlinedAt: !2587)
!2590 = !DILocation(line: 24, scope: !2479, inlinedAt: !2587)
!2591 = !DILocation(line: 24, column: 26, scope: !2484, inlinedAt: !2587)
!2592 = !DILocation(line: 24, column: 5, scope: !2479, inlinedAt: !2587)
!2593 = !DILocation(line: 26, column: 19, scope: !2487, inlinedAt: !2587)
!2594 = !DILocation(line: 26, column: 9, scope: !2487, inlinedAt: !2587)
!2595 = !DILocation(line: 26, column: 16, scope: !2487, inlinedAt: !2587)
!2596 = !DILocation(line: 24, column: 46, scope: !2484, inlinedAt: !2587)
!2597 = !DILocation(line: 24, column: 5, scope: !2484, inlinedAt: !2587)
!2598 = distinct !{!2598, !2592, !2599, !300}
!2599 = !DILocation(line: 27, column: 5, scope: !2479, inlinedAt: !2587)
!2600 = !DILocation(line: 177, column: 43, scope: !2576, inlinedAt: !2413)
!2601 = !DILocation(line: 177, column: 13, scope: !2576, inlinedAt: !2413)
!2602 = distinct !{!2602, !2569, !2603, !300}
!2603 = !DILocation(line: 179, column: 13, scope: !2570, inlinedAt: !2413)
!2604 = !DILocation(line: 180, column: 21, scope: !2571, inlinedAt: !2413)
!2605 = !DILocation(line: 176, column: 35, scope: !2568, inlinedAt: !2413)
!2606 = !DILocation(line: 176, column: 9, scope: !2568, inlinedAt: !2413)
!2607 = distinct !{!2607, !2560, !2608, !300}
!2608 = !DILocation(line: 181, column: 9, scope: !2561, inlinedAt: !2413)
!2609 = !DILocation(line: 175, column: 35, scope: !2559, inlinedAt: !2413)
!2610 = !DILocation(line: 175, column: 5, scope: !2559, inlinedAt: !2413)
!2611 = distinct !{!2611, !2444, !2612, !300}
!2612 = !DILocation(line: 182, column: 5, scope: !2445, inlinedAt: !2413)
!2613 = !DILocalVariable(name: "i", scope: !2410, file: !485, line: 185, type: !86)
!2614 = !DILocation(line: 186, column: 14, scope: !2410, inlinedAt: !2413)
!2615 = !DILocation(line: 187, column: 54, scope: !2616, inlinedAt: !2413)
!2616 = distinct !DILexicalBlock(scope: !2410, file: !485, line: 186, column: 23)
!2617 = !DILocation(line: 187, column: 81, scope: !2616, inlinedAt: !2413)
!2618 = !DILocation(line: 187, column: 9, scope: !2616, inlinedAt: !2413)
!2619 = !DILocation(line: 188, column: 10, scope: !2616, inlinedAt: !2413)
!2620 = distinct !{!2620, !2563, !2621, !300}
!2621 = !DILocation(line: 189, column: 5, scope: !2410, inlinedAt: !2413)
!2622 = !DILocation(line: 191, column: 1, scope: !2410, inlinedAt: !2413)
!2623 = !DILocation(line: 196, column: 14, scope: !2624, inlinedAt: !2627)
!2624 = distinct !DISubprogram(name: "mayo_generic_m_calculate_SPS", scope: !485, file: !485, line: 195, type: !2625, scopeLine: 195, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2625 = !DISubroutineType(types: !2626)
!2626 = !{null, !488, !90, !86, !86, !86, !52}
!2627 = distinct !DILocation(line: 290, column: 5, scope: !2394, inlinedAt: !2397)
!2628 = !DILocalVariable(name: "PS", arg: 1, scope: !2624, file: !485, line: 195, type: !488)
!2629 = !DILocation(line: 0, scope: !2624, inlinedAt: !2627)
!2630 = !DILocalVariable(name: "S", arg: 2, scope: !2624, file: !485, line: 195, type: !90)
!2631 = !DILocalVariable(name: "m", arg: 3, scope: !2624, file: !485, line: 195, type: !86)
!2632 = !DILocalVariable(name: "k", arg: 4, scope: !2624, file: !485, line: 195, type: !86)
!2633 = !DILocalVariable(name: "n", arg: 5, scope: !2624, file: !485, line: 195, type: !86)
!2634 = !DILocalVariable(name: "SPS", arg: 6, scope: !2624, file: !485, line: 195, type: !52)
!2635 = !DILocalVariable(name: "accumulator", scope: !2624, file: !485, line: 196, type: !2636)
!2636 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 512000, elements: !2637)
!2637 = !{!2638}
!2638 = !DISubrange(count: 8000)
!2639 = !DILocalVariable(name: "m_vec_limbs", scope: !2624, file: !485, line: 197, type: !275)
!2640 = !DILocalVariable(name: "row", scope: !2641, file: !485, line: 198, type: !86)
!2641 = distinct !DILexicalBlock(scope: !2624, file: !485, line: 198, column: 5)
!2642 = !DILocation(line: 0, scope: !2641, inlinedAt: !2627)
!2643 = !DILocation(line: 198, column: 10, scope: !2641, inlinedAt: !2627)
!2644 = !DILocation(line: 198, scope: !2641, inlinedAt: !2627)
!2645 = !DILocation(line: 198, column: 27, scope: !2646, inlinedAt: !2627)
!2646 = distinct !DILexicalBlock(scope: !2641, file: !485, line: 198, column: 5)
!2647 = !DILocation(line: 198, column: 5, scope: !2641, inlinedAt: !2627)
!2648 = !DILocation(line: 199, column: 9, scope: !2649, inlinedAt: !2627)
!2649 = distinct !DILexicalBlock(scope: !2650, file: !485, line: 199, column: 9)
!2650 = distinct !DILexicalBlock(scope: !2646, file: !485, line: 198, column: 39)
!2651 = !DILocation(line: 208, column: 5, scope: !2624, inlinedAt: !2627)
!2652 = !DILocation(line: 199, scope: !2649, inlinedAt: !2627)
!2653 = !DILocalVariable(name: "j", scope: !2649, file: !485, line: 199, type: !86)
!2654 = !DILocation(line: 0, scope: !2649, inlinedAt: !2627)
!2655 = !DILocation(line: 199, column: 27, scope: !2656, inlinedAt: !2627)
!2656 = distinct !DILexicalBlock(scope: !2649, file: !485, line: 199, column: 9)
!2657 = !DILocation(line: 200, column: 13, scope: !2658, inlinedAt: !2627)
!2658 = distinct !DILexicalBlock(scope: !2659, file: !485, line: 200, column: 13)
!2659 = distinct !DILexicalBlock(scope: !2656, file: !485, line: 199, column: 37)
!2660 = !DILocation(line: 200, scope: !2658, inlinedAt: !2627)
!2661 = !DILocalVariable(name: "col", scope: !2658, file: !485, line: 200, type: !86)
!2662 = !DILocation(line: 0, scope: !2658, inlinedAt: !2627)
!2663 = !DILocation(line: 200, column: 35, scope: !2664, inlinedAt: !2627)
!2664 = distinct !DILexicalBlock(scope: !2658, file: !485, line: 200, column: 13)
!2665 = !DILocation(line: 201, column: 52, scope: !2666, inlinedAt: !2627)
!2666 = distinct !DILexicalBlock(scope: !2664, file: !485, line: 200, column: 50)
!2667 = !DILocation(line: 201, column: 56, scope: !2666, inlinedAt: !2627)
!2668 = !DILocation(line: 201, column: 47, scope: !2666, inlinedAt: !2627)
!2669 = !DILocation(line: 201, column: 99, scope: !2666, inlinedAt: !2627)
!2670 = !DILocation(line: 201, column: 103, scope: !2666, inlinedAt: !2627)
!2671 = !DILocation(line: 201, column: 110, scope: !2666, inlinedAt: !2627)
!2672 = !DILocation(line: 201, column: 123, scope: !2666, inlinedAt: !2627)
!2673 = !DILocation(line: 201, column: 117, scope: !2666, inlinedAt: !2627)
!2674 = !DILocation(line: 201, column: 115, scope: !2666, inlinedAt: !2627)
!2675 = !DILocation(line: 201, column: 90, scope: !2666, inlinedAt: !2627)
!2676 = !DILocation(line: 0, scope: !2471, inlinedAt: !2677)
!2677 = distinct !DILocation(line: 201, column: 21, scope: !2666, inlinedAt: !2627)
!2678 = !DILocation(line: 0, scope: !2479, inlinedAt: !2677)
!2679 = !DILocation(line: 24, column: 10, scope: !2479, inlinedAt: !2677)
!2680 = !DILocation(line: 24, scope: !2479, inlinedAt: !2677)
!2681 = !DILocation(line: 24, column: 26, scope: !2484, inlinedAt: !2677)
!2682 = !DILocation(line: 24, column: 5, scope: !2479, inlinedAt: !2677)
!2683 = !DILocation(line: 26, column: 19, scope: !2487, inlinedAt: !2677)
!2684 = !DILocation(line: 26, column: 9, scope: !2487, inlinedAt: !2677)
!2685 = !DILocation(line: 26, column: 16, scope: !2487, inlinedAt: !2677)
!2686 = !DILocation(line: 24, column: 46, scope: !2484, inlinedAt: !2677)
!2687 = !DILocation(line: 24, column: 5, scope: !2484, inlinedAt: !2677)
!2688 = distinct !{!2688, !2682, !2689, !300}
!2689 = !DILocation(line: 27, column: 5, scope: !2479, inlinedAt: !2677)
!2690 = !DILocation(line: 200, column: 44, scope: !2664, inlinedAt: !2627)
!2691 = !DILocation(line: 200, column: 13, scope: !2664, inlinedAt: !2627)
!2692 = distinct !{!2692, !2657, !2693, !300}
!2693 = !DILocation(line: 202, column: 13, scope: !2658, inlinedAt: !2627)
!2694 = !DILocation(line: 199, column: 33, scope: !2656, inlinedAt: !2627)
!2695 = !DILocation(line: 199, column: 9, scope: !2656, inlinedAt: !2627)
!2696 = distinct !{!2696, !2648, !2697, !300}
!2697 = !DILocation(line: 203, column: 9, scope: !2649, inlinedAt: !2627)
!2698 = !DILocation(line: 198, column: 35, scope: !2646, inlinedAt: !2627)
!2699 = !DILocation(line: 198, column: 5, scope: !2646, inlinedAt: !2627)
!2700 = distinct !{!2700, !2647, !2701, !300}
!2701 = !DILocation(line: 204, column: 5, scope: !2641, inlinedAt: !2627)
!2702 = !DILocalVariable(name: "i", scope: !2624, file: !485, line: 207, type: !86)
!2703 = !DILocation(line: 208, column: 14, scope: !2624, inlinedAt: !2627)
!2704 = !DILocation(line: 209, column: 54, scope: !2705, inlinedAt: !2627)
!2705 = distinct !DILexicalBlock(scope: !2624, file: !485, line: 208, column: 21)
!2706 = !DILocation(line: 209, column: 82, scope: !2705, inlinedAt: !2627)
!2707 = !DILocation(line: 209, column: 9, scope: !2705, inlinedAt: !2627)
!2708 = !DILocation(line: 210, column: 10, scope: !2705, inlinedAt: !2627)
!2709 = distinct !{!2709, !2651, !2710, !300}
!2710 = !DILocation(line: 211, column: 5, scope: !2624, inlinedAt: !2627)
!2711 = !DILocation(line: 212, column: 1, scope: !2624, inlinedAt: !2627)
!2712 = !DILocation(line: 292, column: 1, scope: !2394, inlinedAt: !2397)
!2713 = !DILocalVariable(name: "zero", scope: !2378, file: !68, line: 292, type: !884)
!2714 = !DILocation(line: 292, column: 19, scope: !2378, inlinedAt: !2381)
!2715 = !DILocation(line: 293, column: 5, scope: !2378, inlinedAt: !2381)
!2716 = !DILocation(line: 294, column: 1, scope: !2378, inlinedAt: !2381)
!2717 = !DILocation(line: 670, column: 9, scope: !2718)
!2718 = distinct !DILexicalBlock(scope: !2252, file: !68, line: 670, column: 9)
!2719 = !DILocation(line: 670, column: 31, scope: !2718)
!2720 = !DILocation(line: 674, column: 1, scope: !2252)
!2721 = !DILocation(line: 0, scope: !248)
!2722 = !DILocation(line: 0, scope: !256, inlinedAt: !2723)
!2723 = distinct !DILocation(line: 610, column: 5, scope: !248)
!2724 = !DILocation(line: 284, column: 5, scope: !256, inlinedAt: !2723)
!2725 = !DILocation(line: 265, column: 14, scope: !265, inlinedAt: !2726)
!2726 = distinct !DILocation(line: 285, column: 5, scope: !256, inlinedAt: !2723)
!2727 = !DILocation(line: 0, scope: !265, inlinedAt: !2726)
!2728 = !DILocation(line: 0, scope: !282, inlinedAt: !2726)
!2729 = !DILocation(line: 266, column: 10, scope: !282, inlinedAt: !2726)
!2730 = !DILocation(line: 266, column: 28, scope: !286, inlinedAt: !2726)
!2731 = !DILocation(line: 266, column: 5, scope: !282, inlinedAt: !2726)
!2732 = !DILocation(line: 266, scope: !282, inlinedAt: !2726)
!2733 = !DILocation(line: 268, column: 27, scope: !290, inlinedAt: !2726)
!2734 = !DILocation(line: 268, column: 29, scope: !290, inlinedAt: !2726)
!2735 = !DILocation(line: 268, column: 24, scope: !290, inlinedAt: !2726)
!2736 = !DILocation(line: 268, column: 9, scope: !290, inlinedAt: !2726)
!2737 = !DILocation(line: 269, column: 36, scope: !290, inlinedAt: !2726)
!2738 = !DILocation(line: 269, column: 21, scope: !290, inlinedAt: !2726)
!2739 = !DILocation(line: 269, column: 9, scope: !290, inlinedAt: !2726)
!2740 = !DILocation(line: 266, column: 5, scope: !286, inlinedAt: !2726)
!2741 = distinct !{!2741, !2731, !2742, !300}
!2742 = !DILocation(line: 270, column: 5, scope: !282, inlinedAt: !2726)
!2743 = !DILocation(line: 271, column: 1, scope: !265, inlinedAt: !2726)
!2744 = !DILocation(line: 612, column: 23, scope: !248)
!2745 = !DILocation(line: 612, column: 72, scope: !248)
!2746 = !DILocation(line: 265, column: 14, scope: !265, inlinedAt: !2747)
!2747 = distinct !DILocation(line: 612, column: 5, scope: !248)
!2748 = !DILocation(line: 0, scope: !265, inlinedAt: !2747)
!2749 = !DILocation(line: 0, scope: !282, inlinedAt: !2747)
!2750 = !DILocation(line: 266, column: 10, scope: !282, inlinedAt: !2747)
!2751 = !DILocation(line: 266, column: 28, scope: !286, inlinedAt: !2747)
!2752 = !DILocation(line: 266, column: 5, scope: !282, inlinedAt: !2747)
!2753 = !DILocation(line: 266, scope: !282, inlinedAt: !2747)
!2754 = !DILocation(line: 268, column: 27, scope: !290, inlinedAt: !2747)
!2755 = !DILocation(line: 268, column: 29, scope: !290, inlinedAt: !2747)
!2756 = !DILocation(line: 268, column: 24, scope: !290, inlinedAt: !2747)
!2757 = !DILocation(line: 268, column: 9, scope: !290, inlinedAt: !2747)
!2758 = !DILocation(line: 269, column: 36, scope: !290, inlinedAt: !2747)
!2759 = !DILocation(line: 269, column: 21, scope: !290, inlinedAt: !2747)
!2760 = !DILocation(line: 269, column: 9, scope: !290, inlinedAt: !2747)
!2761 = !DILocation(line: 266, column: 5, scope: !286, inlinedAt: !2747)
!2762 = distinct !{!2762, !2752, !2763, !300}
!2763 = !DILocation(line: 270, column: 5, scope: !282, inlinedAt: !2747)
!2764 = !DILocation(line: 271, column: 1, scope: !265, inlinedAt: !2747)
!2765 = !DILocation(line: 614, column: 5, scope: !248)
!2766 = distinct !DISubprogram(name: "m_vec_multiply_bins", scope: !660, file: !660, line: 66, type: !2767, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2767 = !DISubroutineType(types: !2768)
!2768 = !{null, !86, !52, !52}
!2769 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2766, file: !660, line: 66, type: !86)
!2770 = !DILocation(line: 0, scope: !2766)
!2771 = !DILocalVariable(name: "bins", arg: 2, scope: !2766, file: !660, line: 66, type: !52)
!2772 = !DILocalVariable(name: "out", arg: 3, scope: !2766, file: !660, line: 66, type: !52)
!2773 = !DILocation(line: 67, column: 44, scope: !2766)
!2774 = !DILocation(line: 67, column: 73, scope: !2766)
!2775 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2776, file: !660, line: 56, type: !86)
!2776 = distinct !DISubprogram(name: "m_vec_mul_add_x_inv", scope: !660, file: !660, line: 56, type: !2472, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2777 = !DILocation(line: 0, scope: !2776, inlinedAt: !2778)
!2778 = distinct !DILocation(line: 67, column: 5, scope: !2766)
!2779 = !DILocalVariable(name: "in", arg: 2, scope: !2776, file: !660, line: 56, type: !488)
!2780 = !DILocalVariable(name: "acc", arg: 3, scope: !2776, file: !660, line: 56, type: !52)
!2781 = !DILocalVariable(name: "mask_lsb", scope: !2776, file: !660, line: 58, type: !53)
!2782 = !DILocalVariable(name: "i", scope: !2783, file: !660, line: 59, type: !86)
!2783 = distinct !DILexicalBlock(scope: !2776, file: !660, line: 59, column: 5)
!2784 = !DILocation(line: 0, scope: !2783, inlinedAt: !2778)
!2785 = !DILocation(line: 59, column: 9, scope: !2783, inlinedAt: !2778)
!2786 = !DILocation(line: 59, scope: !2783, inlinedAt: !2778)
!2787 = !DILocation(line: 59, column: 20, scope: !2788, inlinedAt: !2778)
!2788 = distinct !DILexicalBlock(scope: !2783, file: !660, line: 59, column: 5)
!2789 = !DILocation(line: 59, column: 5, scope: !2783, inlinedAt: !2778)
!2790 = !DILocation(line: 60, column: 22, scope: !2791, inlinedAt: !2778)
!2791 = distinct !DILexicalBlock(scope: !2788, file: !660, line: 59, column: 43)
!2792 = !DILocation(line: 60, column: 28, scope: !2791, inlinedAt: !2778)
!2793 = !DILocalVariable(name: "t", scope: !2791, file: !660, line: 60, type: !53)
!2794 = !DILocation(line: 0, scope: !2791, inlinedAt: !2778)
!2795 = !DILocation(line: 61, column: 32, scope: !2791, inlinedAt: !2778)
!2796 = !DILocation(line: 61, column: 43, scope: !2791, inlinedAt: !2778)
!2797 = !DILocation(line: 61, column: 38, scope: !2791, inlinedAt: !2778)
!2798 = !DILocation(line: 61, column: 9, scope: !2791, inlinedAt: !2778)
!2799 = !DILocation(line: 61, column: 16, scope: !2791, inlinedAt: !2778)
!2800 = !DILocation(line: 59, column: 40, scope: !2788, inlinedAt: !2778)
!2801 = !DILocation(line: 59, column: 5, scope: !2788, inlinedAt: !2778)
!2802 = distinct !{!2802, !2789, !2803, !300}
!2803 = !DILocation(line: 62, column: 5, scope: !2783, inlinedAt: !2778)
!2804 = !DILocation(line: 68, column: 40, scope: !2766)
!2805 = !DILocation(line: 68, column: 69, scope: !2766)
!2806 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2807, file: !660, line: 46, type: !86)
!2807 = distinct !DISubprogram(name: "m_vec_mul_add_x", scope: !660, file: !660, line: 46, type: !2472, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2808 = !DILocation(line: 0, scope: !2807, inlinedAt: !2809)
!2809 = distinct !DILocation(line: 68, column: 5, scope: !2766)
!2810 = !DILocalVariable(name: "in", arg: 2, scope: !2807, file: !660, line: 46, type: !488)
!2811 = !DILocalVariable(name: "acc", arg: 3, scope: !2807, file: !660, line: 46, type: !52)
!2812 = !DILocalVariable(name: "mask_msb", scope: !2807, file: !660, line: 48, type: !53)
!2813 = !DILocalVariable(name: "i", scope: !2814, file: !660, line: 49, type: !86)
!2814 = distinct !DILexicalBlock(scope: !2807, file: !660, line: 49, column: 5)
!2815 = !DILocation(line: 0, scope: !2814, inlinedAt: !2809)
!2816 = !DILocation(line: 49, column: 9, scope: !2814, inlinedAt: !2809)
!2817 = !DILocation(line: 49, scope: !2814, inlinedAt: !2809)
!2818 = !DILocation(line: 49, column: 20, scope: !2819, inlinedAt: !2809)
!2819 = distinct !DILexicalBlock(scope: !2814, file: !660, line: 49, column: 5)
!2820 = !DILocation(line: 49, column: 5, scope: !2814, inlinedAt: !2809)
!2821 = !DILocation(line: 50, column: 22, scope: !2822, inlinedAt: !2809)
!2822 = distinct !DILexicalBlock(scope: !2819, file: !660, line: 49, column: 43)
!2823 = !DILocalVariable(name: "t", scope: !2822, file: !660, line: 50, type: !53)
!2824 = !DILocation(line: 0, scope: !2822, inlinedAt: !2809)
!2825 = !DILocation(line: 51, column: 32, scope: !2822, inlinedAt: !2809)
!2826 = !DILocation(line: 51, column: 44, scope: !2822, inlinedAt: !2809)
!2827 = !DILocation(line: 51, column: 50, scope: !2822, inlinedAt: !2809)
!2828 = !DILocation(line: 51, column: 38, scope: !2822, inlinedAt: !2809)
!2829 = !DILocation(line: 51, column: 9, scope: !2822, inlinedAt: !2809)
!2830 = !DILocation(line: 51, column: 16, scope: !2822, inlinedAt: !2809)
!2831 = !DILocation(line: 49, column: 40, scope: !2819, inlinedAt: !2809)
!2832 = !DILocation(line: 49, column: 5, scope: !2819, inlinedAt: !2809)
!2833 = distinct !{!2833, !2820, !2834, !300}
!2834 = !DILocation(line: 52, column: 5, scope: !2814, inlinedAt: !2809)
!2835 = !DILocation(line: 69, column: 44, scope: !2766)
!2836 = !DILocation(line: 69, column: 74, scope: !2766)
!2837 = !DILocation(line: 0, scope: !2776, inlinedAt: !2838)
!2838 = distinct !DILocation(line: 69, column: 5, scope: !2766)
!2839 = !DILocation(line: 0, scope: !2783, inlinedAt: !2838)
!2840 = !DILocation(line: 59, column: 9, scope: !2783, inlinedAt: !2838)
!2841 = !DILocation(line: 59, scope: !2783, inlinedAt: !2838)
!2842 = !DILocation(line: 59, column: 20, scope: !2788, inlinedAt: !2838)
!2843 = !DILocation(line: 59, column: 5, scope: !2783, inlinedAt: !2838)
!2844 = !DILocation(line: 60, column: 22, scope: !2791, inlinedAt: !2838)
!2845 = !DILocation(line: 60, column: 28, scope: !2791, inlinedAt: !2838)
!2846 = !DILocation(line: 0, scope: !2791, inlinedAt: !2838)
!2847 = !DILocation(line: 61, column: 32, scope: !2791, inlinedAt: !2838)
!2848 = !DILocation(line: 61, column: 43, scope: !2791, inlinedAt: !2838)
!2849 = !DILocation(line: 61, column: 38, scope: !2791, inlinedAt: !2838)
!2850 = !DILocation(line: 61, column: 9, scope: !2791, inlinedAt: !2838)
!2851 = !DILocation(line: 61, column: 16, scope: !2791, inlinedAt: !2838)
!2852 = !DILocation(line: 59, column: 40, scope: !2788, inlinedAt: !2838)
!2853 = !DILocation(line: 59, column: 5, scope: !2788, inlinedAt: !2838)
!2854 = distinct !{!2854, !2843, !2855, !300}
!2855 = !DILocation(line: 62, column: 5, scope: !2783, inlinedAt: !2838)
!2856 = !DILocation(line: 70, column: 40, scope: !2766)
!2857 = !DILocation(line: 70, column: 69, scope: !2766)
!2858 = !DILocation(line: 0, scope: !2807, inlinedAt: !2859)
!2859 = distinct !DILocation(line: 70, column: 5, scope: !2766)
!2860 = !DILocation(line: 0, scope: !2814, inlinedAt: !2859)
!2861 = !DILocation(line: 49, column: 9, scope: !2814, inlinedAt: !2859)
!2862 = !DILocation(line: 49, scope: !2814, inlinedAt: !2859)
!2863 = !DILocation(line: 49, column: 20, scope: !2819, inlinedAt: !2859)
!2864 = !DILocation(line: 49, column: 5, scope: !2814, inlinedAt: !2859)
!2865 = !DILocation(line: 50, column: 22, scope: !2822, inlinedAt: !2859)
!2866 = !DILocation(line: 0, scope: !2822, inlinedAt: !2859)
!2867 = !DILocation(line: 51, column: 32, scope: !2822, inlinedAt: !2859)
!2868 = !DILocation(line: 51, column: 44, scope: !2822, inlinedAt: !2859)
!2869 = !DILocation(line: 51, column: 50, scope: !2822, inlinedAt: !2859)
!2870 = !DILocation(line: 51, column: 38, scope: !2822, inlinedAt: !2859)
!2871 = !DILocation(line: 51, column: 9, scope: !2822, inlinedAt: !2859)
!2872 = !DILocation(line: 51, column: 16, scope: !2822, inlinedAt: !2859)
!2873 = !DILocation(line: 49, column: 40, scope: !2819, inlinedAt: !2859)
!2874 = !DILocation(line: 49, column: 5, scope: !2819, inlinedAt: !2859)
!2875 = distinct !{!2875, !2864, !2876, !300}
!2876 = !DILocation(line: 52, column: 5, scope: !2814, inlinedAt: !2859)
!2877 = !DILocation(line: 71, column: 44, scope: !2766)
!2878 = !DILocation(line: 71, column: 73, scope: !2766)
!2879 = !DILocation(line: 0, scope: !2776, inlinedAt: !2880)
!2880 = distinct !DILocation(line: 71, column: 5, scope: !2766)
!2881 = !DILocation(line: 0, scope: !2783, inlinedAt: !2880)
!2882 = !DILocation(line: 59, column: 9, scope: !2783, inlinedAt: !2880)
!2883 = !DILocation(line: 59, scope: !2783, inlinedAt: !2880)
!2884 = !DILocation(line: 59, column: 20, scope: !2788, inlinedAt: !2880)
!2885 = !DILocation(line: 59, column: 5, scope: !2783, inlinedAt: !2880)
!2886 = !DILocation(line: 60, column: 22, scope: !2791, inlinedAt: !2880)
!2887 = !DILocation(line: 60, column: 28, scope: !2791, inlinedAt: !2880)
!2888 = !DILocation(line: 0, scope: !2791, inlinedAt: !2880)
!2889 = !DILocation(line: 61, column: 32, scope: !2791, inlinedAt: !2880)
!2890 = !DILocation(line: 61, column: 43, scope: !2791, inlinedAt: !2880)
!2891 = !DILocation(line: 61, column: 38, scope: !2791, inlinedAt: !2880)
!2892 = !DILocation(line: 61, column: 9, scope: !2791, inlinedAt: !2880)
!2893 = !DILocation(line: 61, column: 16, scope: !2791, inlinedAt: !2880)
!2894 = !DILocation(line: 59, column: 40, scope: !2788, inlinedAt: !2880)
!2895 = !DILocation(line: 59, column: 5, scope: !2788, inlinedAt: !2880)
!2896 = distinct !{!2896, !2885, !2897, !300}
!2897 = !DILocation(line: 62, column: 5, scope: !2783, inlinedAt: !2880)
!2898 = !DILocation(line: 72, column: 40, scope: !2766)
!2899 = !DILocation(line: 72, column: 69, scope: !2766)
!2900 = !DILocation(line: 0, scope: !2807, inlinedAt: !2901)
!2901 = distinct !DILocation(line: 72, column: 5, scope: !2766)
!2902 = !DILocation(line: 0, scope: !2814, inlinedAt: !2901)
!2903 = !DILocation(line: 49, column: 9, scope: !2814, inlinedAt: !2901)
!2904 = !DILocation(line: 49, scope: !2814, inlinedAt: !2901)
!2905 = !DILocation(line: 49, column: 20, scope: !2819, inlinedAt: !2901)
!2906 = !DILocation(line: 49, column: 5, scope: !2814, inlinedAt: !2901)
!2907 = !DILocation(line: 50, column: 22, scope: !2822, inlinedAt: !2901)
!2908 = !DILocation(line: 0, scope: !2822, inlinedAt: !2901)
!2909 = !DILocation(line: 51, column: 32, scope: !2822, inlinedAt: !2901)
!2910 = !DILocation(line: 51, column: 44, scope: !2822, inlinedAt: !2901)
!2911 = !DILocation(line: 51, column: 50, scope: !2822, inlinedAt: !2901)
!2912 = !DILocation(line: 51, column: 38, scope: !2822, inlinedAt: !2901)
!2913 = !DILocation(line: 51, column: 9, scope: !2822, inlinedAt: !2901)
!2914 = !DILocation(line: 51, column: 16, scope: !2822, inlinedAt: !2901)
!2915 = !DILocation(line: 49, column: 40, scope: !2819, inlinedAt: !2901)
!2916 = !DILocation(line: 49, column: 5, scope: !2819, inlinedAt: !2901)
!2917 = distinct !{!2917, !2906, !2918, !300}
!2918 = !DILocation(line: 52, column: 5, scope: !2814, inlinedAt: !2901)
!2919 = !DILocation(line: 73, column: 44, scope: !2766)
!2920 = !DILocation(line: 73, column: 74, scope: !2766)
!2921 = !DILocation(line: 0, scope: !2776, inlinedAt: !2922)
!2922 = distinct !DILocation(line: 73, column: 5, scope: !2766)
!2923 = !DILocation(line: 0, scope: !2783, inlinedAt: !2922)
!2924 = !DILocation(line: 59, column: 9, scope: !2783, inlinedAt: !2922)
!2925 = !DILocation(line: 59, scope: !2783, inlinedAt: !2922)
!2926 = !DILocation(line: 59, column: 20, scope: !2788, inlinedAt: !2922)
!2927 = !DILocation(line: 59, column: 5, scope: !2783, inlinedAt: !2922)
!2928 = !DILocation(line: 60, column: 22, scope: !2791, inlinedAt: !2922)
!2929 = !DILocation(line: 60, column: 28, scope: !2791, inlinedAt: !2922)
!2930 = !DILocation(line: 0, scope: !2791, inlinedAt: !2922)
!2931 = !DILocation(line: 61, column: 32, scope: !2791, inlinedAt: !2922)
!2932 = !DILocation(line: 61, column: 43, scope: !2791, inlinedAt: !2922)
!2933 = !DILocation(line: 61, column: 38, scope: !2791, inlinedAt: !2922)
!2934 = !DILocation(line: 61, column: 9, scope: !2791, inlinedAt: !2922)
!2935 = !DILocation(line: 61, column: 16, scope: !2791, inlinedAt: !2922)
!2936 = !DILocation(line: 59, column: 40, scope: !2788, inlinedAt: !2922)
!2937 = !DILocation(line: 59, column: 5, scope: !2788, inlinedAt: !2922)
!2938 = distinct !{!2938, !2927, !2939, !300}
!2939 = !DILocation(line: 62, column: 5, scope: !2783, inlinedAt: !2922)
!2940 = !DILocation(line: 74, column: 40, scope: !2766)
!2941 = !DILocation(line: 74, column: 69, scope: !2766)
!2942 = !DILocation(line: 0, scope: !2807, inlinedAt: !2943)
!2943 = distinct !DILocation(line: 74, column: 5, scope: !2766)
!2944 = !DILocation(line: 0, scope: !2814, inlinedAt: !2943)
!2945 = !DILocation(line: 49, column: 9, scope: !2814, inlinedAt: !2943)
!2946 = !DILocation(line: 49, scope: !2814, inlinedAt: !2943)
!2947 = !DILocation(line: 49, column: 20, scope: !2819, inlinedAt: !2943)
!2948 = !DILocation(line: 49, column: 5, scope: !2814, inlinedAt: !2943)
!2949 = !DILocation(line: 50, column: 22, scope: !2822, inlinedAt: !2943)
!2950 = !DILocation(line: 0, scope: !2822, inlinedAt: !2943)
!2951 = !DILocation(line: 51, column: 32, scope: !2822, inlinedAt: !2943)
!2952 = !DILocation(line: 51, column: 44, scope: !2822, inlinedAt: !2943)
!2953 = !DILocation(line: 51, column: 50, scope: !2822, inlinedAt: !2943)
!2954 = !DILocation(line: 51, column: 38, scope: !2822, inlinedAt: !2943)
!2955 = !DILocation(line: 51, column: 9, scope: !2822, inlinedAt: !2943)
!2956 = !DILocation(line: 51, column: 16, scope: !2822, inlinedAt: !2943)
!2957 = !DILocation(line: 49, column: 40, scope: !2819, inlinedAt: !2943)
!2958 = !DILocation(line: 49, column: 5, scope: !2819, inlinedAt: !2943)
!2959 = distinct !{!2959, !2948, !2960, !300}
!2960 = !DILocation(line: 52, column: 5, scope: !2814, inlinedAt: !2943)
!2961 = !DILocation(line: 75, column: 44, scope: !2766)
!2962 = !DILocation(line: 75, column: 74, scope: !2766)
!2963 = !DILocation(line: 0, scope: !2776, inlinedAt: !2964)
!2964 = distinct !DILocation(line: 75, column: 5, scope: !2766)
!2965 = !DILocation(line: 0, scope: !2783, inlinedAt: !2964)
!2966 = !DILocation(line: 59, column: 9, scope: !2783, inlinedAt: !2964)
!2967 = !DILocation(line: 59, scope: !2783, inlinedAt: !2964)
!2968 = !DILocation(line: 59, column: 20, scope: !2788, inlinedAt: !2964)
!2969 = !DILocation(line: 59, column: 5, scope: !2783, inlinedAt: !2964)
!2970 = !DILocation(line: 60, column: 22, scope: !2791, inlinedAt: !2964)
!2971 = !DILocation(line: 60, column: 28, scope: !2791, inlinedAt: !2964)
!2972 = !DILocation(line: 0, scope: !2791, inlinedAt: !2964)
!2973 = !DILocation(line: 61, column: 32, scope: !2791, inlinedAt: !2964)
!2974 = !DILocation(line: 61, column: 43, scope: !2791, inlinedAt: !2964)
!2975 = !DILocation(line: 61, column: 38, scope: !2791, inlinedAt: !2964)
!2976 = !DILocation(line: 61, column: 9, scope: !2791, inlinedAt: !2964)
!2977 = !DILocation(line: 61, column: 16, scope: !2791, inlinedAt: !2964)
!2978 = !DILocation(line: 59, column: 40, scope: !2788, inlinedAt: !2964)
!2979 = !DILocation(line: 59, column: 5, scope: !2788, inlinedAt: !2964)
!2980 = distinct !{!2980, !2969, !2981, !300}
!2981 = !DILocation(line: 62, column: 5, scope: !2783, inlinedAt: !2964)
!2982 = !DILocation(line: 76, column: 40, scope: !2766)
!2983 = !DILocation(line: 76, column: 69, scope: !2766)
!2984 = !DILocation(line: 0, scope: !2807, inlinedAt: !2985)
!2985 = distinct !DILocation(line: 76, column: 5, scope: !2766)
!2986 = !DILocation(line: 0, scope: !2814, inlinedAt: !2985)
!2987 = !DILocation(line: 49, column: 9, scope: !2814, inlinedAt: !2985)
!2988 = !DILocation(line: 49, scope: !2814, inlinedAt: !2985)
!2989 = !DILocation(line: 49, column: 20, scope: !2819, inlinedAt: !2985)
!2990 = !DILocation(line: 49, column: 5, scope: !2814, inlinedAt: !2985)
!2991 = !DILocation(line: 50, column: 22, scope: !2822, inlinedAt: !2985)
!2992 = !DILocation(line: 0, scope: !2822, inlinedAt: !2985)
!2993 = !DILocation(line: 51, column: 32, scope: !2822, inlinedAt: !2985)
!2994 = !DILocation(line: 51, column: 44, scope: !2822, inlinedAt: !2985)
!2995 = !DILocation(line: 51, column: 50, scope: !2822, inlinedAt: !2985)
!2996 = !DILocation(line: 51, column: 38, scope: !2822, inlinedAt: !2985)
!2997 = !DILocation(line: 51, column: 9, scope: !2822, inlinedAt: !2985)
!2998 = !DILocation(line: 51, column: 16, scope: !2822, inlinedAt: !2985)
!2999 = !DILocation(line: 49, column: 40, scope: !2819, inlinedAt: !2985)
!3000 = !DILocation(line: 49, column: 5, scope: !2819, inlinedAt: !2985)
!3001 = distinct !{!3001, !2990, !3002, !300}
!3002 = !DILocation(line: 52, column: 5, scope: !2814, inlinedAt: !2985)
!3003 = !DILocation(line: 77, column: 44, scope: !2766)
!3004 = !DILocation(line: 77, column: 74, scope: !2766)
!3005 = !DILocation(line: 0, scope: !2776, inlinedAt: !3006)
!3006 = distinct !DILocation(line: 77, column: 5, scope: !2766)
!3007 = !DILocation(line: 0, scope: !2783, inlinedAt: !3006)
!3008 = !DILocation(line: 59, column: 9, scope: !2783, inlinedAt: !3006)
!3009 = !DILocation(line: 59, scope: !2783, inlinedAt: !3006)
!3010 = !DILocation(line: 59, column: 20, scope: !2788, inlinedAt: !3006)
!3011 = !DILocation(line: 59, column: 5, scope: !2783, inlinedAt: !3006)
!3012 = !DILocation(line: 60, column: 22, scope: !2791, inlinedAt: !3006)
!3013 = !DILocation(line: 60, column: 28, scope: !2791, inlinedAt: !3006)
!3014 = !DILocation(line: 0, scope: !2791, inlinedAt: !3006)
!3015 = !DILocation(line: 61, column: 32, scope: !2791, inlinedAt: !3006)
!3016 = !DILocation(line: 61, column: 43, scope: !2791, inlinedAt: !3006)
!3017 = !DILocation(line: 61, column: 38, scope: !2791, inlinedAt: !3006)
!3018 = !DILocation(line: 61, column: 9, scope: !2791, inlinedAt: !3006)
!3019 = !DILocation(line: 61, column: 16, scope: !2791, inlinedAt: !3006)
!3020 = !DILocation(line: 59, column: 40, scope: !2788, inlinedAt: !3006)
!3021 = !DILocation(line: 59, column: 5, scope: !2788, inlinedAt: !3006)
!3022 = distinct !{!3022, !3011, !3023, !300}
!3023 = !DILocation(line: 62, column: 5, scope: !2783, inlinedAt: !3006)
!3024 = !DILocation(line: 78, column: 40, scope: !2766)
!3025 = !DILocation(line: 78, column: 69, scope: !2766)
!3026 = !DILocation(line: 0, scope: !2807, inlinedAt: !3027)
!3027 = distinct !DILocation(line: 78, column: 5, scope: !2766)
!3028 = !DILocation(line: 0, scope: !2814, inlinedAt: !3027)
!3029 = !DILocation(line: 49, column: 9, scope: !2814, inlinedAt: !3027)
!3030 = !DILocation(line: 49, scope: !2814, inlinedAt: !3027)
!3031 = !DILocation(line: 49, column: 20, scope: !2819, inlinedAt: !3027)
!3032 = !DILocation(line: 49, column: 5, scope: !2814, inlinedAt: !3027)
!3033 = !DILocation(line: 50, column: 22, scope: !2822, inlinedAt: !3027)
!3034 = !DILocation(line: 0, scope: !2822, inlinedAt: !3027)
!3035 = !DILocation(line: 51, column: 32, scope: !2822, inlinedAt: !3027)
!3036 = !DILocation(line: 51, column: 44, scope: !2822, inlinedAt: !3027)
!3037 = !DILocation(line: 51, column: 50, scope: !2822, inlinedAt: !3027)
!3038 = !DILocation(line: 51, column: 38, scope: !2822, inlinedAt: !3027)
!3039 = !DILocation(line: 51, column: 9, scope: !2822, inlinedAt: !3027)
!3040 = !DILocation(line: 51, column: 16, scope: !2822, inlinedAt: !3027)
!3041 = !DILocation(line: 49, column: 40, scope: !2819, inlinedAt: !3027)
!3042 = !DILocation(line: 49, column: 5, scope: !2819, inlinedAt: !3027)
!3043 = distinct !{!3043, !3032, !3044, !300}
!3044 = !DILocation(line: 52, column: 5, scope: !2814, inlinedAt: !3027)
!3045 = !DILocation(line: 79, column: 44, scope: !2766)
!3046 = !DILocation(line: 79, column: 74, scope: !2766)
!3047 = !DILocation(line: 0, scope: !2776, inlinedAt: !3048)
!3048 = distinct !DILocation(line: 79, column: 5, scope: !2766)
!3049 = !DILocation(line: 0, scope: !2783, inlinedAt: !3048)
!3050 = !DILocation(line: 59, column: 9, scope: !2783, inlinedAt: !3048)
!3051 = !DILocation(line: 59, scope: !2783, inlinedAt: !3048)
!3052 = !DILocation(line: 59, column: 20, scope: !2788, inlinedAt: !3048)
!3053 = !DILocation(line: 59, column: 5, scope: !2783, inlinedAt: !3048)
!3054 = !DILocation(line: 60, column: 22, scope: !2791, inlinedAt: !3048)
!3055 = !DILocation(line: 60, column: 28, scope: !2791, inlinedAt: !3048)
!3056 = !DILocation(line: 0, scope: !2791, inlinedAt: !3048)
!3057 = !DILocation(line: 61, column: 32, scope: !2791, inlinedAt: !3048)
!3058 = !DILocation(line: 61, column: 43, scope: !2791, inlinedAt: !3048)
!3059 = !DILocation(line: 61, column: 38, scope: !2791, inlinedAt: !3048)
!3060 = !DILocation(line: 61, column: 9, scope: !2791, inlinedAt: !3048)
!3061 = !DILocation(line: 61, column: 16, scope: !2791, inlinedAt: !3048)
!3062 = !DILocation(line: 59, column: 40, scope: !2788, inlinedAt: !3048)
!3063 = !DILocation(line: 59, column: 5, scope: !2788, inlinedAt: !3048)
!3064 = distinct !{!3064, !3053, !3065, !300}
!3065 = !DILocation(line: 62, column: 5, scope: !2783, inlinedAt: !3048)
!3066 = !DILocation(line: 80, column: 40, scope: !2766)
!3067 = !DILocation(line: 80, column: 69, scope: !2766)
!3068 = !DILocation(line: 0, scope: !2807, inlinedAt: !3069)
!3069 = distinct !DILocation(line: 80, column: 5, scope: !2766)
!3070 = !DILocation(line: 0, scope: !2814, inlinedAt: !3069)
!3071 = !DILocation(line: 49, column: 9, scope: !2814, inlinedAt: !3069)
!3072 = !DILocation(line: 49, scope: !2814, inlinedAt: !3069)
!3073 = !DILocation(line: 49, column: 20, scope: !2819, inlinedAt: !3069)
!3074 = !DILocation(line: 49, column: 5, scope: !2814, inlinedAt: !3069)
!3075 = !DILocation(line: 50, column: 22, scope: !2822, inlinedAt: !3069)
!3076 = !DILocation(line: 0, scope: !2822, inlinedAt: !3069)
!3077 = !DILocation(line: 51, column: 32, scope: !2822, inlinedAt: !3069)
!3078 = !DILocation(line: 51, column: 44, scope: !2822, inlinedAt: !3069)
!3079 = !DILocation(line: 51, column: 50, scope: !2822, inlinedAt: !3069)
!3080 = !DILocation(line: 51, column: 38, scope: !2822, inlinedAt: !3069)
!3081 = !DILocation(line: 51, column: 9, scope: !2822, inlinedAt: !3069)
!3082 = !DILocation(line: 51, column: 16, scope: !2822, inlinedAt: !3069)
!3083 = !DILocation(line: 49, column: 40, scope: !2819, inlinedAt: !3069)
!3084 = !DILocation(line: 49, column: 5, scope: !2819, inlinedAt: !3069)
!3085 = distinct !{!3085, !3074, !3086, !300}
!3086 = !DILocation(line: 52, column: 5, scope: !2814, inlinedAt: !3069)
!3087 = !DILocation(line: 81, column: 35, scope: !2766)
!3088 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !3089, file: !660, line: 13, type: !86)
!3089 = distinct !DISubprogram(name: "m_vec_copy", scope: !660, file: !660, line: 13, type: !2472, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!3090 = !DILocation(line: 0, scope: !3089, inlinedAt: !3091)
!3091 = distinct !DILocation(line: 81, column: 5, scope: !2766)
!3092 = !DILocalVariable(name: "in", arg: 2, scope: !3089, file: !660, line: 13, type: !488)
!3093 = !DILocalVariable(name: "out", arg: 3, scope: !3089, file: !660, line: 13, type: !52)
!3094 = !DILocalVariable(name: "i", scope: !3095, file: !660, line: 15, type: !58)
!3095 = distinct !DILexicalBlock(scope: !3089, file: !660, line: 15, column: 5)
!3096 = !DILocation(line: 0, scope: !3095, inlinedAt: !3091)
!3097 = !DILocation(line: 15, column: 10, scope: !3095, inlinedAt: !3091)
!3098 = !DILocation(line: 15, scope: !3095, inlinedAt: !3091)
!3099 = !DILocation(line: 15, column: 26, scope: !3100, inlinedAt: !3091)
!3100 = distinct !DILexicalBlock(scope: !3095, file: !660, line: 15, column: 5)
!3101 = !DILocation(line: 15, column: 5, scope: !3095, inlinedAt: !3091)
!3102 = !DILocation(line: 17, column: 18, scope: !3103, inlinedAt: !3091)
!3103 = distinct !DILexicalBlock(scope: !3100, file: !660, line: 16, column: 5)
!3104 = !DILocation(line: 17, column: 9, scope: !3103, inlinedAt: !3091)
!3105 = !DILocation(line: 17, column: 16, scope: !3103, inlinedAt: !3091)
!3106 = !DILocation(line: 15, column: 46, scope: !3100, inlinedAt: !3091)
!3107 = !DILocation(line: 15, column: 5, scope: !3100, inlinedAt: !3091)
!3108 = distinct !{!3108, !3101, !3109, !300}
!3109 = !DILocation(line: 18, column: 5, scope: !3095, inlinedAt: !3091)
!3110 = !DILocation(line: 82, column: 1, scope: !2766)
!3111 = distinct !DISubprogram(name: "pqmayo_MAYO_1_ref_m_upper", scope: !99, file: !99, line: 14, type: !3112, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3112 = !DISubroutineType(types: !3113)
!3113 = !{null, !3114, !488, !52, !86}
!3114 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3115, size: 32)
!3115 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !3116)
!3116 = !DIDerivedType(tag: DW_TAG_typedef, name: "mayo_params_t", file: !79, line: 289, baseType: !3117)
!3117 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !79, line: 265, size: 736, elements: !3118)
!3118 = !{!3119, !3120, !3121, !3122, !3123, !3124, !3125, !3126, !3127, !3128, !3129, !3130, !3131, !3132, !3133, !3134, !3135, !3136, !3137, !3138, !3139, !3140, !3141}
!3119 = !DIDerivedType(tag: DW_TAG_member, name: "m", scope: !3117, file: !79, line: 266, baseType: !86, size: 32)
!3120 = !DIDerivedType(tag: DW_TAG_member, name: "n", scope: !3117, file: !79, line: 267, baseType: !86, size: 32, offset: 32)
!3121 = !DIDerivedType(tag: DW_TAG_member, name: "o", scope: !3117, file: !79, line: 268, baseType: !86, size: 32, offset: 64)
!3122 = !DIDerivedType(tag: DW_TAG_member, name: "k", scope: !3117, file: !79, line: 269, baseType: !86, size: 32, offset: 96)
!3123 = !DIDerivedType(tag: DW_TAG_member, name: "q", scope: !3117, file: !79, line: 270, baseType: !86, size: 32, offset: 128)
!3124 = !DIDerivedType(tag: DW_TAG_member, name: "f_tail", scope: !3117, file: !79, line: 271, baseType: !90, size: 32, offset: 160)
!3125 = !DIDerivedType(tag: DW_TAG_member, name: "m_bytes", scope: !3117, file: !79, line: 272, baseType: !86, size: 32, offset: 192)
!3126 = !DIDerivedType(tag: DW_TAG_member, name: "O_bytes", scope: !3117, file: !79, line: 273, baseType: !86, size: 32, offset: 224)
!3127 = !DIDerivedType(tag: DW_TAG_member, name: "v_bytes", scope: !3117, file: !79, line: 274, baseType: !86, size: 32, offset: 256)
!3128 = !DIDerivedType(tag: DW_TAG_member, name: "r_bytes", scope: !3117, file: !79, line: 275, baseType: !86, size: 32, offset: 288)
!3129 = !DIDerivedType(tag: DW_TAG_member, name: "R_bytes", scope: !3117, file: !79, line: 276, baseType: !86, size: 32, offset: 320)
!3130 = !DIDerivedType(tag: DW_TAG_member, name: "P1_bytes", scope: !3117, file: !79, line: 277, baseType: !86, size: 32, offset: 352)
!3131 = !DIDerivedType(tag: DW_TAG_member, name: "P2_bytes", scope: !3117, file: !79, line: 278, baseType: !86, size: 32, offset: 384)
!3132 = !DIDerivedType(tag: DW_TAG_member, name: "P3_bytes", scope: !3117, file: !79, line: 279, baseType: !86, size: 32, offset: 416)
!3133 = !DIDerivedType(tag: DW_TAG_member, name: "csk_bytes", scope: !3117, file: !79, line: 280, baseType: !86, size: 32, offset: 448)
!3134 = !DIDerivedType(tag: DW_TAG_member, name: "cpk_bytes", scope: !3117, file: !79, line: 281, baseType: !86, size: 32, offset: 480)
!3135 = !DIDerivedType(tag: DW_TAG_member, name: "sig_bytes", scope: !3117, file: !79, line: 282, baseType: !86, size: 32, offset: 512)
!3136 = !DIDerivedType(tag: DW_TAG_member, name: "salt_bytes", scope: !3117, file: !79, line: 283, baseType: !86, size: 32, offset: 544)
!3137 = !DIDerivedType(tag: DW_TAG_member, name: "sk_seed_bytes", scope: !3117, file: !79, line: 284, baseType: !86, size: 32, offset: 576)
!3138 = !DIDerivedType(tag: DW_TAG_member, name: "digest_bytes", scope: !3117, file: !79, line: 285, baseType: !86, size: 32, offset: 608)
!3139 = !DIDerivedType(tag: DW_TAG_member, name: "pk_seed_bytes", scope: !3117, file: !79, line: 286, baseType: !86, size: 32, offset: 640)
!3140 = !DIDerivedType(tag: DW_TAG_member, name: "m_vec_limbs", scope: !3117, file: !79, line: 287, baseType: !86, size: 32, offset: 672)
!3141 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !3117, file: !79, line: 288, baseType: !148, size: 32, offset: 704)
!3142 = !DILocalVariable(name: "p", arg: 1, scope: !3111, file: !99, line: 14, type: !3114)
!3143 = !DILocation(line: 0, scope: !3111)
!3144 = !DILocalVariable(name: "in", arg: 2, scope: !3111, file: !99, line: 14, type: !488)
!3145 = !DILocalVariable(name: "out", arg: 3, scope: !3111, file: !99, line: 14, type: !52)
!3146 = !DILocalVariable(name: "size", arg: 4, scope: !3111, file: !99, line: 14, type: !86)
!3147 = !DILocalVariable(name: "m_vec_limbs", scope: !3111, file: !99, line: 19, type: !275)
!3148 = !DILocalVariable(name: "m_vecs_stored", scope: !3111, file: !99, line: 20, type: !86)
!3149 = !DILocalVariable(name: "r", scope: !3150, file: !99, line: 21, type: !86)
!3150 = distinct !DILexicalBlock(scope: !3111, file: !99, line: 21, column: 5)
!3151 = !DILocation(line: 0, scope: !3150)
!3152 = !DILocation(line: 21, column: 10, scope: !3150)
!3153 = !DILocation(line: 20, column: 9, scope: !3111)
!3154 = !DILocation(line: 21, scope: !3150)
!3155 = !DILocation(line: 21, column: 23, scope: !3156)
!3156 = distinct !DILexicalBlock(scope: !3150, file: !99, line: 21, column: 5)
!3157 = !DILocation(line: 21, column: 5, scope: !3150)
!3158 = !DILocation(line: 22, column: 9, scope: !3159)
!3159 = distinct !DILexicalBlock(scope: !3160, file: !99, line: 22, column: 9)
!3160 = distinct !DILexicalBlock(scope: !3156, file: !99, line: 21, column: 36)
!3161 = !DILocation(line: 22, scope: !3159)
!3162 = !DILocalVariable(name: "c", scope: !3159, file: !99, line: 22, type: !86)
!3163 = !DILocation(line: 0, scope: !3159)
!3164 = !DILocation(line: 22, column: 27, scope: !3165)
!3165 = distinct !DILexicalBlock(scope: !3159, file: !99, line: 22, column: 9)
!3166 = !DILocation(line: 23, column: 59, scope: !3167)
!3167 = distinct !DILexicalBlock(scope: !3165, file: !99, line: 22, column: 40)
!3168 = !DILocation(line: 23, column: 66, scope: !3167)
!3169 = !DILocation(line: 23, column: 40, scope: !3167)
!3170 = !DILocation(line: 23, column: 76, scope: !3167)
!3171 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !3172, file: !660, line: 13, type: !86)
!3172 = distinct !DISubprogram(name: "m_vec_copy", scope: !660, file: !660, line: 13, type: !2472, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3173 = !DILocation(line: 0, scope: !3172, inlinedAt: !3174)
!3174 = distinct !DILocation(line: 23, column: 13, scope: !3167)
!3175 = !DILocalVariable(name: "in", arg: 2, scope: !3172, file: !660, line: 13, type: !488)
!3176 = !DILocalVariable(name: "out", arg: 3, scope: !3172, file: !660, line: 13, type: !52)
!3177 = !DILocalVariable(name: "i", scope: !3178, file: !660, line: 15, type: !58)
!3178 = distinct !DILexicalBlock(scope: !3172, file: !660, line: 15, column: 5)
!3179 = !DILocation(line: 0, scope: !3178, inlinedAt: !3174)
!3180 = !DILocation(line: 15, column: 10, scope: !3178, inlinedAt: !3174)
!3181 = !DILocation(line: 15, scope: !3178, inlinedAt: !3174)
!3182 = !DILocation(line: 15, column: 26, scope: !3183, inlinedAt: !3174)
!3183 = distinct !DILexicalBlock(scope: !3178, file: !660, line: 15, column: 5)
!3184 = !DILocation(line: 15, column: 5, scope: !3178, inlinedAt: !3174)
!3185 = !DILocation(line: 17, column: 18, scope: !3186, inlinedAt: !3174)
!3186 = distinct !DILexicalBlock(scope: !3183, file: !660, line: 16, column: 5)
!3187 = !DILocation(line: 17, column: 9, scope: !3186, inlinedAt: !3174)
!3188 = !DILocation(line: 17, column: 16, scope: !3186, inlinedAt: !3174)
!3189 = !DILocation(line: 15, column: 46, scope: !3183, inlinedAt: !3174)
!3190 = !DILocation(line: 15, column: 5, scope: !3183, inlinedAt: !3174)
!3191 = distinct !{!3191, !3184, !3192, !300}
!3192 = !DILocation(line: 18, column: 5, scope: !3178, inlinedAt: !3174)
!3193 = !DILocation(line: 24, column: 19, scope: !3194)
!3194 = distinct !DILexicalBlock(scope: !3167, file: !99, line: 24, column: 17)
!3195 = !DILocation(line: 25, column: 62, scope: !3196)
!3196 = distinct !DILexicalBlock(scope: !3194, file: !99, line: 24, column: 25)
!3197 = !DILocation(line: 25, column: 69, scope: !3196)
!3198 = !DILocation(line: 25, column: 43, scope: !3196)
!3199 = !DILocation(line: 25, column: 79, scope: !3196)
!3200 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !3201, file: !660, line: 22, type: !86)
!3201 = distinct !DISubprogram(name: "m_vec_add", scope: !660, file: !660, line: 22, type: !2472, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3202 = !DILocation(line: 0, scope: !3201, inlinedAt: !3203)
!3203 = distinct !DILocation(line: 25, column: 17, scope: !3196)
!3204 = !DILocalVariable(name: "in", arg: 2, scope: !3201, file: !660, line: 22, type: !488)
!3205 = !DILocalVariable(name: "acc", arg: 3, scope: !3201, file: !660, line: 22, type: !52)
!3206 = !DILocalVariable(name: "i", scope: !3207, file: !660, line: 24, type: !58)
!3207 = distinct !DILexicalBlock(scope: !3201, file: !660, line: 24, column: 5)
!3208 = !DILocation(line: 0, scope: !3207, inlinedAt: !3203)
!3209 = !DILocation(line: 24, column: 10, scope: !3207, inlinedAt: !3203)
!3210 = !DILocation(line: 24, scope: !3207, inlinedAt: !3203)
!3211 = !DILocation(line: 24, column: 26, scope: !3212, inlinedAt: !3203)
!3212 = distinct !DILexicalBlock(scope: !3207, file: !660, line: 24, column: 5)
!3213 = !DILocation(line: 24, column: 5, scope: !3207, inlinedAt: !3203)
!3214 = !DILocation(line: 26, column: 19, scope: !3215, inlinedAt: !3203)
!3215 = distinct !DILexicalBlock(scope: !3212, file: !660, line: 25, column: 5)
!3216 = !DILocation(line: 26, column: 9, scope: !3215, inlinedAt: !3203)
!3217 = !DILocation(line: 26, column: 16, scope: !3215, inlinedAt: !3203)
!3218 = !DILocation(line: 24, column: 46, scope: !3212, inlinedAt: !3203)
!3219 = !DILocation(line: 24, column: 5, scope: !3212, inlinedAt: !3203)
!3220 = distinct !{!3220, !3213, !3221, !300}
!3221 = !DILocation(line: 27, column: 5, scope: !3207, inlinedAt: !3203)
!3222 = !DILocation(line: 27, column: 27, scope: !3167)
!3223 = !DILocation(line: 22, column: 36, scope: !3165)
!3224 = !DILocation(line: 22, column: 9, scope: !3165)
!3225 = distinct !{!3225, !3158, !3226, !300}
!3226 = !DILocation(line: 28, column: 9, scope: !3159)
!3227 = !DILocation(line: 21, column: 32, scope: !3156)
!3228 = !DILocation(line: 21, column: 5, scope: !3156)
!3229 = distinct !{!3229, !3157, !3230, !300}
!3230 = !DILocation(line: 29, column: 5, scope: !3150)
!3231 = !DILocation(line: 30, column: 1, scope: !3111)
!3232 = distinct !DISubprogram(name: "pqmayo_MAYO_1_ref_sample_solution", scope: !99, file: !99, line: 40, type: !3233, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3233 = !DISubroutineType(types: !3234)
!3234 = !{!86, !3114, !61, !90, !90, !61, !86, !86, !86, !86}
!3235 = !DILocalVariable(name: "p", arg: 1, scope: !3232, file: !99, line: 40, type: !3114)
!3236 = !DILocation(line: 0, scope: !3232)
!3237 = !DILocalVariable(name: "A", arg: 2, scope: !3232, file: !99, line: 40, type: !61)
!3238 = !DILocalVariable(name: "y", arg: 3, scope: !3232, file: !99, line: 41, type: !90)
!3239 = !DILocalVariable(name: "r", arg: 4, scope: !3232, file: !99, line: 41, type: !90)
!3240 = !DILocalVariable(name: "x", arg: 5, scope: !3232, file: !99, line: 42, type: !61)
!3241 = !DILocalVariable(name: "k", arg: 6, scope: !3232, file: !99, line: 42, type: !86)
!3242 = !DILocalVariable(name: "o", arg: 7, scope: !3232, file: !99, line: 42, type: !86)
!3243 = !DILocalVariable(name: "m", arg: 8, scope: !3232, file: !99, line: 42, type: !86)
!3244 = !DILocalVariable(name: "A_cols", arg: 9, scope: !3232, file: !99, line: 42, type: !86)
!3245 = !DILocalVariable(name: "i", scope: !3246, file: !99, line: 51, type: !86)
!3246 = distinct !DILexicalBlock(scope: !3232, file: !99, line: 51, column: 5)
!3247 = !DILocation(line: 0, scope: !3246)
!3248 = !DILocation(line: 51, column: 10, scope: !3246)
!3249 = !DILocation(line: 51, scope: !3246)
!3250 = !DILocation(line: 51, column: 23, scope: !3251)
!3251 = distinct !DILexicalBlock(scope: !3246, file: !99, line: 51, column: 5)
!3252 = !DILocation(line: 51, column: 5, scope: !3246)
!3253 = !DILocation(line: 57, column: 5, scope: !3254)
!3254 = distinct !DILexicalBlock(scope: !3232, file: !99, line: 57, column: 5)
!3255 = !DILocation(line: 52, column: 16, scope: !3256)
!3256 = distinct !DILexicalBlock(scope: !3251, file: !99, line: 51, column: 37)
!3257 = !DILocation(line: 52, column: 9, scope: !3256)
!3258 = !DILocation(line: 52, column: 14, scope: !3256)
!3259 = !DILocation(line: 51, column: 33, scope: !3251)
!3260 = !DILocation(line: 51, column: 5, scope: !3251)
!3261 = distinct !{!3261, !3252, !3262, !300}
!3262 = !DILocation(line: 53, column: 5, scope: !3246)
!3263 = !DILocation(line: 57, scope: !3254)
!3264 = !DILocalVariable(name: "i", scope: !3254, file: !99, line: 57, type: !86)
!3265 = !DILocation(line: 0, scope: !3254)
!3266 = !DILocation(line: 57, column: 23, scope: !3267)
!3267 = distinct !DILexicalBlock(scope: !3254, file: !99, line: 57, column: 5)
!3268 = !DILocation(line: 58, column: 13, scope: !3269)
!3269 = distinct !DILexicalBlock(scope: !3267, file: !99, line: 57, column: 33)
!3270 = !DILocation(line: 58, column: 26, scope: !3269)
!3271 = !DILocation(line: 58, column: 30, scope: !3269)
!3272 = !DILocation(line: 58, column: 21, scope: !3269)
!3273 = !DILocation(line: 58, column: 9, scope: !3269)
!3274 = !DILocation(line: 58, column: 36, scope: !3269)
!3275 = !DILocation(line: 57, column: 29, scope: !3267)
!3276 = !DILocation(line: 57, column: 5, scope: !3267)
!3277 = distinct !{!3277, !3253, !3278, !300}
!3278 = !DILocation(line: 59, column: 5, scope: !3254)
!3279 = !DILocation(line: 60, column: 25, scope: !3232)
!3280 = !DILocalVariable(name: "a", arg: 1, scope: !3281, file: !670, line: 78, type: !90)
!3281 = distinct !DISubprogram(name: "mat_mul", scope: !670, file: !670, line: 78, type: !1828, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3282 = !DILocation(line: 0, scope: !3281, inlinedAt: !3283)
!3283 = distinct !DILocation(line: 60, column: 5, scope: !3232)
!3284 = !DILocalVariable(name: "b", arg: 2, scope: !3281, file: !670, line: 78, type: !90)
!3285 = !DILocalVariable(name: "c", arg: 3, scope: !3281, file: !670, line: 79, type: !61)
!3286 = !DILocalVariable(name: "colrow_ab", arg: 4, scope: !3281, file: !670, line: 79, type: !86)
!3287 = !DILocalVariable(name: "row_a", arg: 5, scope: !3281, file: !670, line: 79, type: !86)
!3288 = !DILocalVariable(name: "col_b", arg: 6, scope: !3281, file: !670, line: 79, type: !86)
!3289 = !DILocalVariable(name: "i", scope: !3290, file: !670, line: 80, type: !86)
!3290 = distinct !DILexicalBlock(scope: !3281, file: !670, line: 80, column: 5)
!3291 = !DILocation(line: 0, scope: !3290, inlinedAt: !3283)
!3292 = !DILocation(line: 80, column: 10, scope: !3290, inlinedAt: !3283)
!3293 = !DILocation(line: 80, scope: !3290, inlinedAt: !3283)
!3294 = !DILocation(line: 80, column: 23, scope: !3295, inlinedAt: !3283)
!3295 = distinct !DILexicalBlock(scope: !3290, file: !670, line: 80, column: 5)
!3296 = !DILocation(line: 80, column: 5, scope: !3290, inlinedAt: !3283)
!3297 = !DILocation(line: 81, column: 9, scope: !3298, inlinedAt: !3283)
!3298 = distinct !DILexicalBlock(scope: !3299, file: !670, line: 81, column: 9)
!3299 = distinct !DILexicalBlock(scope: !3295, file: !670, line: 80, column: 53)
!3300 = !DILocation(line: 63, column: 5, scope: !3301)
!3301 = distinct !DILexicalBlock(scope: !3232, file: !99, line: 63, column: 5)
!3302 = !DILocation(line: 81, scope: !3298, inlinedAt: !3283)
!3303 = !DILocalVariable(name: "j", scope: !3298, file: !670, line: 81, type: !86)
!3304 = !DILocation(line: 0, scope: !3298, inlinedAt: !3283)
!3305 = !DILocation(line: 81, column: 27, scope: !3306, inlinedAt: !3283)
!3306 = distinct !DILexicalBlock(scope: !3298, file: !670, line: 81, column: 9)
!3307 = !DILocation(line: 82, column: 31, scope: !3308, inlinedAt: !3283)
!3308 = distinct !DILexicalBlock(scope: !3306, file: !670, line: 81, column: 46)
!3309 = !DILocalVariable(name: "a", arg: 1, scope: !3310, file: !670, line: 69, type: !90)
!3310 = distinct !DISubprogram(name: "lincomb", scope: !670, file: !670, line: 69, type: !1857, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3311 = !DILocation(line: 0, scope: !3310, inlinedAt: !3312)
!3312 = distinct !DILocation(line: 82, column: 18, scope: !3308, inlinedAt: !3283)
!3313 = !DILocalVariable(name: "b", arg: 2, scope: !3310, file: !670, line: 70, type: !90)
!3314 = !DILocalVariable(name: "n", arg: 3, scope: !3310, file: !670, line: 70, type: !86)
!3315 = !DILocalVariable(name: "m", arg: 4, scope: !3310, file: !670, line: 70, type: !86)
!3316 = !DILocalVariable(name: "ret", scope: !3310, file: !670, line: 71, type: !51)
!3317 = !DILocalVariable(name: "i", scope: !3318, file: !670, line: 72, type: !86)
!3318 = distinct !DILexicalBlock(scope: !3310, file: !670, line: 72, column: 5)
!3319 = !DILocation(line: 0, scope: !3318, inlinedAt: !3312)
!3320 = !DILocation(line: 72, column: 10, scope: !3318, inlinedAt: !3312)
!3321 = !DILocation(line: 72, scope: !3318, inlinedAt: !3312)
!3322 = !DILocation(line: 72, column: 23, scope: !3323, inlinedAt: !3312)
!3323 = distinct !DILexicalBlock(scope: !3318, file: !670, line: 72, column: 5)
!3324 = !DILocation(line: 72, column: 5, scope: !3318, inlinedAt: !3312)
!3325 = !DILocation(line: 73, column: 27, scope: !3326, inlinedAt: !3312)
!3326 = distinct !DILexicalBlock(scope: !3323, file: !670, line: 72, column: 41)
!3327 = !DILocation(line: 73, column: 33, scope: !3326, inlinedAt: !3312)
!3328 = !DILocalVariable(name: "a", arg: 1, scope: !3329, file: !670, line: 8, type: !51)
!3329 = distinct !DISubprogram(name: "mul_f", scope: !670, file: !670, line: 8, type: !1542, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3330 = !DILocation(line: 0, scope: !3329, inlinedAt: !3331)
!3331 = distinct !DILocation(line: 73, column: 21, scope: !3326, inlinedAt: !3312)
!3332 = !DILocalVariable(name: "b", arg: 2, scope: !3329, file: !670, line: 8, type: !51)
!3333 = !DILocation(line: 13, column: 10, scope: !3329, inlinedAt: !3331)
!3334 = !DILocation(line: 13, column: 7, scope: !3329, inlinedAt: !3331)
!3335 = !DILocation(line: 16, column: 17, scope: !3329, inlinedAt: !3331)
!3336 = !DILocalVariable(name: "p", scope: !3329, file: !670, line: 10, type: !51)
!3337 = !DILocation(line: 17, column: 13, scope: !3329, inlinedAt: !3331)
!3338 = !DILocation(line: 17, column: 17, scope: !3329, inlinedAt: !3331)
!3339 = !DILocation(line: 17, column: 7, scope: !3329, inlinedAt: !3331)
!3340 = !DILocation(line: 18, column: 13, scope: !3329, inlinedAt: !3331)
!3341 = !DILocation(line: 18, column: 17, scope: !3329, inlinedAt: !3331)
!3342 = !DILocation(line: 18, column: 7, scope: !3329, inlinedAt: !3331)
!3343 = !DILocation(line: 19, column: 13, scope: !3329, inlinedAt: !3331)
!3344 = !DILocation(line: 19, column: 17, scope: !3329, inlinedAt: !3331)
!3345 = !DILocation(line: 19, column: 7, scope: !3329, inlinedAt: !3331)
!3346 = !DILocalVariable(name: "top_p", scope: !3329, file: !670, line: 22, type: !51)
!3347 = !DILocation(line: 23, column: 37, scope: !3329, inlinedAt: !3331)
!3348 = !DILocation(line: 23, column: 52, scope: !3329, inlinedAt: !3331)
!3349 = !DILocation(line: 23, column: 43, scope: !3329, inlinedAt: !3331)
!3350 = !DILocation(line: 23, column: 59, scope: !3329, inlinedAt: !3331)
!3351 = !DILocalVariable(name: "out", scope: !3329, file: !670, line: 23, type: !51)
!3352 = !DILocalVariable(name: "a", arg: 1, scope: !3353, file: !670, line: 42, type: !51)
!3353 = distinct !DISubprogram(name: "add_f", scope: !670, file: !670, line: 42, type: !1542, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3354 = !DILocation(line: 0, scope: !3353, inlinedAt: !3355)
!3355 = distinct !DILocation(line: 73, column: 15, scope: !3326, inlinedAt: !3312)
!3356 = !DILocalVariable(name: "b", arg: 2, scope: !3353, file: !670, line: 42, type: !51)
!3357 = !DILocation(line: 43, column: 14, scope: !3353, inlinedAt: !3355)
!3358 = !DILocation(line: 72, column: 28, scope: !3323, inlinedAt: !3312)
!3359 = !DILocation(line: 72, column: 35, scope: !3323, inlinedAt: !3312)
!3360 = !DILocation(line: 72, column: 5, scope: !3323, inlinedAt: !3312)
!3361 = distinct !{!3361, !3324, !3362, !300}
!3362 = !DILocation(line: 74, column: 5, scope: !3318, inlinedAt: !3312)
!3363 = !DILocation(line: 82, column: 16, scope: !3308, inlinedAt: !3283)
!3364 = !DILocation(line: 81, column: 41, scope: !3306, inlinedAt: !3283)
!3365 = !DILocation(line: 81, column: 9, scope: !3306, inlinedAt: !3283)
!3366 = distinct !{!3366, !3297, !3367, !300}
!3367 = !DILocation(line: 83, column: 9, scope: !3298, inlinedAt: !3283)
!3368 = !DILocation(line: 80, column: 32, scope: !3295, inlinedAt: !3283)
!3369 = !DILocation(line: 80, column: 39, scope: !3295, inlinedAt: !3283)
!3370 = !DILocation(line: 80, column: 5, scope: !3295, inlinedAt: !3283)
!3371 = distinct !{!3371, !3296, !3372, !300}
!3372 = !DILocation(line: 84, column: 5, scope: !3290, inlinedAt: !3283)
!3373 = !DILocation(line: 63, scope: !3301)
!3374 = !DILocalVariable(name: "i", scope: !3301, file: !99, line: 63, type: !86)
!3375 = !DILocation(line: 0, scope: !3301)
!3376 = !DILocation(line: 63, column: 23, scope: !3377)
!3377 = distinct !DILexicalBlock(scope: !3301, file: !99, line: 63, column: 5)
!3378 = !DILocation(line: 64, column: 44, scope: !3379)
!3379 = distinct !DILexicalBlock(scope: !3377, file: !99, line: 63, column: 33)
!3380 = !DILocation(line: 64, column: 50, scope: !3379)
!3381 = !DILocalVariable(name: "a", arg: 1, scope: !3382, file: !670, line: 47, type: !51)
!3382 = distinct !DISubprogram(name: "sub_f", scope: !670, file: !670, line: 47, type: !1542, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3383 = !DILocation(line: 0, scope: !3382, inlinedAt: !3384)
!3384 = distinct !DILocation(line: 64, column: 38, scope: !3379)
!3385 = !DILocalVariable(name: "b", arg: 2, scope: !3382, file: !670, line: 47, type: !51)
!3386 = !DILocation(line: 48, column: 14, scope: !3382, inlinedAt: !3384)
!3387 = !DILocation(line: 64, column: 13, scope: !3379)
!3388 = !DILocation(line: 64, column: 26, scope: !3379)
!3389 = !DILocation(line: 64, column: 30, scope: !3379)
!3390 = !DILocation(line: 64, column: 21, scope: !3379)
!3391 = !DILocation(line: 64, column: 9, scope: !3379)
!3392 = !DILocation(line: 64, column: 36, scope: !3379)
!3393 = !DILocation(line: 63, column: 29, scope: !3377)
!3394 = !DILocation(line: 63, column: 5, scope: !3377)
!3395 = distinct !{!3395, !3300, !3396, !300}
!3396 = !DILocation(line: 65, column: 5, scope: !3301)
!3397 = !DILocation(line: 67, column: 16, scope: !3232)
!3398 = !DILocation(line: 67, column: 20, scope: !3232)
!3399 = !DILocation(line: 64, column: 27, scope: !3400, inlinedAt: !3404)
!3400 = distinct !DISubprogram(name: "EF", scope: !3401, file: !3401, line: 60, type: !3402, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3401 = !DIFile(filename: "../../../src/generic/echelon_form.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!3402 = !DISubroutineType(types: !3403)
!3403 = !{null, !61, !86, !86}
!3404 = distinct !DILocation(line: 67, column: 5, scope: !3232)
!3405 = !DILocalVariable(name: "A", arg: 1, scope: !3400, file: !3401, line: 60, type: !61)
!3406 = !DILocation(line: 0, scope: !3400, inlinedAt: !3404)
!3407 = !DILocalVariable(name: "nrows", arg: 2, scope: !3400, file: !3401, line: 60, type: !86)
!3408 = !DILocalVariable(name: "ncols", arg: 3, scope: !3400, file: !3401, line: 60, type: !86)
!3409 = !DILocalVariable(name: "_pivot_row", scope: !3400, file: !3401, line: 62, type: !3410, align: 256)
!3410 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 384, elements: !17)
!3411 = !DILocation(line: 62, column: 27, scope: !3400, inlinedAt: !3404)
!3412 = !DILocalVariable(name: "_pivot_row2", scope: !3400, file: !3401, line: 63, type: !3410, align: 256)
!3413 = !DILocation(line: 63, column: 27, scope: !3400, inlinedAt: !3404)
!3414 = !DILocalVariable(name: "packed_A", scope: !3400, file: !3401, line: 64, type: !3415, align: 256)
!3415 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 29952, elements: !3416)
!3416 = !{!3417}
!3417 = !DISubrange(count: 468)
!3418 = !DILocation(line: 66, column: 26, scope: !3400, inlinedAt: !3404)
!3419 = !DILocation(line: 66, column: 32, scope: !3400, inlinedAt: !3404)
!3420 = !DILocalVariable(name: "row_len", scope: !3400, file: !3401, line: 66, type: !86)
!3421 = !DILocalVariable(name: "i", scope: !3422, file: !3401, line: 69, type: !86)
!3422 = distinct !DILexicalBlock(scope: !3400, file: !3401, line: 69, column: 5)
!3423 = !DILocation(line: 0, scope: !3422, inlinedAt: !3404)
!3424 = !DILocation(line: 69, column: 10, scope: !3422, inlinedAt: !3404)
!3425 = !DILocation(line: 69, scope: !3422, inlinedAt: !3404)
!3426 = !DILocation(line: 69, column: 23, scope: !3427, inlinedAt: !3404)
!3427 = distinct !DILexicalBlock(scope: !3422, file: !3401, line: 69, column: 5)
!3428 = !DILocation(line: 69, column: 5, scope: !3422, inlinedAt: !3404)
!3429 = !DILocation(line: 77, column: 5, scope: !3430, inlinedAt: !3404)
!3430 = distinct !DILexicalBlock(scope: !3400, file: !3401, line: 77, column: 5)
!3431 = !DILocation(line: 70, column: 29, scope: !3432, inlinedAt: !3404)
!3432 = distinct !DILexicalBlock(scope: !3427, file: !3401, line: 69, column: 37)
!3433 = !DILocation(line: 70, column: 25, scope: !3432, inlinedAt: !3404)
!3434 = !DILocation(line: 70, column: 51, scope: !3432, inlinedAt: !3404)
!3435 = !DILocation(line: 70, column: 47, scope: !3432, inlinedAt: !3404)
!3436 = !DILocalVariable(name: "in", arg: 1, scope: !3437, file: !3401, line: 24, type: !90)
!3437 = distinct !DISubprogram(name: "ef_pack_m_vec", scope: !3401, file: !3401, line: 24, type: !3438, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3438 = !DISubroutineType(types: !3439)
!3439 = !{null, !90, !52, !86}
!3440 = !DILocation(line: 0, scope: !3437, inlinedAt: !3441)
!3441 = distinct !DILocation(line: 70, column: 9, scope: !3432, inlinedAt: !3404)
!3442 = !DILocalVariable(name: "out", arg: 2, scope: !3437, file: !3401, line: 24, type: !52)
!3443 = !DILocalVariable(name: "ncols", arg: 3, scope: !3437, file: !3401, line: 24, type: !86)
!3444 = !DILocalVariable(name: "out8", scope: !3437, file: !3401, line: 26, type: !61)
!3445 = !DILocalVariable(name: "i", scope: !3437, file: !3401, line: 25, type: !86)
!3446 = !DILocation(line: 27, column: 9, scope: !3447, inlinedAt: !3441)
!3447 = distinct !DILexicalBlock(scope: !3437, file: !3401, line: 27, column: 5)
!3448 = !DILocation(line: 27, scope: !3447, inlinedAt: !3441)
!3449 = !DILocation(line: 27, column: 20, scope: !3450, inlinedAt: !3441)
!3450 = distinct !DILexicalBlock(scope: !3447, file: !3401, line: 27, column: 5)
!3451 = !DILocation(line: 27, column: 5, scope: !3447, inlinedAt: !3441)
!3452 = !DILocation(line: 31, column: 23, scope: !3453, inlinedAt: !3441)
!3453 = distinct !DILexicalBlock(scope: !3450, file: !3401, line: 27, column: 36)
!3454 = !DILocation(line: 31, column: 44, scope: !3453, inlinedAt: !3441)
!3455 = !DILocation(line: 31, column: 40, scope: !3453, inlinedAt: !3441)
!3456 = !DILocation(line: 31, column: 48, scope: !3453, inlinedAt: !3441)
!3457 = !DILocation(line: 31, column: 37, scope: !3453, inlinedAt: !3441)
!3458 = !DILocation(line: 31, column: 15, scope: !3453, inlinedAt: !3441)
!3459 = !DILocation(line: 31, column: 9, scope: !3453, inlinedAt: !3441)
!3460 = !DILocation(line: 31, column: 20, scope: !3453, inlinedAt: !3441)
!3461 = !DILocation(line: 27, column: 31, scope: !3450, inlinedAt: !3441)
!3462 = !DILocation(line: 27, column: 5, scope: !3450, inlinedAt: !3441)
!3463 = distinct !{!3463, !3451, !3464, !300}
!3464 = !DILocation(line: 33, column: 5, scope: !3447, inlinedAt: !3441)
!3465 = !DILocation(line: 34, column: 19, scope: !3466, inlinedAt: !3441)
!3466 = distinct !DILexicalBlock(scope: !3437, file: !3401, line: 34, column: 9)
!3467 = !DILocation(line: 38, column: 23, scope: !3468, inlinedAt: !3441)
!3468 = distinct !DILexicalBlock(scope: !3466, file: !3401, line: 34, column: 24)
!3469 = !DILocation(line: 38, column: 15, scope: !3468, inlinedAt: !3441)
!3470 = !DILocation(line: 38, column: 9, scope: !3468, inlinedAt: !3441)
!3471 = !DILocation(line: 38, column: 20, scope: !3468, inlinedAt: !3441)
!3472 = !DILocation(line: 40, column: 5, scope: !3468, inlinedAt: !3441)
!3473 = !DILocation(line: 69, column: 33, scope: !3427, inlinedAt: !3404)
!3474 = !DILocation(line: 69, column: 5, scope: !3427, inlinedAt: !3404)
!3475 = distinct !{!3475, !3428, !3476, !300}
!3476 = !DILocation(line: 71, column: 5, scope: !3422, inlinedAt: !3404)
!3477 = !DILocation(line: 77, scope: !3430, inlinedAt: !3404)
!3478 = !DILocalVariable(name: "pivot_row", scope: !3400, file: !3401, line: 76, type: !86)
!3479 = !DILocalVariable(name: "pivot_col", scope: !3430, file: !3401, line: 77, type: !86)
!3480 = !DILocation(line: 0, scope: !3430, inlinedAt: !3404)
!3481 = !DILocation(line: 77, column: 39, scope: !3482, inlinedAt: !3404)
!3482 = distinct !DILexicalBlock(scope: !3430, file: !3401, line: 77, column: 5)
!3483 = !DILocation(line: 138, column: 5, scope: !3484, inlinedAt: !3404)
!3484 = distinct !DILexicalBlock(scope: !3400, file: !3401, line: 138, column: 5)
!3485 = !DILocation(line: 79, column: 37, scope: !3486, inlinedAt: !3404)
!3486 = distinct !DILexicalBlock(scope: !3482, file: !3401, line: 77, column: 61)
!3487 = !DILocalVariable(name: "pivot_row_lower_bound", scope: !3486, file: !3401, line: 79, type: !86)
!3488 = !DILocation(line: 0, scope: !3486, inlinedAt: !3404)
!3489 = !DILocation(line: 80, column: 37, scope: !3486, inlinedAt: !3404)
!3490 = !DILocalVariable(name: "pivot_row_upper_bound", scope: !3486, file: !3401, line: 80, type: !86)
!3491 = !DILocalVariable(name: "i", scope: !3492, file: !3401, line: 85, type: !86)
!3492 = distinct !DILexicalBlock(scope: !3486, file: !3401, line: 85, column: 9)
!3493 = !DILocation(line: 0, scope: !3492, inlinedAt: !3404)
!3494 = !DILocation(line: 85, column: 14, scope: !3492, inlinedAt: !3404)
!3495 = !DILocation(line: 85, scope: !3492, inlinedAt: !3404)
!3496 = !DILocation(line: 85, column: 27, scope: !3497, inlinedAt: !3404)
!3497 = distinct !DILexicalBlock(scope: !3492, file: !3401, line: 85, column: 9)
!3498 = !DILocation(line: 85, column: 9, scope: !3492, inlinedAt: !3404)
!3499 = !DILocation(line: 93, column: 9, scope: !3500, inlinedAt: !3404)
!3500 = distinct !DILexicalBlock(scope: !3486, file: !3401, line: 93, column: 9)
!3501 = !DILocation(line: 86, column: 13, scope: !3502, inlinedAt: !3404)
!3502 = distinct !DILexicalBlock(scope: !3497, file: !3401, line: 85, column: 43)
!3503 = !DILocation(line: 86, column: 27, scope: !3502, inlinedAt: !3404)
!3504 = !DILocation(line: 87, column: 13, scope: !3502, inlinedAt: !3404)
!3505 = !DILocation(line: 87, column: 28, scope: !3502, inlinedAt: !3404)
!3506 = !DILocation(line: 85, column: 39, scope: !3497, inlinedAt: !3404)
!3507 = !DILocation(line: 85, column: 9, scope: !3497, inlinedAt: !3404)
!3508 = distinct !{!3508, !3498, !3509, !300}
!3509 = !DILocation(line: 88, column: 9, scope: !3492, inlinedAt: !3404)
!3510 = !DILocation(line: 0, scope: !3500, inlinedAt: !3404)
!3511 = !DILocalVariable(name: "row", scope: !3500, file: !3401, line: 93, type: !86)
!3512 = !DILocalVariable(name: "pivot", scope: !3486, file: !3401, line: 91, type: !51)
!3513 = !DILocalVariable(name: "pivot_is_zero", scope: !3486, file: !3401, line: 92, type: !53)
!3514 = !DILocation(line: 94, column: 24, scope: !3515, inlinedAt: !3404)
!3515 = distinct !DILexicalBlock(scope: !3500, file: !3401, line: 93, column: 9)
!3516 = !DILocation(line: 94, column: 21, scope: !3515, inlinedAt: !3404)
!3517 = !DILocalVariable(name: "a", arg: 1, scope: !3518, file: !3519, line: 46, type: !86)
!3518 = distinct !DISubprogram(name: "ct_compare_64", scope: !3519, file: !3519, line: 46, type: !3520, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3519 = !DIFile(filename: "../../../src/arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!3520 = !DISubroutineType(types: !3521)
!3521 = !{!53, !86, !86}
!3522 = !DILocation(line: 0, scope: !3518, inlinedAt: !3523)
!3523 = distinct !DILocation(line: 96, column: 38, scope: !3524, inlinedAt: !3404)
!3524 = distinct !DILexicalBlock(scope: !3515, file: !3401, line: 94, column: 80)
!3525 = !DILocalVariable(name: "b", arg: 2, scope: !3518, file: !3519, line: 46, type: !86)
!3526 = !DILocation(line: 47, column: 38, scope: !3518, inlinedAt: !3523)
!3527 = !DILocation(line: 47, column: 73, scope: !3518, inlinedAt: !3523)
!3528 = !DILocation(line: 96, column: 37, scope: !3524, inlinedAt: !3404)
!3529 = !DILocalVariable(name: "is_pivot_row", scope: !3524, file: !3401, line: 96, type: !53)
!3530 = !DILocation(line: 0, scope: !3524, inlinedAt: !3404)
!3531 = !DILocalVariable(name: "a", arg: 1, scope: !3532, file: !3519, line: 35, type: !86)
!3532 = distinct !DISubprogram(name: "ct_64_is_greater_than", scope: !3519, file: !3519, line: 35, type: !3520, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3533 = !DILocation(line: 0, scope: !3532, inlinedAt: !3534)
!3534 = distinct !DILocation(line: 97, column: 40, scope: !3524, inlinedAt: !3404)
!3535 = !DILocalVariable(name: "b", arg: 2, scope: !3532, file: !3519, line: 35, type: !86)
!3536 = !DILocalVariable(name: "diff", scope: !3532, file: !3519, line: 36, type: !87)
!3537 = !DILocation(line: 37, column: 30, scope: !3532, inlinedAt: !3534)
!3538 = !DILocation(line: 37, column: 59, scope: !3532, inlinedAt: !3534)
!3539 = !DILocation(line: 37, column: 57, scope: !3532, inlinedAt: !3534)
!3540 = !DILocalVariable(name: "below_pivot_row", scope: !3524, file: !3401, line: 97, type: !53)
!3541 = !DILocalVariable(name: "j", scope: !3542, file: !3401, line: 99, type: !86)
!3542 = distinct !DILexicalBlock(scope: !3524, file: !3401, line: 99, column: 13)
!3543 = !DILocation(line: 0, scope: !3542, inlinedAt: !3404)
!3544 = !DILocation(line: 99, column: 18, scope: !3542, inlinedAt: !3404)
!3545 = !DILocation(line: 99, scope: !3542, inlinedAt: !3404)
!3546 = !DILocation(line: 99, column: 31, scope: !3547, inlinedAt: !3404)
!3547 = distinct !DILexicalBlock(scope: !3542, file: !3401, line: 99, column: 13)
!3548 = !DILocation(line: 99, column: 13, scope: !3542, inlinedAt: !3404)
!3549 = !DILocation(line: 100, column: 67, scope: !3550, inlinedAt: !3404)
!3550 = distinct !DILexicalBlock(scope: !3547, file: !3401, line: 99, column: 47)
!3551 = !DILocation(line: 100, column: 48, scope: !3550, inlinedAt: !3404)
!3552 = !DILocation(line: 101, column: 47, scope: !3550, inlinedAt: !3404)
!3553 = !DILocation(line: 101, column: 57, scope: !3550, inlinedAt: !3404)
!3554 = !DILocation(line: 101, column: 34, scope: !3550, inlinedAt: !3404)
!3555 = !DILocation(line: 100, column: 85, scope: !3550, inlinedAt: !3404)
!3556 = !DILocation(line: 100, column: 17, scope: !3550, inlinedAt: !3404)
!3557 = !DILocation(line: 100, column: 31, scope: !3550, inlinedAt: !3404)
!3558 = !DILocation(line: 99, column: 43, scope: !3547, inlinedAt: !3404)
!3559 = !DILocation(line: 99, column: 13, scope: !3547, inlinedAt: !3404)
!3560 = distinct !{!3560, !3548, !3561, !300}
!3561 = !DILocation(line: 102, column: 13, scope: !3542, inlinedAt: !3404)
!3562 = !DILocalVariable(name: "in", arg: 1, scope: !3563, file: !3401, line: 16, type: !488)
!3563 = distinct !DISubprogram(name: "m_extract_element", scope: !3401, file: !3401, line: 16, type: !3564, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3564 = !DISubroutineType(types: !3565)
!3565 = !{!51, !488, !86}
!3566 = !DILocation(line: 0, scope: !3563, inlinedAt: !3567)
!3567 = distinct !DILocation(line: 103, column: 21, scope: !3524, inlinedAt: !3404)
!3568 = !DILocalVariable(name: "index", arg: 2, scope: !3563, file: !3401, line: 16, type: !86)
!3569 = !DILocation(line: 17, column: 27, scope: !3563, inlinedAt: !3567)
!3570 = !DILocalVariable(name: "leg", scope: !3563, file: !3401, line: 17, type: !275)
!3571 = !DILocalVariable(name: "offset", scope: !3563, file: !3401, line: 18, type: !275)
!3572 = !DILocation(line: 20, column: 13, scope: !3563, inlinedAt: !3567)
!3573 = !DILocation(line: 20, column: 31, scope: !3563, inlinedAt: !3567)
!3574 = !DILocation(line: 20, column: 21, scope: !3563, inlinedAt: !3567)
!3575 = !DILocation(line: 20, column: 12, scope: !3563, inlinedAt: !3567)
!3576 = !DILocation(line: 0, scope: !3518, inlinedAt: !3577)
!3577 = distinct !DILocation(line: 104, column: 30, scope: !3524, inlinedAt: !3404)
!3578 = !DILocation(line: 47, column: 73, scope: !3518, inlinedAt: !3577)
!3579 = !DILocation(line: 104, column: 29, scope: !3524, inlinedAt: !3404)
!3580 = !DILocation(line: 94, column: 76, scope: !3515, inlinedAt: !3404)
!3581 = !DILocation(line: 93, column: 9, scope: !3515, inlinedAt: !3404)
!3582 = distinct !{!3582, !3499, !3583, !300}
!3583 = !DILocation(line: 105, column: 9, scope: !3500, inlinedAt: !3404)
!3584 = !DILocalVariable(name: "a", arg: 1, scope: !3585, file: !670, line: 56, type: !51)
!3585 = distinct !DISubprogram(name: "inverse_f", scope: !670, file: !670, line: 56, type: !3586, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3586 = !DISubroutineType(types: !3587)
!3587 = !{!51, !51}
!3588 = !DILocation(line: 0, scope: !3585, inlinedAt: !3589)
!3589 = distinct !DILocation(line: 108, column: 19, scope: !3486, inlinedAt: !3404)
!3590 = !DILocation(line: 0, scope: !3329, inlinedAt: !3591)
!3591 = distinct !DILocation(line: 60, column: 24, scope: !3585, inlinedAt: !3589)
!3592 = !DILocation(line: 13, column: 10, scope: !3329, inlinedAt: !3591)
!3593 = !DILocation(line: 13, column: 7, scope: !3329, inlinedAt: !3591)
!3594 = !DILocation(line: 16, column: 17, scope: !3329, inlinedAt: !3591)
!3595 = !DILocation(line: 17, column: 13, scope: !3329, inlinedAt: !3591)
!3596 = !DILocation(line: 17, column: 17, scope: !3329, inlinedAt: !3591)
!3597 = !DILocation(line: 17, column: 7, scope: !3329, inlinedAt: !3591)
!3598 = !DILocation(line: 18, column: 13, scope: !3329, inlinedAt: !3591)
!3599 = !DILocation(line: 18, column: 17, scope: !3329, inlinedAt: !3591)
!3600 = !DILocation(line: 18, column: 7, scope: !3329, inlinedAt: !3591)
!3601 = !DILocation(line: 19, column: 13, scope: !3329, inlinedAt: !3591)
!3602 = !DILocation(line: 19, column: 17, scope: !3329, inlinedAt: !3591)
!3603 = !DILocation(line: 19, column: 7, scope: !3329, inlinedAt: !3591)
!3604 = !DILocation(line: 23, column: 37, scope: !3329, inlinedAt: !3591)
!3605 = !DILocation(line: 23, column: 52, scope: !3329, inlinedAt: !3591)
!3606 = !DILocation(line: 23, column: 43, scope: !3329, inlinedAt: !3591)
!3607 = !DILocation(line: 23, column: 59, scope: !3329, inlinedAt: !3591)
!3608 = !DILocalVariable(name: "a2", scope: !3585, file: !670, line: 60, type: !51)
!3609 = !DILocation(line: 0, scope: !3329, inlinedAt: !3610)
!3610 = distinct !DILocation(line: 61, column: 24, scope: !3585, inlinedAt: !3589)
!3611 = !DILocation(line: 13, column: 10, scope: !3329, inlinedAt: !3610)
!3612 = !DILocation(line: 13, column: 7, scope: !3329, inlinedAt: !3610)
!3613 = !DILocation(line: 16, column: 17, scope: !3329, inlinedAt: !3610)
!3614 = !DILocation(line: 17, column: 13, scope: !3329, inlinedAt: !3610)
!3615 = !DILocation(line: 17, column: 17, scope: !3329, inlinedAt: !3610)
!3616 = !DILocation(line: 17, column: 7, scope: !3329, inlinedAt: !3610)
!3617 = !DILocation(line: 18, column: 13, scope: !3329, inlinedAt: !3610)
!3618 = !DILocation(line: 18, column: 17, scope: !3329, inlinedAt: !3610)
!3619 = !DILocation(line: 18, column: 7, scope: !3329, inlinedAt: !3610)
!3620 = !DILocation(line: 19, column: 13, scope: !3329, inlinedAt: !3610)
!3621 = !DILocation(line: 19, column: 17, scope: !3329, inlinedAt: !3610)
!3622 = !DILocation(line: 19, column: 7, scope: !3329, inlinedAt: !3610)
!3623 = !DILocation(line: 23, column: 37, scope: !3329, inlinedAt: !3610)
!3624 = !DILocation(line: 23, column: 52, scope: !3329, inlinedAt: !3610)
!3625 = !DILocation(line: 23, column: 43, scope: !3329, inlinedAt: !3610)
!3626 = !DILocation(line: 23, column: 59, scope: !3329, inlinedAt: !3610)
!3627 = !DILocalVariable(name: "a4", scope: !3585, file: !670, line: 61, type: !51)
!3628 = !DILocation(line: 0, scope: !3329, inlinedAt: !3629)
!3629 = distinct !DILocation(line: 62, column: 24, scope: !3585, inlinedAt: !3589)
!3630 = !DILocation(line: 13, column: 10, scope: !3329, inlinedAt: !3629)
!3631 = !DILocation(line: 13, column: 7, scope: !3329, inlinedAt: !3629)
!3632 = !DILocation(line: 16, column: 17, scope: !3329, inlinedAt: !3629)
!3633 = !DILocation(line: 17, column: 13, scope: !3329, inlinedAt: !3629)
!3634 = !DILocation(line: 17, column: 17, scope: !3329, inlinedAt: !3629)
!3635 = !DILocation(line: 17, column: 7, scope: !3329, inlinedAt: !3629)
!3636 = !DILocation(line: 18, column: 13, scope: !3329, inlinedAt: !3629)
!3637 = !DILocation(line: 18, column: 17, scope: !3329, inlinedAt: !3629)
!3638 = !DILocation(line: 18, column: 7, scope: !3329, inlinedAt: !3629)
!3639 = !DILocation(line: 19, column: 13, scope: !3329, inlinedAt: !3629)
!3640 = !DILocation(line: 19, column: 17, scope: !3329, inlinedAt: !3629)
!3641 = !DILocation(line: 19, column: 7, scope: !3329, inlinedAt: !3629)
!3642 = !DILocation(line: 23, column: 37, scope: !3329, inlinedAt: !3629)
!3643 = !DILocation(line: 23, column: 52, scope: !3329, inlinedAt: !3629)
!3644 = !DILocation(line: 23, column: 43, scope: !3329, inlinedAt: !3629)
!3645 = !DILocation(line: 23, column: 59, scope: !3329, inlinedAt: !3629)
!3646 = !DILocalVariable(name: "a8", scope: !3585, file: !670, line: 62, type: !51)
!3647 = !DILocation(line: 0, scope: !3329, inlinedAt: !3648)
!3648 = distinct !DILocation(line: 63, column: 24, scope: !3585, inlinedAt: !3589)
!3649 = !DILocation(line: 13, column: 10, scope: !3329, inlinedAt: !3648)
!3650 = !DILocation(line: 13, column: 7, scope: !3329, inlinedAt: !3648)
!3651 = !DILocation(line: 16, column: 17, scope: !3329, inlinedAt: !3648)
!3652 = !DILocation(line: 17, column: 13, scope: !3329, inlinedAt: !3648)
!3653 = !DILocation(line: 17, column: 17, scope: !3329, inlinedAt: !3648)
!3654 = !DILocation(line: 17, column: 7, scope: !3329, inlinedAt: !3648)
!3655 = !DILocation(line: 18, column: 13, scope: !3329, inlinedAt: !3648)
!3656 = !DILocation(line: 18, column: 17, scope: !3329, inlinedAt: !3648)
!3657 = !DILocation(line: 18, column: 7, scope: !3329, inlinedAt: !3648)
!3658 = !DILocation(line: 19, column: 13, scope: !3329, inlinedAt: !3648)
!3659 = !DILocation(line: 19, column: 17, scope: !3329, inlinedAt: !3648)
!3660 = !DILocation(line: 19, column: 7, scope: !3329, inlinedAt: !3648)
!3661 = !DILocation(line: 23, column: 37, scope: !3329, inlinedAt: !3648)
!3662 = !DILocation(line: 23, column: 52, scope: !3329, inlinedAt: !3648)
!3663 = !DILocation(line: 23, column: 43, scope: !3329, inlinedAt: !3648)
!3664 = !DILocation(line: 23, column: 59, scope: !3329, inlinedAt: !3648)
!3665 = !DILocalVariable(name: "a6", scope: !3585, file: !670, line: 63, type: !51)
!3666 = !DILocation(line: 0, scope: !3329, inlinedAt: !3667)
!3667 = distinct !DILocation(line: 64, column: 25, scope: !3585, inlinedAt: !3589)
!3668 = !DILocation(line: 13, column: 10, scope: !3329, inlinedAt: !3667)
!3669 = !DILocation(line: 13, column: 7, scope: !3329, inlinedAt: !3667)
!3670 = !DILocation(line: 16, column: 17, scope: !3329, inlinedAt: !3667)
!3671 = !DILocation(line: 17, column: 13, scope: !3329, inlinedAt: !3667)
!3672 = !DILocation(line: 17, column: 17, scope: !3329, inlinedAt: !3667)
!3673 = !DILocation(line: 17, column: 7, scope: !3329, inlinedAt: !3667)
!3674 = !DILocation(line: 18, column: 13, scope: !3329, inlinedAt: !3667)
!3675 = !DILocation(line: 18, column: 17, scope: !3329, inlinedAt: !3667)
!3676 = !DILocation(line: 18, column: 7, scope: !3329, inlinedAt: !3667)
!3677 = !DILocation(line: 19, column: 13, scope: !3329, inlinedAt: !3667)
!3678 = !DILocation(line: 19, column: 17, scope: !3329, inlinedAt: !3667)
!3679 = !DILocation(line: 19, column: 7, scope: !3329, inlinedAt: !3667)
!3680 = !DILocation(line: 23, column: 37, scope: !3329, inlinedAt: !3667)
!3681 = !DILocation(line: 23, column: 52, scope: !3329, inlinedAt: !3667)
!3682 = !DILocation(line: 23, column: 43, scope: !3329, inlinedAt: !3667)
!3683 = !DILocation(line: 23, column: 59, scope: !3329, inlinedAt: !3667)
!3684 = !DILocalVariable(name: "a14", scope: !3585, file: !670, line: 64, type: !51)
!3685 = !DILocalVariable(name: "inverse", scope: !3400, file: !3401, line: 75, type: !51)
!3686 = !DILocation(line: 109, column: 9, scope: !3486, inlinedAt: !3404)
!3687 = !DILocalVariable(name: "row", scope: !3688, file: !3401, line: 113, type: !86)
!3688 = distinct !DILexicalBlock(scope: !3486, file: !3401, line: 113, column: 9)
!3689 = !DILocation(line: 0, scope: !3688, inlinedAt: !3404)
!3690 = !DILocation(line: 113, column: 14, scope: !3688, inlinedAt: !3404)
!3691 = !DILocation(line: 113, scope: !3688, inlinedAt: !3404)
!3692 = !DILocation(line: 113, column: 51, scope: !3693, inlinedAt: !3404)
!3693 = distinct !DILexicalBlock(scope: !3688, file: !3401, line: 113, column: 9)
!3694 = !DILocation(line: 113, column: 9, scope: !3688, inlinedAt: !3404)
!3695 = !DILocation(line: 124, column: 9, scope: !3696, inlinedAt: !3404)
!3696 = distinct !DILexicalBlock(scope: !3486, file: !3401, line: 124, column: 9)
!3697 = !DILocation(line: 0, scope: !3518, inlinedAt: !3698)
!3698 = distinct !DILocation(line: 114, column: 33, scope: !3699, inlinedAt: !3404)
!3699 = distinct !DILexicalBlock(scope: !3693, file: !3401, line: 113, column: 84)
!3700 = !DILocation(line: 47, column: 38, scope: !3518, inlinedAt: !3698)
!3701 = !DILocation(line: 47, column: 44, scope: !3518, inlinedAt: !3698)
!3702 = !DILocation(line: 47, column: 73, scope: !3518, inlinedAt: !3698)
!3703 = !DILocation(line: 47, column: 71, scope: !3518, inlinedAt: !3698)
!3704 = !DILocation(line: 114, column: 63, scope: !3699, inlinedAt: !3404)
!3705 = !DILocalVariable(name: "do_copy", scope: !3699, file: !3401, line: 114, type: !53)
!3706 = !DILocation(line: 0, scope: !3699, inlinedAt: !3404)
!3707 = !DILocalVariable(name: "do_not_copy", scope: !3699, file: !3401, line: 115, type: !53)
!3708 = !DILocalVariable(name: "col", scope: !3709, file: !3401, line: 116, type: !86)
!3709 = distinct !DILexicalBlock(scope: !3699, file: !3401, line: 116, column: 13)
!3710 = !DILocation(line: 0, scope: !3709, inlinedAt: !3404)
!3711 = !DILocation(line: 116, column: 18, scope: !3709, inlinedAt: !3404)
!3712 = !DILocation(line: 116, scope: !3709, inlinedAt: !3404)
!3713 = !DILocation(line: 116, column: 35, scope: !3714, inlinedAt: !3404)
!3714 = distinct !DILexicalBlock(scope: !3709, file: !3401, line: 116, column: 13)
!3715 = !DILocation(line: 116, column: 13, scope: !3709, inlinedAt: !3404)
!3716 = !DILocation(line: 118, column: 49, scope: !3717, inlinedAt: !3404)
!3717 = distinct !DILexicalBlock(scope: !3714, file: !3401, line: 116, column: 53)
!3718 = !DILocation(line: 118, column: 59, scope: !3717, inlinedAt: !3404)
!3719 = !DILocation(line: 118, column: 36, scope: !3717, inlinedAt: !3404)
!3720 = !DILocation(line: 118, column: 34, scope: !3717, inlinedAt: !3404)
!3721 = !DILocation(line: 119, column: 32, scope: !3717, inlinedAt: !3404)
!3722 = !DILocation(line: 119, column: 30, scope: !3717, inlinedAt: !3404)
!3723 = !DILocation(line: 118, column: 67, scope: !3717, inlinedAt: !3404)
!3724 = !DILocation(line: 117, column: 30, scope: !3717, inlinedAt: !3404)
!3725 = !DILocation(line: 117, column: 40, scope: !3717, inlinedAt: !3404)
!3726 = !DILocation(line: 117, column: 17, scope: !3717, inlinedAt: !3404)
!3727 = !DILocation(line: 117, column: 47, scope: !3717, inlinedAt: !3404)
!3728 = !DILocation(line: 116, column: 49, scope: !3714, inlinedAt: !3404)
!3729 = !DILocation(line: 116, column: 13, scope: !3714, inlinedAt: !3404)
!3730 = distinct !{!3730, !3715, !3731, !300}
!3731 = !DILocation(line: 120, column: 13, scope: !3709, inlinedAt: !3404)
!3732 = !DILocation(line: 113, column: 80, scope: !3693, inlinedAt: !3404)
!3733 = !DILocation(line: 113, column: 9, scope: !3693, inlinedAt: !3404)
!3734 = distinct !{!3734, !3694, !3735, !300}
!3735 = !DILocation(line: 121, column: 9, scope: !3688, inlinedAt: !3404)
!3736 = !DILocation(line: 124, scope: !3696, inlinedAt: !3404)
!3737 = !DILocalVariable(name: "row", scope: !3696, file: !3401, line: 124, type: !86)
!3738 = !DILocation(line: 0, scope: !3696, inlinedAt: !3404)
!3739 = !DILocation(line: 124, column: 51, scope: !3740, inlinedAt: !3404)
!3740 = distinct !DILexicalBlock(scope: !3696, file: !3401, line: 124, column: 9)
!3741 = !DILocation(line: 125, column: 46, scope: !3742, inlinedAt: !3404)
!3742 = distinct !DILexicalBlock(scope: !3740, file: !3401, line: 124, column: 67)
!3743 = !DILocalVariable(name: "below_pivot", scope: !3742, file: !3401, line: 125, type: !51)
!3744 = !DILocation(line: 0, scope: !3742, inlinedAt: !3404)
!3745 = !DILocation(line: 126, column: 74, scope: !3742, inlinedAt: !3404)
!3746 = !DILocation(line: 126, column: 68, scope: !3742, inlinedAt: !3404)
!3747 = !DILocation(line: 0, scope: !3563, inlinedAt: !3748)
!3748 = distinct !DILocation(line: 126, column: 41, scope: !3742, inlinedAt: !3404)
!3749 = !DILocation(line: 17, column: 27, scope: !3563, inlinedAt: !3748)
!3750 = !DILocation(line: 20, column: 13, scope: !3563, inlinedAt: !3748)
!3751 = !DILocation(line: 20, column: 31, scope: !3563, inlinedAt: !3748)
!3752 = !DILocation(line: 20, column: 21, scope: !3563, inlinedAt: !3748)
!3753 = !DILocation(line: 20, column: 12, scope: !3563, inlinedAt: !3748)
!3754 = !DILocalVariable(name: "elt_to_elim", scope: !3742, file: !3401, line: 126, type: !51)
!3755 = !DILocation(line: 128, column: 63, scope: !3742, inlinedAt: !3404)
!3756 = !DILocation(line: 129, column: 52, scope: !3742, inlinedAt: !3404)
!3757 = !DILocation(line: 129, column: 46, scope: !3742, inlinedAt: !3404)
!3758 = !DILocation(line: 128, column: 13, scope: !3742, inlinedAt: !3404)
!3759 = !DILocation(line: 124, column: 63, scope: !3740, inlinedAt: !3404)
!3760 = !DILocation(line: 124, column: 9, scope: !3740, inlinedAt: !3404)
!3761 = distinct !{!3761, !3695, !3762, !300}
!3762 = !DILocation(line: 130, column: 9, scope: !3696, inlinedAt: !3404)
!3763 = !DILocation(line: 132, column: 19, scope: !3486, inlinedAt: !3404)
!3764 = !DILocation(line: 77, column: 57, scope: !3482, inlinedAt: !3404)
!3765 = !DILocation(line: 77, column: 5, scope: !3482, inlinedAt: !3404)
!3766 = distinct !{!3766, !3429, !3767, !300}
!3767 = !DILocation(line: 133, column: 5, scope: !3430, inlinedAt: !3404)
!3768 = !DILocation(line: 138, scope: !3484, inlinedAt: !3404)
!3769 = !DILocalVariable(name: "i", scope: !3484, file: !3401, line: 138, type: !86)
!3770 = !DILocation(line: 0, scope: !3484, inlinedAt: !3404)
!3771 = !DILocation(line: 138, column: 23, scope: !3772, inlinedAt: !3404)
!3772 = distinct !DILexicalBlock(scope: !3484, file: !3401, line: 138, column: 5)
!3773 = !DILocation(line: 139, column: 47, scope: !3774, inlinedAt: !3404)
!3774 = distinct !DILexicalBlock(scope: !3772, file: !3401, line: 138, column: 37)
!3775 = !DILocation(line: 139, column: 43, scope: !3774, inlinedAt: !3404)
!3776 = !DILocalVariable(name: "legs", arg: 1, scope: !3777, file: !3401, line: 44, type: !86)
!3777 = distinct !DISubprogram(name: "ef_unpack_m_vec", scope: !3401, file: !3401, line: 44, type: !3778, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3778 = !DISubroutineType(types: !3779)
!3779 = !{null, !86, !488, !61}
!3780 = !DILocation(line: 0, scope: !3777, inlinedAt: !3781)
!3781 = distinct !DILocation(line: 139, column: 9, scope: !3774, inlinedAt: !3404)
!3782 = !DILocalVariable(name: "in", arg: 2, scope: !3777, file: !3401, line: 44, type: !488)
!3783 = !DILocalVariable(name: "out", arg: 3, scope: !3777, file: !3401, line: 44, type: !61)
!3784 = !DILocalVariable(name: "in8", scope: !3777, file: !3401, line: 45, type: !90)
!3785 = !DILocalVariable(name: "i", scope: !3786, file: !3401, line: 46, type: !86)
!3786 = distinct !DILexicalBlock(scope: !3777, file: !3401, line: 46, column: 5)
!3787 = !DILocation(line: 0, scope: !3786, inlinedAt: !3781)
!3788 = !DILocation(line: 46, column: 9, scope: !3786, inlinedAt: !3781)
!3789 = !DILocation(line: 46, scope: !3786, inlinedAt: !3781)
!3790 = !DILocation(line: 46, column: 29, scope: !3791, inlinedAt: !3781)
!3791 = distinct !DILexicalBlock(scope: !3786, file: !3401, line: 46, column: 5)
!3792 = !DILocation(line: 46, column: 22, scope: !3791, inlinedAt: !3781)
!3793 = !DILocation(line: 46, column: 5, scope: !3786, inlinedAt: !3781)
!3794 = !DILocation(line: 140, column: 9, scope: !3795, inlinedAt: !3404)
!3795 = distinct !DILexicalBlock(scope: !3774, file: !3401, line: 140, column: 9)
!3796 = !DILocation(line: 51, column: 26, scope: !3797, inlinedAt: !3781)
!3797 = distinct !DILexicalBlock(scope: !3791, file: !3401, line: 46, column: 42)
!3798 = !DILocation(line: 51, column: 21, scope: !3797, inlinedAt: !3781)
!3799 = !DILocation(line: 51, column: 31, scope: !3797, inlinedAt: !3781)
!3800 = !DILocation(line: 51, column: 9, scope: !3797, inlinedAt: !3781)
!3801 = !DILocation(line: 51, column: 18, scope: !3797, inlinedAt: !3781)
!3802 = !DILocation(line: 52, column: 26, scope: !3797, inlinedAt: !3781)
!3803 = !DILocation(line: 52, column: 21, scope: !3797, inlinedAt: !3781)
!3804 = !DILocation(line: 52, column: 30, scope: !3797, inlinedAt: !3781)
!3805 = !DILocation(line: 52, column: 14, scope: !3797, inlinedAt: !3781)
!3806 = !DILocation(line: 52, column: 9, scope: !3797, inlinedAt: !3781)
!3807 = !DILocation(line: 52, column: 18, scope: !3797, inlinedAt: !3781)
!3808 = !DILocation(line: 46, column: 37, scope: !3791, inlinedAt: !3781)
!3809 = !DILocation(line: 46, column: 5, scope: !3791, inlinedAt: !3781)
!3810 = distinct !{!3810, !3793, !3811, !300}
!3811 = !DILocation(line: 54, column: 5, scope: !3786, inlinedAt: !3781)
!3812 = !DILocation(line: 140, scope: !3795, inlinedAt: !3404)
!3813 = !DILocalVariable(name: "j", scope: !3795, file: !3401, line: 140, type: !86)
!3814 = !DILocation(line: 0, scope: !3795, inlinedAt: !3404)
!3815 = !DILocation(line: 140, column: 27, scope: !3816, inlinedAt: !3404)
!3816 = distinct !DILexicalBlock(scope: !3795, file: !3401, line: 140, column: 9)
!3817 = !DILocation(line: 141, column: 32, scope: !3818, inlinedAt: !3404)
!3818 = distinct !DILexicalBlock(scope: !3816, file: !3401, line: 140, column: 41)
!3819 = !DILocation(line: 141, column: 17, scope: !3818, inlinedAt: !3404)
!3820 = !DILocation(line: 141, column: 13, scope: !3818, inlinedAt: !3404)
!3821 = !DILocation(line: 141, column: 30, scope: !3818, inlinedAt: !3404)
!3822 = !DILocation(line: 140, column: 37, scope: !3816, inlinedAt: !3404)
!3823 = !DILocation(line: 140, column: 9, scope: !3816, inlinedAt: !3404)
!3824 = distinct !{!3824, !3794, !3825, !300}
!3825 = !DILocation(line: 142, column: 9, scope: !3795, inlinedAt: !3404)
!3826 = !DILocation(line: 138, column: 33, scope: !3772, inlinedAt: !3404)
!3827 = !DILocation(line: 138, column: 5, scope: !3772, inlinedAt: !3404)
!3828 = distinct !{!3828, !3483, !3829, !300}
!3829 = !DILocation(line: 143, column: 5, scope: !3484, inlinedAt: !3404)
!3830 = !DILocation(line: 145, column: 5, scope: !3400, inlinedAt: !3404)
!3831 = !DILocation(line: 146, column: 5, scope: !3400, inlinedAt: !3404)
!3832 = !DILocation(line: 147, column: 5, scope: !3400, inlinedAt: !3404)
!3833 = !DILocation(line: 148, column: 5, scope: !3400, inlinedAt: !3404)
!3834 = !DILocation(line: 149, column: 1, scope: !3400, inlinedAt: !3404)
!3835 = !DILocalVariable(name: "full_rank", scope: !3232, file: !99, line: 70, type: !51)
!3836 = !DILocalVariable(name: "i", scope: !3837, file: !99, line: 71, type: !86)
!3837 = distinct !DILexicalBlock(scope: !3232, file: !99, line: 71, column: 5)
!3838 = !DILocation(line: 0, scope: !3837)
!3839 = !DILocation(line: 71, column: 10, scope: !3837)
!3840 = !DILocation(line: 71, scope: !3837)
!3841 = !DILocation(line: 71, column: 23, scope: !3842)
!3842 = distinct !DILexicalBlock(scope: !3837, file: !99, line: 71, column: 5)
!3843 = !DILocation(line: 71, column: 5, scope: !3837)
!3844 = !DILocation(line: 72, column: 27, scope: !3845)
!3845 = distinct !DILexicalBlock(scope: !3842, file: !99, line: 71, column: 42)
!3846 = !DILocation(line: 72, column: 32, scope: !3845)
!3847 = !DILocation(line: 72, column: 22, scope: !3845)
!3848 = !DILocation(line: 72, column: 19, scope: !3845)
!3849 = !DILocation(line: 71, column: 38, scope: !3842)
!3850 = !DILocation(line: 71, column: 5, scope: !3842)
!3851 = distinct !{!3851, !3843, !3852, !300}
!3852 = !DILocation(line: 73, column: 5, scope: !3837)
!3853 = !DILocation(line: 80, column: 19, scope: !3854)
!3854 = distinct !DILexicalBlock(scope: !3232, file: !99, line: 80, column: 9)
!3855 = !DILocation(line: 88, column: 5, scope: !3856)
!3856 = distinct !DILexicalBlock(scope: !3232, file: !99, line: 88, column: 5)
!3857 = distinct !{!3857, !3855, !3858, !300}
!3858 = !DILocation(line: 122, column: 5, scope: !3856)
!3859 = !DILocation(line: 88, scope: !3856)
!3860 = !DILocalVariable(name: "row", scope: !3856, file: !99, line: 88, type: !86)
!3861 = !DILocation(line: 0, scope: !3856)
!3862 = !DILocation(line: 88, column: 31, scope: !3863)
!3863 = distinct !DILexicalBlock(scope: !3856, file: !99, line: 88, column: 5)
!3864 = !DILocalVariable(name: "finished", scope: !3232, file: !99, line: 46, type: !51)
!3865 = !DILocation(line: 90, column: 27, scope: !3866)
!3866 = distinct !DILexicalBlock(scope: !3863, file: !99, line: 88, column: 44)
!3867 = !DILocalVariable(name: "col_upper_bound", scope: !3232, file: !99, line: 47, type: !86)
!3868 = !DILocalVariable(name: "col", scope: !3869, file: !99, line: 93, type: !86)
!3869 = distinct !DILexicalBlock(scope: !3866, file: !99, line: 93, column: 9)
!3870 = !DILocation(line: 0, scope: !3869)
!3871 = !DILocation(line: 93, column: 14, scope: !3869)
!3872 = !DILocation(line: 0, scope: !3866)
!3873 = !DILocation(line: 93, scope: !3869)
!3874 = !DILocation(line: 93, column: 33, scope: !3875)
!3875 = distinct !DILexicalBlock(scope: !3869, file: !99, line: 93, column: 9)
!3876 = !DILocation(line: 93, column: 9, scope: !3869)
!3877 = !DILocation(line: 97, column: 50, scope: !3878)
!3878 = distinct !DILexicalBlock(scope: !3875, file: !99, line: 93, column: 60)
!3879 = !DILocation(line: 97, column: 44, scope: !3878)
!3880 = !DILocalVariable(name: "a", arg: 1, scope: !3881, file: !3519, line: 51, type: !51)
!3881 = distinct !DISubprogram(name: "ct_compare_8", scope: !3519, file: !3519, line: 51, type: !1542, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3882 = !DILocation(line: 0, scope: !3881, inlinedAt: !3883)
!3883 = distinct !DILocation(line: 97, column: 30, scope: !3878)
!3884 = !DILocalVariable(name: "b", arg: 2, scope: !3881, file: !3519, line: 51, type: !51)
!3885 = !DILocation(line: 52, column: 42, scope: !3881, inlinedAt: !3883)
!3886 = !DILocation(line: 52, column: 13, scope: !3881, inlinedAt: !3883)
!3887 = !DILocation(line: 52, column: 71, scope: !3881, inlinedAt: !3883)
!3888 = !DILocation(line: 52, column: 69, scope: !3881, inlinedAt: !3883)
!3889 = !DILocation(line: 97, column: 73, scope: !3878)
!3890 = !DILocalVariable(name: "correct_column", scope: !3232, file: !99, line: 48, type: !51)
!3891 = !DILocation(line: 99, column: 63, scope: !3878)
!3892 = !DILocation(line: 99, column: 48, scope: !3878)
!3893 = !DILocation(line: 99, column: 46, scope: !3878)
!3894 = !DILocalVariable(name: "u", scope: !3878, file: !99, line: 99, type: !51)
!3895 = !DILocation(line: 0, scope: !3878)
!3896 = !DILocation(line: 100, column: 13, scope: !3878)
!3897 = !DILocation(line: 100, column: 20, scope: !3878)
!3898 = !DILocalVariable(name: "i", scope: !3899, file: !99, line: 102, type: !86)
!3899 = distinct !DILexicalBlock(scope: !3878, file: !99, line: 102, column: 13)
!3900 = !DILocation(line: 0, scope: !3899)
!3901 = !DILocation(line: 102, column: 18, scope: !3899)
!3902 = !DILocation(line: 102, scope: !3899)
!3903 = !DILocation(line: 102, column: 31, scope: !3904)
!3904 = distinct !DILexicalBlock(scope: !3899, file: !99, line: 102, column: 13)
!3905 = !DILocation(line: 102, column: 13, scope: !3899)
!3906 = !DILocation(line: 103, column: 53, scope: !3907)
!3907 = distinct !DILexicalBlock(scope: !3904, file: !99, line: 102, column: 46)
!3908 = !DILocation(line: 103, column: 45, scope: !3907)
!3909 = !DILocation(line: 103, column: 34, scope: !3907)
!3910 = !DILocation(line: 103, column: 95, scope: !3907)
!3911 = !DILocation(line: 103, column: 99, scope: !3907)
!3912 = !DILocation(line: 103, column: 91, scope: !3907)
!3913 = !DILocation(line: 103, column: 80, scope: !3907)
!3914 = !DILocation(line: 103, column: 115, scope: !3907)
!3915 = !DILocation(line: 103, column: 76, scope: !3907)
!3916 = !DILocation(line: 104, column: 49, scope: !3907)
!3917 = !DILocation(line: 104, column: 53, scope: !3907)
!3918 = !DILocation(line: 104, column: 45, scope: !3907)
!3919 = !DILocation(line: 104, column: 34, scope: !3907)
!3920 = !DILocation(line: 104, column: 69, scope: !3907)
!3921 = !DILocation(line: 104, column: 30, scope: !3907)
!3922 = !DILocation(line: 104, column: 95, scope: !3907)
!3923 = !DILocation(line: 104, column: 99, scope: !3907)
!3924 = !DILocation(line: 104, column: 91, scope: !3907)
!3925 = !DILocation(line: 104, column: 80, scope: !3907)
!3926 = !DILocation(line: 104, column: 115, scope: !3907)
!3927 = !DILocation(line: 104, column: 76, scope: !3907)
!3928 = !DILocation(line: 105, column: 49, scope: !3907)
!3929 = !DILocation(line: 105, column: 53, scope: !3907)
!3930 = !DILocation(line: 105, column: 45, scope: !3907)
!3931 = !DILocation(line: 105, column: 34, scope: !3907)
!3932 = !DILocation(line: 105, column: 69, scope: !3907)
!3933 = !DILocation(line: 105, column: 30, scope: !3907)
!3934 = !DILocation(line: 105, column: 95, scope: !3907)
!3935 = !DILocation(line: 105, column: 99, scope: !3907)
!3936 = !DILocation(line: 105, column: 91, scope: !3907)
!3937 = !DILocation(line: 105, column: 80, scope: !3907)
!3938 = !DILocation(line: 105, column: 115, scope: !3907)
!3939 = !DILocation(line: 105, column: 76, scope: !3907)
!3940 = !DILocation(line: 106, column: 49, scope: !3907)
!3941 = !DILocation(line: 106, column: 53, scope: !3907)
!3942 = !DILocation(line: 106, column: 45, scope: !3907)
!3943 = !DILocation(line: 106, column: 34, scope: !3907)
!3944 = !DILocation(line: 106, column: 69, scope: !3907)
!3945 = !DILocation(line: 106, column: 30, scope: !3907)
!3946 = !DILocation(line: 106, column: 95, scope: !3907)
!3947 = !DILocation(line: 106, column: 99, scope: !3907)
!3948 = !DILocation(line: 106, column: 91, scope: !3907)
!3949 = !DILocation(line: 106, column: 80, scope: !3907)
!3950 = !DILocation(line: 106, column: 115, scope: !3907)
!3951 = !DILocation(line: 106, column: 76, scope: !3907)
!3952 = !DILocalVariable(name: "tmp", scope: !3907, file: !99, line: 103, type: !53)
!3953 = !DILocation(line: 0, scope: !3907)
!3954 = !DILocalVariable(name: "a", arg: 1, scope: !3955, file: !670, line: 27, type: !51)
!3955 = distinct !DISubprogram(name: "mul_fx8", scope: !670, file: !670, line: 27, type: !3956, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3956 = !DISubroutineType(types: !3957)
!3957 = !{!53, !51, !53}
!3958 = !DILocation(line: 0, scope: !3955, inlinedAt: !3959)
!3959 = distinct !DILocation(line: 108, column: 23, scope: !3907)
!3960 = !DILocalVariable(name: "b", arg: 2, scope: !3955, file: !670, line: 27, type: !53)
!3961 = !DILocation(line: 30, column: 13, scope: !3955, inlinedAt: !3959)
!3962 = !DILocation(line: 30, column: 10, scope: !3955, inlinedAt: !3959)
!3963 = !DILocation(line: 30, column: 17, scope: !3955, inlinedAt: !3959)
!3964 = !DILocalVariable(name: "p", scope: !3955, file: !670, line: 29, type: !53)
!3965 = !DILocation(line: 31, column: 13, scope: !3955, inlinedAt: !3959)
!3966 = !DILocation(line: 31, column: 10, scope: !3955, inlinedAt: !3959)
!3967 = !DILocation(line: 31, column: 17, scope: !3955, inlinedAt: !3959)
!3968 = !DILocation(line: 31, column: 7, scope: !3955, inlinedAt: !3959)
!3969 = !DILocation(line: 32, column: 13, scope: !3955, inlinedAt: !3959)
!3970 = !DILocation(line: 32, column: 10, scope: !3955, inlinedAt: !3959)
!3971 = !DILocation(line: 32, column: 17, scope: !3955, inlinedAt: !3959)
!3972 = !DILocation(line: 32, column: 7, scope: !3955, inlinedAt: !3959)
!3973 = !DILocation(line: 33, column: 13, scope: !3955, inlinedAt: !3959)
!3974 = !DILocation(line: 33, column: 10, scope: !3955, inlinedAt: !3959)
!3975 = !DILocation(line: 33, column: 17, scope: !3955, inlinedAt: !3959)
!3976 = !DILocation(line: 33, column: 7, scope: !3955, inlinedAt: !3959)
!3977 = !DILocalVariable(name: "top_p", scope: !3955, file: !670, line: 36, type: !53)
!3978 = !DILocation(line: 37, column: 32, scope: !3955, inlinedAt: !3959)
!3979 = !DILocation(line: 37, column: 47, scope: !3955, inlinedAt: !3959)
!3980 = !DILocation(line: 37, column: 38, scope: !3955, inlinedAt: !3959)
!3981 = !DILocalVariable(name: "out", scope: !3955, file: !670, line: 37, type: !53)
!3982 = !DILocation(line: 110, column: 34, scope: !3907)
!3983 = !DILocation(line: 110, column: 17, scope: !3907)
!3984 = !DILocation(line: 110, column: 48, scope: !3907)
!3985 = !DILocation(line: 111, column: 56, scope: !3907)
!3986 = !DILocation(line: 111, column: 34, scope: !3907)
!3987 = !DILocation(line: 111, column: 17, scope: !3907)
!3988 = !DILocation(line: 111, column: 48, scope: !3907)
!3989 = !DILocation(line: 112, column: 56, scope: !3907)
!3990 = !DILocation(line: 112, column: 34, scope: !3907)
!3991 = !DILocation(line: 112, column: 17, scope: !3907)
!3992 = !DILocation(line: 112, column: 48, scope: !3907)
!3993 = !DILocation(line: 113, column: 56, scope: !3907)
!3994 = !DILocation(line: 113, column: 34, scope: !3907)
!3995 = !DILocation(line: 113, column: 17, scope: !3907)
!3996 = !DILocation(line: 113, column: 48, scope: !3907)
!3997 = !DILocation(line: 114, column: 56, scope: !3907)
!3998 = !DILocation(line: 114, column: 34, scope: !3907)
!3999 = !DILocation(line: 114, column: 17, scope: !3907)
!4000 = !DILocation(line: 114, column: 48, scope: !3907)
!4001 = !DILocation(line: 115, column: 56, scope: !3907)
!4002 = !DILocation(line: 115, column: 34, scope: !3907)
!4003 = !DILocation(line: 115, column: 17, scope: !3907)
!4004 = !DILocation(line: 115, column: 48, scope: !3907)
!4005 = !DILocation(line: 116, column: 56, scope: !3907)
!4006 = !DILocation(line: 116, column: 34, scope: !3907)
!4007 = !DILocation(line: 116, column: 17, scope: !3907)
!4008 = !DILocation(line: 116, column: 48, scope: !3907)
!4009 = !DILocation(line: 117, column: 56, scope: !3907)
!4010 = !DILocation(line: 117, column: 34, scope: !3907)
!4011 = !DILocation(line: 117, column: 17, scope: !3907)
!4012 = !DILocation(line: 117, column: 48, scope: !3907)
!4013 = !DILocation(line: 102, column: 40, scope: !3904)
!4014 = !DILocation(line: 102, column: 13, scope: !3904)
!4015 = distinct !{!4015, !3905, !4016, !300}
!4016 = !DILocation(line: 118, column: 13, scope: !3899)
!4017 = !DILocation(line: 120, column: 33, scope: !3878)
!4018 = !DILocation(line: 93, column: 56, scope: !3875)
!4019 = !DILocation(line: 93, column: 9, scope: !3875)
!4020 = distinct !{!4020, !3876, !4021, !300}
!4021 = !DILocation(line: 121, column: 9, scope: !3869)
!4022 = !DILocation(line: 124, column: 1, scope: !3232)
!4023 = distinct !DISubprogram(name: "vec_mul_add_u64", scope: !3519, file: !3519, line: 94, type: !4024, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!4024 = !DISubroutineType(types: !4025)
!4025 = !{null, !275, !488, !51, !52}
!4026 = !DILocalVariable(name: "legs", arg: 1, scope: !4023, file: !3519, line: 94, type: !275)
!4027 = !DILocation(line: 0, scope: !4023)
!4028 = !DILocalVariable(name: "in", arg: 2, scope: !4023, file: !3519, line: 94, type: !488)
!4029 = !DILocalVariable(name: "a", arg: 3, scope: !4023, file: !3519, line: 94, type: !51)
!4030 = !DILocalVariable(name: "acc", arg: 4, scope: !4023, file: !3519, line: 94, type: !52)
!4031 = !DILocalVariable(name: "b", arg: 1, scope: !4032, file: !670, line: 128, type: !174)
!4032 = distinct !DISubprogram(name: "mul_table", scope: !670, file: !670, line: 128, type: !671, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!4033 = !DILocation(line: 0, scope: !4032, inlinedAt: !4034)
!4034 = distinct !DILocation(line: 95, column: 20, scope: !4023)
!4035 = !DILocation(line: 129, column: 19, scope: !4032, inlinedAt: !4034)
!4036 = !DILocation(line: 129, column: 33, scope: !4032, inlinedAt: !4034)
!4037 = !DILocalVariable(name: "x", scope: !4032, file: !670, line: 129, type: !62)
!4038 = !DILocalVariable(name: "high_nibble_mask", scope: !4032, file: !670, line: 131, type: !62)
!4039 = !DILocation(line: 133, column: 28, scope: !4032, inlinedAt: !4034)
!4040 = !DILocalVariable(name: "high_half", scope: !4032, file: !670, line: 133, type: !62)
!4041 = !DILocation(line: 134, column: 28, scope: !4032, inlinedAt: !4034)
!4042 = !DILocation(line: 134, column: 47, scope: !4032, inlinedAt: !4034)
!4043 = !DILocation(line: 134, column: 34, scope: !4032, inlinedAt: !4034)
!4044 = !DILocalVariable(name: "tab", scope: !4023, file: !3519, line: 95, type: !62)
!4045 = !DILocalVariable(name: "lsb_ask", scope: !4023, file: !3519, line: 97, type: !53)
!4046 = !DILocalVariable(name: "i", scope: !4047, file: !3519, line: 99, type: !86)
!4047 = distinct !DILexicalBlock(scope: !4023, file: !3519, line: 99, column: 5)
!4048 = !DILocation(line: 0, scope: !4047)
!4049 = !DILocation(line: 99, column: 9, scope: !4047)
!4050 = !DILocation(line: 99, scope: !4047)
!4051 = !DILocation(line: 99, column: 20, scope: !4052)
!4052 = distinct !DILexicalBlock(scope: !4047, file: !3519, line: 99, column: 5)
!4053 = !DILocation(line: 99, column: 5, scope: !4047)
!4054 = !DILocation(line: 100, column: 21, scope: !4055)
!4055 = distinct !DILexicalBlock(scope: !4052, file: !3519, line: 99, column: 32)
!4056 = !DILocation(line: 100, column: 33, scope: !4055)
!4057 = !DILocation(line: 100, column: 51, scope: !4055)
!4058 = !DILocation(line: 100, column: 46, scope: !4055)
!4059 = !DILocation(line: 100, column: 44, scope: !4055)
!4060 = !DILocation(line: 101, column: 27, scope: !4055)
!4061 = !DILocation(line: 101, column: 33, scope: !4055)
!4062 = !DILocation(line: 101, column: 52, scope: !4055)
!4063 = !DILocation(line: 101, column: 59, scope: !4055)
!4064 = !DILocation(line: 101, column: 46, scope: !4055)
!4065 = !DILocation(line: 101, column: 44, scope: !4055)
!4066 = !DILocation(line: 101, column: 17, scope: !4055)
!4067 = !DILocation(line: 102, column: 21, scope: !4055)
!4068 = !DILocation(line: 102, column: 27, scope: !4055)
!4069 = !DILocation(line: 102, column: 33, scope: !4055)
!4070 = !DILocation(line: 102, column: 52, scope: !4055)
!4071 = !DILocation(line: 102, column: 59, scope: !4055)
!4072 = !DILocation(line: 102, column: 46, scope: !4055)
!4073 = !DILocation(line: 102, column: 44, scope: !4055)
!4074 = !DILocation(line: 102, column: 17, scope: !4055)
!4075 = !DILocation(line: 103, column: 21, scope: !4055)
!4076 = !DILocation(line: 103, column: 27, scope: !4055)
!4077 = !DILocation(line: 103, column: 33, scope: !4055)
!4078 = !DILocation(line: 103, column: 52, scope: !4055)
!4079 = !DILocation(line: 103, column: 59, scope: !4055)
!4080 = !DILocation(line: 103, column: 46, scope: !4055)
!4081 = !DILocation(line: 103, column: 44, scope: !4055)
!4082 = !DILocation(line: 103, column: 17, scope: !4055)
!4083 = !DILocation(line: 100, column: 9, scope: !4055)
!4084 = !DILocation(line: 100, column: 16, scope: !4055)
!4085 = !DILocation(line: 99, column: 29, scope: !4052)
!4086 = !DILocation(line: 99, column: 5, scope: !4052)
!4087 = distinct !{!4087, !4053, !4088, !300}
!4088 = !DILocation(line: 104, column: 5, scope: !4047)
!4089 = !DILocation(line: 105, column: 1, scope: !4023)
