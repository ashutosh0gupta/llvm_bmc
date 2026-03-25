; ModuleID = 'composite'
source_filename = "composite"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "arm-unknown-none-eabi"

%struct.sk_t = type { [12672 x i64], [1088 x i8] }

@__const.example_mayo.msg = private unnamed_addr constant <{ i8, [31 x i8] }> <{ i8 14, [31 x i8] zeroinitializer }>, align 1
@.str = private unnamed_addr constant [17 x i8] c"Example with %s\0A\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [7 x i8] c"MAYO_2\00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [17 x i8] c"mayo_keypair -> \00", align 1, !dbg !12
@.str.3 = private unnamed_addr constant [6 x i8] c"FAIL\0A\00", align 1, !dbg !14
@.str.4 = private unnamed_addr constant [4 x i8] c"OK\0A\00", align 1, !dbg !19
@.str.5 = private unnamed_addr constant [19 x i8] c"mayo_expand_sk -> \00", align 1, !dbg !24
@.str.6 = private unnamed_addr constant [19 x i8] c"mayo_expand_pk -> \00", align 1, !dbg !29
@.str.7 = private unnamed_addr constant [14 x i8] c"mayo_sign -> \00", align 1, !dbg !31
@.str.8 = private unnamed_addr constant [39 x i8] c"mayo_open (with correct signature) -> \00", align 1, !dbg !36
@.str.9 = private unnamed_addr constant [41 x i8] c"mayo_verify (with correct signature) -> \00", align 1, !dbg !41
@f_tail = internal unnamed_addr constant [4 x i8] c"\08\00\02\08", align 1, !dbg !46
@pqmayo_MAYO_2_ref_uint32_t_blocker = dso_local local_unnamed_addr global i32 0, align 4, !dbg !82
@pqmayo_MAYO_2_ref_uint64_t_blocker = dso_local global i64 0, align 8, !dbg !97
@pqmayo_MAYO_2_ref_unsigned_char_blocker = dso_local global i8 0, align 1, !dbg !101

; Function Attrs: nounwind
define dso_local range(i32 -1, 1) i32 @main() local_unnamed_addr #0 !dbg !113 {
entry:
  %tmp.i6.i = alloca [4 x i64], align 8
  %tmp.i.i = alloca [4 x i64], align 8
  %smlen.i = alloca i32, align 4
  %msg.i = alloca [32 x i8], align 1
  %msg2.i = alloca [32 x i8], align 1
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %smlen.i), !dbg !116
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %msg.i), !dbg !116
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %msg2.i), !dbg !116
    #dbg_value(ptr null, !151, !DIExpression(), !152)
    #dbg_value(i32 32, !153, !DIExpression(), !152)
    #dbg_value(i32 32, !153, !DIExpression(), !152)
    #dbg_value(i32 218, !154, !DIExpression(), !152)
  store i32 218, ptr %smlen.i, align 4, !dbg !155
  %call.i = call dereferenceable_or_null(4912) ptr @calloc(i32 noundef 4912, i32 noundef 1) #7, !dbg !156
    #dbg_value(ptr %call.i, !157, !DIExpression(), !152)
  %call1.i = call dereferenceable_or_null(24) ptr @calloc(i32 noundef 24, i32 noundef 1) #7, !dbg !158
    #dbg_value(ptr %call1.i, !159, !DIExpression(), !152)
  %call2.i = call dereferenceable_or_null(106272) ptr @calloc(i32 noundef 1, i32 noundef 106272) #7, !dbg !160
    #dbg_value(ptr %call2.i, !161, !DIExpression(), !152)
  %call3.i = call dereferenceable_or_null(102464) ptr @calloc(i32 noundef 1, i32 noundef 102464) #7, !dbg !162
    #dbg_value(ptr %call3.i, !163, !DIExpression(), !152)
    #dbg_value(i32 32, !153, !DIExpression(), !152)
  %call5.i = call dereferenceable_or_null(218) ptr @calloc(i32 noundef 218, i32 noundef 1) #7, !dbg !178
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
  %call.i.i = call i32 @pqmayo_MAYO_2_ref_mayo_keypair_compact(ptr noundef null, ptr noundef %call.i, ptr noundef %call1.i) #9, !dbg !226
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
  %call12.i = call i32 @pqmayo_MAYO_2_ref_mayo_expand_sk(ptr noundef null, ptr noundef %call1.i, ptr noundef %call3.i) #9, !dbg !238
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
  %call.i.i.i = call i32 @AES_128_CTR(ptr noundef %call2.i, i32 noundef 101376, ptr noundef %call.i, i32 noundef 16) #8, !dbg !263
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %tmp.i.i), !dbg !264
    #dbg_value(ptr %call2.i, !269, !DIExpression(), !270)
    #dbg_value(ptr %call2.i, !271, !DIExpression(), !270)
    #dbg_value(i32 3168, !272, !DIExpression(), !270)
    #dbg_value(i32 64, !273, !DIExpression(), !270)
    #dbg_value(i32 4, !274, !DIExpression(), !270)
    #dbg_value(ptr %call2.i, !276, !DIExpression(), !270)
    #dbg_declare(ptr %tmp.i.i, !277, !DIExpression(), !264)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(32) %tmp.i.i, i8 0, i32 32, i1 false), !dbg !264
    #dbg_value(i32 3168, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !281)
  br label %for.cond.i.i, !dbg !282

for.cond.i.i:                                     ; preds = %for.body.i.i, %if.else16.i
  %i.0.in.i.i = phi i32 [ 3168, %if.else16.i ], [ %i.0.i.i, %for.body.i.i ]
    #dbg_value(i32 %i.0.in.i.i, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !281)
  %cmp.i3.i = icmp ugt i32 %i.0.in.i.i, 0, !dbg !283
  br i1 %cmp.i3.i, label %for.body.i.i, label %unpack_m_vecs.exit.i, !dbg !285

for.body.i.i:                                     ; preds = %for.cond.i.i
  %i.0.i.i = add nsw i32 %i.0.in.i.i, -1, !dbg !286
    #dbg_value(i32 %i.0.i.i, !279, !DIExpression(), !281)
  %0 = shl i32 %i.0.i.i, 5, !dbg !287
  %div1.i.i14 = and i32 %0, 2147483616, !dbg !287
  %add.ptr.i4.i = getelementptr inbounds nuw i8, ptr %call2.i, i32 %div1.i.i14, !dbg !289
  %call.i5.i = call ptr @memcpy(ptr noundef nonnull %tmp.i.i, ptr noundef %add.ptr.i4.i, i32 noundef 32) #8, !dbg !290
  %mul3.i.i = shl i32 %i.0.i.i, 5, !dbg !291
  %add.ptr5.i.i = getelementptr inbounds nuw i8, ptr %call2.i, i32 %mul3.i.i, !dbg !292
  %call8.i.i = call ptr @memcpy(ptr noundef %add.ptr5.i.i, ptr noundef nonnull %tmp.i.i, i32 noundef 32) #8, !dbg !293
    #dbg_value(i32 %i.0.i.i, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !281)
  br label %for.cond.i.i, !dbg !294, !llvm.loop !295

unpack_m_vecs.exit.i:                             ; preds = %for.cond.i.i
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %tmp.i.i), !dbg !298
  %add.ptr.i.i = getelementptr inbounds nuw i8, ptr %call.i, i32 16, !dbg !299
  %add.ptr2.i.i = getelementptr inbounds nuw i8, ptr %call2.i, i32 101376, !dbg !300
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %tmp.i6.i), !dbg !301
    #dbg_value(ptr %add.ptr.i.i, !269, !DIExpression(), !303)
    #dbg_value(ptr %add.ptr2.i.i, !271, !DIExpression(), !303)
    #dbg_value(i32 153, !272, !DIExpression(), !303)
    #dbg_value(i32 64, !273, !DIExpression(), !303)
    #dbg_value(i32 4, !274, !DIExpression(), !303)
    #dbg_value(ptr %add.ptr2.i.i, !276, !DIExpression(), !303)
    #dbg_declare(ptr %tmp.i6.i, !277, !DIExpression(), !301)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(32) %tmp.i6.i, i8 0, i32 32, i1 false), !dbg !301
    #dbg_value(i32 153, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !304)
  br label %for.cond.i7.i, !dbg !305

for.cond.i7.i:                                    ; preds = %for.body.i11.i, %unpack_m_vecs.exit.i
  %i.0.in.i8.i = phi i32 [ 153, %unpack_m_vecs.exit.i ], [ %i.0.i9.i, %for.body.i11.i ]
    #dbg_value(i32 %i.0.in.i8.i, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !304)
  %cmp.i10.i = icmp ugt i32 %i.0.in.i8.i, 0, !dbg !306
  br i1 %cmp.i10.i, label %for.body.i11.i, label %unpack_m_vecs.exit20.i, !dbg !307

for.body.i11.i:                                   ; preds = %for.cond.i7.i
  %i.0.i9.i = add nsw i32 %i.0.in.i8.i, -1, !dbg !308
    #dbg_value(i32 %i.0.i9.i, !279, !DIExpression(), !304)
  %1 = shl i32 %i.0.i9.i, 5, !dbg !309
  %div1.i13.i23 = and i32 %1, 2147483616, !dbg !309
  %add.ptr.i14.i = getelementptr inbounds nuw i8, ptr %add.ptr.i.i, i32 %div1.i13.i23, !dbg !310
  %call.i15.i = call ptr @memcpy(ptr noundef nonnull %tmp.i6.i, ptr noundef nonnull %add.ptr.i14.i, i32 noundef 32) #8, !dbg !311
  %mul3.i16.i = shl i32 %i.0.i9.i, 5, !dbg !312
  %add.ptr5.i18.i = getelementptr inbounds nuw i8, ptr %add.ptr2.i.i, i32 %mul3.i16.i, !dbg !313
  %call8.i19.i = call ptr @memcpy(ptr noundef nonnull %add.ptr5.i18.i, ptr noundef nonnull %tmp.i6.i, i32 noundef 32) #8, !dbg !314
    #dbg_value(i32 %i.0.i9.i, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !304)
  br label %for.cond.i7.i, !dbg !315, !llvm.loop !316

unpack_m_vecs.exit20.i:                           ; preds = %for.cond.i7.i
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %tmp.i6.i), !dbg !318
    #dbg_value(i32 0, !229, !DIExpression(), !152)
  %call25.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.4) #8, !dbg !319
  %call27.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.7) #8, !dbg !322
    #dbg_value(i32 32, !153, !DIExpression(), !152)
    #dbg_value(ptr %smlen.i, !154, !DIExpression(DW_OP_deref), !152)
  %call28.i = call i32 @pqmayo_MAYO_2_ref_mayo_sign(ptr noundef null, ptr noundef %call5.i, ptr noundef nonnull %smlen.i, ptr noundef nonnull %msg.i, i32 noundef 32, ptr noundef %call1.i) #9, !dbg !323
    #dbg_value(i32 %call28.i, !229, !DIExpression(), !152)
  %cmp29.not.i = icmp eq i32 %call28.i, 0, !dbg !324
  br i1 %cmp29.not.i, label %if.else32.i, label %if.then30.i, !dbg !324

if.then30.i:                                      ; preds = %unpack_m_vecs.exit20.i
  %call31.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.3) #8, !dbg !326
    #dbg_value(i32 -1, !229, !DIExpression(), !152)
  br label %example_mayo.exit, !dbg !328

if.else32.i:                                      ; preds = %unpack_m_vecs.exit20.i
  %call33.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.4) #8, !dbg !329
  %call35.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.8) #8, !dbg !331
  %2 = load i32, ptr %smlen.i, align 4, !dbg !332
    #dbg_value(i32 %2, !154, !DIExpression(), !152)
    #dbg_value(ptr null, !333, !DIExpression(), !338)
    #dbg_value(ptr %msg2.i, !340, !DIExpression(), !338)
    #dbg_value(ptr undef, !341, !DIExpression(), !338)
    #dbg_value(ptr %call5.i, !342, !DIExpression(), !338)
    #dbg_value(i32 %2, !343, !DIExpression(), !338)
    #dbg_value(ptr %call.i, !344, !DIExpression(), !338)
    #dbg_value(i32 186, !345, !DIExpression(), !338)
  %cmp.i.i = icmp ult i32 %2, 186, !dbg !346
  br i1 %cmp.i.i, label %pqmayo_MAYO_2_ref_mayo_open.exit.i, label %if.end.i.i, !dbg !346

if.end.i.i:                                       ; preds = %if.else32.i
  %add.ptr.i1.i = getelementptr inbounds nuw i8, ptr %call5.i, i32 186, !dbg !348
  %sub.i.i = add i32 %2, -186, !dbg !349
  %call.i2.i = call i32 @pqmayo_MAYO_2_ref_mayo_verify(ptr noundef null, ptr noundef nonnull %add.ptr.i1.i, i32 noundef %sub.i.i, ptr noundef %call5.i, ptr noundef %call.i) #9, !dbg !350
    #dbg_value(i32 %call.i2.i, !351, !DIExpression(), !338)
  %cmp1.i.i = icmp eq i32 %call.i2.i, 0, !dbg !352
  br i1 %cmp1.i.i, label %if.then2.i.i, label %pqmayo_MAYO_2_ref_mayo_open.exit.i, !dbg !352

if.then2.i.i:                                     ; preds = %if.end.i.i
  %sub3.i.i = add i32 %2, -186, !dbg !354
  %add.ptr4.i.i = getelementptr inbounds nuw i8, ptr %call5.i, i32 186, !dbg !356
  %call5.i.i = call ptr @memmove(ptr noundef nonnull %msg2.i, ptr noundef nonnull %add.ptr4.i.i, i32 noundef %sub3.i.i) #8, !dbg !357
  br label %pqmayo_MAYO_2_ref_mayo_open.exit.i, !dbg !358

pqmayo_MAYO_2_ref_mayo_open.exit.i:               ; preds = %if.then2.i.i, %if.end.i.i, %if.else32.i
  %msglen.i.0 = phi i32 [ 32, %if.else32.i ], [ %sub3.i.i, %if.then2.i.i ], [ 32, %if.end.i.i ], !dbg !152
  %cmp38.not.i = phi i1 [ false, %if.else32.i ], [ true, %if.then2.i.i ], [ false, %if.end.i.i ], !dbg !338
    #dbg_value(i32 poison, !229, !DIExpression(), !152)
  br i1 %cmp38.not.i, label %lor.lhs.false.i, label %if.then42.i, !dbg !359

lor.lhs.false.i:                                  ; preds = %pqmayo_MAYO_2_ref_mayo_open.exit.i
    #dbg_value(i32 %msglen.i.0, !153, !DIExpression(), !152)
  %call41.i = call i32 @memcmp(ptr noundef nonnull %msg.i, ptr noundef nonnull %msg2.i, i32 noundef %msglen.i.0) #8, !dbg !361
  %tobool.not.i = icmp eq i32 %call41.i, 0, !dbg !361
  br i1 %tobool.not.i, label %if.else44.i, label %if.then42.i, !dbg !359

if.then42.i:                                      ; preds = %lor.lhs.false.i, %pqmayo_MAYO_2_ref_mayo_open.exit.i
  %call43.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.3) #8, !dbg !362
    #dbg_value(i32 -1, !229, !DIExpression(), !152)
  br label %example_mayo.exit, !dbg !364

if.else44.i:                                      ; preds = %lor.lhs.false.i
    #dbg_value(i32 0, !229, !DIExpression(), !152)
  %call45.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.4) #8, !dbg !365
  %call47.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.9) #8, !dbg !367
    #dbg_value(i32 %msglen.i.0, !153, !DIExpression(), !152)
  %call49.i = call i32 @pqmayo_MAYO_2_ref_mayo_verify(ptr noundef null, ptr noundef nonnull %msg.i, i32 noundef %msglen.i.0, ptr noundef %call5.i, ptr noundef %call.i) #9, !dbg !368
    #dbg_value(i32 %call49.i, !229, !DIExpression(), !152)
  %cmp50.not.i = icmp eq i32 %call49.i, 0, !dbg !369
  br i1 %cmp50.not.i, label %if.else53.i, label %if.then51.i, !dbg !369

if.then51.i:                                      ; preds = %if.else44.i
  %call52.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.3) #8, !dbg !371
    #dbg_value(i32 -1, !229, !DIExpression(), !152)
  br label %example_mayo.exit, !dbg !373

if.else53.i:                                      ; preds = %if.else44.i
    #dbg_value(i32 0, !229, !DIExpression(), !152)
  %call54.i = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.4) #8, !dbg !374
  br label %example_mayo.exit, !dbg !376

example_mayo.exit:                                ; preds = %if.then.i, %if.then14.i, %if.then30.i, %if.then42.i, %if.then51.i, %if.else53.i
  %res.0.i = phi i32 [ -1, %if.then.i ], [ -1, %if.then14.i ], [ -1, %if.then30.i ], [ -1, %if.then42.i ], [ -1, %if.then51.i ], [ 0, %if.else53.i ], !dbg !152
    #dbg_value(i32 %res.0.i, !229, !DIExpression(), !152)
    #dbg_label(!377, !378)
  call void @free(ptr noundef %call.i) #8, !dbg !379
  call void @free(ptr noundef %call2.i) #8, !dbg !380
  call void @mayo_secure_free(ptr noundef %call1.i, i32 noundef 24) #8, !dbg !381
  call void @mayo_secure_free(ptr noundef %call3.i, i32 noundef 102464) #8, !dbg !382
  call void @free(ptr noundef %call5.i) #8, !dbg !383
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %smlen.i), !dbg !384
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %msg.i), !dbg !384
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %msg2.i), !dbg !384
  ret i32 %res.0.i, !dbg !385
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
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_2_ref_mayo_keypair(ptr noundef %p, ptr noundef %pk, ptr noundef %sk) local_unnamed_addr #0 !dbg !190 {
entry:
    #dbg_value(ptr %p, !189, !DIExpression(), !386)
    #dbg_value(ptr %pk, !223, !DIExpression(), !386)
    #dbg_value(ptr %sk, !224, !DIExpression(), !386)
    #dbg_value(i32 0, !225, !DIExpression(), !386)
  %call = call i32 @pqmayo_MAYO_2_ref_mayo_keypair_compact(ptr noundef %p, ptr noundef %pk, ptr noundef %sk) #9, !dbg !387
    #dbg_value(i32 %call, !225, !DIExpression(), !386)
    #dbg_label(!227, !388)
  ret i32 %call, !dbg !389
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_2_ref_mayo_keypair_compact(ptr noundef %p, ptr noundef %cpk, ptr noundef %csk) local_unnamed_addr #0 !dbg !390 {
entry:
  %tmp.i = alloca [4 x i64], align 8
  %S = alloca [560 x i8], align 1
  %P = alloca [12672 x i64], align 8
  %P3 = alloca [1156 x i64], align 8
  %O = alloca [1088 x i8], align 1
  %P3_upper = alloca [612 x i64], align 8
    #dbg_value(ptr %p, !391, !DIExpression(), !392)
    #dbg_value(ptr %cpk, !393, !DIExpression(), !392)
    #dbg_value(ptr %csk, !394, !DIExpression(), !392)
    #dbg_value(i32 0, !395, !DIExpression(), !392)
    #dbg_value(ptr %csk, !396, !DIExpression(), !392)
    #dbg_declare(ptr %S, !397, !DIExpression(), !401)
    #dbg_declare(ptr %P, !402, !DIExpression(), !403)
    #dbg_declare(ptr %P3, !404, !DIExpression(), !408)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(9248) %P3, i8 0, i32 9248, i1 false), !dbg !408
    #dbg_declare(ptr %O, !409, !DIExpression(), !411)
    #dbg_value(i32 4, !412, !DIExpression(), !392)
    #dbg_value(i32 64, !413, !DIExpression(), !392)
    #dbg_value(i32 64, !414, !DIExpression(), !392)
    #dbg_value(i32 17, !415, !DIExpression(), !392)
    #dbg_value(i32 544, !416, !DIExpression(), !392)
    #dbg_value(i32 8320, !417, !DIExpression(), !392)
    #dbg_value(i32 612, !418, !DIExpression(), !392)
    #dbg_value(i32 16, !419, !DIExpression(), !392)
    #dbg_value(i32 24, !420, !DIExpression(), !392)
    #dbg_value(ptr %P, !421, !DIExpression(), !392)
  %add.ptr = getelementptr inbounds nuw i8, ptr %P, i32 66560, !dbg !422
    #dbg_value(ptr %add.ptr, !423, !DIExpression(), !392)
  %call = call i32 @randombytes(ptr noundef %csk, i32 noundef 24) #8, !dbg !424
  %cmp.not = icmp eq i32 %call, 0, !dbg !426
  br i1 %cmp.not, label %if.end, label %err, !dbg !426

if.end:                                           ; preds = %entry
    #dbg_value(ptr %P, !421, !DIExpression(), !392)
  %call3 = call i32 @shake256(ptr noundef nonnull %S, i32 noundef 560, ptr noundef %csk, i32 noundef 24) #8, !dbg !427
    #dbg_value(ptr %S, !428, !DIExpression(), !392)
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %S, i32 16, !dbg !429
    #dbg_value(ptr %add.ptr6, !430, !DIExpression(), !434)
    #dbg_value(ptr %O, !436, !DIExpression(), !434)
    #dbg_value(i32 1088, !437, !DIExpression(), !434)
    #dbg_value(i32 0, !438, !DIExpression(), !434)
  br label %for.cond.i11, !dbg !439

for.cond.i11:                                     ; preds = %for.body.i14, %if.end
  %mdec.addr.0.i = phi ptr [ %O, %if.end ], [ %incdec.ptr5.i, %for.body.i14 ]
  %i.0.i12 = phi i32 [ 0, %if.end ], [ %inc.i15, %for.body.i14 ], !dbg !441
    #dbg_value(i32 %i.0.i12, !438, !DIExpression(), !434)
    #dbg_value(ptr %mdec.addr.0.i, !436, !DIExpression(), !434)
  %exitcond = icmp ne i32 %i.0.i12, 544, !dbg !442
  br i1 %exitcond, label %for.body.i14, label %decode.exit, !dbg !444

for.body.i14:                                     ; preds = %for.cond.i11
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %add.ptr6, i32 %i.0.i12, !dbg !445
  %0 = load i8, ptr %arrayidx.i, align 1, !dbg !445
  %1 = and i8 %0, 15, !dbg !447
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i, i32 1, !dbg !448
    #dbg_value(ptr %incdec.ptr.i, !436, !DIExpression(), !434)
  store i8 %1, ptr %mdec.addr.0.i, align 1, !dbg !449
  %2 = lshr i8 %0, 4, !dbg !450
    #dbg_value(ptr %incdec.ptr.i, !436, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !434)
  store i8 %2, ptr %incdec.ptr.i, align 1, !dbg !451
  %incdec.ptr5.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i, i32 2, !dbg !452
    #dbg_value(ptr %incdec.ptr5.i, !436, !DIExpression(), !434)
  %inc.i15 = add nuw nsw i32 %i.0.i12, 1, !dbg !453
    #dbg_value(i32 %inc.i15, !438, !DIExpression(), !434)
  br label %for.cond.i11, !dbg !454, !llvm.loop !455

decode.exit:                                      ; preds = %for.cond.i11
    #dbg_value(ptr %p, !255, !DIExpression(), !457)
    #dbg_value(ptr %P, !261, !DIExpression(), !457)
    #dbg_value(ptr %S, !262, !DIExpression(), !457)
  %call.i = call i32 @AES_128_CTR(ptr noundef nonnull %P, i32 noundef 101376, ptr noundef nonnull %S, i32 noundef 16) #8, !dbg !459
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %tmp.i), !dbg !460
    #dbg_value(ptr %P, !269, !DIExpression(), !462)
    #dbg_value(ptr %P, !271, !DIExpression(), !462)
    #dbg_value(i32 3168, !272, !DIExpression(), !462)
    #dbg_value(i32 64, !273, !DIExpression(), !462)
    #dbg_value(i32 4, !274, !DIExpression(), !462)
    #dbg_value(ptr %P, !276, !DIExpression(), !462)
    #dbg_declare(ptr %tmp.i, !277, !DIExpression(), !460)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(32) %tmp.i, i8 0, i32 32, i1 false), !dbg !460
    #dbg_value(i32 3168, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !463)
  br label %for.cond.i2, !dbg !464

for.cond.i2:                                      ; preds = %for.body.i5, %decode.exit
  %i.0.in.i = phi i32 [ 3168, %decode.exit ], [ %i.0.i3, %for.body.i5 ]
    #dbg_value(i32 %i.0.in.i, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !463)
  %cmp.i4 = icmp ugt i32 %i.0.in.i, 0, !dbg !465
  br i1 %cmp.i4, label %for.body.i5, label %unpack_m_vecs.exit, !dbg !466

for.body.i5:                                      ; preds = %for.cond.i2
  %i.0.i3 = add nsw i32 %i.0.in.i, -1, !dbg !467
    #dbg_value(i32 %i.0.i3, !279, !DIExpression(), !463)
  %3 = shl i32 %i.0.i3, 5, !dbg !468
  %div1.i74344 = and i32 %3, 2147483616, !dbg !468
  %add.ptr.i8 = getelementptr inbounds nuw i8, ptr %P, i32 %div1.i74344, !dbg !469
  %call.i9 = call ptr @memcpy(ptr noundef nonnull %tmp.i, ptr noundef nonnull %add.ptr.i8, i32 noundef 32) #8, !dbg !470
  %mul3.i10 = shl i32 %i.0.i3, 5, !dbg !471
  %add.ptr5.i = getelementptr inbounds nuw i8, ptr %P, i32 %mul3.i10, !dbg !472
  %call8.i = call ptr @memcpy(ptr noundef nonnull %add.ptr5.i, ptr noundef nonnull %tmp.i, i32 noundef 32) #8, !dbg !473
    #dbg_value(i32 %i.0.i3, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !463)
  br label %for.cond.i2, !dbg !474, !llvm.loop !475

unpack_m_vecs.exit:                               ; preds = %for.cond.i2
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %tmp.i), !dbg !477
    #dbg_value(ptr %p, !478, !DIExpression(), !484)
    #dbg_value(ptr %P, !486, !DIExpression(), !484)
    #dbg_value(ptr %add.ptr, !487, !DIExpression(), !484)
    #dbg_value(ptr %O, !488, !DIExpression(), !484)
    #dbg_value(ptr %P3, !489, !DIExpression(), !484)
    #dbg_value(i32 4, !490, !DIExpression(), !484)
    #dbg_value(i32 64, !491, !DIExpression(), !484)
    #dbg_value(i32 17, !492, !DIExpression(), !484)
    #dbg_value(ptr %p, !493, !DIExpression(), !497)
    #dbg_value(ptr %P, !499, !DIExpression(), !497)
    #dbg_value(ptr %O, !500, !DIExpression(), !497)
    #dbg_value(ptr %add.ptr, !501, !DIExpression(), !497)
    #dbg_value(i32 4, !502, !DIExpression(), !506)
    #dbg_value(ptr %P, !508, !DIExpression(), !506)
    #dbg_value(ptr %O, !509, !DIExpression(), !506)
    #dbg_value(ptr %add.ptr, !510, !DIExpression(), !506)
    #dbg_value(i32 64, !511, !DIExpression(), !506)
    #dbg_value(i32 64, !512, !DIExpression(), !506)
    #dbg_value(i32 17, !513, !DIExpression(), !506)
    #dbg_value(i32 1, !514, !DIExpression(), !506)
    #dbg_value(i32 0, !515, !DIExpression(), !506)
    #dbg_value(i32 0, !516, !DIExpression(), !518)
  br label %for.cond.i22, !dbg !519

for.cond.i22:                                     ; preds = %for.inc17.i30, %unpack_m_vecs.exit
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc17.i30 ], [ 64, %unpack_m_vecs.exit ], !dbg !520
  %bs_mat_entries_used.0.i = phi i32 [ 0, %unpack_m_vecs.exit ], [ %bs_mat_entries_used.1.i.lcssa, %for.inc17.i30 ], !dbg !520
  %r.0.i23 = phi i32 [ 0, %unpack_m_vecs.exit ], [ %inc18.i31, %for.inc17.i30 ], !dbg !521
    #dbg_value(i32 %r.0.i23, !516, !DIExpression(), !518)
    #dbg_value(i32 %bs_mat_entries_used.0.i, !515, !DIExpression(), !506)
  %exitcond47 = icmp ne i32 %r.0.i23, 64, !dbg !522
  br i1 %exitcond47, label %for.cond1.i27.preheader, label %for.cond.i16.preheader, !dbg !524

for.cond1.i27.preheader:                          ; preds = %for.cond.i22
  %4 = add i32 %bs_mat_entries_used.0.i, %indvars.iv, !dbg !525
  br label %for.cond1.i27, !dbg !525

for.cond.i16.preheader:                           ; preds = %for.cond.i22
  br label %for.cond.i16, !dbg !528

for.cond1.i27:                                    ; preds = %for.cond1.i27.preheader, %for.inc15.i35
  %bs_mat_entries_used.1.i = phi i32 [ %add14.i36, %for.inc15.i35 ], [ %bs_mat_entries_used.0.i, %for.cond1.i27.preheader ], !dbg !506
  %c.0.i28 = phi i32 [ %inc.i37, %for.inc15.i35 ], [ %r.0.i23, %for.cond1.i27.preheader ], !dbg !534
    #dbg_value(i32 %c.0.i28, !535, !DIExpression(), !536)
    #dbg_value(i32 %bs_mat_entries_used.1.i, !515, !DIExpression(), !506)
  %exitcond46 = icmp ne i32 %bs_mat_entries_used.1.i, %4, !dbg !537
  br i1 %exitcond46, label %for.cond4.i32.preheader, label %for.inc17.i30, !dbg !525

for.cond4.i32.preheader:                          ; preds = %for.cond1.i27
  br label %for.cond4.i32, !dbg !539

for.cond4.i32:                                    ; preds = %for.cond4.i32.preheader, %for.body6.i38
  %k.0.i33 = phi i32 [ %add13.i, %for.body6.i38 ], [ 0, %for.cond4.i32.preheader ], !dbg !542
    #dbg_value(i32 %k.0.i33, !543, !DIExpression(), !544)
  %exitcond45 = icmp ne i32 %k.0.i33, 17, !dbg !545
  br i1 %exitcond45, label %for.body6.i38, label %for.inc15.i35, !dbg !539

for.body6.i38:                                    ; preds = %for.cond4.i32
  %add.ptr.i40.idx = shl nsw i32 %bs_mat_entries_used.1.i, 5, !dbg !547
  %add.ptr.i40 = getelementptr inbounds i8, ptr %P, i32 %add.ptr.i40.idx, !dbg !547
  %mul8.i41 = mul nuw nsw i32 %c.0.i28, 17, !dbg !549
  %5 = getelementptr i8, ptr %O, i32 %mul8.i41, !dbg !550
  %arrayidx.i42 = getelementptr i8, ptr %5, i32 %k.0.i33, !dbg !550
  %6 = load i8, ptr %arrayidx.i42, align 1, !dbg !550
  %mul9.i = mul nuw nsw i32 %r.0.i23, 17, !dbg !551
  %add10.i = add nuw nsw i32 %mul9.i, %k.0.i33, !dbg !552
  %add.ptr12.i.idx = shl nuw nsw i32 %add10.i, 5, !dbg !553
  %add.ptr12.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %add.ptr12.i.idx, !dbg !553
  call fastcc void @m_vec_mul_add(i32 noundef 4, ptr noundef nonnull %add.ptr.i40, i8 noundef zeroext %6, ptr noundef nonnull %add.ptr12.i) #9, !dbg !554
  %add13.i = add nuw nsw i32 %k.0.i33, 1, !dbg !555
    #dbg_value(i32 %add13.i, !543, !DIExpression(), !544)
  br label %for.cond4.i32, !dbg !556, !llvm.loop !557

for.inc15.i35:                                    ; preds = %for.cond4.i32
    #dbg_value(i32 %bs_mat_entries_used.1.i, !515, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !506)
  %add14.i36 = add i32 %bs_mat_entries_used.1.i, 1, !dbg !559
    #dbg_value(i32 %add14.i36, !515, !DIExpression(), !506)
  %inc.i37 = add nuw nsw i32 %c.0.i28, 1, !dbg !560
    #dbg_value(i32 %inc.i37, !535, !DIExpression(), !536)
  br label %for.cond1.i27, !dbg !561, !llvm.loop !562

for.inc17.i30:                                    ; preds = %for.cond1.i27
  %bs_mat_entries_used.1.i.lcssa = phi i32 [ %bs_mat_entries_used.1.i, %for.cond1.i27 ], !dbg !506
  %inc18.i31 = add nuw nsw i32 %r.0.i23, 1, !dbg !564
    #dbg_value(i32 %inc18.i31, !516, !DIExpression(), !518)
  %indvars.iv.next = add nsw i32 %indvars.iv, -1, !dbg !565
  br label %for.cond.i22, !dbg !565, !llvm.loop !566

for.cond.i16:                                     ; preds = %for.cond.i16.preheader, %for.inc17.i
  %r.0.i = phi i32 [ %inc18.i, %for.inc17.i ], [ 0, %for.cond.i16.preheader ], !dbg !568
    #dbg_value(i32 %r.0.i, !569, !DIExpression(), !570)
  %exitcond50 = icmp ne i32 %r.0.i, 17, !dbg !571
  br i1 %exitcond50, label %for.cond1.i.preheader, label %mul_add_mat_trans_x_m_mat.exit, !dbg !528

for.cond1.i.preheader:                            ; preds = %for.cond.i16
  br label %for.cond1.i, !dbg !573

for.cond1.i:                                      ; preds = %for.cond1.i.preheader, %for.inc15.i
  %c.0.i = phi i32 [ %inc.i18, %for.inc15.i ], [ 0, %for.cond1.i.preheader ], !dbg !576
    #dbg_value(i32 %c.0.i, !577, !DIExpression(), !578)
  %exitcond49 = icmp ne i32 %c.0.i, 64, !dbg !579
  br i1 %exitcond49, label %for.cond4.i.preheader, label %for.inc17.i, !dbg !573

for.cond4.i.preheader:                            ; preds = %for.cond1.i
  br label %for.cond4.i, !dbg !581

for.cond4.i:                                      ; preds = %for.cond4.i.preheader, %for.body6.i
  %k.0.i = phi i32 [ %add14.i, %for.body6.i ], [ 0, %for.cond4.i.preheader ], !dbg !584
    #dbg_value(i32 %k.0.i, !585, !DIExpression(), !586)
  %exitcond48 = icmp ne i32 %k.0.i, 17, !dbg !587
  br i1 %exitcond48, label %for.body6.i, label %for.inc15.i, !dbg !581

for.body6.i:                                      ; preds = %for.cond4.i
  %mul.i19 = mul nuw nsw i32 %c.0.i, 17, !dbg !589
  %add.i = add nuw nsw i32 %mul.i19, %k.0.i, !dbg !591
  %add.ptr.i20.idx = shl nuw nsw i32 %add.i, 5, !dbg !592
  %add.ptr.i20 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %add.ptr.i20.idx, !dbg !592
  %mul8.i = mul nuw nsw i32 %c.0.i, 17, !dbg !593
  %7 = getelementptr i8, ptr %O, i32 %mul8.i, !dbg !594
  %arrayidx.i21 = getelementptr i8, ptr %7, i32 %r.0.i, !dbg !594
  %8 = load i8, ptr %arrayidx.i21, align 1, !dbg !594
  %mul10.i = mul nuw nsw i32 %r.0.i, 17, !dbg !595
  %add11.i = add nuw nsw i32 %mul10.i, %k.0.i, !dbg !596
  %add.ptr13.i.idx = shl nuw nsw i32 %add11.i, 5, !dbg !597
  %add.ptr13.i = getelementptr inbounds nuw i8, ptr %P3, i32 %add.ptr13.i.idx, !dbg !597
  call fastcc void @m_vec_mul_add(i32 noundef 4, ptr noundef nonnull %add.ptr.i20, i8 noundef zeroext %8, ptr noundef nonnull %add.ptr13.i) #9, !dbg !598
  %add14.i = add nuw nsw i32 %k.0.i, 1, !dbg !599
    #dbg_value(i32 %add14.i, !585, !DIExpression(), !586)
  br label %for.cond4.i, !dbg !600, !llvm.loop !601

for.inc15.i:                                      ; preds = %for.cond4.i
  %inc.i18 = add nuw nsw i32 %c.0.i, 1, !dbg !603
    #dbg_value(i32 %inc.i18, !577, !DIExpression(), !578)
  br label %for.cond1.i, !dbg !604, !llvm.loop !605

for.inc17.i:                                      ; preds = %for.cond1.i
  %inc18.i = add nuw nsw i32 %r.0.i, 1, !dbg !607
    #dbg_value(i32 %inc18.i, !569, !DIExpression(), !570)
  br label %for.cond.i16, !dbg !608, !llvm.loop !609

mul_add_mat_trans_x_m_mat.exit:                   ; preds = %for.cond.i16
  %call11 = call ptr @memcpy(ptr noundef %cpk, ptr noundef nonnull %S, i32 noundef 16) #8, !dbg !611
    #dbg_declare(ptr %P3_upper, !612, !DIExpression(), !616)
  call void @pqmayo_MAYO_2_ref_m_upper(ptr noundef %p, ptr noundef nonnull %P3, ptr noundef nonnull %P3_upper, i32 noundef 17) #9, !dbg !617
  %add.ptr15 = getelementptr inbounds nuw i8, ptr %cpk, i32 16, !dbg !618
    #dbg_value(ptr %P3_upper, !619, !DIExpression(), !623)
    #dbg_value(ptr %add.ptr15, !625, !DIExpression(), !623)
    #dbg_value(i32 153, !626, !DIExpression(), !623)
    #dbg_value(i32 64, !627, !DIExpression(), !623)
    #dbg_value(i32 4, !628, !DIExpression(), !623)
    #dbg_value(ptr %P3_upper, !629, !DIExpression(), !623)
    #dbg_value(i32 0, !630, !DIExpression(), !632)
  br label %for.cond.i, !dbg !633

for.cond.i:                                       ; preds = %for.body.i, %mul_add_mat_trans_x_m_mat.exit
  %i.0.i = phi i32 [ 0, %mul_add_mat_trans_x_m_mat.exit ], [ %inc.i, %for.body.i ], !dbg !634
    #dbg_value(i32 %i.0.i, !630, !DIExpression(), !632)
  %exitcond51 = icmp ne i32 %i.0.i, 153, !dbg !635
  br i1 %exitcond51, label %for.body.i, label %err.loopexit, !dbg !637

for.body.i:                                       ; preds = %for.cond.i
  %div1.i = shl nuw nsw i32 %i.0.i, 5, !dbg !638
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %add.ptr15, i32 %div1.i, !dbg !640
  %mul2.i = shl nuw nsw i32 %i.0.i, 5, !dbg !641
  %add.ptr4.i = getelementptr inbounds nuw i8, ptr %P3_upper, i32 %mul2.i, !dbg !642
  %call.i1 = call ptr @memmove(ptr noundef nonnull %add.ptr.i, ptr noundef nonnull %add.ptr4.i, i32 noundef 32) #8, !dbg !643
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !644
    #dbg_value(i32 %inc.i, !630, !DIExpression(), !632)
  br label %for.cond.i, !dbg !645, !llvm.loop !646

err.loopexit:                                     ; preds = %for.cond.i
  br label %err, !dbg !648

err:                                              ; preds = %err.loopexit, %entry
  %ret.0 = phi i32 [ 1, %entry ], [ 0, %err.loopexit ], !dbg !392
    #dbg_value(i32 %ret.0, !395, !DIExpression(), !392)
    #dbg_label(!649, !650)
  call void @mayo_secure_clear(ptr noundef nonnull %O, i32 noundef 1088) #8, !dbg !648
  call void @mayo_secure_clear(ptr noundef nonnull %add.ptr, i32 noundef 34816) #8, !dbg !651
  call void @mayo_secure_clear(ptr noundef nonnull %P3, i32 noundef 9248) #8, !dbg !652
  ret i32 %ret.0, !dbg !653
}

declare dso_local i32 @randombytes(ptr noundef, i32 noundef) local_unnamed_addr #4

declare dso_local i32 @shake256(ptr noundef, i32 noundef, ptr noundef, i32 noundef) local_unnamed_addr #4

declare dso_local ptr @memcpy(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #4

declare dso_local void @mayo_secure_clear(ptr noundef, i32 noundef) local_unnamed_addr #4

declare dso_local ptr @memmove(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: nounwind
define internal fastcc void @m_vec_mul_add(i32 noundef %m_vec_limbs, ptr noundef %in, i8 noundef zeroext %a, ptr noundef %acc) unnamed_addr #0 !dbg !654 {
entry:
    #dbg_value(i32 %m_vec_limbs, !658, !DIExpression(), !659)
    #dbg_value(ptr %in, !660, !DIExpression(), !659)
    #dbg_value(i8 %a, !661, !DIExpression(), !659)
    #dbg_value(ptr %acc, !662, !DIExpression(), !659)
    #dbg_value(i8 %a, !663, !DIExpression(), !668)
  %conv.i = zext i8 %a to i32, !dbg !670
  %mul.i = mul i32 %conv.i, 134480385, !dbg !671
    #dbg_value(i32 %mul.i, !672, !DIExpression(), !668)
    #dbg_value(i32 -252645136, !673, !DIExpression(), !668)
  %and.i = and i32 %mul.i, -252645136, !dbg !674
    #dbg_value(i32 %and.i, !675, !DIExpression(), !668)
  %shr.i = lshr exact i32 %and.i, 4, !dbg !676
  %shr1.i = lshr exact i32 %and.i, 3, !dbg !677
  %0 = xor i32 %shr.i, %shr1.i, !dbg !678
  %xor2.i = xor i32 %0, %mul.i, !dbg !678
    #dbg_value(i32 %xor2.i, !679, !DIExpression(), !659)
    #dbg_value(i64 1229782938247303441, !680, !DIExpression(), !659)
    #dbg_value(i32 0, !681, !DIExpression(), !683)
  br label %for.cond, !dbg !684

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !685
    #dbg_value(i32 %i.0, !681, !DIExpression(), !683)
  %exitcond = icmp ne i32 %i.0, 4, !dbg !686
  br i1 %exitcond, label %for.body, label %for.end, !dbg !688

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !689
  %1 = load i64, ptr %arrayidx, align 8, !dbg !689
  %and = and i64 %1, 1229782938247303441, !dbg !691
  %and1 = and i32 %xor2.i, 255, !dbg !692
  %conv = zext nneg i32 %and1 to i64, !dbg !693
  %mul = mul i64 %and, %conv, !dbg !694
  %shr = lshr i64 %1, 1, !dbg !695
  %and3 = and i64 %shr, 1229782938247303441, !dbg !696
  %shr4 = lshr i32 %xor2.i, 8, !dbg !697
  %and5 = and i32 %shr4, 15, !dbg !698
  %conv6 = zext nneg i32 %and5 to i64, !dbg !699
  %mul7 = mul nuw i64 %and3, %conv6, !dbg !700
  %xor = xor i64 %mul, %mul7, !dbg !701
  %arrayidx8 = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !702
  %2 = load i64, ptr %arrayidx8, align 8, !dbg !702
  %shr9 = lshr i64 %2, 2, !dbg !703
  %and10 = and i64 %shr9, 1229782938247303441, !dbg !704
  %shr11 = lshr i32 %xor2.i, 16, !dbg !705
  %and12 = and i32 %shr11, 15, !dbg !706
  %conv13 = zext nneg i32 %and12 to i64, !dbg !707
  %mul14 = mul nuw i64 %and10, %conv13, !dbg !708
  %xor15 = xor i64 %xor, %mul14, !dbg !709
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !710
  %3 = load i64, ptr %arrayidx16, align 8, !dbg !710
  %shr17 = lshr i64 %3, 3, !dbg !711
  %and18 = and i64 %shr17, 1229782938247303441, !dbg !712
  %shr19 = lshr i32 %xor2.i, 24, !dbg !713
  %and20 = and i32 %shr19, 15, !dbg !714
  %conv21 = zext nneg i32 %and20 to i64, !dbg !715
  %mul22 = mul nuw i64 %and18, %conv21, !dbg !716
  %xor23 = xor i64 %xor15, %mul22, !dbg !717
  %arrayidx24 = getelementptr inbounds nuw i64, ptr %acc, i32 %i.0, !dbg !718
  %4 = load i64, ptr %arrayidx24, align 8, !dbg !719
  %xor25 = xor i64 %4, %xor23, !dbg !719
  store i64 %xor25, ptr %arrayidx24, align 8, !dbg !719
  %inc = add nuw nsw i32 %i.0, 1, !dbg !720
    #dbg_value(i32 %inc, !681, !DIExpression(), !683)
  br label %for.cond, !dbg !721, !llvm.loop !722

for.end:                                          ; preds = %for.cond
  ret void, !dbg !724
}

declare dso_local i32 @AES_128_CTR(ptr noundef, i32 noundef, ptr noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: nounwind
define dso_local i32 @pqmayo_MAYO_2_ref_mayo_expand_sk(ptr noundef %p, ptr noundef %csk, ptr noundef %sk) local_unnamed_addr #0 !dbg !725 {
entry:
  %tmp.i = alloca [4 x i64], align 8
  %S = alloca [560 x i8], align 1
    #dbg_value(ptr %p, !734, !DIExpression(), !735)
    #dbg_value(ptr %csk, !736, !DIExpression(), !735)
    #dbg_value(ptr %sk, !737, !DIExpression(), !735)
    #dbg_value(i32 0, !738, !DIExpression(), !735)
    #dbg_declare(ptr %S, !739, !DIExpression(), !740)
    #dbg_value(ptr %sk, !741, !DIExpression(), !735)
  %O2 = getelementptr inbounds nuw i8, ptr %sk, i32 101376, !dbg !742
    #dbg_value(ptr %O2, !743, !DIExpression(), !735)
    #dbg_value(i32 17, !744, !DIExpression(), !735)
    #dbg_value(i32 64, !745, !DIExpression(), !735)
    #dbg_value(i32 544, !746, !DIExpression(), !735)
    #dbg_value(i32 16, !747, !DIExpression(), !735)
    #dbg_value(i32 24, !748, !DIExpression(), !735)
    #dbg_value(ptr %csk, !749, !DIExpression(), !735)
    #dbg_value(ptr %S, !750, !DIExpression(), !735)
  %call = call i32 @shake256(ptr noundef nonnull %S, i32 noundef 560, ptr noundef %csk, i32 noundef 24) #8, !dbg !751
  %add.ptr = getelementptr inbounds nuw i8, ptr %S, i32 16, !dbg !752
    #dbg_value(ptr %add.ptr, !430, !DIExpression(), !753)
    #dbg_value(ptr %O2, !436, !DIExpression(), !753)
    #dbg_value(i32 1088, !437, !DIExpression(), !753)
    #dbg_value(i32 0, !438, !DIExpression(), !753)
  br label %for.cond.i2, !dbg !755

for.cond.i2:                                      ; preds = %for.body.i5, %entry
  %mdec.addr.0.i = phi ptr [ %O2, %entry ], [ %incdec.ptr5.i, %for.body.i5 ]
  %i.0.i3 = phi i32 [ 0, %entry ], [ %inc.i, %for.body.i5 ], !dbg !756
    #dbg_value(i32 %i.0.i3, !438, !DIExpression(), !753)
    #dbg_value(ptr %mdec.addr.0.i, !436, !DIExpression(), !753)
  %exitcond = icmp ne i32 %i.0.i3, 544, !dbg !757
  br i1 %exitcond, label %for.body.i5, label %decode.exit, !dbg !758

for.body.i5:                                      ; preds = %for.cond.i2
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %i.0.i3, !dbg !759
  %0 = load i8, ptr %arrayidx.i, align 1, !dbg !759
  %1 = and i8 %0, 15, !dbg !760
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i, i32 1, !dbg !761
    #dbg_value(ptr %incdec.ptr.i, !436, !DIExpression(), !753)
  store i8 %1, ptr %mdec.addr.0.i, align 1, !dbg !762
  %2 = lshr i8 %0, 4, !dbg !763
    #dbg_value(ptr %incdec.ptr.i, !436, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !753)
  store i8 %2, ptr %incdec.ptr.i, align 1, !dbg !764
  %incdec.ptr5.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i, i32 2, !dbg !765
    #dbg_value(ptr %incdec.ptr5.i, !436, !DIExpression(), !753)
  %inc.i = add nuw nsw i32 %i.0.i3, 1, !dbg !766
    #dbg_value(i32 %inc.i, !438, !DIExpression(), !753)
  br label %for.cond.i2, !dbg !767, !llvm.loop !768

decode.exit:                                      ; preds = %for.cond.i2
    #dbg_value(ptr %p, !255, !DIExpression(), !770)
    #dbg_value(ptr %sk, !261, !DIExpression(), !770)
    #dbg_value(ptr %S, !262, !DIExpression(), !770)
  %call.i = call i32 @AES_128_CTR(ptr noundef %sk, i32 noundef 101376, ptr noundef nonnull %S, i32 noundef 16) #8, !dbg !772
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %tmp.i), !dbg !773
    #dbg_value(ptr %sk, !269, !DIExpression(), !775)
    #dbg_value(ptr %sk, !271, !DIExpression(), !775)
    #dbg_value(i32 3168, !272, !DIExpression(), !775)
    #dbg_value(i32 64, !273, !DIExpression(), !775)
    #dbg_value(i32 4, !274, !DIExpression(), !775)
    #dbg_value(ptr %sk, !276, !DIExpression(), !775)
    #dbg_declare(ptr %tmp.i, !277, !DIExpression(), !773)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(32) %tmp.i, i8 0, i32 32, i1 false), !dbg !773
    #dbg_value(i32 3168, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !776)
  br label %for.cond.i, !dbg !777

for.cond.i:                                       ; preds = %for.body.i, %decode.exit
  %i.0.in.i = phi i32 [ 3168, %decode.exit ], [ %i.0.i, %for.body.i ]
    #dbg_value(i32 %i.0.in.i, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !776)
  %cmp.i = icmp ugt i32 %i.0.in.i, 0, !dbg !778
  br i1 %cmp.i, label %for.body.i, label %unpack_m_vecs.exit, !dbg !779

for.body.i:                                       ; preds = %for.cond.i
  %i.0.i = add nsw i32 %i.0.in.i, -1, !dbg !780
    #dbg_value(i32 %i.0.i, !279, !DIExpression(), !776)
  %3 = shl i32 %i.0.i, 5, !dbg !781
  %div1.i1112 = and i32 %3, 2147483616, !dbg !781
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %sk, i32 %div1.i1112, !dbg !782
  %call.i1 = call ptr @memcpy(ptr noundef nonnull %tmp.i, ptr noundef %add.ptr.i, i32 noundef 32) #8, !dbg !783
  %mul3.i = shl i32 %i.0.i, 5, !dbg !784
  %add.ptr5.i = getelementptr inbounds nuw i8, ptr %sk, i32 %mul3.i, !dbg !785
  %call8.i = call ptr @memcpy(ptr noundef %add.ptr5.i, ptr noundef nonnull %tmp.i, i32 noundef 32) #8, !dbg !786
    #dbg_value(i32 %i.0.i, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !776)
  br label %for.cond.i, !dbg !787, !llvm.loop !788

unpack_m_vecs.exit:                               ; preds = %for.cond.i
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %tmp.i), !dbg !790
  %add.ptr7 = getelementptr inbounds nuw i8, ptr %sk, i32 66560, !dbg !791
    #dbg_value(ptr %add.ptr7, !792, !DIExpression(), !735)
    #dbg_value(ptr %sk, !793, !DIExpression(), !735)
    #dbg_value(ptr %add.ptr7, !794, !DIExpression(), !735)
    #dbg_value(ptr %p, !795, !DIExpression(), !797)
    #dbg_value(ptr %sk, !799, !DIExpression(), !797)
    #dbg_value(ptr %O2, !800, !DIExpression(), !797)
    #dbg_value(ptr %add.ptr7, !801, !DIExpression(), !797)
    #dbg_value(i32 17, !802, !DIExpression(), !797)
    #dbg_value(i32 64, !803, !DIExpression(), !797)
    #dbg_value(i32 4, !804, !DIExpression(), !797)
    #dbg_value(i32 0, !805, !DIExpression(), !797)
    #dbg_value(i32 0, !806, !DIExpression(), !808)
  br label %for.cond.i6, !dbg !809

for.cond.i6:                                      ; preds = %for.inc27.i, %unpack_m_vecs.exit
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc27.i ], [ 64, %unpack_m_vecs.exit ], !dbg !810
  %bs_mat_entries_used.0.i = phi i32 [ 0, %unpack_m_vecs.exit ], [ %bs_mat_entries_used.1.i.lcssa, %for.inc27.i ], !dbg !810
  %r.0.i = phi i32 [ 0, %unpack_m_vecs.exit ], [ %inc28.i, %for.inc27.i ], !dbg !811
    #dbg_value(i32 %r.0.i, !806, !DIExpression(), !808)
    #dbg_value(i32 %bs_mat_entries_used.0.i, !805, !DIExpression(), !797)
  %exitcond15 = icmp ne i32 %r.0.i, 64, !dbg !812
  br i1 %exitcond15, label %for.cond1.i.preheader, label %P1P1t_times_O.exit, !dbg !814

for.cond1.i.preheader:                            ; preds = %for.cond.i6
  %4 = add i32 %bs_mat_entries_used.0.i, %indvars.iv, !dbg !815
  br label %for.cond1.i, !dbg !815

for.cond1.i:                                      ; preds = %for.cond1.i.preheader, %for.inc25.i
  %bs_mat_entries_used.1.i = phi i32 [ %bs_mat_entries_used.2.i, %for.inc25.i ], [ %bs_mat_entries_used.0.i, %for.cond1.i.preheader ], !dbg !797
  %c.0.i = phi i32 [ %inc.i8, %for.inc25.i ], [ %r.0.i, %for.cond1.i.preheader ], !dbg !818
    #dbg_value(i32 %c.0.i, !819, !DIExpression(), !820)
    #dbg_value(i32 %bs_mat_entries_used.1.i, !805, !DIExpression(), !797)
  %exitcond14 = icmp ne i32 %bs_mat_entries_used.1.i, %4, !dbg !821
  br i1 %exitcond14, label %for.body3.i, label %for.inc27.i, !dbg !815

for.body3.i:                                      ; preds = %for.cond1.i
  %cmp4.i = icmp eq i32 %c.0.i, %r.0.i, !dbg !823
  br i1 %cmp4.i, label %for.inc25.i, label %for.cond5.i.preheader, !dbg !823

for.cond5.i.preheader:                            ; preds = %for.body3.i
  br label %for.cond5.i, !dbg !826

for.cond5.i:                                      ; preds = %for.cond5.i.preheader, %for.body7.i
  %k.0.i = phi i32 [ %add23.i, %for.body7.i ], [ 0, %for.cond5.i.preheader ], !dbg !828
    #dbg_value(i32 %k.0.i, !829, !DIExpression(), !830)
  %exitcond13 = icmp ne i32 %k.0.i, 17, !dbg !831
  br i1 %exitcond13, label %for.body7.i, label %for.inc25.i.loopexit, !dbg !826

for.body7.i:                                      ; preds = %for.cond5.i
  %add.ptr.idx.i = shl nsw i32 %bs_mat_entries_used.1.i, 5, !dbg !833
  %add.ptr.i9 = getelementptr inbounds i8, ptr %sk, i32 %add.ptr.idx.i, !dbg !833
  %mul8.i = mul nuw nsw i32 %c.0.i, 17, !dbg !835
  %5 = getelementptr inbounds nuw i8, ptr %O2, i32 %mul8.i, !dbg !836
  %arrayidx.i10 = getelementptr inbounds nuw i8, ptr %5, i32 %k.0.i, !dbg !836
  %6 = load i8, ptr %arrayidx.i10, align 1, !dbg !836
  %mul10.i = mul nuw nsw i32 %r.0.i, 17, !dbg !837
  %add11.i = add nuw nsw i32 %mul10.i, %k.0.i, !dbg !838
  %add.ptr13.idx.i = shl nuw nsw i32 %add11.i, 5, !dbg !839
  %add.ptr13.i = getelementptr inbounds nuw i8, ptr %add.ptr7, i32 %add.ptr13.idx.i, !dbg !839
  call fastcc void @m_vec_mul_add(i32 noundef 4, ptr noundef %add.ptr.i9, i8 noundef zeroext %6, ptr noundef nonnull %add.ptr13.i) #9, !dbg !840
  %add.ptr15.idx.i = shl nsw i32 %bs_mat_entries_used.1.i, 5, !dbg !841
  %add.ptr15.i = getelementptr inbounds i8, ptr %sk, i32 %add.ptr15.idx.i, !dbg !841
  %mul16.i = mul nuw nsw i32 %r.0.i, 17, !dbg !842
  %7 = getelementptr inbounds nuw i8, ptr %O2, i32 %mul16.i, !dbg !843
  %arrayidx18.i = getelementptr inbounds nuw i8, ptr %7, i32 %k.0.i, !dbg !843
  %8 = load i8, ptr %arrayidx18.i, align 1, !dbg !843
  %mul19.i = mul nuw nsw i32 %c.0.i, 17, !dbg !844
  %add20.i = add nuw nsw i32 %mul19.i, %k.0.i, !dbg !845
  %add.ptr22.idx.i = shl nuw nsw i32 %add20.i, 5, !dbg !846
  %add.ptr22.i = getelementptr inbounds nuw i8, ptr %add.ptr7, i32 %add.ptr22.idx.i, !dbg !846
  call fastcc void @m_vec_mul_add(i32 noundef 4, ptr noundef %add.ptr15.i, i8 noundef zeroext %8, ptr noundef nonnull %add.ptr22.i) #9, !dbg !847
  %add23.i = add nuw nsw i32 %k.0.i, 1, !dbg !848
    #dbg_value(i32 %add23.i, !829, !DIExpression(), !830)
  br label %for.cond5.i, !dbg !849, !llvm.loop !850

for.inc25.i.loopexit:                             ; preds = %for.cond5.i
  br label %for.inc25.i, !dbg !852

for.inc25.i:                                      ; preds = %for.inc25.i.loopexit, %for.body3.i
  %bs_mat_entries_used.2.i = add i32 %bs_mat_entries_used.1.i, 1, !dbg !852
    #dbg_value(i32 %bs_mat_entries_used.2.i, !805, !DIExpression(), !797)
  %inc.i8 = add nuw nsw i32 %c.0.i, 1, !dbg !853
    #dbg_value(i32 %inc.i8, !819, !DIExpression(), !820)
  br label %for.cond1.i, !dbg !854, !llvm.loop !855

for.inc27.i:                                      ; preds = %for.cond1.i
  %bs_mat_entries_used.1.i.lcssa = phi i32 [ %bs_mat_entries_used.1.i, %for.cond1.i ], !dbg !797
  %inc28.i = add nuw nsw i32 %r.0.i, 1, !dbg !857
    #dbg_value(i32 %inc28.i, !806, !DIExpression(), !808)
  %indvars.iv.next = add nsw i32 %indvars.iv, -1, !dbg !858
  br label %for.cond.i6, !dbg !858, !llvm.loop !859

P1P1t_times_O.exit:                               ; preds = %for.cond.i6
  call void @mayo_secure_clear(ptr noundef nonnull %S, i32 noundef 560) #8, !dbg !861
  ret i32 0, !dbg !862
}

; Function Attrs: nounwind
define dso_local i32 @pqmayo_MAYO_2_ref_mayo_sign_signature(ptr noundef %p, ptr noundef %sig, ptr noundef %siglen, ptr noundef %m, i32 noundef %mlen, ptr noundef %csk) local_unnamed_addr #0 !dbg !863 {
entry:
  %A.i = alloca [640 x i64], align 8
  %tab.i = alloca [16 x i8], align 1
  %Pv.i = alloca [1024 x i64], align 8
  %tenc = alloca [32 x i8], align 1
  %t = alloca [64 x i8], align 1
  %y = alloca [64 x i8], align 1
  %salt = alloca [24 x i8], align 1
  %V = alloca [162 x i8], align 1
  %Vdec = alloca [256 x i8], align 1
  %A = alloca [4416 x i8], align 1
  %x = alloca [324 x i8], align 1
  %r = alloca [69 x i8], align 1
  %s = alloca [324 x i8], align 1
  %sk = alloca %struct.sk_t, align 32
  %Ox = alloca [64 x i8], align 1
  %tmp = alloca [81 x i8], align 1
  %Mtmp = alloca [272 x i64], align 8
    #dbg_value(ptr %p, !864, !DIExpression(), !865)
    #dbg_value(ptr %sig, !866, !DIExpression(), !865)
    #dbg_value(ptr %siglen, !867, !DIExpression(), !865)
    #dbg_value(ptr %m, !868, !DIExpression(), !865)
    #dbg_value(i32 %mlen, !869, !DIExpression(), !865)
    #dbg_value(ptr %csk, !870, !DIExpression(), !865)
    #dbg_value(i32 0, !871, !DIExpression(), !865)
    #dbg_declare(ptr %tenc, !872, !DIExpression(), !873)
    #dbg_declare(ptr %t, !874, !DIExpression(), !878)
    #dbg_declare(ptr %y, !879, !DIExpression(), !880)
    #dbg_declare(ptr %salt, !881, !DIExpression(), !885)
    #dbg_declare(ptr %V, !886, !DIExpression(), !890)
    #dbg_declare(ptr %Vdec, !891, !DIExpression(), !895)
    #dbg_declare(ptr %A, !896, !DIExpression(), !900)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(4416) %A, i8 0, i32 4416, i1 false), !dbg !900
    #dbg_declare(ptr %x, !901, !DIExpression(), !905)
    #dbg_declare(ptr %r, !906, !DIExpression(), !910)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(69) %r, i8 0, i32 69, i1 false), !dbg !910
    #dbg_declare(ptr %s, !911, !DIExpression(), !912)
    #dbg_declare(ptr %sk, !913, !DIExpression(), !914)
    #dbg_declare(ptr %Ox, !915, !DIExpression(), !916)
    #dbg_declare(ptr %tmp, !917, !DIExpression(), !921)
    #dbg_value(i32 64, !922, !DIExpression(), !865)
    #dbg_value(i32 81, !923, !DIExpression(), !865)
    #dbg_value(i32 17, !924, !DIExpression(), !865)
    #dbg_value(i32 4, !925, !DIExpression(), !865)
    #dbg_value(i32 64, !926, !DIExpression(), !865)
    #dbg_value(i32 32, !927, !DIExpression(), !865)
    #dbg_value(i32 32, !928, !DIExpression(), !865)
    #dbg_value(i32 34, !929, !DIExpression(), !865)
    #dbg_value(i32 186, !930, !DIExpression(), !865)
    #dbg_value(i32 69, !931, !DIExpression(), !865)
    #dbg_value(i32 32, !932, !DIExpression(), !865)
    #dbg_value(i32 24, !933, !DIExpression(), !865)
    #dbg_value(i32 24, !934, !DIExpression(), !865)
  %call = call i32 @pqmayo_MAYO_2_ref_mayo_expand_sk(ptr noundef %p, ptr noundef %csk, ptr noundef nonnull %sk) #9, !dbg !935
    #dbg_value(i32 %call, !871, !DIExpression(), !865)
  %cmp.not = icmp eq i32 %call, 0, !dbg !936
  br i1 %cmp.not, label %if.end, label %err, !dbg !936

if.end:                                           ; preds = %entry
    #dbg_value(ptr %csk, !938, !DIExpression(), !865)
  %call1 = call i32 @shake256(ptr noundef nonnull %tmp, i32 noundef 32, ptr noundef %m, i32 noundef %mlen) #8, !dbg !939
    #dbg_value(ptr %sk, !940, !DIExpression(), !865)
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 66560, !dbg !941
    #dbg_value(ptr %add.ptr, !942, !DIExpression(), !865)
    #dbg_declare(ptr %Mtmp, !943, !DIExpression(), !947)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(2176) %Mtmp, i8 0, i32 2176, i1 false), !dbg !947
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %tmp, i32 32, !dbg !948
  %call6 = call i32 @randombytes(ptr noundef nonnull %add.ptr5, i32 noundef 24) #8, !dbg !950
  %cmp7.not = icmp eq i32 %call6, 0, !dbg !951
  br i1 %cmp7.not, label %if.end9, label %err, !dbg !951

if.end9:                                          ; preds = %if.end
  %add.ptr12 = getelementptr inbounds nuw i8, ptr %tmp, i32 56, !dbg !952
  %call13 = call ptr @memcpy(ptr noundef nonnull %add.ptr12, ptr noundef %csk, i32 noundef 24) #8, !dbg !953
  %call16 = call i32 @shake256(ptr noundef nonnull %salt, i32 noundef 24, ptr noundef nonnull %tmp, i32 noundef 80) #8, !dbg !954
  %add.ptr18 = getelementptr inbounds nuw i8, ptr %tmp, i32 32, !dbg !955
  %call20 = call ptr @memcpy(ptr noundef nonnull %add.ptr18, ptr noundef nonnull %salt, i32 noundef 24) #8, !dbg !956
    #dbg_value(ptr %add.ptr24, !957, !DIExpression(), !865)
  %call27 = call i32 @shake256(ptr noundef nonnull %tenc, i32 noundef 32, ptr noundef nonnull %tmp, i32 noundef 56) #8, !dbg !958
    #dbg_value(ptr %tenc, !430, !DIExpression(), !959)
    #dbg_value(ptr %t, !436, !DIExpression(), !959)
    #dbg_value(i32 64, !437, !DIExpression(), !959)
    #dbg_value(i32 0, !438, !DIExpression(), !959)
  br label %for.cond.i23, !dbg !961

for.cond.i23:                                     ; preds = %for.body.i27, %if.end9
  %mdec.addr.0.i24 = phi ptr [ %t, %if.end9 ], [ %incdec.ptr5.i31, %for.body.i27 ]
  %i.0.i25 = phi i32 [ 0, %if.end9 ], [ %inc.i32, %for.body.i27 ], !dbg !962
    #dbg_value(i32 %i.0.i25, !438, !DIExpression(), !959)
    #dbg_value(ptr %mdec.addr.0.i24, !436, !DIExpression(), !959)
  %exitcond = icmp ne i32 %i.0.i25, 32, !dbg !963
  br i1 %exitcond, label %for.body.i27, label %for.cond.preheader, !dbg !964

for.cond.preheader:                               ; preds = %for.cond.i23
  %add.ptr24 = getelementptr inbounds nuw i8, ptr %tmp, i32 80, !dbg !965
  br label %for.cond, !dbg !966

for.body.i27:                                     ; preds = %for.cond.i23
  %arrayidx.i28 = getelementptr inbounds nuw i8, ptr %tenc, i32 %i.0.i25, !dbg !968
  %0 = load i8, ptr %arrayidx.i28, align 1, !dbg !968
  %1 = and i8 %0, 15, !dbg !969
  %incdec.ptr.i29 = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i24, i32 1, !dbg !970
    #dbg_value(ptr %incdec.ptr.i29, !436, !DIExpression(), !959)
  store i8 %1, ptr %mdec.addr.0.i24, align 1, !dbg !971
  %2 = lshr i8 %0, 4, !dbg !972
    #dbg_value(ptr %incdec.ptr.i29, !436, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !959)
  store i8 %2, ptr %incdec.ptr.i29, align 1, !dbg !973
  %incdec.ptr5.i31 = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i24, i32 2, !dbg !974
    #dbg_value(ptr %incdec.ptr5.i31, !436, !DIExpression(), !959)
  %inc.i32 = add nuw nsw i32 %i.0.i25, 1, !dbg !975
    #dbg_value(i32 %inc.i32, !438, !DIExpression(), !959)
  br label %for.cond.i23, !dbg !976, !llvm.loop !977

for.cond:                                         ; preds = %for.cond.preheader, %if.else
  %ctr.0 = phi i32 [ %inc75, %if.else ], [ 0, %for.cond.preheader ], !dbg !979
    #dbg_value(i32 %ctr.0, !980, !DIExpression(), !981)
  %exitcond159 = icmp ne i32 %ctr.0, 256, !dbg !982
  br i1 %exitcond159, label %for.body, label %for.end76, !dbg !966

for.body:                                         ; preds = %for.cond
  %conv = trunc nuw i32 %ctr.0 to i8, !dbg !984
  store i8 %conv, ptr %add.ptr24, align 1, !dbg !986
  %call33 = call i32 @shake256(ptr noundef nonnull %V, i32 noundef 162, ptr noundef nonnull %tmp, i32 noundef 81) #8, !dbg !987
    #dbg_value(i32 0, !988, !DIExpression(), !990)
  br label %for.cond34, !dbg !991

for.cond34:                                       ; preds = %decode.exit22, %for.body
  %i.0 = phi i32 [ 0, %for.body ], [ %inc, %decode.exit22 ], !dbg !992
    #dbg_value(i32 %i.0, !988, !DIExpression(), !990)
  %exitcond134 = icmp ne i32 %i.0, 4, !dbg !993
  br i1 %exitcond134, label %for.body37, label %for.end, !dbg !995

for.body37:                                       ; preds = %for.cond34
  %mul = shl nuw nsw i32 %i.0, 5, !dbg !996
  %add.ptr39 = getelementptr inbounds nuw i8, ptr %V, i32 %mul, !dbg !998
  %mul41 = shl nuw nsw i32 %i.0, 6, !dbg !999
  %add.ptr42 = getelementptr inbounds nuw i8, ptr %Vdec, i32 %mul41, !dbg !1000
    #dbg_value(ptr %add.ptr39, !430, !DIExpression(), !1001)
    #dbg_value(ptr %add.ptr42, !436, !DIExpression(), !1001)
    #dbg_value(i32 64, !437, !DIExpression(), !1001)
    #dbg_value(i32 0, !438, !DIExpression(), !1001)
  br label %for.cond.i12, !dbg !1003

for.cond.i12:                                     ; preds = %for.body.i16, %for.body37
  %mdec.addr.0.i13 = phi ptr [ %add.ptr42, %for.body37 ], [ %incdec.ptr5.i20, %for.body.i16 ]
  %i.0.i14 = phi i32 [ 0, %for.body37 ], [ %inc.i21, %for.body.i16 ], !dbg !1004
    #dbg_value(i32 %i.0.i14, !438, !DIExpression(), !1001)
    #dbg_value(ptr %mdec.addr.0.i13, !436, !DIExpression(), !1001)
  %exitcond133 = icmp ne i32 %i.0.i14, 32, !dbg !1005
  br i1 %exitcond133, label %for.body.i16, label %decode.exit22, !dbg !1006

for.body.i16:                                     ; preds = %for.cond.i12
  %arrayidx.i17 = getelementptr inbounds nuw i8, ptr %add.ptr39, i32 %i.0.i14, !dbg !1007
  %3 = load i8, ptr %arrayidx.i17, align 1, !dbg !1007
  %4 = and i8 %3, 15, !dbg !1008
  %incdec.ptr.i18 = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i13, i32 1, !dbg !1009
    #dbg_value(ptr %incdec.ptr.i18, !436, !DIExpression(), !1001)
  store i8 %4, ptr %mdec.addr.0.i13, align 1, !dbg !1010
  %5 = lshr i8 %3, 4, !dbg !1011
    #dbg_value(ptr %incdec.ptr.i18, !436, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1001)
  store i8 %5, ptr %incdec.ptr.i18, align 1, !dbg !1012
  %incdec.ptr5.i20 = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i13, i32 2, !dbg !1013
    #dbg_value(ptr %incdec.ptr5.i20, !436, !DIExpression(), !1001)
  %inc.i21 = add nuw nsw i32 %i.0.i14, 1, !dbg !1014
    #dbg_value(i32 %inc.i21, !438, !DIExpression(), !1001)
  br label %for.cond.i12, !dbg !1015, !llvm.loop !1016

decode.exit22:                                    ; preds = %for.cond.i12
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1018
    #dbg_value(i32 %inc, !988, !DIExpression(), !990)
  br label %for.cond34, !dbg !1019, !llvm.loop !1020

for.end:                                          ; preds = %for.cond34
  call void @llvm.lifetime.start.p0(i64 8192, ptr nonnull %Pv.i), !dbg !1022
    #dbg_value(ptr %p, !1027, !DIExpression(), !1028)
    #dbg_value(ptr %Vdec, !1029, !DIExpression(), !1028)
    #dbg_value(ptr %add.ptr, !1030, !DIExpression(), !1028)
    #dbg_value(ptr %sk, !1031, !DIExpression(), !1028)
    #dbg_value(ptr %Mtmp, !1032, !DIExpression(), !1028)
    #dbg_value(ptr %A, !1033, !DIExpression(), !1028)
    #dbg_value(i32 4, !1034, !DIExpression(), !1028)
    #dbg_value(i32 64, !1035, !DIExpression(), !1028)
    #dbg_value(i32 17, !1036, !DIExpression(), !1028)
    #dbg_value(i32 4, !1037, !DIExpression(), !1039)
    #dbg_value(ptr %Vdec, !1041, !DIExpression(), !1039)
    #dbg_value(ptr %add.ptr, !1042, !DIExpression(), !1039)
    #dbg_value(ptr %Mtmp, !1043, !DIExpression(), !1039)
    #dbg_value(i32 4, !1044, !DIExpression(), !1039)
    #dbg_value(i32 64, !1045, !DIExpression(), !1039)
    #dbg_value(i32 17, !1046, !DIExpression(), !1039)
    #dbg_value(i32 0, !1047, !DIExpression(), !1049)
  br label %for.cond.i41, !dbg !1050

for.cond.i41:                                     ; preds = %for.inc17.i47, %for.end
  %r.0.i42 = phi i32 [ 0, %for.end ], [ %inc18.i48, %for.inc17.i47 ], !dbg !1051
    #dbg_value(i32 %r.0.i42, !1047, !DIExpression(), !1049)
  %exitcond137 = icmp ne i32 %r.0.i42, 4, !dbg !1052
  br i1 %exitcond137, label %for.cond1.i44.preheader, label %mul_add_mat_x_m_mat.exit66, !dbg !1054

for.cond1.i44.preheader:                          ; preds = %for.cond.i41
  br label %for.cond1.i44, !dbg !1055

for.cond1.i44:                                    ; preds = %for.cond1.i44.preheader, %for.inc15.i52
  %c.0.i45 = phi i32 [ %inc.i53, %for.inc15.i52 ], [ 0, %for.cond1.i44.preheader ], !dbg !1058
    #dbg_value(i32 %c.0.i45, !1059, !DIExpression(), !1060)
  %exitcond136 = icmp ne i32 %c.0.i45, 64, !dbg !1061
  br i1 %exitcond136, label %for.cond4.i49.preheader, label %for.inc17.i47, !dbg !1055

for.cond4.i49.preheader:                          ; preds = %for.cond1.i44
  br label %for.cond4.i49, !dbg !1063

for.cond4.i49:                                    ; preds = %for.cond4.i49.preheader, %for.body6.i54
  %k.0.i50 = phi i32 [ %add14.i65, %for.body6.i54 ], [ 0, %for.cond4.i49.preheader ], !dbg !1066
    #dbg_value(i32 %k.0.i50, !1067, !DIExpression(), !1068)
  %exitcond135 = icmp ne i32 %k.0.i50, 17, !dbg !1069
  br i1 %exitcond135, label %for.body6.i54, label %for.inc15.i52, !dbg !1063

for.body6.i54:                                    ; preds = %for.cond4.i49
  %mul.i55 = mul nuw nsw i32 %c.0.i45, 17, !dbg !1071
  %add.i56 = add nuw nsw i32 %mul.i55, %k.0.i50, !dbg !1073
  %add.ptr.i58.idx = shl nuw nsw i32 %add.i56, 5, !dbg !1074
  %add.ptr.i58 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %add.ptr.i58.idx, !dbg !1074
  %mul8.i59 = shl nuw nsw i32 %r.0.i42, 6, !dbg !1075
  %6 = getelementptr i8, ptr %Vdec, i32 %mul8.i59, !dbg !1076
  %arrayidx.i60 = getelementptr i8, ptr %6, i32 %c.0.i45, !dbg !1076
  %7 = load i8, ptr %arrayidx.i60, align 1, !dbg !1076
  %mul10.i61 = mul nuw nsw i32 %r.0.i42, 17, !dbg !1077
  %add11.i62 = add nuw nsw i32 %mul10.i61, %k.0.i50, !dbg !1078
  %add.ptr13.i64.idx = shl nuw nsw i32 %add11.i62, 5, !dbg !1079
  %add.ptr13.i64 = getelementptr inbounds nuw i8, ptr %Mtmp, i32 %add.ptr13.i64.idx, !dbg !1079
  call fastcc void @m_vec_mul_add(i32 noundef 4, ptr noundef nonnull %add.ptr.i58, i8 noundef zeroext %7, ptr noundef nonnull %add.ptr13.i64) #9, !dbg !1080
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
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(8192) %Pv.i, i8 0, i32 8192, i1 false), !dbg !1097
    #dbg_value(ptr %p, !1098, !DIExpression(), !1100)
    #dbg_value(ptr %sk, !1102, !DIExpression(), !1100)
    #dbg_value(ptr %Vdec, !1103, !DIExpression(), !1100)
    #dbg_value(ptr %Pv.i, !1104, !DIExpression(), !1100)
    #dbg_value(i32 4, !1105, !DIExpression(), !1107)
    #dbg_value(ptr %sk, !1109, !DIExpression(), !1107)
    #dbg_value(ptr %Vdec, !1110, !DIExpression(), !1107)
    #dbg_value(ptr %Pv.i, !1111, !DIExpression(), !1107)
    #dbg_value(i32 64, !1112, !DIExpression(), !1107)
    #dbg_value(i32 64, !1113, !DIExpression(), !1107)
    #dbg_value(i32 4, !1114, !DIExpression(), !1107)
    #dbg_value(i32 1, !1115, !DIExpression(), !1107)
    #dbg_value(i32 0, !1116, !DIExpression(), !1107)
    #dbg_value(i32 0, !1117, !DIExpression(), !1119)
  br label %for.cond.i67, !dbg !1120

for.cond.i67:                                     ; preds = %for.inc17.i75, %mul_add_mat_x_m_mat.exit66
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc17.i75 ], [ 64, %mul_add_mat_x_m_mat.exit66 ], !dbg !1121
  %bs_mat_entries_used.0.i = phi i32 [ 0, %mul_add_mat_x_m_mat.exit66 ], [ %bs_mat_entries_used.1.i.lcssa, %for.inc17.i75 ], !dbg !1121
  %r.0.i68 = phi i32 [ 0, %mul_add_mat_x_m_mat.exit66 ], [ %inc18.i76, %for.inc17.i75 ], !dbg !1122
    #dbg_value(i32 %r.0.i68, !1117, !DIExpression(), !1119)
    #dbg_value(i32 %bs_mat_entries_used.0.i, !1116, !DIExpression(), !1107)
  %exitcond140 = icmp ne i32 %r.0.i68, 64, !dbg !1123
  br i1 %exitcond140, label %for.cond1.i72.preheader, label %for.cond.i34.preheader, !dbg !1125

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
  %exitcond139 = icmp ne i32 %bs_mat_entries_used.1.i, %8, !dbg !1134
  br i1 %exitcond139, label %for.cond4.i77.preheader, label %for.inc17.i75, !dbg !1128

for.cond4.i77.preheader:                          ; preds = %for.cond1.i72
  br label %for.cond4.i77, !dbg !1136

for.cond4.i77:                                    ; preds = %for.cond4.i77.preheader, %for.body6.i83
  %k.0.i78 = phi i32 [ %add13.i, %for.body6.i83 ], [ 0, %for.cond4.i77.preheader ], !dbg !1139
    #dbg_value(i32 %k.0.i78, !1140, !DIExpression(), !1141)
  %exitcond138 = icmp ne i32 %k.0.i78, 4, !dbg !1142
  br i1 %exitcond138, label %for.body6.i83, label %for.inc15.i80, !dbg !1136

for.body6.i83:                                    ; preds = %for.cond4.i77
  %add.ptr.i85.idx = shl nsw i32 %bs_mat_entries_used.1.i, 5, !dbg !1144
  %add.ptr.i85 = getelementptr inbounds i8, ptr %sk, i32 %add.ptr.i85.idx, !dbg !1144
  %mul8.i86 = shl nuw nsw i32 %k.0.i78, 6, !dbg !1146
  %9 = getelementptr i8, ptr %Vdec, i32 %mul8.i86, !dbg !1147
  %arrayidx.i87 = getelementptr i8, ptr %9, i32 %c.0.i73, !dbg !1147
  %10 = load i8, ptr %arrayidx.i87, align 1, !dbg !1147
  %11 = shl nuw nsw i32 %r.0.i68, 4, !dbg !1148
  %12 = shl nuw nsw i32 %k.0.i78, 2, !dbg !1148
  %mul11.i = or disjoint i32 %11, %12, !dbg !1148
  %add.ptr12.i = getelementptr inbounds nuw i64, ptr %Pv.i, i32 %mul11.i, !dbg !1149
  call fastcc void @m_vec_mul_add(i32 noundef 4, ptr noundef nonnull %add.ptr.i85, i8 noundef zeroext %10, ptr noundef nonnull %add.ptr12.i) #9, !dbg !1150
  %add13.i = add nuw nsw i32 %k.0.i78, 1, !dbg !1151
    #dbg_value(i32 %add13.i, !1140, !DIExpression(), !1141)
  br label %for.cond4.i77, !dbg !1152, !llvm.loop !1153

for.inc15.i80:                                    ; preds = %for.cond4.i77
    #dbg_value(i32 %bs_mat_entries_used.1.i, !1116, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1107)
  %add14.i81 = add i32 %bs_mat_entries_used.1.i, 1, !dbg !1155
    #dbg_value(i32 %add14.i81, !1116, !DIExpression(), !1107)
  %inc.i82 = add nuw nsw i32 %c.0.i73, 1, !dbg !1156
    #dbg_value(i32 %inc.i82, !1132, !DIExpression(), !1133)
  br label %for.cond1.i72, !dbg !1157, !llvm.loop !1158

for.inc17.i75:                                    ; preds = %for.cond1.i72
  %bs_mat_entries_used.1.i.lcssa = phi i32 [ %bs_mat_entries_used.1.i, %for.cond1.i72 ], !dbg !1107
  %inc18.i76 = add nuw nsw i32 %r.0.i68, 1, !dbg !1160
    #dbg_value(i32 %inc18.i76, !1117, !DIExpression(), !1119)
  %indvars.iv.next = add nsw i32 %indvars.iv, -1, !dbg !1161
  br label %for.cond.i67, !dbg !1161, !llvm.loop !1162

for.cond.i34:                                     ; preds = %for.cond.i34.preheader, %for.inc17.i
  %r.0.i = phi i32 [ %inc18.i, %for.inc17.i ], [ 0, %for.cond.i34.preheader ], !dbg !1164
    #dbg_value(i32 %r.0.i, !1047, !DIExpression(), !1165)
  %exitcond143 = icmp ne i32 %r.0.i, 4, !dbg !1166
  br i1 %exitcond143, label %for.cond1.i36.preheader, label %mul_add_mat_x_m_mat.exit, !dbg !1126

for.cond1.i36.preheader:                          ; preds = %for.cond.i34
  br label %for.cond1.i36, !dbg !1167

for.cond1.i36:                                    ; preds = %for.cond1.i36.preheader, %for.inc15.i
  %c.0.i = phi i32 [ %inc.i38, %for.inc15.i ], [ 0, %for.cond1.i36.preheader ], !dbg !1168
    #dbg_value(i32 %c.0.i, !1059, !DIExpression(), !1169)
  %exitcond142 = icmp ne i32 %c.0.i, 64, !dbg !1170
  br i1 %exitcond142, label %for.cond4.i.preheader, label %for.inc17.i, !dbg !1167

for.cond4.i.preheader:                            ; preds = %for.cond1.i36
  br label %for.cond4.i, !dbg !1171

for.cond4.i:                                      ; preds = %for.cond4.i.preheader, %for.body6.i
  %k.0.i = phi i32 [ %add14.i, %for.body6.i ], [ 0, %for.cond4.i.preheader ], !dbg !1172
    #dbg_value(i32 %k.0.i, !1067, !DIExpression(), !1173)
  %exitcond141 = icmp ne i32 %k.0.i, 4, !dbg !1174
  br i1 %exitcond141, label %for.body6.i, label %for.inc15.i, !dbg !1171

for.body6.i:                                      ; preds = %for.cond4.i
  %13 = shl nuw nsw i32 %c.0.i, 4, !dbg !1175
  %14 = shl nuw nsw i32 %k.0.i, 2, !dbg !1175
  %mul7.i = or disjoint i32 %13, %14, !dbg !1175
  %add.ptr.i39 = getelementptr inbounds nuw i64, ptr %Pv.i, i32 %mul7.i, !dbg !1176
  %mul8.i = shl nuw nsw i32 %r.0.i, 6, !dbg !1177
  %15 = getelementptr i8, ptr %Vdec, i32 %mul8.i, !dbg !1178
  %arrayidx.i40 = getelementptr i8, ptr %15, i32 %c.0.i, !dbg !1178
  %16 = load i8, ptr %arrayidx.i40, align 1, !dbg !1178
  %17 = shl nuw nsw i32 %r.0.i, 4, !dbg !1179
  %18 = shl nuw nsw i32 %k.0.i, 2, !dbg !1179
  %mul12.i = or disjoint i32 %17, %18, !dbg !1179
  %add.ptr13.i = getelementptr inbounds nuw i64, ptr %A, i32 %mul12.i, !dbg !1180
  call fastcc void @m_vec_mul_add(i32 noundef 4, ptr noundef nonnull %add.ptr.i39, i8 noundef zeroext %16, ptr noundef nonnull %add.ptr13.i) #9, !dbg !1181
  %add14.i = add nuw nsw i32 %k.0.i, 1, !dbg !1182
    #dbg_value(i32 %add14.i, !1067, !DIExpression(), !1173)
  br label %for.cond4.i, !dbg !1183, !llvm.loop !1184

for.inc15.i:                                      ; preds = %for.cond4.i
  %inc.i38 = add nuw nsw i32 %c.0.i, 1, !dbg !1186
    #dbg_value(i32 %inc.i38, !1059, !DIExpression(), !1169)
  br label %for.cond1.i36, !dbg !1187, !llvm.loop !1188

for.inc17.i:                                      ; preds = %for.cond1.i36
  %inc18.i = add nuw nsw i32 %r.0.i, 1, !dbg !1190
    #dbg_value(i32 %inc18.i, !1047, !DIExpression(), !1165)
  br label %for.cond.i34, !dbg !1191, !llvm.loop !1192

mul_add_mat_x_m_mat.exit:                         ; preds = %for.cond.i34
  call void @llvm.lifetime.end.p0(i64 8192, ptr nonnull %Pv.i), !dbg !1194
  call fastcc void @compute_rhs(ptr noundef %p, ptr noundef nonnull %A, ptr noundef nonnull %t, ptr noundef nonnull %y) #9, !dbg !1195
  call void @llvm.lifetime.start.p0(i64 5120, ptr nonnull %A.i), !dbg !1196
  call void @llvm.lifetime.start.p0(i64 16, ptr nonnull %tab.i), !dbg !1196
    #dbg_value(ptr %p, !1201, !DIExpression(), !1202)
    #dbg_value(ptr %Mtmp, !1203, !DIExpression(), !1202)
    #dbg_value(ptr %A, !1204, !DIExpression(), !1202)
    #dbg_value(i32 0, !1205, !DIExpression(), !1202)
    #dbg_value(i32 0, !1206, !DIExpression(), !1202)
    #dbg_value(i32 4, !1207, !DIExpression(), !1202)
    #dbg_declare(ptr %A.i, !1208, !DIExpression(), !1196)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(5120) %A.i, i8 0, i32 5120, i1 false), !dbg !1196
    #dbg_value(i32 80, !1212, !DIExpression(), !1202)
    #dbg_value(i32 0, !1213, !DIExpression(), !1215)
  br label %for.cond.i100, !dbg !1216

for.cond.i100:                                    ; preds = %for.inc90.i, %mul_add_mat_x_m_mat.exit
  %i.0.i101 = phi i32 [ 0, %mul_add_mat_x_m_mat.exit ], [ %inc91.i, %for.inc90.i ], !dbg !1217
  %words_to_shift.0.i = phi i32 [ 0, %mul_add_mat_x_m_mat.exit ], [ %words_to_shift.1.i.lcssa, %for.inc90.i ], !dbg !1218
  %bits_to_shift.0.i = phi i32 [ 0, %mul_add_mat_x_m_mat.exit ], [ %bits_to_shift.1.i.lcssa, %for.inc90.i ], !dbg !1219
    #dbg_value(i32 %bits_to_shift.0.i, !1205, !DIExpression(), !1202)
    #dbg_value(i32 %words_to_shift.0.i, !1206, !DIExpression(), !1202)
    #dbg_value(i32 %i.0.i101, !1213, !DIExpression(), !1215)
  %exitcond148 = icmp ne i32 %i.0.i101, 4, !dbg !1220
  br i1 %exitcond148, label %for.cond1.i119.preheader, label %for.cond94.i.preheader, !dbg !1222

for.cond94.i.preheader:                           ; preds = %for.cond.i100
  br label %for.cond94.i, !dbg !1223

for.cond1.i119.preheader:                         ; preds = %for.cond.i100
  br label %for.cond1.i119, !dbg !1225

for.cond1.i119:                                   ; preds = %for.cond1.i119.preheader, %if.end82.i
  %j.0.i120 = phi i32 [ %dec.i, %if.end82.i ], [ 3, %for.cond1.i119.preheader ], !dbg !1228
  %words_to_shift.1.i = phi i32 [ %spec.select.i, %if.end82.i ], [ %words_to_shift.0.i, %for.cond1.i119.preheader ], !dbg !1202
  %bits_to_shift.1.i = phi i32 [ %spec.select3.i, %if.end82.i ], [ %bits_to_shift.0.i, %for.cond1.i119.preheader ], !dbg !1202
    #dbg_value(i32 %bits_to_shift.1.i, !1205, !DIExpression(), !1202)
    #dbg_value(i32 %words_to_shift.1.i, !1206, !DIExpression(), !1202)
    #dbg_value(i32 %j.0.i120, !1229, !DIExpression(), !1230)
  %cmp2.not.i = icmp slt i32 %j.0.i120, %i.0.i101, !dbg !1231
  br i1 %cmp2.not.i, label %for.inc90.i, label %for.body3.i121, !dbg !1225

for.body3.i121:                                   ; preds = %for.cond1.i119
  %add.ptr.idx.i = mul nsw i32 %j.0.i120, 544, !dbg !1233
  %add.ptr.i122 = getelementptr inbounds i8, ptr %Mtmp, i32 %add.ptr.idx.i, !dbg !1233
    #dbg_value(ptr %add.ptr.i122, !1235, !DIExpression(), !1202)
    #dbg_value(i32 0, !1236, !DIExpression(), !1238)
  br label %for.cond5.i, !dbg !1239

for.cond5.i:                                      ; preds = %for.inc31.i, %for.body3.i121
  %c.0.i123 = phi i32 [ 0, %for.body3.i121 ], [ %inc32.i, %for.inc31.i ], !dbg !1240
    #dbg_value(i32 %c.0.i123, !1236, !DIExpression(), !1238)
  %exitcond145 = icmp ne i32 %c.0.i123, 17, !dbg !1241
  br i1 %exitcond145, label %for.cond8.i.preheader, label %for.end33.i, !dbg !1243

for.cond8.i.preheader:                            ; preds = %for.cond5.i
  br label %for.cond8.i, !dbg !1244

for.cond8.i:                                      ; preds = %for.cond8.i.preheader, %for.inc.i
  %k.0.i124 = phi i32 [ %inc.i132, %for.inc.i ], [ 0, %for.cond8.i.preheader ], !dbg !1247
    #dbg_value(i32 %k.0.i124, !1248, !DIExpression(), !1249)
  %exitcond144 = icmp ne i32 %k.0.i124, 4, !dbg !1250
  br i1 %exitcond144, label %for.body10.i, label %for.inc31.i, !dbg !1244

for.body10.i:                                     ; preds = %for.cond8.i
  %mul11.i125 = shl nuw nsw i32 %c.0.i123, 2, !dbg !1252
  %add.i126 = or disjoint i32 %k.0.i124, %mul11.i125, !dbg !1254
  %arrayidx.i127 = getelementptr inbounds nuw i64, ptr %add.ptr.i122, i32 %add.i126, !dbg !1255
  %19 = load i64, ptr %arrayidx.i127, align 8, !dbg !1255
  %sh_prom.i = zext nneg i32 %bits_to_shift.1.i to i64, !dbg !1256
  %shl.i128 = shl i64 %19, %sh_prom.i, !dbg !1256
  %mul12.i129 = mul nuw nsw i32 %i.0.i101, 17, !dbg !1257
  %add13.i130 = add nuw nsw i32 %mul12.i129, %c.0.i123, !dbg !1258
  %add14.i131 = add nsw i32 %k.0.i124, %words_to_shift.1.i, !dbg !1259
  %mul15.i = mul i32 %add14.i131, 80, !dbg !1260
  %add16.i = add i32 %add13.i130, %mul15.i, !dbg !1261
  %arrayidx17.i = getelementptr inbounds nuw [640 x i64], ptr %A.i, i32 0, i32 %add16.i, !dbg !1262
  %20 = load i64, ptr %arrayidx17.i, align 8, !dbg !1263
  %xor.i = xor i64 %20, %shl.i128, !dbg !1263
  store i64 %xor.i, ptr %arrayidx17.i, align 8, !dbg !1263
  %cmp18.i = icmp sgt i32 %bits_to_shift.1.i, 0, !dbg !1264
  br i1 %cmp18.i, label %if.then.i, label %for.inc.i, !dbg !1264

if.then.i:                                        ; preds = %for.body10.i
  %mul19.i = shl nuw nsw i32 %c.0.i123, 2, !dbg !1266
  %add20.i = or disjoint i32 %k.0.i124, %mul19.i, !dbg !1268
  %arrayidx21.i = getelementptr inbounds nuw i64, ptr %add.ptr.i122, i32 %add20.i, !dbg !1269
  %21 = load i64, ptr %arrayidx21.i, align 8, !dbg !1269
  %sub.i = sub nsw i32 64, %bits_to_shift.1.i, !dbg !1270
  %sh_prom22.i = zext nneg i32 %sub.i to i64, !dbg !1271
  %shr.i = lshr i64 %21, %sh_prom22.i, !dbg !1271
  %mul23.i = mul nuw nsw i32 %i.0.i101, 17, !dbg !1272
  %add24.i = add nuw nsw i32 %mul23.i, %c.0.i123, !dbg !1273
  %add25.i = add nsw i32 %k.0.i124, %words_to_shift.1.i, !dbg !1274
  %22 = mul i32 %add25.i, 80, !dbg !1275
  %mul27.i = add i32 %22, 80, !dbg !1275
  %add28.i = add i32 %add24.i, %mul27.i, !dbg !1276
  %arrayidx29.i = getelementptr inbounds nuw [640 x i64], ptr %A.i, i32 0, i32 %add28.i, !dbg !1277
  %23 = load i64, ptr %arrayidx29.i, align 8, !dbg !1278
  %xor30.i = xor i64 %23, %shr.i, !dbg !1278
  store i64 %xor30.i, ptr %arrayidx29.i, align 8, !dbg !1278
  br label %for.inc.i, !dbg !1279

for.inc.i:                                        ; preds = %if.then.i, %for.body10.i
  %inc.i132 = add nuw nsw i32 %k.0.i124, 1, !dbg !1280
    #dbg_value(i32 %inc.i132, !1248, !DIExpression(), !1249)
  br label %for.cond8.i, !dbg !1281, !llvm.loop !1282

for.inc31.i:                                      ; preds = %for.cond8.i
  %inc32.i = add nuw nsw i32 %c.0.i123, 1, !dbg !1284
    #dbg_value(i32 %inc32.i, !1236, !DIExpression(), !1238)
  br label %for.cond5.i, !dbg !1285, !llvm.loop !1286

for.end33.i:                                      ; preds = %for.cond5.i
  %cmp34.not.i = icmp eq i32 %i.0.i101, %j.0.i120, !dbg !1288
  br i1 %cmp34.not.i, label %if.end82.i, label %if.then35.i, !dbg !1288

if.then35.i:                                      ; preds = %for.end33.i
  %add.ptr38.idx.i = mul nuw nsw i32 %i.0.i101, 544, !dbg !1290
  %add.ptr38.i = getelementptr inbounds nuw i8, ptr %Mtmp, i32 %add.ptr38.idx.i, !dbg !1290
    #dbg_value(ptr %add.ptr38.i, !1292, !DIExpression(), !1202)
    #dbg_value(i32 0, !1293, !DIExpression(), !1295)
  br label %for.cond40.i, !dbg !1296

for.cond40.i:                                     ; preds = %for.inc79.i, %if.then35.i
  %c39.0.i = phi i32 [ 0, %if.then35.i ], [ %inc80.i, %for.inc79.i ], !dbg !1297
    #dbg_value(i32 %c39.0.i, !1293, !DIExpression(), !1295)
  %exitcond147 = icmp ne i32 %c39.0.i, 17, !dbg !1298
  br i1 %exitcond147, label %for.cond44.i.preheader, label %if.end82.i.loopexit, !dbg !1300

for.cond44.i.preheader:                           ; preds = %for.cond40.i
  br label %for.cond44.i, !dbg !1301

for.cond44.i:                                     ; preds = %for.cond44.i.preheader, %for.inc76.i
  %k43.0.i = phi i32 [ %inc77.i, %for.inc76.i ], [ 0, %for.cond44.i.preheader ], !dbg !1304
    #dbg_value(i32 %k43.0.i, !1305, !DIExpression(), !1306)
  %exitcond146 = icmp ne i32 %k43.0.i, 4, !dbg !1307
  br i1 %exitcond146, label %for.body46.i, label %for.inc79.i, !dbg !1301

for.body46.i:                                     ; preds = %for.cond44.i
  %mul47.i = shl nuw nsw i32 %c39.0.i, 2, !dbg !1309
  %add48.i = or disjoint i32 %k43.0.i, %mul47.i, !dbg !1311
  %arrayidx49.i = getelementptr inbounds nuw i64, ptr %add.ptr38.i, i32 %add48.i, !dbg !1312
  %24 = load i64, ptr %arrayidx49.i, align 8, !dbg !1312
  %sh_prom50.i = zext nneg i32 %bits_to_shift.1.i to i64, !dbg !1313
  %shl51.i = shl i64 %24, %sh_prom50.i, !dbg !1313
  %mul52.i = mul nsw i32 %j.0.i120, 17, !dbg !1314
  %add53.i = add nsw i32 %mul52.i, %c39.0.i, !dbg !1315
  %add54.i = add nsw i32 %k43.0.i, %words_to_shift.1.i, !dbg !1316
  %mul55.i = mul i32 %add54.i, 80, !dbg !1317
  %add56.i = add i32 %add53.i, %mul55.i, !dbg !1318
  %arrayidx57.i = getelementptr inbounds nuw [640 x i64], ptr %A.i, i32 0, i32 %add56.i, !dbg !1319
  %25 = load i64, ptr %arrayidx57.i, align 8, !dbg !1320
  %xor58.i = xor i64 %25, %shl51.i, !dbg !1320
  store i64 %xor58.i, ptr %arrayidx57.i, align 8, !dbg !1320
  %cmp59.i = icmp sgt i32 %bits_to_shift.1.i, 0, !dbg !1321
  br i1 %cmp59.i, label %if.then60.i, label %for.inc76.i, !dbg !1321

if.then60.i:                                      ; preds = %for.body46.i
  %mul61.i = shl nuw nsw i32 %c39.0.i, 2, !dbg !1323
  %add62.i = or disjoint i32 %k43.0.i, %mul61.i, !dbg !1325
  %arrayidx63.i = getelementptr inbounds nuw i64, ptr %add.ptr38.i, i32 %add62.i, !dbg !1326
  %26 = load i64, ptr %arrayidx63.i, align 8, !dbg !1326
  %sub64.i = sub nsw i32 64, %bits_to_shift.1.i, !dbg !1327
  %sh_prom65.i = zext nneg i32 %sub64.i to i64, !dbg !1328
  %shr66.i = lshr i64 %26, %sh_prom65.i, !dbg !1328
  %mul67.i = mul nsw i32 %j.0.i120, 17, !dbg !1329
  %add68.i = add nsw i32 %mul67.i, %c39.0.i, !dbg !1330
  %add69.i = add nsw i32 %k43.0.i, %words_to_shift.1.i, !dbg !1331
  %27 = mul i32 %add69.i, 80, !dbg !1332
  %mul71.i = add i32 %27, 80, !dbg !1332
  %add72.i = add i32 %add68.i, %mul71.i, !dbg !1333
  %arrayidx73.i = getelementptr inbounds nuw [640 x i64], ptr %A.i, i32 0, i32 %add72.i, !dbg !1334
  %28 = load i64, ptr %arrayidx73.i, align 8, !dbg !1335
  %xor74.i = xor i64 %28, %shr66.i, !dbg !1335
  store i64 %xor74.i, ptr %arrayidx73.i, align 8, !dbg !1335
  br label %for.inc76.i, !dbg !1336

for.inc76.i:                                      ; preds = %if.then60.i, %for.body46.i
  %inc77.i = add nuw nsw i32 %k43.0.i, 1, !dbg !1337
    #dbg_value(i32 %inc77.i, !1305, !DIExpression(), !1306)
  br label %for.cond44.i, !dbg !1338, !llvm.loop !1339

for.inc79.i:                                      ; preds = %for.cond44.i
  %inc80.i = add nuw nsw i32 %c39.0.i, 1, !dbg !1341
    #dbg_value(i32 %inc80.i, !1293, !DIExpression(), !1295)
  br label %for.cond40.i, !dbg !1342, !llvm.loop !1343

if.end82.i.loopexit:                              ; preds = %for.cond40.i
  br label %if.end82.i, !dbg !1345

if.end82.i:                                       ; preds = %if.end82.i.loopexit, %for.end33.i
  %add83.i = add nsw i32 %bits_to_shift.1.i, 4, !dbg !1345
    #dbg_value(i32 %add83.i, !1205, !DIExpression(), !1202)
  %cmp84.i = icmp eq i32 %add83.i, 64, !dbg !1346
  %inc86.i = zext i1 %cmp84.i to i32, !dbg !1346
  %spec.select.i = add nsw i32 %words_to_shift.1.i, %inc86.i, !dbg !1346
  %spec.select3.i = select i1 %cmp84.i, i32 0, i32 %add83.i, !dbg !1346
    #dbg_value(i32 %spec.select3.i, !1205, !DIExpression(), !1202)
    #dbg_value(i32 %spec.select.i, !1206, !DIExpression(), !1202)
  %dec.i = add nsw i32 %j.0.i120, -1, !dbg !1348
    #dbg_value(i32 %dec.i, !1229, !DIExpression(), !1230)
  br label %for.cond1.i119, !dbg !1349, !llvm.loop !1350

for.inc90.i:                                      ; preds = %for.cond1.i119
  %words_to_shift.1.i.lcssa = phi i32 [ %words_to_shift.1.i, %for.cond1.i119 ], !dbg !1202
  %bits_to_shift.1.i.lcssa = phi i32 [ %bits_to_shift.1.i, %for.cond1.i119 ], !dbg !1202
  %inc91.i = add nuw nsw i32 %i.0.i101, 1, !dbg !1352
    #dbg_value(i32 %inc91.i, !1213, !DIExpression(), !1215)
  br label %for.cond.i100, !dbg !1353, !llvm.loop !1354

for.cond94.i:                                     ; preds = %for.cond94.i.preheader, %transpose_16x16_nibbles.exit.i
  %c93.0.i = phi i32 [ %add100.i, %transpose_16x16_nibbles.exit.i ], [ 0, %for.cond94.i.preheader ], !dbg !1356
    #dbg_value(i32 %c93.0.i, !1357, !DIExpression(), !1358)
  %cmp96.i = icmp samesign ult i32 %c93.0.i, 400, !dbg !1359
  br i1 %cmp96.i, label %for.body97.i, label %for.end101.i, !dbg !1223

for.body97.i:                                     ; preds = %for.cond94.i
  %add.ptr98.i = getelementptr inbounds nuw i64, ptr %A.i, i32 %c93.0.i, !dbg !1361
    #dbg_value(ptr %add.ptr98.i, !1363, !DIExpression(), !1364)
    #dbg_value(i32 0, !1366, !DIExpression(), !1368)
  br label %for.cond.i31.i, !dbg !1369

for.cond.i31.i:                                   ; preds = %for.body.i35.i, %for.body97.i
  %i.0.i32.i = phi i32 [ 0, %for.body97.i ], [ %add7.i.i, %for.body.i35.i ], !dbg !1370
    #dbg_value(i32 %i.0.i32.i, !1366, !DIExpression(), !1368)
  %cmp.i33.i = icmp samesign ult i32 %i.0.i32.i, 16, !dbg !1371
  br i1 %cmp.i33.i, label %for.body.i35.i, label %for.cond9.i.i.preheader, !dbg !1373

for.cond9.i.i.preheader:                          ; preds = %for.cond.i31.i
  br label %for.cond9.i.i, !dbg !1374

for.body.i35.i:                                   ; preds = %for.cond.i31.i
  %arrayidx.i36.i = getelementptr inbounds nuw i64, ptr %add.ptr98.i, i32 %i.0.i32.i, !dbg !1376
  %29 = load i64, ptr %arrayidx.i36.i, align 8, !dbg !1376
  %shr.i.i = lshr i64 %29, 4, !dbg !1378
  %add.i.i = or disjoint i32 %i.0.i32.i, 1, !dbg !1379
  %arrayidx1.i.i = getelementptr inbounds nuw i64, ptr %add.ptr98.i, i32 %add.i.i, !dbg !1380
  %30 = load i64, ptr %arrayidx1.i.i, align 8, !dbg !1380
  %xor.i.i = xor i64 %shr.i.i, %30, !dbg !1381
  %and.i.i = and i64 %xor.i.i, 1085102592571150095, !dbg !1382
    #dbg_value(i64 %and.i.i, !1383, !DIExpression(), !1384)
  %shl.i.i = shl nuw i64 %and.i.i, 4, !dbg !1385
  %arrayidx2.i37.i = getelementptr inbounds nuw i64, ptr %add.ptr98.i, i32 %i.0.i32.i, !dbg !1386
  %31 = load i64, ptr %arrayidx2.i37.i, align 8, !dbg !1387
  %xor3.i.i = xor i64 %31, %shl.i.i, !dbg !1387
  store i64 %xor3.i.i, ptr %arrayidx2.i37.i, align 8, !dbg !1387
  %add4.i.i = or disjoint i32 %i.0.i32.i, 1, !dbg !1388
  %arrayidx5.i.i = getelementptr inbounds nuw i64, ptr %add.ptr98.i, i32 %add4.i.i, !dbg !1389
  %32 = load i64, ptr %arrayidx5.i.i, align 8, !dbg !1390
  %xor6.i.i = xor i64 %32, %and.i.i, !dbg !1390
  store i64 %xor6.i.i, ptr %arrayidx5.i.i, align 8, !dbg !1390
  %add7.i.i = add nuw nsw i32 %i.0.i32.i, 2, !dbg !1391
    #dbg_value(i32 %add7.i.i, !1366, !DIExpression(), !1368)
  br label %for.cond.i31.i, !dbg !1392, !llvm.loop !1393

for.cond9.i.i:                                    ; preds = %for.cond9.i.i.preheader, %for.body11.i.i
  %i8.0.i.i = phi i32 [ %add39.i.i, %for.body11.i.i ], [ 0, %for.cond9.i.i.preheader ], !dbg !1395
    #dbg_value(i32 %i8.0.i.i, !1396, !DIExpression(), !1397)
  %cmp10.i.i = icmp samesign ult i32 %i8.0.i.i, 16, !dbg !1398
  br i1 %cmp10.i.i, label %for.body11.i.i, label %for.cond42.i.i.preheader, !dbg !1374

for.cond42.i.i.preheader:                         ; preds = %for.cond9.i.i
  br label %for.cond42.i.i, !dbg !1400

for.body11.i.i:                                   ; preds = %for.cond9.i.i
  %arrayidx12.i.i = getelementptr inbounds nuw i64, ptr %add.ptr98.i, i32 %i8.0.i.i, !dbg !1402
  %33 = load i64, ptr %arrayidx12.i.i, align 8, !dbg !1402
  %shr13.i.i = lshr i64 %33, 8, !dbg !1404
  %add14.i.i = or disjoint i32 %i8.0.i.i, 2, !dbg !1405
  %arrayidx15.i.i = getelementptr inbounds nuw i64, ptr %add.ptr98.i, i32 %add14.i.i, !dbg !1406
  %34 = load i64, ptr %arrayidx15.i.i, align 8, !dbg !1406
  %xor16.i.i = xor i64 %shr13.i.i, %34, !dbg !1407
  %and17.i.i = and i64 %xor16.i.i, 71777214294589695, !dbg !1408
    #dbg_value(i64 %and17.i.i, !1409, !DIExpression(), !1410)
  %add18.i.i = or disjoint i32 %i8.0.i.i, 1, !dbg !1411
  %arrayidx19.i.i = getelementptr inbounds nuw i64, ptr %add.ptr98.i, i32 %add18.i.i, !dbg !1412
  %35 = load i64, ptr %arrayidx19.i.i, align 8, !dbg !1412
  %shr20.i.i = lshr i64 %35, 8, !dbg !1413
  %add21.i.i = or disjoint i32 %i8.0.i.i, 3, !dbg !1414
  %arrayidx22.i.i = getelementptr inbounds nuw i64, ptr %add.ptr98.i, i32 %add21.i.i, !dbg !1415
  %36 = load i64, ptr %arrayidx22.i.i, align 8, !dbg !1415
  %xor23.i.i = xor i64 %shr20.i.i, %36, !dbg !1416
  %and24.i.i = and i64 %xor23.i.i, 71777214294589695, !dbg !1417
    #dbg_value(i64 %and24.i.i, !1418, !DIExpression(), !1410)
  %shl25.i.i = shl nuw i64 %and17.i.i, 8, !dbg !1419
  %arrayidx26.i.i = getelementptr inbounds nuw i64, ptr %add.ptr98.i, i32 %i8.0.i.i, !dbg !1420
  %37 = load i64, ptr %arrayidx26.i.i, align 8, !dbg !1421
  %xor27.i.i = xor i64 %37, %shl25.i.i, !dbg !1421
  store i64 %xor27.i.i, ptr %arrayidx26.i.i, align 8, !dbg !1421
  %shl28.i.i = shl nuw i64 %and24.i.i, 8, !dbg !1422
  %add29.i.i = or disjoint i32 %i8.0.i.i, 1, !dbg !1423
  %arrayidx30.i.i = getelementptr inbounds nuw i64, ptr %add.ptr98.i, i32 %add29.i.i, !dbg !1424
  %38 = load i64, ptr %arrayidx30.i.i, align 8, !dbg !1425
  %xor31.i.i = xor i64 %38, %shl28.i.i, !dbg !1425
  store i64 %xor31.i.i, ptr %arrayidx30.i.i, align 8, !dbg !1425
  %add32.i.i = or disjoint i32 %i8.0.i.i, 2, !dbg !1426
  %arrayidx33.i.i = getelementptr inbounds nuw i64, ptr %add.ptr98.i, i32 %add32.i.i, !dbg !1427
  %39 = load i64, ptr %arrayidx33.i.i, align 8, !dbg !1428
  %xor34.i.i = xor i64 %39, %and17.i.i, !dbg !1428
  store i64 %xor34.i.i, ptr %arrayidx33.i.i, align 8, !dbg !1428
  %add35.i.i = or disjoint i32 %i8.0.i.i, 3, !dbg !1429
  %arrayidx36.i.i = getelementptr inbounds nuw i64, ptr %add.ptr98.i, i32 %add35.i.i, !dbg !1430
  %40 = load i64, ptr %arrayidx36.i.i, align 8, !dbg !1431
  %xor37.i.i = xor i64 %40, %and24.i.i, !dbg !1431
  store i64 %xor37.i.i, ptr %arrayidx36.i.i, align 8, !dbg !1431
  %add39.i.i = add nuw nsw i32 %i8.0.i.i, 4, !dbg !1432
    #dbg_value(i32 %add39.i.i, !1396, !DIExpression(), !1397)
  br label %for.cond9.i.i, !dbg !1433, !llvm.loop !1434

for.cond42.i.i:                                   ; preds = %for.cond42.i.i.preheader, %for.body44.i.i
  %i41.0.i.i = phi i32 [ %inc.i34.i, %for.body44.i.i ], [ 0, %for.cond42.i.i.preheader ], !dbg !1436
    #dbg_value(i32 %i41.0.i.i, !1437, !DIExpression(), !1438)
  %exitcond149 = icmp ne i32 %i41.0.i.i, 4, !dbg !1439
  br i1 %exitcond149, label %for.body44.i.i, label %for.cond76.i.i.preheader, !dbg !1400

for.cond76.i.i.preheader:                         ; preds = %for.cond42.i.i
  br label %for.cond76.i.i, !dbg !1441

for.body44.i.i:                                   ; preds = %for.cond42.i.i
  %arrayidx46.i.i = getelementptr inbounds nuw i64, ptr %add.ptr98.i, i32 %i41.0.i.i, !dbg !1443
  %41 = load i64, ptr %arrayidx46.i.i, align 8, !dbg !1443
  %shr47.i.i = lshr i64 %41, 16, !dbg !1445
  %add48.i.i = or disjoint i32 %i41.0.i.i, 4, !dbg !1446
  %arrayidx49.i.i = getelementptr inbounds nuw i64, ptr %add.ptr98.i, i32 %add48.i.i, !dbg !1447
  %42 = load i64, ptr %arrayidx49.i.i, align 8, !dbg !1447
  %xor50.i.i = xor i64 %shr47.i.i, %42, !dbg !1448
  %and51.i.i = and i64 %xor50.i.i, 281470681808895, !dbg !1449
    #dbg_value(i64 %and51.i.i, !1450, !DIExpression(), !1451)
  %add53.i.i = or disjoint i32 %i41.0.i.i, 8, !dbg !1452
  %arrayidx54.i.i = getelementptr inbounds nuw i64, ptr %add.ptr98.i, i32 %add53.i.i, !dbg !1453
  %43 = load i64, ptr %arrayidx54.i.i, align 8, !dbg !1453
  %shr55.i.i = lshr i64 %43, 16, !dbg !1454
  %add56.i.i = or disjoint i32 %i41.0.i.i, 12, !dbg !1455
  %arrayidx57.i.i = getelementptr inbounds nuw i64, ptr %add.ptr98.i, i32 %add56.i.i, !dbg !1456
  %44 = load i64, ptr %arrayidx57.i.i, align 8, !dbg !1456
  %xor58.i.i = xor i64 %shr55.i.i, %44, !dbg !1457
  %and59.i.i = and i64 %xor58.i.i, 281470681808895, !dbg !1458
    #dbg_value(i64 %and59.i.i, !1459, !DIExpression(), !1451)
  %shl60.i.i = shl nuw i64 %and51.i.i, 16, !dbg !1460
  %arrayidx61.i.i = getelementptr inbounds nuw i64, ptr %add.ptr98.i, i32 %i41.0.i.i, !dbg !1461
  %45 = load i64, ptr %arrayidx61.i.i, align 8, !dbg !1462
  %xor62.i.i = xor i64 %45, %shl60.i.i, !dbg !1462
  store i64 %xor62.i.i, ptr %arrayidx61.i.i, align 8, !dbg !1462
  %shl63.i.i = shl nuw i64 %and59.i.i, 16, !dbg !1463
  %add64.i.i = or disjoint i32 %i41.0.i.i, 8, !dbg !1464
  %arrayidx65.i.i = getelementptr inbounds nuw i64, ptr %add.ptr98.i, i32 %add64.i.i, !dbg !1465
  %46 = load i64, ptr %arrayidx65.i.i, align 8, !dbg !1466
  %xor66.i.i = xor i64 %46, %shl63.i.i, !dbg !1466
  store i64 %xor66.i.i, ptr %arrayidx65.i.i, align 8, !dbg !1466
  %add67.i.i = or disjoint i32 %i41.0.i.i, 4, !dbg !1467
  %arrayidx68.i.i = getelementptr inbounds nuw i64, ptr %add.ptr98.i, i32 %add67.i.i, !dbg !1468
  %47 = load i64, ptr %arrayidx68.i.i, align 8, !dbg !1469
  %xor69.i.i = xor i64 %47, %and51.i.i, !dbg !1469
  store i64 %xor69.i.i, ptr %arrayidx68.i.i, align 8, !dbg !1469
  %add70.i.i = or disjoint i32 %i41.0.i.i, 12, !dbg !1470
  %arrayidx71.i.i = getelementptr inbounds nuw i64, ptr %add.ptr98.i, i32 %add70.i.i, !dbg !1471
  %48 = load i64, ptr %arrayidx71.i.i, align 8, !dbg !1472
  %xor72.i.i = xor i64 %48, %and59.i.i, !dbg !1472
  store i64 %xor72.i.i, ptr %arrayidx71.i.i, align 8, !dbg !1472
  %inc.i34.i = add nuw nsw i32 %i41.0.i.i, 1, !dbg !1473
    #dbg_value(i32 %inc.i34.i, !1437, !DIExpression(), !1438)
  br label %for.cond42.i.i, !dbg !1474, !llvm.loop !1475

for.cond76.i.i:                                   ; preds = %for.cond76.i.i.preheader, %for.body78.i.i
  %i75.0.i.i = phi i32 [ %inc93.i.i, %for.body78.i.i ], [ 0, %for.cond76.i.i.preheader ], !dbg !1477
    #dbg_value(i32 %i75.0.i.i, !1478, !DIExpression(), !1479)
  %exitcond150 = icmp ne i32 %i75.0.i.i, 8, !dbg !1480
  br i1 %exitcond150, label %for.body78.i.i, label %transpose_16x16_nibbles.exit.i, !dbg !1441

for.body78.i.i:                                   ; preds = %for.cond76.i.i
  %arrayidx80.i.i = getelementptr inbounds nuw i64, ptr %add.ptr98.i, i32 %i75.0.i.i, !dbg !1482
  %49 = load i64, ptr %arrayidx80.i.i, align 8, !dbg !1482
  %shr81.i.i = lshr i64 %49, 32, !dbg !1484
  %add82.i.i = or disjoint i32 %i75.0.i.i, 8, !dbg !1485
  %arrayidx83.i.i = getelementptr inbounds nuw i64, ptr %add.ptr98.i, i32 %add82.i.i, !dbg !1486
  %50 = load i64, ptr %arrayidx83.i.i, align 8, !dbg !1486
  %.masked.i.i = and i64 %50, 4294967295, !dbg !1487
  %and85.i.i = xor i64 %shr81.i.i, %.masked.i.i, !dbg !1487
    #dbg_value(i64 %and85.i.i, !1488, !DIExpression(), !1489)
  %shl86.i.i = shl nuw i64 %and85.i.i, 32, !dbg !1490
  %arrayidx87.i.i = getelementptr inbounds nuw i64, ptr %add.ptr98.i, i32 %i75.0.i.i, !dbg !1491
  %51 = load i64, ptr %arrayidx87.i.i, align 8, !dbg !1492
  %xor88.i.i = xor i64 %51, %shl86.i.i, !dbg !1492
  store i64 %xor88.i.i, ptr %arrayidx87.i.i, align 8, !dbg !1492
  %add89.i.i = or disjoint i32 %i75.0.i.i, 8, !dbg !1493
  %arrayidx90.i.i = getelementptr inbounds nuw i64, ptr %add.ptr98.i, i32 %add89.i.i, !dbg !1494
  %52 = load i64, ptr %arrayidx90.i.i, align 8, !dbg !1495
  %xor91.i.i = xor i64 %52, %and85.i.i, !dbg !1495
  store i64 %xor91.i.i, ptr %arrayidx90.i.i, align 8, !dbg !1495
  %inc93.i.i = add nuw nsw i32 %i75.0.i.i, 1, !dbg !1496
    #dbg_value(i32 %inc93.i.i, !1478, !DIExpression(), !1479)
  br label %for.cond76.i.i, !dbg !1497, !llvm.loop !1498

transpose_16x16_nibbles.exit.i:                   ; preds = %for.cond76.i.i
  %add100.i = add nuw nsw i32 %c93.0.i, 16, !dbg !1500
    #dbg_value(i32 %add100.i, !1357, !DIExpression(), !1358)
  br label %for.cond94.i, !dbg !1501, !llvm.loop !1502

for.end101.i:                                     ; preds = %for.cond94.i
    #dbg_declare(ptr %tab.i, !1504, !DIExpression(), !1508)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(16) %tab.i, i8 0, i32 16, i1 false), !dbg !1508
    #dbg_value(i32 0, !1509, !DIExpression(), !1511)
  br label %for.cond103.i, !dbg !1512

for.cond103.i:                                    ; preds = %for.body105.i, %for.end101.i
  %i102.0.i = phi i32 [ 0, %for.end101.i ], [ %inc125.i, %for.body105.i ], !dbg !1513
    #dbg_value(i32 %i102.0.i, !1509, !DIExpression(), !1511)
  %exitcond151 = icmp ne i32 %i102.0.i, 4, !dbg !1514
  br i1 %exitcond151, label %for.body105.i, label %for.cond128.i.preheader, !dbg !1516

for.cond128.i.preheader:                          ; preds = %for.cond103.i
  br label %for.cond128.i, !dbg !1517

for.body105.i:                                    ; preds = %for.cond103.i
  %arrayidx106.i = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %i102.0.i, !dbg !1519
  %53 = load i8, ptr %arrayidx106.i, align 1, !dbg !1519
    #dbg_value(i8 %53, !1521, !DIExpression(), !1525)
    #dbg_value(i8 1, !1527, !DIExpression(), !1525)
  %54 = load volatile i8, ptr @pqmayo_MAYO_2_ref_unsigned_char_blocker, align 1, !dbg !1528
  %xor1.i4.i = xor i8 %53, %54, !dbg !1529
    #dbg_value(i8 %xor1.i4.i, !1521, !DIExpression(), !1525)
    #dbg_value(i8 poison, !1530, !DIExpression(), !1525)
    #dbg_value(i8 %xor1.i4.i, !1530, !DIExpression(DW_OP_constu, 3, DW_OP_and, DW_OP_stack_value), !1525)
    #dbg_value(i8 %xor1.i4.i, !1530, !DIExpression(DW_OP_constu, 7, DW_OP_and, DW_OP_stack_value), !1525)
  %xor25.i11.i = and i8 %xor1.i4.i, 15, !dbg !1531
    #dbg_value(i8 %xor25.i11.i, !1530, !DIExpression(), !1525)
    #dbg_value(i8 %xor25.i11.i, !1532, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !1525)
    #dbg_value(i8 %xor25.i11.i, !1533, !DIExpression(), !1525)
  %mul107.i = shl nuw nsw i32 %i102.0.i, 2, !dbg !1534
  %arrayidx108.i = getelementptr inbounds nuw [16 x i8], ptr %tab.i, i32 0, i32 %mul107.i, !dbg !1535
  store i8 %xor25.i11.i, ptr %arrayidx108.i, align 1, !dbg !1536
    #dbg_value(i8 %53, !1521, !DIExpression(), !1537)
    #dbg_value(i8 2, !1527, !DIExpression(), !1537)
  %55 = load volatile i8, ptr @pqmayo_MAYO_2_ref_unsigned_char_blocker, align 1, !dbg !1539
  %xor1.i13.i = xor i8 %53, %55, !dbg !1540
    #dbg_value(i8 %xor1.i13.i, !1521, !DIExpression(), !1537)
  %56 = trunc i8 %xor1.i13.i to i1, !dbg !1541
    #dbg_value(i8 poison, !1530, !DIExpression(), !1537)
  %57 = shl i8 %xor1.i13.i, 1, !dbg !1542
  %mul9.i14.i = and i8 %57, 4, !dbg !1542
  %conv10.i15.i = select i1 %56, i8 2, i8 0, !dbg !1541
  %xor11.i16.i = or disjoint i8 %conv10.i15.i, %mul9.i14.i, !dbg !1543
    #dbg_value(i8 %xor11.i16.i, !1530, !DIExpression(), !1537)
  %58 = shl i8 %xor1.i13.i, 1, !dbg !1544
  %mul16.i17.i = and i8 %58, 8, !dbg !1544
  %xor18.i18.i = or disjoint i8 %mul16.i17.i, %xor11.i16.i, !dbg !1545
    #dbg_value(i8 %xor18.i18.i, !1530, !DIExpression(), !1537)
  %59 = shl i8 %xor1.i13.i, 1, !dbg !1546
  %mul23.i19.i = and i8 %59, 16, !dbg !1546
    #dbg_value(!DIArgList(i8 %59, i8 %xor18.i18.i), !1530, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_constu, 16, DW_OP_and, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value), !1537)
    #dbg_value(!DIArgList(i8 %59, i8 %xor18.i18.i), !1532, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_constu, 16, DW_OP_and, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !1537)
  %60 = lshr exact i8 %mul23.i19.i, 4, !dbg !1547
  %61 = lshr exact i8 %mul23.i19.i, 3, !dbg !1548
  %62 = or disjoint i8 %60, %61, !dbg !1549
  %63 = xor i8 %62, %xor18.i18.i, !dbg !1550
    #dbg_value(i8 %63, !1533, !DIExpression(), !1537)
  %mul111.i = shl nuw nsw i32 %i102.0.i, 2, !dbg !1551
  %add112.i = or disjoint i32 %mul111.i, 1, !dbg !1552
  %arrayidx113.i = getelementptr inbounds nuw [16 x i8], ptr %tab.i, i32 0, i32 %add112.i, !dbg !1553
  store i8 %63, ptr %arrayidx113.i, align 1, !dbg !1554
  %arrayidx114.i = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %i102.0.i, !dbg !1555
  %64 = load i8, ptr %arrayidx114.i, align 1, !dbg !1555
    #dbg_value(i8 %64, !1521, !DIExpression(), !1556)
    #dbg_value(i8 4, !1527, !DIExpression(), !1556)
  %65 = load volatile i8, ptr @pqmayo_MAYO_2_ref_unsigned_char_blocker, align 1, !dbg !1558
  %xor1.i22.i = xor i8 %64, %65, !dbg !1559
    #dbg_value(i8 %xor1.i22.i, !1521, !DIExpression(), !1556)
  %66 = trunc i8 %xor1.i22.i to i1, !dbg !1560
    #dbg_value(i8 poison, !1530, !DIExpression(), !1556)
  %67 = shl i8 %xor1.i22.i, 2, !dbg !1561
  %mul9.i23.i = and i8 %67, 8, !dbg !1561
  %conv10.i24.i = select i1 %66, i8 4, i8 0, !dbg !1560
  %xor11.i25.i = or disjoint i8 %conv10.i24.i, %mul9.i23.i, !dbg !1562
    #dbg_value(!DIArgList(i8 %conv10.i24.i, i8 %mul9.i23.i), !1530, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value), !1556)
  %68 = shl i8 %xor1.i22.i, 2, !dbg !1563
  %mul16.i26.i = and i8 %68, 16, !dbg !1563
    #dbg_value(!DIArgList(i8 %mul16.i26.i, i8 %conv10.i24.i, i8 %mul9.i23.i), !1530, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_or, DW_OP_or, DW_OP_stack_value), !1556)
  %69 = shl i8 %xor1.i22.i, 2, !dbg !1564
  %mul23.i28.i = and i8 %69, 32, !dbg !1564
  %70 = or disjoint i8 %mul16.i26.i, %mul23.i28.i, !dbg !1565
    #dbg_value(!DIArgList(i8 %mul23.i28.i, i8 %mul16.i26.i, i8 %conv10.i24.i, i8 %mul9.i23.i), !1530, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_or, DW_OP_or, DW_OP_or, DW_OP_stack_value), !1556)
    #dbg_value(!DIArgList(i8 %mul23.i28.i, i8 %mul16.i26.i, i8 %conv10.i24.i, i8 %mul9.i23.i), !1532, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_LLVM_arg, 3, DW_OP_or, DW_OP_or, DW_OP_or, DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !1556)
  %71 = lshr exact i8 %70, 4, !dbg !1566
  %72 = lshr exact i8 %70, 3, !dbg !1567
  %73 = xor i8 %71, %72, !dbg !1568
  %74 = xor i8 %73, %xor11.i25.i, !dbg !1569
    #dbg_value(i8 %74, !1533, !DIExpression(), !1556)
  %mul116.i = shl nuw nsw i32 %i102.0.i, 2, !dbg !1570
  %add117.i = or disjoint i32 %mul116.i, 2, !dbg !1571
  %arrayidx118.i = getelementptr inbounds nuw [16 x i8], ptr %tab.i, i32 0, i32 %add117.i, !dbg !1572
  store i8 %74, ptr %arrayidx118.i, align 1, !dbg !1573
  %arrayidx119.i = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %i102.0.i, !dbg !1574
  %75 = load i8, ptr %arrayidx119.i, align 1, !dbg !1574
    #dbg_value(i8 %75, !1521, !DIExpression(), !1575)
    #dbg_value(i8 8, !1527, !DIExpression(), !1575)
  %76 = load volatile i8, ptr @pqmayo_MAYO_2_ref_unsigned_char_blocker, align 1, !dbg !1577
  %xor1.i.i110 = xor i8 %75, %76, !dbg !1578
    #dbg_value(i8 %xor1.i.i110, !1521, !DIExpression(), !1575)
  %77 = trunc i8 %xor1.i.i110 to i1, !dbg !1579
    #dbg_value(i8 poison, !1530, !DIExpression(), !1575)
  %78 = shl i8 %xor1.i.i110, 3, !dbg !1580
  %mul9.i.i111 = and i8 %78, 16, !dbg !1580
  %conv10.i.i112 = select i1 %77, i8 8, i8 0, !dbg !1579
    #dbg_value(!DIArgList(i8 poison, i8 poison), !1530, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value), !1575)
  %79 = shl i8 %xor1.i.i110, 3, !dbg !1581
  %mul16.i.i114 = and i8 %79, 32, !dbg !1581
  %80 = or disjoint i8 %mul9.i.i111, %mul16.i.i114, !dbg !1582
    #dbg_value(!DIArgList(i8 poison, i8 poison), !1530, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_stack_value), !1575)
  %81 = shl i8 %xor1.i.i110, 3, !dbg !1583
  %mul23.i.i116 = and i8 %81, 64, !dbg !1583
  %82 = or disjoint i8 %80, %mul23.i.i116, !dbg !1584
    #dbg_value(!DIArgList(i8 poison, i8 poison, i8 poison), !1530, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_or, DW_OP_or, DW_OP_stack_value), !1575)
    #dbg_value(!DIArgList(i8 poison, i8 poison, i8 poison), !1532, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_LLVM_arg, 2, DW_OP_or, DW_OP_or, DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !1575)
  %83 = lshr exact i8 %82, 4, !dbg !1585
  %84 = lshr exact i8 %82, 3, !dbg !1586
  %85 = xor i8 %83, %84, !dbg !1587
  %86 = xor i8 %85, %conv10.i.i112, !dbg !1588
    #dbg_value(i8 %86, !1533, !DIExpression(), !1575)
  %mul121.i = shl nuw nsw i32 %i102.0.i, 2, !dbg !1589
  %add122.i = or disjoint i32 %mul121.i, 3, !dbg !1590
  %arrayidx123.i = getelementptr inbounds nuw [16 x i8], ptr %tab.i, i32 0, i32 %add122.i, !dbg !1591
  store i8 %86, ptr %arrayidx123.i, align 1, !dbg !1592
  %inc125.i = add nuw nsw i32 %i102.0.i, 1, !dbg !1593
    #dbg_value(i32 %inc125.i, !1509, !DIExpression(), !1511)
  br label %for.cond103.i, !dbg !1594, !llvm.loop !1595

for.cond128.i:                                    ; preds = %for.cond128.i.preheader, %for.inc189.i
  %c127.0.i = phi i32 [ %add190.i, %for.inc189.i ], [ 0, %for.cond128.i.preheader ], !dbg !1597
    #dbg_value(i32 %c127.0.i, !1598, !DIExpression(), !1599)
  %cmp129.i = icmp samesign ult i32 %c127.0.i, 80, !dbg !1600
  br i1 %cmp129.i, label %for.cond131.i.preheader, label %for.cond193.i.preheader, !dbg !1517

for.cond193.i.preheader:                          ; preds = %for.cond128.i
  br label %for.cond193.i, !dbg !1602

for.cond131.i.preheader:                          ; preds = %for.cond128.i
  br label %for.cond131.i, !dbg !1604

for.cond131.i:                                    ; preds = %for.cond131.i.preheader, %for.inc186.i
  %r.0.i109 = phi i32 [ %inc187.i, %for.inc186.i ], [ 64, %for.cond131.i.preheader ], !dbg !1607
    #dbg_value(i32 %r.0.i109, !1608, !DIExpression(), !1609)
  %exitcond153 = icmp ne i32 %r.0.i109, 74, !dbg !1610
  br i1 %exitcond153, label %for.body133.i, label %for.inc189.i, !dbg !1604

for.body133.i:                                    ; preds = %for.cond131.i
  %div1.i = lshr i32 %r.0.i109, 4, !dbg !1612
  %mul134.i = mul nuw nsw i32 %div1.i, 80, !dbg !1614
  %add135.i = add nuw nsw i32 %mul134.i, %c127.0.i, !dbg !1615
  %rem.i = and i32 %r.0.i109, 15, !dbg !1616
  %add136.i = or disjoint i32 %add135.i, %rem.i, !dbg !1617
    #dbg_value(i32 %add136.i, !1618, !DIExpression(), !1619)
  %arrayidx137.i = getelementptr inbounds nuw [640 x i64], ptr %A.i, i32 0, i32 %add136.i, !dbg !1620
  %87 = load i64, ptr %arrayidx137.i, align 8, !dbg !1620
  %and.i = and i64 %87, 1229782938247303441, !dbg !1621
    #dbg_value(i64 %and.i, !1622, !DIExpression(), !1619)
  %shr139.i = lshr i64 %87, 1, !dbg !1623
  %and140.i = and i64 %shr139.i, 1229782938247303441, !dbg !1624
    #dbg_value(i64 %and140.i, !1625, !DIExpression(), !1619)
  %shr142.i = lshr i64 %87, 2, !dbg !1626
  %and143.i = and i64 %shr142.i, 1229782938247303441, !dbg !1627
    #dbg_value(i64 %and143.i, !1628, !DIExpression(), !1619)
  %arrayidx144.i = getelementptr inbounds nuw [640 x i64], ptr %A.i, i32 0, i32 %add136.i, !dbg !1629
  %88 = load i64, ptr %arrayidx144.i, align 8, !dbg !1629
  %shr145.i = lshr i64 %88, 3, !dbg !1630
  %and146.i = and i64 %shr145.i, 1229782938247303441, !dbg !1631
    #dbg_value(i64 %and146.i, !1632, !DIExpression(), !1619)
    #dbg_value(i32 0, !1633, !DIExpression(), !1635)
  br label %for.cond147.i, !dbg !1636

for.cond147.i:                                    ; preds = %for.body149.i, %for.body133.i
  %t.0.i = phi i32 [ 0, %for.body133.i ], [ %inc184.i, %for.body149.i ], !dbg !1637
    #dbg_value(i32 %t.0.i, !1633, !DIExpression(), !1635)
  %exitcond152 = icmp ne i32 %t.0.i, 4, !dbg !1638
  br i1 %exitcond152, label %for.body149.i, label %for.inc186.i, !dbg !1640

for.body149.i:                                    ; preds = %for.cond147.i
  %mul150.i = shl nuw nsw i32 %t.0.i, 2, !dbg !1641
  %arrayidx152.i = getelementptr inbounds nuw [16 x i8], ptr %tab.i, i32 0, i32 %mul150.i, !dbg !1643
  %89 = load i8, ptr %arrayidx152.i, align 1, !dbg !1643
  %conv.i = zext i8 %89 to i64, !dbg !1643
  %mul153.i = mul i64 %and.i, %conv.i, !dbg !1644
  %mul154.i = shl nuw nsw i32 %t.0.i, 2, !dbg !1645
  %add155.i = or disjoint i32 %mul154.i, 1, !dbg !1646
  %arrayidx156.i = getelementptr inbounds nuw [16 x i8], ptr %tab.i, i32 0, i32 %add155.i, !dbg !1647
  %90 = load i8, ptr %arrayidx156.i, align 1, !dbg !1647
  %conv157.i = zext i8 %90 to i64, !dbg !1647
  %mul158.i = mul i64 %and140.i, %conv157.i, !dbg !1648
  %xor159.i = xor i64 %mul153.i, %mul158.i, !dbg !1649
  %mul160.i = shl nuw nsw i32 %t.0.i, 2, !dbg !1650
  %add161.i = or disjoint i32 %mul160.i, 2, !dbg !1651
  %arrayidx162.i = getelementptr inbounds nuw [16 x i8], ptr %tab.i, i32 0, i32 %add161.i, !dbg !1652
  %91 = load i8, ptr %arrayidx162.i, align 1, !dbg !1652
  %conv163.i = zext i8 %91 to i64, !dbg !1652
  %mul164.i = mul i64 %and143.i, %conv163.i, !dbg !1653
  %xor165.i = xor i64 %xor159.i, %mul164.i, !dbg !1654
  %mul166.i = shl nuw nsw i32 %t.0.i, 2, !dbg !1655
  %add167.i = or disjoint i32 %mul166.i, 3, !dbg !1656
  %arrayidx168.i = getelementptr inbounds nuw [16 x i8], ptr %tab.i, i32 0, i32 %add167.i, !dbg !1657
  %92 = load i8, ptr %arrayidx168.i, align 1, !dbg !1657
  %conv169.i = zext i8 %92 to i64, !dbg !1657
  %mul170.i = mul i64 %and146.i, %conv169.i, !dbg !1658
  %xor171.i = xor i64 %xor165.i, %mul170.i, !dbg !1659
  %add172.i = add nuw nsw i32 %r.0.i109, %t.0.i, !dbg !1660
  %sub173.i = add nsw i32 %add172.i, -64, !dbg !1661
  %div1742.i = lshr i32 %sub173.i, 4, !dbg !1662
  %mul175.i = mul i32 %div1742.i, 80, !dbg !1663
  %add176.i = add i32 %mul175.i, %c127.0.i, !dbg !1664
  %add177.i = add nuw nsw i32 %r.0.i109, %t.0.i, !dbg !1665
  %rem179.i = and i32 %add177.i, 15, !dbg !1666
  %add180.i = or disjoint i32 %add176.i, %rem179.i, !dbg !1667
  %arrayidx181.i = getelementptr inbounds nuw [640 x i64], ptr %A.i, i32 0, i32 %add180.i, !dbg !1668
  %93 = load i64, ptr %arrayidx181.i, align 8, !dbg !1669
  %xor182.i = xor i64 %93, %xor171.i, !dbg !1669
  store i64 %xor182.i, ptr %arrayidx181.i, align 8, !dbg !1669
  %inc184.i = add nuw nsw i32 %t.0.i, 1, !dbg !1670
    #dbg_value(i32 %inc184.i, !1633, !DIExpression(), !1635)
  br label %for.cond147.i, !dbg !1671, !llvm.loop !1672

for.inc186.i:                                     ; preds = %for.cond147.i
  %inc187.i = add nuw nsw i32 %r.0.i109, 1, !dbg !1674
    #dbg_value(i32 %inc187.i, !1608, !DIExpression(), !1609)
  br label %for.cond131.i, !dbg !1675, !llvm.loop !1676

for.inc189.i:                                     ; preds = %for.cond131.i
  %add190.i = add nuw nsw i32 %c127.0.i, 16, !dbg !1678
    #dbg_value(i32 %add190.i, !1598, !DIExpression(), !1599)
  br label %for.cond128.i, !dbg !1679, !llvm.loop !1680

for.cond193.i:                                    ; preds = %for.cond193.i.preheader, %for.inc227.i
  %indvars.iv154 = phi i32 [ 64, %for.cond193.i.preheader ], [ %indvars.iv.next155, %for.inc227.i ], !dbg !1682
  %r192.0.i = phi i32 [ %add228.i, %for.inc227.i ], [ 0, %for.cond193.i.preheader ], !dbg !1682
    #dbg_value(i32 %r192.0.i, !1683, !DIExpression(), !1684)
  %cmp194.i = icmp samesign ult i32 %r192.0.i, 64, !dbg !1685
  br i1 %cmp194.i, label %for.cond198.i.preheader, label %compute_A.exit, !dbg !1602

for.cond198.i.preheader:                          ; preds = %for.cond193.i
  br label %for.cond198.i, !dbg !1687

for.cond198.i:                                    ; preds = %for.cond198.i.preheader, %for.inc224.i
  %c197.0.i = phi i32 [ %add225.i, %for.inc224.i ], [ 0, %for.cond198.i.preheader ], !dbg !1690
    #dbg_value(i32 %c197.0.i, !1691, !DIExpression(), !1692)
  %cmp199.i = icmp samesign ult i32 %c197.0.i, 68, !dbg !1693
  br i1 %cmp199.i, label %for.cond203.i.preheader, label %for.inc227.i, !dbg !1687

for.cond203.i.preheader:                          ; preds = %for.cond198.i
  br label %for.cond203.i, !dbg !1695

for.cond203.i:                                    ; preds = %for.cond203.i.preheader, %decode.exit.i
  %i202.0.i = phi i32 [ %inc222.i, %decode.exit.i ], [ 0, %for.cond203.i.preheader ], !dbg !1698
    #dbg_value(i32 %i202.0.i, !1699, !DIExpression(), !1700)
  %exitcond156 = icmp ne i32 %i202.0.i, %indvars.iv154, !dbg !1701
  br i1 %exitcond156, label %for.body207.i, label %for.inc224.i, !dbg !1695

for.body207.i:                                    ; preds = %for.cond203.i
  %div209.i = mul nuw nsw i32 %r192.0.i, 5, !dbg !1703
  %add210.i = add nuw nsw i32 %div209.i, %c197.0.i, !dbg !1705
  %add211.i = add nuw nsw i32 %add210.i, %i202.0.i, !dbg !1706
  %arrayidx212.i = getelementptr inbounds nuw [640 x i64], ptr %A.i, i32 0, i32 %add211.i, !dbg !1707
  %add213.i = add nuw nsw i32 %r192.0.i, %i202.0.i, !dbg !1708
  %mul214.i = mul nuw nsw i32 %add213.i, 69, !dbg !1709
  %add.ptr215.i = getelementptr inbounds nuw i8, ptr %A, i32 %mul214.i, !dbg !1710
  %add.ptr216.i = getelementptr inbounds nuw i8, ptr %add.ptr215.i, i32 %c197.0.i, !dbg !1711
  %cmp218.i = icmp samesign ult i32 %c197.0.i, 52, !dbg !1712
  %sub220.i = sub nsw i32 68, %c197.0.i, !dbg !1712
    #dbg_value(ptr %arrayidx212.i, !430, !DIExpression(), !1713)
    #dbg_value(ptr %add.ptr216.i, !436, !DIExpression(), !1713)
    #dbg_value(i32 poison, !437, !DIExpression(), !1713)
    #dbg_value(i32 0, !438, !DIExpression(), !1713)
  br label %for.cond.i.i103, !dbg !1715

for.cond.i.i103:                                  ; preds = %for.body.i.i106, %for.body207.i
  %mdec.addr.0.i.i = phi ptr [ %add.ptr216.i, %for.body207.i ], [ %incdec.ptr5.i.i, %for.body.i.i106 ]
  %i.0.i.i104 = phi i32 [ 0, %for.body207.i ], [ %inc.i.i108, %for.body.i.i106 ], !dbg !1716
    #dbg_value(i32 %i.0.i.i104, !438, !DIExpression(), !1713)
    #dbg_value(ptr %mdec.addr.0.i.i, !436, !DIExpression(), !1713)
  %94 = ashr exact i32 %sub220.i, 1, !dbg !1717
  %div.i.i = select i1 %cmp218.i, i32 8, i32 %94, !dbg !1712
  %cmp.i.i105 = icmp slt i32 %i.0.i.i104, %div.i.i, !dbg !1718
  br i1 %cmp.i.i105, label %for.body.i.i106, label %decode.exit.i, !dbg !1719

for.body.i.i106:                                  ; preds = %for.cond.i.i103
  %arrayidx.i.i107 = getelementptr inbounds nuw i8, ptr %arrayidx212.i, i32 %i.0.i.i104, !dbg !1720
  %95 = load i8, ptr %arrayidx.i.i107, align 1, !dbg !1720
  %96 = and i8 %95, 15, !dbg !1721
  %incdec.ptr.i.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i.i, i32 1, !dbg !1722
    #dbg_value(ptr %incdec.ptr.i.i, !436, !DIExpression(), !1713)
  store i8 %96, ptr %mdec.addr.0.i.i, align 1, !dbg !1723
  %97 = lshr i8 %95, 4, !dbg !1724
    #dbg_value(ptr %incdec.ptr.i.i, !436, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1713)
  store i8 %97, ptr %incdec.ptr.i.i, align 1, !dbg !1725
  %incdec.ptr5.i.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i.i, i32 2, !dbg !1726
    #dbg_value(ptr %incdec.ptr5.i.i, !436, !DIExpression(), !1713)
  %inc.i.i108 = add nuw nsw i32 %i.0.i.i104, 1, !dbg !1727
    #dbg_value(i32 %inc.i.i108, !438, !DIExpression(), !1713)
  br label %for.cond.i.i103, !dbg !1728, !llvm.loop !1729

decode.exit.i:                                    ; preds = %for.cond.i.i103
  %inc222.i = add nuw nsw i32 %i202.0.i, 1, !dbg !1731
    #dbg_value(i32 %inc222.i, !1699, !DIExpression(), !1700)
  br label %for.cond203.i, !dbg !1732, !llvm.loop !1733

for.inc224.i:                                     ; preds = %for.cond203.i
  %add225.i = add nuw nsw i32 %c197.0.i, 16, !dbg !1735
    #dbg_value(i32 %add225.i, !1691, !DIExpression(), !1692)
  br label %for.cond198.i, !dbg !1736, !llvm.loop !1737

for.inc227.i:                                     ; preds = %for.cond198.i
  %add228.i = add nuw nsw i32 %r192.0.i, 16, !dbg !1739
    #dbg_value(i32 %add228.i, !1683, !DIExpression(), !1684)
  %indvars.iv.next155 = add nsw i32 %indvars.iv154, -16, !dbg !1740
  br label %for.cond193.i, !dbg !1740, !llvm.loop !1741

compute_A.exit:                                   ; preds = %for.cond193.i
  call void @llvm.lifetime.end.p0(i64 5120, ptr nonnull %A.i), !dbg !1743
  call void @llvm.lifetime.end.p0(i64 16, ptr nonnull %tab.i), !dbg !1743
    #dbg_value(i32 0, !1744, !DIExpression(), !1746)
  br label %for.cond52, !dbg !1747

for.cond52:                                       ; preds = %for.body55, %compute_A.exit
  %i51.0 = phi i32 [ 0, %compute_A.exit ], [ %inc58, %for.body55 ], !dbg !1748
    #dbg_value(i32 %i51.0, !1744, !DIExpression(), !1746)
  %exitcond157 = icmp ne i32 %i51.0, 64, !dbg !1749
  br i1 %exitcond157, label %for.body55, label %for.end59, !dbg !1751

for.body55:                                       ; preds = %for.cond52
  %98 = mul nuw nsw i32 %i51.0, 69, !dbg !1752
  %sub = add nuw nsw i32 %98, 68, !dbg !1754
  %arrayidx = getelementptr inbounds nuw [4416 x i8], ptr %A, i32 0, i32 %sub, !dbg !1755
  store i8 0, ptr %arrayidx, align 1, !dbg !1756
  %inc58 = add nuw nsw i32 %i51.0, 1, !dbg !1757
    #dbg_value(i32 %inc58, !1744, !DIExpression(), !1746)
  br label %for.cond52, !dbg !1758, !llvm.loop !1759

for.end59:                                        ; preds = %for.cond52
  %add.ptr61 = getelementptr inbounds nuw i8, ptr %V, i32 128, !dbg !1761
    #dbg_value(ptr %add.ptr61, !430, !DIExpression(), !1762)
    #dbg_value(ptr %r, !436, !DIExpression(), !1762)
    #dbg_value(i32 68, !437, !DIExpression(), !1762)
    #dbg_value(i32 0, !438, !DIExpression(), !1762)
  br label %for.cond.i6, !dbg !1764

for.cond.i6:                                      ; preds = %for.body.i9, %for.end59
  %mdec.addr.0.i = phi ptr [ %r, %for.end59 ], [ %incdec.ptr5.i, %for.body.i9 ]
  %i.0.i7 = phi i32 [ 0, %for.end59 ], [ %inc.i11, %for.body.i9 ], !dbg !1765
    #dbg_value(i32 %i.0.i7, !438, !DIExpression(), !1762)
    #dbg_value(ptr %mdec.addr.0.i, !436, !DIExpression(), !1762)
  %exitcond158 = icmp ne i32 %i.0.i7, 34, !dbg !1766
  br i1 %exitcond158, label %for.body.i9, label %decode.exit, !dbg !1767

for.body.i9:                                      ; preds = %for.cond.i6
  %arrayidx.i10 = getelementptr inbounds nuw i8, ptr %add.ptr61, i32 %i.0.i7, !dbg !1768
  %99 = load i8, ptr %arrayidx.i10, align 1, !dbg !1768
  %100 = and i8 %99, 15, !dbg !1769
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i, i32 1, !dbg !1770
    #dbg_value(ptr %incdec.ptr.i, !436, !DIExpression(), !1762)
  store i8 %100, ptr %mdec.addr.0.i, align 1, !dbg !1771
  %101 = lshr i8 %99, 4, !dbg !1772
    #dbg_value(ptr %incdec.ptr.i, !436, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1762)
  store i8 %101, ptr %incdec.ptr.i, align 1, !dbg !1773
  %incdec.ptr5.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i, i32 2, !dbg !1774
    #dbg_value(ptr %incdec.ptr5.i, !436, !DIExpression(), !1762)
  %inc.i11 = add nuw nsw i32 %i.0.i7, 1, !dbg !1775
    #dbg_value(i32 %inc.i11, !438, !DIExpression(), !1762)
  br label %for.cond.i6, !dbg !1776, !llvm.loop !1777

decode.exit:                                      ; preds = %for.cond.i6
  %call67 = call i32 @pqmayo_MAYO_2_ref_sample_solution(ptr noundef %p, ptr noundef nonnull %A, ptr noundef nonnull %y, ptr noundef nonnull %r, ptr noundef nonnull %x, i32 noundef 4, i32 noundef 17, i32 noundef 64, i32 noundef 69) #9, !dbg !1779
  %tobool.not = icmp eq i32 %call67, 0, !dbg !1779
  br i1 %tobool.not, label %if.else, label %for.end76, !dbg !1779

if.else:                                          ; preds = %decode.exit
  %call70 = call ptr @memset(ptr noundef nonnull %Mtmp, i32 noundef 0, i32 noundef 2176) #8, !dbg !1781
  %call72 = call ptr @memset(ptr noundef nonnull %A, i32 noundef 0, i32 noundef 4416) #8, !dbg !1783
  %inc75 = add nuw nsw i32 %ctr.0, 1, !dbg !1784
    #dbg_value(i32 %inc75, !980, !DIExpression(), !981)
  br label %for.cond, !dbg !1785, !llvm.loop !1786

for.end76:                                        ; preds = %decode.exit, %for.cond
    #dbg_value(i32 0, !1788, !DIExpression(), !1790)
  br label %for.cond78, !dbg !1791

for.cond78:                                       ; preds = %mat_add.exit, %for.end76
  %i77.0 = phi i32 [ 0, %for.end76 ], [ %inc103, %mat_add.exit ], !dbg !1792
    #dbg_value(i32 %i77.0, !1788, !DIExpression(), !1790)
  %exitcond163 = icmp ne i32 %i77.0, 4, !dbg !1793
  br i1 %exitcond163, label %for.body81, label %for.cond.i.preheader, !dbg !1795

for.cond.i.preheader:                             ; preds = %for.cond78
  br label %for.cond.i, !dbg !1796

for.body81:                                       ; preds = %for.cond78
  %mul83 = shl nuw nsw i32 %i77.0, 6, !dbg !1800
    #dbg_value(ptr %add.ptr84, !1802, !DIExpression(), !865)
  %O = getelementptr inbounds nuw i8, ptr %sk, i32 101376, !dbg !1803
  %mul87 = mul nuw nsw i32 %i77.0, 17, !dbg !1804
  %add.ptr88 = getelementptr inbounds nuw i8, ptr %x, i32 %mul87, !dbg !1805
    #dbg_value(ptr %O, !1806, !DIExpression(), !1810)
    #dbg_value(ptr %add.ptr88, !1812, !DIExpression(), !1810)
    #dbg_value(ptr %Ox, !1813, !DIExpression(), !1810)
    #dbg_value(i32 17, !1814, !DIExpression(), !1810)
    #dbg_value(i32 64, !1815, !DIExpression(), !1810)
    #dbg_value(i32 1, !1816, !DIExpression(), !1810)
    #dbg_value(i32 0, !1817, !DIExpression(), !1819)
  br label %for.cond.i88, !dbg !1820

for.cond.i88:                                     ; preds = %for.inc4.i, %for.body81
  %i.0.i89 = phi i32 [ 0, %for.body81 ], [ %inc5.i, %for.inc4.i ], !dbg !1821
  %c.addr.0.i = phi ptr [ %Ox, %for.body81 ], [ %c.addr.1.i.lcssa, %for.inc4.i ]
  %a.addr.0.i = phi ptr [ %O, %for.body81 ], [ %add.ptr6.i94, %for.inc4.i ]
    #dbg_value(ptr %a.addr.0.i, !1806, !DIExpression(), !1810)
    #dbg_value(ptr %c.addr.0.i, !1813, !DIExpression(), !1810)
    #dbg_value(i32 %i.0.i89, !1817, !DIExpression(), !1819)
  %exitcond161 = icmp ne i32 %i.0.i89, 64, !dbg !1822
  br i1 %exitcond161, label %for.cond1.i91.preheader, label %mat_mul.exit, !dbg !1824

for.cond1.i91.preheader:                          ; preds = %for.cond.i88
  br label %for.cond1.i91, !dbg !1825

for.cond1.i91:                                    ; preds = %for.cond1.i91.preheader, %lincomb.exit.i
  %c.addr.1.i = phi ptr [ %incdec.ptr.i98, %lincomb.exit.i ], [ %c.addr.0.i, %for.cond1.i91.preheader ]
  %j.0.i92 = phi i32 [ 1, %lincomb.exit.i ], [ 0, %for.cond1.i91.preheader ], !dbg !1828
    #dbg_value(i32 poison, !1829, !DIExpression(), !1830)
    #dbg_value(ptr %c.addr.1.i, !1813, !DIExpression(), !1810)
  %cmp2.i93 = icmp eq i32 %j.0.i92, 0, !dbg !1831
  br i1 %cmp2.i93, label %for.body3.i95, label %for.inc4.i, !dbg !1825

for.body3.i95:                                    ; preds = %for.cond1.i91
  %add.ptr.i96 = getelementptr inbounds nuw i8, ptr %add.ptr88, i32 %j.0.i92, !dbg !1833
    #dbg_value(ptr %a.addr.0.i, !1835, !DIExpression(), !1839)
    #dbg_value(ptr %add.ptr.i96, !1841, !DIExpression(), !1839)
    #dbg_value(i32 17, !1842, !DIExpression(), !1839)
    #dbg_value(i32 1, !1843, !DIExpression(), !1839)
    #dbg_value(i8 0, !1844, !DIExpression(), !1839)
    #dbg_value(i32 0, !1845, !DIExpression(), !1847)
  br label %for.cond.i.i, !dbg !1848

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body3.i95
  %ret.0.i.i = phi i8 [ 0, %for.body3.i95 ], [ %xor1.i.i.i, %for.body.i.i ], !dbg !1839
  %b.addr.0.i.i = phi ptr [ %add.ptr.i96, %for.body3.i95 ], [ %add.ptr.i.i, %for.body.i.i ]
  %i.0.i.i = phi i32 [ 0, %for.body3.i95 ], [ %inc.i.i, %for.body.i.i ], !dbg !1849
    #dbg_value(i32 %i.0.i.i, !1845, !DIExpression(), !1847)
    #dbg_value(ptr %b.addr.0.i.i, !1841, !DIExpression(), !1839)
    #dbg_value(i8 %ret.0.i.i, !1844, !DIExpression(), !1839)
  %exitcond160 = icmp ne i32 %i.0.i.i, 17, !dbg !1850
  br i1 %exitcond160, label %for.body.i.i, label %lincomb.exit.i, !dbg !1852

for.body.i.i:                                     ; preds = %for.cond.i.i
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %a.addr.0.i, i32 %i.0.i.i, !dbg !1853
  %102 = load i8, ptr %arrayidx.i.i, align 1, !dbg !1853
  %103 = load i8, ptr %b.addr.0.i.i, align 1, !dbg !1855
    #dbg_value(i8 %102, !1521, !DIExpression(), !1856)
    #dbg_value(i8 %103, !1527, !DIExpression(), !1856)
  %104 = load volatile i8, ptr @pqmayo_MAYO_2_ref_unsigned_char_blocker, align 1, !dbg !1858
  %xor1.i.i99 = xor i8 %102, %104, !dbg !1859
    #dbg_value(i8 %xor1.i.i99, !1521, !DIExpression(), !1856)
  %105 = trunc i8 %xor1.i.i99 to i1, !dbg !1860
    #dbg_value(i8 poison, !1530, !DIExpression(), !1856)
  %106 = and i8 %xor1.i.i99, 2, !dbg !1861
  %mul9.i.i = mul i8 %106, %103, !dbg !1862
  %conv10.i.i = select i1 %105, i8 %103, i8 0, !dbg !1860
  %xor11.i.i = xor i8 %conv10.i.i, %mul9.i.i, !dbg !1863
    #dbg_value(i8 %xor11.i.i, !1530, !DIExpression(), !1856)
  %107 = and i8 %xor1.i.i99, 4, !dbg !1864
  %mul16.i.i = mul i8 %107, %103, !dbg !1865
  %xor18.i.i = xor i8 %mul16.i.i, %xor11.i.i, !dbg !1866
    #dbg_value(i8 %xor18.i.i, !1530, !DIExpression(), !1856)
  %108 = and i8 %xor1.i.i99, 8, !dbg !1867
  %mul23.i.i = mul i8 %108, %103, !dbg !1868
  %xor25.i.i = xor i8 %mul23.i.i, %xor18.i.i, !dbg !1869
    #dbg_value(i8 %xor25.i.i, !1530, !DIExpression(), !1856)
    #dbg_value(i8 %xor25.i.i, !1532, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !1856)
  %109 = lshr i8 %xor25.i.i, 4, !dbg !1870
  %110 = lshr i8 %xor25.i.i, 3, !dbg !1871
  %111 = and i8 %110, 14, !dbg !1871
  %112 = xor i8 %109, %111, !dbg !1872
  %xor25.masked.i.i = and i8 %xor25.i.i, 15, !dbg !1873
  %113 = xor i8 %112, %xor25.masked.i.i, !dbg !1873
    #dbg_value(i8 %113, !1533, !DIExpression(), !1856)
    #dbg_value(i8 %113, !1874, !DIExpression(), !1876)
    #dbg_value(i8 %ret.0.i.i, !1878, !DIExpression(), !1876)
  %xor1.i.i.i = xor i8 %113, %ret.0.i.i, !dbg !1879
    #dbg_value(i8 %xor1.i.i.i, !1844, !DIExpression(), !1839)
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !1880
    #dbg_value(i32 %inc.i.i, !1845, !DIExpression(), !1847)
  %add.ptr.i.i = getelementptr inbounds nuw i8, ptr %b.addr.0.i.i, i32 1, !dbg !1881
    #dbg_value(ptr %add.ptr.i.i, !1841, !DIExpression(), !1839)
  br label %for.cond.i.i, !dbg !1882, !llvm.loop !1883

lincomb.exit.i:                                   ; preds = %for.cond.i.i
  %ret.0.i.i.lcssa = phi i8 [ %ret.0.i.i, %for.cond.i.i ], !dbg !1839
  store i8 %ret.0.i.i.lcssa, ptr %c.addr.1.i, align 1, !dbg !1885
    #dbg_value(i32 1, !1829, !DIExpression(), !1830)
  %incdec.ptr.i98 = getelementptr inbounds nuw i8, ptr %c.addr.1.i, i32 1, !dbg !1886
    #dbg_value(ptr %incdec.ptr.i98, !1813, !DIExpression(), !1810)
  br label %for.cond1.i91, !dbg !1887, !llvm.loop !1888

for.inc4.i:                                       ; preds = %for.cond1.i91
  %c.addr.1.i.lcssa = phi ptr [ %c.addr.1.i, %for.cond1.i91 ]
  %inc5.i = add nuw nsw i32 %i.0.i89, 1, !dbg !1890
    #dbg_value(i32 %inc5.i, !1817, !DIExpression(), !1819)
  %add.ptr6.i94 = getelementptr inbounds nuw i8, ptr %a.addr.0.i, i32 17, !dbg !1891
    #dbg_value(ptr %add.ptr6.i94, !1806, !DIExpression(), !1810)
  br label %for.cond.i88, !dbg !1892, !llvm.loop !1893

mat_mul.exit:                                     ; preds = %for.cond.i88
  %add.ptr84 = getelementptr inbounds nuw i8, ptr %Vdec, i32 %mul83, !dbg !1895
  %mul92 = mul nuw nsw i32 %i77.0, 81, !dbg !1896
  %add.ptr93 = getelementptr inbounds nuw i8, ptr %s, i32 %mul92, !dbg !1897
    #dbg_value(ptr %add.ptr84, !1898, !DIExpression(), !1902)
    #dbg_value(ptr %Ox, !1904, !DIExpression(), !1902)
    #dbg_value(ptr %add.ptr93, !1905, !DIExpression(), !1902)
    #dbg_value(i32 64, !1906, !DIExpression(), !1902)
    #dbg_value(i32 1, !1907, !DIExpression(), !1902)
    #dbg_value(i32 0, !1908, !DIExpression(), !1910)
  br label %for.cond.i1, !dbg !1911

for.cond.i1:                                      ; preds = %for.inc11.i, %mat_mul.exit
  %i.0.i2 = phi i32 [ 0, %mat_mul.exit ], [ %inc12.i, %for.inc11.i ], !dbg !1912
    #dbg_value(i32 %i.0.i2, !1908, !DIExpression(), !1910)
  %exitcond162 = icmp ne i32 %i.0.i2, 64, !dbg !1913
  br i1 %exitcond162, label %for.cond1.i.preheader, label %mat_add.exit, !dbg !1915

for.cond1.i.preheader:                            ; preds = %for.cond.i1
  br label %for.cond1.i, !dbg !1916

for.cond1.i:                                      ; preds = %for.cond1.i.preheader, %for.body3.i
  %j.0.i = phi i32 [ 1, %for.body3.i ], [ 0, %for.cond1.i.preheader ], !dbg !1919
    #dbg_value(i32 poison, !1920, !DIExpression(), !1921)
  %cmp2.i = icmp eq i32 %j.0.i, 0, !dbg !1922
  br i1 %cmp2.i, label %for.body3.i, label %for.inc11.i, !dbg !1916

for.body3.i:                                      ; preds = %for.cond1.i
  %add.ptr.i4 = getelementptr inbounds nuw i8, ptr %add.ptr84, i32 %i.0.i2, !dbg !1924
  %add.ptr4.i = getelementptr inbounds nuw i8, ptr %add.ptr.i4, i32 %j.0.i, !dbg !1926
  %114 = load i8, ptr %add.ptr4.i, align 1, !dbg !1927
  %add.ptr6.i = getelementptr inbounds nuw i8, ptr %Ox, i32 %i.0.i2, !dbg !1928
  %add.ptr7.i = getelementptr inbounds nuw i8, ptr %add.ptr6.i, i32 %j.0.i, !dbg !1929
  %115 = load i8, ptr %add.ptr7.i, align 1, !dbg !1930
    #dbg_value(i8 %114, !1874, !DIExpression(), !1931)
    #dbg_value(i8 %115, !1878, !DIExpression(), !1931)
  %xor1.i.i = xor i8 %114, %115, !dbg !1933
  %add.ptr9.i = getelementptr inbounds nuw i8, ptr %add.ptr93, i32 %i.0.i2, !dbg !1934
  %add.ptr10.i = getelementptr inbounds nuw i8, ptr %add.ptr9.i, i32 %j.0.i, !dbg !1935
  store i8 %xor1.i.i, ptr %add.ptr10.i, align 1, !dbg !1936
    #dbg_value(i32 1, !1920, !DIExpression(), !1921)
  br label %for.cond1.i, !dbg !1937, !llvm.loop !1938

for.inc11.i:                                      ; preds = %for.cond1.i
  %inc12.i = add nuw nsw i32 %i.0.i2, 1, !dbg !1940
    #dbg_value(i32 %inc12.i, !1908, !DIExpression(), !1910)
  br label %for.cond.i1, !dbg !1941, !llvm.loop !1942

mat_add.exit:                                     ; preds = %for.cond.i1
  %mul95 = mul nuw nsw i32 %i77.0, 81, !dbg !1944
  %add.ptr96 = getelementptr inbounds nuw i8, ptr %s, i32 %mul95, !dbg !1945
  %add.ptr97 = getelementptr inbounds nuw i8, ptr %add.ptr96, i32 64, !dbg !1946
  %mul99 = mul nuw nsw i32 %i77.0, 17, !dbg !1947
  %add.ptr100 = getelementptr inbounds nuw i8, ptr %x, i32 %mul99, !dbg !1948
  %call101 = call ptr @memcpy(ptr noundef nonnull %add.ptr97, ptr noundef nonnull %add.ptr100, i32 noundef 17) #8, !dbg !1949
  %inc103 = add nuw nsw i32 %i77.0, 1, !dbg !1950
    #dbg_value(i32 %inc103, !1788, !DIExpression(), !1790)
  br label %for.cond78, !dbg !1951, !llvm.loop !1952

for.cond.i:                                       ; preds = %for.cond.i.preheader, %for.body.i
  %i.0.i = phi i32 [ %inc.i, %for.body.i ], [ 0, %for.cond.i.preheader ], !dbg !1954
  %m.addr.0.i = phi ptr [ %add.ptr3.i, %for.body.i ], [ %s, %for.cond.i.preheader ]
    #dbg_value(ptr %m.addr.0.i, !1955, !DIExpression(), !1956)
    #dbg_value(i32 %i.0.i, !1957, !DIExpression(), !1956)
  %exitcond164 = icmp ne i32 %i.0.i, 162, !dbg !1958
  br i1 %exitcond164, label %for.body.i, label %encode.exit, !dbg !1796

for.body.i:                                       ; preds = %for.cond.i
  %116 = load i8, ptr %m.addr.0.i, align 1, !dbg !1960
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %m.addr.0.i, i32 1, !dbg !1962
  %117 = load i8, ptr %add.ptr.i, align 1, !dbg !1963
  %shl.i = shl i8 %117, 4, !dbg !1964
  %or.i = or i8 %shl.i, %116, !dbg !1965
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %sig, i32 %i.0.i, !dbg !1966
  store i8 %or.i, ptr %arrayidx.i, align 1, !dbg !1967
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !1968
    #dbg_value(i32 %inc.i, !1957, !DIExpression(), !1956)
  %add.ptr3.i = getelementptr inbounds nuw i8, ptr %m.addr.0.i, i32 2, !dbg !1969
    #dbg_value(ptr %add.ptr3.i, !1955, !DIExpression(), !1956)
  br label %for.cond.i, !dbg !1970, !llvm.loop !1971

encode.exit:                                      ; preds = %for.cond.i
  %add.ptr107 = getelementptr inbounds nuw i8, ptr %sig, i32 162, !dbg !1973
  %call109 = call ptr @memcpy(ptr noundef nonnull %add.ptr107, ptr noundef nonnull %salt, i32 noundef 24) #8, !dbg !1974
  store i32 186, ptr %siglen, align 4, !dbg !1975
  br label %err, !dbg !1976

err:                                              ; preds = %if.end, %entry, %encode.exit
  %ret.0 = phi i32 [ %call, %encode.exit ], [ %call, %entry ], [ 1, %if.end ], !dbg !865
    #dbg_value(i32 %ret.0, !871, !DIExpression(), !865)
    #dbg_label(!1977, !1978)
  call void @mayo_secure_clear(ptr noundef nonnull %V, i32 noundef 162) #8, !dbg !1979
  call void @mayo_secure_clear(ptr noundef nonnull %Vdec, i32 noundef 256) #8, !dbg !1980
  call void @mayo_secure_clear(ptr noundef nonnull %A, i32 noundef 4416) #8, !dbg !1981
  call void @mayo_secure_clear(ptr noundef nonnull %r, i32 noundef 69) #8, !dbg !1982
  %O114 = getelementptr inbounds nuw i8, ptr %sk, i32 101376, !dbg !1983
  call void @mayo_secure_clear(ptr noundef nonnull %O114, i32 noundef 1088) #8, !dbg !1984
  call void @mayo_secure_clear(ptr noundef nonnull %sk, i32 noundef 102464) #8, !dbg !1985
  call void @mayo_secure_clear(ptr noundef nonnull %Ox, i32 noundef 64) #8, !dbg !1986
  call void @mayo_secure_clear(ptr noundef nonnull %tmp, i32 noundef 81) #8, !dbg !1987
  call void @mayo_secure_clear(ptr noundef nonnull %Mtmp, i32 noundef 2176) #8, !dbg !1988
  ret i32 %ret.0, !dbg !1989
}

; Function Attrs: nounwind
define internal fastcc void @compute_rhs(ptr noundef %p, ptr noundef %vPv, ptr noundef %t, ptr noundef %y) unnamed_addr #0 !dbg !1990 {
entry:
  %temp = alloca [4 x i64], align 8
    #dbg_value(ptr %p, !1993, !DIExpression(), !1994)
    #dbg_value(ptr %vPv, !1995, !DIExpression(), !1994)
    #dbg_value(ptr %t, !1996, !DIExpression(), !1994)
    #dbg_value(ptr %y, !1997, !DIExpression(), !1994)
    #dbg_value(i32 60, !1998, !DIExpression(), !1994)
    #dbg_value(i32 4, !2000, !DIExpression(), !1994)
    #dbg_declare(ptr %temp, !2001, !DIExpression(), !2002)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(32) %temp, i8 0, i32 32, i1 false), !dbg !2002
    #dbg_value(ptr %temp, !2003, !DIExpression(), !1994)
    #dbg_value(i32 3, !2004, !DIExpression(), !2006)
  br label %for.cond, !dbg !2007

for.cond:                                         ; preds = %for.inc65, %entry
  %i.0 = phi i32 [ 3, %entry ], [ %dec66, %for.inc65 ], !dbg !2008
    #dbg_value(i32 %i.0, !2004, !DIExpression(), !2006)
  %cmp = icmp sgt i32 %i.0, -1, !dbg !2009
  br i1 %cmp, label %for.cond1.preheader, label %for.cond69.preheader, !dbg !2011

for.cond1.preheader:                              ; preds = %for.cond
  br label %for.cond1, !dbg !2012

for.cond69.preheader:                             ; preds = %for.cond
  br label %for.cond69, !dbg !2015

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc62
  %j.0 = phi i32 [ %inc63, %for.inc62 ], [ %i.0, %for.cond1.preheader ], !dbg !2017
    #dbg_value(i32 %j.0, !2018, !DIExpression(), !2019)
  %exitcond15 = icmp ne i32 %j.0, 4, !dbg !2020
  br i1 %exitcond15, label %for.body3, label %for.inc65, !dbg !2012

for.body3:                                        ; preds = %for.cond1
  %arrayidx = getelementptr inbounds nuw i8, ptr %temp, i32 24, !dbg !2022
  %0 = load i64, ptr %arrayidx, align 8, !dbg !2022
  %shr = lshr i64 %0, 60, !dbg !2024
    #dbg_value(i8 %conv, !2025, !DIExpression(), !2026)
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %temp, i32 24, !dbg !2027
  %shl = shl i64 %0, 4, !dbg !2028
  store i64 %shl, ptr %arrayidx4, align 8, !dbg !2028
    #dbg_value(i32 2, !2029, !DIExpression(), !2031)
  br label %for.cond5, !dbg !2032

for.cond5:                                        ; preds = %for.body8, %for.body3
  %k.0 = phi i32 [ 2, %for.body3 ], [ %dec, %for.body8 ], !dbg !2033
    #dbg_value(i32 %k.0, !2029, !DIExpression(), !2031)
  %cmp6 = icmp sgt i32 %k.0, -1, !dbg !2034
  br i1 %cmp6, label %for.body8, label %for.cond14.preheader, !dbg !2036

for.cond14.preheader:                             ; preds = %for.cond5
  %conv = trunc nuw nsw i64 %shr to i8, !dbg !2037
  br label %for.cond14, !dbg !2038

for.body8:                                        ; preds = %for.cond5
  %arrayidx9 = getelementptr inbounds nuw [4 x i64], ptr %temp, i32 0, i32 %k.0, !dbg !2040
  %1 = load i64, ptr %arrayidx9, align 8, !dbg !2040
  %shr10 = lshr i64 %1, 60, !dbg !2042
  %add = add nuw nsw i32 %k.0, 1, !dbg !2043
  %arrayidx11 = getelementptr inbounds nuw [4 x i64], ptr %temp, i32 0, i32 %add, !dbg !2044
  %2 = load i64, ptr %arrayidx11, align 8, !dbg !2045
  %xor = xor i64 %2, %shr10, !dbg !2045
  store i64 %xor, ptr %arrayidx11, align 8, !dbg !2045
  %arrayidx12 = getelementptr inbounds nuw [4 x i64], ptr %temp, i32 0, i32 %k.0, !dbg !2046
  %3 = load i64, ptr %arrayidx12, align 8, !dbg !2047
  %shl13 = shl i64 %3, 4, !dbg !2047
  store i64 %shl13, ptr %arrayidx12, align 8, !dbg !2047
  %dec = add nsw i32 %k.0, -1, !dbg !2048
    #dbg_value(i32 %dec, !2029, !DIExpression(), !2031)
  br label %for.cond5, !dbg !2049, !llvm.loop !2050

for.cond14:                                       ; preds = %for.cond14.preheader, %for.inc36
  %jj.0 = phi i32 [ %inc, %for.inc36 ], [ 0, %for.cond14.preheader ], !dbg !2052
    #dbg_value(i32 %jj.0, !2053, !DIExpression(), !2054)
  %exitcond = icmp ne i32 %jj.0, 4, !dbg !2055
  br i1 %exitcond, label %for.body17, label %for.cond39.preheader, !dbg !2038

for.cond39.preheader:                             ; preds = %for.cond14
  br label %for.cond39, !dbg !2057

for.body17:                                       ; preds = %for.cond14
  %rem18 = and i32 %jj.0, 1, !dbg !2059
  %cmp19 = icmp eq i32 %rem18, 0, !dbg !2062
  br i1 %cmp19, label %if.then, label %if.else, !dbg !2062

if.then:                                          ; preds = %for.body17
  %arrayidx21 = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %jj.0, !dbg !2063
  %4 = load i8, ptr %arrayidx21, align 1, !dbg !2063
    #dbg_value(i8 %conv, !1521, !DIExpression(), !2065)
    #dbg_value(i8 %4, !1527, !DIExpression(), !2065)
  %5 = load volatile i8, ptr @pqmayo_MAYO_2_ref_unsigned_char_blocker, align 1, !dbg !2067
  %xor1.i = xor i8 %5, %conv, !dbg !2068
    #dbg_value(i8 %xor1.i, !1521, !DIExpression(), !2065)
  %6 = trunc i8 %xor1.i to i1, !dbg !2069
    #dbg_value(i8 poison, !1530, !DIExpression(), !2065)
  %7 = and i8 %xor1.i, 2, !dbg !2070
  %mul9.i = mul i8 %7, %4, !dbg !2071
  %conv10.i = select i1 %6, i8 %4, i8 0, !dbg !2069
  %xor11.i = xor i8 %conv10.i, %mul9.i, !dbg !2072
    #dbg_value(i8 %xor11.i, !1530, !DIExpression(), !2065)
  %8 = and i8 %xor1.i, 4, !dbg !2073
  %mul16.i = mul i8 %8, %4, !dbg !2074
  %xor18.i = xor i8 %mul16.i, %xor11.i, !dbg !2075
    #dbg_value(i8 %xor18.i, !1530, !DIExpression(), !2065)
  %9 = and i8 %xor1.i, 8, !dbg !2076
  %mul23.i = mul i8 %9, %4, !dbg !2077
  %xor25.i = xor i8 %mul23.i, %xor18.i, !dbg !2078
    #dbg_value(i8 %xor25.i, !1530, !DIExpression(), !2065)
    #dbg_value(i8 %xor25.i, !1532, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !2065)
  %10 = lshr i8 %xor25.i, 4, !dbg !2079
  %11 = lshr i8 %xor25.i, 3, !dbg !2080
  %12 = and i8 %11, 14, !dbg !2080
  %13 = xor i8 %10, %12, !dbg !2081
  %xor25.masked.i = and i8 %xor25.i, 15, !dbg !2082
  %14 = xor i8 %13, %xor25.masked.i, !dbg !2082
    #dbg_value(i8 %14, !1533, !DIExpression(), !2065)
  %div = lshr exact i32 %jj.0, 1, !dbg !2083
  %arrayidx23 = getelementptr inbounds nuw i8, ptr %temp, i32 %div, !dbg !2084
  %15 = load i8, ptr %arrayidx23, align 1, !dbg !2085
  %xor254 = xor i8 %15, %14, !dbg !2085
  store i8 %xor254, ptr %arrayidx23, align 1, !dbg !2085
  br label %for.inc36, !dbg !2086

if.else:                                          ; preds = %for.body17
  %arrayidx27 = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %jj.0, !dbg !2087
  %16 = load i8, ptr %arrayidx27, align 1, !dbg !2087
    #dbg_value(i8 %conv, !1521, !DIExpression(), !2089)
    #dbg_value(i8 %16, !1527, !DIExpression(), !2089)
  %17 = load volatile i8, ptr @pqmayo_MAYO_2_ref_unsigned_char_blocker, align 1, !dbg !2091
  %xor1.i5 = xor i8 %17, %conv, !dbg !2092
    #dbg_value(i8 %xor1.i5, !1521, !DIExpression(), !2089)
  %18 = trunc i8 %xor1.i5 to i1, !dbg !2093
    #dbg_value(i8 poison, !1530, !DIExpression(), !2089)
  %19 = and i8 %xor1.i5, 2, !dbg !2094
  %mul9.i6 = mul i8 %19, %16, !dbg !2095
  %conv10.i7 = select i1 %18, i8 %16, i8 0, !dbg !2093
  %xor11.i8 = xor i8 %conv10.i7, %mul9.i6, !dbg !2096
    #dbg_value(i8 %xor11.i8, !1530, !DIExpression(), !2089)
  %20 = and i8 %xor1.i5, 4, !dbg !2097
  %mul16.i9 = mul i8 %20, %16, !dbg !2098
  %xor18.i10 = xor i8 %mul16.i9, %xor11.i8, !dbg !2099
    #dbg_value(i8 %xor18.i10, !1530, !DIExpression(), !2089)
  %21 = and i8 %xor1.i5, 8, !dbg !2100
  %mul23.i11 = mul i8 %21, %16, !dbg !2101
  %xor25.i12 = xor i8 %mul23.i11, %xor18.i10, !dbg !2102
    #dbg_value(i8 %xor25.i12, !1530, !DIExpression(), !2089)
    #dbg_value(i8 %xor25.i12, !1532, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !2089)
  %22 = lshr i8 %xor25.i12, 4, !dbg !2103
  %23 = lshr i8 %xor25.i12, 3, !dbg !2104
  %24 = and i8 %23, 14, !dbg !2104
  %25 = xor i8 %22, %24, !dbg !2105
  %xor25.masked.i13 = and i8 %xor25.i12, 15, !dbg !2106
  %26 = xor i8 %25, %xor25.masked.i13, !dbg !2106
    #dbg_value(i8 %26, !1533, !DIExpression(), !2089)
  %shl30 = shl nuw i8 %26, 4, !dbg !2107
  %div313 = lshr i32 %jj.0, 1, !dbg !2108
  %arrayidx32 = getelementptr inbounds nuw i8, ptr %temp, i32 %div313, !dbg !2109
  %27 = load i8, ptr %arrayidx32, align 1, !dbg !2110
  %xor34 = xor i8 %shl30, %27, !dbg !2110
  store i8 %xor34, ptr %arrayidx32, align 1, !dbg !2110
  br label %for.inc36

for.inc36:                                        ; preds = %if.then, %if.else
  %inc = add nuw nsw i32 %jj.0, 1, !dbg !2111
    #dbg_value(i32 %inc, !2053, !DIExpression(), !2054)
  br label %for.cond14, !dbg !2112, !llvm.loop !2113

for.cond39:                                       ; preds = %for.cond39.preheader, %for.body42
  %k38.0 = phi i32 [ %inc60, %for.body42 ], [ 0, %for.cond39.preheader ], !dbg !2115
    #dbg_value(i32 %k38.0, !2116, !DIExpression(), !2117)
  %exitcond14 = icmp ne i32 %k38.0, 4, !dbg !2118
  br i1 %exitcond14, label %for.body42, label %for.inc62, !dbg !2057

for.body42:                                       ; preds = %for.cond39
  %28 = shl i32 %i.0, 4, !dbg !2120
  %29 = shl i32 %j.0, 2, !dbg !2120
  %mul44 = add nsw i32 %28, %29, !dbg !2120
  %add45 = or disjoint i32 %mul44, %k38.0, !dbg !2122
  %arrayidx46 = getelementptr inbounds nuw i64, ptr %vPv, i32 %add45, !dbg !2123
  %30 = load i64, ptr %arrayidx46, align 8, !dbg !2123
  %cmp47.not = icmp eq i32 %i.0, %j.0, !dbg !2124
  %31 = shl i32 %j.0, 4, !dbg !2125
  %32 = shl i32 %i.0, 2, !dbg !2125
  %mul52 = add nsw i32 %31, %32, !dbg !2125
  %add53 = or disjoint i32 %mul52, %k38.0, !dbg !2126
  %arrayidx54 = getelementptr inbounds nuw i64, ptr %vPv, i32 %add53, !dbg !2127
  %33 = load i64, ptr %arrayidx54, align 8, !dbg !2127
  %mul55 = select i1 %cmp47.not, i64 0, i64 %33, !dbg !2128
  %xor56 = xor i64 %30, %mul55, !dbg !2129
  %arrayidx57 = getelementptr inbounds nuw [4 x i64], ptr %temp, i32 0, i32 %k38.0, !dbg !2130
  %34 = load i64, ptr %arrayidx57, align 8, !dbg !2131
  %xor58 = xor i64 %34, %xor56, !dbg !2131
  store i64 %xor58, ptr %arrayidx57, align 8, !dbg !2131
  %inc60 = add nuw nsw i32 %k38.0, 1, !dbg !2132
    #dbg_value(i32 %inc60, !2116, !DIExpression(), !2117)
  br label %for.cond39, !dbg !2133, !llvm.loop !2134

for.inc62:                                        ; preds = %for.cond39
  %inc63 = add nuw nsw i32 %j.0, 1, !dbg !2136
    #dbg_value(i32 %inc63, !2018, !DIExpression(), !2019)
  br label %for.cond1, !dbg !2137, !llvm.loop !2138

for.inc65:                                        ; preds = %for.cond1
  %dec66 = add nsw i32 %i.0, -1, !dbg !2140
    #dbg_value(i32 %dec66, !2004, !DIExpression(), !2006)
  br label %for.cond, !dbg !2141, !llvm.loop !2142

for.cond69:                                       ; preds = %for.cond69.preheader, %for.body72
  %i68.0 = phi i32 [ %add93, %for.body72 ], [ 0, %for.cond69.preheader ], !dbg !2144
    #dbg_value(i32 %i68.0, !2145, !DIExpression(), !2146)
  %cmp70 = icmp samesign ult i32 %i68.0, 64, !dbg !2147
  br i1 %cmp70, label %for.body72, label %for.end94, !dbg !2015

for.body72:                                       ; preds = %for.cond69
  %arrayidx73 = getelementptr inbounds nuw i8, ptr %t, i32 %i68.0, !dbg !2149
  %35 = load i8, ptr %arrayidx73, align 1, !dbg !2149
  %div75 = lshr exact i32 %i68.0, 1, !dbg !2151
  %arrayidx76 = getelementptr inbounds nuw i8, ptr %temp, i32 %div75, !dbg !2152
  %36 = load i8, ptr %arrayidx76, align 1, !dbg !2152
  %37 = and i8 %36, 15, !dbg !2153
  %xor781 = xor i8 %35, %37, !dbg !2154
  %arrayidx80 = getelementptr inbounds nuw i8, ptr %y, i32 %i68.0, !dbg !2155
  store i8 %xor781, ptr %arrayidx80, align 1, !dbg !2156
  %add81 = or disjoint i32 %i68.0, 1, !dbg !2157
  %arrayidx82 = getelementptr inbounds nuw i8, ptr %t, i32 %add81, !dbg !2158
  %38 = load i8, ptr %arrayidx82, align 1, !dbg !2158
  %div84 = lshr exact i32 %i68.0, 1, !dbg !2159
  %arrayidx85 = getelementptr inbounds nuw i8, ptr %temp, i32 %div84, !dbg !2160
  %39 = load i8, ptr %arrayidx85, align 1, !dbg !2160
  %40 = lshr i8 %39, 4, !dbg !2161
  %xor882 = xor i8 %38, %40, !dbg !2162
  %add90 = or disjoint i32 %i68.0, 1, !dbg !2163
  %arrayidx91 = getelementptr inbounds nuw i8, ptr %y, i32 %add90, !dbg !2164
  store i8 %xor882, ptr %arrayidx91, align 1, !dbg !2165
  %add93 = add nuw nsw i32 %i68.0, 2, !dbg !2166
    #dbg_value(i32 %add93, !2145, !DIExpression(), !2146)
  br label %for.cond69, !dbg !2167, !llvm.loop !2168

for.end94:                                        ; preds = %for.cond69
  ret void, !dbg !2170
}

declare dso_local ptr @memset(ptr noundef, i32 noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: nounwind
define dso_local i32 @pqmayo_MAYO_2_ref_mayo_sign(ptr noundef %p, ptr noundef %sm, ptr noundef %smlen, ptr noundef %m, i32 noundef %mlen, ptr noundef %csk) local_unnamed_addr #0 !dbg !2171 {
entry:
  %siglen = alloca i32, align 4
    #dbg_value(ptr %p, !2172, !DIExpression(), !2173)
    #dbg_value(ptr %sm, !2174, !DIExpression(), !2173)
    #dbg_value(ptr %smlen, !2175, !DIExpression(), !2173)
    #dbg_value(ptr %m, !2176, !DIExpression(), !2173)
    #dbg_value(i32 %mlen, !2177, !DIExpression(), !2173)
    #dbg_value(ptr %csk, !2178, !DIExpression(), !2173)
    #dbg_value(i32 0, !2179, !DIExpression(), !2173)
    #dbg_value(i32 186, !2180, !DIExpression(), !2173)
  %add.ptr = getelementptr inbounds nuw i8, ptr %sm, i32 186, !dbg !2181
  %call = call ptr @memmove(ptr noundef nonnull %add.ptr, ptr noundef %m, i32 noundef %mlen) #8, !dbg !2182
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %sm, i32 186, !dbg !2183
    #dbg_value(ptr %siglen, !2184, !DIExpression(DW_OP_deref), !2173)
  %call2 = call i32 @pqmayo_MAYO_2_ref_mayo_sign_signature(ptr noundef %p, ptr noundef %sm, ptr noundef nonnull %siglen, ptr noundef nonnull %add.ptr1, i32 noundef %mlen, ptr noundef %csk) #9, !dbg !2185
    #dbg_value(i32 %call2, !2179, !DIExpression(), !2173)
  %cmp.not = icmp eq i32 %call2, 0, !dbg !2186
  %0 = load i32, ptr %siglen, align 4
    #dbg_value(i32 %0, !2184, !DIExpression(), !2173)
  %cmp3.not = icmp eq i32 %0, 186
  %or.cond = select i1 %cmp.not, i1 %cmp3.not, i1 false, !dbg !2188
  br i1 %or.cond, label %if.end, label %if.then, !dbg !2188

if.then:                                          ; preds = %entry
  %1 = load i32, ptr %siglen, align 4, !dbg !2189
    #dbg_value(i32 %1, !2184, !DIExpression(), !2173)
  %add = add i32 %1, %mlen, !dbg !2191
  %call4 = call ptr @memset(ptr noundef %sm, i32 noundef 0, i32 noundef %add) #8, !dbg !2192
  br label %err, !dbg !2193

if.end:                                           ; preds = %entry
  %2 = load i32, ptr %siglen, align 4, !dbg !2194
    #dbg_value(i32 %2, !2184, !DIExpression(), !2173)
  %add5 = add i32 %2, %mlen, !dbg !2195
  store i32 %add5, ptr %smlen, align 4, !dbg !2196
  br label %err, !dbg !2197

err:                                              ; preds = %if.end, %if.then
    #dbg_label(!2198, !2199)
  ret i32 %call2, !dbg !2200
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_2_ref_mayo_open(ptr noundef %p, ptr noundef %m, ptr noundef %mlen, ptr noundef %sm, i32 noundef %smlen, ptr noundef %pk) local_unnamed_addr #0 !dbg !334 {
entry:
    #dbg_value(ptr %p, !333, !DIExpression(), !2201)
    #dbg_value(ptr %m, !340, !DIExpression(), !2201)
    #dbg_value(ptr %mlen, !341, !DIExpression(), !2201)
    #dbg_value(ptr %sm, !342, !DIExpression(), !2201)
    #dbg_value(i32 %smlen, !343, !DIExpression(), !2201)
    #dbg_value(ptr %pk, !344, !DIExpression(), !2201)
    #dbg_value(i32 186, !345, !DIExpression(), !2201)
  %cmp = icmp ult i32 %smlen, 186, !dbg !2202
  br i1 %cmp, label %return, label %if.end, !dbg !2202

if.end:                                           ; preds = %entry
  %add.ptr = getelementptr inbounds nuw i8, ptr %sm, i32 186, !dbg !2203
  %sub = add i32 %smlen, -186, !dbg !2204
  %call = call i32 @pqmayo_MAYO_2_ref_mayo_verify(ptr noundef %p, ptr noundef nonnull %add.ptr, i32 noundef %sub, ptr noundef %sm, ptr noundef %pk) #9, !dbg !2205
    #dbg_value(i32 %call, !351, !DIExpression(), !2201)
  %cmp1 = icmp eq i32 %call, 0, !dbg !2206
  br i1 %cmp1, label %if.then2, label %return, !dbg !2206

if.then2:                                         ; preds = %if.end
  %sub3 = add i32 %smlen, -186, !dbg !2207
  store i32 %sub3, ptr %mlen, align 4, !dbg !2208
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sm, i32 186, !dbg !2209
  %call5 = call ptr @memmove(ptr noundef %m, ptr noundef nonnull %add.ptr4, i32 noundef %sub3) #8, !dbg !2210
  br label %return, !dbg !2211

return:                                           ; preds = %if.end, %if.then2, %entry
  %retval.0 = phi i32 [ 1, %entry ], [ 0, %if.then2 ], [ 1, %if.end ], !dbg !2201
  ret i32 %retval.0, !dbg !2212
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_2_ref_mayo_verify(ptr noundef %p, ptr noundef %m, i32 noundef %mlen, ptr noundef %sig, ptr noundef %cpk) local_unnamed_addr #0 !dbg !2213 {
entry:
  %accumulator.i39 = alloca [20736 x i64], align 8
  %accumulator.i = alloca [1024 x i64], align 8
  %tmp.i2 = alloca [4 x i64], align 8
  %tmp.i = alloca [4 x i64], align 8
  %PS.i.i = alloca [1296 x i64], align 8
  %SPS.i = alloca [64 x i64], align 8
  %zero.i = alloca [64 x i8], align 1
  %tEnc = alloca [32 x i8], align 1
  %t = alloca [64 x i8], align 1
  %y = alloca [128 x i8], align 1
  %s = alloca [324 x i8], align 1
  %pk = alloca [13284 x i64], align 8
  %tmp = alloca [56 x i8], align 1
    #dbg_value(ptr %p, !2216, !DIExpression(), !2217)
    #dbg_value(ptr %m, !2218, !DIExpression(), !2217)
    #dbg_value(i32 %mlen, !2219, !DIExpression(), !2217)
    #dbg_value(ptr %sig, !2220, !DIExpression(), !2217)
    #dbg_value(ptr %cpk, !2221, !DIExpression(), !2217)
    #dbg_declare(ptr %tEnc, !2222, !DIExpression(), !2223)
    #dbg_declare(ptr %t, !2224, !DIExpression(), !2225)
    #dbg_declare(ptr %y, !2226, !DIExpression(), !2230)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(128) %y, i8 0, i32 128, i1 false), !dbg !2230
    #dbg_declare(ptr %s, !2231, !DIExpression(), !2232)
    #dbg_declare(ptr %pk, !2233, !DIExpression(), !2237)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(106272) %pk, i8 0, i32 106272, i1 false), !dbg !2237
    #dbg_declare(ptr %tmp, !2238, !DIExpression(), !2242)
    #dbg_value(i32 64, !2243, !DIExpression(), !2217)
    #dbg_value(i32 81, !2244, !DIExpression(), !2217)
    #dbg_value(i32 4, !2245, !DIExpression(), !2217)
    #dbg_value(i32 32, !2246, !DIExpression(), !2217)
    #dbg_value(i32 186, !2247, !DIExpression(), !2217)
    #dbg_value(i32 32, !2248, !DIExpression(), !2217)
    #dbg_value(i32 24, !2249, !DIExpression(), !2217)
    #dbg_value(ptr %p, !247, !DIExpression(), !2250)
    #dbg_value(ptr %cpk, !253, !DIExpression(), !2250)
    #dbg_value(ptr %pk, !254, !DIExpression(), !2250)
    #dbg_value(ptr %p, !255, !DIExpression(), !2252)
    #dbg_value(ptr %pk, !261, !DIExpression(), !2252)
    #dbg_value(ptr %cpk, !262, !DIExpression(), !2252)
  %call.i.i = call i32 @AES_128_CTR(ptr noundef nonnull %pk, i32 noundef 101376, ptr noundef %cpk, i32 noundef 16) #8, !dbg !2254
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %tmp.i2), !dbg !2255
    #dbg_value(ptr %pk, !269, !DIExpression(), !2257)
    #dbg_value(ptr %pk, !271, !DIExpression(), !2257)
    #dbg_value(i32 3168, !272, !DIExpression(), !2257)
    #dbg_value(i32 64, !273, !DIExpression(), !2257)
    #dbg_value(i32 4, !274, !DIExpression(), !2257)
    #dbg_value(ptr %pk, !276, !DIExpression(), !2257)
    #dbg_declare(ptr %tmp.i2, !277, !DIExpression(), !2255)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(32) %tmp.i2, i8 0, i32 32, i1 false), !dbg !2255
    #dbg_value(i32 3168, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2258)
  br label %for.cond.i3, !dbg !2259

for.cond.i3:                                      ; preds = %for.body.i7, %entry
  %i.0.in.i4 = phi i32 [ 3168, %entry ], [ %i.0.i5, %for.body.i7 ]
    #dbg_value(i32 %i.0.in.i4, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2258)
  %cmp.i6 = icmp ugt i32 %i.0.in.i4, 0, !dbg !2260
  br i1 %cmp.i6, label %for.body.i7, label %unpack_m_vecs.exit16, !dbg !2261

for.body.i7:                                      ; preds = %for.cond.i3
  %i.0.i5 = add nsw i32 %i.0.in.i4, -1, !dbg !2262
    #dbg_value(i32 %i.0.i5, !279, !DIExpression(), !2258)
  %0 = shl i32 %i.0.i5, 5, !dbg !2263
  %div1.i96568 = and i32 %0, 2147483616, !dbg !2263
  %add.ptr.i10 = getelementptr inbounds nuw i8, ptr %pk, i32 %div1.i96568, !dbg !2264
  %call.i11 = call ptr @memcpy(ptr noundef nonnull %tmp.i2, ptr noundef nonnull %add.ptr.i10, i32 noundef 32) #8, !dbg !2265
  %mul3.i12 = shl i32 %i.0.i5, 5, !dbg !2266
  %add.ptr5.i14 = getelementptr inbounds nuw i8, ptr %pk, i32 %mul3.i12, !dbg !2267
  %call8.i15 = call ptr @memcpy(ptr noundef nonnull %add.ptr5.i14, ptr noundef nonnull %tmp.i2, i32 noundef 32) #8, !dbg !2268
    #dbg_value(i32 %i.0.i5, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2258)
  br label %for.cond.i3, !dbg !2269, !llvm.loop !2270

unpack_m_vecs.exit16:                             ; preds = %for.cond.i3
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %tmp.i2), !dbg !2272
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %cpk, i32 16, !dbg !2273
  %add.ptr2.i = getelementptr inbounds nuw i8, ptr %pk, i32 101376, !dbg !2274
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %tmp.i), !dbg !2275
    #dbg_value(ptr %add.ptr.i, !269, !DIExpression(), !2277)
    #dbg_value(ptr %add.ptr2.i, !271, !DIExpression(), !2277)
    #dbg_value(i32 153, !272, !DIExpression(), !2277)
    #dbg_value(i32 64, !273, !DIExpression(), !2277)
    #dbg_value(i32 4, !274, !DIExpression(), !2277)
    #dbg_value(ptr %add.ptr2.i, !276, !DIExpression(), !2277)
    #dbg_declare(ptr %tmp.i, !277, !DIExpression(), !2275)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(32) %tmp.i, i8 0, i32 32, i1 false), !dbg !2275
    #dbg_value(i32 153, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2278)
  br label %for.cond.i, !dbg !2279

for.cond.i:                                       ; preds = %for.body.i, %unpack_m_vecs.exit16
  %i.0.in.i = phi i32 [ 153, %unpack_m_vecs.exit16 ], [ %i.0.i, %for.body.i ]
    #dbg_value(i32 %i.0.in.i, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2278)
  %cmp.i = icmp ugt i32 %i.0.in.i, 0, !dbg !2280
  br i1 %cmp.i, label %for.body.i, label %unpack_m_vecs.exit, !dbg !2281

for.body.i:                                       ; preds = %for.cond.i
  %i.0.i = add nsw i32 %i.0.in.i, -1, !dbg !2282
    #dbg_value(i32 %i.0.i, !279, !DIExpression(), !2278)
  %1 = shl i32 %i.0.i, 5, !dbg !2283
  %div1.i6667 = and i32 %1, 2147483616, !dbg !2283
  %add.ptr.i1 = getelementptr inbounds nuw i8, ptr %add.ptr.i, i32 %div1.i6667, !dbg !2284
  %call.i = call ptr @memcpy(ptr noundef nonnull %tmp.i, ptr noundef nonnull %add.ptr.i1, i32 noundef 32) #8, !dbg !2285
  %mul3.i = shl i32 %i.0.i, 5, !dbg !2286
  %add.ptr5.i = getelementptr inbounds nuw i8, ptr %add.ptr2.i, i32 %mul3.i, !dbg !2287
  %call8.i = call ptr @memcpy(ptr noundef nonnull %add.ptr5.i, ptr noundef nonnull %tmp.i, i32 noundef 32) #8, !dbg !2288
    #dbg_value(i32 %i.0.i, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2278)
  br label %for.cond.i, !dbg !2289, !llvm.loop !2290

unpack_m_vecs.exit:                               ; preds = %for.cond.i
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %tmp.i), !dbg !2292
    #dbg_value(i32 0, !2293, !DIExpression(), !2217)
    #dbg_value(ptr %pk, !2294, !DIExpression(), !2217)
  %add.ptr = getelementptr inbounds nuw i8, ptr %pk, i32 66560, !dbg !2295
    #dbg_value(ptr %add.ptr, !2296, !DIExpression(), !2217)
    #dbg_value(ptr %add.ptr2, !2297, !DIExpression(), !2217)
  %call4 = call i32 @shake256(ptr noundef nonnull %tmp, i32 noundef 32, ptr noundef %m, i32 noundef %mlen) #8, !dbg !2298
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %tmp, i32 32, !dbg !2299
  %add.ptr8 = getelementptr inbounds nuw i8, ptr %sig, i32 162, !dbg !2300
  %call9 = call ptr @memcpy(ptr noundef nonnull %add.ptr6, ptr noundef nonnull %add.ptr8, i32 noundef 24) #8, !dbg !2301
  %call12 = call i32 @shake256(ptr noundef nonnull %tEnc, i32 noundef 32, ptr noundef nonnull %tmp, i32 noundef 56) #8, !dbg !2302
    #dbg_value(ptr %tEnc, !430, !DIExpression(), !2303)
    #dbg_value(ptr %t, !436, !DIExpression(), !2303)
    #dbg_value(i32 64, !437, !DIExpression(), !2303)
    #dbg_value(i32 0, !438, !DIExpression(), !2303)
  br label %for.cond.i17, !dbg !2305

for.cond.i17:                                     ; preds = %for.body.i20, %unpack_m_vecs.exit
  %mdec.addr.0.i = phi ptr [ %t, %unpack_m_vecs.exit ], [ %incdec.ptr5.i, %for.body.i20 ]
  %i.0.i18 = phi i32 [ 0, %unpack_m_vecs.exit ], [ %inc.i, %for.body.i20 ], !dbg !2306
    #dbg_value(i32 %i.0.i18, !438, !DIExpression(), !2303)
    #dbg_value(ptr %mdec.addr.0.i, !436, !DIExpression(), !2303)
  %exitcond = icmp ne i32 %i.0.i18, 32, !dbg !2307
  br i1 %exitcond, label %for.body.i20, label %for.cond.i21.preheader, !dbg !2308

for.cond.i21.preheader:                           ; preds = %for.cond.i17
  br label %for.cond.i21, !dbg !2309

for.body.i20:                                     ; preds = %for.cond.i17
  %arrayidx.i = getelementptr inbounds nuw i8, ptr %tEnc, i32 %i.0.i18, !dbg !2311
  %2 = load i8, ptr %arrayidx.i, align 1, !dbg !2311
  %3 = and i8 %2, 15, !dbg !2312
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i, i32 1, !dbg !2313
    #dbg_value(ptr %incdec.ptr.i, !436, !DIExpression(), !2303)
  store i8 %3, ptr %mdec.addr.0.i, align 1, !dbg !2314
  %4 = lshr i8 %2, 4, !dbg !2315
    #dbg_value(ptr %incdec.ptr.i, !436, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2303)
  store i8 %4, ptr %incdec.ptr.i, align 1, !dbg !2316
  %incdec.ptr5.i = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i, i32 2, !dbg !2317
    #dbg_value(ptr %incdec.ptr5.i, !436, !DIExpression(), !2303)
  %inc.i = add nuw nsw i32 %i.0.i18, 1, !dbg !2318
    #dbg_value(i32 %inc.i, !438, !DIExpression(), !2303)
  br label %for.cond.i17, !dbg !2319, !llvm.loop !2320

for.cond.i21:                                     ; preds = %for.cond.i21.preheader, %for.body.i25
  %mdec.addr.0.i22 = phi ptr [ %incdec.ptr5.i29, %for.body.i25 ], [ %s, %for.cond.i21.preheader ]
  %i.0.i23 = phi i32 [ %inc.i30, %for.body.i25 ], [ 0, %for.cond.i21.preheader ], !dbg !2322
    #dbg_value(i32 %i.0.i23, !438, !DIExpression(), !2323)
    #dbg_value(ptr %mdec.addr.0.i22, !436, !DIExpression(), !2323)
  %exitcond69 = icmp ne i32 %i.0.i23, 162, !dbg !2324
  br i1 %exitcond69, label %for.body.i25, label %decode.exit31, !dbg !2309

for.body.i25:                                     ; preds = %for.cond.i21
  %arrayidx.i26 = getelementptr inbounds nuw i8, ptr %sig, i32 %i.0.i23, !dbg !2325
  %5 = load i8, ptr %arrayidx.i26, align 1, !dbg !2325
  %6 = and i8 %5, 15, !dbg !2326
  %incdec.ptr.i27 = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i22, i32 1, !dbg !2327
    #dbg_value(ptr %incdec.ptr.i27, !436, !DIExpression(), !2323)
  store i8 %6, ptr %mdec.addr.0.i22, align 1, !dbg !2328
  %7 = lshr i8 %5, 4, !dbg !2329
    #dbg_value(ptr %incdec.ptr.i27, !436, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2323)
  store i8 %7, ptr %incdec.ptr.i27, align 1, !dbg !2330
  %incdec.ptr5.i29 = getelementptr inbounds nuw i8, ptr %mdec.addr.0.i22, i32 2, !dbg !2331
    #dbg_value(ptr %incdec.ptr5.i29, !436, !DIExpression(), !2323)
  %inc.i30 = add nuw nsw i32 %i.0.i23, 1, !dbg !2332
    #dbg_value(i32 %inc.i30, !438, !DIExpression(), !2323)
  br label %for.cond.i21, !dbg !2333, !llvm.loop !2334

decode.exit31:                                    ; preds = %for.cond.i21
  call void @llvm.lifetime.start.p0(i64 512, ptr nonnull %SPS.i), !dbg !2336
  call void @llvm.lifetime.start.p0(i64 64, ptr nonnull %zero.i), !dbg !2336
    #dbg_value(ptr %p, !2341, !DIExpression(), !2342)
    #dbg_value(ptr %s, !2343, !DIExpression(), !2342)
    #dbg_value(ptr %pk, !2344, !DIExpression(), !2342)
    #dbg_value(ptr %add.ptr, !2345, !DIExpression(), !2342)
    #dbg_value(ptr %add.ptr2, !2346, !DIExpression(), !2342)
    #dbg_value(ptr %y, !2347, !DIExpression(), !2342)
    #dbg_declare(ptr %SPS.i, !2348, !DIExpression(), !2336)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(512) %SPS.i, i8 0, i32 512, i1 false), !dbg !2336
  call void @llvm.lifetime.start.p0(i64 10368, ptr nonnull %PS.i.i), !dbg !2350
    #dbg_value(ptr %p, !2355, !DIExpression(), !2356)
    #dbg_value(ptr %pk, !2357, !DIExpression(), !2356)
    #dbg_value(ptr %add.ptr, !2358, !DIExpression(), !2356)
    #dbg_value(ptr %add.ptr2, !2359, !DIExpression(), !2356)
    #dbg_value(ptr %s, !2360, !DIExpression(), !2356)
    #dbg_value(ptr %SPS.i, !2361, !DIExpression(), !2356)
    #dbg_declare(ptr %PS.i.i, !2362, !DIExpression(), !2350)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(10368) %PS.i.i, i8 0, i32 10368, i1 false), !dbg !2350
  call void @llvm.lifetime.start.p0(i64 165888, ptr nonnull %accumulator.i39), !dbg !2366
    #dbg_value(ptr %pk, !2371, !DIExpression(), !2372)
    #dbg_value(ptr %add.ptr, !2373, !DIExpression(), !2372)
    #dbg_value(ptr %add.ptr2, !2374, !DIExpression(), !2372)
    #dbg_value(ptr %s, !2375, !DIExpression(), !2372)
    #dbg_value(i32 64, !2376, !DIExpression(), !2372)
    #dbg_value(i32 64, !2377, !DIExpression(), !2372)
    #dbg_value(i32 17, !2378, !DIExpression(), !2372)
    #dbg_value(i32 4, !2379, !DIExpression(), !2372)
    #dbg_value(ptr %PS.i.i, !2380, !DIExpression(), !2372)
    #dbg_value(i32 81, !2381, !DIExpression(), !2372)
    #dbg_value(i32 4, !2382, !DIExpression(), !2372)
    #dbg_declare(ptr %accumulator.i39, !2383, !DIExpression(), !2366)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(165888) %accumulator.i39, i8 0, i32 165888, i1 false), !dbg !2366
    #dbg_value(i32 0, !2387, !DIExpression(), !2372)
    #dbg_value(i32 0, !2388, !DIExpression(), !2390)
  br label %for.cond.i40, !dbg !2391

for.cond.i40:                                     ; preds = %for.inc52.i, %decode.exit31
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc52.i ], [ 64, %decode.exit31 ], !dbg !2392
  %P1_used.0.i = phi i32 [ 0, %decode.exit31 ], [ %P1_used.1.i.lcssa, %for.inc52.i ], !dbg !2392
  %row.0.i41 = phi i32 [ 0, %decode.exit31 ], [ %inc53.i, %for.inc52.i ], !dbg !2393
    #dbg_value(i32 %row.0.i41, !2388, !DIExpression(), !2390)
    #dbg_value(i32 %P1_used.0.i, !2387, !DIExpression(), !2372)
  %exitcond76 = icmp ne i32 %row.0.i41, 64, !dbg !2394
  br i1 %exitcond76, label %for.cond2.i.preheader, label %for.cond56.i.preheader, !dbg !2396

for.cond2.i.preheader:                            ; preds = %for.cond.i40
  %8 = add i32 %P1_used.0.i, %indvars.iv, !dbg !2397
  br label %for.cond2.i, !dbg !2397

for.cond56.i.preheader:                           ; preds = %for.cond.i40
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %pk, i32 101376, !dbg !2400
  br label %for.cond56.i, !dbg !2401

for.cond2.i:                                      ; preds = %for.cond2.i.preheader, %for.inc17.i
  %P1_used.1.i = phi i32 [ %inc16.i, %for.inc17.i ], [ %P1_used.0.i, %for.cond2.i.preheader ], !dbg !2372
  %j.0.i46 = phi i32 [ %inc18.i, %for.inc17.i ], [ %row.0.i41, %for.cond2.i.preheader ], !dbg !2403
    #dbg_value(i32 %j.0.i46, !2404, !DIExpression(), !2405)
    #dbg_value(i32 %P1_used.1.i, !2387, !DIExpression(), !2372)
  %exitcond72 = icmp ne i32 %P1_used.1.i, %8, !dbg !2406
  br i1 %exitcond72, label %for.cond5.i.preheader, label %for.cond21.i.preheader, !dbg !2397

for.cond21.i.preheader:                           ; preds = %for.cond2.i
  %P1_used.1.i.lcssa = phi i32 [ %P1_used.1.i, %for.cond2.i ], !dbg !2372
  br label %for.cond21.i, !dbg !2408

for.cond5.i.preheader:                            ; preds = %for.cond2.i
  br label %for.cond5.i, !dbg !2410

for.cond5.i:                                      ; preds = %for.cond5.i.preheader, %m_vec_add.exit.i58
  %col.0.i48 = phi i32 [ %inc.i59, %m_vec_add.exit.i58 ], [ 0, %for.cond5.i.preheader ], !dbg !2413
    #dbg_value(i32 %col.0.i48, !2414, !DIExpression(), !2415)
  %exitcond71 = icmp ne i32 %col.0.i48, 4, !dbg !2416
  br i1 %exitcond71, label %for.body7.i, label %for.inc17.i, !dbg !2410

for.body7.i:                                      ; preds = %for.cond5.i
  %add.ptr.i50.idx = shl nsw i32 %P1_used.1.i, 5, !dbg !2418
  %add.ptr.i50 = getelementptr inbounds i8, ptr %pk, i32 %add.ptr.i50.idx, !dbg !2418
  %9 = shl nuw nsw i32 %row.0.i41, 6, !dbg !2420
  %10 = shl nuw nsw i32 %col.0.i48, 4, !dbg !2420
  %mul10.i = or disjoint i32 %9, %10, !dbg !2420
  %mul11.i52 = mul nuw nsw i32 %col.0.i48, 81, !dbg !2421
  %11 = getelementptr i8, ptr %s, i32 %mul11.i52, !dbg !2422
  %arrayidx.i53 = getelementptr i8, ptr %11, i32 %j.0.i46, !dbg !2422
  %12 = load i8, ptr %arrayidx.i53, align 1, !dbg !2422
  %conv.i54 = zext i8 %12 to i32, !dbg !2422
  %add13.i = add nuw nsw i32 %mul10.i, %conv.i54, !dbg !2423
  %add.ptr15.i.idx = shl nuw nsw i32 %add13.i, 5, !dbg !2424
  %add.ptr15.i = getelementptr inbounds nuw i8, ptr %accumulator.i39, i32 %add.ptr15.i.idx, !dbg !2424
    #dbg_value(i32 4, !2425, !DIExpression(), !2429)
    #dbg_value(ptr %add.ptr.i50, !2431, !DIExpression(), !2429)
    #dbg_value(ptr %add.ptr15.i, !2432, !DIExpression(), !2429)
    #dbg_value(i32 0, !2433, !DIExpression(), !2435)
  br label %for.cond.i.i55, !dbg !2436

for.cond.i.i55:                                   ; preds = %for.body.i.i60, %for.body7.i
  %i.0.i.i56 = phi i32 [ 0, %for.body7.i ], [ %inc.i.i64, %for.body.i.i60 ], !dbg !2437
    #dbg_value(i32 %i.0.i.i56, !2433, !DIExpression(), !2435)
  %exitcond70 = icmp ne i32 %i.0.i.i56, 4, !dbg !2438
  br i1 %exitcond70, label %for.body.i.i60, label %m_vec_add.exit.i58, !dbg !2440

for.body.i.i60:                                   ; preds = %for.cond.i.i55
  %arrayidx.i.i61 = getelementptr inbounds nuw i64, ptr %add.ptr.i50, i32 %i.0.i.i56, !dbg !2441
  %13 = load i64, ptr %arrayidx.i.i61, align 8, !dbg !2441
  %arrayidx1.i.i62 = getelementptr inbounds nuw i64, ptr %add.ptr15.i, i32 %i.0.i.i56, !dbg !2443
  %14 = load i64, ptr %arrayidx1.i.i62, align 8, !dbg !2444
  %xor.i.i63 = xor i64 %14, %13, !dbg !2444
  store i64 %xor.i.i63, ptr %arrayidx1.i.i62, align 8, !dbg !2444
  %inc.i.i64 = add nuw nsw i32 %i.0.i.i56, 1, !dbg !2445
    #dbg_value(i32 %inc.i.i64, !2433, !DIExpression(), !2435)
  br label %for.cond.i.i55, !dbg !2446, !llvm.loop !2447

m_vec_add.exit.i58:                               ; preds = %for.cond.i.i55
  %inc.i59 = add nuw nsw i32 %col.0.i48, 1, !dbg !2449
    #dbg_value(i32 %inc.i59, !2414, !DIExpression(), !2415)
  br label %for.cond5.i, !dbg !2450, !llvm.loop !2451

for.inc17.i:                                      ; preds = %for.cond5.i
    #dbg_value(i32 %P1_used.1.i, !2387, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2372)
  %inc16.i = add i32 %P1_used.1.i, 1, !dbg !2453
    #dbg_value(i32 %inc16.i, !2387, !DIExpression(), !2372)
  %inc18.i = add nuw nsw i32 %j.0.i46, 1, !dbg !2454
    #dbg_value(i32 %inc18.i, !2404, !DIExpression(), !2405)
  br label %for.cond2.i, !dbg !2455, !llvm.loop !2456

for.cond21.i:                                     ; preds = %for.cond21.i.preheader, %for.inc49.i
  %j20.0.i = phi i32 [ %inc50.i, %for.inc49.i ], [ 0, %for.cond21.i.preheader ], !dbg !2458
    #dbg_value(i32 %j20.0.i, !2459, !DIExpression(), !2460)
  %exitcond75 = icmp ne i32 %j20.0.i, 17, !dbg !2461
  br i1 %exitcond75, label %for.cond26.i.preheader, label %for.inc52.i, !dbg !2408

for.cond26.i.preheader:                           ; preds = %for.cond21.i
  br label %for.cond26.i, !dbg !2463

for.cond26.i:                                     ; preds = %for.cond26.i.preheader, %m_vec_add.exit18.i
  %col25.0.i = phi i32 [ %inc47.i, %m_vec_add.exit18.i ], [ 0, %for.cond26.i.preheader ], !dbg !2466
    #dbg_value(i32 %col25.0.i, !2467, !DIExpression(), !2468)
  %exitcond74 = icmp ne i32 %col25.0.i, 4, !dbg !2469
  br i1 %exitcond74, label %for.body29.i, label %for.inc49.i, !dbg !2463

for.body29.i:                                     ; preds = %for.cond26.i
  %mul30.i47 = mul nuw nsw i32 %row.0.i41, 17, !dbg !2471
  %add31.i = add nuw nsw i32 %mul30.i47, %j20.0.i, !dbg !2473
  %add.ptr33.i.idx = shl nuw nsw i32 %add31.i, 5, !dbg !2474
  %add.ptr33.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %add.ptr33.i.idx, !dbg !2474
  %15 = shl nuw nsw i32 %row.0.i41, 6, !dbg !2475
  %16 = shl nuw nsw i32 %col25.0.i, 4, !dbg !2475
  %mul37.i = or disjoint i32 %15, %16, !dbg !2475
  %mul38.i = mul nuw nsw i32 %col25.0.i, 81, !dbg !2476
  %17 = getelementptr i8, ptr %s, i32 %mul38.i, !dbg !2477
  %18 = getelementptr i8, ptr %17, i32 %j20.0.i, !dbg !2477
  %arrayidx41.i = getelementptr i8, ptr %18, i32 64, !dbg !2477
  %19 = load i8, ptr %arrayidx41.i, align 1, !dbg !2477
  %conv42.i = zext i8 %19 to i32, !dbg !2477
  %add43.i = add nuw nsw i32 %mul37.i, %conv42.i, !dbg !2478
  %add.ptr45.i.idx = shl nuw nsw i32 %add43.i, 5, !dbg !2479
  %add.ptr45.i = getelementptr inbounds nuw i8, ptr %accumulator.i39, i32 %add.ptr45.i.idx, !dbg !2479
    #dbg_value(i32 4, !2425, !DIExpression(), !2480)
    #dbg_value(ptr %add.ptr33.i, !2431, !DIExpression(), !2480)
    #dbg_value(ptr %add.ptr45.i, !2432, !DIExpression(), !2480)
    #dbg_value(i32 0, !2433, !DIExpression(), !2482)
  br label %for.cond.i10.i, !dbg !2483

for.cond.i10.i:                                   ; preds = %for.body.i13.i, %for.body29.i
  %i.0.i11.i = phi i32 [ 0, %for.body29.i ], [ %inc.i17.i, %for.body.i13.i ], !dbg !2484
    #dbg_value(i32 %i.0.i11.i, !2433, !DIExpression(), !2482)
  %exitcond73 = icmp ne i32 %i.0.i11.i, 4, !dbg !2485
  br i1 %exitcond73, label %for.body.i13.i, label %m_vec_add.exit18.i, !dbg !2486

for.body.i13.i:                                   ; preds = %for.cond.i10.i
  %arrayidx.i14.i = getelementptr inbounds nuw i64, ptr %add.ptr33.i, i32 %i.0.i11.i, !dbg !2487
  %20 = load i64, ptr %arrayidx.i14.i, align 8, !dbg !2487
  %arrayidx1.i15.i = getelementptr inbounds nuw i64, ptr %add.ptr45.i, i32 %i.0.i11.i, !dbg !2488
  %21 = load i64, ptr %arrayidx1.i15.i, align 8, !dbg !2489
  %xor.i16.i = xor i64 %21, %20, !dbg !2489
  store i64 %xor.i16.i, ptr %arrayidx1.i15.i, align 8, !dbg !2489
  %inc.i17.i = add nuw nsw i32 %i.0.i11.i, 1, !dbg !2490
    #dbg_value(i32 %inc.i17.i, !2433, !DIExpression(), !2482)
  br label %for.cond.i10.i, !dbg !2491, !llvm.loop !2492

m_vec_add.exit18.i:                               ; preds = %for.cond.i10.i
  %inc47.i = add nuw nsw i32 %col25.0.i, 1, !dbg !2494
    #dbg_value(i32 %inc47.i, !2467, !DIExpression(), !2468)
  br label %for.cond26.i, !dbg !2495, !llvm.loop !2496

for.inc49.i:                                      ; preds = %for.cond26.i
  %inc50.i = add nuw nsw i32 %j20.0.i, 1, !dbg !2498
    #dbg_value(i32 %inc50.i, !2459, !DIExpression(), !2460)
  br label %for.cond21.i, !dbg !2499, !llvm.loop !2500

for.inc52.i:                                      ; preds = %for.cond21.i
  %inc53.i = add nuw nsw i32 %row.0.i41, 1, !dbg !2502
    #dbg_value(i32 %inc53.i, !2388, !DIExpression(), !2390)
  %indvars.iv.next = add nsw i32 %indvars.iv, -1, !dbg !2503
  br label %for.cond.i40, !dbg !2503, !llvm.loop !2504

for.cond56.i:                                     ; preds = %for.cond56.i.preheader, %for.inc90.i
  %indvars.iv79 = phi i32 [ 17, %for.cond56.i.preheader ], [ %indvars.iv.next80, %for.inc90.i ], !dbg !2506
  %P3_used.0.i = phi i32 [ %P3_used.1.i.lcssa, %for.inc90.i ], [ 0, %for.cond56.i.preheader ], !dbg !2506
  %row55.0.i = phi i32 [ %inc91.i, %for.inc90.i ], [ 64, %for.cond56.i.preheader ], !dbg !2507
    #dbg_value(i32 %row55.0.i, !2508, !DIExpression(), !2509)
    #dbg_value(i32 %P3_used.0.i, !2510, !DIExpression(), !2372)
  %exitcond82 = icmp ne i32 %row55.0.i, 81, !dbg !2511
  br i1 %exitcond82, label %for.cond61.i.preheader, label %while.cond.i43.preheader, !dbg !2401

for.cond61.i.preheader:                           ; preds = %for.cond56.i
  %22 = add i32 %P3_used.0.i, %indvars.iv79, !dbg !2513
  br label %for.cond61.i, !dbg !2513

while.cond.i43.preheader:                         ; preds = %for.cond56.i
  br label %while.cond.i43, !dbg !2516

for.cond61.i:                                     ; preds = %for.cond61.i.preheader, %for.inc87.i
  %P3_used.1.i = phi i32 [ %inc86.i, %for.inc87.i ], [ %P3_used.0.i, %for.cond61.i.preheader ], !dbg !2372
  %j60.0.i = phi i32 [ %inc88.i, %for.inc87.i ], [ %row55.0.i, %for.cond61.i.preheader ], !dbg !2517
    #dbg_value(i32 %j60.0.i, !2518, !DIExpression(), !2519)
    #dbg_value(i32 %P3_used.1.i, !2510, !DIExpression(), !2372)
  %exitcond81 = icmp ne i32 %P3_used.1.i, %22, !dbg !2520
  br i1 %exitcond81, label %for.cond66.i.preheader, label %for.inc90.i, !dbg !2513

for.cond66.i.preheader:                           ; preds = %for.cond61.i
  br label %for.cond66.i, !dbg !2522

for.cond66.i:                                     ; preds = %for.cond66.i.preheader, %m_vec_add.exit9.i
  %col65.0.i = phi i32 [ %inc84.i, %m_vec_add.exit9.i ], [ 0, %for.cond66.i.preheader ], !dbg !2525
    #dbg_value(i32 %col65.0.i, !2526, !DIExpression(), !2527)
  %exitcond78 = icmp ne i32 %col65.0.i, 4, !dbg !2528
  br i1 %exitcond78, label %for.body69.i, label %for.inc87.i, !dbg !2522

for.body69.i:                                     ; preds = %for.cond66.i
  %add.ptr71.i.idx = shl nsw i32 %P3_used.1.i, 5, !dbg !2530
  %add.ptr71.i = getelementptr inbounds i8, ptr %add.ptr2, i32 %add.ptr71.i.idx, !dbg !2530
  %23 = shl nuw nsw i32 %row55.0.i, 6, !dbg !2532
  %24 = shl nuw nsw i32 %col65.0.i, 4, !dbg !2532
  %mul75.i = or disjoint i32 %23, %24, !dbg !2532
  %mul76.i = mul nuw nsw i32 %col65.0.i, 81, !dbg !2533
  %25 = getelementptr i8, ptr %s, i32 %mul76.i, !dbg !2534
  %arrayidx78.i = getelementptr i8, ptr %25, i32 %j60.0.i, !dbg !2534
  %26 = load i8, ptr %arrayidx78.i, align 1, !dbg !2534
  %conv79.i = zext i8 %26 to i32, !dbg !2534
  %add80.i = add nuw nsw i32 %mul75.i, %conv79.i, !dbg !2535
  %add.ptr82.i.idx = shl nuw nsw i32 %add80.i, 5, !dbg !2536
  %add.ptr82.i = getelementptr inbounds nuw i8, ptr %accumulator.i39, i32 %add.ptr82.i.idx, !dbg !2536
    #dbg_value(i32 4, !2425, !DIExpression(), !2537)
    #dbg_value(ptr %add.ptr71.i, !2431, !DIExpression(), !2537)
    #dbg_value(ptr %add.ptr82.i, !2432, !DIExpression(), !2537)
    #dbg_value(i32 0, !2433, !DIExpression(), !2539)
  br label %for.cond.i1.i, !dbg !2540

for.cond.i1.i:                                    ; preds = %for.body.i4.i, %for.body69.i
  %i.0.i2.i = phi i32 [ 0, %for.body69.i ], [ %inc.i8.i, %for.body.i4.i ], !dbg !2541
    #dbg_value(i32 %i.0.i2.i, !2433, !DIExpression(), !2539)
  %exitcond77 = icmp ne i32 %i.0.i2.i, 4, !dbg !2542
  br i1 %exitcond77, label %for.body.i4.i, label %m_vec_add.exit9.i, !dbg !2543

for.body.i4.i:                                    ; preds = %for.cond.i1.i
  %arrayidx.i5.i = getelementptr inbounds nuw i64, ptr %add.ptr71.i, i32 %i.0.i2.i, !dbg !2544
  %27 = load i64, ptr %arrayidx.i5.i, align 8, !dbg !2544
  %arrayidx1.i6.i = getelementptr inbounds nuw i64, ptr %add.ptr82.i, i32 %i.0.i2.i, !dbg !2545
  %28 = load i64, ptr %arrayidx1.i6.i, align 8, !dbg !2546
  %xor.i7.i = xor i64 %28, %27, !dbg !2546
  store i64 %xor.i7.i, ptr %arrayidx1.i6.i, align 8, !dbg !2546
  %inc.i8.i = add nuw nsw i32 %i.0.i2.i, 1, !dbg !2547
    #dbg_value(i32 %inc.i8.i, !2433, !DIExpression(), !2539)
  br label %for.cond.i1.i, !dbg !2548, !llvm.loop !2549

m_vec_add.exit9.i:                                ; preds = %for.cond.i1.i
  %inc84.i = add nuw nsw i32 %col65.0.i, 1, !dbg !2551
    #dbg_value(i32 %inc84.i, !2526, !DIExpression(), !2527)
  br label %for.cond66.i, !dbg !2552, !llvm.loop !2553

for.inc87.i:                                      ; preds = %for.cond66.i
    #dbg_value(i32 %P3_used.1.i, !2510, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2372)
  %inc86.i = add i32 %P3_used.1.i, 1, !dbg !2555
    #dbg_value(i32 %inc86.i, !2510, !DIExpression(), !2372)
  %inc88.i = add nuw nsw i32 %j60.0.i, 1, !dbg !2556
    #dbg_value(i32 %inc88.i, !2518, !DIExpression(), !2519)
  br label %for.cond61.i, !dbg !2557, !llvm.loop !2558

for.inc90.i:                                      ; preds = %for.cond61.i
  %P3_used.1.i.lcssa = phi i32 [ %P3_used.1.i, %for.cond61.i ], !dbg !2372
  %inc91.i = add nuw nsw i32 %row55.0.i, 1, !dbg !2560
    #dbg_value(i32 %inc91.i, !2508, !DIExpression(), !2509)
  %indvars.iv.next80 = add nsw i32 %indvars.iv79, -1, !dbg !2561
  br label %for.cond56.i, !dbg !2561, !llvm.loop !2562

while.cond.i43:                                   ; preds = %while.cond.i43.preheader, %while.body.i45
  %i.0.i44 = phi i32 [ %inc102.i, %while.body.i45 ], [ 0, %while.cond.i43.preheader ], !dbg !2372
    #dbg_value(i32 %i.0.i44, !2564, !DIExpression(), !2372)
  %exitcond83 = icmp ne i32 %i.0.i44, 324, !dbg !2565
  br i1 %exitcond83, label %while.body.i45, label %mayo_generic_m_calculate_PS.exit, !dbg !2516

while.body.i45:                                   ; preds = %while.cond.i43
  %add.ptr99.i.idx = shl nuw nsw i32 %i.0.i44, 9, !dbg !2566
  %add.ptr99.i = getelementptr inbounds nuw i8, ptr %accumulator.i39, i32 %add.ptr99.i.idx, !dbg !2566
  %add.ptr101.i.idx = shl nuw nsw i32 %i.0.i44, 5, !dbg !2568
  %add.ptr101.i = getelementptr inbounds nuw i8, ptr %PS.i.i, i32 %add.ptr101.i.idx, !dbg !2568
  call fastcc void @m_vec_multiply_bins(i32 noundef 4, ptr noundef nonnull %add.ptr99.i, ptr noundef nonnull %add.ptr101.i) #9, !dbg !2569
  %inc102.i = add nuw nsw i32 %i.0.i44, 1, !dbg !2570
    #dbg_value(i32 %inc102.i, !2564, !DIExpression(), !2372)
  br label %while.cond.i43, !dbg !2516, !llvm.loop !2571

mayo_generic_m_calculate_PS.exit:                 ; preds = %while.cond.i43
  call void @llvm.lifetime.end.p0(i64 165888, ptr nonnull %accumulator.i39), !dbg !2573
  call void @llvm.lifetime.start.p0(i64 8192, ptr nonnull %accumulator.i), !dbg !2574
    #dbg_value(ptr %PS.i.i, !2579, !DIExpression(), !2580)
    #dbg_value(ptr %s, !2581, !DIExpression(), !2580)
    #dbg_value(i32 64, !2582, !DIExpression(), !2580)
    #dbg_value(i32 4, !2583, !DIExpression(), !2580)
    #dbg_value(i32 81, !2584, !DIExpression(), !2580)
    #dbg_value(ptr %SPS.i, !2585, !DIExpression(), !2580)
    #dbg_declare(ptr %accumulator.i, !2586, !DIExpression(), !2574)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(8192) %accumulator.i, i8 0, i32 8192, i1 false), !dbg !2574
    #dbg_value(i32 4, !2587, !DIExpression(), !2580)
    #dbg_value(i32 0, !2588, !DIExpression(), !2590)
  br label %for.cond.i32, !dbg !2591

for.cond.i32:                                     ; preds = %for.inc20.i, %mayo_generic_m_calculate_PS.exit
  %row.0.i = phi i32 [ 0, %mayo_generic_m_calculate_PS.exit ], [ %inc21.i, %for.inc20.i ], !dbg !2592
    #dbg_value(i32 %row.0.i, !2588, !DIExpression(), !2590)
  %exitcond87 = icmp ne i32 %row.0.i, 4, !dbg !2593
  br i1 %exitcond87, label %for.cond1.i.preheader, label %while.cond.i.preheader, !dbg !2595

for.cond1.i.preheader:                            ; preds = %for.cond.i32
  br label %for.cond1.i, !dbg !2596

while.cond.i.preheader:                           ; preds = %for.cond.i32
  br label %while.cond.i, !dbg !2599

for.cond1.i:                                      ; preds = %for.cond1.i.preheader, %for.inc18.i
  %j.0.i = phi i32 [ %inc.i35, %for.inc18.i ], [ 0, %for.cond1.i.preheader ], !dbg !2600
    #dbg_value(i32 %j.0.i, !2601, !DIExpression(), !2602)
  %exitcond86 = icmp ne i32 %j.0.i, 81, !dbg !2603
  br i1 %exitcond86, label %for.cond4.i.preheader, label %for.inc20.i, !dbg !2596

for.cond4.i.preheader:                            ; preds = %for.cond1.i
  br label %for.cond4.i, !dbg !2605

for.cond4.i:                                      ; preds = %for.cond4.i.preheader, %m_vec_add.exit.i
  %col.0.i = phi i32 [ %add17.i, %m_vec_add.exit.i ], [ 0, %for.cond4.i.preheader ], !dbg !2608
    #dbg_value(i32 %col.0.i, !2609, !DIExpression(), !2610)
  %exitcond85 = icmp ne i32 %col.0.i, 4, !dbg !2611
  br i1 %exitcond85, label %for.body6.i, label %for.inc18.i, !dbg !2605

for.body6.i:                                      ; preds = %for.cond4.i
  %29 = shl nuw nsw i32 %j.0.i, 4, !dbg !2613
  %30 = shl nuw nsw i32 %col.0.i, 2, !dbg !2613
  %mul8.i = or disjoint i32 %29, %30, !dbg !2613
  %add.ptr.i37 = getelementptr inbounds nuw i64, ptr %PS.i.i, i32 %mul8.i, !dbg !2615
  %31 = shl nuw nsw i32 %row.0.i, 6, !dbg !2616
  %32 = shl nuw nsw i32 %col.0.i, 4, !dbg !2616
  %mul11.i = or disjoint i32 %31, %32, !dbg !2616
  %mul12.i = mul nuw nsw i32 %row.0.i, 81, !dbg !2617
  %33 = getelementptr i8, ptr %s, i32 %mul12.i, !dbg !2618
  %arrayidx.i38 = getelementptr i8, ptr %33, i32 %j.0.i, !dbg !2618
  %34 = load i8, ptr %arrayidx.i38, align 1, !dbg !2618
  %conv.i = zext i8 %34 to i32, !dbg !2618
  %add14.i = add nuw nsw i32 %mul11.i, %conv.i, !dbg !2619
  %add.ptr16.i.idx = shl nuw nsw i32 %add14.i, 5, !dbg !2620
  %add.ptr16.i = getelementptr inbounds nuw i8, ptr %accumulator.i, i32 %add.ptr16.i.idx, !dbg !2620
    #dbg_value(i32 4, !2425, !DIExpression(), !2621)
    #dbg_value(ptr %add.ptr.i37, !2431, !DIExpression(), !2621)
    #dbg_value(ptr %add.ptr16.i, !2432, !DIExpression(), !2621)
    #dbg_value(i32 0, !2433, !DIExpression(), !2623)
  br label %for.cond.i.i, !dbg !2624

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body6.i
  %i.0.i.i = phi i32 [ 0, %for.body6.i ], [ %inc.i.i, %for.body.i.i ], !dbg !2625
    #dbg_value(i32 %i.0.i.i, !2433, !DIExpression(), !2623)
  %exitcond84 = icmp ne i32 %i.0.i.i, 4, !dbg !2626
  br i1 %exitcond84, label %for.body.i.i, label %m_vec_add.exit.i, !dbg !2627

for.body.i.i:                                     ; preds = %for.cond.i.i
  %arrayidx.i.i = getelementptr inbounds nuw i64, ptr %add.ptr.i37, i32 %i.0.i.i, !dbg !2628
  %35 = load i64, ptr %arrayidx.i.i, align 8, !dbg !2628
  %arrayidx1.i.i = getelementptr inbounds nuw i64, ptr %add.ptr16.i, i32 %i.0.i.i, !dbg !2629
  %36 = load i64, ptr %arrayidx1.i.i, align 8, !dbg !2630
  %xor.i.i = xor i64 %36, %35, !dbg !2630
  store i64 %xor.i.i, ptr %arrayidx1.i.i, align 8, !dbg !2630
  %inc.i.i = add nuw nsw i32 %i.0.i.i, 1, !dbg !2631
    #dbg_value(i32 %inc.i.i, !2433, !DIExpression(), !2623)
  br label %for.cond.i.i, !dbg !2632, !llvm.loop !2633

m_vec_add.exit.i:                                 ; preds = %for.cond.i.i
  %add17.i = add nuw nsw i32 %col.0.i, 1, !dbg !2635
    #dbg_value(i32 %add17.i, !2609, !DIExpression(), !2610)
  br label %for.cond4.i, !dbg !2636, !llvm.loop !2637

for.inc18.i:                                      ; preds = %for.cond4.i
  %inc.i35 = add nuw nsw i32 %j.0.i, 1, !dbg !2639
    #dbg_value(i32 %inc.i35, !2601, !DIExpression(), !2602)
  br label %for.cond1.i, !dbg !2640, !llvm.loop !2641

for.inc20.i:                                      ; preds = %for.cond1.i
  %inc21.i = add nuw nsw i32 %row.0.i, 1, !dbg !2643
    #dbg_value(i32 %inc21.i, !2588, !DIExpression(), !2590)
  br label %for.cond.i32, !dbg !2644, !llvm.loop !2645

while.cond.i:                                     ; preds = %while.cond.i.preheader, %while.body.i
  %i.0.i34 = phi i32 [ %inc32.i, %while.body.i ], [ 0, %while.cond.i.preheader ], !dbg !2580
    #dbg_value(i32 %i.0.i34, !2647, !DIExpression(), !2580)
  %exitcond88 = icmp ne i32 %i.0.i34, 16, !dbg !2648
  br i1 %exitcond88, label %while.body.i, label %mayo_generic_m_calculate_SPS.exit, !dbg !2599

while.body.i:                                     ; preds = %while.cond.i
  %add.ptr29.i.idx = shl nuw nsw i32 %i.0.i34, 9, !dbg !2649
  %add.ptr29.i = getelementptr inbounds nuw i8, ptr %accumulator.i, i32 %add.ptr29.i.idx, !dbg !2649
  %add.ptr31.i.idx = shl nuw nsw i32 %i.0.i34, 5, !dbg !2651
  %add.ptr31.i = getelementptr inbounds nuw i8, ptr %SPS.i, i32 %add.ptr31.i.idx, !dbg !2651
  call fastcc void @m_vec_multiply_bins(i32 noundef 4, ptr noundef nonnull %add.ptr29.i, ptr noundef nonnull %add.ptr31.i) #9, !dbg !2652
  %inc32.i = add nuw nsw i32 %i.0.i34, 1, !dbg !2653
    #dbg_value(i32 %inc32.i, !2647, !DIExpression(), !2580)
  br label %while.cond.i, !dbg !2599, !llvm.loop !2654

mayo_generic_m_calculate_SPS.exit:                ; preds = %while.cond.i
  call void @llvm.lifetime.end.p0(i64 8192, ptr nonnull %accumulator.i), !dbg !2656
  call void @llvm.lifetime.end.p0(i64 10368, ptr nonnull %PS.i.i), !dbg !2657
    #dbg_declare(ptr %zero.i, !2658, !DIExpression(), !2659)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(64) %zero.i, i8 0, i32 64, i1 false), !dbg !2659
  call fastcc void @compute_rhs(ptr noundef %p, ptr noundef nonnull %SPS.i, ptr noundef nonnull %zero.i, ptr noundef nonnull %y) #9, !dbg !2660
  call void @llvm.lifetime.end.p0(i64 512, ptr nonnull %SPS.i), !dbg !2661
  call void @llvm.lifetime.end.p0(i64 64, ptr nonnull %zero.i), !dbg !2661
  %call20 = call i32 @memcmp(ptr noundef nonnull %y, ptr noundef nonnull %t, i32 noundef 64) #8, !dbg !2662
  %cmp21 = icmp ne i32 %call20, 0, !dbg !2664
  %. = zext i1 %cmp21 to i32, !dbg !2217
  ret i32 %., !dbg !2665
}

; Function Attrs: nounwind
define dso_local i32 @pqmayo_MAYO_2_ref_mayo_expand_pk(ptr noundef %p, ptr noundef %cpk, ptr noundef %pk) local_unnamed_addr #0 !dbg !248 {
entry:
  %tmp.i2 = alloca [4 x i64], align 8
  %tmp.i = alloca [4 x i64], align 8
    #dbg_value(ptr %p, !247, !DIExpression(), !2666)
    #dbg_value(ptr %cpk, !253, !DIExpression(), !2666)
    #dbg_value(ptr %pk, !254, !DIExpression(), !2666)
    #dbg_value(ptr %p, !255, !DIExpression(), !2667)
    #dbg_value(ptr %pk, !261, !DIExpression(), !2667)
    #dbg_value(ptr %cpk, !262, !DIExpression(), !2667)
  %call.i = call i32 @AES_128_CTR(ptr noundef %pk, i32 noundef 101376, ptr noundef %cpk, i32 noundef 16) #8, !dbg !2669
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %tmp.i2), !dbg !2670
    #dbg_value(ptr %pk, !269, !DIExpression(), !2672)
    #dbg_value(ptr %pk, !271, !DIExpression(), !2672)
    #dbg_value(i32 3168, !272, !DIExpression(), !2672)
    #dbg_value(i32 64, !273, !DIExpression(), !2672)
    #dbg_value(i32 4, !274, !DIExpression(), !2672)
    #dbg_value(ptr %pk, !276, !DIExpression(), !2672)
    #dbg_declare(ptr %tmp.i2, !277, !DIExpression(), !2670)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(32) %tmp.i2, i8 0, i32 32, i1 false), !dbg !2670
    #dbg_value(i32 3168, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2673)
  br label %for.cond.i3, !dbg !2674

for.cond.i3:                                      ; preds = %for.body.i7, %entry
  %i.0.in.i4 = phi i32 [ 3168, %entry ], [ %i.0.i5, %for.body.i7 ]
    #dbg_value(i32 %i.0.in.i4, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2673)
  %cmp.i6 = icmp ugt i32 %i.0.in.i4, 0, !dbg !2675
  br i1 %cmp.i6, label %for.body.i7, label %unpack_m_vecs.exit16, !dbg !2676

for.body.i7:                                      ; preds = %for.cond.i3
  %i.0.i5 = add nsw i32 %i.0.in.i4, -1, !dbg !2677
    #dbg_value(i32 %i.0.i5, !279, !DIExpression(), !2673)
  %0 = shl i32 %i.0.i5, 5, !dbg !2678
  %div1.i91720 = and i32 %0, 2147483616, !dbg !2678
  %add.ptr.i10 = getelementptr inbounds nuw i8, ptr %pk, i32 %div1.i91720, !dbg !2679
  %call.i11 = call ptr @memcpy(ptr noundef nonnull %tmp.i2, ptr noundef %add.ptr.i10, i32 noundef 32) #8, !dbg !2680
  %mul3.i12 = shl i32 %i.0.i5, 5, !dbg !2681
  %add.ptr5.i14 = getelementptr inbounds nuw i8, ptr %pk, i32 %mul3.i12, !dbg !2682
  %call8.i15 = call ptr @memcpy(ptr noundef %add.ptr5.i14, ptr noundef nonnull %tmp.i2, i32 noundef 32) #8, !dbg !2683
    #dbg_value(i32 %i.0.i5, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2673)
  br label %for.cond.i3, !dbg !2684, !llvm.loop !2685

unpack_m_vecs.exit16:                             ; preds = %for.cond.i3
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %tmp.i2), !dbg !2687
  %add.ptr = getelementptr inbounds nuw i8, ptr %cpk, i32 16, !dbg !2688
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %pk, i32 101376, !dbg !2689
  call void @llvm.lifetime.start.p0(i64 32, ptr nonnull %tmp.i), !dbg !2690
    #dbg_value(ptr %add.ptr, !269, !DIExpression(), !2692)
    #dbg_value(ptr %add.ptr2, !271, !DIExpression(), !2692)
    #dbg_value(i32 153, !272, !DIExpression(), !2692)
    #dbg_value(i32 64, !273, !DIExpression(), !2692)
    #dbg_value(i32 4, !274, !DIExpression(), !2692)
    #dbg_value(ptr %add.ptr2, !276, !DIExpression(), !2692)
    #dbg_declare(ptr %tmp.i, !277, !DIExpression(), !2690)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(32) %tmp.i, i8 0, i32 32, i1 false), !dbg !2690
    #dbg_value(i32 153, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2693)
  br label %for.cond.i, !dbg !2694

for.cond.i:                                       ; preds = %for.body.i, %unpack_m_vecs.exit16
  %i.0.in.i = phi i32 [ 153, %unpack_m_vecs.exit16 ], [ %i.0.i, %for.body.i ]
    #dbg_value(i32 %i.0.in.i, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2693)
  %cmp.i = icmp ugt i32 %i.0.in.i, 0, !dbg !2695
  br i1 %cmp.i, label %for.body.i, label %unpack_m_vecs.exit, !dbg !2696

for.body.i:                                       ; preds = %for.cond.i
  %i.0.i = add nsw i32 %i.0.in.i, -1, !dbg !2697
    #dbg_value(i32 %i.0.i, !279, !DIExpression(), !2693)
  %1 = shl i32 %i.0.i, 5, !dbg !2698
  %div1.i1819 = and i32 %1, 2147483616, !dbg !2698
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %div1.i1819, !dbg !2699
  %call.i1 = call ptr @memcpy(ptr noundef nonnull %tmp.i, ptr noundef nonnull %add.ptr.i, i32 noundef 32) #8, !dbg !2700
  %mul3.i = shl i32 %i.0.i, 5, !dbg !2701
  %add.ptr5.i = getelementptr inbounds nuw i8, ptr %add.ptr2, i32 %mul3.i, !dbg !2702
  %call8.i = call ptr @memcpy(ptr noundef nonnull %add.ptr5.i, ptr noundef nonnull %tmp.i, i32 noundef 32) #8, !dbg !2703
    #dbg_value(i32 %i.0.i, !279, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !2693)
  br label %for.cond.i, !dbg !2704, !llvm.loop !2705

unpack_m_vecs.exit:                               ; preds = %for.cond.i
  call void @llvm.lifetime.end.p0(i64 32, ptr nonnull %tmp.i), !dbg !2707
  ret i32 0, !dbg !2708
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_multiply_bins(i32 noundef %m_vec_limbs, ptr noundef %bins, ptr noundef %out) unnamed_addr #0 !dbg !2709 {
entry:
    #dbg_value(i32 %m_vec_limbs, !2712, !DIExpression(), !2713)
    #dbg_value(ptr %bins, !2714, !DIExpression(), !2713)
    #dbg_value(ptr %out, !2715, !DIExpression(), !2713)
  %add.ptr = getelementptr inbounds nuw i8, ptr %bins, i32 160, !dbg !2716
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %bins, i32 320, !dbg !2717
    #dbg_value(i32 %m_vec_limbs, !2718, !DIExpression(), !2720)
    #dbg_value(ptr %add.ptr, !2722, !DIExpression(), !2720)
    #dbg_value(ptr %add.ptr1, !2723, !DIExpression(), !2720)
    #dbg_value(i64 1229782938247303441, !2724, !DIExpression(), !2720)
    #dbg_value(i32 0, !2725, !DIExpression(), !2727)
  br label %for.cond.i77, !dbg !2728

for.cond.i77:                                     ; preds = %for.body.i80, %entry
  %i.0.i78 = phi i32 [ 0, %entry ], [ %inc.i89, %for.body.i80 ], !dbg !2729
    #dbg_value(i32 %i.0.i78, !2725, !DIExpression(), !2727)
  %exitcond = icmp ne i32 %i.0.i78, 4, !dbg !2730
  br i1 %exitcond, label %for.body.i80, label %m_vec_mul_add_x_inv.exit90, !dbg !2732

for.body.i80:                                     ; preds = %for.cond.i77
  %arrayidx.i81 = getelementptr inbounds nuw i64, ptr %add.ptr, i32 %i.0.i78, !dbg !2733
  %0 = load i64, ptr %arrayidx.i81, align 8, !dbg !2733
  %and.i82 = and i64 %0, 1229782938247303441, !dbg !2735
    #dbg_value(i64 %and.i82, !2736, !DIExpression(), !2737)
  %xor.i83 = lshr i64 %0, 1, !dbg !2738
  %shr.i84 = and i64 %xor.i83, 8608480567731124087, !dbg !2738
  %mul.i85 = mul nuw i64 %and.i82, 9, !dbg !2739
  %xor2.i86 = xor i64 %shr.i84, %mul.i85, !dbg !2740
  %arrayidx3.i87 = getelementptr inbounds nuw i64, ptr %add.ptr1, i32 %i.0.i78, !dbg !2741
  %1 = load i64, ptr %arrayidx3.i87, align 8, !dbg !2742
  %xor4.i88 = xor i64 %1, %xor2.i86, !dbg !2742
  store i64 %xor4.i88, ptr %arrayidx3.i87, align 8, !dbg !2742
  %inc.i89 = add nuw nsw i32 %i.0.i78, 1, !dbg !2743
    #dbg_value(i32 %inc.i89, !2725, !DIExpression(), !2727)
  br label %for.cond.i77, !dbg !2744, !llvm.loop !2745

m_vec_mul_add_x_inv.exit90:                       ; preds = %for.cond.i77
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %bins, i32 352, !dbg !2747
  %add.ptr3 = getelementptr inbounds nuw i8, ptr %bins, i32 384, !dbg !2748
    #dbg_value(i32 %m_vec_limbs, !2749, !DIExpression(), !2751)
    #dbg_value(ptr %add.ptr2, !2753, !DIExpression(), !2751)
    #dbg_value(ptr %add.ptr3, !2754, !DIExpression(), !2751)
    #dbg_value(i64 -8608480567731124088, !2755, !DIExpression(), !2751)
    #dbg_value(i32 0, !2756, !DIExpression(), !2758)
  br label %for.cond.i104, !dbg !2759

for.cond.i104:                                    ; preds = %for.body.i107, %m_vec_mul_add_x_inv.exit90
  %i.0.i105 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit90 ], [ %inc.i117, %for.body.i107 ], !dbg !2760
    #dbg_value(i32 %i.0.i105, !2756, !DIExpression(), !2758)
  %exitcond194 = icmp ne i32 %i.0.i105, 4, !dbg !2761
  br i1 %exitcond194, label %for.body.i107, label %m_vec_mul_add_x.exit118, !dbg !2763

for.body.i107:                                    ; preds = %for.cond.i104
  %arrayidx.i108 = getelementptr inbounds nuw i64, ptr %add.ptr2, i32 %i.0.i105, !dbg !2764
  %2 = load i64, ptr %arrayidx.i108, align 8, !dbg !2764
    #dbg_value(i64 %2, !2766, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2767)
  %xor.i109 = shl i64 %2, 1, !dbg !2768
  %shl.i110 = and i64 %xor.i109, -1229782938247303442, !dbg !2768
  %and.i111 = lshr i64 %2, 3, !dbg !2769
  %shr.i112 = and i64 %and.i111, 1229782938247303441, !dbg !2769
  %mul.i113 = mul nuw nsw i64 %shr.i112, 3, !dbg !2770
  %xor2.i114 = xor i64 %shl.i110, %mul.i113, !dbg !2771
  %arrayidx3.i115 = getelementptr inbounds nuw i64, ptr %add.ptr3, i32 %i.0.i105, !dbg !2772
  %3 = load i64, ptr %arrayidx3.i115, align 8, !dbg !2773
  %xor4.i116 = xor i64 %3, %xor2.i114, !dbg !2773
  store i64 %xor4.i116, ptr %arrayidx3.i115, align 8, !dbg !2773
  %inc.i117 = add nuw nsw i32 %i.0.i105, 1, !dbg !2774
    #dbg_value(i32 %inc.i117, !2756, !DIExpression(), !2758)
  br label %for.cond.i104, !dbg !2775, !llvm.loop !2776

m_vec_mul_add_x.exit118:                          ; preds = %for.cond.i104
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %bins, i32 320, !dbg !2778
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %bins, i32 224, !dbg !2779
    #dbg_value(i32 %m_vec_limbs, !2718, !DIExpression(), !2780)
    #dbg_value(ptr %add.ptr4, !2722, !DIExpression(), !2780)
    #dbg_value(ptr %add.ptr5, !2723, !DIExpression(), !2780)
    #dbg_value(i64 1229782938247303441, !2724, !DIExpression(), !2780)
    #dbg_value(i32 0, !2725, !DIExpression(), !2782)
  br label %for.cond.i49, !dbg !2783

for.cond.i49:                                     ; preds = %for.body.i52, %m_vec_mul_add_x.exit118
  %i.0.i50 = phi i32 [ 0, %m_vec_mul_add_x.exit118 ], [ %inc.i61, %for.body.i52 ], !dbg !2784
    #dbg_value(i32 %i.0.i50, !2725, !DIExpression(), !2782)
  %exitcond195 = icmp ne i32 %i.0.i50, 4, !dbg !2785
  br i1 %exitcond195, label %for.body.i52, label %m_vec_mul_add_x_inv.exit62, !dbg !2786

for.body.i52:                                     ; preds = %for.cond.i49
  %arrayidx.i53 = getelementptr inbounds nuw i64, ptr %add.ptr4, i32 %i.0.i50, !dbg !2787
  %4 = load i64, ptr %arrayidx.i53, align 8, !dbg !2787
  %and.i54 = and i64 %4, 1229782938247303441, !dbg !2788
    #dbg_value(i64 %and.i54, !2736, !DIExpression(), !2789)
  %xor.i55 = lshr i64 %4, 1, !dbg !2790
  %shr.i56 = and i64 %xor.i55, 8608480567731124087, !dbg !2790
  %mul.i57 = mul nuw i64 %and.i54, 9, !dbg !2791
  %xor2.i58 = xor i64 %shr.i56, %mul.i57, !dbg !2792
  %arrayidx3.i59 = getelementptr inbounds nuw i64, ptr %add.ptr5, i32 %i.0.i50, !dbg !2793
  %5 = load i64, ptr %arrayidx3.i59, align 8, !dbg !2794
  %xor4.i60 = xor i64 %5, %xor2.i58, !dbg !2794
  store i64 %xor4.i60, ptr %arrayidx3.i59, align 8, !dbg !2794
  %inc.i61 = add nuw nsw i32 %i.0.i50, 1, !dbg !2795
    #dbg_value(i32 %inc.i61, !2725, !DIExpression(), !2782)
  br label %for.cond.i49, !dbg !2796, !llvm.loop !2797

m_vec_mul_add_x_inv.exit62:                       ; preds = %for.cond.i49
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %bins, i32 384, !dbg !2799
  %add.ptr7 = getelementptr inbounds nuw i8, ptr %bins, i32 192, !dbg !2800
    #dbg_value(i32 %m_vec_limbs, !2749, !DIExpression(), !2801)
    #dbg_value(ptr %add.ptr6, !2753, !DIExpression(), !2801)
    #dbg_value(ptr %add.ptr7, !2754, !DIExpression(), !2801)
    #dbg_value(i64 -8608480567731124088, !2755, !DIExpression(), !2801)
    #dbg_value(i32 0, !2756, !DIExpression(), !2803)
  br label %for.cond.i91, !dbg !2804

for.cond.i91:                                     ; preds = %for.body.i94, %m_vec_mul_add_x_inv.exit62
  %i.0.i92 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit62 ], [ %inc.i103, %for.body.i94 ], !dbg !2805
    #dbg_value(i32 %i.0.i92, !2756, !DIExpression(), !2803)
  %exitcond196 = icmp ne i32 %i.0.i92, 4, !dbg !2806
  br i1 %exitcond196, label %for.body.i94, label %m_vec_mul_add_x.exit, !dbg !2807

for.body.i94:                                     ; preds = %for.cond.i91
  %arrayidx.i95 = getelementptr inbounds nuw i64, ptr %add.ptr6, i32 %i.0.i92, !dbg !2808
  %6 = load i64, ptr %arrayidx.i95, align 8, !dbg !2808
    #dbg_value(i64 %6, !2766, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2809)
  %xor.i96 = shl i64 %6, 1, !dbg !2810
  %shl.i = and i64 %xor.i96, -1229782938247303442, !dbg !2810
  %and.i97 = lshr i64 %6, 3, !dbg !2811
  %shr.i98 = and i64 %and.i97, 1229782938247303441, !dbg !2811
  %mul.i99 = mul nuw nsw i64 %shr.i98, 3, !dbg !2812
  %xor2.i100 = xor i64 %shl.i, %mul.i99, !dbg !2813
  %arrayidx3.i101 = getelementptr inbounds nuw i64, ptr %add.ptr7, i32 %i.0.i92, !dbg !2814
  %7 = load i64, ptr %arrayidx3.i101, align 8, !dbg !2815
  %xor4.i102 = xor i64 %7, %xor2.i100, !dbg !2815
  store i64 %xor4.i102, ptr %arrayidx3.i101, align 8, !dbg !2815
  %inc.i103 = add nuw nsw i32 %i.0.i92, 1, !dbg !2816
    #dbg_value(i32 %inc.i103, !2756, !DIExpression(), !2803)
  br label %for.cond.i91, !dbg !2817, !llvm.loop !2818

m_vec_mul_add_x.exit:                             ; preds = %for.cond.i91
  %add.ptr8 = getelementptr inbounds nuw i8, ptr %bins, i32 224, !dbg !2820
  %add.ptr9 = getelementptr inbounds nuw i8, ptr %bins, i32 448, !dbg !2821
    #dbg_value(i32 %m_vec_limbs, !2718, !DIExpression(), !2822)
    #dbg_value(ptr %add.ptr8, !2722, !DIExpression(), !2822)
    #dbg_value(ptr %add.ptr9, !2723, !DIExpression(), !2822)
    #dbg_value(i64 1229782938247303441, !2724, !DIExpression(), !2822)
    #dbg_value(i32 0, !2725, !DIExpression(), !2824)
  br label %for.cond.i7, !dbg !2825

for.cond.i7:                                      ; preds = %for.body.i10, %m_vec_mul_add_x.exit
  %i.0.i8 = phi i32 [ 0, %m_vec_mul_add_x.exit ], [ %inc.i19, %for.body.i10 ], !dbg !2826
    #dbg_value(i32 %i.0.i8, !2725, !DIExpression(), !2824)
  %exitcond197 = icmp ne i32 %i.0.i8, 4, !dbg !2827
  br i1 %exitcond197, label %for.body.i10, label %m_vec_mul_add_x_inv.exit20, !dbg !2828

for.body.i10:                                     ; preds = %for.cond.i7
  %arrayidx.i11 = getelementptr inbounds nuw i64, ptr %add.ptr8, i32 %i.0.i8, !dbg !2829
  %8 = load i64, ptr %arrayidx.i11, align 8, !dbg !2829
  %and.i12 = and i64 %8, 1229782938247303441, !dbg !2830
    #dbg_value(i64 %and.i12, !2736, !DIExpression(), !2831)
  %xor.i13 = lshr i64 %8, 1, !dbg !2832
  %shr.i14 = and i64 %xor.i13, 8608480567731124087, !dbg !2832
  %mul.i15 = mul nuw i64 %and.i12, 9, !dbg !2833
  %xor2.i16 = xor i64 %shr.i14, %mul.i15, !dbg !2834
  %arrayidx3.i17 = getelementptr inbounds nuw i64, ptr %add.ptr9, i32 %i.0.i8, !dbg !2835
  %9 = load i64, ptr %arrayidx3.i17, align 8, !dbg !2836
  %xor4.i18 = xor i64 %9, %xor2.i16, !dbg !2836
  store i64 %xor4.i18, ptr %arrayidx3.i17, align 8, !dbg !2836
  %inc.i19 = add nuw nsw i32 %i.0.i8, 1, !dbg !2837
    #dbg_value(i32 %inc.i19, !2725, !DIExpression(), !2824)
  br label %for.cond.i7, !dbg !2838, !llvm.loop !2839

m_vec_mul_add_x_inv.exit20:                       ; preds = %for.cond.i7
  %add.ptr10 = getelementptr inbounds nuw i8, ptr %bins, i32 192, !dbg !2841
  %add.ptr11 = getelementptr inbounds nuw i8, ptr %bins, i32 96, !dbg !2842
    #dbg_value(i32 %m_vec_limbs, !2749, !DIExpression(), !2843)
    #dbg_value(ptr %add.ptr10, !2753, !DIExpression(), !2843)
    #dbg_value(ptr %add.ptr11, !2754, !DIExpression(), !2843)
    #dbg_value(i64 -8608480567731124088, !2755, !DIExpression(), !2843)
    #dbg_value(i32 0, !2756, !DIExpression(), !2845)
  br label %for.cond.i149, !dbg !2846

for.cond.i149:                                    ; preds = %for.body.i152, %m_vec_mul_add_x_inv.exit20
  %i.0.i150 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit20 ], [ %inc.i162, %for.body.i152 ], !dbg !2847
    #dbg_value(i32 %i.0.i150, !2756, !DIExpression(), !2845)
  %exitcond198 = icmp ne i32 %i.0.i150, 4, !dbg !2848
  br i1 %exitcond198, label %for.body.i152, label %m_vec_mul_add_x.exit163, !dbg !2849

for.body.i152:                                    ; preds = %for.cond.i149
  %arrayidx.i153 = getelementptr inbounds nuw i64, ptr %add.ptr10, i32 %i.0.i150, !dbg !2850
  %10 = load i64, ptr %arrayidx.i153, align 8, !dbg !2850
    #dbg_value(i64 %10, !2766, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2851)
  %xor.i154 = shl i64 %10, 1, !dbg !2852
  %shl.i155 = and i64 %xor.i154, -1229782938247303442, !dbg !2852
  %and.i156 = lshr i64 %10, 3, !dbg !2853
  %shr.i157 = and i64 %and.i156, 1229782938247303441, !dbg !2853
  %mul.i158 = mul nuw nsw i64 %shr.i157, 3, !dbg !2854
  %xor2.i159 = xor i64 %shl.i155, %mul.i158, !dbg !2855
  %arrayidx3.i160 = getelementptr inbounds nuw i64, ptr %add.ptr11, i32 %i.0.i150, !dbg !2856
  %11 = load i64, ptr %arrayidx3.i160, align 8, !dbg !2857
  %xor4.i161 = xor i64 %11, %xor2.i159, !dbg !2857
  store i64 %xor4.i161, ptr %arrayidx3.i160, align 8, !dbg !2857
  %inc.i162 = add nuw nsw i32 %i.0.i150, 1, !dbg !2858
    #dbg_value(i32 %inc.i162, !2756, !DIExpression(), !2845)
  br label %for.cond.i149, !dbg !2859, !llvm.loop !2860

m_vec_mul_add_x.exit163:                          ; preds = %for.cond.i149
  %add.ptr12 = getelementptr inbounds nuw i8, ptr %bins, i32 448, !dbg !2862
  %add.ptr13 = getelementptr inbounds nuw i8, ptr %bins, i32 480, !dbg !2863
    #dbg_value(i32 %m_vec_limbs, !2718, !DIExpression(), !2864)
    #dbg_value(ptr %add.ptr12, !2722, !DIExpression(), !2864)
    #dbg_value(ptr %add.ptr13, !2723, !DIExpression(), !2864)
    #dbg_value(i64 1229782938247303441, !2724, !DIExpression(), !2864)
    #dbg_value(i32 0, !2725, !DIExpression(), !2866)
  br label %for.cond.i63, !dbg !2867

for.cond.i63:                                     ; preds = %for.body.i66, %m_vec_mul_add_x.exit163
  %i.0.i64 = phi i32 [ 0, %m_vec_mul_add_x.exit163 ], [ %inc.i75, %for.body.i66 ], !dbg !2868
    #dbg_value(i32 %i.0.i64, !2725, !DIExpression(), !2866)
  %exitcond199 = icmp ne i32 %i.0.i64, 4, !dbg !2869
  br i1 %exitcond199, label %for.body.i66, label %m_vec_mul_add_x_inv.exit76, !dbg !2870

for.body.i66:                                     ; preds = %for.cond.i63
  %arrayidx.i67 = getelementptr inbounds nuw i64, ptr %add.ptr12, i32 %i.0.i64, !dbg !2871
  %12 = load i64, ptr %arrayidx.i67, align 8, !dbg !2871
  %and.i68 = and i64 %12, 1229782938247303441, !dbg !2872
    #dbg_value(i64 %and.i68, !2736, !DIExpression(), !2873)
  %xor.i69 = lshr i64 %12, 1, !dbg !2874
  %shr.i70 = and i64 %xor.i69, 8608480567731124087, !dbg !2874
  %mul.i71 = mul nuw i64 %and.i68, 9, !dbg !2875
  %xor2.i72 = xor i64 %shr.i70, %mul.i71, !dbg !2876
  %arrayidx3.i73 = getelementptr inbounds nuw i64, ptr %add.ptr13, i32 %i.0.i64, !dbg !2877
  %13 = load i64, ptr %arrayidx3.i73, align 8, !dbg !2878
  %xor4.i74 = xor i64 %13, %xor2.i72, !dbg !2878
  store i64 %xor4.i74, ptr %arrayidx3.i73, align 8, !dbg !2878
  %inc.i75 = add nuw nsw i32 %i.0.i64, 1, !dbg !2879
    #dbg_value(i32 %inc.i75, !2725, !DIExpression(), !2866)
  br label %for.cond.i63, !dbg !2880, !llvm.loop !2881

m_vec_mul_add_x_inv.exit76:                       ; preds = %for.cond.i63
  %add.ptr14 = getelementptr inbounds nuw i8, ptr %bins, i32 96, !dbg !2883
  %add.ptr15 = getelementptr inbounds nuw i8, ptr %bins, i32 256, !dbg !2884
    #dbg_value(i32 %m_vec_limbs, !2749, !DIExpression(), !2885)
    #dbg_value(ptr %add.ptr14, !2753, !DIExpression(), !2885)
    #dbg_value(ptr %add.ptr15, !2754, !DIExpression(), !2885)
    #dbg_value(i64 -8608480567731124088, !2755, !DIExpression(), !2885)
    #dbg_value(i32 0, !2756, !DIExpression(), !2887)
  br label %for.cond.i119, !dbg !2888

for.cond.i119:                                    ; preds = %for.body.i122, %m_vec_mul_add_x_inv.exit76
  %i.0.i120 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit76 ], [ %inc.i132, %for.body.i122 ], !dbg !2889
    #dbg_value(i32 %i.0.i120, !2756, !DIExpression(), !2887)
  %exitcond200 = icmp ne i32 %i.0.i120, 4, !dbg !2890
  br i1 %exitcond200, label %for.body.i122, label %m_vec_mul_add_x.exit133, !dbg !2891

for.body.i122:                                    ; preds = %for.cond.i119
  %arrayidx.i123 = getelementptr inbounds nuw i64, ptr %add.ptr14, i32 %i.0.i120, !dbg !2892
  %14 = load i64, ptr %arrayidx.i123, align 8, !dbg !2892
    #dbg_value(i64 %14, !2766, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2893)
  %xor.i124 = shl i64 %14, 1, !dbg !2894
  %shl.i125 = and i64 %xor.i124, -1229782938247303442, !dbg !2894
  %and.i126 = lshr i64 %14, 3, !dbg !2895
  %shr.i127 = and i64 %and.i126, 1229782938247303441, !dbg !2895
  %mul.i128 = mul nuw nsw i64 %shr.i127, 3, !dbg !2896
  %xor2.i129 = xor i64 %shl.i125, %mul.i128, !dbg !2897
  %arrayidx3.i130 = getelementptr inbounds nuw i64, ptr %add.ptr15, i32 %i.0.i120, !dbg !2898
  %15 = load i64, ptr %arrayidx3.i130, align 8, !dbg !2899
  %xor4.i131 = xor i64 %15, %xor2.i129, !dbg !2899
  store i64 %xor4.i131, ptr %arrayidx3.i130, align 8, !dbg !2899
  %inc.i132 = add nuw nsw i32 %i.0.i120, 1, !dbg !2900
    #dbg_value(i32 %inc.i132, !2756, !DIExpression(), !2887)
  br label %for.cond.i119, !dbg !2901, !llvm.loop !2902

m_vec_mul_add_x.exit133:                          ; preds = %for.cond.i119
  %add.ptr16 = getelementptr inbounds nuw i8, ptr %bins, i32 480, !dbg !2904
  %add.ptr17 = getelementptr inbounds nuw i8, ptr %bins, i32 416, !dbg !2905
    #dbg_value(i32 %m_vec_limbs, !2718, !DIExpression(), !2906)
    #dbg_value(ptr %add.ptr16, !2722, !DIExpression(), !2906)
    #dbg_value(ptr %add.ptr17, !2723, !DIExpression(), !2906)
    #dbg_value(i64 1229782938247303441, !2724, !DIExpression(), !2906)
    #dbg_value(i32 0, !2725, !DIExpression(), !2908)
  br label %for.cond.i1, !dbg !2909

for.cond.i1:                                      ; preds = %for.body.i4, %m_vec_mul_add_x.exit133
  %i.0.i2 = phi i32 [ 0, %m_vec_mul_add_x.exit133 ], [ %inc.i6, %for.body.i4 ], !dbg !2910
    #dbg_value(i32 %i.0.i2, !2725, !DIExpression(), !2908)
  %exitcond201 = icmp ne i32 %i.0.i2, 4, !dbg !2911
  br i1 %exitcond201, label %for.body.i4, label %m_vec_mul_add_x_inv.exit, !dbg !2912

for.body.i4:                                      ; preds = %for.cond.i1
  %arrayidx.i5 = getelementptr inbounds nuw i64, ptr %add.ptr16, i32 %i.0.i2, !dbg !2913
  %16 = load i64, ptr %arrayidx.i5, align 8, !dbg !2913
  %and.i = and i64 %16, 1229782938247303441, !dbg !2914
    #dbg_value(i64 %and.i, !2736, !DIExpression(), !2915)
  %xor.i = lshr i64 %16, 1, !dbg !2916
  %shr.i = and i64 %xor.i, 8608480567731124087, !dbg !2916
  %mul.i = mul nuw i64 %and.i, 9, !dbg !2917
  %xor2.i = xor i64 %shr.i, %mul.i, !dbg !2918
  %arrayidx3.i = getelementptr inbounds nuw i64, ptr %add.ptr17, i32 %i.0.i2, !dbg !2919
  %17 = load i64, ptr %arrayidx3.i, align 8, !dbg !2920
  %xor4.i = xor i64 %17, %xor2.i, !dbg !2920
  store i64 %xor4.i, ptr %arrayidx3.i, align 8, !dbg !2920
  %inc.i6 = add nuw nsw i32 %i.0.i2, 1, !dbg !2921
    #dbg_value(i32 %inc.i6, !2725, !DIExpression(), !2908)
  br label %for.cond.i1, !dbg !2922, !llvm.loop !2923

m_vec_mul_add_x_inv.exit:                         ; preds = %for.cond.i1
  %add.ptr18 = getelementptr inbounds nuw i8, ptr %bins, i32 256, !dbg !2925
  %add.ptr19 = getelementptr inbounds nuw i8, ptr %bins, i32 128, !dbg !2926
    #dbg_value(i32 %m_vec_limbs, !2749, !DIExpression(), !2927)
    #dbg_value(ptr %add.ptr18, !2753, !DIExpression(), !2927)
    #dbg_value(ptr %add.ptr19, !2754, !DIExpression(), !2927)
    #dbg_value(i64 -8608480567731124088, !2755, !DIExpression(), !2927)
    #dbg_value(i32 0, !2756, !DIExpression(), !2929)
  br label %for.cond.i134, !dbg !2930

for.cond.i134:                                    ; preds = %for.body.i137, %m_vec_mul_add_x_inv.exit
  %i.0.i135 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit ], [ %inc.i147, %for.body.i137 ], !dbg !2931
    #dbg_value(i32 %i.0.i135, !2756, !DIExpression(), !2929)
  %exitcond202 = icmp ne i32 %i.0.i135, 4, !dbg !2932
  br i1 %exitcond202, label %for.body.i137, label %m_vec_mul_add_x.exit148, !dbg !2933

for.body.i137:                                    ; preds = %for.cond.i134
  %arrayidx.i138 = getelementptr inbounds nuw i64, ptr %add.ptr18, i32 %i.0.i135, !dbg !2934
  %18 = load i64, ptr %arrayidx.i138, align 8, !dbg !2934
    #dbg_value(i64 %18, !2766, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2935)
  %xor.i139 = shl i64 %18, 1, !dbg !2936
  %shl.i140 = and i64 %xor.i139, -1229782938247303442, !dbg !2936
  %and.i141 = lshr i64 %18, 3, !dbg !2937
  %shr.i142 = and i64 %and.i141, 1229782938247303441, !dbg !2937
  %mul.i143 = mul nuw nsw i64 %shr.i142, 3, !dbg !2938
  %xor2.i144 = xor i64 %shl.i140, %mul.i143, !dbg !2939
  %arrayidx3.i145 = getelementptr inbounds nuw i64, ptr %add.ptr19, i32 %i.0.i135, !dbg !2940
  %19 = load i64, ptr %arrayidx3.i145, align 8, !dbg !2941
  %xor4.i146 = xor i64 %19, %xor2.i144, !dbg !2941
  store i64 %xor4.i146, ptr %arrayidx3.i145, align 8, !dbg !2941
  %inc.i147 = add nuw nsw i32 %i.0.i135, 1, !dbg !2942
    #dbg_value(i32 %inc.i147, !2756, !DIExpression(), !2929)
  br label %for.cond.i134, !dbg !2943, !llvm.loop !2944

m_vec_mul_add_x.exit148:                          ; preds = %for.cond.i134
  %add.ptr20 = getelementptr inbounds nuw i8, ptr %bins, i32 416, !dbg !2946
  %add.ptr21 = getelementptr inbounds nuw i8, ptr %bins, i32 288, !dbg !2947
    #dbg_value(i32 %m_vec_limbs, !2718, !DIExpression(), !2948)
    #dbg_value(ptr %add.ptr20, !2722, !DIExpression(), !2948)
    #dbg_value(ptr %add.ptr21, !2723, !DIExpression(), !2948)
    #dbg_value(i64 1229782938247303441, !2724, !DIExpression(), !2948)
    #dbg_value(i32 0, !2725, !DIExpression(), !2950)
  br label %for.cond.i35, !dbg !2951

for.cond.i35:                                     ; preds = %for.body.i38, %m_vec_mul_add_x.exit148
  %i.0.i36 = phi i32 [ 0, %m_vec_mul_add_x.exit148 ], [ %inc.i47, %for.body.i38 ], !dbg !2952
    #dbg_value(i32 %i.0.i36, !2725, !DIExpression(), !2950)
  %exitcond203 = icmp ne i32 %i.0.i36, 4, !dbg !2953
  br i1 %exitcond203, label %for.body.i38, label %m_vec_mul_add_x_inv.exit48, !dbg !2954

for.body.i38:                                     ; preds = %for.cond.i35
  %arrayidx.i39 = getelementptr inbounds nuw i64, ptr %add.ptr20, i32 %i.0.i36, !dbg !2955
  %20 = load i64, ptr %arrayidx.i39, align 8, !dbg !2955
  %and.i40 = and i64 %20, 1229782938247303441, !dbg !2956
    #dbg_value(i64 %and.i40, !2736, !DIExpression(), !2957)
  %xor.i41 = lshr i64 %20, 1, !dbg !2958
  %shr.i42 = and i64 %xor.i41, 8608480567731124087, !dbg !2958
  %mul.i43 = mul nuw i64 %and.i40, 9, !dbg !2959
  %xor2.i44 = xor i64 %shr.i42, %mul.i43, !dbg !2960
  %arrayidx3.i45 = getelementptr inbounds nuw i64, ptr %add.ptr21, i32 %i.0.i36, !dbg !2961
  %21 = load i64, ptr %arrayidx3.i45, align 8, !dbg !2962
  %xor4.i46 = xor i64 %21, %xor2.i44, !dbg !2962
  store i64 %xor4.i46, ptr %arrayidx3.i45, align 8, !dbg !2962
  %inc.i47 = add nuw nsw i32 %i.0.i36, 1, !dbg !2963
    #dbg_value(i32 %inc.i47, !2725, !DIExpression(), !2950)
  br label %for.cond.i35, !dbg !2964, !llvm.loop !2965

m_vec_mul_add_x_inv.exit48:                       ; preds = %for.cond.i35
  %add.ptr22 = getelementptr inbounds nuw i8, ptr %bins, i32 128, !dbg !2967
  %add.ptr23 = getelementptr inbounds nuw i8, ptr %bins, i32 64, !dbg !2968
    #dbg_value(i32 %m_vec_limbs, !2749, !DIExpression(), !2969)
    #dbg_value(ptr %add.ptr22, !2753, !DIExpression(), !2969)
    #dbg_value(ptr %add.ptr23, !2754, !DIExpression(), !2969)
    #dbg_value(i64 -8608480567731124088, !2755, !DIExpression(), !2969)
    #dbg_value(i32 0, !2756, !DIExpression(), !2971)
  br label %for.cond.i179, !dbg !2972

for.cond.i179:                                    ; preds = %for.body.i182, %m_vec_mul_add_x_inv.exit48
  %i.0.i180 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit48 ], [ %inc.i192, %for.body.i182 ], !dbg !2973
    #dbg_value(i32 %i.0.i180, !2756, !DIExpression(), !2971)
  %exitcond204 = icmp ne i32 %i.0.i180, 4, !dbg !2974
  br i1 %exitcond204, label %for.body.i182, label %m_vec_mul_add_x.exit193, !dbg !2975

for.body.i182:                                    ; preds = %for.cond.i179
  %arrayidx.i183 = getelementptr inbounds nuw i64, ptr %add.ptr22, i32 %i.0.i180, !dbg !2976
  %22 = load i64, ptr %arrayidx.i183, align 8, !dbg !2976
    #dbg_value(i64 %22, !2766, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2977)
  %xor.i184 = shl i64 %22, 1, !dbg !2978
  %shl.i185 = and i64 %xor.i184, -1229782938247303442, !dbg !2978
  %and.i186 = lshr i64 %22, 3, !dbg !2979
  %shr.i187 = and i64 %and.i186, 1229782938247303441, !dbg !2979
  %mul.i188 = mul nuw nsw i64 %shr.i187, 3, !dbg !2980
  %xor2.i189 = xor i64 %shl.i185, %mul.i188, !dbg !2981
  %arrayidx3.i190 = getelementptr inbounds nuw i64, ptr %add.ptr23, i32 %i.0.i180, !dbg !2982
  %23 = load i64, ptr %arrayidx3.i190, align 8, !dbg !2983
  %xor4.i191 = xor i64 %23, %xor2.i189, !dbg !2983
  store i64 %xor4.i191, ptr %arrayidx3.i190, align 8, !dbg !2983
  %inc.i192 = add nuw nsw i32 %i.0.i180, 1, !dbg !2984
    #dbg_value(i32 %inc.i192, !2756, !DIExpression(), !2971)
  br label %for.cond.i179, !dbg !2985, !llvm.loop !2986

m_vec_mul_add_x.exit193:                          ; preds = %for.cond.i179
  %add.ptr24 = getelementptr inbounds nuw i8, ptr %bins, i32 288, !dbg !2988
  %add.ptr25 = getelementptr inbounds nuw i8, ptr %bins, i32 32, !dbg !2989
    #dbg_value(i32 %m_vec_limbs, !2718, !DIExpression(), !2990)
    #dbg_value(ptr %add.ptr24, !2722, !DIExpression(), !2990)
    #dbg_value(ptr %add.ptr25, !2723, !DIExpression(), !2990)
    #dbg_value(i64 1229782938247303441, !2724, !DIExpression(), !2990)
    #dbg_value(i32 0, !2725, !DIExpression(), !2992)
  br label %for.cond.i21, !dbg !2993

for.cond.i21:                                     ; preds = %for.body.i24, %m_vec_mul_add_x.exit193
  %i.0.i22 = phi i32 [ 0, %m_vec_mul_add_x.exit193 ], [ %inc.i33, %for.body.i24 ], !dbg !2994
    #dbg_value(i32 %i.0.i22, !2725, !DIExpression(), !2992)
  %exitcond205 = icmp ne i32 %i.0.i22, 4, !dbg !2995
  br i1 %exitcond205, label %for.body.i24, label %m_vec_mul_add_x_inv.exit34, !dbg !2996

for.body.i24:                                     ; preds = %for.cond.i21
  %arrayidx.i25 = getelementptr inbounds nuw i64, ptr %add.ptr24, i32 %i.0.i22, !dbg !2997
  %24 = load i64, ptr %arrayidx.i25, align 8, !dbg !2997
  %and.i26 = and i64 %24, 1229782938247303441, !dbg !2998
    #dbg_value(i64 %and.i26, !2736, !DIExpression(), !2999)
  %xor.i27 = lshr i64 %24, 1, !dbg !3000
  %shr.i28 = and i64 %xor.i27, 8608480567731124087, !dbg !3000
  %mul.i29 = mul nuw i64 %and.i26, 9, !dbg !3001
  %xor2.i30 = xor i64 %shr.i28, %mul.i29, !dbg !3002
  %arrayidx3.i31 = getelementptr inbounds nuw i64, ptr %add.ptr25, i32 %i.0.i22, !dbg !3003
  %25 = load i64, ptr %arrayidx3.i31, align 8, !dbg !3004
  %xor4.i32 = xor i64 %25, %xor2.i30, !dbg !3004
  store i64 %xor4.i32, ptr %arrayidx3.i31, align 8, !dbg !3004
  %inc.i33 = add nuw nsw i32 %i.0.i22, 1, !dbg !3005
    #dbg_value(i32 %inc.i33, !2725, !DIExpression(), !2992)
  br label %for.cond.i21, !dbg !3006, !llvm.loop !3007

m_vec_mul_add_x_inv.exit34:                       ; preds = %for.cond.i21
  %add.ptr26 = getelementptr inbounds nuw i8, ptr %bins, i32 64, !dbg !3009
  %add.ptr27 = getelementptr inbounds nuw i8, ptr %bins, i32 32, !dbg !3010
    #dbg_value(i32 %m_vec_limbs, !2749, !DIExpression(), !3011)
    #dbg_value(ptr %add.ptr26, !2753, !DIExpression(), !3011)
    #dbg_value(ptr %add.ptr27, !2754, !DIExpression(), !3011)
    #dbg_value(i64 -8608480567731124088, !2755, !DIExpression(), !3011)
    #dbg_value(i32 0, !2756, !DIExpression(), !3013)
  br label %for.cond.i164, !dbg !3014

for.cond.i164:                                    ; preds = %for.body.i167, %m_vec_mul_add_x_inv.exit34
  %i.0.i165 = phi i32 [ 0, %m_vec_mul_add_x_inv.exit34 ], [ %inc.i177, %for.body.i167 ], !dbg !3015
    #dbg_value(i32 %i.0.i165, !2756, !DIExpression(), !3013)
  %exitcond206 = icmp ne i32 %i.0.i165, 4, !dbg !3016
  br i1 %exitcond206, label %for.body.i167, label %m_vec_mul_add_x.exit178, !dbg !3017

for.body.i167:                                    ; preds = %for.cond.i164
  %arrayidx.i168 = getelementptr inbounds nuw i64, ptr %add.ptr26, i32 %i.0.i165, !dbg !3018
  %26 = load i64, ptr %arrayidx.i168, align 8, !dbg !3018
    #dbg_value(i64 %26, !2766, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !3019)
  %xor.i169 = shl i64 %26, 1, !dbg !3020
  %shl.i170 = and i64 %xor.i169, -1229782938247303442, !dbg !3020
  %and.i171 = lshr i64 %26, 3, !dbg !3021
  %shr.i172 = and i64 %and.i171, 1229782938247303441, !dbg !3021
  %mul.i173 = mul nuw nsw i64 %shr.i172, 3, !dbg !3022
  %xor2.i174 = xor i64 %shl.i170, %mul.i173, !dbg !3023
  %arrayidx3.i175 = getelementptr inbounds nuw i64, ptr %add.ptr27, i32 %i.0.i165, !dbg !3024
  %27 = load i64, ptr %arrayidx3.i175, align 8, !dbg !3025
  %xor4.i176 = xor i64 %27, %xor2.i174, !dbg !3025
  store i64 %xor4.i176, ptr %arrayidx3.i175, align 8, !dbg !3025
  %inc.i177 = add nuw nsw i32 %i.0.i165, 1, !dbg !3026
    #dbg_value(i32 %inc.i177, !2756, !DIExpression(), !3013)
  br label %for.cond.i164, !dbg !3027, !llvm.loop !3028

m_vec_mul_add_x.exit178:                          ; preds = %for.cond.i164
  %add.ptr28 = getelementptr inbounds nuw i8, ptr %bins, i32 32, !dbg !3030
    #dbg_value(i32 %m_vec_limbs, !3031, !DIExpression(), !3033)
    #dbg_value(ptr %add.ptr28, !3035, !DIExpression(), !3033)
    #dbg_value(ptr %out, !3036, !DIExpression(), !3033)
    #dbg_value(i32 0, !3037, !DIExpression(), !3039)
  br label %for.cond.i, !dbg !3040

for.cond.i:                                       ; preds = %for.body.i, %m_vec_mul_add_x.exit178
  %i.0.i = phi i32 [ 0, %m_vec_mul_add_x.exit178 ], [ %inc.i, %for.body.i ], !dbg !3041
    #dbg_value(i32 %i.0.i, !3037, !DIExpression(), !3039)
  %exitcond207 = icmp ne i32 %i.0.i, 4, !dbg !3042
  br i1 %exitcond207, label %for.body.i, label %m_vec_copy.exit, !dbg !3044

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %add.ptr28, i32 %i.0.i, !dbg !3045
  %28 = load i64, ptr %arrayidx.i, align 8, !dbg !3045
  %arrayidx1.i = getelementptr inbounds nuw i64, ptr %out, i32 %i.0.i, !dbg !3047
  store i64 %28, ptr %arrayidx1.i, align 8, !dbg !3048
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !3049
    #dbg_value(i32 %inc.i, !3037, !DIExpression(), !3039)
  br label %for.cond.i, !dbg !3050, !llvm.loop !3051

m_vec_copy.exit:                                  ; preds = %for.cond.i
  ret void, !dbg !3053
}

; Function Attrs: nounwind
define dso_local void @pqmayo_MAYO_2_ref_m_upper(ptr noundef %p, ptr noundef %in, ptr noundef %out, i32 noundef %size) local_unnamed_addr #0 !dbg !3054 {
entry:
    #dbg_value(ptr %p, !3085, !DIExpression(), !3086)
    #dbg_value(ptr %in, !3087, !DIExpression(), !3086)
    #dbg_value(ptr %out, !3088, !DIExpression(), !3086)
    #dbg_value(i32 %size, !3089, !DIExpression(), !3086)
    #dbg_value(i32 4, !3090, !DIExpression(), !3086)
    #dbg_value(i32 0, !3091, !DIExpression(), !3086)
    #dbg_value(i32 0, !3092, !DIExpression(), !3094)
  %smax = call i32 @llvm.smax.i32(i32 %size, i32 0), !dbg !3095
  br label %for.cond, !dbg !3095

for.cond:                                         ; preds = %for.inc15, %entry
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc15 ], [ %size, %entry ], !dbg !3096
  %m_vecs_stored.0 = phi i32 [ 0, %entry ], [ %m_vecs_stored.1.lcssa, %for.inc15 ], !dbg !3096
  %r.0 = phi i32 [ 0, %entry ], [ %inc16, %for.inc15 ], !dbg !3097
    #dbg_value(i32 %r.0, !3092, !DIExpression(), !3094)
    #dbg_value(i32 %m_vecs_stored.0, !3091, !DIExpression(), !3086)
  %exitcond10 = icmp ne i32 %r.0, %smax, !dbg !3098
  br i1 %exitcond10, label %for.cond1.preheader, label %for.end17, !dbg !3100

for.cond1.preheader:                              ; preds = %for.cond
  %0 = add i32 %m_vecs_stored.0, %indvars.iv, !dbg !3101
  br label %for.cond1, !dbg !3101

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc
  %m_vecs_stored.1 = phi i32 [ %inc, %for.inc ], [ %m_vecs_stored.0, %for.cond1.preheader ], !dbg !3086
  %c.0 = phi i32 [ %inc14, %for.inc ], [ %r.0, %for.cond1.preheader ], !dbg !3104
    #dbg_value(i32 %c.0, !3105, !DIExpression(), !3106)
    #dbg_value(i32 %m_vecs_stored.1, !3091, !DIExpression(), !3086)
  %exitcond9 = icmp ne i32 %m_vecs_stored.1, %0, !dbg !3107
  br i1 %exitcond9, label %for.body3, label %for.inc15, !dbg !3101

for.body3:                                        ; preds = %for.cond1
  %mul = mul nsw i32 %r.0, %size, !dbg !3109
  %add = add nsw i32 %mul, %c.0, !dbg !3111
  %add.ptr.idx = shl nsw i32 %add, 5, !dbg !3112
  %add.ptr = getelementptr inbounds i8, ptr %in, i32 %add.ptr.idx, !dbg !3112
  %add.ptr6.idx = shl nsw i32 %m_vecs_stored.1, 5, !dbg !3113
  %add.ptr6 = getelementptr inbounds i8, ptr %out, i32 %add.ptr6.idx, !dbg !3113
    #dbg_value(i32 4, !3114, !DIExpression(), !3116)
    #dbg_value(ptr %add.ptr, !3118, !DIExpression(), !3116)
    #dbg_value(ptr %add.ptr6, !3119, !DIExpression(), !3116)
    #dbg_value(i32 0, !3120, !DIExpression(), !3122)
  br label %for.cond.i, !dbg !3123

for.cond.i:                                       ; preds = %for.body.i, %for.body3
  %i.0.i = phi i32 [ 0, %for.body3 ], [ %inc.i, %for.body.i ], !dbg !3124
    #dbg_value(i32 %i.0.i, !3120, !DIExpression(), !3122)
  %exitcond = icmp ne i32 %i.0.i, 4, !dbg !3125
  br i1 %exitcond, label %for.body.i, label %m_vec_copy.17.exit, !dbg !3127

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds nuw i64, ptr %add.ptr, i32 %i.0.i, !dbg !3128
  %1 = load i64, ptr %arrayidx.i, align 8, !dbg !3128
  %arrayidx1.i = getelementptr inbounds nuw i64, ptr %add.ptr6, i32 %i.0.i, !dbg !3130
  store i64 %1, ptr %arrayidx1.i, align 8, !dbg !3131
  %inc.i = add nuw nsw i32 %i.0.i, 1, !dbg !3132
    #dbg_value(i32 %inc.i, !3120, !DIExpression(), !3122)
  br label %for.cond.i, !dbg !3133, !llvm.loop !3134

m_vec_copy.17.exit:                               ; preds = %for.cond.i
  %cmp7.not = icmp eq i32 %r.0, %c.0, !dbg !3136
  br i1 %cmp7.not, label %for.inc, label %if.then, !dbg !3136

if.then:                                          ; preds = %m_vec_copy.17.exit
  %mul8 = mul nsw i32 %c.0, %size, !dbg !3138
  %add9 = add nsw i32 %mul8, %r.0, !dbg !3140
  %add.ptr11.idx = shl nsw i32 %add9, 5, !dbg !3141
  %add.ptr11 = getelementptr inbounds i8, ptr %in, i32 %add.ptr11.idx, !dbg !3141
  %add.ptr13.idx = shl nsw i32 %m_vecs_stored.1, 5, !dbg !3142
  %add.ptr13 = getelementptr inbounds i8, ptr %out, i32 %add.ptr13.idx, !dbg !3142
    #dbg_value(i32 4, !3143, !DIExpression(), !3145)
    #dbg_value(ptr %add.ptr11, !3147, !DIExpression(), !3145)
    #dbg_value(ptr %add.ptr13, !3148, !DIExpression(), !3145)
    #dbg_value(i32 0, !3149, !DIExpression(), !3151)
  br label %for.cond.i1, !dbg !3152

for.cond.i1:                                      ; preds = %for.body.i4, %if.then
  %i.0.i2 = phi i32 [ 0, %if.then ], [ %inc.i7, %for.body.i4 ], !dbg !3153
    #dbg_value(i32 %i.0.i2, !3149, !DIExpression(), !3151)
  %exitcond8 = icmp ne i32 %i.0.i2, 4, !dbg !3154
  br i1 %exitcond8, label %for.body.i4, label %for.inc.loopexit, !dbg !3156

for.body.i4:                                      ; preds = %for.cond.i1
  %arrayidx.i5 = getelementptr inbounds nuw i64, ptr %add.ptr11, i32 %i.0.i2, !dbg !3157
  %2 = load i64, ptr %arrayidx.i5, align 8, !dbg !3157
  %arrayidx1.i6 = getelementptr inbounds nuw i64, ptr %add.ptr13, i32 %i.0.i2, !dbg !3159
  %3 = load i64, ptr %arrayidx1.i6, align 8, !dbg !3160
  %xor.i = xor i64 %3, %2, !dbg !3160
  store i64 %xor.i, ptr %arrayidx1.i6, align 8, !dbg !3160
  %inc.i7 = add nuw nsw i32 %i.0.i2, 1, !dbg !3161
    #dbg_value(i32 %inc.i7, !3149, !DIExpression(), !3151)
  br label %for.cond.i1, !dbg !3162, !llvm.loop !3163

for.inc.loopexit:                                 ; preds = %for.cond.i1
  br label %for.inc, !dbg !3165

for.inc:                                          ; preds = %for.inc.loopexit, %m_vec_copy.17.exit
    #dbg_value(i32 %m_vecs_stored.1, !3091, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !3086)
  %inc = add i32 %m_vecs_stored.1, 1, !dbg !3165
    #dbg_value(i32 %inc, !3091, !DIExpression(), !3086)
  %inc14 = add nuw nsw i32 %c.0, 1, !dbg !3166
    #dbg_value(i32 %inc14, !3105, !DIExpression(), !3106)
  br label %for.cond1, !dbg !3167, !llvm.loop !3168

for.inc15:                                        ; preds = %for.cond1
  %m_vecs_stored.1.lcssa = phi i32 [ %m_vecs_stored.1, %for.cond1 ], !dbg !3086
  %inc16 = add nuw i32 %r.0, 1, !dbg !3170
    #dbg_value(i32 %inc16, !3092, !DIExpression(), !3094)
  %indvars.iv.next = add i32 %indvars.iv, -1, !dbg !3171
  br label %for.cond, !dbg !3171, !llvm.loop !3172

for.end17:                                        ; preds = %for.cond
  ret void, !dbg !3174
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_2_ref_sample_solution(ptr noundef %p, ptr noundef %A, ptr noundef %y, ptr noundef %r, ptr noundef %x, i32 noundef %k, i32 noundef %o, i32 noundef %m, i32 noundef %A_cols) local_unnamed_addr #0 !dbg !3175 {
entry:
  %_pivot_row.i = alloca [5 x i64], align 32
  %_pivot_row2.i = alloca [5 x i64], align 32
  %packed_A.i = alloca [320 x i64], align 32
  %temp.i = alloca [84 x i8], align 1
  %Ar = alloca [64 x i8], align 1
    #dbg_value(ptr %p, !3178, !DIExpression(), !3179)
    #dbg_value(ptr %A, !3180, !DIExpression(), !3179)
    #dbg_value(ptr %y, !3181, !DIExpression(), !3179)
    #dbg_value(ptr %r, !3182, !DIExpression(), !3179)
    #dbg_value(ptr %x, !3183, !DIExpression(), !3179)
    #dbg_value(i32 %k, !3184, !DIExpression(), !3179)
    #dbg_value(i32 %o, !3185, !DIExpression(), !3179)
    #dbg_value(i32 %m, !3186, !DIExpression(), !3179)
    #dbg_value(i32 %A_cols, !3187, !DIExpression(), !3179)
    #dbg_value(i32 0, !3188, !DIExpression(), !3190)
  %0 = mul nsw i32 %o, %k, !dbg !3191
  %smax = call i32 @llvm.smax.i32(i32 %0, i32 0), !dbg !3191
  br label %for.cond, !dbg !3191

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !3192
    #dbg_value(i32 %i.0, !3188, !DIExpression(), !3190)
  %exitcond = icmp ne i32 %i.0, %smax, !dbg !3193
  br i1 %exitcond, label %for.body, label %for.cond3.preheader, !dbg !3195

for.cond3.preheader:                              ; preds = %for.cond
  %smax37 = call i32 @llvm.smax.i32(i32 %m, i32 0), !dbg !3196
  br label %for.cond3, !dbg !3196

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !3198
  %1 = load i8, ptr %arrayidx, align 1, !dbg !3198
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !3200
  store i8 %1, ptr %arrayidx1, align 1, !dbg !3201
  %inc = add nuw i32 %i.0, 1, !dbg !3202
    #dbg_value(i32 %inc, !3188, !DIExpression(), !3190)
  br label %for.cond, !dbg !3203, !llvm.loop !3204

for.cond3:                                        ; preds = %for.cond3.preheader, %for.body5
  %i2.0 = phi i32 [ %inc12, %for.body5 ], [ 0, %for.cond3.preheader ], !dbg !3206
    #dbg_value(i32 %i2.0, !3207, !DIExpression(), !3208)
  %exitcond38 = icmp ne i32 %i2.0, %smax37, !dbg !3209
  br i1 %exitcond38, label %for.body5, label %for.end13, !dbg !3196

for.body5:                                        ; preds = %for.cond3
  %mul6 = mul nsw i32 %k, %o, !dbg !3211
  %mul7 = mul nsw i32 %k, %o, !dbg !3213
  %add = add nsw i32 %mul7, 1, !dbg !3214
  %mul8 = mul nsw i32 %i2.0, %add, !dbg !3215
  %2 = getelementptr i8, ptr %A, i32 %mul6, !dbg !3216
  %arrayidx10 = getelementptr i8, ptr %2, i32 %mul8, !dbg !3216
  store i8 0, ptr %arrayidx10, align 1, !dbg !3217
  %inc12 = add nuw i32 %i2.0, 1, !dbg !3218
    #dbg_value(i32 %inc12, !3207, !DIExpression(), !3208)
  br label %for.cond3, !dbg !3219, !llvm.loop !3220

for.end13:                                        ; preds = %for.cond3
  %mul14 = mul nsw i32 %k, %o, !dbg !3222
    #dbg_value(ptr %A, !3223, !DIExpression(), !3225)
    #dbg_value(ptr %r, !3227, !DIExpression(), !3225)
    #dbg_value(ptr %Ar, !3228, !DIExpression(), !3225)
    #dbg_value(i32 %mul14, !3229, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !3225)
    #dbg_value(i32 %m, !3230, !DIExpression(), !3225)
    #dbg_value(i32 1, !3231, !DIExpression(), !3225)
    #dbg_value(i32 0, !3232, !DIExpression(), !3234)
  %smax39 = call i32 @llvm.smax.i32(i32 %0, i32 -1), !dbg !3235
  %3 = add i32 %smax39, 1, !dbg !3235
  br label %for.cond.i, !dbg !3235

for.cond.i:                                       ; preds = %for.inc4.i, %for.end13
  %i.0.i = phi i32 [ 0, %for.end13 ], [ %inc5.i, %for.inc4.i ], !dbg !3236
  %c.addr.0.i = phi ptr [ %Ar, %for.end13 ], [ %c.addr.1.i.lcssa, %for.inc4.i ]
  %a.addr.0.i = phi ptr [ %A, %for.end13 ], [ %add.ptr6.i, %for.inc4.i ]
    #dbg_value(ptr %a.addr.0.i, !3223, !DIExpression(), !3225)
    #dbg_value(ptr %c.addr.0.i, !3228, !DIExpression(), !3225)
    #dbg_value(i32 %i.0.i, !3232, !DIExpression(), !3234)
  %exitcond41 = icmp ne i32 %i.0.i, %smax37, !dbg !3237
  br i1 %exitcond41, label %for.cond1.i.preheader, label %for.cond17.preheader, !dbg !3239

for.cond1.i.preheader:                            ; preds = %for.cond.i
  br label %for.cond1.i, !dbg !3240

for.cond17.preheader:                             ; preds = %for.cond.i
  br label %for.cond17, !dbg !3243

for.cond1.i:                                      ; preds = %for.cond1.i.preheader, %lincomb.24.exit.i
  %c.addr.1.i = phi ptr [ %incdec.ptr.i, %lincomb.24.exit.i ], [ %c.addr.0.i, %for.cond1.i.preheader ]
  %j.0.i = phi i32 [ 1, %lincomb.24.exit.i ], [ 0, %for.cond1.i.preheader ], !dbg !3245
    #dbg_value(i32 poison, !3246, !DIExpression(), !3247)
    #dbg_value(ptr %c.addr.1.i, !3228, !DIExpression(), !3225)
  %cmp2.i = icmp eq i32 %j.0.i, 0, !dbg !3248
  br i1 %cmp2.i, label %for.body3.i, label %for.inc4.i, !dbg !3240

for.body3.i:                                      ; preds = %for.cond1.i
  %add.ptr.i = getelementptr inbounds nuw i8, ptr %r, i32 %j.0.i, !dbg !3250
    #dbg_value(ptr %a.addr.0.i, !3252, !DIExpression(), !3254)
    #dbg_value(ptr %add.ptr.i, !3256, !DIExpression(), !3254)
    #dbg_value(i32 %mul14, !3257, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !3254)
    #dbg_value(i32 1, !3258, !DIExpression(), !3254)
    #dbg_value(i8 0, !3259, !DIExpression(), !3254)
    #dbg_value(i32 0, !3260, !DIExpression(), !3262)
  br label %for.cond.i.i, !dbg !3263

for.cond.i.i:                                     ; preds = %for.body.i.i, %for.body3.i
  %ret.0.i.i = phi i8 [ 0, %for.body3.i ], [ %xor1.i.i.i, %for.body.i.i ], !dbg !3254
  %b.addr.0.i.i = phi ptr [ %add.ptr.i, %for.body3.i ], [ %add.ptr.i.i, %for.body.i.i ]
  %i.0.i.i = phi i32 [ 0, %for.body3.i ], [ %inc.i.i, %for.body.i.i ], !dbg !3264
    #dbg_value(i32 %i.0.i.i, !3260, !DIExpression(), !3262)
    #dbg_value(ptr %b.addr.0.i.i, !3256, !DIExpression(), !3254)
    #dbg_value(i8 %ret.0.i.i, !3259, !DIExpression(), !3254)
  %exitcond40 = icmp eq i32 %i.0.i.i, %3, !dbg !3265
  br i1 %exitcond40, label %lincomb.24.exit.i, label %for.body.i.i, !dbg !3267

for.body.i.i:                                     ; preds = %for.cond.i.i
  %arrayidx.i.i = getelementptr inbounds nuw i8, ptr %a.addr.0.i, i32 %i.0.i.i, !dbg !3268
  %4 = load i8, ptr %arrayidx.i.i, align 1, !dbg !3268
  %5 = load i8, ptr %b.addr.0.i.i, align 1, !dbg !3270
    #dbg_value(i8 %4, !3271, !DIExpression(), !3273)
    #dbg_value(i8 %5, !3275, !DIExpression(), !3273)
  %6 = load volatile i8, ptr @pqmayo_MAYO_2_ref_unsigned_char_blocker, align 1, !dbg !3276
  %xor1.i.i = xor i8 %4, %6, !dbg !3277
    #dbg_value(i8 %xor1.i.i, !3271, !DIExpression(), !3273)
  %7 = trunc i8 %xor1.i.i to i1, !dbg !3278
    #dbg_value(i8 poison, !3279, !DIExpression(), !3273)
  %8 = and i8 %xor1.i.i, 2, !dbg !3280
  %mul9.i.i = mul i8 %8, %5, !dbg !3281
  %conv10.i.i = select i1 %7, i8 %5, i8 0, !dbg !3278
  %xor11.i.i = xor i8 %conv10.i.i, %mul9.i.i, !dbg !3282
    #dbg_value(i8 %xor11.i.i, !3279, !DIExpression(), !3273)
  %9 = and i8 %xor1.i.i, 4, !dbg !3283
  %mul16.i.i = mul i8 %9, %5, !dbg !3284
  %xor18.i.i = xor i8 %mul16.i.i, %xor11.i.i, !dbg !3285
    #dbg_value(i8 %xor18.i.i, !3279, !DIExpression(), !3273)
  %10 = and i8 %xor1.i.i, 8, !dbg !3286
  %mul23.i.i = mul i8 %10, %5, !dbg !3287
  %xor25.i.i = xor i8 %mul23.i.i, %xor18.i.i, !dbg !3288
    #dbg_value(i8 %xor25.i.i, !3279, !DIExpression(), !3273)
    #dbg_value(i8 %xor25.i.i, !3289, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !3273)
  %11 = lshr i8 %xor25.i.i, 4, !dbg !3290
  %12 = lshr i8 %xor25.i.i, 3, !dbg !3291
  %13 = and i8 %12, 14, !dbg !3291
  %14 = xor i8 %11, %13, !dbg !3292
  %xor25.masked.i.i = and i8 %xor25.i.i, 15, !dbg !3293
  %15 = xor i8 %14, %xor25.masked.i.i, !dbg !3293
    #dbg_value(i8 %15, !3294, !DIExpression(), !3273)
    #dbg_value(i8 %15, !3295, !DIExpression(), !3297)
    #dbg_value(i8 %ret.0.i.i, !3299, !DIExpression(), !3297)
  %xor1.i.i.i = xor i8 %15, %ret.0.i.i, !dbg !3300
    #dbg_value(i8 %xor1.i.i.i, !3259, !DIExpression(), !3254)
  %inc.i.i = add nuw i32 %i.0.i.i, 1, !dbg !3301
    #dbg_value(i32 %inc.i.i, !3260, !DIExpression(), !3262)
  %add.ptr.i.i = getelementptr inbounds nuw i8, ptr %b.addr.0.i.i, i32 1, !dbg !3302
    #dbg_value(ptr %add.ptr.i.i, !3256, !DIExpression(), !3254)
  br label %for.cond.i.i, !dbg !3303, !llvm.loop !3304

lincomb.24.exit.i:                                ; preds = %for.cond.i.i
  %ret.0.i.i.lcssa = phi i8 [ %ret.0.i.i, %for.cond.i.i ], !dbg !3254
  store i8 %ret.0.i.i.lcssa, ptr %c.addr.1.i, align 1, !dbg !3306
    #dbg_value(i32 1, !3246, !DIExpression(), !3247)
  %incdec.ptr.i = getelementptr inbounds nuw i8, ptr %c.addr.1.i, i32 1, !dbg !3307
    #dbg_value(ptr %incdec.ptr.i, !3228, !DIExpression(), !3225)
  br label %for.cond1.i, !dbg !3308, !llvm.loop !3309

for.inc4.i:                                       ; preds = %for.cond1.i
  %c.addr.1.i.lcssa = phi ptr [ %c.addr.1.i, %for.cond1.i ]
  %inc5.i = add nuw i32 %i.0.i, 1, !dbg !3311
    #dbg_value(i32 %inc5.i, !3232, !DIExpression(), !3234)
  %16 = getelementptr i8, ptr %a.addr.0.i, i32 %mul14, !dbg !3312
  %add.ptr6.i = getelementptr i8, ptr %16, i32 1, !dbg !3312
    #dbg_value(ptr %add.ptr6.i, !3223, !DIExpression(), !3225)
  br label %for.cond.i, !dbg !3313, !llvm.loop !3314

for.cond17:                                       ; preds = %for.cond17.preheader, %for.body19
  %i16.0 = phi i32 [ %inc29, %for.body19 ], [ 0, %for.cond17.preheader ], !dbg !3316
    #dbg_value(i32 %i16.0, !3317, !DIExpression(), !3318)
  %exitcond42 = icmp ne i32 %i16.0, %smax37, !dbg !3319
  br i1 %exitcond42, label %for.body19, label %for.end30, !dbg !3243

for.body19:                                       ; preds = %for.cond17
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %y, i32 %i16.0, !dbg !3321
  %17 = load i8, ptr %arrayidx20, align 1, !dbg !3321
  %arrayidx21 = getelementptr inbounds nuw [64 x i8], ptr %Ar, i32 0, i32 %i16.0, !dbg !3323
  %18 = load i8, ptr %arrayidx21, align 1, !dbg !3323
    #dbg_value(i8 %17, !3324, !DIExpression(), !3326)
    #dbg_value(i8 %18, !3328, !DIExpression(), !3326)
  %xor1.i = xor i8 %17, %18, !dbg !3329
  %mul22 = mul nsw i32 %k, %o, !dbg !3330
  %mul23 = mul nsw i32 %k, %o, !dbg !3331
  %add24 = add nsw i32 %mul23, 1, !dbg !3332
  %mul25 = mul nsw i32 %i16.0, %add24, !dbg !3333
  %19 = getelementptr i8, ptr %A, i32 %mul22, !dbg !3334
  %arrayidx27 = getelementptr i8, ptr %19, i32 %mul25, !dbg !3334
  store i8 %xor1.i, ptr %arrayidx27, align 1, !dbg !3335
  %inc29 = add nuw i32 %i16.0, 1, !dbg !3336
    #dbg_value(i32 %inc29, !3317, !DIExpression(), !3318)
  br label %for.cond17, !dbg !3337, !llvm.loop !3338

for.end30:                                        ; preds = %for.cond17
  %mul31 = mul nsw i32 %k, %o, !dbg !3340
  %add32 = add nsw i32 %mul31, 1, !dbg !3341
  call void @llvm.lifetime.start.p0(i64 40, ptr nonnull %_pivot_row.i), !dbg !3342
  call void @llvm.lifetime.start.p0(i64 40, ptr nonnull %_pivot_row2.i), !dbg !3342
  call void @llvm.lifetime.start.p0(i64 2560, ptr nonnull %packed_A.i), !dbg !3342
  call void @llvm.lifetime.start.p0(i64 84, ptr nonnull %temp.i), !dbg !3342
    #dbg_value(ptr %A, !3348, !DIExpression(), !3349)
    #dbg_value(i32 %m, !3350, !DIExpression(), !3349)
    #dbg_value(i32 %add32, !3351, !DIExpression(), !3349)
    #dbg_declare(ptr %_pivot_row.i, !3352, !DIExpression(), !3356)
    #dbg_declare(ptr %_pivot_row2.i, !3357, !DIExpression(), !3358)
    #dbg_declare(ptr %packed_A.i, !3359, !DIExpression(), !3342)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 32 dereferenceable(2560) %packed_A.i, i8 0, i32 2560, i1 false), !dbg !3342
  %add.i = add nsw i32 %mul31, 16, !dbg !3363
  %div.i = sdiv i32 %add.i, 16, !dbg !3364
    #dbg_value(i32 %div.i, !3365, !DIExpression(), !3349)
    #dbg_value(i32 0, !3366, !DIExpression(), !3368)
  br label %for.cond.i13, !dbg !3369

for.cond.i13:                                     ; preds = %ef_pack_m_vec.exit.i, %for.end30
  %i.0.i14 = phi i32 [ 0, %for.end30 ], [ %inc.i34, %ef_pack_m_vec.exit.i ], !dbg !3370
    #dbg_value(i32 %i.0.i14, !3366, !DIExpression(), !3368)
  %exitcond43 = icmp ne i32 %i.0.i14, %smax37, !dbg !3371
  br i1 %exitcond43, label %for.body.i, label %for.cond3.i.preheader, !dbg !3373

for.cond3.i.preheader:                            ; preds = %for.cond.i13
  %smax44 = call i32 @llvm.smax.i32(i32 %div.i, i32 0), !dbg !3374
  %smax50 = call i32 @llvm.smax.i32(i32 %0, i32 -1), !dbg !3374
  %20 = add i32 %smax50, 1, !dbg !3374
  br label %for.cond3.i, !dbg !3374

for.body.i:                                       ; preds = %for.cond.i13
  %mul.i32 = mul nsw i32 %i.0.i14, %add32, !dbg !3376
  %add.ptr.i33 = getelementptr inbounds i8, ptr %A, i32 %mul.i32, !dbg !3378
  %mul1.i = mul nsw i32 %i.0.i14, %div.i, !dbg !3379
  %add.ptr2.i = getelementptr inbounds i64, ptr %packed_A.i, i32 %mul1.i, !dbg !3380
    #dbg_value(ptr %add.ptr.i33, !3381, !DIExpression(), !3385)
    #dbg_value(ptr %add.ptr2.i, !3387, !DIExpression(), !3385)
    #dbg_value(i32 %add32, !3388, !DIExpression(), !3385)
    #dbg_value(ptr %add.ptr2.i, !3389, !DIExpression(), !3385)
    #dbg_value(i32 0, !3390, !DIExpression(), !3385)
  br label %for.cond.i57.i, !dbg !3391

for.cond.i57.i:                                   ; preds = %for.body.i61.i, %for.body.i
  %i.0.i58.i = phi i32 [ 0, %for.body.i ], [ %add8.i65.i, %for.body.i61.i ], !dbg !3393
    #dbg_value(i32 %i.0.i58.i, !3390, !DIExpression(), !3385)
  %cmp.i60.i = icmp slt i32 %i.0.i58.i, %mul31, !dbg !3394
  br i1 %cmp.i60.i, label %for.body.i61.i, label %for.end.i.i, !dbg !3396

for.body.i61.i:                                   ; preds = %for.cond.i57.i
  %arrayidx.i62.i = getelementptr inbounds nuw i8, ptr %add.ptr.i33, i32 %i.0.i58.i, !dbg !3397
  %21 = load i8, ptr %arrayidx.i62.i, align 1, !dbg !3397
  %add2.i.i = or disjoint i32 %i.0.i58.i, 1, !dbg !3399
  %arrayidx3.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i33, i32 %add2.i.i, !dbg !3400
  %22 = load i8, ptr %arrayidx3.i.i, align 1, !dbg !3400
  %shl5.i.i = shl i8 %22, 4, !dbg !3401
  %or.i.i = or i8 %shl5.i.i, %21, !dbg !3402
  %div.i63.i = lshr exact i32 %i.0.i58.i, 1, !dbg !3403
  %arrayidx7.i64.i = getelementptr inbounds nuw i8, ptr %add.ptr2.i, i32 %div.i63.i, !dbg !3404
  store i8 %or.i.i, ptr %arrayidx7.i64.i, align 1, !dbg !3405
  %add8.i65.i = add nuw nsw i32 %i.0.i58.i, 2, !dbg !3406
    #dbg_value(i32 %add8.i65.i, !3390, !DIExpression(), !3385)
  br label %for.cond.i57.i, !dbg !3407, !llvm.loop !3408

for.end.i.i:                                      ; preds = %for.cond.i57.i
  %i.0.i58.i.lcssa = phi i32 [ %i.0.i58.i, %for.cond.i57.i ], !dbg !3393
  %23 = and i32 %add32, -2147483647, !dbg !3410
  %cmp9.i.i = icmp eq i32 %23, 1, !dbg !3410
  br i1 %cmp9.i.i, label %if.then.i.i, label %ef_pack_m_vec.exit.i, !dbg !3410

if.then.i.i:                                      ; preds = %for.end.i.i
  %arrayidx12.i.i = getelementptr inbounds nuw i8, ptr %add.ptr.i33, i32 %i.0.i58.i.lcssa, !dbg !3412
  %24 = load i8, ptr %arrayidx12.i.i, align 1, !dbg !3412
  %div16.i.i = lshr exact i32 %i.0.i58.i.lcssa, 1, !dbg !3414
  %arrayidx17.i.i = getelementptr inbounds nuw i8, ptr %add.ptr2.i, i32 %div16.i.i, !dbg !3415
  store i8 %24, ptr %arrayidx17.i.i, align 1, !dbg !3416
  br label %ef_pack_m_vec.exit.i, !dbg !3417

ef_pack_m_vec.exit.i:                             ; preds = %if.then.i.i, %for.end.i.i
  %inc.i34 = add nuw i32 %i.0.i14, 1, !dbg !3418
    #dbg_value(i32 %inc.i34, !3366, !DIExpression(), !3368)
  br label %for.cond.i13, !dbg !3419, !llvm.loop !3420

for.cond3.i:                                      ; preds = %for.cond3.i.preheader, %for.inc117.i
  %pivot_col.0.i = phi i32 [ %inc118.i, %for.inc117.i ], [ 0, %for.cond3.i.preheader ], !dbg !3422
  %pivot_row.0.i = phi i32 [ %conv116.i, %for.inc117.i ], [ 0, %for.cond3.i.preheader ], !dbg !3349
    #dbg_value(i32 %pivot_row.0.i, !3423, !DIExpression(), !3349)
    #dbg_value(i32 %pivot_col.0.i, !3424, !DIExpression(), !3425)
  %exitcond51 = icmp eq i32 %pivot_col.0.i, %20, !dbg !3426
  br i1 %exitcond51, label %for.cond121.i.preheader, label %for.body5.i, !dbg !3374

for.cond121.i.preheader:                          ; preds = %for.cond3.i
  br label %for.cond121.i, !dbg !3428

for.body5.i:                                      ; preds = %for.cond3.i
  %add6.i = add nsw i32 %pivot_col.0.i, %m, !dbg !3430
  %cmp7.i.not = icmp sgt i32 %add6.i, %mul31, !dbg !3430
  %add8.i = add nsw i32 %pivot_col.0.i, %m, !dbg !3430
  %sub9.i = sub nsw i32 %add8.i, %add32, !dbg !3430
  %cond.i = select i1 %cmp7.i.not, i32 %sub9.i, i32 0, !dbg !3430
    #dbg_value(i32 %cond.i, !3432, !DIExpression(), !3433)
  %sub13.i = add nsw i32 %m, -1, !dbg !3434
    #dbg_value(i32 %cond16.i, !3435, !DIExpression(), !3433)
    #dbg_value(i32 0, !3436, !DIExpression(), !3438)
  br label %for.cond18.i, !dbg !3439

for.cond18.i:                                     ; preds = %for.body20.i, %for.body5.i
  %i17.0.i = phi i32 [ 0, %for.body5.i ], [ %inc23.i, %for.body20.i ], !dbg !3440
    #dbg_value(i32 %i17.0.i, !3436, !DIExpression(), !3438)
  %exitcond45 = icmp ne i32 %i17.0.i, %smax44, !dbg !3441
  br i1 %exitcond45, label %for.body20.i, label %for.cond25.i.preheader, !dbg !3443

for.cond25.i.preheader:                           ; preds = %for.cond18.i
  %cmp11.not.i = icmp sgt i32 %m, %pivot_col.0.i, !dbg !3434
  %cond16.i = select i1 %cmp11.not.i, i32 %pivot_col.0.i, i32 %sub13.i, !dbg !3434
  br label %for.cond25.i, !dbg !3444

for.body20.i:                                     ; preds = %for.cond18.i
  %arrayidx.i = getelementptr inbounds nuw [5 x i64], ptr %_pivot_row.i, i32 0, i32 %i17.0.i, !dbg !3446
  store i64 0, ptr %arrayidx.i, align 8, !dbg !3448
  %arrayidx21.i = getelementptr inbounds nuw [5 x i64], ptr %_pivot_row2.i, i32 0, i32 %i17.0.i, !dbg !3449
  store i64 0, ptr %arrayidx21.i, align 8, !dbg !3450
  %inc23.i = add nuw nsw i32 %i17.0.i, 1, !dbg !3451
    #dbg_value(i32 %inc23.i, !3436, !DIExpression(), !3438)
  br label %for.cond18.i, !dbg !3452, !llvm.loop !3453

for.cond25.i:                                     ; preds = %for.cond25.i.preheader, %for.end48.i
  %pivot_is_zero.0.i = phi i64 [ %not52.i, %for.end48.i ], [ -1, %for.cond25.i.preheader ], !dbg !3433
  %pivot.0.i = phi i8 [ %conv.i16.i, %for.end48.i ], [ 0, %for.cond25.i.preheader ], !dbg !3433
  %row.0.i = phi i32 [ %inc54.i, %for.end48.i ], [ %cond.i, %for.cond25.i.preheader ], !dbg !3455
    #dbg_value(i32 %row.0.i, !3456, !DIExpression(), !3455)
    #dbg_value(i8 %pivot.0.i, !3457, !DIExpression(), !3433)
    #dbg_value(i64 %pivot_is_zero.0.i, !3458, !DIExpression(), !3433)
  %add27.i = add nsw i32 %cond16.i, 32, !dbg !3459
  %cmp28.not.i = icmp sgt i32 %m, %add27.i, !dbg !3459
  %sub30.i = add nsw i32 %m, -1, !dbg !3459
  %add32.i = add nsw i32 %cond16.i, 32, !dbg !3459
  %cond34.i = select i1 %cmp28.not.i, i32 %add32.i, i32 %sub30.i, !dbg !3459
  %cmp35.not.i = icmp sgt i32 %row.0.i, %cond34.i, !dbg !3461
  br i1 %cmp35.not.i, label %for.end55.i, label %for.body36.i, !dbg !3444

for.body36.i:                                     ; preds = %for.cond25.i
    #dbg_value(i32 %row.0.i, !3462, !DIExpression(), !3467)
    #dbg_value(i32 %pivot_row.0.i, !3470, !DIExpression(), !3467)
  %xor.i6.i = xor i32 %row.0.i, %pivot_row.0.i, !dbg !3471
  %25 = load volatile i64, ptr @pqmayo_MAYO_2_ref_uint64_t_blocker, align 8, !dbg !3472
  %26 = icmp slt i32 %xor.i6.i, 1, !dbg !3473
  %27 = sext i1 %26 to i64, !dbg !3473
  %not.i = xor i64 %25, %27, !dbg !3473
    #dbg_value(i64 %not.i, !3474, !DIExpression(), !3475)
    #dbg_value(i32 %row.0.i, !3476, !DIExpression(), !3478)
    #dbg_value(i32 %pivot_row.0.i, !3480, !DIExpression(), !3478)
    #dbg_value(!DIArgList(i32 %pivot_row.0.i, i32 %row.0.i), !3481, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_LLVM_convert, 64, DW_ATE_signed, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_LLVM_convert, 64, DW_ATE_signed, DW_OP_minus, DW_OP_stack_value), !3478)
  %28 = icmp slt i32 %pivot_row.0.i, %row.0.i, !dbg !3482
  %shr.i.i = sext i1 %28 to i64, !dbg !3482
  %29 = load volatile i64, ptr @pqmayo_MAYO_2_ref_uint64_t_blocker, align 8, !dbg !3483
  %xor.i.i = xor i64 %29, %shr.i.i, !dbg !3484
    #dbg_value(i64 %xor.i.i, !3485, !DIExpression(), !3475)
    #dbg_value(i32 0, !3486, !DIExpression(), !3488)
  br label %for.cond38.i, !dbg !3489

for.cond38.i:                                     ; preds = %for.body40.i, %for.body36.i
  %j.0.i20 = phi i32 [ 0, %for.body36.i ], [ %inc47.i, %for.body40.i ], !dbg !3490
    #dbg_value(i32 %j.0.i20, !3486, !DIExpression(), !3488)
  %exitcond46 = icmp ne i32 %j.0.i20, %smax44, !dbg !3491
  br i1 %exitcond46, label %for.body40.i, label %for.end48.i, !dbg !3493

for.body40.i:                                     ; preds = %for.cond38.i
  %and.i = and i64 %xor.i.i, %pivot_is_zero.0.i, !dbg !3494
  %or.i = or i64 %and.i, %not.i, !dbg !3496
  %mul41.i = mul nsw i32 %row.0.i, %div.i, !dbg !3497
  %add42.i = add nsw i32 %mul41.i, %j.0.i20, !dbg !3498
  %arrayidx43.i = getelementptr inbounds [320 x i64], ptr %packed_A.i, i32 0, i32 %add42.i, !dbg !3499
  %30 = load i64, ptr %arrayidx43.i, align 8, !dbg !3499
  %and44.i = and i64 %or.i, %30, !dbg !3500
  %arrayidx45.i = getelementptr inbounds nuw [5 x i64], ptr %_pivot_row.i, i32 0, i32 %j.0.i20, !dbg !3501
  %31 = load i64, ptr %arrayidx45.i, align 8, !dbg !3502
  %xor.i21 = xor i64 %31, %and44.i, !dbg !3502
  store i64 %xor.i21, ptr %arrayidx45.i, align 8, !dbg !3502
  %inc47.i = add nuw nsw i32 %j.0.i20, 1, !dbg !3503
    #dbg_value(i32 %inc47.i, !3486, !DIExpression(), !3488)
  br label %for.cond38.i, !dbg !3504, !llvm.loop !3505

for.end48.i:                                      ; preds = %for.cond38.i
    #dbg_value(ptr %_pivot_row.i, !3507, !DIExpression(), !3511)
    #dbg_value(i32 %pivot_col.0.i, !3513, !DIExpression(), !3511)
  %div.i10.i35 = lshr i32 %pivot_col.0.i, 4, !dbg !3514
    #dbg_value(i32 %div.i10.i35, !3515, !DIExpression(), !3511)
    #dbg_value(i32 %pivot_col.0.i, !3516, !DIExpression(DW_OP_constu, 15, DW_OP_and, DW_OP_stack_value), !3511)
  %arrayidx.i12.i = getelementptr inbounds nuw i64, ptr %_pivot_row.i, i32 %div.i10.i35, !dbg !3517
  %32 = load i64, ptr %arrayidx.i12.i, align 8, !dbg !3517
  %rem.i11.i = shl i32 %pivot_col.0.i, 2, !dbg !3518
  %mul.i13.i = and i32 %rem.i11.i, 60, !dbg !3518
  %sh_prom.i14.i = zext nneg i32 %mul.i13.i to i64, !dbg !3519
  %shr.i15.i = lshr i64 %32, %sh_prom.i14.i, !dbg !3519
  %33 = trunc i64 %shr.i15.i to i8, !dbg !3520
  %conv.i16.i = and i8 %33, 15, !dbg !3520
    #dbg_value(i8 %conv.i16.i, !3457, !DIExpression(), !3433)
    #dbg_value(i8 %conv.i16.i, !3462, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !3521)
    #dbg_value(i32 0, !3470, !DIExpression(), !3521)
  %34 = load volatile i64, ptr @pqmayo_MAYO_2_ref_uint64_t_blocker, align 8, !dbg !3523
    #dbg_value(!DIArgList(i64 %34, i8 %conv.i16.i), !3458, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_lit0, DW_OP_ne, DW_OP_LLVM_convert, 1, DW_ATE_signed, DW_OP_LLVM_convert, 64, DW_ATE_signed, DW_OP_xor, DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_stack_value), !3433)
  %35 = icmp eq i8 %conv.i16.i, 0, !dbg !3524
  %36 = sext i1 %35 to i64, !dbg !3524
  %not52.i = xor i64 %34, %36, !dbg !3524
    #dbg_value(i64 %not52.i, !3458, !DIExpression(), !3433)
  %inc54.i = add nsw i32 %row.0.i, 1, !dbg !3525
    #dbg_value(i32 %inc54.i, !3456, !DIExpression(), !3455)
  br label %for.cond25.i, !dbg !3526, !llvm.loop !3527

for.end55.i:                                      ; preds = %for.cond25.i
  %pivot_is_zero.0.i.lcssa = phi i64 [ %pivot_is_zero.0.i, %for.cond25.i ], !dbg !3433
  %pivot.0.i.lcssa = phi i8 [ %pivot.0.i, %for.cond25.i ], !dbg !3433
    #dbg_value(i8 %pivot.0.i.lcssa, !3529, !DIExpression(), !3533)
    #dbg_value(i8 %pivot.0.i.lcssa, !3271, !DIExpression(), !3535)
    #dbg_value(i8 %pivot.0.i.lcssa, !3275, !DIExpression(), !3535)
  %37 = load volatile i8, ptr @pqmayo_MAYO_2_ref_unsigned_char_blocker, align 1, !dbg !3537
  %xor1.i17.i = xor i8 %pivot.0.i.lcssa, %37, !dbg !3538
    #dbg_value(i8 %xor1.i17.i, !3271, !DIExpression(), !3535)
  %38 = trunc i8 %xor1.i17.i to i1, !dbg !3539
    #dbg_value(i8 poison, !3279, !DIExpression(), !3535)
  %39 = and i8 %xor1.i17.i, 2, !dbg !3540
  %mul9.i.i22 = mul nuw nsw i8 %39, %pivot.0.i.lcssa, !dbg !3541
  %conv10.i.i23 = select i1 %38, i8 %pivot.0.i.lcssa, i8 0, !dbg !3539
  %xor11.i.i24 = xor i8 %conv10.i.i23, %mul9.i.i22, !dbg !3542
    #dbg_value(i8 %xor11.i.i24, !3279, !DIExpression(), !3535)
  %40 = and i8 %xor1.i17.i, 4, !dbg !3543
  %mul16.i.i25 = mul nuw nsw i8 %40, %pivot.0.i.lcssa, !dbg !3544
  %xor18.i.i26 = xor i8 %mul16.i.i25, %xor11.i.i24, !dbg !3545
    #dbg_value(i8 %xor18.i.i26, !3279, !DIExpression(), !3535)
  %41 = and i8 %xor1.i17.i, 8, !dbg !3546
  %mul23.i.i27 = mul nuw nsw i8 %41, %pivot.0.i.lcssa, !dbg !3547
  %xor25.i.i28 = xor i8 %mul23.i.i27, %xor18.i.i26, !dbg !3548
    #dbg_value(i8 %xor25.i.i28, !3279, !DIExpression(), !3535)
    #dbg_value(i8 %xor25.i.i28, !3289, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !3535)
  %42 = lshr i8 %xor25.i.i28, 4, !dbg !3549
  %43 = lshr i8 %xor25.i.i28, 3, !dbg !3550
  %44 = and i8 %43, 14, !dbg !3550
  %45 = xor i8 %42, %44, !dbg !3551
  %xor25.masked.i.i29 = and i8 %xor25.i.i28, 15, !dbg !3552
  %46 = xor i8 %45, %xor25.masked.i.i29, !dbg !3552
    #dbg_value(i8 %46, !3294, !DIExpression(), !3535)
    #dbg_value(i8 %46, !3553, !DIExpression(), !3533)
    #dbg_value(i8 %46, !3271, !DIExpression(), !3554)
    #dbg_value(i8 %46, !3275, !DIExpression(), !3554)
  %47 = load volatile i8, ptr @pqmayo_MAYO_2_ref_unsigned_char_blocker, align 1, !dbg !3556
  %xor1.i45.i = xor i8 %46, %47, !dbg !3557
    #dbg_value(i8 %xor1.i45.i, !3271, !DIExpression(), !3554)
  %48 = trunc i8 %xor1.i45.i to i1, !dbg !3558
    #dbg_value(i8 poison, !3279, !DIExpression(), !3554)
  %49 = and i8 %xor1.i45.i, 2, !dbg !3559
  %mul9.i46.i = mul nuw nsw i8 %49, %46, !dbg !3560
  %conv10.i47.i = select i1 %48, i8 %46, i8 0, !dbg !3558
  %xor11.i48.i = xor i8 %conv10.i47.i, %mul9.i46.i, !dbg !3561
    #dbg_value(i8 %xor11.i48.i, !3279, !DIExpression(), !3554)
  %50 = and i8 %xor1.i45.i, 4, !dbg !3562
  %mul16.i49.i = mul nuw nsw i8 %50, %46, !dbg !3563
  %xor18.i50.i = xor i8 %mul16.i49.i, %xor11.i48.i, !dbg !3564
    #dbg_value(i8 %xor18.i50.i, !3279, !DIExpression(), !3554)
  %51 = and i8 %xor1.i45.i, 8, !dbg !3565
  %mul23.i51.i = mul nuw nsw i8 %51, %46, !dbg !3566
  %xor25.i52.i = xor i8 %mul23.i51.i, %xor18.i50.i, !dbg !3567
    #dbg_value(i8 %xor25.i52.i, !3279, !DIExpression(), !3554)
    #dbg_value(i8 %xor25.i52.i, !3289, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !3554)
  %52 = lshr i8 %xor25.i52.i, 4, !dbg !3568
  %53 = lshr i8 %xor25.i52.i, 3, !dbg !3569
  %54 = and i8 %53, 14, !dbg !3569
  %55 = xor i8 %52, %54, !dbg !3570
  %xor25.masked.i53.i = and i8 %xor25.i52.i, 15, !dbg !3571
  %56 = xor i8 %55, %xor25.masked.i53.i, !dbg !3571
    #dbg_value(i8 %56, !3294, !DIExpression(), !3554)
    #dbg_value(i8 %56, !3572, !DIExpression(), !3533)
    #dbg_value(i8 %56, !3271, !DIExpression(), !3573)
    #dbg_value(i8 %56, !3275, !DIExpression(), !3573)
  %57 = load volatile i8, ptr @pqmayo_MAYO_2_ref_unsigned_char_blocker, align 1, !dbg !3575
  %xor1.i27.i = xor i8 %56, %57, !dbg !3576
    #dbg_value(i8 %xor1.i27.i, !3271, !DIExpression(), !3573)
  %58 = trunc i8 %xor1.i27.i to i1, !dbg !3577
    #dbg_value(i8 poison, !3279, !DIExpression(), !3573)
  %59 = and i8 %xor1.i27.i, 2, !dbg !3578
  %mul9.i28.i = mul nuw nsw i8 %59, %56, !dbg !3579
  %conv10.i29.i = select i1 %58, i8 %56, i8 0, !dbg !3577
  %xor11.i30.i = xor i8 %conv10.i29.i, %mul9.i28.i, !dbg !3580
    #dbg_value(i8 %xor11.i30.i, !3279, !DIExpression(), !3573)
  %60 = and i8 %xor1.i27.i, 4, !dbg !3581
  %mul16.i31.i = mul nuw nsw i8 %60, %56, !dbg !3582
  %xor18.i32.i = xor i8 %mul16.i31.i, %xor11.i30.i, !dbg !3583
    #dbg_value(i8 %xor18.i32.i, !3279, !DIExpression(), !3573)
  %61 = and i8 %xor1.i27.i, 8, !dbg !3584
  %mul23.i33.i = mul nuw nsw i8 %61, %56, !dbg !3585
  %xor25.i34.i = xor i8 %mul23.i33.i, %xor18.i32.i, !dbg !3586
    #dbg_value(i8 %xor25.i34.i, !3279, !DIExpression(), !3573)
    #dbg_value(i8 %xor25.i34.i, !3289, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !3573)
  %62 = lshr i8 %xor25.i34.i, 4, !dbg !3587
  %63 = lshr i8 %xor25.i34.i, 3, !dbg !3588
  %64 = and i8 %63, 14, !dbg !3588
  %65 = xor i8 %62, %64, !dbg !3589
  %xor25.masked.i35.i = and i8 %xor25.i34.i, 15, !dbg !3590
  %66 = xor i8 %65, %xor25.masked.i35.i, !dbg !3590
    #dbg_value(i8 %66, !3294, !DIExpression(), !3573)
    #dbg_value(i8 %66, !3591, !DIExpression(), !3533)
    #dbg_value(i8 %46, !3271, !DIExpression(), !3592)
    #dbg_value(i8 %56, !3275, !DIExpression(), !3592)
  %67 = load volatile i8, ptr @pqmayo_MAYO_2_ref_unsigned_char_blocker, align 1, !dbg !3594
  %xor1.i36.i = xor i8 %46, %67, !dbg !3595
    #dbg_value(i8 %xor1.i36.i, !3271, !DIExpression(), !3592)
  %68 = trunc i8 %xor1.i36.i to i1, !dbg !3596
    #dbg_value(i8 poison, !3279, !DIExpression(), !3592)
  %69 = and i8 %xor1.i36.i, 2, !dbg !3597
  %mul9.i37.i = mul nuw nsw i8 %69, %56, !dbg !3598
  %conv10.i38.i = select i1 %68, i8 %56, i8 0, !dbg !3596
  %xor11.i39.i = xor i8 %conv10.i38.i, %mul9.i37.i, !dbg !3599
    #dbg_value(i8 %xor11.i39.i, !3279, !DIExpression(), !3592)
  %70 = and i8 %xor1.i36.i, 4, !dbg !3600
  %mul16.i40.i = mul nuw nsw i8 %70, %56, !dbg !3601
  %xor18.i41.i = xor i8 %mul16.i40.i, %xor11.i39.i, !dbg !3602
    #dbg_value(i8 %xor18.i41.i, !3279, !DIExpression(), !3592)
  %71 = and i8 %xor1.i36.i, 8, !dbg !3603
  %mul23.i42.i = mul nuw nsw i8 %71, %56, !dbg !3604
  %xor25.i43.i = xor i8 %mul23.i42.i, %xor18.i41.i, !dbg !3605
    #dbg_value(i8 %xor25.i43.i, !3279, !DIExpression(), !3592)
    #dbg_value(i8 %xor25.i43.i, !3289, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !3592)
  %72 = lshr i8 %xor25.i43.i, 4, !dbg !3606
  %73 = lshr i8 %xor25.i43.i, 3, !dbg !3607
  %74 = and i8 %73, 14, !dbg !3607
  %75 = xor i8 %72, %74, !dbg !3608
  %xor25.masked.i44.i = and i8 %xor25.i43.i, 15, !dbg !3609
  %76 = xor i8 %75, %xor25.masked.i44.i, !dbg !3609
    #dbg_value(i8 %76, !3294, !DIExpression(), !3592)
    #dbg_value(i8 %76, !3610, !DIExpression(), !3533)
    #dbg_value(i8 %66, !3271, !DIExpression(), !3611)
    #dbg_value(i8 %76, !3275, !DIExpression(), !3611)
  %77 = load volatile i8, ptr @pqmayo_MAYO_2_ref_unsigned_char_blocker, align 1, !dbg !3613
  %xor1.i18.i = xor i8 %66, %77, !dbg !3614
    #dbg_value(i8 %xor1.i18.i, !3271, !DIExpression(), !3611)
  %78 = trunc i8 %xor1.i18.i to i1, !dbg !3615
    #dbg_value(i8 poison, !3279, !DIExpression(), !3611)
  %79 = and i8 %xor1.i18.i, 2, !dbg !3616
  %mul9.i19.i = mul nuw nsw i8 %79, %76, !dbg !3617
  %conv10.i20.i = select i1 %78, i8 %76, i8 0, !dbg !3615
  %xor11.i21.i = xor i8 %conv10.i20.i, %mul9.i19.i, !dbg !3618
    #dbg_value(i8 %xor11.i21.i, !3279, !DIExpression(), !3611)
  %80 = and i8 %xor1.i18.i, 4, !dbg !3619
  %mul16.i22.i = mul nuw nsw i8 %80, %76, !dbg !3620
  %xor18.i23.i = xor i8 %mul16.i22.i, %xor11.i21.i, !dbg !3621
    #dbg_value(i8 %xor18.i23.i, !3279, !DIExpression(), !3611)
  %81 = and i8 %xor1.i18.i, 8, !dbg !3622
  %mul23.i24.i = mul nuw nsw i8 %81, %76, !dbg !3623
  %xor25.i25.i = xor i8 %mul23.i24.i, %xor18.i23.i, !dbg !3624
    #dbg_value(i8 %xor25.i25.i, !3279, !DIExpression(), !3611)
    #dbg_value(i8 %xor25.i25.i, !3289, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !3611)
  %82 = lshr i8 %xor25.i25.i, 4, !dbg !3625
  %83 = lshr i8 %xor25.i25.i, 3, !dbg !3626
  %84 = and i8 %83, 14, !dbg !3626
  %85 = xor i8 %82, %84, !dbg !3627
  %xor25.masked.i26.i = and i8 %xor25.i25.i, 15, !dbg !3628
  %86 = xor i8 %85, %xor25.masked.i26.i, !dbg !3628
    #dbg_value(i8 %86, !3294, !DIExpression(), !3611)
    #dbg_value(i8 %86, !3629, !DIExpression(), !3533)
    #dbg_value(i8 %86, !3630, !DIExpression(), !3349)
  call fastcc void @vec_mul_add_u64(i32 noundef %div.i, ptr noundef nonnull %_pivot_row.i, i8 noundef zeroext %86, ptr noundef nonnull %_pivot_row2.i) #9, !dbg !3631
    #dbg_value(i32 %cond.i, !3632, !DIExpression(), !3634)
  br label %for.cond60.i, !dbg !3635

for.cond60.i:                                     ; preds = %for.inc86.i, %for.end55.i
  %row59.0.i = phi i32 [ %cond.i, %for.end55.i ], [ %inc87.i, %for.inc86.i ], !dbg !3636
    #dbg_value(i32 %row59.0.i, !3632, !DIExpression(), !3634)
  %cmp61.not.i = icmp sgt i32 %row59.0.i, %cond16.i, !dbg !3637
  br i1 %cmp61.not.i, label %for.cond90.i.preheader, label %for.body63.i, !dbg !3639

for.cond90.i.preheader:                           ; preds = %for.cond60.i
  %smax48 = call i32 @llvm.smax.i32(i32 %cond.i, i32 %m), !dbg !3640
  br label %for.cond90.i, !dbg !3640

for.body63.i:                                     ; preds = %for.cond60.i
    #dbg_value(i32 %row59.0.i, !3462, !DIExpression(), !3642)
    #dbg_value(i32 %pivot_row.0.i, !3470, !DIExpression(), !3642)
  %xor.i1.i = xor i32 %row59.0.i, %pivot_row.0.i, !dbg !3645
  %87 = icmp sgt i32 %xor.i1.i, 0, !dbg !3646
  %shr.i2.i = sext i1 %87 to i64, !dbg !3646
  %88 = load volatile i64, ptr @pqmayo_MAYO_2_ref_uint64_t_blocker, align 8, !dbg !3647
  %xor1.i.i30 = xor i64 %88, %shr.i2.i, !dbg !3648
  %and67.demorgan.i = or i64 %xor1.i.i30, %pivot_is_zero.0.i.lcssa, !dbg !3649
  %and67.i = xor i64 %and67.demorgan.i, -1, !dbg !3649
    #dbg_value(i64 %and67.i, !3650, !DIExpression(), !3651)
    #dbg_value(i64 %and67.demorgan.i, !3652, !DIExpression(), !3651)
    #dbg_value(i32 0, !3653, !DIExpression(), !3655)
  br label %for.cond69.i, !dbg !3656

for.cond69.i:                                     ; preds = %for.body72.i, %for.body63.i
  %col.0.i = phi i32 [ 0, %for.body63.i ], [ %inc84.i, %for.body72.i ], !dbg !3657
    #dbg_value(i32 %col.0.i, !3653, !DIExpression(), !3655)
  %exitcond47 = icmp ne i32 %col.0.i, %smax44, !dbg !3658
  br i1 %exitcond47, label %for.body72.i, label %for.inc86.i, !dbg !3660

for.body72.i:                                     ; preds = %for.cond69.i
  %mul73.i = mul nsw i32 %row59.0.i, %div.i, !dbg !3661
  %add74.i = add nsw i32 %mul73.i, %col.0.i, !dbg !3663
  %arrayidx75.i = getelementptr inbounds [320 x i64], ptr %packed_A.i, i32 0, i32 %add74.i, !dbg !3664
  %89 = load i64, ptr %arrayidx75.i, align 8, !dbg !3664
  %and76.i = and i64 %and67.demorgan.i, %89, !dbg !3665
  %arrayidx77.i = getelementptr inbounds nuw [5 x i64], ptr %_pivot_row2.i, i32 0, i32 %col.0.i, !dbg !3666
  %90 = load i64, ptr %arrayidx77.i, align 8, !dbg !3666
  %and78.i = and i64 %90, %and67.i, !dbg !3667
  %add79.i = add i64 %and76.i, %and78.i, !dbg !3668
  %mul80.i = mul nsw i32 %row59.0.i, %div.i, !dbg !3669
  %add81.i = add nsw i32 %mul80.i, %col.0.i, !dbg !3670
  %arrayidx82.i = getelementptr inbounds [320 x i64], ptr %packed_A.i, i32 0, i32 %add81.i, !dbg !3671
  store i64 %add79.i, ptr %arrayidx82.i, align 8, !dbg !3672
  %inc84.i = add nuw nsw i32 %col.0.i, 1, !dbg !3673
    #dbg_value(i32 %inc84.i, !3653, !DIExpression(), !3655)
  br label %for.cond69.i, !dbg !3674, !llvm.loop !3675

for.inc86.i:                                      ; preds = %for.cond69.i
  %inc87.i = add nsw i32 %row59.0.i, 1, !dbg !3677
    #dbg_value(i32 %inc87.i, !3632, !DIExpression(), !3634)
  br label %for.cond60.i, !dbg !3678, !llvm.loop !3679

for.cond90.i:                                     ; preds = %for.cond90.i.preheader, %for.body93.i
  %row89.0.i = phi i32 [ %inc110.i, %for.body93.i ], [ %cond.i, %for.cond90.i.preheader ], !dbg !3681
    #dbg_value(i32 %row89.0.i, !3682, !DIExpression(), !3683)
  %exitcond49 = icmp ne i32 %row89.0.i, %smax48, !dbg !3684
  br i1 %exitcond49, label %for.body93.i, label %for.inc117.i, !dbg !3640

for.body93.i:                                     ; preds = %for.cond90.i
  %cmp94.i = icmp sgt i32 %row89.0.i, %pivot_row.0.i, !dbg !3686
    #dbg_value(i1 %cmp94.i, !3688, !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3689)
  %mul98.i = mul nsw i32 %row89.0.i, %div.i, !dbg !3690
  %add.ptr99.i = getelementptr inbounds i64, ptr %packed_A.i, i32 %mul98.i, !dbg !3691
    #dbg_value(ptr %add.ptr99.i, !3507, !DIExpression(), !3692)
    #dbg_value(i32 %pivot_col.0.i, !3513, !DIExpression(), !3692)
  %div.i.i36 = lshr i32 %pivot_col.0.i, 4, !dbg !3694
    #dbg_value(i32 %div.i.i36, !3515, !DIExpression(), !3692)
    #dbg_value(i32 %pivot_col.0.i, !3516, !DIExpression(DW_OP_constu, 15, DW_OP_and, DW_OP_stack_value), !3692)
  %arrayidx.i.i31 = getelementptr inbounds nuw i64, ptr %add.ptr99.i, i32 %div.i.i36, !dbg !3695
  %91 = load i64, ptr %arrayidx.i.i31, align 8, !dbg !3695
  %rem.i.i = shl i32 %pivot_col.0.i, 2, !dbg !3696
  %mul.i.i = and i32 %rem.i.i, 60, !dbg !3696
  %sh_prom.i.i = zext nneg i32 %mul.i.i to i64, !dbg !3697
  %shr.i9.i = lshr i64 %91, %sh_prom.i.i, !dbg !3697
  %92 = trunc i64 %shr.i9.i to i8, !dbg !3698
  %conv.i.i = and i8 %92, 15, !dbg !3698
    #dbg_value(i8 %conv.i.i, !3699, !DIExpression(), !3689)
  %conv105.i = select i1 %cmp94.i, i8 %conv.i.i, i8 0, !dbg !3700
  %mul107.i = mul nsw i32 %row89.0.i, %div.i, !dbg !3701
  %add.ptr108.i = getelementptr inbounds i64, ptr %packed_A.i, i32 %mul107.i, !dbg !3702
  call fastcc void @vec_mul_add_u64(i32 noundef %div.i, ptr noundef nonnull %_pivot_row2.i, i8 noundef zeroext %conv105.i, ptr noundef nonnull %add.ptr108.i) #9, !dbg !3703
  %inc110.i = add i32 %row89.0.i, 1, !dbg !3704
    #dbg_value(i32 %inc110.i, !3682, !DIExpression(), !3683)
  br label %for.cond90.i, !dbg !3705, !llvm.loop !3706

for.inc117.i:                                     ; preds = %for.cond90.i
    #dbg_value(!DIArgList(i64 %pivot_is_zero.0.i.lcssa, i32 %pivot_row.0.i), !3423, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_plus_uconst, 1, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_plus, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !3349)
  %93 = trunc i64 %pivot_is_zero.0.i.lcssa to i32, !dbg !3708
  %94 = add i32 %93, 1, !dbg !3708
  %conv116.i = add i32 %94, %pivot_row.0.i, !dbg !3708
    #dbg_value(i32 %conv116.i, !3423, !DIExpression(), !3349)
  %inc118.i = add nuw i32 %pivot_col.0.i, 1, !dbg !3709
    #dbg_value(i32 %inc118.i, !3424, !DIExpression(), !3425)
  br label %for.cond3.i, !dbg !3710, !llvm.loop !3711

for.cond121.i:                                    ; preds = %for.cond121.i.preheader, %for.inc141.i
  %i120.0.i = phi i32 [ %inc142.i, %for.inc141.i ], [ 0, %for.cond121.i.preheader ], !dbg !3713
    #dbg_value(i32 %i120.0.i, !3714, !DIExpression(), !3715)
  %exitcond53 = icmp ne i32 %i120.0.i, %smax37, !dbg !3716
  br i1 %exitcond53, label %for.body124.i, label %EF.exit, !dbg !3428

for.body124.i:                                    ; preds = %for.cond121.i
  %mul126.i = mul nsw i32 %i120.0.i, %div.i, !dbg !3718
  %add.ptr127.i = getelementptr inbounds i64, ptr %packed_A.i, i32 %mul126.i, !dbg !3720
    #dbg_value(i32 %div.i, !3721, !DIExpression(), !3725)
    #dbg_value(ptr %add.ptr127.i, !3727, !DIExpression(), !3725)
    #dbg_value(ptr %temp.i, !3728, !DIExpression(), !3725)
    #dbg_value(ptr %add.ptr127.i, !3729, !DIExpression(), !3725)
    #dbg_value(i32 0, !3730, !DIExpression(), !3732)
  br label %for.cond.i.i16, !dbg !3733

for.cond.i.i16:                                   ; preds = %for.body.i.i19, %for.body124.i
  %i.0.i.i17 = phi i32 [ 0, %for.body124.i ], [ %add8.i.i, %for.body.i.i19 ], !dbg !3734
    #dbg_value(i32 %i.0.i.i17, !3730, !DIExpression(), !3732)
  %mul.i54.i = shl nsw i32 %div.i, 4, !dbg !3735
  %cmp.i.i18 = icmp slt i32 %i.0.i.i17, %mul.i54.i, !dbg !3737
  br i1 %cmp.i.i18, label %for.body.i.i19, label %for.cond130.i.preheader, !dbg !3738

for.cond130.i.preheader:                          ; preds = %for.cond.i.i16
  br label %for.cond130.i, !dbg !3739

for.body.i.i19:                                   ; preds = %for.cond.i.i16
  %div.i55.i = lshr exact i32 %i.0.i.i17, 1, !dbg !3741
  %arrayidx.i56.i = getelementptr inbounds nuw i8, ptr %add.ptr127.i, i32 %div.i55.i, !dbg !3743
  %95 = load i8, ptr %arrayidx.i56.i, align 1, !dbg !3743
  %96 = and i8 %95, 15, !dbg !3744
  %arrayidx2.i.i = getelementptr inbounds nuw i8, ptr %temp.i, i32 %i.0.i.i17, !dbg !3745
  store i8 %96, ptr %arrayidx2.i.i, align 1, !dbg !3746
  %div3.i.i = lshr exact i32 %i.0.i.i17, 1, !dbg !3747
  %arrayidx4.i.i = getelementptr inbounds nuw i8, ptr %add.ptr127.i, i32 %div3.i.i, !dbg !3748
  %97 = load i8, ptr %arrayidx4.i.i, align 1, !dbg !3748
  %98 = lshr i8 %97, 4, !dbg !3749
  %add.i.i = or disjoint i32 %i.0.i.i17, 1, !dbg !3750
  %arrayidx7.i.i = getelementptr inbounds nuw i8, ptr %temp.i, i32 %add.i.i, !dbg !3751
  store i8 %98, ptr %arrayidx7.i.i, align 1, !dbg !3752
  %add8.i.i = add nuw nsw i32 %i.0.i.i17, 2, !dbg !3753
    #dbg_value(i32 %add8.i.i, !3730, !DIExpression(), !3732)
  br label %for.cond.i.i16, !dbg !3754, !llvm.loop !3755

for.cond130.i:                                    ; preds = %for.cond130.i.preheader, %for.body133.i
  %j129.0.i = phi i32 [ %inc139.i, %for.body133.i ], [ 0, %for.cond130.i.preheader ], !dbg !3757
    #dbg_value(i32 %j129.0.i, !3758, !DIExpression(), !3759)
  %exitcond52 = icmp eq i32 %j129.0.i, %20, !dbg !3760
  br i1 %exitcond52, label %for.inc141.i, label %for.body133.i, !dbg !3739

for.body133.i:                                    ; preds = %for.cond130.i
  %arrayidx134.i = getelementptr inbounds nuw [84 x i8], ptr %temp.i, i32 0, i32 %j129.0.i, !dbg !3762
  %99 = load i8, ptr %arrayidx134.i, align 1, !dbg !3762
  %mul135.i = mul nsw i32 %i120.0.i, %add32, !dbg !3764
  %100 = getelementptr i8, ptr %A, i32 %mul135.i, !dbg !3765
  %arrayidx137.i = getelementptr i8, ptr %100, i32 %j129.0.i, !dbg !3765
  store i8 %99, ptr %arrayidx137.i, align 1, !dbg !3766
  %inc139.i = add nuw i32 %j129.0.i, 1, !dbg !3767
    #dbg_value(i32 %inc139.i, !3758, !DIExpression(), !3759)
  br label %for.cond130.i, !dbg !3768, !llvm.loop !3769

for.inc141.i:                                     ; preds = %for.cond130.i
  %inc142.i = add nuw i32 %i120.0.i, 1, !dbg !3771
    #dbg_value(i32 %inc142.i, !3714, !DIExpression(), !3715)
  br label %for.cond121.i, !dbg !3772, !llvm.loop !3773

EF.exit:                                          ; preds = %for.cond121.i
  call void @mayo_secure_clear(ptr noundef nonnull %temp.i, i32 noundef 84) #8, !dbg !3775
  call void @mayo_secure_clear(ptr noundef nonnull %_pivot_row.i, i32 noundef 40) #8, !dbg !3776
  call void @mayo_secure_clear(ptr noundef nonnull %_pivot_row2.i, i32 noundef 40) #8, !dbg !3777
  call void @mayo_secure_clear(ptr noundef nonnull %packed_A.i, i32 noundef 2560) #8, !dbg !3778
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %_pivot_row.i), !dbg !3779
  call void @llvm.lifetime.end.p0(i64 40, ptr nonnull %_pivot_row2.i), !dbg !3779
  call void @llvm.lifetime.end.p0(i64 2560, ptr nonnull %packed_A.i), !dbg !3779
  call void @llvm.lifetime.end.p0(i64 84, ptr nonnull %temp.i), !dbg !3779
    #dbg_value(i8 0, !3780, !DIExpression(), !3179)
    #dbg_value(i32 0, !3781, !DIExpression(), !3783)
  %101 = add i32 %A_cols, -1, !dbg !3784
  %smax54 = call i32 @llvm.smax.i32(i32 %101, i32 0), !dbg !3784
  br label %for.cond34, !dbg !3784

for.cond34:                                       ; preds = %for.inc43, %EF.exit
  %full_rank.0 = phi i8 [ 0, %EF.exit ], [ %or12, %for.inc43 ], !dbg !3179
  %i33.0 = phi i32 [ 0, %EF.exit ], [ %inc44, %for.inc43 ], !dbg !3785
    #dbg_value(i32 %i33.0, !3781, !DIExpression(), !3783)
    #dbg_value(i8 %full_rank.0, !3780, !DIExpression(), !3179)
  %exitcond55 = icmp ne i32 %i33.0, %smax54, !dbg !3786
  br i1 %exitcond55, label %for.inc43, label %for.end45, !dbg !3788

for.inc43:                                        ; preds = %for.cond34
    #dbg_value(!DIArgList(i8 poison, i8 poison), !3780, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3179)
  %sub37 = add nsw i32 %m, -1, !dbg !3789
  %mul38 = mul nsw i32 %sub37, %A_cols, !dbg !3791
  %102 = getelementptr i8, ptr %A, i32 %mul38, !dbg !3792
  %arrayidx40 = getelementptr i8, ptr %102, i32 %i33.0, !dbg !3792
  %103 = load i8, ptr %arrayidx40, align 1, !dbg !3792
    #dbg_value(!DIArgList(i8 %full_rank.0, i8 %103), !3780, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3179)
  %or12 = or i8 %full_rank.0, %103, !dbg !3793
    #dbg_value(i8 %or12, !3780, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3179)
    #dbg_value(i8 %or12, !3780, !DIExpression(), !3179)
  %inc44 = add nuw i32 %i33.0, 1, !dbg !3794
    #dbg_value(i32 %inc44, !3781, !DIExpression(), !3783)
  br label %for.cond34, !dbg !3795, !llvm.loop !3796

for.end45:                                        ; preds = %for.cond34
  %full_rank.0.lcssa = phi i8 [ %full_rank.0, %for.cond34 ], !dbg !3179
  %cmp47 = icmp eq i8 %full_rank.0.lcssa, 0, !dbg !3798
  br i1 %cmp47, label %return, label %for.cond50.preheader, !dbg !3798

for.cond50.preheader:                             ; preds = %for.end45
  br label %for.cond50, !dbg !3800

for.cond50.loopexit:                              ; preds = %for.cond63
  br label %for.cond50, !dbg !3800, !llvm.loop !3802

for.cond50:                                       ; preds = %for.cond50.preheader, %for.cond50.loopexit
  %row.0.in = phi i32 [ %row.0, %for.cond50.loopexit ], [ %m, %for.cond50.preheader ]
  %row.0 = add nsw i32 %row.0.in, -1, !dbg !3804
    #dbg_value(i32 %row.0, !3805, !DIExpression(), !3806)
  %cmp51 = icmp sgt i32 %row.0.in, 0, !dbg !3807
  br i1 %cmp51, label %for.body53, label %return.loopexit, !dbg !3800

for.body53:                                       ; preds = %for.cond50
    #dbg_value(i8 0, !3809, !DIExpression(), !3179)
  %sub54 = sub nsw i32 %m, %row.0, !dbg !3810
  %div = sdiv i32 32, %sub54, !dbg !3810
  %add55 = add nsw i32 %row.0, %div, !dbg !3810
  %mul56 = mul nsw i32 %k, %o, !dbg !3810
  %cmp57 = icmp slt i32 %add55, %mul56, !dbg !3810
  br i1 %cmp57, label %cond.true, label %cond.false, !dbg !3810

cond.true:                                        ; preds = %for.body53
  %sub59 = sub nsw i32 %m, %row.0, !dbg !3810
  %div60 = sdiv i32 32, %sub59, !dbg !3810
  %add61 = add nsw i32 %row.0, %div60, !dbg !3810
  br label %cond.end, !dbg !3810

cond.false:                                       ; preds = %for.body53
  %mul62 = mul nsw i32 %k, %o, !dbg !3810
  br label %cond.end, !dbg !3810

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %add61, %cond.true ], [ %mul62, %cond.false ], !dbg !3810
    #dbg_value(i32 %cond, !3812, !DIExpression(), !3179)
    #dbg_value(i32 %row.0, !3813, !DIExpression(), !3815)
  br label %for.cond63, !dbg !3816

for.cond63:                                       ; preds = %for.inc229, %cond.end
  %finished.0 = phi i8 [ 0, %cond.end ], [ %or2273, %for.inc229 ], !dbg !3817
  %col.0 = phi i32 [ %row.0, %cond.end ], [ %inc230, %for.inc229 ], !dbg !3818
    #dbg_value(i32 %col.0, !3813, !DIExpression(), !3815)
    #dbg_value(i8 %finished.0, !3809, !DIExpression(), !3179)
  %cmp64.not = icmp sgt i32 %col.0, %cond, !dbg !3819
  br i1 %cmp64.not, label %for.cond50.loopexit, label %for.body66, !dbg !3821

for.body66:                                       ; preds = %for.cond63
  %mul67 = mul nsw i32 %row.0, %A_cols, !dbg !3822
  %104 = getelementptr i8, ptr %A, i32 %mul67, !dbg !3824
  %arrayidx69 = getelementptr i8, ptr %104, i32 %col.0, !dbg !3824
  %105 = load i8, ptr %arrayidx69, align 1, !dbg !3824
    #dbg_value(i8 %105, !3825, !DIExpression(), !3827)
    #dbg_value(i8 0, !3829, !DIExpression(), !3827)
  %106 = icmp ne i8 %105, 0, !dbg !3830
  %conv3.i = sext i1 %106 to i8, !dbg !3831
  %107 = load volatile i8, ptr @pqmayo_MAYO_2_ref_unsigned_char_blocker, align 1, !dbg !3832
  %xor5.i = xor i8 %107, %conv3.i, !dbg !3833
  %not = xor i8 %finished.0, -1, !dbg !3834
    #dbg_value(!DIArgList(i8 %xor5.i, i8 %not), !3835, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_and, DW_OP_stack_value), !3179)
  %add76 = mul i32 %row.0.in, %A_cols, !dbg !3836
  %108 = getelementptr i8, ptr %A, i32 %add76, !dbg !3837
  %arrayidx78 = getelementptr i8, ptr %108, i32 -1, !dbg !3837
  %109 = load i8, ptr %arrayidx78, align 1, !dbg !3837
  %110 = and i8 %109, %not, !dbg !3838
  %and801 = and i8 %110, %xor5.i, !dbg !3838
    #dbg_value(i8 %and801, !3839, !DIExpression(), !3840)
  %arrayidx83 = getelementptr inbounds i8, ptr %x, i32 %col.0, !dbg !3841
  %111 = load i8, ptr %arrayidx83, align 1, !dbg !3842
  %xor2 = xor i8 %111, %and801, !dbg !3842
  store i8 %xor2, ptr %arrayidx83, align 1, !dbg !3842
    #dbg_value(i32 0, !3843, !DIExpression(), !3845)
  br label %for.cond87, !dbg !3846

for.cond87:                                       ; preds = %for.body90, %for.body66
  %i86.0 = phi i32 [ 0, %for.body66 ], [ %add223, %for.body90 ], !dbg !3847
    #dbg_value(i32 %i86.0, !3843, !DIExpression(), !3845)
  %cmp88 = icmp slt i32 %i86.0, %row.0, !dbg !3848
  br i1 %cmp88, label %for.body90, label %for.inc229, !dbg !3850

for.body90:                                       ; preds = %for.cond87
  %mul91 = mul nsw i32 %i86.0, %A_cols, !dbg !3851
  %112 = getelementptr i8, ptr %A, i32 %mul91, !dbg !3853
  %arrayidx93 = getelementptr i8, ptr %112, i32 %col.0, !dbg !3853
  %113 = load i8, ptr %arrayidx93, align 1, !dbg !3853
  %conv94 = zext i8 %113 to i64, !dbg !3854
  %add95 = or disjoint i32 %i86.0, 1, !dbg !3855
  %mul96 = mul nsw i32 %add95, %A_cols, !dbg !3856
  %114 = getelementptr i8, ptr %A, i32 %mul96, !dbg !3857
  %arrayidx98 = getelementptr i8, ptr %114, i32 %col.0, !dbg !3857
  %115 = load i8, ptr %arrayidx98, align 1, !dbg !3857
  %conv99 = zext i8 %115 to i64, !dbg !3858
  %shl100 = shl nuw nsw i64 %conv99, 8, !dbg !3859
  %xor101 = or disjoint i64 %shl100, %conv94, !dbg !3860
  %add102 = or disjoint i32 %i86.0, 2, !dbg !3861
  %mul103 = mul nsw i32 %add102, %A_cols, !dbg !3862
  %116 = getelementptr i8, ptr %A, i32 %mul103, !dbg !3863
  %arrayidx105 = getelementptr i8, ptr %116, i32 %col.0, !dbg !3863
  %117 = load i8, ptr %arrayidx105, align 1, !dbg !3863
  %conv106 = zext i8 %117 to i64, !dbg !3864
  %shl107 = shl nuw nsw i64 %conv106, 16, !dbg !3865
  %xor108 = or disjoint i64 %xor101, %shl107, !dbg !3866
  %add109 = or disjoint i32 %i86.0, 3, !dbg !3867
  %mul110 = mul nsw i32 %add109, %A_cols, !dbg !3868
  %118 = getelementptr i8, ptr %A, i32 %mul110, !dbg !3869
  %arrayidx112 = getelementptr i8, ptr %118, i32 %col.0, !dbg !3869
  %119 = load i8, ptr %arrayidx112, align 1, !dbg !3869
  %conv113 = zext i8 %119 to i64, !dbg !3870
  %shl114 = shl nuw nsw i64 %conv113, 24, !dbg !3871
  %xor115 = or disjoint i64 %xor108, %shl114, !dbg !3872
  %add116 = or disjoint i32 %i86.0, 4, !dbg !3873
  %mul117 = mul nsw i32 %add116, %A_cols, !dbg !3874
  %120 = getelementptr i8, ptr %A, i32 %mul117, !dbg !3875
  %arrayidx119 = getelementptr i8, ptr %120, i32 %col.0, !dbg !3875
  %121 = load i8, ptr %arrayidx119, align 1, !dbg !3875
  %conv120 = zext i8 %121 to i64, !dbg !3876
  %shl121 = shl nuw nsw i64 %conv120, 32, !dbg !3877
  %xor122 = or disjoint i64 %xor115, %shl121, !dbg !3878
  %add123 = or disjoint i32 %i86.0, 5, !dbg !3879
  %mul124 = mul nsw i32 %add123, %A_cols, !dbg !3880
  %122 = getelementptr i8, ptr %A, i32 %mul124, !dbg !3881
  %arrayidx126 = getelementptr i8, ptr %122, i32 %col.0, !dbg !3881
  %123 = load i8, ptr %arrayidx126, align 1, !dbg !3881
  %conv127 = zext i8 %123 to i64, !dbg !3882
  %shl128 = shl nuw nsw i64 %conv127, 40, !dbg !3883
  %xor129 = xor i64 %xor122, %shl128, !dbg !3884
  %add130 = or disjoint i32 %i86.0, 6, !dbg !3885
  %mul131 = mul nsw i32 %add130, %A_cols, !dbg !3886
  %124 = getelementptr i8, ptr %A, i32 %mul131, !dbg !3887
  %arrayidx133 = getelementptr i8, ptr %124, i32 %col.0, !dbg !3887
  %125 = load i8, ptr %arrayidx133, align 1, !dbg !3887
  %conv134 = zext i8 %125 to i64, !dbg !3888
  %shl135 = shl nuw nsw i64 %conv134, 48, !dbg !3889
  %xor136 = xor i64 %xor129, %shl135, !dbg !3890
  %add137 = or disjoint i32 %i86.0, 7, !dbg !3891
  %mul138 = mul nsw i32 %add137, %A_cols, !dbg !3892
  %126 = getelementptr i8, ptr %A, i32 %mul138, !dbg !3893
  %arrayidx140 = getelementptr i8, ptr %126, i32 %col.0, !dbg !3893
  %127 = load i8, ptr %arrayidx140, align 1, !dbg !3893
  %conv141 = zext i8 %127 to i64, !dbg !3894
  %shl142 = shl nuw i64 %conv141, 56, !dbg !3895
  %xor143 = xor i64 %xor136, %shl142, !dbg !3896
    #dbg_value(i64 %xor143, !3897, !DIExpression(), !3898)
    #dbg_value(i8 %and801, !3899, !DIExpression(), !3903)
    #dbg_value(i64 %xor143, !3905, !DIExpression(), !3903)
  %128 = and i8 %and801, 1, !dbg !3906
  %conv1.i = zext nneg i8 %128 to i64, !dbg !3907
  %mul.i = mul nuw nsw i64 %xor143, %conv1.i, !dbg !3908
    #dbg_value(i64 %mul.i, !3909, !DIExpression(), !3903)
  %129 = and i8 %and801, 2, !dbg !3910
  %conv4.i = zext nneg i8 %129 to i64, !dbg !3911
  %mul5.i = mul i64 %xor143, %conv4.i, !dbg !3912
  %xor.i = xor i64 %mul.i, %mul5.i, !dbg !3913
    #dbg_value(i64 %xor.i, !3909, !DIExpression(), !3903)
  %130 = and i8 %and801, 4, !dbg !3914
  %conv8.i = zext nneg i8 %130 to i64, !dbg !3915
  %mul9.i = mul i64 %xor143, %conv8.i, !dbg !3916
  %xor10.i = xor i64 %xor.i, %mul9.i, !dbg !3917
    #dbg_value(i64 %xor10.i, !3909, !DIExpression(), !3903)
  %131 = and i8 %and801, 8, !dbg !3918
  %conv13.i = zext nneg i8 %131 to i64, !dbg !3919
  %mul14.i = mul i64 %xor143, %conv13.i, !dbg !3920
  %xor15.i = xor i64 %xor10.i, %mul14.i, !dbg !3921
    #dbg_value(i64 %xor15.i, !3909, !DIExpression(), !3903)
    #dbg_value(i64 %xor15.i, !3922, !DIExpression(DW_OP_constu, 17361641481138401520, DW_OP_and, DW_OP_stack_value), !3903)
  %shr.i = lshr i64 %xor15.i, 4, !dbg !3923
  %and16.i = lshr i64 %xor15.i, 3, !dbg !3924
  %shr18.i = and i64 %and16.i, 1012762419733073422, !dbg !3924
  %132 = xor i64 %shr.i, %shr18.i, !dbg !3925
  %xor19.i = xor i64 %132, %xor15.i, !dbg !3925
    #dbg_value(i64 %xor19.i, !3926, !DIExpression(DW_OP_constu, 1085102592571150095, DW_OP_and, DW_OP_stack_value), !3903)
    #dbg_value(i64 %xor19.i, !3897, !DIExpression(DW_OP_constu, 1085102592571150095, DW_OP_and, DW_OP_stack_value), !3898)
  %mul1464 = or disjoint i32 %i86.0, 1, !dbg !3927
  %add147 = mul i32 %mul1464, %A_cols, !dbg !3927
  %133 = getelementptr i8, ptr %A, i32 %add147, !dbg !3928
  %arrayidx149 = getelementptr i8, ptr %133, i32 -1, !dbg !3928
  %134 = load i8, ptr %arrayidx149, align 1, !dbg !3929
  %135 = trunc i64 %xor19.i to i8, !dbg !3929
  %136 = and i8 %135, 15, !dbg !3929
  %conv152 = xor i8 %136, %134, !dbg !3929
  store i8 %conv152, ptr %arrayidx149, align 1, !dbg !3929
  %shr = lshr i64 %xor19.i, 8, !dbg !3930
  %mul1555 = or disjoint i32 %i86.0, 2, !dbg !3931
  %add156 = mul i32 %mul1555, %A_cols, !dbg !3931
  %137 = getelementptr i8, ptr %A, i32 %add156, !dbg !3932
  %arrayidx158 = getelementptr i8, ptr %137, i32 -1, !dbg !3932
  %138 = load i8, ptr %arrayidx158, align 1, !dbg !3933
  %139 = trunc i64 %shr to i8, !dbg !3933
  %140 = and i8 %139, 15, !dbg !3933
  %conv161 = xor i8 %140, %138, !dbg !3933
  store i8 %conv161, ptr %arrayidx158, align 1, !dbg !3933
  %shr162 = lshr i64 %xor19.i, 16, !dbg !3934
  %mul1656 = or disjoint i32 %i86.0, 3, !dbg !3935
  %add166 = mul i32 %mul1656, %A_cols, !dbg !3935
  %141 = getelementptr i8, ptr %A, i32 %add166, !dbg !3936
  %arrayidx168 = getelementptr i8, ptr %141, i32 -1, !dbg !3936
  %142 = load i8, ptr %arrayidx168, align 1, !dbg !3937
  %143 = trunc i64 %shr162 to i8, !dbg !3937
  %144 = and i8 %143, 15, !dbg !3937
  %conv171 = xor i8 %144, %142, !dbg !3937
  store i8 %conv171, ptr %arrayidx168, align 1, !dbg !3937
  %shr172 = lshr i64 %xor19.i, 24, !dbg !3938
  %mul1757 = or disjoint i32 %i86.0, 4, !dbg !3939
  %add176 = mul i32 %mul1757, %A_cols, !dbg !3939
  %145 = getelementptr i8, ptr %A, i32 %add176, !dbg !3940
  %arrayidx178 = getelementptr i8, ptr %145, i32 -1, !dbg !3940
  %146 = load i8, ptr %arrayidx178, align 1, !dbg !3941
  %147 = trunc i64 %shr172 to i8, !dbg !3941
  %148 = and i8 %147, 15, !dbg !3941
  %conv181 = xor i8 %148, %146, !dbg !3941
  store i8 %conv181, ptr %arrayidx178, align 1, !dbg !3941
  %shr182 = lshr i64 %xor19.i, 32, !dbg !3942
  %mul1858 = or disjoint i32 %i86.0, 5, !dbg !3943
  %add186 = mul i32 %mul1858, %A_cols, !dbg !3943
  %149 = getelementptr i8, ptr %A, i32 %add186, !dbg !3944
  %arrayidx188 = getelementptr i8, ptr %149, i32 -1, !dbg !3944
  %150 = load i8, ptr %arrayidx188, align 1, !dbg !3945
  %151 = trunc i64 %shr182 to i8, !dbg !3945
  %152 = and i8 %151, 15, !dbg !3945
  %conv191 = xor i8 %152, %150, !dbg !3945
  store i8 %conv191, ptr %arrayidx188, align 1, !dbg !3945
  %shr192 = lshr i64 %xor19.i, 40, !dbg !3946
  %mul1959 = or disjoint i32 %i86.0, 6, !dbg !3947
  %add196 = mul i32 %mul1959, %A_cols, !dbg !3947
  %153 = getelementptr i8, ptr %A, i32 %add196, !dbg !3948
  %arrayidx198 = getelementptr i8, ptr %153, i32 -1, !dbg !3948
  %154 = load i8, ptr %arrayidx198, align 1, !dbg !3949
  %155 = trunc i64 %shr192 to i8, !dbg !3949
  %156 = and i8 %155, 15, !dbg !3949
  %conv201 = xor i8 %156, %154, !dbg !3949
  store i8 %conv201, ptr %arrayidx198, align 1, !dbg !3949
  %shr202 = lshr i64 %xor19.i, 48, !dbg !3950
  %mul20510 = or disjoint i32 %i86.0, 7, !dbg !3951
  %add206 = mul i32 %mul20510, %A_cols, !dbg !3951
  %157 = getelementptr i8, ptr %A, i32 %add206, !dbg !3952
  %arrayidx208 = getelementptr i8, ptr %157, i32 -1, !dbg !3952
  %158 = load i8, ptr %arrayidx208, align 1, !dbg !3953
  %159 = trunc i64 %shr202 to i8, !dbg !3953
  %160 = and i8 %159, 15, !dbg !3953
  %conv211 = xor i8 %160, %158, !dbg !3953
  store i8 %conv211, ptr %arrayidx208, align 1, !dbg !3953
  %and20.i = lshr i64 %xor19.i, 56, !dbg !3954
  %mul21511 = add nuw i32 %i86.0, 8, !dbg !3955
  %add216 = mul i32 %mul21511, %A_cols, !dbg !3955
  %161 = getelementptr i8, ptr %A, i32 %add216, !dbg !3956
  %arrayidx218 = getelementptr i8, ptr %161, i32 -1, !dbg !3956
  %162 = load i8, ptr %arrayidx218, align 1, !dbg !3957
  %163 = trunc nuw i64 %and20.i to i8, !dbg !3957
  %164 = and i8 %163, 15, !dbg !3957
  %conv221 = xor i8 %164, %162, !dbg !3957
  store i8 %conv221, ptr %arrayidx218, align 1, !dbg !3957
  %add223 = add nuw nsw i32 %i86.0, 8, !dbg !3958
    #dbg_value(i32 %add223, !3843, !DIExpression(), !3845)
  br label %for.cond87, !dbg !3959, !llvm.loop !3960

for.inc229:                                       ; preds = %for.cond87
    #dbg_value(!DIArgList(i8 %finished.0, i8 %xor5.i), !3809, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3179)
  %or2273 = or i8 %finished.0, %xor5.i, !dbg !3962
    #dbg_value(i8 %or2273, !3809, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !3179)
    #dbg_value(i8 %or2273, !3809, !DIExpression(), !3179)
  %inc230 = add nsw i32 %col.0, 1, !dbg !3963
    #dbg_value(i32 %inc230, !3813, !DIExpression(), !3815)
  br label %for.cond63, !dbg !3964, !llvm.loop !3965

return.loopexit:                                  ; preds = %for.cond50
  br label %return, !dbg !3967

return:                                           ; preds = %return.loopexit, %for.end45
  %retval.0 = phi i32 [ 0, %for.end45 ], [ 1, %return.loopexit ], !dbg !3179
  ret i32 %retval.0, !dbg !3967
}

; Function Attrs: nounwind
define internal fastcc void @vec_mul_add_u64(i32 noundef %legs, ptr noundef %in, i8 noundef zeroext %a, ptr noundef %acc) unnamed_addr #0 !dbg !3968 {
entry:
    #dbg_value(i32 %legs, !3971, !DIExpression(), !3972)
    #dbg_value(ptr %in, !3973, !DIExpression(), !3972)
    #dbg_value(i8 %a, !3974, !DIExpression(), !3972)
    #dbg_value(ptr %acc, !3975, !DIExpression(), !3972)
    #dbg_value(i8 %a, !3976, !DIExpression(), !3978)
  %conv.i = zext i8 %a to i32, !dbg !3980
  %mul.i = mul i32 %conv.i, 134480385, !dbg !3981
    #dbg_value(i32 %mul.i, !3982, !DIExpression(), !3978)
    #dbg_value(i32 -252645136, !3983, !DIExpression(), !3978)
  %and.i = and i32 %mul.i, -252645136, !dbg !3984
    #dbg_value(i32 %and.i, !3985, !DIExpression(), !3978)
  %shr.i = lshr exact i32 %and.i, 4, !dbg !3986
  %shr1.i = lshr exact i32 %and.i, 3, !dbg !3987
  %0 = xor i32 %shr.i, %shr1.i, !dbg !3988
  %xor2.i = xor i32 %0, %mul.i, !dbg !3988
    #dbg_value(i32 %xor2.i, !3989, !DIExpression(), !3972)
    #dbg_value(i64 1229782938247303441, !3990, !DIExpression(), !3972)
    #dbg_value(i32 0, !3991, !DIExpression(), !3993)
  %smax = call i32 @llvm.smax.i32(i32 %legs, i32 0), !dbg !3994
  br label %for.cond, !dbg !3994

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !3995
    #dbg_value(i32 %i.0, !3991, !DIExpression(), !3993)
  %exitcond = icmp ne i32 %i.0, %smax, !dbg !3996
  br i1 %exitcond, label %for.body, label %for.end, !dbg !3998

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !3999
  %1 = load i64, ptr %arrayidx, align 8, !dbg !3999
  %and = and i64 %1, 1229782938247303441, !dbg !4001
  %and1 = and i32 %xor2.i, 255, !dbg !4002
  %conv = zext nneg i32 %and1 to i64, !dbg !4003
  %mul = mul i64 %and, %conv, !dbg !4004
  %shr = lshr i64 %1, 1, !dbg !4005
  %and3 = and i64 %shr, 1229782938247303441, !dbg !4006
  %shr4 = lshr i32 %xor2.i, 8, !dbg !4007
  %and5 = and i32 %shr4, 15, !dbg !4008
  %conv6 = zext nneg i32 %and5 to i64, !dbg !4009
  %mul7 = mul nuw i64 %and3, %conv6, !dbg !4010
  %xor = xor i64 %mul, %mul7, !dbg !4011
  %arrayidx8 = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !4012
  %2 = load i64, ptr %arrayidx8, align 8, !dbg !4012
  %shr9 = lshr i64 %2, 2, !dbg !4013
  %and10 = and i64 %shr9, 1229782938247303441, !dbg !4014
  %shr11 = lshr i32 %xor2.i, 16, !dbg !4015
  %and12 = and i32 %shr11, 15, !dbg !4016
  %conv13 = zext nneg i32 %and12 to i64, !dbg !4017
  %mul14 = mul nuw i64 %and10, %conv13, !dbg !4018
  %xor15 = xor i64 %xor, %mul14, !dbg !4019
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !4020
  %3 = load i64, ptr %arrayidx16, align 8, !dbg !4020
  %shr17 = lshr i64 %3, 3, !dbg !4021
  %and18 = and i64 %shr17, 1229782938247303441, !dbg !4022
  %shr19 = lshr i32 %xor2.i, 24, !dbg !4023
  %and20 = and i32 %shr19, 15, !dbg !4024
  %conv21 = zext nneg i32 %and20 to i64, !dbg !4025
  %mul22 = mul nuw i64 %and18, %conv21, !dbg !4026
  %xor23 = xor i64 %xor15, %mul22, !dbg !4027
  %arrayidx24 = getelementptr inbounds nuw i64, ptr %acc, i32 %i.0, !dbg !4028
  %4 = load i64, ptr %arrayidx24, align 8, !dbg !4029
  %xor25 = xor i64 %4, %xor23, !dbg !4029
  store i64 %xor25, ptr %arrayidx24, align 8, !dbg !4029
  %inc = add nuw i32 %i.0, 1, !dbg !4030
    #dbg_value(i32 %inc, !3991, !DIExpression(), !3993)
  br label %for.cond, !dbg !4031, !llvm.loop !4032

for.end:                                          ; preds = %for.cond
  ret void, !dbg !4034
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
!83 = distinct !DIGlobalVariable(name: "pqmayo_MAYO_2_ref_uint32_t_blocker", scope: !84, file: !99, line: 126, type: !104, isLocal: false, isDefinition: true)
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
!98 = distinct !DIGlobalVariable(name: "pqmayo_MAYO_2_ref_uint64_t_blocker", scope: !84, file: !99, line: 127, type: !100, isLocal: false, isDefinition: true)
!99 = !DIFile(filename: "../../../src/arithmetic.c", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!100 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !53)
!101 = !DIGlobalVariableExpression(var: !102, expr: !DIExpression())
!102 = distinct !DIGlobalVariable(name: "pqmayo_MAYO_2_ref_unsigned_char_blocker", scope: !84, file: !99, line: 128, type: !103, isLocal: false, isDefinition: true)
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
!166 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sk_t", file: !79, line: 291, size: 819712, elements: !167)
!167 = !{!168, !172}
!168 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !166, file: !79, line: 292, baseType: !169, size: 811008)
!169 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 811008, elements: !170)
!170 = !{!171}
!171 = !DISubrange(count: 12672)
!172 = !DIDerivedType(tag: DW_TAG_member, name: "O", scope: !166, file: !79, line: 293, baseType: !173, size: 8704, offset: 811008)
!173 = !DICompositeType(tag: DW_TAG_array_type, baseType: !174, size: 8704, elements: !176)
!174 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !54, line: 24, baseType: !175)
!175 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !56, line: 43, baseType: !51)
!176 = !{!177}
!177 = !DISubrange(count: 1088)
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
!190 = distinct !DISubprogram(name: "pqmayo_MAYO_2_ref_mayo_keypair", scope: !68, file: !68, line: 298, type: !191, scopeLine: 298, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
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
!248 = distinct !DISubprogram(name: "pqmayo_MAYO_2_ref_mayo_expand_pk", scope: !68, file: !68, line: 608, type: !249, scopeLine: 609, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
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
!278 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 256, elements: !22)
!279 = !DILocalVariable(name: "i", scope: !280, file: !68, line: 266, type: !86)
!280 = distinct !DILexicalBlock(scope: !265, file: !68, line: 266, column: 5)
!281 = !DILocation(line: 0, scope: !280, inlinedAt: !268)
!282 = !DILocation(line: 266, column: 10, scope: !280, inlinedAt: !268)
!283 = !DILocation(line: 266, column: 28, scope: !284, inlinedAt: !268)
!284 = distinct !DILexicalBlock(scope: !280, file: !68, line: 266, column: 5)
!285 = !DILocation(line: 266, column: 5, scope: !280, inlinedAt: !268)
!286 = !DILocation(line: 266, scope: !280, inlinedAt: !268)
!287 = !DILocation(line: 268, column: 29, scope: !288, inlinedAt: !268)
!288 = distinct !DILexicalBlock(scope: !284, file: !68, line: 267, column: 5)
!289 = !DILocation(line: 268, column: 24, scope: !288, inlinedAt: !268)
!290 = !DILocation(line: 268, column: 9, scope: !288, inlinedAt: !268)
!291 = !DILocation(line: 269, column: 24, scope: !288, inlinedAt: !268)
!292 = !DILocation(line: 269, column: 21, scope: !288, inlinedAt: !268)
!293 = !DILocation(line: 269, column: 9, scope: !288, inlinedAt: !268)
!294 = !DILocation(line: 266, column: 5, scope: !284, inlinedAt: !268)
!295 = distinct !{!295, !285, !296, !297}
!296 = !DILocation(line: 270, column: 5, scope: !280, inlinedAt: !268)
!297 = !{!"llvm.loop.mustprogress"}
!298 = !DILocation(line: 271, column: 1, scope: !265, inlinedAt: !268)
!299 = !DILocation(line: 612, column: 23, scope: !248, inlinedAt: !252)
!300 = !DILocation(line: 612, column: 72, scope: !248, inlinedAt: !252)
!301 = !DILocation(line: 265, column: 14, scope: !265, inlinedAt: !302)
!302 = distinct !DILocation(line: 612, column: 5, scope: !248, inlinedAt: !252)
!303 = !DILocation(line: 0, scope: !265, inlinedAt: !302)
!304 = !DILocation(line: 0, scope: !280, inlinedAt: !302)
!305 = !DILocation(line: 266, column: 10, scope: !280, inlinedAt: !302)
!306 = !DILocation(line: 266, column: 28, scope: !284, inlinedAt: !302)
!307 = !DILocation(line: 266, column: 5, scope: !280, inlinedAt: !302)
!308 = !DILocation(line: 266, scope: !280, inlinedAt: !302)
!309 = !DILocation(line: 268, column: 29, scope: !288, inlinedAt: !302)
!310 = !DILocation(line: 268, column: 24, scope: !288, inlinedAt: !302)
!311 = !DILocation(line: 268, column: 9, scope: !288, inlinedAt: !302)
!312 = !DILocation(line: 269, column: 24, scope: !288, inlinedAt: !302)
!313 = !DILocation(line: 269, column: 21, scope: !288, inlinedAt: !302)
!314 = !DILocation(line: 269, column: 9, scope: !288, inlinedAt: !302)
!315 = !DILocation(line: 266, column: 5, scope: !284, inlinedAt: !302)
!316 = distinct !{!316, !307, !317, !297}
!317 = !DILocation(line: 270, column: 5, scope: !280, inlinedAt: !302)
!318 = !DILocation(line: 271, column: 1, scope: !265, inlinedAt: !302)
!319 = !DILocation(line: 70, column: 9, scope: !320, inlinedAt: !150)
!320 = distinct !DILexicalBlock(scope: !321, file: !2, line: 69, column: 12)
!321 = distinct !DILexicalBlock(scope: !117, file: !2, line: 65, column: 9)
!322 = !DILocation(line: 73, column: 5, scope: !117, inlinedAt: !150)
!323 = !DILocation(line: 74, column: 11, scope: !117, inlinedAt: !150)
!324 = !DILocation(line: 75, column: 13, scope: !325, inlinedAt: !150)
!325 = distinct !DILexicalBlock(scope: !117, file: !2, line: 75, column: 9)
!326 = !DILocation(line: 76, column: 9, scope: !327, inlinedAt: !150)
!327 = distinct !DILexicalBlock(scope: !325, file: !2, line: 75, column: 25)
!328 = !DILocation(line: 78, column: 9, scope: !327, inlinedAt: !150)
!329 = !DILocation(line: 80, column: 9, scope: !330, inlinedAt: !150)
!330 = distinct !DILexicalBlock(scope: !325, file: !2, line: 79, column: 12)
!331 = !DILocation(line: 83, column: 5, scope: !117, inlinedAt: !150)
!332 = !DILocation(line: 84, column: 44, scope: !117, inlinedAt: !150)
!333 = !DILocalVariable(name: "p", arg: 1, scope: !334, file: !68, line: 520, type: !193)
!334 = distinct !DISubprogram(name: "pqmayo_MAYO_2_ref_mayo_open", scope: !68, file: !68, line: 520, type: !335, scopeLine: 522, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!335 = !DISubroutineType(types: !336)
!336 = !{!86, !193, !61, !337, !90, !58, !90}
!337 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 32)
!338 = !DILocation(line: 0, scope: !334, inlinedAt: !339)
!339 = distinct !DILocation(line: 84, column: 11, scope: !117, inlinedAt: !150)
!340 = !DILocalVariable(name: "m", arg: 2, scope: !334, file: !68, line: 520, type: !61)
!341 = !DILocalVariable(name: "mlen", arg: 3, scope: !334, file: !68, line: 521, type: !337)
!342 = !DILocalVariable(name: "sm", arg: 4, scope: !334, file: !68, line: 521, type: !90)
!343 = !DILocalVariable(name: "smlen", arg: 5, scope: !334, file: !68, line: 522, type: !58)
!344 = !DILocalVariable(name: "pk", arg: 6, scope: !334, file: !68, line: 522, type: !90)
!345 = !DILocalVariable(name: "param_sig_bytes", scope: !334, file: !68, line: 523, type: !275)
!346 = !DILocation(line: 524, column: 15, scope: !347, inlinedAt: !339)
!347 = distinct !DILexicalBlock(scope: !334, file: !68, line: 524, column: 9)
!348 = !DILocation(line: 527, column: 36, scope: !334, inlinedAt: !339)
!349 = !DILocation(line: 527, column: 61, scope: !334, inlinedAt: !339)
!350 = !DILocation(line: 527, column: 18, scope: !334, inlinedAt: !339)
!351 = !DILocalVariable(name: "result", scope: !334, file: !68, line: 527, type: !86)
!352 = !DILocation(line: 530, column: 16, scope: !353, inlinedAt: !339)
!353 = distinct !DILexicalBlock(scope: !334, file: !68, line: 530, column: 9)
!354 = !DILocation(line: 531, column: 23, scope: !355, inlinedAt: !339)
!355 = distinct !DILexicalBlock(scope: !353, file: !68, line: 530, column: 28)
!356 = !DILocation(line: 532, column: 23, scope: !355, inlinedAt: !339)
!357 = !DILocation(line: 532, column: 9, scope: !355, inlinedAt: !339)
!358 = !DILocation(line: 533, column: 5, scope: !355, inlinedAt: !339)
!359 = !DILocation(line: 85, column: 24, scope: !360, inlinedAt: !150)
!360 = distinct !DILexicalBlock(scope: !117, file: !2, line: 85, column: 9)
!361 = !DILocation(line: 85, column: 27, scope: !360, inlinedAt: !150)
!362 = !DILocation(line: 86, column: 9, scope: !363, inlinedAt: !150)
!363 = distinct !DILexicalBlock(scope: !360, file: !2, line: 85, column: 54)
!364 = !DILocation(line: 88, column: 9, scope: !363, inlinedAt: !150)
!365 = !DILocation(line: 91, column: 9, scope: !366, inlinedAt: !150)
!366 = distinct !DILexicalBlock(scope: !360, file: !2, line: 89, column: 12)
!367 = !DILocation(line: 94, column: 5, scope: !117, inlinedAt: !150)
!368 = !DILocation(line: 95, column: 11, scope: !117, inlinedAt: !150)
!369 = !DILocation(line: 96, column: 13, scope: !370, inlinedAt: !150)
!370 = distinct !DILexicalBlock(scope: !117, file: !2, line: 96, column: 9)
!371 = !DILocation(line: 97, column: 9, scope: !372, inlinedAt: !150)
!372 = distinct !DILexicalBlock(scope: !370, file: !2, line: 96, column: 25)
!373 = !DILocation(line: 99, column: 9, scope: !372, inlinedAt: !150)
!374 = !DILocation(line: 102, column: 9, scope: !375, inlinedAt: !150)
!375 = distinct !DILexicalBlock(scope: !370, file: !2, line: 100, column: 12)
!376 = !DILocation(line: 96, column: 16, scope: !370, inlinedAt: !150)
!377 = !DILabel(scope: !117, name: "err", file: !2, line: 129)
!378 = !DILocation(line: 129, column: 1, scope: !117, inlinedAt: !150)
!379 = !DILocation(line: 130, column: 5, scope: !117, inlinedAt: !150)
!380 = !DILocation(line: 131, column: 5, scope: !117, inlinedAt: !150)
!381 = !DILocation(line: 132, column: 5, scope: !117, inlinedAt: !150)
!382 = !DILocation(line: 133, column: 5, scope: !117, inlinedAt: !150)
!383 = !DILocation(line: 134, column: 5, scope: !117, inlinedAt: !150)
!384 = !DILocation(line: 135, column: 5, scope: !117, inlinedAt: !150)
!385 = !DILocation(line: 148, column: 5, scope: !113)
!386 = !DILocation(line: 0, scope: !190)
!387 = !DILocation(line: 301, column: 11, scope: !190)
!388 = !DILocation(line: 306, column: 1, scope: !190)
!389 = !DILocation(line: 307, column: 5, scope: !190)
!390 = distinct !DISubprogram(name: "pqmayo_MAYO_2_ref_mayo_keypair_compact", scope: !68, file: !68, line: 538, type: !191, scopeLine: 539, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!391 = !DILocalVariable(name: "p", arg: 1, scope: !390, file: !68, line: 538, type: !193)
!392 = !DILocation(line: 0, scope: !390)
!393 = !DILocalVariable(name: "cpk", arg: 2, scope: !390, file: !68, line: 538, type: !61)
!394 = !DILocalVariable(name: "csk", arg: 3, scope: !390, file: !68, line: 539, type: !61)
!395 = !DILocalVariable(name: "ret", scope: !390, file: !68, line: 540, type: !86)
!396 = !DILocalVariable(name: "seed_sk", scope: !390, file: !68, line: 541, type: !61)
!397 = !DILocalVariable(name: "S", scope: !390, file: !68, line: 542, type: !398)
!398 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 4480, elements: !399)
!399 = !{!400}
!400 = !DISubrange(count: 560)
!401 = !DILocation(line: 542, column: 19, scope: !390)
!402 = !DILocalVariable(name: "P", scope: !390, file: !68, line: 543, type: !169)
!403 = !DILocation(line: 543, column: 14, scope: !390)
!404 = !DILocalVariable(name: "P3", scope: !390, file: !68, line: 544, type: !405)
!405 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 73984, elements: !406)
!406 = !{!407}
!407 = !DISubrange(count: 1156)
!408 = !DILocation(line: 544, column: 14, scope: !390)
!409 = !DILocalVariable(name: "O", scope: !390, file: !68, line: 547, type: !410)
!410 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 8704, elements: !176)
!411 = !DILocation(line: 547, column: 19, scope: !390)
!412 = !DILocalVariable(name: "m_vec_limbs", scope: !390, file: !68, line: 549, type: !275)
!413 = !DILocalVariable(name: "param_m", scope: !390, file: !68, line: 550, type: !275)
!414 = !DILocalVariable(name: "param_v", scope: !390, file: !68, line: 551, type: !275)
!415 = !DILocalVariable(name: "param_o", scope: !390, file: !68, line: 552, type: !275)
!416 = !DILocalVariable(name: "param_O_bytes", scope: !390, file: !68, line: 553, type: !275)
!417 = !DILocalVariable(name: "param_P1_limbs", scope: !390, file: !68, line: 554, type: !275)
!418 = !DILocalVariable(name: "param_P3_limbs", scope: !390, file: !68, line: 555, type: !275)
!419 = !DILocalVariable(name: "param_pk_seed_bytes", scope: !390, file: !68, line: 556, type: !275)
!420 = !DILocalVariable(name: "param_sk_seed_bytes", scope: !390, file: !68, line: 557, type: !275)
!421 = !DILocalVariable(name: "P1", scope: !390, file: !68, line: 559, type: !52)
!422 = !DILocation(line: 560, column: 22, scope: !390)
!423 = !DILocalVariable(name: "P2", scope: !390, file: !68, line: 560, type: !52)
!424 = !DILocation(line: 566, column: 9, scope: !425)
!425 = distinct !DILexicalBlock(scope: !390, file: !68, line: 566, column: 9)
!426 = !DILocation(line: 566, column: 51, scope: !425)
!427 = !DILocation(line: 573, column: 5, scope: !390)
!428 = !DILocalVariable(name: "seed_pk", scope: !390, file: !68, line: 546, type: !61)
!429 = !DILocation(line: 579, column: 14, scope: !390)
!430 = !DILocalVariable(name: "m", arg: 1, scope: !431, file: !68, line: 20, type: !90)
!431 = distinct !DISubprogram(name: "decode", scope: !68, file: !68, line: 20, type: !432, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!432 = !DISubroutineType(types: !433)
!433 = !{null, !90, !61, !86}
!434 = !DILocation(line: 0, scope: !431, inlinedAt: !435)
!435 = distinct !DILocation(line: 579, column: 5, scope: !390)
!436 = !DILocalVariable(name: "mdec", arg: 2, scope: !431, file: !68, line: 20, type: !61)
!437 = !DILocalVariable(name: "mdeclen", arg: 3, scope: !431, file: !68, line: 20, type: !86)
!438 = !DILocalVariable(name: "i", scope: !431, file: !68, line: 21, type: !86)
!439 = !DILocation(line: 22, column: 10, scope: !440, inlinedAt: !435)
!440 = distinct !DILexicalBlock(scope: !431, file: !68, line: 22, column: 5)
!441 = !DILocation(line: 22, scope: !440, inlinedAt: !435)
!442 = !DILocation(line: 22, column: 19, scope: !443, inlinedAt: !435)
!443 = distinct !DILexicalBlock(scope: !440, file: !68, line: 22, column: 5)
!444 = !DILocation(line: 22, column: 5, scope: !440, inlinedAt: !435)
!445 = !DILocation(line: 23, column: 19, scope: !446, inlinedAt: !435)
!446 = distinct !DILexicalBlock(scope: !443, file: !68, line: 22, column: 39)
!447 = !DILocation(line: 23, column: 24, scope: !446, inlinedAt: !435)
!448 = !DILocation(line: 23, column: 14, scope: !446, inlinedAt: !435)
!449 = !DILocation(line: 23, column: 17, scope: !446, inlinedAt: !435)
!450 = !DILocation(line: 24, column: 24, scope: !446, inlinedAt: !435)
!451 = !DILocation(line: 24, column: 17, scope: !446, inlinedAt: !435)
!452 = !DILocation(line: 24, column: 14, scope: !446, inlinedAt: !435)
!453 = !DILocation(line: 22, column: 34, scope: !443, inlinedAt: !435)
!454 = !DILocation(line: 22, column: 5, scope: !443, inlinedAt: !435)
!455 = distinct !{!455, !444, !456, !297}
!456 = !DILocation(line: 25, column: 5, scope: !440, inlinedAt: !435)
!457 = !DILocation(line: 0, scope: !256, inlinedAt: !458)
!458 = distinct !DILocation(line: 585, column: 5, scope: !390)
!459 = !DILocation(line: 284, column: 5, scope: !256, inlinedAt: !458)
!460 = !DILocation(line: 265, column: 14, scope: !265, inlinedAt: !461)
!461 = distinct !DILocation(line: 285, column: 5, scope: !256, inlinedAt: !458)
!462 = !DILocation(line: 0, scope: !265, inlinedAt: !461)
!463 = !DILocation(line: 0, scope: !280, inlinedAt: !461)
!464 = !DILocation(line: 266, column: 10, scope: !280, inlinedAt: !461)
!465 = !DILocation(line: 266, column: 28, scope: !284, inlinedAt: !461)
!466 = !DILocation(line: 266, column: 5, scope: !280, inlinedAt: !461)
!467 = !DILocation(line: 266, scope: !280, inlinedAt: !461)
!468 = !DILocation(line: 268, column: 29, scope: !288, inlinedAt: !461)
!469 = !DILocation(line: 268, column: 24, scope: !288, inlinedAt: !461)
!470 = !DILocation(line: 268, column: 9, scope: !288, inlinedAt: !461)
!471 = !DILocation(line: 269, column: 24, scope: !288, inlinedAt: !461)
!472 = !DILocation(line: 269, column: 21, scope: !288, inlinedAt: !461)
!473 = !DILocation(line: 269, column: 9, scope: !288, inlinedAt: !461)
!474 = !DILocation(line: 266, column: 5, scope: !284, inlinedAt: !461)
!475 = distinct !{!475, !466, !476, !297}
!476 = !DILocation(line: 270, column: 5, scope: !280, inlinedAt: !461)
!477 = !DILocation(line: 271, column: 1, scope: !265, inlinedAt: !461)
!478 = !DILocalVariable(name: "p", arg: 1, scope: !479, file: !480, line: 260, type: !193)
!479 = distinct !DISubprogram(name: "compute_P3", scope: !480, file: !480, line: 260, type: !481, scopeLine: 260, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!480 = !DIFile(filename: "../../../src/generic/generic_arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!481 = !DISubroutineType(types: !482)
!482 = !{null, !193, !483, !52, !90, !52}
!483 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 32)
!484 = !DILocation(line: 0, scope: !479, inlinedAt: !485)
!485 = distinct !DILocation(line: 588, column: 5, scope: !390)
!486 = !DILocalVariable(name: "P1", arg: 2, scope: !479, file: !480, line: 260, type: !483)
!487 = !DILocalVariable(name: "P2", arg: 3, scope: !479, file: !480, line: 260, type: !52)
!488 = !DILocalVariable(name: "O", arg: 4, scope: !479, file: !480, line: 260, type: !90)
!489 = !DILocalVariable(name: "P3", arg: 5, scope: !479, file: !480, line: 260, type: !52)
!490 = !DILocalVariable(name: "m_vec_limbs", scope: !479, file: !480, line: 262, type: !275)
!491 = !DILocalVariable(name: "param_v", scope: !479, file: !480, line: 263, type: !275)
!492 = !DILocalVariable(name: "param_o", scope: !479, file: !480, line: 264, type: !275)
!493 = !DILocalVariable(name: "p", arg: 1, scope: !494, file: !480, line: 74, type: !193)
!494 = distinct !DISubprogram(name: "P1_times_O", scope: !480, file: !480, line: 74, type: !495, scopeLine: 74, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!495 = !DISubroutineType(types: !496)
!496 = !{null, !193, !483, !90, !52}
!497 = !DILocation(line: 0, scope: !494, inlinedAt: !498)
!498 = distinct !DILocation(line: 267, column: 5, scope: !479, inlinedAt: !485)
!499 = !DILocalVariable(name: "P1", arg: 2, scope: !494, file: !480, line: 74, type: !483)
!500 = !DILocalVariable(name: "O", arg: 3, scope: !494, file: !480, line: 74, type: !90)
!501 = !DILocalVariable(name: "acc", arg: 4, scope: !494, file: !480, line: 74, type: !52)
!502 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !503, file: !480, line: 16, type: !275)
!503 = distinct !DISubprogram(name: "mul_add_m_upper_triangular_mat_x_mat", scope: !480, file: !480, line: 16, type: !504, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!504 = !DISubroutineType(types: !505)
!505 = !{null, !275, !483, !90, !52, !275, !275, !275, !275}
!506 = !DILocation(line: 0, scope: !503, inlinedAt: !507)
!507 = distinct !DILocation(line: 78, column: 5, scope: !494, inlinedAt: !498)
!508 = !DILocalVariable(name: "bs_mat", arg: 2, scope: !503, file: !480, line: 16, type: !483)
!509 = !DILocalVariable(name: "mat", arg: 3, scope: !503, file: !480, line: 16, type: !90)
!510 = !DILocalVariable(name: "acc", arg: 4, scope: !503, file: !480, line: 16, type: !52)
!511 = !DILocalVariable(name: "bs_mat_rows", arg: 5, scope: !503, file: !480, line: 17, type: !275)
!512 = !DILocalVariable(name: "bs_mat_cols", arg: 6, scope: !503, file: !480, line: 17, type: !275)
!513 = !DILocalVariable(name: "mat_cols", arg: 7, scope: !503, file: !480, line: 17, type: !275)
!514 = !DILocalVariable(name: "triangular", arg: 8, scope: !503, file: !480, line: 17, type: !275)
!515 = !DILocalVariable(name: "bs_mat_entries_used", scope: !503, file: !480, line: 19, type: !86)
!516 = !DILocalVariable(name: "r", scope: !517, file: !480, line: 20, type: !86)
!517 = distinct !DILexicalBlock(scope: !503, file: !480, line: 20, column: 5)
!518 = !DILocation(line: 0, scope: !517, inlinedAt: !507)
!519 = !DILocation(line: 20, column: 10, scope: !517, inlinedAt: !507)
!520 = !DILocation(line: 19, column: 9, scope: !503, inlinedAt: !507)
!521 = !DILocation(line: 20, scope: !517, inlinedAt: !507)
!522 = !DILocation(line: 20, column: 23, scope: !523, inlinedAt: !507)
!523 = distinct !DILexicalBlock(scope: !517, file: !480, line: 20, column: 5)
!524 = !DILocation(line: 20, column: 5, scope: !517, inlinedAt: !507)
!525 = !DILocation(line: 21, column: 9, scope: !526, inlinedAt: !507)
!526 = distinct !DILexicalBlock(scope: !527, file: !480, line: 21, column: 9)
!527 = distinct !DILexicalBlock(scope: !523, file: !480, line: 20, column: 43)
!528 = !DILocation(line: 50, column: 5, scope: !529, inlinedAt: !533)
!529 = distinct !DILexicalBlock(scope: !530, file: !480, line: 50, column: 5)
!530 = distinct !DISubprogram(name: "mul_add_mat_trans_x_m_mat", scope: !480, file: !480, line: 47, type: !531, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!531 = !DISubroutineType(types: !532)
!532 = !{null, !275, !90, !483, !52, !275, !275, !275}
!533 = distinct !DILocation(line: 270, column: 5, scope: !479, inlinedAt: !485)
!534 = !DILocation(line: 21, scope: !526, inlinedAt: !507)
!535 = !DILocalVariable(name: "c", scope: !526, file: !480, line: 21, type: !86)
!536 = !DILocation(line: 0, scope: !526, inlinedAt: !507)
!537 = !DILocation(line: 21, column: 40, scope: !538, inlinedAt: !507)
!538 = distinct !DILexicalBlock(scope: !526, file: !480, line: 21, column: 9)
!539 = !DILocation(line: 22, column: 13, scope: !540, inlinedAt: !507)
!540 = distinct !DILexicalBlock(scope: !541, file: !480, line: 22, column: 13)
!541 = distinct !DILexicalBlock(scope: !538, file: !480, line: 21, column: 60)
!542 = !DILocation(line: 22, scope: !540, inlinedAt: !507)
!543 = !DILocalVariable(name: "k", scope: !540, file: !480, line: 22, type: !86)
!544 = !DILocation(line: 0, scope: !540, inlinedAt: !507)
!545 = !DILocation(line: 22, column: 31, scope: !546, inlinedAt: !507)
!546 = distinct !DILexicalBlock(scope: !540, file: !480, line: 22, column: 13)
!547 = !DILocation(line: 23, column: 51, scope: !548, inlinedAt: !507)
!548 = distinct !DILexicalBlock(scope: !546, file: !480, line: 22, column: 51)
!549 = !DILocation(line: 23, column: 94, scope: !548, inlinedAt: !507)
!550 = !DILocation(line: 23, column: 88, scope: !548, inlinedAt: !507)
!551 = !DILocation(line: 23, column: 134, scope: !548, inlinedAt: !507)
!552 = !DILocation(line: 23, column: 145, scope: !548, inlinedAt: !507)
!553 = !DILocation(line: 23, column: 115, scope: !548, inlinedAt: !507)
!554 = !DILocation(line: 23, column: 17, scope: !548, inlinedAt: !507)
!555 = !DILocation(line: 22, column: 45, scope: !546, inlinedAt: !507)
!556 = !DILocation(line: 22, column: 13, scope: !546, inlinedAt: !507)
!557 = distinct !{!557, !539, !558, !297}
!558 = !DILocation(line: 24, column: 13, scope: !540, inlinedAt: !507)
!559 = !DILocation(line: 25, column: 33, scope: !541, inlinedAt: !507)
!560 = !DILocation(line: 21, column: 56, scope: !538, inlinedAt: !507)
!561 = !DILocation(line: 21, column: 9, scope: !538, inlinedAt: !507)
!562 = distinct !{!562, !525, !563, !297}
!563 = !DILocation(line: 26, column: 9, scope: !526, inlinedAt: !507)
!564 = !DILocation(line: 20, column: 39, scope: !523, inlinedAt: !507)
!565 = !DILocation(line: 20, column: 5, scope: !523, inlinedAt: !507)
!566 = distinct !{!566, !524, !567, !297}
!567 = !DILocation(line: 27, column: 5, scope: !517, inlinedAt: !507)
!568 = !DILocation(line: 50, scope: !529, inlinedAt: !533)
!569 = !DILocalVariable(name: "r", scope: !529, file: !480, line: 50, type: !86)
!570 = !DILocation(line: 0, scope: !529, inlinedAt: !533)
!571 = !DILocation(line: 50, column: 23, scope: !572, inlinedAt: !533)
!572 = distinct !DILexicalBlock(scope: !529, file: !480, line: 50, column: 5)
!573 = !DILocation(line: 51, column: 9, scope: !574, inlinedAt: !533)
!574 = distinct !DILexicalBlock(scope: !575, file: !480, line: 51, column: 9)
!575 = distinct !DILexicalBlock(scope: !572, file: !480, line: 50, column: 40)
!576 = !DILocation(line: 51, scope: !574, inlinedAt: !533)
!577 = !DILocalVariable(name: "c", scope: !574, file: !480, line: 51, type: !86)
!578 = !DILocation(line: 0, scope: !574, inlinedAt: !533)
!579 = !DILocation(line: 51, column: 27, scope: !580, inlinedAt: !533)
!580 = distinct !DILexicalBlock(scope: !574, file: !480, line: 51, column: 9)
!581 = !DILocation(line: 52, column: 13, scope: !582, inlinedAt: !533)
!582 = distinct !DILexicalBlock(scope: !583, file: !480, line: 52, column: 13)
!583 = distinct !DILexicalBlock(scope: !580, file: !480, line: 51, column: 44)
!584 = !DILocation(line: 52, scope: !582, inlinedAt: !533)
!585 = !DILocalVariable(name: "k", scope: !582, file: !480, line: 52, type: !86)
!586 = !DILocation(line: 0, scope: !582, inlinedAt: !533)
!587 = !DILocation(line: 52, column: 31, scope: !588, inlinedAt: !533)
!588 = distinct !DILexicalBlock(scope: !582, file: !480, line: 52, column: 13)
!589 = !DILocation(line: 53, column: 70, scope: !590, inlinedAt: !533)
!590 = distinct !DILexicalBlock(scope: !588, file: !480, line: 52, column: 54)
!591 = !DILocation(line: 53, column: 84, scope: !590, inlinedAt: !533)
!592 = !DILocation(line: 53, column: 51, scope: !590, inlinedAt: !533)
!593 = !DILocation(line: 53, column: 96, scope: !590, inlinedAt: !533)
!594 = !DILocation(line: 53, column: 90, scope: !590, inlinedAt: !533)
!595 = !DILocation(line: 53, column: 136, scope: !590, inlinedAt: !533)
!596 = !DILocation(line: 53, column: 150, scope: !590, inlinedAt: !533)
!597 = !DILocation(line: 53, column: 117, scope: !590, inlinedAt: !533)
!598 = !DILocation(line: 53, column: 17, scope: !590, inlinedAt: !533)
!599 = !DILocation(line: 52, column: 48, scope: !588, inlinedAt: !533)
!600 = !DILocation(line: 52, column: 13, scope: !588, inlinedAt: !533)
!601 = distinct !{!601, !581, !602, !297}
!602 = !DILocation(line: 54, column: 13, scope: !582, inlinedAt: !533)
!603 = !DILocation(line: 51, column: 40, scope: !580, inlinedAt: !533)
!604 = !DILocation(line: 51, column: 9, scope: !580, inlinedAt: !533)
!605 = distinct !{!605, !573, !606, !297}
!606 = !DILocation(line: 55, column: 9, scope: !574, inlinedAt: !533)
!607 = !DILocation(line: 50, column: 36, scope: !572, inlinedAt: !533)
!608 = !DILocation(line: 50, column: 5, scope: !572, inlinedAt: !533)
!609 = distinct !{!609, !528, !610, !297}
!610 = !DILocation(line: 56, column: 5, scope: !529, inlinedAt: !533)
!611 = !DILocation(line: 591, column: 5, scope: !390)
!612 = !DILocalVariable(name: "P3_upper", scope: !390, file: !68, line: 593, type: !613)
!613 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 39168, elements: !614)
!614 = !{!615}
!615 = !DISubrange(count: 612)
!616 = !DILocation(line: 593, column: 14, scope: !390)
!617 = !DILocation(line: 596, column: 5, scope: !390)
!618 = !DILocation(line: 597, column: 31, scope: !390)
!619 = !DILocalVariable(name: "in", arg: 1, scope: !620, file: !68, line: 272, type: !483)
!620 = distinct !DISubprogram(name: "pack_m_vecs", scope: !68, file: !68, line: 272, type: !621, scopeLine: 272, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!621 = !DISubroutineType(types: !622)
!622 = !{null, !483, !61, !86, !86}
!623 = !DILocation(line: 0, scope: !620, inlinedAt: !624)
!624 = distinct !DILocation(line: 597, column: 5, scope: !390)
!625 = !DILocalVariable(name: "out", arg: 2, scope: !620, file: !68, line: 272, type: !61)
!626 = !DILocalVariable(name: "vecs", arg: 3, scope: !620, file: !68, line: 272, type: !86)
!627 = !DILocalVariable(name: "m", arg: 4, scope: !620, file: !68, line: 272, type: !86)
!628 = !DILocalVariable(name: "m_vec_limbs", scope: !620, file: !68, line: 273, type: !275)
!629 = !DILocalVariable(name: "_in", scope: !620, file: !68, line: 274, type: !61)
!630 = !DILocalVariable(name: "i", scope: !631, file: !68, line: 275, type: !86)
!631 = distinct !DILexicalBlock(scope: !620, file: !68, line: 275, column: 5)
!632 = !DILocation(line: 0, scope: !631, inlinedAt: !624)
!633 = !DILocation(line: 275, column: 10, scope: !631, inlinedAt: !624)
!634 = !DILocation(line: 275, scope: !631, inlinedAt: !624)
!635 = !DILocation(line: 275, column: 23, scope: !636, inlinedAt: !624)
!636 = distinct !DILexicalBlock(scope: !631, file: !68, line: 275, column: 5)
!637 = !DILocation(line: 275, column: 5, scope: !631, inlinedAt: !624)
!638 = !DILocation(line: 277, column: 27, scope: !639, inlinedAt: !624)
!639 = distinct !DILexicalBlock(scope: !636, file: !68, line: 276, column: 5)
!640 = !DILocation(line: 277, column: 21, scope: !639, inlinedAt: !624)
!641 = !DILocation(line: 277, column: 39, scope: !639, inlinedAt: !624)
!642 = !DILocation(line: 277, column: 36, scope: !639, inlinedAt: !624)
!643 = !DILocation(line: 277, column: 9, scope: !639, inlinedAt: !624)
!644 = !DILocation(line: 275, column: 32, scope: !636, inlinedAt: !624)
!645 = !DILocation(line: 275, column: 5, scope: !636, inlinedAt: !624)
!646 = distinct !{!646, !637, !647, !297}
!647 = !DILocation(line: 278, column: 5, scope: !631, inlinedAt: !624)
!648 = !DILocation(line: 602, column: 5, scope: !390)
!649 = !DILabel(scope: !390, name: "err", file: !68, line: 600)
!650 = !DILocation(line: 600, column: 5, scope: !390)
!651 = !DILocation(line: 603, column: 5, scope: !390)
!652 = !DILocation(line: 604, column: 5, scope: !390)
!653 = !DILocation(line: 605, column: 5, scope: !390)
!654 = distinct !DISubprogram(name: "m_vec_mul_add", scope: !655, file: !655, line: 31, type: !656, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!655 = !DIFile(filename: "../../../src/generic/arithmetic_fixed.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!656 = !DISubroutineType(types: !657)
!657 = !{null, !86, !483, !51, !52}
!658 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !654, file: !655, line: 31, type: !86)
!659 = !DILocation(line: 0, scope: !654)
!660 = !DILocalVariable(name: "in", arg: 2, scope: !654, file: !655, line: 31, type: !483)
!661 = !DILocalVariable(name: "a", arg: 3, scope: !654, file: !655, line: 31, type: !51)
!662 = !DILocalVariable(name: "acc", arg: 4, scope: !654, file: !655, line: 31, type: !52)
!663 = !DILocalVariable(name: "b", arg: 1, scope: !664, file: !665, line: 128, type: !174)
!664 = distinct !DISubprogram(name: "mul_table", scope: !665, file: !665, line: 128, type: !666, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!665 = !DIFile(filename: "../../../src/simple_arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!666 = !DISubroutineType(types: !667)
!667 = !{!62, !174}
!668 = !DILocation(line: 0, scope: !664, inlinedAt: !669)
!669 = distinct !DILocation(line: 33, column: 20, scope: !654)
!670 = !DILocation(line: 129, column: 19, scope: !664, inlinedAt: !669)
!671 = !DILocation(line: 129, column: 33, scope: !664, inlinedAt: !669)
!672 = !DILocalVariable(name: "x", scope: !664, file: !665, line: 129, type: !62)
!673 = !DILocalVariable(name: "high_nibble_mask", scope: !664, file: !665, line: 131, type: !62)
!674 = !DILocation(line: 133, column: 28, scope: !664, inlinedAt: !669)
!675 = !DILocalVariable(name: "high_half", scope: !664, file: !665, line: 133, type: !62)
!676 = !DILocation(line: 134, column: 28, scope: !664, inlinedAt: !669)
!677 = !DILocation(line: 134, column: 47, scope: !664, inlinedAt: !669)
!678 = !DILocation(line: 134, column: 34, scope: !664, inlinedAt: !669)
!679 = !DILocalVariable(name: "tab", scope: !654, file: !655, line: 33, type: !62)
!680 = !DILocalVariable(name: "lsb_ask", scope: !654, file: !655, line: 35, type: !53)
!681 = !DILocalVariable(name: "i", scope: !682, file: !655, line: 37, type: !86)
!682 = distinct !DILexicalBlock(scope: !654, file: !655, line: 37, column: 5)
!683 = !DILocation(line: 0, scope: !682)
!684 = !DILocation(line: 37, column: 9, scope: !682)
!685 = !DILocation(line: 37, scope: !682)
!686 = !DILocation(line: 37, column: 20, scope: !687)
!687 = distinct !DILexicalBlock(scope: !682, file: !655, line: 37, column: 5)
!688 = !DILocation(line: 37, column: 5, scope: !682)
!689 = !DILocation(line: 38, column: 21, scope: !690)
!690 = distinct !DILexicalBlock(scope: !687, file: !655, line: 37, column: 43)
!691 = !DILocation(line: 38, column: 33, scope: !690)
!692 = !DILocation(line: 38, column: 51, scope: !690)
!693 = !DILocation(line: 38, column: 46, scope: !690)
!694 = !DILocation(line: 38, column: 44, scope: !690)
!695 = !DILocation(line: 39, column: 27, scope: !690)
!696 = !DILocation(line: 39, column: 33, scope: !690)
!697 = !DILocation(line: 39, column: 52, scope: !690)
!698 = !DILocation(line: 39, column: 59, scope: !690)
!699 = !DILocation(line: 39, column: 46, scope: !690)
!700 = !DILocation(line: 39, column: 44, scope: !690)
!701 = !DILocation(line: 39, column: 17, scope: !690)
!702 = !DILocation(line: 40, column: 21, scope: !690)
!703 = !DILocation(line: 40, column: 27, scope: !690)
!704 = !DILocation(line: 40, column: 33, scope: !690)
!705 = !DILocation(line: 40, column: 52, scope: !690)
!706 = !DILocation(line: 40, column: 59, scope: !690)
!707 = !DILocation(line: 40, column: 46, scope: !690)
!708 = !DILocation(line: 40, column: 44, scope: !690)
!709 = !DILocation(line: 40, column: 17, scope: !690)
!710 = !DILocation(line: 41, column: 21, scope: !690)
!711 = !DILocation(line: 41, column: 27, scope: !690)
!712 = !DILocation(line: 41, column: 33, scope: !690)
!713 = !DILocation(line: 41, column: 52, scope: !690)
!714 = !DILocation(line: 41, column: 59, scope: !690)
!715 = !DILocation(line: 41, column: 46, scope: !690)
!716 = !DILocation(line: 41, column: 44, scope: !690)
!717 = !DILocation(line: 41, column: 17, scope: !690)
!718 = !DILocation(line: 38, column: 9, scope: !690)
!719 = !DILocation(line: 38, column: 16, scope: !690)
!720 = !DILocation(line: 37, column: 40, scope: !687)
!721 = !DILocation(line: 37, column: 5, scope: !687)
!722 = distinct !{!722, !688, !723, !297}
!723 = !DILocation(line: 42, column: 5, scope: !682)
!724 = !DILocation(line: 43, column: 1, scope: !654)
!725 = distinct !DISubprogram(name: "pqmayo_MAYO_2_ref_mayo_expand_sk", scope: !68, file: !68, line: 310, type: !726, scopeLine: 311, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!726 = !DISubroutineType(types: !727)
!727 = !{!86, !193, !90, !728}
!728 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !729, size: 32)
!729 = !DIDerivedType(tag: DW_TAG_typedef, name: "sk_t", file: !79, line: 294, baseType: !730)
!730 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sk_t", file: !79, line: 291, size: 819712, elements: !731)
!731 = !{!732, !733}
!732 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !730, file: !79, line: 292, baseType: !169, size: 811008)
!733 = !DIDerivedType(tag: DW_TAG_member, name: "O", scope: !730, file: !79, line: 293, baseType: !173, size: 8704, offset: 811008)
!734 = !DILocalVariable(name: "p", arg: 1, scope: !725, file: !68, line: 310, type: !193)
!735 = !DILocation(line: 0, scope: !725)
!736 = !DILocalVariable(name: "csk", arg: 2, scope: !725, file: !68, line: 310, type: !90)
!737 = !DILocalVariable(name: "sk", arg: 3, scope: !725, file: !68, line: 311, type: !728)
!738 = !DILocalVariable(name: "ret", scope: !725, file: !68, line: 312, type: !86)
!739 = !DILocalVariable(name: "S", scope: !725, file: !68, line: 313, type: !398)
!740 = !DILocation(line: 313, column: 19, scope: !725)
!741 = !DILocalVariable(name: "P", scope: !725, file: !68, line: 314, type: !52)
!742 = !DILocation(line: 315, column: 28, scope: !725)
!743 = !DILocalVariable(name: "O", scope: !725, file: !68, line: 315, type: !61)
!744 = !DILocalVariable(name: "param_o", scope: !725, file: !68, line: 317, type: !275)
!745 = !DILocalVariable(name: "param_v", scope: !725, file: !68, line: 318, type: !275)
!746 = !DILocalVariable(name: "param_O_bytes", scope: !725, file: !68, line: 319, type: !275)
!747 = !DILocalVariable(name: "param_pk_seed_bytes", scope: !725, file: !68, line: 320, type: !275)
!748 = !DILocalVariable(name: "param_sk_seed_bytes", scope: !725, file: !68, line: 321, type: !275)
!749 = !DILocalVariable(name: "seed_sk", scope: !725, file: !68, line: 323, type: !90)
!750 = !DILocalVariable(name: "seed_pk", scope: !725, file: !68, line: 324, type: !61)
!751 = !DILocation(line: 326, column: 5, scope: !725)
!752 = !DILocation(line: 328, column: 14, scope: !725)
!753 = !DILocation(line: 0, scope: !431, inlinedAt: !754)
!754 = distinct !DILocation(line: 328, column: 5, scope: !725)
!755 = !DILocation(line: 22, column: 10, scope: !440, inlinedAt: !754)
!756 = !DILocation(line: 22, scope: !440, inlinedAt: !754)
!757 = !DILocation(line: 22, column: 19, scope: !443, inlinedAt: !754)
!758 = !DILocation(line: 22, column: 5, scope: !440, inlinedAt: !754)
!759 = !DILocation(line: 23, column: 19, scope: !446, inlinedAt: !754)
!760 = !DILocation(line: 23, column: 24, scope: !446, inlinedAt: !754)
!761 = !DILocation(line: 23, column: 14, scope: !446, inlinedAt: !754)
!762 = !DILocation(line: 23, column: 17, scope: !446, inlinedAt: !754)
!763 = !DILocation(line: 24, column: 24, scope: !446, inlinedAt: !754)
!764 = !DILocation(line: 24, column: 17, scope: !446, inlinedAt: !754)
!765 = !DILocation(line: 24, column: 14, scope: !446, inlinedAt: !754)
!766 = !DILocation(line: 22, column: 34, scope: !443, inlinedAt: !754)
!767 = !DILocation(line: 22, column: 5, scope: !443, inlinedAt: !754)
!768 = distinct !{!768, !758, !769, !297}
!769 = !DILocation(line: 25, column: 5, scope: !440, inlinedAt: !754)
!770 = !DILocation(line: 0, scope: !256, inlinedAt: !771)
!771 = distinct !DILocation(line: 334, column: 5, scope: !725)
!772 = !DILocation(line: 284, column: 5, scope: !256, inlinedAt: !771)
!773 = !DILocation(line: 265, column: 14, scope: !265, inlinedAt: !774)
!774 = distinct !DILocation(line: 285, column: 5, scope: !256, inlinedAt: !771)
!775 = !DILocation(line: 0, scope: !265, inlinedAt: !774)
!776 = !DILocation(line: 0, scope: !280, inlinedAt: !774)
!777 = !DILocation(line: 266, column: 10, scope: !280, inlinedAt: !774)
!778 = !DILocation(line: 266, column: 28, scope: !284, inlinedAt: !774)
!779 = !DILocation(line: 266, column: 5, scope: !280, inlinedAt: !774)
!780 = !DILocation(line: 266, scope: !280, inlinedAt: !774)
!781 = !DILocation(line: 268, column: 29, scope: !288, inlinedAt: !774)
!782 = !DILocation(line: 268, column: 24, scope: !288, inlinedAt: !774)
!783 = !DILocation(line: 268, column: 9, scope: !288, inlinedAt: !774)
!784 = !DILocation(line: 269, column: 24, scope: !288, inlinedAt: !774)
!785 = !DILocation(line: 269, column: 21, scope: !288, inlinedAt: !774)
!786 = !DILocation(line: 269, column: 9, scope: !288, inlinedAt: !774)
!787 = !DILocation(line: 266, column: 5, scope: !284, inlinedAt: !774)
!788 = distinct !{!788, !779, !789, !297}
!789 = !DILocation(line: 270, column: 5, scope: !280, inlinedAt: !774)
!790 = !DILocation(line: 271, column: 1, scope: !265, inlinedAt: !774)
!791 = !DILocation(line: 341, column: 22, scope: !725)
!792 = !DILocalVariable(name: "P2", scope: !725, file: !68, line: 341, type: !52)
!793 = !DILocalVariable(name: "P1", scope: !725, file: !68, line: 343, type: !52)
!794 = !DILocalVariable(name: "L", scope: !725, file: !68, line: 346, type: !52)
!795 = !DILocalVariable(name: "p", arg: 1, scope: !796, file: !480, line: 218, type: !193)
!796 = distinct !DISubprogram(name: "P1P1t_times_O", scope: !480, file: !480, line: 218, type: !495, scopeLine: 218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!797 = !DILocation(line: 0, scope: !796, inlinedAt: !798)
!798 = distinct !DILocation(line: 347, column: 5, scope: !725)
!799 = !DILocalVariable(name: "P1", arg: 2, scope: !796, file: !480, line: 218, type: !483)
!800 = !DILocalVariable(name: "O", arg: 3, scope: !796, file: !480, line: 218, type: !90)
!801 = !DILocalVariable(name: "acc", arg: 4, scope: !796, file: !480, line: 218, type: !52)
!802 = !DILocalVariable(name: "param_o", scope: !796, file: !480, line: 222, type: !275)
!803 = !DILocalVariable(name: "param_v", scope: !796, file: !480, line: 223, type: !275)
!804 = !DILocalVariable(name: "m_vec_limbs", scope: !796, file: !480, line: 224, type: !275)
!805 = !DILocalVariable(name: "bs_mat_entries_used", scope: !796, file: !480, line: 226, type: !86)
!806 = !DILocalVariable(name: "r", scope: !807, file: !480, line: 227, type: !86)
!807 = distinct !DILexicalBlock(scope: !796, file: !480, line: 227, column: 5)
!808 = !DILocation(line: 0, scope: !807, inlinedAt: !798)
!809 = !DILocation(line: 227, column: 10, scope: !807, inlinedAt: !798)
!810 = !DILocation(line: 226, column: 9, scope: !796, inlinedAt: !798)
!811 = !DILocation(line: 227, scope: !807, inlinedAt: !798)
!812 = !DILocation(line: 227, column: 23, scope: !813, inlinedAt: !798)
!813 = distinct !DILexicalBlock(scope: !807, file: !480, line: 227, column: 5)
!814 = !DILocation(line: 227, column: 5, scope: !807, inlinedAt: !798)
!815 = !DILocation(line: 228, column: 9, scope: !816, inlinedAt: !798)
!816 = distinct !DILexicalBlock(scope: !817, file: !480, line: 228, column: 9)
!817 = distinct !DILexicalBlock(scope: !813, file: !480, line: 227, column: 39)
!818 = !DILocation(line: 228, scope: !816, inlinedAt: !798)
!819 = !DILocalVariable(name: "c", scope: !816, file: !480, line: 228, type: !86)
!820 = !DILocation(line: 0, scope: !816, inlinedAt: !798)
!821 = !DILocation(line: 228, column: 27, scope: !822, inlinedAt: !798)
!822 = distinct !DILexicalBlock(scope: !816, file: !480, line: 228, column: 9)
!823 = !DILocation(line: 229, column: 17, scope: !824, inlinedAt: !798)
!824 = distinct !DILexicalBlock(scope: !825, file: !480, line: 229, column: 16)
!825 = distinct !DILexicalBlock(scope: !822, file: !480, line: 228, column: 43)
!826 = !DILocation(line: 233, column: 13, scope: !827, inlinedAt: !798)
!827 = distinct !DILexicalBlock(scope: !825, file: !480, line: 233, column: 13)
!828 = !DILocation(line: 233, scope: !827, inlinedAt: !798)
!829 = !DILocalVariable(name: "k", scope: !827, file: !480, line: 233, type: !86)
!830 = !DILocation(line: 0, scope: !827, inlinedAt: !798)
!831 = !DILocation(line: 233, column: 31, scope: !832, inlinedAt: !798)
!832 = distinct !DILexicalBlock(scope: !827, file: !480, line: 233, column: 13)
!833 = !DILocation(line: 234, column: 47, scope: !834, inlinedAt: !798)
!834 = distinct !DILexicalBlock(scope: !832, file: !480, line: 233, column: 50)
!835 = !DILocation(line: 234, column: 88, scope: !834, inlinedAt: !798)
!836 = !DILocation(line: 234, column: 84, scope: !834, inlinedAt: !798)
!837 = !DILocation(line: 234, column: 127, scope: !834, inlinedAt: !798)
!838 = !DILocation(line: 234, column: 137, scope: !834, inlinedAt: !798)
!839 = !DILocation(line: 234, column: 108, scope: !834, inlinedAt: !798)
!840 = !DILocation(line: 234, column: 17, scope: !834, inlinedAt: !798)
!841 = !DILocation(line: 235, column: 47, scope: !834, inlinedAt: !798)
!842 = !DILocation(line: 235, column: 88, scope: !834, inlinedAt: !798)
!843 = !DILocation(line: 235, column: 84, scope: !834, inlinedAt: !798)
!844 = !DILocation(line: 235, column: 127, scope: !834, inlinedAt: !798)
!845 = !DILocation(line: 235, column: 137, scope: !834, inlinedAt: !798)
!846 = !DILocation(line: 235, column: 108, scope: !834, inlinedAt: !798)
!847 = !DILocation(line: 235, column: 17, scope: !834, inlinedAt: !798)
!848 = !DILocation(line: 233, column: 44, scope: !832, inlinedAt: !798)
!849 = !DILocation(line: 233, column: 13, scope: !832, inlinedAt: !798)
!850 = distinct !{!850, !826, !851, !297}
!851 = !DILocation(line: 236, column: 13, scope: !827, inlinedAt: !798)
!852 = !DILocation(line: 0, scope: !825, inlinedAt: !798)
!853 = !DILocation(line: 228, column: 39, scope: !822, inlinedAt: !798)
!854 = !DILocation(line: 228, column: 9, scope: !822, inlinedAt: !798)
!855 = distinct !{!855, !815, !856, !297}
!856 = !DILocation(line: 238, column: 9, scope: !816, inlinedAt: !798)
!857 = !DILocation(line: 227, column: 35, scope: !813, inlinedAt: !798)
!858 = !DILocation(line: 227, column: 5, scope: !813, inlinedAt: !798)
!859 = distinct !{!859, !814, !860, !297}
!860 = !DILocation(line: 239, column: 5, scope: !807, inlinedAt: !798)
!861 = !DILocation(line: 355, column: 5, scope: !725)
!862 = !DILocation(line: 356, column: 5, scope: !725)
!863 = distinct !DISubprogram(name: "pqmayo_MAYO_2_ref_mayo_sign_signature", scope: !68, file: !68, line: 359, type: !335, scopeLine: 361, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!864 = !DILocalVariable(name: "p", arg: 1, scope: !863, file: !68, line: 359, type: !193)
!865 = !DILocation(line: 0, scope: !863)
!866 = !DILocalVariable(name: "sig", arg: 2, scope: !863, file: !68, line: 359, type: !61)
!867 = !DILocalVariable(name: "siglen", arg: 3, scope: !863, file: !68, line: 360, type: !337)
!868 = !DILocalVariable(name: "m", arg: 4, scope: !863, file: !68, line: 360, type: !90)
!869 = !DILocalVariable(name: "mlen", arg: 5, scope: !863, file: !68, line: 361, type: !58)
!870 = !DILocalVariable(name: "csk", arg: 6, scope: !863, file: !68, line: 361, type: !90)
!871 = !DILocalVariable(name: "ret", scope: !863, file: !68, line: 362, type: !86)
!872 = !DILocalVariable(name: "tenc", scope: !863, file: !68, line: 363, type: !181)
!873 = !DILocation(line: 363, column: 19, scope: !863)
!874 = !DILocalVariable(name: "t", scope: !863, file: !68, line: 363, type: !875)
!875 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 512, elements: !876)
!876 = !{!877}
!877 = !DISubrange(count: 64)
!878 = !DILocation(line: 363, column: 38, scope: !863)
!879 = !DILocalVariable(name: "y", scope: !863, file: !68, line: 364, type: !875)
!880 = !DILocation(line: 364, column: 19, scope: !863)
!881 = !DILocalVariable(name: "salt", scope: !863, file: !68, line: 365, type: !882)
!882 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 192, elements: !883)
!883 = !{!884}
!884 = !DISubrange(count: 24)
!885 = !DILocation(line: 365, column: 19, scope: !863)
!886 = !DILocalVariable(name: "V", scope: !863, file: !68, line: 366, type: !887)
!887 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 1296, elements: !888)
!888 = !{!889}
!889 = !DISubrange(count: 162)
!890 = !DILocation(line: 366, column: 19, scope: !863)
!891 = !DILocalVariable(name: "Vdec", scope: !863, file: !68, line: 366, type: !892)
!892 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 2048, elements: !893)
!893 = !{!894}
!894 = !DISubrange(count: 256)
!895 = !DILocation(line: 366, column: 57, scope: !863)
!896 = !DILocalVariable(name: "A", scope: !863, file: !68, line: 367, type: !897)
!897 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 35328, elements: !898)
!898 = !{!899}
!899 = !DISubrange(count: 4416)
!900 = !DILocation(line: 367, column: 19, scope: !863)
!901 = !DILocalVariable(name: "x", scope: !863, file: !68, line: 368, type: !902)
!902 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 2592, elements: !903)
!903 = !{!904}
!904 = !DISubrange(count: 324)
!905 = !DILocation(line: 368, column: 19, scope: !863)
!906 = !DILocalVariable(name: "r", scope: !863, file: !68, line: 369, type: !907)
!907 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 552, elements: !908)
!908 = !{!909}
!909 = !DISubrange(count: 69)
!910 = !DILocation(line: 369, column: 19, scope: !863)
!911 = !DILocalVariable(name: "s", scope: !863, file: !68, line: 370, type: !902)
!912 = !DILocation(line: 370, column: 19, scope: !863)
!913 = !DILocalVariable(name: "sk", scope: !863, file: !68, line: 372, type: !729, align: 256)
!914 = !DILocation(line: 372, column: 22, scope: !863)
!915 = !DILocalVariable(name: "Ox", scope: !863, file: !68, line: 373, type: !875)
!916 = !DILocation(line: 373, column: 19, scope: !863)
!917 = !DILocalVariable(name: "tmp", scope: !863, file: !68, line: 374, type: !918)
!918 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 648, elements: !919)
!919 = !{!920}
!920 = !DISubrange(count: 81)
!921 = !DILocation(line: 374, column: 19, scope: !863)
!922 = !DILocalVariable(name: "param_m", scope: !863, file: !68, line: 378, type: !275)
!923 = !DILocalVariable(name: "param_n", scope: !863, file: !68, line: 379, type: !275)
!924 = !DILocalVariable(name: "param_o", scope: !863, file: !68, line: 380, type: !275)
!925 = !DILocalVariable(name: "param_k", scope: !863, file: !68, line: 381, type: !275)
!926 = !DILocalVariable(name: "param_v", scope: !863, file: !68, line: 382, type: !275)
!927 = !DILocalVariable(name: "param_m_bytes", scope: !863, file: !68, line: 383, type: !275)
!928 = !DILocalVariable(name: "param_v_bytes", scope: !863, file: !68, line: 384, type: !275)
!929 = !DILocalVariable(name: "param_r_bytes", scope: !863, file: !68, line: 385, type: !275)
!930 = !DILocalVariable(name: "param_sig_bytes", scope: !863, file: !68, line: 386, type: !275)
!931 = !DILocalVariable(name: "param_A_cols", scope: !863, file: !68, line: 387, type: !275)
!932 = !DILocalVariable(name: "param_digest_bytes", scope: !863, file: !68, line: 388, type: !275)
!933 = !DILocalVariable(name: "param_sk_seed_bytes", scope: !863, file: !68, line: 389, type: !275)
!934 = !DILocalVariable(name: "param_salt_bytes", scope: !863, file: !68, line: 390, type: !275)
!935 = !DILocation(line: 392, column: 11, scope: !863)
!936 = !DILocation(line: 393, column: 13, scope: !937)
!937 = distinct !DILexicalBlock(scope: !863, file: !68, line: 393, column: 9)
!938 = !DILocalVariable(name: "seed_sk", scope: !863, file: !68, line: 371, type: !90)
!939 = !DILocation(line: 401, column: 5, scope: !863)
!940 = !DILocalVariable(name: "P1", scope: !863, file: !68, line: 403, type: !52)
!941 = !DILocation(line: 404, column: 23, scope: !863)
!942 = !DILocalVariable(name: "L", scope: !863, file: !68, line: 404, type: !52)
!943 = !DILocalVariable(name: "Mtmp", scope: !863, file: !68, line: 405, type: !944)
!944 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 17408, elements: !945)
!945 = !{!946}
!946 = !DISubrange(count: 272)
!947 = !DILocation(line: 405, column: 14, scope: !863)
!948 = !DILocation(line: 420, column: 25, scope: !949)
!949 = distinct !DILexicalBlock(scope: !863, file: !68, line: 420, column: 9)
!950 = !DILocation(line: 420, column: 9, scope: !949)
!951 = !DILocation(line: 420, column: 65, scope: !949)
!952 = !DILocation(line: 427, column: 37, scope: !863)
!953 = !DILocation(line: 427, column: 5, scope: !863)
!954 = !DILocation(line: 429, column: 5, scope: !863)
!955 = !DILocation(line: 437, column: 16, scope: !863)
!956 = !DILocation(line: 437, column: 5, scope: !863)
!957 = !DILocalVariable(name: "ctrbyte", scope: !863, file: !68, line: 375, type: !61)
!958 = !DILocation(line: 440, column: 5, scope: !863)
!959 = !DILocation(line: 0, scope: !431, inlinedAt: !960)
!960 = distinct !DILocation(line: 442, column: 5, scope: !863)
!961 = !DILocation(line: 22, column: 10, scope: !440, inlinedAt: !960)
!962 = !DILocation(line: 22, scope: !440, inlinedAt: !960)
!963 = !DILocation(line: 22, column: 19, scope: !443, inlinedAt: !960)
!964 = !DILocation(line: 22, column: 5, scope: !440, inlinedAt: !960)
!965 = !DILocation(line: 438, column: 59, scope: !863)
!966 = !DILocation(line: 444, column: 5, scope: !967)
!967 = distinct !DILexicalBlock(scope: !863, file: !68, line: 444, column: 5)
!968 = !DILocation(line: 23, column: 19, scope: !446, inlinedAt: !960)
!969 = !DILocation(line: 23, column: 24, scope: !446, inlinedAt: !960)
!970 = !DILocation(line: 23, column: 14, scope: !446, inlinedAt: !960)
!971 = !DILocation(line: 23, column: 17, scope: !446, inlinedAt: !960)
!972 = !DILocation(line: 24, column: 24, scope: !446, inlinedAt: !960)
!973 = !DILocation(line: 24, column: 17, scope: !446, inlinedAt: !960)
!974 = !DILocation(line: 24, column: 14, scope: !446, inlinedAt: !960)
!975 = !DILocation(line: 22, column: 34, scope: !443, inlinedAt: !960)
!976 = !DILocation(line: 22, column: 5, scope: !443, inlinedAt: !960)
!977 = distinct !{!977, !964, !978, !297}
!978 = !DILocation(line: 25, column: 5, scope: !440, inlinedAt: !960)
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
!1001 = !DILocation(line: 0, scope: !431, inlinedAt: !1002)
!1002 = distinct !DILocation(line: 452, column: 13, scope: !997)
!1003 = !DILocation(line: 22, column: 10, scope: !440, inlinedAt: !1002)
!1004 = !DILocation(line: 22, scope: !440, inlinedAt: !1002)
!1005 = !DILocation(line: 22, column: 19, scope: !443, inlinedAt: !1002)
!1006 = !DILocation(line: 22, column: 5, scope: !440, inlinedAt: !1002)
!1007 = !DILocation(line: 23, column: 19, scope: !446, inlinedAt: !1002)
!1008 = !DILocation(line: 23, column: 24, scope: !446, inlinedAt: !1002)
!1009 = !DILocation(line: 23, column: 14, scope: !446, inlinedAt: !1002)
!1010 = !DILocation(line: 23, column: 17, scope: !446, inlinedAt: !1002)
!1011 = !DILocation(line: 24, column: 24, scope: !446, inlinedAt: !1002)
!1012 = !DILocation(line: 24, column: 17, scope: !446, inlinedAt: !1002)
!1013 = !DILocation(line: 24, column: 14, scope: !446, inlinedAt: !1002)
!1014 = !DILocation(line: 22, column: 34, scope: !443, inlinedAt: !1002)
!1015 = !DILocation(line: 22, column: 5, scope: !443, inlinedAt: !1002)
!1016 = distinct !{!1016, !1006, !1017, !297}
!1017 = !DILocation(line: 25, column: 5, scope: !440, inlinedAt: !1002)
!1018 = !DILocation(line: 451, column: 43, scope: !994)
!1019 = !DILocation(line: 451, column: 9, scope: !994)
!1020 = distinct !{!1020, !995, !1021, !297}
!1021 = !DILocation(line: 453, column: 9, scope: !989)
!1022 = !DILocation(line: 251, column: 5, scope: !1023, inlinedAt: !1026)
!1023 = distinct !DISubprogram(name: "compute_M_and_VPV", scope: !480, file: !480, line: 244, type: !1024, scopeLine: 244, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1024 = !DISubroutineType(types: !1025)
!1025 = !{null, !193, !90, !483, !483, !52, !52}
!1026 = distinct !DILocation(line: 456, column: 9, scope: !985)
!1027 = !DILocalVariable(name: "p", arg: 1, scope: !1023, file: !480, line: 244, type: !193)
!1028 = !DILocation(line: 0, scope: !1023, inlinedAt: !1026)
!1029 = !DILocalVariable(name: "Vdec", arg: 2, scope: !1023, file: !480, line: 244, type: !90)
!1030 = !DILocalVariable(name: "L", arg: 3, scope: !1023, file: !480, line: 244, type: !483)
!1031 = !DILocalVariable(name: "P1", arg: 4, scope: !1023, file: !480, line: 244, type: !483)
!1032 = !DILocalVariable(name: "VL", arg: 5, scope: !1023, file: !480, line: 244, type: !52)
!1033 = !DILocalVariable(name: "VP1V", arg: 6, scope: !1023, file: !480, line: 244, type: !52)
!1034 = !DILocalVariable(name: "param_k", scope: !1023, file: !480, line: 246, type: !275)
!1035 = !DILocalVariable(name: "param_v", scope: !1023, file: !480, line: 247, type: !275)
!1036 = !DILocalVariable(name: "param_o", scope: !1023, file: !480, line: 248, type: !275)
!1037 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !1038, file: !480, line: 61, type: !275)
!1038 = distinct !DISubprogram(name: "mul_add_mat_x_m_mat", scope: !480, file: !480, line: 61, type: !531, scopeLine: 62, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1039 = !DILocation(line: 0, scope: !1038, inlinedAt: !1040)
!1040 = distinct !DILocation(line: 251, column: 5, scope: !1023, inlinedAt: !1026)
!1041 = !DILocalVariable(name: "mat", arg: 2, scope: !1038, file: !480, line: 61, type: !90)
!1042 = !DILocalVariable(name: "bs_mat", arg: 3, scope: !1038, file: !480, line: 61, type: !483)
!1043 = !DILocalVariable(name: "acc", arg: 4, scope: !1038, file: !480, line: 61, type: !52)
!1044 = !DILocalVariable(name: "mat_rows", arg: 5, scope: !1038, file: !480, line: 62, type: !275)
!1045 = !DILocalVariable(name: "mat_cols", arg: 6, scope: !1038, file: !480, line: 62, type: !275)
!1046 = !DILocalVariable(name: "bs_mat_cols", arg: 7, scope: !1038, file: !480, line: 62, type: !275)
!1047 = !DILocalVariable(name: "r", scope: !1048, file: !480, line: 64, type: !86)
!1048 = distinct !DILexicalBlock(scope: !1038, file: !480, line: 64, column: 5)
!1049 = !DILocation(line: 0, scope: !1048, inlinedAt: !1040)
!1050 = !DILocation(line: 64, column: 10, scope: !1048, inlinedAt: !1040)
!1051 = !DILocation(line: 64, scope: !1048, inlinedAt: !1040)
!1052 = !DILocation(line: 64, column: 23, scope: !1053, inlinedAt: !1040)
!1053 = distinct !DILexicalBlock(scope: !1048, file: !480, line: 64, column: 5)
!1054 = !DILocation(line: 64, column: 5, scope: !1048, inlinedAt: !1040)
!1055 = !DILocation(line: 65, column: 9, scope: !1056, inlinedAt: !1040)
!1056 = distinct !DILexicalBlock(scope: !1057, file: !480, line: 65, column: 9)
!1057 = distinct !DILexicalBlock(scope: !1053, file: !480, line: 64, column: 40)
!1058 = !DILocation(line: 65, scope: !1056, inlinedAt: !1040)
!1059 = !DILocalVariable(name: "c", scope: !1056, file: !480, line: 65, type: !86)
!1060 = !DILocation(line: 0, scope: !1056, inlinedAt: !1040)
!1061 = !DILocation(line: 65, column: 27, scope: !1062, inlinedAt: !1040)
!1062 = distinct !DILexicalBlock(scope: !1056, file: !480, line: 65, column: 9)
!1063 = !DILocation(line: 66, column: 13, scope: !1064, inlinedAt: !1040)
!1064 = distinct !DILexicalBlock(scope: !1065, file: !480, line: 66, column: 13)
!1065 = distinct !DILexicalBlock(scope: !1062, file: !480, line: 65, column: 44)
!1066 = !DILocation(line: 66, scope: !1064, inlinedAt: !1040)
!1067 = !DILocalVariable(name: "k", scope: !1064, file: !480, line: 66, type: !86)
!1068 = !DILocation(line: 0, scope: !1064, inlinedAt: !1040)
!1069 = !DILocation(line: 66, column: 31, scope: !1070, inlinedAt: !1040)
!1070 = distinct !DILexicalBlock(scope: !1064, file: !480, line: 66, column: 13)
!1071 = !DILocation(line: 67, column: 70, scope: !1072, inlinedAt: !1040)
!1072 = distinct !DILexicalBlock(scope: !1070, file: !480, line: 66, column: 54)
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
!1083 = distinct !{!1083, !1063, !1084, !297}
!1084 = !DILocation(line: 68, column: 13, scope: !1064, inlinedAt: !1040)
!1085 = !DILocation(line: 65, column: 40, scope: !1062, inlinedAt: !1040)
!1086 = !DILocation(line: 65, column: 9, scope: !1062, inlinedAt: !1040)
!1087 = distinct !{!1087, !1055, !1088, !297}
!1088 = !DILocation(line: 69, column: 9, scope: !1056, inlinedAt: !1040)
!1089 = !DILocation(line: 64, column: 36, scope: !1053, inlinedAt: !1040)
!1090 = !DILocation(line: 64, column: 5, scope: !1053, inlinedAt: !1040)
!1091 = distinct !{!1091, !1054, !1092, !297}
!1092 = !DILocation(line: 70, column: 5, scope: !1048, inlinedAt: !1040)
!1093 = !DILocalVariable(name: "Pv", scope: !1023, file: !480, line: 254, type: !1094)
!1094 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 65536, elements: !1095)
!1095 = !{!1096}
!1096 = !DISubrange(count: 1024)
!1097 = !DILocation(line: 254, column: 14, scope: !1023, inlinedAt: !1026)
!1098 = !DILocalVariable(name: "p", arg: 1, scope: !1099, file: !480, line: 82, type: !193)
!1099 = distinct !DISubprogram(name: "P1_times_Vt", scope: !480, file: !480, line: 82, type: !495, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1100 = !DILocation(line: 0, scope: !1099, inlinedAt: !1101)
!1101 = distinct !DILocation(line: 255, column: 5, scope: !1023, inlinedAt: !1026)
!1102 = !DILocalVariable(name: "P1", arg: 2, scope: !1099, file: !480, line: 82, type: !483)
!1103 = !DILocalVariable(name: "V", arg: 3, scope: !1099, file: !480, line: 82, type: !90)
!1104 = !DILocalVariable(name: "acc", arg: 4, scope: !1099, file: !480, line: 82, type: !52)
!1105 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !1106, file: !480, line: 32, type: !275)
!1106 = distinct !DISubprogram(name: "mul_add_m_upper_triangular_mat_x_mat_trans", scope: !480, file: !480, line: 32, type: !504, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1107 = !DILocation(line: 0, scope: !1106, inlinedAt: !1108)
!1108 = distinct !DILocation(line: 86, column: 5, scope: !1099, inlinedAt: !1101)
!1109 = !DILocalVariable(name: "bs_mat", arg: 2, scope: !1106, file: !480, line: 32, type: !483)
!1110 = !DILocalVariable(name: "mat", arg: 3, scope: !1106, file: !480, line: 32, type: !90)
!1111 = !DILocalVariable(name: "acc", arg: 4, scope: !1106, file: !480, line: 32, type: !52)
!1112 = !DILocalVariable(name: "bs_mat_rows", arg: 5, scope: !1106, file: !480, line: 33, type: !275)
!1113 = !DILocalVariable(name: "bs_mat_cols", arg: 6, scope: !1106, file: !480, line: 33, type: !275)
!1114 = !DILocalVariable(name: "mat_rows", arg: 7, scope: !1106, file: !480, line: 33, type: !275)
!1115 = !DILocalVariable(name: "triangular", arg: 8, scope: !1106, file: !480, line: 33, type: !275)
!1116 = !DILocalVariable(name: "bs_mat_entries_used", scope: !1106, file: !480, line: 34, type: !86)
!1117 = !DILocalVariable(name: "r", scope: !1118, file: !480, line: 35, type: !86)
!1118 = distinct !DILexicalBlock(scope: !1106, file: !480, line: 35, column: 5)
!1119 = !DILocation(line: 0, scope: !1118, inlinedAt: !1108)
!1120 = !DILocation(line: 35, column: 10, scope: !1118, inlinedAt: !1108)
!1121 = !DILocation(line: 34, column: 9, scope: !1106, inlinedAt: !1108)
!1122 = !DILocation(line: 35, scope: !1118, inlinedAt: !1108)
!1123 = !DILocation(line: 35, column: 23, scope: !1124, inlinedAt: !1108)
!1124 = distinct !DILexicalBlock(scope: !1118, file: !480, line: 35, column: 5)
!1125 = !DILocation(line: 35, column: 5, scope: !1118, inlinedAt: !1108)
!1126 = !DILocation(line: 64, column: 5, scope: !1048, inlinedAt: !1127)
!1127 = distinct !DILocation(line: 256, column: 5, scope: !1023, inlinedAt: !1026)
!1128 = !DILocation(line: 36, column: 9, scope: !1129, inlinedAt: !1108)
!1129 = distinct !DILexicalBlock(scope: !1130, file: !480, line: 36, column: 9)
!1130 = distinct !DILexicalBlock(scope: !1124, file: !480, line: 35, column: 43)
!1131 = !DILocation(line: 36, scope: !1129, inlinedAt: !1108)
!1132 = !DILocalVariable(name: "c", scope: !1129, file: !480, line: 36, type: !86)
!1133 = !DILocation(line: 0, scope: !1129, inlinedAt: !1108)
!1134 = !DILocation(line: 36, column: 40, scope: !1135, inlinedAt: !1108)
!1135 = distinct !DILexicalBlock(scope: !1129, file: !480, line: 36, column: 9)
!1136 = !DILocation(line: 37, column: 13, scope: !1137, inlinedAt: !1108)
!1137 = distinct !DILexicalBlock(scope: !1138, file: !480, line: 37, column: 13)
!1138 = distinct !DILexicalBlock(scope: !1135, file: !480, line: 36, column: 60)
!1139 = !DILocation(line: 37, scope: !1137, inlinedAt: !1108)
!1140 = !DILocalVariable(name: "k", scope: !1137, file: !480, line: 37, type: !86)
!1141 = !DILocation(line: 0, scope: !1137, inlinedAt: !1108)
!1142 = !DILocation(line: 37, column: 31, scope: !1143, inlinedAt: !1108)
!1143 = distinct !DILexicalBlock(scope: !1137, file: !480, line: 37, column: 13)
!1144 = !DILocation(line: 38, column: 51, scope: !1145, inlinedAt: !1108)
!1145 = distinct !DILexicalBlock(scope: !1143, file: !480, line: 37, column: 51)
!1146 = !DILocation(line: 38, column: 94, scope: !1145, inlinedAt: !1108)
!1147 = !DILocation(line: 38, column: 88, scope: !1145, inlinedAt: !1108)
!1148 = !DILocation(line: 38, column: 132, scope: !1145, inlinedAt: !1108)
!1149 = !DILocation(line: 38, column: 118, scope: !1145, inlinedAt: !1108)
!1150 = !DILocation(line: 38, column: 17, scope: !1145, inlinedAt: !1108)
!1151 = !DILocation(line: 37, column: 45, scope: !1143, inlinedAt: !1108)
!1152 = !DILocation(line: 37, column: 13, scope: !1143, inlinedAt: !1108)
!1153 = distinct !{!1153, !1136, !1154, !297}
!1154 = !DILocation(line: 39, column: 13, scope: !1137, inlinedAt: !1108)
!1155 = !DILocation(line: 40, column: 33, scope: !1138, inlinedAt: !1108)
!1156 = !DILocation(line: 36, column: 56, scope: !1135, inlinedAt: !1108)
!1157 = !DILocation(line: 36, column: 9, scope: !1135, inlinedAt: !1108)
!1158 = distinct !{!1158, !1128, !1159, !297}
!1159 = !DILocation(line: 41, column: 9, scope: !1129, inlinedAt: !1108)
!1160 = !DILocation(line: 35, column: 39, scope: !1124, inlinedAt: !1108)
!1161 = !DILocation(line: 35, column: 5, scope: !1124, inlinedAt: !1108)
!1162 = distinct !{!1162, !1125, !1163, !297}
!1163 = !DILocation(line: 42, column: 5, scope: !1118, inlinedAt: !1108)
!1164 = !DILocation(line: 64, scope: !1048, inlinedAt: !1127)
!1165 = !DILocation(line: 0, scope: !1048, inlinedAt: !1127)
!1166 = !DILocation(line: 64, column: 23, scope: !1053, inlinedAt: !1127)
!1167 = !DILocation(line: 65, column: 9, scope: !1056, inlinedAt: !1127)
!1168 = !DILocation(line: 65, scope: !1056, inlinedAt: !1127)
!1169 = !DILocation(line: 0, scope: !1056, inlinedAt: !1127)
!1170 = !DILocation(line: 65, column: 27, scope: !1062, inlinedAt: !1127)
!1171 = !DILocation(line: 66, column: 13, scope: !1064, inlinedAt: !1127)
!1172 = !DILocation(line: 66, scope: !1064, inlinedAt: !1127)
!1173 = !DILocation(line: 0, scope: !1064, inlinedAt: !1127)
!1174 = !DILocation(line: 66, column: 31, scope: !1070, inlinedAt: !1127)
!1175 = !DILocation(line: 67, column: 65, scope: !1072, inlinedAt: !1127)
!1176 = !DILocation(line: 67, column: 51, scope: !1072, inlinedAt: !1127)
!1177 = !DILocation(line: 67, column: 96, scope: !1072, inlinedAt: !1127)
!1178 = !DILocation(line: 67, column: 90, scope: !1072, inlinedAt: !1127)
!1179 = !DILocation(line: 67, column: 131, scope: !1072, inlinedAt: !1127)
!1180 = !DILocation(line: 67, column: 117, scope: !1072, inlinedAt: !1127)
!1181 = !DILocation(line: 67, column: 17, scope: !1072, inlinedAt: !1127)
!1182 = !DILocation(line: 66, column: 48, scope: !1070, inlinedAt: !1127)
!1183 = !DILocation(line: 66, column: 13, scope: !1070, inlinedAt: !1127)
!1184 = distinct !{!1184, !1171, !1185, !297}
!1185 = !DILocation(line: 68, column: 13, scope: !1064, inlinedAt: !1127)
!1186 = !DILocation(line: 65, column: 40, scope: !1062, inlinedAt: !1127)
!1187 = !DILocation(line: 65, column: 9, scope: !1062, inlinedAt: !1127)
!1188 = distinct !{!1188, !1167, !1189, !297}
!1189 = !DILocation(line: 69, column: 9, scope: !1056, inlinedAt: !1127)
!1190 = !DILocation(line: 64, column: 36, scope: !1053, inlinedAt: !1127)
!1191 = !DILocation(line: 64, column: 5, scope: !1053, inlinedAt: !1127)
!1192 = distinct !{!1192, !1126, !1193, !297}
!1193 = !DILocation(line: 70, column: 5, scope: !1048, inlinedAt: !1127)
!1194 = !DILocation(line: 257, column: 1, scope: !1023, inlinedAt: !1026)
!1195 = !DILocation(line: 458, column: 9, scope: !985)
!1196 = !DILocation(line: 162, column: 14, scope: !1197, inlinedAt: !1200)
!1197 = distinct !DISubprogram(name: "compute_A", scope: !68, file: !68, line: 154, type: !1198, scopeLine: 154, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1198 = !DISubroutineType(types: !1199)
!1199 = !{null, !193, !52, !61}
!1200 = distinct !DILocation(line: 459, column: 9, scope: !985)
!1201 = !DILocalVariable(name: "p", arg: 1, scope: !1197, file: !68, line: 154, type: !193)
!1202 = !DILocation(line: 0, scope: !1197, inlinedAt: !1200)
!1203 = !DILocalVariable(name: "VtL", arg: 2, scope: !1197, file: !68, line: 154, type: !52)
!1204 = !DILocalVariable(name: "A_out", arg: 3, scope: !1197, file: !68, line: 154, type: !61)
!1205 = !DILocalVariable(name: "bits_to_shift", scope: !1197, file: !68, line: 159, type: !86)
!1206 = !DILocalVariable(name: "words_to_shift", scope: !1197, file: !68, line: 160, type: !86)
!1207 = !DILocalVariable(name: "m_vec_limbs", scope: !1197, file: !68, line: 161, type: !275)
!1208 = !DILocalVariable(name: "A", scope: !1197, file: !68, line: 162, type: !1209)
!1209 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 40960, elements: !1210)
!1210 = !{!1211}
!1211 = !DISubrange(count: 640)
!1212 = !DILocalVariable(name: "A_width", scope: !1197, file: !68, line: 163, type: !58)
!1213 = !DILocalVariable(name: "i", scope: !1214, file: !68, line: 177, type: !86)
!1214 = distinct !DILexicalBlock(scope: !1197, file: !68, line: 177, column: 5)
!1215 = !DILocation(line: 0, scope: !1214, inlinedAt: !1200)
!1216 = !DILocation(line: 177, column: 10, scope: !1214, inlinedAt: !1200)
!1217 = !DILocation(line: 177, scope: !1214, inlinedAt: !1200)
!1218 = !DILocation(line: 160, column: 9, scope: !1197, inlinedAt: !1200)
!1219 = !DILocation(line: 159, column: 9, scope: !1197, inlinedAt: !1200)
!1220 = !DILocation(line: 177, column: 23, scope: !1221, inlinedAt: !1200)
!1221 = distinct !DILexicalBlock(scope: !1214, file: !68, line: 177, column: 5)
!1222 = !DILocation(line: 177, column: 5, scope: !1214, inlinedAt: !1200)
!1223 = !DILocation(line: 212, column: 5, scope: !1224, inlinedAt: !1200)
!1224 = distinct !DILexicalBlock(scope: !1197, file: !68, line: 212, column: 5)
!1225 = !DILocation(line: 178, column: 9, scope: !1226, inlinedAt: !1200)
!1226 = distinct !DILexicalBlock(scope: !1227, file: !68, line: 178, column: 9)
!1227 = distinct !DILexicalBlock(scope: !1221, file: !68, line: 177, column: 47)
!1228 = !DILocation(line: 178, scope: !1226, inlinedAt: !1200)
!1229 = !DILocalVariable(name: "j", scope: !1226, file: !68, line: 178, type: !86)
!1230 = !DILocation(line: 0, scope: !1226, inlinedAt: !1200)
!1231 = !DILocation(line: 178, column: 40, scope: !1232, inlinedAt: !1200)
!1232 = distinct !DILexicalBlock(scope: !1226, file: !68, line: 178, column: 9)
!1233 = !DILocation(line: 180, column: 22, scope: !1234, inlinedAt: !1200)
!1234 = distinct !DILexicalBlock(scope: !1232, file: !68, line: 178, column: 51)
!1235 = !DILocalVariable(name: "Mj", scope: !1197, file: !68, line: 164, type: !483)
!1236 = !DILocalVariable(name: "c", scope: !1237, file: !68, line: 181, type: !86)
!1237 = distinct !DILexicalBlock(scope: !1234, file: !68, line: 181, column: 13)
!1238 = !DILocation(line: 0, scope: !1237, inlinedAt: !1200)
!1239 = !DILocation(line: 181, column: 18, scope: !1237, inlinedAt: !1200)
!1240 = !DILocation(line: 181, scope: !1237, inlinedAt: !1200)
!1241 = !DILocation(line: 181, column: 31, scope: !1242, inlinedAt: !1200)
!1242 = distinct !DILexicalBlock(scope: !1237, file: !68, line: 181, column: 13)
!1243 = !DILocation(line: 181, column: 13, scope: !1237, inlinedAt: !1200)
!1244 = !DILocation(line: 182, column: 17, scope: !1245, inlinedAt: !1200)
!1245 = distinct !DILexicalBlock(scope: !1246, file: !68, line: 182, column: 17)
!1246 = distinct !DILexicalBlock(scope: !1242, file: !68, line: 181, column: 50)
!1247 = !DILocation(line: 182, scope: !1245, inlinedAt: !1200)
!1248 = !DILocalVariable(name: "k", scope: !1245, file: !68, line: 182, type: !86)
!1249 = !DILocation(line: 0, scope: !1245, inlinedAt: !1200)
!1250 = !DILocation(line: 182, column: 35, scope: !1251, inlinedAt: !1200)
!1251 = distinct !DILexicalBlock(scope: !1245, file: !68, line: 182, column: 17)
!1252 = !DILocation(line: 184, column: 86, scope: !1253, inlinedAt: !1200)
!1253 = distinct !DILexicalBlock(scope: !1251, file: !68, line: 183, column: 17)
!1254 = !DILocation(line: 184, column: 83, scope: !1253, inlinedAt: !1200)
!1255 = !DILocation(line: 184, column: 78, scope: !1253, inlinedAt: !1200)
!1256 = !DILocation(line: 184, column: 100, scope: !1253, inlinedAt: !1200)
!1257 = !DILocation(line: 184, column: 35, scope: !1253, inlinedAt: !1200)
!1258 = !DILocation(line: 184, column: 39, scope: !1253, inlinedAt: !1200)
!1259 = !DILocation(line: 184, column: 48, scope: !1253, inlinedAt: !1200)
!1260 = !DILocation(line: 184, column: 65, scope: !1253, inlinedAt: !1200)
!1261 = !DILocation(line: 184, column: 43, scope: !1253, inlinedAt: !1200)
!1262 = !DILocation(line: 184, column: 21, scope: !1253, inlinedAt: !1200)
!1263 = !DILocation(line: 184, column: 75, scope: !1253, inlinedAt: !1200)
!1264 = !DILocation(line: 185, column: 38, scope: !1265, inlinedAt: !1200)
!1265 = distinct !DILexicalBlock(scope: !1253, file: !68, line: 185, column: 24)
!1266 = !DILocation(line: 186, column: 94, scope: !1267, inlinedAt: !1200)
!1267 = distinct !DILexicalBlock(scope: !1265, file: !68, line: 185, column: 42)
!1268 = !DILocation(line: 186, column: 91, scope: !1267, inlinedAt: !1200)
!1269 = !DILocation(line: 186, column: 86, scope: !1267, inlinedAt: !1200)
!1270 = !DILocation(line: 186, column: 114, scope: !1267, inlinedAt: !1200)
!1271 = !DILocation(line: 186, column: 108, scope: !1267, inlinedAt: !1200)
!1272 = !DILocation(line: 186, column: 39, scope: !1267, inlinedAt: !1200)
!1273 = !DILocation(line: 186, column: 43, scope: !1267, inlinedAt: !1200)
!1274 = !DILocation(line: 186, column: 52, scope: !1267, inlinedAt: !1200)
!1275 = !DILocation(line: 186, column: 73, scope: !1267, inlinedAt: !1200)
!1276 = !DILocation(line: 186, column: 47, scope: !1267, inlinedAt: !1200)
!1277 = !DILocation(line: 186, column: 25, scope: !1267, inlinedAt: !1200)
!1278 = !DILocation(line: 186, column: 83, scope: !1267, inlinedAt: !1200)
!1279 = !DILocation(line: 187, column: 21, scope: !1267, inlinedAt: !1200)
!1280 = !DILocation(line: 182, column: 51, scope: !1251, inlinedAt: !1200)
!1281 = !DILocation(line: 182, column: 17, scope: !1251, inlinedAt: !1200)
!1282 = distinct !{!1282, !1244, !1283, !297}
!1283 = !DILocation(line: 188, column: 17, scope: !1245, inlinedAt: !1200)
!1284 = !DILocation(line: 181, column: 46, scope: !1242, inlinedAt: !1200)
!1285 = !DILocation(line: 181, column: 13, scope: !1242, inlinedAt: !1200)
!1286 = distinct !{!1286, !1243, !1287, !297}
!1287 = !DILocation(line: 189, column: 13, scope: !1237, inlinedAt: !1200)
!1288 = !DILocation(line: 191, column: 19, scope: !1289, inlinedAt: !1200)
!1289 = distinct !DILexicalBlock(scope: !1234, file: !68, line: 191, column: 17)
!1290 = !DILocation(line: 192, column: 26, scope: !1291, inlinedAt: !1200)
!1291 = distinct !DILexicalBlock(scope: !1289, file: !68, line: 191, column: 25)
!1292 = !DILocalVariable(name: "Mi", scope: !1197, file: !68, line: 164, type: !483)
!1293 = !DILocalVariable(name: "c", scope: !1294, file: !68, line: 193, type: !86)
!1294 = distinct !DILexicalBlock(scope: !1291, file: !68, line: 193, column: 17)
!1295 = !DILocation(line: 0, scope: !1294, inlinedAt: !1200)
!1296 = !DILocation(line: 193, column: 22, scope: !1294, inlinedAt: !1200)
!1297 = !DILocation(line: 193, scope: !1294, inlinedAt: !1200)
!1298 = !DILocation(line: 193, column: 35, scope: !1299, inlinedAt: !1200)
!1299 = distinct !DILexicalBlock(scope: !1294, file: !68, line: 193, column: 17)
!1300 = !DILocation(line: 193, column: 17, scope: !1294, inlinedAt: !1200)
!1301 = !DILocation(line: 194, column: 21, scope: !1302, inlinedAt: !1200)
!1302 = distinct !DILexicalBlock(scope: !1303, file: !68, line: 194, column: 21)
!1303 = distinct !DILexicalBlock(scope: !1299, file: !68, line: 193, column: 54)
!1304 = !DILocation(line: 194, scope: !1302, inlinedAt: !1200)
!1305 = !DILocalVariable(name: "k", scope: !1302, file: !68, line: 194, type: !86)
!1306 = !DILocation(line: 0, scope: !1302, inlinedAt: !1200)
!1307 = !DILocation(line: 194, column: 39, scope: !1308, inlinedAt: !1200)
!1308 = distinct !DILexicalBlock(scope: !1302, file: !68, line: 194, column: 21)
!1309 = !DILocation(line: 196, column: 89, scope: !1310, inlinedAt: !1200)
!1310 = distinct !DILexicalBlock(scope: !1308, file: !68, line: 195, column: 21)
!1311 = !DILocation(line: 196, column: 86, scope: !1310, inlinedAt: !1200)
!1312 = !DILocation(line: 196, column: 81, scope: !1310, inlinedAt: !1200)
!1313 = !DILocation(line: 196, column: 103, scope: !1310, inlinedAt: !1200)
!1314 = !DILocation(line: 196, column: 38, scope: !1310, inlinedAt: !1200)
!1315 = !DILocation(line: 196, column: 42, scope: !1310, inlinedAt: !1200)
!1316 = !DILocation(line: 196, column: 51, scope: !1310, inlinedAt: !1200)
!1317 = !DILocation(line: 196, column: 68, scope: !1310, inlinedAt: !1200)
!1318 = !DILocation(line: 196, column: 46, scope: !1310, inlinedAt: !1200)
!1319 = !DILocation(line: 196, column: 25, scope: !1310, inlinedAt: !1200)
!1320 = !DILocation(line: 196, column: 78, scope: !1310, inlinedAt: !1200)
!1321 = !DILocation(line: 197, column: 42, scope: !1322, inlinedAt: !1200)
!1322 = distinct !DILexicalBlock(scope: !1310, file: !68, line: 197, column: 28)
!1323 = !DILocation(line: 198, column: 97, scope: !1324, inlinedAt: !1200)
!1324 = distinct !DILexicalBlock(scope: !1322, file: !68, line: 197, column: 46)
!1325 = !DILocation(line: 198, column: 94, scope: !1324, inlinedAt: !1200)
!1326 = !DILocation(line: 198, column: 89, scope: !1324, inlinedAt: !1200)
!1327 = !DILocation(line: 198, column: 117, scope: !1324, inlinedAt: !1200)
!1328 = !DILocation(line: 198, column: 111, scope: !1324, inlinedAt: !1200)
!1329 = !DILocation(line: 198, column: 42, scope: !1324, inlinedAt: !1200)
!1330 = !DILocation(line: 198, column: 46, scope: !1324, inlinedAt: !1200)
!1331 = !DILocation(line: 198, column: 55, scope: !1324, inlinedAt: !1200)
!1332 = !DILocation(line: 198, column: 76, scope: !1324, inlinedAt: !1200)
!1333 = !DILocation(line: 198, column: 50, scope: !1324, inlinedAt: !1200)
!1334 = !DILocation(line: 198, column: 29, scope: !1324, inlinedAt: !1200)
!1335 = !DILocation(line: 198, column: 86, scope: !1324, inlinedAt: !1200)
!1336 = !DILocation(line: 199, column: 25, scope: !1324, inlinedAt: !1200)
!1337 = !DILocation(line: 194, column: 55, scope: !1308, inlinedAt: !1200)
!1338 = !DILocation(line: 194, column: 21, scope: !1308, inlinedAt: !1200)
!1339 = distinct !{!1339, !1301, !1340, !297}
!1340 = !DILocation(line: 200, column: 21, scope: !1302, inlinedAt: !1200)
!1341 = !DILocation(line: 193, column: 50, scope: !1299, inlinedAt: !1200)
!1342 = !DILocation(line: 193, column: 17, scope: !1299, inlinedAt: !1200)
!1343 = distinct !{!1343, !1300, !1344, !297}
!1344 = !DILocation(line: 201, column: 17, scope: !1294, inlinedAt: !1200)
!1345 = !DILocation(line: 204, column: 27, scope: !1234, inlinedAt: !1200)
!1346 = !DILocation(line: 205, column: 30, scope: !1347, inlinedAt: !1200)
!1347 = distinct !DILexicalBlock(scope: !1234, file: !68, line: 205, column: 16)
!1348 = !DILocation(line: 178, column: 46, scope: !1232, inlinedAt: !1200)
!1349 = !DILocation(line: 178, column: 9, scope: !1232, inlinedAt: !1200)
!1350 = distinct !{!1350, !1225, !1351, !297}
!1351 = !DILocation(line: 209, column: 9, scope: !1226, inlinedAt: !1200)
!1352 = !DILocation(line: 177, column: 42, scope: !1221, inlinedAt: !1200)
!1353 = !DILocation(line: 177, column: 5, scope: !1221, inlinedAt: !1200)
!1354 = distinct !{!1354, !1222, !1355, !297}
!1355 = !DILocation(line: 210, column: 5, scope: !1214, inlinedAt: !1200)
!1356 = !DILocation(line: 212, scope: !1224, inlinedAt: !1200)
!1357 = !DILocalVariable(name: "c", scope: !1224, file: !68, line: 212, type: !58)
!1358 = !DILocation(line: 0, scope: !1224, inlinedAt: !1200)
!1359 = !DILocation(line: 212, column: 26, scope: !1360, inlinedAt: !1200)
!1360 = distinct !DILexicalBlock(scope: !1224, file: !68, line: 212, column: 5)
!1361 = !DILocation(line: 214, column: 35, scope: !1362, inlinedAt: !1200)
!1362 = distinct !DILexicalBlock(scope: !1360, file: !68, line: 213, column: 5)
!1363 = !DILocalVariable(name: "M", arg: 1, scope: !67, file: !68, line: 111, type: !52)
!1364 = !DILocation(line: 0, scope: !67, inlinedAt: !1365)
!1365 = distinct !DILocation(line: 214, column: 9, scope: !1362, inlinedAt: !1200)
!1366 = !DILocalVariable(name: "i", scope: !1367, file: !68, line: 117, type: !58)
!1367 = distinct !DILexicalBlock(scope: !67, file: !68, line: 117, column: 5)
!1368 = !DILocation(line: 0, scope: !1367, inlinedAt: !1365)
!1369 = !DILocation(line: 117, column: 10, scope: !1367, inlinedAt: !1365)
!1370 = !DILocation(line: 117, scope: !1367, inlinedAt: !1365)
!1371 = !DILocation(line: 117, column: 26, scope: !1372, inlinedAt: !1365)
!1372 = distinct !DILexicalBlock(scope: !1367, file: !68, line: 117, column: 5)
!1373 = !DILocation(line: 117, column: 5, scope: !1367, inlinedAt: !1365)
!1374 = !DILocation(line: 124, column: 5, scope: !1375, inlinedAt: !1365)
!1375 = distinct !DILexicalBlock(scope: !67, file: !68, line: 124, column: 5)
!1376 = !DILocation(line: 119, column: 24, scope: !1377, inlinedAt: !1365)
!1377 = distinct !DILexicalBlock(scope: !1372, file: !68, line: 118, column: 5)
!1378 = !DILocation(line: 119, column: 29, scope: !1377, inlinedAt: !1365)
!1379 = !DILocation(line: 119, column: 41, scope: !1377, inlinedAt: !1365)
!1380 = !DILocation(line: 119, column: 38, scope: !1377, inlinedAt: !1365)
!1381 = !DILocation(line: 119, column: 36, scope: !1377, inlinedAt: !1365)
!1382 = !DILocation(line: 119, column: 46, scope: !1377, inlinedAt: !1365)
!1383 = !DILocalVariable(name: "t", scope: !1377, file: !68, line: 119, type: !53)
!1384 = !DILocation(line: 0, scope: !1377, inlinedAt: !1365)
!1385 = !DILocation(line: 120, column: 21, scope: !1377, inlinedAt: !1365)
!1386 = !DILocation(line: 120, column: 9, scope: !1377, inlinedAt: !1365)
!1387 = !DILocation(line: 120, column: 16, scope: !1377, inlinedAt: !1365)
!1388 = !DILocation(line: 121, column: 12, scope: !1377, inlinedAt: !1365)
!1389 = !DILocation(line: 121, column: 9, scope: !1377, inlinedAt: !1365)
!1390 = !DILocation(line: 121, column: 16, scope: !1377, inlinedAt: !1365)
!1391 = !DILocation(line: 117, column: 33, scope: !1372, inlinedAt: !1365)
!1392 = !DILocation(line: 117, column: 5, scope: !1372, inlinedAt: !1365)
!1393 = distinct !{!1393, !1373, !1394, !297}
!1394 = !DILocation(line: 122, column: 5, scope: !1367, inlinedAt: !1365)
!1395 = !DILocation(line: 124, scope: !1375, inlinedAt: !1365)
!1396 = !DILocalVariable(name: "i", scope: !1375, file: !68, line: 124, type: !58)
!1397 = !DILocation(line: 0, scope: !1375, inlinedAt: !1365)
!1398 = !DILocation(line: 124, column: 26, scope: !1399, inlinedAt: !1365)
!1399 = distinct !DILexicalBlock(scope: !1375, file: !68, line: 124, column: 5)
!1400 = !DILocation(line: 134, column: 5, scope: !1401, inlinedAt: !1365)
!1401 = distinct !DILexicalBlock(scope: !67, file: !68, line: 134, column: 5)
!1402 = !DILocation(line: 126, column: 25, scope: !1403, inlinedAt: !1365)
!1403 = distinct !DILexicalBlock(scope: !1399, file: !68, line: 125, column: 5)
!1404 = !DILocation(line: 126, column: 32, scope: !1403, inlinedAt: !1365)
!1405 = !DILocation(line: 126, column: 43, scope: !1403, inlinedAt: !1365)
!1406 = !DILocation(line: 126, column: 40, scope: !1403, inlinedAt: !1365)
!1407 = !DILocation(line: 126, column: 38, scope: !1403, inlinedAt: !1365)
!1408 = !DILocation(line: 126, column: 48, scope: !1403, inlinedAt: !1365)
!1409 = !DILocalVariable(name: "t0", scope: !1403, file: !68, line: 126, type: !53)
!1410 = !DILocation(line: 0, scope: !1403, inlinedAt: !1365)
!1411 = !DILocation(line: 127, column: 28, scope: !1403, inlinedAt: !1365)
!1412 = !DILocation(line: 127, column: 25, scope: !1403, inlinedAt: !1365)
!1413 = !DILocation(line: 127, column: 32, scope: !1403, inlinedAt: !1365)
!1414 = !DILocation(line: 127, column: 43, scope: !1403, inlinedAt: !1365)
!1415 = !DILocation(line: 127, column: 40, scope: !1403, inlinedAt: !1365)
!1416 = !DILocation(line: 127, column: 38, scope: !1403, inlinedAt: !1365)
!1417 = !DILocation(line: 127, column: 48, scope: !1403, inlinedAt: !1365)
!1418 = !DILocalVariable(name: "t1", scope: !1403, file: !68, line: 127, type: !53)
!1419 = !DILocation(line: 128, column: 23, scope: !1403, inlinedAt: !1365)
!1420 = !DILocation(line: 128, column: 9, scope: !1403, inlinedAt: !1365)
!1421 = !DILocation(line: 128, column: 16, scope: !1403, inlinedAt: !1365)
!1422 = !DILocation(line: 129, column: 23, scope: !1403, inlinedAt: !1365)
!1423 = !DILocation(line: 129, column: 12, scope: !1403, inlinedAt: !1365)
!1424 = !DILocation(line: 129, column: 9, scope: !1403, inlinedAt: !1365)
!1425 = !DILocation(line: 129, column: 16, scope: !1403, inlinedAt: !1365)
!1426 = !DILocation(line: 130, column: 12, scope: !1403, inlinedAt: !1365)
!1427 = !DILocation(line: 130, column: 9, scope: !1403, inlinedAt: !1365)
!1428 = !DILocation(line: 130, column: 16, scope: !1403, inlinedAt: !1365)
!1429 = !DILocation(line: 131, column: 12, scope: !1403, inlinedAt: !1365)
!1430 = !DILocation(line: 131, column: 9, scope: !1403, inlinedAt: !1365)
!1431 = !DILocation(line: 131, column: 16, scope: !1403, inlinedAt: !1365)
!1432 = !DILocation(line: 124, column: 33, scope: !1399, inlinedAt: !1365)
!1433 = !DILocation(line: 124, column: 5, scope: !1399, inlinedAt: !1365)
!1434 = distinct !{!1434, !1374, !1435, !297}
!1435 = !DILocation(line: 132, column: 5, scope: !1375, inlinedAt: !1365)
!1436 = !DILocation(line: 134, scope: !1401, inlinedAt: !1365)
!1437 = !DILocalVariable(name: "i", scope: !1401, file: !68, line: 134, type: !58)
!1438 = !DILocation(line: 0, scope: !1401, inlinedAt: !1365)
!1439 = !DILocation(line: 134, column: 26, scope: !1440, inlinedAt: !1365)
!1440 = distinct !DILexicalBlock(scope: !1401, file: !68, line: 134, column: 5)
!1441 = !DILocation(line: 145, column: 5, scope: !1442, inlinedAt: !1365)
!1442 = distinct !DILexicalBlock(scope: !67, file: !68, line: 145, column: 5)
!1443 = !DILocation(line: 136, column: 25, scope: !1444, inlinedAt: !1365)
!1444 = distinct !DILexicalBlock(scope: !1440, file: !68, line: 135, column: 5)
!1445 = !DILocation(line: 136, column: 32, scope: !1444, inlinedAt: !1365)
!1446 = !DILocation(line: 136, column: 44, scope: !1444, inlinedAt: !1365)
!1447 = !DILocation(line: 136, column: 41, scope: !1444, inlinedAt: !1365)
!1448 = !DILocation(line: 136, column: 39, scope: !1444, inlinedAt: !1365)
!1449 = !DILocation(line: 136, column: 50, scope: !1444, inlinedAt: !1365)
!1450 = !DILocalVariable(name: "t0", scope: !1444, file: !68, line: 136, type: !53)
!1451 = !DILocation(line: 0, scope: !1444, inlinedAt: !1365)
!1452 = !DILocation(line: 137, column: 28, scope: !1444, inlinedAt: !1365)
!1453 = !DILocation(line: 137, column: 25, scope: !1444, inlinedAt: !1365)
!1454 = !DILocation(line: 137, column: 32, scope: !1444, inlinedAt: !1365)
!1455 = !DILocation(line: 137, column: 44, scope: !1444, inlinedAt: !1365)
!1456 = !DILocation(line: 137, column: 41, scope: !1444, inlinedAt: !1365)
!1457 = !DILocation(line: 137, column: 39, scope: !1444, inlinedAt: !1365)
!1458 = !DILocation(line: 137, column: 50, scope: !1444, inlinedAt: !1365)
!1459 = !DILocalVariable(name: "t1", scope: !1444, file: !68, line: 137, type: !53)
!1460 = !DILocation(line: 139, column: 23, scope: !1444, inlinedAt: !1365)
!1461 = !DILocation(line: 139, column: 9, scope: !1444, inlinedAt: !1365)
!1462 = !DILocation(line: 139, column: 17, scope: !1444, inlinedAt: !1365)
!1463 = !DILocation(line: 140, column: 23, scope: !1444, inlinedAt: !1365)
!1464 = !DILocation(line: 140, column: 12, scope: !1444, inlinedAt: !1365)
!1465 = !DILocation(line: 140, column: 9, scope: !1444, inlinedAt: !1365)
!1466 = !DILocation(line: 140, column: 17, scope: !1444, inlinedAt: !1365)
!1467 = !DILocation(line: 141, column: 12, scope: !1444, inlinedAt: !1365)
!1468 = !DILocation(line: 141, column: 9, scope: !1444, inlinedAt: !1365)
!1469 = !DILocation(line: 141, column: 17, scope: !1444, inlinedAt: !1365)
!1470 = !DILocation(line: 142, column: 12, scope: !1444, inlinedAt: !1365)
!1471 = !DILocation(line: 142, column: 9, scope: !1444, inlinedAt: !1365)
!1472 = !DILocation(line: 142, column: 17, scope: !1444, inlinedAt: !1365)
!1473 = !DILocation(line: 134, column: 32, scope: !1440, inlinedAt: !1365)
!1474 = !DILocation(line: 134, column: 5, scope: !1440, inlinedAt: !1365)
!1475 = distinct !{!1475, !1400, !1476, !297}
!1476 = !DILocation(line: 143, column: 5, scope: !1401, inlinedAt: !1365)
!1477 = !DILocation(line: 145, scope: !1442, inlinedAt: !1365)
!1478 = !DILocalVariable(name: "i", scope: !1442, file: !68, line: 145, type: !58)
!1479 = !DILocation(line: 0, scope: !1442, inlinedAt: !1365)
!1480 = !DILocation(line: 145, column: 26, scope: !1481, inlinedAt: !1365)
!1481 = distinct !DILexicalBlock(scope: !1442, file: !68, line: 145, column: 5)
!1482 = !DILocation(line: 147, column: 24, scope: !1483, inlinedAt: !1365)
!1483 = distinct !DILexicalBlock(scope: !1481, file: !68, line: 146, column: 5)
!1484 = !DILocation(line: 147, column: 28, scope: !1483, inlinedAt: !1365)
!1485 = !DILocation(line: 147, column: 39, scope: !1483, inlinedAt: !1365)
!1486 = !DILocation(line: 147, column: 36, scope: !1483, inlinedAt: !1365)
!1487 = !DILocation(line: 147, column: 44, scope: !1483, inlinedAt: !1365)
!1488 = !DILocalVariable(name: "t", scope: !1483, file: !68, line: 147, type: !53)
!1489 = !DILocation(line: 0, scope: !1483, inlinedAt: !1365)
!1490 = !DILocation(line: 148, column: 21, scope: !1483, inlinedAt: !1365)
!1491 = !DILocation(line: 148, column: 9, scope: !1483, inlinedAt: !1365)
!1492 = !DILocation(line: 148, column: 16, scope: !1483, inlinedAt: !1365)
!1493 = !DILocation(line: 149, column: 12, scope: !1483, inlinedAt: !1365)
!1494 = !DILocation(line: 149, column: 9, scope: !1483, inlinedAt: !1365)
!1495 = !DILocation(line: 149, column: 16, scope: !1483, inlinedAt: !1365)
!1496 = !DILocation(line: 145, column: 32, scope: !1481, inlinedAt: !1365)
!1497 = !DILocation(line: 145, column: 5, scope: !1481, inlinedAt: !1365)
!1498 = distinct !{!1498, !1441, !1499, !297}
!1499 = !DILocation(line: 150, column: 5, scope: !1442, inlinedAt: !1365)
!1500 = !DILocation(line: 212, column: 91, scope: !1360, inlinedAt: !1200)
!1501 = !DILocation(line: 212, column: 5, scope: !1360, inlinedAt: !1200)
!1502 = distinct !{!1502, !1223, !1503, !297}
!1503 = !DILocation(line: 215, column: 5, scope: !1224, inlinedAt: !1200)
!1504 = !DILocalVariable(name: "tab", scope: !1197, file: !68, line: 217, type: !1505)
!1505 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 128, elements: !1506)
!1506 = !{!1507}
!1507 = !DISubrange(count: 16)
!1508 = !DILocation(line: 217, column: 19, scope: !1197, inlinedAt: !1200)
!1509 = !DILocalVariable(name: "i", scope: !1510, file: !68, line: 218, type: !58)
!1510 = distinct !DILexicalBlock(scope: !1197, file: !68, line: 218, column: 5)
!1511 = !DILocation(line: 0, scope: !1510, inlinedAt: !1200)
!1512 = !DILocation(line: 218, column: 10, scope: !1510, inlinedAt: !1200)
!1513 = !DILocation(line: 218, scope: !1510, inlinedAt: !1200)
!1514 = !DILocation(line: 218, column: 26, scope: !1515, inlinedAt: !1200)
!1515 = distinct !DILexicalBlock(scope: !1510, file: !68, line: 218, column: 5)
!1516 = !DILocation(line: 218, column: 5, scope: !1510, inlinedAt: !1200)
!1517 = !DILocation(line: 228, column: 5, scope: !1518, inlinedAt: !1200)
!1518 = distinct !DILexicalBlock(scope: !1197, file: !68, line: 228, column: 5)
!1519 = !DILocation(line: 220, column: 28, scope: !1520, inlinedAt: !1200)
!1520 = distinct !DILexicalBlock(scope: !1515, file: !68, line: 219, column: 5)
!1521 = !DILocalVariable(name: "a", arg: 1, scope: !1522, file: !665, line: 8, type: !51)
!1522 = distinct !DISubprogram(name: "mul_f", scope: !665, file: !665, line: 8, type: !1523, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1523 = !DISubroutineType(types: !1524)
!1524 = !{!51, !51, !51}
!1525 = !DILocation(line: 0, scope: !1522, inlinedAt: !1526)
!1526 = distinct !DILocation(line: 220, column: 22, scope: !1520, inlinedAt: !1200)
!1527 = !DILocalVariable(name: "b", arg: 2, scope: !1522, file: !665, line: 8, type: !51)
!1528 = !DILocation(line: 13, column: 10, scope: !1522, inlinedAt: !1526)
!1529 = !DILocation(line: 13, column: 7, scope: !1522, inlinedAt: !1526)
!1530 = !DILocalVariable(name: "p", scope: !1522, file: !665, line: 10, type: !51)
!1531 = !DILocation(line: 19, column: 7, scope: !1522, inlinedAt: !1526)
!1532 = !DILocalVariable(name: "top_p", scope: !1522, file: !665, line: 22, type: !51)
!1533 = !DILocalVariable(name: "out", scope: !1522, file: !665, line: 23, type: !51)
!1534 = !DILocation(line: 220, column: 14, scope: !1520, inlinedAt: !1200)
!1535 = !DILocation(line: 220, column: 9, scope: !1520, inlinedAt: !1200)
!1536 = !DILocation(line: 220, column: 20, scope: !1520, inlinedAt: !1200)
!1537 = !DILocation(line: 0, scope: !1522, inlinedAt: !1538)
!1538 = distinct !DILocation(line: 221, column: 22, scope: !1520, inlinedAt: !1200)
!1539 = !DILocation(line: 13, column: 10, scope: !1522, inlinedAt: !1538)
!1540 = !DILocation(line: 13, column: 7, scope: !1522, inlinedAt: !1538)
!1541 = !DILocation(line: 16, column: 17, scope: !1522, inlinedAt: !1538)
!1542 = !DILocation(line: 17, column: 17, scope: !1522, inlinedAt: !1538)
!1543 = !DILocation(line: 17, column: 7, scope: !1522, inlinedAt: !1538)
!1544 = !DILocation(line: 18, column: 17, scope: !1522, inlinedAt: !1538)
!1545 = !DILocation(line: 18, column: 7, scope: !1522, inlinedAt: !1538)
!1546 = !DILocation(line: 19, column: 17, scope: !1522, inlinedAt: !1538)
!1547 = !DILocation(line: 23, column: 37, scope: !1522, inlinedAt: !1538)
!1548 = !DILocation(line: 23, column: 52, scope: !1522, inlinedAt: !1538)
!1549 = !DILocation(line: 23, column: 43, scope: !1522, inlinedAt: !1538)
!1550 = !DILocation(line: 23, column: 59, scope: !1522, inlinedAt: !1538)
!1551 = !DILocation(line: 221, column: 14, scope: !1520, inlinedAt: !1200)
!1552 = !DILocation(line: 221, column: 16, scope: !1520, inlinedAt: !1200)
!1553 = !DILocation(line: 221, column: 9, scope: !1520, inlinedAt: !1200)
!1554 = !DILocation(line: 221, column: 20, scope: !1520, inlinedAt: !1200)
!1555 = !DILocation(line: 222, column: 28, scope: !1520, inlinedAt: !1200)
!1556 = !DILocation(line: 0, scope: !1522, inlinedAt: !1557)
!1557 = distinct !DILocation(line: 222, column: 22, scope: !1520, inlinedAt: !1200)
!1558 = !DILocation(line: 13, column: 10, scope: !1522, inlinedAt: !1557)
!1559 = !DILocation(line: 13, column: 7, scope: !1522, inlinedAt: !1557)
!1560 = !DILocation(line: 16, column: 17, scope: !1522, inlinedAt: !1557)
!1561 = !DILocation(line: 17, column: 17, scope: !1522, inlinedAt: !1557)
!1562 = !DILocation(line: 17, column: 7, scope: !1522, inlinedAt: !1557)
!1563 = !DILocation(line: 18, column: 17, scope: !1522, inlinedAt: !1557)
!1564 = !DILocation(line: 19, column: 17, scope: !1522, inlinedAt: !1557)
!1565 = !DILocation(line: 19, column: 7, scope: !1522, inlinedAt: !1557)
!1566 = !DILocation(line: 23, column: 37, scope: !1522, inlinedAt: !1557)
!1567 = !DILocation(line: 23, column: 52, scope: !1522, inlinedAt: !1557)
!1568 = !DILocation(line: 23, column: 43, scope: !1522, inlinedAt: !1557)
!1569 = !DILocation(line: 23, column: 59, scope: !1522, inlinedAt: !1557)
!1570 = !DILocation(line: 222, column: 14, scope: !1520, inlinedAt: !1200)
!1571 = !DILocation(line: 222, column: 16, scope: !1520, inlinedAt: !1200)
!1572 = !DILocation(line: 222, column: 9, scope: !1520, inlinedAt: !1200)
!1573 = !DILocation(line: 222, column: 20, scope: !1520, inlinedAt: !1200)
!1574 = !DILocation(line: 223, column: 28, scope: !1520, inlinedAt: !1200)
!1575 = !DILocation(line: 0, scope: !1522, inlinedAt: !1576)
!1576 = distinct !DILocation(line: 223, column: 22, scope: !1520, inlinedAt: !1200)
!1577 = !DILocation(line: 13, column: 10, scope: !1522, inlinedAt: !1576)
!1578 = !DILocation(line: 13, column: 7, scope: !1522, inlinedAt: !1576)
!1579 = !DILocation(line: 16, column: 17, scope: !1522, inlinedAt: !1576)
!1580 = !DILocation(line: 17, column: 17, scope: !1522, inlinedAt: !1576)
!1581 = !DILocation(line: 18, column: 17, scope: !1522, inlinedAt: !1576)
!1582 = !DILocation(line: 18, column: 7, scope: !1522, inlinedAt: !1576)
!1583 = !DILocation(line: 19, column: 17, scope: !1522, inlinedAt: !1576)
!1584 = !DILocation(line: 19, column: 7, scope: !1522, inlinedAt: !1576)
!1585 = !DILocation(line: 23, column: 37, scope: !1522, inlinedAt: !1576)
!1586 = !DILocation(line: 23, column: 52, scope: !1522, inlinedAt: !1576)
!1587 = !DILocation(line: 23, column: 43, scope: !1522, inlinedAt: !1576)
!1588 = !DILocation(line: 23, column: 59, scope: !1522, inlinedAt: !1576)
!1589 = !DILocation(line: 223, column: 14, scope: !1520, inlinedAt: !1200)
!1590 = !DILocation(line: 223, column: 16, scope: !1520, inlinedAt: !1200)
!1591 = !DILocation(line: 223, column: 9, scope: !1520, inlinedAt: !1200)
!1592 = !DILocation(line: 223, column: 20, scope: !1520, inlinedAt: !1200)
!1593 = !DILocation(line: 218, column: 41, scope: !1515, inlinedAt: !1200)
!1594 = !DILocation(line: 218, column: 5, scope: !1515, inlinedAt: !1200)
!1595 = distinct !{!1595, !1516, !1596, !297}
!1596 = !DILocation(line: 224, column: 5, scope: !1510, inlinedAt: !1200)
!1597 = !DILocation(line: 228, scope: !1518, inlinedAt: !1200)
!1598 = !DILocalVariable(name: "c", scope: !1518, file: !68, line: 228, type: !58)
!1599 = !DILocation(line: 0, scope: !1518, inlinedAt: !1200)
!1600 = !DILocation(line: 228, column: 26, scope: !1601, inlinedAt: !1200)
!1601 = distinct !DILexicalBlock(scope: !1518, file: !68, line: 228, column: 5)
!1602 = !DILocation(line: 250, column: 5, scope: !1603, inlinedAt: !1200)
!1603 = distinct !DILexicalBlock(scope: !1197, file: !68, line: 250, column: 5)
!1604 = !DILocation(line: 230, column: 9, scope: !1605, inlinedAt: !1200)
!1605 = distinct !DILexicalBlock(scope: !1606, file: !68, line: 230, column: 9)
!1606 = distinct !DILexicalBlock(scope: !1601, file: !68, line: 229, column: 5)
!1607 = !DILocation(line: 230, scope: !1605, inlinedAt: !1200)
!1608 = !DILocalVariable(name: "r", scope: !1605, file: !68, line: 230, type: !86)
!1609 = !DILocation(line: 0, scope: !1605, inlinedAt: !1200)
!1610 = !DILocation(line: 230, column: 36, scope: !1611, inlinedAt: !1200)
!1611 = distinct !DILexicalBlock(scope: !1605, file: !68, line: 230, column: 9)
!1612 = !DILocation(line: 232, column: 28, scope: !1613, inlinedAt: !1200)
!1613 = distinct !DILexicalBlock(scope: !1611, file: !68, line: 231, column: 9)
!1614 = !DILocation(line: 232, column: 32, scope: !1613, inlinedAt: !1200)
!1615 = !DILocation(line: 232, column: 41, scope: !1613, inlinedAt: !1200)
!1616 = !DILocation(line: 232, column: 49, scope: !1613, inlinedAt: !1200)
!1617 = !DILocation(line: 232, column: 45, scope: !1613, inlinedAt: !1200)
!1618 = !DILocalVariable(name: "pos", scope: !1613, file: !68, line: 232, type: !58)
!1619 = !DILocation(line: 0, scope: !1613, inlinedAt: !1200)
!1620 = !DILocation(line: 233, column: 28, scope: !1613, inlinedAt: !1200)
!1621 = !DILocation(line: 233, column: 41, scope: !1613, inlinedAt: !1200)
!1622 = !DILocalVariable(name: "t0", scope: !1613, file: !68, line: 233, type: !53)
!1623 = !DILocation(line: 234, column: 35, scope: !1613, inlinedAt: !1200)
!1624 = !DILocation(line: 234, column: 41, scope: !1613, inlinedAt: !1200)
!1625 = !DILocalVariable(name: "t1", scope: !1613, file: !68, line: 234, type: !53)
!1626 = !DILocation(line: 235, column: 35, scope: !1613, inlinedAt: !1200)
!1627 = !DILocation(line: 235, column: 41, scope: !1613, inlinedAt: !1200)
!1628 = !DILocalVariable(name: "t2", scope: !1613, file: !68, line: 235, type: !53)
!1629 = !DILocation(line: 236, column: 28, scope: !1613, inlinedAt: !1200)
!1630 = !DILocation(line: 236, column: 35, scope: !1613, inlinedAt: !1200)
!1631 = !DILocation(line: 236, column: 41, scope: !1613, inlinedAt: !1200)
!1632 = !DILocalVariable(name: "t3", scope: !1613, file: !68, line: 236, type: !53)
!1633 = !DILocalVariable(name: "t", scope: !1634, file: !68, line: 237, type: !58)
!1634 = distinct !DILexicalBlock(scope: !1613, file: !68, line: 237, column: 13)
!1635 = !DILocation(line: 0, scope: !1634, inlinedAt: !1200)
!1636 = !DILocation(line: 237, column: 18, scope: !1634, inlinedAt: !1200)
!1637 = !DILocation(line: 237, scope: !1634, inlinedAt: !1200)
!1638 = !DILocation(line: 237, column: 34, scope: !1639, inlinedAt: !1200)
!1639 = distinct !DILexicalBlock(scope: !1634, file: !68, line: 237, column: 13)
!1640 = !DILocation(line: 237, column: 13, scope: !1634, inlinedAt: !1200)
!1641 = !DILocation(line: 239, column: 89, scope: !1642, inlinedAt: !1200)
!1642 = distinct !DILexicalBlock(scope: !1639, file: !68, line: 238, column: 13)
!1643 = !DILocation(line: 239, column: 84, scope: !1642, inlinedAt: !1200)
!1644 = !DILocation(line: 239, column: 83, scope: !1642, inlinedAt: !1200)
!1645 = !DILocation(line: 239, column: 105, scope: !1642, inlinedAt: !1200)
!1646 = !DILocation(line: 239, column: 107, scope: !1642, inlinedAt: !1200)
!1647 = !DILocation(line: 239, column: 100, scope: !1642, inlinedAt: !1200)
!1648 = !DILocation(line: 239, column: 99, scope: !1642, inlinedAt: !1200)
!1649 = !DILocation(line: 239, column: 95, scope: !1642, inlinedAt: !1200)
!1650 = !DILocation(line: 239, column: 121, scope: !1642, inlinedAt: !1200)
!1651 = !DILocation(line: 239, column: 123, scope: !1642, inlinedAt: !1200)
!1652 = !DILocation(line: 239, column: 116, scope: !1642, inlinedAt: !1200)
!1653 = !DILocation(line: 239, column: 115, scope: !1642, inlinedAt: !1200)
!1654 = !DILocation(line: 239, column: 111, scope: !1642, inlinedAt: !1200)
!1655 = !DILocation(line: 239, column: 137, scope: !1642, inlinedAt: !1200)
!1656 = !DILocation(line: 239, column: 139, scope: !1642, inlinedAt: !1200)
!1657 = !DILocation(line: 239, column: 132, scope: !1642, inlinedAt: !1200)
!1658 = !DILocation(line: 239, column: 131, scope: !1642, inlinedAt: !1200)
!1659 = !DILocation(line: 239, column: 127, scope: !1642, inlinedAt: !1200)
!1660 = !DILocation(line: 239, column: 22, scope: !1642, inlinedAt: !1200)
!1661 = !DILocation(line: 239, column: 24, scope: !1642, inlinedAt: !1200)
!1662 = !DILocation(line: 239, column: 36, scope: !1642, inlinedAt: !1200)
!1663 = !DILocation(line: 239, column: 40, scope: !1642, inlinedAt: !1200)
!1664 = !DILocation(line: 239, column: 49, scope: !1642, inlinedAt: !1200)
!1665 = !DILocation(line: 239, column: 58, scope: !1642, inlinedAt: !1200)
!1666 = !DILocation(line: 239, column: 72, scope: !1642, inlinedAt: !1200)
!1667 = !DILocation(line: 239, column: 53, scope: !1642, inlinedAt: !1200)
!1668 = !DILocation(line: 239, column: 17, scope: !1642, inlinedAt: !1200)
!1669 = !DILocation(line: 239, column: 78, scope: !1642, inlinedAt: !1200)
!1670 = !DILocation(line: 237, column: 49, scope: !1639, inlinedAt: !1200)
!1671 = !DILocation(line: 237, column: 13, scope: !1639, inlinedAt: !1200)
!1672 = distinct !{!1672, !1640, !1673, !297}
!1673 = !DILocation(line: 240, column: 13, scope: !1634, inlinedAt: !1200)
!1674 = !DILocation(line: 230, column: 82, scope: !1611, inlinedAt: !1200)
!1675 = !DILocation(line: 230, column: 9, scope: !1611, inlinedAt: !1200)
!1676 = distinct !{!1676, !1604, !1677, !297}
!1677 = !DILocation(line: 241, column: 9, scope: !1605, inlinedAt: !1200)
!1678 = !DILocation(line: 228, column: 38, scope: !1601, inlinedAt: !1200)
!1679 = !DILocation(line: 228, column: 5, scope: !1601, inlinedAt: !1200)
!1680 = distinct !{!1680, !1517, !1681, !297}
!1681 = !DILocation(line: 242, column: 5, scope: !1518, inlinedAt: !1200)
!1682 = !DILocation(line: 250, scope: !1603, inlinedAt: !1200)
!1683 = !DILocalVariable(name: "r", scope: !1603, file: !68, line: 250, type: !86)
!1684 = !DILocation(line: 0, scope: !1603, inlinedAt: !1200)
!1685 = !DILocation(line: 250, column: 23, scope: !1686, inlinedAt: !1200)
!1686 = distinct !DILexicalBlock(scope: !1603, file: !68, line: 250, column: 5)
!1687 = !DILocation(line: 252, column: 9, scope: !1688, inlinedAt: !1200)
!1688 = distinct !DILexicalBlock(scope: !1689, file: !68, line: 252, column: 9)
!1689 = distinct !DILexicalBlock(scope: !1686, file: !68, line: 251, column: 5)
!1690 = !DILocation(line: 252, scope: !1688, inlinedAt: !1200)
!1691 = !DILocalVariable(name: "c", scope: !1688, file: !68, line: 252, type: !86)
!1692 = !DILocation(line: 0, scope: !1688, inlinedAt: !1200)
!1693 = !DILocation(line: 252, column: 27, scope: !1694, inlinedAt: !1200)
!1694 = distinct !DILexicalBlock(scope: !1688, file: !68, line: 252, column: 9)
!1695 = !DILocation(line: 254, column: 13, scope: !1696, inlinedAt: !1200)
!1696 = distinct !DILexicalBlock(scope: !1697, file: !68, line: 254, column: 13)
!1697 = distinct !DILexicalBlock(scope: !1694, file: !68, line: 253, column: 9)
!1698 = !DILocation(line: 254, scope: !1696, inlinedAt: !1200)
!1699 = !DILocalVariable(name: "i", scope: !1696, file: !68, line: 254, type: !86)
!1700 = !DILocation(line: 0, scope: !1696, inlinedAt: !1200)
!1701 = !DILocation(line: 254, column: 35, scope: !1702, inlinedAt: !1200)
!1702 = distinct !DILexicalBlock(scope: !1696, file: !68, line: 254, column: 13)
!1703 = !DILocation(line: 256, column: 55, scope: !1704, inlinedAt: !1200)
!1704 = distinct !DILexicalBlock(scope: !1702, file: !68, line: 255, column: 13)
!1705 = !DILocation(line: 256, column: 59, scope: !1704, inlinedAt: !1200)
!1706 = !DILocation(line: 256, column: 63, scope: !1704, inlinedAt: !1200)
!1707 = !DILocation(line: 256, column: 44, scope: !1704, inlinedAt: !1200)
!1708 = !DILocation(line: 256, column: 95, scope: !1704, inlinedAt: !1200)
!1709 = !DILocation(line: 256, column: 92, scope: !1704, inlinedAt: !1200)
!1710 = !DILocation(line: 256, column: 75, scope: !1704, inlinedAt: !1200)
!1711 = !DILocation(line: 256, column: 99, scope: !1704, inlinedAt: !1200)
!1712 = !DILocation(line: 256, column: 104, scope: !1704, inlinedAt: !1200)
!1713 = !DILocation(line: 0, scope: !431, inlinedAt: !1714)
!1714 = distinct !DILocation(line: 256, column: 17, scope: !1704, inlinedAt: !1200)
!1715 = !DILocation(line: 22, column: 10, scope: !440, inlinedAt: !1714)
!1716 = !DILocation(line: 22, scope: !440, inlinedAt: !1714)
!1717 = !DILocation(line: 22, column: 29, scope: !443, inlinedAt: !1714)
!1718 = !DILocation(line: 22, column: 19, scope: !443, inlinedAt: !1714)
!1719 = !DILocation(line: 22, column: 5, scope: !440, inlinedAt: !1714)
!1720 = !DILocation(line: 23, column: 19, scope: !446, inlinedAt: !1714)
!1721 = !DILocation(line: 23, column: 24, scope: !446, inlinedAt: !1714)
!1722 = !DILocation(line: 23, column: 14, scope: !446, inlinedAt: !1714)
!1723 = !DILocation(line: 23, column: 17, scope: !446, inlinedAt: !1714)
!1724 = !DILocation(line: 24, column: 24, scope: !446, inlinedAt: !1714)
!1725 = !DILocation(line: 24, column: 17, scope: !446, inlinedAt: !1714)
!1726 = !DILocation(line: 24, column: 14, scope: !446, inlinedAt: !1714)
!1727 = !DILocation(line: 22, column: 34, scope: !443, inlinedAt: !1714)
!1728 = !DILocation(line: 22, column: 5, scope: !443, inlinedAt: !1714)
!1729 = distinct !{!1729, !1719, !1730, !297}
!1730 = !DILocation(line: 25, column: 5, scope: !440, inlinedAt: !1714)
!1731 = !DILocation(line: 254, column: 50, scope: !1702, inlinedAt: !1200)
!1732 = !DILocation(line: 254, column: 13, scope: !1702, inlinedAt: !1200)
!1733 = distinct !{!1733, !1695, !1734, !297}
!1734 = !DILocation(line: 257, column: 13, scope: !1696, inlinedAt: !1200)
!1735 = !DILocation(line: 252, column: 50, scope: !1694, inlinedAt: !1200)
!1736 = !DILocation(line: 252, column: 9, scope: !1694, inlinedAt: !1200)
!1737 = distinct !{!1737, !1687, !1738, !297}
!1738 = !DILocation(line: 258, column: 9, scope: !1688, inlinedAt: !1200)
!1739 = !DILocation(line: 250, column: 38, scope: !1686, inlinedAt: !1200)
!1740 = !DILocation(line: 250, column: 5, scope: !1686, inlinedAt: !1200)
!1741 = distinct !{!1741, !1602, !1742, !297}
!1742 = !DILocation(line: 259, column: 5, scope: !1603, inlinedAt: !1200)
!1743 = !DILocation(line: 260, column: 1, scope: !1197, inlinedAt: !1200)
!1744 = !DILocalVariable(name: "i", scope: !1745, file: !68, line: 461, type: !86)
!1745 = distinct !DILexicalBlock(scope: !985, file: !68, line: 461, column: 9)
!1746 = !DILocation(line: 0, scope: !1745)
!1747 = !DILocation(line: 461, column: 14, scope: !1745)
!1748 = !DILocation(line: 461, scope: !1745)
!1749 = !DILocation(line: 461, column: 27, scope: !1750)
!1750 = distinct !DILexicalBlock(scope: !1745, file: !68, line: 461, column: 9)
!1751 = !DILocation(line: 461, column: 9, scope: !1745)
!1752 = !DILocation(line: 463, column: 20, scope: !1753)
!1753 = distinct !DILexicalBlock(scope: !1750, file: !68, line: 462, column: 9)
!1754 = !DILocation(line: 463, column: 43, scope: !1753)
!1755 = !DILocation(line: 463, column: 13, scope: !1753)
!1756 = !DILocation(line: 463, column: 48, scope: !1753)
!1757 = !DILocation(line: 461, column: 39, scope: !1750)
!1758 = !DILocation(line: 461, column: 9, scope: !1750)
!1759 = distinct !{!1759, !1751, !1760, !297}
!1760 = !DILocation(line: 464, column: 9, scope: !1745)
!1761 = !DILocation(line: 466, column: 18, scope: !985)
!1762 = !DILocation(line: 0, scope: !431, inlinedAt: !1763)
!1763 = distinct !DILocation(line: 466, column: 9, scope: !985)
!1764 = !DILocation(line: 22, column: 10, scope: !440, inlinedAt: !1763)
!1765 = !DILocation(line: 22, scope: !440, inlinedAt: !1763)
!1766 = !DILocation(line: 22, column: 19, scope: !443, inlinedAt: !1763)
!1767 = !DILocation(line: 22, column: 5, scope: !440, inlinedAt: !1763)
!1768 = !DILocation(line: 23, column: 19, scope: !446, inlinedAt: !1763)
!1769 = !DILocation(line: 23, column: 24, scope: !446, inlinedAt: !1763)
!1770 = !DILocation(line: 23, column: 14, scope: !446, inlinedAt: !1763)
!1771 = !DILocation(line: 23, column: 17, scope: !446, inlinedAt: !1763)
!1772 = !DILocation(line: 24, column: 24, scope: !446, inlinedAt: !1763)
!1773 = !DILocation(line: 24, column: 17, scope: !446, inlinedAt: !1763)
!1774 = !DILocation(line: 24, column: 14, scope: !446, inlinedAt: !1763)
!1775 = !DILocation(line: 22, column: 34, scope: !443, inlinedAt: !1763)
!1776 = !DILocation(line: 22, column: 5, scope: !443, inlinedAt: !1763)
!1777 = distinct !{!1777, !1767, !1778, !297}
!1778 = !DILocation(line: 25, column: 5, scope: !440, inlinedAt: !1763)
!1779 = !DILocation(line: 470, column: 13, scope: !1780)
!1780 = distinct !DILexicalBlock(scope: !985, file: !68, line: 470, column: 13)
!1781 = !DILocation(line: 473, column: 13, scope: !1782)
!1782 = distinct !DILexicalBlock(scope: !1780, file: !68, line: 472, column: 16)
!1783 = !DILocation(line: 474, column: 13, scope: !1782)
!1784 = !DILocation(line: 444, column: 35, scope: !983)
!1785 = !DILocation(line: 444, column: 5, scope: !983)
!1786 = distinct !{!1786, !966, !1787, !297}
!1787 = !DILocation(line: 476, column: 5, scope: !967)
!1788 = !DILocalVariable(name: "i", scope: !1789, file: !68, line: 478, type: !86)
!1789 = distinct !DILexicalBlock(scope: !863, file: !68, line: 478, column: 5)
!1790 = !DILocation(line: 0, scope: !1789)
!1791 = !DILocation(line: 478, column: 10, scope: !1789)
!1792 = !DILocation(line: 478, scope: !1789)
!1793 = !DILocation(line: 478, column: 23, scope: !1794)
!1794 = distinct !DILexicalBlock(scope: !1789, file: !68, line: 478, column: 5)
!1795 = !DILocation(line: 478, column: 5, scope: !1789)
!1796 = !DILocation(line: 34, column: 5, scope: !1797, inlinedAt: !1799)
!1797 = distinct !DILexicalBlock(scope: !1798, file: !68, line: 34, column: 5)
!1798 = distinct !DISubprogram(name: "encode", scope: !68, file: !68, line: 32, type: !432, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1799 = distinct !DILocation(line: 484, column: 5, scope: !863)
!1800 = !DILocation(line: 479, column: 23, scope: !1801)
!1801 = distinct !DILexicalBlock(scope: !1794, file: !68, line: 478, column: 44)
!1802 = !DILocalVariable(name: "vi", scope: !863, file: !68, line: 376, type: !61)
!1803 = !DILocation(line: 480, column: 20, scope: !1801)
!1804 = !DILocation(line: 480, column: 29, scope: !1801)
!1805 = !DILocation(line: 480, column: 25, scope: !1801)
!1806 = !DILocalVariable(name: "a", arg: 1, scope: !1807, file: !665, line: 78, type: !90)
!1807 = distinct !DISubprogram(name: "mat_mul", scope: !665, file: !665, line: 78, type: !1808, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1808 = !DISubroutineType(types: !1809)
!1809 = !{null, !90, !90, !61, !86, !86, !86}
!1810 = !DILocation(line: 0, scope: !1807, inlinedAt: !1811)
!1811 = distinct !DILocation(line: 480, column: 9, scope: !1801)
!1812 = !DILocalVariable(name: "b", arg: 2, scope: !1807, file: !665, line: 78, type: !90)
!1813 = !DILocalVariable(name: "c", arg: 3, scope: !1807, file: !665, line: 79, type: !61)
!1814 = !DILocalVariable(name: "colrow_ab", arg: 4, scope: !1807, file: !665, line: 79, type: !86)
!1815 = !DILocalVariable(name: "row_a", arg: 5, scope: !1807, file: !665, line: 79, type: !86)
!1816 = !DILocalVariable(name: "col_b", arg: 6, scope: !1807, file: !665, line: 79, type: !86)
!1817 = !DILocalVariable(name: "i", scope: !1818, file: !665, line: 80, type: !86)
!1818 = distinct !DILexicalBlock(scope: !1807, file: !665, line: 80, column: 5)
!1819 = !DILocation(line: 0, scope: !1818, inlinedAt: !1811)
!1820 = !DILocation(line: 80, column: 10, scope: !1818, inlinedAt: !1811)
!1821 = !DILocation(line: 80, scope: !1818, inlinedAt: !1811)
!1822 = !DILocation(line: 80, column: 23, scope: !1823, inlinedAt: !1811)
!1823 = distinct !DILexicalBlock(scope: !1818, file: !665, line: 80, column: 5)
!1824 = !DILocation(line: 80, column: 5, scope: !1818, inlinedAt: !1811)
!1825 = !DILocation(line: 81, column: 9, scope: !1826, inlinedAt: !1811)
!1826 = distinct !DILexicalBlock(scope: !1827, file: !665, line: 81, column: 9)
!1827 = distinct !DILexicalBlock(scope: !1823, file: !665, line: 80, column: 53)
!1828 = !DILocation(line: 81, scope: !1826, inlinedAt: !1811)
!1829 = !DILocalVariable(name: "j", scope: !1826, file: !665, line: 81, type: !86)
!1830 = !DILocation(line: 0, scope: !1826, inlinedAt: !1811)
!1831 = !DILocation(line: 81, column: 27, scope: !1832, inlinedAt: !1811)
!1832 = distinct !DILexicalBlock(scope: !1826, file: !665, line: 81, column: 9)
!1833 = !DILocation(line: 82, column: 31, scope: !1834, inlinedAt: !1811)
!1834 = distinct !DILexicalBlock(scope: !1832, file: !665, line: 81, column: 46)
!1835 = !DILocalVariable(name: "a", arg: 1, scope: !1836, file: !665, line: 69, type: !90)
!1836 = distinct !DISubprogram(name: "lincomb", scope: !665, file: !665, line: 69, type: !1837, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1837 = !DISubroutineType(types: !1838)
!1838 = !{!51, !90, !90, !86, !86}
!1839 = !DILocation(line: 0, scope: !1836, inlinedAt: !1840)
!1840 = distinct !DILocation(line: 82, column: 18, scope: !1834, inlinedAt: !1811)
!1841 = !DILocalVariable(name: "b", arg: 2, scope: !1836, file: !665, line: 70, type: !90)
!1842 = !DILocalVariable(name: "n", arg: 3, scope: !1836, file: !665, line: 70, type: !86)
!1843 = !DILocalVariable(name: "m", arg: 4, scope: !1836, file: !665, line: 70, type: !86)
!1844 = !DILocalVariable(name: "ret", scope: !1836, file: !665, line: 71, type: !51)
!1845 = !DILocalVariable(name: "i", scope: !1846, file: !665, line: 72, type: !86)
!1846 = distinct !DILexicalBlock(scope: !1836, file: !665, line: 72, column: 5)
!1847 = !DILocation(line: 0, scope: !1846, inlinedAt: !1840)
!1848 = !DILocation(line: 72, column: 10, scope: !1846, inlinedAt: !1840)
!1849 = !DILocation(line: 72, scope: !1846, inlinedAt: !1840)
!1850 = !DILocation(line: 72, column: 23, scope: !1851, inlinedAt: !1840)
!1851 = distinct !DILexicalBlock(scope: !1846, file: !665, line: 72, column: 5)
!1852 = !DILocation(line: 72, column: 5, scope: !1846, inlinedAt: !1840)
!1853 = !DILocation(line: 73, column: 27, scope: !1854, inlinedAt: !1840)
!1854 = distinct !DILexicalBlock(scope: !1851, file: !665, line: 72, column: 41)
!1855 = !DILocation(line: 73, column: 33, scope: !1854, inlinedAt: !1840)
!1856 = !DILocation(line: 0, scope: !1522, inlinedAt: !1857)
!1857 = distinct !DILocation(line: 73, column: 21, scope: !1854, inlinedAt: !1840)
!1858 = !DILocation(line: 13, column: 10, scope: !1522, inlinedAt: !1857)
!1859 = !DILocation(line: 13, column: 7, scope: !1522, inlinedAt: !1857)
!1860 = !DILocation(line: 16, column: 17, scope: !1522, inlinedAt: !1857)
!1861 = !DILocation(line: 17, column: 13, scope: !1522, inlinedAt: !1857)
!1862 = !DILocation(line: 17, column: 17, scope: !1522, inlinedAt: !1857)
!1863 = !DILocation(line: 17, column: 7, scope: !1522, inlinedAt: !1857)
!1864 = !DILocation(line: 18, column: 13, scope: !1522, inlinedAt: !1857)
!1865 = !DILocation(line: 18, column: 17, scope: !1522, inlinedAt: !1857)
!1866 = !DILocation(line: 18, column: 7, scope: !1522, inlinedAt: !1857)
!1867 = !DILocation(line: 19, column: 13, scope: !1522, inlinedAt: !1857)
!1868 = !DILocation(line: 19, column: 17, scope: !1522, inlinedAt: !1857)
!1869 = !DILocation(line: 19, column: 7, scope: !1522, inlinedAt: !1857)
!1870 = !DILocation(line: 23, column: 37, scope: !1522, inlinedAt: !1857)
!1871 = !DILocation(line: 23, column: 52, scope: !1522, inlinedAt: !1857)
!1872 = !DILocation(line: 23, column: 43, scope: !1522, inlinedAt: !1857)
!1873 = !DILocation(line: 23, column: 59, scope: !1522, inlinedAt: !1857)
!1874 = !DILocalVariable(name: "a", arg: 1, scope: !1875, file: !665, line: 42, type: !51)
!1875 = distinct !DISubprogram(name: "add_f", scope: !665, file: !665, line: 42, type: !1523, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1876 = !DILocation(line: 0, scope: !1875, inlinedAt: !1877)
!1877 = distinct !DILocation(line: 73, column: 15, scope: !1854, inlinedAt: !1840)
!1878 = !DILocalVariable(name: "b", arg: 2, scope: !1875, file: !665, line: 42, type: !51)
!1879 = !DILocation(line: 43, column: 14, scope: !1875, inlinedAt: !1877)
!1880 = !DILocation(line: 72, column: 28, scope: !1851, inlinedAt: !1840)
!1881 = !DILocation(line: 72, column: 35, scope: !1851, inlinedAt: !1840)
!1882 = !DILocation(line: 72, column: 5, scope: !1851, inlinedAt: !1840)
!1883 = distinct !{!1883, !1852, !1884, !297}
!1884 = !DILocation(line: 74, column: 5, scope: !1846, inlinedAt: !1840)
!1885 = !DILocation(line: 82, column: 16, scope: !1834, inlinedAt: !1811)
!1886 = !DILocation(line: 81, column: 41, scope: !1832, inlinedAt: !1811)
!1887 = !DILocation(line: 81, column: 9, scope: !1832, inlinedAt: !1811)
!1888 = distinct !{!1888, !1825, !1889, !297}
!1889 = !DILocation(line: 83, column: 9, scope: !1826, inlinedAt: !1811)
!1890 = !DILocation(line: 80, column: 32, scope: !1823, inlinedAt: !1811)
!1891 = !DILocation(line: 80, column: 39, scope: !1823, inlinedAt: !1811)
!1892 = !DILocation(line: 80, column: 5, scope: !1823, inlinedAt: !1811)
!1893 = distinct !{!1893, !1824, !1894, !297}
!1894 = !DILocation(line: 84, column: 5, scope: !1818, inlinedAt: !1811)
!1895 = !DILocation(line: 479, column: 19, scope: !1801)
!1896 = !DILocation(line: 481, column: 31, scope: !1801)
!1897 = !DILocation(line: 481, column: 27, scope: !1801)
!1898 = !DILocalVariable(name: "a", arg: 1, scope: !1899, file: !665, line: 87, type: !90)
!1899 = distinct !DISubprogram(name: "mat_add", scope: !665, file: !665, line: 87, type: !1900, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1900 = !DISubroutineType(types: !1901)
!1901 = !{null, !90, !90, !61, !86, !86}
!1902 = !DILocation(line: 0, scope: !1899, inlinedAt: !1903)
!1903 = distinct !DILocation(line: 481, column: 9, scope: !1801)
!1904 = !DILocalVariable(name: "b", arg: 2, scope: !1899, file: !665, line: 87, type: !90)
!1905 = !DILocalVariable(name: "c", arg: 3, scope: !1899, file: !665, line: 88, type: !61)
!1906 = !DILocalVariable(name: "m", arg: 4, scope: !1899, file: !665, line: 88, type: !86)
!1907 = !DILocalVariable(name: "n", arg: 5, scope: !1899, file: !665, line: 88, type: !86)
!1908 = !DILocalVariable(name: "i", scope: !1909, file: !665, line: 89, type: !86)
!1909 = distinct !DILexicalBlock(scope: !1899, file: !665, line: 89, column: 5)
!1910 = !DILocation(line: 0, scope: !1909, inlinedAt: !1903)
!1911 = !DILocation(line: 89, column: 10, scope: !1909, inlinedAt: !1903)
!1912 = !DILocation(line: 89, scope: !1909, inlinedAt: !1903)
!1913 = !DILocation(line: 89, column: 23, scope: !1914, inlinedAt: !1903)
!1914 = distinct !DILexicalBlock(scope: !1909, file: !665, line: 89, column: 5)
!1915 = !DILocation(line: 89, column: 5, scope: !1909, inlinedAt: !1903)
!1916 = !DILocation(line: 90, column: 9, scope: !1917, inlinedAt: !1903)
!1917 = distinct !DILexicalBlock(scope: !1918, file: !665, line: 90, column: 9)
!1918 = distinct !DILexicalBlock(scope: !1914, file: !665, line: 89, column: 33)
!1919 = !DILocation(line: 90, scope: !1917, inlinedAt: !1903)
!1920 = !DILocalVariable(name: "j", scope: !1917, file: !665, line: 90, type: !86)
!1921 = !DILocation(line: 0, scope: !1917, inlinedAt: !1903)
!1922 = !DILocation(line: 90, column: 27, scope: !1923, inlinedAt: !1903)
!1923 = distinct !DILexicalBlock(scope: !1917, file: !665, line: 90, column: 9)
!1924 = !DILocation(line: 91, column: 42, scope: !1925, inlinedAt: !1903)
!1925 = distinct !DILexicalBlock(scope: !1923, file: !665, line: 90, column: 37)
!1926 = !DILocation(line: 91, column: 50, scope: !1925, inlinedAt: !1903)
!1927 = !DILocation(line: 91, column: 38, scope: !1925, inlinedAt: !1903)
!1928 = !DILocation(line: 91, column: 60, scope: !1925, inlinedAt: !1903)
!1929 = !DILocation(line: 91, column: 68, scope: !1925, inlinedAt: !1903)
!1930 = !DILocation(line: 91, column: 56, scope: !1925, inlinedAt: !1903)
!1931 = !DILocation(line: 0, scope: !1875, inlinedAt: !1932)
!1932 = distinct !DILocation(line: 91, column: 32, scope: !1925, inlinedAt: !1903)
!1933 = !DILocation(line: 43, column: 14, scope: !1875, inlinedAt: !1932)
!1934 = !DILocation(line: 91, column: 17, scope: !1925, inlinedAt: !1903)
!1935 = !DILocation(line: 91, column: 25, scope: !1925, inlinedAt: !1903)
!1936 = !DILocation(line: 91, column: 30, scope: !1925, inlinedAt: !1903)
!1937 = !DILocation(line: 90, column: 9, scope: !1923, inlinedAt: !1903)
!1938 = distinct !{!1938, !1916, !1939, !297}
!1939 = !DILocation(line: 92, column: 9, scope: !1917, inlinedAt: !1903)
!1940 = !DILocation(line: 89, column: 28, scope: !1914, inlinedAt: !1903)
!1941 = !DILocation(line: 89, column: 5, scope: !1914, inlinedAt: !1903)
!1942 = distinct !{!1942, !1915, !1943, !297}
!1943 = !DILocation(line: 93, column: 5, scope: !1909, inlinedAt: !1903)
!1944 = !DILocation(line: 482, column: 22, scope: !1801)
!1945 = !DILocation(line: 482, column: 18, scope: !1801)
!1946 = !DILocation(line: 482, column: 32, scope: !1801)
!1947 = !DILocation(line: 482, column: 61, scope: !1801)
!1948 = !DILocation(line: 482, column: 57, scope: !1801)
!1949 = !DILocation(line: 482, column: 9, scope: !1801)
!1950 = !DILocation(line: 478, column: 39, scope: !1794)
!1951 = !DILocation(line: 478, column: 5, scope: !1794)
!1952 = distinct !{!1952, !1795, !1953, !297}
!1953 = !DILocation(line: 483, column: 5, scope: !1789)
!1954 = !DILocation(line: 34, scope: !1797, inlinedAt: !1799)
!1955 = !DILocalVariable(name: "m", arg: 1, scope: !1798, file: !68, line: 32, type: !90)
!1956 = !DILocation(line: 0, scope: !1798, inlinedAt: !1799)
!1957 = !DILocalVariable(name: "i", scope: !1798, file: !68, line: 33, type: !86)
!1958 = !DILocation(line: 34, column: 19, scope: !1959, inlinedAt: !1799)
!1959 = distinct !DILexicalBlock(scope: !1797, file: !68, line: 34, column: 5)
!1960 = !DILocation(line: 35, column: 20, scope: !1961, inlinedAt: !1799)
!1961 = distinct !DILexicalBlock(scope: !1959, file: !68, line: 34, column: 44)
!1962 = !DILocation(line: 35, column: 31, scope: !1961, inlinedAt: !1799)
!1963 = !DILocation(line: 35, column: 27, scope: !1961, inlinedAt: !1799)
!1964 = !DILocation(line: 35, column: 36, scope: !1961, inlinedAt: !1799)
!1965 = !DILocation(line: 35, column: 24, scope: !1961, inlinedAt: !1799)
!1966 = !DILocation(line: 35, column: 9, scope: !1961, inlinedAt: !1799)
!1967 = !DILocation(line: 35, column: 17, scope: !1961, inlinedAt: !1799)
!1968 = !DILocation(line: 34, column: 31, scope: !1959, inlinedAt: !1799)
!1969 = !DILocation(line: 34, column: 38, scope: !1959, inlinedAt: !1799)
!1970 = !DILocation(line: 34, column: 5, scope: !1959, inlinedAt: !1799)
!1971 = distinct !{!1971, !1796, !1972, !297}
!1972 = !DILocation(line: 36, column: 5, scope: !1797, inlinedAt: !1799)
!1973 = !DILocation(line: 486, column: 34, scope: !863)
!1974 = !DILocation(line: 486, column: 5, scope: !863)
!1975 = !DILocation(line: 487, column: 13, scope: !863)
!1976 = !DILocation(line: 487, column: 5, scope: !863)
!1977 = !DILabel(scope: !863, name: "err", file: !68, line: 489)
!1978 = !DILocation(line: 489, column: 1, scope: !863)
!1979 = !DILocation(line: 490, column: 5, scope: !863)
!1980 = !DILocation(line: 491, column: 5, scope: !863)
!1981 = !DILocation(line: 492, column: 5, scope: !863)
!1982 = !DILocation(line: 493, column: 5, scope: !863)
!1983 = !DILocation(line: 494, column: 26, scope: !863)
!1984 = !DILocation(line: 494, column: 5, scope: !863)
!1985 = !DILocation(line: 495, column: 5, scope: !863)
!1986 = !DILocation(line: 496, column: 5, scope: !863)
!1987 = !DILocation(line: 497, column: 5, scope: !863)
!1988 = !DILocation(line: 498, column: 5, scope: !863)
!1989 = !DILocation(line: 499, column: 5, scope: !863)
!1990 = distinct !DISubprogram(name: "compute_rhs", scope: !68, file: !68, line: 43, type: !1991, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1991 = !DISubroutineType(types: !1992)
!1992 = !{null, !193, !52, !90, !61}
!1993 = !DILocalVariable(name: "p", arg: 1, scope: !1990, file: !68, line: 43, type: !193)
!1994 = !DILocation(line: 0, scope: !1990)
!1995 = !DILocalVariable(name: "vPv", arg: 2, scope: !1990, file: !68, line: 43, type: !52)
!1996 = !DILocalVariable(name: "t", arg: 3, scope: !1990, file: !68, line: 43, type: !90)
!1997 = !DILocalVariable(name: "y", arg: 4, scope: !1990, file: !68, line: 43, type: !61)
!1998 = !DILocalVariable(name: "top_pos", scope: !1990, file: !68, line: 48, type: !1999)
!1999 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !58)
!2000 = !DILocalVariable(name: "m_vec_limbs", scope: !1990, file: !68, line: 49, type: !1999)
!2001 = !DILocalVariable(name: "temp", scope: !1990, file: !68, line: 62, type: !278)
!2002 = !DILocation(line: 62, column: 14, scope: !1990)
!2003 = !DILocalVariable(name: "temp_bytes", scope: !1990, file: !68, line: 63, type: !61)
!2004 = !DILocalVariable(name: "i", scope: !2005, file: !68, line: 64, type: !86)
!2005 = distinct !DILexicalBlock(scope: !1990, file: !68, line: 64, column: 5)
!2006 = !DILocation(line: 0, scope: !2005)
!2007 = !DILocation(line: 64, column: 10, scope: !2005)
!2008 = !DILocation(line: 64, scope: !2005)
!2009 = !DILocation(line: 64, column: 36, scope: !2010)
!2010 = distinct !DILexicalBlock(scope: !2005, file: !68, line: 64, column: 5)
!2011 = !DILocation(line: 64, column: 5, scope: !2005)
!2012 = !DILocation(line: 65, column: 9, scope: !2013)
!2013 = distinct !DILexicalBlock(scope: !2014, file: !68, line: 65, column: 9)
!2014 = distinct !DILexicalBlock(scope: !2010, file: !68, line: 64, column: 48)
!2015 = !DILocation(line: 99, column: 5, scope: !2016)
!2016 = distinct !DILexicalBlock(scope: !1990, file: !68, line: 99, column: 5)
!2017 = !DILocation(line: 65, scope: !2013)
!2018 = !DILocalVariable(name: "j", scope: !2013, file: !68, line: 65, type: !86)
!2019 = !DILocation(line: 0, scope: !2013)
!2020 = !DILocation(line: 65, column: 27, scope: !2021)
!2021 = distinct !DILexicalBlock(scope: !2013, file: !68, line: 65, column: 9)
!2022 = !DILocation(line: 67, column: 34, scope: !2023)
!2023 = distinct !DILexicalBlock(scope: !2021, file: !68, line: 65, column: 46)
!2024 = !DILocation(line: 67, column: 54, scope: !2023)
!2025 = !DILocalVariable(name: "top", scope: !2023, file: !68, line: 67, type: !51)
!2026 = !DILocation(line: 0, scope: !2023)
!2027 = !DILocation(line: 68, column: 13, scope: !2023)
!2028 = !DILocation(line: 68, column: 33, scope: !2023)
!2029 = !DILocalVariable(name: "k", scope: !2030, file: !68, line: 69, type: !86)
!2030 = distinct !DILexicalBlock(scope: !2023, file: !68, line: 69, column: 13)
!2031 = !DILocation(line: 0, scope: !2030)
!2032 = !DILocation(line: 69, column: 17, scope: !2030)
!2033 = !DILocation(line: 69, scope: !2030)
!2034 = !DILocation(line: 69, column: 43, scope: !2035)
!2035 = distinct !DILexicalBlock(scope: !2030, file: !68, line: 69, column: 13)
!2036 = !DILocation(line: 69, column: 13, scope: !2030)
!2037 = !DILocation(line: 67, column: 33, scope: !2023)
!2038 = !DILocation(line: 74, column: 13, scope: !2039)
!2039 = distinct !DILexicalBlock(scope: !2023, file: !68, line: 74, column: 13)
!2040 = !DILocation(line: 70, column: 30, scope: !2041)
!2041 = distinct !DILexicalBlock(scope: !2035, file: !68, line: 69, column: 52)
!2042 = !DILocation(line: 70, column: 38, scope: !2041)
!2043 = !DILocation(line: 70, column: 23, scope: !2041)
!2044 = !DILocation(line: 70, column: 17, scope: !2041)
!2045 = !DILocation(line: 70, column: 27, scope: !2041)
!2046 = !DILocation(line: 71, column: 17, scope: !2041)
!2047 = !DILocation(line: 71, column: 25, scope: !2041)
!2048 = !DILocation(line: 69, column: 49, scope: !2035)
!2049 = !DILocation(line: 69, column: 13, scope: !2035)
!2050 = distinct !{!2050, !2036, !2051, !297}
!2051 = !DILocation(line: 72, column: 13, scope: !2030)
!2052 = !DILocation(line: 74, scope: !2039)
!2053 = !DILocalVariable(name: "jj", scope: !2039, file: !68, line: 74, type: !86)
!2054 = !DILocation(line: 0, scope: !2039)
!2055 = !DILocation(line: 74, column: 33, scope: !2056)
!2056 = distinct !DILexicalBlock(scope: !2039, file: !68, line: 74, column: 13)
!2057 = !DILocation(line: 92, column: 13, scope: !2058)
!2058 = distinct !DILexicalBlock(scope: !2023, file: !68, line: 92, column: 13)
!2059 = !DILocation(line: 75, column: 22, scope: !2060)
!2060 = distinct !DILexicalBlock(scope: !2061, file: !68, line: 75, column: 20)
!2061 = distinct !DILexicalBlock(scope: !2056, file: !68, line: 74, column: 53)
!2062 = !DILocation(line: 75, column: 25, scope: !2060)
!2063 = !DILocation(line: 79, column: 52, scope: !2064)
!2064 = distinct !DILexicalBlock(scope: !2060, file: !68, line: 75, column: 30)
!2065 = !DILocation(line: 0, scope: !1522, inlinedAt: !2066)
!2066 = distinct !DILocation(line: 79, column: 41, scope: !2064)
!2067 = !DILocation(line: 13, column: 10, scope: !1522, inlinedAt: !2066)
!2068 = !DILocation(line: 13, column: 7, scope: !1522, inlinedAt: !2066)
!2069 = !DILocation(line: 16, column: 17, scope: !1522, inlinedAt: !2066)
!2070 = !DILocation(line: 17, column: 13, scope: !1522, inlinedAt: !2066)
!2071 = !DILocation(line: 17, column: 17, scope: !1522, inlinedAt: !2066)
!2072 = !DILocation(line: 17, column: 7, scope: !1522, inlinedAt: !2066)
!2073 = !DILocation(line: 18, column: 13, scope: !1522, inlinedAt: !2066)
!2074 = !DILocation(line: 18, column: 17, scope: !1522, inlinedAt: !2066)
!2075 = !DILocation(line: 18, column: 7, scope: !1522, inlinedAt: !2066)
!2076 = !DILocation(line: 19, column: 13, scope: !1522, inlinedAt: !2066)
!2077 = !DILocation(line: 19, column: 17, scope: !1522, inlinedAt: !2066)
!2078 = !DILocation(line: 19, column: 7, scope: !1522, inlinedAt: !2066)
!2079 = !DILocation(line: 23, column: 37, scope: !1522, inlinedAt: !2066)
!2080 = !DILocation(line: 23, column: 52, scope: !1522, inlinedAt: !2066)
!2081 = !DILocation(line: 23, column: 43, scope: !1522, inlinedAt: !2066)
!2082 = !DILocation(line: 23, column: 59, scope: !1522, inlinedAt: !2066)
!2083 = !DILocation(line: 79, column: 34, scope: !2064)
!2084 = !DILocation(line: 79, column: 21, scope: !2064)
!2085 = !DILocation(line: 79, column: 38, scope: !2064)
!2086 = !DILocation(line: 81, column: 17, scope: !2064)
!2087 = !DILocation(line: 86, column: 52, scope: !2088)
!2088 = distinct !DILexicalBlock(scope: !2060, file: !68, line: 82, column: 22)
!2089 = !DILocation(line: 0, scope: !1522, inlinedAt: !2090)
!2090 = distinct !DILocation(line: 86, column: 41, scope: !2088)
!2091 = !DILocation(line: 13, column: 10, scope: !1522, inlinedAt: !2090)
!2092 = !DILocation(line: 13, column: 7, scope: !1522, inlinedAt: !2090)
!2093 = !DILocation(line: 16, column: 17, scope: !1522, inlinedAt: !2090)
!2094 = !DILocation(line: 17, column: 13, scope: !1522, inlinedAt: !2090)
!2095 = !DILocation(line: 17, column: 17, scope: !1522, inlinedAt: !2090)
!2096 = !DILocation(line: 17, column: 7, scope: !1522, inlinedAt: !2090)
!2097 = !DILocation(line: 18, column: 13, scope: !1522, inlinedAt: !2090)
!2098 = !DILocation(line: 18, column: 17, scope: !1522, inlinedAt: !2090)
!2099 = !DILocation(line: 18, column: 7, scope: !1522, inlinedAt: !2090)
!2100 = !DILocation(line: 19, column: 13, scope: !1522, inlinedAt: !2090)
!2101 = !DILocation(line: 19, column: 17, scope: !1522, inlinedAt: !2090)
!2102 = !DILocation(line: 19, column: 7, scope: !1522, inlinedAt: !2090)
!2103 = !DILocation(line: 23, column: 37, scope: !1522, inlinedAt: !2090)
!2104 = !DILocation(line: 23, column: 52, scope: !1522, inlinedAt: !2090)
!2105 = !DILocation(line: 23, column: 43, scope: !1522, inlinedAt: !2090)
!2106 = !DILocation(line: 23, column: 59, scope: !1522, inlinedAt: !2090)
!2107 = !DILocation(line: 86, column: 73, scope: !2088)
!2108 = !DILocation(line: 86, column: 34, scope: !2088)
!2109 = !DILocation(line: 86, column: 21, scope: !2088)
!2110 = !DILocation(line: 86, column: 38, scope: !2088)
!2111 = !DILocation(line: 74, column: 49, scope: !2056)
!2112 = !DILocation(line: 74, column: 13, scope: !2056)
!2113 = distinct !{!2113, !2038, !2114, !297}
!2114 = !DILocation(line: 89, column: 13, scope: !2039)
!2115 = !DILocation(line: 92, scope: !2058)
!2116 = !DILocalVariable(name: "k", scope: !2058, file: !68, line: 92, type: !58)
!2117 = !DILocation(line: 0, scope: !2058)
!2118 = !DILocation(line: 92, column: 31, scope: !2119)
!2119 = distinct !DILexicalBlock(scope: !2058, file: !68, line: 92, column: 13)
!2120 = !DILocation(line: 93, column: 54, scope: !2121)
!2121 = distinct !DILexicalBlock(scope: !2119, file: !68, line: 92, column: 51)
!2122 = !DILocation(line: 93, column: 68, scope: !2121)
!2123 = !DILocation(line: 93, column: 28, scope: !2121)
!2124 = !DILocation(line: 93, column: 78, scope: !2121)
!2125 = !DILocation(line: 93, column: 109, scope: !2121)
!2126 = !DILocation(line: 93, column: 123, scope: !2121)
!2127 = !DILocation(line: 93, column: 83, scope: !2121)
!2128 = !DILocation(line: 93, column: 82, scope: !2121)
!2129 = !DILocation(line: 93, column: 73, scope: !2121)
!2130 = !DILocation(line: 93, column: 17, scope: !2121)
!2131 = !DILocation(line: 93, column: 25, scope: !2121)
!2132 = !DILocation(line: 92, column: 48, scope: !2119)
!2133 = !DILocation(line: 92, column: 13, scope: !2119)
!2134 = distinct !{!2134, !2057, !2135, !297}
!2135 = !DILocation(line: 94, column: 13, scope: !2058)
!2136 = !DILocation(line: 65, column: 42, scope: !2021)
!2137 = !DILocation(line: 65, column: 9, scope: !2021)
!2138 = distinct !{!2138, !2012, !2139, !297}
!2139 = !DILocation(line: 95, column: 9, scope: !2013)
!2140 = !DILocation(line: 64, column: 44, scope: !2010)
!2141 = !DILocation(line: 64, column: 5, scope: !2010)
!2142 = distinct !{!2142, !2011, !2143, !297}
!2143 = !DILocation(line: 96, column: 5, scope: !2005)
!2144 = !DILocation(line: 99, scope: !2016)
!2145 = !DILocalVariable(name: "i", scope: !2016, file: !68, line: 99, type: !86)
!2146 = !DILocation(line: 0, scope: !2016)
!2147 = !DILocation(line: 99, column: 23, scope: !2148)
!2148 = distinct !DILexicalBlock(scope: !2016, file: !68, line: 99, column: 5)
!2149 = !DILocation(line: 105, column: 18, scope: !2150)
!2150 = distinct !DILexicalBlock(scope: !2148, file: !68, line: 100, column: 5)
!2151 = !DILocation(line: 105, column: 40, scope: !2150)
!2152 = !DILocation(line: 105, column: 28, scope: !2150)
!2153 = !DILocation(line: 105, column: 44, scope: !2150)
!2154 = !DILocation(line: 105, column: 25, scope: !2150)
!2155 = !DILocation(line: 105, column: 9, scope: !2150)
!2156 = !DILocation(line: 105, column: 16, scope: !2150)
!2157 = !DILocation(line: 106, column: 21, scope: !2150)
!2158 = !DILocation(line: 106, column: 18, scope: !2150)
!2159 = !DILocation(line: 106, column: 40, scope: !2150)
!2160 = !DILocation(line: 106, column: 28, scope: !2150)
!2161 = !DILocation(line: 106, column: 44, scope: !2150)
!2162 = !DILocation(line: 106, column: 25, scope: !2150)
!2163 = !DILocation(line: 106, column: 12, scope: !2150)
!2164 = !DILocation(line: 106, column: 9, scope: !2150)
!2165 = !DILocation(line: 106, column: 16, scope: !2150)
!2166 = !DILocation(line: 99, column: 38, scope: !2148)
!2167 = !DILocation(line: 99, column: 5, scope: !2148)
!2168 = distinct !{!2168, !2015, !2169, !297}
!2169 = !DILocation(line: 108, column: 5, scope: !2016)
!2170 = !DILocation(line: 109, column: 1, scope: !1990)
!2171 = distinct !DISubprogram(name: "pqmayo_MAYO_2_ref_mayo_sign", scope: !68, file: !68, line: 502, type: !335, scopeLine: 504, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2172 = !DILocalVariable(name: "p", arg: 1, scope: !2171, file: !68, line: 502, type: !193)
!2173 = !DILocation(line: 0, scope: !2171)
!2174 = !DILocalVariable(name: "sm", arg: 2, scope: !2171, file: !68, line: 502, type: !61)
!2175 = !DILocalVariable(name: "smlen", arg: 3, scope: !2171, file: !68, line: 503, type: !337)
!2176 = !DILocalVariable(name: "m", arg: 4, scope: !2171, file: !68, line: 503, type: !90)
!2177 = !DILocalVariable(name: "mlen", arg: 5, scope: !2171, file: !68, line: 504, type: !58)
!2178 = !DILocalVariable(name: "csk", arg: 6, scope: !2171, file: !68, line: 504, type: !90)
!2179 = !DILocalVariable(name: "ret", scope: !2171, file: !68, line: 505, type: !86)
!2180 = !DILocalVariable(name: "param_sig_bytes", scope: !2171, file: !68, line: 506, type: !275)
!2181 = !DILocation(line: 508, column: 16, scope: !2171)
!2182 = !DILocation(line: 508, column: 5, scope: !2171)
!2183 = !DILocation(line: 509, column: 50, scope: !2171)
!2184 = !DILocalVariable(name: "siglen", scope: !2171, file: !68, line: 507, type: !58)
!2185 = !DILocation(line: 509, column: 11, scope: !2171)
!2186 = !DILocation(line: 510, column: 13, scope: !2187)
!2187 = distinct !DILexicalBlock(scope: !2171, file: !68, line: 510, column: 9)
!2188 = !DILocation(line: 510, column: 24, scope: !2187)
!2189 = !DILocation(line: 511, column: 23, scope: !2190)
!2190 = distinct !DILexicalBlock(scope: !2187, file: !68, line: 510, column: 62)
!2191 = !DILocation(line: 511, column: 30, scope: !2190)
!2192 = !DILocation(line: 511, column: 9, scope: !2190)
!2193 = !DILocation(line: 512, column: 9, scope: !2190)
!2194 = !DILocation(line: 515, column: 14, scope: !2171)
!2195 = !DILocation(line: 515, column: 21, scope: !2171)
!2196 = !DILocation(line: 515, column: 12, scope: !2171)
!2197 = !DILocation(line: 515, column: 5, scope: !2171)
!2198 = !DILabel(scope: !2171, name: "err", file: !68, line: 516)
!2199 = !DILocation(line: 516, column: 1, scope: !2171)
!2200 = !DILocation(line: 517, column: 5, scope: !2171)
!2201 = !DILocation(line: 0, scope: !334)
!2202 = !DILocation(line: 524, column: 15, scope: !347)
!2203 = !DILocation(line: 527, column: 36, scope: !334)
!2204 = !DILocation(line: 527, column: 61, scope: !334)
!2205 = !DILocation(line: 527, column: 18, scope: !334)
!2206 = !DILocation(line: 530, column: 16, scope: !353)
!2207 = !DILocation(line: 531, column: 23, scope: !355)
!2208 = !DILocation(line: 531, column: 15, scope: !355)
!2209 = !DILocation(line: 532, column: 23, scope: !355)
!2210 = !DILocation(line: 532, column: 9, scope: !355)
!2211 = !DILocation(line: 533, column: 5, scope: !355)
!2212 = !DILocation(line: 536, column: 1, scope: !334)
!2213 = distinct !DISubprogram(name: "pqmayo_MAYO_2_ref_mayo_verify", scope: !68, file: !68, line: 617, type: !2214, scopeLine: 619, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2214 = !DISubroutineType(types: !2215)
!2215 = !{!86, !193, !90, !58, !90, !90}
!2216 = !DILocalVariable(name: "p", arg: 1, scope: !2213, file: !68, line: 617, type: !193)
!2217 = !DILocation(line: 0, scope: !2213)
!2218 = !DILocalVariable(name: "m", arg: 2, scope: !2213, file: !68, line: 617, type: !90)
!2219 = !DILocalVariable(name: "mlen", arg: 3, scope: !2213, file: !68, line: 618, type: !58)
!2220 = !DILocalVariable(name: "sig", arg: 4, scope: !2213, file: !68, line: 618, type: !90)
!2221 = !DILocalVariable(name: "cpk", arg: 5, scope: !2213, file: !68, line: 619, type: !90)
!2222 = !DILocalVariable(name: "tEnc", scope: !2213, file: !68, line: 620, type: !181)
!2223 = !DILocation(line: 620, column: 19, scope: !2213)
!2224 = !DILocalVariable(name: "t", scope: !2213, file: !68, line: 621, type: !875)
!2225 = !DILocation(line: 621, column: 19, scope: !2213)
!2226 = !DILocalVariable(name: "y", scope: !2213, file: !68, line: 622, type: !2227)
!2227 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 1024, elements: !2228)
!2228 = !{!2229}
!2229 = !DISubrange(count: 128)
!2230 = !DILocation(line: 622, column: 19, scope: !2213)
!2231 = !DILocalVariable(name: "s", scope: !2213, file: !68, line: 623, type: !902)
!2232 = !DILocation(line: 623, column: 19, scope: !2213)
!2233 = !DILocalVariable(name: "pk", scope: !2213, file: !68, line: 624, type: !2234)
!2234 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 850176, elements: !2235)
!2235 = !{!2236}
!2236 = !DISubrange(count: 13284)
!2237 = !DILocation(line: 624, column: 14, scope: !2213)
!2238 = !DILocalVariable(name: "tmp", scope: !2213, file: !68, line: 625, type: !2239)
!2239 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 448, elements: !2240)
!2240 = !{!2241}
!2241 = !DISubrange(count: 56)
!2242 = !DILocation(line: 625, column: 19, scope: !2213)
!2243 = !DILocalVariable(name: "param_m", scope: !2213, file: !68, line: 627, type: !275)
!2244 = !DILocalVariable(name: "param_n", scope: !2213, file: !68, line: 628, type: !275)
!2245 = !DILocalVariable(name: "param_k", scope: !2213, file: !68, line: 629, type: !275)
!2246 = !DILocalVariable(name: "param_m_bytes", scope: !2213, file: !68, line: 630, type: !275)
!2247 = !DILocalVariable(name: "param_sig_bytes", scope: !2213, file: !68, line: 631, type: !275)
!2248 = !DILocalVariable(name: "param_digest_bytes", scope: !2213, file: !68, line: 632, type: !275)
!2249 = !DILocalVariable(name: "param_salt_bytes", scope: !2213, file: !68, line: 633, type: !275)
!2250 = !DILocation(line: 0, scope: !248, inlinedAt: !2251)
!2251 = distinct !DILocation(line: 635, column: 15, scope: !2213)
!2252 = !DILocation(line: 0, scope: !256, inlinedAt: !2253)
!2253 = distinct !DILocation(line: 610, column: 5, scope: !248, inlinedAt: !2251)
!2254 = !DILocation(line: 284, column: 5, scope: !256, inlinedAt: !2253)
!2255 = !DILocation(line: 265, column: 14, scope: !265, inlinedAt: !2256)
!2256 = distinct !DILocation(line: 285, column: 5, scope: !256, inlinedAt: !2253)
!2257 = !DILocation(line: 0, scope: !265, inlinedAt: !2256)
!2258 = !DILocation(line: 0, scope: !280, inlinedAt: !2256)
!2259 = !DILocation(line: 266, column: 10, scope: !280, inlinedAt: !2256)
!2260 = !DILocation(line: 266, column: 28, scope: !284, inlinedAt: !2256)
!2261 = !DILocation(line: 266, column: 5, scope: !280, inlinedAt: !2256)
!2262 = !DILocation(line: 266, scope: !280, inlinedAt: !2256)
!2263 = !DILocation(line: 268, column: 29, scope: !288, inlinedAt: !2256)
!2264 = !DILocation(line: 268, column: 24, scope: !288, inlinedAt: !2256)
!2265 = !DILocation(line: 268, column: 9, scope: !288, inlinedAt: !2256)
!2266 = !DILocation(line: 269, column: 24, scope: !288, inlinedAt: !2256)
!2267 = !DILocation(line: 269, column: 21, scope: !288, inlinedAt: !2256)
!2268 = !DILocation(line: 269, column: 9, scope: !288, inlinedAt: !2256)
!2269 = !DILocation(line: 266, column: 5, scope: !284, inlinedAt: !2256)
!2270 = distinct !{!2270, !2261, !2271, !297}
!2271 = !DILocation(line: 270, column: 5, scope: !280, inlinedAt: !2256)
!2272 = !DILocation(line: 271, column: 1, scope: !265, inlinedAt: !2256)
!2273 = !DILocation(line: 612, column: 23, scope: !248, inlinedAt: !2251)
!2274 = !DILocation(line: 612, column: 72, scope: !248, inlinedAt: !2251)
!2275 = !DILocation(line: 265, column: 14, scope: !265, inlinedAt: !2276)
!2276 = distinct !DILocation(line: 612, column: 5, scope: !248, inlinedAt: !2251)
!2277 = !DILocation(line: 0, scope: !265, inlinedAt: !2276)
!2278 = !DILocation(line: 0, scope: !280, inlinedAt: !2276)
!2279 = !DILocation(line: 266, column: 10, scope: !280, inlinedAt: !2276)
!2280 = !DILocation(line: 266, column: 28, scope: !284, inlinedAt: !2276)
!2281 = !DILocation(line: 266, column: 5, scope: !280, inlinedAt: !2276)
!2282 = !DILocation(line: 266, scope: !280, inlinedAt: !2276)
!2283 = !DILocation(line: 268, column: 29, scope: !288, inlinedAt: !2276)
!2284 = !DILocation(line: 268, column: 24, scope: !288, inlinedAt: !2276)
!2285 = !DILocation(line: 268, column: 9, scope: !288, inlinedAt: !2276)
!2286 = !DILocation(line: 269, column: 24, scope: !288, inlinedAt: !2276)
!2287 = !DILocation(line: 269, column: 21, scope: !288, inlinedAt: !2276)
!2288 = !DILocation(line: 269, column: 9, scope: !288, inlinedAt: !2276)
!2289 = !DILocation(line: 266, column: 5, scope: !284, inlinedAt: !2276)
!2290 = distinct !{!2290, !2281, !2291, !297}
!2291 = !DILocation(line: 270, column: 5, scope: !280, inlinedAt: !2276)
!2292 = !DILocation(line: 271, column: 1, scope: !265, inlinedAt: !2276)
!2293 = !DILocalVariable(name: "ret", scope: !2213, file: !68, line: 635, type: !86)
!2294 = !DILocalVariable(name: "P1", scope: !2213, file: !68, line: 640, type: !52)
!2295 = !DILocation(line: 641, column: 23, scope: !2213)
!2296 = !DILocalVariable(name: "P2", scope: !2213, file: !68, line: 641, type: !52)
!2297 = !DILocalVariable(name: "P3", scope: !2213, file: !68, line: 642, type: !52)
!2298 = !DILocation(line: 657, column: 5, scope: !2213)
!2299 = !DILocation(line: 660, column: 16, scope: !2213)
!2300 = !DILocation(line: 660, column: 60, scope: !2213)
!2301 = !DILocation(line: 660, column: 5, scope: !2213)
!2302 = !DILocation(line: 662, column: 5, scope: !2213)
!2303 = !DILocation(line: 0, scope: !431, inlinedAt: !2304)
!2304 = distinct !DILocation(line: 663, column: 5, scope: !2213)
!2305 = !DILocation(line: 22, column: 10, scope: !440, inlinedAt: !2304)
!2306 = !DILocation(line: 22, scope: !440, inlinedAt: !2304)
!2307 = !DILocation(line: 22, column: 19, scope: !443, inlinedAt: !2304)
!2308 = !DILocation(line: 22, column: 5, scope: !440, inlinedAt: !2304)
!2309 = !DILocation(line: 22, column: 5, scope: !440, inlinedAt: !2310)
!2310 = distinct !DILocation(line: 666, column: 5, scope: !2213)
!2311 = !DILocation(line: 23, column: 19, scope: !446, inlinedAt: !2304)
!2312 = !DILocation(line: 23, column: 24, scope: !446, inlinedAt: !2304)
!2313 = !DILocation(line: 23, column: 14, scope: !446, inlinedAt: !2304)
!2314 = !DILocation(line: 23, column: 17, scope: !446, inlinedAt: !2304)
!2315 = !DILocation(line: 24, column: 24, scope: !446, inlinedAt: !2304)
!2316 = !DILocation(line: 24, column: 17, scope: !446, inlinedAt: !2304)
!2317 = !DILocation(line: 24, column: 14, scope: !446, inlinedAt: !2304)
!2318 = !DILocation(line: 22, column: 34, scope: !443, inlinedAt: !2304)
!2319 = !DILocation(line: 22, column: 5, scope: !443, inlinedAt: !2304)
!2320 = distinct !{!2320, !2308, !2321, !297}
!2321 = !DILocation(line: 25, column: 5, scope: !440, inlinedAt: !2304)
!2322 = !DILocation(line: 22, scope: !440, inlinedAt: !2310)
!2323 = !DILocation(line: 0, scope: !431, inlinedAt: !2310)
!2324 = !DILocation(line: 22, column: 19, scope: !443, inlinedAt: !2310)
!2325 = !DILocation(line: 23, column: 19, scope: !446, inlinedAt: !2310)
!2326 = !DILocation(line: 23, column: 24, scope: !446, inlinedAt: !2310)
!2327 = !DILocation(line: 23, column: 14, scope: !446, inlinedAt: !2310)
!2328 = !DILocation(line: 23, column: 17, scope: !446, inlinedAt: !2310)
!2329 = !DILocation(line: 24, column: 24, scope: !446, inlinedAt: !2310)
!2330 = !DILocation(line: 24, column: 17, scope: !446, inlinedAt: !2310)
!2331 = !DILocation(line: 24, column: 14, scope: !446, inlinedAt: !2310)
!2332 = !DILocation(line: 22, column: 34, scope: !443, inlinedAt: !2310)
!2333 = !DILocation(line: 22, column: 5, scope: !443, inlinedAt: !2310)
!2334 = distinct !{!2334, !2309, !2335, !297}
!2335 = !DILocation(line: 25, column: 5, scope: !440, inlinedAt: !2310)
!2336 = !DILocation(line: 289, column: 14, scope: !2337, inlinedAt: !2340)
!2337 = distinct !DISubprogram(name: "eval_public_map", scope: !68, file: !68, line: 288, type: !2338, scopeLine: 288, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2338 = !DISubroutineType(types: !2339)
!2339 = !{null, !193, !90, !483, !483, !483, !61}
!2340 = distinct !DILocation(line: 668, column: 5, scope: !2213)
!2341 = !DILocalVariable(name: "p", arg: 1, scope: !2337, file: !68, line: 288, type: !193)
!2342 = !DILocation(line: 0, scope: !2337, inlinedAt: !2340)
!2343 = !DILocalVariable(name: "s", arg: 2, scope: !2337, file: !68, line: 288, type: !90)
!2344 = !DILocalVariable(name: "P1", arg: 3, scope: !2337, file: !68, line: 288, type: !483)
!2345 = !DILocalVariable(name: "P2", arg: 4, scope: !2337, file: !68, line: 288, type: !483)
!2346 = !DILocalVariable(name: "P3", arg: 5, scope: !2337, file: !68, line: 288, type: !483)
!2347 = !DILocalVariable(name: "eval", arg: 6, scope: !2337, file: !68, line: 288, type: !61)
!2348 = !DILocalVariable(name: "SPS", scope: !2337, file: !68, line: 289, type: !2349)
!2349 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 4096, elements: !876)
!2350 = !DILocation(line: 286, column: 14, scope: !2351, inlinedAt: !2354)
!2351 = distinct !DISubprogram(name: "m_calculate_PS_SPS", scope: !480, file: !480, line: 277, type: !2352, scopeLine: 278, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2352 = !DISubroutineType(types: !2353)
!2353 = !{null, !193, !483, !483, !483, !90, !52}
!2354 = distinct !DILocation(line: 291, column: 5, scope: !2337, inlinedAt: !2340)
!2355 = !DILocalVariable(name: "p", arg: 1, scope: !2351, file: !480, line: 277, type: !193)
!2356 = !DILocation(line: 0, scope: !2351, inlinedAt: !2354)
!2357 = !DILocalVariable(name: "P1", arg: 2, scope: !2351, file: !480, line: 277, type: !483)
!2358 = !DILocalVariable(name: "P2", arg: 3, scope: !2351, file: !480, line: 277, type: !483)
!2359 = !DILocalVariable(name: "P3", arg: 4, scope: !2351, file: !480, line: 277, type: !483)
!2360 = !DILocalVariable(name: "s", arg: 5, scope: !2351, file: !480, line: 277, type: !90)
!2361 = !DILocalVariable(name: "SPS", arg: 6, scope: !2351, file: !480, line: 278, type: !52)
!2362 = !DILocalVariable(name: "PS", scope: !2351, file: !480, line: 286, type: !2363)
!2363 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 82944, elements: !2364)
!2364 = !{!2365}
!2365 = !DISubrange(count: 1296)
!2366 = !DILocation(line: 157, column: 14, scope: !2367, inlinedAt: !2370)
!2367 = distinct !DISubprogram(name: "mayo_generic_m_calculate_PS", scope: !480, file: !480, line: 151, type: !2368, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2368 = !DISubroutineType(types: !2369)
!2369 = !{null, !483, !483, !483, !90, !275, !275, !275, !275, !52}
!2370 = distinct !DILocation(line: 287, column: 5, scope: !2351, inlinedAt: !2354)
!2371 = !DILocalVariable(name: "P1", arg: 1, scope: !2367, file: !480, line: 151, type: !483)
!2372 = !DILocation(line: 0, scope: !2367, inlinedAt: !2370)
!2373 = !DILocalVariable(name: "P2", arg: 2, scope: !2367, file: !480, line: 151, type: !483)
!2374 = !DILocalVariable(name: "P3", arg: 3, scope: !2367, file: !480, line: 151, type: !483)
!2375 = !DILocalVariable(name: "S", arg: 4, scope: !2367, file: !480, line: 151, type: !90)
!2376 = !DILocalVariable(name: "m", arg: 5, scope: !2367, file: !480, line: 152, type: !275)
!2377 = !DILocalVariable(name: "v", arg: 6, scope: !2367, file: !480, line: 152, type: !275)
!2378 = !DILocalVariable(name: "o", arg: 7, scope: !2367, file: !480, line: 152, type: !275)
!2379 = !DILocalVariable(name: "k", arg: 8, scope: !2367, file: !480, line: 152, type: !275)
!2380 = !DILocalVariable(name: "PS", arg: 9, scope: !2367, file: !480, line: 152, type: !52)
!2381 = !DILocalVariable(name: "n", scope: !2367, file: !480, line: 154, type: !275)
!2382 = !DILocalVariable(name: "m_vec_limbs", scope: !2367, file: !480, line: 155, type: !275)
!2383 = !DILocalVariable(name: "accumulator", scope: !2367, file: !480, line: 157, type: !2384)
!2384 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 1327104, elements: !2385)
!2385 = !{!2386}
!2386 = !DISubrange(count: 20736)
!2387 = !DILocalVariable(name: "P1_used", scope: !2367, file: !480, line: 158, type: !86)
!2388 = !DILocalVariable(name: "row", scope: !2389, file: !480, line: 159, type: !86)
!2389 = distinct !DILexicalBlock(scope: !2367, file: !480, line: 159, column: 5)
!2390 = !DILocation(line: 0, scope: !2389, inlinedAt: !2370)
!2391 = !DILocation(line: 159, column: 10, scope: !2389, inlinedAt: !2370)
!2392 = !DILocation(line: 158, column: 9, scope: !2367, inlinedAt: !2370)
!2393 = !DILocation(line: 159, scope: !2389, inlinedAt: !2370)
!2394 = !DILocation(line: 159, column: 27, scope: !2395, inlinedAt: !2370)
!2395 = distinct !DILexicalBlock(scope: !2389, file: !480, line: 159, column: 5)
!2396 = !DILocation(line: 159, column: 5, scope: !2389, inlinedAt: !2370)
!2397 = !DILocation(line: 160, column: 9, scope: !2398, inlinedAt: !2370)
!2398 = distinct !DILexicalBlock(scope: !2399, file: !480, line: 160, column: 9)
!2399 = distinct !DILexicalBlock(scope: !2395, file: !480, line: 159, column: 39)
!2400 = !DILocation(line: 642, column: 23, scope: !2213)
!2401 = !DILocation(line: 175, column: 5, scope: !2402, inlinedAt: !2370)
!2402 = distinct !DILexicalBlock(scope: !2367, file: !480, line: 175, column: 5)
!2403 = !DILocation(line: 160, scope: !2398, inlinedAt: !2370)
!2404 = !DILocalVariable(name: "j", scope: !2398, file: !480, line: 160, type: !86)
!2405 = !DILocation(line: 0, scope: !2398, inlinedAt: !2370)
!2406 = !DILocation(line: 160, column: 29, scope: !2407, inlinedAt: !2370)
!2407 = distinct !DILexicalBlock(scope: !2398, file: !480, line: 160, column: 9)
!2408 = !DILocation(line: 167, column: 9, scope: !2409, inlinedAt: !2370)
!2409 = distinct !DILexicalBlock(scope: !2399, file: !480, line: 167, column: 9)
!2410 = !DILocation(line: 161, column: 13, scope: !2411, inlinedAt: !2370)
!2411 = distinct !DILexicalBlock(scope: !2412, file: !480, line: 161, column: 13)
!2412 = distinct !DILexicalBlock(scope: !2407, file: !480, line: 160, column: 39)
!2413 = !DILocation(line: 161, scope: !2411, inlinedAt: !2370)
!2414 = !DILocalVariable(name: "col", scope: !2411, file: !480, line: 161, type: !86)
!2415 = !DILocation(line: 0, scope: !2411, inlinedAt: !2370)
!2416 = !DILocation(line: 161, column: 35, scope: !2417, inlinedAt: !2370)
!2417 = distinct !DILexicalBlock(scope: !2411, file: !480, line: 161, column: 13)
!2418 = !DILocation(line: 162, column: 43, scope: !2419, inlinedAt: !2370)
!2419 = distinct !DILexicalBlock(scope: !2417, file: !480, line: 161, column: 47)
!2420 = !DILocation(line: 162, column: 102, scope: !2419, inlinedAt: !2370)
!2421 = !DILocation(line: 162, column: 115, scope: !2419, inlinedAt: !2370)
!2422 = !DILocation(line: 162, column: 109, scope: !2419, inlinedAt: !2370)
!2423 = !DILocation(line: 162, column: 107, scope: !2419, inlinedAt: !2370)
!2424 = !DILocation(line: 162, column: 82, scope: !2419, inlinedAt: !2370)
!2425 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2426, file: !655, line: 22, type: !86)
!2426 = distinct !DISubprogram(name: "m_vec_add", scope: !655, file: !655, line: 22, type: !2427, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2427 = !DISubroutineType(types: !2428)
!2428 = !{null, !86, !483, !52}
!2429 = !DILocation(line: 0, scope: !2426, inlinedAt: !2430)
!2430 = distinct !DILocation(line: 162, column: 17, scope: !2419, inlinedAt: !2370)
!2431 = !DILocalVariable(name: "in", arg: 2, scope: !2426, file: !655, line: 22, type: !483)
!2432 = !DILocalVariable(name: "acc", arg: 3, scope: !2426, file: !655, line: 22, type: !52)
!2433 = !DILocalVariable(name: "i", scope: !2434, file: !655, line: 24, type: !58)
!2434 = distinct !DILexicalBlock(scope: !2426, file: !655, line: 24, column: 5)
!2435 = !DILocation(line: 0, scope: !2434, inlinedAt: !2430)
!2436 = !DILocation(line: 24, column: 10, scope: !2434, inlinedAt: !2430)
!2437 = !DILocation(line: 24, scope: !2434, inlinedAt: !2430)
!2438 = !DILocation(line: 24, column: 26, scope: !2439, inlinedAt: !2430)
!2439 = distinct !DILexicalBlock(scope: !2434, file: !655, line: 24, column: 5)
!2440 = !DILocation(line: 24, column: 5, scope: !2434, inlinedAt: !2430)
!2441 = !DILocation(line: 26, column: 19, scope: !2442, inlinedAt: !2430)
!2442 = distinct !DILexicalBlock(scope: !2439, file: !655, line: 25, column: 5)
!2443 = !DILocation(line: 26, column: 9, scope: !2442, inlinedAt: !2430)
!2444 = !DILocation(line: 26, column: 16, scope: !2442, inlinedAt: !2430)
!2445 = !DILocation(line: 24, column: 46, scope: !2439, inlinedAt: !2430)
!2446 = !DILocation(line: 24, column: 5, scope: !2439, inlinedAt: !2430)
!2447 = distinct !{!2447, !2440, !2448, !297}
!2448 = !DILocation(line: 27, column: 5, scope: !2434, inlinedAt: !2430)
!2449 = !DILocation(line: 161, column: 43, scope: !2417, inlinedAt: !2370)
!2450 = !DILocation(line: 161, column: 13, scope: !2417, inlinedAt: !2370)
!2451 = distinct !{!2451, !2410, !2452, !297}
!2452 = !DILocation(line: 163, column: 13, scope: !2411, inlinedAt: !2370)
!2453 = !DILocation(line: 164, column: 21, scope: !2412, inlinedAt: !2370)
!2454 = !DILocation(line: 160, column: 35, scope: !2407, inlinedAt: !2370)
!2455 = !DILocation(line: 160, column: 9, scope: !2407, inlinedAt: !2370)
!2456 = distinct !{!2456, !2397, !2457, !297}
!2457 = !DILocation(line: 165, column: 9, scope: !2398, inlinedAt: !2370)
!2458 = !DILocation(line: 167, scope: !2409, inlinedAt: !2370)
!2459 = !DILocalVariable(name: "j", scope: !2409, file: !480, line: 167, type: !86)
!2460 = !DILocation(line: 0, scope: !2409, inlinedAt: !2370)
!2461 = !DILocation(line: 167, column: 27, scope: !2462, inlinedAt: !2370)
!2462 = distinct !DILexicalBlock(scope: !2409, file: !480, line: 167, column: 9)
!2463 = !DILocation(line: 168, column: 13, scope: !2464, inlinedAt: !2370)
!2464 = distinct !DILexicalBlock(scope: !2465, file: !480, line: 168, column: 13)
!2465 = distinct !DILexicalBlock(scope: !2462, file: !480, line: 167, column: 37)
!2466 = !DILocation(line: 168, scope: !2464, inlinedAt: !2370)
!2467 = !DILocalVariable(name: "col", scope: !2464, file: !480, line: 168, type: !86)
!2468 = !DILocation(line: 0, scope: !2464, inlinedAt: !2370)
!2469 = !DILocation(line: 168, column: 35, scope: !2470, inlinedAt: !2370)
!2470 = distinct !DILexicalBlock(scope: !2464, file: !480, line: 168, column: 13)
!2471 = !DILocation(line: 169, column: 50, scope: !2472, inlinedAt: !2370)
!2472 = distinct !DILexicalBlock(scope: !2470, file: !480, line: 168, column: 47)
!2473 = !DILocation(line: 169, column: 54, scope: !2472, inlinedAt: !2370)
!2474 = !DILocation(line: 169, column: 43, scope: !2472, inlinedAt: !2370)
!2475 = !DILocation(line: 169, column: 104, scope: !2472, inlinedAt: !2370)
!2476 = !DILocation(line: 169, column: 118, scope: !2472, inlinedAt: !2370)
!2477 = !DILocation(line: 169, column: 111, scope: !2472, inlinedAt: !2370)
!2478 = !DILocation(line: 169, column: 109, scope: !2472, inlinedAt: !2370)
!2479 = !DILocation(line: 169, column: 84, scope: !2472, inlinedAt: !2370)
!2480 = !DILocation(line: 0, scope: !2426, inlinedAt: !2481)
!2481 = distinct !DILocation(line: 169, column: 17, scope: !2472, inlinedAt: !2370)
!2482 = !DILocation(line: 0, scope: !2434, inlinedAt: !2481)
!2483 = !DILocation(line: 24, column: 10, scope: !2434, inlinedAt: !2481)
!2484 = !DILocation(line: 24, scope: !2434, inlinedAt: !2481)
!2485 = !DILocation(line: 24, column: 26, scope: !2439, inlinedAt: !2481)
!2486 = !DILocation(line: 24, column: 5, scope: !2434, inlinedAt: !2481)
!2487 = !DILocation(line: 26, column: 19, scope: !2442, inlinedAt: !2481)
!2488 = !DILocation(line: 26, column: 9, scope: !2442, inlinedAt: !2481)
!2489 = !DILocation(line: 26, column: 16, scope: !2442, inlinedAt: !2481)
!2490 = !DILocation(line: 24, column: 46, scope: !2439, inlinedAt: !2481)
!2491 = !DILocation(line: 24, column: 5, scope: !2439, inlinedAt: !2481)
!2492 = distinct !{!2492, !2486, !2493, !297}
!2493 = !DILocation(line: 27, column: 5, scope: !2434, inlinedAt: !2481)
!2494 = !DILocation(line: 168, column: 43, scope: !2470, inlinedAt: !2370)
!2495 = !DILocation(line: 168, column: 13, scope: !2470, inlinedAt: !2370)
!2496 = distinct !{!2496, !2463, !2497, !297}
!2497 = !DILocation(line: 170, column: 13, scope: !2464, inlinedAt: !2370)
!2498 = !DILocation(line: 167, column: 33, scope: !2462, inlinedAt: !2370)
!2499 = !DILocation(line: 167, column: 9, scope: !2462, inlinedAt: !2370)
!2500 = distinct !{!2500, !2408, !2501, !297}
!2501 = !DILocation(line: 171, column: 9, scope: !2409, inlinedAt: !2370)
!2502 = !DILocation(line: 159, column: 35, scope: !2395, inlinedAt: !2370)
!2503 = !DILocation(line: 159, column: 5, scope: !2395, inlinedAt: !2370)
!2504 = distinct !{!2504, !2396, !2505, !297}
!2505 = !DILocation(line: 172, column: 5, scope: !2389, inlinedAt: !2370)
!2506 = !DILocation(line: 174, column: 9, scope: !2367, inlinedAt: !2370)
!2507 = !DILocation(line: 175, scope: !2402, inlinedAt: !2370)
!2508 = !DILocalVariable(name: "row", scope: !2402, file: !480, line: 175, type: !86)
!2509 = !DILocation(line: 0, scope: !2402, inlinedAt: !2370)
!2510 = !DILocalVariable(name: "P3_used", scope: !2367, file: !480, line: 174, type: !86)
!2511 = !DILocation(line: 175, column: 27, scope: !2512, inlinedAt: !2370)
!2512 = distinct !DILexicalBlock(scope: !2402, file: !480, line: 175, column: 5)
!2513 = !DILocation(line: 176, column: 9, scope: !2514, inlinedAt: !2370)
!2514 = distinct !DILexicalBlock(scope: !2515, file: !480, line: 176, column: 9)
!2515 = distinct !DILexicalBlock(scope: !2512, file: !480, line: 175, column: 39)
!2516 = !DILocation(line: 186, column: 5, scope: !2367, inlinedAt: !2370)
!2517 = !DILocation(line: 176, scope: !2514, inlinedAt: !2370)
!2518 = !DILocalVariable(name: "j", scope: !2514, file: !480, line: 176, type: !86)
!2519 = !DILocation(line: 0, scope: !2514, inlinedAt: !2370)
!2520 = !DILocation(line: 176, column: 29, scope: !2521, inlinedAt: !2370)
!2521 = distinct !DILexicalBlock(scope: !2514, file: !480, line: 176, column: 9)
!2522 = !DILocation(line: 177, column: 13, scope: !2523, inlinedAt: !2370)
!2523 = distinct !DILexicalBlock(scope: !2524, file: !480, line: 177, column: 13)
!2524 = distinct !DILexicalBlock(scope: !2521, file: !480, line: 176, column: 39)
!2525 = !DILocation(line: 177, scope: !2523, inlinedAt: !2370)
!2526 = !DILocalVariable(name: "col", scope: !2523, file: !480, line: 177, type: !86)
!2527 = !DILocation(line: 0, scope: !2523, inlinedAt: !2370)
!2528 = !DILocation(line: 177, column: 35, scope: !2529, inlinedAt: !2370)
!2529 = distinct !DILexicalBlock(scope: !2523, file: !480, line: 177, column: 13)
!2530 = !DILocation(line: 178, column: 43, scope: !2531, inlinedAt: !2370)
!2531 = distinct !DILexicalBlock(scope: !2529, file: !480, line: 177, column: 47)
!2532 = !DILocation(line: 178, column: 100, scope: !2531, inlinedAt: !2370)
!2533 = !DILocation(line: 178, column: 113, scope: !2531, inlinedAt: !2370)
!2534 = !DILocation(line: 178, column: 107, scope: !2531, inlinedAt: !2370)
!2535 = !DILocation(line: 178, column: 105, scope: !2531, inlinedAt: !2370)
!2536 = !DILocation(line: 178, column: 80, scope: !2531, inlinedAt: !2370)
!2537 = !DILocation(line: 0, scope: !2426, inlinedAt: !2538)
!2538 = distinct !DILocation(line: 178, column: 17, scope: !2531, inlinedAt: !2370)
!2539 = !DILocation(line: 0, scope: !2434, inlinedAt: !2538)
!2540 = !DILocation(line: 24, column: 10, scope: !2434, inlinedAt: !2538)
!2541 = !DILocation(line: 24, scope: !2434, inlinedAt: !2538)
!2542 = !DILocation(line: 24, column: 26, scope: !2439, inlinedAt: !2538)
!2543 = !DILocation(line: 24, column: 5, scope: !2434, inlinedAt: !2538)
!2544 = !DILocation(line: 26, column: 19, scope: !2442, inlinedAt: !2538)
!2545 = !DILocation(line: 26, column: 9, scope: !2442, inlinedAt: !2538)
!2546 = !DILocation(line: 26, column: 16, scope: !2442, inlinedAt: !2538)
!2547 = !DILocation(line: 24, column: 46, scope: !2439, inlinedAt: !2538)
!2548 = !DILocation(line: 24, column: 5, scope: !2439, inlinedAt: !2538)
!2549 = distinct !{!2549, !2543, !2550, !297}
!2550 = !DILocation(line: 27, column: 5, scope: !2434, inlinedAt: !2538)
!2551 = !DILocation(line: 177, column: 43, scope: !2529, inlinedAt: !2370)
!2552 = !DILocation(line: 177, column: 13, scope: !2529, inlinedAt: !2370)
!2553 = distinct !{!2553, !2522, !2554, !297}
!2554 = !DILocation(line: 179, column: 13, scope: !2523, inlinedAt: !2370)
!2555 = !DILocation(line: 180, column: 21, scope: !2524, inlinedAt: !2370)
!2556 = !DILocation(line: 176, column: 35, scope: !2521, inlinedAt: !2370)
!2557 = !DILocation(line: 176, column: 9, scope: !2521, inlinedAt: !2370)
!2558 = distinct !{!2558, !2513, !2559, !297}
!2559 = !DILocation(line: 181, column: 9, scope: !2514, inlinedAt: !2370)
!2560 = !DILocation(line: 175, column: 35, scope: !2512, inlinedAt: !2370)
!2561 = !DILocation(line: 175, column: 5, scope: !2512, inlinedAt: !2370)
!2562 = distinct !{!2562, !2401, !2563, !297}
!2563 = !DILocation(line: 182, column: 5, scope: !2402, inlinedAt: !2370)
!2564 = !DILocalVariable(name: "i", scope: !2367, file: !480, line: 185, type: !86)
!2565 = !DILocation(line: 186, column: 14, scope: !2367, inlinedAt: !2370)
!2566 = !DILocation(line: 187, column: 54, scope: !2567, inlinedAt: !2370)
!2567 = distinct !DILexicalBlock(scope: !2367, file: !480, line: 186, column: 23)
!2568 = !DILocation(line: 187, column: 81, scope: !2567, inlinedAt: !2370)
!2569 = !DILocation(line: 187, column: 9, scope: !2567, inlinedAt: !2370)
!2570 = !DILocation(line: 188, column: 10, scope: !2567, inlinedAt: !2370)
!2571 = distinct !{!2571, !2516, !2572, !297}
!2572 = !DILocation(line: 189, column: 5, scope: !2367, inlinedAt: !2370)
!2573 = !DILocation(line: 191, column: 1, scope: !2367, inlinedAt: !2370)
!2574 = !DILocation(line: 196, column: 14, scope: !2575, inlinedAt: !2578)
!2575 = distinct !DISubprogram(name: "mayo_generic_m_calculate_SPS", scope: !480, file: !480, line: 195, type: !2576, scopeLine: 195, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2576 = !DISubroutineType(types: !2577)
!2577 = !{null, !483, !90, !86, !86, !86, !52}
!2578 = distinct !DILocation(line: 290, column: 5, scope: !2351, inlinedAt: !2354)
!2579 = !DILocalVariable(name: "PS", arg: 1, scope: !2575, file: !480, line: 195, type: !483)
!2580 = !DILocation(line: 0, scope: !2575, inlinedAt: !2578)
!2581 = !DILocalVariable(name: "S", arg: 2, scope: !2575, file: !480, line: 195, type: !90)
!2582 = !DILocalVariable(name: "m", arg: 3, scope: !2575, file: !480, line: 195, type: !86)
!2583 = !DILocalVariable(name: "k", arg: 4, scope: !2575, file: !480, line: 195, type: !86)
!2584 = !DILocalVariable(name: "n", arg: 5, scope: !2575, file: !480, line: 195, type: !86)
!2585 = !DILocalVariable(name: "SPS", arg: 6, scope: !2575, file: !480, line: 195, type: !52)
!2586 = !DILocalVariable(name: "accumulator", scope: !2575, file: !480, line: 196, type: !1094)
!2587 = !DILocalVariable(name: "m_vec_limbs", scope: !2575, file: !480, line: 197, type: !275)
!2588 = !DILocalVariable(name: "row", scope: !2589, file: !480, line: 198, type: !86)
!2589 = distinct !DILexicalBlock(scope: !2575, file: !480, line: 198, column: 5)
!2590 = !DILocation(line: 0, scope: !2589, inlinedAt: !2578)
!2591 = !DILocation(line: 198, column: 10, scope: !2589, inlinedAt: !2578)
!2592 = !DILocation(line: 198, scope: !2589, inlinedAt: !2578)
!2593 = !DILocation(line: 198, column: 27, scope: !2594, inlinedAt: !2578)
!2594 = distinct !DILexicalBlock(scope: !2589, file: !480, line: 198, column: 5)
!2595 = !DILocation(line: 198, column: 5, scope: !2589, inlinedAt: !2578)
!2596 = !DILocation(line: 199, column: 9, scope: !2597, inlinedAt: !2578)
!2597 = distinct !DILexicalBlock(scope: !2598, file: !480, line: 199, column: 9)
!2598 = distinct !DILexicalBlock(scope: !2594, file: !480, line: 198, column: 39)
!2599 = !DILocation(line: 208, column: 5, scope: !2575, inlinedAt: !2578)
!2600 = !DILocation(line: 199, scope: !2597, inlinedAt: !2578)
!2601 = !DILocalVariable(name: "j", scope: !2597, file: !480, line: 199, type: !86)
!2602 = !DILocation(line: 0, scope: !2597, inlinedAt: !2578)
!2603 = !DILocation(line: 199, column: 27, scope: !2604, inlinedAt: !2578)
!2604 = distinct !DILexicalBlock(scope: !2597, file: !480, line: 199, column: 9)
!2605 = !DILocation(line: 200, column: 13, scope: !2606, inlinedAt: !2578)
!2606 = distinct !DILexicalBlock(scope: !2607, file: !480, line: 200, column: 13)
!2607 = distinct !DILexicalBlock(scope: !2604, file: !480, line: 199, column: 37)
!2608 = !DILocation(line: 200, scope: !2606, inlinedAt: !2578)
!2609 = !DILocalVariable(name: "col", scope: !2606, file: !480, line: 200, type: !86)
!2610 = !DILocation(line: 0, scope: !2606, inlinedAt: !2578)
!2611 = !DILocation(line: 200, column: 35, scope: !2612, inlinedAt: !2578)
!2612 = distinct !DILexicalBlock(scope: !2606, file: !480, line: 200, column: 13)
!2613 = !DILocation(line: 201, column: 63, scope: !2614, inlinedAt: !2578)
!2614 = distinct !DILexicalBlock(scope: !2612, file: !480, line: 200, column: 50)
!2615 = !DILocation(line: 201, column: 47, scope: !2614, inlinedAt: !2578)
!2616 = !DILocation(line: 201, column: 110, scope: !2614, inlinedAt: !2578)
!2617 = !DILocation(line: 201, column: 123, scope: !2614, inlinedAt: !2578)
!2618 = !DILocation(line: 201, column: 117, scope: !2614, inlinedAt: !2578)
!2619 = !DILocation(line: 201, column: 115, scope: !2614, inlinedAt: !2578)
!2620 = !DILocation(line: 201, column: 90, scope: !2614, inlinedAt: !2578)
!2621 = !DILocation(line: 0, scope: !2426, inlinedAt: !2622)
!2622 = distinct !DILocation(line: 201, column: 21, scope: !2614, inlinedAt: !2578)
!2623 = !DILocation(line: 0, scope: !2434, inlinedAt: !2622)
!2624 = !DILocation(line: 24, column: 10, scope: !2434, inlinedAt: !2622)
!2625 = !DILocation(line: 24, scope: !2434, inlinedAt: !2622)
!2626 = !DILocation(line: 24, column: 26, scope: !2439, inlinedAt: !2622)
!2627 = !DILocation(line: 24, column: 5, scope: !2434, inlinedAt: !2622)
!2628 = !DILocation(line: 26, column: 19, scope: !2442, inlinedAt: !2622)
!2629 = !DILocation(line: 26, column: 9, scope: !2442, inlinedAt: !2622)
!2630 = !DILocation(line: 26, column: 16, scope: !2442, inlinedAt: !2622)
!2631 = !DILocation(line: 24, column: 46, scope: !2439, inlinedAt: !2622)
!2632 = !DILocation(line: 24, column: 5, scope: !2439, inlinedAt: !2622)
!2633 = distinct !{!2633, !2627, !2634, !297}
!2634 = !DILocation(line: 27, column: 5, scope: !2434, inlinedAt: !2622)
!2635 = !DILocation(line: 200, column: 44, scope: !2612, inlinedAt: !2578)
!2636 = !DILocation(line: 200, column: 13, scope: !2612, inlinedAt: !2578)
!2637 = distinct !{!2637, !2605, !2638, !297}
!2638 = !DILocation(line: 202, column: 13, scope: !2606, inlinedAt: !2578)
!2639 = !DILocation(line: 199, column: 33, scope: !2604, inlinedAt: !2578)
!2640 = !DILocation(line: 199, column: 9, scope: !2604, inlinedAt: !2578)
!2641 = distinct !{!2641, !2596, !2642, !297}
!2642 = !DILocation(line: 203, column: 9, scope: !2597, inlinedAt: !2578)
!2643 = !DILocation(line: 198, column: 35, scope: !2594, inlinedAt: !2578)
!2644 = !DILocation(line: 198, column: 5, scope: !2594, inlinedAt: !2578)
!2645 = distinct !{!2645, !2595, !2646, !297}
!2646 = !DILocation(line: 204, column: 5, scope: !2589, inlinedAt: !2578)
!2647 = !DILocalVariable(name: "i", scope: !2575, file: !480, line: 207, type: !86)
!2648 = !DILocation(line: 208, column: 14, scope: !2575, inlinedAt: !2578)
!2649 = !DILocation(line: 209, column: 54, scope: !2650, inlinedAt: !2578)
!2650 = distinct !DILexicalBlock(scope: !2575, file: !480, line: 208, column: 21)
!2651 = !DILocation(line: 209, column: 82, scope: !2650, inlinedAt: !2578)
!2652 = !DILocation(line: 209, column: 9, scope: !2650, inlinedAt: !2578)
!2653 = !DILocation(line: 210, column: 10, scope: !2650, inlinedAt: !2578)
!2654 = distinct !{!2654, !2599, !2655, !297}
!2655 = !DILocation(line: 211, column: 5, scope: !2575, inlinedAt: !2578)
!2656 = !DILocation(line: 212, column: 1, scope: !2575, inlinedAt: !2578)
!2657 = !DILocation(line: 292, column: 1, scope: !2351, inlinedAt: !2354)
!2658 = !DILocalVariable(name: "zero", scope: !2337, file: !68, line: 292, type: !875)
!2659 = !DILocation(line: 292, column: 19, scope: !2337, inlinedAt: !2340)
!2660 = !DILocation(line: 293, column: 5, scope: !2337, inlinedAt: !2340)
!2661 = !DILocation(line: 294, column: 1, scope: !2337, inlinedAt: !2340)
!2662 = !DILocation(line: 670, column: 9, scope: !2663)
!2663 = distinct !DILexicalBlock(scope: !2213, file: !68, line: 670, column: 9)
!2664 = !DILocation(line: 670, column: 31, scope: !2663)
!2665 = !DILocation(line: 674, column: 1, scope: !2213)
!2666 = !DILocation(line: 0, scope: !248)
!2667 = !DILocation(line: 0, scope: !256, inlinedAt: !2668)
!2668 = distinct !DILocation(line: 610, column: 5, scope: !248)
!2669 = !DILocation(line: 284, column: 5, scope: !256, inlinedAt: !2668)
!2670 = !DILocation(line: 265, column: 14, scope: !265, inlinedAt: !2671)
!2671 = distinct !DILocation(line: 285, column: 5, scope: !256, inlinedAt: !2668)
!2672 = !DILocation(line: 0, scope: !265, inlinedAt: !2671)
!2673 = !DILocation(line: 0, scope: !280, inlinedAt: !2671)
!2674 = !DILocation(line: 266, column: 10, scope: !280, inlinedAt: !2671)
!2675 = !DILocation(line: 266, column: 28, scope: !284, inlinedAt: !2671)
!2676 = !DILocation(line: 266, column: 5, scope: !280, inlinedAt: !2671)
!2677 = !DILocation(line: 266, scope: !280, inlinedAt: !2671)
!2678 = !DILocation(line: 268, column: 29, scope: !288, inlinedAt: !2671)
!2679 = !DILocation(line: 268, column: 24, scope: !288, inlinedAt: !2671)
!2680 = !DILocation(line: 268, column: 9, scope: !288, inlinedAt: !2671)
!2681 = !DILocation(line: 269, column: 24, scope: !288, inlinedAt: !2671)
!2682 = !DILocation(line: 269, column: 21, scope: !288, inlinedAt: !2671)
!2683 = !DILocation(line: 269, column: 9, scope: !288, inlinedAt: !2671)
!2684 = !DILocation(line: 266, column: 5, scope: !284, inlinedAt: !2671)
!2685 = distinct !{!2685, !2676, !2686, !297}
!2686 = !DILocation(line: 270, column: 5, scope: !280, inlinedAt: !2671)
!2687 = !DILocation(line: 271, column: 1, scope: !265, inlinedAt: !2671)
!2688 = !DILocation(line: 612, column: 23, scope: !248)
!2689 = !DILocation(line: 612, column: 72, scope: !248)
!2690 = !DILocation(line: 265, column: 14, scope: !265, inlinedAt: !2691)
!2691 = distinct !DILocation(line: 612, column: 5, scope: !248)
!2692 = !DILocation(line: 0, scope: !265, inlinedAt: !2691)
!2693 = !DILocation(line: 0, scope: !280, inlinedAt: !2691)
!2694 = !DILocation(line: 266, column: 10, scope: !280, inlinedAt: !2691)
!2695 = !DILocation(line: 266, column: 28, scope: !284, inlinedAt: !2691)
!2696 = !DILocation(line: 266, column: 5, scope: !280, inlinedAt: !2691)
!2697 = !DILocation(line: 266, scope: !280, inlinedAt: !2691)
!2698 = !DILocation(line: 268, column: 29, scope: !288, inlinedAt: !2691)
!2699 = !DILocation(line: 268, column: 24, scope: !288, inlinedAt: !2691)
!2700 = !DILocation(line: 268, column: 9, scope: !288, inlinedAt: !2691)
!2701 = !DILocation(line: 269, column: 24, scope: !288, inlinedAt: !2691)
!2702 = !DILocation(line: 269, column: 21, scope: !288, inlinedAt: !2691)
!2703 = !DILocation(line: 269, column: 9, scope: !288, inlinedAt: !2691)
!2704 = !DILocation(line: 266, column: 5, scope: !284, inlinedAt: !2691)
!2705 = distinct !{!2705, !2696, !2706, !297}
!2706 = !DILocation(line: 270, column: 5, scope: !280, inlinedAt: !2691)
!2707 = !DILocation(line: 271, column: 1, scope: !265, inlinedAt: !2691)
!2708 = !DILocation(line: 614, column: 5, scope: !248)
!2709 = distinct !DISubprogram(name: "m_vec_multiply_bins", scope: !655, file: !655, line: 66, type: !2710, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2710 = !DISubroutineType(types: !2711)
!2711 = !{null, !86, !52, !52}
!2712 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2709, file: !655, line: 66, type: !86)
!2713 = !DILocation(line: 0, scope: !2709)
!2714 = !DILocalVariable(name: "bins", arg: 2, scope: !2709, file: !655, line: 66, type: !52)
!2715 = !DILocalVariable(name: "out", arg: 3, scope: !2709, file: !655, line: 66, type: !52)
!2716 = !DILocation(line: 67, column: 44, scope: !2709)
!2717 = !DILocation(line: 67, column: 73, scope: !2709)
!2718 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2719, file: !655, line: 56, type: !86)
!2719 = distinct !DISubprogram(name: "m_vec_mul_add_x_inv", scope: !655, file: !655, line: 56, type: !2427, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2720 = !DILocation(line: 0, scope: !2719, inlinedAt: !2721)
!2721 = distinct !DILocation(line: 67, column: 5, scope: !2709)
!2722 = !DILocalVariable(name: "in", arg: 2, scope: !2719, file: !655, line: 56, type: !483)
!2723 = !DILocalVariable(name: "acc", arg: 3, scope: !2719, file: !655, line: 56, type: !52)
!2724 = !DILocalVariable(name: "mask_lsb", scope: !2719, file: !655, line: 58, type: !53)
!2725 = !DILocalVariable(name: "i", scope: !2726, file: !655, line: 59, type: !86)
!2726 = distinct !DILexicalBlock(scope: !2719, file: !655, line: 59, column: 5)
!2727 = !DILocation(line: 0, scope: !2726, inlinedAt: !2721)
!2728 = !DILocation(line: 59, column: 9, scope: !2726, inlinedAt: !2721)
!2729 = !DILocation(line: 59, scope: !2726, inlinedAt: !2721)
!2730 = !DILocation(line: 59, column: 20, scope: !2731, inlinedAt: !2721)
!2731 = distinct !DILexicalBlock(scope: !2726, file: !655, line: 59, column: 5)
!2732 = !DILocation(line: 59, column: 5, scope: !2726, inlinedAt: !2721)
!2733 = !DILocation(line: 60, column: 22, scope: !2734, inlinedAt: !2721)
!2734 = distinct !DILexicalBlock(scope: !2731, file: !655, line: 59, column: 43)
!2735 = !DILocation(line: 60, column: 28, scope: !2734, inlinedAt: !2721)
!2736 = !DILocalVariable(name: "t", scope: !2734, file: !655, line: 60, type: !53)
!2737 = !DILocation(line: 0, scope: !2734, inlinedAt: !2721)
!2738 = !DILocation(line: 61, column: 32, scope: !2734, inlinedAt: !2721)
!2739 = !DILocation(line: 61, column: 43, scope: !2734, inlinedAt: !2721)
!2740 = !DILocation(line: 61, column: 38, scope: !2734, inlinedAt: !2721)
!2741 = !DILocation(line: 61, column: 9, scope: !2734, inlinedAt: !2721)
!2742 = !DILocation(line: 61, column: 16, scope: !2734, inlinedAt: !2721)
!2743 = !DILocation(line: 59, column: 40, scope: !2731, inlinedAt: !2721)
!2744 = !DILocation(line: 59, column: 5, scope: !2731, inlinedAt: !2721)
!2745 = distinct !{!2745, !2732, !2746, !297}
!2746 = !DILocation(line: 62, column: 5, scope: !2726, inlinedAt: !2721)
!2747 = !DILocation(line: 68, column: 40, scope: !2709)
!2748 = !DILocation(line: 68, column: 69, scope: !2709)
!2749 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2750, file: !655, line: 46, type: !86)
!2750 = distinct !DISubprogram(name: "m_vec_mul_add_x", scope: !655, file: !655, line: 46, type: !2427, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2751 = !DILocation(line: 0, scope: !2750, inlinedAt: !2752)
!2752 = distinct !DILocation(line: 68, column: 5, scope: !2709)
!2753 = !DILocalVariable(name: "in", arg: 2, scope: !2750, file: !655, line: 46, type: !483)
!2754 = !DILocalVariable(name: "acc", arg: 3, scope: !2750, file: !655, line: 46, type: !52)
!2755 = !DILocalVariable(name: "mask_msb", scope: !2750, file: !655, line: 48, type: !53)
!2756 = !DILocalVariable(name: "i", scope: !2757, file: !655, line: 49, type: !86)
!2757 = distinct !DILexicalBlock(scope: !2750, file: !655, line: 49, column: 5)
!2758 = !DILocation(line: 0, scope: !2757, inlinedAt: !2752)
!2759 = !DILocation(line: 49, column: 9, scope: !2757, inlinedAt: !2752)
!2760 = !DILocation(line: 49, scope: !2757, inlinedAt: !2752)
!2761 = !DILocation(line: 49, column: 20, scope: !2762, inlinedAt: !2752)
!2762 = distinct !DILexicalBlock(scope: !2757, file: !655, line: 49, column: 5)
!2763 = !DILocation(line: 49, column: 5, scope: !2757, inlinedAt: !2752)
!2764 = !DILocation(line: 50, column: 22, scope: !2765, inlinedAt: !2752)
!2765 = distinct !DILexicalBlock(scope: !2762, file: !655, line: 49, column: 43)
!2766 = !DILocalVariable(name: "t", scope: !2765, file: !655, line: 50, type: !53)
!2767 = !DILocation(line: 0, scope: !2765, inlinedAt: !2752)
!2768 = !DILocation(line: 51, column: 32, scope: !2765, inlinedAt: !2752)
!2769 = !DILocation(line: 51, column: 44, scope: !2765, inlinedAt: !2752)
!2770 = !DILocation(line: 51, column: 50, scope: !2765, inlinedAt: !2752)
!2771 = !DILocation(line: 51, column: 38, scope: !2765, inlinedAt: !2752)
!2772 = !DILocation(line: 51, column: 9, scope: !2765, inlinedAt: !2752)
!2773 = !DILocation(line: 51, column: 16, scope: !2765, inlinedAt: !2752)
!2774 = !DILocation(line: 49, column: 40, scope: !2762, inlinedAt: !2752)
!2775 = !DILocation(line: 49, column: 5, scope: !2762, inlinedAt: !2752)
!2776 = distinct !{!2776, !2763, !2777, !297}
!2777 = !DILocation(line: 52, column: 5, scope: !2757, inlinedAt: !2752)
!2778 = !DILocation(line: 69, column: 44, scope: !2709)
!2779 = !DILocation(line: 69, column: 74, scope: !2709)
!2780 = !DILocation(line: 0, scope: !2719, inlinedAt: !2781)
!2781 = distinct !DILocation(line: 69, column: 5, scope: !2709)
!2782 = !DILocation(line: 0, scope: !2726, inlinedAt: !2781)
!2783 = !DILocation(line: 59, column: 9, scope: !2726, inlinedAt: !2781)
!2784 = !DILocation(line: 59, scope: !2726, inlinedAt: !2781)
!2785 = !DILocation(line: 59, column: 20, scope: !2731, inlinedAt: !2781)
!2786 = !DILocation(line: 59, column: 5, scope: !2726, inlinedAt: !2781)
!2787 = !DILocation(line: 60, column: 22, scope: !2734, inlinedAt: !2781)
!2788 = !DILocation(line: 60, column: 28, scope: !2734, inlinedAt: !2781)
!2789 = !DILocation(line: 0, scope: !2734, inlinedAt: !2781)
!2790 = !DILocation(line: 61, column: 32, scope: !2734, inlinedAt: !2781)
!2791 = !DILocation(line: 61, column: 43, scope: !2734, inlinedAt: !2781)
!2792 = !DILocation(line: 61, column: 38, scope: !2734, inlinedAt: !2781)
!2793 = !DILocation(line: 61, column: 9, scope: !2734, inlinedAt: !2781)
!2794 = !DILocation(line: 61, column: 16, scope: !2734, inlinedAt: !2781)
!2795 = !DILocation(line: 59, column: 40, scope: !2731, inlinedAt: !2781)
!2796 = !DILocation(line: 59, column: 5, scope: !2731, inlinedAt: !2781)
!2797 = distinct !{!2797, !2786, !2798, !297}
!2798 = !DILocation(line: 62, column: 5, scope: !2726, inlinedAt: !2781)
!2799 = !DILocation(line: 70, column: 40, scope: !2709)
!2800 = !DILocation(line: 70, column: 69, scope: !2709)
!2801 = !DILocation(line: 0, scope: !2750, inlinedAt: !2802)
!2802 = distinct !DILocation(line: 70, column: 5, scope: !2709)
!2803 = !DILocation(line: 0, scope: !2757, inlinedAt: !2802)
!2804 = !DILocation(line: 49, column: 9, scope: !2757, inlinedAt: !2802)
!2805 = !DILocation(line: 49, scope: !2757, inlinedAt: !2802)
!2806 = !DILocation(line: 49, column: 20, scope: !2762, inlinedAt: !2802)
!2807 = !DILocation(line: 49, column: 5, scope: !2757, inlinedAt: !2802)
!2808 = !DILocation(line: 50, column: 22, scope: !2765, inlinedAt: !2802)
!2809 = !DILocation(line: 0, scope: !2765, inlinedAt: !2802)
!2810 = !DILocation(line: 51, column: 32, scope: !2765, inlinedAt: !2802)
!2811 = !DILocation(line: 51, column: 44, scope: !2765, inlinedAt: !2802)
!2812 = !DILocation(line: 51, column: 50, scope: !2765, inlinedAt: !2802)
!2813 = !DILocation(line: 51, column: 38, scope: !2765, inlinedAt: !2802)
!2814 = !DILocation(line: 51, column: 9, scope: !2765, inlinedAt: !2802)
!2815 = !DILocation(line: 51, column: 16, scope: !2765, inlinedAt: !2802)
!2816 = !DILocation(line: 49, column: 40, scope: !2762, inlinedAt: !2802)
!2817 = !DILocation(line: 49, column: 5, scope: !2762, inlinedAt: !2802)
!2818 = distinct !{!2818, !2807, !2819, !297}
!2819 = !DILocation(line: 52, column: 5, scope: !2757, inlinedAt: !2802)
!2820 = !DILocation(line: 71, column: 44, scope: !2709)
!2821 = !DILocation(line: 71, column: 73, scope: !2709)
!2822 = !DILocation(line: 0, scope: !2719, inlinedAt: !2823)
!2823 = distinct !DILocation(line: 71, column: 5, scope: !2709)
!2824 = !DILocation(line: 0, scope: !2726, inlinedAt: !2823)
!2825 = !DILocation(line: 59, column: 9, scope: !2726, inlinedAt: !2823)
!2826 = !DILocation(line: 59, scope: !2726, inlinedAt: !2823)
!2827 = !DILocation(line: 59, column: 20, scope: !2731, inlinedAt: !2823)
!2828 = !DILocation(line: 59, column: 5, scope: !2726, inlinedAt: !2823)
!2829 = !DILocation(line: 60, column: 22, scope: !2734, inlinedAt: !2823)
!2830 = !DILocation(line: 60, column: 28, scope: !2734, inlinedAt: !2823)
!2831 = !DILocation(line: 0, scope: !2734, inlinedAt: !2823)
!2832 = !DILocation(line: 61, column: 32, scope: !2734, inlinedAt: !2823)
!2833 = !DILocation(line: 61, column: 43, scope: !2734, inlinedAt: !2823)
!2834 = !DILocation(line: 61, column: 38, scope: !2734, inlinedAt: !2823)
!2835 = !DILocation(line: 61, column: 9, scope: !2734, inlinedAt: !2823)
!2836 = !DILocation(line: 61, column: 16, scope: !2734, inlinedAt: !2823)
!2837 = !DILocation(line: 59, column: 40, scope: !2731, inlinedAt: !2823)
!2838 = !DILocation(line: 59, column: 5, scope: !2731, inlinedAt: !2823)
!2839 = distinct !{!2839, !2828, !2840, !297}
!2840 = !DILocation(line: 62, column: 5, scope: !2726, inlinedAt: !2823)
!2841 = !DILocation(line: 72, column: 40, scope: !2709)
!2842 = !DILocation(line: 72, column: 69, scope: !2709)
!2843 = !DILocation(line: 0, scope: !2750, inlinedAt: !2844)
!2844 = distinct !DILocation(line: 72, column: 5, scope: !2709)
!2845 = !DILocation(line: 0, scope: !2757, inlinedAt: !2844)
!2846 = !DILocation(line: 49, column: 9, scope: !2757, inlinedAt: !2844)
!2847 = !DILocation(line: 49, scope: !2757, inlinedAt: !2844)
!2848 = !DILocation(line: 49, column: 20, scope: !2762, inlinedAt: !2844)
!2849 = !DILocation(line: 49, column: 5, scope: !2757, inlinedAt: !2844)
!2850 = !DILocation(line: 50, column: 22, scope: !2765, inlinedAt: !2844)
!2851 = !DILocation(line: 0, scope: !2765, inlinedAt: !2844)
!2852 = !DILocation(line: 51, column: 32, scope: !2765, inlinedAt: !2844)
!2853 = !DILocation(line: 51, column: 44, scope: !2765, inlinedAt: !2844)
!2854 = !DILocation(line: 51, column: 50, scope: !2765, inlinedAt: !2844)
!2855 = !DILocation(line: 51, column: 38, scope: !2765, inlinedAt: !2844)
!2856 = !DILocation(line: 51, column: 9, scope: !2765, inlinedAt: !2844)
!2857 = !DILocation(line: 51, column: 16, scope: !2765, inlinedAt: !2844)
!2858 = !DILocation(line: 49, column: 40, scope: !2762, inlinedAt: !2844)
!2859 = !DILocation(line: 49, column: 5, scope: !2762, inlinedAt: !2844)
!2860 = distinct !{!2860, !2849, !2861, !297}
!2861 = !DILocation(line: 52, column: 5, scope: !2757, inlinedAt: !2844)
!2862 = !DILocation(line: 73, column: 44, scope: !2709)
!2863 = !DILocation(line: 73, column: 74, scope: !2709)
!2864 = !DILocation(line: 0, scope: !2719, inlinedAt: !2865)
!2865 = distinct !DILocation(line: 73, column: 5, scope: !2709)
!2866 = !DILocation(line: 0, scope: !2726, inlinedAt: !2865)
!2867 = !DILocation(line: 59, column: 9, scope: !2726, inlinedAt: !2865)
!2868 = !DILocation(line: 59, scope: !2726, inlinedAt: !2865)
!2869 = !DILocation(line: 59, column: 20, scope: !2731, inlinedAt: !2865)
!2870 = !DILocation(line: 59, column: 5, scope: !2726, inlinedAt: !2865)
!2871 = !DILocation(line: 60, column: 22, scope: !2734, inlinedAt: !2865)
!2872 = !DILocation(line: 60, column: 28, scope: !2734, inlinedAt: !2865)
!2873 = !DILocation(line: 0, scope: !2734, inlinedAt: !2865)
!2874 = !DILocation(line: 61, column: 32, scope: !2734, inlinedAt: !2865)
!2875 = !DILocation(line: 61, column: 43, scope: !2734, inlinedAt: !2865)
!2876 = !DILocation(line: 61, column: 38, scope: !2734, inlinedAt: !2865)
!2877 = !DILocation(line: 61, column: 9, scope: !2734, inlinedAt: !2865)
!2878 = !DILocation(line: 61, column: 16, scope: !2734, inlinedAt: !2865)
!2879 = !DILocation(line: 59, column: 40, scope: !2731, inlinedAt: !2865)
!2880 = !DILocation(line: 59, column: 5, scope: !2731, inlinedAt: !2865)
!2881 = distinct !{!2881, !2870, !2882, !297}
!2882 = !DILocation(line: 62, column: 5, scope: !2726, inlinedAt: !2865)
!2883 = !DILocation(line: 74, column: 40, scope: !2709)
!2884 = !DILocation(line: 74, column: 69, scope: !2709)
!2885 = !DILocation(line: 0, scope: !2750, inlinedAt: !2886)
!2886 = distinct !DILocation(line: 74, column: 5, scope: !2709)
!2887 = !DILocation(line: 0, scope: !2757, inlinedAt: !2886)
!2888 = !DILocation(line: 49, column: 9, scope: !2757, inlinedAt: !2886)
!2889 = !DILocation(line: 49, scope: !2757, inlinedAt: !2886)
!2890 = !DILocation(line: 49, column: 20, scope: !2762, inlinedAt: !2886)
!2891 = !DILocation(line: 49, column: 5, scope: !2757, inlinedAt: !2886)
!2892 = !DILocation(line: 50, column: 22, scope: !2765, inlinedAt: !2886)
!2893 = !DILocation(line: 0, scope: !2765, inlinedAt: !2886)
!2894 = !DILocation(line: 51, column: 32, scope: !2765, inlinedAt: !2886)
!2895 = !DILocation(line: 51, column: 44, scope: !2765, inlinedAt: !2886)
!2896 = !DILocation(line: 51, column: 50, scope: !2765, inlinedAt: !2886)
!2897 = !DILocation(line: 51, column: 38, scope: !2765, inlinedAt: !2886)
!2898 = !DILocation(line: 51, column: 9, scope: !2765, inlinedAt: !2886)
!2899 = !DILocation(line: 51, column: 16, scope: !2765, inlinedAt: !2886)
!2900 = !DILocation(line: 49, column: 40, scope: !2762, inlinedAt: !2886)
!2901 = !DILocation(line: 49, column: 5, scope: !2762, inlinedAt: !2886)
!2902 = distinct !{!2902, !2891, !2903, !297}
!2903 = !DILocation(line: 52, column: 5, scope: !2757, inlinedAt: !2886)
!2904 = !DILocation(line: 75, column: 44, scope: !2709)
!2905 = !DILocation(line: 75, column: 74, scope: !2709)
!2906 = !DILocation(line: 0, scope: !2719, inlinedAt: !2907)
!2907 = distinct !DILocation(line: 75, column: 5, scope: !2709)
!2908 = !DILocation(line: 0, scope: !2726, inlinedAt: !2907)
!2909 = !DILocation(line: 59, column: 9, scope: !2726, inlinedAt: !2907)
!2910 = !DILocation(line: 59, scope: !2726, inlinedAt: !2907)
!2911 = !DILocation(line: 59, column: 20, scope: !2731, inlinedAt: !2907)
!2912 = !DILocation(line: 59, column: 5, scope: !2726, inlinedAt: !2907)
!2913 = !DILocation(line: 60, column: 22, scope: !2734, inlinedAt: !2907)
!2914 = !DILocation(line: 60, column: 28, scope: !2734, inlinedAt: !2907)
!2915 = !DILocation(line: 0, scope: !2734, inlinedAt: !2907)
!2916 = !DILocation(line: 61, column: 32, scope: !2734, inlinedAt: !2907)
!2917 = !DILocation(line: 61, column: 43, scope: !2734, inlinedAt: !2907)
!2918 = !DILocation(line: 61, column: 38, scope: !2734, inlinedAt: !2907)
!2919 = !DILocation(line: 61, column: 9, scope: !2734, inlinedAt: !2907)
!2920 = !DILocation(line: 61, column: 16, scope: !2734, inlinedAt: !2907)
!2921 = !DILocation(line: 59, column: 40, scope: !2731, inlinedAt: !2907)
!2922 = !DILocation(line: 59, column: 5, scope: !2731, inlinedAt: !2907)
!2923 = distinct !{!2923, !2912, !2924, !297}
!2924 = !DILocation(line: 62, column: 5, scope: !2726, inlinedAt: !2907)
!2925 = !DILocation(line: 76, column: 40, scope: !2709)
!2926 = !DILocation(line: 76, column: 69, scope: !2709)
!2927 = !DILocation(line: 0, scope: !2750, inlinedAt: !2928)
!2928 = distinct !DILocation(line: 76, column: 5, scope: !2709)
!2929 = !DILocation(line: 0, scope: !2757, inlinedAt: !2928)
!2930 = !DILocation(line: 49, column: 9, scope: !2757, inlinedAt: !2928)
!2931 = !DILocation(line: 49, scope: !2757, inlinedAt: !2928)
!2932 = !DILocation(line: 49, column: 20, scope: !2762, inlinedAt: !2928)
!2933 = !DILocation(line: 49, column: 5, scope: !2757, inlinedAt: !2928)
!2934 = !DILocation(line: 50, column: 22, scope: !2765, inlinedAt: !2928)
!2935 = !DILocation(line: 0, scope: !2765, inlinedAt: !2928)
!2936 = !DILocation(line: 51, column: 32, scope: !2765, inlinedAt: !2928)
!2937 = !DILocation(line: 51, column: 44, scope: !2765, inlinedAt: !2928)
!2938 = !DILocation(line: 51, column: 50, scope: !2765, inlinedAt: !2928)
!2939 = !DILocation(line: 51, column: 38, scope: !2765, inlinedAt: !2928)
!2940 = !DILocation(line: 51, column: 9, scope: !2765, inlinedAt: !2928)
!2941 = !DILocation(line: 51, column: 16, scope: !2765, inlinedAt: !2928)
!2942 = !DILocation(line: 49, column: 40, scope: !2762, inlinedAt: !2928)
!2943 = !DILocation(line: 49, column: 5, scope: !2762, inlinedAt: !2928)
!2944 = distinct !{!2944, !2933, !2945, !297}
!2945 = !DILocation(line: 52, column: 5, scope: !2757, inlinedAt: !2928)
!2946 = !DILocation(line: 77, column: 44, scope: !2709)
!2947 = !DILocation(line: 77, column: 74, scope: !2709)
!2948 = !DILocation(line: 0, scope: !2719, inlinedAt: !2949)
!2949 = distinct !DILocation(line: 77, column: 5, scope: !2709)
!2950 = !DILocation(line: 0, scope: !2726, inlinedAt: !2949)
!2951 = !DILocation(line: 59, column: 9, scope: !2726, inlinedAt: !2949)
!2952 = !DILocation(line: 59, scope: !2726, inlinedAt: !2949)
!2953 = !DILocation(line: 59, column: 20, scope: !2731, inlinedAt: !2949)
!2954 = !DILocation(line: 59, column: 5, scope: !2726, inlinedAt: !2949)
!2955 = !DILocation(line: 60, column: 22, scope: !2734, inlinedAt: !2949)
!2956 = !DILocation(line: 60, column: 28, scope: !2734, inlinedAt: !2949)
!2957 = !DILocation(line: 0, scope: !2734, inlinedAt: !2949)
!2958 = !DILocation(line: 61, column: 32, scope: !2734, inlinedAt: !2949)
!2959 = !DILocation(line: 61, column: 43, scope: !2734, inlinedAt: !2949)
!2960 = !DILocation(line: 61, column: 38, scope: !2734, inlinedAt: !2949)
!2961 = !DILocation(line: 61, column: 9, scope: !2734, inlinedAt: !2949)
!2962 = !DILocation(line: 61, column: 16, scope: !2734, inlinedAt: !2949)
!2963 = !DILocation(line: 59, column: 40, scope: !2731, inlinedAt: !2949)
!2964 = !DILocation(line: 59, column: 5, scope: !2731, inlinedAt: !2949)
!2965 = distinct !{!2965, !2954, !2966, !297}
!2966 = !DILocation(line: 62, column: 5, scope: !2726, inlinedAt: !2949)
!2967 = !DILocation(line: 78, column: 40, scope: !2709)
!2968 = !DILocation(line: 78, column: 69, scope: !2709)
!2969 = !DILocation(line: 0, scope: !2750, inlinedAt: !2970)
!2970 = distinct !DILocation(line: 78, column: 5, scope: !2709)
!2971 = !DILocation(line: 0, scope: !2757, inlinedAt: !2970)
!2972 = !DILocation(line: 49, column: 9, scope: !2757, inlinedAt: !2970)
!2973 = !DILocation(line: 49, scope: !2757, inlinedAt: !2970)
!2974 = !DILocation(line: 49, column: 20, scope: !2762, inlinedAt: !2970)
!2975 = !DILocation(line: 49, column: 5, scope: !2757, inlinedAt: !2970)
!2976 = !DILocation(line: 50, column: 22, scope: !2765, inlinedAt: !2970)
!2977 = !DILocation(line: 0, scope: !2765, inlinedAt: !2970)
!2978 = !DILocation(line: 51, column: 32, scope: !2765, inlinedAt: !2970)
!2979 = !DILocation(line: 51, column: 44, scope: !2765, inlinedAt: !2970)
!2980 = !DILocation(line: 51, column: 50, scope: !2765, inlinedAt: !2970)
!2981 = !DILocation(line: 51, column: 38, scope: !2765, inlinedAt: !2970)
!2982 = !DILocation(line: 51, column: 9, scope: !2765, inlinedAt: !2970)
!2983 = !DILocation(line: 51, column: 16, scope: !2765, inlinedAt: !2970)
!2984 = !DILocation(line: 49, column: 40, scope: !2762, inlinedAt: !2970)
!2985 = !DILocation(line: 49, column: 5, scope: !2762, inlinedAt: !2970)
!2986 = distinct !{!2986, !2975, !2987, !297}
!2987 = !DILocation(line: 52, column: 5, scope: !2757, inlinedAt: !2970)
!2988 = !DILocation(line: 79, column: 44, scope: !2709)
!2989 = !DILocation(line: 79, column: 74, scope: !2709)
!2990 = !DILocation(line: 0, scope: !2719, inlinedAt: !2991)
!2991 = distinct !DILocation(line: 79, column: 5, scope: !2709)
!2992 = !DILocation(line: 0, scope: !2726, inlinedAt: !2991)
!2993 = !DILocation(line: 59, column: 9, scope: !2726, inlinedAt: !2991)
!2994 = !DILocation(line: 59, scope: !2726, inlinedAt: !2991)
!2995 = !DILocation(line: 59, column: 20, scope: !2731, inlinedAt: !2991)
!2996 = !DILocation(line: 59, column: 5, scope: !2726, inlinedAt: !2991)
!2997 = !DILocation(line: 60, column: 22, scope: !2734, inlinedAt: !2991)
!2998 = !DILocation(line: 60, column: 28, scope: !2734, inlinedAt: !2991)
!2999 = !DILocation(line: 0, scope: !2734, inlinedAt: !2991)
!3000 = !DILocation(line: 61, column: 32, scope: !2734, inlinedAt: !2991)
!3001 = !DILocation(line: 61, column: 43, scope: !2734, inlinedAt: !2991)
!3002 = !DILocation(line: 61, column: 38, scope: !2734, inlinedAt: !2991)
!3003 = !DILocation(line: 61, column: 9, scope: !2734, inlinedAt: !2991)
!3004 = !DILocation(line: 61, column: 16, scope: !2734, inlinedAt: !2991)
!3005 = !DILocation(line: 59, column: 40, scope: !2731, inlinedAt: !2991)
!3006 = !DILocation(line: 59, column: 5, scope: !2731, inlinedAt: !2991)
!3007 = distinct !{!3007, !2996, !3008, !297}
!3008 = !DILocation(line: 62, column: 5, scope: !2726, inlinedAt: !2991)
!3009 = !DILocation(line: 80, column: 40, scope: !2709)
!3010 = !DILocation(line: 80, column: 69, scope: !2709)
!3011 = !DILocation(line: 0, scope: !2750, inlinedAt: !3012)
!3012 = distinct !DILocation(line: 80, column: 5, scope: !2709)
!3013 = !DILocation(line: 0, scope: !2757, inlinedAt: !3012)
!3014 = !DILocation(line: 49, column: 9, scope: !2757, inlinedAt: !3012)
!3015 = !DILocation(line: 49, scope: !2757, inlinedAt: !3012)
!3016 = !DILocation(line: 49, column: 20, scope: !2762, inlinedAt: !3012)
!3017 = !DILocation(line: 49, column: 5, scope: !2757, inlinedAt: !3012)
!3018 = !DILocation(line: 50, column: 22, scope: !2765, inlinedAt: !3012)
!3019 = !DILocation(line: 0, scope: !2765, inlinedAt: !3012)
!3020 = !DILocation(line: 51, column: 32, scope: !2765, inlinedAt: !3012)
!3021 = !DILocation(line: 51, column: 44, scope: !2765, inlinedAt: !3012)
!3022 = !DILocation(line: 51, column: 50, scope: !2765, inlinedAt: !3012)
!3023 = !DILocation(line: 51, column: 38, scope: !2765, inlinedAt: !3012)
!3024 = !DILocation(line: 51, column: 9, scope: !2765, inlinedAt: !3012)
!3025 = !DILocation(line: 51, column: 16, scope: !2765, inlinedAt: !3012)
!3026 = !DILocation(line: 49, column: 40, scope: !2762, inlinedAt: !3012)
!3027 = !DILocation(line: 49, column: 5, scope: !2762, inlinedAt: !3012)
!3028 = distinct !{!3028, !3017, !3029, !297}
!3029 = !DILocation(line: 52, column: 5, scope: !2757, inlinedAt: !3012)
!3030 = !DILocation(line: 81, column: 35, scope: !2709)
!3031 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !3032, file: !655, line: 13, type: !86)
!3032 = distinct !DISubprogram(name: "m_vec_copy", scope: !655, file: !655, line: 13, type: !2427, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!3033 = !DILocation(line: 0, scope: !3032, inlinedAt: !3034)
!3034 = distinct !DILocation(line: 81, column: 5, scope: !2709)
!3035 = !DILocalVariable(name: "in", arg: 2, scope: !3032, file: !655, line: 13, type: !483)
!3036 = !DILocalVariable(name: "out", arg: 3, scope: !3032, file: !655, line: 13, type: !52)
!3037 = !DILocalVariable(name: "i", scope: !3038, file: !655, line: 15, type: !58)
!3038 = distinct !DILexicalBlock(scope: !3032, file: !655, line: 15, column: 5)
!3039 = !DILocation(line: 0, scope: !3038, inlinedAt: !3034)
!3040 = !DILocation(line: 15, column: 10, scope: !3038, inlinedAt: !3034)
!3041 = !DILocation(line: 15, scope: !3038, inlinedAt: !3034)
!3042 = !DILocation(line: 15, column: 26, scope: !3043, inlinedAt: !3034)
!3043 = distinct !DILexicalBlock(scope: !3038, file: !655, line: 15, column: 5)
!3044 = !DILocation(line: 15, column: 5, scope: !3038, inlinedAt: !3034)
!3045 = !DILocation(line: 17, column: 18, scope: !3046, inlinedAt: !3034)
!3046 = distinct !DILexicalBlock(scope: !3043, file: !655, line: 16, column: 5)
!3047 = !DILocation(line: 17, column: 9, scope: !3046, inlinedAt: !3034)
!3048 = !DILocation(line: 17, column: 16, scope: !3046, inlinedAt: !3034)
!3049 = !DILocation(line: 15, column: 46, scope: !3043, inlinedAt: !3034)
!3050 = !DILocation(line: 15, column: 5, scope: !3043, inlinedAt: !3034)
!3051 = distinct !{!3051, !3044, !3052, !297}
!3052 = !DILocation(line: 18, column: 5, scope: !3038, inlinedAt: !3034)
!3053 = !DILocation(line: 82, column: 1, scope: !2709)
!3054 = distinct !DISubprogram(name: "pqmayo_MAYO_2_ref_m_upper", scope: !99, file: !99, line: 14, type: !3055, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3055 = !DISubroutineType(types: !3056)
!3056 = !{null, !3057, !483, !52, !86}
!3057 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3058, size: 32)
!3058 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !3059)
!3059 = !DIDerivedType(tag: DW_TAG_typedef, name: "mayo_params_t", file: !79, line: 289, baseType: !3060)
!3060 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !79, line: 265, size: 736, elements: !3061)
!3061 = !{!3062, !3063, !3064, !3065, !3066, !3067, !3068, !3069, !3070, !3071, !3072, !3073, !3074, !3075, !3076, !3077, !3078, !3079, !3080, !3081, !3082, !3083, !3084}
!3062 = !DIDerivedType(tag: DW_TAG_member, name: "m", scope: !3060, file: !79, line: 266, baseType: !86, size: 32)
!3063 = !DIDerivedType(tag: DW_TAG_member, name: "n", scope: !3060, file: !79, line: 267, baseType: !86, size: 32, offset: 32)
!3064 = !DIDerivedType(tag: DW_TAG_member, name: "o", scope: !3060, file: !79, line: 268, baseType: !86, size: 32, offset: 64)
!3065 = !DIDerivedType(tag: DW_TAG_member, name: "k", scope: !3060, file: !79, line: 269, baseType: !86, size: 32, offset: 96)
!3066 = !DIDerivedType(tag: DW_TAG_member, name: "q", scope: !3060, file: !79, line: 270, baseType: !86, size: 32, offset: 128)
!3067 = !DIDerivedType(tag: DW_TAG_member, name: "f_tail", scope: !3060, file: !79, line: 271, baseType: !90, size: 32, offset: 160)
!3068 = !DIDerivedType(tag: DW_TAG_member, name: "m_bytes", scope: !3060, file: !79, line: 272, baseType: !86, size: 32, offset: 192)
!3069 = !DIDerivedType(tag: DW_TAG_member, name: "O_bytes", scope: !3060, file: !79, line: 273, baseType: !86, size: 32, offset: 224)
!3070 = !DIDerivedType(tag: DW_TAG_member, name: "v_bytes", scope: !3060, file: !79, line: 274, baseType: !86, size: 32, offset: 256)
!3071 = !DIDerivedType(tag: DW_TAG_member, name: "r_bytes", scope: !3060, file: !79, line: 275, baseType: !86, size: 32, offset: 288)
!3072 = !DIDerivedType(tag: DW_TAG_member, name: "R_bytes", scope: !3060, file: !79, line: 276, baseType: !86, size: 32, offset: 320)
!3073 = !DIDerivedType(tag: DW_TAG_member, name: "P1_bytes", scope: !3060, file: !79, line: 277, baseType: !86, size: 32, offset: 352)
!3074 = !DIDerivedType(tag: DW_TAG_member, name: "P2_bytes", scope: !3060, file: !79, line: 278, baseType: !86, size: 32, offset: 384)
!3075 = !DIDerivedType(tag: DW_TAG_member, name: "P3_bytes", scope: !3060, file: !79, line: 279, baseType: !86, size: 32, offset: 416)
!3076 = !DIDerivedType(tag: DW_TAG_member, name: "csk_bytes", scope: !3060, file: !79, line: 280, baseType: !86, size: 32, offset: 448)
!3077 = !DIDerivedType(tag: DW_TAG_member, name: "cpk_bytes", scope: !3060, file: !79, line: 281, baseType: !86, size: 32, offset: 480)
!3078 = !DIDerivedType(tag: DW_TAG_member, name: "sig_bytes", scope: !3060, file: !79, line: 282, baseType: !86, size: 32, offset: 512)
!3079 = !DIDerivedType(tag: DW_TAG_member, name: "salt_bytes", scope: !3060, file: !79, line: 283, baseType: !86, size: 32, offset: 544)
!3080 = !DIDerivedType(tag: DW_TAG_member, name: "sk_seed_bytes", scope: !3060, file: !79, line: 284, baseType: !86, size: 32, offset: 576)
!3081 = !DIDerivedType(tag: DW_TAG_member, name: "digest_bytes", scope: !3060, file: !79, line: 285, baseType: !86, size: 32, offset: 608)
!3082 = !DIDerivedType(tag: DW_TAG_member, name: "pk_seed_bytes", scope: !3060, file: !79, line: 286, baseType: !86, size: 32, offset: 640)
!3083 = !DIDerivedType(tag: DW_TAG_member, name: "m_vec_limbs", scope: !3060, file: !79, line: 287, baseType: !86, size: 32, offset: 672)
!3084 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !3060, file: !79, line: 288, baseType: !148, size: 32, offset: 704)
!3085 = !DILocalVariable(name: "p", arg: 1, scope: !3054, file: !99, line: 14, type: !3057)
!3086 = !DILocation(line: 0, scope: !3054)
!3087 = !DILocalVariable(name: "in", arg: 2, scope: !3054, file: !99, line: 14, type: !483)
!3088 = !DILocalVariable(name: "out", arg: 3, scope: !3054, file: !99, line: 14, type: !52)
!3089 = !DILocalVariable(name: "size", arg: 4, scope: !3054, file: !99, line: 14, type: !86)
!3090 = !DILocalVariable(name: "m_vec_limbs", scope: !3054, file: !99, line: 19, type: !275)
!3091 = !DILocalVariable(name: "m_vecs_stored", scope: !3054, file: !99, line: 20, type: !86)
!3092 = !DILocalVariable(name: "r", scope: !3093, file: !99, line: 21, type: !86)
!3093 = distinct !DILexicalBlock(scope: !3054, file: !99, line: 21, column: 5)
!3094 = !DILocation(line: 0, scope: !3093)
!3095 = !DILocation(line: 21, column: 10, scope: !3093)
!3096 = !DILocation(line: 20, column: 9, scope: !3054)
!3097 = !DILocation(line: 21, scope: !3093)
!3098 = !DILocation(line: 21, column: 23, scope: !3099)
!3099 = distinct !DILexicalBlock(scope: !3093, file: !99, line: 21, column: 5)
!3100 = !DILocation(line: 21, column: 5, scope: !3093)
!3101 = !DILocation(line: 22, column: 9, scope: !3102)
!3102 = distinct !DILexicalBlock(scope: !3103, file: !99, line: 22, column: 9)
!3103 = distinct !DILexicalBlock(scope: !3099, file: !99, line: 21, column: 36)
!3104 = !DILocation(line: 22, scope: !3102)
!3105 = !DILocalVariable(name: "c", scope: !3102, file: !99, line: 22, type: !86)
!3106 = !DILocation(line: 0, scope: !3102)
!3107 = !DILocation(line: 22, column: 27, scope: !3108)
!3108 = distinct !DILexicalBlock(scope: !3102, file: !99, line: 22, column: 9)
!3109 = !DILocation(line: 23, column: 59, scope: !3110)
!3110 = distinct !DILexicalBlock(scope: !3108, file: !99, line: 22, column: 40)
!3111 = !DILocation(line: 23, column: 66, scope: !3110)
!3112 = !DILocation(line: 23, column: 40, scope: !3110)
!3113 = !DILocation(line: 23, column: 76, scope: !3110)
!3114 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !3115, file: !655, line: 13, type: !86)
!3115 = distinct !DISubprogram(name: "m_vec_copy", scope: !655, file: !655, line: 13, type: !2427, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3116 = !DILocation(line: 0, scope: !3115, inlinedAt: !3117)
!3117 = distinct !DILocation(line: 23, column: 13, scope: !3110)
!3118 = !DILocalVariable(name: "in", arg: 2, scope: !3115, file: !655, line: 13, type: !483)
!3119 = !DILocalVariable(name: "out", arg: 3, scope: !3115, file: !655, line: 13, type: !52)
!3120 = !DILocalVariable(name: "i", scope: !3121, file: !655, line: 15, type: !58)
!3121 = distinct !DILexicalBlock(scope: !3115, file: !655, line: 15, column: 5)
!3122 = !DILocation(line: 0, scope: !3121, inlinedAt: !3117)
!3123 = !DILocation(line: 15, column: 10, scope: !3121, inlinedAt: !3117)
!3124 = !DILocation(line: 15, scope: !3121, inlinedAt: !3117)
!3125 = !DILocation(line: 15, column: 26, scope: !3126, inlinedAt: !3117)
!3126 = distinct !DILexicalBlock(scope: !3121, file: !655, line: 15, column: 5)
!3127 = !DILocation(line: 15, column: 5, scope: !3121, inlinedAt: !3117)
!3128 = !DILocation(line: 17, column: 18, scope: !3129, inlinedAt: !3117)
!3129 = distinct !DILexicalBlock(scope: !3126, file: !655, line: 16, column: 5)
!3130 = !DILocation(line: 17, column: 9, scope: !3129, inlinedAt: !3117)
!3131 = !DILocation(line: 17, column: 16, scope: !3129, inlinedAt: !3117)
!3132 = !DILocation(line: 15, column: 46, scope: !3126, inlinedAt: !3117)
!3133 = !DILocation(line: 15, column: 5, scope: !3126, inlinedAt: !3117)
!3134 = distinct !{!3134, !3127, !3135, !297}
!3135 = !DILocation(line: 18, column: 5, scope: !3121, inlinedAt: !3117)
!3136 = !DILocation(line: 24, column: 19, scope: !3137)
!3137 = distinct !DILexicalBlock(scope: !3110, file: !99, line: 24, column: 17)
!3138 = !DILocation(line: 25, column: 62, scope: !3139)
!3139 = distinct !DILexicalBlock(scope: !3137, file: !99, line: 24, column: 25)
!3140 = !DILocation(line: 25, column: 69, scope: !3139)
!3141 = !DILocation(line: 25, column: 43, scope: !3139)
!3142 = !DILocation(line: 25, column: 79, scope: !3139)
!3143 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !3144, file: !655, line: 22, type: !86)
!3144 = distinct !DISubprogram(name: "m_vec_add", scope: !655, file: !655, line: 22, type: !2427, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3145 = !DILocation(line: 0, scope: !3144, inlinedAt: !3146)
!3146 = distinct !DILocation(line: 25, column: 17, scope: !3139)
!3147 = !DILocalVariable(name: "in", arg: 2, scope: !3144, file: !655, line: 22, type: !483)
!3148 = !DILocalVariable(name: "acc", arg: 3, scope: !3144, file: !655, line: 22, type: !52)
!3149 = !DILocalVariable(name: "i", scope: !3150, file: !655, line: 24, type: !58)
!3150 = distinct !DILexicalBlock(scope: !3144, file: !655, line: 24, column: 5)
!3151 = !DILocation(line: 0, scope: !3150, inlinedAt: !3146)
!3152 = !DILocation(line: 24, column: 10, scope: !3150, inlinedAt: !3146)
!3153 = !DILocation(line: 24, scope: !3150, inlinedAt: !3146)
!3154 = !DILocation(line: 24, column: 26, scope: !3155, inlinedAt: !3146)
!3155 = distinct !DILexicalBlock(scope: !3150, file: !655, line: 24, column: 5)
!3156 = !DILocation(line: 24, column: 5, scope: !3150, inlinedAt: !3146)
!3157 = !DILocation(line: 26, column: 19, scope: !3158, inlinedAt: !3146)
!3158 = distinct !DILexicalBlock(scope: !3155, file: !655, line: 25, column: 5)
!3159 = !DILocation(line: 26, column: 9, scope: !3158, inlinedAt: !3146)
!3160 = !DILocation(line: 26, column: 16, scope: !3158, inlinedAt: !3146)
!3161 = !DILocation(line: 24, column: 46, scope: !3155, inlinedAt: !3146)
!3162 = !DILocation(line: 24, column: 5, scope: !3155, inlinedAt: !3146)
!3163 = distinct !{!3163, !3156, !3164, !297}
!3164 = !DILocation(line: 27, column: 5, scope: !3150, inlinedAt: !3146)
!3165 = !DILocation(line: 27, column: 27, scope: !3110)
!3166 = !DILocation(line: 22, column: 36, scope: !3108)
!3167 = !DILocation(line: 22, column: 9, scope: !3108)
!3168 = distinct !{!3168, !3101, !3169, !297}
!3169 = !DILocation(line: 28, column: 9, scope: !3102)
!3170 = !DILocation(line: 21, column: 32, scope: !3099)
!3171 = !DILocation(line: 21, column: 5, scope: !3099)
!3172 = distinct !{!3172, !3100, !3173, !297}
!3173 = !DILocation(line: 29, column: 5, scope: !3093)
!3174 = !DILocation(line: 30, column: 1, scope: !3054)
!3175 = distinct !DISubprogram(name: "pqmayo_MAYO_2_ref_sample_solution", scope: !99, file: !99, line: 40, type: !3176, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3176 = !DISubroutineType(types: !3177)
!3177 = !{!86, !3057, !61, !90, !90, !61, !86, !86, !86, !86}
!3178 = !DILocalVariable(name: "p", arg: 1, scope: !3175, file: !99, line: 40, type: !3057)
!3179 = !DILocation(line: 0, scope: !3175)
!3180 = !DILocalVariable(name: "A", arg: 2, scope: !3175, file: !99, line: 40, type: !61)
!3181 = !DILocalVariable(name: "y", arg: 3, scope: !3175, file: !99, line: 41, type: !90)
!3182 = !DILocalVariable(name: "r", arg: 4, scope: !3175, file: !99, line: 41, type: !90)
!3183 = !DILocalVariable(name: "x", arg: 5, scope: !3175, file: !99, line: 42, type: !61)
!3184 = !DILocalVariable(name: "k", arg: 6, scope: !3175, file: !99, line: 42, type: !86)
!3185 = !DILocalVariable(name: "o", arg: 7, scope: !3175, file: !99, line: 42, type: !86)
!3186 = !DILocalVariable(name: "m", arg: 8, scope: !3175, file: !99, line: 42, type: !86)
!3187 = !DILocalVariable(name: "A_cols", arg: 9, scope: !3175, file: !99, line: 42, type: !86)
!3188 = !DILocalVariable(name: "i", scope: !3189, file: !99, line: 51, type: !86)
!3189 = distinct !DILexicalBlock(scope: !3175, file: !99, line: 51, column: 5)
!3190 = !DILocation(line: 0, scope: !3189)
!3191 = !DILocation(line: 51, column: 10, scope: !3189)
!3192 = !DILocation(line: 51, scope: !3189)
!3193 = !DILocation(line: 51, column: 23, scope: !3194)
!3194 = distinct !DILexicalBlock(scope: !3189, file: !99, line: 51, column: 5)
!3195 = !DILocation(line: 51, column: 5, scope: !3189)
!3196 = !DILocation(line: 57, column: 5, scope: !3197)
!3197 = distinct !DILexicalBlock(scope: !3175, file: !99, line: 57, column: 5)
!3198 = !DILocation(line: 52, column: 16, scope: !3199)
!3199 = distinct !DILexicalBlock(scope: !3194, file: !99, line: 51, column: 37)
!3200 = !DILocation(line: 52, column: 9, scope: !3199)
!3201 = !DILocation(line: 52, column: 14, scope: !3199)
!3202 = !DILocation(line: 51, column: 33, scope: !3194)
!3203 = !DILocation(line: 51, column: 5, scope: !3194)
!3204 = distinct !{!3204, !3195, !3205, !297}
!3205 = !DILocation(line: 53, column: 5, scope: !3189)
!3206 = !DILocation(line: 57, scope: !3197)
!3207 = !DILocalVariable(name: "i", scope: !3197, file: !99, line: 57, type: !86)
!3208 = !DILocation(line: 0, scope: !3197)
!3209 = !DILocation(line: 57, column: 23, scope: !3210)
!3210 = distinct !DILexicalBlock(scope: !3197, file: !99, line: 57, column: 5)
!3211 = !DILocation(line: 58, column: 13, scope: !3212)
!3212 = distinct !DILexicalBlock(scope: !3210, file: !99, line: 57, column: 33)
!3213 = !DILocation(line: 58, column: 26, scope: !3212)
!3214 = !DILocation(line: 58, column: 30, scope: !3212)
!3215 = !DILocation(line: 58, column: 21, scope: !3212)
!3216 = !DILocation(line: 58, column: 9, scope: !3212)
!3217 = !DILocation(line: 58, column: 36, scope: !3212)
!3218 = !DILocation(line: 57, column: 29, scope: !3210)
!3219 = !DILocation(line: 57, column: 5, scope: !3210)
!3220 = distinct !{!3220, !3196, !3221, !297}
!3221 = !DILocation(line: 59, column: 5, scope: !3197)
!3222 = !DILocation(line: 60, column: 25, scope: !3175)
!3223 = !DILocalVariable(name: "a", arg: 1, scope: !3224, file: !665, line: 78, type: !90)
!3224 = distinct !DISubprogram(name: "mat_mul", scope: !665, file: !665, line: 78, type: !1808, scopeLine: 79, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3225 = !DILocation(line: 0, scope: !3224, inlinedAt: !3226)
!3226 = distinct !DILocation(line: 60, column: 5, scope: !3175)
!3227 = !DILocalVariable(name: "b", arg: 2, scope: !3224, file: !665, line: 78, type: !90)
!3228 = !DILocalVariable(name: "c", arg: 3, scope: !3224, file: !665, line: 79, type: !61)
!3229 = !DILocalVariable(name: "colrow_ab", arg: 4, scope: !3224, file: !665, line: 79, type: !86)
!3230 = !DILocalVariable(name: "row_a", arg: 5, scope: !3224, file: !665, line: 79, type: !86)
!3231 = !DILocalVariable(name: "col_b", arg: 6, scope: !3224, file: !665, line: 79, type: !86)
!3232 = !DILocalVariable(name: "i", scope: !3233, file: !665, line: 80, type: !86)
!3233 = distinct !DILexicalBlock(scope: !3224, file: !665, line: 80, column: 5)
!3234 = !DILocation(line: 0, scope: !3233, inlinedAt: !3226)
!3235 = !DILocation(line: 80, column: 10, scope: !3233, inlinedAt: !3226)
!3236 = !DILocation(line: 80, scope: !3233, inlinedAt: !3226)
!3237 = !DILocation(line: 80, column: 23, scope: !3238, inlinedAt: !3226)
!3238 = distinct !DILexicalBlock(scope: !3233, file: !665, line: 80, column: 5)
!3239 = !DILocation(line: 80, column: 5, scope: !3233, inlinedAt: !3226)
!3240 = !DILocation(line: 81, column: 9, scope: !3241, inlinedAt: !3226)
!3241 = distinct !DILexicalBlock(scope: !3242, file: !665, line: 81, column: 9)
!3242 = distinct !DILexicalBlock(scope: !3238, file: !665, line: 80, column: 53)
!3243 = !DILocation(line: 63, column: 5, scope: !3244)
!3244 = distinct !DILexicalBlock(scope: !3175, file: !99, line: 63, column: 5)
!3245 = !DILocation(line: 81, scope: !3241, inlinedAt: !3226)
!3246 = !DILocalVariable(name: "j", scope: !3241, file: !665, line: 81, type: !86)
!3247 = !DILocation(line: 0, scope: !3241, inlinedAt: !3226)
!3248 = !DILocation(line: 81, column: 27, scope: !3249, inlinedAt: !3226)
!3249 = distinct !DILexicalBlock(scope: !3241, file: !665, line: 81, column: 9)
!3250 = !DILocation(line: 82, column: 31, scope: !3251, inlinedAt: !3226)
!3251 = distinct !DILexicalBlock(scope: !3249, file: !665, line: 81, column: 46)
!3252 = !DILocalVariable(name: "a", arg: 1, scope: !3253, file: !665, line: 69, type: !90)
!3253 = distinct !DISubprogram(name: "lincomb", scope: !665, file: !665, line: 69, type: !1837, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3254 = !DILocation(line: 0, scope: !3253, inlinedAt: !3255)
!3255 = distinct !DILocation(line: 82, column: 18, scope: !3251, inlinedAt: !3226)
!3256 = !DILocalVariable(name: "b", arg: 2, scope: !3253, file: !665, line: 70, type: !90)
!3257 = !DILocalVariable(name: "n", arg: 3, scope: !3253, file: !665, line: 70, type: !86)
!3258 = !DILocalVariable(name: "m", arg: 4, scope: !3253, file: !665, line: 70, type: !86)
!3259 = !DILocalVariable(name: "ret", scope: !3253, file: !665, line: 71, type: !51)
!3260 = !DILocalVariable(name: "i", scope: !3261, file: !665, line: 72, type: !86)
!3261 = distinct !DILexicalBlock(scope: !3253, file: !665, line: 72, column: 5)
!3262 = !DILocation(line: 0, scope: !3261, inlinedAt: !3255)
!3263 = !DILocation(line: 72, column: 10, scope: !3261, inlinedAt: !3255)
!3264 = !DILocation(line: 72, scope: !3261, inlinedAt: !3255)
!3265 = !DILocation(line: 72, column: 23, scope: !3266, inlinedAt: !3255)
!3266 = distinct !DILexicalBlock(scope: !3261, file: !665, line: 72, column: 5)
!3267 = !DILocation(line: 72, column: 5, scope: !3261, inlinedAt: !3255)
!3268 = !DILocation(line: 73, column: 27, scope: !3269, inlinedAt: !3255)
!3269 = distinct !DILexicalBlock(scope: !3266, file: !665, line: 72, column: 41)
!3270 = !DILocation(line: 73, column: 33, scope: !3269, inlinedAt: !3255)
!3271 = !DILocalVariable(name: "a", arg: 1, scope: !3272, file: !665, line: 8, type: !51)
!3272 = distinct !DISubprogram(name: "mul_f", scope: !665, file: !665, line: 8, type: !1523, scopeLine: 8, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3273 = !DILocation(line: 0, scope: !3272, inlinedAt: !3274)
!3274 = distinct !DILocation(line: 73, column: 21, scope: !3269, inlinedAt: !3255)
!3275 = !DILocalVariable(name: "b", arg: 2, scope: !3272, file: !665, line: 8, type: !51)
!3276 = !DILocation(line: 13, column: 10, scope: !3272, inlinedAt: !3274)
!3277 = !DILocation(line: 13, column: 7, scope: !3272, inlinedAt: !3274)
!3278 = !DILocation(line: 16, column: 17, scope: !3272, inlinedAt: !3274)
!3279 = !DILocalVariable(name: "p", scope: !3272, file: !665, line: 10, type: !51)
!3280 = !DILocation(line: 17, column: 13, scope: !3272, inlinedAt: !3274)
!3281 = !DILocation(line: 17, column: 17, scope: !3272, inlinedAt: !3274)
!3282 = !DILocation(line: 17, column: 7, scope: !3272, inlinedAt: !3274)
!3283 = !DILocation(line: 18, column: 13, scope: !3272, inlinedAt: !3274)
!3284 = !DILocation(line: 18, column: 17, scope: !3272, inlinedAt: !3274)
!3285 = !DILocation(line: 18, column: 7, scope: !3272, inlinedAt: !3274)
!3286 = !DILocation(line: 19, column: 13, scope: !3272, inlinedAt: !3274)
!3287 = !DILocation(line: 19, column: 17, scope: !3272, inlinedAt: !3274)
!3288 = !DILocation(line: 19, column: 7, scope: !3272, inlinedAt: !3274)
!3289 = !DILocalVariable(name: "top_p", scope: !3272, file: !665, line: 22, type: !51)
!3290 = !DILocation(line: 23, column: 37, scope: !3272, inlinedAt: !3274)
!3291 = !DILocation(line: 23, column: 52, scope: !3272, inlinedAt: !3274)
!3292 = !DILocation(line: 23, column: 43, scope: !3272, inlinedAt: !3274)
!3293 = !DILocation(line: 23, column: 59, scope: !3272, inlinedAt: !3274)
!3294 = !DILocalVariable(name: "out", scope: !3272, file: !665, line: 23, type: !51)
!3295 = !DILocalVariable(name: "a", arg: 1, scope: !3296, file: !665, line: 42, type: !51)
!3296 = distinct !DISubprogram(name: "add_f", scope: !665, file: !665, line: 42, type: !1523, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3297 = !DILocation(line: 0, scope: !3296, inlinedAt: !3298)
!3298 = distinct !DILocation(line: 73, column: 15, scope: !3269, inlinedAt: !3255)
!3299 = !DILocalVariable(name: "b", arg: 2, scope: !3296, file: !665, line: 42, type: !51)
!3300 = !DILocation(line: 43, column: 14, scope: !3296, inlinedAt: !3298)
!3301 = !DILocation(line: 72, column: 28, scope: !3266, inlinedAt: !3255)
!3302 = !DILocation(line: 72, column: 35, scope: !3266, inlinedAt: !3255)
!3303 = !DILocation(line: 72, column: 5, scope: !3266, inlinedAt: !3255)
!3304 = distinct !{!3304, !3267, !3305, !297}
!3305 = !DILocation(line: 74, column: 5, scope: !3261, inlinedAt: !3255)
!3306 = !DILocation(line: 82, column: 16, scope: !3251, inlinedAt: !3226)
!3307 = !DILocation(line: 81, column: 41, scope: !3249, inlinedAt: !3226)
!3308 = !DILocation(line: 81, column: 9, scope: !3249, inlinedAt: !3226)
!3309 = distinct !{!3309, !3240, !3310, !297}
!3310 = !DILocation(line: 83, column: 9, scope: !3241, inlinedAt: !3226)
!3311 = !DILocation(line: 80, column: 32, scope: !3238, inlinedAt: !3226)
!3312 = !DILocation(line: 80, column: 39, scope: !3238, inlinedAt: !3226)
!3313 = !DILocation(line: 80, column: 5, scope: !3238, inlinedAt: !3226)
!3314 = distinct !{!3314, !3239, !3315, !297}
!3315 = !DILocation(line: 84, column: 5, scope: !3233, inlinedAt: !3226)
!3316 = !DILocation(line: 63, scope: !3244)
!3317 = !DILocalVariable(name: "i", scope: !3244, file: !99, line: 63, type: !86)
!3318 = !DILocation(line: 0, scope: !3244)
!3319 = !DILocation(line: 63, column: 23, scope: !3320)
!3320 = distinct !DILexicalBlock(scope: !3244, file: !99, line: 63, column: 5)
!3321 = !DILocation(line: 64, column: 44, scope: !3322)
!3322 = distinct !DILexicalBlock(scope: !3320, file: !99, line: 63, column: 33)
!3323 = !DILocation(line: 64, column: 50, scope: !3322)
!3324 = !DILocalVariable(name: "a", arg: 1, scope: !3325, file: !665, line: 47, type: !51)
!3325 = distinct !DISubprogram(name: "sub_f", scope: !665, file: !665, line: 47, type: !1523, scopeLine: 47, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3326 = !DILocation(line: 0, scope: !3325, inlinedAt: !3327)
!3327 = distinct !DILocation(line: 64, column: 38, scope: !3322)
!3328 = !DILocalVariable(name: "b", arg: 2, scope: !3325, file: !665, line: 47, type: !51)
!3329 = !DILocation(line: 48, column: 14, scope: !3325, inlinedAt: !3327)
!3330 = !DILocation(line: 64, column: 13, scope: !3322)
!3331 = !DILocation(line: 64, column: 26, scope: !3322)
!3332 = !DILocation(line: 64, column: 30, scope: !3322)
!3333 = !DILocation(line: 64, column: 21, scope: !3322)
!3334 = !DILocation(line: 64, column: 9, scope: !3322)
!3335 = !DILocation(line: 64, column: 36, scope: !3322)
!3336 = !DILocation(line: 63, column: 29, scope: !3320)
!3337 = !DILocation(line: 63, column: 5, scope: !3320)
!3338 = distinct !{!3338, !3243, !3339, !297}
!3339 = !DILocation(line: 65, column: 5, scope: !3244)
!3340 = !DILocation(line: 67, column: 16, scope: !3175)
!3341 = !DILocation(line: 67, column: 20, scope: !3175)
!3342 = !DILocation(line: 64, column: 27, scope: !3343, inlinedAt: !3347)
!3343 = distinct !DISubprogram(name: "EF", scope: !3344, file: !3344, line: 60, type: !3345, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3344 = !DIFile(filename: "../../../src/generic/echelon_form.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!3345 = !DISubroutineType(types: !3346)
!3346 = !{null, !61, !86, !86}
!3347 = distinct !DILocation(line: 67, column: 5, scope: !3175)
!3348 = !DILocalVariable(name: "A", arg: 1, scope: !3343, file: !3344, line: 60, type: !61)
!3349 = !DILocation(line: 0, scope: !3343, inlinedAt: !3347)
!3350 = !DILocalVariable(name: "nrows", arg: 2, scope: !3343, file: !3344, line: 60, type: !86)
!3351 = !DILocalVariable(name: "ncols", arg: 3, scope: !3343, file: !3344, line: 60, type: !86)
!3352 = !DILocalVariable(name: "_pivot_row", scope: !3343, file: !3344, line: 62, type: !3353, align: 256)
!3353 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 320, elements: !3354)
!3354 = !{!3355}
!3355 = !DISubrange(count: 5)
!3356 = !DILocation(line: 62, column: 27, scope: !3343, inlinedAt: !3347)
!3357 = !DILocalVariable(name: "_pivot_row2", scope: !3343, file: !3344, line: 63, type: !3353, align: 256)
!3358 = !DILocation(line: 63, column: 27, scope: !3343, inlinedAt: !3347)
!3359 = !DILocalVariable(name: "packed_A", scope: !3343, file: !3344, line: 64, type: !3360, align: 256)
!3360 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 20480, elements: !3361)
!3361 = !{!3362}
!3362 = !DISubrange(count: 320)
!3363 = !DILocation(line: 66, column: 26, scope: !3343, inlinedAt: !3347)
!3364 = !DILocation(line: 66, column: 32, scope: !3343, inlinedAt: !3347)
!3365 = !DILocalVariable(name: "row_len", scope: !3343, file: !3344, line: 66, type: !86)
!3366 = !DILocalVariable(name: "i", scope: !3367, file: !3344, line: 69, type: !86)
!3367 = distinct !DILexicalBlock(scope: !3343, file: !3344, line: 69, column: 5)
!3368 = !DILocation(line: 0, scope: !3367, inlinedAt: !3347)
!3369 = !DILocation(line: 69, column: 10, scope: !3367, inlinedAt: !3347)
!3370 = !DILocation(line: 69, scope: !3367, inlinedAt: !3347)
!3371 = !DILocation(line: 69, column: 23, scope: !3372, inlinedAt: !3347)
!3372 = distinct !DILexicalBlock(scope: !3367, file: !3344, line: 69, column: 5)
!3373 = !DILocation(line: 69, column: 5, scope: !3367, inlinedAt: !3347)
!3374 = !DILocation(line: 77, column: 5, scope: !3375, inlinedAt: !3347)
!3375 = distinct !DILexicalBlock(scope: !3343, file: !3344, line: 77, column: 5)
!3376 = !DILocation(line: 70, column: 29, scope: !3377, inlinedAt: !3347)
!3377 = distinct !DILexicalBlock(scope: !3372, file: !3344, line: 69, column: 37)
!3378 = !DILocation(line: 70, column: 25, scope: !3377, inlinedAt: !3347)
!3379 = !DILocation(line: 70, column: 51, scope: !3377, inlinedAt: !3347)
!3380 = !DILocation(line: 70, column: 47, scope: !3377, inlinedAt: !3347)
!3381 = !DILocalVariable(name: "in", arg: 1, scope: !3382, file: !3344, line: 24, type: !90)
!3382 = distinct !DISubprogram(name: "ef_pack_m_vec", scope: !3344, file: !3344, line: 24, type: !3383, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3383 = !DISubroutineType(types: !3384)
!3384 = !{null, !90, !52, !86}
!3385 = !DILocation(line: 0, scope: !3382, inlinedAt: !3386)
!3386 = distinct !DILocation(line: 70, column: 9, scope: !3377, inlinedAt: !3347)
!3387 = !DILocalVariable(name: "out", arg: 2, scope: !3382, file: !3344, line: 24, type: !52)
!3388 = !DILocalVariable(name: "ncols", arg: 3, scope: !3382, file: !3344, line: 24, type: !86)
!3389 = !DILocalVariable(name: "out8", scope: !3382, file: !3344, line: 26, type: !61)
!3390 = !DILocalVariable(name: "i", scope: !3382, file: !3344, line: 25, type: !86)
!3391 = !DILocation(line: 27, column: 9, scope: !3392, inlinedAt: !3386)
!3392 = distinct !DILexicalBlock(scope: !3382, file: !3344, line: 27, column: 5)
!3393 = !DILocation(line: 27, scope: !3392, inlinedAt: !3386)
!3394 = !DILocation(line: 27, column: 20, scope: !3395, inlinedAt: !3386)
!3395 = distinct !DILexicalBlock(scope: !3392, file: !3344, line: 27, column: 5)
!3396 = !DILocation(line: 27, column: 5, scope: !3392, inlinedAt: !3386)
!3397 = !DILocation(line: 31, column: 23, scope: !3398, inlinedAt: !3386)
!3398 = distinct !DILexicalBlock(scope: !3395, file: !3344, line: 27, column: 36)
!3399 = !DILocation(line: 31, column: 44, scope: !3398, inlinedAt: !3386)
!3400 = !DILocation(line: 31, column: 40, scope: !3398, inlinedAt: !3386)
!3401 = !DILocation(line: 31, column: 48, scope: !3398, inlinedAt: !3386)
!3402 = !DILocation(line: 31, column: 37, scope: !3398, inlinedAt: !3386)
!3403 = !DILocation(line: 31, column: 15, scope: !3398, inlinedAt: !3386)
!3404 = !DILocation(line: 31, column: 9, scope: !3398, inlinedAt: !3386)
!3405 = !DILocation(line: 31, column: 20, scope: !3398, inlinedAt: !3386)
!3406 = !DILocation(line: 27, column: 31, scope: !3395, inlinedAt: !3386)
!3407 = !DILocation(line: 27, column: 5, scope: !3395, inlinedAt: !3386)
!3408 = distinct !{!3408, !3396, !3409, !297}
!3409 = !DILocation(line: 33, column: 5, scope: !3392, inlinedAt: !3386)
!3410 = !DILocation(line: 34, column: 19, scope: !3411, inlinedAt: !3386)
!3411 = distinct !DILexicalBlock(scope: !3382, file: !3344, line: 34, column: 9)
!3412 = !DILocation(line: 38, column: 23, scope: !3413, inlinedAt: !3386)
!3413 = distinct !DILexicalBlock(scope: !3411, file: !3344, line: 34, column: 24)
!3414 = !DILocation(line: 38, column: 15, scope: !3413, inlinedAt: !3386)
!3415 = !DILocation(line: 38, column: 9, scope: !3413, inlinedAt: !3386)
!3416 = !DILocation(line: 38, column: 20, scope: !3413, inlinedAt: !3386)
!3417 = !DILocation(line: 40, column: 5, scope: !3413, inlinedAt: !3386)
!3418 = !DILocation(line: 69, column: 33, scope: !3372, inlinedAt: !3347)
!3419 = !DILocation(line: 69, column: 5, scope: !3372, inlinedAt: !3347)
!3420 = distinct !{!3420, !3373, !3421, !297}
!3421 = !DILocation(line: 71, column: 5, scope: !3367, inlinedAt: !3347)
!3422 = !DILocation(line: 77, scope: !3375, inlinedAt: !3347)
!3423 = !DILocalVariable(name: "pivot_row", scope: !3343, file: !3344, line: 76, type: !86)
!3424 = !DILocalVariable(name: "pivot_col", scope: !3375, file: !3344, line: 77, type: !86)
!3425 = !DILocation(line: 0, scope: !3375, inlinedAt: !3347)
!3426 = !DILocation(line: 77, column: 39, scope: !3427, inlinedAt: !3347)
!3427 = distinct !DILexicalBlock(scope: !3375, file: !3344, line: 77, column: 5)
!3428 = !DILocation(line: 138, column: 5, scope: !3429, inlinedAt: !3347)
!3429 = distinct !DILexicalBlock(scope: !3343, file: !3344, line: 138, column: 5)
!3430 = !DILocation(line: 79, column: 37, scope: !3431, inlinedAt: !3347)
!3431 = distinct !DILexicalBlock(scope: !3427, file: !3344, line: 77, column: 61)
!3432 = !DILocalVariable(name: "pivot_row_lower_bound", scope: !3431, file: !3344, line: 79, type: !86)
!3433 = !DILocation(line: 0, scope: !3431, inlinedAt: !3347)
!3434 = !DILocation(line: 80, column: 37, scope: !3431, inlinedAt: !3347)
!3435 = !DILocalVariable(name: "pivot_row_upper_bound", scope: !3431, file: !3344, line: 80, type: !86)
!3436 = !DILocalVariable(name: "i", scope: !3437, file: !3344, line: 85, type: !86)
!3437 = distinct !DILexicalBlock(scope: !3431, file: !3344, line: 85, column: 9)
!3438 = !DILocation(line: 0, scope: !3437, inlinedAt: !3347)
!3439 = !DILocation(line: 85, column: 14, scope: !3437, inlinedAt: !3347)
!3440 = !DILocation(line: 85, scope: !3437, inlinedAt: !3347)
!3441 = !DILocation(line: 85, column: 27, scope: !3442, inlinedAt: !3347)
!3442 = distinct !DILexicalBlock(scope: !3437, file: !3344, line: 85, column: 9)
!3443 = !DILocation(line: 85, column: 9, scope: !3437, inlinedAt: !3347)
!3444 = !DILocation(line: 93, column: 9, scope: !3445, inlinedAt: !3347)
!3445 = distinct !DILexicalBlock(scope: !3431, file: !3344, line: 93, column: 9)
!3446 = !DILocation(line: 86, column: 13, scope: !3447, inlinedAt: !3347)
!3447 = distinct !DILexicalBlock(scope: !3442, file: !3344, line: 85, column: 43)
!3448 = !DILocation(line: 86, column: 27, scope: !3447, inlinedAt: !3347)
!3449 = !DILocation(line: 87, column: 13, scope: !3447, inlinedAt: !3347)
!3450 = !DILocation(line: 87, column: 28, scope: !3447, inlinedAt: !3347)
!3451 = !DILocation(line: 85, column: 39, scope: !3442, inlinedAt: !3347)
!3452 = !DILocation(line: 85, column: 9, scope: !3442, inlinedAt: !3347)
!3453 = distinct !{!3453, !3443, !3454, !297}
!3454 = !DILocation(line: 88, column: 9, scope: !3437, inlinedAt: !3347)
!3455 = !DILocation(line: 0, scope: !3445, inlinedAt: !3347)
!3456 = !DILocalVariable(name: "row", scope: !3445, file: !3344, line: 93, type: !86)
!3457 = !DILocalVariable(name: "pivot", scope: !3431, file: !3344, line: 91, type: !51)
!3458 = !DILocalVariable(name: "pivot_is_zero", scope: !3431, file: !3344, line: 92, type: !53)
!3459 = !DILocation(line: 94, column: 24, scope: !3460, inlinedAt: !3347)
!3460 = distinct !DILexicalBlock(scope: !3445, file: !3344, line: 93, column: 9)
!3461 = !DILocation(line: 94, column: 21, scope: !3460, inlinedAt: !3347)
!3462 = !DILocalVariable(name: "a", arg: 1, scope: !3463, file: !3464, line: 46, type: !86)
!3463 = distinct !DISubprogram(name: "ct_compare_64", scope: !3464, file: !3464, line: 46, type: !3465, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3464 = !DIFile(filename: "../../../src/arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!3465 = !DISubroutineType(types: !3466)
!3466 = !{!53, !86, !86}
!3467 = !DILocation(line: 0, scope: !3463, inlinedAt: !3468)
!3468 = distinct !DILocation(line: 96, column: 38, scope: !3469, inlinedAt: !3347)
!3469 = distinct !DILexicalBlock(scope: !3460, file: !3344, line: 94, column: 80)
!3470 = !DILocalVariable(name: "b", arg: 2, scope: !3463, file: !3464, line: 46, type: !86)
!3471 = !DILocation(line: 47, column: 38, scope: !3463, inlinedAt: !3468)
!3472 = !DILocation(line: 47, column: 73, scope: !3463, inlinedAt: !3468)
!3473 = !DILocation(line: 96, column: 37, scope: !3469, inlinedAt: !3347)
!3474 = !DILocalVariable(name: "is_pivot_row", scope: !3469, file: !3344, line: 96, type: !53)
!3475 = !DILocation(line: 0, scope: !3469, inlinedAt: !3347)
!3476 = !DILocalVariable(name: "a", arg: 1, scope: !3477, file: !3464, line: 35, type: !86)
!3477 = distinct !DISubprogram(name: "ct_64_is_greater_than", scope: !3464, file: !3464, line: 35, type: !3465, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3478 = !DILocation(line: 0, scope: !3477, inlinedAt: !3479)
!3479 = distinct !DILocation(line: 97, column: 40, scope: !3469, inlinedAt: !3347)
!3480 = !DILocalVariable(name: "b", arg: 2, scope: !3477, file: !3464, line: 35, type: !86)
!3481 = !DILocalVariable(name: "diff", scope: !3477, file: !3464, line: 36, type: !87)
!3482 = !DILocation(line: 37, column: 30, scope: !3477, inlinedAt: !3479)
!3483 = !DILocation(line: 37, column: 59, scope: !3477, inlinedAt: !3479)
!3484 = !DILocation(line: 37, column: 57, scope: !3477, inlinedAt: !3479)
!3485 = !DILocalVariable(name: "below_pivot_row", scope: !3469, file: !3344, line: 97, type: !53)
!3486 = !DILocalVariable(name: "j", scope: !3487, file: !3344, line: 99, type: !86)
!3487 = distinct !DILexicalBlock(scope: !3469, file: !3344, line: 99, column: 13)
!3488 = !DILocation(line: 0, scope: !3487, inlinedAt: !3347)
!3489 = !DILocation(line: 99, column: 18, scope: !3487, inlinedAt: !3347)
!3490 = !DILocation(line: 99, scope: !3487, inlinedAt: !3347)
!3491 = !DILocation(line: 99, column: 31, scope: !3492, inlinedAt: !3347)
!3492 = distinct !DILexicalBlock(scope: !3487, file: !3344, line: 99, column: 13)
!3493 = !DILocation(line: 99, column: 13, scope: !3487, inlinedAt: !3347)
!3494 = !DILocation(line: 100, column: 67, scope: !3495, inlinedAt: !3347)
!3495 = distinct !DILexicalBlock(scope: !3492, file: !3344, line: 99, column: 47)
!3496 = !DILocation(line: 100, column: 48, scope: !3495, inlinedAt: !3347)
!3497 = !DILocation(line: 101, column: 47, scope: !3495, inlinedAt: !3347)
!3498 = !DILocation(line: 101, column: 57, scope: !3495, inlinedAt: !3347)
!3499 = !DILocation(line: 101, column: 34, scope: !3495, inlinedAt: !3347)
!3500 = !DILocation(line: 100, column: 85, scope: !3495, inlinedAt: !3347)
!3501 = !DILocation(line: 100, column: 17, scope: !3495, inlinedAt: !3347)
!3502 = !DILocation(line: 100, column: 31, scope: !3495, inlinedAt: !3347)
!3503 = !DILocation(line: 99, column: 43, scope: !3492, inlinedAt: !3347)
!3504 = !DILocation(line: 99, column: 13, scope: !3492, inlinedAt: !3347)
!3505 = distinct !{!3505, !3493, !3506, !297}
!3506 = !DILocation(line: 102, column: 13, scope: !3487, inlinedAt: !3347)
!3507 = !DILocalVariable(name: "in", arg: 1, scope: !3508, file: !3344, line: 16, type: !483)
!3508 = distinct !DISubprogram(name: "m_extract_element", scope: !3344, file: !3344, line: 16, type: !3509, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3509 = !DISubroutineType(types: !3510)
!3510 = !{!51, !483, !86}
!3511 = !DILocation(line: 0, scope: !3508, inlinedAt: !3512)
!3512 = distinct !DILocation(line: 103, column: 21, scope: !3469, inlinedAt: !3347)
!3513 = !DILocalVariable(name: "index", arg: 2, scope: !3508, file: !3344, line: 16, type: !86)
!3514 = !DILocation(line: 17, column: 27, scope: !3508, inlinedAt: !3512)
!3515 = !DILocalVariable(name: "leg", scope: !3508, file: !3344, line: 17, type: !275)
!3516 = !DILocalVariable(name: "offset", scope: !3508, file: !3344, line: 18, type: !275)
!3517 = !DILocation(line: 20, column: 13, scope: !3508, inlinedAt: !3512)
!3518 = !DILocation(line: 20, column: 31, scope: !3508, inlinedAt: !3512)
!3519 = !DILocation(line: 20, column: 21, scope: !3508, inlinedAt: !3512)
!3520 = !DILocation(line: 20, column: 12, scope: !3508, inlinedAt: !3512)
!3521 = !DILocation(line: 0, scope: !3463, inlinedAt: !3522)
!3522 = distinct !DILocation(line: 104, column: 30, scope: !3469, inlinedAt: !3347)
!3523 = !DILocation(line: 47, column: 73, scope: !3463, inlinedAt: !3522)
!3524 = !DILocation(line: 104, column: 29, scope: !3469, inlinedAt: !3347)
!3525 = !DILocation(line: 94, column: 76, scope: !3460, inlinedAt: !3347)
!3526 = !DILocation(line: 93, column: 9, scope: !3460, inlinedAt: !3347)
!3527 = distinct !{!3527, !3444, !3528, !297}
!3528 = !DILocation(line: 105, column: 9, scope: !3445, inlinedAt: !3347)
!3529 = !DILocalVariable(name: "a", arg: 1, scope: !3530, file: !665, line: 56, type: !51)
!3530 = distinct !DISubprogram(name: "inverse_f", scope: !665, file: !665, line: 56, type: !3531, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3531 = !DISubroutineType(types: !3532)
!3532 = !{!51, !51}
!3533 = !DILocation(line: 0, scope: !3530, inlinedAt: !3534)
!3534 = distinct !DILocation(line: 108, column: 19, scope: !3431, inlinedAt: !3347)
!3535 = !DILocation(line: 0, scope: !3272, inlinedAt: !3536)
!3536 = distinct !DILocation(line: 60, column: 24, scope: !3530, inlinedAt: !3534)
!3537 = !DILocation(line: 13, column: 10, scope: !3272, inlinedAt: !3536)
!3538 = !DILocation(line: 13, column: 7, scope: !3272, inlinedAt: !3536)
!3539 = !DILocation(line: 16, column: 17, scope: !3272, inlinedAt: !3536)
!3540 = !DILocation(line: 17, column: 13, scope: !3272, inlinedAt: !3536)
!3541 = !DILocation(line: 17, column: 17, scope: !3272, inlinedAt: !3536)
!3542 = !DILocation(line: 17, column: 7, scope: !3272, inlinedAt: !3536)
!3543 = !DILocation(line: 18, column: 13, scope: !3272, inlinedAt: !3536)
!3544 = !DILocation(line: 18, column: 17, scope: !3272, inlinedAt: !3536)
!3545 = !DILocation(line: 18, column: 7, scope: !3272, inlinedAt: !3536)
!3546 = !DILocation(line: 19, column: 13, scope: !3272, inlinedAt: !3536)
!3547 = !DILocation(line: 19, column: 17, scope: !3272, inlinedAt: !3536)
!3548 = !DILocation(line: 19, column: 7, scope: !3272, inlinedAt: !3536)
!3549 = !DILocation(line: 23, column: 37, scope: !3272, inlinedAt: !3536)
!3550 = !DILocation(line: 23, column: 52, scope: !3272, inlinedAt: !3536)
!3551 = !DILocation(line: 23, column: 43, scope: !3272, inlinedAt: !3536)
!3552 = !DILocation(line: 23, column: 59, scope: !3272, inlinedAt: !3536)
!3553 = !DILocalVariable(name: "a2", scope: !3530, file: !665, line: 60, type: !51)
!3554 = !DILocation(line: 0, scope: !3272, inlinedAt: !3555)
!3555 = distinct !DILocation(line: 61, column: 24, scope: !3530, inlinedAt: !3534)
!3556 = !DILocation(line: 13, column: 10, scope: !3272, inlinedAt: !3555)
!3557 = !DILocation(line: 13, column: 7, scope: !3272, inlinedAt: !3555)
!3558 = !DILocation(line: 16, column: 17, scope: !3272, inlinedAt: !3555)
!3559 = !DILocation(line: 17, column: 13, scope: !3272, inlinedAt: !3555)
!3560 = !DILocation(line: 17, column: 17, scope: !3272, inlinedAt: !3555)
!3561 = !DILocation(line: 17, column: 7, scope: !3272, inlinedAt: !3555)
!3562 = !DILocation(line: 18, column: 13, scope: !3272, inlinedAt: !3555)
!3563 = !DILocation(line: 18, column: 17, scope: !3272, inlinedAt: !3555)
!3564 = !DILocation(line: 18, column: 7, scope: !3272, inlinedAt: !3555)
!3565 = !DILocation(line: 19, column: 13, scope: !3272, inlinedAt: !3555)
!3566 = !DILocation(line: 19, column: 17, scope: !3272, inlinedAt: !3555)
!3567 = !DILocation(line: 19, column: 7, scope: !3272, inlinedAt: !3555)
!3568 = !DILocation(line: 23, column: 37, scope: !3272, inlinedAt: !3555)
!3569 = !DILocation(line: 23, column: 52, scope: !3272, inlinedAt: !3555)
!3570 = !DILocation(line: 23, column: 43, scope: !3272, inlinedAt: !3555)
!3571 = !DILocation(line: 23, column: 59, scope: !3272, inlinedAt: !3555)
!3572 = !DILocalVariable(name: "a4", scope: !3530, file: !665, line: 61, type: !51)
!3573 = !DILocation(line: 0, scope: !3272, inlinedAt: !3574)
!3574 = distinct !DILocation(line: 62, column: 24, scope: !3530, inlinedAt: !3534)
!3575 = !DILocation(line: 13, column: 10, scope: !3272, inlinedAt: !3574)
!3576 = !DILocation(line: 13, column: 7, scope: !3272, inlinedAt: !3574)
!3577 = !DILocation(line: 16, column: 17, scope: !3272, inlinedAt: !3574)
!3578 = !DILocation(line: 17, column: 13, scope: !3272, inlinedAt: !3574)
!3579 = !DILocation(line: 17, column: 17, scope: !3272, inlinedAt: !3574)
!3580 = !DILocation(line: 17, column: 7, scope: !3272, inlinedAt: !3574)
!3581 = !DILocation(line: 18, column: 13, scope: !3272, inlinedAt: !3574)
!3582 = !DILocation(line: 18, column: 17, scope: !3272, inlinedAt: !3574)
!3583 = !DILocation(line: 18, column: 7, scope: !3272, inlinedAt: !3574)
!3584 = !DILocation(line: 19, column: 13, scope: !3272, inlinedAt: !3574)
!3585 = !DILocation(line: 19, column: 17, scope: !3272, inlinedAt: !3574)
!3586 = !DILocation(line: 19, column: 7, scope: !3272, inlinedAt: !3574)
!3587 = !DILocation(line: 23, column: 37, scope: !3272, inlinedAt: !3574)
!3588 = !DILocation(line: 23, column: 52, scope: !3272, inlinedAt: !3574)
!3589 = !DILocation(line: 23, column: 43, scope: !3272, inlinedAt: !3574)
!3590 = !DILocation(line: 23, column: 59, scope: !3272, inlinedAt: !3574)
!3591 = !DILocalVariable(name: "a8", scope: !3530, file: !665, line: 62, type: !51)
!3592 = !DILocation(line: 0, scope: !3272, inlinedAt: !3593)
!3593 = distinct !DILocation(line: 63, column: 24, scope: !3530, inlinedAt: !3534)
!3594 = !DILocation(line: 13, column: 10, scope: !3272, inlinedAt: !3593)
!3595 = !DILocation(line: 13, column: 7, scope: !3272, inlinedAt: !3593)
!3596 = !DILocation(line: 16, column: 17, scope: !3272, inlinedAt: !3593)
!3597 = !DILocation(line: 17, column: 13, scope: !3272, inlinedAt: !3593)
!3598 = !DILocation(line: 17, column: 17, scope: !3272, inlinedAt: !3593)
!3599 = !DILocation(line: 17, column: 7, scope: !3272, inlinedAt: !3593)
!3600 = !DILocation(line: 18, column: 13, scope: !3272, inlinedAt: !3593)
!3601 = !DILocation(line: 18, column: 17, scope: !3272, inlinedAt: !3593)
!3602 = !DILocation(line: 18, column: 7, scope: !3272, inlinedAt: !3593)
!3603 = !DILocation(line: 19, column: 13, scope: !3272, inlinedAt: !3593)
!3604 = !DILocation(line: 19, column: 17, scope: !3272, inlinedAt: !3593)
!3605 = !DILocation(line: 19, column: 7, scope: !3272, inlinedAt: !3593)
!3606 = !DILocation(line: 23, column: 37, scope: !3272, inlinedAt: !3593)
!3607 = !DILocation(line: 23, column: 52, scope: !3272, inlinedAt: !3593)
!3608 = !DILocation(line: 23, column: 43, scope: !3272, inlinedAt: !3593)
!3609 = !DILocation(line: 23, column: 59, scope: !3272, inlinedAt: !3593)
!3610 = !DILocalVariable(name: "a6", scope: !3530, file: !665, line: 63, type: !51)
!3611 = !DILocation(line: 0, scope: !3272, inlinedAt: !3612)
!3612 = distinct !DILocation(line: 64, column: 25, scope: !3530, inlinedAt: !3534)
!3613 = !DILocation(line: 13, column: 10, scope: !3272, inlinedAt: !3612)
!3614 = !DILocation(line: 13, column: 7, scope: !3272, inlinedAt: !3612)
!3615 = !DILocation(line: 16, column: 17, scope: !3272, inlinedAt: !3612)
!3616 = !DILocation(line: 17, column: 13, scope: !3272, inlinedAt: !3612)
!3617 = !DILocation(line: 17, column: 17, scope: !3272, inlinedAt: !3612)
!3618 = !DILocation(line: 17, column: 7, scope: !3272, inlinedAt: !3612)
!3619 = !DILocation(line: 18, column: 13, scope: !3272, inlinedAt: !3612)
!3620 = !DILocation(line: 18, column: 17, scope: !3272, inlinedAt: !3612)
!3621 = !DILocation(line: 18, column: 7, scope: !3272, inlinedAt: !3612)
!3622 = !DILocation(line: 19, column: 13, scope: !3272, inlinedAt: !3612)
!3623 = !DILocation(line: 19, column: 17, scope: !3272, inlinedAt: !3612)
!3624 = !DILocation(line: 19, column: 7, scope: !3272, inlinedAt: !3612)
!3625 = !DILocation(line: 23, column: 37, scope: !3272, inlinedAt: !3612)
!3626 = !DILocation(line: 23, column: 52, scope: !3272, inlinedAt: !3612)
!3627 = !DILocation(line: 23, column: 43, scope: !3272, inlinedAt: !3612)
!3628 = !DILocation(line: 23, column: 59, scope: !3272, inlinedAt: !3612)
!3629 = !DILocalVariable(name: "a14", scope: !3530, file: !665, line: 64, type: !51)
!3630 = !DILocalVariable(name: "inverse", scope: !3343, file: !3344, line: 75, type: !51)
!3631 = !DILocation(line: 109, column: 9, scope: !3431, inlinedAt: !3347)
!3632 = !DILocalVariable(name: "row", scope: !3633, file: !3344, line: 113, type: !86)
!3633 = distinct !DILexicalBlock(scope: !3431, file: !3344, line: 113, column: 9)
!3634 = !DILocation(line: 0, scope: !3633, inlinedAt: !3347)
!3635 = !DILocation(line: 113, column: 14, scope: !3633, inlinedAt: !3347)
!3636 = !DILocation(line: 113, scope: !3633, inlinedAt: !3347)
!3637 = !DILocation(line: 113, column: 51, scope: !3638, inlinedAt: !3347)
!3638 = distinct !DILexicalBlock(scope: !3633, file: !3344, line: 113, column: 9)
!3639 = !DILocation(line: 113, column: 9, scope: !3633, inlinedAt: !3347)
!3640 = !DILocation(line: 124, column: 9, scope: !3641, inlinedAt: !3347)
!3641 = distinct !DILexicalBlock(scope: !3431, file: !3344, line: 124, column: 9)
!3642 = !DILocation(line: 0, scope: !3463, inlinedAt: !3643)
!3643 = distinct !DILocation(line: 114, column: 33, scope: !3644, inlinedAt: !3347)
!3644 = distinct !DILexicalBlock(scope: !3638, file: !3344, line: 113, column: 84)
!3645 = !DILocation(line: 47, column: 38, scope: !3463, inlinedAt: !3643)
!3646 = !DILocation(line: 47, column: 44, scope: !3463, inlinedAt: !3643)
!3647 = !DILocation(line: 47, column: 73, scope: !3463, inlinedAt: !3643)
!3648 = !DILocation(line: 47, column: 71, scope: !3463, inlinedAt: !3643)
!3649 = !DILocation(line: 114, column: 63, scope: !3644, inlinedAt: !3347)
!3650 = !DILocalVariable(name: "do_copy", scope: !3644, file: !3344, line: 114, type: !53)
!3651 = !DILocation(line: 0, scope: !3644, inlinedAt: !3347)
!3652 = !DILocalVariable(name: "do_not_copy", scope: !3644, file: !3344, line: 115, type: !53)
!3653 = !DILocalVariable(name: "col", scope: !3654, file: !3344, line: 116, type: !86)
!3654 = distinct !DILexicalBlock(scope: !3644, file: !3344, line: 116, column: 13)
!3655 = !DILocation(line: 0, scope: !3654, inlinedAt: !3347)
!3656 = !DILocation(line: 116, column: 18, scope: !3654, inlinedAt: !3347)
!3657 = !DILocation(line: 116, scope: !3654, inlinedAt: !3347)
!3658 = !DILocation(line: 116, column: 35, scope: !3659, inlinedAt: !3347)
!3659 = distinct !DILexicalBlock(scope: !3654, file: !3344, line: 116, column: 13)
!3660 = !DILocation(line: 116, column: 13, scope: !3654, inlinedAt: !3347)
!3661 = !DILocation(line: 118, column: 49, scope: !3662, inlinedAt: !3347)
!3662 = distinct !DILexicalBlock(scope: !3659, file: !3344, line: 116, column: 53)
!3663 = !DILocation(line: 118, column: 59, scope: !3662, inlinedAt: !3347)
!3664 = !DILocation(line: 118, column: 36, scope: !3662, inlinedAt: !3347)
!3665 = !DILocation(line: 118, column: 34, scope: !3662, inlinedAt: !3347)
!3666 = !DILocation(line: 119, column: 32, scope: !3662, inlinedAt: !3347)
!3667 = !DILocation(line: 119, column: 30, scope: !3662, inlinedAt: !3347)
!3668 = !DILocation(line: 118, column: 67, scope: !3662, inlinedAt: !3347)
!3669 = !DILocation(line: 117, column: 30, scope: !3662, inlinedAt: !3347)
!3670 = !DILocation(line: 117, column: 40, scope: !3662, inlinedAt: !3347)
!3671 = !DILocation(line: 117, column: 17, scope: !3662, inlinedAt: !3347)
!3672 = !DILocation(line: 117, column: 47, scope: !3662, inlinedAt: !3347)
!3673 = !DILocation(line: 116, column: 49, scope: !3659, inlinedAt: !3347)
!3674 = !DILocation(line: 116, column: 13, scope: !3659, inlinedAt: !3347)
!3675 = distinct !{!3675, !3660, !3676, !297}
!3676 = !DILocation(line: 120, column: 13, scope: !3654, inlinedAt: !3347)
!3677 = !DILocation(line: 113, column: 80, scope: !3638, inlinedAt: !3347)
!3678 = !DILocation(line: 113, column: 9, scope: !3638, inlinedAt: !3347)
!3679 = distinct !{!3679, !3639, !3680, !297}
!3680 = !DILocation(line: 121, column: 9, scope: !3633, inlinedAt: !3347)
!3681 = !DILocation(line: 124, scope: !3641, inlinedAt: !3347)
!3682 = !DILocalVariable(name: "row", scope: !3641, file: !3344, line: 124, type: !86)
!3683 = !DILocation(line: 0, scope: !3641, inlinedAt: !3347)
!3684 = !DILocation(line: 124, column: 51, scope: !3685, inlinedAt: !3347)
!3685 = distinct !DILexicalBlock(scope: !3641, file: !3344, line: 124, column: 9)
!3686 = !DILocation(line: 125, column: 46, scope: !3687, inlinedAt: !3347)
!3687 = distinct !DILexicalBlock(scope: !3685, file: !3344, line: 124, column: 67)
!3688 = !DILocalVariable(name: "below_pivot", scope: !3687, file: !3344, line: 125, type: !51)
!3689 = !DILocation(line: 0, scope: !3687, inlinedAt: !3347)
!3690 = !DILocation(line: 126, column: 74, scope: !3687, inlinedAt: !3347)
!3691 = !DILocation(line: 126, column: 68, scope: !3687, inlinedAt: !3347)
!3692 = !DILocation(line: 0, scope: !3508, inlinedAt: !3693)
!3693 = distinct !DILocation(line: 126, column: 41, scope: !3687, inlinedAt: !3347)
!3694 = !DILocation(line: 17, column: 27, scope: !3508, inlinedAt: !3693)
!3695 = !DILocation(line: 20, column: 13, scope: !3508, inlinedAt: !3693)
!3696 = !DILocation(line: 20, column: 31, scope: !3508, inlinedAt: !3693)
!3697 = !DILocation(line: 20, column: 21, scope: !3508, inlinedAt: !3693)
!3698 = !DILocation(line: 20, column: 12, scope: !3508, inlinedAt: !3693)
!3699 = !DILocalVariable(name: "elt_to_elim", scope: !3687, file: !3344, line: 126, type: !51)
!3700 = !DILocation(line: 128, column: 63, scope: !3687, inlinedAt: !3347)
!3701 = !DILocation(line: 129, column: 52, scope: !3687, inlinedAt: !3347)
!3702 = !DILocation(line: 129, column: 46, scope: !3687, inlinedAt: !3347)
!3703 = !DILocation(line: 128, column: 13, scope: !3687, inlinedAt: !3347)
!3704 = !DILocation(line: 124, column: 63, scope: !3685, inlinedAt: !3347)
!3705 = !DILocation(line: 124, column: 9, scope: !3685, inlinedAt: !3347)
!3706 = distinct !{!3706, !3640, !3707, !297}
!3707 = !DILocation(line: 130, column: 9, scope: !3641, inlinedAt: !3347)
!3708 = !DILocation(line: 132, column: 19, scope: !3431, inlinedAt: !3347)
!3709 = !DILocation(line: 77, column: 57, scope: !3427, inlinedAt: !3347)
!3710 = !DILocation(line: 77, column: 5, scope: !3427, inlinedAt: !3347)
!3711 = distinct !{!3711, !3374, !3712, !297}
!3712 = !DILocation(line: 133, column: 5, scope: !3375, inlinedAt: !3347)
!3713 = !DILocation(line: 138, scope: !3429, inlinedAt: !3347)
!3714 = !DILocalVariable(name: "i", scope: !3429, file: !3344, line: 138, type: !86)
!3715 = !DILocation(line: 0, scope: !3429, inlinedAt: !3347)
!3716 = !DILocation(line: 138, column: 23, scope: !3717, inlinedAt: !3347)
!3717 = distinct !DILexicalBlock(scope: !3429, file: !3344, line: 138, column: 5)
!3718 = !DILocation(line: 139, column: 47, scope: !3719, inlinedAt: !3347)
!3719 = distinct !DILexicalBlock(scope: !3717, file: !3344, line: 138, column: 37)
!3720 = !DILocation(line: 139, column: 43, scope: !3719, inlinedAt: !3347)
!3721 = !DILocalVariable(name: "legs", arg: 1, scope: !3722, file: !3344, line: 44, type: !86)
!3722 = distinct !DISubprogram(name: "ef_unpack_m_vec", scope: !3344, file: !3344, line: 44, type: !3723, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3723 = !DISubroutineType(types: !3724)
!3724 = !{null, !86, !483, !61}
!3725 = !DILocation(line: 0, scope: !3722, inlinedAt: !3726)
!3726 = distinct !DILocation(line: 139, column: 9, scope: !3719, inlinedAt: !3347)
!3727 = !DILocalVariable(name: "in", arg: 2, scope: !3722, file: !3344, line: 44, type: !483)
!3728 = !DILocalVariable(name: "out", arg: 3, scope: !3722, file: !3344, line: 44, type: !61)
!3729 = !DILocalVariable(name: "in8", scope: !3722, file: !3344, line: 45, type: !90)
!3730 = !DILocalVariable(name: "i", scope: !3731, file: !3344, line: 46, type: !86)
!3731 = distinct !DILexicalBlock(scope: !3722, file: !3344, line: 46, column: 5)
!3732 = !DILocation(line: 0, scope: !3731, inlinedAt: !3726)
!3733 = !DILocation(line: 46, column: 9, scope: !3731, inlinedAt: !3726)
!3734 = !DILocation(line: 46, scope: !3731, inlinedAt: !3726)
!3735 = !DILocation(line: 46, column: 29, scope: !3736, inlinedAt: !3726)
!3736 = distinct !DILexicalBlock(scope: !3731, file: !3344, line: 46, column: 5)
!3737 = !DILocation(line: 46, column: 22, scope: !3736, inlinedAt: !3726)
!3738 = !DILocation(line: 46, column: 5, scope: !3731, inlinedAt: !3726)
!3739 = !DILocation(line: 140, column: 9, scope: !3740, inlinedAt: !3347)
!3740 = distinct !DILexicalBlock(scope: !3719, file: !3344, line: 140, column: 9)
!3741 = !DILocation(line: 51, column: 26, scope: !3742, inlinedAt: !3726)
!3742 = distinct !DILexicalBlock(scope: !3736, file: !3344, line: 46, column: 42)
!3743 = !DILocation(line: 51, column: 21, scope: !3742, inlinedAt: !3726)
!3744 = !DILocation(line: 51, column: 31, scope: !3742, inlinedAt: !3726)
!3745 = !DILocation(line: 51, column: 9, scope: !3742, inlinedAt: !3726)
!3746 = !DILocation(line: 51, column: 18, scope: !3742, inlinedAt: !3726)
!3747 = !DILocation(line: 52, column: 26, scope: !3742, inlinedAt: !3726)
!3748 = !DILocation(line: 52, column: 21, scope: !3742, inlinedAt: !3726)
!3749 = !DILocation(line: 52, column: 30, scope: !3742, inlinedAt: !3726)
!3750 = !DILocation(line: 52, column: 14, scope: !3742, inlinedAt: !3726)
!3751 = !DILocation(line: 52, column: 9, scope: !3742, inlinedAt: !3726)
!3752 = !DILocation(line: 52, column: 18, scope: !3742, inlinedAt: !3726)
!3753 = !DILocation(line: 46, column: 37, scope: !3736, inlinedAt: !3726)
!3754 = !DILocation(line: 46, column: 5, scope: !3736, inlinedAt: !3726)
!3755 = distinct !{!3755, !3738, !3756, !297}
!3756 = !DILocation(line: 54, column: 5, scope: !3731, inlinedAt: !3726)
!3757 = !DILocation(line: 140, scope: !3740, inlinedAt: !3347)
!3758 = !DILocalVariable(name: "j", scope: !3740, file: !3344, line: 140, type: !86)
!3759 = !DILocation(line: 0, scope: !3740, inlinedAt: !3347)
!3760 = !DILocation(line: 140, column: 27, scope: !3761, inlinedAt: !3347)
!3761 = distinct !DILexicalBlock(scope: !3740, file: !3344, line: 140, column: 9)
!3762 = !DILocation(line: 141, column: 32, scope: !3763, inlinedAt: !3347)
!3763 = distinct !DILexicalBlock(scope: !3761, file: !3344, line: 140, column: 41)
!3764 = !DILocation(line: 141, column: 17, scope: !3763, inlinedAt: !3347)
!3765 = !DILocation(line: 141, column: 13, scope: !3763, inlinedAt: !3347)
!3766 = !DILocation(line: 141, column: 30, scope: !3763, inlinedAt: !3347)
!3767 = !DILocation(line: 140, column: 37, scope: !3761, inlinedAt: !3347)
!3768 = !DILocation(line: 140, column: 9, scope: !3761, inlinedAt: !3347)
!3769 = distinct !{!3769, !3739, !3770, !297}
!3770 = !DILocation(line: 142, column: 9, scope: !3740, inlinedAt: !3347)
!3771 = !DILocation(line: 138, column: 33, scope: !3717, inlinedAt: !3347)
!3772 = !DILocation(line: 138, column: 5, scope: !3717, inlinedAt: !3347)
!3773 = distinct !{!3773, !3428, !3774, !297}
!3774 = !DILocation(line: 143, column: 5, scope: !3429, inlinedAt: !3347)
!3775 = !DILocation(line: 145, column: 5, scope: !3343, inlinedAt: !3347)
!3776 = !DILocation(line: 146, column: 5, scope: !3343, inlinedAt: !3347)
!3777 = !DILocation(line: 147, column: 5, scope: !3343, inlinedAt: !3347)
!3778 = !DILocation(line: 148, column: 5, scope: !3343, inlinedAt: !3347)
!3779 = !DILocation(line: 149, column: 1, scope: !3343, inlinedAt: !3347)
!3780 = !DILocalVariable(name: "full_rank", scope: !3175, file: !99, line: 70, type: !51)
!3781 = !DILocalVariable(name: "i", scope: !3782, file: !99, line: 71, type: !86)
!3782 = distinct !DILexicalBlock(scope: !3175, file: !99, line: 71, column: 5)
!3783 = !DILocation(line: 0, scope: !3782)
!3784 = !DILocation(line: 71, column: 10, scope: !3782)
!3785 = !DILocation(line: 71, scope: !3782)
!3786 = !DILocation(line: 71, column: 23, scope: !3787)
!3787 = distinct !DILexicalBlock(scope: !3782, file: !99, line: 71, column: 5)
!3788 = !DILocation(line: 71, column: 5, scope: !3782)
!3789 = !DILocation(line: 72, column: 27, scope: !3790)
!3790 = distinct !DILexicalBlock(scope: !3787, file: !99, line: 71, column: 42)
!3791 = !DILocation(line: 72, column: 32, scope: !3790)
!3792 = !DILocation(line: 72, column: 22, scope: !3790)
!3793 = !DILocation(line: 72, column: 19, scope: !3790)
!3794 = !DILocation(line: 71, column: 38, scope: !3787)
!3795 = !DILocation(line: 71, column: 5, scope: !3787)
!3796 = distinct !{!3796, !3788, !3797, !297}
!3797 = !DILocation(line: 73, column: 5, scope: !3782)
!3798 = !DILocation(line: 80, column: 19, scope: !3799)
!3799 = distinct !DILexicalBlock(scope: !3175, file: !99, line: 80, column: 9)
!3800 = !DILocation(line: 88, column: 5, scope: !3801)
!3801 = distinct !DILexicalBlock(scope: !3175, file: !99, line: 88, column: 5)
!3802 = distinct !{!3802, !3800, !3803, !297}
!3803 = !DILocation(line: 122, column: 5, scope: !3801)
!3804 = !DILocation(line: 88, scope: !3801)
!3805 = !DILocalVariable(name: "row", scope: !3801, file: !99, line: 88, type: !86)
!3806 = !DILocation(line: 0, scope: !3801)
!3807 = !DILocation(line: 88, column: 31, scope: !3808)
!3808 = distinct !DILexicalBlock(scope: !3801, file: !99, line: 88, column: 5)
!3809 = !DILocalVariable(name: "finished", scope: !3175, file: !99, line: 46, type: !51)
!3810 = !DILocation(line: 90, column: 27, scope: !3811)
!3811 = distinct !DILexicalBlock(scope: !3808, file: !99, line: 88, column: 44)
!3812 = !DILocalVariable(name: "col_upper_bound", scope: !3175, file: !99, line: 47, type: !86)
!3813 = !DILocalVariable(name: "col", scope: !3814, file: !99, line: 93, type: !86)
!3814 = distinct !DILexicalBlock(scope: !3811, file: !99, line: 93, column: 9)
!3815 = !DILocation(line: 0, scope: !3814)
!3816 = !DILocation(line: 93, column: 14, scope: !3814)
!3817 = !DILocation(line: 0, scope: !3811)
!3818 = !DILocation(line: 93, scope: !3814)
!3819 = !DILocation(line: 93, column: 33, scope: !3820)
!3820 = distinct !DILexicalBlock(scope: !3814, file: !99, line: 93, column: 9)
!3821 = !DILocation(line: 93, column: 9, scope: !3814)
!3822 = !DILocation(line: 97, column: 50, scope: !3823)
!3823 = distinct !DILexicalBlock(scope: !3820, file: !99, line: 93, column: 60)
!3824 = !DILocation(line: 97, column: 44, scope: !3823)
!3825 = !DILocalVariable(name: "a", arg: 1, scope: !3826, file: !3464, line: 51, type: !51)
!3826 = distinct !DISubprogram(name: "ct_compare_8", scope: !3464, file: !3464, line: 51, type: !1523, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3827 = !DILocation(line: 0, scope: !3826, inlinedAt: !3828)
!3828 = distinct !DILocation(line: 97, column: 30, scope: !3823)
!3829 = !DILocalVariable(name: "b", arg: 2, scope: !3826, file: !3464, line: 51, type: !51)
!3830 = !DILocation(line: 52, column: 42, scope: !3826, inlinedAt: !3828)
!3831 = !DILocation(line: 52, column: 13, scope: !3826, inlinedAt: !3828)
!3832 = !DILocation(line: 52, column: 71, scope: !3826, inlinedAt: !3828)
!3833 = !DILocation(line: 52, column: 69, scope: !3826, inlinedAt: !3828)
!3834 = !DILocation(line: 97, column: 73, scope: !3823)
!3835 = !DILocalVariable(name: "correct_column", scope: !3175, file: !99, line: 48, type: !51)
!3836 = !DILocation(line: 99, column: 63, scope: !3823)
!3837 = !DILocation(line: 99, column: 48, scope: !3823)
!3838 = !DILocation(line: 99, column: 46, scope: !3823)
!3839 = !DILocalVariable(name: "u", scope: !3823, file: !99, line: 99, type: !51)
!3840 = !DILocation(line: 0, scope: !3823)
!3841 = !DILocation(line: 100, column: 13, scope: !3823)
!3842 = !DILocation(line: 100, column: 20, scope: !3823)
!3843 = !DILocalVariable(name: "i", scope: !3844, file: !99, line: 102, type: !86)
!3844 = distinct !DILexicalBlock(scope: !3823, file: !99, line: 102, column: 13)
!3845 = !DILocation(line: 0, scope: !3844)
!3846 = !DILocation(line: 102, column: 18, scope: !3844)
!3847 = !DILocation(line: 102, scope: !3844)
!3848 = !DILocation(line: 102, column: 31, scope: !3849)
!3849 = distinct !DILexicalBlock(scope: !3844, file: !99, line: 102, column: 13)
!3850 = !DILocation(line: 102, column: 13, scope: !3844)
!3851 = !DILocation(line: 103, column: 53, scope: !3852)
!3852 = distinct !DILexicalBlock(scope: !3849, file: !99, line: 102, column: 46)
!3853 = !DILocation(line: 103, column: 45, scope: !3852)
!3854 = !DILocation(line: 103, column: 34, scope: !3852)
!3855 = !DILocation(line: 103, column: 95, scope: !3852)
!3856 = !DILocation(line: 103, column: 99, scope: !3852)
!3857 = !DILocation(line: 103, column: 91, scope: !3852)
!3858 = !DILocation(line: 103, column: 80, scope: !3852)
!3859 = !DILocation(line: 103, column: 115, scope: !3852)
!3860 = !DILocation(line: 103, column: 76, scope: !3852)
!3861 = !DILocation(line: 104, column: 49, scope: !3852)
!3862 = !DILocation(line: 104, column: 53, scope: !3852)
!3863 = !DILocation(line: 104, column: 45, scope: !3852)
!3864 = !DILocation(line: 104, column: 34, scope: !3852)
!3865 = !DILocation(line: 104, column: 69, scope: !3852)
!3866 = !DILocation(line: 104, column: 30, scope: !3852)
!3867 = !DILocation(line: 104, column: 95, scope: !3852)
!3868 = !DILocation(line: 104, column: 99, scope: !3852)
!3869 = !DILocation(line: 104, column: 91, scope: !3852)
!3870 = !DILocation(line: 104, column: 80, scope: !3852)
!3871 = !DILocation(line: 104, column: 115, scope: !3852)
!3872 = !DILocation(line: 104, column: 76, scope: !3852)
!3873 = !DILocation(line: 105, column: 49, scope: !3852)
!3874 = !DILocation(line: 105, column: 53, scope: !3852)
!3875 = !DILocation(line: 105, column: 45, scope: !3852)
!3876 = !DILocation(line: 105, column: 34, scope: !3852)
!3877 = !DILocation(line: 105, column: 69, scope: !3852)
!3878 = !DILocation(line: 105, column: 30, scope: !3852)
!3879 = !DILocation(line: 105, column: 95, scope: !3852)
!3880 = !DILocation(line: 105, column: 99, scope: !3852)
!3881 = !DILocation(line: 105, column: 91, scope: !3852)
!3882 = !DILocation(line: 105, column: 80, scope: !3852)
!3883 = !DILocation(line: 105, column: 115, scope: !3852)
!3884 = !DILocation(line: 105, column: 76, scope: !3852)
!3885 = !DILocation(line: 106, column: 49, scope: !3852)
!3886 = !DILocation(line: 106, column: 53, scope: !3852)
!3887 = !DILocation(line: 106, column: 45, scope: !3852)
!3888 = !DILocation(line: 106, column: 34, scope: !3852)
!3889 = !DILocation(line: 106, column: 69, scope: !3852)
!3890 = !DILocation(line: 106, column: 30, scope: !3852)
!3891 = !DILocation(line: 106, column: 95, scope: !3852)
!3892 = !DILocation(line: 106, column: 99, scope: !3852)
!3893 = !DILocation(line: 106, column: 91, scope: !3852)
!3894 = !DILocation(line: 106, column: 80, scope: !3852)
!3895 = !DILocation(line: 106, column: 115, scope: !3852)
!3896 = !DILocation(line: 106, column: 76, scope: !3852)
!3897 = !DILocalVariable(name: "tmp", scope: !3852, file: !99, line: 103, type: !53)
!3898 = !DILocation(line: 0, scope: !3852)
!3899 = !DILocalVariable(name: "a", arg: 1, scope: !3900, file: !665, line: 27, type: !51)
!3900 = distinct !DISubprogram(name: "mul_fx8", scope: !665, file: !665, line: 27, type: !3901, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3901 = !DISubroutineType(types: !3902)
!3902 = !{!53, !51, !53}
!3903 = !DILocation(line: 0, scope: !3900, inlinedAt: !3904)
!3904 = distinct !DILocation(line: 108, column: 23, scope: !3852)
!3905 = !DILocalVariable(name: "b", arg: 2, scope: !3900, file: !665, line: 27, type: !53)
!3906 = !DILocation(line: 30, column: 13, scope: !3900, inlinedAt: !3904)
!3907 = !DILocation(line: 30, column: 10, scope: !3900, inlinedAt: !3904)
!3908 = !DILocation(line: 30, column: 17, scope: !3900, inlinedAt: !3904)
!3909 = !DILocalVariable(name: "p", scope: !3900, file: !665, line: 29, type: !53)
!3910 = !DILocation(line: 31, column: 13, scope: !3900, inlinedAt: !3904)
!3911 = !DILocation(line: 31, column: 10, scope: !3900, inlinedAt: !3904)
!3912 = !DILocation(line: 31, column: 17, scope: !3900, inlinedAt: !3904)
!3913 = !DILocation(line: 31, column: 7, scope: !3900, inlinedAt: !3904)
!3914 = !DILocation(line: 32, column: 13, scope: !3900, inlinedAt: !3904)
!3915 = !DILocation(line: 32, column: 10, scope: !3900, inlinedAt: !3904)
!3916 = !DILocation(line: 32, column: 17, scope: !3900, inlinedAt: !3904)
!3917 = !DILocation(line: 32, column: 7, scope: !3900, inlinedAt: !3904)
!3918 = !DILocation(line: 33, column: 13, scope: !3900, inlinedAt: !3904)
!3919 = !DILocation(line: 33, column: 10, scope: !3900, inlinedAt: !3904)
!3920 = !DILocation(line: 33, column: 17, scope: !3900, inlinedAt: !3904)
!3921 = !DILocation(line: 33, column: 7, scope: !3900, inlinedAt: !3904)
!3922 = !DILocalVariable(name: "top_p", scope: !3900, file: !665, line: 36, type: !53)
!3923 = !DILocation(line: 37, column: 32, scope: !3900, inlinedAt: !3904)
!3924 = !DILocation(line: 37, column: 47, scope: !3900, inlinedAt: !3904)
!3925 = !DILocation(line: 37, column: 38, scope: !3900, inlinedAt: !3904)
!3926 = !DILocalVariable(name: "out", scope: !3900, file: !665, line: 37, type: !53)
!3927 = !DILocation(line: 110, column: 34, scope: !3852)
!3928 = !DILocation(line: 110, column: 17, scope: !3852)
!3929 = !DILocation(line: 110, column: 48, scope: !3852)
!3930 = !DILocation(line: 111, column: 56, scope: !3852)
!3931 = !DILocation(line: 111, column: 34, scope: !3852)
!3932 = !DILocation(line: 111, column: 17, scope: !3852)
!3933 = !DILocation(line: 111, column: 48, scope: !3852)
!3934 = !DILocation(line: 112, column: 56, scope: !3852)
!3935 = !DILocation(line: 112, column: 34, scope: !3852)
!3936 = !DILocation(line: 112, column: 17, scope: !3852)
!3937 = !DILocation(line: 112, column: 48, scope: !3852)
!3938 = !DILocation(line: 113, column: 56, scope: !3852)
!3939 = !DILocation(line: 113, column: 34, scope: !3852)
!3940 = !DILocation(line: 113, column: 17, scope: !3852)
!3941 = !DILocation(line: 113, column: 48, scope: !3852)
!3942 = !DILocation(line: 114, column: 56, scope: !3852)
!3943 = !DILocation(line: 114, column: 34, scope: !3852)
!3944 = !DILocation(line: 114, column: 17, scope: !3852)
!3945 = !DILocation(line: 114, column: 48, scope: !3852)
!3946 = !DILocation(line: 115, column: 56, scope: !3852)
!3947 = !DILocation(line: 115, column: 34, scope: !3852)
!3948 = !DILocation(line: 115, column: 17, scope: !3852)
!3949 = !DILocation(line: 115, column: 48, scope: !3852)
!3950 = !DILocation(line: 116, column: 56, scope: !3852)
!3951 = !DILocation(line: 116, column: 34, scope: !3852)
!3952 = !DILocation(line: 116, column: 17, scope: !3852)
!3953 = !DILocation(line: 116, column: 48, scope: !3852)
!3954 = !DILocation(line: 117, column: 56, scope: !3852)
!3955 = !DILocation(line: 117, column: 34, scope: !3852)
!3956 = !DILocation(line: 117, column: 17, scope: !3852)
!3957 = !DILocation(line: 117, column: 48, scope: !3852)
!3958 = !DILocation(line: 102, column: 40, scope: !3849)
!3959 = !DILocation(line: 102, column: 13, scope: !3849)
!3960 = distinct !{!3960, !3850, !3961, !297}
!3961 = !DILocation(line: 118, column: 13, scope: !3844)
!3962 = !DILocation(line: 120, column: 33, scope: !3823)
!3963 = !DILocation(line: 93, column: 56, scope: !3820)
!3964 = !DILocation(line: 93, column: 9, scope: !3820)
!3965 = distinct !{!3965, !3821, !3966, !297}
!3966 = !DILocation(line: 121, column: 9, scope: !3814)
!3967 = !DILocation(line: 124, column: 1, scope: !3175)
!3968 = distinct !DISubprogram(name: "vec_mul_add_u64", scope: !3464, file: !3464, line: 94, type: !3969, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3969 = !DISubroutineType(types: !3970)
!3970 = !{null, !275, !483, !51, !52}
!3971 = !DILocalVariable(name: "legs", arg: 1, scope: !3968, file: !3464, line: 94, type: !275)
!3972 = !DILocation(line: 0, scope: !3968)
!3973 = !DILocalVariable(name: "in", arg: 2, scope: !3968, file: !3464, line: 94, type: !483)
!3974 = !DILocalVariable(name: "a", arg: 3, scope: !3968, file: !3464, line: 94, type: !51)
!3975 = !DILocalVariable(name: "acc", arg: 4, scope: !3968, file: !3464, line: 94, type: !52)
!3976 = !DILocalVariable(name: "b", arg: 1, scope: !3977, file: !665, line: 128, type: !174)
!3977 = distinct !DISubprogram(name: "mul_table", scope: !665, file: !665, line: 128, type: !666, scopeLine: 128, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3978 = !DILocation(line: 0, scope: !3977, inlinedAt: !3979)
!3979 = distinct !DILocation(line: 95, column: 20, scope: !3968)
!3980 = !DILocation(line: 129, column: 19, scope: !3977, inlinedAt: !3979)
!3981 = !DILocation(line: 129, column: 33, scope: !3977, inlinedAt: !3979)
!3982 = !DILocalVariable(name: "x", scope: !3977, file: !665, line: 129, type: !62)
!3983 = !DILocalVariable(name: "high_nibble_mask", scope: !3977, file: !665, line: 131, type: !62)
!3984 = !DILocation(line: 133, column: 28, scope: !3977, inlinedAt: !3979)
!3985 = !DILocalVariable(name: "high_half", scope: !3977, file: !665, line: 133, type: !62)
!3986 = !DILocation(line: 134, column: 28, scope: !3977, inlinedAt: !3979)
!3987 = !DILocation(line: 134, column: 47, scope: !3977, inlinedAt: !3979)
!3988 = !DILocation(line: 134, column: 34, scope: !3977, inlinedAt: !3979)
!3989 = !DILocalVariable(name: "tab", scope: !3968, file: !3464, line: 95, type: !62)
!3990 = !DILocalVariable(name: "lsb_ask", scope: !3968, file: !3464, line: 97, type: !53)
!3991 = !DILocalVariable(name: "i", scope: !3992, file: !3464, line: 99, type: !86)
!3992 = distinct !DILexicalBlock(scope: !3968, file: !3464, line: 99, column: 5)
!3993 = !DILocation(line: 0, scope: !3992)
!3994 = !DILocation(line: 99, column: 9, scope: !3992)
!3995 = !DILocation(line: 99, scope: !3992)
!3996 = !DILocation(line: 99, column: 20, scope: !3997)
!3997 = distinct !DILexicalBlock(scope: !3992, file: !3464, line: 99, column: 5)
!3998 = !DILocation(line: 99, column: 5, scope: !3992)
!3999 = !DILocation(line: 100, column: 21, scope: !4000)
!4000 = distinct !DILexicalBlock(scope: !3997, file: !3464, line: 99, column: 32)
!4001 = !DILocation(line: 100, column: 33, scope: !4000)
!4002 = !DILocation(line: 100, column: 51, scope: !4000)
!4003 = !DILocation(line: 100, column: 46, scope: !4000)
!4004 = !DILocation(line: 100, column: 44, scope: !4000)
!4005 = !DILocation(line: 101, column: 27, scope: !4000)
!4006 = !DILocation(line: 101, column: 33, scope: !4000)
!4007 = !DILocation(line: 101, column: 52, scope: !4000)
!4008 = !DILocation(line: 101, column: 59, scope: !4000)
!4009 = !DILocation(line: 101, column: 46, scope: !4000)
!4010 = !DILocation(line: 101, column: 44, scope: !4000)
!4011 = !DILocation(line: 101, column: 17, scope: !4000)
!4012 = !DILocation(line: 102, column: 21, scope: !4000)
!4013 = !DILocation(line: 102, column: 27, scope: !4000)
!4014 = !DILocation(line: 102, column: 33, scope: !4000)
!4015 = !DILocation(line: 102, column: 52, scope: !4000)
!4016 = !DILocation(line: 102, column: 59, scope: !4000)
!4017 = !DILocation(line: 102, column: 46, scope: !4000)
!4018 = !DILocation(line: 102, column: 44, scope: !4000)
!4019 = !DILocation(line: 102, column: 17, scope: !4000)
!4020 = !DILocation(line: 103, column: 21, scope: !4000)
!4021 = !DILocation(line: 103, column: 27, scope: !4000)
!4022 = !DILocation(line: 103, column: 33, scope: !4000)
!4023 = !DILocation(line: 103, column: 52, scope: !4000)
!4024 = !DILocation(line: 103, column: 59, scope: !4000)
!4025 = !DILocation(line: 103, column: 46, scope: !4000)
!4026 = !DILocation(line: 103, column: 44, scope: !4000)
!4027 = !DILocation(line: 103, column: 17, scope: !4000)
!4028 = !DILocation(line: 100, column: 9, scope: !4000)
!4029 = !DILocation(line: 100, column: 16, scope: !4000)
!4030 = !DILocation(line: 99, column: 29, scope: !3997)
!4031 = !DILocation(line: 99, column: 5, scope: !3997)
!4032 = distinct !{!4032, !3998, !4033, !297}
!4033 = !DILocation(line: 104, column: 5, scope: !3992)
!4034 = !DILocation(line: 105, column: 1, scope: !3968)
