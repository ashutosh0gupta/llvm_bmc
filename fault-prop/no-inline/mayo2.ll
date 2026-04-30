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
  %call = call fastcc i32 @example_mayo(ptr noundef null) #6, !dbg !116
  ret i32 %call, !dbg !117
}

; Function Attrs: nounwind
define internal fastcc range(i32 -1, 1) i32 @example_mayo(ptr noundef %p) unnamed_addr #0 !dbg !118 {
entry:
  %msglen = alloca i32, align 4
  %smlen = alloca i32, align 4
  %msg = alloca [32 x i8], align 1
  %msg2 = alloca [32 x i8], align 1
    #dbg_value(ptr %p, !151, !DIExpression(), !152)
    #dbg_value(i32 32, !153, !DIExpression(), !152)
  store i32 32, ptr %msglen, align 4, !dbg !154
    #dbg_value(i32 32, !153, !DIExpression(), !152)
    #dbg_value(i32 218, !155, !DIExpression(), !152)
  store i32 218, ptr %smlen, align 4, !dbg !156
  %call = call dereferenceable_or_null(4912) ptr @calloc(i32 noundef 4912, i32 noundef 1) #7, !dbg !157
    #dbg_value(ptr %call, !158, !DIExpression(), !152)
  %call1 = call dereferenceable_or_null(24) ptr @calloc(i32 noundef 24, i32 noundef 1) #7, !dbg !159
    #dbg_value(ptr %call1, !160, !DIExpression(), !152)
  %call2 = call dereferenceable_or_null(106272) ptr @calloc(i32 noundef 1, i32 noundef 106272) #7, !dbg !161
    #dbg_value(ptr %call2, !162, !DIExpression(), !152)
  %call3 = call dereferenceable_or_null(102464) ptr @calloc(i32 noundef 1, i32 noundef 102464) #7, !dbg !163
    #dbg_value(ptr %call3, !164, !DIExpression(), !152)
  %0 = load i32, ptr %msglen, align 4, !dbg !179
    #dbg_value(i32 %0, !153, !DIExpression(), !152)
  %add4 = add i32 %0, 186, !dbg !180
  %call5 = call ptr @calloc(i32 noundef %add4, i32 noundef 1) #7, !dbg !181
    #dbg_value(ptr %call5, !182, !DIExpression(), !152)
    #dbg_declare(ptr %msg, !183, !DIExpression(), !187)
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(32) %msg, ptr noundef nonnull align 1 dereferenceable(32) @__const.example_mayo.msg, i32 32, i1 false), !dbg !187
    #dbg_declare(ptr %msg2, !188, !DIExpression(), !189)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(32) %msg2, i8 0, i32 32, i1 false), !dbg !189
  %call6 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str, ptr noundef nonnull @.str.1) #8, !dbg !190
  %call7 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.2) #8, !dbg !191
  %call8 = call i32 @pqmayo_MAYO_2_ref_mayo_keypair(ptr noundef %p, ptr noundef %call, ptr noundef %call1) #6, !dbg !192
    #dbg_value(i32 %call8, !193, !DIExpression(), !152)
  %cmp.not = icmp eq i32 %call8, 0, !dbg !194
  br i1 %cmp.not, label %if.else, label %if.then, !dbg !194

if.then:                                          ; preds = %entry
  %call9 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.3) #8, !dbg !196
    #dbg_value(i32 -1, !193, !DIExpression(), !152)
  br label %err, !dbg !198

if.else:                                          ; preds = %entry
  %call10 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.4) #8, !dbg !199
  %call11 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.5) #8, !dbg !201
  %call12 = call i32 @pqmayo_MAYO_2_ref_mayo_expand_sk(ptr noundef %p, ptr noundef %call1, ptr noundef %call3) #6, !dbg !202
    #dbg_value(i32 %call12, !193, !DIExpression(), !152)
  %cmp13.not = icmp eq i32 %call12, 0, !dbg !203
  br i1 %cmp13.not, label %if.else16, label %if.then14, !dbg !203

if.then14:                                        ; preds = %if.else
  %call15 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.3) #8, !dbg !205
    #dbg_value(i32 -1, !193, !DIExpression(), !152)
  br label %err, !dbg !207

if.else16:                                        ; preds = %if.else
  %call17 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.4) #8, !dbg !208
  %call19 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.6) #8, !dbg !210
  %call20 = call i32 @pqmayo_MAYO_2_ref_mayo_expand_pk(ptr noundef %p, ptr noundef %call, ptr noundef %call2) #6, !dbg !211
    #dbg_value(i32 %call20, !193, !DIExpression(), !152)
  %cmp21.not = icmp eq i32 %call20, 0, !dbg !212
  br i1 %cmp21.not, label %if.else24, label %if.then22, !dbg !212

if.then22:                                        ; preds = %if.else16
  %call23 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.3) #8, !dbg !214
    #dbg_value(i32 -1, !193, !DIExpression(), !152)
  br label %err, !dbg !216

if.else24:                                        ; preds = %if.else16
  %call25 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.4) #8, !dbg !217
  %call27 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.7) #8, !dbg !219
  %1 = load i32, ptr %msglen, align 4, !dbg !220
    #dbg_value(i32 %1, !153, !DIExpression(), !152)
    #dbg_value(ptr %smlen, !155, !DIExpression(DW_OP_deref), !152)
  %call28 = call i32 @pqmayo_MAYO_2_ref_mayo_sign(ptr noundef %p, ptr noundef %call5, ptr noundef nonnull %smlen, ptr noundef nonnull %msg, i32 noundef %1, ptr noundef %call1) #6, !dbg !221
    #dbg_value(i32 %call28, !193, !DIExpression(), !152)
  %cmp29.not = icmp eq i32 %call28, 0, !dbg !222
  br i1 %cmp29.not, label %if.else32, label %if.then30, !dbg !222

if.then30:                                        ; preds = %if.else24
  %call31 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.3) #8, !dbg !224
    #dbg_value(i32 -1, !193, !DIExpression(), !152)
  br label %err, !dbg !226

if.else32:                                        ; preds = %if.else24
  %call33 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.4) #8, !dbg !227
  %call35 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.8) #8, !dbg !229
  %2 = load i32, ptr %smlen, align 4, !dbg !230
    #dbg_value(i32 %2, !155, !DIExpression(), !152)
    #dbg_value(ptr %msglen, !153, !DIExpression(DW_OP_deref), !152)
  %call37 = call i32 @pqmayo_MAYO_2_ref_mayo_open(ptr noundef %p, ptr noundef nonnull %msg2, ptr noundef nonnull %msglen, ptr noundef %call5, i32 noundef %2, ptr noundef %call) #6, !dbg !231
    #dbg_value(i32 %call37, !193, !DIExpression(), !152)
  %cmp38.not = icmp eq i32 %call37, 0, !dbg !232
  br i1 %cmp38.not, label %lor.lhs.false, label %if.then42, !dbg !234

lor.lhs.false:                                    ; preds = %if.else32
  %3 = load i32, ptr %msglen, align 4, !dbg !235
    #dbg_value(i32 %3, !153, !DIExpression(), !152)
  %call41 = call i32 @memcmp(ptr noundef nonnull %msg, ptr noundef nonnull %msg2, i32 noundef %3) #8, !dbg !236
  %tobool.not = icmp eq i32 %call41, 0, !dbg !236
  br i1 %tobool.not, label %if.else44, label %if.then42, !dbg !234

if.then42:                                        ; preds = %lor.lhs.false, %if.else32
  %call43 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.3) #8, !dbg !237
    #dbg_value(i32 -1, !193, !DIExpression(), !152)
  br label %err, !dbg !239

if.else44:                                        ; preds = %lor.lhs.false
    #dbg_value(i32 0, !193, !DIExpression(), !152)
  %call45 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.4) #8, !dbg !240
  %call47 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.9) #8, !dbg !242
  %4 = load i32, ptr %msglen, align 4, !dbg !243
    #dbg_value(i32 %4, !153, !DIExpression(), !152)
  %call49 = call i32 @pqmayo_MAYO_2_ref_mayo_verify(ptr noundef %p, ptr noundef nonnull %msg, i32 noundef %4, ptr noundef %call5, ptr noundef %call) #6, !dbg !244
    #dbg_value(i32 %call49, !193, !DIExpression(), !152)
  %cmp50.not = icmp eq i32 %call49, 0, !dbg !245
  br i1 %cmp50.not, label %if.else53, label %if.then51, !dbg !245

if.then51:                                        ; preds = %if.else44
  %call52 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.3) #8, !dbg !247
    #dbg_value(i32 -1, !193, !DIExpression(), !152)
  br label %err, !dbg !249

if.else53:                                        ; preds = %if.else44
    #dbg_value(i32 0, !193, !DIExpression(), !152)
  %call54 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.4) #8, !dbg !250
  br label %err, !dbg !252

err:                                              ; preds = %if.else53, %if.then51, %if.then42, %if.then30, %if.then22, %if.then14, %if.then
  %res.0 = phi i32 [ -1, %if.then ], [ -1, %if.then14 ], [ -1, %if.then22 ], [ -1, %if.then30 ], [ -1, %if.then42 ], [ -1, %if.then51 ], [ 0, %if.else53 ], !dbg !152
    #dbg_value(i32 %res.0, !193, !DIExpression(), !152)
    #dbg_label(!253, !254)
  call void @free(ptr noundef %call) #8, !dbg !255
  call void @free(ptr noundef %call2) #8, !dbg !256
  call void @mayo_secure_free(ptr noundef %call1, i32 noundef 24) #8, !dbg !257
  call void @mayo_secure_free(ptr noundef %call3, i32 noundef 102464) #8, !dbg !258
  call void @free(ptr noundef %call5) #8, !dbg !259
  ret i32 %res.0, !dbg !260
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
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_2_ref_mayo_keypair(ptr noundef %p, ptr noundef %pk, ptr noundef %sk) local_unnamed_addr #0 !dbg !261 {
entry:
    #dbg_value(ptr %p, !292, !DIExpression(), !293)
    #dbg_value(ptr %pk, !294, !DIExpression(), !293)
    #dbg_value(ptr %sk, !295, !DIExpression(), !293)
    #dbg_value(i32 0, !296, !DIExpression(), !293)
  %call = call i32 @pqmayo_MAYO_2_ref_mayo_keypair_compact(ptr noundef %p, ptr noundef %pk, ptr noundef %sk) #6, !dbg !297
    #dbg_value(i32 %call, !296, !DIExpression(), !293)
    #dbg_label(!298, !299)
  ret i32 %call, !dbg !300
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_2_ref_mayo_keypair_compact(ptr noundef %p, ptr noundef %cpk, ptr noundef %csk) local_unnamed_addr #0 !dbg !301 {
entry:
  %S = alloca [560 x i8], align 1
  %P = alloca [12672 x i64], align 8
  %P3 = alloca [1156 x i64], align 8
  %O = alloca [1088 x i8], align 1
  %P3_upper = alloca [612 x i64], align 8
    #dbg_value(ptr %p, !302, !DIExpression(), !303)
    #dbg_value(ptr %cpk, !304, !DIExpression(), !303)
    #dbg_value(ptr %csk, !305, !DIExpression(), !303)
    #dbg_value(i32 0, !306, !DIExpression(), !303)
    #dbg_value(ptr %csk, !307, !DIExpression(), !303)
    #dbg_declare(ptr %S, !308, !DIExpression(), !312)
    #dbg_declare(ptr %P, !313, !DIExpression(), !314)
    #dbg_declare(ptr %P3, !315, !DIExpression(), !319)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(9248) %P3, i8 0, i32 9248, i1 false), !dbg !319
    #dbg_declare(ptr %O, !320, !DIExpression(), !322)
    #dbg_value(i32 4, !323, !DIExpression(), !303)
    #dbg_value(i32 64, !325, !DIExpression(), !303)
    #dbg_value(i32 64, !326, !DIExpression(), !303)
    #dbg_value(i32 17, !327, !DIExpression(), !303)
    #dbg_value(i32 544, !328, !DIExpression(), !303)
    #dbg_value(i32 8320, !329, !DIExpression(), !303)
    #dbg_value(i32 612, !330, !DIExpression(), !303)
    #dbg_value(i32 16, !331, !DIExpression(), !303)
    #dbg_value(i32 24, !332, !DIExpression(), !303)
    #dbg_value(ptr %P, !333, !DIExpression(), !303)
  %add.ptr = getelementptr inbounds nuw i8, ptr %P, i32 66560, !dbg !334
    #dbg_value(ptr %add.ptr, !335, !DIExpression(), !303)
  %call = call i32 @randombytes(ptr noundef %csk, i32 noundef 24) #8, !dbg !336
  %cmp.not = icmp eq i32 %call, 0, !dbg !338
  br i1 %cmp.not, label %if.end, label %err, !dbg !338

if.end:                                           ; preds = %entry
    #dbg_value(ptr %P, !333, !DIExpression(), !303)
  %call3 = call i32 @shake256(ptr noundef nonnull %S, i32 noundef 560, ptr noundef %csk, i32 noundef 24) #8, !dbg !339
    #dbg_value(ptr %S, !340, !DIExpression(), !303)
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %S, i32 16, !dbg !341
  call fastcc void @decode(ptr noundef nonnull %add.ptr6, ptr noundef nonnull %O, i32 noundef 1088) #6, !dbg !342
  call fastcc void @expand_P1_P2(ptr noundef %p, ptr noundef nonnull %P, ptr noundef nonnull %S) #6, !dbg !343
  call fastcc void @compute_P3(ptr noundef %p, ptr noundef nonnull %P, ptr noundef nonnull %add.ptr, ptr noundef nonnull %O, ptr noundef nonnull %P3) #6, !dbg !344
  %call11 = call ptr @memcpy(ptr noundef %cpk, ptr noundef nonnull %S, i32 noundef 16) #8, !dbg !345
    #dbg_declare(ptr %P3_upper, !346, !DIExpression(), !350)
  call void @pqmayo_MAYO_2_ref_m_upper(ptr noundef %p, ptr noundef nonnull %P3, ptr noundef nonnull %P3_upper, i32 noundef 17) #6, !dbg !351
  %add.ptr15 = getelementptr inbounds nuw i8, ptr %cpk, i32 16, !dbg !352
  call fastcc void @pack_m_vecs(ptr noundef nonnull %P3_upper, ptr noundef nonnull %add.ptr15, i32 noundef 153, i32 noundef 64) #6, !dbg !353
  br label %err, !dbg !353

err:                                              ; preds = %entry, %if.end
  %ret.0 = phi i32 [ 0, %if.end ], [ 1, %entry ], !dbg !303
    #dbg_value(i32 %ret.0, !306, !DIExpression(), !303)
    #dbg_label(!354, !355)
  call void @mayo_secure_clear(ptr noundef nonnull %O, i32 noundef 1088) #8, !dbg !356
  call void @mayo_secure_clear(ptr noundef nonnull %add.ptr, i32 noundef 34816) #8, !dbg !357
  call void @mayo_secure_clear(ptr noundef nonnull %P3, i32 noundef 9248) #8, !dbg !358
  ret i32 %ret.0, !dbg !359
}

declare dso_local i32 @randombytes(ptr noundef, i32 noundef) local_unnamed_addr #4

declare dso_local i32 @shake256(ptr noundef, i32 noundef, ptr noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: nounwind
define internal fastcc void @decode(ptr noundef %m, ptr noundef %mdec, i32 noundef %mdeclen) unnamed_addr #0 !dbg !360 {
entry:
    #dbg_value(ptr %m, !363, !DIExpression(), !364)
    #dbg_value(ptr %mdec, !365, !DIExpression(), !364)
    #dbg_value(i32 %mdeclen, !366, !DIExpression(), !364)
    #dbg_value(i32 0, !367, !DIExpression(), !364)
  br label %for.cond, !dbg !368

for.cond:                                         ; preds = %for.body, %entry
  %mdec.addr.0 = phi ptr [ %mdec, %entry ], [ %incdec.ptr5, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !370
    #dbg_value(i32 %i.0, !367, !DIExpression(), !364)
    #dbg_value(ptr %mdec.addr.0, !365, !DIExpression(), !364)
  %div = sdiv i32 %mdeclen, 2, !dbg !371
  %cmp = icmp slt i32 %i.0, %div, !dbg !373
  br i1 %cmp, label %for.body, label %for.end, !dbg !374

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %m, i32 %i.0, !dbg !375
  %0 = load i8, ptr %arrayidx, align 1, !dbg !375
  %1 = and i8 %0, 15, !dbg !377
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %mdec.addr.0, i32 1, !dbg !378
    #dbg_value(ptr %incdec.ptr, !365, !DIExpression(), !364)
  store i8 %1, ptr %mdec.addr.0, align 1, !dbg !379
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %m, i32 %i.0, !dbg !380
  %2 = load i8, ptr %arrayidx2, align 1, !dbg !380
  %3 = lshr i8 %2, 4, !dbg !381
    #dbg_value(ptr %incdec.ptr, !365, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !364)
  store i8 %3, ptr %incdec.ptr, align 1, !dbg !382
  %incdec.ptr5 = getelementptr inbounds nuw i8, ptr %mdec.addr.0, i32 2, !dbg !383
    #dbg_value(ptr %incdec.ptr5, !365, !DIExpression(), !364)
  %inc = add nuw nsw i32 %i.0, 1, !dbg !384
    #dbg_value(i32 %inc, !367, !DIExpression(), !364)
  br label %for.cond, !dbg !385, !llvm.loop !386

for.end:                                          ; preds = %for.cond
  %4 = and i32 %mdeclen, -2147483647, !dbg !389
  %cmp6 = icmp eq i32 %4, 1, !dbg !389
  br i1 %cmp6, label %if.then, label %if.end, !dbg !389

if.then:                                          ; preds = %for.end
  %arrayidx8 = getelementptr inbounds nuw i8, ptr %m, i32 %i.0, !dbg !391
  %5 = load i8, ptr %arrayidx8, align 1, !dbg !391
  %6 = and i8 %5, 15, !dbg !393
    #dbg_value(ptr %mdec.addr.0, !365, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !364)
  store i8 %6, ptr %mdec.addr.0, align 1, !dbg !394
  br label %if.end, !dbg !395

if.end:                                           ; preds = %if.then, %for.end
  ret void, !dbg !396
}

; Function Attrs: nounwind
define internal fastcc void @expand_P1_P2(ptr noundef %p, ptr noundef %P, ptr noundef %seed_pk) unnamed_addr #0 !dbg !397 {
entry:
    #dbg_value(ptr %p, !400, !DIExpression(), !401)
    #dbg_value(ptr %P, !402, !DIExpression(), !401)
    #dbg_value(ptr %seed_pk, !403, !DIExpression(), !401)
  %call = call i32 @AES_128_CTR(ptr noundef %P, i32 noundef 101376, ptr noundef %seed_pk, i32 noundef 16) #8, !dbg !404
  call fastcc void @unpack_m_vecs(ptr noundef %P, ptr noundef %P, i32 noundef 3168, i32 noundef 64) #6, !dbg !405
  ret void, !dbg !406
}

; Function Attrs: nounwind
define internal fastcc void @compute_P3(ptr noundef %p, ptr noundef %P1, ptr noundef %P2, ptr noundef %O, ptr noundef %P3) unnamed_addr #0 !dbg !407 {
entry:
    #dbg_value(ptr %p, !412, !DIExpression(), !413)
    #dbg_value(ptr %P1, !414, !DIExpression(), !413)
    #dbg_value(ptr %P2, !415, !DIExpression(), !413)
    #dbg_value(ptr %O, !416, !DIExpression(), !413)
    #dbg_value(ptr %P3, !417, !DIExpression(), !413)
    #dbg_value(i32 4, !418, !DIExpression(), !413)
    #dbg_value(i32 64, !419, !DIExpression(), !413)
    #dbg_value(i32 17, !420, !DIExpression(), !413)
  call fastcc void @P1_times_O(ptr noundef %p, ptr noundef %P1, ptr noundef %O, ptr noundef %P2) #6, !dbg !421
  call fastcc void @mul_add_mat_trans_x_m_mat(i32 noundef 4, ptr noundef %O, ptr noundef %P2, ptr noundef %P3, i32 noundef 64, i32 noundef 17, i32 noundef 17) #6, !dbg !422
  ret void, !dbg !423
}

declare dso_local ptr @memcpy(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: nounwind
define internal fastcc void @pack_m_vecs(ptr noundef %in, ptr noundef %out, i32 noundef %vecs, i32 noundef %m) unnamed_addr #0 !dbg !424 {
entry:
    #dbg_value(ptr %in, !427, !DIExpression(), !428)
    #dbg_value(ptr %out, !429, !DIExpression(), !428)
    #dbg_value(i32 %vecs, !430, !DIExpression(), !428)
    #dbg_value(i32 %m, !431, !DIExpression(), !428)
  %add = add nsw i32 %m, 15, !dbg !432
  %div = sdiv i32 %add, 16, !dbg !433
    #dbg_value(i32 %div, !434, !DIExpression(), !428)
    #dbg_value(ptr %in, !435, !DIExpression(), !428)
    #dbg_value(i32 0, !436, !DIExpression(), !438)
  %smax = call i32 @llvm.smax.i32(i32 %vecs, i32 0), !dbg !439
  br label %for.cond, !dbg !439

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !440
    #dbg_value(i32 %i.0, !436, !DIExpression(), !438)
  %exitcond.not = icmp eq i32 %i.0, %smax, !dbg !441
  br i1 %exitcond.not, label %for.end, label %for.body, !dbg !443

for.body:                                         ; preds = %for.cond
  %mul = mul nsw i32 %i.0, %m, !dbg !444
  %div1 = sdiv i32 %mul, 2, !dbg !446
  %add.ptr = getelementptr inbounds i8, ptr %out, i32 %div1, !dbg !447
  %mul2 = mul nsw i32 %i.0, %div, !dbg !448
  %mul3 = shl i32 %mul2, 3, !dbg !449
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %in, i32 %mul3, !dbg !450
  %div5 = sdiv i32 %m, 2, !dbg !451
  %call = call ptr @memmove(ptr noundef %add.ptr, ptr noundef %add.ptr4, i32 noundef %div5) #8, !dbg !452
  %inc = add nuw i32 %i.0, 1, !dbg !453
    #dbg_value(i32 %inc, !436, !DIExpression(), !438)
  br label %for.cond, !dbg !454, !llvm.loop !455

for.end:                                          ; preds = %for.cond
  ret void, !dbg !457
}

declare dso_local void @mayo_secure_clear(ptr noundef, i32 noundef) local_unnamed_addr #4

declare dso_local ptr @memmove(ptr noundef, ptr noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: nounwind
define internal fastcc void @P1_times_O(ptr noundef %p, ptr noundef %P1, ptr noundef %O, ptr noundef %acc) unnamed_addr #0 !dbg !458 {
entry:
    #dbg_value(ptr %p, !461, !DIExpression(), !462)
    #dbg_value(ptr %P1, !463, !DIExpression(), !462)
    #dbg_value(ptr %O, !464, !DIExpression(), !462)
    #dbg_value(ptr %acc, !465, !DIExpression(), !462)
  call fastcc void @mul_add_m_upper_triangular_mat_x_mat(i32 noundef 4, ptr noundef %P1, ptr noundef %O, ptr noundef %acc, i32 noundef 64, i32 noundef 64, i32 noundef 17, i32 noundef 1) #6, !dbg !466
  ret void, !dbg !467
}

; Function Attrs: nounwind
define internal fastcc void @mul_add_mat_trans_x_m_mat(i32 noundef %m_vec_limbs, ptr noundef %mat, ptr noundef %bs_mat, ptr noundef %acc, i32 noundef %mat_rows, i32 noundef %mat_cols, i32 noundef %bs_mat_cols) unnamed_addr #0 !dbg !468 {
entry:
    #dbg_value(i32 %m_vec_limbs, !471, !DIExpression(), !472)
    #dbg_value(ptr %mat, !473, !DIExpression(), !472)
    #dbg_value(ptr %bs_mat, !474, !DIExpression(), !472)
    #dbg_value(ptr %acc, !475, !DIExpression(), !472)
    #dbg_value(i32 %mat_rows, !476, !DIExpression(), !472)
    #dbg_value(i32 %mat_cols, !477, !DIExpression(), !472)
    #dbg_value(i32 %bs_mat_cols, !478, !DIExpression(), !472)
    #dbg_value(i32 0, !479, !DIExpression(), !481)
  %smax = call i32 @llvm.smax.i32(i32 %bs_mat_cols, i32 0), !dbg !482
  %smax1 = call i32 @llvm.smax.i32(i32 %mat_rows, i32 0), !dbg !482
  %smax3 = call i32 @llvm.smax.i32(i32 %mat_cols, i32 0), !dbg !482
  br label %for.cond, !dbg !482

for.cond:                                         ; preds = %for.inc17, %entry
  %r.0 = phi i32 [ 0, %entry ], [ %inc18, %for.inc17 ], !dbg !483
    #dbg_value(i32 %r.0, !479, !DIExpression(), !481)
  %exitcond4.not = icmp eq i32 %r.0, %smax3, !dbg !484
  br i1 %exitcond4.not, label %for.end19, label %for.cond1, !dbg !486

for.cond1:                                        ; preds = %for.cond, %for.inc15
  %c.0 = phi i32 [ %inc, %for.inc15 ], [ 0, %for.cond ], !dbg !487
    #dbg_value(i32 %c.0, !490, !DIExpression(), !491)
  %exitcond2.not = icmp eq i32 %c.0, %smax1, !dbg !492
  br i1 %exitcond2.not, label %for.inc17, label %for.cond4, !dbg !494

for.cond4:                                        ; preds = %for.cond1, %for.body6
  %k.0 = phi i32 [ %add14, %for.body6 ], [ 0, %for.cond1 ], !dbg !495
    #dbg_value(i32 %k.0, !498, !DIExpression(), !499)
  %exitcond.not = icmp eq i32 %k.0, %smax, !dbg !500
  br i1 %exitcond.not, label %for.inc15, label %for.body6, !dbg !502

for.body6:                                        ; preds = %for.cond4
  %mul = mul nsw i32 %c.0, %bs_mat_cols, !dbg !503
  %add = add nsw i32 %mul, %k.0, !dbg !505
  %mul7 = mul nsw i32 %m_vec_limbs, %add, !dbg !506
  %add.ptr = getelementptr inbounds i64, ptr %bs_mat, i32 %mul7, !dbg !507
  %mul8 = mul nsw i32 %c.0, %mat_cols, !dbg !508
  %0 = getelementptr i8, ptr %mat, i32 %mul8, !dbg !509
  %arrayidx = getelementptr i8, ptr %0, i32 %r.0, !dbg !509
  %1 = load i8, ptr %arrayidx, align 1, !dbg !509
  %mul10 = mul nsw i32 %r.0, %bs_mat_cols, !dbg !510
  %add11 = add nsw i32 %mul10, %k.0, !dbg !511
  %mul12 = mul nsw i32 %m_vec_limbs, %add11, !dbg !512
  %add.ptr13 = getelementptr inbounds i64, ptr %acc, i32 %mul12, !dbg !513
  call fastcc void @m_vec_mul_add(i32 noundef %m_vec_limbs, ptr noundef %add.ptr, i8 noundef zeroext %1, ptr noundef %add.ptr13) #6, !dbg !514
  %add14 = add nuw i32 %k.0, 1, !dbg !515
    #dbg_value(i32 %add14, !498, !DIExpression(), !499)
  br label %for.cond4, !dbg !516, !llvm.loop !517

for.inc15:                                        ; preds = %for.cond4
  %inc = add nuw i32 %c.0, 1, !dbg !519
    #dbg_value(i32 %inc, !490, !DIExpression(), !491)
  br label %for.cond1, !dbg !520, !llvm.loop !521

for.inc17:                                        ; preds = %for.cond1
  %inc18 = add nuw i32 %r.0, 1, !dbg !523
    #dbg_value(i32 %inc18, !479, !DIExpression(), !481)
  br label %for.cond, !dbg !524, !llvm.loop !525

for.end19:                                        ; preds = %for.cond
  ret void, !dbg !527
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_mul_add(i32 noundef %m_vec_limbs, ptr noundef %in, i8 noundef zeroext %a, ptr noundef %acc) unnamed_addr #0 !dbg !528 {
entry:
    #dbg_value(i32 %m_vec_limbs, !532, !DIExpression(), !533)
    #dbg_value(ptr %in, !534, !DIExpression(), !533)
    #dbg_value(i8 %a, !535, !DIExpression(), !533)
    #dbg_value(ptr %acc, !536, !DIExpression(), !533)
  %call = call fastcc i32 @mul_table(i8 noundef zeroext %a) #6, !dbg !537
    #dbg_value(i32 %call, !538, !DIExpression(), !533)
    #dbg_value(i64 1229782938247303441, !539, !DIExpression(), !533)
    #dbg_value(i32 0, !540, !DIExpression(), !542)
    #dbg_value(i32 0, !540, !DIExpression(), !542)
  %0 = load i64, ptr %in, align 8, !dbg !543
  %and = and i64 %0, 1229782938247303441, !dbg !546
  %and1 = and i32 %call, 255, !dbg !547
  %conv = zext nneg i32 %and1 to i64, !dbg !548
  %mul = mul i64 %and, %conv, !dbg !549
  %shr = lshr i64 %0, 1, !dbg !550
  %and3 = and i64 %shr, 1229782938247303441, !dbg !551
  %shr4 = lshr i32 %call, 8, !dbg !552
  %and5 = and i32 %shr4, 15, !dbg !553
  %conv6 = zext nneg i32 %and5 to i64, !dbg !554
  %mul7 = mul nuw i64 %and3, %conv6, !dbg !555
  %xor = xor i64 %mul, %mul7, !dbg !556
  %1 = load i64, ptr %in, align 8, !dbg !557
  %shr9 = lshr i64 %1, 2, !dbg !558
  %and10 = and i64 %shr9, 1229782938247303441, !dbg !559
  %shr11 = lshr i32 %call, 16, !dbg !560
  %and12 = and i32 %shr11, 15, !dbg !561
  %conv13 = zext nneg i32 %and12 to i64, !dbg !562
  %mul14 = mul nuw i64 %and10, %conv13, !dbg !563
  %xor15 = xor i64 %xor, %mul14, !dbg !564
  %2 = load i64, ptr %in, align 8, !dbg !565
  %shr17 = lshr i64 %2, 3, !dbg !566
  %and18 = and i64 %shr17, 1229782938247303441, !dbg !567
  %shr19 = lshr i32 %call, 24, !dbg !568
  %and20 = and i32 %shr19, 15, !dbg !569
  %conv21 = zext nneg i32 %and20 to i64, !dbg !570
  %mul22 = mul nuw i64 %and18, %conv21, !dbg !571
  %xor23 = xor i64 %xor15, %mul22, !dbg !572
  %3 = load i64, ptr %acc, align 8, !dbg !573
  %xor25 = xor i64 %3, %xor23, !dbg !573
  store i64 %xor25, ptr %acc, align 8, !dbg !573
    #dbg_value(i32 1, !540, !DIExpression(), !542)
  %arrayidx.1 = getelementptr inbounds nuw i8, ptr %in, i32 8, !dbg !543
  %4 = load i64, ptr %arrayidx.1, align 8, !dbg !543
  %and.1 = and i64 %4, 1229782938247303441, !dbg !546
  %and1.1 = and i32 %call, 255, !dbg !547
  %conv.1 = zext nneg i32 %and1.1 to i64, !dbg !548
  %mul.1 = mul i64 %and.1, %conv.1, !dbg !549
  %shr.1 = lshr i64 %4, 1, !dbg !550
  %and3.1 = and i64 %shr.1, 1229782938247303441, !dbg !551
  %shr4.1 = lshr i32 %call, 8, !dbg !552
  %and5.1 = and i32 %shr4.1, 15, !dbg !553
  %conv6.1 = zext nneg i32 %and5.1 to i64, !dbg !554
  %mul7.1 = mul nuw i64 %and3.1, %conv6.1, !dbg !555
  %xor.1 = xor i64 %mul.1, %mul7.1, !dbg !556
  %arrayidx8.1 = getelementptr inbounds nuw i8, ptr %in, i32 8, !dbg !557
  %5 = load i64, ptr %arrayidx8.1, align 8, !dbg !557
  %shr9.1 = lshr i64 %5, 2, !dbg !558
  %and10.1 = and i64 %shr9.1, 1229782938247303441, !dbg !559
  %shr11.1 = lshr i32 %call, 16, !dbg !560
  %and12.1 = and i32 %shr11.1, 15, !dbg !561
  %conv13.1 = zext nneg i32 %and12.1 to i64, !dbg !562
  %mul14.1 = mul nuw i64 %and10.1, %conv13.1, !dbg !563
  %xor15.1 = xor i64 %xor.1, %mul14.1, !dbg !564
  %arrayidx16.1 = getelementptr inbounds nuw i8, ptr %in, i32 8, !dbg !565
  %6 = load i64, ptr %arrayidx16.1, align 8, !dbg !565
  %shr17.1 = lshr i64 %6, 3, !dbg !566
  %and18.1 = and i64 %shr17.1, 1229782938247303441, !dbg !567
  %shr19.1 = lshr i32 %call, 24, !dbg !568
  %and20.1 = and i32 %shr19.1, 15, !dbg !569
  %conv21.1 = zext nneg i32 %and20.1 to i64, !dbg !570
  %mul22.1 = mul nuw i64 %and18.1, %conv21.1, !dbg !571
  %xor23.1 = xor i64 %xor15.1, %mul22.1, !dbg !572
  %arrayidx24.1 = getelementptr inbounds nuw i8, ptr %acc, i32 8, !dbg !574
  %7 = load i64, ptr %arrayidx24.1, align 8, !dbg !573
  %xor25.1 = xor i64 %7, %xor23.1, !dbg !573
  store i64 %xor25.1, ptr %arrayidx24.1, align 8, !dbg !573
    #dbg_value(i32 2, !540, !DIExpression(), !542)
  %arrayidx.2 = getelementptr inbounds nuw i8, ptr %in, i32 16, !dbg !543
  %8 = load i64, ptr %arrayidx.2, align 8, !dbg !543
  %and.2 = and i64 %8, 1229782938247303441, !dbg !546
  %and1.2 = and i32 %call, 255, !dbg !547
  %conv.2 = zext nneg i32 %and1.2 to i64, !dbg !548
  %mul.2 = mul i64 %and.2, %conv.2, !dbg !549
  %shr.2 = lshr i64 %8, 1, !dbg !550
  %and3.2 = and i64 %shr.2, 1229782938247303441, !dbg !551
  %shr4.2 = lshr i32 %call, 8, !dbg !552
  %and5.2 = and i32 %shr4.2, 15, !dbg !553
  %conv6.2 = zext nneg i32 %and5.2 to i64, !dbg !554
  %mul7.2 = mul nuw i64 %and3.2, %conv6.2, !dbg !555
  %xor.2 = xor i64 %mul.2, %mul7.2, !dbg !556
  %arrayidx8.2 = getelementptr inbounds nuw i8, ptr %in, i32 16, !dbg !557
  %9 = load i64, ptr %arrayidx8.2, align 8, !dbg !557
  %shr9.2 = lshr i64 %9, 2, !dbg !558
  %and10.2 = and i64 %shr9.2, 1229782938247303441, !dbg !559
  %shr11.2 = lshr i32 %call, 16, !dbg !560
  %and12.2 = and i32 %shr11.2, 15, !dbg !561
  %conv13.2 = zext nneg i32 %and12.2 to i64, !dbg !562
  %mul14.2 = mul nuw i64 %and10.2, %conv13.2, !dbg !563
  %xor15.2 = xor i64 %xor.2, %mul14.2, !dbg !564
  %arrayidx16.2 = getelementptr inbounds nuw i8, ptr %in, i32 16, !dbg !565
  %10 = load i64, ptr %arrayidx16.2, align 8, !dbg !565
  %shr17.2 = lshr i64 %10, 3, !dbg !566
  %and18.2 = and i64 %shr17.2, 1229782938247303441, !dbg !567
  %shr19.2 = lshr i32 %call, 24, !dbg !568
  %and20.2 = and i32 %shr19.2, 15, !dbg !569
  %conv21.2 = zext nneg i32 %and20.2 to i64, !dbg !570
  %mul22.2 = mul nuw i64 %and18.2, %conv21.2, !dbg !571
  %xor23.2 = xor i64 %xor15.2, %mul22.2, !dbg !572
  %arrayidx24.2 = getelementptr inbounds nuw i8, ptr %acc, i32 16, !dbg !574
  %11 = load i64, ptr %arrayidx24.2, align 8, !dbg !573
  %xor25.2 = xor i64 %11, %xor23.2, !dbg !573
  store i64 %xor25.2, ptr %arrayidx24.2, align 8, !dbg !573
    #dbg_value(i32 3, !540, !DIExpression(), !542)
  %arrayidx.3 = getelementptr inbounds nuw i8, ptr %in, i32 24, !dbg !543
  %12 = load i64, ptr %arrayidx.3, align 8, !dbg !543
  %and.3 = and i64 %12, 1229782938247303441, !dbg !546
  %and1.3 = and i32 %call, 255, !dbg !547
  %conv.3 = zext nneg i32 %and1.3 to i64, !dbg !548
  %mul.3 = mul i64 %and.3, %conv.3, !dbg !549
  %shr.3 = lshr i64 %12, 1, !dbg !550
  %and3.3 = and i64 %shr.3, 1229782938247303441, !dbg !551
  %shr4.3 = lshr i32 %call, 8, !dbg !552
  %and5.3 = and i32 %shr4.3, 15, !dbg !553
  %conv6.3 = zext nneg i32 %and5.3 to i64, !dbg !554
  %mul7.3 = mul nuw i64 %and3.3, %conv6.3, !dbg !555
  %xor.3 = xor i64 %mul.3, %mul7.3, !dbg !556
  %arrayidx8.3 = getelementptr inbounds nuw i8, ptr %in, i32 24, !dbg !557
  %13 = load i64, ptr %arrayidx8.3, align 8, !dbg !557
  %shr9.3 = lshr i64 %13, 2, !dbg !558
  %and10.3 = and i64 %shr9.3, 1229782938247303441, !dbg !559
  %shr11.3 = lshr i32 %call, 16, !dbg !560
  %and12.3 = and i32 %shr11.3, 15, !dbg !561
  %conv13.3 = zext nneg i32 %and12.3 to i64, !dbg !562
  %mul14.3 = mul nuw i64 %and10.3, %conv13.3, !dbg !563
  %xor15.3 = xor i64 %xor.3, %mul14.3, !dbg !564
  %arrayidx16.3 = getelementptr inbounds nuw i8, ptr %in, i32 24, !dbg !565
  %14 = load i64, ptr %arrayidx16.3, align 8, !dbg !565
  %shr17.3 = lshr i64 %14, 3, !dbg !566
  %and18.3 = and i64 %shr17.3, 1229782938247303441, !dbg !567
  %shr19.3 = lshr i32 %call, 24, !dbg !568
  %and20.3 = and i32 %shr19.3, 15, !dbg !569
  %conv21.3 = zext nneg i32 %and20.3 to i64, !dbg !570
  %mul22.3 = mul nuw i64 %and18.3, %conv21.3, !dbg !571
  %xor23.3 = xor i64 %xor15.3, %mul22.3, !dbg !572
  %arrayidx24.3 = getelementptr inbounds nuw i8, ptr %acc, i32 24, !dbg !574
  %15 = load i64, ptr %arrayidx24.3, align 8, !dbg !573
  %xor25.3 = xor i64 %15, %xor23.3, !dbg !573
  store i64 %xor25.3, ptr %arrayidx24.3, align 8, !dbg !573
    #dbg_value(i32 4, !540, !DIExpression(), !542)
  ret void, !dbg !575
}

; Function Attrs: nounwind
define internal fastcc i32 @mul_table(i8 noundef zeroext %b) unnamed_addr #0 !dbg !576 {
entry:
    #dbg_value(i8 %b, !580, !DIExpression(), !581)
  %conv = zext i8 %b to i32, !dbg !582
  %mul = mul i32 %conv, 134480385, !dbg !583
    #dbg_value(i32 %mul, !584, !DIExpression(), !581)
    #dbg_value(i32 -252645136, !585, !DIExpression(), !581)
  %and = and i32 %mul, -252645136, !dbg !586
    #dbg_value(i32 %and, !587, !DIExpression(), !581)
  %shr = lshr exact i32 %and, 4, !dbg !588
  %shr1 = lshr exact i32 %and, 3, !dbg !589
  %0 = xor i32 %shr, %shr1, !dbg !590
  %xor2 = xor i32 %0, %mul, !dbg !590
  ret i32 %xor2, !dbg !591
}

; Function Attrs: nounwind
define internal fastcc void @mul_add_m_upper_triangular_mat_x_mat(i32 noundef %m_vec_limbs, ptr noundef %bs_mat, ptr noundef %mat, ptr noundef %acc, i32 noundef %bs_mat_rows, i32 noundef %bs_mat_cols, i32 noundef %mat_cols, i32 noundef %triangular) unnamed_addr #0 !dbg !592 {
entry:
    #dbg_value(i32 %m_vec_limbs, !595, !DIExpression(), !596)
    #dbg_value(ptr %bs_mat, !597, !DIExpression(), !596)
    #dbg_value(ptr %mat, !598, !DIExpression(), !596)
    #dbg_value(ptr %acc, !599, !DIExpression(), !596)
    #dbg_value(i32 %bs_mat_rows, !600, !DIExpression(), !596)
    #dbg_value(i32 %bs_mat_cols, !601, !DIExpression(), !596)
    #dbg_value(i32 %mat_cols, !602, !DIExpression(), !596)
    #dbg_value(i32 %triangular, !603, !DIExpression(), !596)
    #dbg_value(i32 0, !604, !DIExpression(), !596)
    #dbg_value(i32 0, !605, !DIExpression(), !607)
  %smax = call i32 @llvm.smax.i32(i32 %mat_cols, i32 0), !dbg !608
  %smax1 = call i32 @llvm.smax.i32(i32 %bs_mat_rows, i32 0), !dbg !608
  br label %for.cond, !dbg !608

for.cond:                                         ; preds = %for.inc17, %entry
  %bs_mat_entries_used.0 = phi i32 [ 0, %entry ], [ %bs_mat_entries_used.1, %for.inc17 ], !dbg !609
  %r.0 = phi i32 [ 0, %entry ], [ %inc18, %for.inc17 ], !dbg !610
    #dbg_value(i32 %r.0, !605, !DIExpression(), !607)
    #dbg_value(i32 %bs_mat_entries_used.0, !604, !DIExpression(), !596)
  %exitcond2.not = icmp eq i32 %r.0, %smax1, !dbg !611
  br i1 %exitcond2.not, label %for.end19, label %for.body, !dbg !613

for.body:                                         ; preds = %for.cond
  %mul = mul nsw i32 %triangular, %r.0, !dbg !614
    #dbg_value(i32 %mul, !617, !DIExpression(), !618)
  br label %for.cond1, !dbg !619

for.cond1:                                        ; preds = %for.inc15, %for.body
  %bs_mat_entries_used.1 = phi i32 [ %bs_mat_entries_used.0, %for.body ], [ %add14, %for.inc15 ], !dbg !596
  %c.0 = phi i32 [ %mul, %for.body ], [ %inc, %for.inc15 ], !dbg !620
    #dbg_value(i32 %c.0, !617, !DIExpression(), !618)
    #dbg_value(i32 %bs_mat_entries_used.1, !604, !DIExpression(), !596)
  %cmp2 = icmp slt i32 %c.0, %bs_mat_cols, !dbg !621
  br i1 %cmp2, label %for.cond4, label %for.inc17, !dbg !623

for.cond4:                                        ; preds = %for.cond1, %for.body6
  %k.0 = phi i32 [ %add13, %for.body6 ], [ 0, %for.cond1 ], !dbg !624
    #dbg_value(i32 %k.0, !627, !DIExpression(), !628)
  %exitcond.not = icmp eq i32 %k.0, %smax, !dbg !629
  br i1 %exitcond.not, label %for.inc15, label %for.body6, !dbg !631

for.body6:                                        ; preds = %for.cond4
  %mul7 = mul nsw i32 %m_vec_limbs, %bs_mat_entries_used.1, !dbg !632
  %add.ptr = getelementptr inbounds i64, ptr %bs_mat, i32 %mul7, !dbg !634
  %mul8 = mul nsw i32 %c.0, %mat_cols, !dbg !635
  %0 = getelementptr i8, ptr %mat, i32 %mul8, !dbg !636
  %arrayidx = getelementptr i8, ptr %0, i32 %k.0, !dbg !636
  %1 = load i8, ptr %arrayidx, align 1, !dbg !636
  %mul9 = mul nsw i32 %r.0, %mat_cols, !dbg !637
  %add10 = add nsw i32 %mul9, %k.0, !dbg !638
  %mul11 = mul nsw i32 %m_vec_limbs, %add10, !dbg !639
  %add.ptr12 = getelementptr inbounds i64, ptr %acc, i32 %mul11, !dbg !640
  call fastcc void @m_vec_mul_add(i32 noundef %m_vec_limbs, ptr noundef %add.ptr, i8 noundef zeroext %1, ptr noundef %add.ptr12) #6, !dbg !641
  %add13 = add nuw i32 %k.0, 1, !dbg !642
    #dbg_value(i32 %add13, !627, !DIExpression(), !628)
  br label %for.cond4, !dbg !643, !llvm.loop !644

for.inc15:                                        ; preds = %for.cond4
    #dbg_value(i32 %bs_mat_entries_used.1, !604, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !596)
  %add14 = add nsw i32 %bs_mat_entries_used.1, 1, !dbg !646
    #dbg_value(i32 %add14, !604, !DIExpression(), !596)
  %inc = add nsw i32 %c.0, 1, !dbg !647
    #dbg_value(i32 %inc, !617, !DIExpression(), !618)
  br label %for.cond1, !dbg !648, !llvm.loop !649

for.inc17:                                        ; preds = %for.cond1
  %inc18 = add nuw i32 %r.0, 1, !dbg !651
    #dbg_value(i32 %inc18, !605, !DIExpression(), !607)
  br label %for.cond, !dbg !652, !llvm.loop !653

for.end19:                                        ; preds = %for.cond
  ret void, !dbg !655
}

declare dso_local i32 @AES_128_CTR(ptr noundef, i32 noundef, ptr noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: nounwind
define internal fastcc void @unpack_m_vecs(ptr noundef %in, ptr noundef %out, i32 noundef %vecs, i32 noundef %m) unnamed_addr #0 !dbg !656 {
entry:
  %tmp = alloca [4 x i64], align 8
    #dbg_value(ptr %in, !659, !DIExpression(), !660)
    #dbg_value(ptr %out, !661, !DIExpression(), !660)
    #dbg_value(i32 %vecs, !662, !DIExpression(), !660)
    #dbg_value(i32 %m, !663, !DIExpression(), !660)
  %add = add nsw i32 %m, 15, !dbg !664
  %div = sdiv i32 %add, 16, !dbg !665
    #dbg_value(i32 %div, !666, !DIExpression(), !660)
    #dbg_value(ptr %out, !667, !DIExpression(), !660)
    #dbg_declare(ptr %tmp, !668, !DIExpression(), !670)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(32) %tmp, i8 0, i32 32, i1 false), !dbg !670
    #dbg_value(i32 %vecs, !671, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !673)
  br label %for.cond, !dbg !674

for.cond:                                         ; preds = %for.body, %entry
  %i.0.in = phi i32 [ %vecs, %entry ], [ %i.0, %for.body ]
    #dbg_value(i32 %i.0.in, !671, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !673)
  %cmp = icmp sgt i32 %i.0.in, 0, !dbg !675
  br i1 %cmp, label %for.body, label %for.end, !dbg !677

for.body:                                         ; preds = %for.cond
  %i.0 = add nsw i32 %i.0.in, -1, !dbg !678
    #dbg_value(i32 %i.0, !671, !DIExpression(), !673)
  %mul = mul nsw i32 %i.0, %m, !dbg !679
  %div1 = sdiv i32 %mul, 2, !dbg !681
  %add.ptr = getelementptr inbounds i8, ptr %in, i32 %div1, !dbg !682
  %div2 = sdiv i32 %m, 2, !dbg !683
  %call = call ptr @memcpy(ptr noundef nonnull %tmp, ptr noundef %add.ptr, i32 noundef %div2) #8, !dbg !684
  %mul3 = mul nsw i32 %i.0, %div, !dbg !685
  %mul4 = shl i32 %mul3, 3, !dbg !686
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %out, i32 %mul4, !dbg !687
  %mul7 = shl nsw i32 %div, 3, !dbg !688
  %call8 = call ptr @memcpy(ptr noundef %add.ptr5, ptr noundef nonnull %tmp, i32 noundef %mul7) #8, !dbg !689
    #dbg_value(i32 %i.0, !671, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !673)
  br label %for.cond, !dbg !690, !llvm.loop !691

for.end:                                          ; preds = %for.cond
  ret void, !dbg !693
}

; Function Attrs: nounwind
define dso_local i32 @pqmayo_MAYO_2_ref_mayo_expand_sk(ptr noundef %p, ptr noundef %csk, ptr noundef %sk) local_unnamed_addr #0 !dbg !694 {
entry:
  %S = alloca [560 x i8], align 1
    #dbg_value(ptr %p, !703, !DIExpression(), !704)
    #dbg_value(ptr %csk, !705, !DIExpression(), !704)
    #dbg_value(ptr %sk, !706, !DIExpression(), !704)
    #dbg_value(i32 0, !707, !DIExpression(), !704)
    #dbg_declare(ptr %S, !708, !DIExpression(), !709)
    #dbg_value(ptr %sk, !710, !DIExpression(), !704)
  %O2 = getelementptr inbounds nuw i8, ptr %sk, i32 101376, !dbg !711
    #dbg_value(ptr %O2, !712, !DIExpression(), !704)
    #dbg_value(i32 17, !713, !DIExpression(), !704)
    #dbg_value(i32 64, !714, !DIExpression(), !704)
    #dbg_value(i32 544, !715, !DIExpression(), !704)
    #dbg_value(i32 16, !716, !DIExpression(), !704)
    #dbg_value(i32 24, !717, !DIExpression(), !704)
    #dbg_value(ptr %csk, !718, !DIExpression(), !704)
    #dbg_value(ptr %S, !719, !DIExpression(), !704)
  %call = call i32 @shake256(ptr noundef nonnull %S, i32 noundef 560, ptr noundef %csk, i32 noundef 24) #8, !dbg !720
  %add.ptr = getelementptr inbounds nuw i8, ptr %S, i32 16, !dbg !721
  call fastcc void @decode(ptr noundef nonnull %add.ptr, ptr noundef nonnull %O2, i32 noundef 1088) #6, !dbg !722
  call fastcc void @expand_P1_P2(ptr noundef %p, ptr noundef %sk, ptr noundef nonnull %S) #6, !dbg !723
  %add.ptr7 = getelementptr inbounds nuw i8, ptr %sk, i32 66560, !dbg !724
    #dbg_value(ptr %add.ptr7, !725, !DIExpression(), !704)
    #dbg_value(ptr %sk, !726, !DIExpression(), !704)
    #dbg_value(ptr %add.ptr7, !727, !DIExpression(), !704)
  call fastcc void @P1P1t_times_O(ptr noundef %p, ptr noundef %sk, ptr noundef nonnull %O2, ptr noundef nonnull %add.ptr7) #6, !dbg !728
  call void @mayo_secure_clear(ptr noundef nonnull %S, i32 noundef 560) #8, !dbg !729
  ret i32 0, !dbg !730
}

; Function Attrs: nounwind
define internal fastcc void @P1P1t_times_O(ptr noundef %p, ptr noundef %P1, ptr noundef %O, ptr noundef %acc) unnamed_addr #0 !dbg !731 {
entry:
    #dbg_value(ptr %p, !732, !DIExpression(), !733)
    #dbg_value(ptr %P1, !734, !DIExpression(), !733)
    #dbg_value(ptr %O, !735, !DIExpression(), !733)
    #dbg_value(ptr %acc, !736, !DIExpression(), !733)
    #dbg_value(i32 17, !737, !DIExpression(), !733)
    #dbg_value(i32 64, !738, !DIExpression(), !733)
    #dbg_value(i32 4, !739, !DIExpression(), !733)
    #dbg_value(i32 0, !740, !DIExpression(), !733)
    #dbg_value(i32 0, !741, !DIExpression(), !743)
  br label %for.cond, !dbg !744

for.cond:                                         ; preds = %for.inc27, %entry
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc27 ], [ 64, %entry ], !dbg !745
  %bs_mat_entries_used.0 = phi i32 [ %bs_mat_entries_used.1, %for.inc27 ], [ 0, %entry ], !dbg !745
  %r.0 = phi i32 [ %inc28, %for.inc27 ], [ 0, %entry ], !dbg !746
    #dbg_value(i32 %r.0, !741, !DIExpression(), !743)
    #dbg_value(i32 %bs_mat_entries_used.0, !740, !DIExpression(), !733)
  %exitcond2.not = icmp eq i32 %r.0, 64, !dbg !747
  br i1 %exitcond2.not, label %for.end29, label %for.cond1.preheader, !dbg !749

for.cond1.preheader:                              ; preds = %for.cond
  %0 = add i32 %bs_mat_entries_used.0, %indvars.iv, !dbg !750
  br label %for.cond1, !dbg !750

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc25
  %bs_mat_entries_used.1 = phi i32 [ %bs_mat_entries_used.2, %for.inc25 ], [ %bs_mat_entries_used.0, %for.cond1.preheader ], !dbg !733
  %c.0 = phi i32 [ %inc, %for.inc25 ], [ %r.0, %for.cond1.preheader ], !dbg !753
    #dbg_value(i32 %c.0, !754, !DIExpression(), !755)
    #dbg_value(i32 %bs_mat_entries_used.1, !740, !DIExpression(), !733)
  %exitcond1.not = icmp eq i32 %bs_mat_entries_used.1, %0, !dbg !756
  br i1 %exitcond1.not, label %for.inc27, label %for.body3, !dbg !750

for.body3:                                        ; preds = %for.cond1
  %cmp4 = icmp eq i32 %c.0, %r.0, !dbg !758
  br i1 %cmp4, label %for.inc25, label %for.cond5.preheader, !dbg !758

for.cond5.preheader:                              ; preds = %for.body3
  %add.ptr.idx.4 = shl nsw i32 %bs_mat_entries_used.1, 5, !dbg !761
  %add.ptr.4 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.4, !dbg !761
  %mul8.4 = mul nuw nsw i32 %c.0, 17, !dbg !765
  %1 = getelementptr inbounds nuw i8, ptr %O, i32 %mul8.4, !dbg !766
  br label %for.cond5, !dbg !767

for.cond5:                                        ; preds = %for.body7.5, %for.cond5.preheader
  %k.0 = phi i32 [ 0, %for.cond5.preheader ], [ %add23.5, %for.body7.5 ], !dbg !768
    #dbg_value(i32 %k.0, !769, !DIExpression(), !770)
  %add.ptr.idx = shl nsw i32 %bs_mat_entries_used.1, 5, !dbg !761
  %add.ptr = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx, !dbg !761
  %mul8 = mul nuw nsw i32 %c.0, 17, !dbg !765
  %2 = getelementptr inbounds nuw i8, ptr %O, i32 %mul8, !dbg !766
  %arrayidx = getelementptr inbounds nuw i8, ptr %2, i32 %k.0, !dbg !766
  %3 = load i8, ptr %arrayidx, align 1, !dbg !766
  %mul10 = mul nuw nsw i32 %r.0, 17, !dbg !771
  %add11 = add nuw nsw i32 %mul10, %k.0, !dbg !772
  %add.ptr13.idx = shl nuw nsw i32 %add11, 5, !dbg !773
  %add.ptr13 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr13.idx, !dbg !773
  call fastcc void @m_vec_mul_add(i32 noundef 4, ptr noundef %add.ptr, i8 noundef zeroext %3, ptr noundef %add.ptr13) #6, !dbg !774
  %add.ptr15.idx = shl nsw i32 %bs_mat_entries_used.1, 5, !dbg !775
  %add.ptr15 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr15.idx, !dbg !775
  %mul16 = mul nuw nsw i32 %r.0, 17, !dbg !776
  %4 = getelementptr inbounds nuw i8, ptr %O, i32 %mul16, !dbg !777
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %4, i32 %k.0, !dbg !777
  %5 = load i8, ptr %arrayidx18, align 1, !dbg !777
  %mul19 = mul nuw nsw i32 %c.0, 17, !dbg !778
  %add20 = add nuw nsw i32 %mul19, %k.0, !dbg !779
  %add.ptr22.idx = shl nuw nsw i32 %add20, 5, !dbg !780
  %add.ptr22 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr22.idx, !dbg !780
  call fastcc void @m_vec_mul_add(i32 noundef 4, ptr noundef %add.ptr15, i8 noundef zeroext %5, ptr noundef %add.ptr22) #6, !dbg !781
    #dbg_value(i32 %k.0, !769, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !770)
  %add23 = or disjoint i32 %k.0, 1, !dbg !782
    #dbg_value(i32 %add23, !769, !DIExpression(), !770)
  %add.ptr.idx.1 = shl nsw i32 %bs_mat_entries_used.1, 5, !dbg !761
  %add.ptr.1 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.1, !dbg !761
  %mul8.1 = mul nuw nsw i32 %c.0, 17, !dbg !765
  %6 = getelementptr inbounds nuw i8, ptr %O, i32 %mul8.1, !dbg !766
  %arrayidx.1 = getelementptr inbounds nuw i8, ptr %6, i32 %add23, !dbg !766
  %7 = load i8, ptr %arrayidx.1, align 1, !dbg !766
  %mul10.1 = mul nuw nsw i32 %r.0, 17, !dbg !771
  %add11.1 = add nuw nsw i32 %mul10.1, %add23, !dbg !772
  %add.ptr13.idx.1 = shl nuw nsw i32 %add11.1, 5, !dbg !773
  %add.ptr13.1 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr13.idx.1, !dbg !773
  call fastcc void @m_vec_mul_add(i32 noundef 4, ptr noundef %add.ptr.1, i8 noundef zeroext %7, ptr noundef nonnull %add.ptr13.1) #6, !dbg !774
  %add.ptr15.idx.1 = shl nsw i32 %bs_mat_entries_used.1, 5, !dbg !775
  %add.ptr15.1 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr15.idx.1, !dbg !775
  %mul16.1 = mul nuw nsw i32 %r.0, 17, !dbg !776
  %8 = getelementptr inbounds nuw i8, ptr %O, i32 %mul16.1, !dbg !777
  %arrayidx18.1 = getelementptr inbounds nuw i8, ptr %8, i32 %add23, !dbg !777
  %9 = load i8, ptr %arrayidx18.1, align 1, !dbg !777
  %mul19.1 = mul nuw nsw i32 %c.0, 17, !dbg !778
  %add20.1 = add nuw nsw i32 %mul19.1, %add23, !dbg !779
  %add.ptr22.idx.1 = shl nuw nsw i32 %add20.1, 5, !dbg !780
  %add.ptr22.1 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr22.idx.1, !dbg !780
  call fastcc void @m_vec_mul_add(i32 noundef 4, ptr noundef %add.ptr15.1, i8 noundef zeroext %9, ptr noundef nonnull %add.ptr22.1) #6, !dbg !781
    #dbg_value(i32 %k.0, !769, !DIExpression(DW_OP_plus_uconst, 2, DW_OP_stack_value), !770)
  %add23.1 = add nuw nsw i32 %k.0, 2, !dbg !782
    #dbg_value(i32 %add23.1, !769, !DIExpression(), !770)
  %add.ptr.idx.2 = shl nsw i32 %bs_mat_entries_used.1, 5, !dbg !761
  %add.ptr.2 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.2, !dbg !761
  %mul8.2 = mul nuw nsw i32 %c.0, 17, !dbg !765
  %10 = getelementptr inbounds nuw i8, ptr %O, i32 %mul8.2, !dbg !766
  %arrayidx.2 = getelementptr inbounds nuw i8, ptr %10, i32 %add23.1, !dbg !766
  %11 = load i8, ptr %arrayidx.2, align 1, !dbg !766
  %mul10.2 = mul nuw nsw i32 %r.0, 17, !dbg !771
  %add11.2 = add nuw nsw i32 %mul10.2, %add23.1, !dbg !772
  %add.ptr13.idx.2 = shl nuw nsw i32 %add11.2, 5, !dbg !773
  %add.ptr13.2 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr13.idx.2, !dbg !773
  call fastcc void @m_vec_mul_add(i32 noundef 4, ptr noundef %add.ptr.2, i8 noundef zeroext %11, ptr noundef nonnull %add.ptr13.2) #6, !dbg !774
  %add.ptr15.idx.2 = shl nsw i32 %bs_mat_entries_used.1, 5, !dbg !775
  %add.ptr15.2 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr15.idx.2, !dbg !775
  %mul16.2 = mul nuw nsw i32 %r.0, 17, !dbg !776
  %12 = getelementptr inbounds nuw i8, ptr %O, i32 %mul16.2, !dbg !777
  %arrayidx18.2 = getelementptr inbounds nuw i8, ptr %12, i32 %add23.1, !dbg !777
  %13 = load i8, ptr %arrayidx18.2, align 1, !dbg !777
  %mul19.2 = mul nuw nsw i32 %c.0, 17, !dbg !778
  %add20.2 = add nuw nsw i32 %mul19.2, %add23.1, !dbg !779
  %add.ptr22.idx.2 = shl nuw nsw i32 %add20.2, 5, !dbg !780
  %add.ptr22.2 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr22.idx.2, !dbg !780
  call fastcc void @m_vec_mul_add(i32 noundef 4, ptr noundef %add.ptr15.2, i8 noundef zeroext %13, ptr noundef nonnull %add.ptr22.2) #6, !dbg !781
    #dbg_value(i32 %k.0, !769, !DIExpression(DW_OP_plus_uconst, 3, DW_OP_stack_value), !770)
  %add23.2 = add nuw nsw i32 %k.0, 3, !dbg !782
    #dbg_value(i32 %add23.2, !769, !DIExpression(), !770)
  %add.ptr.idx.3 = shl nsw i32 %bs_mat_entries_used.1, 5, !dbg !761
  %add.ptr.3 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.3, !dbg !761
  %mul8.3 = mul nuw nsw i32 %c.0, 17, !dbg !765
  %14 = getelementptr inbounds nuw i8, ptr %O, i32 %mul8.3, !dbg !766
  %arrayidx.3 = getelementptr inbounds nuw i8, ptr %14, i32 %add23.2, !dbg !766
  %15 = load i8, ptr %arrayidx.3, align 1, !dbg !766
  %mul10.3 = mul nuw nsw i32 %r.0, 17, !dbg !771
  %add11.3 = add nuw nsw i32 %mul10.3, %add23.2, !dbg !772
  %add.ptr13.idx.3 = shl nuw nsw i32 %add11.3, 5, !dbg !773
  %add.ptr13.3 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr13.idx.3, !dbg !773
  call fastcc void @m_vec_mul_add(i32 noundef 4, ptr noundef %add.ptr.3, i8 noundef zeroext %15, ptr noundef nonnull %add.ptr13.3) #6, !dbg !774
  %add.ptr15.idx.3 = shl nsw i32 %bs_mat_entries_used.1, 5, !dbg !775
  %add.ptr15.3 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr15.idx.3, !dbg !775
  %mul16.3 = mul nuw nsw i32 %r.0, 17, !dbg !776
  %16 = getelementptr inbounds nuw i8, ptr %O, i32 %mul16.3, !dbg !777
  %arrayidx18.3 = getelementptr inbounds nuw i8, ptr %16, i32 %add23.2, !dbg !777
  %17 = load i8, ptr %arrayidx18.3, align 1, !dbg !777
  %mul19.3 = mul nuw nsw i32 %c.0, 17, !dbg !778
  %add20.3 = add nuw nsw i32 %mul19.3, %add23.2, !dbg !779
  %add.ptr22.idx.3 = shl nuw nsw i32 %add20.3, 5, !dbg !780
  %add.ptr22.3 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr22.idx.3, !dbg !780
  call fastcc void @m_vec_mul_add(i32 noundef 4, ptr noundef %add.ptr15.3, i8 noundef zeroext %17, ptr noundef nonnull %add.ptr22.3) #6, !dbg !781
    #dbg_value(i32 %k.0, !769, !DIExpression(DW_OP_plus_uconst, 4, DW_OP_stack_value), !770)
  %add23.3 = add nuw nsw i32 %k.0, 4, !dbg !782
    #dbg_value(i32 %add23.3, !769, !DIExpression(), !770)
  %arrayidx.4 = getelementptr inbounds nuw i8, ptr %1, i32 %add23.3, !dbg !766
  %18 = load i8, ptr %arrayidx.4, align 1, !dbg !766
  %mul10.4 = mul nuw nsw i32 %r.0, 17, !dbg !771
  %add11.4 = add nuw nsw i32 %mul10.4, %add23.3, !dbg !772
  %add.ptr13.idx.4 = shl nuw nsw i32 %add11.4, 5, !dbg !773
  %add.ptr13.4 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr13.idx.4, !dbg !773
  call fastcc void @m_vec_mul_add(i32 noundef 4, ptr noundef %add.ptr.4, i8 noundef zeroext %18, ptr noundef nonnull %add.ptr13.4) #6, !dbg !774
  %add.ptr15.idx.4 = shl nsw i32 %bs_mat_entries_used.1, 5, !dbg !775
  %add.ptr15.4 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr15.idx.4, !dbg !775
  %mul16.4 = mul nuw nsw i32 %r.0, 17, !dbg !776
  %19 = getelementptr inbounds nuw i8, ptr %O, i32 %mul16.4, !dbg !777
  %arrayidx18.4 = getelementptr inbounds nuw i8, ptr %19, i32 %add23.3, !dbg !777
  %20 = load i8, ptr %arrayidx18.4, align 1, !dbg !777
  %mul19.4 = mul nuw nsw i32 %c.0, 17, !dbg !778
  %add20.4 = add nuw nsw i32 %mul19.4, %add23.3, !dbg !779
  %add.ptr22.idx.4 = shl nuw nsw i32 %add20.4, 5, !dbg !780
  %add.ptr22.4 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr22.idx.4, !dbg !780
  call fastcc void @m_vec_mul_add(i32 noundef 4, ptr noundef %add.ptr15.4, i8 noundef zeroext %20, ptr noundef nonnull %add.ptr22.4) #6, !dbg !781
  %add23.4 = add nuw nsw i32 %k.0, 5, !dbg !782
    #dbg_value(i32 %add23.4, !769, !DIExpression(), !770)
  %exitcond.5.not = icmp eq i32 %add23.4, 17, !dbg !783
  br i1 %exitcond.5.not, label %for.inc25, label %for.body7.5, !dbg !767

for.body7.5:                                      ; preds = %for.cond5
  %add.ptr.idx.5 = shl nsw i32 %bs_mat_entries_used.1, 5, !dbg !761
  %add.ptr.5 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.5, !dbg !761
  %mul8.5 = mul nuw nsw i32 %c.0, 17, !dbg !765
  %21 = getelementptr inbounds nuw i8, ptr %O, i32 %mul8.5, !dbg !766
  %arrayidx.5 = getelementptr inbounds nuw i8, ptr %21, i32 %add23.4, !dbg !766
  %22 = load i8, ptr %arrayidx.5, align 1, !dbg !766
  %mul10.5 = mul nuw nsw i32 %r.0, 17, !dbg !771
  %add11.5 = add nuw nsw i32 %mul10.5, %add23.4, !dbg !772
  %add.ptr13.idx.5 = shl nuw nsw i32 %add11.5, 5, !dbg !773
  %add.ptr13.5 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr13.idx.5, !dbg !773
  call fastcc void @m_vec_mul_add(i32 noundef 4, ptr noundef %add.ptr.5, i8 noundef zeroext %22, ptr noundef nonnull %add.ptr13.5) #6, !dbg !774
  %add.ptr15.idx.5 = shl nsw i32 %bs_mat_entries_used.1, 5, !dbg !775
  %add.ptr15.5 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr15.idx.5, !dbg !775
  %mul16.5 = mul nuw nsw i32 %r.0, 17, !dbg !776
  %23 = getelementptr inbounds nuw i8, ptr %O, i32 %mul16.5, !dbg !777
  %arrayidx18.5 = getelementptr inbounds nuw i8, ptr %23, i32 %add23.4, !dbg !777
  %24 = load i8, ptr %arrayidx18.5, align 1, !dbg !777
  %mul19.5 = mul nuw nsw i32 %c.0, 17, !dbg !778
  %add20.5 = add nuw nsw i32 %mul19.5, %add23.4, !dbg !779
  %add.ptr22.idx.5 = shl nuw nsw i32 %add20.5, 5, !dbg !780
  %add.ptr22.5 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr22.idx.5, !dbg !780
  call fastcc void @m_vec_mul_add(i32 noundef 4, ptr noundef %add.ptr15.5, i8 noundef zeroext %24, ptr noundef nonnull %add.ptr22.5) #6, !dbg !781
  %add23.5 = add nuw nsw i32 %k.0, 6, !dbg !782
    #dbg_value(i32 %add23.5, !769, !DIExpression(), !770)
  br label %for.cond5, !dbg !784, !llvm.loop !785

for.inc25:                                        ; preds = %for.cond5, %for.body3
  %bs_mat_entries_used.2 = add i32 %bs_mat_entries_used.1, 1, !dbg !787
    #dbg_value(i32 %bs_mat_entries_used.2, !740, !DIExpression(), !733)
  %inc = add nuw nsw i32 %c.0, 1, !dbg !788
    #dbg_value(i32 %inc, !754, !DIExpression(), !755)
  br label %for.cond1, !dbg !789, !llvm.loop !790

for.inc27:                                        ; preds = %for.cond1
  %inc28 = add nuw nsw i32 %r.0, 1, !dbg !792
    #dbg_value(i32 %inc28, !741, !DIExpression(), !743)
  %indvars.iv.next = add nsw i32 %indvars.iv, -1, !dbg !793
  br label %for.cond, !dbg !793, !llvm.loop !794

for.end29:                                        ; preds = %for.cond
  ret void, !dbg !796
}

; Function Attrs: nounwind
define dso_local i32 @pqmayo_MAYO_2_ref_mayo_sign_signature(ptr noundef %p, ptr noundef %sig, ptr noundef %siglen, ptr noundef %m, i32 noundef %mlen, ptr noundef %csk) local_unnamed_addr #0 !dbg !797 {
entry:
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
    #dbg_value(ptr %p, !801, !DIExpression(), !802)
    #dbg_value(ptr %sig, !803, !DIExpression(), !802)
    #dbg_value(ptr %siglen, !804, !DIExpression(), !802)
    #dbg_value(ptr %m, !805, !DIExpression(), !802)
    #dbg_value(i32 %mlen, !806, !DIExpression(), !802)
    #dbg_value(ptr %csk, !807, !DIExpression(), !802)
    #dbg_value(i32 0, !808, !DIExpression(), !802)
    #dbg_declare(ptr %tenc, !809, !DIExpression(), !810)
    #dbg_declare(ptr %t, !811, !DIExpression(), !815)
    #dbg_declare(ptr %y, !816, !DIExpression(), !817)
    #dbg_declare(ptr %salt, !818, !DIExpression(), !822)
    #dbg_declare(ptr %V, !823, !DIExpression(), !827)
    #dbg_declare(ptr %Vdec, !828, !DIExpression(), !832)
    #dbg_declare(ptr %A, !833, !DIExpression(), !837)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(4416) %A, i8 0, i32 4416, i1 false), !dbg !837
    #dbg_declare(ptr %x, !838, !DIExpression(), !842)
    #dbg_declare(ptr %r, !843, !DIExpression(), !847)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(69) %r, i8 0, i32 69, i1 false), !dbg !847
    #dbg_declare(ptr %s, !848, !DIExpression(), !849)
    #dbg_declare(ptr %sk, !850, !DIExpression(), !851)
    #dbg_declare(ptr %Ox, !852, !DIExpression(), !853)
    #dbg_declare(ptr %tmp, !854, !DIExpression(), !858)
    #dbg_value(i32 64, !859, !DIExpression(), !802)
    #dbg_value(i32 81, !860, !DIExpression(), !802)
    #dbg_value(i32 17, !861, !DIExpression(), !802)
    #dbg_value(i32 4, !862, !DIExpression(), !802)
    #dbg_value(i32 64, !863, !DIExpression(), !802)
    #dbg_value(i32 32, !864, !DIExpression(), !802)
    #dbg_value(i32 32, !865, !DIExpression(), !802)
    #dbg_value(i32 34, !866, !DIExpression(), !802)
    #dbg_value(i32 186, !867, !DIExpression(), !802)
    #dbg_value(i32 69, !868, !DIExpression(), !802)
    #dbg_value(i32 32, !869, !DIExpression(), !802)
    #dbg_value(i32 24, !870, !DIExpression(), !802)
    #dbg_value(i32 24, !871, !DIExpression(), !802)
  %call = call i32 @pqmayo_MAYO_2_ref_mayo_expand_sk(ptr noundef %p, ptr noundef %csk, ptr noundef nonnull %sk) #6, !dbg !872
    #dbg_value(i32 %call, !808, !DIExpression(), !802)
  %cmp.not = icmp eq i32 %call, 0, !dbg !873
  br i1 %cmp.not, label %if.end, label %err, !dbg !873

if.end:                                           ; preds = %entry
    #dbg_value(ptr %csk, !875, !DIExpression(), !802)
  %call1 = call i32 @shake256(ptr noundef nonnull %tmp, i32 noundef 32, ptr noundef %m, i32 noundef %mlen) #8, !dbg !876
    #dbg_value(ptr %sk, !877, !DIExpression(), !802)
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 66560, !dbg !878
    #dbg_value(ptr %add.ptr, !879, !DIExpression(), !802)
    #dbg_declare(ptr %Mtmp, !880, !DIExpression(), !884)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(2176) %Mtmp, i8 0, i32 2176, i1 false), !dbg !884
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %tmp, i32 32, !dbg !885
  %call6 = call i32 @randombytes(ptr noundef nonnull %add.ptr5, i32 noundef 24) #8, !dbg !887
  %cmp7.not = icmp eq i32 %call6, 0, !dbg !888
  br i1 %cmp7.not, label %if.end9, label %err, !dbg !888

if.end9:                                          ; preds = %if.end
  %add.ptr12 = getelementptr inbounds nuw i8, ptr %tmp, i32 56, !dbg !889
  %call13 = call ptr @memcpy(ptr noundef nonnull %add.ptr12, ptr noundef %csk, i32 noundef 24) #8, !dbg !890
  %call16 = call i32 @shake256(ptr noundef nonnull %salt, i32 noundef 24, ptr noundef nonnull %tmp, i32 noundef 80) #8, !dbg !891
  %add.ptr18 = getelementptr inbounds nuw i8, ptr %tmp, i32 32, !dbg !892
  %call20 = call ptr @memcpy(ptr noundef nonnull %add.ptr18, ptr noundef nonnull %salt, i32 noundef 24) #8, !dbg !893
  %add.ptr24 = getelementptr inbounds nuw i8, ptr %tmp, i32 80, !dbg !894
    #dbg_value(ptr %add.ptr24, !895, !DIExpression(), !802)
  %call27 = call i32 @shake256(ptr noundef nonnull %tenc, i32 noundef 32, ptr noundef nonnull %tmp, i32 noundef 56) #8, !dbg !896
  call fastcc void @decode(ptr noundef nonnull %tenc, ptr noundef nonnull %t, i32 noundef 64) #6, !dbg !897
    #dbg_value(i32 0, !898, !DIExpression(), !900)
  %add.ptr61 = getelementptr inbounds nuw i8, ptr %V, i32 128, !dbg !901
  br label %for.cond, !dbg !904

for.cond:                                         ; preds = %if.else, %if.end9
  %ctr.0 = phi i32 [ 0, %if.end9 ], [ %inc75, %if.else ], !dbg !905
    #dbg_value(i32 %ctr.0, !898, !DIExpression(), !900)
  %exitcond2.not = icmp eq i32 %ctr.0, 256, !dbg !906
  br i1 %exitcond2.not, label %for.end76, label %for.body, !dbg !907

for.body:                                         ; preds = %for.cond
  %conv = trunc nuw i32 %ctr.0 to i8, !dbg !908
  store i8 %conv, ptr %add.ptr24, align 1, !dbg !909
  %call33 = call i32 @shake256(ptr noundef nonnull %V, i32 noundef 162, ptr noundef nonnull %tmp, i32 noundef 81) #8, !dbg !910
    #dbg_value(i32 0, !911, !DIExpression(), !913)
    #dbg_value(i32 0, !911, !DIExpression(), !913)
  call fastcc void @decode(ptr noundef nonnull %V, ptr noundef nonnull %Vdec, i32 noundef 64) #6, !dbg !914
    #dbg_value(i32 1, !911, !DIExpression(), !913)
  %add.ptr39.1 = getelementptr inbounds nuw i8, ptr %V, i32 32, !dbg !917
  %add.ptr42.1 = getelementptr inbounds nuw i8, ptr %Vdec, i32 64, !dbg !918
  call fastcc void @decode(ptr noundef nonnull %add.ptr39.1, ptr noundef nonnull %add.ptr42.1, i32 noundef 64) #6, !dbg !914
    #dbg_value(i32 2, !911, !DIExpression(), !913)
  %add.ptr39.2 = getelementptr inbounds nuw i8, ptr %V, i32 64, !dbg !917
  %add.ptr42.2 = getelementptr inbounds nuw i8, ptr %Vdec, i32 128, !dbg !918
  call fastcc void @decode(ptr noundef nonnull %add.ptr39.2, ptr noundef nonnull %add.ptr42.2, i32 noundef 64) #6, !dbg !914
    #dbg_value(i32 3, !911, !DIExpression(), !913)
  %add.ptr39.3 = getelementptr inbounds nuw i8, ptr %V, i32 96, !dbg !917
  %add.ptr42.3 = getelementptr inbounds nuw i8, ptr %Vdec, i32 192, !dbg !918
  call fastcc void @decode(ptr noundef nonnull %add.ptr39.3, ptr noundef nonnull %add.ptr42.3, i32 noundef 64) #6, !dbg !914
    #dbg_value(i32 4, !911, !DIExpression(), !913)
  call fastcc void @compute_M_and_VPV(ptr noundef %p, ptr noundef nonnull %Vdec, ptr noundef nonnull %add.ptr, ptr noundef nonnull %sk, ptr noundef nonnull %Mtmp, ptr noundef nonnull %A) #6, !dbg !919
  call fastcc void @compute_rhs(ptr noundef %p, ptr noundef nonnull %A, ptr noundef nonnull %t, ptr noundef nonnull %y) #6, !dbg !920
  call fastcc void @compute_A(ptr noundef %p, ptr noundef nonnull %Mtmp, ptr noundef nonnull %A) #6, !dbg !921
    #dbg_value(i32 0, !922, !DIExpression(), !924)
  br label %for.cond52, !dbg !925

for.cond52:                                       ; preds = %for.body55.12, %for.body
  %i51.0 = phi i32 [ 0, %for.body ], [ %inc58.12, %for.body55.12 ], !dbg !926
    #dbg_value(i32 %i51.0, !922, !DIExpression(), !924)
  %0 = mul nuw nsw i32 %i51.0, 69, !dbg !927
  %sub = add nuw nsw i32 %0, 68, !dbg !930
  %arrayidx = getelementptr inbounds nuw [4416 x i8], ptr %A, i32 0, i32 %sub, !dbg !931
  store i8 0, ptr %arrayidx, align 1, !dbg !932
    #dbg_value(i32 %i51.0, !922, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !924)
    #dbg_value(i32 %i51.0, !922, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !924)
  %1 = mul nuw i32 %i51.0, 69, !dbg !927
  %sub.1 = add nuw i32 %1, 137, !dbg !930
  %arrayidx.1 = getelementptr inbounds nuw [4416 x i8], ptr %A, i32 0, i32 %sub.1, !dbg !931
  store i8 0, ptr %arrayidx.1, align 1, !dbg !932
    #dbg_value(i32 %i51.0, !922, !DIExpression(DW_OP_plus_uconst, 2, DW_OP_stack_value), !924)
    #dbg_value(i32 %i51.0, !922, !DIExpression(DW_OP_plus_uconst, 2, DW_OP_stack_value), !924)
  %2 = mul nuw i32 %i51.0, 69, !dbg !927
  %sub.2 = add nuw i32 %2, 206, !dbg !930
  %arrayidx.2 = getelementptr inbounds nuw [4416 x i8], ptr %A, i32 0, i32 %sub.2, !dbg !931
  store i8 0, ptr %arrayidx.2, align 1, !dbg !932
    #dbg_value(i32 %i51.0, !922, !DIExpression(DW_OP_plus_uconst, 3, DW_OP_stack_value), !924)
    #dbg_value(i32 %i51.0, !922, !DIExpression(DW_OP_plus_uconst, 3, DW_OP_stack_value), !924)
  %3 = mul nuw i32 %i51.0, 69, !dbg !927
  %sub.3 = add nuw i32 %3, 275, !dbg !930
  %arrayidx.3 = getelementptr inbounds nuw [4416 x i8], ptr %A, i32 0, i32 %sub.3, !dbg !931
  store i8 0, ptr %arrayidx.3, align 1, !dbg !932
    #dbg_value(i32 %i51.0, !922, !DIExpression(DW_OP_plus_uconst, 4, DW_OP_stack_value), !924)
    #dbg_value(i32 %i51.0, !922, !DIExpression(DW_OP_plus_uconst, 4, DW_OP_stack_value), !924)
  %4 = mul nuw i32 %i51.0, 69, !dbg !927
  %sub.4 = add nuw i32 %4, 344, !dbg !930
  %arrayidx.4 = getelementptr inbounds nuw [4416 x i8], ptr %A, i32 0, i32 %sub.4, !dbg !931
  store i8 0, ptr %arrayidx.4, align 1, !dbg !932
    #dbg_value(i32 %i51.0, !922, !DIExpression(DW_OP_plus_uconst, 5, DW_OP_stack_value), !924)
    #dbg_value(i32 %i51.0, !922, !DIExpression(DW_OP_plus_uconst, 5, DW_OP_stack_value), !924)
  %5 = mul nuw i32 %i51.0, 69, !dbg !927
  %sub.5 = add nuw i32 %5, 413, !dbg !930
  %arrayidx.5 = getelementptr inbounds nuw [4416 x i8], ptr %A, i32 0, i32 %sub.5, !dbg !931
  store i8 0, ptr %arrayidx.5, align 1, !dbg !932
    #dbg_value(i32 %i51.0, !922, !DIExpression(DW_OP_plus_uconst, 6, DW_OP_stack_value), !924)
    #dbg_value(i32 %i51.0, !922, !DIExpression(DW_OP_plus_uconst, 6, DW_OP_stack_value), !924)
  %6 = mul nuw i32 %i51.0, 69, !dbg !927
  %sub.6 = add nuw i32 %6, 482, !dbg !930
  %arrayidx.6 = getelementptr inbounds nuw [4416 x i8], ptr %A, i32 0, i32 %sub.6, !dbg !931
  store i8 0, ptr %arrayidx.6, align 1, !dbg !932
    #dbg_value(i32 %i51.0, !922, !DIExpression(DW_OP_plus_uconst, 7, DW_OP_stack_value), !924)
    #dbg_value(i32 %i51.0, !922, !DIExpression(DW_OP_plus_uconst, 7, DW_OP_stack_value), !924)
  %7 = mul nuw i32 %i51.0, 69, !dbg !927
  %sub.7 = add nuw i32 %7, 551, !dbg !930
  %arrayidx.7 = getelementptr inbounds nuw [4416 x i8], ptr %A, i32 0, i32 %sub.7, !dbg !931
  store i8 0, ptr %arrayidx.7, align 1, !dbg !932
    #dbg_value(i32 %i51.0, !922, !DIExpression(DW_OP_plus_uconst, 8, DW_OP_stack_value), !924)
    #dbg_value(i32 %i51.0, !922, !DIExpression(DW_OP_plus_uconst, 8, DW_OP_stack_value), !924)
  %8 = mul nuw i32 %i51.0, 69, !dbg !927
  %sub.8 = add nuw i32 %8, 620, !dbg !930
  %arrayidx.8 = getelementptr inbounds nuw [4416 x i8], ptr %A, i32 0, i32 %sub.8, !dbg !931
  store i8 0, ptr %arrayidx.8, align 1, !dbg !932
    #dbg_value(i32 %i51.0, !922, !DIExpression(DW_OP_plus_uconst, 9, DW_OP_stack_value), !924)
    #dbg_value(i32 %i51.0, !922, !DIExpression(DW_OP_plus_uconst, 9, DW_OP_stack_value), !924)
  %9 = mul nuw i32 %i51.0, 69, !dbg !927
  %sub.9 = add nuw i32 %9, 689, !dbg !930
  %arrayidx.9 = getelementptr inbounds nuw [4416 x i8], ptr %A, i32 0, i32 %sub.9, !dbg !931
  store i8 0, ptr %arrayidx.9, align 1, !dbg !932
    #dbg_value(i32 %i51.0, !922, !DIExpression(DW_OP_plus_uconst, 10, DW_OP_stack_value), !924)
    #dbg_value(i32 %i51.0, !922, !DIExpression(DW_OP_plus_uconst, 10, DW_OP_stack_value), !924)
  %10 = mul nuw i32 %i51.0, 69, !dbg !927
  %sub.10 = add nuw i32 %10, 758, !dbg !930
  %arrayidx.10 = getelementptr inbounds nuw [4416 x i8], ptr %A, i32 0, i32 %sub.10, !dbg !931
  store i8 0, ptr %arrayidx.10, align 1, !dbg !932
    #dbg_value(i32 %i51.0, !922, !DIExpression(DW_OP_plus_uconst, 11, DW_OP_stack_value), !924)
    #dbg_value(i32 %i51.0, !922, !DIExpression(DW_OP_plus_uconst, 11, DW_OP_stack_value), !924)
  %11 = mul nuw i32 %i51.0, 69, !dbg !927
  %sub.11 = add nuw i32 %11, 827, !dbg !930
  %arrayidx.11 = getelementptr inbounds nuw [4416 x i8], ptr %A, i32 0, i32 %sub.11, !dbg !931
  store i8 0, ptr %arrayidx.11, align 1, !dbg !932
  %inc58.11 = add nuw nsw i32 %i51.0, 12, !dbg !933
    #dbg_value(i32 %inc58.11, !922, !DIExpression(), !924)
  %exitcond1.12.not = icmp eq i32 %inc58.11, 64, !dbg !934
  br i1 %exitcond1.12.not, label %for.end59, label %for.body55.12, !dbg !935

for.body55.12:                                    ; preds = %for.cond52
  %12 = mul nuw nsw i32 %inc58.11, 69, !dbg !927
  %sub.12 = add nuw nsw i32 %12, 68, !dbg !930
  %arrayidx.12 = getelementptr inbounds nuw [4416 x i8], ptr %A, i32 0, i32 %sub.12, !dbg !931
  store i8 0, ptr %arrayidx.12, align 1, !dbg !932
  %inc58.12 = add nuw nsw i32 %i51.0, 13, !dbg !933
    #dbg_value(i32 %inc58.12, !922, !DIExpression(), !924)
  br label %for.cond52, !dbg !936, !llvm.loop !937

for.end59:                                        ; preds = %for.cond52
  call fastcc void @decode(ptr noundef nonnull %add.ptr61, ptr noundef nonnull %r, i32 noundef 68) #6, !dbg !939
  %call67 = call i32 @pqmayo_MAYO_2_ref_sample_solution(ptr noundef %p, ptr noundef nonnull %A, ptr noundef nonnull %y, ptr noundef nonnull %r, ptr noundef nonnull %x, i32 noundef 4, i32 noundef 17, i32 noundef 64, i32 noundef 69) #6, !dbg !940
  %tobool.not = icmp eq i32 %call67, 0, !dbg !940
  br i1 %tobool.not, label %if.else, label %for.end76, !dbg !940

if.else:                                          ; preds = %for.end59
  %call70 = call ptr @memset(ptr noundef nonnull %Mtmp, i32 noundef 0, i32 noundef 2176) #8, !dbg !942
  %call72 = call ptr @memset(ptr noundef nonnull %A, i32 noundef 0, i32 noundef 4416) #8, !dbg !944
  %inc75 = add nuw nsw i32 %ctr.0, 1, !dbg !945
    #dbg_value(i32 %inc75, !898, !DIExpression(), !900)
  br label %for.cond, !dbg !946, !llvm.loop !947

for.end76:                                        ; preds = %for.end59, %for.cond
    #dbg_value(i32 0, !949, !DIExpression(), !951)
  br label %for.cond78, !dbg !952

for.cond78:                                       ; preds = %for.body81, %for.end76
  %i77.0 = phi i32 [ 0, %for.end76 ], [ %inc103, %for.body81 ], !dbg !953
    #dbg_value(i32 %i77.0, !949, !DIExpression(), !951)
  %exitcond3.not = icmp eq i32 %i77.0, 4, !dbg !954
  br i1 %exitcond3.not, label %for.end104, label %for.body81, !dbg !956

for.body81:                                       ; preds = %for.cond78
  %mul83 = shl nuw nsw i32 %i77.0, 6, !dbg !957
  %add.ptr84 = getelementptr inbounds nuw i8, ptr %Vdec, i32 %mul83, !dbg !959
    #dbg_value(ptr %add.ptr84, !960, !DIExpression(), !802)
  %O = getelementptr inbounds nuw i8, ptr %sk, i32 101376, !dbg !961
  %mul87 = mul nuw nsw i32 %i77.0, 17, !dbg !962
  %add.ptr88 = getelementptr inbounds nuw i8, ptr %x, i32 %mul87, !dbg !963
  call fastcc void @mat_mul(ptr noundef nonnull %O, ptr noundef nonnull %add.ptr88, ptr noundef nonnull %Ox, i32 noundef 17, i32 noundef 64, i32 noundef 1) #6, !dbg !964
  %mul92 = mul nuw nsw i32 %i77.0, 81, !dbg !965
  %add.ptr93 = getelementptr inbounds nuw i8, ptr %s, i32 %mul92, !dbg !966
  call fastcc void @mat_add(ptr noundef nonnull %add.ptr84, ptr noundef nonnull %Ox, ptr noundef nonnull %add.ptr93, i32 noundef 64, i32 noundef 1) #6, !dbg !967
  %mul95 = mul nuw nsw i32 %i77.0, 81, !dbg !968
  %add.ptr96 = getelementptr inbounds nuw i8, ptr %s, i32 %mul95, !dbg !969
  %add.ptr97 = getelementptr inbounds nuw i8, ptr %add.ptr96, i32 64, !dbg !970
  %mul99 = mul nuw nsw i32 %i77.0, 17, !dbg !971
  %add.ptr100 = getelementptr inbounds nuw i8, ptr %x, i32 %mul99, !dbg !972
  %call101 = call ptr @memcpy(ptr noundef nonnull %add.ptr97, ptr noundef nonnull %add.ptr100, i32 noundef 17) #8, !dbg !973
  %inc103 = add nuw nsw i32 %i77.0, 1, !dbg !974
    #dbg_value(i32 %inc103, !949, !DIExpression(), !951)
  br label %for.cond78, !dbg !975, !llvm.loop !976

for.end104:                                       ; preds = %for.cond78
  call fastcc void @encode(ptr noundef nonnull %s, ptr noundef %sig, i32 noundef 324) #6, !dbg !978
  %add.ptr107 = getelementptr inbounds nuw i8, ptr %sig, i32 162, !dbg !979
  %call109 = call ptr @memcpy(ptr noundef nonnull %add.ptr107, ptr noundef nonnull %salt, i32 noundef 24) #8, !dbg !980
  store i32 186, ptr %siglen, align 4, !dbg !981
  br label %err, !dbg !982

err:                                              ; preds = %if.end, %entry, %for.end104
  %ret.0 = phi i32 [ %call, %for.end104 ], [ %call, %entry ], [ 1, %if.end ], !dbg !802
    #dbg_value(i32 %ret.0, !808, !DIExpression(), !802)
    #dbg_label(!983, !984)
  call void @mayo_secure_clear(ptr noundef nonnull %V, i32 noundef 162) #8, !dbg !985
  call void @mayo_secure_clear(ptr noundef nonnull %Vdec, i32 noundef 256) #8, !dbg !986
  call void @mayo_secure_clear(ptr noundef nonnull %A, i32 noundef 4416) #8, !dbg !987
  call void @mayo_secure_clear(ptr noundef nonnull %r, i32 noundef 69) #8, !dbg !988
  %O114 = getelementptr inbounds nuw i8, ptr %sk, i32 101376, !dbg !989
  call void @mayo_secure_clear(ptr noundef nonnull %O114, i32 noundef 1088) #8, !dbg !990
  call void @mayo_secure_clear(ptr noundef nonnull %sk, i32 noundef 102464) #8, !dbg !991
  call void @mayo_secure_clear(ptr noundef nonnull %Ox, i32 noundef 64) #8, !dbg !992
  call void @mayo_secure_clear(ptr noundef nonnull %tmp, i32 noundef 81) #8, !dbg !993
  call void @mayo_secure_clear(ptr noundef nonnull %Mtmp, i32 noundef 2176) #8, !dbg !994
  ret i32 %ret.0, !dbg !995
}

; Function Attrs: nounwind
define internal fastcc void @compute_M_and_VPV(ptr noundef %p, ptr noundef %Vdec, ptr noundef %L, ptr noundef %P1, ptr noundef %VL, ptr noundef %VP1V) unnamed_addr #0 !dbg !996 {
entry:
  %Pv = alloca [1024 x i64], align 8
    #dbg_value(ptr %p, !999, !DIExpression(), !1000)
    #dbg_value(ptr %Vdec, !1001, !DIExpression(), !1000)
    #dbg_value(ptr %L, !1002, !DIExpression(), !1000)
    #dbg_value(ptr %P1, !1003, !DIExpression(), !1000)
    #dbg_value(ptr %VL, !1004, !DIExpression(), !1000)
    #dbg_value(ptr %VP1V, !1005, !DIExpression(), !1000)
    #dbg_value(i32 4, !1006, !DIExpression(), !1000)
    #dbg_value(i32 64, !1007, !DIExpression(), !1000)
    #dbg_value(i32 17, !1008, !DIExpression(), !1000)
  call fastcc void @mul_add_mat_x_m_mat(i32 noundef 4, ptr noundef %Vdec, ptr noundef %L, ptr noundef %VL, i32 noundef 4, i32 noundef 64, i32 noundef 17) #6, !dbg !1009
    #dbg_declare(ptr %Pv, !1010, !DIExpression(), !1014)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(8192) %Pv, i8 0, i32 8192, i1 false), !dbg !1014
  call fastcc void @P1_times_Vt(ptr noundef %p, ptr noundef %P1, ptr noundef %Vdec, ptr noundef nonnull %Pv) #6, !dbg !1015
  call fastcc void @mul_add_mat_x_m_mat(i32 noundef 4, ptr noundef %Vdec, ptr noundef nonnull %Pv, ptr noundef %VP1V, i32 noundef 4, i32 noundef 64, i32 noundef 4) #6, !dbg !1016
  ret void, !dbg !1017
}

; Function Attrs: nounwind
define internal fastcc void @compute_rhs(ptr noundef %p, ptr noundef %vPv, ptr noundef %t, ptr noundef %y) unnamed_addr #0 !dbg !1018 {
entry:
  %temp = alloca [4 x i64], align 8
    #dbg_value(ptr %p, !1021, !DIExpression(), !1022)
    #dbg_value(ptr %vPv, !1023, !DIExpression(), !1022)
    #dbg_value(ptr %t, !1024, !DIExpression(), !1022)
    #dbg_value(ptr %y, !1025, !DIExpression(), !1022)
    #dbg_value(i32 60, !1026, !DIExpression(), !1022)
    #dbg_value(i32 4, !1028, !DIExpression(), !1022)
    #dbg_declare(ptr %temp, !1029, !DIExpression(), !1030)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(32) %temp, i8 0, i32 32, i1 false), !dbg !1030
    #dbg_value(ptr %temp, !1031, !DIExpression(), !1022)
    #dbg_value(i32 3, !1032, !DIExpression(), !1034)
  br label %for.cond, !dbg !1035

for.cond:                                         ; preds = %for.inc65, %entry
  %i.0 = phi i32 [ 3, %entry ], [ %dec66, %for.inc65 ], !dbg !1036
    #dbg_value(i32 %i.0, !1032, !DIExpression(), !1034)
  %cmp = icmp sgt i32 %i.0, -1, !dbg !1037
  br i1 %cmp, label %for.cond1, label %for.cond69, !dbg !1039

for.cond1:                                        ; preds = %for.cond, %for.body3
  %j.0 = phi i32 [ %inc63, %for.body3 ], [ %i.0, %for.cond ], !dbg !1040
    #dbg_value(i32 %j.0, !1043, !DIExpression(), !1044)
  %exitcond6.not = icmp eq i32 %j.0, 4, !dbg !1045
  br i1 %exitcond6.not, label %for.inc65, label %for.body3, !dbg !1047

for.body3:                                        ; preds = %for.cond1
  %arrayidx = getelementptr inbounds nuw i8, ptr %temp, i32 24, !dbg !1048
  %0 = load i64, ptr %arrayidx, align 8, !dbg !1048
  %shr = lshr i64 %0, 60, !dbg !1050
    #dbg_value(i8 %conv, !1051, !DIExpression(), !1052)
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %temp, i32 24, !dbg !1053
  %shl = shl i64 %0, 4, !dbg !1054
  store i64 %shl, ptr %arrayidx4, align 8, !dbg !1054
    #dbg_value(i32 2, !1055, !DIExpression(), !1057)
    #dbg_value(i32 2, !1055, !DIExpression(), !1057)
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %temp, i32 16, !dbg !1058
  %1 = load i64, ptr %arrayidx9, align 8, !dbg !1058
  %shr10 = lshr i64 %1, 60, !dbg !1061
  %arrayidx11 = getelementptr inbounds nuw i8, ptr %temp, i32 24, !dbg !1062
  %2 = load i64, ptr %arrayidx11, align 8, !dbg !1063
  %xor = xor i64 %2, %shr10, !dbg !1063
  store i64 %xor, ptr %arrayidx11, align 8, !dbg !1063
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %temp, i32 16, !dbg !1064
  %3 = load i64, ptr %arrayidx12, align 8, !dbg !1065
  %shl13 = shl i64 %3, 4, !dbg !1065
  store i64 %shl13, ptr %arrayidx12, align 8, !dbg !1065
    #dbg_value(i32 1, !1055, !DIExpression(), !1057)
  %arrayidx9.1 = getelementptr inbounds nuw i8, ptr %temp, i32 8, !dbg !1058
  %4 = load i64, ptr %arrayidx9.1, align 8, !dbg !1058
  %shr10.1 = lshr i64 %4, 60, !dbg !1061
  %arrayidx11.1 = getelementptr inbounds nuw i8, ptr %temp, i32 16, !dbg !1062
  %5 = load i64, ptr %arrayidx11.1, align 8, !dbg !1063
  %xor.1 = xor i64 %5, %shr10.1, !dbg !1063
  store i64 %xor.1, ptr %arrayidx11.1, align 8, !dbg !1063
  %arrayidx12.1 = getelementptr inbounds nuw i8, ptr %temp, i32 8, !dbg !1064
  %6 = load i64, ptr %arrayidx12.1, align 8, !dbg !1065
  %shl13.1 = shl i64 %6, 4, !dbg !1065
  store i64 %shl13.1, ptr %arrayidx12.1, align 8, !dbg !1065
    #dbg_value(i32 0, !1055, !DIExpression(), !1057)
  %7 = load i64, ptr %temp, align 8, !dbg !1058
  %shr10.2 = lshr i64 %7, 60, !dbg !1061
  %arrayidx11.2 = getelementptr inbounds nuw i8, ptr %temp, i32 8, !dbg !1062
  %8 = load i64, ptr %arrayidx11.2, align 8, !dbg !1063
  %xor.2 = xor i64 %8, %shr10.2, !dbg !1063
  store i64 %xor.2, ptr %arrayidx11.2, align 8, !dbg !1063
  %shl13.2 = shl i64 %7, 4, !dbg !1065
  store i64 %shl13.2, ptr %temp, align 8, !dbg !1065
    #dbg_value(i32 -1, !1055, !DIExpression(), !1057)
  %conv = trunc nuw nsw i64 %shr to i8, !dbg !1066
    #dbg_value(i32 0, !1067, !DIExpression(), !1069)
  %call = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %conv, i8 noundef zeroext 8) #6, !dbg !1070
  %9 = load i8, ptr %temp, align 1, !dbg !1075
  %xor254 = xor i8 %9, %call, !dbg !1075
  store i8 %xor254, ptr %temp, align 1, !dbg !1075
    #dbg_value(i32 1, !1067, !DIExpression(), !1069)
  %call28.1 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %conv, i8 noundef zeroext 0) #6, !dbg !1076
  %shl30.1 = shl nuw i8 %call28.1, 4, !dbg !1078
  %10 = load i8, ptr %temp, align 1, !dbg !1079
  %xor34.1 = xor i8 %shl30.1, %10, !dbg !1079
  store i8 %xor34.1, ptr %temp, align 1, !dbg !1079
    #dbg_value(i32 2, !1067, !DIExpression(), !1069)
  %call.2 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %conv, i8 noundef zeroext 2) #6, !dbg !1070
  %arrayidx23.2 = getelementptr inbounds nuw i8, ptr %temp, i32 1, !dbg !1080
  %11 = load i8, ptr %arrayidx23.2, align 1, !dbg !1075
  %xor254.2 = xor i8 %11, %call.2, !dbg !1075
  store i8 %xor254.2, ptr %arrayidx23.2, align 1, !dbg !1075
    #dbg_value(i32 3, !1067, !DIExpression(), !1069)
  %call28.3 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %conv, i8 noundef zeroext 8) #6, !dbg !1076
  %shl30.3 = shl nuw i8 %call28.3, 4, !dbg !1078
  %arrayidx32.3 = getelementptr inbounds nuw i8, ptr %temp, i32 1, !dbg !1081
  %12 = load i8, ptr %arrayidx32.3, align 1, !dbg !1079
  %xor34.3 = xor i8 %shl30.3, %12, !dbg !1079
  store i8 %xor34.3, ptr %arrayidx32.3, align 1, !dbg !1079
    #dbg_value(i32 4, !1067, !DIExpression(), !1069)
    #dbg_value(i32 0, !1082, !DIExpression(), !1084)
  %.idx = shl i32 %i.0, 7, !dbg !1085
  %13 = getelementptr i8, ptr %vPv, i32 %.idx, !dbg !1085
  %arrayidx46.idx = shl i32 %j.0, 5, !dbg !1085
  %arrayidx46 = getelementptr i8, ptr %13, i32 %arrayidx46.idx, !dbg !1085
  %14 = load i64, ptr %arrayidx46, align 8, !dbg !1085
  %cmp47.not = icmp eq i32 %i.0, %j.0, !dbg !1088
  %.idx13 = shl i32 %j.0, 7, !dbg !1089
  %15 = getelementptr i8, ptr %vPv, i32 %.idx13, !dbg !1089
  %arrayidx54.idx = shl i32 %i.0, 5, !dbg !1089
  %arrayidx54 = getelementptr i8, ptr %15, i32 %arrayidx54.idx, !dbg !1089
  %16 = load i64, ptr %arrayidx54, align 8, !dbg !1089
  %mul55 = select i1 %cmp47.not, i64 0, i64 %16, !dbg !1090
  %xor56 = xor i64 %14, %mul55, !dbg !1091
  %17 = load i64, ptr %temp, align 8, !dbg !1092
  %xor58 = xor i64 %17, %xor56, !dbg !1092
  store i64 %xor58, ptr %temp, align 8, !dbg !1092
    #dbg_value(i32 1, !1082, !DIExpression(), !1084)
  %18 = shl i32 %i.0, 4, !dbg !1093
  %19 = shl i32 %j.0, 2, !dbg !1093
  %mul44.1 = add nsw i32 %18, %19, !dbg !1093
  %add45.1 = or disjoint i32 %mul44.1, 1, !dbg !1094
  %arrayidx46.1 = getelementptr inbounds nuw i64, ptr %vPv, i32 %add45.1, !dbg !1085
  %20 = load i64, ptr %arrayidx46.1, align 8, !dbg !1085
  %cmp47.not.1 = icmp eq i32 %i.0, %j.0, !dbg !1088
  %21 = shl i32 %j.0, 4, !dbg !1095
  %22 = shl i32 %i.0, 2, !dbg !1095
  %mul52.1 = add nsw i32 %21, %22, !dbg !1095
  %add53.1 = or disjoint i32 %mul52.1, 1, !dbg !1096
  %arrayidx54.1 = getelementptr inbounds nuw i64, ptr %vPv, i32 %add53.1, !dbg !1089
  %23 = load i64, ptr %arrayidx54.1, align 8, !dbg !1089
  %mul55.1 = select i1 %cmp47.not.1, i64 0, i64 %23, !dbg !1090
  %xor56.1 = xor i64 %20, %mul55.1, !dbg !1091
  %arrayidx57.1 = getelementptr inbounds nuw i8, ptr %temp, i32 8, !dbg !1097
  %24 = load i64, ptr %arrayidx57.1, align 8, !dbg !1092
  %xor58.1 = xor i64 %24, %xor56.1, !dbg !1092
  store i64 %xor58.1, ptr %arrayidx57.1, align 8, !dbg !1092
    #dbg_value(i32 2, !1082, !DIExpression(), !1084)
  %25 = shl i32 %i.0, 4, !dbg !1093
  %26 = shl i32 %j.0, 2, !dbg !1093
  %mul44.2 = add nsw i32 %25, %26, !dbg !1093
  %add45.2 = or disjoint i32 %mul44.2, 2, !dbg !1094
  %arrayidx46.2 = getelementptr inbounds nuw i64, ptr %vPv, i32 %add45.2, !dbg !1085
  %27 = load i64, ptr %arrayidx46.2, align 8, !dbg !1085
  %cmp47.not.2 = icmp eq i32 %i.0, %j.0, !dbg !1088
  %28 = shl i32 %j.0, 4, !dbg !1095
  %29 = shl i32 %i.0, 2, !dbg !1095
  %mul52.2 = add nsw i32 %28, %29, !dbg !1095
  %add53.2 = or disjoint i32 %mul52.2, 2, !dbg !1096
  %arrayidx54.2 = getelementptr inbounds nuw i64, ptr %vPv, i32 %add53.2, !dbg !1089
  %30 = load i64, ptr %arrayidx54.2, align 8, !dbg !1089
  %mul55.2 = select i1 %cmp47.not.2, i64 0, i64 %30, !dbg !1090
  %xor56.2 = xor i64 %27, %mul55.2, !dbg !1091
  %arrayidx57.2 = getelementptr inbounds nuw i8, ptr %temp, i32 16, !dbg !1097
  %31 = load i64, ptr %arrayidx57.2, align 8, !dbg !1092
  %xor58.2 = xor i64 %31, %xor56.2, !dbg !1092
  store i64 %xor58.2, ptr %arrayidx57.2, align 8, !dbg !1092
    #dbg_value(i32 3, !1082, !DIExpression(), !1084)
  %32 = shl i32 %i.0, 4, !dbg !1093
  %33 = shl i32 %j.0, 2, !dbg !1093
  %mul44.3 = add nsw i32 %32, %33, !dbg !1093
  %add45.3 = or disjoint i32 %mul44.3, 3, !dbg !1094
  %arrayidx46.3 = getelementptr inbounds nuw i64, ptr %vPv, i32 %add45.3, !dbg !1085
  %34 = load i64, ptr %arrayidx46.3, align 8, !dbg !1085
  %cmp47.not.3 = icmp eq i32 %i.0, %j.0, !dbg !1088
  %35 = shl i32 %j.0, 4, !dbg !1095
  %36 = shl i32 %i.0, 2, !dbg !1095
  %mul52.3 = add nsw i32 %35, %36, !dbg !1095
  %add53.3 = or disjoint i32 %mul52.3, 3, !dbg !1096
  %arrayidx54.3 = getelementptr inbounds nuw i64, ptr %vPv, i32 %add53.3, !dbg !1089
  %37 = load i64, ptr %arrayidx54.3, align 8, !dbg !1089
  %mul55.3 = select i1 %cmp47.not.3, i64 0, i64 %37, !dbg !1090
  %xor56.3 = xor i64 %34, %mul55.3, !dbg !1091
  %arrayidx57.3 = getelementptr inbounds nuw i8, ptr %temp, i32 24, !dbg !1097
  %38 = load i64, ptr %arrayidx57.3, align 8, !dbg !1092
  %xor58.3 = xor i64 %38, %xor56.3, !dbg !1092
  store i64 %xor58.3, ptr %arrayidx57.3, align 8, !dbg !1092
    #dbg_value(i32 4, !1082, !DIExpression(), !1084)
  %inc63 = add nuw nsw i32 %j.0, 1, !dbg !1098
    #dbg_value(i32 %inc63, !1043, !DIExpression(), !1044)
  br label %for.cond1, !dbg !1099, !llvm.loop !1100

for.inc65:                                        ; preds = %for.cond1
  %dec66 = add nsw i32 %i.0, -1, !dbg !1102
    #dbg_value(i32 %dec66, !1032, !DIExpression(), !1034)
  br label %for.cond, !dbg !1103, !llvm.loop !1104

for.cond69:                                       ; preds = %for.cond, %for.body72.2
  %i68.0 = phi i32 [ %add93.2, %for.body72.2 ], [ 0, %for.cond ], !dbg !1106
    #dbg_value(i32 %i68.0, !1108, !DIExpression(), !1109)
  %arrayidx73 = getelementptr inbounds nuw i8, ptr %t, i32 %i68.0, !dbg !1110
  %39 = load i8, ptr %arrayidx73, align 1, !dbg !1110
  %div75 = lshr exact i32 %i68.0, 1, !dbg !1113
  %arrayidx76 = getelementptr inbounds nuw i8, ptr %temp, i32 %div75, !dbg !1114
  %40 = load i8, ptr %arrayidx76, align 1, !dbg !1114
  %41 = and i8 %40, 15, !dbg !1115
  %xor781 = xor i8 %39, %41, !dbg !1116
  %arrayidx80 = getelementptr inbounds nuw i8, ptr %y, i32 %i68.0, !dbg !1117
  store i8 %xor781, ptr %arrayidx80, align 1, !dbg !1118
  %add81 = or disjoint i32 %i68.0, 1, !dbg !1119
  %arrayidx82 = getelementptr inbounds nuw i8, ptr %t, i32 %add81, !dbg !1120
  %42 = load i8, ptr %arrayidx82, align 1, !dbg !1120
  %43 = lshr i8 %40, 4, !dbg !1121
  %xor882 = xor i8 %42, %43, !dbg !1122
  %add90 = or disjoint i32 %i68.0, 1, !dbg !1123
  %arrayidx91 = getelementptr inbounds nuw i8, ptr %y, i32 %add90, !dbg !1124
  store i8 %xor882, ptr %arrayidx91, align 1, !dbg !1125
    #dbg_value(i32 %i68.0, !1108, !DIExpression(DW_OP_plus_uconst, 2, DW_OP_stack_value), !1109)
  %add93 = add nuw nsw i32 %i68.0, 2, !dbg !1126
    #dbg_value(i32 %add93, !1108, !DIExpression(), !1109)
  %arrayidx73.1 = getelementptr inbounds nuw i8, ptr %t, i32 %add93, !dbg !1110
  %44 = load i8, ptr %arrayidx73.1, align 1, !dbg !1110
  %div75.1 = lshr exact i32 %add93, 1, !dbg !1113
  %arrayidx76.1 = getelementptr inbounds nuw i8, ptr %temp, i32 %div75.1, !dbg !1114
  %45 = load i8, ptr %arrayidx76.1, align 1, !dbg !1114
  %46 = and i8 %45, 15, !dbg !1115
  %xor781.1 = xor i8 %44, %46, !dbg !1116
  %arrayidx80.1 = getelementptr inbounds nuw i8, ptr %y, i32 %add93, !dbg !1117
  store i8 %xor781.1, ptr %arrayidx80.1, align 1, !dbg !1118
  %add81.1 = or disjoint i32 %add93, 1, !dbg !1119
  %arrayidx82.1 = getelementptr inbounds nuw i8, ptr %t, i32 %add81.1, !dbg !1120
  %47 = load i8, ptr %arrayidx82.1, align 1, !dbg !1120
  %48 = lshr i8 %45, 4, !dbg !1121
  %xor882.1 = xor i8 %47, %48, !dbg !1122
  %add90.1 = or disjoint i32 %add93, 1, !dbg !1123
  %arrayidx91.1 = getelementptr inbounds nuw i8, ptr %y, i32 %add90.1, !dbg !1124
  store i8 %xor882.1, ptr %arrayidx91.1, align 1, !dbg !1125
    #dbg_value(i32 %i68.0, !1108, !DIExpression(DW_OP_plus_uconst, 4, DW_OP_stack_value), !1109)
  %cmp70.2 = icmp samesign ult i32 %i68.0, 60, !dbg !1127
  br i1 %cmp70.2, label %for.body72.2, label %for.end94, !dbg !1128

for.body72.2:                                     ; preds = %for.cond69
  %add93.1 = add nuw nsw i32 %i68.0, 4, !dbg !1126
    #dbg_value(i32 %add93.1, !1108, !DIExpression(), !1109)
  %arrayidx73.2 = getelementptr inbounds nuw i8, ptr %t, i32 %add93.1, !dbg !1110
  %49 = load i8, ptr %arrayidx73.2, align 1, !dbg !1110
  %div75.2 = lshr exact i32 %add93.1, 1, !dbg !1113
  %arrayidx76.2 = getelementptr inbounds nuw i8, ptr %temp, i32 %div75.2, !dbg !1114
  %50 = load i8, ptr %arrayidx76.2, align 1, !dbg !1114
  %51 = and i8 %50, 15, !dbg !1115
  %xor781.2 = xor i8 %49, %51, !dbg !1116
  %arrayidx80.2 = getelementptr inbounds nuw i8, ptr %y, i32 %add93.1, !dbg !1117
  store i8 %xor781.2, ptr %arrayidx80.2, align 1, !dbg !1118
  %add81.2 = or disjoint i32 %add93.1, 1, !dbg !1119
  %arrayidx82.2 = getelementptr inbounds nuw i8, ptr %t, i32 %add81.2, !dbg !1120
  %52 = load i8, ptr %arrayidx82.2, align 1, !dbg !1120
  %53 = lshr i8 %50, 4, !dbg !1121
  %xor882.2 = xor i8 %52, %53, !dbg !1122
  %add90.2 = or disjoint i32 %add93.1, 1, !dbg !1123
  %arrayidx91.2 = getelementptr inbounds nuw i8, ptr %y, i32 %add90.2, !dbg !1124
  store i8 %xor882.2, ptr %arrayidx91.2, align 1, !dbg !1125
  %add93.2 = add nuw nsw i32 %i68.0, 6, !dbg !1126
    #dbg_value(i32 %add93.2, !1108, !DIExpression(), !1109)
  br label %for.cond69, !dbg !1129, !llvm.loop !1130

for.end94:                                        ; preds = %for.cond69
  ret void, !dbg !1132
}

; Function Attrs: nounwind
define internal fastcc void @compute_A(ptr noundef %p, ptr noundef %VtL, ptr noundef %A_out) unnamed_addr #0 !dbg !1133 {
entry:
  %A = alloca [640 x i64], align 8
  %tab = alloca [16 x i8], align 1
    #dbg_value(ptr %p, !1136, !DIExpression(), !1137)
    #dbg_value(ptr %VtL, !1138, !DIExpression(), !1137)
    #dbg_value(ptr %A_out, !1139, !DIExpression(), !1137)
    #dbg_value(i32 0, !1140, !DIExpression(), !1137)
    #dbg_value(i32 0, !1141, !DIExpression(), !1137)
    #dbg_value(i32 4, !1142, !DIExpression(), !1137)
    #dbg_declare(ptr %A, !1143, !DIExpression(), !1147)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(5120) %A, i8 0, i32 5120, i1 false), !dbg !1147
    #dbg_value(i32 80, !1148, !DIExpression(), !1137)
    #dbg_value(i32 0, !1149, !DIExpression(), !1151)
  br label %for.cond, !dbg !1152

for.cond:                                         ; preds = %for.inc90, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc91, %for.inc90 ], !dbg !1153
  %words_to_shift.0 = phi i32 [ 0, %entry ], [ %words_to_shift.1, %for.inc90 ], !dbg !1154
  %bits_to_shift.0 = phi i32 [ 0, %entry ], [ %bits_to_shift.1, %for.inc90 ], !dbg !1155
    #dbg_value(i32 %bits_to_shift.0, !1140, !DIExpression(), !1137)
    #dbg_value(i32 %words_to_shift.0, !1141, !DIExpression(), !1137)
    #dbg_value(i32 %i.0, !1149, !DIExpression(), !1151)
  %exitcond7.not = icmp eq i32 %i.0, 4, !dbg !1156
  br i1 %exitcond7.not, label %for.cond94, label %for.cond1, !dbg !1158

for.cond1:                                        ; preds = %for.cond, %if.end82
  %j.0 = phi i32 [ %dec, %if.end82 ], [ 3, %for.cond ], !dbg !1159
  %words_to_shift.1 = phi i32 [ %spec.select, %if.end82 ], [ %words_to_shift.0, %for.cond ], !dbg !1137
  %bits_to_shift.1 = phi i32 [ %spec.select3, %if.end82 ], [ %bits_to_shift.0, %for.cond ], !dbg !1137
    #dbg_value(i32 %bits_to_shift.1, !1140, !DIExpression(), !1137)
    #dbg_value(i32 %words_to_shift.1, !1141, !DIExpression(), !1137)
    #dbg_value(i32 %j.0, !1162, !DIExpression(), !1163)
  %cmp2.not = icmp slt i32 %j.0, %i.0, !dbg !1164
  br i1 %cmp2.not, label %for.inc90, label %for.body3, !dbg !1166

for.body3:                                        ; preds = %for.cond1
  %add.ptr.idx = mul nsw i32 %j.0, 544, !dbg !1167
  %add.ptr = getelementptr inbounds i8, ptr %VtL, i32 %add.ptr.idx, !dbg !1167
    #dbg_value(ptr %add.ptr, !1169, !DIExpression(), !1137)
    #dbg_value(i32 0, !1170, !DIExpression(), !1172)
  br label %for.cond5, !dbg !1173

for.cond5:                                        ; preds = %for.inc31, %for.body3
  %c.0 = phi i32 [ 0, %for.body3 ], [ %inc32, %for.inc31 ], !dbg !1174
    #dbg_value(i32 %c.0, !1170, !DIExpression(), !1172)
  %exitcond4.not = icmp eq i32 %c.0, 17, !dbg !1175
  br i1 %exitcond4.not, label %for.end33, label %for.body10, !dbg !1177

for.body10:                                       ; preds = %for.cond5
    #dbg_value(i32 0, !1178, !DIExpression(), !1181)
  %arrayidx.idx = shl nuw nsw i32 %c.0, 5, !dbg !1182
  %arrayidx = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %arrayidx.idx, !dbg !1182
  %0 = load i64, ptr %arrayidx, align 8, !dbg !1182
  %sh_prom = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1185
  %shl = shl i64 %0, %sh_prom, !dbg !1185
  %mul12 = mul nuw nsw i32 %i.0, 17, !dbg !1186
  %add13 = add nuw nsw i32 %mul12, %c.0, !dbg !1187
  %mul15 = mul i32 %words_to_shift.1, 80, !dbg !1188
  %add16 = add i32 %add13, %mul15, !dbg !1189
  %arrayidx17 = getelementptr inbounds nuw [640 x i64], ptr %A, i32 0, i32 %add16, !dbg !1190
  %1 = load i64, ptr %arrayidx17, align 8, !dbg !1191
  %xor = xor i64 %1, %shl, !dbg !1191
  store i64 %xor, ptr %arrayidx17, align 8, !dbg !1191
  %cmp18 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1192
  br i1 %cmp18, label %if.then, label %for.body10.1, !dbg !1192

if.then:                                          ; preds = %for.body10
  %arrayidx21.idx = shl nuw nsw i32 %c.0, 5, !dbg !1194
  %arrayidx21 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %arrayidx21.idx, !dbg !1194
  %2 = load i64, ptr %arrayidx21, align 8, !dbg !1194
  %sub = sub nsw i32 64, %bits_to_shift.1, !dbg !1196
  %sh_prom22 = zext nneg i32 %sub to i64, !dbg !1197
  %shr = lshr i64 %2, %sh_prom22, !dbg !1197
  %mul23 = mul nuw nsw i32 %i.0, 17, !dbg !1198
  %add24 = add nuw nsw i32 %mul23, %c.0, !dbg !1199
  %3 = mul i32 %words_to_shift.1, 80, !dbg !1200
  %mul27 = add i32 %3, 80, !dbg !1200
  %add28 = add i32 %add24, %mul27, !dbg !1201
  %arrayidx29 = getelementptr inbounds nuw [640 x i64], ptr %A, i32 0, i32 %add28, !dbg !1202
  %4 = load i64, ptr %arrayidx29, align 8, !dbg !1203
  %xor30 = xor i64 %4, %shr, !dbg !1203
  store i64 %xor30, ptr %arrayidx29, align 8, !dbg !1203
  br label %for.body10.1, !dbg !1204

for.body10.1:                                     ; preds = %if.then, %for.body10
    #dbg_value(i32 1, !1178, !DIExpression(), !1181)
  %mul11.1 = shl nuw nsw i32 %c.0, 2, !dbg !1205
  %add.1 = or disjoint i32 %mul11.1, 1, !dbg !1206
  %arrayidx.1 = getelementptr inbounds nuw i64, ptr %add.ptr, i32 %add.1, !dbg !1182
  %5 = load i64, ptr %arrayidx.1, align 8, !dbg !1182
  %sh_prom.1 = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1185
  %shl.1 = shl i64 %5, %sh_prom.1, !dbg !1185
  %mul12.1 = mul nuw nsw i32 %i.0, 17, !dbg !1186
  %add13.1 = add nuw nsw i32 %mul12.1, %c.0, !dbg !1187
  %6 = mul i32 %words_to_shift.1, 80, !dbg !1188
  %mul15.1 = add i32 %6, 80, !dbg !1188
  %add16.1 = add i32 %add13.1, %mul15.1, !dbg !1189
  %arrayidx17.1 = getelementptr inbounds nuw [640 x i64], ptr %A, i32 0, i32 %add16.1, !dbg !1190
  %7 = load i64, ptr %arrayidx17.1, align 8, !dbg !1191
  %xor.1 = xor i64 %7, %shl.1, !dbg !1191
  store i64 %xor.1, ptr %arrayidx17.1, align 8, !dbg !1191
  %cmp18.1 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1192
  br i1 %cmp18.1, label %if.then.1, label %for.body10.2, !dbg !1192

if.then.1:                                        ; preds = %for.body10.1
  %mul19.1 = shl nuw nsw i32 %c.0, 2, !dbg !1207
  %add20.1 = or disjoint i32 %mul19.1, 1, !dbg !1208
  %arrayidx21.1 = getelementptr inbounds nuw i64, ptr %add.ptr, i32 %add20.1, !dbg !1194
  %8 = load i64, ptr %arrayidx21.1, align 8, !dbg !1194
  %sub.1 = sub nsw i32 64, %bits_to_shift.1, !dbg !1196
  %sh_prom22.1 = zext nneg i32 %sub.1 to i64, !dbg !1197
  %shr.1 = lshr i64 %8, %sh_prom22.1, !dbg !1197
  %mul23.1 = mul nuw nsw i32 %i.0, 17, !dbg !1198
  %add24.1 = add nuw nsw i32 %mul23.1, %c.0, !dbg !1199
  %9 = mul i32 %words_to_shift.1, 80, !dbg !1200
  %mul27.1 = add i32 %9, 160, !dbg !1200
  %add28.1 = add i32 %add24.1, %mul27.1, !dbg !1201
  %arrayidx29.1 = getelementptr inbounds nuw [640 x i64], ptr %A, i32 0, i32 %add28.1, !dbg !1202
  %10 = load i64, ptr %arrayidx29.1, align 8, !dbg !1203
  %xor30.1 = xor i64 %10, %shr.1, !dbg !1203
  store i64 %xor30.1, ptr %arrayidx29.1, align 8, !dbg !1203
  br label %for.body10.2, !dbg !1204

for.body10.2:                                     ; preds = %for.body10.1, %if.then.1
    #dbg_value(i32 2, !1178, !DIExpression(), !1181)
  %mul11.2 = shl nuw nsw i32 %c.0, 2, !dbg !1205
  %add.2 = or disjoint i32 %mul11.2, 2, !dbg !1206
  %arrayidx.2 = getelementptr inbounds nuw i64, ptr %add.ptr, i32 %add.2, !dbg !1182
  %11 = load i64, ptr %arrayidx.2, align 8, !dbg !1182
  %sh_prom.2 = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1185
  %shl.2 = shl i64 %11, %sh_prom.2, !dbg !1185
  %mul12.2 = mul nuw nsw i32 %i.0, 17, !dbg !1186
  %add13.2 = add nuw nsw i32 %mul12.2, %c.0, !dbg !1187
  %12 = mul i32 %words_to_shift.1, 80, !dbg !1188
  %mul15.2 = add i32 %12, 160, !dbg !1188
  %add16.2 = add i32 %add13.2, %mul15.2, !dbg !1189
  %arrayidx17.2 = getelementptr inbounds nuw [640 x i64], ptr %A, i32 0, i32 %add16.2, !dbg !1190
  %13 = load i64, ptr %arrayidx17.2, align 8, !dbg !1191
  %xor.2 = xor i64 %13, %shl.2, !dbg !1191
  store i64 %xor.2, ptr %arrayidx17.2, align 8, !dbg !1191
  %cmp18.2 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1192
  br i1 %cmp18.2, label %if.then.2, label %for.body10.3, !dbg !1192

if.then.2:                                        ; preds = %for.body10.2
  %mul19.2 = shl nuw nsw i32 %c.0, 2, !dbg !1207
  %add20.2 = or disjoint i32 %mul19.2, 2, !dbg !1208
  %arrayidx21.2 = getelementptr inbounds nuw i64, ptr %add.ptr, i32 %add20.2, !dbg !1194
  %14 = load i64, ptr %arrayidx21.2, align 8, !dbg !1194
  %sub.2 = sub nsw i32 64, %bits_to_shift.1, !dbg !1196
  %sh_prom22.2 = zext nneg i32 %sub.2 to i64, !dbg !1197
  %shr.2 = lshr i64 %14, %sh_prom22.2, !dbg !1197
  %mul23.2 = mul nuw nsw i32 %i.0, 17, !dbg !1198
  %add24.2 = add nuw nsw i32 %mul23.2, %c.0, !dbg !1199
  %15 = mul i32 %words_to_shift.1, 80, !dbg !1200
  %mul27.2 = add i32 %15, 240, !dbg !1200
  %add28.2 = add i32 %add24.2, %mul27.2, !dbg !1201
  %arrayidx29.2 = getelementptr inbounds nuw [640 x i64], ptr %A, i32 0, i32 %add28.2, !dbg !1202
  %16 = load i64, ptr %arrayidx29.2, align 8, !dbg !1203
  %xor30.2 = xor i64 %16, %shr.2, !dbg !1203
  store i64 %xor30.2, ptr %arrayidx29.2, align 8, !dbg !1203
  br label %for.body10.3, !dbg !1204

for.body10.3:                                     ; preds = %for.body10.2, %if.then.2
    #dbg_value(i32 3, !1178, !DIExpression(), !1181)
  %mul11.3 = shl nuw nsw i32 %c.0, 2, !dbg !1205
  %add.3 = or disjoint i32 %mul11.3, 3, !dbg !1206
  %arrayidx.3 = getelementptr inbounds nuw i64, ptr %add.ptr, i32 %add.3, !dbg !1182
  %17 = load i64, ptr %arrayidx.3, align 8, !dbg !1182
  %sh_prom.3 = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1185
  %shl.3 = shl i64 %17, %sh_prom.3, !dbg !1185
  %mul12.3 = mul nuw nsw i32 %i.0, 17, !dbg !1186
  %add13.3 = add nuw nsw i32 %mul12.3, %c.0, !dbg !1187
  %18 = mul i32 %words_to_shift.1, 80, !dbg !1188
  %mul15.3 = add i32 %18, 240, !dbg !1188
  %add16.3 = add i32 %add13.3, %mul15.3, !dbg !1189
  %arrayidx17.3 = getelementptr inbounds nuw [640 x i64], ptr %A, i32 0, i32 %add16.3, !dbg !1190
  %19 = load i64, ptr %arrayidx17.3, align 8, !dbg !1191
  %xor.3 = xor i64 %19, %shl.3, !dbg !1191
  store i64 %xor.3, ptr %arrayidx17.3, align 8, !dbg !1191
  %cmp18.3 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1192
  br i1 %cmp18.3, label %if.then.3, label %for.inc31, !dbg !1192

if.then.3:                                        ; preds = %for.body10.3
  %mul19.3 = shl nuw nsw i32 %c.0, 2, !dbg !1207
  %add20.3 = or disjoint i32 %mul19.3, 3, !dbg !1208
  %arrayidx21.3 = getelementptr inbounds nuw i64, ptr %add.ptr, i32 %add20.3, !dbg !1194
  %20 = load i64, ptr %arrayidx21.3, align 8, !dbg !1194
  %sub.3 = sub nsw i32 64, %bits_to_shift.1, !dbg !1196
  %sh_prom22.3 = zext nneg i32 %sub.3 to i64, !dbg !1197
  %shr.3 = lshr i64 %20, %sh_prom22.3, !dbg !1197
  %mul23.3 = mul nuw nsw i32 %i.0, 17, !dbg !1198
  %add24.3 = add nuw nsw i32 %mul23.3, %c.0, !dbg !1199
  %21 = mul i32 %words_to_shift.1, 80, !dbg !1200
  %mul27.3 = add i32 %21, 320, !dbg !1200
  %add28.3 = add i32 %add24.3, %mul27.3, !dbg !1201
  %arrayidx29.3 = getelementptr inbounds nuw [640 x i64], ptr %A, i32 0, i32 %add28.3, !dbg !1202
  %22 = load i64, ptr %arrayidx29.3, align 8, !dbg !1203
  %xor30.3 = xor i64 %22, %shr.3, !dbg !1203
  store i64 %xor30.3, ptr %arrayidx29.3, align 8, !dbg !1203
  br label %for.inc31, !dbg !1204

for.inc31:                                        ; preds = %for.body10.3, %if.then.3
    #dbg_value(i32 4, !1178, !DIExpression(), !1181)
  %inc32 = add nuw nsw i32 %c.0, 1, !dbg !1209
    #dbg_value(i32 %inc32, !1170, !DIExpression(), !1172)
  br label %for.cond5, !dbg !1210, !llvm.loop !1211

for.end33:                                        ; preds = %for.cond5
  %cmp34.not = icmp eq i32 %i.0, %j.0, !dbg !1213
  br i1 %cmp34.not, label %if.end82, label %if.then35, !dbg !1213

if.then35:                                        ; preds = %for.end33
  %add.ptr38.idx = mul nuw nsw i32 %i.0, 544, !dbg !1215
  %add.ptr38 = getelementptr inbounds nuw i8, ptr %VtL, i32 %add.ptr38.idx, !dbg !1215
    #dbg_value(ptr %add.ptr38, !1217, !DIExpression(), !1137)
    #dbg_value(i32 0, !1218, !DIExpression(), !1220)
  br label %for.cond40, !dbg !1221

for.cond40:                                       ; preds = %for.inc79, %if.then35
  %c39.0 = phi i32 [ 0, %if.then35 ], [ %inc80, %for.inc79 ], !dbg !1222
    #dbg_value(i32 %c39.0, !1218, !DIExpression(), !1220)
  %exitcond6.not = icmp eq i32 %c39.0, 17, !dbg !1223
  br i1 %exitcond6.not, label %if.end82, label %for.body46, !dbg !1225

for.body46:                                       ; preds = %for.cond40
    #dbg_value(i32 0, !1226, !DIExpression(), !1229)
  %arrayidx49.idx = shl nuw nsw i32 %c39.0, 5, !dbg !1230
  %arrayidx49 = getelementptr inbounds nuw i8, ptr %add.ptr38, i32 %arrayidx49.idx, !dbg !1230
  %23 = load i64, ptr %arrayidx49, align 8, !dbg !1230
  %sh_prom50 = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1233
  %shl51 = shl i64 %23, %sh_prom50, !dbg !1233
  %mul52 = mul nsw i32 %j.0, 17, !dbg !1234
  %add53 = add nsw i32 %mul52, %c39.0, !dbg !1235
  %mul55 = mul i32 %words_to_shift.1, 80, !dbg !1236
  %add56 = add i32 %add53, %mul55, !dbg !1237
  %arrayidx57 = getelementptr inbounds nuw [640 x i64], ptr %A, i32 0, i32 %add56, !dbg !1238
  %24 = load i64, ptr %arrayidx57, align 8, !dbg !1239
  %xor58 = xor i64 %24, %shl51, !dbg !1239
  store i64 %xor58, ptr %arrayidx57, align 8, !dbg !1239
  %cmp59 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1240
  br i1 %cmp59, label %if.then60, label %for.body46.1, !dbg !1240

if.then60:                                        ; preds = %for.body46
  %arrayidx63.idx = shl nuw nsw i32 %c39.0, 5, !dbg !1242
  %arrayidx63 = getelementptr inbounds nuw i8, ptr %add.ptr38, i32 %arrayidx63.idx, !dbg !1242
  %25 = load i64, ptr %arrayidx63, align 8, !dbg !1242
  %sub64 = sub nsw i32 64, %bits_to_shift.1, !dbg !1244
  %sh_prom65 = zext nneg i32 %sub64 to i64, !dbg !1245
  %shr66 = lshr i64 %25, %sh_prom65, !dbg !1245
  %mul67 = mul nsw i32 %j.0, 17, !dbg !1246
  %add68 = add nsw i32 %mul67, %c39.0, !dbg !1247
  %26 = mul i32 %words_to_shift.1, 80, !dbg !1248
  %mul71 = add i32 %26, 80, !dbg !1248
  %add72 = add i32 %add68, %mul71, !dbg !1249
  %arrayidx73 = getelementptr inbounds nuw [640 x i64], ptr %A, i32 0, i32 %add72, !dbg !1250
  %27 = load i64, ptr %arrayidx73, align 8, !dbg !1251
  %xor74 = xor i64 %27, %shr66, !dbg !1251
  store i64 %xor74, ptr %arrayidx73, align 8, !dbg !1251
  br label %for.body46.1, !dbg !1252

for.body46.1:                                     ; preds = %if.then60, %for.body46
    #dbg_value(i32 1, !1226, !DIExpression(), !1229)
  %mul47.1 = shl nuw nsw i32 %c39.0, 2, !dbg !1253
  %add48.1 = or disjoint i32 %mul47.1, 1, !dbg !1254
  %arrayidx49.1 = getelementptr inbounds nuw i64, ptr %add.ptr38, i32 %add48.1, !dbg !1230
  %28 = load i64, ptr %arrayidx49.1, align 8, !dbg !1230
  %sh_prom50.1 = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1233
  %shl51.1 = shl i64 %28, %sh_prom50.1, !dbg !1233
  %mul52.1 = mul nsw i32 %j.0, 17, !dbg !1234
  %add53.1 = add nsw i32 %mul52.1, %c39.0, !dbg !1235
  %29 = mul i32 %words_to_shift.1, 80, !dbg !1236
  %mul55.1 = add i32 %29, 80, !dbg !1236
  %add56.1 = add i32 %add53.1, %mul55.1, !dbg !1237
  %arrayidx57.1 = getelementptr inbounds nuw [640 x i64], ptr %A, i32 0, i32 %add56.1, !dbg !1238
  %30 = load i64, ptr %arrayidx57.1, align 8, !dbg !1239
  %xor58.1 = xor i64 %30, %shl51.1, !dbg !1239
  store i64 %xor58.1, ptr %arrayidx57.1, align 8, !dbg !1239
  %cmp59.1 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1240
  br i1 %cmp59.1, label %if.then60.1, label %for.body46.2, !dbg !1240

if.then60.1:                                      ; preds = %for.body46.1
  %mul61.1 = shl nuw nsw i32 %c39.0, 2, !dbg !1255
  %add62.1 = or disjoint i32 %mul61.1, 1, !dbg !1256
  %arrayidx63.1 = getelementptr inbounds nuw i64, ptr %add.ptr38, i32 %add62.1, !dbg !1242
  %31 = load i64, ptr %arrayidx63.1, align 8, !dbg !1242
  %sub64.1 = sub nsw i32 64, %bits_to_shift.1, !dbg !1244
  %sh_prom65.1 = zext nneg i32 %sub64.1 to i64, !dbg !1245
  %shr66.1 = lshr i64 %31, %sh_prom65.1, !dbg !1245
  %mul67.1 = mul nsw i32 %j.0, 17, !dbg !1246
  %add68.1 = add nsw i32 %mul67.1, %c39.0, !dbg !1247
  %32 = mul i32 %words_to_shift.1, 80, !dbg !1248
  %mul71.1 = add i32 %32, 160, !dbg !1248
  %add72.1 = add i32 %add68.1, %mul71.1, !dbg !1249
  %arrayidx73.1 = getelementptr inbounds nuw [640 x i64], ptr %A, i32 0, i32 %add72.1, !dbg !1250
  %33 = load i64, ptr %arrayidx73.1, align 8, !dbg !1251
  %xor74.1 = xor i64 %33, %shr66.1, !dbg !1251
  store i64 %xor74.1, ptr %arrayidx73.1, align 8, !dbg !1251
  br label %for.body46.2, !dbg !1252

for.body46.2:                                     ; preds = %for.body46.1, %if.then60.1
    #dbg_value(i32 2, !1226, !DIExpression(), !1229)
  %mul47.2 = shl nuw nsw i32 %c39.0, 2, !dbg !1253
  %add48.2 = or disjoint i32 %mul47.2, 2, !dbg !1254
  %arrayidx49.2 = getelementptr inbounds nuw i64, ptr %add.ptr38, i32 %add48.2, !dbg !1230
  %34 = load i64, ptr %arrayidx49.2, align 8, !dbg !1230
  %sh_prom50.2 = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1233
  %shl51.2 = shl i64 %34, %sh_prom50.2, !dbg !1233
  %mul52.2 = mul nsw i32 %j.0, 17, !dbg !1234
  %add53.2 = add nsw i32 %mul52.2, %c39.0, !dbg !1235
  %35 = mul i32 %words_to_shift.1, 80, !dbg !1236
  %mul55.2 = add i32 %35, 160, !dbg !1236
  %add56.2 = add i32 %add53.2, %mul55.2, !dbg !1237
  %arrayidx57.2 = getelementptr inbounds nuw [640 x i64], ptr %A, i32 0, i32 %add56.2, !dbg !1238
  %36 = load i64, ptr %arrayidx57.2, align 8, !dbg !1239
  %xor58.2 = xor i64 %36, %shl51.2, !dbg !1239
  store i64 %xor58.2, ptr %arrayidx57.2, align 8, !dbg !1239
  %cmp59.2 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1240
  br i1 %cmp59.2, label %if.then60.2, label %for.body46.3, !dbg !1240

if.then60.2:                                      ; preds = %for.body46.2
  %mul61.2 = shl nuw nsw i32 %c39.0, 2, !dbg !1255
  %add62.2 = or disjoint i32 %mul61.2, 2, !dbg !1256
  %arrayidx63.2 = getelementptr inbounds nuw i64, ptr %add.ptr38, i32 %add62.2, !dbg !1242
  %37 = load i64, ptr %arrayidx63.2, align 8, !dbg !1242
  %sub64.2 = sub nsw i32 64, %bits_to_shift.1, !dbg !1244
  %sh_prom65.2 = zext nneg i32 %sub64.2 to i64, !dbg !1245
  %shr66.2 = lshr i64 %37, %sh_prom65.2, !dbg !1245
  %mul67.2 = mul nsw i32 %j.0, 17, !dbg !1246
  %add68.2 = add nsw i32 %mul67.2, %c39.0, !dbg !1247
  %38 = mul i32 %words_to_shift.1, 80, !dbg !1248
  %mul71.2 = add i32 %38, 240, !dbg !1248
  %add72.2 = add i32 %add68.2, %mul71.2, !dbg !1249
  %arrayidx73.2 = getelementptr inbounds nuw [640 x i64], ptr %A, i32 0, i32 %add72.2, !dbg !1250
  %39 = load i64, ptr %arrayidx73.2, align 8, !dbg !1251
  %xor74.2 = xor i64 %39, %shr66.2, !dbg !1251
  store i64 %xor74.2, ptr %arrayidx73.2, align 8, !dbg !1251
  br label %for.body46.3, !dbg !1252

for.body46.3:                                     ; preds = %for.body46.2, %if.then60.2
    #dbg_value(i32 3, !1226, !DIExpression(), !1229)
  %mul47.3 = shl nuw nsw i32 %c39.0, 2, !dbg !1253
  %add48.3 = or disjoint i32 %mul47.3, 3, !dbg !1254
  %arrayidx49.3 = getelementptr inbounds nuw i64, ptr %add.ptr38, i32 %add48.3, !dbg !1230
  %40 = load i64, ptr %arrayidx49.3, align 8, !dbg !1230
  %sh_prom50.3 = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1233
  %shl51.3 = shl i64 %40, %sh_prom50.3, !dbg !1233
  %mul52.3 = mul nsw i32 %j.0, 17, !dbg !1234
  %add53.3 = add nsw i32 %mul52.3, %c39.0, !dbg !1235
  %41 = mul i32 %words_to_shift.1, 80, !dbg !1236
  %mul55.3 = add i32 %41, 240, !dbg !1236
  %add56.3 = add i32 %add53.3, %mul55.3, !dbg !1237
  %arrayidx57.3 = getelementptr inbounds nuw [640 x i64], ptr %A, i32 0, i32 %add56.3, !dbg !1238
  %42 = load i64, ptr %arrayidx57.3, align 8, !dbg !1239
  %xor58.3 = xor i64 %42, %shl51.3, !dbg !1239
  store i64 %xor58.3, ptr %arrayidx57.3, align 8, !dbg !1239
  %cmp59.3 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1240
  br i1 %cmp59.3, label %if.then60.3, label %for.inc79, !dbg !1240

if.then60.3:                                      ; preds = %for.body46.3
  %mul61.3 = shl nuw nsw i32 %c39.0, 2, !dbg !1255
  %add62.3 = or disjoint i32 %mul61.3, 3, !dbg !1256
  %arrayidx63.3 = getelementptr inbounds nuw i64, ptr %add.ptr38, i32 %add62.3, !dbg !1242
  %43 = load i64, ptr %arrayidx63.3, align 8, !dbg !1242
  %sub64.3 = sub nsw i32 64, %bits_to_shift.1, !dbg !1244
  %sh_prom65.3 = zext nneg i32 %sub64.3 to i64, !dbg !1245
  %shr66.3 = lshr i64 %43, %sh_prom65.3, !dbg !1245
  %mul67.3 = mul nsw i32 %j.0, 17, !dbg !1246
  %add68.3 = add nsw i32 %mul67.3, %c39.0, !dbg !1247
  %44 = mul i32 %words_to_shift.1, 80, !dbg !1248
  %mul71.3 = add i32 %44, 320, !dbg !1248
  %add72.3 = add i32 %add68.3, %mul71.3, !dbg !1249
  %arrayidx73.3 = getelementptr inbounds nuw [640 x i64], ptr %A, i32 0, i32 %add72.3, !dbg !1250
  %45 = load i64, ptr %arrayidx73.3, align 8, !dbg !1251
  %xor74.3 = xor i64 %45, %shr66.3, !dbg !1251
  store i64 %xor74.3, ptr %arrayidx73.3, align 8, !dbg !1251
  br label %for.inc79, !dbg !1252

for.inc79:                                        ; preds = %for.body46.3, %if.then60.3
    #dbg_value(i32 4, !1226, !DIExpression(), !1229)
  %inc80 = add nuw nsw i32 %c39.0, 1, !dbg !1257
    #dbg_value(i32 %inc80, !1218, !DIExpression(), !1220)
  br label %for.cond40, !dbg !1258, !llvm.loop !1259

if.end82:                                         ; preds = %for.cond40, %for.end33
  %add83 = add nsw i32 %bits_to_shift.1, 4, !dbg !1261
    #dbg_value(i32 %add83, !1140, !DIExpression(), !1137)
  %cmp84 = icmp eq i32 %add83, 64, !dbg !1262
  %inc86 = zext i1 %cmp84 to i32, !dbg !1262
  %spec.select = add nsw i32 %words_to_shift.1, %inc86, !dbg !1262
  %spec.select3 = select i1 %cmp84, i32 0, i32 %add83, !dbg !1262
    #dbg_value(i32 %spec.select3, !1140, !DIExpression(), !1137)
    #dbg_value(i32 %spec.select, !1141, !DIExpression(), !1137)
  %dec = add nsw i32 %j.0, -1, !dbg !1264
    #dbg_value(i32 %dec, !1162, !DIExpression(), !1163)
  br label %for.cond1, !dbg !1265, !llvm.loop !1266

for.inc90:                                        ; preds = %for.cond1
  %inc91 = add nuw nsw i32 %i.0, 1, !dbg !1268
    #dbg_value(i32 %inc91, !1149, !DIExpression(), !1151)
  br label %for.cond, !dbg !1269, !llvm.loop !1270

for.cond94:                                       ; preds = %for.cond, %for.body97
  %c93.0 = phi i32 [ %add100, %for.body97 ], [ 0, %for.cond ], !dbg !1272
    #dbg_value(i32 %c93.0, !1274, !DIExpression(), !1275)
  %cmp96 = icmp samesign ult i32 %c93.0, 400, !dbg !1276
  br i1 %cmp96, label %for.body97, label %for.end101, !dbg !1278

for.body97:                                       ; preds = %for.cond94
  %add.ptr98 = getelementptr inbounds nuw i64, ptr %A, i32 %c93.0, !dbg !1279
  call fastcc void @transpose_16x16_nibbles(ptr noundef nonnull %add.ptr98) #6, !dbg !1281
  %add100 = add nuw nsw i32 %c93.0, 16, !dbg !1282
    #dbg_value(i32 %add100, !1274, !DIExpression(), !1275)
  br label %for.cond94, !dbg !1283, !llvm.loop !1284

for.end101:                                       ; preds = %for.cond94
    #dbg_declare(ptr %tab, !1286, !DIExpression(), !1290)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(16) %tab, i8 0, i32 16, i1 false), !dbg !1290
    #dbg_value(i32 0, !1291, !DIExpression(), !1293)
  br label %for.cond103, !dbg !1294

for.cond103:                                      ; preds = %for.body105, %for.end101
  %i102.0 = phi i32 [ 0, %for.end101 ], [ %inc125.3, %for.body105 ], !dbg !1295
    #dbg_value(i32 %i102.0, !1291, !DIExpression(), !1293)
  %exitcond8.not = icmp eq i32 %i102.0, 4, !dbg !1296
  br i1 %exitcond8.not, label %for.cond128, label %for.body105, !dbg !1298

for.body105:                                      ; preds = %for.cond103
  %arrayidx106 = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %i102.0, !dbg !1299
  %46 = load i8, ptr %arrayidx106, align 1, !dbg !1299
  %call = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %46, i8 noundef zeroext 1) #6, !dbg !1301
  %mul107 = shl nuw nsw i32 %i102.0, 2, !dbg !1302
  %arrayidx108 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %mul107, !dbg !1303
  store i8 %call, ptr %arrayidx108, align 1, !dbg !1304
  %call110 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %46, i8 noundef zeroext 2) #6, !dbg !1305
  %mul111 = shl nuw nsw i32 %i102.0, 2, !dbg !1306
  %add112 = or disjoint i32 %mul111, 1, !dbg !1307
  %arrayidx113 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add112, !dbg !1308
  store i8 %call110, ptr %arrayidx113, align 1, !dbg !1309
  %call115 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %46, i8 noundef zeroext 4) #6, !dbg !1310
  %mul116 = shl nuw nsw i32 %i102.0, 2, !dbg !1311
  %add117 = or disjoint i32 %mul116, 2, !dbg !1312
  %arrayidx118 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add117, !dbg !1313
  store i8 %call115, ptr %arrayidx118, align 1, !dbg !1314
  %call120 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %46, i8 noundef zeroext 8) #6, !dbg !1315
  %mul121 = shl nuw nsw i32 %i102.0, 2, !dbg !1316
  %add122 = or disjoint i32 %mul121, 3, !dbg !1317
  %arrayidx123 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add122, !dbg !1318
  store i8 %call120, ptr %arrayidx123, align 1, !dbg !1319
    #dbg_value(i32 %i102.0, !1291, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1293)
  %inc125 = or disjoint i32 %i102.0, 1, !dbg !1320
    #dbg_value(i32 %inc125, !1291, !DIExpression(), !1293)
  %arrayidx106.1 = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %inc125, !dbg !1299
  %47 = load i8, ptr %arrayidx106.1, align 1, !dbg !1299
  %call.1 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %47, i8 noundef zeroext 1) #6, !dbg !1301
  %mul107.1 = shl nuw nsw i32 %inc125, 2, !dbg !1302
  %arrayidx108.1 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %mul107.1, !dbg !1303
  store i8 %call.1, ptr %arrayidx108.1, align 1, !dbg !1304
  %call110.1 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %47, i8 noundef zeroext 2) #6, !dbg !1305
  %mul111.1 = shl nuw nsw i32 %inc125, 2, !dbg !1306
  %add112.1 = or disjoint i32 %mul111.1, 1, !dbg !1307
  %arrayidx113.1 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add112.1, !dbg !1308
  store i8 %call110.1, ptr %arrayidx113.1, align 1, !dbg !1309
  %call115.1 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %47, i8 noundef zeroext 4) #6, !dbg !1310
  %mul116.1 = shl nuw nsw i32 %inc125, 2, !dbg !1311
  %add117.1 = or disjoint i32 %mul116.1, 2, !dbg !1312
  %arrayidx118.1 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add117.1, !dbg !1313
  store i8 %call115.1, ptr %arrayidx118.1, align 1, !dbg !1314
  %call120.1 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %47, i8 noundef zeroext 8) #6, !dbg !1315
  %mul121.1 = shl nuw nsw i32 %inc125, 2, !dbg !1316
  %add122.1 = or disjoint i32 %mul121.1, 3, !dbg !1317
  %arrayidx123.1 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add122.1, !dbg !1318
  store i8 %call120.1, ptr %arrayidx123.1, align 1, !dbg !1319
    #dbg_value(i32 %i102.0, !1291, !DIExpression(DW_OP_plus_uconst, 2, DW_OP_stack_value), !1293)
  %inc125.1 = or disjoint i32 %i102.0, 2, !dbg !1320
    #dbg_value(i32 %inc125.1, !1291, !DIExpression(), !1293)
  %arrayidx106.2 = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %inc125.1, !dbg !1299
  %48 = load i8, ptr %arrayidx106.2, align 1, !dbg !1299
  %call.2 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %48, i8 noundef zeroext 1) #6, !dbg !1301
  %mul107.2 = shl nuw nsw i32 %inc125.1, 2, !dbg !1302
  %arrayidx108.2 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %mul107.2, !dbg !1303
  store i8 %call.2, ptr %arrayidx108.2, align 1, !dbg !1304
  %call110.2 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %48, i8 noundef zeroext 2) #6, !dbg !1305
  %mul111.2 = shl nuw nsw i32 %inc125.1, 2, !dbg !1306
  %add112.2 = or disjoint i32 %mul111.2, 1, !dbg !1307
  %arrayidx113.2 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add112.2, !dbg !1308
  store i8 %call110.2, ptr %arrayidx113.2, align 1, !dbg !1309
  %call115.2 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %48, i8 noundef zeroext 4) #6, !dbg !1310
  %mul116.2 = shl nuw nsw i32 %inc125.1, 2, !dbg !1311
  %add117.2 = or disjoint i32 %mul116.2, 2, !dbg !1312
  %arrayidx118.2 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add117.2, !dbg !1313
  store i8 %call115.2, ptr %arrayidx118.2, align 1, !dbg !1314
  %call120.2 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %48, i8 noundef zeroext 8) #6, !dbg !1315
  %mul121.2 = shl nuw nsw i32 %inc125.1, 2, !dbg !1316
  %add122.2 = or disjoint i32 %mul121.2, 3, !dbg !1317
  %arrayidx123.2 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add122.2, !dbg !1318
  store i8 %call120.2, ptr %arrayidx123.2, align 1, !dbg !1319
    #dbg_value(i32 %i102.0, !1291, !DIExpression(DW_OP_plus_uconst, 3, DW_OP_stack_value), !1293)
  %inc125.2 = or disjoint i32 %i102.0, 3, !dbg !1320
    #dbg_value(i32 %inc125.2, !1291, !DIExpression(), !1293)
  %arrayidx106.3 = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %inc125.2, !dbg !1299
  %49 = load i8, ptr %arrayidx106.3, align 1, !dbg !1299
  %call.3 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %49, i8 noundef zeroext 1) #6, !dbg !1301
  %mul107.3 = shl nuw nsw i32 %inc125.2, 2, !dbg !1302
  %arrayidx108.3 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %mul107.3, !dbg !1303
  store i8 %call.3, ptr %arrayidx108.3, align 1, !dbg !1304
  %call110.3 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %49, i8 noundef zeroext 2) #6, !dbg !1305
  %mul111.3 = shl nuw nsw i32 %inc125.2, 2, !dbg !1306
  %add112.3 = or disjoint i32 %mul111.3, 1, !dbg !1307
  %arrayidx113.3 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add112.3, !dbg !1308
  store i8 %call110.3, ptr %arrayidx113.3, align 1, !dbg !1309
  %call115.3 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %49, i8 noundef zeroext 4) #6, !dbg !1310
  %mul116.3 = shl nuw nsw i32 %inc125.2, 2, !dbg !1311
  %add117.3 = or disjoint i32 %mul116.3, 2, !dbg !1312
  %arrayidx118.3 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add117.3, !dbg !1313
  store i8 %call115.3, ptr %arrayidx118.3, align 1, !dbg !1314
  %call120.3 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %49, i8 noundef zeroext 8) #6, !dbg !1315
  %mul121.3 = shl nuw nsw i32 %inc125.2, 2, !dbg !1316
  %add122.3 = or disjoint i32 %mul121.3, 3, !dbg !1317
  %arrayidx123.3 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add122.3, !dbg !1318
  store i8 %call120.3, ptr %arrayidx123.3, align 1, !dbg !1319
  %inc125.3 = add nuw nsw i32 %i102.0, 4, !dbg !1320
    #dbg_value(i32 %inc125.3, !1291, !DIExpression(), !1293)
  br label %for.cond103, !dbg !1321, !llvm.loop !1322

for.cond128:                                      ; preds = %for.cond103, %for.inc189
  %c127.0 = phi i32 [ %add190, %for.inc189 ], [ 0, %for.cond103 ], !dbg !1324
    #dbg_value(i32 %c127.0, !1326, !DIExpression(), !1327)
  %cmp129 = icmp samesign ult i32 %c127.0, 80, !dbg !1328
  br i1 %cmp129, label %for.cond131, label %for.cond193, !dbg !1330

for.cond131:                                      ; preds = %for.cond128, %for.body133
  %r.0 = phi i32 [ %inc187, %for.body133 ], [ 64, %for.cond128 ], !dbg !1331
    #dbg_value(i32 %r.0, !1334, !DIExpression(), !1335)
  %exitcond10.not = icmp eq i32 %r.0, 74, !dbg !1336
  br i1 %exitcond10.not, label %for.inc189, label %for.body133, !dbg !1338

for.body133:                                      ; preds = %for.cond131
  %div1 = lshr i32 %r.0, 4, !dbg !1339
  %mul134 = mul nuw nsw i32 %div1, 80, !dbg !1341
  %add135 = add nuw nsw i32 %mul134, %c127.0, !dbg !1342
  %rem = and i32 %r.0, 15, !dbg !1343
  %add136 = or disjoint i32 %add135, %rem, !dbg !1344
    #dbg_value(i32 %add136, !1345, !DIExpression(), !1346)
  %arrayidx137 = getelementptr inbounds nuw [640 x i64], ptr %A, i32 0, i32 %add136, !dbg !1347
  %50 = load i64, ptr %arrayidx137, align 8, !dbg !1347
  %and = and i64 %50, 1229782938247303441, !dbg !1348
    #dbg_value(i64 %and, !1349, !DIExpression(), !1346)
  %shr139 = lshr i64 %50, 1, !dbg !1350
  %and140 = and i64 %shr139, 1229782938247303441, !dbg !1351
    #dbg_value(i64 %and140, !1352, !DIExpression(), !1346)
  %shr142 = lshr i64 %50, 2, !dbg !1353
  %and143 = and i64 %shr142, 1229782938247303441, !dbg !1354
    #dbg_value(i64 %and143, !1355, !DIExpression(), !1346)
  %arrayidx144 = getelementptr inbounds nuw [640 x i64], ptr %A, i32 0, i32 %add136, !dbg !1356
  %51 = load i64, ptr %arrayidx144, align 8, !dbg !1356
  %shr145 = lshr i64 %51, 3, !dbg !1357
  %and146 = and i64 %shr145, 1229782938247303441, !dbg !1358
    #dbg_value(i64 %and146, !1359, !DIExpression(), !1346)
    #dbg_value(i32 0, !1360, !DIExpression(), !1362)
    #dbg_value(i32 0, !1360, !DIExpression(), !1362)
  %52 = load i8, ptr %tab, align 1, !dbg !1363
  %conv = zext i8 %52 to i64, !dbg !1363
  %mul153 = mul i64 %and, %conv, !dbg !1366
  %arrayidx156 = getelementptr inbounds nuw i8, ptr %tab, i32 1, !dbg !1367
  %53 = load i8, ptr %arrayidx156, align 1, !dbg !1367
  %conv157 = zext i8 %53 to i64, !dbg !1367
  %mul158 = mul i64 %and140, %conv157, !dbg !1368
  %xor159 = xor i64 %mul153, %mul158, !dbg !1369
  %arrayidx162 = getelementptr inbounds nuw i8, ptr %tab, i32 2, !dbg !1370
  %54 = load i8, ptr %arrayidx162, align 1, !dbg !1370
  %conv163 = zext i8 %54 to i64, !dbg !1370
  %mul164 = mul i64 %and143, %conv163, !dbg !1371
  %xor165 = xor i64 %xor159, %mul164, !dbg !1372
  %arrayidx168 = getelementptr inbounds nuw i8, ptr %tab, i32 3, !dbg !1373
  %55 = load i8, ptr %arrayidx168, align 1, !dbg !1373
  %conv169 = zext i8 %55 to i64, !dbg !1373
  %mul170 = mul i64 %and146, %conv169, !dbg !1374
  %xor171 = xor i64 %xor165, %mul170, !dbg !1375
  %sub173 = add nsw i32 %r.0, -64, !dbg !1376
  %div1742 = lshr i32 %sub173, 4, !dbg !1377
  %mul175 = mul i32 %div1742, 80, !dbg !1378
  %add176 = add i32 %mul175, %c127.0, !dbg !1379
  %rem179 = and i32 %r.0, 15, !dbg !1380
  %add180 = or disjoint i32 %add176, %rem179, !dbg !1381
  %arrayidx181 = getelementptr inbounds nuw [640 x i64], ptr %A, i32 0, i32 %add180, !dbg !1382
  %56 = load i64, ptr %arrayidx181, align 8, !dbg !1383
  %xor182 = xor i64 %56, %xor171, !dbg !1383
  store i64 %xor182, ptr %arrayidx181, align 8, !dbg !1383
    #dbg_value(i32 1, !1360, !DIExpression(), !1362)
  %arrayidx152.1 = getelementptr inbounds nuw i8, ptr %tab, i32 4, !dbg !1363
  %57 = load i8, ptr %arrayidx152.1, align 1, !dbg !1363
  %conv.1 = zext i8 %57 to i64, !dbg !1363
  %mul153.1 = mul i64 %and, %conv.1, !dbg !1366
  %arrayidx156.1 = getelementptr inbounds nuw i8, ptr %tab, i32 5, !dbg !1367
  %58 = load i8, ptr %arrayidx156.1, align 1, !dbg !1367
  %conv157.1 = zext i8 %58 to i64, !dbg !1367
  %mul158.1 = mul i64 %and140, %conv157.1, !dbg !1368
  %xor159.1 = xor i64 %mul153.1, %mul158.1, !dbg !1369
  %arrayidx162.1 = getelementptr inbounds nuw i8, ptr %tab, i32 6, !dbg !1370
  %59 = load i8, ptr %arrayidx162.1, align 1, !dbg !1370
  %conv163.1 = zext i8 %59 to i64, !dbg !1370
  %mul164.1 = mul i64 %and143, %conv163.1, !dbg !1371
  %xor165.1 = xor i64 %xor159.1, %mul164.1, !dbg !1372
  %arrayidx168.1 = getelementptr inbounds nuw i8, ptr %tab, i32 7, !dbg !1373
  %60 = load i8, ptr %arrayidx168.1, align 1, !dbg !1373
  %conv169.1 = zext i8 %60 to i64, !dbg !1373
  %mul170.1 = mul i64 %and146, %conv169.1, !dbg !1374
  %xor171.1 = xor i64 %xor165.1, %mul170.1, !dbg !1375
  %sub173.1 = add nsw i32 %r.0, -63, !dbg !1376
  %div1742.1 = lshr i32 %sub173.1, 4, !dbg !1377
  %mul175.1 = mul i32 %div1742.1, 80, !dbg !1378
  %add176.1 = add i32 %mul175.1, %c127.0, !dbg !1379
  %add177.1 = add nuw nsw i32 %r.0, 1, !dbg !1384
  %rem179.1 = and i32 %add177.1, 15, !dbg !1380
  %add180.1 = or disjoint i32 %add176.1, %rem179.1, !dbg !1381
  %arrayidx181.1 = getelementptr inbounds nuw [640 x i64], ptr %A, i32 0, i32 %add180.1, !dbg !1382
  %61 = load i64, ptr %arrayidx181.1, align 8, !dbg !1383
  %xor182.1 = xor i64 %61, %xor171.1, !dbg !1383
  store i64 %xor182.1, ptr %arrayidx181.1, align 8, !dbg !1383
    #dbg_value(i32 2, !1360, !DIExpression(), !1362)
  %arrayidx152.2 = getelementptr inbounds nuw i8, ptr %tab, i32 8, !dbg !1363
  %62 = load i8, ptr %arrayidx152.2, align 1, !dbg !1363
  %conv.2 = zext i8 %62 to i64, !dbg !1363
  %mul153.2 = mul i64 %and, %conv.2, !dbg !1366
  %arrayidx156.2 = getelementptr inbounds nuw i8, ptr %tab, i32 9, !dbg !1367
  %63 = load i8, ptr %arrayidx156.2, align 1, !dbg !1367
  %conv157.2 = zext i8 %63 to i64, !dbg !1367
  %mul158.2 = mul i64 %and140, %conv157.2, !dbg !1368
  %xor159.2 = xor i64 %mul153.2, %mul158.2, !dbg !1369
  %arrayidx162.2 = getelementptr inbounds nuw i8, ptr %tab, i32 10, !dbg !1370
  %64 = load i8, ptr %arrayidx162.2, align 1, !dbg !1370
  %conv163.2 = zext i8 %64 to i64, !dbg !1370
  %mul164.2 = mul i64 %and143, %conv163.2, !dbg !1371
  %xor165.2 = xor i64 %xor159.2, %mul164.2, !dbg !1372
  %arrayidx168.2 = getelementptr inbounds nuw i8, ptr %tab, i32 11, !dbg !1373
  %65 = load i8, ptr %arrayidx168.2, align 1, !dbg !1373
  %conv169.2 = zext i8 %65 to i64, !dbg !1373
  %mul170.2 = mul i64 %and146, %conv169.2, !dbg !1374
  %xor171.2 = xor i64 %xor165.2, %mul170.2, !dbg !1375
  %sub173.2 = add nsw i32 %r.0, -62, !dbg !1376
  %div1742.2 = lshr i32 %sub173.2, 4, !dbg !1377
  %mul175.2 = mul i32 %div1742.2, 80, !dbg !1378
  %add176.2 = add i32 %mul175.2, %c127.0, !dbg !1379
  %add177.2 = add nuw nsw i32 %r.0, 2, !dbg !1384
  %rem179.2 = and i32 %add177.2, 15, !dbg !1380
  %add180.2 = or disjoint i32 %add176.2, %rem179.2, !dbg !1381
  %arrayidx181.2 = getelementptr inbounds nuw [640 x i64], ptr %A, i32 0, i32 %add180.2, !dbg !1382
  %66 = load i64, ptr %arrayidx181.2, align 8, !dbg !1383
  %xor182.2 = xor i64 %66, %xor171.2, !dbg !1383
  store i64 %xor182.2, ptr %arrayidx181.2, align 8, !dbg !1383
    #dbg_value(i32 3, !1360, !DIExpression(), !1362)
  %arrayidx152.3 = getelementptr inbounds nuw i8, ptr %tab, i32 12, !dbg !1363
  %67 = load i8, ptr %arrayidx152.3, align 1, !dbg !1363
  %conv.3 = zext i8 %67 to i64, !dbg !1363
  %mul153.3 = mul i64 %and, %conv.3, !dbg !1366
  %arrayidx156.3 = getelementptr inbounds nuw i8, ptr %tab, i32 13, !dbg !1367
  %68 = load i8, ptr %arrayidx156.3, align 1, !dbg !1367
  %conv157.3 = zext i8 %68 to i64, !dbg !1367
  %mul158.3 = mul i64 %and140, %conv157.3, !dbg !1368
  %xor159.3 = xor i64 %mul153.3, %mul158.3, !dbg !1369
  %arrayidx162.3 = getelementptr inbounds nuw i8, ptr %tab, i32 14, !dbg !1370
  %69 = load i8, ptr %arrayidx162.3, align 1, !dbg !1370
  %conv163.3 = zext i8 %69 to i64, !dbg !1370
  %mul164.3 = mul i64 %and143, %conv163.3, !dbg !1371
  %xor165.3 = xor i64 %xor159.3, %mul164.3, !dbg !1372
  %arrayidx168.3 = getelementptr inbounds nuw i8, ptr %tab, i32 15, !dbg !1373
  %70 = load i8, ptr %arrayidx168.3, align 1, !dbg !1373
  %conv169.3 = zext i8 %70 to i64, !dbg !1373
  %mul170.3 = mul i64 %and146, %conv169.3, !dbg !1374
  %xor171.3 = xor i64 %xor165.3, %mul170.3, !dbg !1375
  %sub173.3 = add nsw i32 %r.0, -61, !dbg !1376
  %div1742.3 = lshr i32 %sub173.3, 4, !dbg !1377
  %mul175.3 = mul i32 %div1742.3, 80, !dbg !1378
  %add176.3 = add i32 %mul175.3, %c127.0, !dbg !1379
  %add177.3 = add nuw nsw i32 %r.0, 3, !dbg !1384
  %rem179.3 = and i32 %add177.3, 15, !dbg !1380
  %add180.3 = or disjoint i32 %add176.3, %rem179.3, !dbg !1381
  %arrayidx181.3 = getelementptr inbounds nuw [640 x i64], ptr %A, i32 0, i32 %add180.3, !dbg !1382
  %71 = load i64, ptr %arrayidx181.3, align 8, !dbg !1383
  %xor182.3 = xor i64 %71, %xor171.3, !dbg !1383
  store i64 %xor182.3, ptr %arrayidx181.3, align 8, !dbg !1383
    #dbg_value(i32 4, !1360, !DIExpression(), !1362)
  %inc187 = add nuw nsw i32 %r.0, 1, !dbg !1385
    #dbg_value(i32 %inc187, !1334, !DIExpression(), !1335)
  br label %for.cond131, !dbg !1386, !llvm.loop !1387

for.inc189:                                       ; preds = %for.cond131
  %add190 = add nuw nsw i32 %c127.0, 16, !dbg !1389
    #dbg_value(i32 %add190, !1326, !DIExpression(), !1327)
  br label %for.cond128, !dbg !1390, !llvm.loop !1391

for.cond193:                                      ; preds = %for.cond128, %for.inc227
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc227 ], [ 64, %for.cond128 ], !dbg !1393
  %r192.0 = phi i32 [ %add228, %for.inc227 ], [ 0, %for.cond128 ], !dbg !1393
    #dbg_value(i32 %r192.0, !1395, !DIExpression(), !1396)
  %cmp194 = icmp samesign ult i32 %r192.0, 64, !dbg !1397
  br i1 %cmp194, label %for.cond203, label %for.end229, !dbg !1399

for.cond203:                                      ; preds = %for.cond193, %for.body207
  %i202.0 = phi i32 [ %inc222, %for.body207 ], [ 0, %for.cond193 ], !dbg !1400
    #dbg_value(i32 %i202.0, !1406, !DIExpression(), !1407)
  %exitcond11.not = icmp eq i32 %i202.0, %indvars.iv, !dbg !1408
  br i1 %exitcond11.not, label %for.cond203.1, label %for.body207, !dbg !1410

for.body207:                                      ; preds = %for.cond203
  %div209 = mul nuw nsw i32 %r192.0, 5, !dbg !1411
  %add211 = add nuw nsw i32 %div209, %i202.0, !dbg !1413
  %arrayidx212 = getelementptr inbounds nuw [640 x i64], ptr %A, i32 0, i32 %add211, !dbg !1414
  %add213 = add nuw nsw i32 %r192.0, %i202.0, !dbg !1415
  %mul214 = mul nuw nsw i32 %add213, 69, !dbg !1416
  %add.ptr215 = getelementptr inbounds nuw i8, ptr %A_out, i32 %mul214, !dbg !1417
  call fastcc void @decode(ptr noundef nonnull %arrayidx212, ptr noundef %add.ptr215, i32 noundef 16) #6, !dbg !1418
  %inc222 = add nuw nsw i32 %i202.0, 1, !dbg !1419
    #dbg_value(i32 %inc222, !1406, !DIExpression(), !1407)
  br label %for.cond203, !dbg !1420, !llvm.loop !1421

for.cond203.1:                                    ; preds = %for.cond203, %for.body207.1
  %i202.0.1 = phi i32 [ %inc222.1, %for.body207.1 ], [ 0, %for.cond203 ], !dbg !1400
    #dbg_value(i32 %i202.0.1, !1406, !DIExpression(), !1407)
  %exitcond11.1.not = icmp eq i32 %i202.0.1, %indvars.iv, !dbg !1408
  br i1 %exitcond11.1.not, label %for.cond203.2, label %for.body207.1, !dbg !1410

for.body207.1:                                    ; preds = %for.cond203.1
  %div209.1 = mul nuw nsw i32 %r192.0, 5, !dbg !1411
  %add210.1 = add nuw nsw i32 %div209.1, 16, !dbg !1423
  %add211.1 = add nuw nsw i32 %add210.1, %i202.0.1, !dbg !1413
  %arrayidx212.1 = getelementptr inbounds nuw [640 x i64], ptr %A, i32 0, i32 %add211.1, !dbg !1414
  %add213.1 = add nuw nsw i32 %r192.0, %i202.0.1, !dbg !1415
  %mul214.1 = mul nuw nsw i32 %add213.1, 69, !dbg !1416
  %add.ptr215.1 = getelementptr inbounds nuw i8, ptr %A_out, i32 %mul214.1, !dbg !1417
  %add.ptr216.1 = getelementptr inbounds nuw i8, ptr %add.ptr215.1, i32 16, !dbg !1424
  call fastcc void @decode(ptr noundef nonnull %arrayidx212.1, ptr noundef nonnull %add.ptr216.1, i32 noundef 16) #6, !dbg !1418
  %inc222.1 = add nuw nsw i32 %i202.0.1, 1, !dbg !1419
    #dbg_value(i32 %inc222.1, !1406, !DIExpression(), !1407)
  br label %for.cond203.1, !dbg !1420, !llvm.loop !1421

for.cond203.2:                                    ; preds = %for.cond203.1, %for.body207.2
  %i202.0.2 = phi i32 [ %inc222.2, %for.body207.2 ], [ 0, %for.cond203.1 ], !dbg !1400
    #dbg_value(i32 %i202.0.2, !1406, !DIExpression(), !1407)
  %exitcond11.2.not = icmp eq i32 %i202.0.2, %indvars.iv, !dbg !1408
  br i1 %exitcond11.2.not, label %for.cond203.3, label %for.body207.2, !dbg !1410

for.body207.2:                                    ; preds = %for.cond203.2
  %div209.2 = mul nuw nsw i32 %r192.0, 5, !dbg !1411
  %add210.2 = add nuw nsw i32 %div209.2, 32, !dbg !1423
  %add211.2 = add nuw nsw i32 %add210.2, %i202.0.2, !dbg !1413
  %arrayidx212.2 = getelementptr inbounds nuw [640 x i64], ptr %A, i32 0, i32 %add211.2, !dbg !1414
  %add213.2 = add nuw nsw i32 %r192.0, %i202.0.2, !dbg !1415
  %mul214.2 = mul nuw nsw i32 %add213.2, 69, !dbg !1416
  %add.ptr215.2 = getelementptr inbounds nuw i8, ptr %A_out, i32 %mul214.2, !dbg !1417
  %add.ptr216.2 = getelementptr inbounds nuw i8, ptr %add.ptr215.2, i32 32, !dbg !1424
  call fastcc void @decode(ptr noundef nonnull %arrayidx212.2, ptr noundef nonnull %add.ptr216.2, i32 noundef 16) #6, !dbg !1418
  %inc222.2 = add nuw nsw i32 %i202.0.2, 1, !dbg !1419
    #dbg_value(i32 %inc222.2, !1406, !DIExpression(), !1407)
  br label %for.cond203.2, !dbg !1420, !llvm.loop !1421

for.cond203.3:                                    ; preds = %for.cond203.2, %for.body207.3
  %i202.0.3 = phi i32 [ %inc222.3, %for.body207.3 ], [ 0, %for.cond203.2 ], !dbg !1400
    #dbg_value(i32 %i202.0.3, !1406, !DIExpression(), !1407)
  %exitcond11.3.not = icmp eq i32 %i202.0.3, %indvars.iv, !dbg !1408
  br i1 %exitcond11.3.not, label %for.cond203.4, label %for.body207.3, !dbg !1410

for.body207.3:                                    ; preds = %for.cond203.3
  %div209.3 = mul nuw nsw i32 %r192.0, 5, !dbg !1411
  %add210.3 = add nuw nsw i32 %div209.3, 48, !dbg !1423
  %add211.3 = add nuw nsw i32 %add210.3, %i202.0.3, !dbg !1413
  %arrayidx212.3 = getelementptr inbounds nuw [640 x i64], ptr %A, i32 0, i32 %add211.3, !dbg !1414
  %add213.3 = add nuw nsw i32 %r192.0, %i202.0.3, !dbg !1415
  %mul214.3 = mul nuw nsw i32 %add213.3, 69, !dbg !1416
  %add.ptr215.3 = getelementptr inbounds nuw i8, ptr %A_out, i32 %mul214.3, !dbg !1417
  %add.ptr216.3 = getelementptr inbounds nuw i8, ptr %add.ptr215.3, i32 48, !dbg !1424
  call fastcc void @decode(ptr noundef nonnull %arrayidx212.3, ptr noundef nonnull %add.ptr216.3, i32 noundef 16) #6, !dbg !1418
  %inc222.3 = add nuw nsw i32 %i202.0.3, 1, !dbg !1419
    #dbg_value(i32 %inc222.3, !1406, !DIExpression(), !1407)
  br label %for.cond203.3, !dbg !1420, !llvm.loop !1421

for.cond203.4:                                    ; preds = %for.cond203.3, %for.body207.4
  %i202.0.4 = phi i32 [ %inc222.4, %for.body207.4 ], [ 0, %for.cond203.3 ], !dbg !1400
    #dbg_value(i32 %i202.0.4, !1406, !DIExpression(), !1407)
  %exitcond11.4.not = icmp eq i32 %i202.0.4, %indvars.iv, !dbg !1408
  br i1 %exitcond11.4.not, label %for.inc227, label %for.body207.4, !dbg !1410

for.body207.4:                                    ; preds = %for.cond203.4
  %div209.4 = mul nuw nsw i32 %r192.0, 5, !dbg !1411
  %add210.4 = add nuw nsw i32 %div209.4, 64, !dbg !1423
  %add211.4 = add nuw nsw i32 %add210.4, %i202.0.4, !dbg !1413
  %arrayidx212.4 = getelementptr inbounds nuw [640 x i64], ptr %A, i32 0, i32 %add211.4, !dbg !1414
  %add213.4 = add nuw nsw i32 %r192.0, %i202.0.4, !dbg !1415
  %mul214.4 = mul nuw nsw i32 %add213.4, 69, !dbg !1416
  %add.ptr215.4 = getelementptr inbounds nuw i8, ptr %A_out, i32 %mul214.4, !dbg !1417
  %add.ptr216.4 = getelementptr inbounds nuw i8, ptr %add.ptr215.4, i32 64, !dbg !1424
  call fastcc void @decode(ptr noundef nonnull %arrayidx212.4, ptr noundef nonnull %add.ptr216.4, i32 noundef 4) #6, !dbg !1418
  %inc222.4 = add nuw nsw i32 %i202.0.4, 1, !dbg !1419
    #dbg_value(i32 %inc222.4, !1406, !DIExpression(), !1407)
  br label %for.cond203.4, !dbg !1420, !llvm.loop !1421

for.inc227:                                       ; preds = %for.cond203.4
    #dbg_value(i32 80, !1425, !DIExpression(), !1426)
  %add228 = add nuw nsw i32 %r192.0, 16, !dbg !1427
    #dbg_value(i32 %add228, !1395, !DIExpression(), !1396)
  %indvars.iv.next = add nsw i32 %indvars.iv, -16, !dbg !1428
  br label %for.cond193, !dbg !1428, !llvm.loop !1429

for.end229:                                       ; preds = %for.cond193
  ret void, !dbg !1431
}

declare dso_local ptr @memset(ptr noundef, i32 noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: nounwind
define internal fastcc void @mat_mul(ptr noundef %a, ptr noundef %b, ptr noundef %c, i32 noundef %colrow_ab, i32 noundef %row_a, i32 noundef %col_b) unnamed_addr #0 !dbg !1432 {
entry:
    #dbg_value(ptr %a, !1435, !DIExpression(), !1436)
    #dbg_value(ptr %b, !1437, !DIExpression(), !1436)
    #dbg_value(ptr %c, !1438, !DIExpression(), !1436)
    #dbg_value(i32 %colrow_ab, !1439, !DIExpression(), !1436)
    #dbg_value(i32 %row_a, !1440, !DIExpression(), !1436)
    #dbg_value(i32 %col_b, !1441, !DIExpression(), !1436)
    #dbg_value(i32 0, !1442, !DIExpression(), !1444)
  %smax = call i32 @llvm.smax.i32(i32 %col_b, i32 0), !dbg !1445
  %smax1 = call i32 @llvm.smax.i32(i32 %row_a, i32 0), !dbg !1445
  br label %for.cond, !dbg !1445

for.cond:                                         ; preds = %for.inc4, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc5, %for.inc4 ], !dbg !1446
  %c.addr.0 = phi ptr [ %c, %entry ], [ %c.addr.1, %for.inc4 ]
  %a.addr.0 = phi ptr [ %a, %entry ], [ %add.ptr6, %for.inc4 ]
    #dbg_value(ptr %a.addr.0, !1435, !DIExpression(), !1436)
    #dbg_value(ptr %c.addr.0, !1438, !DIExpression(), !1436)
    #dbg_value(i32 %i.0, !1442, !DIExpression(), !1444)
  %exitcond2.not = icmp eq i32 %i.0, %smax1, !dbg !1447
  br i1 %exitcond2.not, label %for.end7, label %for.cond1, !dbg !1449

for.cond1:                                        ; preds = %for.cond, %for.body3
  %c.addr.1 = phi ptr [ %incdec.ptr, %for.body3 ], [ %c.addr.0, %for.cond ]
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond ], !dbg !1450
    #dbg_value(i32 %j.0, !1453, !DIExpression(), !1454)
    #dbg_value(ptr %c.addr.1, !1438, !DIExpression(), !1436)
  %exitcond.not = icmp eq i32 %j.0, %smax, !dbg !1455
  br i1 %exitcond.not, label %for.inc4, label %for.body3, !dbg !1457

for.body3:                                        ; preds = %for.cond1
  %add.ptr = getelementptr inbounds nuw i8, ptr %b, i32 %j.0, !dbg !1458
  %call = call fastcc zeroext i8 @lincomb(ptr noundef %a.addr.0, ptr noundef %add.ptr, i32 noundef %colrow_ab, i32 noundef %col_b) #6, !dbg !1460
  store i8 %call, ptr %c.addr.1, align 1, !dbg !1461
  %inc = add nuw i32 %j.0, 1, !dbg !1462
    #dbg_value(i32 %inc, !1453, !DIExpression(), !1454)
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %c.addr.1, i32 1, !dbg !1463
    #dbg_value(ptr %incdec.ptr, !1438, !DIExpression(), !1436)
  br label %for.cond1, !dbg !1464, !llvm.loop !1465

for.inc4:                                         ; preds = %for.cond1
  %inc5 = add nuw i32 %i.0, 1, !dbg !1467
    #dbg_value(i32 %inc5, !1442, !DIExpression(), !1444)
  %add.ptr6 = getelementptr inbounds i8, ptr %a.addr.0, i32 %colrow_ab, !dbg !1468
    #dbg_value(ptr %add.ptr6, !1435, !DIExpression(), !1436)
  br label %for.cond, !dbg !1469, !llvm.loop !1470

for.end7:                                         ; preds = %for.cond
  %cmp8 = icmp eq i32 %row_a, %col_b, !dbg !1472
  %call9 = call zeroext i1 @assert(i1 noundef zeroext %cmp8) #8, !dbg !1473
  ret void, !dbg !1474
}

; Function Attrs: nounwind
define internal fastcc void @mat_add(ptr noundef %a, ptr noundef %b, ptr noundef %c, i32 noundef %m, i32 noundef %n) unnamed_addr #0 !dbg !1475 {
entry:
    #dbg_value(ptr %a, !1478, !DIExpression(), !1479)
    #dbg_value(ptr %b, !1480, !DIExpression(), !1479)
    #dbg_value(ptr %c, !1481, !DIExpression(), !1479)
    #dbg_value(i32 %m, !1482, !DIExpression(), !1479)
    #dbg_value(i32 %n, !1483, !DIExpression(), !1479)
    #dbg_value(i32 0, !1484, !DIExpression(), !1486)
  %smax = call i32 @llvm.smax.i32(i32 %n, i32 0), !dbg !1487
  %smax1 = call i32 @llvm.smax.i32(i32 %m, i32 0), !dbg !1487
  br label %for.cond, !dbg !1487

for.cond:                                         ; preds = %for.inc11, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc12, %for.inc11 ], !dbg !1488
    #dbg_value(i32 %i.0, !1484, !DIExpression(), !1486)
  %exitcond2.not = icmp eq i32 %i.0, %smax1, !dbg !1489
  br i1 %exitcond2.not, label %for.end13, label %for.cond1, !dbg !1491

for.cond1:                                        ; preds = %for.cond, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond ], !dbg !1492
    #dbg_value(i32 %j.0, !1495, !DIExpression(), !1496)
  %exitcond.not = icmp eq i32 %j.0, %smax, !dbg !1497
  br i1 %exitcond.not, label %for.inc11, label %for.body3, !dbg !1499

for.body3:                                        ; preds = %for.cond1
  %mul = mul nsw i32 %i.0, %n, !dbg !1500
  %add.ptr = getelementptr inbounds i8, ptr %a, i32 %mul, !dbg !1502
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %j.0, !dbg !1503
  %0 = load i8, ptr %add.ptr4, align 1, !dbg !1504
  %mul5 = mul nsw i32 %i.0, %n, !dbg !1505
  %add.ptr6 = getelementptr inbounds i8, ptr %b, i32 %mul5, !dbg !1506
  %add.ptr7 = getelementptr inbounds nuw i8, ptr %add.ptr6, i32 %j.0, !dbg !1507
  %1 = load i8, ptr %add.ptr7, align 1, !dbg !1508
  %call = call fastcc zeroext i8 @add_f(i8 noundef zeroext %0, i8 noundef zeroext %1) #6, !dbg !1509
  %mul8 = mul nsw i32 %i.0, %n, !dbg !1510
  %add.ptr9 = getelementptr inbounds i8, ptr %c, i32 %mul8, !dbg !1511
  %add.ptr10 = getelementptr inbounds nuw i8, ptr %add.ptr9, i32 %j.0, !dbg !1512
  store i8 %call, ptr %add.ptr10, align 1, !dbg !1513
  %inc = add nuw i32 %j.0, 1, !dbg !1514
    #dbg_value(i32 %inc, !1495, !DIExpression(), !1496)
  br label %for.cond1, !dbg !1515, !llvm.loop !1516

for.inc11:                                        ; preds = %for.cond1
  %inc12 = add nuw i32 %i.0, 1, !dbg !1518
    #dbg_value(i32 %inc12, !1484, !DIExpression(), !1486)
  br label %for.cond, !dbg !1519, !llvm.loop !1520

for.end13:                                        ; preds = %for.cond
  ret void, !dbg !1522
}

; Function Attrs: nounwind
define internal fastcc void @encode(ptr noundef %m, ptr noundef %menc, i32 noundef %mlen) unnamed_addr #0 !dbg !1523 {
entry:
    #dbg_value(ptr %m, !1524, !DIExpression(), !1525)
    #dbg_value(ptr %menc, !1526, !DIExpression(), !1525)
    #dbg_value(i32 %mlen, !1527, !DIExpression(), !1525)
    #dbg_value(i32 0, !1528, !DIExpression(), !1525)
  br label %for.cond, !dbg !1529

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1531
  %m.addr.0 = phi ptr [ %m, %entry ], [ %add.ptr3, %for.body ]
    #dbg_value(ptr %m.addr.0, !1524, !DIExpression(), !1525)
    #dbg_value(i32 %i.0, !1528, !DIExpression(), !1525)
  %div = sdiv i32 %mlen, 2, !dbg !1532
  %cmp = icmp slt i32 %i.0, %div, !dbg !1534
  br i1 %cmp, label %for.body, label %for.end, !dbg !1535

for.body:                                         ; preds = %for.cond
  %0 = load i8, ptr %m.addr.0, align 1, !dbg !1536
  %add.ptr = getelementptr inbounds nuw i8, ptr %m.addr.0, i32 1, !dbg !1538
  %1 = load i8, ptr %add.ptr, align 1, !dbg !1539
  %shl = shl i8 %1, 4, !dbg !1540
  %or = or i8 %shl, %0, !dbg !1541
  %arrayidx = getelementptr inbounds nuw i8, ptr %menc, i32 %i.0, !dbg !1542
  store i8 %or, ptr %arrayidx, align 1, !dbg !1543
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1544
    #dbg_value(i32 %inc, !1528, !DIExpression(), !1525)
  %add.ptr3 = getelementptr inbounds nuw i8, ptr %m.addr.0, i32 2, !dbg !1545
    #dbg_value(ptr %add.ptr3, !1524, !DIExpression(), !1525)
  br label %for.cond, !dbg !1546, !llvm.loop !1547

for.end:                                          ; preds = %for.cond
  %2 = and i32 %mlen, -2147483647, !dbg !1549
  %cmp4 = icmp eq i32 %2, 1, !dbg !1549
  br i1 %cmp4, label %if.then, label %if.end, !dbg !1549

if.then:                                          ; preds = %for.end
  %3 = load i8, ptr %m.addr.0, align 1, !dbg !1551
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %menc, i32 %i.0, !dbg !1553
  store i8 %3, ptr %arrayidx6, align 1, !dbg !1554
  br label %if.end, !dbg !1555

if.end:                                           ; preds = %if.then, %for.end
  ret void, !dbg !1556
}

; Function Attrs: nounwind
define internal fastcc zeroext i8 @add_f(i8 noundef zeroext %a, i8 noundef zeroext %b) unnamed_addr #0 !dbg !1557 {
entry:
    #dbg_value(i8 %a, !1560, !DIExpression(), !1561)
    #dbg_value(i8 %b, !1562, !DIExpression(), !1561)
  %xor1 = xor i8 %a, %b, !dbg !1563
  ret i8 %xor1, !dbg !1564
}

; Function Attrs: nounwind
define internal fastcc zeroext i8 @lincomb(ptr noundef %a, ptr noundef %b, i32 noundef %n, i32 noundef %m) unnamed_addr #0 !dbg !1565 {
entry:
    #dbg_value(ptr %a, !1568, !DIExpression(), !1569)
    #dbg_value(ptr %b, !1570, !DIExpression(), !1569)
    #dbg_value(i32 %n, !1571, !DIExpression(), !1569)
    #dbg_value(i32 %m, !1572, !DIExpression(), !1569)
    #dbg_value(i8 0, !1573, !DIExpression(), !1569)
    #dbg_value(i32 0, !1574, !DIExpression(), !1576)
  %smax = call i32 @llvm.smax.i32(i32 %n, i32 0), !dbg !1577
  br label %for.cond, !dbg !1577

for.cond:                                         ; preds = %for.body, %entry
  %ret.0 = phi i8 [ 0, %entry ], [ %call1, %for.body ], !dbg !1569
  %b.addr.0 = phi ptr [ %b, %entry ], [ %add.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1578
    #dbg_value(i32 %i.0, !1574, !DIExpression(), !1576)
    #dbg_value(ptr %b.addr.0, !1570, !DIExpression(), !1569)
    #dbg_value(i8 %ret.0, !1573, !DIExpression(), !1569)
  %exitcond.not = icmp eq i32 %i.0, %smax, !dbg !1579
  br i1 %exitcond.not, label %for.end, label %for.body, !dbg !1581

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %i.0, !dbg !1582
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1582
  %1 = load i8, ptr %b.addr.0, align 1, !dbg !1584
  %call = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %0, i8 noundef zeroext %1) #6, !dbg !1585
  %call1 = call fastcc zeroext i8 @add_f(i8 noundef zeroext %call, i8 noundef zeroext %ret.0) #6, !dbg !1586
    #dbg_value(i8 %call1, !1573, !DIExpression(), !1569)
  %inc = add nuw i32 %i.0, 1, !dbg !1587
    #dbg_value(i32 %inc, !1574, !DIExpression(), !1576)
  %add.ptr = getelementptr inbounds i8, ptr %b.addr.0, i32 %m, !dbg !1588
    #dbg_value(ptr %add.ptr, !1570, !DIExpression(), !1569)
  br label %for.cond, !dbg !1589, !llvm.loop !1590

for.end:                                          ; preds = %for.cond
  ret i8 %ret.0, !dbg !1592
}

declare dso_local zeroext i1 @assert(i1 noundef zeroext) local_unnamed_addr #4

; Function Attrs: nounwind
define internal fastcc zeroext range(i8 0, 16) i8 @mul_f(i8 noundef zeroext %a, i8 noundef zeroext %b) unnamed_addr #0 !dbg !1593 {
entry:
    #dbg_value(i8 %a, !1594, !DIExpression(), !1595)
    #dbg_value(i8 %b, !1596, !DIExpression(), !1595)
  %0 = load volatile i8, ptr @pqmayo_MAYO_2_ref_unsigned_char_blocker, align 1, !dbg !1597
  %xor1 = xor i8 %a, %0, !dbg !1598
    #dbg_value(i8 %xor1, !1594, !DIExpression(), !1595)
  %1 = trunc i8 %xor1 to i1, !dbg !1599
    #dbg_value(i8 poison, !1600, !DIExpression(), !1595)
  %2 = and i8 %xor1, 2, !dbg !1601
  %mul9 = mul i8 %2, %b, !dbg !1602
  %conv10 = select i1 %1, i8 %b, i8 0, !dbg !1599
  %xor11 = xor i8 %conv10, %mul9, !dbg !1603
    #dbg_value(i8 %xor11, !1600, !DIExpression(), !1595)
  %3 = and i8 %xor1, 4, !dbg !1604
  %mul16 = mul i8 %3, %b, !dbg !1605
  %xor18 = xor i8 %mul16, %xor11, !dbg !1606
    #dbg_value(i8 %xor18, !1600, !DIExpression(), !1595)
  %4 = and i8 %xor1, 8, !dbg !1607
  %mul23 = mul i8 %4, %b, !dbg !1608
  %xor25 = xor i8 %mul23, %xor18, !dbg !1609
    #dbg_value(i8 %xor25, !1600, !DIExpression(), !1595)
    #dbg_value(i8 %xor25, !1610, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !1595)
  %5 = lshr i8 %xor25, 4, !dbg !1611
  %6 = lshr i8 %xor25, 3, !dbg !1612
  %7 = and i8 %6, 14, !dbg !1612
  %8 = xor i8 %5, %7, !dbg !1613
  %xor25.masked = and i8 %xor25, 15, !dbg !1614
  %9 = xor i8 %8, %xor25.masked, !dbg !1614
    #dbg_value(i8 %9, !1615, !DIExpression(), !1595)
  ret i8 %9, !dbg !1616
}

; Function Attrs: nounwind
define internal fastcc void @transpose_16x16_nibbles(ptr noundef %M) unnamed_addr #0 !dbg !67 {
entry:
    #dbg_value(ptr %M, !1617, !DIExpression(), !1618)
    #dbg_value(i32 0, !1619, !DIExpression(), !1621)
    #dbg_value(i32 0, !1619, !DIExpression(), !1621)
  %0 = load i64, ptr %M, align 8, !dbg !1622
  %shr = lshr i64 %0, 4, !dbg !1625
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %M, i32 8, !dbg !1626
  %1 = load i64, ptr %arrayidx1, align 8, !dbg !1626
  %xor = xor i64 %shr, %1, !dbg !1627
  %and = and i64 %xor, 1085102592571150095, !dbg !1628
    #dbg_value(i64 %and, !1629, !DIExpression(), !1630)
  %shl = shl nuw i64 %and, 4, !dbg !1631
  %2 = load i64, ptr %M, align 8, !dbg !1632
  %xor3 = xor i64 %2, %shl, !dbg !1632
  store i64 %xor3, ptr %M, align 8, !dbg !1632
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %M, i32 8, !dbg !1633
  %3 = load i64, ptr %arrayidx5, align 8, !dbg !1634
  %xor6 = xor i64 %3, %and, !dbg !1634
  store i64 %xor6, ptr %arrayidx5, align 8, !dbg !1634
    #dbg_value(i32 2, !1619, !DIExpression(), !1621)
  %arrayidx.1 = getelementptr inbounds nuw i8, ptr %M, i32 16, !dbg !1622
  %4 = load i64, ptr %arrayidx.1, align 8, !dbg !1622
  %shr.1 = lshr i64 %4, 4, !dbg !1625
  %arrayidx1.1 = getelementptr inbounds nuw i8, ptr %M, i32 24, !dbg !1626
  %5 = load i64, ptr %arrayidx1.1, align 8, !dbg !1626
  %xor.1 = xor i64 %shr.1, %5, !dbg !1627
  %and.1 = and i64 %xor.1, 1085102592571150095, !dbg !1628
    #dbg_value(i64 %and.1, !1629, !DIExpression(), !1630)
  %shl.1 = shl nuw i64 %and.1, 4, !dbg !1631
  %arrayidx2.1 = getelementptr inbounds nuw i8, ptr %M, i32 16, !dbg !1635
  %6 = load i64, ptr %arrayidx2.1, align 8, !dbg !1632
  %xor3.1 = xor i64 %6, %shl.1, !dbg !1632
  store i64 %xor3.1, ptr %arrayidx2.1, align 8, !dbg !1632
  %arrayidx5.1 = getelementptr inbounds nuw i8, ptr %M, i32 24, !dbg !1633
  %7 = load i64, ptr %arrayidx5.1, align 8, !dbg !1634
  %xor6.1 = xor i64 %7, %and.1, !dbg !1634
  store i64 %xor6.1, ptr %arrayidx5.1, align 8, !dbg !1634
    #dbg_value(i32 4, !1619, !DIExpression(), !1621)
  %arrayidx.2 = getelementptr inbounds nuw i8, ptr %M, i32 32, !dbg !1622
  %8 = load i64, ptr %arrayidx.2, align 8, !dbg !1622
  %shr.2 = lshr i64 %8, 4, !dbg !1625
  %arrayidx1.2 = getelementptr inbounds nuw i8, ptr %M, i32 40, !dbg !1626
  %9 = load i64, ptr %arrayidx1.2, align 8, !dbg !1626
  %xor.2 = xor i64 %shr.2, %9, !dbg !1627
  %and.2 = and i64 %xor.2, 1085102592571150095, !dbg !1628
    #dbg_value(i64 %and.2, !1629, !DIExpression(), !1630)
  %shl.2 = shl nuw i64 %and.2, 4, !dbg !1631
  %arrayidx2.2 = getelementptr inbounds nuw i8, ptr %M, i32 32, !dbg !1635
  %10 = load i64, ptr %arrayidx2.2, align 8, !dbg !1632
  %xor3.2 = xor i64 %10, %shl.2, !dbg !1632
  store i64 %xor3.2, ptr %arrayidx2.2, align 8, !dbg !1632
  %arrayidx5.2 = getelementptr inbounds nuw i8, ptr %M, i32 40, !dbg !1633
  %11 = load i64, ptr %arrayidx5.2, align 8, !dbg !1634
  %xor6.2 = xor i64 %11, %and.2, !dbg !1634
  store i64 %xor6.2, ptr %arrayidx5.2, align 8, !dbg !1634
    #dbg_value(i32 6, !1619, !DIExpression(), !1621)
  %arrayidx.3 = getelementptr inbounds nuw i8, ptr %M, i32 48, !dbg !1622
  %12 = load i64, ptr %arrayidx.3, align 8, !dbg !1622
  %shr.3 = lshr i64 %12, 4, !dbg !1625
  %arrayidx1.3 = getelementptr inbounds nuw i8, ptr %M, i32 56, !dbg !1626
  %13 = load i64, ptr %arrayidx1.3, align 8, !dbg !1626
  %xor.3 = xor i64 %shr.3, %13, !dbg !1627
  %and.3 = and i64 %xor.3, 1085102592571150095, !dbg !1628
    #dbg_value(i64 %and.3, !1629, !DIExpression(), !1630)
  %shl.3 = shl nuw i64 %and.3, 4, !dbg !1631
  %arrayidx2.3 = getelementptr inbounds nuw i8, ptr %M, i32 48, !dbg !1635
  %14 = load i64, ptr %arrayidx2.3, align 8, !dbg !1632
  %xor3.3 = xor i64 %14, %shl.3, !dbg !1632
  store i64 %xor3.3, ptr %arrayidx2.3, align 8, !dbg !1632
  %arrayidx5.3 = getelementptr inbounds nuw i8, ptr %M, i32 56, !dbg !1633
  %15 = load i64, ptr %arrayidx5.3, align 8, !dbg !1634
  %xor6.3 = xor i64 %15, %and.3, !dbg !1634
  store i64 %xor6.3, ptr %arrayidx5.3, align 8, !dbg !1634
    #dbg_value(i32 8, !1619, !DIExpression(), !1621)
  %arrayidx.4 = getelementptr inbounds nuw i8, ptr %M, i32 64, !dbg !1622
  %16 = load i64, ptr %arrayidx.4, align 8, !dbg !1622
  %shr.4 = lshr i64 %16, 4, !dbg !1625
  %arrayidx1.4 = getelementptr inbounds nuw i8, ptr %M, i32 72, !dbg !1626
  %17 = load i64, ptr %arrayidx1.4, align 8, !dbg !1626
  %xor.4 = xor i64 %shr.4, %17, !dbg !1627
  %and.4 = and i64 %xor.4, 1085102592571150095, !dbg !1628
    #dbg_value(i64 %and.4, !1629, !DIExpression(), !1630)
  %shl.4 = shl nuw i64 %and.4, 4, !dbg !1631
  %arrayidx2.4 = getelementptr inbounds nuw i8, ptr %M, i32 64, !dbg !1635
  %18 = load i64, ptr %arrayidx2.4, align 8, !dbg !1632
  %xor3.4 = xor i64 %18, %shl.4, !dbg !1632
  store i64 %xor3.4, ptr %arrayidx2.4, align 8, !dbg !1632
  %arrayidx5.4 = getelementptr inbounds nuw i8, ptr %M, i32 72, !dbg !1633
  %19 = load i64, ptr %arrayidx5.4, align 8, !dbg !1634
  %xor6.4 = xor i64 %19, %and.4, !dbg !1634
  store i64 %xor6.4, ptr %arrayidx5.4, align 8, !dbg !1634
    #dbg_value(i32 10, !1619, !DIExpression(), !1621)
  %arrayidx.5 = getelementptr inbounds nuw i8, ptr %M, i32 80, !dbg !1622
  %20 = load i64, ptr %arrayidx.5, align 8, !dbg !1622
  %shr.5 = lshr i64 %20, 4, !dbg !1625
  %arrayidx1.5 = getelementptr inbounds nuw i8, ptr %M, i32 88, !dbg !1626
  %21 = load i64, ptr %arrayidx1.5, align 8, !dbg !1626
  %xor.5 = xor i64 %shr.5, %21, !dbg !1627
  %and.5 = and i64 %xor.5, 1085102592571150095, !dbg !1628
    #dbg_value(i64 %and.5, !1629, !DIExpression(), !1630)
  %shl.5 = shl nuw i64 %and.5, 4, !dbg !1631
  %arrayidx2.5 = getelementptr inbounds nuw i8, ptr %M, i32 80, !dbg !1635
  %22 = load i64, ptr %arrayidx2.5, align 8, !dbg !1632
  %xor3.5 = xor i64 %22, %shl.5, !dbg !1632
  store i64 %xor3.5, ptr %arrayidx2.5, align 8, !dbg !1632
  %arrayidx5.5 = getelementptr inbounds nuw i8, ptr %M, i32 88, !dbg !1633
  %23 = load i64, ptr %arrayidx5.5, align 8, !dbg !1634
  %xor6.5 = xor i64 %23, %and.5, !dbg !1634
  store i64 %xor6.5, ptr %arrayidx5.5, align 8, !dbg !1634
    #dbg_value(i32 12, !1619, !DIExpression(), !1621)
  %arrayidx.6 = getelementptr inbounds nuw i8, ptr %M, i32 96, !dbg !1622
  %24 = load i64, ptr %arrayidx.6, align 8, !dbg !1622
  %shr.6 = lshr i64 %24, 4, !dbg !1625
  %arrayidx1.6 = getelementptr inbounds nuw i8, ptr %M, i32 104, !dbg !1626
  %25 = load i64, ptr %arrayidx1.6, align 8, !dbg !1626
  %xor.6 = xor i64 %shr.6, %25, !dbg !1627
  %and.6 = and i64 %xor.6, 1085102592571150095, !dbg !1628
    #dbg_value(i64 %and.6, !1629, !DIExpression(), !1630)
  %shl.6 = shl nuw i64 %and.6, 4, !dbg !1631
  %arrayidx2.6 = getelementptr inbounds nuw i8, ptr %M, i32 96, !dbg !1635
  %26 = load i64, ptr %arrayidx2.6, align 8, !dbg !1632
  %xor3.6 = xor i64 %26, %shl.6, !dbg !1632
  store i64 %xor3.6, ptr %arrayidx2.6, align 8, !dbg !1632
  %arrayidx5.6 = getelementptr inbounds nuw i8, ptr %M, i32 104, !dbg !1633
  %27 = load i64, ptr %arrayidx5.6, align 8, !dbg !1634
  %xor6.6 = xor i64 %27, %and.6, !dbg !1634
  store i64 %xor6.6, ptr %arrayidx5.6, align 8, !dbg !1634
    #dbg_value(i32 14, !1619, !DIExpression(), !1621)
  %arrayidx.7 = getelementptr inbounds nuw i8, ptr %M, i32 112, !dbg !1622
  %28 = load i64, ptr %arrayidx.7, align 8, !dbg !1622
  %shr.7 = lshr i64 %28, 4, !dbg !1625
  %arrayidx1.7 = getelementptr inbounds nuw i8, ptr %M, i32 120, !dbg !1626
  %29 = load i64, ptr %arrayidx1.7, align 8, !dbg !1626
  %xor.7 = xor i64 %shr.7, %29, !dbg !1627
  %and.7 = and i64 %xor.7, 1085102592571150095, !dbg !1628
    #dbg_value(i64 %and.7, !1629, !DIExpression(), !1630)
  %shl.7 = shl nuw i64 %and.7, 4, !dbg !1631
  %arrayidx2.7 = getelementptr inbounds nuw i8, ptr %M, i32 112, !dbg !1635
  %30 = load i64, ptr %arrayidx2.7, align 8, !dbg !1632
  %xor3.7 = xor i64 %30, %shl.7, !dbg !1632
  store i64 %xor3.7, ptr %arrayidx2.7, align 8, !dbg !1632
  %arrayidx5.7 = getelementptr inbounds nuw i8, ptr %M, i32 120, !dbg !1633
  %31 = load i64, ptr %arrayidx5.7, align 8, !dbg !1634
  %xor6.7 = xor i64 %31, %and.7, !dbg !1634
  store i64 %xor6.7, ptr %arrayidx5.7, align 8, !dbg !1634
    #dbg_value(i32 16, !1619, !DIExpression(), !1621)
    #dbg_value(i32 0, !1636, !DIExpression(), !1638)
  %32 = load i64, ptr %M, align 8, !dbg !1639
  %shr13 = lshr i64 %32, 8, !dbg !1642
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %M, i32 16, !dbg !1643
  %33 = load i64, ptr %arrayidx15, align 8, !dbg !1643
  %xor16 = xor i64 %shr13, %33, !dbg !1644
  %and17 = and i64 %xor16, 71777214294589695, !dbg !1645
    #dbg_value(i64 %and17, !1646, !DIExpression(), !1647)
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %M, i32 8, !dbg !1648
  %34 = load i64, ptr %arrayidx19, align 8, !dbg !1648
  %shr20 = lshr i64 %34, 8, !dbg !1649
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %M, i32 24, !dbg !1650
  %35 = load i64, ptr %arrayidx22, align 8, !dbg !1650
  %xor23 = xor i64 %shr20, %35, !dbg !1651
  %and24 = and i64 %xor23, 71777214294589695, !dbg !1652
    #dbg_value(i64 %and24, !1653, !DIExpression(), !1647)
  %shl25 = shl nuw i64 %and17, 8, !dbg !1654
  %36 = load i64, ptr %M, align 8, !dbg !1655
  %xor27 = xor i64 %36, %shl25, !dbg !1655
  store i64 %xor27, ptr %M, align 8, !dbg !1655
  %shl28 = shl nuw i64 %and24, 8, !dbg !1656
  %arrayidx30 = getelementptr inbounds nuw i8, ptr %M, i32 8, !dbg !1657
  %37 = load i64, ptr %arrayidx30, align 8, !dbg !1658
  %xor31 = xor i64 %37, %shl28, !dbg !1658
  store i64 %xor31, ptr %arrayidx30, align 8, !dbg !1658
  %arrayidx33 = getelementptr inbounds nuw i8, ptr %M, i32 16, !dbg !1659
  %38 = load i64, ptr %arrayidx33, align 8, !dbg !1660
  %xor34 = xor i64 %38, %and17, !dbg !1660
  store i64 %xor34, ptr %arrayidx33, align 8, !dbg !1660
  %arrayidx36 = getelementptr inbounds nuw i8, ptr %M, i32 24, !dbg !1661
  %39 = load i64, ptr %arrayidx36, align 8, !dbg !1662
  %xor37 = xor i64 %39, %and24, !dbg !1662
  store i64 %xor37, ptr %arrayidx36, align 8, !dbg !1662
    #dbg_value(i32 4, !1636, !DIExpression(), !1638)
  %arrayidx12.1 = getelementptr inbounds nuw i8, ptr %M, i32 32, !dbg !1639
  %40 = load i64, ptr %arrayidx12.1, align 8, !dbg !1639
  %shr13.1 = lshr i64 %40, 8, !dbg !1642
  %arrayidx15.1 = getelementptr inbounds nuw i8, ptr %M, i32 48, !dbg !1643
  %41 = load i64, ptr %arrayidx15.1, align 8, !dbg !1643
  %xor16.1 = xor i64 %shr13.1, %41, !dbg !1644
  %and17.1 = and i64 %xor16.1, 71777214294589695, !dbg !1645
    #dbg_value(i64 %and17.1, !1646, !DIExpression(), !1647)
  %arrayidx19.1 = getelementptr inbounds nuw i8, ptr %M, i32 40, !dbg !1648
  %42 = load i64, ptr %arrayidx19.1, align 8, !dbg !1648
  %shr20.1 = lshr i64 %42, 8, !dbg !1649
  %arrayidx22.1 = getelementptr inbounds nuw i8, ptr %M, i32 56, !dbg !1650
  %43 = load i64, ptr %arrayidx22.1, align 8, !dbg !1650
  %xor23.1 = xor i64 %shr20.1, %43, !dbg !1651
  %and24.1 = and i64 %xor23.1, 71777214294589695, !dbg !1652
    #dbg_value(i64 %and24.1, !1653, !DIExpression(), !1647)
  %shl25.1 = shl nuw i64 %and17.1, 8, !dbg !1654
  %arrayidx26.1 = getelementptr inbounds nuw i8, ptr %M, i32 32, !dbg !1663
  %44 = load i64, ptr %arrayidx26.1, align 8, !dbg !1655
  %xor27.1 = xor i64 %44, %shl25.1, !dbg !1655
  store i64 %xor27.1, ptr %arrayidx26.1, align 8, !dbg !1655
  %shl28.1 = shl nuw i64 %and24.1, 8, !dbg !1656
  %arrayidx30.1 = getelementptr inbounds nuw i8, ptr %M, i32 40, !dbg !1657
  %45 = load i64, ptr %arrayidx30.1, align 8, !dbg !1658
  %xor31.1 = xor i64 %45, %shl28.1, !dbg !1658
  store i64 %xor31.1, ptr %arrayidx30.1, align 8, !dbg !1658
  %arrayidx33.1 = getelementptr inbounds nuw i8, ptr %M, i32 48, !dbg !1659
  %46 = load i64, ptr %arrayidx33.1, align 8, !dbg !1660
  %xor34.1 = xor i64 %46, %and17.1, !dbg !1660
  store i64 %xor34.1, ptr %arrayidx33.1, align 8, !dbg !1660
  %arrayidx36.1 = getelementptr inbounds nuw i8, ptr %M, i32 56, !dbg !1661
  %47 = load i64, ptr %arrayidx36.1, align 8, !dbg !1662
  %xor37.1 = xor i64 %47, %and24.1, !dbg !1662
  store i64 %xor37.1, ptr %arrayidx36.1, align 8, !dbg !1662
    #dbg_value(i32 8, !1636, !DIExpression(), !1638)
  %arrayidx12.2 = getelementptr inbounds nuw i8, ptr %M, i32 64, !dbg !1639
  %48 = load i64, ptr %arrayidx12.2, align 8, !dbg !1639
  %shr13.2 = lshr i64 %48, 8, !dbg !1642
  %arrayidx15.2 = getelementptr inbounds nuw i8, ptr %M, i32 80, !dbg !1643
  %49 = load i64, ptr %arrayidx15.2, align 8, !dbg !1643
  %xor16.2 = xor i64 %shr13.2, %49, !dbg !1644
  %and17.2 = and i64 %xor16.2, 71777214294589695, !dbg !1645
    #dbg_value(i64 %and17.2, !1646, !DIExpression(), !1647)
  %arrayidx19.2 = getelementptr inbounds nuw i8, ptr %M, i32 72, !dbg !1648
  %50 = load i64, ptr %arrayidx19.2, align 8, !dbg !1648
  %shr20.2 = lshr i64 %50, 8, !dbg !1649
  %arrayidx22.2 = getelementptr inbounds nuw i8, ptr %M, i32 88, !dbg !1650
  %51 = load i64, ptr %arrayidx22.2, align 8, !dbg !1650
  %xor23.2 = xor i64 %shr20.2, %51, !dbg !1651
  %and24.2 = and i64 %xor23.2, 71777214294589695, !dbg !1652
    #dbg_value(i64 %and24.2, !1653, !DIExpression(), !1647)
  %shl25.2 = shl nuw i64 %and17.2, 8, !dbg !1654
  %arrayidx26.2 = getelementptr inbounds nuw i8, ptr %M, i32 64, !dbg !1663
  %52 = load i64, ptr %arrayidx26.2, align 8, !dbg !1655
  %xor27.2 = xor i64 %52, %shl25.2, !dbg !1655
  store i64 %xor27.2, ptr %arrayidx26.2, align 8, !dbg !1655
  %shl28.2 = shl nuw i64 %and24.2, 8, !dbg !1656
  %arrayidx30.2 = getelementptr inbounds nuw i8, ptr %M, i32 72, !dbg !1657
  %53 = load i64, ptr %arrayidx30.2, align 8, !dbg !1658
  %xor31.2 = xor i64 %53, %shl28.2, !dbg !1658
  store i64 %xor31.2, ptr %arrayidx30.2, align 8, !dbg !1658
  %arrayidx33.2 = getelementptr inbounds nuw i8, ptr %M, i32 80, !dbg !1659
  %54 = load i64, ptr %arrayidx33.2, align 8, !dbg !1660
  %xor34.2 = xor i64 %54, %and17.2, !dbg !1660
  store i64 %xor34.2, ptr %arrayidx33.2, align 8, !dbg !1660
  %arrayidx36.2 = getelementptr inbounds nuw i8, ptr %M, i32 88, !dbg !1661
  %55 = load i64, ptr %arrayidx36.2, align 8, !dbg !1662
  %xor37.2 = xor i64 %55, %and24.2, !dbg !1662
  store i64 %xor37.2, ptr %arrayidx36.2, align 8, !dbg !1662
    #dbg_value(i32 12, !1636, !DIExpression(), !1638)
  %arrayidx12.3 = getelementptr inbounds nuw i8, ptr %M, i32 96, !dbg !1639
  %56 = load i64, ptr %arrayidx12.3, align 8, !dbg !1639
  %shr13.3 = lshr i64 %56, 8, !dbg !1642
  %arrayidx15.3 = getelementptr inbounds nuw i8, ptr %M, i32 112, !dbg !1643
  %57 = load i64, ptr %arrayidx15.3, align 8, !dbg !1643
  %xor16.3 = xor i64 %shr13.3, %57, !dbg !1644
  %and17.3 = and i64 %xor16.3, 71777214294589695, !dbg !1645
    #dbg_value(i64 %and17.3, !1646, !DIExpression(), !1647)
  %arrayidx19.3 = getelementptr inbounds nuw i8, ptr %M, i32 104, !dbg !1648
  %58 = load i64, ptr %arrayidx19.3, align 8, !dbg !1648
  %shr20.3 = lshr i64 %58, 8, !dbg !1649
  %arrayidx22.3 = getelementptr inbounds nuw i8, ptr %M, i32 120, !dbg !1650
  %59 = load i64, ptr %arrayidx22.3, align 8, !dbg !1650
  %xor23.3 = xor i64 %shr20.3, %59, !dbg !1651
  %and24.3 = and i64 %xor23.3, 71777214294589695, !dbg !1652
    #dbg_value(i64 %and24.3, !1653, !DIExpression(), !1647)
  %shl25.3 = shl nuw i64 %and17.3, 8, !dbg !1654
  %arrayidx26.3 = getelementptr inbounds nuw i8, ptr %M, i32 96, !dbg !1663
  %60 = load i64, ptr %arrayidx26.3, align 8, !dbg !1655
  %xor27.3 = xor i64 %60, %shl25.3, !dbg !1655
  store i64 %xor27.3, ptr %arrayidx26.3, align 8, !dbg !1655
  %shl28.3 = shl nuw i64 %and24.3, 8, !dbg !1656
  %arrayidx30.3 = getelementptr inbounds nuw i8, ptr %M, i32 104, !dbg !1657
  %61 = load i64, ptr %arrayidx30.3, align 8, !dbg !1658
  %xor31.3 = xor i64 %61, %shl28.3, !dbg !1658
  store i64 %xor31.3, ptr %arrayidx30.3, align 8, !dbg !1658
  %arrayidx33.3 = getelementptr inbounds nuw i8, ptr %M, i32 112, !dbg !1659
  %62 = load i64, ptr %arrayidx33.3, align 8, !dbg !1660
  %xor34.3 = xor i64 %62, %and17.3, !dbg !1660
  store i64 %xor34.3, ptr %arrayidx33.3, align 8, !dbg !1660
  %arrayidx36.3 = getelementptr inbounds nuw i8, ptr %M, i32 120, !dbg !1661
  %63 = load i64, ptr %arrayidx36.3, align 8, !dbg !1662
  %xor37.3 = xor i64 %63, %and24.3, !dbg !1662
  store i64 %xor37.3, ptr %arrayidx36.3, align 8, !dbg !1662
    #dbg_value(i32 16, !1636, !DIExpression(), !1638)
    #dbg_value(i32 0, !1664, !DIExpression(), !1666)
  %64 = load i64, ptr %M, align 8, !dbg !1667
  %shr47 = lshr i64 %64, 16, !dbg !1670
  %arrayidx49 = getelementptr inbounds nuw i8, ptr %M, i32 32, !dbg !1671
  %65 = load i64, ptr %arrayidx49, align 8, !dbg !1671
  %xor50 = xor i64 %shr47, %65, !dbg !1672
  %and51 = and i64 %xor50, 281470681808895, !dbg !1673
    #dbg_value(i64 %and51, !1674, !DIExpression(), !1675)
  %arrayidx54 = getelementptr inbounds nuw i8, ptr %M, i32 64, !dbg !1676
  %66 = load i64, ptr %arrayidx54, align 8, !dbg !1676
  %shr55 = lshr i64 %66, 16, !dbg !1677
  %arrayidx57 = getelementptr inbounds nuw i8, ptr %M, i32 96, !dbg !1678
  %67 = load i64, ptr %arrayidx57, align 8, !dbg !1678
  %xor58 = xor i64 %shr55, %67, !dbg !1679
  %and59 = and i64 %xor58, 281470681808895, !dbg !1680
    #dbg_value(i64 %and59, !1681, !DIExpression(), !1675)
  %shl60 = shl nuw i64 %and51, 16, !dbg !1682
  %68 = load i64, ptr %M, align 8, !dbg !1683
  %xor62 = xor i64 %68, %shl60, !dbg !1683
  store i64 %xor62, ptr %M, align 8, !dbg !1683
  %shl63 = shl nuw i64 %and59, 16, !dbg !1684
  %arrayidx65 = getelementptr inbounds nuw i8, ptr %M, i32 64, !dbg !1685
  %69 = load i64, ptr %arrayidx65, align 8, !dbg !1686
  %xor66 = xor i64 %69, %shl63, !dbg !1686
  store i64 %xor66, ptr %arrayidx65, align 8, !dbg !1686
  %arrayidx68 = getelementptr inbounds nuw i8, ptr %M, i32 32, !dbg !1687
  %70 = load i64, ptr %arrayidx68, align 8, !dbg !1688
  %xor69 = xor i64 %70, %and51, !dbg !1688
  store i64 %xor69, ptr %arrayidx68, align 8, !dbg !1688
  %arrayidx71 = getelementptr inbounds nuw i8, ptr %M, i32 96, !dbg !1689
  %71 = load i64, ptr %arrayidx71, align 8, !dbg !1690
  %xor72 = xor i64 %71, %and59, !dbg !1690
  store i64 %xor72, ptr %arrayidx71, align 8, !dbg !1690
    #dbg_value(i32 1, !1664, !DIExpression(), !1666)
  %arrayidx46.1 = getelementptr inbounds nuw i8, ptr %M, i32 8, !dbg !1667
  %72 = load i64, ptr %arrayidx46.1, align 8, !dbg !1667
  %shr47.1 = lshr i64 %72, 16, !dbg !1670
  %arrayidx49.1 = getelementptr inbounds nuw i8, ptr %M, i32 40, !dbg !1671
  %73 = load i64, ptr %arrayidx49.1, align 8, !dbg !1671
  %xor50.1 = xor i64 %shr47.1, %73, !dbg !1672
  %and51.1 = and i64 %xor50.1, 281470681808895, !dbg !1673
    #dbg_value(i64 %and51.1, !1674, !DIExpression(), !1675)
  %arrayidx54.1 = getelementptr inbounds nuw i8, ptr %M, i32 72, !dbg !1676
  %74 = load i64, ptr %arrayidx54.1, align 8, !dbg !1676
  %shr55.1 = lshr i64 %74, 16, !dbg !1677
  %arrayidx57.1 = getelementptr inbounds nuw i8, ptr %M, i32 104, !dbg !1678
  %75 = load i64, ptr %arrayidx57.1, align 8, !dbg !1678
  %xor58.1 = xor i64 %shr55.1, %75, !dbg !1679
  %and59.1 = and i64 %xor58.1, 281470681808895, !dbg !1680
    #dbg_value(i64 %and59.1, !1681, !DIExpression(), !1675)
  %shl60.1 = shl nuw i64 %and51.1, 16, !dbg !1682
  %arrayidx61.1 = getelementptr inbounds nuw i8, ptr %M, i32 8, !dbg !1691
  %76 = load i64, ptr %arrayidx61.1, align 8, !dbg !1683
  %xor62.1 = xor i64 %76, %shl60.1, !dbg !1683
  store i64 %xor62.1, ptr %arrayidx61.1, align 8, !dbg !1683
  %shl63.1 = shl nuw i64 %and59.1, 16, !dbg !1684
  %arrayidx65.1 = getelementptr inbounds nuw i8, ptr %M, i32 72, !dbg !1685
  %77 = load i64, ptr %arrayidx65.1, align 8, !dbg !1686
  %xor66.1 = xor i64 %77, %shl63.1, !dbg !1686
  store i64 %xor66.1, ptr %arrayidx65.1, align 8, !dbg !1686
  %arrayidx68.1 = getelementptr inbounds nuw i8, ptr %M, i32 40, !dbg !1687
  %78 = load i64, ptr %arrayidx68.1, align 8, !dbg !1688
  %xor69.1 = xor i64 %78, %and51.1, !dbg !1688
  store i64 %xor69.1, ptr %arrayidx68.1, align 8, !dbg !1688
  %arrayidx71.1 = getelementptr inbounds nuw i8, ptr %M, i32 104, !dbg !1689
  %79 = load i64, ptr %arrayidx71.1, align 8, !dbg !1690
  %xor72.1 = xor i64 %79, %and59.1, !dbg !1690
  store i64 %xor72.1, ptr %arrayidx71.1, align 8, !dbg !1690
    #dbg_value(i32 2, !1664, !DIExpression(), !1666)
  %arrayidx46.2 = getelementptr inbounds nuw i8, ptr %M, i32 16, !dbg !1667
  %80 = load i64, ptr %arrayidx46.2, align 8, !dbg !1667
  %shr47.2 = lshr i64 %80, 16, !dbg !1670
  %arrayidx49.2 = getelementptr inbounds nuw i8, ptr %M, i32 48, !dbg !1671
  %81 = load i64, ptr %arrayidx49.2, align 8, !dbg !1671
  %xor50.2 = xor i64 %shr47.2, %81, !dbg !1672
  %and51.2 = and i64 %xor50.2, 281470681808895, !dbg !1673
    #dbg_value(i64 %and51.2, !1674, !DIExpression(), !1675)
  %arrayidx54.2 = getelementptr inbounds nuw i8, ptr %M, i32 80, !dbg !1676
  %82 = load i64, ptr %arrayidx54.2, align 8, !dbg !1676
  %shr55.2 = lshr i64 %82, 16, !dbg !1677
  %arrayidx57.2 = getelementptr inbounds nuw i8, ptr %M, i32 112, !dbg !1678
  %83 = load i64, ptr %arrayidx57.2, align 8, !dbg !1678
  %xor58.2 = xor i64 %shr55.2, %83, !dbg !1679
  %and59.2 = and i64 %xor58.2, 281470681808895, !dbg !1680
    #dbg_value(i64 %and59.2, !1681, !DIExpression(), !1675)
  %shl60.2 = shl nuw i64 %and51.2, 16, !dbg !1682
  %arrayidx61.2 = getelementptr inbounds nuw i8, ptr %M, i32 16, !dbg !1691
  %84 = load i64, ptr %arrayidx61.2, align 8, !dbg !1683
  %xor62.2 = xor i64 %84, %shl60.2, !dbg !1683
  store i64 %xor62.2, ptr %arrayidx61.2, align 8, !dbg !1683
  %shl63.2 = shl nuw i64 %and59.2, 16, !dbg !1684
  %arrayidx65.2 = getelementptr inbounds nuw i8, ptr %M, i32 80, !dbg !1685
  %85 = load i64, ptr %arrayidx65.2, align 8, !dbg !1686
  %xor66.2 = xor i64 %85, %shl63.2, !dbg !1686
  store i64 %xor66.2, ptr %arrayidx65.2, align 8, !dbg !1686
  %arrayidx68.2 = getelementptr inbounds nuw i8, ptr %M, i32 48, !dbg !1687
  %86 = load i64, ptr %arrayidx68.2, align 8, !dbg !1688
  %xor69.2 = xor i64 %86, %and51.2, !dbg !1688
  store i64 %xor69.2, ptr %arrayidx68.2, align 8, !dbg !1688
  %arrayidx71.2 = getelementptr inbounds nuw i8, ptr %M, i32 112, !dbg !1689
  %87 = load i64, ptr %arrayidx71.2, align 8, !dbg !1690
  %xor72.2 = xor i64 %87, %and59.2, !dbg !1690
  store i64 %xor72.2, ptr %arrayidx71.2, align 8, !dbg !1690
    #dbg_value(i32 3, !1664, !DIExpression(), !1666)
  %arrayidx46.3 = getelementptr inbounds nuw i8, ptr %M, i32 24, !dbg !1667
  %88 = load i64, ptr %arrayidx46.3, align 8, !dbg !1667
  %shr47.3 = lshr i64 %88, 16, !dbg !1670
  %arrayidx49.3 = getelementptr inbounds nuw i8, ptr %M, i32 56, !dbg !1671
  %89 = load i64, ptr %arrayidx49.3, align 8, !dbg !1671
  %xor50.3 = xor i64 %shr47.3, %89, !dbg !1672
  %and51.3 = and i64 %xor50.3, 281470681808895, !dbg !1673
    #dbg_value(i64 %and51.3, !1674, !DIExpression(), !1675)
  %arrayidx54.3 = getelementptr inbounds nuw i8, ptr %M, i32 88, !dbg !1676
  %90 = load i64, ptr %arrayidx54.3, align 8, !dbg !1676
  %shr55.3 = lshr i64 %90, 16, !dbg !1677
  %arrayidx57.3 = getelementptr inbounds nuw i8, ptr %M, i32 120, !dbg !1678
  %91 = load i64, ptr %arrayidx57.3, align 8, !dbg !1678
  %xor58.3 = xor i64 %shr55.3, %91, !dbg !1679
  %and59.3 = and i64 %xor58.3, 281470681808895, !dbg !1680
    #dbg_value(i64 %and59.3, !1681, !DIExpression(), !1675)
  %shl60.3 = shl nuw i64 %and51.3, 16, !dbg !1682
  %arrayidx61.3 = getelementptr inbounds nuw i8, ptr %M, i32 24, !dbg !1691
  %92 = load i64, ptr %arrayidx61.3, align 8, !dbg !1683
  %xor62.3 = xor i64 %92, %shl60.3, !dbg !1683
  store i64 %xor62.3, ptr %arrayidx61.3, align 8, !dbg !1683
  %shl63.3 = shl nuw i64 %and59.3, 16, !dbg !1684
  %arrayidx65.3 = getelementptr inbounds nuw i8, ptr %M, i32 88, !dbg !1685
  %93 = load i64, ptr %arrayidx65.3, align 8, !dbg !1686
  %xor66.3 = xor i64 %93, %shl63.3, !dbg !1686
  store i64 %xor66.3, ptr %arrayidx65.3, align 8, !dbg !1686
  %arrayidx68.3 = getelementptr inbounds nuw i8, ptr %M, i32 56, !dbg !1687
  %94 = load i64, ptr %arrayidx68.3, align 8, !dbg !1688
  %xor69.3 = xor i64 %94, %and51.3, !dbg !1688
  store i64 %xor69.3, ptr %arrayidx68.3, align 8, !dbg !1688
  %arrayidx71.3 = getelementptr inbounds nuw i8, ptr %M, i32 120, !dbg !1689
  %95 = load i64, ptr %arrayidx71.3, align 8, !dbg !1690
  %xor72.3 = xor i64 %95, %and59.3, !dbg !1690
  store i64 %xor72.3, ptr %arrayidx71.3, align 8, !dbg !1690
    #dbg_value(i32 4, !1664, !DIExpression(), !1666)
    #dbg_value(i32 0, !1692, !DIExpression(), !1694)
  %96 = load i64, ptr %M, align 8, !dbg !1695
  %shr81 = lshr i64 %96, 32, !dbg !1698
  %arrayidx83 = getelementptr inbounds nuw i8, ptr %M, i32 64, !dbg !1699
  %97 = load i64, ptr %arrayidx83, align 8, !dbg !1699
  %.masked = and i64 %97, 4294967295, !dbg !1700
  %and85 = xor i64 %shr81, %.masked, !dbg !1700
    #dbg_value(i64 %and85, !1701, !DIExpression(), !1702)
  %shl86 = shl nuw i64 %and85, 32, !dbg !1703
  %98 = load i64, ptr %M, align 8, !dbg !1704
  %xor88 = xor i64 %98, %shl86, !dbg !1704
  store i64 %xor88, ptr %M, align 8, !dbg !1704
  %arrayidx90 = getelementptr inbounds nuw i8, ptr %M, i32 64, !dbg !1705
  %99 = load i64, ptr %arrayidx90, align 8, !dbg !1706
  %xor91 = xor i64 %99, %and85, !dbg !1706
  store i64 %xor91, ptr %arrayidx90, align 8, !dbg !1706
    #dbg_value(i32 1, !1692, !DIExpression(), !1694)
  %arrayidx80.1 = getelementptr inbounds nuw i8, ptr %M, i32 8, !dbg !1695
  %100 = load i64, ptr %arrayidx80.1, align 8, !dbg !1695
  %shr81.1 = lshr i64 %100, 32, !dbg !1698
  %arrayidx83.1 = getelementptr inbounds nuw i8, ptr %M, i32 72, !dbg !1699
  %101 = load i64, ptr %arrayidx83.1, align 8, !dbg !1699
  %.masked.1 = and i64 %101, 4294967295, !dbg !1700
  %and85.1 = xor i64 %shr81.1, %.masked.1, !dbg !1700
    #dbg_value(i64 %and85.1, !1701, !DIExpression(), !1702)
  %shl86.1 = shl nuw i64 %and85.1, 32, !dbg !1703
  %arrayidx87.1 = getelementptr inbounds nuw i8, ptr %M, i32 8, !dbg !1707
  %102 = load i64, ptr %arrayidx87.1, align 8, !dbg !1704
  %xor88.1 = xor i64 %102, %shl86.1, !dbg !1704
  store i64 %xor88.1, ptr %arrayidx87.1, align 8, !dbg !1704
  %arrayidx90.1 = getelementptr inbounds nuw i8, ptr %M, i32 72, !dbg !1705
  %103 = load i64, ptr %arrayidx90.1, align 8, !dbg !1706
  %xor91.1 = xor i64 %103, %and85.1, !dbg !1706
  store i64 %xor91.1, ptr %arrayidx90.1, align 8, !dbg !1706
    #dbg_value(i32 2, !1692, !DIExpression(), !1694)
  %arrayidx80.2 = getelementptr inbounds nuw i8, ptr %M, i32 16, !dbg !1695
  %104 = load i64, ptr %arrayidx80.2, align 8, !dbg !1695
  %shr81.2 = lshr i64 %104, 32, !dbg !1698
  %arrayidx83.2 = getelementptr inbounds nuw i8, ptr %M, i32 80, !dbg !1699
  %105 = load i64, ptr %arrayidx83.2, align 8, !dbg !1699
  %.masked.2 = and i64 %105, 4294967295, !dbg !1700
  %and85.2 = xor i64 %shr81.2, %.masked.2, !dbg !1700
    #dbg_value(i64 %and85.2, !1701, !DIExpression(), !1702)
  %shl86.2 = shl nuw i64 %and85.2, 32, !dbg !1703
  %arrayidx87.2 = getelementptr inbounds nuw i8, ptr %M, i32 16, !dbg !1707
  %106 = load i64, ptr %arrayidx87.2, align 8, !dbg !1704
  %xor88.2 = xor i64 %106, %shl86.2, !dbg !1704
  store i64 %xor88.2, ptr %arrayidx87.2, align 8, !dbg !1704
  %arrayidx90.2 = getelementptr inbounds nuw i8, ptr %M, i32 80, !dbg !1705
  %107 = load i64, ptr %arrayidx90.2, align 8, !dbg !1706
  %xor91.2 = xor i64 %107, %and85.2, !dbg !1706
  store i64 %xor91.2, ptr %arrayidx90.2, align 8, !dbg !1706
    #dbg_value(i32 3, !1692, !DIExpression(), !1694)
  %arrayidx80.3 = getelementptr inbounds nuw i8, ptr %M, i32 24, !dbg !1695
  %108 = load i64, ptr %arrayidx80.3, align 8, !dbg !1695
  %shr81.3 = lshr i64 %108, 32, !dbg !1698
  %arrayidx83.3 = getelementptr inbounds nuw i8, ptr %M, i32 88, !dbg !1699
  %109 = load i64, ptr %arrayidx83.3, align 8, !dbg !1699
  %.masked.3 = and i64 %109, 4294967295, !dbg !1700
  %and85.3 = xor i64 %shr81.3, %.masked.3, !dbg !1700
    #dbg_value(i64 %and85.3, !1701, !DIExpression(), !1702)
  %shl86.3 = shl nuw i64 %and85.3, 32, !dbg !1703
  %arrayidx87.3 = getelementptr inbounds nuw i8, ptr %M, i32 24, !dbg !1707
  %110 = load i64, ptr %arrayidx87.3, align 8, !dbg !1704
  %xor88.3 = xor i64 %110, %shl86.3, !dbg !1704
  store i64 %xor88.3, ptr %arrayidx87.3, align 8, !dbg !1704
  %arrayidx90.3 = getelementptr inbounds nuw i8, ptr %M, i32 88, !dbg !1705
  %111 = load i64, ptr %arrayidx90.3, align 8, !dbg !1706
  %xor91.3 = xor i64 %111, %and85.3, !dbg !1706
  store i64 %xor91.3, ptr %arrayidx90.3, align 8, !dbg !1706
    #dbg_value(i32 4, !1692, !DIExpression(), !1694)
  %arrayidx80.4 = getelementptr inbounds nuw i8, ptr %M, i32 32, !dbg !1695
  %112 = load i64, ptr %arrayidx80.4, align 8, !dbg !1695
  %shr81.4 = lshr i64 %112, 32, !dbg !1698
  %arrayidx83.4 = getelementptr inbounds nuw i8, ptr %M, i32 96, !dbg !1699
  %113 = load i64, ptr %arrayidx83.4, align 8, !dbg !1699
  %.masked.4 = and i64 %113, 4294967295, !dbg !1700
  %and85.4 = xor i64 %shr81.4, %.masked.4, !dbg !1700
    #dbg_value(i64 %and85.4, !1701, !DIExpression(), !1702)
  %shl86.4 = shl nuw i64 %and85.4, 32, !dbg !1703
  %arrayidx87.4 = getelementptr inbounds nuw i8, ptr %M, i32 32, !dbg !1707
  %114 = load i64, ptr %arrayidx87.4, align 8, !dbg !1704
  %xor88.4 = xor i64 %114, %shl86.4, !dbg !1704
  store i64 %xor88.4, ptr %arrayidx87.4, align 8, !dbg !1704
  %arrayidx90.4 = getelementptr inbounds nuw i8, ptr %M, i32 96, !dbg !1705
  %115 = load i64, ptr %arrayidx90.4, align 8, !dbg !1706
  %xor91.4 = xor i64 %115, %and85.4, !dbg !1706
  store i64 %xor91.4, ptr %arrayidx90.4, align 8, !dbg !1706
    #dbg_value(i32 5, !1692, !DIExpression(), !1694)
  %arrayidx80.5 = getelementptr inbounds nuw i8, ptr %M, i32 40, !dbg !1695
  %116 = load i64, ptr %arrayidx80.5, align 8, !dbg !1695
  %shr81.5 = lshr i64 %116, 32, !dbg !1698
  %arrayidx83.5 = getelementptr inbounds nuw i8, ptr %M, i32 104, !dbg !1699
  %117 = load i64, ptr %arrayidx83.5, align 8, !dbg !1699
  %.masked.5 = and i64 %117, 4294967295, !dbg !1700
  %and85.5 = xor i64 %shr81.5, %.masked.5, !dbg !1700
    #dbg_value(i64 %and85.5, !1701, !DIExpression(), !1702)
  %shl86.5 = shl nuw i64 %and85.5, 32, !dbg !1703
  %arrayidx87.5 = getelementptr inbounds nuw i8, ptr %M, i32 40, !dbg !1707
  %118 = load i64, ptr %arrayidx87.5, align 8, !dbg !1704
  %xor88.5 = xor i64 %118, %shl86.5, !dbg !1704
  store i64 %xor88.5, ptr %arrayidx87.5, align 8, !dbg !1704
  %arrayidx90.5 = getelementptr inbounds nuw i8, ptr %M, i32 104, !dbg !1705
  %119 = load i64, ptr %arrayidx90.5, align 8, !dbg !1706
  %xor91.5 = xor i64 %119, %and85.5, !dbg !1706
  store i64 %xor91.5, ptr %arrayidx90.5, align 8, !dbg !1706
    #dbg_value(i32 6, !1692, !DIExpression(), !1694)
  %arrayidx80.6 = getelementptr inbounds nuw i8, ptr %M, i32 48, !dbg !1695
  %120 = load i64, ptr %arrayidx80.6, align 8, !dbg !1695
  %shr81.6 = lshr i64 %120, 32, !dbg !1698
  %arrayidx83.6 = getelementptr inbounds nuw i8, ptr %M, i32 112, !dbg !1699
  %121 = load i64, ptr %arrayidx83.6, align 8, !dbg !1699
  %.masked.6 = and i64 %121, 4294967295, !dbg !1700
  %and85.6 = xor i64 %shr81.6, %.masked.6, !dbg !1700
    #dbg_value(i64 %and85.6, !1701, !DIExpression(), !1702)
  %shl86.6 = shl nuw i64 %and85.6, 32, !dbg !1703
  %arrayidx87.6 = getelementptr inbounds nuw i8, ptr %M, i32 48, !dbg !1707
  %122 = load i64, ptr %arrayidx87.6, align 8, !dbg !1704
  %xor88.6 = xor i64 %122, %shl86.6, !dbg !1704
  store i64 %xor88.6, ptr %arrayidx87.6, align 8, !dbg !1704
  %arrayidx90.6 = getelementptr inbounds nuw i8, ptr %M, i32 112, !dbg !1705
  %123 = load i64, ptr %arrayidx90.6, align 8, !dbg !1706
  %xor91.6 = xor i64 %123, %and85.6, !dbg !1706
  store i64 %xor91.6, ptr %arrayidx90.6, align 8, !dbg !1706
    #dbg_value(i32 7, !1692, !DIExpression(), !1694)
  %arrayidx80.7 = getelementptr inbounds nuw i8, ptr %M, i32 56, !dbg !1695
  %124 = load i64, ptr %arrayidx80.7, align 8, !dbg !1695
  %shr81.7 = lshr i64 %124, 32, !dbg !1698
  %arrayidx83.7 = getelementptr inbounds nuw i8, ptr %M, i32 120, !dbg !1699
  %125 = load i64, ptr %arrayidx83.7, align 8, !dbg !1699
  %.masked.7 = and i64 %125, 4294967295, !dbg !1700
  %and85.7 = xor i64 %shr81.7, %.masked.7, !dbg !1700
    #dbg_value(i64 %and85.7, !1701, !DIExpression(), !1702)
  %shl86.7 = shl nuw i64 %and85.7, 32, !dbg !1703
  %arrayidx87.7 = getelementptr inbounds nuw i8, ptr %M, i32 56, !dbg !1707
  %126 = load i64, ptr %arrayidx87.7, align 8, !dbg !1704
  %xor88.7 = xor i64 %126, %shl86.7, !dbg !1704
  store i64 %xor88.7, ptr %arrayidx87.7, align 8, !dbg !1704
  %arrayidx90.7 = getelementptr inbounds nuw i8, ptr %M, i32 120, !dbg !1705
  %127 = load i64, ptr %arrayidx90.7, align 8, !dbg !1706
  %xor91.7 = xor i64 %127, %and85.7, !dbg !1706
  store i64 %xor91.7, ptr %arrayidx90.7, align 8, !dbg !1706
    #dbg_value(i32 8, !1692, !DIExpression(), !1694)
  ret void, !dbg !1708
}

; Function Attrs: nounwind
define internal fastcc void @mul_add_mat_x_m_mat(i32 noundef %m_vec_limbs, ptr noundef %mat, ptr noundef %bs_mat, ptr noundef %acc, i32 noundef %mat_rows, i32 noundef %mat_cols, i32 noundef %bs_mat_cols) unnamed_addr #0 !dbg !1709 {
entry:
    #dbg_value(i32 %m_vec_limbs, !1710, !DIExpression(), !1711)
    #dbg_value(ptr %mat, !1712, !DIExpression(), !1711)
    #dbg_value(ptr %bs_mat, !1713, !DIExpression(), !1711)
    #dbg_value(ptr %acc, !1714, !DIExpression(), !1711)
    #dbg_value(i32 %mat_rows, !1715, !DIExpression(), !1711)
    #dbg_value(i32 %mat_cols, !1716, !DIExpression(), !1711)
    #dbg_value(i32 %bs_mat_cols, !1717, !DIExpression(), !1711)
    #dbg_value(i32 0, !1718, !DIExpression(), !1720)
  %smax = call i32 @llvm.smax.i32(i32 %bs_mat_cols, i32 0), !dbg !1721
  %smax1 = call i32 @llvm.smax.i32(i32 %mat_cols, i32 0), !dbg !1721
  %smax3 = call i32 @llvm.smax.i32(i32 %mat_rows, i32 0), !dbg !1721
  br label %for.cond, !dbg !1721

for.cond:                                         ; preds = %for.inc17, %entry
  %r.0 = phi i32 [ 0, %entry ], [ %inc18, %for.inc17 ], !dbg !1722
    #dbg_value(i32 %r.0, !1718, !DIExpression(), !1720)
  %exitcond4.not = icmp eq i32 %r.0, %smax3, !dbg !1723
  br i1 %exitcond4.not, label %for.end19, label %for.cond1, !dbg !1725

for.cond1:                                        ; preds = %for.cond, %for.inc15
  %c.0 = phi i32 [ %inc, %for.inc15 ], [ 0, %for.cond ], !dbg !1726
    #dbg_value(i32 %c.0, !1729, !DIExpression(), !1730)
  %exitcond2.not = icmp eq i32 %c.0, %smax1, !dbg !1731
  br i1 %exitcond2.not, label %for.inc17, label %for.cond4, !dbg !1733

for.cond4:                                        ; preds = %for.cond1, %for.body6
  %k.0 = phi i32 [ %add14, %for.body6 ], [ 0, %for.cond1 ], !dbg !1734
    #dbg_value(i32 %k.0, !1737, !DIExpression(), !1738)
  %exitcond.not = icmp eq i32 %k.0, %smax, !dbg !1739
  br i1 %exitcond.not, label %for.inc15, label %for.body6, !dbg !1741

for.body6:                                        ; preds = %for.cond4
  %mul = mul nsw i32 %c.0, %bs_mat_cols, !dbg !1742
  %add = add nsw i32 %mul, %k.0, !dbg !1744
  %mul7 = mul nsw i32 %m_vec_limbs, %add, !dbg !1745
  %add.ptr = getelementptr inbounds i64, ptr %bs_mat, i32 %mul7, !dbg !1746
  %mul8 = mul nsw i32 %r.0, %mat_cols, !dbg !1747
  %0 = getelementptr i8, ptr %mat, i32 %mul8, !dbg !1748
  %arrayidx = getelementptr i8, ptr %0, i32 %c.0, !dbg !1748
  %1 = load i8, ptr %arrayidx, align 1, !dbg !1748
  %mul10 = mul nsw i32 %r.0, %bs_mat_cols, !dbg !1749
  %add11 = add nsw i32 %mul10, %k.0, !dbg !1750
  %mul12 = mul nsw i32 %m_vec_limbs, %add11, !dbg !1751
  %add.ptr13 = getelementptr inbounds i64, ptr %acc, i32 %mul12, !dbg !1752
  call fastcc void @m_vec_mul_add(i32 noundef %m_vec_limbs, ptr noundef %add.ptr, i8 noundef zeroext %1, ptr noundef %add.ptr13) #6, !dbg !1753
  %add14 = add nuw i32 %k.0, 1, !dbg !1754
    #dbg_value(i32 %add14, !1737, !DIExpression(), !1738)
  br label %for.cond4, !dbg !1755, !llvm.loop !1756

for.inc15:                                        ; preds = %for.cond4
  %inc = add nuw i32 %c.0, 1, !dbg !1758
    #dbg_value(i32 %inc, !1729, !DIExpression(), !1730)
  br label %for.cond1, !dbg !1759, !llvm.loop !1760

for.inc17:                                        ; preds = %for.cond1
  %inc18 = add nuw i32 %r.0, 1, !dbg !1762
    #dbg_value(i32 %inc18, !1718, !DIExpression(), !1720)
  br label %for.cond, !dbg !1763, !llvm.loop !1764

for.end19:                                        ; preds = %for.cond
  ret void, !dbg !1766
}

; Function Attrs: nounwind
define internal fastcc void @P1_times_Vt(ptr noundef %p, ptr noundef %P1, ptr noundef %V, ptr noundef %acc) unnamed_addr #0 !dbg !1767 {
entry:
    #dbg_value(ptr %p, !1768, !DIExpression(), !1769)
    #dbg_value(ptr %P1, !1770, !DIExpression(), !1769)
    #dbg_value(ptr %V, !1771, !DIExpression(), !1769)
    #dbg_value(ptr %acc, !1772, !DIExpression(), !1769)
  call fastcc void @mul_add_m_upper_triangular_mat_x_mat_trans(i32 noundef 4, ptr noundef %P1, ptr noundef %V, ptr noundef %acc, i32 noundef 64, i32 noundef 64, i32 noundef 4, i32 noundef 1) #6, !dbg !1773
  ret void, !dbg !1774
}

; Function Attrs: nounwind
define internal fastcc void @mul_add_m_upper_triangular_mat_x_mat_trans(i32 noundef %m_vec_limbs, ptr noundef %bs_mat, ptr noundef %mat, ptr noundef %acc, i32 noundef %bs_mat_rows, i32 noundef %bs_mat_cols, i32 noundef %mat_rows, i32 noundef %triangular) unnamed_addr #0 !dbg !1775 {
entry:
    #dbg_value(i32 %m_vec_limbs, !1776, !DIExpression(), !1777)
    #dbg_value(ptr %bs_mat, !1778, !DIExpression(), !1777)
    #dbg_value(ptr %mat, !1779, !DIExpression(), !1777)
    #dbg_value(ptr %acc, !1780, !DIExpression(), !1777)
    #dbg_value(i32 %bs_mat_rows, !1781, !DIExpression(), !1777)
    #dbg_value(i32 %bs_mat_cols, !1782, !DIExpression(), !1777)
    #dbg_value(i32 %mat_rows, !1783, !DIExpression(), !1777)
    #dbg_value(i32 %triangular, !1784, !DIExpression(), !1777)
    #dbg_value(i32 0, !1785, !DIExpression(), !1777)
    #dbg_value(i32 0, !1786, !DIExpression(), !1788)
  %smax = call i32 @llvm.smax.i32(i32 %mat_rows, i32 0), !dbg !1789
  %smax1 = call i32 @llvm.smax.i32(i32 %bs_mat_rows, i32 0), !dbg !1789
  br label %for.cond, !dbg !1789

for.cond:                                         ; preds = %for.inc17, %entry
  %bs_mat_entries_used.0 = phi i32 [ 0, %entry ], [ %bs_mat_entries_used.1, %for.inc17 ], !dbg !1790
  %r.0 = phi i32 [ 0, %entry ], [ %inc18, %for.inc17 ], !dbg !1791
    #dbg_value(i32 %r.0, !1786, !DIExpression(), !1788)
    #dbg_value(i32 %bs_mat_entries_used.0, !1785, !DIExpression(), !1777)
  %exitcond2.not = icmp eq i32 %r.0, %smax1, !dbg !1792
  br i1 %exitcond2.not, label %for.end19, label %for.body, !dbg !1794

for.body:                                         ; preds = %for.cond
  %mul = mul nsw i32 %triangular, %r.0, !dbg !1795
    #dbg_value(i32 %mul, !1798, !DIExpression(), !1799)
  br label %for.cond1, !dbg !1800

for.cond1:                                        ; preds = %for.inc15, %for.body
  %bs_mat_entries_used.1 = phi i32 [ %bs_mat_entries_used.0, %for.body ], [ %add14, %for.inc15 ], !dbg !1777
  %c.0 = phi i32 [ %mul, %for.body ], [ %inc, %for.inc15 ], !dbg !1801
    #dbg_value(i32 %c.0, !1798, !DIExpression(), !1799)
    #dbg_value(i32 %bs_mat_entries_used.1, !1785, !DIExpression(), !1777)
  %cmp2 = icmp slt i32 %c.0, %bs_mat_cols, !dbg !1802
  br i1 %cmp2, label %for.cond4, label %for.inc17, !dbg !1804

for.cond4:                                        ; preds = %for.cond1, %for.body6
  %k.0 = phi i32 [ %add13, %for.body6 ], [ 0, %for.cond1 ], !dbg !1805
    #dbg_value(i32 %k.0, !1808, !DIExpression(), !1809)
  %exitcond.not = icmp eq i32 %k.0, %smax, !dbg !1810
  br i1 %exitcond.not, label %for.inc15, label %for.body6, !dbg !1812

for.body6:                                        ; preds = %for.cond4
  %mul7 = mul nsw i32 %m_vec_limbs, %bs_mat_entries_used.1, !dbg !1813
  %add.ptr = getelementptr inbounds i64, ptr %bs_mat, i32 %mul7, !dbg !1815
  %mul8 = mul nsw i32 %k.0, %bs_mat_cols, !dbg !1816
  %0 = getelementptr i8, ptr %mat, i32 %mul8, !dbg !1817
  %arrayidx = getelementptr i8, ptr %0, i32 %c.0, !dbg !1817
  %1 = load i8, ptr %arrayidx, align 1, !dbg !1817
  %mul9 = mul nsw i32 %r.0, %mat_rows, !dbg !1818
  %add10 = add nsw i32 %mul9, %k.0, !dbg !1819
  %mul11 = mul nsw i32 %m_vec_limbs, %add10, !dbg !1820
  %add.ptr12 = getelementptr inbounds i64, ptr %acc, i32 %mul11, !dbg !1821
  call fastcc void @m_vec_mul_add(i32 noundef %m_vec_limbs, ptr noundef %add.ptr, i8 noundef zeroext %1, ptr noundef %add.ptr12) #6, !dbg !1822
  %add13 = add nuw i32 %k.0, 1, !dbg !1823
    #dbg_value(i32 %add13, !1808, !DIExpression(), !1809)
  br label %for.cond4, !dbg !1824, !llvm.loop !1825

for.inc15:                                        ; preds = %for.cond4
    #dbg_value(i32 %bs_mat_entries_used.1, !1785, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1777)
  %add14 = add nsw i32 %bs_mat_entries_used.1, 1, !dbg !1827
    #dbg_value(i32 %add14, !1785, !DIExpression(), !1777)
  %inc = add nsw i32 %c.0, 1, !dbg !1828
    #dbg_value(i32 %inc, !1798, !DIExpression(), !1799)
  br label %for.cond1, !dbg !1829, !llvm.loop !1830

for.inc17:                                        ; preds = %for.cond1
  %inc18 = add nuw i32 %r.0, 1, !dbg !1832
    #dbg_value(i32 %inc18, !1786, !DIExpression(), !1788)
  br label %for.cond, !dbg !1833, !llvm.loop !1834

for.end19:                                        ; preds = %for.cond
  ret void, !dbg !1836
}

; Function Attrs: nounwind
define dso_local i32 @pqmayo_MAYO_2_ref_mayo_sign(ptr noundef %p, ptr noundef %sm, ptr noundef %smlen, ptr noundef %m, i32 noundef %mlen, ptr noundef %csk) local_unnamed_addr #0 !dbg !1837 {
entry:
  %siglen = alloca i32, align 4
    #dbg_value(ptr %p, !1838, !DIExpression(), !1839)
    #dbg_value(ptr %sm, !1840, !DIExpression(), !1839)
    #dbg_value(ptr %smlen, !1841, !DIExpression(), !1839)
    #dbg_value(ptr %m, !1842, !DIExpression(), !1839)
    #dbg_value(i32 %mlen, !1843, !DIExpression(), !1839)
    #dbg_value(ptr %csk, !1844, !DIExpression(), !1839)
    #dbg_value(i32 0, !1845, !DIExpression(), !1839)
    #dbg_value(i32 186, !1846, !DIExpression(), !1839)
  %add.ptr = getelementptr inbounds nuw i8, ptr %sm, i32 186, !dbg !1847
  %call = call ptr @memmove(ptr noundef nonnull %add.ptr, ptr noundef %m, i32 noundef %mlen) #8, !dbg !1848
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %sm, i32 186, !dbg !1849
    #dbg_value(ptr %siglen, !1850, !DIExpression(DW_OP_deref), !1839)
  %call2 = call i32 @pqmayo_MAYO_2_ref_mayo_sign_signature(ptr noundef %p, ptr noundef %sm, ptr noundef nonnull %siglen, ptr noundef nonnull %add.ptr1, i32 noundef %mlen, ptr noundef %csk) #6, !dbg !1851
    #dbg_value(i32 %call2, !1845, !DIExpression(), !1839)
  %cmp.not = icmp eq i32 %call2, 0, !dbg !1852
  %0 = load i32, ptr %siglen, align 4
    #dbg_value(i32 %0, !1850, !DIExpression(), !1839)
  %cmp3.not = icmp eq i32 %0, 186
  %or.cond = select i1 %cmp.not, i1 %cmp3.not, i1 false, !dbg !1854
  br i1 %or.cond, label %if.end, label %if.then, !dbg !1854

if.then:                                          ; preds = %entry
  %1 = load i32, ptr %siglen, align 4, !dbg !1855
    #dbg_value(i32 %1, !1850, !DIExpression(), !1839)
  %add = add i32 %1, %mlen, !dbg !1857
  %call4 = call ptr @memset(ptr noundef %sm, i32 noundef 0, i32 noundef %add) #8, !dbg !1858
  br label %err, !dbg !1859

if.end:                                           ; preds = %entry
  %2 = load i32, ptr %siglen, align 4, !dbg !1860
    #dbg_value(i32 %2, !1850, !DIExpression(), !1839)
  %add5 = add i32 %2, %mlen, !dbg !1861
  store i32 %add5, ptr %smlen, align 4, !dbg !1862
  br label %err, !dbg !1863

err:                                              ; preds = %if.end, %if.then
    #dbg_label(!1864, !1865)
  ret i32 %call2, !dbg !1866
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_2_ref_mayo_open(ptr noundef %p, ptr noundef %m, ptr noundef %mlen, ptr noundef %sm, i32 noundef %smlen, ptr noundef %pk) local_unnamed_addr #0 !dbg !1867 {
entry:
    #dbg_value(ptr %p, !1868, !DIExpression(), !1869)
    #dbg_value(ptr %m, !1870, !DIExpression(), !1869)
    #dbg_value(ptr %mlen, !1871, !DIExpression(), !1869)
    #dbg_value(ptr %sm, !1872, !DIExpression(), !1869)
    #dbg_value(i32 %smlen, !1873, !DIExpression(), !1869)
    #dbg_value(ptr %pk, !1874, !DIExpression(), !1869)
    #dbg_value(i32 186, !1875, !DIExpression(), !1869)
  %cmp = icmp ult i32 %smlen, 186, !dbg !1876
  br i1 %cmp, label %return, label %if.end, !dbg !1876

if.end:                                           ; preds = %entry
  %add.ptr = getelementptr inbounds nuw i8, ptr %sm, i32 186, !dbg !1878
  %sub = add i32 %smlen, -186, !dbg !1879
  %call = call i32 @pqmayo_MAYO_2_ref_mayo_verify(ptr noundef %p, ptr noundef nonnull %add.ptr, i32 noundef %sub, ptr noundef %sm, ptr noundef %pk) #6, !dbg !1880
    #dbg_value(i32 %call, !1881, !DIExpression(), !1869)
  %cmp1 = icmp eq i32 %call, 0, !dbg !1882
  br i1 %cmp1, label %if.then2, label %return, !dbg !1882

if.then2:                                         ; preds = %if.end
  %sub3 = add i32 %smlen, -186, !dbg !1884
  store i32 %sub3, ptr %mlen, align 4, !dbg !1886
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sm, i32 186, !dbg !1887
  %call5 = call ptr @memmove(ptr noundef %m, ptr noundef nonnull %add.ptr4, i32 noundef %sub3) #8, !dbg !1888
  br label %return, !dbg !1889

return:                                           ; preds = %if.end, %if.then2, %entry
  %retval.0 = phi i32 [ 1, %entry ], [ %call, %if.then2 ], [ %call, %if.end ], !dbg !1869
  ret i32 %retval.0, !dbg !1890
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_2_ref_mayo_verify(ptr noundef %p, ptr noundef %m, i32 noundef %mlen, ptr noundef %sig, ptr noundef %cpk) local_unnamed_addr #0 !dbg !1891 {
entry:
  %tEnc = alloca [32 x i8], align 1
  %t = alloca [64 x i8], align 1
  %y = alloca [128 x i8], align 1
  %s = alloca [324 x i8], align 1
  %pk = alloca [13284 x i64], align 8
  %tmp = alloca [56 x i8], align 1
    #dbg_value(ptr %p, !1894, !DIExpression(), !1895)
    #dbg_value(ptr %m, !1896, !DIExpression(), !1895)
    #dbg_value(i32 %mlen, !1897, !DIExpression(), !1895)
    #dbg_value(ptr %sig, !1898, !DIExpression(), !1895)
    #dbg_value(ptr %cpk, !1899, !DIExpression(), !1895)
    #dbg_declare(ptr %tEnc, !1900, !DIExpression(), !1901)
    #dbg_declare(ptr %t, !1902, !DIExpression(), !1903)
    #dbg_declare(ptr %y, !1904, !DIExpression(), !1908)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(128) %y, i8 0, i32 128, i1 false), !dbg !1908
    #dbg_declare(ptr %s, !1909, !DIExpression(), !1910)
    #dbg_declare(ptr %pk, !1911, !DIExpression(), !1915)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(106272) %pk, i8 0, i32 106272, i1 false), !dbg !1915
    #dbg_declare(ptr %tmp, !1916, !DIExpression(), !1920)
    #dbg_value(i32 64, !1921, !DIExpression(), !1895)
    #dbg_value(i32 81, !1922, !DIExpression(), !1895)
    #dbg_value(i32 4, !1923, !DIExpression(), !1895)
    #dbg_value(i32 32, !1924, !DIExpression(), !1895)
    #dbg_value(i32 186, !1925, !DIExpression(), !1895)
    #dbg_value(i32 32, !1926, !DIExpression(), !1895)
    #dbg_value(i32 24, !1927, !DIExpression(), !1895)
  %call = call i32 @pqmayo_MAYO_2_ref_mayo_expand_pk(ptr noundef %p, ptr noundef %cpk, ptr noundef nonnull %pk) #6, !dbg !1928
    #dbg_value(i32 %call, !1929, !DIExpression(), !1895)
  %cmp.not = icmp eq i32 %call, 0, !dbg !1930
  br i1 %cmp.not, label %if.end, label %return, !dbg !1930

if.end:                                           ; preds = %entry
    #dbg_value(ptr %pk, !1932, !DIExpression(), !1895)
  %add.ptr = getelementptr inbounds nuw i8, ptr %pk, i32 66560, !dbg !1933
    #dbg_value(ptr %add.ptr, !1934, !DIExpression(), !1895)
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %pk, i32 101376, !dbg !1935
    #dbg_value(ptr %add.ptr2, !1936, !DIExpression(), !1895)
  %call4 = call i32 @shake256(ptr noundef nonnull %tmp, i32 noundef 32, ptr noundef %m, i32 noundef %mlen) #8, !dbg !1937
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %tmp, i32 32, !dbg !1938
  %add.ptr8 = getelementptr inbounds nuw i8, ptr %sig, i32 162, !dbg !1939
  %call9 = call ptr @memcpy(ptr noundef nonnull %add.ptr6, ptr noundef nonnull %add.ptr8, i32 noundef 24) #8, !dbg !1940
  %call12 = call i32 @shake256(ptr noundef nonnull %tEnc, i32 noundef 32, ptr noundef nonnull %tmp, i32 noundef 56) #8, !dbg !1941
  call fastcc void @decode(ptr noundef nonnull %tEnc, ptr noundef nonnull %t, i32 noundef 64) #6, !dbg !1942
  call fastcc void @decode(ptr noundef %sig, ptr noundef nonnull %s, i32 noundef 324) #6, !dbg !1943
  call fastcc void @eval_public_map(ptr noundef %p, ptr noundef nonnull %s, ptr noundef nonnull %pk, ptr noundef nonnull %add.ptr, ptr noundef nonnull %add.ptr2, ptr noundef nonnull %y) #6, !dbg !1944
  %call20 = call i32 @memcmp(ptr noundef nonnull %y, ptr noundef nonnull %t, i32 noundef 64) #8, !dbg !1945
  %cmp21 = icmp ne i32 %call20, 0, !dbg !1947
  %. = zext i1 %cmp21 to i32, !dbg !1895
  br label %return, !dbg !1895

return:                                           ; preds = %if.end, %entry
  %retval.0 = phi i32 [ 1, %entry ], [ %., %if.end ], !dbg !1895
  ret i32 %retval.0, !dbg !1948
}

; Function Attrs: nounwind
define dso_local i32 @pqmayo_MAYO_2_ref_mayo_expand_pk(ptr noundef %p, ptr noundef %cpk, ptr noundef %pk) local_unnamed_addr #0 !dbg !1949 {
entry:
    #dbg_value(ptr %p, !1952, !DIExpression(), !1953)
    #dbg_value(ptr %cpk, !1954, !DIExpression(), !1953)
    #dbg_value(ptr %pk, !1955, !DIExpression(), !1953)
  call fastcc void @expand_P1_P2(ptr noundef %p, ptr noundef %pk, ptr noundef %cpk) #6, !dbg !1956
  %add.ptr = getelementptr inbounds nuw i8, ptr %cpk, i32 16, !dbg !1957
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %pk, i32 101376, !dbg !1958
  call fastcc void @unpack_m_vecs(ptr noundef nonnull %add.ptr, ptr noundef nonnull %add.ptr2, i32 noundef 153, i32 noundef 64) #6, !dbg !1959
  ret i32 0, !dbg !1960
}

; Function Attrs: nounwind
define internal fastcc void @eval_public_map(ptr noundef %p, ptr noundef %s, ptr noundef %P1, ptr noundef %P2, ptr noundef %P3, ptr noundef %eval) unnamed_addr #0 !dbg !1961 {
entry:
  %SPS = alloca [64 x i64], align 8
  %zero = alloca [64 x i8], align 1
    #dbg_value(ptr %p, !1964, !DIExpression(), !1965)
    #dbg_value(ptr %s, !1966, !DIExpression(), !1965)
    #dbg_value(ptr %P1, !1967, !DIExpression(), !1965)
    #dbg_value(ptr %P2, !1968, !DIExpression(), !1965)
    #dbg_value(ptr %P3, !1969, !DIExpression(), !1965)
    #dbg_value(ptr %eval, !1970, !DIExpression(), !1965)
    #dbg_declare(ptr %SPS, !1971, !DIExpression(), !1973)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(512) %SPS, i8 0, i32 512, i1 false), !dbg !1973
  call fastcc void @m_calculate_PS_SPS(ptr noundef %p, ptr noundef %P1, ptr noundef %P2, ptr noundef %P3, ptr noundef %s, ptr noundef nonnull %SPS) #6, !dbg !1974
    #dbg_declare(ptr %zero, !1975, !DIExpression(), !1976)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(64) %zero, i8 0, i32 64, i1 false), !dbg !1976
  call fastcc void @compute_rhs(ptr noundef %p, ptr noundef nonnull %SPS, ptr noundef nonnull %zero, ptr noundef %eval) #6, !dbg !1977
  ret void, !dbg !1978
}

; Function Attrs: nounwind
define internal fastcc void @m_calculate_PS_SPS(ptr noundef %p, ptr noundef %P1, ptr noundef %P2, ptr noundef %P3, ptr noundef %s, ptr noundef %SPS) unnamed_addr #0 !dbg !1979 {
entry:
  %PS = alloca [1296 x i64], align 8
    #dbg_value(ptr %p, !1982, !DIExpression(), !1983)
    #dbg_value(ptr %P1, !1984, !DIExpression(), !1983)
    #dbg_value(ptr %P2, !1985, !DIExpression(), !1983)
    #dbg_value(ptr %P3, !1986, !DIExpression(), !1983)
    #dbg_value(ptr %s, !1987, !DIExpression(), !1983)
    #dbg_value(ptr %SPS, !1988, !DIExpression(), !1983)
    #dbg_declare(ptr %PS, !1989, !DIExpression(), !1993)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(10368) %PS, i8 0, i32 10368, i1 false), !dbg !1993
  call fastcc void @mayo_generic_m_calculate_PS(ptr noundef %P1, ptr noundef %P2, ptr noundef %P3, ptr noundef %s, i32 noundef 64, i32 noundef 64, i32 noundef 17, i32 noundef 4, ptr noundef nonnull %PS) #6, !dbg !1994
  call fastcc void @mayo_generic_m_calculate_SPS(ptr noundef nonnull %PS, ptr noundef %s, i32 noundef 64, i32 noundef 4, i32 noundef 81, ptr noundef %SPS) #6, !dbg !1995
  ret void, !dbg !1996
}

; Function Attrs: nounwind
define internal fastcc void @mayo_generic_m_calculate_PS(ptr noundef %P1, ptr noundef %P2, ptr noundef %P3, ptr noundef %S, i32 noundef %m, i32 noundef %v, i32 noundef %o, i32 noundef %k, ptr noundef %PS) unnamed_addr #0 !dbg !1997 {
entry:
  %accumulator = alloca [20736 x i64], align 8
    #dbg_value(ptr %P1, !2000, !DIExpression(), !2001)
    #dbg_value(ptr %P2, !2002, !DIExpression(), !2001)
    #dbg_value(ptr %P3, !2003, !DIExpression(), !2001)
    #dbg_value(ptr %S, !2004, !DIExpression(), !2001)
    #dbg_value(i32 %m, !2005, !DIExpression(), !2001)
    #dbg_value(i32 %v, !2006, !DIExpression(), !2001)
    #dbg_value(i32 %o, !2007, !DIExpression(), !2001)
    #dbg_value(i32 %k, !2008, !DIExpression(), !2001)
    #dbg_value(ptr %PS, !2009, !DIExpression(), !2001)
  %add = add i32 %o, %v, !dbg !2010
    #dbg_value(i32 %add, !2011, !DIExpression(), !2001)
  %add1 = add nsw i32 %m, 15, !dbg !2012
  %div = sdiv i32 %add1, 16, !dbg !2013
    #dbg_value(i32 %div, !2014, !DIExpression(), !2001)
    #dbg_declare(ptr %accumulator, !2015, !DIExpression(), !2019)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(165888) %accumulator, i8 0, i32 165888, i1 false), !dbg !2019
    #dbg_value(i32 0, !2020, !DIExpression(), !2001)
    #dbg_value(i32 0, !2021, !DIExpression(), !2023)
  %smax = call i32 @llvm.smax.i32(i32 %k, i32 0), !dbg !2024
  %smax3 = call i32 @llvm.smax.i32(i32 %o, i32 0), !dbg !2024
  %smax5 = call i32 @llvm.smax.i32(i32 %v, i32 0), !dbg !2024
  br label %for.cond, !dbg !2024

for.cond:                                         ; preds = %for.inc52, %entry
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc52 ], [ %v, %entry ], !dbg !2025
  %P1_used.0 = phi i32 [ %P1_used.1, %for.inc52 ], [ 0, %entry ], !dbg !2025
  %row.0 = phi i32 [ %inc53, %for.inc52 ], [ 0, %entry ], !dbg !2026
    #dbg_value(i32 %row.0, !2021, !DIExpression(), !2023)
    #dbg_value(i32 %P1_used.0, !2020, !DIExpression(), !2001)
  %exitcond6.not = icmp eq i32 %row.0, %smax5, !dbg !2027
  br i1 %exitcond6.not, label %for.cond56.preheader, label %for.cond2.preheader, !dbg !2029

for.cond2.preheader:                              ; preds = %for.cond
  %0 = add i32 %P1_used.0, %indvars.iv, !dbg !2030
  br label %for.cond2, !dbg !2030

for.cond56.preheader:                             ; preds = %for.cond
  %smax8 = call i32 @llvm.smax.i32(i32 %v, i32 %add), !dbg !2033
  br label %for.cond56, !dbg !2033

for.cond2:                                        ; preds = %for.cond2.preheader, %for.inc17
  %P1_used.1 = phi i32 [ %inc16, %for.inc17 ], [ %P1_used.0, %for.cond2.preheader ], !dbg !2001
  %j.0 = phi i32 [ %inc18, %for.inc17 ], [ %row.0, %for.cond2.preheader ], !dbg !2035
    #dbg_value(i32 %j.0, !2036, !DIExpression(), !2037)
    #dbg_value(i32 %P1_used.1, !2020, !DIExpression(), !2001)
  %exitcond1.not = icmp eq i32 %P1_used.1, %0, !dbg !2038
  br i1 %exitcond1.not, label %for.cond21, label %for.cond5, !dbg !2030

for.cond5:                                        ; preds = %for.cond2, %for.body7
  %col.0 = phi i32 [ %inc, %for.body7 ], [ 0, %for.cond2 ], !dbg !2040
    #dbg_value(i32 %col.0, !2043, !DIExpression(), !2044)
  %exitcond.not = icmp eq i32 %col.0, %smax, !dbg !2045
  br i1 %exitcond.not, label %for.inc17, label %for.body7, !dbg !2047

for.body7:                                        ; preds = %for.cond5
  %mul = mul nsw i32 %P1_used.1, %div, !dbg !2048
  %add.ptr = getelementptr inbounds i64, ptr %P1, i32 %mul, !dbg !2050
  %mul8 = mul nsw i32 %row.0, %k, !dbg !2051
  %add9 = add nsw i32 %mul8, %col.0, !dbg !2052
  %mul10 = shl nsw i32 %add9, 4, !dbg !2053
  %mul11 = mul nsw i32 %col.0, %add, !dbg !2054
  %1 = getelementptr i8, ptr %S, i32 %mul11, !dbg !2055
  %arrayidx = getelementptr i8, ptr %1, i32 %j.0, !dbg !2055
  %2 = load i8, ptr %arrayidx, align 1, !dbg !2055
  %conv = zext i8 %2 to i32, !dbg !2055
  %add13 = add nsw i32 %mul10, %conv, !dbg !2056
  %mul14 = mul nsw i32 %add13, %div, !dbg !2057
  %add.ptr15 = getelementptr inbounds i64, ptr %accumulator, i32 %mul14, !dbg !2058
  call fastcc void @m_vec_add(i32 noundef %div, ptr noundef %add.ptr, ptr noundef nonnull %add.ptr15) #6, !dbg !2059
  %inc = add nuw i32 %col.0, 1, !dbg !2060
    #dbg_value(i32 %inc, !2043, !DIExpression(), !2044)
  br label %for.cond5, !dbg !2061, !llvm.loop !2062

for.inc17:                                        ; preds = %for.cond5
    #dbg_value(i32 %P1_used.1, !2020, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2001)
  %inc16 = add i32 %P1_used.1, 1, !dbg !2064
    #dbg_value(i32 %inc16, !2020, !DIExpression(), !2001)
  %inc18 = add nuw nsw i32 %j.0, 1, !dbg !2065
    #dbg_value(i32 %inc18, !2036, !DIExpression(), !2037)
  br label %for.cond2, !dbg !2066, !llvm.loop !2067

for.cond21:                                       ; preds = %for.cond2, %for.inc49
  %j20.0 = phi i32 [ %inc50, %for.inc49 ], [ 0, %for.cond2 ], !dbg !2069
    #dbg_value(i32 %j20.0, !2071, !DIExpression(), !2072)
  %exitcond4.not = icmp eq i32 %j20.0, %smax3, !dbg !2073
  br i1 %exitcond4.not, label %for.inc52, label %for.cond26, !dbg !2075

for.cond26:                                       ; preds = %for.cond21, %for.body29
  %col25.0 = phi i32 [ %inc47, %for.body29 ], [ 0, %for.cond21 ], !dbg !2076
    #dbg_value(i32 %col25.0, !2079, !DIExpression(), !2080)
  %exitcond2.not = icmp eq i32 %col25.0, %smax, !dbg !2081
  br i1 %exitcond2.not, label %for.inc49, label %for.body29, !dbg !2083

for.body29:                                       ; preds = %for.cond26
  %mul30 = mul nsw i32 %row.0, %o, !dbg !2084
  %add31 = add nsw i32 %mul30, %j20.0, !dbg !2086
  %mul32 = mul nsw i32 %add31, %div, !dbg !2087
  %add.ptr33 = getelementptr inbounds i64, ptr %P2, i32 %mul32, !dbg !2088
  %mul35 = mul nsw i32 %row.0, %k, !dbg !2089
  %add36 = add nsw i32 %mul35, %col25.0, !dbg !2090
  %mul37 = shl nsw i32 %add36, 4, !dbg !2091
  %mul38 = mul nsw i32 %col25.0, %add, !dbg !2092
  %3 = getelementptr i8, ptr %S, i32 %mul38, !dbg !2093
  %4 = getelementptr i8, ptr %3, i32 %j20.0, !dbg !2093
  %arrayidx41 = getelementptr i8, ptr %4, i32 %v, !dbg !2093
  %5 = load i8, ptr %arrayidx41, align 1, !dbg !2093
  %conv42 = zext i8 %5 to i32, !dbg !2093
  %add43 = add nsw i32 %mul37, %conv42, !dbg !2094
  %mul44 = mul nsw i32 %add43, %div, !dbg !2095
  %add.ptr45 = getelementptr inbounds i64, ptr %accumulator, i32 %mul44, !dbg !2096
  call fastcc void @m_vec_add(i32 noundef %div, ptr noundef %add.ptr33, ptr noundef nonnull %add.ptr45) #6, !dbg !2097
  %inc47 = add nuw i32 %col25.0, 1, !dbg !2098
    #dbg_value(i32 %inc47, !2079, !DIExpression(), !2080)
  br label %for.cond26, !dbg !2099, !llvm.loop !2100

for.inc49:                                        ; preds = %for.cond26
  %inc50 = add nuw i32 %j20.0, 1, !dbg !2102
    #dbg_value(i32 %inc50, !2071, !DIExpression(), !2072)
  br label %for.cond21, !dbg !2103, !llvm.loop !2104

for.inc52:                                        ; preds = %for.cond21
  %inc53 = add nuw i32 %row.0, 1, !dbg !2106
    #dbg_value(i32 %inc53, !2021, !DIExpression(), !2023)
  %indvars.iv.next = add i32 %indvars.iv, -1, !dbg !2107
  br label %for.cond, !dbg !2107, !llvm.loop !2108

for.cond56:                                       ; preds = %for.cond56.preheader, %for.inc90
  %P3_used.0 = phi i32 [ %P3_used.1, %for.inc90 ], [ 0, %for.cond56.preheader ], !dbg !2110
  %row55.0 = phi i32 [ %inc91, %for.inc90 ], [ %v, %for.cond56.preheader ], !dbg !2111
    #dbg_value(i32 %row55.0, !2112, !DIExpression(), !2113)
    #dbg_value(i32 %P3_used.0, !2114, !DIExpression(), !2001)
  %exitcond9.not = icmp eq i32 %row55.0, %smax8, !dbg !2115
  br i1 %exitcond9.not, label %while.cond.preheader, label %for.cond61, !dbg !2033

while.cond.preheader:                             ; preds = %for.cond56
  %6 = mul i32 %k, %add, !dbg !2117
  %smax10 = call i32 @llvm.smax.i32(i32 %6, i32 0), !dbg !2117
  br label %while.cond, !dbg !2117

for.cond61:                                       ; preds = %for.cond56, %for.inc87
  %P3_used.1 = phi i32 [ %inc86, %for.inc87 ], [ %P3_used.0, %for.cond56 ], !dbg !2001
  %j60.0 = phi i32 [ %inc88, %for.inc87 ], [ %row55.0, %for.cond56 ], !dbg !2118
    #dbg_value(i32 %j60.0, !2121, !DIExpression(), !2122)
    #dbg_value(i32 %P3_used.1, !2114, !DIExpression(), !2001)
  %cmp62 = icmp slt i32 %j60.0, %add, !dbg !2123
  br i1 %cmp62, label %for.cond66, label %for.inc90, !dbg !2125

for.cond66:                                       ; preds = %for.cond61, %for.body69
  %col65.0 = phi i32 [ %inc84, %for.body69 ], [ 0, %for.cond61 ], !dbg !2126
    #dbg_value(i32 %col65.0, !2129, !DIExpression(), !2130)
  %exitcond7.not = icmp eq i32 %col65.0, %smax, !dbg !2131
  br i1 %exitcond7.not, label %for.inc87, label %for.body69, !dbg !2133

for.body69:                                       ; preds = %for.cond66
  %mul70 = mul nsw i32 %P3_used.1, %div, !dbg !2134
  %add.ptr71 = getelementptr inbounds i64, ptr %P3, i32 %mul70, !dbg !2136
  %mul73 = mul nsw i32 %row55.0, %k, !dbg !2137
  %add74 = add nsw i32 %mul73, %col65.0, !dbg !2138
  %mul75 = shl nsw i32 %add74, 4, !dbg !2139
  %mul76 = mul nsw i32 %col65.0, %add, !dbg !2140
  %7 = getelementptr i8, ptr %S, i32 %mul76, !dbg !2141
  %arrayidx78 = getelementptr i8, ptr %7, i32 %j60.0, !dbg !2141
  %8 = load i8, ptr %arrayidx78, align 1, !dbg !2141
  %conv79 = zext i8 %8 to i32, !dbg !2141
  %add80 = add nsw i32 %mul75, %conv79, !dbg !2142
  %mul81 = mul nsw i32 %add80, %div, !dbg !2143
  %add.ptr82 = getelementptr inbounds i64, ptr %accumulator, i32 %mul81, !dbg !2144
  call fastcc void @m_vec_add(i32 noundef %div, ptr noundef %add.ptr71, ptr noundef nonnull %add.ptr82) #6, !dbg !2145
  %inc84 = add nuw i32 %col65.0, 1, !dbg !2146
    #dbg_value(i32 %inc84, !2129, !DIExpression(), !2130)
  br label %for.cond66, !dbg !2147, !llvm.loop !2148

for.inc87:                                        ; preds = %for.cond66
    #dbg_value(i32 %P3_used.1, !2114, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2001)
  %inc86 = add nsw i32 %P3_used.1, 1, !dbg !2150
    #dbg_value(i32 %inc86, !2114, !DIExpression(), !2001)
  %inc88 = add nsw i32 %j60.0, 1, !dbg !2151
    #dbg_value(i32 %inc88, !2121, !DIExpression(), !2122)
  br label %for.cond61, !dbg !2152, !llvm.loop !2153

for.inc90:                                        ; preds = %for.cond61
  %inc91 = add i32 %row55.0, 1, !dbg !2155
    #dbg_value(i32 %inc91, !2112, !DIExpression(), !2113)
  br label %for.cond56, !dbg !2156, !llvm.loop !2157

while.cond:                                       ; preds = %while.cond.preheader, %while.body
  %i.0 = phi i32 [ %inc102, %while.body ], [ 0, %while.cond.preheader ], !dbg !2001
    #dbg_value(i32 %i.0, !2159, !DIExpression(), !2001)
  %exitcond11.not = icmp eq i32 %i.0, %smax10, !dbg !2160
  br i1 %exitcond11.not, label %while.end, label %while.body, !dbg !2117

while.body:                                       ; preds = %while.cond
  %mul97 = shl nsw i32 %i.0, 4, !dbg !2161
  %mul98 = mul nsw i32 %mul97, %div, !dbg !2163
  %add.ptr99 = getelementptr inbounds i64, ptr %accumulator, i32 %mul98, !dbg !2164
  %mul100 = mul nsw i32 %i.0, %div, !dbg !2165
  %add.ptr101 = getelementptr inbounds i64, ptr %PS, i32 %mul100, !dbg !2166
  call fastcc void @m_vec_multiply_bins(i32 noundef %div, ptr noundef nonnull %add.ptr99, ptr noundef %add.ptr101) #6, !dbg !2167
  %inc102 = add nuw i32 %i.0, 1, !dbg !2168
    #dbg_value(i32 %inc102, !2159, !DIExpression(), !2001)
  br label %while.cond, !dbg !2117, !llvm.loop !2169

while.end:                                        ; preds = %while.cond
  ret void, !dbg !2171
}

; Function Attrs: nounwind
define internal fastcc void @mayo_generic_m_calculate_SPS(ptr noundef %PS, ptr noundef %S, i32 noundef %m, i32 noundef %k, i32 noundef %n, ptr noundef %SPS) unnamed_addr #0 !dbg !2172 {
entry:
  %accumulator = alloca [1024 x i64], align 8
    #dbg_value(ptr %PS, !2175, !DIExpression(), !2176)
    #dbg_value(ptr %S, !2177, !DIExpression(), !2176)
    #dbg_value(i32 %m, !2178, !DIExpression(), !2176)
    #dbg_value(i32 %k, !2179, !DIExpression(), !2176)
    #dbg_value(i32 %n, !2180, !DIExpression(), !2176)
    #dbg_value(ptr %SPS, !2181, !DIExpression(), !2176)
    #dbg_declare(ptr %accumulator, !2182, !DIExpression(), !2183)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(8192) %accumulator, i8 0, i32 8192, i1 false), !dbg !2183
  %add = add nsw i32 %m, 15, !dbg !2184
  %div = sdiv i32 %add, 16, !dbg !2185
    #dbg_value(i32 %div, !2186, !DIExpression(), !2176)
    #dbg_value(i32 0, !2187, !DIExpression(), !2189)
  %smax = call i32 @llvm.smax.i32(i32 %n, i32 0), !dbg !2190
  %smax2 = call i32 @llvm.smax.i32(i32 %k, i32 0), !dbg !2190
  br label %for.cond, !dbg !2190

for.cond:                                         ; preds = %for.inc20, %entry
  %row.0 = phi i32 [ 0, %entry ], [ %inc21, %for.inc20 ], !dbg !2191
    #dbg_value(i32 %row.0, !2187, !DIExpression(), !2189)
  %exitcond3.not = icmp eq i32 %row.0, %smax2, !dbg !2192
  br i1 %exitcond3.not, label %while.cond.preheader, label %for.cond1, !dbg !2194

while.cond.preheader:                             ; preds = %for.cond
  %0 = mul i32 %k, %k, !dbg !2195
  br label %while.cond, !dbg !2195

for.cond1:                                        ; preds = %for.cond, %for.inc18
  %j.0 = phi i32 [ %inc, %for.inc18 ], [ 0, %for.cond ], !dbg !2196
    #dbg_value(i32 %j.0, !2199, !DIExpression(), !2200)
  %exitcond1.not = icmp eq i32 %j.0, %smax, !dbg !2201
  br i1 %exitcond1.not, label %for.inc20, label %for.cond4, !dbg !2203

for.cond4:                                        ; preds = %for.cond1, %for.body6
  %col.0 = phi i32 [ %add17, %for.body6 ], [ 0, %for.cond1 ], !dbg !2204
    #dbg_value(i32 %col.0, !2207, !DIExpression(), !2208)
  %exitcond.not = icmp eq i32 %col.0, %k, !dbg !2209
  br i1 %exitcond.not, label %for.inc18, label %for.body6, !dbg !2211

for.body6:                                        ; preds = %for.cond4
  %mul = mul nsw i32 %j.0, %k, !dbg !2212
  %add7 = add nsw i32 %mul, %col.0, !dbg !2214
  %mul8 = mul nsw i32 %add7, %div, !dbg !2215
  %add.ptr = getelementptr inbounds i64, ptr %PS, i32 %mul8, !dbg !2216
  %mul9 = mul nsw i32 %row.0, %k, !dbg !2217
  %add10 = add nsw i32 %mul9, %col.0, !dbg !2218
  %mul11 = shl nsw i32 %add10, 4, !dbg !2219
  %mul12 = mul nsw i32 %row.0, %n, !dbg !2220
  %1 = getelementptr i8, ptr %S, i32 %mul12, !dbg !2221
  %arrayidx = getelementptr i8, ptr %1, i32 %j.0, !dbg !2221
  %2 = load i8, ptr %arrayidx, align 1, !dbg !2221
  %conv = zext i8 %2 to i32, !dbg !2221
  %add14 = add nsw i32 %mul11, %conv, !dbg !2222
  %mul15 = mul nsw i32 %add14, %div, !dbg !2223
  %add.ptr16 = getelementptr inbounds i64, ptr %accumulator, i32 %mul15, !dbg !2224
  call fastcc void @m_vec_add(i32 noundef %div, ptr noundef %add.ptr, ptr noundef nonnull %add.ptr16) #6, !dbg !2225
  %add17 = add nuw i32 %col.0, 1, !dbg !2226
    #dbg_value(i32 %add17, !2207, !DIExpression(), !2208)
  br label %for.cond4, !dbg !2227, !llvm.loop !2228

for.inc18:                                        ; preds = %for.cond4
  %inc = add nuw i32 %j.0, 1, !dbg !2230
    #dbg_value(i32 %inc, !2199, !DIExpression(), !2200)
  br label %for.cond1, !dbg !2231, !llvm.loop !2232

for.inc20:                                        ; preds = %for.cond1
  %inc21 = add nuw i32 %row.0, 1, !dbg !2234
    #dbg_value(i32 %inc21, !2187, !DIExpression(), !2189)
  br label %for.cond, !dbg !2235, !llvm.loop !2236

while.cond:                                       ; preds = %while.cond.preheader, %while.body
  %i.0 = phi i32 [ %inc32, %while.body ], [ 0, %while.cond.preheader ], !dbg !2176
    #dbg_value(i32 %i.0, !2238, !DIExpression(), !2176)
  %exitcond4.not = icmp eq i32 %i.0, %0, !dbg !2239
  br i1 %exitcond4.not, label %while.end, label %while.body, !dbg !2195

while.body:                                       ; preds = %while.cond
  %mul27 = shl nsw i32 %i.0, 4, !dbg !2240
  %mul28 = mul nsw i32 %mul27, %div, !dbg !2242
  %add.ptr29 = getelementptr inbounds i64, ptr %accumulator, i32 %mul28, !dbg !2243
  %mul30 = mul nsw i32 %i.0, %div, !dbg !2244
  %add.ptr31 = getelementptr inbounds i64, ptr %SPS, i32 %mul30, !dbg !2245
  call fastcc void @m_vec_multiply_bins(i32 noundef %div, ptr noundef nonnull %add.ptr29, ptr noundef %add.ptr31) #6, !dbg !2246
  %inc32 = add nuw i32 %i.0, 1, !dbg !2247
    #dbg_value(i32 %inc32, !2238, !DIExpression(), !2176)
  br label %while.cond, !dbg !2195, !llvm.loop !2248

while.end:                                        ; preds = %while.cond
  ret void, !dbg !2250
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_add(i32 noundef %m_vec_limbs, ptr noundef %in, ptr noundef %acc) unnamed_addr #0 !dbg !2251 {
entry:
    #dbg_value(i32 %m_vec_limbs, !2254, !DIExpression(), !2255)
    #dbg_value(ptr %in, !2256, !DIExpression(), !2255)
    #dbg_value(ptr %acc, !2257, !DIExpression(), !2255)
    #dbg_value(i32 0, !2258, !DIExpression(), !2260)
    #dbg_value(i32 0, !2258, !DIExpression(), !2260)
  %0 = load i64, ptr %in, align 8, !dbg !2261
  %1 = load i64, ptr %acc, align 8, !dbg !2264
  %xor = xor i64 %1, %0, !dbg !2264
  store i64 %xor, ptr %acc, align 8, !dbg !2264
    #dbg_value(i32 1, !2258, !DIExpression(), !2260)
  %arrayidx.1 = getelementptr inbounds nuw i8, ptr %in, i32 8, !dbg !2261
  %2 = load i64, ptr %arrayidx.1, align 8, !dbg !2261
  %arrayidx1.1 = getelementptr inbounds nuw i8, ptr %acc, i32 8, !dbg !2265
  %3 = load i64, ptr %arrayidx1.1, align 8, !dbg !2264
  %xor.1 = xor i64 %3, %2, !dbg !2264
  store i64 %xor.1, ptr %arrayidx1.1, align 8, !dbg !2264
    #dbg_value(i32 2, !2258, !DIExpression(), !2260)
  %arrayidx.2 = getelementptr inbounds nuw i8, ptr %in, i32 16, !dbg !2261
  %4 = load i64, ptr %arrayidx.2, align 8, !dbg !2261
  %arrayidx1.2 = getelementptr inbounds nuw i8, ptr %acc, i32 16, !dbg !2265
  %5 = load i64, ptr %arrayidx1.2, align 8, !dbg !2264
  %xor.2 = xor i64 %5, %4, !dbg !2264
  store i64 %xor.2, ptr %arrayidx1.2, align 8, !dbg !2264
    #dbg_value(i32 3, !2258, !DIExpression(), !2260)
  %arrayidx.3 = getelementptr inbounds nuw i8, ptr %in, i32 24, !dbg !2261
  %6 = load i64, ptr %arrayidx.3, align 8, !dbg !2261
  %arrayidx1.3 = getelementptr inbounds nuw i8, ptr %acc, i32 24, !dbg !2265
  %7 = load i64, ptr %arrayidx1.3, align 8, !dbg !2264
  %xor.3 = xor i64 %7, %6, !dbg !2264
  store i64 %xor.3, ptr %arrayidx1.3, align 8, !dbg !2264
    #dbg_value(i32 4, !2258, !DIExpression(), !2260)
  ret void, !dbg !2266
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_multiply_bins(i32 noundef %m_vec_limbs, ptr noundef %bins, ptr noundef %out) unnamed_addr #0 !dbg !2267 {
entry:
    #dbg_value(i32 %m_vec_limbs, !2270, !DIExpression(), !2271)
    #dbg_value(ptr %bins, !2272, !DIExpression(), !2271)
    #dbg_value(ptr %out, !2273, !DIExpression(), !2271)
  %add.ptr = getelementptr inbounds nuw i8, ptr %bins, i32 160, !dbg !2274
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %bins, i32 320, !dbg !2275
  call fastcc void @m_vec_mul_add_x_inv(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr, ptr noundef nonnull %add.ptr1) #6, !dbg !2276
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %bins, i32 352, !dbg !2277
  %add.ptr3 = getelementptr inbounds nuw i8, ptr %bins, i32 384, !dbg !2278
  call fastcc void @m_vec_mul_add_x(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr2, ptr noundef nonnull %add.ptr3) #6, !dbg !2279
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %bins, i32 320, !dbg !2280
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %bins, i32 224, !dbg !2281
  call fastcc void @m_vec_mul_add_x_inv(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr4, ptr noundef nonnull %add.ptr5) #6, !dbg !2282
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %bins, i32 384, !dbg !2283
  %add.ptr7 = getelementptr inbounds nuw i8, ptr %bins, i32 192, !dbg !2284
  call fastcc void @m_vec_mul_add_x(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr6, ptr noundef nonnull %add.ptr7) #6, !dbg !2285
  %add.ptr8 = getelementptr inbounds nuw i8, ptr %bins, i32 224, !dbg !2286
  %add.ptr9 = getelementptr inbounds nuw i8, ptr %bins, i32 448, !dbg !2287
  call fastcc void @m_vec_mul_add_x_inv(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr8, ptr noundef nonnull %add.ptr9) #6, !dbg !2288
  %add.ptr10 = getelementptr inbounds nuw i8, ptr %bins, i32 192, !dbg !2289
  %add.ptr11 = getelementptr inbounds nuw i8, ptr %bins, i32 96, !dbg !2290
  call fastcc void @m_vec_mul_add_x(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr10, ptr noundef nonnull %add.ptr11) #6, !dbg !2291
  %add.ptr12 = getelementptr inbounds nuw i8, ptr %bins, i32 448, !dbg !2292
  %add.ptr13 = getelementptr inbounds nuw i8, ptr %bins, i32 480, !dbg !2293
  call fastcc void @m_vec_mul_add_x_inv(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr12, ptr noundef nonnull %add.ptr13) #6, !dbg !2294
  %add.ptr14 = getelementptr inbounds nuw i8, ptr %bins, i32 96, !dbg !2295
  %add.ptr15 = getelementptr inbounds nuw i8, ptr %bins, i32 256, !dbg !2296
  call fastcc void @m_vec_mul_add_x(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr14, ptr noundef nonnull %add.ptr15) #6, !dbg !2297
  %add.ptr16 = getelementptr inbounds nuw i8, ptr %bins, i32 480, !dbg !2298
  %add.ptr17 = getelementptr inbounds nuw i8, ptr %bins, i32 416, !dbg !2299
  call fastcc void @m_vec_mul_add_x_inv(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr16, ptr noundef nonnull %add.ptr17) #6, !dbg !2300
  %add.ptr18 = getelementptr inbounds nuw i8, ptr %bins, i32 256, !dbg !2301
  %add.ptr19 = getelementptr inbounds nuw i8, ptr %bins, i32 128, !dbg !2302
  call fastcc void @m_vec_mul_add_x(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr18, ptr noundef nonnull %add.ptr19) #6, !dbg !2303
  %add.ptr20 = getelementptr inbounds nuw i8, ptr %bins, i32 416, !dbg !2304
  %add.ptr21 = getelementptr inbounds nuw i8, ptr %bins, i32 288, !dbg !2305
  call fastcc void @m_vec_mul_add_x_inv(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr20, ptr noundef nonnull %add.ptr21) #6, !dbg !2306
  %add.ptr22 = getelementptr inbounds nuw i8, ptr %bins, i32 128, !dbg !2307
  %add.ptr23 = getelementptr inbounds nuw i8, ptr %bins, i32 64, !dbg !2308
  call fastcc void @m_vec_mul_add_x(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr22, ptr noundef nonnull %add.ptr23) #6, !dbg !2309
  %add.ptr24 = getelementptr inbounds nuw i8, ptr %bins, i32 288, !dbg !2310
  %add.ptr25 = getelementptr inbounds nuw i8, ptr %bins, i32 32, !dbg !2311
  call fastcc void @m_vec_mul_add_x_inv(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr24, ptr noundef nonnull %add.ptr25) #6, !dbg !2312
  %add.ptr26 = getelementptr inbounds nuw i8, ptr %bins, i32 64, !dbg !2313
  %add.ptr27 = getelementptr inbounds nuw i8, ptr %bins, i32 32, !dbg !2314
  call fastcc void @m_vec_mul_add_x(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr26, ptr noundef nonnull %add.ptr27) #6, !dbg !2315
  %add.ptr28 = getelementptr inbounds nuw i8, ptr %bins, i32 32, !dbg !2316
  call fastcc void @m_vec_copy(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr28, ptr noundef %out) #6, !dbg !2317
  ret void, !dbg !2318
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_mul_add_x_inv(i32 noundef %m_vec_limbs, ptr noundef %in, ptr noundef %acc) unnamed_addr #0 !dbg !2319 {
entry:
    #dbg_value(i32 %m_vec_limbs, !2320, !DIExpression(), !2321)
    #dbg_value(ptr %in, !2322, !DIExpression(), !2321)
    #dbg_value(ptr %acc, !2323, !DIExpression(), !2321)
    #dbg_value(i64 1229782938247303441, !2324, !DIExpression(), !2321)
    #dbg_value(i32 0, !2325, !DIExpression(), !2327)
    #dbg_value(i32 0, !2325, !DIExpression(), !2327)
  %0 = load i64, ptr %in, align 8, !dbg !2328
  %and = and i64 %0, 1229782938247303441, !dbg !2331
    #dbg_value(i64 %and, !2332, !DIExpression(), !2333)
  %xor = lshr i64 %0, 1, !dbg !2334
  %shr = and i64 %xor, 8608480567731124087, !dbg !2334
  %mul = mul nuw i64 %and, 9, !dbg !2335
  %xor2 = xor i64 %shr, %mul, !dbg !2336
  %1 = load i64, ptr %acc, align 8, !dbg !2337
  %xor4 = xor i64 %1, %xor2, !dbg !2337
  store i64 %xor4, ptr %acc, align 8, !dbg !2337
    #dbg_value(i32 1, !2325, !DIExpression(), !2327)
  %arrayidx.1 = getelementptr inbounds nuw i8, ptr %in, i32 8, !dbg !2328
  %2 = load i64, ptr %arrayidx.1, align 8, !dbg !2328
  %and.1 = and i64 %2, 1229782938247303441, !dbg !2331
    #dbg_value(i64 %and.1, !2332, !DIExpression(), !2333)
  %xor.1 = lshr i64 %2, 1, !dbg !2334
  %shr.1 = and i64 %xor.1, 8608480567731124087, !dbg !2334
  %mul.1 = mul nuw i64 %and.1, 9, !dbg !2335
  %xor2.1 = xor i64 %shr.1, %mul.1, !dbg !2336
  %arrayidx3.1 = getelementptr inbounds nuw i8, ptr %acc, i32 8, !dbg !2338
  %3 = load i64, ptr %arrayidx3.1, align 8, !dbg !2337
  %xor4.1 = xor i64 %3, %xor2.1, !dbg !2337
  store i64 %xor4.1, ptr %arrayidx3.1, align 8, !dbg !2337
    #dbg_value(i32 2, !2325, !DIExpression(), !2327)
  %arrayidx.2 = getelementptr inbounds nuw i8, ptr %in, i32 16, !dbg !2328
  %4 = load i64, ptr %arrayidx.2, align 8, !dbg !2328
  %and.2 = and i64 %4, 1229782938247303441, !dbg !2331
    #dbg_value(i64 %and.2, !2332, !DIExpression(), !2333)
  %xor.2 = lshr i64 %4, 1, !dbg !2334
  %shr.2 = and i64 %xor.2, 8608480567731124087, !dbg !2334
  %mul.2 = mul nuw i64 %and.2, 9, !dbg !2335
  %xor2.2 = xor i64 %shr.2, %mul.2, !dbg !2336
  %arrayidx3.2 = getelementptr inbounds nuw i8, ptr %acc, i32 16, !dbg !2338
  %5 = load i64, ptr %arrayidx3.2, align 8, !dbg !2337
  %xor4.2 = xor i64 %5, %xor2.2, !dbg !2337
  store i64 %xor4.2, ptr %arrayidx3.2, align 8, !dbg !2337
    #dbg_value(i32 3, !2325, !DIExpression(), !2327)
  %arrayidx.3 = getelementptr inbounds nuw i8, ptr %in, i32 24, !dbg !2328
  %6 = load i64, ptr %arrayidx.3, align 8, !dbg !2328
  %and.3 = and i64 %6, 1229782938247303441, !dbg !2331
    #dbg_value(i64 %and.3, !2332, !DIExpression(), !2333)
  %xor.3 = lshr i64 %6, 1, !dbg !2334
  %shr.3 = and i64 %xor.3, 8608480567731124087, !dbg !2334
  %mul.3 = mul nuw i64 %and.3, 9, !dbg !2335
  %xor2.3 = xor i64 %shr.3, %mul.3, !dbg !2336
  %arrayidx3.3 = getelementptr inbounds nuw i8, ptr %acc, i32 24, !dbg !2338
  %7 = load i64, ptr %arrayidx3.3, align 8, !dbg !2337
  %xor4.3 = xor i64 %7, %xor2.3, !dbg !2337
  store i64 %xor4.3, ptr %arrayidx3.3, align 8, !dbg !2337
    #dbg_value(i32 4, !2325, !DIExpression(), !2327)
  ret void, !dbg !2339
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_mul_add_x(i32 noundef %m_vec_limbs, ptr noundef %in, ptr noundef %acc) unnamed_addr #0 !dbg !2340 {
entry:
    #dbg_value(i32 %m_vec_limbs, !2341, !DIExpression(), !2342)
    #dbg_value(ptr %in, !2343, !DIExpression(), !2342)
    #dbg_value(ptr %acc, !2344, !DIExpression(), !2342)
    #dbg_value(i64 -8608480567731124088, !2345, !DIExpression(), !2342)
    #dbg_value(i32 0, !2346, !DIExpression(), !2348)
    #dbg_value(i32 0, !2346, !DIExpression(), !2348)
  %0 = load i64, ptr %in, align 8, !dbg !2349
    #dbg_value(i64 %0, !2352, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2353)
  %xor = shl i64 %0, 1, !dbg !2354
  %shl = and i64 %xor, -1229782938247303442, !dbg !2354
  %and = lshr i64 %0, 3, !dbg !2355
  %shr = and i64 %and, 1229782938247303441, !dbg !2355
  %mul = mul nuw nsw i64 %shr, 3, !dbg !2356
  %xor2 = xor i64 %shl, %mul, !dbg !2357
  %1 = load i64, ptr %acc, align 8, !dbg !2358
  %xor4 = xor i64 %1, %xor2, !dbg !2358
  store i64 %xor4, ptr %acc, align 8, !dbg !2358
    #dbg_value(i32 1, !2346, !DIExpression(), !2348)
  %arrayidx.1 = getelementptr inbounds nuw i8, ptr %in, i32 8, !dbg !2349
  %2 = load i64, ptr %arrayidx.1, align 8, !dbg !2349
    #dbg_value(i64 %2, !2352, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2353)
  %xor.1 = shl i64 %2, 1, !dbg !2354
  %shl.1 = and i64 %xor.1, -1229782938247303442, !dbg !2354
  %and.1 = lshr i64 %2, 3, !dbg !2355
  %shr.1 = and i64 %and.1, 1229782938247303441, !dbg !2355
  %mul.1 = mul nuw nsw i64 %shr.1, 3, !dbg !2356
  %xor2.1 = xor i64 %shl.1, %mul.1, !dbg !2357
  %arrayidx3.1 = getelementptr inbounds nuw i8, ptr %acc, i32 8, !dbg !2359
  %3 = load i64, ptr %arrayidx3.1, align 8, !dbg !2358
  %xor4.1 = xor i64 %3, %xor2.1, !dbg !2358
  store i64 %xor4.1, ptr %arrayidx3.1, align 8, !dbg !2358
    #dbg_value(i32 2, !2346, !DIExpression(), !2348)
  %arrayidx.2 = getelementptr inbounds nuw i8, ptr %in, i32 16, !dbg !2349
  %4 = load i64, ptr %arrayidx.2, align 8, !dbg !2349
    #dbg_value(i64 %4, !2352, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2353)
  %xor.2 = shl i64 %4, 1, !dbg !2354
  %shl.2 = and i64 %xor.2, -1229782938247303442, !dbg !2354
  %and.2 = lshr i64 %4, 3, !dbg !2355
  %shr.2 = and i64 %and.2, 1229782938247303441, !dbg !2355
  %mul.2 = mul nuw nsw i64 %shr.2, 3, !dbg !2356
  %xor2.2 = xor i64 %shl.2, %mul.2, !dbg !2357
  %arrayidx3.2 = getelementptr inbounds nuw i8, ptr %acc, i32 16, !dbg !2359
  %5 = load i64, ptr %arrayidx3.2, align 8, !dbg !2358
  %xor4.2 = xor i64 %5, %xor2.2, !dbg !2358
  store i64 %xor4.2, ptr %arrayidx3.2, align 8, !dbg !2358
    #dbg_value(i32 3, !2346, !DIExpression(), !2348)
  %arrayidx.3 = getelementptr inbounds nuw i8, ptr %in, i32 24, !dbg !2349
  %6 = load i64, ptr %arrayidx.3, align 8, !dbg !2349
    #dbg_value(i64 %6, !2352, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2353)
  %xor.3 = shl i64 %6, 1, !dbg !2354
  %shl.3 = and i64 %xor.3, -1229782938247303442, !dbg !2354
  %and.3 = lshr i64 %6, 3, !dbg !2355
  %shr.3 = and i64 %and.3, 1229782938247303441, !dbg !2355
  %mul.3 = mul nuw nsw i64 %shr.3, 3, !dbg !2356
  %xor2.3 = xor i64 %shl.3, %mul.3, !dbg !2357
  %arrayidx3.3 = getelementptr inbounds nuw i8, ptr %acc, i32 24, !dbg !2359
  %7 = load i64, ptr %arrayidx3.3, align 8, !dbg !2358
  %xor4.3 = xor i64 %7, %xor2.3, !dbg !2358
  store i64 %xor4.3, ptr %arrayidx3.3, align 8, !dbg !2358
    #dbg_value(i32 4, !2346, !DIExpression(), !2348)
  ret void, !dbg !2360
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_copy(i32 noundef %m_vec_limbs, ptr noundef %in, ptr noundef %out) unnamed_addr #0 !dbg !2361 {
entry:
    #dbg_value(i32 %m_vec_limbs, !2362, !DIExpression(), !2363)
    #dbg_value(ptr %in, !2364, !DIExpression(), !2363)
    #dbg_value(ptr %out, !2365, !DIExpression(), !2363)
    #dbg_value(i32 0, !2366, !DIExpression(), !2368)
    #dbg_value(i32 0, !2366, !DIExpression(), !2368)
  %0 = load i64, ptr %in, align 8, !dbg !2369
  store i64 %0, ptr %out, align 8, !dbg !2372
    #dbg_value(i32 1, !2366, !DIExpression(), !2368)
  %arrayidx.1 = getelementptr inbounds nuw i8, ptr %in, i32 8, !dbg !2369
  %1 = load i64, ptr %arrayidx.1, align 8, !dbg !2369
  %arrayidx1.1 = getelementptr inbounds nuw i8, ptr %out, i32 8, !dbg !2373
  store i64 %1, ptr %arrayidx1.1, align 8, !dbg !2372
    #dbg_value(i32 2, !2366, !DIExpression(), !2368)
  %arrayidx.2 = getelementptr inbounds nuw i8, ptr %in, i32 16, !dbg !2369
  %2 = load i64, ptr %arrayidx.2, align 8, !dbg !2369
  %arrayidx1.2 = getelementptr inbounds nuw i8, ptr %out, i32 16, !dbg !2373
  store i64 %2, ptr %arrayidx1.2, align 8, !dbg !2372
    #dbg_value(i32 3, !2366, !DIExpression(), !2368)
  %arrayidx.3 = getelementptr inbounds nuw i8, ptr %in, i32 24, !dbg !2369
  %3 = load i64, ptr %arrayidx.3, align 8, !dbg !2369
  %arrayidx1.3 = getelementptr inbounds nuw i8, ptr %out, i32 24, !dbg !2373
  store i64 %3, ptr %arrayidx1.3, align 8, !dbg !2372
    #dbg_value(i32 4, !2366, !DIExpression(), !2368)
  ret void, !dbg !2374
}

; Function Attrs: nounwind
define dso_local void @pqmayo_MAYO_2_ref_m_upper(ptr noundef %p, ptr noundef %in, ptr noundef %out, i32 noundef %size) local_unnamed_addr #0 !dbg !2375 {
entry:
    #dbg_value(ptr %p, !2406, !DIExpression(), !2407)
    #dbg_value(ptr %in, !2408, !DIExpression(), !2407)
    #dbg_value(ptr %out, !2409, !DIExpression(), !2407)
    #dbg_value(i32 %size, !2410, !DIExpression(), !2407)
    #dbg_value(i32 4, !2411, !DIExpression(), !2407)
    #dbg_value(i32 0, !2412, !DIExpression(), !2407)
    #dbg_value(i32 0, !2413, !DIExpression(), !2415)
  %smax = call i32 @llvm.smax.i32(i32 %size, i32 0), !dbg !2416
  br label %for.cond, !dbg !2416

for.cond:                                         ; preds = %for.inc15, %entry
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc15 ], [ %size, %entry ], !dbg !2417
  %m_vecs_stored.0 = phi i32 [ %m_vecs_stored.1, %for.inc15 ], [ 0, %entry ], !dbg !2417
  %r.0 = phi i32 [ %inc16, %for.inc15 ], [ 0, %entry ], !dbg !2418
    #dbg_value(i32 %r.0, !2413, !DIExpression(), !2415)
    #dbg_value(i32 %m_vecs_stored.0, !2412, !DIExpression(), !2407)
  %exitcond1.not = icmp eq i32 %r.0, %smax, !dbg !2419
  br i1 %exitcond1.not, label %for.end17, label %for.cond1.preheader, !dbg !2421

for.cond1.preheader:                              ; preds = %for.cond
  %0 = add i32 %m_vecs_stored.0, %indvars.iv, !dbg !2422
  br label %for.cond1, !dbg !2422

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc
  %m_vecs_stored.1 = phi i32 [ %inc, %for.inc ], [ %m_vecs_stored.0, %for.cond1.preheader ], !dbg !2407
  %c.0 = phi i32 [ %inc14, %for.inc ], [ %r.0, %for.cond1.preheader ], !dbg !2425
    #dbg_value(i32 %c.0, !2426, !DIExpression(), !2427)
    #dbg_value(i32 %m_vecs_stored.1, !2412, !DIExpression(), !2407)
  %exitcond.not = icmp eq i32 %m_vecs_stored.1, %0, !dbg !2428
  br i1 %exitcond.not, label %for.inc15, label %for.body3, !dbg !2422

for.body3:                                        ; preds = %for.cond1
  %mul = mul nsw i32 %r.0, %size, !dbg !2430
  %add = add nsw i32 %mul, %c.0, !dbg !2432
  %add.ptr.idx = shl nsw i32 %add, 5, !dbg !2433
  %add.ptr = getelementptr inbounds i8, ptr %in, i32 %add.ptr.idx, !dbg !2433
  %add.ptr6.idx = shl nsw i32 %m_vecs_stored.1, 5, !dbg !2434
  %add.ptr6 = getelementptr inbounds i8, ptr %out, i32 %add.ptr6.idx, !dbg !2434
  call fastcc void @m_vec_copy.17(i32 noundef 4, ptr noundef %add.ptr, ptr noundef %add.ptr6) #6, !dbg !2435
  %cmp7.not = icmp eq i32 %r.0, %c.0, !dbg !2436
  br i1 %cmp7.not, label %for.inc, label %if.then, !dbg !2436

if.then:                                          ; preds = %for.body3
  %mul8 = mul nsw i32 %c.0, %size, !dbg !2438
  %add9 = add nsw i32 %mul8, %r.0, !dbg !2440
  %add.ptr11.idx = shl nsw i32 %add9, 5, !dbg !2441
  %add.ptr11 = getelementptr inbounds i8, ptr %in, i32 %add.ptr11.idx, !dbg !2441
  %add.ptr13.idx = shl nsw i32 %m_vecs_stored.1, 5, !dbg !2442
  %add.ptr13 = getelementptr inbounds i8, ptr %out, i32 %add.ptr13.idx, !dbg !2442
  call fastcc void @m_vec_add.18(i32 noundef 4, ptr noundef %add.ptr11, ptr noundef %add.ptr13) #6, !dbg !2443
  br label %for.inc, !dbg !2444

for.inc:                                          ; preds = %for.body3, %if.then
    #dbg_value(i32 %m_vecs_stored.1, !2412, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2407)
  %inc = add i32 %m_vecs_stored.1, 1, !dbg !2445
    #dbg_value(i32 %inc, !2412, !DIExpression(), !2407)
  %inc14 = add nuw nsw i32 %c.0, 1, !dbg !2446
    #dbg_value(i32 %inc14, !2426, !DIExpression(), !2427)
  br label %for.cond1, !dbg !2447, !llvm.loop !2448

for.inc15:                                        ; preds = %for.cond1
  %inc16 = add nuw i32 %r.0, 1, !dbg !2450
    #dbg_value(i32 %inc16, !2413, !DIExpression(), !2415)
  %indvars.iv.next = add i32 %indvars.iv, -1, !dbg !2451
  br label %for.cond, !dbg !2451, !llvm.loop !2452

for.end17:                                        ; preds = %for.cond
  ret void, !dbg !2454
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_copy.17(i32 noundef %m_vec_limbs, ptr noundef %in, ptr noundef %out) unnamed_addr #0 !dbg !2455 {
entry:
    #dbg_value(i32 %m_vec_limbs, !2456, !DIExpression(), !2457)
    #dbg_value(ptr %in, !2458, !DIExpression(), !2457)
    #dbg_value(ptr %out, !2459, !DIExpression(), !2457)
    #dbg_value(i32 0, !2460, !DIExpression(), !2462)
    #dbg_value(i32 0, !2460, !DIExpression(), !2462)
  %0 = load i64, ptr %in, align 8, !dbg !2463
  store i64 %0, ptr %out, align 8, !dbg !2466
    #dbg_value(i32 1, !2460, !DIExpression(), !2462)
  %arrayidx.1 = getelementptr inbounds nuw i8, ptr %in, i32 8, !dbg !2463
  %1 = load i64, ptr %arrayidx.1, align 8, !dbg !2463
  %arrayidx1.1 = getelementptr inbounds nuw i8, ptr %out, i32 8, !dbg !2467
  store i64 %1, ptr %arrayidx1.1, align 8, !dbg !2466
    #dbg_value(i32 2, !2460, !DIExpression(), !2462)
  %arrayidx.2 = getelementptr inbounds nuw i8, ptr %in, i32 16, !dbg !2463
  %2 = load i64, ptr %arrayidx.2, align 8, !dbg !2463
  %arrayidx1.2 = getelementptr inbounds nuw i8, ptr %out, i32 16, !dbg !2467
  store i64 %2, ptr %arrayidx1.2, align 8, !dbg !2466
    #dbg_value(i32 3, !2460, !DIExpression(), !2462)
  %arrayidx.3 = getelementptr inbounds nuw i8, ptr %in, i32 24, !dbg !2463
  %3 = load i64, ptr %arrayidx.3, align 8, !dbg !2463
  %arrayidx1.3 = getelementptr inbounds nuw i8, ptr %out, i32 24, !dbg !2467
  store i64 %3, ptr %arrayidx1.3, align 8, !dbg !2466
    #dbg_value(i32 4, !2460, !DIExpression(), !2462)
  ret void, !dbg !2468
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_add.18(i32 noundef %m_vec_limbs, ptr noundef %in, ptr noundef %acc) unnamed_addr #0 !dbg !2469 {
entry:
    #dbg_value(i32 %m_vec_limbs, !2470, !DIExpression(), !2471)
    #dbg_value(ptr %in, !2472, !DIExpression(), !2471)
    #dbg_value(ptr %acc, !2473, !DIExpression(), !2471)
    #dbg_value(i32 0, !2474, !DIExpression(), !2476)
    #dbg_value(i32 0, !2474, !DIExpression(), !2476)
  %0 = load i64, ptr %in, align 8, !dbg !2477
  %1 = load i64, ptr %acc, align 8, !dbg !2480
  %xor = xor i64 %1, %0, !dbg !2480
  store i64 %xor, ptr %acc, align 8, !dbg !2480
    #dbg_value(i32 1, !2474, !DIExpression(), !2476)
  %arrayidx.1 = getelementptr inbounds nuw i8, ptr %in, i32 8, !dbg !2477
  %2 = load i64, ptr %arrayidx.1, align 8, !dbg !2477
  %arrayidx1.1 = getelementptr inbounds nuw i8, ptr %acc, i32 8, !dbg !2481
  %3 = load i64, ptr %arrayidx1.1, align 8, !dbg !2480
  %xor.1 = xor i64 %3, %2, !dbg !2480
  store i64 %xor.1, ptr %arrayidx1.1, align 8, !dbg !2480
    #dbg_value(i32 2, !2474, !DIExpression(), !2476)
  %arrayidx.2 = getelementptr inbounds nuw i8, ptr %in, i32 16, !dbg !2477
  %4 = load i64, ptr %arrayidx.2, align 8, !dbg !2477
  %arrayidx1.2 = getelementptr inbounds nuw i8, ptr %acc, i32 16, !dbg !2481
  %5 = load i64, ptr %arrayidx1.2, align 8, !dbg !2480
  %xor.2 = xor i64 %5, %4, !dbg !2480
  store i64 %xor.2, ptr %arrayidx1.2, align 8, !dbg !2480
    #dbg_value(i32 3, !2474, !DIExpression(), !2476)
  %arrayidx.3 = getelementptr inbounds nuw i8, ptr %in, i32 24, !dbg !2477
  %6 = load i64, ptr %arrayidx.3, align 8, !dbg !2477
  %arrayidx1.3 = getelementptr inbounds nuw i8, ptr %acc, i32 24, !dbg !2481
  %7 = load i64, ptr %arrayidx1.3, align 8, !dbg !2480
  %xor.3 = xor i64 %7, %6, !dbg !2480
  store i64 %xor.3, ptr %arrayidx1.3, align 8, !dbg !2480
    #dbg_value(i32 4, !2474, !DIExpression(), !2476)
  ret void, !dbg !2482
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_2_ref_sample_solution(ptr noundef %p, ptr noundef %A, ptr noundef %y, ptr noundef %r, ptr noundef %x, i32 noundef %k, i32 noundef %o, i32 noundef %m, i32 noundef %A_cols) local_unnamed_addr #0 !dbg !2483 {
entry:
  %Ar = alloca [64 x i8], align 1
    #dbg_value(ptr %p, !2486, !DIExpression(), !2487)
    #dbg_value(ptr %A, !2488, !DIExpression(), !2487)
    #dbg_value(ptr %y, !2489, !DIExpression(), !2487)
    #dbg_value(ptr %r, !2490, !DIExpression(), !2487)
    #dbg_value(ptr %x, !2491, !DIExpression(), !2487)
    #dbg_value(i32 %k, !2492, !DIExpression(), !2487)
    #dbg_value(i32 %o, !2493, !DIExpression(), !2487)
    #dbg_value(i32 %m, !2494, !DIExpression(), !2487)
    #dbg_value(i32 %A_cols, !2495, !DIExpression(), !2487)
    #dbg_value(i32 0, !2496, !DIExpression(), !2498)
  %0 = mul nsw i32 %o, %k, !dbg !2499
  %smax = call i32 @llvm.smax.i32(i32 %0, i32 0), !dbg !2499
  br label %for.cond, !dbg !2499

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2500
    #dbg_value(i32 %i.0, !2496, !DIExpression(), !2498)
  %exitcond.not = icmp eq i32 %i.0, %smax, !dbg !2501
  br i1 %exitcond.not, label %for.cond3.preheader, label %for.body, !dbg !2503

for.cond3.preheader:                              ; preds = %for.cond
  %smax13 = call i32 @llvm.smax.i32(i32 %m, i32 0), !dbg !2504
  br label %for.cond3, !dbg !2504

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !2506
  %1 = load i8, ptr %arrayidx, align 1, !dbg !2506
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2508
  store i8 %1, ptr %arrayidx1, align 1, !dbg !2509
  %inc = add nuw i32 %i.0, 1, !dbg !2510
    #dbg_value(i32 %inc, !2496, !DIExpression(), !2498)
  br label %for.cond, !dbg !2511, !llvm.loop !2512

for.cond3:                                        ; preds = %for.cond3.preheader, %for.body5
  %i2.0 = phi i32 [ %inc12, %for.body5 ], [ 0, %for.cond3.preheader ], !dbg !2514
    #dbg_value(i32 %i2.0, !2515, !DIExpression(), !2516)
  %exitcond14.not = icmp eq i32 %i2.0, %smax13, !dbg !2517
  br i1 %exitcond14.not, label %for.end13, label %for.body5, !dbg !2504

for.body5:                                        ; preds = %for.cond3
  %mul6 = mul nsw i32 %k, %o, !dbg !2519
  %mul7 = mul nsw i32 %k, %o, !dbg !2521
  %add = add nsw i32 %mul7, 1, !dbg !2522
  %mul8 = mul nsw i32 %i2.0, %add, !dbg !2523
  %2 = getelementptr i8, ptr %A, i32 %mul6, !dbg !2524
  %arrayidx10 = getelementptr i8, ptr %2, i32 %mul8, !dbg !2524
  store i8 0, ptr %arrayidx10, align 1, !dbg !2525
  %inc12 = add nuw i32 %i2.0, 1, !dbg !2526
    #dbg_value(i32 %inc12, !2515, !DIExpression(), !2516)
  br label %for.cond3, !dbg !2527, !llvm.loop !2528

for.end13:                                        ; preds = %for.cond3
  %mul14 = mul nsw i32 %k, %o, !dbg !2530
  %add15 = add nsw i32 %mul14, 1, !dbg !2531
  call fastcc void @mat_mul.21(ptr noundef %A, ptr noundef %r, ptr noundef nonnull %Ar, i32 noundef %add15, i32 noundef %m, i32 noundef 1) #6, !dbg !2532
    #dbg_value(i32 0, !2533, !DIExpression(), !2535)
  br label %for.cond17, !dbg !2536

for.cond17:                                       ; preds = %for.body19, %for.end13
  %i16.0 = phi i32 [ 0, %for.end13 ], [ %inc29, %for.body19 ], !dbg !2537
    #dbg_value(i32 %i16.0, !2533, !DIExpression(), !2535)
  %exitcond15.not = icmp eq i32 %i16.0, %smax13, !dbg !2538
  br i1 %exitcond15.not, label %for.end30, label %for.body19, !dbg !2540

for.body19:                                       ; preds = %for.cond17
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %y, i32 %i16.0, !dbg !2541
  %3 = load i8, ptr %arrayidx20, align 1, !dbg !2541
  %arrayidx21 = getelementptr inbounds nuw [64 x i8], ptr %Ar, i32 0, i32 %i16.0, !dbg !2543
  %4 = load i8, ptr %arrayidx21, align 1, !dbg !2543
  %call = call fastcc zeroext i8 @sub_f(i8 noundef zeroext %3, i8 noundef zeroext %4) #6, !dbg !2544
  %mul22 = mul nsw i32 %k, %o, !dbg !2545
  %mul23 = mul nsw i32 %k, %o, !dbg !2546
  %add24 = add nsw i32 %mul23, 1, !dbg !2547
  %mul25 = mul nsw i32 %i16.0, %add24, !dbg !2548
  %5 = getelementptr i8, ptr %A, i32 %mul22, !dbg !2549
  %arrayidx27 = getelementptr i8, ptr %5, i32 %mul25, !dbg !2549
  store i8 %call, ptr %arrayidx27, align 1, !dbg !2550
  %inc29 = add nuw i32 %i16.0, 1, !dbg !2551
    #dbg_value(i32 %inc29, !2533, !DIExpression(), !2535)
  br label %for.cond17, !dbg !2552, !llvm.loop !2553

for.end30:                                        ; preds = %for.cond17
  %mul31 = mul nsw i32 %k, %o, !dbg !2555
  %add32 = add nsw i32 %mul31, 1, !dbg !2556
  call fastcc void @EF(ptr noundef %A, i32 noundef %m, i32 noundef %add32) #6, !dbg !2557
    #dbg_value(i8 0, !2558, !DIExpression(), !2487)
    #dbg_value(i32 0, !2559, !DIExpression(), !2561)
  %6 = add i32 %A_cols, -1, !dbg !2562
  %smax16 = call i32 @llvm.smax.i32(i32 %6, i32 0), !dbg !2562
  br label %for.cond34, !dbg !2562

for.cond34:                                       ; preds = %for.inc43, %for.end30
  %full_rank.0 = phi i8 [ 0, %for.end30 ], [ %or12, %for.inc43 ], !dbg !2487
  %i33.0 = phi i32 [ 0, %for.end30 ], [ %inc44, %for.inc43 ], !dbg !2563
    #dbg_value(i32 %i33.0, !2559, !DIExpression(), !2561)
    #dbg_value(i8 %full_rank.0, !2558, !DIExpression(), !2487)
  %exitcond17.not = icmp eq i32 %i33.0, %smax16, !dbg !2564
  br i1 %exitcond17.not, label %for.end45, label %for.inc43, !dbg !2566

for.inc43:                                        ; preds = %for.cond34
    #dbg_value(!DIArgList(i8 poison, i8 poison), !2558, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !2487)
  %sub37 = add nsw i32 %m, -1, !dbg !2567
  %mul38 = mul nsw i32 %sub37, %A_cols, !dbg !2569
  %7 = getelementptr i8, ptr %A, i32 %mul38, !dbg !2570
  %arrayidx40 = getelementptr i8, ptr %7, i32 %i33.0, !dbg !2570
  %8 = load i8, ptr %arrayidx40, align 1, !dbg !2570
    #dbg_value(!DIArgList(i8 %full_rank.0, i8 %8), !2558, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !2487)
  %or12 = or i8 %full_rank.0, %8, !dbg !2571
    #dbg_value(i8 %or12, !2558, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !2487)
    #dbg_value(i8 %or12, !2558, !DIExpression(), !2487)
  %inc44 = add nuw i32 %i33.0, 1, !dbg !2572
    #dbg_value(i32 %inc44, !2559, !DIExpression(), !2561)
  br label %for.cond34, !dbg !2573, !llvm.loop !2574

for.end45:                                        ; preds = %for.cond34
  %cmp47 = icmp eq i8 %full_rank.0, 0, !dbg !2576
  br i1 %cmp47, label %return, label %for.cond50, !dbg !2576

for.cond50:                                       ; preds = %for.cond63, %for.end45
  %row.0.in = phi i32 [ %m, %for.end45 ], [ %row.0, %for.cond63 ]
  %row.0 = add nsw i32 %row.0.in, -1, !dbg !2578
    #dbg_value(i32 %row.0, !2580, !DIExpression(), !2581)
  %cmp51 = icmp sgt i32 %row.0.in, 0, !dbg !2582
  br i1 %cmp51, label %for.body53, label %return, !dbg !2584

for.body53:                                       ; preds = %for.cond50
    #dbg_value(i8 0, !2585, !DIExpression(), !2487)
  %sub54 = sub nsw i32 %m, %row.0, !dbg !2586
  %div = sdiv i32 32, %sub54, !dbg !2586
  %add55 = add nsw i32 %row.0, %div, !dbg !2586
  %mul56 = mul nsw i32 %k, %o, !dbg !2586
  %cmp57 = icmp slt i32 %add55, %mul56, !dbg !2586
  br i1 %cmp57, label %cond.true, label %cond.false, !dbg !2586

cond.true:                                        ; preds = %for.body53
  %sub59 = sub nsw i32 %m, %row.0, !dbg !2586
  %div60 = sdiv i32 32, %sub59, !dbg !2586
  %add61 = add nsw i32 %row.0, %div60, !dbg !2586
  br label %cond.end, !dbg !2586

cond.false:                                       ; preds = %for.body53
  %mul62 = mul nsw i32 %k, %o, !dbg !2586
  br label %cond.end, !dbg !2586

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %add61, %cond.true ], [ %mul62, %cond.false ], !dbg !2586
    #dbg_value(i32 %cond, !2588, !DIExpression(), !2487)
    #dbg_value(i32 %row.0, !2589, !DIExpression(), !2591)
  br label %for.cond63, !dbg !2592

for.cond63:                                       ; preds = %for.inc229, %cond.end
  %finished.0 = phi i8 [ 0, %cond.end ], [ %or2273, %for.inc229 ], !dbg !2593
  %col.0 = phi i32 [ %row.0, %cond.end ], [ %inc230, %for.inc229 ], !dbg !2594
    #dbg_value(i32 %col.0, !2589, !DIExpression(), !2591)
    #dbg_value(i8 %finished.0, !2585, !DIExpression(), !2487)
  %cmp64.not = icmp sgt i32 %col.0, %cond, !dbg !2595
  br i1 %cmp64.not, label %for.cond50, label %for.body66, !dbg !2597, !llvm.loop !2598

for.body66:                                       ; preds = %for.cond63
  %mul67 = mul nsw i32 %row.0, %A_cols, !dbg !2600
  %9 = getelementptr i8, ptr %A, i32 %mul67, !dbg !2602
  %arrayidx69 = getelementptr i8, ptr %9, i32 %col.0, !dbg !2602
  %10 = load i8, ptr %arrayidx69, align 1, !dbg !2602
  %call70 = call fastcc zeroext i8 @ct_compare_8(i8 noundef zeroext %10, i8 noundef zeroext 0) #6, !dbg !2603
  %not = xor i8 %finished.0, -1, !dbg !2604
    #dbg_value(!DIArgList(i8 %call70, i8 %not), !2605, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_and, DW_OP_stack_value), !2487)
  %add76 = mul i32 %row.0.in, %A_cols, !dbg !2606
  %11 = getelementptr i8, ptr %A, i32 %add76, !dbg !2607
  %arrayidx78 = getelementptr i8, ptr %11, i32 -1, !dbg !2607
  %12 = load i8, ptr %arrayidx78, align 1, !dbg !2607
  %13 = and i8 %12, %not, !dbg !2608
  %and801 = and i8 %13, %call70, !dbg !2608
    #dbg_value(i8 %and801, !2609, !DIExpression(), !2610)
  %arrayidx83 = getelementptr inbounds i8, ptr %x, i32 %col.0, !dbg !2611
  %14 = load i8, ptr %arrayidx83, align 1, !dbg !2612
  %xor2 = xor i8 %14, %and801, !dbg !2612
  store i8 %xor2, ptr %arrayidx83, align 1, !dbg !2612
    #dbg_value(i32 0, !2613, !DIExpression(), !2615)
  br label %for.cond87, !dbg !2616

for.cond87:                                       ; preds = %for.body90, %for.body66
  %i86.0 = phi i32 [ 0, %for.body66 ], [ %add223, %for.body90 ], !dbg !2617
    #dbg_value(i32 %i86.0, !2613, !DIExpression(), !2615)
  %cmp88 = icmp slt i32 %i86.0, %row.0, !dbg !2618
  br i1 %cmp88, label %for.body90, label %for.inc229, !dbg !2620

for.body90:                                       ; preds = %for.cond87
  %mul91 = mul nsw i32 %i86.0, %A_cols, !dbg !2621
  %15 = getelementptr i8, ptr %A, i32 %mul91, !dbg !2623
  %arrayidx93 = getelementptr i8, ptr %15, i32 %col.0, !dbg !2623
  %16 = load i8, ptr %arrayidx93, align 1, !dbg !2623
  %conv94 = zext i8 %16 to i64, !dbg !2624
  %add95 = or disjoint i32 %i86.0, 1, !dbg !2625
  %mul96 = mul nsw i32 %add95, %A_cols, !dbg !2626
  %17 = getelementptr i8, ptr %A, i32 %mul96, !dbg !2627
  %arrayidx98 = getelementptr i8, ptr %17, i32 %col.0, !dbg !2627
  %18 = load i8, ptr %arrayidx98, align 1, !dbg !2627
  %conv99 = zext i8 %18 to i64, !dbg !2628
  %shl100 = shl nuw nsw i64 %conv99, 8, !dbg !2629
  %xor101 = or disjoint i64 %shl100, %conv94, !dbg !2630
  %add102 = or disjoint i32 %i86.0, 2, !dbg !2631
  %mul103 = mul nsw i32 %add102, %A_cols, !dbg !2632
  %19 = getelementptr i8, ptr %A, i32 %mul103, !dbg !2633
  %arrayidx105 = getelementptr i8, ptr %19, i32 %col.0, !dbg !2633
  %20 = load i8, ptr %arrayidx105, align 1, !dbg !2633
  %conv106 = zext i8 %20 to i64, !dbg !2634
  %shl107 = shl nuw nsw i64 %conv106, 16, !dbg !2635
  %xor108 = or disjoint i64 %xor101, %shl107, !dbg !2636
  %add109 = or disjoint i32 %i86.0, 3, !dbg !2637
  %mul110 = mul nsw i32 %add109, %A_cols, !dbg !2638
  %21 = getelementptr i8, ptr %A, i32 %mul110, !dbg !2639
  %arrayidx112 = getelementptr i8, ptr %21, i32 %col.0, !dbg !2639
  %22 = load i8, ptr %arrayidx112, align 1, !dbg !2639
  %conv113 = zext i8 %22 to i64, !dbg !2640
  %shl114 = shl nuw nsw i64 %conv113, 24, !dbg !2641
  %xor115 = or disjoint i64 %xor108, %shl114, !dbg !2642
  %add116 = or disjoint i32 %i86.0, 4, !dbg !2643
  %mul117 = mul nsw i32 %add116, %A_cols, !dbg !2644
  %23 = getelementptr i8, ptr %A, i32 %mul117, !dbg !2645
  %arrayidx119 = getelementptr i8, ptr %23, i32 %col.0, !dbg !2645
  %24 = load i8, ptr %arrayidx119, align 1, !dbg !2645
  %conv120 = zext i8 %24 to i64, !dbg !2646
  %shl121 = shl nuw nsw i64 %conv120, 32, !dbg !2647
  %xor122 = or disjoint i64 %xor115, %shl121, !dbg !2648
  %add123 = or disjoint i32 %i86.0, 5, !dbg !2649
  %mul124 = mul nsw i32 %add123, %A_cols, !dbg !2650
  %25 = getelementptr i8, ptr %A, i32 %mul124, !dbg !2651
  %arrayidx126 = getelementptr i8, ptr %25, i32 %col.0, !dbg !2651
  %26 = load i8, ptr %arrayidx126, align 1, !dbg !2651
  %conv127 = zext i8 %26 to i64, !dbg !2652
  %shl128 = shl nuw nsw i64 %conv127, 40, !dbg !2653
  %xor129 = xor i64 %xor122, %shl128, !dbg !2654
  %add130 = or disjoint i32 %i86.0, 6, !dbg !2655
  %mul131 = mul nsw i32 %add130, %A_cols, !dbg !2656
  %27 = getelementptr i8, ptr %A, i32 %mul131, !dbg !2657
  %arrayidx133 = getelementptr i8, ptr %27, i32 %col.0, !dbg !2657
  %28 = load i8, ptr %arrayidx133, align 1, !dbg !2657
  %conv134 = zext i8 %28 to i64, !dbg !2658
  %shl135 = shl nuw nsw i64 %conv134, 48, !dbg !2659
  %xor136 = xor i64 %xor129, %shl135, !dbg !2660
  %add137 = or disjoint i32 %i86.0, 7, !dbg !2661
  %mul138 = mul nsw i32 %add137, %A_cols, !dbg !2662
  %29 = getelementptr i8, ptr %A, i32 %mul138, !dbg !2663
  %arrayidx140 = getelementptr i8, ptr %29, i32 %col.0, !dbg !2663
  %30 = load i8, ptr %arrayidx140, align 1, !dbg !2663
  %conv141 = zext i8 %30 to i64, !dbg !2664
  %shl142 = shl nuw i64 %conv141, 56, !dbg !2665
  %xor143 = xor i64 %xor136, %shl142, !dbg !2666
    #dbg_value(i64 %xor143, !2667, !DIExpression(), !2668)
  %call144 = call fastcc i64 @mul_fx8(i8 noundef zeroext %and801, i64 noundef %xor143) #6, !dbg !2669
    #dbg_value(i64 %call144, !2667, !DIExpression(), !2668)
  %mul1464 = or disjoint i32 %i86.0, 1, !dbg !2670
  %add147 = mul i32 %mul1464, %A_cols, !dbg !2670
  %31 = getelementptr i8, ptr %A, i32 %add147, !dbg !2671
  %arrayidx149 = getelementptr i8, ptr %31, i32 -1, !dbg !2671
  %32 = load i8, ptr %arrayidx149, align 1, !dbg !2672
  %33 = trunc i64 %call144 to i8, !dbg !2672
  %34 = and i8 %33, 15, !dbg !2672
  %conv152 = xor i8 %34, %32, !dbg !2672
  store i8 %conv152, ptr %arrayidx149, align 1, !dbg !2672
  %shr = lshr i64 %call144, 8, !dbg !2673
  %mul1555 = or disjoint i32 %i86.0, 2, !dbg !2674
  %add156 = mul i32 %mul1555, %A_cols, !dbg !2674
  %35 = getelementptr i8, ptr %A, i32 %add156, !dbg !2675
  %arrayidx158 = getelementptr i8, ptr %35, i32 -1, !dbg !2675
  %36 = load i8, ptr %arrayidx158, align 1, !dbg !2676
  %37 = trunc i64 %shr to i8, !dbg !2676
  %38 = and i8 %37, 15, !dbg !2676
  %conv161 = xor i8 %38, %36, !dbg !2676
  store i8 %conv161, ptr %arrayidx158, align 1, !dbg !2676
  %shr162 = lshr i64 %call144, 16, !dbg !2677
  %mul1656 = or disjoint i32 %i86.0, 3, !dbg !2678
  %add166 = mul i32 %mul1656, %A_cols, !dbg !2678
  %39 = getelementptr i8, ptr %A, i32 %add166, !dbg !2679
  %arrayidx168 = getelementptr i8, ptr %39, i32 -1, !dbg !2679
  %40 = load i8, ptr %arrayidx168, align 1, !dbg !2680
  %41 = trunc i64 %shr162 to i8, !dbg !2680
  %42 = and i8 %41, 15, !dbg !2680
  %conv171 = xor i8 %42, %40, !dbg !2680
  store i8 %conv171, ptr %arrayidx168, align 1, !dbg !2680
  %shr172 = lshr i64 %call144, 24, !dbg !2681
  %mul1757 = or disjoint i32 %i86.0, 4, !dbg !2682
  %add176 = mul i32 %mul1757, %A_cols, !dbg !2682
  %43 = getelementptr i8, ptr %A, i32 %add176, !dbg !2683
  %arrayidx178 = getelementptr i8, ptr %43, i32 -1, !dbg !2683
  %44 = load i8, ptr %arrayidx178, align 1, !dbg !2684
  %45 = trunc i64 %shr172 to i8, !dbg !2684
  %46 = and i8 %45, 15, !dbg !2684
  %conv181 = xor i8 %46, %44, !dbg !2684
  store i8 %conv181, ptr %arrayidx178, align 1, !dbg !2684
  %shr182 = lshr i64 %call144, 32, !dbg !2685
  %mul1858 = or disjoint i32 %i86.0, 5, !dbg !2686
  %add186 = mul i32 %mul1858, %A_cols, !dbg !2686
  %47 = getelementptr i8, ptr %A, i32 %add186, !dbg !2687
  %arrayidx188 = getelementptr i8, ptr %47, i32 -1, !dbg !2687
  %48 = load i8, ptr %arrayidx188, align 1, !dbg !2688
  %49 = trunc i64 %shr182 to i8, !dbg !2688
  %50 = and i8 %49, 15, !dbg !2688
  %conv191 = xor i8 %50, %48, !dbg !2688
  store i8 %conv191, ptr %arrayidx188, align 1, !dbg !2688
  %shr192 = lshr i64 %call144, 40, !dbg !2689
  %mul1959 = or disjoint i32 %i86.0, 6, !dbg !2690
  %add196 = mul i32 %mul1959, %A_cols, !dbg !2690
  %51 = getelementptr i8, ptr %A, i32 %add196, !dbg !2691
  %arrayidx198 = getelementptr i8, ptr %51, i32 -1, !dbg !2691
  %52 = load i8, ptr %arrayidx198, align 1, !dbg !2692
  %53 = trunc i64 %shr192 to i8, !dbg !2692
  %54 = and i8 %53, 15, !dbg !2692
  %conv201 = xor i8 %54, %52, !dbg !2692
  store i8 %conv201, ptr %arrayidx198, align 1, !dbg !2692
  %shr202 = lshr i64 %call144, 48, !dbg !2693
  %mul20510 = or disjoint i32 %i86.0, 7, !dbg !2694
  %add206 = mul i32 %mul20510, %A_cols, !dbg !2694
  %55 = getelementptr i8, ptr %A, i32 %add206, !dbg !2695
  %arrayidx208 = getelementptr i8, ptr %55, i32 -1, !dbg !2695
  %56 = load i8, ptr %arrayidx208, align 1, !dbg !2696
  %57 = trunc i64 %shr202 to i8, !dbg !2696
  %58 = and i8 %57, 15, !dbg !2696
  %conv211 = xor i8 %58, %56, !dbg !2696
  store i8 %conv211, ptr %arrayidx208, align 1, !dbg !2696
  %shr212 = lshr i64 %call144, 56, !dbg !2697
  %mul21511 = add nuw i32 %i86.0, 8, !dbg !2698
  %add216 = mul i32 %mul21511, %A_cols, !dbg !2698
  %59 = getelementptr i8, ptr %A, i32 %add216, !dbg !2699
  %arrayidx218 = getelementptr i8, ptr %59, i32 -1, !dbg !2699
  %60 = load i8, ptr %arrayidx218, align 1, !dbg !2700
  %61 = trunc nuw nsw i64 %shr212 to i8, !dbg !2700
  %conv221 = xor i8 %60, %61, !dbg !2700
  store i8 %conv221, ptr %arrayidx218, align 1, !dbg !2700
  %add223 = add nuw nsw i32 %i86.0, 8, !dbg !2701
    #dbg_value(i32 %add223, !2613, !DIExpression(), !2615)
  br label %for.cond87, !dbg !2702, !llvm.loop !2703

for.inc229:                                       ; preds = %for.cond87
    #dbg_value(!DIArgList(i8 %finished.0, i8 %call70), !2585, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !2487)
  %or2273 = or i8 %finished.0, %call70, !dbg !2705
    #dbg_value(i8 %or2273, !2585, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !2487)
    #dbg_value(i8 %or2273, !2585, !DIExpression(), !2487)
  %inc230 = add nsw i32 %col.0, 1, !dbg !2706
    #dbg_value(i32 %inc230, !2589, !DIExpression(), !2591)
  br label %for.cond63, !dbg !2707, !llvm.loop !2708

return:                                           ; preds = %for.cond50, %for.end45
  %retval.0 = phi i32 [ 0, %for.end45 ], [ 1, %for.cond50 ], !dbg !2487
  ret i32 %retval.0, !dbg !2710
}

; Function Attrs: nounwind
define internal fastcc void @mat_mul.21(ptr noundef %a, ptr noundef %b, ptr noundef %c, i32 noundef %colrow_ab, i32 noundef %row_a, i32 noundef %col_b) unnamed_addr #0 !dbg !2711 {
entry:
    #dbg_value(ptr %a, !2712, !DIExpression(), !2713)
    #dbg_value(ptr %b, !2714, !DIExpression(), !2713)
    #dbg_value(ptr %c, !2715, !DIExpression(), !2713)
    #dbg_value(i32 %colrow_ab, !2716, !DIExpression(), !2713)
    #dbg_value(i32 %row_a, !2717, !DIExpression(), !2713)
    #dbg_value(i32 %col_b, !2718, !DIExpression(), !2713)
    #dbg_value(i32 0, !2719, !DIExpression(), !2721)
  %smax = call i32 @llvm.smax.i32(i32 %col_b, i32 0), !dbg !2722
  %smax1 = call i32 @llvm.smax.i32(i32 %row_a, i32 0), !dbg !2722
  br label %for.cond, !dbg !2722

for.cond:                                         ; preds = %for.inc4, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc5, %for.inc4 ], !dbg !2723
  %c.addr.0 = phi ptr [ %c, %entry ], [ %c.addr.1, %for.inc4 ]
  %a.addr.0 = phi ptr [ %a, %entry ], [ %add.ptr6, %for.inc4 ]
    #dbg_value(ptr %a.addr.0, !2712, !DIExpression(), !2713)
    #dbg_value(ptr %c.addr.0, !2715, !DIExpression(), !2713)
    #dbg_value(i32 %i.0, !2719, !DIExpression(), !2721)
  %exitcond2.not = icmp eq i32 %i.0, %smax1, !dbg !2724
  br i1 %exitcond2.not, label %for.end7, label %for.cond1, !dbg !2726

for.cond1:                                        ; preds = %for.cond, %for.body3
  %c.addr.1 = phi ptr [ %incdec.ptr, %for.body3 ], [ %c.addr.0, %for.cond ]
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond ], !dbg !2727
    #dbg_value(i32 %j.0, !2730, !DIExpression(), !2731)
    #dbg_value(ptr %c.addr.1, !2715, !DIExpression(), !2713)
  %exitcond.not = icmp eq i32 %j.0, %smax, !dbg !2732
  br i1 %exitcond.not, label %for.inc4, label %for.body3, !dbg !2734

for.body3:                                        ; preds = %for.cond1
  %add.ptr = getelementptr inbounds nuw i8, ptr %b, i32 %j.0, !dbg !2735
  %call = call fastcc zeroext i8 @lincomb.24(ptr noundef %a.addr.0, ptr noundef %add.ptr, i32 noundef %colrow_ab, i32 noundef %col_b) #6, !dbg !2737
  store i8 %call, ptr %c.addr.1, align 1, !dbg !2738
  %inc = add nuw i32 %j.0, 1, !dbg !2739
    #dbg_value(i32 %inc, !2730, !DIExpression(), !2731)
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %c.addr.1, i32 1, !dbg !2740
    #dbg_value(ptr %incdec.ptr, !2715, !DIExpression(), !2713)
  br label %for.cond1, !dbg !2741, !llvm.loop !2742

for.inc4:                                         ; preds = %for.cond1
  %inc5 = add nuw i32 %i.0, 1, !dbg !2744
    #dbg_value(i32 %inc5, !2719, !DIExpression(), !2721)
  %add.ptr6 = getelementptr inbounds i8, ptr %a.addr.0, i32 %colrow_ab, !dbg !2745
    #dbg_value(ptr %add.ptr6, !2712, !DIExpression(), !2713)
  br label %for.cond, !dbg !2746, !llvm.loop !2747

for.end7:                                         ; preds = %for.cond
  %cmp8 = icmp eq i32 %row_a, %col_b, !dbg !2749
  %call9 = call zeroext i1 @assert(i1 noundef zeroext %cmp8) #8, !dbg !2750
  ret void, !dbg !2751
}

; Function Attrs: nounwind
define internal fastcc zeroext i8 @sub_f(i8 noundef zeroext %a, i8 noundef zeroext %b) unnamed_addr #0 !dbg !2752 {
entry:
    #dbg_value(i8 %a, !2753, !DIExpression(), !2754)
    #dbg_value(i8 %b, !2755, !DIExpression(), !2754)
  %xor1 = xor i8 %a, %b, !dbg !2756
  ret i8 %xor1, !dbg !2757
}

; Function Attrs: nounwind
define internal fastcc void @EF(ptr noundef %A, i32 noundef %nrows, i32 noundef %ncols) unnamed_addr #0 !dbg !2758 {
entry:
  %_pivot_row = alloca [5 x i64], align 32
  %_pivot_row2 = alloca [5 x i64], align 32
  %packed_A = alloca [320 x i64], align 32
  %temp = alloca [84 x i8], align 1
    #dbg_value(ptr %A, !2762, !DIExpression(), !2763)
    #dbg_value(i32 %nrows, !2764, !DIExpression(), !2763)
    #dbg_value(i32 %ncols, !2765, !DIExpression(), !2763)
    #dbg_declare(ptr %_pivot_row, !2766, !DIExpression(), !2770)
    #dbg_declare(ptr %_pivot_row2, !2771, !DIExpression(), !2772)
    #dbg_declare(ptr %packed_A, !2773, !DIExpression(), !2777)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 32 dereferenceable(2560) %packed_A, i8 0, i32 2560, i1 false), !dbg !2777
  %add = add nsw i32 %ncols, 15, !dbg !2778
  %div = sdiv i32 %add, 16, !dbg !2779
    #dbg_value(i32 %div, !2780, !DIExpression(), !2763)
    #dbg_value(i32 0, !2781, !DIExpression(), !2783)
  %smax = call i32 @llvm.smax.i32(i32 %nrows, i32 0), !dbg !2784
  br label %for.cond, !dbg !2784

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2785
    #dbg_value(i32 %i.0, !2781, !DIExpression(), !2783)
  %exitcond.not = icmp eq i32 %i.0, %smax, !dbg !2786
  br i1 %exitcond.not, label %for.cond3.preheader, label %for.body, !dbg !2788

for.cond3.preheader:                              ; preds = %for.cond
  %smax1 = call i32 @llvm.smax.i32(i32 %div, i32 0), !dbg !2789
  %smax5 = call i32 @llvm.smax.i32(i32 %ncols, i32 0), !dbg !2789
  br label %for.cond3, !dbg !2789

for.body:                                         ; preds = %for.cond
  %mul = mul nsw i32 %i.0, %ncols, !dbg !2791
  %add.ptr = getelementptr inbounds i8, ptr %A, i32 %mul, !dbg !2793
  %mul1 = mul nsw i32 %i.0, %div, !dbg !2794
  %add.ptr2 = getelementptr inbounds i64, ptr %packed_A, i32 %mul1, !dbg !2795
  call fastcc void @ef_pack_m_vec(ptr noundef %add.ptr, ptr noundef nonnull %add.ptr2, i32 noundef %ncols) #6, !dbg !2796
  %inc = add nuw i32 %i.0, 1, !dbg !2797
    #dbg_value(i32 %inc, !2781, !DIExpression(), !2783)
  br label %for.cond, !dbg !2798, !llvm.loop !2799

for.cond3:                                        ; preds = %for.cond3.preheader, %for.inc117
  %pivot_col.0 = phi i32 [ %inc118, %for.inc117 ], [ 0, %for.cond3.preheader ], !dbg !2801
  %pivot_row.0 = phi i32 [ %conv116, %for.inc117 ], [ 0, %for.cond3.preheader ], !dbg !2763
    #dbg_value(i32 %pivot_row.0, !2802, !DIExpression(), !2763)
    #dbg_value(i32 %pivot_col.0, !2803, !DIExpression(), !2804)
  %exitcond6.not = icmp eq i32 %pivot_col.0, %smax5, !dbg !2805
  br i1 %exitcond6.not, label %for.cond121, label %for.body5, !dbg !2789

for.body5:                                        ; preds = %for.cond3
  %add6 = add nsw i32 %pivot_col.0, %nrows, !dbg !2807
  %cmp7 = icmp slt i32 %add6, %ncols, !dbg !2807
  %add8 = add nsw i32 %pivot_col.0, %nrows, !dbg !2807
  %sub9 = sub nsw i32 %add8, %ncols, !dbg !2807
  %cond = select i1 %cmp7, i32 0, i32 %sub9, !dbg !2807
    #dbg_value(i32 %cond, !2809, !DIExpression(), !2810)
  %sub13 = add nsw i32 %nrows, -1, !dbg !2811
    #dbg_value(i32 %cond16, !2812, !DIExpression(), !2810)
    #dbg_value(i32 0, !2813, !DIExpression(), !2815)
  br label %for.cond18, !dbg !2816

for.cond18:                                       ; preds = %for.body20, %for.body5
  %i17.0 = phi i32 [ 0, %for.body5 ], [ %inc23, %for.body20 ], !dbg !2817
    #dbg_value(i32 %i17.0, !2813, !DIExpression(), !2815)
  %exitcond2.not = icmp eq i32 %i17.0, %smax1, !dbg !2818
  br i1 %exitcond2.not, label %for.cond25.preheader, label %for.body20, !dbg !2820

for.cond25.preheader:                             ; preds = %for.cond18
  %cmp11.not = icmp sgt i32 %nrows, %pivot_col.0, !dbg !2811
  %cond16 = select i1 %cmp11.not, i32 %pivot_col.0, i32 %sub13, !dbg !2811
  br label %for.cond25, !dbg !2821

for.body20:                                       ; preds = %for.cond18
  %arrayidx = getelementptr inbounds nuw [5 x i64], ptr %_pivot_row, i32 0, i32 %i17.0, !dbg !2823
  store i64 0, ptr %arrayidx, align 8, !dbg !2825
  %arrayidx21 = getelementptr inbounds nuw [5 x i64], ptr %_pivot_row2, i32 0, i32 %i17.0, !dbg !2826
  store i64 0, ptr %arrayidx21, align 8, !dbg !2827
  %inc23 = add nuw nsw i32 %i17.0, 1, !dbg !2828
    #dbg_value(i32 %inc23, !2813, !DIExpression(), !2815)
  br label %for.cond18, !dbg !2829, !llvm.loop !2830

for.cond25:                                       ; preds = %for.cond25.preheader, %for.end48
  %pivot_is_zero.0 = phi i64 [ %not52, %for.end48 ], [ -1, %for.cond25.preheader ], !dbg !2810
  %pivot.0 = phi i8 [ %call50, %for.end48 ], [ 0, %for.cond25.preheader ], !dbg !2810
  %row.0 = phi i32 [ %inc54, %for.end48 ], [ %cond, %for.cond25.preheader ], !dbg !2832
    #dbg_value(i32 %row.0, !2833, !DIExpression(), !2832)
    #dbg_value(i8 %pivot.0, !2834, !DIExpression(), !2810)
    #dbg_value(i64 %pivot_is_zero.0, !2835, !DIExpression(), !2810)
  %add27 = add nsw i32 %cond16, 32, !dbg !2836
  %cmp28.not = icmp sgt i32 %nrows, %add27, !dbg !2836
  %sub30 = add nsw i32 %nrows, -1, !dbg !2836
  %add32 = add nsw i32 %cond16, 32, !dbg !2836
  %cond34 = select i1 %cmp28.not, i32 %add32, i32 %sub30, !dbg !2836
  %cmp35.not = icmp sgt i32 %row.0, %cond34, !dbg !2838
  br i1 %cmp35.not, label %for.end55, label %for.body36, !dbg !2821

for.body36:                                       ; preds = %for.cond25
  %call = call fastcc i64 @ct_compare_64(i32 noundef %row.0, i32 noundef %pivot_row.0) #6, !dbg !2839
  %not = xor i64 %call, -1, !dbg !2841
    #dbg_value(i64 %not, !2842, !DIExpression(), !2843)
  %call37 = call fastcc i64 @ct_64_is_greater_than(i32 noundef %row.0, i32 noundef %pivot_row.0) #6, !dbg !2844
    #dbg_value(i64 %call37, !2845, !DIExpression(), !2843)
    #dbg_value(i32 0, !2846, !DIExpression(), !2848)
  br label %for.cond38, !dbg !2849

for.cond38:                                       ; preds = %for.body40, %for.body36
  %j.0 = phi i32 [ 0, %for.body36 ], [ %inc47, %for.body40 ], !dbg !2850
    #dbg_value(i32 %j.0, !2846, !DIExpression(), !2848)
  %exitcond3.not = icmp eq i32 %j.0, %smax1, !dbg !2851
  br i1 %exitcond3.not, label %for.end48, label %for.body40, !dbg !2853

for.body40:                                       ; preds = %for.cond38
  %and = and i64 %call37, %pivot_is_zero.0, !dbg !2854
  %or = or i64 %and, %not, !dbg !2856
  %mul41 = mul nsw i32 %row.0, %div, !dbg !2857
  %add42 = add nsw i32 %mul41, %j.0, !dbg !2858
  %arrayidx43 = getelementptr inbounds [320 x i64], ptr %packed_A, i32 0, i32 %add42, !dbg !2859
  %0 = load i64, ptr %arrayidx43, align 8, !dbg !2859
  %and44 = and i64 %or, %0, !dbg !2860
  %arrayidx45 = getelementptr inbounds nuw [5 x i64], ptr %_pivot_row, i32 0, i32 %j.0, !dbg !2861
  %1 = load i64, ptr %arrayidx45, align 8, !dbg !2862
  %xor = xor i64 %1, %and44, !dbg !2862
  store i64 %xor, ptr %arrayidx45, align 8, !dbg !2862
  %inc47 = add nuw nsw i32 %j.0, 1, !dbg !2863
    #dbg_value(i32 %inc47, !2846, !DIExpression(), !2848)
  br label %for.cond38, !dbg !2864, !llvm.loop !2865

for.end48:                                        ; preds = %for.cond38
  %call50 = call fastcc zeroext i8 @m_extract_element(ptr noundef nonnull %_pivot_row, i32 noundef %pivot_col.0) #6, !dbg !2867
    #dbg_value(i8 %call50, !2834, !DIExpression(), !2810)
  %conv = zext nneg i8 %call50 to i32, !dbg !2868
  %call51 = call fastcc i64 @ct_compare_64(i32 noundef %conv, i32 noundef 0) #6, !dbg !2869
    #dbg_value(i64 %call51, !2835, !DIExpression(DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_stack_value), !2810)
  %not52 = xor i64 %call51, -1, !dbg !2870
    #dbg_value(i64 %not52, !2835, !DIExpression(), !2810)
  %inc54 = add nsw i32 %row.0, 1, !dbg !2871
    #dbg_value(i32 %inc54, !2833, !DIExpression(), !2832)
  br label %for.cond25, !dbg !2872, !llvm.loop !2873

for.end55:                                        ; preds = %for.cond25
  %call56 = call fastcc zeroext i8 @inverse_f(i8 noundef zeroext %pivot.0) #6, !dbg !2875
    #dbg_value(i8 %call56, !2876, !DIExpression(), !2763)
  call fastcc void @vec_mul_add_u64(i32 noundef %div, ptr noundef nonnull %_pivot_row, i8 noundef zeroext %call56, ptr noundef nonnull %_pivot_row2) #6, !dbg !2877
    #dbg_value(i32 %cond, !2878, !DIExpression(), !2880)
  br label %for.cond60, !dbg !2881

for.cond60:                                       ; preds = %for.inc86, %for.end55
  %row59.0 = phi i32 [ %cond, %for.end55 ], [ %inc87, %for.inc86 ], !dbg !2882
    #dbg_value(i32 %row59.0, !2878, !DIExpression(), !2880)
  %cmp61.not = icmp sgt i32 %row59.0, %cond16, !dbg !2883
  br i1 %cmp61.not, label %for.cond90, label %for.body63, !dbg !2885

for.body63:                                       ; preds = %for.cond60
  %call64 = call fastcc i64 @ct_compare_64(i32 noundef %row59.0, i32 noundef %pivot_row.0) #6, !dbg !2886
  %and67.demorgan = or i64 %call64, %pivot_is_zero.0, !dbg !2888
  %and67 = xor i64 %and67.demorgan, -1, !dbg !2888
    #dbg_value(i64 %and67, !2889, !DIExpression(), !2890)
    #dbg_value(i64 %and67.demorgan, !2891, !DIExpression(), !2890)
    #dbg_value(i32 0, !2892, !DIExpression(), !2894)
  br label %for.cond69, !dbg !2895

for.cond69:                                       ; preds = %for.body72, %for.body63
  %col.0 = phi i32 [ 0, %for.body63 ], [ %inc84, %for.body72 ], !dbg !2896
    #dbg_value(i32 %col.0, !2892, !DIExpression(), !2894)
  %exitcond4.not = icmp eq i32 %col.0, %smax1, !dbg !2897
  br i1 %exitcond4.not, label %for.inc86, label %for.body72, !dbg !2899

for.body72:                                       ; preds = %for.cond69
  %mul73 = mul nsw i32 %row59.0, %div, !dbg !2900
  %add74 = add nsw i32 %mul73, %col.0, !dbg !2902
  %arrayidx75 = getelementptr inbounds [320 x i64], ptr %packed_A, i32 0, i32 %add74, !dbg !2903
  %2 = load i64, ptr %arrayidx75, align 8, !dbg !2903
  %and76 = and i64 %and67.demorgan, %2, !dbg !2904
  %arrayidx77 = getelementptr inbounds nuw [5 x i64], ptr %_pivot_row2, i32 0, i32 %col.0, !dbg !2905
  %3 = load i64, ptr %arrayidx77, align 8, !dbg !2905
  %and78 = and i64 %3, %and67, !dbg !2906
  %add79 = add i64 %and76, %and78, !dbg !2907
  %mul80 = mul nsw i32 %row59.0, %div, !dbg !2908
  %add81 = add nsw i32 %mul80, %col.0, !dbg !2909
  %arrayidx82 = getelementptr inbounds [320 x i64], ptr %packed_A, i32 0, i32 %add81, !dbg !2910
  store i64 %add79, ptr %arrayidx82, align 8, !dbg !2911
  %inc84 = add nuw nsw i32 %col.0, 1, !dbg !2912
    #dbg_value(i32 %inc84, !2892, !DIExpression(), !2894)
  br label %for.cond69, !dbg !2913, !llvm.loop !2914

for.inc86:                                        ; preds = %for.cond69
  %inc87 = add nsw i32 %row59.0, 1, !dbg !2916
    #dbg_value(i32 %inc87, !2878, !DIExpression(), !2880)
  br label %for.cond60, !dbg !2917, !llvm.loop !2918

for.cond90:                                       ; preds = %for.cond60, %for.body93
  %row89.0 = phi i32 [ %inc110, %for.body93 ], [ %cond, %for.cond60 ], !dbg !2920
    #dbg_value(i32 %row89.0, !2922, !DIExpression(), !2923)
  %cmp91 = icmp slt i32 %row89.0, %nrows, !dbg !2924
  br i1 %cmp91, label %for.body93, label %for.inc117, !dbg !2926

for.body93:                                       ; preds = %for.cond90
  %cmp94 = icmp sgt i32 %row89.0, %pivot_row.0, !dbg !2927
    #dbg_value(i1 %cmp94, !2929, !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !2930)
  %mul98 = mul nsw i32 %row89.0, %div, !dbg !2931
  %add.ptr99 = getelementptr inbounds i64, ptr %packed_A, i32 %mul98, !dbg !2932
  %call100 = call fastcc zeroext i8 @m_extract_element(ptr noundef nonnull %add.ptr99, i32 noundef %pivot_col.0) #6, !dbg !2933
    #dbg_value(i8 %call100, !2934, !DIExpression(), !2930)
  %conv105 = select i1 %cmp94, i8 %call100, i8 0, !dbg !2935
  %mul107 = mul nsw i32 %row89.0, %div, !dbg !2936
  %add.ptr108 = getelementptr inbounds i64, ptr %packed_A, i32 %mul107, !dbg !2937
  call fastcc void @vec_mul_add_u64(i32 noundef %div, ptr noundef nonnull %_pivot_row2, i8 noundef zeroext %conv105, ptr noundef nonnull %add.ptr108) #6, !dbg !2938
  %inc110 = add nsw i32 %row89.0, 1, !dbg !2939
    #dbg_value(i32 %inc110, !2922, !DIExpression(), !2923)
  br label %for.cond90, !dbg !2940, !llvm.loop !2941

for.inc117:                                       ; preds = %for.cond90
    #dbg_value(!DIArgList(i64 %pivot_is_zero.0, i32 %pivot_row.0), !2802, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_plus_uconst, 1, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_plus, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !2763)
  %4 = trunc i64 %pivot_is_zero.0 to i32, !dbg !2943
  %5 = add i32 %4, 1, !dbg !2943
  %conv116 = add i32 %5, %pivot_row.0, !dbg !2943
    #dbg_value(i32 %conv116, !2802, !DIExpression(), !2763)
  %inc118 = add nuw i32 %pivot_col.0, 1, !dbg !2944
    #dbg_value(i32 %inc118, !2803, !DIExpression(), !2804)
  br label %for.cond3, !dbg !2945, !llvm.loop !2946

for.cond121:                                      ; preds = %for.cond3, %for.inc141
  %i120.0 = phi i32 [ %inc142, %for.inc141 ], [ 0, %for.cond3 ], !dbg !2948
    #dbg_value(i32 %i120.0, !2950, !DIExpression(), !2951)
  %exitcond8.not = icmp eq i32 %i120.0, %smax, !dbg !2952
  br i1 %exitcond8.not, label %for.end143, label %for.body124, !dbg !2954

for.body124:                                      ; preds = %for.cond121
  %mul126 = mul nsw i32 %i120.0, %div, !dbg !2955
  %add.ptr127 = getelementptr inbounds i64, ptr %packed_A, i32 %mul126, !dbg !2957
  call fastcc void @ef_unpack_m_vec(i32 noundef %div, ptr noundef nonnull %add.ptr127, ptr noundef nonnull %temp) #6, !dbg !2958
    #dbg_value(i32 0, !2959, !DIExpression(), !2961)
  br label %for.cond130, !dbg !2962

for.cond130:                                      ; preds = %for.body133, %for.body124
  %j129.0 = phi i32 [ 0, %for.body124 ], [ %inc139, %for.body133 ], !dbg !2963
    #dbg_value(i32 %j129.0, !2959, !DIExpression(), !2961)
  %exitcond7.not = icmp eq i32 %j129.0, %smax5, !dbg !2964
  br i1 %exitcond7.not, label %for.inc141, label %for.body133, !dbg !2966

for.body133:                                      ; preds = %for.cond130
  %arrayidx134 = getelementptr inbounds nuw [84 x i8], ptr %temp, i32 0, i32 %j129.0, !dbg !2967
  %6 = load i8, ptr %arrayidx134, align 1, !dbg !2967
  %mul135 = mul nsw i32 %i120.0, %ncols, !dbg !2969
  %7 = getelementptr i8, ptr %A, i32 %mul135, !dbg !2970
  %arrayidx137 = getelementptr i8, ptr %7, i32 %j129.0, !dbg !2970
  store i8 %6, ptr %arrayidx137, align 1, !dbg !2971
  %inc139 = add nuw i32 %j129.0, 1, !dbg !2972
    #dbg_value(i32 %inc139, !2959, !DIExpression(), !2961)
  br label %for.cond130, !dbg !2973, !llvm.loop !2974

for.inc141:                                       ; preds = %for.cond130
  %inc142 = add nuw i32 %i120.0, 1, !dbg !2976
    #dbg_value(i32 %inc142, !2950, !DIExpression(), !2951)
  br label %for.cond121, !dbg !2977, !llvm.loop !2978

for.end143:                                       ; preds = %for.cond121
  call void @mayo_secure_clear(ptr noundef nonnull %temp, i32 noundef 84) #8, !dbg !2980
  call void @mayo_secure_clear(ptr noundef nonnull %_pivot_row, i32 noundef 40) #8, !dbg !2981
  call void @mayo_secure_clear(ptr noundef nonnull %_pivot_row2, i32 noundef 40) #8, !dbg !2982
  call void @mayo_secure_clear(ptr noundef nonnull %packed_A, i32 noundef 2560) #8, !dbg !2983
  ret void, !dbg !2984
}

; Function Attrs: nounwind
define internal fastcc zeroext i8 @ct_compare_8(i8 noundef zeroext %a, i8 noundef zeroext %b) unnamed_addr #0 !dbg !2985 {
entry:
    #dbg_value(i8 %a, !2987, !DIExpression(), !2988)
    #dbg_value(i8 %b, !2989, !DIExpression(), !2988)
  %0 = icmp ne i8 %a, %b, !dbg !2990
  %conv3 = sext i1 %0 to i8, !dbg !2991
  %1 = load volatile i8, ptr @pqmayo_MAYO_2_ref_unsigned_char_blocker, align 1, !dbg !2992
  %xor5 = xor i8 %1, %conv3, !dbg !2993
  ret i8 %xor5, !dbg !2994
}

; Function Attrs: nounwind
define internal fastcc range(i64 0, 1085102592571150096) i64 @mul_fx8(i8 noundef zeroext %a, i64 noundef %b) unnamed_addr #0 !dbg !2995 {
entry:
    #dbg_value(i8 %a, !2998, !DIExpression(), !2999)
    #dbg_value(i64 %b, !3000, !DIExpression(), !2999)
  %0 = and i8 %a, 1, !dbg !3001
  %conv1 = zext nneg i8 %0 to i64, !dbg !3002
  %mul = mul nuw nsw i64 %b, %conv1, !dbg !3003
    #dbg_value(i64 %mul, !3004, !DIExpression(), !2999)
  %1 = and i8 %a, 2, !dbg !3005
  %conv4 = zext nneg i8 %1 to i64, !dbg !3006
  %mul5 = mul i64 %b, %conv4, !dbg !3007
  %xor = xor i64 %mul, %mul5, !dbg !3008
    #dbg_value(i64 %xor, !3004, !DIExpression(), !2999)
  %2 = and i8 %a, 4, !dbg !3009
  %conv8 = zext nneg i8 %2 to i64, !dbg !3010
  %mul9 = mul i64 %b, %conv8, !dbg !3011
  %xor10 = xor i64 %xor, %mul9, !dbg !3012
    #dbg_value(i64 %xor10, !3004, !DIExpression(), !2999)
  %3 = and i8 %a, 8, !dbg !3013
  %conv13 = zext nneg i8 %3 to i64, !dbg !3014
  %mul14 = mul i64 %b, %conv13, !dbg !3015
  %xor15 = xor i64 %xor10, %mul14, !dbg !3016
    #dbg_value(i64 %xor15, !3004, !DIExpression(), !2999)
    #dbg_value(i64 %xor15, !3017, !DIExpression(DW_OP_constu, 17361641481138401520, DW_OP_and, DW_OP_stack_value), !2999)
  %shr = lshr i64 %xor15, 4, !dbg !3018
  %and16 = lshr i64 %xor15, 3, !dbg !3019
  %shr18 = and i64 %and16, 1012762419733073422, !dbg !3019
  %4 = xor i64 %shr, %shr18, !dbg !3020
  %xor19 = xor i64 %4, %xor15, !dbg !3020
  %and20 = and i64 %xor19, 1085102592571150095, !dbg !3021
    #dbg_value(i64 %and20, !3022, !DIExpression(), !2999)
  ret i64 %and20, !dbg !3023
}

; Function Attrs: nounwind
define internal fastcc void @ef_pack_m_vec(ptr noundef %in, ptr noundef %out, i32 noundef %ncols) unnamed_addr #0 !dbg !3024 {
entry:
    #dbg_value(ptr %in, !3027, !DIExpression(), !3028)
    #dbg_value(ptr %out, !3029, !DIExpression(), !3028)
    #dbg_value(i32 %ncols, !3030, !DIExpression(), !3028)
    #dbg_value(ptr %out, !3031, !DIExpression(), !3028)
    #dbg_value(i32 0, !3032, !DIExpression(), !3028)
  br label %for.cond, !dbg !3033

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add8, %for.body ], !dbg !3035
    #dbg_value(i32 %i.0, !3032, !DIExpression(), !3028)
  %add = or disjoint i32 %i.0, 1, !dbg !3036
  %cmp = icmp slt i32 %add, %ncols, !dbg !3038
  br i1 %cmp, label %for.body, label %for.end, !dbg !3039

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %in, i32 %i.0, !dbg !3040
  %0 = load i8, ptr %arrayidx, align 1, !dbg !3040
  %add2 = or disjoint i32 %i.0, 1, !dbg !3042
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %in, i32 %add2, !dbg !3043
  %1 = load i8, ptr %arrayidx3, align 1, !dbg !3043
  %shl5 = shl i8 %1, 4, !dbg !3044
  %or = or i8 %shl5, %0, !dbg !3045
  %div = lshr exact i32 %i.0, 1, !dbg !3046
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %out, i32 %div, !dbg !3047
  store i8 %or, ptr %arrayidx7, align 1, !dbg !3048
  %add8 = add nuw nsw i32 %i.0, 2, !dbg !3049
    #dbg_value(i32 %add8, !3032, !DIExpression(), !3028)
  br label %for.cond, !dbg !3050, !llvm.loop !3051

for.end:                                          ; preds = %for.cond
  %2 = and i32 %ncols, -2147483647, !dbg !3053
  %cmp9 = icmp eq i32 %2, 1, !dbg !3053
  br i1 %cmp9, label %if.then, label %if.end, !dbg !3053

if.then:                                          ; preds = %for.end
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %in, i32 %i.0, !dbg !3055
  %3 = load i8, ptr %arrayidx12, align 1, !dbg !3055
  %div16 = lshr exact i32 %i.0, 1, !dbg !3057
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %out, i32 %div16, !dbg !3058
  store i8 %3, ptr %arrayidx17, align 1, !dbg !3059
  br label %if.end, !dbg !3060

if.end:                                           ; preds = %if.then, %for.end
  ret void, !dbg !3061
}

; Function Attrs: nounwind
define internal fastcc i64 @ct_compare_64(i32 noundef %a, i32 noundef %b) unnamed_addr #0 !dbg !3062 {
entry:
    #dbg_value(i32 %a, !3065, !DIExpression(), !3066)
    #dbg_value(i32 %b, !3067, !DIExpression(), !3066)
  %xor = xor i32 %a, %b, !dbg !3068
  %0 = icmp sgt i32 %xor, 0, !dbg !3069
  %shr = sext i1 %0 to i64, !dbg !3069
  %1 = load volatile i64, ptr @pqmayo_MAYO_2_ref_uint64_t_blocker, align 8, !dbg !3070
  %xor1 = xor i64 %1, %shr, !dbg !3071
  ret i64 %xor1, !dbg !3072
}

; Function Attrs: nounwind
define internal fastcc i64 @ct_64_is_greater_than(i32 noundef %a, i32 noundef %b) unnamed_addr #0 !dbg !3073 {
entry:
    #dbg_value(i32 %a, !3074, !DIExpression(), !3075)
    #dbg_value(i32 %b, !3076, !DIExpression(), !3075)
    #dbg_value(!DIArgList(i32 %b, i32 %a), !3077, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_LLVM_convert, 64, DW_ATE_signed, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_LLVM_convert, 64, DW_ATE_signed, DW_OP_minus, DW_OP_stack_value), !3075)
  %0 = icmp slt i32 %b, %a, !dbg !3078
  %shr = sext i1 %0 to i64, !dbg !3078
  %1 = load volatile i64, ptr @pqmayo_MAYO_2_ref_uint64_t_blocker, align 8, !dbg !3079
  %xor = xor i64 %1, %shr, !dbg !3080
  ret i64 %xor, !dbg !3081
}

; Function Attrs: nounwind
define internal fastcc zeroext range(i8 0, 16) i8 @m_extract_element(ptr noundef %in, i32 noundef %index) unnamed_addr #0 !dbg !3082 {
entry:
    #dbg_value(ptr %in, !3085, !DIExpression(), !3086)
    #dbg_value(i32 %index, !3087, !DIExpression(), !3086)
  %div = sdiv i32 %index, 16, !dbg !3088
    #dbg_value(i32 %div, !3089, !DIExpression(), !3086)
  %rem = srem i32 %index, 16, !dbg !3090
    #dbg_value(i32 %rem, !3091, !DIExpression(), !3086)
  %arrayidx = getelementptr inbounds i64, ptr %in, i32 %div, !dbg !3092
  %0 = load i64, ptr %arrayidx, align 8, !dbg !3092
  %mul = shl nsw i32 %rem, 2, !dbg !3093
  %sh_prom = zext nneg i32 %mul to i64, !dbg !3094
  %shr = lshr i64 %0, %sh_prom, !dbg !3094
  %1 = trunc i64 %shr to i8, !dbg !3095
  %conv = and i8 %1, 15, !dbg !3095
  ret i8 %conv, !dbg !3096
}

; Function Attrs: nounwind
define internal fastcc zeroext range(i8 0, 16) i8 @inverse_f(i8 noundef zeroext %a) unnamed_addr #0 !dbg !3097 {
entry:
    #dbg_value(i8 %a, !3100, !DIExpression(), !3101)
  %call = call fastcc zeroext i8 @mul_f.23(i8 noundef zeroext %a, i8 noundef zeroext %a) #6, !dbg !3102
    #dbg_value(i8 %call, !3103, !DIExpression(), !3101)
  %call1 = call fastcc zeroext i8 @mul_f.23(i8 noundef zeroext %call, i8 noundef zeroext %call) #6, !dbg !3104
    #dbg_value(i8 %call1, !3105, !DIExpression(), !3101)
  %call2 = call fastcc zeroext i8 @mul_f.23(i8 noundef zeroext %call1, i8 noundef zeroext %call1) #6, !dbg !3106
    #dbg_value(i8 %call2, !3107, !DIExpression(), !3101)
  %call3 = call fastcc zeroext i8 @mul_f.23(i8 noundef zeroext %call, i8 noundef zeroext %call1) #6, !dbg !3108
    #dbg_value(i8 %call3, !3109, !DIExpression(), !3101)
  %call4 = call fastcc zeroext i8 @mul_f.23(i8 noundef zeroext %call2, i8 noundef zeroext %call3) #6, !dbg !3110
    #dbg_value(i8 %call4, !3111, !DIExpression(), !3101)
  ret i8 %call4, !dbg !3112
}

; Function Attrs: nounwind
define internal fastcc void @vec_mul_add_u64(i32 noundef %legs, ptr noundef %in, i8 noundef zeroext %a, ptr noundef %acc) unnamed_addr #0 !dbg !3113 {
entry:
    #dbg_value(i32 %legs, !3116, !DIExpression(), !3117)
    #dbg_value(ptr %in, !3118, !DIExpression(), !3117)
    #dbg_value(i8 %a, !3119, !DIExpression(), !3117)
    #dbg_value(ptr %acc, !3120, !DIExpression(), !3117)
  %call = call fastcc i32 @mul_table.22(i8 noundef zeroext %a) #6, !dbg !3121
    #dbg_value(i32 %call, !3122, !DIExpression(), !3117)
    #dbg_value(i64 1229782938247303441, !3123, !DIExpression(), !3117)
    #dbg_value(i32 0, !3124, !DIExpression(), !3126)
  %smax = call i32 @llvm.smax.i32(i32 %legs, i32 0), !dbg !3127
  br label %for.cond, !dbg !3127

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !3128
    #dbg_value(i32 %i.0, !3124, !DIExpression(), !3126)
  %exitcond.not = icmp eq i32 %i.0, %smax, !dbg !3129
  br i1 %exitcond.not, label %for.end, label %for.body, !dbg !3131

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !3132
  %0 = load i64, ptr %arrayidx, align 8, !dbg !3132
  %and = and i64 %0, 1229782938247303441, !dbg !3134
  %and1 = and i32 %call, 255, !dbg !3135
  %conv = zext nneg i32 %and1 to i64, !dbg !3136
  %mul = mul i64 %and, %conv, !dbg !3137
  %shr = lshr i64 %0, 1, !dbg !3138
  %and3 = and i64 %shr, 1229782938247303441, !dbg !3139
  %shr4 = lshr i32 %call, 8, !dbg !3140
  %and5 = and i32 %shr4, 15, !dbg !3141
  %conv6 = zext nneg i32 %and5 to i64, !dbg !3142
  %mul7 = mul nuw i64 %and3, %conv6, !dbg !3143
  %xor = xor i64 %mul, %mul7, !dbg !3144
  %arrayidx8 = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !3145
  %1 = load i64, ptr %arrayidx8, align 8, !dbg !3145
  %shr9 = lshr i64 %1, 2, !dbg !3146
  %and10 = and i64 %shr9, 1229782938247303441, !dbg !3147
  %shr11 = lshr i32 %call, 16, !dbg !3148
  %and12 = and i32 %shr11, 15, !dbg !3149
  %conv13 = zext nneg i32 %and12 to i64, !dbg !3150
  %mul14 = mul nuw i64 %and10, %conv13, !dbg !3151
  %xor15 = xor i64 %xor, %mul14, !dbg !3152
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !3153
  %2 = load i64, ptr %arrayidx16, align 8, !dbg !3153
  %shr17 = lshr i64 %2, 3, !dbg !3154
  %and18 = and i64 %shr17, 1229782938247303441, !dbg !3155
  %shr19 = lshr i32 %call, 24, !dbg !3156
  %and20 = and i32 %shr19, 15, !dbg !3157
  %conv21 = zext nneg i32 %and20 to i64, !dbg !3158
  %mul22 = mul nuw i64 %and18, %conv21, !dbg !3159
  %xor23 = xor i64 %xor15, %mul22, !dbg !3160
  %arrayidx24 = getelementptr inbounds nuw i64, ptr %acc, i32 %i.0, !dbg !3161
  %3 = load i64, ptr %arrayidx24, align 8, !dbg !3162
  %xor25 = xor i64 %3, %xor23, !dbg !3162
  store i64 %xor25, ptr %arrayidx24, align 8, !dbg !3162
  %inc = add nuw i32 %i.0, 1, !dbg !3163
    #dbg_value(i32 %inc, !3124, !DIExpression(), !3126)
  br label %for.cond, !dbg !3164, !llvm.loop !3165

for.end:                                          ; preds = %for.cond
  ret void, !dbg !3167
}

; Function Attrs: nounwind
define internal fastcc void @ef_unpack_m_vec(i32 noundef %legs, ptr noundef %in, ptr noundef %out) unnamed_addr #0 !dbg !3168 {
entry:
    #dbg_value(i32 %legs, !3171, !DIExpression(), !3172)
    #dbg_value(ptr %in, !3173, !DIExpression(), !3172)
    #dbg_value(ptr %out, !3174, !DIExpression(), !3172)
    #dbg_value(ptr %in, !3175, !DIExpression(), !3172)
    #dbg_value(i32 0, !3176, !DIExpression(), !3178)
  br label %for.cond, !dbg !3179

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add8, %for.body ], !dbg !3180
    #dbg_value(i32 %i.0, !3176, !DIExpression(), !3178)
  %mul = shl nsw i32 %legs, 4, !dbg !3181
  %cmp = icmp slt i32 %i.0, %mul, !dbg !3183
  br i1 %cmp, label %for.body, label %for.end, !dbg !3184

for.body:                                         ; preds = %for.cond
  %div = lshr exact i32 %i.0, 1, !dbg !3185
  %arrayidx = getelementptr inbounds nuw i8, ptr %in, i32 %div, !dbg !3187
  %0 = load i8, ptr %arrayidx, align 1, !dbg !3187
  %1 = and i8 %0, 15, !dbg !3188
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %out, i32 %i.0, !dbg !3189
  store i8 %1, ptr %arrayidx2, align 1, !dbg !3190
  %div3 = lshr exact i32 %i.0, 1, !dbg !3191
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %in, i32 %div3, !dbg !3192
  %2 = load i8, ptr %arrayidx4, align 1, !dbg !3192
  %3 = lshr i8 %2, 4, !dbg !3193
  %add = or disjoint i32 %i.0, 1, !dbg !3194
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %out, i32 %add, !dbg !3195
  store i8 %3, ptr %arrayidx7, align 1, !dbg !3196
  %add8 = add nuw nsw i32 %i.0, 2, !dbg !3197
    #dbg_value(i32 %add8, !3176, !DIExpression(), !3178)
  br label %for.cond, !dbg !3198, !llvm.loop !3199

for.end:                                          ; preds = %for.cond
  ret void, !dbg !3201
}

; Function Attrs: nounwind
define internal fastcc i32 @mul_table.22(i8 noundef zeroext %b) unnamed_addr #0 !dbg !3202 {
entry:
    #dbg_value(i8 %b, !3203, !DIExpression(), !3204)
  %conv = zext i8 %b to i32, !dbg !3205
  %mul = mul i32 %conv, 134480385, !dbg !3206
    #dbg_value(i32 %mul, !3207, !DIExpression(), !3204)
    #dbg_value(i32 -252645136, !3208, !DIExpression(), !3204)
  %and = and i32 %mul, -252645136, !dbg !3209
    #dbg_value(i32 %and, !3210, !DIExpression(), !3204)
  %shr = lshr exact i32 %and, 4, !dbg !3211
  %shr1 = lshr exact i32 %and, 3, !dbg !3212
  %0 = xor i32 %shr, %shr1, !dbg !3213
  %xor2 = xor i32 %0, %mul, !dbg !3213
  ret i32 %xor2, !dbg !3214
}

; Function Attrs: nounwind
define internal fastcc zeroext range(i8 0, 16) i8 @mul_f.23(i8 noundef zeroext %a, i8 noundef zeroext %b) unnamed_addr #0 !dbg !3215 {
entry:
    #dbg_value(i8 %a, !3216, !DIExpression(), !3217)
    #dbg_value(i8 %b, !3218, !DIExpression(), !3217)
  %0 = load volatile i8, ptr @pqmayo_MAYO_2_ref_unsigned_char_blocker, align 1, !dbg !3219
  %xor1 = xor i8 %a, %0, !dbg !3220
    #dbg_value(i8 %xor1, !3216, !DIExpression(), !3217)
  %1 = trunc i8 %xor1 to i1, !dbg !3221
    #dbg_value(i8 poison, !3222, !DIExpression(), !3217)
  %2 = and i8 %xor1, 2, !dbg !3223
  %mul9 = mul i8 %2, %b, !dbg !3224
  %conv10 = select i1 %1, i8 %b, i8 0, !dbg !3221
  %xor11 = xor i8 %conv10, %mul9, !dbg !3225
    #dbg_value(i8 %xor11, !3222, !DIExpression(), !3217)
  %3 = and i8 %xor1, 4, !dbg !3226
  %mul16 = mul i8 %3, %b, !dbg !3227
  %xor18 = xor i8 %mul16, %xor11, !dbg !3228
    #dbg_value(i8 %xor18, !3222, !DIExpression(), !3217)
  %4 = and i8 %xor1, 8, !dbg !3229
  %mul23 = mul i8 %4, %b, !dbg !3230
  %xor25 = xor i8 %mul23, %xor18, !dbg !3231
    #dbg_value(i8 %xor25, !3222, !DIExpression(), !3217)
    #dbg_value(i8 %xor25, !3232, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !3217)
  %5 = lshr i8 %xor25, 4, !dbg !3233
  %6 = lshr i8 %xor25, 3, !dbg !3234
  %7 = and i8 %6, 14, !dbg !3234
  %8 = xor i8 %5, %7, !dbg !3235
  %xor25.masked = and i8 %xor25, 15, !dbg !3236
  %9 = xor i8 %8, %xor25.masked, !dbg !3236
    #dbg_value(i8 %9, !3237, !DIExpression(), !3217)
  ret i8 %9, !dbg !3238
}

; Function Attrs: nounwind
define internal fastcc zeroext i8 @lincomb.24(ptr noundef %a, ptr noundef %b, i32 noundef %n, i32 noundef %m) unnamed_addr #0 !dbg !3239 {
entry:
    #dbg_value(ptr %a, !3240, !DIExpression(), !3241)
    #dbg_value(ptr %b, !3242, !DIExpression(), !3241)
    #dbg_value(i32 %n, !3243, !DIExpression(), !3241)
    #dbg_value(i32 %m, !3244, !DIExpression(), !3241)
    #dbg_value(i8 0, !3245, !DIExpression(), !3241)
    #dbg_value(i32 0, !3246, !DIExpression(), !3248)
  %smax = call i32 @llvm.smax.i32(i32 %n, i32 0), !dbg !3249
  br label %for.cond, !dbg !3249

for.cond:                                         ; preds = %for.body, %entry
  %ret.0 = phi i8 [ 0, %entry ], [ %call1, %for.body ], !dbg !3241
  %b.addr.0 = phi ptr [ %b, %entry ], [ %add.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !3250
    #dbg_value(i32 %i.0, !3246, !DIExpression(), !3248)
    #dbg_value(ptr %b.addr.0, !3242, !DIExpression(), !3241)
    #dbg_value(i8 %ret.0, !3245, !DIExpression(), !3241)
  %exitcond.not = icmp eq i32 %i.0, %smax, !dbg !3251
  br i1 %exitcond.not, label %for.end, label %for.body, !dbg !3253

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %i.0, !dbg !3254
  %0 = load i8, ptr %arrayidx, align 1, !dbg !3254
  %1 = load i8, ptr %b.addr.0, align 1, !dbg !3256
  %call = call fastcc zeroext i8 @mul_f.23(i8 noundef zeroext %0, i8 noundef zeroext %1) #6, !dbg !3257
  %call1 = call fastcc zeroext i8 @add_f.25(i8 noundef zeroext %call, i8 noundef zeroext %ret.0) #6, !dbg !3258
    #dbg_value(i8 %call1, !3245, !DIExpression(), !3241)
  %inc = add nuw i32 %i.0, 1, !dbg !3259
    #dbg_value(i32 %inc, !3246, !DIExpression(), !3248)
  %add.ptr = getelementptr inbounds i8, ptr %b.addr.0, i32 %m, !dbg !3260
    #dbg_value(ptr %add.ptr, !3242, !DIExpression(), !3241)
  br label %for.cond, !dbg !3261, !llvm.loop !3262

for.end:                                          ; preds = %for.cond
  ret i8 %ret.0, !dbg !3264
}

; Function Attrs: nounwind
define internal fastcc zeroext i8 @add_f.25(i8 noundef zeroext %a, i8 noundef zeroext %b) unnamed_addr #0 !dbg !3265 {
entry:
    #dbg_value(i8 %a, !3266, !DIExpression(), !3267)
    #dbg_value(i8 %b, !3268, !DIExpression(), !3267)
  %xor1 = xor i8 %a, %b, !dbg !3269
  ret i8 %xor1, !dbg !3270
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #5

attributes #0 = { nounwind "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #1 = { allocsize(0,1) "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #4 = { "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="cortex-m4" "target-features"="+armv7e-m,+dsp,+fp16,+hwdiv,+vfp2sp,+vfp3d16sp,+vfp4d16sp,-thumb-mode" }
attributes #5 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #6 = { nobuiltin "no-builtins" }
attributes #7 = { nobuiltin nounwind allocsize(0,1) "no-builtins" }
attributes #8 = { nobuiltin nounwind "no-builtins" }

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
!116 = !DILocation(line: 148, column: 12, scope: !113)
!117 = !DILocation(line: 148, column: 5, scope: !113)
!118 = distinct !DISubprogram(name: "example_mayo", scope: !2, file: !2, line: 25, type: !119, scopeLine: 25, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !105, retainedNodes: !71)
!119 = !DISubroutineType(types: !120)
!120 = !{!86, !121}
!121 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !122, size: 32)
!122 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !123)
!123 = !DIDerivedType(tag: DW_TAG_typedef, name: "mayo_params_t", file: !79, line: 289, baseType: !124)
!124 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !79, line: 265, size: 736, elements: !125)
!125 = !{!126, !127, !128, !129, !130, !131, !132, !133, !134, !135, !136, !137, !138, !139, !140, !141, !142, !143, !144, !145, !146, !147, !148}
!126 = !DIDerivedType(tag: DW_TAG_member, name: "m", scope: !124, file: !79, line: 266, baseType: !86, size: 32)
!127 = !DIDerivedType(tag: DW_TAG_member, name: "n", scope: !124, file: !79, line: 267, baseType: !86, size: 32, offset: 32)
!128 = !DIDerivedType(tag: DW_TAG_member, name: "o", scope: !124, file: !79, line: 268, baseType: !86, size: 32, offset: 64)
!129 = !DIDerivedType(tag: DW_TAG_member, name: "k", scope: !124, file: !79, line: 269, baseType: !86, size: 32, offset: 96)
!130 = !DIDerivedType(tag: DW_TAG_member, name: "q", scope: !124, file: !79, line: 270, baseType: !86, size: 32, offset: 128)
!131 = !DIDerivedType(tag: DW_TAG_member, name: "f_tail", scope: !124, file: !79, line: 271, baseType: !90, size: 32, offset: 160)
!132 = !DIDerivedType(tag: DW_TAG_member, name: "m_bytes", scope: !124, file: !79, line: 272, baseType: !86, size: 32, offset: 192)
!133 = !DIDerivedType(tag: DW_TAG_member, name: "O_bytes", scope: !124, file: !79, line: 273, baseType: !86, size: 32, offset: 224)
!134 = !DIDerivedType(tag: DW_TAG_member, name: "v_bytes", scope: !124, file: !79, line: 274, baseType: !86, size: 32, offset: 256)
!135 = !DIDerivedType(tag: DW_TAG_member, name: "r_bytes", scope: !124, file: !79, line: 275, baseType: !86, size: 32, offset: 288)
!136 = !DIDerivedType(tag: DW_TAG_member, name: "R_bytes", scope: !124, file: !79, line: 276, baseType: !86, size: 32, offset: 320)
!137 = !DIDerivedType(tag: DW_TAG_member, name: "P1_bytes", scope: !124, file: !79, line: 277, baseType: !86, size: 32, offset: 352)
!138 = !DIDerivedType(tag: DW_TAG_member, name: "P2_bytes", scope: !124, file: !79, line: 278, baseType: !86, size: 32, offset: 384)
!139 = !DIDerivedType(tag: DW_TAG_member, name: "P3_bytes", scope: !124, file: !79, line: 279, baseType: !86, size: 32, offset: 416)
!140 = !DIDerivedType(tag: DW_TAG_member, name: "csk_bytes", scope: !124, file: !79, line: 280, baseType: !86, size: 32, offset: 448)
!141 = !DIDerivedType(tag: DW_TAG_member, name: "cpk_bytes", scope: !124, file: !79, line: 281, baseType: !86, size: 32, offset: 480)
!142 = !DIDerivedType(tag: DW_TAG_member, name: "sig_bytes", scope: !124, file: !79, line: 282, baseType: !86, size: 32, offset: 512)
!143 = !DIDerivedType(tag: DW_TAG_member, name: "salt_bytes", scope: !124, file: !79, line: 283, baseType: !86, size: 32, offset: 544)
!144 = !DIDerivedType(tag: DW_TAG_member, name: "sk_seed_bytes", scope: !124, file: !79, line: 284, baseType: !86, size: 32, offset: 576)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "digest_bytes", scope: !124, file: !79, line: 285, baseType: !86, size: 32, offset: 608)
!146 = !DIDerivedType(tag: DW_TAG_member, name: "pk_seed_bytes", scope: !124, file: !79, line: 286, baseType: !86, size: 32, offset: 640)
!147 = !DIDerivedType(tag: DW_TAG_member, name: "m_vec_limbs", scope: !124, file: !79, line: 287, baseType: !86, size: 32, offset: 672)
!148 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !124, file: !79, line: 288, baseType: !149, size: 32, offset: 704)
!149 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !150, size: 32)
!150 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!151 = !DILocalVariable(name: "p", arg: 1, scope: !118, file: !2, line: 25, type: !121)
!152 = !DILocation(line: 0, scope: !118)
!153 = !DILocalVariable(name: "msglen", scope: !118, file: !2, line: 27, type: !58)
!154 = !DILocation(line: 27, column: 12, scope: !118)
!155 = !DILocalVariable(name: "smlen", scope: !118, file: !2, line: 28, type: !58)
!156 = !DILocation(line: 28, column: 12, scope: !118)
!157 = !DILocation(line: 30, column: 26, scope: !118)
!158 = !DILocalVariable(name: "pk", scope: !118, file: !2, line: 30, type: !61)
!159 = !DILocation(line: 31, column: 26, scope: !118)
!160 = !DILocalVariable(name: "sk", scope: !118, file: !2, line: 31, type: !61)
!161 = !DILocation(line: 33, column: 21, scope: !118)
!162 = !DILocalVariable(name: "epk", scope: !118, file: !2, line: 33, type: !52)
!163 = !DILocation(line: 34, column: 17, scope: !118)
!164 = !DILocalVariable(name: "esk", scope: !118, file: !2, line: 34, type: !165)
!165 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !166, size: 32)
!166 = !DIDerivedType(tag: DW_TAG_typedef, name: "sk_t", file: !79, line: 294, baseType: !167)
!167 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sk_t", file: !79, line: 291, size: 819712, elements: !168)
!168 = !{!169, !173}
!169 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !167, file: !79, line: 292, baseType: !170, size: 811008)
!170 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 811008, elements: !171)
!171 = !{!172}
!172 = !DISubrange(count: 12672)
!173 = !DIDerivedType(tag: DW_TAG_member, name: "O", scope: !167, file: !79, line: 293, baseType: !174, size: 8704, offset: 811008)
!174 = !DICompositeType(tag: DW_TAG_array_type, baseType: !175, size: 8704, elements: !177)
!175 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !54, line: 24, baseType: !176)
!176 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !56, line: 43, baseType: !51)
!177 = !{!178}
!178 = !DISubrange(count: 1088)
!179 = !DILocation(line: 36, column: 54, scope: !118)
!180 = !DILocation(line: 36, column: 52, scope: !118)
!181 = !DILocation(line: 36, column: 26, scope: !118)
!182 = !DILocalVariable(name: "sig", scope: !118, file: !2, line: 36, type: !61)
!183 = !DILocalVariable(name: "msg", scope: !118, file: !2, line: 38, type: !184)
!184 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 256, elements: !185)
!185 = !{!186}
!186 = !DISubrange(count: 32)
!187 = !DILocation(line: 38, column: 19, scope: !118)
!188 = !DILocalVariable(name: "msg2", scope: !118, file: !2, line: 39, type: !184)
!189 = !DILocation(line: 39, column: 19, scope: !118)
!190 = !DILocation(line: 41, column: 5, scope: !118)
!191 = !DILocation(line: 43, column: 5, scope: !118)
!192 = !DILocation(line: 44, column: 15, scope: !118)
!193 = !DILocalVariable(name: "res", scope: !118, file: !2, line: 44, type: !86)
!194 = !DILocation(line: 45, column: 13, scope: !195)
!195 = distinct !DILexicalBlock(scope: !118, file: !2, line: 45, column: 9)
!196 = !DILocation(line: 46, column: 9, scope: !197)
!197 = distinct !DILexicalBlock(scope: !195, file: !2, line: 45, column: 25)
!198 = !DILocation(line: 48, column: 9, scope: !197)
!199 = !DILocation(line: 50, column: 9, scope: !200)
!200 = distinct !DILexicalBlock(scope: !195, file: !2, line: 49, column: 12)
!201 = !DILocation(line: 53, column: 5, scope: !118)
!202 = !DILocation(line: 54, column: 11, scope: !118)
!203 = !DILocation(line: 55, column: 13, scope: !204)
!204 = distinct !DILexicalBlock(scope: !118, file: !2, line: 55, column: 9)
!205 = !DILocation(line: 56, column: 9, scope: !206)
!206 = distinct !DILexicalBlock(scope: !204, file: !2, line: 55, column: 25)
!207 = !DILocation(line: 58, column: 9, scope: !206)
!208 = !DILocation(line: 60, column: 9, scope: !209)
!209 = distinct !DILexicalBlock(scope: !204, file: !2, line: 59, column: 12)
!210 = !DILocation(line: 63, column: 5, scope: !118)
!211 = !DILocation(line: 64, column: 11, scope: !118)
!212 = !DILocation(line: 65, column: 13, scope: !213)
!213 = distinct !DILexicalBlock(scope: !118, file: !2, line: 65, column: 9)
!214 = !DILocation(line: 66, column: 9, scope: !215)
!215 = distinct !DILexicalBlock(scope: !213, file: !2, line: 65, column: 25)
!216 = !DILocation(line: 68, column: 9, scope: !215)
!217 = !DILocation(line: 70, column: 9, scope: !218)
!218 = distinct !DILexicalBlock(scope: !213, file: !2, line: 69, column: 12)
!219 = !DILocation(line: 73, column: 5, scope: !118)
!220 = !DILocation(line: 74, column: 42, scope: !118)
!221 = !DILocation(line: 74, column: 11, scope: !118)
!222 = !DILocation(line: 75, column: 13, scope: !223)
!223 = distinct !DILexicalBlock(scope: !118, file: !2, line: 75, column: 9)
!224 = !DILocation(line: 76, column: 9, scope: !225)
!225 = distinct !DILexicalBlock(scope: !223, file: !2, line: 75, column: 25)
!226 = !DILocation(line: 78, column: 9, scope: !225)
!227 = !DILocation(line: 80, column: 9, scope: !228)
!228 = distinct !DILexicalBlock(scope: !223, file: !2, line: 79, column: 12)
!229 = !DILocation(line: 83, column: 5, scope: !118)
!230 = !DILocation(line: 84, column: 44, scope: !118)
!231 = !DILocation(line: 84, column: 11, scope: !118)
!232 = !DILocation(line: 85, column: 13, scope: !233)
!233 = distinct !DILexicalBlock(scope: !118, file: !2, line: 85, column: 9)
!234 = !DILocation(line: 85, column: 24, scope: !233)
!235 = !DILocation(line: 85, column: 45, scope: !233)
!236 = !DILocation(line: 85, column: 27, scope: !233)
!237 = !DILocation(line: 86, column: 9, scope: !238)
!238 = distinct !DILexicalBlock(scope: !233, file: !2, line: 85, column: 54)
!239 = !DILocation(line: 88, column: 9, scope: !238)
!240 = !DILocation(line: 91, column: 9, scope: !241)
!241 = distinct !DILexicalBlock(scope: !233, file: !2, line: 89, column: 12)
!242 = !DILocation(line: 94, column: 5, scope: !118)
!243 = !DILocation(line: 95, column: 31, scope: !118)
!244 = !DILocation(line: 95, column: 11, scope: !118)
!245 = !DILocation(line: 96, column: 13, scope: !246)
!246 = distinct !DILexicalBlock(scope: !118, file: !2, line: 96, column: 9)
!247 = !DILocation(line: 97, column: 9, scope: !248)
!248 = distinct !DILexicalBlock(scope: !246, file: !2, line: 96, column: 25)
!249 = !DILocation(line: 99, column: 9, scope: !248)
!250 = !DILocation(line: 102, column: 9, scope: !251)
!251 = distinct !DILexicalBlock(scope: !246, file: !2, line: 100, column: 12)
!252 = !DILocation(line: 96, column: 16, scope: !246)
!253 = !DILabel(scope: !118, name: "err", file: !2, line: 129)
!254 = !DILocation(line: 129, column: 1, scope: !118)
!255 = !DILocation(line: 130, column: 5, scope: !118)
!256 = !DILocation(line: 131, column: 5, scope: !118)
!257 = !DILocation(line: 132, column: 5, scope: !118)
!258 = !DILocation(line: 133, column: 5, scope: !118)
!259 = !DILocation(line: 134, column: 5, scope: !118)
!260 = !DILocation(line: 135, column: 5, scope: !118)
!261 = distinct !DISubprogram(name: "pqmayo_MAYO_2_ref_mayo_keypair", scope: !68, file: !68, line: 298, type: !262, scopeLine: 298, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!262 = !DISubroutineType(types: !263)
!263 = !{!86, !264, !61, !61}
!264 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !265, size: 32)
!265 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !266)
!266 = !DIDerivedType(tag: DW_TAG_typedef, name: "mayo_params_t", file: !79, line: 289, baseType: !267)
!267 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !79, line: 265, size: 736, elements: !268)
!268 = !{!269, !270, !271, !272, !273, !274, !275, !276, !277, !278, !279, !280, !281, !282, !283, !284, !285, !286, !287, !288, !289, !290, !291}
!269 = !DIDerivedType(tag: DW_TAG_member, name: "m", scope: !267, file: !79, line: 266, baseType: !86, size: 32)
!270 = !DIDerivedType(tag: DW_TAG_member, name: "n", scope: !267, file: !79, line: 267, baseType: !86, size: 32, offset: 32)
!271 = !DIDerivedType(tag: DW_TAG_member, name: "o", scope: !267, file: !79, line: 268, baseType: !86, size: 32, offset: 64)
!272 = !DIDerivedType(tag: DW_TAG_member, name: "k", scope: !267, file: !79, line: 269, baseType: !86, size: 32, offset: 96)
!273 = !DIDerivedType(tag: DW_TAG_member, name: "q", scope: !267, file: !79, line: 270, baseType: !86, size: 32, offset: 128)
!274 = !DIDerivedType(tag: DW_TAG_member, name: "f_tail", scope: !267, file: !79, line: 271, baseType: !90, size: 32, offset: 160)
!275 = !DIDerivedType(tag: DW_TAG_member, name: "m_bytes", scope: !267, file: !79, line: 272, baseType: !86, size: 32, offset: 192)
!276 = !DIDerivedType(tag: DW_TAG_member, name: "O_bytes", scope: !267, file: !79, line: 273, baseType: !86, size: 32, offset: 224)
!277 = !DIDerivedType(tag: DW_TAG_member, name: "v_bytes", scope: !267, file: !79, line: 274, baseType: !86, size: 32, offset: 256)
!278 = !DIDerivedType(tag: DW_TAG_member, name: "r_bytes", scope: !267, file: !79, line: 275, baseType: !86, size: 32, offset: 288)
!279 = !DIDerivedType(tag: DW_TAG_member, name: "R_bytes", scope: !267, file: !79, line: 276, baseType: !86, size: 32, offset: 320)
!280 = !DIDerivedType(tag: DW_TAG_member, name: "P1_bytes", scope: !267, file: !79, line: 277, baseType: !86, size: 32, offset: 352)
!281 = !DIDerivedType(tag: DW_TAG_member, name: "P2_bytes", scope: !267, file: !79, line: 278, baseType: !86, size: 32, offset: 384)
!282 = !DIDerivedType(tag: DW_TAG_member, name: "P3_bytes", scope: !267, file: !79, line: 279, baseType: !86, size: 32, offset: 416)
!283 = !DIDerivedType(tag: DW_TAG_member, name: "csk_bytes", scope: !267, file: !79, line: 280, baseType: !86, size: 32, offset: 448)
!284 = !DIDerivedType(tag: DW_TAG_member, name: "cpk_bytes", scope: !267, file: !79, line: 281, baseType: !86, size: 32, offset: 480)
!285 = !DIDerivedType(tag: DW_TAG_member, name: "sig_bytes", scope: !267, file: !79, line: 282, baseType: !86, size: 32, offset: 512)
!286 = !DIDerivedType(tag: DW_TAG_member, name: "salt_bytes", scope: !267, file: !79, line: 283, baseType: !86, size: 32, offset: 544)
!287 = !DIDerivedType(tag: DW_TAG_member, name: "sk_seed_bytes", scope: !267, file: !79, line: 284, baseType: !86, size: 32, offset: 576)
!288 = !DIDerivedType(tag: DW_TAG_member, name: "digest_bytes", scope: !267, file: !79, line: 285, baseType: !86, size: 32, offset: 608)
!289 = !DIDerivedType(tag: DW_TAG_member, name: "pk_seed_bytes", scope: !267, file: !79, line: 286, baseType: !86, size: 32, offset: 640)
!290 = !DIDerivedType(tag: DW_TAG_member, name: "m_vec_limbs", scope: !267, file: !79, line: 287, baseType: !86, size: 32, offset: 672)
!291 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !267, file: !79, line: 288, baseType: !149, size: 32, offset: 704)
!292 = !DILocalVariable(name: "p", arg: 1, scope: !261, file: !68, line: 298, type: !264)
!293 = !DILocation(line: 0, scope: !261)
!294 = !DILocalVariable(name: "pk", arg: 2, scope: !261, file: !68, line: 298, type: !61)
!295 = !DILocalVariable(name: "sk", arg: 3, scope: !261, file: !68, line: 298, type: !61)
!296 = !DILocalVariable(name: "ret", scope: !261, file: !68, line: 299, type: !86)
!297 = !DILocation(line: 301, column: 11, scope: !261)
!298 = !DILabel(scope: !261, name: "err", file: !68, line: 306)
!299 = !DILocation(line: 306, column: 1, scope: !261)
!300 = !DILocation(line: 307, column: 5, scope: !261)
!301 = distinct !DISubprogram(name: "pqmayo_MAYO_2_ref_mayo_keypair_compact", scope: !68, file: !68, line: 538, type: !262, scopeLine: 539, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!302 = !DILocalVariable(name: "p", arg: 1, scope: !301, file: !68, line: 538, type: !264)
!303 = !DILocation(line: 0, scope: !301)
!304 = !DILocalVariable(name: "cpk", arg: 2, scope: !301, file: !68, line: 538, type: !61)
!305 = !DILocalVariable(name: "csk", arg: 3, scope: !301, file: !68, line: 539, type: !61)
!306 = !DILocalVariable(name: "ret", scope: !301, file: !68, line: 540, type: !86)
!307 = !DILocalVariable(name: "seed_sk", scope: !301, file: !68, line: 541, type: !61)
!308 = !DILocalVariable(name: "S", scope: !301, file: !68, line: 542, type: !309)
!309 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 4480, elements: !310)
!310 = !{!311}
!311 = !DISubrange(count: 560)
!312 = !DILocation(line: 542, column: 19, scope: !301)
!313 = !DILocalVariable(name: "P", scope: !301, file: !68, line: 543, type: !170)
!314 = !DILocation(line: 543, column: 14, scope: !301)
!315 = !DILocalVariable(name: "P3", scope: !301, file: !68, line: 544, type: !316)
!316 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 73984, elements: !317)
!317 = !{!318}
!318 = !DISubrange(count: 1156)
!319 = !DILocation(line: 544, column: 14, scope: !301)
!320 = !DILocalVariable(name: "O", scope: !301, file: !68, line: 547, type: !321)
!321 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 8704, elements: !177)
!322 = !DILocation(line: 547, column: 19, scope: !301)
!323 = !DILocalVariable(name: "m_vec_limbs", scope: !301, file: !68, line: 549, type: !324)
!324 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !86)
!325 = !DILocalVariable(name: "param_m", scope: !301, file: !68, line: 550, type: !324)
!326 = !DILocalVariable(name: "param_v", scope: !301, file: !68, line: 551, type: !324)
!327 = !DILocalVariable(name: "param_o", scope: !301, file: !68, line: 552, type: !324)
!328 = !DILocalVariable(name: "param_O_bytes", scope: !301, file: !68, line: 553, type: !324)
!329 = !DILocalVariable(name: "param_P1_limbs", scope: !301, file: !68, line: 554, type: !324)
!330 = !DILocalVariable(name: "param_P3_limbs", scope: !301, file: !68, line: 555, type: !324)
!331 = !DILocalVariable(name: "param_pk_seed_bytes", scope: !301, file: !68, line: 556, type: !324)
!332 = !DILocalVariable(name: "param_sk_seed_bytes", scope: !301, file: !68, line: 557, type: !324)
!333 = !DILocalVariable(name: "P1", scope: !301, file: !68, line: 559, type: !52)
!334 = !DILocation(line: 560, column: 22, scope: !301)
!335 = !DILocalVariable(name: "P2", scope: !301, file: !68, line: 560, type: !52)
!336 = !DILocation(line: 566, column: 9, scope: !337)
!337 = distinct !DILexicalBlock(scope: !301, file: !68, line: 566, column: 9)
!338 = !DILocation(line: 566, column: 51, scope: !337)
!339 = !DILocation(line: 573, column: 5, scope: !301)
!340 = !DILocalVariable(name: "seed_pk", scope: !301, file: !68, line: 546, type: !61)
!341 = !DILocation(line: 579, column: 14, scope: !301)
!342 = !DILocation(line: 579, column: 5, scope: !301)
!343 = !DILocation(line: 585, column: 5, scope: !301)
!344 = !DILocation(line: 588, column: 5, scope: !301)
!345 = !DILocation(line: 591, column: 5, scope: !301)
!346 = !DILocalVariable(name: "P3_upper", scope: !301, file: !68, line: 593, type: !347)
!347 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 39168, elements: !348)
!348 = !{!349}
!349 = !DISubrange(count: 612)
!350 = !DILocation(line: 593, column: 14, scope: !301)
!351 = !DILocation(line: 596, column: 5, scope: !301)
!352 = !DILocation(line: 597, column: 31, scope: !301)
!353 = !DILocation(line: 597, column: 5, scope: !301)
!354 = !DILabel(scope: !301, name: "err", file: !68, line: 600)
!355 = !DILocation(line: 600, column: 5, scope: !301)
!356 = !DILocation(line: 602, column: 5, scope: !301)
!357 = !DILocation(line: 603, column: 5, scope: !301)
!358 = !DILocation(line: 604, column: 5, scope: !301)
!359 = !DILocation(line: 605, column: 5, scope: !301)
!360 = distinct !DISubprogram(name: "decode", scope: !68, file: !68, line: 20, type: !361, scopeLine: 20, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!361 = !DISubroutineType(types: !362)
!362 = !{null, !90, !61, !86}
!363 = !DILocalVariable(name: "m", arg: 1, scope: !360, file: !68, line: 20, type: !90)
!364 = !DILocation(line: 0, scope: !360)
!365 = !DILocalVariable(name: "mdec", arg: 2, scope: !360, file: !68, line: 20, type: !61)
!366 = !DILocalVariable(name: "mdeclen", arg: 3, scope: !360, file: !68, line: 20, type: !86)
!367 = !DILocalVariable(name: "i", scope: !360, file: !68, line: 21, type: !86)
!368 = !DILocation(line: 22, column: 10, scope: !369)
!369 = distinct !DILexicalBlock(scope: !360, file: !68, line: 22, column: 5)
!370 = !DILocation(line: 22, scope: !369)
!371 = !DILocation(line: 22, column: 29, scope: !372)
!372 = distinct !DILexicalBlock(scope: !369, file: !68, line: 22, column: 5)
!373 = !DILocation(line: 22, column: 19, scope: !372)
!374 = !DILocation(line: 22, column: 5, scope: !369)
!375 = !DILocation(line: 23, column: 19, scope: !376)
!376 = distinct !DILexicalBlock(scope: !372, file: !68, line: 22, column: 39)
!377 = !DILocation(line: 23, column: 24, scope: !376)
!378 = !DILocation(line: 23, column: 14, scope: !376)
!379 = !DILocation(line: 23, column: 17, scope: !376)
!380 = !DILocation(line: 24, column: 19, scope: !376)
!381 = !DILocation(line: 24, column: 24, scope: !376)
!382 = !DILocation(line: 24, column: 17, scope: !376)
!383 = !DILocation(line: 24, column: 14, scope: !376)
!384 = !DILocation(line: 22, column: 34, scope: !372)
!385 = !DILocation(line: 22, column: 5, scope: !372)
!386 = distinct !{!386, !374, !387, !388}
!387 = !DILocation(line: 25, column: 5, scope: !369)
!388 = !{!"llvm.loop.mustprogress"}
!389 = !DILocation(line: 27, column: 21, scope: !390)
!390 = distinct !DILexicalBlock(scope: !360, file: !68, line: 27, column: 9)
!391 = !DILocation(line: 28, column: 19, scope: !392)
!392 = distinct !DILexicalBlock(scope: !390, file: !68, line: 27, column: 27)
!393 = !DILocation(line: 28, column: 24, scope: !392)
!394 = !DILocation(line: 28, column: 17, scope: !392)
!395 = !DILocation(line: 29, column: 5, scope: !392)
!396 = !DILocation(line: 30, column: 1, scope: !360)
!397 = distinct !DISubprogram(name: "expand_P1_P2", scope: !68, file: !68, line: 280, type: !398, scopeLine: 280, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!398 = !DISubroutineType(types: !399)
!399 = !{null, !264, !52, !90}
!400 = !DILocalVariable(name: "p", arg: 1, scope: !397, file: !68, line: 280, type: !264)
!401 = !DILocation(line: 0, scope: !397)
!402 = !DILocalVariable(name: "P", arg: 2, scope: !397, file: !68, line: 280, type: !52)
!403 = !DILocalVariable(name: "seed_pk", arg: 3, scope: !397, file: !68, line: 280, type: !90)
!404 = !DILocation(line: 284, column: 5, scope: !397)
!405 = !DILocation(line: 285, column: 5, scope: !397)
!406 = !DILocation(line: 286, column: 1, scope: !397)
!407 = distinct !DISubprogram(name: "compute_P3", scope: !408, file: !408, line: 260, type: !409, scopeLine: 260, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!408 = !DIFile(filename: "../../../src/generic/generic_arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!409 = !DISubroutineType(types: !410)
!410 = !{null, !264, !411, !52, !90, !52}
!411 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 32)
!412 = !DILocalVariable(name: "p", arg: 1, scope: !407, file: !408, line: 260, type: !264)
!413 = !DILocation(line: 0, scope: !407)
!414 = !DILocalVariable(name: "P1", arg: 2, scope: !407, file: !408, line: 260, type: !411)
!415 = !DILocalVariable(name: "P2", arg: 3, scope: !407, file: !408, line: 260, type: !52)
!416 = !DILocalVariable(name: "O", arg: 4, scope: !407, file: !408, line: 260, type: !90)
!417 = !DILocalVariable(name: "P3", arg: 5, scope: !407, file: !408, line: 260, type: !52)
!418 = !DILocalVariable(name: "m_vec_limbs", scope: !407, file: !408, line: 262, type: !324)
!419 = !DILocalVariable(name: "param_v", scope: !407, file: !408, line: 263, type: !324)
!420 = !DILocalVariable(name: "param_o", scope: !407, file: !408, line: 264, type: !324)
!421 = !DILocation(line: 267, column: 5, scope: !407)
!422 = !DILocation(line: 270, column: 5, scope: !407)
!423 = !DILocation(line: 271, column: 1, scope: !407)
!424 = distinct !DISubprogram(name: "pack_m_vecs", scope: !68, file: !68, line: 272, type: !425, scopeLine: 272, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!425 = !DISubroutineType(types: !426)
!426 = !{null, !411, !61, !86, !86}
!427 = !DILocalVariable(name: "in", arg: 1, scope: !424, file: !68, line: 272, type: !411)
!428 = !DILocation(line: 0, scope: !424)
!429 = !DILocalVariable(name: "out", arg: 2, scope: !424, file: !68, line: 272, type: !61)
!430 = !DILocalVariable(name: "vecs", arg: 3, scope: !424, file: !68, line: 272, type: !86)
!431 = !DILocalVariable(name: "m", arg: 4, scope: !424, file: !68, line: 272, type: !86)
!432 = !DILocation(line: 273, column: 32, scope: !424)
!433 = !DILocation(line: 273, column: 38, scope: !424)
!434 = !DILocalVariable(name: "m_vec_limbs", scope: !424, file: !68, line: 273, type: !324)
!435 = !DILocalVariable(name: "_in", scope: !424, file: !68, line: 274, type: !61)
!436 = !DILocalVariable(name: "i", scope: !437, file: !68, line: 275, type: !86)
!437 = distinct !DILexicalBlock(scope: !424, file: !68, line: 275, column: 5)
!438 = !DILocation(line: 0, scope: !437)
!439 = !DILocation(line: 275, column: 10, scope: !437)
!440 = !DILocation(line: 275, scope: !437)
!441 = !DILocation(line: 275, column: 23, scope: !442)
!442 = distinct !DILexicalBlock(scope: !437, file: !68, line: 275, column: 5)
!443 = !DILocation(line: 275, column: 5, scope: !437)
!444 = !DILocation(line: 277, column: 25, scope: !445)
!445 = distinct !DILexicalBlock(scope: !442, file: !68, line: 276, column: 5)
!446 = !DILocation(line: 277, column: 27, scope: !445)
!447 = !DILocation(line: 277, column: 21, scope: !445)
!448 = !DILocation(line: 277, column: 39, scope: !445)
!449 = !DILocation(line: 277, column: 51, scope: !445)
!450 = !DILocation(line: 277, column: 36, scope: !445)
!451 = !DILocation(line: 277, column: 71, scope: !445)
!452 = !DILocation(line: 277, column: 9, scope: !445)
!453 = !DILocation(line: 275, column: 32, scope: !442)
!454 = !DILocation(line: 275, column: 5, scope: !442)
!455 = distinct !{!455, !443, !456, !388}
!456 = !DILocation(line: 278, column: 5, scope: !437)
!457 = !DILocation(line: 279, column: 1, scope: !424)
!458 = distinct !DISubprogram(name: "P1_times_O", scope: !408, file: !408, line: 74, type: !459, scopeLine: 74, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!459 = !DISubroutineType(types: !460)
!460 = !{null, !264, !411, !90, !52}
!461 = !DILocalVariable(name: "p", arg: 1, scope: !458, file: !408, line: 74, type: !264)
!462 = !DILocation(line: 0, scope: !458)
!463 = !DILocalVariable(name: "P1", arg: 2, scope: !458, file: !408, line: 74, type: !411)
!464 = !DILocalVariable(name: "O", arg: 3, scope: !458, file: !408, line: 74, type: !90)
!465 = !DILocalVariable(name: "acc", arg: 4, scope: !458, file: !408, line: 74, type: !52)
!466 = !DILocation(line: 78, column: 5, scope: !458)
!467 = !DILocation(line: 79, column: 1, scope: !458)
!468 = distinct !DISubprogram(name: "mul_add_mat_trans_x_m_mat", scope: !408, file: !408, line: 47, type: !469, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!469 = !DISubroutineType(types: !470)
!470 = !{null, !324, !90, !411, !52, !324, !324, !324}
!471 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !468, file: !408, line: 47, type: !324)
!472 = !DILocation(line: 0, scope: !468)
!473 = !DILocalVariable(name: "mat", arg: 2, scope: !468, file: !408, line: 47, type: !90)
!474 = !DILocalVariable(name: "bs_mat", arg: 3, scope: !468, file: !408, line: 47, type: !411)
!475 = !DILocalVariable(name: "acc", arg: 4, scope: !468, file: !408, line: 47, type: !52)
!476 = !DILocalVariable(name: "mat_rows", arg: 5, scope: !468, file: !408, line: 48, type: !324)
!477 = !DILocalVariable(name: "mat_cols", arg: 6, scope: !468, file: !408, line: 48, type: !324)
!478 = !DILocalVariable(name: "bs_mat_cols", arg: 7, scope: !468, file: !408, line: 48, type: !324)
!479 = !DILocalVariable(name: "r", scope: !480, file: !408, line: 50, type: !86)
!480 = distinct !DILexicalBlock(scope: !468, file: !408, line: 50, column: 5)
!481 = !DILocation(line: 0, scope: !480)
!482 = !DILocation(line: 50, column: 10, scope: !480)
!483 = !DILocation(line: 50, scope: !480)
!484 = !DILocation(line: 50, column: 23, scope: !485)
!485 = distinct !DILexicalBlock(scope: !480, file: !408, line: 50, column: 5)
!486 = !DILocation(line: 50, column: 5, scope: !480)
!487 = !DILocation(line: 51, scope: !488)
!488 = distinct !DILexicalBlock(scope: !489, file: !408, line: 51, column: 9)
!489 = distinct !DILexicalBlock(scope: !485, file: !408, line: 50, column: 40)
!490 = !DILocalVariable(name: "c", scope: !488, file: !408, line: 51, type: !86)
!491 = !DILocation(line: 0, scope: !488)
!492 = !DILocation(line: 51, column: 27, scope: !493)
!493 = distinct !DILexicalBlock(scope: !488, file: !408, line: 51, column: 9)
!494 = !DILocation(line: 51, column: 9, scope: !488)
!495 = !DILocation(line: 52, scope: !496)
!496 = distinct !DILexicalBlock(scope: !497, file: !408, line: 52, column: 13)
!497 = distinct !DILexicalBlock(scope: !493, file: !408, line: 51, column: 44)
!498 = !DILocalVariable(name: "k", scope: !496, file: !408, line: 52, type: !86)
!499 = !DILocation(line: 0, scope: !496)
!500 = !DILocation(line: 52, column: 31, scope: !501)
!501 = distinct !DILexicalBlock(scope: !496, file: !408, line: 52, column: 13)
!502 = !DILocation(line: 52, column: 13, scope: !496)
!503 = !DILocation(line: 53, column: 70, scope: !504)
!504 = distinct !DILexicalBlock(scope: !501, file: !408, line: 52, column: 54)
!505 = !DILocation(line: 53, column: 84, scope: !504)
!506 = !DILocation(line: 53, column: 65, scope: !504)
!507 = !DILocation(line: 53, column: 51, scope: !504)
!508 = !DILocation(line: 53, column: 96, scope: !504)
!509 = !DILocation(line: 53, column: 90, scope: !504)
!510 = !DILocation(line: 53, column: 136, scope: !504)
!511 = !DILocation(line: 53, column: 150, scope: !504)
!512 = !DILocation(line: 53, column: 131, scope: !504)
!513 = !DILocation(line: 53, column: 117, scope: !504)
!514 = !DILocation(line: 53, column: 17, scope: !504)
!515 = !DILocation(line: 52, column: 48, scope: !501)
!516 = !DILocation(line: 52, column: 13, scope: !501)
!517 = distinct !{!517, !502, !518, !388}
!518 = !DILocation(line: 54, column: 13, scope: !496)
!519 = !DILocation(line: 51, column: 40, scope: !493)
!520 = !DILocation(line: 51, column: 9, scope: !493)
!521 = distinct !{!521, !494, !522, !388}
!522 = !DILocation(line: 55, column: 9, scope: !488)
!523 = !DILocation(line: 50, column: 36, scope: !485)
!524 = !DILocation(line: 50, column: 5, scope: !485)
!525 = distinct !{!525, !486, !526, !388}
!526 = !DILocation(line: 56, column: 5, scope: !480)
!527 = !DILocation(line: 57, column: 1, scope: !468)
!528 = distinct !DISubprogram(name: "m_vec_mul_add", scope: !529, file: !529, line: 31, type: !530, scopeLine: 31, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!529 = !DIFile(filename: "../../../src/generic/arithmetic_fixed.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!530 = !DISubroutineType(types: !531)
!531 = !{null, !86, !411, !51, !52}
!532 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !528, file: !529, line: 31, type: !86)
!533 = !DILocation(line: 0, scope: !528)
!534 = !DILocalVariable(name: "in", arg: 2, scope: !528, file: !529, line: 31, type: !411)
!535 = !DILocalVariable(name: "a", arg: 3, scope: !528, file: !529, line: 31, type: !51)
!536 = !DILocalVariable(name: "acc", arg: 4, scope: !528, file: !529, line: 31, type: !52)
!537 = !DILocation(line: 33, column: 20, scope: !528)
!538 = !DILocalVariable(name: "tab", scope: !528, file: !529, line: 33, type: !62)
!539 = !DILocalVariable(name: "lsb_ask", scope: !528, file: !529, line: 35, type: !53)
!540 = !DILocalVariable(name: "i", scope: !541, file: !529, line: 37, type: !86)
!541 = distinct !DILexicalBlock(scope: !528, file: !529, line: 37, column: 5)
!542 = !DILocation(line: 0, scope: !541)
!543 = !DILocation(line: 38, column: 21, scope: !544)
!544 = distinct !DILexicalBlock(scope: !545, file: !529, line: 37, column: 43)
!545 = distinct !DILexicalBlock(scope: !541, file: !529, line: 37, column: 5)
!546 = !DILocation(line: 38, column: 33, scope: !544)
!547 = !DILocation(line: 38, column: 51, scope: !544)
!548 = !DILocation(line: 38, column: 46, scope: !544)
!549 = !DILocation(line: 38, column: 44, scope: !544)
!550 = !DILocation(line: 39, column: 27, scope: !544)
!551 = !DILocation(line: 39, column: 33, scope: !544)
!552 = !DILocation(line: 39, column: 52, scope: !544)
!553 = !DILocation(line: 39, column: 59, scope: !544)
!554 = !DILocation(line: 39, column: 46, scope: !544)
!555 = !DILocation(line: 39, column: 44, scope: !544)
!556 = !DILocation(line: 39, column: 17, scope: !544)
!557 = !DILocation(line: 40, column: 21, scope: !544)
!558 = !DILocation(line: 40, column: 27, scope: !544)
!559 = !DILocation(line: 40, column: 33, scope: !544)
!560 = !DILocation(line: 40, column: 52, scope: !544)
!561 = !DILocation(line: 40, column: 59, scope: !544)
!562 = !DILocation(line: 40, column: 46, scope: !544)
!563 = !DILocation(line: 40, column: 44, scope: !544)
!564 = !DILocation(line: 40, column: 17, scope: !544)
!565 = !DILocation(line: 41, column: 21, scope: !544)
!566 = !DILocation(line: 41, column: 27, scope: !544)
!567 = !DILocation(line: 41, column: 33, scope: !544)
!568 = !DILocation(line: 41, column: 52, scope: !544)
!569 = !DILocation(line: 41, column: 59, scope: !544)
!570 = !DILocation(line: 41, column: 46, scope: !544)
!571 = !DILocation(line: 41, column: 44, scope: !544)
!572 = !DILocation(line: 41, column: 17, scope: !544)
!573 = !DILocation(line: 38, column: 16, scope: !544)
!574 = !DILocation(line: 38, column: 9, scope: !544)
!575 = !DILocation(line: 43, column: 1, scope: !528)
!576 = distinct !DISubprogram(name: "mul_table", scope: !577, file: !577, line: 130, type: !578, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!577 = !DIFile(filename: "../../../src/simple_arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!578 = !DISubroutineType(types: !579)
!579 = !{!62, !175}
!580 = !DILocalVariable(name: "b", arg: 1, scope: !576, file: !577, line: 130, type: !175)
!581 = !DILocation(line: 0, scope: !576)
!582 = !DILocation(line: 131, column: 19, scope: !576)
!583 = !DILocation(line: 131, column: 33, scope: !576)
!584 = !DILocalVariable(name: "x", scope: !576, file: !577, line: 131, type: !62)
!585 = !DILocalVariable(name: "high_nibble_mask", scope: !576, file: !577, line: 133, type: !62)
!586 = !DILocation(line: 135, column: 28, scope: !576)
!587 = !DILocalVariable(name: "high_half", scope: !576, file: !577, line: 135, type: !62)
!588 = !DILocation(line: 136, column: 28, scope: !576)
!589 = !DILocation(line: 136, column: 47, scope: !576)
!590 = !DILocation(line: 136, column: 34, scope: !576)
!591 = !DILocation(line: 136, column: 5, scope: !576)
!592 = distinct !DISubprogram(name: "mul_add_m_upper_triangular_mat_x_mat", scope: !408, file: !408, line: 16, type: !593, scopeLine: 17, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!593 = !DISubroutineType(types: !594)
!594 = !{null, !324, !411, !90, !52, !324, !324, !324, !324}
!595 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !592, file: !408, line: 16, type: !324)
!596 = !DILocation(line: 0, scope: !592)
!597 = !DILocalVariable(name: "bs_mat", arg: 2, scope: !592, file: !408, line: 16, type: !411)
!598 = !DILocalVariable(name: "mat", arg: 3, scope: !592, file: !408, line: 16, type: !90)
!599 = !DILocalVariable(name: "acc", arg: 4, scope: !592, file: !408, line: 16, type: !52)
!600 = !DILocalVariable(name: "bs_mat_rows", arg: 5, scope: !592, file: !408, line: 17, type: !324)
!601 = !DILocalVariable(name: "bs_mat_cols", arg: 6, scope: !592, file: !408, line: 17, type: !324)
!602 = !DILocalVariable(name: "mat_cols", arg: 7, scope: !592, file: !408, line: 17, type: !324)
!603 = !DILocalVariable(name: "triangular", arg: 8, scope: !592, file: !408, line: 17, type: !324)
!604 = !DILocalVariable(name: "bs_mat_entries_used", scope: !592, file: !408, line: 19, type: !86)
!605 = !DILocalVariable(name: "r", scope: !606, file: !408, line: 20, type: !86)
!606 = distinct !DILexicalBlock(scope: !592, file: !408, line: 20, column: 5)
!607 = !DILocation(line: 0, scope: !606)
!608 = !DILocation(line: 20, column: 10, scope: !606)
!609 = !DILocation(line: 19, column: 9, scope: !592)
!610 = !DILocation(line: 20, scope: !606)
!611 = !DILocation(line: 20, column: 23, scope: !612)
!612 = distinct !DILexicalBlock(scope: !606, file: !408, line: 20, column: 5)
!613 = !DILocation(line: 20, column: 5, scope: !606)
!614 = !DILocation(line: 21, column: 33, scope: !615)
!615 = distinct !DILexicalBlock(scope: !616, file: !408, line: 21, column: 9)
!616 = distinct !DILexicalBlock(scope: !612, file: !408, line: 20, column: 43)
!617 = !DILocalVariable(name: "c", scope: !615, file: !408, line: 21, type: !86)
!618 = !DILocation(line: 0, scope: !615)
!619 = !DILocation(line: 21, column: 14, scope: !615)
!620 = !DILocation(line: 21, scope: !615)
!621 = !DILocation(line: 21, column: 40, scope: !622)
!622 = distinct !DILexicalBlock(scope: !615, file: !408, line: 21, column: 9)
!623 = !DILocation(line: 21, column: 9, scope: !615)
!624 = !DILocation(line: 22, scope: !625)
!625 = distinct !DILexicalBlock(scope: !626, file: !408, line: 22, column: 13)
!626 = distinct !DILexicalBlock(scope: !622, file: !408, line: 21, column: 60)
!627 = !DILocalVariable(name: "k", scope: !625, file: !408, line: 22, type: !86)
!628 = !DILocation(line: 0, scope: !625)
!629 = !DILocation(line: 22, column: 31, scope: !630)
!630 = distinct !DILexicalBlock(scope: !625, file: !408, line: 22, column: 13)
!631 = !DILocation(line: 22, column: 13, scope: !625)
!632 = !DILocation(line: 23, column: 65, scope: !633)
!633 = distinct !DILexicalBlock(scope: !630, file: !408, line: 22, column: 51)
!634 = !DILocation(line: 23, column: 51, scope: !633)
!635 = !DILocation(line: 23, column: 94, scope: !633)
!636 = !DILocation(line: 23, column: 88, scope: !633)
!637 = !DILocation(line: 23, column: 134, scope: !633)
!638 = !DILocation(line: 23, column: 145, scope: !633)
!639 = !DILocation(line: 23, column: 129, scope: !633)
!640 = !DILocation(line: 23, column: 115, scope: !633)
!641 = !DILocation(line: 23, column: 17, scope: !633)
!642 = !DILocation(line: 22, column: 45, scope: !630)
!643 = !DILocation(line: 22, column: 13, scope: !630)
!644 = distinct !{!644, !631, !645, !388}
!645 = !DILocation(line: 24, column: 13, scope: !625)
!646 = !DILocation(line: 25, column: 33, scope: !626)
!647 = !DILocation(line: 21, column: 56, scope: !622)
!648 = !DILocation(line: 21, column: 9, scope: !622)
!649 = distinct !{!649, !623, !650, !388}
!650 = !DILocation(line: 26, column: 9, scope: !615)
!651 = !DILocation(line: 20, column: 39, scope: !612)
!652 = !DILocation(line: 20, column: 5, scope: !612)
!653 = distinct !{!653, !613, !654, !388}
!654 = !DILocation(line: 27, column: 5, scope: !606)
!655 = !DILocation(line: 28, column: 1, scope: !592)
!656 = distinct !DISubprogram(name: "unpack_m_vecs", scope: !68, file: !68, line: 262, type: !657, scopeLine: 262, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!657 = !DISubroutineType(types: !658)
!658 = !{null, !90, !52, !86, !86}
!659 = !DILocalVariable(name: "in", arg: 1, scope: !656, file: !68, line: 262, type: !90)
!660 = !DILocation(line: 0, scope: !656)
!661 = !DILocalVariable(name: "out", arg: 2, scope: !656, file: !68, line: 262, type: !52)
!662 = !DILocalVariable(name: "vecs", arg: 3, scope: !656, file: !68, line: 262, type: !86)
!663 = !DILocalVariable(name: "m", arg: 4, scope: !656, file: !68, line: 262, type: !86)
!664 = !DILocation(line: 263, column: 32, scope: !656)
!665 = !DILocation(line: 263, column: 38, scope: !656)
!666 = !DILocalVariable(name: "m_vec_limbs", scope: !656, file: !68, line: 263, type: !324)
!667 = !DILocalVariable(name: "_out", scope: !656, file: !68, line: 264, type: !61)
!668 = !DILocalVariable(name: "tmp", scope: !656, file: !68, line: 265, type: !669)
!669 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 256, elements: !22)
!670 = !DILocation(line: 265, column: 14, scope: !656)
!671 = !DILocalVariable(name: "i", scope: !672, file: !68, line: 266, type: !86)
!672 = distinct !DILexicalBlock(scope: !656, file: !68, line: 266, column: 5)
!673 = !DILocation(line: 0, scope: !672)
!674 = !DILocation(line: 266, column: 10, scope: !672)
!675 = !DILocation(line: 266, column: 28, scope: !676)
!676 = distinct !DILexicalBlock(scope: !672, file: !68, line: 266, column: 5)
!677 = !DILocation(line: 266, column: 5, scope: !672)
!678 = !DILocation(line: 266, scope: !672)
!679 = !DILocation(line: 268, column: 27, scope: !680)
!680 = distinct !DILexicalBlock(scope: !676, file: !68, line: 267, column: 5)
!681 = !DILocation(line: 268, column: 29, scope: !680)
!682 = !DILocation(line: 268, column: 24, scope: !680)
!683 = !DILocation(line: 268, column: 34, scope: !680)
!684 = !DILocation(line: 268, column: 9, scope: !680)
!685 = !DILocation(line: 269, column: 24, scope: !680)
!686 = !DILocation(line: 269, column: 36, scope: !680)
!687 = !DILocation(line: 269, column: 21, scope: !680)
!688 = !DILocation(line: 269, column: 71, scope: !680)
!689 = !DILocation(line: 269, column: 9, scope: !680)
!690 = !DILocation(line: 266, column: 5, scope: !676)
!691 = distinct !{!691, !677, !692, !388}
!692 = !DILocation(line: 270, column: 5, scope: !672)
!693 = !DILocation(line: 271, column: 1, scope: !656)
!694 = distinct !DISubprogram(name: "pqmayo_MAYO_2_ref_mayo_expand_sk", scope: !68, file: !68, line: 310, type: !695, scopeLine: 311, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!695 = !DISubroutineType(types: !696)
!696 = !{!86, !264, !90, !697}
!697 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !698, size: 32)
!698 = !DIDerivedType(tag: DW_TAG_typedef, name: "sk_t", file: !79, line: 294, baseType: !699)
!699 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sk_t", file: !79, line: 291, size: 819712, elements: !700)
!700 = !{!701, !702}
!701 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !699, file: !79, line: 292, baseType: !170, size: 811008)
!702 = !DIDerivedType(tag: DW_TAG_member, name: "O", scope: !699, file: !79, line: 293, baseType: !174, size: 8704, offset: 811008)
!703 = !DILocalVariable(name: "p", arg: 1, scope: !694, file: !68, line: 310, type: !264)
!704 = !DILocation(line: 0, scope: !694)
!705 = !DILocalVariable(name: "csk", arg: 2, scope: !694, file: !68, line: 310, type: !90)
!706 = !DILocalVariable(name: "sk", arg: 3, scope: !694, file: !68, line: 311, type: !697)
!707 = !DILocalVariable(name: "ret", scope: !694, file: !68, line: 312, type: !86)
!708 = !DILocalVariable(name: "S", scope: !694, file: !68, line: 313, type: !309)
!709 = !DILocation(line: 313, column: 19, scope: !694)
!710 = !DILocalVariable(name: "P", scope: !694, file: !68, line: 314, type: !52)
!711 = !DILocation(line: 315, column: 28, scope: !694)
!712 = !DILocalVariable(name: "O", scope: !694, file: !68, line: 315, type: !61)
!713 = !DILocalVariable(name: "param_o", scope: !694, file: !68, line: 317, type: !324)
!714 = !DILocalVariable(name: "param_v", scope: !694, file: !68, line: 318, type: !324)
!715 = !DILocalVariable(name: "param_O_bytes", scope: !694, file: !68, line: 319, type: !324)
!716 = !DILocalVariable(name: "param_pk_seed_bytes", scope: !694, file: !68, line: 320, type: !324)
!717 = !DILocalVariable(name: "param_sk_seed_bytes", scope: !694, file: !68, line: 321, type: !324)
!718 = !DILocalVariable(name: "seed_sk", scope: !694, file: !68, line: 323, type: !90)
!719 = !DILocalVariable(name: "seed_pk", scope: !694, file: !68, line: 324, type: !61)
!720 = !DILocation(line: 326, column: 5, scope: !694)
!721 = !DILocation(line: 328, column: 14, scope: !694)
!722 = !DILocation(line: 328, column: 5, scope: !694)
!723 = !DILocation(line: 334, column: 5, scope: !694)
!724 = !DILocation(line: 341, column: 22, scope: !694)
!725 = !DILocalVariable(name: "P2", scope: !694, file: !68, line: 341, type: !52)
!726 = !DILocalVariable(name: "P1", scope: !694, file: !68, line: 343, type: !52)
!727 = !DILocalVariable(name: "L", scope: !694, file: !68, line: 346, type: !52)
!728 = !DILocation(line: 347, column: 5, scope: !694)
!729 = !DILocation(line: 355, column: 5, scope: !694)
!730 = !DILocation(line: 356, column: 5, scope: !694)
!731 = distinct !DISubprogram(name: "P1P1t_times_O", scope: !408, file: !408, line: 218, type: !459, scopeLine: 218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!732 = !DILocalVariable(name: "p", arg: 1, scope: !731, file: !408, line: 218, type: !264)
!733 = !DILocation(line: 0, scope: !731)
!734 = !DILocalVariable(name: "P1", arg: 2, scope: !731, file: !408, line: 218, type: !411)
!735 = !DILocalVariable(name: "O", arg: 3, scope: !731, file: !408, line: 218, type: !90)
!736 = !DILocalVariable(name: "acc", arg: 4, scope: !731, file: !408, line: 218, type: !52)
!737 = !DILocalVariable(name: "param_o", scope: !731, file: !408, line: 222, type: !324)
!738 = !DILocalVariable(name: "param_v", scope: !731, file: !408, line: 223, type: !324)
!739 = !DILocalVariable(name: "m_vec_limbs", scope: !731, file: !408, line: 224, type: !324)
!740 = !DILocalVariable(name: "bs_mat_entries_used", scope: !731, file: !408, line: 226, type: !86)
!741 = !DILocalVariable(name: "r", scope: !742, file: !408, line: 227, type: !86)
!742 = distinct !DILexicalBlock(scope: !731, file: !408, line: 227, column: 5)
!743 = !DILocation(line: 0, scope: !742)
!744 = !DILocation(line: 227, column: 10, scope: !742)
!745 = !DILocation(line: 226, column: 9, scope: !731)
!746 = !DILocation(line: 227, scope: !742)
!747 = !DILocation(line: 227, column: 23, scope: !748)
!748 = distinct !DILexicalBlock(scope: !742, file: !408, line: 227, column: 5)
!749 = !DILocation(line: 227, column: 5, scope: !742)
!750 = !DILocation(line: 228, column: 9, scope: !751)
!751 = distinct !DILexicalBlock(scope: !752, file: !408, line: 228, column: 9)
!752 = distinct !DILexicalBlock(scope: !748, file: !408, line: 227, column: 39)
!753 = !DILocation(line: 228, scope: !751)
!754 = !DILocalVariable(name: "c", scope: !751, file: !408, line: 228, type: !86)
!755 = !DILocation(line: 0, scope: !751)
!756 = !DILocation(line: 228, column: 27, scope: !757)
!757 = distinct !DILexicalBlock(scope: !751, file: !408, line: 228, column: 9)
!758 = !DILocation(line: 229, column: 17, scope: !759)
!759 = distinct !DILexicalBlock(scope: !760, file: !408, line: 229, column: 16)
!760 = distinct !DILexicalBlock(scope: !757, file: !408, line: 228, column: 43)
!761 = !DILocation(line: 234, column: 47, scope: !762)
!762 = distinct !DILexicalBlock(scope: !763, file: !408, line: 233, column: 50)
!763 = distinct !DILexicalBlock(scope: !764, file: !408, line: 233, column: 13)
!764 = distinct !DILexicalBlock(scope: !760, file: !408, line: 233, column: 13)
!765 = !DILocation(line: 234, column: 88, scope: !762)
!766 = !DILocation(line: 234, column: 84, scope: !762)
!767 = !DILocation(line: 233, column: 13, scope: !764)
!768 = !DILocation(line: 233, scope: !764)
!769 = !DILocalVariable(name: "k", scope: !764, file: !408, line: 233, type: !86)
!770 = !DILocation(line: 0, scope: !764)
!771 = !DILocation(line: 234, column: 127, scope: !762)
!772 = !DILocation(line: 234, column: 137, scope: !762)
!773 = !DILocation(line: 234, column: 108, scope: !762)
!774 = !DILocation(line: 234, column: 17, scope: !762)
!775 = !DILocation(line: 235, column: 47, scope: !762)
!776 = !DILocation(line: 235, column: 88, scope: !762)
!777 = !DILocation(line: 235, column: 84, scope: !762)
!778 = !DILocation(line: 235, column: 127, scope: !762)
!779 = !DILocation(line: 235, column: 137, scope: !762)
!780 = !DILocation(line: 235, column: 108, scope: !762)
!781 = !DILocation(line: 235, column: 17, scope: !762)
!782 = !DILocation(line: 233, column: 44, scope: !763)
!783 = !DILocation(line: 233, column: 31, scope: !763)
!784 = !DILocation(line: 233, column: 13, scope: !763)
!785 = distinct !{!785, !767, !786, !388}
!786 = !DILocation(line: 236, column: 13, scope: !764)
!787 = !DILocation(line: 0, scope: !760)
!788 = !DILocation(line: 228, column: 39, scope: !757)
!789 = !DILocation(line: 228, column: 9, scope: !757)
!790 = distinct !{!790, !750, !791, !388}
!791 = !DILocation(line: 238, column: 9, scope: !751)
!792 = !DILocation(line: 227, column: 35, scope: !748)
!793 = !DILocation(line: 227, column: 5, scope: !748)
!794 = distinct !{!794, !749, !795, !388}
!795 = !DILocation(line: 239, column: 5, scope: !742)
!796 = !DILocation(line: 240, column: 1, scope: !731)
!797 = distinct !DISubprogram(name: "pqmayo_MAYO_2_ref_mayo_sign_signature", scope: !68, file: !68, line: 359, type: !798, scopeLine: 361, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!798 = !DISubroutineType(types: !799)
!799 = !{!86, !264, !61, !800, !90, !58, !90}
!800 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 32)
!801 = !DILocalVariable(name: "p", arg: 1, scope: !797, file: !68, line: 359, type: !264)
!802 = !DILocation(line: 0, scope: !797)
!803 = !DILocalVariable(name: "sig", arg: 2, scope: !797, file: !68, line: 359, type: !61)
!804 = !DILocalVariable(name: "siglen", arg: 3, scope: !797, file: !68, line: 360, type: !800)
!805 = !DILocalVariable(name: "m", arg: 4, scope: !797, file: !68, line: 360, type: !90)
!806 = !DILocalVariable(name: "mlen", arg: 5, scope: !797, file: !68, line: 361, type: !58)
!807 = !DILocalVariable(name: "csk", arg: 6, scope: !797, file: !68, line: 361, type: !90)
!808 = !DILocalVariable(name: "ret", scope: !797, file: !68, line: 362, type: !86)
!809 = !DILocalVariable(name: "tenc", scope: !797, file: !68, line: 363, type: !184)
!810 = !DILocation(line: 363, column: 19, scope: !797)
!811 = !DILocalVariable(name: "t", scope: !797, file: !68, line: 363, type: !812)
!812 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 512, elements: !813)
!813 = !{!814}
!814 = !DISubrange(count: 64)
!815 = !DILocation(line: 363, column: 38, scope: !797)
!816 = !DILocalVariable(name: "y", scope: !797, file: !68, line: 364, type: !812)
!817 = !DILocation(line: 364, column: 19, scope: !797)
!818 = !DILocalVariable(name: "salt", scope: !797, file: !68, line: 365, type: !819)
!819 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 192, elements: !820)
!820 = !{!821}
!821 = !DISubrange(count: 24)
!822 = !DILocation(line: 365, column: 19, scope: !797)
!823 = !DILocalVariable(name: "V", scope: !797, file: !68, line: 366, type: !824)
!824 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 1296, elements: !825)
!825 = !{!826}
!826 = !DISubrange(count: 162)
!827 = !DILocation(line: 366, column: 19, scope: !797)
!828 = !DILocalVariable(name: "Vdec", scope: !797, file: !68, line: 366, type: !829)
!829 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 2048, elements: !830)
!830 = !{!831}
!831 = !DISubrange(count: 256)
!832 = !DILocation(line: 366, column: 57, scope: !797)
!833 = !DILocalVariable(name: "A", scope: !797, file: !68, line: 367, type: !834)
!834 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 35328, elements: !835)
!835 = !{!836}
!836 = !DISubrange(count: 4416)
!837 = !DILocation(line: 367, column: 19, scope: !797)
!838 = !DILocalVariable(name: "x", scope: !797, file: !68, line: 368, type: !839)
!839 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 2592, elements: !840)
!840 = !{!841}
!841 = !DISubrange(count: 324)
!842 = !DILocation(line: 368, column: 19, scope: !797)
!843 = !DILocalVariable(name: "r", scope: !797, file: !68, line: 369, type: !844)
!844 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 552, elements: !845)
!845 = !{!846}
!846 = !DISubrange(count: 69)
!847 = !DILocation(line: 369, column: 19, scope: !797)
!848 = !DILocalVariable(name: "s", scope: !797, file: !68, line: 370, type: !839)
!849 = !DILocation(line: 370, column: 19, scope: !797)
!850 = !DILocalVariable(name: "sk", scope: !797, file: !68, line: 372, type: !698, align: 256)
!851 = !DILocation(line: 372, column: 22, scope: !797)
!852 = !DILocalVariable(name: "Ox", scope: !797, file: !68, line: 373, type: !812)
!853 = !DILocation(line: 373, column: 19, scope: !797)
!854 = !DILocalVariable(name: "tmp", scope: !797, file: !68, line: 374, type: !855)
!855 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 648, elements: !856)
!856 = !{!857}
!857 = !DISubrange(count: 81)
!858 = !DILocation(line: 374, column: 19, scope: !797)
!859 = !DILocalVariable(name: "param_m", scope: !797, file: !68, line: 378, type: !324)
!860 = !DILocalVariable(name: "param_n", scope: !797, file: !68, line: 379, type: !324)
!861 = !DILocalVariable(name: "param_o", scope: !797, file: !68, line: 380, type: !324)
!862 = !DILocalVariable(name: "param_k", scope: !797, file: !68, line: 381, type: !324)
!863 = !DILocalVariable(name: "param_v", scope: !797, file: !68, line: 382, type: !324)
!864 = !DILocalVariable(name: "param_m_bytes", scope: !797, file: !68, line: 383, type: !324)
!865 = !DILocalVariable(name: "param_v_bytes", scope: !797, file: !68, line: 384, type: !324)
!866 = !DILocalVariable(name: "param_r_bytes", scope: !797, file: !68, line: 385, type: !324)
!867 = !DILocalVariable(name: "param_sig_bytes", scope: !797, file: !68, line: 386, type: !324)
!868 = !DILocalVariable(name: "param_A_cols", scope: !797, file: !68, line: 387, type: !324)
!869 = !DILocalVariable(name: "param_digest_bytes", scope: !797, file: !68, line: 388, type: !324)
!870 = !DILocalVariable(name: "param_sk_seed_bytes", scope: !797, file: !68, line: 389, type: !324)
!871 = !DILocalVariable(name: "param_salt_bytes", scope: !797, file: !68, line: 390, type: !324)
!872 = !DILocation(line: 392, column: 11, scope: !797)
!873 = !DILocation(line: 393, column: 13, scope: !874)
!874 = distinct !DILexicalBlock(scope: !797, file: !68, line: 393, column: 9)
!875 = !DILocalVariable(name: "seed_sk", scope: !797, file: !68, line: 371, type: !90)
!876 = !DILocation(line: 401, column: 5, scope: !797)
!877 = !DILocalVariable(name: "P1", scope: !797, file: !68, line: 403, type: !52)
!878 = !DILocation(line: 404, column: 23, scope: !797)
!879 = !DILocalVariable(name: "L", scope: !797, file: !68, line: 404, type: !52)
!880 = !DILocalVariable(name: "Mtmp", scope: !797, file: !68, line: 405, type: !881)
!881 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 17408, elements: !882)
!882 = !{!883}
!883 = !DISubrange(count: 272)
!884 = !DILocation(line: 405, column: 14, scope: !797)
!885 = !DILocation(line: 420, column: 25, scope: !886)
!886 = distinct !DILexicalBlock(scope: !797, file: !68, line: 420, column: 9)
!887 = !DILocation(line: 420, column: 9, scope: !886)
!888 = !DILocation(line: 420, column: 65, scope: !886)
!889 = !DILocation(line: 427, column: 37, scope: !797)
!890 = !DILocation(line: 427, column: 5, scope: !797)
!891 = !DILocation(line: 429, column: 5, scope: !797)
!892 = !DILocation(line: 437, column: 16, scope: !797)
!893 = !DILocation(line: 437, column: 5, scope: !797)
!894 = !DILocation(line: 438, column: 59, scope: !797)
!895 = !DILocalVariable(name: "ctrbyte", scope: !797, file: !68, line: 375, type: !61)
!896 = !DILocation(line: 440, column: 5, scope: !797)
!897 = !DILocation(line: 442, column: 5, scope: !797)
!898 = !DILocalVariable(name: "ctr", scope: !899, file: !68, line: 444, type: !86)
!899 = distinct !DILexicalBlock(scope: !797, file: !68, line: 444, column: 5)
!900 = !DILocation(line: 0, scope: !899)
!901 = !DILocation(line: 466, column: 18, scope: !902)
!902 = distinct !DILexicalBlock(scope: !903, file: !68, line: 444, column: 42)
!903 = distinct !DILexicalBlock(scope: !899, file: !68, line: 444, column: 5)
!904 = !DILocation(line: 444, column: 10, scope: !899)
!905 = !DILocation(line: 444, scope: !899)
!906 = !DILocation(line: 444, column: 27, scope: !903)
!907 = !DILocation(line: 444, column: 5, scope: !899)
!908 = !DILocation(line: 445, column: 20, scope: !902)
!909 = !DILocation(line: 445, column: 18, scope: !902)
!910 = !DILocation(line: 447, column: 9, scope: !902)
!911 = !DILocalVariable(name: "i", scope: !912, file: !68, line: 451, type: !86)
!912 = distinct !DILexicalBlock(scope: !902, file: !68, line: 451, column: 9)
!913 = !DILocation(line: 0, scope: !912)
!914 = !DILocation(line: 452, column: 13, scope: !915)
!915 = distinct !DILexicalBlock(scope: !916, file: !68, line: 451, column: 48)
!916 = distinct !DILexicalBlock(scope: !912, file: !68, line: 451, column: 9)
!917 = !DILocation(line: 452, column: 22, scope: !915)
!918 = !DILocation(line: 452, column: 48, scope: !915)
!919 = !DILocation(line: 456, column: 9, scope: !902)
!920 = !DILocation(line: 458, column: 9, scope: !902)
!921 = !DILocation(line: 459, column: 9, scope: !902)
!922 = !DILocalVariable(name: "i", scope: !923, file: !68, line: 461, type: !86)
!923 = distinct !DILexicalBlock(scope: !902, file: !68, line: 461, column: 9)
!924 = !DILocation(line: 0, scope: !923)
!925 = !DILocation(line: 461, column: 14, scope: !923)
!926 = !DILocation(line: 461, scope: !923)
!927 = !DILocation(line: 463, column: 20, scope: !928)
!928 = distinct !DILexicalBlock(scope: !929, file: !68, line: 462, column: 9)
!929 = distinct !DILexicalBlock(scope: !923, file: !68, line: 461, column: 9)
!930 = !DILocation(line: 463, column: 43, scope: !928)
!931 = !DILocation(line: 463, column: 13, scope: !928)
!932 = !DILocation(line: 463, column: 48, scope: !928)
!933 = !DILocation(line: 461, column: 39, scope: !929)
!934 = !DILocation(line: 461, column: 27, scope: !929)
!935 = !DILocation(line: 461, column: 9, scope: !923)
!936 = !DILocation(line: 461, column: 9, scope: !929)
!937 = distinct !{!937, !935, !938, !388}
!938 = !DILocation(line: 464, column: 9, scope: !923)
!939 = !DILocation(line: 466, column: 9, scope: !902)
!940 = !DILocation(line: 470, column: 13, scope: !941)
!941 = distinct !DILexicalBlock(scope: !902, file: !68, line: 470, column: 13)
!942 = !DILocation(line: 473, column: 13, scope: !943)
!943 = distinct !DILexicalBlock(scope: !941, file: !68, line: 472, column: 16)
!944 = !DILocation(line: 474, column: 13, scope: !943)
!945 = !DILocation(line: 444, column: 35, scope: !903)
!946 = !DILocation(line: 444, column: 5, scope: !903)
!947 = distinct !{!947, !907, !948, !388}
!948 = !DILocation(line: 476, column: 5, scope: !899)
!949 = !DILocalVariable(name: "i", scope: !950, file: !68, line: 478, type: !86)
!950 = distinct !DILexicalBlock(scope: !797, file: !68, line: 478, column: 5)
!951 = !DILocation(line: 0, scope: !950)
!952 = !DILocation(line: 478, column: 10, scope: !950)
!953 = !DILocation(line: 478, scope: !950)
!954 = !DILocation(line: 478, column: 23, scope: !955)
!955 = distinct !DILexicalBlock(scope: !950, file: !68, line: 478, column: 5)
!956 = !DILocation(line: 478, column: 5, scope: !950)
!957 = !DILocation(line: 479, column: 23, scope: !958)
!958 = distinct !DILexicalBlock(scope: !955, file: !68, line: 478, column: 44)
!959 = !DILocation(line: 479, column: 19, scope: !958)
!960 = !DILocalVariable(name: "vi", scope: !797, file: !68, line: 376, type: !61)
!961 = !DILocation(line: 480, column: 20, scope: !958)
!962 = !DILocation(line: 480, column: 29, scope: !958)
!963 = !DILocation(line: 480, column: 25, scope: !958)
!964 = !DILocation(line: 480, column: 9, scope: !958)
!965 = !DILocation(line: 481, column: 31, scope: !958)
!966 = !DILocation(line: 481, column: 27, scope: !958)
!967 = !DILocation(line: 481, column: 9, scope: !958)
!968 = !DILocation(line: 482, column: 22, scope: !958)
!969 = !DILocation(line: 482, column: 18, scope: !958)
!970 = !DILocation(line: 482, column: 32, scope: !958)
!971 = !DILocation(line: 482, column: 61, scope: !958)
!972 = !DILocation(line: 482, column: 57, scope: !958)
!973 = !DILocation(line: 482, column: 9, scope: !958)
!974 = !DILocation(line: 478, column: 39, scope: !955)
!975 = !DILocation(line: 478, column: 5, scope: !955)
!976 = distinct !{!976, !956, !977, !388}
!977 = !DILocation(line: 483, column: 5, scope: !950)
!978 = !DILocation(line: 484, column: 5, scope: !797)
!979 = !DILocation(line: 486, column: 34, scope: !797)
!980 = !DILocation(line: 486, column: 5, scope: !797)
!981 = !DILocation(line: 487, column: 13, scope: !797)
!982 = !DILocation(line: 487, column: 5, scope: !797)
!983 = !DILabel(scope: !797, name: "err", file: !68, line: 489)
!984 = !DILocation(line: 489, column: 1, scope: !797)
!985 = !DILocation(line: 490, column: 5, scope: !797)
!986 = !DILocation(line: 491, column: 5, scope: !797)
!987 = !DILocation(line: 492, column: 5, scope: !797)
!988 = !DILocation(line: 493, column: 5, scope: !797)
!989 = !DILocation(line: 494, column: 26, scope: !797)
!990 = !DILocation(line: 494, column: 5, scope: !797)
!991 = !DILocation(line: 495, column: 5, scope: !797)
!992 = !DILocation(line: 496, column: 5, scope: !797)
!993 = !DILocation(line: 497, column: 5, scope: !797)
!994 = !DILocation(line: 498, column: 5, scope: !797)
!995 = !DILocation(line: 499, column: 5, scope: !797)
!996 = distinct !DISubprogram(name: "compute_M_and_VPV", scope: !408, file: !408, line: 244, type: !997, scopeLine: 244, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!997 = !DISubroutineType(types: !998)
!998 = !{null, !264, !90, !411, !411, !52, !52}
!999 = !DILocalVariable(name: "p", arg: 1, scope: !996, file: !408, line: 244, type: !264)
!1000 = !DILocation(line: 0, scope: !996)
!1001 = !DILocalVariable(name: "Vdec", arg: 2, scope: !996, file: !408, line: 244, type: !90)
!1002 = !DILocalVariable(name: "L", arg: 3, scope: !996, file: !408, line: 244, type: !411)
!1003 = !DILocalVariable(name: "P1", arg: 4, scope: !996, file: !408, line: 244, type: !411)
!1004 = !DILocalVariable(name: "VL", arg: 5, scope: !996, file: !408, line: 244, type: !52)
!1005 = !DILocalVariable(name: "VP1V", arg: 6, scope: !996, file: !408, line: 244, type: !52)
!1006 = !DILocalVariable(name: "param_k", scope: !996, file: !408, line: 246, type: !324)
!1007 = !DILocalVariable(name: "param_v", scope: !996, file: !408, line: 247, type: !324)
!1008 = !DILocalVariable(name: "param_o", scope: !996, file: !408, line: 248, type: !324)
!1009 = !DILocation(line: 251, column: 5, scope: !996)
!1010 = !DILocalVariable(name: "Pv", scope: !996, file: !408, line: 254, type: !1011)
!1011 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 65536, elements: !1012)
!1012 = !{!1013}
!1013 = !DISubrange(count: 1024)
!1014 = !DILocation(line: 254, column: 14, scope: !996)
!1015 = !DILocation(line: 255, column: 5, scope: !996)
!1016 = !DILocation(line: 256, column: 5, scope: !996)
!1017 = !DILocation(line: 257, column: 1, scope: !996)
!1018 = distinct !DISubprogram(name: "compute_rhs", scope: !68, file: !68, line: 43, type: !1019, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1019 = !DISubroutineType(types: !1020)
!1020 = !{null, !264, !52, !90, !61}
!1021 = !DILocalVariable(name: "p", arg: 1, scope: !1018, file: !68, line: 43, type: !264)
!1022 = !DILocation(line: 0, scope: !1018)
!1023 = !DILocalVariable(name: "vPv", arg: 2, scope: !1018, file: !68, line: 43, type: !52)
!1024 = !DILocalVariable(name: "t", arg: 3, scope: !1018, file: !68, line: 43, type: !90)
!1025 = !DILocalVariable(name: "y", arg: 4, scope: !1018, file: !68, line: 43, type: !61)
!1026 = !DILocalVariable(name: "top_pos", scope: !1018, file: !68, line: 48, type: !1027)
!1027 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !58)
!1028 = !DILocalVariable(name: "m_vec_limbs", scope: !1018, file: !68, line: 49, type: !1027)
!1029 = !DILocalVariable(name: "temp", scope: !1018, file: !68, line: 62, type: !669)
!1030 = !DILocation(line: 62, column: 14, scope: !1018)
!1031 = !DILocalVariable(name: "temp_bytes", scope: !1018, file: !68, line: 63, type: !61)
!1032 = !DILocalVariable(name: "i", scope: !1033, file: !68, line: 64, type: !86)
!1033 = distinct !DILexicalBlock(scope: !1018, file: !68, line: 64, column: 5)
!1034 = !DILocation(line: 0, scope: !1033)
!1035 = !DILocation(line: 64, column: 10, scope: !1033)
!1036 = !DILocation(line: 64, scope: !1033)
!1037 = !DILocation(line: 64, column: 36, scope: !1038)
!1038 = distinct !DILexicalBlock(scope: !1033, file: !68, line: 64, column: 5)
!1039 = !DILocation(line: 64, column: 5, scope: !1033)
!1040 = !DILocation(line: 65, scope: !1041)
!1041 = distinct !DILexicalBlock(scope: !1042, file: !68, line: 65, column: 9)
!1042 = distinct !DILexicalBlock(scope: !1038, file: !68, line: 64, column: 48)
!1043 = !DILocalVariable(name: "j", scope: !1041, file: !68, line: 65, type: !86)
!1044 = !DILocation(line: 0, scope: !1041)
!1045 = !DILocation(line: 65, column: 27, scope: !1046)
!1046 = distinct !DILexicalBlock(scope: !1041, file: !68, line: 65, column: 9)
!1047 = !DILocation(line: 65, column: 9, scope: !1041)
!1048 = !DILocation(line: 67, column: 34, scope: !1049)
!1049 = distinct !DILexicalBlock(scope: !1046, file: !68, line: 65, column: 46)
!1050 = !DILocation(line: 67, column: 54, scope: !1049)
!1051 = !DILocalVariable(name: "top", scope: !1049, file: !68, line: 67, type: !51)
!1052 = !DILocation(line: 0, scope: !1049)
!1053 = !DILocation(line: 68, column: 13, scope: !1049)
!1054 = !DILocation(line: 68, column: 33, scope: !1049)
!1055 = !DILocalVariable(name: "k", scope: !1056, file: !68, line: 69, type: !86)
!1056 = distinct !DILexicalBlock(scope: !1049, file: !68, line: 69, column: 13)
!1057 = !DILocation(line: 0, scope: !1056)
!1058 = !DILocation(line: 70, column: 30, scope: !1059)
!1059 = distinct !DILexicalBlock(scope: !1060, file: !68, line: 69, column: 52)
!1060 = distinct !DILexicalBlock(scope: !1056, file: !68, line: 69, column: 13)
!1061 = !DILocation(line: 70, column: 38, scope: !1059)
!1062 = !DILocation(line: 70, column: 17, scope: !1059)
!1063 = !DILocation(line: 70, column: 27, scope: !1059)
!1064 = !DILocation(line: 71, column: 17, scope: !1059)
!1065 = !DILocation(line: 71, column: 25, scope: !1059)
!1066 = !DILocation(line: 67, column: 33, scope: !1049)
!1067 = !DILocalVariable(name: "jj", scope: !1068, file: !68, line: 74, type: !86)
!1068 = distinct !DILexicalBlock(scope: !1049, file: !68, line: 74, column: 13)
!1069 = !DILocation(line: 0, scope: !1068)
!1070 = !DILocation(line: 79, column: 41, scope: !1071)
!1071 = distinct !DILexicalBlock(scope: !1072, file: !68, line: 75, column: 30)
!1072 = distinct !DILexicalBlock(scope: !1073, file: !68, line: 75, column: 20)
!1073 = distinct !DILexicalBlock(scope: !1074, file: !68, line: 74, column: 53)
!1074 = distinct !DILexicalBlock(scope: !1068, file: !68, line: 74, column: 13)
!1075 = !DILocation(line: 79, column: 38, scope: !1071)
!1076 = !DILocation(line: 86, column: 41, scope: !1077)
!1077 = distinct !DILexicalBlock(scope: !1072, file: !68, line: 82, column: 22)
!1078 = !DILocation(line: 86, column: 73, scope: !1077)
!1079 = !DILocation(line: 86, column: 38, scope: !1077)
!1080 = !DILocation(line: 79, column: 21, scope: !1071)
!1081 = !DILocation(line: 86, column: 21, scope: !1077)
!1082 = !DILocalVariable(name: "k", scope: !1083, file: !68, line: 92, type: !58)
!1083 = distinct !DILexicalBlock(scope: !1049, file: !68, line: 92, column: 13)
!1084 = !DILocation(line: 0, scope: !1083)
!1085 = !DILocation(line: 93, column: 28, scope: !1086)
!1086 = distinct !DILexicalBlock(scope: !1087, file: !68, line: 92, column: 51)
!1087 = distinct !DILexicalBlock(scope: !1083, file: !68, line: 92, column: 13)
!1088 = !DILocation(line: 93, column: 78, scope: !1086)
!1089 = !DILocation(line: 93, column: 83, scope: !1086)
!1090 = !DILocation(line: 93, column: 82, scope: !1086)
!1091 = !DILocation(line: 93, column: 73, scope: !1086)
!1092 = !DILocation(line: 93, column: 25, scope: !1086)
!1093 = !DILocation(line: 93, column: 54, scope: !1086)
!1094 = !DILocation(line: 93, column: 68, scope: !1086)
!1095 = !DILocation(line: 93, column: 109, scope: !1086)
!1096 = !DILocation(line: 93, column: 123, scope: !1086)
!1097 = !DILocation(line: 93, column: 17, scope: !1086)
!1098 = !DILocation(line: 65, column: 42, scope: !1046)
!1099 = !DILocation(line: 65, column: 9, scope: !1046)
!1100 = distinct !{!1100, !1047, !1101, !388}
!1101 = !DILocation(line: 95, column: 9, scope: !1041)
!1102 = !DILocation(line: 64, column: 44, scope: !1038)
!1103 = !DILocation(line: 64, column: 5, scope: !1038)
!1104 = distinct !{!1104, !1039, !1105, !388}
!1105 = !DILocation(line: 96, column: 5, scope: !1033)
!1106 = !DILocation(line: 99, scope: !1107)
!1107 = distinct !DILexicalBlock(scope: !1018, file: !68, line: 99, column: 5)
!1108 = !DILocalVariable(name: "i", scope: !1107, file: !68, line: 99, type: !86)
!1109 = !DILocation(line: 0, scope: !1107)
!1110 = !DILocation(line: 105, column: 18, scope: !1111)
!1111 = distinct !DILexicalBlock(scope: !1112, file: !68, line: 100, column: 5)
!1112 = distinct !DILexicalBlock(scope: !1107, file: !68, line: 99, column: 5)
!1113 = !DILocation(line: 105, column: 40, scope: !1111)
!1114 = !DILocation(line: 105, column: 28, scope: !1111)
!1115 = !DILocation(line: 105, column: 44, scope: !1111)
!1116 = !DILocation(line: 105, column: 25, scope: !1111)
!1117 = !DILocation(line: 105, column: 9, scope: !1111)
!1118 = !DILocation(line: 105, column: 16, scope: !1111)
!1119 = !DILocation(line: 106, column: 21, scope: !1111)
!1120 = !DILocation(line: 106, column: 18, scope: !1111)
!1121 = !DILocation(line: 106, column: 44, scope: !1111)
!1122 = !DILocation(line: 106, column: 25, scope: !1111)
!1123 = !DILocation(line: 106, column: 12, scope: !1111)
!1124 = !DILocation(line: 106, column: 9, scope: !1111)
!1125 = !DILocation(line: 106, column: 16, scope: !1111)
!1126 = !DILocation(line: 99, column: 38, scope: !1112)
!1127 = !DILocation(line: 99, column: 23, scope: !1112)
!1128 = !DILocation(line: 99, column: 5, scope: !1107)
!1129 = !DILocation(line: 99, column: 5, scope: !1112)
!1130 = distinct !{!1130, !1128, !1131, !388}
!1131 = !DILocation(line: 108, column: 5, scope: !1107)
!1132 = !DILocation(line: 109, column: 1, scope: !1018)
!1133 = distinct !DISubprogram(name: "compute_A", scope: !68, file: !68, line: 154, type: !1134, scopeLine: 154, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1134 = !DISubroutineType(types: !1135)
!1135 = !{null, !264, !52, !61}
!1136 = !DILocalVariable(name: "p", arg: 1, scope: !1133, file: !68, line: 154, type: !264)
!1137 = !DILocation(line: 0, scope: !1133)
!1138 = !DILocalVariable(name: "VtL", arg: 2, scope: !1133, file: !68, line: 154, type: !52)
!1139 = !DILocalVariable(name: "A_out", arg: 3, scope: !1133, file: !68, line: 154, type: !61)
!1140 = !DILocalVariable(name: "bits_to_shift", scope: !1133, file: !68, line: 159, type: !86)
!1141 = !DILocalVariable(name: "words_to_shift", scope: !1133, file: !68, line: 160, type: !86)
!1142 = !DILocalVariable(name: "m_vec_limbs", scope: !1133, file: !68, line: 161, type: !324)
!1143 = !DILocalVariable(name: "A", scope: !1133, file: !68, line: 162, type: !1144)
!1144 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 40960, elements: !1145)
!1145 = !{!1146}
!1146 = !DISubrange(count: 640)
!1147 = !DILocation(line: 162, column: 14, scope: !1133)
!1148 = !DILocalVariable(name: "A_width", scope: !1133, file: !68, line: 163, type: !58)
!1149 = !DILocalVariable(name: "i", scope: !1150, file: !68, line: 177, type: !86)
!1150 = distinct !DILexicalBlock(scope: !1133, file: !68, line: 177, column: 5)
!1151 = !DILocation(line: 0, scope: !1150)
!1152 = !DILocation(line: 177, column: 10, scope: !1150)
!1153 = !DILocation(line: 177, scope: !1150)
!1154 = !DILocation(line: 160, column: 9, scope: !1133)
!1155 = !DILocation(line: 159, column: 9, scope: !1133)
!1156 = !DILocation(line: 177, column: 23, scope: !1157)
!1157 = distinct !DILexicalBlock(scope: !1150, file: !68, line: 177, column: 5)
!1158 = !DILocation(line: 177, column: 5, scope: !1150)
!1159 = !DILocation(line: 178, scope: !1160)
!1160 = distinct !DILexicalBlock(scope: !1161, file: !68, line: 178, column: 9)
!1161 = distinct !DILexicalBlock(scope: !1157, file: !68, line: 177, column: 47)
!1162 = !DILocalVariable(name: "j", scope: !1160, file: !68, line: 178, type: !86)
!1163 = !DILocation(line: 0, scope: !1160)
!1164 = !DILocation(line: 178, column: 40, scope: !1165)
!1165 = distinct !DILexicalBlock(scope: !1160, file: !68, line: 178, column: 9)
!1166 = !DILocation(line: 178, column: 9, scope: !1160)
!1167 = !DILocation(line: 180, column: 22, scope: !1168)
!1168 = distinct !DILexicalBlock(scope: !1165, file: !68, line: 178, column: 51)
!1169 = !DILocalVariable(name: "Mj", scope: !1133, file: !68, line: 164, type: !411)
!1170 = !DILocalVariable(name: "c", scope: !1171, file: !68, line: 181, type: !86)
!1171 = distinct !DILexicalBlock(scope: !1168, file: !68, line: 181, column: 13)
!1172 = !DILocation(line: 0, scope: !1171)
!1173 = !DILocation(line: 181, column: 18, scope: !1171)
!1174 = !DILocation(line: 181, scope: !1171)
!1175 = !DILocation(line: 181, column: 31, scope: !1176)
!1176 = distinct !DILexicalBlock(scope: !1171, file: !68, line: 181, column: 13)
!1177 = !DILocation(line: 181, column: 13, scope: !1171)
!1178 = !DILocalVariable(name: "k", scope: !1179, file: !68, line: 182, type: !86)
!1179 = distinct !DILexicalBlock(scope: !1180, file: !68, line: 182, column: 17)
!1180 = distinct !DILexicalBlock(scope: !1176, file: !68, line: 181, column: 50)
!1181 = !DILocation(line: 0, scope: !1179)
!1182 = !DILocation(line: 184, column: 78, scope: !1183)
!1183 = distinct !DILexicalBlock(scope: !1184, file: !68, line: 183, column: 17)
!1184 = distinct !DILexicalBlock(scope: !1179, file: !68, line: 182, column: 17)
!1185 = !DILocation(line: 184, column: 100, scope: !1183)
!1186 = !DILocation(line: 184, column: 35, scope: !1183)
!1187 = !DILocation(line: 184, column: 39, scope: !1183)
!1188 = !DILocation(line: 184, column: 65, scope: !1183)
!1189 = !DILocation(line: 184, column: 43, scope: !1183)
!1190 = !DILocation(line: 184, column: 21, scope: !1183)
!1191 = !DILocation(line: 184, column: 75, scope: !1183)
!1192 = !DILocation(line: 185, column: 38, scope: !1193)
!1193 = distinct !DILexicalBlock(scope: !1183, file: !68, line: 185, column: 24)
!1194 = !DILocation(line: 186, column: 86, scope: !1195)
!1195 = distinct !DILexicalBlock(scope: !1193, file: !68, line: 185, column: 42)
!1196 = !DILocation(line: 186, column: 114, scope: !1195)
!1197 = !DILocation(line: 186, column: 108, scope: !1195)
!1198 = !DILocation(line: 186, column: 39, scope: !1195)
!1199 = !DILocation(line: 186, column: 43, scope: !1195)
!1200 = !DILocation(line: 186, column: 73, scope: !1195)
!1201 = !DILocation(line: 186, column: 47, scope: !1195)
!1202 = !DILocation(line: 186, column: 25, scope: !1195)
!1203 = !DILocation(line: 186, column: 83, scope: !1195)
!1204 = !DILocation(line: 187, column: 21, scope: !1195)
!1205 = !DILocation(line: 184, column: 86, scope: !1183)
!1206 = !DILocation(line: 184, column: 83, scope: !1183)
!1207 = !DILocation(line: 186, column: 94, scope: !1195)
!1208 = !DILocation(line: 186, column: 91, scope: !1195)
!1209 = !DILocation(line: 181, column: 46, scope: !1176)
!1210 = !DILocation(line: 181, column: 13, scope: !1176)
!1211 = distinct !{!1211, !1177, !1212, !388}
!1212 = !DILocation(line: 189, column: 13, scope: !1171)
!1213 = !DILocation(line: 191, column: 19, scope: !1214)
!1214 = distinct !DILexicalBlock(scope: !1168, file: !68, line: 191, column: 17)
!1215 = !DILocation(line: 192, column: 26, scope: !1216)
!1216 = distinct !DILexicalBlock(scope: !1214, file: !68, line: 191, column: 25)
!1217 = !DILocalVariable(name: "Mi", scope: !1133, file: !68, line: 164, type: !411)
!1218 = !DILocalVariable(name: "c", scope: !1219, file: !68, line: 193, type: !86)
!1219 = distinct !DILexicalBlock(scope: !1216, file: !68, line: 193, column: 17)
!1220 = !DILocation(line: 0, scope: !1219)
!1221 = !DILocation(line: 193, column: 22, scope: !1219)
!1222 = !DILocation(line: 193, scope: !1219)
!1223 = !DILocation(line: 193, column: 35, scope: !1224)
!1224 = distinct !DILexicalBlock(scope: !1219, file: !68, line: 193, column: 17)
!1225 = !DILocation(line: 193, column: 17, scope: !1219)
!1226 = !DILocalVariable(name: "k", scope: !1227, file: !68, line: 194, type: !86)
!1227 = distinct !DILexicalBlock(scope: !1228, file: !68, line: 194, column: 21)
!1228 = distinct !DILexicalBlock(scope: !1224, file: !68, line: 193, column: 54)
!1229 = !DILocation(line: 0, scope: !1227)
!1230 = !DILocation(line: 196, column: 81, scope: !1231)
!1231 = distinct !DILexicalBlock(scope: !1232, file: !68, line: 195, column: 21)
!1232 = distinct !DILexicalBlock(scope: !1227, file: !68, line: 194, column: 21)
!1233 = !DILocation(line: 196, column: 103, scope: !1231)
!1234 = !DILocation(line: 196, column: 38, scope: !1231)
!1235 = !DILocation(line: 196, column: 42, scope: !1231)
!1236 = !DILocation(line: 196, column: 68, scope: !1231)
!1237 = !DILocation(line: 196, column: 46, scope: !1231)
!1238 = !DILocation(line: 196, column: 25, scope: !1231)
!1239 = !DILocation(line: 196, column: 78, scope: !1231)
!1240 = !DILocation(line: 197, column: 42, scope: !1241)
!1241 = distinct !DILexicalBlock(scope: !1231, file: !68, line: 197, column: 28)
!1242 = !DILocation(line: 198, column: 89, scope: !1243)
!1243 = distinct !DILexicalBlock(scope: !1241, file: !68, line: 197, column: 46)
!1244 = !DILocation(line: 198, column: 117, scope: !1243)
!1245 = !DILocation(line: 198, column: 111, scope: !1243)
!1246 = !DILocation(line: 198, column: 42, scope: !1243)
!1247 = !DILocation(line: 198, column: 46, scope: !1243)
!1248 = !DILocation(line: 198, column: 76, scope: !1243)
!1249 = !DILocation(line: 198, column: 50, scope: !1243)
!1250 = !DILocation(line: 198, column: 29, scope: !1243)
!1251 = !DILocation(line: 198, column: 86, scope: !1243)
!1252 = !DILocation(line: 199, column: 25, scope: !1243)
!1253 = !DILocation(line: 196, column: 89, scope: !1231)
!1254 = !DILocation(line: 196, column: 86, scope: !1231)
!1255 = !DILocation(line: 198, column: 97, scope: !1243)
!1256 = !DILocation(line: 198, column: 94, scope: !1243)
!1257 = !DILocation(line: 193, column: 50, scope: !1224)
!1258 = !DILocation(line: 193, column: 17, scope: !1224)
!1259 = distinct !{!1259, !1225, !1260, !388}
!1260 = !DILocation(line: 201, column: 17, scope: !1219)
!1261 = !DILocation(line: 204, column: 27, scope: !1168)
!1262 = !DILocation(line: 205, column: 30, scope: !1263)
!1263 = distinct !DILexicalBlock(scope: !1168, file: !68, line: 205, column: 16)
!1264 = !DILocation(line: 178, column: 46, scope: !1165)
!1265 = !DILocation(line: 178, column: 9, scope: !1165)
!1266 = distinct !{!1266, !1166, !1267, !388}
!1267 = !DILocation(line: 209, column: 9, scope: !1160)
!1268 = !DILocation(line: 177, column: 42, scope: !1157)
!1269 = !DILocation(line: 177, column: 5, scope: !1157)
!1270 = distinct !{!1270, !1158, !1271, !388}
!1271 = !DILocation(line: 210, column: 5, scope: !1150)
!1272 = !DILocation(line: 212, scope: !1273)
!1273 = distinct !DILexicalBlock(scope: !1133, file: !68, line: 212, column: 5)
!1274 = !DILocalVariable(name: "c", scope: !1273, file: !68, line: 212, type: !58)
!1275 = !DILocation(line: 0, scope: !1273)
!1276 = !DILocation(line: 212, column: 26, scope: !1277)
!1277 = distinct !DILexicalBlock(scope: !1273, file: !68, line: 212, column: 5)
!1278 = !DILocation(line: 212, column: 5, scope: !1273)
!1279 = !DILocation(line: 214, column: 35, scope: !1280)
!1280 = distinct !DILexicalBlock(scope: !1277, file: !68, line: 213, column: 5)
!1281 = !DILocation(line: 214, column: 9, scope: !1280)
!1282 = !DILocation(line: 212, column: 91, scope: !1277)
!1283 = !DILocation(line: 212, column: 5, scope: !1277)
!1284 = distinct !{!1284, !1278, !1285, !388}
!1285 = !DILocation(line: 215, column: 5, scope: !1273)
!1286 = !DILocalVariable(name: "tab", scope: !1133, file: !68, line: 217, type: !1287)
!1287 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 128, elements: !1288)
!1288 = !{!1289}
!1289 = !DISubrange(count: 16)
!1290 = !DILocation(line: 217, column: 19, scope: !1133)
!1291 = !DILocalVariable(name: "i", scope: !1292, file: !68, line: 218, type: !58)
!1292 = distinct !DILexicalBlock(scope: !1133, file: !68, line: 218, column: 5)
!1293 = !DILocation(line: 0, scope: !1292)
!1294 = !DILocation(line: 218, column: 10, scope: !1292)
!1295 = !DILocation(line: 218, scope: !1292)
!1296 = !DILocation(line: 218, column: 26, scope: !1297)
!1297 = distinct !DILexicalBlock(scope: !1292, file: !68, line: 218, column: 5)
!1298 = !DILocation(line: 218, column: 5, scope: !1292)
!1299 = !DILocation(line: 220, column: 28, scope: !1300)
!1300 = distinct !DILexicalBlock(scope: !1297, file: !68, line: 219, column: 5)
!1301 = !DILocation(line: 220, column: 22, scope: !1300)
!1302 = !DILocation(line: 220, column: 14, scope: !1300)
!1303 = !DILocation(line: 220, column: 9, scope: !1300)
!1304 = !DILocation(line: 220, column: 20, scope: !1300)
!1305 = !DILocation(line: 221, column: 22, scope: !1300)
!1306 = !DILocation(line: 221, column: 14, scope: !1300)
!1307 = !DILocation(line: 221, column: 16, scope: !1300)
!1308 = !DILocation(line: 221, column: 9, scope: !1300)
!1309 = !DILocation(line: 221, column: 20, scope: !1300)
!1310 = !DILocation(line: 222, column: 22, scope: !1300)
!1311 = !DILocation(line: 222, column: 14, scope: !1300)
!1312 = !DILocation(line: 222, column: 16, scope: !1300)
!1313 = !DILocation(line: 222, column: 9, scope: !1300)
!1314 = !DILocation(line: 222, column: 20, scope: !1300)
!1315 = !DILocation(line: 223, column: 22, scope: !1300)
!1316 = !DILocation(line: 223, column: 14, scope: !1300)
!1317 = !DILocation(line: 223, column: 16, scope: !1300)
!1318 = !DILocation(line: 223, column: 9, scope: !1300)
!1319 = !DILocation(line: 223, column: 20, scope: !1300)
!1320 = !DILocation(line: 218, column: 41, scope: !1297)
!1321 = !DILocation(line: 218, column: 5, scope: !1297)
!1322 = distinct !{!1322, !1298, !1323, !388}
!1323 = !DILocation(line: 224, column: 5, scope: !1292)
!1324 = !DILocation(line: 228, scope: !1325)
!1325 = distinct !DILexicalBlock(scope: !1133, file: !68, line: 228, column: 5)
!1326 = !DILocalVariable(name: "c", scope: !1325, file: !68, line: 228, type: !58)
!1327 = !DILocation(line: 0, scope: !1325)
!1328 = !DILocation(line: 228, column: 26, scope: !1329)
!1329 = distinct !DILexicalBlock(scope: !1325, file: !68, line: 228, column: 5)
!1330 = !DILocation(line: 228, column: 5, scope: !1325)
!1331 = !DILocation(line: 230, scope: !1332)
!1332 = distinct !DILexicalBlock(scope: !1333, file: !68, line: 230, column: 9)
!1333 = distinct !DILexicalBlock(scope: !1329, file: !68, line: 229, column: 5)
!1334 = !DILocalVariable(name: "r", scope: !1332, file: !68, line: 230, type: !86)
!1335 = !DILocation(line: 0, scope: !1332)
!1336 = !DILocation(line: 230, column: 36, scope: !1337)
!1337 = distinct !DILexicalBlock(scope: !1332, file: !68, line: 230, column: 9)
!1338 = !DILocation(line: 230, column: 9, scope: !1332)
!1339 = !DILocation(line: 232, column: 28, scope: !1340)
!1340 = distinct !DILexicalBlock(scope: !1337, file: !68, line: 231, column: 9)
!1341 = !DILocation(line: 232, column: 32, scope: !1340)
!1342 = !DILocation(line: 232, column: 41, scope: !1340)
!1343 = !DILocation(line: 232, column: 49, scope: !1340)
!1344 = !DILocation(line: 232, column: 45, scope: !1340)
!1345 = !DILocalVariable(name: "pos", scope: !1340, file: !68, line: 232, type: !58)
!1346 = !DILocation(line: 0, scope: !1340)
!1347 = !DILocation(line: 233, column: 28, scope: !1340)
!1348 = !DILocation(line: 233, column: 41, scope: !1340)
!1349 = !DILocalVariable(name: "t0", scope: !1340, file: !68, line: 233, type: !53)
!1350 = !DILocation(line: 234, column: 35, scope: !1340)
!1351 = !DILocation(line: 234, column: 41, scope: !1340)
!1352 = !DILocalVariable(name: "t1", scope: !1340, file: !68, line: 234, type: !53)
!1353 = !DILocation(line: 235, column: 35, scope: !1340)
!1354 = !DILocation(line: 235, column: 41, scope: !1340)
!1355 = !DILocalVariable(name: "t2", scope: !1340, file: !68, line: 235, type: !53)
!1356 = !DILocation(line: 236, column: 28, scope: !1340)
!1357 = !DILocation(line: 236, column: 35, scope: !1340)
!1358 = !DILocation(line: 236, column: 41, scope: !1340)
!1359 = !DILocalVariable(name: "t3", scope: !1340, file: !68, line: 236, type: !53)
!1360 = !DILocalVariable(name: "t", scope: !1361, file: !68, line: 237, type: !58)
!1361 = distinct !DILexicalBlock(scope: !1340, file: !68, line: 237, column: 13)
!1362 = !DILocation(line: 0, scope: !1361)
!1363 = !DILocation(line: 239, column: 84, scope: !1364)
!1364 = distinct !DILexicalBlock(scope: !1365, file: !68, line: 238, column: 13)
!1365 = distinct !DILexicalBlock(scope: !1361, file: !68, line: 237, column: 13)
!1366 = !DILocation(line: 239, column: 83, scope: !1364)
!1367 = !DILocation(line: 239, column: 100, scope: !1364)
!1368 = !DILocation(line: 239, column: 99, scope: !1364)
!1369 = !DILocation(line: 239, column: 95, scope: !1364)
!1370 = !DILocation(line: 239, column: 116, scope: !1364)
!1371 = !DILocation(line: 239, column: 115, scope: !1364)
!1372 = !DILocation(line: 239, column: 111, scope: !1364)
!1373 = !DILocation(line: 239, column: 132, scope: !1364)
!1374 = !DILocation(line: 239, column: 131, scope: !1364)
!1375 = !DILocation(line: 239, column: 127, scope: !1364)
!1376 = !DILocation(line: 239, column: 24, scope: !1364)
!1377 = !DILocation(line: 239, column: 36, scope: !1364)
!1378 = !DILocation(line: 239, column: 40, scope: !1364)
!1379 = !DILocation(line: 239, column: 49, scope: !1364)
!1380 = !DILocation(line: 239, column: 72, scope: !1364)
!1381 = !DILocation(line: 239, column: 53, scope: !1364)
!1382 = !DILocation(line: 239, column: 17, scope: !1364)
!1383 = !DILocation(line: 239, column: 78, scope: !1364)
!1384 = !DILocation(line: 239, column: 58, scope: !1364)
!1385 = !DILocation(line: 230, column: 82, scope: !1337)
!1386 = !DILocation(line: 230, column: 9, scope: !1337)
!1387 = distinct !{!1387, !1338, !1388, !388}
!1388 = !DILocation(line: 241, column: 9, scope: !1332)
!1389 = !DILocation(line: 228, column: 38, scope: !1329)
!1390 = !DILocation(line: 228, column: 5, scope: !1329)
!1391 = distinct !{!1391, !1330, !1392, !388}
!1392 = !DILocation(line: 242, column: 5, scope: !1325)
!1393 = !DILocation(line: 250, scope: !1394)
!1394 = distinct !DILexicalBlock(scope: !1133, file: !68, line: 250, column: 5)
!1395 = !DILocalVariable(name: "r", scope: !1394, file: !68, line: 250, type: !86)
!1396 = !DILocation(line: 0, scope: !1394)
!1397 = !DILocation(line: 250, column: 23, scope: !1398)
!1398 = distinct !DILexicalBlock(scope: !1394, file: !68, line: 250, column: 5)
!1399 = !DILocation(line: 250, column: 5, scope: !1394)
!1400 = !DILocation(line: 254, scope: !1401)
!1401 = distinct !DILexicalBlock(scope: !1402, file: !68, line: 254, column: 13)
!1402 = distinct !DILexicalBlock(scope: !1403, file: !68, line: 253, column: 9)
!1403 = distinct !DILexicalBlock(scope: !1404, file: !68, line: 252, column: 9)
!1404 = distinct !DILexicalBlock(scope: !1405, file: !68, line: 252, column: 9)
!1405 = distinct !DILexicalBlock(scope: !1398, file: !68, line: 251, column: 5)
!1406 = !DILocalVariable(name: "i", scope: !1401, file: !68, line: 254, type: !86)
!1407 = !DILocation(line: 0, scope: !1401)
!1408 = !DILocation(line: 254, column: 35, scope: !1409)
!1409 = distinct !DILexicalBlock(scope: !1401, file: !68, line: 254, column: 13)
!1410 = !DILocation(line: 254, column: 13, scope: !1401)
!1411 = !DILocation(line: 256, column: 55, scope: !1412)
!1412 = distinct !DILexicalBlock(scope: !1409, file: !68, line: 255, column: 13)
!1413 = !DILocation(line: 256, column: 63, scope: !1412)
!1414 = !DILocation(line: 256, column: 44, scope: !1412)
!1415 = !DILocation(line: 256, column: 95, scope: !1412)
!1416 = !DILocation(line: 256, column: 92, scope: !1412)
!1417 = !DILocation(line: 256, column: 75, scope: !1412)
!1418 = !DILocation(line: 256, column: 17, scope: !1412)
!1419 = !DILocation(line: 254, column: 50, scope: !1409)
!1420 = !DILocation(line: 254, column: 13, scope: !1409)
!1421 = distinct !{!1421, !1410, !1422, !388}
!1422 = !DILocation(line: 257, column: 13, scope: !1401)
!1423 = !DILocation(line: 256, column: 59, scope: !1412)
!1424 = !DILocation(line: 256, column: 99, scope: !1412)
!1425 = !DILocalVariable(name: "c", scope: !1404, file: !68, line: 252, type: !86)
!1426 = !DILocation(line: 0, scope: !1404)
!1427 = !DILocation(line: 250, column: 38, scope: !1398)
!1428 = !DILocation(line: 250, column: 5, scope: !1398)
!1429 = distinct !{!1429, !1399, !1430, !388}
!1430 = !DILocation(line: 259, column: 5, scope: !1394)
!1431 = !DILocation(line: 260, column: 1, scope: !1133)
!1432 = distinct !DISubprogram(name: "mat_mul", scope: !577, file: !577, line: 79, type: !1433, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1433 = !DISubroutineType(types: !1434)
!1434 = !{null, !90, !90, !61, !86, !86, !86}
!1435 = !DILocalVariable(name: "a", arg: 1, scope: !1432, file: !577, line: 79, type: !90)
!1436 = !DILocation(line: 0, scope: !1432)
!1437 = !DILocalVariable(name: "b", arg: 2, scope: !1432, file: !577, line: 79, type: !90)
!1438 = !DILocalVariable(name: "c", arg: 3, scope: !1432, file: !577, line: 80, type: !61)
!1439 = !DILocalVariable(name: "colrow_ab", arg: 4, scope: !1432, file: !577, line: 80, type: !86)
!1440 = !DILocalVariable(name: "row_a", arg: 5, scope: !1432, file: !577, line: 80, type: !86)
!1441 = !DILocalVariable(name: "col_b", arg: 6, scope: !1432, file: !577, line: 80, type: !86)
!1442 = !DILocalVariable(name: "i", scope: !1443, file: !577, line: 81, type: !86)
!1443 = distinct !DILexicalBlock(scope: !1432, file: !577, line: 81, column: 5)
!1444 = !DILocation(line: 0, scope: !1443)
!1445 = !DILocation(line: 81, column: 10, scope: !1443)
!1446 = !DILocation(line: 81, scope: !1443)
!1447 = !DILocation(line: 81, column: 23, scope: !1448)
!1448 = distinct !DILexicalBlock(scope: !1443, file: !577, line: 81, column: 5)
!1449 = !DILocation(line: 81, column: 5, scope: !1443)
!1450 = !DILocation(line: 82, scope: !1451)
!1451 = distinct !DILexicalBlock(scope: !1452, file: !577, line: 82, column: 9)
!1452 = distinct !DILexicalBlock(scope: !1448, file: !577, line: 81, column: 53)
!1453 = !DILocalVariable(name: "j", scope: !1451, file: !577, line: 82, type: !86)
!1454 = !DILocation(line: 0, scope: !1451)
!1455 = !DILocation(line: 82, column: 27, scope: !1456)
!1456 = distinct !DILexicalBlock(scope: !1451, file: !577, line: 82, column: 9)
!1457 = !DILocation(line: 82, column: 9, scope: !1451)
!1458 = !DILocation(line: 83, column: 31, scope: !1459)
!1459 = distinct !DILexicalBlock(scope: !1456, file: !577, line: 82, column: 46)
!1460 = !DILocation(line: 83, column: 18, scope: !1459)
!1461 = !DILocation(line: 83, column: 16, scope: !1459)
!1462 = !DILocation(line: 82, column: 36, scope: !1456)
!1463 = !DILocation(line: 82, column: 41, scope: !1456)
!1464 = !DILocation(line: 82, column: 9, scope: !1456)
!1465 = distinct !{!1465, !1457, !1466, !388}
!1466 = !DILocation(line: 84, column: 9, scope: !1451)
!1467 = !DILocation(line: 81, column: 32, scope: !1448)
!1468 = !DILocation(line: 81, column: 39, scope: !1448)
!1469 = !DILocation(line: 81, column: 5, scope: !1448)
!1470 = distinct !{!1470, !1449, !1471, !388}
!1471 = !DILocation(line: 85, column: 5, scope: !1443)
!1472 = !DILocation(line: 86, column: 18, scope: !1432)
!1473 = !DILocation(line: 86, column: 5, scope: !1432)
!1474 = !DILocation(line: 87, column: 1, scope: !1432)
!1475 = distinct !DISubprogram(name: "mat_add", scope: !577, file: !577, line: 89, type: !1476, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1476 = !DISubroutineType(types: !1477)
!1477 = !{null, !90, !90, !61, !86, !86}
!1478 = !DILocalVariable(name: "a", arg: 1, scope: !1475, file: !577, line: 89, type: !90)
!1479 = !DILocation(line: 0, scope: !1475)
!1480 = !DILocalVariable(name: "b", arg: 2, scope: !1475, file: !577, line: 89, type: !90)
!1481 = !DILocalVariable(name: "c", arg: 3, scope: !1475, file: !577, line: 90, type: !61)
!1482 = !DILocalVariable(name: "m", arg: 4, scope: !1475, file: !577, line: 90, type: !86)
!1483 = !DILocalVariable(name: "n", arg: 5, scope: !1475, file: !577, line: 90, type: !86)
!1484 = !DILocalVariable(name: "i", scope: !1485, file: !577, line: 91, type: !86)
!1485 = distinct !DILexicalBlock(scope: !1475, file: !577, line: 91, column: 5)
!1486 = !DILocation(line: 0, scope: !1485)
!1487 = !DILocation(line: 91, column: 10, scope: !1485)
!1488 = !DILocation(line: 91, scope: !1485)
!1489 = !DILocation(line: 91, column: 23, scope: !1490)
!1490 = distinct !DILexicalBlock(scope: !1485, file: !577, line: 91, column: 5)
!1491 = !DILocation(line: 91, column: 5, scope: !1485)
!1492 = !DILocation(line: 92, scope: !1493)
!1493 = distinct !DILexicalBlock(scope: !1494, file: !577, line: 92, column: 9)
!1494 = distinct !DILexicalBlock(scope: !1490, file: !577, line: 91, column: 33)
!1495 = !DILocalVariable(name: "j", scope: !1493, file: !577, line: 92, type: !86)
!1496 = !DILocation(line: 0, scope: !1493)
!1497 = !DILocation(line: 92, column: 27, scope: !1498)
!1498 = distinct !DILexicalBlock(scope: !1493, file: !577, line: 92, column: 9)
!1499 = !DILocation(line: 92, column: 9, scope: !1493)
!1500 = !DILocation(line: 93, column: 46, scope: !1501)
!1501 = distinct !DILexicalBlock(scope: !1498, file: !577, line: 92, column: 37)
!1502 = !DILocation(line: 93, column: 42, scope: !1501)
!1503 = !DILocation(line: 93, column: 50, scope: !1501)
!1504 = !DILocation(line: 93, column: 38, scope: !1501)
!1505 = !DILocation(line: 93, column: 64, scope: !1501)
!1506 = !DILocation(line: 93, column: 60, scope: !1501)
!1507 = !DILocation(line: 93, column: 68, scope: !1501)
!1508 = !DILocation(line: 93, column: 56, scope: !1501)
!1509 = !DILocation(line: 93, column: 32, scope: !1501)
!1510 = !DILocation(line: 93, column: 21, scope: !1501)
!1511 = !DILocation(line: 93, column: 17, scope: !1501)
!1512 = !DILocation(line: 93, column: 25, scope: !1501)
!1513 = !DILocation(line: 93, column: 30, scope: !1501)
!1514 = !DILocation(line: 92, column: 32, scope: !1498)
!1515 = !DILocation(line: 92, column: 9, scope: !1498)
!1516 = distinct !{!1516, !1499, !1517, !388}
!1517 = !DILocation(line: 94, column: 9, scope: !1493)
!1518 = !DILocation(line: 91, column: 28, scope: !1490)
!1519 = !DILocation(line: 91, column: 5, scope: !1490)
!1520 = distinct !{!1520, !1491, !1521, !388}
!1521 = !DILocation(line: 95, column: 5, scope: !1485)
!1522 = !DILocation(line: 96, column: 1, scope: !1475)
!1523 = distinct !DISubprogram(name: "encode", scope: !68, file: !68, line: 32, type: !361, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1524 = !DILocalVariable(name: "m", arg: 1, scope: !1523, file: !68, line: 32, type: !90)
!1525 = !DILocation(line: 0, scope: !1523)
!1526 = !DILocalVariable(name: "menc", arg: 2, scope: !1523, file: !68, line: 32, type: !61)
!1527 = !DILocalVariable(name: "mlen", arg: 3, scope: !1523, file: !68, line: 32, type: !86)
!1528 = !DILocalVariable(name: "i", scope: !1523, file: !68, line: 33, type: !86)
!1529 = !DILocation(line: 34, column: 10, scope: !1530)
!1530 = distinct !DILexicalBlock(scope: !1523, file: !68, line: 34, column: 5)
!1531 = !DILocation(line: 34, scope: !1530)
!1532 = !DILocation(line: 34, column: 26, scope: !1533)
!1533 = distinct !DILexicalBlock(scope: !1530, file: !68, line: 34, column: 5)
!1534 = !DILocation(line: 34, column: 19, scope: !1533)
!1535 = !DILocation(line: 34, column: 5, scope: !1530)
!1536 = !DILocation(line: 35, column: 20, scope: !1537)
!1537 = distinct !DILexicalBlock(scope: !1533, file: !68, line: 34, column: 44)
!1538 = !DILocation(line: 35, column: 31, scope: !1537)
!1539 = !DILocation(line: 35, column: 27, scope: !1537)
!1540 = !DILocation(line: 35, column: 36, scope: !1537)
!1541 = !DILocation(line: 35, column: 24, scope: !1537)
!1542 = !DILocation(line: 35, column: 9, scope: !1537)
!1543 = !DILocation(line: 35, column: 17, scope: !1537)
!1544 = !DILocation(line: 34, column: 31, scope: !1533)
!1545 = !DILocation(line: 34, column: 38, scope: !1533)
!1546 = !DILocation(line: 34, column: 5, scope: !1533)
!1547 = distinct !{!1547, !1535, !1548, !388}
!1548 = !DILocation(line: 36, column: 5, scope: !1530)
!1549 = !DILocation(line: 38, column: 18, scope: !1550)
!1550 = distinct !DILexicalBlock(scope: !1523, file: !68, line: 38, column: 9)
!1551 = !DILocation(line: 39, column: 20, scope: !1552)
!1552 = distinct !DILexicalBlock(scope: !1550, file: !68, line: 38, column: 24)
!1553 = !DILocation(line: 39, column: 9, scope: !1552)
!1554 = !DILocation(line: 39, column: 17, scope: !1552)
!1555 = !DILocation(line: 40, column: 5, scope: !1552)
!1556 = !DILocation(line: 41, column: 1, scope: !1523)
!1557 = distinct !DISubprogram(name: "add_f", scope: !577, file: !577, line: 43, type: !1558, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1558 = !DISubroutineType(types: !1559)
!1559 = !{!51, !51, !51}
!1560 = !DILocalVariable(name: "a", arg: 1, scope: !1557, file: !577, line: 43, type: !51)
!1561 = !DILocation(line: 0, scope: !1557)
!1562 = !DILocalVariable(name: "b", arg: 2, scope: !1557, file: !577, line: 43, type: !51)
!1563 = !DILocation(line: 44, column: 14, scope: !1557)
!1564 = !DILocation(line: 44, column: 5, scope: !1557)
!1565 = distinct !DISubprogram(name: "lincomb", scope: !577, file: !577, line: 70, type: !1566, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1566 = !DISubroutineType(types: !1567)
!1567 = !{!51, !90, !90, !86, !86}
!1568 = !DILocalVariable(name: "a", arg: 1, scope: !1565, file: !577, line: 70, type: !90)
!1569 = !DILocation(line: 0, scope: !1565)
!1570 = !DILocalVariable(name: "b", arg: 2, scope: !1565, file: !577, line: 71, type: !90)
!1571 = !DILocalVariable(name: "n", arg: 3, scope: !1565, file: !577, line: 71, type: !86)
!1572 = !DILocalVariable(name: "m", arg: 4, scope: !1565, file: !577, line: 71, type: !86)
!1573 = !DILocalVariable(name: "ret", scope: !1565, file: !577, line: 72, type: !51)
!1574 = !DILocalVariable(name: "i", scope: !1575, file: !577, line: 73, type: !86)
!1575 = distinct !DILexicalBlock(scope: !1565, file: !577, line: 73, column: 5)
!1576 = !DILocation(line: 0, scope: !1575)
!1577 = !DILocation(line: 73, column: 10, scope: !1575)
!1578 = !DILocation(line: 73, scope: !1575)
!1579 = !DILocation(line: 73, column: 23, scope: !1580)
!1580 = distinct !DILexicalBlock(scope: !1575, file: !577, line: 73, column: 5)
!1581 = !DILocation(line: 73, column: 5, scope: !1575)
!1582 = !DILocation(line: 74, column: 27, scope: !1583)
!1583 = distinct !DILexicalBlock(scope: !1580, file: !577, line: 73, column: 41)
!1584 = !DILocation(line: 74, column: 33, scope: !1583)
!1585 = !DILocation(line: 74, column: 21, scope: !1583)
!1586 = !DILocation(line: 74, column: 15, scope: !1583)
!1587 = !DILocation(line: 73, column: 28, scope: !1580)
!1588 = !DILocation(line: 73, column: 35, scope: !1580)
!1589 = !DILocation(line: 73, column: 5, scope: !1580)
!1590 = distinct !{!1590, !1581, !1591, !388}
!1591 = !DILocation(line: 75, column: 5, scope: !1575)
!1592 = !DILocation(line: 76, column: 5, scope: !1565)
!1593 = distinct !DISubprogram(name: "mul_f", scope: !577, file: !577, line: 9, type: !1558, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1594 = !DILocalVariable(name: "a", arg: 1, scope: !1593, file: !577, line: 9, type: !51)
!1595 = !DILocation(line: 0, scope: !1593)
!1596 = !DILocalVariable(name: "b", arg: 2, scope: !1593, file: !577, line: 9, type: !51)
!1597 = !DILocation(line: 14, column: 10, scope: !1593)
!1598 = !DILocation(line: 14, column: 7, scope: !1593)
!1599 = !DILocation(line: 17, column: 17, scope: !1593)
!1600 = !DILocalVariable(name: "p", scope: !1593, file: !577, line: 11, type: !51)
!1601 = !DILocation(line: 18, column: 13, scope: !1593)
!1602 = !DILocation(line: 18, column: 17, scope: !1593)
!1603 = !DILocation(line: 18, column: 7, scope: !1593)
!1604 = !DILocation(line: 19, column: 13, scope: !1593)
!1605 = !DILocation(line: 19, column: 17, scope: !1593)
!1606 = !DILocation(line: 19, column: 7, scope: !1593)
!1607 = !DILocation(line: 20, column: 13, scope: !1593)
!1608 = !DILocation(line: 20, column: 17, scope: !1593)
!1609 = !DILocation(line: 20, column: 7, scope: !1593)
!1610 = !DILocalVariable(name: "top_p", scope: !1593, file: !577, line: 23, type: !51)
!1611 = !DILocation(line: 24, column: 37, scope: !1593)
!1612 = !DILocation(line: 24, column: 52, scope: !1593)
!1613 = !DILocation(line: 24, column: 43, scope: !1593)
!1614 = !DILocation(line: 24, column: 59, scope: !1593)
!1615 = !DILocalVariable(name: "out", scope: !1593, file: !577, line: 24, type: !51)
!1616 = !DILocation(line: 25, column: 5, scope: !1593)
!1617 = !DILocalVariable(name: "M", arg: 1, scope: !67, file: !68, line: 111, type: !52)
!1618 = !DILocation(line: 0, scope: !67)
!1619 = !DILocalVariable(name: "i", scope: !1620, file: !68, line: 117, type: !58)
!1620 = distinct !DILexicalBlock(scope: !67, file: !68, line: 117, column: 5)
!1621 = !DILocation(line: 0, scope: !1620)
!1622 = !DILocation(line: 119, column: 24, scope: !1623)
!1623 = distinct !DILexicalBlock(scope: !1624, file: !68, line: 118, column: 5)
!1624 = distinct !DILexicalBlock(scope: !1620, file: !68, line: 117, column: 5)
!1625 = !DILocation(line: 119, column: 29, scope: !1623)
!1626 = !DILocation(line: 119, column: 38, scope: !1623)
!1627 = !DILocation(line: 119, column: 36, scope: !1623)
!1628 = !DILocation(line: 119, column: 46, scope: !1623)
!1629 = !DILocalVariable(name: "t", scope: !1623, file: !68, line: 119, type: !53)
!1630 = !DILocation(line: 0, scope: !1623)
!1631 = !DILocation(line: 120, column: 21, scope: !1623)
!1632 = !DILocation(line: 120, column: 16, scope: !1623)
!1633 = !DILocation(line: 121, column: 9, scope: !1623)
!1634 = !DILocation(line: 121, column: 16, scope: !1623)
!1635 = !DILocation(line: 120, column: 9, scope: !1623)
!1636 = !DILocalVariable(name: "i", scope: !1637, file: !68, line: 124, type: !58)
!1637 = distinct !DILexicalBlock(scope: !67, file: !68, line: 124, column: 5)
!1638 = !DILocation(line: 0, scope: !1637)
!1639 = !DILocation(line: 126, column: 25, scope: !1640)
!1640 = distinct !DILexicalBlock(scope: !1641, file: !68, line: 125, column: 5)
!1641 = distinct !DILexicalBlock(scope: !1637, file: !68, line: 124, column: 5)
!1642 = !DILocation(line: 126, column: 32, scope: !1640)
!1643 = !DILocation(line: 126, column: 40, scope: !1640)
!1644 = !DILocation(line: 126, column: 38, scope: !1640)
!1645 = !DILocation(line: 126, column: 48, scope: !1640)
!1646 = !DILocalVariable(name: "t0", scope: !1640, file: !68, line: 126, type: !53)
!1647 = !DILocation(line: 0, scope: !1640)
!1648 = !DILocation(line: 127, column: 25, scope: !1640)
!1649 = !DILocation(line: 127, column: 32, scope: !1640)
!1650 = !DILocation(line: 127, column: 40, scope: !1640)
!1651 = !DILocation(line: 127, column: 38, scope: !1640)
!1652 = !DILocation(line: 127, column: 48, scope: !1640)
!1653 = !DILocalVariable(name: "t1", scope: !1640, file: !68, line: 127, type: !53)
!1654 = !DILocation(line: 128, column: 23, scope: !1640)
!1655 = !DILocation(line: 128, column: 16, scope: !1640)
!1656 = !DILocation(line: 129, column: 23, scope: !1640)
!1657 = !DILocation(line: 129, column: 9, scope: !1640)
!1658 = !DILocation(line: 129, column: 16, scope: !1640)
!1659 = !DILocation(line: 130, column: 9, scope: !1640)
!1660 = !DILocation(line: 130, column: 16, scope: !1640)
!1661 = !DILocation(line: 131, column: 9, scope: !1640)
!1662 = !DILocation(line: 131, column: 16, scope: !1640)
!1663 = !DILocation(line: 128, column: 9, scope: !1640)
!1664 = !DILocalVariable(name: "i", scope: !1665, file: !68, line: 134, type: !58)
!1665 = distinct !DILexicalBlock(scope: !67, file: !68, line: 134, column: 5)
!1666 = !DILocation(line: 0, scope: !1665)
!1667 = !DILocation(line: 136, column: 25, scope: !1668)
!1668 = distinct !DILexicalBlock(scope: !1669, file: !68, line: 135, column: 5)
!1669 = distinct !DILexicalBlock(scope: !1665, file: !68, line: 134, column: 5)
!1670 = !DILocation(line: 136, column: 32, scope: !1668)
!1671 = !DILocation(line: 136, column: 41, scope: !1668)
!1672 = !DILocation(line: 136, column: 39, scope: !1668)
!1673 = !DILocation(line: 136, column: 50, scope: !1668)
!1674 = !DILocalVariable(name: "t0", scope: !1668, file: !68, line: 136, type: !53)
!1675 = !DILocation(line: 0, scope: !1668)
!1676 = !DILocation(line: 137, column: 25, scope: !1668)
!1677 = !DILocation(line: 137, column: 32, scope: !1668)
!1678 = !DILocation(line: 137, column: 41, scope: !1668)
!1679 = !DILocation(line: 137, column: 39, scope: !1668)
!1680 = !DILocation(line: 137, column: 50, scope: !1668)
!1681 = !DILocalVariable(name: "t1", scope: !1668, file: !68, line: 137, type: !53)
!1682 = !DILocation(line: 139, column: 23, scope: !1668)
!1683 = !DILocation(line: 139, column: 17, scope: !1668)
!1684 = !DILocation(line: 140, column: 23, scope: !1668)
!1685 = !DILocation(line: 140, column: 9, scope: !1668)
!1686 = !DILocation(line: 140, column: 17, scope: !1668)
!1687 = !DILocation(line: 141, column: 9, scope: !1668)
!1688 = !DILocation(line: 141, column: 17, scope: !1668)
!1689 = !DILocation(line: 142, column: 9, scope: !1668)
!1690 = !DILocation(line: 142, column: 17, scope: !1668)
!1691 = !DILocation(line: 139, column: 9, scope: !1668)
!1692 = !DILocalVariable(name: "i", scope: !1693, file: !68, line: 145, type: !58)
!1693 = distinct !DILexicalBlock(scope: !67, file: !68, line: 145, column: 5)
!1694 = !DILocation(line: 0, scope: !1693)
!1695 = !DILocation(line: 147, column: 24, scope: !1696)
!1696 = distinct !DILexicalBlock(scope: !1697, file: !68, line: 146, column: 5)
!1697 = distinct !DILexicalBlock(scope: !1693, file: !68, line: 145, column: 5)
!1698 = !DILocation(line: 147, column: 28, scope: !1696)
!1699 = !DILocation(line: 147, column: 36, scope: !1696)
!1700 = !DILocation(line: 147, column: 44, scope: !1696)
!1701 = !DILocalVariable(name: "t", scope: !1696, file: !68, line: 147, type: !53)
!1702 = !DILocation(line: 0, scope: !1696)
!1703 = !DILocation(line: 148, column: 21, scope: !1696)
!1704 = !DILocation(line: 148, column: 16, scope: !1696)
!1705 = !DILocation(line: 149, column: 9, scope: !1696)
!1706 = !DILocation(line: 149, column: 16, scope: !1696)
!1707 = !DILocation(line: 148, column: 9, scope: !1696)
!1708 = !DILocation(line: 151, column: 1, scope: !67)
!1709 = distinct !DISubprogram(name: "mul_add_mat_x_m_mat", scope: !408, file: !408, line: 61, type: !469, scopeLine: 62, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1710 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !1709, file: !408, line: 61, type: !324)
!1711 = !DILocation(line: 0, scope: !1709)
!1712 = !DILocalVariable(name: "mat", arg: 2, scope: !1709, file: !408, line: 61, type: !90)
!1713 = !DILocalVariable(name: "bs_mat", arg: 3, scope: !1709, file: !408, line: 61, type: !411)
!1714 = !DILocalVariable(name: "acc", arg: 4, scope: !1709, file: !408, line: 61, type: !52)
!1715 = !DILocalVariable(name: "mat_rows", arg: 5, scope: !1709, file: !408, line: 62, type: !324)
!1716 = !DILocalVariable(name: "mat_cols", arg: 6, scope: !1709, file: !408, line: 62, type: !324)
!1717 = !DILocalVariable(name: "bs_mat_cols", arg: 7, scope: !1709, file: !408, line: 62, type: !324)
!1718 = !DILocalVariable(name: "r", scope: !1719, file: !408, line: 64, type: !86)
!1719 = distinct !DILexicalBlock(scope: !1709, file: !408, line: 64, column: 5)
!1720 = !DILocation(line: 0, scope: !1719)
!1721 = !DILocation(line: 64, column: 10, scope: !1719)
!1722 = !DILocation(line: 64, scope: !1719)
!1723 = !DILocation(line: 64, column: 23, scope: !1724)
!1724 = distinct !DILexicalBlock(scope: !1719, file: !408, line: 64, column: 5)
!1725 = !DILocation(line: 64, column: 5, scope: !1719)
!1726 = !DILocation(line: 65, scope: !1727)
!1727 = distinct !DILexicalBlock(scope: !1728, file: !408, line: 65, column: 9)
!1728 = distinct !DILexicalBlock(scope: !1724, file: !408, line: 64, column: 40)
!1729 = !DILocalVariable(name: "c", scope: !1727, file: !408, line: 65, type: !86)
!1730 = !DILocation(line: 0, scope: !1727)
!1731 = !DILocation(line: 65, column: 27, scope: !1732)
!1732 = distinct !DILexicalBlock(scope: !1727, file: !408, line: 65, column: 9)
!1733 = !DILocation(line: 65, column: 9, scope: !1727)
!1734 = !DILocation(line: 66, scope: !1735)
!1735 = distinct !DILexicalBlock(scope: !1736, file: !408, line: 66, column: 13)
!1736 = distinct !DILexicalBlock(scope: !1732, file: !408, line: 65, column: 44)
!1737 = !DILocalVariable(name: "k", scope: !1735, file: !408, line: 66, type: !86)
!1738 = !DILocation(line: 0, scope: !1735)
!1739 = !DILocation(line: 66, column: 31, scope: !1740)
!1740 = distinct !DILexicalBlock(scope: !1735, file: !408, line: 66, column: 13)
!1741 = !DILocation(line: 66, column: 13, scope: !1735)
!1742 = !DILocation(line: 67, column: 70, scope: !1743)
!1743 = distinct !DILexicalBlock(scope: !1740, file: !408, line: 66, column: 54)
!1744 = !DILocation(line: 67, column: 84, scope: !1743)
!1745 = !DILocation(line: 67, column: 65, scope: !1743)
!1746 = !DILocation(line: 67, column: 51, scope: !1743)
!1747 = !DILocation(line: 67, column: 96, scope: !1743)
!1748 = !DILocation(line: 67, column: 90, scope: !1743)
!1749 = !DILocation(line: 67, column: 136, scope: !1743)
!1750 = !DILocation(line: 67, column: 150, scope: !1743)
!1751 = !DILocation(line: 67, column: 131, scope: !1743)
!1752 = !DILocation(line: 67, column: 117, scope: !1743)
!1753 = !DILocation(line: 67, column: 17, scope: !1743)
!1754 = !DILocation(line: 66, column: 48, scope: !1740)
!1755 = !DILocation(line: 66, column: 13, scope: !1740)
!1756 = distinct !{!1756, !1741, !1757, !388}
!1757 = !DILocation(line: 68, column: 13, scope: !1735)
!1758 = !DILocation(line: 65, column: 40, scope: !1732)
!1759 = !DILocation(line: 65, column: 9, scope: !1732)
!1760 = distinct !{!1760, !1733, !1761, !388}
!1761 = !DILocation(line: 69, column: 9, scope: !1727)
!1762 = !DILocation(line: 64, column: 36, scope: !1724)
!1763 = !DILocation(line: 64, column: 5, scope: !1724)
!1764 = distinct !{!1764, !1725, !1765, !388}
!1765 = !DILocation(line: 70, column: 5, scope: !1719)
!1766 = !DILocation(line: 71, column: 1, scope: !1709)
!1767 = distinct !DISubprogram(name: "P1_times_Vt", scope: !408, file: !408, line: 82, type: !459, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1768 = !DILocalVariable(name: "p", arg: 1, scope: !1767, file: !408, line: 82, type: !264)
!1769 = !DILocation(line: 0, scope: !1767)
!1770 = !DILocalVariable(name: "P1", arg: 2, scope: !1767, file: !408, line: 82, type: !411)
!1771 = !DILocalVariable(name: "V", arg: 3, scope: !1767, file: !408, line: 82, type: !90)
!1772 = !DILocalVariable(name: "acc", arg: 4, scope: !1767, file: !408, line: 82, type: !52)
!1773 = !DILocation(line: 86, column: 5, scope: !1767)
!1774 = !DILocation(line: 87, column: 1, scope: !1767)
!1775 = distinct !DISubprogram(name: "mul_add_m_upper_triangular_mat_x_mat_trans", scope: !408, file: !408, line: 32, type: !593, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1776 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !1775, file: !408, line: 32, type: !324)
!1777 = !DILocation(line: 0, scope: !1775)
!1778 = !DILocalVariable(name: "bs_mat", arg: 2, scope: !1775, file: !408, line: 32, type: !411)
!1779 = !DILocalVariable(name: "mat", arg: 3, scope: !1775, file: !408, line: 32, type: !90)
!1780 = !DILocalVariable(name: "acc", arg: 4, scope: !1775, file: !408, line: 32, type: !52)
!1781 = !DILocalVariable(name: "bs_mat_rows", arg: 5, scope: !1775, file: !408, line: 33, type: !324)
!1782 = !DILocalVariable(name: "bs_mat_cols", arg: 6, scope: !1775, file: !408, line: 33, type: !324)
!1783 = !DILocalVariable(name: "mat_rows", arg: 7, scope: !1775, file: !408, line: 33, type: !324)
!1784 = !DILocalVariable(name: "triangular", arg: 8, scope: !1775, file: !408, line: 33, type: !324)
!1785 = !DILocalVariable(name: "bs_mat_entries_used", scope: !1775, file: !408, line: 34, type: !86)
!1786 = !DILocalVariable(name: "r", scope: !1787, file: !408, line: 35, type: !86)
!1787 = distinct !DILexicalBlock(scope: !1775, file: !408, line: 35, column: 5)
!1788 = !DILocation(line: 0, scope: !1787)
!1789 = !DILocation(line: 35, column: 10, scope: !1787)
!1790 = !DILocation(line: 34, column: 9, scope: !1775)
!1791 = !DILocation(line: 35, scope: !1787)
!1792 = !DILocation(line: 35, column: 23, scope: !1793)
!1793 = distinct !DILexicalBlock(scope: !1787, file: !408, line: 35, column: 5)
!1794 = !DILocation(line: 35, column: 5, scope: !1787)
!1795 = !DILocation(line: 36, column: 33, scope: !1796)
!1796 = distinct !DILexicalBlock(scope: !1797, file: !408, line: 36, column: 9)
!1797 = distinct !DILexicalBlock(scope: !1793, file: !408, line: 35, column: 43)
!1798 = !DILocalVariable(name: "c", scope: !1796, file: !408, line: 36, type: !86)
!1799 = !DILocation(line: 0, scope: !1796)
!1800 = !DILocation(line: 36, column: 14, scope: !1796)
!1801 = !DILocation(line: 36, scope: !1796)
!1802 = !DILocation(line: 36, column: 40, scope: !1803)
!1803 = distinct !DILexicalBlock(scope: !1796, file: !408, line: 36, column: 9)
!1804 = !DILocation(line: 36, column: 9, scope: !1796)
!1805 = !DILocation(line: 37, scope: !1806)
!1806 = distinct !DILexicalBlock(scope: !1807, file: !408, line: 37, column: 13)
!1807 = distinct !DILexicalBlock(scope: !1803, file: !408, line: 36, column: 60)
!1808 = !DILocalVariable(name: "k", scope: !1806, file: !408, line: 37, type: !86)
!1809 = !DILocation(line: 0, scope: !1806)
!1810 = !DILocation(line: 37, column: 31, scope: !1811)
!1811 = distinct !DILexicalBlock(scope: !1806, file: !408, line: 37, column: 13)
!1812 = !DILocation(line: 37, column: 13, scope: !1806)
!1813 = !DILocation(line: 38, column: 65, scope: !1814)
!1814 = distinct !DILexicalBlock(scope: !1811, file: !408, line: 37, column: 51)
!1815 = !DILocation(line: 38, column: 51, scope: !1814)
!1816 = !DILocation(line: 38, column: 94, scope: !1814)
!1817 = !DILocation(line: 38, column: 88, scope: !1814)
!1818 = !DILocation(line: 38, column: 137, scope: !1814)
!1819 = !DILocation(line: 38, column: 148, scope: !1814)
!1820 = !DILocation(line: 38, column: 132, scope: !1814)
!1821 = !DILocation(line: 38, column: 118, scope: !1814)
!1822 = !DILocation(line: 38, column: 17, scope: !1814)
!1823 = !DILocation(line: 37, column: 45, scope: !1811)
!1824 = !DILocation(line: 37, column: 13, scope: !1811)
!1825 = distinct !{!1825, !1812, !1826, !388}
!1826 = !DILocation(line: 39, column: 13, scope: !1806)
!1827 = !DILocation(line: 40, column: 33, scope: !1807)
!1828 = !DILocation(line: 36, column: 56, scope: !1803)
!1829 = !DILocation(line: 36, column: 9, scope: !1803)
!1830 = distinct !{!1830, !1804, !1831, !388}
!1831 = !DILocation(line: 41, column: 9, scope: !1796)
!1832 = !DILocation(line: 35, column: 39, scope: !1793)
!1833 = !DILocation(line: 35, column: 5, scope: !1793)
!1834 = distinct !{!1834, !1794, !1835, !388}
!1835 = !DILocation(line: 42, column: 5, scope: !1787)
!1836 = !DILocation(line: 43, column: 1, scope: !1775)
!1837 = distinct !DISubprogram(name: "pqmayo_MAYO_2_ref_mayo_sign", scope: !68, file: !68, line: 502, type: !798, scopeLine: 504, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1838 = !DILocalVariable(name: "p", arg: 1, scope: !1837, file: !68, line: 502, type: !264)
!1839 = !DILocation(line: 0, scope: !1837)
!1840 = !DILocalVariable(name: "sm", arg: 2, scope: !1837, file: !68, line: 502, type: !61)
!1841 = !DILocalVariable(name: "smlen", arg: 3, scope: !1837, file: !68, line: 503, type: !800)
!1842 = !DILocalVariable(name: "m", arg: 4, scope: !1837, file: !68, line: 503, type: !90)
!1843 = !DILocalVariable(name: "mlen", arg: 5, scope: !1837, file: !68, line: 504, type: !58)
!1844 = !DILocalVariable(name: "csk", arg: 6, scope: !1837, file: !68, line: 504, type: !90)
!1845 = !DILocalVariable(name: "ret", scope: !1837, file: !68, line: 505, type: !86)
!1846 = !DILocalVariable(name: "param_sig_bytes", scope: !1837, file: !68, line: 506, type: !324)
!1847 = !DILocation(line: 508, column: 16, scope: !1837)
!1848 = !DILocation(line: 508, column: 5, scope: !1837)
!1849 = !DILocation(line: 509, column: 50, scope: !1837)
!1850 = !DILocalVariable(name: "siglen", scope: !1837, file: !68, line: 507, type: !58)
!1851 = !DILocation(line: 509, column: 11, scope: !1837)
!1852 = !DILocation(line: 510, column: 13, scope: !1853)
!1853 = distinct !DILexicalBlock(scope: !1837, file: !68, line: 510, column: 9)
!1854 = !DILocation(line: 510, column: 24, scope: !1853)
!1855 = !DILocation(line: 511, column: 23, scope: !1856)
!1856 = distinct !DILexicalBlock(scope: !1853, file: !68, line: 510, column: 62)
!1857 = !DILocation(line: 511, column: 30, scope: !1856)
!1858 = !DILocation(line: 511, column: 9, scope: !1856)
!1859 = !DILocation(line: 512, column: 9, scope: !1856)
!1860 = !DILocation(line: 515, column: 14, scope: !1837)
!1861 = !DILocation(line: 515, column: 21, scope: !1837)
!1862 = !DILocation(line: 515, column: 12, scope: !1837)
!1863 = !DILocation(line: 515, column: 5, scope: !1837)
!1864 = !DILabel(scope: !1837, name: "err", file: !68, line: 516)
!1865 = !DILocation(line: 516, column: 1, scope: !1837)
!1866 = !DILocation(line: 517, column: 5, scope: !1837)
!1867 = distinct !DISubprogram(name: "pqmayo_MAYO_2_ref_mayo_open", scope: !68, file: !68, line: 520, type: !798, scopeLine: 522, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1868 = !DILocalVariable(name: "p", arg: 1, scope: !1867, file: !68, line: 520, type: !264)
!1869 = !DILocation(line: 0, scope: !1867)
!1870 = !DILocalVariable(name: "m", arg: 2, scope: !1867, file: !68, line: 520, type: !61)
!1871 = !DILocalVariable(name: "mlen", arg: 3, scope: !1867, file: !68, line: 521, type: !800)
!1872 = !DILocalVariable(name: "sm", arg: 4, scope: !1867, file: !68, line: 521, type: !90)
!1873 = !DILocalVariable(name: "smlen", arg: 5, scope: !1867, file: !68, line: 522, type: !58)
!1874 = !DILocalVariable(name: "pk", arg: 6, scope: !1867, file: !68, line: 522, type: !90)
!1875 = !DILocalVariable(name: "param_sig_bytes", scope: !1867, file: !68, line: 523, type: !324)
!1876 = !DILocation(line: 524, column: 15, scope: !1877)
!1877 = distinct !DILexicalBlock(scope: !1867, file: !68, line: 524, column: 9)
!1878 = !DILocation(line: 527, column: 36, scope: !1867)
!1879 = !DILocation(line: 527, column: 61, scope: !1867)
!1880 = !DILocation(line: 527, column: 18, scope: !1867)
!1881 = !DILocalVariable(name: "result", scope: !1867, file: !68, line: 527, type: !86)
!1882 = !DILocation(line: 530, column: 16, scope: !1883)
!1883 = distinct !DILexicalBlock(scope: !1867, file: !68, line: 530, column: 9)
!1884 = !DILocation(line: 531, column: 23, scope: !1885)
!1885 = distinct !DILexicalBlock(scope: !1883, file: !68, line: 530, column: 28)
!1886 = !DILocation(line: 531, column: 15, scope: !1885)
!1887 = !DILocation(line: 532, column: 23, scope: !1885)
!1888 = !DILocation(line: 532, column: 9, scope: !1885)
!1889 = !DILocation(line: 533, column: 5, scope: !1885)
!1890 = !DILocation(line: 536, column: 1, scope: !1867)
!1891 = distinct !DISubprogram(name: "pqmayo_MAYO_2_ref_mayo_verify", scope: !68, file: !68, line: 617, type: !1892, scopeLine: 619, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1892 = !DISubroutineType(types: !1893)
!1893 = !{!86, !264, !90, !58, !90, !90}
!1894 = !DILocalVariable(name: "p", arg: 1, scope: !1891, file: !68, line: 617, type: !264)
!1895 = !DILocation(line: 0, scope: !1891)
!1896 = !DILocalVariable(name: "m", arg: 2, scope: !1891, file: !68, line: 617, type: !90)
!1897 = !DILocalVariable(name: "mlen", arg: 3, scope: !1891, file: !68, line: 618, type: !58)
!1898 = !DILocalVariable(name: "sig", arg: 4, scope: !1891, file: !68, line: 618, type: !90)
!1899 = !DILocalVariable(name: "cpk", arg: 5, scope: !1891, file: !68, line: 619, type: !90)
!1900 = !DILocalVariable(name: "tEnc", scope: !1891, file: !68, line: 620, type: !184)
!1901 = !DILocation(line: 620, column: 19, scope: !1891)
!1902 = !DILocalVariable(name: "t", scope: !1891, file: !68, line: 621, type: !812)
!1903 = !DILocation(line: 621, column: 19, scope: !1891)
!1904 = !DILocalVariable(name: "y", scope: !1891, file: !68, line: 622, type: !1905)
!1905 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 1024, elements: !1906)
!1906 = !{!1907}
!1907 = !DISubrange(count: 128)
!1908 = !DILocation(line: 622, column: 19, scope: !1891)
!1909 = !DILocalVariable(name: "s", scope: !1891, file: !68, line: 623, type: !839)
!1910 = !DILocation(line: 623, column: 19, scope: !1891)
!1911 = !DILocalVariable(name: "pk", scope: !1891, file: !68, line: 624, type: !1912)
!1912 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 850176, elements: !1913)
!1913 = !{!1914}
!1914 = !DISubrange(count: 13284)
!1915 = !DILocation(line: 624, column: 14, scope: !1891)
!1916 = !DILocalVariable(name: "tmp", scope: !1891, file: !68, line: 625, type: !1917)
!1917 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 448, elements: !1918)
!1918 = !{!1919}
!1919 = !DISubrange(count: 56)
!1920 = !DILocation(line: 625, column: 19, scope: !1891)
!1921 = !DILocalVariable(name: "param_m", scope: !1891, file: !68, line: 627, type: !324)
!1922 = !DILocalVariable(name: "param_n", scope: !1891, file: !68, line: 628, type: !324)
!1923 = !DILocalVariable(name: "param_k", scope: !1891, file: !68, line: 629, type: !324)
!1924 = !DILocalVariable(name: "param_m_bytes", scope: !1891, file: !68, line: 630, type: !324)
!1925 = !DILocalVariable(name: "param_sig_bytes", scope: !1891, file: !68, line: 631, type: !324)
!1926 = !DILocalVariable(name: "param_digest_bytes", scope: !1891, file: !68, line: 632, type: !324)
!1927 = !DILocalVariable(name: "param_salt_bytes", scope: !1891, file: !68, line: 633, type: !324)
!1928 = !DILocation(line: 635, column: 15, scope: !1891)
!1929 = !DILocalVariable(name: "ret", scope: !1891, file: !68, line: 635, type: !86)
!1930 = !DILocation(line: 636, column: 13, scope: !1931)
!1931 = distinct !DILexicalBlock(scope: !1891, file: !68, line: 636, column: 9)
!1932 = !DILocalVariable(name: "P1", scope: !1891, file: !68, line: 640, type: !52)
!1933 = !DILocation(line: 641, column: 23, scope: !1891)
!1934 = !DILocalVariable(name: "P2", scope: !1891, file: !68, line: 641, type: !52)
!1935 = !DILocation(line: 642, column: 23, scope: !1891)
!1936 = !DILocalVariable(name: "P3", scope: !1891, file: !68, line: 642, type: !52)
!1937 = !DILocation(line: 657, column: 5, scope: !1891)
!1938 = !DILocation(line: 660, column: 16, scope: !1891)
!1939 = !DILocation(line: 660, column: 60, scope: !1891)
!1940 = !DILocation(line: 660, column: 5, scope: !1891)
!1941 = !DILocation(line: 662, column: 5, scope: !1891)
!1942 = !DILocation(line: 663, column: 5, scope: !1891)
!1943 = !DILocation(line: 666, column: 5, scope: !1891)
!1944 = !DILocation(line: 668, column: 5, scope: !1891)
!1945 = !DILocation(line: 670, column: 9, scope: !1946)
!1946 = distinct !DILexicalBlock(scope: !1891, file: !68, line: 670, column: 9)
!1947 = !DILocation(line: 670, column: 31, scope: !1946)
!1948 = !DILocation(line: 674, column: 1, scope: !1891)
!1949 = distinct !DISubprogram(name: "pqmayo_MAYO_2_ref_mayo_expand_pk", scope: !68, file: !68, line: 608, type: !1950, scopeLine: 609, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1950 = !DISubroutineType(types: !1951)
!1951 = !{!86, !264, !90, !52}
!1952 = !DILocalVariable(name: "p", arg: 1, scope: !1949, file: !68, line: 608, type: !264)
!1953 = !DILocation(line: 0, scope: !1949)
!1954 = !DILocalVariable(name: "cpk", arg: 2, scope: !1949, file: !68, line: 608, type: !90)
!1955 = !DILocalVariable(name: "pk", arg: 3, scope: !1949, file: !68, line: 609, type: !52)
!1956 = !DILocation(line: 610, column: 5, scope: !1949)
!1957 = !DILocation(line: 612, column: 23, scope: !1949)
!1958 = !DILocation(line: 612, column: 72, scope: !1949)
!1959 = !DILocation(line: 612, column: 5, scope: !1949)
!1960 = !DILocation(line: 614, column: 5, scope: !1949)
!1961 = distinct !DISubprogram(name: "eval_public_map", scope: !68, file: !68, line: 288, type: !1962, scopeLine: 288, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1962 = !DISubroutineType(types: !1963)
!1963 = !{null, !264, !90, !411, !411, !411, !61}
!1964 = !DILocalVariable(name: "p", arg: 1, scope: !1961, file: !68, line: 288, type: !264)
!1965 = !DILocation(line: 0, scope: !1961)
!1966 = !DILocalVariable(name: "s", arg: 2, scope: !1961, file: !68, line: 288, type: !90)
!1967 = !DILocalVariable(name: "P1", arg: 3, scope: !1961, file: !68, line: 288, type: !411)
!1968 = !DILocalVariable(name: "P2", arg: 4, scope: !1961, file: !68, line: 288, type: !411)
!1969 = !DILocalVariable(name: "P3", arg: 5, scope: !1961, file: !68, line: 288, type: !411)
!1970 = !DILocalVariable(name: "eval", arg: 6, scope: !1961, file: !68, line: 288, type: !61)
!1971 = !DILocalVariable(name: "SPS", scope: !1961, file: !68, line: 289, type: !1972)
!1972 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 4096, elements: !813)
!1973 = !DILocation(line: 289, column: 14, scope: !1961)
!1974 = !DILocation(line: 291, column: 5, scope: !1961)
!1975 = !DILocalVariable(name: "zero", scope: !1961, file: !68, line: 292, type: !812)
!1976 = !DILocation(line: 292, column: 19, scope: !1961)
!1977 = !DILocation(line: 293, column: 5, scope: !1961)
!1978 = !DILocation(line: 294, column: 1, scope: !1961)
!1979 = distinct !DISubprogram(name: "m_calculate_PS_SPS", scope: !408, file: !408, line: 277, type: !1980, scopeLine: 278, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1980 = !DISubroutineType(types: !1981)
!1981 = !{null, !264, !411, !411, !411, !90, !52}
!1982 = !DILocalVariable(name: "p", arg: 1, scope: !1979, file: !408, line: 277, type: !264)
!1983 = !DILocation(line: 0, scope: !1979)
!1984 = !DILocalVariable(name: "P1", arg: 2, scope: !1979, file: !408, line: 277, type: !411)
!1985 = !DILocalVariable(name: "P2", arg: 3, scope: !1979, file: !408, line: 277, type: !411)
!1986 = !DILocalVariable(name: "P3", arg: 4, scope: !1979, file: !408, line: 277, type: !411)
!1987 = !DILocalVariable(name: "s", arg: 5, scope: !1979, file: !408, line: 277, type: !90)
!1988 = !DILocalVariable(name: "SPS", arg: 6, scope: !1979, file: !408, line: 278, type: !52)
!1989 = !DILocalVariable(name: "PS", scope: !1979, file: !408, line: 286, type: !1990)
!1990 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 82944, elements: !1991)
!1991 = !{!1992}
!1992 = !DISubrange(count: 1296)
!1993 = !DILocation(line: 286, column: 14, scope: !1979)
!1994 = !DILocation(line: 287, column: 5, scope: !1979)
!1995 = !DILocation(line: 290, column: 5, scope: !1979)
!1996 = !DILocation(line: 292, column: 1, scope: !1979)
!1997 = distinct !DISubprogram(name: "mayo_generic_m_calculate_PS", scope: !408, file: !408, line: 151, type: !1998, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1998 = !DISubroutineType(types: !1999)
!1999 = !{null, !411, !411, !411, !90, !324, !324, !324, !324, !52}
!2000 = !DILocalVariable(name: "P1", arg: 1, scope: !1997, file: !408, line: 151, type: !411)
!2001 = !DILocation(line: 0, scope: !1997)
!2002 = !DILocalVariable(name: "P2", arg: 2, scope: !1997, file: !408, line: 151, type: !411)
!2003 = !DILocalVariable(name: "P3", arg: 3, scope: !1997, file: !408, line: 151, type: !411)
!2004 = !DILocalVariable(name: "S", arg: 4, scope: !1997, file: !408, line: 151, type: !90)
!2005 = !DILocalVariable(name: "m", arg: 5, scope: !1997, file: !408, line: 152, type: !324)
!2006 = !DILocalVariable(name: "v", arg: 6, scope: !1997, file: !408, line: 152, type: !324)
!2007 = !DILocalVariable(name: "o", arg: 7, scope: !1997, file: !408, line: 152, type: !324)
!2008 = !DILocalVariable(name: "k", arg: 8, scope: !1997, file: !408, line: 152, type: !324)
!2009 = !DILocalVariable(name: "PS", arg: 9, scope: !1997, file: !408, line: 152, type: !52)
!2010 = !DILocation(line: 154, column: 21, scope: !1997)
!2011 = !DILocalVariable(name: "n", scope: !1997, file: !408, line: 154, type: !324)
!2012 = !DILocation(line: 155, column: 32, scope: !1997)
!2013 = !DILocation(line: 155, column: 37, scope: !1997)
!2014 = !DILocalVariable(name: "m_vec_limbs", scope: !1997, file: !408, line: 155, type: !324)
!2015 = !DILocalVariable(name: "accumulator", scope: !1997, file: !408, line: 157, type: !2016)
!2016 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 1327104, elements: !2017)
!2017 = !{!2018}
!2018 = !DISubrange(count: 20736)
!2019 = !DILocation(line: 157, column: 14, scope: !1997)
!2020 = !DILocalVariable(name: "P1_used", scope: !1997, file: !408, line: 158, type: !86)
!2021 = !DILocalVariable(name: "row", scope: !2022, file: !408, line: 159, type: !86)
!2022 = distinct !DILexicalBlock(scope: !1997, file: !408, line: 159, column: 5)
!2023 = !DILocation(line: 0, scope: !2022)
!2024 = !DILocation(line: 159, column: 10, scope: !2022)
!2025 = !DILocation(line: 158, column: 9, scope: !1997)
!2026 = !DILocation(line: 159, scope: !2022)
!2027 = !DILocation(line: 159, column: 27, scope: !2028)
!2028 = distinct !DILexicalBlock(scope: !2022, file: !408, line: 159, column: 5)
!2029 = !DILocation(line: 159, column: 5, scope: !2022)
!2030 = !DILocation(line: 160, column: 9, scope: !2031)
!2031 = distinct !DILexicalBlock(scope: !2032, file: !408, line: 160, column: 9)
!2032 = distinct !DILexicalBlock(scope: !2028, file: !408, line: 159, column: 39)
!2033 = !DILocation(line: 175, column: 5, scope: !2034)
!2034 = distinct !DILexicalBlock(scope: !1997, file: !408, line: 175, column: 5)
!2035 = !DILocation(line: 160, scope: !2031)
!2036 = !DILocalVariable(name: "j", scope: !2031, file: !408, line: 160, type: !86)
!2037 = !DILocation(line: 0, scope: !2031)
!2038 = !DILocation(line: 160, column: 29, scope: !2039)
!2039 = distinct !DILexicalBlock(scope: !2031, file: !408, line: 160, column: 9)
!2040 = !DILocation(line: 161, scope: !2041)
!2041 = distinct !DILexicalBlock(scope: !2042, file: !408, line: 161, column: 13)
!2042 = distinct !DILexicalBlock(scope: !2039, file: !408, line: 160, column: 39)
!2043 = !DILocalVariable(name: "col", scope: !2041, file: !408, line: 161, type: !86)
!2044 = !DILocation(line: 0, scope: !2041)
!2045 = !DILocation(line: 161, column: 35, scope: !2046)
!2046 = distinct !DILexicalBlock(scope: !2041, file: !408, line: 161, column: 13)
!2047 = !DILocation(line: 161, column: 13, scope: !2041)
!2048 = !DILocation(line: 162, column: 54, scope: !2049)
!2049 = distinct !DILexicalBlock(scope: !2046, file: !408, line: 161, column: 47)
!2050 = !DILocation(line: 162, column: 43, scope: !2049)
!2051 = !DILocation(line: 162, column: 91, scope: !2049)
!2052 = !DILocation(line: 162, column: 95, scope: !2049)
!2053 = !DILocation(line: 162, column: 102, scope: !2049)
!2054 = !DILocation(line: 162, column: 115, scope: !2049)
!2055 = !DILocation(line: 162, column: 109, scope: !2049)
!2056 = !DILocation(line: 162, column: 107, scope: !2049)
!2057 = !DILocation(line: 162, column: 125, scope: !2049)
!2058 = !DILocation(line: 162, column: 82, scope: !2049)
!2059 = !DILocation(line: 162, column: 17, scope: !2049)
!2060 = !DILocation(line: 161, column: 43, scope: !2046)
!2061 = !DILocation(line: 161, column: 13, scope: !2046)
!2062 = distinct !{!2062, !2047, !2063, !388}
!2063 = !DILocation(line: 163, column: 13, scope: !2041)
!2064 = !DILocation(line: 164, column: 21, scope: !2042)
!2065 = !DILocation(line: 160, column: 35, scope: !2039)
!2066 = !DILocation(line: 160, column: 9, scope: !2039)
!2067 = distinct !{!2067, !2030, !2068, !388}
!2068 = !DILocation(line: 165, column: 9, scope: !2031)
!2069 = !DILocation(line: 167, scope: !2070)
!2070 = distinct !DILexicalBlock(scope: !2032, file: !408, line: 167, column: 9)
!2071 = !DILocalVariable(name: "j", scope: !2070, file: !408, line: 167, type: !86)
!2072 = !DILocation(line: 0, scope: !2070)
!2073 = !DILocation(line: 167, column: 27, scope: !2074)
!2074 = distinct !DILexicalBlock(scope: !2070, file: !408, line: 167, column: 9)
!2075 = !DILocation(line: 167, column: 9, scope: !2070)
!2076 = !DILocation(line: 168, scope: !2077)
!2077 = distinct !DILexicalBlock(scope: !2078, file: !408, line: 168, column: 13)
!2078 = distinct !DILexicalBlock(scope: !2074, file: !408, line: 167, column: 37)
!2079 = !DILocalVariable(name: "col", scope: !2077, file: !408, line: 168, type: !86)
!2080 = !DILocation(line: 0, scope: !2077)
!2081 = !DILocation(line: 168, column: 35, scope: !2082)
!2082 = distinct !DILexicalBlock(scope: !2077, file: !408, line: 168, column: 13)
!2083 = !DILocation(line: 168, column: 13, scope: !2077)
!2084 = !DILocation(line: 169, column: 50, scope: !2085)
!2085 = distinct !DILexicalBlock(scope: !2082, file: !408, line: 168, column: 47)
!2086 = !DILocation(line: 169, column: 54, scope: !2085)
!2087 = !DILocation(line: 169, column: 58, scope: !2085)
!2088 = !DILocation(line: 169, column: 43, scope: !2085)
!2089 = !DILocation(line: 169, column: 93, scope: !2085)
!2090 = !DILocation(line: 169, column: 97, scope: !2085)
!2091 = !DILocation(line: 169, column: 104, scope: !2085)
!2092 = !DILocation(line: 169, column: 118, scope: !2085)
!2093 = !DILocation(line: 169, column: 111, scope: !2085)
!2094 = !DILocation(line: 169, column: 109, scope: !2085)
!2095 = !DILocation(line: 169, column: 133, scope: !2085)
!2096 = !DILocation(line: 169, column: 84, scope: !2085)
!2097 = !DILocation(line: 169, column: 17, scope: !2085)
!2098 = !DILocation(line: 168, column: 43, scope: !2082)
!2099 = !DILocation(line: 168, column: 13, scope: !2082)
!2100 = distinct !{!2100, !2083, !2101, !388}
!2101 = !DILocation(line: 170, column: 13, scope: !2077)
!2102 = !DILocation(line: 167, column: 33, scope: !2074)
!2103 = !DILocation(line: 167, column: 9, scope: !2074)
!2104 = distinct !{!2104, !2075, !2105, !388}
!2105 = !DILocation(line: 171, column: 9, scope: !2070)
!2106 = !DILocation(line: 159, column: 35, scope: !2028)
!2107 = !DILocation(line: 159, column: 5, scope: !2028)
!2108 = distinct !{!2108, !2029, !2109, !388}
!2109 = !DILocation(line: 172, column: 5, scope: !2022)
!2110 = !DILocation(line: 174, column: 9, scope: !1997)
!2111 = !DILocation(line: 175, scope: !2034)
!2112 = !DILocalVariable(name: "row", scope: !2034, file: !408, line: 175, type: !86)
!2113 = !DILocation(line: 0, scope: !2034)
!2114 = !DILocalVariable(name: "P3_used", scope: !1997, file: !408, line: 174, type: !86)
!2115 = !DILocation(line: 175, column: 27, scope: !2116)
!2116 = distinct !DILexicalBlock(scope: !2034, file: !408, line: 175, column: 5)
!2117 = !DILocation(line: 186, column: 5, scope: !1997)
!2118 = !DILocation(line: 176, scope: !2119)
!2119 = distinct !DILexicalBlock(scope: !2120, file: !408, line: 176, column: 9)
!2120 = distinct !DILexicalBlock(scope: !2116, file: !408, line: 175, column: 39)
!2121 = !DILocalVariable(name: "j", scope: !2119, file: !408, line: 176, type: !86)
!2122 = !DILocation(line: 0, scope: !2119)
!2123 = !DILocation(line: 176, column: 29, scope: !2124)
!2124 = distinct !DILexicalBlock(scope: !2119, file: !408, line: 176, column: 9)
!2125 = !DILocation(line: 176, column: 9, scope: !2119)
!2126 = !DILocation(line: 177, scope: !2127)
!2127 = distinct !DILexicalBlock(scope: !2128, file: !408, line: 177, column: 13)
!2128 = distinct !DILexicalBlock(scope: !2124, file: !408, line: 176, column: 39)
!2129 = !DILocalVariable(name: "col", scope: !2127, file: !408, line: 177, type: !86)
!2130 = !DILocation(line: 0, scope: !2127)
!2131 = !DILocation(line: 177, column: 35, scope: !2132)
!2132 = distinct !DILexicalBlock(scope: !2127, file: !408, line: 177, column: 13)
!2133 = !DILocation(line: 177, column: 13, scope: !2127)
!2134 = !DILocation(line: 178, column: 53, scope: !2135)
!2135 = distinct !DILexicalBlock(scope: !2132, file: !408, line: 177, column: 47)
!2136 = !DILocation(line: 178, column: 43, scope: !2135)
!2137 = !DILocation(line: 178, column: 89, scope: !2135)
!2138 = !DILocation(line: 178, column: 93, scope: !2135)
!2139 = !DILocation(line: 178, column: 100, scope: !2135)
!2140 = !DILocation(line: 178, column: 113, scope: !2135)
!2141 = !DILocation(line: 178, column: 107, scope: !2135)
!2142 = !DILocation(line: 178, column: 105, scope: !2135)
!2143 = !DILocation(line: 178, column: 123, scope: !2135)
!2144 = !DILocation(line: 178, column: 80, scope: !2135)
!2145 = !DILocation(line: 178, column: 17, scope: !2135)
!2146 = !DILocation(line: 177, column: 43, scope: !2132)
!2147 = !DILocation(line: 177, column: 13, scope: !2132)
!2148 = distinct !{!2148, !2133, !2149, !388}
!2149 = !DILocation(line: 179, column: 13, scope: !2127)
!2150 = !DILocation(line: 180, column: 21, scope: !2128)
!2151 = !DILocation(line: 176, column: 35, scope: !2124)
!2152 = !DILocation(line: 176, column: 9, scope: !2124)
!2153 = distinct !{!2153, !2125, !2154, !388}
!2154 = !DILocation(line: 181, column: 9, scope: !2119)
!2155 = !DILocation(line: 175, column: 35, scope: !2116)
!2156 = !DILocation(line: 175, column: 5, scope: !2116)
!2157 = distinct !{!2157, !2033, !2158, !388}
!2158 = !DILocation(line: 182, column: 5, scope: !2034)
!2159 = !DILocalVariable(name: "i", scope: !1997, file: !408, line: 185, type: !86)
!2160 = !DILocation(line: 186, column: 14, scope: !1997)
!2161 = !DILocation(line: 187, column: 58, scope: !2162)
!2162 = distinct !DILexicalBlock(scope: !1997, file: !408, line: 186, column: 23)
!2163 = !DILocation(line: 187, column: 63, scope: !2162)
!2164 = !DILocation(line: 187, column: 54, scope: !2162)
!2165 = !DILocation(line: 187, column: 85, scope: !2162)
!2166 = !DILocation(line: 187, column: 81, scope: !2162)
!2167 = !DILocation(line: 187, column: 9, scope: !2162)
!2168 = !DILocation(line: 188, column: 10, scope: !2162)
!2169 = distinct !{!2169, !2117, !2170, !388}
!2170 = !DILocation(line: 189, column: 5, scope: !1997)
!2171 = !DILocation(line: 191, column: 1, scope: !1997)
!2172 = distinct !DISubprogram(name: "mayo_generic_m_calculate_SPS", scope: !408, file: !408, line: 195, type: !2173, scopeLine: 195, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2173 = !DISubroutineType(types: !2174)
!2174 = !{null, !411, !90, !86, !86, !86, !52}
!2175 = !DILocalVariable(name: "PS", arg: 1, scope: !2172, file: !408, line: 195, type: !411)
!2176 = !DILocation(line: 0, scope: !2172)
!2177 = !DILocalVariable(name: "S", arg: 2, scope: !2172, file: !408, line: 195, type: !90)
!2178 = !DILocalVariable(name: "m", arg: 3, scope: !2172, file: !408, line: 195, type: !86)
!2179 = !DILocalVariable(name: "k", arg: 4, scope: !2172, file: !408, line: 195, type: !86)
!2180 = !DILocalVariable(name: "n", arg: 5, scope: !2172, file: !408, line: 195, type: !86)
!2181 = !DILocalVariable(name: "SPS", arg: 6, scope: !2172, file: !408, line: 195, type: !52)
!2182 = !DILocalVariable(name: "accumulator", scope: !2172, file: !408, line: 196, type: !1011)
!2183 = !DILocation(line: 196, column: 14, scope: !2172)
!2184 = !DILocation(line: 197, column: 32, scope: !2172)
!2185 = !DILocation(line: 197, column: 37, scope: !2172)
!2186 = !DILocalVariable(name: "m_vec_limbs", scope: !2172, file: !408, line: 197, type: !324)
!2187 = !DILocalVariable(name: "row", scope: !2188, file: !408, line: 198, type: !86)
!2188 = distinct !DILexicalBlock(scope: !2172, file: !408, line: 198, column: 5)
!2189 = !DILocation(line: 0, scope: !2188)
!2190 = !DILocation(line: 198, column: 10, scope: !2188)
!2191 = !DILocation(line: 198, scope: !2188)
!2192 = !DILocation(line: 198, column: 27, scope: !2193)
!2193 = distinct !DILexicalBlock(scope: !2188, file: !408, line: 198, column: 5)
!2194 = !DILocation(line: 198, column: 5, scope: !2188)
!2195 = !DILocation(line: 208, column: 5, scope: !2172)
!2196 = !DILocation(line: 199, scope: !2197)
!2197 = distinct !DILexicalBlock(scope: !2198, file: !408, line: 199, column: 9)
!2198 = distinct !DILexicalBlock(scope: !2193, file: !408, line: 198, column: 39)
!2199 = !DILocalVariable(name: "j", scope: !2197, file: !408, line: 199, type: !86)
!2200 = !DILocation(line: 0, scope: !2197)
!2201 = !DILocation(line: 199, column: 27, scope: !2202)
!2202 = distinct !DILexicalBlock(scope: !2197, file: !408, line: 199, column: 9)
!2203 = !DILocation(line: 199, column: 9, scope: !2197)
!2204 = !DILocation(line: 200, scope: !2205)
!2205 = distinct !DILexicalBlock(scope: !2206, file: !408, line: 200, column: 13)
!2206 = distinct !DILexicalBlock(scope: !2202, file: !408, line: 199, column: 37)
!2207 = !DILocalVariable(name: "col", scope: !2205, file: !408, line: 200, type: !86)
!2208 = !DILocation(line: 0, scope: !2205)
!2209 = !DILocation(line: 200, column: 35, scope: !2210)
!2210 = distinct !DILexicalBlock(scope: !2205, file: !408, line: 200, column: 13)
!2211 = !DILocation(line: 200, column: 13, scope: !2205)
!2212 = !DILocation(line: 201, column: 52, scope: !2213)
!2213 = distinct !DILexicalBlock(scope: !2210, file: !408, line: 200, column: 50)
!2214 = !DILocation(line: 201, column: 56, scope: !2213)
!2215 = !DILocation(line: 201, column: 63, scope: !2213)
!2216 = !DILocation(line: 201, column: 47, scope: !2213)
!2217 = !DILocation(line: 201, column: 99, scope: !2213)
!2218 = !DILocation(line: 201, column: 103, scope: !2213)
!2219 = !DILocation(line: 201, column: 110, scope: !2213)
!2220 = !DILocation(line: 201, column: 123, scope: !2213)
!2221 = !DILocation(line: 201, column: 117, scope: !2213)
!2222 = !DILocation(line: 201, column: 115, scope: !2213)
!2223 = !DILocation(line: 201, column: 133, scope: !2213)
!2224 = !DILocation(line: 201, column: 90, scope: !2213)
!2225 = !DILocation(line: 201, column: 21, scope: !2213)
!2226 = !DILocation(line: 200, column: 44, scope: !2210)
!2227 = !DILocation(line: 200, column: 13, scope: !2210)
!2228 = distinct !{!2228, !2211, !2229, !388}
!2229 = !DILocation(line: 202, column: 13, scope: !2205)
!2230 = !DILocation(line: 199, column: 33, scope: !2202)
!2231 = !DILocation(line: 199, column: 9, scope: !2202)
!2232 = distinct !{!2232, !2203, !2233, !388}
!2233 = !DILocation(line: 203, column: 9, scope: !2197)
!2234 = !DILocation(line: 198, column: 35, scope: !2193)
!2235 = !DILocation(line: 198, column: 5, scope: !2193)
!2236 = distinct !{!2236, !2194, !2237, !388}
!2237 = !DILocation(line: 204, column: 5, scope: !2188)
!2238 = !DILocalVariable(name: "i", scope: !2172, file: !408, line: 207, type: !86)
!2239 = !DILocation(line: 208, column: 14, scope: !2172)
!2240 = !DILocation(line: 209, column: 58, scope: !2241)
!2241 = distinct !DILexicalBlock(scope: !2172, file: !408, line: 208, column: 21)
!2242 = !DILocation(line: 209, column: 63, scope: !2241)
!2243 = !DILocation(line: 209, column: 54, scope: !2241)
!2244 = !DILocation(line: 209, column: 86, scope: !2241)
!2245 = !DILocation(line: 209, column: 82, scope: !2241)
!2246 = !DILocation(line: 209, column: 9, scope: !2241)
!2247 = !DILocation(line: 210, column: 10, scope: !2241)
!2248 = distinct !{!2248, !2195, !2249, !388}
!2249 = !DILocation(line: 211, column: 5, scope: !2172)
!2250 = !DILocation(line: 212, column: 1, scope: !2172)
!2251 = distinct !DISubprogram(name: "m_vec_add", scope: !529, file: !529, line: 22, type: !2252, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2252 = !DISubroutineType(types: !2253)
!2253 = !{null, !86, !411, !52}
!2254 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2251, file: !529, line: 22, type: !86)
!2255 = !DILocation(line: 0, scope: !2251)
!2256 = !DILocalVariable(name: "in", arg: 2, scope: !2251, file: !529, line: 22, type: !411)
!2257 = !DILocalVariable(name: "acc", arg: 3, scope: !2251, file: !529, line: 22, type: !52)
!2258 = !DILocalVariable(name: "i", scope: !2259, file: !529, line: 24, type: !58)
!2259 = distinct !DILexicalBlock(scope: !2251, file: !529, line: 24, column: 5)
!2260 = !DILocation(line: 0, scope: !2259)
!2261 = !DILocation(line: 26, column: 19, scope: !2262)
!2262 = distinct !DILexicalBlock(scope: !2263, file: !529, line: 25, column: 5)
!2263 = distinct !DILexicalBlock(scope: !2259, file: !529, line: 24, column: 5)
!2264 = !DILocation(line: 26, column: 16, scope: !2262)
!2265 = !DILocation(line: 26, column: 9, scope: !2262)
!2266 = !DILocation(line: 28, column: 1, scope: !2251)
!2267 = distinct !DISubprogram(name: "m_vec_multiply_bins", scope: !529, file: !529, line: 66, type: !2268, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2268 = !DISubroutineType(types: !2269)
!2269 = !{null, !86, !52, !52}
!2270 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2267, file: !529, line: 66, type: !86)
!2271 = !DILocation(line: 0, scope: !2267)
!2272 = !DILocalVariable(name: "bins", arg: 2, scope: !2267, file: !529, line: 66, type: !52)
!2273 = !DILocalVariable(name: "out", arg: 3, scope: !2267, file: !529, line: 66, type: !52)
!2274 = !DILocation(line: 67, column: 44, scope: !2267)
!2275 = !DILocation(line: 67, column: 73, scope: !2267)
!2276 = !DILocation(line: 67, column: 5, scope: !2267)
!2277 = !DILocation(line: 68, column: 40, scope: !2267)
!2278 = !DILocation(line: 68, column: 69, scope: !2267)
!2279 = !DILocation(line: 68, column: 5, scope: !2267)
!2280 = !DILocation(line: 69, column: 44, scope: !2267)
!2281 = !DILocation(line: 69, column: 74, scope: !2267)
!2282 = !DILocation(line: 69, column: 5, scope: !2267)
!2283 = !DILocation(line: 70, column: 40, scope: !2267)
!2284 = !DILocation(line: 70, column: 69, scope: !2267)
!2285 = !DILocation(line: 70, column: 5, scope: !2267)
!2286 = !DILocation(line: 71, column: 44, scope: !2267)
!2287 = !DILocation(line: 71, column: 73, scope: !2267)
!2288 = !DILocation(line: 71, column: 5, scope: !2267)
!2289 = !DILocation(line: 72, column: 40, scope: !2267)
!2290 = !DILocation(line: 72, column: 69, scope: !2267)
!2291 = !DILocation(line: 72, column: 5, scope: !2267)
!2292 = !DILocation(line: 73, column: 44, scope: !2267)
!2293 = !DILocation(line: 73, column: 74, scope: !2267)
!2294 = !DILocation(line: 73, column: 5, scope: !2267)
!2295 = !DILocation(line: 74, column: 40, scope: !2267)
!2296 = !DILocation(line: 74, column: 69, scope: !2267)
!2297 = !DILocation(line: 74, column: 5, scope: !2267)
!2298 = !DILocation(line: 75, column: 44, scope: !2267)
!2299 = !DILocation(line: 75, column: 74, scope: !2267)
!2300 = !DILocation(line: 75, column: 5, scope: !2267)
!2301 = !DILocation(line: 76, column: 40, scope: !2267)
!2302 = !DILocation(line: 76, column: 69, scope: !2267)
!2303 = !DILocation(line: 76, column: 5, scope: !2267)
!2304 = !DILocation(line: 77, column: 44, scope: !2267)
!2305 = !DILocation(line: 77, column: 74, scope: !2267)
!2306 = !DILocation(line: 77, column: 5, scope: !2267)
!2307 = !DILocation(line: 78, column: 40, scope: !2267)
!2308 = !DILocation(line: 78, column: 69, scope: !2267)
!2309 = !DILocation(line: 78, column: 5, scope: !2267)
!2310 = !DILocation(line: 79, column: 44, scope: !2267)
!2311 = !DILocation(line: 79, column: 74, scope: !2267)
!2312 = !DILocation(line: 79, column: 5, scope: !2267)
!2313 = !DILocation(line: 80, column: 40, scope: !2267)
!2314 = !DILocation(line: 80, column: 69, scope: !2267)
!2315 = !DILocation(line: 80, column: 5, scope: !2267)
!2316 = !DILocation(line: 81, column: 35, scope: !2267)
!2317 = !DILocation(line: 81, column: 5, scope: !2267)
!2318 = !DILocation(line: 82, column: 1, scope: !2267)
!2319 = distinct !DISubprogram(name: "m_vec_mul_add_x_inv", scope: !529, file: !529, line: 56, type: !2252, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2320 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2319, file: !529, line: 56, type: !86)
!2321 = !DILocation(line: 0, scope: !2319)
!2322 = !DILocalVariable(name: "in", arg: 2, scope: !2319, file: !529, line: 56, type: !411)
!2323 = !DILocalVariable(name: "acc", arg: 3, scope: !2319, file: !529, line: 56, type: !52)
!2324 = !DILocalVariable(name: "mask_lsb", scope: !2319, file: !529, line: 58, type: !53)
!2325 = !DILocalVariable(name: "i", scope: !2326, file: !529, line: 59, type: !86)
!2326 = distinct !DILexicalBlock(scope: !2319, file: !529, line: 59, column: 5)
!2327 = !DILocation(line: 0, scope: !2326)
!2328 = !DILocation(line: 60, column: 22, scope: !2329)
!2329 = distinct !DILexicalBlock(scope: !2330, file: !529, line: 59, column: 43)
!2330 = distinct !DILexicalBlock(scope: !2326, file: !529, line: 59, column: 5)
!2331 = !DILocation(line: 60, column: 28, scope: !2329)
!2332 = !DILocalVariable(name: "t", scope: !2329, file: !529, line: 60, type: !53)
!2333 = !DILocation(line: 0, scope: !2329)
!2334 = !DILocation(line: 61, column: 32, scope: !2329)
!2335 = !DILocation(line: 61, column: 43, scope: !2329)
!2336 = !DILocation(line: 61, column: 38, scope: !2329)
!2337 = !DILocation(line: 61, column: 16, scope: !2329)
!2338 = !DILocation(line: 61, column: 9, scope: !2329)
!2339 = !DILocation(line: 63, column: 1, scope: !2319)
!2340 = distinct !DISubprogram(name: "m_vec_mul_add_x", scope: !529, file: !529, line: 46, type: !2252, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2341 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2340, file: !529, line: 46, type: !86)
!2342 = !DILocation(line: 0, scope: !2340)
!2343 = !DILocalVariable(name: "in", arg: 2, scope: !2340, file: !529, line: 46, type: !411)
!2344 = !DILocalVariable(name: "acc", arg: 3, scope: !2340, file: !529, line: 46, type: !52)
!2345 = !DILocalVariable(name: "mask_msb", scope: !2340, file: !529, line: 48, type: !53)
!2346 = !DILocalVariable(name: "i", scope: !2347, file: !529, line: 49, type: !86)
!2347 = distinct !DILexicalBlock(scope: !2340, file: !529, line: 49, column: 5)
!2348 = !DILocation(line: 0, scope: !2347)
!2349 = !DILocation(line: 50, column: 22, scope: !2350)
!2350 = distinct !DILexicalBlock(scope: !2351, file: !529, line: 49, column: 43)
!2351 = distinct !DILexicalBlock(scope: !2347, file: !529, line: 49, column: 5)
!2352 = !DILocalVariable(name: "t", scope: !2350, file: !529, line: 50, type: !53)
!2353 = !DILocation(line: 0, scope: !2350)
!2354 = !DILocation(line: 51, column: 32, scope: !2350)
!2355 = !DILocation(line: 51, column: 44, scope: !2350)
!2356 = !DILocation(line: 51, column: 50, scope: !2350)
!2357 = !DILocation(line: 51, column: 38, scope: !2350)
!2358 = !DILocation(line: 51, column: 16, scope: !2350)
!2359 = !DILocation(line: 51, column: 9, scope: !2350)
!2360 = !DILocation(line: 53, column: 1, scope: !2340)
!2361 = distinct !DISubprogram(name: "m_vec_copy", scope: !529, file: !529, line: 13, type: !2252, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2362 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2361, file: !529, line: 13, type: !86)
!2363 = !DILocation(line: 0, scope: !2361)
!2364 = !DILocalVariable(name: "in", arg: 2, scope: !2361, file: !529, line: 13, type: !411)
!2365 = !DILocalVariable(name: "out", arg: 3, scope: !2361, file: !529, line: 13, type: !52)
!2366 = !DILocalVariable(name: "i", scope: !2367, file: !529, line: 15, type: !58)
!2367 = distinct !DILexicalBlock(scope: !2361, file: !529, line: 15, column: 5)
!2368 = !DILocation(line: 0, scope: !2367)
!2369 = !DILocation(line: 17, column: 18, scope: !2370)
!2370 = distinct !DILexicalBlock(scope: !2371, file: !529, line: 16, column: 5)
!2371 = distinct !DILexicalBlock(scope: !2367, file: !529, line: 15, column: 5)
!2372 = !DILocation(line: 17, column: 16, scope: !2370)
!2373 = !DILocation(line: 17, column: 9, scope: !2370)
!2374 = !DILocation(line: 19, column: 1, scope: !2361)
!2375 = distinct !DISubprogram(name: "pqmayo_MAYO_2_ref_m_upper", scope: !99, file: !99, line: 14, type: !2376, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !71)
!2376 = !DISubroutineType(types: !2377)
!2377 = !{null, !2378, !411, !52, !86}
!2378 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2379, size: 32)
!2379 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2380)
!2380 = !DIDerivedType(tag: DW_TAG_typedef, name: "mayo_params_t", file: !79, line: 289, baseType: !2381)
!2381 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !79, line: 265, size: 736, elements: !2382)
!2382 = !{!2383, !2384, !2385, !2386, !2387, !2388, !2389, !2390, !2391, !2392, !2393, !2394, !2395, !2396, !2397, !2398, !2399, !2400, !2401, !2402, !2403, !2404, !2405}
!2383 = !DIDerivedType(tag: DW_TAG_member, name: "m", scope: !2381, file: !79, line: 266, baseType: !86, size: 32)
!2384 = !DIDerivedType(tag: DW_TAG_member, name: "n", scope: !2381, file: !79, line: 267, baseType: !86, size: 32, offset: 32)
!2385 = !DIDerivedType(tag: DW_TAG_member, name: "o", scope: !2381, file: !79, line: 268, baseType: !86, size: 32, offset: 64)
!2386 = !DIDerivedType(tag: DW_TAG_member, name: "k", scope: !2381, file: !79, line: 269, baseType: !86, size: 32, offset: 96)
!2387 = !DIDerivedType(tag: DW_TAG_member, name: "q", scope: !2381, file: !79, line: 270, baseType: !86, size: 32, offset: 128)
!2388 = !DIDerivedType(tag: DW_TAG_member, name: "f_tail", scope: !2381, file: !79, line: 271, baseType: !90, size: 32, offset: 160)
!2389 = !DIDerivedType(tag: DW_TAG_member, name: "m_bytes", scope: !2381, file: !79, line: 272, baseType: !86, size: 32, offset: 192)
!2390 = !DIDerivedType(tag: DW_TAG_member, name: "O_bytes", scope: !2381, file: !79, line: 273, baseType: !86, size: 32, offset: 224)
!2391 = !DIDerivedType(tag: DW_TAG_member, name: "v_bytes", scope: !2381, file: !79, line: 274, baseType: !86, size: 32, offset: 256)
!2392 = !DIDerivedType(tag: DW_TAG_member, name: "r_bytes", scope: !2381, file: !79, line: 275, baseType: !86, size: 32, offset: 288)
!2393 = !DIDerivedType(tag: DW_TAG_member, name: "R_bytes", scope: !2381, file: !79, line: 276, baseType: !86, size: 32, offset: 320)
!2394 = !DIDerivedType(tag: DW_TAG_member, name: "P1_bytes", scope: !2381, file: !79, line: 277, baseType: !86, size: 32, offset: 352)
!2395 = !DIDerivedType(tag: DW_TAG_member, name: "P2_bytes", scope: !2381, file: !79, line: 278, baseType: !86, size: 32, offset: 384)
!2396 = !DIDerivedType(tag: DW_TAG_member, name: "P3_bytes", scope: !2381, file: !79, line: 279, baseType: !86, size: 32, offset: 416)
!2397 = !DIDerivedType(tag: DW_TAG_member, name: "csk_bytes", scope: !2381, file: !79, line: 280, baseType: !86, size: 32, offset: 448)
!2398 = !DIDerivedType(tag: DW_TAG_member, name: "cpk_bytes", scope: !2381, file: !79, line: 281, baseType: !86, size: 32, offset: 480)
!2399 = !DIDerivedType(tag: DW_TAG_member, name: "sig_bytes", scope: !2381, file: !79, line: 282, baseType: !86, size: 32, offset: 512)
!2400 = !DIDerivedType(tag: DW_TAG_member, name: "salt_bytes", scope: !2381, file: !79, line: 283, baseType: !86, size: 32, offset: 544)
!2401 = !DIDerivedType(tag: DW_TAG_member, name: "sk_seed_bytes", scope: !2381, file: !79, line: 284, baseType: !86, size: 32, offset: 576)
!2402 = !DIDerivedType(tag: DW_TAG_member, name: "digest_bytes", scope: !2381, file: !79, line: 285, baseType: !86, size: 32, offset: 608)
!2403 = !DIDerivedType(tag: DW_TAG_member, name: "pk_seed_bytes", scope: !2381, file: !79, line: 286, baseType: !86, size: 32, offset: 640)
!2404 = !DIDerivedType(tag: DW_TAG_member, name: "m_vec_limbs", scope: !2381, file: !79, line: 287, baseType: !86, size: 32, offset: 672)
!2405 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !2381, file: !79, line: 288, baseType: !149, size: 32, offset: 704)
!2406 = !DILocalVariable(name: "p", arg: 1, scope: !2375, file: !99, line: 14, type: !2378)
!2407 = !DILocation(line: 0, scope: !2375)
!2408 = !DILocalVariable(name: "in", arg: 2, scope: !2375, file: !99, line: 14, type: !411)
!2409 = !DILocalVariable(name: "out", arg: 3, scope: !2375, file: !99, line: 14, type: !52)
!2410 = !DILocalVariable(name: "size", arg: 4, scope: !2375, file: !99, line: 14, type: !86)
!2411 = !DILocalVariable(name: "m_vec_limbs", scope: !2375, file: !99, line: 19, type: !324)
!2412 = !DILocalVariable(name: "m_vecs_stored", scope: !2375, file: !99, line: 20, type: !86)
!2413 = !DILocalVariable(name: "r", scope: !2414, file: !99, line: 21, type: !86)
!2414 = distinct !DILexicalBlock(scope: !2375, file: !99, line: 21, column: 5)
!2415 = !DILocation(line: 0, scope: !2414)
!2416 = !DILocation(line: 21, column: 10, scope: !2414)
!2417 = !DILocation(line: 20, column: 9, scope: !2375)
!2418 = !DILocation(line: 21, scope: !2414)
!2419 = !DILocation(line: 21, column: 23, scope: !2420)
!2420 = distinct !DILexicalBlock(scope: !2414, file: !99, line: 21, column: 5)
!2421 = !DILocation(line: 21, column: 5, scope: !2414)
!2422 = !DILocation(line: 22, column: 9, scope: !2423)
!2423 = distinct !DILexicalBlock(scope: !2424, file: !99, line: 22, column: 9)
!2424 = distinct !DILexicalBlock(scope: !2420, file: !99, line: 21, column: 36)
!2425 = !DILocation(line: 22, scope: !2423)
!2426 = !DILocalVariable(name: "c", scope: !2423, file: !99, line: 22, type: !86)
!2427 = !DILocation(line: 0, scope: !2423)
!2428 = !DILocation(line: 22, column: 27, scope: !2429)
!2429 = distinct !DILexicalBlock(scope: !2423, file: !99, line: 22, column: 9)
!2430 = !DILocation(line: 23, column: 59, scope: !2431)
!2431 = distinct !DILexicalBlock(scope: !2429, file: !99, line: 22, column: 40)
!2432 = !DILocation(line: 23, column: 66, scope: !2431)
!2433 = !DILocation(line: 23, column: 40, scope: !2431)
!2434 = !DILocation(line: 23, column: 76, scope: !2431)
!2435 = !DILocation(line: 23, column: 13, scope: !2431)
!2436 = !DILocation(line: 24, column: 19, scope: !2437)
!2437 = distinct !DILexicalBlock(scope: !2431, file: !99, line: 24, column: 17)
!2438 = !DILocation(line: 25, column: 62, scope: !2439)
!2439 = distinct !DILexicalBlock(scope: !2437, file: !99, line: 24, column: 25)
!2440 = !DILocation(line: 25, column: 69, scope: !2439)
!2441 = !DILocation(line: 25, column: 43, scope: !2439)
!2442 = !DILocation(line: 25, column: 79, scope: !2439)
!2443 = !DILocation(line: 25, column: 17, scope: !2439)
!2444 = !DILocation(line: 26, column: 13, scope: !2439)
!2445 = !DILocation(line: 27, column: 27, scope: !2431)
!2446 = !DILocation(line: 22, column: 36, scope: !2429)
!2447 = !DILocation(line: 22, column: 9, scope: !2429)
!2448 = distinct !{!2448, !2422, !2449, !388}
!2449 = !DILocation(line: 28, column: 9, scope: !2423)
!2450 = !DILocation(line: 21, column: 32, scope: !2420)
!2451 = !DILocation(line: 21, column: 5, scope: !2420)
!2452 = distinct !{!2452, !2421, !2453, !388}
!2453 = !DILocation(line: 29, column: 5, scope: !2414)
!2454 = !DILocation(line: 30, column: 1, scope: !2375)
!2455 = distinct !DISubprogram(name: "m_vec_copy", scope: !529, file: !529, line: 13, type: !2252, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!2456 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2455, file: !529, line: 13, type: !86)
!2457 = !DILocation(line: 0, scope: !2455)
!2458 = !DILocalVariable(name: "in", arg: 2, scope: !2455, file: !529, line: 13, type: !411)
!2459 = !DILocalVariable(name: "out", arg: 3, scope: !2455, file: !529, line: 13, type: !52)
!2460 = !DILocalVariable(name: "i", scope: !2461, file: !529, line: 15, type: !58)
!2461 = distinct !DILexicalBlock(scope: !2455, file: !529, line: 15, column: 5)
!2462 = !DILocation(line: 0, scope: !2461)
!2463 = !DILocation(line: 17, column: 18, scope: !2464)
!2464 = distinct !DILexicalBlock(scope: !2465, file: !529, line: 16, column: 5)
!2465 = distinct !DILexicalBlock(scope: !2461, file: !529, line: 15, column: 5)
!2466 = !DILocation(line: 17, column: 16, scope: !2464)
!2467 = !DILocation(line: 17, column: 9, scope: !2464)
!2468 = !DILocation(line: 19, column: 1, scope: !2455)
!2469 = distinct !DISubprogram(name: "m_vec_add", scope: !529, file: !529, line: 22, type: !2252, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!2470 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2469, file: !529, line: 22, type: !86)
!2471 = !DILocation(line: 0, scope: !2469)
!2472 = !DILocalVariable(name: "in", arg: 2, scope: !2469, file: !529, line: 22, type: !411)
!2473 = !DILocalVariable(name: "acc", arg: 3, scope: !2469, file: !529, line: 22, type: !52)
!2474 = !DILocalVariable(name: "i", scope: !2475, file: !529, line: 24, type: !58)
!2475 = distinct !DILexicalBlock(scope: !2469, file: !529, line: 24, column: 5)
!2476 = !DILocation(line: 0, scope: !2475)
!2477 = !DILocation(line: 26, column: 19, scope: !2478)
!2478 = distinct !DILexicalBlock(scope: !2479, file: !529, line: 25, column: 5)
!2479 = distinct !DILexicalBlock(scope: !2475, file: !529, line: 24, column: 5)
!2480 = !DILocation(line: 26, column: 16, scope: !2478)
!2481 = !DILocation(line: 26, column: 9, scope: !2478)
!2482 = !DILocation(line: 28, column: 1, scope: !2469)
!2483 = distinct !DISubprogram(name: "pqmayo_MAYO_2_ref_sample_solution", scope: !99, file: !99, line: 40, type: !2484, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !71)
!2484 = !DISubroutineType(types: !2485)
!2485 = !{!86, !2378, !61, !90, !90, !61, !86, !86, !86, !86}
!2486 = !DILocalVariable(name: "p", arg: 1, scope: !2483, file: !99, line: 40, type: !2378)
!2487 = !DILocation(line: 0, scope: !2483)
!2488 = !DILocalVariable(name: "A", arg: 2, scope: !2483, file: !99, line: 40, type: !61)
!2489 = !DILocalVariable(name: "y", arg: 3, scope: !2483, file: !99, line: 41, type: !90)
!2490 = !DILocalVariable(name: "r", arg: 4, scope: !2483, file: !99, line: 41, type: !90)
!2491 = !DILocalVariable(name: "x", arg: 5, scope: !2483, file: !99, line: 42, type: !61)
!2492 = !DILocalVariable(name: "k", arg: 6, scope: !2483, file: !99, line: 42, type: !86)
!2493 = !DILocalVariable(name: "o", arg: 7, scope: !2483, file: !99, line: 42, type: !86)
!2494 = !DILocalVariable(name: "m", arg: 8, scope: !2483, file: !99, line: 42, type: !86)
!2495 = !DILocalVariable(name: "A_cols", arg: 9, scope: !2483, file: !99, line: 42, type: !86)
!2496 = !DILocalVariable(name: "i", scope: !2497, file: !99, line: 51, type: !86)
!2497 = distinct !DILexicalBlock(scope: !2483, file: !99, line: 51, column: 5)
!2498 = !DILocation(line: 0, scope: !2497)
!2499 = !DILocation(line: 51, column: 10, scope: !2497)
!2500 = !DILocation(line: 51, scope: !2497)
!2501 = !DILocation(line: 51, column: 23, scope: !2502)
!2502 = distinct !DILexicalBlock(scope: !2497, file: !99, line: 51, column: 5)
!2503 = !DILocation(line: 51, column: 5, scope: !2497)
!2504 = !DILocation(line: 57, column: 5, scope: !2505)
!2505 = distinct !DILexicalBlock(scope: !2483, file: !99, line: 57, column: 5)
!2506 = !DILocation(line: 52, column: 16, scope: !2507)
!2507 = distinct !DILexicalBlock(scope: !2502, file: !99, line: 51, column: 37)
!2508 = !DILocation(line: 52, column: 9, scope: !2507)
!2509 = !DILocation(line: 52, column: 14, scope: !2507)
!2510 = !DILocation(line: 51, column: 33, scope: !2502)
!2511 = !DILocation(line: 51, column: 5, scope: !2502)
!2512 = distinct !{!2512, !2503, !2513, !388}
!2513 = !DILocation(line: 53, column: 5, scope: !2497)
!2514 = !DILocation(line: 57, scope: !2505)
!2515 = !DILocalVariable(name: "i", scope: !2505, file: !99, line: 57, type: !86)
!2516 = !DILocation(line: 0, scope: !2505)
!2517 = !DILocation(line: 57, column: 23, scope: !2518)
!2518 = distinct !DILexicalBlock(scope: !2505, file: !99, line: 57, column: 5)
!2519 = !DILocation(line: 58, column: 13, scope: !2520)
!2520 = distinct !DILexicalBlock(scope: !2518, file: !99, line: 57, column: 33)
!2521 = !DILocation(line: 58, column: 26, scope: !2520)
!2522 = !DILocation(line: 58, column: 30, scope: !2520)
!2523 = !DILocation(line: 58, column: 21, scope: !2520)
!2524 = !DILocation(line: 58, column: 9, scope: !2520)
!2525 = !DILocation(line: 58, column: 36, scope: !2520)
!2526 = !DILocation(line: 57, column: 29, scope: !2518)
!2527 = !DILocation(line: 57, column: 5, scope: !2518)
!2528 = distinct !{!2528, !2504, !2529, !388}
!2529 = !DILocation(line: 59, column: 5, scope: !2505)
!2530 = !DILocation(line: 60, column: 25, scope: !2483)
!2531 = !DILocation(line: 60, column: 29, scope: !2483)
!2532 = !DILocation(line: 60, column: 5, scope: !2483)
!2533 = !DILocalVariable(name: "i", scope: !2534, file: !99, line: 63, type: !86)
!2534 = distinct !DILexicalBlock(scope: !2483, file: !99, line: 63, column: 5)
!2535 = !DILocation(line: 0, scope: !2534)
!2536 = !DILocation(line: 63, column: 10, scope: !2534)
!2537 = !DILocation(line: 63, scope: !2534)
!2538 = !DILocation(line: 63, column: 23, scope: !2539)
!2539 = distinct !DILexicalBlock(scope: !2534, file: !99, line: 63, column: 5)
!2540 = !DILocation(line: 63, column: 5, scope: !2534)
!2541 = !DILocation(line: 64, column: 44, scope: !2542)
!2542 = distinct !DILexicalBlock(scope: !2539, file: !99, line: 63, column: 33)
!2543 = !DILocation(line: 64, column: 50, scope: !2542)
!2544 = !DILocation(line: 64, column: 38, scope: !2542)
!2545 = !DILocation(line: 64, column: 13, scope: !2542)
!2546 = !DILocation(line: 64, column: 26, scope: !2542)
!2547 = !DILocation(line: 64, column: 30, scope: !2542)
!2548 = !DILocation(line: 64, column: 21, scope: !2542)
!2549 = !DILocation(line: 64, column: 9, scope: !2542)
!2550 = !DILocation(line: 64, column: 36, scope: !2542)
!2551 = !DILocation(line: 63, column: 29, scope: !2539)
!2552 = !DILocation(line: 63, column: 5, scope: !2539)
!2553 = distinct !{!2553, !2540, !2554, !388}
!2554 = !DILocation(line: 65, column: 5, scope: !2534)
!2555 = !DILocation(line: 67, column: 16, scope: !2483)
!2556 = !DILocation(line: 67, column: 20, scope: !2483)
!2557 = !DILocation(line: 67, column: 5, scope: !2483)
!2558 = !DILocalVariable(name: "full_rank", scope: !2483, file: !99, line: 70, type: !51)
!2559 = !DILocalVariable(name: "i", scope: !2560, file: !99, line: 71, type: !86)
!2560 = distinct !DILexicalBlock(scope: !2483, file: !99, line: 71, column: 5)
!2561 = !DILocation(line: 0, scope: !2560)
!2562 = !DILocation(line: 71, column: 10, scope: !2560)
!2563 = !DILocation(line: 71, scope: !2560)
!2564 = !DILocation(line: 71, column: 23, scope: !2565)
!2565 = distinct !DILexicalBlock(scope: !2560, file: !99, line: 71, column: 5)
!2566 = !DILocation(line: 71, column: 5, scope: !2560)
!2567 = !DILocation(line: 72, column: 27, scope: !2568)
!2568 = distinct !DILexicalBlock(scope: !2565, file: !99, line: 71, column: 42)
!2569 = !DILocation(line: 72, column: 32, scope: !2568)
!2570 = !DILocation(line: 72, column: 22, scope: !2568)
!2571 = !DILocation(line: 72, column: 19, scope: !2568)
!2572 = !DILocation(line: 71, column: 38, scope: !2565)
!2573 = !DILocation(line: 71, column: 5, scope: !2565)
!2574 = distinct !{!2574, !2566, !2575, !388}
!2575 = !DILocation(line: 73, column: 5, scope: !2560)
!2576 = !DILocation(line: 80, column: 19, scope: !2577)
!2577 = distinct !DILexicalBlock(scope: !2483, file: !99, line: 80, column: 9)
!2578 = !DILocation(line: 88, scope: !2579)
!2579 = distinct !DILexicalBlock(scope: !2483, file: !99, line: 88, column: 5)
!2580 = !DILocalVariable(name: "row", scope: !2579, file: !99, line: 88, type: !86)
!2581 = !DILocation(line: 0, scope: !2579)
!2582 = !DILocation(line: 88, column: 31, scope: !2583)
!2583 = distinct !DILexicalBlock(scope: !2579, file: !99, line: 88, column: 5)
!2584 = !DILocation(line: 88, column: 5, scope: !2579)
!2585 = !DILocalVariable(name: "finished", scope: !2483, file: !99, line: 46, type: !51)
!2586 = !DILocation(line: 90, column: 27, scope: !2587)
!2587 = distinct !DILexicalBlock(scope: !2583, file: !99, line: 88, column: 44)
!2588 = !DILocalVariable(name: "col_upper_bound", scope: !2483, file: !99, line: 47, type: !86)
!2589 = !DILocalVariable(name: "col", scope: !2590, file: !99, line: 93, type: !86)
!2590 = distinct !DILexicalBlock(scope: !2587, file: !99, line: 93, column: 9)
!2591 = !DILocation(line: 0, scope: !2590)
!2592 = !DILocation(line: 93, column: 14, scope: !2590)
!2593 = !DILocation(line: 0, scope: !2587)
!2594 = !DILocation(line: 93, scope: !2590)
!2595 = !DILocation(line: 93, column: 33, scope: !2596)
!2596 = distinct !DILexicalBlock(scope: !2590, file: !99, line: 93, column: 9)
!2597 = !DILocation(line: 93, column: 9, scope: !2590)
!2598 = distinct !{!2598, !2584, !2599, !388}
!2599 = !DILocation(line: 122, column: 5, scope: !2579)
!2600 = !DILocation(line: 97, column: 50, scope: !2601)
!2601 = distinct !DILexicalBlock(scope: !2596, file: !99, line: 93, column: 60)
!2602 = !DILocation(line: 97, column: 44, scope: !2601)
!2603 = !DILocation(line: 97, column: 30, scope: !2601)
!2604 = !DILocation(line: 97, column: 73, scope: !2601)
!2605 = !DILocalVariable(name: "correct_column", scope: !2483, file: !99, line: 48, type: !51)
!2606 = !DILocation(line: 99, column: 63, scope: !2601)
!2607 = !DILocation(line: 99, column: 48, scope: !2601)
!2608 = !DILocation(line: 99, column: 46, scope: !2601)
!2609 = !DILocalVariable(name: "u", scope: !2601, file: !99, line: 99, type: !51)
!2610 = !DILocation(line: 0, scope: !2601)
!2611 = !DILocation(line: 100, column: 13, scope: !2601)
!2612 = !DILocation(line: 100, column: 20, scope: !2601)
!2613 = !DILocalVariable(name: "i", scope: !2614, file: !99, line: 102, type: !86)
!2614 = distinct !DILexicalBlock(scope: !2601, file: !99, line: 102, column: 13)
!2615 = !DILocation(line: 0, scope: !2614)
!2616 = !DILocation(line: 102, column: 18, scope: !2614)
!2617 = !DILocation(line: 102, scope: !2614)
!2618 = !DILocation(line: 102, column: 31, scope: !2619)
!2619 = distinct !DILexicalBlock(scope: !2614, file: !99, line: 102, column: 13)
!2620 = !DILocation(line: 102, column: 13, scope: !2614)
!2621 = !DILocation(line: 103, column: 53, scope: !2622)
!2622 = distinct !DILexicalBlock(scope: !2619, file: !99, line: 102, column: 46)
!2623 = !DILocation(line: 103, column: 45, scope: !2622)
!2624 = !DILocation(line: 103, column: 34, scope: !2622)
!2625 = !DILocation(line: 103, column: 95, scope: !2622)
!2626 = !DILocation(line: 103, column: 99, scope: !2622)
!2627 = !DILocation(line: 103, column: 91, scope: !2622)
!2628 = !DILocation(line: 103, column: 80, scope: !2622)
!2629 = !DILocation(line: 103, column: 115, scope: !2622)
!2630 = !DILocation(line: 103, column: 76, scope: !2622)
!2631 = !DILocation(line: 104, column: 49, scope: !2622)
!2632 = !DILocation(line: 104, column: 53, scope: !2622)
!2633 = !DILocation(line: 104, column: 45, scope: !2622)
!2634 = !DILocation(line: 104, column: 34, scope: !2622)
!2635 = !DILocation(line: 104, column: 69, scope: !2622)
!2636 = !DILocation(line: 104, column: 30, scope: !2622)
!2637 = !DILocation(line: 104, column: 95, scope: !2622)
!2638 = !DILocation(line: 104, column: 99, scope: !2622)
!2639 = !DILocation(line: 104, column: 91, scope: !2622)
!2640 = !DILocation(line: 104, column: 80, scope: !2622)
!2641 = !DILocation(line: 104, column: 115, scope: !2622)
!2642 = !DILocation(line: 104, column: 76, scope: !2622)
!2643 = !DILocation(line: 105, column: 49, scope: !2622)
!2644 = !DILocation(line: 105, column: 53, scope: !2622)
!2645 = !DILocation(line: 105, column: 45, scope: !2622)
!2646 = !DILocation(line: 105, column: 34, scope: !2622)
!2647 = !DILocation(line: 105, column: 69, scope: !2622)
!2648 = !DILocation(line: 105, column: 30, scope: !2622)
!2649 = !DILocation(line: 105, column: 95, scope: !2622)
!2650 = !DILocation(line: 105, column: 99, scope: !2622)
!2651 = !DILocation(line: 105, column: 91, scope: !2622)
!2652 = !DILocation(line: 105, column: 80, scope: !2622)
!2653 = !DILocation(line: 105, column: 115, scope: !2622)
!2654 = !DILocation(line: 105, column: 76, scope: !2622)
!2655 = !DILocation(line: 106, column: 49, scope: !2622)
!2656 = !DILocation(line: 106, column: 53, scope: !2622)
!2657 = !DILocation(line: 106, column: 45, scope: !2622)
!2658 = !DILocation(line: 106, column: 34, scope: !2622)
!2659 = !DILocation(line: 106, column: 69, scope: !2622)
!2660 = !DILocation(line: 106, column: 30, scope: !2622)
!2661 = !DILocation(line: 106, column: 95, scope: !2622)
!2662 = !DILocation(line: 106, column: 99, scope: !2622)
!2663 = !DILocation(line: 106, column: 91, scope: !2622)
!2664 = !DILocation(line: 106, column: 80, scope: !2622)
!2665 = !DILocation(line: 106, column: 115, scope: !2622)
!2666 = !DILocation(line: 106, column: 76, scope: !2622)
!2667 = !DILocalVariable(name: "tmp", scope: !2622, file: !99, line: 103, type: !53)
!2668 = !DILocation(line: 0, scope: !2622)
!2669 = !DILocation(line: 108, column: 23, scope: !2622)
!2670 = !DILocation(line: 110, column: 34, scope: !2622)
!2671 = !DILocation(line: 110, column: 17, scope: !2622)
!2672 = !DILocation(line: 110, column: 48, scope: !2622)
!2673 = !DILocation(line: 111, column: 56, scope: !2622)
!2674 = !DILocation(line: 111, column: 34, scope: !2622)
!2675 = !DILocation(line: 111, column: 17, scope: !2622)
!2676 = !DILocation(line: 111, column: 48, scope: !2622)
!2677 = !DILocation(line: 112, column: 56, scope: !2622)
!2678 = !DILocation(line: 112, column: 34, scope: !2622)
!2679 = !DILocation(line: 112, column: 17, scope: !2622)
!2680 = !DILocation(line: 112, column: 48, scope: !2622)
!2681 = !DILocation(line: 113, column: 56, scope: !2622)
!2682 = !DILocation(line: 113, column: 34, scope: !2622)
!2683 = !DILocation(line: 113, column: 17, scope: !2622)
!2684 = !DILocation(line: 113, column: 48, scope: !2622)
!2685 = !DILocation(line: 114, column: 56, scope: !2622)
!2686 = !DILocation(line: 114, column: 34, scope: !2622)
!2687 = !DILocation(line: 114, column: 17, scope: !2622)
!2688 = !DILocation(line: 114, column: 48, scope: !2622)
!2689 = !DILocation(line: 115, column: 56, scope: !2622)
!2690 = !DILocation(line: 115, column: 34, scope: !2622)
!2691 = !DILocation(line: 115, column: 17, scope: !2622)
!2692 = !DILocation(line: 115, column: 48, scope: !2622)
!2693 = !DILocation(line: 116, column: 56, scope: !2622)
!2694 = !DILocation(line: 116, column: 34, scope: !2622)
!2695 = !DILocation(line: 116, column: 17, scope: !2622)
!2696 = !DILocation(line: 116, column: 48, scope: !2622)
!2697 = !DILocation(line: 117, column: 56, scope: !2622)
!2698 = !DILocation(line: 117, column: 34, scope: !2622)
!2699 = !DILocation(line: 117, column: 17, scope: !2622)
!2700 = !DILocation(line: 117, column: 48, scope: !2622)
!2701 = !DILocation(line: 102, column: 40, scope: !2619)
!2702 = !DILocation(line: 102, column: 13, scope: !2619)
!2703 = distinct !{!2703, !2620, !2704, !388}
!2704 = !DILocation(line: 118, column: 13, scope: !2614)
!2705 = !DILocation(line: 120, column: 33, scope: !2601)
!2706 = !DILocation(line: 93, column: 56, scope: !2596)
!2707 = !DILocation(line: 93, column: 9, scope: !2596)
!2708 = distinct !{!2708, !2597, !2709, !388}
!2709 = !DILocation(line: 121, column: 9, scope: !2590)
!2710 = !DILocation(line: 124, column: 1, scope: !2483)
!2711 = distinct !DISubprogram(name: "mat_mul", scope: !577, file: !577, line: 79, type: !1433, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!2712 = !DILocalVariable(name: "a", arg: 1, scope: !2711, file: !577, line: 79, type: !90)
!2713 = !DILocation(line: 0, scope: !2711)
!2714 = !DILocalVariable(name: "b", arg: 2, scope: !2711, file: !577, line: 79, type: !90)
!2715 = !DILocalVariable(name: "c", arg: 3, scope: !2711, file: !577, line: 80, type: !61)
!2716 = !DILocalVariable(name: "colrow_ab", arg: 4, scope: !2711, file: !577, line: 80, type: !86)
!2717 = !DILocalVariable(name: "row_a", arg: 5, scope: !2711, file: !577, line: 80, type: !86)
!2718 = !DILocalVariable(name: "col_b", arg: 6, scope: !2711, file: !577, line: 80, type: !86)
!2719 = !DILocalVariable(name: "i", scope: !2720, file: !577, line: 81, type: !86)
!2720 = distinct !DILexicalBlock(scope: !2711, file: !577, line: 81, column: 5)
!2721 = !DILocation(line: 0, scope: !2720)
!2722 = !DILocation(line: 81, column: 10, scope: !2720)
!2723 = !DILocation(line: 81, scope: !2720)
!2724 = !DILocation(line: 81, column: 23, scope: !2725)
!2725 = distinct !DILexicalBlock(scope: !2720, file: !577, line: 81, column: 5)
!2726 = !DILocation(line: 81, column: 5, scope: !2720)
!2727 = !DILocation(line: 82, scope: !2728)
!2728 = distinct !DILexicalBlock(scope: !2729, file: !577, line: 82, column: 9)
!2729 = distinct !DILexicalBlock(scope: !2725, file: !577, line: 81, column: 53)
!2730 = !DILocalVariable(name: "j", scope: !2728, file: !577, line: 82, type: !86)
!2731 = !DILocation(line: 0, scope: !2728)
!2732 = !DILocation(line: 82, column: 27, scope: !2733)
!2733 = distinct !DILexicalBlock(scope: !2728, file: !577, line: 82, column: 9)
!2734 = !DILocation(line: 82, column: 9, scope: !2728)
!2735 = !DILocation(line: 83, column: 31, scope: !2736)
!2736 = distinct !DILexicalBlock(scope: !2733, file: !577, line: 82, column: 46)
!2737 = !DILocation(line: 83, column: 18, scope: !2736)
!2738 = !DILocation(line: 83, column: 16, scope: !2736)
!2739 = !DILocation(line: 82, column: 36, scope: !2733)
!2740 = !DILocation(line: 82, column: 41, scope: !2733)
!2741 = !DILocation(line: 82, column: 9, scope: !2733)
!2742 = distinct !{!2742, !2734, !2743, !388}
!2743 = !DILocation(line: 84, column: 9, scope: !2728)
!2744 = !DILocation(line: 81, column: 32, scope: !2725)
!2745 = !DILocation(line: 81, column: 39, scope: !2725)
!2746 = !DILocation(line: 81, column: 5, scope: !2725)
!2747 = distinct !{!2747, !2726, !2748, !388}
!2748 = !DILocation(line: 85, column: 5, scope: !2720)
!2749 = !DILocation(line: 86, column: 18, scope: !2711)
!2750 = !DILocation(line: 86, column: 5, scope: !2711)
!2751 = !DILocation(line: 87, column: 1, scope: !2711)
!2752 = distinct !DISubprogram(name: "sub_f", scope: !577, file: !577, line: 48, type: !1558, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!2753 = !DILocalVariable(name: "a", arg: 1, scope: !2752, file: !577, line: 48, type: !51)
!2754 = !DILocation(line: 0, scope: !2752)
!2755 = !DILocalVariable(name: "b", arg: 2, scope: !2752, file: !577, line: 48, type: !51)
!2756 = !DILocation(line: 49, column: 14, scope: !2752)
!2757 = !DILocation(line: 49, column: 5, scope: !2752)
!2758 = distinct !DISubprogram(name: "EF", scope: !2759, file: !2759, line: 60, type: !2760, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!2759 = !DIFile(filename: "../../../src/generic/echelon_form.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!2760 = !DISubroutineType(types: !2761)
!2761 = !{null, !61, !86, !86}
!2762 = !DILocalVariable(name: "A", arg: 1, scope: !2758, file: !2759, line: 60, type: !61)
!2763 = !DILocation(line: 0, scope: !2758)
!2764 = !DILocalVariable(name: "nrows", arg: 2, scope: !2758, file: !2759, line: 60, type: !86)
!2765 = !DILocalVariable(name: "ncols", arg: 3, scope: !2758, file: !2759, line: 60, type: !86)
!2766 = !DILocalVariable(name: "_pivot_row", scope: !2758, file: !2759, line: 62, type: !2767, align: 256)
!2767 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 320, elements: !2768)
!2768 = !{!2769}
!2769 = !DISubrange(count: 5)
!2770 = !DILocation(line: 62, column: 27, scope: !2758)
!2771 = !DILocalVariable(name: "_pivot_row2", scope: !2758, file: !2759, line: 63, type: !2767, align: 256)
!2772 = !DILocation(line: 63, column: 27, scope: !2758)
!2773 = !DILocalVariable(name: "packed_A", scope: !2758, file: !2759, line: 64, type: !2774, align: 256)
!2774 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 20480, elements: !2775)
!2775 = !{!2776}
!2776 = !DISubrange(count: 320)
!2777 = !DILocation(line: 64, column: 27, scope: !2758)
!2778 = !DILocation(line: 66, column: 26, scope: !2758)
!2779 = !DILocation(line: 66, column: 32, scope: !2758)
!2780 = !DILocalVariable(name: "row_len", scope: !2758, file: !2759, line: 66, type: !86)
!2781 = !DILocalVariable(name: "i", scope: !2782, file: !2759, line: 69, type: !86)
!2782 = distinct !DILexicalBlock(scope: !2758, file: !2759, line: 69, column: 5)
!2783 = !DILocation(line: 0, scope: !2782)
!2784 = !DILocation(line: 69, column: 10, scope: !2782)
!2785 = !DILocation(line: 69, scope: !2782)
!2786 = !DILocation(line: 69, column: 23, scope: !2787)
!2787 = distinct !DILexicalBlock(scope: !2782, file: !2759, line: 69, column: 5)
!2788 = !DILocation(line: 69, column: 5, scope: !2782)
!2789 = !DILocation(line: 77, column: 5, scope: !2790)
!2790 = distinct !DILexicalBlock(scope: !2758, file: !2759, line: 77, column: 5)
!2791 = !DILocation(line: 70, column: 29, scope: !2792)
!2792 = distinct !DILexicalBlock(scope: !2787, file: !2759, line: 69, column: 37)
!2793 = !DILocation(line: 70, column: 25, scope: !2792)
!2794 = !DILocation(line: 70, column: 51, scope: !2792)
!2795 = !DILocation(line: 70, column: 47, scope: !2792)
!2796 = !DILocation(line: 70, column: 9, scope: !2792)
!2797 = !DILocation(line: 69, column: 33, scope: !2787)
!2798 = !DILocation(line: 69, column: 5, scope: !2787)
!2799 = distinct !{!2799, !2788, !2800, !388}
!2800 = !DILocation(line: 71, column: 5, scope: !2782)
!2801 = !DILocation(line: 77, scope: !2790)
!2802 = !DILocalVariable(name: "pivot_row", scope: !2758, file: !2759, line: 76, type: !86)
!2803 = !DILocalVariable(name: "pivot_col", scope: !2790, file: !2759, line: 77, type: !86)
!2804 = !DILocation(line: 0, scope: !2790)
!2805 = !DILocation(line: 77, column: 39, scope: !2806)
!2806 = distinct !DILexicalBlock(scope: !2790, file: !2759, line: 77, column: 5)
!2807 = !DILocation(line: 79, column: 37, scope: !2808)
!2808 = distinct !DILexicalBlock(scope: !2806, file: !2759, line: 77, column: 61)
!2809 = !DILocalVariable(name: "pivot_row_lower_bound", scope: !2808, file: !2759, line: 79, type: !86)
!2810 = !DILocation(line: 0, scope: !2808)
!2811 = !DILocation(line: 80, column: 37, scope: !2808)
!2812 = !DILocalVariable(name: "pivot_row_upper_bound", scope: !2808, file: !2759, line: 80, type: !86)
!2813 = !DILocalVariable(name: "i", scope: !2814, file: !2759, line: 85, type: !86)
!2814 = distinct !DILexicalBlock(scope: !2808, file: !2759, line: 85, column: 9)
!2815 = !DILocation(line: 0, scope: !2814)
!2816 = !DILocation(line: 85, column: 14, scope: !2814)
!2817 = !DILocation(line: 85, scope: !2814)
!2818 = !DILocation(line: 85, column: 27, scope: !2819)
!2819 = distinct !DILexicalBlock(scope: !2814, file: !2759, line: 85, column: 9)
!2820 = !DILocation(line: 85, column: 9, scope: !2814)
!2821 = !DILocation(line: 93, column: 9, scope: !2822)
!2822 = distinct !DILexicalBlock(scope: !2808, file: !2759, line: 93, column: 9)
!2823 = !DILocation(line: 86, column: 13, scope: !2824)
!2824 = distinct !DILexicalBlock(scope: !2819, file: !2759, line: 85, column: 43)
!2825 = !DILocation(line: 86, column: 27, scope: !2824)
!2826 = !DILocation(line: 87, column: 13, scope: !2824)
!2827 = !DILocation(line: 87, column: 28, scope: !2824)
!2828 = !DILocation(line: 85, column: 39, scope: !2819)
!2829 = !DILocation(line: 85, column: 9, scope: !2819)
!2830 = distinct !{!2830, !2820, !2831, !388}
!2831 = !DILocation(line: 88, column: 9, scope: !2814)
!2832 = !DILocation(line: 0, scope: !2822)
!2833 = !DILocalVariable(name: "row", scope: !2822, file: !2759, line: 93, type: !86)
!2834 = !DILocalVariable(name: "pivot", scope: !2808, file: !2759, line: 91, type: !51)
!2835 = !DILocalVariable(name: "pivot_is_zero", scope: !2808, file: !2759, line: 92, type: !53)
!2836 = !DILocation(line: 94, column: 24, scope: !2837)
!2837 = distinct !DILexicalBlock(scope: !2822, file: !2759, line: 93, column: 9)
!2838 = !DILocation(line: 94, column: 21, scope: !2837)
!2839 = !DILocation(line: 96, column: 38, scope: !2840)
!2840 = distinct !DILexicalBlock(scope: !2837, file: !2759, line: 94, column: 80)
!2841 = !DILocation(line: 96, column: 37, scope: !2840)
!2842 = !DILocalVariable(name: "is_pivot_row", scope: !2840, file: !2759, line: 96, type: !53)
!2843 = !DILocation(line: 0, scope: !2840)
!2844 = !DILocation(line: 97, column: 40, scope: !2840)
!2845 = !DILocalVariable(name: "below_pivot_row", scope: !2840, file: !2759, line: 97, type: !53)
!2846 = !DILocalVariable(name: "j", scope: !2847, file: !2759, line: 99, type: !86)
!2847 = distinct !DILexicalBlock(scope: !2840, file: !2759, line: 99, column: 13)
!2848 = !DILocation(line: 0, scope: !2847)
!2849 = !DILocation(line: 99, column: 18, scope: !2847)
!2850 = !DILocation(line: 99, scope: !2847)
!2851 = !DILocation(line: 99, column: 31, scope: !2852)
!2852 = distinct !DILexicalBlock(scope: !2847, file: !2759, line: 99, column: 13)
!2853 = !DILocation(line: 99, column: 13, scope: !2847)
!2854 = !DILocation(line: 100, column: 67, scope: !2855)
!2855 = distinct !DILexicalBlock(scope: !2852, file: !2759, line: 99, column: 47)
!2856 = !DILocation(line: 100, column: 48, scope: !2855)
!2857 = !DILocation(line: 101, column: 47, scope: !2855)
!2858 = !DILocation(line: 101, column: 57, scope: !2855)
!2859 = !DILocation(line: 101, column: 34, scope: !2855)
!2860 = !DILocation(line: 100, column: 85, scope: !2855)
!2861 = !DILocation(line: 100, column: 17, scope: !2855)
!2862 = !DILocation(line: 100, column: 31, scope: !2855)
!2863 = !DILocation(line: 99, column: 43, scope: !2852)
!2864 = !DILocation(line: 99, column: 13, scope: !2852)
!2865 = distinct !{!2865, !2853, !2866, !388}
!2866 = !DILocation(line: 102, column: 13, scope: !2847)
!2867 = !DILocation(line: 103, column: 21, scope: !2840)
!2868 = !DILocation(line: 104, column: 44, scope: !2840)
!2869 = !DILocation(line: 104, column: 30, scope: !2840)
!2870 = !DILocation(line: 104, column: 29, scope: !2840)
!2871 = !DILocation(line: 94, column: 76, scope: !2837)
!2872 = !DILocation(line: 93, column: 9, scope: !2837)
!2873 = distinct !{!2873, !2821, !2874, !388}
!2874 = !DILocation(line: 105, column: 9, scope: !2822)
!2875 = !DILocation(line: 108, column: 19, scope: !2808)
!2876 = !DILocalVariable(name: "inverse", scope: !2758, file: !2759, line: 75, type: !51)
!2877 = !DILocation(line: 109, column: 9, scope: !2808)
!2878 = !DILocalVariable(name: "row", scope: !2879, file: !2759, line: 113, type: !86)
!2879 = distinct !DILexicalBlock(scope: !2808, file: !2759, line: 113, column: 9)
!2880 = !DILocation(line: 0, scope: !2879)
!2881 = !DILocation(line: 113, column: 14, scope: !2879)
!2882 = !DILocation(line: 113, scope: !2879)
!2883 = !DILocation(line: 113, column: 51, scope: !2884)
!2884 = distinct !DILexicalBlock(scope: !2879, file: !2759, line: 113, column: 9)
!2885 = !DILocation(line: 113, column: 9, scope: !2879)
!2886 = !DILocation(line: 114, column: 33, scope: !2887)
!2887 = distinct !DILexicalBlock(scope: !2884, file: !2759, line: 113, column: 84)
!2888 = !DILocation(line: 114, column: 63, scope: !2887)
!2889 = !DILocalVariable(name: "do_copy", scope: !2887, file: !2759, line: 114, type: !53)
!2890 = !DILocation(line: 0, scope: !2887)
!2891 = !DILocalVariable(name: "do_not_copy", scope: !2887, file: !2759, line: 115, type: !53)
!2892 = !DILocalVariable(name: "col", scope: !2893, file: !2759, line: 116, type: !86)
!2893 = distinct !DILexicalBlock(scope: !2887, file: !2759, line: 116, column: 13)
!2894 = !DILocation(line: 0, scope: !2893)
!2895 = !DILocation(line: 116, column: 18, scope: !2893)
!2896 = !DILocation(line: 116, scope: !2893)
!2897 = !DILocation(line: 116, column: 35, scope: !2898)
!2898 = distinct !DILexicalBlock(scope: !2893, file: !2759, line: 116, column: 13)
!2899 = !DILocation(line: 116, column: 13, scope: !2893)
!2900 = !DILocation(line: 118, column: 49, scope: !2901)
!2901 = distinct !DILexicalBlock(scope: !2898, file: !2759, line: 116, column: 53)
!2902 = !DILocation(line: 118, column: 59, scope: !2901)
!2903 = !DILocation(line: 118, column: 36, scope: !2901)
!2904 = !DILocation(line: 118, column: 34, scope: !2901)
!2905 = !DILocation(line: 119, column: 32, scope: !2901)
!2906 = !DILocation(line: 119, column: 30, scope: !2901)
!2907 = !DILocation(line: 118, column: 67, scope: !2901)
!2908 = !DILocation(line: 117, column: 30, scope: !2901)
!2909 = !DILocation(line: 117, column: 40, scope: !2901)
!2910 = !DILocation(line: 117, column: 17, scope: !2901)
!2911 = !DILocation(line: 117, column: 47, scope: !2901)
!2912 = !DILocation(line: 116, column: 49, scope: !2898)
!2913 = !DILocation(line: 116, column: 13, scope: !2898)
!2914 = distinct !{!2914, !2899, !2915, !388}
!2915 = !DILocation(line: 120, column: 13, scope: !2893)
!2916 = !DILocation(line: 113, column: 80, scope: !2884)
!2917 = !DILocation(line: 113, column: 9, scope: !2884)
!2918 = distinct !{!2918, !2885, !2919, !388}
!2919 = !DILocation(line: 121, column: 9, scope: !2879)
!2920 = !DILocation(line: 124, scope: !2921)
!2921 = distinct !DILexicalBlock(scope: !2808, file: !2759, line: 124, column: 9)
!2922 = !DILocalVariable(name: "row", scope: !2921, file: !2759, line: 124, type: !86)
!2923 = !DILocation(line: 0, scope: !2921)
!2924 = !DILocation(line: 124, column: 51, scope: !2925)
!2925 = distinct !DILexicalBlock(scope: !2921, file: !2759, line: 124, column: 9)
!2926 = !DILocation(line: 124, column: 9, scope: !2921)
!2927 = !DILocation(line: 125, column: 46, scope: !2928)
!2928 = distinct !DILexicalBlock(scope: !2925, file: !2759, line: 124, column: 67)
!2929 = !DILocalVariable(name: "below_pivot", scope: !2928, file: !2759, line: 125, type: !51)
!2930 = !DILocation(line: 0, scope: !2928)
!2931 = !DILocation(line: 126, column: 74, scope: !2928)
!2932 = !DILocation(line: 126, column: 68, scope: !2928)
!2933 = !DILocation(line: 126, column: 41, scope: !2928)
!2934 = !DILocalVariable(name: "elt_to_elim", scope: !2928, file: !2759, line: 126, type: !51)
!2935 = !DILocation(line: 128, column: 63, scope: !2928)
!2936 = !DILocation(line: 129, column: 52, scope: !2928)
!2937 = !DILocation(line: 129, column: 46, scope: !2928)
!2938 = !DILocation(line: 128, column: 13, scope: !2928)
!2939 = !DILocation(line: 124, column: 63, scope: !2925)
!2940 = !DILocation(line: 124, column: 9, scope: !2925)
!2941 = distinct !{!2941, !2926, !2942, !388}
!2942 = !DILocation(line: 130, column: 9, scope: !2921)
!2943 = !DILocation(line: 132, column: 19, scope: !2808)
!2944 = !DILocation(line: 77, column: 57, scope: !2806)
!2945 = !DILocation(line: 77, column: 5, scope: !2806)
!2946 = distinct !{!2946, !2789, !2947, !388}
!2947 = !DILocation(line: 133, column: 5, scope: !2790)
!2948 = !DILocation(line: 138, scope: !2949)
!2949 = distinct !DILexicalBlock(scope: !2758, file: !2759, line: 138, column: 5)
!2950 = !DILocalVariable(name: "i", scope: !2949, file: !2759, line: 138, type: !86)
!2951 = !DILocation(line: 0, scope: !2949)
!2952 = !DILocation(line: 138, column: 23, scope: !2953)
!2953 = distinct !DILexicalBlock(scope: !2949, file: !2759, line: 138, column: 5)
!2954 = !DILocation(line: 138, column: 5, scope: !2949)
!2955 = !DILocation(line: 139, column: 47, scope: !2956)
!2956 = distinct !DILexicalBlock(scope: !2953, file: !2759, line: 138, column: 37)
!2957 = !DILocation(line: 139, column: 43, scope: !2956)
!2958 = !DILocation(line: 139, column: 9, scope: !2956)
!2959 = !DILocalVariable(name: "j", scope: !2960, file: !2759, line: 140, type: !86)
!2960 = distinct !DILexicalBlock(scope: !2956, file: !2759, line: 140, column: 9)
!2961 = !DILocation(line: 0, scope: !2960)
!2962 = !DILocation(line: 140, column: 14, scope: !2960)
!2963 = !DILocation(line: 140, scope: !2960)
!2964 = !DILocation(line: 140, column: 27, scope: !2965)
!2965 = distinct !DILexicalBlock(scope: !2960, file: !2759, line: 140, column: 9)
!2966 = !DILocation(line: 140, column: 9, scope: !2960)
!2967 = !DILocation(line: 141, column: 32, scope: !2968)
!2968 = distinct !DILexicalBlock(scope: !2965, file: !2759, line: 140, column: 41)
!2969 = !DILocation(line: 141, column: 17, scope: !2968)
!2970 = !DILocation(line: 141, column: 13, scope: !2968)
!2971 = !DILocation(line: 141, column: 30, scope: !2968)
!2972 = !DILocation(line: 140, column: 37, scope: !2965)
!2973 = !DILocation(line: 140, column: 9, scope: !2965)
!2974 = distinct !{!2974, !2966, !2975, !388}
!2975 = !DILocation(line: 142, column: 9, scope: !2960)
!2976 = !DILocation(line: 138, column: 33, scope: !2953)
!2977 = !DILocation(line: 138, column: 5, scope: !2953)
!2978 = distinct !{!2978, !2954, !2979, !388}
!2979 = !DILocation(line: 143, column: 5, scope: !2949)
!2980 = !DILocation(line: 145, column: 5, scope: !2758)
!2981 = !DILocation(line: 146, column: 5, scope: !2758)
!2982 = !DILocation(line: 147, column: 5, scope: !2758)
!2983 = !DILocation(line: 148, column: 5, scope: !2758)
!2984 = !DILocation(line: 149, column: 1, scope: !2758)
!2985 = distinct !DISubprogram(name: "ct_compare_8", scope: !2986, file: !2986, line: 51, type: !1558, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!2986 = !DIFile(filename: "../../../src/arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!2987 = !DILocalVariable(name: "a", arg: 1, scope: !2985, file: !2986, line: 51, type: !51)
!2988 = !DILocation(line: 0, scope: !2985)
!2989 = !DILocalVariable(name: "b", arg: 2, scope: !2985, file: !2986, line: 51, type: !51)
!2990 = !DILocation(line: 52, column: 42, scope: !2985)
!2991 = !DILocation(line: 52, column: 13, scope: !2985)
!2992 = !DILocation(line: 52, column: 71, scope: !2985)
!2993 = !DILocation(line: 52, column: 69, scope: !2985)
!2994 = !DILocation(line: 52, column: 5, scope: !2985)
!2995 = distinct !DISubprogram(name: "mul_fx8", scope: !577, file: !577, line: 28, type: !2996, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!2996 = !DISubroutineType(types: !2997)
!2997 = !{!53, !51, !53}
!2998 = !DILocalVariable(name: "a", arg: 1, scope: !2995, file: !577, line: 28, type: !51)
!2999 = !DILocation(line: 0, scope: !2995)
!3000 = !DILocalVariable(name: "b", arg: 2, scope: !2995, file: !577, line: 28, type: !53)
!3001 = !DILocation(line: 31, column: 13, scope: !2995)
!3002 = !DILocation(line: 31, column: 10, scope: !2995)
!3003 = !DILocation(line: 31, column: 17, scope: !2995)
!3004 = !DILocalVariable(name: "p", scope: !2995, file: !577, line: 30, type: !53)
!3005 = !DILocation(line: 32, column: 13, scope: !2995)
!3006 = !DILocation(line: 32, column: 10, scope: !2995)
!3007 = !DILocation(line: 32, column: 17, scope: !2995)
!3008 = !DILocation(line: 32, column: 7, scope: !2995)
!3009 = !DILocation(line: 33, column: 13, scope: !2995)
!3010 = !DILocation(line: 33, column: 10, scope: !2995)
!3011 = !DILocation(line: 33, column: 17, scope: !2995)
!3012 = !DILocation(line: 33, column: 7, scope: !2995)
!3013 = !DILocation(line: 34, column: 13, scope: !2995)
!3014 = !DILocation(line: 34, column: 10, scope: !2995)
!3015 = !DILocation(line: 34, column: 17, scope: !2995)
!3016 = !DILocation(line: 34, column: 7, scope: !2995)
!3017 = !DILocalVariable(name: "top_p", scope: !2995, file: !577, line: 37, type: !53)
!3018 = !DILocation(line: 38, column: 32, scope: !2995)
!3019 = !DILocation(line: 38, column: 47, scope: !2995)
!3020 = !DILocation(line: 38, column: 38, scope: !2995)
!3021 = !DILocation(line: 38, column: 54, scope: !2995)
!3022 = !DILocalVariable(name: "out", scope: !2995, file: !577, line: 38, type: !53)
!3023 = !DILocation(line: 39, column: 5, scope: !2995)
!3024 = distinct !DISubprogram(name: "ef_pack_m_vec", scope: !2759, file: !2759, line: 24, type: !3025, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3025 = !DISubroutineType(types: !3026)
!3026 = !{null, !90, !52, !86}
!3027 = !DILocalVariable(name: "in", arg: 1, scope: !3024, file: !2759, line: 24, type: !90)
!3028 = !DILocation(line: 0, scope: !3024)
!3029 = !DILocalVariable(name: "out", arg: 2, scope: !3024, file: !2759, line: 24, type: !52)
!3030 = !DILocalVariable(name: "ncols", arg: 3, scope: !3024, file: !2759, line: 24, type: !86)
!3031 = !DILocalVariable(name: "out8", scope: !3024, file: !2759, line: 26, type: !61)
!3032 = !DILocalVariable(name: "i", scope: !3024, file: !2759, line: 25, type: !86)
!3033 = !DILocation(line: 27, column: 9, scope: !3034)
!3034 = distinct !DILexicalBlock(scope: !3024, file: !2759, line: 27, column: 5)
!3035 = !DILocation(line: 27, scope: !3034)
!3036 = !DILocation(line: 27, column: 17, scope: !3037)
!3037 = distinct !DILexicalBlock(scope: !3034, file: !2759, line: 27, column: 5)
!3038 = !DILocation(line: 27, column: 20, scope: !3037)
!3039 = !DILocation(line: 27, column: 5, scope: !3034)
!3040 = !DILocation(line: 31, column: 23, scope: !3041)
!3041 = distinct !DILexicalBlock(scope: !3037, file: !2759, line: 27, column: 36)
!3042 = !DILocation(line: 31, column: 44, scope: !3041)
!3043 = !DILocation(line: 31, column: 40, scope: !3041)
!3044 = !DILocation(line: 31, column: 48, scope: !3041)
!3045 = !DILocation(line: 31, column: 37, scope: !3041)
!3046 = !DILocation(line: 31, column: 15, scope: !3041)
!3047 = !DILocation(line: 31, column: 9, scope: !3041)
!3048 = !DILocation(line: 31, column: 20, scope: !3041)
!3049 = !DILocation(line: 27, column: 31, scope: !3037)
!3050 = !DILocation(line: 27, column: 5, scope: !3037)
!3051 = distinct !{!3051, !3039, !3052, !388}
!3052 = !DILocation(line: 33, column: 5, scope: !3034)
!3053 = !DILocation(line: 34, column: 19, scope: !3054)
!3054 = distinct !DILexicalBlock(scope: !3024, file: !2759, line: 34, column: 9)
!3055 = !DILocation(line: 38, column: 23, scope: !3056)
!3056 = distinct !DILexicalBlock(scope: !3054, file: !2759, line: 34, column: 24)
!3057 = !DILocation(line: 38, column: 15, scope: !3056)
!3058 = !DILocation(line: 38, column: 9, scope: !3056)
!3059 = !DILocation(line: 38, column: 20, scope: !3056)
!3060 = !DILocation(line: 40, column: 5, scope: !3056)
!3061 = !DILocation(line: 41, column: 1, scope: !3024)
!3062 = distinct !DISubprogram(name: "ct_compare_64", scope: !2986, file: !2986, line: 46, type: !3063, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3063 = !DISubroutineType(types: !3064)
!3064 = !{!53, !86, !86}
!3065 = !DILocalVariable(name: "a", arg: 1, scope: !3062, file: !2986, line: 46, type: !86)
!3066 = !DILocation(line: 0, scope: !3062)
!3067 = !DILocalVariable(name: "b", arg: 2, scope: !3062, file: !2986, line: 46, type: !86)
!3068 = !DILocation(line: 47, column: 38, scope: !3062)
!3069 = !DILocation(line: 47, column: 44, scope: !3062)
!3070 = !DILocation(line: 47, column: 73, scope: !3062)
!3071 = !DILocation(line: 47, column: 71, scope: !3062)
!3072 = !DILocation(line: 47, column: 5, scope: !3062)
!3073 = distinct !DISubprogram(name: "ct_64_is_greater_than", scope: !2986, file: !2986, line: 35, type: !3063, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3074 = !DILocalVariable(name: "a", arg: 1, scope: !3073, file: !2986, line: 35, type: !86)
!3075 = !DILocation(line: 0, scope: !3073)
!3076 = !DILocalVariable(name: "b", arg: 2, scope: !3073, file: !2986, line: 35, type: !86)
!3077 = !DILocalVariable(name: "diff", scope: !3073, file: !2986, line: 36, type: !87)
!3078 = !DILocation(line: 37, column: 30, scope: !3073)
!3079 = !DILocation(line: 37, column: 59, scope: !3073)
!3080 = !DILocation(line: 37, column: 57, scope: !3073)
!3081 = !DILocation(line: 37, column: 5, scope: !3073)
!3082 = distinct !DISubprogram(name: "m_extract_element", scope: !2759, file: !2759, line: 16, type: !3083, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3083 = !DISubroutineType(types: !3084)
!3084 = !{!51, !411, !86}
!3085 = !DILocalVariable(name: "in", arg: 1, scope: !3082, file: !2759, line: 16, type: !411)
!3086 = !DILocation(line: 0, scope: !3082)
!3087 = !DILocalVariable(name: "index", arg: 2, scope: !3082, file: !2759, line: 16, type: !86)
!3088 = !DILocation(line: 17, column: 27, scope: !3082)
!3089 = !DILocalVariable(name: "leg", scope: !3082, file: !2759, line: 17, type: !324)
!3090 = !DILocation(line: 18, column: 30, scope: !3082)
!3091 = !DILocalVariable(name: "offset", scope: !3082, file: !2759, line: 18, type: !324)
!3092 = !DILocation(line: 20, column: 13, scope: !3082)
!3093 = !DILocation(line: 20, column: 31, scope: !3082)
!3094 = !DILocation(line: 20, column: 21, scope: !3082)
!3095 = !DILocation(line: 20, column: 12, scope: !3082)
!3096 = !DILocation(line: 20, column: 5, scope: !3082)
!3097 = distinct !DISubprogram(name: "inverse_f", scope: !577, file: !577, line: 57, type: !3098, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3098 = !DISubroutineType(types: !3099)
!3099 = !{!51, !51}
!3100 = !DILocalVariable(name: "a", arg: 1, scope: !3097, file: !577, line: 57, type: !51)
!3101 = !DILocation(line: 0, scope: !3097)
!3102 = !DILocation(line: 61, column: 24, scope: !3097)
!3103 = !DILocalVariable(name: "a2", scope: !3097, file: !577, line: 61, type: !51)
!3104 = !DILocation(line: 62, column: 24, scope: !3097)
!3105 = !DILocalVariable(name: "a4", scope: !3097, file: !577, line: 62, type: !51)
!3106 = !DILocation(line: 63, column: 24, scope: !3097)
!3107 = !DILocalVariable(name: "a8", scope: !3097, file: !577, line: 63, type: !51)
!3108 = !DILocation(line: 64, column: 24, scope: !3097)
!3109 = !DILocalVariable(name: "a6", scope: !3097, file: !577, line: 64, type: !51)
!3110 = !DILocation(line: 65, column: 25, scope: !3097)
!3111 = !DILocalVariable(name: "a14", scope: !3097, file: !577, line: 65, type: !51)
!3112 = !DILocation(line: 67, column: 5, scope: !3097)
!3113 = distinct !DISubprogram(name: "vec_mul_add_u64", scope: !2986, file: !2986, line: 94, type: !3114, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3114 = !DISubroutineType(types: !3115)
!3115 = !{null, !324, !411, !51, !52}
!3116 = !DILocalVariable(name: "legs", arg: 1, scope: !3113, file: !2986, line: 94, type: !324)
!3117 = !DILocation(line: 0, scope: !3113)
!3118 = !DILocalVariable(name: "in", arg: 2, scope: !3113, file: !2986, line: 94, type: !411)
!3119 = !DILocalVariable(name: "a", arg: 3, scope: !3113, file: !2986, line: 94, type: !51)
!3120 = !DILocalVariable(name: "acc", arg: 4, scope: !3113, file: !2986, line: 94, type: !52)
!3121 = !DILocation(line: 95, column: 20, scope: !3113)
!3122 = !DILocalVariable(name: "tab", scope: !3113, file: !2986, line: 95, type: !62)
!3123 = !DILocalVariable(name: "lsb_ask", scope: !3113, file: !2986, line: 97, type: !53)
!3124 = !DILocalVariable(name: "i", scope: !3125, file: !2986, line: 99, type: !86)
!3125 = distinct !DILexicalBlock(scope: !3113, file: !2986, line: 99, column: 5)
!3126 = !DILocation(line: 0, scope: !3125)
!3127 = !DILocation(line: 99, column: 9, scope: !3125)
!3128 = !DILocation(line: 99, scope: !3125)
!3129 = !DILocation(line: 99, column: 20, scope: !3130)
!3130 = distinct !DILexicalBlock(scope: !3125, file: !2986, line: 99, column: 5)
!3131 = !DILocation(line: 99, column: 5, scope: !3125)
!3132 = !DILocation(line: 100, column: 21, scope: !3133)
!3133 = distinct !DILexicalBlock(scope: !3130, file: !2986, line: 99, column: 32)
!3134 = !DILocation(line: 100, column: 33, scope: !3133)
!3135 = !DILocation(line: 100, column: 51, scope: !3133)
!3136 = !DILocation(line: 100, column: 46, scope: !3133)
!3137 = !DILocation(line: 100, column: 44, scope: !3133)
!3138 = !DILocation(line: 101, column: 27, scope: !3133)
!3139 = !DILocation(line: 101, column: 33, scope: !3133)
!3140 = !DILocation(line: 101, column: 52, scope: !3133)
!3141 = !DILocation(line: 101, column: 59, scope: !3133)
!3142 = !DILocation(line: 101, column: 46, scope: !3133)
!3143 = !DILocation(line: 101, column: 44, scope: !3133)
!3144 = !DILocation(line: 101, column: 17, scope: !3133)
!3145 = !DILocation(line: 102, column: 21, scope: !3133)
!3146 = !DILocation(line: 102, column: 27, scope: !3133)
!3147 = !DILocation(line: 102, column: 33, scope: !3133)
!3148 = !DILocation(line: 102, column: 52, scope: !3133)
!3149 = !DILocation(line: 102, column: 59, scope: !3133)
!3150 = !DILocation(line: 102, column: 46, scope: !3133)
!3151 = !DILocation(line: 102, column: 44, scope: !3133)
!3152 = !DILocation(line: 102, column: 17, scope: !3133)
!3153 = !DILocation(line: 103, column: 21, scope: !3133)
!3154 = !DILocation(line: 103, column: 27, scope: !3133)
!3155 = !DILocation(line: 103, column: 33, scope: !3133)
!3156 = !DILocation(line: 103, column: 52, scope: !3133)
!3157 = !DILocation(line: 103, column: 59, scope: !3133)
!3158 = !DILocation(line: 103, column: 46, scope: !3133)
!3159 = !DILocation(line: 103, column: 44, scope: !3133)
!3160 = !DILocation(line: 103, column: 17, scope: !3133)
!3161 = !DILocation(line: 100, column: 9, scope: !3133)
!3162 = !DILocation(line: 100, column: 16, scope: !3133)
!3163 = !DILocation(line: 99, column: 29, scope: !3130)
!3164 = !DILocation(line: 99, column: 5, scope: !3130)
!3165 = distinct !{!3165, !3131, !3166, !388}
!3166 = !DILocation(line: 104, column: 5, scope: !3125)
!3167 = !DILocation(line: 105, column: 1, scope: !3113)
!3168 = distinct !DISubprogram(name: "ef_unpack_m_vec", scope: !2759, file: !2759, line: 44, type: !3169, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3169 = !DISubroutineType(types: !3170)
!3170 = !{null, !86, !411, !61}
!3171 = !DILocalVariable(name: "legs", arg: 1, scope: !3168, file: !2759, line: 44, type: !86)
!3172 = !DILocation(line: 0, scope: !3168)
!3173 = !DILocalVariable(name: "in", arg: 2, scope: !3168, file: !2759, line: 44, type: !411)
!3174 = !DILocalVariable(name: "out", arg: 3, scope: !3168, file: !2759, line: 44, type: !61)
!3175 = !DILocalVariable(name: "in8", scope: !3168, file: !2759, line: 45, type: !90)
!3176 = !DILocalVariable(name: "i", scope: !3177, file: !2759, line: 46, type: !86)
!3177 = distinct !DILexicalBlock(scope: !3168, file: !2759, line: 46, column: 5)
!3178 = !DILocation(line: 0, scope: !3177)
!3179 = !DILocation(line: 46, column: 9, scope: !3177)
!3180 = !DILocation(line: 46, scope: !3177)
!3181 = !DILocation(line: 46, column: 29, scope: !3182)
!3182 = distinct !DILexicalBlock(scope: !3177, file: !2759, line: 46, column: 5)
!3183 = !DILocation(line: 46, column: 22, scope: !3182)
!3184 = !DILocation(line: 46, column: 5, scope: !3177)
!3185 = !DILocation(line: 51, column: 26, scope: !3186)
!3186 = distinct !DILexicalBlock(scope: !3182, file: !2759, line: 46, column: 42)
!3187 = !DILocation(line: 51, column: 21, scope: !3186)
!3188 = !DILocation(line: 51, column: 31, scope: !3186)
!3189 = !DILocation(line: 51, column: 9, scope: !3186)
!3190 = !DILocation(line: 51, column: 18, scope: !3186)
!3191 = !DILocation(line: 52, column: 26, scope: !3186)
!3192 = !DILocation(line: 52, column: 21, scope: !3186)
!3193 = !DILocation(line: 52, column: 30, scope: !3186)
!3194 = !DILocation(line: 52, column: 14, scope: !3186)
!3195 = !DILocation(line: 52, column: 9, scope: !3186)
!3196 = !DILocation(line: 52, column: 18, scope: !3186)
!3197 = !DILocation(line: 46, column: 37, scope: !3182)
!3198 = !DILocation(line: 46, column: 5, scope: !3182)
!3199 = distinct !{!3199, !3184, !3200, !388}
!3200 = !DILocation(line: 54, column: 5, scope: !3177)
!3201 = !DILocation(line: 55, column: 1, scope: !3168)
!3202 = distinct !DISubprogram(name: "mul_table", scope: !577, file: !577, line: 130, type: !578, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3203 = !DILocalVariable(name: "b", arg: 1, scope: !3202, file: !577, line: 130, type: !175)
!3204 = !DILocation(line: 0, scope: !3202)
!3205 = !DILocation(line: 131, column: 19, scope: !3202)
!3206 = !DILocation(line: 131, column: 33, scope: !3202)
!3207 = !DILocalVariable(name: "x", scope: !3202, file: !577, line: 131, type: !62)
!3208 = !DILocalVariable(name: "high_nibble_mask", scope: !3202, file: !577, line: 133, type: !62)
!3209 = !DILocation(line: 135, column: 28, scope: !3202)
!3210 = !DILocalVariable(name: "high_half", scope: !3202, file: !577, line: 135, type: !62)
!3211 = !DILocation(line: 136, column: 28, scope: !3202)
!3212 = !DILocation(line: 136, column: 47, scope: !3202)
!3213 = !DILocation(line: 136, column: 34, scope: !3202)
!3214 = !DILocation(line: 136, column: 5, scope: !3202)
!3215 = distinct !DISubprogram(name: "mul_f", scope: !577, file: !577, line: 9, type: !1558, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3216 = !DILocalVariable(name: "a", arg: 1, scope: !3215, file: !577, line: 9, type: !51)
!3217 = !DILocation(line: 0, scope: !3215)
!3218 = !DILocalVariable(name: "b", arg: 2, scope: !3215, file: !577, line: 9, type: !51)
!3219 = !DILocation(line: 14, column: 10, scope: !3215)
!3220 = !DILocation(line: 14, column: 7, scope: !3215)
!3221 = !DILocation(line: 17, column: 17, scope: !3215)
!3222 = !DILocalVariable(name: "p", scope: !3215, file: !577, line: 11, type: !51)
!3223 = !DILocation(line: 18, column: 13, scope: !3215)
!3224 = !DILocation(line: 18, column: 17, scope: !3215)
!3225 = !DILocation(line: 18, column: 7, scope: !3215)
!3226 = !DILocation(line: 19, column: 13, scope: !3215)
!3227 = !DILocation(line: 19, column: 17, scope: !3215)
!3228 = !DILocation(line: 19, column: 7, scope: !3215)
!3229 = !DILocation(line: 20, column: 13, scope: !3215)
!3230 = !DILocation(line: 20, column: 17, scope: !3215)
!3231 = !DILocation(line: 20, column: 7, scope: !3215)
!3232 = !DILocalVariable(name: "top_p", scope: !3215, file: !577, line: 23, type: !51)
!3233 = !DILocation(line: 24, column: 37, scope: !3215)
!3234 = !DILocation(line: 24, column: 52, scope: !3215)
!3235 = !DILocation(line: 24, column: 43, scope: !3215)
!3236 = !DILocation(line: 24, column: 59, scope: !3215)
!3237 = !DILocalVariable(name: "out", scope: !3215, file: !577, line: 24, type: !51)
!3238 = !DILocation(line: 25, column: 5, scope: !3215)
!3239 = distinct !DISubprogram(name: "lincomb", scope: !577, file: !577, line: 70, type: !1566, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3240 = !DILocalVariable(name: "a", arg: 1, scope: !3239, file: !577, line: 70, type: !90)
!3241 = !DILocation(line: 0, scope: !3239)
!3242 = !DILocalVariable(name: "b", arg: 2, scope: !3239, file: !577, line: 71, type: !90)
!3243 = !DILocalVariable(name: "n", arg: 3, scope: !3239, file: !577, line: 71, type: !86)
!3244 = !DILocalVariable(name: "m", arg: 4, scope: !3239, file: !577, line: 71, type: !86)
!3245 = !DILocalVariable(name: "ret", scope: !3239, file: !577, line: 72, type: !51)
!3246 = !DILocalVariable(name: "i", scope: !3247, file: !577, line: 73, type: !86)
!3247 = distinct !DILexicalBlock(scope: !3239, file: !577, line: 73, column: 5)
!3248 = !DILocation(line: 0, scope: !3247)
!3249 = !DILocation(line: 73, column: 10, scope: !3247)
!3250 = !DILocation(line: 73, scope: !3247)
!3251 = !DILocation(line: 73, column: 23, scope: !3252)
!3252 = distinct !DILexicalBlock(scope: !3247, file: !577, line: 73, column: 5)
!3253 = !DILocation(line: 73, column: 5, scope: !3247)
!3254 = !DILocation(line: 74, column: 27, scope: !3255)
!3255 = distinct !DILexicalBlock(scope: !3252, file: !577, line: 73, column: 41)
!3256 = !DILocation(line: 74, column: 33, scope: !3255)
!3257 = !DILocation(line: 74, column: 21, scope: !3255)
!3258 = !DILocation(line: 74, column: 15, scope: !3255)
!3259 = !DILocation(line: 73, column: 28, scope: !3252)
!3260 = !DILocation(line: 73, column: 35, scope: !3252)
!3261 = !DILocation(line: 73, column: 5, scope: !3252)
!3262 = distinct !{!3262, !3253, !3263, !388}
!3263 = !DILocation(line: 75, column: 5, scope: !3247)
!3264 = !DILocation(line: 76, column: 5, scope: !3239)
!3265 = distinct !DISubprogram(name: "add_f", scope: !577, file: !577, line: 43, type: !1558, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3266 = !DILocalVariable(name: "a", arg: 1, scope: !3265, file: !577, line: 43, type: !51)
!3267 = !DILocation(line: 0, scope: !3265)
!3268 = !DILocalVariable(name: "b", arg: 2, scope: !3265, file: !577, line: 43, type: !51)
!3269 = !DILocation(line: 44, column: 14, scope: !3265)
!3270 = !DILocation(line: 44, column: 5, scope: !3265)
