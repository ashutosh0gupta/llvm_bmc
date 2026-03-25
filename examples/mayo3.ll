; ModuleID = 'composite'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

%struct.sk_t = type { [48762 x i64], [1080 x i8] }

@__const.example_mayo.msg = private unnamed_addr constant <{ i8, [31 x i8] }> <{ i8 14, [31 x i8] zeroinitializer }>, align 1
@.str = private unnamed_addr constant [17 x i8] c"Example with %s\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [7 x i8] c"MAYO_3\00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [17 x i8] c"mayo_keypair -> \00", align 1, !dbg !12
@.str.3 = private unnamed_addr constant [6 x i8] c"FAIL\0A\00", align 1, !dbg !14
@.str.4 = private unnamed_addr constant [4 x i8] c"OK\0A\00", align 1, !dbg !19
@.str.5 = private unnamed_addr constant [19 x i8] c"mayo_expand_sk -> \00", align 1, !dbg !24
@.str.6 = private unnamed_addr constant [19 x i8] c"mayo_expand_pk -> \00", align 1, !dbg !29
@.str.7 = private unnamed_addr constant [14 x i8] c"mayo_sign -> \00", align 1, !dbg !31
@.str.8 = private unnamed_addr constant [39 x i8] c"mayo_open (with correct signature) -> \00", align 1, !dbg !36
@.str.9 = private unnamed_addr constant [41 x i8] c"mayo_verify (with correct signature) -> \00", align 1, !dbg !41
@f_tail = internal unnamed_addr constant [4 x i8] c"\08\00\01\07", align 1, !dbg !46
@pqmayo_MAYO_3_ref_uint32_t_blocker = dso_local local_unnamed_addr global i32 0, align 4, !dbg !82
@pqmayo_MAYO_3_ref_uint64_t_blocker = dso_local global i64 0, align 8, !dbg !97
@pqmayo_MAYO_3_ref_unsigned_char_blocker = dso_local global i8 0, align 1, !dbg !101

; Function Attrs: nounwind
define dso_local range(i32 -1, 1) i32 @main() local_unnamed_addr #0 !dbg !113 {
entry:
  %tmp.i6.i = alloca [7 x i64], align 8
  %tmp.i.i = alloca [7 x i64], align 8
  %smlen.i = alloca i32, align 4
  %msg.i = alloca [32 x i8], align 1
  %msg2.i = alloca [32 x i8], align 1
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %smlen.i), !dbg !116
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %msg.i), !dbg !116
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %msg2.i), !dbg !116
    #dbg_value(ptr null, !151, !DIExpression(), !152)
    #dbg_value(i32 32, !153, !DIExpression(), !152)
    #dbg_value(i32 32, !153, !DIExpression(), !152)
    #dbg_value(i32 713, !154, !DIExpression(), !152)
  store i32 713, ptr %smlen.i, align 4, !dbg !155
  %call.i = call dereferenceable_or_null(2986) ptr @calloc(i32 noundef 2986, i32 noundef 1) #7, !dbg !156
    #dbg_value(ptr %call.i, !157, !DIExpression(), !152)
  %call1.i = call dereferenceable_or_null(32) ptr @calloc(i32 noundef 32, i32 noundef 1) #7, !dbg !158
    #dbg_value(ptr %call1.i, !159, !DIExpression(), !152)
  %call2.i = call dereferenceable_or_null(393176) ptr @calloc(i32 noundef 1, i32 noundef 393176) #7, !dbg !160
    #dbg_value(ptr %call2.i, !161, !DIExpression(), !152)
  %call3.i = call dereferenceable_or_null(391176) ptr @calloc(i32 noundef 1, i32 noundef 391176) #7, !dbg !162
    #dbg_value(ptr %call3.i, !163, !DIExpression(), !152)
    #dbg_value(i32 32, !153, !DIExpression(), !152)
  %call5.i = call dereferenceable_or_null(713) ptr @calloc(i32 noundef 713, i32 noundef 1) #7, !dbg !178
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
  %call.i.i = call i32 @pqmayo_MAYO_3_ref_mayo_keypair_compact(ptr noundef null, ptr noundef %call.i, ptr noundef %call1.i) #9, !dbg !226
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
  %call12.i = call i32 @pqmayo_MAYO_3_ref_mayo_expand_sk(ptr noundef null, ptr noundef %call1.i, ptr noundef %call3.i) #9, !dbg !238
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
  %call.i.i.i = call i32 @AES_128_CTR(ptr noundef %call2.i, i32 noundef 376164, ptr noundef %call.i, i32 noundef 16) #8, !dbg !263
  call void @llvm.lifetime.start.p0(i64 56, ptr nonnull %tmp.i.i), !dbg !264
    #dbg_value(ptr %call2.i, !269, !DIExpression(), !270)
    #dbg_value(ptr %call2.i, !271, !DIExpression(), !270)
    #dbg_value(i32 6966, !272, !DIExpression(), !270)
    #dbg_value(i32 108, !273, !DIExpression(), !270)
    #dbg_value(i32 7, !274, !DIExpression(), !270)
    #dbg_value(ptr %call2.i, !276, !DIExpression(), !270)
    #dbg_declare(ptr %tmp.i.i, !277, !DIExpression(), !264)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(56) %tmp.i.i, i8 0, i32 56, i1 false), !dbg !264
    #dbg_value(i32 6966, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !281)
  br label %for.cond.i.i, !dbg !282

for.cond.i.i:                                     ; preds = %for.body.i.i, %if.else16.i
  %i.0.in.i.i = phi i32 [ 6966, %if.else16.i ], [ %i.0.i.i, %for.body.i.i ]
    #dbg_value(i32 %i.0.in.i.i, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !281)
  %cmp.i3.i = icmp ugt i32 %i.0.in.i.i, 0, !dbg !283
  br i1 %cmp.i3.i, label %for.body.i.i, label %unpack_m_vecs.exit.i, !dbg !285

for.body.i.i:                                     ; preds = %for.cond.i.i
  %i.0.i.i = add nsw i32 %i.0.in.i.i, -1, !dbg !286
    #dbg_value(i32 %i.0.i.i, !279, !DIExpression(), !281)
  %mul.i.i = mul nsw i32 %i.0.i.i, 108, !dbg !287
  %div1.i.i14 = lshr exact i32 %mul.i.i, 1, !dbg !289
  %add.ptr.i4.i = getelementptr inbounds nuw i8, ptr %call2.i, i32 %div1.i.i14, !dbg !290
  %call.i5.i = call ptr @memcpy(ptr noundef nonnull %tmp.i.i, ptr noundef %add.ptr.i4.i, i32 noundef 54) #8, !dbg !291
  %mul4.i.i = mul nsw i32 %i.0.i.i, 56, !dbg !292
  %add.ptr5.i.i = getelementptr inbounds nuw i8, ptr %call2.i, i32 %mul4.i.i, !dbg !293
  %call8.i.i = call ptr @memcpy(ptr noundef %add.ptr5.i.i, ptr noundef nonnull %tmp.i.i, i32 noundef 56) #8, !dbg !294
    #dbg_value(i32 %i.0.i.i, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !281)
  br label %for.cond.i.i, !dbg !295, !llvm.loop !296

unpack_m_vecs.exit.i:                             ; preds = %for.cond.i.i
  call void @llvm.lifetime.end.p0(i64 56, ptr nonnull %tmp.i.i), !dbg !299
  %add.ptr.i.i = getelementptr inbounds nuw i8, ptr %call.i, i32 16, !dbg !300
  %add.ptr2.i.i = getelementptr inbounds nuw i8, ptr %call2.i, i32 390096, !dbg !301
  call void @llvm.lifetime.start.p0(i64 56, ptr nonnull %tmp.i6.i), !dbg !302
    #dbg_value(ptr %add.ptr.i.i, !269, !DIExpression(), !304)
    #dbg_value(ptr %add.ptr2.i.i, !271, !DIExpression(), !304)
    #dbg_value(i32 55, !272, !DIExpression(), !304)
    #dbg_value(i32 108, !273, !DIExpression(), !304)
    #dbg_value(i32 7, !274, !DIExpression(), !304)
    #dbg_value(ptr %add.ptr2.i.i, !276, !DIExpression(), !304)
    #dbg_declare(ptr %tmp.i6.i, !277, !DIExpression(), !302)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(56) %tmp.i6.i, i8 0, i32 56, i1 false), !dbg !302
    #dbg_value(i32 55, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !305)
  br label %for.cond.i7.i, !dbg !306

for.cond.i7.i:                                    ; preds = %for.body.i11.i, %unpack_m_vecs.exit.i
  %i.0.in.i8.i = phi i32 [ 55, %unpack_m_vecs.exit.i ], [ %i.0.i9.i, %for.body.i11.i ]
    #dbg_value(i32 %i.0.in.i8.i, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !305)
  %cmp.i10.i = icmp ugt i32 %i.0.in.i8.i, 0, !dbg !307
  br i1 %cmp.i10.i, label %for.body.i11.i, label %unpack_m_vecs.exit20.i, !dbg !308

for.body.i11.i:                                   ; preds = %for.cond.i7.i
  %i.0.i9.i = add nsw i32 %i.0.in.i8.i, -1, !dbg !309
    #dbg_value(i32 %i.0.i9.i, !279, !DIExpression(), !305)
  %mul.i12.i = mul nsw i32 %i.0.i9.i, 108, !dbg !310
  %div1.i13.i23 = lshr exact i32 %mul.i12.i, 1, !dbg !311
  %add.ptr.i14.i = getelementptr inbounds nuw i8, ptr %add.ptr.i.i, i32 %div1.i13.i23, !dbg !312
  %call.i15.i = call ptr @memcpy(ptr noundef nonnull %tmp.i6.i, ptr noundef nonnull %add.ptr.i14.i, i32 noundef 54) #8, !dbg !313
  %mul4.i17.i = mul nsw i32 %i.0.i9.i, 56, !dbg !314
  %add.ptr5.i18.i = getelementptr inbounds nuw i8, ptr %add.ptr2.i.i, i32 %mul4.i17.i, !dbg !315
  %call8.i19.i = call ptr @memcpy(ptr noundef nonnull %add.ptr5.i18.i, ptr noundef nonnull %tmp.i6.i, i32 noundef 56) #8, !dbg !316
    #dbg_value(i32 %i.0.i9.i, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !305)
  br label %for.cond.i7.i, !dbg !317, !llvm.loop !318

unpack_m_vecs.exit20.i:                           ; preds = %for.cond.i7.i
  call void @llvm.lifetime.end.p0(i64 56, ptr nonnull %tmp.i6.i), !dbg !320
    #dbg_value(i32 0, !229, !DIExpression(), !152)
  %call25.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.4) #8, !dbg !321
  %call27.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.7) #8, !dbg !324
    #dbg_value(i32 32, !153, !DIExpression(), !152)
    #dbg_value(ptr %smlen.i, !154, !DIExpression(DW_OP_deref), !152)
  %call28.i = call i32 @pqmayo_MAYO_3_ref_mayo_sign(ptr noundef null, ptr noundef %call5.i, ptr noundef nonnull %smlen.i, ptr noundef nonnull %msg.i, i32 noundef 32, ptr noundef %call1.i) #9, !dbg !325
    #dbg_value(i32 %call28.i, !229, !DIExpression(), !152)
  %cmp29.not.i = icmp eq i32 %call28.i, 0, !dbg !326
  br i1 %cmp29.not.i, label %if.else32.i, label %if.then30.i, !dbg !326

if.then30.i:                                      ; preds = %unpack_m_vecs.exit20.i
  %call31.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.3) #8, !dbg !328
    #dbg_value(i32 -1, !229, !DIExpression(), !152)
  br label %example_mayo.exit, !dbg !330

if.else32.i:                                      ; preds = %unpack_m_vecs.exit20.i
  %call33.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.4) #8, !dbg !331
  %call35.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.8) #8, !dbg !333
  %0 = load i32, ptr %smlen.i, align 4, !dbg !334
    #dbg_value(i32 %0, !154, !DIExpression(), !152)
    #dbg_value(ptr null, !335, !DIExpression(), !340)
    #dbg_value(ptr %msg2.i, !342, !DIExpression(), !340)
    #dbg_value(ptr undef, !343, !DIExpression(), !340)
    #dbg_value(ptr %call5.i, !344, !DIExpression(), !340)
    #dbg_value(i32 %0, !345, !DIExpression(), !340)
    #dbg_value(ptr %call.i, !346, !DIExpression(), !340)
    #dbg_value(i32 681, !347, !DIExpression(), !340)
  %cmp.i.i = icmp ult i32 %0, 681, !dbg !348
  br i1 %cmp.i.i, label %pqmayo_MAYO_3_ref_mayo_open.exit.i, label %if.end.i.i, !dbg !348

if.end.i.i:                                       ; preds = %if.else32.i
  %add.ptr.i1.i = getelementptr inbounds nuw i8, ptr %call5.i, i32 681, !dbg !350
  %sub.i.i = add i32 %0, -681, !dbg !351
  %call.i2.i = call i32 @pqmayo_MAYO_3_ref_mayo_verify(ptr noundef null, ptr noundef nonnull %add.ptr.i1.i, i32 noundef %sub.i.i, ptr noundef %call5.i, ptr noundef %call.i) #9, !dbg !352
    #dbg_value(i32 %call.i2.i, !353, !DIExpression(), !340)
  %cmp1.i.i = icmp eq i32 %call.i2.i, 0, !dbg !354
  br i1 %cmp1.i.i, label %if.then2.i.i, label %pqmayo_MAYO_3_ref_mayo_open.exit.i, !dbg !354

if.then2.i.i:                                     ; preds = %if.end.i.i
  %sub3.i.i = add i32 %0, -681, !dbg !356
  %add.ptr4.i.i = getelementptr inbounds nuw i8, ptr %call5.i, i32 681, !dbg !358
  %call5.i.i = call ptr @memmove(ptr noundef nonnull %msg2.i, ptr noundef nonnull %add.ptr4.i.i, i32 noundef %sub3.i.i) #8, !dbg !359
  br label %pqmayo_MAYO_3_ref_mayo_open.exit.i, !dbg !360

pqmayo_MAYO_3_ref_mayo_open.exit.i:               ; preds = %if.then2.i.i, %if.end.i.i, %if.else32.i
  %msglen.i.0 = phi i32 [ 32, %if.else32.i ], [ %sub3.i.i, %if.then2.i.i ], [ 32, %if.end.i.i ], !dbg !152
  %cmp38.not.i = phi i1 [ false, %if.else32.i ], [ true, %if.then2.i.i ], [ false, %if.end.i.i ], !dbg !340
    #dbg_value(i32 poison, !229, !DIExpression(), !152)
  br i1 %cmp38.not.i, label %lor.lhs.false.i, label %if.then42.i, !dbg !361

lor.lhs.false.i:                                  ; preds = %pqmayo_MAYO_3_ref_mayo_open.exit.i
    #dbg_value(i32 %msglen.i.0, !153, !DIExpression(), !152)
  %call41.i = call i32 @memcmp(ptr noundef nonnull %msg.i, ptr noundef nonnull %msg2.i, i32 noundef %msglen.i.0) #8, !dbg !363
  %tobool.not.i = icmp eq i32 %call41.i, 0, !dbg !363
  br i1 %tobool.not.i, label %if.else44.i, label %if.then42.i, !dbg !361

if.then42.i:                                      ; preds = %lor.lhs.false.i, %pqmayo_MAYO_3_ref_mayo_open.exit.i
  %call43.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.3) #8, !dbg !364
    #dbg_value(i32 -1, !229, !DIExpression(), !152)
  br label %example_mayo.exit, !dbg !366

if.else44.i:                                      ; preds = %lor.lhs.false.i
    #dbg_value(i32 0, !229, !DIExpression(), !152)
  %call45.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.4) #8, !dbg !367
  %call47.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.9) #8, !dbg !369
    #dbg_value(i32 %msglen.i.0, !153, !DIExpression(), !152)
  %call49.i = call i32 @pqmayo_MAYO_3_ref_mayo_verify(ptr noundef null, ptr noundef nonnull %msg.i, i32 noundef %msglen.i.0, ptr noundef %call5.i, ptr noundef %call.i) #9, !dbg !370
    #dbg_value(i32 %call49.i, !229, !DIExpression(), !152)
  %cmp50.not.i = icmp eq i32 %call49.i, 0, !dbg !371
  br i1 %cmp50.not.i, label %if.else53.i, label %if.then51.i, !dbg !371

if.then51.i:                                      ; preds = %if.else44.i
  %call52.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.3) #8, !dbg !373
    #dbg_value(i32 -1, !229, !DIExpression(), !152)
  br label %example_mayo.exit, !dbg !375

if.else53.i:                                      ; preds = %if.else44.i
    #dbg_value(i32 0, !229, !DIExpression(), !152)
  %call54.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.4) #8, !dbg !376
  br label %example_mayo.exit, !dbg !378

example_mayo.exit:                                ; preds = %if.then.i, %if.then14.i, %if.then30.i, %if.then42.i, %if.then51.i, %if.else53.i
  %res.0.i = phi i32 [ -1, %if.then.i ], [ -1, %if.then14.i ], [ -1, %if.then30.i ], [ -1, %if.then42.i ], [ -1, %if.then51.i ], [ 0, %if.else53.i ], !dbg !152
    #dbg_value(i32 %res.0.i, !229, !DIExpression(), !152)
    #dbg_label(!379, !380)
  call void @free(ptr noundef %call.i) #8, !dbg !381
  call void @free(ptr noundef %call2.i) #8, !dbg !382
  call void @mayo_secure_free(ptr noundef %call1.i, i32 noundef 32) #8, !dbg !383
  call void @mayo_secure_free(ptr noundef %call3.i, i32 noundef 391176) #8, !dbg !384
  call void @free(ptr noundef %call5.i) #8, !dbg !385
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %smlen.i), !dbg !386
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %msg.i), !dbg !386
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %msg2.i), !dbg !386
  ret i32 %res.0.i, !dbg !387
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
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_3_ref_mayo_keypair(ptr noundef %p, ptr noundef %pk, ptr noundef %sk) local_unnamed_addr #0 !dbg !190 {
entry:
    #dbg_value(ptr %p, !189, !DIExpression(), !388)
    #dbg_value(ptr %pk, !223, !DIExpression(), !388)
    #dbg_value(ptr %sk, !224, !DIExpression(), !388)
    #dbg_value(i32 0, !225, !DIExpression(), !388)
  %call = call i32 @pqmayo_MAYO_3_ref_mayo_keypair_compact(ptr noundef %p, ptr noundef %pk, ptr noundef %sk) #9, !dbg !389
    #dbg_value(i32 %call, !225, !DIExpression(), !388)
    #dbg_label(!227, !390)
  ret i32 %call, !dbg !391
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_3_ref_mayo_keypair_compact(ptr noundef %p, ptr noundef %cpk, ptr noundef %csk) local_unnamed_addr #0 !dbg !392 {
entry:
  %tmp.i = alloca [7 x i64], align 8
  %S = alloca [556 x i8], align 1
  %P = alloca [48762 x i64], align 8
  %P3 = alloca [700 x i64], align 8
  %O = alloca [1080 x i8], align 1
  %P3_upper = alloca [385 x i64], align 8
    #dbg_value(ptr %p, !393, !DIExpression(), !394)
    #dbg_value(ptr %cpk, !395, !DIExpression(), !394)
    #dbg_value(ptr %csk, !396, !DIExpression(), !394)
    #dbg_value(i32 0, !397, !DIExpression(), !394)
    #dbg_value(ptr %csk, !398, !DIExpression(), !394)
    #dbg_declare(ptr %S, !399, !DIExpression(), !403)
    #dbg_declare(ptr %P, !404, !DIExpression(), !405)
    #dbg_declare(ptr %P3, !406, !DIExpression(), !410)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(5600) %P3, i8 0, i32 5600, i1 false), !dbg !410
    #dbg_declare(ptr %O, !411, !DIExpression(), !413)
    #dbg_value(i32 7, !414, !DIExpression(), !394)
    #dbg_value(i32 108, !415, !DIExpression(), !394)
    #dbg_value(i32 108, !416, !DIExpression(), !394)
    #dbg_value(i32 10, !417, !DIExpression(), !394)
    #dbg_value(i32 540, !418, !DIExpression(), !394)
    #dbg_value(i32 41202, !419, !DIExpression(), !394)
    #dbg_value(i32 385, !420, !DIExpression(), !394)
    #dbg_value(i32 16, !421, !DIExpression(), !394)
    #dbg_value(i32 32, !422, !DIExpression(), !394)
    #dbg_value(ptr %P, !423, !DIExpression(), !394)
  %add.ptr = getelementptr inbounds nuw i8, ptr %P, i32 329616, !dbg !424
    #dbg_value(ptr %add.ptr, !425, !DIExpression(), !394)
  %call = call i32 @randombytes(ptr noundef %csk, i32 noundef 32) #8, !dbg !426
  %cmp.not = icmp eq i32 %call, 0, !dbg !428
  br i1 %cmp.not, label %if.end, label %err, !dbg !428

if.end:                                           ; preds = %entry
    #dbg_value(ptr %P, !423, !DIExpression(), !394)
  %call3 = call i32 @shake256(ptr noundef nonnull %S, i32 noundef 556, ptr noundef %csk, i32 noundef 32) #8, !dbg !429
    #dbg_value(ptr %S, !430, !DIExpression(), !394)
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %S, i32 16, !dbg !431
    #dbg_value(ptr %add.ptr6, !432, !DIExpression(), !436)
    #dbg_value(ptr %O, !438, !DIExpression(), !436)
    #dbg_value(i32 1080, !439, !DIExpression(), !436)
    #dbg_value(i32 0, !440, !DIExpression(), !436)
  br label %for.cond.i11, !dbg !441

for.cond.i11:                                     ; preds = %for.body.i14, %if.end
  %mdec.addr.0.i = phi ptr [ %O, %if.end ], [ %incdec.ptr5.i, %for.body.i14 ]
  %i.0.i12 = phi i32 [ 0, %if.end ], [ %inc.i15, %for.body.i14 ], !dbg !443
    #dbg_value(i32 %i.0.i12, !440, !DIExpression(), !436)
    #dbg_value(ptr %mdec.addr.0.i, !438, !DIExpression(), !436)
  %exitcond = icmp ne i32 %i.0.i12, 540, !dbg !444
  br i1 %exitcond, label %for.body.i14, label %decode.exit, !dbg !446

for.body.i14:                                     ; preds = %for.cond.i11
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %add.ptr6, i32 %i.0.i12, !dbg !447
  %0 = load i8, ptr %arrayidx.i, align 1, !dbg !447
  %1 = and i8 %0, 15, !dbg !449
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i, i32 1, !dbg !450
    #dbg_value(ptr %incdec.ptr.i, !438, !DIExpression(), !436)
  store i8 %1, ptr %mdec.addr.0.i, align 1, !dbg !451
  %2 = lshr i8 %0, 4, !dbg !452
    #dbg_value(ptr %incdec.ptr.i, !438, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !436)
  store i8 %2, ptr %incdec.ptr.i, align 1, !dbg !453
  %incdec.ptr5.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i, i32 2, !dbg !454
    #dbg_value(ptr %incdec.ptr5.i, !438, !DIExpression(), !436)
  %inc.i15 = add nuw nsw i32 %i.0.i12, 1, !dbg !455
    #dbg_value(i32 %inc.i15, !440, !DIExpression(), !436)
  br label %for.cond.i11, !dbg !456, !llvm.loop !457

decode.exit:                                      ; preds = %for.cond.i11
    #dbg_value(ptr %p, !255, !DIExpression(), !459)
    #dbg_value(ptr %P, !261, !DIExpression(), !459)
    #dbg_value(ptr %S, !262, !DIExpression(), !459)
  %call.i = call i32 @AES_128_CTR(ptr noundef nonnull %P, i32 noundef 376164, ptr noundef nonnull %S, i32 noundef 16) #8, !dbg !461
  call void @llvm.lifetime.start.p0(i64 56, ptr nonnull %tmp.i), !dbg !462
    #dbg_value(ptr %P, !269, !DIExpression(), !464)
    #dbg_value(ptr %P, !271, !DIExpression(), !464)
    #dbg_value(i32 6966, !272, !DIExpression(), !464)
    #dbg_value(i32 108, !273, !DIExpression(), !464)
    #dbg_value(i32 7, !274, !DIExpression(), !464)
    #dbg_value(ptr %P, !276, !DIExpression(), !464)
    #dbg_declare(ptr %tmp.i, !277, !DIExpression(), !462)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(56) %tmp.i, i8 0, i32 56, i1 false), !dbg !462
    #dbg_value(i32 6966, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !465)
  br label %for.cond.i2, !dbg !466

for.cond.i2:                                      ; preds = %for.body.i5, %decode.exit
  %i.0.in.i = phi i32 [ 6966, %decode.exit ], [ %i.0.i3, %for.body.i5 ]
    #dbg_value(i32 %i.0.in.i, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !465)
  %cmp.i4 = icmp ugt i32 %i.0.in.i, 0, !dbg !467
  br i1 %cmp.i4, label %for.body.i5, label %unpack_m_vecs.exit, !dbg !468

for.body.i5:                                      ; preds = %for.cond.i2
  %i.0.i3 = add nsw i32 %i.0.in.i, -1, !dbg !469
    #dbg_value(i32 %i.0.i3, !279, !DIExpression(), !465)
  %mul.i6 = mul nsw i32 %i.0.i3, 108, !dbg !470
  %div1.i74344 = lshr exact i32 %mul.i6, 1, !dbg !471
  %add.ptr.i8 = getelementptr inbounds nuw i8, ptr %P, i32 %div1.i74344, !dbg !472
  %call.i9 = call ptr @memcpy(ptr noundef nonnull %tmp.i, ptr noundef nonnull %add.ptr.i8, i32 noundef 54) #8, !dbg !473
  %mul4.i = mul nsw i32 %i.0.i3, 56, !dbg !474
  %add.ptr5.i = getelementptr inbounds nuw i8, ptr %P, i32 %mul4.i, !dbg !475
  %call8.i = call ptr @memcpy(ptr noundef nonnull %add.ptr5.i, ptr noundef nonnull %tmp.i, i32 noundef 56) #8, !dbg !476
    #dbg_value(i32 %i.0.i3, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !465)
  br label %for.cond.i2, !dbg !477, !llvm.loop !478

unpack_m_vecs.exit:                               ; preds = %for.cond.i2
  call void @llvm.lifetime.end.p0(i64 56, ptr nonnull %tmp.i), !dbg !480
    #dbg_value(ptr %p, !481, !DIExpression(), !487)
    #dbg_value(ptr %P, !489, !DIExpression(), !487)
    #dbg_value(ptr %add.ptr, !490, !DIExpression(), !487)
    #dbg_value(ptr %O, !491, !DIExpression(), !487)
    #dbg_value(ptr %P3, !492, !DIExpression(), !487)
    #dbg_value(i32 7, !493, !DIExpression(), !487)
    #dbg_value(i32 108, !494, !DIExpression(), !487)
    #dbg_value(i32 10, !495, !DIExpression(), !487)
    #dbg_value(ptr %p, !496, !DIExpression(), !500)
    #dbg_value(ptr %P, !502, !DIExpression(), !500)
    #dbg_value(ptr %O, !503, !DIExpression(), !500)
    #dbg_value(ptr %add.ptr, !504, !DIExpression(), !500)
    #dbg_value(i32 7, !505, !DIExpression(), !509)
    #dbg_value(ptr %P, !511, !DIExpression(), !509)
    #dbg_value(ptr %O, !512, !DIExpression(), !509)
    #dbg_value(ptr %add.ptr, !513, !DIExpression(), !509)
    #dbg_value(i32 108, !514, !DIExpression(), !509)
    #dbg_value(i32 108, !515, !DIExpression(), !509)
    #dbg_value(i32 10, !516, !DIExpression(), !509)
    #dbg_value(i32 1, !517, !DIExpression(), !509)
    #dbg_value(i32 0, !518, !DIExpression(), !509)
    #dbg_value(i32 0, !519, !DIExpression(), !521)
  br label %for.cond.i22, !dbg !522

for.cond.i22:                                     ; preds = %for.inc17.i30, %unpack_m_vecs.exit
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc17.i30 ], [ 108, %unpack_m_vecs.exit ], !dbg !523
  %bs_mat_entries_used.0.i = phi i32 [ 0, %unpack_m_vecs.exit ], [ %bs_mat_entries_used.1.i.lcssa, %for.inc17.i30 ], !dbg !523
  %r.0.i23 = phi i32 [ 0, %unpack_m_vecs.exit ], [ %inc18.i31, %for.inc17.i30 ], !dbg !524
    #dbg_value(i32 %r.0.i23, !519, !DIExpression(), !521)
    #dbg_value(i32 %bs_mat_entries_used.0.i, !518, !DIExpression(), !509)
  %exitcond47 = icmp ne i32 %r.0.i23, 108, !dbg !525
  br i1 %exitcond47, label %for.cond1.i27.preheader, label %for.cond.i16.preheader, !dbg !527

for.cond1.i27.preheader:                          ; preds = %for.cond.i22
  %3 = add i32 %bs_mat_entries_used.0.i, %indvars.iv, !dbg !528
  br label %for.cond1.i27, !dbg !528

for.cond.i16.preheader:                           ; preds = %for.cond.i22
  br label %for.cond.i16, !dbg !531

for.cond1.i27:                                    ; preds = %for.cond1.i27.preheader, %for.inc15.i35
  %bs_mat_entries_used.1.i = phi i32 [ %add14.i36, %for.inc15.i35 ], [ %bs_mat_entries_used.0.i, %for.cond1.i27.preheader ], !dbg !509
  %c.0.i28 = phi i32 [ %inc.i37, %for.inc15.i35 ], [ %r.0.i23, %for.cond1.i27.preheader ], !dbg !537
    #dbg_value(i32 %c.0.i28, !538, !DIExpression(), !539)
    #dbg_value(i32 %bs_mat_entries_used.1.i, !518, !DIExpression(), !509)
  %exitcond46 = icmp ne i32 %bs_mat_entries_used.1.i, %3, !dbg !540
  br i1 %exitcond46, label %for.cond4.i32.preheader, label %for.inc17.i30, !dbg !528

for.cond4.i32.preheader:                          ; preds = %for.cond1.i27
  br label %for.cond4.i32, !dbg !542

for.cond4.i32:                                    ; preds = %for.cond4.i32.preheader, %for.body6.i38
  %k.0.i33 = phi i32 [ %add13.i, %for.body6.i38 ], [ 0, %for.cond4.i32.preheader ], !dbg !545
    #dbg_value(i32 %k.0.i33, !546, !DIExpression(), !547)
  %exitcond45 = icmp ne i32 %k.0.i33, 10, !dbg !548
  br i1 %exitcond45, label %for.body6.i38, label %for.inc15.i35, !dbg !542

for.body6.i38:                                    ; preds = %for.cond4.i32
  %add.ptr.i40.idx = mul nsw i32 %bs_mat_entries_used.1.i, 56, !dbg !550
  %add.ptr.i40 = getelementptr inbounds i8, ptr %P, i32 %add.ptr.i40.idx, !dbg !550
  %mul8.i41 = mul nuw nsw i32 %c.0.i28, 10, !dbg !552
  %4 = getelementptr i8, ptr %O, i32 %mul8.i41, !dbg !553
  %arrayidx.i42 = getelementptr i8, ptr %4, i32 %k.0.i33, !dbg !553
  %5 = load i8, ptr %arrayidx.i42, align 1, !dbg !553
  %mul9.i = mul nuw nsw i32 %r.0.i23, 10, !dbg !554
  %add10.i = add nuw nsw i32 %mul9.i, %k.0.i33, !dbg !555
  %add.ptr12.i.idx = mul nuw nsw i32 %add10.i, 56, !dbg !556
  %add.ptr12.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %add.ptr12.i.idx, !dbg !556
  call fastcc void @m_vec_mul_add(i32 noundef 7, ptr noundef nonnull %add.ptr.i40, i8 noundef zeroext %5, ptr noundef nonnull %add.ptr12.i) #9, !dbg !557
  %add13.i = add nuw nsw i32 %k.0.i33, 1, !dbg !558
    #dbg_value(i32 %add13.i, !546, !DIExpression(), !547)
  br label %for.cond4.i32, !dbg !559, !llvm.loop !560

for.inc15.i35:                                    ; preds = %for.cond4.i32
    #dbg_value(i32 %bs_mat_entries_used.1.i, !518, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !509)
  %add14.i36 = add i32 %bs_mat_entries_used.1.i, 1, !dbg !562
    #dbg_value(i32 %add14.i36, !518, !DIExpression(), !509)
  %inc.i37 = add nuw nsw i32 %c.0.i28, 1, !dbg !563
    #dbg_value(i32 %inc.i37, !538, !DIExpression(), !539)
  br label %for.cond1.i27, !dbg !564, !llvm.loop !565

for.inc17.i30:                                    ; preds = %for.cond1.i27
  %bs_mat_entries_used.1.i.lcssa = phi i32 [ %bs_mat_entries_used.1.i, %for.cond1.i27 ], !dbg !509
  %inc18.i31 = add nuw nsw i32 %r.0.i23, 1, !dbg !567
    #dbg_value(i32 %inc18.i31, !519, !DIExpression(), !521)
  %indvars.iv.next = add nsw i32 %indvars.iv, -1, !dbg !568
  br label %for.cond.i22, !dbg !568, !llvm.loop !569

for.cond.i16:                                     ; preds = %for.cond.i16.preheader, %for.inc17.i
  %r.0.i = phi i32 [ %inc18.i, %for.inc17.i ], [ 0, %for.cond.i16.preheader ], !dbg !571
    #dbg_value(i32 %r.0.i, !572, !DIExpression(), !573)
  %exitcond50 = icmp ne i32 %r.0.i, 10, !dbg !574
  br i1 %exitcond50, label %for.cond1.i.preheader, label %mul_add_mat_trans_x_m_mat.exit, !dbg !531

for.cond1.i.preheader:                            ; preds = %for.cond.i16
  br label %for.cond1.i, !dbg !576

for.cond1.i:                                      ; preds = %for.cond1.i.preheader, %for.inc15.i
  %c.0.i = phi i32 [ %inc.i18, %for.inc15.i ], [ 0, %for.cond1.i.preheader ], !dbg !579
    #dbg_value(i32 %c.0.i, !580, !DIExpression(), !581)
  %exitcond49 = icmp ne i32 %c.0.i, 108, !dbg !582
  br i1 %exitcond49, label %for.cond4.i.preheader, label %for.inc17.i, !dbg !576

for.cond4.i.preheader:                            ; preds = %for.cond1.i
  br label %for.cond4.i, !dbg !584

for.cond4.i:                                      ; preds = %for.cond4.i.preheader, %for.body6.i
  %k.0.i = phi i32 [ %add14.i, %for.body6.i ], [ 0, %for.cond4.i.preheader ], !dbg !587
    #dbg_value(i32 %k.0.i, !588, !DIExpression(), !589)
  %exitcond48 = icmp ne i32 %k.0.i, 10, !dbg !590
  br i1 %exitcond48, label %for.body6.i, label %for.inc15.i, !dbg !584

for.body6.i:                                      ; preds = %for.cond4.i
  %mul.i19 = mul nuw nsw i32 %c.0.i, 10, !dbg !592
  %add.i = add nuw nsw i32 %mul.i19, %k.0.i, !dbg !594
  %add.ptr.i20.idx = mul nuw nsw i32 %add.i, 56, !dbg !595
  %add.ptr.i20 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %add.ptr.i20.idx, !dbg !595
  %mul8.i = mul nuw nsw i32 %c.0.i, 10, !dbg !596
  %6 = getelementptr i8, ptr %O, i32 %mul8.i, !dbg !597
  %arrayidx.i21 = getelementptr i8, ptr %6, i32 %r.0.i, !dbg !597
  %7 = load i8, ptr %arrayidx.i21, align 1, !dbg !597
  %mul10.i = mul nuw nsw i32 %r.0.i, 10, !dbg !598
  %add11.i = add nuw nsw i32 %mul10.i, %k.0.i, !dbg !599
  %add.ptr13.i.idx = mul nuw nsw i32 %add11.i, 56, !dbg !600
  %add.ptr13.i = getelementptr inbounds nuw i8, ptr %P3, i32 %add.ptr13.i.idx, !dbg !600
  call fastcc void @m_vec_mul_add(i32 noundef 7, ptr noundef nonnull %add.ptr.i20, i8 noundef zeroext %7, ptr noundef nonnull %add.ptr13.i) #9, !dbg !601
  %add14.i = add nuw nsw i32 %k.0.i, 1, !dbg !602
    #dbg_value(i32 %add14.i, !588, !DIExpression(), !589)
  br label %for.cond4.i, !dbg !603, !llvm.loop !604

for.inc15.i:                                      ; preds = %for.cond4.i
  %inc.i18 = add nuw nsw i32 %c.0.i, 1, !dbg !606
    #dbg_value(i32 %inc.i18, !580, !DIExpression(), !581)
  br label %for.cond1.i, !dbg !607, !llvm.loop !608

for.inc17.i:                                      ; preds = %for.cond1.i
  %inc18.i = add nuw nsw i32 %r.0.i, 1, !dbg !610
    #dbg_value(i32 %inc18.i, !572, !DIExpression(), !573)
  br label %for.cond.i16, !dbg !611, !llvm.loop !612

mul_add_mat_trans_x_m_mat.exit:                   ; preds = %for.cond.i16
  %call11 = call ptr @memcpy(ptr noundef %cpk, ptr noundef nonnull %S, i32 noundef 16) #8, !dbg !614
    #dbg_declare(ptr %P3_upper, !615, !DIExpression(), !619)
  call void @pqmayo_MAYO_3_ref_m_upper(ptr noundef %p, ptr noundef nonnull %P3, ptr noundef nonnull %P3_upper, i32 noundef 10) #9, !dbg !620
  %add.ptr15 = getelementptr inbounds nuw i8, ptr %cpk, i32 16, !dbg !621
    #dbg_value(ptr %P3_upper, !622, !DIExpression(), !626)
    #dbg_value(ptr %add.ptr15, !628, !DIExpression(), !626)
    #dbg_value(i32 55, !629, !DIExpression(), !626)
    #dbg_value(i32 108, !630, !DIExpression(), !626)
    #dbg_value(i32 7, !631, !DIExpression(), !626)
    #dbg_value(ptr %P3_upper, !632, !DIExpression(), !626)
    #dbg_value(i32 0, !633, !DIExpression(), !635)
  br label %for.cond.i, !dbg !636

for.cond.i:                                       ; preds = %for.body.i, %mul_add_mat_trans_x_m_mat.exit
  %i.0.i = phi i32 [ 0, %mul_add_mat_trans_x_m_mat.exit ], [ %inc.i, %for.body.i ], !dbg !637
    #dbg_value(i32 %i.0.i, !633, !DIExpression(), !635)
  %exitcond51 = icmp ne i32 %i.0.i, 55, !dbg !638
  br i1 %exitcond51, label %for.body.i, label %err.loopexit, !dbg !640

for.body.i:                                       ; preds = %for.cond.i
  %div1.i = mul nuw nsw i32 %i.0.i, 54, !dbg !641
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %add.ptr15, i32 %div1.i, !dbg !643
  %mul3.i = mul nuw nsw i32 %i.0.i, 56, !dbg !644
  %add.ptr4.i = getelementptr inbounds nuw i8, ptr %P3_upper, i32 %mul3.i, !dbg !645
  %call.i1 = call ptr @memmove(ptr noundef nonnull %add.ptr.i, ptr noundef nonnull %add.ptr4.i, i32 noundef 54) #8, !dbg !646
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !647
    #dbg_value(i32 %inc.i, !633, !DIExpression(), !635)
  br label %for.cond.i, !dbg !648, !llvm.loop !649

err.loopexit:                                     ; preds = %for.cond.i
  br label %err, !dbg !651

err:                                              ; preds = %err.loopexit, %entry
  %ret.0 = phi i32 [ 1, %entry ], [ 0, %err.loopexit ], !dbg !394
    #dbg_value(i32 %ret.0, !397, !DIExpression(), !394)
    #dbg_label(!652, !653)
  call void @mayo_secure_clear(ptr noundef nonnull %O, i32 noundef 1080) #8, !dbg !651
  call void @mayo_secure_clear(ptr noundef nonnull %add.ptr, i32 noundef 60480) #8, !dbg !654
  call void @mayo_secure_clear(ptr noundef nonnull %P3, i32 noundef 5600) #8, !dbg !655
  ret i32 %ret.0, !dbg !656
}

declare dso_local i32 @randombytes(ptr noundef, i32 noundef) local_unnamed_addr #4

declare dso_local i32 @shake256(ptr noundef, i32 noundef, ptr noundef, i32 noundef) local_unnamed_addr #4

declare dso_local ptr @memcpy(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #4

declare dso_local void @mayo_secure_clear(ptr noundef, i32 noundef) local_unnamed_addr #4

declare dso_local ptr @memmove(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: nounwind
define internal fastcc void @m_vec_mul_add(i32 noundef %m_vec_limbs, ptr noundef %in, i8 noundef zeroext %a, ptr noundef %acc) unnamed_addr #0 !dbg !657 {
entry:
    #dbg_value(i32 %m_vec_limbs, !661, !DIExpression(), !662)
    #dbg_value(ptr %in, !663, !DIExpression(), !662)
    #dbg_value(i8 %a, !664, !DIExpression(), !662)
    #dbg_value(ptr %acc, !665, !DIExpression(), !662)
    #dbg_value(i8 %a, !666, !DIExpression(), !671)
  %conv.i = zext i8 %a to i32, !dbg !673
  %mul.i = mul i32 %conv.i, 134480385, !dbg !674
    #dbg_value(i32 %mul.i, !675, !DIExpression(), !671)
    #dbg_value(i32 -252645136, !676, !DIExpression(), !671)
  %and.i = and i32 %mul.i, -252645136, !dbg !677
    #dbg_value(i32 %and.i, !678, !DIExpression(), !671)
  %shr.i = lshr exact i32 %and.i, 4, !dbg !679
  %shr1.i = lshr exact i32 %and.i, 3, !dbg !680
  %0 = xor i32 %shr.i, %shr1.i, !dbg !681
  %xor2.i = xor i32 %0, %mul.i, !dbg !681
    #dbg_value(i32 %xor2.i, !682, !DIExpression(), !662)
    #dbg_value(i64 1229782938247303441, !683, !DIExpression(), !662)
    #dbg_value(i32 0, !684, !DIExpression(), !686)
  br label %for.cond, !dbg !687

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !688
    #dbg_value(i32 %i.0, !684, !DIExpression(), !686)
  %exitcond = icmp ne i32 %i.0, 7, !dbg !689
  br i1 %exitcond, label %for.body, label %for.end, !dbg !691

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !692
  %1 = load i64, ptr %arrayidx, align 8, !dbg !692
  %and = and i64 %1, 1229782938247303441, !dbg !694
  %and1 = and i32 %xor2.i, 255, !dbg !695
  %conv = zext nneg i32 %and1 to i64, !dbg !696
  %mul = mul i64 %and, %conv, !dbg !697
  %shr = lshr i64 %1, 1, !dbg !698
  %and3 = and i64 %shr, 1229782938247303441, !dbg !699
  %shr4 = lshr i32 %xor2.i, 8, !dbg !700
  %and5 = and i32 %shr4, 15, !dbg !701
  %conv6 = zext nneg i32 %and5 to i64, !dbg !702
  %mul7 = mul nuw i64 %and3, %conv6, !dbg !703
  %xor = xor i64 %mul, %mul7, !dbg !704
  %arrayidx8 = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !705
  %2 = load i64, ptr %arrayidx8, align 8, !dbg !705
  %shr9 = lshr i64 %2, 2, !dbg !706
  %and10 = and i64 %shr9, 1229782938247303441, !dbg !707
  %shr11 = lshr i32 %xor2.i, 16, !dbg !708
  %and12 = and i32 %shr11, 15, !dbg !709
  %conv13 = zext nneg i32 %and12 to i64, !dbg !710
  %mul14 = mul nuw i64 %and10, %conv13, !dbg !711
  %xor15 = xor i64 %xor, %mul14, !dbg !712
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !713
  %3 = load i64, ptr %arrayidx16, align 8, !dbg !713
  %shr17 = lshr i64 %3, 3, !dbg !714
  %and18 = and i64 %shr17, 1229782938247303441, !dbg !715
  %shr19 = lshr i32 %xor2.i, 24, !dbg !716
  %and20 = and i32 %shr19, 15, !dbg !717
  %conv21 = zext nneg i32 %and20 to i64, !dbg !718
  %mul22 = mul nuw i64 %and18, %conv21, !dbg !719
  %xor23 = xor i64 %xor15, %mul22, !dbg !720
  %arrayidx24 = getelementptr inbounds nuw i64, ptr %acc, i32 %i.0, !dbg !721
  %4 = load i64, ptr %arrayidx24, align 8, !dbg !722
  %xor25 = xor i64 %4, %xor23, !dbg !722
  store i64 %xor25, ptr %arrayidx24, align 8, !dbg !722
  %inc = add nuw nsw i32 %i.0, 1, !dbg !723
    #dbg_value(i32 %inc, !684, !DIExpression(), !686)
  br label %for.cond, !dbg !724, !llvm.loop !725

for.end:                                          ; preds = %for.cond
  ret void, !dbg !727
}

declare dso_local i32 @AES_128_CTR(ptr noundef, i32 noundef, ptr noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: nounwind
define dso_local i32 @pqmayo_MAYO_3_ref_mayo_expand_sk(ptr noundef %p, ptr noundef %csk, ptr noundef %sk) local_unnamed_addr #0 !dbg !728 {
entry:
  %tmp.i = alloca [7 x i64], align 8
  %S = alloca [556 x i8], align 1
    #dbg_value(ptr %p, !737, !DIExpression(), !738)
    #dbg_value(ptr %csk, !739, !DIExpression(), !738)
    #dbg_value(ptr %sk, !740, !DIExpression(), !738)
    #dbg_value(i32 0, !741, !DIExpression(), !738)
    #dbg_declare(ptr %S, !742, !DIExpression(), !743)
    #dbg_value(ptr %sk, !744, !DIExpression(), !738)
  %O2 = getelementptr inbounds nuw i8, ptr %sk, i32 390096, !dbg !745
    #dbg_value(ptr %O2, !746, !DIExpression(), !738)
    #dbg_value(i32 10, !747, !DIExpression(), !738)
    #dbg_value(i32 108, !748, !DIExpression(), !738)
    #dbg_value(i32 540, !749, !DIExpression(), !738)
    #dbg_value(i32 16, !750, !DIExpression(), !738)
    #dbg_value(i32 32, !751, !DIExpression(), !738)
    #dbg_value(ptr %csk, !752, !DIExpression(), !738)
    #dbg_value(ptr %S, !753, !DIExpression(), !738)
  %call = call i32 @shake256(ptr noundef nonnull %S, i32 noundef 556, ptr noundef %csk, i32 noundef 32) #8, !dbg !754
  %add.ptr = getelementptr inbounds nuw i8, ptr %S, i32 16, !dbg !755
    #dbg_value(ptr %add.ptr, !432, !DIExpression(), !756)
    #dbg_value(ptr %O2, !438, !DIExpression(), !756)
    #dbg_value(i32 1080, !439, !DIExpression(), !756)
    #dbg_value(i32 0, !440, !DIExpression(), !756)
  br label %for.cond.i2, !dbg !758

for.cond.i2:                                      ; preds = %for.body.i5, %entry
  %mdec.addr.0.i = phi ptr [ %O2, %entry ], [ %incdec.ptr5.i, %for.body.i5 ]
  %i.0.i3 = phi i32 [ 0, %entry ], [ %inc.i, %for.body.i5 ], !dbg !759
    #dbg_value(i32 %i.0.i3, !440, !DIExpression(), !756)
    #dbg_value(ptr %mdec.addr.0.i, !438, !DIExpression(), !756)
  %exitcond = icmp ne i32 %i.0.i3, 540, !dbg !760
  br i1 %exitcond, label %for.body.i5, label %decode.exit, !dbg !761

for.body.i5:                                      ; preds = %for.cond.i2
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %i.0.i3, !dbg !762
  %0 = load i8, ptr %arrayidx.i, align 1, !dbg !762
  %1 = and i8 %0, 15, !dbg !763
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i, i32 1, !dbg !764
    #dbg_value(ptr %incdec.ptr.i, !438, !DIExpression(), !756)
  store i8 %1, ptr %mdec.addr.0.i, align 1, !dbg !765
  %2 = lshr i8 %0, 4, !dbg !766
    #dbg_value(ptr %incdec.ptr.i, !438, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !756)
  store i8 %2, ptr %incdec.ptr.i, align 1, !dbg !767
  %incdec.ptr5.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i, i32 2, !dbg !768
    #dbg_value(ptr %incdec.ptr5.i, !438, !DIExpression(), !756)
  %inc.i = add nuw nsw i32 %i.0.i3, 1, !dbg !769
    #dbg_value(i32 %inc.i, !440, !DIExpression(), !756)
  br label %for.cond.i2, !dbg !770, !llvm.loop !771

decode.exit:                                      ; preds = %for.cond.i2
    #dbg_value(ptr %p, !255, !DIExpression(), !773)
    #dbg_value(ptr %sk, !261, !DIExpression(), !773)
    #dbg_value(ptr %S, !262, !DIExpression(), !773)
  %call.i = call i32 @AES_128_CTR(ptr noundef %sk, i32 noundef 376164, ptr noundef nonnull %S, i32 noundef 16) #8, !dbg !775
  call void @llvm.lifetime.start.p0(i64 56, ptr nonnull %tmp.i), !dbg !776
    #dbg_value(ptr %sk, !269, !DIExpression(), !778)
    #dbg_value(ptr %sk, !271, !DIExpression(), !778)
    #dbg_value(i32 6966, !272, !DIExpression(), !778)
    #dbg_value(i32 108, !273, !DIExpression(), !778)
    #dbg_value(i32 7, !274, !DIExpression(), !778)
    #dbg_value(ptr %sk, !276, !DIExpression(), !778)
    #dbg_declare(ptr %tmp.i, !277, !DIExpression(), !776)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(56) %tmp.i, i8 0, i32 56, i1 false), !dbg !776
    #dbg_value(i32 6966, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !779)
  br label %for.cond.i, !dbg !780

for.cond.i:                                       ; preds = %for.body.i, %decode.exit
  %i.0.in.i = phi i32 [ 6966, %decode.exit ], [ %i.0.i, %for.body.i ]
    #dbg_value(i32 %i.0.in.i, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !779)
  %cmp.i = icmp ugt i32 %i.0.in.i, 0, !dbg !781
  br i1 %cmp.i, label %for.body.i, label %unpack_m_vecs.exit, !dbg !782

for.body.i:                                       ; preds = %for.cond.i
  %i.0.i = add nsw i32 %i.0.in.i, -1, !dbg !783
    #dbg_value(i32 %i.0.i, !279, !DIExpression(), !779)
  %mul.i = mul nsw i32 %i.0.i, 108, !dbg !784
  %div1.i1112 = lshr exact i32 %mul.i, 1, !dbg !785
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %sk, i32 %div1.i1112, !dbg !786
  %call.i1 = call ptr @memcpy(ptr noundef nonnull %tmp.i, ptr noundef %add.ptr.i, i32 noundef 54) #8, !dbg !787
  %mul4.i = mul nsw i32 %i.0.i, 56, !dbg !788
  %add.ptr5.i = getelementptr inbounds nuw i8, ptr %sk, i32 %mul4.i, !dbg !789
  %call8.i = call ptr @memcpy(ptr noundef %add.ptr5.i, ptr noundef nonnull %tmp.i, i32 noundef 56) #8, !dbg !790
    #dbg_value(i32 %i.0.i, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !779)
  br label %for.cond.i, !dbg !791, !llvm.loop !792

unpack_m_vecs.exit:                               ; preds = %for.cond.i
  call void @llvm.lifetime.end.p0(i64 56, ptr nonnull %tmp.i), !dbg !794
  %add.ptr7 = getelementptr inbounds nuw i8, ptr %sk, i32 329616, !dbg !795
    #dbg_value(ptr %add.ptr7, !796, !DIExpression(), !738)
    #dbg_value(ptr %sk, !797, !DIExpression(), !738)
    #dbg_value(ptr %add.ptr7, !798, !DIExpression(), !738)
    #dbg_value(ptr %p, !799, !DIExpression(), !801)
    #dbg_value(ptr %sk, !803, !DIExpression(), !801)
    #dbg_value(ptr %O2, !804, !DIExpression(), !801)
    #dbg_value(ptr %add.ptr7, !805, !DIExpression(), !801)
    #dbg_value(i32 10, !806, !DIExpression(), !801)
    #dbg_value(i32 108, !807, !DIExpression(), !801)
    #dbg_value(i32 7, !808, !DIExpression(), !801)
    #dbg_value(i32 0, !809, !DIExpression(), !801)
    #dbg_value(i32 0, !810, !DIExpression(), !812)
  br label %for.cond.i6, !dbg !813

for.cond.i6:                                      ; preds = %for.inc27.i, %unpack_m_vecs.exit
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc27.i ], [ 108, %unpack_m_vecs.exit ], !dbg !814
  %bs_mat_entries_used.0.i = phi i32 [ 0, %unpack_m_vecs.exit ], [ %bs_mat_entries_used.1.i.lcssa, %for.inc27.i ], !dbg !814
  %r.0.i = phi i32 [ 0, %unpack_m_vecs.exit ], [ %inc28.i, %for.inc27.i ], !dbg !815
    #dbg_value(i32 %r.0.i, !810, !DIExpression(), !812)
    #dbg_value(i32 %bs_mat_entries_used.0.i, !809, !DIExpression(), !801)
  %exitcond15 = icmp ne i32 %r.0.i, 108, !dbg !816
  br i1 %exitcond15, label %for.cond1.i.preheader, label %P1P1t_times_O.exit, !dbg !818

for.cond1.i.preheader:                            ; preds = %for.cond.i6
  %3 = add i32 %bs_mat_entries_used.0.i, %indvars.iv, !dbg !819
  br label %for.cond1.i, !dbg !819

for.cond1.i:                                      ; preds = %for.cond1.i.preheader, %for.inc25.i
  %bs_mat_entries_used.1.i = phi i32 [ %bs_mat_entries_used.2.i, %for.inc25.i ], [ %bs_mat_entries_used.0.i, %for.cond1.i.preheader ], !dbg !801
  %c.0.i = phi i32 [ %inc.i8, %for.inc25.i ], [ %r.0.i, %for.cond1.i.preheader ], !dbg !822
    #dbg_value(i32 %c.0.i, !823, !DIExpression(), !824)
    #dbg_value(i32 %bs_mat_entries_used.1.i, !809, !DIExpression(), !801)
  %exitcond14 = icmp ne i32 %bs_mat_entries_used.1.i, %3, !dbg !825
  br i1 %exitcond14, label %for.body3.i, label %for.inc27.i, !dbg !819

for.body3.i:                                      ; preds = %for.cond1.i
  %cmp4.i = icmp eq i32 %c.0.i, %r.0.i, !dbg !827
  br i1 %cmp4.i, label %for.inc25.i, label %for.cond5.i.preheader, !dbg !827

for.cond5.i.preheader:                            ; preds = %for.body3.i
  br label %for.cond5.i, !dbg !830

for.cond5.i:                                      ; preds = %for.cond5.i.preheader, %for.body7.i
  %k.0.i = phi i32 [ %add23.i, %for.body7.i ], [ 0, %for.cond5.i.preheader ], !dbg !832
    #dbg_value(i32 %k.0.i, !833, !DIExpression(), !834)
  %exitcond13 = icmp ne i32 %k.0.i, 10, !dbg !835
  br i1 %exitcond13, label %for.body7.i, label %for.inc25.i.loopexit, !dbg !830

for.body7.i:                                      ; preds = %for.cond5.i
  %add.ptr.idx.i = mul nsw i32 %bs_mat_entries_used.1.i, 56, !dbg !837
  %add.ptr.i9 = getelementptr inbounds i8, ptr %sk, i32 %add.ptr.idx.i, !dbg !837
  %mul8.i = mul nuw nsw i32 %c.0.i, 10, !dbg !839
  %4 = getelementptr inbounds nuw i8, ptr %O2, i32 %mul8.i, !dbg !840
  %arrayidx.i10 = getelementptr inbounds nuw i8, ptr %4, i32 %k.0.i, !dbg !840
  %5 = load i8, ptr %arrayidx.i10, align 1, !dbg !840
  %mul10.i = mul nuw nsw i32 %r.0.i, 10, !dbg !841
  %add11.i = add nuw nsw i32 %mul10.i, %k.0.i, !dbg !842
  %add.ptr13.idx.i = mul nuw nsw i32 %add11.i, 56, !dbg !843
  %add.ptr13.i = getelementptr inbounds nuw i8, ptr %add.ptr7, i32 %add.ptr13.idx.i, !dbg !843
  call fastcc void @m_vec_mul_add(i32 noundef 7, ptr noundef %add.ptr.i9, i8 noundef zeroext %5, ptr noundef nonnull %add.ptr13.i) #9, !dbg !844
  %add.ptr15.idx.i = mul nsw i32 %bs_mat_entries_used.1.i, 56, !dbg !845
  %add.ptr15.i = getelementptr inbounds i8, ptr %sk, i32 %add.ptr15.idx.i, !dbg !845
  %mul16.i = mul nuw nsw i32 %r.0.i, 10, !dbg !846
  %6 = getelementptr inbounds nuw i8, ptr %O2, i32 %mul16.i, !dbg !847
  %arrayidx18.i = getelementptr inbounds nuw i8, ptr %6, i32 %k.0.i, !dbg !847
  %7 = load i8, ptr %arrayidx18.i, align 1, !dbg !847
  %mul19.i = mul nuw nsw i32 %c.0.i, 10, !dbg !848
  %add20.i = add nuw nsw i32 %mul19.i, %k.0.i, !dbg !849
  %add.ptr22.idx.i = mul nuw nsw i32 %add20.i, 56, !dbg !850
  %add.ptr22.i = getelementptr inbounds nuw i8, ptr %add.ptr7, i32 %add.ptr22.idx.i, !dbg !850
  call fastcc void @m_vec_mul_add(i32 noundef 7, ptr noundef %add.ptr15.i, i8 noundef zeroext %7, ptr noundef nonnull %add.ptr22.i) #9, !dbg !851
  %add23.i = add nuw nsw i32 %k.0.i, 1, !dbg !852
    #dbg_value(i32 %add23.i, !833, !DIExpression(), !834)
  br label %for.cond5.i, !dbg !853, !llvm.loop !854

for.inc25.i.loopexit:                             ; preds = %for.cond5.i
  br label %for.inc25.i, !dbg !856

for.inc25.i:                                      ; preds = %for.inc25.i.loopexit, %for.body3.i
  %bs_mat_entries_used.2.i = add i32 %bs_mat_entries_used.1.i, 1, !dbg !856
    #dbg_value(i32 %bs_mat_entries_used.2.i, !809, !DIExpression(), !801)
  %inc.i8 = add nuw nsw i32 %c.0.i, 1, !dbg !857
    #dbg_value(i32 %inc.i8, !823, !DIExpression(), !824)
  br label %for.cond1.i, !dbg !858, !llvm.loop !859

for.inc27.i:                                      ; preds = %for.cond1.i
  %bs_mat_entries_used.1.i.lcssa = phi i32 [ %bs_mat_entries_used.1.i, %for.cond1.i ], !dbg !801
  %inc28.i = add nuw nsw i32 %r.0.i, 1, !dbg !861
    #dbg_value(i32 %inc28.i, !810, !DIExpression(), !812)
  %indvars.iv.next = add nsw i32 %indvars.iv, -1, !dbg !862
  br label %for.cond.i6, !dbg !862, !llvm.loop !863

P1P1t_times_O.exit:                               ; preds = %for.cond.i6
  call void @mayo_secure_clear(ptr noundef nonnull %S, i32 noundef 556) #8, !dbg !865
  ret i32 0, !dbg !866
}

; Function Attrs: nounwind
define dso_local i32 @pqmayo_MAYO_3_ref_mayo_sign_signature(ptr noundef %p, ptr noundef %sig, ptr noundef %siglen, ptr noundef %m, i32 noundef %mlen, ptr noundef %csk) local_unnamed_addr #0 !dbg !867 {
entry:
  %A.i = alloca [1568 x i64], align 8
  %tab.i = alloca [16 x i8], align 1
  %Pv.i = alloca [8316 x i64], align 8
  %tenc = alloca [54 x i8], align 1
  %t = alloca [108 x i8], align 1
  %y = alloca [108 x i8], align 1
  %salt = alloca [32 x i8], align 1
  %V = alloca [649 x i8], align 1
  %Vdec = alloca [1188 x i8], align 1
  %A = alloca [12432 x i8], align 1
  %x = alloca [1298 x i8], align 1
  %r = alloca [111 x i8], align 1
  %s = alloca [1298 x i8], align 1
  %sk = alloca %struct.sk_t, align 32
  %Ox = alloca [108 x i8], align 1
  %tmp = alloca [113 x i8], align 1
  %Mtmp = alloca [770 x i64], align 8
    #dbg_value(ptr %p, !868, !DIExpression(), !869)
    #dbg_value(ptr %sig, !870, !DIExpression(), !869)
    #dbg_value(ptr %siglen, !871, !DIExpression(), !869)
    #dbg_value(ptr %m, !872, !DIExpression(), !869)
    #dbg_value(i32 %mlen, !873, !DIExpression(), !869)
    #dbg_value(ptr %csk, !874, !DIExpression(), !869)
    #dbg_value(i32 0, !875, !DIExpression(), !869)
    #dbg_declare(ptr %tenc, !876, !DIExpression(), !880)
    #dbg_declare(ptr %t, !881, !DIExpression(), !885)
    #dbg_declare(ptr %y, !886, !DIExpression(), !887)
    #dbg_declare(ptr %salt, !888, !DIExpression(), !889)
    #dbg_declare(ptr %V, !890, !DIExpression(), !894)
    #dbg_declare(ptr %Vdec, !895, !DIExpression(), !899)
    #dbg_declare(ptr %A, !900, !DIExpression(), !904)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(12432) %A, i8 0, i32 12432, i1 false), !dbg !904
    #dbg_declare(ptr %x, !905, !DIExpression(), !909)
    #dbg_declare(ptr %r, !910, !DIExpression(), !914)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(111) %r, i8 0, i32 111, i1 false), !dbg !914
    #dbg_declare(ptr %s, !915, !DIExpression(), !916)
    #dbg_declare(ptr %sk, !917, !DIExpression(), !918)
    #dbg_declare(ptr %Ox, !919, !DIExpression(), !920)
    #dbg_declare(ptr %tmp, !921, !DIExpression(), !925)
    #dbg_value(i32 108, !926, !DIExpression(), !869)
    #dbg_value(i32 118, !927, !DIExpression(), !869)
    #dbg_value(i32 10, !928, !DIExpression(), !869)
    #dbg_value(i32 11, !929, !DIExpression(), !869)
    #dbg_value(i32 108, !930, !DIExpression(), !869)
    #dbg_value(i32 54, !931, !DIExpression(), !869)
    #dbg_value(i32 54, !932, !DIExpression(), !869)
    #dbg_value(i32 55, !933, !DIExpression(), !869)
    #dbg_value(i32 681, !934, !DIExpression(), !869)
    #dbg_value(i32 111, !935, !DIExpression(), !869)
    #dbg_value(i32 48, !936, !DIExpression(), !869)
    #dbg_value(i32 32, !937, !DIExpression(), !869)
    #dbg_value(i32 32, !938, !DIExpression(), !869)
  %call = call i32 @pqmayo_MAYO_3_ref_mayo_expand_sk(ptr noundef %p, ptr noundef %csk, ptr noundef nonnull %sk) #9, !dbg !939
    #dbg_value(i32 %call, !875, !DIExpression(), !869)
  %cmp.not = icmp eq i32 %call, 0, !dbg !940
  br i1 %cmp.not, label %if.end, label %err, !dbg !940

if.end:                                           ; preds = %entry
    #dbg_value(ptr %csk, !942, !DIExpression(), !869)
  %call1 = call i32 @shake256(ptr noundef nonnull %tmp, i32 noundef 48, ptr noundef %m, i32 noundef %mlen) #8, !dbg !943
    #dbg_value(ptr %sk, !944, !DIExpression(), !869)
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 329616, !dbg !945
    #dbg_value(ptr %add.ptr, !946, !DIExpression(), !869)
    #dbg_declare(ptr %Mtmp, !947, !DIExpression(), !951)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(6160) %Mtmp, i8 0, i32 6160, i1 false), !dbg !951
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %tmp, i32 48, !dbg !952
  %call6 = call i32 @randombytes(ptr noundef nonnull %add.ptr5, i32 noundef 32) #8, !dbg !954
  %cmp7.not = icmp eq i32 %call6, 0, !dbg !955
  br i1 %cmp7.not, label %if.end9, label %err, !dbg !955

if.end9:                                          ; preds = %if.end
  %add.ptr12 = getelementptr inbounds nuw i8, ptr %tmp, i32 80, !dbg !956
  %call13 = call ptr @memcpy(ptr noundef nonnull %add.ptr12, ptr noundef %csk, i32 noundef 32) #8, !dbg !957
  %call16 = call i32 @shake256(ptr noundef nonnull %salt, i32 noundef 32, ptr noundef nonnull %tmp, i32 noundef 112) #8, !dbg !958
  %add.ptr18 = getelementptr inbounds nuw i8, ptr %tmp, i32 48, !dbg !959
  %call20 = call ptr @memcpy(ptr noundef nonnull %add.ptr18, ptr noundef nonnull %salt, i32 noundef 32) #8, !dbg !960
    #dbg_value(ptr %add.ptr24, !961, !DIExpression(), !869)
  %call27 = call i32 @shake256(ptr noundef nonnull %tenc, i32 noundef 54, ptr noundef nonnull %tmp, i32 noundef 80) #8, !dbg !962
    #dbg_value(ptr %tenc, !432, !DIExpression(), !963)
    #dbg_value(ptr %t, !438, !DIExpression(), !963)
    #dbg_value(i32 108, !439, !DIExpression(), !963)
    #dbg_value(i32 0, !440, !DIExpression(), !963)
  br label %for.cond.i23, !dbg !965

for.cond.i23:                                     ; preds = %for.body.i27, %if.end9
  %mdec.addr.0.i24 = phi ptr [ %t, %if.end9 ], [ %incdec.ptr5.i31, %for.body.i27 ]
  %i.0.i25 = phi i32 [ 0, %if.end9 ], [ %inc.i32, %for.body.i27 ], !dbg !966
    #dbg_value(i32 %i.0.i25, !440, !DIExpression(), !963)
    #dbg_value(ptr %mdec.addr.0.i24, !438, !DIExpression(), !963)
  %exitcond = icmp ne i32 %i.0.i25, 54, !dbg !967
  br i1 %exitcond, label %for.body.i27, label %for.cond.preheader, !dbg !968

for.cond.preheader:                               ; preds = %for.cond.i23
  %add.ptr24 = getelementptr inbounds nuw i8, ptr %tmp, i32 112, !dbg !969
  br label %for.cond, !dbg !970

for.body.i27:                                     ; preds = %for.cond.i23
  %arrayidx.i28 = getelementptr inbounds nuw i8, ptr %tenc, i32 %i.0.i25, !dbg !972
  %0 = load i8, ptr %arrayidx.i28, align 1, !dbg !972
  %1 = and i8 %0, 15, !dbg !973
  %incdec.ptr.i29 = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i24, i32 1, !dbg !974
    #dbg_value(ptr %incdec.ptr.i29, !438, !DIExpression(), !963)
  store i8 %1, ptr %mdec.addr.0.i24, align 1, !dbg !975
  %2 = lshr i8 %0, 4, !dbg !976
    #dbg_value(ptr %incdec.ptr.i29, !438, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !963)
  store i8 %2, ptr %incdec.ptr.i29, align 1, !dbg !977
  %incdec.ptr5.i31 = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i24, i32 2, !dbg !978
    #dbg_value(ptr %incdec.ptr5.i31, !438, !DIExpression(), !963)
  %inc.i32 = add nuw nsw i32 %i.0.i25, 1, !dbg !979
    #dbg_value(i32 %inc.i32, !440, !DIExpression(), !963)
  br label %for.cond.i23, !dbg !980, !llvm.loop !981

for.cond:                                         ; preds = %for.cond.preheader, %if.else
  %ctr.0 = phi i32 [ %inc75, %if.else ], [ 0, %for.cond.preheader ], !dbg !983
    #dbg_value(i32 %ctr.0, !984, !DIExpression(), !985)
  %exitcond153 = icmp ne i32 %ctr.0, 256, !dbg !986
  br i1 %exitcond153, label %for.body, label %for.end76, !dbg !970

for.body:                                         ; preds = %for.cond
  %conv = trunc nuw i32 %ctr.0 to i8, !dbg !988
  store i8 %conv, ptr %add.ptr24, align 1, !dbg !990
  %call33 = call i32 @shake256(ptr noundef nonnull %V, i32 noundef 649, ptr noundef nonnull %tmp, i32 noundef 113) #8, !dbg !991
    #dbg_value(i32 0, !992, !DIExpression(), !994)
  br label %for.cond34, !dbg !995

for.cond34:                                       ; preds = %decode.exit22, %for.body
  %i.0 = phi i32 [ 0, %for.body ], [ %inc, %decode.exit22 ], !dbg !996
    #dbg_value(i32 %i.0, !992, !DIExpression(), !994)
  %exitcond127 = icmp ne i32 %i.0, 11, !dbg !997
  br i1 %exitcond127, label %for.body37, label %for.end, !dbg !999

for.body37:                                       ; preds = %for.cond34
  %mul = mul nuw nsw i32 %i.0, 54, !dbg !1000
  %add.ptr39 = getelementptr inbounds nuw i8, ptr %V, i32 %mul, !dbg !1002
  %mul41 = mul nuw nsw i32 %i.0, 108, !dbg !1003
  %add.ptr42 = getelementptr inbounds nuw i8, ptr %Vdec, i32 %mul41, !dbg !1004
    #dbg_value(ptr %add.ptr39, !432, !DIExpression(), !1005)
    #dbg_value(ptr %add.ptr42, !438, !DIExpression(), !1005)
    #dbg_value(i32 108, !439, !DIExpression(), !1005)
    #dbg_value(i32 0, !440, !DIExpression(), !1005)
  br label %for.cond.i12, !dbg !1007

for.cond.i12:                                     ; preds = %for.body.i16, %for.body37
  %mdec.addr.0.i13 = phi ptr [ %add.ptr42, %for.body37 ], [ %incdec.ptr5.i20, %for.body.i16 ]
  %i.0.i14 = phi i32 [ 0, %for.body37 ], [ %inc.i21, %for.body.i16 ], !dbg !1008
    #dbg_value(i32 %i.0.i14, !440, !DIExpression(), !1005)
    #dbg_value(ptr %mdec.addr.0.i13, !438, !DIExpression(), !1005)
  %exitcond126 = icmp ne i32 %i.0.i14, 54, !dbg !1009
  br i1 %exitcond126, label %for.body.i16, label %decode.exit22, !dbg !1010

for.body.i16:                                     ; preds = %for.cond.i12
  %arrayidx.i17 = getelementptr inbounds nuw i8, ptr %add.ptr39, i32 %i.0.i14, !dbg !1011
  %3 = load i8, ptr %arrayidx.i17, align 1, !dbg !1011
  %4 = and i8 %3, 15, !dbg !1012
  %incdec.ptr.i18 = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i13, i32 1, !dbg !1013
    #dbg_value(ptr %incdec.ptr.i18, !438, !DIExpression(), !1005)
  store i8 %4, ptr %mdec.addr.0.i13, align 1, !dbg !1014
  %5 = lshr i8 %3, 4, !dbg !1015
    #dbg_value(ptr %incdec.ptr.i18, !438, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1005)
  store i8 %5, ptr %incdec.ptr.i18, align 1, !dbg !1016
  %incdec.ptr5.i20 = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i13, i32 2, !dbg !1017
    #dbg_value(ptr %incdec.ptr5.i20, !438, !DIExpression(), !1005)
  %inc.i21 = add nuw nsw i32 %i.0.i14, 1, !dbg !1018
    #dbg_value(i32 %inc.i21, !440, !DIExpression(), !1005)
  br label %for.cond.i12, !dbg !1019, !llvm.loop !1020

decode.exit22:                                    ; preds = %for.cond.i12
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1022
    #dbg_value(i32 %inc, !992, !DIExpression(), !994)
  br label %for.cond34, !dbg !1023, !llvm.loop !1024

for.end:                                          ; preds = %for.cond34
  call void @llvm.lifetime.start.p0(i64 66528, ptr nonnull %Pv.i), !dbg !1026
    #dbg_value(ptr %p, !1031, !DIExpression(), !1032)
    #dbg_value(ptr %Vdec, !1033, !DIExpression(), !1032)
    #dbg_value(ptr %add.ptr, !1034, !DIExpression(), !1032)
    #dbg_value(ptr %sk, !1035, !DIExpression(), !1032)
    #dbg_value(ptr %Mtmp, !1036, !DIExpression(), !1032)
    #dbg_value(ptr %A, !1037, !DIExpression(), !1032)
    #dbg_value(i32 11, !1038, !DIExpression(), !1032)
    #dbg_value(i32 108, !1039, !DIExpression(), !1032)
    #dbg_value(i32 10, !1040, !DIExpression(), !1032)
    #dbg_value(i32 7, !1041, !DIExpression(), !1043)
    #dbg_value(ptr %Vdec, !1045, !DIExpression(), !1043)
    #dbg_value(ptr %add.ptr, !1046, !DIExpression(), !1043)
    #dbg_value(ptr %Mtmp, !1047, !DIExpression(), !1043)
    #dbg_value(i32 11, !1048, !DIExpression(), !1043)
    #dbg_value(i32 108, !1049, !DIExpression(), !1043)
    #dbg_value(i32 10, !1050, !DIExpression(), !1043)
    #dbg_value(i32 0, !1051, !DIExpression(), !1053)
  br label %for.cond.i41, !dbg !1054

for.cond.i41:                                     ; preds = %for.inc17.i47, %for.end
  %r.0.i42 = phi i32 [ 0, %for.end ], [ %inc18.i48, %for.inc17.i47 ], !dbg !1055
    #dbg_value(i32 %r.0.i42, !1051, !DIExpression(), !1053)
  %exitcond130 = icmp ne i32 %r.0.i42, 11, !dbg !1056
  br i1 %exitcond130, label %for.cond1.i44.preheader, label %mul_add_mat_x_m_mat.exit66, !dbg !1058

for.cond1.i44.preheader:                          ; preds = %for.cond.i41
  br label %for.cond1.i44, !dbg !1059

for.cond1.i44:                                    ; preds = %for.cond1.i44.preheader, %for.inc15.i52
  %c.0.i45 = phi i32 [ %inc.i53, %for.inc15.i52 ], [ 0, %for.cond1.i44.preheader ], !dbg !1062
    #dbg_value(i32 %c.0.i45, !1063, !DIExpression(), !1064)
  %exitcond129 = icmp ne i32 %c.0.i45, 108, !dbg !1065
  br i1 %exitcond129, label %for.cond4.i49.preheader, label %for.inc17.i47, !dbg !1059

for.cond4.i49.preheader:                          ; preds = %for.cond1.i44
  br label %for.cond4.i49, !dbg !1067

for.cond4.i49:                                    ; preds = %for.cond4.i49.preheader, %for.body6.i54
  %k.0.i50 = phi i32 [ %add14.i65, %for.body6.i54 ], [ 0, %for.cond4.i49.preheader ], !dbg !1070
    #dbg_value(i32 %k.0.i50, !1071, !DIExpression(), !1072)
  %exitcond128 = icmp ne i32 %k.0.i50, 10, !dbg !1073
  br i1 %exitcond128, label %for.body6.i54, label %for.inc15.i52, !dbg !1067

for.body6.i54:                                    ; preds = %for.cond4.i49
  %mul.i55 = mul nuw nsw i32 %c.0.i45, 10, !dbg !1075
  %add.i56 = add nuw nsw i32 %mul.i55, %k.0.i50, !dbg !1077
  %add.ptr.i58.idx = mul nuw nsw i32 %add.i56, 56, !dbg !1078
  %add.ptr.i58 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %add.ptr.i58.idx, !dbg !1078
  %mul8.i59 = mul nuw nsw i32 %r.0.i42, 108, !dbg !1079
  %6 = getelementptr i8, ptr %Vdec, i32 %mul8.i59, !dbg !1080
  %arrayidx.i60 = getelementptr i8, ptr %6, i32 %c.0.i45, !dbg !1080
  %7 = load i8, ptr %arrayidx.i60, align 1, !dbg !1080
  %mul10.i61 = mul nuw nsw i32 %r.0.i42, 10, !dbg !1081
  %add11.i62 = add nuw nsw i32 %mul10.i61, %k.0.i50, !dbg !1082
  %add.ptr13.i64.idx = mul nuw nsw i32 %add11.i62, 56, !dbg !1083
  %add.ptr13.i64 = getelementptr inbounds nuw i8, ptr %Mtmp, i32 %add.ptr13.i64.idx, !dbg !1083
  call fastcc void @m_vec_mul_add(i32 noundef 7, ptr noundef nonnull %add.ptr.i58, i8 noundef zeroext %7, ptr noundef nonnull %add.ptr13.i64) #9, !dbg !1084
  %add14.i65 = add nuw nsw i32 %k.0.i50, 1, !dbg !1085
    #dbg_value(i32 %add14.i65, !1071, !DIExpression(), !1072)
  br label %for.cond4.i49, !dbg !1086, !llvm.loop !1087

for.inc15.i52:                                    ; preds = %for.cond4.i49
  %inc.i53 = add nuw nsw i32 %c.0.i45, 1, !dbg !1089
    #dbg_value(i32 %inc.i53, !1063, !DIExpression(), !1064)
  br label %for.cond1.i44, !dbg !1090, !llvm.loop !1091

for.inc17.i47:                                    ; preds = %for.cond1.i44
  %inc18.i48 = add nuw nsw i32 %r.0.i42, 1, !dbg !1093
    #dbg_value(i32 %inc18.i48, !1051, !DIExpression(), !1053)
  br label %for.cond.i41, !dbg !1094, !llvm.loop !1095

mul_add_mat_x_m_mat.exit66:                       ; preds = %for.cond.i41
    #dbg_declare(ptr %Pv.i, !1097, !DIExpression(), !1101)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(66528) %Pv.i, i8 0, i32 66528, i1 false), !dbg !1101
    #dbg_value(ptr %p, !1102, !DIExpression(), !1104)
    #dbg_value(ptr %sk, !1106, !DIExpression(), !1104)
    #dbg_value(ptr %Vdec, !1107, !DIExpression(), !1104)
    #dbg_value(ptr %Pv.i, !1108, !DIExpression(), !1104)
    #dbg_value(i32 7, !1109, !DIExpression(), !1111)
    #dbg_value(ptr %sk, !1113, !DIExpression(), !1111)
    #dbg_value(ptr %Vdec, !1114, !DIExpression(), !1111)
    #dbg_value(ptr %Pv.i, !1115, !DIExpression(), !1111)
    #dbg_value(i32 108, !1116, !DIExpression(), !1111)
    #dbg_value(i32 108, !1117, !DIExpression(), !1111)
    #dbg_value(i32 11, !1118, !DIExpression(), !1111)
    #dbg_value(i32 1, !1119, !DIExpression(), !1111)
    #dbg_value(i32 0, !1120, !DIExpression(), !1111)
    #dbg_value(i32 0, !1121, !DIExpression(), !1123)
  br label %for.cond.i67, !dbg !1124

for.cond.i67:                                     ; preds = %for.inc17.i75, %mul_add_mat_x_m_mat.exit66
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc17.i75 ], [ 108, %mul_add_mat_x_m_mat.exit66 ], !dbg !1125
  %bs_mat_entries_used.0.i = phi i32 [ 0, %mul_add_mat_x_m_mat.exit66 ], [ %bs_mat_entries_used.1.i.lcssa, %for.inc17.i75 ], !dbg !1125
  %r.0.i68 = phi i32 [ 0, %mul_add_mat_x_m_mat.exit66 ], [ %inc18.i76, %for.inc17.i75 ], !dbg !1126
    #dbg_value(i32 %r.0.i68, !1121, !DIExpression(), !1123)
    #dbg_value(i32 %bs_mat_entries_used.0.i, !1120, !DIExpression(), !1111)
  %exitcond133 = icmp ne i32 %r.0.i68, 108, !dbg !1127
  br i1 %exitcond133, label %for.cond1.i72.preheader, label %for.cond.i34.preheader, !dbg !1129

for.cond.i34.preheader:                           ; preds = %for.cond.i67
  br label %for.cond.i34, !dbg !1130

for.cond1.i72.preheader:                          ; preds = %for.cond.i67
  %8 = add i32 %bs_mat_entries_used.0.i, %indvars.iv, !dbg !1132
  br label %for.cond1.i72, !dbg !1132

for.cond1.i72:                                    ; preds = %for.cond1.i72.preheader, %for.inc15.i80
  %bs_mat_entries_used.1.i = phi i32 [ %add14.i81, %for.inc15.i80 ], [ %bs_mat_entries_used.0.i, %for.cond1.i72.preheader ], !dbg !1111
  %c.0.i73 = phi i32 [ %inc.i82, %for.inc15.i80 ], [ %r.0.i68, %for.cond1.i72.preheader ], !dbg !1135
    #dbg_value(i32 %c.0.i73, !1136, !DIExpression(), !1137)
    #dbg_value(i32 %bs_mat_entries_used.1.i, !1120, !DIExpression(), !1111)
  %exitcond132 = icmp ne i32 %bs_mat_entries_used.1.i, %8, !dbg !1138
  br i1 %exitcond132, label %for.cond4.i77.preheader, label %for.inc17.i75, !dbg !1132

for.cond4.i77.preheader:                          ; preds = %for.cond1.i72
  br label %for.cond4.i77, !dbg !1140

for.cond4.i77:                                    ; preds = %for.cond4.i77.preheader, %for.body6.i83
  %k.0.i78 = phi i32 [ %add13.i, %for.body6.i83 ], [ 0, %for.cond4.i77.preheader ], !dbg !1143
    #dbg_value(i32 %k.0.i78, !1144, !DIExpression(), !1145)
  %exitcond131 = icmp ne i32 %k.0.i78, 11, !dbg !1146
  br i1 %exitcond131, label %for.body6.i83, label %for.inc15.i80, !dbg !1140

for.body6.i83:                                    ; preds = %for.cond4.i77
  %add.ptr.i85.idx = mul nsw i32 %bs_mat_entries_used.1.i, 56, !dbg !1148
  %add.ptr.i85 = getelementptr inbounds i8, ptr %sk, i32 %add.ptr.i85.idx, !dbg !1148
  %mul8.i86 = mul nuw nsw i32 %k.0.i78, 108, !dbg !1150
  %9 = getelementptr i8, ptr %Vdec, i32 %mul8.i86, !dbg !1151
  %arrayidx.i87 = getelementptr i8, ptr %9, i32 %c.0.i73, !dbg !1151
  %10 = load i8, ptr %arrayidx.i87, align 1, !dbg !1151
  %mul9.i = mul nuw nsw i32 %r.0.i68, 11, !dbg !1152
  %add10.i = add nuw nsw i32 %mul9.i, %k.0.i78, !dbg !1153
  %add.ptr12.i.idx = mul nuw nsw i32 %add10.i, 56, !dbg !1154
  %add.ptr12.i = getelementptr inbounds nuw i8, ptr %Pv.i, i32 %add.ptr12.i.idx, !dbg !1154
  call fastcc void @m_vec_mul_add(i32 noundef 7, ptr noundef nonnull %add.ptr.i85, i8 noundef zeroext %10, ptr noundef nonnull %add.ptr12.i) #9, !dbg !1155
  %add13.i = add nuw nsw i32 %k.0.i78, 1, !dbg !1156
    #dbg_value(i32 %add13.i, !1144, !DIExpression(), !1145)
  br label %for.cond4.i77, !dbg !1157, !llvm.loop !1158

for.inc15.i80:                                    ; preds = %for.cond4.i77
    #dbg_value(i32 %bs_mat_entries_used.1.i, !1120, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1111)
  %add14.i81 = add i32 %bs_mat_entries_used.1.i, 1, !dbg !1160
    #dbg_value(i32 %add14.i81, !1120, !DIExpression(), !1111)
  %inc.i82 = add nuw nsw i32 %c.0.i73, 1, !dbg !1161
    #dbg_value(i32 %inc.i82, !1136, !DIExpression(), !1137)
  br label %for.cond1.i72, !dbg !1162, !llvm.loop !1163

for.inc17.i75:                                    ; preds = %for.cond1.i72
  %bs_mat_entries_used.1.i.lcssa = phi i32 [ %bs_mat_entries_used.1.i, %for.cond1.i72 ], !dbg !1111
  %inc18.i76 = add nuw nsw i32 %r.0.i68, 1, !dbg !1165
    #dbg_value(i32 %inc18.i76, !1121, !DIExpression(), !1123)
  %indvars.iv.next = add nsw i32 %indvars.iv, -1, !dbg !1166
  br label %for.cond.i67, !dbg !1166, !llvm.loop !1167

for.cond.i34:                                     ; preds = %for.cond.i34.preheader, %for.inc17.i
  %r.0.i = phi i32 [ %inc18.i, %for.inc17.i ], [ 0, %for.cond.i34.preheader ], !dbg !1169
    #dbg_value(i32 %r.0.i, !1051, !DIExpression(), !1170)
  %exitcond136 = icmp ne i32 %r.0.i, 11, !dbg !1171
  br i1 %exitcond136, label %for.cond1.i36.preheader, label %mul_add_mat_x_m_mat.exit, !dbg !1130

for.cond1.i36.preheader:                          ; preds = %for.cond.i34
  br label %for.cond1.i36, !dbg !1172

for.cond1.i36:                                    ; preds = %for.cond1.i36.preheader, %for.inc15.i
  %c.0.i = phi i32 [ %inc.i38, %for.inc15.i ], [ 0, %for.cond1.i36.preheader ], !dbg !1173
    #dbg_value(i32 %c.0.i, !1063, !DIExpression(), !1174)
  %exitcond135 = icmp ne i32 %c.0.i, 108, !dbg !1175
  br i1 %exitcond135, label %for.cond4.i.preheader, label %for.inc17.i, !dbg !1172

for.cond4.i.preheader:                            ; preds = %for.cond1.i36
  br label %for.cond4.i, !dbg !1176

for.cond4.i:                                      ; preds = %for.cond4.i.preheader, %for.body6.i
  %k.0.i = phi i32 [ %add14.i, %for.body6.i ], [ 0, %for.cond4.i.preheader ], !dbg !1177
    #dbg_value(i32 %k.0.i, !1071, !DIExpression(), !1178)
  %exitcond134 = icmp ne i32 %k.0.i, 11, !dbg !1179
  br i1 %exitcond134, label %for.body6.i, label %for.inc15.i, !dbg !1176

for.body6.i:                                      ; preds = %for.cond4.i
  %mul.i = mul nuw nsw i32 %c.0.i, 11, !dbg !1180
  %add.i = add nuw nsw i32 %mul.i, %k.0.i, !dbg !1181
  %add.ptr.i39.idx = mul nuw nsw i32 %add.i, 56, !dbg !1182
  %add.ptr.i39 = getelementptr inbounds nuw i8, ptr %Pv.i, i32 %add.ptr.i39.idx, !dbg !1182
  %mul8.i = mul nuw nsw i32 %r.0.i, 108, !dbg !1183
  %11 = getelementptr i8, ptr %Vdec, i32 %mul8.i, !dbg !1184
  %arrayidx.i40 = getelementptr i8, ptr %11, i32 %c.0.i, !dbg !1184
  %12 = load i8, ptr %arrayidx.i40, align 1, !dbg !1184
  %mul10.i = mul nuw nsw i32 %r.0.i, 11, !dbg !1185
  %add11.i = add nuw nsw i32 %mul10.i, %k.0.i, !dbg !1186
  %add.ptr13.i.idx = mul nuw nsw i32 %add11.i, 56, !dbg !1187
  %add.ptr13.i = getelementptr inbounds nuw i8, ptr %A, i32 %add.ptr13.i.idx, !dbg !1187
  call fastcc void @m_vec_mul_add(i32 noundef 7, ptr noundef nonnull %add.ptr.i39, i8 noundef zeroext %12, ptr noundef nonnull %add.ptr13.i) #9, !dbg !1188
  %add14.i = add nuw nsw i32 %k.0.i, 1, !dbg !1189
    #dbg_value(i32 %add14.i, !1071, !DIExpression(), !1178)
  br label %for.cond4.i, !dbg !1190, !llvm.loop !1191

for.inc15.i:                                      ; preds = %for.cond4.i
  %inc.i38 = add nuw nsw i32 %c.0.i, 1, !dbg !1193
    #dbg_value(i32 %inc.i38, !1063, !DIExpression(), !1174)
  br label %for.cond1.i36, !dbg !1194, !llvm.loop !1195

for.inc17.i:                                      ; preds = %for.cond1.i36
  %inc18.i = add nuw nsw i32 %r.0.i, 1, !dbg !1197
    #dbg_value(i32 %inc18.i, !1051, !DIExpression(), !1170)
  br label %for.cond.i34, !dbg !1198, !llvm.loop !1199

mul_add_mat_x_m_mat.exit:                         ; preds = %for.cond.i34
  call void @llvm.lifetime.end.p0(i64 66528, ptr nonnull %Pv.i), !dbg !1201
  call fastcc void @compute_rhs(ptr noundef %p, ptr noundef nonnull %A, ptr noundef nonnull %t, ptr noundef nonnull %y) #9, !dbg !1202
  call void @llvm.lifetime.start.p0(i64 12544, ptr nonnull %A.i), !dbg !1203
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %tab.i), !dbg !1203
    #dbg_value(ptr %p, !1208, !DIExpression(), !1209)
    #dbg_value(ptr %Mtmp, !1210, !DIExpression(), !1209)
    #dbg_value(ptr %A, !1211, !DIExpression(), !1209)
    #dbg_value(i32 0, !1212, !DIExpression(), !1209)
    #dbg_value(i32 0, !1213, !DIExpression(), !1209)
    #dbg_value(i32 7, !1214, !DIExpression(), !1209)
    #dbg_declare(ptr %A.i, !1215, !DIExpression(), !1203)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(12544) %A.i, i8 0, i32 12544, i1 false), !dbg !1203
    #dbg_value(i32 112, !1219, !DIExpression(), !1209)
    #dbg_value(i64 1, !1220, !DIExpression(), !1223)
    #dbg_value(i64 281474976710656, !1220, !DIExpression(), !1223)
    #dbg_value(i64 281474976710655, !1220, !DIExpression(), !1223)
    #dbg_value(i32 0, !1224, !DIExpression(), !1226)
  br label %for.cond.i100, !dbg !1227

for.cond.i100:                                    ; preds = %for.body.i123, %mul_add_mat_x_m_mat.exit
  %i.0.i101 = phi i32 [ 0, %mul_add_mat_x_m_mat.exit ], [ %inc.i125, %for.body.i123 ], !dbg !1228
    #dbg_value(i32 %i.0.i101, !1224, !DIExpression(), !1226)
  %exitcond137 = icmp ne i32 %i.0.i101, 110, !dbg !1229
  br i1 %exitcond137, label %for.body.i123, label %for.cond3.i.preheader, !dbg !1231

for.cond3.i.preheader:                            ; preds = %for.cond.i100
  br label %for.cond3.i, !dbg !1232

for.body.i123:                                    ; preds = %for.cond.i100
  %.idx.i = mul nuw nsw i32 %i.0.i101, 56, !dbg !1234
  %13 = getelementptr inbounds nuw i8, ptr %Mtmp, i32 %.idx.i, !dbg !1234
  %arrayidx.i124 = getelementptr inbounds nuw i8, ptr %13, i32 48, !dbg !1234
  %14 = load i64, ptr %arrayidx.i124, align 8, !dbg !1236
  %and.i = and i64 %14, 281474976710655, !dbg !1236
  store i64 %and.i, ptr %arrayidx.i124, align 8, !dbg !1236
  %inc.i125 = add nuw nsw i32 %i.0.i101, 1, !dbg !1237
    #dbg_value(i32 %inc.i125, !1224, !DIExpression(), !1226)
  br label %for.cond.i100, !dbg !1238, !llvm.loop !1239

for.cond3.i:                                      ; preds = %for.cond3.i.preheader, %for.inc103.i
  %i2.0.i = phi i32 [ %inc104.i, %for.inc103.i ], [ 0, %for.cond3.i.preheader ], !dbg !1241
  %words_to_shift.0.i = phi i32 [ %words_to_shift.1.i.lcssa, %for.inc103.i ], [ 0, %for.cond3.i.preheader ], !dbg !1242
  %bits_to_shift.0.i = phi i32 [ %bits_to_shift.1.i.lcssa, %for.inc103.i ], [ 0, %for.cond3.i.preheader ], !dbg !1243
    #dbg_value(i32 %bits_to_shift.0.i, !1212, !DIExpression(), !1209)
    #dbg_value(i32 %words_to_shift.0.i, !1213, !DIExpression(), !1209)
    #dbg_value(i32 %i2.0.i, !1244, !DIExpression(), !1245)
  %exitcond142 = icmp ne i32 %i2.0.i, 11, !dbg !1246
  br i1 %exitcond142, label %for.cond6.i.preheader, label %for.cond107.i.preheader, !dbg !1232

for.cond107.i.preheader:                          ; preds = %for.cond3.i
  br label %for.cond107.i, !dbg !1248

for.cond6.i.preheader:                            ; preds = %for.cond3.i
  br label %for.cond6.i, !dbg !1250

for.cond6.i:                                      ; preds = %for.cond6.i.preheader, %if.end95.i
  %j.0.i119 = phi i32 [ %dec.i, %if.end95.i ], [ 10, %for.cond6.i.preheader ], !dbg !1253
  %words_to_shift.1.i = phi i32 [ %spec.select.i, %if.end95.i ], [ %words_to_shift.0.i, %for.cond6.i.preheader ], !dbg !1209
  %bits_to_shift.1.i = phi i32 [ %spec.select3.i, %if.end95.i ], [ %bits_to_shift.0.i, %for.cond6.i.preheader ], !dbg !1209
    #dbg_value(i32 %bits_to_shift.1.i, !1212, !DIExpression(), !1209)
    #dbg_value(i32 %words_to_shift.1.i, !1213, !DIExpression(), !1209)
    #dbg_value(i32 %j.0.i119, !1254, !DIExpression(), !1255)
  %cmp7.not.i = icmp slt i32 %j.0.i119, %i2.0.i, !dbg !1256
  br i1 %cmp7.not.i, label %for.inc103.i, label %for.body8.i, !dbg !1250

for.body8.i:                                      ; preds = %for.cond6.i
  %add.ptr.idx.i = mul nsw i32 %j.0.i119, 560, !dbg !1258
  %add.ptr.i120 = getelementptr inbounds i8, ptr %Mtmp, i32 %add.ptr.idx.i, !dbg !1258
    #dbg_value(ptr %add.ptr.i120, !1260, !DIExpression(), !1209)
    #dbg_value(i32 0, !1261, !DIExpression(), !1263)
  br label %for.cond11.i, !dbg !1264

for.cond11.i:                                     ; preds = %for.inc44.i, %for.body8.i
  %c.0.i121 = phi i32 [ 0, %for.body8.i ], [ %inc45.i, %for.inc44.i ], !dbg !1265
    #dbg_value(i32 %c.0.i121, !1261, !DIExpression(), !1263)
  %exitcond139 = icmp ne i32 %c.0.i121, 10, !dbg !1266
  br i1 %exitcond139, label %for.cond14.i.preheader, label %for.end46.i, !dbg !1268

for.cond14.i.preheader:                           ; preds = %for.cond11.i
  br label %for.cond14.i, !dbg !1269

for.cond14.i:                                     ; preds = %for.cond14.i.preheader, %for.inc41.i
  %k.0.i122 = phi i32 [ %inc42.i, %for.inc41.i ], [ 0, %for.cond14.i.preheader ], !dbg !1272
    #dbg_value(i32 %k.0.i122, !1273, !DIExpression(), !1274)
  %exitcond138 = icmp ne i32 %k.0.i122, 7, !dbg !1275
  br i1 %exitcond138, label %for.body16.i, label %for.inc44.i, !dbg !1269

for.body16.i:                                     ; preds = %for.cond14.i
  %15 = getelementptr inbounds nuw i64, ptr %add.ptr.i120, i32 %k.0.i122, !dbg !1277
  %arrayidx19.idx.i = mul nuw nsw i32 %c.0.i121, 56, !dbg !1277
  %arrayidx19.i = getelementptr inbounds nuw i8, ptr %15, i32 %arrayidx19.idx.i, !dbg !1277
  %16 = load i64, ptr %arrayidx19.i, align 8, !dbg !1277
  %sh_prom.i = zext nneg i32 %bits_to_shift.1.i to i64, !dbg !1279
  %shl20.i = shl i64 %16, %sh_prom.i, !dbg !1279
  %mul21.i = mul nuw nsw i32 %i2.0.i, 10, !dbg !1280
  %add22.i = add nuw nsw i32 %mul21.i, %c.0.i121, !dbg !1281
  %add23.i = add nsw i32 %k.0.i122, %words_to_shift.1.i, !dbg !1282
  %mul24.i = mul i32 %add23.i, 112, !dbg !1283
  %add25.i = add i32 %add22.i, %mul24.i, !dbg !1284
  %arrayidx26.i = getelementptr inbounds nuw [1568 x i64], ptr %A.i, i32 0, i32 %add25.i, !dbg !1285
  %17 = load i64, ptr %arrayidx26.i, align 8, !dbg !1286
  %xor.i = xor i64 %17, %shl20.i, !dbg !1286
  store i64 %xor.i, ptr %arrayidx26.i, align 8, !dbg !1286
  %cmp27.i = icmp sgt i32 %bits_to_shift.1.i, 0, !dbg !1287
  br i1 %cmp27.i, label %if.then.i, label %for.inc41.i, !dbg !1287

if.then.i:                                        ; preds = %for.body16.i
  %18 = getelementptr inbounds nuw i64, ptr %add.ptr.i120, i32 %k.0.i122, !dbg !1289
  %arrayidx30.idx.i = mul nuw nsw i32 %c.0.i121, 56, !dbg !1289
  %arrayidx30.i = getelementptr inbounds nuw i8, ptr %18, i32 %arrayidx30.idx.i, !dbg !1289
  %19 = load i64, ptr %arrayidx30.i, align 8, !dbg !1289
  %sub31.i = sub nsw i32 64, %bits_to_shift.1.i, !dbg !1291
  %sh_prom32.i = zext nneg i32 %sub31.i to i64, !dbg !1292
  %shr.i = lshr i64 %19, %sh_prom32.i, !dbg !1292
  %mul33.i = mul nuw nsw i32 %i2.0.i, 10, !dbg !1293
  %add34.i = add nuw nsw i32 %mul33.i, %c.0.i121, !dbg !1294
  %add35.i = add nsw i32 %k.0.i122, %words_to_shift.1.i, !dbg !1295
  %20 = mul i32 %add35.i, 112, !dbg !1296
  %mul37.i = add i32 %20, 112, !dbg !1296
  %add38.i = add i32 %add34.i, %mul37.i, !dbg !1297
  %arrayidx39.i = getelementptr inbounds nuw [1568 x i64], ptr %A.i, i32 0, i32 %add38.i, !dbg !1298
  %21 = load i64, ptr %arrayidx39.i, align 8, !dbg !1299
  %xor40.i = xor i64 %21, %shr.i, !dbg !1299
  store i64 %xor40.i, ptr %arrayidx39.i, align 8, !dbg !1299
  br label %for.inc41.i, !dbg !1300

for.inc41.i:                                      ; preds = %if.then.i, %for.body16.i
  %inc42.i = add nuw nsw i32 %k.0.i122, 1, !dbg !1301
    #dbg_value(i32 %inc42.i, !1273, !DIExpression(), !1274)
  br label %for.cond14.i, !dbg !1302, !llvm.loop !1303

for.inc44.i:                                      ; preds = %for.cond14.i
  %inc45.i = add nuw nsw i32 %c.0.i121, 1, !dbg !1305
    #dbg_value(i32 %inc45.i, !1261, !DIExpression(), !1263)
  br label %for.cond11.i, !dbg !1306, !llvm.loop !1307

for.end46.i:                                      ; preds = %for.cond11.i
  %cmp47.not.i = icmp eq i32 %i2.0.i, %j.0.i119, !dbg !1309
  br i1 %cmp47.not.i, label %if.end95.i, label %if.then48.i, !dbg !1309

if.then48.i:                                      ; preds = %for.end46.i
  %add.ptr51.idx.i = mul nuw nsw i32 %i2.0.i, 560, !dbg !1311
  %add.ptr51.i = getelementptr inbounds nuw i8, ptr %Mtmp, i32 %add.ptr51.idx.i, !dbg !1311
    #dbg_value(ptr %add.ptr51.i, !1313, !DIExpression(), !1209)
    #dbg_value(i32 0, !1314, !DIExpression(), !1316)
  br label %for.cond53.i, !dbg !1317

for.cond53.i:                                     ; preds = %for.inc92.i, %if.then48.i
  %c52.0.i = phi i32 [ 0, %if.then48.i ], [ %inc93.i, %for.inc92.i ], !dbg !1318
    #dbg_value(i32 %c52.0.i, !1314, !DIExpression(), !1316)
  %exitcond141 = icmp ne i32 %c52.0.i, 10, !dbg !1319
  br i1 %exitcond141, label %for.cond57.i.preheader, label %if.end95.i.loopexit, !dbg !1321

for.cond57.i.preheader:                           ; preds = %for.cond53.i
  br label %for.cond57.i, !dbg !1322

for.cond57.i:                                     ; preds = %for.cond57.i.preheader, %for.inc89.i
  %k56.0.i = phi i32 [ %inc90.i, %for.inc89.i ], [ 0, %for.cond57.i.preheader ], !dbg !1325
    #dbg_value(i32 %k56.0.i, !1326, !DIExpression(), !1327)
  %exitcond140 = icmp ne i32 %k56.0.i, 7, !dbg !1328
  br i1 %exitcond140, label %for.body59.i, label %for.inc92.i, !dbg !1322

for.body59.i:                                     ; preds = %for.cond57.i
  %22 = getelementptr inbounds nuw i64, ptr %add.ptr51.i, i32 %k56.0.i, !dbg !1330
  %arrayidx62.idx.i = mul nuw nsw i32 %c52.0.i, 56, !dbg !1330
  %arrayidx62.i = getelementptr inbounds nuw i8, ptr %22, i32 %arrayidx62.idx.i, !dbg !1330
  %23 = load i64, ptr %arrayidx62.i, align 8, !dbg !1330
  %sh_prom63.i = zext nneg i32 %bits_to_shift.1.i to i64, !dbg !1332
  %shl64.i = shl i64 %23, %sh_prom63.i, !dbg !1332
  %mul65.i = mul nsw i32 %j.0.i119, 10, !dbg !1333
  %add66.i = add nsw i32 %mul65.i, %c52.0.i, !dbg !1334
  %add67.i = add nsw i32 %k56.0.i, %words_to_shift.1.i, !dbg !1335
  %mul68.i = mul i32 %add67.i, 112, !dbg !1336
  %add69.i = add i32 %add66.i, %mul68.i, !dbg !1337
  %arrayidx70.i = getelementptr inbounds nuw [1568 x i64], ptr %A.i, i32 0, i32 %add69.i, !dbg !1338
  %24 = load i64, ptr %arrayidx70.i, align 8, !dbg !1339
  %xor71.i = xor i64 %24, %shl64.i, !dbg !1339
  store i64 %xor71.i, ptr %arrayidx70.i, align 8, !dbg !1339
  %cmp72.i = icmp sgt i32 %bits_to_shift.1.i, 0, !dbg !1340
  br i1 %cmp72.i, label %if.then73.i, label %for.inc89.i, !dbg !1340

if.then73.i:                                      ; preds = %for.body59.i
  %25 = getelementptr inbounds nuw i64, ptr %add.ptr51.i, i32 %k56.0.i, !dbg !1342
  %arrayidx76.idx.i = mul nuw nsw i32 %c52.0.i, 56, !dbg !1342
  %arrayidx76.i = getelementptr inbounds nuw i8, ptr %25, i32 %arrayidx76.idx.i, !dbg !1342
  %26 = load i64, ptr %arrayidx76.i, align 8, !dbg !1342
  %sub77.i = sub nsw i32 64, %bits_to_shift.1.i, !dbg !1344
  %sh_prom78.i = zext nneg i32 %sub77.i to i64, !dbg !1345
  %shr79.i = lshr i64 %26, %sh_prom78.i, !dbg !1345
  %mul80.i = mul nsw i32 %j.0.i119, 10, !dbg !1346
  %add81.i = add nsw i32 %mul80.i, %c52.0.i, !dbg !1347
  %add82.i = add nsw i32 %k56.0.i, %words_to_shift.1.i, !dbg !1348
  %27 = mul i32 %add82.i, 112, !dbg !1349
  %mul84.i = add i32 %27, 112, !dbg !1349
  %add85.i = add i32 %add81.i, %mul84.i, !dbg !1350
  %arrayidx86.i = getelementptr inbounds nuw [1568 x i64], ptr %A.i, i32 0, i32 %add85.i, !dbg !1351
  %28 = load i64, ptr %arrayidx86.i, align 8, !dbg !1352
  %xor87.i = xor i64 %28, %shr79.i, !dbg !1352
  store i64 %xor87.i, ptr %arrayidx86.i, align 8, !dbg !1352
  br label %for.inc89.i, !dbg !1353

for.inc89.i:                                      ; preds = %if.then73.i, %for.body59.i
  %inc90.i = add nuw nsw i32 %k56.0.i, 1, !dbg !1354
    #dbg_value(i32 %inc90.i, !1326, !DIExpression(), !1327)
  br label %for.cond57.i, !dbg !1355, !llvm.loop !1356

for.inc92.i:                                      ; preds = %for.cond57.i
  %inc93.i = add nuw nsw i32 %c52.0.i, 1, !dbg !1358
    #dbg_value(i32 %inc93.i, !1314, !DIExpression(), !1316)
  br label %for.cond53.i, !dbg !1359, !llvm.loop !1360

if.end95.i.loopexit:                              ; preds = %for.cond53.i
  br label %if.end95.i, !dbg !1362

if.end95.i:                                       ; preds = %if.end95.i.loopexit, %for.end46.i
  %add96.i = add nsw i32 %bits_to_shift.1.i, 4, !dbg !1362
    #dbg_value(i32 %add96.i, !1212, !DIExpression(), !1209)
  %cmp97.i = icmp eq i32 %add96.i, 64, !dbg !1363
  %inc99.i = zext i1 %cmp97.i to i32, !dbg !1363
  %spec.select.i = add nsw i32 %words_to_shift.1.i, %inc99.i, !dbg !1363
  %spec.select3.i = select i1 %cmp97.i, i32 0, i32 %add96.i, !dbg !1363
    #dbg_value(i32 %spec.select3.i, !1212, !DIExpression(), !1209)
    #dbg_value(i32 %spec.select.i, !1213, !DIExpression(), !1209)
  %dec.i = add nsw i32 %j.0.i119, -1, !dbg !1365
    #dbg_value(i32 %dec.i, !1254, !DIExpression(), !1255)
  br label %for.cond6.i, !dbg !1366, !llvm.loop !1367

for.inc103.i:                                     ; preds = %for.cond6.i
  %words_to_shift.1.i.lcssa = phi i32 [ %words_to_shift.1.i, %for.cond6.i ], !dbg !1209
  %bits_to_shift.1.i.lcssa = phi i32 [ %bits_to_shift.1.i, %for.cond6.i ], !dbg !1209
  %inc104.i = add nuw nsw i32 %i2.0.i, 1, !dbg !1369
    #dbg_value(i32 %inc104.i, !1244, !DIExpression(), !1245)
  br label %for.cond3.i, !dbg !1370, !llvm.loop !1371

for.cond107.i:                                    ; preds = %for.cond107.i.preheader, %transpose_16x16_nibbles.exit.i
  %c106.0.i = phi i32 [ %add113.i, %transpose_16x16_nibbles.exit.i ], [ 0, %for.cond107.i.preheader ], !dbg !1373
    #dbg_value(i32 %c106.0.i, !1374, !DIExpression(), !1375)
  %cmp109.i = icmp samesign ult i32 %c106.0.i, 1232, !dbg !1376
  br i1 %cmp109.i, label %for.body110.i, label %for.end114.i, !dbg !1248

for.body110.i:                                    ; preds = %for.cond107.i
  %add.ptr111.i = getelementptr inbounds nuw i64, ptr %A.i, i32 %c106.0.i, !dbg !1378
    #dbg_value(ptr %add.ptr111.i, !1380, !DIExpression(), !1381)
    #dbg_value(i32 0, !1383, !DIExpression(), !1385)
  br label %for.cond.i31.i, !dbg !1386

for.cond.i31.i:                                   ; preds = %for.body.i35.i, %for.body110.i
  %i.0.i32.i = phi i32 [ 0, %for.body110.i ], [ %add7.i.i, %for.body.i35.i ], !dbg !1387
    #dbg_value(i32 %i.0.i32.i, !1383, !DIExpression(), !1385)
  %cmp.i33.i = icmp samesign ult i32 %i.0.i32.i, 16, !dbg !1388
  br i1 %cmp.i33.i, label %for.body.i35.i, label %for.cond9.i.i.preheader, !dbg !1390

for.cond9.i.i.preheader:                          ; preds = %for.cond.i31.i
  br label %for.cond9.i.i, !dbg !1391

for.body.i35.i:                                   ; preds = %for.cond.i31.i
  %arrayidx.i36.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %i.0.i32.i, !dbg !1393
  %29 = load i64, ptr %arrayidx.i36.i, align 8, !dbg !1393
  %shr.i.i = lshr i64 %29, 4, !dbg !1395
  %add.i.i = or disjoint i32 %i.0.i32.i, 1, !dbg !1396
  %arrayidx1.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add.i.i, !dbg !1397
  %30 = load i64, ptr %arrayidx1.i.i, align 8, !dbg !1397
  %xor.i.i = xor i64 %shr.i.i, %30, !dbg !1398
  %and.i.i = and i64 %xor.i.i, 1085102592571150095, !dbg !1399
    #dbg_value(i64 %and.i.i, !1400, !DIExpression(), !1401)
  %shl.i.i = shl nuw i64 %and.i.i, 4, !dbg !1402
  %arrayidx2.i37.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %i.0.i32.i, !dbg !1403
  %31 = load i64, ptr %arrayidx2.i37.i, align 8, !dbg !1404
  %xor3.i.i = xor i64 %31, %shl.i.i, !dbg !1404
  store i64 %xor3.i.i, ptr %arrayidx2.i37.i, align 8, !dbg !1404
  %add4.i.i = or disjoint i32 %i.0.i32.i, 1, !dbg !1405
  %arrayidx5.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add4.i.i, !dbg !1406
  %32 = load i64, ptr %arrayidx5.i.i, align 8, !dbg !1407
  %xor6.i.i = xor i64 %32, %and.i.i, !dbg !1407
  store i64 %xor6.i.i, ptr %arrayidx5.i.i, align 8, !dbg !1407
  %add7.i.i = add nuw nsw i32 %i.0.i32.i, 2, !dbg !1408
    #dbg_value(i32 %add7.i.i, !1383, !DIExpression(), !1385)
  br label %for.cond.i31.i, !dbg !1409, !llvm.loop !1410

for.cond9.i.i:                                    ; preds = %for.cond9.i.i.preheader, %for.body11.i.i
  %i8.0.i.i = phi i32 [ %add39.i.i, %for.body11.i.i ], [ 0, %for.cond9.i.i.preheader ], !dbg !1412
    #dbg_value(i32 %i8.0.i.i, !1413, !DIExpression(), !1414)
  %cmp10.i.i = icmp samesign ult i32 %i8.0.i.i, 16, !dbg !1415
  br i1 %cmp10.i.i, label %for.body11.i.i, label %for.cond42.i.i.preheader, !dbg !1391

for.cond42.i.i.preheader:                         ; preds = %for.cond9.i.i
  br label %for.cond42.i.i, !dbg !1417

for.body11.i.i:                                   ; preds = %for.cond9.i.i
  %arrayidx12.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %i8.0.i.i, !dbg !1419
  %33 = load i64, ptr %arrayidx12.i.i, align 8, !dbg !1419
  %shr13.i.i = lshr i64 %33, 8, !dbg !1421
  %add14.i.i = or disjoint i32 %i8.0.i.i, 2, !dbg !1422
  %arrayidx15.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add14.i.i, !dbg !1423
  %34 = load i64, ptr %arrayidx15.i.i, align 8, !dbg !1423
  %xor16.i.i = xor i64 %shr13.i.i, %34, !dbg !1424
  %and17.i.i = and i64 %xor16.i.i, 71777214294589695, !dbg !1425
    #dbg_value(i64 %and17.i.i, !1426, !DIExpression(), !1427)
  %add18.i.i = or disjoint i32 %i8.0.i.i, 1, !dbg !1428
  %arrayidx19.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add18.i.i, !dbg !1429
  %35 = load i64, ptr %arrayidx19.i.i, align 8, !dbg !1429
  %shr20.i.i = lshr i64 %35, 8, !dbg !1430
  %add21.i.i = or disjoint i32 %i8.0.i.i, 3, !dbg !1431
  %arrayidx22.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add21.i.i, !dbg !1432
  %36 = load i64, ptr %arrayidx22.i.i, align 8, !dbg !1432
  %xor23.i.i = xor i64 %shr20.i.i, %36, !dbg !1433
  %and24.i.i = and i64 %xor23.i.i, 71777214294589695, !dbg !1434
    #dbg_value(i64 %and24.i.i, !1435, !DIExpression(), !1427)
  %shl25.i.i = shl nuw i64 %and17.i.i, 8, !dbg !1436
  %arrayidx26.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %i8.0.i.i, !dbg !1437
  %37 = load i64, ptr %arrayidx26.i.i, align 8, !dbg !1438
  %xor27.i.i = xor i64 %37, %shl25.i.i, !dbg !1438
  store i64 %xor27.i.i, ptr %arrayidx26.i.i, align 8, !dbg !1438
  %shl28.i.i = shl nuw i64 %and24.i.i, 8, !dbg !1439
  %add29.i.i = or disjoint i32 %i8.0.i.i, 1, !dbg !1440
  %arrayidx30.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add29.i.i, !dbg !1441
  %38 = load i64, ptr %arrayidx30.i.i, align 8, !dbg !1442
  %xor31.i.i = xor i64 %38, %shl28.i.i, !dbg !1442
  store i64 %xor31.i.i, ptr %arrayidx30.i.i, align 8, !dbg !1442
  %add32.i.i = or disjoint i32 %i8.0.i.i, 2, !dbg !1443
  %arrayidx33.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add32.i.i, !dbg !1444
  %39 = load i64, ptr %arrayidx33.i.i, align 8, !dbg !1445
  %xor34.i.i = xor i64 %39, %and17.i.i, !dbg !1445
  store i64 %xor34.i.i, ptr %arrayidx33.i.i, align 8, !dbg !1445
  %add35.i.i = or disjoint i32 %i8.0.i.i, 3, !dbg !1446
  %arrayidx36.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add35.i.i, !dbg !1447
  %40 = load i64, ptr %arrayidx36.i.i, align 8, !dbg !1448
  %xor37.i.i = xor i64 %40, %and24.i.i, !dbg !1448
  store i64 %xor37.i.i, ptr %arrayidx36.i.i, align 8, !dbg !1448
  %add39.i.i = add nuw nsw i32 %i8.0.i.i, 4, !dbg !1449
    #dbg_value(i32 %add39.i.i, !1413, !DIExpression(), !1414)
  br label %for.cond9.i.i, !dbg !1450, !llvm.loop !1451

for.cond42.i.i:                                   ; preds = %for.cond42.i.i.preheader, %for.body44.i.i
  %i41.0.i.i = phi i32 [ %inc.i34.i, %for.body44.i.i ], [ 0, %for.cond42.i.i.preheader ], !dbg !1453
    #dbg_value(i32 %i41.0.i.i, !1454, !DIExpression(), !1455)
  %exitcond143 = icmp ne i32 %i41.0.i.i, 4, !dbg !1456
  br i1 %exitcond143, label %for.body44.i.i, label %for.cond76.i.i.preheader, !dbg !1417

for.cond76.i.i.preheader:                         ; preds = %for.cond42.i.i
  br label %for.cond76.i.i, !dbg !1458

for.body44.i.i:                                   ; preds = %for.cond42.i.i
  %arrayidx46.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %i41.0.i.i, !dbg !1460
  %41 = load i64, ptr %arrayidx46.i.i, align 8, !dbg !1460
  %shr47.i.i = lshr i64 %41, 16, !dbg !1462
  %add48.i.i = or disjoint i32 %i41.0.i.i, 4, !dbg !1463
  %arrayidx49.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add48.i.i, !dbg !1464
  %42 = load i64, ptr %arrayidx49.i.i, align 8, !dbg !1464
  %xor50.i.i = xor i64 %shr47.i.i, %42, !dbg !1465
  %and51.i.i = and i64 %xor50.i.i, 281470681808895, !dbg !1466
    #dbg_value(i64 %and51.i.i, !1467, !DIExpression(), !1468)
  %add53.i.i = or disjoint i32 %i41.0.i.i, 8, !dbg !1469
  %arrayidx54.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add53.i.i, !dbg !1470
  %43 = load i64, ptr %arrayidx54.i.i, align 8, !dbg !1470
  %shr55.i.i = lshr i64 %43, 16, !dbg !1471
  %add56.i.i = or disjoint i32 %i41.0.i.i, 12, !dbg !1472
  %arrayidx57.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add56.i.i, !dbg !1473
  %44 = load i64, ptr %arrayidx57.i.i, align 8, !dbg !1473
  %xor58.i.i = xor i64 %shr55.i.i, %44, !dbg !1474
  %and59.i.i = and i64 %xor58.i.i, 281470681808895, !dbg !1475
    #dbg_value(i64 %and59.i.i, !1476, !DIExpression(), !1468)
  %shl60.i.i = shl nuw i64 %and51.i.i, 16, !dbg !1477
  %arrayidx61.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %i41.0.i.i, !dbg !1478
  %45 = load i64, ptr %arrayidx61.i.i, align 8, !dbg !1479
  %xor62.i.i = xor i64 %45, %shl60.i.i, !dbg !1479
  store i64 %xor62.i.i, ptr %arrayidx61.i.i, align 8, !dbg !1479
  %shl63.i.i = shl nuw i64 %and59.i.i, 16, !dbg !1480
  %add64.i.i = or disjoint i32 %i41.0.i.i, 8, !dbg !1481
  %arrayidx65.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add64.i.i, !dbg !1482
  %46 = load i64, ptr %arrayidx65.i.i, align 8, !dbg !1483
  %xor66.i.i = xor i64 %46, %shl63.i.i, !dbg !1483
  store i64 %xor66.i.i, ptr %arrayidx65.i.i, align 8, !dbg !1483
  %add67.i.i = or disjoint i32 %i41.0.i.i, 4, !dbg !1484
  %arrayidx68.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add67.i.i, !dbg !1485
  %47 = load i64, ptr %arrayidx68.i.i, align 8, !dbg !1486
  %xor69.i.i = xor i64 %47, %and51.i.i, !dbg !1486
  store i64 %xor69.i.i, ptr %arrayidx68.i.i, align 8, !dbg !1486
  %add70.i.i = or disjoint i32 %i41.0.i.i, 12, !dbg !1487
  %arrayidx71.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add70.i.i, !dbg !1488
  %48 = load i64, ptr %arrayidx71.i.i, align 8, !dbg !1489
  %xor72.i.i = xor i64 %48, %and59.i.i, !dbg !1489
  store i64 %xor72.i.i, ptr %arrayidx71.i.i, align 8, !dbg !1489
  %inc.i34.i = add nuw nsw i32 %i41.0.i.i, 1, !dbg !1490
    #dbg_value(i32 %inc.i34.i, !1454, !DIExpression(), !1455)
  br label %for.cond42.i.i, !dbg !1491, !llvm.loop !1492

for.cond76.i.i:                                   ; preds = %for.cond76.i.i.preheader, %for.body78.i.i
  %i75.0.i.i = phi i32 [ %inc93.i.i, %for.body78.i.i ], [ 0, %for.cond76.i.i.preheader ], !dbg !1494
    #dbg_value(i32 %i75.0.i.i, !1495, !DIExpression(), !1496)
  %exitcond144 = icmp ne i32 %i75.0.i.i, 8, !dbg !1497
  br i1 %exitcond144, label %for.body78.i.i, label %transpose_16x16_nibbles.exit.i, !dbg !1458

for.body78.i.i:                                   ; preds = %for.cond76.i.i
  %arrayidx80.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %i75.0.i.i, !dbg !1499
  %49 = load i64, ptr %arrayidx80.i.i, align 8, !dbg !1499
  %shr81.i.i = lshr i64 %49, 32, !dbg !1501
  %add82.i.i = or disjoint i32 %i75.0.i.i, 8, !dbg !1502
  %arrayidx83.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add82.i.i, !dbg !1503
  %50 = load i64, ptr %arrayidx83.i.i, align 8, !dbg !1503
  %.masked.i.i = and i64 %50, 4294967295, !dbg !1504
  %and85.i.i = xor i64 %shr81.i.i, %.masked.i.i, !dbg !1504
    #dbg_value(i64 %and85.i.i, !1505, !DIExpression(), !1506)
  %shl86.i.i = shl nuw i64 %and85.i.i, 32, !dbg !1507
  %arrayidx87.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %i75.0.i.i, !dbg !1508
  %51 = load i64, ptr %arrayidx87.i.i, align 8, !dbg !1509
  %xor88.i.i = xor i64 %51, %shl86.i.i, !dbg !1509
  store i64 %xor88.i.i, ptr %arrayidx87.i.i, align 8, !dbg !1509
  %add89.i.i = or disjoint i32 %i75.0.i.i, 8, !dbg !1510
  %arrayidx90.i.i = getelementptr inbounds nuw i64, ptr %add.ptr111.i, i32 %add89.i.i, !dbg !1511
  %52 = load i64, ptr %arrayidx90.i.i, align 8, !dbg !1512
  %xor91.i.i = xor i64 %52, %and85.i.i, !dbg !1512
  store i64 %xor91.i.i, ptr %arrayidx90.i.i, align 8, !dbg !1512
  %inc93.i.i = add nuw nsw i32 %i75.0.i.i, 1, !dbg !1513
    #dbg_value(i32 %inc93.i.i, !1495, !DIExpression(), !1496)
  br label %for.cond76.i.i, !dbg !1514, !llvm.loop !1515

transpose_16x16_nibbles.exit.i:                   ; preds = %for.cond76.i.i
  %add113.i = add nuw nsw i32 %c106.0.i, 16, !dbg !1517
    #dbg_value(i32 %add113.i, !1374, !DIExpression(), !1375)
  br label %for.cond107.i, !dbg !1518, !llvm.loop !1519

for.end114.i:                                     ; preds = %for.cond107.i
    #dbg_declare(ptr %tab.i, !1521, !DIExpression(), !1525)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(16) %tab.i, i8 0, i32 16, i1 false), !dbg !1525
    #dbg_value(i32 0, !1526, !DIExpression(), !1528)
  br label %for.cond116.i, !dbg !1529

for.cond116.i:                                    ; preds = %for.body118.i, %for.end114.i
  %i115.0.i = phi i32 [ 0, %for.end114.i ], [ %inc138.i, %for.body118.i ], !dbg !1530
    #dbg_value(i32 %i115.0.i, !1526, !DIExpression(), !1528)
  %exitcond145 = icmp ne i32 %i115.0.i, 4, !dbg !1531
  br i1 %exitcond145, label %for.body118.i, label %for.cond141.i.preheader, !dbg !1533

for.cond141.i.preheader:                          ; preds = %for.cond116.i
  br label %for.cond141.i, !dbg !1534

for.body118.i:                                    ; preds = %for.cond116.i
  %arrayidx119.i = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %i115.0.i, !dbg !1536
  %53 = load i8, ptr %arrayidx119.i, align 1, !dbg !1536
    #dbg_value(i8 %53, !1538, !DIExpression(), !1542)
    #dbg_value(i8 1, !1544, !DIExpression(), !1542)
  %54 = load volatile i8, ptr @pqmayo_MAYO_3_ref_unsigned_char_blocker, align 1, !dbg !1545
  %xor1.i4.i = xor i8 %53, %54, !dbg !1546
    #dbg_value(i8 %xor1.i4.i, !1538, !DIExpression(), !1542)
    #dbg_value(i8 poison, !1547, !DIExpression(), !1542)
    #dbg_value(i8 %xor1.i4.i, !1547, !DIExpression(DW_OP_constu, 3, DW_OP_and, DW_OP_stack_value), !1542)
    #dbg_value(i8 %xor1.i4.i, !1547, !DIExpression(DW_OP_constu, 7, DW_OP_and, DW_OP_stack_value), !1542)
  %xor25.i11.i = and i8 %xor1.i4.i, 15, !dbg !1548
    #dbg_value(i8 %xor25.i11.i, !1547, !DIExpression(), !1542)
    #dbg_value(i8 %xor25.i11.i, !1549, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !1542)
    #dbg_value(i8 %xor25.i11.i, !1550, !DIExpression(), !1542)
  %mul120.i = shl nuw nsw i32 %i115.0.i, 2, !dbg !1551
  %arrayidx121.i = getelementptr inbounds nuw [16 x i8], ptr %tab.i, i32 0, i32 %mul120.i, !dbg !1552
  store i8 %xor25.i11.i, ptr %arrayidx121.i, align 1, !dbg !1553
    #dbg_value(i8 %53, !1538, !DIExpression(), !1554)
    #dbg_value(i8 2, !1544, !DIExpression(), !1554)
  %55 = load volatile i8, ptr @pqmayo_MAYO_3_ref_unsigned_char_blocker, align 1, !dbg !1556
  %xor1.i13.i = xor i8 %53, %55, !dbg !1557
    #dbg_value(i8 %xor1.i13.i, !1538, !DIExpression(), !1554)
  %56 = trunc i8 %xor1.i13.i to i1, !dbg !1558
    #dbg_value(i8 poison, !1547, !DIExpression(), !1554)
  %57 = shl i8 %xor1.i13.i, 1, !dbg !1559
  %mul9.i14.i = and i8 %57, 4, !dbg !1559
  %conv10.i15.i = select i1 %56, i8 2, i8 0, !dbg !1558
  %xor11.i16.i = or disjoint i8 %conv10.i15.i, %mul9.i14.i, !dbg !1560
    #dbg_value(i8 %xor11.i16.i, !1547, !DIExpression(), !1554)
  %58 = shl i8 %xor1.i13.i, 1, !dbg !1561
  %mul16.i17.i = and i8 %58, 8, !dbg !1561
  %xor18.i18.i = or disjoint i8 %mul16.i17.i, %xor11.i16.i, !dbg !1562
    #dbg_value(i8 %xor18.i18.i, !1547, !DIExpression(), !1554)
  %59 = shl i8 %xor1.i13.i, 1, !dbg !1563
  %mul23.i19.i = and i8 %59, 16, !dbg !1563
    #dbg_value(!DIArgList(i8 %59, i8 %xor18.i18.i), !1547, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_constu, 16, DW_OP_and, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value), !1554)
    #dbg_value(!DIArgList(i8 %59, i8 %xor18.i18.i), !1549, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_constu, 16, DW_OP_and, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !1554)
  %60 = lshr exact i8 %mul23.i19.i, 4, !dbg !1564
  %61 = lshr exact i8 %mul23.i19.i, 3, !dbg !1565
  %62 = or disjoint i8 %60, %61, !dbg !1566
  %63 = xor i8 %62, %xor18.i18.i, !dbg !1567
    #dbg_value(i8 %63, !1550, !DIExpression(), !1554)
  %mul124.i = shl nuw nsw i32 %i115.0.i, 2, !dbg !1568
  %add125.i = or disjoint i32 %mul124.i, 1, !dbg !1569
  %arrayidx126.i = getelementptr inbounds nuw [16 x i8], ptr %tab.i, i32 0, i32 %add125.i, !dbg !1570
  store i8 %63, ptr %arrayidx126.i, align 1, !dbg !1571
  %arrayidx127.i = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %i115.0.i, !dbg !1572
  %64 = load i8, ptr %arrayidx127.i, align 1, !dbg !1572
    #dbg_value(i8 %64, !1538, !DIExpression(), !1573)
    #dbg_value(i8 4, !1544, !DIExpression(), !1573)
  %65 = load volatile i8, ptr @pqmayo_MAYO_3_ref_unsigned_char_blocker, align 1, !dbg !1575
  %xor1.i22.i = xor i8 %64, %65, !dbg !1576
    #dbg_value(i8 %xor1.i22.i, !1538, !DIExpression(), !1573)
  %66 = trunc i8 %xor1.i22.i to i1, !dbg !1577
    #dbg_value(i8 poison, !1547, !DIExpression(), !1573)
  %67 = shl i8 %xor1.i22.i, 2, !dbg !1578
  %mul9.i23.i = and i8 %67, 8, !dbg !1578
  %conv10.i24.i = select i1 %66, i8 4, i8 0, !dbg !1577
  %xor11.i25.i = or disjoint i8 %conv10.i24.i, %mul9.i23.i, !dbg !1579
    #dbg_value(!DIArgList(i8 %conv10.i24.i, i8 %mul9.i23.i), !1547, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value), !1573)
  %68 = shl i8 %xor1.i22.i, 2, !dbg !1580
  %mul16.i26.i = and i8 %68, 16, !dbg !1580
    #dbg_value(!DIArgList(i8 %mul16.i26.i, i8 %conv10.i24.i, i8 %mul9.i23.i), !1547, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_or, DW_OP_or, DW_OP_stack_value), !1573)
  %69 = shl i8 %xor1.i22.i, 2, !dbg !1581
  %mul23.i28.i = and i8 %69, 32, !dbg !1581
  %70 = or disjoint i8 %mul16.i26.i, %mul23.i28.i, !dbg !1582
    #dbg_value(!DIArgList(i8 %mul23.i28.i, i8 %mul16.i26.i, i8 %conv10.i24.i, i8 %mul9.i23.i), !1547, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_or, DW_OP_or, DW_OP_or, DW_OP_stack_value), !1573)
    #dbg_value(!DIArgList(i8 %mul23.i28.i, i8 %mul16.i26.i, i8 %conv10.i24.i, i8 %mul9.i23.i), !1549, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_or, DW_OP_or, DW_OP_or, DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !1573)
  %71 = lshr exact i8 %70, 4, !dbg !1583
  %72 = lshr exact i8 %70, 3, !dbg !1584
  %73 = xor i8 %71, %72, !dbg !1585
  %74 = xor i8 %73, %xor11.i25.i, !dbg !1586
    #dbg_value(i8 %74, !1550, !DIExpression(), !1573)
  %mul129.i = shl nuw nsw i32 %i115.0.i, 2, !dbg !1587
  %add130.i = or disjoint i32 %mul129.i, 2, !dbg !1588
  %arrayidx131.i = getelementptr inbounds nuw [16 x i8], ptr %tab.i, i32 0, i32 %add130.i, !dbg !1589
  store i8 %74, ptr %arrayidx131.i, align 1, !dbg !1590
  %arrayidx132.i = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %i115.0.i, !dbg !1591
  %75 = load i8, ptr %arrayidx132.i, align 1, !dbg !1591
    #dbg_value(i8 %75, !1538, !DIExpression(), !1592)
    #dbg_value(i8 8, !1544, !DIExpression(), !1592)
  %76 = load volatile i8, ptr @pqmayo_MAYO_3_ref_unsigned_char_blocker, align 1, !dbg !1594
  %xor1.i.i110 = xor i8 %75, %76, !dbg !1595
    #dbg_value(i8 %xor1.i.i110, !1538, !DIExpression(), !1592)
  %77 = trunc i8 %xor1.i.i110 to i1, !dbg !1596
    #dbg_value(i8 poison, !1547, !DIExpression(), !1592)
  %78 = shl i8 %xor1.i.i110, 3, !dbg !1597
  %mul9.i.i111 = and i8 %78, 16, !dbg !1597
  %conv10.i.i112 = select i1 %77, i8 8, i8 0, !dbg !1596
    #dbg_value(!DIArgList(i8 poison, i8 poison), !1547, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value), !1592)
  %79 = shl i8 %xor1.i.i110, 3, !dbg !1598
  %mul16.i.i114 = and i8 %79, 32, !dbg !1598
  %80 = or disjoint i8 %mul9.i.i111, %mul16.i.i114, !dbg !1599
    #dbg_value(!DIArgList(i8 poison, i8 poison), !1547, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value), !1592)
  %81 = shl i8 %xor1.i.i110, 3, !dbg !1600
  %mul23.i.i116 = and i8 %81, 64, !dbg !1600
  %82 = or disjoint i8 %80, %mul23.i.i116, !dbg !1601
    #dbg_value(!DIArgList(i8 poison, i8 poison, i8 poison), !1547, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_or, DW_OP_or, DW_OP_stack_value), !1592)
    #dbg_value(!DIArgList(i8 poison, i8 poison, i8 poison), !1549, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_or, DW_OP_or, DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !1592)
  %83 = lshr exact i8 %82, 4, !dbg !1602
  %84 = lshr exact i8 %82, 3, !dbg !1603
  %85 = xor i8 %83, %84, !dbg !1604
  %86 = xor i8 %85, %conv10.i.i112, !dbg !1605
    #dbg_value(i8 %86, !1550, !DIExpression(), !1592)
  %mul134.i = shl nuw nsw i32 %i115.0.i, 2, !dbg !1606
  %add135.i = or disjoint i32 %mul134.i, 3, !dbg !1607
  %arrayidx136.i = getelementptr inbounds nuw [16 x i8], ptr %tab.i, i32 0, i32 %add135.i, !dbg !1608
  store i8 %86, ptr %arrayidx136.i, align 1, !dbg !1609
  %inc138.i = add nuw nsw i32 %i115.0.i, 1, !dbg !1610
    #dbg_value(i32 %inc138.i, !1526, !DIExpression(), !1528)
  br label %for.cond116.i, !dbg !1611, !llvm.loop !1612

for.cond141.i:                                    ; preds = %for.cond141.i.preheader, %for.inc203.i
  %c140.0.i = phi i32 [ %add204.i, %for.inc203.i ], [ 0, %for.cond141.i.preheader ], !dbg !1614
    #dbg_value(i32 %c140.0.i, !1615, !DIExpression(), !1616)
  %cmp142.i = icmp samesign ult i32 %c140.0.i, 112, !dbg !1617
  br i1 %cmp142.i, label %for.cond144.i.preheader, label %for.cond207.i.preheader, !dbg !1534

for.cond207.i.preheader:                          ; preds = %for.cond141.i
  br label %for.cond207.i, !dbg !1619

for.cond144.i.preheader:                          ; preds = %for.cond141.i
  br label %for.cond144.i, !dbg !1621

for.cond144.i:                                    ; preds = %for.cond144.i.preheader, %for.inc200.i
  %r.0.i109 = phi i32 [ %inc201.i, %for.inc200.i ], [ 108, %for.cond144.i.preheader ], !dbg !1624
    #dbg_value(i32 %r.0.i109, !1625, !DIExpression(), !1626)
  %exitcond147 = icmp ne i32 %r.0.i109, 174, !dbg !1627
  br i1 %exitcond147, label %for.body146.i, label %for.inc203.i, !dbg !1621

for.body146.i:                                    ; preds = %for.cond144.i
  %div1.i = lshr i32 %r.0.i109, 4, !dbg !1629
  %mul147.i = mul nuw nsw i32 %div1.i, 112, !dbg !1631
  %add148.i = add nuw nsw i32 %mul147.i, %c140.0.i, !dbg !1632
  %rem.i = and i32 %r.0.i109, 15, !dbg !1633
  %add149.i = or disjoint i32 %add148.i, %rem.i, !dbg !1634
    #dbg_value(i32 %add149.i, !1635, !DIExpression(), !1636)
  %arrayidx150.i = getelementptr inbounds nuw [1568 x i64], ptr %A.i, i32 0, i32 %add149.i, !dbg !1637
  %87 = load i64, ptr %arrayidx150.i, align 8, !dbg !1637
  %and151.i = and i64 %87, 1229782938247303441, !dbg !1638
    #dbg_value(i64 %and151.i, !1639, !DIExpression(), !1636)
  %shr153.i = lshr i64 %87, 1, !dbg !1640
  %and154.i = and i64 %shr153.i, 1229782938247303441, !dbg !1641
    #dbg_value(i64 %and154.i, !1642, !DIExpression(), !1636)
  %shr156.i = lshr i64 %87, 2, !dbg !1643
  %and157.i = and i64 %shr156.i, 1229782938247303441, !dbg !1644
    #dbg_value(i64 %and157.i, !1645, !DIExpression(), !1636)
  %arrayidx158.i = getelementptr inbounds nuw [1568 x i64], ptr %A.i, i32 0, i32 %add149.i, !dbg !1646
  %88 = load i64, ptr %arrayidx158.i, align 8, !dbg !1646
  %shr159.i = lshr i64 %88, 3, !dbg !1647
  %and160.i = and i64 %shr159.i, 1229782938247303441, !dbg !1648
    #dbg_value(i64 %and160.i, !1649, !DIExpression(), !1636)
    #dbg_value(i32 0, !1650, !DIExpression(), !1652)
  br label %for.cond161.i, !dbg !1653

for.cond161.i:                                    ; preds = %for.body163.i, %for.body146.i
  %t.0.i = phi i32 [ 0, %for.body146.i ], [ %inc198.i, %for.body163.i ], !dbg !1654
    #dbg_value(i32 %t.0.i, !1650, !DIExpression(), !1652)
  %exitcond146 = icmp ne i32 %t.0.i, 4, !dbg !1655
  br i1 %exitcond146, label %for.body163.i, label %for.inc200.i, !dbg !1657

for.body163.i:                                    ; preds = %for.cond161.i
  %mul164.i = shl nuw nsw i32 %t.0.i, 2, !dbg !1658
  %arrayidx166.i = getelementptr inbounds nuw [16 x i8], ptr %tab.i, i32 0, i32 %mul164.i, !dbg !1660
  %89 = load i8, ptr %arrayidx166.i, align 1, !dbg !1660
  %conv.i = zext i8 %89 to i64, !dbg !1660
  %mul167.i = mul i64 %and151.i, %conv.i, !dbg !1661
  %mul168.i = shl nuw nsw i32 %t.0.i, 2, !dbg !1662
  %add169.i = or disjoint i32 %mul168.i, 1, !dbg !1663
  %arrayidx170.i = getelementptr inbounds nuw [16 x i8], ptr %tab.i, i32 0, i32 %add169.i, !dbg !1664
  %90 = load i8, ptr %arrayidx170.i, align 1, !dbg !1664
  %conv171.i = zext i8 %90 to i64, !dbg !1664
  %mul172.i = mul i64 %and154.i, %conv171.i, !dbg !1665
  %xor173.i = xor i64 %mul167.i, %mul172.i, !dbg !1666
  %mul174.i = shl nuw nsw i32 %t.0.i, 2, !dbg !1667
  %add175.i = or disjoint i32 %mul174.i, 2, !dbg !1668
  %arrayidx176.i = getelementptr inbounds nuw [16 x i8], ptr %tab.i, i32 0, i32 %add175.i, !dbg !1669
  %91 = load i8, ptr %arrayidx176.i, align 1, !dbg !1669
  %conv177.i = zext i8 %91 to i64, !dbg !1669
  %mul178.i = mul i64 %and157.i, %conv177.i, !dbg !1670
  %xor179.i = xor i64 %xor173.i, %mul178.i, !dbg !1671
  %mul180.i = shl nuw nsw i32 %t.0.i, 2, !dbg !1672
  %add181.i = or disjoint i32 %mul180.i, 3, !dbg !1673
  %arrayidx182.i = getelementptr inbounds nuw [16 x i8], ptr %tab.i, i32 0, i32 %add181.i, !dbg !1674
  %92 = load i8, ptr %arrayidx182.i, align 1, !dbg !1674
  %conv183.i = zext i8 %92 to i64, !dbg !1674
  %mul184.i = mul i64 %and160.i, %conv183.i, !dbg !1675
  %xor185.i = xor i64 %xor179.i, %mul184.i, !dbg !1676
  %add186.i = add nuw nsw i32 %r.0.i109, %t.0.i, !dbg !1677
  %sub187.i = add nsw i32 %add186.i, -108, !dbg !1678
  %div1882.i = lshr i32 %sub187.i, 4, !dbg !1679
  %mul189.i = mul i32 %div1882.i, 112, !dbg !1680
  %add190.i = add i32 %mul189.i, %c140.0.i, !dbg !1681
  %add191.i = add nuw nsw i32 %r.0.i109, %t.0.i, !dbg !1682
  %sub192.i = add nuw nsw i32 %add191.i, 4, !dbg !1683
  %rem193.i = and i32 %sub192.i, 15, !dbg !1684
  %add194.i = or disjoint i32 %add190.i, %rem193.i, !dbg !1685
  %arrayidx195.i = getelementptr inbounds nuw [1568 x i64], ptr %A.i, i32 0, i32 %add194.i, !dbg !1686
  %93 = load i64, ptr %arrayidx195.i, align 8, !dbg !1687
  %xor196.i = xor i64 %93, %xor185.i, !dbg !1687
  store i64 %xor196.i, ptr %arrayidx195.i, align 8, !dbg !1687
  %inc198.i = add nuw nsw i32 %t.0.i, 1, !dbg !1688
    #dbg_value(i32 %inc198.i, !1650, !DIExpression(), !1652)
  br label %for.cond161.i, !dbg !1689, !llvm.loop !1690

for.inc200.i:                                     ; preds = %for.cond161.i
  %inc201.i = add nuw nsw i32 %r.0.i109, 1, !dbg !1692
    #dbg_value(i32 %inc201.i, !1625, !DIExpression(), !1626)
  br label %for.cond144.i, !dbg !1693, !llvm.loop !1694

for.inc203.i:                                     ; preds = %for.cond144.i
  %add204.i = add nuw nsw i32 %c140.0.i, 16, !dbg !1696
    #dbg_value(i32 %add204.i, !1615, !DIExpression(), !1616)
  br label %for.cond141.i, !dbg !1697, !llvm.loop !1698

for.cond207.i:                                    ; preds = %for.cond207.i.preheader, %for.inc241.i
  %indvars.iv148 = phi i32 [ 108, %for.cond207.i.preheader ], [ %indvars.iv.next149, %for.inc241.i ], !dbg !1700
  %r206.0.i = phi i32 [ %add242.i, %for.inc241.i ], [ 0, %for.cond207.i.preheader ], !dbg !1700
    #dbg_value(i32 %r206.0.i, !1701, !DIExpression(), !1702)
  %cmp208.i = icmp samesign ult i32 %r206.0.i, 108, !dbg !1703
  br i1 %cmp208.i, label %for.cond212.i.preheader, label %compute_A.exit, !dbg !1619

for.cond212.i.preheader:                          ; preds = %for.cond207.i
  br label %for.cond212.i, !dbg !1705

for.cond212.i:                                    ; preds = %for.cond212.i.preheader, %for.inc238.i
  %c211.0.i = phi i32 [ %add239.i, %for.inc238.i ], [ 0, %for.cond212.i.preheader ], !dbg !1708
    #dbg_value(i32 %c211.0.i, !1709, !DIExpression(), !1710)
  %cmp213.i = icmp samesign ult i32 %c211.0.i, 110, !dbg !1711
  br i1 %cmp213.i, label %for.cond217.i.preheader, label %for.inc241.i, !dbg !1705

for.cond217.i.preheader:                          ; preds = %for.cond212.i
  br label %for.cond217.i, !dbg !1713

for.cond217.i:                                    ; preds = %for.cond217.i.preheader, %decode.exit.i
  %i216.0.i = phi i32 [ %inc236.i, %decode.exit.i ], [ 0, %for.cond217.i.preheader ], !dbg !1716
    #dbg_value(i32 %i216.0.i, !1717, !DIExpression(), !1718)
  %exitcond150 = icmp ne i32 %i216.0.i, %indvars.iv148, !dbg !1719
  br i1 %exitcond150, label %for.body221.i, label %for.inc238.i, !dbg !1713

for.body221.i:                                    ; preds = %for.cond217.i
  %div223.i = mul nuw nsw i32 %r206.0.i, 7, !dbg !1721
  %add224.i = add nuw nsw i32 %div223.i, %c211.0.i, !dbg !1723
  %add225.i = add nuw nsw i32 %add224.i, %i216.0.i, !dbg !1724
  %arrayidx226.i = getelementptr inbounds nuw [1568 x i64], ptr %A.i, i32 0, i32 %add225.i, !dbg !1725
  %add227.i = add nuw nsw i32 %r206.0.i, %i216.0.i, !dbg !1726
  %mul228.i = mul nuw nsw i32 %add227.i, 111, !dbg !1727
  %add.ptr229.i = getelementptr inbounds nuw i8, ptr %A, i32 %mul228.i, !dbg !1728
  %add.ptr230.i = getelementptr inbounds nuw i8, ptr %add.ptr229.i, i32 %c211.0.i, !dbg !1729
  %cmp232.i = icmp samesign ult i32 %c211.0.i, 94, !dbg !1730
  %sub234.i = sub nsw i32 110, %c211.0.i, !dbg !1730
    #dbg_value(ptr %arrayidx226.i, !432, !DIExpression(), !1731)
    #dbg_value(ptr %add.ptr230.i, !438, !DIExpression(), !1731)
    #dbg_value(i32 poison, !439, !DIExpression(), !1731)
    #dbg_value(i32 0, !440, !DIExpression(), !1731)
  br label %for.cond.i.i103, !dbg !1733

for.cond.i.i103:                                  ; preds = %for.body.i.i106, %for.body221.i
  %mdec.addr.0.i.i = phi ptr [ %add.ptr230.i, %for.body221.i ], [ %incdec.ptr5.i.i, %for.body.i.i106 ]
  %i.0.i.i104 = phi i32 [ 0, %for.body221.i ], [ %inc.i.i108, %for.body.i.i106 ], !dbg !1734
    #dbg_value(i32 %i.0.i.i104, !440, !DIExpression(), !1731)
    #dbg_value(ptr %mdec.addr.0.i.i, !438, !DIExpression(), !1731)
  %94 = ashr exact i32 %sub234.i, 1, !dbg !1735
  %div.i.i = select i1 %cmp232.i, i32 8, i32 %94, !dbg !1730
  %cmp.i.i105 = icmp slt i32 %i.0.i.i104, %div.i.i, !dbg !1736
  br i1 %cmp.i.i105, label %for.body.i.i106, label %decode.exit.i, !dbg !1737

for.body.i.i106:                                  ; preds = %for.cond.i.i103
  %arrayidx.i.i107 = getelementptr inbounds nuw i8, ptr %arrayidx226.i, i32 %i.0.i.i104, !dbg !1738
  %95 = load i8, ptr %arrayidx.i.i107, align 1, !dbg !1738
  %96 = and i8 %95, 15, !dbg !1739
  %incdec.ptr.i.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i.i, i32 1, !dbg !1740
    #dbg_value(ptr %incdec.ptr.i.i, !438, !DIExpression(), !1731)
  store i8 %96, ptr %mdec.addr.0.i.i, align 1, !dbg !1741
  %97 = lshr i8 %95, 4, !dbg !1742
    #dbg_value(ptr %incdec.ptr.i.i, !438, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1731)
  store i8 %97, ptr %incdec.ptr.i.i, align 1, !dbg !1743
  %incdec.ptr5.i.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i.i, i32 2, !dbg !1744
    #dbg_value(ptr %incdec.ptr5.i.i, !438, !DIExpression(), !1731)
  %inc.i.i108 = add nuw nsw i32 %i.0.i.i104, 1, !dbg !1745
    #dbg_value(i32 %inc.i.i108, !440, !DIExpression(), !1731)
  br label %for.cond.i.i103, !dbg !1746, !llvm.loop !1747

decode.exit.i:                                    ; preds = %for.cond.i.i103
  %inc236.i = add nuw nsw i32 %i216.0.i, 1, !dbg !1749
    #dbg_value(i32 %inc236.i, !1717, !DIExpression(), !1718)
  br label %for.cond217.i, !dbg !1750, !llvm.loop !1751

for.inc238.i:                                     ; preds = %for.cond217.i
  %add239.i = add nuw nsw i32 %c211.0.i, 16, !dbg !1753
    #dbg_value(i32 %add239.i, !1709, !DIExpression(), !1710)
  br label %for.cond212.i, !dbg !1754, !llvm.loop !1755

for.inc241.i:                                     ; preds = %for.cond212.i
  %add242.i = add nuw nsw i32 %r206.0.i, 16, !dbg !1757
    #dbg_value(i32 %add242.i, !1701, !DIExpression(), !1702)
  %indvars.iv.next149 = add nsw i32 %indvars.iv148, -16, !dbg !1758
  br label %for.cond207.i, !dbg !1758, !llvm.loop !1759

compute_A.exit:                                   ; preds = %for.cond207.i
  call void @llvm.lifetime.end.p0(i64 12544, ptr nonnull %A.i), !dbg !1761
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %tab.i), !dbg !1761
    #dbg_value(i32 0, !1762, !DIExpression(), !1764)
  br label %for.cond52, !dbg !1765

for.cond52:                                       ; preds = %for.body55, %compute_A.exit
  %i51.0 = phi i32 [ 0, %compute_A.exit ], [ %inc58, %for.body55 ], !dbg !1766
    #dbg_value(i32 %i51.0, !1762, !DIExpression(), !1764)
  %exitcond151 = icmp ne i32 %i51.0, 108, !dbg !1767
  br i1 %exitcond151, label %for.body55, label %for.end59, !dbg !1769

for.body55:                                       ; preds = %for.cond52
  %98 = mul nuw nsw i32 %i51.0, 111, !dbg !1770
  %sub = add nuw nsw i32 %98, 110, !dbg !1772
  %arrayidx = getelementptr inbounds nuw [12432 x i8], ptr %A, i32 0, i32 %sub, !dbg !1773
  store i8 0, ptr %arrayidx, align 1, !dbg !1774
  %inc58 = add nuw nsw i32 %i51.0, 1, !dbg !1775
    #dbg_value(i32 %inc58, !1762, !DIExpression(), !1764)
  br label %for.cond52, !dbg !1776, !llvm.loop !1777

for.end59:                                        ; preds = %for.cond52
  %add.ptr61 = getelementptr inbounds nuw i8, ptr %V, i32 594, !dbg !1779
    #dbg_value(ptr %add.ptr61, !432, !DIExpression(), !1780)
    #dbg_value(ptr %r, !438, !DIExpression(), !1780)
    #dbg_value(i32 110, !439, !DIExpression(), !1780)
    #dbg_value(i32 0, !440, !DIExpression(), !1780)
  br label %for.cond.i6, !dbg !1782

for.cond.i6:                                      ; preds = %for.body.i9, %for.end59
  %mdec.addr.0.i = phi ptr [ %r, %for.end59 ], [ %incdec.ptr5.i, %for.body.i9 ]
  %i.0.i7 = phi i32 [ 0, %for.end59 ], [ %inc.i11, %for.body.i9 ], !dbg !1783
    #dbg_value(i32 %i.0.i7, !440, !DIExpression(), !1780)
    #dbg_value(ptr %mdec.addr.0.i, !438, !DIExpression(), !1780)
  %exitcond152 = icmp ne i32 %i.0.i7, 55, !dbg !1784
  br i1 %exitcond152, label %for.body.i9, label %decode.exit, !dbg !1785

for.body.i9:                                      ; preds = %for.cond.i6
  %arrayidx.i10 = getelementptr inbounds nuw i8, ptr %add.ptr61, i32 %i.0.i7, !dbg !1786
  %99 = load i8, ptr %arrayidx.i10, align 1, !dbg !1786
  %100 = and i8 %99, 15, !dbg !1787
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i, i32 1, !dbg !1788
    #dbg_value(ptr %incdec.ptr.i, !438, !DIExpression(), !1780)
  store i8 %100, ptr %mdec.addr.0.i, align 1, !dbg !1789
  %101 = lshr i8 %99, 4, !dbg !1790
    #dbg_value(ptr %incdec.ptr.i, !438, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1780)
  store i8 %101, ptr %incdec.ptr.i, align 1, !dbg !1791
  %incdec.ptr5.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i, i32 2, !dbg !1792
    #dbg_value(ptr %incdec.ptr5.i, !438, !DIExpression(), !1780)
  %inc.i11 = add nuw nsw i32 %i.0.i7, 1, !dbg !1793
    #dbg_value(i32 %inc.i11, !440, !DIExpression(), !1780)
  br label %for.cond.i6, !dbg !1794, !llvm.loop !1795

decode.exit:                                      ; preds = %for.cond.i6
  %call67 = call i32 @pqmayo_MAYO_3_ref_sample_solution(ptr noundef %p, ptr noundef nonnull %A, ptr noundef nonnull %y, ptr noundef nonnull %r, ptr noundef nonnull %x, i32 noundef 11, i32 noundef 10, i32 noundef 108, i32 noundef 111) #9, !dbg !1797
  %tobool.not = icmp eq i32 %call67, 0, !dbg !1797
  br i1 %tobool.not, label %if.else, label %for.end76, !dbg !1797

if.else:                                          ; preds = %decode.exit
  %call70 = call ptr @memset(ptr noundef nonnull %Mtmp, i32 noundef 0, i32 noundef 6160) #8, !dbg !1799
  %call72 = call ptr @memset(ptr noundef nonnull %A, i32 noundef 0, i32 noundef 12432) #8, !dbg !1801
  %inc75 = add nuw nsw i32 %ctr.0, 1, !dbg !1802
    #dbg_value(i32 %inc75, !984, !DIExpression(), !985)
  br label %for.cond, !dbg !1803, !llvm.loop !1804

for.end76:                                        ; preds = %decode.exit, %for.cond
    #dbg_value(i32 0, !1806, !DIExpression(), !1808)
  br label %for.cond78, !dbg !1809

for.cond78:                                       ; preds = %mat_add.exit, %for.end76
  %i77.0 = phi i32 [ 0, %for.end76 ], [ %inc103, %mat_add.exit ], !dbg !1810
    #dbg_value(i32 %i77.0, !1806, !DIExpression(), !1808)
  %exitcond157 = icmp ne i32 %i77.0, 11, !dbg !1811
  br i1 %exitcond157, label %for.body81, label %for.cond.i.preheader, !dbg !1813

for.cond.i.preheader:                             ; preds = %for.cond78
  br label %for.cond.i, !dbg !1814

for.body81:                                       ; preds = %for.cond78
  %mul83 = mul nuw nsw i32 %i77.0, 108, !dbg !1818
    #dbg_value(ptr %add.ptr84, !1820, !DIExpression(), !869)
  %O = getelementptr inbounds nuw i8, ptr %sk, i32 390096, !dbg !1821
  %mul87 = mul nuw nsw i32 %i77.0, 10, !dbg !1822
  %add.ptr88 = getelementptr inbounds nuw i8, ptr %x, i32 %mul87, !dbg !1823
    #dbg_value(ptr %O, !1824, !DIExpression(), !1828)
    #dbg_value(ptr %add.ptr88, !1830, !DIExpression(), !1828)
    #dbg_value(ptr %Ox, !1831, !DIExpression(), !1828)
    #dbg_value(i32 10, !1832, !DIExpression(), !1828)
    #dbg_value(i32 108, !1833, !DIExpression(), !1828)
    #dbg_value(i32 1, !1834, !DIExpression(), !1828)
    #dbg_value(i32 0, !1835, !DIExpression(), !1837)
  br label %for.cond.i88, !dbg !1838

for.cond.i88:                                     ; preds = %for.inc4.i, %for.body81
  %i.0.i89 = phi i32 [ 0, %for.body81 ], [ %inc5.i, %for.inc4.i ], !dbg !1839
  %c.addr.0.i = phi ptr [ %Ox, %for.body81 ], [ %c.addr.1.i.lcssa, %for.inc4.i ]
  %a.addr.0.i = phi ptr [ %O, %for.body81 ], [ %add.ptr6.i94, %for.inc4.i ]
    #dbg_value(ptr %a.addr.0.i, !1824, !DIExpression(), !1828)
    #dbg_value(ptr %c.addr.0.i, !1831, !DIExpression(), !1828)
    #dbg_value(i32 %i.0.i89, !1835, !DIExpression(), !1837)
  %exitcond155 = icmp ne i32 %i.0.i89, 108, !dbg !1840
  br i1 %exitcond155, label %for.cond1.i91.preheader, label %mat_mul.exit, !dbg !1842

for.cond1.i91.preheader:                          ; preds = %for.cond.i88
  br label %for.cond1.i91, !dbg !1843

for.cond1.i91:                                    ; preds = %for.cond1.i91.preheader, %lincomb.exit.i
  %c.addr.1.i = phi ptr [ %incdec.ptr.i98, %lincomb.exit.i ], [ %c.addr.0.i, %for.cond1.i91.preheader ]
  %j.0.i92 = phi i32 [ 1, %lincomb.exit.i ], [ 0, %for.cond1.i91.preheader ], !dbg !1846
    #dbg_value(i32 poison, !1847, !DIExpression(), !1848)
    #dbg_value(ptr %c.addr.1.i, !1831, !DIExpression(), !1828)
  %cmp2.i93 = icmp eq i32 %j.0.i92, 0, !dbg !1849
  br i1 %cmp2.i93, label %for.body3.i95, label %for.inc4.i, !dbg !1843

for.body3.i95:                                    ; preds = %for.cond1.i91
  %add.ptr.i96 = getelementptr inbounds nuw i8, ptr %add.ptr88, i32 %j.0.i92, !dbg !1851
    #dbg_value(ptr %a.addr.0.i, !1853, !DIExpression(), !1857)
    #dbg_value(ptr %add.ptr.i96, !1859, !DIExpression(), !1857)
    #dbg_value(i32 10, !1860, !DIExpression(), !1857)
    #dbg_value(i32 1, !1861, !DIExpression(), !1857)
    #dbg_value(i8 0, !1862, !DIExpression(), !1857)
    #dbg_value(i32 0, !1863, !DIExpression(), !1865)
  br label %for.cond.i.i, !dbg !1866

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body3.i95
  %ret.0.i.i = phi i8 [ 0, %for.body3.i95 ], [ %xor1.i.i.i, %for.body.i.i ], !dbg !1857
  %b.addr.0.i.i = phi ptr [ %add.ptr.i96, %for.body3.i95 ], [ %add.ptr.i.i, %for.body.i.i ]
  %i.0.i.i = phi i32 [ 0, %for.body3.i95 ], [ %inc.i.i, %for.body.i.i ], !dbg !1867
    #dbg_value(i32 %i.0.i.i, !1863, !DIExpression(), !1865)
    #dbg_value(ptr %b.addr.0.i.i, !1859, !DIExpression(), !1857)
    #dbg_value(i8 %ret.0.i.i, !1862, !DIExpression(), !1857)
  %exitcond154 = icmp ne i32 %i.0.i.i, 10, !dbg !1868
  br i1 %exitcond154, label %for.body.i.i, label %lincomb.exit.i, !dbg !1870

for.body.i.i:                                     ; preds = %for.cond.i.i
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %a.addr.0.i, i32 %i.0.i.i, !dbg !1871
  %102 = load i8, ptr %arrayidx.i.i, align 1, !dbg !1871
  %103 = load i8, ptr %b.addr.0.i.i, align 1, !dbg !1873
    #dbg_value(i8 %102, !1538, !DIExpression(), !1874)
    #dbg_value(i8 %103, !1544, !DIExpression(), !1874)
  %104 = load volatile i8, ptr @pqmayo_MAYO_3_ref_unsigned_char_blocker, align 1, !dbg !1876
  %xor1.i.i99 = xor i8 %102, %104, !dbg !1877
    #dbg_value(i8 %xor1.i.i99, !1538, !DIExpression(), !1874)
  %105 = trunc i8 %xor1.i.i99 to i1, !dbg !1878
    #dbg_value(i8 poison, !1547, !DIExpression(), !1874)
  %106 = and i8 %xor1.i.i99, 2, !dbg !1879
  %mul9.i.i = mul i8 %106, %103, !dbg !1880
  %conv10.i.i = select i1 %105, i8 %103, i8 0, !dbg !1878
  %xor11.i.i = xor i8 %conv10.i.i, %mul9.i.i, !dbg !1881
    #dbg_value(i8 %xor11.i.i, !1547, !DIExpression(), !1874)
  %107 = and i8 %xor1.i.i99, 4, !dbg !1882
  %mul16.i.i = mul i8 %107, %103, !dbg !1883
  %xor18.i.i = xor i8 %mul16.i.i, %xor11.i.i, !dbg !1884
    #dbg_value(i8 %xor18.i.i, !1547, !DIExpression(), !1874)
  %108 = and i8 %xor1.i.i99, 8, !dbg !1885
  %mul23.i.i = mul i8 %108, %103, !dbg !1886
  %xor25.i.i = xor i8 %mul23.i.i, %xor18.i.i, !dbg !1887
    #dbg_value(i8 %xor25.i.i, !1547, !DIExpression(), !1874)
    #dbg_value(i8 %xor25.i.i, !1549, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !1874)
  %109 = lshr i8 %xor25.i.i, 4, !dbg !1888
  %110 = lshr i8 %xor25.i.i, 3, !dbg !1889
  %111 = and i8 %110, 14, !dbg !1889
  %112 = xor i8 %109, %111, !dbg !1890
  %xor25.masked.i.i = and i8 %xor25.i.i, 15, !dbg !1891
  %113 = xor i8 %112, %xor25.masked.i.i, !dbg !1891
    #dbg_value(i8 %113, !1550, !DIExpression(), !1874)
    #dbg_value(i8 %113, !1892, !DIExpression(), !1894)
    #dbg_value(i8 %ret.0.i.i, !1896, !DIExpression(), !1894)
  %xor1.i.i.i = xor i8 %113, %ret.0.i.i, !dbg !1897
    #dbg_value(i8 %xor1.i.i.i, !1862, !DIExpression(), !1857)
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !1898
    #dbg_value(i32 %inc.i.i, !1863, !DIExpression(), !1865)
  %add.ptr.i.i = getelementptr inbounds nuw i8, ptr %b.addr.0.i.i, i32 1, !dbg !1899
    #dbg_value(ptr %add.ptr.i.i, !1859, !DIExpression(), !1857)
  br label %for.cond.i.i, !dbg !1900, !llvm.loop !1901

lincomb.exit.i:                                   ; preds = %for.cond.i.i
  %ret.0.i.i.lcssa = phi i8 [ %ret.0.i.i, %for.cond.i.i ], !dbg !1857
  store i8 %ret.0.i.i.lcssa, ptr %c.addr.1.i, align 1, !dbg !1903
    #dbg_value(i32 1, !1847, !DIExpression(), !1848)
  %incdec.ptr.i98 = getelementptr inbounds nuw i8, ptr %c.addr.1.i, i32 1, !dbg !1904
    #dbg_value(ptr %incdec.ptr.i98, !1831, !DIExpression(), !1828)
  br label %for.cond1.i91, !dbg !1905, !llvm.loop !1906

for.inc4.i:                                       ; preds = %for.cond1.i91
  %c.addr.1.i.lcssa = phi ptr [ %c.addr.1.i, %for.cond1.i91 ]
  %inc5.i = add nuw nsw i32 %i.0.i89, 1, !dbg !1908
    #dbg_value(i32 %inc5.i, !1835, !DIExpression(), !1837)
  %add.ptr6.i94 = getelementptr inbounds nuw i8, ptr %a.addr.0.i, i32 10, !dbg !1909
    #dbg_value(ptr %add.ptr6.i94, !1824, !DIExpression(), !1828)
  br label %for.cond.i88, !dbg !1910, !llvm.loop !1911

mat_mul.exit:                                     ; preds = %for.cond.i88
  %add.ptr84 = getelementptr inbounds nuw i8, ptr %Vdec, i32 %mul83, !dbg !1913
  %mul92 = mul nuw nsw i32 %i77.0, 118, !dbg !1914
  %add.ptr93 = getelementptr inbounds nuw i8, ptr %s, i32 %mul92, !dbg !1915
    #dbg_value(ptr %add.ptr84, !1916, !DIExpression(), !1920)
    #dbg_value(ptr %Ox, !1922, !DIExpression(), !1920)
    #dbg_value(ptr %add.ptr93, !1923, !DIExpression(), !1920)
    #dbg_value(i32 108, !1924, !DIExpression(), !1920)
    #dbg_value(i32 1, !1925, !DIExpression(), !1920)
    #dbg_value(i32 0, !1926, !DIExpression(), !1928)
  br label %for.cond.i1, !dbg !1929

for.cond.i1:                                      ; preds = %for.inc11.i, %mat_mul.exit
  %i.0.i2 = phi i32 [ 0, %mat_mul.exit ], [ %inc12.i, %for.inc11.i ], !dbg !1930
    #dbg_value(i32 %i.0.i2, !1926, !DIExpression(), !1928)
  %exitcond156 = icmp ne i32 %i.0.i2, 108, !dbg !1931
  br i1 %exitcond156, label %for.cond1.i.preheader, label %mat_add.exit, !dbg !1933

for.cond1.i.preheader:                            ; preds = %for.cond.i1
  br label %for.cond1.i, !dbg !1934

for.cond1.i:                                      ; preds = %for.cond1.i.preheader, %for.body3.i
  %j.0.i = phi i32 [ 1, %for.body3.i ], [ 0, %for.cond1.i.preheader ], !dbg !1937
    #dbg_value(i32 poison, !1938, !DIExpression(), !1939)
  %cmp2.i = icmp eq i32 %j.0.i, 0, !dbg !1940
  br i1 %cmp2.i, label %for.body3.i, label %for.inc11.i, !dbg !1934

for.body3.i:                                      ; preds = %for.cond1.i
  %add.ptr.i4 = getelementptr inbounds nuw i8, ptr %add.ptr84, i32 %i.0.i2, !dbg !1942
  %add.ptr4.i = getelementptr inbounds nuw i8, ptr %add.ptr.i4, i32 %j.0.i, !dbg !1944
  %114 = load i8, ptr %add.ptr4.i, align 1, !dbg !1945
  %add.ptr6.i = getelementptr inbounds nuw i8, ptr %Ox, i32 %i.0.i2, !dbg !1946
  %add.ptr7.i = getelementptr inbounds nuw i8, ptr %add.ptr6.i, i32 %j.0.i, !dbg !1947
  %115 = load i8, ptr %add.ptr7.i, align 1, !dbg !1948
    #dbg_value(i8 %114, !1892, !DIExpression(), !1949)
    #dbg_value(i8 %115, !1896, !DIExpression(), !1949)
  %xor1.i.i = xor i8 %114, %115, !dbg !1951
  %add.ptr9.i = getelementptr inbounds nuw i8, ptr %add.ptr93, i32 %i.0.i2, !dbg !1952
  %add.ptr10.i = getelementptr inbounds nuw i8, ptr %add.ptr9.i, i32 %j.0.i, !dbg !1953
  store i8 %xor1.i.i, ptr %add.ptr10.i, align 1, !dbg !1954
    #dbg_value(i32 1, !1938, !DIExpression(), !1939)
  br label %for.cond1.i, !dbg !1955, !llvm.loop !1956

for.inc11.i:                                      ; preds = %for.cond1.i
  %inc12.i = add nuw nsw i32 %i.0.i2, 1, !dbg !1958
    #dbg_value(i32 %inc12.i, !1926, !DIExpression(), !1928)
  br label %for.cond.i1, !dbg !1959, !llvm.loop !1960

mat_add.exit:                                     ; preds = %for.cond.i1
  %mul95 = mul nuw nsw i32 %i77.0, 118, !dbg !1962
  %add.ptr96 = getelementptr inbounds nuw i8, ptr %s, i32 %mul95, !dbg !1963
  %add.ptr97 = getelementptr inbounds nuw i8, ptr %add.ptr96, i32 108, !dbg !1964
  %mul99 = mul nuw nsw i32 %i77.0, 10, !dbg !1965
  %add.ptr100 = getelementptr inbounds nuw i8, ptr %x, i32 %mul99, !dbg !1966
  %call101 = call ptr @memcpy(ptr noundef nonnull %add.ptr97, ptr noundef nonnull %add.ptr100, i32 noundef 10) #8, !dbg !1967
  %inc103 = add nuw nsw i32 %i77.0, 1, !dbg !1968
    #dbg_value(i32 %inc103, !1806, !DIExpression(), !1808)
  br label %for.cond78, !dbg !1969, !llvm.loop !1970

for.cond.i:                                       ; preds = %for.cond.i.preheader, %for.body.i
  %i.0.i = phi i32 [ %inc.i, %for.body.i ], [ 0, %for.cond.i.preheader ], !dbg !1972
  %m.addr.0.i = phi ptr [ %add.ptr3.i, %for.body.i ], [ %s, %for.cond.i.preheader ]
    #dbg_value(ptr %m.addr.0.i, !1973, !DIExpression(), !1974)
    #dbg_value(i32 %i.0.i, !1975, !DIExpression(), !1974)
  %exitcond158 = icmp ne i32 %i.0.i, 649, !dbg !1976
  br i1 %exitcond158, label %for.body.i, label %encode.exit, !dbg !1814

for.body.i:                                       ; preds = %for.cond.i
  %116 = load i8, ptr %m.addr.0.i, align 1, !dbg !1978
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %m.addr.0.i, i32 1, !dbg !1980
  %117 = load i8, ptr %add.ptr.i, align 1, !dbg !1981
  %shl.i = shl i8 %117, 4, !dbg !1982
  %or.i = or i8 %shl.i, %116, !dbg !1983
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %sig, i32 %i.0.i, !dbg !1984
  store i8 %or.i, ptr %arrayidx.i, align 1, !dbg !1985
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !1986
    #dbg_value(i32 %inc.i, !1975, !DIExpression(), !1974)
  %add.ptr3.i = getelementptr inbounds nuw i8, ptr %m.addr.0.i, i32 2, !dbg !1987
    #dbg_value(ptr %add.ptr3.i, !1973, !DIExpression(), !1974)
  br label %for.cond.i, !dbg !1988, !llvm.loop !1989

encode.exit:                                      ; preds = %for.cond.i
  %add.ptr107 = getelementptr inbounds nuw i8, ptr %sig, i32 649, !dbg !1991
  %call109 = call ptr @memcpy(ptr noundef nonnull %add.ptr107, ptr noundef nonnull %salt, i32 noundef 32) #8, !dbg !1992
  store i32 681, ptr %siglen, align 4, !dbg !1993
  br label %err, !dbg !1994

err:                                              ; preds = %if.end, %entry, %encode.exit
  %ret.0 = phi i32 [ %call, %encode.exit ], [ %call, %entry ], [ 1, %if.end ], !dbg !869
    #dbg_value(i32 %ret.0, !875, !DIExpression(), !869)
    #dbg_label(!1995, !1996)
  call void @mayo_secure_clear(ptr noundef nonnull %V, i32 noundef 649) #8, !dbg !1997
  call void @mayo_secure_clear(ptr noundef nonnull %Vdec, i32 noundef 1188) #8, !dbg !1998
  call void @mayo_secure_clear(ptr noundef nonnull %A, i32 noundef 12432) #8, !dbg !1999
  call void @mayo_secure_clear(ptr noundef nonnull %r, i32 noundef 111) #8, !dbg !2000
  %O114 = getelementptr inbounds nuw i8, ptr %sk, i32 390096, !dbg !2001
  call void @mayo_secure_clear(ptr noundef nonnull %O114, i32 noundef 1080) #8, !dbg !2002
  call void @mayo_secure_clear(ptr noundef nonnull %sk, i32 noundef 391176) #8, !dbg !2003
  call void @mayo_secure_clear(ptr noundef nonnull %Ox, i32 noundef 108) #8, !dbg !2004
  call void @mayo_secure_clear(ptr noundef nonnull %tmp, i32 noundef 113) #8, !dbg !2005
  call void @mayo_secure_clear(ptr noundef nonnull %Mtmp, i32 noundef 6160) #8, !dbg !2006
  ret i32 %ret.0, !dbg !2007
}

; Function Attrs: nounwind
define internal fastcc void @compute_rhs(ptr noundef %p, ptr noundef %vPv, ptr noundef %t, ptr noundef %y) unnamed_addr #0 !dbg !2008 {
entry:
  %temp = alloca [7 x i64], align 8
    #dbg_value(ptr %p, !2011, !DIExpression(), !2012)
    #dbg_value(ptr %vPv, !2013, !DIExpression(), !2012)
    #dbg_value(ptr %t, !2014, !DIExpression(), !2012)
    #dbg_value(ptr %y, !2015, !DIExpression(), !2012)
    #dbg_value(i32 44, !2016, !DIExpression(), !2012)
    #dbg_value(i32 7, !2018, !DIExpression(), !2012)
    #dbg_value(i64 1, !2019, !DIExpression(), !2022)
    #dbg_value(i64 281474976710656, !2019, !DIExpression(), !2022)
    #dbg_value(i64 281474976710655, !2019, !DIExpression(), !2022)
    #dbg_value(i32 0, !2023, !DIExpression(), !2025)
  br label %for.cond, !dbg !2026

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2027
    #dbg_value(i32 %i.0, !2023, !DIExpression(), !2025)
  %exitcond = icmp ne i32 %i.0, 121, !dbg !2028
  br i1 %exitcond, label %for.body, label %for.end, !dbg !2030

for.body:                                         ; preds = %for.cond
  %.idx6 = mul nuw nsw i32 %i.0, 56, !dbg !2031
  %0 = getelementptr inbounds nuw i8, ptr %vPv, i32 %.idx6, !dbg !2031
  %arrayidx = getelementptr inbounds nuw i8, ptr %0, i32 48, !dbg !2031
  %1 = load i64, ptr %arrayidx, align 8, !dbg !2033
  %and = and i64 %1, 281474976710655, !dbg !2033
  store i64 %and, ptr %arrayidx, align 8, !dbg !2033
  %inc = add nuw nsw i32 %i.0, 1, !dbg !2034
    #dbg_value(i32 %inc, !2023, !DIExpression(), !2025)
  br label %for.cond, !dbg !2035, !llvm.loop !2036

for.end:                                          ; preds = %for.cond
    #dbg_declare(ptr %temp, !2038, !DIExpression(), !2039)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(56) %temp, i8 0, i32 56, i1 false), !dbg !2039
    #dbg_value(ptr %temp, !2040, !DIExpression(), !2012)
    #dbg_value(i32 10, !2041, !DIExpression(), !2043)
  br label %for.cond3, !dbg !2044

for.cond3:                                        ; preds = %for.inc77, %for.end
  %i2.0 = phi i32 [ 10, %for.end ], [ %dec78, %for.inc77 ], !dbg !2045
    #dbg_value(i32 %i2.0, !2041, !DIExpression(), !2043)
  %cmp4 = icmp sgt i32 %i2.0, -1, !dbg !2046
  br i1 %cmp4, label %for.cond6.preheader, label %for.cond81.preheader, !dbg !2048

for.cond6.preheader:                              ; preds = %for.cond3
  br label %for.cond6, !dbg !2049

for.cond81.preheader:                             ; preds = %for.cond3
  br label %for.cond81, !dbg !2052

for.cond6:                                        ; preds = %for.cond6.preheader, %for.inc74
  %j.0 = phi i32 [ %inc75, %for.inc74 ], [ %i2.0, %for.cond6.preheader ], !dbg !2054
    #dbg_value(i32 %j.0, !2055, !DIExpression(), !2056)
  %exitcond18 = icmp ne i32 %j.0, 11, !dbg !2057
  br i1 %exitcond18, label %for.body8, label %for.inc77, !dbg !2049

for.body8:                                        ; preds = %for.cond6
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %temp, i32 48, !dbg !2059
  %2 = load i64, ptr %arrayidx9, align 8, !dbg !2059
  %shr = lshr i64 %2, 44, !dbg !2061
  %3 = trunc i64 %shr to i8, !dbg !2062
    #dbg_value(i8 %conv, !2063, !DIExpression(), !2064)
  %arrayidx10 = getelementptr inbounds nuw i8, ptr %temp, i32 48, !dbg !2065
  %shl11 = shl i64 %2, 4, !dbg !2066
  store i64 %shl11, ptr %arrayidx10, align 8, !dbg !2066
    #dbg_value(i32 5, !2067, !DIExpression(), !2069)
  br label %for.cond12, !dbg !2070

for.cond12:                                       ; preds = %for.body15, %for.body8
  %k.0 = phi i32 [ 5, %for.body8 ], [ %dec, %for.body15 ], !dbg !2071
    #dbg_value(i32 %k.0, !2067, !DIExpression(), !2069)
  %cmp13 = icmp sgt i32 %k.0, -1, !dbg !2072
  br i1 %cmp13, label %for.body15, label %for.cond24.preheader, !dbg !2074

for.cond24.preheader:                             ; preds = %for.cond12
  %conv = and i8 %3, 15, !dbg !2062
  br label %for.cond24, !dbg !2075

for.body15:                                       ; preds = %for.cond12
  %arrayidx16 = getelementptr inbounds nuw [7 x i64], ptr %temp, i32 0, i32 %k.0, !dbg !2077
  %4 = load i64, ptr %arrayidx16, align 8, !dbg !2077
  %shr17 = lshr i64 %4, 60, !dbg !2079
  %add18 = add nuw nsw i32 %k.0, 1, !dbg !2080
  %arrayidx19 = getelementptr inbounds nuw [7 x i64], ptr %temp, i32 0, i32 %add18, !dbg !2081
  %5 = load i64, ptr %arrayidx19, align 8, !dbg !2082
  %xor = xor i64 %5, %shr17, !dbg !2082
  store i64 %xor, ptr %arrayidx19, align 8, !dbg !2082
  %arrayidx20 = getelementptr inbounds nuw [7 x i64], ptr %temp, i32 0, i32 %k.0, !dbg !2083
  %6 = load i64, ptr %arrayidx20, align 8, !dbg !2084
  %shl21 = shl i64 %6, 4, !dbg !2084
  store i64 %shl21, ptr %arrayidx20, align 8, !dbg !2084
  %dec = add nsw i32 %k.0, -1, !dbg !2085
    #dbg_value(i32 %dec, !2067, !DIExpression(), !2069)
  br label %for.cond12, !dbg !2086, !llvm.loop !2087

for.cond24:                                       ; preds = %for.cond24.preheader, %for.inc46
  %jj.0 = phi i32 [ %inc47, %for.inc46 ], [ 0, %for.cond24.preheader ], !dbg !2089
    #dbg_value(i32 %jj.0, !2090, !DIExpression(), !2091)
  %exitcond16 = icmp ne i32 %jj.0, 4, !dbg !2092
  br i1 %exitcond16, label %for.body27, label %for.cond50.preheader, !dbg !2075

for.cond50.preheader:                             ; preds = %for.cond24
  br label %for.cond50, !dbg !2094

for.body27:                                       ; preds = %for.cond24
  %rem28 = and i32 %jj.0, 1, !dbg !2096
  %cmp29 = icmp eq i32 %rem28, 0, !dbg !2099
  br i1 %cmp29, label %if.then, label %if.else, !dbg !2099

if.then:                                          ; preds = %for.body27
  %arrayidx31 = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %jj.0, !dbg !2100
  %7 = load i8, ptr %arrayidx31, align 1, !dbg !2100
    #dbg_value(i8 %conv, !1538, !DIExpression(), !2102)
    #dbg_value(i8 %7, !1544, !DIExpression(), !2102)
  %8 = load volatile i8, ptr @pqmayo_MAYO_3_ref_unsigned_char_blocker, align 1, !dbg !2104
  %xor1.i = xor i8 %conv, %8, !dbg !2105
    #dbg_value(i8 %xor1.i, !1538, !DIExpression(), !2102)
  %9 = trunc i8 %xor1.i to i1, !dbg !2106
    #dbg_value(i8 poison, !1547, !DIExpression(), !2102)
  %10 = and i8 %xor1.i, 2, !dbg !2107
  %mul9.i = mul i8 %10, %7, !dbg !2108
  %conv10.i = select i1 %9, i8 %7, i8 0, !dbg !2106
  %xor11.i = xor i8 %conv10.i, %mul9.i, !dbg !2109
    #dbg_value(i8 %xor11.i, !1547, !DIExpression(), !2102)
  %11 = and i8 %xor1.i, 4, !dbg !2110
  %mul16.i = mul i8 %11, %7, !dbg !2111
  %xor18.i = xor i8 %mul16.i, %xor11.i, !dbg !2112
    #dbg_value(i8 %xor18.i, !1547, !DIExpression(), !2102)
  %12 = and i8 %xor1.i, 8, !dbg !2113
  %mul23.i = mul i8 %12, %7, !dbg !2114
  %xor25.i = xor i8 %mul23.i, %xor18.i, !dbg !2115
    #dbg_value(i8 %xor25.i, !1547, !DIExpression(), !2102)
    #dbg_value(i8 %xor25.i, !1549, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !2102)
  %13 = lshr i8 %xor25.i, 4, !dbg !2116
  %14 = lshr i8 %xor25.i, 3, !dbg !2117
  %15 = and i8 %14, 14, !dbg !2117
  %16 = xor i8 %13, %15, !dbg !2118
  %xor25.masked.i = and i8 %xor25.i, 15, !dbg !2119
  %17 = xor i8 %16, %xor25.masked.i, !dbg !2119
    #dbg_value(i8 %17, !1550, !DIExpression(), !2102)
  %div = lshr exact i32 %jj.0, 1, !dbg !2120
  %arrayidx33 = getelementptr inbounds nuw i8, ptr %temp, i32 %div, !dbg !2121
  %18 = load i8, ptr %arrayidx33, align 1, !dbg !2122
  %xor355 = xor i8 %18, %17, !dbg !2122
  store i8 %xor355, ptr %arrayidx33, align 1, !dbg !2122
  br label %for.inc46, !dbg !2123

if.else:                                          ; preds = %for.body27
  %arrayidx37 = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %jj.0, !dbg !2124
  %19 = load i8, ptr %arrayidx37, align 1, !dbg !2124
    #dbg_value(i8 %conv, !1538, !DIExpression(), !2126)
    #dbg_value(i8 %19, !1544, !DIExpression(), !2126)
  %20 = load volatile i8, ptr @pqmayo_MAYO_3_ref_unsigned_char_blocker, align 1, !dbg !2128
  %xor1.i7 = xor i8 %conv, %20, !dbg !2129
    #dbg_value(i8 %xor1.i7, !1538, !DIExpression(), !2126)
  %21 = trunc i8 %xor1.i7 to i1, !dbg !2130
    #dbg_value(i8 poison, !1547, !DIExpression(), !2126)
  %22 = and i8 %xor1.i7, 2, !dbg !2131
  %mul9.i8 = mul i8 %22, %19, !dbg !2132
  %conv10.i9 = select i1 %21, i8 %19, i8 0, !dbg !2130
  %xor11.i10 = xor i8 %conv10.i9, %mul9.i8, !dbg !2133
    #dbg_value(i8 %xor11.i10, !1547, !DIExpression(), !2126)
  %23 = and i8 %xor1.i7, 4, !dbg !2134
  %mul16.i11 = mul i8 %23, %19, !dbg !2135
  %xor18.i12 = xor i8 %mul16.i11, %xor11.i10, !dbg !2136
    #dbg_value(i8 %xor18.i12, !1547, !DIExpression(), !2126)
  %24 = and i8 %xor1.i7, 8, !dbg !2137
  %mul23.i13 = mul i8 %24, %19, !dbg !2138
  %xor25.i14 = xor i8 %mul23.i13, %xor18.i12, !dbg !2139
    #dbg_value(i8 %xor25.i14, !1547, !DIExpression(), !2126)
    #dbg_value(i8 %xor25.i14, !1549, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !2126)
  %25 = lshr i8 %xor25.i14, 4, !dbg !2140
  %26 = lshr i8 %xor25.i14, 3, !dbg !2141
  %27 = and i8 %26, 14, !dbg !2141
  %28 = xor i8 %25, %27, !dbg !2142
  %xor25.masked.i15 = and i8 %xor25.i14, 15, !dbg !2143
  %29 = xor i8 %28, %xor25.masked.i15, !dbg !2143
    #dbg_value(i8 %29, !1550, !DIExpression(), !2126)
  %shl40 = shl nuw i8 %29, 4, !dbg !2144
  %div414 = lshr i32 %jj.0, 1, !dbg !2145
  %arrayidx42 = getelementptr inbounds nuw i8, ptr %temp, i32 %div414, !dbg !2146
  %30 = load i8, ptr %arrayidx42, align 1, !dbg !2147
  %xor44 = xor i8 %shl40, %30, !dbg !2147
  store i8 %xor44, ptr %arrayidx42, align 1, !dbg !2147
  br label %for.inc46

for.inc46:                                        ; preds = %if.then, %if.else
  %inc47 = add nuw nsw i32 %jj.0, 1, !dbg !2148
    #dbg_value(i32 %inc47, !2090, !DIExpression(), !2091)
  br label %for.cond24, !dbg !2149, !llvm.loop !2150

for.cond50:                                       ; preds = %for.cond50.preheader, %for.body53
  %k49.0 = phi i32 [ %inc72, %for.body53 ], [ 0, %for.cond50.preheader ], !dbg !2152
    #dbg_value(i32 %k49.0, !2153, !DIExpression(), !2154)
  %exitcond17 = icmp ne i32 %k49.0, 7, !dbg !2155
  br i1 %exitcond17, label %for.body53, label %for.inc74, !dbg !2094

for.body53:                                       ; preds = %for.cond50
  %mul54 = mul nuw nsw i32 %i2.0, 11, !dbg !2157
  %add55 = add nuw nsw i32 %mul54, %j.0, !dbg !2159
  %.idx = mul nsw i32 %add55, 56, !dbg !2160
  %31 = getelementptr i8, ptr %vPv, i32 %.idx, !dbg !2160
  %arrayidx58 = getelementptr i64, ptr %31, i32 %k49.0, !dbg !2160
  %32 = load i64, ptr %arrayidx58, align 8, !dbg !2160
  %cmp59.not = icmp eq i32 %i2.0, %j.0, !dbg !2161
  %mul62 = mul nuw nsw i32 %j.0, 11, !dbg !2162
  %add63 = add nuw nsw i32 %mul62, %i2.0, !dbg !2163
  %.idx3 = mul nsw i32 %add63, 56, !dbg !2164
  %33 = getelementptr i8, ptr %vPv, i32 %.idx3, !dbg !2164
  %arrayidx66 = getelementptr i64, ptr %33, i32 %k49.0, !dbg !2164
  %34 = load i64, ptr %arrayidx66, align 8, !dbg !2164
  %mul67 = select i1 %cmp59.not, i64 0, i64 %34, !dbg !2165
  %xor68 = xor i64 %32, %mul67, !dbg !2166
  %arrayidx69 = getelementptr inbounds nuw [7 x i64], ptr %temp, i32 0, i32 %k49.0, !dbg !2167
  %35 = load i64, ptr %arrayidx69, align 8, !dbg !2168
  %xor70 = xor i64 %35, %xor68, !dbg !2168
  store i64 %xor70, ptr %arrayidx69, align 8, !dbg !2168
  %inc72 = add nuw nsw i32 %k49.0, 1, !dbg !2169
    #dbg_value(i32 %inc72, !2153, !DIExpression(), !2154)
  br label %for.cond50, !dbg !2170, !llvm.loop !2171

for.inc74:                                        ; preds = %for.cond50
  %inc75 = add nuw nsw i32 %j.0, 1, !dbg !2173
    #dbg_value(i32 %inc75, !2055, !DIExpression(), !2056)
  br label %for.cond6, !dbg !2174, !llvm.loop !2175

for.inc77:                                        ; preds = %for.cond6
  %dec78 = add nsw i32 %i2.0, -1, !dbg !2177
    #dbg_value(i32 %dec78, !2041, !DIExpression(), !2043)
  br label %for.cond3, !dbg !2178, !llvm.loop !2179

for.cond81:                                       ; preds = %for.cond81.preheader, %for.body84
  %i80.0 = phi i32 [ %add106, %for.body84 ], [ 0, %for.cond81.preheader ], !dbg !2181
    #dbg_value(i32 %i80.0, !2182, !DIExpression(), !2183)
  %cmp82 = icmp samesign ult i32 %i80.0, 108, !dbg !2184
  br i1 %cmp82, label %for.body84, label %for.end107, !dbg !2052

for.body84:                                       ; preds = %for.cond81
  %arrayidx85 = getelementptr inbounds nuw i8, ptr %t, i32 %i80.0, !dbg !2186
  %36 = load i8, ptr %arrayidx85, align 1, !dbg !2186
  %div87 = lshr exact i32 %i80.0, 1, !dbg !2188
  %arrayidx88 = getelementptr inbounds nuw i8, ptr %temp, i32 %div87, !dbg !2189
  %37 = load i8, ptr %arrayidx88, align 1, !dbg !2189
  %38 = and i8 %37, 15, !dbg !2190
  %xor911 = xor i8 %36, %38, !dbg !2191
  %arrayidx93 = getelementptr inbounds nuw i8, ptr %y, i32 %i80.0, !dbg !2192
  store i8 %xor911, ptr %arrayidx93, align 1, !dbg !2193
  %add94 = or disjoint i32 %i80.0, 1, !dbg !2194
  %arrayidx95 = getelementptr inbounds nuw i8, ptr %t, i32 %add94, !dbg !2195
  %39 = load i8, ptr %arrayidx95, align 1, !dbg !2195
  %div97 = lshr exact i32 %i80.0, 1, !dbg !2196
  %arrayidx98 = getelementptr inbounds nuw i8, ptr %temp, i32 %div97, !dbg !2197
  %40 = load i8, ptr %arrayidx98, align 1, !dbg !2197
  %41 = lshr i8 %40, 4, !dbg !2198
  %xor1012 = xor i8 %39, %41, !dbg !2199
  %add103 = or disjoint i32 %i80.0, 1, !dbg !2200
  %arrayidx104 = getelementptr inbounds nuw i8, ptr %y, i32 %add103, !dbg !2201
  store i8 %xor1012, ptr %arrayidx104, align 1, !dbg !2202
  %add106 = add nuw nsw i32 %i80.0, 2, !dbg !2203
    #dbg_value(i32 %add106, !2182, !DIExpression(), !2183)
  br label %for.cond81, !dbg !2204, !llvm.loop !2205

for.end107:                                       ; preds = %for.cond81
  ret void, !dbg !2207
}

declare dso_local ptr @memset(ptr noundef, i32 noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: nounwind
define dso_local i32 @pqmayo_MAYO_3_ref_mayo_sign(ptr noundef %p, ptr noundef %sm, ptr noundef %smlen, ptr noundef %m, i32 noundef %mlen, ptr noundef %csk) local_unnamed_addr #0 !dbg !2208 {
entry:
  %siglen = alloca i32, align 4
    #dbg_value(ptr %p, !2209, !DIExpression(), !2210)
    #dbg_value(ptr %sm, !2211, !DIExpression(), !2210)
    #dbg_value(ptr %smlen, !2212, !DIExpression(), !2210)
    #dbg_value(ptr %m, !2213, !DIExpression(), !2210)
    #dbg_value(i32 %mlen, !2214, !DIExpression(), !2210)
    #dbg_value(ptr %csk, !2215, !DIExpression(), !2210)
    #dbg_value(i32 0, !2216, !DIExpression(), !2210)
    #dbg_value(i32 681, !2217, !DIExpression(), !2210)
  %add.ptr = getelementptr inbounds nuw i8, ptr %sm, i32 681, !dbg !2218
  %call = call ptr @memmove(ptr noundef nonnull %add.ptr, ptr noundef %m, i32 noundef %mlen) #8, !dbg !2219
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %sm, i32 681, !dbg !2220
    #dbg_value(ptr %siglen, !2221, !DIExpression(DW_OP_deref), !2210)
  %call2 = call i32 @pqmayo_MAYO_3_ref_mayo_sign_signature(ptr noundef %p, ptr noundef %sm, ptr noundef nonnull %siglen, ptr noundef nonnull %add.ptr1, i32 noundef %mlen, ptr noundef %csk) #9, !dbg !2222
    #dbg_value(i32 %call2, !2216, !DIExpression(), !2210)
  %cmp.not = icmp eq i32 %call2, 0, !dbg !2223
  %0 = load i32, ptr %siglen, align 4
    #dbg_value(i32 %0, !2221, !DIExpression(), !2210)
  %cmp3.not = icmp eq i32 %0, 681
  %or.cond = select i1 %cmp.not, i1 %cmp3.not, i1 false, !dbg !2225
  br i1 %or.cond, label %if.end, label %if.then, !dbg !2225

if.then:                                          ; preds = %entry
  %1 = load i32, ptr %siglen, align 4, !dbg !2226
    #dbg_value(i32 %1, !2221, !DIExpression(), !2210)
  %add = add i32 %1, %mlen, !dbg !2228
  %call4 = call ptr @memset(ptr noundef %sm, i32 noundef 0, i32 noundef %add) #8, !dbg !2229
  br label %err, !dbg !2230

if.end:                                           ; preds = %entry
  %2 = load i32, ptr %siglen, align 4, !dbg !2231
    #dbg_value(i32 %2, !2221, !DIExpression(), !2210)
  %add5 = add i32 %2, %mlen, !dbg !2232
  store i32 %add5, ptr %smlen, align 4, !dbg !2233
  br label %err, !dbg !2234

err:                                              ; preds = %if.end, %if.then
    #dbg_label(!2235, !2236)
  ret i32 %call2, !dbg !2237
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_3_ref_mayo_open(ptr noundef %p, ptr noundef %m, ptr noundef %mlen, ptr noundef %sm, i32 noundef %smlen, ptr noundef %pk) local_unnamed_addr #0 !dbg !336 {
entry:
    #dbg_value(ptr %p, !335, !DIExpression(), !2238)
    #dbg_value(ptr %m, !342, !DIExpression(), !2238)
    #dbg_value(ptr %mlen, !343, !DIExpression(), !2238)
    #dbg_value(ptr %sm, !344, !DIExpression(), !2238)
    #dbg_value(i32 %smlen, !345, !DIExpression(), !2238)
    #dbg_value(ptr %pk, !346, !DIExpression(), !2238)
    #dbg_value(i32 681, !347, !DIExpression(), !2238)
  %cmp = icmp ult i32 %smlen, 681, !dbg !2239
  br i1 %cmp, label %return, label %if.end, !dbg !2239

if.end:                                           ; preds = %entry
  %add.ptr = getelementptr inbounds nuw i8, ptr %sm, i32 681, !dbg !2240
  %sub = add i32 %smlen, -681, !dbg !2241
  %call = call i32 @pqmayo_MAYO_3_ref_mayo_verify(ptr noundef %p, ptr noundef nonnull %add.ptr, i32 noundef %sub, ptr noundef %sm, ptr noundef %pk) #9, !dbg !2242
    #dbg_value(i32 %call, !353, !DIExpression(), !2238)
  %cmp1 = icmp eq i32 %call, 0, !dbg !2243
  br i1 %cmp1, label %if.then2, label %return, !dbg !2243

if.then2:                                         ; preds = %if.end
  %sub3 = add i32 %smlen, -681, !dbg !2244
  store i32 %sub3, ptr %mlen, align 4, !dbg !2245
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sm, i32 681, !dbg !2246
  %call5 = call ptr @memmove(ptr noundef %m, ptr noundef nonnull %add.ptr4, i32 noundef %sub3) #8, !dbg !2247
  br label %return, !dbg !2248

return:                                           ; preds = %if.end, %if.then2, %entry
  %retval.0 = phi i32 [ 1, %entry ], [ 0, %if.then2 ], [ 1, %if.end ], !dbg !2238
  ret i32 %retval.0, !dbg !2249
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_3_ref_mayo_verify(ptr noundef %p, ptr noundef %m, i32 noundef %mlen, ptr noundef %sig, ptr noundef %cpk) local_unnamed_addr #0 !dbg !2250 {
entry:
  %accumulator.i39 = alloca [145376 x i64], align 8
  %accumulator.i = alloca [13552 x i64], align 8
  %tmp.i2 = alloca [7 x i64], align 8
  %tmp.i = alloca [7 x i64], align 8
  %PS.i.i = alloca [9086 x i64], align 8
  %SPS.i = alloca [847 x i64], align 8
  %zero.i = alloca [108 x i8], align 1
  %tEnc = alloca [54 x i8], align 1
  %t = alloca [108 x i8], align 1
  %y = alloca [216 x i8], align 1
  %s = alloca [1298 x i8], align 1
  %pk = alloca [49147 x i64], align 8
  %tmp = alloca [80 x i8], align 1
    #dbg_value(ptr %p, !2253, !DIExpression(), !2254)
    #dbg_value(ptr %m, !2255, !DIExpression(), !2254)
    #dbg_value(i32 %mlen, !2256, !DIExpression(), !2254)
    #dbg_value(ptr %sig, !2257, !DIExpression(), !2254)
    #dbg_value(ptr %cpk, !2258, !DIExpression(), !2254)
    #dbg_declare(ptr %tEnc, !2259, !DIExpression(), !2260)
    #dbg_declare(ptr %t, !2261, !DIExpression(), !2262)
    #dbg_declare(ptr %y, !2263, !DIExpression(), !2267)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(216) %y, i8 0, i32 216, i1 false), !dbg !2267
    #dbg_declare(ptr %s, !2268, !DIExpression(), !2269)
    #dbg_declare(ptr %pk, !2270, !DIExpression(), !2274)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(393176) %pk, i8 0, i32 393176, i1 false), !dbg !2274
    #dbg_declare(ptr %tmp, !2275, !DIExpression(), !2279)
    #dbg_value(i32 108, !2280, !DIExpression(), !2254)
    #dbg_value(i32 118, !2281, !DIExpression(), !2254)
    #dbg_value(i32 11, !2282, !DIExpression(), !2254)
    #dbg_value(i32 54, !2283, !DIExpression(), !2254)
    #dbg_value(i32 681, !2284, !DIExpression(), !2254)
    #dbg_value(i32 48, !2285, !DIExpression(), !2254)
    #dbg_value(i32 32, !2286, !DIExpression(), !2254)
    #dbg_value(ptr %p, !247, !DIExpression(), !2287)
    #dbg_value(ptr %cpk, !253, !DIExpression(), !2287)
    #dbg_value(ptr %pk, !254, !DIExpression(), !2287)
    #dbg_value(ptr %p, !255, !DIExpression(), !2289)
    #dbg_value(ptr %pk, !261, !DIExpression(), !2289)
    #dbg_value(ptr %cpk, !262, !DIExpression(), !2289)
  %call.i.i = call i32 @AES_128_CTR(ptr noundef nonnull %pk, i32 noundef 376164, ptr noundef %cpk, i32 noundef 16) #8, !dbg !2291
  call void @llvm.lifetime.start.p0(i64 56, ptr nonnull %tmp.i2), !dbg !2292
    #dbg_value(ptr %pk, !269, !DIExpression(), !2294)
    #dbg_value(ptr %pk, !271, !DIExpression(), !2294)
    #dbg_value(i32 6966, !272, !DIExpression(), !2294)
    #dbg_value(i32 108, !273, !DIExpression(), !2294)
    #dbg_value(i32 7, !274, !DIExpression(), !2294)
    #dbg_value(ptr %pk, !276, !DIExpression(), !2294)
    #dbg_declare(ptr %tmp.i2, !277, !DIExpression(), !2292)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(56) %tmp.i2, i8 0, i32 56, i1 false), !dbg !2292
    #dbg_value(i32 6966, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2295)
  br label %for.cond.i3, !dbg !2296

for.cond.i3:                                      ; preds = %for.body.i7, %entry
  %i.0.in.i4 = phi i32 [ 6966, %entry ], [ %i.0.i5, %for.body.i7 ]
    #dbg_value(i32 %i.0.in.i4, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2295)
  %cmp.i6 = icmp ugt i32 %i.0.in.i4, 0, !dbg !2297
  br i1 %cmp.i6, label %for.body.i7, label %unpack_m_vecs.exit16, !dbg !2298

for.body.i7:                                      ; preds = %for.cond.i3
  %i.0.i5 = add nsw i32 %i.0.in.i4, -1, !dbg !2299
    #dbg_value(i32 %i.0.i5, !279, !DIExpression(), !2295)
  %mul.i8 = mul nsw i32 %i.0.i5, 108, !dbg !2300
  %div1.i96568 = lshr exact i32 %mul.i8, 1, !dbg !2301
  %add.ptr.i10 = getelementptr inbounds nuw i8, ptr %pk, i32 %div1.i96568, !dbg !2302
  %call.i11 = call ptr @memcpy(ptr noundef nonnull %tmp.i2, ptr noundef nonnull %add.ptr.i10, i32 noundef 54) #8, !dbg !2303
  %mul4.i13 = mul nsw i32 %i.0.i5, 56, !dbg !2304
  %add.ptr5.i14 = getelementptr inbounds nuw i8, ptr %pk, i32 %mul4.i13, !dbg !2305
  %call8.i15 = call ptr @memcpy(ptr noundef nonnull %add.ptr5.i14, ptr noundef nonnull %tmp.i2, i32 noundef 56) #8, !dbg !2306
    #dbg_value(i32 %i.0.i5, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2295)
  br label %for.cond.i3, !dbg !2307, !llvm.loop !2308

unpack_m_vecs.exit16:                             ; preds = %for.cond.i3
  call void @llvm.lifetime.end.p0(i64 56, ptr nonnull %tmp.i2), !dbg !2310
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %cpk, i32 16, !dbg !2311
  %add.ptr2.i = getelementptr inbounds nuw i8, ptr %pk, i32 390096, !dbg !2312
  call void @llvm.lifetime.start.p0(i64 56, ptr nonnull %tmp.i), !dbg !2313
    #dbg_value(ptr %add.ptr.i, !269, !DIExpression(), !2315)
    #dbg_value(ptr %add.ptr2.i, !271, !DIExpression(), !2315)
    #dbg_value(i32 55, !272, !DIExpression(), !2315)
    #dbg_value(i32 108, !273, !DIExpression(), !2315)
    #dbg_value(i32 7, !274, !DIExpression(), !2315)
    #dbg_value(ptr %add.ptr2.i, !276, !DIExpression(), !2315)
    #dbg_declare(ptr %tmp.i, !277, !DIExpression(), !2313)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(56) %tmp.i, i8 0, i32 56, i1 false), !dbg !2313
    #dbg_value(i32 55, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2316)
  br label %for.cond.i, !dbg !2317

for.cond.i:                                       ; preds = %for.body.i, %unpack_m_vecs.exit16
  %i.0.in.i = phi i32 [ 55, %unpack_m_vecs.exit16 ], [ %i.0.i, %for.body.i ]
    #dbg_value(i32 %i.0.in.i, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2316)
  %cmp.i = icmp ugt i32 %i.0.in.i, 0, !dbg !2318
  br i1 %cmp.i, label %for.body.i, label %unpack_m_vecs.exit, !dbg !2319

for.body.i:                                       ; preds = %for.cond.i
  %i.0.i = add nsw i32 %i.0.in.i, -1, !dbg !2320
    #dbg_value(i32 %i.0.i, !279, !DIExpression(), !2316)
  %mul.i = mul nsw i32 %i.0.i, 108, !dbg !2321
  %div1.i6667 = lshr exact i32 %mul.i, 1, !dbg !2322
  %add.ptr.i1 = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 %div1.i6667, !dbg !2323
  %call.i = call ptr @memcpy(ptr noundef nonnull %tmp.i, ptr noundef nonnull %add.ptr.i1, i32 noundef 54) #8, !dbg !2324
  %mul4.i = mul nsw i32 %i.0.i, 56, !dbg !2325
  %add.ptr5.i = getelementptr inbounds nuw i8, ptr %add.ptr2.i, i32 %mul4.i, !dbg !2326
  %call8.i = call ptr @memcpy(ptr noundef nonnull %add.ptr5.i, ptr noundef nonnull %tmp.i, i32 noundef 56) #8, !dbg !2327
    #dbg_value(i32 %i.0.i, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2316)
  br label %for.cond.i, !dbg !2328, !llvm.loop !2329

unpack_m_vecs.exit:                               ; preds = %for.cond.i
  call void @llvm.lifetime.end.p0(i64 56, ptr nonnull %tmp.i), !dbg !2331
    #dbg_value(i32 0, !2332, !DIExpression(), !2254)
    #dbg_value(ptr %pk, !2333, !DIExpression(), !2254)
  %add.ptr = getelementptr inbounds nuw i8, ptr %pk, i32 329616, !dbg !2334
    #dbg_value(ptr %add.ptr, !2335, !DIExpression(), !2254)
    #dbg_value(ptr %add.ptr2, !2336, !DIExpression(), !2254)
  %call4 = call i32 @shake256(ptr noundef nonnull %tmp, i32 noundef 48, ptr noundef %m, i32 noundef %mlen) #8, !dbg !2337
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %tmp, i32 48, !dbg !2338
  %add.ptr8 = getelementptr inbounds nuw i8, ptr %sig, i32 649, !dbg !2339
  %call9 = call ptr @memcpy(ptr noundef nonnull %add.ptr6, ptr noundef nonnull %add.ptr8, i32 noundef 32) #8, !dbg !2340
  %call12 = call i32 @shake256(ptr noundef nonnull %tEnc, i32 noundef 54, ptr noundef nonnull %tmp, i32 noundef 80) #8, !dbg !2341
    #dbg_value(ptr %tEnc, !432, !DIExpression(), !2342)
    #dbg_value(ptr %t, !438, !DIExpression(), !2342)
    #dbg_value(i32 108, !439, !DIExpression(), !2342)
    #dbg_value(i32 0, !440, !DIExpression(), !2342)
  br label %for.cond.i17, !dbg !2344

for.cond.i17:                                     ; preds = %for.body.i20, %unpack_m_vecs.exit
  %mdec.addr.0.i = phi ptr [ %t, %unpack_m_vecs.exit ], [ %incdec.ptr5.i, %for.body.i20 ]
  %i.0.i18 = phi i32 [ 0, %unpack_m_vecs.exit ], [ %inc.i, %for.body.i20 ], !dbg !2345
    #dbg_value(i32 %i.0.i18, !440, !DIExpression(), !2342)
    #dbg_value(ptr %mdec.addr.0.i, !438, !DIExpression(), !2342)
  %exitcond = icmp ne i32 %i.0.i18, 54, !dbg !2346
  br i1 %exitcond, label %for.body.i20, label %for.cond.i21.preheader, !dbg !2347

for.cond.i21.preheader:                           ; preds = %for.cond.i17
  br label %for.cond.i21, !dbg !2348

for.body.i20:                                     ; preds = %for.cond.i17
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %tEnc, i32 %i.0.i18, !dbg !2350
  %0 = load i8, ptr %arrayidx.i, align 1, !dbg !2350
  %1 = and i8 %0, 15, !dbg !2351
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i, i32 1, !dbg !2352
    #dbg_value(ptr %incdec.ptr.i, !438, !DIExpression(), !2342)
  store i8 %1, ptr %mdec.addr.0.i, align 1, !dbg !2353
  %2 = lshr i8 %0, 4, !dbg !2354
    #dbg_value(ptr %incdec.ptr.i, !438, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2342)
  store i8 %2, ptr %incdec.ptr.i, align 1, !dbg !2355
  %incdec.ptr5.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i, i32 2, !dbg !2356
    #dbg_value(ptr %incdec.ptr5.i, !438, !DIExpression(), !2342)
  %inc.i = add nuw nsw i32 %i.0.i18, 1, !dbg !2357
    #dbg_value(i32 %inc.i, !440, !DIExpression(), !2342)
  br label %for.cond.i17, !dbg !2358, !llvm.loop !2359

for.cond.i21:                                     ; preds = %for.cond.i21.preheader, %for.body.i25
  %mdec.addr.0.i22 = phi ptr [ %incdec.ptr5.i29, %for.body.i25 ], [ %s, %for.cond.i21.preheader ]
  %i.0.i23 = phi i32 [ %inc.i30, %for.body.i25 ], [ 0, %for.cond.i21.preheader ], !dbg !2361
    #dbg_value(i32 %i.0.i23, !440, !DIExpression(), !2362)
    #dbg_value(ptr %mdec.addr.0.i22, !438, !DIExpression(), !2362)
  %exitcond69 = icmp ne i32 %i.0.i23, 649, !dbg !2363
  br i1 %exitcond69, label %for.body.i25, label %decode.exit31, !dbg !2348

for.body.i25:                                     ; preds = %for.cond.i21
  %arrayidx.i26 = getelementptr inbounds nuw i8, ptr %sig, i32 %i.0.i23, !dbg !2364
  %3 = load i8, ptr %arrayidx.i26, align 1, !dbg !2364
  %4 = and i8 %3, 15, !dbg !2365
  %incdec.ptr.i27 = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i22, i32 1, !dbg !2366
    #dbg_value(ptr %incdec.ptr.i27, !438, !DIExpression(), !2362)
  store i8 %4, ptr %mdec.addr.0.i22, align 1, !dbg !2367
  %5 = lshr i8 %3, 4, !dbg !2368
    #dbg_value(ptr %incdec.ptr.i27, !438, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2362)
  store i8 %5, ptr %incdec.ptr.i27, align 1, !dbg !2369
  %incdec.ptr5.i29 = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i22, i32 2, !dbg !2370
    #dbg_value(ptr %incdec.ptr5.i29, !438, !DIExpression(), !2362)
  %inc.i30 = add nuw nsw i32 %i.0.i23, 1, !dbg !2371
    #dbg_value(i32 %inc.i30, !440, !DIExpression(), !2362)
  br label %for.cond.i21, !dbg !2372, !llvm.loop !2373

decode.exit31:                                    ; preds = %for.cond.i21
  call void @llvm.lifetime.start.p0(i64 6776, ptr nonnull %SPS.i), !dbg !2375
  call void @llvm.lifetime.start.p0(i64 108, ptr nonnull %zero.i), !dbg !2375
    #dbg_value(ptr %p, !2380, !DIExpression(), !2381)
    #dbg_value(ptr %s, !2382, !DIExpression(), !2381)
    #dbg_value(ptr %pk, !2383, !DIExpression(), !2381)
    #dbg_value(ptr %add.ptr, !2384, !DIExpression(), !2381)
    #dbg_value(ptr %add.ptr2, !2385, !DIExpression(), !2381)
    #dbg_value(ptr %y, !2386, !DIExpression(), !2381)
    #dbg_declare(ptr %SPS.i, !2387, !DIExpression(), !2375)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(6776) %SPS.i, i8 0, i32 6776, i1 false), !dbg !2375
  call void @llvm.lifetime.start.p0(i64 72688, ptr nonnull %PS.i.i), !dbg !2391
    #dbg_value(ptr %p, !2396, !DIExpression(), !2397)
    #dbg_value(ptr %pk, !2398, !DIExpression(), !2397)
    #dbg_value(ptr %add.ptr, !2399, !DIExpression(), !2397)
    #dbg_value(ptr %add.ptr2, !2400, !DIExpression(), !2397)
    #dbg_value(ptr %s, !2401, !DIExpression(), !2397)
    #dbg_value(ptr %SPS.i, !2402, !DIExpression(), !2397)
    #dbg_declare(ptr %PS.i.i, !2403, !DIExpression(), !2391)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(72688) %PS.i.i, i8 0, i32 72688, i1 false), !dbg !2391
  call void @llvm.lifetime.start.p0(i64 1163008, ptr nonnull %accumulator.i39), !dbg !2407
    #dbg_value(ptr %pk, !2412, !DIExpression(), !2413)
    #dbg_value(ptr %add.ptr, !2414, !DIExpression(), !2413)
    #dbg_value(ptr %add.ptr2, !2415, !DIExpression(), !2413)
    #dbg_value(ptr %s, !2416, !DIExpression(), !2413)
    #dbg_value(i32 108, !2417, !DIExpression(), !2413)
    #dbg_value(i32 108, !2418, !DIExpression(), !2413)
    #dbg_value(i32 10, !2419, !DIExpression(), !2413)
    #dbg_value(i32 11, !2420, !DIExpression(), !2413)
    #dbg_value(ptr %PS.i.i, !2421, !DIExpression(), !2413)
    #dbg_value(i32 118, !2422, !DIExpression(), !2413)
    #dbg_value(i32 7, !2423, !DIExpression(), !2413)
    #dbg_declare(ptr %accumulator.i39, !2424, !DIExpression(), !2407)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(1163008) %accumulator.i39, i8 0, i32 1163008, i1 false), !dbg !2407
    #dbg_value(i32 0, !2428, !DIExpression(), !2413)
    #dbg_value(i32 0, !2429, !DIExpression(), !2431)
  br label %for.cond.i40, !dbg !2432

for.cond.i40:                                     ; preds = %for.inc52.i, %decode.exit31
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc52.i ], [ 108, %decode.exit31 ], !dbg !2433
  %P1_used.0.i = phi i32 [ 0, %decode.exit31 ], [ %P1_used.1.i.lcssa, %for.inc52.i ], !dbg !2433
  %row.0.i41 = phi i32 [ 0, %decode.exit31 ], [ %inc53.i, %for.inc52.i ], !dbg !2434
    #dbg_value(i32 %row.0.i41, !2429, !DIExpression(), !2431)
    #dbg_value(i32 %P1_used.0.i, !2428, !DIExpression(), !2413)
  %exitcond76 = icmp ne i32 %row.0.i41, 108, !dbg !2435
  br i1 %exitcond76, label %for.cond2.i.preheader, label %for.cond56.i.preheader, !dbg !2437

for.cond2.i.preheader:                            ; preds = %for.cond.i40
  %6 = add i32 %P1_used.0.i, %indvars.iv, !dbg !2438
  br label %for.cond2.i, !dbg !2438

for.cond56.i.preheader:                           ; preds = %for.cond.i40
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %pk, i32 390096, !dbg !2441
  br label %for.cond56.i, !dbg !2442

for.cond2.i:                                      ; preds = %for.cond2.i.preheader, %for.inc17.i
  %P1_used.1.i = phi i32 [ %inc16.i, %for.inc17.i ], [ %P1_used.0.i, %for.cond2.i.preheader ], !dbg !2413
  %j.0.i46 = phi i32 [ %inc18.i, %for.inc17.i ], [ %row.0.i41, %for.cond2.i.preheader ], !dbg !2444
    #dbg_value(i32 %j.0.i46, !2445, !DIExpression(), !2446)
    #dbg_value(i32 %P1_used.1.i, !2428, !DIExpression(), !2413)
  %exitcond72 = icmp ne i32 %P1_used.1.i, %6, !dbg !2447
  br i1 %exitcond72, label %for.cond5.i.preheader, label %for.cond21.i.preheader, !dbg !2438

for.cond21.i.preheader:                           ; preds = %for.cond2.i
  %P1_used.1.i.lcssa = phi i32 [ %P1_used.1.i, %for.cond2.i ], !dbg !2413
  br label %for.cond21.i, !dbg !2449

for.cond5.i.preheader:                            ; preds = %for.cond2.i
  br label %for.cond5.i, !dbg !2451

for.cond5.i:                                      ; preds = %for.cond5.i.preheader, %m_vec_add.exit.i58
  %col.0.i48 = phi i32 [ %inc.i59, %m_vec_add.exit.i58 ], [ 0, %for.cond5.i.preheader ], !dbg !2454
    #dbg_value(i32 %col.0.i48, !2455, !DIExpression(), !2456)
  %exitcond71 = icmp ne i32 %col.0.i48, 11, !dbg !2457
  br i1 %exitcond71, label %for.body7.i, label %for.inc17.i, !dbg !2451

for.body7.i:                                      ; preds = %for.cond5.i
  %add.ptr.i50.idx = mul nsw i32 %P1_used.1.i, 56, !dbg !2459
  %add.ptr.i50 = getelementptr inbounds i8, ptr %pk, i32 %add.ptr.i50.idx, !dbg !2459
  %mul8.i51 = mul nuw nsw i32 %row.0.i41, 11, !dbg !2461
  %add9.i = add nuw nsw i32 %mul8.i51, %col.0.i48, !dbg !2462
  %mul10.i = shl nuw nsw i32 %add9.i, 4, !dbg !2463
  %mul11.i52 = mul nuw nsw i32 %col.0.i48, 118, !dbg !2464
  %7 = getelementptr i8, ptr %s, i32 %mul11.i52, !dbg !2465
  %arrayidx.i53 = getelementptr i8, ptr %7, i32 %j.0.i46, !dbg !2465
  %8 = load i8, ptr %arrayidx.i53, align 1, !dbg !2465
  %conv.i54 = zext i8 %8 to i32, !dbg !2465
  %add13.i = add nuw nsw i32 %mul10.i, %conv.i54, !dbg !2466
  %add.ptr15.i.idx = mul nuw nsw i32 %add13.i, 56, !dbg !2467
  %add.ptr15.i = getelementptr inbounds nuw i8, ptr %accumulator.i39, i32 %add.ptr15.i.idx, !dbg !2467
    #dbg_value(i32 7, !2468, !DIExpression(), !2472)
    #dbg_value(ptr %add.ptr.i50, !2474, !DIExpression(), !2472)
    #dbg_value(ptr %add.ptr15.i, !2475, !DIExpression(), !2472)
    #dbg_value(i32 0, !2476, !DIExpression(), !2478)
  br label %for.cond.i.i55, !dbg !2479

for.cond.i.i55:                                   ; preds = %for.body.i.i60, %for.body7.i
  %i.0.i.i56 = phi i32 [ 0, %for.body7.i ], [ %inc.i.i64, %for.body.i.i60 ], !dbg !2480
    #dbg_value(i32 %i.0.i.i56, !2476, !DIExpression(), !2478)
  %exitcond70 = icmp ne i32 %i.0.i.i56, 7, !dbg !2481
  br i1 %exitcond70, label %for.body.i.i60, label %m_vec_add.exit.i58, !dbg !2483

for.body.i.i60:                                   ; preds = %for.cond.i.i55
  %arrayidx.i.i61 = getelementptr inbounds nuw i64, ptr %add.ptr.i50, i32 %i.0.i.i56, !dbg !2484
  %9 = load i64, ptr %arrayidx.i.i61, align 8, !dbg !2484
  %arrayidx1.i.i62 = getelementptr inbounds nuw i64, ptr %add.ptr15.i, i32 %i.0.i.i56, !dbg !2486
  %10 = load i64, ptr %arrayidx1.i.i62, align 8, !dbg !2487
  %xor.i.i63 = xor i64 %10, %9, !dbg !2487
  store i64 %xor.i.i63, ptr %arrayidx1.i.i62, align 8, !dbg !2487
  %inc.i.i64 = add nuw nsw i32 %i.0.i.i56, 1, !dbg !2488
    #dbg_value(i32 %inc.i.i64, !2476, !DIExpression(), !2478)
  br label %for.cond.i.i55, !dbg !2489, !llvm.loop !2490

m_vec_add.exit.i58:                               ; preds = %for.cond.i.i55
  %inc.i59 = add nuw nsw i32 %col.0.i48, 1, !dbg !2492
    #dbg_value(i32 %inc.i59, !2455, !DIExpression(), !2456)
  br label %for.cond5.i, !dbg !2493, !llvm.loop !2494

for.inc17.i:                                      ; preds = %for.cond5.i
    #dbg_value(i32 %P1_used.1.i, !2428, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2413)
  %inc16.i = add i32 %P1_used.1.i, 1, !dbg !2496
    #dbg_value(i32 %inc16.i, !2428, !DIExpression(), !2413)
  %inc18.i = add nuw nsw i32 %j.0.i46, 1, !dbg !2497
    #dbg_value(i32 %inc18.i, !2445, !DIExpression(), !2446)
  br label %for.cond2.i, !dbg !2498, !llvm.loop !2499

for.cond21.i:                                     ; preds = %for.cond21.i.preheader, %for.inc49.i
  %j20.0.i = phi i32 [ %inc50.i, %for.inc49.i ], [ 0, %for.cond21.i.preheader ], !dbg !2501
    #dbg_value(i32 %j20.0.i, !2502, !DIExpression(), !2503)
  %exitcond75 = icmp ne i32 %j20.0.i, 10, !dbg !2504
  br i1 %exitcond75, label %for.cond26.i.preheader, label %for.inc52.i, !dbg !2449

for.cond26.i.preheader:                           ; preds = %for.cond21.i
  br label %for.cond26.i, !dbg !2506

for.cond26.i:                                     ; preds = %for.cond26.i.preheader, %m_vec_add.exit18.i
  %col25.0.i = phi i32 [ %inc47.i, %m_vec_add.exit18.i ], [ 0, %for.cond26.i.preheader ], !dbg !2509
    #dbg_value(i32 %col25.0.i, !2510, !DIExpression(), !2511)
  %exitcond74 = icmp ne i32 %col25.0.i, 11, !dbg !2512
  br i1 %exitcond74, label %for.body29.i, label %for.inc49.i, !dbg !2506

for.body29.i:                                     ; preds = %for.cond26.i
  %mul30.i47 = mul nuw nsw i32 %row.0.i41, 10, !dbg !2514
  %add31.i = add nuw nsw i32 %mul30.i47, %j20.0.i, !dbg !2516
  %add.ptr33.i.idx = mul nuw nsw i32 %add31.i, 56, !dbg !2517
  %add.ptr33.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %add.ptr33.i.idx, !dbg !2517
  %mul35.i = mul nuw nsw i32 %row.0.i41, 11, !dbg !2518
  %add36.i = add nuw nsw i32 %mul35.i, %col25.0.i, !dbg !2519
  %mul37.i = shl nuw nsw i32 %add36.i, 4, !dbg !2520
  %mul38.i = mul nuw nsw i32 %col25.0.i, 118, !dbg !2521
  %11 = getelementptr i8, ptr %s, i32 %mul38.i, !dbg !2522
  %12 = getelementptr i8, ptr %11, i32 %j20.0.i, !dbg !2522
  %arrayidx41.i = getelementptr i8, ptr %12, i32 108, !dbg !2522
  %13 = load i8, ptr %arrayidx41.i, align 1, !dbg !2522
  %conv42.i = zext i8 %13 to i32, !dbg !2522
  %add43.i = add nuw nsw i32 %mul37.i, %conv42.i, !dbg !2523
  %add.ptr45.i.idx = mul nuw nsw i32 %add43.i, 56, !dbg !2524
  %add.ptr45.i = getelementptr inbounds nuw i8, ptr %accumulator.i39, i32 %add.ptr45.i.idx, !dbg !2524
    #dbg_value(i32 7, !2468, !DIExpression(), !2525)
    #dbg_value(ptr %add.ptr33.i, !2474, !DIExpression(), !2525)
    #dbg_value(ptr %add.ptr45.i, !2475, !DIExpression(), !2525)
    #dbg_value(i32 0, !2476, !DIExpression(), !2527)
  br label %for.cond.i10.i, !dbg !2528

for.cond.i10.i:                                   ; preds = %for.body.i13.i, %for.body29.i
  %i.0.i11.i = phi i32 [ 0, %for.body29.i ], [ %inc.i17.i, %for.body.i13.i ], !dbg !2529
    #dbg_value(i32 %i.0.i11.i, !2476, !DIExpression(), !2527)
  %exitcond73 = icmp ne i32 %i.0.i11.i, 7, !dbg !2530
  br i1 %exitcond73, label %for.body.i13.i, label %m_vec_add.exit18.i, !dbg !2531

for.body.i13.i:                                   ; preds = %for.cond.i10.i
  %arrayidx.i14.i = getelementptr inbounds nuw i64, ptr %add.ptr33.i, i32 %i.0.i11.i, !dbg !2532
  %14 = load i64, ptr %arrayidx.i14.i, align 8, !dbg !2532
  %arrayidx1.i15.i = getelementptr inbounds nuw i64, ptr %add.ptr45.i, i32 %i.0.i11.i, !dbg !2533
  %15 = load i64, ptr %arrayidx1.i15.i, align 8, !dbg !2534
  %xor.i16.i = xor i64 %15, %14, !dbg !2534
  store i64 %xor.i16.i, ptr %arrayidx1.i15.i, align 8, !dbg !2534
  %inc.i17.i = add nuw nsw i32 %i.0.i11.i, 1, !dbg !2535
    #dbg_value(i32 %inc.i17.i, !2476, !DIExpression(), !2527)
  br label %for.cond.i10.i, !dbg !2536, !llvm.loop !2537

m_vec_add.exit18.i:                               ; preds = %for.cond.i10.i
  %inc47.i = add nuw nsw i32 %col25.0.i, 1, !dbg !2539
    #dbg_value(i32 %inc47.i, !2510, !DIExpression(), !2511)
  br label %for.cond26.i, !dbg !2540, !llvm.loop !2541

for.inc49.i:                                      ; preds = %for.cond26.i
  %inc50.i = add nuw nsw i32 %j20.0.i, 1, !dbg !2543
    #dbg_value(i32 %inc50.i, !2502, !DIExpression(), !2503)
  br label %for.cond21.i, !dbg !2544, !llvm.loop !2545

for.inc52.i:                                      ; preds = %for.cond21.i
  %inc53.i = add nuw nsw i32 %row.0.i41, 1, !dbg !2547
    #dbg_value(i32 %inc53.i, !2429, !DIExpression(), !2431)
  %indvars.iv.next = add nsw i32 %indvars.iv, -1, !dbg !2548
  br label %for.cond.i40, !dbg !2548, !llvm.loop !2549

for.cond56.i:                                     ; preds = %for.cond56.i.preheader, %for.inc90.i
  %indvars.iv79 = phi i32 [ 10, %for.cond56.i.preheader ], [ %indvars.iv.next80, %for.inc90.i ], !dbg !2551
  %P3_used.0.i = phi i32 [ %P3_used.1.i.lcssa, %for.inc90.i ], [ 0, %for.cond56.i.preheader ], !dbg !2551
  %row55.0.i = phi i32 [ %inc91.i, %for.inc90.i ], [ 108, %for.cond56.i.preheader ], !dbg !2552
    #dbg_value(i32 %row55.0.i, !2553, !DIExpression(), !2554)
    #dbg_value(i32 %P3_used.0.i, !2555, !DIExpression(), !2413)
  %exitcond82 = icmp ne i32 %row55.0.i, 118, !dbg !2556
  br i1 %exitcond82, label %for.cond61.i.preheader, label %while.cond.i43.preheader, !dbg !2442

for.cond61.i.preheader:                           ; preds = %for.cond56.i
  %16 = add i32 %P3_used.0.i, %indvars.iv79, !dbg !2558
  br label %for.cond61.i, !dbg !2558

while.cond.i43.preheader:                         ; preds = %for.cond56.i
  br label %while.cond.i43, !dbg !2561

for.cond61.i:                                     ; preds = %for.cond61.i.preheader, %for.inc87.i
  %P3_used.1.i = phi i32 [ %inc86.i, %for.inc87.i ], [ %P3_used.0.i, %for.cond61.i.preheader ], !dbg !2413
  %j60.0.i = phi i32 [ %inc88.i, %for.inc87.i ], [ %row55.0.i, %for.cond61.i.preheader ], !dbg !2562
    #dbg_value(i32 %j60.0.i, !2563, !DIExpression(), !2564)
    #dbg_value(i32 %P3_used.1.i, !2555, !DIExpression(), !2413)
  %exitcond81 = icmp ne i32 %P3_used.1.i, %16, !dbg !2565
  br i1 %exitcond81, label %for.cond66.i.preheader, label %for.inc90.i, !dbg !2558

for.cond66.i.preheader:                           ; preds = %for.cond61.i
  br label %for.cond66.i, !dbg !2567

for.cond66.i:                                     ; preds = %for.cond66.i.preheader, %m_vec_add.exit9.i
  %col65.0.i = phi i32 [ %inc84.i, %m_vec_add.exit9.i ], [ 0, %for.cond66.i.preheader ], !dbg !2570
    #dbg_value(i32 %col65.0.i, !2571, !DIExpression(), !2572)
  %exitcond78 = icmp ne i32 %col65.0.i, 11, !dbg !2573
  br i1 %exitcond78, label %for.body69.i, label %for.inc87.i, !dbg !2567

for.body69.i:                                     ; preds = %for.cond66.i
  %add.ptr71.i.idx = mul nsw i32 %P3_used.1.i, 56, !dbg !2575
  %add.ptr71.i = getelementptr inbounds i8, ptr %add.ptr2, i32 %add.ptr71.i.idx, !dbg !2575
  %mul73.i = mul nuw nsw i32 %row55.0.i, 11, !dbg !2577
  %add74.i = add nuw nsw i32 %mul73.i, %col65.0.i, !dbg !2578
  %mul75.i = shl nuw nsw i32 %add74.i, 4, !dbg !2579
  %mul76.i = mul nuw nsw i32 %col65.0.i, 118, !dbg !2580
  %17 = getelementptr i8, ptr %s, i32 %mul76.i, !dbg !2581
  %arrayidx78.i = getelementptr i8, ptr %17, i32 %j60.0.i, !dbg !2581
  %18 = load i8, ptr %arrayidx78.i, align 1, !dbg !2581
  %conv79.i = zext i8 %18 to i32, !dbg !2581
  %add80.i = add nuw nsw i32 %mul75.i, %conv79.i, !dbg !2582
  %add.ptr82.i.idx = mul nuw nsw i32 %add80.i, 56, !dbg !2583
  %add.ptr82.i = getelementptr inbounds nuw i8, ptr %accumulator.i39, i32 %add.ptr82.i.idx, !dbg !2583
    #dbg_value(i32 7, !2468, !DIExpression(), !2584)
    #dbg_value(ptr %add.ptr71.i, !2474, !DIExpression(), !2584)
    #dbg_value(ptr %add.ptr82.i, !2475, !DIExpression(), !2584)
    #dbg_value(i32 0, !2476, !DIExpression(), !2586)
  br label %for.cond.i1.i, !dbg !2587

for.cond.i1.i:                                    ; preds = %for.body.i4.i, %for.body69.i
  %i.0.i2.i = phi i32 [ 0, %for.body69.i ], [ %inc.i8.i, %for.body.i4.i ], !dbg !2588
    #dbg_value(i32 %i.0.i2.i, !2476, !DIExpression(), !2586)
  %exitcond77 = icmp ne i32 %i.0.i2.i, 7, !dbg !2589
  br i1 %exitcond77, label %for.body.i4.i, label %m_vec_add.exit9.i, !dbg !2590

for.body.i4.i:                                    ; preds = %for.cond.i1.i
  %arrayidx.i5.i = getelementptr inbounds nuw i64, ptr %add.ptr71.i, i32 %i.0.i2.i, !dbg !2591
  %19 = load i64, ptr %arrayidx.i5.i, align 8, !dbg !2591
  %arrayidx1.i6.i = getelementptr inbounds nuw i64, ptr %add.ptr82.i, i32 %i.0.i2.i, !dbg !2592
  %20 = load i64, ptr %arrayidx1.i6.i, align 8, !dbg !2593
  %xor.i7.i = xor i64 %20, %19, !dbg !2593
  store i64 %xor.i7.i, ptr %arrayidx1.i6.i, align 8, !dbg !2593
  %inc.i8.i = add nuw nsw i32 %i.0.i2.i, 1, !dbg !2594
    #dbg_value(i32 %inc.i8.i, !2476, !DIExpression(), !2586)
  br label %for.cond.i1.i, !dbg !2595, !llvm.loop !2596

m_vec_add.exit9.i:                                ; preds = %for.cond.i1.i
  %inc84.i = add nuw nsw i32 %col65.0.i, 1, !dbg !2598
    #dbg_value(i32 %inc84.i, !2571, !DIExpression(), !2572)
  br label %for.cond66.i, !dbg !2599, !llvm.loop !2600

for.inc87.i:                                      ; preds = %for.cond66.i
    #dbg_value(i32 %P3_used.1.i, !2555, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2413)
  %inc86.i = add i32 %P3_used.1.i, 1, !dbg !2602
    #dbg_value(i32 %inc86.i, !2555, !DIExpression(), !2413)
  %inc88.i = add nuw nsw i32 %j60.0.i, 1, !dbg !2603
    #dbg_value(i32 %inc88.i, !2563, !DIExpression(), !2564)
  br label %for.cond61.i, !dbg !2604, !llvm.loop !2605

for.inc90.i:                                      ; preds = %for.cond61.i
  %P3_used.1.i.lcssa = phi i32 [ %P3_used.1.i, %for.cond61.i ], !dbg !2413
  %inc91.i = add nuw nsw i32 %row55.0.i, 1, !dbg !2607
    #dbg_value(i32 %inc91.i, !2553, !DIExpression(), !2554)
  %indvars.iv.next80 = add nsw i32 %indvars.iv79, -1, !dbg !2608
  br label %for.cond56.i, !dbg !2608, !llvm.loop !2609

while.cond.i43:                                   ; preds = %while.cond.i43.preheader, %while.body.i45
  %i.0.i44 = phi i32 [ %inc102.i, %while.body.i45 ], [ 0, %while.cond.i43.preheader ], !dbg !2413
    #dbg_value(i32 %i.0.i44, !2611, !DIExpression(), !2413)
  %exitcond83 = icmp ne i32 %i.0.i44, 1298, !dbg !2612
  br i1 %exitcond83, label %while.body.i45, label %mayo_generic_m_calculate_PS.exit, !dbg !2561

while.body.i45:                                   ; preds = %while.cond.i43
  %add.ptr99.i.idx = mul nuw nsw i32 %i.0.i44, 896, !dbg !2613
  %add.ptr99.i = getelementptr inbounds nuw i8, ptr %accumulator.i39, i32 %add.ptr99.i.idx, !dbg !2613
  %add.ptr101.i.idx = mul nuw nsw i32 %i.0.i44, 56, !dbg !2615
  %add.ptr101.i = getelementptr inbounds nuw i8, ptr %PS.i.i, i32 %add.ptr101.i.idx, !dbg !2615
  call fastcc void @m_vec_multiply_bins(i32 noundef 7, ptr noundef nonnull %add.ptr99.i, ptr noundef nonnull %add.ptr101.i) #9, !dbg !2616
  %inc102.i = add nuw nsw i32 %i.0.i44, 1, !dbg !2617
    #dbg_value(i32 %inc102.i, !2611, !DIExpression(), !2413)
  br label %while.cond.i43, !dbg !2561, !llvm.loop !2618

mayo_generic_m_calculate_PS.exit:                 ; preds = %while.cond.i43
  call void @llvm.lifetime.end.p0(i64 1163008, ptr nonnull %accumulator.i39), !dbg !2620
  call void @llvm.lifetime.start.p0(i64 108416, ptr nonnull %accumulator.i), !dbg !2621
    #dbg_value(ptr %PS.i.i, !2626, !DIExpression(), !2627)
    #dbg_value(ptr %s, !2628, !DIExpression(), !2627)
    #dbg_value(i32 108, !2629, !DIExpression(), !2627)
    #dbg_value(i32 11, !2630, !DIExpression(), !2627)
    #dbg_value(i32 118, !2631, !DIExpression(), !2627)
    #dbg_value(ptr %SPS.i, !2632, !DIExpression(), !2627)
    #dbg_declare(ptr %accumulator.i, !2633, !DIExpression(), !2621)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(108416) %accumulator.i, i8 0, i32 108416, i1 false), !dbg !2621
    #dbg_value(i32 7, !2637, !DIExpression(), !2627)
    #dbg_value(i32 0, !2638, !DIExpression(), !2640)
  br label %for.cond.i32, !dbg !2641

for.cond.i32:                                     ; preds = %for.inc20.i, %mayo_generic_m_calculate_PS.exit
  %row.0.i = phi i32 [ 0, %mayo_generic_m_calculate_PS.exit ], [ %inc21.i, %for.inc20.i ], !dbg !2642
    #dbg_value(i32 %row.0.i, !2638, !DIExpression(), !2640)
  %exitcond87 = icmp ne i32 %row.0.i, 11, !dbg !2643
  br i1 %exitcond87, label %for.cond1.i.preheader, label %while.cond.i.preheader, !dbg !2645

for.cond1.i.preheader:                            ; preds = %for.cond.i32
  br label %for.cond1.i, !dbg !2646

while.cond.i.preheader:                           ; preds = %for.cond.i32
  br label %while.cond.i, !dbg !2649

for.cond1.i:                                      ; preds = %for.cond1.i.preheader, %for.inc18.i
  %j.0.i = phi i32 [ %inc.i35, %for.inc18.i ], [ 0, %for.cond1.i.preheader ], !dbg !2650
    #dbg_value(i32 %j.0.i, !2651, !DIExpression(), !2652)
  %exitcond86 = icmp ne i32 %j.0.i, 118, !dbg !2653
  br i1 %exitcond86, label %for.cond4.i.preheader, label %for.inc20.i, !dbg !2646

for.cond4.i.preheader:                            ; preds = %for.cond1.i
  br label %for.cond4.i, !dbg !2655

for.cond4.i:                                      ; preds = %for.cond4.i.preheader, %m_vec_add.exit.i
  %col.0.i = phi i32 [ %add17.i, %m_vec_add.exit.i ], [ 0, %for.cond4.i.preheader ], !dbg !2658
    #dbg_value(i32 %col.0.i, !2659, !DIExpression(), !2660)
  %exitcond85 = icmp ne i32 %col.0.i, 11, !dbg !2661
  br i1 %exitcond85, label %for.body6.i, label %for.inc18.i, !dbg !2655

for.body6.i:                                      ; preds = %for.cond4.i
  %mul.i36 = mul nuw nsw i32 %j.0.i, 11, !dbg !2663
  %add7.i = add nuw nsw i32 %mul.i36, %col.0.i, !dbg !2665
  %add.ptr.i37.idx = mul nuw nsw i32 %add7.i, 56, !dbg !2666
  %add.ptr.i37 = getelementptr inbounds nuw i8, ptr %PS.i.i, i32 %add.ptr.i37.idx, !dbg !2666
  %mul9.i = mul nuw nsw i32 %row.0.i, 11, !dbg !2667
  %add10.i = add nuw nsw i32 %mul9.i, %col.0.i, !dbg !2668
  %mul11.i = shl nuw nsw i32 %add10.i, 4, !dbg !2669
  %mul12.i = mul nuw nsw i32 %row.0.i, 118, !dbg !2670
  %21 = getelementptr i8, ptr %s, i32 %mul12.i, !dbg !2671
  %arrayidx.i38 = getelementptr i8, ptr %21, i32 %j.0.i, !dbg !2671
  %22 = load i8, ptr %arrayidx.i38, align 1, !dbg !2671
  %conv.i = zext i8 %22 to i32, !dbg !2671
  %add14.i = add nuw nsw i32 %mul11.i, %conv.i, !dbg !2672
  %add.ptr16.i.idx = mul nuw nsw i32 %add14.i, 56, !dbg !2673
  %add.ptr16.i = getelementptr inbounds nuw i8, ptr %accumulator.i, i32 %add.ptr16.i.idx, !dbg !2673
    #dbg_value(i32 7, !2468, !DIExpression(), !2674)
    #dbg_value(ptr %add.ptr.i37, !2474, !DIExpression(), !2674)
    #dbg_value(ptr %add.ptr16.i, !2475, !DIExpression(), !2674)
    #dbg_value(i32 0, !2476, !DIExpression(), !2676)
  br label %for.cond.i.i, !dbg !2677

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body6.i
  %i.0.i.i = phi i32 [ 0, %for.body6.i ], [ %inc.i.i, %for.body.i.i ], !dbg !2678
    #dbg_value(i32 %i.0.i.i, !2476, !DIExpression(), !2676)
  %exitcond84 = icmp ne i32 %i.0.i.i, 7, !dbg !2679
  br i1 %exitcond84, label %for.body.i.i, label %m_vec_add.exit.i, !dbg !2680

for.body.i.i:                                     ; preds = %for.cond.i.i
  %arrayidx.i.i = getelementptr inbounds nuw i64, ptr %add.ptr.i37, i32 %i.0.i.i, !dbg !2681
  %23 = load i64, ptr %arrayidx.i.i, align 8, !dbg !2681
  %arrayidx1.i.i = getelementptr inbounds nuw i64, ptr %add.ptr16.i, i32 %i.0.i.i, !dbg !2682
  %24 = load i64, ptr %arrayidx1.i.i, align 8, !dbg !2683
  %xor.i.i = xor i64 %24, %23, !dbg !2683
  store i64 %xor.i.i, ptr %arrayidx1.i.i, align 8, !dbg !2683
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !2684
    #dbg_value(i32 %inc.i.i, !2476, !DIExpression(), !2676)
  br label %for.cond.i.i, !dbg !2685, !llvm.loop !2686

m_vec_add.exit.i:                                 ; preds = %for.cond.i.i
  %add17.i = add nuw nsw i32 %col.0.i, 1, !dbg !2688
    #dbg_value(i32 %add17.i, !2659, !DIExpression(), !2660)
  br label %for.cond4.i, !dbg !2689, !llvm.loop !2690

for.inc18.i:                                      ; preds = %for.cond4.i
  %inc.i35 = add nuw nsw i32 %j.0.i, 1, !dbg !2692
    #dbg_value(i32 %inc.i35, !2651, !DIExpression(), !2652)
  br label %for.cond1.i, !dbg !2693, !llvm.loop !2694

for.inc20.i:                                      ; preds = %for.cond1.i
  %inc21.i = add nuw nsw i32 %row.0.i, 1, !dbg !2696
    #dbg_value(i32 %inc21.i, !2638, !DIExpression(), !2640)
  br label %for.cond.i32, !dbg !2697, !llvm.loop !2698

while.cond.i:                                     ; preds = %while.cond.i.preheader, %while.body.i
  %i.0.i34 = phi i32 [ %inc32.i, %while.body.i ], [ 0, %while.cond.i.preheader ], !dbg !2627
    #dbg_value(i32 %i.0.i34, !2700, !DIExpression(), !2627)
  %exitcond88 = icmp ne i32 %i.0.i34, 121, !dbg !2701
  br i1 %exitcond88, label %while.body.i, label %mayo_generic_m_calculate_SPS.exit, !dbg !2649

while.body.i:                                     ; preds = %while.cond.i
  %add.ptr29.i.idx = mul nuw nsw i32 %i.0.i34, 896, !dbg !2702
  %add.ptr29.i = getelementptr inbounds nuw i8, ptr %accumulator.i, i32 %add.ptr29.i.idx, !dbg !2702
  %add.ptr31.i.idx = mul nuw nsw i32 %i.0.i34, 56, !dbg !2704
  %add.ptr31.i = getelementptr inbounds nuw i8, ptr %SPS.i, i32 %add.ptr31.i.idx, !dbg !2704
  call fastcc void @m_vec_multiply_bins(i32 noundef 7, ptr noundef nonnull %add.ptr29.i, ptr noundef nonnull %add.ptr31.i) #9, !dbg !2705
  %inc32.i = add nuw nsw i32 %i.0.i34, 1, !dbg !2706
    #dbg_value(i32 %inc32.i, !2700, !DIExpression(), !2627)
  br label %while.cond.i, !dbg !2649, !llvm.loop !2707

mayo_generic_m_calculate_SPS.exit:                ; preds = %while.cond.i
  call void @llvm.lifetime.end.p0(i64 108416, ptr nonnull %accumulator.i), !dbg !2709
  call void @llvm.lifetime.end.p0(i64 72688, ptr nonnull %PS.i.i), !dbg !2710
    #dbg_declare(ptr %zero.i, !2711, !DIExpression(), !2712)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(108) %zero.i, i8 0, i32 108, i1 false), !dbg !2712
  call fastcc void @compute_rhs(ptr noundef %p, ptr noundef nonnull %SPS.i, ptr noundef nonnull %zero.i, ptr noundef nonnull %y) #9, !dbg !2713
  call void @llvm.lifetime.end.p0(i64 6776, ptr nonnull %SPS.i), !dbg !2714
  call void @llvm.lifetime.end.p0(i64 108, ptr nonnull %zero.i), !dbg !2714
  %call20 = call i32 @memcmp(ptr noundef nonnull %y, ptr noundef nonnull %t, i32 noundef 108) #8, !dbg !2715
  %cmp21 = icmp ne i32 %call20, 0, !dbg !2717
  %. = zext i1 %cmp21 to i32, !dbg !2254
  ret i32 %., !dbg !2718
}

; Function Attrs: nounwind
define dso_local i32 @pqmayo_MAYO_3_ref_mayo_expand_pk(ptr noundef %p, ptr noundef %cpk, ptr noundef %pk) local_unnamed_addr #0 !dbg !248 {
entry:
  %tmp.i2 = alloca [7 x i64], align 8
  %tmp.i = alloca [7 x i64], align 8
    #dbg_value(ptr %p, !247, !DIExpression(), !2719)
    #dbg_value(ptr %cpk, !253, !DIExpression(), !2719)
    #dbg_value(ptr %pk, !254, !DIExpression(), !2719)
    #dbg_value(ptr %p, !255, !DIExpression(), !2720)
    #dbg_value(ptr %pk, !261, !DIExpression(), !2720)
    #dbg_value(ptr %cpk, !262, !DIExpression(), !2720)
  %call.i = call i32 @AES_128_CTR(ptr noundef %pk, i32 noundef 376164, ptr noundef %cpk, i32 noundef 16) #8, !dbg !2722
  call void @llvm.lifetime.start.p0(i64 56, ptr nonnull %tmp.i2), !dbg !2723
    #dbg_value(ptr %pk, !269, !DIExpression(), !2725)
    #dbg_value(ptr %pk, !271, !DIExpression(), !2725)
    #dbg_value(i32 6966, !272, !DIExpression(), !2725)
    #dbg_value(i32 108, !273, !DIExpression(), !2725)
    #dbg_value(i32 7, !274, !DIExpression(), !2725)
    #dbg_value(ptr %pk, !276, !DIExpression(), !2725)
    #dbg_declare(ptr %tmp.i2, !277, !DIExpression(), !2723)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(56) %tmp.i2, i8 0, i32 56, i1 false), !dbg !2723
    #dbg_value(i32 6966, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2726)
  br label %for.cond.i3, !dbg !2727

for.cond.i3:                                      ; preds = %for.body.i7, %entry
  %i.0.in.i4 = phi i32 [ 6966, %entry ], [ %i.0.i5, %for.body.i7 ]
    #dbg_value(i32 %i.0.in.i4, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2726)
  %cmp.i6 = icmp ugt i32 %i.0.in.i4, 0, !dbg !2728
  br i1 %cmp.i6, label %for.body.i7, label %unpack_m_vecs.exit16, !dbg !2729

for.body.i7:                                      ; preds = %for.cond.i3
  %i.0.i5 = add nsw i32 %i.0.in.i4, -1, !dbg !2730
    #dbg_value(i32 %i.0.i5, !279, !DIExpression(), !2726)
  %mul.i8 = mul nsw i32 %i.0.i5, 108, !dbg !2731
  %div1.i91720 = lshr exact i32 %mul.i8, 1, !dbg !2732
  %add.ptr.i10 = getelementptr inbounds nuw i8, ptr %pk, i32 %div1.i91720, !dbg !2733
  %call.i11 = call ptr @memcpy(ptr noundef nonnull %tmp.i2, ptr noundef %add.ptr.i10, i32 noundef 54) #8, !dbg !2734
  %mul4.i13 = mul nsw i32 %i.0.i5, 56, !dbg !2735
  %add.ptr5.i14 = getelementptr inbounds nuw i8, ptr %pk, i32 %mul4.i13, !dbg !2736
  %call8.i15 = call ptr @memcpy(ptr noundef %add.ptr5.i14, ptr noundef nonnull %tmp.i2, i32 noundef 56) #8, !dbg !2737
    #dbg_value(i32 %i.0.i5, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2726)
  br label %for.cond.i3, !dbg !2738, !llvm.loop !2739

unpack_m_vecs.exit16:                             ; preds = %for.cond.i3
  call void @llvm.lifetime.end.p0(i64 56, ptr nonnull %tmp.i2), !dbg !2741
  %add.ptr = getelementptr inbounds nuw i8, ptr %cpk, i32 16, !dbg !2742
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %pk, i32 390096, !dbg !2743
  call void @llvm.lifetime.start.p0(i64 56, ptr nonnull %tmp.i), !dbg !2744
    #dbg_value(ptr %add.ptr, !269, !DIExpression(), !2746)
    #dbg_value(ptr %add.ptr2, !271, !DIExpression(), !2746)
    #dbg_value(i32 55, !272, !DIExpression(), !2746)
    #dbg_value(i32 108, !273, !DIExpression(), !2746)
    #dbg_value(i32 7, !274, !DIExpression(), !2746)
    #dbg_value(ptr %add.ptr2, !276, !DIExpression(), !2746)
    #dbg_declare(ptr %tmp.i, !277, !DIExpression(), !2744)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(56) %tmp.i, i8 0, i32 56, i1 false), !dbg !2744
    #dbg_value(i32 55, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2747)
  br label %for.cond.i, !dbg !2748

for.cond.i:                                       ; preds = %for.body.i, %unpack_m_vecs.exit16
  %i.0.in.i = phi i32 [ 55, %unpack_m_vecs.exit16 ], [ %i.0.i, %for.body.i ]
    #dbg_value(i32 %i.0.in.i, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2747)
  %cmp.i = icmp ugt i32 %i.0.in.i, 0, !dbg !2749
  br i1 %cmp.i, label %for.body.i, label %unpack_m_vecs.exit, !dbg !2750

for.body.i:                                       ; preds = %for.cond.i
  %i.0.i = add nsw i32 %i.0.in.i, -1, !dbg !2751
    #dbg_value(i32 %i.0.i, !279, !DIExpression(), !2747)
  %mul.i = mul nsw i32 %i.0.i, 108, !dbg !2752
  %div1.i1819 = lshr exact i32 %mul.i, 1, !dbg !2753
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %div1.i1819, !dbg !2754
  %call.i1 = call ptr @memcpy(ptr noundef nonnull %tmp.i, ptr noundef nonnull %add.ptr.i, i32 noundef 54) #8, !dbg !2755
  %mul4.i = mul nsw i32 %i.0.i, 56, !dbg !2756
  %add.ptr5.i = getelementptr inbounds nuw i8, ptr %add.ptr2, i32 %mul4.i, !dbg !2757
  %call8.i = call ptr @memcpy(ptr noundef nonnull %add.ptr5.i, ptr noundef nonnull %tmp.i, i32 noundef 56) #8, !dbg !2758
    #dbg_value(i32 %i.0.i, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2747)
  br label %for.cond.i, !dbg !2759, !llvm.loop !2760

unpack_m_vecs.exit:                               ; preds = %for.cond.i
  call void @llvm.lifetime.end.p0(i64 56, ptr nonnull %tmp.i), !dbg !2762
  ret i32 0, !dbg !2763
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_multiply_bins(i32 noundef %m_vec_limbs, ptr noundef %bins, ptr noundef %out) unnamed_addr #0 !dbg !2764 {
entry:
    #dbg_value(i32 %m_vec_limbs, !2767, !DIExpression(), !2768)
    #dbg_value(ptr %bins, !2769, !DIExpression(), !2768)
    #dbg_value(ptr %out, !2770, !DIExpression(), !2768)
  %add.ptr = getelementptr inbounds nuw i8, ptr %bins, i32 280, !dbg !2771
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %bins, i32 560, !dbg !2772
    #dbg_value(i32 %m_vec_limbs, !2773, !DIExpression(), !2775)
    #dbg_value(ptr %add.ptr, !2777, !DIExpression(), !2775)
    #dbg_value(ptr %add.ptr1, !2778, !DIExpression(), !2775)
    #dbg_value(i64 1229782938247303441, !2779, !DIExpression(), !2775)
    #dbg_value(i32 0, !2780, !DIExpression(), !2782)
  br label %for.cond.i77, !dbg !2783

for.cond.i77:                                     ; preds = %for.body.i80, %entry
  %i.0.i78 = phi i32 [ 0, %entry ], [ %inc.i89, %for.body.i80 ], !dbg !2784
    #dbg_value(i32 %i.0.i78, !2780, !DIExpression(), !2782)
  %exitcond = icmp ne i32 %i.0.i78, 7, !dbg !2785
  br i1 %exitcond, label %for.body.i80, label %m_vec_mul_add_x_inv.exit90, !dbg !2787

for.body.i80:                                     ; preds = %for.cond.i77
  %arrayidx.i81 = getelementptr inbounds nuw i64, ptr %add.ptr, i32 %i.0.i78, !dbg !2788
  %0 = load i64, ptr %arrayidx.i81, align 8, !dbg !2788
  %and.i82 = and i64 %0, 1229782938247303441, !dbg !2790
    #dbg_value(i64 %and.i82, !2791, !DIExpression(), !2792)
  %xor.i83 = lshr i64 %0, 1, !dbg !2793
  %shr.i84 = and i64 %xor.i83, 8608480567731124087, !dbg !2793
  %mul.i85 = mul nuw i64 %and.i82, 9, !dbg !2794
  %xor2.i86 = xor i64 %shr.i84, %mul.i85, !dbg !2795
  %arrayidx3.i87 = getelementptr inbounds nuw i64, ptr %add.ptr1, i32 %i.0.i78, !dbg !2796
  %1 = load i64, ptr %arrayidx3.i87, align 8, !dbg !2797
  %xor4.i88 = xor i64 %1, %xor2.i86, !dbg !2797
  store i64 %xor4.i88, ptr %arrayidx3.i87, align 8, !dbg !2797
  %inc.i89 = add nuw nsw i32 %i.0.i78, 1, !dbg !2798
    #dbg_value(i32 %inc.i89, !2780, !DIExpression(), !2782)
  br label %for.cond.i77, !dbg !2799, !llvm.loop !2800

m_vec_mul_add_x_inv.exit90:                       ; preds = %for.cond.i77
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %bins, i32 616, !dbg !2802
  %add.ptr3 = getelementptr inbounds nuw i8, ptr %bins, i32 672, !dbg !2803
    #dbg_value(i32 %m_vec_limbs, !2804, !DIExpression(), !2806)
    #dbg_value(ptr %add.ptr2, !2808, !DIExpression(), !2806)
    #dbg_value(ptr %add.ptr3, !2809, !DIExpression(), !2806)
    #dbg_value(i64 -8608480567731124088, !2810, !DIExpression(), !2806)
    #dbg_value(i32 0, !2811, !DIExpression(), !2813)
  br label %for.cond.i104, !dbg !2814

for.cond.i104:                                    ; preds = %for.body.i107, %m_vec_mul_add_x_inv.exit90
  %i.0.i105 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit90 ], [ %inc.i117, %for.body.i107 ], !dbg !2815
    #dbg_value(i32 %i.0.i105, !2811, !DIExpression(), !2813)
  %exitcond194 = icmp ne i32 %i.0.i105, 7, !dbg !2816
  br i1 %exitcond194, label %for.body.i107, label %m_vec_mul_add_x.exit118, !dbg !2818

for.body.i107:                                    ; preds = %for.cond.i104
  %arrayidx.i108 = getelementptr inbounds nuw i64, ptr %add.ptr2, i32 %i.0.i105, !dbg !2819
  %2 = load i64, ptr %arrayidx.i108, align 8, !dbg !2819
    #dbg_value(i64 %2, !2821, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2822)
  %xor.i109 = shl i64 %2, 1, !dbg !2823
  %shl.i110 = and i64 %xor.i109, -1229782938247303442, !dbg !2823
  %and.i111 = lshr i64 %2, 3, !dbg !2824
  %shr.i112 = and i64 %and.i111, 1229782938247303441, !dbg !2824
  %mul.i113 = mul nuw nsw i64 %shr.i112, 3, !dbg !2825
  %xor2.i114 = xor i64 %shl.i110, %mul.i113, !dbg !2826
  %arrayidx3.i115 = getelementptr inbounds nuw i64, ptr %add.ptr3, i32 %i.0.i105, !dbg !2827
  %3 = load i64, ptr %arrayidx3.i115, align 8, !dbg !2828
  %xor4.i116 = xor i64 %3, %xor2.i114, !dbg !2828
  store i64 %xor4.i116, ptr %arrayidx3.i115, align 8, !dbg !2828
  %inc.i117 = add nuw nsw i32 %i.0.i105, 1, !dbg !2829
    #dbg_value(i32 %inc.i117, !2811, !DIExpression(), !2813)
  br label %for.cond.i104, !dbg !2830, !llvm.loop !2831

m_vec_mul_add_x.exit118:                          ; preds = %for.cond.i104
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %bins, i32 560, !dbg !2833
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %bins, i32 392, !dbg !2834
    #dbg_value(i32 %m_vec_limbs, !2773, !DIExpression(), !2835)
    #dbg_value(ptr %add.ptr4, !2777, !DIExpression(), !2835)
    #dbg_value(ptr %add.ptr5, !2778, !DIExpression(), !2835)
    #dbg_value(i64 1229782938247303441, !2779, !DIExpression(), !2835)
    #dbg_value(i32 0, !2780, !DIExpression(), !2837)
  br label %for.cond.i49, !dbg !2838

for.cond.i49:                                     ; preds = %for.body.i52, %m_vec_mul_add_x.exit118
  %i.0.i50 = phi i32 [ 0, %m_vec_mul_add_x.exit118 ], [ %inc.i61, %for.body.i52 ], !dbg !2839
    #dbg_value(i32 %i.0.i50, !2780, !DIExpression(), !2837)
  %exitcond195 = icmp ne i32 %i.0.i50, 7, !dbg !2840
  br i1 %exitcond195, label %for.body.i52, label %m_vec_mul_add_x_inv.exit62, !dbg !2841

for.body.i52:                                     ; preds = %for.cond.i49
  %arrayidx.i53 = getelementptr inbounds nuw i64, ptr %add.ptr4, i32 %i.0.i50, !dbg !2842
  %4 = load i64, ptr %arrayidx.i53, align 8, !dbg !2842
  %and.i54 = and i64 %4, 1229782938247303441, !dbg !2843
    #dbg_value(i64 %and.i54, !2791, !DIExpression(), !2844)
  %xor.i55 = lshr i64 %4, 1, !dbg !2845
  %shr.i56 = and i64 %xor.i55, 8608480567731124087, !dbg !2845
  %mul.i57 = mul nuw i64 %and.i54, 9, !dbg !2846
  %xor2.i58 = xor i64 %shr.i56, %mul.i57, !dbg !2847
  %arrayidx3.i59 = getelementptr inbounds nuw i64, ptr %add.ptr5, i32 %i.0.i50, !dbg !2848
  %5 = load i64, ptr %arrayidx3.i59, align 8, !dbg !2849
  %xor4.i60 = xor i64 %5, %xor2.i58, !dbg !2849
  store i64 %xor4.i60, ptr %arrayidx3.i59, align 8, !dbg !2849
  %inc.i61 = add nuw nsw i32 %i.0.i50, 1, !dbg !2850
    #dbg_value(i32 %inc.i61, !2780, !DIExpression(), !2837)
  br label %for.cond.i49, !dbg !2851, !llvm.loop !2852

m_vec_mul_add_x_inv.exit62:                       ; preds = %for.cond.i49
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %bins, i32 672, !dbg !2854
  %add.ptr7 = getelementptr inbounds nuw i8, ptr %bins, i32 336, !dbg !2855
    #dbg_value(i32 %m_vec_limbs, !2804, !DIExpression(), !2856)
    #dbg_value(ptr %add.ptr6, !2808, !DIExpression(), !2856)
    #dbg_value(ptr %add.ptr7, !2809, !DIExpression(), !2856)
    #dbg_value(i64 -8608480567731124088, !2810, !DIExpression(), !2856)
    #dbg_value(i32 0, !2811, !DIExpression(), !2858)
  br label %for.cond.i91, !dbg !2859

for.cond.i91:                                     ; preds = %for.body.i94, %m_vec_mul_add_x_inv.exit62
  %i.0.i92 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit62 ], [ %inc.i103, %for.body.i94 ], !dbg !2860
    #dbg_value(i32 %i.0.i92, !2811, !DIExpression(), !2858)
  %exitcond196 = icmp ne i32 %i.0.i92, 7, !dbg !2861
  br i1 %exitcond196, label %for.body.i94, label %m_vec_mul_add_x.exit, !dbg !2862

for.body.i94:                                     ; preds = %for.cond.i91
  %arrayidx.i95 = getelementptr inbounds nuw i64, ptr %add.ptr6, i32 %i.0.i92, !dbg !2863
  %6 = load i64, ptr %arrayidx.i95, align 8, !dbg !2863
    #dbg_value(i64 %6, !2821, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2864)
  %xor.i96 = shl i64 %6, 1, !dbg !2865
  %shl.i = and i64 %xor.i96, -1229782938247303442, !dbg !2865
  %and.i97 = lshr i64 %6, 3, !dbg !2866
  %shr.i98 = and i64 %and.i97, 1229782938247303441, !dbg !2866
  %mul.i99 = mul nuw nsw i64 %shr.i98, 3, !dbg !2867
  %xor2.i100 = xor i64 %shl.i, %mul.i99, !dbg !2868
  %arrayidx3.i101 = getelementptr inbounds nuw i64, ptr %add.ptr7, i32 %i.0.i92, !dbg !2869
  %7 = load i64, ptr %arrayidx3.i101, align 8, !dbg !2870
  %xor4.i102 = xor i64 %7, %xor2.i100, !dbg !2870
  store i64 %xor4.i102, ptr %arrayidx3.i101, align 8, !dbg !2870
  %inc.i103 = add nuw nsw i32 %i.0.i92, 1, !dbg !2871
    #dbg_value(i32 %inc.i103, !2811, !DIExpression(), !2858)
  br label %for.cond.i91, !dbg !2872, !llvm.loop !2873

m_vec_mul_add_x.exit:                             ; preds = %for.cond.i91
  %add.ptr8 = getelementptr inbounds nuw i8, ptr %bins, i32 392, !dbg !2875
  %add.ptr9 = getelementptr inbounds nuw i8, ptr %bins, i32 784, !dbg !2876
    #dbg_value(i32 %m_vec_limbs, !2773, !DIExpression(), !2877)
    #dbg_value(ptr %add.ptr8, !2777, !DIExpression(), !2877)
    #dbg_value(ptr %add.ptr9, !2778, !DIExpression(), !2877)
    #dbg_value(i64 1229782938247303441, !2779, !DIExpression(), !2877)
    #dbg_value(i32 0, !2780, !DIExpression(), !2879)
  br label %for.cond.i7, !dbg !2880

for.cond.i7:                                      ; preds = %for.body.i10, %m_vec_mul_add_x.exit
  %i.0.i8 = phi i32 [ 0, %m_vec_mul_add_x.exit ], [ %inc.i19, %for.body.i10 ], !dbg !2881
    #dbg_value(i32 %i.0.i8, !2780, !DIExpression(), !2879)
  %exitcond197 = icmp ne i32 %i.0.i8, 7, !dbg !2882
  br i1 %exitcond197, label %for.body.i10, label %m_vec_mul_add_x_inv.exit20, !dbg !2883

for.body.i10:                                     ; preds = %for.cond.i7
  %arrayidx.i11 = getelementptr inbounds nuw i64, ptr %add.ptr8, i32 %i.0.i8, !dbg !2884
  %8 = load i64, ptr %arrayidx.i11, align 8, !dbg !2884
  %and.i12 = and i64 %8, 1229782938247303441, !dbg !2885
    #dbg_value(i64 %and.i12, !2791, !DIExpression(), !2886)
  %xor.i13 = lshr i64 %8, 1, !dbg !2887
  %shr.i14 = and i64 %xor.i13, 8608480567731124087, !dbg !2887
  %mul.i15 = mul nuw i64 %and.i12, 9, !dbg !2888
  %xor2.i16 = xor i64 %shr.i14, %mul.i15, !dbg !2889
  %arrayidx3.i17 = getelementptr inbounds nuw i64, ptr %add.ptr9, i32 %i.0.i8, !dbg !2890
  %9 = load i64, ptr %arrayidx3.i17, align 8, !dbg !2891
  %xor4.i18 = xor i64 %9, %xor2.i16, !dbg !2891
  store i64 %xor4.i18, ptr %arrayidx3.i17, align 8, !dbg !2891
  %inc.i19 = add nuw nsw i32 %i.0.i8, 1, !dbg !2892
    #dbg_value(i32 %inc.i19, !2780, !DIExpression(), !2879)
  br label %for.cond.i7, !dbg !2893, !llvm.loop !2894

m_vec_mul_add_x_inv.exit20:                       ; preds = %for.cond.i7
  %add.ptr10 = getelementptr inbounds nuw i8, ptr %bins, i32 336, !dbg !2896
  %add.ptr11 = getelementptr inbounds nuw i8, ptr %bins, i32 168, !dbg !2897
    #dbg_value(i32 %m_vec_limbs, !2804, !DIExpression(), !2898)
    #dbg_value(ptr %add.ptr10, !2808, !DIExpression(), !2898)
    #dbg_value(ptr %add.ptr11, !2809, !DIExpression(), !2898)
    #dbg_value(i64 -8608480567731124088, !2810, !DIExpression(), !2898)
    #dbg_value(i32 0, !2811, !DIExpression(), !2900)
  br label %for.cond.i149, !dbg !2901

for.cond.i149:                                    ; preds = %for.body.i152, %m_vec_mul_add_x_inv.exit20
  %i.0.i150 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit20 ], [ %inc.i162, %for.body.i152 ], !dbg !2902
    #dbg_value(i32 %i.0.i150, !2811, !DIExpression(), !2900)
  %exitcond198 = icmp ne i32 %i.0.i150, 7, !dbg !2903
  br i1 %exitcond198, label %for.body.i152, label %m_vec_mul_add_x.exit163, !dbg !2904

for.body.i152:                                    ; preds = %for.cond.i149
  %arrayidx.i153 = getelementptr inbounds nuw i64, ptr %add.ptr10, i32 %i.0.i150, !dbg !2905
  %10 = load i64, ptr %arrayidx.i153, align 8, !dbg !2905
    #dbg_value(i64 %10, !2821, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2906)
  %xor.i154 = shl i64 %10, 1, !dbg !2907
  %shl.i155 = and i64 %xor.i154, -1229782938247303442, !dbg !2907
  %and.i156 = lshr i64 %10, 3, !dbg !2908
  %shr.i157 = and i64 %and.i156, 1229782938247303441, !dbg !2908
  %mul.i158 = mul nuw nsw i64 %shr.i157, 3, !dbg !2909
  %xor2.i159 = xor i64 %shl.i155, %mul.i158, !dbg !2910
  %arrayidx3.i160 = getelementptr inbounds nuw i64, ptr %add.ptr11, i32 %i.0.i150, !dbg !2911
  %11 = load i64, ptr %arrayidx3.i160, align 8, !dbg !2912
  %xor4.i161 = xor i64 %11, %xor2.i159, !dbg !2912
  store i64 %xor4.i161, ptr %arrayidx3.i160, align 8, !dbg !2912
  %inc.i162 = add nuw nsw i32 %i.0.i150, 1, !dbg !2913
    #dbg_value(i32 %inc.i162, !2811, !DIExpression(), !2900)
  br label %for.cond.i149, !dbg !2914, !llvm.loop !2915

m_vec_mul_add_x.exit163:                          ; preds = %for.cond.i149
  %add.ptr12 = getelementptr inbounds nuw i8, ptr %bins, i32 784, !dbg !2917
  %add.ptr13 = getelementptr inbounds nuw i8, ptr %bins, i32 840, !dbg !2918
    #dbg_value(i32 %m_vec_limbs, !2773, !DIExpression(), !2919)
    #dbg_value(ptr %add.ptr12, !2777, !DIExpression(), !2919)
    #dbg_value(ptr %add.ptr13, !2778, !DIExpression(), !2919)
    #dbg_value(i64 1229782938247303441, !2779, !DIExpression(), !2919)
    #dbg_value(i32 0, !2780, !DIExpression(), !2921)
  br label %for.cond.i63, !dbg !2922

for.cond.i63:                                     ; preds = %for.body.i66, %m_vec_mul_add_x.exit163
  %i.0.i64 = phi i32 [ 0, %m_vec_mul_add_x.exit163 ], [ %inc.i75, %for.body.i66 ], !dbg !2923
    #dbg_value(i32 %i.0.i64, !2780, !DIExpression(), !2921)
  %exitcond199 = icmp ne i32 %i.0.i64, 7, !dbg !2924
  br i1 %exitcond199, label %for.body.i66, label %m_vec_mul_add_x_inv.exit76, !dbg !2925

for.body.i66:                                     ; preds = %for.cond.i63
  %arrayidx.i67 = getelementptr inbounds nuw i64, ptr %add.ptr12, i32 %i.0.i64, !dbg !2926
  %12 = load i64, ptr %arrayidx.i67, align 8, !dbg !2926
  %and.i68 = and i64 %12, 1229782938247303441, !dbg !2927
    #dbg_value(i64 %and.i68, !2791, !DIExpression(), !2928)
  %xor.i69 = lshr i64 %12, 1, !dbg !2929
  %shr.i70 = and i64 %xor.i69, 8608480567731124087, !dbg !2929
  %mul.i71 = mul nuw i64 %and.i68, 9, !dbg !2930
  %xor2.i72 = xor i64 %shr.i70, %mul.i71, !dbg !2931
  %arrayidx3.i73 = getelementptr inbounds nuw i64, ptr %add.ptr13, i32 %i.0.i64, !dbg !2932
  %13 = load i64, ptr %arrayidx3.i73, align 8, !dbg !2933
  %xor4.i74 = xor i64 %13, %xor2.i72, !dbg !2933
  store i64 %xor4.i74, ptr %arrayidx3.i73, align 8, !dbg !2933
  %inc.i75 = add nuw nsw i32 %i.0.i64, 1, !dbg !2934
    #dbg_value(i32 %inc.i75, !2780, !DIExpression(), !2921)
  br label %for.cond.i63, !dbg !2935, !llvm.loop !2936

m_vec_mul_add_x_inv.exit76:                       ; preds = %for.cond.i63
  %add.ptr14 = getelementptr inbounds nuw i8, ptr %bins, i32 168, !dbg !2938
  %add.ptr15 = getelementptr inbounds nuw i8, ptr %bins, i32 448, !dbg !2939
    #dbg_value(i32 %m_vec_limbs, !2804, !DIExpression(), !2940)
    #dbg_value(ptr %add.ptr14, !2808, !DIExpression(), !2940)
    #dbg_value(ptr %add.ptr15, !2809, !DIExpression(), !2940)
    #dbg_value(i64 -8608480567731124088, !2810, !DIExpression(), !2940)
    #dbg_value(i32 0, !2811, !DIExpression(), !2942)
  br label %for.cond.i119, !dbg !2943

for.cond.i119:                                    ; preds = %for.body.i122, %m_vec_mul_add_x_inv.exit76
  %i.0.i120 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit76 ], [ %inc.i132, %for.body.i122 ], !dbg !2944
    #dbg_value(i32 %i.0.i120, !2811, !DIExpression(), !2942)
  %exitcond200 = icmp ne i32 %i.0.i120, 7, !dbg !2945
  br i1 %exitcond200, label %for.body.i122, label %m_vec_mul_add_x.exit133, !dbg !2946

for.body.i122:                                    ; preds = %for.cond.i119
  %arrayidx.i123 = getelementptr inbounds nuw i64, ptr %add.ptr14, i32 %i.0.i120, !dbg !2947
  %14 = load i64, ptr %arrayidx.i123, align 8, !dbg !2947
    #dbg_value(i64 %14, !2821, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2948)
  %xor.i124 = shl i64 %14, 1, !dbg !2949
  %shl.i125 = and i64 %xor.i124, -1229782938247303442, !dbg !2949
  %and.i126 = lshr i64 %14, 3, !dbg !2950
  %shr.i127 = and i64 %and.i126, 1229782938247303441, !dbg !2950
  %mul.i128 = mul nuw nsw i64 %shr.i127, 3, !dbg !2951
  %xor2.i129 = xor i64 %shl.i125, %mul.i128, !dbg !2952
  %arrayidx3.i130 = getelementptr inbounds nuw i64, ptr %add.ptr15, i32 %i.0.i120, !dbg !2953
  %15 = load i64, ptr %arrayidx3.i130, align 8, !dbg !2954
  %xor4.i131 = xor i64 %15, %xor2.i129, !dbg !2954
  store i64 %xor4.i131, ptr %arrayidx3.i130, align 8, !dbg !2954
  %inc.i132 = add nuw nsw i32 %i.0.i120, 1, !dbg !2955
    #dbg_value(i32 %inc.i132, !2811, !DIExpression(), !2942)
  br label %for.cond.i119, !dbg !2956, !llvm.loop !2957

m_vec_mul_add_x.exit133:                          ; preds = %for.cond.i119
  %add.ptr16 = getelementptr inbounds nuw i8, ptr %bins, i32 840, !dbg !2959
  %add.ptr17 = getelementptr inbounds nuw i8, ptr %bins, i32 728, !dbg !2960
    #dbg_value(i32 %m_vec_limbs, !2773, !DIExpression(), !2961)
    #dbg_value(ptr %add.ptr16, !2777, !DIExpression(), !2961)
    #dbg_value(ptr %add.ptr17, !2778, !DIExpression(), !2961)
    #dbg_value(i64 1229782938247303441, !2779, !DIExpression(), !2961)
    #dbg_value(i32 0, !2780, !DIExpression(), !2963)
  br label %for.cond.i1, !dbg !2964

for.cond.i1:                                      ; preds = %for.body.i4, %m_vec_mul_add_x.exit133
  %i.0.i2 = phi i32 [ 0, %m_vec_mul_add_x.exit133 ], [ %inc.i6, %for.body.i4 ], !dbg !2965
    #dbg_value(i32 %i.0.i2, !2780, !DIExpression(), !2963)
  %exitcond201 = icmp ne i32 %i.0.i2, 7, !dbg !2966
  br i1 %exitcond201, label %for.body.i4, label %m_vec_mul_add_x_inv.exit, !dbg !2967

for.body.i4:                                      ; preds = %for.cond.i1
  %arrayidx.i5 = getelementptr inbounds nuw i64, ptr %add.ptr16, i32 %i.0.i2, !dbg !2968
  %16 = load i64, ptr %arrayidx.i5, align 8, !dbg !2968
  %and.i = and i64 %16, 1229782938247303441, !dbg !2969
    #dbg_value(i64 %and.i, !2791, !DIExpression(), !2970)
  %xor.i = lshr i64 %16, 1, !dbg !2971
  %shr.i = and i64 %xor.i, 8608480567731124087, !dbg !2971
  %mul.i = mul nuw i64 %and.i, 9, !dbg !2972
  %xor2.i = xor i64 %shr.i, %mul.i, !dbg !2973
  %arrayidx3.i = getelementptr inbounds nuw i64, ptr %add.ptr17, i32 %i.0.i2, !dbg !2974
  %17 = load i64, ptr %arrayidx3.i, align 8, !dbg !2975
  %xor4.i = xor i64 %17, %xor2.i, !dbg !2975
  store i64 %xor4.i, ptr %arrayidx3.i, align 8, !dbg !2975
  %inc.i6 = add nuw nsw i32 %i.0.i2, 1, !dbg !2976
    #dbg_value(i32 %inc.i6, !2780, !DIExpression(), !2963)
  br label %for.cond.i1, !dbg !2977, !llvm.loop !2978

m_vec_mul_add_x_inv.exit:                         ; preds = %for.cond.i1
  %add.ptr18 = getelementptr inbounds nuw i8, ptr %bins, i32 448, !dbg !2980
  %add.ptr19 = getelementptr inbounds nuw i8, ptr %bins, i32 224, !dbg !2981
    #dbg_value(i32 %m_vec_limbs, !2804, !DIExpression(), !2982)
    #dbg_value(ptr %add.ptr18, !2808, !DIExpression(), !2982)
    #dbg_value(ptr %add.ptr19, !2809, !DIExpression(), !2982)
    #dbg_value(i64 -8608480567731124088, !2810, !DIExpression(), !2982)
    #dbg_value(i32 0, !2811, !DIExpression(), !2984)
  br label %for.cond.i134, !dbg !2985

for.cond.i134:                                    ; preds = %for.body.i137, %m_vec_mul_add_x_inv.exit
  %i.0.i135 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit ], [ %inc.i147, %for.body.i137 ], !dbg !2986
    #dbg_value(i32 %i.0.i135, !2811, !DIExpression(), !2984)
  %exitcond202 = icmp ne i32 %i.0.i135, 7, !dbg !2987
  br i1 %exitcond202, label %for.body.i137, label %m_vec_mul_add_x.exit148, !dbg !2988

for.body.i137:                                    ; preds = %for.cond.i134
  %arrayidx.i138 = getelementptr inbounds nuw i64, ptr %add.ptr18, i32 %i.0.i135, !dbg !2989
  %18 = load i64, ptr %arrayidx.i138, align 8, !dbg !2989
    #dbg_value(i64 %18, !2821, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2990)
  %xor.i139 = shl i64 %18, 1, !dbg !2991
  %shl.i140 = and i64 %xor.i139, -1229782938247303442, !dbg !2991
  %and.i141 = lshr i64 %18, 3, !dbg !2992
  %shr.i142 = and i64 %and.i141, 1229782938247303441, !dbg !2992
  %mul.i143 = mul nuw nsw i64 %shr.i142, 3, !dbg !2993
  %xor2.i144 = xor i64 %shl.i140, %mul.i143, !dbg !2994
  %arrayidx3.i145 = getelementptr inbounds nuw i64, ptr %add.ptr19, i32 %i.0.i135, !dbg !2995
  %19 = load i64, ptr %arrayidx3.i145, align 8, !dbg !2996
  %xor4.i146 = xor i64 %19, %xor2.i144, !dbg !2996
  store i64 %xor4.i146, ptr %arrayidx3.i145, align 8, !dbg !2996
  %inc.i147 = add nuw nsw i32 %i.0.i135, 1, !dbg !2997
    #dbg_value(i32 %inc.i147, !2811, !DIExpression(), !2984)
  br label %for.cond.i134, !dbg !2998, !llvm.loop !2999

m_vec_mul_add_x.exit148:                          ; preds = %for.cond.i134
  %add.ptr20 = getelementptr inbounds nuw i8, ptr %bins, i32 728, !dbg !3001
  %add.ptr21 = getelementptr inbounds nuw i8, ptr %bins, i32 504, !dbg !3002
    #dbg_value(i32 %m_vec_limbs, !2773, !DIExpression(), !3003)
    #dbg_value(ptr %add.ptr20, !2777, !DIExpression(), !3003)
    #dbg_value(ptr %add.ptr21, !2778, !DIExpression(), !3003)
    #dbg_value(i64 1229782938247303441, !2779, !DIExpression(), !3003)
    #dbg_value(i32 0, !2780, !DIExpression(), !3005)
  br label %for.cond.i35, !dbg !3006

for.cond.i35:                                     ; preds = %for.body.i38, %m_vec_mul_add_x.exit148
  %i.0.i36 = phi i32 [ 0, %m_vec_mul_add_x.exit148 ], [ %inc.i47, %for.body.i38 ], !dbg !3007
    #dbg_value(i32 %i.0.i36, !2780, !DIExpression(), !3005)
  %exitcond203 = icmp ne i32 %i.0.i36, 7, !dbg !3008
  br i1 %exitcond203, label %for.body.i38, label %m_vec_mul_add_x_inv.exit48, !dbg !3009

for.body.i38:                                     ; preds = %for.cond.i35
  %arrayidx.i39 = getelementptr inbounds nuw i64, ptr %add.ptr20, i32 %i.0.i36, !dbg !3010
  %20 = load i64, ptr %arrayidx.i39, align 8, !dbg !3010
  %and.i40 = and i64 %20, 1229782938247303441, !dbg !3011
    #dbg_value(i64 %and.i40, !2791, !DIExpression(), !3012)
  %xor.i41 = lshr i64 %20, 1, !dbg !3013
  %shr.i42 = and i64 %xor.i41, 8608480567731124087, !dbg !3013
  %mul.i43 = mul nuw i64 %and.i40, 9, !dbg !3014
  %xor2.i44 = xor i64 %shr.i42, %mul.i43, !dbg !3015
  %arrayidx3.i45 = getelementptr inbounds nuw i64, ptr %add.ptr21, i32 %i.0.i36, !dbg !3016
  %21 = load i64, ptr %arrayidx3.i45, align 8, !dbg !3017
  %xor4.i46 = xor i64 %21, %xor2.i44, !dbg !3017
  store i64 %xor4.i46, ptr %arrayidx3.i45, align 8, !dbg !3017
  %inc.i47 = add nuw nsw i32 %i.0.i36, 1, !dbg !3018
    #dbg_value(i32 %inc.i47, !2780, !DIExpression(), !3005)
  br label %for.cond.i35, !dbg !3019, !llvm.loop !3020

m_vec_mul_add_x_inv.exit48:                       ; preds = %for.cond.i35
  %add.ptr22 = getelementptr inbounds nuw i8, ptr %bins, i32 224, !dbg !3022
  %add.ptr23 = getelementptr inbounds nuw i8, ptr %bins, i32 112, !dbg !3023
    #dbg_value(i32 %m_vec_limbs, !2804, !DIExpression(), !3024)
    #dbg_value(ptr %add.ptr22, !2808, !DIExpression(), !3024)
    #dbg_value(ptr %add.ptr23, !2809, !DIExpression(), !3024)
    #dbg_value(i64 -8608480567731124088, !2810, !DIExpression(), !3024)
    #dbg_value(i32 0, !2811, !DIExpression(), !3026)
  br label %for.cond.i179, !dbg !3027

for.cond.i179:                                    ; preds = %for.body.i182, %m_vec_mul_add_x_inv.exit48
  %i.0.i180 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit48 ], [ %inc.i192, %for.body.i182 ], !dbg !3028
    #dbg_value(i32 %i.0.i180, !2811, !DIExpression(), !3026)
  %exitcond204 = icmp ne i32 %i.0.i180, 7, !dbg !3029
  br i1 %exitcond204, label %for.body.i182, label %m_vec_mul_add_x.exit193, !dbg !3030

for.body.i182:                                    ; preds = %for.cond.i179
  %arrayidx.i183 = getelementptr inbounds nuw i64, ptr %add.ptr22, i32 %i.0.i180, !dbg !3031
  %22 = load i64, ptr %arrayidx.i183, align 8, !dbg !3031
    #dbg_value(i64 %22, !2821, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !3032)
  %xor.i184 = shl i64 %22, 1, !dbg !3033
  %shl.i185 = and i64 %xor.i184, -1229782938247303442, !dbg !3033
  %and.i186 = lshr i64 %22, 3, !dbg !3034
  %shr.i187 = and i64 %and.i186, 1229782938247303441, !dbg !3034
  %mul.i188 = mul nuw nsw i64 %shr.i187, 3, !dbg !3035
  %xor2.i189 = xor i64 %shl.i185, %mul.i188, !dbg !3036
  %arrayidx3.i190 = getelementptr inbounds nuw i64, ptr %add.ptr23, i32 %i.0.i180, !dbg !3037
  %23 = load i64, ptr %arrayidx3.i190, align 8, !dbg !3038
  %xor4.i191 = xor i64 %23, %xor2.i189, !dbg !3038
  store i64 %xor4.i191, ptr %arrayidx3.i190, align 8, !dbg !3038
  %inc.i192 = add nuw nsw i32 %i.0.i180, 1, !dbg !3039
    #dbg_value(i32 %inc.i192, !2811, !DIExpression(), !3026)
  br label %for.cond.i179, !dbg !3040, !llvm.loop !3041

m_vec_mul_add_x.exit193:                          ; preds = %for.cond.i179
  %add.ptr24 = getelementptr inbounds nuw i8, ptr %bins, i32 504, !dbg !3043
  %add.ptr25 = getelementptr inbounds nuw i8, ptr %bins, i32 56, !dbg !3044
    #dbg_value(i32 %m_vec_limbs, !2773, !DIExpression(), !3045)
    #dbg_value(ptr %add.ptr24, !2777, !DIExpression(), !3045)
    #dbg_value(ptr %add.ptr25, !2778, !DIExpression(), !3045)
    #dbg_value(i64 1229782938247303441, !2779, !DIExpression(), !3045)
    #dbg_value(i32 0, !2780, !DIExpression(), !3047)
  br label %for.cond.i21, !dbg !3048

for.cond.i21:                                     ; preds = %for.body.i24, %m_vec_mul_add_x.exit193
  %i.0.i22 = phi i32 [ 0, %m_vec_mul_add_x.exit193 ], [ %inc.i33, %for.body.i24 ], !dbg !3049
    #dbg_value(i32 %i.0.i22, !2780, !DIExpression(), !3047)
  %exitcond205 = icmp ne i32 %i.0.i22, 7, !dbg !3050
  br i1 %exitcond205, label %for.body.i24, label %m_vec_mul_add_x_inv.exit34, !dbg !3051

for.body.i24:                                     ; preds = %for.cond.i21
  %arrayidx.i25 = getelementptr inbounds nuw i64, ptr %add.ptr24, i32 %i.0.i22, !dbg !3052
  %24 = load i64, ptr %arrayidx.i25, align 8, !dbg !3052
  %and.i26 = and i64 %24, 1229782938247303441, !dbg !3053
    #dbg_value(i64 %and.i26, !2791, !DIExpression(), !3054)
  %xor.i27 = lshr i64 %24, 1, !dbg !3055
  %shr.i28 = and i64 %xor.i27, 8608480567731124087, !dbg !3055
  %mul.i29 = mul nuw i64 %and.i26, 9, !dbg !3056
  %xor2.i30 = xor i64 %shr.i28, %mul.i29, !dbg !3057
  %arrayidx3.i31 = getelementptr inbounds nuw i64, ptr %add.ptr25, i32 %i.0.i22, !dbg !3058
  %25 = load i64, ptr %arrayidx3.i31, align 8, !dbg !3059
  %xor4.i32 = xor i64 %25, %xor2.i30, !dbg !3059
  store i64 %xor4.i32, ptr %arrayidx3.i31, align 8, !dbg !3059
  %inc.i33 = add nuw nsw i32 %i.0.i22, 1, !dbg !3060
    #dbg_value(i32 %inc.i33, !2780, !DIExpression(), !3047)
  br label %for.cond.i21, !dbg !3061, !llvm.loop !3062

m_vec_mul_add_x_inv.exit34:                       ; preds = %for.cond.i21
  %add.ptr26 = getelementptr inbounds nuw i8, ptr %bins, i32 112, !dbg !3064
  %add.ptr27 = getelementptr inbounds nuw i8, ptr %bins, i32 56, !dbg !3065
    #dbg_value(i32 %m_vec_limbs, !2804, !DIExpression(), !3066)
    #dbg_value(ptr %add.ptr26, !2808, !DIExpression(), !3066)
    #dbg_value(ptr %add.ptr27, !2809, !DIExpression(), !3066)
    #dbg_value(i64 -8608480567731124088, !2810, !DIExpression(), !3066)
    #dbg_value(i32 0, !2811, !DIExpression(), !3068)
  br label %for.cond.i164, !dbg !3069

for.cond.i164:                                    ; preds = %for.body.i167, %m_vec_mul_add_x_inv.exit34
  %i.0.i165 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit34 ], [ %inc.i177, %for.body.i167 ], !dbg !3070
    #dbg_value(i32 %i.0.i165, !2811, !DIExpression(), !3068)
  %exitcond206 = icmp ne i32 %i.0.i165, 7, !dbg !3071
  br i1 %exitcond206, label %for.body.i167, label %m_vec_mul_add_x.exit178, !dbg !3072

for.body.i167:                                    ; preds = %for.cond.i164
  %arrayidx.i168 = getelementptr inbounds nuw i64, ptr %add.ptr26, i32 %i.0.i165, !dbg !3073
  %26 = load i64, ptr %arrayidx.i168, align 8, !dbg !3073
    #dbg_value(i64 %26, !2821, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !3074)
  %xor.i169 = shl i64 %26, 1, !dbg !3075
  %shl.i170 = and i64 %xor.i169, -1229782938247303442, !dbg !3075
  %and.i171 = lshr i64 %26, 3, !dbg !3076
  %shr.i172 = and i64 %and.i171, 1229782938247303441, !dbg !3076
  %mul.i173 = mul nuw nsw i64 %shr.i172, 3, !dbg !3077
  %xor2.i174 = xor i64 %shl.i170, %mul.i173, !dbg !3078
  %arrayidx3.i175 = getelementptr inbounds nuw i64, ptr %add.ptr27, i32 %i.0.i165, !dbg !3079
  %27 = load i64, ptr %arrayidx3.i175, align 8, !dbg !3080
  %xor4.i176 = xor i64 %27, %xor2.i174, !dbg !3080
  store i64 %xor4.i176, ptr %arrayidx3.i175, align 8, !dbg !3080
  %inc.i177 = add nuw nsw i32 %i.0.i165, 1, !dbg !3081
    #dbg_value(i32 %inc.i177, !2811, !DIExpression(), !3068)
  br label %for.cond.i164, !dbg !3082, !llvm.loop !3083

m_vec_mul_add_x.exit178:                          ; preds = %for.cond.i164
  %add.ptr28 = getelementptr inbounds nuw i8, ptr %bins, i32 56, !dbg !3085
    #dbg_value(i32 %m_vec_limbs, !3086, !DIExpression(), !3088)
    #dbg_value(ptr %add.ptr28, !3090, !DIExpression(), !3088)
    #dbg_value(ptr %out, !3091, !DIExpression(), !3088)
    #dbg_value(i32 0, !3092, !DIExpression(), !3094)
  br label %for.cond.i, !dbg !3095

for.cond.i:                                       ; preds = %for.body.i, %m_vec_mul_add_x.exit178
  %i.0.i = phi i32 [ 0, %m_vec_mul_add_x.exit178 ], [ %inc.i, %for.body.i ], !dbg !3096
    #dbg_value(i32 %i.0.i, !3092, !DIExpression(), !3094)
  %exitcond207 = icmp ne i32 %i.0.i, 7, !dbg !3097
  br i1 %exitcond207, label %for.body.i, label %m_vec_copy.exit, !dbg !3099

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %add.ptr28, i32 %i.0.i, !dbg !3100
  %28 = load i64, ptr %arrayidx.i, align 8, !dbg !3100
  %arrayidx1.i = getelementptr inbounds nuw i64, ptr %out, i32 %i.0.i, !dbg !3102
  store i64 %28, ptr %arrayidx1.i, align 8, !dbg !3103
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !3104
    #dbg_value(i32 %inc.i, !3092, !DIExpression(), !3094)
  br label %for.cond.i, !dbg !3105, !llvm.loop !3106

m_vec_copy.exit:                                  ; preds = %for.cond.i
  ret void, !dbg !3108
}

; Function Attrs: nounwind
define dso_local void @pqmayo_MAYO_3_ref_m_upper(ptr noundef %p, ptr noundef %in, ptr noundef %out, i32 noundef %size) local_unnamed_addr #0 !dbg !3109 {
entry:
    #dbg_value(ptr %p, !3140, !DIExpression(), !3141)
    #dbg_value(ptr %in, !3142, !DIExpression(), !3141)
    #dbg_value(ptr %out, !3143, !DIExpression(), !3141)
    #dbg_value(i32 %size, !3144, !DIExpression(), !3141)
    #dbg_value(i32 7, !3145, !DIExpression(), !3141)
    #dbg_value(i32 0, !3146, !DIExpression(), !3141)
    #dbg_value(i32 0, !3147, !DIExpression(), !3149)
  %smax = call i32 @llvm.smax.i32(i32 %size, i32 0), !dbg !3150
  br label %for.cond, !dbg !3150

for.cond:                                         ; preds = %for.inc15, %entry
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc15 ], [ %size, %entry ], !dbg !3151
  %m_vecs_stored.0 = phi i32 [ 0, %entry ], [ %m_vecs_stored.1.lcssa, %for.inc15 ], !dbg !3151
  %r.0 = phi i32 [ 0, %entry ], [ %inc16, %for.inc15 ], !dbg !3152
    #dbg_value(i32 %r.0, !3147, !DIExpression(), !3149)
    #dbg_value(i32 %m_vecs_stored.0, !3146, !DIExpression(), !3141)
  %exitcond10 = icmp ne i32 %r.0, %smax, !dbg !3153
  br i1 %exitcond10, label %for.cond1.preheader, label %for.end17, !dbg !3155

for.cond1.preheader:                              ; preds = %for.cond
  %0 = add i32 %m_vecs_stored.0, %indvars.iv, !dbg !3156
  br label %for.cond1, !dbg !3156

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc
  %m_vecs_stored.1 = phi i32 [ %inc, %for.inc ], [ %m_vecs_stored.0, %for.cond1.preheader ], !dbg !3141
  %c.0 = phi i32 [ %inc14, %for.inc ], [ %r.0, %for.cond1.preheader ], !dbg !3159
    #dbg_value(i32 %c.0, !3160, !DIExpression(), !3161)
    #dbg_value(i32 %m_vecs_stored.1, !3146, !DIExpression(), !3141)
  %exitcond9 = icmp ne i32 %m_vecs_stored.1, %0, !dbg !3162
  br i1 %exitcond9, label %for.body3, label %for.inc15, !dbg !3156

for.body3:                                        ; preds = %for.cond1
  %mul = mul nsw i32 %r.0, %size, !dbg !3164
  %add = add nsw i32 %mul, %c.0, !dbg !3166
  %add.ptr.idx = mul nsw i32 %add, 56, !dbg !3167
  %add.ptr = getelementptr inbounds i8, ptr %in, i32 %add.ptr.idx, !dbg !3167
  %add.ptr6.idx = mul nsw i32 %m_vecs_stored.1, 56, !dbg !3168
  %add.ptr6 = getelementptr inbounds i8, ptr %out, i32 %add.ptr6.idx, !dbg !3168
    #dbg_value(i32 7, !3169, !DIExpression(), !3171)
    #dbg_value(ptr %add.ptr, !3173, !DIExpression(), !3171)
    #dbg_value(ptr %add.ptr6, !3174, !DIExpression(), !3171)
    #dbg_value(i32 0, !3175, !DIExpression(), !3177)
  br label %for.cond.i, !dbg !3178

for.cond.i:                                       ; preds = %for.body.i, %for.body3
  %i.0.i = phi i32 [ 0, %for.body3 ], [ %inc.i, %for.body.i ], !dbg !3179
    #dbg_value(i32 %i.0.i, !3175, !DIExpression(), !3177)
  %exitcond = icmp ne i32 %i.0.i, 7, !dbg !3180
  br i1 %exitcond, label %for.body.i, label %m_vec_copy.17.exit, !dbg !3182

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %add.ptr, i32 %i.0.i, !dbg !3183
  %1 = load i64, ptr %arrayidx.i, align 8, !dbg !3183
  %arrayidx1.i = getelementptr inbounds nuw i64, ptr %add.ptr6, i32 %i.0.i, !dbg !3185
  store i64 %1, ptr %arrayidx1.i, align 8, !dbg !3186
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !3187
    #dbg_value(i32 %inc.i, !3175, !DIExpression(), !3177)
  br label %for.cond.i, !dbg !3188, !llvm.loop !3189

m_vec_copy.17.exit:                               ; preds = %for.cond.i
  %cmp7.not = icmp eq i32 %r.0, %c.0, !dbg !3191
  br i1 %cmp7.not, label %for.inc, label %if.then, !dbg !3191

if.then:                                          ; preds = %m_vec_copy.17.exit
  %mul8 = mul nsw i32 %c.0, %size, !dbg !3193
  %add9 = add nsw i32 %mul8, %r.0, !dbg !3195
  %add.ptr11.idx = mul nsw i32 %add9, 56, !dbg !3196
  %add.ptr11 = getelementptr inbounds i8, ptr %in, i32 %add.ptr11.idx, !dbg !3196
  %add.ptr13.idx = mul nsw i32 %m_vecs_stored.1, 56, !dbg !3197
  %add.ptr13 = getelementptr inbounds i8, ptr %out, i32 %add.ptr13.idx, !dbg !3197
    #dbg_value(i32 7, !3198, !DIExpression(), !3200)
    #dbg_value(ptr %add.ptr11, !3202, !DIExpression(), !3200)
    #dbg_value(ptr %add.ptr13, !3203, !DIExpression(), !3200)
    #dbg_value(i32 0, !3204, !DIExpression(), !3206)
  br label %for.cond.i1, !dbg !3207

for.cond.i1:                                      ; preds = %for.body.i4, %if.then
  %i.0.i2 = phi i32 [ 0, %if.then ], [ %inc.i7, %for.body.i4 ], !dbg !3208
    #dbg_value(i32 %i.0.i2, !3204, !DIExpression(), !3206)
  %exitcond8 = icmp ne i32 %i.0.i2, 7, !dbg !3209
  br i1 %exitcond8, label %for.body.i4, label %for.inc.loopexit, !dbg !3211

for.body.i4:                                      ; preds = %for.cond.i1
  %arrayidx.i5 = getelementptr inbounds nuw i64, ptr %add.ptr11, i32 %i.0.i2, !dbg !3212
  %2 = load i64, ptr %arrayidx.i5, align 8, !dbg !3212
  %arrayidx1.i6 = getelementptr inbounds nuw i64, ptr %add.ptr13, i32 %i.0.i2, !dbg !3214
  %3 = load i64, ptr %arrayidx1.i6, align 8, !dbg !3215
  %xor.i = xor i64 %3, %2, !dbg !3215
  store i64 %xor.i, ptr %arrayidx1.i6, align 8, !dbg !3215
  %inc.i7 = add nuw nsw i32 %i.0.i2, 1, !dbg !3216
    #dbg_value(i32 %inc.i7, !3204, !DIExpression(), !3206)
  br label %for.cond.i1, !dbg !3217, !llvm.loop !3218

for.inc.loopexit:                                 ; preds = %for.cond.i1
  br label %for.inc, !dbg !3220

for.inc:                                          ; preds = %for.inc.loopexit, %m_vec_copy.17.exit
    #dbg_value(i32 %m_vecs_stored.1, !3146, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !3141)
  %inc = add i32 %m_vecs_stored.1, 1, !dbg !3220
    #dbg_value(i32 %inc, !3146, !DIExpression(), !3141)
  %inc14 = add nuw nsw i32 %c.0, 1, !dbg !3221
    #dbg_value(i32 %inc14, !3160, !DIExpression(), !3161)
  br label %for.cond1, !dbg !3222, !llvm.loop !3223

for.inc15:                                        ; preds = %for.cond1
  %m_vecs_stored.1.lcssa = phi i32 [ %m_vecs_stored.1, %for.cond1 ], !dbg !3141
  %inc16 = add nuw i32 %r.0, 1, !dbg !3225
    #dbg_value(i32 %inc16, !3147, !DIExpression(), !3149)
  %indvars.iv.next = add i32 %indvars.iv, -1, !dbg !3226
  br label %for.cond, !dbg !3226, !llvm.loop !3227

for.end17:                                        ; preds = %for.cond
  ret void, !dbg !3229
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_3_ref_sample_solution(ptr noundef %p, ptr noundef %A, ptr noundef %y, ptr noundef %r, ptr noundef %x, i32 noundef %k, i32 noundef %o, i32 noundef %m, i32 noundef %A_cols) local_unnamed_addr #0 !dbg !3230 {
entry:
  %_pivot_row.i = alloca [7 x i64], align 32
  %_pivot_row2.i = alloca [7 x i64], align 32
  %packed_A.i = alloca [756 x i64], align 32
  %temp.i = alloca [126 x i8], align 1
  %Ar = alloca [108 x i8], align 1
    #dbg_value(ptr %p, !3233, !DIExpression(), !3234)
    #dbg_value(ptr %A, !3235, !DIExpression(), !3234)
    #dbg_value(ptr %y, !3236, !DIExpression(), !3234)
    #dbg_value(ptr %r, !3237, !DIExpression(), !3234)
    #dbg_value(ptr %x, !3238, !DIExpression(), !3234)
    #dbg_value(i32 %k, !3239, !DIExpression(), !3234)
    #dbg_value(i32 %o, !3240, !DIExpression(), !3234)
    #dbg_value(i32 %m, !3241, !DIExpression(), !3234)
    #dbg_value(i32 %A_cols, !3242, !DIExpression(), !3234)
    #dbg_value(i32 0, !3243, !DIExpression(), !3245)
  %0 = mul nsw i32 %o, %k, !dbg !3246
  %smax = call i32 @llvm.smax.i32(i32 %0, i32 0), !dbg !3246
  br label %for.cond, !dbg !3246

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !3247
    #dbg_value(i32 %i.0, !3243, !DIExpression(), !3245)
  %exitcond = icmp ne i32 %i.0, %smax, !dbg !3248
  br i1 %exitcond, label %for.body, label %for.cond3.preheader, !dbg !3250

for.cond3.preheader:                              ; preds = %for.cond
  %smax37 = call i32 @llvm.smax.i32(i32 %m, i32 0), !dbg !3251
  br label %for.cond3, !dbg !3251

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !3253
  %1 = load i8, ptr %arrayidx, align 1, !dbg !3253
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !3255
  store i8 %1, ptr %arrayidx1, align 1, !dbg !3256
  %inc = add nuw i32 %i.0, 1, !dbg !3257
    #dbg_value(i32 %inc, !3243, !DIExpression(), !3245)
  br label %for.cond, !dbg !3258, !llvm.loop !3259

for.cond3:                                        ; preds = %for.cond3.preheader, %for.body5
  %i2.0 = phi i32 [ %inc12, %for.body5 ], [ 0, %for.cond3.preheader ], !dbg !3261
    #dbg_value(i32 %i2.0, !3262, !DIExpression(), !3263)
  %exitcond38 = icmp ne i32 %i2.0, %smax37, !dbg !3264
  br i1 %exitcond38, label %for.body5, label %for.end13, !dbg !3251

for.body5:                                        ; preds = %for.cond3
  %mul6 = mul nsw i32 %k, %o, !dbg !3266
  %mul7 = mul nsw i32 %k, %o, !dbg !3268
  %add = add nsw i32 %mul7, 1, !dbg !3269
  %mul8 = mul nsw i32 %i2.0, %add, !dbg !3270
  %2 = getelementptr i8, ptr %A, i32 %mul6, !dbg !3271
  %arrayidx10 = getelementptr i8, ptr %2, i32 %mul8, !dbg !3271
  store i8 0, ptr %arrayidx10, align 1, !dbg !3272
  %inc12 = add nuw i32 %i2.0, 1, !dbg !3273
    #dbg_value(i32 %inc12, !3262, !DIExpression(), !3263)
  br label %for.cond3, !dbg !3274, !llvm.loop !3275

for.end13:                                        ; preds = %for.cond3
  %mul14 = mul nsw i32 %k, %o, !dbg !3277
    #dbg_value(ptr %A, !3278, !DIExpression(), !3280)
    #dbg_value(ptr %r, !3282, !DIExpression(), !3280)
    #dbg_value(ptr %Ar, !3283, !DIExpression(), !3280)
    #dbg_value(i32 %mul14, !3284, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !3280)
    #dbg_value(i32 %m, !3285, !DIExpression(), !3280)
    #dbg_value(i32 1, !3286, !DIExpression(), !3280)
    #dbg_value(i32 0, !3287, !DIExpression(), !3289)
  %smax39 = call i32 @llvm.smax.i32(i32 %0, i32 -1), !dbg !3290
  %3 = add i32 %smax39, 1, !dbg !3290
  br label %for.cond.i, !dbg !3290

for.cond.i:                                       ; preds = %for.inc4.i, %for.end13
  %i.0.i = phi i32 [ 0, %for.end13 ], [ %inc5.i, %for.inc4.i ], !dbg !3291
  %c.addr.0.i = phi ptr [ %Ar, %for.end13 ], [ %c.addr.1.i.lcssa, %for.inc4.i ]
  %a.addr.0.i = phi ptr [ %A, %for.end13 ], [ %add.ptr6.i, %for.inc4.i ]
    #dbg_value(ptr %a.addr.0.i, !3278, !DIExpression(), !3280)
    #dbg_value(ptr %c.addr.0.i, !3283, !DIExpression(), !3280)
    #dbg_value(i32 %i.0.i, !3287, !DIExpression(), !3289)
  %exitcond41 = icmp ne i32 %i.0.i, %smax37, !dbg !3292
  br i1 %exitcond41, label %for.cond1.i.preheader, label %for.cond17.preheader, !dbg !3294

for.cond1.i.preheader:                            ; preds = %for.cond.i
  br label %for.cond1.i, !dbg !3295

for.cond17.preheader:                             ; preds = %for.cond.i
  br label %for.cond17, !dbg !3298

for.cond1.i:                                      ; preds = %for.cond1.i.preheader, %lincomb.24.exit.i
  %c.addr.1.i = phi ptr [ %incdec.ptr.i, %lincomb.24.exit.i ], [ %c.addr.0.i, %for.cond1.i.preheader ]
  %j.0.i = phi i32 [ 1, %lincomb.24.exit.i ], [ 0, %for.cond1.i.preheader ], !dbg !3300
    #dbg_value(i32 poison, !3301, !DIExpression(), !3302)
    #dbg_value(ptr %c.addr.1.i, !3283, !DIExpression(), !3280)
  %cmp2.i = icmp eq i32 %j.0.i, 0, !dbg !3303
  br i1 %cmp2.i, label %for.body3.i, label %for.inc4.i, !dbg !3295

for.body3.i:                                      ; preds = %for.cond1.i
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %r, i32 %j.0.i, !dbg !3305
    #dbg_value(ptr %a.addr.0.i, !3307, !DIExpression(), !3309)
    #dbg_value(ptr %add.ptr.i, !3311, !DIExpression(), !3309)
    #dbg_value(i32 %mul14, !3312, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !3309)
    #dbg_value(i32 1, !3313, !DIExpression(), !3309)
    #dbg_value(i8 0, !3314, !DIExpression(), !3309)
    #dbg_value(i32 0, !3315, !DIExpression(), !3317)
  br label %for.cond.i.i, !dbg !3318

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body3.i
  %ret.0.i.i = phi i8 [ 0, %for.body3.i ], [ %xor1.i.i.i, %for.body.i.i ], !dbg !3309
  %b.addr.0.i.i = phi ptr [ %add.ptr.i, %for.body3.i ], [ %add.ptr.i.i, %for.body.i.i ]
  %i.0.i.i = phi i32 [ 0, %for.body3.i ], [ %inc.i.i, %for.body.i.i ], !dbg !3319
    #dbg_value(i32 %i.0.i.i, !3315, !DIExpression(), !3317)
    #dbg_value(ptr %b.addr.0.i.i, !3311, !DIExpression(), !3309)
    #dbg_value(i8 %ret.0.i.i, !3314, !DIExpression(), !3309)
  %exitcond40 = icmp eq i32 %i.0.i.i, %3, !dbg !3320
  br i1 %exitcond40, label %lincomb.24.exit.i, label %for.body.i.i, !dbg !3322

for.body.i.i:                                     ; preds = %for.cond.i.i
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %a.addr.0.i, i32 %i.0.i.i, !dbg !3323
  %4 = load i8, ptr %arrayidx.i.i, align 1, !dbg !3323
  %5 = load i8, ptr %b.addr.0.i.i, align 1, !dbg !3325
    #dbg_value(i8 %4, !3326, !DIExpression(), !3328)
    #dbg_value(i8 %5, !3330, !DIExpression(), !3328)
  %6 = load volatile i8, ptr @pqmayo_MAYO_3_ref_unsigned_char_blocker, align 1, !dbg !3331
  %xor1.i.i = xor i8 %4, %6, !dbg !3332
    #dbg_value(i8 %xor1.i.i, !3326, !DIExpression(), !3328)
  %7 = trunc i8 %xor1.i.i to i1, !dbg !3333
    #dbg_value(i8 poison, !3334, !DIExpression(), !3328)
  %8 = and i8 %xor1.i.i, 2, !dbg !3335
  %mul9.i.i = mul i8 %8, %5, !dbg !3336
  %conv10.i.i = select i1 %7, i8 %5, i8 0, !dbg !3333
  %xor11.i.i = xor i8 %conv10.i.i, %mul9.i.i, !dbg !3337
    #dbg_value(i8 %xor11.i.i, !3334, !DIExpression(), !3328)
  %9 = and i8 %xor1.i.i, 4, !dbg !3338
  %mul16.i.i = mul i8 %9, %5, !dbg !3339
  %xor18.i.i = xor i8 %mul16.i.i, %xor11.i.i, !dbg !3340
    #dbg_value(i8 %xor18.i.i, !3334, !DIExpression(), !3328)
  %10 = and i8 %xor1.i.i, 8, !dbg !3341
  %mul23.i.i = mul i8 %10, %5, !dbg !3342
  %xor25.i.i = xor i8 %mul23.i.i, %xor18.i.i, !dbg !3343
    #dbg_value(i8 %xor25.i.i, !3334, !DIExpression(), !3328)
    #dbg_value(i8 %xor25.i.i, !3344, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !3328)
  %11 = lshr i8 %xor25.i.i, 4, !dbg !3345
  %12 = lshr i8 %xor25.i.i, 3, !dbg !3346
  %13 = and i8 %12, 14, !dbg !3346
  %14 = xor i8 %11, %13, !dbg !3347
  %xor25.masked.i.i = and i8 %xor25.i.i, 15, !dbg !3348
  %15 = xor i8 %14, %xor25.masked.i.i, !dbg !3348
    #dbg_value(i8 %15, !3349, !DIExpression(), !3328)
    #dbg_value(i8 %15, !3350, !DIExpression(), !3352)
    #dbg_value(i8 %ret.0.i.i, !3354, !DIExpression(), !3352)
  %xor1.i.i.i = xor i8 %15, %ret.0.i.i, !dbg !3355
    #dbg_value(i8 %xor1.i.i.i, !3314, !DIExpression(), !3309)
  %inc.i.i = add nuw i32 %i.0.i.i, 1, !dbg !3356
    #dbg_value(i32 %inc.i.i, !3315, !DIExpression(), !3317)
  %add.ptr.i.i = getelementptr inbounds nuw i8, ptr %b.addr.0.i.i, i32 1, !dbg !3357
    #dbg_value(ptr %add.ptr.i.i, !3311, !DIExpression(), !3309)
  br label %for.cond.i.i, !dbg !3358, !llvm.loop !3359

lincomb.24.exit.i:                                ; preds = %for.cond.i.i
  %ret.0.i.i.lcssa = phi i8 [ %ret.0.i.i, %for.cond.i.i ], !dbg !3309
  store i8 %ret.0.i.i.lcssa, ptr %c.addr.1.i, align 1, !dbg !3361
    #dbg_value(i32 1, !3301, !DIExpression(), !3302)
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %c.addr.1.i, i32 1, !dbg !3362
    #dbg_value(ptr %incdec.ptr.i, !3283, !DIExpression(), !3280)
  br label %for.cond1.i, !dbg !3363, !llvm.loop !3364

for.inc4.i:                                       ; preds = %for.cond1.i
  %c.addr.1.i.lcssa = phi ptr [ %c.addr.1.i, %for.cond1.i ]
  %inc5.i = add nuw i32 %i.0.i, 1, !dbg !3366
    #dbg_value(i32 %inc5.i, !3287, !DIExpression(), !3289)
  %16 = getelementptr i8, ptr %a.addr.0.i, i32 %mul14, !dbg !3367
  %add.ptr6.i = getelementptr i8, ptr %16, i32 1, !dbg !3367
    #dbg_value(ptr %add.ptr6.i, !3278, !DIExpression(), !3280)
  br label %for.cond.i, !dbg !3368, !llvm.loop !3369

for.cond17:                                       ; preds = %for.cond17.preheader, %for.body19
  %i16.0 = phi i32 [ %inc29, %for.body19 ], [ 0, %for.cond17.preheader ], !dbg !3371
    #dbg_value(i32 %i16.0, !3372, !DIExpression(), !3373)
  %exitcond42 = icmp ne i32 %i16.0, %smax37, !dbg !3374
  br i1 %exitcond42, label %for.body19, label %for.end30, !dbg !3298

for.body19:                                       ; preds = %for.cond17
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %y, i32 %i16.0, !dbg !3376
  %17 = load i8, ptr %arrayidx20, align 1, !dbg !3376
  %arrayidx21 = getelementptr inbounds nuw [108 x i8], ptr %Ar, i32 0, i32 %i16.0, !dbg !3378
  %18 = load i8, ptr %arrayidx21, align 1, !dbg !3378
    #dbg_value(i8 %17, !3379, !DIExpression(), !3381)
    #dbg_value(i8 %18, !3383, !DIExpression(), !3381)
  %xor1.i = xor i8 %17, %18, !dbg !3384
  %mul22 = mul nsw i32 %k, %o, !dbg !3385
  %mul23 = mul nsw i32 %k, %o, !dbg !3386
  %add24 = add nsw i32 %mul23, 1, !dbg !3387
  %mul25 = mul nsw i32 %i16.0, %add24, !dbg !3388
  %19 = getelementptr i8, ptr %A, i32 %mul22, !dbg !3389
  %arrayidx27 = getelementptr i8, ptr %19, i32 %mul25, !dbg !3389
  store i8 %xor1.i, ptr %arrayidx27, align 1, !dbg !3390
  %inc29 = add nuw i32 %i16.0, 1, !dbg !3391
    #dbg_value(i32 %inc29, !3372, !DIExpression(), !3373)
  br label %for.cond17, !dbg !3392, !llvm.loop !3393

for.end30:                                        ; preds = %for.cond17
  %mul31 = mul nsw i32 %k, %o, !dbg !3395
  %add32 = add nsw i32 %mul31, 1, !dbg !3396
  call void @llvm.lifetime.start.p0(i64 56, ptr nonnull %_pivot_row.i), !dbg !3397
  call void @llvm.lifetime.start.p0(i64 56, ptr nonnull %_pivot_row2.i), !dbg !3397
  call void @llvm.lifetime.start.p0(i64 6048, ptr nonnull %packed_A.i), !dbg !3397
  call void @llvm.lifetime.start.p0(i64 126, ptr nonnull %temp.i), !dbg !3397
    #dbg_value(ptr %A, !3403, !DIExpression(), !3404)
    #dbg_value(i32 %m, !3405, !DIExpression(), !3404)
    #dbg_value(i32 %add32, !3406, !DIExpression(), !3404)
    #dbg_declare(ptr %_pivot_row.i, !3407, !DIExpression(), !3408)
    #dbg_declare(ptr %_pivot_row2.i, !3409, !DIExpression(), !3410)
    #dbg_declare(ptr %packed_A.i, !3411, !DIExpression(), !3397)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 32 dereferenceable(6048) %packed_A.i, i8 0, i32 6048, i1 false), !dbg !3397
  %add.i = add nsw i32 %mul31, 16, !dbg !3415
  %div.i = sdiv i32 %add.i, 16, !dbg !3416
    #dbg_value(i32 %div.i, !3417, !DIExpression(), !3404)
    #dbg_value(i32 0, !3418, !DIExpression(), !3420)
  br label %for.cond.i13, !dbg !3421

for.cond.i13:                                     ; preds = %ef_pack_m_vec.exit.i, %for.end30
  %i.0.i14 = phi i32 [ 0, %for.end30 ], [ %inc.i34, %ef_pack_m_vec.exit.i ], !dbg !3422
    #dbg_value(i32 %i.0.i14, !3418, !DIExpression(), !3420)
  %exitcond43 = icmp ne i32 %i.0.i14, %smax37, !dbg !3423
  br i1 %exitcond43, label %for.body.i, label %for.cond3.i.preheader, !dbg !3425

for.cond3.i.preheader:                            ; preds = %for.cond.i13
  %smax44 = call i32 @llvm.smax.i32(i32 %div.i, i32 0), !dbg !3426
  %smax50 = call i32 @llvm.smax.i32(i32 %0, i32 -1), !dbg !3426
  %20 = add i32 %smax50, 1, !dbg !3426
  br label %for.cond3.i, !dbg !3426

for.body.i:                                       ; preds = %for.cond.i13
  %mul.i32 = mul nsw i32 %i.0.i14, %add32, !dbg !3428
  %add.ptr.i33 = getelementptr inbounds i8, ptr %A, i32 %mul.i32, !dbg !3430
  %mul1.i = mul nsw i32 %i.0.i14, %div.i, !dbg !3431
  %add.ptr2.i = getelementptr inbounds i64, ptr %packed_A.i, i32 %mul1.i, !dbg !3432
    #dbg_value(ptr %add.ptr.i33, !3433, !DIExpression(), !3437)
    #dbg_value(ptr %add.ptr2.i, !3439, !DIExpression(), !3437)
    #dbg_value(i32 %add32, !3440, !DIExpression(), !3437)
    #dbg_value(ptr %add.ptr2.i, !3441, !DIExpression(), !3437)
    #dbg_value(i32 0, !3442, !DIExpression(), !3437)
  br label %for.cond.i57.i, !dbg !3443

for.cond.i57.i:                                   ; preds = %for.body.i61.i, %for.body.i
  %i.0.i58.i = phi i32 [ 0, %for.body.i ], [ %add8.i65.i, %for.body.i61.i ], !dbg !3445
    #dbg_value(i32 %i.0.i58.i, !3442, !DIExpression(), !3437)
  %cmp.i60.i = icmp slt i32 %i.0.i58.i, %mul31, !dbg !3446
  br i1 %cmp.i60.i, label %for.body.i61.i, label %for.end.i.i, !dbg !3448

for.body.i61.i:                                   ; preds = %for.cond.i57.i
  %arrayidx.i62.i = getelementptr inbounds nuw i8, ptr %add.ptr.i33, i32 %i.0.i58.i, !dbg !3449
  %21 = load i8, ptr %arrayidx.i62.i, align 1, !dbg !3449
  %add2.i.i = or disjoint i32 %i.0.i58.i, 1, !dbg !3451
  %arrayidx3.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i33, i32 %add2.i.i, !dbg !3452
  %22 = load i8, ptr %arrayidx3.i.i, align 1, !dbg !3452
  %shl5.i.i = shl i8 %22, 4, !dbg !3453
  %or.i.i = or i8 %shl5.i.i, %21, !dbg !3454
  %div.i63.i = lshr exact i32 %i.0.i58.i, 1, !dbg !3455
  %arrayidx7.i64.i = getelementptr inbounds nuw i8, ptr %add.ptr2.i, i32 %div.i63.i, !dbg !3456
  store i8 %or.i.i, ptr %arrayidx7.i64.i, align 1, !dbg !3457
  %add8.i65.i = add nuw nsw i32 %i.0.i58.i, 2, !dbg !3458
    #dbg_value(i32 %add8.i65.i, !3442, !DIExpression(), !3437)
  br label %for.cond.i57.i, !dbg !3459, !llvm.loop !3460

for.end.i.i:                                      ; preds = %for.cond.i57.i
  %i.0.i58.i.lcssa = phi i32 [ %i.0.i58.i, %for.cond.i57.i ], !dbg !3445
  %23 = and i32 %add32, -2147483647, !dbg !3462
  %cmp9.i.i = icmp eq i32 %23, 1, !dbg !3462
  br i1 %cmp9.i.i, label %if.then.i.i, label %ef_pack_m_vec.exit.i, !dbg !3462

if.then.i.i:                                      ; preds = %for.end.i.i
  %arrayidx12.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i33, i32 %i.0.i58.i.lcssa, !dbg !3464
  %24 = load i8, ptr %arrayidx12.i.i, align 1, !dbg !3464
  %div16.i.i = lshr exact i32 %i.0.i58.i.lcssa, 1, !dbg !3466
  %arrayidx17.i.i = getelementptr inbounds nuw i8, ptr %add.ptr2.i, i32 %div16.i.i, !dbg !3467
  store i8 %24, ptr %arrayidx17.i.i, align 1, !dbg !3468
  br label %ef_pack_m_vec.exit.i, !dbg !3469

ef_pack_m_vec.exit.i:                             ; preds = %if.then.i.i, %for.end.i.i
  %inc.i34 = add nuw i32 %i.0.i14, 1, !dbg !3470
    #dbg_value(i32 %inc.i34, !3418, !DIExpression(), !3420)
  br label %for.cond.i13, !dbg !3471, !llvm.loop !3472

for.cond3.i:                                      ; preds = %for.cond3.i.preheader, %for.inc117.i
  %pivot_col.0.i = phi i32 [ %inc118.i, %for.inc117.i ], [ 0, %for.cond3.i.preheader ], !dbg !3474
  %pivot_row.0.i = phi i32 [ %conv116.i, %for.inc117.i ], [ 0, %for.cond3.i.preheader ], !dbg !3404
    #dbg_value(i32 %pivot_row.0.i, !3475, !DIExpression(), !3404)
    #dbg_value(i32 %pivot_col.0.i, !3476, !DIExpression(), !3477)
  %exitcond51 = icmp eq i32 %pivot_col.0.i, %20, !dbg !3478
  br i1 %exitcond51, label %for.cond121.i.preheader, label %for.body5.i, !dbg !3426

for.cond121.i.preheader:                          ; preds = %for.cond3.i
  br label %for.cond121.i, !dbg !3480

for.body5.i:                                      ; preds = %for.cond3.i
  %add6.i = add nsw i32 %pivot_col.0.i, %m, !dbg !3482
  %cmp7.i.not = icmp sgt i32 %add6.i, %mul31, !dbg !3482
  %add8.i = add nsw i32 %pivot_col.0.i, %m, !dbg !3482
  %sub9.i = sub nsw i32 %add8.i, %add32, !dbg !3482
  %cond.i = select i1 %cmp7.i.not, i32 %sub9.i, i32 0, !dbg !3482
    #dbg_value(i32 %cond.i, !3484, !DIExpression(), !3485)
  %sub13.i = add nsw i32 %m, -1, !dbg !3486
    #dbg_value(i32 %cond16.i, !3487, !DIExpression(), !3485)
    #dbg_value(i32 0, !3488, !DIExpression(), !3490)
  br label %for.cond18.i, !dbg !3491

for.cond18.i:                                     ; preds = %for.body20.i, %for.body5.i
  %i17.0.i = phi i32 [ 0, %for.body5.i ], [ %inc23.i, %for.body20.i ], !dbg !3492
    #dbg_value(i32 %i17.0.i, !3488, !DIExpression(), !3490)
  %exitcond45 = icmp ne i32 %i17.0.i, %smax44, !dbg !3493
  br i1 %exitcond45, label %for.body20.i, label %for.cond25.i.preheader, !dbg !3495

for.cond25.i.preheader:                           ; preds = %for.cond18.i
  %cmp11.not.i = icmp sgt i32 %m, %pivot_col.0.i, !dbg !3486
  %cond16.i = select i1 %cmp11.not.i, i32 %pivot_col.0.i, i32 %sub13.i, !dbg !3486
  br label %for.cond25.i, !dbg !3496

for.body20.i:                                     ; preds = %for.cond18.i
  %arrayidx.i = getelementptr inbounds nuw [7 x i64], ptr %_pivot_row.i, i32 0, i32 %i17.0.i, !dbg !3498
  store i64 0, ptr %arrayidx.i, align 8, !dbg !3500
  %arrayidx21.i = getelementptr inbounds nuw [7 x i64], ptr %_pivot_row2.i, i32 0, i32 %i17.0.i, !dbg !3501
  store i64 0, ptr %arrayidx21.i, align 8, !dbg !3502
  %inc23.i = add nuw nsw i32 %i17.0.i, 1, !dbg !3503
    #dbg_value(i32 %inc23.i, !3488, !DIExpression(), !3490)
  br label %for.cond18.i, !dbg !3504, !llvm.loop !3505

for.cond25.i:                                     ; preds = %for.cond25.i.preheader, %for.end48.i
  %pivot_is_zero.0.i = phi i64 [ %not52.i, %for.end48.i ], [ -1, %for.cond25.i.preheader ], !dbg !3485
  %pivot.0.i = phi i8 [ %conv.i16.i, %for.end48.i ], [ 0, %for.cond25.i.preheader ], !dbg !3485
  %row.0.i = phi i32 [ %inc54.i, %for.end48.i ], [ %cond.i, %for.cond25.i.preheader ], !dbg !3507
    #dbg_value(i32 %row.0.i, !3508, !DIExpression(), !3507)
    #dbg_value(i8 %pivot.0.i, !3509, !DIExpression(), !3485)
    #dbg_value(i64 %pivot_is_zero.0.i, !3510, !DIExpression(), !3485)
  %add27.i = add nsw i32 %cond16.i, 32, !dbg !3511
  %cmp28.not.i = icmp sgt i32 %m, %add27.i, !dbg !3511
  %sub30.i = add nsw i32 %m, -1, !dbg !3511
  %add32.i = add nsw i32 %cond16.i, 32, !dbg !3511
  %cond34.i = select i1 %cmp28.not.i, i32 %add32.i, i32 %sub30.i, !dbg !3511
  %cmp35.not.i = icmp sgt i32 %row.0.i, %cond34.i, !dbg !3513
  br i1 %cmp35.not.i, label %for.end55.i, label %for.body36.i, !dbg !3496

for.body36.i:                                     ; preds = %for.cond25.i
    #dbg_value(i32 %row.0.i, !3514, !DIExpression(), !3519)
    #dbg_value(i32 %pivot_row.0.i, !3522, !DIExpression(), !3519)
  %xor.i6.i = xor i32 %row.0.i, %pivot_row.0.i, !dbg !3523
  %25 = load volatile i64, ptr @pqmayo_MAYO_3_ref_uint64_t_blocker, align 8, !dbg !3524
  %26 = icmp slt i32 %xor.i6.i, 1, !dbg !3525
  %27 = sext i1 %26 to i64, !dbg !3525
  %not.i = xor i64 %25, %27, !dbg !3525
    #dbg_value(i64 %not.i, !3526, !DIExpression(), !3527)
    #dbg_value(i32 %row.0.i, !3528, !DIExpression(), !3530)
    #dbg_value(i32 %pivot_row.0.i, !3532, !DIExpression(), !3530)
    #dbg_value(!DIArgList(i32 %pivot_row.0.i, i32 %row.0.i), !3533, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_LLVM_convert, 64, DW_ATE_signed, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_LLVM_convert, 64, DW_ATE_signed, DW_OP_minus, DW_OP_stack_value), !3530)
  %28 = icmp slt i32 %pivot_row.0.i, %row.0.i, !dbg !3534
  %shr.i.i = sext i1 %28 to i64, !dbg !3534
  %29 = load volatile i64, ptr @pqmayo_MAYO_3_ref_uint64_t_blocker, align 8, !dbg !3535
  %xor.i.i = xor i64 %29, %shr.i.i, !dbg !3536
    #dbg_value(i64 %xor.i.i, !3537, !DIExpression(), !3527)
    #dbg_value(i32 0, !3538, !DIExpression(), !3540)
  br label %for.cond38.i, !dbg !3541

for.cond38.i:                                     ; preds = %for.body40.i, %for.body36.i
  %j.0.i20 = phi i32 [ 0, %for.body36.i ], [ %inc47.i, %for.body40.i ], !dbg !3542
    #dbg_value(i32 %j.0.i20, !3538, !DIExpression(), !3540)
  %exitcond46 = icmp ne i32 %j.0.i20, %smax44, !dbg !3543
  br i1 %exitcond46, label %for.body40.i, label %for.end48.i, !dbg !3545

for.body40.i:                                     ; preds = %for.cond38.i
  %and.i = and i64 %xor.i.i, %pivot_is_zero.0.i, !dbg !3546
  %or.i = or i64 %and.i, %not.i, !dbg !3548
  %mul41.i = mul nsw i32 %row.0.i, %div.i, !dbg !3549
  %add42.i = add nsw i32 %mul41.i, %j.0.i20, !dbg !3550
  %arrayidx43.i = getelementptr inbounds [756 x i64], ptr %packed_A.i, i32 0, i32 %add42.i, !dbg !3551
  %30 = load i64, ptr %arrayidx43.i, align 8, !dbg !3551
  %and44.i = and i64 %or.i, %30, !dbg !3552
  %arrayidx45.i = getelementptr inbounds nuw [7 x i64], ptr %_pivot_row.i, i32 0, i32 %j.0.i20, !dbg !3553
  %31 = load i64, ptr %arrayidx45.i, align 8, !dbg !3554
  %xor.i21 = xor i64 %31, %and44.i, !dbg !3554
  store i64 %xor.i21, ptr %arrayidx45.i, align 8, !dbg !3554
  %inc47.i = add nuw nsw i32 %j.0.i20, 1, !dbg !3555
    #dbg_value(i32 %inc47.i, !3538, !DIExpression(), !3540)
  br label %for.cond38.i, !dbg !3556, !llvm.loop !3557

for.end48.i:                                      ; preds = %for.cond38.i
    #dbg_value(ptr %_pivot_row.i, !3559, !DIExpression(), !3563)
    #dbg_value(i32 %pivot_col.0.i, !3565, !DIExpression(), !3563)
  %div.i10.i35 = lshr i32 %pivot_col.0.i, 4, !dbg !3566
    #dbg_value(i32 %div.i10.i35, !3567, !DIExpression(), !3563)
    #dbg_value(i32 %pivot_col.0.i, !3568, !DIExpression(DW_OP_constu, 15, DW_OP_and, DW_OP_stack_value), !3563)
  %arrayidx.i12.i = getelementptr inbounds nuw i64, ptr %_pivot_row.i, i32 %div.i10.i35, !dbg !3569
  %32 = load i64, ptr %arrayidx.i12.i, align 8, !dbg !3569
  %rem.i11.i = shl i32 %pivot_col.0.i, 2, !dbg !3570
  %mul.i13.i = and i32 %rem.i11.i, 60, !dbg !3570
  %sh_prom.i14.i = zext nneg i32 %mul.i13.i to i64, !dbg !3571
  %shr.i15.i = lshr i64 %32, %sh_prom.i14.i, !dbg !3571
  %33 = trunc i64 %shr.i15.i to i8, !dbg !3572
  %conv.i16.i = and i8 %33, 15, !dbg !3572
    #dbg_value(i8 %conv.i16.i, !3509, !DIExpression(), !3485)
    #dbg_value(i8 %conv.i16.i, !3514, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !3573)
    #dbg_value(i32 0, !3522, !DIExpression(), !3573)
  %34 = load volatile i64, ptr @pqmayo_MAYO_3_ref_uint64_t_blocker, align 8, !dbg !3575
    #dbg_value(!DIArgList(i64 %34, i8 %conv.i16.i), !3510, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_lit0, DW_OP_ne, DW_OP_LLVM_convert, 1, DW_ATE_signed, DW_OP_LLVM_convert, 64, DW_ATE_signed, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_stack_value), !3485)
  %35 = icmp eq i8 %conv.i16.i, 0, !dbg !3576
  %36 = sext i1 %35 to i64, !dbg !3576
  %not52.i = xor i64 %34, %36, !dbg !3576
    #dbg_value(i64 %not52.i, !3510, !DIExpression(), !3485)
  %inc54.i = add nsw i32 %row.0.i, 1, !dbg !3577
    #dbg_value(i32 %inc54.i, !3508, !DIExpression(), !3507)
  br label %for.cond25.i, !dbg !3578, !llvm.loop !3579

for.end55.i:                                      ; preds = %for.cond25.i
  %pivot_is_zero.0.i.lcssa = phi i64 [ %pivot_is_zero.0.i, %for.cond25.i ], !dbg !3485
  %pivot.0.i.lcssa = phi i8 [ %pivot.0.i, %for.cond25.i ], !dbg !3485
    #dbg_value(i8 %pivot.0.i.lcssa, !3581, !DIExpression(), !3585)
    #dbg_value(i8 %pivot.0.i.lcssa, !3326, !DIExpression(), !3587)
    #dbg_value(i8 %pivot.0.i.lcssa, !3330, !DIExpression(), !3587)
  %37 = load volatile i8, ptr @pqmayo_MAYO_3_ref_unsigned_char_blocker, align 1, !dbg !3589
  %xor1.i17.i = xor i8 %pivot.0.i.lcssa, %37, !dbg !3590
    #dbg_value(i8 %xor1.i17.i, !3326, !DIExpression(), !3587)
  %38 = trunc i8 %xor1.i17.i to i1, !dbg !3591
    #dbg_value(i8 poison, !3334, !DIExpression(), !3587)
  %39 = and i8 %xor1.i17.i, 2, !dbg !3592
  %mul9.i.i22 = mul nuw nsw i8 %39, %pivot.0.i.lcssa, !dbg !3593
  %conv10.i.i23 = select i1 %38, i8 %pivot.0.i.lcssa, i8 0, !dbg !3591
  %xor11.i.i24 = xor i8 %conv10.i.i23, %mul9.i.i22, !dbg !3594
    #dbg_value(i8 %xor11.i.i24, !3334, !DIExpression(), !3587)
  %40 = and i8 %xor1.i17.i, 4, !dbg !3595
  %mul16.i.i25 = mul nuw nsw i8 %40, %pivot.0.i.lcssa, !dbg !3596
  %xor18.i.i26 = xor i8 %mul16.i.i25, %xor11.i.i24, !dbg !3597
    #dbg_value(i8 %xor18.i.i26, !3334, !DIExpression(), !3587)
  %41 = and i8 %xor1.i17.i, 8, !dbg !3598
  %mul23.i.i27 = mul nuw nsw i8 %41, %pivot.0.i.lcssa, !dbg !3599
  %xor25.i.i28 = xor i8 %mul23.i.i27, %xor18.i.i26, !dbg !3600
    #dbg_value(i8 %xor25.i.i28, !3334, !DIExpression(), !3587)
    #dbg_value(i8 %xor25.i.i28, !3344, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !3587)
  %42 = lshr i8 %xor25.i.i28, 4, !dbg !3601
  %43 = lshr i8 %xor25.i.i28, 3, !dbg !3602
  %44 = and i8 %43, 14, !dbg !3602
  %45 = xor i8 %42, %44, !dbg !3603
  %xor25.masked.i.i29 = and i8 %xor25.i.i28, 15, !dbg !3604
  %46 = xor i8 %45, %xor25.masked.i.i29, !dbg !3604
    #dbg_value(i8 %46, !3349, !DIExpression(), !3587)
    #dbg_value(i8 %46, !3605, !DIExpression(), !3585)
    #dbg_value(i8 %46, !3326, !DIExpression(), !3606)
    #dbg_value(i8 %46, !3330, !DIExpression(), !3606)
  %47 = load volatile i8, ptr @pqmayo_MAYO_3_ref_unsigned_char_blocker, align 1, !dbg !3608
  %xor1.i45.i = xor i8 %46, %47, !dbg !3609
    #dbg_value(i8 %xor1.i45.i, !3326, !DIExpression(), !3606)
  %48 = trunc i8 %xor1.i45.i to i1, !dbg !3610
    #dbg_value(i8 poison, !3334, !DIExpression(), !3606)
  %49 = and i8 %xor1.i45.i, 2, !dbg !3611
  %mul9.i46.i = mul nuw nsw i8 %49, %46, !dbg !3612
  %conv10.i47.i = select i1 %48, i8 %46, i8 0, !dbg !3610
  %xor11.i48.i = xor i8 %conv10.i47.i, %mul9.i46.i, !dbg !3613
    #dbg_value(i8 %xor11.i48.i, !3334, !DIExpression(), !3606)
  %50 = and i8 %xor1.i45.i, 4, !dbg !3614
  %mul16.i49.i = mul nuw nsw i8 %50, %46, !dbg !3615
  %xor18.i50.i = xor i8 %mul16.i49.i, %xor11.i48.i, !dbg !3616
    #dbg_value(i8 %xor18.i50.i, !3334, !DIExpression(), !3606)
  %51 = and i8 %xor1.i45.i, 8, !dbg !3617
  %mul23.i51.i = mul nuw nsw i8 %51, %46, !dbg !3618
  %xor25.i52.i = xor i8 %mul23.i51.i, %xor18.i50.i, !dbg !3619
    #dbg_value(i8 %xor25.i52.i, !3334, !DIExpression(), !3606)
    #dbg_value(i8 %xor25.i52.i, !3344, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !3606)
  %52 = lshr i8 %xor25.i52.i, 4, !dbg !3620
  %53 = lshr i8 %xor25.i52.i, 3, !dbg !3621
  %54 = and i8 %53, 14, !dbg !3621
  %55 = xor i8 %52, %54, !dbg !3622
  %xor25.masked.i53.i = and i8 %xor25.i52.i, 15, !dbg !3623
  %56 = xor i8 %55, %xor25.masked.i53.i, !dbg !3623
    #dbg_value(i8 %56, !3349, !DIExpression(), !3606)
    #dbg_value(i8 %56, !3624, !DIExpression(), !3585)
    #dbg_value(i8 %56, !3326, !DIExpression(), !3625)
    #dbg_value(i8 %56, !3330, !DIExpression(), !3625)
  %57 = load volatile i8, ptr @pqmayo_MAYO_3_ref_unsigned_char_blocker, align 1, !dbg !3627
  %xor1.i27.i = xor i8 %56, %57, !dbg !3628
    #dbg_value(i8 %xor1.i27.i, !3326, !DIExpression(), !3625)
  %58 = trunc i8 %xor1.i27.i to i1, !dbg !3629
    #dbg_value(i8 poison, !3334, !DIExpression(), !3625)
  %59 = and i8 %xor1.i27.i, 2, !dbg !3630
  %mul9.i28.i = mul nuw nsw i8 %59, %56, !dbg !3631
  %conv10.i29.i = select i1 %58, i8 %56, i8 0, !dbg !3629
  %xor11.i30.i = xor i8 %conv10.i29.i, %mul9.i28.i, !dbg !3632
    #dbg_value(i8 %xor11.i30.i, !3334, !DIExpression(), !3625)
  %60 = and i8 %xor1.i27.i, 4, !dbg !3633
  %mul16.i31.i = mul nuw nsw i8 %60, %56, !dbg !3634
  %xor18.i32.i = xor i8 %mul16.i31.i, %xor11.i30.i, !dbg !3635
    #dbg_value(i8 %xor18.i32.i, !3334, !DIExpression(), !3625)
  %61 = and i8 %xor1.i27.i, 8, !dbg !3636
  %mul23.i33.i = mul nuw nsw i8 %61, %56, !dbg !3637
  %xor25.i34.i = xor i8 %mul23.i33.i, %xor18.i32.i, !dbg !3638
    #dbg_value(i8 %xor25.i34.i, !3334, !DIExpression(), !3625)
    #dbg_value(i8 %xor25.i34.i, !3344, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !3625)
  %62 = lshr i8 %xor25.i34.i, 4, !dbg !3639
  %63 = lshr i8 %xor25.i34.i, 3, !dbg !3640
  %64 = and i8 %63, 14, !dbg !3640
  %65 = xor i8 %62, %64, !dbg !3641
  %xor25.masked.i35.i = and i8 %xor25.i34.i, 15, !dbg !3642
  %66 = xor i8 %65, %xor25.masked.i35.i, !dbg !3642
    #dbg_value(i8 %66, !3349, !DIExpression(), !3625)
    #dbg_value(i8 %66, !3643, !DIExpression(), !3585)
    #dbg_value(i8 %46, !3326, !DIExpression(), !3644)
    #dbg_value(i8 %56, !3330, !DIExpression(), !3644)
  %67 = load volatile i8, ptr @pqmayo_MAYO_3_ref_unsigned_char_blocker, align 1, !dbg !3646
  %xor1.i36.i = xor i8 %46, %67, !dbg !3647
    #dbg_value(i8 %xor1.i36.i, !3326, !DIExpression(), !3644)
  %68 = trunc i8 %xor1.i36.i to i1, !dbg !3648
    #dbg_value(i8 poison, !3334, !DIExpression(), !3644)
  %69 = and i8 %xor1.i36.i, 2, !dbg !3649
  %mul9.i37.i = mul nuw nsw i8 %69, %56, !dbg !3650
  %conv10.i38.i = select i1 %68, i8 %56, i8 0, !dbg !3648
  %xor11.i39.i = xor i8 %conv10.i38.i, %mul9.i37.i, !dbg !3651
    #dbg_value(i8 %xor11.i39.i, !3334, !DIExpression(), !3644)
  %70 = and i8 %xor1.i36.i, 4, !dbg !3652
  %mul16.i40.i = mul nuw nsw i8 %70, %56, !dbg !3653
  %xor18.i41.i = xor i8 %mul16.i40.i, %xor11.i39.i, !dbg !3654
    #dbg_value(i8 %xor18.i41.i, !3334, !DIExpression(), !3644)
  %71 = and i8 %xor1.i36.i, 8, !dbg !3655
  %mul23.i42.i = mul nuw nsw i8 %71, %56, !dbg !3656
  %xor25.i43.i = xor i8 %mul23.i42.i, %xor18.i41.i, !dbg !3657
    #dbg_value(i8 %xor25.i43.i, !3334, !DIExpression(), !3644)
    #dbg_value(i8 %xor25.i43.i, !3344, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !3644)
  %72 = lshr i8 %xor25.i43.i, 4, !dbg !3658
  %73 = lshr i8 %xor25.i43.i, 3, !dbg !3659
  %74 = and i8 %73, 14, !dbg !3659
  %75 = xor i8 %72, %74, !dbg !3660
  %xor25.masked.i44.i = and i8 %xor25.i43.i, 15, !dbg !3661
  %76 = xor i8 %75, %xor25.masked.i44.i, !dbg !3661
    #dbg_value(i8 %76, !3349, !DIExpression(), !3644)
    #dbg_value(i8 %76, !3662, !DIExpression(), !3585)
    #dbg_value(i8 %66, !3326, !DIExpression(), !3663)
    #dbg_value(i8 %76, !3330, !DIExpression(), !3663)
  %77 = load volatile i8, ptr @pqmayo_MAYO_3_ref_unsigned_char_blocker, align 1, !dbg !3665
  %xor1.i18.i = xor i8 %66, %77, !dbg !3666
    #dbg_value(i8 %xor1.i18.i, !3326, !DIExpression(), !3663)
  %78 = trunc i8 %xor1.i18.i to i1, !dbg !3667
    #dbg_value(i8 poison, !3334, !DIExpression(), !3663)
  %79 = and i8 %xor1.i18.i, 2, !dbg !3668
  %mul9.i19.i = mul nuw nsw i8 %79, %76, !dbg !3669
  %conv10.i20.i = select i1 %78, i8 %76, i8 0, !dbg !3667
  %xor11.i21.i = xor i8 %conv10.i20.i, %mul9.i19.i, !dbg !3670
    #dbg_value(i8 %xor11.i21.i, !3334, !DIExpression(), !3663)
  %80 = and i8 %xor1.i18.i, 4, !dbg !3671
  %mul16.i22.i = mul nuw nsw i8 %80, %76, !dbg !3672
  %xor18.i23.i = xor i8 %mul16.i22.i, %xor11.i21.i, !dbg !3673
    #dbg_value(i8 %xor18.i23.i, !3334, !DIExpression(), !3663)
  %81 = and i8 %xor1.i18.i, 8, !dbg !3674
  %mul23.i24.i = mul nuw nsw i8 %81, %76, !dbg !3675
  %xor25.i25.i = xor i8 %mul23.i24.i, %xor18.i23.i, !dbg !3676
    #dbg_value(i8 %xor25.i25.i, !3334, !DIExpression(), !3663)
    #dbg_value(i8 %xor25.i25.i, !3344, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !3663)
  %82 = lshr i8 %xor25.i25.i, 4, !dbg !3677
  %83 = lshr i8 %xor25.i25.i, 3, !dbg !3678
  %84 = and i8 %83, 14, !dbg !3678
  %85 = xor i8 %82, %84, !dbg !3679
  %xor25.masked.i26.i = and i8 %xor25.i25.i, 15, !dbg !3680
  %86 = xor i8 %85, %xor25.masked.i26.i, !dbg !3680
    #dbg_value(i8 %86, !3349, !DIExpression(), !3663)
    #dbg_value(i8 %86, !3681, !DIExpression(), !3585)
    #dbg_value(i8 %86, !3682, !DIExpression(), !3404)
  call fastcc void @vec_mul_add_u64(i32 noundef %div.i, ptr noundef nonnull %_pivot_row.i, i8 noundef zeroext %86, ptr noundef nonnull %_pivot_row2.i) #9, !dbg !3683
    #dbg_value(i32 %cond.i, !3684, !DIExpression(), !3686)
  br label %for.cond60.i, !dbg !3687

for.cond60.i:                                     ; preds = %for.inc86.i, %for.end55.i
  %row59.0.i = phi i32 [ %cond.i, %for.end55.i ], [ %inc87.i, %for.inc86.i ], !dbg !3688
    #dbg_value(i32 %row59.0.i, !3684, !DIExpression(), !3686)
  %cmp61.not.i = icmp sgt i32 %row59.0.i, %cond16.i, !dbg !3689
  br i1 %cmp61.not.i, label %for.cond90.i.preheader, label %for.body63.i, !dbg !3691

for.cond90.i.preheader:                           ; preds = %for.cond60.i
  %smax48 = call i32 @llvm.smax.i32(i32 %cond.i, i32 %m), !dbg !3692
  br label %for.cond90.i, !dbg !3692

for.body63.i:                                     ; preds = %for.cond60.i
    #dbg_value(i32 %row59.0.i, !3514, !DIExpression(), !3694)
    #dbg_value(i32 %pivot_row.0.i, !3522, !DIExpression(), !3694)
  %xor.i1.i = xor i32 %row59.0.i, %pivot_row.0.i, !dbg !3697
  %87 = icmp sgt i32 %xor.i1.i, 0, !dbg !3698
  %shr.i2.i = sext i1 %87 to i64, !dbg !3698
  %88 = load volatile i64, ptr @pqmayo_MAYO_3_ref_uint64_t_blocker, align 8, !dbg !3699
  %xor1.i.i30 = xor i64 %88, %shr.i2.i, !dbg !3700
  %and67.demorgan.i = or i64 %xor1.i.i30, %pivot_is_zero.0.i.lcssa, !dbg !3701
  %and67.i = xor i64 %and67.demorgan.i, -1, !dbg !3701
    #dbg_value(i64 %and67.i, !3702, !DIExpression(), !3703)
    #dbg_value(i64 %and67.demorgan.i, !3704, !DIExpression(), !3703)
    #dbg_value(i32 0, !3705, !DIExpression(), !3707)
  br label %for.cond69.i, !dbg !3708

for.cond69.i:                                     ; preds = %for.body72.i, %for.body63.i
  %col.0.i = phi i32 [ 0, %for.body63.i ], [ %inc84.i, %for.body72.i ], !dbg !3709
    #dbg_value(i32 %col.0.i, !3705, !DIExpression(), !3707)
  %exitcond47 = icmp ne i32 %col.0.i, %smax44, !dbg !3710
  br i1 %exitcond47, label %for.body72.i, label %for.inc86.i, !dbg !3712

for.body72.i:                                     ; preds = %for.cond69.i
  %mul73.i = mul nsw i32 %row59.0.i, %div.i, !dbg !3713
  %add74.i = add nsw i32 %mul73.i, %col.0.i, !dbg !3715
  %arrayidx75.i = getelementptr inbounds [756 x i64], ptr %packed_A.i, i32 0, i32 %add74.i, !dbg !3716
  %89 = load i64, ptr %arrayidx75.i, align 8, !dbg !3716
  %and76.i = and i64 %and67.demorgan.i, %89, !dbg !3717
  %arrayidx77.i = getelementptr inbounds nuw [7 x i64], ptr %_pivot_row2.i, i32 0, i32 %col.0.i, !dbg !3718
  %90 = load i64, ptr %arrayidx77.i, align 8, !dbg !3718
  %and78.i = and i64 %90, %and67.i, !dbg !3719
  %add79.i = add i64 %and76.i, %and78.i, !dbg !3720
  %mul80.i = mul nsw i32 %row59.0.i, %div.i, !dbg !3721
  %add81.i = add nsw i32 %mul80.i, %col.0.i, !dbg !3722
  %arrayidx82.i = getelementptr inbounds [756 x i64], ptr %packed_A.i, i32 0, i32 %add81.i, !dbg !3723
  store i64 %add79.i, ptr %arrayidx82.i, align 8, !dbg !3724
  %inc84.i = add nuw nsw i32 %col.0.i, 1, !dbg !3725
    #dbg_value(i32 %inc84.i, !3705, !DIExpression(), !3707)
  br label %for.cond69.i, !dbg !3726, !llvm.loop !3727

for.inc86.i:                                      ; preds = %for.cond69.i
  %inc87.i = add nsw i32 %row59.0.i, 1, !dbg !3729
    #dbg_value(i32 %inc87.i, !3684, !DIExpression(), !3686)
  br label %for.cond60.i, !dbg !3730, !llvm.loop !3731

for.cond90.i:                                     ; preds = %for.cond90.i.preheader, %for.body93.i
  %row89.0.i = phi i32 [ %inc110.i, %for.body93.i ], [ %cond.i, %for.cond90.i.preheader ], !dbg !3733
    #dbg_value(i32 %row89.0.i, !3734, !DIExpression(), !3735)
  %exitcond49 = icmp ne i32 %row89.0.i, %smax48, !dbg !3736
  br i1 %exitcond49, label %for.body93.i, label %for.inc117.i, !dbg !3692

for.body93.i:                                     ; preds = %for.cond90.i
  %cmp94.i = icmp sgt i32 %row89.0.i, %pivot_row.0.i, !dbg !3738
    #dbg_value(i1 %cmp94.i, !3740, !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3741)
  %mul98.i = mul nsw i32 %row89.0.i, %div.i, !dbg !3742
  %add.ptr99.i = getelementptr inbounds i64, ptr %packed_A.i, i32 %mul98.i, !dbg !3743
    #dbg_value(ptr %add.ptr99.i, !3559, !DIExpression(), !3744)
    #dbg_value(i32 %pivot_col.0.i, !3565, !DIExpression(), !3744)
  %div.i.i36 = lshr i32 %pivot_col.0.i, 4, !dbg !3746
    #dbg_value(i32 %div.i.i36, !3567, !DIExpression(), !3744)
    #dbg_value(i32 %pivot_col.0.i, !3568, !DIExpression(DW_OP_constu, 15, DW_OP_and, DW_OP_stack_value), !3744)
  %arrayidx.i.i31 = getelementptr inbounds nuw i64, ptr %add.ptr99.i, i32 %div.i.i36, !dbg !3747
  %91 = load i64, ptr %arrayidx.i.i31, align 8, !dbg !3747
  %rem.i.i = shl i32 %pivot_col.0.i, 2, !dbg !3748
  %mul.i.i = and i32 %rem.i.i, 60, !dbg !3748
  %sh_prom.i.i = zext nneg i32 %mul.i.i to i64, !dbg !3749
  %shr.i9.i = lshr i64 %91, %sh_prom.i.i, !dbg !3749
  %92 = trunc i64 %shr.i9.i to i8, !dbg !3750
  %conv.i.i = and i8 %92, 15, !dbg !3750
    #dbg_value(i8 %conv.i.i, !3751, !DIExpression(), !3741)
  %conv105.i = select i1 %cmp94.i, i8 %conv.i.i, i8 0, !dbg !3752
  %mul107.i = mul nsw i32 %row89.0.i, %div.i, !dbg !3753
  %add.ptr108.i = getelementptr inbounds i64, ptr %packed_A.i, i32 %mul107.i, !dbg !3754
  call fastcc void @vec_mul_add_u64(i32 noundef %div.i, ptr noundef nonnull %_pivot_row2.i, i8 noundef zeroext %conv105.i, ptr noundef nonnull %add.ptr108.i) #9, !dbg !3755
  %inc110.i = add i32 %row89.0.i, 1, !dbg !3756
    #dbg_value(i32 %inc110.i, !3734, !DIExpression(), !3735)
  br label %for.cond90.i, !dbg !3757, !llvm.loop !3758

for.inc117.i:                                     ; preds = %for.cond90.i
    #dbg_value(!DIArgList(i64 %pivot_is_zero.0.i.lcssa, i32 %pivot_row.0.i), !3475, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_plus_uconst, 1, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_plus, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !3404)
  %93 = trunc i64 %pivot_is_zero.0.i.lcssa to i32, !dbg !3760
  %94 = add i32 %93, 1, !dbg !3760
  %conv116.i = add i32 %94, %pivot_row.0.i, !dbg !3760
    #dbg_value(i32 %conv116.i, !3475, !DIExpression(), !3404)
  %inc118.i = add nuw i32 %pivot_col.0.i, 1, !dbg !3761
    #dbg_value(i32 %inc118.i, !3476, !DIExpression(), !3477)
  br label %for.cond3.i, !dbg !3762, !llvm.loop !3763

for.cond121.i:                                    ; preds = %for.cond121.i.preheader, %for.inc141.i
  %i120.0.i = phi i32 [ %inc142.i, %for.inc141.i ], [ 0, %for.cond121.i.preheader ], !dbg !3765
    #dbg_value(i32 %i120.0.i, !3766, !DIExpression(), !3767)
  %exitcond53 = icmp ne i32 %i120.0.i, %smax37, !dbg !3768
  br i1 %exitcond53, label %for.body124.i, label %EF.exit, !dbg !3480

for.body124.i:                                    ; preds = %for.cond121.i
  %mul126.i = mul nsw i32 %i120.0.i, %div.i, !dbg !3770
  %add.ptr127.i = getelementptr inbounds i64, ptr %packed_A.i, i32 %mul126.i, !dbg !3772
    #dbg_value(i32 %div.i, !3773, !DIExpression(), !3777)
    #dbg_value(ptr %add.ptr127.i, !3779, !DIExpression(), !3777)
    #dbg_value(ptr %temp.i, !3780, !DIExpression(), !3777)
    #dbg_value(ptr %add.ptr127.i, !3781, !DIExpression(), !3777)
    #dbg_value(i32 0, !3782, !DIExpression(), !3784)
  br label %for.cond.i.i16, !dbg !3785

for.cond.i.i16:                                   ; preds = %for.body.i.i19, %for.body124.i
  %i.0.i.i17 = phi i32 [ 0, %for.body124.i ], [ %add8.i.i, %for.body.i.i19 ], !dbg !3786
    #dbg_value(i32 %i.0.i.i17, !3782, !DIExpression(), !3784)
  %mul.i54.i = shl nsw i32 %div.i, 4, !dbg !3787
  %cmp.i.i18 = icmp slt i32 %i.0.i.i17, %mul.i54.i, !dbg !3789
  br i1 %cmp.i.i18, label %for.body.i.i19, label %for.cond130.i.preheader, !dbg !3790

for.cond130.i.preheader:                          ; preds = %for.cond.i.i16
  br label %for.cond130.i, !dbg !3791

for.body.i.i19:                                   ; preds = %for.cond.i.i16
  %div.i55.i = lshr exact i32 %i.0.i.i17, 1, !dbg !3793
  %arrayidx.i56.i = getelementptr inbounds nuw i8, ptr %add.ptr127.i, i32 %div.i55.i, !dbg !3795
  %95 = load i8, ptr %arrayidx.i56.i, align 1, !dbg !3795
  %96 = and i8 %95, 15, !dbg !3796
  %arrayidx2.i.i = getelementptr inbounds nuw i8, ptr %temp.i, i32 %i.0.i.i17, !dbg !3797
  store i8 %96, ptr %arrayidx2.i.i, align 1, !dbg !3798
  %div3.i.i = lshr exact i32 %i.0.i.i17, 1, !dbg !3799
  %arrayidx4.i.i = getelementptr inbounds nuw i8, ptr %add.ptr127.i, i32 %div3.i.i, !dbg !3800
  %97 = load i8, ptr %arrayidx4.i.i, align 1, !dbg !3800
  %98 = lshr i8 %97, 4, !dbg !3801
  %add.i.i = or disjoint i32 %i.0.i.i17, 1, !dbg !3802
  %arrayidx7.i.i = getelementptr inbounds nuw i8, ptr %temp.i, i32 %add.i.i, !dbg !3803
  store i8 %98, ptr %arrayidx7.i.i, align 1, !dbg !3804
  %add8.i.i = add nuw nsw i32 %i.0.i.i17, 2, !dbg !3805
    #dbg_value(i32 %add8.i.i, !3782, !DIExpression(), !3784)
  br label %for.cond.i.i16, !dbg !3806, !llvm.loop !3807

for.cond130.i:                                    ; preds = %for.cond130.i.preheader, %for.body133.i
  %j129.0.i = phi i32 [ %inc139.i, %for.body133.i ], [ 0, %for.cond130.i.preheader ], !dbg !3809
    #dbg_value(i32 %j129.0.i, !3810, !DIExpression(), !3811)
  %exitcond52 = icmp eq i32 %j129.0.i, %20, !dbg !3812
  br i1 %exitcond52, label %for.inc141.i, label %for.body133.i, !dbg !3791

for.body133.i:                                    ; preds = %for.cond130.i
  %arrayidx134.i = getelementptr inbounds nuw [126 x i8], ptr %temp.i, i32 0, i32 %j129.0.i, !dbg !3814
  %99 = load i8, ptr %arrayidx134.i, align 1, !dbg !3814
  %mul135.i = mul nsw i32 %i120.0.i, %add32, !dbg !3816
  %100 = getelementptr i8, ptr %A, i32 %mul135.i, !dbg !3817
  %arrayidx137.i = getelementptr i8, ptr %100, i32 %j129.0.i, !dbg !3817
  store i8 %99, ptr %arrayidx137.i, align 1, !dbg !3818
  %inc139.i = add nuw i32 %j129.0.i, 1, !dbg !3819
    #dbg_value(i32 %inc139.i, !3810, !DIExpression(), !3811)
  br label %for.cond130.i, !dbg !3820, !llvm.loop !3821

for.inc141.i:                                     ; preds = %for.cond130.i
  %inc142.i = add nuw i32 %i120.0.i, 1, !dbg !3823
    #dbg_value(i32 %inc142.i, !3766, !DIExpression(), !3767)
  br label %for.cond121.i, !dbg !3824, !llvm.loop !3825

EF.exit:                                          ; preds = %for.cond121.i
  call void @mayo_secure_clear(ptr noundef nonnull %temp.i, i32 noundef 126) #8, !dbg !3827
  call void @mayo_secure_clear(ptr noundef nonnull %_pivot_row.i, i32 noundef 56) #8, !dbg !3828
  call void @mayo_secure_clear(ptr noundef nonnull %_pivot_row2.i, i32 noundef 56) #8, !dbg !3829
  call void @mayo_secure_clear(ptr noundef nonnull %packed_A.i, i32 noundef 6048) #8, !dbg !3830
  call void @llvm.lifetime.end.p0(i64 56, ptr nonnull %_pivot_row.i), !dbg !3831
  call void @llvm.lifetime.end.p0(i64 56, ptr nonnull %_pivot_row2.i), !dbg !3831
  call void @llvm.lifetime.end.p0(i64 6048, ptr nonnull %packed_A.i), !dbg !3831
  call void @llvm.lifetime.end.p0(i64 126, ptr nonnull %temp.i), !dbg !3831
    #dbg_value(i8 0, !3832, !DIExpression(), !3234)
    #dbg_value(i32 0, !3833, !DIExpression(), !3835)
  %101 = add i32 %A_cols, -1, !dbg !3836
  %smax54 = call i32 @llvm.smax.i32(i32 %101, i32 0), !dbg !3836
  br label %for.cond34, !dbg !3836

for.cond34:                                       ; preds = %for.inc43, %EF.exit
  %full_rank.0 = phi i8 [ 0, %EF.exit ], [ %or12, %for.inc43 ], !dbg !3234
  %i33.0 = phi i32 [ 0, %EF.exit ], [ %inc44, %for.inc43 ], !dbg !3837
    #dbg_value(i32 %i33.0, !3833, !DIExpression(), !3835)
    #dbg_value(i8 %full_rank.0, !3832, !DIExpression(), !3234)
  %exitcond55 = icmp ne i32 %i33.0, %smax54, !dbg !3838
  br i1 %exitcond55, label %for.inc43, label %for.end45, !dbg !3840

for.inc43:                                        ; preds = %for.cond34
    #dbg_value(!DIArgList(i8 poison, i8 poison), !3832, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3234)
  %sub37 = add nsw i32 %m, -1, !dbg !3841
  %mul38 = mul nsw i32 %sub37, %A_cols, !dbg !3843
  %102 = getelementptr i8, ptr %A, i32 %mul38, !dbg !3844
  %arrayidx40 = getelementptr i8, ptr %102, i32 %i33.0, !dbg !3844
  %103 = load i8, ptr %arrayidx40, align 1, !dbg !3844
    #dbg_value(!DIArgList(i8 %full_rank.0, i8 %103), !3832, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3234)
  %or12 = or i8 %full_rank.0, %103, !dbg !3845
    #dbg_value(i8 %or12, !3832, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3234)
    #dbg_value(i8 %or12, !3832, !DIExpression(), !3234)
  %inc44 = add nuw i32 %i33.0, 1, !dbg !3846
    #dbg_value(i32 %inc44, !3833, !DIExpression(), !3835)
  br label %for.cond34, !dbg !3847, !llvm.loop !3848

for.end45:                                        ; preds = %for.cond34
  %full_rank.0.lcssa = phi i8 [ %full_rank.0, %for.cond34 ], !dbg !3234
  %cmp47 = icmp eq i8 %full_rank.0.lcssa, 0, !dbg !3850
  br i1 %cmp47, label %return, label %for.cond50.preheader, !dbg !3850

for.cond50.preheader:                             ; preds = %for.end45
  br label %for.cond50, !dbg !3852

for.cond50.loopexit:                              ; preds = %for.cond63
  br label %for.cond50, !dbg !3852, !llvm.loop !3854

for.cond50:                                       ; preds = %for.cond50.preheader, %for.cond50.loopexit
  %row.0.in = phi i32 [ %row.0, %for.cond50.loopexit ], [ %m, %for.cond50.preheader ]
  %row.0 = add nsw i32 %row.0.in, -1, !dbg !3856
    #dbg_value(i32 %row.0, !3857, !DIExpression(), !3858)
  %cmp51 = icmp sgt i32 %row.0.in, 0, !dbg !3859
  br i1 %cmp51, label %for.body53, label %return.loopexit, !dbg !3852

for.body53:                                       ; preds = %for.cond50
    #dbg_value(i8 0, !3861, !DIExpression(), !3234)
  %sub54 = sub nsw i32 %m, %row.0, !dbg !3862
  %div = sdiv i32 32, %sub54, !dbg !3862
  %add55 = add nsw i32 %row.0, %div, !dbg !3862
  %mul56 = mul nsw i32 %k, %o, !dbg !3862
  %cmp57 = icmp slt i32 %add55, %mul56, !dbg !3862
  br i1 %cmp57, label %cond.true, label %cond.false, !dbg !3862

cond.true:                                        ; preds = %for.body53
  %sub59 = sub nsw i32 %m, %row.0, !dbg !3862
  %div60 = sdiv i32 32, %sub59, !dbg !3862
  %add61 = add nsw i32 %row.0, %div60, !dbg !3862
  br label %cond.end, !dbg !3862

cond.false:                                       ; preds = %for.body53
  %mul62 = mul nsw i32 %k, %o, !dbg !3862
  br label %cond.end, !dbg !3862

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %add61, %cond.true ], [ %mul62, %cond.false ], !dbg !3862
    #dbg_value(i32 %cond, !3864, !DIExpression(), !3234)
    #dbg_value(i32 %row.0, !3865, !DIExpression(), !3867)
  br label %for.cond63, !dbg !3868

for.cond63:                                       ; preds = %for.inc229, %cond.end
  %finished.0 = phi i8 [ 0, %cond.end ], [ %or2273, %for.inc229 ], !dbg !3869
  %col.0 = phi i32 [ %row.0, %cond.end ], [ %inc230, %for.inc229 ], !dbg !3870
    #dbg_value(i32 %col.0, !3865, !DIExpression(), !3867)
    #dbg_value(i8 %finished.0, !3861, !DIExpression(), !3234)
  %cmp64.not = icmp sgt i32 %col.0, %cond, !dbg !3871
  br i1 %cmp64.not, label %for.cond50.loopexit, label %for.body66, !dbg !3873

for.body66:                                       ; preds = %for.cond63
  %mul67 = mul nsw i32 %row.0, %A_cols, !dbg !3874
  %104 = getelementptr i8, ptr %A, i32 %mul67, !dbg !3876
  %arrayidx69 = getelementptr i8, ptr %104, i32 %col.0, !dbg !3876
  %105 = load i8, ptr %arrayidx69, align 1, !dbg !3876
    #dbg_value(i8 %105, !3877, !DIExpression(), !3879)
    #dbg_value(i8 0, !3881, !DIExpression(), !3879)
  %106 = icmp ne i8 %105, 0, !dbg !3882
  %conv3.i = sext i1 %106 to i8, !dbg !3883
  %107 = load volatile i8, ptr @pqmayo_MAYO_3_ref_unsigned_char_blocker, align 1, !dbg !3884
  %xor5.i = xor i8 %107, %conv3.i, !dbg !3885
  %not = xor i8 %finished.0, -1, !dbg !3886
    #dbg_value(!DIArgList(i8 %xor5.i, i8 %not), !3887, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_and, DW_OP_stack_value), !3234)
  %add76 = mul i32 %row.0.in, %A_cols, !dbg !3888
  %108 = getelementptr i8, ptr %A, i32 %add76, !dbg !3889
  %arrayidx78 = getelementptr i8, ptr %108, i32 -1, !dbg !3889
  %109 = load i8, ptr %arrayidx78, align 1, !dbg !3889
  %110 = and i8 %109, %not, !dbg !3890
  %and801 = and i8 %110, %xor5.i, !dbg !3890
    #dbg_value(i8 %and801, !3891, !DIExpression(), !3892)
  %arrayidx83 = getelementptr inbounds i8, ptr %x, i32 %col.0, !dbg !3893
  %111 = load i8, ptr %arrayidx83, align 1, !dbg !3894
  %xor2 = xor i8 %111, %and801, !dbg !3894
  store i8 %xor2, ptr %arrayidx83, align 1, !dbg !3894
    #dbg_value(i32 0, !3895, !DIExpression(), !3897)
  br label %for.cond87, !dbg !3898

for.cond87:                                       ; preds = %for.body90, %for.body66
  %i86.0 = phi i32 [ 0, %for.body66 ], [ %add223, %for.body90 ], !dbg !3899
    #dbg_value(i32 %i86.0, !3895, !DIExpression(), !3897)
  %cmp88 = icmp slt i32 %i86.0, %row.0, !dbg !3900
  br i1 %cmp88, label %for.body90, label %for.inc229, !dbg !3902

for.body90:                                       ; preds = %for.cond87
  %mul91 = mul nsw i32 %i86.0, %A_cols, !dbg !3903
  %112 = getelementptr i8, ptr %A, i32 %mul91, !dbg !3905
  %arrayidx93 = getelementptr i8, ptr %112, i32 %col.0, !dbg !3905
  %113 = load i8, ptr %arrayidx93, align 1, !dbg !3905
  %conv94 = zext i8 %113 to i64, !dbg !3906
  %add95 = or disjoint i32 %i86.0, 1, !dbg !3907
  %mul96 = mul nsw i32 %add95, %A_cols, !dbg !3908
  %114 = getelementptr i8, ptr %A, i32 %mul96, !dbg !3909
  %arrayidx98 = getelementptr i8, ptr %114, i32 %col.0, !dbg !3909
  %115 = load i8, ptr %arrayidx98, align 1, !dbg !3909
  %conv99 = zext i8 %115 to i64, !dbg !3910
  %shl100 = shl nuw nsw i64 %conv99, 8, !dbg !3911
  %xor101 = or disjoint i64 %shl100, %conv94, !dbg !3912
  %add102 = or disjoint i32 %i86.0, 2, !dbg !3913
  %mul103 = mul nsw i32 %add102, %A_cols, !dbg !3914
  %116 = getelementptr i8, ptr %A, i32 %mul103, !dbg !3915
  %arrayidx105 = getelementptr i8, ptr %116, i32 %col.0, !dbg !3915
  %117 = load i8, ptr %arrayidx105, align 1, !dbg !3915
  %conv106 = zext i8 %117 to i64, !dbg !3916
  %shl107 = shl nuw nsw i64 %conv106, 16, !dbg !3917
  %xor108 = or disjoint i64 %xor101, %shl107, !dbg !3918
  %add109 = or disjoint i32 %i86.0, 3, !dbg !3919
  %mul110 = mul nsw i32 %add109, %A_cols, !dbg !3920
  %118 = getelementptr i8, ptr %A, i32 %mul110, !dbg !3921
  %arrayidx112 = getelementptr i8, ptr %118, i32 %col.0, !dbg !3921
  %119 = load i8, ptr %arrayidx112, align 1, !dbg !3921
  %conv113 = zext i8 %119 to i64, !dbg !3922
  %shl114 = shl nuw nsw i64 %conv113, 24, !dbg !3923
  %xor115 = or disjoint i64 %xor108, %shl114, !dbg !3924
  %add116 = or disjoint i32 %i86.0, 4, !dbg !3925
  %mul117 = mul nsw i32 %add116, %A_cols, !dbg !3926
  %120 = getelementptr i8, ptr %A, i32 %mul117, !dbg !3927
  %arrayidx119 = getelementptr i8, ptr %120, i32 %col.0, !dbg !3927
  %121 = load i8, ptr %arrayidx119, align 1, !dbg !3927
  %conv120 = zext i8 %121 to i64, !dbg !3928
  %shl121 = shl nuw nsw i64 %conv120, 32, !dbg !3929
  %xor122 = or disjoint i64 %xor115, %shl121, !dbg !3930
  %add123 = or disjoint i32 %i86.0, 5, !dbg !3931
  %mul124 = mul nsw i32 %add123, %A_cols, !dbg !3932
  %122 = getelementptr i8, ptr %A, i32 %mul124, !dbg !3933
  %arrayidx126 = getelementptr i8, ptr %122, i32 %col.0, !dbg !3933
  %123 = load i8, ptr %arrayidx126, align 1, !dbg !3933
  %conv127 = zext i8 %123 to i64, !dbg !3934
  %shl128 = shl nuw nsw i64 %conv127, 40, !dbg !3935
  %xor129 = xor i64 %xor122, %shl128, !dbg !3936
  %add130 = or disjoint i32 %i86.0, 6, !dbg !3937
  %mul131 = mul nsw i32 %add130, %A_cols, !dbg !3938
  %124 = getelementptr i8, ptr %A, i32 %mul131, !dbg !3939
  %arrayidx133 = getelementptr i8, ptr %124, i32 %col.0, !dbg !3939
  %125 = load i8, ptr %arrayidx133, align 1, !dbg !3939
  %conv134 = zext i8 %125 to i64, !dbg !3940
  %shl135 = shl nuw nsw i64 %conv134, 48, !dbg !3941
  %xor136 = xor i64 %xor129, %shl135, !dbg !3942
  %add137 = or disjoint i32 %i86.0, 7, !dbg !3943
  %mul138 = mul nsw i32 %add137, %A_cols, !dbg !3944
  %126 = getelementptr i8, ptr %A, i32 %mul138, !dbg !3945
  %arrayidx140 = getelementptr i8, ptr %126, i32 %col.0, !dbg !3945
  %127 = load i8, ptr %arrayidx140, align 1, !dbg !3945
  %conv141 = zext i8 %127 to i64, !dbg !3946
  %shl142 = shl nuw i64 %conv141, 56, !dbg !3947
  %xor143 = xor i64 %xor136, %shl142, !dbg !3948
    #dbg_value(i64 %xor143, !3949, !DIExpression(), !3950)
    #dbg_value(i8 %and801, !3951, !DIExpression(), !3955)
    #dbg_value(i64 %xor143, !3957, !DIExpression(), !3955)
  %128 = and i8 %and801, 1, !dbg !3958
  %conv1.i = zext nneg i8 %128 to i64, !dbg !3959
  %mul.i = mul nuw nsw i64 %xor143, %conv1.i, !dbg !3960
    #dbg_value(i64 %mul.i, !3961, !DIExpression(), !3955)
  %129 = and i8 %and801, 2, !dbg !3962
  %conv4.i = zext nneg i8 %129 to i64, !dbg !3963
  %mul5.i = mul i64 %xor143, %conv4.i, !dbg !3964
  %xor.i = xor i64 %mul.i, %mul5.i, !dbg !3965
    #dbg_value(i64 %xor.i, !3961, !DIExpression(), !3955)
  %130 = and i8 %and801, 4, !dbg !3966
  %conv8.i = zext nneg i8 %130 to i64, !dbg !3967
  %mul9.i = mul i64 %xor143, %conv8.i, !dbg !3968
  %xor10.i = xor i64 %xor.i, %mul9.i, !dbg !3969
    #dbg_value(i64 %xor10.i, !3961, !DIExpression(), !3955)
  %131 = and i8 %and801, 8, !dbg !3970
  %conv13.i = zext nneg i8 %131 to i64, !dbg !3971
  %mul14.i = mul i64 %xor143, %conv13.i, !dbg !3972
  %xor15.i = xor i64 %xor10.i, %mul14.i, !dbg !3973
    #dbg_value(i64 %xor15.i, !3961, !DIExpression(), !3955)
    #dbg_value(i64 %xor15.i, !3974, !DIExpression(DW_OP_constu, 17361641481138401520, DW_OP_and, DW_OP_stack_value), !3955)
  %shr.i = lshr i64 %xor15.i, 4, !dbg !3975
  %and16.i = lshr i64 %xor15.i, 3, !dbg !3976
  %shr18.i = and i64 %and16.i, 1012762419733073422, !dbg !3976
  %132 = xor i64 %shr.i, %shr18.i, !dbg !3977
  %xor19.i = xor i64 %132, %xor15.i, !dbg !3977
    #dbg_value(i64 %xor19.i, !3978, !DIExpression(DW_OP_constu, 1085102592571150095, DW_OP_and, DW_OP_stack_value), !3955)
    #dbg_value(i64 %xor19.i, !3949, !DIExpression(DW_OP_constu, 1085102592571150095, DW_OP_and, DW_OP_stack_value), !3950)
  %mul1464 = or disjoint i32 %i86.0, 1, !dbg !3979
  %add147 = mul i32 %mul1464, %A_cols, !dbg !3979
  %133 = getelementptr i8, ptr %A, i32 %add147, !dbg !3980
  %arrayidx149 = getelementptr i8, ptr %133, i32 -1, !dbg !3980
  %134 = load i8, ptr %arrayidx149, align 1, !dbg !3981
  %135 = trunc i64 %xor19.i to i8, !dbg !3981
  %136 = and i8 %135, 15, !dbg !3981
  %conv152 = xor i8 %136, %134, !dbg !3981
  store i8 %conv152, ptr %arrayidx149, align 1, !dbg !3981
  %shr = lshr i64 %xor19.i, 8, !dbg !3982
  %mul1555 = or disjoint i32 %i86.0, 2, !dbg !3983
  %add156 = mul i32 %mul1555, %A_cols, !dbg !3983
  %137 = getelementptr i8, ptr %A, i32 %add156, !dbg !3984
  %arrayidx158 = getelementptr i8, ptr %137, i32 -1, !dbg !3984
  %138 = load i8, ptr %arrayidx158, align 1, !dbg !3985
  %139 = trunc i64 %shr to i8, !dbg !3985
  %140 = and i8 %139, 15, !dbg !3985
  %conv161 = xor i8 %140, %138, !dbg !3985
  store i8 %conv161, ptr %arrayidx158, align 1, !dbg !3985
  %shr162 = lshr i64 %xor19.i, 16, !dbg !3986
  %mul1656 = or disjoint i32 %i86.0, 3, !dbg !3987
  %add166 = mul i32 %mul1656, %A_cols, !dbg !3987
  %141 = getelementptr i8, ptr %A, i32 %add166, !dbg !3988
  %arrayidx168 = getelementptr i8, ptr %141, i32 -1, !dbg !3988
  %142 = load i8, ptr %arrayidx168, align 1, !dbg !3989
  %143 = trunc i64 %shr162 to i8, !dbg !3989
  %144 = and i8 %143, 15, !dbg !3989
  %conv171 = xor i8 %144, %142, !dbg !3989
  store i8 %conv171, ptr %arrayidx168, align 1, !dbg !3989
  %shr172 = lshr i64 %xor19.i, 24, !dbg !3990
  %mul1757 = or disjoint i32 %i86.0, 4, !dbg !3991
  %add176 = mul i32 %mul1757, %A_cols, !dbg !3991
  %145 = getelementptr i8, ptr %A, i32 %add176, !dbg !3992
  %arrayidx178 = getelementptr i8, ptr %145, i32 -1, !dbg !3992
  %146 = load i8, ptr %arrayidx178, align 1, !dbg !3993
  %147 = trunc i64 %shr172 to i8, !dbg !3993
  %148 = and i8 %147, 15, !dbg !3993
  %conv181 = xor i8 %148, %146, !dbg !3993
  store i8 %conv181, ptr %arrayidx178, align 1, !dbg !3993
  %shr182 = lshr i64 %xor19.i, 32, !dbg !3994
  %mul1858 = or disjoint i32 %i86.0, 5, !dbg !3995
  %add186 = mul i32 %mul1858, %A_cols, !dbg !3995
  %149 = getelementptr i8, ptr %A, i32 %add186, !dbg !3996
  %arrayidx188 = getelementptr i8, ptr %149, i32 -1, !dbg !3996
  %150 = load i8, ptr %arrayidx188, align 1, !dbg !3997
  %151 = trunc i64 %shr182 to i8, !dbg !3997
  %152 = and i8 %151, 15, !dbg !3997
  %conv191 = xor i8 %152, %150, !dbg !3997
  store i8 %conv191, ptr %arrayidx188, align 1, !dbg !3997
  %shr192 = lshr i64 %xor19.i, 40, !dbg !3998
  %mul1959 = or disjoint i32 %i86.0, 6, !dbg !3999
  %add196 = mul i32 %mul1959, %A_cols, !dbg !3999
  %153 = getelementptr i8, ptr %A, i32 %add196, !dbg !4000
  %arrayidx198 = getelementptr i8, ptr %153, i32 -1, !dbg !4000
  %154 = load i8, ptr %arrayidx198, align 1, !dbg !4001
  %155 = trunc i64 %shr192 to i8, !dbg !4001
  %156 = and i8 %155, 15, !dbg !4001
  %conv201 = xor i8 %156, %154, !dbg !4001
  store i8 %conv201, ptr %arrayidx198, align 1, !dbg !4001
  %shr202 = lshr i64 %xor19.i, 48, !dbg !4002
  %mul20510 = or disjoint i32 %i86.0, 7, !dbg !4003
  %add206 = mul i32 %mul20510, %A_cols, !dbg !4003
  %157 = getelementptr i8, ptr %A, i32 %add206, !dbg !4004
  %arrayidx208 = getelementptr i8, ptr %157, i32 -1, !dbg !4004
  %158 = load i8, ptr %arrayidx208, align 1, !dbg !4005
  %159 = trunc i64 %shr202 to i8, !dbg !4005
  %160 = and i8 %159, 15, !dbg !4005
  %conv211 = xor i8 %160, %158, !dbg !4005
  store i8 %conv211, ptr %arrayidx208, align 1, !dbg !4005
  %and20.i = lshr i64 %xor19.i, 56, !dbg !4006
  %mul21511 = add nuw i32 %i86.0, 8, !dbg !4007
  %add216 = mul i32 %mul21511, %A_cols, !dbg !4007
  %161 = getelementptr i8, ptr %A, i32 %add216, !dbg !4008
  %arrayidx218 = getelementptr i8, ptr %161, i32 -1, !dbg !4008
  %162 = load i8, ptr %arrayidx218, align 1, !dbg !4009
  %163 = trunc nuw i64 %and20.i to i8, !dbg !4009
  %164 = and i8 %163, 15, !dbg !4009
  %conv221 = xor i8 %164, %162, !dbg !4009
  store i8 %conv221, ptr %arrayidx218, align 1, !dbg !4009
  %add223 = add nuw nsw i32 %i86.0, 8, !dbg !4010
    #dbg_value(i32 %add223, !3895, !DIExpression(), !3897)
  br label %for.cond87, !dbg !4011, !llvm.loop !4012

for.inc229:                                       ; preds = %for.cond87
    #dbg_value(!DIArgList(i8 %finished.0, i8 %xor5.i), !3861, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3234)
  %or2273 = or i8 %finished.0, %xor5.i, !dbg !4014
    #dbg_value(i8 %or2273, !3861, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3234)
    #dbg_value(i8 %or2273, !3861, !DIExpression(), !3234)
  %inc230 = add nsw i32 %col.0, 1, !dbg !4015
    #dbg_value(i32 %inc230, !3865, !DIExpression(), !3867)
  br label %for.cond63, !dbg !4016, !llvm.loop !4017

return.loopexit:                                  ; preds = %for.cond50
  br label %return, !dbg !4019

return:                                           ; preds = %return.loopexit, %for.end45
  %retval.0 = phi i32 [ 0, %for.end45 ], [ 1, %return.loopexit ], !dbg !3234
  ret i32 %retval.0, !dbg !4019
}

; Function Attrs: nounwind
define internal fastcc void @vec_mul_add_u64(i32 noundef %legs, ptr noundef %in, i8 noundef zeroext %a, ptr noundef %acc) unnamed_addr #0 !dbg !4020 {
entry:
    #dbg_value(i32 %legs, !4023, !DIExpression(), !4024)
    #dbg_value(ptr %in, !4025, !DIExpression(), !4024)
    #dbg_value(i8 %a, !4026, !DIExpression(), !4024)
    #dbg_value(ptr %acc, !4027, !DIExpression(), !4024)
    #dbg_value(i8 %a, !4028, !DIExpression(), !4030)
  %conv.i = zext i8 %a to i32, !dbg !4032
  %mul.i = mul i32 %conv.i, 134480385, !dbg !4033
    #dbg_value(i32 %mul.i, !4034, !DIExpression(), !4030)
    #dbg_value(i32 -252645136, !4035, !DIExpression(), !4030)
  %and.i = and i32 %mul.i, -252645136, !dbg !4036
    #dbg_value(i32 %and.i, !4037, !DIExpression(), !4030)
  %shr.i = lshr exact i32 %and.i, 4, !dbg !4038
  %shr1.i = lshr exact i32 %and.i, 3, !dbg !4039
  %0 = xor i32 %shr.i, %shr1.i, !dbg !4040
  %xor2.i = xor i32 %0, %mul.i, !dbg !4040
    #dbg_value(i32 %xor2.i, !4041, !DIExpression(), !4024)
    #dbg_value(i64 1229782938247303441, !4042, !DIExpression(), !4024)
    #dbg_value(i32 0, !4043, !DIExpression(), !4045)
  %smax = call i32 @llvm.smax.i32(i32 %legs, i32 0), !dbg !4046
  br label %for.cond, !dbg !4046

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !4047
    #dbg_value(i32 %i.0, !4043, !DIExpression(), !4045)
  %exitcond = icmp ne i32 %i.0, %smax, !dbg !4048
  br i1 %exitcond, label %for.body, label %for.end, !dbg !4050

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !4051
  %1 = load i64, ptr %arrayidx, align 8, !dbg !4051
  %and = and i64 %1, 1229782938247303441, !dbg !4053
  %and1 = and i32 %xor2.i, 255, !dbg !4054
  %conv = zext nneg i32 %and1 to i64, !dbg !4055
  %mul = mul i64 %and, %conv, !dbg !4056
  %shr = lshr i64 %1, 1, !dbg !4057
  %and3 = and i64 %shr, 1229782938247303441, !dbg !4058
  %shr4 = lshr i32 %xor2.i, 8, !dbg !4059
  %and5 = and i32 %shr4, 15, !dbg !4060
  %conv6 = zext nneg i32 %and5 to i64, !dbg !4061
  %mul7 = mul nuw i64 %and3, %conv6, !dbg !4062
  %xor = xor i64 %mul, %mul7, !dbg !4063
  %arrayidx8 = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !4064
  %2 = load i64, ptr %arrayidx8, align 8, !dbg !4064
  %shr9 = lshr i64 %2, 2, !dbg !4065
  %and10 = and i64 %shr9, 1229782938247303441, !dbg !4066
  %shr11 = lshr i32 %xor2.i, 16, !dbg !4067
  %and12 = and i32 %shr11, 15, !dbg !4068
  %conv13 = zext nneg i32 %and12 to i64, !dbg !4069
  %mul14 = mul nuw i64 %and10, %conv13, !dbg !4070
  %xor15 = xor i64 %xor, %mul14, !dbg !4071
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !4072
  %3 = load i64, ptr %arrayidx16, align 8, !dbg !4072
  %shr17 = lshr i64 %3, 3, !dbg !4073
  %and18 = and i64 %shr17, 1229782938247303441, !dbg !4074
  %shr19 = lshr i32 %xor2.i, 24, !dbg !4075
  %and20 = and i32 %shr19, 15, !dbg !4076
  %conv21 = zext nneg i32 %and20 to i64, !dbg !4077
  %mul22 = mul nuw i64 %and18, %conv21, !dbg !4078
  %xor23 = xor i64 %xor15, %mul22, !dbg !4079
  %arrayidx24 = getelementptr inbounds nuw i64, ptr %acc, i32 %i.0, !dbg !4080
  %4 = load i64, ptr %arrayidx24, align 8, !dbg !4081
  %xor25 = xor i64 %4, %xor23, !dbg !4081
  store i64 %xor25, ptr %arrayidx24, align 8, !dbg !4081
  %inc = add nuw i32 %i.0, 1, !dbg !4082
    #dbg_value(i32 %inc, !4043, !DIExpression(), !4045)
  br label %for.cond, !dbg !4083, !llvm.loop !4084

for.end:                                          ; preds = %for.cond
  ret void, !dbg !4086
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
!83 = distinct !DIGlobalVariable(name: "pqmayo_MAYO_3_ref_uint32_t_blocker", scope: !84, file: !99, line: 126, type: !104, isLocal: false, isDefinition: true)
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
!98 = distinct !DIGlobalVariable(name: "pqmayo_MAYO_3_ref_uint64_t_blocker", scope: !84, file: !99, line: 127, type: !100, isLocal: false, isDefinition: true)
!99 = !DIFile(filename: "../../../src/arithmetic.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!100 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !53)
!101 = !DIGlobalVariableExpression(var: !102, expr: !DIExpression())
!102 = distinct !DIGlobalVariable(name: "pqmayo_MAYO_3_ref_unsigned_char_blocker", scope: !84, file: !99, line: 128, type: !103, isLocal: false, isDefinition: true)
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
!166 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sk_t", file: !79, line: 291, size: 3129408, elements: !167)
!167 = !{!168, !172}
!168 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !166, file: !79, line: 292, baseType: !169, size: 3120768)
!169 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 3120768, elements: !170)
!170 = !{!171}
!171 = !DISubrange(count: 48762)
!172 = !DIDerivedType(tag: DW_TAG_member, name: "O", scope: !166, file: !79, line: 293, baseType: !173, size: 8640, offset: 3120768)
!173 = !DICompositeType(tag: DW_TAG_array_type, baseType: !174, size: 8640, elements: !176)
!174 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !54, line: 24, baseType: !175)
!175 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !56, line: 43, baseType: !51)
!176 = !{!177}
!177 = !DISubrange(count: 1080)
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
!190 = distinct !DISubprogram(name: "pqmayo_MAYO_3_ref_mayo_keypair", scope: !68, file: !68, line: 298, type: !191, scopeLine: 298, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
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
!248 = distinct !DISubprogram(name: "pqmayo_MAYO_3_ref_mayo_expand_pk", scope: !68, file: !68, line: 608, type: !249, scopeLine: 609, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
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
!278 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 448, elements: !10)
!279 = !DILocalVariable(name: "i", scope: !280, file: !68, line: 266, type: !86)
!280 = distinct !DILexicalBlock(scope: !265, file: !68, line: 266, column: 5)
!281 = !DILocation(line: 0, scope: !280, inlinedAt: !268)
!282 = !DILocation(line: 266, column: 10, scope: !280, inlinedAt: !268)
!283 = !DILocation(line: 266, column: 28, scope: !284, inlinedAt: !268)
!284 = distinct !DILexicalBlock(scope: !280, file: !68, line: 266, column: 5)
!285 = !DILocation(line: 266, column: 5, scope: !280, inlinedAt: !268)
!286 = !DILocation(line: 266, scope: !280, inlinedAt: !268)
!287 = !DILocation(line: 268, column: 27, scope: !288, inlinedAt: !268)
!288 = distinct !DILexicalBlock(scope: !284, file: !68, line: 267, column: 5)
!289 = !DILocation(line: 268, column: 29, scope: !288, inlinedAt: !268)
!290 = !DILocation(line: 268, column: 24, scope: !288, inlinedAt: !268)
!291 = !DILocation(line: 268, column: 9, scope: !288, inlinedAt: !268)
!292 = !DILocation(line: 269, column: 36, scope: !288, inlinedAt: !268)
!293 = !DILocation(line: 269, column: 21, scope: !288, inlinedAt: !268)
!294 = !DILocation(line: 269, column: 9, scope: !288, inlinedAt: !268)
!295 = !DILocation(line: 266, column: 5, scope: !284, inlinedAt: !268)
!296 = distinct !{!296, !285, !297, !298}
!297 = !DILocation(line: 270, column: 5, scope: !280, inlinedAt: !268)
!298 = !{!"llvm.loop.mustprogress"}
!299 = !DILocation(line: 271, column: 1, scope: !265, inlinedAt: !268)
!300 = !DILocation(line: 612, column: 23, scope: !248, inlinedAt: !252)
!301 = !DILocation(line: 612, column: 72, scope: !248, inlinedAt: !252)
!302 = !DILocation(line: 265, column: 14, scope: !265, inlinedAt: !303)
!303 = distinct !DILocation(line: 612, column: 5, scope: !248, inlinedAt: !252)
!304 = !DILocation(line: 0, scope: !265, inlinedAt: !303)
!305 = !DILocation(line: 0, scope: !280, inlinedAt: !303)
!306 = !DILocation(line: 266, column: 10, scope: !280, inlinedAt: !303)
!307 = !DILocation(line: 266, column: 28, scope: !284, inlinedAt: !303)
!308 = !DILocation(line: 266, column: 5, scope: !280, inlinedAt: !303)
!309 = !DILocation(line: 266, scope: !280, inlinedAt: !303)
!310 = !DILocation(line: 268, column: 27, scope: !288, inlinedAt: !303)
!311 = !DILocation(line: 268, column: 29, scope: !288, inlinedAt: !303)
!312 = !DILocation(line: 268, column: 24, scope: !288, inlinedAt: !303)
!313 = !DILocation(line: 268, column: 9, scope: !288, inlinedAt: !303)
!314 = !DILocation(line: 269, column: 36, scope: !288, inlinedAt: !303)
!315 = !DILocation(line: 269, column: 21, scope: !288, inlinedAt: !303)
!316 = !DILocation(line: 269, column: 9, scope: !288, inlinedAt: !303)
!317 = !DILocation(line: 266, column: 5, scope: !284, inlinedAt: !303)
!318 = distinct !{!318, !308, !319, !298}
!319 = !DILocation(line: 270, column: 5, scope: !280, inlinedAt: !303)
!320 = !DILocation(line: 271, column: 1, scope: !265, inlinedAt: !303)
!321 = !DILocation(line: 70, column: 9, scope: !322, inlinedAt: !150)
!322 = distinct !DILexicalBlock(scope: !323, file: !2, line: 69, column: 12)
!323 = distinct !DILexicalBlock(scope: !117, file: !2, line: 65, column: 9)
!324 = !DILocation(line: 73, column: 5, scope: !117, inlinedAt: !150)
!325 = !DILocation(line: 74, column: 11, scope: !117, inlinedAt: !150)
!326 = !DILocation(line: 75, column: 13, scope: !327, inlinedAt: !150)
!327 = distinct !DILexicalBlock(scope: !117, file: !2, line: 75, column: 9)
!328 = !DILocation(line: 76, column: 9, scope: !329, inlinedAt: !150)
!329 = distinct !DILexicalBlock(scope: !327, file: !2, line: 75, column: 25)
!330 = !DILocation(line: 78, column: 9, scope: !329, inlinedAt: !150)
!331 = !DILocation(line: 80, column: 9, scope: !332, inlinedAt: !150)
!332 = distinct !DILexicalBlock(scope: !327, file: !2, line: 79, column: 12)
!333 = !DILocation(line: 83, column: 5, scope: !117, inlinedAt: !150)
!334 = !DILocation(line: 84, column: 44, scope: !117, inlinedAt: !150)
!335 = !DILocalVariable(name: "p", arg: 1, scope: !336, file: !68, line: 520, type: !193)
!336 = distinct !DISubprogram(name: "pqmayo_MAYO_3_ref_mayo_open", scope: !68, file: !68, line: 520, type: !337, scopeLine: 522, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!337 = !DISubroutineType(types: !338)
!338 = !{!86, !193, !61, !339, !90, !58, !90}
!339 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 32)
!340 = !DILocation(line: 0, scope: !336, inlinedAt: !341)
!341 = distinct !DILocation(line: 84, column: 11, scope: !117, inlinedAt: !150)
!342 = !DILocalVariable(name: "m", arg: 2, scope: !336, file: !68, line: 520, type: !61)
!343 = !DILocalVariable(name: "mlen", arg: 3, scope: !336, file: !68, line: 521, type: !339)
!344 = !DILocalVariable(name: "sm", arg: 4, scope: !336, file: !68, line: 521, type: !90)
!345 = !DILocalVariable(name: "smlen", arg: 5, scope: !336, file: !68, line: 522, type: !58)
!346 = !DILocalVariable(name: "pk", arg: 6, scope: !336, file: !68, line: 522, type: !90)
!347 = !DILocalVariable(name: "param_sig_bytes", scope: !336, file: !68, line: 523, type: !275)
!348 = !DILocation(line: 524, column: 15, scope: !349, inlinedAt: !341)
!349 = distinct !DILexicalBlock(scope: !336, file: !68, line: 524, column: 9)
!350 = !DILocation(line: 527, column: 36, scope: !336, inlinedAt: !341)
!351 = !DILocation(line: 527, column: 61, scope: !336, inlinedAt: !341)
!352 = !DILocation(line: 527, column: 18, scope: !336, inlinedAt: !341)
!353 = !DILocalVariable(name: "result", scope: !336, file: !68, line: 527, type: !86)
!354 = !DILocation(line: 530, column: 16, scope: !355, inlinedAt: !341)
!355 = distinct !DILexicalBlock(scope: !336, file: !68, line: 530, column: 9)
!356 = !DILocation(line: 531, column: 23, scope: !357, inlinedAt: !341)
!357 = distinct !DILexicalBlock(scope: !355, file: !68, line: 530, column: 28)
!358 = !DILocation(line: 532, column: 23, scope: !357, inlinedAt: !341)
!359 = !DILocation(line: 532, column: 9, scope: !357, inlinedAt: !341)
!360 = !DILocation(line: 533, column: 5, scope: !357, inlinedAt: !341)
!361 = !DILocation(line: 85, column: 24, scope: !362, inlinedAt: !150)
!362 = distinct !DILexicalBlock(scope: !117, file: !2, line: 85, column: 9)
!363 = !DILocation(line: 85, column: 27, scope: !362, inlinedAt: !150)
!364 = !DILocation(line: 86, column: 9, scope: !365, inlinedAt: !150)
!365 = distinct !DILexicalBlock(scope: !362, file: !2, line: 85, column: 54)
!366 = !DILocation(line: 88, column: 9, scope: !365, inlinedAt: !150)
!367 = !DILocation(line: 91, column: 9, scope: !368, inlinedAt: !150)
!368 = distinct !DILexicalBlock(scope: !362, file: !2, line: 89, column: 12)
!369 = !DILocation(line: 94, column: 5, scope: !117, inlinedAt: !150)
!370 = !DILocation(line: 95, column: 11, scope: !117, inlinedAt: !150)
!371 = !DILocation(line: 96, column: 13, scope: !372, inlinedAt: !150)
!372 = distinct !DILexicalBlock(scope: !117, file: !2, line: 96, column: 9)
!373 = !DILocation(line: 97, column: 9, scope: !374, inlinedAt: !150)
!374 = distinct !DILexicalBlock(scope: !372, file: !2, line: 96, column: 25)
!375 = !DILocation(line: 99, column: 9, scope: !374, inlinedAt: !150)
!376 = !DILocation(line: 102, column: 9, scope: !377, inlinedAt: !150)
!377 = distinct !DILexicalBlock(scope: !372, file: !2, line: 100, column: 12)
!378 = !DILocation(line: 96, column: 16, scope: !372, inlinedAt: !150)
!379 = !DILabel(scope: !117, name: "err", file: !2, line: 129)
!380 = !DILocation(line: 129, column: 1, scope: !117, inlinedAt: !150)
!381 = !DILocation(line: 130, column: 5, scope: !117, inlinedAt: !150)
!382 = !DILocation(line: 131, column: 5, scope: !117, inlinedAt: !150)
!383 = !DILocation(line: 132, column: 5, scope: !117, inlinedAt: !150)
!384 = !DILocation(line: 133, column: 5, scope: !117, inlinedAt: !150)
!385 = !DILocation(line: 134, column: 5, scope: !117, inlinedAt: !150)
!386 = !DILocation(line: 135, column: 5, scope: !117, inlinedAt: !150)
!387 = !DILocation(line: 148, column: 5, scope: !113)
!388 = !DILocation(line: 0, scope: !190)
!389 = !DILocation(line: 301, column: 11, scope: !190)
!390 = !DILocation(line: 306, column: 1, scope: !190)
!391 = !DILocation(line: 307, column: 5, scope: !190)
!392 = distinct !DISubprogram(name: "pqmayo_MAYO_3_ref_mayo_keypair_compact", scope: !68, file: !68, line: 538, type: !191, scopeLine: 539, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!393 = !DILocalVariable(name: "p", arg: 1, scope: !392, file: !68, line: 538, type: !193)
!394 = !DILocation(line: 0, scope: !392)
!395 = !DILocalVariable(name: "cpk", arg: 2, scope: !392, file: !68, line: 538, type: !61)
!396 = !DILocalVariable(name: "csk", arg: 3, scope: !392, file: !68, line: 539, type: !61)
!397 = !DILocalVariable(name: "ret", scope: !392, file: !68, line: 540, type: !86)
!398 = !DILocalVariable(name: "seed_sk", scope: !392, file: !68, line: 541, type: !61)
!399 = !DILocalVariable(name: "S", scope: !392, file: !68, line: 542, type: !400)
!400 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 4448, elements: !401)
!401 = !{!402}
!402 = !DISubrange(count: 556)
!403 = !DILocation(line: 542, column: 19, scope: !392)
!404 = !DILocalVariable(name: "P", scope: !392, file: !68, line: 543, type: !169)
!405 = !DILocation(line: 543, column: 14, scope: !392)
!406 = !DILocalVariable(name: "P3", scope: !392, file: !68, line: 544, type: !407)
!407 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 44800, elements: !408)
!408 = !{!409}
!409 = !DISubrange(count: 700)
!410 = !DILocation(line: 544, column: 14, scope: !392)
!411 = !DILocalVariable(name: "O", scope: !392, file: !68, line: 547, type: !412)
!412 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 8640, elements: !176)
!413 = !DILocation(line: 547, column: 19, scope: !392)
!414 = !DILocalVariable(name: "m_vec_limbs", scope: !392, file: !68, line: 549, type: !275)
!415 = !DILocalVariable(name: "param_m", scope: !392, file: !68, line: 550, type: !275)
!416 = !DILocalVariable(name: "param_v", scope: !392, file: !68, line: 551, type: !275)
!417 = !DILocalVariable(name: "param_o", scope: !392, file: !68, line: 552, type: !275)
!418 = !DILocalVariable(name: "param_O_bytes", scope: !392, file: !68, line: 553, type: !275)
!419 = !DILocalVariable(name: "param_P1_limbs", scope: !392, file: !68, line: 554, type: !275)
!420 = !DILocalVariable(name: "param_P3_limbs", scope: !392, file: !68, line: 555, type: !275)
!421 = !DILocalVariable(name: "param_pk_seed_bytes", scope: !392, file: !68, line: 556, type: !275)
!422 = !DILocalVariable(name: "param_sk_seed_bytes", scope: !392, file: !68, line: 557, type: !275)
!423 = !DILocalVariable(name: "P1", scope: !392, file: !68, line: 559, type: !52)
!424 = !DILocation(line: 560, column: 22, scope: !392)
!425 = !DILocalVariable(name: "P2", scope: !392, file: !68, line: 560, type: !52)
!426 = !DILocation(line: 566, column: 9, scope: !427)
!427 = distinct !DILexicalBlock(scope: !392, file: !68, line: 566, column: 9)
!428 = !DILocation(line: 566, column: 51, scope: !427)
!429 = !DILocation(line: 573, column: 5, scope: !392)
!430 = !DILocalVariable(name: "seed_pk", scope: !392, file: !68, line: 546, type: !61)
!431 = !DILocation(line: 579, column: 14, scope: !392)
!432 = !DILocalVariable(name: "m", arg: 1, scope: !433, file: !68, line: 20, type: !90)
!433 = distinct !DISubprogram(name: "decode", scope: !68, file: !68, line: 20, type: !434, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!434 = !DISubroutineType(types: !435)
!435 = !{null, !90, !61, !86}
!436 = !DILocation(line: 0, scope: !433, inlinedAt: !437)
!437 = distinct !DILocation(line: 579, column: 5, scope: !392)
!438 = !DILocalVariable(name: "mdec", arg: 2, scope: !433, file: !68, line: 20, type: !61)
!439 = !DILocalVariable(name: "mdeclen", arg: 3, scope: !433, file: !68, line: 20, type: !86)
!440 = !DILocalVariable(name: "i", scope: !433, file: !68, line: 21, type: !86)
!441 = !DILocation(line: 22, column: 10, scope: !442, inlinedAt: !437)
!442 = distinct !DILexicalBlock(scope: !433, file: !68, line: 22, column: 5)
!443 = !DILocation(line: 22, scope: !442, inlinedAt: !437)
!444 = !DILocation(line: 22, column: 19, scope: !445, inlinedAt: !437)
!445 = distinct !DILexicalBlock(scope: !442, file: !68, line: 22, column: 5)
!446 = !DILocation(line: 22, column: 5, scope: !442, inlinedAt: !437)
!447 = !DILocation(line: 23, column: 19, scope: !448, inlinedAt: !437)
!448 = distinct !DILexicalBlock(scope: !445, file: !68, line: 22, column: 39)
!449 = !DILocation(line: 23, column: 24, scope: !448, inlinedAt: !437)
!450 = !DILocation(line: 23, column: 14, scope: !448, inlinedAt: !437)
!451 = !DILocation(line: 23, column: 17, scope: !448, inlinedAt: !437)
!452 = !DILocation(line: 24, column: 24, scope: !448, inlinedAt: !437)
!453 = !DILocation(line: 24, column: 17, scope: !448, inlinedAt: !437)
!454 = !DILocation(line: 24, column: 14, scope: !448, inlinedAt: !437)
!455 = !DILocation(line: 22, column: 34, scope: !445, inlinedAt: !437)
!456 = !DILocation(line: 22, column: 5, scope: !445, inlinedAt: !437)
!457 = distinct !{!457, !446, !458, !298}
!458 = !DILocation(line: 25, column: 5, scope: !442, inlinedAt: !437)
!459 = !DILocation(line: 0, scope: !256, inlinedAt: !460)
!460 = distinct !DILocation(line: 585, column: 5, scope: !392)
!461 = !DILocation(line: 284, column: 5, scope: !256, inlinedAt: !460)
!462 = !DILocation(line: 265, column: 14, scope: !265, inlinedAt: !463)
!463 = distinct !DILocation(line: 285, column: 5, scope: !256, inlinedAt: !460)
!464 = !DILocation(line: 0, scope: !265, inlinedAt: !463)
!465 = !DILocation(line: 0, scope: !280, inlinedAt: !463)
!466 = !DILocation(line: 266, column: 10, scope: !280, inlinedAt: !463)
!467 = !DILocation(line: 266, column: 28, scope: !284, inlinedAt: !463)
!468 = !DILocation(line: 266, column: 5, scope: !280, inlinedAt: !463)
!469 = !DILocation(line: 266, scope: !280, inlinedAt: !463)
!470 = !DILocation(line: 268, column: 27, scope: !288, inlinedAt: !463)
!471 = !DILocation(line: 268, column: 29, scope: !288, inlinedAt: !463)
!472 = !DILocation(line: 268, column: 24, scope: !288, inlinedAt: !463)
!473 = !DILocation(line: 268, column: 9, scope: !288, inlinedAt: !463)
!474 = !DILocation(line: 269, column: 36, scope: !288, inlinedAt: !463)
!475 = !DILocation(line: 269, column: 21, scope: !288, inlinedAt: !463)
!476 = !DILocation(line: 269, column: 9, scope: !288, inlinedAt: !463)
!477 = !DILocation(line: 266, column: 5, scope: !284, inlinedAt: !463)
!478 = distinct !{!478, !468, !479, !298}
!479 = !DILocation(line: 270, column: 5, scope: !280, inlinedAt: !463)
!480 = !DILocation(line: 271, column: 1, scope: !265, inlinedAt: !463)
!481 = !DILocalVariable(name: "p", arg: 1, scope: !482, file: !483, line: 260, type: !193)
!482 = distinct !DISubprogram(name: "compute_P3", scope: !483, file: !483, line: 260, type: !484, scopeLine: 260, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!483 = !DIFile(filename: "../../../src/generic/generic_arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!484 = !DISubroutineType(types: !485)
!485 = !{null, !193, !486, !52, !90, !52}
!486 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 32)
!487 = !DILocation(line: 0, scope: !482, inlinedAt: !488)
!488 = distinct !DILocation(line: 588, column: 5, scope: !392)
!489 = !DILocalVariable(name: "P1", arg: 2, scope: !482, file: !483, line: 260, type: !486)
!490 = !DILocalVariable(name: "P2", arg: 3, scope: !482, file: !483, line: 260, type: !52)
!491 = !DILocalVariable(name: "O", arg: 4, scope: !482, file: !483, line: 260, type: !90)
!492 = !DILocalVariable(name: "P3", arg: 5, scope: !482, file: !483, line: 260, type: !52)
!493 = !DILocalVariable(name: "m_vec_limbs", scope: !482, file: !483, line: 262, type: !275)
!494 = !DILocalVariable(name: "param_v", scope: !482, file: !483, line: 263, type: !275)
!495 = !DILocalVariable(name: "param_o", scope: !482, file: !483, line: 264, type: !275)
!496 = !DILocalVariable(name: "p", arg: 1, scope: !497, file: !483, line: 74, type: !193)
!497 = distinct !DISubprogram(name: "P1_times_O", scope: !483, file: !483, line: 74, type: !498, scopeLine: 74, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!498 = !DISubroutineType(types: !499)
!499 = !{null, !193, !486, !90, !52}
!500 = !DILocation(line: 0, scope: !497, inlinedAt: !501)
!501 = distinct !DILocation(line: 267, column: 5, scope: !482, inlinedAt: !488)
!502 = !DILocalVariable(name: "P1", arg: 2, scope: !497, file: !483, line: 74, type: !486)
!503 = !DILocalVariable(name: "O", arg: 3, scope: !497, file: !483, line: 74, type: !90)
!504 = !DILocalVariable(name: "acc", arg: 4, scope: !497, file: !483, line: 74, type: !52)
!505 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !506, file: !483, line: 16, type: !275)
!506 = distinct !DISubprogram(name: "mul_add_m_upper_triangular_mat_x_mat", scope: !483, file: !483, line: 16, type: !507, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!507 = !DISubroutineType(types: !508)
!508 = !{null, !275, !486, !90, !52, !275, !275, !275, !275}
!509 = !DILocation(line: 0, scope: !506, inlinedAt: !510)
!510 = distinct !DILocation(line: 78, column: 5, scope: !497, inlinedAt: !501)
!511 = !DILocalVariable(name: "bs_mat", arg: 2, scope: !506, file: !483, line: 16, type: !486)
!512 = !DILocalVariable(name: "mat", arg: 3, scope: !506, file: !483, line: 16, type: !90)
!513 = !DILocalVariable(name: "acc", arg: 4, scope: !506, file: !483, line: 16, type: !52)
!514 = !DILocalVariable(name: "bs_mat_rows", arg: 5, scope: !506, file: !483, line: 17, type: !275)
!515 = !DILocalVariable(name: "bs_mat_cols", arg: 6, scope: !506, file: !483, line: 17, type: !275)
!516 = !DILocalVariable(name: "mat_cols", arg: 7, scope: !506, file: !483, line: 17, type: !275)
!517 = !DILocalVariable(name: "triangular", arg: 8, scope: !506, file: !483, line: 17, type: !275)
!518 = !DILocalVariable(name: "bs_mat_entries_used", scope: !506, file: !483, line: 19, type: !86)
!519 = !DILocalVariable(name: "r", scope: !520, file: !483, line: 20, type: !86)
!520 = distinct !DILexicalBlock(scope: !506, file: !483, line: 20, column: 5)
!521 = !DILocation(line: 0, scope: !520, inlinedAt: !510)
!522 = !DILocation(line: 20, column: 10, scope: !520, inlinedAt: !510)
!523 = !DILocation(line: 19, column: 9, scope: !506, inlinedAt: !510)
!524 = !DILocation(line: 20, scope: !520, inlinedAt: !510)
!525 = !DILocation(line: 20, column: 23, scope: !526, inlinedAt: !510)
!526 = distinct !DILexicalBlock(scope: !520, file: !483, line: 20, column: 5)
!527 = !DILocation(line: 20, column: 5, scope: !520, inlinedAt: !510)
!528 = !DILocation(line: 21, column: 9, scope: !529, inlinedAt: !510)
!529 = distinct !DILexicalBlock(scope: !530, file: !483, line: 21, column: 9)
!530 = distinct !DILexicalBlock(scope: !526, file: !483, line: 20, column: 43)
!531 = !DILocation(line: 50, column: 5, scope: !532, inlinedAt: !536)
!532 = distinct !DILexicalBlock(scope: !533, file: !483, line: 50, column: 5)
!533 = distinct !DISubprogram(name: "mul_add_mat_trans_x_m_mat", scope: !483, file: !483, line: 47, type: !534, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!534 = !DISubroutineType(types: !535)
!535 = !{null, !275, !90, !486, !52, !275, !275, !275}
!536 = distinct !DILocation(line: 270, column: 5, scope: !482, inlinedAt: !488)
!537 = !DILocation(line: 21, scope: !529, inlinedAt: !510)
!538 = !DILocalVariable(name: "c", scope: !529, file: !483, line: 21, type: !86)
!539 = !DILocation(line: 0, scope: !529, inlinedAt: !510)
!540 = !DILocation(line: 21, column: 40, scope: !541, inlinedAt: !510)
!541 = distinct !DILexicalBlock(scope: !529, file: !483, line: 21, column: 9)
!542 = !DILocation(line: 22, column: 13, scope: !543, inlinedAt: !510)
!543 = distinct !DILexicalBlock(scope: !544, file: !483, line: 22, column: 13)
!544 = distinct !DILexicalBlock(scope: !541, file: !483, line: 21, column: 60)
!545 = !DILocation(line: 22, scope: !543, inlinedAt: !510)
!546 = !DILocalVariable(name: "k", scope: !543, file: !483, line: 22, type: !86)
!547 = !DILocation(line: 0, scope: !543, inlinedAt: !510)
!548 = !DILocation(line: 22, column: 31, scope: !549, inlinedAt: !510)
!549 = distinct !DILexicalBlock(scope: !543, file: !483, line: 22, column: 13)
!550 = !DILocation(line: 23, column: 51, scope: !551, inlinedAt: !510)
!551 = distinct !DILexicalBlock(scope: !549, file: !483, line: 22, column: 51)
!552 = !DILocation(line: 23, column: 94, scope: !551, inlinedAt: !510)
!553 = !DILocation(line: 23, column: 88, scope: !551, inlinedAt: !510)
!554 = !DILocation(line: 23, column: 134, scope: !551, inlinedAt: !510)
!555 = !DILocation(line: 23, column: 145, scope: !551, inlinedAt: !510)
!556 = !DILocation(line: 23, column: 115, scope: !551, inlinedAt: !510)
!557 = !DILocation(line: 23, column: 17, scope: !551, inlinedAt: !510)
!558 = !DILocation(line: 22, column: 45, scope: !549, inlinedAt: !510)
!559 = !DILocation(line: 22, column: 13, scope: !549, inlinedAt: !510)
!560 = distinct !{!560, !542, !561, !298}
!561 = !DILocation(line: 24, column: 13, scope: !543, inlinedAt: !510)
!562 = !DILocation(line: 25, column: 33, scope: !544, inlinedAt: !510)
!563 = !DILocation(line: 21, column: 56, scope: !541, inlinedAt: !510)
!564 = !DILocation(line: 21, column: 9, scope: !541, inlinedAt: !510)
!565 = distinct !{!565, !528, !566, !298}
!566 = !DILocation(line: 26, column: 9, scope: !529, inlinedAt: !510)
!567 = !DILocation(line: 20, column: 39, scope: !526, inlinedAt: !510)
!568 = !DILocation(line: 20, column: 5, scope: !526, inlinedAt: !510)
!569 = distinct !{!569, !527, !570, !298}
!570 = !DILocation(line: 27, column: 5, scope: !520, inlinedAt: !510)
!571 = !DILocation(line: 50, scope: !532, inlinedAt: !536)
!572 = !DILocalVariable(name: "r", scope: !532, file: !483, line: 50, type: !86)
!573 = !DILocation(line: 0, scope: !532, inlinedAt: !536)
!574 = !DILocation(line: 50, column: 23, scope: !575, inlinedAt: !536)
!575 = distinct !DILexicalBlock(scope: !532, file: !483, line: 50, column: 5)
!576 = !DILocation(line: 51, column: 9, scope: !577, inlinedAt: !536)
!577 = distinct !DILexicalBlock(scope: !578, file: !483, line: 51, column: 9)
!578 = distinct !DILexicalBlock(scope: !575, file: !483, line: 50, column: 40)
!579 = !DILocation(line: 51, scope: !577, inlinedAt: !536)
!580 = !DILocalVariable(name: "c", scope: !577, file: !483, line: 51, type: !86)
!581 = !DILocation(line: 0, scope: !577, inlinedAt: !536)
!582 = !DILocation(line: 51, column: 27, scope: !583, inlinedAt: !536)
!583 = distinct !DILexicalBlock(scope: !577, file: !483, line: 51, column: 9)
!584 = !DILocation(line: 52, column: 13, scope: !585, inlinedAt: !536)
!585 = distinct !DILexicalBlock(scope: !586, file: !483, line: 52, column: 13)
!586 = distinct !DILexicalBlock(scope: !583, file: !483, line: 51, column: 44)
!587 = !DILocation(line: 52, scope: !585, inlinedAt: !536)
!588 = !DILocalVariable(name: "k", scope: !585, file: !483, line: 52, type: !86)
!589 = !DILocation(line: 0, scope: !585, inlinedAt: !536)
!590 = !DILocation(line: 52, column: 31, scope: !591, inlinedAt: !536)
!591 = distinct !DILexicalBlock(scope: !585, file: !483, line: 52, column: 13)
!592 = !DILocation(line: 53, column: 70, scope: !593, inlinedAt: !536)
!593 = distinct !DILexicalBlock(scope: !591, file: !483, line: 52, column: 54)
!594 = !DILocation(line: 53, column: 84, scope: !593, inlinedAt: !536)
!595 = !DILocation(line: 53, column: 51, scope: !593, inlinedAt: !536)
!596 = !DILocation(line: 53, column: 96, scope: !593, inlinedAt: !536)
!597 = !DILocation(line: 53, column: 90, scope: !593, inlinedAt: !536)
!598 = !DILocation(line: 53, column: 136, scope: !593, inlinedAt: !536)
!599 = !DILocation(line: 53, column: 150, scope: !593, inlinedAt: !536)
!600 = !DILocation(line: 53, column: 117, scope: !593, inlinedAt: !536)
!601 = !DILocation(line: 53, column: 17, scope: !593, inlinedAt: !536)
!602 = !DILocation(line: 52, column: 48, scope: !591, inlinedAt: !536)
!603 = !DILocation(line: 52, column: 13, scope: !591, inlinedAt: !536)
!604 = distinct !{!604, !584, !605, !298}
!605 = !DILocation(line: 54, column: 13, scope: !585, inlinedAt: !536)
!606 = !DILocation(line: 51, column: 40, scope: !583, inlinedAt: !536)
!607 = !DILocation(line: 51, column: 9, scope: !583, inlinedAt: !536)
!608 = distinct !{!608, !576, !609, !298}
!609 = !DILocation(line: 55, column: 9, scope: !577, inlinedAt: !536)
!610 = !DILocation(line: 50, column: 36, scope: !575, inlinedAt: !536)
!611 = !DILocation(line: 50, column: 5, scope: !575, inlinedAt: !536)
!612 = distinct !{!612, !531, !613, !298}
!613 = !DILocation(line: 56, column: 5, scope: !532, inlinedAt: !536)
!614 = !DILocation(line: 591, column: 5, scope: !392)
!615 = !DILocalVariable(name: "P3_upper", scope: !392, file: !68, line: 593, type: !616)
!616 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 24640, elements: !617)
!617 = !{!618}
!618 = !DISubrange(count: 385)
!619 = !DILocation(line: 593, column: 14, scope: !392)
!620 = !DILocation(line: 596, column: 5, scope: !392)
!621 = !DILocation(line: 597, column: 31, scope: !392)
!622 = !DILocalVariable(name: "in", arg: 1, scope: !623, file: !68, line: 272, type: !486)
!623 = distinct !DISubprogram(name: "pack_m_vecs", scope: !68, file: !68, line: 272, type: !624, scopeLine: 272, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!624 = !DISubroutineType(types: !625)
!625 = !{null, !486, !61, !86, !86}
!626 = !DILocation(line: 0, scope: !623, inlinedAt: !627)
!627 = distinct !DILocation(line: 597, column: 5, scope: !392)
!628 = !DILocalVariable(name: "out", arg: 2, scope: !623, file: !68, line: 272, type: !61)
!629 = !DILocalVariable(name: "vecs", arg: 3, scope: !623, file: !68, line: 272, type: !86)
!630 = !DILocalVariable(name: "m", arg: 4, scope: !623, file: !68, line: 272, type: !86)
!631 = !DILocalVariable(name: "m_vec_limbs", scope: !623, file: !68, line: 273, type: !275)
!632 = !DILocalVariable(name: "_in", scope: !623, file: !68, line: 274, type: !61)
!633 = !DILocalVariable(name: "i", scope: !634, file: !68, line: 275, type: !86)
!634 = distinct !DILexicalBlock(scope: !623, file: !68, line: 275, column: 5)
!635 = !DILocation(line: 0, scope: !634, inlinedAt: !627)
!636 = !DILocation(line: 275, column: 10, scope: !634, inlinedAt: !627)
!637 = !DILocation(line: 275, scope: !634, inlinedAt: !627)
!638 = !DILocation(line: 275, column: 23, scope: !639, inlinedAt: !627)
!639 = distinct !DILexicalBlock(scope: !634, file: !68, line: 275, column: 5)
!640 = !DILocation(line: 275, column: 5, scope: !634, inlinedAt: !627)
!641 = !DILocation(line: 277, column: 27, scope: !642, inlinedAt: !627)
!642 = distinct !DILexicalBlock(scope: !639, file: !68, line: 276, column: 5)
!643 = !DILocation(line: 277, column: 21, scope: !642, inlinedAt: !627)
!644 = !DILocation(line: 277, column: 51, scope: !642, inlinedAt: !627)
!645 = !DILocation(line: 277, column: 36, scope: !642, inlinedAt: !627)
!646 = !DILocation(line: 277, column: 9, scope: !642, inlinedAt: !627)
!647 = !DILocation(line: 275, column: 32, scope: !639, inlinedAt: !627)
!648 = !DILocation(line: 275, column: 5, scope: !639, inlinedAt: !627)
!649 = distinct !{!649, !640, !650, !298}
!650 = !DILocation(line: 278, column: 5, scope: !634, inlinedAt: !627)
!651 = !DILocation(line: 602, column: 5, scope: !392)
!652 = !DILabel(scope: !392, name: "err", file: !68, line: 600)
!653 = !DILocation(line: 600, column: 5, scope: !392)
!654 = !DILocation(line: 603, column: 5, scope: !392)
!655 = !DILocation(line: 604, column: 5, scope: !392)
!656 = !DILocation(line: 605, column: 5, scope: !392)
!657 = distinct !DISubprogram(name: "m_vec_mul_add", scope: !658, file: !658, line: 31, type: !659, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!658 = !DIFile(filename: "../../../src/generic/arithmetic_fixed.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!659 = !DISubroutineType(types: !660)
!660 = !{null, !86, !486, !51, !52}
!661 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !657, file: !658, line: 31, type: !86)
!662 = !DILocation(line: 0, scope: !657)
!663 = !DILocalVariable(name: "in", arg: 2, scope: !657, file: !658, line: 31, type: !486)
!664 = !DILocalVariable(name: "a", arg: 3, scope: !657, file: !658, line: 31, type: !51)
!665 = !DILocalVariable(name: "acc", arg: 4, scope: !657, file: !658, line: 31, type: !52)
!666 = !DILocalVariable(name: "b", arg: 1, scope: !667, file: !668, line: 128, type: !174)
!667 = distinct !DISubprogram(name: "mul_table", scope: !668, file: !668, line: 128, type: !669, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!668 = !DIFile(filename: "../../../src/simple_arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!669 = !DISubroutineType(types: !670)
!670 = !{!62, !174}
!671 = !DILocation(line: 0, scope: !667, inlinedAt: !672)
!672 = distinct !DILocation(line: 33, column: 20, scope: !657)
!673 = !DILocation(line: 129, column: 19, scope: !667, inlinedAt: !672)
!674 = !DILocation(line: 129, column: 33, scope: !667, inlinedAt: !672)
!675 = !DILocalVariable(name: "x", scope: !667, file: !668, line: 129, type: !62)
!676 = !DILocalVariable(name: "high_nibble_mask", scope: !667, file: !668, line: 131, type: !62)
!677 = !DILocation(line: 133, column: 28, scope: !667, inlinedAt: !672)
!678 = !DILocalVariable(name: "high_half", scope: !667, file: !668, line: 133, type: !62)
!679 = !DILocation(line: 134, column: 28, scope: !667, inlinedAt: !672)
!680 = !DILocation(line: 134, column: 47, scope: !667, inlinedAt: !672)
!681 = !DILocation(line: 134, column: 34, scope: !667, inlinedAt: !672)
!682 = !DILocalVariable(name: "tab", scope: !657, file: !658, line: 33, type: !62)
!683 = !DILocalVariable(name: "lsb_ask", scope: !657, file: !658, line: 35, type: !53)
!684 = !DILocalVariable(name: "i", scope: !685, file: !658, line: 37, type: !86)
!685 = distinct !DILexicalBlock(scope: !657, file: !658, line: 37, column: 5)
!686 = !DILocation(line: 0, scope: !685)
!687 = !DILocation(line: 37, column: 9, scope: !685)
!688 = !DILocation(line: 37, scope: !685)
!689 = !DILocation(line: 37, column: 20, scope: !690)
!690 = distinct !DILexicalBlock(scope: !685, file: !658, line: 37, column: 5)
!691 = !DILocation(line: 37, column: 5, scope: !685)
!692 = !DILocation(line: 38, column: 21, scope: !693)
!693 = distinct !DILexicalBlock(scope: !690, file: !658, line: 37, column: 43)
!694 = !DILocation(line: 38, column: 33, scope: !693)
!695 = !DILocation(line: 38, column: 51, scope: !693)
!696 = !DILocation(line: 38, column: 46, scope: !693)
!697 = !DILocation(line: 38, column: 44, scope: !693)
!698 = !DILocation(line: 39, column: 27, scope: !693)
!699 = !DILocation(line: 39, column: 33, scope: !693)
!700 = !DILocation(line: 39, column: 52, scope: !693)
!701 = !DILocation(line: 39, column: 59, scope: !693)
!702 = !DILocation(line: 39, column: 46, scope: !693)
!703 = !DILocation(line: 39, column: 44, scope: !693)
!704 = !DILocation(line: 39, column: 17, scope: !693)
!705 = !DILocation(line: 40, column: 21, scope: !693)
!706 = !DILocation(line: 40, column: 27, scope: !693)
!707 = !DILocation(line: 40, column: 33, scope: !693)
!708 = !DILocation(line: 40, column: 52, scope: !693)
!709 = !DILocation(line: 40, column: 59, scope: !693)
!710 = !DILocation(line: 40, column: 46, scope: !693)
!711 = !DILocation(line: 40, column: 44, scope: !693)
!712 = !DILocation(line: 40, column: 17, scope: !693)
!713 = !DILocation(line: 41, column: 21, scope: !693)
!714 = !DILocation(line: 41, column: 27, scope: !693)
!715 = !DILocation(line: 41, column: 33, scope: !693)
!716 = !DILocation(line: 41, column: 52, scope: !693)
!717 = !DILocation(line: 41, column: 59, scope: !693)
!718 = !DILocation(line: 41, column: 46, scope: !693)
!719 = !DILocation(line: 41, column: 44, scope: !693)
!720 = !DILocation(line: 41, column: 17, scope: !693)
!721 = !DILocation(line: 38, column: 9, scope: !693)
!722 = !DILocation(line: 38, column: 16, scope: !693)
!723 = !DILocation(line: 37, column: 40, scope: !690)
!724 = !DILocation(line: 37, column: 5, scope: !690)
!725 = distinct !{!725, !691, !726, !298}
!726 = !DILocation(line: 42, column: 5, scope: !685)
!727 = !DILocation(line: 43, column: 1, scope: !657)
!728 = distinct !DISubprogram(name: "pqmayo_MAYO_3_ref_mayo_expand_sk", scope: !68, file: !68, line: 310, type: !729, scopeLine: 311, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!729 = !DISubroutineType(types: !730)
!730 = !{!86, !193, !90, !731}
!731 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !732, size: 32)
!732 = !DIDerivedType(tag: DW_TAG_typedef, name: "sk_t", file: !79, line: 294, baseType: !733)
!733 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sk_t", file: !79, line: 291, size: 3129408, elements: !734)
!734 = !{!735, !736}
!735 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !733, file: !79, line: 292, baseType: !169, size: 3120768)
!736 = !DIDerivedType(tag: DW_TAG_member, name: "O", scope: !733, file: !79, line: 293, baseType: !173, size: 8640, offset: 3120768)
!737 = !DILocalVariable(name: "p", arg: 1, scope: !728, file: !68, line: 310, type: !193)
!738 = !DILocation(line: 0, scope: !728)
!739 = !DILocalVariable(name: "csk", arg: 2, scope: !728, file: !68, line: 310, type: !90)
!740 = !DILocalVariable(name: "sk", arg: 3, scope: !728, file: !68, line: 311, type: !731)
!741 = !DILocalVariable(name: "ret", scope: !728, file: !68, line: 312, type: !86)
!742 = !DILocalVariable(name: "S", scope: !728, file: !68, line: 313, type: !400)
!743 = !DILocation(line: 313, column: 19, scope: !728)
!744 = !DILocalVariable(name: "P", scope: !728, file: !68, line: 314, type: !52)
!745 = !DILocation(line: 315, column: 28, scope: !728)
!746 = !DILocalVariable(name: "O", scope: !728, file: !68, line: 315, type: !61)
!747 = !DILocalVariable(name: "param_o", scope: !728, file: !68, line: 317, type: !275)
!748 = !DILocalVariable(name: "param_v", scope: !728, file: !68, line: 318, type: !275)
!749 = !DILocalVariable(name: "param_O_bytes", scope: !728, file: !68, line: 319, type: !275)
!750 = !DILocalVariable(name: "param_pk_seed_bytes", scope: !728, file: !68, line: 320, type: !275)
!751 = !DILocalVariable(name: "param_sk_seed_bytes", scope: !728, file: !68, line: 321, type: !275)
!752 = !DILocalVariable(name: "seed_sk", scope: !728, file: !68, line: 323, type: !90)
!753 = !DILocalVariable(name: "seed_pk", scope: !728, file: !68, line: 324, type: !61)
!754 = !DILocation(line: 326, column: 5, scope: !728)
!755 = !DILocation(line: 328, column: 14, scope: !728)
!756 = !DILocation(line: 0, scope: !433, inlinedAt: !757)
!757 = distinct !DILocation(line: 328, column: 5, scope: !728)
!758 = !DILocation(line: 22, column: 10, scope: !442, inlinedAt: !757)
!759 = !DILocation(line: 22, scope: !442, inlinedAt: !757)
!760 = !DILocation(line: 22, column: 19, scope: !445, inlinedAt: !757)
!761 = !DILocation(line: 22, column: 5, scope: !442, inlinedAt: !757)
!762 = !DILocation(line: 23, column: 19, scope: !448, inlinedAt: !757)
!763 = !DILocation(line: 23, column: 24, scope: !448, inlinedAt: !757)
!764 = !DILocation(line: 23, column: 14, scope: !448, inlinedAt: !757)
!765 = !DILocation(line: 23, column: 17, scope: !448, inlinedAt: !757)
!766 = !DILocation(line: 24, column: 24, scope: !448, inlinedAt: !757)
!767 = !DILocation(line: 24, column: 17, scope: !448, inlinedAt: !757)
!768 = !DILocation(line: 24, column: 14, scope: !448, inlinedAt: !757)
!769 = !DILocation(line: 22, column: 34, scope: !445, inlinedAt: !757)
!770 = !DILocation(line: 22, column: 5, scope: !445, inlinedAt: !757)
!771 = distinct !{!771, !761, !772, !298}
!772 = !DILocation(line: 25, column: 5, scope: !442, inlinedAt: !757)
!773 = !DILocation(line: 0, scope: !256, inlinedAt: !774)
!774 = distinct !DILocation(line: 334, column: 5, scope: !728)
!775 = !DILocation(line: 284, column: 5, scope: !256, inlinedAt: !774)
!776 = !DILocation(line: 265, column: 14, scope: !265, inlinedAt: !777)
!777 = distinct !DILocation(line: 285, column: 5, scope: !256, inlinedAt: !774)
!778 = !DILocation(line: 0, scope: !265, inlinedAt: !777)
!779 = !DILocation(line: 0, scope: !280, inlinedAt: !777)
!780 = !DILocation(line: 266, column: 10, scope: !280, inlinedAt: !777)
!781 = !DILocation(line: 266, column: 28, scope: !284, inlinedAt: !777)
!782 = !DILocation(line: 266, column: 5, scope: !280, inlinedAt: !777)
!783 = !DILocation(line: 266, scope: !280, inlinedAt: !777)
!784 = !DILocation(line: 268, column: 27, scope: !288, inlinedAt: !777)
!785 = !DILocation(line: 268, column: 29, scope: !288, inlinedAt: !777)
!786 = !DILocation(line: 268, column: 24, scope: !288, inlinedAt: !777)
!787 = !DILocation(line: 268, column: 9, scope: !288, inlinedAt: !777)
!788 = !DILocation(line: 269, column: 36, scope: !288, inlinedAt: !777)
!789 = !DILocation(line: 269, column: 21, scope: !288, inlinedAt: !777)
!790 = !DILocation(line: 269, column: 9, scope: !288, inlinedAt: !777)
!791 = !DILocation(line: 266, column: 5, scope: !284, inlinedAt: !777)
!792 = distinct !{!792, !782, !793, !298}
!793 = !DILocation(line: 270, column: 5, scope: !280, inlinedAt: !777)
!794 = !DILocation(line: 271, column: 1, scope: !265, inlinedAt: !777)
!795 = !DILocation(line: 341, column: 22, scope: !728)
!796 = !DILocalVariable(name: "P2", scope: !728, file: !68, line: 341, type: !52)
!797 = !DILocalVariable(name: "P1", scope: !728, file: !68, line: 343, type: !52)
!798 = !DILocalVariable(name: "L", scope: !728, file: !68, line: 346, type: !52)
!799 = !DILocalVariable(name: "p", arg: 1, scope: !800, file: !483, line: 218, type: !193)
!800 = distinct !DISubprogram(name: "P1P1t_times_O", scope: !483, file: !483, line: 218, type: !498, scopeLine: 218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!801 = !DILocation(line: 0, scope: !800, inlinedAt: !802)
!802 = distinct !DILocation(line: 347, column: 5, scope: !728)
!803 = !DILocalVariable(name: "P1", arg: 2, scope: !800, file: !483, line: 218, type: !486)
!804 = !DILocalVariable(name: "O", arg: 3, scope: !800, file: !483, line: 218, type: !90)
!805 = !DILocalVariable(name: "acc", arg: 4, scope: !800, file: !483, line: 218, type: !52)
!806 = !DILocalVariable(name: "param_o", scope: !800, file: !483, line: 222, type: !275)
!807 = !DILocalVariable(name: "param_v", scope: !800, file: !483, line: 223, type: !275)
!808 = !DILocalVariable(name: "m_vec_limbs", scope: !800, file: !483, line: 224, type: !275)
!809 = !DILocalVariable(name: "bs_mat_entries_used", scope: !800, file: !483, line: 226, type: !86)
!810 = !DILocalVariable(name: "r", scope: !811, file: !483, line: 227, type: !86)
!811 = distinct !DILexicalBlock(scope: !800, file: !483, line: 227, column: 5)
!812 = !DILocation(line: 0, scope: !811, inlinedAt: !802)
!813 = !DILocation(line: 227, column: 10, scope: !811, inlinedAt: !802)
!814 = !DILocation(line: 226, column: 9, scope: !800, inlinedAt: !802)
!815 = !DILocation(line: 227, scope: !811, inlinedAt: !802)
!816 = !DILocation(line: 227, column: 23, scope: !817, inlinedAt: !802)
!817 = distinct !DILexicalBlock(scope: !811, file: !483, line: 227, column: 5)
!818 = !DILocation(line: 227, column: 5, scope: !811, inlinedAt: !802)
!819 = !DILocation(line: 228, column: 9, scope: !820, inlinedAt: !802)
!820 = distinct !DILexicalBlock(scope: !821, file: !483, line: 228, column: 9)
!821 = distinct !DILexicalBlock(scope: !817, file: !483, line: 227, column: 39)
!822 = !DILocation(line: 228, scope: !820, inlinedAt: !802)
!823 = !DILocalVariable(name: "c", scope: !820, file: !483, line: 228, type: !86)
!824 = !DILocation(line: 0, scope: !820, inlinedAt: !802)
!825 = !DILocation(line: 228, column: 27, scope: !826, inlinedAt: !802)
!826 = distinct !DILexicalBlock(scope: !820, file: !483, line: 228, column: 9)
!827 = !DILocation(line: 229, column: 17, scope: !828, inlinedAt: !802)
!828 = distinct !DILexicalBlock(scope: !829, file: !483, line: 229, column: 16)
!829 = distinct !DILexicalBlock(scope: !826, file: !483, line: 228, column: 43)
!830 = !DILocation(line: 233, column: 13, scope: !831, inlinedAt: !802)
!831 = distinct !DILexicalBlock(scope: !829, file: !483, line: 233, column: 13)
!832 = !DILocation(line: 233, scope: !831, inlinedAt: !802)
!833 = !DILocalVariable(name: "k", scope: !831, file: !483, line: 233, type: !86)
!834 = !DILocation(line: 0, scope: !831, inlinedAt: !802)
!835 = !DILocation(line: 233, column: 31, scope: !836, inlinedAt: !802)
!836 = distinct !DILexicalBlock(scope: !831, file: !483, line: 233, column: 13)
!837 = !DILocation(line: 234, column: 47, scope: !838, inlinedAt: !802)
!838 = distinct !DILexicalBlock(scope: !836, file: !483, line: 233, column: 50)
!839 = !DILocation(line: 234, column: 88, scope: !838, inlinedAt: !802)
!840 = !DILocation(line: 234, column: 84, scope: !838, inlinedAt: !802)
!841 = !DILocation(line: 234, column: 127, scope: !838, inlinedAt: !802)
!842 = !DILocation(line: 234, column: 137, scope: !838, inlinedAt: !802)
!843 = !DILocation(line: 234, column: 108, scope: !838, inlinedAt: !802)
!844 = !DILocation(line: 234, column: 17, scope: !838, inlinedAt: !802)
!845 = !DILocation(line: 235, column: 47, scope: !838, inlinedAt: !802)
!846 = !DILocation(line: 235, column: 88, scope: !838, inlinedAt: !802)
!847 = !DILocation(line: 235, column: 84, scope: !838, inlinedAt: !802)
!848 = !DILocation(line: 235, column: 127, scope: !838, inlinedAt: !802)
!849 = !DILocation(line: 235, column: 137, scope: !838, inlinedAt: !802)
!850 = !DILocation(line: 235, column: 108, scope: !838, inlinedAt: !802)
!851 = !DILocation(line: 235, column: 17, scope: !838, inlinedAt: !802)
!852 = !DILocation(line: 233, column: 44, scope: !836, inlinedAt: !802)
!853 = !DILocation(line: 233, column: 13, scope: !836, inlinedAt: !802)
!854 = distinct !{!854, !830, !855, !298}
!855 = !DILocation(line: 236, column: 13, scope: !831, inlinedAt: !802)
!856 = !DILocation(line: 0, scope: !829, inlinedAt: !802)
!857 = !DILocation(line: 228, column: 39, scope: !826, inlinedAt: !802)
!858 = !DILocation(line: 228, column: 9, scope: !826, inlinedAt: !802)
!859 = distinct !{!859, !819, !860, !298}
!860 = !DILocation(line: 238, column: 9, scope: !820, inlinedAt: !802)
!861 = !DILocation(line: 227, column: 35, scope: !817, inlinedAt: !802)
!862 = !DILocation(line: 227, column: 5, scope: !817, inlinedAt: !802)
!863 = distinct !{!863, !818, !864, !298}
!864 = !DILocation(line: 239, column: 5, scope: !811, inlinedAt: !802)
!865 = !DILocation(line: 355, column: 5, scope: !728)
!866 = !DILocation(line: 356, column: 5, scope: !728)
!867 = distinct !DISubprogram(name: "pqmayo_MAYO_3_ref_mayo_sign_signature", scope: !68, file: !68, line: 359, type: !337, scopeLine: 361, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!868 = !DILocalVariable(name: "p", arg: 1, scope: !867, file: !68, line: 359, type: !193)
!869 = !DILocation(line: 0, scope: !867)
!870 = !DILocalVariable(name: "sig", arg: 2, scope: !867, file: !68, line: 359, type: !61)
!871 = !DILocalVariable(name: "siglen", arg: 3, scope: !867, file: !68, line: 360, type: !339)
!872 = !DILocalVariable(name: "m", arg: 4, scope: !867, file: !68, line: 360, type: !90)
!873 = !DILocalVariable(name: "mlen", arg: 5, scope: !867, file: !68, line: 361, type: !58)
!874 = !DILocalVariable(name: "csk", arg: 6, scope: !867, file: !68, line: 361, type: !90)
!875 = !DILocalVariable(name: "ret", scope: !867, file: !68, line: 362, type: !86)
!876 = !DILocalVariable(name: "tenc", scope: !867, file: !68, line: 363, type: !877)
!877 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 432, elements: !878)
!878 = !{!879}
!879 = !DISubrange(count: 54)
!880 = !DILocation(line: 363, column: 19, scope: !867)
!881 = !DILocalVariable(name: "t", scope: !867, file: !68, line: 363, type: !882)
!882 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 864, elements: !883)
!883 = !{!884}
!884 = !DISubrange(count: 108)
!885 = !DILocation(line: 363, column: 38, scope: !867)
!886 = !DILocalVariable(name: "y", scope: !867, file: !68, line: 364, type: !882)
!887 = !DILocation(line: 364, column: 19, scope: !867)
!888 = !DILocalVariable(name: "salt", scope: !867, file: !68, line: 365, type: !181)
!889 = !DILocation(line: 365, column: 19, scope: !867)
!890 = !DILocalVariable(name: "V", scope: !867, file: !68, line: 366, type: !891)
!891 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 5192, elements: !892)
!892 = !{!893}
!893 = !DISubrange(count: 649)
!894 = !DILocation(line: 366, column: 19, scope: !867)
!895 = !DILocalVariable(name: "Vdec", scope: !867, file: !68, line: 366, type: !896)
!896 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 9504, elements: !897)
!897 = !{!898}
!898 = !DISubrange(count: 1188)
!899 = !DILocation(line: 366, column: 57, scope: !867)
!900 = !DILocalVariable(name: "A", scope: !867, file: !68, line: 367, type: !901)
!901 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 99456, elements: !902)
!902 = !{!903}
!903 = !DISubrange(count: 12432)
!904 = !DILocation(line: 367, column: 19, scope: !867)
!905 = !DILocalVariable(name: "x", scope: !867, file: !68, line: 368, type: !906)
!906 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 10384, elements: !907)
!907 = !{!908}
!908 = !DISubrange(count: 1298)
!909 = !DILocation(line: 368, column: 19, scope: !867)
!910 = !DILocalVariable(name: "r", scope: !867, file: !68, line: 369, type: !911)
!911 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 888, elements: !912)
!912 = !{!913}
!913 = !DISubrange(count: 111)
!914 = !DILocation(line: 369, column: 19, scope: !867)
!915 = !DILocalVariable(name: "s", scope: !867, file: !68, line: 370, type: !906)
!916 = !DILocation(line: 370, column: 19, scope: !867)
!917 = !DILocalVariable(name: "sk", scope: !867, file: !68, line: 372, type: !732, align: 256)
!918 = !DILocation(line: 372, column: 22, scope: !867)
!919 = !DILocalVariable(name: "Ox", scope: !867, file: !68, line: 373, type: !882)
!920 = !DILocation(line: 373, column: 19, scope: !867)
!921 = !DILocalVariable(name: "tmp", scope: !867, file: !68, line: 374, type: !922)
!922 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 904, elements: !923)
!923 = !{!924}
!924 = !DISubrange(count: 113)
!925 = !DILocation(line: 374, column: 19, scope: !867)
!926 = !DILocalVariable(name: "param_m", scope: !867, file: !68, line: 378, type: !275)
!927 = !DILocalVariable(name: "param_n", scope: !867, file: !68, line: 379, type: !275)
!928 = !DILocalVariable(name: "param_o", scope: !867, file: !68, line: 380, type: !275)
!929 = !DILocalVariable(name: "param_k", scope: !867, file: !68, line: 381, type: !275)
!930 = !DILocalVariable(name: "param_v", scope: !867, file: !68, line: 382, type: !275)
!931 = !DILocalVariable(name: "param_m_bytes", scope: !867, file: !68, line: 383, type: !275)
!932 = !DILocalVariable(name: "param_v_bytes", scope: !867, file: !68, line: 384, type: !275)
!933 = !DILocalVariable(name: "param_r_bytes", scope: !867, file: !68, line: 385, type: !275)
!934 = !DILocalVariable(name: "param_sig_bytes", scope: !867, file: !68, line: 386, type: !275)
!935 = !DILocalVariable(name: "param_A_cols", scope: !867, file: !68, line: 387, type: !275)
!936 = !DILocalVariable(name: "param_digest_bytes", scope: !867, file: !68, line: 388, type: !275)
!937 = !DILocalVariable(name: "param_sk_seed_bytes", scope: !867, file: !68, line: 389, type: !275)
!938 = !DILocalVariable(name: "param_salt_bytes", scope: !867, file: !68, line: 390, type: !275)
!939 = !DILocation(line: 392, column: 11, scope: !867)
!940 = !DILocation(line: 393, column: 13, scope: !941)
!941 = distinct !DILexicalBlock(scope: !867, file: !68, line: 393, column: 9)
!942 = !DILocalVariable(name: "seed_sk", scope: !867, file: !68, line: 371, type: !90)
!943 = !DILocation(line: 401, column: 5, scope: !867)
!944 = !DILocalVariable(name: "P1", scope: !867, file: !68, line: 403, type: !52)
!945 = !DILocation(line: 404, column: 23, scope: !867)
!946 = !DILocalVariable(name: "L", scope: !867, file: !68, line: 404, type: !52)
!947 = !DILocalVariable(name: "Mtmp", scope: !867, file: !68, line: 405, type: !948)
!948 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 49280, elements: !949)
!949 = !{!950}
!950 = !DISubrange(count: 770)
!951 = !DILocation(line: 405, column: 14, scope: !867)
!952 = !DILocation(line: 420, column: 25, scope: !953)
!953 = distinct !DILexicalBlock(scope: !867, file: !68, line: 420, column: 9)
!954 = !DILocation(line: 420, column: 9, scope: !953)
!955 = !DILocation(line: 420, column: 65, scope: !953)
!956 = !DILocation(line: 427, column: 37, scope: !867)
!957 = !DILocation(line: 427, column: 5, scope: !867)
!958 = !DILocation(line: 429, column: 5, scope: !867)
!959 = !DILocation(line: 437, column: 16, scope: !867)
!960 = !DILocation(line: 437, column: 5, scope: !867)
!961 = !DILocalVariable(name: "ctrbyte", scope: !867, file: !68, line: 375, type: !61)
!962 = !DILocation(line: 440, column: 5, scope: !867)
!963 = !DILocation(line: 0, scope: !433, inlinedAt: !964)
!964 = distinct !DILocation(line: 442, column: 5, scope: !867)
!965 = !DILocation(line: 22, column: 10, scope: !442, inlinedAt: !964)
!966 = !DILocation(line: 22, scope: !442, inlinedAt: !964)
!967 = !DILocation(line: 22, column: 19, scope: !445, inlinedAt: !964)
!968 = !DILocation(line: 22, column: 5, scope: !442, inlinedAt: !964)
!969 = !DILocation(line: 438, column: 59, scope: !867)
!970 = !DILocation(line: 444, column: 5, scope: !971)
!971 = distinct !DILexicalBlock(scope: !867, file: !68, line: 444, column: 5)
!972 = !DILocation(line: 23, column: 19, scope: !448, inlinedAt: !964)
!973 = !DILocation(line: 23, column: 24, scope: !448, inlinedAt: !964)
!974 = !DILocation(line: 23, column: 14, scope: !448, inlinedAt: !964)
!975 = !DILocation(line: 23, column: 17, scope: !448, inlinedAt: !964)
!976 = !DILocation(line: 24, column: 24, scope: !448, inlinedAt: !964)
!977 = !DILocation(line: 24, column: 17, scope: !448, inlinedAt: !964)
!978 = !DILocation(line: 24, column: 14, scope: !448, inlinedAt: !964)
!979 = !DILocation(line: 22, column: 34, scope: !445, inlinedAt: !964)
!980 = !DILocation(line: 22, column: 5, scope: !445, inlinedAt: !964)
!981 = distinct !{!981, !968, !982, !298}
!982 = !DILocation(line: 25, column: 5, scope: !442, inlinedAt: !964)
!983 = !DILocation(line: 444, scope: !971)
!984 = !DILocalVariable(name: "ctr", scope: !971, file: !68, line: 444, type: !86)
!985 = !DILocation(line: 0, scope: !971)
!986 = !DILocation(line: 444, column: 27, scope: !987)
!987 = distinct !DILexicalBlock(scope: !971, file: !68, line: 444, column: 5)
!988 = !DILocation(line: 445, column: 20, scope: !989)
!989 = distinct !DILexicalBlock(scope: !987, file: !68, line: 444, column: 42)
!990 = !DILocation(line: 445, column: 18, scope: !989)
!991 = !DILocation(line: 447, column: 9, scope: !989)
!992 = !DILocalVariable(name: "i", scope: !993, file: !68, line: 451, type: !86)
!993 = distinct !DILexicalBlock(scope: !989, file: !68, line: 451, column: 9)
!994 = !DILocation(line: 0, scope: !993)
!995 = !DILocation(line: 451, column: 14, scope: !993)
!996 = !DILocation(line: 451, scope: !993)
!997 = !DILocation(line: 451, column: 27, scope: !998)
!998 = distinct !DILexicalBlock(scope: !993, file: !68, line: 451, column: 9)
!999 = !DILocation(line: 451, column: 9, scope: !993)
!1000 = !DILocation(line: 452, column: 26, scope: !1001)
!1001 = distinct !DILexicalBlock(scope: !998, file: !68, line: 451, column: 48)
!1002 = !DILocation(line: 452, column: 22, scope: !1001)
!1003 = !DILocation(line: 452, column: 52, scope: !1001)
!1004 = !DILocation(line: 452, column: 48, scope: !1001)
!1005 = !DILocation(line: 0, scope: !433, inlinedAt: !1006)
!1006 = distinct !DILocation(line: 452, column: 13, scope: !1001)
!1007 = !DILocation(line: 22, column: 10, scope: !442, inlinedAt: !1006)
!1008 = !DILocation(line: 22, scope: !442, inlinedAt: !1006)
!1009 = !DILocation(line: 22, column: 19, scope: !445, inlinedAt: !1006)
!1010 = !DILocation(line: 22, column: 5, scope: !442, inlinedAt: !1006)
!1011 = !DILocation(line: 23, column: 19, scope: !448, inlinedAt: !1006)
!1012 = !DILocation(line: 23, column: 24, scope: !448, inlinedAt: !1006)
!1013 = !DILocation(line: 23, column: 14, scope: !448, inlinedAt: !1006)
!1014 = !DILocation(line: 23, column: 17, scope: !448, inlinedAt: !1006)
!1015 = !DILocation(line: 24, column: 24, scope: !448, inlinedAt: !1006)
!1016 = !DILocation(line: 24, column: 17, scope: !448, inlinedAt: !1006)
!1017 = !DILocation(line: 24, column: 14, scope: !448, inlinedAt: !1006)
!1018 = !DILocation(line: 22, column: 34, scope: !445, inlinedAt: !1006)
!1019 = !DILocation(line: 22, column: 5, scope: !445, inlinedAt: !1006)
!1020 = distinct !{!1020, !1010, !1021, !298}
!1021 = !DILocation(line: 25, column: 5, scope: !442, inlinedAt: !1006)
!1022 = !DILocation(line: 451, column: 43, scope: !998)
!1023 = !DILocation(line: 451, column: 9, scope: !998)
!1024 = distinct !{!1024, !999, !1025, !298}
!1025 = !DILocation(line: 453, column: 9, scope: !993)
!1026 = !DILocation(line: 251, column: 5, scope: !1027, inlinedAt: !1030)
!1027 = distinct !DISubprogram(name: "compute_M_and_VPV", scope: !483, file: !483, line: 244, type: !1028, scopeLine: 244, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1028 = !DISubroutineType(types: !1029)
!1029 = !{null, !193, !90, !486, !486, !52, !52}
!1030 = distinct !DILocation(line: 456, column: 9, scope: !989)
!1031 = !DILocalVariable(name: "p", arg: 1, scope: !1027, file: !483, line: 244, type: !193)
!1032 = !DILocation(line: 0, scope: !1027, inlinedAt: !1030)
!1033 = !DILocalVariable(name: "Vdec", arg: 2, scope: !1027, file: !483, line: 244, type: !90)
!1034 = !DILocalVariable(name: "L", arg: 3, scope: !1027, file: !483, line: 244, type: !486)
!1035 = !DILocalVariable(name: "P1", arg: 4, scope: !1027, file: !483, line: 244, type: !486)
!1036 = !DILocalVariable(name: "VL", arg: 5, scope: !1027, file: !483, line: 244, type: !52)
!1037 = !DILocalVariable(name: "VP1V", arg: 6, scope: !1027, file: !483, line: 244, type: !52)
!1038 = !DILocalVariable(name: "param_k", scope: !1027, file: !483, line: 246, type: !275)
!1039 = !DILocalVariable(name: "param_v", scope: !1027, file: !483, line: 247, type: !275)
!1040 = !DILocalVariable(name: "param_o", scope: !1027, file: !483, line: 248, type: !275)
!1041 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !1042, file: !483, line: 61, type: !275)
!1042 = distinct !DISubprogram(name: "mul_add_mat_x_m_mat", scope: !483, file: !483, line: 61, type: !534, scopeLine: 62, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1043 = !DILocation(line: 0, scope: !1042, inlinedAt: !1044)
!1044 = distinct !DILocation(line: 251, column: 5, scope: !1027, inlinedAt: !1030)
!1045 = !DILocalVariable(name: "mat", arg: 2, scope: !1042, file: !483, line: 61, type: !90)
!1046 = !DILocalVariable(name: "bs_mat", arg: 3, scope: !1042, file: !483, line: 61, type: !486)
!1047 = !DILocalVariable(name: "acc", arg: 4, scope: !1042, file: !483, line: 61, type: !52)
!1048 = !DILocalVariable(name: "mat_rows", arg: 5, scope: !1042, file: !483, line: 62, type: !275)
!1049 = !DILocalVariable(name: "mat_cols", arg: 6, scope: !1042, file: !483, line: 62, type: !275)
!1050 = !DILocalVariable(name: "bs_mat_cols", arg: 7, scope: !1042, file: !483, line: 62, type: !275)
!1051 = !DILocalVariable(name: "r", scope: !1052, file: !483, line: 64, type: !86)
!1052 = distinct !DILexicalBlock(scope: !1042, file: !483, line: 64, column: 5)
!1053 = !DILocation(line: 0, scope: !1052, inlinedAt: !1044)
!1054 = !DILocation(line: 64, column: 10, scope: !1052, inlinedAt: !1044)
!1055 = !DILocation(line: 64, scope: !1052, inlinedAt: !1044)
!1056 = !DILocation(line: 64, column: 23, scope: !1057, inlinedAt: !1044)
!1057 = distinct !DILexicalBlock(scope: !1052, file: !483, line: 64, column: 5)
!1058 = !DILocation(line: 64, column: 5, scope: !1052, inlinedAt: !1044)
!1059 = !DILocation(line: 65, column: 9, scope: !1060, inlinedAt: !1044)
!1060 = distinct !DILexicalBlock(scope: !1061, file: !483, line: 65, column: 9)
!1061 = distinct !DILexicalBlock(scope: !1057, file: !483, line: 64, column: 40)
!1062 = !DILocation(line: 65, scope: !1060, inlinedAt: !1044)
!1063 = !DILocalVariable(name: "c", scope: !1060, file: !483, line: 65, type: !86)
!1064 = !DILocation(line: 0, scope: !1060, inlinedAt: !1044)
!1065 = !DILocation(line: 65, column: 27, scope: !1066, inlinedAt: !1044)
!1066 = distinct !DILexicalBlock(scope: !1060, file: !483, line: 65, column: 9)
!1067 = !DILocation(line: 66, column: 13, scope: !1068, inlinedAt: !1044)
!1068 = distinct !DILexicalBlock(scope: !1069, file: !483, line: 66, column: 13)
!1069 = distinct !DILexicalBlock(scope: !1066, file: !483, line: 65, column: 44)
!1070 = !DILocation(line: 66, scope: !1068, inlinedAt: !1044)
!1071 = !DILocalVariable(name: "k", scope: !1068, file: !483, line: 66, type: !86)
!1072 = !DILocation(line: 0, scope: !1068, inlinedAt: !1044)
!1073 = !DILocation(line: 66, column: 31, scope: !1074, inlinedAt: !1044)
!1074 = distinct !DILexicalBlock(scope: !1068, file: !483, line: 66, column: 13)
!1075 = !DILocation(line: 67, column: 70, scope: !1076, inlinedAt: !1044)
!1076 = distinct !DILexicalBlock(scope: !1074, file: !483, line: 66, column: 54)
!1077 = !DILocation(line: 67, column: 84, scope: !1076, inlinedAt: !1044)
!1078 = !DILocation(line: 67, column: 51, scope: !1076, inlinedAt: !1044)
!1079 = !DILocation(line: 67, column: 96, scope: !1076, inlinedAt: !1044)
!1080 = !DILocation(line: 67, column: 90, scope: !1076, inlinedAt: !1044)
!1081 = !DILocation(line: 67, column: 136, scope: !1076, inlinedAt: !1044)
!1082 = !DILocation(line: 67, column: 150, scope: !1076, inlinedAt: !1044)
!1083 = !DILocation(line: 67, column: 117, scope: !1076, inlinedAt: !1044)
!1084 = !DILocation(line: 67, column: 17, scope: !1076, inlinedAt: !1044)
!1085 = !DILocation(line: 66, column: 48, scope: !1074, inlinedAt: !1044)
!1086 = !DILocation(line: 66, column: 13, scope: !1074, inlinedAt: !1044)
!1087 = distinct !{!1087, !1067, !1088, !298}
!1088 = !DILocation(line: 68, column: 13, scope: !1068, inlinedAt: !1044)
!1089 = !DILocation(line: 65, column: 40, scope: !1066, inlinedAt: !1044)
!1090 = !DILocation(line: 65, column: 9, scope: !1066, inlinedAt: !1044)
!1091 = distinct !{!1091, !1059, !1092, !298}
!1092 = !DILocation(line: 69, column: 9, scope: !1060, inlinedAt: !1044)
!1093 = !DILocation(line: 64, column: 36, scope: !1057, inlinedAt: !1044)
!1094 = !DILocation(line: 64, column: 5, scope: !1057, inlinedAt: !1044)
!1095 = distinct !{!1095, !1058, !1096, !298}
!1096 = !DILocation(line: 70, column: 5, scope: !1052, inlinedAt: !1044)
!1097 = !DILocalVariable(name: "Pv", scope: !1027, file: !483, line: 254, type: !1098)
!1098 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 532224, elements: !1099)
!1099 = !{!1100}
!1100 = !DISubrange(count: 8316)
!1101 = !DILocation(line: 254, column: 14, scope: !1027, inlinedAt: !1030)
!1102 = !DILocalVariable(name: "p", arg: 1, scope: !1103, file: !483, line: 82, type: !193)
!1103 = distinct !DISubprogram(name: "P1_times_Vt", scope: !483, file: !483, line: 82, type: !498, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1104 = !DILocation(line: 0, scope: !1103, inlinedAt: !1105)
!1105 = distinct !DILocation(line: 255, column: 5, scope: !1027, inlinedAt: !1030)
!1106 = !DILocalVariable(name: "P1", arg: 2, scope: !1103, file: !483, line: 82, type: !486)
!1107 = !DILocalVariable(name: "V", arg: 3, scope: !1103, file: !483, line: 82, type: !90)
!1108 = !DILocalVariable(name: "acc", arg: 4, scope: !1103, file: !483, line: 82, type: !52)
!1109 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !1110, file: !483, line: 32, type: !275)
!1110 = distinct !DISubprogram(name: "mul_add_m_upper_triangular_mat_x_mat_trans", scope: !483, file: !483, line: 32, type: !507, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1111 = !DILocation(line: 0, scope: !1110, inlinedAt: !1112)
!1112 = distinct !DILocation(line: 86, column: 5, scope: !1103, inlinedAt: !1105)
!1113 = !DILocalVariable(name: "bs_mat", arg: 2, scope: !1110, file: !483, line: 32, type: !486)
!1114 = !DILocalVariable(name: "mat", arg: 3, scope: !1110, file: !483, line: 32, type: !90)
!1115 = !DILocalVariable(name: "acc", arg: 4, scope: !1110, file: !483, line: 32, type: !52)
!1116 = !DILocalVariable(name: "bs_mat_rows", arg: 5, scope: !1110, file: !483, line: 33, type: !275)
!1117 = !DILocalVariable(name: "bs_mat_cols", arg: 6, scope: !1110, file: !483, line: 33, type: !275)
!1118 = !DILocalVariable(name: "mat_rows", arg: 7, scope: !1110, file: !483, line: 33, type: !275)
!1119 = !DILocalVariable(name: "triangular", arg: 8, scope: !1110, file: !483, line: 33, type: !275)
!1120 = !DILocalVariable(name: "bs_mat_entries_used", scope: !1110, file: !483, line: 34, type: !86)
!1121 = !DILocalVariable(name: "r", scope: !1122, file: !483, line: 35, type: !86)
!1122 = distinct !DILexicalBlock(scope: !1110, file: !483, line: 35, column: 5)
!1123 = !DILocation(line: 0, scope: !1122, inlinedAt: !1112)
!1124 = !DILocation(line: 35, column: 10, scope: !1122, inlinedAt: !1112)
!1125 = !DILocation(line: 34, column: 9, scope: !1110, inlinedAt: !1112)
!1126 = !DILocation(line: 35, scope: !1122, inlinedAt: !1112)
!1127 = !DILocation(line: 35, column: 23, scope: !1128, inlinedAt: !1112)
!1128 = distinct !DILexicalBlock(scope: !1122, file: !483, line: 35, column: 5)
!1129 = !DILocation(line: 35, column: 5, scope: !1122, inlinedAt: !1112)
!1130 = !DILocation(line: 64, column: 5, scope: !1052, inlinedAt: !1131)
!1131 = distinct !DILocation(line: 256, column: 5, scope: !1027, inlinedAt: !1030)
!1132 = !DILocation(line: 36, column: 9, scope: !1133, inlinedAt: !1112)
!1133 = distinct !DILexicalBlock(scope: !1134, file: !483, line: 36, column: 9)
!1134 = distinct !DILexicalBlock(scope: !1128, file: !483, line: 35, column: 43)
!1135 = !DILocation(line: 36, scope: !1133, inlinedAt: !1112)
!1136 = !DILocalVariable(name: "c", scope: !1133, file: !483, line: 36, type: !86)
!1137 = !DILocation(line: 0, scope: !1133, inlinedAt: !1112)
!1138 = !DILocation(line: 36, column: 40, scope: !1139, inlinedAt: !1112)
!1139 = distinct !DILexicalBlock(scope: !1133, file: !483, line: 36, column: 9)
!1140 = !DILocation(line: 37, column: 13, scope: !1141, inlinedAt: !1112)
!1141 = distinct !DILexicalBlock(scope: !1142, file: !483, line: 37, column: 13)
!1142 = distinct !DILexicalBlock(scope: !1139, file: !483, line: 36, column: 60)
!1143 = !DILocation(line: 37, scope: !1141, inlinedAt: !1112)
!1144 = !DILocalVariable(name: "k", scope: !1141, file: !483, line: 37, type: !86)
!1145 = !DILocation(line: 0, scope: !1141, inlinedAt: !1112)
!1146 = !DILocation(line: 37, column: 31, scope: !1147, inlinedAt: !1112)
!1147 = distinct !DILexicalBlock(scope: !1141, file: !483, line: 37, column: 13)
!1148 = !DILocation(line: 38, column: 51, scope: !1149, inlinedAt: !1112)
!1149 = distinct !DILexicalBlock(scope: !1147, file: !483, line: 37, column: 51)
!1150 = !DILocation(line: 38, column: 94, scope: !1149, inlinedAt: !1112)
!1151 = !DILocation(line: 38, column: 88, scope: !1149, inlinedAt: !1112)
!1152 = !DILocation(line: 38, column: 137, scope: !1149, inlinedAt: !1112)
!1153 = !DILocation(line: 38, column: 148, scope: !1149, inlinedAt: !1112)
!1154 = !DILocation(line: 38, column: 118, scope: !1149, inlinedAt: !1112)
!1155 = !DILocation(line: 38, column: 17, scope: !1149, inlinedAt: !1112)
!1156 = !DILocation(line: 37, column: 45, scope: !1147, inlinedAt: !1112)
!1157 = !DILocation(line: 37, column: 13, scope: !1147, inlinedAt: !1112)
!1158 = distinct !{!1158, !1140, !1159, !298}
!1159 = !DILocation(line: 39, column: 13, scope: !1141, inlinedAt: !1112)
!1160 = !DILocation(line: 40, column: 33, scope: !1142, inlinedAt: !1112)
!1161 = !DILocation(line: 36, column: 56, scope: !1139, inlinedAt: !1112)
!1162 = !DILocation(line: 36, column: 9, scope: !1139, inlinedAt: !1112)
!1163 = distinct !{!1163, !1132, !1164, !298}
!1164 = !DILocation(line: 41, column: 9, scope: !1133, inlinedAt: !1112)
!1165 = !DILocation(line: 35, column: 39, scope: !1128, inlinedAt: !1112)
!1166 = !DILocation(line: 35, column: 5, scope: !1128, inlinedAt: !1112)
!1167 = distinct !{!1167, !1129, !1168, !298}
!1168 = !DILocation(line: 42, column: 5, scope: !1122, inlinedAt: !1112)
!1169 = !DILocation(line: 64, scope: !1052, inlinedAt: !1131)
!1170 = !DILocation(line: 0, scope: !1052, inlinedAt: !1131)
!1171 = !DILocation(line: 64, column: 23, scope: !1057, inlinedAt: !1131)
!1172 = !DILocation(line: 65, column: 9, scope: !1060, inlinedAt: !1131)
!1173 = !DILocation(line: 65, scope: !1060, inlinedAt: !1131)
!1174 = !DILocation(line: 0, scope: !1060, inlinedAt: !1131)
!1175 = !DILocation(line: 65, column: 27, scope: !1066, inlinedAt: !1131)
!1176 = !DILocation(line: 66, column: 13, scope: !1068, inlinedAt: !1131)
!1177 = !DILocation(line: 66, scope: !1068, inlinedAt: !1131)
!1178 = !DILocation(line: 0, scope: !1068, inlinedAt: !1131)
!1179 = !DILocation(line: 66, column: 31, scope: !1074, inlinedAt: !1131)
!1180 = !DILocation(line: 67, column: 70, scope: !1076, inlinedAt: !1131)
!1181 = !DILocation(line: 67, column: 84, scope: !1076, inlinedAt: !1131)
!1182 = !DILocation(line: 67, column: 51, scope: !1076, inlinedAt: !1131)
!1183 = !DILocation(line: 67, column: 96, scope: !1076, inlinedAt: !1131)
!1184 = !DILocation(line: 67, column: 90, scope: !1076, inlinedAt: !1131)
!1185 = !DILocation(line: 67, column: 136, scope: !1076, inlinedAt: !1131)
!1186 = !DILocation(line: 67, column: 150, scope: !1076, inlinedAt: !1131)
!1187 = !DILocation(line: 67, column: 117, scope: !1076, inlinedAt: !1131)
!1188 = !DILocation(line: 67, column: 17, scope: !1076, inlinedAt: !1131)
!1189 = !DILocation(line: 66, column: 48, scope: !1074, inlinedAt: !1131)
!1190 = !DILocation(line: 66, column: 13, scope: !1074, inlinedAt: !1131)
!1191 = distinct !{!1191, !1176, !1192, !298}
!1192 = !DILocation(line: 68, column: 13, scope: !1068, inlinedAt: !1131)
!1193 = !DILocation(line: 65, column: 40, scope: !1066, inlinedAt: !1131)
!1194 = !DILocation(line: 65, column: 9, scope: !1066, inlinedAt: !1131)
!1195 = distinct !{!1195, !1172, !1196, !298}
!1196 = !DILocation(line: 69, column: 9, scope: !1060, inlinedAt: !1131)
!1197 = !DILocation(line: 64, column: 36, scope: !1057, inlinedAt: !1131)
!1198 = !DILocation(line: 64, column: 5, scope: !1057, inlinedAt: !1131)
!1199 = distinct !{!1199, !1130, !1200, !298}
!1200 = !DILocation(line: 70, column: 5, scope: !1052, inlinedAt: !1131)
!1201 = !DILocation(line: 257, column: 1, scope: !1027, inlinedAt: !1030)
!1202 = !DILocation(line: 458, column: 9, scope: !989)
!1203 = !DILocation(line: 162, column: 14, scope: !1204, inlinedAt: !1207)
!1204 = distinct !DISubprogram(name: "compute_A", scope: !68, file: !68, line: 154, type: !1205, scopeLine: 154, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1205 = !DISubroutineType(types: !1206)
!1206 = !{null, !193, !52, !61}
!1207 = distinct !DILocation(line: 459, column: 9, scope: !989)
!1208 = !DILocalVariable(name: "p", arg: 1, scope: !1204, file: !68, line: 154, type: !193)
!1209 = !DILocation(line: 0, scope: !1204, inlinedAt: !1207)
!1210 = !DILocalVariable(name: "VtL", arg: 2, scope: !1204, file: !68, line: 154, type: !52)
!1211 = !DILocalVariable(name: "A_out", arg: 3, scope: !1204, file: !68, line: 154, type: !61)
!1212 = !DILocalVariable(name: "bits_to_shift", scope: !1204, file: !68, line: 159, type: !86)
!1213 = !DILocalVariable(name: "words_to_shift", scope: !1204, file: !68, line: 160, type: !86)
!1214 = !DILocalVariable(name: "m_vec_limbs", scope: !1204, file: !68, line: 161, type: !275)
!1215 = !DILocalVariable(name: "A", scope: !1204, file: !68, line: 162, type: !1216)
!1216 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 100352, elements: !1217)
!1217 = !{!1218}
!1218 = !DISubrange(count: 1568)
!1219 = !DILocalVariable(name: "A_width", scope: !1204, file: !68, line: 163, type: !58)
!1220 = !DILocalVariable(name: "mask", scope: !1221, file: !68, line: 168, type: !53)
!1221 = distinct !DILexicalBlock(scope: !1222, file: !68, line: 167, column: 29)
!1222 = distinct !DILexicalBlock(scope: !1204, file: !68, line: 167, column: 8)
!1223 = !DILocation(line: 0, scope: !1221, inlinedAt: !1207)
!1224 = !DILocalVariable(name: "i", scope: !1225, file: !68, line: 171, type: !86)
!1225 = distinct !DILexicalBlock(scope: !1221, file: !68, line: 171, column: 9)
!1226 = !DILocation(line: 0, scope: !1225, inlinedAt: !1207)
!1227 = !DILocation(line: 171, column: 14, scope: !1225, inlinedAt: !1207)
!1228 = !DILocation(line: 171, scope: !1225, inlinedAt: !1207)
!1229 = !DILocation(line: 171, column: 27, scope: !1230, inlinedAt: !1207)
!1230 = distinct !DILexicalBlock(scope: !1225, file: !68, line: 171, column: 9)
!1231 = !DILocation(line: 171, column: 9, scope: !1225, inlinedAt: !1207)
!1232 = !DILocation(line: 177, column: 5, scope: !1233, inlinedAt: !1207)
!1233 = distinct !DILexicalBlock(scope: !1204, file: !68, line: 177, column: 5)
!1234 = !DILocation(line: 173, column: 13, scope: !1235, inlinedAt: !1207)
!1235 = distinct !DILexicalBlock(scope: !1230, file: !68, line: 172, column: 9)
!1236 = !DILocation(line: 173, column: 50, scope: !1235, inlinedAt: !1207)
!1237 = !DILocation(line: 171, column: 53, scope: !1230, inlinedAt: !1207)
!1238 = !DILocation(line: 171, column: 9, scope: !1230, inlinedAt: !1207)
!1239 = distinct !{!1239, !1231, !1240, !298}
!1240 = !DILocation(line: 174, column: 9, scope: !1225, inlinedAt: !1207)
!1241 = !DILocation(line: 177, scope: !1233, inlinedAt: !1207)
!1242 = !DILocation(line: 160, column: 9, scope: !1204, inlinedAt: !1207)
!1243 = !DILocation(line: 159, column: 9, scope: !1204, inlinedAt: !1207)
!1244 = !DILocalVariable(name: "i", scope: !1233, file: !68, line: 177, type: !86)
!1245 = !DILocation(line: 0, scope: !1233, inlinedAt: !1207)
!1246 = !DILocation(line: 177, column: 23, scope: !1247, inlinedAt: !1207)
!1247 = distinct !DILexicalBlock(scope: !1233, file: !68, line: 177, column: 5)
!1248 = !DILocation(line: 212, column: 5, scope: !1249, inlinedAt: !1207)
!1249 = distinct !DILexicalBlock(scope: !1204, file: !68, line: 212, column: 5)
!1250 = !DILocation(line: 178, column: 9, scope: !1251, inlinedAt: !1207)
!1251 = distinct !DILexicalBlock(scope: !1252, file: !68, line: 178, column: 9)
!1252 = distinct !DILexicalBlock(scope: !1247, file: !68, line: 177, column: 47)
!1253 = !DILocation(line: 178, scope: !1251, inlinedAt: !1207)
!1254 = !DILocalVariable(name: "j", scope: !1251, file: !68, line: 178, type: !86)
!1255 = !DILocation(line: 0, scope: !1251, inlinedAt: !1207)
!1256 = !DILocation(line: 178, column: 40, scope: !1257, inlinedAt: !1207)
!1257 = distinct !DILexicalBlock(scope: !1251, file: !68, line: 178, column: 9)
!1258 = !DILocation(line: 180, column: 22, scope: !1259, inlinedAt: !1207)
!1259 = distinct !DILexicalBlock(scope: !1257, file: !68, line: 178, column: 51)
!1260 = !DILocalVariable(name: "Mj", scope: !1204, file: !68, line: 164, type: !486)
!1261 = !DILocalVariable(name: "c", scope: !1262, file: !68, line: 181, type: !86)
!1262 = distinct !DILexicalBlock(scope: !1259, file: !68, line: 181, column: 13)
!1263 = !DILocation(line: 0, scope: !1262, inlinedAt: !1207)
!1264 = !DILocation(line: 181, column: 18, scope: !1262, inlinedAt: !1207)
!1265 = !DILocation(line: 181, scope: !1262, inlinedAt: !1207)
!1266 = !DILocation(line: 181, column: 31, scope: !1267, inlinedAt: !1207)
!1267 = distinct !DILexicalBlock(scope: !1262, file: !68, line: 181, column: 13)
!1268 = !DILocation(line: 181, column: 13, scope: !1262, inlinedAt: !1207)
!1269 = !DILocation(line: 182, column: 17, scope: !1270, inlinedAt: !1207)
!1270 = distinct !DILexicalBlock(scope: !1271, file: !68, line: 182, column: 17)
!1271 = distinct !DILexicalBlock(scope: !1267, file: !68, line: 181, column: 50)
!1272 = !DILocation(line: 182, scope: !1270, inlinedAt: !1207)
!1273 = !DILocalVariable(name: "k", scope: !1270, file: !68, line: 182, type: !86)
!1274 = !DILocation(line: 0, scope: !1270, inlinedAt: !1207)
!1275 = !DILocation(line: 182, column: 35, scope: !1276, inlinedAt: !1207)
!1276 = distinct !DILexicalBlock(scope: !1270, file: !68, line: 182, column: 17)
!1277 = !DILocation(line: 184, column: 78, scope: !1278, inlinedAt: !1207)
!1278 = distinct !DILexicalBlock(scope: !1276, file: !68, line: 183, column: 17)
!1279 = !DILocation(line: 184, column: 100, scope: !1278, inlinedAt: !1207)
!1280 = !DILocation(line: 184, column: 35, scope: !1278, inlinedAt: !1207)
!1281 = !DILocation(line: 184, column: 39, scope: !1278, inlinedAt: !1207)
!1282 = !DILocation(line: 184, column: 48, scope: !1278, inlinedAt: !1207)
!1283 = !DILocation(line: 184, column: 65, scope: !1278, inlinedAt: !1207)
!1284 = !DILocation(line: 184, column: 43, scope: !1278, inlinedAt: !1207)
!1285 = !DILocation(line: 184, column: 21, scope: !1278, inlinedAt: !1207)
!1286 = !DILocation(line: 184, column: 75, scope: !1278, inlinedAt: !1207)
!1287 = !DILocation(line: 185, column: 38, scope: !1288, inlinedAt: !1207)
!1288 = distinct !DILexicalBlock(scope: !1278, file: !68, line: 185, column: 24)
!1289 = !DILocation(line: 186, column: 86, scope: !1290, inlinedAt: !1207)
!1290 = distinct !DILexicalBlock(scope: !1288, file: !68, line: 185, column: 42)
!1291 = !DILocation(line: 186, column: 114, scope: !1290, inlinedAt: !1207)
!1292 = !DILocation(line: 186, column: 108, scope: !1290, inlinedAt: !1207)
!1293 = !DILocation(line: 186, column: 39, scope: !1290, inlinedAt: !1207)
!1294 = !DILocation(line: 186, column: 43, scope: !1290, inlinedAt: !1207)
!1295 = !DILocation(line: 186, column: 52, scope: !1290, inlinedAt: !1207)
!1296 = !DILocation(line: 186, column: 73, scope: !1290, inlinedAt: !1207)
!1297 = !DILocation(line: 186, column: 47, scope: !1290, inlinedAt: !1207)
!1298 = !DILocation(line: 186, column: 25, scope: !1290, inlinedAt: !1207)
!1299 = !DILocation(line: 186, column: 83, scope: !1290, inlinedAt: !1207)
!1300 = !DILocation(line: 187, column: 21, scope: !1290, inlinedAt: !1207)
!1301 = !DILocation(line: 182, column: 51, scope: !1276, inlinedAt: !1207)
!1302 = !DILocation(line: 182, column: 17, scope: !1276, inlinedAt: !1207)
!1303 = distinct !{!1303, !1269, !1304, !298}
!1304 = !DILocation(line: 188, column: 17, scope: !1270, inlinedAt: !1207)
!1305 = !DILocation(line: 181, column: 46, scope: !1267, inlinedAt: !1207)
!1306 = !DILocation(line: 181, column: 13, scope: !1267, inlinedAt: !1207)
!1307 = distinct !{!1307, !1268, !1308, !298}
!1308 = !DILocation(line: 189, column: 13, scope: !1262, inlinedAt: !1207)
!1309 = !DILocation(line: 191, column: 19, scope: !1310, inlinedAt: !1207)
!1310 = distinct !DILexicalBlock(scope: !1259, file: !68, line: 191, column: 17)
!1311 = !DILocation(line: 192, column: 26, scope: !1312, inlinedAt: !1207)
!1312 = distinct !DILexicalBlock(scope: !1310, file: !68, line: 191, column: 25)
!1313 = !DILocalVariable(name: "Mi", scope: !1204, file: !68, line: 164, type: !486)
!1314 = !DILocalVariable(name: "c", scope: !1315, file: !68, line: 193, type: !86)
!1315 = distinct !DILexicalBlock(scope: !1312, file: !68, line: 193, column: 17)
!1316 = !DILocation(line: 0, scope: !1315, inlinedAt: !1207)
!1317 = !DILocation(line: 193, column: 22, scope: !1315, inlinedAt: !1207)
!1318 = !DILocation(line: 193, scope: !1315, inlinedAt: !1207)
!1319 = !DILocation(line: 193, column: 35, scope: !1320, inlinedAt: !1207)
!1320 = distinct !DILexicalBlock(scope: !1315, file: !68, line: 193, column: 17)
!1321 = !DILocation(line: 193, column: 17, scope: !1315, inlinedAt: !1207)
!1322 = !DILocation(line: 194, column: 21, scope: !1323, inlinedAt: !1207)
!1323 = distinct !DILexicalBlock(scope: !1324, file: !68, line: 194, column: 21)
!1324 = distinct !DILexicalBlock(scope: !1320, file: !68, line: 193, column: 54)
!1325 = !DILocation(line: 194, scope: !1323, inlinedAt: !1207)
!1326 = !DILocalVariable(name: "k", scope: !1323, file: !68, line: 194, type: !86)
!1327 = !DILocation(line: 0, scope: !1323, inlinedAt: !1207)
!1328 = !DILocation(line: 194, column: 39, scope: !1329, inlinedAt: !1207)
!1329 = distinct !DILexicalBlock(scope: !1323, file: !68, line: 194, column: 21)
!1330 = !DILocation(line: 196, column: 81, scope: !1331, inlinedAt: !1207)
!1331 = distinct !DILexicalBlock(scope: !1329, file: !68, line: 195, column: 21)
!1332 = !DILocation(line: 196, column: 103, scope: !1331, inlinedAt: !1207)
!1333 = !DILocation(line: 196, column: 38, scope: !1331, inlinedAt: !1207)
!1334 = !DILocation(line: 196, column: 42, scope: !1331, inlinedAt: !1207)
!1335 = !DILocation(line: 196, column: 51, scope: !1331, inlinedAt: !1207)
!1336 = !DILocation(line: 196, column: 68, scope: !1331, inlinedAt: !1207)
!1337 = !DILocation(line: 196, column: 46, scope: !1331, inlinedAt: !1207)
!1338 = !DILocation(line: 196, column: 25, scope: !1331, inlinedAt: !1207)
!1339 = !DILocation(line: 196, column: 78, scope: !1331, inlinedAt: !1207)
!1340 = !DILocation(line: 197, column: 42, scope: !1341, inlinedAt: !1207)
!1341 = distinct !DILexicalBlock(scope: !1331, file: !68, line: 197, column: 28)
!1342 = !DILocation(line: 198, column: 89, scope: !1343, inlinedAt: !1207)
!1343 = distinct !DILexicalBlock(scope: !1341, file: !68, line: 197, column: 46)
!1344 = !DILocation(line: 198, column: 117, scope: !1343, inlinedAt: !1207)
!1345 = !DILocation(line: 198, column: 111, scope: !1343, inlinedAt: !1207)
!1346 = !DILocation(line: 198, column: 42, scope: !1343, inlinedAt: !1207)
!1347 = !DILocation(line: 198, column: 46, scope: !1343, inlinedAt: !1207)
!1348 = !DILocation(line: 198, column: 55, scope: !1343, inlinedAt: !1207)
!1349 = !DILocation(line: 198, column: 76, scope: !1343, inlinedAt: !1207)
!1350 = !DILocation(line: 198, column: 50, scope: !1343, inlinedAt: !1207)
!1351 = !DILocation(line: 198, column: 29, scope: !1343, inlinedAt: !1207)
!1352 = !DILocation(line: 198, column: 86, scope: !1343, inlinedAt: !1207)
!1353 = !DILocation(line: 199, column: 25, scope: !1343, inlinedAt: !1207)
!1354 = !DILocation(line: 194, column: 55, scope: !1329, inlinedAt: !1207)
!1355 = !DILocation(line: 194, column: 21, scope: !1329, inlinedAt: !1207)
!1356 = distinct !{!1356, !1322, !1357, !298}
!1357 = !DILocation(line: 200, column: 21, scope: !1323, inlinedAt: !1207)
!1358 = !DILocation(line: 193, column: 50, scope: !1320, inlinedAt: !1207)
!1359 = !DILocation(line: 193, column: 17, scope: !1320, inlinedAt: !1207)
!1360 = distinct !{!1360, !1321, !1361, !298}
!1361 = !DILocation(line: 201, column: 17, scope: !1315, inlinedAt: !1207)
!1362 = !DILocation(line: 204, column: 27, scope: !1259, inlinedAt: !1207)
!1363 = !DILocation(line: 205, column: 30, scope: !1364, inlinedAt: !1207)
!1364 = distinct !DILexicalBlock(scope: !1259, file: !68, line: 205, column: 16)
!1365 = !DILocation(line: 178, column: 46, scope: !1257, inlinedAt: !1207)
!1366 = !DILocation(line: 178, column: 9, scope: !1257, inlinedAt: !1207)
!1367 = distinct !{!1367, !1250, !1368, !298}
!1368 = !DILocation(line: 209, column: 9, scope: !1251, inlinedAt: !1207)
!1369 = !DILocation(line: 177, column: 42, scope: !1247, inlinedAt: !1207)
!1370 = !DILocation(line: 177, column: 5, scope: !1247, inlinedAt: !1207)
!1371 = distinct !{!1371, !1232, !1372, !298}
!1372 = !DILocation(line: 210, column: 5, scope: !1233, inlinedAt: !1207)
!1373 = !DILocation(line: 212, scope: !1249, inlinedAt: !1207)
!1374 = !DILocalVariable(name: "c", scope: !1249, file: !68, line: 212, type: !58)
!1375 = !DILocation(line: 0, scope: !1249, inlinedAt: !1207)
!1376 = !DILocation(line: 212, column: 26, scope: !1377, inlinedAt: !1207)
!1377 = distinct !DILexicalBlock(scope: !1249, file: !68, line: 212, column: 5)
!1378 = !DILocation(line: 214, column: 35, scope: !1379, inlinedAt: !1207)
!1379 = distinct !DILexicalBlock(scope: !1377, file: !68, line: 213, column: 5)
!1380 = !DILocalVariable(name: "M", arg: 1, scope: !67, file: !68, line: 111, type: !52)
!1381 = !DILocation(line: 0, scope: !67, inlinedAt: !1382)
!1382 = distinct !DILocation(line: 214, column: 9, scope: !1379, inlinedAt: !1207)
!1383 = !DILocalVariable(name: "i", scope: !1384, file: !68, line: 117, type: !58)
!1384 = distinct !DILexicalBlock(scope: !67, file: !68, line: 117, column: 5)
!1385 = !DILocation(line: 0, scope: !1384, inlinedAt: !1382)
!1386 = !DILocation(line: 117, column: 10, scope: !1384, inlinedAt: !1382)
!1387 = !DILocation(line: 117, scope: !1384, inlinedAt: !1382)
!1388 = !DILocation(line: 117, column: 26, scope: !1389, inlinedAt: !1382)
!1389 = distinct !DILexicalBlock(scope: !1384, file: !68, line: 117, column: 5)
!1390 = !DILocation(line: 117, column: 5, scope: !1384, inlinedAt: !1382)
!1391 = !DILocation(line: 124, column: 5, scope: !1392, inlinedAt: !1382)
!1392 = distinct !DILexicalBlock(scope: !67, file: !68, line: 124, column: 5)
!1393 = !DILocation(line: 119, column: 24, scope: !1394, inlinedAt: !1382)
!1394 = distinct !DILexicalBlock(scope: !1389, file: !68, line: 118, column: 5)
!1395 = !DILocation(line: 119, column: 29, scope: !1394, inlinedAt: !1382)
!1396 = !DILocation(line: 119, column: 41, scope: !1394, inlinedAt: !1382)
!1397 = !DILocation(line: 119, column: 38, scope: !1394, inlinedAt: !1382)
!1398 = !DILocation(line: 119, column: 36, scope: !1394, inlinedAt: !1382)
!1399 = !DILocation(line: 119, column: 46, scope: !1394, inlinedAt: !1382)
!1400 = !DILocalVariable(name: "t", scope: !1394, file: !68, line: 119, type: !53)
!1401 = !DILocation(line: 0, scope: !1394, inlinedAt: !1382)
!1402 = !DILocation(line: 120, column: 21, scope: !1394, inlinedAt: !1382)
!1403 = !DILocation(line: 120, column: 9, scope: !1394, inlinedAt: !1382)
!1404 = !DILocation(line: 120, column: 16, scope: !1394, inlinedAt: !1382)
!1405 = !DILocation(line: 121, column: 12, scope: !1394, inlinedAt: !1382)
!1406 = !DILocation(line: 121, column: 9, scope: !1394, inlinedAt: !1382)
!1407 = !DILocation(line: 121, column: 16, scope: !1394, inlinedAt: !1382)
!1408 = !DILocation(line: 117, column: 33, scope: !1389, inlinedAt: !1382)
!1409 = !DILocation(line: 117, column: 5, scope: !1389, inlinedAt: !1382)
!1410 = distinct !{!1410, !1390, !1411, !298}
!1411 = !DILocation(line: 122, column: 5, scope: !1384, inlinedAt: !1382)
!1412 = !DILocation(line: 124, scope: !1392, inlinedAt: !1382)
!1413 = !DILocalVariable(name: "i", scope: !1392, file: !68, line: 124, type: !58)
!1414 = !DILocation(line: 0, scope: !1392, inlinedAt: !1382)
!1415 = !DILocation(line: 124, column: 26, scope: !1416, inlinedAt: !1382)
!1416 = distinct !DILexicalBlock(scope: !1392, file: !68, line: 124, column: 5)
!1417 = !DILocation(line: 134, column: 5, scope: !1418, inlinedAt: !1382)
!1418 = distinct !DILexicalBlock(scope: !67, file: !68, line: 134, column: 5)
!1419 = !DILocation(line: 126, column: 25, scope: !1420, inlinedAt: !1382)
!1420 = distinct !DILexicalBlock(scope: !1416, file: !68, line: 125, column: 5)
!1421 = !DILocation(line: 126, column: 32, scope: !1420, inlinedAt: !1382)
!1422 = !DILocation(line: 126, column: 43, scope: !1420, inlinedAt: !1382)
!1423 = !DILocation(line: 126, column: 40, scope: !1420, inlinedAt: !1382)
!1424 = !DILocation(line: 126, column: 38, scope: !1420, inlinedAt: !1382)
!1425 = !DILocation(line: 126, column: 48, scope: !1420, inlinedAt: !1382)
!1426 = !DILocalVariable(name: "t0", scope: !1420, file: !68, line: 126, type: !53)
!1427 = !DILocation(line: 0, scope: !1420, inlinedAt: !1382)
!1428 = !DILocation(line: 127, column: 28, scope: !1420, inlinedAt: !1382)
!1429 = !DILocation(line: 127, column: 25, scope: !1420, inlinedAt: !1382)
!1430 = !DILocation(line: 127, column: 32, scope: !1420, inlinedAt: !1382)
!1431 = !DILocation(line: 127, column: 43, scope: !1420, inlinedAt: !1382)
!1432 = !DILocation(line: 127, column: 40, scope: !1420, inlinedAt: !1382)
!1433 = !DILocation(line: 127, column: 38, scope: !1420, inlinedAt: !1382)
!1434 = !DILocation(line: 127, column: 48, scope: !1420, inlinedAt: !1382)
!1435 = !DILocalVariable(name: "t1", scope: !1420, file: !68, line: 127, type: !53)
!1436 = !DILocation(line: 128, column: 23, scope: !1420, inlinedAt: !1382)
!1437 = !DILocation(line: 128, column: 9, scope: !1420, inlinedAt: !1382)
!1438 = !DILocation(line: 128, column: 16, scope: !1420, inlinedAt: !1382)
!1439 = !DILocation(line: 129, column: 23, scope: !1420, inlinedAt: !1382)
!1440 = !DILocation(line: 129, column: 12, scope: !1420, inlinedAt: !1382)
!1441 = !DILocation(line: 129, column: 9, scope: !1420, inlinedAt: !1382)
!1442 = !DILocation(line: 129, column: 16, scope: !1420, inlinedAt: !1382)
!1443 = !DILocation(line: 130, column: 12, scope: !1420, inlinedAt: !1382)
!1444 = !DILocation(line: 130, column: 9, scope: !1420, inlinedAt: !1382)
!1445 = !DILocation(line: 130, column: 16, scope: !1420, inlinedAt: !1382)
!1446 = !DILocation(line: 131, column: 12, scope: !1420, inlinedAt: !1382)
!1447 = !DILocation(line: 131, column: 9, scope: !1420, inlinedAt: !1382)
!1448 = !DILocation(line: 131, column: 16, scope: !1420, inlinedAt: !1382)
!1449 = !DILocation(line: 124, column: 33, scope: !1416, inlinedAt: !1382)
!1450 = !DILocation(line: 124, column: 5, scope: !1416, inlinedAt: !1382)
!1451 = distinct !{!1451, !1391, !1452, !298}
!1452 = !DILocation(line: 132, column: 5, scope: !1392, inlinedAt: !1382)
!1453 = !DILocation(line: 134, scope: !1418, inlinedAt: !1382)
!1454 = !DILocalVariable(name: "i", scope: !1418, file: !68, line: 134, type: !58)
!1455 = !DILocation(line: 0, scope: !1418, inlinedAt: !1382)
!1456 = !DILocation(line: 134, column: 26, scope: !1457, inlinedAt: !1382)
!1457 = distinct !DILexicalBlock(scope: !1418, file: !68, line: 134, column: 5)
!1458 = !DILocation(line: 145, column: 5, scope: !1459, inlinedAt: !1382)
!1459 = distinct !DILexicalBlock(scope: !67, file: !68, line: 145, column: 5)
!1460 = !DILocation(line: 136, column: 25, scope: !1461, inlinedAt: !1382)
!1461 = distinct !DILexicalBlock(scope: !1457, file: !68, line: 135, column: 5)
!1462 = !DILocation(line: 136, column: 32, scope: !1461, inlinedAt: !1382)
!1463 = !DILocation(line: 136, column: 44, scope: !1461, inlinedAt: !1382)
!1464 = !DILocation(line: 136, column: 41, scope: !1461, inlinedAt: !1382)
!1465 = !DILocation(line: 136, column: 39, scope: !1461, inlinedAt: !1382)
!1466 = !DILocation(line: 136, column: 50, scope: !1461, inlinedAt: !1382)
!1467 = !DILocalVariable(name: "t0", scope: !1461, file: !68, line: 136, type: !53)
!1468 = !DILocation(line: 0, scope: !1461, inlinedAt: !1382)
!1469 = !DILocation(line: 137, column: 28, scope: !1461, inlinedAt: !1382)
!1470 = !DILocation(line: 137, column: 25, scope: !1461, inlinedAt: !1382)
!1471 = !DILocation(line: 137, column: 32, scope: !1461, inlinedAt: !1382)
!1472 = !DILocation(line: 137, column: 44, scope: !1461, inlinedAt: !1382)
!1473 = !DILocation(line: 137, column: 41, scope: !1461, inlinedAt: !1382)
!1474 = !DILocation(line: 137, column: 39, scope: !1461, inlinedAt: !1382)
!1475 = !DILocation(line: 137, column: 50, scope: !1461, inlinedAt: !1382)
!1476 = !DILocalVariable(name: "t1", scope: !1461, file: !68, line: 137, type: !53)
!1477 = !DILocation(line: 139, column: 23, scope: !1461, inlinedAt: !1382)
!1478 = !DILocation(line: 139, column: 9, scope: !1461, inlinedAt: !1382)
!1479 = !DILocation(line: 139, column: 17, scope: !1461, inlinedAt: !1382)
!1480 = !DILocation(line: 140, column: 23, scope: !1461, inlinedAt: !1382)
!1481 = !DILocation(line: 140, column: 12, scope: !1461, inlinedAt: !1382)
!1482 = !DILocation(line: 140, column: 9, scope: !1461, inlinedAt: !1382)
!1483 = !DILocation(line: 140, column: 17, scope: !1461, inlinedAt: !1382)
!1484 = !DILocation(line: 141, column: 12, scope: !1461, inlinedAt: !1382)
!1485 = !DILocation(line: 141, column: 9, scope: !1461, inlinedAt: !1382)
!1486 = !DILocation(line: 141, column: 17, scope: !1461, inlinedAt: !1382)
!1487 = !DILocation(line: 142, column: 12, scope: !1461, inlinedAt: !1382)
!1488 = !DILocation(line: 142, column: 9, scope: !1461, inlinedAt: !1382)
!1489 = !DILocation(line: 142, column: 17, scope: !1461, inlinedAt: !1382)
!1490 = !DILocation(line: 134, column: 32, scope: !1457, inlinedAt: !1382)
!1491 = !DILocation(line: 134, column: 5, scope: !1457, inlinedAt: !1382)
!1492 = distinct !{!1492, !1417, !1493, !298}
!1493 = !DILocation(line: 143, column: 5, scope: !1418, inlinedAt: !1382)
!1494 = !DILocation(line: 145, scope: !1459, inlinedAt: !1382)
!1495 = !DILocalVariable(name: "i", scope: !1459, file: !68, line: 145, type: !58)
!1496 = !DILocation(line: 0, scope: !1459, inlinedAt: !1382)
!1497 = !DILocation(line: 145, column: 26, scope: !1498, inlinedAt: !1382)
!1498 = distinct !DILexicalBlock(scope: !1459, file: !68, line: 145, column: 5)
!1499 = !DILocation(line: 147, column: 24, scope: !1500, inlinedAt: !1382)
!1500 = distinct !DILexicalBlock(scope: !1498, file: !68, line: 146, column: 5)
!1501 = !DILocation(line: 147, column: 28, scope: !1500, inlinedAt: !1382)
!1502 = !DILocation(line: 147, column: 39, scope: !1500, inlinedAt: !1382)
!1503 = !DILocation(line: 147, column: 36, scope: !1500, inlinedAt: !1382)
!1504 = !DILocation(line: 147, column: 44, scope: !1500, inlinedAt: !1382)
!1505 = !DILocalVariable(name: "t", scope: !1500, file: !68, line: 147, type: !53)
!1506 = !DILocation(line: 0, scope: !1500, inlinedAt: !1382)
!1507 = !DILocation(line: 148, column: 21, scope: !1500, inlinedAt: !1382)
!1508 = !DILocation(line: 148, column: 9, scope: !1500, inlinedAt: !1382)
!1509 = !DILocation(line: 148, column: 16, scope: !1500, inlinedAt: !1382)
!1510 = !DILocation(line: 149, column: 12, scope: !1500, inlinedAt: !1382)
!1511 = !DILocation(line: 149, column: 9, scope: !1500, inlinedAt: !1382)
!1512 = !DILocation(line: 149, column: 16, scope: !1500, inlinedAt: !1382)
!1513 = !DILocation(line: 145, column: 32, scope: !1498, inlinedAt: !1382)
!1514 = !DILocation(line: 145, column: 5, scope: !1498, inlinedAt: !1382)
!1515 = distinct !{!1515, !1458, !1516, !298}
!1516 = !DILocation(line: 150, column: 5, scope: !1459, inlinedAt: !1382)
!1517 = !DILocation(line: 212, column: 91, scope: !1377, inlinedAt: !1207)
!1518 = !DILocation(line: 212, column: 5, scope: !1377, inlinedAt: !1207)
!1519 = distinct !{!1519, !1248, !1520, !298}
!1520 = !DILocation(line: 215, column: 5, scope: !1249, inlinedAt: !1207)
!1521 = !DILocalVariable(name: "tab", scope: !1204, file: !68, line: 217, type: !1522)
!1522 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 128, elements: !1523)
!1523 = !{!1524}
!1524 = !DISubrange(count: 16)
!1525 = !DILocation(line: 217, column: 19, scope: !1204, inlinedAt: !1207)
!1526 = !DILocalVariable(name: "i", scope: !1527, file: !68, line: 218, type: !58)
!1527 = distinct !DILexicalBlock(scope: !1204, file: !68, line: 218, column: 5)
!1528 = !DILocation(line: 0, scope: !1527, inlinedAt: !1207)
!1529 = !DILocation(line: 218, column: 10, scope: !1527, inlinedAt: !1207)
!1530 = !DILocation(line: 218, scope: !1527, inlinedAt: !1207)
!1531 = !DILocation(line: 218, column: 26, scope: !1532, inlinedAt: !1207)
!1532 = distinct !DILexicalBlock(scope: !1527, file: !68, line: 218, column: 5)
!1533 = !DILocation(line: 218, column: 5, scope: !1527, inlinedAt: !1207)
!1534 = !DILocation(line: 228, column: 5, scope: !1535, inlinedAt: !1207)
!1535 = distinct !DILexicalBlock(scope: !1204, file: !68, line: 228, column: 5)
!1536 = !DILocation(line: 220, column: 28, scope: !1537, inlinedAt: !1207)
!1537 = distinct !DILexicalBlock(scope: !1532, file: !68, line: 219, column: 5)
!1538 = !DILocalVariable(name: "a", arg: 1, scope: !1539, file: !668, line: 8, type: !51)
!1539 = distinct !DISubprogram(name: "mul_f", scope: !668, file: !668, line: 8, type: !1540, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1540 = !DISubroutineType(types: !1541)
!1541 = !{!51, !51, !51}
!1542 = !DILocation(line: 0, scope: !1539, inlinedAt: !1543)
!1543 = distinct !DILocation(line: 220, column: 22, scope: !1537, inlinedAt: !1207)
!1544 = !DILocalVariable(name: "b", arg: 2, scope: !1539, file: !668, line: 8, type: !51)
!1545 = !DILocation(line: 13, column: 10, scope: !1539, inlinedAt: !1543)
!1546 = !DILocation(line: 13, column: 7, scope: !1539, inlinedAt: !1543)
!1547 = !DILocalVariable(name: "p", scope: !1539, file: !668, line: 10, type: !51)
!1548 = !DILocation(line: 19, column: 7, scope: !1539, inlinedAt: !1543)
!1549 = !DILocalVariable(name: "top_p", scope: !1539, file: !668, line: 22, type: !51)
!1550 = !DILocalVariable(name: "out", scope: !1539, file: !668, line: 23, type: !51)
!1551 = !DILocation(line: 220, column: 14, scope: !1537, inlinedAt: !1207)
!1552 = !DILocation(line: 220, column: 9, scope: !1537, inlinedAt: !1207)
!1553 = !DILocation(line: 220, column: 20, scope: !1537, inlinedAt: !1207)
!1554 = !DILocation(line: 0, scope: !1539, inlinedAt: !1555)
!1555 = distinct !DILocation(line: 221, column: 22, scope: !1537, inlinedAt: !1207)
!1556 = !DILocation(line: 13, column: 10, scope: !1539, inlinedAt: !1555)
!1557 = !DILocation(line: 13, column: 7, scope: !1539, inlinedAt: !1555)
!1558 = !DILocation(line: 16, column: 17, scope: !1539, inlinedAt: !1555)
!1559 = !DILocation(line: 17, column: 17, scope: !1539, inlinedAt: !1555)
!1560 = !DILocation(line: 17, column: 7, scope: !1539, inlinedAt: !1555)
!1561 = !DILocation(line: 18, column: 17, scope: !1539, inlinedAt: !1555)
!1562 = !DILocation(line: 18, column: 7, scope: !1539, inlinedAt: !1555)
!1563 = !DILocation(line: 19, column: 17, scope: !1539, inlinedAt: !1555)
!1564 = !DILocation(line: 23, column: 37, scope: !1539, inlinedAt: !1555)
!1565 = !DILocation(line: 23, column: 52, scope: !1539, inlinedAt: !1555)
!1566 = !DILocation(line: 23, column: 43, scope: !1539, inlinedAt: !1555)
!1567 = !DILocation(line: 23, column: 59, scope: !1539, inlinedAt: !1555)
!1568 = !DILocation(line: 221, column: 14, scope: !1537, inlinedAt: !1207)
!1569 = !DILocation(line: 221, column: 16, scope: !1537, inlinedAt: !1207)
!1570 = !DILocation(line: 221, column: 9, scope: !1537, inlinedAt: !1207)
!1571 = !DILocation(line: 221, column: 20, scope: !1537, inlinedAt: !1207)
!1572 = !DILocation(line: 222, column: 28, scope: !1537, inlinedAt: !1207)
!1573 = !DILocation(line: 0, scope: !1539, inlinedAt: !1574)
!1574 = distinct !DILocation(line: 222, column: 22, scope: !1537, inlinedAt: !1207)
!1575 = !DILocation(line: 13, column: 10, scope: !1539, inlinedAt: !1574)
!1576 = !DILocation(line: 13, column: 7, scope: !1539, inlinedAt: !1574)
!1577 = !DILocation(line: 16, column: 17, scope: !1539, inlinedAt: !1574)
!1578 = !DILocation(line: 17, column: 17, scope: !1539, inlinedAt: !1574)
!1579 = !DILocation(line: 17, column: 7, scope: !1539, inlinedAt: !1574)
!1580 = !DILocation(line: 18, column: 17, scope: !1539, inlinedAt: !1574)
!1581 = !DILocation(line: 19, column: 17, scope: !1539, inlinedAt: !1574)
!1582 = !DILocation(line: 19, column: 7, scope: !1539, inlinedAt: !1574)
!1583 = !DILocation(line: 23, column: 37, scope: !1539, inlinedAt: !1574)
!1584 = !DILocation(line: 23, column: 52, scope: !1539, inlinedAt: !1574)
!1585 = !DILocation(line: 23, column: 43, scope: !1539, inlinedAt: !1574)
!1586 = !DILocation(line: 23, column: 59, scope: !1539, inlinedAt: !1574)
!1587 = !DILocation(line: 222, column: 14, scope: !1537, inlinedAt: !1207)
!1588 = !DILocation(line: 222, column: 16, scope: !1537, inlinedAt: !1207)
!1589 = !DILocation(line: 222, column: 9, scope: !1537, inlinedAt: !1207)
!1590 = !DILocation(line: 222, column: 20, scope: !1537, inlinedAt: !1207)
!1591 = !DILocation(line: 223, column: 28, scope: !1537, inlinedAt: !1207)
!1592 = !DILocation(line: 0, scope: !1539, inlinedAt: !1593)
!1593 = distinct !DILocation(line: 223, column: 22, scope: !1537, inlinedAt: !1207)
!1594 = !DILocation(line: 13, column: 10, scope: !1539, inlinedAt: !1593)
!1595 = !DILocation(line: 13, column: 7, scope: !1539, inlinedAt: !1593)
!1596 = !DILocation(line: 16, column: 17, scope: !1539, inlinedAt: !1593)
!1597 = !DILocation(line: 17, column: 17, scope: !1539, inlinedAt: !1593)
!1598 = !DILocation(line: 18, column: 17, scope: !1539, inlinedAt: !1593)
!1599 = !DILocation(line: 18, column: 7, scope: !1539, inlinedAt: !1593)
!1600 = !DILocation(line: 19, column: 17, scope: !1539, inlinedAt: !1593)
!1601 = !DILocation(line: 19, column: 7, scope: !1539, inlinedAt: !1593)
!1602 = !DILocation(line: 23, column: 37, scope: !1539, inlinedAt: !1593)
!1603 = !DILocation(line: 23, column: 52, scope: !1539, inlinedAt: !1593)
!1604 = !DILocation(line: 23, column: 43, scope: !1539, inlinedAt: !1593)
!1605 = !DILocation(line: 23, column: 59, scope: !1539, inlinedAt: !1593)
!1606 = !DILocation(line: 223, column: 14, scope: !1537, inlinedAt: !1207)
!1607 = !DILocation(line: 223, column: 16, scope: !1537, inlinedAt: !1207)
!1608 = !DILocation(line: 223, column: 9, scope: !1537, inlinedAt: !1207)
!1609 = !DILocation(line: 223, column: 20, scope: !1537, inlinedAt: !1207)
!1610 = !DILocation(line: 218, column: 41, scope: !1532, inlinedAt: !1207)
!1611 = !DILocation(line: 218, column: 5, scope: !1532, inlinedAt: !1207)
!1612 = distinct !{!1612, !1533, !1613, !298}
!1613 = !DILocation(line: 224, column: 5, scope: !1527, inlinedAt: !1207)
!1614 = !DILocation(line: 228, scope: !1535, inlinedAt: !1207)
!1615 = !DILocalVariable(name: "c", scope: !1535, file: !68, line: 228, type: !58)
!1616 = !DILocation(line: 0, scope: !1535, inlinedAt: !1207)
!1617 = !DILocation(line: 228, column: 26, scope: !1618, inlinedAt: !1207)
!1618 = distinct !DILexicalBlock(scope: !1535, file: !68, line: 228, column: 5)
!1619 = !DILocation(line: 250, column: 5, scope: !1620, inlinedAt: !1207)
!1620 = distinct !DILexicalBlock(scope: !1204, file: !68, line: 250, column: 5)
!1621 = !DILocation(line: 230, column: 9, scope: !1622, inlinedAt: !1207)
!1622 = distinct !DILexicalBlock(scope: !1623, file: !68, line: 230, column: 9)
!1623 = distinct !DILexicalBlock(scope: !1618, file: !68, line: 229, column: 5)
!1624 = !DILocation(line: 230, scope: !1622, inlinedAt: !1207)
!1625 = !DILocalVariable(name: "r", scope: !1622, file: !68, line: 230, type: !86)
!1626 = !DILocation(line: 0, scope: !1622, inlinedAt: !1207)
!1627 = !DILocation(line: 230, column: 36, scope: !1628, inlinedAt: !1207)
!1628 = distinct !DILexicalBlock(scope: !1622, file: !68, line: 230, column: 9)
!1629 = !DILocation(line: 232, column: 28, scope: !1630, inlinedAt: !1207)
!1630 = distinct !DILexicalBlock(scope: !1628, file: !68, line: 231, column: 9)
!1631 = !DILocation(line: 232, column: 32, scope: !1630, inlinedAt: !1207)
!1632 = !DILocation(line: 232, column: 41, scope: !1630, inlinedAt: !1207)
!1633 = !DILocation(line: 232, column: 49, scope: !1630, inlinedAt: !1207)
!1634 = !DILocation(line: 232, column: 45, scope: !1630, inlinedAt: !1207)
!1635 = !DILocalVariable(name: "pos", scope: !1630, file: !68, line: 232, type: !58)
!1636 = !DILocation(line: 0, scope: !1630, inlinedAt: !1207)
!1637 = !DILocation(line: 233, column: 28, scope: !1630, inlinedAt: !1207)
!1638 = !DILocation(line: 233, column: 41, scope: !1630, inlinedAt: !1207)
!1639 = !DILocalVariable(name: "t0", scope: !1630, file: !68, line: 233, type: !53)
!1640 = !DILocation(line: 234, column: 35, scope: !1630, inlinedAt: !1207)
!1641 = !DILocation(line: 234, column: 41, scope: !1630, inlinedAt: !1207)
!1642 = !DILocalVariable(name: "t1", scope: !1630, file: !68, line: 234, type: !53)
!1643 = !DILocation(line: 235, column: 35, scope: !1630, inlinedAt: !1207)
!1644 = !DILocation(line: 235, column: 41, scope: !1630, inlinedAt: !1207)
!1645 = !DILocalVariable(name: "t2", scope: !1630, file: !68, line: 235, type: !53)
!1646 = !DILocation(line: 236, column: 28, scope: !1630, inlinedAt: !1207)
!1647 = !DILocation(line: 236, column: 35, scope: !1630, inlinedAt: !1207)
!1648 = !DILocation(line: 236, column: 41, scope: !1630, inlinedAt: !1207)
!1649 = !DILocalVariable(name: "t3", scope: !1630, file: !68, line: 236, type: !53)
!1650 = !DILocalVariable(name: "t", scope: !1651, file: !68, line: 237, type: !58)
!1651 = distinct !DILexicalBlock(scope: !1630, file: !68, line: 237, column: 13)
!1652 = !DILocation(line: 0, scope: !1651, inlinedAt: !1207)
!1653 = !DILocation(line: 237, column: 18, scope: !1651, inlinedAt: !1207)
!1654 = !DILocation(line: 237, scope: !1651, inlinedAt: !1207)
!1655 = !DILocation(line: 237, column: 34, scope: !1656, inlinedAt: !1207)
!1656 = distinct !DILexicalBlock(scope: !1651, file: !68, line: 237, column: 13)
!1657 = !DILocation(line: 237, column: 13, scope: !1651, inlinedAt: !1207)
!1658 = !DILocation(line: 239, column: 89, scope: !1659, inlinedAt: !1207)
!1659 = distinct !DILexicalBlock(scope: !1656, file: !68, line: 238, column: 13)
!1660 = !DILocation(line: 239, column: 84, scope: !1659, inlinedAt: !1207)
!1661 = !DILocation(line: 239, column: 83, scope: !1659, inlinedAt: !1207)
!1662 = !DILocation(line: 239, column: 105, scope: !1659, inlinedAt: !1207)
!1663 = !DILocation(line: 239, column: 107, scope: !1659, inlinedAt: !1207)
!1664 = !DILocation(line: 239, column: 100, scope: !1659, inlinedAt: !1207)
!1665 = !DILocation(line: 239, column: 99, scope: !1659, inlinedAt: !1207)
!1666 = !DILocation(line: 239, column: 95, scope: !1659, inlinedAt: !1207)
!1667 = !DILocation(line: 239, column: 121, scope: !1659, inlinedAt: !1207)
!1668 = !DILocation(line: 239, column: 123, scope: !1659, inlinedAt: !1207)
!1669 = !DILocation(line: 239, column: 116, scope: !1659, inlinedAt: !1207)
!1670 = !DILocation(line: 239, column: 115, scope: !1659, inlinedAt: !1207)
!1671 = !DILocation(line: 239, column: 111, scope: !1659, inlinedAt: !1207)
!1672 = !DILocation(line: 239, column: 137, scope: !1659, inlinedAt: !1207)
!1673 = !DILocation(line: 239, column: 139, scope: !1659, inlinedAt: !1207)
!1674 = !DILocation(line: 239, column: 132, scope: !1659, inlinedAt: !1207)
!1675 = !DILocation(line: 239, column: 131, scope: !1659, inlinedAt: !1207)
!1676 = !DILocation(line: 239, column: 127, scope: !1659, inlinedAt: !1207)
!1677 = !DILocation(line: 239, column: 22, scope: !1659, inlinedAt: !1207)
!1678 = !DILocation(line: 239, column: 24, scope: !1659, inlinedAt: !1207)
!1679 = !DILocation(line: 239, column: 36, scope: !1659, inlinedAt: !1207)
!1680 = !DILocation(line: 239, column: 40, scope: !1659, inlinedAt: !1207)
!1681 = !DILocation(line: 239, column: 49, scope: !1659, inlinedAt: !1207)
!1682 = !DILocation(line: 239, column: 58, scope: !1659, inlinedAt: !1207)
!1683 = !DILocation(line: 239, column: 60, scope: !1659, inlinedAt: !1207)
!1684 = !DILocation(line: 239, column: 72, scope: !1659, inlinedAt: !1207)
!1685 = !DILocation(line: 239, column: 53, scope: !1659, inlinedAt: !1207)
!1686 = !DILocation(line: 239, column: 17, scope: !1659, inlinedAt: !1207)
!1687 = !DILocation(line: 239, column: 78, scope: !1659, inlinedAt: !1207)
!1688 = !DILocation(line: 237, column: 49, scope: !1656, inlinedAt: !1207)
!1689 = !DILocation(line: 237, column: 13, scope: !1656, inlinedAt: !1207)
!1690 = distinct !{!1690, !1657, !1691, !298}
!1691 = !DILocation(line: 240, column: 13, scope: !1651, inlinedAt: !1207)
!1692 = !DILocation(line: 230, column: 82, scope: !1628, inlinedAt: !1207)
!1693 = !DILocation(line: 230, column: 9, scope: !1628, inlinedAt: !1207)
!1694 = distinct !{!1694, !1621, !1695, !298}
!1695 = !DILocation(line: 241, column: 9, scope: !1622, inlinedAt: !1207)
!1696 = !DILocation(line: 228, column: 38, scope: !1618, inlinedAt: !1207)
!1697 = !DILocation(line: 228, column: 5, scope: !1618, inlinedAt: !1207)
!1698 = distinct !{!1698, !1534, !1699, !298}
!1699 = !DILocation(line: 242, column: 5, scope: !1535, inlinedAt: !1207)
!1700 = !DILocation(line: 250, scope: !1620, inlinedAt: !1207)
!1701 = !DILocalVariable(name: "r", scope: !1620, file: !68, line: 250, type: !86)
!1702 = !DILocation(line: 0, scope: !1620, inlinedAt: !1207)
!1703 = !DILocation(line: 250, column: 23, scope: !1704, inlinedAt: !1207)
!1704 = distinct !DILexicalBlock(scope: !1620, file: !68, line: 250, column: 5)
!1705 = !DILocation(line: 252, column: 9, scope: !1706, inlinedAt: !1207)
!1706 = distinct !DILexicalBlock(scope: !1707, file: !68, line: 252, column: 9)
!1707 = distinct !DILexicalBlock(scope: !1704, file: !68, line: 251, column: 5)
!1708 = !DILocation(line: 252, scope: !1706, inlinedAt: !1207)
!1709 = !DILocalVariable(name: "c", scope: !1706, file: !68, line: 252, type: !86)
!1710 = !DILocation(line: 0, scope: !1706, inlinedAt: !1207)
!1711 = !DILocation(line: 252, column: 27, scope: !1712, inlinedAt: !1207)
!1712 = distinct !DILexicalBlock(scope: !1706, file: !68, line: 252, column: 9)
!1713 = !DILocation(line: 254, column: 13, scope: !1714, inlinedAt: !1207)
!1714 = distinct !DILexicalBlock(scope: !1715, file: !68, line: 254, column: 13)
!1715 = distinct !DILexicalBlock(scope: !1712, file: !68, line: 253, column: 9)
!1716 = !DILocation(line: 254, scope: !1714, inlinedAt: !1207)
!1717 = !DILocalVariable(name: "i", scope: !1714, file: !68, line: 254, type: !86)
!1718 = !DILocation(line: 0, scope: !1714, inlinedAt: !1207)
!1719 = !DILocation(line: 254, column: 35, scope: !1720, inlinedAt: !1207)
!1720 = distinct !DILexicalBlock(scope: !1714, file: !68, line: 254, column: 13)
!1721 = !DILocation(line: 256, column: 55, scope: !1722, inlinedAt: !1207)
!1722 = distinct !DILexicalBlock(scope: !1720, file: !68, line: 255, column: 13)
!1723 = !DILocation(line: 256, column: 59, scope: !1722, inlinedAt: !1207)
!1724 = !DILocation(line: 256, column: 63, scope: !1722, inlinedAt: !1207)
!1725 = !DILocation(line: 256, column: 44, scope: !1722, inlinedAt: !1207)
!1726 = !DILocation(line: 256, column: 95, scope: !1722, inlinedAt: !1207)
!1727 = !DILocation(line: 256, column: 92, scope: !1722, inlinedAt: !1207)
!1728 = !DILocation(line: 256, column: 75, scope: !1722, inlinedAt: !1207)
!1729 = !DILocation(line: 256, column: 99, scope: !1722, inlinedAt: !1207)
!1730 = !DILocation(line: 256, column: 104, scope: !1722, inlinedAt: !1207)
!1731 = !DILocation(line: 0, scope: !433, inlinedAt: !1732)
!1732 = distinct !DILocation(line: 256, column: 17, scope: !1722, inlinedAt: !1207)
!1733 = !DILocation(line: 22, column: 10, scope: !442, inlinedAt: !1732)
!1734 = !DILocation(line: 22, scope: !442, inlinedAt: !1732)
!1735 = !DILocation(line: 22, column: 29, scope: !445, inlinedAt: !1732)
!1736 = !DILocation(line: 22, column: 19, scope: !445, inlinedAt: !1732)
!1737 = !DILocation(line: 22, column: 5, scope: !442, inlinedAt: !1732)
!1738 = !DILocation(line: 23, column: 19, scope: !448, inlinedAt: !1732)
!1739 = !DILocation(line: 23, column: 24, scope: !448, inlinedAt: !1732)
!1740 = !DILocation(line: 23, column: 14, scope: !448, inlinedAt: !1732)
!1741 = !DILocation(line: 23, column: 17, scope: !448, inlinedAt: !1732)
!1742 = !DILocation(line: 24, column: 24, scope: !448, inlinedAt: !1732)
!1743 = !DILocation(line: 24, column: 17, scope: !448, inlinedAt: !1732)
!1744 = !DILocation(line: 24, column: 14, scope: !448, inlinedAt: !1732)
!1745 = !DILocation(line: 22, column: 34, scope: !445, inlinedAt: !1732)
!1746 = !DILocation(line: 22, column: 5, scope: !445, inlinedAt: !1732)
!1747 = distinct !{!1747, !1737, !1748, !298}
!1748 = !DILocation(line: 25, column: 5, scope: !442, inlinedAt: !1732)
!1749 = !DILocation(line: 254, column: 50, scope: !1720, inlinedAt: !1207)
!1750 = !DILocation(line: 254, column: 13, scope: !1720, inlinedAt: !1207)
!1751 = distinct !{!1751, !1713, !1752, !298}
!1752 = !DILocation(line: 257, column: 13, scope: !1714, inlinedAt: !1207)
!1753 = !DILocation(line: 252, column: 50, scope: !1712, inlinedAt: !1207)
!1754 = !DILocation(line: 252, column: 9, scope: !1712, inlinedAt: !1207)
!1755 = distinct !{!1755, !1705, !1756, !298}
!1756 = !DILocation(line: 258, column: 9, scope: !1706, inlinedAt: !1207)
!1757 = !DILocation(line: 250, column: 38, scope: !1704, inlinedAt: !1207)
!1758 = !DILocation(line: 250, column: 5, scope: !1704, inlinedAt: !1207)
!1759 = distinct !{!1759, !1619, !1760, !298}
!1760 = !DILocation(line: 259, column: 5, scope: !1620, inlinedAt: !1207)
!1761 = !DILocation(line: 260, column: 1, scope: !1204, inlinedAt: !1207)
!1762 = !DILocalVariable(name: "i", scope: !1763, file: !68, line: 461, type: !86)
!1763 = distinct !DILexicalBlock(scope: !989, file: !68, line: 461, column: 9)
!1764 = !DILocation(line: 0, scope: !1763)
!1765 = !DILocation(line: 461, column: 14, scope: !1763)
!1766 = !DILocation(line: 461, scope: !1763)
!1767 = !DILocation(line: 461, column: 27, scope: !1768)
!1768 = distinct !DILexicalBlock(scope: !1763, file: !68, line: 461, column: 9)
!1769 = !DILocation(line: 461, column: 9, scope: !1763)
!1770 = !DILocation(line: 463, column: 20, scope: !1771)
!1771 = distinct !DILexicalBlock(scope: !1768, file: !68, line: 462, column: 9)
!1772 = !DILocation(line: 463, column: 43, scope: !1771)
!1773 = !DILocation(line: 463, column: 13, scope: !1771)
!1774 = !DILocation(line: 463, column: 48, scope: !1771)
!1775 = !DILocation(line: 461, column: 39, scope: !1768)
!1776 = !DILocation(line: 461, column: 9, scope: !1768)
!1777 = distinct !{!1777, !1769, !1778, !298}
!1778 = !DILocation(line: 464, column: 9, scope: !1763)
!1779 = !DILocation(line: 466, column: 18, scope: !989)
!1780 = !DILocation(line: 0, scope: !433, inlinedAt: !1781)
!1781 = distinct !DILocation(line: 466, column: 9, scope: !989)
!1782 = !DILocation(line: 22, column: 10, scope: !442, inlinedAt: !1781)
!1783 = !DILocation(line: 22, scope: !442, inlinedAt: !1781)
!1784 = !DILocation(line: 22, column: 19, scope: !445, inlinedAt: !1781)
!1785 = !DILocation(line: 22, column: 5, scope: !442, inlinedAt: !1781)
!1786 = !DILocation(line: 23, column: 19, scope: !448, inlinedAt: !1781)
!1787 = !DILocation(line: 23, column: 24, scope: !448, inlinedAt: !1781)
!1788 = !DILocation(line: 23, column: 14, scope: !448, inlinedAt: !1781)
!1789 = !DILocation(line: 23, column: 17, scope: !448, inlinedAt: !1781)
!1790 = !DILocation(line: 24, column: 24, scope: !448, inlinedAt: !1781)
!1791 = !DILocation(line: 24, column: 17, scope: !448, inlinedAt: !1781)
!1792 = !DILocation(line: 24, column: 14, scope: !448, inlinedAt: !1781)
!1793 = !DILocation(line: 22, column: 34, scope: !445, inlinedAt: !1781)
!1794 = !DILocation(line: 22, column: 5, scope: !445, inlinedAt: !1781)
!1795 = distinct !{!1795, !1785, !1796, !298}
!1796 = !DILocation(line: 25, column: 5, scope: !442, inlinedAt: !1781)
!1797 = !DILocation(line: 470, column: 13, scope: !1798)
!1798 = distinct !DILexicalBlock(scope: !989, file: !68, line: 470, column: 13)
!1799 = !DILocation(line: 473, column: 13, scope: !1800)
!1800 = distinct !DILexicalBlock(scope: !1798, file: !68, line: 472, column: 16)
!1801 = !DILocation(line: 474, column: 13, scope: !1800)
!1802 = !DILocation(line: 444, column: 35, scope: !987)
!1803 = !DILocation(line: 444, column: 5, scope: !987)
!1804 = distinct !{!1804, !970, !1805, !298}
!1805 = !DILocation(line: 476, column: 5, scope: !971)
!1806 = !DILocalVariable(name: "i", scope: !1807, file: !68, line: 478, type: !86)
!1807 = distinct !DILexicalBlock(scope: !867, file: !68, line: 478, column: 5)
!1808 = !DILocation(line: 0, scope: !1807)
!1809 = !DILocation(line: 478, column: 10, scope: !1807)
!1810 = !DILocation(line: 478, scope: !1807)
!1811 = !DILocation(line: 478, column: 23, scope: !1812)
!1812 = distinct !DILexicalBlock(scope: !1807, file: !68, line: 478, column: 5)
!1813 = !DILocation(line: 478, column: 5, scope: !1807)
!1814 = !DILocation(line: 34, column: 5, scope: !1815, inlinedAt: !1817)
!1815 = distinct !DILexicalBlock(scope: !1816, file: !68, line: 34, column: 5)
!1816 = distinct !DISubprogram(name: "encode", scope: !68, file: !68, line: 32, type: !434, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1817 = distinct !DILocation(line: 484, column: 5, scope: !867)
!1818 = !DILocation(line: 479, column: 23, scope: !1819)
!1819 = distinct !DILexicalBlock(scope: !1812, file: !68, line: 478, column: 44)
!1820 = !DILocalVariable(name: "vi", scope: !867, file: !68, line: 376, type: !61)
!1821 = !DILocation(line: 480, column: 20, scope: !1819)
!1822 = !DILocation(line: 480, column: 29, scope: !1819)
!1823 = !DILocation(line: 480, column: 25, scope: !1819)
!1824 = !DILocalVariable(name: "a", arg: 1, scope: !1825, file: !668, line: 78, type: !90)
!1825 = distinct !DISubprogram(name: "mat_mul", scope: !668, file: !668, line: 78, type: !1826, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1826 = !DISubroutineType(types: !1827)
!1827 = !{null, !90, !90, !61, !86, !86, !86}
!1828 = !DILocation(line: 0, scope: !1825, inlinedAt: !1829)
!1829 = distinct !DILocation(line: 480, column: 9, scope: !1819)
!1830 = !DILocalVariable(name: "b", arg: 2, scope: !1825, file: !668, line: 78, type: !90)
!1831 = !DILocalVariable(name: "c", arg: 3, scope: !1825, file: !668, line: 79, type: !61)
!1832 = !DILocalVariable(name: "colrow_ab", arg: 4, scope: !1825, file: !668, line: 79, type: !86)
!1833 = !DILocalVariable(name: "row_a", arg: 5, scope: !1825, file: !668, line: 79, type: !86)
!1834 = !DILocalVariable(name: "col_b", arg: 6, scope: !1825, file: !668, line: 79, type: !86)
!1835 = !DILocalVariable(name: "i", scope: !1836, file: !668, line: 80, type: !86)
!1836 = distinct !DILexicalBlock(scope: !1825, file: !668, line: 80, column: 5)
!1837 = !DILocation(line: 0, scope: !1836, inlinedAt: !1829)
!1838 = !DILocation(line: 80, column: 10, scope: !1836, inlinedAt: !1829)
!1839 = !DILocation(line: 80, scope: !1836, inlinedAt: !1829)
!1840 = !DILocation(line: 80, column: 23, scope: !1841, inlinedAt: !1829)
!1841 = distinct !DILexicalBlock(scope: !1836, file: !668, line: 80, column: 5)
!1842 = !DILocation(line: 80, column: 5, scope: !1836, inlinedAt: !1829)
!1843 = !DILocation(line: 81, column: 9, scope: !1844, inlinedAt: !1829)
!1844 = distinct !DILexicalBlock(scope: !1845, file: !668, line: 81, column: 9)
!1845 = distinct !DILexicalBlock(scope: !1841, file: !668, line: 80, column: 53)
!1846 = !DILocation(line: 81, scope: !1844, inlinedAt: !1829)
!1847 = !DILocalVariable(name: "j", scope: !1844, file: !668, line: 81, type: !86)
!1848 = !DILocation(line: 0, scope: !1844, inlinedAt: !1829)
!1849 = !DILocation(line: 81, column: 27, scope: !1850, inlinedAt: !1829)
!1850 = distinct !DILexicalBlock(scope: !1844, file: !668, line: 81, column: 9)
!1851 = !DILocation(line: 82, column: 31, scope: !1852, inlinedAt: !1829)
!1852 = distinct !DILexicalBlock(scope: !1850, file: !668, line: 81, column: 46)
!1853 = !DILocalVariable(name: "a", arg: 1, scope: !1854, file: !668, line: 69, type: !90)
!1854 = distinct !DISubprogram(name: "lincomb", scope: !668, file: !668, line: 69, type: !1855, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1855 = !DISubroutineType(types: !1856)
!1856 = !{!51, !90, !90, !86, !86}
!1857 = !DILocation(line: 0, scope: !1854, inlinedAt: !1858)
!1858 = distinct !DILocation(line: 82, column: 18, scope: !1852, inlinedAt: !1829)
!1859 = !DILocalVariable(name: "b", arg: 2, scope: !1854, file: !668, line: 70, type: !90)
!1860 = !DILocalVariable(name: "n", arg: 3, scope: !1854, file: !668, line: 70, type: !86)
!1861 = !DILocalVariable(name: "m", arg: 4, scope: !1854, file: !668, line: 70, type: !86)
!1862 = !DILocalVariable(name: "ret", scope: !1854, file: !668, line: 71, type: !51)
!1863 = !DILocalVariable(name: "i", scope: !1864, file: !668, line: 72, type: !86)
!1864 = distinct !DILexicalBlock(scope: !1854, file: !668, line: 72, column: 5)
!1865 = !DILocation(line: 0, scope: !1864, inlinedAt: !1858)
!1866 = !DILocation(line: 72, column: 10, scope: !1864, inlinedAt: !1858)
!1867 = !DILocation(line: 72, scope: !1864, inlinedAt: !1858)
!1868 = !DILocation(line: 72, column: 23, scope: !1869, inlinedAt: !1858)
!1869 = distinct !DILexicalBlock(scope: !1864, file: !668, line: 72, column: 5)
!1870 = !DILocation(line: 72, column: 5, scope: !1864, inlinedAt: !1858)
!1871 = !DILocation(line: 73, column: 27, scope: !1872, inlinedAt: !1858)
!1872 = distinct !DILexicalBlock(scope: !1869, file: !668, line: 72, column: 41)
!1873 = !DILocation(line: 73, column: 33, scope: !1872, inlinedAt: !1858)
!1874 = !DILocation(line: 0, scope: !1539, inlinedAt: !1875)
!1875 = distinct !DILocation(line: 73, column: 21, scope: !1872, inlinedAt: !1858)
!1876 = !DILocation(line: 13, column: 10, scope: !1539, inlinedAt: !1875)
!1877 = !DILocation(line: 13, column: 7, scope: !1539, inlinedAt: !1875)
!1878 = !DILocation(line: 16, column: 17, scope: !1539, inlinedAt: !1875)
!1879 = !DILocation(line: 17, column: 13, scope: !1539, inlinedAt: !1875)
!1880 = !DILocation(line: 17, column: 17, scope: !1539, inlinedAt: !1875)
!1881 = !DILocation(line: 17, column: 7, scope: !1539, inlinedAt: !1875)
!1882 = !DILocation(line: 18, column: 13, scope: !1539, inlinedAt: !1875)
!1883 = !DILocation(line: 18, column: 17, scope: !1539, inlinedAt: !1875)
!1884 = !DILocation(line: 18, column: 7, scope: !1539, inlinedAt: !1875)
!1885 = !DILocation(line: 19, column: 13, scope: !1539, inlinedAt: !1875)
!1886 = !DILocation(line: 19, column: 17, scope: !1539, inlinedAt: !1875)
!1887 = !DILocation(line: 19, column: 7, scope: !1539, inlinedAt: !1875)
!1888 = !DILocation(line: 23, column: 37, scope: !1539, inlinedAt: !1875)
!1889 = !DILocation(line: 23, column: 52, scope: !1539, inlinedAt: !1875)
!1890 = !DILocation(line: 23, column: 43, scope: !1539, inlinedAt: !1875)
!1891 = !DILocation(line: 23, column: 59, scope: !1539, inlinedAt: !1875)
!1892 = !DILocalVariable(name: "a", arg: 1, scope: !1893, file: !668, line: 42, type: !51)
!1893 = distinct !DISubprogram(name: "add_f", scope: !668, file: !668, line: 42, type: !1540, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1894 = !DILocation(line: 0, scope: !1893, inlinedAt: !1895)
!1895 = distinct !DILocation(line: 73, column: 15, scope: !1872, inlinedAt: !1858)
!1896 = !DILocalVariable(name: "b", arg: 2, scope: !1893, file: !668, line: 42, type: !51)
!1897 = !DILocation(line: 43, column: 14, scope: !1893, inlinedAt: !1895)
!1898 = !DILocation(line: 72, column: 28, scope: !1869, inlinedAt: !1858)
!1899 = !DILocation(line: 72, column: 35, scope: !1869, inlinedAt: !1858)
!1900 = !DILocation(line: 72, column: 5, scope: !1869, inlinedAt: !1858)
!1901 = distinct !{!1901, !1870, !1902, !298}
!1902 = !DILocation(line: 74, column: 5, scope: !1864, inlinedAt: !1858)
!1903 = !DILocation(line: 82, column: 16, scope: !1852, inlinedAt: !1829)
!1904 = !DILocation(line: 81, column: 41, scope: !1850, inlinedAt: !1829)
!1905 = !DILocation(line: 81, column: 9, scope: !1850, inlinedAt: !1829)
!1906 = distinct !{!1906, !1843, !1907, !298}
!1907 = !DILocation(line: 83, column: 9, scope: !1844, inlinedAt: !1829)
!1908 = !DILocation(line: 80, column: 32, scope: !1841, inlinedAt: !1829)
!1909 = !DILocation(line: 80, column: 39, scope: !1841, inlinedAt: !1829)
!1910 = !DILocation(line: 80, column: 5, scope: !1841, inlinedAt: !1829)
!1911 = distinct !{!1911, !1842, !1912, !298}
!1912 = !DILocation(line: 84, column: 5, scope: !1836, inlinedAt: !1829)
!1913 = !DILocation(line: 479, column: 19, scope: !1819)
!1914 = !DILocation(line: 481, column: 31, scope: !1819)
!1915 = !DILocation(line: 481, column: 27, scope: !1819)
!1916 = !DILocalVariable(name: "a", arg: 1, scope: !1917, file: !668, line: 87, type: !90)
!1917 = distinct !DISubprogram(name: "mat_add", scope: !668, file: !668, line: 87, type: !1918, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1918 = !DISubroutineType(types: !1919)
!1919 = !{null, !90, !90, !61, !86, !86}
!1920 = !DILocation(line: 0, scope: !1917, inlinedAt: !1921)
!1921 = distinct !DILocation(line: 481, column: 9, scope: !1819)
!1922 = !DILocalVariable(name: "b", arg: 2, scope: !1917, file: !668, line: 87, type: !90)
!1923 = !DILocalVariable(name: "c", arg: 3, scope: !1917, file: !668, line: 88, type: !61)
!1924 = !DILocalVariable(name: "m", arg: 4, scope: !1917, file: !668, line: 88, type: !86)
!1925 = !DILocalVariable(name: "n", arg: 5, scope: !1917, file: !668, line: 88, type: !86)
!1926 = !DILocalVariable(name: "i", scope: !1927, file: !668, line: 89, type: !86)
!1927 = distinct !DILexicalBlock(scope: !1917, file: !668, line: 89, column: 5)
!1928 = !DILocation(line: 0, scope: !1927, inlinedAt: !1921)
!1929 = !DILocation(line: 89, column: 10, scope: !1927, inlinedAt: !1921)
!1930 = !DILocation(line: 89, scope: !1927, inlinedAt: !1921)
!1931 = !DILocation(line: 89, column: 23, scope: !1932, inlinedAt: !1921)
!1932 = distinct !DILexicalBlock(scope: !1927, file: !668, line: 89, column: 5)
!1933 = !DILocation(line: 89, column: 5, scope: !1927, inlinedAt: !1921)
!1934 = !DILocation(line: 90, column: 9, scope: !1935, inlinedAt: !1921)
!1935 = distinct !DILexicalBlock(scope: !1936, file: !668, line: 90, column: 9)
!1936 = distinct !DILexicalBlock(scope: !1932, file: !668, line: 89, column: 33)
!1937 = !DILocation(line: 90, scope: !1935, inlinedAt: !1921)
!1938 = !DILocalVariable(name: "j", scope: !1935, file: !668, line: 90, type: !86)
!1939 = !DILocation(line: 0, scope: !1935, inlinedAt: !1921)
!1940 = !DILocation(line: 90, column: 27, scope: !1941, inlinedAt: !1921)
!1941 = distinct !DILexicalBlock(scope: !1935, file: !668, line: 90, column: 9)
!1942 = !DILocation(line: 91, column: 42, scope: !1943, inlinedAt: !1921)
!1943 = distinct !DILexicalBlock(scope: !1941, file: !668, line: 90, column: 37)
!1944 = !DILocation(line: 91, column: 50, scope: !1943, inlinedAt: !1921)
!1945 = !DILocation(line: 91, column: 38, scope: !1943, inlinedAt: !1921)
!1946 = !DILocation(line: 91, column: 60, scope: !1943, inlinedAt: !1921)
!1947 = !DILocation(line: 91, column: 68, scope: !1943, inlinedAt: !1921)
!1948 = !DILocation(line: 91, column: 56, scope: !1943, inlinedAt: !1921)
!1949 = !DILocation(line: 0, scope: !1893, inlinedAt: !1950)
!1950 = distinct !DILocation(line: 91, column: 32, scope: !1943, inlinedAt: !1921)
!1951 = !DILocation(line: 43, column: 14, scope: !1893, inlinedAt: !1950)
!1952 = !DILocation(line: 91, column: 17, scope: !1943, inlinedAt: !1921)
!1953 = !DILocation(line: 91, column: 25, scope: !1943, inlinedAt: !1921)
!1954 = !DILocation(line: 91, column: 30, scope: !1943, inlinedAt: !1921)
!1955 = !DILocation(line: 90, column: 9, scope: !1941, inlinedAt: !1921)
!1956 = distinct !{!1956, !1934, !1957, !298}
!1957 = !DILocation(line: 92, column: 9, scope: !1935, inlinedAt: !1921)
!1958 = !DILocation(line: 89, column: 28, scope: !1932, inlinedAt: !1921)
!1959 = !DILocation(line: 89, column: 5, scope: !1932, inlinedAt: !1921)
!1960 = distinct !{!1960, !1933, !1961, !298}
!1961 = !DILocation(line: 93, column: 5, scope: !1927, inlinedAt: !1921)
!1962 = !DILocation(line: 482, column: 22, scope: !1819)
!1963 = !DILocation(line: 482, column: 18, scope: !1819)
!1964 = !DILocation(line: 482, column: 32, scope: !1819)
!1965 = !DILocation(line: 482, column: 61, scope: !1819)
!1966 = !DILocation(line: 482, column: 57, scope: !1819)
!1967 = !DILocation(line: 482, column: 9, scope: !1819)
!1968 = !DILocation(line: 478, column: 39, scope: !1812)
!1969 = !DILocation(line: 478, column: 5, scope: !1812)
!1970 = distinct !{!1970, !1813, !1971, !298}
!1971 = !DILocation(line: 483, column: 5, scope: !1807)
!1972 = !DILocation(line: 34, scope: !1815, inlinedAt: !1817)
!1973 = !DILocalVariable(name: "m", arg: 1, scope: !1816, file: !68, line: 32, type: !90)
!1974 = !DILocation(line: 0, scope: !1816, inlinedAt: !1817)
!1975 = !DILocalVariable(name: "i", scope: !1816, file: !68, line: 33, type: !86)
!1976 = !DILocation(line: 34, column: 19, scope: !1977, inlinedAt: !1817)
!1977 = distinct !DILexicalBlock(scope: !1815, file: !68, line: 34, column: 5)
!1978 = !DILocation(line: 35, column: 20, scope: !1979, inlinedAt: !1817)
!1979 = distinct !DILexicalBlock(scope: !1977, file: !68, line: 34, column: 44)
!1980 = !DILocation(line: 35, column: 31, scope: !1979, inlinedAt: !1817)
!1981 = !DILocation(line: 35, column: 27, scope: !1979, inlinedAt: !1817)
!1982 = !DILocation(line: 35, column: 36, scope: !1979, inlinedAt: !1817)
!1983 = !DILocation(line: 35, column: 24, scope: !1979, inlinedAt: !1817)
!1984 = !DILocation(line: 35, column: 9, scope: !1979, inlinedAt: !1817)
!1985 = !DILocation(line: 35, column: 17, scope: !1979, inlinedAt: !1817)
!1986 = !DILocation(line: 34, column: 31, scope: !1977, inlinedAt: !1817)
!1987 = !DILocation(line: 34, column: 38, scope: !1977, inlinedAt: !1817)
!1988 = !DILocation(line: 34, column: 5, scope: !1977, inlinedAt: !1817)
!1989 = distinct !{!1989, !1814, !1990, !298}
!1990 = !DILocation(line: 36, column: 5, scope: !1815, inlinedAt: !1817)
!1991 = !DILocation(line: 486, column: 34, scope: !867)
!1992 = !DILocation(line: 486, column: 5, scope: !867)
!1993 = !DILocation(line: 487, column: 13, scope: !867)
!1994 = !DILocation(line: 487, column: 5, scope: !867)
!1995 = !DILabel(scope: !867, name: "err", file: !68, line: 489)
!1996 = !DILocation(line: 489, column: 1, scope: !867)
!1997 = !DILocation(line: 490, column: 5, scope: !867)
!1998 = !DILocation(line: 491, column: 5, scope: !867)
!1999 = !DILocation(line: 492, column: 5, scope: !867)
!2000 = !DILocation(line: 493, column: 5, scope: !867)
!2001 = !DILocation(line: 494, column: 26, scope: !867)
!2002 = !DILocation(line: 494, column: 5, scope: !867)
!2003 = !DILocation(line: 495, column: 5, scope: !867)
!2004 = !DILocation(line: 496, column: 5, scope: !867)
!2005 = !DILocation(line: 497, column: 5, scope: !867)
!2006 = !DILocation(line: 498, column: 5, scope: !867)
!2007 = !DILocation(line: 499, column: 5, scope: !867)
!2008 = distinct !DISubprogram(name: "compute_rhs", scope: !68, file: !68, line: 43, type: !2009, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2009 = !DISubroutineType(types: !2010)
!2010 = !{null, !193, !52, !90, !61}
!2011 = !DILocalVariable(name: "p", arg: 1, scope: !2008, file: !68, line: 43, type: !193)
!2012 = !DILocation(line: 0, scope: !2008)
!2013 = !DILocalVariable(name: "vPv", arg: 2, scope: !2008, file: !68, line: 43, type: !52)
!2014 = !DILocalVariable(name: "t", arg: 3, scope: !2008, file: !68, line: 43, type: !90)
!2015 = !DILocalVariable(name: "y", arg: 4, scope: !2008, file: !68, line: 43, type: !61)
!2016 = !DILocalVariable(name: "top_pos", scope: !2008, file: !68, line: 48, type: !2017)
!2017 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !58)
!2018 = !DILocalVariable(name: "m_vec_limbs", scope: !2008, file: !68, line: 49, type: !2017)
!2019 = !DILocalVariable(name: "mask", scope: !2020, file: !68, line: 53, type: !53)
!2020 = distinct !DILexicalBlock(scope: !2021, file: !68, line: 52, column: 29)
!2021 = distinct !DILexicalBlock(scope: !2008, file: !68, line: 52, column: 8)
!2022 = !DILocation(line: 0, scope: !2020)
!2023 = !DILocalVariable(name: "i", scope: !2024, file: !68, line: 56, type: !86)
!2024 = distinct !DILexicalBlock(scope: !2020, file: !68, line: 56, column: 9)
!2025 = !DILocation(line: 0, scope: !2024)
!2026 = !DILocation(line: 56, column: 14, scope: !2024)
!2027 = !DILocation(line: 56, scope: !2024)
!2028 = !DILocation(line: 56, column: 27, scope: !2029)
!2029 = distinct !DILexicalBlock(scope: !2024, file: !68, line: 56, column: 9)
!2030 = !DILocation(line: 56, column: 9, scope: !2024)
!2031 = !DILocation(line: 58, column: 13, scope: !2032)
!2032 = distinct !DILexicalBlock(scope: !2029, file: !68, line: 57, column: 9)
!2033 = !DILocation(line: 58, column: 50, scope: !2032)
!2034 = !DILocation(line: 56, column: 53, scope: !2029)
!2035 = !DILocation(line: 56, column: 9, scope: !2029)
!2036 = distinct !{!2036, !2030, !2037, !298}
!2037 = !DILocation(line: 59, column: 9, scope: !2024)
!2038 = !DILocalVariable(name: "temp", scope: !2008, file: !68, line: 62, type: !278)
!2039 = !DILocation(line: 62, column: 14, scope: !2008)
!2040 = !DILocalVariable(name: "temp_bytes", scope: !2008, file: !68, line: 63, type: !61)
!2041 = !DILocalVariable(name: "i", scope: !2042, file: !68, line: 64, type: !86)
!2042 = distinct !DILexicalBlock(scope: !2008, file: !68, line: 64, column: 5)
!2043 = !DILocation(line: 0, scope: !2042)
!2044 = !DILocation(line: 64, column: 10, scope: !2042)
!2045 = !DILocation(line: 64, scope: !2042)
!2046 = !DILocation(line: 64, column: 36, scope: !2047)
!2047 = distinct !DILexicalBlock(scope: !2042, file: !68, line: 64, column: 5)
!2048 = !DILocation(line: 64, column: 5, scope: !2042)
!2049 = !DILocation(line: 65, column: 9, scope: !2050)
!2050 = distinct !DILexicalBlock(scope: !2051, file: !68, line: 65, column: 9)
!2051 = distinct !DILexicalBlock(scope: !2047, file: !68, line: 64, column: 48)
!2052 = !DILocation(line: 99, column: 5, scope: !2053)
!2053 = distinct !DILexicalBlock(scope: !2008, file: !68, line: 99, column: 5)
!2054 = !DILocation(line: 65, scope: !2050)
!2055 = !DILocalVariable(name: "j", scope: !2050, file: !68, line: 65, type: !86)
!2056 = !DILocation(line: 0, scope: !2050)
!2057 = !DILocation(line: 65, column: 27, scope: !2058)
!2058 = distinct !DILexicalBlock(scope: !2050, file: !68, line: 65, column: 9)
!2059 = !DILocation(line: 67, column: 34, scope: !2060)
!2060 = distinct !DILexicalBlock(scope: !2058, file: !68, line: 65, column: 46)
!2061 = !DILocation(line: 67, column: 54, scope: !2060)
!2062 = !DILocation(line: 67, column: 33, scope: !2060)
!2063 = !DILocalVariable(name: "top", scope: !2060, file: !68, line: 67, type: !51)
!2064 = !DILocation(line: 0, scope: !2060)
!2065 = !DILocation(line: 68, column: 13, scope: !2060)
!2066 = !DILocation(line: 68, column: 33, scope: !2060)
!2067 = !DILocalVariable(name: "k", scope: !2068, file: !68, line: 69, type: !86)
!2068 = distinct !DILexicalBlock(scope: !2060, file: !68, line: 69, column: 13)
!2069 = !DILocation(line: 0, scope: !2068)
!2070 = !DILocation(line: 69, column: 17, scope: !2068)
!2071 = !DILocation(line: 69, scope: !2068)
!2072 = !DILocation(line: 69, column: 43, scope: !2073)
!2073 = distinct !DILexicalBlock(scope: !2068, file: !68, line: 69, column: 13)
!2074 = !DILocation(line: 69, column: 13, scope: !2068)
!2075 = !DILocation(line: 74, column: 13, scope: !2076)
!2076 = distinct !DILexicalBlock(scope: !2060, file: !68, line: 74, column: 13)
!2077 = !DILocation(line: 70, column: 30, scope: !2078)
!2078 = distinct !DILexicalBlock(scope: !2073, file: !68, line: 69, column: 52)
!2079 = !DILocation(line: 70, column: 38, scope: !2078)
!2080 = !DILocation(line: 70, column: 23, scope: !2078)
!2081 = !DILocation(line: 70, column: 17, scope: !2078)
!2082 = !DILocation(line: 70, column: 27, scope: !2078)
!2083 = !DILocation(line: 71, column: 17, scope: !2078)
!2084 = !DILocation(line: 71, column: 25, scope: !2078)
!2085 = !DILocation(line: 69, column: 49, scope: !2073)
!2086 = !DILocation(line: 69, column: 13, scope: !2073)
!2087 = distinct !{!2087, !2074, !2088, !298}
!2088 = !DILocation(line: 72, column: 13, scope: !2068)
!2089 = !DILocation(line: 74, scope: !2076)
!2090 = !DILocalVariable(name: "jj", scope: !2076, file: !68, line: 74, type: !86)
!2091 = !DILocation(line: 0, scope: !2076)
!2092 = !DILocation(line: 74, column: 33, scope: !2093)
!2093 = distinct !DILexicalBlock(scope: !2076, file: !68, line: 74, column: 13)
!2094 = !DILocation(line: 92, column: 13, scope: !2095)
!2095 = distinct !DILexicalBlock(scope: !2060, file: !68, line: 92, column: 13)
!2096 = !DILocation(line: 75, column: 22, scope: !2097)
!2097 = distinct !DILexicalBlock(scope: !2098, file: !68, line: 75, column: 20)
!2098 = distinct !DILexicalBlock(scope: !2093, file: !68, line: 74, column: 53)
!2099 = !DILocation(line: 75, column: 25, scope: !2097)
!2100 = !DILocation(line: 79, column: 52, scope: !2101)
!2101 = distinct !DILexicalBlock(scope: !2097, file: !68, line: 75, column: 30)
!2102 = !DILocation(line: 0, scope: !1539, inlinedAt: !2103)
!2103 = distinct !DILocation(line: 79, column: 41, scope: !2101)
!2104 = !DILocation(line: 13, column: 10, scope: !1539, inlinedAt: !2103)
!2105 = !DILocation(line: 13, column: 7, scope: !1539, inlinedAt: !2103)
!2106 = !DILocation(line: 16, column: 17, scope: !1539, inlinedAt: !2103)
!2107 = !DILocation(line: 17, column: 13, scope: !1539, inlinedAt: !2103)
!2108 = !DILocation(line: 17, column: 17, scope: !1539, inlinedAt: !2103)
!2109 = !DILocation(line: 17, column: 7, scope: !1539, inlinedAt: !2103)
!2110 = !DILocation(line: 18, column: 13, scope: !1539, inlinedAt: !2103)
!2111 = !DILocation(line: 18, column: 17, scope: !1539, inlinedAt: !2103)
!2112 = !DILocation(line: 18, column: 7, scope: !1539, inlinedAt: !2103)
!2113 = !DILocation(line: 19, column: 13, scope: !1539, inlinedAt: !2103)
!2114 = !DILocation(line: 19, column: 17, scope: !1539, inlinedAt: !2103)
!2115 = !DILocation(line: 19, column: 7, scope: !1539, inlinedAt: !2103)
!2116 = !DILocation(line: 23, column: 37, scope: !1539, inlinedAt: !2103)
!2117 = !DILocation(line: 23, column: 52, scope: !1539, inlinedAt: !2103)
!2118 = !DILocation(line: 23, column: 43, scope: !1539, inlinedAt: !2103)
!2119 = !DILocation(line: 23, column: 59, scope: !1539, inlinedAt: !2103)
!2120 = !DILocation(line: 79, column: 34, scope: !2101)
!2121 = !DILocation(line: 79, column: 21, scope: !2101)
!2122 = !DILocation(line: 79, column: 38, scope: !2101)
!2123 = !DILocation(line: 81, column: 17, scope: !2101)
!2124 = !DILocation(line: 86, column: 52, scope: !2125)
!2125 = distinct !DILexicalBlock(scope: !2097, file: !68, line: 82, column: 22)
!2126 = !DILocation(line: 0, scope: !1539, inlinedAt: !2127)
!2127 = distinct !DILocation(line: 86, column: 41, scope: !2125)
!2128 = !DILocation(line: 13, column: 10, scope: !1539, inlinedAt: !2127)
!2129 = !DILocation(line: 13, column: 7, scope: !1539, inlinedAt: !2127)
!2130 = !DILocation(line: 16, column: 17, scope: !1539, inlinedAt: !2127)
!2131 = !DILocation(line: 17, column: 13, scope: !1539, inlinedAt: !2127)
!2132 = !DILocation(line: 17, column: 17, scope: !1539, inlinedAt: !2127)
!2133 = !DILocation(line: 17, column: 7, scope: !1539, inlinedAt: !2127)
!2134 = !DILocation(line: 18, column: 13, scope: !1539, inlinedAt: !2127)
!2135 = !DILocation(line: 18, column: 17, scope: !1539, inlinedAt: !2127)
!2136 = !DILocation(line: 18, column: 7, scope: !1539, inlinedAt: !2127)
!2137 = !DILocation(line: 19, column: 13, scope: !1539, inlinedAt: !2127)
!2138 = !DILocation(line: 19, column: 17, scope: !1539, inlinedAt: !2127)
!2139 = !DILocation(line: 19, column: 7, scope: !1539, inlinedAt: !2127)
!2140 = !DILocation(line: 23, column: 37, scope: !1539, inlinedAt: !2127)
!2141 = !DILocation(line: 23, column: 52, scope: !1539, inlinedAt: !2127)
!2142 = !DILocation(line: 23, column: 43, scope: !1539, inlinedAt: !2127)
!2143 = !DILocation(line: 23, column: 59, scope: !1539, inlinedAt: !2127)
!2144 = !DILocation(line: 86, column: 73, scope: !2125)
!2145 = !DILocation(line: 86, column: 34, scope: !2125)
!2146 = !DILocation(line: 86, column: 21, scope: !2125)
!2147 = !DILocation(line: 86, column: 38, scope: !2125)
!2148 = !DILocation(line: 74, column: 49, scope: !2093)
!2149 = !DILocation(line: 74, column: 13, scope: !2093)
!2150 = distinct !{!2150, !2075, !2151, !298}
!2151 = !DILocation(line: 89, column: 13, scope: !2076)
!2152 = !DILocation(line: 92, scope: !2095)
!2153 = !DILocalVariable(name: "k", scope: !2095, file: !68, line: 92, type: !58)
!2154 = !DILocation(line: 0, scope: !2095)
!2155 = !DILocation(line: 92, column: 31, scope: !2156)
!2156 = distinct !DILexicalBlock(scope: !2095, file: !68, line: 92, column: 13)
!2157 = !DILocation(line: 93, column: 36, scope: !2158)
!2158 = distinct !DILexicalBlock(scope: !2156, file: !68, line: 92, column: 51)
!2159 = !DILocation(line: 93, column: 49, scope: !2158)
!2160 = !DILocation(line: 93, column: 28, scope: !2158)
!2161 = !DILocation(line: 93, column: 78, scope: !2158)
!2162 = !DILocation(line: 93, column: 91, scope: !2158)
!2163 = !DILocation(line: 93, column: 104, scope: !2158)
!2164 = !DILocation(line: 93, column: 83, scope: !2158)
!2165 = !DILocation(line: 93, column: 82, scope: !2158)
!2166 = !DILocation(line: 93, column: 73, scope: !2158)
!2167 = !DILocation(line: 93, column: 17, scope: !2158)
!2168 = !DILocation(line: 93, column: 25, scope: !2158)
!2169 = !DILocation(line: 92, column: 48, scope: !2156)
!2170 = !DILocation(line: 92, column: 13, scope: !2156)
!2171 = distinct !{!2171, !2094, !2172, !298}
!2172 = !DILocation(line: 94, column: 13, scope: !2095)
!2173 = !DILocation(line: 65, column: 42, scope: !2058)
!2174 = !DILocation(line: 65, column: 9, scope: !2058)
!2175 = distinct !{!2175, !2049, !2176, !298}
!2176 = !DILocation(line: 95, column: 9, scope: !2050)
!2177 = !DILocation(line: 64, column: 44, scope: !2047)
!2178 = !DILocation(line: 64, column: 5, scope: !2047)
!2179 = distinct !{!2179, !2048, !2180, !298}
!2180 = !DILocation(line: 96, column: 5, scope: !2042)
!2181 = !DILocation(line: 99, scope: !2053)
!2182 = !DILocalVariable(name: "i", scope: !2053, file: !68, line: 99, type: !86)
!2183 = !DILocation(line: 0, scope: !2053)
!2184 = !DILocation(line: 99, column: 23, scope: !2185)
!2185 = distinct !DILexicalBlock(scope: !2053, file: !68, line: 99, column: 5)
!2186 = !DILocation(line: 105, column: 18, scope: !2187)
!2187 = distinct !DILexicalBlock(scope: !2185, file: !68, line: 100, column: 5)
!2188 = !DILocation(line: 105, column: 40, scope: !2187)
!2189 = !DILocation(line: 105, column: 28, scope: !2187)
!2190 = !DILocation(line: 105, column: 44, scope: !2187)
!2191 = !DILocation(line: 105, column: 25, scope: !2187)
!2192 = !DILocation(line: 105, column: 9, scope: !2187)
!2193 = !DILocation(line: 105, column: 16, scope: !2187)
!2194 = !DILocation(line: 106, column: 21, scope: !2187)
!2195 = !DILocation(line: 106, column: 18, scope: !2187)
!2196 = !DILocation(line: 106, column: 40, scope: !2187)
!2197 = !DILocation(line: 106, column: 28, scope: !2187)
!2198 = !DILocation(line: 106, column: 44, scope: !2187)
!2199 = !DILocation(line: 106, column: 25, scope: !2187)
!2200 = !DILocation(line: 106, column: 12, scope: !2187)
!2201 = !DILocation(line: 106, column: 9, scope: !2187)
!2202 = !DILocation(line: 106, column: 16, scope: !2187)
!2203 = !DILocation(line: 99, column: 38, scope: !2185)
!2204 = !DILocation(line: 99, column: 5, scope: !2185)
!2205 = distinct !{!2205, !2052, !2206, !298}
!2206 = !DILocation(line: 108, column: 5, scope: !2053)
!2207 = !DILocation(line: 109, column: 1, scope: !2008)
!2208 = distinct !DISubprogram(name: "pqmayo_MAYO_3_ref_mayo_sign", scope: !68, file: !68, line: 502, type: !337, scopeLine: 504, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2209 = !DILocalVariable(name: "p", arg: 1, scope: !2208, file: !68, line: 502, type: !193)
!2210 = !DILocation(line: 0, scope: !2208)
!2211 = !DILocalVariable(name: "sm", arg: 2, scope: !2208, file: !68, line: 502, type: !61)
!2212 = !DILocalVariable(name: "smlen", arg: 3, scope: !2208, file: !68, line: 503, type: !339)
!2213 = !DILocalVariable(name: "m", arg: 4, scope: !2208, file: !68, line: 503, type: !90)
!2214 = !DILocalVariable(name: "mlen", arg: 5, scope: !2208, file: !68, line: 504, type: !58)
!2215 = !DILocalVariable(name: "csk", arg: 6, scope: !2208, file: !68, line: 504, type: !90)
!2216 = !DILocalVariable(name: "ret", scope: !2208, file: !68, line: 505, type: !86)
!2217 = !DILocalVariable(name: "param_sig_bytes", scope: !2208, file: !68, line: 506, type: !275)
!2218 = !DILocation(line: 508, column: 16, scope: !2208)
!2219 = !DILocation(line: 508, column: 5, scope: !2208)
!2220 = !DILocation(line: 509, column: 50, scope: !2208)
!2221 = !DILocalVariable(name: "siglen", scope: !2208, file: !68, line: 507, type: !58)
!2222 = !DILocation(line: 509, column: 11, scope: !2208)
!2223 = !DILocation(line: 510, column: 13, scope: !2224)
!2224 = distinct !DILexicalBlock(scope: !2208, file: !68, line: 510, column: 9)
!2225 = !DILocation(line: 510, column: 24, scope: !2224)
!2226 = !DILocation(line: 511, column: 23, scope: !2227)
!2227 = distinct !DILexicalBlock(scope: !2224, file: !68, line: 510, column: 62)
!2228 = !DILocation(line: 511, column: 30, scope: !2227)
!2229 = !DILocation(line: 511, column: 9, scope: !2227)
!2230 = !DILocation(line: 512, column: 9, scope: !2227)
!2231 = !DILocation(line: 515, column: 14, scope: !2208)
!2232 = !DILocation(line: 515, column: 21, scope: !2208)
!2233 = !DILocation(line: 515, column: 12, scope: !2208)
!2234 = !DILocation(line: 515, column: 5, scope: !2208)
!2235 = !DILabel(scope: !2208, name: "err", file: !68, line: 516)
!2236 = !DILocation(line: 516, column: 1, scope: !2208)
!2237 = !DILocation(line: 517, column: 5, scope: !2208)
!2238 = !DILocation(line: 0, scope: !336)
!2239 = !DILocation(line: 524, column: 15, scope: !349)
!2240 = !DILocation(line: 527, column: 36, scope: !336)
!2241 = !DILocation(line: 527, column: 61, scope: !336)
!2242 = !DILocation(line: 527, column: 18, scope: !336)
!2243 = !DILocation(line: 530, column: 16, scope: !355)
!2244 = !DILocation(line: 531, column: 23, scope: !357)
!2245 = !DILocation(line: 531, column: 15, scope: !357)
!2246 = !DILocation(line: 532, column: 23, scope: !357)
!2247 = !DILocation(line: 532, column: 9, scope: !357)
!2248 = !DILocation(line: 533, column: 5, scope: !357)
!2249 = !DILocation(line: 536, column: 1, scope: !336)
!2250 = distinct !DISubprogram(name: "pqmayo_MAYO_3_ref_mayo_verify", scope: !68, file: !68, line: 617, type: !2251, scopeLine: 619, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2251 = !DISubroutineType(types: !2252)
!2252 = !{!86, !193, !90, !58, !90, !90}
!2253 = !DILocalVariable(name: "p", arg: 1, scope: !2250, file: !68, line: 617, type: !193)
!2254 = !DILocation(line: 0, scope: !2250)
!2255 = !DILocalVariable(name: "m", arg: 2, scope: !2250, file: !68, line: 617, type: !90)
!2256 = !DILocalVariable(name: "mlen", arg: 3, scope: !2250, file: !68, line: 618, type: !58)
!2257 = !DILocalVariable(name: "sig", arg: 4, scope: !2250, file: !68, line: 618, type: !90)
!2258 = !DILocalVariable(name: "cpk", arg: 5, scope: !2250, file: !68, line: 619, type: !90)
!2259 = !DILocalVariable(name: "tEnc", scope: !2250, file: !68, line: 620, type: !877)
!2260 = !DILocation(line: 620, column: 19, scope: !2250)
!2261 = !DILocalVariable(name: "t", scope: !2250, file: !68, line: 621, type: !882)
!2262 = !DILocation(line: 621, column: 19, scope: !2250)
!2263 = !DILocalVariable(name: "y", scope: !2250, file: !68, line: 622, type: !2264)
!2264 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 1728, elements: !2265)
!2265 = !{!2266}
!2266 = !DISubrange(count: 216)
!2267 = !DILocation(line: 622, column: 19, scope: !2250)
!2268 = !DILocalVariable(name: "s", scope: !2250, file: !68, line: 623, type: !906)
!2269 = !DILocation(line: 623, column: 19, scope: !2250)
!2270 = !DILocalVariable(name: "pk", scope: !2250, file: !68, line: 624, type: !2271)
!2271 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 3145408, elements: !2272)
!2272 = !{!2273}
!2273 = !DISubrange(count: 49147)
!2274 = !DILocation(line: 624, column: 14, scope: !2250)
!2275 = !DILocalVariable(name: "tmp", scope: !2250, file: !68, line: 625, type: !2276)
!2276 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 640, elements: !2277)
!2277 = !{!2278}
!2278 = !DISubrange(count: 80)
!2279 = !DILocation(line: 625, column: 19, scope: !2250)
!2280 = !DILocalVariable(name: "param_m", scope: !2250, file: !68, line: 627, type: !275)
!2281 = !DILocalVariable(name: "param_n", scope: !2250, file: !68, line: 628, type: !275)
!2282 = !DILocalVariable(name: "param_k", scope: !2250, file: !68, line: 629, type: !275)
!2283 = !DILocalVariable(name: "param_m_bytes", scope: !2250, file: !68, line: 630, type: !275)
!2284 = !DILocalVariable(name: "param_sig_bytes", scope: !2250, file: !68, line: 631, type: !275)
!2285 = !DILocalVariable(name: "param_digest_bytes", scope: !2250, file: !68, line: 632, type: !275)
!2286 = !DILocalVariable(name: "param_salt_bytes", scope: !2250, file: !68, line: 633, type: !275)
!2287 = !DILocation(line: 0, scope: !248, inlinedAt: !2288)
!2288 = distinct !DILocation(line: 635, column: 15, scope: !2250)
!2289 = !DILocation(line: 0, scope: !256, inlinedAt: !2290)
!2290 = distinct !DILocation(line: 610, column: 5, scope: !248, inlinedAt: !2288)
!2291 = !DILocation(line: 284, column: 5, scope: !256, inlinedAt: !2290)
!2292 = !DILocation(line: 265, column: 14, scope: !265, inlinedAt: !2293)
!2293 = distinct !DILocation(line: 285, column: 5, scope: !256, inlinedAt: !2290)
!2294 = !DILocation(line: 0, scope: !265, inlinedAt: !2293)
!2295 = !DILocation(line: 0, scope: !280, inlinedAt: !2293)
!2296 = !DILocation(line: 266, column: 10, scope: !280, inlinedAt: !2293)
!2297 = !DILocation(line: 266, column: 28, scope: !284, inlinedAt: !2293)
!2298 = !DILocation(line: 266, column: 5, scope: !280, inlinedAt: !2293)
!2299 = !DILocation(line: 266, scope: !280, inlinedAt: !2293)
!2300 = !DILocation(line: 268, column: 27, scope: !288, inlinedAt: !2293)
!2301 = !DILocation(line: 268, column: 29, scope: !288, inlinedAt: !2293)
!2302 = !DILocation(line: 268, column: 24, scope: !288, inlinedAt: !2293)
!2303 = !DILocation(line: 268, column: 9, scope: !288, inlinedAt: !2293)
!2304 = !DILocation(line: 269, column: 36, scope: !288, inlinedAt: !2293)
!2305 = !DILocation(line: 269, column: 21, scope: !288, inlinedAt: !2293)
!2306 = !DILocation(line: 269, column: 9, scope: !288, inlinedAt: !2293)
!2307 = !DILocation(line: 266, column: 5, scope: !284, inlinedAt: !2293)
!2308 = distinct !{!2308, !2298, !2309, !298}
!2309 = !DILocation(line: 270, column: 5, scope: !280, inlinedAt: !2293)
!2310 = !DILocation(line: 271, column: 1, scope: !265, inlinedAt: !2293)
!2311 = !DILocation(line: 612, column: 23, scope: !248, inlinedAt: !2288)
!2312 = !DILocation(line: 612, column: 72, scope: !248, inlinedAt: !2288)
!2313 = !DILocation(line: 265, column: 14, scope: !265, inlinedAt: !2314)
!2314 = distinct !DILocation(line: 612, column: 5, scope: !248, inlinedAt: !2288)
!2315 = !DILocation(line: 0, scope: !265, inlinedAt: !2314)
!2316 = !DILocation(line: 0, scope: !280, inlinedAt: !2314)
!2317 = !DILocation(line: 266, column: 10, scope: !280, inlinedAt: !2314)
!2318 = !DILocation(line: 266, column: 28, scope: !284, inlinedAt: !2314)
!2319 = !DILocation(line: 266, column: 5, scope: !280, inlinedAt: !2314)
!2320 = !DILocation(line: 266, scope: !280, inlinedAt: !2314)
!2321 = !DILocation(line: 268, column: 27, scope: !288, inlinedAt: !2314)
!2322 = !DILocation(line: 268, column: 29, scope: !288, inlinedAt: !2314)
!2323 = !DILocation(line: 268, column: 24, scope: !288, inlinedAt: !2314)
!2324 = !DILocation(line: 268, column: 9, scope: !288, inlinedAt: !2314)
!2325 = !DILocation(line: 269, column: 36, scope: !288, inlinedAt: !2314)
!2326 = !DILocation(line: 269, column: 21, scope: !288, inlinedAt: !2314)
!2327 = !DILocation(line: 269, column: 9, scope: !288, inlinedAt: !2314)
!2328 = !DILocation(line: 266, column: 5, scope: !284, inlinedAt: !2314)
!2329 = distinct !{!2329, !2319, !2330, !298}
!2330 = !DILocation(line: 270, column: 5, scope: !280, inlinedAt: !2314)
!2331 = !DILocation(line: 271, column: 1, scope: !265, inlinedAt: !2314)
!2332 = !DILocalVariable(name: "ret", scope: !2250, file: !68, line: 635, type: !86)
!2333 = !DILocalVariable(name: "P1", scope: !2250, file: !68, line: 640, type: !52)
!2334 = !DILocation(line: 641, column: 23, scope: !2250)
!2335 = !DILocalVariable(name: "P2", scope: !2250, file: !68, line: 641, type: !52)
!2336 = !DILocalVariable(name: "P3", scope: !2250, file: !68, line: 642, type: !52)
!2337 = !DILocation(line: 657, column: 5, scope: !2250)
!2338 = !DILocation(line: 660, column: 16, scope: !2250)
!2339 = !DILocation(line: 660, column: 60, scope: !2250)
!2340 = !DILocation(line: 660, column: 5, scope: !2250)
!2341 = !DILocation(line: 662, column: 5, scope: !2250)
!2342 = !DILocation(line: 0, scope: !433, inlinedAt: !2343)
!2343 = distinct !DILocation(line: 663, column: 5, scope: !2250)
!2344 = !DILocation(line: 22, column: 10, scope: !442, inlinedAt: !2343)
!2345 = !DILocation(line: 22, scope: !442, inlinedAt: !2343)
!2346 = !DILocation(line: 22, column: 19, scope: !445, inlinedAt: !2343)
!2347 = !DILocation(line: 22, column: 5, scope: !442, inlinedAt: !2343)
!2348 = !DILocation(line: 22, column: 5, scope: !442, inlinedAt: !2349)
!2349 = distinct !DILocation(line: 666, column: 5, scope: !2250)
!2350 = !DILocation(line: 23, column: 19, scope: !448, inlinedAt: !2343)
!2351 = !DILocation(line: 23, column: 24, scope: !448, inlinedAt: !2343)
!2352 = !DILocation(line: 23, column: 14, scope: !448, inlinedAt: !2343)
!2353 = !DILocation(line: 23, column: 17, scope: !448, inlinedAt: !2343)
!2354 = !DILocation(line: 24, column: 24, scope: !448, inlinedAt: !2343)
!2355 = !DILocation(line: 24, column: 17, scope: !448, inlinedAt: !2343)
!2356 = !DILocation(line: 24, column: 14, scope: !448, inlinedAt: !2343)
!2357 = !DILocation(line: 22, column: 34, scope: !445, inlinedAt: !2343)
!2358 = !DILocation(line: 22, column: 5, scope: !445, inlinedAt: !2343)
!2359 = distinct !{!2359, !2347, !2360, !298}
!2360 = !DILocation(line: 25, column: 5, scope: !442, inlinedAt: !2343)
!2361 = !DILocation(line: 22, scope: !442, inlinedAt: !2349)
!2362 = !DILocation(line: 0, scope: !433, inlinedAt: !2349)
!2363 = !DILocation(line: 22, column: 19, scope: !445, inlinedAt: !2349)
!2364 = !DILocation(line: 23, column: 19, scope: !448, inlinedAt: !2349)
!2365 = !DILocation(line: 23, column: 24, scope: !448, inlinedAt: !2349)
!2366 = !DILocation(line: 23, column: 14, scope: !448, inlinedAt: !2349)
!2367 = !DILocation(line: 23, column: 17, scope: !448, inlinedAt: !2349)
!2368 = !DILocation(line: 24, column: 24, scope: !448, inlinedAt: !2349)
!2369 = !DILocation(line: 24, column: 17, scope: !448, inlinedAt: !2349)
!2370 = !DILocation(line: 24, column: 14, scope: !448, inlinedAt: !2349)
!2371 = !DILocation(line: 22, column: 34, scope: !445, inlinedAt: !2349)
!2372 = !DILocation(line: 22, column: 5, scope: !445, inlinedAt: !2349)
!2373 = distinct !{!2373, !2348, !2374, !298}
!2374 = !DILocation(line: 25, column: 5, scope: !442, inlinedAt: !2349)
!2375 = !DILocation(line: 289, column: 14, scope: !2376, inlinedAt: !2379)
!2376 = distinct !DISubprogram(name: "eval_public_map", scope: !68, file: !68, line: 288, type: !2377, scopeLine: 288, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2377 = !DISubroutineType(types: !2378)
!2378 = !{null, !193, !90, !486, !486, !486, !61}
!2379 = distinct !DILocation(line: 668, column: 5, scope: !2250)
!2380 = !DILocalVariable(name: "p", arg: 1, scope: !2376, file: !68, line: 288, type: !193)
!2381 = !DILocation(line: 0, scope: !2376, inlinedAt: !2379)
!2382 = !DILocalVariable(name: "s", arg: 2, scope: !2376, file: !68, line: 288, type: !90)
!2383 = !DILocalVariable(name: "P1", arg: 3, scope: !2376, file: !68, line: 288, type: !486)
!2384 = !DILocalVariable(name: "P2", arg: 4, scope: !2376, file: !68, line: 288, type: !486)
!2385 = !DILocalVariable(name: "P3", arg: 5, scope: !2376, file: !68, line: 288, type: !486)
!2386 = !DILocalVariable(name: "eval", arg: 6, scope: !2376, file: !68, line: 288, type: !61)
!2387 = !DILocalVariable(name: "SPS", scope: !2376, file: !68, line: 289, type: !2388)
!2388 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 54208, elements: !2389)
!2389 = !{!2390}
!2390 = !DISubrange(count: 847)
!2391 = !DILocation(line: 286, column: 14, scope: !2392, inlinedAt: !2395)
!2392 = distinct !DISubprogram(name: "m_calculate_PS_SPS", scope: !483, file: !483, line: 277, type: !2393, scopeLine: 278, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2393 = !DISubroutineType(types: !2394)
!2394 = !{null, !193, !486, !486, !486, !90, !52}
!2395 = distinct !DILocation(line: 291, column: 5, scope: !2376, inlinedAt: !2379)
!2396 = !DILocalVariable(name: "p", arg: 1, scope: !2392, file: !483, line: 277, type: !193)
!2397 = !DILocation(line: 0, scope: !2392, inlinedAt: !2395)
!2398 = !DILocalVariable(name: "P1", arg: 2, scope: !2392, file: !483, line: 277, type: !486)
!2399 = !DILocalVariable(name: "P2", arg: 3, scope: !2392, file: !483, line: 277, type: !486)
!2400 = !DILocalVariable(name: "P3", arg: 4, scope: !2392, file: !483, line: 277, type: !486)
!2401 = !DILocalVariable(name: "s", arg: 5, scope: !2392, file: !483, line: 277, type: !90)
!2402 = !DILocalVariable(name: "SPS", arg: 6, scope: !2392, file: !483, line: 278, type: !52)
!2403 = !DILocalVariable(name: "PS", scope: !2392, file: !483, line: 286, type: !2404)
!2404 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 581504, elements: !2405)
!2405 = !{!2406}
!2406 = !DISubrange(count: 9086)
!2407 = !DILocation(line: 157, column: 14, scope: !2408, inlinedAt: !2411)
!2408 = distinct !DISubprogram(name: "mayo_generic_m_calculate_PS", scope: !483, file: !483, line: 151, type: !2409, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2409 = !DISubroutineType(types: !2410)
!2410 = !{null, !486, !486, !486, !90, !275, !275, !275, !275, !52}
!2411 = distinct !DILocation(line: 287, column: 5, scope: !2392, inlinedAt: !2395)
!2412 = !DILocalVariable(name: "P1", arg: 1, scope: !2408, file: !483, line: 151, type: !486)
!2413 = !DILocation(line: 0, scope: !2408, inlinedAt: !2411)
!2414 = !DILocalVariable(name: "P2", arg: 2, scope: !2408, file: !483, line: 151, type: !486)
!2415 = !DILocalVariable(name: "P3", arg: 3, scope: !2408, file: !483, line: 151, type: !486)
!2416 = !DILocalVariable(name: "S", arg: 4, scope: !2408, file: !483, line: 151, type: !90)
!2417 = !DILocalVariable(name: "m", arg: 5, scope: !2408, file: !483, line: 152, type: !275)
!2418 = !DILocalVariable(name: "v", arg: 6, scope: !2408, file: !483, line: 152, type: !275)
!2419 = !DILocalVariable(name: "o", arg: 7, scope: !2408, file: !483, line: 152, type: !275)
!2420 = !DILocalVariable(name: "k", arg: 8, scope: !2408, file: !483, line: 152, type: !275)
!2421 = !DILocalVariable(name: "PS", arg: 9, scope: !2408, file: !483, line: 152, type: !52)
!2422 = !DILocalVariable(name: "n", scope: !2408, file: !483, line: 154, type: !275)
!2423 = !DILocalVariable(name: "m_vec_limbs", scope: !2408, file: !483, line: 155, type: !275)
!2424 = !DILocalVariable(name: "accumulator", scope: !2408, file: !483, line: 157, type: !2425)
!2425 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 9304064, elements: !2426)
!2426 = !{!2427}
!2427 = !DISubrange(count: 145376)
!2428 = !DILocalVariable(name: "P1_used", scope: !2408, file: !483, line: 158, type: !86)
!2429 = !DILocalVariable(name: "row", scope: !2430, file: !483, line: 159, type: !86)
!2430 = distinct !DILexicalBlock(scope: !2408, file: !483, line: 159, column: 5)
!2431 = !DILocation(line: 0, scope: !2430, inlinedAt: !2411)
!2432 = !DILocation(line: 159, column: 10, scope: !2430, inlinedAt: !2411)
!2433 = !DILocation(line: 158, column: 9, scope: !2408, inlinedAt: !2411)
!2434 = !DILocation(line: 159, scope: !2430, inlinedAt: !2411)
!2435 = !DILocation(line: 159, column: 27, scope: !2436, inlinedAt: !2411)
!2436 = distinct !DILexicalBlock(scope: !2430, file: !483, line: 159, column: 5)
!2437 = !DILocation(line: 159, column: 5, scope: !2430, inlinedAt: !2411)
!2438 = !DILocation(line: 160, column: 9, scope: !2439, inlinedAt: !2411)
!2439 = distinct !DILexicalBlock(scope: !2440, file: !483, line: 160, column: 9)
!2440 = distinct !DILexicalBlock(scope: !2436, file: !483, line: 159, column: 39)
!2441 = !DILocation(line: 642, column: 23, scope: !2250)
!2442 = !DILocation(line: 175, column: 5, scope: !2443, inlinedAt: !2411)
!2443 = distinct !DILexicalBlock(scope: !2408, file: !483, line: 175, column: 5)
!2444 = !DILocation(line: 160, scope: !2439, inlinedAt: !2411)
!2445 = !DILocalVariable(name: "j", scope: !2439, file: !483, line: 160, type: !86)
!2446 = !DILocation(line: 0, scope: !2439, inlinedAt: !2411)
!2447 = !DILocation(line: 160, column: 29, scope: !2448, inlinedAt: !2411)
!2448 = distinct !DILexicalBlock(scope: !2439, file: !483, line: 160, column: 9)
!2449 = !DILocation(line: 167, column: 9, scope: !2450, inlinedAt: !2411)
!2450 = distinct !DILexicalBlock(scope: !2440, file: !483, line: 167, column: 9)
!2451 = !DILocation(line: 161, column: 13, scope: !2452, inlinedAt: !2411)
!2452 = distinct !DILexicalBlock(scope: !2453, file: !483, line: 161, column: 13)
!2453 = distinct !DILexicalBlock(scope: !2448, file: !483, line: 160, column: 39)
!2454 = !DILocation(line: 161, scope: !2452, inlinedAt: !2411)
!2455 = !DILocalVariable(name: "col", scope: !2452, file: !483, line: 161, type: !86)
!2456 = !DILocation(line: 0, scope: !2452, inlinedAt: !2411)
!2457 = !DILocation(line: 161, column: 35, scope: !2458, inlinedAt: !2411)
!2458 = distinct !DILexicalBlock(scope: !2452, file: !483, line: 161, column: 13)
!2459 = !DILocation(line: 162, column: 43, scope: !2460, inlinedAt: !2411)
!2460 = distinct !DILexicalBlock(scope: !2458, file: !483, line: 161, column: 47)
!2461 = !DILocation(line: 162, column: 91, scope: !2460, inlinedAt: !2411)
!2462 = !DILocation(line: 162, column: 95, scope: !2460, inlinedAt: !2411)
!2463 = !DILocation(line: 162, column: 102, scope: !2460, inlinedAt: !2411)
!2464 = !DILocation(line: 162, column: 115, scope: !2460, inlinedAt: !2411)
!2465 = !DILocation(line: 162, column: 109, scope: !2460, inlinedAt: !2411)
!2466 = !DILocation(line: 162, column: 107, scope: !2460, inlinedAt: !2411)
!2467 = !DILocation(line: 162, column: 82, scope: !2460, inlinedAt: !2411)
!2468 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2469, file: !658, line: 22, type: !86)
!2469 = distinct !DISubprogram(name: "m_vec_add", scope: !658, file: !658, line: 22, type: !2470, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2470 = !DISubroutineType(types: !2471)
!2471 = !{null, !86, !486, !52}
!2472 = !DILocation(line: 0, scope: !2469, inlinedAt: !2473)
!2473 = distinct !DILocation(line: 162, column: 17, scope: !2460, inlinedAt: !2411)
!2474 = !DILocalVariable(name: "in", arg: 2, scope: !2469, file: !658, line: 22, type: !486)
!2475 = !DILocalVariable(name: "acc", arg: 3, scope: !2469, file: !658, line: 22, type: !52)
!2476 = !DILocalVariable(name: "i", scope: !2477, file: !658, line: 24, type: !58)
!2477 = distinct !DILexicalBlock(scope: !2469, file: !658, line: 24, column: 5)
!2478 = !DILocation(line: 0, scope: !2477, inlinedAt: !2473)
!2479 = !DILocation(line: 24, column: 10, scope: !2477, inlinedAt: !2473)
!2480 = !DILocation(line: 24, scope: !2477, inlinedAt: !2473)
!2481 = !DILocation(line: 24, column: 26, scope: !2482, inlinedAt: !2473)
!2482 = distinct !DILexicalBlock(scope: !2477, file: !658, line: 24, column: 5)
!2483 = !DILocation(line: 24, column: 5, scope: !2477, inlinedAt: !2473)
!2484 = !DILocation(line: 26, column: 19, scope: !2485, inlinedAt: !2473)
!2485 = distinct !DILexicalBlock(scope: !2482, file: !658, line: 25, column: 5)
!2486 = !DILocation(line: 26, column: 9, scope: !2485, inlinedAt: !2473)
!2487 = !DILocation(line: 26, column: 16, scope: !2485, inlinedAt: !2473)
!2488 = !DILocation(line: 24, column: 46, scope: !2482, inlinedAt: !2473)
!2489 = !DILocation(line: 24, column: 5, scope: !2482, inlinedAt: !2473)
!2490 = distinct !{!2490, !2483, !2491, !298}
!2491 = !DILocation(line: 27, column: 5, scope: !2477, inlinedAt: !2473)
!2492 = !DILocation(line: 161, column: 43, scope: !2458, inlinedAt: !2411)
!2493 = !DILocation(line: 161, column: 13, scope: !2458, inlinedAt: !2411)
!2494 = distinct !{!2494, !2451, !2495, !298}
!2495 = !DILocation(line: 163, column: 13, scope: !2452, inlinedAt: !2411)
!2496 = !DILocation(line: 164, column: 21, scope: !2453, inlinedAt: !2411)
!2497 = !DILocation(line: 160, column: 35, scope: !2448, inlinedAt: !2411)
!2498 = !DILocation(line: 160, column: 9, scope: !2448, inlinedAt: !2411)
!2499 = distinct !{!2499, !2438, !2500, !298}
!2500 = !DILocation(line: 165, column: 9, scope: !2439, inlinedAt: !2411)
!2501 = !DILocation(line: 167, scope: !2450, inlinedAt: !2411)
!2502 = !DILocalVariable(name: "j", scope: !2450, file: !483, line: 167, type: !86)
!2503 = !DILocation(line: 0, scope: !2450, inlinedAt: !2411)
!2504 = !DILocation(line: 167, column: 27, scope: !2505, inlinedAt: !2411)
!2505 = distinct !DILexicalBlock(scope: !2450, file: !483, line: 167, column: 9)
!2506 = !DILocation(line: 168, column: 13, scope: !2507, inlinedAt: !2411)
!2507 = distinct !DILexicalBlock(scope: !2508, file: !483, line: 168, column: 13)
!2508 = distinct !DILexicalBlock(scope: !2505, file: !483, line: 167, column: 37)
!2509 = !DILocation(line: 168, scope: !2507, inlinedAt: !2411)
!2510 = !DILocalVariable(name: "col", scope: !2507, file: !483, line: 168, type: !86)
!2511 = !DILocation(line: 0, scope: !2507, inlinedAt: !2411)
!2512 = !DILocation(line: 168, column: 35, scope: !2513, inlinedAt: !2411)
!2513 = distinct !DILexicalBlock(scope: !2507, file: !483, line: 168, column: 13)
!2514 = !DILocation(line: 169, column: 50, scope: !2515, inlinedAt: !2411)
!2515 = distinct !DILexicalBlock(scope: !2513, file: !483, line: 168, column: 47)
!2516 = !DILocation(line: 169, column: 54, scope: !2515, inlinedAt: !2411)
!2517 = !DILocation(line: 169, column: 43, scope: !2515, inlinedAt: !2411)
!2518 = !DILocation(line: 169, column: 93, scope: !2515, inlinedAt: !2411)
!2519 = !DILocation(line: 169, column: 97, scope: !2515, inlinedAt: !2411)
!2520 = !DILocation(line: 169, column: 104, scope: !2515, inlinedAt: !2411)
!2521 = !DILocation(line: 169, column: 118, scope: !2515, inlinedAt: !2411)
!2522 = !DILocation(line: 169, column: 111, scope: !2515, inlinedAt: !2411)
!2523 = !DILocation(line: 169, column: 109, scope: !2515, inlinedAt: !2411)
!2524 = !DILocation(line: 169, column: 84, scope: !2515, inlinedAt: !2411)
!2525 = !DILocation(line: 0, scope: !2469, inlinedAt: !2526)
!2526 = distinct !DILocation(line: 169, column: 17, scope: !2515, inlinedAt: !2411)
!2527 = !DILocation(line: 0, scope: !2477, inlinedAt: !2526)
!2528 = !DILocation(line: 24, column: 10, scope: !2477, inlinedAt: !2526)
!2529 = !DILocation(line: 24, scope: !2477, inlinedAt: !2526)
!2530 = !DILocation(line: 24, column: 26, scope: !2482, inlinedAt: !2526)
!2531 = !DILocation(line: 24, column: 5, scope: !2477, inlinedAt: !2526)
!2532 = !DILocation(line: 26, column: 19, scope: !2485, inlinedAt: !2526)
!2533 = !DILocation(line: 26, column: 9, scope: !2485, inlinedAt: !2526)
!2534 = !DILocation(line: 26, column: 16, scope: !2485, inlinedAt: !2526)
!2535 = !DILocation(line: 24, column: 46, scope: !2482, inlinedAt: !2526)
!2536 = !DILocation(line: 24, column: 5, scope: !2482, inlinedAt: !2526)
!2537 = distinct !{!2537, !2531, !2538, !298}
!2538 = !DILocation(line: 27, column: 5, scope: !2477, inlinedAt: !2526)
!2539 = !DILocation(line: 168, column: 43, scope: !2513, inlinedAt: !2411)
!2540 = !DILocation(line: 168, column: 13, scope: !2513, inlinedAt: !2411)
!2541 = distinct !{!2541, !2506, !2542, !298}
!2542 = !DILocation(line: 170, column: 13, scope: !2507, inlinedAt: !2411)
!2543 = !DILocation(line: 167, column: 33, scope: !2505, inlinedAt: !2411)
!2544 = !DILocation(line: 167, column: 9, scope: !2505, inlinedAt: !2411)
!2545 = distinct !{!2545, !2449, !2546, !298}
!2546 = !DILocation(line: 171, column: 9, scope: !2450, inlinedAt: !2411)
!2547 = !DILocation(line: 159, column: 35, scope: !2436, inlinedAt: !2411)
!2548 = !DILocation(line: 159, column: 5, scope: !2436, inlinedAt: !2411)
!2549 = distinct !{!2549, !2437, !2550, !298}
!2550 = !DILocation(line: 172, column: 5, scope: !2430, inlinedAt: !2411)
!2551 = !DILocation(line: 174, column: 9, scope: !2408, inlinedAt: !2411)
!2552 = !DILocation(line: 175, scope: !2443, inlinedAt: !2411)
!2553 = !DILocalVariable(name: "row", scope: !2443, file: !483, line: 175, type: !86)
!2554 = !DILocation(line: 0, scope: !2443, inlinedAt: !2411)
!2555 = !DILocalVariable(name: "P3_used", scope: !2408, file: !483, line: 174, type: !86)
!2556 = !DILocation(line: 175, column: 27, scope: !2557, inlinedAt: !2411)
!2557 = distinct !DILexicalBlock(scope: !2443, file: !483, line: 175, column: 5)
!2558 = !DILocation(line: 176, column: 9, scope: !2559, inlinedAt: !2411)
!2559 = distinct !DILexicalBlock(scope: !2560, file: !483, line: 176, column: 9)
!2560 = distinct !DILexicalBlock(scope: !2557, file: !483, line: 175, column: 39)
!2561 = !DILocation(line: 186, column: 5, scope: !2408, inlinedAt: !2411)
!2562 = !DILocation(line: 176, scope: !2559, inlinedAt: !2411)
!2563 = !DILocalVariable(name: "j", scope: !2559, file: !483, line: 176, type: !86)
!2564 = !DILocation(line: 0, scope: !2559, inlinedAt: !2411)
!2565 = !DILocation(line: 176, column: 29, scope: !2566, inlinedAt: !2411)
!2566 = distinct !DILexicalBlock(scope: !2559, file: !483, line: 176, column: 9)
!2567 = !DILocation(line: 177, column: 13, scope: !2568, inlinedAt: !2411)
!2568 = distinct !DILexicalBlock(scope: !2569, file: !483, line: 177, column: 13)
!2569 = distinct !DILexicalBlock(scope: !2566, file: !483, line: 176, column: 39)
!2570 = !DILocation(line: 177, scope: !2568, inlinedAt: !2411)
!2571 = !DILocalVariable(name: "col", scope: !2568, file: !483, line: 177, type: !86)
!2572 = !DILocation(line: 0, scope: !2568, inlinedAt: !2411)
!2573 = !DILocation(line: 177, column: 35, scope: !2574, inlinedAt: !2411)
!2574 = distinct !DILexicalBlock(scope: !2568, file: !483, line: 177, column: 13)
!2575 = !DILocation(line: 178, column: 43, scope: !2576, inlinedAt: !2411)
!2576 = distinct !DILexicalBlock(scope: !2574, file: !483, line: 177, column: 47)
!2577 = !DILocation(line: 178, column: 89, scope: !2576, inlinedAt: !2411)
!2578 = !DILocation(line: 178, column: 93, scope: !2576, inlinedAt: !2411)
!2579 = !DILocation(line: 178, column: 100, scope: !2576, inlinedAt: !2411)
!2580 = !DILocation(line: 178, column: 113, scope: !2576, inlinedAt: !2411)
!2581 = !DILocation(line: 178, column: 107, scope: !2576, inlinedAt: !2411)
!2582 = !DILocation(line: 178, column: 105, scope: !2576, inlinedAt: !2411)
!2583 = !DILocation(line: 178, column: 80, scope: !2576, inlinedAt: !2411)
!2584 = !DILocation(line: 0, scope: !2469, inlinedAt: !2585)
!2585 = distinct !DILocation(line: 178, column: 17, scope: !2576, inlinedAt: !2411)
!2586 = !DILocation(line: 0, scope: !2477, inlinedAt: !2585)
!2587 = !DILocation(line: 24, column: 10, scope: !2477, inlinedAt: !2585)
!2588 = !DILocation(line: 24, scope: !2477, inlinedAt: !2585)
!2589 = !DILocation(line: 24, column: 26, scope: !2482, inlinedAt: !2585)
!2590 = !DILocation(line: 24, column: 5, scope: !2477, inlinedAt: !2585)
!2591 = !DILocation(line: 26, column: 19, scope: !2485, inlinedAt: !2585)
!2592 = !DILocation(line: 26, column: 9, scope: !2485, inlinedAt: !2585)
!2593 = !DILocation(line: 26, column: 16, scope: !2485, inlinedAt: !2585)
!2594 = !DILocation(line: 24, column: 46, scope: !2482, inlinedAt: !2585)
!2595 = !DILocation(line: 24, column: 5, scope: !2482, inlinedAt: !2585)
!2596 = distinct !{!2596, !2590, !2597, !298}
!2597 = !DILocation(line: 27, column: 5, scope: !2477, inlinedAt: !2585)
!2598 = !DILocation(line: 177, column: 43, scope: !2574, inlinedAt: !2411)
!2599 = !DILocation(line: 177, column: 13, scope: !2574, inlinedAt: !2411)
!2600 = distinct !{!2600, !2567, !2601, !298}
!2601 = !DILocation(line: 179, column: 13, scope: !2568, inlinedAt: !2411)
!2602 = !DILocation(line: 180, column: 21, scope: !2569, inlinedAt: !2411)
!2603 = !DILocation(line: 176, column: 35, scope: !2566, inlinedAt: !2411)
!2604 = !DILocation(line: 176, column: 9, scope: !2566, inlinedAt: !2411)
!2605 = distinct !{!2605, !2558, !2606, !298}
!2606 = !DILocation(line: 181, column: 9, scope: !2559, inlinedAt: !2411)
!2607 = !DILocation(line: 175, column: 35, scope: !2557, inlinedAt: !2411)
!2608 = !DILocation(line: 175, column: 5, scope: !2557, inlinedAt: !2411)
!2609 = distinct !{!2609, !2442, !2610, !298}
!2610 = !DILocation(line: 182, column: 5, scope: !2443, inlinedAt: !2411)
!2611 = !DILocalVariable(name: "i", scope: !2408, file: !483, line: 185, type: !86)
!2612 = !DILocation(line: 186, column: 14, scope: !2408, inlinedAt: !2411)
!2613 = !DILocation(line: 187, column: 54, scope: !2614, inlinedAt: !2411)
!2614 = distinct !DILexicalBlock(scope: !2408, file: !483, line: 186, column: 23)
!2615 = !DILocation(line: 187, column: 81, scope: !2614, inlinedAt: !2411)
!2616 = !DILocation(line: 187, column: 9, scope: !2614, inlinedAt: !2411)
!2617 = !DILocation(line: 188, column: 10, scope: !2614, inlinedAt: !2411)
!2618 = distinct !{!2618, !2561, !2619, !298}
!2619 = !DILocation(line: 189, column: 5, scope: !2408, inlinedAt: !2411)
!2620 = !DILocation(line: 191, column: 1, scope: !2408, inlinedAt: !2411)
!2621 = !DILocation(line: 196, column: 14, scope: !2622, inlinedAt: !2625)
!2622 = distinct !DISubprogram(name: "mayo_generic_m_calculate_SPS", scope: !483, file: !483, line: 195, type: !2623, scopeLine: 195, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2623 = !DISubroutineType(types: !2624)
!2624 = !{null, !486, !90, !86, !86, !86, !52}
!2625 = distinct !DILocation(line: 290, column: 5, scope: !2392, inlinedAt: !2395)
!2626 = !DILocalVariable(name: "PS", arg: 1, scope: !2622, file: !483, line: 195, type: !486)
!2627 = !DILocation(line: 0, scope: !2622, inlinedAt: !2625)
!2628 = !DILocalVariable(name: "S", arg: 2, scope: !2622, file: !483, line: 195, type: !90)
!2629 = !DILocalVariable(name: "m", arg: 3, scope: !2622, file: !483, line: 195, type: !86)
!2630 = !DILocalVariable(name: "k", arg: 4, scope: !2622, file: !483, line: 195, type: !86)
!2631 = !DILocalVariable(name: "n", arg: 5, scope: !2622, file: !483, line: 195, type: !86)
!2632 = !DILocalVariable(name: "SPS", arg: 6, scope: !2622, file: !483, line: 195, type: !52)
!2633 = !DILocalVariable(name: "accumulator", scope: !2622, file: !483, line: 196, type: !2634)
!2634 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 867328, elements: !2635)
!2635 = !{!2636}
!2636 = !DISubrange(count: 13552)
!2637 = !DILocalVariable(name: "m_vec_limbs", scope: !2622, file: !483, line: 197, type: !275)
!2638 = !DILocalVariable(name: "row", scope: !2639, file: !483, line: 198, type: !86)
!2639 = distinct !DILexicalBlock(scope: !2622, file: !483, line: 198, column: 5)
!2640 = !DILocation(line: 0, scope: !2639, inlinedAt: !2625)
!2641 = !DILocation(line: 198, column: 10, scope: !2639, inlinedAt: !2625)
!2642 = !DILocation(line: 198, scope: !2639, inlinedAt: !2625)
!2643 = !DILocation(line: 198, column: 27, scope: !2644, inlinedAt: !2625)
!2644 = distinct !DILexicalBlock(scope: !2639, file: !483, line: 198, column: 5)
!2645 = !DILocation(line: 198, column: 5, scope: !2639, inlinedAt: !2625)
!2646 = !DILocation(line: 199, column: 9, scope: !2647, inlinedAt: !2625)
!2647 = distinct !DILexicalBlock(scope: !2648, file: !483, line: 199, column: 9)
!2648 = distinct !DILexicalBlock(scope: !2644, file: !483, line: 198, column: 39)
!2649 = !DILocation(line: 208, column: 5, scope: !2622, inlinedAt: !2625)
!2650 = !DILocation(line: 199, scope: !2647, inlinedAt: !2625)
!2651 = !DILocalVariable(name: "j", scope: !2647, file: !483, line: 199, type: !86)
!2652 = !DILocation(line: 0, scope: !2647, inlinedAt: !2625)
!2653 = !DILocation(line: 199, column: 27, scope: !2654, inlinedAt: !2625)
!2654 = distinct !DILexicalBlock(scope: !2647, file: !483, line: 199, column: 9)
!2655 = !DILocation(line: 200, column: 13, scope: !2656, inlinedAt: !2625)
!2656 = distinct !DILexicalBlock(scope: !2657, file: !483, line: 200, column: 13)
!2657 = distinct !DILexicalBlock(scope: !2654, file: !483, line: 199, column: 37)
!2658 = !DILocation(line: 200, scope: !2656, inlinedAt: !2625)
!2659 = !DILocalVariable(name: "col", scope: !2656, file: !483, line: 200, type: !86)
!2660 = !DILocation(line: 0, scope: !2656, inlinedAt: !2625)
!2661 = !DILocation(line: 200, column: 35, scope: !2662, inlinedAt: !2625)
!2662 = distinct !DILexicalBlock(scope: !2656, file: !483, line: 200, column: 13)
!2663 = !DILocation(line: 201, column: 52, scope: !2664, inlinedAt: !2625)
!2664 = distinct !DILexicalBlock(scope: !2662, file: !483, line: 200, column: 50)
!2665 = !DILocation(line: 201, column: 56, scope: !2664, inlinedAt: !2625)
!2666 = !DILocation(line: 201, column: 47, scope: !2664, inlinedAt: !2625)
!2667 = !DILocation(line: 201, column: 99, scope: !2664, inlinedAt: !2625)
!2668 = !DILocation(line: 201, column: 103, scope: !2664, inlinedAt: !2625)
!2669 = !DILocation(line: 201, column: 110, scope: !2664, inlinedAt: !2625)
!2670 = !DILocation(line: 201, column: 123, scope: !2664, inlinedAt: !2625)
!2671 = !DILocation(line: 201, column: 117, scope: !2664, inlinedAt: !2625)
!2672 = !DILocation(line: 201, column: 115, scope: !2664, inlinedAt: !2625)
!2673 = !DILocation(line: 201, column: 90, scope: !2664, inlinedAt: !2625)
!2674 = !DILocation(line: 0, scope: !2469, inlinedAt: !2675)
!2675 = distinct !DILocation(line: 201, column: 21, scope: !2664, inlinedAt: !2625)
!2676 = !DILocation(line: 0, scope: !2477, inlinedAt: !2675)
!2677 = !DILocation(line: 24, column: 10, scope: !2477, inlinedAt: !2675)
!2678 = !DILocation(line: 24, scope: !2477, inlinedAt: !2675)
!2679 = !DILocation(line: 24, column: 26, scope: !2482, inlinedAt: !2675)
!2680 = !DILocation(line: 24, column: 5, scope: !2477, inlinedAt: !2675)
!2681 = !DILocation(line: 26, column: 19, scope: !2485, inlinedAt: !2675)
!2682 = !DILocation(line: 26, column: 9, scope: !2485, inlinedAt: !2675)
!2683 = !DILocation(line: 26, column: 16, scope: !2485, inlinedAt: !2675)
!2684 = !DILocation(line: 24, column: 46, scope: !2482, inlinedAt: !2675)
!2685 = !DILocation(line: 24, column: 5, scope: !2482, inlinedAt: !2675)
!2686 = distinct !{!2686, !2680, !2687, !298}
!2687 = !DILocation(line: 27, column: 5, scope: !2477, inlinedAt: !2675)
!2688 = !DILocation(line: 200, column: 44, scope: !2662, inlinedAt: !2625)
!2689 = !DILocation(line: 200, column: 13, scope: !2662, inlinedAt: !2625)
!2690 = distinct !{!2690, !2655, !2691, !298}
!2691 = !DILocation(line: 202, column: 13, scope: !2656, inlinedAt: !2625)
!2692 = !DILocation(line: 199, column: 33, scope: !2654, inlinedAt: !2625)
!2693 = !DILocation(line: 199, column: 9, scope: !2654, inlinedAt: !2625)
!2694 = distinct !{!2694, !2646, !2695, !298}
!2695 = !DILocation(line: 203, column: 9, scope: !2647, inlinedAt: !2625)
!2696 = !DILocation(line: 198, column: 35, scope: !2644, inlinedAt: !2625)
!2697 = !DILocation(line: 198, column: 5, scope: !2644, inlinedAt: !2625)
!2698 = distinct !{!2698, !2645, !2699, !298}
!2699 = !DILocation(line: 204, column: 5, scope: !2639, inlinedAt: !2625)
!2700 = !DILocalVariable(name: "i", scope: !2622, file: !483, line: 207, type: !86)
!2701 = !DILocation(line: 208, column: 14, scope: !2622, inlinedAt: !2625)
!2702 = !DILocation(line: 209, column: 54, scope: !2703, inlinedAt: !2625)
!2703 = distinct !DILexicalBlock(scope: !2622, file: !483, line: 208, column: 21)
!2704 = !DILocation(line: 209, column: 82, scope: !2703, inlinedAt: !2625)
!2705 = !DILocation(line: 209, column: 9, scope: !2703, inlinedAt: !2625)
!2706 = !DILocation(line: 210, column: 10, scope: !2703, inlinedAt: !2625)
!2707 = distinct !{!2707, !2649, !2708, !298}
!2708 = !DILocation(line: 211, column: 5, scope: !2622, inlinedAt: !2625)
!2709 = !DILocation(line: 212, column: 1, scope: !2622, inlinedAt: !2625)
!2710 = !DILocation(line: 292, column: 1, scope: !2392, inlinedAt: !2395)
!2711 = !DILocalVariable(name: "zero", scope: !2376, file: !68, line: 292, type: !882)
!2712 = !DILocation(line: 292, column: 19, scope: !2376, inlinedAt: !2379)
!2713 = !DILocation(line: 293, column: 5, scope: !2376, inlinedAt: !2379)
!2714 = !DILocation(line: 294, column: 1, scope: !2376, inlinedAt: !2379)
!2715 = !DILocation(line: 670, column: 9, scope: !2716)
!2716 = distinct !DILexicalBlock(scope: !2250, file: !68, line: 670, column: 9)
!2717 = !DILocation(line: 670, column: 31, scope: !2716)
!2718 = !DILocation(line: 674, column: 1, scope: !2250)
!2719 = !DILocation(line: 0, scope: !248)
!2720 = !DILocation(line: 0, scope: !256, inlinedAt: !2721)
!2721 = distinct !DILocation(line: 610, column: 5, scope: !248)
!2722 = !DILocation(line: 284, column: 5, scope: !256, inlinedAt: !2721)
!2723 = !DILocation(line: 265, column: 14, scope: !265, inlinedAt: !2724)
!2724 = distinct !DILocation(line: 285, column: 5, scope: !256, inlinedAt: !2721)
!2725 = !DILocation(line: 0, scope: !265, inlinedAt: !2724)
!2726 = !DILocation(line: 0, scope: !280, inlinedAt: !2724)
!2727 = !DILocation(line: 266, column: 10, scope: !280, inlinedAt: !2724)
!2728 = !DILocation(line: 266, column: 28, scope: !284, inlinedAt: !2724)
!2729 = !DILocation(line: 266, column: 5, scope: !280, inlinedAt: !2724)
!2730 = !DILocation(line: 266, scope: !280, inlinedAt: !2724)
!2731 = !DILocation(line: 268, column: 27, scope: !288, inlinedAt: !2724)
!2732 = !DILocation(line: 268, column: 29, scope: !288, inlinedAt: !2724)
!2733 = !DILocation(line: 268, column: 24, scope: !288, inlinedAt: !2724)
!2734 = !DILocation(line: 268, column: 9, scope: !288, inlinedAt: !2724)
!2735 = !DILocation(line: 269, column: 36, scope: !288, inlinedAt: !2724)
!2736 = !DILocation(line: 269, column: 21, scope: !288, inlinedAt: !2724)
!2737 = !DILocation(line: 269, column: 9, scope: !288, inlinedAt: !2724)
!2738 = !DILocation(line: 266, column: 5, scope: !284, inlinedAt: !2724)
!2739 = distinct !{!2739, !2729, !2740, !298}
!2740 = !DILocation(line: 270, column: 5, scope: !280, inlinedAt: !2724)
!2741 = !DILocation(line: 271, column: 1, scope: !265, inlinedAt: !2724)
!2742 = !DILocation(line: 612, column: 23, scope: !248)
!2743 = !DILocation(line: 612, column: 72, scope: !248)
!2744 = !DILocation(line: 265, column: 14, scope: !265, inlinedAt: !2745)
!2745 = distinct !DILocation(line: 612, column: 5, scope: !248)
!2746 = !DILocation(line: 0, scope: !265, inlinedAt: !2745)
!2747 = !DILocation(line: 0, scope: !280, inlinedAt: !2745)
!2748 = !DILocation(line: 266, column: 10, scope: !280, inlinedAt: !2745)
!2749 = !DILocation(line: 266, column: 28, scope: !284, inlinedAt: !2745)
!2750 = !DILocation(line: 266, column: 5, scope: !280, inlinedAt: !2745)
!2751 = !DILocation(line: 266, scope: !280, inlinedAt: !2745)
!2752 = !DILocation(line: 268, column: 27, scope: !288, inlinedAt: !2745)
!2753 = !DILocation(line: 268, column: 29, scope: !288, inlinedAt: !2745)
!2754 = !DILocation(line: 268, column: 24, scope: !288, inlinedAt: !2745)
!2755 = !DILocation(line: 268, column: 9, scope: !288, inlinedAt: !2745)
!2756 = !DILocation(line: 269, column: 36, scope: !288, inlinedAt: !2745)
!2757 = !DILocation(line: 269, column: 21, scope: !288, inlinedAt: !2745)
!2758 = !DILocation(line: 269, column: 9, scope: !288, inlinedAt: !2745)
!2759 = !DILocation(line: 266, column: 5, scope: !284, inlinedAt: !2745)
!2760 = distinct !{!2760, !2750, !2761, !298}
!2761 = !DILocation(line: 270, column: 5, scope: !280, inlinedAt: !2745)
!2762 = !DILocation(line: 271, column: 1, scope: !265, inlinedAt: !2745)
!2763 = !DILocation(line: 614, column: 5, scope: !248)
!2764 = distinct !DISubprogram(name: "m_vec_multiply_bins", scope: !658, file: !658, line: 66, type: !2765, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2765 = !DISubroutineType(types: !2766)
!2766 = !{null, !86, !52, !52}
!2767 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2764, file: !658, line: 66, type: !86)
!2768 = !DILocation(line: 0, scope: !2764)
!2769 = !DILocalVariable(name: "bins", arg: 2, scope: !2764, file: !658, line: 66, type: !52)
!2770 = !DILocalVariable(name: "out", arg: 3, scope: !2764, file: !658, line: 66, type: !52)
!2771 = !DILocation(line: 67, column: 44, scope: !2764)
!2772 = !DILocation(line: 67, column: 73, scope: !2764)
!2773 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2774, file: !658, line: 56, type: !86)
!2774 = distinct !DISubprogram(name: "m_vec_mul_add_x_inv", scope: !658, file: !658, line: 56, type: !2470, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2775 = !DILocation(line: 0, scope: !2774, inlinedAt: !2776)
!2776 = distinct !DILocation(line: 67, column: 5, scope: !2764)
!2777 = !DILocalVariable(name: "in", arg: 2, scope: !2774, file: !658, line: 56, type: !486)
!2778 = !DILocalVariable(name: "acc", arg: 3, scope: !2774, file: !658, line: 56, type: !52)
!2779 = !DILocalVariable(name: "mask_lsb", scope: !2774, file: !658, line: 58, type: !53)
!2780 = !DILocalVariable(name: "i", scope: !2781, file: !658, line: 59, type: !86)
!2781 = distinct !DILexicalBlock(scope: !2774, file: !658, line: 59, column: 5)
!2782 = !DILocation(line: 0, scope: !2781, inlinedAt: !2776)
!2783 = !DILocation(line: 59, column: 9, scope: !2781, inlinedAt: !2776)
!2784 = !DILocation(line: 59, scope: !2781, inlinedAt: !2776)
!2785 = !DILocation(line: 59, column: 20, scope: !2786, inlinedAt: !2776)
!2786 = distinct !DILexicalBlock(scope: !2781, file: !658, line: 59, column: 5)
!2787 = !DILocation(line: 59, column: 5, scope: !2781, inlinedAt: !2776)
!2788 = !DILocation(line: 60, column: 22, scope: !2789, inlinedAt: !2776)
!2789 = distinct !DILexicalBlock(scope: !2786, file: !658, line: 59, column: 43)
!2790 = !DILocation(line: 60, column: 28, scope: !2789, inlinedAt: !2776)
!2791 = !DILocalVariable(name: "t", scope: !2789, file: !658, line: 60, type: !53)
!2792 = !DILocation(line: 0, scope: !2789, inlinedAt: !2776)
!2793 = !DILocation(line: 61, column: 32, scope: !2789, inlinedAt: !2776)
!2794 = !DILocation(line: 61, column: 43, scope: !2789, inlinedAt: !2776)
!2795 = !DILocation(line: 61, column: 38, scope: !2789, inlinedAt: !2776)
!2796 = !DILocation(line: 61, column: 9, scope: !2789, inlinedAt: !2776)
!2797 = !DILocation(line: 61, column: 16, scope: !2789, inlinedAt: !2776)
!2798 = !DILocation(line: 59, column: 40, scope: !2786, inlinedAt: !2776)
!2799 = !DILocation(line: 59, column: 5, scope: !2786, inlinedAt: !2776)
!2800 = distinct !{!2800, !2787, !2801, !298}
!2801 = !DILocation(line: 62, column: 5, scope: !2781, inlinedAt: !2776)
!2802 = !DILocation(line: 68, column: 40, scope: !2764)
!2803 = !DILocation(line: 68, column: 69, scope: !2764)
!2804 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2805, file: !658, line: 46, type: !86)
!2805 = distinct !DISubprogram(name: "m_vec_mul_add_x", scope: !658, file: !658, line: 46, type: !2470, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2806 = !DILocation(line: 0, scope: !2805, inlinedAt: !2807)
!2807 = distinct !DILocation(line: 68, column: 5, scope: !2764)
!2808 = !DILocalVariable(name: "in", arg: 2, scope: !2805, file: !658, line: 46, type: !486)
!2809 = !DILocalVariable(name: "acc", arg: 3, scope: !2805, file: !658, line: 46, type: !52)
!2810 = !DILocalVariable(name: "mask_msb", scope: !2805, file: !658, line: 48, type: !53)
!2811 = !DILocalVariable(name: "i", scope: !2812, file: !658, line: 49, type: !86)
!2812 = distinct !DILexicalBlock(scope: !2805, file: !658, line: 49, column: 5)
!2813 = !DILocation(line: 0, scope: !2812, inlinedAt: !2807)
!2814 = !DILocation(line: 49, column: 9, scope: !2812, inlinedAt: !2807)
!2815 = !DILocation(line: 49, scope: !2812, inlinedAt: !2807)
!2816 = !DILocation(line: 49, column: 20, scope: !2817, inlinedAt: !2807)
!2817 = distinct !DILexicalBlock(scope: !2812, file: !658, line: 49, column: 5)
!2818 = !DILocation(line: 49, column: 5, scope: !2812, inlinedAt: !2807)
!2819 = !DILocation(line: 50, column: 22, scope: !2820, inlinedAt: !2807)
!2820 = distinct !DILexicalBlock(scope: !2817, file: !658, line: 49, column: 43)
!2821 = !DILocalVariable(name: "t", scope: !2820, file: !658, line: 50, type: !53)
!2822 = !DILocation(line: 0, scope: !2820, inlinedAt: !2807)
!2823 = !DILocation(line: 51, column: 32, scope: !2820, inlinedAt: !2807)
!2824 = !DILocation(line: 51, column: 44, scope: !2820, inlinedAt: !2807)
!2825 = !DILocation(line: 51, column: 50, scope: !2820, inlinedAt: !2807)
!2826 = !DILocation(line: 51, column: 38, scope: !2820, inlinedAt: !2807)
!2827 = !DILocation(line: 51, column: 9, scope: !2820, inlinedAt: !2807)
!2828 = !DILocation(line: 51, column: 16, scope: !2820, inlinedAt: !2807)
!2829 = !DILocation(line: 49, column: 40, scope: !2817, inlinedAt: !2807)
!2830 = !DILocation(line: 49, column: 5, scope: !2817, inlinedAt: !2807)
!2831 = distinct !{!2831, !2818, !2832, !298}
!2832 = !DILocation(line: 52, column: 5, scope: !2812, inlinedAt: !2807)
!2833 = !DILocation(line: 69, column: 44, scope: !2764)
!2834 = !DILocation(line: 69, column: 74, scope: !2764)
!2835 = !DILocation(line: 0, scope: !2774, inlinedAt: !2836)
!2836 = distinct !DILocation(line: 69, column: 5, scope: !2764)
!2837 = !DILocation(line: 0, scope: !2781, inlinedAt: !2836)
!2838 = !DILocation(line: 59, column: 9, scope: !2781, inlinedAt: !2836)
!2839 = !DILocation(line: 59, scope: !2781, inlinedAt: !2836)
!2840 = !DILocation(line: 59, column: 20, scope: !2786, inlinedAt: !2836)
!2841 = !DILocation(line: 59, column: 5, scope: !2781, inlinedAt: !2836)
!2842 = !DILocation(line: 60, column: 22, scope: !2789, inlinedAt: !2836)
!2843 = !DILocation(line: 60, column: 28, scope: !2789, inlinedAt: !2836)
!2844 = !DILocation(line: 0, scope: !2789, inlinedAt: !2836)
!2845 = !DILocation(line: 61, column: 32, scope: !2789, inlinedAt: !2836)
!2846 = !DILocation(line: 61, column: 43, scope: !2789, inlinedAt: !2836)
!2847 = !DILocation(line: 61, column: 38, scope: !2789, inlinedAt: !2836)
!2848 = !DILocation(line: 61, column: 9, scope: !2789, inlinedAt: !2836)
!2849 = !DILocation(line: 61, column: 16, scope: !2789, inlinedAt: !2836)
!2850 = !DILocation(line: 59, column: 40, scope: !2786, inlinedAt: !2836)
!2851 = !DILocation(line: 59, column: 5, scope: !2786, inlinedAt: !2836)
!2852 = distinct !{!2852, !2841, !2853, !298}
!2853 = !DILocation(line: 62, column: 5, scope: !2781, inlinedAt: !2836)
!2854 = !DILocation(line: 70, column: 40, scope: !2764)
!2855 = !DILocation(line: 70, column: 69, scope: !2764)
!2856 = !DILocation(line: 0, scope: !2805, inlinedAt: !2857)
!2857 = distinct !DILocation(line: 70, column: 5, scope: !2764)
!2858 = !DILocation(line: 0, scope: !2812, inlinedAt: !2857)
!2859 = !DILocation(line: 49, column: 9, scope: !2812, inlinedAt: !2857)
!2860 = !DILocation(line: 49, scope: !2812, inlinedAt: !2857)
!2861 = !DILocation(line: 49, column: 20, scope: !2817, inlinedAt: !2857)
!2862 = !DILocation(line: 49, column: 5, scope: !2812, inlinedAt: !2857)
!2863 = !DILocation(line: 50, column: 22, scope: !2820, inlinedAt: !2857)
!2864 = !DILocation(line: 0, scope: !2820, inlinedAt: !2857)
!2865 = !DILocation(line: 51, column: 32, scope: !2820, inlinedAt: !2857)
!2866 = !DILocation(line: 51, column: 44, scope: !2820, inlinedAt: !2857)
!2867 = !DILocation(line: 51, column: 50, scope: !2820, inlinedAt: !2857)
!2868 = !DILocation(line: 51, column: 38, scope: !2820, inlinedAt: !2857)
!2869 = !DILocation(line: 51, column: 9, scope: !2820, inlinedAt: !2857)
!2870 = !DILocation(line: 51, column: 16, scope: !2820, inlinedAt: !2857)
!2871 = !DILocation(line: 49, column: 40, scope: !2817, inlinedAt: !2857)
!2872 = !DILocation(line: 49, column: 5, scope: !2817, inlinedAt: !2857)
!2873 = distinct !{!2873, !2862, !2874, !298}
!2874 = !DILocation(line: 52, column: 5, scope: !2812, inlinedAt: !2857)
!2875 = !DILocation(line: 71, column: 44, scope: !2764)
!2876 = !DILocation(line: 71, column: 73, scope: !2764)
!2877 = !DILocation(line: 0, scope: !2774, inlinedAt: !2878)
!2878 = distinct !DILocation(line: 71, column: 5, scope: !2764)
!2879 = !DILocation(line: 0, scope: !2781, inlinedAt: !2878)
!2880 = !DILocation(line: 59, column: 9, scope: !2781, inlinedAt: !2878)
!2881 = !DILocation(line: 59, scope: !2781, inlinedAt: !2878)
!2882 = !DILocation(line: 59, column: 20, scope: !2786, inlinedAt: !2878)
!2883 = !DILocation(line: 59, column: 5, scope: !2781, inlinedAt: !2878)
!2884 = !DILocation(line: 60, column: 22, scope: !2789, inlinedAt: !2878)
!2885 = !DILocation(line: 60, column: 28, scope: !2789, inlinedAt: !2878)
!2886 = !DILocation(line: 0, scope: !2789, inlinedAt: !2878)
!2887 = !DILocation(line: 61, column: 32, scope: !2789, inlinedAt: !2878)
!2888 = !DILocation(line: 61, column: 43, scope: !2789, inlinedAt: !2878)
!2889 = !DILocation(line: 61, column: 38, scope: !2789, inlinedAt: !2878)
!2890 = !DILocation(line: 61, column: 9, scope: !2789, inlinedAt: !2878)
!2891 = !DILocation(line: 61, column: 16, scope: !2789, inlinedAt: !2878)
!2892 = !DILocation(line: 59, column: 40, scope: !2786, inlinedAt: !2878)
!2893 = !DILocation(line: 59, column: 5, scope: !2786, inlinedAt: !2878)
!2894 = distinct !{!2894, !2883, !2895, !298}
!2895 = !DILocation(line: 62, column: 5, scope: !2781, inlinedAt: !2878)
!2896 = !DILocation(line: 72, column: 40, scope: !2764)
!2897 = !DILocation(line: 72, column: 69, scope: !2764)
!2898 = !DILocation(line: 0, scope: !2805, inlinedAt: !2899)
!2899 = distinct !DILocation(line: 72, column: 5, scope: !2764)
!2900 = !DILocation(line: 0, scope: !2812, inlinedAt: !2899)
!2901 = !DILocation(line: 49, column: 9, scope: !2812, inlinedAt: !2899)
!2902 = !DILocation(line: 49, scope: !2812, inlinedAt: !2899)
!2903 = !DILocation(line: 49, column: 20, scope: !2817, inlinedAt: !2899)
!2904 = !DILocation(line: 49, column: 5, scope: !2812, inlinedAt: !2899)
!2905 = !DILocation(line: 50, column: 22, scope: !2820, inlinedAt: !2899)
!2906 = !DILocation(line: 0, scope: !2820, inlinedAt: !2899)
!2907 = !DILocation(line: 51, column: 32, scope: !2820, inlinedAt: !2899)
!2908 = !DILocation(line: 51, column: 44, scope: !2820, inlinedAt: !2899)
!2909 = !DILocation(line: 51, column: 50, scope: !2820, inlinedAt: !2899)
!2910 = !DILocation(line: 51, column: 38, scope: !2820, inlinedAt: !2899)
!2911 = !DILocation(line: 51, column: 9, scope: !2820, inlinedAt: !2899)
!2912 = !DILocation(line: 51, column: 16, scope: !2820, inlinedAt: !2899)
!2913 = !DILocation(line: 49, column: 40, scope: !2817, inlinedAt: !2899)
!2914 = !DILocation(line: 49, column: 5, scope: !2817, inlinedAt: !2899)
!2915 = distinct !{!2915, !2904, !2916, !298}
!2916 = !DILocation(line: 52, column: 5, scope: !2812, inlinedAt: !2899)
!2917 = !DILocation(line: 73, column: 44, scope: !2764)
!2918 = !DILocation(line: 73, column: 74, scope: !2764)
!2919 = !DILocation(line: 0, scope: !2774, inlinedAt: !2920)
!2920 = distinct !DILocation(line: 73, column: 5, scope: !2764)
!2921 = !DILocation(line: 0, scope: !2781, inlinedAt: !2920)
!2922 = !DILocation(line: 59, column: 9, scope: !2781, inlinedAt: !2920)
!2923 = !DILocation(line: 59, scope: !2781, inlinedAt: !2920)
!2924 = !DILocation(line: 59, column: 20, scope: !2786, inlinedAt: !2920)
!2925 = !DILocation(line: 59, column: 5, scope: !2781, inlinedAt: !2920)
!2926 = !DILocation(line: 60, column: 22, scope: !2789, inlinedAt: !2920)
!2927 = !DILocation(line: 60, column: 28, scope: !2789, inlinedAt: !2920)
!2928 = !DILocation(line: 0, scope: !2789, inlinedAt: !2920)
!2929 = !DILocation(line: 61, column: 32, scope: !2789, inlinedAt: !2920)
!2930 = !DILocation(line: 61, column: 43, scope: !2789, inlinedAt: !2920)
!2931 = !DILocation(line: 61, column: 38, scope: !2789, inlinedAt: !2920)
!2932 = !DILocation(line: 61, column: 9, scope: !2789, inlinedAt: !2920)
!2933 = !DILocation(line: 61, column: 16, scope: !2789, inlinedAt: !2920)
!2934 = !DILocation(line: 59, column: 40, scope: !2786, inlinedAt: !2920)
!2935 = !DILocation(line: 59, column: 5, scope: !2786, inlinedAt: !2920)
!2936 = distinct !{!2936, !2925, !2937, !298}
!2937 = !DILocation(line: 62, column: 5, scope: !2781, inlinedAt: !2920)
!2938 = !DILocation(line: 74, column: 40, scope: !2764)
!2939 = !DILocation(line: 74, column: 69, scope: !2764)
!2940 = !DILocation(line: 0, scope: !2805, inlinedAt: !2941)
!2941 = distinct !DILocation(line: 74, column: 5, scope: !2764)
!2942 = !DILocation(line: 0, scope: !2812, inlinedAt: !2941)
!2943 = !DILocation(line: 49, column: 9, scope: !2812, inlinedAt: !2941)
!2944 = !DILocation(line: 49, scope: !2812, inlinedAt: !2941)
!2945 = !DILocation(line: 49, column: 20, scope: !2817, inlinedAt: !2941)
!2946 = !DILocation(line: 49, column: 5, scope: !2812, inlinedAt: !2941)
!2947 = !DILocation(line: 50, column: 22, scope: !2820, inlinedAt: !2941)
!2948 = !DILocation(line: 0, scope: !2820, inlinedAt: !2941)
!2949 = !DILocation(line: 51, column: 32, scope: !2820, inlinedAt: !2941)
!2950 = !DILocation(line: 51, column: 44, scope: !2820, inlinedAt: !2941)
!2951 = !DILocation(line: 51, column: 50, scope: !2820, inlinedAt: !2941)
!2952 = !DILocation(line: 51, column: 38, scope: !2820, inlinedAt: !2941)
!2953 = !DILocation(line: 51, column: 9, scope: !2820, inlinedAt: !2941)
!2954 = !DILocation(line: 51, column: 16, scope: !2820, inlinedAt: !2941)
!2955 = !DILocation(line: 49, column: 40, scope: !2817, inlinedAt: !2941)
!2956 = !DILocation(line: 49, column: 5, scope: !2817, inlinedAt: !2941)
!2957 = distinct !{!2957, !2946, !2958, !298}
!2958 = !DILocation(line: 52, column: 5, scope: !2812, inlinedAt: !2941)
!2959 = !DILocation(line: 75, column: 44, scope: !2764)
!2960 = !DILocation(line: 75, column: 74, scope: !2764)
!2961 = !DILocation(line: 0, scope: !2774, inlinedAt: !2962)
!2962 = distinct !DILocation(line: 75, column: 5, scope: !2764)
!2963 = !DILocation(line: 0, scope: !2781, inlinedAt: !2962)
!2964 = !DILocation(line: 59, column: 9, scope: !2781, inlinedAt: !2962)
!2965 = !DILocation(line: 59, scope: !2781, inlinedAt: !2962)
!2966 = !DILocation(line: 59, column: 20, scope: !2786, inlinedAt: !2962)
!2967 = !DILocation(line: 59, column: 5, scope: !2781, inlinedAt: !2962)
!2968 = !DILocation(line: 60, column: 22, scope: !2789, inlinedAt: !2962)
!2969 = !DILocation(line: 60, column: 28, scope: !2789, inlinedAt: !2962)
!2970 = !DILocation(line: 0, scope: !2789, inlinedAt: !2962)
!2971 = !DILocation(line: 61, column: 32, scope: !2789, inlinedAt: !2962)
!2972 = !DILocation(line: 61, column: 43, scope: !2789, inlinedAt: !2962)
!2973 = !DILocation(line: 61, column: 38, scope: !2789, inlinedAt: !2962)
!2974 = !DILocation(line: 61, column: 9, scope: !2789, inlinedAt: !2962)
!2975 = !DILocation(line: 61, column: 16, scope: !2789, inlinedAt: !2962)
!2976 = !DILocation(line: 59, column: 40, scope: !2786, inlinedAt: !2962)
!2977 = !DILocation(line: 59, column: 5, scope: !2786, inlinedAt: !2962)
!2978 = distinct !{!2978, !2967, !2979, !298}
!2979 = !DILocation(line: 62, column: 5, scope: !2781, inlinedAt: !2962)
!2980 = !DILocation(line: 76, column: 40, scope: !2764)
!2981 = !DILocation(line: 76, column: 69, scope: !2764)
!2982 = !DILocation(line: 0, scope: !2805, inlinedAt: !2983)
!2983 = distinct !DILocation(line: 76, column: 5, scope: !2764)
!2984 = !DILocation(line: 0, scope: !2812, inlinedAt: !2983)
!2985 = !DILocation(line: 49, column: 9, scope: !2812, inlinedAt: !2983)
!2986 = !DILocation(line: 49, scope: !2812, inlinedAt: !2983)
!2987 = !DILocation(line: 49, column: 20, scope: !2817, inlinedAt: !2983)
!2988 = !DILocation(line: 49, column: 5, scope: !2812, inlinedAt: !2983)
!2989 = !DILocation(line: 50, column: 22, scope: !2820, inlinedAt: !2983)
!2990 = !DILocation(line: 0, scope: !2820, inlinedAt: !2983)
!2991 = !DILocation(line: 51, column: 32, scope: !2820, inlinedAt: !2983)
!2992 = !DILocation(line: 51, column: 44, scope: !2820, inlinedAt: !2983)
!2993 = !DILocation(line: 51, column: 50, scope: !2820, inlinedAt: !2983)
!2994 = !DILocation(line: 51, column: 38, scope: !2820, inlinedAt: !2983)
!2995 = !DILocation(line: 51, column: 9, scope: !2820, inlinedAt: !2983)
!2996 = !DILocation(line: 51, column: 16, scope: !2820, inlinedAt: !2983)
!2997 = !DILocation(line: 49, column: 40, scope: !2817, inlinedAt: !2983)
!2998 = !DILocation(line: 49, column: 5, scope: !2817, inlinedAt: !2983)
!2999 = distinct !{!2999, !2988, !3000, !298}
!3000 = !DILocation(line: 52, column: 5, scope: !2812, inlinedAt: !2983)
!3001 = !DILocation(line: 77, column: 44, scope: !2764)
!3002 = !DILocation(line: 77, column: 74, scope: !2764)
!3003 = !DILocation(line: 0, scope: !2774, inlinedAt: !3004)
!3004 = distinct !DILocation(line: 77, column: 5, scope: !2764)
!3005 = !DILocation(line: 0, scope: !2781, inlinedAt: !3004)
!3006 = !DILocation(line: 59, column: 9, scope: !2781, inlinedAt: !3004)
!3007 = !DILocation(line: 59, scope: !2781, inlinedAt: !3004)
!3008 = !DILocation(line: 59, column: 20, scope: !2786, inlinedAt: !3004)
!3009 = !DILocation(line: 59, column: 5, scope: !2781, inlinedAt: !3004)
!3010 = !DILocation(line: 60, column: 22, scope: !2789, inlinedAt: !3004)
!3011 = !DILocation(line: 60, column: 28, scope: !2789, inlinedAt: !3004)
!3012 = !DILocation(line: 0, scope: !2789, inlinedAt: !3004)
!3013 = !DILocation(line: 61, column: 32, scope: !2789, inlinedAt: !3004)
!3014 = !DILocation(line: 61, column: 43, scope: !2789, inlinedAt: !3004)
!3015 = !DILocation(line: 61, column: 38, scope: !2789, inlinedAt: !3004)
!3016 = !DILocation(line: 61, column: 9, scope: !2789, inlinedAt: !3004)
!3017 = !DILocation(line: 61, column: 16, scope: !2789, inlinedAt: !3004)
!3018 = !DILocation(line: 59, column: 40, scope: !2786, inlinedAt: !3004)
!3019 = !DILocation(line: 59, column: 5, scope: !2786, inlinedAt: !3004)
!3020 = distinct !{!3020, !3009, !3021, !298}
!3021 = !DILocation(line: 62, column: 5, scope: !2781, inlinedAt: !3004)
!3022 = !DILocation(line: 78, column: 40, scope: !2764)
!3023 = !DILocation(line: 78, column: 69, scope: !2764)
!3024 = !DILocation(line: 0, scope: !2805, inlinedAt: !3025)
!3025 = distinct !DILocation(line: 78, column: 5, scope: !2764)
!3026 = !DILocation(line: 0, scope: !2812, inlinedAt: !3025)
!3027 = !DILocation(line: 49, column: 9, scope: !2812, inlinedAt: !3025)
!3028 = !DILocation(line: 49, scope: !2812, inlinedAt: !3025)
!3029 = !DILocation(line: 49, column: 20, scope: !2817, inlinedAt: !3025)
!3030 = !DILocation(line: 49, column: 5, scope: !2812, inlinedAt: !3025)
!3031 = !DILocation(line: 50, column: 22, scope: !2820, inlinedAt: !3025)
!3032 = !DILocation(line: 0, scope: !2820, inlinedAt: !3025)
!3033 = !DILocation(line: 51, column: 32, scope: !2820, inlinedAt: !3025)
!3034 = !DILocation(line: 51, column: 44, scope: !2820, inlinedAt: !3025)
!3035 = !DILocation(line: 51, column: 50, scope: !2820, inlinedAt: !3025)
!3036 = !DILocation(line: 51, column: 38, scope: !2820, inlinedAt: !3025)
!3037 = !DILocation(line: 51, column: 9, scope: !2820, inlinedAt: !3025)
!3038 = !DILocation(line: 51, column: 16, scope: !2820, inlinedAt: !3025)
!3039 = !DILocation(line: 49, column: 40, scope: !2817, inlinedAt: !3025)
!3040 = !DILocation(line: 49, column: 5, scope: !2817, inlinedAt: !3025)
!3041 = distinct !{!3041, !3030, !3042, !298}
!3042 = !DILocation(line: 52, column: 5, scope: !2812, inlinedAt: !3025)
!3043 = !DILocation(line: 79, column: 44, scope: !2764)
!3044 = !DILocation(line: 79, column: 74, scope: !2764)
!3045 = !DILocation(line: 0, scope: !2774, inlinedAt: !3046)
!3046 = distinct !DILocation(line: 79, column: 5, scope: !2764)
!3047 = !DILocation(line: 0, scope: !2781, inlinedAt: !3046)
!3048 = !DILocation(line: 59, column: 9, scope: !2781, inlinedAt: !3046)
!3049 = !DILocation(line: 59, scope: !2781, inlinedAt: !3046)
!3050 = !DILocation(line: 59, column: 20, scope: !2786, inlinedAt: !3046)
!3051 = !DILocation(line: 59, column: 5, scope: !2781, inlinedAt: !3046)
!3052 = !DILocation(line: 60, column: 22, scope: !2789, inlinedAt: !3046)
!3053 = !DILocation(line: 60, column: 28, scope: !2789, inlinedAt: !3046)
!3054 = !DILocation(line: 0, scope: !2789, inlinedAt: !3046)
!3055 = !DILocation(line: 61, column: 32, scope: !2789, inlinedAt: !3046)
!3056 = !DILocation(line: 61, column: 43, scope: !2789, inlinedAt: !3046)
!3057 = !DILocation(line: 61, column: 38, scope: !2789, inlinedAt: !3046)
!3058 = !DILocation(line: 61, column: 9, scope: !2789, inlinedAt: !3046)
!3059 = !DILocation(line: 61, column: 16, scope: !2789, inlinedAt: !3046)
!3060 = !DILocation(line: 59, column: 40, scope: !2786, inlinedAt: !3046)
!3061 = !DILocation(line: 59, column: 5, scope: !2786, inlinedAt: !3046)
!3062 = distinct !{!3062, !3051, !3063, !298}
!3063 = !DILocation(line: 62, column: 5, scope: !2781, inlinedAt: !3046)
!3064 = !DILocation(line: 80, column: 40, scope: !2764)
!3065 = !DILocation(line: 80, column: 69, scope: !2764)
!3066 = !DILocation(line: 0, scope: !2805, inlinedAt: !3067)
!3067 = distinct !DILocation(line: 80, column: 5, scope: !2764)
!3068 = !DILocation(line: 0, scope: !2812, inlinedAt: !3067)
!3069 = !DILocation(line: 49, column: 9, scope: !2812, inlinedAt: !3067)
!3070 = !DILocation(line: 49, scope: !2812, inlinedAt: !3067)
!3071 = !DILocation(line: 49, column: 20, scope: !2817, inlinedAt: !3067)
!3072 = !DILocation(line: 49, column: 5, scope: !2812, inlinedAt: !3067)
!3073 = !DILocation(line: 50, column: 22, scope: !2820, inlinedAt: !3067)
!3074 = !DILocation(line: 0, scope: !2820, inlinedAt: !3067)
!3075 = !DILocation(line: 51, column: 32, scope: !2820, inlinedAt: !3067)
!3076 = !DILocation(line: 51, column: 44, scope: !2820, inlinedAt: !3067)
!3077 = !DILocation(line: 51, column: 50, scope: !2820, inlinedAt: !3067)
!3078 = !DILocation(line: 51, column: 38, scope: !2820, inlinedAt: !3067)
!3079 = !DILocation(line: 51, column: 9, scope: !2820, inlinedAt: !3067)
!3080 = !DILocation(line: 51, column: 16, scope: !2820, inlinedAt: !3067)
!3081 = !DILocation(line: 49, column: 40, scope: !2817, inlinedAt: !3067)
!3082 = !DILocation(line: 49, column: 5, scope: !2817, inlinedAt: !3067)
!3083 = distinct !{!3083, !3072, !3084, !298}
!3084 = !DILocation(line: 52, column: 5, scope: !2812, inlinedAt: !3067)
!3085 = !DILocation(line: 81, column: 35, scope: !2764)
!3086 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !3087, file: !658, line: 13, type: !86)
!3087 = distinct !DISubprogram(name: "m_vec_copy", scope: !658, file: !658, line: 13, type: !2470, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!3088 = !DILocation(line: 0, scope: !3087, inlinedAt: !3089)
!3089 = distinct !DILocation(line: 81, column: 5, scope: !2764)
!3090 = !DILocalVariable(name: "in", arg: 2, scope: !3087, file: !658, line: 13, type: !486)
!3091 = !DILocalVariable(name: "out", arg: 3, scope: !3087, file: !658, line: 13, type: !52)
!3092 = !DILocalVariable(name: "i", scope: !3093, file: !658, line: 15, type: !58)
!3093 = distinct !DILexicalBlock(scope: !3087, file: !658, line: 15, column: 5)
!3094 = !DILocation(line: 0, scope: !3093, inlinedAt: !3089)
!3095 = !DILocation(line: 15, column: 10, scope: !3093, inlinedAt: !3089)
!3096 = !DILocation(line: 15, scope: !3093, inlinedAt: !3089)
!3097 = !DILocation(line: 15, column: 26, scope: !3098, inlinedAt: !3089)
!3098 = distinct !DILexicalBlock(scope: !3093, file: !658, line: 15, column: 5)
!3099 = !DILocation(line: 15, column: 5, scope: !3093, inlinedAt: !3089)
!3100 = !DILocation(line: 17, column: 18, scope: !3101, inlinedAt: !3089)
!3101 = distinct !DILexicalBlock(scope: !3098, file: !658, line: 16, column: 5)
!3102 = !DILocation(line: 17, column: 9, scope: !3101, inlinedAt: !3089)
!3103 = !DILocation(line: 17, column: 16, scope: !3101, inlinedAt: !3089)
!3104 = !DILocation(line: 15, column: 46, scope: !3098, inlinedAt: !3089)
!3105 = !DILocation(line: 15, column: 5, scope: !3098, inlinedAt: !3089)
!3106 = distinct !{!3106, !3099, !3107, !298}
!3107 = !DILocation(line: 18, column: 5, scope: !3093, inlinedAt: !3089)
!3108 = !DILocation(line: 82, column: 1, scope: !2764)
!3109 = distinct !DISubprogram(name: "pqmayo_MAYO_3_ref_m_upper", scope: !99, file: !99, line: 14, type: !3110, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3110 = !DISubroutineType(types: !3111)
!3111 = !{null, !3112, !486, !52, !86}
!3112 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3113, size: 32)
!3113 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !3114)
!3114 = !DIDerivedType(tag: DW_TAG_typedef, name: "mayo_params_t", file: !79, line: 289, baseType: !3115)
!3115 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !79, line: 265, size: 736, elements: !3116)
!3116 = !{!3117, !3118, !3119, !3120, !3121, !3122, !3123, !3124, !3125, !3126, !3127, !3128, !3129, !3130, !3131, !3132, !3133, !3134, !3135, !3136, !3137, !3138, !3139}
!3117 = !DIDerivedType(tag: DW_TAG_member, name: "m", scope: !3115, file: !79, line: 266, baseType: !86, size: 32)
!3118 = !DIDerivedType(tag: DW_TAG_member, name: "n", scope: !3115, file: !79, line: 267, baseType: !86, size: 32, offset: 32)
!3119 = !DIDerivedType(tag: DW_TAG_member, name: "o", scope: !3115, file: !79, line: 268, baseType: !86, size: 32, offset: 64)
!3120 = !DIDerivedType(tag: DW_TAG_member, name: "k", scope: !3115, file: !79, line: 269, baseType: !86, size: 32, offset: 96)
!3121 = !DIDerivedType(tag: DW_TAG_member, name: "q", scope: !3115, file: !79, line: 270, baseType: !86, size: 32, offset: 128)
!3122 = !DIDerivedType(tag: DW_TAG_member, name: "f_tail", scope: !3115, file: !79, line: 271, baseType: !90, size: 32, offset: 160)
!3123 = !DIDerivedType(tag: DW_TAG_member, name: "m_bytes", scope: !3115, file: !79, line: 272, baseType: !86, size: 32, offset: 192)
!3124 = !DIDerivedType(tag: DW_TAG_member, name: "O_bytes", scope: !3115, file: !79, line: 273, baseType: !86, size: 32, offset: 224)
!3125 = !DIDerivedType(tag: DW_TAG_member, name: "v_bytes", scope: !3115, file: !79, line: 274, baseType: !86, size: 32, offset: 256)
!3126 = !DIDerivedType(tag: DW_TAG_member, name: "r_bytes", scope: !3115, file: !79, line: 275, baseType: !86, size: 32, offset: 288)
!3127 = !DIDerivedType(tag: DW_TAG_member, name: "R_bytes", scope: !3115, file: !79, line: 276, baseType: !86, size: 32, offset: 320)
!3128 = !DIDerivedType(tag: DW_TAG_member, name: "P1_bytes", scope: !3115, file: !79, line: 277, baseType: !86, size: 32, offset: 352)
!3129 = !DIDerivedType(tag: DW_TAG_member, name: "P2_bytes", scope: !3115, file: !79, line: 278, baseType: !86, size: 32, offset: 384)
!3130 = !DIDerivedType(tag: DW_TAG_member, name: "P3_bytes", scope: !3115, file: !79, line: 279, baseType: !86, size: 32, offset: 416)
!3131 = !DIDerivedType(tag: DW_TAG_member, name: "csk_bytes", scope: !3115, file: !79, line: 280, baseType: !86, size: 32, offset: 448)
!3132 = !DIDerivedType(tag: DW_TAG_member, name: "cpk_bytes", scope: !3115, file: !79, line: 281, baseType: !86, size: 32, offset: 480)
!3133 = !DIDerivedType(tag: DW_TAG_member, name: "sig_bytes", scope: !3115, file: !79, line: 282, baseType: !86, size: 32, offset: 512)
!3134 = !DIDerivedType(tag: DW_TAG_member, name: "salt_bytes", scope: !3115, file: !79, line: 283, baseType: !86, size: 32, offset: 544)
!3135 = !DIDerivedType(tag: DW_TAG_member, name: "sk_seed_bytes", scope: !3115, file: !79, line: 284, baseType: !86, size: 32, offset: 576)
!3136 = !DIDerivedType(tag: DW_TAG_member, name: "digest_bytes", scope: !3115, file: !79, line: 285, baseType: !86, size: 32, offset: 608)
!3137 = !DIDerivedType(tag: DW_TAG_member, name: "pk_seed_bytes", scope: !3115, file: !79, line: 286, baseType: !86, size: 32, offset: 640)
!3138 = !DIDerivedType(tag: DW_TAG_member, name: "m_vec_limbs", scope: !3115, file: !79, line: 287, baseType: !86, size: 32, offset: 672)
!3139 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !3115, file: !79, line: 288, baseType: !148, size: 32, offset: 704)
!3140 = !DILocalVariable(name: "p", arg: 1, scope: !3109, file: !99, line: 14, type: !3112)
!3141 = !DILocation(line: 0, scope: !3109)
!3142 = !DILocalVariable(name: "in", arg: 2, scope: !3109, file: !99, line: 14, type: !486)
!3143 = !DILocalVariable(name: "out", arg: 3, scope: !3109, file: !99, line: 14, type: !52)
!3144 = !DILocalVariable(name: "size", arg: 4, scope: !3109, file: !99, line: 14, type: !86)
!3145 = !DILocalVariable(name: "m_vec_limbs", scope: !3109, file: !99, line: 19, type: !275)
!3146 = !DILocalVariable(name: "m_vecs_stored", scope: !3109, file: !99, line: 20, type: !86)
!3147 = !DILocalVariable(name: "r", scope: !3148, file: !99, line: 21, type: !86)
!3148 = distinct !DILexicalBlock(scope: !3109, file: !99, line: 21, column: 5)
!3149 = !DILocation(line: 0, scope: !3148)
!3150 = !DILocation(line: 21, column: 10, scope: !3148)
!3151 = !DILocation(line: 20, column: 9, scope: !3109)
!3152 = !DILocation(line: 21, scope: !3148)
!3153 = !DILocation(line: 21, column: 23, scope: !3154)
!3154 = distinct !DILexicalBlock(scope: !3148, file: !99, line: 21, column: 5)
!3155 = !DILocation(line: 21, column: 5, scope: !3148)
!3156 = !DILocation(line: 22, column: 9, scope: !3157)
!3157 = distinct !DILexicalBlock(scope: !3158, file: !99, line: 22, column: 9)
!3158 = distinct !DILexicalBlock(scope: !3154, file: !99, line: 21, column: 36)
!3159 = !DILocation(line: 22, scope: !3157)
!3160 = !DILocalVariable(name: "c", scope: !3157, file: !99, line: 22, type: !86)
!3161 = !DILocation(line: 0, scope: !3157)
!3162 = !DILocation(line: 22, column: 27, scope: !3163)
!3163 = distinct !DILexicalBlock(scope: !3157, file: !99, line: 22, column: 9)
!3164 = !DILocation(line: 23, column: 59, scope: !3165)
!3165 = distinct !DILexicalBlock(scope: !3163, file: !99, line: 22, column: 40)
!3166 = !DILocation(line: 23, column: 66, scope: !3165)
!3167 = !DILocation(line: 23, column: 40, scope: !3165)
!3168 = !DILocation(line: 23, column: 76, scope: !3165)
!3169 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !3170, file: !658, line: 13, type: !86)
!3170 = distinct !DISubprogram(name: "m_vec_copy", scope: !658, file: !658, line: 13, type: !2470, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3171 = !DILocation(line: 0, scope: !3170, inlinedAt: !3172)
!3172 = distinct !DILocation(line: 23, column: 13, scope: !3165)
!3173 = !DILocalVariable(name: "in", arg: 2, scope: !3170, file: !658, line: 13, type: !486)
!3174 = !DILocalVariable(name: "out", arg: 3, scope: !3170, file: !658, line: 13, type: !52)
!3175 = !DILocalVariable(name: "i", scope: !3176, file: !658, line: 15, type: !58)
!3176 = distinct !DILexicalBlock(scope: !3170, file: !658, line: 15, column: 5)
!3177 = !DILocation(line: 0, scope: !3176, inlinedAt: !3172)
!3178 = !DILocation(line: 15, column: 10, scope: !3176, inlinedAt: !3172)
!3179 = !DILocation(line: 15, scope: !3176, inlinedAt: !3172)
!3180 = !DILocation(line: 15, column: 26, scope: !3181, inlinedAt: !3172)
!3181 = distinct !DILexicalBlock(scope: !3176, file: !658, line: 15, column: 5)
!3182 = !DILocation(line: 15, column: 5, scope: !3176, inlinedAt: !3172)
!3183 = !DILocation(line: 17, column: 18, scope: !3184, inlinedAt: !3172)
!3184 = distinct !DILexicalBlock(scope: !3181, file: !658, line: 16, column: 5)
!3185 = !DILocation(line: 17, column: 9, scope: !3184, inlinedAt: !3172)
!3186 = !DILocation(line: 17, column: 16, scope: !3184, inlinedAt: !3172)
!3187 = !DILocation(line: 15, column: 46, scope: !3181, inlinedAt: !3172)
!3188 = !DILocation(line: 15, column: 5, scope: !3181, inlinedAt: !3172)
!3189 = distinct !{!3189, !3182, !3190, !298}
!3190 = !DILocation(line: 18, column: 5, scope: !3176, inlinedAt: !3172)
!3191 = !DILocation(line: 24, column: 19, scope: !3192)
!3192 = distinct !DILexicalBlock(scope: !3165, file: !99, line: 24, column: 17)
!3193 = !DILocation(line: 25, column: 62, scope: !3194)
!3194 = distinct !DILexicalBlock(scope: !3192, file: !99, line: 24, column: 25)
!3195 = !DILocation(line: 25, column: 69, scope: !3194)
!3196 = !DILocation(line: 25, column: 43, scope: !3194)
!3197 = !DILocation(line: 25, column: 79, scope: !3194)
!3198 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !3199, file: !658, line: 22, type: !86)
!3199 = distinct !DISubprogram(name: "m_vec_add", scope: !658, file: !658, line: 22, type: !2470, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3200 = !DILocation(line: 0, scope: !3199, inlinedAt: !3201)
!3201 = distinct !DILocation(line: 25, column: 17, scope: !3194)
!3202 = !DILocalVariable(name: "in", arg: 2, scope: !3199, file: !658, line: 22, type: !486)
!3203 = !DILocalVariable(name: "acc", arg: 3, scope: !3199, file: !658, line: 22, type: !52)
!3204 = !DILocalVariable(name: "i", scope: !3205, file: !658, line: 24, type: !58)
!3205 = distinct !DILexicalBlock(scope: !3199, file: !658, line: 24, column: 5)
!3206 = !DILocation(line: 0, scope: !3205, inlinedAt: !3201)
!3207 = !DILocation(line: 24, column: 10, scope: !3205, inlinedAt: !3201)
!3208 = !DILocation(line: 24, scope: !3205, inlinedAt: !3201)
!3209 = !DILocation(line: 24, column: 26, scope: !3210, inlinedAt: !3201)
!3210 = distinct !DILexicalBlock(scope: !3205, file: !658, line: 24, column: 5)
!3211 = !DILocation(line: 24, column: 5, scope: !3205, inlinedAt: !3201)
!3212 = !DILocation(line: 26, column: 19, scope: !3213, inlinedAt: !3201)
!3213 = distinct !DILexicalBlock(scope: !3210, file: !658, line: 25, column: 5)
!3214 = !DILocation(line: 26, column: 9, scope: !3213, inlinedAt: !3201)
!3215 = !DILocation(line: 26, column: 16, scope: !3213, inlinedAt: !3201)
!3216 = !DILocation(line: 24, column: 46, scope: !3210, inlinedAt: !3201)
!3217 = !DILocation(line: 24, column: 5, scope: !3210, inlinedAt: !3201)
!3218 = distinct !{!3218, !3211, !3219, !298}
!3219 = !DILocation(line: 27, column: 5, scope: !3205, inlinedAt: !3201)
!3220 = !DILocation(line: 27, column: 27, scope: !3165)
!3221 = !DILocation(line: 22, column: 36, scope: !3163)
!3222 = !DILocation(line: 22, column: 9, scope: !3163)
!3223 = distinct !{!3223, !3156, !3224, !298}
!3224 = !DILocation(line: 28, column: 9, scope: !3157)
!3225 = !DILocation(line: 21, column: 32, scope: !3154)
!3226 = !DILocation(line: 21, column: 5, scope: !3154)
!3227 = distinct !{!3227, !3155, !3228, !298}
!3228 = !DILocation(line: 29, column: 5, scope: !3148)
!3229 = !DILocation(line: 30, column: 1, scope: !3109)
!3230 = distinct !DISubprogram(name: "pqmayo_MAYO_3_ref_sample_solution", scope: !99, file: !99, line: 40, type: !3231, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3231 = !DISubroutineType(types: !3232)
!3232 = !{!86, !3112, !61, !90, !90, !61, !86, !86, !86, !86}
!3233 = !DILocalVariable(name: "p", arg: 1, scope: !3230, file: !99, line: 40, type: !3112)
!3234 = !DILocation(line: 0, scope: !3230)
!3235 = !DILocalVariable(name: "A", arg: 2, scope: !3230, file: !99, line: 40, type: !61)
!3236 = !DILocalVariable(name: "y", arg: 3, scope: !3230, file: !99, line: 41, type: !90)
!3237 = !DILocalVariable(name: "r", arg: 4, scope: !3230, file: !99, line: 41, type: !90)
!3238 = !DILocalVariable(name: "x", arg: 5, scope: !3230, file: !99, line: 42, type: !61)
!3239 = !DILocalVariable(name: "k", arg: 6, scope: !3230, file: !99, line: 42, type: !86)
!3240 = !DILocalVariable(name: "o", arg: 7, scope: !3230, file: !99, line: 42, type: !86)
!3241 = !DILocalVariable(name: "m", arg: 8, scope: !3230, file: !99, line: 42, type: !86)
!3242 = !DILocalVariable(name: "A_cols", arg: 9, scope: !3230, file: !99, line: 42, type: !86)
!3243 = !DILocalVariable(name: "i", scope: !3244, file: !99, line: 51, type: !86)
!3244 = distinct !DILexicalBlock(scope: !3230, file: !99, line: 51, column: 5)
!3245 = !DILocation(line: 0, scope: !3244)
!3246 = !DILocation(line: 51, column: 10, scope: !3244)
!3247 = !DILocation(line: 51, scope: !3244)
!3248 = !DILocation(line: 51, column: 23, scope: !3249)
!3249 = distinct !DILexicalBlock(scope: !3244, file: !99, line: 51, column: 5)
!3250 = !DILocation(line: 51, column: 5, scope: !3244)
!3251 = !DILocation(line: 57, column: 5, scope: !3252)
!3252 = distinct !DILexicalBlock(scope: !3230, file: !99, line: 57, column: 5)
!3253 = !DILocation(line: 52, column: 16, scope: !3254)
!3254 = distinct !DILexicalBlock(scope: !3249, file: !99, line: 51, column: 37)
!3255 = !DILocation(line: 52, column: 9, scope: !3254)
!3256 = !DILocation(line: 52, column: 14, scope: !3254)
!3257 = !DILocation(line: 51, column: 33, scope: !3249)
!3258 = !DILocation(line: 51, column: 5, scope: !3249)
!3259 = distinct !{!3259, !3250, !3260, !298}
!3260 = !DILocation(line: 53, column: 5, scope: !3244)
!3261 = !DILocation(line: 57, scope: !3252)
!3262 = !DILocalVariable(name: "i", scope: !3252, file: !99, line: 57, type: !86)
!3263 = !DILocation(line: 0, scope: !3252)
!3264 = !DILocation(line: 57, column: 23, scope: !3265)
!3265 = distinct !DILexicalBlock(scope: !3252, file: !99, line: 57, column: 5)
!3266 = !DILocation(line: 58, column: 13, scope: !3267)
!3267 = distinct !DILexicalBlock(scope: !3265, file: !99, line: 57, column: 33)
!3268 = !DILocation(line: 58, column: 26, scope: !3267)
!3269 = !DILocation(line: 58, column: 30, scope: !3267)
!3270 = !DILocation(line: 58, column: 21, scope: !3267)
!3271 = !DILocation(line: 58, column: 9, scope: !3267)
!3272 = !DILocation(line: 58, column: 36, scope: !3267)
!3273 = !DILocation(line: 57, column: 29, scope: !3265)
!3274 = !DILocation(line: 57, column: 5, scope: !3265)
!3275 = distinct !{!3275, !3251, !3276, !298}
!3276 = !DILocation(line: 59, column: 5, scope: !3252)
!3277 = !DILocation(line: 60, column: 25, scope: !3230)
!3278 = !DILocalVariable(name: "a", arg: 1, scope: !3279, file: !668, line: 78, type: !90)
!3279 = distinct !DISubprogram(name: "mat_mul", scope: !668, file: !668, line: 78, type: !1826, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3280 = !DILocation(line: 0, scope: !3279, inlinedAt: !3281)
!3281 = distinct !DILocation(line: 60, column: 5, scope: !3230)
!3282 = !DILocalVariable(name: "b", arg: 2, scope: !3279, file: !668, line: 78, type: !90)
!3283 = !DILocalVariable(name: "c", arg: 3, scope: !3279, file: !668, line: 79, type: !61)
!3284 = !DILocalVariable(name: "colrow_ab", arg: 4, scope: !3279, file: !668, line: 79, type: !86)
!3285 = !DILocalVariable(name: "row_a", arg: 5, scope: !3279, file: !668, line: 79, type: !86)
!3286 = !DILocalVariable(name: "col_b", arg: 6, scope: !3279, file: !668, line: 79, type: !86)
!3287 = !DILocalVariable(name: "i", scope: !3288, file: !668, line: 80, type: !86)
!3288 = distinct !DILexicalBlock(scope: !3279, file: !668, line: 80, column: 5)
!3289 = !DILocation(line: 0, scope: !3288, inlinedAt: !3281)
!3290 = !DILocation(line: 80, column: 10, scope: !3288, inlinedAt: !3281)
!3291 = !DILocation(line: 80, scope: !3288, inlinedAt: !3281)
!3292 = !DILocation(line: 80, column: 23, scope: !3293, inlinedAt: !3281)
!3293 = distinct !DILexicalBlock(scope: !3288, file: !668, line: 80, column: 5)
!3294 = !DILocation(line: 80, column: 5, scope: !3288, inlinedAt: !3281)
!3295 = !DILocation(line: 81, column: 9, scope: !3296, inlinedAt: !3281)
!3296 = distinct !DILexicalBlock(scope: !3297, file: !668, line: 81, column: 9)
!3297 = distinct !DILexicalBlock(scope: !3293, file: !668, line: 80, column: 53)
!3298 = !DILocation(line: 63, column: 5, scope: !3299)
!3299 = distinct !DILexicalBlock(scope: !3230, file: !99, line: 63, column: 5)
!3300 = !DILocation(line: 81, scope: !3296, inlinedAt: !3281)
!3301 = !DILocalVariable(name: "j", scope: !3296, file: !668, line: 81, type: !86)
!3302 = !DILocation(line: 0, scope: !3296, inlinedAt: !3281)
!3303 = !DILocation(line: 81, column: 27, scope: !3304, inlinedAt: !3281)
!3304 = distinct !DILexicalBlock(scope: !3296, file: !668, line: 81, column: 9)
!3305 = !DILocation(line: 82, column: 31, scope: !3306, inlinedAt: !3281)
!3306 = distinct !DILexicalBlock(scope: !3304, file: !668, line: 81, column: 46)
!3307 = !DILocalVariable(name: "a", arg: 1, scope: !3308, file: !668, line: 69, type: !90)
!3308 = distinct !DISubprogram(name: "lincomb", scope: !668, file: !668, line: 69, type: !1855, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3309 = !DILocation(line: 0, scope: !3308, inlinedAt: !3310)
!3310 = distinct !DILocation(line: 82, column: 18, scope: !3306, inlinedAt: !3281)
!3311 = !DILocalVariable(name: "b", arg: 2, scope: !3308, file: !668, line: 70, type: !90)
!3312 = !DILocalVariable(name: "n", arg: 3, scope: !3308, file: !668, line: 70, type: !86)
!3313 = !DILocalVariable(name: "m", arg: 4, scope: !3308, file: !668, line: 70, type: !86)
!3314 = !DILocalVariable(name: "ret", scope: !3308, file: !668, line: 71, type: !51)
!3315 = !DILocalVariable(name: "i", scope: !3316, file: !668, line: 72, type: !86)
!3316 = distinct !DILexicalBlock(scope: !3308, file: !668, line: 72, column: 5)
!3317 = !DILocation(line: 0, scope: !3316, inlinedAt: !3310)
!3318 = !DILocation(line: 72, column: 10, scope: !3316, inlinedAt: !3310)
!3319 = !DILocation(line: 72, scope: !3316, inlinedAt: !3310)
!3320 = !DILocation(line: 72, column: 23, scope: !3321, inlinedAt: !3310)
!3321 = distinct !DILexicalBlock(scope: !3316, file: !668, line: 72, column: 5)
!3322 = !DILocation(line: 72, column: 5, scope: !3316, inlinedAt: !3310)
!3323 = !DILocation(line: 73, column: 27, scope: !3324, inlinedAt: !3310)
!3324 = distinct !DILexicalBlock(scope: !3321, file: !668, line: 72, column: 41)
!3325 = !DILocation(line: 73, column: 33, scope: !3324, inlinedAt: !3310)
!3326 = !DILocalVariable(name: "a", arg: 1, scope: !3327, file: !668, line: 8, type: !51)
!3327 = distinct !DISubprogram(name: "mul_f", scope: !668, file: !668, line: 8, type: !1540, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3328 = !DILocation(line: 0, scope: !3327, inlinedAt: !3329)
!3329 = distinct !DILocation(line: 73, column: 21, scope: !3324, inlinedAt: !3310)
!3330 = !DILocalVariable(name: "b", arg: 2, scope: !3327, file: !668, line: 8, type: !51)
!3331 = !DILocation(line: 13, column: 10, scope: !3327, inlinedAt: !3329)
!3332 = !DILocation(line: 13, column: 7, scope: !3327, inlinedAt: !3329)
!3333 = !DILocation(line: 16, column: 17, scope: !3327, inlinedAt: !3329)
!3334 = !DILocalVariable(name: "p", scope: !3327, file: !668, line: 10, type: !51)
!3335 = !DILocation(line: 17, column: 13, scope: !3327, inlinedAt: !3329)
!3336 = !DILocation(line: 17, column: 17, scope: !3327, inlinedAt: !3329)
!3337 = !DILocation(line: 17, column: 7, scope: !3327, inlinedAt: !3329)
!3338 = !DILocation(line: 18, column: 13, scope: !3327, inlinedAt: !3329)
!3339 = !DILocation(line: 18, column: 17, scope: !3327, inlinedAt: !3329)
!3340 = !DILocation(line: 18, column: 7, scope: !3327, inlinedAt: !3329)
!3341 = !DILocation(line: 19, column: 13, scope: !3327, inlinedAt: !3329)
!3342 = !DILocation(line: 19, column: 17, scope: !3327, inlinedAt: !3329)
!3343 = !DILocation(line: 19, column: 7, scope: !3327, inlinedAt: !3329)
!3344 = !DILocalVariable(name: "top_p", scope: !3327, file: !668, line: 22, type: !51)
!3345 = !DILocation(line: 23, column: 37, scope: !3327, inlinedAt: !3329)
!3346 = !DILocation(line: 23, column: 52, scope: !3327, inlinedAt: !3329)
!3347 = !DILocation(line: 23, column: 43, scope: !3327, inlinedAt: !3329)
!3348 = !DILocation(line: 23, column: 59, scope: !3327, inlinedAt: !3329)
!3349 = !DILocalVariable(name: "out", scope: !3327, file: !668, line: 23, type: !51)
!3350 = !DILocalVariable(name: "a", arg: 1, scope: !3351, file: !668, line: 42, type: !51)
!3351 = distinct !DISubprogram(name: "add_f", scope: !668, file: !668, line: 42, type: !1540, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3352 = !DILocation(line: 0, scope: !3351, inlinedAt: !3353)
!3353 = distinct !DILocation(line: 73, column: 15, scope: !3324, inlinedAt: !3310)
!3354 = !DILocalVariable(name: "b", arg: 2, scope: !3351, file: !668, line: 42, type: !51)
!3355 = !DILocation(line: 43, column: 14, scope: !3351, inlinedAt: !3353)
!3356 = !DILocation(line: 72, column: 28, scope: !3321, inlinedAt: !3310)
!3357 = !DILocation(line: 72, column: 35, scope: !3321, inlinedAt: !3310)
!3358 = !DILocation(line: 72, column: 5, scope: !3321, inlinedAt: !3310)
!3359 = distinct !{!3359, !3322, !3360, !298}
!3360 = !DILocation(line: 74, column: 5, scope: !3316, inlinedAt: !3310)
!3361 = !DILocation(line: 82, column: 16, scope: !3306, inlinedAt: !3281)
!3362 = !DILocation(line: 81, column: 41, scope: !3304, inlinedAt: !3281)
!3363 = !DILocation(line: 81, column: 9, scope: !3304, inlinedAt: !3281)
!3364 = distinct !{!3364, !3295, !3365, !298}
!3365 = !DILocation(line: 83, column: 9, scope: !3296, inlinedAt: !3281)
!3366 = !DILocation(line: 80, column: 32, scope: !3293, inlinedAt: !3281)
!3367 = !DILocation(line: 80, column: 39, scope: !3293, inlinedAt: !3281)
!3368 = !DILocation(line: 80, column: 5, scope: !3293, inlinedAt: !3281)
!3369 = distinct !{!3369, !3294, !3370, !298}
!3370 = !DILocation(line: 84, column: 5, scope: !3288, inlinedAt: !3281)
!3371 = !DILocation(line: 63, scope: !3299)
!3372 = !DILocalVariable(name: "i", scope: !3299, file: !99, line: 63, type: !86)
!3373 = !DILocation(line: 0, scope: !3299)
!3374 = !DILocation(line: 63, column: 23, scope: !3375)
!3375 = distinct !DILexicalBlock(scope: !3299, file: !99, line: 63, column: 5)
!3376 = !DILocation(line: 64, column: 44, scope: !3377)
!3377 = distinct !DILexicalBlock(scope: !3375, file: !99, line: 63, column: 33)
!3378 = !DILocation(line: 64, column: 50, scope: !3377)
!3379 = !DILocalVariable(name: "a", arg: 1, scope: !3380, file: !668, line: 47, type: !51)
!3380 = distinct !DISubprogram(name: "sub_f", scope: !668, file: !668, line: 47, type: !1540, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3381 = !DILocation(line: 0, scope: !3380, inlinedAt: !3382)
!3382 = distinct !DILocation(line: 64, column: 38, scope: !3377)
!3383 = !DILocalVariable(name: "b", arg: 2, scope: !3380, file: !668, line: 47, type: !51)
!3384 = !DILocation(line: 48, column: 14, scope: !3380, inlinedAt: !3382)
!3385 = !DILocation(line: 64, column: 13, scope: !3377)
!3386 = !DILocation(line: 64, column: 26, scope: !3377)
!3387 = !DILocation(line: 64, column: 30, scope: !3377)
!3388 = !DILocation(line: 64, column: 21, scope: !3377)
!3389 = !DILocation(line: 64, column: 9, scope: !3377)
!3390 = !DILocation(line: 64, column: 36, scope: !3377)
!3391 = !DILocation(line: 63, column: 29, scope: !3375)
!3392 = !DILocation(line: 63, column: 5, scope: !3375)
!3393 = distinct !{!3393, !3298, !3394, !298}
!3394 = !DILocation(line: 65, column: 5, scope: !3299)
!3395 = !DILocation(line: 67, column: 16, scope: !3230)
!3396 = !DILocation(line: 67, column: 20, scope: !3230)
!3397 = !DILocation(line: 64, column: 27, scope: !3398, inlinedAt: !3402)
!3398 = distinct !DISubprogram(name: "EF", scope: !3399, file: !3399, line: 60, type: !3400, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3399 = !DIFile(filename: "../../../src/generic/echelon_form.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!3400 = !DISubroutineType(types: !3401)
!3401 = !{null, !61, !86, !86}
!3402 = distinct !DILocation(line: 67, column: 5, scope: !3230)
!3403 = !DILocalVariable(name: "A", arg: 1, scope: !3398, file: !3399, line: 60, type: !61)
!3404 = !DILocation(line: 0, scope: !3398, inlinedAt: !3402)
!3405 = !DILocalVariable(name: "nrows", arg: 2, scope: !3398, file: !3399, line: 60, type: !86)
!3406 = !DILocalVariable(name: "ncols", arg: 3, scope: !3398, file: !3399, line: 60, type: !86)
!3407 = !DILocalVariable(name: "_pivot_row", scope: !3398, file: !3399, line: 62, type: !278, align: 256)
!3408 = !DILocation(line: 62, column: 27, scope: !3398, inlinedAt: !3402)
!3409 = !DILocalVariable(name: "_pivot_row2", scope: !3398, file: !3399, line: 63, type: !278, align: 256)
!3410 = !DILocation(line: 63, column: 27, scope: !3398, inlinedAt: !3402)
!3411 = !DILocalVariable(name: "packed_A", scope: !3398, file: !3399, line: 64, type: !3412, align: 256)
!3412 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 48384, elements: !3413)
!3413 = !{!3414}
!3414 = !DISubrange(count: 756)
!3415 = !DILocation(line: 66, column: 26, scope: !3398, inlinedAt: !3402)
!3416 = !DILocation(line: 66, column: 32, scope: !3398, inlinedAt: !3402)
!3417 = !DILocalVariable(name: "row_len", scope: !3398, file: !3399, line: 66, type: !86)
!3418 = !DILocalVariable(name: "i", scope: !3419, file: !3399, line: 69, type: !86)
!3419 = distinct !DILexicalBlock(scope: !3398, file: !3399, line: 69, column: 5)
!3420 = !DILocation(line: 0, scope: !3419, inlinedAt: !3402)
!3421 = !DILocation(line: 69, column: 10, scope: !3419, inlinedAt: !3402)
!3422 = !DILocation(line: 69, scope: !3419, inlinedAt: !3402)
!3423 = !DILocation(line: 69, column: 23, scope: !3424, inlinedAt: !3402)
!3424 = distinct !DILexicalBlock(scope: !3419, file: !3399, line: 69, column: 5)
!3425 = !DILocation(line: 69, column: 5, scope: !3419, inlinedAt: !3402)
!3426 = !DILocation(line: 77, column: 5, scope: !3427, inlinedAt: !3402)
!3427 = distinct !DILexicalBlock(scope: !3398, file: !3399, line: 77, column: 5)
!3428 = !DILocation(line: 70, column: 29, scope: !3429, inlinedAt: !3402)
!3429 = distinct !DILexicalBlock(scope: !3424, file: !3399, line: 69, column: 37)
!3430 = !DILocation(line: 70, column: 25, scope: !3429, inlinedAt: !3402)
!3431 = !DILocation(line: 70, column: 51, scope: !3429, inlinedAt: !3402)
!3432 = !DILocation(line: 70, column: 47, scope: !3429, inlinedAt: !3402)
!3433 = !DILocalVariable(name: "in", arg: 1, scope: !3434, file: !3399, line: 24, type: !90)
!3434 = distinct !DISubprogram(name: "ef_pack_m_vec", scope: !3399, file: !3399, line: 24, type: !3435, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3435 = !DISubroutineType(types: !3436)
!3436 = !{null, !90, !52, !86}
!3437 = !DILocation(line: 0, scope: !3434, inlinedAt: !3438)
!3438 = distinct !DILocation(line: 70, column: 9, scope: !3429, inlinedAt: !3402)
!3439 = !DILocalVariable(name: "out", arg: 2, scope: !3434, file: !3399, line: 24, type: !52)
!3440 = !DILocalVariable(name: "ncols", arg: 3, scope: !3434, file: !3399, line: 24, type: !86)
!3441 = !DILocalVariable(name: "out8", scope: !3434, file: !3399, line: 26, type: !61)
!3442 = !DILocalVariable(name: "i", scope: !3434, file: !3399, line: 25, type: !86)
!3443 = !DILocation(line: 27, column: 9, scope: !3444, inlinedAt: !3438)
!3444 = distinct !DILexicalBlock(scope: !3434, file: !3399, line: 27, column: 5)
!3445 = !DILocation(line: 27, scope: !3444, inlinedAt: !3438)
!3446 = !DILocation(line: 27, column: 20, scope: !3447, inlinedAt: !3438)
!3447 = distinct !DILexicalBlock(scope: !3444, file: !3399, line: 27, column: 5)
!3448 = !DILocation(line: 27, column: 5, scope: !3444, inlinedAt: !3438)
!3449 = !DILocation(line: 31, column: 23, scope: !3450, inlinedAt: !3438)
!3450 = distinct !DILexicalBlock(scope: !3447, file: !3399, line: 27, column: 36)
!3451 = !DILocation(line: 31, column: 44, scope: !3450, inlinedAt: !3438)
!3452 = !DILocation(line: 31, column: 40, scope: !3450, inlinedAt: !3438)
!3453 = !DILocation(line: 31, column: 48, scope: !3450, inlinedAt: !3438)
!3454 = !DILocation(line: 31, column: 37, scope: !3450, inlinedAt: !3438)
!3455 = !DILocation(line: 31, column: 15, scope: !3450, inlinedAt: !3438)
!3456 = !DILocation(line: 31, column: 9, scope: !3450, inlinedAt: !3438)
!3457 = !DILocation(line: 31, column: 20, scope: !3450, inlinedAt: !3438)
!3458 = !DILocation(line: 27, column: 31, scope: !3447, inlinedAt: !3438)
!3459 = !DILocation(line: 27, column: 5, scope: !3447, inlinedAt: !3438)
!3460 = distinct !{!3460, !3448, !3461, !298}
!3461 = !DILocation(line: 33, column: 5, scope: !3444, inlinedAt: !3438)
!3462 = !DILocation(line: 34, column: 19, scope: !3463, inlinedAt: !3438)
!3463 = distinct !DILexicalBlock(scope: !3434, file: !3399, line: 34, column: 9)
!3464 = !DILocation(line: 38, column: 23, scope: !3465, inlinedAt: !3438)
!3465 = distinct !DILexicalBlock(scope: !3463, file: !3399, line: 34, column: 24)
!3466 = !DILocation(line: 38, column: 15, scope: !3465, inlinedAt: !3438)
!3467 = !DILocation(line: 38, column: 9, scope: !3465, inlinedAt: !3438)
!3468 = !DILocation(line: 38, column: 20, scope: !3465, inlinedAt: !3438)
!3469 = !DILocation(line: 40, column: 5, scope: !3465, inlinedAt: !3438)
!3470 = !DILocation(line: 69, column: 33, scope: !3424, inlinedAt: !3402)
!3471 = !DILocation(line: 69, column: 5, scope: !3424, inlinedAt: !3402)
!3472 = distinct !{!3472, !3425, !3473, !298}
!3473 = !DILocation(line: 71, column: 5, scope: !3419, inlinedAt: !3402)
!3474 = !DILocation(line: 77, scope: !3427, inlinedAt: !3402)
!3475 = !DILocalVariable(name: "pivot_row", scope: !3398, file: !3399, line: 76, type: !86)
!3476 = !DILocalVariable(name: "pivot_col", scope: !3427, file: !3399, line: 77, type: !86)
!3477 = !DILocation(line: 0, scope: !3427, inlinedAt: !3402)
!3478 = !DILocation(line: 77, column: 39, scope: !3479, inlinedAt: !3402)
!3479 = distinct !DILexicalBlock(scope: !3427, file: !3399, line: 77, column: 5)
!3480 = !DILocation(line: 138, column: 5, scope: !3481, inlinedAt: !3402)
!3481 = distinct !DILexicalBlock(scope: !3398, file: !3399, line: 138, column: 5)
!3482 = !DILocation(line: 79, column: 37, scope: !3483, inlinedAt: !3402)
!3483 = distinct !DILexicalBlock(scope: !3479, file: !3399, line: 77, column: 61)
!3484 = !DILocalVariable(name: "pivot_row_lower_bound", scope: !3483, file: !3399, line: 79, type: !86)
!3485 = !DILocation(line: 0, scope: !3483, inlinedAt: !3402)
!3486 = !DILocation(line: 80, column: 37, scope: !3483, inlinedAt: !3402)
!3487 = !DILocalVariable(name: "pivot_row_upper_bound", scope: !3483, file: !3399, line: 80, type: !86)
!3488 = !DILocalVariable(name: "i", scope: !3489, file: !3399, line: 85, type: !86)
!3489 = distinct !DILexicalBlock(scope: !3483, file: !3399, line: 85, column: 9)
!3490 = !DILocation(line: 0, scope: !3489, inlinedAt: !3402)
!3491 = !DILocation(line: 85, column: 14, scope: !3489, inlinedAt: !3402)
!3492 = !DILocation(line: 85, scope: !3489, inlinedAt: !3402)
!3493 = !DILocation(line: 85, column: 27, scope: !3494, inlinedAt: !3402)
!3494 = distinct !DILexicalBlock(scope: !3489, file: !3399, line: 85, column: 9)
!3495 = !DILocation(line: 85, column: 9, scope: !3489, inlinedAt: !3402)
!3496 = !DILocation(line: 93, column: 9, scope: !3497, inlinedAt: !3402)
!3497 = distinct !DILexicalBlock(scope: !3483, file: !3399, line: 93, column: 9)
!3498 = !DILocation(line: 86, column: 13, scope: !3499, inlinedAt: !3402)
!3499 = distinct !DILexicalBlock(scope: !3494, file: !3399, line: 85, column: 43)
!3500 = !DILocation(line: 86, column: 27, scope: !3499, inlinedAt: !3402)
!3501 = !DILocation(line: 87, column: 13, scope: !3499, inlinedAt: !3402)
!3502 = !DILocation(line: 87, column: 28, scope: !3499, inlinedAt: !3402)
!3503 = !DILocation(line: 85, column: 39, scope: !3494, inlinedAt: !3402)
!3504 = !DILocation(line: 85, column: 9, scope: !3494, inlinedAt: !3402)
!3505 = distinct !{!3505, !3495, !3506, !298}
!3506 = !DILocation(line: 88, column: 9, scope: !3489, inlinedAt: !3402)
!3507 = !DILocation(line: 0, scope: !3497, inlinedAt: !3402)
!3508 = !DILocalVariable(name: "row", scope: !3497, file: !3399, line: 93, type: !86)
!3509 = !DILocalVariable(name: "pivot", scope: !3483, file: !3399, line: 91, type: !51)
!3510 = !DILocalVariable(name: "pivot_is_zero", scope: !3483, file: !3399, line: 92, type: !53)
!3511 = !DILocation(line: 94, column: 24, scope: !3512, inlinedAt: !3402)
!3512 = distinct !DILexicalBlock(scope: !3497, file: !3399, line: 93, column: 9)
!3513 = !DILocation(line: 94, column: 21, scope: !3512, inlinedAt: !3402)
!3514 = !DILocalVariable(name: "a", arg: 1, scope: !3515, file: !3516, line: 46, type: !86)
!3515 = distinct !DISubprogram(name: "ct_compare_64", scope: !3516, file: !3516, line: 46, type: !3517, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3516 = !DIFile(filename: "../../../src/arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!3517 = !DISubroutineType(types: !3518)
!3518 = !{!53, !86, !86}
!3519 = !DILocation(line: 0, scope: !3515, inlinedAt: !3520)
!3520 = distinct !DILocation(line: 96, column: 38, scope: !3521, inlinedAt: !3402)
!3521 = distinct !DILexicalBlock(scope: !3512, file: !3399, line: 94, column: 80)
!3522 = !DILocalVariable(name: "b", arg: 2, scope: !3515, file: !3516, line: 46, type: !86)
!3523 = !DILocation(line: 47, column: 38, scope: !3515, inlinedAt: !3520)
!3524 = !DILocation(line: 47, column: 73, scope: !3515, inlinedAt: !3520)
!3525 = !DILocation(line: 96, column: 37, scope: !3521, inlinedAt: !3402)
!3526 = !DILocalVariable(name: "is_pivot_row", scope: !3521, file: !3399, line: 96, type: !53)
!3527 = !DILocation(line: 0, scope: !3521, inlinedAt: !3402)
!3528 = !DILocalVariable(name: "a", arg: 1, scope: !3529, file: !3516, line: 35, type: !86)
!3529 = distinct !DISubprogram(name: "ct_64_is_greater_than", scope: !3516, file: !3516, line: 35, type: !3517, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3530 = !DILocation(line: 0, scope: !3529, inlinedAt: !3531)
!3531 = distinct !DILocation(line: 97, column: 40, scope: !3521, inlinedAt: !3402)
!3532 = !DILocalVariable(name: "b", arg: 2, scope: !3529, file: !3516, line: 35, type: !86)
!3533 = !DILocalVariable(name: "diff", scope: !3529, file: !3516, line: 36, type: !87)
!3534 = !DILocation(line: 37, column: 30, scope: !3529, inlinedAt: !3531)
!3535 = !DILocation(line: 37, column: 59, scope: !3529, inlinedAt: !3531)
!3536 = !DILocation(line: 37, column: 57, scope: !3529, inlinedAt: !3531)
!3537 = !DILocalVariable(name: "below_pivot_row", scope: !3521, file: !3399, line: 97, type: !53)
!3538 = !DILocalVariable(name: "j", scope: !3539, file: !3399, line: 99, type: !86)
!3539 = distinct !DILexicalBlock(scope: !3521, file: !3399, line: 99, column: 13)
!3540 = !DILocation(line: 0, scope: !3539, inlinedAt: !3402)
!3541 = !DILocation(line: 99, column: 18, scope: !3539, inlinedAt: !3402)
!3542 = !DILocation(line: 99, scope: !3539, inlinedAt: !3402)
!3543 = !DILocation(line: 99, column: 31, scope: !3544, inlinedAt: !3402)
!3544 = distinct !DILexicalBlock(scope: !3539, file: !3399, line: 99, column: 13)
!3545 = !DILocation(line: 99, column: 13, scope: !3539, inlinedAt: !3402)
!3546 = !DILocation(line: 100, column: 67, scope: !3547, inlinedAt: !3402)
!3547 = distinct !DILexicalBlock(scope: !3544, file: !3399, line: 99, column: 47)
!3548 = !DILocation(line: 100, column: 48, scope: !3547, inlinedAt: !3402)
!3549 = !DILocation(line: 101, column: 47, scope: !3547, inlinedAt: !3402)
!3550 = !DILocation(line: 101, column: 57, scope: !3547, inlinedAt: !3402)
!3551 = !DILocation(line: 101, column: 34, scope: !3547, inlinedAt: !3402)
!3552 = !DILocation(line: 100, column: 85, scope: !3547, inlinedAt: !3402)
!3553 = !DILocation(line: 100, column: 17, scope: !3547, inlinedAt: !3402)
!3554 = !DILocation(line: 100, column: 31, scope: !3547, inlinedAt: !3402)
!3555 = !DILocation(line: 99, column: 43, scope: !3544, inlinedAt: !3402)
!3556 = !DILocation(line: 99, column: 13, scope: !3544, inlinedAt: !3402)
!3557 = distinct !{!3557, !3545, !3558, !298}
!3558 = !DILocation(line: 102, column: 13, scope: !3539, inlinedAt: !3402)
!3559 = !DILocalVariable(name: "in", arg: 1, scope: !3560, file: !3399, line: 16, type: !486)
!3560 = distinct !DISubprogram(name: "m_extract_element", scope: !3399, file: !3399, line: 16, type: !3561, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3561 = !DISubroutineType(types: !3562)
!3562 = !{!51, !486, !86}
!3563 = !DILocation(line: 0, scope: !3560, inlinedAt: !3564)
!3564 = distinct !DILocation(line: 103, column: 21, scope: !3521, inlinedAt: !3402)
!3565 = !DILocalVariable(name: "index", arg: 2, scope: !3560, file: !3399, line: 16, type: !86)
!3566 = !DILocation(line: 17, column: 27, scope: !3560, inlinedAt: !3564)
!3567 = !DILocalVariable(name: "leg", scope: !3560, file: !3399, line: 17, type: !275)
!3568 = !DILocalVariable(name: "offset", scope: !3560, file: !3399, line: 18, type: !275)
!3569 = !DILocation(line: 20, column: 13, scope: !3560, inlinedAt: !3564)
!3570 = !DILocation(line: 20, column: 31, scope: !3560, inlinedAt: !3564)
!3571 = !DILocation(line: 20, column: 21, scope: !3560, inlinedAt: !3564)
!3572 = !DILocation(line: 20, column: 12, scope: !3560, inlinedAt: !3564)
!3573 = !DILocation(line: 0, scope: !3515, inlinedAt: !3574)
!3574 = distinct !DILocation(line: 104, column: 30, scope: !3521, inlinedAt: !3402)
!3575 = !DILocation(line: 47, column: 73, scope: !3515, inlinedAt: !3574)
!3576 = !DILocation(line: 104, column: 29, scope: !3521, inlinedAt: !3402)
!3577 = !DILocation(line: 94, column: 76, scope: !3512, inlinedAt: !3402)
!3578 = !DILocation(line: 93, column: 9, scope: !3512, inlinedAt: !3402)
!3579 = distinct !{!3579, !3496, !3580, !298}
!3580 = !DILocation(line: 105, column: 9, scope: !3497, inlinedAt: !3402)
!3581 = !DILocalVariable(name: "a", arg: 1, scope: !3582, file: !668, line: 56, type: !51)
!3582 = distinct !DISubprogram(name: "inverse_f", scope: !668, file: !668, line: 56, type: !3583, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3583 = !DISubroutineType(types: !3584)
!3584 = !{!51, !51}
!3585 = !DILocation(line: 0, scope: !3582, inlinedAt: !3586)
!3586 = distinct !DILocation(line: 108, column: 19, scope: !3483, inlinedAt: !3402)
!3587 = !DILocation(line: 0, scope: !3327, inlinedAt: !3588)
!3588 = distinct !DILocation(line: 60, column: 24, scope: !3582, inlinedAt: !3586)
!3589 = !DILocation(line: 13, column: 10, scope: !3327, inlinedAt: !3588)
!3590 = !DILocation(line: 13, column: 7, scope: !3327, inlinedAt: !3588)
!3591 = !DILocation(line: 16, column: 17, scope: !3327, inlinedAt: !3588)
!3592 = !DILocation(line: 17, column: 13, scope: !3327, inlinedAt: !3588)
!3593 = !DILocation(line: 17, column: 17, scope: !3327, inlinedAt: !3588)
!3594 = !DILocation(line: 17, column: 7, scope: !3327, inlinedAt: !3588)
!3595 = !DILocation(line: 18, column: 13, scope: !3327, inlinedAt: !3588)
!3596 = !DILocation(line: 18, column: 17, scope: !3327, inlinedAt: !3588)
!3597 = !DILocation(line: 18, column: 7, scope: !3327, inlinedAt: !3588)
!3598 = !DILocation(line: 19, column: 13, scope: !3327, inlinedAt: !3588)
!3599 = !DILocation(line: 19, column: 17, scope: !3327, inlinedAt: !3588)
!3600 = !DILocation(line: 19, column: 7, scope: !3327, inlinedAt: !3588)
!3601 = !DILocation(line: 23, column: 37, scope: !3327, inlinedAt: !3588)
!3602 = !DILocation(line: 23, column: 52, scope: !3327, inlinedAt: !3588)
!3603 = !DILocation(line: 23, column: 43, scope: !3327, inlinedAt: !3588)
!3604 = !DILocation(line: 23, column: 59, scope: !3327, inlinedAt: !3588)
!3605 = !DILocalVariable(name: "a2", scope: !3582, file: !668, line: 60, type: !51)
!3606 = !DILocation(line: 0, scope: !3327, inlinedAt: !3607)
!3607 = distinct !DILocation(line: 61, column: 24, scope: !3582, inlinedAt: !3586)
!3608 = !DILocation(line: 13, column: 10, scope: !3327, inlinedAt: !3607)
!3609 = !DILocation(line: 13, column: 7, scope: !3327, inlinedAt: !3607)
!3610 = !DILocation(line: 16, column: 17, scope: !3327, inlinedAt: !3607)
!3611 = !DILocation(line: 17, column: 13, scope: !3327, inlinedAt: !3607)
!3612 = !DILocation(line: 17, column: 17, scope: !3327, inlinedAt: !3607)
!3613 = !DILocation(line: 17, column: 7, scope: !3327, inlinedAt: !3607)
!3614 = !DILocation(line: 18, column: 13, scope: !3327, inlinedAt: !3607)
!3615 = !DILocation(line: 18, column: 17, scope: !3327, inlinedAt: !3607)
!3616 = !DILocation(line: 18, column: 7, scope: !3327, inlinedAt: !3607)
!3617 = !DILocation(line: 19, column: 13, scope: !3327, inlinedAt: !3607)
!3618 = !DILocation(line: 19, column: 17, scope: !3327, inlinedAt: !3607)
!3619 = !DILocation(line: 19, column: 7, scope: !3327, inlinedAt: !3607)
!3620 = !DILocation(line: 23, column: 37, scope: !3327, inlinedAt: !3607)
!3621 = !DILocation(line: 23, column: 52, scope: !3327, inlinedAt: !3607)
!3622 = !DILocation(line: 23, column: 43, scope: !3327, inlinedAt: !3607)
!3623 = !DILocation(line: 23, column: 59, scope: !3327, inlinedAt: !3607)
!3624 = !DILocalVariable(name: "a4", scope: !3582, file: !668, line: 61, type: !51)
!3625 = !DILocation(line: 0, scope: !3327, inlinedAt: !3626)
!3626 = distinct !DILocation(line: 62, column: 24, scope: !3582, inlinedAt: !3586)
!3627 = !DILocation(line: 13, column: 10, scope: !3327, inlinedAt: !3626)
!3628 = !DILocation(line: 13, column: 7, scope: !3327, inlinedAt: !3626)
!3629 = !DILocation(line: 16, column: 17, scope: !3327, inlinedAt: !3626)
!3630 = !DILocation(line: 17, column: 13, scope: !3327, inlinedAt: !3626)
!3631 = !DILocation(line: 17, column: 17, scope: !3327, inlinedAt: !3626)
!3632 = !DILocation(line: 17, column: 7, scope: !3327, inlinedAt: !3626)
!3633 = !DILocation(line: 18, column: 13, scope: !3327, inlinedAt: !3626)
!3634 = !DILocation(line: 18, column: 17, scope: !3327, inlinedAt: !3626)
!3635 = !DILocation(line: 18, column: 7, scope: !3327, inlinedAt: !3626)
!3636 = !DILocation(line: 19, column: 13, scope: !3327, inlinedAt: !3626)
!3637 = !DILocation(line: 19, column: 17, scope: !3327, inlinedAt: !3626)
!3638 = !DILocation(line: 19, column: 7, scope: !3327, inlinedAt: !3626)
!3639 = !DILocation(line: 23, column: 37, scope: !3327, inlinedAt: !3626)
!3640 = !DILocation(line: 23, column: 52, scope: !3327, inlinedAt: !3626)
!3641 = !DILocation(line: 23, column: 43, scope: !3327, inlinedAt: !3626)
!3642 = !DILocation(line: 23, column: 59, scope: !3327, inlinedAt: !3626)
!3643 = !DILocalVariable(name: "a8", scope: !3582, file: !668, line: 62, type: !51)
!3644 = !DILocation(line: 0, scope: !3327, inlinedAt: !3645)
!3645 = distinct !DILocation(line: 63, column: 24, scope: !3582, inlinedAt: !3586)
!3646 = !DILocation(line: 13, column: 10, scope: !3327, inlinedAt: !3645)
!3647 = !DILocation(line: 13, column: 7, scope: !3327, inlinedAt: !3645)
!3648 = !DILocation(line: 16, column: 17, scope: !3327, inlinedAt: !3645)
!3649 = !DILocation(line: 17, column: 13, scope: !3327, inlinedAt: !3645)
!3650 = !DILocation(line: 17, column: 17, scope: !3327, inlinedAt: !3645)
!3651 = !DILocation(line: 17, column: 7, scope: !3327, inlinedAt: !3645)
!3652 = !DILocation(line: 18, column: 13, scope: !3327, inlinedAt: !3645)
!3653 = !DILocation(line: 18, column: 17, scope: !3327, inlinedAt: !3645)
!3654 = !DILocation(line: 18, column: 7, scope: !3327, inlinedAt: !3645)
!3655 = !DILocation(line: 19, column: 13, scope: !3327, inlinedAt: !3645)
!3656 = !DILocation(line: 19, column: 17, scope: !3327, inlinedAt: !3645)
!3657 = !DILocation(line: 19, column: 7, scope: !3327, inlinedAt: !3645)
!3658 = !DILocation(line: 23, column: 37, scope: !3327, inlinedAt: !3645)
!3659 = !DILocation(line: 23, column: 52, scope: !3327, inlinedAt: !3645)
!3660 = !DILocation(line: 23, column: 43, scope: !3327, inlinedAt: !3645)
!3661 = !DILocation(line: 23, column: 59, scope: !3327, inlinedAt: !3645)
!3662 = !DILocalVariable(name: "a6", scope: !3582, file: !668, line: 63, type: !51)
!3663 = !DILocation(line: 0, scope: !3327, inlinedAt: !3664)
!3664 = distinct !DILocation(line: 64, column: 25, scope: !3582, inlinedAt: !3586)
!3665 = !DILocation(line: 13, column: 10, scope: !3327, inlinedAt: !3664)
!3666 = !DILocation(line: 13, column: 7, scope: !3327, inlinedAt: !3664)
!3667 = !DILocation(line: 16, column: 17, scope: !3327, inlinedAt: !3664)
!3668 = !DILocation(line: 17, column: 13, scope: !3327, inlinedAt: !3664)
!3669 = !DILocation(line: 17, column: 17, scope: !3327, inlinedAt: !3664)
!3670 = !DILocation(line: 17, column: 7, scope: !3327, inlinedAt: !3664)
!3671 = !DILocation(line: 18, column: 13, scope: !3327, inlinedAt: !3664)
!3672 = !DILocation(line: 18, column: 17, scope: !3327, inlinedAt: !3664)
!3673 = !DILocation(line: 18, column: 7, scope: !3327, inlinedAt: !3664)
!3674 = !DILocation(line: 19, column: 13, scope: !3327, inlinedAt: !3664)
!3675 = !DILocation(line: 19, column: 17, scope: !3327, inlinedAt: !3664)
!3676 = !DILocation(line: 19, column: 7, scope: !3327, inlinedAt: !3664)
!3677 = !DILocation(line: 23, column: 37, scope: !3327, inlinedAt: !3664)
!3678 = !DILocation(line: 23, column: 52, scope: !3327, inlinedAt: !3664)
!3679 = !DILocation(line: 23, column: 43, scope: !3327, inlinedAt: !3664)
!3680 = !DILocation(line: 23, column: 59, scope: !3327, inlinedAt: !3664)
!3681 = !DILocalVariable(name: "a14", scope: !3582, file: !668, line: 64, type: !51)
!3682 = !DILocalVariable(name: "inverse", scope: !3398, file: !3399, line: 75, type: !51)
!3683 = !DILocation(line: 109, column: 9, scope: !3483, inlinedAt: !3402)
!3684 = !DILocalVariable(name: "row", scope: !3685, file: !3399, line: 113, type: !86)
!3685 = distinct !DILexicalBlock(scope: !3483, file: !3399, line: 113, column: 9)
!3686 = !DILocation(line: 0, scope: !3685, inlinedAt: !3402)
!3687 = !DILocation(line: 113, column: 14, scope: !3685, inlinedAt: !3402)
!3688 = !DILocation(line: 113, scope: !3685, inlinedAt: !3402)
!3689 = !DILocation(line: 113, column: 51, scope: !3690, inlinedAt: !3402)
!3690 = distinct !DILexicalBlock(scope: !3685, file: !3399, line: 113, column: 9)
!3691 = !DILocation(line: 113, column: 9, scope: !3685, inlinedAt: !3402)
!3692 = !DILocation(line: 124, column: 9, scope: !3693, inlinedAt: !3402)
!3693 = distinct !DILexicalBlock(scope: !3483, file: !3399, line: 124, column: 9)
!3694 = !DILocation(line: 0, scope: !3515, inlinedAt: !3695)
!3695 = distinct !DILocation(line: 114, column: 33, scope: !3696, inlinedAt: !3402)
!3696 = distinct !DILexicalBlock(scope: !3690, file: !3399, line: 113, column: 84)
!3697 = !DILocation(line: 47, column: 38, scope: !3515, inlinedAt: !3695)
!3698 = !DILocation(line: 47, column: 44, scope: !3515, inlinedAt: !3695)
!3699 = !DILocation(line: 47, column: 73, scope: !3515, inlinedAt: !3695)
!3700 = !DILocation(line: 47, column: 71, scope: !3515, inlinedAt: !3695)
!3701 = !DILocation(line: 114, column: 63, scope: !3696, inlinedAt: !3402)
!3702 = !DILocalVariable(name: "do_copy", scope: !3696, file: !3399, line: 114, type: !53)
!3703 = !DILocation(line: 0, scope: !3696, inlinedAt: !3402)
!3704 = !DILocalVariable(name: "do_not_copy", scope: !3696, file: !3399, line: 115, type: !53)
!3705 = !DILocalVariable(name: "col", scope: !3706, file: !3399, line: 116, type: !86)
!3706 = distinct !DILexicalBlock(scope: !3696, file: !3399, line: 116, column: 13)
!3707 = !DILocation(line: 0, scope: !3706, inlinedAt: !3402)
!3708 = !DILocation(line: 116, column: 18, scope: !3706, inlinedAt: !3402)
!3709 = !DILocation(line: 116, scope: !3706, inlinedAt: !3402)
!3710 = !DILocation(line: 116, column: 35, scope: !3711, inlinedAt: !3402)
!3711 = distinct !DILexicalBlock(scope: !3706, file: !3399, line: 116, column: 13)
!3712 = !DILocation(line: 116, column: 13, scope: !3706, inlinedAt: !3402)
!3713 = !DILocation(line: 118, column: 49, scope: !3714, inlinedAt: !3402)
!3714 = distinct !DILexicalBlock(scope: !3711, file: !3399, line: 116, column: 53)
!3715 = !DILocation(line: 118, column: 59, scope: !3714, inlinedAt: !3402)
!3716 = !DILocation(line: 118, column: 36, scope: !3714, inlinedAt: !3402)
!3717 = !DILocation(line: 118, column: 34, scope: !3714, inlinedAt: !3402)
!3718 = !DILocation(line: 119, column: 32, scope: !3714, inlinedAt: !3402)
!3719 = !DILocation(line: 119, column: 30, scope: !3714, inlinedAt: !3402)
!3720 = !DILocation(line: 118, column: 67, scope: !3714, inlinedAt: !3402)
!3721 = !DILocation(line: 117, column: 30, scope: !3714, inlinedAt: !3402)
!3722 = !DILocation(line: 117, column: 40, scope: !3714, inlinedAt: !3402)
!3723 = !DILocation(line: 117, column: 17, scope: !3714, inlinedAt: !3402)
!3724 = !DILocation(line: 117, column: 47, scope: !3714, inlinedAt: !3402)
!3725 = !DILocation(line: 116, column: 49, scope: !3711, inlinedAt: !3402)
!3726 = !DILocation(line: 116, column: 13, scope: !3711, inlinedAt: !3402)
!3727 = distinct !{!3727, !3712, !3728, !298}
!3728 = !DILocation(line: 120, column: 13, scope: !3706, inlinedAt: !3402)
!3729 = !DILocation(line: 113, column: 80, scope: !3690, inlinedAt: !3402)
!3730 = !DILocation(line: 113, column: 9, scope: !3690, inlinedAt: !3402)
!3731 = distinct !{!3731, !3691, !3732, !298}
!3732 = !DILocation(line: 121, column: 9, scope: !3685, inlinedAt: !3402)
!3733 = !DILocation(line: 124, scope: !3693, inlinedAt: !3402)
!3734 = !DILocalVariable(name: "row", scope: !3693, file: !3399, line: 124, type: !86)
!3735 = !DILocation(line: 0, scope: !3693, inlinedAt: !3402)
!3736 = !DILocation(line: 124, column: 51, scope: !3737, inlinedAt: !3402)
!3737 = distinct !DILexicalBlock(scope: !3693, file: !3399, line: 124, column: 9)
!3738 = !DILocation(line: 125, column: 46, scope: !3739, inlinedAt: !3402)
!3739 = distinct !DILexicalBlock(scope: !3737, file: !3399, line: 124, column: 67)
!3740 = !DILocalVariable(name: "below_pivot", scope: !3739, file: !3399, line: 125, type: !51)
!3741 = !DILocation(line: 0, scope: !3739, inlinedAt: !3402)
!3742 = !DILocation(line: 126, column: 74, scope: !3739, inlinedAt: !3402)
!3743 = !DILocation(line: 126, column: 68, scope: !3739, inlinedAt: !3402)
!3744 = !DILocation(line: 0, scope: !3560, inlinedAt: !3745)
!3745 = distinct !DILocation(line: 126, column: 41, scope: !3739, inlinedAt: !3402)
!3746 = !DILocation(line: 17, column: 27, scope: !3560, inlinedAt: !3745)
!3747 = !DILocation(line: 20, column: 13, scope: !3560, inlinedAt: !3745)
!3748 = !DILocation(line: 20, column: 31, scope: !3560, inlinedAt: !3745)
!3749 = !DILocation(line: 20, column: 21, scope: !3560, inlinedAt: !3745)
!3750 = !DILocation(line: 20, column: 12, scope: !3560, inlinedAt: !3745)
!3751 = !DILocalVariable(name: "elt_to_elim", scope: !3739, file: !3399, line: 126, type: !51)
!3752 = !DILocation(line: 128, column: 63, scope: !3739, inlinedAt: !3402)
!3753 = !DILocation(line: 129, column: 52, scope: !3739, inlinedAt: !3402)
!3754 = !DILocation(line: 129, column: 46, scope: !3739, inlinedAt: !3402)
!3755 = !DILocation(line: 128, column: 13, scope: !3739, inlinedAt: !3402)
!3756 = !DILocation(line: 124, column: 63, scope: !3737, inlinedAt: !3402)
!3757 = !DILocation(line: 124, column: 9, scope: !3737, inlinedAt: !3402)
!3758 = distinct !{!3758, !3692, !3759, !298}
!3759 = !DILocation(line: 130, column: 9, scope: !3693, inlinedAt: !3402)
!3760 = !DILocation(line: 132, column: 19, scope: !3483, inlinedAt: !3402)
!3761 = !DILocation(line: 77, column: 57, scope: !3479, inlinedAt: !3402)
!3762 = !DILocation(line: 77, column: 5, scope: !3479, inlinedAt: !3402)
!3763 = distinct !{!3763, !3426, !3764, !298}
!3764 = !DILocation(line: 133, column: 5, scope: !3427, inlinedAt: !3402)
!3765 = !DILocation(line: 138, scope: !3481, inlinedAt: !3402)
!3766 = !DILocalVariable(name: "i", scope: !3481, file: !3399, line: 138, type: !86)
!3767 = !DILocation(line: 0, scope: !3481, inlinedAt: !3402)
!3768 = !DILocation(line: 138, column: 23, scope: !3769, inlinedAt: !3402)
!3769 = distinct !DILexicalBlock(scope: !3481, file: !3399, line: 138, column: 5)
!3770 = !DILocation(line: 139, column: 47, scope: !3771, inlinedAt: !3402)
!3771 = distinct !DILexicalBlock(scope: !3769, file: !3399, line: 138, column: 37)
!3772 = !DILocation(line: 139, column: 43, scope: !3771, inlinedAt: !3402)
!3773 = !DILocalVariable(name: "legs", arg: 1, scope: !3774, file: !3399, line: 44, type: !86)
!3774 = distinct !DISubprogram(name: "ef_unpack_m_vec", scope: !3399, file: !3399, line: 44, type: !3775, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3775 = !DISubroutineType(types: !3776)
!3776 = !{null, !86, !486, !61}
!3777 = !DILocation(line: 0, scope: !3774, inlinedAt: !3778)
!3778 = distinct !DILocation(line: 139, column: 9, scope: !3771, inlinedAt: !3402)
!3779 = !DILocalVariable(name: "in", arg: 2, scope: !3774, file: !3399, line: 44, type: !486)
!3780 = !DILocalVariable(name: "out", arg: 3, scope: !3774, file: !3399, line: 44, type: !61)
!3781 = !DILocalVariable(name: "in8", scope: !3774, file: !3399, line: 45, type: !90)
!3782 = !DILocalVariable(name: "i", scope: !3783, file: !3399, line: 46, type: !86)
!3783 = distinct !DILexicalBlock(scope: !3774, file: !3399, line: 46, column: 5)
!3784 = !DILocation(line: 0, scope: !3783, inlinedAt: !3778)
!3785 = !DILocation(line: 46, column: 9, scope: !3783, inlinedAt: !3778)
!3786 = !DILocation(line: 46, scope: !3783, inlinedAt: !3778)
!3787 = !DILocation(line: 46, column: 29, scope: !3788, inlinedAt: !3778)
!3788 = distinct !DILexicalBlock(scope: !3783, file: !3399, line: 46, column: 5)
!3789 = !DILocation(line: 46, column: 22, scope: !3788, inlinedAt: !3778)
!3790 = !DILocation(line: 46, column: 5, scope: !3783, inlinedAt: !3778)
!3791 = !DILocation(line: 140, column: 9, scope: !3792, inlinedAt: !3402)
!3792 = distinct !DILexicalBlock(scope: !3771, file: !3399, line: 140, column: 9)
!3793 = !DILocation(line: 51, column: 26, scope: !3794, inlinedAt: !3778)
!3794 = distinct !DILexicalBlock(scope: !3788, file: !3399, line: 46, column: 42)
!3795 = !DILocation(line: 51, column: 21, scope: !3794, inlinedAt: !3778)
!3796 = !DILocation(line: 51, column: 31, scope: !3794, inlinedAt: !3778)
!3797 = !DILocation(line: 51, column: 9, scope: !3794, inlinedAt: !3778)
!3798 = !DILocation(line: 51, column: 18, scope: !3794, inlinedAt: !3778)
!3799 = !DILocation(line: 52, column: 26, scope: !3794, inlinedAt: !3778)
!3800 = !DILocation(line: 52, column: 21, scope: !3794, inlinedAt: !3778)
!3801 = !DILocation(line: 52, column: 30, scope: !3794, inlinedAt: !3778)
!3802 = !DILocation(line: 52, column: 14, scope: !3794, inlinedAt: !3778)
!3803 = !DILocation(line: 52, column: 9, scope: !3794, inlinedAt: !3778)
!3804 = !DILocation(line: 52, column: 18, scope: !3794, inlinedAt: !3778)
!3805 = !DILocation(line: 46, column: 37, scope: !3788, inlinedAt: !3778)
!3806 = !DILocation(line: 46, column: 5, scope: !3788, inlinedAt: !3778)
!3807 = distinct !{!3807, !3790, !3808, !298}
!3808 = !DILocation(line: 54, column: 5, scope: !3783, inlinedAt: !3778)
!3809 = !DILocation(line: 140, scope: !3792, inlinedAt: !3402)
!3810 = !DILocalVariable(name: "j", scope: !3792, file: !3399, line: 140, type: !86)
!3811 = !DILocation(line: 0, scope: !3792, inlinedAt: !3402)
!3812 = !DILocation(line: 140, column: 27, scope: !3813, inlinedAt: !3402)
!3813 = distinct !DILexicalBlock(scope: !3792, file: !3399, line: 140, column: 9)
!3814 = !DILocation(line: 141, column: 32, scope: !3815, inlinedAt: !3402)
!3815 = distinct !DILexicalBlock(scope: !3813, file: !3399, line: 140, column: 41)
!3816 = !DILocation(line: 141, column: 17, scope: !3815, inlinedAt: !3402)
!3817 = !DILocation(line: 141, column: 13, scope: !3815, inlinedAt: !3402)
!3818 = !DILocation(line: 141, column: 30, scope: !3815, inlinedAt: !3402)
!3819 = !DILocation(line: 140, column: 37, scope: !3813, inlinedAt: !3402)
!3820 = !DILocation(line: 140, column: 9, scope: !3813, inlinedAt: !3402)
!3821 = distinct !{!3821, !3791, !3822, !298}
!3822 = !DILocation(line: 142, column: 9, scope: !3792, inlinedAt: !3402)
!3823 = !DILocation(line: 138, column: 33, scope: !3769, inlinedAt: !3402)
!3824 = !DILocation(line: 138, column: 5, scope: !3769, inlinedAt: !3402)
!3825 = distinct !{!3825, !3480, !3826, !298}
!3826 = !DILocation(line: 143, column: 5, scope: !3481, inlinedAt: !3402)
!3827 = !DILocation(line: 145, column: 5, scope: !3398, inlinedAt: !3402)
!3828 = !DILocation(line: 146, column: 5, scope: !3398, inlinedAt: !3402)
!3829 = !DILocation(line: 147, column: 5, scope: !3398, inlinedAt: !3402)
!3830 = !DILocation(line: 148, column: 5, scope: !3398, inlinedAt: !3402)
!3831 = !DILocation(line: 149, column: 1, scope: !3398, inlinedAt: !3402)
!3832 = !DILocalVariable(name: "full_rank", scope: !3230, file: !99, line: 70, type: !51)
!3833 = !DILocalVariable(name: "i", scope: !3834, file: !99, line: 71, type: !86)
!3834 = distinct !DILexicalBlock(scope: !3230, file: !99, line: 71, column: 5)
!3835 = !DILocation(line: 0, scope: !3834)
!3836 = !DILocation(line: 71, column: 10, scope: !3834)
!3837 = !DILocation(line: 71, scope: !3834)
!3838 = !DILocation(line: 71, column: 23, scope: !3839)
!3839 = distinct !DILexicalBlock(scope: !3834, file: !99, line: 71, column: 5)
!3840 = !DILocation(line: 71, column: 5, scope: !3834)
!3841 = !DILocation(line: 72, column: 27, scope: !3842)
!3842 = distinct !DILexicalBlock(scope: !3839, file: !99, line: 71, column: 42)
!3843 = !DILocation(line: 72, column: 32, scope: !3842)
!3844 = !DILocation(line: 72, column: 22, scope: !3842)
!3845 = !DILocation(line: 72, column: 19, scope: !3842)
!3846 = !DILocation(line: 71, column: 38, scope: !3839)
!3847 = !DILocation(line: 71, column: 5, scope: !3839)
!3848 = distinct !{!3848, !3840, !3849, !298}
!3849 = !DILocation(line: 73, column: 5, scope: !3834)
!3850 = !DILocation(line: 80, column: 19, scope: !3851)
!3851 = distinct !DILexicalBlock(scope: !3230, file: !99, line: 80, column: 9)
!3852 = !DILocation(line: 88, column: 5, scope: !3853)
!3853 = distinct !DILexicalBlock(scope: !3230, file: !99, line: 88, column: 5)
!3854 = distinct !{!3854, !3852, !3855, !298}
!3855 = !DILocation(line: 122, column: 5, scope: !3853)
!3856 = !DILocation(line: 88, scope: !3853)
!3857 = !DILocalVariable(name: "row", scope: !3853, file: !99, line: 88, type: !86)
!3858 = !DILocation(line: 0, scope: !3853)
!3859 = !DILocation(line: 88, column: 31, scope: !3860)
!3860 = distinct !DILexicalBlock(scope: !3853, file: !99, line: 88, column: 5)
!3861 = !DILocalVariable(name: "finished", scope: !3230, file: !99, line: 46, type: !51)
!3862 = !DILocation(line: 90, column: 27, scope: !3863)
!3863 = distinct !DILexicalBlock(scope: !3860, file: !99, line: 88, column: 44)
!3864 = !DILocalVariable(name: "col_upper_bound", scope: !3230, file: !99, line: 47, type: !86)
!3865 = !DILocalVariable(name: "col", scope: !3866, file: !99, line: 93, type: !86)
!3866 = distinct !DILexicalBlock(scope: !3863, file: !99, line: 93, column: 9)
!3867 = !DILocation(line: 0, scope: !3866)
!3868 = !DILocation(line: 93, column: 14, scope: !3866)
!3869 = !DILocation(line: 0, scope: !3863)
!3870 = !DILocation(line: 93, scope: !3866)
!3871 = !DILocation(line: 93, column: 33, scope: !3872)
!3872 = distinct !DILexicalBlock(scope: !3866, file: !99, line: 93, column: 9)
!3873 = !DILocation(line: 93, column: 9, scope: !3866)
!3874 = !DILocation(line: 97, column: 50, scope: !3875)
!3875 = distinct !DILexicalBlock(scope: !3872, file: !99, line: 93, column: 60)
!3876 = !DILocation(line: 97, column: 44, scope: !3875)
!3877 = !DILocalVariable(name: "a", arg: 1, scope: !3878, file: !3516, line: 51, type: !51)
!3878 = distinct !DISubprogram(name: "ct_compare_8", scope: !3516, file: !3516, line: 51, type: !1540, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3879 = !DILocation(line: 0, scope: !3878, inlinedAt: !3880)
!3880 = distinct !DILocation(line: 97, column: 30, scope: !3875)
!3881 = !DILocalVariable(name: "b", arg: 2, scope: !3878, file: !3516, line: 51, type: !51)
!3882 = !DILocation(line: 52, column: 42, scope: !3878, inlinedAt: !3880)
!3883 = !DILocation(line: 52, column: 13, scope: !3878, inlinedAt: !3880)
!3884 = !DILocation(line: 52, column: 71, scope: !3878, inlinedAt: !3880)
!3885 = !DILocation(line: 52, column: 69, scope: !3878, inlinedAt: !3880)
!3886 = !DILocation(line: 97, column: 73, scope: !3875)
!3887 = !DILocalVariable(name: "correct_column", scope: !3230, file: !99, line: 48, type: !51)
!3888 = !DILocation(line: 99, column: 63, scope: !3875)
!3889 = !DILocation(line: 99, column: 48, scope: !3875)
!3890 = !DILocation(line: 99, column: 46, scope: !3875)
!3891 = !DILocalVariable(name: "u", scope: !3875, file: !99, line: 99, type: !51)
!3892 = !DILocation(line: 0, scope: !3875)
!3893 = !DILocation(line: 100, column: 13, scope: !3875)
!3894 = !DILocation(line: 100, column: 20, scope: !3875)
!3895 = !DILocalVariable(name: "i", scope: !3896, file: !99, line: 102, type: !86)
!3896 = distinct !DILexicalBlock(scope: !3875, file: !99, line: 102, column: 13)
!3897 = !DILocation(line: 0, scope: !3896)
!3898 = !DILocation(line: 102, column: 18, scope: !3896)
!3899 = !DILocation(line: 102, scope: !3896)
!3900 = !DILocation(line: 102, column: 31, scope: !3901)
!3901 = distinct !DILexicalBlock(scope: !3896, file: !99, line: 102, column: 13)
!3902 = !DILocation(line: 102, column: 13, scope: !3896)
!3903 = !DILocation(line: 103, column: 53, scope: !3904)
!3904 = distinct !DILexicalBlock(scope: !3901, file: !99, line: 102, column: 46)
!3905 = !DILocation(line: 103, column: 45, scope: !3904)
!3906 = !DILocation(line: 103, column: 34, scope: !3904)
!3907 = !DILocation(line: 103, column: 95, scope: !3904)
!3908 = !DILocation(line: 103, column: 99, scope: !3904)
!3909 = !DILocation(line: 103, column: 91, scope: !3904)
!3910 = !DILocation(line: 103, column: 80, scope: !3904)
!3911 = !DILocation(line: 103, column: 115, scope: !3904)
!3912 = !DILocation(line: 103, column: 76, scope: !3904)
!3913 = !DILocation(line: 104, column: 49, scope: !3904)
!3914 = !DILocation(line: 104, column: 53, scope: !3904)
!3915 = !DILocation(line: 104, column: 45, scope: !3904)
!3916 = !DILocation(line: 104, column: 34, scope: !3904)
!3917 = !DILocation(line: 104, column: 69, scope: !3904)
!3918 = !DILocation(line: 104, column: 30, scope: !3904)
!3919 = !DILocation(line: 104, column: 95, scope: !3904)
!3920 = !DILocation(line: 104, column: 99, scope: !3904)
!3921 = !DILocation(line: 104, column: 91, scope: !3904)
!3922 = !DILocation(line: 104, column: 80, scope: !3904)
!3923 = !DILocation(line: 104, column: 115, scope: !3904)
!3924 = !DILocation(line: 104, column: 76, scope: !3904)
!3925 = !DILocation(line: 105, column: 49, scope: !3904)
!3926 = !DILocation(line: 105, column: 53, scope: !3904)
!3927 = !DILocation(line: 105, column: 45, scope: !3904)
!3928 = !DILocation(line: 105, column: 34, scope: !3904)
!3929 = !DILocation(line: 105, column: 69, scope: !3904)
!3930 = !DILocation(line: 105, column: 30, scope: !3904)
!3931 = !DILocation(line: 105, column: 95, scope: !3904)
!3932 = !DILocation(line: 105, column: 99, scope: !3904)
!3933 = !DILocation(line: 105, column: 91, scope: !3904)
!3934 = !DILocation(line: 105, column: 80, scope: !3904)
!3935 = !DILocation(line: 105, column: 115, scope: !3904)
!3936 = !DILocation(line: 105, column: 76, scope: !3904)
!3937 = !DILocation(line: 106, column: 49, scope: !3904)
!3938 = !DILocation(line: 106, column: 53, scope: !3904)
!3939 = !DILocation(line: 106, column: 45, scope: !3904)
!3940 = !DILocation(line: 106, column: 34, scope: !3904)
!3941 = !DILocation(line: 106, column: 69, scope: !3904)
!3942 = !DILocation(line: 106, column: 30, scope: !3904)
!3943 = !DILocation(line: 106, column: 95, scope: !3904)
!3944 = !DILocation(line: 106, column: 99, scope: !3904)
!3945 = !DILocation(line: 106, column: 91, scope: !3904)
!3946 = !DILocation(line: 106, column: 80, scope: !3904)
!3947 = !DILocation(line: 106, column: 115, scope: !3904)
!3948 = !DILocation(line: 106, column: 76, scope: !3904)
!3949 = !DILocalVariable(name: "tmp", scope: !3904, file: !99, line: 103, type: !53)
!3950 = !DILocation(line: 0, scope: !3904)
!3951 = !DILocalVariable(name: "a", arg: 1, scope: !3952, file: !668, line: 27, type: !51)
!3952 = distinct !DISubprogram(name: "mul_fx8", scope: !668, file: !668, line: 27, type: !3953, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3953 = !DISubroutineType(types: !3954)
!3954 = !{!53, !51, !53}
!3955 = !DILocation(line: 0, scope: !3952, inlinedAt: !3956)
!3956 = distinct !DILocation(line: 108, column: 23, scope: !3904)
!3957 = !DILocalVariable(name: "b", arg: 2, scope: !3952, file: !668, line: 27, type: !53)
!3958 = !DILocation(line: 30, column: 13, scope: !3952, inlinedAt: !3956)
!3959 = !DILocation(line: 30, column: 10, scope: !3952, inlinedAt: !3956)
!3960 = !DILocation(line: 30, column: 17, scope: !3952, inlinedAt: !3956)
!3961 = !DILocalVariable(name: "p", scope: !3952, file: !668, line: 29, type: !53)
!3962 = !DILocation(line: 31, column: 13, scope: !3952, inlinedAt: !3956)
!3963 = !DILocation(line: 31, column: 10, scope: !3952, inlinedAt: !3956)
!3964 = !DILocation(line: 31, column: 17, scope: !3952, inlinedAt: !3956)
!3965 = !DILocation(line: 31, column: 7, scope: !3952, inlinedAt: !3956)
!3966 = !DILocation(line: 32, column: 13, scope: !3952, inlinedAt: !3956)
!3967 = !DILocation(line: 32, column: 10, scope: !3952, inlinedAt: !3956)
!3968 = !DILocation(line: 32, column: 17, scope: !3952, inlinedAt: !3956)
!3969 = !DILocation(line: 32, column: 7, scope: !3952, inlinedAt: !3956)
!3970 = !DILocation(line: 33, column: 13, scope: !3952, inlinedAt: !3956)
!3971 = !DILocation(line: 33, column: 10, scope: !3952, inlinedAt: !3956)
!3972 = !DILocation(line: 33, column: 17, scope: !3952, inlinedAt: !3956)
!3973 = !DILocation(line: 33, column: 7, scope: !3952, inlinedAt: !3956)
!3974 = !DILocalVariable(name: "top_p", scope: !3952, file: !668, line: 36, type: !53)
!3975 = !DILocation(line: 37, column: 32, scope: !3952, inlinedAt: !3956)
!3976 = !DILocation(line: 37, column: 47, scope: !3952, inlinedAt: !3956)
!3977 = !DILocation(line: 37, column: 38, scope: !3952, inlinedAt: !3956)
!3978 = !DILocalVariable(name: "out", scope: !3952, file: !668, line: 37, type: !53)
!3979 = !DILocation(line: 110, column: 34, scope: !3904)
!3980 = !DILocation(line: 110, column: 17, scope: !3904)
!3981 = !DILocation(line: 110, column: 48, scope: !3904)
!3982 = !DILocation(line: 111, column: 56, scope: !3904)
!3983 = !DILocation(line: 111, column: 34, scope: !3904)
!3984 = !DILocation(line: 111, column: 17, scope: !3904)
!3985 = !DILocation(line: 111, column: 48, scope: !3904)
!3986 = !DILocation(line: 112, column: 56, scope: !3904)
!3987 = !DILocation(line: 112, column: 34, scope: !3904)
!3988 = !DILocation(line: 112, column: 17, scope: !3904)
!3989 = !DILocation(line: 112, column: 48, scope: !3904)
!3990 = !DILocation(line: 113, column: 56, scope: !3904)
!3991 = !DILocation(line: 113, column: 34, scope: !3904)
!3992 = !DILocation(line: 113, column: 17, scope: !3904)
!3993 = !DILocation(line: 113, column: 48, scope: !3904)
!3994 = !DILocation(line: 114, column: 56, scope: !3904)
!3995 = !DILocation(line: 114, column: 34, scope: !3904)
!3996 = !DILocation(line: 114, column: 17, scope: !3904)
!3997 = !DILocation(line: 114, column: 48, scope: !3904)
!3998 = !DILocation(line: 115, column: 56, scope: !3904)
!3999 = !DILocation(line: 115, column: 34, scope: !3904)
!4000 = !DILocation(line: 115, column: 17, scope: !3904)
!4001 = !DILocation(line: 115, column: 48, scope: !3904)
!4002 = !DILocation(line: 116, column: 56, scope: !3904)
!4003 = !DILocation(line: 116, column: 34, scope: !3904)
!4004 = !DILocation(line: 116, column: 17, scope: !3904)
!4005 = !DILocation(line: 116, column: 48, scope: !3904)
!4006 = !DILocation(line: 117, column: 56, scope: !3904)
!4007 = !DILocation(line: 117, column: 34, scope: !3904)
!4008 = !DILocation(line: 117, column: 17, scope: !3904)
!4009 = !DILocation(line: 117, column: 48, scope: !3904)
!4010 = !DILocation(line: 102, column: 40, scope: !3901)
!4011 = !DILocation(line: 102, column: 13, scope: !3901)
!4012 = distinct !{!4012, !3902, !4013, !298}
!4013 = !DILocation(line: 118, column: 13, scope: !3896)
!4014 = !DILocation(line: 120, column: 33, scope: !3875)
!4015 = !DILocation(line: 93, column: 56, scope: !3872)
!4016 = !DILocation(line: 93, column: 9, scope: !3872)
!4017 = distinct !{!4017, !3873, !4018, !298}
!4018 = !DILocation(line: 121, column: 9, scope: !3866)
!4019 = !DILocation(line: 124, column: 1, scope: !3230)
!4020 = distinct !DISubprogram(name: "vec_mul_add_u64", scope: !3516, file: !3516, line: 94, type: !4021, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!4021 = !DISubroutineType(types: !4022)
!4022 = !{null, !275, !486, !51, !52}
!4023 = !DILocalVariable(name: "legs", arg: 1, scope: !4020, file: !3516, line: 94, type: !275)
!4024 = !DILocation(line: 0, scope: !4020)
!4025 = !DILocalVariable(name: "in", arg: 2, scope: !4020, file: !3516, line: 94, type: !486)
!4026 = !DILocalVariable(name: "a", arg: 3, scope: !4020, file: !3516, line: 94, type: !51)
!4027 = !DILocalVariable(name: "acc", arg: 4, scope: !4020, file: !3516, line: 94, type: !52)
!4028 = !DILocalVariable(name: "b", arg: 1, scope: !4029, file: !668, line: 128, type: !174)
!4029 = distinct !DISubprogram(name: "mul_table", scope: !668, file: !668, line: 128, type: !669, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!4030 = !DILocation(line: 0, scope: !4029, inlinedAt: !4031)
!4031 = distinct !DILocation(line: 95, column: 20, scope: !4020)
!4032 = !DILocation(line: 129, column: 19, scope: !4029, inlinedAt: !4031)
!4033 = !DILocation(line: 129, column: 33, scope: !4029, inlinedAt: !4031)
!4034 = !DILocalVariable(name: "x", scope: !4029, file: !668, line: 129, type: !62)
!4035 = !DILocalVariable(name: "high_nibble_mask", scope: !4029, file: !668, line: 131, type: !62)
!4036 = !DILocation(line: 133, column: 28, scope: !4029, inlinedAt: !4031)
!4037 = !DILocalVariable(name: "high_half", scope: !4029, file: !668, line: 133, type: !62)
!4038 = !DILocation(line: 134, column: 28, scope: !4029, inlinedAt: !4031)
!4039 = !DILocation(line: 134, column: 47, scope: !4029, inlinedAt: !4031)
!4040 = !DILocation(line: 134, column: 34, scope: !4029, inlinedAt: !4031)
!4041 = !DILocalVariable(name: "tab", scope: !4020, file: !3516, line: 95, type: !62)
!4042 = !DILocalVariable(name: "lsb_ask", scope: !4020, file: !3516, line: 97, type: !53)
!4043 = !DILocalVariable(name: "i", scope: !4044, file: !3516, line: 99, type: !86)
!4044 = distinct !DILexicalBlock(scope: !4020, file: !3516, line: 99, column: 5)
!4045 = !DILocation(line: 0, scope: !4044)
!4046 = !DILocation(line: 99, column: 9, scope: !4044)
!4047 = !DILocation(line: 99, scope: !4044)
!4048 = !DILocation(line: 99, column: 20, scope: !4049)
!4049 = distinct !DILexicalBlock(scope: !4044, file: !3516, line: 99, column: 5)
!4050 = !DILocation(line: 99, column: 5, scope: !4044)
!4051 = !DILocation(line: 100, column: 21, scope: !4052)
!4052 = distinct !DILexicalBlock(scope: !4049, file: !3516, line: 99, column: 32)
!4053 = !DILocation(line: 100, column: 33, scope: !4052)
!4054 = !DILocation(line: 100, column: 51, scope: !4052)
!4055 = !DILocation(line: 100, column: 46, scope: !4052)
!4056 = !DILocation(line: 100, column: 44, scope: !4052)
!4057 = !DILocation(line: 101, column: 27, scope: !4052)
!4058 = !DILocation(line: 101, column: 33, scope: !4052)
!4059 = !DILocation(line: 101, column: 52, scope: !4052)
!4060 = !DILocation(line: 101, column: 59, scope: !4052)
!4061 = !DILocation(line: 101, column: 46, scope: !4052)
!4062 = !DILocation(line: 101, column: 44, scope: !4052)
!4063 = !DILocation(line: 101, column: 17, scope: !4052)
!4064 = !DILocation(line: 102, column: 21, scope: !4052)
!4065 = !DILocation(line: 102, column: 27, scope: !4052)
!4066 = !DILocation(line: 102, column: 33, scope: !4052)
!4067 = !DILocation(line: 102, column: 52, scope: !4052)
!4068 = !DILocation(line: 102, column: 59, scope: !4052)
!4069 = !DILocation(line: 102, column: 46, scope: !4052)
!4070 = !DILocation(line: 102, column: 44, scope: !4052)
!4071 = !DILocation(line: 102, column: 17, scope: !4052)
!4072 = !DILocation(line: 103, column: 21, scope: !4052)
!4073 = !DILocation(line: 103, column: 27, scope: !4052)
!4074 = !DILocation(line: 103, column: 33, scope: !4052)
!4075 = !DILocation(line: 103, column: 52, scope: !4052)
!4076 = !DILocation(line: 103, column: 59, scope: !4052)
!4077 = !DILocation(line: 103, column: 46, scope: !4052)
!4078 = !DILocation(line: 103, column: 44, scope: !4052)
!4079 = !DILocation(line: 103, column: 17, scope: !4052)
!4080 = !DILocation(line: 100, column: 9, scope: !4052)
!4081 = !DILocation(line: 100, column: 16, scope: !4052)
!4082 = !DILocation(line: 99, column: 29, scope: !4049)
!4083 = !DILocation(line: 99, column: 5, scope: !4049)
!4084 = distinct !{!4084, !4050, !4085, !298}
!4085 = !DILocation(line: 104, column: 5, scope: !4044)
!4086 = !DILocation(line: 105, column: 1, scope: !4020)
