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
    #dbg_value(i32 486, !155, !DIExpression(), !152)
  store i32 486, ptr %smlen, align 4, !dbg !156
  %call = call dereferenceable_or_null(1420) ptr @calloc(i32 noundef 1420, i32 noundef 1) #7, !dbg !157
    #dbg_value(ptr %call, !158, !DIExpression(), !152)
  %call1 = call dereferenceable_or_null(24) ptr @calloc(i32 noundef 24, i32 noundef 1) #7, !dbg !159
    #dbg_value(ptr %call1, !160, !DIExpression(), !152)
  %call2 = call dereferenceable_or_null(149640) ptr @calloc(i32 noundef 1, i32 noundef 149640) #7, !dbg !161
    #dbg_value(ptr %call2, !162, !DIExpression(), !152)
  %call3 = call dereferenceable_or_null(148824) ptr @calloc(i32 noundef 1, i32 noundef 148824) #7, !dbg !163
    #dbg_value(ptr %call3, !164, !DIExpression(), !152)
  %0 = load i32, ptr %msglen, align 4, !dbg !179
    #dbg_value(i32 %0, !153, !DIExpression(), !152)
  %add4 = add i32 %0, 454, !dbg !180
  %call5 = call ptr @calloc(i32 noundef %add4, i32 noundef 1) #7, !dbg !181
    #dbg_value(ptr %call5, !182, !DIExpression(), !152)
    #dbg_declare(ptr %msg, !183, !DIExpression(), !187)
  call void @llvm.memcpy.p0.p0.i32(ptr noundef nonnull align 1 dereferenceable(32) %msg, ptr noundef nonnull align 1 dereferenceable(32) @__const.example_mayo.msg, i32 32, i1 false), !dbg !187
    #dbg_declare(ptr %msg2, !188, !DIExpression(), !189)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(32) %msg2, i8 0, i32 32, i1 false), !dbg !189
  %call6 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str, ptr noundef nonnull @.str.1) #8, !dbg !190
  %call7 = call i32 (ptr, ...) @printf(ptr noundef nonnull @.str.2) #8, !dbg !191
  %call8 = call i32 @pqmayo_MAYO_1_ref_mayo_keypair(ptr noundef %p, ptr noundef %call, ptr noundef %call1) #6, !dbg !192
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
  %call12 = call i32 @pqmayo_MAYO_1_ref_mayo_expand_sk(ptr noundef %p, ptr noundef %call1, ptr noundef %call3) #6, !dbg !202
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
  %call20 = call i32 @pqmayo_MAYO_1_ref_mayo_expand_pk(ptr noundef %p, ptr noundef %call, ptr noundef %call2) #6, !dbg !211
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
  %call28 = call i32 @pqmayo_MAYO_1_ref_mayo_sign(ptr noundef %p, ptr noundef %call5, ptr noundef nonnull %smlen, ptr noundef nonnull %msg, i32 noundef %1, ptr noundef %call1) #6, !dbg !221
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
  %call37 = call i32 @pqmayo_MAYO_1_ref_mayo_open(ptr noundef %p, ptr noundef nonnull %msg2, ptr noundef nonnull %msglen, ptr noundef %call5, i32 noundef %2, ptr noundef %call) #6, !dbg !231
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
  %call49 = call i32 @pqmayo_MAYO_1_ref_mayo_verify(ptr noundef %p, ptr noundef nonnull %msg, i32 noundef %4, ptr noundef %call5, ptr noundef %call) #6, !dbg !244
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
  call void @mayo_secure_free(ptr noundef %call3, i32 noundef 148824) #8, !dbg !258
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
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_1_ref_mayo_keypair(ptr noundef %p, ptr noundef %pk, ptr noundef %sk) local_unnamed_addr #0 !dbg !261 {
entry:
    #dbg_value(ptr %p, !292, !DIExpression(), !293)
    #dbg_value(ptr %pk, !294, !DIExpression(), !293)
    #dbg_value(ptr %sk, !295, !DIExpression(), !293)
    #dbg_value(i32 0, !296, !DIExpression(), !293)
  %call = call i32 @pqmayo_MAYO_1_ref_mayo_keypair_compact(ptr noundef %p, ptr noundef %pk, ptr noundef %sk) #6, !dbg !297
    #dbg_value(i32 %call, !296, !DIExpression(), !293)
    #dbg_label(!298, !299)
  ret i32 %call, !dbg !300
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_1_ref_mayo_keypair_compact(ptr noundef %p, ptr noundef %cpk, ptr noundef %csk) local_unnamed_addr #0 !dbg !301 {
entry:
  %S = alloca [328 x i8], align 1
  %P = alloca [18525 x i64], align 8
  %P3 = alloca [320 x i64], align 8
  %O = alloca [624 x i8], align 1
  %P3_upper = alloca [180 x i64], align 8
    #dbg_value(ptr %p, !302, !DIExpression(), !303)
    #dbg_value(ptr %cpk, !304, !DIExpression(), !303)
    #dbg_value(ptr %csk, !305, !DIExpression(), !303)
    #dbg_value(i32 0, !306, !DIExpression(), !303)
    #dbg_value(ptr %csk, !307, !DIExpression(), !303)
    #dbg_declare(ptr %S, !308, !DIExpression(), !312)
    #dbg_declare(ptr %P, !313, !DIExpression(), !314)
    #dbg_declare(ptr %P3, !315, !DIExpression(), !319)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(2560) %P3, i8 0, i32 2560, i1 false), !dbg !319
    #dbg_declare(ptr %O, !320, !DIExpression(), !322)
    #dbg_value(i32 5, !323, !DIExpression(), !303)
    #dbg_value(i32 78, !325, !DIExpression(), !303)
    #dbg_value(i32 78, !326, !DIExpression(), !303)
    #dbg_value(i32 8, !327, !DIExpression(), !303)
    #dbg_value(i32 312, !328, !DIExpression(), !303)
    #dbg_value(i32 15405, !329, !DIExpression(), !303)
    #dbg_value(i32 180, !330, !DIExpression(), !303)
    #dbg_value(i32 16, !331, !DIExpression(), !303)
    #dbg_value(i32 24, !332, !DIExpression(), !303)
    #dbg_value(ptr %P, !333, !DIExpression(), !303)
  %add.ptr = getelementptr inbounds nuw i8, ptr %P, i32 123240, !dbg !334
    #dbg_value(ptr %add.ptr, !335, !DIExpression(), !303)
  %call = call i32 @randombytes(ptr noundef %csk, i32 noundef 24) #8, !dbg !336
  %cmp.not = icmp eq i32 %call, 0, !dbg !338
  br i1 %cmp.not, label %if.end, label %err, !dbg !338

if.end:                                           ; preds = %entry
    #dbg_value(ptr %P, !333, !DIExpression(), !303)
  %call3 = call i32 @shake256(ptr noundef nonnull %S, i32 noundef 328, ptr noundef %csk, i32 noundef 24) #8, !dbg !339
    #dbg_value(ptr %S, !340, !DIExpression(), !303)
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %S, i32 16, !dbg !341
  call fastcc void @decode(ptr noundef nonnull %add.ptr6, ptr noundef nonnull %O, i32 noundef 624) #6, !dbg !342
  call fastcc void @expand_P1_P2(ptr noundef %p, ptr noundef nonnull %P, ptr noundef nonnull %S) #6, !dbg !343
  call fastcc void @compute_P3(ptr noundef %p, ptr noundef nonnull %P, ptr noundef nonnull %add.ptr, ptr noundef nonnull %O, ptr noundef nonnull %P3) #6, !dbg !344
  %call11 = call ptr @memcpy(ptr noundef %cpk, ptr noundef nonnull %S, i32 noundef 16) #8, !dbg !345
    #dbg_declare(ptr %P3_upper, !346, !DIExpression(), !350)
  call void @pqmayo_MAYO_1_ref_m_upper(ptr noundef %p, ptr noundef nonnull %P3, ptr noundef nonnull %P3_upper, i32 noundef 8) #6, !dbg !351
  %add.ptr15 = getelementptr inbounds nuw i8, ptr %cpk, i32 16, !dbg !352
  call fastcc void @pack_m_vecs(ptr noundef nonnull %P3_upper, ptr noundef nonnull %add.ptr15, i32 noundef 36, i32 noundef 78) #6, !dbg !353
  br label %err, !dbg !353

err:                                              ; preds = %entry, %if.end
  %ret.0 = phi i32 [ 0, %if.end ], [ 1, %entry ], !dbg !303
    #dbg_value(i32 %ret.0, !306, !DIExpression(), !303)
    #dbg_label(!354, !355)
  call void @mayo_secure_clear(ptr noundef nonnull %O, i32 noundef 624) #8, !dbg !356
  call void @mayo_secure_clear(ptr noundef nonnull %add.ptr, i32 noundef 24960) #8, !dbg !357
  call void @mayo_secure_clear(ptr noundef nonnull %P3, i32 noundef 2560) #8, !dbg !358
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
  %call = call i32 @AES_128_CTR(ptr noundef %P, i32 noundef 144495, ptr noundef %seed_pk, i32 noundef 16) #8, !dbg !404
  call fastcc void @unpack_m_vecs(ptr noundef %P, ptr noundef %P, i32 noundef 3705, i32 noundef 78) #6, !dbg !405
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
    #dbg_value(i32 5, !418, !DIExpression(), !413)
    #dbg_value(i32 78, !419, !DIExpression(), !413)
    #dbg_value(i32 8, !420, !DIExpression(), !413)
  call fastcc void @P1_times_O(ptr noundef %p, ptr noundef %P1, ptr noundef %O, ptr noundef %P2) #6, !dbg !421
  call fastcc void @mul_add_mat_trans_x_m_mat(i32 noundef 5, ptr noundef %O, ptr noundef %P2, ptr noundef %P3, i32 noundef 78, i32 noundef 8, i32 noundef 8) #6, !dbg !422
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
  call fastcc void @mul_add_m_upper_triangular_mat_x_mat(i32 noundef 5, ptr noundef %P1, ptr noundef %O, ptr noundef %acc, i32 noundef 78, i32 noundef 78, i32 noundef 8, i32 noundef 1) #6, !dbg !466
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
  %arrayidx.4 = getelementptr inbounds nuw i8, ptr %in, i32 32, !dbg !543
  %16 = load i64, ptr %arrayidx.4, align 8, !dbg !543
  %and.4 = and i64 %16, 1229782938247303441, !dbg !546
  %and1.4 = and i32 %call, 255, !dbg !547
  %conv.4 = zext nneg i32 %and1.4 to i64, !dbg !548
  %mul.4 = mul i64 %and.4, %conv.4, !dbg !549
  %shr.4 = lshr i64 %16, 1, !dbg !550
  %and3.4 = and i64 %shr.4, 1229782938247303441, !dbg !551
  %shr4.4 = lshr i32 %call, 8, !dbg !552
  %and5.4 = and i32 %shr4.4, 15, !dbg !553
  %conv6.4 = zext nneg i32 %and5.4 to i64, !dbg !554
  %mul7.4 = mul nuw i64 %and3.4, %conv6.4, !dbg !555
  %xor.4 = xor i64 %mul.4, %mul7.4, !dbg !556
  %arrayidx8.4 = getelementptr inbounds nuw i8, ptr %in, i32 32, !dbg !557
  %17 = load i64, ptr %arrayidx8.4, align 8, !dbg !557
  %shr9.4 = lshr i64 %17, 2, !dbg !558
  %and10.4 = and i64 %shr9.4, 1229782938247303441, !dbg !559
  %shr11.4 = lshr i32 %call, 16, !dbg !560
  %and12.4 = and i32 %shr11.4, 15, !dbg !561
  %conv13.4 = zext nneg i32 %and12.4 to i64, !dbg !562
  %mul14.4 = mul nuw i64 %and10.4, %conv13.4, !dbg !563
  %xor15.4 = xor i64 %xor.4, %mul14.4, !dbg !564
  %arrayidx16.4 = getelementptr inbounds nuw i8, ptr %in, i32 32, !dbg !565
  %18 = load i64, ptr %arrayidx16.4, align 8, !dbg !565
  %shr17.4 = lshr i64 %18, 3, !dbg !566
  %and18.4 = and i64 %shr17.4, 1229782938247303441, !dbg !567
  %shr19.4 = lshr i32 %call, 24, !dbg !568
  %and20.4 = and i32 %shr19.4, 15, !dbg !569
  %conv21.4 = zext nneg i32 %and20.4 to i64, !dbg !570
  %mul22.4 = mul nuw i64 %and18.4, %conv21.4, !dbg !571
  %xor23.4 = xor i64 %xor15.4, %mul22.4, !dbg !572
  %arrayidx24.4 = getelementptr inbounds nuw i8, ptr %acc, i32 32, !dbg !574
  %19 = load i64, ptr %arrayidx24.4, align 8, !dbg !573
  %xor25.4 = xor i64 %19, %xor23.4, !dbg !573
  store i64 %xor25.4, ptr %arrayidx24.4, align 8, !dbg !573
    #dbg_value(i32 5, !540, !DIExpression(), !542)
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
  %tmp = alloca [5 x i64], align 8
    #dbg_value(ptr %in, !659, !DIExpression(), !660)
    #dbg_value(ptr %out, !661, !DIExpression(), !660)
    #dbg_value(i32 %vecs, !662, !DIExpression(), !660)
    #dbg_value(i32 %m, !663, !DIExpression(), !660)
  %add = add nsw i32 %m, 15, !dbg !664
  %div = sdiv i32 %add, 16, !dbg !665
    #dbg_value(i32 %div, !666, !DIExpression(), !660)
    #dbg_value(ptr %out, !667, !DIExpression(), !660)
    #dbg_declare(ptr %tmp, !668, !DIExpression(), !672)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(40) %tmp, i8 0, i32 40, i1 false), !dbg !672
    #dbg_value(i32 %vecs, !673, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !675)
  br label %for.cond, !dbg !676

for.cond:                                         ; preds = %for.body, %entry
  %i.0.in = phi i32 [ %vecs, %entry ], [ %i.0, %for.body ]
    #dbg_value(i32 %i.0.in, !673, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !675)
  %cmp = icmp sgt i32 %i.0.in, 0, !dbg !677
  br i1 %cmp, label %for.body, label %for.end, !dbg !679

for.body:                                         ; preds = %for.cond
  %i.0 = add nsw i32 %i.0.in, -1, !dbg !680
    #dbg_value(i32 %i.0, !673, !DIExpression(), !675)
  %mul = mul nsw i32 %i.0, %m, !dbg !681
  %div1 = sdiv i32 %mul, 2, !dbg !683
  %add.ptr = getelementptr inbounds i8, ptr %in, i32 %div1, !dbg !684
  %div2 = sdiv i32 %m, 2, !dbg !685
  %call = call ptr @memcpy(ptr noundef nonnull %tmp, ptr noundef %add.ptr, i32 noundef %div2) #8, !dbg !686
  %mul3 = mul nsw i32 %i.0, %div, !dbg !687
  %mul4 = shl i32 %mul3, 3, !dbg !688
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %out, i32 %mul4, !dbg !689
  %mul7 = shl nsw i32 %div, 3, !dbg !690
  %call8 = call ptr @memcpy(ptr noundef %add.ptr5, ptr noundef nonnull %tmp, i32 noundef %mul7) #8, !dbg !691
    #dbg_value(i32 %i.0, !673, !DIExpression(DW_OP_constu, 1, DW_OP_minus, DW_OP_stack_value), !675)
  br label %for.cond, !dbg !692, !llvm.loop !693

for.end:                                          ; preds = %for.cond
  ret void, !dbg !695
}

; Function Attrs: nounwind
define dso_local i32 @pqmayo_MAYO_1_ref_mayo_expand_sk(ptr noundef %p, ptr noundef %csk, ptr noundef %sk) local_unnamed_addr #0 !dbg !696 {
entry:
  %S = alloca [328 x i8], align 1
    #dbg_value(ptr %p, !705, !DIExpression(), !706)
    #dbg_value(ptr %csk, !707, !DIExpression(), !706)
    #dbg_value(ptr %sk, !708, !DIExpression(), !706)
    #dbg_value(i32 0, !709, !DIExpression(), !706)
    #dbg_declare(ptr %S, !710, !DIExpression(), !711)
    #dbg_value(ptr %sk, !712, !DIExpression(), !706)
  %O2 = getelementptr inbounds nuw i8, ptr %sk, i32 148200, !dbg !713
    #dbg_value(ptr %O2, !714, !DIExpression(), !706)
    #dbg_value(i32 8, !715, !DIExpression(), !706)
    #dbg_value(i32 78, !716, !DIExpression(), !706)
    #dbg_value(i32 312, !717, !DIExpression(), !706)
    #dbg_value(i32 16, !718, !DIExpression(), !706)
    #dbg_value(i32 24, !719, !DIExpression(), !706)
    #dbg_value(ptr %csk, !720, !DIExpression(), !706)
    #dbg_value(ptr %S, !721, !DIExpression(), !706)
  %call = call i32 @shake256(ptr noundef nonnull %S, i32 noundef 328, ptr noundef %csk, i32 noundef 24) #8, !dbg !722
  %add.ptr = getelementptr inbounds nuw i8, ptr %S, i32 16, !dbg !723
  call fastcc void @decode(ptr noundef nonnull %add.ptr, ptr noundef nonnull %O2, i32 noundef 624) #6, !dbg !724
  call fastcc void @expand_P1_P2(ptr noundef %p, ptr noundef %sk, ptr noundef nonnull %S) #6, !dbg !725
  %add.ptr7 = getelementptr inbounds nuw i8, ptr %sk, i32 123240, !dbg !726
    #dbg_value(ptr %add.ptr7, !727, !DIExpression(), !706)
    #dbg_value(ptr %sk, !728, !DIExpression(), !706)
    #dbg_value(ptr %add.ptr7, !729, !DIExpression(), !706)
  call fastcc void @P1P1t_times_O(ptr noundef %p, ptr noundef %sk, ptr noundef nonnull %O2, ptr noundef nonnull %add.ptr7) #6, !dbg !730
  call void @mayo_secure_clear(ptr noundef nonnull %S, i32 noundef 328) #8, !dbg !731
  ret i32 0, !dbg !732
}

; Function Attrs: nounwind
define internal fastcc void @P1P1t_times_O(ptr noundef %p, ptr noundef %P1, ptr noundef %O, ptr noundef %acc) unnamed_addr #0 !dbg !733 {
entry:
    #dbg_value(ptr %p, !734, !DIExpression(), !735)
    #dbg_value(ptr %P1, !736, !DIExpression(), !735)
    #dbg_value(ptr %O, !737, !DIExpression(), !735)
    #dbg_value(ptr %acc, !738, !DIExpression(), !735)
    #dbg_value(i32 8, !739, !DIExpression(), !735)
    #dbg_value(i32 78, !740, !DIExpression(), !735)
    #dbg_value(i32 5, !741, !DIExpression(), !735)
    #dbg_value(i32 0, !742, !DIExpression(), !735)
    #dbg_value(i32 0, !743, !DIExpression(), !745)
  br label %for.cond, !dbg !746

for.cond:                                         ; preds = %for.inc27, %entry
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc27 ], [ 78, %entry ], !dbg !747
  %bs_mat_entries_used.0 = phi i32 [ %bs_mat_entries_used.1, %for.inc27 ], [ 0, %entry ], !dbg !747
  %r.0 = phi i32 [ %inc28, %for.inc27 ], [ 0, %entry ], !dbg !748
    #dbg_value(i32 %r.0, !743, !DIExpression(), !745)
    #dbg_value(i32 %bs_mat_entries_used.0, !742, !DIExpression(), !735)
  %exitcond2.not = icmp eq i32 %r.0, 78, !dbg !749
  br i1 %exitcond2.not, label %for.end29, label %for.cond1.preheader, !dbg !751

for.cond1.preheader:                              ; preds = %for.cond
  %0 = add i32 %bs_mat_entries_used.0, %indvars.iv, !dbg !752
  br label %for.cond1, !dbg !752

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc25
  %bs_mat_entries_used.1 = phi i32 [ %bs_mat_entries_used.2, %for.inc25 ], [ %bs_mat_entries_used.0, %for.cond1.preheader ], !dbg !735
  %c.0 = phi i32 [ %inc, %for.inc25 ], [ %r.0, %for.cond1.preheader ], !dbg !755
    #dbg_value(i32 %c.0, !756, !DIExpression(), !757)
    #dbg_value(i32 %bs_mat_entries_used.1, !742, !DIExpression(), !735)
  %exitcond1.not = icmp eq i32 %bs_mat_entries_used.1, %0, !dbg !758
  br i1 %exitcond1.not, label %for.inc27, label %for.body3, !dbg !752

for.body3:                                        ; preds = %for.cond1
  %cmp4 = icmp eq i32 %c.0, %r.0, !dbg !760
  br i1 %cmp4, label %for.inc25, label %for.cond5.preheader, !dbg !760

for.cond5.preheader:                              ; preds = %for.body3
  %add.ptr.idx.1 = mul nsw i32 %bs_mat_entries_used.1, 40, !dbg !763
  %add.ptr.1 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.1, !dbg !763
  %mul8.1 = shl nuw nsw i32 %c.0, 3, !dbg !767
  br label %for.cond5, !dbg !768

for.cond5:                                        ; preds = %for.body7.2, %for.cond5.preheader
  %k.0 = phi i32 [ 0, %for.cond5.preheader ], [ %add23.2, %for.body7.2 ], !dbg !769
    #dbg_value(i32 %k.0, !770, !DIExpression(), !771)
  %add.ptr.idx = mul nsw i32 %bs_mat_entries_used.1, 40, !dbg !763
  %add.ptr = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx, !dbg !763
  %mul8 = shl nuw nsw i32 %c.0, 3, !dbg !767
  %add9 = or disjoint i32 %mul8, %k.0, !dbg !772
  %arrayidx = getelementptr inbounds nuw i8, ptr %O, i32 %add9, !dbg !773
  %1 = load i8, ptr %arrayidx, align 1, !dbg !773
  %mul10 = shl nuw nsw i32 %r.0, 3, !dbg !774
  %add11 = or disjoint i32 %mul10, %k.0, !dbg !775
  %add.ptr13.idx = mul nuw nsw i32 %add11, 40, !dbg !776
  %add.ptr13 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr13.idx, !dbg !776
  call fastcc void @m_vec_mul_add(i32 noundef 5, ptr noundef %add.ptr, i8 noundef zeroext %1, ptr noundef %add.ptr13) #6, !dbg !777
  %add.ptr15.idx = mul nsw i32 %bs_mat_entries_used.1, 40, !dbg !778
  %add.ptr15 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr15.idx, !dbg !778
  %mul16 = shl nuw nsw i32 %r.0, 3, !dbg !779
  %add17 = or disjoint i32 %mul16, %k.0, !dbg !780
  %arrayidx18 = getelementptr inbounds nuw i8, ptr %O, i32 %add17, !dbg !781
  %2 = load i8, ptr %arrayidx18, align 1, !dbg !781
  %mul19 = shl nuw nsw i32 %c.0, 3, !dbg !782
  %add20 = or disjoint i32 %mul19, %k.0, !dbg !783
  %add.ptr22.idx = mul nuw nsw i32 %add20, 40, !dbg !784
  %add.ptr22 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr22.idx, !dbg !784
  call fastcc void @m_vec_mul_add(i32 noundef 5, ptr noundef %add.ptr15, i8 noundef zeroext %2, ptr noundef %add.ptr22) #6, !dbg !785
    #dbg_value(i32 %k.0, !770, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !771)
  %add23 = add nuw nsw i32 %k.0, 1, !dbg !786
    #dbg_value(i32 %add23, !770, !DIExpression(), !771)
  %add9.1 = or disjoint i32 %mul8.1, %add23, !dbg !772
  %arrayidx.1 = getelementptr inbounds nuw i8, ptr %O, i32 %add9.1, !dbg !773
  %3 = load i8, ptr %arrayidx.1, align 1, !dbg !773
  %mul10.1 = shl nuw nsw i32 %r.0, 3, !dbg !774
  %add11.1 = or disjoint i32 %mul10.1, %add23, !dbg !775
  %add.ptr13.idx.1 = mul nuw nsw i32 %add11.1, 40, !dbg !776
  %add.ptr13.1 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr13.idx.1, !dbg !776
  call fastcc void @m_vec_mul_add(i32 noundef 5, ptr noundef %add.ptr.1, i8 noundef zeroext %3, ptr noundef nonnull %add.ptr13.1) #6, !dbg !777
  %add.ptr15.idx.1 = mul nsw i32 %bs_mat_entries_used.1, 40, !dbg !778
  %add.ptr15.1 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr15.idx.1, !dbg !778
  %mul16.1 = shl nuw nsw i32 %r.0, 3, !dbg !779
  %add17.1 = or disjoint i32 %mul16.1, %add23, !dbg !780
  %arrayidx18.1 = getelementptr inbounds nuw i8, ptr %O, i32 %add17.1, !dbg !781
  %4 = load i8, ptr %arrayidx18.1, align 1, !dbg !781
  %mul19.1 = shl nuw nsw i32 %c.0, 3, !dbg !782
  %add20.1 = or disjoint i32 %mul19.1, %add23, !dbg !783
  %add.ptr22.idx.1 = mul nuw nsw i32 %add20.1, 40, !dbg !784
  %add.ptr22.1 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr22.idx.1, !dbg !784
  call fastcc void @m_vec_mul_add(i32 noundef 5, ptr noundef %add.ptr15.1, i8 noundef zeroext %4, ptr noundef nonnull %add.ptr22.1) #6, !dbg !785
  %add23.1 = add nuw nsw i32 %k.0, 2, !dbg !786
    #dbg_value(i32 %add23.1, !770, !DIExpression(), !771)
  %exitcond.2.not = icmp eq i32 %add23.1, 8, !dbg !787
  br i1 %exitcond.2.not, label %for.inc25, label %for.body7.2, !dbg !768

for.body7.2:                                      ; preds = %for.cond5
  %add.ptr.idx.2 = mul nsw i32 %bs_mat_entries_used.1, 40, !dbg !763
  %add.ptr.2 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr.idx.2, !dbg !763
  %mul8.2 = shl nuw nsw i32 %c.0, 3, !dbg !767
  %add9.2 = or disjoint i32 %mul8.2, %add23.1, !dbg !772
  %arrayidx.2 = getelementptr inbounds nuw i8, ptr %O, i32 %add9.2, !dbg !773
  %5 = load i8, ptr %arrayidx.2, align 1, !dbg !773
  %mul10.2 = shl nuw nsw i32 %r.0, 3, !dbg !774
  %add11.2 = or disjoint i32 %mul10.2, %add23.1, !dbg !775
  %add.ptr13.idx.2 = mul nuw nsw i32 %add11.2, 40, !dbg !776
  %add.ptr13.2 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr13.idx.2, !dbg !776
  call fastcc void @m_vec_mul_add(i32 noundef 5, ptr noundef %add.ptr.2, i8 noundef zeroext %5, ptr noundef nonnull %add.ptr13.2) #6, !dbg !777
  %add.ptr15.idx.2 = mul nsw i32 %bs_mat_entries_used.1, 40, !dbg !778
  %add.ptr15.2 = getelementptr inbounds i8, ptr %P1, i32 %add.ptr15.idx.2, !dbg !778
  %mul16.2 = shl nuw nsw i32 %r.0, 3, !dbg !779
  %add17.2 = or disjoint i32 %mul16.2, %add23.1, !dbg !780
  %arrayidx18.2 = getelementptr inbounds nuw i8, ptr %O, i32 %add17.2, !dbg !781
  %6 = load i8, ptr %arrayidx18.2, align 1, !dbg !781
  %mul19.2 = shl nuw nsw i32 %c.0, 3, !dbg !782
  %add20.2 = or disjoint i32 %mul19.2, %add23.1, !dbg !783
  %add.ptr22.idx.2 = mul nuw nsw i32 %add20.2, 40, !dbg !784
  %add.ptr22.2 = getelementptr inbounds nuw i8, ptr %acc, i32 %add.ptr22.idx.2, !dbg !784
  call fastcc void @m_vec_mul_add(i32 noundef 5, ptr noundef %add.ptr15.2, i8 noundef zeroext %6, ptr noundef nonnull %add.ptr22.2) #6, !dbg !785
  %add23.2 = add nuw nsw i32 %k.0, 3, !dbg !786
    #dbg_value(i32 %add23.2, !770, !DIExpression(), !771)
  br label %for.cond5, !dbg !788, !llvm.loop !789

for.inc25:                                        ; preds = %for.cond5, %for.body3
  %bs_mat_entries_used.2 = add i32 %bs_mat_entries_used.1, 1, !dbg !791
    #dbg_value(i32 %bs_mat_entries_used.2, !742, !DIExpression(), !735)
  %inc = add nuw nsw i32 %c.0, 1, !dbg !792
    #dbg_value(i32 %inc, !756, !DIExpression(), !757)
  br label %for.cond1, !dbg !793, !llvm.loop !794

for.inc27:                                        ; preds = %for.cond1
  %inc28 = add nuw nsw i32 %r.0, 1, !dbg !796
    #dbg_value(i32 %inc28, !743, !DIExpression(), !745)
  %indvars.iv.next = add nsw i32 %indvars.iv, -1, !dbg !797
  br label %for.cond, !dbg !797, !llvm.loop !798

for.end29:                                        ; preds = %for.cond
  ret void, !dbg !800
}

; Function Attrs: nounwind
define dso_local i32 @pqmayo_MAYO_1_ref_mayo_sign_signature(ptr noundef %p, ptr noundef %sig, ptr noundef %siglen, ptr noundef %m, i32 noundef %mlen, ptr noundef %csk) local_unnamed_addr #0 !dbg !801 {
entry:
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
    #dbg_value(ptr %p, !805, !DIExpression(), !806)
    #dbg_value(ptr %sig, !807, !DIExpression(), !806)
    #dbg_value(ptr %siglen, !808, !DIExpression(), !806)
    #dbg_value(ptr %m, !809, !DIExpression(), !806)
    #dbg_value(i32 %mlen, !810, !DIExpression(), !806)
    #dbg_value(ptr %csk, !811, !DIExpression(), !806)
    #dbg_value(i32 0, !812, !DIExpression(), !806)
    #dbg_declare(ptr %tenc, !813, !DIExpression(), !815)
    #dbg_declare(ptr %t, !816, !DIExpression(), !820)
    #dbg_declare(ptr %y, !821, !DIExpression(), !822)
    #dbg_declare(ptr %salt, !823, !DIExpression(), !827)
    #dbg_declare(ptr %V, !828, !DIExpression(), !832)
    #dbg_declare(ptr %Vdec, !833, !DIExpression(), !837)
    #dbg_declare(ptr %A, !838, !DIExpression(), !842)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(6480) %A, i8 0, i32 6480, i1 false), !dbg !842
    #dbg_declare(ptr %x, !843, !DIExpression(), !847)
    #dbg_declare(ptr %r, !848, !DIExpression(), !852)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(81) %r, i8 0, i32 81, i1 false), !dbg !852
    #dbg_declare(ptr %s, !853, !DIExpression(), !854)
    #dbg_declare(ptr %sk, !855, !DIExpression(), !856)
    #dbg_declare(ptr %Ox, !857, !DIExpression(), !858)
    #dbg_declare(ptr %tmp, !859, !DIExpression(), !860)
    #dbg_value(i32 78, !861, !DIExpression(), !806)
    #dbg_value(i32 86, !862, !DIExpression(), !806)
    #dbg_value(i32 8, !863, !DIExpression(), !806)
    #dbg_value(i32 10, !864, !DIExpression(), !806)
    #dbg_value(i32 78, !865, !DIExpression(), !806)
    #dbg_value(i32 39, !866, !DIExpression(), !806)
    #dbg_value(i32 39, !867, !DIExpression(), !806)
    #dbg_value(i32 40, !868, !DIExpression(), !806)
    #dbg_value(i32 454, !869, !DIExpression(), !806)
    #dbg_value(i32 81, !870, !DIExpression(), !806)
    #dbg_value(i32 32, !871, !DIExpression(), !806)
    #dbg_value(i32 24, !872, !DIExpression(), !806)
    #dbg_value(i32 24, !873, !DIExpression(), !806)
  %call = call i32 @pqmayo_MAYO_1_ref_mayo_expand_sk(ptr noundef %p, ptr noundef %csk, ptr noundef nonnull %sk) #6, !dbg !874
    #dbg_value(i32 %call, !812, !DIExpression(), !806)
  %cmp.not = icmp eq i32 %call, 0, !dbg !875
  br i1 %cmp.not, label %if.end, label %err, !dbg !875

if.end:                                           ; preds = %entry
    #dbg_value(ptr %csk, !877, !DIExpression(), !806)
  %call1 = call i32 @shake256(ptr noundef nonnull %tmp, i32 noundef 32, ptr noundef %m, i32 noundef %mlen) #8, !dbg !878
    #dbg_value(ptr %sk, !879, !DIExpression(), !806)
  %add.ptr = getelementptr inbounds nuw i8, ptr %sk, i32 123240, !dbg !880
    #dbg_value(ptr %add.ptr, !881, !DIExpression(), !806)
    #dbg_declare(ptr %Mtmp, !882, !DIExpression(), !886)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(3200) %Mtmp, i8 0, i32 3200, i1 false), !dbg !886
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %tmp, i32 32, !dbg !887
  %call6 = call i32 @randombytes(ptr noundef nonnull %add.ptr5, i32 noundef 24) #8, !dbg !889
  %cmp7.not = icmp eq i32 %call6, 0, !dbg !890
  br i1 %cmp7.not, label %if.end9, label %err, !dbg !890

if.end9:                                          ; preds = %if.end
  %add.ptr12 = getelementptr inbounds nuw i8, ptr %tmp, i32 56, !dbg !891
  %call13 = call ptr @memcpy(ptr noundef nonnull %add.ptr12, ptr noundef %csk, i32 noundef 24) #8, !dbg !892
  %call16 = call i32 @shake256(ptr noundef nonnull %salt, i32 noundef 24, ptr noundef nonnull %tmp, i32 noundef 80) #8, !dbg !893
  %add.ptr18 = getelementptr inbounds nuw i8, ptr %tmp, i32 32, !dbg !894
  %call20 = call ptr @memcpy(ptr noundef nonnull %add.ptr18, ptr noundef nonnull %salt, i32 noundef 24) #8, !dbg !895
  %add.ptr24 = getelementptr inbounds nuw i8, ptr %tmp, i32 80, !dbg !896
    #dbg_value(ptr %add.ptr24, !897, !DIExpression(), !806)
  %call27 = call i32 @shake256(ptr noundef nonnull %tenc, i32 noundef 39, ptr noundef nonnull %tmp, i32 noundef 56) #8, !dbg !898
  call fastcc void @decode(ptr noundef nonnull %tenc, ptr noundef nonnull %t, i32 noundef 78) #6, !dbg !899
    #dbg_value(i32 0, !900, !DIExpression(), !902)
  %add.ptr61 = getelementptr inbounds nuw i8, ptr %V, i32 390, !dbg !903
  br label %for.cond, !dbg !906

for.cond:                                         ; preds = %if.else, %if.end9
  %ctr.0 = phi i32 [ 0, %if.end9 ], [ %inc75, %if.else ], !dbg !907
    #dbg_value(i32 %ctr.0, !900, !DIExpression(), !902)
  %exitcond2.not = icmp eq i32 %ctr.0, 256, !dbg !908
  br i1 %exitcond2.not, label %for.end76, label %for.body, !dbg !909

for.body:                                         ; preds = %for.cond
  %conv = trunc nuw i32 %ctr.0 to i8, !dbg !910
  store i8 %conv, ptr %add.ptr24, align 1, !dbg !911
  %call33 = call i32 @shake256(ptr noundef nonnull %V, i32 noundef 430, ptr noundef nonnull %tmp, i32 noundef 81) #8, !dbg !912
    #dbg_value(i32 0, !913, !DIExpression(), !915)
    #dbg_value(i32 0, !913, !DIExpression(), !915)
  call fastcc void @decode(ptr noundef nonnull %V, ptr noundef nonnull %Vdec, i32 noundef 78) #6, !dbg !916
    #dbg_value(i32 1, !913, !DIExpression(), !915)
  %add.ptr39.1 = getelementptr inbounds nuw i8, ptr %V, i32 39, !dbg !919
  %add.ptr42.1 = getelementptr inbounds nuw i8, ptr %Vdec, i32 78, !dbg !920
  call fastcc void @decode(ptr noundef nonnull %add.ptr39.1, ptr noundef nonnull %add.ptr42.1, i32 noundef 78) #6, !dbg !916
    #dbg_value(i32 2, !913, !DIExpression(), !915)
  %add.ptr39.2 = getelementptr inbounds nuw i8, ptr %V, i32 78, !dbg !919
  %add.ptr42.2 = getelementptr inbounds nuw i8, ptr %Vdec, i32 156, !dbg !920
  call fastcc void @decode(ptr noundef nonnull %add.ptr39.2, ptr noundef nonnull %add.ptr42.2, i32 noundef 78) #6, !dbg !916
    #dbg_value(i32 3, !913, !DIExpression(), !915)
  %add.ptr39.3 = getelementptr inbounds nuw i8, ptr %V, i32 117, !dbg !919
  %add.ptr42.3 = getelementptr inbounds nuw i8, ptr %Vdec, i32 234, !dbg !920
  call fastcc void @decode(ptr noundef nonnull %add.ptr39.3, ptr noundef nonnull %add.ptr42.3, i32 noundef 78) #6, !dbg !916
    #dbg_value(i32 4, !913, !DIExpression(), !915)
  %add.ptr39.4 = getelementptr inbounds nuw i8, ptr %V, i32 156, !dbg !919
  %add.ptr42.4 = getelementptr inbounds nuw i8, ptr %Vdec, i32 312, !dbg !920
  call fastcc void @decode(ptr noundef nonnull %add.ptr39.4, ptr noundef nonnull %add.ptr42.4, i32 noundef 78) #6, !dbg !916
    #dbg_value(i32 5, !913, !DIExpression(), !915)
  %add.ptr39.5 = getelementptr inbounds nuw i8, ptr %V, i32 195, !dbg !919
  %add.ptr42.5 = getelementptr inbounds nuw i8, ptr %Vdec, i32 390, !dbg !920
  call fastcc void @decode(ptr noundef nonnull %add.ptr39.5, ptr noundef nonnull %add.ptr42.5, i32 noundef 78) #6, !dbg !916
    #dbg_value(i32 6, !913, !DIExpression(), !915)
  %add.ptr39.6 = getelementptr inbounds nuw i8, ptr %V, i32 234, !dbg !919
  %add.ptr42.6 = getelementptr inbounds nuw i8, ptr %Vdec, i32 468, !dbg !920
  call fastcc void @decode(ptr noundef nonnull %add.ptr39.6, ptr noundef nonnull %add.ptr42.6, i32 noundef 78) #6, !dbg !916
    #dbg_value(i32 7, !913, !DIExpression(), !915)
  %add.ptr39.7 = getelementptr inbounds nuw i8, ptr %V, i32 273, !dbg !919
  %add.ptr42.7 = getelementptr inbounds nuw i8, ptr %Vdec, i32 546, !dbg !920
  call fastcc void @decode(ptr noundef nonnull %add.ptr39.7, ptr noundef nonnull %add.ptr42.7, i32 noundef 78) #6, !dbg !916
    #dbg_value(i32 8, !913, !DIExpression(), !915)
  %add.ptr39.8 = getelementptr inbounds nuw i8, ptr %V, i32 312, !dbg !919
  %add.ptr42.8 = getelementptr inbounds nuw i8, ptr %Vdec, i32 624, !dbg !920
  call fastcc void @decode(ptr noundef nonnull %add.ptr39.8, ptr noundef nonnull %add.ptr42.8, i32 noundef 78) #6, !dbg !916
    #dbg_value(i32 9, !913, !DIExpression(), !915)
  %add.ptr39.9 = getelementptr inbounds nuw i8, ptr %V, i32 351, !dbg !919
  %add.ptr42.9 = getelementptr inbounds nuw i8, ptr %Vdec, i32 702, !dbg !920
  call fastcc void @decode(ptr noundef nonnull %add.ptr39.9, ptr noundef nonnull %add.ptr42.9, i32 noundef 78) #6, !dbg !916
    #dbg_value(i32 10, !913, !DIExpression(), !915)
  call fastcc void @compute_M_and_VPV(ptr noundef %p, ptr noundef nonnull %Vdec, ptr noundef nonnull %add.ptr, ptr noundef nonnull %sk, ptr noundef nonnull %Mtmp, ptr noundef nonnull %A) #6, !dbg !921
  call fastcc void @compute_rhs(ptr noundef %p, ptr noundef nonnull %A, ptr noundef nonnull %t, ptr noundef nonnull %y) #6, !dbg !922
  call fastcc void @compute_A(ptr noundef %p, ptr noundef nonnull %Mtmp, ptr noundef nonnull %A) #6, !dbg !923
    #dbg_value(i32 0, !924, !DIExpression(), !926)
  br label %for.cond52, !dbg !927

for.cond52:                                       ; preds = %for.body55.6, %for.body
  %i51.0 = phi i32 [ 0, %for.body ], [ %inc58.7, %for.body55.6 ], !dbg !928
    #dbg_value(i32 %i51.0, !924, !DIExpression(), !926)
  %0 = mul nuw nsw i32 %i51.0, 81, !dbg !929
  %sub = add nuw nsw i32 %0, 80, !dbg !932
  %arrayidx = getelementptr inbounds nuw [6480 x i8], ptr %A, i32 0, i32 %sub, !dbg !933
  store i8 0, ptr %arrayidx, align 1, !dbg !934
    #dbg_value(i32 %i51.0, !924, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !926)
    #dbg_value(i32 %i51.0, !924, !DIExpression(DW_OP_constu, 1, DW_OP_or, DW_OP_stack_value), !926)
  %1 = mul nuw i32 %i51.0, 81, !dbg !929
  %sub.1 = add nuw i32 %1, 161, !dbg !932
  %arrayidx.1 = getelementptr inbounds nuw [6480 x i8], ptr %A, i32 0, i32 %sub.1, !dbg !933
  store i8 0, ptr %arrayidx.1, align 1, !dbg !934
    #dbg_value(i32 %i51.0, !924, !DIExpression(DW_OP_plus_uconst, 2, DW_OP_stack_value), !926)
    #dbg_value(i32 %i51.0, !924, !DIExpression(DW_OP_constu, 2, DW_OP_or, DW_OP_stack_value), !926)
  %2 = mul nuw i32 %i51.0, 81, !dbg !929
  %sub.2 = add nuw i32 %2, 242, !dbg !932
  %arrayidx.2 = getelementptr inbounds nuw [6480 x i8], ptr %A, i32 0, i32 %sub.2, !dbg !933
  store i8 0, ptr %arrayidx.2, align 1, !dbg !934
    #dbg_value(i32 %i51.0, !924, !DIExpression(DW_OP_plus_uconst, 3, DW_OP_stack_value), !926)
    #dbg_value(i32 %i51.0, !924, !DIExpression(DW_OP_constu, 3, DW_OP_or, DW_OP_stack_value), !926)
  %3 = mul nuw i32 %i51.0, 81, !dbg !929
  %sub.3 = add nuw i32 %3, 323, !dbg !932
  %arrayidx.3 = getelementptr inbounds nuw [6480 x i8], ptr %A, i32 0, i32 %sub.3, !dbg !933
  store i8 0, ptr %arrayidx.3, align 1, !dbg !934
    #dbg_value(i32 %i51.0, !924, !DIExpression(DW_OP_plus_uconst, 4, DW_OP_stack_value), !926)
    #dbg_value(i32 %i51.0, !924, !DIExpression(DW_OP_constu, 4, DW_OP_or, DW_OP_stack_value), !926)
  %4 = mul nuw i32 %i51.0, 81, !dbg !929
  %sub.4 = add nuw i32 %4, 404, !dbg !932
  %arrayidx.4 = getelementptr inbounds nuw [6480 x i8], ptr %A, i32 0, i32 %sub.4, !dbg !933
  store i8 0, ptr %arrayidx.4, align 1, !dbg !934
    #dbg_value(i32 %i51.0, !924, !DIExpression(DW_OP_plus_uconst, 5, DW_OP_stack_value), !926)
    #dbg_value(i32 %i51.0, !924, !DIExpression(DW_OP_constu, 5, DW_OP_or, DW_OP_stack_value), !926)
  %5 = mul nuw i32 %i51.0, 81, !dbg !929
  %sub.5 = add nuw i32 %5, 485, !dbg !932
  %arrayidx.5 = getelementptr inbounds nuw [6480 x i8], ptr %A, i32 0, i32 %sub.5, !dbg !933
  store i8 0, ptr %arrayidx.5, align 1, !dbg !934
    #dbg_value(i32 %i51.0, !924, !DIExpression(DW_OP_constu, 6, DW_OP_or, DW_OP_stack_value), !926)
  %exitcond1.6.not = icmp eq i32 %i51.0, 72, !dbg !935
  br i1 %exitcond1.6.not, label %for.end59, label %for.body55.6, !dbg !936

for.body55.6:                                     ; preds = %for.cond52
    #dbg_value(i32 %i51.0, !924, !DIExpression(DW_OP_constu, 6, DW_OP_or, DW_OP_stack_value), !926)
  %6 = mul nuw i32 %i51.0, 81, !dbg !929
  %sub.6 = add nuw i32 %6, 566, !dbg !932
  %arrayidx.6 = getelementptr inbounds nuw [6480 x i8], ptr %A, i32 0, i32 %sub.6, !dbg !933
  store i8 0, ptr %arrayidx.6, align 1, !dbg !934
    #dbg_value(i32 %i51.0, !924, !DIExpression(DW_OP_plus_uconst, 7, DW_OP_stack_value), !926)
    #dbg_value(i32 %i51.0, !924, !DIExpression(DW_OP_constu, 7, DW_OP_or, DW_OP_stack_value), !926)
  %7 = mul nuw i32 %i51.0, 81, !dbg !929
  %sub.7 = add nuw i32 %7, 647, !dbg !932
  %arrayidx.7 = getelementptr inbounds nuw [6480 x i8], ptr %A, i32 0, i32 %sub.7, !dbg !933
  store i8 0, ptr %arrayidx.7, align 1, !dbg !934
  %inc58.7 = add nuw nsw i32 %i51.0, 8, !dbg !937
    #dbg_value(i32 %inc58.7, !924, !DIExpression(), !926)
  br label %for.cond52, !dbg !938, !llvm.loop !939

for.end59:                                        ; preds = %for.cond52
  call fastcc void @decode(ptr noundef nonnull %add.ptr61, ptr noundef nonnull %r, i32 noundef 80) #6, !dbg !941
  %call67 = call i32 @pqmayo_MAYO_1_ref_sample_solution(ptr noundef %p, ptr noundef nonnull %A, ptr noundef nonnull %y, ptr noundef nonnull %r, ptr noundef nonnull %x, i32 noundef 10, i32 noundef 8, i32 noundef 78, i32 noundef 81) #6, !dbg !942
  %tobool.not = icmp eq i32 %call67, 0, !dbg !942
  br i1 %tobool.not, label %if.else, label %for.end76, !dbg !942

if.else:                                          ; preds = %for.end59
  %call70 = call ptr @memset(ptr noundef nonnull %Mtmp, i32 noundef 0, i32 noundef 3200) #8, !dbg !944
  %call72 = call ptr @memset(ptr noundef nonnull %A, i32 noundef 0, i32 noundef 6480) #8, !dbg !946
  %inc75 = add nuw nsw i32 %ctr.0, 1, !dbg !947
    #dbg_value(i32 %inc75, !900, !DIExpression(), !902)
  br label %for.cond, !dbg !948, !llvm.loop !949

for.end76:                                        ; preds = %for.end59, %for.cond
    #dbg_value(i32 0, !951, !DIExpression(), !953)
  br label %for.cond78, !dbg !954

for.cond78:                                       ; preds = %for.body81, %for.end76
  %i77.0 = phi i32 [ 0, %for.end76 ], [ %inc103, %for.body81 ], !dbg !955
    #dbg_value(i32 %i77.0, !951, !DIExpression(), !953)
  %exitcond3.not = icmp eq i32 %i77.0, 10, !dbg !956
  br i1 %exitcond3.not, label %for.end104, label %for.body81, !dbg !958

for.body81:                                       ; preds = %for.cond78
  %mul83 = mul nuw nsw i32 %i77.0, 78, !dbg !959
  %add.ptr84 = getelementptr inbounds nuw i8, ptr %Vdec, i32 %mul83, !dbg !961
    #dbg_value(ptr %add.ptr84, !962, !DIExpression(), !806)
  %O = getelementptr inbounds nuw i8, ptr %sk, i32 148200, !dbg !963
  %mul87 = shl nuw nsw i32 %i77.0, 3, !dbg !964
  %add.ptr88 = getelementptr inbounds nuw i8, ptr %x, i32 %mul87, !dbg !965
  call fastcc void @mat_mul(ptr noundef nonnull %O, ptr noundef nonnull %add.ptr88, ptr noundef nonnull %Ox, i32 noundef 8, i32 noundef 78, i32 noundef 1) #6, !dbg !966
  %mul92 = mul nuw nsw i32 %i77.0, 86, !dbg !967
  %add.ptr93 = getelementptr inbounds nuw i8, ptr %s, i32 %mul92, !dbg !968
  call fastcc void @mat_add(ptr noundef nonnull %add.ptr84, ptr noundef nonnull %Ox, ptr noundef nonnull %add.ptr93, i32 noundef 78, i32 noundef 1) #6, !dbg !969
  %mul95 = mul nuw nsw i32 %i77.0, 86, !dbg !970
  %add.ptr96 = getelementptr inbounds nuw i8, ptr %s, i32 %mul95, !dbg !971
  %add.ptr97 = getelementptr inbounds nuw i8, ptr %add.ptr96, i32 78, !dbg !972
  %mul99 = shl nuw nsw i32 %i77.0, 3, !dbg !973
  %add.ptr100 = getelementptr inbounds nuw i8, ptr %x, i32 %mul99, !dbg !974
  %call101 = call ptr @memcpy(ptr noundef nonnull %add.ptr97, ptr noundef nonnull %add.ptr100, i32 noundef 8) #8, !dbg !975
  %inc103 = add nuw nsw i32 %i77.0, 1, !dbg !976
    #dbg_value(i32 %inc103, !951, !DIExpression(), !953)
  br label %for.cond78, !dbg !977, !llvm.loop !978

for.end104:                                       ; preds = %for.cond78
  call fastcc void @encode(ptr noundef nonnull %s, ptr noundef %sig, i32 noundef 860) #6, !dbg !980
  %add.ptr107 = getelementptr inbounds nuw i8, ptr %sig, i32 430, !dbg !981
  %call109 = call ptr @memcpy(ptr noundef nonnull %add.ptr107, ptr noundef nonnull %salt, i32 noundef 24) #8, !dbg !982
  store i32 454, ptr %siglen, align 4, !dbg !983
  br label %err, !dbg !984

err:                                              ; preds = %if.end, %entry, %for.end104
  %ret.0 = phi i32 [ %call, %for.end104 ], [ %call, %entry ], [ 1, %if.end ], !dbg !806
    #dbg_value(i32 %ret.0, !812, !DIExpression(), !806)
    #dbg_label(!985, !986)
  call void @mayo_secure_clear(ptr noundef nonnull %V, i32 noundef 430) #8, !dbg !987
  call void @mayo_secure_clear(ptr noundef nonnull %Vdec, i32 noundef 780) #8, !dbg !988
  call void @mayo_secure_clear(ptr noundef nonnull %A, i32 noundef 6480) #8, !dbg !989
  call void @mayo_secure_clear(ptr noundef nonnull %r, i32 noundef 81) #8, !dbg !990
  %O114 = getelementptr inbounds nuw i8, ptr %sk, i32 148200, !dbg !991
  call void @mayo_secure_clear(ptr noundef nonnull %O114, i32 noundef 624) #8, !dbg !992
  call void @mayo_secure_clear(ptr noundef nonnull %sk, i32 noundef 148824) #8, !dbg !993
  call void @mayo_secure_clear(ptr noundef nonnull %Ox, i32 noundef 78) #8, !dbg !994
  call void @mayo_secure_clear(ptr noundef nonnull %tmp, i32 noundef 81) #8, !dbg !995
  call void @mayo_secure_clear(ptr noundef nonnull %Mtmp, i32 noundef 3200) #8, !dbg !996
  ret i32 %ret.0, !dbg !997
}

; Function Attrs: nounwind
define internal fastcc void @compute_M_and_VPV(ptr noundef %p, ptr noundef %Vdec, ptr noundef %L, ptr noundef %P1, ptr noundef %VL, ptr noundef %VP1V) unnamed_addr #0 !dbg !998 {
entry:
  %Pv = alloca [3900 x i64], align 8
    #dbg_value(ptr %p, !1001, !DIExpression(), !1002)
    #dbg_value(ptr %Vdec, !1003, !DIExpression(), !1002)
    #dbg_value(ptr %L, !1004, !DIExpression(), !1002)
    #dbg_value(ptr %P1, !1005, !DIExpression(), !1002)
    #dbg_value(ptr %VL, !1006, !DIExpression(), !1002)
    #dbg_value(ptr %VP1V, !1007, !DIExpression(), !1002)
    #dbg_value(i32 10, !1008, !DIExpression(), !1002)
    #dbg_value(i32 78, !1009, !DIExpression(), !1002)
    #dbg_value(i32 8, !1010, !DIExpression(), !1002)
  call fastcc void @mul_add_mat_x_m_mat(i32 noundef 5, ptr noundef %Vdec, ptr noundef %L, ptr noundef %VL, i32 noundef 10, i32 noundef 78, i32 noundef 8) #6, !dbg !1011
    #dbg_declare(ptr %Pv, !1012, !DIExpression(), !1016)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(31200) %Pv, i8 0, i32 31200, i1 false), !dbg !1016
  call fastcc void @P1_times_Vt(ptr noundef %p, ptr noundef %P1, ptr noundef %Vdec, ptr noundef nonnull %Pv) #6, !dbg !1017
  call fastcc void @mul_add_mat_x_m_mat(i32 noundef 5, ptr noundef %Vdec, ptr noundef nonnull %Pv, ptr noundef %VP1V, i32 noundef 10, i32 noundef 78, i32 noundef 10) #6, !dbg !1018
  ret void, !dbg !1019
}

; Function Attrs: nounwind
define internal fastcc void @compute_rhs(ptr noundef %p, ptr noundef %vPv, ptr noundef %t, ptr noundef %y) unnamed_addr #0 !dbg !1020 {
entry:
  %temp = alloca [5 x i64], align 8
    #dbg_value(ptr %p, !1023, !DIExpression(), !1024)
    #dbg_value(ptr %vPv, !1025, !DIExpression(), !1024)
    #dbg_value(ptr %t, !1026, !DIExpression(), !1024)
    #dbg_value(ptr %y, !1027, !DIExpression(), !1024)
    #dbg_value(i32 52, !1028, !DIExpression(), !1024)
    #dbg_value(i32 5, !1030, !DIExpression(), !1024)
    #dbg_value(i64 1, !1031, !DIExpression(), !1034)
    #dbg_value(i64 72057594037927936, !1031, !DIExpression(), !1034)
    #dbg_value(i64 72057594037927935, !1031, !DIExpression(), !1034)
    #dbg_value(i32 0, !1035, !DIExpression(), !1037)
  br label %for.cond, !dbg !1038

for.cond:                                         ; preds = %for.body.4, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc.7, %for.body.4 ], !dbg !1039
    #dbg_value(i32 %i.0, !1035, !DIExpression(), !1037)
  %.idx7 = mul nuw nsw i32 %i.0, 40, !dbg !1040
  %0 = getelementptr inbounds nuw i8, ptr %vPv, i32 %.idx7, !dbg !1040
  %arrayidx = getelementptr inbounds nuw i8, ptr %0, i32 32, !dbg !1040
  %1 = load i64, ptr %arrayidx, align 8, !dbg !1043
  %and = and i64 %1, 72057594037927935, !dbg !1043
  store i64 %and, ptr %arrayidx, align 8, !dbg !1043
    #dbg_value(i32 %i.0, !1035, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1037)
    #dbg_value(i32 %i.0, !1035, !DIExpression(DW_OP_constu, 1, DW_OP_or, DW_OP_stack_value), !1037)
  %2 = mul nuw i32 %i.0, 40, !dbg !1040
  %.idx7.1 = or disjoint i32 %2, 40, !dbg !1040
  %3 = getelementptr inbounds nuw i8, ptr %vPv, i32 %.idx7.1, !dbg !1040
  %arrayidx.1 = getelementptr inbounds nuw i8, ptr %3, i32 32, !dbg !1040
  %4 = load i64, ptr %arrayidx.1, align 8, !dbg !1043
  %and.1 = and i64 %4, 72057594037927935, !dbg !1043
  store i64 %and.1, ptr %arrayidx.1, align 8, !dbg !1043
    #dbg_value(i32 %i.0, !1035, !DIExpression(DW_OP_plus_uconst, 2, DW_OP_stack_value), !1037)
    #dbg_value(i32 %i.0, !1035, !DIExpression(DW_OP_constu, 2, DW_OP_or, DW_OP_stack_value), !1037)
  %5 = mul nuw i32 %i.0, 40, !dbg !1040
  %6 = getelementptr i8, ptr %vPv, i32 %5, !dbg !1040
  %arrayidx.2 = getelementptr i8, ptr %6, i32 112, !dbg !1040
  %7 = load i64, ptr %arrayidx.2, align 8, !dbg !1043
  %and.2 = and i64 %7, 72057594037927935, !dbg !1043
  store i64 %and.2, ptr %arrayidx.2, align 8, !dbg !1043
    #dbg_value(i32 %i.0, !1035, !DIExpression(DW_OP_plus_uconst, 3, DW_OP_stack_value), !1037)
    #dbg_value(i32 %i.0, !1035, !DIExpression(DW_OP_constu, 3, DW_OP_or, DW_OP_stack_value), !1037)
  %8 = mul nuw i32 %i.0, 40, !dbg !1040
  %9 = getelementptr i8, ptr %vPv, i32 %8, !dbg !1040
  %arrayidx.3 = getelementptr i8, ptr %9, i32 152, !dbg !1040
  %10 = load i64, ptr %arrayidx.3, align 8, !dbg !1043
  %and.3 = and i64 %10, 72057594037927935, !dbg !1043
  store i64 %and.3, ptr %arrayidx.3, align 8, !dbg !1043
    #dbg_value(i32 %i.0, !1035, !DIExpression(DW_OP_constu, 4, DW_OP_or, DW_OP_stack_value), !1037)
  %exitcond.4.not = icmp eq i32 %i.0, 96, !dbg !1044
  br i1 %exitcond.4.not, label %for.end, label %for.body.4, !dbg !1045

for.body.4:                                       ; preds = %for.cond
    #dbg_value(i32 %i.0, !1035, !DIExpression(DW_OP_constu, 4, DW_OP_or, DW_OP_stack_value), !1037)
  %11 = mul nuw i32 %i.0, 40, !dbg !1040
  %12 = getelementptr i8, ptr %vPv, i32 %11, !dbg !1040
  %arrayidx.4 = getelementptr i8, ptr %12, i32 192, !dbg !1040
  %13 = load i64, ptr %arrayidx.4, align 8, !dbg !1043
  %and.4 = and i64 %13, 72057594037927935, !dbg !1043
  store i64 %and.4, ptr %arrayidx.4, align 8, !dbg !1043
    #dbg_value(i32 %i.0, !1035, !DIExpression(DW_OP_plus_uconst, 5, DW_OP_stack_value), !1037)
    #dbg_value(i32 %i.0, !1035, !DIExpression(DW_OP_constu, 5, DW_OP_or, DW_OP_stack_value), !1037)
  %14 = mul nuw i32 %i.0, 40, !dbg !1040
  %15 = getelementptr i8, ptr %vPv, i32 %14, !dbg !1040
  %arrayidx.5 = getelementptr i8, ptr %15, i32 232, !dbg !1040
  %16 = load i64, ptr %arrayidx.5, align 8, !dbg !1043
  %and.5 = and i64 %16, 72057594037927935, !dbg !1043
  store i64 %and.5, ptr %arrayidx.5, align 8, !dbg !1043
    #dbg_value(i32 %i.0, !1035, !DIExpression(DW_OP_plus_uconst, 6, DW_OP_stack_value), !1037)
    #dbg_value(i32 %i.0, !1035, !DIExpression(DW_OP_constu, 6, DW_OP_or, DW_OP_stack_value), !1037)
  %17 = mul nuw i32 %i.0, 40, !dbg !1040
  %18 = getelementptr i8, ptr %vPv, i32 %17, !dbg !1040
  %arrayidx.6 = getelementptr i8, ptr %18, i32 272, !dbg !1040
  %19 = load i64, ptr %arrayidx.6, align 8, !dbg !1043
  %and.6 = and i64 %19, 72057594037927935, !dbg !1043
  store i64 %and.6, ptr %arrayidx.6, align 8, !dbg !1043
    #dbg_value(i32 %i.0, !1035, !DIExpression(DW_OP_plus_uconst, 7, DW_OP_stack_value), !1037)
    #dbg_value(i32 %i.0, !1035, !DIExpression(DW_OP_constu, 7, DW_OP_or, DW_OP_stack_value), !1037)
  %20 = mul nuw i32 %i.0, 40, !dbg !1040
  %21 = getelementptr i8, ptr %vPv, i32 %20, !dbg !1040
  %arrayidx.7 = getelementptr i8, ptr %21, i32 312, !dbg !1040
  %22 = load i64, ptr %arrayidx.7, align 8, !dbg !1043
  %and.7 = and i64 %22, 72057594037927935, !dbg !1043
  store i64 %and.7, ptr %arrayidx.7, align 8, !dbg !1043
  %inc.7 = add nuw nsw i32 %i.0, 8, !dbg !1046
    #dbg_value(i32 %inc.7, !1035, !DIExpression(), !1037)
  br label %for.cond, !dbg !1047, !llvm.loop !1048

for.end:                                          ; preds = %for.cond
    #dbg_declare(ptr %temp, !1050, !DIExpression(), !1051)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(40) %temp, i8 0, i32 40, i1 false), !dbg !1051
    #dbg_value(ptr %temp, !1052, !DIExpression(), !1024)
    #dbg_value(i32 9, !1053, !DIExpression(), !1055)
  br label %for.cond3, !dbg !1056

for.cond3:                                        ; preds = %for.inc77, %for.end
  %i2.0 = phi i32 [ 9, %for.end ], [ %dec78, %for.inc77 ], !dbg !1057
    #dbg_value(i32 %i2.0, !1053, !DIExpression(), !1055)
  %cmp4 = icmp sgt i32 %i2.0, -1, !dbg !1058
  br i1 %cmp4, label %for.cond6, label %for.cond81, !dbg !1060

for.cond6:                                        ; preds = %for.cond3, %for.body8
  %j.0 = phi i32 [ %inc75, %for.body8 ], [ %i2.0, %for.cond3 ], !dbg !1061
    #dbg_value(i32 %j.0, !1064, !DIExpression(), !1065)
  %exitcond10.not = icmp eq i32 %j.0, 10, !dbg !1066
  br i1 %exitcond10.not, label %for.inc77, label %for.body8, !dbg !1068

for.body8:                                        ; preds = %for.cond6
  %arrayidx9 = getelementptr inbounds nuw i8, ptr %temp, i32 32, !dbg !1069
  %23 = load i64, ptr %arrayidx9, align 8, !dbg !1069
  %shr = lshr i64 %23, 52, !dbg !1071
  %rem.lhs.trunc = trunc i64 %shr to i8, !dbg !1072
    #dbg_value(i8 %rem1, !1073, !DIExpression(), !1074)
  %arrayidx10 = getelementptr inbounds nuw i8, ptr %temp, i32 32, !dbg !1075
  %shl11 = shl i64 %23, 4, !dbg !1076
  store i64 %shl11, ptr %arrayidx10, align 8, !dbg !1076
    #dbg_value(i32 3, !1077, !DIExpression(), !1079)
    #dbg_value(i32 3, !1077, !DIExpression(), !1079)
  %arrayidx16 = getelementptr inbounds nuw i8, ptr %temp, i32 24, !dbg !1080
  %24 = load i64, ptr %arrayidx16, align 8, !dbg !1080
  %shr17 = lshr i64 %24, 60, !dbg !1083
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %temp, i32 32, !dbg !1084
  %25 = load i64, ptr %arrayidx19, align 8, !dbg !1085
  %xor = xor i64 %25, %shr17, !dbg !1085
  store i64 %xor, ptr %arrayidx19, align 8, !dbg !1085
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %temp, i32 24, !dbg !1086
  %26 = load i64, ptr %arrayidx20, align 8, !dbg !1087
  %shl21 = shl i64 %26, 4, !dbg !1087
  store i64 %shl21, ptr %arrayidx20, align 8, !dbg !1087
    #dbg_value(i32 2, !1077, !DIExpression(), !1079)
  %arrayidx16.1 = getelementptr inbounds nuw i8, ptr %temp, i32 16, !dbg !1080
  %27 = load i64, ptr %arrayidx16.1, align 8, !dbg !1080
  %shr17.1 = lshr i64 %27, 60, !dbg !1083
  %arrayidx19.1 = getelementptr inbounds nuw i8, ptr %temp, i32 24, !dbg !1084
  %28 = load i64, ptr %arrayidx19.1, align 8, !dbg !1085
  %xor.1 = xor i64 %28, %shr17.1, !dbg !1085
  store i64 %xor.1, ptr %arrayidx19.1, align 8, !dbg !1085
  %arrayidx20.1 = getelementptr inbounds nuw i8, ptr %temp, i32 16, !dbg !1086
  %29 = load i64, ptr %arrayidx20.1, align 8, !dbg !1087
  %shl21.1 = shl i64 %29, 4, !dbg !1087
  store i64 %shl21.1, ptr %arrayidx20.1, align 8, !dbg !1087
    #dbg_value(i32 1, !1077, !DIExpression(), !1079)
  %arrayidx16.2 = getelementptr inbounds nuw i8, ptr %temp, i32 8, !dbg !1080
  %30 = load i64, ptr %arrayidx16.2, align 8, !dbg !1080
  %shr17.2 = lshr i64 %30, 60, !dbg !1083
  %arrayidx19.2 = getelementptr inbounds nuw i8, ptr %temp, i32 16, !dbg !1084
  %31 = load i64, ptr %arrayidx19.2, align 8, !dbg !1085
  %xor.2 = xor i64 %31, %shr17.2, !dbg !1085
  store i64 %xor.2, ptr %arrayidx19.2, align 8, !dbg !1085
  %arrayidx20.2 = getelementptr inbounds nuw i8, ptr %temp, i32 8, !dbg !1086
  %32 = load i64, ptr %arrayidx20.2, align 8, !dbg !1087
  %shl21.2 = shl i64 %32, 4, !dbg !1087
  store i64 %shl21.2, ptr %arrayidx20.2, align 8, !dbg !1087
    #dbg_value(i32 0, !1077, !DIExpression(), !1079)
  %33 = load i64, ptr %temp, align 8, !dbg !1080
  %shr17.3 = lshr i64 %33, 60, !dbg !1083
  %arrayidx19.3 = getelementptr inbounds nuw i8, ptr %temp, i32 8, !dbg !1084
  %34 = load i64, ptr %arrayidx19.3, align 8, !dbg !1085
  %xor.3 = xor i64 %34, %shr17.3, !dbg !1085
  store i64 %xor.3, ptr %arrayidx19.3, align 8, !dbg !1085
  %shl21.3 = shl i64 %33, 4, !dbg !1087
  store i64 %shl21.3, ptr %temp, align 8, !dbg !1087
    #dbg_value(i32 -1, !1077, !DIExpression(), !1079)
  %rem1 = and i8 %rem.lhs.trunc, 15, !dbg !1072
    #dbg_value(i32 0, !1088, !DIExpression(), !1090)
  %call = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %rem1, i8 noundef zeroext 8) #6, !dbg !1091
  %35 = load i8, ptr %temp, align 1, !dbg !1096
  %xor356 = xor i8 %35, %call, !dbg !1096
  store i8 %xor356, ptr %temp, align 1, !dbg !1096
    #dbg_value(i32 1, !1088, !DIExpression(), !1090)
  %call38.1 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %rem1, i8 noundef zeroext 1) #6, !dbg !1097
  %shl40.1 = shl nuw i8 %call38.1, 4, !dbg !1099
  %36 = load i8, ptr %temp, align 1, !dbg !1100
  %xor44.1 = xor i8 %shl40.1, %36, !dbg !1100
  store i8 %xor44.1, ptr %temp, align 1, !dbg !1100
    #dbg_value(i32 2, !1088, !DIExpression(), !1090)
  %call.2 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %rem1, i8 noundef zeroext 1) #6, !dbg !1091
  %arrayidx33.2 = getelementptr inbounds nuw i8, ptr %temp, i32 1, !dbg !1101
  %37 = load i8, ptr %arrayidx33.2, align 1, !dbg !1096
  %xor356.2 = xor i8 %37, %call.2, !dbg !1096
  store i8 %xor356.2, ptr %arrayidx33.2, align 1, !dbg !1096
    #dbg_value(i32 3, !1088, !DIExpression(), !1090)
  %call38.3 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %rem1, i8 noundef zeroext 0) #6, !dbg !1097
  %shl40.3 = shl nuw i8 %call38.3, 4, !dbg !1099
  %arrayidx42.3 = getelementptr inbounds nuw i8, ptr %temp, i32 1, !dbg !1102
  %38 = load i8, ptr %arrayidx42.3, align 1, !dbg !1100
  %xor44.3 = xor i8 %shl40.3, %38, !dbg !1100
  store i8 %xor44.3, ptr %arrayidx42.3, align 1, !dbg !1100
    #dbg_value(i32 4, !1088, !DIExpression(), !1090)
    #dbg_value(i32 0, !1103, !DIExpression(), !1105)
  %mul54 = mul nuw nsw i32 %i2.0, 10, !dbg !1106
  %add55 = add nuw nsw i32 %mul54, %j.0, !dbg !1109
  %.idx = mul nuw nsw i32 %add55, 40, !dbg !1110
  %39 = getelementptr i8, ptr %vPv, i32 %.idx, !dbg !1110
  %40 = load i64, ptr %39, align 8, !dbg !1110
  %cmp59.not = icmp eq i32 %i2.0, %j.0, !dbg !1111
  %mul62 = mul nuw nsw i32 %j.0, 10, !dbg !1112
  %add63 = add nuw nsw i32 %mul62, %i2.0, !dbg !1113
  %.idx4 = mul nuw nsw i32 %add63, 40, !dbg !1114
  %41 = getelementptr i8, ptr %vPv, i32 %.idx4, !dbg !1114
  %42 = load i64, ptr %41, align 8, !dbg !1114
  %mul67 = select i1 %cmp59.not, i64 0, i64 %42, !dbg !1115
  %xor68 = xor i64 %40, %mul67, !dbg !1116
  %43 = load i64, ptr %temp, align 8, !dbg !1117
  %xor70 = xor i64 %43, %xor68, !dbg !1117
  store i64 %xor70, ptr %temp, align 8, !dbg !1117
    #dbg_value(i32 1, !1103, !DIExpression(), !1105)
  %mul54.1 = mul nuw nsw i32 %i2.0, 10, !dbg !1106
  %add55.1 = add nuw nsw i32 %mul54.1, %j.0, !dbg !1109
  %.idx.1 = mul nuw nsw i32 %add55.1, 40, !dbg !1110
  %44 = getelementptr i8, ptr %vPv, i32 %.idx.1, !dbg !1110
  %arrayidx58.1 = getelementptr i8, ptr %44, i32 8, !dbg !1110
  %45 = load i64, ptr %arrayidx58.1, align 8, !dbg !1110
  %cmp59.not.1 = icmp eq i32 %i2.0, %j.0, !dbg !1111
  %mul62.1 = mul nuw nsw i32 %j.0, 10, !dbg !1112
  %add63.1 = add nuw nsw i32 %mul62.1, %i2.0, !dbg !1113
  %.idx4.1 = mul nuw nsw i32 %add63.1, 40, !dbg !1114
  %46 = getelementptr i8, ptr %vPv, i32 %.idx4.1, !dbg !1114
  %arrayidx66.1 = getelementptr i8, ptr %46, i32 8, !dbg !1114
  %47 = load i64, ptr %arrayidx66.1, align 8, !dbg !1114
  %mul67.1 = select i1 %cmp59.not.1, i64 0, i64 %47, !dbg !1115
  %xor68.1 = xor i64 %45, %mul67.1, !dbg !1116
  %arrayidx69.1 = getelementptr inbounds nuw i8, ptr %temp, i32 8, !dbg !1118
  %48 = load i64, ptr %arrayidx69.1, align 8, !dbg !1117
  %xor70.1 = xor i64 %48, %xor68.1, !dbg !1117
  store i64 %xor70.1, ptr %arrayidx69.1, align 8, !dbg !1117
    #dbg_value(i32 2, !1103, !DIExpression(), !1105)
  %mul54.2 = mul nuw nsw i32 %i2.0, 10, !dbg !1106
  %add55.2 = add nuw nsw i32 %mul54.2, %j.0, !dbg !1109
  %.idx.2 = mul nuw nsw i32 %add55.2, 40, !dbg !1110
  %49 = getelementptr i8, ptr %vPv, i32 %.idx.2, !dbg !1110
  %arrayidx58.2 = getelementptr i8, ptr %49, i32 16, !dbg !1110
  %50 = load i64, ptr %arrayidx58.2, align 8, !dbg !1110
  %cmp59.not.2 = icmp eq i32 %i2.0, %j.0, !dbg !1111
  %mul62.2 = mul nuw nsw i32 %j.0, 10, !dbg !1112
  %add63.2 = add nuw nsw i32 %mul62.2, %i2.0, !dbg !1113
  %.idx4.2 = mul nuw nsw i32 %add63.2, 40, !dbg !1114
  %51 = getelementptr i8, ptr %vPv, i32 %.idx4.2, !dbg !1114
  %arrayidx66.2 = getelementptr i8, ptr %51, i32 16, !dbg !1114
  %52 = load i64, ptr %arrayidx66.2, align 8, !dbg !1114
  %mul67.2 = select i1 %cmp59.not.2, i64 0, i64 %52, !dbg !1115
  %xor68.2 = xor i64 %50, %mul67.2, !dbg !1116
  %arrayidx69.2 = getelementptr inbounds nuw i8, ptr %temp, i32 16, !dbg !1118
  %53 = load i64, ptr %arrayidx69.2, align 8, !dbg !1117
  %xor70.2 = xor i64 %53, %xor68.2, !dbg !1117
  store i64 %xor70.2, ptr %arrayidx69.2, align 8, !dbg !1117
    #dbg_value(i32 3, !1103, !DIExpression(), !1105)
  %mul54.3 = mul nuw nsw i32 %i2.0, 10, !dbg !1106
  %add55.3 = add nuw nsw i32 %mul54.3, %j.0, !dbg !1109
  %.idx.3 = mul nuw nsw i32 %add55.3, 40, !dbg !1110
  %54 = getelementptr i8, ptr %vPv, i32 %.idx.3, !dbg !1110
  %arrayidx58.3 = getelementptr i8, ptr %54, i32 24, !dbg !1110
  %55 = load i64, ptr %arrayidx58.3, align 8, !dbg !1110
  %cmp59.not.3 = icmp eq i32 %i2.0, %j.0, !dbg !1111
  %mul62.3 = mul nuw nsw i32 %j.0, 10, !dbg !1112
  %add63.3 = add nuw nsw i32 %mul62.3, %i2.0, !dbg !1113
  %.idx4.3 = mul nuw nsw i32 %add63.3, 40, !dbg !1114
  %56 = getelementptr i8, ptr %vPv, i32 %.idx4.3, !dbg !1114
  %arrayidx66.3 = getelementptr i8, ptr %56, i32 24, !dbg !1114
  %57 = load i64, ptr %arrayidx66.3, align 8, !dbg !1114
  %mul67.3 = select i1 %cmp59.not.3, i64 0, i64 %57, !dbg !1115
  %xor68.3 = xor i64 %55, %mul67.3, !dbg !1116
  %arrayidx69.3 = getelementptr inbounds nuw i8, ptr %temp, i32 24, !dbg !1118
  %58 = load i64, ptr %arrayidx69.3, align 8, !dbg !1117
  %xor70.3 = xor i64 %58, %xor68.3, !dbg !1117
  store i64 %xor70.3, ptr %arrayidx69.3, align 8, !dbg !1117
    #dbg_value(i32 4, !1103, !DIExpression(), !1105)
  %mul54.4 = mul nuw nsw i32 %i2.0, 10, !dbg !1106
  %add55.4 = add nuw nsw i32 %mul54.4, %j.0, !dbg !1109
  %.idx.4 = mul nuw nsw i32 %add55.4, 40, !dbg !1110
  %59 = getelementptr i8, ptr %vPv, i32 %.idx.4, !dbg !1110
  %arrayidx58.4 = getelementptr i8, ptr %59, i32 32, !dbg !1110
  %60 = load i64, ptr %arrayidx58.4, align 8, !dbg !1110
  %cmp59.not.4 = icmp eq i32 %i2.0, %j.0, !dbg !1111
  %mul62.4 = mul nuw nsw i32 %j.0, 10, !dbg !1112
  %add63.4 = add nuw nsw i32 %mul62.4, %i2.0, !dbg !1113
  %.idx4.4 = mul nuw nsw i32 %add63.4, 40, !dbg !1114
  %61 = getelementptr i8, ptr %vPv, i32 %.idx4.4, !dbg !1114
  %arrayidx66.4 = getelementptr i8, ptr %61, i32 32, !dbg !1114
  %62 = load i64, ptr %arrayidx66.4, align 8, !dbg !1114
  %mul67.4 = select i1 %cmp59.not.4, i64 0, i64 %62, !dbg !1115
  %xor68.4 = xor i64 %60, %mul67.4, !dbg !1116
  %arrayidx69.4 = getelementptr inbounds nuw i8, ptr %temp, i32 32, !dbg !1118
  %63 = load i64, ptr %arrayidx69.4, align 8, !dbg !1117
  %xor70.4 = xor i64 %63, %xor68.4, !dbg !1117
  store i64 %xor70.4, ptr %arrayidx69.4, align 8, !dbg !1117
    #dbg_value(i32 5, !1103, !DIExpression(), !1105)
  %inc75 = add nuw nsw i32 %j.0, 1, !dbg !1119
    #dbg_value(i32 %inc75, !1064, !DIExpression(), !1065)
  br label %for.cond6, !dbg !1120, !llvm.loop !1121

for.inc77:                                        ; preds = %for.cond6
  %dec78 = add nsw i32 %i2.0, -1, !dbg !1123
    #dbg_value(i32 %dec78, !1053, !DIExpression(), !1055)
  br label %for.cond3, !dbg !1124, !llvm.loop !1125

for.cond81:                                       ; preds = %for.cond3, %for.body84.7
  %i80.0 = phi i32 [ %add106.7, %for.body84.7 ], [ 0, %for.cond3 ], !dbg !1127
    #dbg_value(i32 %i80.0, !1129, !DIExpression(), !1130)
  %arrayidx85 = getelementptr inbounds nuw i8, ptr %t, i32 %i80.0, !dbg !1131
  %64 = load i8, ptr %arrayidx85, align 1, !dbg !1131
  %div87 = lshr exact i32 %i80.0, 1, !dbg !1134
  %arrayidx88 = getelementptr inbounds nuw i8, ptr %temp, i32 %div87, !dbg !1135
  %65 = load i8, ptr %arrayidx88, align 1, !dbg !1135
  %66 = and i8 %65, 15, !dbg !1136
  %xor912 = xor i8 %64, %66, !dbg !1137
  %arrayidx93 = getelementptr inbounds nuw i8, ptr %y, i32 %i80.0, !dbg !1138
  store i8 %xor912, ptr %arrayidx93, align 1, !dbg !1139
  %add94 = or disjoint i32 %i80.0, 1, !dbg !1140
  %arrayidx95 = getelementptr inbounds nuw i8, ptr %t, i32 %add94, !dbg !1141
  %67 = load i8, ptr %arrayidx95, align 1, !dbg !1141
  %68 = lshr i8 %65, 4, !dbg !1142
  %xor1013 = xor i8 %67, %68, !dbg !1143
  %add103 = or disjoint i32 %i80.0, 1, !dbg !1144
  %arrayidx104 = getelementptr inbounds nuw i8, ptr %y, i32 %add103, !dbg !1145
  store i8 %xor1013, ptr %arrayidx104, align 1, !dbg !1146
    #dbg_value(i32 %i80.0, !1129, !DIExpression(DW_OP_plus_uconst, 2, DW_OP_stack_value), !1130)
  %add106 = or disjoint i32 %i80.0, 2, !dbg !1147
    #dbg_value(i32 %add106, !1129, !DIExpression(), !1130)
  %arrayidx85.1 = getelementptr inbounds nuw i8, ptr %t, i32 %add106, !dbg !1131
  %69 = load i8, ptr %arrayidx85.1, align 1, !dbg !1131
  %div87.1 = lshr exact i32 %add106, 1, !dbg !1134
  %arrayidx88.1 = getelementptr inbounds nuw i8, ptr %temp, i32 %div87.1, !dbg !1135
  %70 = load i8, ptr %arrayidx88.1, align 1, !dbg !1135
  %71 = and i8 %70, 15, !dbg !1136
  %xor912.1 = xor i8 %69, %71, !dbg !1137
  %arrayidx93.1 = getelementptr inbounds nuw i8, ptr %y, i32 %add106, !dbg !1138
  store i8 %xor912.1, ptr %arrayidx93.1, align 1, !dbg !1139
  %add94.1 = or disjoint i32 %i80.0, 3, !dbg !1140
  %arrayidx95.1 = getelementptr inbounds nuw i8, ptr %t, i32 %add94.1, !dbg !1141
  %72 = load i8, ptr %arrayidx95.1, align 1, !dbg !1141
  %73 = lshr i8 %70, 4, !dbg !1142
  %xor1013.1 = xor i8 %72, %73, !dbg !1143
  %add103.1 = or disjoint i32 %i80.0, 3, !dbg !1144
  %arrayidx104.1 = getelementptr inbounds nuw i8, ptr %y, i32 %add103.1, !dbg !1145
  store i8 %xor1013.1, ptr %arrayidx104.1, align 1, !dbg !1146
    #dbg_value(i32 %i80.0, !1129, !DIExpression(DW_OP_plus_uconst, 4, DW_OP_stack_value), !1130)
  %add106.1 = or disjoint i32 %i80.0, 4, !dbg !1147
    #dbg_value(i32 %add106.1, !1129, !DIExpression(), !1130)
  %arrayidx85.2 = getelementptr inbounds nuw i8, ptr %t, i32 %add106.1, !dbg !1131
  %74 = load i8, ptr %arrayidx85.2, align 1, !dbg !1131
  %div87.2 = lshr exact i32 %add106.1, 1, !dbg !1134
  %arrayidx88.2 = getelementptr inbounds nuw i8, ptr %temp, i32 %div87.2, !dbg !1135
  %75 = load i8, ptr %arrayidx88.2, align 1, !dbg !1135
  %76 = and i8 %75, 15, !dbg !1136
  %xor912.2 = xor i8 %74, %76, !dbg !1137
  %arrayidx93.2 = getelementptr inbounds nuw i8, ptr %y, i32 %add106.1, !dbg !1138
  store i8 %xor912.2, ptr %arrayidx93.2, align 1, !dbg !1139
  %add94.2 = or disjoint i32 %i80.0, 5, !dbg !1140
  %arrayidx95.2 = getelementptr inbounds nuw i8, ptr %t, i32 %add94.2, !dbg !1141
  %77 = load i8, ptr %arrayidx95.2, align 1, !dbg !1141
  %78 = lshr i8 %75, 4, !dbg !1142
  %xor1013.2 = xor i8 %77, %78, !dbg !1143
  %add103.2 = or disjoint i32 %i80.0, 5, !dbg !1144
  %arrayidx104.2 = getelementptr inbounds nuw i8, ptr %y, i32 %add103.2, !dbg !1145
  store i8 %xor1013.2, ptr %arrayidx104.2, align 1, !dbg !1146
    #dbg_value(i32 %i80.0, !1129, !DIExpression(DW_OP_plus_uconst, 6, DW_OP_stack_value), !1130)
  %add106.2 = or disjoint i32 %i80.0, 6, !dbg !1147
    #dbg_value(i32 %add106.2, !1129, !DIExpression(), !1130)
  %arrayidx85.3 = getelementptr inbounds nuw i8, ptr %t, i32 %add106.2, !dbg !1131
  %79 = load i8, ptr %arrayidx85.3, align 1, !dbg !1131
  %div87.3 = lshr exact i32 %add106.2, 1, !dbg !1134
  %arrayidx88.3 = getelementptr inbounds nuw i8, ptr %temp, i32 %div87.3, !dbg !1135
  %80 = load i8, ptr %arrayidx88.3, align 1, !dbg !1135
  %81 = and i8 %80, 15, !dbg !1136
  %xor912.3 = xor i8 %79, %81, !dbg !1137
  %arrayidx93.3 = getelementptr inbounds nuw i8, ptr %y, i32 %add106.2, !dbg !1138
  store i8 %xor912.3, ptr %arrayidx93.3, align 1, !dbg !1139
  %add94.3 = or disjoint i32 %i80.0, 7, !dbg !1140
  %arrayidx95.3 = getelementptr inbounds nuw i8, ptr %t, i32 %add94.3, !dbg !1141
  %82 = load i8, ptr %arrayidx95.3, align 1, !dbg !1141
  %83 = lshr i8 %80, 4, !dbg !1142
  %xor1013.3 = xor i8 %82, %83, !dbg !1143
  %add103.3 = or disjoint i32 %i80.0, 7, !dbg !1144
  %arrayidx104.3 = getelementptr inbounds nuw i8, ptr %y, i32 %add103.3, !dbg !1145
  store i8 %xor1013.3, ptr %arrayidx104.3, align 1, !dbg !1146
    #dbg_value(i32 %i80.0, !1129, !DIExpression(DW_OP_plus_uconst, 8, DW_OP_stack_value), !1130)
  %add106.3 = or disjoint i32 %i80.0, 8, !dbg !1147
    #dbg_value(i32 %add106.3, !1129, !DIExpression(), !1130)
  %arrayidx85.4 = getelementptr inbounds nuw i8, ptr %t, i32 %add106.3, !dbg !1131
  %84 = load i8, ptr %arrayidx85.4, align 1, !dbg !1131
  %div87.4 = lshr exact i32 %add106.3, 1, !dbg !1134
  %arrayidx88.4 = getelementptr inbounds nuw i8, ptr %temp, i32 %div87.4, !dbg !1135
  %85 = load i8, ptr %arrayidx88.4, align 1, !dbg !1135
  %86 = and i8 %85, 15, !dbg !1136
  %xor912.4 = xor i8 %84, %86, !dbg !1137
  %arrayidx93.4 = getelementptr inbounds nuw i8, ptr %y, i32 %add106.3, !dbg !1138
  store i8 %xor912.4, ptr %arrayidx93.4, align 1, !dbg !1139
  %add94.4 = or disjoint i32 %i80.0, 9, !dbg !1140
  %arrayidx95.4 = getelementptr inbounds nuw i8, ptr %t, i32 %add94.4, !dbg !1141
  %87 = load i8, ptr %arrayidx95.4, align 1, !dbg !1141
  %88 = lshr i8 %85, 4, !dbg !1142
  %xor1013.4 = xor i8 %87, %88, !dbg !1143
  %add103.4 = or disjoint i32 %i80.0, 9, !dbg !1144
  %arrayidx104.4 = getelementptr inbounds nuw i8, ptr %y, i32 %add103.4, !dbg !1145
  store i8 %xor1013.4, ptr %arrayidx104.4, align 1, !dbg !1146
    #dbg_value(i32 %i80.0, !1129, !DIExpression(DW_OP_plus_uconst, 10, DW_OP_stack_value), !1130)
  %add106.4 = or disjoint i32 %i80.0, 10, !dbg !1147
    #dbg_value(i32 %add106.4, !1129, !DIExpression(), !1130)
  %arrayidx85.5 = getelementptr inbounds nuw i8, ptr %t, i32 %add106.4, !dbg !1131
  %89 = load i8, ptr %arrayidx85.5, align 1, !dbg !1131
  %div87.5 = lshr exact i32 %add106.4, 1, !dbg !1134
  %arrayidx88.5 = getelementptr inbounds nuw i8, ptr %temp, i32 %div87.5, !dbg !1135
  %90 = load i8, ptr %arrayidx88.5, align 1, !dbg !1135
  %91 = and i8 %90, 15, !dbg !1136
  %xor912.5 = xor i8 %89, %91, !dbg !1137
  %arrayidx93.5 = getelementptr inbounds nuw i8, ptr %y, i32 %add106.4, !dbg !1138
  store i8 %xor912.5, ptr %arrayidx93.5, align 1, !dbg !1139
  %add94.5 = or disjoint i32 %i80.0, 11, !dbg !1140
  %arrayidx95.5 = getelementptr inbounds nuw i8, ptr %t, i32 %add94.5, !dbg !1141
  %92 = load i8, ptr %arrayidx95.5, align 1, !dbg !1141
  %93 = lshr i8 %90, 4, !dbg !1142
  %xor1013.5 = xor i8 %92, %93, !dbg !1143
  %add103.5 = or disjoint i32 %i80.0, 11, !dbg !1144
  %arrayidx104.5 = getelementptr inbounds nuw i8, ptr %y, i32 %add103.5, !dbg !1145
  store i8 %xor1013.5, ptr %arrayidx104.5, align 1, !dbg !1146
    #dbg_value(i32 %i80.0, !1129, !DIExpression(DW_OP_plus_uconst, 12, DW_OP_stack_value), !1130)
  %add106.5 = or disjoint i32 %i80.0, 12, !dbg !1147
    #dbg_value(i32 %add106.5, !1129, !DIExpression(), !1130)
  %arrayidx85.6 = getelementptr inbounds nuw i8, ptr %t, i32 %add106.5, !dbg !1131
  %94 = load i8, ptr %arrayidx85.6, align 1, !dbg !1131
  %div87.6 = lshr exact i32 %add106.5, 1, !dbg !1134
  %arrayidx88.6 = getelementptr inbounds nuw i8, ptr %temp, i32 %div87.6, !dbg !1135
  %95 = load i8, ptr %arrayidx88.6, align 1, !dbg !1135
  %96 = and i8 %95, 15, !dbg !1136
  %xor912.6 = xor i8 %94, %96, !dbg !1137
  %arrayidx93.6 = getelementptr inbounds nuw i8, ptr %y, i32 %add106.5, !dbg !1138
  store i8 %xor912.6, ptr %arrayidx93.6, align 1, !dbg !1139
  %add94.6 = or disjoint i32 %i80.0, 13, !dbg !1140
  %arrayidx95.6 = getelementptr inbounds nuw i8, ptr %t, i32 %add94.6, !dbg !1141
  %97 = load i8, ptr %arrayidx95.6, align 1, !dbg !1141
  %98 = lshr i8 %95, 4, !dbg !1142
  %xor1013.6 = xor i8 %97, %98, !dbg !1143
  %add103.6 = or disjoint i32 %i80.0, 13, !dbg !1144
  %arrayidx104.6 = getelementptr inbounds nuw i8, ptr %y, i32 %add103.6, !dbg !1145
  store i8 %xor1013.6, ptr %arrayidx104.6, align 1, !dbg !1146
  %add106.6 = or disjoint i32 %i80.0, 14, !dbg !1147
    #dbg_value(i32 %add106.6, !1129, !DIExpression(), !1130)
  %cmp82.7 = icmp samesign ult i32 %add106.6, 78, !dbg !1148
  br i1 %cmp82.7, label %for.body84.7, label %for.end107, !dbg !1149

for.body84.7:                                     ; preds = %for.cond81
  %arrayidx85.7 = getelementptr inbounds nuw i8, ptr %t, i32 %add106.6, !dbg !1131
  %99 = load i8, ptr %arrayidx85.7, align 1, !dbg !1131
  %div87.7 = lshr exact i32 %add106.6, 1, !dbg !1134
  %arrayidx88.7 = getelementptr inbounds nuw i8, ptr %temp, i32 %div87.7, !dbg !1135
  %100 = load i8, ptr %arrayidx88.7, align 1, !dbg !1135
  %101 = and i8 %100, 15, !dbg !1136
  %xor912.7 = xor i8 %99, %101, !dbg !1137
  %arrayidx93.7 = getelementptr inbounds nuw i8, ptr %y, i32 %add106.6, !dbg !1138
  store i8 %xor912.7, ptr %arrayidx93.7, align 1, !dbg !1139
  %add94.7 = or disjoint i32 %i80.0, 15, !dbg !1140
  %arrayidx95.7 = getelementptr inbounds nuw i8, ptr %t, i32 %add94.7, !dbg !1141
  %102 = load i8, ptr %arrayidx95.7, align 1, !dbg !1141
  %103 = lshr i8 %100, 4, !dbg !1142
  %xor1013.7 = xor i8 %102, %103, !dbg !1143
  %add103.7 = or disjoint i32 %i80.0, 15, !dbg !1144
  %arrayidx104.7 = getelementptr inbounds nuw i8, ptr %y, i32 %add103.7, !dbg !1145
  store i8 %xor1013.7, ptr %arrayidx104.7, align 1, !dbg !1146
  %add106.7 = add nuw nsw i32 %i80.0, 16, !dbg !1147
    #dbg_value(i32 %add106.7, !1129, !DIExpression(), !1130)
  br label %for.cond81, !dbg !1150, !llvm.loop !1151

for.end107:                                       ; preds = %for.cond81
  ret void, !dbg !1153
}

; Function Attrs: nounwind
define internal fastcc void @compute_A(ptr noundef %p, ptr noundef %VtL, ptr noundef %A_out) unnamed_addr #0 !dbg !1154 {
entry:
  %A = alloca [800 x i64], align 8
  %tab = alloca [16 x i8], align 1
    #dbg_value(ptr %p, !1157, !DIExpression(), !1158)
    #dbg_value(ptr %VtL, !1159, !DIExpression(), !1158)
    #dbg_value(ptr %A_out, !1160, !DIExpression(), !1158)
    #dbg_value(i32 0, !1161, !DIExpression(), !1158)
    #dbg_value(i32 0, !1162, !DIExpression(), !1158)
    #dbg_value(i32 5, !1163, !DIExpression(), !1158)
    #dbg_declare(ptr %A, !1164, !DIExpression(), !1168)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(6400) %A, i8 0, i32 6400, i1 false), !dbg !1168
    #dbg_value(i32 80, !1169, !DIExpression(), !1158)
    #dbg_value(i64 1, !1170, !DIExpression(), !1173)
    #dbg_value(i64 72057594037927936, !1170, !DIExpression(), !1173)
    #dbg_value(i64 72057594037927935, !1170, !DIExpression(), !1173)
    #dbg_value(i32 0, !1174, !DIExpression(), !1176)
  br label %for.cond, !dbg !1177

for.cond:                                         ; preds = %for.body.8, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc.8, %for.body.8 ], !dbg !1178
    #dbg_value(i32 %i.0, !1174, !DIExpression(), !1176)
  %.idx = mul nuw nsw i32 %i.0, 40, !dbg !1179
  %0 = getelementptr inbounds nuw i8, ptr %VtL, i32 %.idx, !dbg !1179
  %arrayidx = getelementptr inbounds nuw i8, ptr %0, i32 32, !dbg !1179
  %1 = load i64, ptr %arrayidx, align 8, !dbg !1182
  %and = and i64 %1, 72057594037927935, !dbg !1182
  store i64 %and, ptr %arrayidx, align 8, !dbg !1182
    #dbg_value(i32 %i.0, !1174, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1176)
    #dbg_value(i32 %i.0, !1174, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1176)
  %2 = mul nuw i32 %i.0, 40, !dbg !1179
  %3 = getelementptr i8, ptr %VtL, i32 %2, !dbg !1179
  %arrayidx.1 = getelementptr i8, ptr %3, i32 72, !dbg !1179
  %4 = load i64, ptr %arrayidx.1, align 8, !dbg !1182
  %and.1 = and i64 %4, 72057594037927935, !dbg !1182
  store i64 %and.1, ptr %arrayidx.1, align 8, !dbg !1182
    #dbg_value(i32 %i.0, !1174, !DIExpression(DW_OP_plus_uconst, 2, DW_OP_stack_value), !1176)
    #dbg_value(i32 %i.0, !1174, !DIExpression(DW_OP_plus_uconst, 2, DW_OP_stack_value), !1176)
  %5 = mul nuw i32 %i.0, 40, !dbg !1179
  %6 = getelementptr i8, ptr %VtL, i32 %5, !dbg !1179
  %arrayidx.2 = getelementptr i8, ptr %6, i32 112, !dbg !1179
  %7 = load i64, ptr %arrayidx.2, align 8, !dbg !1182
  %and.2 = and i64 %7, 72057594037927935, !dbg !1182
  store i64 %and.2, ptr %arrayidx.2, align 8, !dbg !1182
    #dbg_value(i32 %i.0, !1174, !DIExpression(DW_OP_plus_uconst, 3, DW_OP_stack_value), !1176)
    #dbg_value(i32 %i.0, !1174, !DIExpression(DW_OP_plus_uconst, 3, DW_OP_stack_value), !1176)
  %8 = mul nuw i32 %i.0, 40, !dbg !1179
  %9 = getelementptr i8, ptr %VtL, i32 %8, !dbg !1179
  %arrayidx.3 = getelementptr i8, ptr %9, i32 152, !dbg !1179
  %10 = load i64, ptr %arrayidx.3, align 8, !dbg !1182
  %and.3 = and i64 %10, 72057594037927935, !dbg !1182
  store i64 %and.3, ptr %arrayidx.3, align 8, !dbg !1182
    #dbg_value(i32 %i.0, !1174, !DIExpression(DW_OP_plus_uconst, 4, DW_OP_stack_value), !1176)
    #dbg_value(i32 %i.0, !1174, !DIExpression(DW_OP_plus_uconst, 4, DW_OP_stack_value), !1176)
  %11 = mul nuw i32 %i.0, 40, !dbg !1179
  %12 = getelementptr i8, ptr %VtL, i32 %11, !dbg !1179
  %arrayidx.4 = getelementptr i8, ptr %12, i32 192, !dbg !1179
  %13 = load i64, ptr %arrayidx.4, align 8, !dbg !1182
  %and.4 = and i64 %13, 72057594037927935, !dbg !1182
  store i64 %and.4, ptr %arrayidx.4, align 8, !dbg !1182
    #dbg_value(i32 %i.0, !1174, !DIExpression(DW_OP_plus_uconst, 5, DW_OP_stack_value), !1176)
    #dbg_value(i32 %i.0, !1174, !DIExpression(DW_OP_plus_uconst, 5, DW_OP_stack_value), !1176)
  %14 = mul nuw i32 %i.0, 40, !dbg !1179
  %15 = getelementptr i8, ptr %VtL, i32 %14, !dbg !1179
  %arrayidx.5 = getelementptr i8, ptr %15, i32 232, !dbg !1179
  %16 = load i64, ptr %arrayidx.5, align 8, !dbg !1182
  %and.5 = and i64 %16, 72057594037927935, !dbg !1182
  store i64 %and.5, ptr %arrayidx.5, align 8, !dbg !1182
    #dbg_value(i32 %i.0, !1174, !DIExpression(DW_OP_plus_uconst, 6, DW_OP_stack_value), !1176)
    #dbg_value(i32 %i.0, !1174, !DIExpression(DW_OP_plus_uconst, 6, DW_OP_stack_value), !1176)
  %17 = mul nuw i32 %i.0, 40, !dbg !1179
  %18 = getelementptr i8, ptr %VtL, i32 %17, !dbg !1179
  %arrayidx.6 = getelementptr i8, ptr %18, i32 272, !dbg !1179
  %19 = load i64, ptr %arrayidx.6, align 8, !dbg !1182
  %and.6 = and i64 %19, 72057594037927935, !dbg !1182
  store i64 %and.6, ptr %arrayidx.6, align 8, !dbg !1182
    #dbg_value(i32 %i.0, !1174, !DIExpression(DW_OP_plus_uconst, 7, DW_OP_stack_value), !1176)
    #dbg_value(i32 %i.0, !1174, !DIExpression(DW_OP_plus_uconst, 7, DW_OP_stack_value), !1176)
  %20 = mul nuw i32 %i.0, 40, !dbg !1179
  %21 = getelementptr i8, ptr %VtL, i32 %20, !dbg !1179
  %arrayidx.7 = getelementptr i8, ptr %21, i32 312, !dbg !1179
  %22 = load i64, ptr %arrayidx.7, align 8, !dbg !1182
  %and.7 = and i64 %22, 72057594037927935, !dbg !1182
  store i64 %and.7, ptr %arrayidx.7, align 8, !dbg !1182
  %inc.7 = add nuw nsw i32 %i.0, 8, !dbg !1183
    #dbg_value(i32 %inc.7, !1174, !DIExpression(), !1176)
  %exitcond.8.not = icmp eq i32 %inc.7, 80, !dbg !1184
  br i1 %exitcond.8.not, label %for.cond3, label %for.body.8, !dbg !1185

for.body.8:                                       ; preds = %for.cond
  %.idx.8 = mul nuw nsw i32 %inc.7, 40, !dbg !1179
  %23 = getelementptr inbounds nuw i8, ptr %VtL, i32 %.idx.8, !dbg !1179
  %arrayidx.8 = getelementptr inbounds nuw i8, ptr %23, i32 32, !dbg !1179
  %24 = load i64, ptr %arrayidx.8, align 8, !dbg !1182
  %and.8 = and i64 %24, 72057594037927935, !dbg !1182
  store i64 %and.8, ptr %arrayidx.8, align 8, !dbg !1182
  %inc.8 = add nuw nsw i32 %i.0, 9, !dbg !1183
    #dbg_value(i32 %inc.8, !1174, !DIExpression(), !1176)
  br label %for.cond, !dbg !1186, !llvm.loop !1187

for.cond3:                                        ; preds = %for.cond, %for.inc103
  %i2.0 = phi i32 [ %inc104, %for.inc103 ], [ 0, %for.cond ], !dbg !1189
  %words_to_shift.0 = phi i32 [ %words_to_shift.1, %for.inc103 ], [ 0, %for.cond ], !dbg !1191
  %bits_to_shift.0 = phi i32 [ %bits_to_shift.1, %for.inc103 ], [ 0, %for.cond ], !dbg !1192
    #dbg_value(i32 %bits_to_shift.0, !1161, !DIExpression(), !1158)
    #dbg_value(i32 %words_to_shift.0, !1162, !DIExpression(), !1158)
    #dbg_value(i32 %i2.0, !1193, !DIExpression(), !1194)
  %exitcond8.not = icmp eq i32 %i2.0, 10, !dbg !1195
  br i1 %exitcond8.not, label %for.cond107, label %for.cond6, !dbg !1197

for.cond6:                                        ; preds = %for.cond3, %if.end95
  %j.0 = phi i32 [ %dec, %if.end95 ], [ 9, %for.cond3 ], !dbg !1198
  %words_to_shift.1 = phi i32 [ %spec.select, %if.end95 ], [ %words_to_shift.0, %for.cond3 ], !dbg !1158
  %bits_to_shift.1 = phi i32 [ %spec.select3, %if.end95 ], [ %bits_to_shift.0, %for.cond3 ], !dbg !1158
    #dbg_value(i32 %bits_to_shift.1, !1161, !DIExpression(), !1158)
    #dbg_value(i32 %words_to_shift.1, !1162, !DIExpression(), !1158)
    #dbg_value(i32 %j.0, !1201, !DIExpression(), !1202)
  %cmp7.not = icmp slt i32 %j.0, %i2.0, !dbg !1203
  br i1 %cmp7.not, label %for.inc103, label %for.body8, !dbg !1205

for.body8:                                        ; preds = %for.cond6
  %add.ptr.idx = mul nsw i32 %j.0, 320, !dbg !1206
  %add.ptr = getelementptr inbounds i8, ptr %VtL, i32 %add.ptr.idx, !dbg !1206
    #dbg_value(ptr %add.ptr, !1208, !DIExpression(), !1158)
    #dbg_value(i32 0, !1209, !DIExpression(), !1211)
  br label %for.cond11, !dbg !1212

for.cond11:                                       ; preds = %for.inc44, %for.body8
  %c.0 = phi i32 [ 0, %for.body8 ], [ %inc45, %for.inc44 ], !dbg !1213
    #dbg_value(i32 %c.0, !1209, !DIExpression(), !1211)
  %exitcond5.not = icmp eq i32 %c.0, 8, !dbg !1214
  br i1 %exitcond5.not, label %for.end46, label %for.body16, !dbg !1216

for.body16:                                       ; preds = %for.cond11
    #dbg_value(i32 0, !1217, !DIExpression(), !1220)
  %arrayidx19.idx = mul nuw nsw i32 %c.0, 40, !dbg !1221
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %arrayidx19.idx, !dbg !1221
  %25 = load i64, ptr %arrayidx19, align 8, !dbg !1221
  %sh_prom = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1224
  %shl20 = shl i64 %25, %sh_prom, !dbg !1224
  %mul21 = shl nuw nsw i32 %i2.0, 3, !dbg !1225
  %add22 = or disjoint i32 %mul21, %c.0, !dbg !1226
  %mul24 = mul i32 %words_to_shift.1, 80, !dbg !1227
  %add25 = add i32 %add22, %mul24, !dbg !1228
  %arrayidx26 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add25, !dbg !1229
  %26 = load i64, ptr %arrayidx26, align 8, !dbg !1230
  %xor = xor i64 %26, %shl20, !dbg !1230
  store i64 %xor, ptr %arrayidx26, align 8, !dbg !1230
  %cmp27 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1231
  br i1 %cmp27, label %if.then, label %for.body16.1, !dbg !1231

if.then:                                          ; preds = %for.body16
  %arrayidx30.idx = mul nuw nsw i32 %c.0, 40, !dbg !1233
  %arrayidx30 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %arrayidx30.idx, !dbg !1233
  %27 = load i64, ptr %arrayidx30, align 8, !dbg !1233
  %sub31 = sub nsw i32 64, %bits_to_shift.1, !dbg !1235
  %sh_prom32 = zext nneg i32 %sub31 to i64, !dbg !1236
  %shr = lshr i64 %27, %sh_prom32, !dbg !1236
  %mul33 = shl nuw nsw i32 %i2.0, 3, !dbg !1237
  %add34 = or disjoint i32 %mul33, %c.0, !dbg !1238
  %28 = mul i32 %words_to_shift.1, 80, !dbg !1239
  %mul37 = add i32 %28, 80, !dbg !1239
  %add38 = add i32 %add34, %mul37, !dbg !1240
  %arrayidx39 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add38, !dbg !1241
  %29 = load i64, ptr %arrayidx39, align 8, !dbg !1242
  %xor40 = xor i64 %29, %shr, !dbg !1242
  store i64 %xor40, ptr %arrayidx39, align 8, !dbg !1242
  br label %for.body16.1, !dbg !1243

for.body16.1:                                     ; preds = %if.then, %for.body16
    #dbg_value(i32 1, !1217, !DIExpression(), !1220)
  %30 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 8, !dbg !1221
  %arrayidx19.idx.1 = mul nuw nsw i32 %c.0, 40, !dbg !1221
  %arrayidx19.1 = getelementptr inbounds nuw i8, ptr %30, i32 %arrayidx19.idx.1, !dbg !1221
  %31 = load i64, ptr %arrayidx19.1, align 8, !dbg !1221
  %sh_prom.1 = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1224
  %shl20.1 = shl i64 %31, %sh_prom.1, !dbg !1224
  %mul21.1 = shl nuw nsw i32 %i2.0, 3, !dbg !1225
  %add22.1 = or disjoint i32 %mul21.1, %c.0, !dbg !1226
  %32 = mul i32 %words_to_shift.1, 80, !dbg !1227
  %mul24.1 = add i32 %32, 80, !dbg !1227
  %add25.1 = add i32 %add22.1, %mul24.1, !dbg !1228
  %arrayidx26.1 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add25.1, !dbg !1229
  %33 = load i64, ptr %arrayidx26.1, align 8, !dbg !1230
  %xor.1 = xor i64 %33, %shl20.1, !dbg !1230
  store i64 %xor.1, ptr %arrayidx26.1, align 8, !dbg !1230
  %cmp27.1 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1231
  br i1 %cmp27.1, label %if.then.1, label %for.body16.2, !dbg !1231

if.then.1:                                        ; preds = %for.body16.1
  %34 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 8, !dbg !1233
  %arrayidx30.idx.1 = mul nuw nsw i32 %c.0, 40, !dbg !1233
  %arrayidx30.1 = getelementptr inbounds nuw i8, ptr %34, i32 %arrayidx30.idx.1, !dbg !1233
  %35 = load i64, ptr %arrayidx30.1, align 8, !dbg !1233
  %sub31.1 = sub nsw i32 64, %bits_to_shift.1, !dbg !1235
  %sh_prom32.1 = zext nneg i32 %sub31.1 to i64, !dbg !1236
  %shr.1 = lshr i64 %35, %sh_prom32.1, !dbg !1236
  %mul33.1 = shl nuw nsw i32 %i2.0, 3, !dbg !1237
  %add34.1 = or disjoint i32 %mul33.1, %c.0, !dbg !1238
  %36 = mul i32 %words_to_shift.1, 80, !dbg !1239
  %mul37.1 = add i32 %36, 160, !dbg !1239
  %add38.1 = add i32 %add34.1, %mul37.1, !dbg !1240
  %arrayidx39.1 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add38.1, !dbg !1241
  %37 = load i64, ptr %arrayidx39.1, align 8, !dbg !1242
  %xor40.1 = xor i64 %37, %shr.1, !dbg !1242
  store i64 %xor40.1, ptr %arrayidx39.1, align 8, !dbg !1242
  br label %for.body16.2, !dbg !1243

for.body16.2:                                     ; preds = %for.body16.1, %if.then.1
    #dbg_value(i32 2, !1217, !DIExpression(), !1220)
  %38 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 16, !dbg !1221
  %arrayidx19.idx.2 = mul nuw nsw i32 %c.0, 40, !dbg !1221
  %arrayidx19.2 = getelementptr inbounds nuw i8, ptr %38, i32 %arrayidx19.idx.2, !dbg !1221
  %39 = load i64, ptr %arrayidx19.2, align 8, !dbg !1221
  %sh_prom.2 = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1224
  %shl20.2 = shl i64 %39, %sh_prom.2, !dbg !1224
  %mul21.2 = shl nuw nsw i32 %i2.0, 3, !dbg !1225
  %add22.2 = or disjoint i32 %mul21.2, %c.0, !dbg !1226
  %40 = mul i32 %words_to_shift.1, 80, !dbg !1227
  %mul24.2 = add i32 %40, 160, !dbg !1227
  %add25.2 = add i32 %add22.2, %mul24.2, !dbg !1228
  %arrayidx26.2 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add25.2, !dbg !1229
  %41 = load i64, ptr %arrayidx26.2, align 8, !dbg !1230
  %xor.2 = xor i64 %41, %shl20.2, !dbg !1230
  store i64 %xor.2, ptr %arrayidx26.2, align 8, !dbg !1230
  %cmp27.2 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1231
  br i1 %cmp27.2, label %if.then.2, label %for.body16.3, !dbg !1231

if.then.2:                                        ; preds = %for.body16.2
  %42 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 16, !dbg !1233
  %arrayidx30.idx.2 = mul nuw nsw i32 %c.0, 40, !dbg !1233
  %arrayidx30.2 = getelementptr inbounds nuw i8, ptr %42, i32 %arrayidx30.idx.2, !dbg !1233
  %43 = load i64, ptr %arrayidx30.2, align 8, !dbg !1233
  %sub31.2 = sub nsw i32 64, %bits_to_shift.1, !dbg !1235
  %sh_prom32.2 = zext nneg i32 %sub31.2 to i64, !dbg !1236
  %shr.2 = lshr i64 %43, %sh_prom32.2, !dbg !1236
  %mul33.2 = shl nuw nsw i32 %i2.0, 3, !dbg !1237
  %add34.2 = or disjoint i32 %mul33.2, %c.0, !dbg !1238
  %44 = mul i32 %words_to_shift.1, 80, !dbg !1239
  %mul37.2 = add i32 %44, 240, !dbg !1239
  %add38.2 = add i32 %add34.2, %mul37.2, !dbg !1240
  %arrayidx39.2 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add38.2, !dbg !1241
  %45 = load i64, ptr %arrayidx39.2, align 8, !dbg !1242
  %xor40.2 = xor i64 %45, %shr.2, !dbg !1242
  store i64 %xor40.2, ptr %arrayidx39.2, align 8, !dbg !1242
  br label %for.body16.3, !dbg !1243

for.body16.3:                                     ; preds = %for.body16.2, %if.then.2
    #dbg_value(i32 3, !1217, !DIExpression(), !1220)
  %46 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 24, !dbg !1221
  %arrayidx19.idx.3 = mul nuw nsw i32 %c.0, 40, !dbg !1221
  %arrayidx19.3 = getelementptr inbounds nuw i8, ptr %46, i32 %arrayidx19.idx.3, !dbg !1221
  %47 = load i64, ptr %arrayidx19.3, align 8, !dbg !1221
  %sh_prom.3 = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1224
  %shl20.3 = shl i64 %47, %sh_prom.3, !dbg !1224
  %mul21.3 = shl nuw nsw i32 %i2.0, 3, !dbg !1225
  %add22.3 = or disjoint i32 %mul21.3, %c.0, !dbg !1226
  %48 = mul i32 %words_to_shift.1, 80, !dbg !1227
  %mul24.3 = add i32 %48, 240, !dbg !1227
  %add25.3 = add i32 %add22.3, %mul24.3, !dbg !1228
  %arrayidx26.3 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add25.3, !dbg !1229
  %49 = load i64, ptr %arrayidx26.3, align 8, !dbg !1230
  %xor.3 = xor i64 %49, %shl20.3, !dbg !1230
  store i64 %xor.3, ptr %arrayidx26.3, align 8, !dbg !1230
  %cmp27.3 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1231
  br i1 %cmp27.3, label %if.then.3, label %for.body16.4, !dbg !1231

if.then.3:                                        ; preds = %for.body16.3
  %50 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 24, !dbg !1233
  %arrayidx30.idx.3 = mul nuw nsw i32 %c.0, 40, !dbg !1233
  %arrayidx30.3 = getelementptr inbounds nuw i8, ptr %50, i32 %arrayidx30.idx.3, !dbg !1233
  %51 = load i64, ptr %arrayidx30.3, align 8, !dbg !1233
  %sub31.3 = sub nsw i32 64, %bits_to_shift.1, !dbg !1235
  %sh_prom32.3 = zext nneg i32 %sub31.3 to i64, !dbg !1236
  %shr.3 = lshr i64 %51, %sh_prom32.3, !dbg !1236
  %mul33.3 = shl nuw nsw i32 %i2.0, 3, !dbg !1237
  %add34.3 = or disjoint i32 %mul33.3, %c.0, !dbg !1238
  %52 = mul i32 %words_to_shift.1, 80, !dbg !1239
  %mul37.3 = add i32 %52, 320, !dbg !1239
  %add38.3 = add i32 %add34.3, %mul37.3, !dbg !1240
  %arrayidx39.3 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add38.3, !dbg !1241
  %53 = load i64, ptr %arrayidx39.3, align 8, !dbg !1242
  %xor40.3 = xor i64 %53, %shr.3, !dbg !1242
  store i64 %xor40.3, ptr %arrayidx39.3, align 8, !dbg !1242
  br label %for.body16.4, !dbg !1243

for.body16.4:                                     ; preds = %for.body16.3, %if.then.3
    #dbg_value(i32 4, !1217, !DIExpression(), !1220)
  %54 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 32, !dbg !1221
  %arrayidx19.idx.4 = mul nuw nsw i32 %c.0, 40, !dbg !1221
  %arrayidx19.4 = getelementptr inbounds nuw i8, ptr %54, i32 %arrayidx19.idx.4, !dbg !1221
  %55 = load i64, ptr %arrayidx19.4, align 8, !dbg !1221
  %sh_prom.4 = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1224
  %shl20.4 = shl i64 %55, %sh_prom.4, !dbg !1224
  %mul21.4 = shl nuw nsw i32 %i2.0, 3, !dbg !1225
  %add22.4 = or disjoint i32 %mul21.4, %c.0, !dbg !1226
  %56 = mul i32 %words_to_shift.1, 80, !dbg !1227
  %mul24.4 = add i32 %56, 320, !dbg !1227
  %add25.4 = add i32 %add22.4, %mul24.4, !dbg !1228
  %arrayidx26.4 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add25.4, !dbg !1229
  %57 = load i64, ptr %arrayidx26.4, align 8, !dbg !1230
  %xor.4 = xor i64 %57, %shl20.4, !dbg !1230
  store i64 %xor.4, ptr %arrayidx26.4, align 8, !dbg !1230
  %cmp27.4 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1231
  br i1 %cmp27.4, label %if.then.4, label %for.inc44, !dbg !1231

if.then.4:                                        ; preds = %for.body16.4
  %58 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 32, !dbg !1233
  %arrayidx30.idx.4 = mul nuw nsw i32 %c.0, 40, !dbg !1233
  %arrayidx30.4 = getelementptr inbounds nuw i8, ptr %58, i32 %arrayidx30.idx.4, !dbg !1233
  %59 = load i64, ptr %arrayidx30.4, align 8, !dbg !1233
  %sub31.4 = sub nsw i32 64, %bits_to_shift.1, !dbg !1235
  %sh_prom32.4 = zext nneg i32 %sub31.4 to i64, !dbg !1236
  %shr.4 = lshr i64 %59, %sh_prom32.4, !dbg !1236
  %mul33.4 = shl nuw nsw i32 %i2.0, 3, !dbg !1237
  %add34.4 = or disjoint i32 %mul33.4, %c.0, !dbg !1238
  %60 = mul i32 %words_to_shift.1, 80, !dbg !1239
  %mul37.4 = add i32 %60, 400, !dbg !1239
  %add38.4 = add i32 %add34.4, %mul37.4, !dbg !1240
  %arrayidx39.4 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add38.4, !dbg !1241
  %61 = load i64, ptr %arrayidx39.4, align 8, !dbg !1242
  %xor40.4 = xor i64 %61, %shr.4, !dbg !1242
  store i64 %xor40.4, ptr %arrayidx39.4, align 8, !dbg !1242
  br label %for.inc44, !dbg !1243

for.inc44:                                        ; preds = %for.body16.4, %if.then.4
    #dbg_value(i32 5, !1217, !DIExpression(), !1220)
  %inc45 = add nuw nsw i32 %c.0, 1, !dbg !1244
    #dbg_value(i32 %inc45, !1209, !DIExpression(), !1211)
  br label %for.cond11, !dbg !1245, !llvm.loop !1246

for.end46:                                        ; preds = %for.cond11
  %cmp47.not = icmp eq i32 %i2.0, %j.0, !dbg !1248
  br i1 %cmp47.not, label %if.end95, label %if.then48, !dbg !1248

if.then48:                                        ; preds = %for.end46
  %add.ptr51.idx = mul nuw nsw i32 %i2.0, 320, !dbg !1250
  %add.ptr51 = getelementptr inbounds nuw i8, ptr %VtL, i32 %add.ptr51.idx, !dbg !1250
    #dbg_value(ptr %add.ptr51, !1252, !DIExpression(), !1158)
    #dbg_value(i32 0, !1253, !DIExpression(), !1255)
  br label %for.cond53, !dbg !1256

for.cond53:                                       ; preds = %for.inc92, %if.then48
  %c52.0 = phi i32 [ 0, %if.then48 ], [ %inc93, %for.inc92 ], !dbg !1257
    #dbg_value(i32 %c52.0, !1253, !DIExpression(), !1255)
  %exitcond7.not = icmp eq i32 %c52.0, 8, !dbg !1258
  br i1 %exitcond7.not, label %if.end95, label %for.body59, !dbg !1260

for.body59:                                       ; preds = %for.cond53
    #dbg_value(i32 0, !1261, !DIExpression(), !1264)
  %arrayidx62.idx = mul nuw nsw i32 %c52.0, 40, !dbg !1265
  %arrayidx62 = getelementptr inbounds nuw i8, ptr %add.ptr51, i32 %arrayidx62.idx, !dbg !1265
  %62 = load i64, ptr %arrayidx62, align 8, !dbg !1265
  %sh_prom63 = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1268
  %shl64 = shl i64 %62, %sh_prom63, !dbg !1268
  %mul65 = shl nsw i32 %j.0, 3, !dbg !1269
  %add66 = or disjoint i32 %mul65, %c52.0, !dbg !1270
  %mul68 = mul i32 %words_to_shift.1, 80, !dbg !1271
  %add69 = add i32 %add66, %mul68, !dbg !1272
  %arrayidx70 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add69, !dbg !1273
  %63 = load i64, ptr %arrayidx70, align 8, !dbg !1274
  %xor71 = xor i64 %63, %shl64, !dbg !1274
  store i64 %xor71, ptr %arrayidx70, align 8, !dbg !1274
  %cmp72 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1275
  br i1 %cmp72, label %if.then73, label %for.body59.1, !dbg !1275

if.then73:                                        ; preds = %for.body59
  %arrayidx76.idx = mul nuw nsw i32 %c52.0, 40, !dbg !1277
  %arrayidx76 = getelementptr inbounds nuw i8, ptr %add.ptr51, i32 %arrayidx76.idx, !dbg !1277
  %64 = load i64, ptr %arrayidx76, align 8, !dbg !1277
  %sub77 = sub nsw i32 64, %bits_to_shift.1, !dbg !1279
  %sh_prom78 = zext nneg i32 %sub77 to i64, !dbg !1280
  %shr79 = lshr i64 %64, %sh_prom78, !dbg !1280
  %mul80 = shl nsw i32 %j.0, 3, !dbg !1281
  %add81 = or disjoint i32 %mul80, %c52.0, !dbg !1282
  %65 = mul i32 %words_to_shift.1, 80, !dbg !1283
  %mul84 = add i32 %65, 80, !dbg !1283
  %add85 = add i32 %add81, %mul84, !dbg !1284
  %arrayidx86 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add85, !dbg !1285
  %66 = load i64, ptr %arrayidx86, align 8, !dbg !1286
  %xor87 = xor i64 %66, %shr79, !dbg !1286
  store i64 %xor87, ptr %arrayidx86, align 8, !dbg !1286
  br label %for.body59.1, !dbg !1287

for.body59.1:                                     ; preds = %if.then73, %for.body59
    #dbg_value(i32 1, !1261, !DIExpression(), !1264)
  %67 = getelementptr inbounds nuw i8, ptr %add.ptr51, i32 8, !dbg !1265
  %arrayidx62.idx.1 = mul nuw nsw i32 %c52.0, 40, !dbg !1265
  %arrayidx62.1 = getelementptr inbounds nuw i8, ptr %67, i32 %arrayidx62.idx.1, !dbg !1265
  %68 = load i64, ptr %arrayidx62.1, align 8, !dbg !1265
  %sh_prom63.1 = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1268
  %shl64.1 = shl i64 %68, %sh_prom63.1, !dbg !1268
  %mul65.1 = shl nsw i32 %j.0, 3, !dbg !1269
  %add66.1 = or disjoint i32 %mul65.1, %c52.0, !dbg !1270
  %69 = mul i32 %words_to_shift.1, 80, !dbg !1271
  %mul68.1 = add i32 %69, 80, !dbg !1271
  %add69.1 = add i32 %add66.1, %mul68.1, !dbg !1272
  %arrayidx70.1 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add69.1, !dbg !1273
  %70 = load i64, ptr %arrayidx70.1, align 8, !dbg !1274
  %xor71.1 = xor i64 %70, %shl64.1, !dbg !1274
  store i64 %xor71.1, ptr %arrayidx70.1, align 8, !dbg !1274
  %cmp72.1 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1275
  br i1 %cmp72.1, label %if.then73.1, label %for.body59.2, !dbg !1275

if.then73.1:                                      ; preds = %for.body59.1
  %71 = getelementptr inbounds nuw i8, ptr %add.ptr51, i32 8, !dbg !1277
  %arrayidx76.idx.1 = mul nuw nsw i32 %c52.0, 40, !dbg !1277
  %arrayidx76.1 = getelementptr inbounds nuw i8, ptr %71, i32 %arrayidx76.idx.1, !dbg !1277
  %72 = load i64, ptr %arrayidx76.1, align 8, !dbg !1277
  %sub77.1 = sub nsw i32 64, %bits_to_shift.1, !dbg !1279
  %sh_prom78.1 = zext nneg i32 %sub77.1 to i64, !dbg !1280
  %shr79.1 = lshr i64 %72, %sh_prom78.1, !dbg !1280
  %mul80.1 = shl nsw i32 %j.0, 3, !dbg !1281
  %add81.1 = or disjoint i32 %mul80.1, %c52.0, !dbg !1282
  %73 = mul i32 %words_to_shift.1, 80, !dbg !1283
  %mul84.1 = add i32 %73, 160, !dbg !1283
  %add85.1 = add i32 %add81.1, %mul84.1, !dbg !1284
  %arrayidx86.1 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add85.1, !dbg !1285
  %74 = load i64, ptr %arrayidx86.1, align 8, !dbg !1286
  %xor87.1 = xor i64 %74, %shr79.1, !dbg !1286
  store i64 %xor87.1, ptr %arrayidx86.1, align 8, !dbg !1286
  br label %for.body59.2, !dbg !1287

for.body59.2:                                     ; preds = %for.body59.1, %if.then73.1
    #dbg_value(i32 2, !1261, !DIExpression(), !1264)
  %75 = getelementptr inbounds nuw i8, ptr %add.ptr51, i32 16, !dbg !1265
  %arrayidx62.idx.2 = mul nuw nsw i32 %c52.0, 40, !dbg !1265
  %arrayidx62.2 = getelementptr inbounds nuw i8, ptr %75, i32 %arrayidx62.idx.2, !dbg !1265
  %76 = load i64, ptr %arrayidx62.2, align 8, !dbg !1265
  %sh_prom63.2 = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1268
  %shl64.2 = shl i64 %76, %sh_prom63.2, !dbg !1268
  %mul65.2 = shl nsw i32 %j.0, 3, !dbg !1269
  %add66.2 = or disjoint i32 %mul65.2, %c52.0, !dbg !1270
  %77 = mul i32 %words_to_shift.1, 80, !dbg !1271
  %mul68.2 = add i32 %77, 160, !dbg !1271
  %add69.2 = add i32 %add66.2, %mul68.2, !dbg !1272
  %arrayidx70.2 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add69.2, !dbg !1273
  %78 = load i64, ptr %arrayidx70.2, align 8, !dbg !1274
  %xor71.2 = xor i64 %78, %shl64.2, !dbg !1274
  store i64 %xor71.2, ptr %arrayidx70.2, align 8, !dbg !1274
  %cmp72.2 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1275
  br i1 %cmp72.2, label %if.then73.2, label %for.body59.3, !dbg !1275

if.then73.2:                                      ; preds = %for.body59.2
  %79 = getelementptr inbounds nuw i8, ptr %add.ptr51, i32 16, !dbg !1277
  %arrayidx76.idx.2 = mul nuw nsw i32 %c52.0, 40, !dbg !1277
  %arrayidx76.2 = getelementptr inbounds nuw i8, ptr %79, i32 %arrayidx76.idx.2, !dbg !1277
  %80 = load i64, ptr %arrayidx76.2, align 8, !dbg !1277
  %sub77.2 = sub nsw i32 64, %bits_to_shift.1, !dbg !1279
  %sh_prom78.2 = zext nneg i32 %sub77.2 to i64, !dbg !1280
  %shr79.2 = lshr i64 %80, %sh_prom78.2, !dbg !1280
  %mul80.2 = shl nsw i32 %j.0, 3, !dbg !1281
  %add81.2 = or disjoint i32 %mul80.2, %c52.0, !dbg !1282
  %81 = mul i32 %words_to_shift.1, 80, !dbg !1283
  %mul84.2 = add i32 %81, 240, !dbg !1283
  %add85.2 = add i32 %add81.2, %mul84.2, !dbg !1284
  %arrayidx86.2 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add85.2, !dbg !1285
  %82 = load i64, ptr %arrayidx86.2, align 8, !dbg !1286
  %xor87.2 = xor i64 %82, %shr79.2, !dbg !1286
  store i64 %xor87.2, ptr %arrayidx86.2, align 8, !dbg !1286
  br label %for.body59.3, !dbg !1287

for.body59.3:                                     ; preds = %for.body59.2, %if.then73.2
    #dbg_value(i32 3, !1261, !DIExpression(), !1264)
  %83 = getelementptr inbounds nuw i8, ptr %add.ptr51, i32 24, !dbg !1265
  %arrayidx62.idx.3 = mul nuw nsw i32 %c52.0, 40, !dbg !1265
  %arrayidx62.3 = getelementptr inbounds nuw i8, ptr %83, i32 %arrayidx62.idx.3, !dbg !1265
  %84 = load i64, ptr %arrayidx62.3, align 8, !dbg !1265
  %sh_prom63.3 = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1268
  %shl64.3 = shl i64 %84, %sh_prom63.3, !dbg !1268
  %mul65.3 = shl nsw i32 %j.0, 3, !dbg !1269
  %add66.3 = or disjoint i32 %mul65.3, %c52.0, !dbg !1270
  %85 = mul i32 %words_to_shift.1, 80, !dbg !1271
  %mul68.3 = add i32 %85, 240, !dbg !1271
  %add69.3 = add i32 %add66.3, %mul68.3, !dbg !1272
  %arrayidx70.3 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add69.3, !dbg !1273
  %86 = load i64, ptr %arrayidx70.3, align 8, !dbg !1274
  %xor71.3 = xor i64 %86, %shl64.3, !dbg !1274
  store i64 %xor71.3, ptr %arrayidx70.3, align 8, !dbg !1274
  %cmp72.3 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1275
  br i1 %cmp72.3, label %if.then73.3, label %for.body59.4, !dbg !1275

if.then73.3:                                      ; preds = %for.body59.3
  %87 = getelementptr inbounds nuw i8, ptr %add.ptr51, i32 24, !dbg !1277
  %arrayidx76.idx.3 = mul nuw nsw i32 %c52.0, 40, !dbg !1277
  %arrayidx76.3 = getelementptr inbounds nuw i8, ptr %87, i32 %arrayidx76.idx.3, !dbg !1277
  %88 = load i64, ptr %arrayidx76.3, align 8, !dbg !1277
  %sub77.3 = sub nsw i32 64, %bits_to_shift.1, !dbg !1279
  %sh_prom78.3 = zext nneg i32 %sub77.3 to i64, !dbg !1280
  %shr79.3 = lshr i64 %88, %sh_prom78.3, !dbg !1280
  %mul80.3 = shl nsw i32 %j.0, 3, !dbg !1281
  %add81.3 = or disjoint i32 %mul80.3, %c52.0, !dbg !1282
  %89 = mul i32 %words_to_shift.1, 80, !dbg !1283
  %mul84.3 = add i32 %89, 320, !dbg !1283
  %add85.3 = add i32 %add81.3, %mul84.3, !dbg !1284
  %arrayidx86.3 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add85.3, !dbg !1285
  %90 = load i64, ptr %arrayidx86.3, align 8, !dbg !1286
  %xor87.3 = xor i64 %90, %shr79.3, !dbg !1286
  store i64 %xor87.3, ptr %arrayidx86.3, align 8, !dbg !1286
  br label %for.body59.4, !dbg !1287

for.body59.4:                                     ; preds = %for.body59.3, %if.then73.3
    #dbg_value(i32 4, !1261, !DIExpression(), !1264)
  %91 = getelementptr inbounds nuw i8, ptr %add.ptr51, i32 32, !dbg !1265
  %arrayidx62.idx.4 = mul nuw nsw i32 %c52.0, 40, !dbg !1265
  %arrayidx62.4 = getelementptr inbounds nuw i8, ptr %91, i32 %arrayidx62.idx.4, !dbg !1265
  %92 = load i64, ptr %arrayidx62.4, align 8, !dbg !1265
  %sh_prom63.4 = zext nneg i32 %bits_to_shift.1 to i64, !dbg !1268
  %shl64.4 = shl i64 %92, %sh_prom63.4, !dbg !1268
  %mul65.4 = shl nsw i32 %j.0, 3, !dbg !1269
  %add66.4 = or disjoint i32 %mul65.4, %c52.0, !dbg !1270
  %93 = mul i32 %words_to_shift.1, 80, !dbg !1271
  %mul68.4 = add i32 %93, 320, !dbg !1271
  %add69.4 = add i32 %add66.4, %mul68.4, !dbg !1272
  %arrayidx70.4 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add69.4, !dbg !1273
  %94 = load i64, ptr %arrayidx70.4, align 8, !dbg !1274
  %xor71.4 = xor i64 %94, %shl64.4, !dbg !1274
  store i64 %xor71.4, ptr %arrayidx70.4, align 8, !dbg !1274
  %cmp72.4 = icmp sgt i32 %bits_to_shift.1, 0, !dbg !1275
  br i1 %cmp72.4, label %if.then73.4, label %for.inc92, !dbg !1275

if.then73.4:                                      ; preds = %for.body59.4
  %95 = getelementptr inbounds nuw i8, ptr %add.ptr51, i32 32, !dbg !1277
  %arrayidx76.idx.4 = mul nuw nsw i32 %c52.0, 40, !dbg !1277
  %arrayidx76.4 = getelementptr inbounds nuw i8, ptr %95, i32 %arrayidx76.idx.4, !dbg !1277
  %96 = load i64, ptr %arrayidx76.4, align 8, !dbg !1277
  %sub77.4 = sub nsw i32 64, %bits_to_shift.1, !dbg !1279
  %sh_prom78.4 = zext nneg i32 %sub77.4 to i64, !dbg !1280
  %shr79.4 = lshr i64 %96, %sh_prom78.4, !dbg !1280
  %mul80.4 = shl nsw i32 %j.0, 3, !dbg !1281
  %add81.4 = or disjoint i32 %mul80.4, %c52.0, !dbg !1282
  %97 = mul i32 %words_to_shift.1, 80, !dbg !1283
  %mul84.4 = add i32 %97, 400, !dbg !1283
  %add85.4 = add i32 %add81.4, %mul84.4, !dbg !1284
  %arrayidx86.4 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add85.4, !dbg !1285
  %98 = load i64, ptr %arrayidx86.4, align 8, !dbg !1286
  %xor87.4 = xor i64 %98, %shr79.4, !dbg !1286
  store i64 %xor87.4, ptr %arrayidx86.4, align 8, !dbg !1286
  br label %for.inc92, !dbg !1287

for.inc92:                                        ; preds = %for.body59.4, %if.then73.4
    #dbg_value(i32 5, !1261, !DIExpression(), !1264)
  %inc93 = add nuw nsw i32 %c52.0, 1, !dbg !1288
    #dbg_value(i32 %inc93, !1253, !DIExpression(), !1255)
  br label %for.cond53, !dbg !1289, !llvm.loop !1290

if.end95:                                         ; preds = %for.cond53, %for.end46
  %add96 = add nsw i32 %bits_to_shift.1, 4, !dbg !1292
    #dbg_value(i32 %add96, !1161, !DIExpression(), !1158)
  %cmp97 = icmp eq i32 %add96, 64, !dbg !1293
  %inc99 = zext i1 %cmp97 to i32, !dbg !1293
  %spec.select = add nsw i32 %words_to_shift.1, %inc99, !dbg !1293
  %spec.select3 = select i1 %cmp97, i32 0, i32 %add96, !dbg !1293
    #dbg_value(i32 %spec.select3, !1161, !DIExpression(), !1158)
    #dbg_value(i32 %spec.select, !1162, !DIExpression(), !1158)
  %dec = add nsw i32 %j.0, -1, !dbg !1295
    #dbg_value(i32 %dec, !1201, !DIExpression(), !1202)
  br label %for.cond6, !dbg !1296, !llvm.loop !1297

for.inc103:                                       ; preds = %for.cond6
  %inc104 = add nuw nsw i32 %i2.0, 1, !dbg !1299
    #dbg_value(i32 %inc104, !1193, !DIExpression(), !1194)
  br label %for.cond3, !dbg !1300, !llvm.loop !1301

for.cond107:                                      ; preds = %for.cond3, %for.body110
  %c106.0 = phi i32 [ %add113, %for.body110 ], [ 0, %for.cond3 ], !dbg !1303
    #dbg_value(i32 %c106.0, !1305, !DIExpression(), !1306)
  %cmp109 = icmp samesign ult i32 %c106.0, 720, !dbg !1307
  br i1 %cmp109, label %for.body110, label %for.end114, !dbg !1309

for.body110:                                      ; preds = %for.cond107
  %add.ptr111 = getelementptr inbounds nuw i64, ptr %A, i32 %c106.0, !dbg !1310
  call fastcc void @transpose_16x16_nibbles(ptr noundef nonnull %add.ptr111) #6, !dbg !1312
  %add113 = add nuw nsw i32 %c106.0, 16, !dbg !1313
    #dbg_value(i32 %add113, !1305, !DIExpression(), !1306)
  br label %for.cond107, !dbg !1314, !llvm.loop !1315

for.end114:                                       ; preds = %for.cond107
    #dbg_declare(ptr %tab, !1317, !DIExpression(), !1321)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(16) %tab, i8 0, i32 16, i1 false), !dbg !1321
    #dbg_value(i32 0, !1322, !DIExpression(), !1324)
  br label %for.cond116, !dbg !1325

for.cond116:                                      ; preds = %for.body118, %for.end114
  %i115.0 = phi i32 [ 0, %for.end114 ], [ %inc138.3, %for.body118 ], !dbg !1326
    #dbg_value(i32 %i115.0, !1322, !DIExpression(), !1324)
  %exitcond9.not = icmp eq i32 %i115.0, 4, !dbg !1327
  br i1 %exitcond9.not, label %for.cond141, label %for.body118, !dbg !1329

for.body118:                                      ; preds = %for.cond116
  %arrayidx119 = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %i115.0, !dbg !1330
  %99 = load i8, ptr %arrayidx119, align 1, !dbg !1330
  %call = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %99, i8 noundef zeroext 1) #6, !dbg !1332
  %mul120 = shl nuw nsw i32 %i115.0, 2, !dbg !1333
  %arrayidx121 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %mul120, !dbg !1334
  store i8 %call, ptr %arrayidx121, align 1, !dbg !1335
  %call123 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %99, i8 noundef zeroext 2) #6, !dbg !1336
  %mul124 = shl nuw nsw i32 %i115.0, 2, !dbg !1337
  %add125 = or disjoint i32 %mul124, 1, !dbg !1338
  %arrayidx126 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add125, !dbg !1339
  store i8 %call123, ptr %arrayidx126, align 1, !dbg !1340
  %call128 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %99, i8 noundef zeroext 4) #6, !dbg !1341
  %mul129 = shl nuw nsw i32 %i115.0, 2, !dbg !1342
  %add130 = or disjoint i32 %mul129, 2, !dbg !1343
  %arrayidx131 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add130, !dbg !1344
  store i8 %call128, ptr %arrayidx131, align 1, !dbg !1345
  %call133 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %99, i8 noundef zeroext 8) #6, !dbg !1346
  %mul134 = shl nuw nsw i32 %i115.0, 2, !dbg !1347
  %add135 = or disjoint i32 %mul134, 3, !dbg !1348
  %arrayidx136 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add135, !dbg !1349
  store i8 %call133, ptr %arrayidx136, align 1, !dbg !1350
    #dbg_value(i32 %i115.0, !1322, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1324)
  %inc138 = or disjoint i32 %i115.0, 1, !dbg !1351
    #dbg_value(i32 %inc138, !1322, !DIExpression(), !1324)
  %arrayidx119.1 = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %inc138, !dbg !1330
  %100 = load i8, ptr %arrayidx119.1, align 1, !dbg !1330
  %call.1 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %100, i8 noundef zeroext 1) #6, !dbg !1332
  %mul120.1 = shl nuw nsw i32 %inc138, 2, !dbg !1333
  %arrayidx121.1 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %mul120.1, !dbg !1334
  store i8 %call.1, ptr %arrayidx121.1, align 1, !dbg !1335
  %call123.1 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %100, i8 noundef zeroext 2) #6, !dbg !1336
  %mul124.1 = shl nuw nsw i32 %inc138, 2, !dbg !1337
  %add125.1 = or disjoint i32 %mul124.1, 1, !dbg !1338
  %arrayidx126.1 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add125.1, !dbg !1339
  store i8 %call123.1, ptr %arrayidx126.1, align 1, !dbg !1340
  %call128.1 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %100, i8 noundef zeroext 4) #6, !dbg !1341
  %mul129.1 = shl nuw nsw i32 %inc138, 2, !dbg !1342
  %add130.1 = or disjoint i32 %mul129.1, 2, !dbg !1343
  %arrayidx131.1 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add130.1, !dbg !1344
  store i8 %call128.1, ptr %arrayidx131.1, align 1, !dbg !1345
  %call133.1 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %100, i8 noundef zeroext 8) #6, !dbg !1346
  %mul134.1 = shl nuw nsw i32 %inc138, 2, !dbg !1347
  %add135.1 = or disjoint i32 %mul134.1, 3, !dbg !1348
  %arrayidx136.1 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add135.1, !dbg !1349
  store i8 %call133.1, ptr %arrayidx136.1, align 1, !dbg !1350
    #dbg_value(i32 %i115.0, !1322, !DIExpression(DW_OP_plus_uconst, 2, DW_OP_stack_value), !1324)
  %inc138.1 = or disjoint i32 %i115.0, 2, !dbg !1351
    #dbg_value(i32 %inc138.1, !1322, !DIExpression(), !1324)
  %arrayidx119.2 = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %inc138.1, !dbg !1330
  %101 = load i8, ptr %arrayidx119.2, align 1, !dbg !1330
  %call.2 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %101, i8 noundef zeroext 1) #6, !dbg !1332
  %mul120.2 = shl nuw nsw i32 %inc138.1, 2, !dbg !1333
  %arrayidx121.2 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %mul120.2, !dbg !1334
  store i8 %call.2, ptr %arrayidx121.2, align 1, !dbg !1335
  %call123.2 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %101, i8 noundef zeroext 2) #6, !dbg !1336
  %mul124.2 = shl nuw nsw i32 %inc138.1, 2, !dbg !1337
  %add125.2 = or disjoint i32 %mul124.2, 1, !dbg !1338
  %arrayidx126.2 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add125.2, !dbg !1339
  store i8 %call123.2, ptr %arrayidx126.2, align 1, !dbg !1340
  %call128.2 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %101, i8 noundef zeroext 4) #6, !dbg !1341
  %mul129.2 = shl nuw nsw i32 %inc138.1, 2, !dbg !1342
  %add130.2 = or disjoint i32 %mul129.2, 2, !dbg !1343
  %arrayidx131.2 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add130.2, !dbg !1344
  store i8 %call128.2, ptr %arrayidx131.2, align 1, !dbg !1345
  %call133.2 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %101, i8 noundef zeroext 8) #6, !dbg !1346
  %mul134.2 = shl nuw nsw i32 %inc138.1, 2, !dbg !1347
  %add135.2 = or disjoint i32 %mul134.2, 3, !dbg !1348
  %arrayidx136.2 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add135.2, !dbg !1349
  store i8 %call133.2, ptr %arrayidx136.2, align 1, !dbg !1350
    #dbg_value(i32 %i115.0, !1322, !DIExpression(DW_OP_plus_uconst, 3, DW_OP_stack_value), !1324)
  %inc138.2 = or disjoint i32 %i115.0, 3, !dbg !1351
    #dbg_value(i32 %inc138.2, !1322, !DIExpression(), !1324)
  %arrayidx119.3 = getelementptr inbounds nuw [4 x i8], ptr @f_tail, i32 0, i32 %inc138.2, !dbg !1330
  %102 = load i8, ptr %arrayidx119.3, align 1, !dbg !1330
  %call.3 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %102, i8 noundef zeroext 1) #6, !dbg !1332
  %mul120.3 = shl nuw nsw i32 %inc138.2, 2, !dbg !1333
  %arrayidx121.3 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %mul120.3, !dbg !1334
  store i8 %call.3, ptr %arrayidx121.3, align 1, !dbg !1335
  %call123.3 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %102, i8 noundef zeroext 2) #6, !dbg !1336
  %mul124.3 = shl nuw nsw i32 %inc138.2, 2, !dbg !1337
  %add125.3 = or disjoint i32 %mul124.3, 1, !dbg !1338
  %arrayidx126.3 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add125.3, !dbg !1339
  store i8 %call123.3, ptr %arrayidx126.3, align 1, !dbg !1340
  %call128.3 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %102, i8 noundef zeroext 4) #6, !dbg !1341
  %mul129.3 = shl nuw nsw i32 %inc138.2, 2, !dbg !1342
  %add130.3 = or disjoint i32 %mul129.3, 2, !dbg !1343
  %arrayidx131.3 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add130.3, !dbg !1344
  store i8 %call128.3, ptr %arrayidx131.3, align 1, !dbg !1345
  %call133.3 = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %102, i8 noundef zeroext 8) #6, !dbg !1346
  %mul134.3 = shl nuw nsw i32 %inc138.2, 2, !dbg !1347
  %add135.3 = or disjoint i32 %mul134.3, 3, !dbg !1348
  %arrayidx136.3 = getelementptr inbounds nuw [16 x i8], ptr %tab, i32 0, i32 %add135.3, !dbg !1349
  store i8 %call133.3, ptr %arrayidx136.3, align 1, !dbg !1350
  %inc138.3 = add nuw nsw i32 %i115.0, 4, !dbg !1351
    #dbg_value(i32 %inc138.3, !1322, !DIExpression(), !1324)
  br label %for.cond116, !dbg !1352, !llvm.loop !1353

for.cond141:                                      ; preds = %for.cond116, %for.inc203
  %c140.0 = phi i32 [ %add204, %for.inc203 ], [ 0, %for.cond116 ], !dbg !1355
    #dbg_value(i32 %c140.0, !1357, !DIExpression(), !1358)
  %cmp142 = icmp samesign ult i32 %c140.0, 80, !dbg !1359
  br i1 %cmp142, label %for.cond144, label %for.cond207, !dbg !1361

for.cond144:                                      ; preds = %for.cond141, %for.body146
  %r.0 = phi i32 [ %inc201, %for.body146 ], [ 78, %for.cond141 ], !dbg !1362
    #dbg_value(i32 %r.0, !1365, !DIExpression(), !1366)
  %exitcond11.not = icmp eq i32 %r.0, 133, !dbg !1367
  br i1 %exitcond11.not, label %for.inc203, label %for.body146, !dbg !1369

for.body146:                                      ; preds = %for.cond144
  %div1 = lshr i32 %r.0, 4, !dbg !1370
  %mul147 = mul nuw nsw i32 %div1, 80, !dbg !1372
  %add148 = add nuw nsw i32 %mul147, %c140.0, !dbg !1373
  %rem = and i32 %r.0, 15, !dbg !1374
  %add149 = or disjoint i32 %add148, %rem, !dbg !1375
    #dbg_value(i32 %add149, !1376, !DIExpression(), !1377)
  %arrayidx150 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add149, !dbg !1378
  %103 = load i64, ptr %arrayidx150, align 8, !dbg !1378
  %and151 = and i64 %103, 1229782938247303441, !dbg !1379
    #dbg_value(i64 %and151, !1380, !DIExpression(), !1377)
  %shr153 = lshr i64 %103, 1, !dbg !1381
  %and154 = and i64 %shr153, 1229782938247303441, !dbg !1382
    #dbg_value(i64 %and154, !1383, !DIExpression(), !1377)
  %shr156 = lshr i64 %103, 2, !dbg !1384
  %and157 = and i64 %shr156, 1229782938247303441, !dbg !1385
    #dbg_value(i64 %and157, !1386, !DIExpression(), !1377)
  %arrayidx158 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add149, !dbg !1387
  %104 = load i64, ptr %arrayidx158, align 8, !dbg !1387
  %shr159 = lshr i64 %104, 3, !dbg !1388
  %and160 = and i64 %shr159, 1229782938247303441, !dbg !1389
    #dbg_value(i64 %and160, !1390, !DIExpression(), !1377)
    #dbg_value(i32 0, !1391, !DIExpression(), !1393)
    #dbg_value(i32 0, !1391, !DIExpression(), !1393)
  %105 = load i8, ptr %tab, align 1, !dbg !1394
  %conv = zext i8 %105 to i64, !dbg !1394
  %mul167 = mul i64 %and151, %conv, !dbg !1397
  %arrayidx170 = getelementptr inbounds nuw i8, ptr %tab, i32 1, !dbg !1398
  %106 = load i8, ptr %arrayidx170, align 1, !dbg !1398
  %conv171 = zext i8 %106 to i64, !dbg !1398
  %mul172 = mul i64 %and154, %conv171, !dbg !1399
  %xor173 = xor i64 %mul167, %mul172, !dbg !1400
  %arrayidx176 = getelementptr inbounds nuw i8, ptr %tab, i32 2, !dbg !1401
  %107 = load i8, ptr %arrayidx176, align 1, !dbg !1401
  %conv177 = zext i8 %107 to i64, !dbg !1401
  %mul178 = mul i64 %and157, %conv177, !dbg !1402
  %xor179 = xor i64 %xor173, %mul178, !dbg !1403
  %arrayidx182 = getelementptr inbounds nuw i8, ptr %tab, i32 3, !dbg !1404
  %108 = load i8, ptr %arrayidx182, align 1, !dbg !1404
  %conv183 = zext i8 %108 to i64, !dbg !1404
  %mul184 = mul i64 %and160, %conv183, !dbg !1405
  %xor185 = xor i64 %xor179, %mul184, !dbg !1406
  %sub187 = add nsw i32 %r.0, -78, !dbg !1407
  %div1882 = lshr i32 %sub187, 4, !dbg !1408
  %mul189 = mul i32 %div1882, 80, !dbg !1409
  %add190 = add i32 %mul189, %c140.0, !dbg !1410
  %sub192 = add nuw nsw i32 %r.0, 2, !dbg !1411
  %rem193 = and i32 %sub192, 15, !dbg !1412
  %add194 = or disjoint i32 %add190, %rem193, !dbg !1413
  %arrayidx195 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add194, !dbg !1414
  %109 = load i64, ptr %arrayidx195, align 8, !dbg !1415
  %xor196 = xor i64 %109, %xor185, !dbg !1415
  store i64 %xor196, ptr %arrayidx195, align 8, !dbg !1415
    #dbg_value(i32 1, !1391, !DIExpression(), !1393)
  %arrayidx166.1 = getelementptr inbounds nuw i8, ptr %tab, i32 4, !dbg !1394
  %110 = load i8, ptr %arrayidx166.1, align 1, !dbg !1394
  %conv.1 = zext i8 %110 to i64, !dbg !1394
  %mul167.1 = mul i64 %and151, %conv.1, !dbg !1397
  %arrayidx170.1 = getelementptr inbounds nuw i8, ptr %tab, i32 5, !dbg !1398
  %111 = load i8, ptr %arrayidx170.1, align 1, !dbg !1398
  %conv171.1 = zext i8 %111 to i64, !dbg !1398
  %mul172.1 = mul i64 %and154, %conv171.1, !dbg !1399
  %xor173.1 = xor i64 %mul167.1, %mul172.1, !dbg !1400
  %arrayidx176.1 = getelementptr inbounds nuw i8, ptr %tab, i32 6, !dbg !1401
  %112 = load i8, ptr %arrayidx176.1, align 1, !dbg !1401
  %conv177.1 = zext i8 %112 to i64, !dbg !1401
  %mul178.1 = mul i64 %and157, %conv177.1, !dbg !1402
  %xor179.1 = xor i64 %xor173.1, %mul178.1, !dbg !1403
  %arrayidx182.1 = getelementptr inbounds nuw i8, ptr %tab, i32 7, !dbg !1404
  %113 = load i8, ptr %arrayidx182.1, align 1, !dbg !1404
  %conv183.1 = zext i8 %113 to i64, !dbg !1404
  %mul184.1 = mul i64 %and160, %conv183.1, !dbg !1405
  %xor185.1 = xor i64 %xor179.1, %mul184.1, !dbg !1406
  %sub187.1 = add nsw i32 %r.0, -77, !dbg !1407
  %div1882.1 = lshr i32 %sub187.1, 4, !dbg !1408
  %mul189.1 = mul i32 %div1882.1, 80, !dbg !1409
  %add190.1 = add i32 %mul189.1, %c140.0, !dbg !1410
  %sub192.1 = add nuw nsw i32 %r.0, 3, !dbg !1411
  %rem193.1 = and i32 %sub192.1, 15, !dbg !1412
  %add194.1 = or disjoint i32 %add190.1, %rem193.1, !dbg !1413
  %arrayidx195.1 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add194.1, !dbg !1414
  %114 = load i64, ptr %arrayidx195.1, align 8, !dbg !1415
  %xor196.1 = xor i64 %114, %xor185.1, !dbg !1415
  store i64 %xor196.1, ptr %arrayidx195.1, align 8, !dbg !1415
    #dbg_value(i32 2, !1391, !DIExpression(), !1393)
  %arrayidx166.2 = getelementptr inbounds nuw i8, ptr %tab, i32 8, !dbg !1394
  %115 = load i8, ptr %arrayidx166.2, align 1, !dbg !1394
  %conv.2 = zext i8 %115 to i64, !dbg !1394
  %mul167.2 = mul i64 %and151, %conv.2, !dbg !1397
  %arrayidx170.2 = getelementptr inbounds nuw i8, ptr %tab, i32 9, !dbg !1398
  %116 = load i8, ptr %arrayidx170.2, align 1, !dbg !1398
  %conv171.2 = zext i8 %116 to i64, !dbg !1398
  %mul172.2 = mul i64 %and154, %conv171.2, !dbg !1399
  %xor173.2 = xor i64 %mul167.2, %mul172.2, !dbg !1400
  %arrayidx176.2 = getelementptr inbounds nuw i8, ptr %tab, i32 10, !dbg !1401
  %117 = load i8, ptr %arrayidx176.2, align 1, !dbg !1401
  %conv177.2 = zext i8 %117 to i64, !dbg !1401
  %mul178.2 = mul i64 %and157, %conv177.2, !dbg !1402
  %xor179.2 = xor i64 %xor173.2, %mul178.2, !dbg !1403
  %arrayidx182.2 = getelementptr inbounds nuw i8, ptr %tab, i32 11, !dbg !1404
  %118 = load i8, ptr %arrayidx182.2, align 1, !dbg !1404
  %conv183.2 = zext i8 %118 to i64, !dbg !1404
  %mul184.2 = mul i64 %and160, %conv183.2, !dbg !1405
  %xor185.2 = xor i64 %xor179.2, %mul184.2, !dbg !1406
  %sub187.2 = add nsw i32 %r.0, -76, !dbg !1407
  %div1882.2 = lshr i32 %sub187.2, 4, !dbg !1408
  %mul189.2 = mul i32 %div1882.2, 80, !dbg !1409
  %add190.2 = add i32 %mul189.2, %c140.0, !dbg !1410
  %sub192.2 = add nuw nsw i32 %r.0, 4, !dbg !1411
  %rem193.2 = and i32 %sub192.2, 15, !dbg !1412
  %add194.2 = or disjoint i32 %add190.2, %rem193.2, !dbg !1413
  %arrayidx195.2 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add194.2, !dbg !1414
  %119 = load i64, ptr %arrayidx195.2, align 8, !dbg !1415
  %xor196.2 = xor i64 %119, %xor185.2, !dbg !1415
  store i64 %xor196.2, ptr %arrayidx195.2, align 8, !dbg !1415
    #dbg_value(i32 3, !1391, !DIExpression(), !1393)
  %arrayidx166.3 = getelementptr inbounds nuw i8, ptr %tab, i32 12, !dbg !1394
  %120 = load i8, ptr %arrayidx166.3, align 1, !dbg !1394
  %conv.3 = zext i8 %120 to i64, !dbg !1394
  %mul167.3 = mul i64 %and151, %conv.3, !dbg !1397
  %arrayidx170.3 = getelementptr inbounds nuw i8, ptr %tab, i32 13, !dbg !1398
  %121 = load i8, ptr %arrayidx170.3, align 1, !dbg !1398
  %conv171.3 = zext i8 %121 to i64, !dbg !1398
  %mul172.3 = mul i64 %and154, %conv171.3, !dbg !1399
  %xor173.3 = xor i64 %mul167.3, %mul172.3, !dbg !1400
  %arrayidx176.3 = getelementptr inbounds nuw i8, ptr %tab, i32 14, !dbg !1401
  %122 = load i8, ptr %arrayidx176.3, align 1, !dbg !1401
  %conv177.3 = zext i8 %122 to i64, !dbg !1401
  %mul178.3 = mul i64 %and157, %conv177.3, !dbg !1402
  %xor179.3 = xor i64 %xor173.3, %mul178.3, !dbg !1403
  %arrayidx182.3 = getelementptr inbounds nuw i8, ptr %tab, i32 15, !dbg !1404
  %123 = load i8, ptr %arrayidx182.3, align 1, !dbg !1404
  %conv183.3 = zext i8 %123 to i64, !dbg !1404
  %mul184.3 = mul i64 %and160, %conv183.3, !dbg !1405
  %xor185.3 = xor i64 %xor179.3, %mul184.3, !dbg !1406
  %sub187.3 = add nsw i32 %r.0, -75, !dbg !1407
  %div1882.3 = lshr i32 %sub187.3, 4, !dbg !1408
  %mul189.3 = mul i32 %div1882.3, 80, !dbg !1409
  %add190.3 = add i32 %mul189.3, %c140.0, !dbg !1410
  %sub192.3 = add nuw nsw i32 %r.0, 5, !dbg !1411
  %rem193.3 = and i32 %sub192.3, 15, !dbg !1412
  %add194.3 = or disjoint i32 %add190.3, %rem193.3, !dbg !1413
  %arrayidx195.3 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add194.3, !dbg !1414
  %124 = load i64, ptr %arrayidx195.3, align 8, !dbg !1415
  %xor196.3 = xor i64 %124, %xor185.3, !dbg !1415
  store i64 %xor196.3, ptr %arrayidx195.3, align 8, !dbg !1415
    #dbg_value(i32 4, !1391, !DIExpression(), !1393)
  %inc201 = add nuw nsw i32 %r.0, 1, !dbg !1416
    #dbg_value(i32 %inc201, !1365, !DIExpression(), !1366)
  br label %for.cond144, !dbg !1417, !llvm.loop !1418

for.inc203:                                       ; preds = %for.cond144
  %add204 = add nuw nsw i32 %c140.0, 16, !dbg !1420
    #dbg_value(i32 %add204, !1357, !DIExpression(), !1358)
  br label %for.cond141, !dbg !1421, !llvm.loop !1422

for.cond207:                                      ; preds = %for.cond141, %for.inc241
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc241 ], [ 78, %for.cond141 ], !dbg !1424
  %r206.0 = phi i32 [ %add242, %for.inc241 ], [ 0, %for.cond141 ], !dbg !1424
    #dbg_value(i32 %r206.0, !1426, !DIExpression(), !1427)
  %cmp208 = icmp samesign ult i32 %r206.0, 78, !dbg !1428
  br i1 %cmp208, label %for.cond217, label %for.end243, !dbg !1430

for.cond217:                                      ; preds = %for.cond207, %for.body221
  %i216.0 = phi i32 [ %inc236, %for.body221 ], [ 0, %for.cond207 ], !dbg !1431
    #dbg_value(i32 %i216.0, !1437, !DIExpression(), !1438)
  %exitcond12.not = icmp eq i32 %i216.0, %indvars.iv, !dbg !1439
  br i1 %exitcond12.not, label %for.cond217.1, label %for.body221, !dbg !1441

for.body221:                                      ; preds = %for.cond217
  %div223 = mul nuw nsw i32 %r206.0, 5, !dbg !1442
  %add225 = add nuw nsw i32 %div223, %i216.0, !dbg !1444
  %arrayidx226 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add225, !dbg !1445
  %add227 = add nuw nsw i32 %r206.0, %i216.0, !dbg !1446
  %mul228 = mul nuw nsw i32 %add227, 81, !dbg !1447
  %add.ptr229 = getelementptr inbounds nuw i8, ptr %A_out, i32 %mul228, !dbg !1448
  call fastcc void @decode(ptr noundef nonnull %arrayidx226, ptr noundef %add.ptr229, i32 noundef 16) #6, !dbg !1449
  %inc236 = add nuw nsw i32 %i216.0, 1, !dbg !1450
    #dbg_value(i32 %inc236, !1437, !DIExpression(), !1438)
  br label %for.cond217, !dbg !1451, !llvm.loop !1452

for.cond217.1:                                    ; preds = %for.cond217, %for.body221.1
  %i216.0.1 = phi i32 [ %inc236.1, %for.body221.1 ], [ 0, %for.cond217 ], !dbg !1431
    #dbg_value(i32 %i216.0.1, !1437, !DIExpression(), !1438)
  %exitcond12.1.not = icmp eq i32 %i216.0.1, %indvars.iv, !dbg !1439
  br i1 %exitcond12.1.not, label %for.cond217.2, label %for.body221.1, !dbg !1441

for.body221.1:                                    ; preds = %for.cond217.1
  %div223.1 = mul nuw nsw i32 %r206.0, 5, !dbg !1442
  %add224.1 = add nuw nsw i32 %div223.1, 16, !dbg !1454
  %add225.1 = add nuw nsw i32 %add224.1, %i216.0.1, !dbg !1444
  %arrayidx226.1 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add225.1, !dbg !1445
  %add227.1 = add nuw nsw i32 %r206.0, %i216.0.1, !dbg !1446
  %mul228.1 = mul nuw nsw i32 %add227.1, 81, !dbg !1447
  %add.ptr229.1 = getelementptr inbounds nuw i8, ptr %A_out, i32 %mul228.1, !dbg !1448
  %add.ptr230.1 = getelementptr inbounds nuw i8, ptr %add.ptr229.1, i32 16, !dbg !1455
  call fastcc void @decode(ptr noundef nonnull %arrayidx226.1, ptr noundef nonnull %add.ptr230.1, i32 noundef 16) #6, !dbg !1449
  %inc236.1 = add nuw nsw i32 %i216.0.1, 1, !dbg !1450
    #dbg_value(i32 %inc236.1, !1437, !DIExpression(), !1438)
  br label %for.cond217.1, !dbg !1451, !llvm.loop !1452

for.cond217.2:                                    ; preds = %for.cond217.1, %for.body221.2
  %i216.0.2 = phi i32 [ %inc236.2, %for.body221.2 ], [ 0, %for.cond217.1 ], !dbg !1431
    #dbg_value(i32 %i216.0.2, !1437, !DIExpression(), !1438)
  %exitcond12.2.not = icmp eq i32 %i216.0.2, %indvars.iv, !dbg !1439
  br i1 %exitcond12.2.not, label %for.cond217.3, label %for.body221.2, !dbg !1441

for.body221.2:                                    ; preds = %for.cond217.2
  %div223.2 = mul nuw nsw i32 %r206.0, 5, !dbg !1442
  %add224.2 = add nuw nsw i32 %div223.2, 32, !dbg !1454
  %add225.2 = add nuw nsw i32 %add224.2, %i216.0.2, !dbg !1444
  %arrayidx226.2 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add225.2, !dbg !1445
  %add227.2 = add nuw nsw i32 %r206.0, %i216.0.2, !dbg !1446
  %mul228.2 = mul nuw nsw i32 %add227.2, 81, !dbg !1447
  %add.ptr229.2 = getelementptr inbounds nuw i8, ptr %A_out, i32 %mul228.2, !dbg !1448
  %add.ptr230.2 = getelementptr inbounds nuw i8, ptr %add.ptr229.2, i32 32, !dbg !1455
  call fastcc void @decode(ptr noundef nonnull %arrayidx226.2, ptr noundef nonnull %add.ptr230.2, i32 noundef 16) #6, !dbg !1449
  %inc236.2 = add nuw nsw i32 %i216.0.2, 1, !dbg !1450
    #dbg_value(i32 %inc236.2, !1437, !DIExpression(), !1438)
  br label %for.cond217.2, !dbg !1451, !llvm.loop !1452

for.cond217.3:                                    ; preds = %for.cond217.2, %for.body221.3
  %i216.0.3 = phi i32 [ %inc236.3, %for.body221.3 ], [ 0, %for.cond217.2 ], !dbg !1431
    #dbg_value(i32 %i216.0.3, !1437, !DIExpression(), !1438)
  %exitcond12.3.not = icmp eq i32 %i216.0.3, %indvars.iv, !dbg !1439
  br i1 %exitcond12.3.not, label %for.cond217.4, label %for.body221.3, !dbg !1441

for.body221.3:                                    ; preds = %for.cond217.3
  %div223.3 = mul nuw nsw i32 %r206.0, 5, !dbg !1442
  %add224.3 = add nuw nsw i32 %div223.3, 48, !dbg !1454
  %add225.3 = add nuw nsw i32 %add224.3, %i216.0.3, !dbg !1444
  %arrayidx226.3 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add225.3, !dbg !1445
  %add227.3 = add nuw nsw i32 %r206.0, %i216.0.3, !dbg !1446
  %mul228.3 = mul nuw nsw i32 %add227.3, 81, !dbg !1447
  %add.ptr229.3 = getelementptr inbounds nuw i8, ptr %A_out, i32 %mul228.3, !dbg !1448
  %add.ptr230.3 = getelementptr inbounds nuw i8, ptr %add.ptr229.3, i32 48, !dbg !1455
  call fastcc void @decode(ptr noundef nonnull %arrayidx226.3, ptr noundef nonnull %add.ptr230.3, i32 noundef 16) #6, !dbg !1449
  %inc236.3 = add nuw nsw i32 %i216.0.3, 1, !dbg !1450
    #dbg_value(i32 %inc236.3, !1437, !DIExpression(), !1438)
  br label %for.cond217.3, !dbg !1451, !llvm.loop !1452

for.cond217.4:                                    ; preds = %for.cond217.3, %for.body221.4
  %i216.0.4 = phi i32 [ %inc236.4, %for.body221.4 ], [ 0, %for.cond217.3 ], !dbg !1431
    #dbg_value(i32 %i216.0.4, !1437, !DIExpression(), !1438)
  %exitcond12.4.not = icmp eq i32 %i216.0.4, %indvars.iv, !dbg !1439
  br i1 %exitcond12.4.not, label %for.inc241, label %for.body221.4, !dbg !1441

for.body221.4:                                    ; preds = %for.cond217.4
  %div223.4 = mul nuw nsw i32 %r206.0, 5, !dbg !1442
  %add224.4 = add nuw nsw i32 %div223.4, 64, !dbg !1454
  %add225.4 = add nuw nsw i32 %add224.4, %i216.0.4, !dbg !1444
  %arrayidx226.4 = getelementptr inbounds nuw [800 x i64], ptr %A, i32 0, i32 %add225.4, !dbg !1445
  %add227.4 = add nuw nsw i32 %r206.0, %i216.0.4, !dbg !1446
  %mul228.4 = mul nuw nsw i32 %add227.4, 81, !dbg !1447
  %add.ptr229.4 = getelementptr inbounds nuw i8, ptr %A_out, i32 %mul228.4, !dbg !1448
  %add.ptr230.4 = getelementptr inbounds nuw i8, ptr %add.ptr229.4, i32 64, !dbg !1455
  call fastcc void @decode(ptr noundef nonnull %arrayidx226.4, ptr noundef nonnull %add.ptr230.4, i32 noundef 16) #6, !dbg !1449
  %inc236.4 = add nuw nsw i32 %i216.0.4, 1, !dbg !1450
    #dbg_value(i32 %inc236.4, !1437, !DIExpression(), !1438)
  br label %for.cond217.4, !dbg !1451, !llvm.loop !1452

for.inc241:                                       ; preds = %for.cond217.4
    #dbg_value(i32 80, !1456, !DIExpression(), !1457)
  %add242 = add nuw nsw i32 %r206.0, 16, !dbg !1458
    #dbg_value(i32 %add242, !1426, !DIExpression(), !1427)
  %indvars.iv.next = add nsw i32 %indvars.iv, -16, !dbg !1459
  br label %for.cond207, !dbg !1459, !llvm.loop !1460

for.end243:                                       ; preds = %for.cond207
  ret void, !dbg !1462
}

declare dso_local ptr @memset(ptr noundef, i32 noundef, i32 noundef) local_unnamed_addr #4

; Function Attrs: nounwind
define internal fastcc void @mat_mul(ptr noundef %a, ptr noundef %b, ptr noundef %c, i32 noundef %colrow_ab, i32 noundef %row_a, i32 noundef %col_b) unnamed_addr #0 !dbg !1463 {
entry:
    #dbg_value(ptr %a, !1466, !DIExpression(), !1467)
    #dbg_value(ptr %b, !1468, !DIExpression(), !1467)
    #dbg_value(ptr %c, !1469, !DIExpression(), !1467)
    #dbg_value(i32 %colrow_ab, !1470, !DIExpression(), !1467)
    #dbg_value(i32 %row_a, !1471, !DIExpression(), !1467)
    #dbg_value(i32 %col_b, !1472, !DIExpression(), !1467)
    #dbg_value(i32 0, !1473, !DIExpression(), !1475)
  %smax = call i32 @llvm.smax.i32(i32 %col_b, i32 0), !dbg !1476
  %smax1 = call i32 @llvm.smax.i32(i32 %row_a, i32 0), !dbg !1476
  br label %for.cond, !dbg !1476

for.cond:                                         ; preds = %for.inc4, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc5, %for.inc4 ], !dbg !1477
  %c.addr.0 = phi ptr [ %c, %entry ], [ %c.addr.1, %for.inc4 ]
  %a.addr.0 = phi ptr [ %a, %entry ], [ %add.ptr6, %for.inc4 ]
    #dbg_value(ptr %a.addr.0, !1466, !DIExpression(), !1467)
    #dbg_value(ptr %c.addr.0, !1469, !DIExpression(), !1467)
    #dbg_value(i32 %i.0, !1473, !DIExpression(), !1475)
  %exitcond2.not = icmp eq i32 %i.0, %smax1, !dbg !1478
  br i1 %exitcond2.not, label %for.end7, label %for.cond1, !dbg !1480

for.cond1:                                        ; preds = %for.cond, %for.body3
  %c.addr.1 = phi ptr [ %incdec.ptr, %for.body3 ], [ %c.addr.0, %for.cond ]
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond ], !dbg !1481
    #dbg_value(i32 %j.0, !1484, !DIExpression(), !1485)
    #dbg_value(ptr %c.addr.1, !1469, !DIExpression(), !1467)
  %exitcond.not = icmp eq i32 %j.0, %smax, !dbg !1486
  br i1 %exitcond.not, label %for.inc4, label %for.body3, !dbg !1488

for.body3:                                        ; preds = %for.cond1
  %add.ptr = getelementptr inbounds nuw i8, ptr %b, i32 %j.0, !dbg !1489
  %call = call fastcc zeroext i8 @lincomb(ptr noundef %a.addr.0, ptr noundef %add.ptr, i32 noundef %colrow_ab, i32 noundef %col_b) #6, !dbg !1491
  store i8 %call, ptr %c.addr.1, align 1, !dbg !1492
  %inc = add nuw i32 %j.0, 1, !dbg !1493
    #dbg_value(i32 %inc, !1484, !DIExpression(), !1485)
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %c.addr.1, i32 1, !dbg !1494
    #dbg_value(ptr %incdec.ptr, !1469, !DIExpression(), !1467)
  br label %for.cond1, !dbg !1495, !llvm.loop !1496

for.inc4:                                         ; preds = %for.cond1
  %inc5 = add nuw i32 %i.0, 1, !dbg !1498
    #dbg_value(i32 %inc5, !1473, !DIExpression(), !1475)
  %add.ptr6 = getelementptr inbounds i8, ptr %a.addr.0, i32 %colrow_ab, !dbg !1499
    #dbg_value(ptr %add.ptr6, !1466, !DIExpression(), !1467)
  br label %for.cond, !dbg !1500, !llvm.loop !1501

for.end7:                                         ; preds = %for.cond
  %cmp8 = icmp eq i32 %row_a, %col_b, !dbg !1503
  %call9 = call zeroext i1 @assert(i1 noundef zeroext %cmp8) #8, !dbg !1504
  ret void, !dbg !1505
}

; Function Attrs: nounwind
define internal fastcc void @mat_add(ptr noundef %a, ptr noundef %b, ptr noundef %c, i32 noundef %m, i32 noundef %n) unnamed_addr #0 !dbg !1506 {
entry:
    #dbg_value(ptr %a, !1509, !DIExpression(), !1510)
    #dbg_value(ptr %b, !1511, !DIExpression(), !1510)
    #dbg_value(ptr %c, !1512, !DIExpression(), !1510)
    #dbg_value(i32 %m, !1513, !DIExpression(), !1510)
    #dbg_value(i32 %n, !1514, !DIExpression(), !1510)
    #dbg_value(i32 0, !1515, !DIExpression(), !1517)
  %smax = call i32 @llvm.smax.i32(i32 %n, i32 0), !dbg !1518
  %smax1 = call i32 @llvm.smax.i32(i32 %m, i32 0), !dbg !1518
  br label %for.cond, !dbg !1518

for.cond:                                         ; preds = %for.inc11, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc12, %for.inc11 ], !dbg !1519
    #dbg_value(i32 %i.0, !1515, !DIExpression(), !1517)
  %exitcond2.not = icmp eq i32 %i.0, %smax1, !dbg !1520
  br i1 %exitcond2.not, label %for.end13, label %for.cond1, !dbg !1522

for.cond1:                                        ; preds = %for.cond, %for.body3
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond ], !dbg !1523
    #dbg_value(i32 %j.0, !1526, !DIExpression(), !1527)
  %exitcond.not = icmp eq i32 %j.0, %smax, !dbg !1528
  br i1 %exitcond.not, label %for.inc11, label %for.body3, !dbg !1530

for.body3:                                        ; preds = %for.cond1
  %mul = mul nsw i32 %i.0, %n, !dbg !1531
  %add.ptr = getelementptr inbounds i8, ptr %a, i32 %mul, !dbg !1533
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %add.ptr, i32 %j.0, !dbg !1534
  %0 = load i8, ptr %add.ptr4, align 1, !dbg !1535
  %mul5 = mul nsw i32 %i.0, %n, !dbg !1536
  %add.ptr6 = getelementptr inbounds i8, ptr %b, i32 %mul5, !dbg !1537
  %add.ptr7 = getelementptr inbounds nuw i8, ptr %add.ptr6, i32 %j.0, !dbg !1538
  %1 = load i8, ptr %add.ptr7, align 1, !dbg !1539
  %call = call fastcc zeroext i8 @add_f(i8 noundef zeroext %0, i8 noundef zeroext %1) #6, !dbg !1540
  %mul8 = mul nsw i32 %i.0, %n, !dbg !1541
  %add.ptr9 = getelementptr inbounds i8, ptr %c, i32 %mul8, !dbg !1542
  %add.ptr10 = getelementptr inbounds nuw i8, ptr %add.ptr9, i32 %j.0, !dbg !1543
  store i8 %call, ptr %add.ptr10, align 1, !dbg !1544
  %inc = add nuw i32 %j.0, 1, !dbg !1545
    #dbg_value(i32 %inc, !1526, !DIExpression(), !1527)
  br label %for.cond1, !dbg !1546, !llvm.loop !1547

for.inc11:                                        ; preds = %for.cond1
  %inc12 = add nuw i32 %i.0, 1, !dbg !1549
    #dbg_value(i32 %inc12, !1515, !DIExpression(), !1517)
  br label %for.cond, !dbg !1550, !llvm.loop !1551

for.end13:                                        ; preds = %for.cond
  ret void, !dbg !1553
}

; Function Attrs: nounwind
define internal fastcc void @encode(ptr noundef %m, ptr noundef %menc, i32 noundef %mlen) unnamed_addr #0 !dbg !1554 {
entry:
    #dbg_value(ptr %m, !1555, !DIExpression(), !1556)
    #dbg_value(ptr %menc, !1557, !DIExpression(), !1556)
    #dbg_value(i32 %mlen, !1558, !DIExpression(), !1556)
    #dbg_value(i32 0, !1559, !DIExpression(), !1556)
  br label %for.cond, !dbg !1560

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1562
  %m.addr.0 = phi ptr [ %m, %entry ], [ %add.ptr3, %for.body ]
    #dbg_value(ptr %m.addr.0, !1555, !DIExpression(), !1556)
    #dbg_value(i32 %i.0, !1559, !DIExpression(), !1556)
  %div = sdiv i32 %mlen, 2, !dbg !1563
  %cmp = icmp slt i32 %i.0, %div, !dbg !1565
  br i1 %cmp, label %for.body, label %for.end, !dbg !1566

for.body:                                         ; preds = %for.cond
  %0 = load i8, ptr %m.addr.0, align 1, !dbg !1567
  %add.ptr = getelementptr inbounds nuw i8, ptr %m.addr.0, i32 1, !dbg !1569
  %1 = load i8, ptr %add.ptr, align 1, !dbg !1570
  %shl = shl i8 %1, 4, !dbg !1571
  %or = or i8 %shl, %0, !dbg !1572
  %arrayidx = getelementptr inbounds nuw i8, ptr %menc, i32 %i.0, !dbg !1573
  store i8 %or, ptr %arrayidx, align 1, !dbg !1574
  %inc = add nuw nsw i32 %i.0, 1, !dbg !1575
    #dbg_value(i32 %inc, !1559, !DIExpression(), !1556)
  %add.ptr3 = getelementptr inbounds nuw i8, ptr %m.addr.0, i32 2, !dbg !1576
    #dbg_value(ptr %add.ptr3, !1555, !DIExpression(), !1556)
  br label %for.cond, !dbg !1577, !llvm.loop !1578

for.end:                                          ; preds = %for.cond
  %2 = and i32 %mlen, -2147483647, !dbg !1580
  %cmp4 = icmp eq i32 %2, 1, !dbg !1580
  br i1 %cmp4, label %if.then, label %if.end, !dbg !1580

if.then:                                          ; preds = %for.end
  %3 = load i8, ptr %m.addr.0, align 1, !dbg !1582
  %arrayidx6 = getelementptr inbounds nuw i8, ptr %menc, i32 %i.0, !dbg !1584
  store i8 %3, ptr %arrayidx6, align 1, !dbg !1585
  br label %if.end, !dbg !1586

if.end:                                           ; preds = %if.then, %for.end
  ret void, !dbg !1587
}

; Function Attrs: nounwind
define internal fastcc zeroext i8 @add_f(i8 noundef zeroext %a, i8 noundef zeroext %b) unnamed_addr #0 !dbg !1588 {
entry:
    #dbg_value(i8 %a, !1591, !DIExpression(), !1592)
    #dbg_value(i8 %b, !1593, !DIExpression(), !1592)
  %xor1 = xor i8 %a, %b, !dbg !1594
  ret i8 %xor1, !dbg !1595
}

; Function Attrs: nounwind
define internal fastcc zeroext i8 @lincomb(ptr noundef %a, ptr noundef %b, i32 noundef %n, i32 noundef %m) unnamed_addr #0 !dbg !1596 {
entry:
    #dbg_value(ptr %a, !1599, !DIExpression(), !1600)
    #dbg_value(ptr %b, !1601, !DIExpression(), !1600)
    #dbg_value(i32 %n, !1602, !DIExpression(), !1600)
    #dbg_value(i32 %m, !1603, !DIExpression(), !1600)
    #dbg_value(i8 0, !1604, !DIExpression(), !1600)
    #dbg_value(i32 0, !1605, !DIExpression(), !1607)
  %smax = call i32 @llvm.smax.i32(i32 %n, i32 0), !dbg !1608
  br label %for.cond, !dbg !1608

for.cond:                                         ; preds = %for.body, %entry
  %ret.0 = phi i8 [ 0, %entry ], [ %call1, %for.body ], !dbg !1600
  %b.addr.0 = phi ptr [ %b, %entry ], [ %add.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !1609
    #dbg_value(i32 %i.0, !1605, !DIExpression(), !1607)
    #dbg_value(ptr %b.addr.0, !1601, !DIExpression(), !1600)
    #dbg_value(i8 %ret.0, !1604, !DIExpression(), !1600)
  %exitcond.not = icmp eq i32 %i.0, %smax, !dbg !1610
  br i1 %exitcond.not, label %for.end, label %for.body, !dbg !1612

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %i.0, !dbg !1613
  %0 = load i8, ptr %arrayidx, align 1, !dbg !1613
  %1 = load i8, ptr %b.addr.0, align 1, !dbg !1615
  %call = call fastcc zeroext i8 @mul_f(i8 noundef zeroext %0, i8 noundef zeroext %1) #6, !dbg !1616
  %call1 = call fastcc zeroext i8 @add_f(i8 noundef zeroext %call, i8 noundef zeroext %ret.0) #6, !dbg !1617
    #dbg_value(i8 %call1, !1604, !DIExpression(), !1600)
  %inc = add nuw i32 %i.0, 1, !dbg !1618
    #dbg_value(i32 %inc, !1605, !DIExpression(), !1607)
  %add.ptr = getelementptr inbounds i8, ptr %b.addr.0, i32 %m, !dbg !1619
    #dbg_value(ptr %add.ptr, !1601, !DIExpression(), !1600)
  br label %for.cond, !dbg !1620, !llvm.loop !1621

for.end:                                          ; preds = %for.cond
  ret i8 %ret.0, !dbg !1623
}

declare dso_local zeroext i1 @assert(i1 noundef zeroext) local_unnamed_addr #4

; Function Attrs: nounwind
define internal fastcc zeroext range(i8 0, 16) i8 @mul_f(i8 noundef zeroext %a, i8 noundef zeroext %b) unnamed_addr #0 !dbg !1624 {
entry:
    #dbg_value(i8 %a, !1625, !DIExpression(), !1626)
    #dbg_value(i8 %b, !1627, !DIExpression(), !1626)
  %0 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !1628
  %xor1 = xor i8 %a, %0, !dbg !1629
    #dbg_value(i8 %xor1, !1625, !DIExpression(), !1626)
  %1 = trunc i8 %xor1 to i1, !dbg !1630
    #dbg_value(i8 poison, !1631, !DIExpression(), !1626)
  %2 = and i8 %xor1, 2, !dbg !1632
  %mul9 = mul i8 %2, %b, !dbg !1633
  %conv10 = select i1 %1, i8 %b, i8 0, !dbg !1630
  %xor11 = xor i8 %conv10, %mul9, !dbg !1634
    #dbg_value(i8 %xor11, !1631, !DIExpression(), !1626)
  %3 = and i8 %xor1, 4, !dbg !1635
  %mul16 = mul i8 %3, %b, !dbg !1636
  %xor18 = xor i8 %mul16, %xor11, !dbg !1637
    #dbg_value(i8 %xor18, !1631, !DIExpression(), !1626)
  %4 = and i8 %xor1, 8, !dbg !1638
  %mul23 = mul i8 %4, %b, !dbg !1639
  %xor25 = xor i8 %mul23, %xor18, !dbg !1640
    #dbg_value(i8 %xor25, !1631, !DIExpression(), !1626)
    #dbg_value(i8 %xor25, !1641, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !1626)
  %5 = lshr i8 %xor25, 4, !dbg !1642
  %6 = lshr i8 %xor25, 3, !dbg !1643
  %7 = and i8 %6, 14, !dbg !1643
  %8 = xor i8 %5, %7, !dbg !1644
  %xor25.masked = and i8 %xor25, 15, !dbg !1645
  %9 = xor i8 %8, %xor25.masked, !dbg !1645
    #dbg_value(i8 %9, !1646, !DIExpression(), !1626)
  ret i8 %9, !dbg !1647
}

; Function Attrs: nounwind
define internal fastcc void @transpose_16x16_nibbles(ptr noundef %M) unnamed_addr #0 !dbg !67 {
entry:
    #dbg_value(ptr %M, !1648, !DIExpression(), !1649)
    #dbg_value(i32 0, !1650, !DIExpression(), !1652)
    #dbg_value(i32 0, !1650, !DIExpression(), !1652)
  %0 = load i64, ptr %M, align 8, !dbg !1653
  %shr = lshr i64 %0, 4, !dbg !1656
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %M, i32 8, !dbg !1657
  %1 = load i64, ptr %arrayidx1, align 8, !dbg !1657
  %xor = xor i64 %shr, %1, !dbg !1658
  %and = and i64 %xor, 1085102592571150095, !dbg !1659
    #dbg_value(i64 %and, !1660, !DIExpression(), !1661)
  %shl = shl nuw i64 %and, 4, !dbg !1662
  %2 = load i64, ptr %M, align 8, !dbg !1663
  %xor3 = xor i64 %2, %shl, !dbg !1663
  store i64 %xor3, ptr %M, align 8, !dbg !1663
  %arrayidx5 = getelementptr inbounds nuw i8, ptr %M, i32 8, !dbg !1664
  %3 = load i64, ptr %arrayidx5, align 8, !dbg !1665
  %xor6 = xor i64 %3, %and, !dbg !1665
  store i64 %xor6, ptr %arrayidx5, align 8, !dbg !1665
    #dbg_value(i32 2, !1650, !DIExpression(), !1652)
  %arrayidx.1 = getelementptr inbounds nuw i8, ptr %M, i32 16, !dbg !1653
  %4 = load i64, ptr %arrayidx.1, align 8, !dbg !1653
  %shr.1 = lshr i64 %4, 4, !dbg !1656
  %arrayidx1.1 = getelementptr inbounds nuw i8, ptr %M, i32 24, !dbg !1657
  %5 = load i64, ptr %arrayidx1.1, align 8, !dbg !1657
  %xor.1 = xor i64 %shr.1, %5, !dbg !1658
  %and.1 = and i64 %xor.1, 1085102592571150095, !dbg !1659
    #dbg_value(i64 %and.1, !1660, !DIExpression(), !1661)
  %shl.1 = shl nuw i64 %and.1, 4, !dbg !1662
  %arrayidx2.1 = getelementptr inbounds nuw i8, ptr %M, i32 16, !dbg !1666
  %6 = load i64, ptr %arrayidx2.1, align 8, !dbg !1663
  %xor3.1 = xor i64 %6, %shl.1, !dbg !1663
  store i64 %xor3.1, ptr %arrayidx2.1, align 8, !dbg !1663
  %arrayidx5.1 = getelementptr inbounds nuw i8, ptr %M, i32 24, !dbg !1664
  %7 = load i64, ptr %arrayidx5.1, align 8, !dbg !1665
  %xor6.1 = xor i64 %7, %and.1, !dbg !1665
  store i64 %xor6.1, ptr %arrayidx5.1, align 8, !dbg !1665
    #dbg_value(i32 4, !1650, !DIExpression(), !1652)
  %arrayidx.2 = getelementptr inbounds nuw i8, ptr %M, i32 32, !dbg !1653
  %8 = load i64, ptr %arrayidx.2, align 8, !dbg !1653
  %shr.2 = lshr i64 %8, 4, !dbg !1656
  %arrayidx1.2 = getelementptr inbounds nuw i8, ptr %M, i32 40, !dbg !1657
  %9 = load i64, ptr %arrayidx1.2, align 8, !dbg !1657
  %xor.2 = xor i64 %shr.2, %9, !dbg !1658
  %and.2 = and i64 %xor.2, 1085102592571150095, !dbg !1659
    #dbg_value(i64 %and.2, !1660, !DIExpression(), !1661)
  %shl.2 = shl nuw i64 %and.2, 4, !dbg !1662
  %arrayidx2.2 = getelementptr inbounds nuw i8, ptr %M, i32 32, !dbg !1666
  %10 = load i64, ptr %arrayidx2.2, align 8, !dbg !1663
  %xor3.2 = xor i64 %10, %shl.2, !dbg !1663
  store i64 %xor3.2, ptr %arrayidx2.2, align 8, !dbg !1663
  %arrayidx5.2 = getelementptr inbounds nuw i8, ptr %M, i32 40, !dbg !1664
  %11 = load i64, ptr %arrayidx5.2, align 8, !dbg !1665
  %xor6.2 = xor i64 %11, %and.2, !dbg !1665
  store i64 %xor6.2, ptr %arrayidx5.2, align 8, !dbg !1665
    #dbg_value(i32 6, !1650, !DIExpression(), !1652)
  %arrayidx.3 = getelementptr inbounds nuw i8, ptr %M, i32 48, !dbg !1653
  %12 = load i64, ptr %arrayidx.3, align 8, !dbg !1653
  %shr.3 = lshr i64 %12, 4, !dbg !1656
  %arrayidx1.3 = getelementptr inbounds nuw i8, ptr %M, i32 56, !dbg !1657
  %13 = load i64, ptr %arrayidx1.3, align 8, !dbg !1657
  %xor.3 = xor i64 %shr.3, %13, !dbg !1658
  %and.3 = and i64 %xor.3, 1085102592571150095, !dbg !1659
    #dbg_value(i64 %and.3, !1660, !DIExpression(), !1661)
  %shl.3 = shl nuw i64 %and.3, 4, !dbg !1662
  %arrayidx2.3 = getelementptr inbounds nuw i8, ptr %M, i32 48, !dbg !1666
  %14 = load i64, ptr %arrayidx2.3, align 8, !dbg !1663
  %xor3.3 = xor i64 %14, %shl.3, !dbg !1663
  store i64 %xor3.3, ptr %arrayidx2.3, align 8, !dbg !1663
  %arrayidx5.3 = getelementptr inbounds nuw i8, ptr %M, i32 56, !dbg !1664
  %15 = load i64, ptr %arrayidx5.3, align 8, !dbg !1665
  %xor6.3 = xor i64 %15, %and.3, !dbg !1665
  store i64 %xor6.3, ptr %arrayidx5.3, align 8, !dbg !1665
    #dbg_value(i32 8, !1650, !DIExpression(), !1652)
  %arrayidx.4 = getelementptr inbounds nuw i8, ptr %M, i32 64, !dbg !1653
  %16 = load i64, ptr %arrayidx.4, align 8, !dbg !1653
  %shr.4 = lshr i64 %16, 4, !dbg !1656
  %arrayidx1.4 = getelementptr inbounds nuw i8, ptr %M, i32 72, !dbg !1657
  %17 = load i64, ptr %arrayidx1.4, align 8, !dbg !1657
  %xor.4 = xor i64 %shr.4, %17, !dbg !1658
  %and.4 = and i64 %xor.4, 1085102592571150095, !dbg !1659
    #dbg_value(i64 %and.4, !1660, !DIExpression(), !1661)
  %shl.4 = shl nuw i64 %and.4, 4, !dbg !1662
  %arrayidx2.4 = getelementptr inbounds nuw i8, ptr %M, i32 64, !dbg !1666
  %18 = load i64, ptr %arrayidx2.4, align 8, !dbg !1663
  %xor3.4 = xor i64 %18, %shl.4, !dbg !1663
  store i64 %xor3.4, ptr %arrayidx2.4, align 8, !dbg !1663
  %arrayidx5.4 = getelementptr inbounds nuw i8, ptr %M, i32 72, !dbg !1664
  %19 = load i64, ptr %arrayidx5.4, align 8, !dbg !1665
  %xor6.4 = xor i64 %19, %and.4, !dbg !1665
  store i64 %xor6.4, ptr %arrayidx5.4, align 8, !dbg !1665
    #dbg_value(i32 10, !1650, !DIExpression(), !1652)
  %arrayidx.5 = getelementptr inbounds nuw i8, ptr %M, i32 80, !dbg !1653
  %20 = load i64, ptr %arrayidx.5, align 8, !dbg !1653
  %shr.5 = lshr i64 %20, 4, !dbg !1656
  %arrayidx1.5 = getelementptr inbounds nuw i8, ptr %M, i32 88, !dbg !1657
  %21 = load i64, ptr %arrayidx1.5, align 8, !dbg !1657
  %xor.5 = xor i64 %shr.5, %21, !dbg !1658
  %and.5 = and i64 %xor.5, 1085102592571150095, !dbg !1659
    #dbg_value(i64 %and.5, !1660, !DIExpression(), !1661)
  %shl.5 = shl nuw i64 %and.5, 4, !dbg !1662
  %arrayidx2.5 = getelementptr inbounds nuw i8, ptr %M, i32 80, !dbg !1666
  %22 = load i64, ptr %arrayidx2.5, align 8, !dbg !1663
  %xor3.5 = xor i64 %22, %shl.5, !dbg !1663
  store i64 %xor3.5, ptr %arrayidx2.5, align 8, !dbg !1663
  %arrayidx5.5 = getelementptr inbounds nuw i8, ptr %M, i32 88, !dbg !1664
  %23 = load i64, ptr %arrayidx5.5, align 8, !dbg !1665
  %xor6.5 = xor i64 %23, %and.5, !dbg !1665
  store i64 %xor6.5, ptr %arrayidx5.5, align 8, !dbg !1665
    #dbg_value(i32 12, !1650, !DIExpression(), !1652)
  %arrayidx.6 = getelementptr inbounds nuw i8, ptr %M, i32 96, !dbg !1653
  %24 = load i64, ptr %arrayidx.6, align 8, !dbg !1653
  %shr.6 = lshr i64 %24, 4, !dbg !1656
  %arrayidx1.6 = getelementptr inbounds nuw i8, ptr %M, i32 104, !dbg !1657
  %25 = load i64, ptr %arrayidx1.6, align 8, !dbg !1657
  %xor.6 = xor i64 %shr.6, %25, !dbg !1658
  %and.6 = and i64 %xor.6, 1085102592571150095, !dbg !1659
    #dbg_value(i64 %and.6, !1660, !DIExpression(), !1661)
  %shl.6 = shl nuw i64 %and.6, 4, !dbg !1662
  %arrayidx2.6 = getelementptr inbounds nuw i8, ptr %M, i32 96, !dbg !1666
  %26 = load i64, ptr %arrayidx2.6, align 8, !dbg !1663
  %xor3.6 = xor i64 %26, %shl.6, !dbg !1663
  store i64 %xor3.6, ptr %arrayidx2.6, align 8, !dbg !1663
  %arrayidx5.6 = getelementptr inbounds nuw i8, ptr %M, i32 104, !dbg !1664
  %27 = load i64, ptr %arrayidx5.6, align 8, !dbg !1665
  %xor6.6 = xor i64 %27, %and.6, !dbg !1665
  store i64 %xor6.6, ptr %arrayidx5.6, align 8, !dbg !1665
    #dbg_value(i32 14, !1650, !DIExpression(), !1652)
  %arrayidx.7 = getelementptr inbounds nuw i8, ptr %M, i32 112, !dbg !1653
  %28 = load i64, ptr %arrayidx.7, align 8, !dbg !1653
  %shr.7 = lshr i64 %28, 4, !dbg !1656
  %arrayidx1.7 = getelementptr inbounds nuw i8, ptr %M, i32 120, !dbg !1657
  %29 = load i64, ptr %arrayidx1.7, align 8, !dbg !1657
  %xor.7 = xor i64 %shr.7, %29, !dbg !1658
  %and.7 = and i64 %xor.7, 1085102592571150095, !dbg !1659
    #dbg_value(i64 %and.7, !1660, !DIExpression(), !1661)
  %shl.7 = shl nuw i64 %and.7, 4, !dbg !1662
  %arrayidx2.7 = getelementptr inbounds nuw i8, ptr %M, i32 112, !dbg !1666
  %30 = load i64, ptr %arrayidx2.7, align 8, !dbg !1663
  %xor3.7 = xor i64 %30, %shl.7, !dbg !1663
  store i64 %xor3.7, ptr %arrayidx2.7, align 8, !dbg !1663
  %arrayidx5.7 = getelementptr inbounds nuw i8, ptr %M, i32 120, !dbg !1664
  %31 = load i64, ptr %arrayidx5.7, align 8, !dbg !1665
  %xor6.7 = xor i64 %31, %and.7, !dbg !1665
  store i64 %xor6.7, ptr %arrayidx5.7, align 8, !dbg !1665
    #dbg_value(i32 16, !1650, !DIExpression(), !1652)
    #dbg_value(i32 0, !1667, !DIExpression(), !1669)
  %32 = load i64, ptr %M, align 8, !dbg !1670
  %shr13 = lshr i64 %32, 8, !dbg !1673
  %arrayidx15 = getelementptr inbounds nuw i8, ptr %M, i32 16, !dbg !1674
  %33 = load i64, ptr %arrayidx15, align 8, !dbg !1674
  %xor16 = xor i64 %shr13, %33, !dbg !1675
  %and17 = and i64 %xor16, 71777214294589695, !dbg !1676
    #dbg_value(i64 %and17, !1677, !DIExpression(), !1678)
  %arrayidx19 = getelementptr inbounds nuw i8, ptr %M, i32 8, !dbg !1679
  %34 = load i64, ptr %arrayidx19, align 8, !dbg !1679
  %shr20 = lshr i64 %34, 8, !dbg !1680
  %arrayidx22 = getelementptr inbounds nuw i8, ptr %M, i32 24, !dbg !1681
  %35 = load i64, ptr %arrayidx22, align 8, !dbg !1681
  %xor23 = xor i64 %shr20, %35, !dbg !1682
  %and24 = and i64 %xor23, 71777214294589695, !dbg !1683
    #dbg_value(i64 %and24, !1684, !DIExpression(), !1678)
  %shl25 = shl nuw i64 %and17, 8, !dbg !1685
  %36 = load i64, ptr %M, align 8, !dbg !1686
  %xor27 = xor i64 %36, %shl25, !dbg !1686
  store i64 %xor27, ptr %M, align 8, !dbg !1686
  %shl28 = shl nuw i64 %and24, 8, !dbg !1687
  %arrayidx30 = getelementptr inbounds nuw i8, ptr %M, i32 8, !dbg !1688
  %37 = load i64, ptr %arrayidx30, align 8, !dbg !1689
  %xor31 = xor i64 %37, %shl28, !dbg !1689
  store i64 %xor31, ptr %arrayidx30, align 8, !dbg !1689
  %arrayidx33 = getelementptr inbounds nuw i8, ptr %M, i32 16, !dbg !1690
  %38 = load i64, ptr %arrayidx33, align 8, !dbg !1691
  %xor34 = xor i64 %38, %and17, !dbg !1691
  store i64 %xor34, ptr %arrayidx33, align 8, !dbg !1691
  %arrayidx36 = getelementptr inbounds nuw i8, ptr %M, i32 24, !dbg !1692
  %39 = load i64, ptr %arrayidx36, align 8, !dbg !1693
  %xor37 = xor i64 %39, %and24, !dbg !1693
  store i64 %xor37, ptr %arrayidx36, align 8, !dbg !1693
    #dbg_value(i32 4, !1667, !DIExpression(), !1669)
  %arrayidx12.1 = getelementptr inbounds nuw i8, ptr %M, i32 32, !dbg !1670
  %40 = load i64, ptr %arrayidx12.1, align 8, !dbg !1670
  %shr13.1 = lshr i64 %40, 8, !dbg !1673
  %arrayidx15.1 = getelementptr inbounds nuw i8, ptr %M, i32 48, !dbg !1674
  %41 = load i64, ptr %arrayidx15.1, align 8, !dbg !1674
  %xor16.1 = xor i64 %shr13.1, %41, !dbg !1675
  %and17.1 = and i64 %xor16.1, 71777214294589695, !dbg !1676
    #dbg_value(i64 %and17.1, !1677, !DIExpression(), !1678)
  %arrayidx19.1 = getelementptr inbounds nuw i8, ptr %M, i32 40, !dbg !1679
  %42 = load i64, ptr %arrayidx19.1, align 8, !dbg !1679
  %shr20.1 = lshr i64 %42, 8, !dbg !1680
  %arrayidx22.1 = getelementptr inbounds nuw i8, ptr %M, i32 56, !dbg !1681
  %43 = load i64, ptr %arrayidx22.1, align 8, !dbg !1681
  %xor23.1 = xor i64 %shr20.1, %43, !dbg !1682
  %and24.1 = and i64 %xor23.1, 71777214294589695, !dbg !1683
    #dbg_value(i64 %and24.1, !1684, !DIExpression(), !1678)
  %shl25.1 = shl nuw i64 %and17.1, 8, !dbg !1685
  %arrayidx26.1 = getelementptr inbounds nuw i8, ptr %M, i32 32, !dbg !1694
  %44 = load i64, ptr %arrayidx26.1, align 8, !dbg !1686
  %xor27.1 = xor i64 %44, %shl25.1, !dbg !1686
  store i64 %xor27.1, ptr %arrayidx26.1, align 8, !dbg !1686
  %shl28.1 = shl nuw i64 %and24.1, 8, !dbg !1687
  %arrayidx30.1 = getelementptr inbounds nuw i8, ptr %M, i32 40, !dbg !1688
  %45 = load i64, ptr %arrayidx30.1, align 8, !dbg !1689
  %xor31.1 = xor i64 %45, %shl28.1, !dbg !1689
  store i64 %xor31.1, ptr %arrayidx30.1, align 8, !dbg !1689
  %arrayidx33.1 = getelementptr inbounds nuw i8, ptr %M, i32 48, !dbg !1690
  %46 = load i64, ptr %arrayidx33.1, align 8, !dbg !1691
  %xor34.1 = xor i64 %46, %and17.1, !dbg !1691
  store i64 %xor34.1, ptr %arrayidx33.1, align 8, !dbg !1691
  %arrayidx36.1 = getelementptr inbounds nuw i8, ptr %M, i32 56, !dbg !1692
  %47 = load i64, ptr %arrayidx36.1, align 8, !dbg !1693
  %xor37.1 = xor i64 %47, %and24.1, !dbg !1693
  store i64 %xor37.1, ptr %arrayidx36.1, align 8, !dbg !1693
    #dbg_value(i32 8, !1667, !DIExpression(), !1669)
  %arrayidx12.2 = getelementptr inbounds nuw i8, ptr %M, i32 64, !dbg !1670
  %48 = load i64, ptr %arrayidx12.2, align 8, !dbg !1670
  %shr13.2 = lshr i64 %48, 8, !dbg !1673
  %arrayidx15.2 = getelementptr inbounds nuw i8, ptr %M, i32 80, !dbg !1674
  %49 = load i64, ptr %arrayidx15.2, align 8, !dbg !1674
  %xor16.2 = xor i64 %shr13.2, %49, !dbg !1675
  %and17.2 = and i64 %xor16.2, 71777214294589695, !dbg !1676
    #dbg_value(i64 %and17.2, !1677, !DIExpression(), !1678)
  %arrayidx19.2 = getelementptr inbounds nuw i8, ptr %M, i32 72, !dbg !1679
  %50 = load i64, ptr %arrayidx19.2, align 8, !dbg !1679
  %shr20.2 = lshr i64 %50, 8, !dbg !1680
  %arrayidx22.2 = getelementptr inbounds nuw i8, ptr %M, i32 88, !dbg !1681
  %51 = load i64, ptr %arrayidx22.2, align 8, !dbg !1681
  %xor23.2 = xor i64 %shr20.2, %51, !dbg !1682
  %and24.2 = and i64 %xor23.2, 71777214294589695, !dbg !1683
    #dbg_value(i64 %and24.2, !1684, !DIExpression(), !1678)
  %shl25.2 = shl nuw i64 %and17.2, 8, !dbg !1685
  %arrayidx26.2 = getelementptr inbounds nuw i8, ptr %M, i32 64, !dbg !1694
  %52 = load i64, ptr %arrayidx26.2, align 8, !dbg !1686
  %xor27.2 = xor i64 %52, %shl25.2, !dbg !1686
  store i64 %xor27.2, ptr %arrayidx26.2, align 8, !dbg !1686
  %shl28.2 = shl nuw i64 %and24.2, 8, !dbg !1687
  %arrayidx30.2 = getelementptr inbounds nuw i8, ptr %M, i32 72, !dbg !1688
  %53 = load i64, ptr %arrayidx30.2, align 8, !dbg !1689
  %xor31.2 = xor i64 %53, %shl28.2, !dbg !1689
  store i64 %xor31.2, ptr %arrayidx30.2, align 8, !dbg !1689
  %arrayidx33.2 = getelementptr inbounds nuw i8, ptr %M, i32 80, !dbg !1690
  %54 = load i64, ptr %arrayidx33.2, align 8, !dbg !1691
  %xor34.2 = xor i64 %54, %and17.2, !dbg !1691
  store i64 %xor34.2, ptr %arrayidx33.2, align 8, !dbg !1691
  %arrayidx36.2 = getelementptr inbounds nuw i8, ptr %M, i32 88, !dbg !1692
  %55 = load i64, ptr %arrayidx36.2, align 8, !dbg !1693
  %xor37.2 = xor i64 %55, %and24.2, !dbg !1693
  store i64 %xor37.2, ptr %arrayidx36.2, align 8, !dbg !1693
    #dbg_value(i32 12, !1667, !DIExpression(), !1669)
  %arrayidx12.3 = getelementptr inbounds nuw i8, ptr %M, i32 96, !dbg !1670
  %56 = load i64, ptr %arrayidx12.3, align 8, !dbg !1670
  %shr13.3 = lshr i64 %56, 8, !dbg !1673
  %arrayidx15.3 = getelementptr inbounds nuw i8, ptr %M, i32 112, !dbg !1674
  %57 = load i64, ptr %arrayidx15.3, align 8, !dbg !1674
  %xor16.3 = xor i64 %shr13.3, %57, !dbg !1675
  %and17.3 = and i64 %xor16.3, 71777214294589695, !dbg !1676
    #dbg_value(i64 %and17.3, !1677, !DIExpression(), !1678)
  %arrayidx19.3 = getelementptr inbounds nuw i8, ptr %M, i32 104, !dbg !1679
  %58 = load i64, ptr %arrayidx19.3, align 8, !dbg !1679
  %shr20.3 = lshr i64 %58, 8, !dbg !1680
  %arrayidx22.3 = getelementptr inbounds nuw i8, ptr %M, i32 120, !dbg !1681
  %59 = load i64, ptr %arrayidx22.3, align 8, !dbg !1681
  %xor23.3 = xor i64 %shr20.3, %59, !dbg !1682
  %and24.3 = and i64 %xor23.3, 71777214294589695, !dbg !1683
    #dbg_value(i64 %and24.3, !1684, !DIExpression(), !1678)
  %shl25.3 = shl nuw i64 %and17.3, 8, !dbg !1685
  %arrayidx26.3 = getelementptr inbounds nuw i8, ptr %M, i32 96, !dbg !1694
  %60 = load i64, ptr %arrayidx26.3, align 8, !dbg !1686
  %xor27.3 = xor i64 %60, %shl25.3, !dbg !1686
  store i64 %xor27.3, ptr %arrayidx26.3, align 8, !dbg !1686
  %shl28.3 = shl nuw i64 %and24.3, 8, !dbg !1687
  %arrayidx30.3 = getelementptr inbounds nuw i8, ptr %M, i32 104, !dbg !1688
  %61 = load i64, ptr %arrayidx30.3, align 8, !dbg !1689
  %xor31.3 = xor i64 %61, %shl28.3, !dbg !1689
  store i64 %xor31.3, ptr %arrayidx30.3, align 8, !dbg !1689
  %arrayidx33.3 = getelementptr inbounds nuw i8, ptr %M, i32 112, !dbg !1690
  %62 = load i64, ptr %arrayidx33.3, align 8, !dbg !1691
  %xor34.3 = xor i64 %62, %and17.3, !dbg !1691
  store i64 %xor34.3, ptr %arrayidx33.3, align 8, !dbg !1691
  %arrayidx36.3 = getelementptr inbounds nuw i8, ptr %M, i32 120, !dbg !1692
  %63 = load i64, ptr %arrayidx36.3, align 8, !dbg !1693
  %xor37.3 = xor i64 %63, %and24.3, !dbg !1693
  store i64 %xor37.3, ptr %arrayidx36.3, align 8, !dbg !1693
    #dbg_value(i32 16, !1667, !DIExpression(), !1669)
    #dbg_value(i32 0, !1695, !DIExpression(), !1697)
  %64 = load i64, ptr %M, align 8, !dbg !1698
  %shr47 = lshr i64 %64, 16, !dbg !1701
  %arrayidx49 = getelementptr inbounds nuw i8, ptr %M, i32 32, !dbg !1702
  %65 = load i64, ptr %arrayidx49, align 8, !dbg !1702
  %xor50 = xor i64 %shr47, %65, !dbg !1703
  %and51 = and i64 %xor50, 281470681808895, !dbg !1704
    #dbg_value(i64 %and51, !1705, !DIExpression(), !1706)
  %arrayidx54 = getelementptr inbounds nuw i8, ptr %M, i32 64, !dbg !1707
  %66 = load i64, ptr %arrayidx54, align 8, !dbg !1707
  %shr55 = lshr i64 %66, 16, !dbg !1708
  %arrayidx57 = getelementptr inbounds nuw i8, ptr %M, i32 96, !dbg !1709
  %67 = load i64, ptr %arrayidx57, align 8, !dbg !1709
  %xor58 = xor i64 %shr55, %67, !dbg !1710
  %and59 = and i64 %xor58, 281470681808895, !dbg !1711
    #dbg_value(i64 %and59, !1712, !DIExpression(), !1706)
  %shl60 = shl nuw i64 %and51, 16, !dbg !1713
  %68 = load i64, ptr %M, align 8, !dbg !1714
  %xor62 = xor i64 %68, %shl60, !dbg !1714
  store i64 %xor62, ptr %M, align 8, !dbg !1714
  %shl63 = shl nuw i64 %and59, 16, !dbg !1715
  %arrayidx65 = getelementptr inbounds nuw i8, ptr %M, i32 64, !dbg !1716
  %69 = load i64, ptr %arrayidx65, align 8, !dbg !1717
  %xor66 = xor i64 %69, %shl63, !dbg !1717
  store i64 %xor66, ptr %arrayidx65, align 8, !dbg !1717
  %arrayidx68 = getelementptr inbounds nuw i8, ptr %M, i32 32, !dbg !1718
  %70 = load i64, ptr %arrayidx68, align 8, !dbg !1719
  %xor69 = xor i64 %70, %and51, !dbg !1719
  store i64 %xor69, ptr %arrayidx68, align 8, !dbg !1719
  %arrayidx71 = getelementptr inbounds nuw i8, ptr %M, i32 96, !dbg !1720
  %71 = load i64, ptr %arrayidx71, align 8, !dbg !1721
  %xor72 = xor i64 %71, %and59, !dbg !1721
  store i64 %xor72, ptr %arrayidx71, align 8, !dbg !1721
    #dbg_value(i32 1, !1695, !DIExpression(), !1697)
  %arrayidx46.1 = getelementptr inbounds nuw i8, ptr %M, i32 8, !dbg !1698
  %72 = load i64, ptr %arrayidx46.1, align 8, !dbg !1698
  %shr47.1 = lshr i64 %72, 16, !dbg !1701
  %arrayidx49.1 = getelementptr inbounds nuw i8, ptr %M, i32 40, !dbg !1702
  %73 = load i64, ptr %arrayidx49.1, align 8, !dbg !1702
  %xor50.1 = xor i64 %shr47.1, %73, !dbg !1703
  %and51.1 = and i64 %xor50.1, 281470681808895, !dbg !1704
    #dbg_value(i64 %and51.1, !1705, !DIExpression(), !1706)
  %arrayidx54.1 = getelementptr inbounds nuw i8, ptr %M, i32 72, !dbg !1707
  %74 = load i64, ptr %arrayidx54.1, align 8, !dbg !1707
  %shr55.1 = lshr i64 %74, 16, !dbg !1708
  %arrayidx57.1 = getelementptr inbounds nuw i8, ptr %M, i32 104, !dbg !1709
  %75 = load i64, ptr %arrayidx57.1, align 8, !dbg !1709
  %xor58.1 = xor i64 %shr55.1, %75, !dbg !1710
  %and59.1 = and i64 %xor58.1, 281470681808895, !dbg !1711
    #dbg_value(i64 %and59.1, !1712, !DIExpression(), !1706)
  %shl60.1 = shl nuw i64 %and51.1, 16, !dbg !1713
  %arrayidx61.1 = getelementptr inbounds nuw i8, ptr %M, i32 8, !dbg !1722
  %76 = load i64, ptr %arrayidx61.1, align 8, !dbg !1714
  %xor62.1 = xor i64 %76, %shl60.1, !dbg !1714
  store i64 %xor62.1, ptr %arrayidx61.1, align 8, !dbg !1714
  %shl63.1 = shl nuw i64 %and59.1, 16, !dbg !1715
  %arrayidx65.1 = getelementptr inbounds nuw i8, ptr %M, i32 72, !dbg !1716
  %77 = load i64, ptr %arrayidx65.1, align 8, !dbg !1717
  %xor66.1 = xor i64 %77, %shl63.1, !dbg !1717
  store i64 %xor66.1, ptr %arrayidx65.1, align 8, !dbg !1717
  %arrayidx68.1 = getelementptr inbounds nuw i8, ptr %M, i32 40, !dbg !1718
  %78 = load i64, ptr %arrayidx68.1, align 8, !dbg !1719
  %xor69.1 = xor i64 %78, %and51.1, !dbg !1719
  store i64 %xor69.1, ptr %arrayidx68.1, align 8, !dbg !1719
  %arrayidx71.1 = getelementptr inbounds nuw i8, ptr %M, i32 104, !dbg !1720
  %79 = load i64, ptr %arrayidx71.1, align 8, !dbg !1721
  %xor72.1 = xor i64 %79, %and59.1, !dbg !1721
  store i64 %xor72.1, ptr %arrayidx71.1, align 8, !dbg !1721
    #dbg_value(i32 2, !1695, !DIExpression(), !1697)
  %arrayidx46.2 = getelementptr inbounds nuw i8, ptr %M, i32 16, !dbg !1698
  %80 = load i64, ptr %arrayidx46.2, align 8, !dbg !1698
  %shr47.2 = lshr i64 %80, 16, !dbg !1701
  %arrayidx49.2 = getelementptr inbounds nuw i8, ptr %M, i32 48, !dbg !1702
  %81 = load i64, ptr %arrayidx49.2, align 8, !dbg !1702
  %xor50.2 = xor i64 %shr47.2, %81, !dbg !1703
  %and51.2 = and i64 %xor50.2, 281470681808895, !dbg !1704
    #dbg_value(i64 %and51.2, !1705, !DIExpression(), !1706)
  %arrayidx54.2 = getelementptr inbounds nuw i8, ptr %M, i32 80, !dbg !1707
  %82 = load i64, ptr %arrayidx54.2, align 8, !dbg !1707
  %shr55.2 = lshr i64 %82, 16, !dbg !1708
  %arrayidx57.2 = getelementptr inbounds nuw i8, ptr %M, i32 112, !dbg !1709
  %83 = load i64, ptr %arrayidx57.2, align 8, !dbg !1709
  %xor58.2 = xor i64 %shr55.2, %83, !dbg !1710
  %and59.2 = and i64 %xor58.2, 281470681808895, !dbg !1711
    #dbg_value(i64 %and59.2, !1712, !DIExpression(), !1706)
  %shl60.2 = shl nuw i64 %and51.2, 16, !dbg !1713
  %arrayidx61.2 = getelementptr inbounds nuw i8, ptr %M, i32 16, !dbg !1722
  %84 = load i64, ptr %arrayidx61.2, align 8, !dbg !1714
  %xor62.2 = xor i64 %84, %shl60.2, !dbg !1714
  store i64 %xor62.2, ptr %arrayidx61.2, align 8, !dbg !1714
  %shl63.2 = shl nuw i64 %and59.2, 16, !dbg !1715
  %arrayidx65.2 = getelementptr inbounds nuw i8, ptr %M, i32 80, !dbg !1716
  %85 = load i64, ptr %arrayidx65.2, align 8, !dbg !1717
  %xor66.2 = xor i64 %85, %shl63.2, !dbg !1717
  store i64 %xor66.2, ptr %arrayidx65.2, align 8, !dbg !1717
  %arrayidx68.2 = getelementptr inbounds nuw i8, ptr %M, i32 48, !dbg !1718
  %86 = load i64, ptr %arrayidx68.2, align 8, !dbg !1719
  %xor69.2 = xor i64 %86, %and51.2, !dbg !1719
  store i64 %xor69.2, ptr %arrayidx68.2, align 8, !dbg !1719
  %arrayidx71.2 = getelementptr inbounds nuw i8, ptr %M, i32 112, !dbg !1720
  %87 = load i64, ptr %arrayidx71.2, align 8, !dbg !1721
  %xor72.2 = xor i64 %87, %and59.2, !dbg !1721
  store i64 %xor72.2, ptr %arrayidx71.2, align 8, !dbg !1721
    #dbg_value(i32 3, !1695, !DIExpression(), !1697)
  %arrayidx46.3 = getelementptr inbounds nuw i8, ptr %M, i32 24, !dbg !1698
  %88 = load i64, ptr %arrayidx46.3, align 8, !dbg !1698
  %shr47.3 = lshr i64 %88, 16, !dbg !1701
  %arrayidx49.3 = getelementptr inbounds nuw i8, ptr %M, i32 56, !dbg !1702
  %89 = load i64, ptr %arrayidx49.3, align 8, !dbg !1702
  %xor50.3 = xor i64 %shr47.3, %89, !dbg !1703
  %and51.3 = and i64 %xor50.3, 281470681808895, !dbg !1704
    #dbg_value(i64 %and51.3, !1705, !DIExpression(), !1706)
  %arrayidx54.3 = getelementptr inbounds nuw i8, ptr %M, i32 88, !dbg !1707
  %90 = load i64, ptr %arrayidx54.3, align 8, !dbg !1707
  %shr55.3 = lshr i64 %90, 16, !dbg !1708
  %arrayidx57.3 = getelementptr inbounds nuw i8, ptr %M, i32 120, !dbg !1709
  %91 = load i64, ptr %arrayidx57.3, align 8, !dbg !1709
  %xor58.3 = xor i64 %shr55.3, %91, !dbg !1710
  %and59.3 = and i64 %xor58.3, 281470681808895, !dbg !1711
    #dbg_value(i64 %and59.3, !1712, !DIExpression(), !1706)
  %shl60.3 = shl nuw i64 %and51.3, 16, !dbg !1713
  %arrayidx61.3 = getelementptr inbounds nuw i8, ptr %M, i32 24, !dbg !1722
  %92 = load i64, ptr %arrayidx61.3, align 8, !dbg !1714
  %xor62.3 = xor i64 %92, %shl60.3, !dbg !1714
  store i64 %xor62.3, ptr %arrayidx61.3, align 8, !dbg !1714
  %shl63.3 = shl nuw i64 %and59.3, 16, !dbg !1715
  %arrayidx65.3 = getelementptr inbounds nuw i8, ptr %M, i32 88, !dbg !1716
  %93 = load i64, ptr %arrayidx65.3, align 8, !dbg !1717
  %xor66.3 = xor i64 %93, %shl63.3, !dbg !1717
  store i64 %xor66.3, ptr %arrayidx65.3, align 8, !dbg !1717
  %arrayidx68.3 = getelementptr inbounds nuw i8, ptr %M, i32 56, !dbg !1718
  %94 = load i64, ptr %arrayidx68.3, align 8, !dbg !1719
  %xor69.3 = xor i64 %94, %and51.3, !dbg !1719
  store i64 %xor69.3, ptr %arrayidx68.3, align 8, !dbg !1719
  %arrayidx71.3 = getelementptr inbounds nuw i8, ptr %M, i32 120, !dbg !1720
  %95 = load i64, ptr %arrayidx71.3, align 8, !dbg !1721
  %xor72.3 = xor i64 %95, %and59.3, !dbg !1721
  store i64 %xor72.3, ptr %arrayidx71.3, align 8, !dbg !1721
    #dbg_value(i32 4, !1695, !DIExpression(), !1697)
    #dbg_value(i32 0, !1723, !DIExpression(), !1725)
  %96 = load i64, ptr %M, align 8, !dbg !1726
  %shr81 = lshr i64 %96, 32, !dbg !1729
  %arrayidx83 = getelementptr inbounds nuw i8, ptr %M, i32 64, !dbg !1730
  %97 = load i64, ptr %arrayidx83, align 8, !dbg !1730
  %.masked = and i64 %97, 4294967295, !dbg !1731
  %and85 = xor i64 %shr81, %.masked, !dbg !1731
    #dbg_value(i64 %and85, !1732, !DIExpression(), !1733)
  %shl86 = shl nuw i64 %and85, 32, !dbg !1734
  %98 = load i64, ptr %M, align 8, !dbg !1735
  %xor88 = xor i64 %98, %shl86, !dbg !1735
  store i64 %xor88, ptr %M, align 8, !dbg !1735
  %arrayidx90 = getelementptr inbounds nuw i8, ptr %M, i32 64, !dbg !1736
  %99 = load i64, ptr %arrayidx90, align 8, !dbg !1737
  %xor91 = xor i64 %99, %and85, !dbg !1737
  store i64 %xor91, ptr %arrayidx90, align 8, !dbg !1737
    #dbg_value(i32 1, !1723, !DIExpression(), !1725)
  %arrayidx80.1 = getelementptr inbounds nuw i8, ptr %M, i32 8, !dbg !1726
  %100 = load i64, ptr %arrayidx80.1, align 8, !dbg !1726
  %shr81.1 = lshr i64 %100, 32, !dbg !1729
  %arrayidx83.1 = getelementptr inbounds nuw i8, ptr %M, i32 72, !dbg !1730
  %101 = load i64, ptr %arrayidx83.1, align 8, !dbg !1730
  %.masked.1 = and i64 %101, 4294967295, !dbg !1731
  %and85.1 = xor i64 %shr81.1, %.masked.1, !dbg !1731
    #dbg_value(i64 %and85.1, !1732, !DIExpression(), !1733)
  %shl86.1 = shl nuw i64 %and85.1, 32, !dbg !1734
  %arrayidx87.1 = getelementptr inbounds nuw i8, ptr %M, i32 8, !dbg !1738
  %102 = load i64, ptr %arrayidx87.1, align 8, !dbg !1735
  %xor88.1 = xor i64 %102, %shl86.1, !dbg !1735
  store i64 %xor88.1, ptr %arrayidx87.1, align 8, !dbg !1735
  %arrayidx90.1 = getelementptr inbounds nuw i8, ptr %M, i32 72, !dbg !1736
  %103 = load i64, ptr %arrayidx90.1, align 8, !dbg !1737
  %xor91.1 = xor i64 %103, %and85.1, !dbg !1737
  store i64 %xor91.1, ptr %arrayidx90.1, align 8, !dbg !1737
    #dbg_value(i32 2, !1723, !DIExpression(), !1725)
  %arrayidx80.2 = getelementptr inbounds nuw i8, ptr %M, i32 16, !dbg !1726
  %104 = load i64, ptr %arrayidx80.2, align 8, !dbg !1726
  %shr81.2 = lshr i64 %104, 32, !dbg !1729
  %arrayidx83.2 = getelementptr inbounds nuw i8, ptr %M, i32 80, !dbg !1730
  %105 = load i64, ptr %arrayidx83.2, align 8, !dbg !1730
  %.masked.2 = and i64 %105, 4294967295, !dbg !1731
  %and85.2 = xor i64 %shr81.2, %.masked.2, !dbg !1731
    #dbg_value(i64 %and85.2, !1732, !DIExpression(), !1733)
  %shl86.2 = shl nuw i64 %and85.2, 32, !dbg !1734
  %arrayidx87.2 = getelementptr inbounds nuw i8, ptr %M, i32 16, !dbg !1738
  %106 = load i64, ptr %arrayidx87.2, align 8, !dbg !1735
  %xor88.2 = xor i64 %106, %shl86.2, !dbg !1735
  store i64 %xor88.2, ptr %arrayidx87.2, align 8, !dbg !1735
  %arrayidx90.2 = getelementptr inbounds nuw i8, ptr %M, i32 80, !dbg !1736
  %107 = load i64, ptr %arrayidx90.2, align 8, !dbg !1737
  %xor91.2 = xor i64 %107, %and85.2, !dbg !1737
  store i64 %xor91.2, ptr %arrayidx90.2, align 8, !dbg !1737
    #dbg_value(i32 3, !1723, !DIExpression(), !1725)
  %arrayidx80.3 = getelementptr inbounds nuw i8, ptr %M, i32 24, !dbg !1726
  %108 = load i64, ptr %arrayidx80.3, align 8, !dbg !1726
  %shr81.3 = lshr i64 %108, 32, !dbg !1729
  %arrayidx83.3 = getelementptr inbounds nuw i8, ptr %M, i32 88, !dbg !1730
  %109 = load i64, ptr %arrayidx83.3, align 8, !dbg !1730
  %.masked.3 = and i64 %109, 4294967295, !dbg !1731
  %and85.3 = xor i64 %shr81.3, %.masked.3, !dbg !1731
    #dbg_value(i64 %and85.3, !1732, !DIExpression(), !1733)
  %shl86.3 = shl nuw i64 %and85.3, 32, !dbg !1734
  %arrayidx87.3 = getelementptr inbounds nuw i8, ptr %M, i32 24, !dbg !1738
  %110 = load i64, ptr %arrayidx87.3, align 8, !dbg !1735
  %xor88.3 = xor i64 %110, %shl86.3, !dbg !1735
  store i64 %xor88.3, ptr %arrayidx87.3, align 8, !dbg !1735
  %arrayidx90.3 = getelementptr inbounds nuw i8, ptr %M, i32 88, !dbg !1736
  %111 = load i64, ptr %arrayidx90.3, align 8, !dbg !1737
  %xor91.3 = xor i64 %111, %and85.3, !dbg !1737
  store i64 %xor91.3, ptr %arrayidx90.3, align 8, !dbg !1737
    #dbg_value(i32 4, !1723, !DIExpression(), !1725)
  %arrayidx80.4 = getelementptr inbounds nuw i8, ptr %M, i32 32, !dbg !1726
  %112 = load i64, ptr %arrayidx80.4, align 8, !dbg !1726
  %shr81.4 = lshr i64 %112, 32, !dbg !1729
  %arrayidx83.4 = getelementptr inbounds nuw i8, ptr %M, i32 96, !dbg !1730
  %113 = load i64, ptr %arrayidx83.4, align 8, !dbg !1730
  %.masked.4 = and i64 %113, 4294967295, !dbg !1731
  %and85.4 = xor i64 %shr81.4, %.masked.4, !dbg !1731
    #dbg_value(i64 %and85.4, !1732, !DIExpression(), !1733)
  %shl86.4 = shl nuw i64 %and85.4, 32, !dbg !1734
  %arrayidx87.4 = getelementptr inbounds nuw i8, ptr %M, i32 32, !dbg !1738
  %114 = load i64, ptr %arrayidx87.4, align 8, !dbg !1735
  %xor88.4 = xor i64 %114, %shl86.4, !dbg !1735
  store i64 %xor88.4, ptr %arrayidx87.4, align 8, !dbg !1735
  %arrayidx90.4 = getelementptr inbounds nuw i8, ptr %M, i32 96, !dbg !1736
  %115 = load i64, ptr %arrayidx90.4, align 8, !dbg !1737
  %xor91.4 = xor i64 %115, %and85.4, !dbg !1737
  store i64 %xor91.4, ptr %arrayidx90.4, align 8, !dbg !1737
    #dbg_value(i32 5, !1723, !DIExpression(), !1725)
  %arrayidx80.5 = getelementptr inbounds nuw i8, ptr %M, i32 40, !dbg !1726
  %116 = load i64, ptr %arrayidx80.5, align 8, !dbg !1726
  %shr81.5 = lshr i64 %116, 32, !dbg !1729
  %arrayidx83.5 = getelementptr inbounds nuw i8, ptr %M, i32 104, !dbg !1730
  %117 = load i64, ptr %arrayidx83.5, align 8, !dbg !1730
  %.masked.5 = and i64 %117, 4294967295, !dbg !1731
  %and85.5 = xor i64 %shr81.5, %.masked.5, !dbg !1731
    #dbg_value(i64 %and85.5, !1732, !DIExpression(), !1733)
  %shl86.5 = shl nuw i64 %and85.5, 32, !dbg !1734
  %arrayidx87.5 = getelementptr inbounds nuw i8, ptr %M, i32 40, !dbg !1738
  %118 = load i64, ptr %arrayidx87.5, align 8, !dbg !1735
  %xor88.5 = xor i64 %118, %shl86.5, !dbg !1735
  store i64 %xor88.5, ptr %arrayidx87.5, align 8, !dbg !1735
  %arrayidx90.5 = getelementptr inbounds nuw i8, ptr %M, i32 104, !dbg !1736
  %119 = load i64, ptr %arrayidx90.5, align 8, !dbg !1737
  %xor91.5 = xor i64 %119, %and85.5, !dbg !1737
  store i64 %xor91.5, ptr %arrayidx90.5, align 8, !dbg !1737
    #dbg_value(i32 6, !1723, !DIExpression(), !1725)
  %arrayidx80.6 = getelementptr inbounds nuw i8, ptr %M, i32 48, !dbg !1726
  %120 = load i64, ptr %arrayidx80.6, align 8, !dbg !1726
  %shr81.6 = lshr i64 %120, 32, !dbg !1729
  %arrayidx83.6 = getelementptr inbounds nuw i8, ptr %M, i32 112, !dbg !1730
  %121 = load i64, ptr %arrayidx83.6, align 8, !dbg !1730
  %.masked.6 = and i64 %121, 4294967295, !dbg !1731
  %and85.6 = xor i64 %shr81.6, %.masked.6, !dbg !1731
    #dbg_value(i64 %and85.6, !1732, !DIExpression(), !1733)
  %shl86.6 = shl nuw i64 %and85.6, 32, !dbg !1734
  %arrayidx87.6 = getelementptr inbounds nuw i8, ptr %M, i32 48, !dbg !1738
  %122 = load i64, ptr %arrayidx87.6, align 8, !dbg !1735
  %xor88.6 = xor i64 %122, %shl86.6, !dbg !1735
  store i64 %xor88.6, ptr %arrayidx87.6, align 8, !dbg !1735
  %arrayidx90.6 = getelementptr inbounds nuw i8, ptr %M, i32 112, !dbg !1736
  %123 = load i64, ptr %arrayidx90.6, align 8, !dbg !1737
  %xor91.6 = xor i64 %123, %and85.6, !dbg !1737
  store i64 %xor91.6, ptr %arrayidx90.6, align 8, !dbg !1737
    #dbg_value(i32 7, !1723, !DIExpression(), !1725)
  %arrayidx80.7 = getelementptr inbounds nuw i8, ptr %M, i32 56, !dbg !1726
  %124 = load i64, ptr %arrayidx80.7, align 8, !dbg !1726
  %shr81.7 = lshr i64 %124, 32, !dbg !1729
  %arrayidx83.7 = getelementptr inbounds nuw i8, ptr %M, i32 120, !dbg !1730
  %125 = load i64, ptr %arrayidx83.7, align 8, !dbg !1730
  %.masked.7 = and i64 %125, 4294967295, !dbg !1731
  %and85.7 = xor i64 %shr81.7, %.masked.7, !dbg !1731
    #dbg_value(i64 %and85.7, !1732, !DIExpression(), !1733)
  %shl86.7 = shl nuw i64 %and85.7, 32, !dbg !1734
  %arrayidx87.7 = getelementptr inbounds nuw i8, ptr %M, i32 56, !dbg !1738
  %126 = load i64, ptr %arrayidx87.7, align 8, !dbg !1735
  %xor88.7 = xor i64 %126, %shl86.7, !dbg !1735
  store i64 %xor88.7, ptr %arrayidx87.7, align 8, !dbg !1735
  %arrayidx90.7 = getelementptr inbounds nuw i8, ptr %M, i32 120, !dbg !1736
  %127 = load i64, ptr %arrayidx90.7, align 8, !dbg !1737
  %xor91.7 = xor i64 %127, %and85.7, !dbg !1737
  store i64 %xor91.7, ptr %arrayidx90.7, align 8, !dbg !1737
    #dbg_value(i32 8, !1723, !DIExpression(), !1725)
  ret void, !dbg !1739
}

; Function Attrs: nounwind
define internal fastcc void @mul_add_mat_x_m_mat(i32 noundef %m_vec_limbs, ptr noundef %mat, ptr noundef %bs_mat, ptr noundef %acc, i32 noundef %mat_rows, i32 noundef %mat_cols, i32 noundef %bs_mat_cols) unnamed_addr #0 !dbg !1740 {
entry:
    #dbg_value(i32 %m_vec_limbs, !1741, !DIExpression(), !1742)
    #dbg_value(ptr %mat, !1743, !DIExpression(), !1742)
    #dbg_value(ptr %bs_mat, !1744, !DIExpression(), !1742)
    #dbg_value(ptr %acc, !1745, !DIExpression(), !1742)
    #dbg_value(i32 %mat_rows, !1746, !DIExpression(), !1742)
    #dbg_value(i32 %mat_cols, !1747, !DIExpression(), !1742)
    #dbg_value(i32 %bs_mat_cols, !1748, !DIExpression(), !1742)
    #dbg_value(i32 0, !1749, !DIExpression(), !1751)
  %smax = call i32 @llvm.smax.i32(i32 %bs_mat_cols, i32 0), !dbg !1752
  %smax1 = call i32 @llvm.smax.i32(i32 %mat_cols, i32 0), !dbg !1752
  %smax3 = call i32 @llvm.smax.i32(i32 %mat_rows, i32 0), !dbg !1752
  br label %for.cond, !dbg !1752

for.cond:                                         ; preds = %for.inc17, %entry
  %r.0 = phi i32 [ 0, %entry ], [ %inc18, %for.inc17 ], !dbg !1753
    #dbg_value(i32 %r.0, !1749, !DIExpression(), !1751)
  %exitcond4.not = icmp eq i32 %r.0, %smax3, !dbg !1754
  br i1 %exitcond4.not, label %for.end19, label %for.cond1, !dbg !1756

for.cond1:                                        ; preds = %for.cond, %for.inc15
  %c.0 = phi i32 [ %inc, %for.inc15 ], [ 0, %for.cond ], !dbg !1757
    #dbg_value(i32 %c.0, !1760, !DIExpression(), !1761)
  %exitcond2.not = icmp eq i32 %c.0, %smax1, !dbg !1762
  br i1 %exitcond2.not, label %for.inc17, label %for.cond4, !dbg !1764

for.cond4:                                        ; preds = %for.cond1, %for.body6
  %k.0 = phi i32 [ %add14, %for.body6 ], [ 0, %for.cond1 ], !dbg !1765
    #dbg_value(i32 %k.0, !1768, !DIExpression(), !1769)
  %exitcond.not = icmp eq i32 %k.0, %smax, !dbg !1770
  br i1 %exitcond.not, label %for.inc15, label %for.body6, !dbg !1772

for.body6:                                        ; preds = %for.cond4
  %mul = mul nsw i32 %c.0, %bs_mat_cols, !dbg !1773
  %add = add nsw i32 %mul, %k.0, !dbg !1775
  %mul7 = mul nsw i32 %m_vec_limbs, %add, !dbg !1776
  %add.ptr = getelementptr inbounds i64, ptr %bs_mat, i32 %mul7, !dbg !1777
  %mul8 = mul nsw i32 %r.0, %mat_cols, !dbg !1778
  %0 = getelementptr i8, ptr %mat, i32 %mul8, !dbg !1779
  %arrayidx = getelementptr i8, ptr %0, i32 %c.0, !dbg !1779
  %1 = load i8, ptr %arrayidx, align 1, !dbg !1779
  %mul10 = mul nsw i32 %r.0, %bs_mat_cols, !dbg !1780
  %add11 = add nsw i32 %mul10, %k.0, !dbg !1781
  %mul12 = mul nsw i32 %m_vec_limbs, %add11, !dbg !1782
  %add.ptr13 = getelementptr inbounds i64, ptr %acc, i32 %mul12, !dbg !1783
  call fastcc void @m_vec_mul_add(i32 noundef %m_vec_limbs, ptr noundef %add.ptr, i8 noundef zeroext %1, ptr noundef %add.ptr13) #6, !dbg !1784
  %add14 = add nuw i32 %k.0, 1, !dbg !1785
    #dbg_value(i32 %add14, !1768, !DIExpression(), !1769)
  br label %for.cond4, !dbg !1786, !llvm.loop !1787

for.inc15:                                        ; preds = %for.cond4
  %inc = add nuw i32 %c.0, 1, !dbg !1789
    #dbg_value(i32 %inc, !1760, !DIExpression(), !1761)
  br label %for.cond1, !dbg !1790, !llvm.loop !1791

for.inc17:                                        ; preds = %for.cond1
  %inc18 = add nuw i32 %r.0, 1, !dbg !1793
    #dbg_value(i32 %inc18, !1749, !DIExpression(), !1751)
  br label %for.cond, !dbg !1794, !llvm.loop !1795

for.end19:                                        ; preds = %for.cond
  ret void, !dbg !1797
}

; Function Attrs: nounwind
define internal fastcc void @P1_times_Vt(ptr noundef %p, ptr noundef %P1, ptr noundef %V, ptr noundef %acc) unnamed_addr #0 !dbg !1798 {
entry:
    #dbg_value(ptr %p, !1799, !DIExpression(), !1800)
    #dbg_value(ptr %P1, !1801, !DIExpression(), !1800)
    #dbg_value(ptr %V, !1802, !DIExpression(), !1800)
    #dbg_value(ptr %acc, !1803, !DIExpression(), !1800)
  call fastcc void @mul_add_m_upper_triangular_mat_x_mat_trans(i32 noundef 5, ptr noundef %P1, ptr noundef %V, ptr noundef %acc, i32 noundef 78, i32 noundef 78, i32 noundef 10, i32 noundef 1) #6, !dbg !1804
  ret void, !dbg !1805
}

; Function Attrs: nounwind
define internal fastcc void @mul_add_m_upper_triangular_mat_x_mat_trans(i32 noundef %m_vec_limbs, ptr noundef %bs_mat, ptr noundef %mat, ptr noundef %acc, i32 noundef %bs_mat_rows, i32 noundef %bs_mat_cols, i32 noundef %mat_rows, i32 noundef %triangular) unnamed_addr #0 !dbg !1806 {
entry:
    #dbg_value(i32 %m_vec_limbs, !1807, !DIExpression(), !1808)
    #dbg_value(ptr %bs_mat, !1809, !DIExpression(), !1808)
    #dbg_value(ptr %mat, !1810, !DIExpression(), !1808)
    #dbg_value(ptr %acc, !1811, !DIExpression(), !1808)
    #dbg_value(i32 %bs_mat_rows, !1812, !DIExpression(), !1808)
    #dbg_value(i32 %bs_mat_cols, !1813, !DIExpression(), !1808)
    #dbg_value(i32 %mat_rows, !1814, !DIExpression(), !1808)
    #dbg_value(i32 %triangular, !1815, !DIExpression(), !1808)
    #dbg_value(i32 0, !1816, !DIExpression(), !1808)
    #dbg_value(i32 0, !1817, !DIExpression(), !1819)
  %smax = call i32 @llvm.smax.i32(i32 %mat_rows, i32 0), !dbg !1820
  %smax1 = call i32 @llvm.smax.i32(i32 %bs_mat_rows, i32 0), !dbg !1820
  br label %for.cond, !dbg !1820

for.cond:                                         ; preds = %for.inc17, %entry
  %bs_mat_entries_used.0 = phi i32 [ 0, %entry ], [ %bs_mat_entries_used.1, %for.inc17 ], !dbg !1821
  %r.0 = phi i32 [ 0, %entry ], [ %inc18, %for.inc17 ], !dbg !1822
    #dbg_value(i32 %r.0, !1817, !DIExpression(), !1819)
    #dbg_value(i32 %bs_mat_entries_used.0, !1816, !DIExpression(), !1808)
  %exitcond2.not = icmp eq i32 %r.0, %smax1, !dbg !1823
  br i1 %exitcond2.not, label %for.end19, label %for.body, !dbg !1825

for.body:                                         ; preds = %for.cond
  %mul = mul nsw i32 %triangular, %r.0, !dbg !1826
    #dbg_value(i32 %mul, !1829, !DIExpression(), !1830)
  br label %for.cond1, !dbg !1831

for.cond1:                                        ; preds = %for.inc15, %for.body
  %bs_mat_entries_used.1 = phi i32 [ %bs_mat_entries_used.0, %for.body ], [ %add14, %for.inc15 ], !dbg !1808
  %c.0 = phi i32 [ %mul, %for.body ], [ %inc, %for.inc15 ], !dbg !1832
    #dbg_value(i32 %c.0, !1829, !DIExpression(), !1830)
    #dbg_value(i32 %bs_mat_entries_used.1, !1816, !DIExpression(), !1808)
  %cmp2 = icmp slt i32 %c.0, %bs_mat_cols, !dbg !1833
  br i1 %cmp2, label %for.cond4, label %for.inc17, !dbg !1835

for.cond4:                                        ; preds = %for.cond1, %for.body6
  %k.0 = phi i32 [ %add13, %for.body6 ], [ 0, %for.cond1 ], !dbg !1836
    #dbg_value(i32 %k.0, !1839, !DIExpression(), !1840)
  %exitcond.not = icmp eq i32 %k.0, %smax, !dbg !1841
  br i1 %exitcond.not, label %for.inc15, label %for.body6, !dbg !1843

for.body6:                                        ; preds = %for.cond4
  %mul7 = mul nsw i32 %m_vec_limbs, %bs_mat_entries_used.1, !dbg !1844
  %add.ptr = getelementptr inbounds i64, ptr %bs_mat, i32 %mul7, !dbg !1846
  %mul8 = mul nsw i32 %k.0, %bs_mat_cols, !dbg !1847
  %0 = getelementptr i8, ptr %mat, i32 %mul8, !dbg !1848
  %arrayidx = getelementptr i8, ptr %0, i32 %c.0, !dbg !1848
  %1 = load i8, ptr %arrayidx, align 1, !dbg !1848
  %mul9 = mul nsw i32 %r.0, %mat_rows, !dbg !1849
  %add10 = add nsw i32 %mul9, %k.0, !dbg !1850
  %mul11 = mul nsw i32 %m_vec_limbs, %add10, !dbg !1851
  %add.ptr12 = getelementptr inbounds i64, ptr %acc, i32 %mul11, !dbg !1852
  call fastcc void @m_vec_mul_add(i32 noundef %m_vec_limbs, ptr noundef %add.ptr, i8 noundef zeroext %1, ptr noundef %add.ptr12) #6, !dbg !1853
  %add13 = add nuw i32 %k.0, 1, !dbg !1854
    #dbg_value(i32 %add13, !1839, !DIExpression(), !1840)
  br label %for.cond4, !dbg !1855, !llvm.loop !1856

for.inc15:                                        ; preds = %for.cond4
    #dbg_value(i32 %bs_mat_entries_used.1, !1816, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !1808)
  %add14 = add nsw i32 %bs_mat_entries_used.1, 1, !dbg !1858
    #dbg_value(i32 %add14, !1816, !DIExpression(), !1808)
  %inc = add nsw i32 %c.0, 1, !dbg !1859
    #dbg_value(i32 %inc, !1829, !DIExpression(), !1830)
  br label %for.cond1, !dbg !1860, !llvm.loop !1861

for.inc17:                                        ; preds = %for.cond1
  %inc18 = add nuw i32 %r.0, 1, !dbg !1863
    #dbg_value(i32 %inc18, !1817, !DIExpression(), !1819)
  br label %for.cond, !dbg !1864, !llvm.loop !1865

for.end19:                                        ; preds = %for.cond
  ret void, !dbg !1867
}

; Function Attrs: nounwind
define dso_local i32 @pqmayo_MAYO_1_ref_mayo_sign(ptr noundef %p, ptr noundef %sm, ptr noundef %smlen, ptr noundef %m, i32 noundef %mlen, ptr noundef %csk) local_unnamed_addr #0 !dbg !1868 {
entry:
  %siglen = alloca i32, align 4
    #dbg_value(ptr %p, !1869, !DIExpression(), !1870)
    #dbg_value(ptr %sm, !1871, !DIExpression(), !1870)
    #dbg_value(ptr %smlen, !1872, !DIExpression(), !1870)
    #dbg_value(ptr %m, !1873, !DIExpression(), !1870)
    #dbg_value(i32 %mlen, !1874, !DIExpression(), !1870)
    #dbg_value(ptr %csk, !1875, !DIExpression(), !1870)
    #dbg_value(i32 0, !1876, !DIExpression(), !1870)
    #dbg_value(i32 454, !1877, !DIExpression(), !1870)
  %add.ptr = getelementptr inbounds nuw i8, ptr %sm, i32 454, !dbg !1878
  %call = call ptr @memmove(ptr noundef nonnull %add.ptr, ptr noundef %m, i32 noundef %mlen) #8, !dbg !1879
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %sm, i32 454, !dbg !1880
    #dbg_value(ptr %siglen, !1881, !DIExpression(DW_OP_deref), !1870)
  %call2 = call i32 @pqmayo_MAYO_1_ref_mayo_sign_signature(ptr noundef %p, ptr noundef %sm, ptr noundef nonnull %siglen, ptr noundef nonnull %add.ptr1, i32 noundef %mlen, ptr noundef %csk) #6, !dbg !1882
    #dbg_value(i32 %call2, !1876, !DIExpression(), !1870)
  %cmp.not = icmp eq i32 %call2, 0, !dbg !1883
  %0 = load i32, ptr %siglen, align 4
    #dbg_value(i32 %0, !1881, !DIExpression(), !1870)
  %cmp3.not = icmp eq i32 %0, 454
  %or.cond = select i1 %cmp.not, i1 %cmp3.not, i1 false, !dbg !1885
  br i1 %or.cond, label %if.end, label %if.then, !dbg !1885

if.then:                                          ; preds = %entry
  %1 = load i32, ptr %siglen, align 4, !dbg !1886
    #dbg_value(i32 %1, !1881, !DIExpression(), !1870)
  %add = add i32 %1, %mlen, !dbg !1888
  %call4 = call ptr @memset(ptr noundef %sm, i32 noundef 0, i32 noundef %add) #8, !dbg !1889
  br label %err, !dbg !1890

if.end:                                           ; preds = %entry
  %2 = load i32, ptr %siglen, align 4, !dbg !1891
    #dbg_value(i32 %2, !1881, !DIExpression(), !1870)
  %add5 = add i32 %2, %mlen, !dbg !1892
  store i32 %add5, ptr %smlen, align 4, !dbg !1893
  br label %err, !dbg !1894

err:                                              ; preds = %if.end, %if.then
    #dbg_label(!1895, !1896)
  ret i32 %call2, !dbg !1897
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_1_ref_mayo_open(ptr noundef %p, ptr noundef %m, ptr noundef %mlen, ptr noundef %sm, i32 noundef %smlen, ptr noundef %pk) local_unnamed_addr #0 !dbg !1898 {
entry:
    #dbg_value(ptr %p, !1899, !DIExpression(), !1900)
    #dbg_value(ptr %m, !1901, !DIExpression(), !1900)
    #dbg_value(ptr %mlen, !1902, !DIExpression(), !1900)
    #dbg_value(ptr %sm, !1903, !DIExpression(), !1900)
    #dbg_value(i32 %smlen, !1904, !DIExpression(), !1900)
    #dbg_value(ptr %pk, !1905, !DIExpression(), !1900)
    #dbg_value(i32 454, !1906, !DIExpression(), !1900)
  %cmp = icmp ult i32 %smlen, 454, !dbg !1907
  br i1 %cmp, label %return, label %if.end, !dbg !1907

if.end:                                           ; preds = %entry
  %add.ptr = getelementptr inbounds nuw i8, ptr %sm, i32 454, !dbg !1909
  %sub = add i32 %smlen, -454, !dbg !1910
  %call = call i32 @pqmayo_MAYO_1_ref_mayo_verify(ptr noundef %p, ptr noundef nonnull %add.ptr, i32 noundef %sub, ptr noundef %sm, ptr noundef %pk) #6, !dbg !1911
    #dbg_value(i32 %call, !1912, !DIExpression(), !1900)
  %cmp1 = icmp eq i32 %call, 0, !dbg !1913
  br i1 %cmp1, label %if.then2, label %return, !dbg !1913

if.then2:                                         ; preds = %if.end
  %sub3 = add i32 %smlen, -454, !dbg !1915
  store i32 %sub3, ptr %mlen, align 4, !dbg !1917
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %sm, i32 454, !dbg !1918
  %call5 = call ptr @memmove(ptr noundef %m, ptr noundef nonnull %add.ptr4, i32 noundef %sub3) #8, !dbg !1919
  br label %return, !dbg !1920

return:                                           ; preds = %if.end, %if.then2, %entry
  %retval.0 = phi i32 [ 1, %entry ], [ %call, %if.then2 ], [ %call, %if.end ], !dbg !1900
  ret i32 %retval.0, !dbg !1921
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_1_ref_mayo_verify(ptr noundef %p, ptr noundef %m, i32 noundef %mlen, ptr noundef %sig, ptr noundef %cpk) local_unnamed_addr #0 !dbg !1922 {
entry:
  %tEnc = alloca [39 x i8], align 1
  %t = alloca [78 x i8], align 1
  %y = alloca [156 x i8], align 1
  %s = alloca [860 x i8], align 1
  %pk = alloca [18705 x i64], align 8
  %tmp = alloca [56 x i8], align 1
    #dbg_value(ptr %p, !1925, !DIExpression(), !1926)
    #dbg_value(ptr %m, !1927, !DIExpression(), !1926)
    #dbg_value(i32 %mlen, !1928, !DIExpression(), !1926)
    #dbg_value(ptr %sig, !1929, !DIExpression(), !1926)
    #dbg_value(ptr %cpk, !1930, !DIExpression(), !1926)
    #dbg_declare(ptr %tEnc, !1931, !DIExpression(), !1932)
    #dbg_declare(ptr %t, !1933, !DIExpression(), !1934)
    #dbg_declare(ptr %y, !1935, !DIExpression(), !1939)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(156) %y, i8 0, i32 156, i1 false), !dbg !1939
    #dbg_declare(ptr %s, !1940, !DIExpression(), !1941)
    #dbg_declare(ptr %pk, !1942, !DIExpression(), !1946)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(149640) %pk, i8 0, i32 149640, i1 false), !dbg !1946
    #dbg_declare(ptr %tmp, !1947, !DIExpression(), !1951)
    #dbg_value(i32 78, !1952, !DIExpression(), !1926)
    #dbg_value(i32 86, !1953, !DIExpression(), !1926)
    #dbg_value(i32 10, !1954, !DIExpression(), !1926)
    #dbg_value(i32 39, !1955, !DIExpression(), !1926)
    #dbg_value(i32 454, !1956, !DIExpression(), !1926)
    #dbg_value(i32 32, !1957, !DIExpression(), !1926)
    #dbg_value(i32 24, !1958, !DIExpression(), !1926)
  %call = call i32 @pqmayo_MAYO_1_ref_mayo_expand_pk(ptr noundef %p, ptr noundef %cpk, ptr noundef nonnull %pk) #6, !dbg !1959
    #dbg_value(i32 %call, !1960, !DIExpression(), !1926)
  %cmp.not = icmp eq i32 %call, 0, !dbg !1961
  br i1 %cmp.not, label %if.end, label %return, !dbg !1961

if.end:                                           ; preds = %entry
    #dbg_value(ptr %pk, !1963, !DIExpression(), !1926)
  %add.ptr = getelementptr inbounds nuw i8, ptr %pk, i32 123240, !dbg !1964
    #dbg_value(ptr %add.ptr, !1965, !DIExpression(), !1926)
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %pk, i32 148200, !dbg !1966
    #dbg_value(ptr %add.ptr2, !1967, !DIExpression(), !1926)
  %call4 = call i32 @shake256(ptr noundef nonnull %tmp, i32 noundef 32, ptr noundef %m, i32 noundef %mlen) #8, !dbg !1968
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %tmp, i32 32, !dbg !1969
  %add.ptr8 = getelementptr inbounds nuw i8, ptr %sig, i32 430, !dbg !1970
  %call9 = call ptr @memcpy(ptr noundef nonnull %add.ptr6, ptr noundef nonnull %add.ptr8, i32 noundef 24) #8, !dbg !1971
  %call12 = call i32 @shake256(ptr noundef nonnull %tEnc, i32 noundef 39, ptr noundef nonnull %tmp, i32 noundef 56) #8, !dbg !1972
  call fastcc void @decode(ptr noundef nonnull %tEnc, ptr noundef nonnull %t, i32 noundef 78) #6, !dbg !1973
  call fastcc void @decode(ptr noundef %sig, ptr noundef nonnull %s, i32 noundef 860) #6, !dbg !1974
  call fastcc void @eval_public_map(ptr noundef %p, ptr noundef nonnull %s, ptr noundef nonnull %pk, ptr noundef nonnull %add.ptr, ptr noundef nonnull %add.ptr2, ptr noundef nonnull %y) #6, !dbg !1975
  %call20 = call i32 @memcmp(ptr noundef nonnull %y, ptr noundef nonnull %t, i32 noundef 78) #8, !dbg !1976
  %cmp21 = icmp ne i32 %call20, 0, !dbg !1978
  %. = zext i1 %cmp21 to i32, !dbg !1926
  br label %return, !dbg !1926

return:                                           ; preds = %if.end, %entry
  %retval.0 = phi i32 [ 1, %entry ], [ %., %if.end ], !dbg !1926
  ret i32 %retval.0, !dbg !1979
}

; Function Attrs: nounwind
define dso_local i32 @pqmayo_MAYO_1_ref_mayo_expand_pk(ptr noundef %p, ptr noundef %cpk, ptr noundef %pk) local_unnamed_addr #0 !dbg !1980 {
entry:
    #dbg_value(ptr %p, !1983, !DIExpression(), !1984)
    #dbg_value(ptr %cpk, !1985, !DIExpression(), !1984)
    #dbg_value(ptr %pk, !1986, !DIExpression(), !1984)
  call fastcc void @expand_P1_P2(ptr noundef %p, ptr noundef %pk, ptr noundef %cpk) #6, !dbg !1987
  %add.ptr = getelementptr inbounds nuw i8, ptr %cpk, i32 16, !dbg !1988
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %pk, i32 148200, !dbg !1989
  call fastcc void @unpack_m_vecs(ptr noundef nonnull %add.ptr, ptr noundef nonnull %add.ptr2, i32 noundef 36, i32 noundef 78) #6, !dbg !1990
  ret i32 0, !dbg !1991
}

; Function Attrs: nounwind
define internal fastcc void @eval_public_map(ptr noundef %p, ptr noundef %s, ptr noundef %P1, ptr noundef %P2, ptr noundef %P3, ptr noundef %eval) unnamed_addr #0 !dbg !1992 {
entry:
  %SPS = alloca [500 x i64], align 8
  %zero = alloca [78 x i8], align 1
    #dbg_value(ptr %p, !1995, !DIExpression(), !1996)
    #dbg_value(ptr %s, !1997, !DIExpression(), !1996)
    #dbg_value(ptr %P1, !1998, !DIExpression(), !1996)
    #dbg_value(ptr %P2, !1999, !DIExpression(), !1996)
    #dbg_value(ptr %P3, !2000, !DIExpression(), !1996)
    #dbg_value(ptr %eval, !2001, !DIExpression(), !1996)
    #dbg_declare(ptr %SPS, !2002, !DIExpression(), !2006)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(4000) %SPS, i8 0, i32 4000, i1 false), !dbg !2006
  call fastcc void @m_calculate_PS_SPS(ptr noundef %p, ptr noundef %P1, ptr noundef %P2, ptr noundef %P3, ptr noundef %s, ptr noundef nonnull %SPS) #6, !dbg !2007
    #dbg_declare(ptr %zero, !2008, !DIExpression(), !2009)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 1 dereferenceable(78) %zero, i8 0, i32 78, i1 false), !dbg !2009
  call fastcc void @compute_rhs(ptr noundef %p, ptr noundef nonnull %SPS, ptr noundef nonnull %zero, ptr noundef %eval) #6, !dbg !2010
  ret void, !dbg !2011
}

; Function Attrs: nounwind
define internal fastcc void @m_calculate_PS_SPS(ptr noundef %p, ptr noundef %P1, ptr noundef %P2, ptr noundef %P3, ptr noundef %s, ptr noundef %SPS) unnamed_addr #0 !dbg !2012 {
entry:
  %PS = alloca [4300 x i64], align 8
    #dbg_value(ptr %p, !2015, !DIExpression(), !2016)
    #dbg_value(ptr %P1, !2017, !DIExpression(), !2016)
    #dbg_value(ptr %P2, !2018, !DIExpression(), !2016)
    #dbg_value(ptr %P3, !2019, !DIExpression(), !2016)
    #dbg_value(ptr %s, !2020, !DIExpression(), !2016)
    #dbg_value(ptr %SPS, !2021, !DIExpression(), !2016)
    #dbg_declare(ptr %PS, !2022, !DIExpression(), !2026)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(34400) %PS, i8 0, i32 34400, i1 false), !dbg !2026
  call fastcc void @mayo_generic_m_calculate_PS(ptr noundef %P1, ptr noundef %P2, ptr noundef %P3, ptr noundef %s, i32 noundef 78, i32 noundef 78, i32 noundef 8, i32 noundef 10, ptr noundef nonnull %PS) #6, !dbg !2027
  call fastcc void @mayo_generic_m_calculate_SPS(ptr noundef nonnull %PS, ptr noundef %s, i32 noundef 78, i32 noundef 10, i32 noundef 86, ptr noundef %SPS) #6, !dbg !2028
  ret void, !dbg !2029
}

; Function Attrs: nounwind
define internal fastcc void @mayo_generic_m_calculate_PS(ptr noundef %P1, ptr noundef %P2, ptr noundef %P3, ptr noundef %S, i32 noundef %m, i32 noundef %v, i32 noundef %o, i32 noundef %k, ptr noundef %PS) unnamed_addr #0 !dbg !2030 {
entry:
  %accumulator = alloca [68800 x i64], align 8
    #dbg_value(ptr %P1, !2033, !DIExpression(), !2034)
    #dbg_value(ptr %P2, !2035, !DIExpression(), !2034)
    #dbg_value(ptr %P3, !2036, !DIExpression(), !2034)
    #dbg_value(ptr %S, !2037, !DIExpression(), !2034)
    #dbg_value(i32 %m, !2038, !DIExpression(), !2034)
    #dbg_value(i32 %v, !2039, !DIExpression(), !2034)
    #dbg_value(i32 %o, !2040, !DIExpression(), !2034)
    #dbg_value(i32 %k, !2041, !DIExpression(), !2034)
    #dbg_value(ptr %PS, !2042, !DIExpression(), !2034)
  %add = add i32 %o, %v, !dbg !2043
    #dbg_value(i32 %add, !2044, !DIExpression(), !2034)
  %add1 = add nsw i32 %m, 15, !dbg !2045
  %div = sdiv i32 %add1, 16, !dbg !2046
    #dbg_value(i32 %div, !2047, !DIExpression(), !2034)
    #dbg_declare(ptr %accumulator, !2048, !DIExpression(), !2052)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(550400) %accumulator, i8 0, i32 550400, i1 false), !dbg !2052
    #dbg_value(i32 0, !2053, !DIExpression(), !2034)
    #dbg_value(i32 0, !2054, !DIExpression(), !2056)
  %smax = call i32 @llvm.smax.i32(i32 %k, i32 0), !dbg !2057
  %smax3 = call i32 @llvm.smax.i32(i32 %o, i32 0), !dbg !2057
  %smax5 = call i32 @llvm.smax.i32(i32 %v, i32 0), !dbg !2057
  br label %for.cond, !dbg !2057

for.cond:                                         ; preds = %for.inc52, %entry
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc52 ], [ %v, %entry ], !dbg !2058
  %P1_used.0 = phi i32 [ %P1_used.1, %for.inc52 ], [ 0, %entry ], !dbg !2058
  %row.0 = phi i32 [ %inc53, %for.inc52 ], [ 0, %entry ], !dbg !2059
    #dbg_value(i32 %row.0, !2054, !DIExpression(), !2056)
    #dbg_value(i32 %P1_used.0, !2053, !DIExpression(), !2034)
  %exitcond6.not = icmp eq i32 %row.0, %smax5, !dbg !2060
  br i1 %exitcond6.not, label %for.cond56.preheader, label %for.cond2.preheader, !dbg !2062

for.cond2.preheader:                              ; preds = %for.cond
  %0 = add i32 %P1_used.0, %indvars.iv, !dbg !2063
  br label %for.cond2, !dbg !2063

for.cond56.preheader:                             ; preds = %for.cond
  %smax8 = call i32 @llvm.smax.i32(i32 %v, i32 %add), !dbg !2066
  br label %for.cond56, !dbg !2066

for.cond2:                                        ; preds = %for.cond2.preheader, %for.inc17
  %P1_used.1 = phi i32 [ %inc16, %for.inc17 ], [ %P1_used.0, %for.cond2.preheader ], !dbg !2034
  %j.0 = phi i32 [ %inc18, %for.inc17 ], [ %row.0, %for.cond2.preheader ], !dbg !2068
    #dbg_value(i32 %j.0, !2069, !DIExpression(), !2070)
    #dbg_value(i32 %P1_used.1, !2053, !DIExpression(), !2034)
  %exitcond1.not = icmp eq i32 %P1_used.1, %0, !dbg !2071
  br i1 %exitcond1.not, label %for.cond21, label %for.cond5, !dbg !2063

for.cond5:                                        ; preds = %for.cond2, %for.body7
  %col.0 = phi i32 [ %inc, %for.body7 ], [ 0, %for.cond2 ], !dbg !2073
    #dbg_value(i32 %col.0, !2076, !DIExpression(), !2077)
  %exitcond.not = icmp eq i32 %col.0, %smax, !dbg !2078
  br i1 %exitcond.not, label %for.inc17, label %for.body7, !dbg !2080

for.body7:                                        ; preds = %for.cond5
  %mul = mul nsw i32 %P1_used.1, %div, !dbg !2081
  %add.ptr = getelementptr inbounds i64, ptr %P1, i32 %mul, !dbg !2083
  %mul8 = mul nsw i32 %row.0, %k, !dbg !2084
  %add9 = add nsw i32 %mul8, %col.0, !dbg !2085
  %mul10 = shl nsw i32 %add9, 4, !dbg !2086
  %mul11 = mul nsw i32 %col.0, %add, !dbg !2087
  %1 = getelementptr i8, ptr %S, i32 %mul11, !dbg !2088
  %arrayidx = getelementptr i8, ptr %1, i32 %j.0, !dbg !2088
  %2 = load i8, ptr %arrayidx, align 1, !dbg !2088
  %conv = zext i8 %2 to i32, !dbg !2088
  %add13 = add nsw i32 %mul10, %conv, !dbg !2089
  %mul14 = mul nsw i32 %add13, %div, !dbg !2090
  %add.ptr15 = getelementptr inbounds i64, ptr %accumulator, i32 %mul14, !dbg !2091
  call fastcc void @m_vec_add(i32 noundef %div, ptr noundef %add.ptr, ptr noundef nonnull %add.ptr15) #6, !dbg !2092
  %inc = add nuw i32 %col.0, 1, !dbg !2093
    #dbg_value(i32 %inc, !2076, !DIExpression(), !2077)
  br label %for.cond5, !dbg !2094, !llvm.loop !2095

for.inc17:                                        ; preds = %for.cond5
    #dbg_value(i32 %P1_used.1, !2053, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2034)
  %inc16 = add i32 %P1_used.1, 1, !dbg !2097
    #dbg_value(i32 %inc16, !2053, !DIExpression(), !2034)
  %inc18 = add nuw nsw i32 %j.0, 1, !dbg !2098
    #dbg_value(i32 %inc18, !2069, !DIExpression(), !2070)
  br label %for.cond2, !dbg !2099, !llvm.loop !2100

for.cond21:                                       ; preds = %for.cond2, %for.inc49
  %j20.0 = phi i32 [ %inc50, %for.inc49 ], [ 0, %for.cond2 ], !dbg !2102
    #dbg_value(i32 %j20.0, !2104, !DIExpression(), !2105)
  %exitcond4.not = icmp eq i32 %j20.0, %smax3, !dbg !2106
  br i1 %exitcond4.not, label %for.inc52, label %for.cond26, !dbg !2108

for.cond26:                                       ; preds = %for.cond21, %for.body29
  %col25.0 = phi i32 [ %inc47, %for.body29 ], [ 0, %for.cond21 ], !dbg !2109
    #dbg_value(i32 %col25.0, !2112, !DIExpression(), !2113)
  %exitcond2.not = icmp eq i32 %col25.0, %smax, !dbg !2114
  br i1 %exitcond2.not, label %for.inc49, label %for.body29, !dbg !2116

for.body29:                                       ; preds = %for.cond26
  %mul30 = mul nsw i32 %row.0, %o, !dbg !2117
  %add31 = add nsw i32 %mul30, %j20.0, !dbg !2119
  %mul32 = mul nsw i32 %add31, %div, !dbg !2120
  %add.ptr33 = getelementptr inbounds i64, ptr %P2, i32 %mul32, !dbg !2121
  %mul35 = mul nsw i32 %row.0, %k, !dbg !2122
  %add36 = add nsw i32 %mul35, %col25.0, !dbg !2123
  %mul37 = shl nsw i32 %add36, 4, !dbg !2124
  %mul38 = mul nsw i32 %col25.0, %add, !dbg !2125
  %3 = getelementptr i8, ptr %S, i32 %mul38, !dbg !2126
  %4 = getelementptr i8, ptr %3, i32 %j20.0, !dbg !2126
  %arrayidx41 = getelementptr i8, ptr %4, i32 %v, !dbg !2126
  %5 = load i8, ptr %arrayidx41, align 1, !dbg !2126
  %conv42 = zext i8 %5 to i32, !dbg !2126
  %add43 = add nsw i32 %mul37, %conv42, !dbg !2127
  %mul44 = mul nsw i32 %add43, %div, !dbg !2128
  %add.ptr45 = getelementptr inbounds i64, ptr %accumulator, i32 %mul44, !dbg !2129
  call fastcc void @m_vec_add(i32 noundef %div, ptr noundef %add.ptr33, ptr noundef nonnull %add.ptr45) #6, !dbg !2130
  %inc47 = add nuw i32 %col25.0, 1, !dbg !2131
    #dbg_value(i32 %inc47, !2112, !DIExpression(), !2113)
  br label %for.cond26, !dbg !2132, !llvm.loop !2133

for.inc49:                                        ; preds = %for.cond26
  %inc50 = add nuw i32 %j20.0, 1, !dbg !2135
    #dbg_value(i32 %inc50, !2104, !DIExpression(), !2105)
  br label %for.cond21, !dbg !2136, !llvm.loop !2137

for.inc52:                                        ; preds = %for.cond21
  %inc53 = add nuw i32 %row.0, 1, !dbg !2139
    #dbg_value(i32 %inc53, !2054, !DIExpression(), !2056)
  %indvars.iv.next = add i32 %indvars.iv, -1, !dbg !2140
  br label %for.cond, !dbg !2140, !llvm.loop !2141

for.cond56:                                       ; preds = %for.cond56.preheader, %for.inc90
  %P3_used.0 = phi i32 [ %P3_used.1, %for.inc90 ], [ 0, %for.cond56.preheader ], !dbg !2143
  %row55.0 = phi i32 [ %inc91, %for.inc90 ], [ %v, %for.cond56.preheader ], !dbg !2144
    #dbg_value(i32 %row55.0, !2145, !DIExpression(), !2146)
    #dbg_value(i32 %P3_used.0, !2147, !DIExpression(), !2034)
  %exitcond9.not = icmp eq i32 %row55.0, %smax8, !dbg !2148
  br i1 %exitcond9.not, label %while.cond.preheader, label %for.cond61, !dbg !2066

while.cond.preheader:                             ; preds = %for.cond56
  %6 = mul i32 %k, %add, !dbg !2150
  %smax10 = call i32 @llvm.smax.i32(i32 %6, i32 0), !dbg !2150
  br label %while.cond, !dbg !2150

for.cond61:                                       ; preds = %for.cond56, %for.inc87
  %P3_used.1 = phi i32 [ %inc86, %for.inc87 ], [ %P3_used.0, %for.cond56 ], !dbg !2034
  %j60.0 = phi i32 [ %inc88, %for.inc87 ], [ %row55.0, %for.cond56 ], !dbg !2151
    #dbg_value(i32 %j60.0, !2154, !DIExpression(), !2155)
    #dbg_value(i32 %P3_used.1, !2147, !DIExpression(), !2034)
  %cmp62 = icmp slt i32 %j60.0, %add, !dbg !2156
  br i1 %cmp62, label %for.cond66, label %for.inc90, !dbg !2158

for.cond66:                                       ; preds = %for.cond61, %for.body69
  %col65.0 = phi i32 [ %inc84, %for.body69 ], [ 0, %for.cond61 ], !dbg !2159
    #dbg_value(i32 %col65.0, !2162, !DIExpression(), !2163)
  %exitcond7.not = icmp eq i32 %col65.0, %smax, !dbg !2164
  br i1 %exitcond7.not, label %for.inc87, label %for.body69, !dbg !2166

for.body69:                                       ; preds = %for.cond66
  %mul70 = mul nsw i32 %P3_used.1, %div, !dbg !2167
  %add.ptr71 = getelementptr inbounds i64, ptr %P3, i32 %mul70, !dbg !2169
  %mul73 = mul nsw i32 %row55.0, %k, !dbg !2170
  %add74 = add nsw i32 %mul73, %col65.0, !dbg !2171
  %mul75 = shl nsw i32 %add74, 4, !dbg !2172
  %mul76 = mul nsw i32 %col65.0, %add, !dbg !2173
  %7 = getelementptr i8, ptr %S, i32 %mul76, !dbg !2174
  %arrayidx78 = getelementptr i8, ptr %7, i32 %j60.0, !dbg !2174
  %8 = load i8, ptr %arrayidx78, align 1, !dbg !2174
  %conv79 = zext i8 %8 to i32, !dbg !2174
  %add80 = add nsw i32 %mul75, %conv79, !dbg !2175
  %mul81 = mul nsw i32 %add80, %div, !dbg !2176
  %add.ptr82 = getelementptr inbounds i64, ptr %accumulator, i32 %mul81, !dbg !2177
  call fastcc void @m_vec_add(i32 noundef %div, ptr noundef %add.ptr71, ptr noundef nonnull %add.ptr82) #6, !dbg !2178
  %inc84 = add nuw i32 %col65.0, 1, !dbg !2179
    #dbg_value(i32 %inc84, !2162, !DIExpression(), !2163)
  br label %for.cond66, !dbg !2180, !llvm.loop !2181

for.inc87:                                        ; preds = %for.cond66
    #dbg_value(i32 %P3_used.1, !2147, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2034)
  %inc86 = add nsw i32 %P3_used.1, 1, !dbg !2183
    #dbg_value(i32 %inc86, !2147, !DIExpression(), !2034)
  %inc88 = add nsw i32 %j60.0, 1, !dbg !2184
    #dbg_value(i32 %inc88, !2154, !DIExpression(), !2155)
  br label %for.cond61, !dbg !2185, !llvm.loop !2186

for.inc90:                                        ; preds = %for.cond61
  %inc91 = add i32 %row55.0, 1, !dbg !2188
    #dbg_value(i32 %inc91, !2145, !DIExpression(), !2146)
  br label %for.cond56, !dbg !2189, !llvm.loop !2190

while.cond:                                       ; preds = %while.cond.preheader, %while.body
  %i.0 = phi i32 [ %inc102, %while.body ], [ 0, %while.cond.preheader ], !dbg !2034
    #dbg_value(i32 %i.0, !2192, !DIExpression(), !2034)
  %exitcond11.not = icmp eq i32 %i.0, %smax10, !dbg !2193
  br i1 %exitcond11.not, label %while.end, label %while.body, !dbg !2150

while.body:                                       ; preds = %while.cond
  %mul97 = shl nsw i32 %i.0, 4, !dbg !2194
  %mul98 = mul nsw i32 %mul97, %div, !dbg !2196
  %add.ptr99 = getelementptr inbounds i64, ptr %accumulator, i32 %mul98, !dbg !2197
  %mul100 = mul nsw i32 %i.0, %div, !dbg !2198
  %add.ptr101 = getelementptr inbounds i64, ptr %PS, i32 %mul100, !dbg !2199
  call fastcc void @m_vec_multiply_bins(i32 noundef %div, ptr noundef nonnull %add.ptr99, ptr noundef %add.ptr101) #6, !dbg !2200
  %inc102 = add nuw i32 %i.0, 1, !dbg !2201
    #dbg_value(i32 %inc102, !2192, !DIExpression(), !2034)
  br label %while.cond, !dbg !2150, !llvm.loop !2202

while.end:                                        ; preds = %while.cond
  ret void, !dbg !2204
}

; Function Attrs: nounwind
define internal fastcc void @mayo_generic_m_calculate_SPS(ptr noundef %PS, ptr noundef %S, i32 noundef %m, i32 noundef %k, i32 noundef %n, ptr noundef %SPS) unnamed_addr #0 !dbg !2205 {
entry:
  %accumulator = alloca [8000 x i64], align 8
    #dbg_value(ptr %PS, !2208, !DIExpression(), !2209)
    #dbg_value(ptr %S, !2210, !DIExpression(), !2209)
    #dbg_value(i32 %m, !2211, !DIExpression(), !2209)
    #dbg_value(i32 %k, !2212, !DIExpression(), !2209)
    #dbg_value(i32 %n, !2213, !DIExpression(), !2209)
    #dbg_value(ptr %SPS, !2214, !DIExpression(), !2209)
    #dbg_declare(ptr %accumulator, !2215, !DIExpression(), !2219)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 8 dereferenceable(64000) %accumulator, i8 0, i32 64000, i1 false), !dbg !2219
  %add = add nsw i32 %m, 15, !dbg !2220
  %div = sdiv i32 %add, 16, !dbg !2221
    #dbg_value(i32 %div, !2222, !DIExpression(), !2209)
    #dbg_value(i32 0, !2223, !DIExpression(), !2225)
  %smax = call i32 @llvm.smax.i32(i32 %n, i32 0), !dbg !2226
  %smax2 = call i32 @llvm.smax.i32(i32 %k, i32 0), !dbg !2226
  br label %for.cond, !dbg !2226

for.cond:                                         ; preds = %for.inc20, %entry
  %row.0 = phi i32 [ 0, %entry ], [ %inc21, %for.inc20 ], !dbg !2227
    #dbg_value(i32 %row.0, !2223, !DIExpression(), !2225)
  %exitcond3.not = icmp eq i32 %row.0, %smax2, !dbg !2228
  br i1 %exitcond3.not, label %while.cond.preheader, label %for.cond1, !dbg !2230

while.cond.preheader:                             ; preds = %for.cond
  %0 = mul i32 %k, %k, !dbg !2231
  br label %while.cond, !dbg !2231

for.cond1:                                        ; preds = %for.cond, %for.inc18
  %j.0 = phi i32 [ %inc, %for.inc18 ], [ 0, %for.cond ], !dbg !2232
    #dbg_value(i32 %j.0, !2235, !DIExpression(), !2236)
  %exitcond1.not = icmp eq i32 %j.0, %smax, !dbg !2237
  br i1 %exitcond1.not, label %for.inc20, label %for.cond4, !dbg !2239

for.cond4:                                        ; preds = %for.cond1, %for.body6
  %col.0 = phi i32 [ %add17, %for.body6 ], [ 0, %for.cond1 ], !dbg !2240
    #dbg_value(i32 %col.0, !2243, !DIExpression(), !2244)
  %exitcond.not = icmp eq i32 %col.0, %k, !dbg !2245
  br i1 %exitcond.not, label %for.inc18, label %for.body6, !dbg !2247

for.body6:                                        ; preds = %for.cond4
  %mul = mul nsw i32 %j.0, %k, !dbg !2248
  %add7 = add nsw i32 %mul, %col.0, !dbg !2250
  %mul8 = mul nsw i32 %add7, %div, !dbg !2251
  %add.ptr = getelementptr inbounds i64, ptr %PS, i32 %mul8, !dbg !2252
  %mul9 = mul nsw i32 %row.0, %k, !dbg !2253
  %add10 = add nsw i32 %mul9, %col.0, !dbg !2254
  %mul11 = shl nsw i32 %add10, 4, !dbg !2255
  %mul12 = mul nsw i32 %row.0, %n, !dbg !2256
  %1 = getelementptr i8, ptr %S, i32 %mul12, !dbg !2257
  %arrayidx = getelementptr i8, ptr %1, i32 %j.0, !dbg !2257
  %2 = load i8, ptr %arrayidx, align 1, !dbg !2257
  %conv = zext i8 %2 to i32, !dbg !2257
  %add14 = add nsw i32 %mul11, %conv, !dbg !2258
  %mul15 = mul nsw i32 %add14, %div, !dbg !2259
  %add.ptr16 = getelementptr inbounds i64, ptr %accumulator, i32 %mul15, !dbg !2260
  call fastcc void @m_vec_add(i32 noundef %div, ptr noundef %add.ptr, ptr noundef nonnull %add.ptr16) #6, !dbg !2261
  %add17 = add nuw i32 %col.0, 1, !dbg !2262
    #dbg_value(i32 %add17, !2243, !DIExpression(), !2244)
  br label %for.cond4, !dbg !2263, !llvm.loop !2264

for.inc18:                                        ; preds = %for.cond4
  %inc = add nuw i32 %j.0, 1, !dbg !2266
    #dbg_value(i32 %inc, !2235, !DIExpression(), !2236)
  br label %for.cond1, !dbg !2267, !llvm.loop !2268

for.inc20:                                        ; preds = %for.cond1
  %inc21 = add nuw i32 %row.0, 1, !dbg !2270
    #dbg_value(i32 %inc21, !2223, !DIExpression(), !2225)
  br label %for.cond, !dbg !2271, !llvm.loop !2272

while.cond:                                       ; preds = %while.cond.preheader, %while.body
  %i.0 = phi i32 [ %inc32, %while.body ], [ 0, %while.cond.preheader ], !dbg !2209
    #dbg_value(i32 %i.0, !2274, !DIExpression(), !2209)
  %exitcond4.not = icmp eq i32 %i.0, %0, !dbg !2275
  br i1 %exitcond4.not, label %while.end, label %while.body, !dbg !2231

while.body:                                       ; preds = %while.cond
  %mul27 = shl nsw i32 %i.0, 4, !dbg !2276
  %mul28 = mul nsw i32 %mul27, %div, !dbg !2278
  %add.ptr29 = getelementptr inbounds i64, ptr %accumulator, i32 %mul28, !dbg !2279
  %mul30 = mul nsw i32 %i.0, %div, !dbg !2280
  %add.ptr31 = getelementptr inbounds i64, ptr %SPS, i32 %mul30, !dbg !2281
  call fastcc void @m_vec_multiply_bins(i32 noundef %div, ptr noundef nonnull %add.ptr29, ptr noundef %add.ptr31) #6, !dbg !2282
  %inc32 = add nuw i32 %i.0, 1, !dbg !2283
    #dbg_value(i32 %inc32, !2274, !DIExpression(), !2209)
  br label %while.cond, !dbg !2231, !llvm.loop !2284

while.end:                                        ; preds = %while.cond
  ret void, !dbg !2286
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_add(i32 noundef %m_vec_limbs, ptr noundef %in, ptr noundef %acc) unnamed_addr #0 !dbg !2287 {
entry:
    #dbg_value(i32 %m_vec_limbs, !2290, !DIExpression(), !2291)
    #dbg_value(ptr %in, !2292, !DIExpression(), !2291)
    #dbg_value(ptr %acc, !2293, !DIExpression(), !2291)
    #dbg_value(i32 0, !2294, !DIExpression(), !2296)
    #dbg_value(i32 0, !2294, !DIExpression(), !2296)
  %0 = load i64, ptr %in, align 8, !dbg !2297
  %1 = load i64, ptr %acc, align 8, !dbg !2300
  %xor = xor i64 %1, %0, !dbg !2300
  store i64 %xor, ptr %acc, align 8, !dbg !2300
    #dbg_value(i32 1, !2294, !DIExpression(), !2296)
  %arrayidx.1 = getelementptr inbounds nuw i8, ptr %in, i32 8, !dbg !2297
  %2 = load i64, ptr %arrayidx.1, align 8, !dbg !2297
  %arrayidx1.1 = getelementptr inbounds nuw i8, ptr %acc, i32 8, !dbg !2301
  %3 = load i64, ptr %arrayidx1.1, align 8, !dbg !2300
  %xor.1 = xor i64 %3, %2, !dbg !2300
  store i64 %xor.1, ptr %arrayidx1.1, align 8, !dbg !2300
    #dbg_value(i32 2, !2294, !DIExpression(), !2296)
  %arrayidx.2 = getelementptr inbounds nuw i8, ptr %in, i32 16, !dbg !2297
  %4 = load i64, ptr %arrayidx.2, align 8, !dbg !2297
  %arrayidx1.2 = getelementptr inbounds nuw i8, ptr %acc, i32 16, !dbg !2301
  %5 = load i64, ptr %arrayidx1.2, align 8, !dbg !2300
  %xor.2 = xor i64 %5, %4, !dbg !2300
  store i64 %xor.2, ptr %arrayidx1.2, align 8, !dbg !2300
    #dbg_value(i32 3, !2294, !DIExpression(), !2296)
  %arrayidx.3 = getelementptr inbounds nuw i8, ptr %in, i32 24, !dbg !2297
  %6 = load i64, ptr %arrayidx.3, align 8, !dbg !2297
  %arrayidx1.3 = getelementptr inbounds nuw i8, ptr %acc, i32 24, !dbg !2301
  %7 = load i64, ptr %arrayidx1.3, align 8, !dbg !2300
  %xor.3 = xor i64 %7, %6, !dbg !2300
  store i64 %xor.3, ptr %arrayidx1.3, align 8, !dbg !2300
    #dbg_value(i32 4, !2294, !DIExpression(), !2296)
  %arrayidx.4 = getelementptr inbounds nuw i8, ptr %in, i32 32, !dbg !2297
  %8 = load i64, ptr %arrayidx.4, align 8, !dbg !2297
  %arrayidx1.4 = getelementptr inbounds nuw i8, ptr %acc, i32 32, !dbg !2301
  %9 = load i64, ptr %arrayidx1.4, align 8, !dbg !2300
  %xor.4 = xor i64 %9, %8, !dbg !2300
  store i64 %xor.4, ptr %arrayidx1.4, align 8, !dbg !2300
    #dbg_value(i32 5, !2294, !DIExpression(), !2296)
  ret void, !dbg !2302
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_multiply_bins(i32 noundef %m_vec_limbs, ptr noundef %bins, ptr noundef %out) unnamed_addr #0 !dbg !2303 {
entry:
    #dbg_value(i32 %m_vec_limbs, !2306, !DIExpression(), !2307)
    #dbg_value(ptr %bins, !2308, !DIExpression(), !2307)
    #dbg_value(ptr %out, !2309, !DIExpression(), !2307)
  %add.ptr = getelementptr inbounds nuw i8, ptr %bins, i32 200, !dbg !2310
  %add.ptr1 = getelementptr inbounds nuw i8, ptr %bins, i32 400, !dbg !2311
  call fastcc void @m_vec_mul_add_x_inv(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr, ptr noundef nonnull %add.ptr1) #6, !dbg !2312
  %add.ptr2 = getelementptr inbounds nuw i8, ptr %bins, i32 440, !dbg !2313
  %add.ptr3 = getelementptr inbounds nuw i8, ptr %bins, i32 480, !dbg !2314
  call fastcc void @m_vec_mul_add_x(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr2, ptr noundef nonnull %add.ptr3) #6, !dbg !2315
  %add.ptr4 = getelementptr inbounds nuw i8, ptr %bins, i32 400, !dbg !2316
  %add.ptr5 = getelementptr inbounds nuw i8, ptr %bins, i32 280, !dbg !2317
  call fastcc void @m_vec_mul_add_x_inv(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr4, ptr noundef nonnull %add.ptr5) #6, !dbg !2318
  %add.ptr6 = getelementptr inbounds nuw i8, ptr %bins, i32 480, !dbg !2319
  %add.ptr7 = getelementptr inbounds nuw i8, ptr %bins, i32 240, !dbg !2320
  call fastcc void @m_vec_mul_add_x(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr6, ptr noundef nonnull %add.ptr7) #6, !dbg !2321
  %add.ptr8 = getelementptr inbounds nuw i8, ptr %bins, i32 280, !dbg !2322
  %add.ptr9 = getelementptr inbounds nuw i8, ptr %bins, i32 560, !dbg !2323
  call fastcc void @m_vec_mul_add_x_inv(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr8, ptr noundef nonnull %add.ptr9) #6, !dbg !2324
  %add.ptr10 = getelementptr inbounds nuw i8, ptr %bins, i32 240, !dbg !2325
  %add.ptr11 = getelementptr inbounds nuw i8, ptr %bins, i32 120, !dbg !2326
  call fastcc void @m_vec_mul_add_x(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr10, ptr noundef nonnull %add.ptr11) #6, !dbg !2327
  %add.ptr12 = getelementptr inbounds nuw i8, ptr %bins, i32 560, !dbg !2328
  %add.ptr13 = getelementptr inbounds nuw i8, ptr %bins, i32 600, !dbg !2329
  call fastcc void @m_vec_mul_add_x_inv(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr12, ptr noundef nonnull %add.ptr13) #6, !dbg !2330
  %add.ptr14 = getelementptr inbounds nuw i8, ptr %bins, i32 120, !dbg !2331
  %add.ptr15 = getelementptr inbounds nuw i8, ptr %bins, i32 320, !dbg !2332
  call fastcc void @m_vec_mul_add_x(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr14, ptr noundef nonnull %add.ptr15) #6, !dbg !2333
  %add.ptr16 = getelementptr inbounds nuw i8, ptr %bins, i32 600, !dbg !2334
  %add.ptr17 = getelementptr inbounds nuw i8, ptr %bins, i32 520, !dbg !2335
  call fastcc void @m_vec_mul_add_x_inv(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr16, ptr noundef nonnull %add.ptr17) #6, !dbg !2336
  %add.ptr18 = getelementptr inbounds nuw i8, ptr %bins, i32 320, !dbg !2337
  %add.ptr19 = getelementptr inbounds nuw i8, ptr %bins, i32 160, !dbg !2338
  call fastcc void @m_vec_mul_add_x(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr18, ptr noundef nonnull %add.ptr19) #6, !dbg !2339
  %add.ptr20 = getelementptr inbounds nuw i8, ptr %bins, i32 520, !dbg !2340
  %add.ptr21 = getelementptr inbounds nuw i8, ptr %bins, i32 360, !dbg !2341
  call fastcc void @m_vec_mul_add_x_inv(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr20, ptr noundef nonnull %add.ptr21) #6, !dbg !2342
  %add.ptr22 = getelementptr inbounds nuw i8, ptr %bins, i32 160, !dbg !2343
  %add.ptr23 = getelementptr inbounds nuw i8, ptr %bins, i32 80, !dbg !2344
  call fastcc void @m_vec_mul_add_x(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr22, ptr noundef nonnull %add.ptr23) #6, !dbg !2345
  %add.ptr24 = getelementptr inbounds nuw i8, ptr %bins, i32 360, !dbg !2346
  %add.ptr25 = getelementptr inbounds nuw i8, ptr %bins, i32 40, !dbg !2347
  call fastcc void @m_vec_mul_add_x_inv(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr24, ptr noundef nonnull %add.ptr25) #6, !dbg !2348
  %add.ptr26 = getelementptr inbounds nuw i8, ptr %bins, i32 80, !dbg !2349
  %add.ptr27 = getelementptr inbounds nuw i8, ptr %bins, i32 40, !dbg !2350
  call fastcc void @m_vec_mul_add_x(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr26, ptr noundef nonnull %add.ptr27) #6, !dbg !2351
  %add.ptr28 = getelementptr inbounds nuw i8, ptr %bins, i32 40, !dbg !2352
  call fastcc void @m_vec_copy(i32 noundef %m_vec_limbs, ptr noundef nonnull %add.ptr28, ptr noundef %out) #6, !dbg !2353
  ret void, !dbg !2354
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_mul_add_x_inv(i32 noundef %m_vec_limbs, ptr noundef %in, ptr noundef %acc) unnamed_addr #0 !dbg !2355 {
entry:
    #dbg_value(i32 %m_vec_limbs, !2356, !DIExpression(), !2357)
    #dbg_value(ptr %in, !2358, !DIExpression(), !2357)
    #dbg_value(ptr %acc, !2359, !DIExpression(), !2357)
    #dbg_value(i64 1229782938247303441, !2360, !DIExpression(), !2357)
    #dbg_value(i32 0, !2361, !DIExpression(), !2363)
    #dbg_value(i32 0, !2361, !DIExpression(), !2363)
  %0 = load i64, ptr %in, align 8, !dbg !2364
  %and = and i64 %0, 1229782938247303441, !dbg !2367
    #dbg_value(i64 %and, !2368, !DIExpression(), !2369)
  %xor = lshr i64 %0, 1, !dbg !2370
  %shr = and i64 %xor, 8608480567731124087, !dbg !2370
  %mul = mul nuw i64 %and, 9, !dbg !2371
  %xor2 = xor i64 %shr, %mul, !dbg !2372
  %1 = load i64, ptr %acc, align 8, !dbg !2373
  %xor4 = xor i64 %1, %xor2, !dbg !2373
  store i64 %xor4, ptr %acc, align 8, !dbg !2373
    #dbg_value(i32 1, !2361, !DIExpression(), !2363)
  %arrayidx.1 = getelementptr inbounds nuw i8, ptr %in, i32 8, !dbg !2364
  %2 = load i64, ptr %arrayidx.1, align 8, !dbg !2364
  %and.1 = and i64 %2, 1229782938247303441, !dbg !2367
    #dbg_value(i64 %and.1, !2368, !DIExpression(), !2369)
  %xor.1 = lshr i64 %2, 1, !dbg !2370
  %shr.1 = and i64 %xor.1, 8608480567731124087, !dbg !2370
  %mul.1 = mul nuw i64 %and.1, 9, !dbg !2371
  %xor2.1 = xor i64 %shr.1, %mul.1, !dbg !2372
  %arrayidx3.1 = getelementptr inbounds nuw i8, ptr %acc, i32 8, !dbg !2374
  %3 = load i64, ptr %arrayidx3.1, align 8, !dbg !2373
  %xor4.1 = xor i64 %3, %xor2.1, !dbg !2373
  store i64 %xor4.1, ptr %arrayidx3.1, align 8, !dbg !2373
    #dbg_value(i32 2, !2361, !DIExpression(), !2363)
  %arrayidx.2 = getelementptr inbounds nuw i8, ptr %in, i32 16, !dbg !2364
  %4 = load i64, ptr %arrayidx.2, align 8, !dbg !2364
  %and.2 = and i64 %4, 1229782938247303441, !dbg !2367
    #dbg_value(i64 %and.2, !2368, !DIExpression(), !2369)
  %xor.2 = lshr i64 %4, 1, !dbg !2370
  %shr.2 = and i64 %xor.2, 8608480567731124087, !dbg !2370
  %mul.2 = mul nuw i64 %and.2, 9, !dbg !2371
  %xor2.2 = xor i64 %shr.2, %mul.2, !dbg !2372
  %arrayidx3.2 = getelementptr inbounds nuw i8, ptr %acc, i32 16, !dbg !2374
  %5 = load i64, ptr %arrayidx3.2, align 8, !dbg !2373
  %xor4.2 = xor i64 %5, %xor2.2, !dbg !2373
  store i64 %xor4.2, ptr %arrayidx3.2, align 8, !dbg !2373
    #dbg_value(i32 3, !2361, !DIExpression(), !2363)
  %arrayidx.3 = getelementptr inbounds nuw i8, ptr %in, i32 24, !dbg !2364
  %6 = load i64, ptr %arrayidx.3, align 8, !dbg !2364
  %and.3 = and i64 %6, 1229782938247303441, !dbg !2367
    #dbg_value(i64 %and.3, !2368, !DIExpression(), !2369)
  %xor.3 = lshr i64 %6, 1, !dbg !2370
  %shr.3 = and i64 %xor.3, 8608480567731124087, !dbg !2370
  %mul.3 = mul nuw i64 %and.3, 9, !dbg !2371
  %xor2.3 = xor i64 %shr.3, %mul.3, !dbg !2372
  %arrayidx3.3 = getelementptr inbounds nuw i8, ptr %acc, i32 24, !dbg !2374
  %7 = load i64, ptr %arrayidx3.3, align 8, !dbg !2373
  %xor4.3 = xor i64 %7, %xor2.3, !dbg !2373
  store i64 %xor4.3, ptr %arrayidx3.3, align 8, !dbg !2373
    #dbg_value(i32 4, !2361, !DIExpression(), !2363)
  %arrayidx.4 = getelementptr inbounds nuw i8, ptr %in, i32 32, !dbg !2364
  %8 = load i64, ptr %arrayidx.4, align 8, !dbg !2364
  %and.4 = and i64 %8, 1229782938247303441, !dbg !2367
    #dbg_value(i64 %and.4, !2368, !DIExpression(), !2369)
  %xor.4 = lshr i64 %8, 1, !dbg !2370
  %shr.4 = and i64 %xor.4, 8608480567731124087, !dbg !2370
  %mul.4 = mul nuw i64 %and.4, 9, !dbg !2371
  %xor2.4 = xor i64 %shr.4, %mul.4, !dbg !2372
  %arrayidx3.4 = getelementptr inbounds nuw i8, ptr %acc, i32 32, !dbg !2374
  %9 = load i64, ptr %arrayidx3.4, align 8, !dbg !2373
  %xor4.4 = xor i64 %9, %xor2.4, !dbg !2373
  store i64 %xor4.4, ptr %arrayidx3.4, align 8, !dbg !2373
    #dbg_value(i32 5, !2361, !DIExpression(), !2363)
  ret void, !dbg !2375
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_mul_add_x(i32 noundef %m_vec_limbs, ptr noundef %in, ptr noundef %acc) unnamed_addr #0 !dbg !2376 {
entry:
    #dbg_value(i32 %m_vec_limbs, !2377, !DIExpression(), !2378)
    #dbg_value(ptr %in, !2379, !DIExpression(), !2378)
    #dbg_value(ptr %acc, !2380, !DIExpression(), !2378)
    #dbg_value(i64 -8608480567731124088, !2381, !DIExpression(), !2378)
    #dbg_value(i32 0, !2382, !DIExpression(), !2384)
    #dbg_value(i32 0, !2382, !DIExpression(), !2384)
  %0 = load i64, ptr %in, align 8, !dbg !2385
    #dbg_value(i64 %0, !2388, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2389)
  %xor = shl i64 %0, 1, !dbg !2390
  %shl = and i64 %xor, -1229782938247303442, !dbg !2390
  %and = lshr i64 %0, 3, !dbg !2391
  %shr = and i64 %and, 1229782938247303441, !dbg !2391
  %mul = mul nuw nsw i64 %shr, 3, !dbg !2392
  %xor2 = xor i64 %shl, %mul, !dbg !2393
  %1 = load i64, ptr %acc, align 8, !dbg !2394
  %xor4 = xor i64 %1, %xor2, !dbg !2394
  store i64 %xor4, ptr %acc, align 8, !dbg !2394
    #dbg_value(i32 1, !2382, !DIExpression(), !2384)
  %arrayidx.1 = getelementptr inbounds nuw i8, ptr %in, i32 8, !dbg !2385
  %2 = load i64, ptr %arrayidx.1, align 8, !dbg !2385
    #dbg_value(i64 %2, !2388, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2389)
  %xor.1 = shl i64 %2, 1, !dbg !2390
  %shl.1 = and i64 %xor.1, -1229782938247303442, !dbg !2390
  %and.1 = lshr i64 %2, 3, !dbg !2391
  %shr.1 = and i64 %and.1, 1229782938247303441, !dbg !2391
  %mul.1 = mul nuw nsw i64 %shr.1, 3, !dbg !2392
  %xor2.1 = xor i64 %shl.1, %mul.1, !dbg !2393
  %arrayidx3.1 = getelementptr inbounds nuw i8, ptr %acc, i32 8, !dbg !2395
  %3 = load i64, ptr %arrayidx3.1, align 8, !dbg !2394
  %xor4.1 = xor i64 %3, %xor2.1, !dbg !2394
  store i64 %xor4.1, ptr %arrayidx3.1, align 8, !dbg !2394
    #dbg_value(i32 2, !2382, !DIExpression(), !2384)
  %arrayidx.2 = getelementptr inbounds nuw i8, ptr %in, i32 16, !dbg !2385
  %4 = load i64, ptr %arrayidx.2, align 8, !dbg !2385
    #dbg_value(i64 %4, !2388, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2389)
  %xor.2 = shl i64 %4, 1, !dbg !2390
  %shl.2 = and i64 %xor.2, -1229782938247303442, !dbg !2390
  %and.2 = lshr i64 %4, 3, !dbg !2391
  %shr.2 = and i64 %and.2, 1229782938247303441, !dbg !2391
  %mul.2 = mul nuw nsw i64 %shr.2, 3, !dbg !2392
  %xor2.2 = xor i64 %shl.2, %mul.2, !dbg !2393
  %arrayidx3.2 = getelementptr inbounds nuw i8, ptr %acc, i32 16, !dbg !2395
  %5 = load i64, ptr %arrayidx3.2, align 8, !dbg !2394
  %xor4.2 = xor i64 %5, %xor2.2, !dbg !2394
  store i64 %xor4.2, ptr %arrayidx3.2, align 8, !dbg !2394
    #dbg_value(i32 3, !2382, !DIExpression(), !2384)
  %arrayidx.3 = getelementptr inbounds nuw i8, ptr %in, i32 24, !dbg !2385
  %6 = load i64, ptr %arrayidx.3, align 8, !dbg !2385
    #dbg_value(i64 %6, !2388, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2389)
  %xor.3 = shl i64 %6, 1, !dbg !2390
  %shl.3 = and i64 %xor.3, -1229782938247303442, !dbg !2390
  %and.3 = lshr i64 %6, 3, !dbg !2391
  %shr.3 = and i64 %and.3, 1229782938247303441, !dbg !2391
  %mul.3 = mul nuw nsw i64 %shr.3, 3, !dbg !2392
  %xor2.3 = xor i64 %shl.3, %mul.3, !dbg !2393
  %arrayidx3.3 = getelementptr inbounds nuw i8, ptr %acc, i32 24, !dbg !2395
  %7 = load i64, ptr %arrayidx3.3, align 8, !dbg !2394
  %xor4.3 = xor i64 %7, %xor2.3, !dbg !2394
  store i64 %xor4.3, ptr %arrayidx3.3, align 8, !dbg !2394
    #dbg_value(i32 4, !2382, !DIExpression(), !2384)
  %arrayidx.4 = getelementptr inbounds nuw i8, ptr %in, i32 32, !dbg !2385
  %8 = load i64, ptr %arrayidx.4, align 8, !dbg !2385
    #dbg_value(i64 %8, !2388, !DIExpression(DW_OP_constu, 9838263505978427528, DW_OP_and, DW_OP_stack_value), !2389)
  %xor.4 = shl i64 %8, 1, !dbg !2390
  %shl.4 = and i64 %xor.4, -1229782938247303442, !dbg !2390
  %and.4 = lshr i64 %8, 3, !dbg !2391
  %shr.4 = and i64 %and.4, 1229782938247303441, !dbg !2391
  %mul.4 = mul nuw nsw i64 %shr.4, 3, !dbg !2392
  %xor2.4 = xor i64 %shl.4, %mul.4, !dbg !2393
  %arrayidx3.4 = getelementptr inbounds nuw i8, ptr %acc, i32 32, !dbg !2395
  %9 = load i64, ptr %arrayidx3.4, align 8, !dbg !2394
  %xor4.4 = xor i64 %9, %xor2.4, !dbg !2394
  store i64 %xor4.4, ptr %arrayidx3.4, align 8, !dbg !2394
    #dbg_value(i32 5, !2382, !DIExpression(), !2384)
  ret void, !dbg !2396
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_copy(i32 noundef %m_vec_limbs, ptr noundef %in, ptr noundef %out) unnamed_addr #0 !dbg !2397 {
entry:
    #dbg_value(i32 %m_vec_limbs, !2398, !DIExpression(), !2399)
    #dbg_value(ptr %in, !2400, !DIExpression(), !2399)
    #dbg_value(ptr %out, !2401, !DIExpression(), !2399)
    #dbg_value(i32 0, !2402, !DIExpression(), !2404)
    #dbg_value(i32 0, !2402, !DIExpression(), !2404)
  %0 = load i64, ptr %in, align 8, !dbg !2405
  store i64 %0, ptr %out, align 8, !dbg !2408
    #dbg_value(i32 1, !2402, !DIExpression(), !2404)
  %arrayidx.1 = getelementptr inbounds nuw i8, ptr %in, i32 8, !dbg !2405
  %1 = load i64, ptr %arrayidx.1, align 8, !dbg !2405
  %arrayidx1.1 = getelementptr inbounds nuw i8, ptr %out, i32 8, !dbg !2409
  store i64 %1, ptr %arrayidx1.1, align 8, !dbg !2408
    #dbg_value(i32 2, !2402, !DIExpression(), !2404)
  %arrayidx.2 = getelementptr inbounds nuw i8, ptr %in, i32 16, !dbg !2405
  %2 = load i64, ptr %arrayidx.2, align 8, !dbg !2405
  %arrayidx1.2 = getelementptr inbounds nuw i8, ptr %out, i32 16, !dbg !2409
  store i64 %2, ptr %arrayidx1.2, align 8, !dbg !2408
    #dbg_value(i32 3, !2402, !DIExpression(), !2404)
  %arrayidx.3 = getelementptr inbounds nuw i8, ptr %in, i32 24, !dbg !2405
  %3 = load i64, ptr %arrayidx.3, align 8, !dbg !2405
  %arrayidx1.3 = getelementptr inbounds nuw i8, ptr %out, i32 24, !dbg !2409
  store i64 %3, ptr %arrayidx1.3, align 8, !dbg !2408
    #dbg_value(i32 4, !2402, !DIExpression(), !2404)
  %arrayidx.4 = getelementptr inbounds nuw i8, ptr %in, i32 32, !dbg !2405
  %4 = load i64, ptr %arrayidx.4, align 8, !dbg !2405
  %arrayidx1.4 = getelementptr inbounds nuw i8, ptr %out, i32 32, !dbg !2409
  store i64 %4, ptr %arrayidx1.4, align 8, !dbg !2408
    #dbg_value(i32 5, !2402, !DIExpression(), !2404)
  ret void, !dbg !2410
}

; Function Attrs: nounwind
define dso_local void @pqmayo_MAYO_1_ref_m_upper(ptr noundef %p, ptr noundef %in, ptr noundef %out, i32 noundef %size) local_unnamed_addr #0 !dbg !2411 {
entry:
    #dbg_value(ptr %p, !2442, !DIExpression(), !2443)
    #dbg_value(ptr %in, !2444, !DIExpression(), !2443)
    #dbg_value(ptr %out, !2445, !DIExpression(), !2443)
    #dbg_value(i32 %size, !2446, !DIExpression(), !2443)
    #dbg_value(i32 5, !2447, !DIExpression(), !2443)
    #dbg_value(i32 0, !2448, !DIExpression(), !2443)
    #dbg_value(i32 0, !2449, !DIExpression(), !2451)
  %smax = call i32 @llvm.smax.i32(i32 %size, i32 0), !dbg !2452
  br label %for.cond, !dbg !2452

for.cond:                                         ; preds = %for.inc15, %entry
  %indvars.iv = phi i32 [ %indvars.iv.next, %for.inc15 ], [ %size, %entry ], !dbg !2453
  %m_vecs_stored.0 = phi i32 [ %m_vecs_stored.1, %for.inc15 ], [ 0, %entry ], !dbg !2453
  %r.0 = phi i32 [ %inc16, %for.inc15 ], [ 0, %entry ], !dbg !2454
    #dbg_value(i32 %r.0, !2449, !DIExpression(), !2451)
    #dbg_value(i32 %m_vecs_stored.0, !2448, !DIExpression(), !2443)
  %exitcond1.not = icmp eq i32 %r.0, %smax, !dbg !2455
  br i1 %exitcond1.not, label %for.end17, label %for.cond1.preheader, !dbg !2457

for.cond1.preheader:                              ; preds = %for.cond
  %0 = add i32 %m_vecs_stored.0, %indvars.iv, !dbg !2458
  br label %for.cond1, !dbg !2458

for.cond1:                                        ; preds = %for.cond1.preheader, %for.inc
  %m_vecs_stored.1 = phi i32 [ %inc, %for.inc ], [ %m_vecs_stored.0, %for.cond1.preheader ], !dbg !2443
  %c.0 = phi i32 [ %inc14, %for.inc ], [ %r.0, %for.cond1.preheader ], !dbg !2461
    #dbg_value(i32 %c.0, !2462, !DIExpression(), !2463)
    #dbg_value(i32 %m_vecs_stored.1, !2448, !DIExpression(), !2443)
  %exitcond.not = icmp eq i32 %m_vecs_stored.1, %0, !dbg !2464
  br i1 %exitcond.not, label %for.inc15, label %for.body3, !dbg !2458

for.body3:                                        ; preds = %for.cond1
  %mul = mul nsw i32 %r.0, %size, !dbg !2466
  %add = add nsw i32 %mul, %c.0, !dbg !2468
  %add.ptr.idx = mul nsw i32 %add, 40, !dbg !2469
  %add.ptr = getelementptr inbounds i8, ptr %in, i32 %add.ptr.idx, !dbg !2469
  %add.ptr6.idx = mul nsw i32 %m_vecs_stored.1, 40, !dbg !2470
  %add.ptr6 = getelementptr inbounds i8, ptr %out, i32 %add.ptr6.idx, !dbg !2470
  call fastcc void @m_vec_copy.17(i32 noundef 5, ptr noundef %add.ptr, ptr noundef %add.ptr6) #6, !dbg !2471
  %cmp7.not = icmp eq i32 %r.0, %c.0, !dbg !2472
  br i1 %cmp7.not, label %for.inc, label %if.then, !dbg !2472

if.then:                                          ; preds = %for.body3
  %mul8 = mul nsw i32 %c.0, %size, !dbg !2474
  %add9 = add nsw i32 %mul8, %r.0, !dbg !2476
  %add.ptr11.idx = mul nsw i32 %add9, 40, !dbg !2477
  %add.ptr11 = getelementptr inbounds i8, ptr %in, i32 %add.ptr11.idx, !dbg !2477
  %add.ptr13.idx = mul nsw i32 %m_vecs_stored.1, 40, !dbg !2478
  %add.ptr13 = getelementptr inbounds i8, ptr %out, i32 %add.ptr13.idx, !dbg !2478
  call fastcc void @m_vec_add.18(i32 noundef 5, ptr noundef %add.ptr11, ptr noundef %add.ptr13) #6, !dbg !2479
  br label %for.inc, !dbg !2480

for.inc:                                          ; preds = %for.body3, %if.then
    #dbg_value(i32 %m_vecs_stored.1, !2448, !DIExpression(DW_OP_plus_uconst, 1, DW_OP_stack_value), !2443)
  %inc = add i32 %m_vecs_stored.1, 1, !dbg !2481
    #dbg_value(i32 %inc, !2448, !DIExpression(), !2443)
  %inc14 = add nuw nsw i32 %c.0, 1, !dbg !2482
    #dbg_value(i32 %inc14, !2462, !DIExpression(), !2463)
  br label %for.cond1, !dbg !2483, !llvm.loop !2484

for.inc15:                                        ; preds = %for.cond1
  %inc16 = add nuw i32 %r.0, 1, !dbg !2486
    #dbg_value(i32 %inc16, !2449, !DIExpression(), !2451)
  %indvars.iv.next = add i32 %indvars.iv, -1, !dbg !2487
  br label %for.cond, !dbg !2487, !llvm.loop !2488

for.end17:                                        ; preds = %for.cond
  ret void, !dbg !2490
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_copy.17(i32 noundef %m_vec_limbs, ptr noundef %in, ptr noundef %out) unnamed_addr #0 !dbg !2491 {
entry:
    #dbg_value(i32 %m_vec_limbs, !2492, !DIExpression(), !2493)
    #dbg_value(ptr %in, !2494, !DIExpression(), !2493)
    #dbg_value(ptr %out, !2495, !DIExpression(), !2493)
    #dbg_value(i32 0, !2496, !DIExpression(), !2498)
    #dbg_value(i32 0, !2496, !DIExpression(), !2498)
  %0 = load i64, ptr %in, align 8, !dbg !2499
  store i64 %0, ptr %out, align 8, !dbg !2502
    #dbg_value(i32 1, !2496, !DIExpression(), !2498)
  %arrayidx.1 = getelementptr inbounds nuw i8, ptr %in, i32 8, !dbg !2499
  %1 = load i64, ptr %arrayidx.1, align 8, !dbg !2499
  %arrayidx1.1 = getelementptr inbounds nuw i8, ptr %out, i32 8, !dbg !2503
  store i64 %1, ptr %arrayidx1.1, align 8, !dbg !2502
    #dbg_value(i32 2, !2496, !DIExpression(), !2498)
  %arrayidx.2 = getelementptr inbounds nuw i8, ptr %in, i32 16, !dbg !2499
  %2 = load i64, ptr %arrayidx.2, align 8, !dbg !2499
  %arrayidx1.2 = getelementptr inbounds nuw i8, ptr %out, i32 16, !dbg !2503
  store i64 %2, ptr %arrayidx1.2, align 8, !dbg !2502
    #dbg_value(i32 3, !2496, !DIExpression(), !2498)
  %arrayidx.3 = getelementptr inbounds nuw i8, ptr %in, i32 24, !dbg !2499
  %3 = load i64, ptr %arrayidx.3, align 8, !dbg !2499
  %arrayidx1.3 = getelementptr inbounds nuw i8, ptr %out, i32 24, !dbg !2503
  store i64 %3, ptr %arrayidx1.3, align 8, !dbg !2502
    #dbg_value(i32 4, !2496, !DIExpression(), !2498)
  %arrayidx.4 = getelementptr inbounds nuw i8, ptr %in, i32 32, !dbg !2499
  %4 = load i64, ptr %arrayidx.4, align 8, !dbg !2499
  %arrayidx1.4 = getelementptr inbounds nuw i8, ptr %out, i32 32, !dbg !2503
  store i64 %4, ptr %arrayidx1.4, align 8, !dbg !2502
    #dbg_value(i32 5, !2496, !DIExpression(), !2498)
  ret void, !dbg !2504
}

; Function Attrs: nounwind
define internal fastcc void @m_vec_add.18(i32 noundef %m_vec_limbs, ptr noundef %in, ptr noundef %acc) unnamed_addr #0 !dbg !2505 {
entry:
    #dbg_value(i32 %m_vec_limbs, !2506, !DIExpression(), !2507)
    #dbg_value(ptr %in, !2508, !DIExpression(), !2507)
    #dbg_value(ptr %acc, !2509, !DIExpression(), !2507)
    #dbg_value(i32 0, !2510, !DIExpression(), !2512)
    #dbg_value(i32 0, !2510, !DIExpression(), !2512)
  %0 = load i64, ptr %in, align 8, !dbg !2513
  %1 = load i64, ptr %acc, align 8, !dbg !2516
  %xor = xor i64 %1, %0, !dbg !2516
  store i64 %xor, ptr %acc, align 8, !dbg !2516
    #dbg_value(i32 1, !2510, !DIExpression(), !2512)
  %arrayidx.1 = getelementptr inbounds nuw i8, ptr %in, i32 8, !dbg !2513
  %2 = load i64, ptr %arrayidx.1, align 8, !dbg !2513
  %arrayidx1.1 = getelementptr inbounds nuw i8, ptr %acc, i32 8, !dbg !2517
  %3 = load i64, ptr %arrayidx1.1, align 8, !dbg !2516
  %xor.1 = xor i64 %3, %2, !dbg !2516
  store i64 %xor.1, ptr %arrayidx1.1, align 8, !dbg !2516
    #dbg_value(i32 2, !2510, !DIExpression(), !2512)
  %arrayidx.2 = getelementptr inbounds nuw i8, ptr %in, i32 16, !dbg !2513
  %4 = load i64, ptr %arrayidx.2, align 8, !dbg !2513
  %arrayidx1.2 = getelementptr inbounds nuw i8, ptr %acc, i32 16, !dbg !2517
  %5 = load i64, ptr %arrayidx1.2, align 8, !dbg !2516
  %xor.2 = xor i64 %5, %4, !dbg !2516
  store i64 %xor.2, ptr %arrayidx1.2, align 8, !dbg !2516
    #dbg_value(i32 3, !2510, !DIExpression(), !2512)
  %arrayidx.3 = getelementptr inbounds nuw i8, ptr %in, i32 24, !dbg !2513
  %6 = load i64, ptr %arrayidx.3, align 8, !dbg !2513
  %arrayidx1.3 = getelementptr inbounds nuw i8, ptr %acc, i32 24, !dbg !2517
  %7 = load i64, ptr %arrayidx1.3, align 8, !dbg !2516
  %xor.3 = xor i64 %7, %6, !dbg !2516
  store i64 %xor.3, ptr %arrayidx1.3, align 8, !dbg !2516
    #dbg_value(i32 4, !2510, !DIExpression(), !2512)
  %arrayidx.4 = getelementptr inbounds nuw i8, ptr %in, i32 32, !dbg !2513
  %8 = load i64, ptr %arrayidx.4, align 8, !dbg !2513
  %arrayidx1.4 = getelementptr inbounds nuw i8, ptr %acc, i32 32, !dbg !2517
  %9 = load i64, ptr %arrayidx1.4, align 8, !dbg !2516
  %xor.4 = xor i64 %9, %8, !dbg !2516
  store i64 %xor.4, ptr %arrayidx1.4, align 8, !dbg !2516
    #dbg_value(i32 5, !2510, !DIExpression(), !2512)
  ret void, !dbg !2518
}

; Function Attrs: nounwind
define dso_local range(i32 0, 2) i32 @pqmayo_MAYO_1_ref_sample_solution(ptr noundef %p, ptr noundef %A, ptr noundef %y, ptr noundef %r, ptr noundef %x, i32 noundef %k, i32 noundef %o, i32 noundef %m, i32 noundef %A_cols) local_unnamed_addr #0 !dbg !2519 {
entry:
  %Ar = alloca [78 x i8], align 1
    #dbg_value(ptr %p, !2522, !DIExpression(), !2523)
    #dbg_value(ptr %A, !2524, !DIExpression(), !2523)
    #dbg_value(ptr %y, !2525, !DIExpression(), !2523)
    #dbg_value(ptr %r, !2526, !DIExpression(), !2523)
    #dbg_value(ptr %x, !2527, !DIExpression(), !2523)
    #dbg_value(i32 %k, !2528, !DIExpression(), !2523)
    #dbg_value(i32 %o, !2529, !DIExpression(), !2523)
    #dbg_value(i32 %m, !2530, !DIExpression(), !2523)
    #dbg_value(i32 %A_cols, !2531, !DIExpression(), !2523)
    #dbg_value(i32 0, !2532, !DIExpression(), !2534)
  %0 = mul nsw i32 %o, %k, !dbg !2535
  %smax = call i32 @llvm.smax.i32(i32 %0, i32 0), !dbg !2535
  br label %for.cond, !dbg !2535

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2536
    #dbg_value(i32 %i.0, !2532, !DIExpression(), !2534)
  %exitcond.not = icmp eq i32 %i.0, %smax, !dbg !2537
  br i1 %exitcond.not, label %for.cond3.preheader, label %for.body, !dbg !2539

for.cond3.preheader:                              ; preds = %for.cond
  %smax13 = call i32 @llvm.smax.i32(i32 %m, i32 0), !dbg !2540
  br label %for.cond3, !dbg !2540

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %r, i32 %i.0, !dbg !2542
  %1 = load i8, ptr %arrayidx, align 1, !dbg !2542
  %arrayidx1 = getelementptr inbounds nuw i8, ptr %x, i32 %i.0, !dbg !2544
  store i8 %1, ptr %arrayidx1, align 1, !dbg !2545
  %inc = add nuw i32 %i.0, 1, !dbg !2546
    #dbg_value(i32 %inc, !2532, !DIExpression(), !2534)
  br label %for.cond, !dbg !2547, !llvm.loop !2548

for.cond3:                                        ; preds = %for.cond3.preheader, %for.body5
  %i2.0 = phi i32 [ %inc12, %for.body5 ], [ 0, %for.cond3.preheader ], !dbg !2550
    #dbg_value(i32 %i2.0, !2551, !DIExpression(), !2552)
  %exitcond14.not = icmp eq i32 %i2.0, %smax13, !dbg !2553
  br i1 %exitcond14.not, label %for.end13, label %for.body5, !dbg !2540

for.body5:                                        ; preds = %for.cond3
  %mul6 = mul nsw i32 %k, %o, !dbg !2555
  %mul7 = mul nsw i32 %k, %o, !dbg !2557
  %add = add nsw i32 %mul7, 1, !dbg !2558
  %mul8 = mul nsw i32 %i2.0, %add, !dbg !2559
  %2 = getelementptr i8, ptr %A, i32 %mul6, !dbg !2560
  %arrayidx10 = getelementptr i8, ptr %2, i32 %mul8, !dbg !2560
  store i8 0, ptr %arrayidx10, align 1, !dbg !2561
  %inc12 = add nuw i32 %i2.0, 1, !dbg !2562
    #dbg_value(i32 %inc12, !2551, !DIExpression(), !2552)
  br label %for.cond3, !dbg !2563, !llvm.loop !2564

for.end13:                                        ; preds = %for.cond3
  %mul14 = mul nsw i32 %k, %o, !dbg !2566
  %add15 = add nsw i32 %mul14, 1, !dbg !2567
  call fastcc void @mat_mul.21(ptr noundef %A, ptr noundef %r, ptr noundef nonnull %Ar, i32 noundef %add15, i32 noundef %m, i32 noundef 1) #6, !dbg !2568
    #dbg_value(i32 0, !2569, !DIExpression(), !2571)
  br label %for.cond17, !dbg !2572

for.cond17:                                       ; preds = %for.body19, %for.end13
  %i16.0 = phi i32 [ 0, %for.end13 ], [ %inc29, %for.body19 ], !dbg !2573
    #dbg_value(i32 %i16.0, !2569, !DIExpression(), !2571)
  %exitcond15.not = icmp eq i32 %i16.0, %smax13, !dbg !2574
  br i1 %exitcond15.not, label %for.end30, label %for.body19, !dbg !2576

for.body19:                                       ; preds = %for.cond17
  %arrayidx20 = getelementptr inbounds nuw i8, ptr %y, i32 %i16.0, !dbg !2577
  %3 = load i8, ptr %arrayidx20, align 1, !dbg !2577
  %arrayidx21 = getelementptr inbounds nuw [78 x i8], ptr %Ar, i32 0, i32 %i16.0, !dbg !2579
  %4 = load i8, ptr %arrayidx21, align 1, !dbg !2579
  %call = call fastcc zeroext i8 @sub_f(i8 noundef zeroext %3, i8 noundef zeroext %4) #6, !dbg !2580
  %mul22 = mul nsw i32 %k, %o, !dbg !2581
  %mul23 = mul nsw i32 %k, %o, !dbg !2582
  %add24 = add nsw i32 %mul23, 1, !dbg !2583
  %mul25 = mul nsw i32 %i16.0, %add24, !dbg !2584
  %5 = getelementptr i8, ptr %A, i32 %mul22, !dbg !2585
  %arrayidx27 = getelementptr i8, ptr %5, i32 %mul25, !dbg !2585
  store i8 %call, ptr %arrayidx27, align 1, !dbg !2586
  %inc29 = add nuw i32 %i16.0, 1, !dbg !2587
    #dbg_value(i32 %inc29, !2569, !DIExpression(), !2571)
  br label %for.cond17, !dbg !2588, !llvm.loop !2589

for.end30:                                        ; preds = %for.cond17
  %mul31 = mul nsw i32 %k, %o, !dbg !2591
  %add32 = add nsw i32 %mul31, 1, !dbg !2592
  call fastcc void @EF(ptr noundef %A, i32 noundef %m, i32 noundef %add32) #6, !dbg !2593
    #dbg_value(i8 0, !2594, !DIExpression(), !2523)
    #dbg_value(i32 0, !2595, !DIExpression(), !2597)
  %6 = add i32 %A_cols, -1, !dbg !2598
  %smax16 = call i32 @llvm.smax.i32(i32 %6, i32 0), !dbg !2598
  br label %for.cond34, !dbg !2598

for.cond34:                                       ; preds = %for.inc43, %for.end30
  %full_rank.0 = phi i8 [ 0, %for.end30 ], [ %or12, %for.inc43 ], !dbg !2523
  %i33.0 = phi i32 [ 0, %for.end30 ], [ %inc44, %for.inc43 ], !dbg !2599
    #dbg_value(i32 %i33.0, !2595, !DIExpression(), !2597)
    #dbg_value(i8 %full_rank.0, !2594, !DIExpression(), !2523)
  %exitcond17.not = icmp eq i32 %i33.0, %smax16, !dbg !2600
  br i1 %exitcond17.not, label %for.end45, label %for.inc43, !dbg !2602

for.inc43:                                        ; preds = %for.cond34
    #dbg_value(!DIArgList(i8 poison, i8 poison), !2594, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !2523)
  %sub37 = add nsw i32 %m, -1, !dbg !2603
  %mul38 = mul nsw i32 %sub37, %A_cols, !dbg !2605
  %7 = getelementptr i8, ptr %A, i32 %mul38, !dbg !2606
  %arrayidx40 = getelementptr i8, ptr %7, i32 %i33.0, !dbg !2606
  %8 = load i8, ptr %arrayidx40, align 1, !dbg !2606
    #dbg_value(!DIArgList(i8 %full_rank.0, i8 %8), !2594, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !2523)
  %or12 = or i8 %full_rank.0, %8, !dbg !2607
    #dbg_value(i8 %or12, !2594, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !2523)
    #dbg_value(i8 %or12, !2594, !DIExpression(), !2523)
  %inc44 = add nuw i32 %i33.0, 1, !dbg !2608
    #dbg_value(i32 %inc44, !2595, !DIExpression(), !2597)
  br label %for.cond34, !dbg !2609, !llvm.loop !2610

for.end45:                                        ; preds = %for.cond34
  %cmp47 = icmp eq i8 %full_rank.0, 0, !dbg !2612
  br i1 %cmp47, label %return, label %for.cond50, !dbg !2612

for.cond50:                                       ; preds = %for.cond63, %for.end45
  %row.0.in = phi i32 [ %m, %for.end45 ], [ %row.0, %for.cond63 ]
  %row.0 = add nsw i32 %row.0.in, -1, !dbg !2614
    #dbg_value(i32 %row.0, !2616, !DIExpression(), !2617)
  %cmp51 = icmp sgt i32 %row.0.in, 0, !dbg !2618
  br i1 %cmp51, label %for.body53, label %return, !dbg !2620

for.body53:                                       ; preds = %for.cond50
    #dbg_value(i8 0, !2621, !DIExpression(), !2523)
  %sub54 = sub nsw i32 %m, %row.0, !dbg !2622
  %div = sdiv i32 32, %sub54, !dbg !2622
  %add55 = add nsw i32 %row.0, %div, !dbg !2622
  %mul56 = mul nsw i32 %k, %o, !dbg !2622
  %cmp57 = icmp slt i32 %add55, %mul56, !dbg !2622
  br i1 %cmp57, label %cond.true, label %cond.false, !dbg !2622

cond.true:                                        ; preds = %for.body53
  %sub59 = sub nsw i32 %m, %row.0, !dbg !2622
  %div60 = sdiv i32 32, %sub59, !dbg !2622
  %add61 = add nsw i32 %row.0, %div60, !dbg !2622
  br label %cond.end, !dbg !2622

cond.false:                                       ; preds = %for.body53
  %mul62 = mul nsw i32 %k, %o, !dbg !2622
  br label %cond.end, !dbg !2622

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %add61, %cond.true ], [ %mul62, %cond.false ], !dbg !2622
    #dbg_value(i32 %cond, !2624, !DIExpression(), !2523)
    #dbg_value(i32 %row.0, !2625, !DIExpression(), !2627)
  br label %for.cond63, !dbg !2628

for.cond63:                                       ; preds = %for.inc229, %cond.end
  %finished.0 = phi i8 [ 0, %cond.end ], [ %or2273, %for.inc229 ], !dbg !2629
  %col.0 = phi i32 [ %row.0, %cond.end ], [ %inc230, %for.inc229 ], !dbg !2630
    #dbg_value(i32 %col.0, !2625, !DIExpression(), !2627)
    #dbg_value(i8 %finished.0, !2621, !DIExpression(), !2523)
  %cmp64.not = icmp sgt i32 %col.0, %cond, !dbg !2631
  br i1 %cmp64.not, label %for.cond50, label %for.body66, !dbg !2633, !llvm.loop !2634

for.body66:                                       ; preds = %for.cond63
  %mul67 = mul nsw i32 %row.0, %A_cols, !dbg !2636
  %9 = getelementptr i8, ptr %A, i32 %mul67, !dbg !2638
  %arrayidx69 = getelementptr i8, ptr %9, i32 %col.0, !dbg !2638
  %10 = load i8, ptr %arrayidx69, align 1, !dbg !2638
  %call70 = call fastcc zeroext i8 @ct_compare_8(i8 noundef zeroext %10, i8 noundef zeroext 0) #6, !dbg !2639
  %not = xor i8 %finished.0, -1, !dbg !2640
    #dbg_value(!DIArgList(i8 %call70, i8 %not), !2641, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_and, DW_OP_stack_value), !2523)
  %add76 = mul i32 %row.0.in, %A_cols, !dbg !2642
  %11 = getelementptr i8, ptr %A, i32 %add76, !dbg !2643
  %arrayidx78 = getelementptr i8, ptr %11, i32 -1, !dbg !2643
  %12 = load i8, ptr %arrayidx78, align 1, !dbg !2643
  %13 = and i8 %12, %not, !dbg !2644
  %and801 = and i8 %13, %call70, !dbg !2644
    #dbg_value(i8 %and801, !2645, !DIExpression(), !2646)
  %arrayidx83 = getelementptr inbounds i8, ptr %x, i32 %col.0, !dbg !2647
  %14 = load i8, ptr %arrayidx83, align 1, !dbg !2648
  %xor2 = xor i8 %14, %and801, !dbg !2648
  store i8 %xor2, ptr %arrayidx83, align 1, !dbg !2648
    #dbg_value(i32 0, !2649, !DIExpression(), !2651)
  br label %for.cond87, !dbg !2652

for.cond87:                                       ; preds = %for.body90, %for.body66
  %i86.0 = phi i32 [ 0, %for.body66 ], [ %add223, %for.body90 ], !dbg !2653
    #dbg_value(i32 %i86.0, !2649, !DIExpression(), !2651)
  %cmp88 = icmp slt i32 %i86.0, %row.0, !dbg !2654
  br i1 %cmp88, label %for.body90, label %for.inc229, !dbg !2656

for.body90:                                       ; preds = %for.cond87
  %mul91 = mul nsw i32 %i86.0, %A_cols, !dbg !2657
  %15 = getelementptr i8, ptr %A, i32 %mul91, !dbg !2659
  %arrayidx93 = getelementptr i8, ptr %15, i32 %col.0, !dbg !2659
  %16 = load i8, ptr %arrayidx93, align 1, !dbg !2659
  %conv94 = zext i8 %16 to i64, !dbg !2660
  %add95 = or disjoint i32 %i86.0, 1, !dbg !2661
  %mul96 = mul nsw i32 %add95, %A_cols, !dbg !2662
  %17 = getelementptr i8, ptr %A, i32 %mul96, !dbg !2663
  %arrayidx98 = getelementptr i8, ptr %17, i32 %col.0, !dbg !2663
  %18 = load i8, ptr %arrayidx98, align 1, !dbg !2663
  %conv99 = zext i8 %18 to i64, !dbg !2664
  %shl100 = shl nuw nsw i64 %conv99, 8, !dbg !2665
  %xor101 = or disjoint i64 %shl100, %conv94, !dbg !2666
  %add102 = or disjoint i32 %i86.0, 2, !dbg !2667
  %mul103 = mul nsw i32 %add102, %A_cols, !dbg !2668
  %19 = getelementptr i8, ptr %A, i32 %mul103, !dbg !2669
  %arrayidx105 = getelementptr i8, ptr %19, i32 %col.0, !dbg !2669
  %20 = load i8, ptr %arrayidx105, align 1, !dbg !2669
  %conv106 = zext i8 %20 to i64, !dbg !2670
  %shl107 = shl nuw nsw i64 %conv106, 16, !dbg !2671
  %xor108 = or disjoint i64 %xor101, %shl107, !dbg !2672
  %add109 = or disjoint i32 %i86.0, 3, !dbg !2673
  %mul110 = mul nsw i32 %add109, %A_cols, !dbg !2674
  %21 = getelementptr i8, ptr %A, i32 %mul110, !dbg !2675
  %arrayidx112 = getelementptr i8, ptr %21, i32 %col.0, !dbg !2675
  %22 = load i8, ptr %arrayidx112, align 1, !dbg !2675
  %conv113 = zext i8 %22 to i64, !dbg !2676
  %shl114 = shl nuw nsw i64 %conv113, 24, !dbg !2677
  %xor115 = or disjoint i64 %xor108, %shl114, !dbg !2678
  %add116 = or disjoint i32 %i86.0, 4, !dbg !2679
  %mul117 = mul nsw i32 %add116, %A_cols, !dbg !2680
  %23 = getelementptr i8, ptr %A, i32 %mul117, !dbg !2681
  %arrayidx119 = getelementptr i8, ptr %23, i32 %col.0, !dbg !2681
  %24 = load i8, ptr %arrayidx119, align 1, !dbg !2681
  %conv120 = zext i8 %24 to i64, !dbg !2682
  %shl121 = shl nuw nsw i64 %conv120, 32, !dbg !2683
  %xor122 = or disjoint i64 %xor115, %shl121, !dbg !2684
  %add123 = or disjoint i32 %i86.0, 5, !dbg !2685
  %mul124 = mul nsw i32 %add123, %A_cols, !dbg !2686
  %25 = getelementptr i8, ptr %A, i32 %mul124, !dbg !2687
  %arrayidx126 = getelementptr i8, ptr %25, i32 %col.0, !dbg !2687
  %26 = load i8, ptr %arrayidx126, align 1, !dbg !2687
  %conv127 = zext i8 %26 to i64, !dbg !2688
  %shl128 = shl nuw nsw i64 %conv127, 40, !dbg !2689
  %xor129 = xor i64 %xor122, %shl128, !dbg !2690
  %add130 = or disjoint i32 %i86.0, 6, !dbg !2691
  %mul131 = mul nsw i32 %add130, %A_cols, !dbg !2692
  %27 = getelementptr i8, ptr %A, i32 %mul131, !dbg !2693
  %arrayidx133 = getelementptr i8, ptr %27, i32 %col.0, !dbg !2693
  %28 = load i8, ptr %arrayidx133, align 1, !dbg !2693
  %conv134 = zext i8 %28 to i64, !dbg !2694
  %shl135 = shl nuw nsw i64 %conv134, 48, !dbg !2695
  %xor136 = xor i64 %xor129, %shl135, !dbg !2696
  %add137 = or disjoint i32 %i86.0, 7, !dbg !2697
  %mul138 = mul nsw i32 %add137, %A_cols, !dbg !2698
  %29 = getelementptr i8, ptr %A, i32 %mul138, !dbg !2699
  %arrayidx140 = getelementptr i8, ptr %29, i32 %col.0, !dbg !2699
  %30 = load i8, ptr %arrayidx140, align 1, !dbg !2699
  %conv141 = zext i8 %30 to i64, !dbg !2700
  %shl142 = shl nuw i64 %conv141, 56, !dbg !2701
  %xor143 = xor i64 %xor136, %shl142, !dbg !2702
    #dbg_value(i64 %xor143, !2703, !DIExpression(), !2704)
  %call144 = call fastcc i64 @mul_fx8(i8 noundef zeroext %and801, i64 noundef %xor143) #6, !dbg !2705
    #dbg_value(i64 %call144, !2703, !DIExpression(), !2704)
  %mul1464 = or disjoint i32 %i86.0, 1, !dbg !2706
  %add147 = mul i32 %mul1464, %A_cols, !dbg !2706
  %31 = getelementptr i8, ptr %A, i32 %add147, !dbg !2707
  %arrayidx149 = getelementptr i8, ptr %31, i32 -1, !dbg !2707
  %32 = load i8, ptr %arrayidx149, align 1, !dbg !2708
  %33 = trunc i64 %call144 to i8, !dbg !2708
  %34 = and i8 %33, 15, !dbg !2708
  %conv152 = xor i8 %34, %32, !dbg !2708
  store i8 %conv152, ptr %arrayidx149, align 1, !dbg !2708
  %shr = lshr i64 %call144, 8, !dbg !2709
  %mul1555 = or disjoint i32 %i86.0, 2, !dbg !2710
  %add156 = mul i32 %mul1555, %A_cols, !dbg !2710
  %35 = getelementptr i8, ptr %A, i32 %add156, !dbg !2711
  %arrayidx158 = getelementptr i8, ptr %35, i32 -1, !dbg !2711
  %36 = load i8, ptr %arrayidx158, align 1, !dbg !2712
  %37 = trunc i64 %shr to i8, !dbg !2712
  %38 = and i8 %37, 15, !dbg !2712
  %conv161 = xor i8 %38, %36, !dbg !2712
  store i8 %conv161, ptr %arrayidx158, align 1, !dbg !2712
  %shr162 = lshr i64 %call144, 16, !dbg !2713
  %mul1656 = or disjoint i32 %i86.0, 3, !dbg !2714
  %add166 = mul i32 %mul1656, %A_cols, !dbg !2714
  %39 = getelementptr i8, ptr %A, i32 %add166, !dbg !2715
  %arrayidx168 = getelementptr i8, ptr %39, i32 -1, !dbg !2715
  %40 = load i8, ptr %arrayidx168, align 1, !dbg !2716
  %41 = trunc i64 %shr162 to i8, !dbg !2716
  %42 = and i8 %41, 15, !dbg !2716
  %conv171 = xor i8 %42, %40, !dbg !2716
  store i8 %conv171, ptr %arrayidx168, align 1, !dbg !2716
  %shr172 = lshr i64 %call144, 24, !dbg !2717
  %mul1757 = or disjoint i32 %i86.0, 4, !dbg !2718
  %add176 = mul i32 %mul1757, %A_cols, !dbg !2718
  %43 = getelementptr i8, ptr %A, i32 %add176, !dbg !2719
  %arrayidx178 = getelementptr i8, ptr %43, i32 -1, !dbg !2719
  %44 = load i8, ptr %arrayidx178, align 1, !dbg !2720
  %45 = trunc i64 %shr172 to i8, !dbg !2720
  %46 = and i8 %45, 15, !dbg !2720
  %conv181 = xor i8 %46, %44, !dbg !2720
  store i8 %conv181, ptr %arrayidx178, align 1, !dbg !2720
  %shr182 = lshr i64 %call144, 32, !dbg !2721
  %mul1858 = or disjoint i32 %i86.0, 5, !dbg !2722
  %add186 = mul i32 %mul1858, %A_cols, !dbg !2722
  %47 = getelementptr i8, ptr %A, i32 %add186, !dbg !2723
  %arrayidx188 = getelementptr i8, ptr %47, i32 -1, !dbg !2723
  %48 = load i8, ptr %arrayidx188, align 1, !dbg !2724
  %49 = trunc i64 %shr182 to i8, !dbg !2724
  %50 = and i8 %49, 15, !dbg !2724
  %conv191 = xor i8 %50, %48, !dbg !2724
  store i8 %conv191, ptr %arrayidx188, align 1, !dbg !2724
  %shr192 = lshr i64 %call144, 40, !dbg !2725
  %mul1959 = or disjoint i32 %i86.0, 6, !dbg !2726
  %add196 = mul i32 %mul1959, %A_cols, !dbg !2726
  %51 = getelementptr i8, ptr %A, i32 %add196, !dbg !2727
  %arrayidx198 = getelementptr i8, ptr %51, i32 -1, !dbg !2727
  %52 = load i8, ptr %arrayidx198, align 1, !dbg !2728
  %53 = trunc i64 %shr192 to i8, !dbg !2728
  %54 = and i8 %53, 15, !dbg !2728
  %conv201 = xor i8 %54, %52, !dbg !2728
  store i8 %conv201, ptr %arrayidx198, align 1, !dbg !2728
  %shr202 = lshr i64 %call144, 48, !dbg !2729
  %mul20510 = or disjoint i32 %i86.0, 7, !dbg !2730
  %add206 = mul i32 %mul20510, %A_cols, !dbg !2730
  %55 = getelementptr i8, ptr %A, i32 %add206, !dbg !2731
  %arrayidx208 = getelementptr i8, ptr %55, i32 -1, !dbg !2731
  %56 = load i8, ptr %arrayidx208, align 1, !dbg !2732
  %57 = trunc i64 %shr202 to i8, !dbg !2732
  %58 = and i8 %57, 15, !dbg !2732
  %conv211 = xor i8 %58, %56, !dbg !2732
  store i8 %conv211, ptr %arrayidx208, align 1, !dbg !2732
  %shr212 = lshr i64 %call144, 56, !dbg !2733
  %mul21511 = add nuw i32 %i86.0, 8, !dbg !2734
  %add216 = mul i32 %mul21511, %A_cols, !dbg !2734
  %59 = getelementptr i8, ptr %A, i32 %add216, !dbg !2735
  %arrayidx218 = getelementptr i8, ptr %59, i32 -1, !dbg !2735
  %60 = load i8, ptr %arrayidx218, align 1, !dbg !2736
  %61 = trunc nuw nsw i64 %shr212 to i8, !dbg !2736
  %conv221 = xor i8 %60, %61, !dbg !2736
  store i8 %conv221, ptr %arrayidx218, align 1, !dbg !2736
  %add223 = add nuw nsw i32 %i86.0, 8, !dbg !2737
    #dbg_value(i32 %add223, !2649, !DIExpression(), !2651)
  br label %for.cond87, !dbg !2738, !llvm.loop !2739

for.inc229:                                       ; preds = %for.cond87
    #dbg_value(!DIArgList(i8 %finished.0, i8 %call70), !2621, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_arg, 1, DW_OP_or, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !2523)
  %or2273 = or i8 %finished.0, %call70, !dbg !2741
    #dbg_value(i8 %or2273, !2621, !DIExpression(DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !2523)
    #dbg_value(i8 %or2273, !2621, !DIExpression(), !2523)
  %inc230 = add nsw i32 %col.0, 1, !dbg !2742
    #dbg_value(i32 %inc230, !2625, !DIExpression(), !2627)
  br label %for.cond63, !dbg !2743, !llvm.loop !2744

return:                                           ; preds = %for.cond50, %for.end45
  %retval.0 = phi i32 [ 0, %for.end45 ], [ 1, %for.cond50 ], !dbg !2523
  ret i32 %retval.0, !dbg !2746
}

; Function Attrs: nounwind
define internal fastcc void @mat_mul.21(ptr noundef %a, ptr noundef %b, ptr noundef %c, i32 noundef %colrow_ab, i32 noundef %row_a, i32 noundef %col_b) unnamed_addr #0 !dbg !2747 {
entry:
    #dbg_value(ptr %a, !2748, !DIExpression(), !2749)
    #dbg_value(ptr %b, !2750, !DIExpression(), !2749)
    #dbg_value(ptr %c, !2751, !DIExpression(), !2749)
    #dbg_value(i32 %colrow_ab, !2752, !DIExpression(), !2749)
    #dbg_value(i32 %row_a, !2753, !DIExpression(), !2749)
    #dbg_value(i32 %col_b, !2754, !DIExpression(), !2749)
    #dbg_value(i32 0, !2755, !DIExpression(), !2757)
  %smax = call i32 @llvm.smax.i32(i32 %col_b, i32 0), !dbg !2758
  %smax1 = call i32 @llvm.smax.i32(i32 %row_a, i32 0), !dbg !2758
  br label %for.cond, !dbg !2758

for.cond:                                         ; preds = %for.inc4, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc5, %for.inc4 ], !dbg !2759
  %c.addr.0 = phi ptr [ %c, %entry ], [ %c.addr.1, %for.inc4 ]
  %a.addr.0 = phi ptr [ %a, %entry ], [ %add.ptr6, %for.inc4 ]
    #dbg_value(ptr %a.addr.0, !2748, !DIExpression(), !2749)
    #dbg_value(ptr %c.addr.0, !2751, !DIExpression(), !2749)
    #dbg_value(i32 %i.0, !2755, !DIExpression(), !2757)
  %exitcond2.not = icmp eq i32 %i.0, %smax1, !dbg !2760
  br i1 %exitcond2.not, label %for.end7, label %for.cond1, !dbg !2762

for.cond1:                                        ; preds = %for.cond, %for.body3
  %c.addr.1 = phi ptr [ %incdec.ptr, %for.body3 ], [ %c.addr.0, %for.cond ]
  %j.0 = phi i32 [ %inc, %for.body3 ], [ 0, %for.cond ], !dbg !2763
    #dbg_value(i32 %j.0, !2766, !DIExpression(), !2767)
    #dbg_value(ptr %c.addr.1, !2751, !DIExpression(), !2749)
  %exitcond.not = icmp eq i32 %j.0, %smax, !dbg !2768
  br i1 %exitcond.not, label %for.inc4, label %for.body3, !dbg !2770

for.body3:                                        ; preds = %for.cond1
  %add.ptr = getelementptr inbounds nuw i8, ptr %b, i32 %j.0, !dbg !2771
  %call = call fastcc zeroext i8 @lincomb.24(ptr noundef %a.addr.0, ptr noundef %add.ptr, i32 noundef %colrow_ab, i32 noundef %col_b) #6, !dbg !2773
  store i8 %call, ptr %c.addr.1, align 1, !dbg !2774
  %inc = add nuw i32 %j.0, 1, !dbg !2775
    #dbg_value(i32 %inc, !2766, !DIExpression(), !2767)
  %incdec.ptr = getelementptr inbounds nuw i8, ptr %c.addr.1, i32 1, !dbg !2776
    #dbg_value(ptr %incdec.ptr, !2751, !DIExpression(), !2749)
  br label %for.cond1, !dbg !2777, !llvm.loop !2778

for.inc4:                                         ; preds = %for.cond1
  %inc5 = add nuw i32 %i.0, 1, !dbg !2780
    #dbg_value(i32 %inc5, !2755, !DIExpression(), !2757)
  %add.ptr6 = getelementptr inbounds i8, ptr %a.addr.0, i32 %colrow_ab, !dbg !2781
    #dbg_value(ptr %add.ptr6, !2748, !DIExpression(), !2749)
  br label %for.cond, !dbg !2782, !llvm.loop !2783

for.end7:                                         ; preds = %for.cond
  %cmp8 = icmp eq i32 %row_a, %col_b, !dbg !2785
  %call9 = call zeroext i1 @assert(i1 noundef zeroext %cmp8) #8, !dbg !2786
  ret void, !dbg !2787
}

; Function Attrs: nounwind
define internal fastcc zeroext i8 @sub_f(i8 noundef zeroext %a, i8 noundef zeroext %b) unnamed_addr #0 !dbg !2788 {
entry:
    #dbg_value(i8 %a, !2789, !DIExpression(), !2790)
    #dbg_value(i8 %b, !2791, !DIExpression(), !2790)
  %xor1 = xor i8 %a, %b, !dbg !2792
  ret i8 %xor1, !dbg !2793
}

; Function Attrs: nounwind
define internal fastcc void @EF(ptr noundef %A, i32 noundef %nrows, i32 noundef %ncols) unnamed_addr #0 !dbg !2794 {
entry:
  %_pivot_row = alloca [6 x i64], align 32
  %_pivot_row2 = alloca [6 x i64], align 32
  %packed_A = alloca [468 x i64], align 32
  %temp = alloca [96 x i8], align 1
    #dbg_value(ptr %A, !2798, !DIExpression(), !2799)
    #dbg_value(i32 %nrows, !2800, !DIExpression(), !2799)
    #dbg_value(i32 %ncols, !2801, !DIExpression(), !2799)
    #dbg_declare(ptr %_pivot_row, !2802, !DIExpression(), !2804)
    #dbg_declare(ptr %_pivot_row2, !2805, !DIExpression(), !2806)
    #dbg_declare(ptr %packed_A, !2807, !DIExpression(), !2811)
  call void @llvm.memset.p0.i32(ptr noundef nonnull align 32 dereferenceable(3744) %packed_A, i8 0, i32 3744, i1 false), !dbg !2811
  %add = add nsw i32 %ncols, 15, !dbg !2812
  %div = sdiv i32 %add, 16, !dbg !2813
    #dbg_value(i32 %div, !2814, !DIExpression(), !2799)
    #dbg_value(i32 0, !2815, !DIExpression(), !2817)
  %smax = call i32 @llvm.smax.i32(i32 %nrows, i32 0), !dbg !2818
  br label %for.cond, !dbg !2818

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !2819
    #dbg_value(i32 %i.0, !2815, !DIExpression(), !2817)
  %exitcond.not = icmp eq i32 %i.0, %smax, !dbg !2820
  br i1 %exitcond.not, label %for.cond3.preheader, label %for.body, !dbg !2822

for.cond3.preheader:                              ; preds = %for.cond
  %smax1 = call i32 @llvm.smax.i32(i32 %div, i32 0), !dbg !2823
  %smax5 = call i32 @llvm.smax.i32(i32 %ncols, i32 0), !dbg !2823
  br label %for.cond3, !dbg !2823

for.body:                                         ; preds = %for.cond
  %mul = mul nsw i32 %i.0, %ncols, !dbg !2825
  %add.ptr = getelementptr inbounds i8, ptr %A, i32 %mul, !dbg !2827
  %mul1 = mul nsw i32 %i.0, %div, !dbg !2828
  %add.ptr2 = getelementptr inbounds i64, ptr %packed_A, i32 %mul1, !dbg !2829
  call fastcc void @ef_pack_m_vec(ptr noundef %add.ptr, ptr noundef nonnull %add.ptr2, i32 noundef %ncols) #6, !dbg !2830
  %inc = add nuw i32 %i.0, 1, !dbg !2831
    #dbg_value(i32 %inc, !2815, !DIExpression(), !2817)
  br label %for.cond, !dbg !2832, !llvm.loop !2833

for.cond3:                                        ; preds = %for.cond3.preheader, %for.inc117
  %pivot_col.0 = phi i32 [ %inc118, %for.inc117 ], [ 0, %for.cond3.preheader ], !dbg !2835
  %pivot_row.0 = phi i32 [ %conv116, %for.inc117 ], [ 0, %for.cond3.preheader ], !dbg !2799
    #dbg_value(i32 %pivot_row.0, !2836, !DIExpression(), !2799)
    #dbg_value(i32 %pivot_col.0, !2837, !DIExpression(), !2838)
  %exitcond6.not = icmp eq i32 %pivot_col.0, %smax5, !dbg !2839
  br i1 %exitcond6.not, label %for.cond121, label %for.body5, !dbg !2823

for.body5:                                        ; preds = %for.cond3
  %add6 = add nsw i32 %pivot_col.0, %nrows, !dbg !2841
  %cmp7 = icmp slt i32 %add6, %ncols, !dbg !2841
  %add8 = add nsw i32 %pivot_col.0, %nrows, !dbg !2841
  %sub9 = sub nsw i32 %add8, %ncols, !dbg !2841
  %cond = select i1 %cmp7, i32 0, i32 %sub9, !dbg !2841
    #dbg_value(i32 %cond, !2843, !DIExpression(), !2844)
  %sub13 = add nsw i32 %nrows, -1, !dbg !2845
    #dbg_value(i32 %cond16, !2846, !DIExpression(), !2844)
    #dbg_value(i32 0, !2847, !DIExpression(), !2849)
  br label %for.cond18, !dbg !2850

for.cond18:                                       ; preds = %for.body20, %for.body5
  %i17.0 = phi i32 [ 0, %for.body5 ], [ %inc23, %for.body20 ], !dbg !2851
    #dbg_value(i32 %i17.0, !2847, !DIExpression(), !2849)
  %exitcond2.not = icmp eq i32 %i17.0, %smax1, !dbg !2852
  br i1 %exitcond2.not, label %for.cond25.preheader, label %for.body20, !dbg !2854

for.cond25.preheader:                             ; preds = %for.cond18
  %cmp11.not = icmp sgt i32 %nrows, %pivot_col.0, !dbg !2845
  %cond16 = select i1 %cmp11.not, i32 %pivot_col.0, i32 %sub13, !dbg !2845
  br label %for.cond25, !dbg !2855

for.body20:                                       ; preds = %for.cond18
  %arrayidx = getelementptr inbounds nuw [6 x i64], ptr %_pivot_row, i32 0, i32 %i17.0, !dbg !2857
  store i64 0, ptr %arrayidx, align 8, !dbg !2859
  %arrayidx21 = getelementptr inbounds nuw [6 x i64], ptr %_pivot_row2, i32 0, i32 %i17.0, !dbg !2860
  store i64 0, ptr %arrayidx21, align 8, !dbg !2861
  %inc23 = add nuw nsw i32 %i17.0, 1, !dbg !2862
    #dbg_value(i32 %inc23, !2847, !DIExpression(), !2849)
  br label %for.cond18, !dbg !2863, !llvm.loop !2864

for.cond25:                                       ; preds = %for.cond25.preheader, %for.end48
  %pivot_is_zero.0 = phi i64 [ %not52, %for.end48 ], [ -1, %for.cond25.preheader ], !dbg !2844
  %pivot.0 = phi i8 [ %call50, %for.end48 ], [ 0, %for.cond25.preheader ], !dbg !2844
  %row.0 = phi i32 [ %inc54, %for.end48 ], [ %cond, %for.cond25.preheader ], !dbg !2866
    #dbg_value(i32 %row.0, !2867, !DIExpression(), !2866)
    #dbg_value(i8 %pivot.0, !2868, !DIExpression(), !2844)
    #dbg_value(i64 %pivot_is_zero.0, !2869, !DIExpression(), !2844)
  %add27 = add nsw i32 %cond16, 32, !dbg !2870
  %cmp28.not = icmp sgt i32 %nrows, %add27, !dbg !2870
  %sub30 = add nsw i32 %nrows, -1, !dbg !2870
  %add32 = add nsw i32 %cond16, 32, !dbg !2870
  %cond34 = select i1 %cmp28.not, i32 %add32, i32 %sub30, !dbg !2870
  %cmp35.not = icmp sgt i32 %row.0, %cond34, !dbg !2872
  br i1 %cmp35.not, label %for.end55, label %for.body36, !dbg !2855

for.body36:                                       ; preds = %for.cond25
  %call = call fastcc i64 @ct_compare_64(i32 noundef %row.0, i32 noundef %pivot_row.0) #6, !dbg !2873
  %not = xor i64 %call, -1, !dbg !2875
    #dbg_value(i64 %not, !2876, !DIExpression(), !2877)
  %call37 = call fastcc i64 @ct_64_is_greater_than(i32 noundef %row.0, i32 noundef %pivot_row.0) #6, !dbg !2878
    #dbg_value(i64 %call37, !2879, !DIExpression(), !2877)
    #dbg_value(i32 0, !2880, !DIExpression(), !2882)
  br label %for.cond38, !dbg !2883

for.cond38:                                       ; preds = %for.body40, %for.body36
  %j.0 = phi i32 [ 0, %for.body36 ], [ %inc47, %for.body40 ], !dbg !2884
    #dbg_value(i32 %j.0, !2880, !DIExpression(), !2882)
  %exitcond3.not = icmp eq i32 %j.0, %smax1, !dbg !2885
  br i1 %exitcond3.not, label %for.end48, label %for.body40, !dbg !2887

for.body40:                                       ; preds = %for.cond38
  %and = and i64 %call37, %pivot_is_zero.0, !dbg !2888
  %or = or i64 %and, %not, !dbg !2890
  %mul41 = mul nsw i32 %row.0, %div, !dbg !2891
  %add42 = add nsw i32 %mul41, %j.0, !dbg !2892
  %arrayidx43 = getelementptr inbounds [468 x i64], ptr %packed_A, i32 0, i32 %add42, !dbg !2893
  %0 = load i64, ptr %arrayidx43, align 8, !dbg !2893
  %and44 = and i64 %or, %0, !dbg !2894
  %arrayidx45 = getelementptr inbounds nuw [6 x i64], ptr %_pivot_row, i32 0, i32 %j.0, !dbg !2895
  %1 = load i64, ptr %arrayidx45, align 8, !dbg !2896
  %xor = xor i64 %1, %and44, !dbg !2896
  store i64 %xor, ptr %arrayidx45, align 8, !dbg !2896
  %inc47 = add nuw nsw i32 %j.0, 1, !dbg !2897
    #dbg_value(i32 %inc47, !2880, !DIExpression(), !2882)
  br label %for.cond38, !dbg !2898, !llvm.loop !2899

for.end48:                                        ; preds = %for.cond38
  %call50 = call fastcc zeroext i8 @m_extract_element(ptr noundef nonnull %_pivot_row, i32 noundef %pivot_col.0) #6, !dbg !2901
    #dbg_value(i8 %call50, !2868, !DIExpression(), !2844)
  %conv = zext nneg i8 %call50 to i32, !dbg !2902
  %call51 = call fastcc i64 @ct_compare_64(i32 noundef %conv, i32 noundef 0) #6, !dbg !2903
    #dbg_value(i64 %call51, !2869, !DIExpression(DW_OP_constu, 18446744073709551615, DW_OP_xor, DW_OP_stack_value), !2844)
  %not52 = xor i64 %call51, -1, !dbg !2904
    #dbg_value(i64 %not52, !2869, !DIExpression(), !2844)
  %inc54 = add nsw i32 %row.0, 1, !dbg !2905
    #dbg_value(i32 %inc54, !2867, !DIExpression(), !2866)
  br label %for.cond25, !dbg !2906, !llvm.loop !2907

for.end55:                                        ; preds = %for.cond25
  %call56 = call fastcc zeroext i8 @inverse_f(i8 noundef zeroext %pivot.0) #6, !dbg !2909
    #dbg_value(i8 %call56, !2910, !DIExpression(), !2799)
  call fastcc void @vec_mul_add_u64(i32 noundef %div, ptr noundef nonnull %_pivot_row, i8 noundef zeroext %call56, ptr noundef nonnull %_pivot_row2) #6, !dbg !2911
    #dbg_value(i32 %cond, !2912, !DIExpression(), !2914)
  br label %for.cond60, !dbg !2915

for.cond60:                                       ; preds = %for.inc86, %for.end55
  %row59.0 = phi i32 [ %cond, %for.end55 ], [ %inc87, %for.inc86 ], !dbg !2916
    #dbg_value(i32 %row59.0, !2912, !DIExpression(), !2914)
  %cmp61.not = icmp sgt i32 %row59.0, %cond16, !dbg !2917
  br i1 %cmp61.not, label %for.cond90, label %for.body63, !dbg !2919

for.body63:                                       ; preds = %for.cond60
  %call64 = call fastcc i64 @ct_compare_64(i32 noundef %row59.0, i32 noundef %pivot_row.0) #6, !dbg !2920
  %and67.demorgan = or i64 %call64, %pivot_is_zero.0, !dbg !2922
  %and67 = xor i64 %and67.demorgan, -1, !dbg !2922
    #dbg_value(i64 %and67, !2923, !DIExpression(), !2924)
    #dbg_value(i64 %and67.demorgan, !2925, !DIExpression(), !2924)
    #dbg_value(i32 0, !2926, !DIExpression(), !2928)
  br label %for.cond69, !dbg !2929

for.cond69:                                       ; preds = %for.body72, %for.body63
  %col.0 = phi i32 [ 0, %for.body63 ], [ %inc84, %for.body72 ], !dbg !2930
    #dbg_value(i32 %col.0, !2926, !DIExpression(), !2928)
  %exitcond4.not = icmp eq i32 %col.0, %smax1, !dbg !2931
  br i1 %exitcond4.not, label %for.inc86, label %for.body72, !dbg !2933

for.body72:                                       ; preds = %for.cond69
  %mul73 = mul nsw i32 %row59.0, %div, !dbg !2934
  %add74 = add nsw i32 %mul73, %col.0, !dbg !2936
  %arrayidx75 = getelementptr inbounds [468 x i64], ptr %packed_A, i32 0, i32 %add74, !dbg !2937
  %2 = load i64, ptr %arrayidx75, align 8, !dbg !2937
  %and76 = and i64 %and67.demorgan, %2, !dbg !2938
  %arrayidx77 = getelementptr inbounds nuw [6 x i64], ptr %_pivot_row2, i32 0, i32 %col.0, !dbg !2939
  %3 = load i64, ptr %arrayidx77, align 8, !dbg !2939
  %and78 = and i64 %3, %and67, !dbg !2940
  %add79 = add i64 %and76, %and78, !dbg !2941
  %mul80 = mul nsw i32 %row59.0, %div, !dbg !2942
  %add81 = add nsw i32 %mul80, %col.0, !dbg !2943
  %arrayidx82 = getelementptr inbounds [468 x i64], ptr %packed_A, i32 0, i32 %add81, !dbg !2944
  store i64 %add79, ptr %arrayidx82, align 8, !dbg !2945
  %inc84 = add nuw nsw i32 %col.0, 1, !dbg !2946
    #dbg_value(i32 %inc84, !2926, !DIExpression(), !2928)
  br label %for.cond69, !dbg !2947, !llvm.loop !2948

for.inc86:                                        ; preds = %for.cond69
  %inc87 = add nsw i32 %row59.0, 1, !dbg !2950
    #dbg_value(i32 %inc87, !2912, !DIExpression(), !2914)
  br label %for.cond60, !dbg !2951, !llvm.loop !2952

for.cond90:                                       ; preds = %for.cond60, %for.body93
  %row89.0 = phi i32 [ %inc110, %for.body93 ], [ %cond, %for.cond60 ], !dbg !2954
    #dbg_value(i32 %row89.0, !2956, !DIExpression(), !2957)
  %cmp91 = icmp slt i32 %row89.0, %nrows, !dbg !2958
  br i1 %cmp91, label %for.body93, label %for.inc117, !dbg !2960

for.body93:                                       ; preds = %for.cond90
  %cmp94 = icmp sgt i32 %row89.0, %pivot_row.0, !dbg !2961
    #dbg_value(i1 %cmp94, !2963, !DIExpression(DW_OP_LLVM_convert, 1, DW_ATE_unsigned, DW_OP_LLVM_convert, 8, DW_ATE_unsigned, DW_OP_stack_value), !2964)
  %mul98 = mul nsw i32 %row89.0, %div, !dbg !2965
  %add.ptr99 = getelementptr inbounds i64, ptr %packed_A, i32 %mul98, !dbg !2966
  %call100 = call fastcc zeroext i8 @m_extract_element(ptr noundef nonnull %add.ptr99, i32 noundef %pivot_col.0) #6, !dbg !2967
    #dbg_value(i8 %call100, !2968, !DIExpression(), !2964)
  %conv105 = select i1 %cmp94, i8 %call100, i8 0, !dbg !2969
  %mul107 = mul nsw i32 %row89.0, %div, !dbg !2970
  %add.ptr108 = getelementptr inbounds i64, ptr %packed_A, i32 %mul107, !dbg !2971
  call fastcc void @vec_mul_add_u64(i32 noundef %div, ptr noundef nonnull %_pivot_row2, i8 noundef zeroext %conv105, ptr noundef nonnull %add.ptr108) #6, !dbg !2972
  %inc110 = add nsw i32 %row89.0, 1, !dbg !2973
    #dbg_value(i32 %inc110, !2956, !DIExpression(), !2957)
  br label %for.cond90, !dbg !2974, !llvm.loop !2975

for.inc117:                                       ; preds = %for.cond90
    #dbg_value(!DIArgList(i64 %pivot_is_zero.0, i32 %pivot_row.0), !2836, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_plus_uconst, 1, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_plus, DW_OP_LLVM_convert, 64, DW_ATE_unsigned, DW_OP_LLVM_convert, 32, DW_ATE_unsigned, DW_OP_stack_value), !2799)
  %4 = trunc i64 %pivot_is_zero.0 to i32, !dbg !2977
  %5 = add i32 %4, 1, !dbg !2977
  %conv116 = add i32 %5, %pivot_row.0, !dbg !2977
    #dbg_value(i32 %conv116, !2836, !DIExpression(), !2799)
  %inc118 = add nuw i32 %pivot_col.0, 1, !dbg !2978
    #dbg_value(i32 %inc118, !2837, !DIExpression(), !2838)
  br label %for.cond3, !dbg !2979, !llvm.loop !2980

for.cond121:                                      ; preds = %for.cond3, %for.inc141
  %i120.0 = phi i32 [ %inc142, %for.inc141 ], [ 0, %for.cond3 ], !dbg !2982
    #dbg_value(i32 %i120.0, !2984, !DIExpression(), !2985)
  %exitcond8.not = icmp eq i32 %i120.0, %smax, !dbg !2986
  br i1 %exitcond8.not, label %for.end143, label %for.body124, !dbg !2988

for.body124:                                      ; preds = %for.cond121
  %mul126 = mul nsw i32 %i120.0, %div, !dbg !2989
  %add.ptr127 = getelementptr inbounds i64, ptr %packed_A, i32 %mul126, !dbg !2991
  call fastcc void @ef_unpack_m_vec(i32 noundef %div, ptr noundef nonnull %add.ptr127, ptr noundef nonnull %temp) #6, !dbg !2992
    #dbg_value(i32 0, !2993, !DIExpression(), !2995)
  br label %for.cond130, !dbg !2996

for.cond130:                                      ; preds = %for.body133, %for.body124
  %j129.0 = phi i32 [ 0, %for.body124 ], [ %inc139, %for.body133 ], !dbg !2997
    #dbg_value(i32 %j129.0, !2993, !DIExpression(), !2995)
  %exitcond7.not = icmp eq i32 %j129.0, %smax5, !dbg !2998
  br i1 %exitcond7.not, label %for.inc141, label %for.body133, !dbg !3000

for.body133:                                      ; preds = %for.cond130
  %arrayidx134 = getelementptr inbounds nuw [96 x i8], ptr %temp, i32 0, i32 %j129.0, !dbg !3001
  %6 = load i8, ptr %arrayidx134, align 1, !dbg !3001
  %mul135 = mul nsw i32 %i120.0, %ncols, !dbg !3003
  %7 = getelementptr i8, ptr %A, i32 %mul135, !dbg !3004
  %arrayidx137 = getelementptr i8, ptr %7, i32 %j129.0, !dbg !3004
  store i8 %6, ptr %arrayidx137, align 1, !dbg !3005
  %inc139 = add nuw i32 %j129.0, 1, !dbg !3006
    #dbg_value(i32 %inc139, !2993, !DIExpression(), !2995)
  br label %for.cond130, !dbg !3007, !llvm.loop !3008

for.inc141:                                       ; preds = %for.cond130
  %inc142 = add nuw i32 %i120.0, 1, !dbg !3010
    #dbg_value(i32 %inc142, !2984, !DIExpression(), !2985)
  br label %for.cond121, !dbg !3011, !llvm.loop !3012

for.end143:                                       ; preds = %for.cond121
  call void @mayo_secure_clear(ptr noundef nonnull %temp, i32 noundef 96) #8, !dbg !3014
  call void @mayo_secure_clear(ptr noundef nonnull %_pivot_row, i32 noundef 48) #8, !dbg !3015
  call void @mayo_secure_clear(ptr noundef nonnull %_pivot_row2, i32 noundef 48) #8, !dbg !3016
  call void @mayo_secure_clear(ptr noundef nonnull %packed_A, i32 noundef 3744) #8, !dbg !3017
  ret void, !dbg !3018
}

; Function Attrs: nounwind
define internal fastcc zeroext i8 @ct_compare_8(i8 noundef zeroext %a, i8 noundef zeroext %b) unnamed_addr #0 !dbg !3019 {
entry:
    #dbg_value(i8 %a, !3021, !DIExpression(), !3022)
    #dbg_value(i8 %b, !3023, !DIExpression(), !3022)
  %0 = icmp ne i8 %a, %b, !dbg !3024
  %conv3 = sext i1 %0 to i8, !dbg !3025
  %1 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !3026
  %xor5 = xor i8 %1, %conv3, !dbg !3027
  ret i8 %xor5, !dbg !3028
}

; Function Attrs: nounwind
define internal fastcc range(i64 0, 1085102592571150096) i64 @mul_fx8(i8 noundef zeroext %a, i64 noundef %b) unnamed_addr #0 !dbg !3029 {
entry:
    #dbg_value(i8 %a, !3032, !DIExpression(), !3033)
    #dbg_value(i64 %b, !3034, !DIExpression(), !3033)
  %0 = and i8 %a, 1, !dbg !3035
  %conv1 = zext nneg i8 %0 to i64, !dbg !3036
  %mul = mul nuw nsw i64 %b, %conv1, !dbg !3037
    #dbg_value(i64 %mul, !3038, !DIExpression(), !3033)
  %1 = and i8 %a, 2, !dbg !3039
  %conv4 = zext nneg i8 %1 to i64, !dbg !3040
  %mul5 = mul i64 %b, %conv4, !dbg !3041
  %xor = xor i64 %mul, %mul5, !dbg !3042
    #dbg_value(i64 %xor, !3038, !DIExpression(), !3033)
  %2 = and i8 %a, 4, !dbg !3043
  %conv8 = zext nneg i8 %2 to i64, !dbg !3044
  %mul9 = mul i64 %b, %conv8, !dbg !3045
  %xor10 = xor i64 %xor, %mul9, !dbg !3046
    #dbg_value(i64 %xor10, !3038, !DIExpression(), !3033)
  %3 = and i8 %a, 8, !dbg !3047
  %conv13 = zext nneg i8 %3 to i64, !dbg !3048
  %mul14 = mul i64 %b, %conv13, !dbg !3049
  %xor15 = xor i64 %xor10, %mul14, !dbg !3050
    #dbg_value(i64 %xor15, !3038, !DIExpression(), !3033)
    #dbg_value(i64 %xor15, !3051, !DIExpression(DW_OP_constu, 17361641481138401520, DW_OP_and, DW_OP_stack_value), !3033)
  %shr = lshr i64 %xor15, 4, !dbg !3052
  %and16 = lshr i64 %xor15, 3, !dbg !3053
  %shr18 = and i64 %and16, 1012762419733073422, !dbg !3053
  %4 = xor i64 %shr, %shr18, !dbg !3054
  %xor19 = xor i64 %4, %xor15, !dbg !3054
  %and20 = and i64 %xor19, 1085102592571150095, !dbg !3055
    #dbg_value(i64 %and20, !3056, !DIExpression(), !3033)
  ret i64 %and20, !dbg !3057
}

; Function Attrs: nounwind
define internal fastcc void @ef_pack_m_vec(ptr noundef %in, ptr noundef %out, i32 noundef %ncols) unnamed_addr #0 !dbg !3058 {
entry:
    #dbg_value(ptr %in, !3061, !DIExpression(), !3062)
    #dbg_value(ptr %out, !3063, !DIExpression(), !3062)
    #dbg_value(i32 %ncols, !3064, !DIExpression(), !3062)
    #dbg_value(ptr %out, !3065, !DIExpression(), !3062)
    #dbg_value(i32 0, !3066, !DIExpression(), !3062)
  br label %for.cond, !dbg !3067

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add8, %for.body ], !dbg !3069
    #dbg_value(i32 %i.0, !3066, !DIExpression(), !3062)
  %add = or disjoint i32 %i.0, 1, !dbg !3070
  %cmp = icmp slt i32 %add, %ncols, !dbg !3072
  br i1 %cmp, label %for.body, label %for.end, !dbg !3073

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %in, i32 %i.0, !dbg !3074
  %0 = load i8, ptr %arrayidx, align 1, !dbg !3074
  %add2 = or disjoint i32 %i.0, 1, !dbg !3076
  %arrayidx3 = getelementptr inbounds nuw i8, ptr %in, i32 %add2, !dbg !3077
  %1 = load i8, ptr %arrayidx3, align 1, !dbg !3077
  %shl5 = shl i8 %1, 4, !dbg !3078
  %or = or i8 %shl5, %0, !dbg !3079
  %div = lshr exact i32 %i.0, 1, !dbg !3080
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %out, i32 %div, !dbg !3081
  store i8 %or, ptr %arrayidx7, align 1, !dbg !3082
  %add8 = add nuw nsw i32 %i.0, 2, !dbg !3083
    #dbg_value(i32 %add8, !3066, !DIExpression(), !3062)
  br label %for.cond, !dbg !3084, !llvm.loop !3085

for.end:                                          ; preds = %for.cond
  %2 = and i32 %ncols, -2147483647, !dbg !3087
  %cmp9 = icmp eq i32 %2, 1, !dbg !3087
  br i1 %cmp9, label %if.then, label %if.end, !dbg !3087

if.then:                                          ; preds = %for.end
  %arrayidx12 = getelementptr inbounds nuw i8, ptr %in, i32 %i.0, !dbg !3089
  %3 = load i8, ptr %arrayidx12, align 1, !dbg !3089
  %div16 = lshr exact i32 %i.0, 1, !dbg !3091
  %arrayidx17 = getelementptr inbounds nuw i8, ptr %out, i32 %div16, !dbg !3092
  store i8 %3, ptr %arrayidx17, align 1, !dbg !3093
  br label %if.end, !dbg !3094

if.end:                                           ; preds = %if.then, %for.end
  ret void, !dbg !3095
}

; Function Attrs: nounwind
define internal fastcc i64 @ct_compare_64(i32 noundef %a, i32 noundef %b) unnamed_addr #0 !dbg !3096 {
entry:
    #dbg_value(i32 %a, !3099, !DIExpression(), !3100)
    #dbg_value(i32 %b, !3101, !DIExpression(), !3100)
  %xor = xor i32 %a, %b, !dbg !3102
  %0 = icmp sgt i32 %xor, 0, !dbg !3103
  %shr = sext i1 %0 to i64, !dbg !3103
  %1 = load volatile i64, ptr @pqmayo_MAYO_1_ref_uint64_t_blocker, align 8, !dbg !3104
  %xor1 = xor i64 %1, %shr, !dbg !3105
  ret i64 %xor1, !dbg !3106
}

; Function Attrs: nounwind
define internal fastcc i64 @ct_64_is_greater_than(i32 noundef %a, i32 noundef %b) unnamed_addr #0 !dbg !3107 {
entry:
    #dbg_value(i32 %a, !3108, !DIExpression(), !3109)
    #dbg_value(i32 %b, !3110, !DIExpression(), !3109)
    #dbg_value(!DIArgList(i32 %b, i32 %a), !3111, !DIExpression(DW_OP_LLVM_arg, 0, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_LLVM_convert, 64, DW_ATE_signed, DW_OP_LLVM_arg, 1, DW_OP_LLVM_convert, 32, DW_ATE_signed, DW_OP_LLVM_convert, 64, DW_ATE_signed, DW_OP_minus, DW_OP_stack_value), !3109)
  %0 = icmp slt i32 %b, %a, !dbg !3112
  %shr = sext i1 %0 to i64, !dbg !3112
  %1 = load volatile i64, ptr @pqmayo_MAYO_1_ref_uint64_t_blocker, align 8, !dbg !3113
  %xor = xor i64 %1, %shr, !dbg !3114
  ret i64 %xor, !dbg !3115
}

; Function Attrs: nounwind
define internal fastcc zeroext range(i8 0, 16) i8 @m_extract_element(ptr noundef %in, i32 noundef %index) unnamed_addr #0 !dbg !3116 {
entry:
    #dbg_value(ptr %in, !3119, !DIExpression(), !3120)
    #dbg_value(i32 %index, !3121, !DIExpression(), !3120)
  %div = sdiv i32 %index, 16, !dbg !3122
    #dbg_value(i32 %div, !3123, !DIExpression(), !3120)
  %rem = srem i32 %index, 16, !dbg !3124
    #dbg_value(i32 %rem, !3125, !DIExpression(), !3120)
  %arrayidx = getelementptr inbounds i64, ptr %in, i32 %div, !dbg !3126
  %0 = load i64, ptr %arrayidx, align 8, !dbg !3126
  %mul = shl nsw i32 %rem, 2, !dbg !3127
  %sh_prom = zext nneg i32 %mul to i64, !dbg !3128
  %shr = lshr i64 %0, %sh_prom, !dbg !3128
  %1 = trunc i64 %shr to i8, !dbg !3129
  %conv = and i8 %1, 15, !dbg !3129
  ret i8 %conv, !dbg !3130
}

; Function Attrs: nounwind
define internal fastcc zeroext range(i8 0, 16) i8 @inverse_f(i8 noundef zeroext %a) unnamed_addr #0 !dbg !3131 {
entry:
    #dbg_value(i8 %a, !3134, !DIExpression(), !3135)
  %call = call fastcc zeroext i8 @mul_f.23(i8 noundef zeroext %a, i8 noundef zeroext %a) #6, !dbg !3136
    #dbg_value(i8 %call, !3137, !DIExpression(), !3135)
  %call1 = call fastcc zeroext i8 @mul_f.23(i8 noundef zeroext %call, i8 noundef zeroext %call) #6, !dbg !3138
    #dbg_value(i8 %call1, !3139, !DIExpression(), !3135)
  %call2 = call fastcc zeroext i8 @mul_f.23(i8 noundef zeroext %call1, i8 noundef zeroext %call1) #6, !dbg !3140
    #dbg_value(i8 %call2, !3141, !DIExpression(), !3135)
  %call3 = call fastcc zeroext i8 @mul_f.23(i8 noundef zeroext %call, i8 noundef zeroext %call1) #6, !dbg !3142
    #dbg_value(i8 %call3, !3143, !DIExpression(), !3135)
  %call4 = call fastcc zeroext i8 @mul_f.23(i8 noundef zeroext %call2, i8 noundef zeroext %call3) #6, !dbg !3144
    #dbg_value(i8 %call4, !3145, !DIExpression(), !3135)
  ret i8 %call4, !dbg !3146
}

; Function Attrs: nounwind
define internal fastcc void @vec_mul_add_u64(i32 noundef %legs, ptr noundef %in, i8 noundef zeroext %a, ptr noundef %acc) unnamed_addr #0 !dbg !3147 {
entry:
    #dbg_value(i32 %legs, !3150, !DIExpression(), !3151)
    #dbg_value(ptr %in, !3152, !DIExpression(), !3151)
    #dbg_value(i8 %a, !3153, !DIExpression(), !3151)
    #dbg_value(ptr %acc, !3154, !DIExpression(), !3151)
  %call = call fastcc i32 @mul_table.22(i8 noundef zeroext %a) #6, !dbg !3155
    #dbg_value(i32 %call, !3156, !DIExpression(), !3151)
    #dbg_value(i64 1229782938247303441, !3157, !DIExpression(), !3151)
    #dbg_value(i32 0, !3158, !DIExpression(), !3160)
  %smax = call i32 @llvm.smax.i32(i32 %legs, i32 0), !dbg !3161
  br label %for.cond, !dbg !3161

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !3162
    #dbg_value(i32 %i.0, !3158, !DIExpression(), !3160)
  %exitcond.not = icmp eq i32 %i.0, %smax, !dbg !3163
  br i1 %exitcond.not, label %for.end, label %for.body, !dbg !3165

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !3166
  %0 = load i64, ptr %arrayidx, align 8, !dbg !3166
  %and = and i64 %0, 1229782938247303441, !dbg !3168
  %and1 = and i32 %call, 255, !dbg !3169
  %conv = zext nneg i32 %and1 to i64, !dbg !3170
  %mul = mul i64 %and, %conv, !dbg !3171
  %shr = lshr i64 %0, 1, !dbg !3172
  %and3 = and i64 %shr, 1229782938247303441, !dbg !3173
  %shr4 = lshr i32 %call, 8, !dbg !3174
  %and5 = and i32 %shr4, 15, !dbg !3175
  %conv6 = zext nneg i32 %and5 to i64, !dbg !3176
  %mul7 = mul nuw i64 %and3, %conv6, !dbg !3177
  %xor = xor i64 %mul, %mul7, !dbg !3178
  %arrayidx8 = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !3179
  %1 = load i64, ptr %arrayidx8, align 8, !dbg !3179
  %shr9 = lshr i64 %1, 2, !dbg !3180
  %and10 = and i64 %shr9, 1229782938247303441, !dbg !3181
  %shr11 = lshr i32 %call, 16, !dbg !3182
  %and12 = and i32 %shr11, 15, !dbg !3183
  %conv13 = zext nneg i32 %and12 to i64, !dbg !3184
  %mul14 = mul nuw i64 %and10, %conv13, !dbg !3185
  %xor15 = xor i64 %xor, %mul14, !dbg !3186
  %arrayidx16 = getelementptr inbounds nuw i64, ptr %in, i32 %i.0, !dbg !3187
  %2 = load i64, ptr %arrayidx16, align 8, !dbg !3187
  %shr17 = lshr i64 %2, 3, !dbg !3188
  %and18 = and i64 %shr17, 1229782938247303441, !dbg !3189
  %shr19 = lshr i32 %call, 24, !dbg !3190
  %and20 = and i32 %shr19, 15, !dbg !3191
  %conv21 = zext nneg i32 %and20 to i64, !dbg !3192
  %mul22 = mul nuw i64 %and18, %conv21, !dbg !3193
  %xor23 = xor i64 %xor15, %mul22, !dbg !3194
  %arrayidx24 = getelementptr inbounds nuw i64, ptr %acc, i32 %i.0, !dbg !3195
  %3 = load i64, ptr %arrayidx24, align 8, !dbg !3196
  %xor25 = xor i64 %3, %xor23, !dbg !3196
  store i64 %xor25, ptr %arrayidx24, align 8, !dbg !3196
  %inc = add nuw i32 %i.0, 1, !dbg !3197
    #dbg_value(i32 %inc, !3158, !DIExpression(), !3160)
  br label %for.cond, !dbg !3198, !llvm.loop !3199

for.end:                                          ; preds = %for.cond
  ret void, !dbg !3201
}

; Function Attrs: nounwind
define internal fastcc void @ef_unpack_m_vec(i32 noundef %legs, ptr noundef %in, ptr noundef %out) unnamed_addr #0 !dbg !3202 {
entry:
    #dbg_value(i32 %legs, !3205, !DIExpression(), !3206)
    #dbg_value(ptr %in, !3207, !DIExpression(), !3206)
    #dbg_value(ptr %out, !3208, !DIExpression(), !3206)
    #dbg_value(ptr %in, !3209, !DIExpression(), !3206)
    #dbg_value(i32 0, !3210, !DIExpression(), !3212)
  br label %for.cond, !dbg !3213

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %add8, %for.body ], !dbg !3214
    #dbg_value(i32 %i.0, !3210, !DIExpression(), !3212)
  %mul = shl nsw i32 %legs, 4, !dbg !3215
  %cmp = icmp slt i32 %i.0, %mul, !dbg !3217
  br i1 %cmp, label %for.body, label %for.end, !dbg !3218

for.body:                                         ; preds = %for.cond
  %div = lshr exact i32 %i.0, 1, !dbg !3219
  %arrayidx = getelementptr inbounds nuw i8, ptr %in, i32 %div, !dbg !3221
  %0 = load i8, ptr %arrayidx, align 1, !dbg !3221
  %1 = and i8 %0, 15, !dbg !3222
  %arrayidx2 = getelementptr inbounds nuw i8, ptr %out, i32 %i.0, !dbg !3223
  store i8 %1, ptr %arrayidx2, align 1, !dbg !3224
  %div3 = lshr exact i32 %i.0, 1, !dbg !3225
  %arrayidx4 = getelementptr inbounds nuw i8, ptr %in, i32 %div3, !dbg !3226
  %2 = load i8, ptr %arrayidx4, align 1, !dbg !3226
  %3 = lshr i8 %2, 4, !dbg !3227
  %add = or disjoint i32 %i.0, 1, !dbg !3228
  %arrayidx7 = getelementptr inbounds nuw i8, ptr %out, i32 %add, !dbg !3229
  store i8 %3, ptr %arrayidx7, align 1, !dbg !3230
  %add8 = add nuw nsw i32 %i.0, 2, !dbg !3231
    #dbg_value(i32 %add8, !3210, !DIExpression(), !3212)
  br label %for.cond, !dbg !3232, !llvm.loop !3233

for.end:                                          ; preds = %for.cond
  ret void, !dbg !3235
}

; Function Attrs: nounwind
define internal fastcc i32 @mul_table.22(i8 noundef zeroext %b) unnamed_addr #0 !dbg !3236 {
entry:
    #dbg_value(i8 %b, !3237, !DIExpression(), !3238)
  %conv = zext i8 %b to i32, !dbg !3239
  %mul = mul i32 %conv, 134480385, !dbg !3240
    #dbg_value(i32 %mul, !3241, !DIExpression(), !3238)
    #dbg_value(i32 -252645136, !3242, !DIExpression(), !3238)
  %and = and i32 %mul, -252645136, !dbg !3243
    #dbg_value(i32 %and, !3244, !DIExpression(), !3238)
  %shr = lshr exact i32 %and, 4, !dbg !3245
  %shr1 = lshr exact i32 %and, 3, !dbg !3246
  %0 = xor i32 %shr, %shr1, !dbg !3247
  %xor2 = xor i32 %0, %mul, !dbg !3247
  ret i32 %xor2, !dbg !3248
}

; Function Attrs: nounwind
define internal fastcc zeroext range(i8 0, 16) i8 @mul_f.23(i8 noundef zeroext %a, i8 noundef zeroext %b) unnamed_addr #0 !dbg !3249 {
entry:
    #dbg_value(i8 %a, !3250, !DIExpression(), !3251)
    #dbg_value(i8 %b, !3252, !DIExpression(), !3251)
  %0 = load volatile i8, ptr @pqmayo_MAYO_1_ref_unsigned_char_blocker, align 1, !dbg !3253
  %xor1 = xor i8 %a, %0, !dbg !3254
    #dbg_value(i8 %xor1, !3250, !DIExpression(), !3251)
  %1 = trunc i8 %xor1 to i1, !dbg !3255
    #dbg_value(i8 poison, !3256, !DIExpression(), !3251)
  %2 = and i8 %xor1, 2, !dbg !3257
  %mul9 = mul i8 %2, %b, !dbg !3258
  %conv10 = select i1 %1, i8 %b, i8 0, !dbg !3255
  %xor11 = xor i8 %conv10, %mul9, !dbg !3259
    #dbg_value(i8 %xor11, !3256, !DIExpression(), !3251)
  %3 = and i8 %xor1, 4, !dbg !3260
  %mul16 = mul i8 %3, %b, !dbg !3261
  %xor18 = xor i8 %mul16, %xor11, !dbg !3262
    #dbg_value(i8 %xor18, !3256, !DIExpression(), !3251)
  %4 = and i8 %xor1, 8, !dbg !3263
  %mul23 = mul i8 %4, %b, !dbg !3264
  %xor25 = xor i8 %mul23, %xor18, !dbg !3265
    #dbg_value(i8 %xor25, !3256, !DIExpression(), !3251)
    #dbg_value(i8 %xor25, !3266, !DIExpression(DW_OP_constu, 18446744073709551600, DW_OP_and, DW_OP_stack_value), !3251)
  %5 = lshr i8 %xor25, 4, !dbg !3267
  %6 = lshr i8 %xor25, 3, !dbg !3268
  %7 = and i8 %6, 14, !dbg !3268
  %8 = xor i8 %5, %7, !dbg !3269
  %xor25.masked = and i8 %xor25, 15, !dbg !3270
  %9 = xor i8 %8, %xor25.masked, !dbg !3270
    #dbg_value(i8 %9, !3271, !DIExpression(), !3251)
  ret i8 %9, !dbg !3272
}

; Function Attrs: nounwind
define internal fastcc zeroext i8 @lincomb.24(ptr noundef %a, ptr noundef %b, i32 noundef %n, i32 noundef %m) unnamed_addr #0 !dbg !3273 {
entry:
    #dbg_value(ptr %a, !3274, !DIExpression(), !3275)
    #dbg_value(ptr %b, !3276, !DIExpression(), !3275)
    #dbg_value(i32 %n, !3277, !DIExpression(), !3275)
    #dbg_value(i32 %m, !3278, !DIExpression(), !3275)
    #dbg_value(i8 0, !3279, !DIExpression(), !3275)
    #dbg_value(i32 0, !3280, !DIExpression(), !3282)
  %smax = call i32 @llvm.smax.i32(i32 %n, i32 0), !dbg !3283
  br label %for.cond, !dbg !3283

for.cond:                                         ; preds = %for.body, %entry
  %ret.0 = phi i8 [ 0, %entry ], [ %call1, %for.body ], !dbg !3275
  %b.addr.0 = phi ptr [ %b, %entry ], [ %add.ptr, %for.body ]
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.body ], !dbg !3284
    #dbg_value(i32 %i.0, !3280, !DIExpression(), !3282)
    #dbg_value(ptr %b.addr.0, !3276, !DIExpression(), !3275)
    #dbg_value(i8 %ret.0, !3279, !DIExpression(), !3275)
  %exitcond.not = icmp eq i32 %i.0, %smax, !dbg !3285
  br i1 %exitcond.not, label %for.end, label %for.body, !dbg !3287

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds nuw i8, ptr %a, i32 %i.0, !dbg !3288
  %0 = load i8, ptr %arrayidx, align 1, !dbg !3288
  %1 = load i8, ptr %b.addr.0, align 1, !dbg !3290
  %call = call fastcc zeroext i8 @mul_f.23(i8 noundef zeroext %0, i8 noundef zeroext %1) #6, !dbg !3291
  %call1 = call fastcc zeroext i8 @add_f.25(i8 noundef zeroext %call, i8 noundef zeroext %ret.0) #6, !dbg !3292
    #dbg_value(i8 %call1, !3279, !DIExpression(), !3275)
  %inc = add nuw i32 %i.0, 1, !dbg !3293
    #dbg_value(i32 %inc, !3280, !DIExpression(), !3282)
  %add.ptr = getelementptr inbounds i8, ptr %b.addr.0, i32 %m, !dbg !3294
    #dbg_value(ptr %add.ptr, !3276, !DIExpression(), !3275)
  br label %for.cond, !dbg !3295, !llvm.loop !3296

for.end:                                          ; preds = %for.cond
  ret i8 %ret.0, !dbg !3298
}

; Function Attrs: nounwind
define internal fastcc zeroext i8 @add_f.25(i8 noundef zeroext %a, i8 noundef zeroext %b) unnamed_addr #0 !dbg !3299 {
entry:
    #dbg_value(i8 %a, !3300, !DIExpression(), !3301)
    #dbg_value(i8 %b, !3302, !DIExpression(), !3301)
  %xor1 = xor i8 %a, %b, !dbg !3303
  ret i8 %xor1, !dbg !3304
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
!167 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sk_t", file: !79, line: 291, size: 1190592, elements: !168)
!168 = !{!169, !173}
!169 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !167, file: !79, line: 292, baseType: !170, size: 1185600)
!170 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 1185600, elements: !171)
!171 = !{!172}
!172 = !DISubrange(count: 18525)
!173 = !DIDerivedType(tag: DW_TAG_member, name: "O", scope: !167, file: !79, line: 293, baseType: !174, size: 4992, offset: 1185600)
!174 = !DICompositeType(tag: DW_TAG_array_type, baseType: !175, size: 4992, elements: !177)
!175 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !54, line: 24, baseType: !176)
!176 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !56, line: 43, baseType: !51)
!177 = !{!178}
!178 = !DISubrange(count: 624)
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
!261 = distinct !DISubprogram(name: "pqmayo_MAYO_1_ref_mayo_keypair", scope: !68, file: !68, line: 298, type: !262, scopeLine: 298, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
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
!301 = distinct !DISubprogram(name: "pqmayo_MAYO_1_ref_mayo_keypair_compact", scope: !68, file: !68, line: 538, type: !262, scopeLine: 539, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!302 = !DILocalVariable(name: "p", arg: 1, scope: !301, file: !68, line: 538, type: !264)
!303 = !DILocation(line: 0, scope: !301)
!304 = !DILocalVariable(name: "cpk", arg: 2, scope: !301, file: !68, line: 538, type: !61)
!305 = !DILocalVariable(name: "csk", arg: 3, scope: !301, file: !68, line: 539, type: !61)
!306 = !DILocalVariable(name: "ret", scope: !301, file: !68, line: 540, type: !86)
!307 = !DILocalVariable(name: "seed_sk", scope: !301, file: !68, line: 541, type: !61)
!308 = !DILocalVariable(name: "S", scope: !301, file: !68, line: 542, type: !309)
!309 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 2624, elements: !310)
!310 = !{!311}
!311 = !DISubrange(count: 328)
!312 = !DILocation(line: 542, column: 19, scope: !301)
!313 = !DILocalVariable(name: "P", scope: !301, file: !68, line: 543, type: !170)
!314 = !DILocation(line: 543, column: 14, scope: !301)
!315 = !DILocalVariable(name: "P3", scope: !301, file: !68, line: 544, type: !316)
!316 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 20480, elements: !317)
!317 = !{!318}
!318 = !DISubrange(count: 320)
!319 = !DILocation(line: 544, column: 14, scope: !301)
!320 = !DILocalVariable(name: "O", scope: !301, file: !68, line: 547, type: !321)
!321 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 4992, elements: !177)
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
!347 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 11520, elements: !348)
!348 = !{!349}
!349 = !DISubrange(count: 180)
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
!669 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 320, elements: !670)
!670 = !{!671}
!671 = !DISubrange(count: 5)
!672 = !DILocation(line: 265, column: 14, scope: !656)
!673 = !DILocalVariable(name: "i", scope: !674, file: !68, line: 266, type: !86)
!674 = distinct !DILexicalBlock(scope: !656, file: !68, line: 266, column: 5)
!675 = !DILocation(line: 0, scope: !674)
!676 = !DILocation(line: 266, column: 10, scope: !674)
!677 = !DILocation(line: 266, column: 28, scope: !678)
!678 = distinct !DILexicalBlock(scope: !674, file: !68, line: 266, column: 5)
!679 = !DILocation(line: 266, column: 5, scope: !674)
!680 = !DILocation(line: 266, scope: !674)
!681 = !DILocation(line: 268, column: 27, scope: !682)
!682 = distinct !DILexicalBlock(scope: !678, file: !68, line: 267, column: 5)
!683 = !DILocation(line: 268, column: 29, scope: !682)
!684 = !DILocation(line: 268, column: 24, scope: !682)
!685 = !DILocation(line: 268, column: 34, scope: !682)
!686 = !DILocation(line: 268, column: 9, scope: !682)
!687 = !DILocation(line: 269, column: 24, scope: !682)
!688 = !DILocation(line: 269, column: 36, scope: !682)
!689 = !DILocation(line: 269, column: 21, scope: !682)
!690 = !DILocation(line: 269, column: 71, scope: !682)
!691 = !DILocation(line: 269, column: 9, scope: !682)
!692 = !DILocation(line: 266, column: 5, scope: !678)
!693 = distinct !{!693, !679, !694, !388}
!694 = !DILocation(line: 270, column: 5, scope: !674)
!695 = !DILocation(line: 271, column: 1, scope: !656)
!696 = distinct !DISubprogram(name: "pqmayo_MAYO_1_ref_mayo_expand_sk", scope: !68, file: !68, line: 310, type: !697, scopeLine: 311, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!697 = !DISubroutineType(types: !698)
!698 = !{!86, !264, !90, !699}
!699 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !700, size: 32)
!700 = !DIDerivedType(tag: DW_TAG_typedef, name: "sk_t", file: !79, line: 294, baseType: !701)
!701 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "sk_t", file: !79, line: 291, size: 1190592, elements: !702)
!702 = !{!703, !704}
!703 = !DIDerivedType(tag: DW_TAG_member, name: "p", scope: !701, file: !79, line: 292, baseType: !170, size: 1185600)
!704 = !DIDerivedType(tag: DW_TAG_member, name: "O", scope: !701, file: !79, line: 293, baseType: !174, size: 4992, offset: 1185600)
!705 = !DILocalVariable(name: "p", arg: 1, scope: !696, file: !68, line: 310, type: !264)
!706 = !DILocation(line: 0, scope: !696)
!707 = !DILocalVariable(name: "csk", arg: 2, scope: !696, file: !68, line: 310, type: !90)
!708 = !DILocalVariable(name: "sk", arg: 3, scope: !696, file: !68, line: 311, type: !699)
!709 = !DILocalVariable(name: "ret", scope: !696, file: !68, line: 312, type: !86)
!710 = !DILocalVariable(name: "S", scope: !696, file: !68, line: 313, type: !309)
!711 = !DILocation(line: 313, column: 19, scope: !696)
!712 = !DILocalVariable(name: "P", scope: !696, file: !68, line: 314, type: !52)
!713 = !DILocation(line: 315, column: 28, scope: !696)
!714 = !DILocalVariable(name: "O", scope: !696, file: !68, line: 315, type: !61)
!715 = !DILocalVariable(name: "param_o", scope: !696, file: !68, line: 317, type: !324)
!716 = !DILocalVariable(name: "param_v", scope: !696, file: !68, line: 318, type: !324)
!717 = !DILocalVariable(name: "param_O_bytes", scope: !696, file: !68, line: 319, type: !324)
!718 = !DILocalVariable(name: "param_pk_seed_bytes", scope: !696, file: !68, line: 320, type: !324)
!719 = !DILocalVariable(name: "param_sk_seed_bytes", scope: !696, file: !68, line: 321, type: !324)
!720 = !DILocalVariable(name: "seed_sk", scope: !696, file: !68, line: 323, type: !90)
!721 = !DILocalVariable(name: "seed_pk", scope: !696, file: !68, line: 324, type: !61)
!722 = !DILocation(line: 326, column: 5, scope: !696)
!723 = !DILocation(line: 328, column: 14, scope: !696)
!724 = !DILocation(line: 328, column: 5, scope: !696)
!725 = !DILocation(line: 334, column: 5, scope: !696)
!726 = !DILocation(line: 341, column: 22, scope: !696)
!727 = !DILocalVariable(name: "P2", scope: !696, file: !68, line: 341, type: !52)
!728 = !DILocalVariable(name: "P1", scope: !696, file: !68, line: 343, type: !52)
!729 = !DILocalVariable(name: "L", scope: !696, file: !68, line: 346, type: !52)
!730 = !DILocation(line: 347, column: 5, scope: !696)
!731 = !DILocation(line: 355, column: 5, scope: !696)
!732 = !DILocation(line: 356, column: 5, scope: !696)
!733 = distinct !DISubprogram(name: "P1P1t_times_O", scope: !408, file: !408, line: 218, type: !459, scopeLine: 218, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!734 = !DILocalVariable(name: "p", arg: 1, scope: !733, file: !408, line: 218, type: !264)
!735 = !DILocation(line: 0, scope: !733)
!736 = !DILocalVariable(name: "P1", arg: 2, scope: !733, file: !408, line: 218, type: !411)
!737 = !DILocalVariable(name: "O", arg: 3, scope: !733, file: !408, line: 218, type: !90)
!738 = !DILocalVariable(name: "acc", arg: 4, scope: !733, file: !408, line: 218, type: !52)
!739 = !DILocalVariable(name: "param_o", scope: !733, file: !408, line: 222, type: !324)
!740 = !DILocalVariable(name: "param_v", scope: !733, file: !408, line: 223, type: !324)
!741 = !DILocalVariable(name: "m_vec_limbs", scope: !733, file: !408, line: 224, type: !324)
!742 = !DILocalVariable(name: "bs_mat_entries_used", scope: !733, file: !408, line: 226, type: !86)
!743 = !DILocalVariable(name: "r", scope: !744, file: !408, line: 227, type: !86)
!744 = distinct !DILexicalBlock(scope: !733, file: !408, line: 227, column: 5)
!745 = !DILocation(line: 0, scope: !744)
!746 = !DILocation(line: 227, column: 10, scope: !744)
!747 = !DILocation(line: 226, column: 9, scope: !733)
!748 = !DILocation(line: 227, scope: !744)
!749 = !DILocation(line: 227, column: 23, scope: !750)
!750 = distinct !DILexicalBlock(scope: !744, file: !408, line: 227, column: 5)
!751 = !DILocation(line: 227, column: 5, scope: !744)
!752 = !DILocation(line: 228, column: 9, scope: !753)
!753 = distinct !DILexicalBlock(scope: !754, file: !408, line: 228, column: 9)
!754 = distinct !DILexicalBlock(scope: !750, file: !408, line: 227, column: 39)
!755 = !DILocation(line: 228, scope: !753)
!756 = !DILocalVariable(name: "c", scope: !753, file: !408, line: 228, type: !86)
!757 = !DILocation(line: 0, scope: !753)
!758 = !DILocation(line: 228, column: 27, scope: !759)
!759 = distinct !DILexicalBlock(scope: !753, file: !408, line: 228, column: 9)
!760 = !DILocation(line: 229, column: 17, scope: !761)
!761 = distinct !DILexicalBlock(scope: !762, file: !408, line: 229, column: 16)
!762 = distinct !DILexicalBlock(scope: !759, file: !408, line: 228, column: 43)
!763 = !DILocation(line: 234, column: 47, scope: !764)
!764 = distinct !DILexicalBlock(scope: !765, file: !408, line: 233, column: 50)
!765 = distinct !DILexicalBlock(scope: !766, file: !408, line: 233, column: 13)
!766 = distinct !DILexicalBlock(scope: !762, file: !408, line: 233, column: 13)
!767 = !DILocation(line: 234, column: 88, scope: !764)
!768 = !DILocation(line: 233, column: 13, scope: !766)
!769 = !DILocation(line: 233, scope: !766)
!770 = !DILocalVariable(name: "k", scope: !766, file: !408, line: 233, type: !86)
!771 = !DILocation(line: 0, scope: !766)
!772 = !DILocation(line: 234, column: 98, scope: !764)
!773 = !DILocation(line: 234, column: 84, scope: !764)
!774 = !DILocation(line: 234, column: 127, scope: !764)
!775 = !DILocation(line: 234, column: 137, scope: !764)
!776 = !DILocation(line: 234, column: 108, scope: !764)
!777 = !DILocation(line: 234, column: 17, scope: !764)
!778 = !DILocation(line: 235, column: 47, scope: !764)
!779 = !DILocation(line: 235, column: 88, scope: !764)
!780 = !DILocation(line: 235, column: 98, scope: !764)
!781 = !DILocation(line: 235, column: 84, scope: !764)
!782 = !DILocation(line: 235, column: 127, scope: !764)
!783 = !DILocation(line: 235, column: 137, scope: !764)
!784 = !DILocation(line: 235, column: 108, scope: !764)
!785 = !DILocation(line: 235, column: 17, scope: !764)
!786 = !DILocation(line: 233, column: 44, scope: !765)
!787 = !DILocation(line: 233, column: 31, scope: !765)
!788 = !DILocation(line: 233, column: 13, scope: !765)
!789 = distinct !{!789, !768, !790, !388}
!790 = !DILocation(line: 236, column: 13, scope: !766)
!791 = !DILocation(line: 0, scope: !762)
!792 = !DILocation(line: 228, column: 39, scope: !759)
!793 = !DILocation(line: 228, column: 9, scope: !759)
!794 = distinct !{!794, !752, !795, !388}
!795 = !DILocation(line: 238, column: 9, scope: !753)
!796 = !DILocation(line: 227, column: 35, scope: !750)
!797 = !DILocation(line: 227, column: 5, scope: !750)
!798 = distinct !{!798, !751, !799, !388}
!799 = !DILocation(line: 239, column: 5, scope: !744)
!800 = !DILocation(line: 240, column: 1, scope: !733)
!801 = distinct !DISubprogram(name: "pqmayo_MAYO_1_ref_mayo_sign_signature", scope: !68, file: !68, line: 359, type: !802, scopeLine: 361, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!802 = !DISubroutineType(types: !803)
!803 = !{!86, !264, !61, !804, !90, !58, !90}
!804 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 32)
!805 = !DILocalVariable(name: "p", arg: 1, scope: !801, file: !68, line: 359, type: !264)
!806 = !DILocation(line: 0, scope: !801)
!807 = !DILocalVariable(name: "sig", arg: 2, scope: !801, file: !68, line: 359, type: !61)
!808 = !DILocalVariable(name: "siglen", arg: 3, scope: !801, file: !68, line: 360, type: !804)
!809 = !DILocalVariable(name: "m", arg: 4, scope: !801, file: !68, line: 360, type: !90)
!810 = !DILocalVariable(name: "mlen", arg: 5, scope: !801, file: !68, line: 361, type: !58)
!811 = !DILocalVariable(name: "csk", arg: 6, scope: !801, file: !68, line: 361, type: !90)
!812 = !DILocalVariable(name: "ret", scope: !801, file: !68, line: 362, type: !86)
!813 = !DILocalVariable(name: "tenc", scope: !801, file: !68, line: 363, type: !814)
!814 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 312, elements: !39)
!815 = !DILocation(line: 363, column: 19, scope: !801)
!816 = !DILocalVariable(name: "t", scope: !801, file: !68, line: 363, type: !817)
!817 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 624, elements: !818)
!818 = !{!819}
!819 = !DISubrange(count: 78)
!820 = !DILocation(line: 363, column: 38, scope: !801)
!821 = !DILocalVariable(name: "y", scope: !801, file: !68, line: 364, type: !817)
!822 = !DILocation(line: 364, column: 19, scope: !801)
!823 = !DILocalVariable(name: "salt", scope: !801, file: !68, line: 365, type: !824)
!824 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 192, elements: !825)
!825 = !{!826}
!826 = !DISubrange(count: 24)
!827 = !DILocation(line: 365, column: 19, scope: !801)
!828 = !DILocalVariable(name: "V", scope: !801, file: !68, line: 366, type: !829)
!829 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 3440, elements: !830)
!830 = !{!831}
!831 = !DISubrange(count: 430)
!832 = !DILocation(line: 366, column: 19, scope: !801)
!833 = !DILocalVariable(name: "Vdec", scope: !801, file: !68, line: 366, type: !834)
!834 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 6240, elements: !835)
!835 = !{!836}
!836 = !DISubrange(count: 780)
!837 = !DILocation(line: 366, column: 57, scope: !801)
!838 = !DILocalVariable(name: "A", scope: !801, file: !68, line: 367, type: !839)
!839 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 51840, elements: !840)
!840 = !{!841}
!841 = !DISubrange(count: 6480)
!842 = !DILocation(line: 367, column: 19, scope: !801)
!843 = !DILocalVariable(name: "x", scope: !801, file: !68, line: 368, type: !844)
!844 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 6880, elements: !845)
!845 = !{!846}
!846 = !DISubrange(count: 860)
!847 = !DILocation(line: 368, column: 19, scope: !801)
!848 = !DILocalVariable(name: "r", scope: !801, file: !68, line: 369, type: !849)
!849 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 648, elements: !850)
!850 = !{!851}
!851 = !DISubrange(count: 81)
!852 = !DILocation(line: 369, column: 19, scope: !801)
!853 = !DILocalVariable(name: "s", scope: !801, file: !68, line: 370, type: !844)
!854 = !DILocation(line: 370, column: 19, scope: !801)
!855 = !DILocalVariable(name: "sk", scope: !801, file: !68, line: 372, type: !700, align: 256)
!856 = !DILocation(line: 372, column: 22, scope: !801)
!857 = !DILocalVariable(name: "Ox", scope: !801, file: !68, line: 373, type: !817)
!858 = !DILocation(line: 373, column: 19, scope: !801)
!859 = !DILocalVariable(name: "tmp", scope: !801, file: !68, line: 374, type: !849)
!860 = !DILocation(line: 374, column: 19, scope: !801)
!861 = !DILocalVariable(name: "param_m", scope: !801, file: !68, line: 378, type: !324)
!862 = !DILocalVariable(name: "param_n", scope: !801, file: !68, line: 379, type: !324)
!863 = !DILocalVariable(name: "param_o", scope: !801, file: !68, line: 380, type: !324)
!864 = !DILocalVariable(name: "param_k", scope: !801, file: !68, line: 381, type: !324)
!865 = !DILocalVariable(name: "param_v", scope: !801, file: !68, line: 382, type: !324)
!866 = !DILocalVariable(name: "param_m_bytes", scope: !801, file: !68, line: 383, type: !324)
!867 = !DILocalVariable(name: "param_v_bytes", scope: !801, file: !68, line: 384, type: !324)
!868 = !DILocalVariable(name: "param_r_bytes", scope: !801, file: !68, line: 385, type: !324)
!869 = !DILocalVariable(name: "param_sig_bytes", scope: !801, file: !68, line: 386, type: !324)
!870 = !DILocalVariable(name: "param_A_cols", scope: !801, file: !68, line: 387, type: !324)
!871 = !DILocalVariable(name: "param_digest_bytes", scope: !801, file: !68, line: 388, type: !324)
!872 = !DILocalVariable(name: "param_sk_seed_bytes", scope: !801, file: !68, line: 389, type: !324)
!873 = !DILocalVariable(name: "param_salt_bytes", scope: !801, file: !68, line: 390, type: !324)
!874 = !DILocation(line: 392, column: 11, scope: !801)
!875 = !DILocation(line: 393, column: 13, scope: !876)
!876 = distinct !DILexicalBlock(scope: !801, file: !68, line: 393, column: 9)
!877 = !DILocalVariable(name: "seed_sk", scope: !801, file: !68, line: 371, type: !90)
!878 = !DILocation(line: 401, column: 5, scope: !801)
!879 = !DILocalVariable(name: "P1", scope: !801, file: !68, line: 403, type: !52)
!880 = !DILocation(line: 404, column: 23, scope: !801)
!881 = !DILocalVariable(name: "L", scope: !801, file: !68, line: 404, type: !52)
!882 = !DILocalVariable(name: "Mtmp", scope: !801, file: !68, line: 405, type: !883)
!883 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 25600, elements: !884)
!884 = !{!885}
!885 = !DISubrange(count: 400)
!886 = !DILocation(line: 405, column: 14, scope: !801)
!887 = !DILocation(line: 420, column: 25, scope: !888)
!888 = distinct !DILexicalBlock(scope: !801, file: !68, line: 420, column: 9)
!889 = !DILocation(line: 420, column: 9, scope: !888)
!890 = !DILocation(line: 420, column: 65, scope: !888)
!891 = !DILocation(line: 427, column: 37, scope: !801)
!892 = !DILocation(line: 427, column: 5, scope: !801)
!893 = !DILocation(line: 429, column: 5, scope: !801)
!894 = !DILocation(line: 437, column: 16, scope: !801)
!895 = !DILocation(line: 437, column: 5, scope: !801)
!896 = !DILocation(line: 438, column: 59, scope: !801)
!897 = !DILocalVariable(name: "ctrbyte", scope: !801, file: !68, line: 375, type: !61)
!898 = !DILocation(line: 440, column: 5, scope: !801)
!899 = !DILocation(line: 442, column: 5, scope: !801)
!900 = !DILocalVariable(name: "ctr", scope: !901, file: !68, line: 444, type: !86)
!901 = distinct !DILexicalBlock(scope: !801, file: !68, line: 444, column: 5)
!902 = !DILocation(line: 0, scope: !901)
!903 = !DILocation(line: 466, column: 18, scope: !904)
!904 = distinct !DILexicalBlock(scope: !905, file: !68, line: 444, column: 42)
!905 = distinct !DILexicalBlock(scope: !901, file: !68, line: 444, column: 5)
!906 = !DILocation(line: 444, column: 10, scope: !901)
!907 = !DILocation(line: 444, scope: !901)
!908 = !DILocation(line: 444, column: 27, scope: !905)
!909 = !DILocation(line: 444, column: 5, scope: !901)
!910 = !DILocation(line: 445, column: 20, scope: !904)
!911 = !DILocation(line: 445, column: 18, scope: !904)
!912 = !DILocation(line: 447, column: 9, scope: !904)
!913 = !DILocalVariable(name: "i", scope: !914, file: !68, line: 451, type: !86)
!914 = distinct !DILexicalBlock(scope: !904, file: !68, line: 451, column: 9)
!915 = !DILocation(line: 0, scope: !914)
!916 = !DILocation(line: 452, column: 13, scope: !917)
!917 = distinct !DILexicalBlock(scope: !918, file: !68, line: 451, column: 48)
!918 = distinct !DILexicalBlock(scope: !914, file: !68, line: 451, column: 9)
!919 = !DILocation(line: 452, column: 22, scope: !917)
!920 = !DILocation(line: 452, column: 48, scope: !917)
!921 = !DILocation(line: 456, column: 9, scope: !904)
!922 = !DILocation(line: 458, column: 9, scope: !904)
!923 = !DILocation(line: 459, column: 9, scope: !904)
!924 = !DILocalVariable(name: "i", scope: !925, file: !68, line: 461, type: !86)
!925 = distinct !DILexicalBlock(scope: !904, file: !68, line: 461, column: 9)
!926 = !DILocation(line: 0, scope: !925)
!927 = !DILocation(line: 461, column: 14, scope: !925)
!928 = !DILocation(line: 461, scope: !925)
!929 = !DILocation(line: 463, column: 20, scope: !930)
!930 = distinct !DILexicalBlock(scope: !931, file: !68, line: 462, column: 9)
!931 = distinct !DILexicalBlock(scope: !925, file: !68, line: 461, column: 9)
!932 = !DILocation(line: 463, column: 43, scope: !930)
!933 = !DILocation(line: 463, column: 13, scope: !930)
!934 = !DILocation(line: 463, column: 48, scope: !930)
!935 = !DILocation(line: 461, column: 27, scope: !931)
!936 = !DILocation(line: 461, column: 9, scope: !925)
!937 = !DILocation(line: 461, column: 39, scope: !931)
!938 = !DILocation(line: 461, column: 9, scope: !931)
!939 = distinct !{!939, !936, !940, !388}
!940 = !DILocation(line: 464, column: 9, scope: !925)
!941 = !DILocation(line: 466, column: 9, scope: !904)
!942 = !DILocation(line: 470, column: 13, scope: !943)
!943 = distinct !DILexicalBlock(scope: !904, file: !68, line: 470, column: 13)
!944 = !DILocation(line: 473, column: 13, scope: !945)
!945 = distinct !DILexicalBlock(scope: !943, file: !68, line: 472, column: 16)
!946 = !DILocation(line: 474, column: 13, scope: !945)
!947 = !DILocation(line: 444, column: 35, scope: !905)
!948 = !DILocation(line: 444, column: 5, scope: !905)
!949 = distinct !{!949, !909, !950, !388}
!950 = !DILocation(line: 476, column: 5, scope: !901)
!951 = !DILocalVariable(name: "i", scope: !952, file: !68, line: 478, type: !86)
!952 = distinct !DILexicalBlock(scope: !801, file: !68, line: 478, column: 5)
!953 = !DILocation(line: 0, scope: !952)
!954 = !DILocation(line: 478, column: 10, scope: !952)
!955 = !DILocation(line: 478, scope: !952)
!956 = !DILocation(line: 478, column: 23, scope: !957)
!957 = distinct !DILexicalBlock(scope: !952, file: !68, line: 478, column: 5)
!958 = !DILocation(line: 478, column: 5, scope: !952)
!959 = !DILocation(line: 479, column: 23, scope: !960)
!960 = distinct !DILexicalBlock(scope: !957, file: !68, line: 478, column: 44)
!961 = !DILocation(line: 479, column: 19, scope: !960)
!962 = !DILocalVariable(name: "vi", scope: !801, file: !68, line: 376, type: !61)
!963 = !DILocation(line: 480, column: 20, scope: !960)
!964 = !DILocation(line: 480, column: 29, scope: !960)
!965 = !DILocation(line: 480, column: 25, scope: !960)
!966 = !DILocation(line: 480, column: 9, scope: !960)
!967 = !DILocation(line: 481, column: 31, scope: !960)
!968 = !DILocation(line: 481, column: 27, scope: !960)
!969 = !DILocation(line: 481, column: 9, scope: !960)
!970 = !DILocation(line: 482, column: 22, scope: !960)
!971 = !DILocation(line: 482, column: 18, scope: !960)
!972 = !DILocation(line: 482, column: 32, scope: !960)
!973 = !DILocation(line: 482, column: 61, scope: !960)
!974 = !DILocation(line: 482, column: 57, scope: !960)
!975 = !DILocation(line: 482, column: 9, scope: !960)
!976 = !DILocation(line: 478, column: 39, scope: !957)
!977 = !DILocation(line: 478, column: 5, scope: !957)
!978 = distinct !{!978, !958, !979, !388}
!979 = !DILocation(line: 483, column: 5, scope: !952)
!980 = !DILocation(line: 484, column: 5, scope: !801)
!981 = !DILocation(line: 486, column: 34, scope: !801)
!982 = !DILocation(line: 486, column: 5, scope: !801)
!983 = !DILocation(line: 487, column: 13, scope: !801)
!984 = !DILocation(line: 487, column: 5, scope: !801)
!985 = !DILabel(scope: !801, name: "err", file: !68, line: 489)
!986 = !DILocation(line: 489, column: 1, scope: !801)
!987 = !DILocation(line: 490, column: 5, scope: !801)
!988 = !DILocation(line: 491, column: 5, scope: !801)
!989 = !DILocation(line: 492, column: 5, scope: !801)
!990 = !DILocation(line: 493, column: 5, scope: !801)
!991 = !DILocation(line: 494, column: 26, scope: !801)
!992 = !DILocation(line: 494, column: 5, scope: !801)
!993 = !DILocation(line: 495, column: 5, scope: !801)
!994 = !DILocation(line: 496, column: 5, scope: !801)
!995 = !DILocation(line: 497, column: 5, scope: !801)
!996 = !DILocation(line: 498, column: 5, scope: !801)
!997 = !DILocation(line: 499, column: 5, scope: !801)
!998 = distinct !DISubprogram(name: "compute_M_and_VPV", scope: !408, file: !408, line: 244, type: !999, scopeLine: 244, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!999 = !DISubroutineType(types: !1000)
!1000 = !{null, !264, !90, !411, !411, !52, !52}
!1001 = !DILocalVariable(name: "p", arg: 1, scope: !998, file: !408, line: 244, type: !264)
!1002 = !DILocation(line: 0, scope: !998)
!1003 = !DILocalVariable(name: "Vdec", arg: 2, scope: !998, file: !408, line: 244, type: !90)
!1004 = !DILocalVariable(name: "L", arg: 3, scope: !998, file: !408, line: 244, type: !411)
!1005 = !DILocalVariable(name: "P1", arg: 4, scope: !998, file: !408, line: 244, type: !411)
!1006 = !DILocalVariable(name: "VL", arg: 5, scope: !998, file: !408, line: 244, type: !52)
!1007 = !DILocalVariable(name: "VP1V", arg: 6, scope: !998, file: !408, line: 244, type: !52)
!1008 = !DILocalVariable(name: "param_k", scope: !998, file: !408, line: 246, type: !324)
!1009 = !DILocalVariable(name: "param_v", scope: !998, file: !408, line: 247, type: !324)
!1010 = !DILocalVariable(name: "param_o", scope: !998, file: !408, line: 248, type: !324)
!1011 = !DILocation(line: 251, column: 5, scope: !998)
!1012 = !DILocalVariable(name: "Pv", scope: !998, file: !408, line: 254, type: !1013)
!1013 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 249600, elements: !1014)
!1014 = !{!1015}
!1015 = !DISubrange(count: 3900)
!1016 = !DILocation(line: 254, column: 14, scope: !998)
!1017 = !DILocation(line: 255, column: 5, scope: !998)
!1018 = !DILocation(line: 256, column: 5, scope: !998)
!1019 = !DILocation(line: 257, column: 1, scope: !998)
!1020 = distinct !DISubprogram(name: "compute_rhs", scope: !68, file: !68, line: 43, type: !1021, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1021 = !DISubroutineType(types: !1022)
!1022 = !{null, !264, !52, !90, !61}
!1023 = !DILocalVariable(name: "p", arg: 1, scope: !1020, file: !68, line: 43, type: !264)
!1024 = !DILocation(line: 0, scope: !1020)
!1025 = !DILocalVariable(name: "vPv", arg: 2, scope: !1020, file: !68, line: 43, type: !52)
!1026 = !DILocalVariable(name: "t", arg: 3, scope: !1020, file: !68, line: 43, type: !90)
!1027 = !DILocalVariable(name: "y", arg: 4, scope: !1020, file: !68, line: 43, type: !61)
!1028 = !DILocalVariable(name: "top_pos", scope: !1020, file: !68, line: 48, type: !1029)
!1029 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !58)
!1030 = !DILocalVariable(name: "m_vec_limbs", scope: !1020, file: !68, line: 49, type: !1029)
!1031 = !DILocalVariable(name: "mask", scope: !1032, file: !68, line: 53, type: !53)
!1032 = distinct !DILexicalBlock(scope: !1033, file: !68, line: 52, column: 29)
!1033 = distinct !DILexicalBlock(scope: !1020, file: !68, line: 52, column: 8)
!1034 = !DILocation(line: 0, scope: !1032)
!1035 = !DILocalVariable(name: "i", scope: !1036, file: !68, line: 56, type: !86)
!1036 = distinct !DILexicalBlock(scope: !1032, file: !68, line: 56, column: 9)
!1037 = !DILocation(line: 0, scope: !1036)
!1038 = !DILocation(line: 56, column: 14, scope: !1036)
!1039 = !DILocation(line: 56, scope: !1036)
!1040 = !DILocation(line: 58, column: 13, scope: !1041)
!1041 = distinct !DILexicalBlock(scope: !1042, file: !68, line: 57, column: 9)
!1042 = distinct !DILexicalBlock(scope: !1036, file: !68, line: 56, column: 9)
!1043 = !DILocation(line: 58, column: 50, scope: !1041)
!1044 = !DILocation(line: 56, column: 27, scope: !1042)
!1045 = !DILocation(line: 56, column: 9, scope: !1036)
!1046 = !DILocation(line: 56, column: 53, scope: !1042)
!1047 = !DILocation(line: 56, column: 9, scope: !1042)
!1048 = distinct !{!1048, !1045, !1049, !388}
!1049 = !DILocation(line: 59, column: 9, scope: !1036)
!1050 = !DILocalVariable(name: "temp", scope: !1020, file: !68, line: 62, type: !669)
!1051 = !DILocation(line: 62, column: 14, scope: !1020)
!1052 = !DILocalVariable(name: "temp_bytes", scope: !1020, file: !68, line: 63, type: !61)
!1053 = !DILocalVariable(name: "i", scope: !1054, file: !68, line: 64, type: !86)
!1054 = distinct !DILexicalBlock(scope: !1020, file: !68, line: 64, column: 5)
!1055 = !DILocation(line: 0, scope: !1054)
!1056 = !DILocation(line: 64, column: 10, scope: !1054)
!1057 = !DILocation(line: 64, scope: !1054)
!1058 = !DILocation(line: 64, column: 36, scope: !1059)
!1059 = distinct !DILexicalBlock(scope: !1054, file: !68, line: 64, column: 5)
!1060 = !DILocation(line: 64, column: 5, scope: !1054)
!1061 = !DILocation(line: 65, scope: !1062)
!1062 = distinct !DILexicalBlock(scope: !1063, file: !68, line: 65, column: 9)
!1063 = distinct !DILexicalBlock(scope: !1059, file: !68, line: 64, column: 48)
!1064 = !DILocalVariable(name: "j", scope: !1062, file: !68, line: 65, type: !86)
!1065 = !DILocation(line: 0, scope: !1062)
!1066 = !DILocation(line: 65, column: 27, scope: !1067)
!1067 = distinct !DILexicalBlock(scope: !1062, file: !68, line: 65, column: 9)
!1068 = !DILocation(line: 65, column: 9, scope: !1062)
!1069 = !DILocation(line: 67, column: 34, scope: !1070)
!1070 = distinct !DILexicalBlock(scope: !1067, file: !68, line: 65, column: 46)
!1071 = !DILocation(line: 67, column: 54, scope: !1070)
!1072 = !DILocation(line: 67, column: 66, scope: !1070)
!1073 = !DILocalVariable(name: "top", scope: !1070, file: !68, line: 67, type: !51)
!1074 = !DILocation(line: 0, scope: !1070)
!1075 = !DILocation(line: 68, column: 13, scope: !1070)
!1076 = !DILocation(line: 68, column: 33, scope: !1070)
!1077 = !DILocalVariable(name: "k", scope: !1078, file: !68, line: 69, type: !86)
!1078 = distinct !DILexicalBlock(scope: !1070, file: !68, line: 69, column: 13)
!1079 = !DILocation(line: 0, scope: !1078)
!1080 = !DILocation(line: 70, column: 30, scope: !1081)
!1081 = distinct !DILexicalBlock(scope: !1082, file: !68, line: 69, column: 52)
!1082 = distinct !DILexicalBlock(scope: !1078, file: !68, line: 69, column: 13)
!1083 = !DILocation(line: 70, column: 38, scope: !1081)
!1084 = !DILocation(line: 70, column: 17, scope: !1081)
!1085 = !DILocation(line: 70, column: 27, scope: !1081)
!1086 = !DILocation(line: 71, column: 17, scope: !1081)
!1087 = !DILocation(line: 71, column: 25, scope: !1081)
!1088 = !DILocalVariable(name: "jj", scope: !1089, file: !68, line: 74, type: !86)
!1089 = distinct !DILexicalBlock(scope: !1070, file: !68, line: 74, column: 13)
!1090 = !DILocation(line: 0, scope: !1089)
!1091 = !DILocation(line: 79, column: 41, scope: !1092)
!1092 = distinct !DILexicalBlock(scope: !1093, file: !68, line: 75, column: 30)
!1093 = distinct !DILexicalBlock(scope: !1094, file: !68, line: 75, column: 20)
!1094 = distinct !DILexicalBlock(scope: !1095, file: !68, line: 74, column: 53)
!1095 = distinct !DILexicalBlock(scope: !1089, file: !68, line: 74, column: 13)
!1096 = !DILocation(line: 79, column: 38, scope: !1092)
!1097 = !DILocation(line: 86, column: 41, scope: !1098)
!1098 = distinct !DILexicalBlock(scope: !1093, file: !68, line: 82, column: 22)
!1099 = !DILocation(line: 86, column: 73, scope: !1098)
!1100 = !DILocation(line: 86, column: 38, scope: !1098)
!1101 = !DILocation(line: 79, column: 21, scope: !1092)
!1102 = !DILocation(line: 86, column: 21, scope: !1098)
!1103 = !DILocalVariable(name: "k", scope: !1104, file: !68, line: 92, type: !58)
!1104 = distinct !DILexicalBlock(scope: !1070, file: !68, line: 92, column: 13)
!1105 = !DILocation(line: 0, scope: !1104)
!1106 = !DILocation(line: 93, column: 36, scope: !1107)
!1107 = distinct !DILexicalBlock(scope: !1108, file: !68, line: 92, column: 51)
!1108 = distinct !DILexicalBlock(scope: !1104, file: !68, line: 92, column: 13)
!1109 = !DILocation(line: 93, column: 49, scope: !1107)
!1110 = !DILocation(line: 93, column: 28, scope: !1107)
!1111 = !DILocation(line: 93, column: 78, scope: !1107)
!1112 = !DILocation(line: 93, column: 91, scope: !1107)
!1113 = !DILocation(line: 93, column: 104, scope: !1107)
!1114 = !DILocation(line: 93, column: 83, scope: !1107)
!1115 = !DILocation(line: 93, column: 82, scope: !1107)
!1116 = !DILocation(line: 93, column: 73, scope: !1107)
!1117 = !DILocation(line: 93, column: 25, scope: !1107)
!1118 = !DILocation(line: 93, column: 17, scope: !1107)
!1119 = !DILocation(line: 65, column: 42, scope: !1067)
!1120 = !DILocation(line: 65, column: 9, scope: !1067)
!1121 = distinct !{!1121, !1068, !1122, !388}
!1122 = !DILocation(line: 95, column: 9, scope: !1062)
!1123 = !DILocation(line: 64, column: 44, scope: !1059)
!1124 = !DILocation(line: 64, column: 5, scope: !1059)
!1125 = distinct !{!1125, !1060, !1126, !388}
!1126 = !DILocation(line: 96, column: 5, scope: !1054)
!1127 = !DILocation(line: 99, scope: !1128)
!1128 = distinct !DILexicalBlock(scope: !1020, file: !68, line: 99, column: 5)
!1129 = !DILocalVariable(name: "i", scope: !1128, file: !68, line: 99, type: !86)
!1130 = !DILocation(line: 0, scope: !1128)
!1131 = !DILocation(line: 105, column: 18, scope: !1132)
!1132 = distinct !DILexicalBlock(scope: !1133, file: !68, line: 100, column: 5)
!1133 = distinct !DILexicalBlock(scope: !1128, file: !68, line: 99, column: 5)
!1134 = !DILocation(line: 105, column: 40, scope: !1132)
!1135 = !DILocation(line: 105, column: 28, scope: !1132)
!1136 = !DILocation(line: 105, column: 44, scope: !1132)
!1137 = !DILocation(line: 105, column: 25, scope: !1132)
!1138 = !DILocation(line: 105, column: 9, scope: !1132)
!1139 = !DILocation(line: 105, column: 16, scope: !1132)
!1140 = !DILocation(line: 106, column: 21, scope: !1132)
!1141 = !DILocation(line: 106, column: 18, scope: !1132)
!1142 = !DILocation(line: 106, column: 44, scope: !1132)
!1143 = !DILocation(line: 106, column: 25, scope: !1132)
!1144 = !DILocation(line: 106, column: 12, scope: !1132)
!1145 = !DILocation(line: 106, column: 9, scope: !1132)
!1146 = !DILocation(line: 106, column: 16, scope: !1132)
!1147 = !DILocation(line: 99, column: 38, scope: !1133)
!1148 = !DILocation(line: 99, column: 23, scope: !1133)
!1149 = !DILocation(line: 99, column: 5, scope: !1128)
!1150 = !DILocation(line: 99, column: 5, scope: !1133)
!1151 = distinct !{!1151, !1149, !1152, !388}
!1152 = !DILocation(line: 108, column: 5, scope: !1128)
!1153 = !DILocation(line: 109, column: 1, scope: !1020)
!1154 = distinct !DISubprogram(name: "compute_A", scope: !68, file: !68, line: 154, type: !1155, scopeLine: 154, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1155 = !DISubroutineType(types: !1156)
!1156 = !{null, !264, !52, !61}
!1157 = !DILocalVariable(name: "p", arg: 1, scope: !1154, file: !68, line: 154, type: !264)
!1158 = !DILocation(line: 0, scope: !1154)
!1159 = !DILocalVariable(name: "VtL", arg: 2, scope: !1154, file: !68, line: 154, type: !52)
!1160 = !DILocalVariable(name: "A_out", arg: 3, scope: !1154, file: !68, line: 154, type: !61)
!1161 = !DILocalVariable(name: "bits_to_shift", scope: !1154, file: !68, line: 159, type: !86)
!1162 = !DILocalVariable(name: "words_to_shift", scope: !1154, file: !68, line: 160, type: !86)
!1163 = !DILocalVariable(name: "m_vec_limbs", scope: !1154, file: !68, line: 161, type: !324)
!1164 = !DILocalVariable(name: "A", scope: !1154, file: !68, line: 162, type: !1165)
!1165 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 51200, elements: !1166)
!1166 = !{!1167}
!1167 = !DISubrange(count: 800)
!1168 = !DILocation(line: 162, column: 14, scope: !1154)
!1169 = !DILocalVariable(name: "A_width", scope: !1154, file: !68, line: 163, type: !58)
!1170 = !DILocalVariable(name: "mask", scope: !1171, file: !68, line: 168, type: !53)
!1171 = distinct !DILexicalBlock(scope: !1172, file: !68, line: 167, column: 29)
!1172 = distinct !DILexicalBlock(scope: !1154, file: !68, line: 167, column: 8)
!1173 = !DILocation(line: 0, scope: !1171)
!1174 = !DILocalVariable(name: "i", scope: !1175, file: !68, line: 171, type: !86)
!1175 = distinct !DILexicalBlock(scope: !1171, file: !68, line: 171, column: 9)
!1176 = !DILocation(line: 0, scope: !1175)
!1177 = !DILocation(line: 171, column: 14, scope: !1175)
!1178 = !DILocation(line: 171, scope: !1175)
!1179 = !DILocation(line: 173, column: 13, scope: !1180)
!1180 = distinct !DILexicalBlock(scope: !1181, file: !68, line: 172, column: 9)
!1181 = distinct !DILexicalBlock(scope: !1175, file: !68, line: 171, column: 9)
!1182 = !DILocation(line: 173, column: 50, scope: !1180)
!1183 = !DILocation(line: 171, column: 53, scope: !1181)
!1184 = !DILocation(line: 171, column: 27, scope: !1181)
!1185 = !DILocation(line: 171, column: 9, scope: !1175)
!1186 = !DILocation(line: 171, column: 9, scope: !1181)
!1187 = distinct !{!1187, !1185, !1188, !388}
!1188 = !DILocation(line: 174, column: 9, scope: !1175)
!1189 = !DILocation(line: 177, scope: !1190)
!1190 = distinct !DILexicalBlock(scope: !1154, file: !68, line: 177, column: 5)
!1191 = !DILocation(line: 160, column: 9, scope: !1154)
!1192 = !DILocation(line: 159, column: 9, scope: !1154)
!1193 = !DILocalVariable(name: "i", scope: !1190, file: !68, line: 177, type: !86)
!1194 = !DILocation(line: 0, scope: !1190)
!1195 = !DILocation(line: 177, column: 23, scope: !1196)
!1196 = distinct !DILexicalBlock(scope: !1190, file: !68, line: 177, column: 5)
!1197 = !DILocation(line: 177, column: 5, scope: !1190)
!1198 = !DILocation(line: 178, scope: !1199)
!1199 = distinct !DILexicalBlock(scope: !1200, file: !68, line: 178, column: 9)
!1200 = distinct !DILexicalBlock(scope: !1196, file: !68, line: 177, column: 47)
!1201 = !DILocalVariable(name: "j", scope: !1199, file: !68, line: 178, type: !86)
!1202 = !DILocation(line: 0, scope: !1199)
!1203 = !DILocation(line: 178, column: 40, scope: !1204)
!1204 = distinct !DILexicalBlock(scope: !1199, file: !68, line: 178, column: 9)
!1205 = !DILocation(line: 178, column: 9, scope: !1199)
!1206 = !DILocation(line: 180, column: 22, scope: !1207)
!1207 = distinct !DILexicalBlock(scope: !1204, file: !68, line: 178, column: 51)
!1208 = !DILocalVariable(name: "Mj", scope: !1154, file: !68, line: 164, type: !411)
!1209 = !DILocalVariable(name: "c", scope: !1210, file: !68, line: 181, type: !86)
!1210 = distinct !DILexicalBlock(scope: !1207, file: !68, line: 181, column: 13)
!1211 = !DILocation(line: 0, scope: !1210)
!1212 = !DILocation(line: 181, column: 18, scope: !1210)
!1213 = !DILocation(line: 181, scope: !1210)
!1214 = !DILocation(line: 181, column: 31, scope: !1215)
!1215 = distinct !DILexicalBlock(scope: !1210, file: !68, line: 181, column: 13)
!1216 = !DILocation(line: 181, column: 13, scope: !1210)
!1217 = !DILocalVariable(name: "k", scope: !1218, file: !68, line: 182, type: !86)
!1218 = distinct !DILexicalBlock(scope: !1219, file: !68, line: 182, column: 17)
!1219 = distinct !DILexicalBlock(scope: !1215, file: !68, line: 181, column: 50)
!1220 = !DILocation(line: 0, scope: !1218)
!1221 = !DILocation(line: 184, column: 78, scope: !1222)
!1222 = distinct !DILexicalBlock(scope: !1223, file: !68, line: 183, column: 17)
!1223 = distinct !DILexicalBlock(scope: !1218, file: !68, line: 182, column: 17)
!1224 = !DILocation(line: 184, column: 100, scope: !1222)
!1225 = !DILocation(line: 184, column: 35, scope: !1222)
!1226 = !DILocation(line: 184, column: 39, scope: !1222)
!1227 = !DILocation(line: 184, column: 65, scope: !1222)
!1228 = !DILocation(line: 184, column: 43, scope: !1222)
!1229 = !DILocation(line: 184, column: 21, scope: !1222)
!1230 = !DILocation(line: 184, column: 75, scope: !1222)
!1231 = !DILocation(line: 185, column: 38, scope: !1232)
!1232 = distinct !DILexicalBlock(scope: !1222, file: !68, line: 185, column: 24)
!1233 = !DILocation(line: 186, column: 86, scope: !1234)
!1234 = distinct !DILexicalBlock(scope: !1232, file: !68, line: 185, column: 42)
!1235 = !DILocation(line: 186, column: 114, scope: !1234)
!1236 = !DILocation(line: 186, column: 108, scope: !1234)
!1237 = !DILocation(line: 186, column: 39, scope: !1234)
!1238 = !DILocation(line: 186, column: 43, scope: !1234)
!1239 = !DILocation(line: 186, column: 73, scope: !1234)
!1240 = !DILocation(line: 186, column: 47, scope: !1234)
!1241 = !DILocation(line: 186, column: 25, scope: !1234)
!1242 = !DILocation(line: 186, column: 83, scope: !1234)
!1243 = !DILocation(line: 187, column: 21, scope: !1234)
!1244 = !DILocation(line: 181, column: 46, scope: !1215)
!1245 = !DILocation(line: 181, column: 13, scope: !1215)
!1246 = distinct !{!1246, !1216, !1247, !388}
!1247 = !DILocation(line: 189, column: 13, scope: !1210)
!1248 = !DILocation(line: 191, column: 19, scope: !1249)
!1249 = distinct !DILexicalBlock(scope: !1207, file: !68, line: 191, column: 17)
!1250 = !DILocation(line: 192, column: 26, scope: !1251)
!1251 = distinct !DILexicalBlock(scope: !1249, file: !68, line: 191, column: 25)
!1252 = !DILocalVariable(name: "Mi", scope: !1154, file: !68, line: 164, type: !411)
!1253 = !DILocalVariable(name: "c", scope: !1254, file: !68, line: 193, type: !86)
!1254 = distinct !DILexicalBlock(scope: !1251, file: !68, line: 193, column: 17)
!1255 = !DILocation(line: 0, scope: !1254)
!1256 = !DILocation(line: 193, column: 22, scope: !1254)
!1257 = !DILocation(line: 193, scope: !1254)
!1258 = !DILocation(line: 193, column: 35, scope: !1259)
!1259 = distinct !DILexicalBlock(scope: !1254, file: !68, line: 193, column: 17)
!1260 = !DILocation(line: 193, column: 17, scope: !1254)
!1261 = !DILocalVariable(name: "k", scope: !1262, file: !68, line: 194, type: !86)
!1262 = distinct !DILexicalBlock(scope: !1263, file: !68, line: 194, column: 21)
!1263 = distinct !DILexicalBlock(scope: !1259, file: !68, line: 193, column: 54)
!1264 = !DILocation(line: 0, scope: !1262)
!1265 = !DILocation(line: 196, column: 81, scope: !1266)
!1266 = distinct !DILexicalBlock(scope: !1267, file: !68, line: 195, column: 21)
!1267 = distinct !DILexicalBlock(scope: !1262, file: !68, line: 194, column: 21)
!1268 = !DILocation(line: 196, column: 103, scope: !1266)
!1269 = !DILocation(line: 196, column: 38, scope: !1266)
!1270 = !DILocation(line: 196, column: 42, scope: !1266)
!1271 = !DILocation(line: 196, column: 68, scope: !1266)
!1272 = !DILocation(line: 196, column: 46, scope: !1266)
!1273 = !DILocation(line: 196, column: 25, scope: !1266)
!1274 = !DILocation(line: 196, column: 78, scope: !1266)
!1275 = !DILocation(line: 197, column: 42, scope: !1276)
!1276 = distinct !DILexicalBlock(scope: !1266, file: !68, line: 197, column: 28)
!1277 = !DILocation(line: 198, column: 89, scope: !1278)
!1278 = distinct !DILexicalBlock(scope: !1276, file: !68, line: 197, column: 46)
!1279 = !DILocation(line: 198, column: 117, scope: !1278)
!1280 = !DILocation(line: 198, column: 111, scope: !1278)
!1281 = !DILocation(line: 198, column: 42, scope: !1278)
!1282 = !DILocation(line: 198, column: 46, scope: !1278)
!1283 = !DILocation(line: 198, column: 76, scope: !1278)
!1284 = !DILocation(line: 198, column: 50, scope: !1278)
!1285 = !DILocation(line: 198, column: 29, scope: !1278)
!1286 = !DILocation(line: 198, column: 86, scope: !1278)
!1287 = !DILocation(line: 199, column: 25, scope: !1278)
!1288 = !DILocation(line: 193, column: 50, scope: !1259)
!1289 = !DILocation(line: 193, column: 17, scope: !1259)
!1290 = distinct !{!1290, !1260, !1291, !388}
!1291 = !DILocation(line: 201, column: 17, scope: !1254)
!1292 = !DILocation(line: 204, column: 27, scope: !1207)
!1293 = !DILocation(line: 205, column: 30, scope: !1294)
!1294 = distinct !DILexicalBlock(scope: !1207, file: !68, line: 205, column: 16)
!1295 = !DILocation(line: 178, column: 46, scope: !1204)
!1296 = !DILocation(line: 178, column: 9, scope: !1204)
!1297 = distinct !{!1297, !1205, !1298, !388}
!1298 = !DILocation(line: 209, column: 9, scope: !1199)
!1299 = !DILocation(line: 177, column: 42, scope: !1196)
!1300 = !DILocation(line: 177, column: 5, scope: !1196)
!1301 = distinct !{!1301, !1197, !1302, !388}
!1302 = !DILocation(line: 210, column: 5, scope: !1190)
!1303 = !DILocation(line: 212, scope: !1304)
!1304 = distinct !DILexicalBlock(scope: !1154, file: !68, line: 212, column: 5)
!1305 = !DILocalVariable(name: "c", scope: !1304, file: !68, line: 212, type: !58)
!1306 = !DILocation(line: 0, scope: !1304)
!1307 = !DILocation(line: 212, column: 26, scope: !1308)
!1308 = distinct !DILexicalBlock(scope: !1304, file: !68, line: 212, column: 5)
!1309 = !DILocation(line: 212, column: 5, scope: !1304)
!1310 = !DILocation(line: 214, column: 35, scope: !1311)
!1311 = distinct !DILexicalBlock(scope: !1308, file: !68, line: 213, column: 5)
!1312 = !DILocation(line: 214, column: 9, scope: !1311)
!1313 = !DILocation(line: 212, column: 91, scope: !1308)
!1314 = !DILocation(line: 212, column: 5, scope: !1308)
!1315 = distinct !{!1315, !1309, !1316, !388}
!1316 = !DILocation(line: 215, column: 5, scope: !1304)
!1317 = !DILocalVariable(name: "tab", scope: !1154, file: !68, line: 217, type: !1318)
!1318 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 128, elements: !1319)
!1319 = !{!1320}
!1320 = !DISubrange(count: 16)
!1321 = !DILocation(line: 217, column: 19, scope: !1154)
!1322 = !DILocalVariable(name: "i", scope: !1323, file: !68, line: 218, type: !58)
!1323 = distinct !DILexicalBlock(scope: !1154, file: !68, line: 218, column: 5)
!1324 = !DILocation(line: 0, scope: !1323)
!1325 = !DILocation(line: 218, column: 10, scope: !1323)
!1326 = !DILocation(line: 218, scope: !1323)
!1327 = !DILocation(line: 218, column: 26, scope: !1328)
!1328 = distinct !DILexicalBlock(scope: !1323, file: !68, line: 218, column: 5)
!1329 = !DILocation(line: 218, column: 5, scope: !1323)
!1330 = !DILocation(line: 220, column: 28, scope: !1331)
!1331 = distinct !DILexicalBlock(scope: !1328, file: !68, line: 219, column: 5)
!1332 = !DILocation(line: 220, column: 22, scope: !1331)
!1333 = !DILocation(line: 220, column: 14, scope: !1331)
!1334 = !DILocation(line: 220, column: 9, scope: !1331)
!1335 = !DILocation(line: 220, column: 20, scope: !1331)
!1336 = !DILocation(line: 221, column: 22, scope: !1331)
!1337 = !DILocation(line: 221, column: 14, scope: !1331)
!1338 = !DILocation(line: 221, column: 16, scope: !1331)
!1339 = !DILocation(line: 221, column: 9, scope: !1331)
!1340 = !DILocation(line: 221, column: 20, scope: !1331)
!1341 = !DILocation(line: 222, column: 22, scope: !1331)
!1342 = !DILocation(line: 222, column: 14, scope: !1331)
!1343 = !DILocation(line: 222, column: 16, scope: !1331)
!1344 = !DILocation(line: 222, column: 9, scope: !1331)
!1345 = !DILocation(line: 222, column: 20, scope: !1331)
!1346 = !DILocation(line: 223, column: 22, scope: !1331)
!1347 = !DILocation(line: 223, column: 14, scope: !1331)
!1348 = !DILocation(line: 223, column: 16, scope: !1331)
!1349 = !DILocation(line: 223, column: 9, scope: !1331)
!1350 = !DILocation(line: 223, column: 20, scope: !1331)
!1351 = !DILocation(line: 218, column: 41, scope: !1328)
!1352 = !DILocation(line: 218, column: 5, scope: !1328)
!1353 = distinct !{!1353, !1329, !1354, !388}
!1354 = !DILocation(line: 224, column: 5, scope: !1323)
!1355 = !DILocation(line: 228, scope: !1356)
!1356 = distinct !DILexicalBlock(scope: !1154, file: !68, line: 228, column: 5)
!1357 = !DILocalVariable(name: "c", scope: !1356, file: !68, line: 228, type: !58)
!1358 = !DILocation(line: 0, scope: !1356)
!1359 = !DILocation(line: 228, column: 26, scope: !1360)
!1360 = distinct !DILexicalBlock(scope: !1356, file: !68, line: 228, column: 5)
!1361 = !DILocation(line: 228, column: 5, scope: !1356)
!1362 = !DILocation(line: 230, scope: !1363)
!1363 = distinct !DILexicalBlock(scope: !1364, file: !68, line: 230, column: 9)
!1364 = distinct !DILexicalBlock(scope: !1360, file: !68, line: 229, column: 5)
!1365 = !DILocalVariable(name: "r", scope: !1363, file: !68, line: 230, type: !86)
!1366 = !DILocation(line: 0, scope: !1363)
!1367 = !DILocation(line: 230, column: 36, scope: !1368)
!1368 = distinct !DILexicalBlock(scope: !1363, file: !68, line: 230, column: 9)
!1369 = !DILocation(line: 230, column: 9, scope: !1363)
!1370 = !DILocation(line: 232, column: 28, scope: !1371)
!1371 = distinct !DILexicalBlock(scope: !1368, file: !68, line: 231, column: 9)
!1372 = !DILocation(line: 232, column: 32, scope: !1371)
!1373 = !DILocation(line: 232, column: 41, scope: !1371)
!1374 = !DILocation(line: 232, column: 49, scope: !1371)
!1375 = !DILocation(line: 232, column: 45, scope: !1371)
!1376 = !DILocalVariable(name: "pos", scope: !1371, file: !68, line: 232, type: !58)
!1377 = !DILocation(line: 0, scope: !1371)
!1378 = !DILocation(line: 233, column: 28, scope: !1371)
!1379 = !DILocation(line: 233, column: 41, scope: !1371)
!1380 = !DILocalVariable(name: "t0", scope: !1371, file: !68, line: 233, type: !53)
!1381 = !DILocation(line: 234, column: 35, scope: !1371)
!1382 = !DILocation(line: 234, column: 41, scope: !1371)
!1383 = !DILocalVariable(name: "t1", scope: !1371, file: !68, line: 234, type: !53)
!1384 = !DILocation(line: 235, column: 35, scope: !1371)
!1385 = !DILocation(line: 235, column: 41, scope: !1371)
!1386 = !DILocalVariable(name: "t2", scope: !1371, file: !68, line: 235, type: !53)
!1387 = !DILocation(line: 236, column: 28, scope: !1371)
!1388 = !DILocation(line: 236, column: 35, scope: !1371)
!1389 = !DILocation(line: 236, column: 41, scope: !1371)
!1390 = !DILocalVariable(name: "t3", scope: !1371, file: !68, line: 236, type: !53)
!1391 = !DILocalVariable(name: "t", scope: !1392, file: !68, line: 237, type: !58)
!1392 = distinct !DILexicalBlock(scope: !1371, file: !68, line: 237, column: 13)
!1393 = !DILocation(line: 0, scope: !1392)
!1394 = !DILocation(line: 239, column: 84, scope: !1395)
!1395 = distinct !DILexicalBlock(scope: !1396, file: !68, line: 238, column: 13)
!1396 = distinct !DILexicalBlock(scope: !1392, file: !68, line: 237, column: 13)
!1397 = !DILocation(line: 239, column: 83, scope: !1395)
!1398 = !DILocation(line: 239, column: 100, scope: !1395)
!1399 = !DILocation(line: 239, column: 99, scope: !1395)
!1400 = !DILocation(line: 239, column: 95, scope: !1395)
!1401 = !DILocation(line: 239, column: 116, scope: !1395)
!1402 = !DILocation(line: 239, column: 115, scope: !1395)
!1403 = !DILocation(line: 239, column: 111, scope: !1395)
!1404 = !DILocation(line: 239, column: 132, scope: !1395)
!1405 = !DILocation(line: 239, column: 131, scope: !1395)
!1406 = !DILocation(line: 239, column: 127, scope: !1395)
!1407 = !DILocation(line: 239, column: 24, scope: !1395)
!1408 = !DILocation(line: 239, column: 36, scope: !1395)
!1409 = !DILocation(line: 239, column: 40, scope: !1395)
!1410 = !DILocation(line: 239, column: 49, scope: !1395)
!1411 = !DILocation(line: 239, column: 60, scope: !1395)
!1412 = !DILocation(line: 239, column: 72, scope: !1395)
!1413 = !DILocation(line: 239, column: 53, scope: !1395)
!1414 = !DILocation(line: 239, column: 17, scope: !1395)
!1415 = !DILocation(line: 239, column: 78, scope: !1395)
!1416 = !DILocation(line: 230, column: 82, scope: !1368)
!1417 = !DILocation(line: 230, column: 9, scope: !1368)
!1418 = distinct !{!1418, !1369, !1419, !388}
!1419 = !DILocation(line: 241, column: 9, scope: !1363)
!1420 = !DILocation(line: 228, column: 38, scope: !1360)
!1421 = !DILocation(line: 228, column: 5, scope: !1360)
!1422 = distinct !{!1422, !1361, !1423, !388}
!1423 = !DILocation(line: 242, column: 5, scope: !1356)
!1424 = !DILocation(line: 250, scope: !1425)
!1425 = distinct !DILexicalBlock(scope: !1154, file: !68, line: 250, column: 5)
!1426 = !DILocalVariable(name: "r", scope: !1425, file: !68, line: 250, type: !86)
!1427 = !DILocation(line: 0, scope: !1425)
!1428 = !DILocation(line: 250, column: 23, scope: !1429)
!1429 = distinct !DILexicalBlock(scope: !1425, file: !68, line: 250, column: 5)
!1430 = !DILocation(line: 250, column: 5, scope: !1425)
!1431 = !DILocation(line: 254, scope: !1432)
!1432 = distinct !DILexicalBlock(scope: !1433, file: !68, line: 254, column: 13)
!1433 = distinct !DILexicalBlock(scope: !1434, file: !68, line: 253, column: 9)
!1434 = distinct !DILexicalBlock(scope: !1435, file: !68, line: 252, column: 9)
!1435 = distinct !DILexicalBlock(scope: !1436, file: !68, line: 252, column: 9)
!1436 = distinct !DILexicalBlock(scope: !1429, file: !68, line: 251, column: 5)
!1437 = !DILocalVariable(name: "i", scope: !1432, file: !68, line: 254, type: !86)
!1438 = !DILocation(line: 0, scope: !1432)
!1439 = !DILocation(line: 254, column: 35, scope: !1440)
!1440 = distinct !DILexicalBlock(scope: !1432, file: !68, line: 254, column: 13)
!1441 = !DILocation(line: 254, column: 13, scope: !1432)
!1442 = !DILocation(line: 256, column: 55, scope: !1443)
!1443 = distinct !DILexicalBlock(scope: !1440, file: !68, line: 255, column: 13)
!1444 = !DILocation(line: 256, column: 63, scope: !1443)
!1445 = !DILocation(line: 256, column: 44, scope: !1443)
!1446 = !DILocation(line: 256, column: 95, scope: !1443)
!1447 = !DILocation(line: 256, column: 92, scope: !1443)
!1448 = !DILocation(line: 256, column: 75, scope: !1443)
!1449 = !DILocation(line: 256, column: 17, scope: !1443)
!1450 = !DILocation(line: 254, column: 50, scope: !1440)
!1451 = !DILocation(line: 254, column: 13, scope: !1440)
!1452 = distinct !{!1452, !1441, !1453, !388}
!1453 = !DILocation(line: 257, column: 13, scope: !1432)
!1454 = !DILocation(line: 256, column: 59, scope: !1443)
!1455 = !DILocation(line: 256, column: 99, scope: !1443)
!1456 = !DILocalVariable(name: "c", scope: !1435, file: !68, line: 252, type: !86)
!1457 = !DILocation(line: 0, scope: !1435)
!1458 = !DILocation(line: 250, column: 38, scope: !1429)
!1459 = !DILocation(line: 250, column: 5, scope: !1429)
!1460 = distinct !{!1460, !1430, !1461, !388}
!1461 = !DILocation(line: 259, column: 5, scope: !1425)
!1462 = !DILocation(line: 260, column: 1, scope: !1154)
!1463 = distinct !DISubprogram(name: "mat_mul", scope: !577, file: !577, line: 79, type: !1464, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1464 = !DISubroutineType(types: !1465)
!1465 = !{null, !90, !90, !61, !86, !86, !86}
!1466 = !DILocalVariable(name: "a", arg: 1, scope: !1463, file: !577, line: 79, type: !90)
!1467 = !DILocation(line: 0, scope: !1463)
!1468 = !DILocalVariable(name: "b", arg: 2, scope: !1463, file: !577, line: 79, type: !90)
!1469 = !DILocalVariable(name: "c", arg: 3, scope: !1463, file: !577, line: 80, type: !61)
!1470 = !DILocalVariable(name: "colrow_ab", arg: 4, scope: !1463, file: !577, line: 80, type: !86)
!1471 = !DILocalVariable(name: "row_a", arg: 5, scope: !1463, file: !577, line: 80, type: !86)
!1472 = !DILocalVariable(name: "col_b", arg: 6, scope: !1463, file: !577, line: 80, type: !86)
!1473 = !DILocalVariable(name: "i", scope: !1474, file: !577, line: 81, type: !86)
!1474 = distinct !DILexicalBlock(scope: !1463, file: !577, line: 81, column: 5)
!1475 = !DILocation(line: 0, scope: !1474)
!1476 = !DILocation(line: 81, column: 10, scope: !1474)
!1477 = !DILocation(line: 81, scope: !1474)
!1478 = !DILocation(line: 81, column: 23, scope: !1479)
!1479 = distinct !DILexicalBlock(scope: !1474, file: !577, line: 81, column: 5)
!1480 = !DILocation(line: 81, column: 5, scope: !1474)
!1481 = !DILocation(line: 82, scope: !1482)
!1482 = distinct !DILexicalBlock(scope: !1483, file: !577, line: 82, column: 9)
!1483 = distinct !DILexicalBlock(scope: !1479, file: !577, line: 81, column: 53)
!1484 = !DILocalVariable(name: "j", scope: !1482, file: !577, line: 82, type: !86)
!1485 = !DILocation(line: 0, scope: !1482)
!1486 = !DILocation(line: 82, column: 27, scope: !1487)
!1487 = distinct !DILexicalBlock(scope: !1482, file: !577, line: 82, column: 9)
!1488 = !DILocation(line: 82, column: 9, scope: !1482)
!1489 = !DILocation(line: 83, column: 31, scope: !1490)
!1490 = distinct !DILexicalBlock(scope: !1487, file: !577, line: 82, column: 46)
!1491 = !DILocation(line: 83, column: 18, scope: !1490)
!1492 = !DILocation(line: 83, column: 16, scope: !1490)
!1493 = !DILocation(line: 82, column: 36, scope: !1487)
!1494 = !DILocation(line: 82, column: 41, scope: !1487)
!1495 = !DILocation(line: 82, column: 9, scope: !1487)
!1496 = distinct !{!1496, !1488, !1497, !388}
!1497 = !DILocation(line: 84, column: 9, scope: !1482)
!1498 = !DILocation(line: 81, column: 32, scope: !1479)
!1499 = !DILocation(line: 81, column: 39, scope: !1479)
!1500 = !DILocation(line: 81, column: 5, scope: !1479)
!1501 = distinct !{!1501, !1480, !1502, !388}
!1502 = !DILocation(line: 85, column: 5, scope: !1474)
!1503 = !DILocation(line: 86, column: 18, scope: !1463)
!1504 = !DILocation(line: 86, column: 5, scope: !1463)
!1505 = !DILocation(line: 87, column: 1, scope: !1463)
!1506 = distinct !DISubprogram(name: "mat_add", scope: !577, file: !577, line: 89, type: !1507, scopeLine: 90, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1507 = !DISubroutineType(types: !1508)
!1508 = !{null, !90, !90, !61, !86, !86}
!1509 = !DILocalVariable(name: "a", arg: 1, scope: !1506, file: !577, line: 89, type: !90)
!1510 = !DILocation(line: 0, scope: !1506)
!1511 = !DILocalVariable(name: "b", arg: 2, scope: !1506, file: !577, line: 89, type: !90)
!1512 = !DILocalVariable(name: "c", arg: 3, scope: !1506, file: !577, line: 90, type: !61)
!1513 = !DILocalVariable(name: "m", arg: 4, scope: !1506, file: !577, line: 90, type: !86)
!1514 = !DILocalVariable(name: "n", arg: 5, scope: !1506, file: !577, line: 90, type: !86)
!1515 = !DILocalVariable(name: "i", scope: !1516, file: !577, line: 91, type: !86)
!1516 = distinct !DILexicalBlock(scope: !1506, file: !577, line: 91, column: 5)
!1517 = !DILocation(line: 0, scope: !1516)
!1518 = !DILocation(line: 91, column: 10, scope: !1516)
!1519 = !DILocation(line: 91, scope: !1516)
!1520 = !DILocation(line: 91, column: 23, scope: !1521)
!1521 = distinct !DILexicalBlock(scope: !1516, file: !577, line: 91, column: 5)
!1522 = !DILocation(line: 91, column: 5, scope: !1516)
!1523 = !DILocation(line: 92, scope: !1524)
!1524 = distinct !DILexicalBlock(scope: !1525, file: !577, line: 92, column: 9)
!1525 = distinct !DILexicalBlock(scope: !1521, file: !577, line: 91, column: 33)
!1526 = !DILocalVariable(name: "j", scope: !1524, file: !577, line: 92, type: !86)
!1527 = !DILocation(line: 0, scope: !1524)
!1528 = !DILocation(line: 92, column: 27, scope: !1529)
!1529 = distinct !DILexicalBlock(scope: !1524, file: !577, line: 92, column: 9)
!1530 = !DILocation(line: 92, column: 9, scope: !1524)
!1531 = !DILocation(line: 93, column: 46, scope: !1532)
!1532 = distinct !DILexicalBlock(scope: !1529, file: !577, line: 92, column: 37)
!1533 = !DILocation(line: 93, column: 42, scope: !1532)
!1534 = !DILocation(line: 93, column: 50, scope: !1532)
!1535 = !DILocation(line: 93, column: 38, scope: !1532)
!1536 = !DILocation(line: 93, column: 64, scope: !1532)
!1537 = !DILocation(line: 93, column: 60, scope: !1532)
!1538 = !DILocation(line: 93, column: 68, scope: !1532)
!1539 = !DILocation(line: 93, column: 56, scope: !1532)
!1540 = !DILocation(line: 93, column: 32, scope: !1532)
!1541 = !DILocation(line: 93, column: 21, scope: !1532)
!1542 = !DILocation(line: 93, column: 17, scope: !1532)
!1543 = !DILocation(line: 93, column: 25, scope: !1532)
!1544 = !DILocation(line: 93, column: 30, scope: !1532)
!1545 = !DILocation(line: 92, column: 32, scope: !1529)
!1546 = !DILocation(line: 92, column: 9, scope: !1529)
!1547 = distinct !{!1547, !1530, !1548, !388}
!1548 = !DILocation(line: 94, column: 9, scope: !1524)
!1549 = !DILocation(line: 91, column: 28, scope: !1521)
!1550 = !DILocation(line: 91, column: 5, scope: !1521)
!1551 = distinct !{!1551, !1522, !1552, !388}
!1552 = !DILocation(line: 95, column: 5, scope: !1516)
!1553 = !DILocation(line: 96, column: 1, scope: !1506)
!1554 = distinct !DISubprogram(name: "encode", scope: !68, file: !68, line: 32, type: !361, scopeLine: 32, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1555 = !DILocalVariable(name: "m", arg: 1, scope: !1554, file: !68, line: 32, type: !90)
!1556 = !DILocation(line: 0, scope: !1554)
!1557 = !DILocalVariable(name: "menc", arg: 2, scope: !1554, file: !68, line: 32, type: !61)
!1558 = !DILocalVariable(name: "mlen", arg: 3, scope: !1554, file: !68, line: 32, type: !86)
!1559 = !DILocalVariable(name: "i", scope: !1554, file: !68, line: 33, type: !86)
!1560 = !DILocation(line: 34, column: 10, scope: !1561)
!1561 = distinct !DILexicalBlock(scope: !1554, file: !68, line: 34, column: 5)
!1562 = !DILocation(line: 34, scope: !1561)
!1563 = !DILocation(line: 34, column: 26, scope: !1564)
!1564 = distinct !DILexicalBlock(scope: !1561, file: !68, line: 34, column: 5)
!1565 = !DILocation(line: 34, column: 19, scope: !1564)
!1566 = !DILocation(line: 34, column: 5, scope: !1561)
!1567 = !DILocation(line: 35, column: 20, scope: !1568)
!1568 = distinct !DILexicalBlock(scope: !1564, file: !68, line: 34, column: 44)
!1569 = !DILocation(line: 35, column: 31, scope: !1568)
!1570 = !DILocation(line: 35, column: 27, scope: !1568)
!1571 = !DILocation(line: 35, column: 36, scope: !1568)
!1572 = !DILocation(line: 35, column: 24, scope: !1568)
!1573 = !DILocation(line: 35, column: 9, scope: !1568)
!1574 = !DILocation(line: 35, column: 17, scope: !1568)
!1575 = !DILocation(line: 34, column: 31, scope: !1564)
!1576 = !DILocation(line: 34, column: 38, scope: !1564)
!1577 = !DILocation(line: 34, column: 5, scope: !1564)
!1578 = distinct !{!1578, !1566, !1579, !388}
!1579 = !DILocation(line: 36, column: 5, scope: !1561)
!1580 = !DILocation(line: 38, column: 18, scope: !1581)
!1581 = distinct !DILexicalBlock(scope: !1554, file: !68, line: 38, column: 9)
!1582 = !DILocation(line: 39, column: 20, scope: !1583)
!1583 = distinct !DILexicalBlock(scope: !1581, file: !68, line: 38, column: 24)
!1584 = !DILocation(line: 39, column: 9, scope: !1583)
!1585 = !DILocation(line: 39, column: 17, scope: !1583)
!1586 = !DILocation(line: 40, column: 5, scope: !1583)
!1587 = !DILocation(line: 41, column: 1, scope: !1554)
!1588 = distinct !DISubprogram(name: "add_f", scope: !577, file: !577, line: 43, type: !1589, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1589 = !DISubroutineType(types: !1590)
!1590 = !{!51, !51, !51}
!1591 = !DILocalVariable(name: "a", arg: 1, scope: !1588, file: !577, line: 43, type: !51)
!1592 = !DILocation(line: 0, scope: !1588)
!1593 = !DILocalVariable(name: "b", arg: 2, scope: !1588, file: !577, line: 43, type: !51)
!1594 = !DILocation(line: 44, column: 14, scope: !1588)
!1595 = !DILocation(line: 44, column: 5, scope: !1588)
!1596 = distinct !DISubprogram(name: "lincomb", scope: !577, file: !577, line: 70, type: !1597, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1597 = !DISubroutineType(types: !1598)
!1598 = !{!51, !90, !90, !86, !86}
!1599 = !DILocalVariable(name: "a", arg: 1, scope: !1596, file: !577, line: 70, type: !90)
!1600 = !DILocation(line: 0, scope: !1596)
!1601 = !DILocalVariable(name: "b", arg: 2, scope: !1596, file: !577, line: 71, type: !90)
!1602 = !DILocalVariable(name: "n", arg: 3, scope: !1596, file: !577, line: 71, type: !86)
!1603 = !DILocalVariable(name: "m", arg: 4, scope: !1596, file: !577, line: 71, type: !86)
!1604 = !DILocalVariable(name: "ret", scope: !1596, file: !577, line: 72, type: !51)
!1605 = !DILocalVariable(name: "i", scope: !1606, file: !577, line: 73, type: !86)
!1606 = distinct !DILexicalBlock(scope: !1596, file: !577, line: 73, column: 5)
!1607 = !DILocation(line: 0, scope: !1606)
!1608 = !DILocation(line: 73, column: 10, scope: !1606)
!1609 = !DILocation(line: 73, scope: !1606)
!1610 = !DILocation(line: 73, column: 23, scope: !1611)
!1611 = distinct !DILexicalBlock(scope: !1606, file: !577, line: 73, column: 5)
!1612 = !DILocation(line: 73, column: 5, scope: !1606)
!1613 = !DILocation(line: 74, column: 27, scope: !1614)
!1614 = distinct !DILexicalBlock(scope: !1611, file: !577, line: 73, column: 41)
!1615 = !DILocation(line: 74, column: 33, scope: !1614)
!1616 = !DILocation(line: 74, column: 21, scope: !1614)
!1617 = !DILocation(line: 74, column: 15, scope: !1614)
!1618 = !DILocation(line: 73, column: 28, scope: !1611)
!1619 = !DILocation(line: 73, column: 35, scope: !1611)
!1620 = !DILocation(line: 73, column: 5, scope: !1611)
!1621 = distinct !{!1621, !1612, !1622, !388}
!1622 = !DILocation(line: 75, column: 5, scope: !1606)
!1623 = !DILocation(line: 76, column: 5, scope: !1596)
!1624 = distinct !DISubprogram(name: "mul_f", scope: !577, file: !577, line: 9, type: !1589, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1625 = !DILocalVariable(name: "a", arg: 1, scope: !1624, file: !577, line: 9, type: !51)
!1626 = !DILocation(line: 0, scope: !1624)
!1627 = !DILocalVariable(name: "b", arg: 2, scope: !1624, file: !577, line: 9, type: !51)
!1628 = !DILocation(line: 14, column: 10, scope: !1624)
!1629 = !DILocation(line: 14, column: 7, scope: !1624)
!1630 = !DILocation(line: 17, column: 17, scope: !1624)
!1631 = !DILocalVariable(name: "p", scope: !1624, file: !577, line: 11, type: !51)
!1632 = !DILocation(line: 18, column: 13, scope: !1624)
!1633 = !DILocation(line: 18, column: 17, scope: !1624)
!1634 = !DILocation(line: 18, column: 7, scope: !1624)
!1635 = !DILocation(line: 19, column: 13, scope: !1624)
!1636 = !DILocation(line: 19, column: 17, scope: !1624)
!1637 = !DILocation(line: 19, column: 7, scope: !1624)
!1638 = !DILocation(line: 20, column: 13, scope: !1624)
!1639 = !DILocation(line: 20, column: 17, scope: !1624)
!1640 = !DILocation(line: 20, column: 7, scope: !1624)
!1641 = !DILocalVariable(name: "top_p", scope: !1624, file: !577, line: 23, type: !51)
!1642 = !DILocation(line: 24, column: 37, scope: !1624)
!1643 = !DILocation(line: 24, column: 52, scope: !1624)
!1644 = !DILocation(line: 24, column: 43, scope: !1624)
!1645 = !DILocation(line: 24, column: 59, scope: !1624)
!1646 = !DILocalVariable(name: "out", scope: !1624, file: !577, line: 24, type: !51)
!1647 = !DILocation(line: 25, column: 5, scope: !1624)
!1648 = !DILocalVariable(name: "M", arg: 1, scope: !67, file: !68, line: 111, type: !52)
!1649 = !DILocation(line: 0, scope: !67)
!1650 = !DILocalVariable(name: "i", scope: !1651, file: !68, line: 117, type: !58)
!1651 = distinct !DILexicalBlock(scope: !67, file: !68, line: 117, column: 5)
!1652 = !DILocation(line: 0, scope: !1651)
!1653 = !DILocation(line: 119, column: 24, scope: !1654)
!1654 = distinct !DILexicalBlock(scope: !1655, file: !68, line: 118, column: 5)
!1655 = distinct !DILexicalBlock(scope: !1651, file: !68, line: 117, column: 5)
!1656 = !DILocation(line: 119, column: 29, scope: !1654)
!1657 = !DILocation(line: 119, column: 38, scope: !1654)
!1658 = !DILocation(line: 119, column: 36, scope: !1654)
!1659 = !DILocation(line: 119, column: 46, scope: !1654)
!1660 = !DILocalVariable(name: "t", scope: !1654, file: !68, line: 119, type: !53)
!1661 = !DILocation(line: 0, scope: !1654)
!1662 = !DILocation(line: 120, column: 21, scope: !1654)
!1663 = !DILocation(line: 120, column: 16, scope: !1654)
!1664 = !DILocation(line: 121, column: 9, scope: !1654)
!1665 = !DILocation(line: 121, column: 16, scope: !1654)
!1666 = !DILocation(line: 120, column: 9, scope: !1654)
!1667 = !DILocalVariable(name: "i", scope: !1668, file: !68, line: 124, type: !58)
!1668 = distinct !DILexicalBlock(scope: !67, file: !68, line: 124, column: 5)
!1669 = !DILocation(line: 0, scope: !1668)
!1670 = !DILocation(line: 126, column: 25, scope: !1671)
!1671 = distinct !DILexicalBlock(scope: !1672, file: !68, line: 125, column: 5)
!1672 = distinct !DILexicalBlock(scope: !1668, file: !68, line: 124, column: 5)
!1673 = !DILocation(line: 126, column: 32, scope: !1671)
!1674 = !DILocation(line: 126, column: 40, scope: !1671)
!1675 = !DILocation(line: 126, column: 38, scope: !1671)
!1676 = !DILocation(line: 126, column: 48, scope: !1671)
!1677 = !DILocalVariable(name: "t0", scope: !1671, file: !68, line: 126, type: !53)
!1678 = !DILocation(line: 0, scope: !1671)
!1679 = !DILocation(line: 127, column: 25, scope: !1671)
!1680 = !DILocation(line: 127, column: 32, scope: !1671)
!1681 = !DILocation(line: 127, column: 40, scope: !1671)
!1682 = !DILocation(line: 127, column: 38, scope: !1671)
!1683 = !DILocation(line: 127, column: 48, scope: !1671)
!1684 = !DILocalVariable(name: "t1", scope: !1671, file: !68, line: 127, type: !53)
!1685 = !DILocation(line: 128, column: 23, scope: !1671)
!1686 = !DILocation(line: 128, column: 16, scope: !1671)
!1687 = !DILocation(line: 129, column: 23, scope: !1671)
!1688 = !DILocation(line: 129, column: 9, scope: !1671)
!1689 = !DILocation(line: 129, column: 16, scope: !1671)
!1690 = !DILocation(line: 130, column: 9, scope: !1671)
!1691 = !DILocation(line: 130, column: 16, scope: !1671)
!1692 = !DILocation(line: 131, column: 9, scope: !1671)
!1693 = !DILocation(line: 131, column: 16, scope: !1671)
!1694 = !DILocation(line: 128, column: 9, scope: !1671)
!1695 = !DILocalVariable(name: "i", scope: !1696, file: !68, line: 134, type: !58)
!1696 = distinct !DILexicalBlock(scope: !67, file: !68, line: 134, column: 5)
!1697 = !DILocation(line: 0, scope: !1696)
!1698 = !DILocation(line: 136, column: 25, scope: !1699)
!1699 = distinct !DILexicalBlock(scope: !1700, file: !68, line: 135, column: 5)
!1700 = distinct !DILexicalBlock(scope: !1696, file: !68, line: 134, column: 5)
!1701 = !DILocation(line: 136, column: 32, scope: !1699)
!1702 = !DILocation(line: 136, column: 41, scope: !1699)
!1703 = !DILocation(line: 136, column: 39, scope: !1699)
!1704 = !DILocation(line: 136, column: 50, scope: !1699)
!1705 = !DILocalVariable(name: "t0", scope: !1699, file: !68, line: 136, type: !53)
!1706 = !DILocation(line: 0, scope: !1699)
!1707 = !DILocation(line: 137, column: 25, scope: !1699)
!1708 = !DILocation(line: 137, column: 32, scope: !1699)
!1709 = !DILocation(line: 137, column: 41, scope: !1699)
!1710 = !DILocation(line: 137, column: 39, scope: !1699)
!1711 = !DILocation(line: 137, column: 50, scope: !1699)
!1712 = !DILocalVariable(name: "t1", scope: !1699, file: !68, line: 137, type: !53)
!1713 = !DILocation(line: 139, column: 23, scope: !1699)
!1714 = !DILocation(line: 139, column: 17, scope: !1699)
!1715 = !DILocation(line: 140, column: 23, scope: !1699)
!1716 = !DILocation(line: 140, column: 9, scope: !1699)
!1717 = !DILocation(line: 140, column: 17, scope: !1699)
!1718 = !DILocation(line: 141, column: 9, scope: !1699)
!1719 = !DILocation(line: 141, column: 17, scope: !1699)
!1720 = !DILocation(line: 142, column: 9, scope: !1699)
!1721 = !DILocation(line: 142, column: 17, scope: !1699)
!1722 = !DILocation(line: 139, column: 9, scope: !1699)
!1723 = !DILocalVariable(name: "i", scope: !1724, file: !68, line: 145, type: !58)
!1724 = distinct !DILexicalBlock(scope: !67, file: !68, line: 145, column: 5)
!1725 = !DILocation(line: 0, scope: !1724)
!1726 = !DILocation(line: 147, column: 24, scope: !1727)
!1727 = distinct !DILexicalBlock(scope: !1728, file: !68, line: 146, column: 5)
!1728 = distinct !DILexicalBlock(scope: !1724, file: !68, line: 145, column: 5)
!1729 = !DILocation(line: 147, column: 28, scope: !1727)
!1730 = !DILocation(line: 147, column: 36, scope: !1727)
!1731 = !DILocation(line: 147, column: 44, scope: !1727)
!1732 = !DILocalVariable(name: "t", scope: !1727, file: !68, line: 147, type: !53)
!1733 = !DILocation(line: 0, scope: !1727)
!1734 = !DILocation(line: 148, column: 21, scope: !1727)
!1735 = !DILocation(line: 148, column: 16, scope: !1727)
!1736 = !DILocation(line: 149, column: 9, scope: !1727)
!1737 = !DILocation(line: 149, column: 16, scope: !1727)
!1738 = !DILocation(line: 148, column: 9, scope: !1727)
!1739 = !DILocation(line: 151, column: 1, scope: !67)
!1740 = distinct !DISubprogram(name: "mul_add_mat_x_m_mat", scope: !408, file: !408, line: 61, type: !469, scopeLine: 62, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1741 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !1740, file: !408, line: 61, type: !324)
!1742 = !DILocation(line: 0, scope: !1740)
!1743 = !DILocalVariable(name: "mat", arg: 2, scope: !1740, file: !408, line: 61, type: !90)
!1744 = !DILocalVariable(name: "bs_mat", arg: 3, scope: !1740, file: !408, line: 61, type: !411)
!1745 = !DILocalVariable(name: "acc", arg: 4, scope: !1740, file: !408, line: 61, type: !52)
!1746 = !DILocalVariable(name: "mat_rows", arg: 5, scope: !1740, file: !408, line: 62, type: !324)
!1747 = !DILocalVariable(name: "mat_cols", arg: 6, scope: !1740, file: !408, line: 62, type: !324)
!1748 = !DILocalVariable(name: "bs_mat_cols", arg: 7, scope: !1740, file: !408, line: 62, type: !324)
!1749 = !DILocalVariable(name: "r", scope: !1750, file: !408, line: 64, type: !86)
!1750 = distinct !DILexicalBlock(scope: !1740, file: !408, line: 64, column: 5)
!1751 = !DILocation(line: 0, scope: !1750)
!1752 = !DILocation(line: 64, column: 10, scope: !1750)
!1753 = !DILocation(line: 64, scope: !1750)
!1754 = !DILocation(line: 64, column: 23, scope: !1755)
!1755 = distinct !DILexicalBlock(scope: !1750, file: !408, line: 64, column: 5)
!1756 = !DILocation(line: 64, column: 5, scope: !1750)
!1757 = !DILocation(line: 65, scope: !1758)
!1758 = distinct !DILexicalBlock(scope: !1759, file: !408, line: 65, column: 9)
!1759 = distinct !DILexicalBlock(scope: !1755, file: !408, line: 64, column: 40)
!1760 = !DILocalVariable(name: "c", scope: !1758, file: !408, line: 65, type: !86)
!1761 = !DILocation(line: 0, scope: !1758)
!1762 = !DILocation(line: 65, column: 27, scope: !1763)
!1763 = distinct !DILexicalBlock(scope: !1758, file: !408, line: 65, column: 9)
!1764 = !DILocation(line: 65, column: 9, scope: !1758)
!1765 = !DILocation(line: 66, scope: !1766)
!1766 = distinct !DILexicalBlock(scope: !1767, file: !408, line: 66, column: 13)
!1767 = distinct !DILexicalBlock(scope: !1763, file: !408, line: 65, column: 44)
!1768 = !DILocalVariable(name: "k", scope: !1766, file: !408, line: 66, type: !86)
!1769 = !DILocation(line: 0, scope: !1766)
!1770 = !DILocation(line: 66, column: 31, scope: !1771)
!1771 = distinct !DILexicalBlock(scope: !1766, file: !408, line: 66, column: 13)
!1772 = !DILocation(line: 66, column: 13, scope: !1766)
!1773 = !DILocation(line: 67, column: 70, scope: !1774)
!1774 = distinct !DILexicalBlock(scope: !1771, file: !408, line: 66, column: 54)
!1775 = !DILocation(line: 67, column: 84, scope: !1774)
!1776 = !DILocation(line: 67, column: 65, scope: !1774)
!1777 = !DILocation(line: 67, column: 51, scope: !1774)
!1778 = !DILocation(line: 67, column: 96, scope: !1774)
!1779 = !DILocation(line: 67, column: 90, scope: !1774)
!1780 = !DILocation(line: 67, column: 136, scope: !1774)
!1781 = !DILocation(line: 67, column: 150, scope: !1774)
!1782 = !DILocation(line: 67, column: 131, scope: !1774)
!1783 = !DILocation(line: 67, column: 117, scope: !1774)
!1784 = !DILocation(line: 67, column: 17, scope: !1774)
!1785 = !DILocation(line: 66, column: 48, scope: !1771)
!1786 = !DILocation(line: 66, column: 13, scope: !1771)
!1787 = distinct !{!1787, !1772, !1788, !388}
!1788 = !DILocation(line: 68, column: 13, scope: !1766)
!1789 = !DILocation(line: 65, column: 40, scope: !1763)
!1790 = !DILocation(line: 65, column: 9, scope: !1763)
!1791 = distinct !{!1791, !1764, !1792, !388}
!1792 = !DILocation(line: 69, column: 9, scope: !1758)
!1793 = !DILocation(line: 64, column: 36, scope: !1755)
!1794 = !DILocation(line: 64, column: 5, scope: !1755)
!1795 = distinct !{!1795, !1756, !1796, !388}
!1796 = !DILocation(line: 70, column: 5, scope: !1750)
!1797 = !DILocation(line: 71, column: 1, scope: !1740)
!1798 = distinct !DISubprogram(name: "P1_times_Vt", scope: !408, file: !408, line: 82, type: !459, scopeLine: 82, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1799 = !DILocalVariable(name: "p", arg: 1, scope: !1798, file: !408, line: 82, type: !264)
!1800 = !DILocation(line: 0, scope: !1798)
!1801 = !DILocalVariable(name: "P1", arg: 2, scope: !1798, file: !408, line: 82, type: !411)
!1802 = !DILocalVariable(name: "V", arg: 3, scope: !1798, file: !408, line: 82, type: !90)
!1803 = !DILocalVariable(name: "acc", arg: 4, scope: !1798, file: !408, line: 82, type: !52)
!1804 = !DILocation(line: 86, column: 5, scope: !1798)
!1805 = !DILocation(line: 87, column: 1, scope: !1798)
!1806 = distinct !DISubprogram(name: "mul_add_m_upper_triangular_mat_x_mat_trans", scope: !408, file: !408, line: 32, type: !593, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1807 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !1806, file: !408, line: 32, type: !324)
!1808 = !DILocation(line: 0, scope: !1806)
!1809 = !DILocalVariable(name: "bs_mat", arg: 2, scope: !1806, file: !408, line: 32, type: !411)
!1810 = !DILocalVariable(name: "mat", arg: 3, scope: !1806, file: !408, line: 32, type: !90)
!1811 = !DILocalVariable(name: "acc", arg: 4, scope: !1806, file: !408, line: 32, type: !52)
!1812 = !DILocalVariable(name: "bs_mat_rows", arg: 5, scope: !1806, file: !408, line: 33, type: !324)
!1813 = !DILocalVariable(name: "bs_mat_cols", arg: 6, scope: !1806, file: !408, line: 33, type: !324)
!1814 = !DILocalVariable(name: "mat_rows", arg: 7, scope: !1806, file: !408, line: 33, type: !324)
!1815 = !DILocalVariable(name: "triangular", arg: 8, scope: !1806, file: !408, line: 33, type: !324)
!1816 = !DILocalVariable(name: "bs_mat_entries_used", scope: !1806, file: !408, line: 34, type: !86)
!1817 = !DILocalVariable(name: "r", scope: !1818, file: !408, line: 35, type: !86)
!1818 = distinct !DILexicalBlock(scope: !1806, file: !408, line: 35, column: 5)
!1819 = !DILocation(line: 0, scope: !1818)
!1820 = !DILocation(line: 35, column: 10, scope: !1818)
!1821 = !DILocation(line: 34, column: 9, scope: !1806)
!1822 = !DILocation(line: 35, scope: !1818)
!1823 = !DILocation(line: 35, column: 23, scope: !1824)
!1824 = distinct !DILexicalBlock(scope: !1818, file: !408, line: 35, column: 5)
!1825 = !DILocation(line: 35, column: 5, scope: !1818)
!1826 = !DILocation(line: 36, column: 33, scope: !1827)
!1827 = distinct !DILexicalBlock(scope: !1828, file: !408, line: 36, column: 9)
!1828 = distinct !DILexicalBlock(scope: !1824, file: !408, line: 35, column: 43)
!1829 = !DILocalVariable(name: "c", scope: !1827, file: !408, line: 36, type: !86)
!1830 = !DILocation(line: 0, scope: !1827)
!1831 = !DILocation(line: 36, column: 14, scope: !1827)
!1832 = !DILocation(line: 36, scope: !1827)
!1833 = !DILocation(line: 36, column: 40, scope: !1834)
!1834 = distinct !DILexicalBlock(scope: !1827, file: !408, line: 36, column: 9)
!1835 = !DILocation(line: 36, column: 9, scope: !1827)
!1836 = !DILocation(line: 37, scope: !1837)
!1837 = distinct !DILexicalBlock(scope: !1838, file: !408, line: 37, column: 13)
!1838 = distinct !DILexicalBlock(scope: !1834, file: !408, line: 36, column: 60)
!1839 = !DILocalVariable(name: "k", scope: !1837, file: !408, line: 37, type: !86)
!1840 = !DILocation(line: 0, scope: !1837)
!1841 = !DILocation(line: 37, column: 31, scope: !1842)
!1842 = distinct !DILexicalBlock(scope: !1837, file: !408, line: 37, column: 13)
!1843 = !DILocation(line: 37, column: 13, scope: !1837)
!1844 = !DILocation(line: 38, column: 65, scope: !1845)
!1845 = distinct !DILexicalBlock(scope: !1842, file: !408, line: 37, column: 51)
!1846 = !DILocation(line: 38, column: 51, scope: !1845)
!1847 = !DILocation(line: 38, column: 94, scope: !1845)
!1848 = !DILocation(line: 38, column: 88, scope: !1845)
!1849 = !DILocation(line: 38, column: 137, scope: !1845)
!1850 = !DILocation(line: 38, column: 148, scope: !1845)
!1851 = !DILocation(line: 38, column: 132, scope: !1845)
!1852 = !DILocation(line: 38, column: 118, scope: !1845)
!1853 = !DILocation(line: 38, column: 17, scope: !1845)
!1854 = !DILocation(line: 37, column: 45, scope: !1842)
!1855 = !DILocation(line: 37, column: 13, scope: !1842)
!1856 = distinct !{!1856, !1843, !1857, !388}
!1857 = !DILocation(line: 39, column: 13, scope: !1837)
!1858 = !DILocation(line: 40, column: 33, scope: !1838)
!1859 = !DILocation(line: 36, column: 56, scope: !1834)
!1860 = !DILocation(line: 36, column: 9, scope: !1834)
!1861 = distinct !{!1861, !1835, !1862, !388}
!1862 = !DILocation(line: 41, column: 9, scope: !1827)
!1863 = !DILocation(line: 35, column: 39, scope: !1824)
!1864 = !DILocation(line: 35, column: 5, scope: !1824)
!1865 = distinct !{!1865, !1825, !1866, !388}
!1866 = !DILocation(line: 42, column: 5, scope: !1818)
!1867 = !DILocation(line: 43, column: 1, scope: !1806)
!1868 = distinct !DISubprogram(name: "pqmayo_MAYO_1_ref_mayo_sign", scope: !68, file: !68, line: 502, type: !802, scopeLine: 504, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1869 = !DILocalVariable(name: "p", arg: 1, scope: !1868, file: !68, line: 502, type: !264)
!1870 = !DILocation(line: 0, scope: !1868)
!1871 = !DILocalVariable(name: "sm", arg: 2, scope: !1868, file: !68, line: 502, type: !61)
!1872 = !DILocalVariable(name: "smlen", arg: 3, scope: !1868, file: !68, line: 503, type: !804)
!1873 = !DILocalVariable(name: "m", arg: 4, scope: !1868, file: !68, line: 503, type: !90)
!1874 = !DILocalVariable(name: "mlen", arg: 5, scope: !1868, file: !68, line: 504, type: !58)
!1875 = !DILocalVariable(name: "csk", arg: 6, scope: !1868, file: !68, line: 504, type: !90)
!1876 = !DILocalVariable(name: "ret", scope: !1868, file: !68, line: 505, type: !86)
!1877 = !DILocalVariable(name: "param_sig_bytes", scope: !1868, file: !68, line: 506, type: !324)
!1878 = !DILocation(line: 508, column: 16, scope: !1868)
!1879 = !DILocation(line: 508, column: 5, scope: !1868)
!1880 = !DILocation(line: 509, column: 50, scope: !1868)
!1881 = !DILocalVariable(name: "siglen", scope: !1868, file: !68, line: 507, type: !58)
!1882 = !DILocation(line: 509, column: 11, scope: !1868)
!1883 = !DILocation(line: 510, column: 13, scope: !1884)
!1884 = distinct !DILexicalBlock(scope: !1868, file: !68, line: 510, column: 9)
!1885 = !DILocation(line: 510, column: 24, scope: !1884)
!1886 = !DILocation(line: 511, column: 23, scope: !1887)
!1887 = distinct !DILexicalBlock(scope: !1884, file: !68, line: 510, column: 62)
!1888 = !DILocation(line: 511, column: 30, scope: !1887)
!1889 = !DILocation(line: 511, column: 9, scope: !1887)
!1890 = !DILocation(line: 512, column: 9, scope: !1887)
!1891 = !DILocation(line: 515, column: 14, scope: !1868)
!1892 = !DILocation(line: 515, column: 21, scope: !1868)
!1893 = !DILocation(line: 515, column: 12, scope: !1868)
!1894 = !DILocation(line: 515, column: 5, scope: !1868)
!1895 = !DILabel(scope: !1868, name: "err", file: !68, line: 516)
!1896 = !DILocation(line: 516, column: 1, scope: !1868)
!1897 = !DILocation(line: 517, column: 5, scope: !1868)
!1898 = distinct !DISubprogram(name: "pqmayo_MAYO_1_ref_mayo_open", scope: !68, file: !68, line: 520, type: !802, scopeLine: 522, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1899 = !DILocalVariable(name: "p", arg: 1, scope: !1898, file: !68, line: 520, type: !264)
!1900 = !DILocation(line: 0, scope: !1898)
!1901 = !DILocalVariable(name: "m", arg: 2, scope: !1898, file: !68, line: 520, type: !61)
!1902 = !DILocalVariable(name: "mlen", arg: 3, scope: !1898, file: !68, line: 521, type: !804)
!1903 = !DILocalVariable(name: "sm", arg: 4, scope: !1898, file: !68, line: 521, type: !90)
!1904 = !DILocalVariable(name: "smlen", arg: 5, scope: !1898, file: !68, line: 522, type: !58)
!1905 = !DILocalVariable(name: "pk", arg: 6, scope: !1898, file: !68, line: 522, type: !90)
!1906 = !DILocalVariable(name: "param_sig_bytes", scope: !1898, file: !68, line: 523, type: !324)
!1907 = !DILocation(line: 524, column: 15, scope: !1908)
!1908 = distinct !DILexicalBlock(scope: !1898, file: !68, line: 524, column: 9)
!1909 = !DILocation(line: 527, column: 36, scope: !1898)
!1910 = !DILocation(line: 527, column: 61, scope: !1898)
!1911 = !DILocation(line: 527, column: 18, scope: !1898)
!1912 = !DILocalVariable(name: "result", scope: !1898, file: !68, line: 527, type: !86)
!1913 = !DILocation(line: 530, column: 16, scope: !1914)
!1914 = distinct !DILexicalBlock(scope: !1898, file: !68, line: 530, column: 9)
!1915 = !DILocation(line: 531, column: 23, scope: !1916)
!1916 = distinct !DILexicalBlock(scope: !1914, file: !68, line: 530, column: 28)
!1917 = !DILocation(line: 531, column: 15, scope: !1916)
!1918 = !DILocation(line: 532, column: 23, scope: !1916)
!1919 = !DILocation(line: 532, column: 9, scope: !1916)
!1920 = !DILocation(line: 533, column: 5, scope: !1916)
!1921 = !DILocation(line: 536, column: 1, scope: !1898)
!1922 = distinct !DISubprogram(name: "pqmayo_MAYO_1_ref_mayo_verify", scope: !68, file: !68, line: 617, type: !1923, scopeLine: 619, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1923 = !DISubroutineType(types: !1924)
!1924 = !{!86, !264, !90, !58, !90, !90}
!1925 = !DILocalVariable(name: "p", arg: 1, scope: !1922, file: !68, line: 617, type: !264)
!1926 = !DILocation(line: 0, scope: !1922)
!1927 = !DILocalVariable(name: "m", arg: 2, scope: !1922, file: !68, line: 617, type: !90)
!1928 = !DILocalVariable(name: "mlen", arg: 3, scope: !1922, file: !68, line: 618, type: !58)
!1929 = !DILocalVariable(name: "sig", arg: 4, scope: !1922, file: !68, line: 618, type: !90)
!1930 = !DILocalVariable(name: "cpk", arg: 5, scope: !1922, file: !68, line: 619, type: !90)
!1931 = !DILocalVariable(name: "tEnc", scope: !1922, file: !68, line: 620, type: !814)
!1932 = !DILocation(line: 620, column: 19, scope: !1922)
!1933 = !DILocalVariable(name: "t", scope: !1922, file: !68, line: 621, type: !817)
!1934 = !DILocation(line: 621, column: 19, scope: !1922)
!1935 = !DILocalVariable(name: "y", scope: !1922, file: !68, line: 622, type: !1936)
!1936 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 1248, elements: !1937)
!1937 = !{!1938}
!1938 = !DISubrange(count: 156)
!1939 = !DILocation(line: 622, column: 19, scope: !1922)
!1940 = !DILocalVariable(name: "s", scope: !1922, file: !68, line: 623, type: !844)
!1941 = !DILocation(line: 623, column: 19, scope: !1922)
!1942 = !DILocalVariable(name: "pk", scope: !1922, file: !68, line: 624, type: !1943)
!1943 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 1197120, elements: !1944)
!1944 = !{!1945}
!1945 = !DISubrange(count: 18705)
!1946 = !DILocation(line: 624, column: 14, scope: !1922)
!1947 = !DILocalVariable(name: "tmp", scope: !1922, file: !68, line: 625, type: !1948)
!1948 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 448, elements: !1949)
!1949 = !{!1950}
!1950 = !DISubrange(count: 56)
!1951 = !DILocation(line: 625, column: 19, scope: !1922)
!1952 = !DILocalVariable(name: "param_m", scope: !1922, file: !68, line: 627, type: !324)
!1953 = !DILocalVariable(name: "param_n", scope: !1922, file: !68, line: 628, type: !324)
!1954 = !DILocalVariable(name: "param_k", scope: !1922, file: !68, line: 629, type: !324)
!1955 = !DILocalVariable(name: "param_m_bytes", scope: !1922, file: !68, line: 630, type: !324)
!1956 = !DILocalVariable(name: "param_sig_bytes", scope: !1922, file: !68, line: 631, type: !324)
!1957 = !DILocalVariable(name: "param_digest_bytes", scope: !1922, file: !68, line: 632, type: !324)
!1958 = !DILocalVariable(name: "param_salt_bytes", scope: !1922, file: !68, line: 633, type: !324)
!1959 = !DILocation(line: 635, column: 15, scope: !1922)
!1960 = !DILocalVariable(name: "ret", scope: !1922, file: !68, line: 635, type: !86)
!1961 = !DILocation(line: 636, column: 13, scope: !1962)
!1962 = distinct !DILexicalBlock(scope: !1922, file: !68, line: 636, column: 9)
!1963 = !DILocalVariable(name: "P1", scope: !1922, file: !68, line: 640, type: !52)
!1964 = !DILocation(line: 641, column: 23, scope: !1922)
!1965 = !DILocalVariable(name: "P2", scope: !1922, file: !68, line: 641, type: !52)
!1966 = !DILocation(line: 642, column: 23, scope: !1922)
!1967 = !DILocalVariable(name: "P3", scope: !1922, file: !68, line: 642, type: !52)
!1968 = !DILocation(line: 657, column: 5, scope: !1922)
!1969 = !DILocation(line: 660, column: 16, scope: !1922)
!1970 = !DILocation(line: 660, column: 60, scope: !1922)
!1971 = !DILocation(line: 660, column: 5, scope: !1922)
!1972 = !DILocation(line: 662, column: 5, scope: !1922)
!1973 = !DILocation(line: 663, column: 5, scope: !1922)
!1974 = !DILocation(line: 666, column: 5, scope: !1922)
!1975 = !DILocation(line: 668, column: 5, scope: !1922)
!1976 = !DILocation(line: 670, column: 9, scope: !1977)
!1977 = distinct !DILexicalBlock(scope: !1922, file: !68, line: 670, column: 9)
!1978 = !DILocation(line: 670, column: 31, scope: !1977)
!1979 = !DILocation(line: 674, column: 1, scope: !1922)
!1980 = distinct !DISubprogram(name: "pqmayo_MAYO_1_ref_mayo_expand_pk", scope: !68, file: !68, line: 608, type: !1981, scopeLine: 609, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1981 = !DISubroutineType(types: !1982)
!1982 = !{!86, !264, !90, !52}
!1983 = !DILocalVariable(name: "p", arg: 1, scope: !1980, file: !68, line: 608, type: !264)
!1984 = !DILocation(line: 0, scope: !1980)
!1985 = !DILocalVariable(name: "cpk", arg: 2, scope: !1980, file: !68, line: 608, type: !90)
!1986 = !DILocalVariable(name: "pk", arg: 3, scope: !1980, file: !68, line: 609, type: !52)
!1987 = !DILocation(line: 610, column: 5, scope: !1980)
!1988 = !DILocation(line: 612, column: 23, scope: !1980)
!1989 = !DILocation(line: 612, column: 72, scope: !1980)
!1990 = !DILocation(line: 612, column: 5, scope: !1980)
!1991 = !DILocation(line: 614, column: 5, scope: !1980)
!1992 = distinct !DISubprogram(name: "eval_public_map", scope: !68, file: !68, line: 288, type: !1993, scopeLine: 288, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!1993 = !DISubroutineType(types: !1994)
!1994 = !{null, !264, !90, !411, !411, !411, !61}
!1995 = !DILocalVariable(name: "p", arg: 1, scope: !1992, file: !68, line: 288, type: !264)
!1996 = !DILocation(line: 0, scope: !1992)
!1997 = !DILocalVariable(name: "s", arg: 2, scope: !1992, file: !68, line: 288, type: !90)
!1998 = !DILocalVariable(name: "P1", arg: 3, scope: !1992, file: !68, line: 288, type: !411)
!1999 = !DILocalVariable(name: "P2", arg: 4, scope: !1992, file: !68, line: 288, type: !411)
!2000 = !DILocalVariable(name: "P3", arg: 5, scope: !1992, file: !68, line: 288, type: !411)
!2001 = !DILocalVariable(name: "eval", arg: 6, scope: !1992, file: !68, line: 288, type: !61)
!2002 = !DILocalVariable(name: "SPS", scope: !1992, file: !68, line: 289, type: !2003)
!2003 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 32000, elements: !2004)
!2004 = !{!2005}
!2005 = !DISubrange(count: 500)
!2006 = !DILocation(line: 289, column: 14, scope: !1992)
!2007 = !DILocation(line: 291, column: 5, scope: !1992)
!2008 = !DILocalVariable(name: "zero", scope: !1992, file: !68, line: 292, type: !817)
!2009 = !DILocation(line: 292, column: 19, scope: !1992)
!2010 = !DILocation(line: 293, column: 5, scope: !1992)
!2011 = !DILocation(line: 294, column: 1, scope: !1992)
!2012 = distinct !DISubprogram(name: "m_calculate_PS_SPS", scope: !408, file: !408, line: 277, type: !2013, scopeLine: 278, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2013 = !DISubroutineType(types: !2014)
!2014 = !{null, !264, !411, !411, !411, !90, !52}
!2015 = !DILocalVariable(name: "p", arg: 1, scope: !2012, file: !408, line: 277, type: !264)
!2016 = !DILocation(line: 0, scope: !2012)
!2017 = !DILocalVariable(name: "P1", arg: 2, scope: !2012, file: !408, line: 277, type: !411)
!2018 = !DILocalVariable(name: "P2", arg: 3, scope: !2012, file: !408, line: 277, type: !411)
!2019 = !DILocalVariable(name: "P3", arg: 4, scope: !2012, file: !408, line: 277, type: !411)
!2020 = !DILocalVariable(name: "s", arg: 5, scope: !2012, file: !408, line: 277, type: !90)
!2021 = !DILocalVariable(name: "SPS", arg: 6, scope: !2012, file: !408, line: 278, type: !52)
!2022 = !DILocalVariable(name: "PS", scope: !2012, file: !408, line: 286, type: !2023)
!2023 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 275200, elements: !2024)
!2024 = !{!2025}
!2025 = !DISubrange(count: 4300)
!2026 = !DILocation(line: 286, column: 14, scope: !2012)
!2027 = !DILocation(line: 287, column: 5, scope: !2012)
!2028 = !DILocation(line: 290, column: 5, scope: !2012)
!2029 = !DILocation(line: 292, column: 1, scope: !2012)
!2030 = distinct !DISubprogram(name: "mayo_generic_m_calculate_PS", scope: !408, file: !408, line: 151, type: !2031, scopeLine: 152, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2031 = !DISubroutineType(types: !2032)
!2032 = !{null, !411, !411, !411, !90, !324, !324, !324, !324, !52}
!2033 = !DILocalVariable(name: "P1", arg: 1, scope: !2030, file: !408, line: 151, type: !411)
!2034 = !DILocation(line: 0, scope: !2030)
!2035 = !DILocalVariable(name: "P2", arg: 2, scope: !2030, file: !408, line: 151, type: !411)
!2036 = !DILocalVariable(name: "P3", arg: 3, scope: !2030, file: !408, line: 151, type: !411)
!2037 = !DILocalVariable(name: "S", arg: 4, scope: !2030, file: !408, line: 151, type: !90)
!2038 = !DILocalVariable(name: "m", arg: 5, scope: !2030, file: !408, line: 152, type: !324)
!2039 = !DILocalVariable(name: "v", arg: 6, scope: !2030, file: !408, line: 152, type: !324)
!2040 = !DILocalVariable(name: "o", arg: 7, scope: !2030, file: !408, line: 152, type: !324)
!2041 = !DILocalVariable(name: "k", arg: 8, scope: !2030, file: !408, line: 152, type: !324)
!2042 = !DILocalVariable(name: "PS", arg: 9, scope: !2030, file: !408, line: 152, type: !52)
!2043 = !DILocation(line: 154, column: 21, scope: !2030)
!2044 = !DILocalVariable(name: "n", scope: !2030, file: !408, line: 154, type: !324)
!2045 = !DILocation(line: 155, column: 32, scope: !2030)
!2046 = !DILocation(line: 155, column: 37, scope: !2030)
!2047 = !DILocalVariable(name: "m_vec_limbs", scope: !2030, file: !408, line: 155, type: !324)
!2048 = !DILocalVariable(name: "accumulator", scope: !2030, file: !408, line: 157, type: !2049)
!2049 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 4403200, elements: !2050)
!2050 = !{!2051}
!2051 = !DISubrange(count: 68800)
!2052 = !DILocation(line: 157, column: 14, scope: !2030)
!2053 = !DILocalVariable(name: "P1_used", scope: !2030, file: !408, line: 158, type: !86)
!2054 = !DILocalVariable(name: "row", scope: !2055, file: !408, line: 159, type: !86)
!2055 = distinct !DILexicalBlock(scope: !2030, file: !408, line: 159, column: 5)
!2056 = !DILocation(line: 0, scope: !2055)
!2057 = !DILocation(line: 159, column: 10, scope: !2055)
!2058 = !DILocation(line: 158, column: 9, scope: !2030)
!2059 = !DILocation(line: 159, scope: !2055)
!2060 = !DILocation(line: 159, column: 27, scope: !2061)
!2061 = distinct !DILexicalBlock(scope: !2055, file: !408, line: 159, column: 5)
!2062 = !DILocation(line: 159, column: 5, scope: !2055)
!2063 = !DILocation(line: 160, column: 9, scope: !2064)
!2064 = distinct !DILexicalBlock(scope: !2065, file: !408, line: 160, column: 9)
!2065 = distinct !DILexicalBlock(scope: !2061, file: !408, line: 159, column: 39)
!2066 = !DILocation(line: 175, column: 5, scope: !2067)
!2067 = distinct !DILexicalBlock(scope: !2030, file: !408, line: 175, column: 5)
!2068 = !DILocation(line: 160, scope: !2064)
!2069 = !DILocalVariable(name: "j", scope: !2064, file: !408, line: 160, type: !86)
!2070 = !DILocation(line: 0, scope: !2064)
!2071 = !DILocation(line: 160, column: 29, scope: !2072)
!2072 = distinct !DILexicalBlock(scope: !2064, file: !408, line: 160, column: 9)
!2073 = !DILocation(line: 161, scope: !2074)
!2074 = distinct !DILexicalBlock(scope: !2075, file: !408, line: 161, column: 13)
!2075 = distinct !DILexicalBlock(scope: !2072, file: !408, line: 160, column: 39)
!2076 = !DILocalVariable(name: "col", scope: !2074, file: !408, line: 161, type: !86)
!2077 = !DILocation(line: 0, scope: !2074)
!2078 = !DILocation(line: 161, column: 35, scope: !2079)
!2079 = distinct !DILexicalBlock(scope: !2074, file: !408, line: 161, column: 13)
!2080 = !DILocation(line: 161, column: 13, scope: !2074)
!2081 = !DILocation(line: 162, column: 54, scope: !2082)
!2082 = distinct !DILexicalBlock(scope: !2079, file: !408, line: 161, column: 47)
!2083 = !DILocation(line: 162, column: 43, scope: !2082)
!2084 = !DILocation(line: 162, column: 91, scope: !2082)
!2085 = !DILocation(line: 162, column: 95, scope: !2082)
!2086 = !DILocation(line: 162, column: 102, scope: !2082)
!2087 = !DILocation(line: 162, column: 115, scope: !2082)
!2088 = !DILocation(line: 162, column: 109, scope: !2082)
!2089 = !DILocation(line: 162, column: 107, scope: !2082)
!2090 = !DILocation(line: 162, column: 125, scope: !2082)
!2091 = !DILocation(line: 162, column: 82, scope: !2082)
!2092 = !DILocation(line: 162, column: 17, scope: !2082)
!2093 = !DILocation(line: 161, column: 43, scope: !2079)
!2094 = !DILocation(line: 161, column: 13, scope: !2079)
!2095 = distinct !{!2095, !2080, !2096, !388}
!2096 = !DILocation(line: 163, column: 13, scope: !2074)
!2097 = !DILocation(line: 164, column: 21, scope: !2075)
!2098 = !DILocation(line: 160, column: 35, scope: !2072)
!2099 = !DILocation(line: 160, column: 9, scope: !2072)
!2100 = distinct !{!2100, !2063, !2101, !388}
!2101 = !DILocation(line: 165, column: 9, scope: !2064)
!2102 = !DILocation(line: 167, scope: !2103)
!2103 = distinct !DILexicalBlock(scope: !2065, file: !408, line: 167, column: 9)
!2104 = !DILocalVariable(name: "j", scope: !2103, file: !408, line: 167, type: !86)
!2105 = !DILocation(line: 0, scope: !2103)
!2106 = !DILocation(line: 167, column: 27, scope: !2107)
!2107 = distinct !DILexicalBlock(scope: !2103, file: !408, line: 167, column: 9)
!2108 = !DILocation(line: 167, column: 9, scope: !2103)
!2109 = !DILocation(line: 168, scope: !2110)
!2110 = distinct !DILexicalBlock(scope: !2111, file: !408, line: 168, column: 13)
!2111 = distinct !DILexicalBlock(scope: !2107, file: !408, line: 167, column: 37)
!2112 = !DILocalVariable(name: "col", scope: !2110, file: !408, line: 168, type: !86)
!2113 = !DILocation(line: 0, scope: !2110)
!2114 = !DILocation(line: 168, column: 35, scope: !2115)
!2115 = distinct !DILexicalBlock(scope: !2110, file: !408, line: 168, column: 13)
!2116 = !DILocation(line: 168, column: 13, scope: !2110)
!2117 = !DILocation(line: 169, column: 50, scope: !2118)
!2118 = distinct !DILexicalBlock(scope: !2115, file: !408, line: 168, column: 47)
!2119 = !DILocation(line: 169, column: 54, scope: !2118)
!2120 = !DILocation(line: 169, column: 58, scope: !2118)
!2121 = !DILocation(line: 169, column: 43, scope: !2118)
!2122 = !DILocation(line: 169, column: 93, scope: !2118)
!2123 = !DILocation(line: 169, column: 97, scope: !2118)
!2124 = !DILocation(line: 169, column: 104, scope: !2118)
!2125 = !DILocation(line: 169, column: 118, scope: !2118)
!2126 = !DILocation(line: 169, column: 111, scope: !2118)
!2127 = !DILocation(line: 169, column: 109, scope: !2118)
!2128 = !DILocation(line: 169, column: 133, scope: !2118)
!2129 = !DILocation(line: 169, column: 84, scope: !2118)
!2130 = !DILocation(line: 169, column: 17, scope: !2118)
!2131 = !DILocation(line: 168, column: 43, scope: !2115)
!2132 = !DILocation(line: 168, column: 13, scope: !2115)
!2133 = distinct !{!2133, !2116, !2134, !388}
!2134 = !DILocation(line: 170, column: 13, scope: !2110)
!2135 = !DILocation(line: 167, column: 33, scope: !2107)
!2136 = !DILocation(line: 167, column: 9, scope: !2107)
!2137 = distinct !{!2137, !2108, !2138, !388}
!2138 = !DILocation(line: 171, column: 9, scope: !2103)
!2139 = !DILocation(line: 159, column: 35, scope: !2061)
!2140 = !DILocation(line: 159, column: 5, scope: !2061)
!2141 = distinct !{!2141, !2062, !2142, !388}
!2142 = !DILocation(line: 172, column: 5, scope: !2055)
!2143 = !DILocation(line: 174, column: 9, scope: !2030)
!2144 = !DILocation(line: 175, scope: !2067)
!2145 = !DILocalVariable(name: "row", scope: !2067, file: !408, line: 175, type: !86)
!2146 = !DILocation(line: 0, scope: !2067)
!2147 = !DILocalVariable(name: "P3_used", scope: !2030, file: !408, line: 174, type: !86)
!2148 = !DILocation(line: 175, column: 27, scope: !2149)
!2149 = distinct !DILexicalBlock(scope: !2067, file: !408, line: 175, column: 5)
!2150 = !DILocation(line: 186, column: 5, scope: !2030)
!2151 = !DILocation(line: 176, scope: !2152)
!2152 = distinct !DILexicalBlock(scope: !2153, file: !408, line: 176, column: 9)
!2153 = distinct !DILexicalBlock(scope: !2149, file: !408, line: 175, column: 39)
!2154 = !DILocalVariable(name: "j", scope: !2152, file: !408, line: 176, type: !86)
!2155 = !DILocation(line: 0, scope: !2152)
!2156 = !DILocation(line: 176, column: 29, scope: !2157)
!2157 = distinct !DILexicalBlock(scope: !2152, file: !408, line: 176, column: 9)
!2158 = !DILocation(line: 176, column: 9, scope: !2152)
!2159 = !DILocation(line: 177, scope: !2160)
!2160 = distinct !DILexicalBlock(scope: !2161, file: !408, line: 177, column: 13)
!2161 = distinct !DILexicalBlock(scope: !2157, file: !408, line: 176, column: 39)
!2162 = !DILocalVariable(name: "col", scope: !2160, file: !408, line: 177, type: !86)
!2163 = !DILocation(line: 0, scope: !2160)
!2164 = !DILocation(line: 177, column: 35, scope: !2165)
!2165 = distinct !DILexicalBlock(scope: !2160, file: !408, line: 177, column: 13)
!2166 = !DILocation(line: 177, column: 13, scope: !2160)
!2167 = !DILocation(line: 178, column: 53, scope: !2168)
!2168 = distinct !DILexicalBlock(scope: !2165, file: !408, line: 177, column: 47)
!2169 = !DILocation(line: 178, column: 43, scope: !2168)
!2170 = !DILocation(line: 178, column: 89, scope: !2168)
!2171 = !DILocation(line: 178, column: 93, scope: !2168)
!2172 = !DILocation(line: 178, column: 100, scope: !2168)
!2173 = !DILocation(line: 178, column: 113, scope: !2168)
!2174 = !DILocation(line: 178, column: 107, scope: !2168)
!2175 = !DILocation(line: 178, column: 105, scope: !2168)
!2176 = !DILocation(line: 178, column: 123, scope: !2168)
!2177 = !DILocation(line: 178, column: 80, scope: !2168)
!2178 = !DILocation(line: 178, column: 17, scope: !2168)
!2179 = !DILocation(line: 177, column: 43, scope: !2165)
!2180 = !DILocation(line: 177, column: 13, scope: !2165)
!2181 = distinct !{!2181, !2166, !2182, !388}
!2182 = !DILocation(line: 179, column: 13, scope: !2160)
!2183 = !DILocation(line: 180, column: 21, scope: !2161)
!2184 = !DILocation(line: 176, column: 35, scope: !2157)
!2185 = !DILocation(line: 176, column: 9, scope: !2157)
!2186 = distinct !{!2186, !2158, !2187, !388}
!2187 = !DILocation(line: 181, column: 9, scope: !2152)
!2188 = !DILocation(line: 175, column: 35, scope: !2149)
!2189 = !DILocation(line: 175, column: 5, scope: !2149)
!2190 = distinct !{!2190, !2066, !2191, !388}
!2191 = !DILocation(line: 182, column: 5, scope: !2067)
!2192 = !DILocalVariable(name: "i", scope: !2030, file: !408, line: 185, type: !86)
!2193 = !DILocation(line: 186, column: 14, scope: !2030)
!2194 = !DILocation(line: 187, column: 58, scope: !2195)
!2195 = distinct !DILexicalBlock(scope: !2030, file: !408, line: 186, column: 23)
!2196 = !DILocation(line: 187, column: 63, scope: !2195)
!2197 = !DILocation(line: 187, column: 54, scope: !2195)
!2198 = !DILocation(line: 187, column: 85, scope: !2195)
!2199 = !DILocation(line: 187, column: 81, scope: !2195)
!2200 = !DILocation(line: 187, column: 9, scope: !2195)
!2201 = !DILocation(line: 188, column: 10, scope: !2195)
!2202 = distinct !{!2202, !2150, !2203, !388}
!2203 = !DILocation(line: 189, column: 5, scope: !2030)
!2204 = !DILocation(line: 191, column: 1, scope: !2030)
!2205 = distinct !DISubprogram(name: "mayo_generic_m_calculate_SPS", scope: !408, file: !408, line: 195, type: !2206, scopeLine: 195, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2206 = !DISubroutineType(types: !2207)
!2207 = !{null, !411, !90, !86, !86, !86, !52}
!2208 = !DILocalVariable(name: "PS", arg: 1, scope: !2205, file: !408, line: 195, type: !411)
!2209 = !DILocation(line: 0, scope: !2205)
!2210 = !DILocalVariable(name: "S", arg: 2, scope: !2205, file: !408, line: 195, type: !90)
!2211 = !DILocalVariable(name: "m", arg: 3, scope: !2205, file: !408, line: 195, type: !86)
!2212 = !DILocalVariable(name: "k", arg: 4, scope: !2205, file: !408, line: 195, type: !86)
!2213 = !DILocalVariable(name: "n", arg: 5, scope: !2205, file: !408, line: 195, type: !86)
!2214 = !DILocalVariable(name: "SPS", arg: 6, scope: !2205, file: !408, line: 195, type: !52)
!2215 = !DILocalVariable(name: "accumulator", scope: !2205, file: !408, line: 196, type: !2216)
!2216 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 512000, elements: !2217)
!2217 = !{!2218}
!2218 = !DISubrange(count: 8000)
!2219 = !DILocation(line: 196, column: 14, scope: !2205)
!2220 = !DILocation(line: 197, column: 32, scope: !2205)
!2221 = !DILocation(line: 197, column: 37, scope: !2205)
!2222 = !DILocalVariable(name: "m_vec_limbs", scope: !2205, file: !408, line: 197, type: !324)
!2223 = !DILocalVariable(name: "row", scope: !2224, file: !408, line: 198, type: !86)
!2224 = distinct !DILexicalBlock(scope: !2205, file: !408, line: 198, column: 5)
!2225 = !DILocation(line: 0, scope: !2224)
!2226 = !DILocation(line: 198, column: 10, scope: !2224)
!2227 = !DILocation(line: 198, scope: !2224)
!2228 = !DILocation(line: 198, column: 27, scope: !2229)
!2229 = distinct !DILexicalBlock(scope: !2224, file: !408, line: 198, column: 5)
!2230 = !DILocation(line: 198, column: 5, scope: !2224)
!2231 = !DILocation(line: 208, column: 5, scope: !2205)
!2232 = !DILocation(line: 199, scope: !2233)
!2233 = distinct !DILexicalBlock(scope: !2234, file: !408, line: 199, column: 9)
!2234 = distinct !DILexicalBlock(scope: !2229, file: !408, line: 198, column: 39)
!2235 = !DILocalVariable(name: "j", scope: !2233, file: !408, line: 199, type: !86)
!2236 = !DILocation(line: 0, scope: !2233)
!2237 = !DILocation(line: 199, column: 27, scope: !2238)
!2238 = distinct !DILexicalBlock(scope: !2233, file: !408, line: 199, column: 9)
!2239 = !DILocation(line: 199, column: 9, scope: !2233)
!2240 = !DILocation(line: 200, scope: !2241)
!2241 = distinct !DILexicalBlock(scope: !2242, file: !408, line: 200, column: 13)
!2242 = distinct !DILexicalBlock(scope: !2238, file: !408, line: 199, column: 37)
!2243 = !DILocalVariable(name: "col", scope: !2241, file: !408, line: 200, type: !86)
!2244 = !DILocation(line: 0, scope: !2241)
!2245 = !DILocation(line: 200, column: 35, scope: !2246)
!2246 = distinct !DILexicalBlock(scope: !2241, file: !408, line: 200, column: 13)
!2247 = !DILocation(line: 200, column: 13, scope: !2241)
!2248 = !DILocation(line: 201, column: 52, scope: !2249)
!2249 = distinct !DILexicalBlock(scope: !2246, file: !408, line: 200, column: 50)
!2250 = !DILocation(line: 201, column: 56, scope: !2249)
!2251 = !DILocation(line: 201, column: 63, scope: !2249)
!2252 = !DILocation(line: 201, column: 47, scope: !2249)
!2253 = !DILocation(line: 201, column: 99, scope: !2249)
!2254 = !DILocation(line: 201, column: 103, scope: !2249)
!2255 = !DILocation(line: 201, column: 110, scope: !2249)
!2256 = !DILocation(line: 201, column: 123, scope: !2249)
!2257 = !DILocation(line: 201, column: 117, scope: !2249)
!2258 = !DILocation(line: 201, column: 115, scope: !2249)
!2259 = !DILocation(line: 201, column: 133, scope: !2249)
!2260 = !DILocation(line: 201, column: 90, scope: !2249)
!2261 = !DILocation(line: 201, column: 21, scope: !2249)
!2262 = !DILocation(line: 200, column: 44, scope: !2246)
!2263 = !DILocation(line: 200, column: 13, scope: !2246)
!2264 = distinct !{!2264, !2247, !2265, !388}
!2265 = !DILocation(line: 202, column: 13, scope: !2241)
!2266 = !DILocation(line: 199, column: 33, scope: !2238)
!2267 = !DILocation(line: 199, column: 9, scope: !2238)
!2268 = distinct !{!2268, !2239, !2269, !388}
!2269 = !DILocation(line: 203, column: 9, scope: !2233)
!2270 = !DILocation(line: 198, column: 35, scope: !2229)
!2271 = !DILocation(line: 198, column: 5, scope: !2229)
!2272 = distinct !{!2272, !2230, !2273, !388}
!2273 = !DILocation(line: 204, column: 5, scope: !2224)
!2274 = !DILocalVariable(name: "i", scope: !2205, file: !408, line: 207, type: !86)
!2275 = !DILocation(line: 208, column: 14, scope: !2205)
!2276 = !DILocation(line: 209, column: 58, scope: !2277)
!2277 = distinct !DILexicalBlock(scope: !2205, file: !408, line: 208, column: 21)
!2278 = !DILocation(line: 209, column: 63, scope: !2277)
!2279 = !DILocation(line: 209, column: 54, scope: !2277)
!2280 = !DILocation(line: 209, column: 86, scope: !2277)
!2281 = !DILocation(line: 209, column: 82, scope: !2277)
!2282 = !DILocation(line: 209, column: 9, scope: !2277)
!2283 = !DILocation(line: 210, column: 10, scope: !2277)
!2284 = distinct !{!2284, !2231, !2285, !388}
!2285 = !DILocation(line: 211, column: 5, scope: !2205)
!2286 = !DILocation(line: 212, column: 1, scope: !2205)
!2287 = distinct !DISubprogram(name: "m_vec_add", scope: !529, file: !529, line: 22, type: !2288, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2288 = !DISubroutineType(types: !2289)
!2289 = !{null, !86, !411, !52}
!2290 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2287, file: !529, line: 22, type: !86)
!2291 = !DILocation(line: 0, scope: !2287)
!2292 = !DILocalVariable(name: "in", arg: 2, scope: !2287, file: !529, line: 22, type: !411)
!2293 = !DILocalVariable(name: "acc", arg: 3, scope: !2287, file: !529, line: 22, type: !52)
!2294 = !DILocalVariable(name: "i", scope: !2295, file: !529, line: 24, type: !58)
!2295 = distinct !DILexicalBlock(scope: !2287, file: !529, line: 24, column: 5)
!2296 = !DILocation(line: 0, scope: !2295)
!2297 = !DILocation(line: 26, column: 19, scope: !2298)
!2298 = distinct !DILexicalBlock(scope: !2299, file: !529, line: 25, column: 5)
!2299 = distinct !DILexicalBlock(scope: !2295, file: !529, line: 24, column: 5)
!2300 = !DILocation(line: 26, column: 16, scope: !2298)
!2301 = !DILocation(line: 26, column: 9, scope: !2298)
!2302 = !DILocation(line: 28, column: 1, scope: !2287)
!2303 = distinct !DISubprogram(name: "m_vec_multiply_bins", scope: !529, file: !529, line: 66, type: !2304, scopeLine: 66, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2304 = !DISubroutineType(types: !2305)
!2305 = !{null, !86, !52, !52}
!2306 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2303, file: !529, line: 66, type: !86)
!2307 = !DILocation(line: 0, scope: !2303)
!2308 = !DILocalVariable(name: "bins", arg: 2, scope: !2303, file: !529, line: 66, type: !52)
!2309 = !DILocalVariable(name: "out", arg: 3, scope: !2303, file: !529, line: 66, type: !52)
!2310 = !DILocation(line: 67, column: 44, scope: !2303)
!2311 = !DILocation(line: 67, column: 73, scope: !2303)
!2312 = !DILocation(line: 67, column: 5, scope: !2303)
!2313 = !DILocation(line: 68, column: 40, scope: !2303)
!2314 = !DILocation(line: 68, column: 69, scope: !2303)
!2315 = !DILocation(line: 68, column: 5, scope: !2303)
!2316 = !DILocation(line: 69, column: 44, scope: !2303)
!2317 = !DILocation(line: 69, column: 74, scope: !2303)
!2318 = !DILocation(line: 69, column: 5, scope: !2303)
!2319 = !DILocation(line: 70, column: 40, scope: !2303)
!2320 = !DILocation(line: 70, column: 69, scope: !2303)
!2321 = !DILocation(line: 70, column: 5, scope: !2303)
!2322 = !DILocation(line: 71, column: 44, scope: !2303)
!2323 = !DILocation(line: 71, column: 73, scope: !2303)
!2324 = !DILocation(line: 71, column: 5, scope: !2303)
!2325 = !DILocation(line: 72, column: 40, scope: !2303)
!2326 = !DILocation(line: 72, column: 69, scope: !2303)
!2327 = !DILocation(line: 72, column: 5, scope: !2303)
!2328 = !DILocation(line: 73, column: 44, scope: !2303)
!2329 = !DILocation(line: 73, column: 74, scope: !2303)
!2330 = !DILocation(line: 73, column: 5, scope: !2303)
!2331 = !DILocation(line: 74, column: 40, scope: !2303)
!2332 = !DILocation(line: 74, column: 69, scope: !2303)
!2333 = !DILocation(line: 74, column: 5, scope: !2303)
!2334 = !DILocation(line: 75, column: 44, scope: !2303)
!2335 = !DILocation(line: 75, column: 74, scope: !2303)
!2336 = !DILocation(line: 75, column: 5, scope: !2303)
!2337 = !DILocation(line: 76, column: 40, scope: !2303)
!2338 = !DILocation(line: 76, column: 69, scope: !2303)
!2339 = !DILocation(line: 76, column: 5, scope: !2303)
!2340 = !DILocation(line: 77, column: 44, scope: !2303)
!2341 = !DILocation(line: 77, column: 74, scope: !2303)
!2342 = !DILocation(line: 77, column: 5, scope: !2303)
!2343 = !DILocation(line: 78, column: 40, scope: !2303)
!2344 = !DILocation(line: 78, column: 69, scope: !2303)
!2345 = !DILocation(line: 78, column: 5, scope: !2303)
!2346 = !DILocation(line: 79, column: 44, scope: !2303)
!2347 = !DILocation(line: 79, column: 74, scope: !2303)
!2348 = !DILocation(line: 79, column: 5, scope: !2303)
!2349 = !DILocation(line: 80, column: 40, scope: !2303)
!2350 = !DILocation(line: 80, column: 69, scope: !2303)
!2351 = !DILocation(line: 80, column: 5, scope: !2303)
!2352 = !DILocation(line: 81, column: 35, scope: !2303)
!2353 = !DILocation(line: 81, column: 5, scope: !2303)
!2354 = !DILocation(line: 82, column: 1, scope: !2303)
!2355 = distinct !DISubprogram(name: "m_vec_mul_add_x_inv", scope: !529, file: !529, line: 56, type: !2288, scopeLine: 56, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2356 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2355, file: !529, line: 56, type: !86)
!2357 = !DILocation(line: 0, scope: !2355)
!2358 = !DILocalVariable(name: "in", arg: 2, scope: !2355, file: !529, line: 56, type: !411)
!2359 = !DILocalVariable(name: "acc", arg: 3, scope: !2355, file: !529, line: 56, type: !52)
!2360 = !DILocalVariable(name: "mask_lsb", scope: !2355, file: !529, line: 58, type: !53)
!2361 = !DILocalVariable(name: "i", scope: !2362, file: !529, line: 59, type: !86)
!2362 = distinct !DILexicalBlock(scope: !2355, file: !529, line: 59, column: 5)
!2363 = !DILocation(line: 0, scope: !2362)
!2364 = !DILocation(line: 60, column: 22, scope: !2365)
!2365 = distinct !DILexicalBlock(scope: !2366, file: !529, line: 59, column: 43)
!2366 = distinct !DILexicalBlock(scope: !2362, file: !529, line: 59, column: 5)
!2367 = !DILocation(line: 60, column: 28, scope: !2365)
!2368 = !DILocalVariable(name: "t", scope: !2365, file: !529, line: 60, type: !53)
!2369 = !DILocation(line: 0, scope: !2365)
!2370 = !DILocation(line: 61, column: 32, scope: !2365)
!2371 = !DILocation(line: 61, column: 43, scope: !2365)
!2372 = !DILocation(line: 61, column: 38, scope: !2365)
!2373 = !DILocation(line: 61, column: 16, scope: !2365)
!2374 = !DILocation(line: 61, column: 9, scope: !2365)
!2375 = !DILocation(line: 63, column: 1, scope: !2355)
!2376 = distinct !DISubprogram(name: "m_vec_mul_add_x", scope: !529, file: !529, line: 46, type: !2288, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2377 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2376, file: !529, line: 46, type: !86)
!2378 = !DILocation(line: 0, scope: !2376)
!2379 = !DILocalVariable(name: "in", arg: 2, scope: !2376, file: !529, line: 46, type: !411)
!2380 = !DILocalVariable(name: "acc", arg: 3, scope: !2376, file: !529, line: 46, type: !52)
!2381 = !DILocalVariable(name: "mask_msb", scope: !2376, file: !529, line: 48, type: !53)
!2382 = !DILocalVariable(name: "i", scope: !2383, file: !529, line: 49, type: !86)
!2383 = distinct !DILexicalBlock(scope: !2376, file: !529, line: 49, column: 5)
!2384 = !DILocation(line: 0, scope: !2383)
!2385 = !DILocation(line: 50, column: 22, scope: !2386)
!2386 = distinct !DILexicalBlock(scope: !2387, file: !529, line: 49, column: 43)
!2387 = distinct !DILexicalBlock(scope: !2383, file: !529, line: 49, column: 5)
!2388 = !DILocalVariable(name: "t", scope: !2386, file: !529, line: 50, type: !53)
!2389 = !DILocation(line: 0, scope: !2386)
!2390 = !DILocation(line: 51, column: 32, scope: !2386)
!2391 = !DILocation(line: 51, column: 44, scope: !2386)
!2392 = !DILocation(line: 51, column: 50, scope: !2386)
!2393 = !DILocation(line: 51, column: 38, scope: !2386)
!2394 = !DILocation(line: 51, column: 16, scope: !2386)
!2395 = !DILocation(line: 51, column: 9, scope: !2386)
!2396 = !DILocation(line: 53, column: 1, scope: !2376)
!2397 = distinct !DISubprogram(name: "m_vec_copy", scope: !529, file: !529, line: 13, type: !2288, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !48, retainedNodes: !71)
!2398 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2397, file: !529, line: 13, type: !86)
!2399 = !DILocation(line: 0, scope: !2397)
!2400 = !DILocalVariable(name: "in", arg: 2, scope: !2397, file: !529, line: 13, type: !411)
!2401 = !DILocalVariable(name: "out", arg: 3, scope: !2397, file: !529, line: 13, type: !52)
!2402 = !DILocalVariable(name: "i", scope: !2403, file: !529, line: 15, type: !58)
!2403 = distinct !DILexicalBlock(scope: !2397, file: !529, line: 15, column: 5)
!2404 = !DILocation(line: 0, scope: !2403)
!2405 = !DILocation(line: 17, column: 18, scope: !2406)
!2406 = distinct !DILexicalBlock(scope: !2407, file: !529, line: 16, column: 5)
!2407 = distinct !DILexicalBlock(scope: !2403, file: !529, line: 15, column: 5)
!2408 = !DILocation(line: 17, column: 16, scope: !2406)
!2409 = !DILocation(line: 17, column: 9, scope: !2406)
!2410 = !DILocation(line: 19, column: 1, scope: !2397)
!2411 = distinct !DISubprogram(name: "pqmayo_MAYO_1_ref_m_upper", scope: !99, file: !99, line: 14, type: !2412, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !71)
!2412 = !DISubroutineType(types: !2413)
!2413 = !{null, !2414, !411, !52, !86}
!2414 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2415, size: 32)
!2415 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2416)
!2416 = !DIDerivedType(tag: DW_TAG_typedef, name: "mayo_params_t", file: !79, line: 289, baseType: !2417)
!2417 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !79, line: 265, size: 736, elements: !2418)
!2418 = !{!2419, !2420, !2421, !2422, !2423, !2424, !2425, !2426, !2427, !2428, !2429, !2430, !2431, !2432, !2433, !2434, !2435, !2436, !2437, !2438, !2439, !2440, !2441}
!2419 = !DIDerivedType(tag: DW_TAG_member, name: "m", scope: !2417, file: !79, line: 266, baseType: !86, size: 32)
!2420 = !DIDerivedType(tag: DW_TAG_member, name: "n", scope: !2417, file: !79, line: 267, baseType: !86, size: 32, offset: 32)
!2421 = !DIDerivedType(tag: DW_TAG_member, name: "o", scope: !2417, file: !79, line: 268, baseType: !86, size: 32, offset: 64)
!2422 = !DIDerivedType(tag: DW_TAG_member, name: "k", scope: !2417, file: !79, line: 269, baseType: !86, size: 32, offset: 96)
!2423 = !DIDerivedType(tag: DW_TAG_member, name: "q", scope: !2417, file: !79, line: 270, baseType: !86, size: 32, offset: 128)
!2424 = !DIDerivedType(tag: DW_TAG_member, name: "f_tail", scope: !2417, file: !79, line: 271, baseType: !90, size: 32, offset: 160)
!2425 = !DIDerivedType(tag: DW_TAG_member, name: "m_bytes", scope: !2417, file: !79, line: 272, baseType: !86, size: 32, offset: 192)
!2426 = !DIDerivedType(tag: DW_TAG_member, name: "O_bytes", scope: !2417, file: !79, line: 273, baseType: !86, size: 32, offset: 224)
!2427 = !DIDerivedType(tag: DW_TAG_member, name: "v_bytes", scope: !2417, file: !79, line: 274, baseType: !86, size: 32, offset: 256)
!2428 = !DIDerivedType(tag: DW_TAG_member, name: "r_bytes", scope: !2417, file: !79, line: 275, baseType: !86, size: 32, offset: 288)
!2429 = !DIDerivedType(tag: DW_TAG_member, name: "R_bytes", scope: !2417, file: !79, line: 276, baseType: !86, size: 32, offset: 320)
!2430 = !DIDerivedType(tag: DW_TAG_member, name: "P1_bytes", scope: !2417, file: !79, line: 277, baseType: !86, size: 32, offset: 352)
!2431 = !DIDerivedType(tag: DW_TAG_member, name: "P2_bytes", scope: !2417, file: !79, line: 278, baseType: !86, size: 32, offset: 384)
!2432 = !DIDerivedType(tag: DW_TAG_member, name: "P3_bytes", scope: !2417, file: !79, line: 279, baseType: !86, size: 32, offset: 416)
!2433 = !DIDerivedType(tag: DW_TAG_member, name: "csk_bytes", scope: !2417, file: !79, line: 280, baseType: !86, size: 32, offset: 448)
!2434 = !DIDerivedType(tag: DW_TAG_member, name: "cpk_bytes", scope: !2417, file: !79, line: 281, baseType: !86, size: 32, offset: 480)
!2435 = !DIDerivedType(tag: DW_TAG_member, name: "sig_bytes", scope: !2417, file: !79, line: 282, baseType: !86, size: 32, offset: 512)
!2436 = !DIDerivedType(tag: DW_TAG_member, name: "salt_bytes", scope: !2417, file: !79, line: 283, baseType: !86, size: 32, offset: 544)
!2437 = !DIDerivedType(tag: DW_TAG_member, name: "sk_seed_bytes", scope: !2417, file: !79, line: 284, baseType: !86, size: 32, offset: 576)
!2438 = !DIDerivedType(tag: DW_TAG_member, name: "digest_bytes", scope: !2417, file: !79, line: 285, baseType: !86, size: 32, offset: 608)
!2439 = !DIDerivedType(tag: DW_TAG_member, name: "pk_seed_bytes", scope: !2417, file: !79, line: 286, baseType: !86, size: 32, offset: 640)
!2440 = !DIDerivedType(tag: DW_TAG_member, name: "m_vec_limbs", scope: !2417, file: !79, line: 287, baseType: !86, size: 32, offset: 672)
!2441 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !2417, file: !79, line: 288, baseType: !149, size: 32, offset: 704)
!2442 = !DILocalVariable(name: "p", arg: 1, scope: !2411, file: !99, line: 14, type: !2414)
!2443 = !DILocation(line: 0, scope: !2411)
!2444 = !DILocalVariable(name: "in", arg: 2, scope: !2411, file: !99, line: 14, type: !411)
!2445 = !DILocalVariable(name: "out", arg: 3, scope: !2411, file: !99, line: 14, type: !52)
!2446 = !DILocalVariable(name: "size", arg: 4, scope: !2411, file: !99, line: 14, type: !86)
!2447 = !DILocalVariable(name: "m_vec_limbs", scope: !2411, file: !99, line: 19, type: !324)
!2448 = !DILocalVariable(name: "m_vecs_stored", scope: !2411, file: !99, line: 20, type: !86)
!2449 = !DILocalVariable(name: "r", scope: !2450, file: !99, line: 21, type: !86)
!2450 = distinct !DILexicalBlock(scope: !2411, file: !99, line: 21, column: 5)
!2451 = !DILocation(line: 0, scope: !2450)
!2452 = !DILocation(line: 21, column: 10, scope: !2450)
!2453 = !DILocation(line: 20, column: 9, scope: !2411)
!2454 = !DILocation(line: 21, scope: !2450)
!2455 = !DILocation(line: 21, column: 23, scope: !2456)
!2456 = distinct !DILexicalBlock(scope: !2450, file: !99, line: 21, column: 5)
!2457 = !DILocation(line: 21, column: 5, scope: !2450)
!2458 = !DILocation(line: 22, column: 9, scope: !2459)
!2459 = distinct !DILexicalBlock(scope: !2460, file: !99, line: 22, column: 9)
!2460 = distinct !DILexicalBlock(scope: !2456, file: !99, line: 21, column: 36)
!2461 = !DILocation(line: 22, scope: !2459)
!2462 = !DILocalVariable(name: "c", scope: !2459, file: !99, line: 22, type: !86)
!2463 = !DILocation(line: 0, scope: !2459)
!2464 = !DILocation(line: 22, column: 27, scope: !2465)
!2465 = distinct !DILexicalBlock(scope: !2459, file: !99, line: 22, column: 9)
!2466 = !DILocation(line: 23, column: 59, scope: !2467)
!2467 = distinct !DILexicalBlock(scope: !2465, file: !99, line: 22, column: 40)
!2468 = !DILocation(line: 23, column: 66, scope: !2467)
!2469 = !DILocation(line: 23, column: 40, scope: !2467)
!2470 = !DILocation(line: 23, column: 76, scope: !2467)
!2471 = !DILocation(line: 23, column: 13, scope: !2467)
!2472 = !DILocation(line: 24, column: 19, scope: !2473)
!2473 = distinct !DILexicalBlock(scope: !2467, file: !99, line: 24, column: 17)
!2474 = !DILocation(line: 25, column: 62, scope: !2475)
!2475 = distinct !DILexicalBlock(scope: !2473, file: !99, line: 24, column: 25)
!2476 = !DILocation(line: 25, column: 69, scope: !2475)
!2477 = !DILocation(line: 25, column: 43, scope: !2475)
!2478 = !DILocation(line: 25, column: 79, scope: !2475)
!2479 = !DILocation(line: 25, column: 17, scope: !2475)
!2480 = !DILocation(line: 26, column: 13, scope: !2475)
!2481 = !DILocation(line: 27, column: 27, scope: !2467)
!2482 = !DILocation(line: 22, column: 36, scope: !2465)
!2483 = !DILocation(line: 22, column: 9, scope: !2465)
!2484 = distinct !{!2484, !2458, !2485, !388}
!2485 = !DILocation(line: 28, column: 9, scope: !2459)
!2486 = !DILocation(line: 21, column: 32, scope: !2456)
!2487 = !DILocation(line: 21, column: 5, scope: !2456)
!2488 = distinct !{!2488, !2457, !2489, !388}
!2489 = !DILocation(line: 29, column: 5, scope: !2450)
!2490 = !DILocation(line: 30, column: 1, scope: !2411)
!2491 = distinct !DISubprogram(name: "m_vec_copy", scope: !529, file: !529, line: 13, type: !2288, scopeLine: 13, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!2492 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2491, file: !529, line: 13, type: !86)
!2493 = !DILocation(line: 0, scope: !2491)
!2494 = !DILocalVariable(name: "in", arg: 2, scope: !2491, file: !529, line: 13, type: !411)
!2495 = !DILocalVariable(name: "out", arg: 3, scope: !2491, file: !529, line: 13, type: !52)
!2496 = !DILocalVariable(name: "i", scope: !2497, file: !529, line: 15, type: !58)
!2497 = distinct !DILexicalBlock(scope: !2491, file: !529, line: 15, column: 5)
!2498 = !DILocation(line: 0, scope: !2497)
!2499 = !DILocation(line: 17, column: 18, scope: !2500)
!2500 = distinct !DILexicalBlock(scope: !2501, file: !529, line: 16, column: 5)
!2501 = distinct !DILexicalBlock(scope: !2497, file: !529, line: 15, column: 5)
!2502 = !DILocation(line: 17, column: 16, scope: !2500)
!2503 = !DILocation(line: 17, column: 9, scope: !2500)
!2504 = !DILocation(line: 19, column: 1, scope: !2491)
!2505 = distinct !DISubprogram(name: "m_vec_add", scope: !529, file: !529, line: 22, type: !2288, scopeLine: 22, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!2506 = !DILocalVariable(name: "m_vec_limbs", arg: 1, scope: !2505, file: !529, line: 22, type: !86)
!2507 = !DILocation(line: 0, scope: !2505)
!2508 = !DILocalVariable(name: "in", arg: 2, scope: !2505, file: !529, line: 22, type: !411)
!2509 = !DILocalVariable(name: "acc", arg: 3, scope: !2505, file: !529, line: 22, type: !52)
!2510 = !DILocalVariable(name: "i", scope: !2511, file: !529, line: 24, type: !58)
!2511 = distinct !DILexicalBlock(scope: !2505, file: !529, line: 24, column: 5)
!2512 = !DILocation(line: 0, scope: !2511)
!2513 = !DILocation(line: 26, column: 19, scope: !2514)
!2514 = distinct !DILexicalBlock(scope: !2515, file: !529, line: 25, column: 5)
!2515 = distinct !DILexicalBlock(scope: !2511, file: !529, line: 24, column: 5)
!2516 = !DILocation(line: 26, column: 16, scope: !2514)
!2517 = !DILocation(line: 26, column: 9, scope: !2514)
!2518 = !DILocation(line: 28, column: 1, scope: !2505)
!2519 = distinct !DISubprogram(name: "pqmayo_MAYO_1_ref_sample_solution", scope: !99, file: !99, line: 40, type: !2520, scopeLine: 42, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !84, retainedNodes: !71)
!2520 = !DISubroutineType(types: !2521)
!2521 = !{!86, !2414, !61, !90, !90, !61, !86, !86, !86, !86}
!2522 = !DILocalVariable(name: "p", arg: 1, scope: !2519, file: !99, line: 40, type: !2414)
!2523 = !DILocation(line: 0, scope: !2519)
!2524 = !DILocalVariable(name: "A", arg: 2, scope: !2519, file: !99, line: 40, type: !61)
!2525 = !DILocalVariable(name: "y", arg: 3, scope: !2519, file: !99, line: 41, type: !90)
!2526 = !DILocalVariable(name: "r", arg: 4, scope: !2519, file: !99, line: 41, type: !90)
!2527 = !DILocalVariable(name: "x", arg: 5, scope: !2519, file: !99, line: 42, type: !61)
!2528 = !DILocalVariable(name: "k", arg: 6, scope: !2519, file: !99, line: 42, type: !86)
!2529 = !DILocalVariable(name: "o", arg: 7, scope: !2519, file: !99, line: 42, type: !86)
!2530 = !DILocalVariable(name: "m", arg: 8, scope: !2519, file: !99, line: 42, type: !86)
!2531 = !DILocalVariable(name: "A_cols", arg: 9, scope: !2519, file: !99, line: 42, type: !86)
!2532 = !DILocalVariable(name: "i", scope: !2533, file: !99, line: 51, type: !86)
!2533 = distinct !DILexicalBlock(scope: !2519, file: !99, line: 51, column: 5)
!2534 = !DILocation(line: 0, scope: !2533)
!2535 = !DILocation(line: 51, column: 10, scope: !2533)
!2536 = !DILocation(line: 51, scope: !2533)
!2537 = !DILocation(line: 51, column: 23, scope: !2538)
!2538 = distinct !DILexicalBlock(scope: !2533, file: !99, line: 51, column: 5)
!2539 = !DILocation(line: 51, column: 5, scope: !2533)
!2540 = !DILocation(line: 57, column: 5, scope: !2541)
!2541 = distinct !DILexicalBlock(scope: !2519, file: !99, line: 57, column: 5)
!2542 = !DILocation(line: 52, column: 16, scope: !2543)
!2543 = distinct !DILexicalBlock(scope: !2538, file: !99, line: 51, column: 37)
!2544 = !DILocation(line: 52, column: 9, scope: !2543)
!2545 = !DILocation(line: 52, column: 14, scope: !2543)
!2546 = !DILocation(line: 51, column: 33, scope: !2538)
!2547 = !DILocation(line: 51, column: 5, scope: !2538)
!2548 = distinct !{!2548, !2539, !2549, !388}
!2549 = !DILocation(line: 53, column: 5, scope: !2533)
!2550 = !DILocation(line: 57, scope: !2541)
!2551 = !DILocalVariable(name: "i", scope: !2541, file: !99, line: 57, type: !86)
!2552 = !DILocation(line: 0, scope: !2541)
!2553 = !DILocation(line: 57, column: 23, scope: !2554)
!2554 = distinct !DILexicalBlock(scope: !2541, file: !99, line: 57, column: 5)
!2555 = !DILocation(line: 58, column: 13, scope: !2556)
!2556 = distinct !DILexicalBlock(scope: !2554, file: !99, line: 57, column: 33)
!2557 = !DILocation(line: 58, column: 26, scope: !2556)
!2558 = !DILocation(line: 58, column: 30, scope: !2556)
!2559 = !DILocation(line: 58, column: 21, scope: !2556)
!2560 = !DILocation(line: 58, column: 9, scope: !2556)
!2561 = !DILocation(line: 58, column: 36, scope: !2556)
!2562 = !DILocation(line: 57, column: 29, scope: !2554)
!2563 = !DILocation(line: 57, column: 5, scope: !2554)
!2564 = distinct !{!2564, !2540, !2565, !388}
!2565 = !DILocation(line: 59, column: 5, scope: !2541)
!2566 = !DILocation(line: 60, column: 25, scope: !2519)
!2567 = !DILocation(line: 60, column: 29, scope: !2519)
!2568 = !DILocation(line: 60, column: 5, scope: !2519)
!2569 = !DILocalVariable(name: "i", scope: !2570, file: !99, line: 63, type: !86)
!2570 = distinct !DILexicalBlock(scope: !2519, file: !99, line: 63, column: 5)
!2571 = !DILocation(line: 0, scope: !2570)
!2572 = !DILocation(line: 63, column: 10, scope: !2570)
!2573 = !DILocation(line: 63, scope: !2570)
!2574 = !DILocation(line: 63, column: 23, scope: !2575)
!2575 = distinct !DILexicalBlock(scope: !2570, file: !99, line: 63, column: 5)
!2576 = !DILocation(line: 63, column: 5, scope: !2570)
!2577 = !DILocation(line: 64, column: 44, scope: !2578)
!2578 = distinct !DILexicalBlock(scope: !2575, file: !99, line: 63, column: 33)
!2579 = !DILocation(line: 64, column: 50, scope: !2578)
!2580 = !DILocation(line: 64, column: 38, scope: !2578)
!2581 = !DILocation(line: 64, column: 13, scope: !2578)
!2582 = !DILocation(line: 64, column: 26, scope: !2578)
!2583 = !DILocation(line: 64, column: 30, scope: !2578)
!2584 = !DILocation(line: 64, column: 21, scope: !2578)
!2585 = !DILocation(line: 64, column: 9, scope: !2578)
!2586 = !DILocation(line: 64, column: 36, scope: !2578)
!2587 = !DILocation(line: 63, column: 29, scope: !2575)
!2588 = !DILocation(line: 63, column: 5, scope: !2575)
!2589 = distinct !{!2589, !2576, !2590, !388}
!2590 = !DILocation(line: 65, column: 5, scope: !2570)
!2591 = !DILocation(line: 67, column: 16, scope: !2519)
!2592 = !DILocation(line: 67, column: 20, scope: !2519)
!2593 = !DILocation(line: 67, column: 5, scope: !2519)
!2594 = !DILocalVariable(name: "full_rank", scope: !2519, file: !99, line: 70, type: !51)
!2595 = !DILocalVariable(name: "i", scope: !2596, file: !99, line: 71, type: !86)
!2596 = distinct !DILexicalBlock(scope: !2519, file: !99, line: 71, column: 5)
!2597 = !DILocation(line: 0, scope: !2596)
!2598 = !DILocation(line: 71, column: 10, scope: !2596)
!2599 = !DILocation(line: 71, scope: !2596)
!2600 = !DILocation(line: 71, column: 23, scope: !2601)
!2601 = distinct !DILexicalBlock(scope: !2596, file: !99, line: 71, column: 5)
!2602 = !DILocation(line: 71, column: 5, scope: !2596)
!2603 = !DILocation(line: 72, column: 27, scope: !2604)
!2604 = distinct !DILexicalBlock(scope: !2601, file: !99, line: 71, column: 42)
!2605 = !DILocation(line: 72, column: 32, scope: !2604)
!2606 = !DILocation(line: 72, column: 22, scope: !2604)
!2607 = !DILocation(line: 72, column: 19, scope: !2604)
!2608 = !DILocation(line: 71, column: 38, scope: !2601)
!2609 = !DILocation(line: 71, column: 5, scope: !2601)
!2610 = distinct !{!2610, !2602, !2611, !388}
!2611 = !DILocation(line: 73, column: 5, scope: !2596)
!2612 = !DILocation(line: 80, column: 19, scope: !2613)
!2613 = distinct !DILexicalBlock(scope: !2519, file: !99, line: 80, column: 9)
!2614 = !DILocation(line: 88, scope: !2615)
!2615 = distinct !DILexicalBlock(scope: !2519, file: !99, line: 88, column: 5)
!2616 = !DILocalVariable(name: "row", scope: !2615, file: !99, line: 88, type: !86)
!2617 = !DILocation(line: 0, scope: !2615)
!2618 = !DILocation(line: 88, column: 31, scope: !2619)
!2619 = distinct !DILexicalBlock(scope: !2615, file: !99, line: 88, column: 5)
!2620 = !DILocation(line: 88, column: 5, scope: !2615)
!2621 = !DILocalVariable(name: "finished", scope: !2519, file: !99, line: 46, type: !51)
!2622 = !DILocation(line: 90, column: 27, scope: !2623)
!2623 = distinct !DILexicalBlock(scope: !2619, file: !99, line: 88, column: 44)
!2624 = !DILocalVariable(name: "col_upper_bound", scope: !2519, file: !99, line: 47, type: !86)
!2625 = !DILocalVariable(name: "col", scope: !2626, file: !99, line: 93, type: !86)
!2626 = distinct !DILexicalBlock(scope: !2623, file: !99, line: 93, column: 9)
!2627 = !DILocation(line: 0, scope: !2626)
!2628 = !DILocation(line: 93, column: 14, scope: !2626)
!2629 = !DILocation(line: 0, scope: !2623)
!2630 = !DILocation(line: 93, scope: !2626)
!2631 = !DILocation(line: 93, column: 33, scope: !2632)
!2632 = distinct !DILexicalBlock(scope: !2626, file: !99, line: 93, column: 9)
!2633 = !DILocation(line: 93, column: 9, scope: !2626)
!2634 = distinct !{!2634, !2620, !2635, !388}
!2635 = !DILocation(line: 122, column: 5, scope: !2615)
!2636 = !DILocation(line: 97, column: 50, scope: !2637)
!2637 = distinct !DILexicalBlock(scope: !2632, file: !99, line: 93, column: 60)
!2638 = !DILocation(line: 97, column: 44, scope: !2637)
!2639 = !DILocation(line: 97, column: 30, scope: !2637)
!2640 = !DILocation(line: 97, column: 73, scope: !2637)
!2641 = !DILocalVariable(name: "correct_column", scope: !2519, file: !99, line: 48, type: !51)
!2642 = !DILocation(line: 99, column: 63, scope: !2637)
!2643 = !DILocation(line: 99, column: 48, scope: !2637)
!2644 = !DILocation(line: 99, column: 46, scope: !2637)
!2645 = !DILocalVariable(name: "u", scope: !2637, file: !99, line: 99, type: !51)
!2646 = !DILocation(line: 0, scope: !2637)
!2647 = !DILocation(line: 100, column: 13, scope: !2637)
!2648 = !DILocation(line: 100, column: 20, scope: !2637)
!2649 = !DILocalVariable(name: "i", scope: !2650, file: !99, line: 102, type: !86)
!2650 = distinct !DILexicalBlock(scope: !2637, file: !99, line: 102, column: 13)
!2651 = !DILocation(line: 0, scope: !2650)
!2652 = !DILocation(line: 102, column: 18, scope: !2650)
!2653 = !DILocation(line: 102, scope: !2650)
!2654 = !DILocation(line: 102, column: 31, scope: !2655)
!2655 = distinct !DILexicalBlock(scope: !2650, file: !99, line: 102, column: 13)
!2656 = !DILocation(line: 102, column: 13, scope: !2650)
!2657 = !DILocation(line: 103, column: 53, scope: !2658)
!2658 = distinct !DILexicalBlock(scope: !2655, file: !99, line: 102, column: 46)
!2659 = !DILocation(line: 103, column: 45, scope: !2658)
!2660 = !DILocation(line: 103, column: 34, scope: !2658)
!2661 = !DILocation(line: 103, column: 95, scope: !2658)
!2662 = !DILocation(line: 103, column: 99, scope: !2658)
!2663 = !DILocation(line: 103, column: 91, scope: !2658)
!2664 = !DILocation(line: 103, column: 80, scope: !2658)
!2665 = !DILocation(line: 103, column: 115, scope: !2658)
!2666 = !DILocation(line: 103, column: 76, scope: !2658)
!2667 = !DILocation(line: 104, column: 49, scope: !2658)
!2668 = !DILocation(line: 104, column: 53, scope: !2658)
!2669 = !DILocation(line: 104, column: 45, scope: !2658)
!2670 = !DILocation(line: 104, column: 34, scope: !2658)
!2671 = !DILocation(line: 104, column: 69, scope: !2658)
!2672 = !DILocation(line: 104, column: 30, scope: !2658)
!2673 = !DILocation(line: 104, column: 95, scope: !2658)
!2674 = !DILocation(line: 104, column: 99, scope: !2658)
!2675 = !DILocation(line: 104, column: 91, scope: !2658)
!2676 = !DILocation(line: 104, column: 80, scope: !2658)
!2677 = !DILocation(line: 104, column: 115, scope: !2658)
!2678 = !DILocation(line: 104, column: 76, scope: !2658)
!2679 = !DILocation(line: 105, column: 49, scope: !2658)
!2680 = !DILocation(line: 105, column: 53, scope: !2658)
!2681 = !DILocation(line: 105, column: 45, scope: !2658)
!2682 = !DILocation(line: 105, column: 34, scope: !2658)
!2683 = !DILocation(line: 105, column: 69, scope: !2658)
!2684 = !DILocation(line: 105, column: 30, scope: !2658)
!2685 = !DILocation(line: 105, column: 95, scope: !2658)
!2686 = !DILocation(line: 105, column: 99, scope: !2658)
!2687 = !DILocation(line: 105, column: 91, scope: !2658)
!2688 = !DILocation(line: 105, column: 80, scope: !2658)
!2689 = !DILocation(line: 105, column: 115, scope: !2658)
!2690 = !DILocation(line: 105, column: 76, scope: !2658)
!2691 = !DILocation(line: 106, column: 49, scope: !2658)
!2692 = !DILocation(line: 106, column: 53, scope: !2658)
!2693 = !DILocation(line: 106, column: 45, scope: !2658)
!2694 = !DILocation(line: 106, column: 34, scope: !2658)
!2695 = !DILocation(line: 106, column: 69, scope: !2658)
!2696 = !DILocation(line: 106, column: 30, scope: !2658)
!2697 = !DILocation(line: 106, column: 95, scope: !2658)
!2698 = !DILocation(line: 106, column: 99, scope: !2658)
!2699 = !DILocation(line: 106, column: 91, scope: !2658)
!2700 = !DILocation(line: 106, column: 80, scope: !2658)
!2701 = !DILocation(line: 106, column: 115, scope: !2658)
!2702 = !DILocation(line: 106, column: 76, scope: !2658)
!2703 = !DILocalVariable(name: "tmp", scope: !2658, file: !99, line: 103, type: !53)
!2704 = !DILocation(line: 0, scope: !2658)
!2705 = !DILocation(line: 108, column: 23, scope: !2658)
!2706 = !DILocation(line: 110, column: 34, scope: !2658)
!2707 = !DILocation(line: 110, column: 17, scope: !2658)
!2708 = !DILocation(line: 110, column: 48, scope: !2658)
!2709 = !DILocation(line: 111, column: 56, scope: !2658)
!2710 = !DILocation(line: 111, column: 34, scope: !2658)
!2711 = !DILocation(line: 111, column: 17, scope: !2658)
!2712 = !DILocation(line: 111, column: 48, scope: !2658)
!2713 = !DILocation(line: 112, column: 56, scope: !2658)
!2714 = !DILocation(line: 112, column: 34, scope: !2658)
!2715 = !DILocation(line: 112, column: 17, scope: !2658)
!2716 = !DILocation(line: 112, column: 48, scope: !2658)
!2717 = !DILocation(line: 113, column: 56, scope: !2658)
!2718 = !DILocation(line: 113, column: 34, scope: !2658)
!2719 = !DILocation(line: 113, column: 17, scope: !2658)
!2720 = !DILocation(line: 113, column: 48, scope: !2658)
!2721 = !DILocation(line: 114, column: 56, scope: !2658)
!2722 = !DILocation(line: 114, column: 34, scope: !2658)
!2723 = !DILocation(line: 114, column: 17, scope: !2658)
!2724 = !DILocation(line: 114, column: 48, scope: !2658)
!2725 = !DILocation(line: 115, column: 56, scope: !2658)
!2726 = !DILocation(line: 115, column: 34, scope: !2658)
!2727 = !DILocation(line: 115, column: 17, scope: !2658)
!2728 = !DILocation(line: 115, column: 48, scope: !2658)
!2729 = !DILocation(line: 116, column: 56, scope: !2658)
!2730 = !DILocation(line: 116, column: 34, scope: !2658)
!2731 = !DILocation(line: 116, column: 17, scope: !2658)
!2732 = !DILocation(line: 116, column: 48, scope: !2658)
!2733 = !DILocation(line: 117, column: 56, scope: !2658)
!2734 = !DILocation(line: 117, column: 34, scope: !2658)
!2735 = !DILocation(line: 117, column: 17, scope: !2658)
!2736 = !DILocation(line: 117, column: 48, scope: !2658)
!2737 = !DILocation(line: 102, column: 40, scope: !2655)
!2738 = !DILocation(line: 102, column: 13, scope: !2655)
!2739 = distinct !{!2739, !2656, !2740, !388}
!2740 = !DILocation(line: 118, column: 13, scope: !2650)
!2741 = !DILocation(line: 120, column: 33, scope: !2637)
!2742 = !DILocation(line: 93, column: 56, scope: !2632)
!2743 = !DILocation(line: 93, column: 9, scope: !2632)
!2744 = distinct !{!2744, !2633, !2745, !388}
!2745 = !DILocation(line: 121, column: 9, scope: !2626)
!2746 = !DILocation(line: 124, column: 1, scope: !2519)
!2747 = distinct !DISubprogram(name: "mat_mul", scope: !577, file: !577, line: 79, type: !1464, scopeLine: 80, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!2748 = !DILocalVariable(name: "a", arg: 1, scope: !2747, file: !577, line: 79, type: !90)
!2749 = !DILocation(line: 0, scope: !2747)
!2750 = !DILocalVariable(name: "b", arg: 2, scope: !2747, file: !577, line: 79, type: !90)
!2751 = !DILocalVariable(name: "c", arg: 3, scope: !2747, file: !577, line: 80, type: !61)
!2752 = !DILocalVariable(name: "colrow_ab", arg: 4, scope: !2747, file: !577, line: 80, type: !86)
!2753 = !DILocalVariable(name: "row_a", arg: 5, scope: !2747, file: !577, line: 80, type: !86)
!2754 = !DILocalVariable(name: "col_b", arg: 6, scope: !2747, file: !577, line: 80, type: !86)
!2755 = !DILocalVariable(name: "i", scope: !2756, file: !577, line: 81, type: !86)
!2756 = distinct !DILexicalBlock(scope: !2747, file: !577, line: 81, column: 5)
!2757 = !DILocation(line: 0, scope: !2756)
!2758 = !DILocation(line: 81, column: 10, scope: !2756)
!2759 = !DILocation(line: 81, scope: !2756)
!2760 = !DILocation(line: 81, column: 23, scope: !2761)
!2761 = distinct !DILexicalBlock(scope: !2756, file: !577, line: 81, column: 5)
!2762 = !DILocation(line: 81, column: 5, scope: !2756)
!2763 = !DILocation(line: 82, scope: !2764)
!2764 = distinct !DILexicalBlock(scope: !2765, file: !577, line: 82, column: 9)
!2765 = distinct !DILexicalBlock(scope: !2761, file: !577, line: 81, column: 53)
!2766 = !DILocalVariable(name: "j", scope: !2764, file: !577, line: 82, type: !86)
!2767 = !DILocation(line: 0, scope: !2764)
!2768 = !DILocation(line: 82, column: 27, scope: !2769)
!2769 = distinct !DILexicalBlock(scope: !2764, file: !577, line: 82, column: 9)
!2770 = !DILocation(line: 82, column: 9, scope: !2764)
!2771 = !DILocation(line: 83, column: 31, scope: !2772)
!2772 = distinct !DILexicalBlock(scope: !2769, file: !577, line: 82, column: 46)
!2773 = !DILocation(line: 83, column: 18, scope: !2772)
!2774 = !DILocation(line: 83, column: 16, scope: !2772)
!2775 = !DILocation(line: 82, column: 36, scope: !2769)
!2776 = !DILocation(line: 82, column: 41, scope: !2769)
!2777 = !DILocation(line: 82, column: 9, scope: !2769)
!2778 = distinct !{!2778, !2770, !2779, !388}
!2779 = !DILocation(line: 84, column: 9, scope: !2764)
!2780 = !DILocation(line: 81, column: 32, scope: !2761)
!2781 = !DILocation(line: 81, column: 39, scope: !2761)
!2782 = !DILocation(line: 81, column: 5, scope: !2761)
!2783 = distinct !{!2783, !2762, !2784, !388}
!2784 = !DILocation(line: 85, column: 5, scope: !2756)
!2785 = !DILocation(line: 86, column: 18, scope: !2747)
!2786 = !DILocation(line: 86, column: 5, scope: !2747)
!2787 = !DILocation(line: 87, column: 1, scope: !2747)
!2788 = distinct !DISubprogram(name: "sub_f", scope: !577, file: !577, line: 48, type: !1589, scopeLine: 48, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!2789 = !DILocalVariable(name: "a", arg: 1, scope: !2788, file: !577, line: 48, type: !51)
!2790 = !DILocation(line: 0, scope: !2788)
!2791 = !DILocalVariable(name: "b", arg: 2, scope: !2788, file: !577, line: 48, type: !51)
!2792 = !DILocation(line: 49, column: 14, scope: !2788)
!2793 = !DILocation(line: 49, column: 5, scope: !2788)
!2794 = distinct !DISubprogram(name: "EF", scope: !2795, file: !2795, line: 60, type: !2796, scopeLine: 60, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!2795 = !DIFile(filename: "../../../src/generic/echelon_form.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!2796 = !DISubroutineType(types: !2797)
!2797 = !{null, !61, !86, !86}
!2798 = !DILocalVariable(name: "A", arg: 1, scope: !2794, file: !2795, line: 60, type: !61)
!2799 = !DILocation(line: 0, scope: !2794)
!2800 = !DILocalVariable(name: "nrows", arg: 2, scope: !2794, file: !2795, line: 60, type: !86)
!2801 = !DILocalVariable(name: "ncols", arg: 3, scope: !2794, file: !2795, line: 60, type: !86)
!2802 = !DILocalVariable(name: "_pivot_row", scope: !2794, file: !2795, line: 62, type: !2803, align: 256)
!2803 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 384, elements: !17)
!2804 = !DILocation(line: 62, column: 27, scope: !2794)
!2805 = !DILocalVariable(name: "_pivot_row2", scope: !2794, file: !2795, line: 63, type: !2803, align: 256)
!2806 = !DILocation(line: 63, column: 27, scope: !2794)
!2807 = !DILocalVariable(name: "packed_A", scope: !2794, file: !2795, line: 64, type: !2808, align: 256)
!2808 = !DICompositeType(tag: DW_TAG_array_type, baseType: !53, size: 29952, elements: !2809)
!2809 = !{!2810}
!2810 = !DISubrange(count: 468)
!2811 = !DILocation(line: 64, column: 27, scope: !2794)
!2812 = !DILocation(line: 66, column: 26, scope: !2794)
!2813 = !DILocation(line: 66, column: 32, scope: !2794)
!2814 = !DILocalVariable(name: "row_len", scope: !2794, file: !2795, line: 66, type: !86)
!2815 = !DILocalVariable(name: "i", scope: !2816, file: !2795, line: 69, type: !86)
!2816 = distinct !DILexicalBlock(scope: !2794, file: !2795, line: 69, column: 5)
!2817 = !DILocation(line: 0, scope: !2816)
!2818 = !DILocation(line: 69, column: 10, scope: !2816)
!2819 = !DILocation(line: 69, scope: !2816)
!2820 = !DILocation(line: 69, column: 23, scope: !2821)
!2821 = distinct !DILexicalBlock(scope: !2816, file: !2795, line: 69, column: 5)
!2822 = !DILocation(line: 69, column: 5, scope: !2816)
!2823 = !DILocation(line: 77, column: 5, scope: !2824)
!2824 = distinct !DILexicalBlock(scope: !2794, file: !2795, line: 77, column: 5)
!2825 = !DILocation(line: 70, column: 29, scope: !2826)
!2826 = distinct !DILexicalBlock(scope: !2821, file: !2795, line: 69, column: 37)
!2827 = !DILocation(line: 70, column: 25, scope: !2826)
!2828 = !DILocation(line: 70, column: 51, scope: !2826)
!2829 = !DILocation(line: 70, column: 47, scope: !2826)
!2830 = !DILocation(line: 70, column: 9, scope: !2826)
!2831 = !DILocation(line: 69, column: 33, scope: !2821)
!2832 = !DILocation(line: 69, column: 5, scope: !2821)
!2833 = distinct !{!2833, !2822, !2834, !388}
!2834 = !DILocation(line: 71, column: 5, scope: !2816)
!2835 = !DILocation(line: 77, scope: !2824)
!2836 = !DILocalVariable(name: "pivot_row", scope: !2794, file: !2795, line: 76, type: !86)
!2837 = !DILocalVariable(name: "pivot_col", scope: !2824, file: !2795, line: 77, type: !86)
!2838 = !DILocation(line: 0, scope: !2824)
!2839 = !DILocation(line: 77, column: 39, scope: !2840)
!2840 = distinct !DILexicalBlock(scope: !2824, file: !2795, line: 77, column: 5)
!2841 = !DILocation(line: 79, column: 37, scope: !2842)
!2842 = distinct !DILexicalBlock(scope: !2840, file: !2795, line: 77, column: 61)
!2843 = !DILocalVariable(name: "pivot_row_lower_bound", scope: !2842, file: !2795, line: 79, type: !86)
!2844 = !DILocation(line: 0, scope: !2842)
!2845 = !DILocation(line: 80, column: 37, scope: !2842)
!2846 = !DILocalVariable(name: "pivot_row_upper_bound", scope: !2842, file: !2795, line: 80, type: !86)
!2847 = !DILocalVariable(name: "i", scope: !2848, file: !2795, line: 85, type: !86)
!2848 = distinct !DILexicalBlock(scope: !2842, file: !2795, line: 85, column: 9)
!2849 = !DILocation(line: 0, scope: !2848)
!2850 = !DILocation(line: 85, column: 14, scope: !2848)
!2851 = !DILocation(line: 85, scope: !2848)
!2852 = !DILocation(line: 85, column: 27, scope: !2853)
!2853 = distinct !DILexicalBlock(scope: !2848, file: !2795, line: 85, column: 9)
!2854 = !DILocation(line: 85, column: 9, scope: !2848)
!2855 = !DILocation(line: 93, column: 9, scope: !2856)
!2856 = distinct !DILexicalBlock(scope: !2842, file: !2795, line: 93, column: 9)
!2857 = !DILocation(line: 86, column: 13, scope: !2858)
!2858 = distinct !DILexicalBlock(scope: !2853, file: !2795, line: 85, column: 43)
!2859 = !DILocation(line: 86, column: 27, scope: !2858)
!2860 = !DILocation(line: 87, column: 13, scope: !2858)
!2861 = !DILocation(line: 87, column: 28, scope: !2858)
!2862 = !DILocation(line: 85, column: 39, scope: !2853)
!2863 = !DILocation(line: 85, column: 9, scope: !2853)
!2864 = distinct !{!2864, !2854, !2865, !388}
!2865 = !DILocation(line: 88, column: 9, scope: !2848)
!2866 = !DILocation(line: 0, scope: !2856)
!2867 = !DILocalVariable(name: "row", scope: !2856, file: !2795, line: 93, type: !86)
!2868 = !DILocalVariable(name: "pivot", scope: !2842, file: !2795, line: 91, type: !51)
!2869 = !DILocalVariable(name: "pivot_is_zero", scope: !2842, file: !2795, line: 92, type: !53)
!2870 = !DILocation(line: 94, column: 24, scope: !2871)
!2871 = distinct !DILexicalBlock(scope: !2856, file: !2795, line: 93, column: 9)
!2872 = !DILocation(line: 94, column: 21, scope: !2871)
!2873 = !DILocation(line: 96, column: 38, scope: !2874)
!2874 = distinct !DILexicalBlock(scope: !2871, file: !2795, line: 94, column: 80)
!2875 = !DILocation(line: 96, column: 37, scope: !2874)
!2876 = !DILocalVariable(name: "is_pivot_row", scope: !2874, file: !2795, line: 96, type: !53)
!2877 = !DILocation(line: 0, scope: !2874)
!2878 = !DILocation(line: 97, column: 40, scope: !2874)
!2879 = !DILocalVariable(name: "below_pivot_row", scope: !2874, file: !2795, line: 97, type: !53)
!2880 = !DILocalVariable(name: "j", scope: !2881, file: !2795, line: 99, type: !86)
!2881 = distinct !DILexicalBlock(scope: !2874, file: !2795, line: 99, column: 13)
!2882 = !DILocation(line: 0, scope: !2881)
!2883 = !DILocation(line: 99, column: 18, scope: !2881)
!2884 = !DILocation(line: 99, scope: !2881)
!2885 = !DILocation(line: 99, column: 31, scope: !2886)
!2886 = distinct !DILexicalBlock(scope: !2881, file: !2795, line: 99, column: 13)
!2887 = !DILocation(line: 99, column: 13, scope: !2881)
!2888 = !DILocation(line: 100, column: 67, scope: !2889)
!2889 = distinct !DILexicalBlock(scope: !2886, file: !2795, line: 99, column: 47)
!2890 = !DILocation(line: 100, column: 48, scope: !2889)
!2891 = !DILocation(line: 101, column: 47, scope: !2889)
!2892 = !DILocation(line: 101, column: 57, scope: !2889)
!2893 = !DILocation(line: 101, column: 34, scope: !2889)
!2894 = !DILocation(line: 100, column: 85, scope: !2889)
!2895 = !DILocation(line: 100, column: 17, scope: !2889)
!2896 = !DILocation(line: 100, column: 31, scope: !2889)
!2897 = !DILocation(line: 99, column: 43, scope: !2886)
!2898 = !DILocation(line: 99, column: 13, scope: !2886)
!2899 = distinct !{!2899, !2887, !2900, !388}
!2900 = !DILocation(line: 102, column: 13, scope: !2881)
!2901 = !DILocation(line: 103, column: 21, scope: !2874)
!2902 = !DILocation(line: 104, column: 44, scope: !2874)
!2903 = !DILocation(line: 104, column: 30, scope: !2874)
!2904 = !DILocation(line: 104, column: 29, scope: !2874)
!2905 = !DILocation(line: 94, column: 76, scope: !2871)
!2906 = !DILocation(line: 93, column: 9, scope: !2871)
!2907 = distinct !{!2907, !2855, !2908, !388}
!2908 = !DILocation(line: 105, column: 9, scope: !2856)
!2909 = !DILocation(line: 108, column: 19, scope: !2842)
!2910 = !DILocalVariable(name: "inverse", scope: !2794, file: !2795, line: 75, type: !51)
!2911 = !DILocation(line: 109, column: 9, scope: !2842)
!2912 = !DILocalVariable(name: "row", scope: !2913, file: !2795, line: 113, type: !86)
!2913 = distinct !DILexicalBlock(scope: !2842, file: !2795, line: 113, column: 9)
!2914 = !DILocation(line: 0, scope: !2913)
!2915 = !DILocation(line: 113, column: 14, scope: !2913)
!2916 = !DILocation(line: 113, scope: !2913)
!2917 = !DILocation(line: 113, column: 51, scope: !2918)
!2918 = distinct !DILexicalBlock(scope: !2913, file: !2795, line: 113, column: 9)
!2919 = !DILocation(line: 113, column: 9, scope: !2913)
!2920 = !DILocation(line: 114, column: 33, scope: !2921)
!2921 = distinct !DILexicalBlock(scope: !2918, file: !2795, line: 113, column: 84)
!2922 = !DILocation(line: 114, column: 63, scope: !2921)
!2923 = !DILocalVariable(name: "do_copy", scope: !2921, file: !2795, line: 114, type: !53)
!2924 = !DILocation(line: 0, scope: !2921)
!2925 = !DILocalVariable(name: "do_not_copy", scope: !2921, file: !2795, line: 115, type: !53)
!2926 = !DILocalVariable(name: "col", scope: !2927, file: !2795, line: 116, type: !86)
!2927 = distinct !DILexicalBlock(scope: !2921, file: !2795, line: 116, column: 13)
!2928 = !DILocation(line: 0, scope: !2927)
!2929 = !DILocation(line: 116, column: 18, scope: !2927)
!2930 = !DILocation(line: 116, scope: !2927)
!2931 = !DILocation(line: 116, column: 35, scope: !2932)
!2932 = distinct !DILexicalBlock(scope: !2927, file: !2795, line: 116, column: 13)
!2933 = !DILocation(line: 116, column: 13, scope: !2927)
!2934 = !DILocation(line: 118, column: 49, scope: !2935)
!2935 = distinct !DILexicalBlock(scope: !2932, file: !2795, line: 116, column: 53)
!2936 = !DILocation(line: 118, column: 59, scope: !2935)
!2937 = !DILocation(line: 118, column: 36, scope: !2935)
!2938 = !DILocation(line: 118, column: 34, scope: !2935)
!2939 = !DILocation(line: 119, column: 32, scope: !2935)
!2940 = !DILocation(line: 119, column: 30, scope: !2935)
!2941 = !DILocation(line: 118, column: 67, scope: !2935)
!2942 = !DILocation(line: 117, column: 30, scope: !2935)
!2943 = !DILocation(line: 117, column: 40, scope: !2935)
!2944 = !DILocation(line: 117, column: 17, scope: !2935)
!2945 = !DILocation(line: 117, column: 47, scope: !2935)
!2946 = !DILocation(line: 116, column: 49, scope: !2932)
!2947 = !DILocation(line: 116, column: 13, scope: !2932)
!2948 = distinct !{!2948, !2933, !2949, !388}
!2949 = !DILocation(line: 120, column: 13, scope: !2927)
!2950 = !DILocation(line: 113, column: 80, scope: !2918)
!2951 = !DILocation(line: 113, column: 9, scope: !2918)
!2952 = distinct !{!2952, !2919, !2953, !388}
!2953 = !DILocation(line: 121, column: 9, scope: !2913)
!2954 = !DILocation(line: 124, scope: !2955)
!2955 = distinct !DILexicalBlock(scope: !2842, file: !2795, line: 124, column: 9)
!2956 = !DILocalVariable(name: "row", scope: !2955, file: !2795, line: 124, type: !86)
!2957 = !DILocation(line: 0, scope: !2955)
!2958 = !DILocation(line: 124, column: 51, scope: !2959)
!2959 = distinct !DILexicalBlock(scope: !2955, file: !2795, line: 124, column: 9)
!2960 = !DILocation(line: 124, column: 9, scope: !2955)
!2961 = !DILocation(line: 125, column: 46, scope: !2962)
!2962 = distinct !DILexicalBlock(scope: !2959, file: !2795, line: 124, column: 67)
!2963 = !DILocalVariable(name: "below_pivot", scope: !2962, file: !2795, line: 125, type: !51)
!2964 = !DILocation(line: 0, scope: !2962)
!2965 = !DILocation(line: 126, column: 74, scope: !2962)
!2966 = !DILocation(line: 126, column: 68, scope: !2962)
!2967 = !DILocation(line: 126, column: 41, scope: !2962)
!2968 = !DILocalVariable(name: "elt_to_elim", scope: !2962, file: !2795, line: 126, type: !51)
!2969 = !DILocation(line: 128, column: 63, scope: !2962)
!2970 = !DILocation(line: 129, column: 52, scope: !2962)
!2971 = !DILocation(line: 129, column: 46, scope: !2962)
!2972 = !DILocation(line: 128, column: 13, scope: !2962)
!2973 = !DILocation(line: 124, column: 63, scope: !2959)
!2974 = !DILocation(line: 124, column: 9, scope: !2959)
!2975 = distinct !{!2975, !2960, !2976, !388}
!2976 = !DILocation(line: 130, column: 9, scope: !2955)
!2977 = !DILocation(line: 132, column: 19, scope: !2842)
!2978 = !DILocation(line: 77, column: 57, scope: !2840)
!2979 = !DILocation(line: 77, column: 5, scope: !2840)
!2980 = distinct !{!2980, !2823, !2981, !388}
!2981 = !DILocation(line: 133, column: 5, scope: !2824)
!2982 = !DILocation(line: 138, scope: !2983)
!2983 = distinct !DILexicalBlock(scope: !2794, file: !2795, line: 138, column: 5)
!2984 = !DILocalVariable(name: "i", scope: !2983, file: !2795, line: 138, type: !86)
!2985 = !DILocation(line: 0, scope: !2983)
!2986 = !DILocation(line: 138, column: 23, scope: !2987)
!2987 = distinct !DILexicalBlock(scope: !2983, file: !2795, line: 138, column: 5)
!2988 = !DILocation(line: 138, column: 5, scope: !2983)
!2989 = !DILocation(line: 139, column: 47, scope: !2990)
!2990 = distinct !DILexicalBlock(scope: !2987, file: !2795, line: 138, column: 37)
!2991 = !DILocation(line: 139, column: 43, scope: !2990)
!2992 = !DILocation(line: 139, column: 9, scope: !2990)
!2993 = !DILocalVariable(name: "j", scope: !2994, file: !2795, line: 140, type: !86)
!2994 = distinct !DILexicalBlock(scope: !2990, file: !2795, line: 140, column: 9)
!2995 = !DILocation(line: 0, scope: !2994)
!2996 = !DILocation(line: 140, column: 14, scope: !2994)
!2997 = !DILocation(line: 140, scope: !2994)
!2998 = !DILocation(line: 140, column: 27, scope: !2999)
!2999 = distinct !DILexicalBlock(scope: !2994, file: !2795, line: 140, column: 9)
!3000 = !DILocation(line: 140, column: 9, scope: !2994)
!3001 = !DILocation(line: 141, column: 32, scope: !3002)
!3002 = distinct !DILexicalBlock(scope: !2999, file: !2795, line: 140, column: 41)
!3003 = !DILocation(line: 141, column: 17, scope: !3002)
!3004 = !DILocation(line: 141, column: 13, scope: !3002)
!3005 = !DILocation(line: 141, column: 30, scope: !3002)
!3006 = !DILocation(line: 140, column: 37, scope: !2999)
!3007 = !DILocation(line: 140, column: 9, scope: !2999)
!3008 = distinct !{!3008, !3000, !3009, !388}
!3009 = !DILocation(line: 142, column: 9, scope: !2994)
!3010 = !DILocation(line: 138, column: 33, scope: !2987)
!3011 = !DILocation(line: 138, column: 5, scope: !2987)
!3012 = distinct !{!3012, !2988, !3013, !388}
!3013 = !DILocation(line: 143, column: 5, scope: !2983)
!3014 = !DILocation(line: 145, column: 5, scope: !2794)
!3015 = !DILocation(line: 146, column: 5, scope: !2794)
!3016 = !DILocation(line: 147, column: 5, scope: !2794)
!3017 = !DILocation(line: 148, column: 5, scope: !2794)
!3018 = !DILocation(line: 149, column: 1, scope: !2794)
!3019 = distinct !DISubprogram(name: "ct_compare_8", scope: !3020, file: !3020, line: 51, type: !1589, scopeLine: 51, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3020 = !DIFile(filename: "../../../src/arithmetic.h", directory: "/home/siddhesh/Desktop/MAYO-LLVM/llvm-apps/mayo_pass/build")
!3021 = !DILocalVariable(name: "a", arg: 1, scope: !3019, file: !3020, line: 51, type: !51)
!3022 = !DILocation(line: 0, scope: !3019)
!3023 = !DILocalVariable(name: "b", arg: 2, scope: !3019, file: !3020, line: 51, type: !51)
!3024 = !DILocation(line: 52, column: 42, scope: !3019)
!3025 = !DILocation(line: 52, column: 13, scope: !3019)
!3026 = !DILocation(line: 52, column: 71, scope: !3019)
!3027 = !DILocation(line: 52, column: 69, scope: !3019)
!3028 = !DILocation(line: 52, column: 5, scope: !3019)
!3029 = distinct !DISubprogram(name: "mul_fx8", scope: !577, file: !577, line: 28, type: !3030, scopeLine: 28, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3030 = !DISubroutineType(types: !3031)
!3031 = !{!53, !51, !53}
!3032 = !DILocalVariable(name: "a", arg: 1, scope: !3029, file: !577, line: 28, type: !51)
!3033 = !DILocation(line: 0, scope: !3029)
!3034 = !DILocalVariable(name: "b", arg: 2, scope: !3029, file: !577, line: 28, type: !53)
!3035 = !DILocation(line: 31, column: 13, scope: !3029)
!3036 = !DILocation(line: 31, column: 10, scope: !3029)
!3037 = !DILocation(line: 31, column: 17, scope: !3029)
!3038 = !DILocalVariable(name: "p", scope: !3029, file: !577, line: 30, type: !53)
!3039 = !DILocation(line: 32, column: 13, scope: !3029)
!3040 = !DILocation(line: 32, column: 10, scope: !3029)
!3041 = !DILocation(line: 32, column: 17, scope: !3029)
!3042 = !DILocation(line: 32, column: 7, scope: !3029)
!3043 = !DILocation(line: 33, column: 13, scope: !3029)
!3044 = !DILocation(line: 33, column: 10, scope: !3029)
!3045 = !DILocation(line: 33, column: 17, scope: !3029)
!3046 = !DILocation(line: 33, column: 7, scope: !3029)
!3047 = !DILocation(line: 34, column: 13, scope: !3029)
!3048 = !DILocation(line: 34, column: 10, scope: !3029)
!3049 = !DILocation(line: 34, column: 17, scope: !3029)
!3050 = !DILocation(line: 34, column: 7, scope: !3029)
!3051 = !DILocalVariable(name: "top_p", scope: !3029, file: !577, line: 37, type: !53)
!3052 = !DILocation(line: 38, column: 32, scope: !3029)
!3053 = !DILocation(line: 38, column: 47, scope: !3029)
!3054 = !DILocation(line: 38, column: 38, scope: !3029)
!3055 = !DILocation(line: 38, column: 54, scope: !3029)
!3056 = !DILocalVariable(name: "out", scope: !3029, file: !577, line: 38, type: !53)
!3057 = !DILocation(line: 39, column: 5, scope: !3029)
!3058 = distinct !DISubprogram(name: "ef_pack_m_vec", scope: !2795, file: !2795, line: 24, type: !3059, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3059 = !DISubroutineType(types: !3060)
!3060 = !{null, !90, !52, !86}
!3061 = !DILocalVariable(name: "in", arg: 1, scope: !3058, file: !2795, line: 24, type: !90)
!3062 = !DILocation(line: 0, scope: !3058)
!3063 = !DILocalVariable(name: "out", arg: 2, scope: !3058, file: !2795, line: 24, type: !52)
!3064 = !DILocalVariable(name: "ncols", arg: 3, scope: !3058, file: !2795, line: 24, type: !86)
!3065 = !DILocalVariable(name: "out8", scope: !3058, file: !2795, line: 26, type: !61)
!3066 = !DILocalVariable(name: "i", scope: !3058, file: !2795, line: 25, type: !86)
!3067 = !DILocation(line: 27, column: 9, scope: !3068)
!3068 = distinct !DILexicalBlock(scope: !3058, file: !2795, line: 27, column: 5)
!3069 = !DILocation(line: 27, scope: !3068)
!3070 = !DILocation(line: 27, column: 17, scope: !3071)
!3071 = distinct !DILexicalBlock(scope: !3068, file: !2795, line: 27, column: 5)
!3072 = !DILocation(line: 27, column: 20, scope: !3071)
!3073 = !DILocation(line: 27, column: 5, scope: !3068)
!3074 = !DILocation(line: 31, column: 23, scope: !3075)
!3075 = distinct !DILexicalBlock(scope: !3071, file: !2795, line: 27, column: 36)
!3076 = !DILocation(line: 31, column: 44, scope: !3075)
!3077 = !DILocation(line: 31, column: 40, scope: !3075)
!3078 = !DILocation(line: 31, column: 48, scope: !3075)
!3079 = !DILocation(line: 31, column: 37, scope: !3075)
!3080 = !DILocation(line: 31, column: 15, scope: !3075)
!3081 = !DILocation(line: 31, column: 9, scope: !3075)
!3082 = !DILocation(line: 31, column: 20, scope: !3075)
!3083 = !DILocation(line: 27, column: 31, scope: !3071)
!3084 = !DILocation(line: 27, column: 5, scope: !3071)
!3085 = distinct !{!3085, !3073, !3086, !388}
!3086 = !DILocation(line: 33, column: 5, scope: !3068)
!3087 = !DILocation(line: 34, column: 19, scope: !3088)
!3088 = distinct !DILexicalBlock(scope: !3058, file: !2795, line: 34, column: 9)
!3089 = !DILocation(line: 38, column: 23, scope: !3090)
!3090 = distinct !DILexicalBlock(scope: !3088, file: !2795, line: 34, column: 24)
!3091 = !DILocation(line: 38, column: 15, scope: !3090)
!3092 = !DILocation(line: 38, column: 9, scope: !3090)
!3093 = !DILocation(line: 38, column: 20, scope: !3090)
!3094 = !DILocation(line: 40, column: 5, scope: !3090)
!3095 = !DILocation(line: 41, column: 1, scope: !3058)
!3096 = distinct !DISubprogram(name: "ct_compare_64", scope: !3020, file: !3020, line: 46, type: !3097, scopeLine: 46, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3097 = !DISubroutineType(types: !3098)
!3098 = !{!53, !86, !86}
!3099 = !DILocalVariable(name: "a", arg: 1, scope: !3096, file: !3020, line: 46, type: !86)
!3100 = !DILocation(line: 0, scope: !3096)
!3101 = !DILocalVariable(name: "b", arg: 2, scope: !3096, file: !3020, line: 46, type: !86)
!3102 = !DILocation(line: 47, column: 38, scope: !3096)
!3103 = !DILocation(line: 47, column: 44, scope: !3096)
!3104 = !DILocation(line: 47, column: 73, scope: !3096)
!3105 = !DILocation(line: 47, column: 71, scope: !3096)
!3106 = !DILocation(line: 47, column: 5, scope: !3096)
!3107 = distinct !DISubprogram(name: "ct_64_is_greater_than", scope: !3020, file: !3020, line: 35, type: !3097, scopeLine: 35, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3108 = !DILocalVariable(name: "a", arg: 1, scope: !3107, file: !3020, line: 35, type: !86)
!3109 = !DILocation(line: 0, scope: !3107)
!3110 = !DILocalVariable(name: "b", arg: 2, scope: !3107, file: !3020, line: 35, type: !86)
!3111 = !DILocalVariable(name: "diff", scope: !3107, file: !3020, line: 36, type: !87)
!3112 = !DILocation(line: 37, column: 30, scope: !3107)
!3113 = !DILocation(line: 37, column: 59, scope: !3107)
!3114 = !DILocation(line: 37, column: 57, scope: !3107)
!3115 = !DILocation(line: 37, column: 5, scope: !3107)
!3116 = distinct !DISubprogram(name: "m_extract_element", scope: !2795, file: !2795, line: 16, type: !3117, scopeLine: 16, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3117 = !DISubroutineType(types: !3118)
!3118 = !{!51, !411, !86}
!3119 = !DILocalVariable(name: "in", arg: 1, scope: !3116, file: !2795, line: 16, type: !411)
!3120 = !DILocation(line: 0, scope: !3116)
!3121 = !DILocalVariable(name: "index", arg: 2, scope: !3116, file: !2795, line: 16, type: !86)
!3122 = !DILocation(line: 17, column: 27, scope: !3116)
!3123 = !DILocalVariable(name: "leg", scope: !3116, file: !2795, line: 17, type: !324)
!3124 = !DILocation(line: 18, column: 30, scope: !3116)
!3125 = !DILocalVariable(name: "offset", scope: !3116, file: !2795, line: 18, type: !324)
!3126 = !DILocation(line: 20, column: 13, scope: !3116)
!3127 = !DILocation(line: 20, column: 31, scope: !3116)
!3128 = !DILocation(line: 20, column: 21, scope: !3116)
!3129 = !DILocation(line: 20, column: 12, scope: !3116)
!3130 = !DILocation(line: 20, column: 5, scope: !3116)
!3131 = distinct !DISubprogram(name: "inverse_f", scope: !577, file: !577, line: 57, type: !3132, scopeLine: 57, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3132 = !DISubroutineType(types: !3133)
!3133 = !{!51, !51}
!3134 = !DILocalVariable(name: "a", arg: 1, scope: !3131, file: !577, line: 57, type: !51)
!3135 = !DILocation(line: 0, scope: !3131)
!3136 = !DILocation(line: 61, column: 24, scope: !3131)
!3137 = !DILocalVariable(name: "a2", scope: !3131, file: !577, line: 61, type: !51)
!3138 = !DILocation(line: 62, column: 24, scope: !3131)
!3139 = !DILocalVariable(name: "a4", scope: !3131, file: !577, line: 62, type: !51)
!3140 = !DILocation(line: 63, column: 24, scope: !3131)
!3141 = !DILocalVariable(name: "a8", scope: !3131, file: !577, line: 63, type: !51)
!3142 = !DILocation(line: 64, column: 24, scope: !3131)
!3143 = !DILocalVariable(name: "a6", scope: !3131, file: !577, line: 64, type: !51)
!3144 = !DILocation(line: 65, column: 25, scope: !3131)
!3145 = !DILocalVariable(name: "a14", scope: !3131, file: !577, line: 65, type: !51)
!3146 = !DILocation(line: 67, column: 5, scope: !3131)
!3147 = distinct !DISubprogram(name: "vec_mul_add_u64", scope: !3020, file: !3020, line: 94, type: !3148, scopeLine: 94, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3148 = !DISubroutineType(types: !3149)
!3149 = !{null, !324, !411, !51, !52}
!3150 = !DILocalVariable(name: "legs", arg: 1, scope: !3147, file: !3020, line: 94, type: !324)
!3151 = !DILocation(line: 0, scope: !3147)
!3152 = !DILocalVariable(name: "in", arg: 2, scope: !3147, file: !3020, line: 94, type: !411)
!3153 = !DILocalVariable(name: "a", arg: 3, scope: !3147, file: !3020, line: 94, type: !51)
!3154 = !DILocalVariable(name: "acc", arg: 4, scope: !3147, file: !3020, line: 94, type: !52)
!3155 = !DILocation(line: 95, column: 20, scope: !3147)
!3156 = !DILocalVariable(name: "tab", scope: !3147, file: !3020, line: 95, type: !62)
!3157 = !DILocalVariable(name: "lsb_ask", scope: !3147, file: !3020, line: 97, type: !53)
!3158 = !DILocalVariable(name: "i", scope: !3159, file: !3020, line: 99, type: !86)
!3159 = distinct !DILexicalBlock(scope: !3147, file: !3020, line: 99, column: 5)
!3160 = !DILocation(line: 0, scope: !3159)
!3161 = !DILocation(line: 99, column: 9, scope: !3159)
!3162 = !DILocation(line: 99, scope: !3159)
!3163 = !DILocation(line: 99, column: 20, scope: !3164)
!3164 = distinct !DILexicalBlock(scope: !3159, file: !3020, line: 99, column: 5)
!3165 = !DILocation(line: 99, column: 5, scope: !3159)
!3166 = !DILocation(line: 100, column: 21, scope: !3167)
!3167 = distinct !DILexicalBlock(scope: !3164, file: !3020, line: 99, column: 32)
!3168 = !DILocation(line: 100, column: 33, scope: !3167)
!3169 = !DILocation(line: 100, column: 51, scope: !3167)
!3170 = !DILocation(line: 100, column: 46, scope: !3167)
!3171 = !DILocation(line: 100, column: 44, scope: !3167)
!3172 = !DILocation(line: 101, column: 27, scope: !3167)
!3173 = !DILocation(line: 101, column: 33, scope: !3167)
!3174 = !DILocation(line: 101, column: 52, scope: !3167)
!3175 = !DILocation(line: 101, column: 59, scope: !3167)
!3176 = !DILocation(line: 101, column: 46, scope: !3167)
!3177 = !DILocation(line: 101, column: 44, scope: !3167)
!3178 = !DILocation(line: 101, column: 17, scope: !3167)
!3179 = !DILocation(line: 102, column: 21, scope: !3167)
!3180 = !DILocation(line: 102, column: 27, scope: !3167)
!3181 = !DILocation(line: 102, column: 33, scope: !3167)
!3182 = !DILocation(line: 102, column: 52, scope: !3167)
!3183 = !DILocation(line: 102, column: 59, scope: !3167)
!3184 = !DILocation(line: 102, column: 46, scope: !3167)
!3185 = !DILocation(line: 102, column: 44, scope: !3167)
!3186 = !DILocation(line: 102, column: 17, scope: !3167)
!3187 = !DILocation(line: 103, column: 21, scope: !3167)
!3188 = !DILocation(line: 103, column: 27, scope: !3167)
!3189 = !DILocation(line: 103, column: 33, scope: !3167)
!3190 = !DILocation(line: 103, column: 52, scope: !3167)
!3191 = !DILocation(line: 103, column: 59, scope: !3167)
!3192 = !DILocation(line: 103, column: 46, scope: !3167)
!3193 = !DILocation(line: 103, column: 44, scope: !3167)
!3194 = !DILocation(line: 103, column: 17, scope: !3167)
!3195 = !DILocation(line: 100, column: 9, scope: !3167)
!3196 = !DILocation(line: 100, column: 16, scope: !3167)
!3197 = !DILocation(line: 99, column: 29, scope: !3164)
!3198 = !DILocation(line: 99, column: 5, scope: !3164)
!3199 = distinct !{!3199, !3165, !3200, !388}
!3200 = !DILocation(line: 104, column: 5, scope: !3159)
!3201 = !DILocation(line: 105, column: 1, scope: !3147)
!3202 = distinct !DISubprogram(name: "ef_unpack_m_vec", scope: !2795, file: !2795, line: 44, type: !3203, scopeLine: 44, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3203 = !DISubroutineType(types: !3204)
!3204 = !{null, !86, !411, !61}
!3205 = !DILocalVariable(name: "legs", arg: 1, scope: !3202, file: !2795, line: 44, type: !86)
!3206 = !DILocation(line: 0, scope: !3202)
!3207 = !DILocalVariable(name: "in", arg: 2, scope: !3202, file: !2795, line: 44, type: !411)
!3208 = !DILocalVariable(name: "out", arg: 3, scope: !3202, file: !2795, line: 44, type: !61)
!3209 = !DILocalVariable(name: "in8", scope: !3202, file: !2795, line: 45, type: !90)
!3210 = !DILocalVariable(name: "i", scope: !3211, file: !2795, line: 46, type: !86)
!3211 = distinct !DILexicalBlock(scope: !3202, file: !2795, line: 46, column: 5)
!3212 = !DILocation(line: 0, scope: !3211)
!3213 = !DILocation(line: 46, column: 9, scope: !3211)
!3214 = !DILocation(line: 46, scope: !3211)
!3215 = !DILocation(line: 46, column: 29, scope: !3216)
!3216 = distinct !DILexicalBlock(scope: !3211, file: !2795, line: 46, column: 5)
!3217 = !DILocation(line: 46, column: 22, scope: !3216)
!3218 = !DILocation(line: 46, column: 5, scope: !3211)
!3219 = !DILocation(line: 51, column: 26, scope: !3220)
!3220 = distinct !DILexicalBlock(scope: !3216, file: !2795, line: 46, column: 42)
!3221 = !DILocation(line: 51, column: 21, scope: !3220)
!3222 = !DILocation(line: 51, column: 31, scope: !3220)
!3223 = !DILocation(line: 51, column: 9, scope: !3220)
!3224 = !DILocation(line: 51, column: 18, scope: !3220)
!3225 = !DILocation(line: 52, column: 26, scope: !3220)
!3226 = !DILocation(line: 52, column: 21, scope: !3220)
!3227 = !DILocation(line: 52, column: 30, scope: !3220)
!3228 = !DILocation(line: 52, column: 14, scope: !3220)
!3229 = !DILocation(line: 52, column: 9, scope: !3220)
!3230 = !DILocation(line: 52, column: 18, scope: !3220)
!3231 = !DILocation(line: 46, column: 37, scope: !3216)
!3232 = !DILocation(line: 46, column: 5, scope: !3216)
!3233 = distinct !{!3233, !3218, !3234, !388}
!3234 = !DILocation(line: 54, column: 5, scope: !3211)
!3235 = !DILocation(line: 55, column: 1, scope: !3202)
!3236 = distinct !DISubprogram(name: "mul_table", scope: !577, file: !577, line: 130, type: !578, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3237 = !DILocalVariable(name: "b", arg: 1, scope: !3236, file: !577, line: 130, type: !175)
!3238 = !DILocation(line: 0, scope: !3236)
!3239 = !DILocation(line: 131, column: 19, scope: !3236)
!3240 = !DILocation(line: 131, column: 33, scope: !3236)
!3241 = !DILocalVariable(name: "x", scope: !3236, file: !577, line: 131, type: !62)
!3242 = !DILocalVariable(name: "high_nibble_mask", scope: !3236, file: !577, line: 133, type: !62)
!3243 = !DILocation(line: 135, column: 28, scope: !3236)
!3244 = !DILocalVariable(name: "high_half", scope: !3236, file: !577, line: 135, type: !62)
!3245 = !DILocation(line: 136, column: 28, scope: !3236)
!3246 = !DILocation(line: 136, column: 47, scope: !3236)
!3247 = !DILocation(line: 136, column: 34, scope: !3236)
!3248 = !DILocation(line: 136, column: 5, scope: !3236)
!3249 = distinct !DISubprogram(name: "mul_f", scope: !577, file: !577, line: 9, type: !1589, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3250 = !DILocalVariable(name: "a", arg: 1, scope: !3249, file: !577, line: 9, type: !51)
!3251 = !DILocation(line: 0, scope: !3249)
!3252 = !DILocalVariable(name: "b", arg: 2, scope: !3249, file: !577, line: 9, type: !51)
!3253 = !DILocation(line: 14, column: 10, scope: !3249)
!3254 = !DILocation(line: 14, column: 7, scope: !3249)
!3255 = !DILocation(line: 17, column: 17, scope: !3249)
!3256 = !DILocalVariable(name: "p", scope: !3249, file: !577, line: 11, type: !51)
!3257 = !DILocation(line: 18, column: 13, scope: !3249)
!3258 = !DILocation(line: 18, column: 17, scope: !3249)
!3259 = !DILocation(line: 18, column: 7, scope: !3249)
!3260 = !DILocation(line: 19, column: 13, scope: !3249)
!3261 = !DILocation(line: 19, column: 17, scope: !3249)
!3262 = !DILocation(line: 19, column: 7, scope: !3249)
!3263 = !DILocation(line: 20, column: 13, scope: !3249)
!3264 = !DILocation(line: 20, column: 17, scope: !3249)
!3265 = !DILocation(line: 20, column: 7, scope: !3249)
!3266 = !DILocalVariable(name: "top_p", scope: !3249, file: !577, line: 23, type: !51)
!3267 = !DILocation(line: 24, column: 37, scope: !3249)
!3268 = !DILocation(line: 24, column: 52, scope: !3249)
!3269 = !DILocation(line: 24, column: 43, scope: !3249)
!3270 = !DILocation(line: 24, column: 59, scope: !3249)
!3271 = !DILocalVariable(name: "out", scope: !3249, file: !577, line: 24, type: !51)
!3272 = !DILocation(line: 25, column: 5, scope: !3249)
!3273 = distinct !DISubprogram(name: "lincomb", scope: !577, file: !577, line: 70, type: !1597, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3274 = !DILocalVariable(name: "a", arg: 1, scope: !3273, file: !577, line: 70, type: !90)
!3275 = !DILocation(line: 0, scope: !3273)
!3276 = !DILocalVariable(name: "b", arg: 2, scope: !3273, file: !577, line: 71, type: !90)
!3277 = !DILocalVariable(name: "n", arg: 3, scope: !3273, file: !577, line: 71, type: !86)
!3278 = !DILocalVariable(name: "m", arg: 4, scope: !3273, file: !577, line: 71, type: !86)
!3279 = !DILocalVariable(name: "ret", scope: !3273, file: !577, line: 72, type: !51)
!3280 = !DILocalVariable(name: "i", scope: !3281, file: !577, line: 73, type: !86)
!3281 = distinct !DILexicalBlock(scope: !3273, file: !577, line: 73, column: 5)
!3282 = !DILocation(line: 0, scope: !3281)
!3283 = !DILocation(line: 73, column: 10, scope: !3281)
!3284 = !DILocation(line: 73, scope: !3281)
!3285 = !DILocation(line: 73, column: 23, scope: !3286)
!3286 = distinct !DILexicalBlock(scope: !3281, file: !577, line: 73, column: 5)
!3287 = !DILocation(line: 73, column: 5, scope: !3281)
!3288 = !DILocation(line: 74, column: 27, scope: !3289)
!3289 = distinct !DILexicalBlock(scope: !3286, file: !577, line: 73, column: 41)
!3290 = !DILocation(line: 74, column: 33, scope: !3289)
!3291 = !DILocation(line: 74, column: 21, scope: !3289)
!3292 = !DILocation(line: 74, column: 15, scope: !3289)
!3293 = !DILocation(line: 73, column: 28, scope: !3286)
!3294 = !DILocation(line: 73, column: 35, scope: !3286)
!3295 = !DILocation(line: 73, column: 5, scope: !3286)
!3296 = distinct !{!3296, !3287, !3297, !388}
!3297 = !DILocation(line: 75, column: 5, scope: !3281)
!3298 = !DILocation(line: 76, column: 5, scope: !3273)
!3299 = distinct !DISubprogram(name: "add_f", scope: !577, file: !577, line: 43, type: !1589, scopeLine: 43, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !84, retainedNodes: !71)
!3300 = !DILocalVariable(name: "a", arg: 1, scope: !3299, file: !577, line: 43, type: !51)
!3301 = !DILocation(line: 0, scope: !3299)
!3302 = !DILocalVariable(name: "b", arg: 2, scope: !3299, file: !577, line: 43, type: !51)
!3303 = !DILocation(line: 44, column: 14, scope: !3299)
!3304 = !DILocation(line: 44, column: 5, scope: !3299)
